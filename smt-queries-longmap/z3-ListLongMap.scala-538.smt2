; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13686 () Bool)

(assert start!13686)

(declare-fun b!126004 () Bool)

(declare-fun b_free!2845 () Bool)

(declare-fun b_next!2845 () Bool)

(assert (=> b!126004 (= b_free!2845 (not b_next!2845))))

(declare-fun tp!10942 () Bool)

(declare-fun b_and!7737 () Bool)

(assert (=> b!126004 (= tp!10942 b_and!7737)))

(declare-fun b!126008 () Bool)

(declare-fun b_free!2847 () Bool)

(declare-fun b_next!2847 () Bool)

(assert (=> b!126008 (= b_free!2847 (not b_next!2847))))

(declare-fun tp!10941 () Bool)

(declare-fun b_and!7739 () Bool)

(assert (=> b!126008 (= tp!10941 b_and!7739)))

(declare-fun b!125997 () Bool)

(declare-fun e!82305 () Bool)

(declare-fun tp_is_empty!2839 () Bool)

(assert (=> b!125997 (= e!82305 tp_is_empty!2839)))

(declare-fun b!125998 () Bool)

(declare-fun res!60955 () Bool)

(declare-fun e!82299 () Bool)

(assert (=> b!125998 (=> (not res!60955) (not e!82299))))

(declare-datatypes ((V!3433 0))(
  ( (V!3434 (val!1464 Int)) )
))
(declare-datatypes ((array!4675 0))(
  ( (array!4676 (arr!2212 (Array (_ BitVec 32) (_ BitVec 64))) (size!2477 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1076 0))(
  ( (ValueCellFull!1076 (v!3116 V!3433)) (EmptyCell!1076) )
))
(declare-datatypes ((array!4677 0))(
  ( (array!4678 (arr!2213 (Array (_ BitVec 32) ValueCell!1076)) (size!2478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1060 0))(
  ( (LongMapFixedSize!1061 (defaultEntry!2782 Int) (mask!7037 (_ BitVec 32)) (extraKeys!2563 (_ BitVec 32)) (zeroValue!2645 V!3433) (minValue!2645 V!3433) (_size!579 (_ BitVec 32)) (_keys!4514 array!4675) (_values!2765 array!4677) (_vacant!579 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!848 0))(
  ( (Cell!849 (v!3117 LongMapFixedSize!1060)) )
))
(declare-datatypes ((LongMap!848 0))(
  ( (LongMap!849 (underlying!435 Cell!848)) )
))
(declare-fun thiss!992 () LongMap!848)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!125998 (= res!60955 (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun mapNonEmpty!4493 () Bool)

(declare-fun mapRes!4493 () Bool)

(declare-fun tp!10943 () Bool)

(declare-fun e!82301 () Bool)

(assert (=> mapNonEmpty!4493 (= mapRes!4493 (and tp!10943 e!82301))))

(declare-fun mapRest!4494 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4493 () ValueCell!1076)

(declare-fun mapKey!4493 () (_ BitVec 32))

(assert (=> mapNonEmpty!4493 (= (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (store mapRest!4494 mapKey!4493 mapValue!4493))))

(declare-fun b!125999 () Bool)

(declare-fun res!60954 () Bool)

(declare-fun e!82303 () Bool)

(assert (=> b!125999 (=> (not res!60954) (not e!82303))))

(declare-fun newMap!16 () LongMapFixedSize!1060)

(declare-fun valid!509 (LongMapFixedSize!1060) Bool)

(assert (=> b!125999 (= res!60954 (valid!509 newMap!16))))

(declare-fun b!126000 () Bool)

(assert (=> b!126000 (= e!82299 (and (= (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7037 (v!3117 (underlying!435 thiss!992))))) (not (= (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126001 () Bool)

(declare-fun e!82297 () Bool)

(assert (=> b!126001 (= e!82297 tp_is_empty!2839)))

(declare-fun b!126002 () Bool)

(declare-fun e!82293 () Bool)

(declare-fun e!82292 () Bool)

(assert (=> b!126002 (= e!82293 (and e!82292 mapRes!4493))))

(declare-fun condMapEmpty!4493 () Bool)

(declare-fun mapDefault!4494 () ValueCell!1076)

(assert (=> b!126002 (= condMapEmpty!4493 (= (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4494)))))

(declare-fun b!126003 () Bool)

(declare-fun e!82302 () Bool)

(declare-fun mapRes!4494 () Bool)

(assert (=> b!126003 (= e!82302 (and e!82305 mapRes!4494))))

(declare-fun condMapEmpty!4494 () Bool)

(declare-fun mapDefault!4493 () ValueCell!1076)

(assert (=> b!126003 (= condMapEmpty!4494 (= (arr!2213 (_values!2765 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4493)))))

(declare-fun mapIsEmpty!4494 () Bool)

(assert (=> mapIsEmpty!4494 mapRes!4494))

(declare-fun e!82295 () Bool)

(declare-fun array_inv!1407 (array!4675) Bool)

(declare-fun array_inv!1408 (array!4677) Bool)

(assert (=> b!126004 (= e!82295 (and tp!10942 tp_is_empty!2839 (array_inv!1407 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (array_inv!1408 (_values!2765 (v!3117 (underlying!435 thiss!992)))) e!82293))))

(declare-fun b!126005 () Bool)

(declare-fun e!82300 () Bool)

(assert (=> b!126005 (= e!82300 e!82299)))

(declare-fun res!60957 () Bool)

(assert (=> b!126005 (=> (not res!60957) (not e!82299))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2542 0))(
  ( (tuple2!2543 (_1!1282 (_ BitVec 64)) (_2!1282 V!3433)) )
))
(declare-datatypes ((List!1692 0))(
  ( (Nil!1689) (Cons!1688 (h!2290 tuple2!2542) (t!6030 List!1692)) )
))
(declare-datatypes ((ListLongMap!1647 0))(
  ( (ListLongMap!1648 (toList!839 List!1692)) )
))
(declare-fun lt!64938 () ListLongMap!1647)

(declare-fun contains!867 (ListLongMap!1647 (_ BitVec 64)) Bool)

(assert (=> b!126005 (= res!60957 (contains!867 lt!64938 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2544 0))(
  ( (tuple2!2545 (_1!1283 Bool) (_2!1283 LongMapFixedSize!1060)) )
))
(declare-fun lt!64940 () tuple2!2544)

(declare-fun update!183 (LongMapFixedSize!1060 (_ BitVec 64) V!3433) tuple2!2544)

(declare-fun get!1442 (ValueCell!1076 V!3433) V!3433)

(declare-fun dynLambda!409 (Int (_ BitVec 64)) V!3433)

(assert (=> b!126005 (= lt!64940 (update!183 newMap!16 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126006 () Bool)

(declare-fun e!82298 () Bool)

(declare-fun e!82294 () Bool)

(assert (=> b!126006 (= e!82298 e!82294)))

(declare-fun b!126007 () Bool)

(declare-fun res!60956 () Bool)

(assert (=> b!126007 (=> (not res!60956) (not e!82303))))

(assert (=> b!126007 (= res!60956 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun mapNonEmpty!4494 () Bool)

(declare-fun tp!10944 () Bool)

(assert (=> mapNonEmpty!4494 (= mapRes!4494 (and tp!10944 e!82297))))

(declare-fun mapValue!4494 () ValueCell!1076)

(declare-fun mapKey!4494 () (_ BitVec 32))

(declare-fun mapRest!4493 () (Array (_ BitVec 32) ValueCell!1076))

(assert (=> mapNonEmpty!4494 (= (arr!2213 (_values!2765 newMap!16)) (store mapRest!4493 mapKey!4494 mapValue!4494))))

(declare-fun e!82304 () Bool)

(assert (=> b!126008 (= e!82304 (and tp!10941 tp_is_empty!2839 (array_inv!1407 (_keys!4514 newMap!16)) (array_inv!1408 (_values!2765 newMap!16)) e!82302))))

(declare-fun mapIsEmpty!4493 () Bool)

(assert (=> mapIsEmpty!4493 mapRes!4493))

(declare-fun res!60952 () Bool)

(assert (=> start!13686 (=> (not res!60952) (not e!82303))))

(declare-fun valid!510 (LongMap!848) Bool)

(assert (=> start!13686 (= res!60952 (valid!510 thiss!992))))

(assert (=> start!13686 e!82303))

(assert (=> start!13686 e!82298))

(assert (=> start!13686 true))

(assert (=> start!13686 e!82304))

(declare-fun b!126009 () Bool)

(assert (=> b!126009 (= e!82294 e!82295)))

(declare-fun b!126010 () Bool)

(declare-fun res!60951 () Bool)

(assert (=> b!126010 (=> (not res!60951) (not e!82303))))

(assert (=> b!126010 (= res!60951 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7037 newMap!16)) (_size!579 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126011 () Bool)

(assert (=> b!126011 (= e!82292 tp_is_empty!2839)))

(declare-fun b!126012 () Bool)

(assert (=> b!126012 (= e!82303 e!82300)))

(declare-fun res!60953 () Bool)

(assert (=> b!126012 (=> (not res!60953) (not e!82300))))

(declare-fun lt!64939 () ListLongMap!1647)

(assert (=> b!126012 (= res!60953 (and (= lt!64939 lt!64938) (not (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1369 (LongMapFixedSize!1060) ListLongMap!1647)

(assert (=> b!126012 (= lt!64938 (map!1369 newMap!16))))

(declare-fun getCurrentListMap!509 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> b!126012 (= lt!64939 (getCurrentListMap!509 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126013 () Bool)

(assert (=> b!126013 (= e!82301 tp_is_empty!2839)))

(assert (= (and start!13686 res!60952) b!126007))

(assert (= (and b!126007 res!60956) b!125999))

(assert (= (and b!125999 res!60954) b!126010))

(assert (= (and b!126010 res!60951) b!126012))

(assert (= (and b!126012 res!60953) b!126005))

(assert (= (and b!126005 res!60957) b!125998))

(assert (= (and b!125998 res!60955) b!126000))

(assert (= (and b!126002 condMapEmpty!4493) mapIsEmpty!4493))

(assert (= (and b!126002 (not condMapEmpty!4493)) mapNonEmpty!4493))

(get-info :version)

(assert (= (and mapNonEmpty!4493 ((_ is ValueCellFull!1076) mapValue!4493)) b!126013))

(assert (= (and b!126002 ((_ is ValueCellFull!1076) mapDefault!4494)) b!126011))

(assert (= b!126004 b!126002))

(assert (= b!126009 b!126004))

(assert (= b!126006 b!126009))

(assert (= start!13686 b!126006))

(assert (= (and b!126003 condMapEmpty!4494) mapIsEmpty!4494))

(assert (= (and b!126003 (not condMapEmpty!4494)) mapNonEmpty!4494))

(assert (= (and mapNonEmpty!4494 ((_ is ValueCellFull!1076) mapValue!4494)) b!126001))

(assert (= (and b!126003 ((_ is ValueCellFull!1076) mapDefault!4493)) b!125997))

(assert (= b!126008 b!126003))

(assert (= start!13686 b!126008))

(declare-fun b_lambda!5545 () Bool)

(assert (=> (not b_lambda!5545) (not b!126005)))

(declare-fun t!6027 () Bool)

(declare-fun tb!2301 () Bool)

(assert (=> (and b!126004 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))) t!6027) tb!2301))

(declare-fun result!3823 () Bool)

(assert (=> tb!2301 (= result!3823 tp_is_empty!2839)))

(assert (=> b!126005 t!6027))

(declare-fun b_and!7741 () Bool)

(assert (= b_and!7737 (and (=> t!6027 result!3823) b_and!7741)))

(declare-fun t!6029 () Bool)

(declare-fun tb!2303 () Bool)

(assert (=> (and b!126008 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))) t!6029) tb!2303))

(declare-fun result!3827 () Bool)

(assert (= result!3827 result!3823))

(assert (=> b!126005 t!6029))

(declare-fun b_and!7743 () Bool)

(assert (= b_and!7739 (and (=> t!6029 result!3827) b_and!7743)))

(declare-fun m!146811 () Bool)

(assert (=> b!126012 m!146811))

(declare-fun m!146813 () Bool)

(assert (=> b!126012 m!146813))

(declare-fun m!146815 () Bool)

(assert (=> b!126012 m!146815))

(declare-fun m!146817 () Bool)

(assert (=> b!125998 m!146817))

(declare-fun m!146819 () Bool)

(assert (=> start!13686 m!146819))

(declare-fun m!146821 () Bool)

(assert (=> b!126004 m!146821))

(declare-fun m!146823 () Bool)

(assert (=> b!126004 m!146823))

(declare-fun m!146825 () Bool)

(assert (=> mapNonEmpty!4493 m!146825))

(declare-fun m!146827 () Bool)

(assert (=> b!126005 m!146827))

(declare-fun m!146829 () Bool)

(assert (=> b!126005 m!146829))

(declare-fun m!146831 () Bool)

(assert (=> b!126005 m!146831))

(assert (=> b!126005 m!146811))

(declare-fun m!146833 () Bool)

(assert (=> b!126005 m!146833))

(assert (=> b!126005 m!146811))

(assert (=> b!126005 m!146829))

(assert (=> b!126005 m!146811))

(assert (=> b!126005 m!146831))

(declare-fun m!146835 () Bool)

(assert (=> b!126005 m!146835))

(assert (=> b!126005 m!146827))

(declare-fun m!146837 () Bool)

(assert (=> b!126008 m!146837))

(declare-fun m!146839 () Bool)

(assert (=> b!126008 m!146839))

(declare-fun m!146841 () Bool)

(assert (=> mapNonEmpty!4494 m!146841))

(declare-fun m!146843 () Bool)

(assert (=> b!125999 m!146843))

(check-sat (not b!125998) (not b_next!2845) (not b_next!2847) (not b!126004) b_and!7741 (not b_lambda!5545) (not b!126005) (not mapNonEmpty!4494) (not b!126008) tp_is_empty!2839 (not mapNonEmpty!4493) (not b!125999) (not start!13686) (not b!126012) b_and!7743)
(check-sat b_and!7741 b_and!7743 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun b_lambda!5551 () Bool)

(assert (= b_lambda!5545 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5551)))

(check-sat (not b!125998) (not b_next!2845) (not b_next!2847) (not b!126004) b_and!7741 (not b!126005) (not mapNonEmpty!4494) (not b!126008) tp_is_empty!2839 (not mapNonEmpty!4493) (not b_lambda!5551) (not b!125999) (not start!13686) (not b!126012) b_and!7743)
(check-sat b_and!7741 b_and!7743 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun d!38023 () Bool)

(declare-fun res!61006 () Bool)

(declare-fun e!82399 () Bool)

(assert (=> d!38023 (=> (not res!61006) (not e!82399))))

(declare-fun simpleValid!87 (LongMapFixedSize!1060) Bool)

(assert (=> d!38023 (= res!61006 (simpleValid!87 newMap!16))))

(assert (=> d!38023 (= (valid!509 newMap!16) e!82399)))

(declare-fun b!126128 () Bool)

(declare-fun res!61007 () Bool)

(assert (=> b!126128 (=> (not res!61007) (not e!82399))))

(declare-fun arrayCountValidKeys!0 (array!4675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!126128 (= res!61007 (= (arrayCountValidKeys!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (_size!579 newMap!16)))))

(declare-fun b!126129 () Bool)

(declare-fun res!61008 () Bool)

(assert (=> b!126129 (=> (not res!61008) (not e!82399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4675 (_ BitVec 32)) Bool)

(assert (=> b!126129 (= res!61008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!126130 () Bool)

(declare-datatypes ((List!1694 0))(
  ( (Nil!1691) (Cons!1690 (h!2292 (_ BitVec 64)) (t!6040 List!1694)) )
))
(declare-fun arrayNoDuplicates!0 (array!4675 (_ BitVec 32) List!1694) Bool)

(assert (=> b!126130 (= e!82399 (arrayNoDuplicates!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 Nil!1691))))

(assert (= (and d!38023 res!61006) b!126128))

(assert (= (and b!126128 res!61007) b!126129))

(assert (= (and b!126129 res!61008) b!126130))

(declare-fun m!146913 () Bool)

(assert (=> d!38023 m!146913))

(declare-fun m!146915 () Bool)

(assert (=> b!126128 m!146915))

(declare-fun m!146917 () Bool)

(assert (=> b!126129 m!146917))

(declare-fun m!146919 () Bool)

(assert (=> b!126130 m!146919))

(assert (=> b!125999 d!38023))

(declare-fun d!38025 () Bool)

(assert (=> d!38025 (= (array_inv!1407 (_keys!4514 newMap!16)) (bvsge (size!2477 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126008 d!38025))

(declare-fun d!38027 () Bool)

(assert (=> d!38027 (= (array_inv!1408 (_values!2765 newMap!16)) (bvsge (size!2478 (_values!2765 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126008 d!38027))

(declare-fun d!38029 () Bool)

(assert (=> d!38029 (= (array_inv!1407 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvsge (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!126004 d!38029))

(declare-fun d!38031 () Bool)

(assert (=> d!38031 (= (array_inv!1408 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvsge (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!126004 d!38031))

(declare-fun d!38033 () Bool)

(assert (=> d!38033 (= (valid!510 thiss!992) (valid!509 (v!3117 (underlying!435 thiss!992))))))

(declare-fun bs!5216 () Bool)

(assert (= bs!5216 d!38033))

(declare-fun m!146921 () Bool)

(assert (=> bs!5216 m!146921))

(assert (=> start!13686 d!38033))

(declare-fun d!38035 () Bool)

(assert (=> d!38035 (= (map!1369 newMap!16) (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bs!5217 () Bool)

(assert (= bs!5217 d!38035))

(declare-fun m!146923 () Bool)

(assert (=> bs!5217 m!146923))

(assert (=> b!126012 d!38035))

(declare-fun b!126173 () Bool)

(declare-fun e!82432 () ListLongMap!1647)

(declare-fun call!13513 () ListLongMap!1647)

(assert (=> b!126173 (= e!82432 call!13513)))

(declare-fun b!126174 () Bool)

(declare-fun e!82427 () Bool)

(declare-fun lt!65010 () ListLongMap!1647)

(declare-fun apply!111 (ListLongMap!1647 (_ BitVec 64)) V!3433)

(assert (=> b!126174 (= e!82427 (= (apply!111 lt!65010 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126175 () Bool)

(declare-fun e!82434 () Bool)

(assert (=> b!126175 (= e!82434 (= (apply!111 lt!65010 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126176 () Bool)

(declare-fun e!82438 () ListLongMap!1647)

(declare-fun e!82437 () ListLongMap!1647)

(assert (=> b!126176 (= e!82438 e!82437)))

(declare-fun c!23041 () Bool)

(assert (=> b!126176 (= c!23041 (and (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13508 () Bool)

(declare-fun call!13515 () ListLongMap!1647)

(assert (=> bm!13508 (= call!13513 call!13515)))

(declare-fun b!126177 () Bool)

(declare-fun res!61027 () Bool)

(declare-fun e!82430 () Bool)

(assert (=> b!126177 (=> (not res!61027) (not e!82430))))

(declare-fun e!82428 () Bool)

(assert (=> b!126177 (= res!61027 e!82428)))

(declare-fun res!61031 () Bool)

(assert (=> b!126177 (=> res!61031 e!82428)))

(declare-fun e!82435 () Bool)

(assert (=> b!126177 (= res!61031 (not e!82435))))

(declare-fun res!61033 () Bool)

(assert (=> b!126177 (=> (not res!61033) (not e!82435))))

(assert (=> b!126177 (= res!61033 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun bm!13509 () Bool)

(declare-fun call!13511 () ListLongMap!1647)

(declare-fun call!13516 () ListLongMap!1647)

(assert (=> bm!13509 (= call!13511 call!13516)))

(declare-fun b!126178 () Bool)

(declare-fun e!82429 () Bool)

(assert (=> b!126178 (= e!82429 e!82427)))

(declare-fun res!61032 () Bool)

(declare-fun call!13514 () Bool)

(assert (=> b!126178 (= res!61032 call!13514)))

(assert (=> b!126178 (=> (not res!61032) (not e!82427))))

(declare-fun bm!13510 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!123 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> bm!13510 (= call!13516 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126179 () Bool)

(declare-fun e!82426 () Bool)

(assert (=> b!126179 (= e!82428 e!82426)))

(declare-fun res!61030 () Bool)

(assert (=> b!126179 (=> (not res!61030) (not e!82426))))

(assert (=> b!126179 (= res!61030 (contains!867 lt!65010 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126179 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126180 () Bool)

(declare-datatypes ((Unit!3922 0))(
  ( (Unit!3923) )
))
(declare-fun e!82431 () Unit!3922)

(declare-fun Unit!3924 () Unit!3922)

(assert (=> b!126180 (= e!82431 Unit!3924)))

(declare-fun bm!13511 () Bool)

(declare-fun call!13517 () Bool)

(assert (=> bm!13511 (= call!13517 (contains!867 lt!65010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126181 () Bool)

(declare-fun e!82436 () Bool)

(assert (=> b!126181 (= e!82436 e!82434)))

(declare-fun res!61028 () Bool)

(assert (=> b!126181 (= res!61028 call!13517)))

(assert (=> b!126181 (=> (not res!61028) (not e!82434))))

(declare-fun b!126182 () Bool)

(declare-fun c!23044 () Bool)

(assert (=> b!126182 (= c!23044 (and (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126182 (= e!82437 e!82432)))

(declare-fun b!126183 () Bool)

(declare-fun e!82433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!126183 (= e!82433 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!38037 () Bool)

(assert (=> d!38037 e!82430))

(declare-fun res!61034 () Bool)

(assert (=> d!38037 (=> (not res!61034) (not e!82430))))

(assert (=> d!38037 (= res!61034 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun lt!65007 () ListLongMap!1647)

(assert (=> d!38037 (= lt!65010 lt!65007)))

(declare-fun lt!65017 () Unit!3922)

(assert (=> d!38037 (= lt!65017 e!82431)))

(declare-fun c!23042 () Bool)

(assert (=> d!38037 (= c!23042 e!82433)))

(declare-fun res!61035 () Bool)

(assert (=> d!38037 (=> (not res!61035) (not e!82433))))

(assert (=> d!38037 (= res!61035 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38037 (= lt!65007 e!82438)))

(declare-fun c!23043 () Bool)

(assert (=> d!38037 (= c!23043 (and (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38037 (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992))))))

(assert (=> d!38037 (= (getCurrentListMap!509 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))) lt!65010)))

(declare-fun b!126184 () Bool)

(assert (=> b!126184 (= e!82426 (= (apply!111 lt!65010 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126184 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> b!126184 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126185 () Bool)

(assert (=> b!126185 (= e!82435 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126186 () Bool)

(assert (=> b!126186 (= e!82437 call!13513)))

(declare-fun b!126187 () Bool)

(declare-fun lt!65011 () Unit!3922)

(assert (=> b!126187 (= e!82431 lt!65011)))

(declare-fun lt!65006 () ListLongMap!1647)

(assert (=> b!126187 (= lt!65006 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun lt!65019 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65016 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65016 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65024 () Unit!3922)

(declare-fun addStillContains!87 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> b!126187 (= lt!65024 (addStillContains!87 lt!65006 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65016))))

(declare-fun +!158 (ListLongMap!1647 tuple2!2542) ListLongMap!1647)

(assert (=> b!126187 (contains!867 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65016)))

(declare-fun lt!65023 () Unit!3922)

(assert (=> b!126187 (= lt!65023 lt!65024)))

(declare-fun lt!65021 () ListLongMap!1647)

(assert (=> b!126187 (= lt!65021 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun lt!65014 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65014 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65013 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65013 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65018 () Unit!3922)

(declare-fun addApplyDifferent!87 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> b!126187 (= lt!65018 (addApplyDifferent!87 lt!65021 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65013))))

(assert (=> b!126187 (= (apply!111 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65013) (apply!111 lt!65021 lt!65013))))

(declare-fun lt!65012 () Unit!3922)

(assert (=> b!126187 (= lt!65012 lt!65018)))

(declare-fun lt!65005 () ListLongMap!1647)

(assert (=> b!126187 (= lt!65005 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun lt!65003 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65008 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65008 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65009 () Unit!3922)

(assert (=> b!126187 (= lt!65009 (addApplyDifferent!87 lt!65005 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65008))))

(assert (=> b!126187 (= (apply!111 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65008) (apply!111 lt!65005 lt!65008))))

(declare-fun lt!65022 () Unit!3922)

(assert (=> b!126187 (= lt!65022 lt!65009)))

(declare-fun lt!65020 () ListLongMap!1647)

(assert (=> b!126187 (= lt!65020 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun lt!65004 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65015 () (_ BitVec 64))

(assert (=> b!126187 (= lt!65015 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!126187 (= lt!65011 (addApplyDifferent!87 lt!65020 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65015))))

(assert (=> b!126187 (= (apply!111 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65015) (apply!111 lt!65020 lt!65015))))

(declare-fun bm!13512 () Bool)

(declare-fun call!13512 () ListLongMap!1647)

(assert (=> bm!13512 (= call!13515 (+!158 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126188 () Bool)

(assert (=> b!126188 (= e!82432 call!13512)))

(declare-fun b!126189 () Bool)

(assert (=> b!126189 (= e!82438 (+!158 call!13515 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun bm!13513 () Bool)

(assert (=> bm!13513 (= call!13512 call!13511)))

(declare-fun bm!13514 () Bool)

(assert (=> bm!13514 (= call!13514 (contains!867 lt!65010 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126190 () Bool)

(assert (=> b!126190 (= e!82436 (not call!13517))))

(declare-fun b!126191 () Bool)

(assert (=> b!126191 (= e!82430 e!82429)))

(declare-fun c!23045 () Bool)

(assert (=> b!126191 (= c!23045 (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126192 () Bool)

(assert (=> b!126192 (= e!82429 (not call!13514))))

(declare-fun b!126193 () Bool)

(declare-fun res!61029 () Bool)

(assert (=> b!126193 (=> (not res!61029) (not e!82430))))

(assert (=> b!126193 (= res!61029 e!82436)))

(declare-fun c!23040 () Bool)

(assert (=> b!126193 (= c!23040 (not (= (bvand (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38037 c!23043) b!126189))

(assert (= (and d!38037 (not c!23043)) b!126176))

(assert (= (and b!126176 c!23041) b!126186))

(assert (= (and b!126176 (not c!23041)) b!126182))

(assert (= (and b!126182 c!23044) b!126173))

(assert (= (and b!126182 (not c!23044)) b!126188))

(assert (= (or b!126173 b!126188) bm!13513))

(assert (= (or b!126186 bm!13513) bm!13509))

(assert (= (or b!126186 b!126173) bm!13508))

(assert (= (or b!126189 bm!13509) bm!13510))

(assert (= (or b!126189 bm!13508) bm!13512))

(assert (= (and d!38037 res!61035) b!126183))

(assert (= (and d!38037 c!23042) b!126187))

(assert (= (and d!38037 (not c!23042)) b!126180))

(assert (= (and d!38037 res!61034) b!126177))

(assert (= (and b!126177 res!61033) b!126185))

(assert (= (and b!126177 (not res!61031)) b!126179))

(assert (= (and b!126179 res!61030) b!126184))

(assert (= (and b!126177 res!61027) b!126193))

(assert (= (and b!126193 c!23040) b!126181))

(assert (= (and b!126193 (not c!23040)) b!126190))

(assert (= (and b!126181 res!61028) b!126175))

(assert (= (or b!126181 b!126190) bm!13511))

(assert (= (and b!126193 res!61029) b!126191))

(assert (= (and b!126191 c!23045) b!126178))

(assert (= (and b!126191 (not c!23045)) b!126192))

(assert (= (and b!126178 res!61032) b!126174))

(assert (= (or b!126178 b!126192) bm!13514))

(declare-fun b_lambda!5553 () Bool)

(assert (=> (not b_lambda!5553) (not b!126184)))

(assert (=> b!126184 t!6027))

(declare-fun b_and!7761 () Bool)

(assert (= b_and!7741 (and (=> t!6027 result!3823) b_and!7761)))

(assert (=> b!126184 t!6029))

(declare-fun b_and!7763 () Bool)

(assert (= b_and!7743 (and (=> t!6029 result!3827) b_and!7763)))

(declare-fun m!146925 () Bool)

(assert (=> b!126187 m!146925))

(declare-fun m!146927 () Bool)

(assert (=> b!126187 m!146927))

(declare-fun m!146929 () Bool)

(assert (=> b!126187 m!146929))

(declare-fun m!146931 () Bool)

(assert (=> b!126187 m!146931))

(declare-fun m!146933 () Bool)

(assert (=> b!126187 m!146933))

(declare-fun m!146935 () Bool)

(assert (=> b!126187 m!146935))

(declare-fun m!146937 () Bool)

(assert (=> b!126187 m!146937))

(declare-fun m!146939 () Bool)

(assert (=> b!126187 m!146939))

(declare-fun m!146941 () Bool)

(assert (=> b!126187 m!146941))

(declare-fun m!146943 () Bool)

(assert (=> b!126187 m!146943))

(assert (=> b!126187 m!146935))

(declare-fun m!146945 () Bool)

(assert (=> b!126187 m!146945))

(assert (=> b!126187 m!146941))

(declare-fun m!146947 () Bool)

(assert (=> b!126187 m!146947))

(declare-fun m!146949 () Bool)

(assert (=> b!126187 m!146949))

(declare-fun m!146951 () Bool)

(assert (=> b!126187 m!146951))

(assert (=> b!126187 m!146929))

(declare-fun m!146953 () Bool)

(assert (=> b!126187 m!146953))

(assert (=> b!126187 m!146933))

(declare-fun m!146955 () Bool)

(assert (=> b!126187 m!146955))

(declare-fun m!146957 () Bool)

(assert (=> b!126187 m!146957))

(assert (=> b!126185 m!146957))

(assert (=> b!126185 m!146957))

(declare-fun m!146959 () Bool)

(assert (=> b!126185 m!146959))

(declare-fun m!146961 () Bool)

(assert (=> bm!13512 m!146961))

(declare-fun m!146963 () Bool)

(assert (=> b!126175 m!146963))

(assert (=> b!126184 m!146957))

(declare-fun m!146965 () Bool)

(assert (=> b!126184 m!146965))

(assert (=> b!126184 m!146957))

(declare-fun m!146967 () Bool)

(assert (=> b!126184 m!146967))

(assert (=> b!126184 m!146967))

(assert (=> b!126184 m!146829))

(declare-fun m!146969 () Bool)

(assert (=> b!126184 m!146969))

(assert (=> b!126184 m!146829))

(declare-fun m!146971 () Bool)

(assert (=> b!126174 m!146971))

(assert (=> bm!13510 m!146939))

(assert (=> b!126179 m!146957))

(assert (=> b!126179 m!146957))

(declare-fun m!146973 () Bool)

(assert (=> b!126179 m!146973))

(declare-fun m!146975 () Bool)

(assert (=> bm!13511 m!146975))

(declare-fun m!146977 () Bool)

(assert (=> b!126189 m!146977))

(declare-fun m!146979 () Bool)

(assert (=> bm!13514 m!146979))

(assert (=> b!126183 m!146957))

(assert (=> b!126183 m!146957))

(assert (=> b!126183 m!146959))

(assert (=> d!38037 m!146817))

(assert (=> b!126012 d!38037))

(declare-fun d!38039 () Bool)

(declare-fun e!82443 () Bool)

(assert (=> d!38039 e!82443))

(declare-fun res!61038 () Bool)

(assert (=> d!38039 (=> res!61038 e!82443)))

(declare-fun lt!65035 () Bool)

(assert (=> d!38039 (= res!61038 (not lt!65035))))

(declare-fun lt!65033 () Bool)

(assert (=> d!38039 (= lt!65035 lt!65033)))

(declare-fun lt!65036 () Unit!3922)

(declare-fun e!82444 () Unit!3922)

(assert (=> d!38039 (= lt!65036 e!82444)))

(declare-fun c!23048 () Bool)

(assert (=> d!38039 (= c!23048 lt!65033)))

(declare-fun containsKey!169 (List!1692 (_ BitVec 64)) Bool)

(assert (=> d!38039 (= lt!65033 (containsKey!169 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38039 (= (contains!867 lt!64938 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65035)))

(declare-fun b!126200 () Bool)

(declare-fun lt!65034 () Unit!3922)

(assert (=> b!126200 (= e!82444 lt!65034)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!118 (List!1692 (_ BitVec 64)) Unit!3922)

(assert (=> b!126200 (= lt!65034 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-datatypes ((Option!171 0))(
  ( (Some!170 (v!3122 V!3433)) (None!169) )
))
(declare-fun isDefined!119 (Option!171) Bool)

(declare-fun getValueByKey!165 (List!1692 (_ BitVec 64)) Option!171)

(assert (=> b!126200 (isDefined!119 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!126201 () Bool)

(declare-fun Unit!3925 () Unit!3922)

(assert (=> b!126201 (= e!82444 Unit!3925)))

(declare-fun b!126202 () Bool)

(assert (=> b!126202 (= e!82443 (isDefined!119 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (= (and d!38039 c!23048) b!126200))

(assert (= (and d!38039 (not c!23048)) b!126201))

(assert (= (and d!38039 (not res!61038)) b!126202))

(assert (=> d!38039 m!146811))

(declare-fun m!146981 () Bool)

(assert (=> d!38039 m!146981))

(assert (=> b!126200 m!146811))

(declare-fun m!146983 () Bool)

(assert (=> b!126200 m!146983))

(assert (=> b!126200 m!146811))

(declare-fun m!146985 () Bool)

(assert (=> b!126200 m!146985))

(assert (=> b!126200 m!146985))

(declare-fun m!146987 () Bool)

(assert (=> b!126200 m!146987))

(assert (=> b!126202 m!146811))

(assert (=> b!126202 m!146985))

(assert (=> b!126202 m!146985))

(assert (=> b!126202 m!146987))

(assert (=> b!126005 d!38039))

(declare-fun b!126287 () Bool)

(declare-fun e!82507 () Bool)

(declare-fun e!82494 () Bool)

(assert (=> b!126287 (= e!82507 e!82494)))

(declare-fun call!13571 () ListLongMap!1647)

(declare-fun res!61067 () Bool)

(assert (=> b!126287 (= res!61067 (contains!867 call!13571 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126287 (=> (not res!61067) (not e!82494))))

(declare-fun b!126288 () Bool)

(declare-fun e!82496 () Bool)

(declare-fun e!82490 () Bool)

(assert (=> b!126288 (= e!82496 e!82490)))

(declare-fun res!61076 () Bool)

(declare-fun call!13589 () Bool)

(assert (=> b!126288 (= res!61076 call!13589)))

(assert (=> b!126288 (=> (not res!61076) (not e!82490))))

(declare-fun call!13573 () ListLongMap!1647)

(declare-fun c!23089 () Bool)

(declare-fun bm!13563 () Bool)

(declare-fun c!23087 () Bool)

(declare-datatypes ((SeekEntryResult!273 0))(
  ( (MissingZero!273 (index!3247 (_ BitVec 32))) (Found!273 (index!3248 (_ BitVec 32))) (Intermediate!273 (undefined!1085 Bool) (index!3249 (_ BitVec 32)) (x!14965 (_ BitVec 32))) (Undefined!273) (MissingVacant!273 (index!3250 (_ BitVec 32))) )
))
(declare-fun lt!65101 () SeekEntryResult!273)

(declare-fun lt!65100 () (_ BitVec 32))

(assert (=> bm!13563 (= call!13573 (getCurrentListMap!509 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13564 () Bool)

(declare-fun lt!65108 () tuple2!2544)

(assert (=> bm!13564 (= call!13571 (map!1369 (_2!1283 lt!65108)))))

(declare-fun b!126289 () Bool)

(declare-fun e!82499 () Bool)

(declare-fun e!82506 () Bool)

(assert (=> b!126289 (= e!82499 e!82506)))

(declare-fun res!61071 () Bool)

(declare-fun call!13578 () Bool)

(assert (=> b!126289 (= res!61071 call!13578)))

(assert (=> b!126289 (=> (not res!61071) (not e!82506))))

(declare-fun bm!13565 () Bool)

(declare-fun call!13585 () Bool)

(declare-fun call!13583 () Bool)

(assert (=> bm!13565 (= call!13585 call!13583)))

(declare-fun b!126290 () Bool)

(declare-fun c!23090 () Bool)

(declare-fun lt!65114 () SeekEntryResult!273)

(assert (=> b!126290 (= c!23090 ((_ is MissingVacant!273) lt!65114))))

(declare-fun e!82503 () Bool)

(assert (=> b!126290 (= e!82503 e!82496)))

(declare-fun b!126291 () Bool)

(declare-fun call!13574 () ListLongMap!1647)

(assert (=> b!126291 (= e!82494 (= call!13571 (+!158 call!13574 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun call!13582 () ListLongMap!1647)

(declare-fun lt!65098 () array!4677)

(declare-fun c!23082 () Bool)

(declare-fun bm!13566 () Bool)

(declare-fun lt!65095 () (_ BitVec 32))

(assert (=> bm!13566 (= call!13582 (getCurrentListMap!509 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126292 () Bool)

(declare-fun call!13580 () Bool)

(assert (=> b!126292 (= e!82490 (not call!13580))))

(declare-fun bm!13567 () Bool)

(declare-fun call!13570 () ListLongMap!1647)

(declare-fun call!13568 () ListLongMap!1647)

(assert (=> bm!13567 (= call!13570 call!13568)))

(declare-fun b!126293 () Bool)

(declare-fun res!61077 () Bool)

(declare-fun e!82510 () Bool)

(assert (=> b!126293 (=> (not res!61077) (not e!82510))))

(assert (=> b!126293 (= res!61077 call!13578)))

(declare-fun e!82501 () Bool)

(assert (=> b!126293 (= e!82501 e!82510)))

(declare-fun c!23088 () Bool)

(declare-fun bm!13568 () Bool)

(declare-fun call!13576 () tuple2!2544)

(declare-fun updateHelperNewKey!56 (LongMapFixedSize!1060 (_ BitVec 64) V!3433 (_ BitVec 32)) tuple2!2544)

(assert (=> bm!13568 (= call!13576 (updateHelperNewKey!56 newMap!16 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(declare-fun bm!13569 () Bool)

(assert (=> bm!13569 (= call!13574 (map!1369 newMap!16))))

(declare-fun bm!13570 () Bool)

(declare-fun call!13572 () ListLongMap!1647)

(assert (=> bm!13570 (= call!13572 call!13582)))

(declare-fun b!126294 () Bool)

(declare-fun e!82502 () Bool)

(assert (=> b!126294 (= e!82502 (not call!13580))))

(declare-fun b!126295 () Bool)

(declare-fun e!82505 () ListLongMap!1647)

(declare-fun call!13567 () ListLongMap!1647)

(assert (=> b!126295 (= e!82505 call!13567)))

(declare-fun b!126296 () Bool)

(declare-fun lt!65107 () Unit!3922)

(declare-fun e!82493 () Unit!3922)

(assert (=> b!126296 (= lt!65107 e!82493)))

(declare-fun c!23077 () Bool)

(declare-fun call!13587 () Bool)

(assert (=> b!126296 (= c!23077 call!13587)))

(declare-fun e!82500 () tuple2!2544)

(assert (=> b!126296 (= e!82500 (tuple2!2545 false newMap!16))))

(declare-fun b!126297 () Bool)

(declare-fun res!61070 () Bool)

(declare-fun lt!65111 () SeekEntryResult!273)

(assert (=> b!126297 (= res!61070 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65111)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126297 (=> (not res!61070) (not e!82506))))

(declare-fun b!126298 () Bool)

(declare-fun res!61068 () Bool)

(assert (=> b!126298 (= res!61068 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126298 (=> (not res!61068) (not e!82490))))

(declare-fun bm!13571 () Bool)

(declare-fun call!13569 () Bool)

(declare-fun call!13584 () Bool)

(assert (=> bm!13571 (= call!13569 call!13584)))

(declare-fun bm!13572 () Bool)

(assert (=> bm!13572 (= call!13567 call!13582)))

(declare-fun b!126299 () Bool)

(declare-fun lt!65113 () tuple2!2544)

(assert (=> b!126299 (= lt!65113 call!13576)))

(declare-fun e!82497 () tuple2!2544)

(assert (=> b!126299 (= e!82497 (tuple2!2545 (_1!1283 lt!65113) (_2!1283 lt!65113)))))

(declare-fun bm!13573 () Bool)

(declare-fun call!13566 () SeekEntryResult!273)

(declare-fun call!13581 () SeekEntryResult!273)

(assert (=> bm!13573 (= call!13566 call!13581)))

(declare-fun b!126300 () Bool)

(declare-fun e!82492 () tuple2!2544)

(declare-fun lt!65105 () tuple2!2544)

(assert (=> b!126300 (= e!82492 (tuple2!2545 (_1!1283 lt!65105) (_2!1283 lt!65105)))))

(assert (=> b!126300 (= lt!65105 call!13576)))

(declare-fun e!82491 () ListLongMap!1647)

(declare-fun bm!13574 () Bool)

(assert (=> bm!13574 (= call!13568 (+!158 e!82491 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23080 () Bool)

(assert (=> bm!13574 (= c!23080 c!23087)))

(declare-fun b!126301 () Bool)

(declare-fun e!82509 () Unit!3922)

(declare-fun lt!65117 () Unit!3922)

(assert (=> b!126301 (= e!82509 lt!65117)))

(declare-fun call!13579 () Unit!3922)

(assert (=> b!126301 (= lt!65117 call!13579)))

(declare-fun lt!65106 () SeekEntryResult!273)

(declare-fun call!13588 () SeekEntryResult!273)

(assert (=> b!126301 (= lt!65106 call!13588)))

(declare-fun res!61074 () Bool)

(assert (=> b!126301 (= res!61074 ((_ is Found!273) lt!65106))))

(declare-fun e!82498 () Bool)

(assert (=> b!126301 (=> (not res!61074) (not e!82498))))

(assert (=> b!126301 e!82498))

(declare-fun b!126302 () Bool)

(assert (=> b!126302 (= c!23088 ((_ is MissingVacant!273) lt!65101))))

(assert (=> b!126302 (= e!82500 e!82492)))

(declare-fun b!126303 () Bool)

(assert (=> b!126303 (= e!82498 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65106)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun bm!13575 () Bool)

(assert (=> bm!13575 (= call!13588 call!13581)))

(declare-fun b!126304 () Bool)

(assert (=> b!126304 (= e!82492 e!82497)))

(declare-fun c!23081 () Bool)

(assert (=> b!126304 (= c!23081 ((_ is MissingZero!273) lt!65101))))

(declare-fun bm!13576 () Bool)

(declare-fun call!13577 () Unit!3922)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3922)

(assert (=> bm!13576 (= call!13577 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13577 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4675 (_ BitVec 32)) SeekEntryResult!273)

(assert (=> bm!13577 (= call!13581 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun bm!13578 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3922)

(assert (=> bm!13578 (= call!13579 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126305 () Bool)

(declare-fun c!23083 () Bool)

(assert (=> b!126305 (= c!23083 ((_ is MissingVacant!273) lt!65111))))

(assert (=> b!126305 (= e!82501 e!82499)))

(declare-fun bm!13579 () Bool)

(declare-fun call!13586 () ListLongMap!1647)

(assert (=> bm!13579 (= call!13586 call!13573)))

(declare-fun b!126306 () Bool)

(assert (=> b!126306 (= e!82491 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13580 () Bool)

(declare-fun c!23079 () Bool)

(assert (=> bm!13580 (= c!23079 c!23082)))

(assert (=> bm!13580 (= call!13587 (contains!867 e!82505 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun d!38041 () Bool)

(declare-fun e!82504 () Bool)

(assert (=> d!38041 e!82504))

(declare-fun res!61080 () Bool)

(assert (=> d!38041 (=> (not res!61080) (not e!82504))))

(assert (=> d!38041 (= res!61080 (valid!509 (_2!1283 lt!65108)))))

(declare-fun e!82508 () tuple2!2544)

(assert (=> d!38041 (= lt!65108 e!82508)))

(assert (=> d!38041 (= c!23087 (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvneg (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38041 (valid!509 newMap!16)))

(assert (=> d!38041 (= (update!183 newMap!16 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!65108)))

(declare-fun b!126307 () Bool)

(assert (=> b!126307 (= e!82491 (ite c!23089 call!13572 call!13586))))

(declare-fun bm!13581 () Bool)

(declare-fun arrayContainsKey!0 (array!4675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13581 (= call!13584 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!13582 () Bool)

(declare-fun call!13575 () Bool)

(assert (=> bm!13582 (= call!13578 call!13575)))

(declare-fun b!126308 () Bool)

(declare-fun res!61073 () Bool)

(assert (=> b!126308 (= res!61073 call!13575)))

(declare-fun e!82495 () Bool)

(assert (=> b!126308 (=> (not res!61073) (not e!82495))))

(declare-fun bm!13583 () Bool)

(assert (=> bm!13583 (= call!13575 call!13583)))

(declare-fun b!126309 () Bool)

(declare-fun e!82489 () tuple2!2544)

(assert (=> b!126309 (= e!82508 e!82489)))

(assert (=> b!126309 (= c!23089 (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126310 () Bool)

(declare-fun Unit!3926 () Unit!3922)

(assert (=> b!126310 (= e!82493 Unit!3926)))

(declare-fun lt!65091 () Unit!3922)

(assert (=> b!126310 (= lt!65091 call!13579)))

(declare-fun lt!65092 () SeekEntryResult!273)

(assert (=> b!126310 (= lt!65092 call!13566)))

(declare-fun res!61079 () Bool)

(assert (=> b!126310 (= res!61079 ((_ is Found!273) lt!65092))))

(assert (=> b!126310 (=> (not res!61079) (not e!82495))))

(assert (=> b!126310 e!82495))

(declare-fun lt!65103 () Unit!3922)

(assert (=> b!126310 (= lt!65103 lt!65091)))

(assert (=> b!126310 false))

(declare-fun bm!13584 () Bool)

(assert (=> bm!13584 (= call!13589 call!13585)))

(declare-fun b!126311 () Bool)

(declare-fun res!61069 () Bool)

(assert (=> b!126311 (=> (not res!61069) (not e!82502))))

(assert (=> b!126311 (= res!61069 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126312 () Bool)

(assert (=> b!126312 (= e!82496 ((_ is Undefined!273) lt!65114))))

(declare-fun bm!13585 () Bool)

(assert (=> bm!13585 (= call!13580 call!13584)))

(declare-fun bm!13586 () Bool)

(declare-fun c!23078 () Bool)

(declare-fun c!23086 () Bool)

(declare-fun c!23085 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13586 (= call!13583 (inRange!0 (ite c!23082 (ite c!23077 (index!3248 lt!65092) (ite c!23078 (index!3247 lt!65111) (index!3250 lt!65111))) (ite c!23085 (index!3248 lt!65106) (ite c!23086 (index!3247 lt!65114) (index!3250 lt!65114)))) (mask!7037 newMap!16)))))

(declare-fun b!126313 () Bool)

(declare-fun lt!65102 () Unit!3922)

(declare-fun lt!65109 () Unit!3922)

(assert (=> b!126313 (= lt!65102 lt!65109)))

(assert (=> b!126313 (= call!13570 call!13572)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3922)

(assert (=> b!126313 (= lt!65109 (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126313 (= lt!65095 (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!126313 (= e!82489 (tuple2!2545 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7037 newMap!16) (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!579 newMap!16) (_keys!4514 newMap!16) (_values!2765 newMap!16) (_vacant!579 newMap!16))))))

(declare-fun b!126314 () Bool)

(declare-fun res!61075 () Bool)

(assert (=> b!126314 (=> (not res!61075) (not e!82502))))

(assert (=> b!126314 (= res!61075 call!13589)))

(assert (=> b!126314 (= e!82503 e!82502)))

(declare-fun b!126315 () Bool)

(declare-fun res!61072 () Bool)

(assert (=> b!126315 (= res!61072 call!13585)))

(assert (=> b!126315 (=> (not res!61072) (not e!82498))))

(declare-fun b!126316 () Bool)

(assert (=> b!126316 (= e!82505 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126317 () Bool)

(assert (=> b!126317 (= e!82510 (not call!13569))))

(declare-fun b!126318 () Bool)

(declare-fun lt!65115 () Unit!3922)

(declare-fun lt!65112 () Unit!3922)

(assert (=> b!126318 (= lt!65115 lt!65112)))

(assert (=> b!126318 (contains!867 call!13567 (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!115 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) Unit!3922)

(assert (=> b!126318 (= lt!65112 (lemmaValidKeyInArrayIsInListMap!115 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126318 (= lt!65098 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))))

(declare-fun lt!65093 () Unit!3922)

(declare-fun lt!65104 () Unit!3922)

(assert (=> b!126318 (= lt!65093 lt!65104)))

(assert (=> b!126318 (= call!13568 call!13573)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3922)

(assert (=> b!126318 (= lt!65104 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65094 () Unit!3922)

(assert (=> b!126318 (= lt!65094 e!82509)))

(assert (=> b!126318 (= c!23085 call!13587)))

(assert (=> b!126318 (= e!82497 (tuple2!2545 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (_size!579 newMap!16) (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (_vacant!579 newMap!16))))))

(declare-fun b!126319 () Bool)

(assert (=> b!126319 (= e!82499 ((_ is Undefined!273) lt!65111))))

(declare-fun b!126320 () Bool)

(declare-fun lt!65097 () Unit!3922)

(assert (=> b!126320 (= e!82493 lt!65097)))

(assert (=> b!126320 (= lt!65097 call!13577)))

(assert (=> b!126320 (= lt!65111 call!13566)))

(assert (=> b!126320 (= c!23078 ((_ is MissingZero!273) lt!65111))))

(assert (=> b!126320 e!82501))

(declare-fun b!126321 () Bool)

(assert (=> b!126321 (= e!82507 (= call!13571 call!13574))))

(declare-fun b!126322 () Bool)

(assert (=> b!126322 (= e!82508 e!82500)))

(assert (=> b!126322 (= lt!65101 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(assert (=> b!126322 (= c!23082 ((_ is Undefined!273) lt!65101))))

(declare-fun b!126323 () Bool)

(declare-fun res!61078 () Bool)

(assert (=> b!126323 (=> (not res!61078) (not e!82510))))

(assert (=> b!126323 (= res!61078 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126324 () Bool)

(declare-fun lt!65096 () Unit!3922)

(declare-fun lt!65110 () Unit!3922)

(assert (=> b!126324 (= lt!65096 lt!65110)))

(assert (=> b!126324 (= call!13570 call!13586)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!56 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3922)

(assert (=> b!126324 (= lt!65110 (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65100 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126324 (= lt!65100 (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!126324 (= e!82489 (tuple2!2545 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7037 newMap!16) (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (_size!579 newMap!16) (_keys!4514 newMap!16) (_values!2765 newMap!16) (_vacant!579 newMap!16))))))

(declare-fun b!126325 () Bool)

(declare-fun Unit!3927 () Unit!3922)

(assert (=> b!126325 (= e!82509 Unit!3927)))

(declare-fun lt!65116 () Unit!3922)

(assert (=> b!126325 (= lt!65116 call!13577)))

(assert (=> b!126325 (= lt!65114 call!13588)))

(assert (=> b!126325 (= c!23086 ((_ is MissingZero!273) lt!65114))))

(assert (=> b!126325 e!82503))

(declare-fun lt!65099 () Unit!3922)

(assert (=> b!126325 (= lt!65099 lt!65116)))

(assert (=> b!126325 false))

(declare-fun b!126326 () Bool)

(assert (=> b!126326 (= e!82504 e!82507)))

(declare-fun c!23084 () Bool)

(assert (=> b!126326 (= c!23084 (_1!1283 lt!65108))))

(declare-fun b!126327 () Bool)

(assert (=> b!126327 (= e!82495 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65092)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!126328 () Bool)

(assert (=> b!126328 (= e!82506 (not call!13569))))

(assert (= (and d!38041 c!23087) b!126309))

(assert (= (and d!38041 (not c!23087)) b!126322))

(assert (= (and b!126309 c!23089) b!126324))

(assert (= (and b!126309 (not c!23089)) b!126313))

(assert (= (or b!126324 b!126313) bm!13579))

(assert (= (or b!126324 b!126313) bm!13570))

(assert (= (or b!126324 b!126313) bm!13567))

(assert (= (and b!126322 c!23082) b!126296))

(assert (= (and b!126322 (not c!23082)) b!126302))

(assert (= (and b!126296 c!23077) b!126310))

(assert (= (and b!126296 (not c!23077)) b!126320))

(assert (= (and b!126310 res!61079) b!126308))

(assert (= (and b!126308 res!61073) b!126327))

(assert (= (and b!126320 c!23078) b!126293))

(assert (= (and b!126320 (not c!23078)) b!126305))

(assert (= (and b!126293 res!61077) b!126323))

(assert (= (and b!126323 res!61078) b!126317))

(assert (= (and b!126305 c!23083) b!126289))

(assert (= (and b!126305 (not c!23083)) b!126319))

(assert (= (and b!126289 res!61071) b!126297))

(assert (= (and b!126297 res!61070) b!126328))

(assert (= (or b!126293 b!126289) bm!13582))

(assert (= (or b!126317 b!126328) bm!13571))

(assert (= (or b!126308 bm!13582) bm!13583))

(assert (= (or b!126310 b!126320) bm!13573))

(assert (= (and b!126302 c!23088) b!126300))

(assert (= (and b!126302 (not c!23088)) b!126304))

(assert (= (and b!126304 c!23081) b!126299))

(assert (= (and b!126304 (not c!23081)) b!126318))

(assert (= (and b!126318 c!23085) b!126301))

(assert (= (and b!126318 (not c!23085)) b!126325))

(assert (= (and b!126301 res!61074) b!126315))

(assert (= (and b!126315 res!61072) b!126303))

(assert (= (and b!126325 c!23086) b!126314))

(assert (= (and b!126325 (not c!23086)) b!126290))

(assert (= (and b!126314 res!61075) b!126311))

(assert (= (and b!126311 res!61069) b!126294))

(assert (= (and b!126290 c!23090) b!126288))

(assert (= (and b!126290 (not c!23090)) b!126312))

(assert (= (and b!126288 res!61076) b!126298))

(assert (= (and b!126298 res!61068) b!126292))

(assert (= (or b!126314 b!126288) bm!13584))

(assert (= (or b!126294 b!126292) bm!13585))

(assert (= (or b!126315 bm!13584) bm!13565))

(assert (= (or b!126301 b!126325) bm!13575))

(assert (= (or b!126300 b!126299) bm!13568))

(assert (= (or bm!13583 bm!13565) bm!13586))

(assert (= (or bm!13571 bm!13585) bm!13581))

(assert (= (or b!126296 b!126318) bm!13572))

(assert (= (or b!126310 b!126301) bm!13578))

(assert (= (or b!126320 b!126325) bm!13576))

(assert (= (or bm!13573 bm!13575) bm!13577))

(assert (= (or b!126296 b!126318) bm!13580))

(assert (= (and bm!13580 c!23079) b!126295))

(assert (= (and bm!13580 (not c!23079)) b!126316))

(assert (= (or bm!13579 b!126318) bm!13563))

(assert (= (or bm!13570 bm!13572) bm!13566))

(assert (= (or bm!13567 b!126318) bm!13574))

(assert (= (and bm!13574 c!23080) b!126307))

(assert (= (and bm!13574 (not c!23080)) b!126306))

(assert (= (and d!38041 res!61080) b!126326))

(assert (= (and b!126326 c!23084) b!126287))

(assert (= (and b!126326 (not c!23084)) b!126321))

(assert (= (and b!126287 res!61067) b!126291))

(assert (= (or b!126287 b!126291 b!126321) bm!13564))

(assert (= (or b!126291 b!126321) bm!13569))

(assert (=> bm!13568 m!146811))

(assert (=> bm!13568 m!146831))

(declare-fun m!146989 () Bool)

(assert (=> bm!13568 m!146989))

(declare-fun m!146991 () Bool)

(assert (=> bm!13586 m!146991))

(declare-fun m!146993 () Bool)

(assert (=> bm!13563 m!146993))

(declare-fun m!146995 () Bool)

(assert (=> bm!13563 m!146995))

(assert (=> bm!13569 m!146813))

(assert (=> bm!13580 m!146811))

(declare-fun m!146997 () Bool)

(assert (=> bm!13580 m!146997))

(assert (=> bm!13578 m!146811))

(declare-fun m!146999 () Bool)

(assert (=> bm!13578 m!146999))

(declare-fun m!147001 () Bool)

(assert (=> b!126311 m!147001))

(declare-fun m!147003 () Bool)

(assert (=> b!126291 m!147003))

(assert (=> b!126306 m!146923))

(assert (=> bm!13581 m!146811))

(declare-fun m!147005 () Bool)

(assert (=> bm!13581 m!147005))

(declare-fun m!147007 () Bool)

(assert (=> b!126303 m!147007))

(declare-fun m!147009 () Bool)

(assert (=> bm!13564 m!147009))

(assert (=> b!126324 m!146831))

(declare-fun m!147011 () Bool)

(assert (=> b!126324 m!147011))

(declare-fun m!147013 () Bool)

(assert (=> b!126318 m!147013))

(assert (=> b!126318 m!146811))

(assert (=> b!126318 m!146831))

(declare-fun m!147015 () Bool)

(assert (=> b!126318 m!147015))

(declare-fun m!147017 () Bool)

(assert (=> b!126318 m!147017))

(assert (=> b!126318 m!146993))

(assert (=> b!126318 m!147013))

(declare-fun m!147019 () Bool)

(assert (=> b!126318 m!147019))

(assert (=> b!126322 m!146811))

(declare-fun m!147021 () Bool)

(assert (=> b!126322 m!147021))

(declare-fun m!147023 () Bool)

(assert (=> d!38041 m!147023))

(assert (=> d!38041 m!146843))

(declare-fun m!147025 () Bool)

(assert (=> bm!13574 m!147025))

(declare-fun m!147027 () Bool)

(assert (=> b!126327 m!147027))

(declare-fun m!147029 () Bool)

(assert (=> b!126297 m!147029))

(declare-fun m!147031 () Bool)

(assert (=> b!126323 m!147031))

(assert (=> b!126313 m!146831))

(declare-fun m!147033 () Bool)

(assert (=> b!126313 m!147033))

(declare-fun m!147035 () Bool)

(assert (=> b!126298 m!147035))

(assert (=> bm!13576 m!146811))

(declare-fun m!147037 () Bool)

(assert (=> bm!13576 m!147037))

(declare-fun m!147039 () Bool)

(assert (=> bm!13566 m!147039))

(assert (=> b!126316 m!146923))

(assert (=> bm!13577 m!146811))

(assert (=> bm!13577 m!147021))

(assert (=> b!126287 m!146811))

(declare-fun m!147041 () Bool)

(assert (=> b!126287 m!147041))

(assert (=> b!126005 d!38041))

(declare-fun d!38043 () Bool)

(declare-fun c!23093 () Bool)

(assert (=> d!38043 (= c!23093 ((_ is ValueCellFull!1076) (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun e!82513 () V!3433)

(assert (=> d!38043 (= (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82513)))

(declare-fun b!126333 () Bool)

(declare-fun get!1444 (ValueCell!1076 V!3433) V!3433)

(assert (=> b!126333 (= e!82513 (get!1444 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126334 () Bool)

(declare-fun get!1445 (ValueCell!1076 V!3433) V!3433)

(assert (=> b!126334 (= e!82513 (get!1445 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38043 c!23093) b!126333))

(assert (= (and d!38043 (not c!23093)) b!126334))

(assert (=> b!126333 m!146827))

(assert (=> b!126333 m!146829))

(declare-fun m!147043 () Bool)

(assert (=> b!126333 m!147043))

(assert (=> b!126334 m!146827))

(assert (=> b!126334 m!146829))

(declare-fun m!147045 () Bool)

(assert (=> b!126334 m!147045))

(assert (=> b!126005 d!38043))

(declare-fun d!38045 () Bool)

(assert (=> d!38045 (= (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992)))) (and (or (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000001111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000011111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000001111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000011111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000001111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000011111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000001111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000011111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000001111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000011111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000001111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000011111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000001111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000011111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000001111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000011111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000111111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00001111111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00011111111111111111111111111111) (= (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!125998 d!38045))

(declare-fun b!126342 () Bool)

(declare-fun e!82518 () Bool)

(assert (=> b!126342 (= e!82518 tp_is_empty!2839)))

(declare-fun b!126341 () Bool)

(declare-fun e!82519 () Bool)

(assert (=> b!126341 (= e!82519 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4509 () Bool)

(declare-fun mapRes!4509 () Bool)

(assert (=> mapIsEmpty!4509 mapRes!4509))

(declare-fun condMapEmpty!4509 () Bool)

(declare-fun mapDefault!4509 () ValueCell!1076)

(assert (=> mapNonEmpty!4493 (= condMapEmpty!4509 (= mapRest!4494 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4509)))))

(assert (=> mapNonEmpty!4493 (= tp!10943 (and e!82518 mapRes!4509))))

(declare-fun mapNonEmpty!4509 () Bool)

(declare-fun tp!10971 () Bool)

(assert (=> mapNonEmpty!4509 (= mapRes!4509 (and tp!10971 e!82519))))

(declare-fun mapRest!4509 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4509 () ValueCell!1076)

(declare-fun mapKey!4509 () (_ BitVec 32))

(assert (=> mapNonEmpty!4509 (= mapRest!4494 (store mapRest!4509 mapKey!4509 mapValue!4509))))

(assert (= (and mapNonEmpty!4493 condMapEmpty!4509) mapIsEmpty!4509))

(assert (= (and mapNonEmpty!4493 (not condMapEmpty!4509)) mapNonEmpty!4509))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1076) mapValue!4509)) b!126341))

(assert (= (and mapNonEmpty!4493 ((_ is ValueCellFull!1076) mapDefault!4509)) b!126342))

(declare-fun m!147047 () Bool)

(assert (=> mapNonEmpty!4509 m!147047))

(declare-fun b!126344 () Bool)

(declare-fun e!82520 () Bool)

(assert (=> b!126344 (= e!82520 tp_is_empty!2839)))

(declare-fun b!126343 () Bool)

(declare-fun e!82521 () Bool)

(assert (=> b!126343 (= e!82521 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4510 () Bool)

(declare-fun mapRes!4510 () Bool)

(assert (=> mapIsEmpty!4510 mapRes!4510))

(declare-fun condMapEmpty!4510 () Bool)

(declare-fun mapDefault!4510 () ValueCell!1076)

(assert (=> mapNonEmpty!4494 (= condMapEmpty!4510 (= mapRest!4493 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4510)))))

(assert (=> mapNonEmpty!4494 (= tp!10944 (and e!82520 mapRes!4510))))

(declare-fun mapNonEmpty!4510 () Bool)

(declare-fun tp!10972 () Bool)

(assert (=> mapNonEmpty!4510 (= mapRes!4510 (and tp!10972 e!82521))))

(declare-fun mapKey!4510 () (_ BitVec 32))

(declare-fun mapValue!4510 () ValueCell!1076)

(declare-fun mapRest!4510 () (Array (_ BitVec 32) ValueCell!1076))

(assert (=> mapNonEmpty!4510 (= mapRest!4493 (store mapRest!4510 mapKey!4510 mapValue!4510))))

(assert (= (and mapNonEmpty!4494 condMapEmpty!4510) mapIsEmpty!4510))

(assert (= (and mapNonEmpty!4494 (not condMapEmpty!4510)) mapNonEmpty!4510))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1076) mapValue!4510)) b!126343))

(assert (= (and mapNonEmpty!4494 ((_ is ValueCellFull!1076) mapDefault!4510)) b!126344))

(declare-fun m!147049 () Bool)

(assert (=> mapNonEmpty!4510 m!147049))

(declare-fun b_lambda!5555 () Bool)

(assert (= b_lambda!5553 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5555)))

(check-sat (not b!126130) (not mapNonEmpty!4510) (not b!126128) (not bm!13512) (not d!38041) (not d!38023) (not d!38033) (not bm!13586) (not b!126200) (not bm!13576) (not bm!13574) (not b!126129) (not bm!13564) (not b_next!2845) (not b_lambda!5555) (not b!126324) (not bm!13577) (not b!126313) (not bm!13510) (not b!126183) (not d!38035) (not bm!13569) (not bm!13511) (not b_next!2847) b_and!7761 b_and!7763 (not bm!13563) (not b!126187) (not bm!13514) (not bm!13568) (not b!126202) (not b!126334) (not b!126316) (not b!126179) (not d!38039) (not bm!13566) (not b!126318) (not mapNonEmpty!4509) (not d!38037) (not bm!13580) (not b!126175) (not b!126306) tp_is_empty!2839 (not b!126185) (not b_lambda!5551) (not b!126322) (not b!126333) (not b!126189) (not bm!13578) (not bm!13581) (not b!126291) (not b!126287) (not b!126184) (not b!126174))
(check-sat b_and!7761 b_and!7763 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun d!38047 () Bool)

(declare-fun get!1446 (Option!171) V!3433)

(assert (=> d!38047 (= (apply!111 lt!65010 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5218 () Bool)

(assert (= bs!5218 d!38047))

(declare-fun m!147051 () Bool)

(assert (=> bs!5218 m!147051))

(assert (=> bs!5218 m!147051))

(declare-fun m!147053 () Bool)

(assert (=> bs!5218 m!147053))

(assert (=> b!126174 d!38047))

(declare-fun d!38049 () Bool)

(assert (=> d!38049 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65120 () Unit!3922)

(declare-fun choose!767 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3922)

(assert (=> d!38049 (= lt!65120 (choose!767 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65100 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38049 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38049 (= (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65100 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)) lt!65120)))

(declare-fun bs!5219 () Bool)

(assert (= bs!5219 d!38049))

(assert (=> bs!5219 m!146923))

(assert (=> bs!5219 m!146831))

(declare-fun m!147055 () Bool)

(assert (=> bs!5219 m!147055))

(assert (=> bs!5219 m!146831))

(declare-fun m!147057 () Bool)

(assert (=> bs!5219 m!147057))

(assert (=> bs!5219 m!146923))

(declare-fun m!147059 () Bool)

(assert (=> bs!5219 m!147059))

(declare-fun m!147061 () Bool)

(assert (=> bs!5219 m!147061))

(assert (=> b!126324 d!38049))

(declare-fun d!38051 () Bool)

(declare-fun isEmpty!400 (Option!171) Bool)

(assert (=> d!38051 (= (isDefined!119 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) (not (isEmpty!400 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(declare-fun bs!5220 () Bool)

(assert (= bs!5220 d!38051))

(assert (=> bs!5220 m!146985))

(declare-fun m!147063 () Bool)

(assert (=> bs!5220 m!147063))

(assert (=> b!126202 d!38051))

(declare-fun b!126353 () Bool)

(declare-fun e!82526 () Option!171)

(assert (=> b!126353 (= e!82526 (Some!170 (_2!1282 (h!2290 (toList!839 lt!64938)))))))

(declare-fun e!82527 () Option!171)

(declare-fun b!126355 () Bool)

(assert (=> b!126355 (= e!82527 (getValueByKey!165 (t!6030 (toList!839 lt!64938)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun d!38053 () Bool)

(declare-fun c!23098 () Bool)

(assert (=> d!38053 (= c!23098 (and ((_ is Cons!1688) (toList!839 lt!64938)) (= (_1!1282 (h!2290 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38053 (= (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82526)))

(declare-fun b!126356 () Bool)

(assert (=> b!126356 (= e!82527 None!169)))

(declare-fun b!126354 () Bool)

(assert (=> b!126354 (= e!82526 e!82527)))

(declare-fun c!23099 () Bool)

(assert (=> b!126354 (= c!23099 (and ((_ is Cons!1688) (toList!839 lt!64938)) (not (= (_1!1282 (h!2290 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(assert (= (and d!38053 c!23098) b!126353))

(assert (= (and d!38053 (not c!23098)) b!126354))

(assert (= (and b!126354 c!23099) b!126355))

(assert (= (and b!126354 (not c!23099)) b!126356))

(assert (=> b!126355 m!146811))

(declare-fun m!147065 () Bool)

(assert (=> b!126355 m!147065))

(assert (=> b!126202 d!38053))

(declare-fun d!38055 () Bool)

(assert (=> d!38055 (= (apply!111 lt!65010 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5221 () Bool)

(assert (= bs!5221 d!38055))

(declare-fun m!147067 () Bool)

(assert (=> bs!5221 m!147067))

(assert (=> bs!5221 m!147067))

(declare-fun m!147069 () Bool)

(assert (=> bs!5221 m!147069))

(assert (=> b!126175 d!38055))

(declare-fun d!38057 () Bool)

(declare-fun res!61081 () Bool)

(declare-fun e!82528 () Bool)

(assert (=> d!38057 (=> (not res!61081) (not e!82528))))

(assert (=> d!38057 (= res!61081 (simpleValid!87 (v!3117 (underlying!435 thiss!992))))))

(assert (=> d!38057 (= (valid!509 (v!3117 (underlying!435 thiss!992))) e!82528)))

(declare-fun b!126357 () Bool)

(declare-fun res!61082 () Bool)

(assert (=> b!126357 (=> (not res!61082) (not e!82528))))

(assert (=> b!126357 (= res!61082 (= (arrayCountValidKeys!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))) (_size!579 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126358 () Bool)

(declare-fun res!61083 () Bool)

(assert (=> b!126358 (=> (not res!61083) (not e!82528))))

(assert (=> b!126358 (= res!61083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126359 () Bool)

(assert (=> b!126359 (= e!82528 (arrayNoDuplicates!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000 Nil!1691))))

(assert (= (and d!38057 res!61081) b!126357))

(assert (= (and b!126357 res!61082) b!126358))

(assert (= (and b!126358 res!61083) b!126359))

(declare-fun m!147071 () Bool)

(assert (=> d!38057 m!147071))

(declare-fun m!147073 () Bool)

(assert (=> b!126357 m!147073))

(declare-fun m!147075 () Bool)

(assert (=> b!126358 m!147075))

(declare-fun m!147077 () Bool)

(assert (=> b!126359 m!147077))

(assert (=> d!38033 d!38057))

(declare-fun d!38059 () Bool)

(declare-fun e!82529 () Bool)

(assert (=> d!38059 e!82529))

(declare-fun res!61084 () Bool)

(assert (=> d!38059 (=> res!61084 e!82529)))

(declare-fun lt!65123 () Bool)

(assert (=> d!38059 (= res!61084 (not lt!65123))))

(declare-fun lt!65121 () Bool)

(assert (=> d!38059 (= lt!65123 lt!65121)))

(declare-fun lt!65124 () Unit!3922)

(declare-fun e!82530 () Unit!3922)

(assert (=> d!38059 (= lt!65124 e!82530)))

(declare-fun c!23100 () Bool)

(assert (=> d!38059 (= c!23100 lt!65121)))

(assert (=> d!38059 (= lt!65121 (containsKey!169 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38059 (= (contains!867 lt!65010 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65123)))

(declare-fun b!126360 () Bool)

(declare-fun lt!65122 () Unit!3922)

(assert (=> b!126360 (= e!82530 lt!65122)))

(assert (=> b!126360 (= lt!65122 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126360 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126361 () Bool)

(declare-fun Unit!3928 () Unit!3922)

(assert (=> b!126361 (= e!82530 Unit!3928)))

(declare-fun b!126362 () Bool)

(assert (=> b!126362 (= e!82529 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38059 c!23100) b!126360))

(assert (= (and d!38059 (not c!23100)) b!126361))

(assert (= (and d!38059 (not res!61084)) b!126362))

(declare-fun m!147079 () Bool)

(assert (=> d!38059 m!147079))

(declare-fun m!147081 () Bool)

(assert (=> b!126360 m!147081))

(assert (=> b!126360 m!147051))

(assert (=> b!126360 m!147051))

(declare-fun m!147083 () Bool)

(assert (=> b!126360 m!147083))

(assert (=> b!126362 m!147051))

(assert (=> b!126362 m!147051))

(assert (=> b!126362 m!147083))

(assert (=> bm!13514 d!38059))

(declare-fun b!126371 () Bool)

(declare-fun e!82539 () Bool)

(declare-fun e!82537 () Bool)

(assert (=> b!126371 (= e!82539 e!82537)))

(declare-fun c!23103 () Bool)

(assert (=> b!126371 (= c!23103 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126372 () Bool)

(declare-fun call!13592 () Bool)

(assert (=> b!126372 (= e!82537 call!13592)))

(declare-fun d!38061 () Bool)

(declare-fun res!61089 () Bool)

(assert (=> d!38061 (=> res!61089 e!82539)))

(assert (=> d!38061 (= res!61089 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 newMap!16) (mask!7037 newMap!16)) e!82539)))

(declare-fun bm!13589 () Bool)

(assert (=> bm!13589 (= call!13592 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!126373 () Bool)

(declare-fun e!82538 () Bool)

(assert (=> b!126373 (= e!82538 call!13592)))

(declare-fun b!126374 () Bool)

(assert (=> b!126374 (= e!82537 e!82538)))

(declare-fun lt!65133 () (_ BitVec 64))

(assert (=> b!126374 (= lt!65133 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65132 () Unit!3922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4675 (_ BitVec 64) (_ BitVec 32)) Unit!3922)

(assert (=> b!126374 (= lt!65132 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000))))

(assert (=> b!126374 (arrayContainsKey!0 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000)))

(declare-fun lt!65131 () Unit!3922)

(assert (=> b!126374 (= lt!65131 lt!65132)))

(declare-fun res!61090 () Bool)

(assert (=> b!126374 (= res!61090 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (_keys!4514 newMap!16) (mask!7037 newMap!16)) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!126374 (=> (not res!61090) (not e!82538))))

(assert (= (and d!38061 (not res!61089)) b!126371))

(assert (= (and b!126371 c!23103) b!126374))

(assert (= (and b!126371 (not c!23103)) b!126372))

(assert (= (and b!126374 res!61090) b!126373))

(assert (= (or b!126373 b!126372) bm!13589))

(declare-fun m!147085 () Bool)

(assert (=> b!126371 m!147085))

(assert (=> b!126371 m!147085))

(declare-fun m!147087 () Bool)

(assert (=> b!126371 m!147087))

(declare-fun m!147089 () Bool)

(assert (=> bm!13589 m!147089))

(assert (=> b!126374 m!147085))

(declare-fun m!147091 () Bool)

(assert (=> b!126374 m!147091))

(declare-fun m!147093 () Bool)

(assert (=> b!126374 m!147093))

(assert (=> b!126374 m!147085))

(declare-fun m!147095 () Bool)

(assert (=> b!126374 m!147095))

(assert (=> b!126129 d!38061))

(declare-fun b!126387 () Bool)

(declare-fun e!82546 () SeekEntryResult!273)

(declare-fun lt!65141 () SeekEntryResult!273)

(assert (=> b!126387 (= e!82546 (Found!273 (index!3249 lt!65141)))))

(declare-fun b!126388 () Bool)

(declare-fun e!82547 () SeekEntryResult!273)

(assert (=> b!126388 (= e!82547 (MissingZero!273 (index!3249 lt!65141)))))

(declare-fun b!126389 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4675 (_ BitVec 32)) SeekEntryResult!273)

(assert (=> b!126389 (= e!82547 (seekKeyOrZeroReturnVacant!0 (x!14965 lt!65141) (index!3249 lt!65141) (index!3249 lt!65141) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!126390 () Bool)

(declare-fun c!23110 () Bool)

(declare-fun lt!65140 () (_ BitVec 64))

(assert (=> b!126390 (= c!23110 (= lt!65140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126390 (= e!82546 e!82547)))

(declare-fun b!126391 () Bool)

(declare-fun e!82548 () SeekEntryResult!273)

(assert (=> b!126391 (= e!82548 Undefined!273)))

(declare-fun lt!65142 () SeekEntryResult!273)

(declare-fun d!38063 () Bool)

(assert (=> d!38063 (and (or ((_ is Undefined!273) lt!65142) (not ((_ is Found!273) lt!65142)) (and (bvsge (index!3248 lt!65142) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65142) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65142) ((_ is Found!273) lt!65142) (not ((_ is MissingZero!273) lt!65142)) (and (bvsge (index!3247 lt!65142) #b00000000000000000000000000000000) (bvslt (index!3247 lt!65142) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65142) ((_ is Found!273) lt!65142) ((_ is MissingZero!273) lt!65142) (not ((_ is MissingVacant!273) lt!65142)) (and (bvsge (index!3250 lt!65142) #b00000000000000000000000000000000) (bvslt (index!3250 lt!65142) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65142) (ite ((_ is Found!273) lt!65142) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65142)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite ((_ is MissingZero!273) lt!65142) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65142)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!273) lt!65142) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65142)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38063 (= lt!65142 e!82548)))

(declare-fun c!23112 () Bool)

(assert (=> d!38063 (= c!23112 (and ((_ is Intermediate!273) lt!65141) (undefined!1085 lt!65141)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4675 (_ BitVec 32)) SeekEntryResult!273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!38063 (= lt!65141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(assert (=> d!38063 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38063 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)) lt!65142)))

(declare-fun b!126392 () Bool)

(assert (=> b!126392 (= e!82548 e!82546)))

(assert (=> b!126392 (= lt!65140 (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65141)))))

(declare-fun c!23111 () Bool)

(assert (=> b!126392 (= c!23111 (= lt!65140 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38063 c!23112) b!126391))

(assert (= (and d!38063 (not c!23112)) b!126392))

(assert (= (and b!126392 c!23111) b!126387))

(assert (= (and b!126392 (not c!23111)) b!126390))

(assert (= (and b!126390 c!23110) b!126388))

(assert (= (and b!126390 (not c!23110)) b!126389))

(assert (=> b!126389 m!146811))

(declare-fun m!147097 () Bool)

(assert (=> b!126389 m!147097))

(assert (=> d!38063 m!146811))

(declare-fun m!147099 () Bool)

(assert (=> d!38063 m!147099))

(declare-fun m!147101 () Bool)

(assert (=> d!38063 m!147101))

(assert (=> d!38063 m!147099))

(assert (=> d!38063 m!146811))

(declare-fun m!147103 () Bool)

(assert (=> d!38063 m!147103))

(declare-fun m!147105 () Bool)

(assert (=> d!38063 m!147105))

(declare-fun m!147107 () Bool)

(assert (=> d!38063 m!147107))

(assert (=> d!38063 m!147061))

(declare-fun m!147109 () Bool)

(assert (=> b!126392 m!147109))

(assert (=> b!126322 d!38063))

(declare-fun d!38065 () Bool)

(assert (=> d!38065 (isDefined!119 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun lt!65145 () Unit!3922)

(declare-fun choose!768 (List!1692 (_ BitVec 64)) Unit!3922)

(assert (=> d!38065 (= lt!65145 (choose!768 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun e!82551 () Bool)

(assert (=> d!38065 e!82551))

(declare-fun res!61093 () Bool)

(assert (=> d!38065 (=> (not res!61093) (not e!82551))))

(declare-fun isStrictlySorted!312 (List!1692) Bool)

(assert (=> d!38065 (= res!61093 (isStrictlySorted!312 (toList!839 lt!64938)))))

(assert (=> d!38065 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65145)))

(declare-fun b!126395 () Bool)

(assert (=> b!126395 (= e!82551 (containsKey!169 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38065 res!61093) b!126395))

(assert (=> d!38065 m!146811))

(assert (=> d!38065 m!146985))

(assert (=> d!38065 m!146985))

(assert (=> d!38065 m!146987))

(assert (=> d!38065 m!146811))

(declare-fun m!147111 () Bool)

(assert (=> d!38065 m!147111))

(declare-fun m!147113 () Bool)

(assert (=> d!38065 m!147113))

(assert (=> b!126395 m!146811))

(assert (=> b!126395 m!146981))

(assert (=> b!126200 d!38065))

(assert (=> b!126200 d!38051))

(assert (=> b!126200 d!38053))

(declare-fun d!38067 () Bool)

(declare-fun e!82554 () Bool)

(assert (=> d!38067 e!82554))

(declare-fun res!61098 () Bool)

(assert (=> d!38067 (=> (not res!61098) (not e!82554))))

(declare-fun lt!65156 () ListLongMap!1647)

(assert (=> d!38067 (= res!61098 (contains!867 lt!65156 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun lt!65154 () List!1692)

(assert (=> d!38067 (= lt!65156 (ListLongMap!1648 lt!65154))))

(declare-fun lt!65157 () Unit!3922)

(declare-fun lt!65155 () Unit!3922)

(assert (=> d!38067 (= lt!65157 lt!65155)))

(assert (=> d!38067 (= (getValueByKey!165 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (Some!170 (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!83 (List!1692 (_ BitVec 64) V!3433) Unit!3922)

(assert (=> d!38067 (= lt!65155 (lemmaContainsTupThenGetReturnValue!83 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun insertStrictlySorted!86 (List!1692 (_ BitVec 64) V!3433) List!1692)

(assert (=> d!38067 (= lt!65154 (insertStrictlySorted!86 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38067 (= (+!158 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65156)))

(declare-fun b!126400 () Bool)

(declare-fun res!61099 () Bool)

(assert (=> b!126400 (=> (not res!61099) (not e!82554))))

(assert (=> b!126400 (= res!61099 (= (getValueByKey!165 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (Some!170 (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun b!126401 () Bool)

(declare-fun contains!869 (List!1692 tuple2!2542) Bool)

(assert (=> b!126401 (= e!82554 (contains!869 (toList!839 lt!65156) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (= (and d!38067 res!61098) b!126400))

(assert (= (and b!126400 res!61099) b!126401))

(declare-fun m!147115 () Bool)

(assert (=> d!38067 m!147115))

(declare-fun m!147117 () Bool)

(assert (=> d!38067 m!147117))

(declare-fun m!147119 () Bool)

(assert (=> d!38067 m!147119))

(declare-fun m!147121 () Bool)

(assert (=> d!38067 m!147121))

(declare-fun m!147123 () Bool)

(assert (=> b!126400 m!147123))

(declare-fun m!147125 () Bool)

(assert (=> b!126401 m!147125))

(assert (=> bm!13512 d!38067))

(declare-fun d!38069 () Bool)

(declare-fun e!82555 () Bool)

(assert (=> d!38069 e!82555))

(declare-fun res!61100 () Bool)

(assert (=> d!38069 (=> res!61100 e!82555)))

(declare-fun lt!65160 () Bool)

(assert (=> d!38069 (= res!61100 (not lt!65160))))

(declare-fun lt!65158 () Bool)

(assert (=> d!38069 (= lt!65160 lt!65158)))

(declare-fun lt!65161 () Unit!3922)

(declare-fun e!82556 () Unit!3922)

(assert (=> d!38069 (= lt!65161 e!82556)))

(declare-fun c!23113 () Bool)

(assert (=> d!38069 (= c!23113 lt!65158)))

(assert (=> d!38069 (= lt!65158 (containsKey!169 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38069 (= (contains!867 e!82505 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65160)))

(declare-fun b!126402 () Bool)

(declare-fun lt!65159 () Unit!3922)

(assert (=> b!126402 (= e!82556 lt!65159)))

(assert (=> b!126402 (= lt!65159 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126402 (isDefined!119 (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!126403 () Bool)

(declare-fun Unit!3929 () Unit!3922)

(assert (=> b!126403 (= e!82556 Unit!3929)))

(declare-fun b!126404 () Bool)

(assert (=> b!126404 (= e!82555 (isDefined!119 (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (= (and d!38069 c!23113) b!126402))

(assert (= (and d!38069 (not c!23113)) b!126403))

(assert (= (and d!38069 (not res!61100)) b!126404))

(assert (=> d!38069 m!146811))

(declare-fun m!147127 () Bool)

(assert (=> d!38069 m!147127))

(assert (=> b!126402 m!146811))

(declare-fun m!147129 () Bool)

(assert (=> b!126402 m!147129))

(assert (=> b!126402 m!146811))

(declare-fun m!147131 () Bool)

(assert (=> b!126402 m!147131))

(assert (=> b!126402 m!147131))

(declare-fun m!147133 () Bool)

(assert (=> b!126402 m!147133))

(assert (=> b!126404 m!146811))

(assert (=> b!126404 m!147131))

(assert (=> b!126404 m!147131))

(assert (=> b!126404 m!147133))

(assert (=> bm!13580 d!38069))

(declare-fun b!126413 () Bool)

(declare-fun e!82561 () (_ BitVec 32))

(declare-fun call!13595 () (_ BitVec 32))

(assert (=> b!126413 (= e!82561 (bvadd #b00000000000000000000000000000001 call!13595))))

(declare-fun bm!13592 () Bool)

(assert (=> bm!13592 (= call!13595 (arrayCountValidKeys!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126414 () Bool)

(assert (=> b!126414 (= e!82561 call!13595)))

(declare-fun b!126415 () Bool)

(declare-fun e!82562 () (_ BitVec 32))

(assert (=> b!126415 (= e!82562 #b00000000000000000000000000000000)))

(declare-fun b!126416 () Bool)

(assert (=> b!126416 (= e!82562 e!82561)))

(declare-fun c!23118 () Bool)

(assert (=> b!126416 (= c!23118 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38071 () Bool)

(declare-fun lt!65164 () (_ BitVec 32))

(assert (=> d!38071 (and (bvsge lt!65164 #b00000000000000000000000000000000) (bvsle lt!65164 (bvsub (size!2477 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38071 (= lt!65164 e!82562)))

(declare-fun c!23119 () Bool)

(assert (=> d!38071 (= c!23119 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38071 (and (bvsle #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2477 (_keys!4514 newMap!16)) (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38071 (= (arrayCountValidKeys!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) lt!65164)))

(assert (= (and d!38071 c!23119) b!126415))

(assert (= (and d!38071 (not c!23119)) b!126416))

(assert (= (and b!126416 c!23118) b!126413))

(assert (= (and b!126416 (not c!23118)) b!126414))

(assert (= (or b!126413 b!126414) bm!13592))

(declare-fun m!147135 () Bool)

(assert (=> bm!13592 m!147135))

(assert (=> b!126416 m!147085))

(assert (=> b!126416 m!147085))

(assert (=> b!126416 m!147087))

(assert (=> b!126128 d!38071))

(declare-fun d!38073 () Bool)

(declare-fun e!82563 () Bool)

(assert (=> d!38073 e!82563))

(declare-fun res!61101 () Bool)

(assert (=> d!38073 (=> (not res!61101) (not e!82563))))

(declare-fun lt!65167 () ListLongMap!1647)

(assert (=> d!38073 (= res!61101 (contains!867 lt!65167 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65165 () List!1692)

(assert (=> d!38073 (= lt!65167 (ListLongMap!1648 lt!65165))))

(declare-fun lt!65168 () Unit!3922)

(declare-fun lt!65166 () Unit!3922)

(assert (=> d!38073 (= lt!65168 lt!65166)))

(assert (=> d!38073 (= (getValueByKey!165 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38073 (= lt!65166 (lemmaContainsTupThenGetReturnValue!83 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38073 (= lt!65165 (insertStrictlySorted!86 (toList!839 call!13515) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38073 (= (+!158 call!13515 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65167)))

(declare-fun b!126417 () Bool)

(declare-fun res!61102 () Bool)

(assert (=> b!126417 (=> (not res!61102) (not e!82563))))

(assert (=> b!126417 (= res!61102 (= (getValueByKey!165 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126418 () Bool)

(assert (=> b!126418 (= e!82563 (contains!869 (toList!839 lt!65167) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38073 res!61101) b!126417))

(assert (= (and b!126417 res!61102) b!126418))

(declare-fun m!147137 () Bool)

(assert (=> d!38073 m!147137))

(declare-fun m!147139 () Bool)

(assert (=> d!38073 m!147139))

(declare-fun m!147141 () Bool)

(assert (=> d!38073 m!147141))

(declare-fun m!147143 () Bool)

(assert (=> d!38073 m!147143))

(declare-fun m!147145 () Bool)

(assert (=> b!126417 m!147145))

(declare-fun m!147147 () Bool)

(assert (=> b!126418 m!147147))

(assert (=> b!126189 d!38073))

(declare-fun d!38075 () Bool)

(declare-fun res!61107 () Bool)

(declare-fun e!82568 () Bool)

(assert (=> d!38075 (=> res!61107 e!82568)))

(assert (=> d!38075 (= res!61107 (= (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38075 (= (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82568)))

(declare-fun b!126423 () Bool)

(declare-fun e!82569 () Bool)

(assert (=> b!126423 (= e!82568 e!82569)))

(declare-fun res!61108 () Bool)

(assert (=> b!126423 (=> (not res!61108) (not e!82569))))

(assert (=> b!126423 (= res!61108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126424 () Bool)

(assert (=> b!126424 (= e!82569 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38075 (not res!61107)) b!126423))

(assert (= (and b!126423 res!61108) b!126424))

(assert (=> d!38075 m!147085))

(assert (=> b!126424 m!146811))

(declare-fun m!147149 () Bool)

(assert (=> b!126424 m!147149))

(assert (=> bm!13581 d!38075))

(declare-fun b!126435 () Bool)

(declare-fun e!82580 () Bool)

(declare-fun e!82579 () Bool)

(assert (=> b!126435 (= e!82580 e!82579)))

(declare-fun res!61116 () Bool)

(assert (=> b!126435 (=> (not res!61116) (not e!82579))))

(declare-fun e!82578 () Bool)

(assert (=> b!126435 (= res!61116 (not e!82578))))

(declare-fun res!61117 () Bool)

(assert (=> b!126435 (=> (not res!61117) (not e!82578))))

(assert (=> b!126435 (= res!61117 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126437 () Bool)

(declare-fun e!82581 () Bool)

(declare-fun call!13598 () Bool)

(assert (=> b!126437 (= e!82581 call!13598)))

(declare-fun b!126438 () Bool)

(declare-fun contains!870 (List!1694 (_ BitVec 64)) Bool)

(assert (=> b!126438 (= e!82578 (contains!870 Nil!1691 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38077 () Bool)

(declare-fun res!61115 () Bool)

(assert (=> d!38077 (=> res!61115 e!82580)))

(assert (=> d!38077 (= res!61115 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38077 (= (arrayNoDuplicates!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 Nil!1691) e!82580)))

(declare-fun b!126436 () Bool)

(assert (=> b!126436 (= e!82581 call!13598)))

(declare-fun b!126439 () Bool)

(assert (=> b!126439 (= e!82579 e!82581)))

(declare-fun c!23122 () Bool)

(assert (=> b!126439 (= c!23122 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13595 () Bool)

(assert (=> bm!13595 (= call!13598 (arrayNoDuplicates!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23122 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) Nil!1691) Nil!1691)))))

(assert (= (and d!38077 (not res!61115)) b!126435))

(assert (= (and b!126435 res!61117) b!126438))

(assert (= (and b!126435 res!61116) b!126439))

(assert (= (and b!126439 c!23122) b!126436))

(assert (= (and b!126439 (not c!23122)) b!126437))

(assert (= (or b!126436 b!126437) bm!13595))

(assert (=> b!126435 m!147085))

(assert (=> b!126435 m!147085))

(assert (=> b!126435 m!147087))

(assert (=> b!126438 m!147085))

(assert (=> b!126438 m!147085))

(declare-fun m!147151 () Bool)

(assert (=> b!126438 m!147151))

(assert (=> b!126439 m!147085))

(assert (=> b!126439 m!147085))

(assert (=> b!126439 m!147087))

(assert (=> bm!13595 m!147085))

(declare-fun m!147153 () Bool)

(assert (=> bm!13595 m!147153))

(assert (=> b!126130 d!38077))

(assert (=> bm!13569 d!38035))

(declare-fun d!38079 () Bool)

(assert (=> d!38079 (= (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126185 d!38079))

(declare-fun d!38081 () Bool)

(declare-fun e!82582 () Bool)

(assert (=> d!38081 e!82582))

(declare-fun res!61118 () Bool)

(assert (=> d!38081 (=> (not res!61118) (not e!82582))))

(declare-fun lt!65171 () ListLongMap!1647)

(assert (=> d!38081 (= res!61118 (contains!867 lt!65171 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65169 () List!1692)

(assert (=> d!38081 (= lt!65171 (ListLongMap!1648 lt!65169))))

(declare-fun lt!65172 () Unit!3922)

(declare-fun lt!65170 () Unit!3922)

(assert (=> d!38081 (= lt!65172 lt!65170)))

(assert (=> d!38081 (= (getValueByKey!165 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38081 (= lt!65170 (lemmaContainsTupThenGetReturnValue!83 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38081 (= lt!65169 (insertStrictlySorted!86 (toList!839 lt!65020) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38081 (= (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65171)))

(declare-fun b!126440 () Bool)

(declare-fun res!61119 () Bool)

(assert (=> b!126440 (=> (not res!61119) (not e!82582))))

(assert (=> b!126440 (= res!61119 (= (getValueByKey!165 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126441 () Bool)

(assert (=> b!126441 (= e!82582 (contains!869 (toList!839 lt!65171) (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38081 res!61118) b!126440))

(assert (= (and b!126440 res!61119) b!126441))

(declare-fun m!147155 () Bool)

(assert (=> d!38081 m!147155))

(declare-fun m!147157 () Bool)

(assert (=> d!38081 m!147157))

(declare-fun m!147159 () Bool)

(assert (=> d!38081 m!147159))

(declare-fun m!147161 () Bool)

(assert (=> d!38081 m!147161))

(declare-fun m!147163 () Bool)

(assert (=> b!126440 m!147163))

(declare-fun m!147165 () Bool)

(assert (=> b!126441 m!147165))

(assert (=> b!126187 d!38081))

(declare-fun d!38083 () Bool)

(declare-fun e!82583 () Bool)

(assert (=> d!38083 e!82583))

(declare-fun res!61120 () Bool)

(assert (=> d!38083 (=> (not res!61120) (not e!82583))))

(declare-fun lt!65175 () ListLongMap!1647)

(assert (=> d!38083 (= res!61120 (contains!867 lt!65175 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65173 () List!1692)

(assert (=> d!38083 (= lt!65175 (ListLongMap!1648 lt!65173))))

(declare-fun lt!65176 () Unit!3922)

(declare-fun lt!65174 () Unit!3922)

(assert (=> d!38083 (= lt!65176 lt!65174)))

(assert (=> d!38083 (= (getValueByKey!165 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38083 (= lt!65174 (lemmaContainsTupThenGetReturnValue!83 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38083 (= lt!65173 (insertStrictlySorted!86 (toList!839 lt!65021) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38083 (= (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65175)))

(declare-fun b!126442 () Bool)

(declare-fun res!61121 () Bool)

(assert (=> b!126442 (=> (not res!61121) (not e!82583))))

(assert (=> b!126442 (= res!61121 (= (getValueByKey!165 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126443 () Bool)

(assert (=> b!126443 (= e!82583 (contains!869 (toList!839 lt!65175) (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38083 res!61120) b!126442))

(assert (= (and b!126442 res!61121) b!126443))

(declare-fun m!147167 () Bool)

(assert (=> d!38083 m!147167))

(declare-fun m!147169 () Bool)

(assert (=> d!38083 m!147169))

(declare-fun m!147171 () Bool)

(assert (=> d!38083 m!147171))

(declare-fun m!147173 () Bool)

(assert (=> d!38083 m!147173))

(declare-fun m!147175 () Bool)

(assert (=> b!126442 m!147175))

(declare-fun m!147177 () Bool)

(assert (=> b!126443 m!147177))

(assert (=> b!126187 d!38083))

(declare-fun d!38085 () Bool)

(assert (=> d!38085 (= (apply!111 lt!65021 lt!65013) (get!1446 (getValueByKey!165 (toList!839 lt!65021) lt!65013)))))

(declare-fun bs!5222 () Bool)

(assert (= bs!5222 d!38085))

(declare-fun m!147179 () Bool)

(assert (=> bs!5222 m!147179))

(assert (=> bs!5222 m!147179))

(declare-fun m!147181 () Bool)

(assert (=> bs!5222 m!147181))

(assert (=> b!126187 d!38085))

(declare-fun d!38087 () Bool)

(assert (=> d!38087 (= (apply!111 lt!65020 lt!65015) (get!1446 (getValueByKey!165 (toList!839 lt!65020) lt!65015)))))

(declare-fun bs!5223 () Bool)

(assert (= bs!5223 d!38087))

(declare-fun m!147183 () Bool)

(assert (=> bs!5223 m!147183))

(assert (=> bs!5223 m!147183))

(declare-fun m!147185 () Bool)

(assert (=> bs!5223 m!147185))

(assert (=> b!126187 d!38087))

(declare-fun d!38089 () Bool)

(assert (=> d!38089 (= (apply!111 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65015) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65015)))))

(declare-fun bs!5224 () Bool)

(assert (= bs!5224 d!38089))

(declare-fun m!147187 () Bool)

(assert (=> bs!5224 m!147187))

(assert (=> bs!5224 m!147187))

(declare-fun m!147189 () Bool)

(assert (=> bs!5224 m!147189))

(assert (=> b!126187 d!38089))

(declare-fun d!38091 () Bool)

(declare-fun e!82584 () Bool)

(assert (=> d!38091 e!82584))

(declare-fun res!61122 () Bool)

(assert (=> d!38091 (=> res!61122 e!82584)))

(declare-fun lt!65179 () Bool)

(assert (=> d!38091 (= res!61122 (not lt!65179))))

(declare-fun lt!65177 () Bool)

(assert (=> d!38091 (= lt!65179 lt!65177)))

(declare-fun lt!65180 () Unit!3922)

(declare-fun e!82585 () Unit!3922)

(assert (=> d!38091 (= lt!65180 e!82585)))

(declare-fun c!23123 () Bool)

(assert (=> d!38091 (= c!23123 lt!65177)))

(assert (=> d!38091 (= lt!65177 (containsKey!169 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(assert (=> d!38091 (= (contains!867 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65016) lt!65179)))

(declare-fun b!126444 () Bool)

(declare-fun lt!65178 () Unit!3922)

(assert (=> b!126444 (= e!82585 lt!65178)))

(assert (=> b!126444 (= lt!65178 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(assert (=> b!126444 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(declare-fun b!126445 () Bool)

(declare-fun Unit!3930 () Unit!3922)

(assert (=> b!126445 (= e!82585 Unit!3930)))

(declare-fun b!126446 () Bool)

(assert (=> b!126446 (= e!82584 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016)))))

(assert (= (and d!38091 c!23123) b!126444))

(assert (= (and d!38091 (not c!23123)) b!126445))

(assert (= (and d!38091 (not res!61122)) b!126446))

(declare-fun m!147191 () Bool)

(assert (=> d!38091 m!147191))

(declare-fun m!147193 () Bool)

(assert (=> b!126444 m!147193))

(declare-fun m!147195 () Bool)

(assert (=> b!126444 m!147195))

(assert (=> b!126444 m!147195))

(declare-fun m!147197 () Bool)

(assert (=> b!126444 m!147197))

(assert (=> b!126446 m!147195))

(assert (=> b!126446 m!147195))

(assert (=> b!126446 m!147197))

(assert (=> b!126187 d!38091))

(declare-fun d!38093 () Bool)

(assert (=> d!38093 (= (apply!111 lt!65005 lt!65008) (get!1446 (getValueByKey!165 (toList!839 lt!65005) lt!65008)))))

(declare-fun bs!5225 () Bool)

(assert (= bs!5225 d!38093))

(declare-fun m!147199 () Bool)

(assert (=> bs!5225 m!147199))

(assert (=> bs!5225 m!147199))

(declare-fun m!147201 () Bool)

(assert (=> bs!5225 m!147201))

(assert (=> b!126187 d!38093))

(declare-fun d!38095 () Bool)

(declare-fun e!82586 () Bool)

(assert (=> d!38095 e!82586))

(declare-fun res!61123 () Bool)

(assert (=> d!38095 (=> (not res!61123) (not e!82586))))

(declare-fun lt!65183 () ListLongMap!1647)

(assert (=> d!38095 (= res!61123 (contains!867 lt!65183 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65181 () List!1692)

(assert (=> d!38095 (= lt!65183 (ListLongMap!1648 lt!65181))))

(declare-fun lt!65184 () Unit!3922)

(declare-fun lt!65182 () Unit!3922)

(assert (=> d!38095 (= lt!65184 lt!65182)))

(assert (=> d!38095 (= (getValueByKey!165 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38095 (= lt!65182 (lemmaContainsTupThenGetReturnValue!83 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38095 (= lt!65181 (insertStrictlySorted!86 (toList!839 lt!65005) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38095 (= (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65183)))

(declare-fun b!126447 () Bool)

(declare-fun res!61124 () Bool)

(assert (=> b!126447 (=> (not res!61124) (not e!82586))))

(assert (=> b!126447 (= res!61124 (= (getValueByKey!165 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126448 () Bool)

(assert (=> b!126448 (= e!82586 (contains!869 (toList!839 lt!65183) (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38095 res!61123) b!126447))

(assert (= (and b!126447 res!61124) b!126448))

(declare-fun m!147203 () Bool)

(assert (=> d!38095 m!147203))

(declare-fun m!147205 () Bool)

(assert (=> d!38095 m!147205))

(declare-fun m!147207 () Bool)

(assert (=> d!38095 m!147207))

(declare-fun m!147209 () Bool)

(assert (=> d!38095 m!147209))

(declare-fun m!147211 () Bool)

(assert (=> b!126447 m!147211))

(declare-fun m!147213 () Bool)

(assert (=> b!126448 m!147213))

(assert (=> b!126187 d!38095))

(declare-fun b!126473 () Bool)

(declare-fun e!82602 () Bool)

(assert (=> b!126473 (= e!82602 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126473 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!126474 () Bool)

(declare-fun e!82604 () Bool)

(declare-fun e!82606 () Bool)

(assert (=> b!126474 (= e!82604 e!82606)))

(declare-fun c!23133 () Bool)

(assert (=> b!126474 (= c!23133 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126475 () Bool)

(declare-fun res!61134 () Bool)

(declare-fun e!82601 () Bool)

(assert (=> b!126475 (=> (not res!61134) (not e!82601))))

(declare-fun lt!65203 () ListLongMap!1647)

(assert (=> b!126475 (= res!61134 (not (contains!867 lt!65203 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126476 () Bool)

(declare-fun isEmpty!401 (ListLongMap!1647) Bool)

(assert (=> b!126476 (= e!82606 (isEmpty!401 lt!65203))))

(declare-fun b!126477 () Bool)

(declare-fun e!82605 () ListLongMap!1647)

(assert (=> b!126477 (= e!82605 (ListLongMap!1648 Nil!1689))))

(declare-fun b!126478 () Bool)

(declare-fun e!82607 () ListLongMap!1647)

(declare-fun call!13601 () ListLongMap!1647)

(assert (=> b!126478 (= e!82607 call!13601)))

(declare-fun b!126479 () Bool)

(declare-fun e!82603 () Bool)

(assert (=> b!126479 (= e!82604 e!82603)))

(assert (=> b!126479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun res!61136 () Bool)

(assert (=> b!126479 (= res!61136 (contains!867 lt!65203 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126479 (=> (not res!61136) (not e!82603))))

(declare-fun b!126480 () Bool)

(declare-fun lt!65199 () Unit!3922)

(declare-fun lt!65201 () Unit!3922)

(assert (=> b!126480 (= lt!65199 lt!65201)))

(declare-fun lt!65204 () (_ BitVec 64))

(declare-fun lt!65205 () V!3433)

(declare-fun lt!65202 () (_ BitVec 64))

(declare-fun lt!65200 () ListLongMap!1647)

(assert (=> b!126480 (not (contains!867 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205)) lt!65204))))

(declare-fun addStillNotContains!57 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> b!126480 (= lt!65201 (addStillNotContains!57 lt!65200 lt!65202 lt!65205 lt!65204))))

(assert (=> b!126480 (= lt!65204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126480 (= lt!65205 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126480 (= lt!65202 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!126480 (= lt!65200 call!13601)))

(assert (=> b!126480 (= e!82607 (+!158 call!13601 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38097 () Bool)

(assert (=> d!38097 e!82601))

(declare-fun res!61135 () Bool)

(assert (=> d!38097 (=> (not res!61135) (not e!82601))))

(assert (=> d!38097 (= res!61135 (not (contains!867 lt!65203 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38097 (= lt!65203 e!82605)))

(declare-fun c!23135 () Bool)

(assert (=> d!38097 (= c!23135 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38097 (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992))))))

(assert (=> d!38097 (= (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))) lt!65203)))

(declare-fun b!126481 () Bool)

(assert (=> b!126481 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> b!126481 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> b!126481 (= e!82603 (= (apply!111 lt!65203 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126482 () Bool)

(assert (=> b!126482 (= e!82606 (= lt!65203 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun bm!13598 () Bool)

(assert (=> bm!13598 (= call!13601 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126483 () Bool)

(assert (=> b!126483 (= e!82601 e!82604)))

(declare-fun c!23132 () Bool)

(assert (=> b!126483 (= c!23132 e!82602)))

(declare-fun res!61133 () Bool)

(assert (=> b!126483 (=> (not res!61133) (not e!82602))))

(assert (=> b!126483 (= res!61133 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126484 () Bool)

(assert (=> b!126484 (= e!82605 e!82607)))

(declare-fun c!23134 () Bool)

(assert (=> b!126484 (= c!23134 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38097 c!23135) b!126477))

(assert (= (and d!38097 (not c!23135)) b!126484))

(assert (= (and b!126484 c!23134) b!126480))

(assert (= (and b!126484 (not c!23134)) b!126478))

(assert (= (or b!126480 b!126478) bm!13598))

(assert (= (and d!38097 res!61135) b!126475))

(assert (= (and b!126475 res!61134) b!126483))

(assert (= (and b!126483 res!61133) b!126473))

(assert (= (and b!126483 c!23132) b!126479))

(assert (= (and b!126483 (not c!23132)) b!126474))

(assert (= (and b!126479 res!61136) b!126481))

(assert (= (and b!126474 c!23133) b!126482))

(assert (= (and b!126474 (not c!23133)) b!126476))

(declare-fun b_lambda!5557 () Bool)

(assert (=> (not b_lambda!5557) (not b!126480)))

(assert (=> b!126480 t!6027))

(declare-fun b_and!7765 () Bool)

(assert (= b_and!7761 (and (=> t!6027 result!3823) b_and!7765)))

(assert (=> b!126480 t!6029))

(declare-fun b_and!7767 () Bool)

(assert (= b_and!7763 (and (=> t!6029 result!3827) b_and!7767)))

(declare-fun b_lambda!5559 () Bool)

(assert (=> (not b_lambda!5559) (not b!126481)))

(assert (=> b!126481 t!6027))

(declare-fun b_and!7769 () Bool)

(assert (= b_and!7765 (and (=> t!6027 result!3823) b_and!7769)))

(assert (=> b!126481 t!6029))

(declare-fun b_and!7771 () Bool)

(assert (= b_and!7767 (and (=> t!6029 result!3827) b_and!7771)))

(declare-fun m!147215 () Bool)

(assert (=> b!126475 m!147215))

(assert (=> b!126484 m!146957))

(assert (=> b!126484 m!146957))

(assert (=> b!126484 m!146959))

(declare-fun m!147217 () Bool)

(assert (=> b!126482 m!147217))

(assert (=> b!126479 m!146957))

(assert (=> b!126479 m!146957))

(declare-fun m!147219 () Bool)

(assert (=> b!126479 m!147219))

(declare-fun m!147221 () Bool)

(assert (=> b!126476 m!147221))

(assert (=> b!126481 m!146957))

(assert (=> b!126481 m!146829))

(assert (=> b!126481 m!146957))

(declare-fun m!147223 () Bool)

(assert (=> b!126481 m!147223))

(assert (=> b!126481 m!146967))

(assert (=> b!126481 m!146967))

(assert (=> b!126481 m!146829))

(assert (=> b!126481 m!146969))

(assert (=> b!126473 m!146957))

(assert (=> b!126473 m!146957))

(assert (=> b!126473 m!146959))

(assert (=> bm!13598 m!147217))

(declare-fun m!147225 () Bool)

(assert (=> d!38097 m!147225))

(assert (=> d!38097 m!146817))

(assert (=> b!126480 m!146957))

(declare-fun m!147227 () Bool)

(assert (=> b!126480 m!147227))

(declare-fun m!147229 () Bool)

(assert (=> b!126480 m!147229))

(assert (=> b!126480 m!146829))

(assert (=> b!126480 m!146967))

(declare-fun m!147231 () Bool)

(assert (=> b!126480 m!147231))

(assert (=> b!126480 m!147227))

(declare-fun m!147233 () Bool)

(assert (=> b!126480 m!147233))

(assert (=> b!126480 m!146967))

(assert (=> b!126480 m!146829))

(assert (=> b!126480 m!146969))

(assert (=> b!126187 d!38097))

(declare-fun d!38099 () Bool)

(assert (=> d!38099 (= (apply!111 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65015) (apply!111 lt!65020 lt!65015))))

(declare-fun lt!65208 () Unit!3922)

(declare-fun choose!769 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> d!38099 (= lt!65208 (choose!769 lt!65020 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65015))))

(declare-fun e!82610 () Bool)

(assert (=> d!38099 e!82610))

(declare-fun res!61139 () Bool)

(assert (=> d!38099 (=> (not res!61139) (not e!82610))))

(assert (=> d!38099 (= res!61139 (contains!867 lt!65020 lt!65015))))

(assert (=> d!38099 (= (addApplyDifferent!87 lt!65020 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65015) lt!65208)))

(declare-fun b!126488 () Bool)

(assert (=> b!126488 (= e!82610 (not (= lt!65015 lt!65004)))))

(assert (= (and d!38099 res!61139) b!126488))

(declare-fun m!147235 () Bool)

(assert (=> d!38099 m!147235))

(declare-fun m!147237 () Bool)

(assert (=> d!38099 m!147237))

(assert (=> d!38099 m!146935))

(assert (=> d!38099 m!146937))

(assert (=> d!38099 m!146951))

(assert (=> d!38099 m!146935))

(assert (=> b!126187 d!38099))

(declare-fun d!38101 () Bool)

(assert (=> d!38101 (= (apply!111 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65013) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65013)))))

(declare-fun bs!5226 () Bool)

(assert (= bs!5226 d!38101))

(declare-fun m!147239 () Bool)

(assert (=> bs!5226 m!147239))

(assert (=> bs!5226 m!147239))

(declare-fun m!147241 () Bool)

(assert (=> bs!5226 m!147241))

(assert (=> b!126187 d!38101))

(declare-fun d!38103 () Bool)

(assert (=> d!38103 (contains!867 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65016)))

(declare-fun lt!65211 () Unit!3922)

(declare-fun choose!770 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> d!38103 (= lt!65211 (choose!770 lt!65006 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65016))))

(assert (=> d!38103 (contains!867 lt!65006 lt!65016)))

(assert (=> d!38103 (= (addStillContains!87 lt!65006 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65016) lt!65211)))

(declare-fun bs!5227 () Bool)

(assert (= bs!5227 d!38103))

(assert (=> bs!5227 m!146929))

(assert (=> bs!5227 m!146929))

(assert (=> bs!5227 m!146931))

(declare-fun m!147243 () Bool)

(assert (=> bs!5227 m!147243))

(declare-fun m!147245 () Bool)

(assert (=> bs!5227 m!147245))

(assert (=> b!126187 d!38103))

(declare-fun d!38105 () Bool)

(assert (=> d!38105 (= (apply!111 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65008) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65008)))))

(declare-fun bs!5228 () Bool)

(assert (= bs!5228 d!38105))

(declare-fun m!147247 () Bool)

(assert (=> bs!5228 m!147247))

(assert (=> bs!5228 m!147247))

(declare-fun m!147249 () Bool)

(assert (=> bs!5228 m!147249))

(assert (=> b!126187 d!38105))

(declare-fun d!38107 () Bool)

(assert (=> d!38107 (= (apply!111 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65013) (apply!111 lt!65021 lt!65013))))

(declare-fun lt!65212 () Unit!3922)

(assert (=> d!38107 (= lt!65212 (choose!769 lt!65021 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65013))))

(declare-fun e!82611 () Bool)

(assert (=> d!38107 e!82611))

(declare-fun res!61140 () Bool)

(assert (=> d!38107 (=> (not res!61140) (not e!82611))))

(assert (=> d!38107 (= res!61140 (contains!867 lt!65021 lt!65013))))

(assert (=> d!38107 (= (addApplyDifferent!87 lt!65021 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65013) lt!65212)))

(declare-fun b!126490 () Bool)

(assert (=> b!126490 (= e!82611 (not (= lt!65013 lt!65014)))))

(assert (= (and d!38107 res!61140) b!126490))

(declare-fun m!147251 () Bool)

(assert (=> d!38107 m!147251))

(declare-fun m!147253 () Bool)

(assert (=> d!38107 m!147253))

(assert (=> d!38107 m!146933))

(assert (=> d!38107 m!146955))

(assert (=> d!38107 m!146949))

(assert (=> d!38107 m!146933))

(assert (=> b!126187 d!38107))

(declare-fun d!38109 () Bool)

(declare-fun e!82612 () Bool)

(assert (=> d!38109 e!82612))

(declare-fun res!61141 () Bool)

(assert (=> d!38109 (=> (not res!61141) (not e!82612))))

(declare-fun lt!65215 () ListLongMap!1647)

(assert (=> d!38109 (= res!61141 (contains!867 lt!65215 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65213 () List!1692)

(assert (=> d!38109 (= lt!65215 (ListLongMap!1648 lt!65213))))

(declare-fun lt!65216 () Unit!3922)

(declare-fun lt!65214 () Unit!3922)

(assert (=> d!38109 (= lt!65216 lt!65214)))

(assert (=> d!38109 (= (getValueByKey!165 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38109 (= lt!65214 (lemmaContainsTupThenGetReturnValue!83 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38109 (= lt!65213 (insertStrictlySorted!86 (toList!839 lt!65006) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38109 (= (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65215)))

(declare-fun b!126491 () Bool)

(declare-fun res!61142 () Bool)

(assert (=> b!126491 (=> (not res!61142) (not e!82612))))

(assert (=> b!126491 (= res!61142 (= (getValueByKey!165 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126492 () Bool)

(assert (=> b!126492 (= e!82612 (contains!869 (toList!839 lt!65215) (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38109 res!61141) b!126491))

(assert (= (and b!126491 res!61142) b!126492))

(declare-fun m!147255 () Bool)

(assert (=> d!38109 m!147255))

(declare-fun m!147257 () Bool)

(assert (=> d!38109 m!147257))

(declare-fun m!147259 () Bool)

(assert (=> d!38109 m!147259))

(declare-fun m!147261 () Bool)

(assert (=> d!38109 m!147261))

(declare-fun m!147263 () Bool)

(assert (=> b!126491 m!147263))

(declare-fun m!147265 () Bool)

(assert (=> b!126492 m!147265))

(assert (=> b!126187 d!38109))

(declare-fun d!38111 () Bool)

(assert (=> d!38111 (= (apply!111 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65008) (apply!111 lt!65005 lt!65008))))

(declare-fun lt!65217 () Unit!3922)

(assert (=> d!38111 (= lt!65217 (choose!769 lt!65005 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65008))))

(declare-fun e!82613 () Bool)

(assert (=> d!38111 e!82613))

(declare-fun res!61143 () Bool)

(assert (=> d!38111 (=> (not res!61143) (not e!82613))))

(assert (=> d!38111 (= res!61143 (contains!867 lt!65005 lt!65008))))

(assert (=> d!38111 (= (addApplyDifferent!87 lt!65005 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65008) lt!65217)))

(declare-fun b!126493 () Bool)

(assert (=> b!126493 (= e!82613 (not (= lt!65008 lt!65003)))))

(assert (= (and d!38111 res!61143) b!126493))

(declare-fun m!147267 () Bool)

(assert (=> d!38111 m!147267))

(declare-fun m!147269 () Bool)

(assert (=> d!38111 m!147269))

(assert (=> d!38111 m!146941))

(assert (=> d!38111 m!146947))

(assert (=> d!38111 m!146953))

(assert (=> d!38111 m!146941))

(assert (=> b!126187 d!38111))

(assert (=> d!38037 d!38045))

(declare-fun b!126505 () Bool)

(declare-fun e!82616 () Bool)

(assert (=> b!126505 (= e!82616 (and (bvsge (extraKeys!2563 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!579 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!126503 () Bool)

(declare-fun res!61154 () Bool)

(assert (=> b!126503 (=> (not res!61154) (not e!82616))))

(declare-fun size!2483 (LongMapFixedSize!1060) (_ BitVec 32))

(assert (=> b!126503 (= res!61154 (bvsge (size!2483 newMap!16) (_size!579 newMap!16)))))

(declare-fun b!126502 () Bool)

(declare-fun res!61155 () Bool)

(assert (=> b!126502 (=> (not res!61155) (not e!82616))))

(assert (=> b!126502 (= res!61155 (and (= (size!2478 (_values!2765 newMap!16)) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001)) (= (size!2477 (_keys!4514 newMap!16)) (size!2478 (_values!2765 newMap!16))) (bvsge (_size!579 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!579 newMap!16) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!38113 () Bool)

(declare-fun res!61153 () Bool)

(assert (=> d!38113 (=> (not res!61153) (not e!82616))))

(assert (=> d!38113 (= res!61153 (validMask!0 (mask!7037 newMap!16)))))

(assert (=> d!38113 (= (simpleValid!87 newMap!16) e!82616)))

(declare-fun b!126504 () Bool)

(declare-fun res!61152 () Bool)

(assert (=> b!126504 (=> (not res!61152) (not e!82616))))

(assert (=> b!126504 (= res!61152 (= (size!2483 newMap!16) (bvadd (_size!579 newMap!16) (bvsdiv (bvadd (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!38113 res!61153) b!126502))

(assert (= (and b!126502 res!61155) b!126503))

(assert (= (and b!126503 res!61154) b!126504))

(assert (= (and b!126504 res!61152) b!126505))

(declare-fun m!147271 () Bool)

(assert (=> b!126503 m!147271))

(assert (=> d!38113 m!147061))

(assert (=> b!126504 m!147271))

(assert (=> d!38023 d!38113))

(declare-fun b!126506 () Bool)

(declare-fun e!82623 () ListLongMap!1647)

(declare-fun call!13604 () ListLongMap!1647)

(assert (=> b!126506 (= e!82623 call!13604)))

(declare-fun b!126507 () Bool)

(declare-fun e!82618 () Bool)

(declare-fun lt!65225 () ListLongMap!1647)

(assert (=> b!126507 (= e!82618 (= (apply!111 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!126508 () Bool)

(declare-fun e!82625 () Bool)

(assert (=> b!126508 (= e!82625 (= (apply!111 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!126509 () Bool)

(declare-fun e!82629 () ListLongMap!1647)

(declare-fun e!82628 () ListLongMap!1647)

(assert (=> b!126509 (= e!82629 e!82628)))

(declare-fun c!23137 () Bool)

(assert (=> b!126509 (= c!23137 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13599 () Bool)

(declare-fun call!13606 () ListLongMap!1647)

(assert (=> bm!13599 (= call!13604 call!13606)))

(declare-fun b!126510 () Bool)

(declare-fun res!61156 () Bool)

(declare-fun e!82621 () Bool)

(assert (=> b!126510 (=> (not res!61156) (not e!82621))))

(declare-fun e!82619 () Bool)

(assert (=> b!126510 (= res!61156 e!82619)))

(declare-fun res!61160 () Bool)

(assert (=> b!126510 (=> res!61160 e!82619)))

(declare-fun e!82626 () Bool)

(assert (=> b!126510 (= res!61160 (not e!82626))))

(declare-fun res!61162 () Bool)

(assert (=> b!126510 (=> (not res!61162) (not e!82626))))

(assert (=> b!126510 (= res!61162 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13600 () Bool)

(declare-fun call!13602 () ListLongMap!1647)

(declare-fun call!13607 () ListLongMap!1647)

(assert (=> bm!13600 (= call!13602 call!13607)))

(declare-fun b!126511 () Bool)

(declare-fun e!82620 () Bool)

(assert (=> b!126511 (= e!82620 e!82618)))

(declare-fun res!61161 () Bool)

(declare-fun call!13605 () Bool)

(assert (=> b!126511 (= res!61161 call!13605)))

(assert (=> b!126511 (=> (not res!61161) (not e!82618))))

(declare-fun bm!13601 () Bool)

(assert (=> bm!13601 (= call!13607 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126512 () Bool)

(declare-fun e!82617 () Bool)

(assert (=> b!126512 (= e!82619 e!82617)))

(declare-fun res!61159 () Bool)

(assert (=> b!126512 (=> (not res!61159) (not e!82617))))

(assert (=> b!126512 (= res!61159 (contains!867 lt!65225 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126513 () Bool)

(declare-fun e!82622 () Unit!3922)

(declare-fun Unit!3931 () Unit!3922)

(assert (=> b!126513 (= e!82622 Unit!3931)))

(declare-fun bm!13602 () Bool)

(declare-fun call!13608 () Bool)

(assert (=> bm!13602 (= call!13608 (contains!867 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126514 () Bool)

(declare-fun e!82627 () Bool)

(assert (=> b!126514 (= e!82627 e!82625)))

(declare-fun res!61157 () Bool)

(assert (=> b!126514 (= res!61157 call!13608)))

(assert (=> b!126514 (=> (not res!61157) (not e!82625))))

(declare-fun b!126515 () Bool)

(declare-fun c!23140 () Bool)

(assert (=> b!126515 (= c!23140 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126515 (= e!82628 e!82623)))

(declare-fun b!126516 () Bool)

(declare-fun e!82624 () Bool)

(assert (=> b!126516 (= e!82624 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38115 () Bool)

(assert (=> d!38115 e!82621))

(declare-fun res!61163 () Bool)

(assert (=> d!38115 (=> (not res!61163) (not e!82621))))

(assert (=> d!38115 (= res!61163 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65222 () ListLongMap!1647)

(assert (=> d!38115 (= lt!65225 lt!65222)))

(declare-fun lt!65232 () Unit!3922)

(assert (=> d!38115 (= lt!65232 e!82622)))

(declare-fun c!23138 () Bool)

(assert (=> d!38115 (= c!23138 e!82624)))

(declare-fun res!61164 () Bool)

(assert (=> d!38115 (=> (not res!61164) (not e!82624))))

(assert (=> d!38115 (= res!61164 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38115 (= lt!65222 e!82629)))

(declare-fun c!23139 () Bool)

(assert (=> d!38115 (= c!23139 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38115 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38115 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65225)))

(declare-fun b!126517 () Bool)

(assert (=> b!126517 (= e!82617 (= (apply!111 lt!65225 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (_values!2765 newMap!16))))))

(assert (=> b!126517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126518 () Bool)

(assert (=> b!126518 (= e!82626 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126519 () Bool)

(assert (=> b!126519 (= e!82628 call!13604)))

(declare-fun b!126520 () Bool)

(declare-fun lt!65226 () Unit!3922)

(assert (=> b!126520 (= e!82622 lt!65226)))

(declare-fun lt!65221 () ListLongMap!1647)

(assert (=> b!126520 (= lt!65221 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65234 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65231 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65231 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65239 () Unit!3922)

(assert (=> b!126520 (= lt!65239 (addStillContains!87 lt!65221 lt!65234 (zeroValue!2645 newMap!16) lt!65231))))

(assert (=> b!126520 (contains!867 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) lt!65231)))

(declare-fun lt!65238 () Unit!3922)

(assert (=> b!126520 (= lt!65238 lt!65239)))

(declare-fun lt!65236 () ListLongMap!1647)

(assert (=> b!126520 (= lt!65236 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65229 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65228 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65228 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65233 () Unit!3922)

(assert (=> b!126520 (= lt!65233 (addApplyDifferent!87 lt!65236 lt!65229 (minValue!2645 newMap!16) lt!65228))))

(assert (=> b!126520 (= (apply!111 (+!158 lt!65236 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) lt!65228) (apply!111 lt!65236 lt!65228))))

(declare-fun lt!65227 () Unit!3922)

(assert (=> b!126520 (= lt!65227 lt!65233)))

(declare-fun lt!65220 () ListLongMap!1647)

(assert (=> b!126520 (= lt!65220 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65218 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65223 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65223 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65224 () Unit!3922)

(assert (=> b!126520 (= lt!65224 (addApplyDifferent!87 lt!65220 lt!65218 (zeroValue!2645 newMap!16) lt!65223))))

(assert (=> b!126520 (= (apply!111 (+!158 lt!65220 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) lt!65223) (apply!111 lt!65220 lt!65223))))

(declare-fun lt!65237 () Unit!3922)

(assert (=> b!126520 (= lt!65237 lt!65224)))

(declare-fun lt!65235 () ListLongMap!1647)

(assert (=> b!126520 (= lt!65235 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65219 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65219 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65230 () (_ BitVec 64))

(assert (=> b!126520 (= lt!65230 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126520 (= lt!65226 (addApplyDifferent!87 lt!65235 lt!65219 (minValue!2645 newMap!16) lt!65230))))

(assert (=> b!126520 (= (apply!111 (+!158 lt!65235 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) lt!65230) (apply!111 lt!65235 lt!65230))))

(declare-fun bm!13603 () Bool)

(declare-fun call!13603 () ListLongMap!1647)

(assert (=> bm!13603 (= call!13606 (+!158 (ite c!23139 call!13607 (ite c!23137 call!13602 call!13603)) (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!126521 () Bool)

(assert (=> b!126521 (= e!82623 call!13603)))

(declare-fun b!126522 () Bool)

(assert (=> b!126522 (= e!82629 (+!158 call!13606 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13604 () Bool)

(assert (=> bm!13604 (= call!13603 call!13602)))

(declare-fun bm!13605 () Bool)

(assert (=> bm!13605 (= call!13605 (contains!867 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126523 () Bool)

(assert (=> b!126523 (= e!82627 (not call!13608))))

(declare-fun b!126524 () Bool)

(assert (=> b!126524 (= e!82621 e!82620)))

(declare-fun c!23141 () Bool)

(assert (=> b!126524 (= c!23141 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126525 () Bool)

(assert (=> b!126525 (= e!82620 (not call!13605))))

(declare-fun b!126526 () Bool)

(declare-fun res!61158 () Bool)

(assert (=> b!126526 (=> (not res!61158) (not e!82621))))

(assert (=> b!126526 (= res!61158 e!82627)))

(declare-fun c!23136 () Bool)

(assert (=> b!126526 (= c!23136 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38115 c!23139) b!126522))

(assert (= (and d!38115 (not c!23139)) b!126509))

(assert (= (and b!126509 c!23137) b!126519))

(assert (= (and b!126509 (not c!23137)) b!126515))

(assert (= (and b!126515 c!23140) b!126506))

(assert (= (and b!126515 (not c!23140)) b!126521))

(assert (= (or b!126506 b!126521) bm!13604))

(assert (= (or b!126519 bm!13604) bm!13600))

(assert (= (or b!126519 b!126506) bm!13599))

(assert (= (or b!126522 bm!13600) bm!13601))

(assert (= (or b!126522 bm!13599) bm!13603))

(assert (= (and d!38115 res!61164) b!126516))

(assert (= (and d!38115 c!23138) b!126520))

(assert (= (and d!38115 (not c!23138)) b!126513))

(assert (= (and d!38115 res!61163) b!126510))

(assert (= (and b!126510 res!61162) b!126518))

(assert (= (and b!126510 (not res!61160)) b!126512))

(assert (= (and b!126512 res!61159) b!126517))

(assert (= (and b!126510 res!61156) b!126526))

(assert (= (and b!126526 c!23136) b!126514))

(assert (= (and b!126526 (not c!23136)) b!126523))

(assert (= (and b!126514 res!61157) b!126508))

(assert (= (or b!126514 b!126523) bm!13602))

(assert (= (and b!126526 res!61158) b!126524))

(assert (= (and b!126524 c!23141) b!126511))

(assert (= (and b!126524 (not c!23141)) b!126525))

(assert (= (and b!126511 res!61161) b!126507))

(assert (= (or b!126511 b!126525) bm!13605))

(declare-fun b_lambda!5561 () Bool)

(assert (=> (not b_lambda!5561) (not b!126517)))

(declare-fun t!6042 () Bool)

(declare-fun tb!2313 () Bool)

(assert (=> (and b!126004 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16)) t!6042) tb!2313))

(declare-fun result!3843 () Bool)

(assert (=> tb!2313 (= result!3843 tp_is_empty!2839)))

(assert (=> b!126517 t!6042))

(declare-fun b_and!7773 () Bool)

(assert (= b_and!7769 (and (=> t!6042 result!3843) b_and!7773)))

(declare-fun t!6044 () Bool)

(declare-fun tb!2315 () Bool)

(assert (=> (and b!126008 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 newMap!16)) t!6044) tb!2315))

(declare-fun result!3845 () Bool)

(assert (= result!3845 result!3843))

(assert (=> b!126517 t!6044))

(declare-fun b_and!7775 () Bool)

(assert (= b_and!7771 (and (=> t!6044 result!3845) b_and!7775)))

(declare-fun m!147273 () Bool)

(assert (=> b!126520 m!147273))

(declare-fun m!147275 () Bool)

(assert (=> b!126520 m!147275))

(declare-fun m!147277 () Bool)

(assert (=> b!126520 m!147277))

(declare-fun m!147279 () Bool)

(assert (=> b!126520 m!147279))

(declare-fun m!147281 () Bool)

(assert (=> b!126520 m!147281))

(declare-fun m!147283 () Bool)

(assert (=> b!126520 m!147283))

(declare-fun m!147285 () Bool)

(assert (=> b!126520 m!147285))

(declare-fun m!147287 () Bool)

(assert (=> b!126520 m!147287))

(declare-fun m!147289 () Bool)

(assert (=> b!126520 m!147289))

(declare-fun m!147291 () Bool)

(assert (=> b!126520 m!147291))

(assert (=> b!126520 m!147283))

(declare-fun m!147293 () Bool)

(assert (=> b!126520 m!147293))

(assert (=> b!126520 m!147289))

(declare-fun m!147295 () Bool)

(assert (=> b!126520 m!147295))

(declare-fun m!147297 () Bool)

(assert (=> b!126520 m!147297))

(declare-fun m!147299 () Bool)

(assert (=> b!126520 m!147299))

(assert (=> b!126520 m!147277))

(declare-fun m!147301 () Bool)

(assert (=> b!126520 m!147301))

(assert (=> b!126520 m!147281))

(declare-fun m!147303 () Bool)

(assert (=> b!126520 m!147303))

(assert (=> b!126520 m!147085))

(assert (=> b!126518 m!147085))

(assert (=> b!126518 m!147085))

(assert (=> b!126518 m!147087))

(declare-fun m!147305 () Bool)

(assert (=> bm!13603 m!147305))

(declare-fun m!147307 () Bool)

(assert (=> b!126508 m!147307))

(assert (=> b!126517 m!147085))

(declare-fun m!147309 () Bool)

(assert (=> b!126517 m!147309))

(assert (=> b!126517 m!147085))

(declare-fun m!147311 () Bool)

(assert (=> b!126517 m!147311))

(assert (=> b!126517 m!147311))

(declare-fun m!147313 () Bool)

(assert (=> b!126517 m!147313))

(declare-fun m!147315 () Bool)

(assert (=> b!126517 m!147315))

(assert (=> b!126517 m!147313))

(declare-fun m!147317 () Bool)

(assert (=> b!126507 m!147317))

(assert (=> bm!13601 m!147287))

(assert (=> b!126512 m!147085))

(assert (=> b!126512 m!147085))

(declare-fun m!147319 () Bool)

(assert (=> b!126512 m!147319))

(declare-fun m!147321 () Bool)

(assert (=> bm!13602 m!147321))

(declare-fun m!147323 () Bool)

(assert (=> b!126522 m!147323))

(declare-fun m!147325 () Bool)

(assert (=> bm!13605 m!147325))

(assert (=> b!126516 m!147085))

(assert (=> b!126516 m!147085))

(assert (=> b!126516 m!147087))

(assert (=> d!38115 m!147061))

(assert (=> b!126306 d!38115))

(assert (=> b!126183 d!38079))

(assert (=> b!126316 d!38115))

(assert (=> bm!13577 d!38063))

(declare-fun d!38117 () Bool)

(declare-fun e!82630 () Bool)

(assert (=> d!38117 e!82630))

(declare-fun res!61165 () Bool)

(assert (=> d!38117 (=> res!61165 e!82630)))

(declare-fun lt!65242 () Bool)

(assert (=> d!38117 (= res!61165 (not lt!65242))))

(declare-fun lt!65240 () Bool)

(assert (=> d!38117 (= lt!65242 lt!65240)))

(declare-fun lt!65243 () Unit!3922)

(declare-fun e!82631 () Unit!3922)

(assert (=> d!38117 (= lt!65243 e!82631)))

(declare-fun c!23142 () Bool)

(assert (=> d!38117 (= c!23142 lt!65240)))

(assert (=> d!38117 (= lt!65240 (containsKey!169 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (=> d!38117 (= (contains!867 call!13567 (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))) lt!65242)))

(declare-fun b!126527 () Bool)

(declare-fun lt!65241 () Unit!3922)

(assert (=> b!126527 (= e!82631 lt!65241)))

(assert (=> b!126527 (= lt!65241 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (=> b!126527 (isDefined!119 (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(declare-fun b!126528 () Bool)

(declare-fun Unit!3932 () Unit!3922)

(assert (=> b!126528 (= e!82631 Unit!3932)))

(declare-fun b!126529 () Bool)

(assert (=> b!126529 (= e!82630 (isDefined!119 (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))))

(assert (= (and d!38117 c!23142) b!126527))

(assert (= (and d!38117 (not c!23142)) b!126528))

(assert (= (and d!38117 (not res!61165)) b!126529))

(assert (=> d!38117 m!147013))

(declare-fun m!147327 () Bool)

(assert (=> d!38117 m!147327))

(assert (=> b!126527 m!147013))

(declare-fun m!147329 () Bool)

(assert (=> b!126527 m!147329))

(assert (=> b!126527 m!147013))

(declare-fun m!147331 () Bool)

(assert (=> b!126527 m!147331))

(assert (=> b!126527 m!147331))

(declare-fun m!147333 () Bool)

(assert (=> b!126527 m!147333))

(assert (=> b!126529 m!147013))

(assert (=> b!126529 m!147331))

(assert (=> b!126529 m!147331))

(assert (=> b!126529 m!147333))

(assert (=> b!126318 d!38117))

(declare-fun d!38119 () Bool)

(declare-fun e!82634 () Bool)

(assert (=> d!38119 e!82634))

(declare-fun res!61168 () Bool)

(assert (=> d!38119 (=> (not res!61168) (not e!82634))))

(assert (=> d!38119 (= res!61168 (and (bvsge (index!3248 lt!65101) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65101) (size!2477 (_keys!4514 newMap!16)))))))

(declare-fun lt!65246 () Unit!3922)

(declare-fun choose!771 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) Unit!3922)

(assert (=> d!38119 (= lt!65246 (choose!771 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38119 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38119 (= (lemmaValidKeyInArrayIsInListMap!115 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (defaultEntry!2782 newMap!16)) lt!65246)))

(declare-fun b!126532 () Bool)

(assert (=> b!126532 (= e!82634 (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (= (and d!38119 res!61168) b!126532))

(declare-fun m!147335 () Bool)

(assert (=> d!38119 m!147335))

(assert (=> d!38119 m!147061))

(declare-fun m!147337 () Bool)

(assert (=> b!126532 m!147337))

(assert (=> b!126532 m!147013))

(assert (=> b!126532 m!147337))

(assert (=> b!126532 m!147013))

(declare-fun m!147339 () Bool)

(assert (=> b!126532 m!147339))

(assert (=> b!126318 d!38119))

(declare-fun d!38121 () Bool)

(declare-fun e!82637 () Bool)

(assert (=> d!38121 e!82637))

(declare-fun res!61171 () Bool)

(assert (=> d!38121 (=> (not res!61171) (not e!82637))))

(assert (=> d!38121 (= res!61171 (and (bvsge (index!3248 lt!65101) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65101) (size!2478 (_values!2765 newMap!16)))))))

(declare-fun lt!65249 () Unit!3922)

(declare-fun choose!772 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3922)

(assert (=> d!38121 (= lt!65249 (choose!772 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38121 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38121 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65249)))

(declare-fun b!126535 () Bool)

(assert (=> b!126535 (= e!82637 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))))

(assert (= (and d!38121 res!61171) b!126535))

(assert (=> d!38121 m!146811))

(assert (=> d!38121 m!146831))

(declare-fun m!147341 () Bool)

(assert (=> d!38121 m!147341))

(assert (=> d!38121 m!147061))

(assert (=> b!126535 m!146923))

(assert (=> b!126535 m!146923))

(declare-fun m!147343 () Bool)

(assert (=> b!126535 m!147343))

(assert (=> b!126535 m!146993))

(declare-fun m!147345 () Bool)

(assert (=> b!126535 m!147345))

(assert (=> b!126318 d!38121))

(declare-fun d!38123 () Bool)

(assert (=> d!38123 (= (apply!111 lt!65010 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1446 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5229 () Bool)

(assert (= bs!5229 d!38123))

(assert (=> bs!5229 m!146957))

(declare-fun m!147347 () Bool)

(assert (=> bs!5229 m!147347))

(assert (=> bs!5229 m!147347))

(declare-fun m!147349 () Bool)

(assert (=> bs!5229 m!147349))

(assert (=> b!126184 d!38123))

(declare-fun d!38125 () Bool)

(declare-fun c!23143 () Bool)

(assert (=> d!38125 (= c!23143 ((_ is ValueCellFull!1076) (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82638 () V!3433)

(assert (=> d!38125 (= (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82638)))

(declare-fun b!126536 () Bool)

(assert (=> b!126536 (= e!82638 (get!1444 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126537 () Bool)

(assert (=> b!126537 (= e!82638 (get!1445 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38125 c!23143) b!126536))

(assert (= (and d!38125 (not c!23143)) b!126537))

(assert (=> b!126536 m!146967))

(assert (=> b!126536 m!146829))

(declare-fun m!147351 () Bool)

(assert (=> b!126536 m!147351))

(assert (=> b!126537 m!146967))

(assert (=> b!126537 m!146829))

(declare-fun m!147353 () Bool)

(assert (=> b!126537 m!147353))

(assert (=> b!126184 d!38125))

(declare-fun d!38127 () Bool)

(declare-fun e!82641 () Bool)

(assert (=> d!38127 e!82641))

(declare-fun res!61177 () Bool)

(assert (=> d!38127 (=> (not res!61177) (not e!82641))))

(declare-fun lt!65255 () SeekEntryResult!273)

(assert (=> d!38127 (= res!61177 ((_ is Found!273) lt!65255))))

(assert (=> d!38127 (= lt!65255 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun lt!65254 () Unit!3922)

(declare-fun choose!773 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3922)

(assert (=> d!38127 (= lt!65254 (choose!773 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38127 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38127 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) lt!65254)))

(declare-fun b!126542 () Bool)

(declare-fun res!61176 () Bool)

(assert (=> b!126542 (=> (not res!61176) (not e!82641))))

(assert (=> b!126542 (= res!61176 (inRange!0 (index!3248 lt!65255) (mask!7037 newMap!16)))))

(declare-fun b!126543 () Bool)

(assert (=> b!126543 (= e!82641 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65255)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126543 (and (bvsge (index!3248 lt!65255) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65255) (size!2477 (_keys!4514 newMap!16))))))

(assert (= (and d!38127 res!61177) b!126542))

(assert (= (and b!126542 res!61176) b!126543))

(assert (=> d!38127 m!146811))

(assert (=> d!38127 m!147021))

(assert (=> d!38127 m!146811))

(declare-fun m!147355 () Bool)

(assert (=> d!38127 m!147355))

(assert (=> d!38127 m!147061))

(declare-fun m!147357 () Bool)

(assert (=> b!126542 m!147357))

(declare-fun m!147359 () Bool)

(assert (=> b!126543 m!147359))

(assert (=> bm!13578 d!38127))

(declare-fun b!126578 () Bool)

(declare-fun e!82658 () Unit!3922)

(declare-fun Unit!3933 () Unit!3922)

(assert (=> b!126578 (= e!82658 Unit!3933)))

(declare-fun lt!65321 () Unit!3922)

(declare-fun lemmaArrayContainsKeyThenInListMap!37 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) (_ BitVec 32) Int) Unit!3922)

(assert (=> b!126578 (= lt!65321 (lemmaArrayContainsKeyThenInListMap!37 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> b!126578 (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))

(declare-fun lt!65330 () Unit!3922)

(assert (=> b!126578 (= lt!65330 lt!65321)))

(assert (=> b!126578 false))

(declare-fun call!13618 () SeekEntryResult!273)

(declare-fun bm!13614 () Bool)

(assert (=> bm!13614 (= call!13618 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!126579 () Bool)

(declare-fun c!23155 () Bool)

(declare-fun lt!65332 () SeekEntryResult!273)

(assert (=> b!126579 (= c!23155 ((_ is MissingVacant!273) lt!65332))))

(declare-fun e!82662 () Bool)

(declare-fun e!82663 () Bool)

(assert (=> b!126579 (= e!82662 e!82663)))

(declare-fun d!38129 () Bool)

(declare-fun e!82664 () Bool)

(assert (=> d!38129 e!82664))

(declare-fun res!61202 () Bool)

(assert (=> d!38129 (=> (not res!61202) (not e!82664))))

(declare-fun lt!65342 () tuple2!2544)

(assert (=> d!38129 (= res!61202 (_1!1283 lt!65342))))

(assert (=> d!38129 (= lt!65342 (tuple2!2545 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd (_size!579 newMap!16) #b00000000000000000000000000000001) (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (_vacant!579 newMap!16))))))

(declare-fun lt!65343 () Unit!3922)

(declare-fun lt!65335 () Unit!3922)

(assert (=> d!38129 (= lt!65343 lt!65335)))

(declare-fun lt!65316 () array!4675)

(declare-fun lt!65319 () array!4677)

(assert (=> d!38129 (contains!867 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(assert (=> d!38129 (= lt!65335 (lemmaValidKeyInArrayIsInListMap!115 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38129 (= lt!65319 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))))

(assert (=> d!38129 (= lt!65316 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun lt!65326 () Unit!3922)

(declare-fun lt!65329 () Unit!3922)

(assert (=> d!38129 (= lt!65326 lt!65329)))

(declare-fun lt!65328 () array!4675)

(assert (=> d!38129 (= (arrayCountValidKeys!0 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4675 (_ BitVec 32)) Unit!3922)

(assert (=> d!38129 (= lt!65329 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(assert (=> d!38129 (= lt!65328 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun lt!65333 () Unit!3922)

(declare-fun lt!65331 () Unit!3922)

(assert (=> d!38129 (= lt!65333 lt!65331)))

(declare-fun lt!65320 () array!4675)

(assert (=> d!38129 (arrayContainsKey!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!38129 (= lt!65331 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(assert (=> d!38129 (= lt!65320 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun lt!65334 () Unit!3922)

(declare-fun lt!65337 () Unit!3922)

(assert (=> d!38129 (= lt!65334 lt!65337)))

(assert (=> d!38129 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!37 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3922)

(assert (=> d!38129 (= lt!65337 (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65327 () Unit!3922)

(declare-fun lt!65325 () Unit!3922)

(assert (=> d!38129 (= lt!65327 lt!65325)))

(assert (=> d!38129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (mask!7037 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4675 (_ BitVec 32) (_ BitVec 32)) Unit!3922)

(assert (=> d!38129 (= lt!65325 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (mask!7037 newMap!16)))))

(declare-fun lt!65323 () Unit!3922)

(declare-fun lt!65338 () Unit!3922)

(assert (=> d!38129 (= lt!65323 lt!65338)))

(assert (=> d!38129 (= (arrayCountValidKeys!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4675 (_ BitVec 32) (_ BitVec 64)) Unit!3922)

(assert (=> d!38129 (= lt!65338 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun lt!65340 () Unit!3922)

(declare-fun lt!65339 () Unit!3922)

(assert (=> d!38129 (= lt!65340 lt!65339)))

(declare-fun lt!65318 () (_ BitVec 32))

(declare-fun lt!65345 () List!1694)

(assert (=> d!38129 (arrayNoDuplicates!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) lt!65318 lt!65345)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4675 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1694) Unit!3922)

(assert (=> d!38129 (= lt!65339 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) lt!65318 lt!65345))))

(assert (=> d!38129 (= lt!65345 Nil!1691)))

(assert (=> d!38129 (= lt!65318 #b00000000000000000000000000000000)))

(declare-fun lt!65322 () Unit!3922)

(assert (=> d!38129 (= lt!65322 e!82658)))

(declare-fun c!23154 () Bool)

(assert (=> d!38129 (= c!23154 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!65336 () Unit!3922)

(declare-fun e!82661 () Unit!3922)

(assert (=> d!38129 (= lt!65336 e!82661)))

(declare-fun c!23153 () Bool)

(assert (=> d!38129 (= c!23153 (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38129 (valid!509 newMap!16)))

(assert (=> d!38129 (= (updateHelperNewKey!56 newMap!16 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))) lt!65342)))

(declare-fun call!13620 () Bool)

(declare-fun bm!13615 () Bool)

(assert (=> bm!13615 (= call!13620 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126580 () Bool)

(declare-fun res!61196 () Bool)

(declare-fun e!82659 () Bool)

(assert (=> b!126580 (=> (not res!61196) (not e!82659))))

(declare-fun call!13619 () Bool)

(assert (=> b!126580 (= res!61196 call!13619)))

(assert (=> b!126580 (= e!82662 e!82659)))

(declare-fun b!126581 () Bool)

(declare-fun Unit!3934 () Unit!3922)

(assert (=> b!126581 (= e!82661 Unit!3934)))

(declare-fun lt!65344 () Unit!3922)

(assert (=> b!126581 (= lt!65344 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65341 () SeekEntryResult!273)

(assert (=> b!126581 (= lt!65341 call!13618)))

(declare-fun res!61199 () Bool)

(assert (=> b!126581 (= res!61199 ((_ is Found!273) lt!65341))))

(declare-fun e!82665 () Bool)

(assert (=> b!126581 (=> (not res!61199) (not e!82665))))

(assert (=> b!126581 e!82665))

(declare-fun lt!65317 () Unit!3922)

(assert (=> b!126581 (= lt!65317 lt!65344)))

(assert (=> b!126581 false))

(declare-fun b!126582 () Bool)

(declare-fun res!61203 () Bool)

(declare-fun call!13617 () Bool)

(assert (=> b!126582 (= res!61203 call!13617)))

(assert (=> b!126582 (=> (not res!61203) (not e!82665))))

(declare-fun b!126583 () Bool)

(assert (=> b!126583 (= e!82664 (= (map!1369 (_2!1283 lt!65342)) (+!158 (map!1369 newMap!16) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126584 () Bool)

(declare-fun res!61204 () Bool)

(assert (=> b!126584 (=> (not res!61204) (not e!82659))))

(assert (=> b!126584 (= res!61204 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126585 () Bool)

(declare-fun res!61201 () Bool)

(assert (=> b!126585 (=> (not res!61201) (not e!82664))))

(assert (=> b!126585 (= res!61201 (valid!509 (_2!1283 lt!65342)))))

(declare-fun b!126586 () Bool)

(assert (=> b!126586 (= e!82659 (not call!13620))))

(declare-fun b!126587 () Bool)

(assert (=> b!126587 (= e!82665 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65341)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun c!23152 () Bool)

(declare-fun bm!13616 () Bool)

(assert (=> bm!13616 (= call!13617 (inRange!0 (ite c!23153 (index!3248 lt!65341) (ite c!23152 (index!3247 lt!65332) (index!3250 lt!65332))) (mask!7037 newMap!16)))))

(declare-fun b!126588 () Bool)

(declare-fun e!82660 () Bool)

(assert (=> b!126588 (= e!82663 e!82660)))

(declare-fun res!61200 () Bool)

(assert (=> b!126588 (= res!61200 call!13619)))

(assert (=> b!126588 (=> (not res!61200) (not e!82660))))

(declare-fun b!126589 () Bool)

(declare-fun Unit!3935 () Unit!3922)

(assert (=> b!126589 (= e!82658 Unit!3935)))

(declare-fun b!126590 () Bool)

(assert (=> b!126590 (= e!82663 ((_ is Undefined!273) lt!65332))))

(declare-fun b!126591 () Bool)

(assert (=> b!126591 (= e!82660 (not call!13620))))

(declare-fun b!126592 () Bool)

(declare-fun lt!65324 () Unit!3922)

(assert (=> b!126592 (= e!82661 lt!65324)))

(assert (=> b!126592 (= lt!65324 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126592 (= lt!65332 call!13618)))

(assert (=> b!126592 (= c!23152 ((_ is MissingZero!273) lt!65332))))

(assert (=> b!126592 e!82662))

(declare-fun b!126593 () Bool)

(declare-fun res!61198 () Bool)

(assert (=> b!126593 (= res!61198 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126593 (=> (not res!61198) (not e!82660))))

(declare-fun b!126594 () Bool)

(declare-fun res!61197 () Bool)

(assert (=> b!126594 (=> (not res!61197) (not e!82664))))

(assert (=> b!126594 (= res!61197 (contains!867 (map!1369 (_2!1283 lt!65342)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun bm!13617 () Bool)

(assert (=> bm!13617 (= call!13619 call!13617)))

(assert (= (and d!38129 c!23153) b!126581))

(assert (= (and d!38129 (not c!23153)) b!126592))

(assert (= (and b!126581 res!61199) b!126582))

(assert (= (and b!126582 res!61203) b!126587))

(assert (= (and b!126592 c!23152) b!126580))

(assert (= (and b!126592 (not c!23152)) b!126579))

(assert (= (and b!126580 res!61196) b!126584))

(assert (= (and b!126584 res!61204) b!126586))

(assert (= (and b!126579 c!23155) b!126588))

(assert (= (and b!126579 (not c!23155)) b!126590))

(assert (= (and b!126588 res!61200) b!126593))

(assert (= (and b!126593 res!61198) b!126591))

(assert (= (or b!126580 b!126588) bm!13617))

(assert (= (or b!126586 b!126591) bm!13615))

(assert (= (or b!126582 bm!13617) bm!13616))

(assert (= (or b!126581 b!126592) bm!13614))

(assert (= (and d!38129 c!23154) b!126578))

(assert (= (and d!38129 (not c!23154)) b!126589))

(assert (= (and d!38129 res!61202) b!126585))

(assert (= (and b!126585 res!61201) b!126594))

(assert (= (and b!126594 res!61197) b!126583))

(declare-fun m!147361 () Bool)

(assert (=> bm!13616 m!147361))

(assert (=> b!126578 m!146811))

(declare-fun m!147363 () Bool)

(assert (=> b!126578 m!147363))

(assert (=> b!126578 m!146923))

(assert (=> b!126578 m!146923))

(assert (=> b!126578 m!146811))

(declare-fun m!147365 () Bool)

(assert (=> b!126578 m!147365))

(assert (=> b!126581 m!146811))

(assert (=> b!126581 m!146999))

(declare-fun m!147367 () Bool)

(assert (=> b!126593 m!147367))

(declare-fun m!147369 () Bool)

(assert (=> b!126594 m!147369))

(assert (=> b!126594 m!147369))

(assert (=> b!126594 m!146811))

(declare-fun m!147371 () Bool)

(assert (=> b!126594 m!147371))

(assert (=> bm!13615 m!146811))

(assert (=> bm!13615 m!147005))

(declare-fun m!147373 () Bool)

(assert (=> b!126587 m!147373))

(declare-fun m!147375 () Bool)

(assert (=> b!126585 m!147375))

(declare-fun m!147377 () Bool)

(assert (=> b!126584 m!147377))

(assert (=> b!126592 m!146811))

(assert (=> b!126592 m!147037))

(assert (=> b!126583 m!147369))

(assert (=> b!126583 m!146813))

(assert (=> b!126583 m!146813))

(declare-fun m!147379 () Bool)

(assert (=> b!126583 m!147379))

(declare-fun m!147381 () Bool)

(assert (=> d!38129 m!147381))

(declare-fun m!147383 () Bool)

(assert (=> d!38129 m!147383))

(declare-fun m!147385 () Bool)

(assert (=> d!38129 m!147385))

(declare-fun m!147387 () Bool)

(assert (=> d!38129 m!147387))

(assert (=> d!38129 m!146811))

(assert (=> d!38129 m!146831))

(declare-fun m!147389 () Bool)

(assert (=> d!38129 m!147389))

(declare-fun m!147391 () Bool)

(assert (=> d!38129 m!147391))

(declare-fun m!147393 () Bool)

(assert (=> d!38129 m!147393))

(assert (=> d!38129 m!146923))

(assert (=> d!38129 m!147343))

(assert (=> d!38129 m!146811))

(declare-fun m!147395 () Bool)

(assert (=> d!38129 m!147395))

(declare-fun m!147397 () Bool)

(assert (=> d!38129 m!147397))

(declare-fun m!147399 () Bool)

(assert (=> d!38129 m!147399))

(assert (=> d!38129 m!146843))

(assert (=> d!38129 m!146811))

(declare-fun m!147401 () Bool)

(assert (=> d!38129 m!147401))

(assert (=> d!38129 m!146811))

(declare-fun m!147403 () Bool)

(assert (=> d!38129 m!147403))

(assert (=> d!38129 m!146923))

(assert (=> d!38129 m!147387))

(assert (=> d!38129 m!147399))

(declare-fun m!147405 () Bool)

(assert (=> d!38129 m!147405))

(assert (=> d!38129 m!146915))

(declare-fun m!147407 () Bool)

(assert (=> d!38129 m!147407))

(declare-fun m!147409 () Bool)

(assert (=> d!38129 m!147409))

(assert (=> d!38129 m!146811))

(assert (=> d!38129 m!147005))

(assert (=> d!38129 m!146923))

(assert (=> d!38129 m!146811))

(assert (=> d!38129 m!147365))

(assert (=> d!38129 m!146811))

(declare-fun m!147411 () Bool)

(assert (=> d!38129 m!147411))

(assert (=> d!38129 m!146811))

(declare-fun m!147413 () Bool)

(assert (=> d!38129 m!147413))

(declare-fun m!147415 () Bool)

(assert (=> d!38129 m!147415))

(assert (=> bm!13614 m!146811))

(assert (=> bm!13614 m!147021))

(assert (=> bm!13568 d!38129))

(declare-fun d!38131 () Bool)

(declare-fun e!82666 () Bool)

(assert (=> d!38131 e!82666))

(declare-fun res!61205 () Bool)

(assert (=> d!38131 (=> res!61205 e!82666)))

(declare-fun lt!65348 () Bool)

(assert (=> d!38131 (= res!61205 (not lt!65348))))

(declare-fun lt!65346 () Bool)

(assert (=> d!38131 (= lt!65348 lt!65346)))

(declare-fun lt!65349 () Unit!3922)

(declare-fun e!82667 () Unit!3922)

(assert (=> d!38131 (= lt!65349 e!82667)))

(declare-fun c!23156 () Bool)

(assert (=> d!38131 (= c!23156 lt!65346)))

(assert (=> d!38131 (= lt!65346 (containsKey!169 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38131 (= (contains!867 lt!65010 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65348)))

(declare-fun b!126595 () Bool)

(declare-fun lt!65347 () Unit!3922)

(assert (=> b!126595 (= e!82667 lt!65347)))

(assert (=> b!126595 (= lt!65347 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126595 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126596 () Bool)

(declare-fun Unit!3936 () Unit!3922)

(assert (=> b!126596 (= e!82667 Unit!3936)))

(declare-fun b!126597 () Bool)

(assert (=> b!126597 (= e!82666 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38131 c!23156) b!126595))

(assert (= (and d!38131 (not c!23156)) b!126596))

(assert (= (and d!38131 (not res!61205)) b!126597))

(declare-fun m!147417 () Bool)

(assert (=> d!38131 m!147417))

(declare-fun m!147419 () Bool)

(assert (=> b!126595 m!147419))

(assert (=> b!126595 m!147067))

(assert (=> b!126595 m!147067))

(declare-fun m!147421 () Bool)

(assert (=> b!126595 m!147421))

(assert (=> b!126597 m!147067))

(assert (=> b!126597 m!147067))

(assert (=> b!126597 m!147421))

(assert (=> bm!13511 d!38131))

(declare-fun d!38133 () Bool)

(assert (=> d!38133 (= (get!1444 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3116 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126333 d!38133))

(declare-fun b!126598 () Bool)

(declare-fun e!82674 () ListLongMap!1647)

(declare-fun call!13623 () ListLongMap!1647)

(assert (=> b!126598 (= e!82674 call!13623)))

(declare-fun e!82669 () Bool)

(declare-fun lt!65357 () ListLongMap!1647)

(declare-fun b!126599 () Bool)

(assert (=> b!126599 (= e!82669 (= (apply!111 lt!65357 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))

(declare-fun b!126600 () Bool)

(declare-fun e!82676 () Bool)

(assert (=> b!126600 (= e!82676 (= (apply!111 lt!65357 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!126601 () Bool)

(declare-fun e!82680 () ListLongMap!1647)

(declare-fun e!82679 () ListLongMap!1647)

(assert (=> b!126601 (= e!82680 e!82679)))

(declare-fun c!23158 () Bool)

(assert (=> b!126601 (= c!23158 (and (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13618 () Bool)

(declare-fun call!13625 () ListLongMap!1647)

(assert (=> bm!13618 (= call!13623 call!13625)))

(declare-fun b!126602 () Bool)

(declare-fun res!61206 () Bool)

(declare-fun e!82672 () Bool)

(assert (=> b!126602 (=> (not res!61206) (not e!82672))))

(declare-fun e!82670 () Bool)

(assert (=> b!126602 (= res!61206 e!82670)))

(declare-fun res!61210 () Bool)

(assert (=> b!126602 (=> res!61210 e!82670)))

(declare-fun e!82677 () Bool)

(assert (=> b!126602 (= res!61210 (not e!82677))))

(declare-fun res!61212 () Bool)

(assert (=> b!126602 (=> (not res!61212) (not e!82677))))

(assert (=> b!126602 (= res!61212 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13619 () Bool)

(declare-fun call!13621 () ListLongMap!1647)

(declare-fun call!13626 () ListLongMap!1647)

(assert (=> bm!13619 (= call!13621 call!13626)))

(declare-fun b!126603 () Bool)

(declare-fun e!82671 () Bool)

(assert (=> b!126603 (= e!82671 e!82669)))

(declare-fun res!61211 () Bool)

(declare-fun call!13624 () Bool)

(assert (=> b!126603 (= res!61211 call!13624)))

(assert (=> b!126603 (=> (not res!61211) (not e!82669))))

(declare-fun bm!13620 () Bool)

(assert (=> bm!13620 (= call!13626 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126604 () Bool)

(declare-fun e!82668 () Bool)

(assert (=> b!126604 (= e!82670 e!82668)))

(declare-fun res!61209 () Bool)

(assert (=> b!126604 (=> (not res!61209) (not e!82668))))

(assert (=> b!126604 (= res!61209 (contains!867 lt!65357 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126605 () Bool)

(declare-fun e!82673 () Unit!3922)

(declare-fun Unit!3937 () Unit!3922)

(assert (=> b!126605 (= e!82673 Unit!3937)))

(declare-fun bm!13621 () Bool)

(declare-fun call!13627 () Bool)

(assert (=> bm!13621 (= call!13627 (contains!867 lt!65357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126606 () Bool)

(declare-fun e!82678 () Bool)

(assert (=> b!126606 (= e!82678 e!82676)))

(declare-fun res!61207 () Bool)

(assert (=> b!126606 (= res!61207 call!13627)))

(assert (=> b!126606 (=> (not res!61207) (not e!82676))))

(declare-fun b!126607 () Bool)

(declare-fun c!23161 () Bool)

(assert (=> b!126607 (= c!23161 (and (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126607 (= e!82679 e!82674)))

(declare-fun b!126608 () Bool)

(declare-fun e!82675 () Bool)

(assert (=> b!126608 (= e!82675 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38135 () Bool)

(assert (=> d!38135 e!82672))

(declare-fun res!61213 () Bool)

(assert (=> d!38135 (=> (not res!61213) (not e!82672))))

(assert (=> d!38135 (= res!61213 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65354 () ListLongMap!1647)

(assert (=> d!38135 (= lt!65357 lt!65354)))

(declare-fun lt!65364 () Unit!3922)

(assert (=> d!38135 (= lt!65364 e!82673)))

(declare-fun c!23159 () Bool)

(assert (=> d!38135 (= c!23159 e!82675)))

(declare-fun res!61214 () Bool)

(assert (=> d!38135 (=> (not res!61214) (not e!82675))))

(assert (=> d!38135 (= res!61214 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38135 (= lt!65354 e!82680)))

(declare-fun c!23160 () Bool)

(assert (=> d!38135 (= c!23160 (and (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38135 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38135 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65357)))

(declare-fun b!126609 () Bool)

(assert (=> b!126609 (= e!82668 (= (apply!111 lt!65357 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098))))))

(assert (=> b!126609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126610 () Bool)

(assert (=> b!126610 (= e!82677 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126611 () Bool)

(assert (=> b!126611 (= e!82679 call!13623)))

(declare-fun b!126612 () Bool)

(declare-fun lt!65358 () Unit!3922)

(assert (=> b!126612 (= e!82673 lt!65358)))

(declare-fun lt!65353 () ListLongMap!1647)

(assert (=> b!126612 (= lt!65353 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65366 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65366 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65363 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65363 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65371 () Unit!3922)

(assert (=> b!126612 (= lt!65371 (addStillContains!87 lt!65353 lt!65366 (zeroValue!2645 newMap!16) lt!65363))))

(assert (=> b!126612 (contains!867 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) lt!65363)))

(declare-fun lt!65370 () Unit!3922)

(assert (=> b!126612 (= lt!65370 lt!65371)))

(declare-fun lt!65368 () ListLongMap!1647)

(assert (=> b!126612 (= lt!65368 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65361 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65361 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65360 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65360 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65365 () Unit!3922)

(assert (=> b!126612 (= lt!65365 (addApplyDifferent!87 lt!65368 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65360))))

(assert (=> b!126612 (= (apply!111 (+!158 lt!65368 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65360) (apply!111 lt!65368 lt!65360))))

(declare-fun lt!65359 () Unit!3922)

(assert (=> b!126612 (= lt!65359 lt!65365)))

(declare-fun lt!65352 () ListLongMap!1647)

(assert (=> b!126612 (= lt!65352 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65350 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65355 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65355 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65356 () Unit!3922)

(assert (=> b!126612 (= lt!65356 (addApplyDifferent!87 lt!65352 lt!65350 (zeroValue!2645 newMap!16) lt!65355))))

(assert (=> b!126612 (= (apply!111 (+!158 lt!65352 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) lt!65355) (apply!111 lt!65352 lt!65355))))

(declare-fun lt!65369 () Unit!3922)

(assert (=> b!126612 (= lt!65369 lt!65356)))

(declare-fun lt!65367 () ListLongMap!1647)

(assert (=> b!126612 (= lt!65367 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65351 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65351 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65362 () (_ BitVec 64))

(assert (=> b!126612 (= lt!65362 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126612 (= lt!65358 (addApplyDifferent!87 lt!65367 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65362))))

(assert (=> b!126612 (= (apply!111 (+!158 lt!65367 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65362) (apply!111 lt!65367 lt!65362))))

(declare-fun bm!13622 () Bool)

(declare-fun call!13622 () ListLongMap!1647)

(assert (=> bm!13622 (= call!13625 (+!158 (ite c!23160 call!13626 (ite c!23158 call!13621 call!13622)) (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun b!126613 () Bool)

(assert (=> b!126613 (= e!82674 call!13622)))

(declare-fun b!126614 () Bool)

(assert (=> b!126614 (= e!82680 (+!158 call!13625 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(declare-fun bm!13623 () Bool)

(assert (=> bm!13623 (= call!13622 call!13621)))

(declare-fun bm!13624 () Bool)

(assert (=> bm!13624 (= call!13624 (contains!867 lt!65357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126615 () Bool)

(assert (=> b!126615 (= e!82678 (not call!13627))))

(declare-fun b!126616 () Bool)

(assert (=> b!126616 (= e!82672 e!82671)))

(declare-fun c!23162 () Bool)

(assert (=> b!126616 (= c!23162 (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126617 () Bool)

(assert (=> b!126617 (= e!82671 (not call!13624))))

(declare-fun b!126618 () Bool)

(declare-fun res!61208 () Bool)

(assert (=> b!126618 (=> (not res!61208) (not e!82672))))

(assert (=> b!126618 (= res!61208 e!82678)))

(declare-fun c!23157 () Bool)

(assert (=> b!126618 (= c!23157 (not (= (bvand (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38135 c!23160) b!126614))

(assert (= (and d!38135 (not c!23160)) b!126601))

(assert (= (and b!126601 c!23158) b!126611))

(assert (= (and b!126601 (not c!23158)) b!126607))

(assert (= (and b!126607 c!23161) b!126598))

(assert (= (and b!126607 (not c!23161)) b!126613))

(assert (= (or b!126598 b!126613) bm!13623))

(assert (= (or b!126611 bm!13623) bm!13619))

(assert (= (or b!126611 b!126598) bm!13618))

(assert (= (or b!126614 bm!13619) bm!13620))

(assert (= (or b!126614 bm!13618) bm!13622))

(assert (= (and d!38135 res!61214) b!126608))

(assert (= (and d!38135 c!23159) b!126612))

(assert (= (and d!38135 (not c!23159)) b!126605))

(assert (= (and d!38135 res!61213) b!126602))

(assert (= (and b!126602 res!61212) b!126610))

(assert (= (and b!126602 (not res!61210)) b!126604))

(assert (= (and b!126604 res!61209) b!126609))

(assert (= (and b!126602 res!61206) b!126618))

(assert (= (and b!126618 c!23157) b!126606))

(assert (= (and b!126618 (not c!23157)) b!126615))

(assert (= (and b!126606 res!61207) b!126600))

(assert (= (or b!126606 b!126615) bm!13621))

(assert (= (and b!126618 res!61208) b!126616))

(assert (= (and b!126616 c!23162) b!126603))

(assert (= (and b!126616 (not c!23162)) b!126617))

(assert (= (and b!126603 res!61211) b!126599))

(assert (= (or b!126603 b!126617) bm!13624))

(declare-fun b_lambda!5563 () Bool)

(assert (=> (not b_lambda!5563) (not b!126609)))

(assert (=> b!126609 t!6042))

(declare-fun b_and!7777 () Bool)

(assert (= b_and!7773 (and (=> t!6042 result!3843) b_and!7777)))

(assert (=> b!126609 t!6044))

(declare-fun b_and!7779 () Bool)

(assert (= b_and!7775 (and (=> t!6044 result!3845) b_and!7779)))

(declare-fun m!147423 () Bool)

(assert (=> b!126612 m!147423))

(declare-fun m!147425 () Bool)

(assert (=> b!126612 m!147425))

(declare-fun m!147427 () Bool)

(assert (=> b!126612 m!147427))

(declare-fun m!147429 () Bool)

(assert (=> b!126612 m!147429))

(declare-fun m!147431 () Bool)

(assert (=> b!126612 m!147431))

(declare-fun m!147433 () Bool)

(assert (=> b!126612 m!147433))

(declare-fun m!147435 () Bool)

(assert (=> b!126612 m!147435))

(declare-fun m!147437 () Bool)

(assert (=> b!126612 m!147437))

(declare-fun m!147439 () Bool)

(assert (=> b!126612 m!147439))

(declare-fun m!147441 () Bool)

(assert (=> b!126612 m!147441))

(assert (=> b!126612 m!147433))

(declare-fun m!147443 () Bool)

(assert (=> b!126612 m!147443))

(assert (=> b!126612 m!147439))

(declare-fun m!147445 () Bool)

(assert (=> b!126612 m!147445))

(declare-fun m!147447 () Bool)

(assert (=> b!126612 m!147447))

(declare-fun m!147449 () Bool)

(assert (=> b!126612 m!147449))

(assert (=> b!126612 m!147427))

(declare-fun m!147451 () Bool)

(assert (=> b!126612 m!147451))

(assert (=> b!126612 m!147431))

(declare-fun m!147453 () Bool)

(assert (=> b!126612 m!147453))

(assert (=> b!126612 m!147085))

(assert (=> b!126610 m!147085))

(assert (=> b!126610 m!147085))

(assert (=> b!126610 m!147087))

(declare-fun m!147455 () Bool)

(assert (=> bm!13622 m!147455))

(declare-fun m!147457 () Bool)

(assert (=> b!126600 m!147457))

(assert (=> b!126609 m!147085))

(declare-fun m!147459 () Bool)

(assert (=> b!126609 m!147459))

(assert (=> b!126609 m!147085))

(declare-fun m!147461 () Bool)

(assert (=> b!126609 m!147461))

(assert (=> b!126609 m!147461))

(assert (=> b!126609 m!147313))

(declare-fun m!147463 () Bool)

(assert (=> b!126609 m!147463))

(assert (=> b!126609 m!147313))

(declare-fun m!147465 () Bool)

(assert (=> b!126599 m!147465))

(assert (=> bm!13620 m!147437))

(assert (=> b!126604 m!147085))

(assert (=> b!126604 m!147085))

(declare-fun m!147467 () Bool)

(assert (=> b!126604 m!147467))

(declare-fun m!147469 () Bool)

(assert (=> bm!13621 m!147469))

(declare-fun m!147471 () Bool)

(assert (=> b!126614 m!147471))

(declare-fun m!147473 () Bool)

(assert (=> bm!13624 m!147473))

(assert (=> b!126608 m!147085))

(assert (=> b!126608 m!147085))

(assert (=> b!126608 m!147087))

(assert (=> d!38135 m!147061))

(assert (=> bm!13566 d!38135))

(declare-fun b!126635 () Bool)

(declare-fun e!82691 () Bool)

(declare-fun e!82690 () Bool)

(assert (=> b!126635 (= e!82691 e!82690)))

(declare-fun res!61224 () Bool)

(declare-fun call!13632 () Bool)

(assert (=> b!126635 (= res!61224 call!13632)))

(assert (=> b!126635 (=> (not res!61224) (not e!82690))))

(declare-fun b!126636 () Bool)

(declare-fun call!13633 () Bool)

(assert (=> b!126636 (= e!82690 (not call!13633))))

(declare-fun b!126637 () Bool)

(declare-fun res!61226 () Bool)

(declare-fun e!82692 () Bool)

(assert (=> b!126637 (=> (not res!61226) (not e!82692))))

(assert (=> b!126637 (= res!61226 call!13632)))

(declare-fun e!82689 () Bool)

(assert (=> b!126637 (= e!82689 e!82692)))

(declare-fun d!38137 () Bool)

(assert (=> d!38137 e!82691))

(declare-fun c!23167 () Bool)

(declare-fun lt!65376 () SeekEntryResult!273)

(assert (=> d!38137 (= c!23167 ((_ is MissingZero!273) lt!65376))))

(assert (=> d!38137 (= lt!65376 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun lt!65377 () Unit!3922)

(declare-fun choose!774 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3922)

(assert (=> d!38137 (= lt!65377 (choose!774 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38137 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38137 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) lt!65377)))

(declare-fun bm!13629 () Bool)

(assert (=> bm!13629 (= call!13633 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126638 () Bool)

(declare-fun res!61225 () Bool)

(assert (=> b!126638 (=> (not res!61225) (not e!82692))))

(assert (=> b!126638 (= res!61225 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65376)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126638 (and (bvsge (index!3250 lt!65376) #b00000000000000000000000000000000) (bvslt (index!3250 lt!65376) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13630 () Bool)

(assert (=> bm!13630 (= call!13632 (inRange!0 (ite c!23167 (index!3247 lt!65376) (index!3250 lt!65376)) (mask!7037 newMap!16)))))

(declare-fun b!126639 () Bool)

(assert (=> b!126639 (= e!82689 ((_ is Undefined!273) lt!65376))))

(declare-fun b!126640 () Bool)

(assert (=> b!126640 (= e!82691 e!82689)))

(declare-fun c!23168 () Bool)

(assert (=> b!126640 (= c!23168 ((_ is MissingVacant!273) lt!65376))))

(declare-fun b!126641 () Bool)

(assert (=> b!126641 (= e!82692 (not call!13633))))

(declare-fun b!126642 () Bool)

(assert (=> b!126642 (and (bvsge (index!3247 lt!65376) #b00000000000000000000000000000000) (bvslt (index!3247 lt!65376) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61223 () Bool)

(assert (=> b!126642 (= res!61223 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65376)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126642 (=> (not res!61223) (not e!82690))))

(assert (= (and d!38137 c!23167) b!126635))

(assert (= (and d!38137 (not c!23167)) b!126640))

(assert (= (and b!126635 res!61224) b!126642))

(assert (= (and b!126642 res!61223) b!126636))

(assert (= (and b!126640 c!23168) b!126637))

(assert (= (and b!126640 (not c!23168)) b!126639))

(assert (= (and b!126637 res!61226) b!126638))

(assert (= (and b!126638 res!61225) b!126641))

(assert (= (or b!126635 b!126637) bm!13630))

(assert (= (or b!126636 b!126641) bm!13629))

(declare-fun m!147475 () Bool)

(assert (=> b!126642 m!147475))

(assert (=> d!38137 m!146811))

(assert (=> d!38137 m!147021))

(assert (=> d!38137 m!146811))

(declare-fun m!147477 () Bool)

(assert (=> d!38137 m!147477))

(assert (=> d!38137 m!147061))

(declare-fun m!147479 () Bool)

(assert (=> bm!13630 m!147479))

(assert (=> bm!13629 m!146811))

(assert (=> bm!13629 m!147005))

(declare-fun m!147481 () Bool)

(assert (=> b!126638 m!147481))

(assert (=> bm!13576 d!38137))

(declare-fun d!38139 () Bool)

(assert (=> d!38139 (= (get!1445 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126334 d!38139))

(declare-fun d!38141 () Bool)

(declare-fun e!82693 () Bool)

(assert (=> d!38141 e!82693))

(declare-fun res!61227 () Bool)

(assert (=> d!38141 (=> res!61227 e!82693)))

(declare-fun lt!65380 () Bool)

(assert (=> d!38141 (= res!61227 (not lt!65380))))

(declare-fun lt!65378 () Bool)

(assert (=> d!38141 (= lt!65380 lt!65378)))

(declare-fun lt!65381 () Unit!3922)

(declare-fun e!82694 () Unit!3922)

(assert (=> d!38141 (= lt!65381 e!82694)))

(declare-fun c!23169 () Bool)

(assert (=> d!38141 (= c!23169 lt!65378)))

(assert (=> d!38141 (= lt!65378 (containsKey!169 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38141 (= (contains!867 lt!65010 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65380)))

(declare-fun b!126643 () Bool)

(declare-fun lt!65379 () Unit!3922)

(assert (=> b!126643 (= e!82694 lt!65379)))

(assert (=> b!126643 (= lt!65379 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126643 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126644 () Bool)

(declare-fun Unit!3938 () Unit!3922)

(assert (=> b!126644 (= e!82694 Unit!3938)))

(declare-fun b!126645 () Bool)

(assert (=> b!126645 (= e!82693 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38141 c!23169) b!126643))

(assert (= (and d!38141 (not c!23169)) b!126644))

(assert (= (and d!38141 (not res!61227)) b!126645))

(assert (=> d!38141 m!146957))

(declare-fun m!147483 () Bool)

(assert (=> d!38141 m!147483))

(assert (=> b!126643 m!146957))

(declare-fun m!147485 () Bool)

(assert (=> b!126643 m!147485))

(assert (=> b!126643 m!146957))

(assert (=> b!126643 m!147347))

(assert (=> b!126643 m!147347))

(declare-fun m!147487 () Bool)

(assert (=> b!126643 m!147487))

(assert (=> b!126645 m!146957))

(assert (=> b!126645 m!147347))

(assert (=> b!126645 m!147347))

(assert (=> b!126645 m!147487))

(assert (=> b!126179 d!38141))

(assert (=> bm!13510 d!38097))

(declare-fun d!38143 () Bool)

(declare-fun e!82695 () Bool)

(assert (=> d!38143 e!82695))

(declare-fun res!61228 () Bool)

(assert (=> d!38143 (=> (not res!61228) (not e!82695))))

(declare-fun lt!65384 () ListLongMap!1647)

(assert (=> d!38143 (= res!61228 (contains!867 lt!65384 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65382 () List!1692)

(assert (=> d!38143 (= lt!65384 (ListLongMap!1648 lt!65382))))

(declare-fun lt!65385 () Unit!3922)

(declare-fun lt!65383 () Unit!3922)

(assert (=> d!38143 (= lt!65385 lt!65383)))

(assert (=> d!38143 (= (getValueByKey!165 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38143 (= lt!65383 (lemmaContainsTupThenGetReturnValue!83 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38143 (= lt!65382 (insertStrictlySorted!86 (toList!839 call!13574) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38143 (= (+!158 call!13574 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65384)))

(declare-fun b!126646 () Bool)

(declare-fun res!61229 () Bool)

(assert (=> b!126646 (=> (not res!61229) (not e!82695))))

(assert (=> b!126646 (= res!61229 (= (getValueByKey!165 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126647 () Bool)

(assert (=> b!126647 (= e!82695 (contains!869 (toList!839 lt!65384) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38143 res!61228) b!126646))

(assert (= (and b!126646 res!61229) b!126647))

(declare-fun m!147489 () Bool)

(assert (=> d!38143 m!147489))

(declare-fun m!147491 () Bool)

(assert (=> d!38143 m!147491))

(declare-fun m!147493 () Bool)

(assert (=> d!38143 m!147493))

(declare-fun m!147495 () Bool)

(assert (=> d!38143 m!147495))

(declare-fun m!147497 () Bool)

(assert (=> b!126646 m!147497))

(declare-fun m!147499 () Bool)

(assert (=> b!126647 m!147499))

(assert (=> b!126291 d!38143))

(declare-fun d!38145 () Bool)

(declare-fun res!61230 () Bool)

(declare-fun e!82696 () Bool)

(assert (=> d!38145 (=> (not res!61230) (not e!82696))))

(assert (=> d!38145 (= res!61230 (simpleValid!87 (_2!1283 lt!65108)))))

(assert (=> d!38145 (= (valid!509 (_2!1283 lt!65108)) e!82696)))

(declare-fun b!126648 () Bool)

(declare-fun res!61231 () Bool)

(assert (=> b!126648 (=> (not res!61231) (not e!82696))))

(assert (=> b!126648 (= res!61231 (= (arrayCountValidKeys!0 (_keys!4514 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))) (_size!579 (_2!1283 lt!65108))))))

(declare-fun b!126649 () Bool)

(declare-fun res!61232 () Bool)

(assert (=> b!126649 (=> (not res!61232) (not e!82696))))

(assert (=> b!126649 (= res!61232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108))))))

(declare-fun b!126650 () Bool)

(assert (=> b!126650 (= e!82696 (arrayNoDuplicates!0 (_keys!4514 (_2!1283 lt!65108)) #b00000000000000000000000000000000 Nil!1691))))

(assert (= (and d!38145 res!61230) b!126648))

(assert (= (and b!126648 res!61231) b!126649))

(assert (= (and b!126649 res!61232) b!126650))

(declare-fun m!147501 () Bool)

(assert (=> d!38145 m!147501))

(declare-fun m!147503 () Bool)

(assert (=> b!126648 m!147503))

(declare-fun m!147505 () Bool)

(assert (=> b!126649 m!147505))

(declare-fun m!147507 () Bool)

(assert (=> b!126650 m!147507))

(assert (=> d!38041 d!38145))

(assert (=> d!38041 d!38023))

(assert (=> d!38035 d!38115))

(declare-fun d!38147 () Bool)

(assert (=> d!38147 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65388 () Unit!3922)

(declare-fun choose!775 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3922)

(assert (=> d!38147 (= lt!65388 (choose!775 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38147 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38147 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65388)))

(declare-fun bs!5230 () Bool)

(assert (= bs!5230 d!38147))

(assert (=> bs!5230 m!146923))

(declare-fun m!147509 () Bool)

(assert (=> bs!5230 m!147509))

(assert (=> bs!5230 m!147061))

(assert (=> bs!5230 m!146923))

(assert (=> bs!5230 m!146831))

(declare-fun m!147511 () Bool)

(assert (=> bs!5230 m!147511))

(assert (=> bs!5230 m!146831))

(declare-fun m!147513 () Bool)

(assert (=> bs!5230 m!147513))

(assert (=> b!126313 d!38147))

(declare-fun d!38149 () Bool)

(assert (=> d!38149 (= (inRange!0 (ite c!23082 (ite c!23077 (index!3248 lt!65092) (ite c!23078 (index!3247 lt!65111) (index!3250 lt!65111))) (ite c!23085 (index!3248 lt!65106) (ite c!23086 (index!3247 lt!65114) (index!3250 lt!65114)))) (mask!7037 newMap!16)) (and (bvsge (ite c!23082 (ite c!23077 (index!3248 lt!65092) (ite c!23078 (index!3247 lt!65111) (index!3250 lt!65111))) (ite c!23085 (index!3248 lt!65106) (ite c!23086 (index!3247 lt!65114) (index!3250 lt!65114)))) #b00000000000000000000000000000000) (bvslt (ite c!23082 (ite c!23077 (index!3248 lt!65092) (ite c!23078 (index!3247 lt!65111) (index!3250 lt!65111))) (ite c!23085 (index!3248 lt!65106) (ite c!23086 (index!3247 lt!65114) (index!3250 lt!65114)))) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13586 d!38149))

(declare-fun d!38151 () Bool)

(assert (=> d!38151 (= (map!1369 (_2!1283 lt!65108)) (getCurrentListMap!509 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun bs!5231 () Bool)

(assert (= bs!5231 d!38151))

(declare-fun m!147515 () Bool)

(assert (=> bs!5231 m!147515))

(assert (=> bm!13564 d!38151))

(declare-fun d!38153 () Bool)

(declare-fun res!61237 () Bool)

(declare-fun e!82701 () Bool)

(assert (=> d!38153 (=> res!61237 e!82701)))

(assert (=> d!38153 (= res!61237 (and ((_ is Cons!1688) (toList!839 lt!64938)) (= (_1!1282 (h!2290 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38153 (= (containsKey!169 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82701)))

(declare-fun b!126655 () Bool)

(declare-fun e!82702 () Bool)

(assert (=> b!126655 (= e!82701 e!82702)))

(declare-fun res!61238 () Bool)

(assert (=> b!126655 (=> (not res!61238) (not e!82702))))

(assert (=> b!126655 (= res!61238 (and (or (not ((_ is Cons!1688) (toList!839 lt!64938))) (bvsle (_1!1282 (h!2290 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) ((_ is Cons!1688) (toList!839 lt!64938)) (bvslt (_1!1282 (h!2290 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(declare-fun b!126656 () Bool)

(assert (=> b!126656 (= e!82702 (containsKey!169 (t!6030 (toList!839 lt!64938)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38153 (not res!61237)) b!126655))

(assert (= (and b!126655 res!61238) b!126656))

(assert (=> b!126656 m!146811))

(declare-fun m!147517 () Bool)

(assert (=> b!126656 m!147517))

(assert (=> d!38039 d!38153))

(declare-fun d!38155 () Bool)

(declare-fun e!82703 () Bool)

(assert (=> d!38155 e!82703))

(declare-fun res!61239 () Bool)

(assert (=> d!38155 (=> (not res!61239) (not e!82703))))

(declare-fun lt!65391 () ListLongMap!1647)

(assert (=> d!38155 (= res!61239 (contains!867 lt!65391 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65389 () List!1692)

(assert (=> d!38155 (= lt!65391 (ListLongMap!1648 lt!65389))))

(declare-fun lt!65392 () Unit!3922)

(declare-fun lt!65390 () Unit!3922)

(assert (=> d!38155 (= lt!65392 lt!65390)))

(assert (=> d!38155 (= (getValueByKey!165 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!170 (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38155 (= lt!65390 (lemmaContainsTupThenGetReturnValue!83 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38155 (= lt!65389 (insertStrictlySorted!86 (toList!839 e!82491) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38155 (= (+!158 e!82491 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65391)))

(declare-fun b!126657 () Bool)

(declare-fun res!61240 () Bool)

(assert (=> b!126657 (=> (not res!61240) (not e!82703))))

(assert (=> b!126657 (= res!61240 (= (getValueByKey!165 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!170 (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126658 () Bool)

(assert (=> b!126658 (= e!82703 (contains!869 (toList!839 lt!65391) (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38155 res!61239) b!126657))

(assert (= (and b!126657 res!61240) b!126658))

(declare-fun m!147519 () Bool)

(assert (=> d!38155 m!147519))

(declare-fun m!147521 () Bool)

(assert (=> d!38155 m!147521))

(declare-fun m!147523 () Bool)

(assert (=> d!38155 m!147523))

(declare-fun m!147525 () Bool)

(assert (=> d!38155 m!147525))

(declare-fun m!147527 () Bool)

(assert (=> b!126657 m!147527))

(declare-fun m!147529 () Bool)

(assert (=> b!126658 m!147529))

(assert (=> bm!13574 d!38155))

(declare-fun d!38157 () Bool)

(declare-fun e!82704 () Bool)

(assert (=> d!38157 e!82704))

(declare-fun res!61241 () Bool)

(assert (=> d!38157 (=> res!61241 e!82704)))

(declare-fun lt!65395 () Bool)

(assert (=> d!38157 (= res!61241 (not lt!65395))))

(declare-fun lt!65393 () Bool)

(assert (=> d!38157 (= lt!65395 lt!65393)))

(declare-fun lt!65396 () Unit!3922)

(declare-fun e!82705 () Unit!3922)

(assert (=> d!38157 (= lt!65396 e!82705)))

(declare-fun c!23170 () Bool)

(assert (=> d!38157 (= c!23170 lt!65393)))

(assert (=> d!38157 (= lt!65393 (containsKey!169 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38157 (= (contains!867 call!13571 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65395)))

(declare-fun b!126659 () Bool)

(declare-fun lt!65394 () Unit!3922)

(assert (=> b!126659 (= e!82705 lt!65394)))

(assert (=> b!126659 (= lt!65394 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126659 (isDefined!119 (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!126660 () Bool)

(declare-fun Unit!3939 () Unit!3922)

(assert (=> b!126660 (= e!82705 Unit!3939)))

(declare-fun b!126661 () Bool)

(assert (=> b!126661 (= e!82704 (isDefined!119 (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (= (and d!38157 c!23170) b!126659))

(assert (= (and d!38157 (not c!23170)) b!126660))

(assert (= (and d!38157 (not res!61241)) b!126661))

(assert (=> d!38157 m!146811))

(declare-fun m!147531 () Bool)

(assert (=> d!38157 m!147531))

(assert (=> b!126659 m!146811))

(declare-fun m!147533 () Bool)

(assert (=> b!126659 m!147533))

(assert (=> b!126659 m!146811))

(declare-fun m!147535 () Bool)

(assert (=> b!126659 m!147535))

(assert (=> b!126659 m!147535))

(declare-fun m!147537 () Bool)

(assert (=> b!126659 m!147537))

(assert (=> b!126661 m!146811))

(assert (=> b!126661 m!147535))

(assert (=> b!126661 m!147535))

(assert (=> b!126661 m!147537))

(assert (=> b!126287 d!38157))

(declare-fun b!126662 () Bool)

(declare-fun e!82712 () ListLongMap!1647)

(declare-fun call!13636 () ListLongMap!1647)

(assert (=> b!126662 (= e!82712 call!13636)))

(declare-fun b!126663 () Bool)

(declare-fun e!82707 () Bool)

(declare-fun lt!65404 () ListLongMap!1647)

(assert (=> b!126663 (= e!82707 (= (apply!111 lt!65404 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun e!82714 () Bool)

(declare-fun b!126664 () Bool)

(assert (=> b!126664 (= e!82714 (= (apply!111 lt!65404 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))

(declare-fun b!126665 () Bool)

(declare-fun e!82718 () ListLongMap!1647)

(declare-fun e!82717 () ListLongMap!1647)

(assert (=> b!126665 (= e!82718 e!82717)))

(declare-fun c!23172 () Bool)

(assert (=> b!126665 (= c!23172 (and (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13631 () Bool)

(declare-fun call!13638 () ListLongMap!1647)

(assert (=> bm!13631 (= call!13636 call!13638)))

(declare-fun b!126666 () Bool)

(declare-fun res!61242 () Bool)

(declare-fun e!82710 () Bool)

(assert (=> b!126666 (=> (not res!61242) (not e!82710))))

(declare-fun e!82708 () Bool)

(assert (=> b!126666 (= res!61242 e!82708)))

(declare-fun res!61246 () Bool)

(assert (=> b!126666 (=> res!61246 e!82708)))

(declare-fun e!82715 () Bool)

(assert (=> b!126666 (= res!61246 (not e!82715))))

(declare-fun res!61248 () Bool)

(assert (=> b!126666 (=> (not res!61248) (not e!82715))))

(assert (=> b!126666 (= res!61248 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13632 () Bool)

(declare-fun call!13634 () ListLongMap!1647)

(declare-fun call!13639 () ListLongMap!1647)

(assert (=> bm!13632 (= call!13634 call!13639)))

(declare-fun b!126667 () Bool)

(declare-fun e!82709 () Bool)

(assert (=> b!126667 (= e!82709 e!82707)))

(declare-fun res!61247 () Bool)

(declare-fun call!13637 () Bool)

(assert (=> b!126667 (= res!61247 call!13637)))

(assert (=> b!126667 (=> (not res!61247) (not e!82707))))

(declare-fun bm!13633 () Bool)

(assert (=> bm!13633 (= call!13639 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126668 () Bool)

(declare-fun e!82706 () Bool)

(assert (=> b!126668 (= e!82708 e!82706)))

(declare-fun res!61245 () Bool)

(assert (=> b!126668 (=> (not res!61245) (not e!82706))))

(assert (=> b!126668 (= res!61245 (contains!867 lt!65404 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126669 () Bool)

(declare-fun e!82711 () Unit!3922)

(declare-fun Unit!3940 () Unit!3922)

(assert (=> b!126669 (= e!82711 Unit!3940)))

(declare-fun bm!13634 () Bool)

(declare-fun call!13640 () Bool)

(assert (=> bm!13634 (= call!13640 (contains!867 lt!65404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126670 () Bool)

(declare-fun e!82716 () Bool)

(assert (=> b!126670 (= e!82716 e!82714)))

(declare-fun res!61243 () Bool)

(assert (=> b!126670 (= res!61243 call!13640)))

(assert (=> b!126670 (=> (not res!61243) (not e!82714))))

(declare-fun b!126671 () Bool)

(declare-fun c!23175 () Bool)

(assert (=> b!126671 (= c!23175 (and (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126671 (= e!82717 e!82712)))

(declare-fun b!126672 () Bool)

(declare-fun e!82713 () Bool)

(assert (=> b!126672 (= e!82713 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38159 () Bool)

(assert (=> d!38159 e!82710))

(declare-fun res!61249 () Bool)

(assert (=> d!38159 (=> (not res!61249) (not e!82710))))

(assert (=> d!38159 (= res!61249 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65401 () ListLongMap!1647)

(assert (=> d!38159 (= lt!65404 lt!65401)))

(declare-fun lt!65411 () Unit!3922)

(assert (=> d!38159 (= lt!65411 e!82711)))

(declare-fun c!23173 () Bool)

(assert (=> d!38159 (= c!23173 e!82713)))

(declare-fun res!61250 () Bool)

(assert (=> d!38159 (=> (not res!61250) (not e!82713))))

(assert (=> d!38159 (= res!61250 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38159 (= lt!65401 e!82718)))

(declare-fun c!23174 () Bool)

(assert (=> d!38159 (= c!23174 (and (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38159 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38159 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65404)))

(declare-fun b!126673 () Bool)

(assert (=> b!126673 (= e!82706 (= (apply!111 lt!65404 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))))))))

(assert (=> b!126673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126674 () Bool)

(assert (=> b!126674 (= e!82715 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126675 () Bool)

(assert (=> b!126675 (= e!82717 call!13636)))

(declare-fun b!126676 () Bool)

(declare-fun lt!65405 () Unit!3922)

(assert (=> b!126676 (= e!82711 lt!65405)))

(declare-fun lt!65400 () ListLongMap!1647)

(assert (=> b!126676 (= lt!65400 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65413 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65410 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65410 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65418 () Unit!3922)

(assert (=> b!126676 (= lt!65418 (addStillContains!87 lt!65400 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65410))))

(assert (=> b!126676 (contains!867 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65410)))

(declare-fun lt!65417 () Unit!3922)

(assert (=> b!126676 (= lt!65417 lt!65418)))

(declare-fun lt!65415 () ListLongMap!1647)

(assert (=> b!126676 (= lt!65415 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65408 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65407 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65407 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65412 () Unit!3922)

(assert (=> b!126676 (= lt!65412 (addApplyDifferent!87 lt!65415 lt!65408 (minValue!2645 newMap!16) lt!65407))))

(assert (=> b!126676 (= (apply!111 (+!158 lt!65415 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) lt!65407) (apply!111 lt!65415 lt!65407))))

(declare-fun lt!65406 () Unit!3922)

(assert (=> b!126676 (= lt!65406 lt!65412)))

(declare-fun lt!65399 () ListLongMap!1647)

(assert (=> b!126676 (= lt!65399 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65397 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65402 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65402 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65403 () Unit!3922)

(assert (=> b!126676 (= lt!65403 (addApplyDifferent!87 lt!65399 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65402))))

(assert (=> b!126676 (= (apply!111 (+!158 lt!65399 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65402) (apply!111 lt!65399 lt!65402))))

(declare-fun lt!65416 () Unit!3922)

(assert (=> b!126676 (= lt!65416 lt!65403)))

(declare-fun lt!65414 () ListLongMap!1647)

(assert (=> b!126676 (= lt!65414 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65398 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65409 () (_ BitVec 64))

(assert (=> b!126676 (= lt!65409 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126676 (= lt!65405 (addApplyDifferent!87 lt!65414 lt!65398 (minValue!2645 newMap!16) lt!65409))))

(assert (=> b!126676 (= (apply!111 (+!158 lt!65414 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) lt!65409) (apply!111 lt!65414 lt!65409))))

(declare-fun bm!13635 () Bool)

(declare-fun call!13635 () ListLongMap!1647)

(assert (=> bm!13635 (= call!13638 (+!158 (ite c!23174 call!13639 (ite c!23172 call!13634 call!13635)) (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!126677 () Bool)

(assert (=> b!126677 (= e!82712 call!13635)))

(declare-fun b!126678 () Bool)

(assert (=> b!126678 (= e!82718 (+!158 call!13638 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13636 () Bool)

(assert (=> bm!13636 (= call!13635 call!13634)))

(declare-fun bm!13637 () Bool)

(assert (=> bm!13637 (= call!13637 (contains!867 lt!65404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126679 () Bool)

(assert (=> b!126679 (= e!82716 (not call!13640))))

(declare-fun b!126680 () Bool)

(assert (=> b!126680 (= e!82710 e!82709)))

(declare-fun c!23176 () Bool)

(assert (=> b!126680 (= c!23176 (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126681 () Bool)

(assert (=> b!126681 (= e!82709 (not call!13637))))

(declare-fun b!126682 () Bool)

(declare-fun res!61244 () Bool)

(assert (=> b!126682 (=> (not res!61244) (not e!82710))))

(assert (=> b!126682 (= res!61244 e!82716)))

(declare-fun c!23171 () Bool)

(assert (=> b!126682 (= c!23171 (not (= (bvand (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38159 c!23174) b!126678))

(assert (= (and d!38159 (not c!23174)) b!126665))

(assert (= (and b!126665 c!23172) b!126675))

(assert (= (and b!126665 (not c!23172)) b!126671))

(assert (= (and b!126671 c!23175) b!126662))

(assert (= (and b!126671 (not c!23175)) b!126677))

(assert (= (or b!126662 b!126677) bm!13636))

(assert (= (or b!126675 bm!13636) bm!13632))

(assert (= (or b!126675 b!126662) bm!13631))

(assert (= (or b!126678 bm!13632) bm!13633))

(assert (= (or b!126678 bm!13631) bm!13635))

(assert (= (and d!38159 res!61250) b!126672))

(assert (= (and d!38159 c!23173) b!126676))

(assert (= (and d!38159 (not c!23173)) b!126669))

(assert (= (and d!38159 res!61249) b!126666))

(assert (= (and b!126666 res!61248) b!126674))

(assert (= (and b!126666 (not res!61246)) b!126668))

(assert (= (and b!126668 res!61245) b!126673))

(assert (= (and b!126666 res!61242) b!126682))

(assert (= (and b!126682 c!23171) b!126670))

(assert (= (and b!126682 (not c!23171)) b!126679))

(assert (= (and b!126670 res!61243) b!126664))

(assert (= (or b!126670 b!126679) bm!13634))

(assert (= (and b!126682 res!61244) b!126680))

(assert (= (and b!126680 c!23176) b!126667))

(assert (= (and b!126680 (not c!23176)) b!126681))

(assert (= (and b!126667 res!61247) b!126663))

(assert (= (or b!126667 b!126681) bm!13637))

(declare-fun b_lambda!5565 () Bool)

(assert (=> (not b_lambda!5565) (not b!126673)))

(assert (=> b!126673 t!6042))

(declare-fun b_and!7781 () Bool)

(assert (= b_and!7777 (and (=> t!6042 result!3843) b_and!7781)))

(assert (=> b!126673 t!6044))

(declare-fun b_and!7783 () Bool)

(assert (= b_and!7779 (and (=> t!6044 result!3845) b_and!7783)))

(declare-fun m!147539 () Bool)

(assert (=> b!126676 m!147539))

(declare-fun m!147541 () Bool)

(assert (=> b!126676 m!147541))

(declare-fun m!147543 () Bool)

(assert (=> b!126676 m!147543))

(declare-fun m!147545 () Bool)

(assert (=> b!126676 m!147545))

(declare-fun m!147547 () Bool)

(assert (=> b!126676 m!147547))

(declare-fun m!147549 () Bool)

(assert (=> b!126676 m!147549))

(declare-fun m!147551 () Bool)

(assert (=> b!126676 m!147551))

(declare-fun m!147553 () Bool)

(assert (=> b!126676 m!147553))

(declare-fun m!147555 () Bool)

(assert (=> b!126676 m!147555))

(declare-fun m!147557 () Bool)

(assert (=> b!126676 m!147557))

(assert (=> b!126676 m!147549))

(declare-fun m!147559 () Bool)

(assert (=> b!126676 m!147559))

(assert (=> b!126676 m!147555))

(declare-fun m!147561 () Bool)

(assert (=> b!126676 m!147561))

(declare-fun m!147563 () Bool)

(assert (=> b!126676 m!147563))

(declare-fun m!147565 () Bool)

(assert (=> b!126676 m!147565))

(assert (=> b!126676 m!147543))

(declare-fun m!147567 () Bool)

(assert (=> b!126676 m!147567))

(assert (=> b!126676 m!147547))

(declare-fun m!147569 () Bool)

(assert (=> b!126676 m!147569))

(assert (=> b!126676 m!147085))

(assert (=> b!126674 m!147085))

(assert (=> b!126674 m!147085))

(assert (=> b!126674 m!147087))

(declare-fun m!147571 () Bool)

(assert (=> bm!13635 m!147571))

(declare-fun m!147573 () Bool)

(assert (=> b!126664 m!147573))

(assert (=> b!126673 m!147085))

(declare-fun m!147575 () Bool)

(assert (=> b!126673 m!147575))

(assert (=> b!126673 m!147085))

(declare-fun m!147577 () Bool)

(assert (=> b!126673 m!147577))

(assert (=> b!126673 m!147577))

(assert (=> b!126673 m!147313))

(declare-fun m!147579 () Bool)

(assert (=> b!126673 m!147579))

(assert (=> b!126673 m!147313))

(declare-fun m!147581 () Bool)

(assert (=> b!126663 m!147581))

(assert (=> bm!13633 m!147553))

(assert (=> b!126668 m!147085))

(assert (=> b!126668 m!147085))

(declare-fun m!147583 () Bool)

(assert (=> b!126668 m!147583))

(declare-fun m!147585 () Bool)

(assert (=> bm!13634 m!147585))

(declare-fun m!147587 () Bool)

(assert (=> b!126678 m!147587))

(declare-fun m!147589 () Bool)

(assert (=> bm!13637 m!147589))

(assert (=> b!126672 m!147085))

(assert (=> b!126672 m!147085))

(assert (=> b!126672 m!147087))

(assert (=> d!38159 m!147061))

(assert (=> bm!13563 d!38159))

(declare-fun b!126684 () Bool)

(declare-fun e!82719 () Bool)

(assert (=> b!126684 (= e!82719 tp_is_empty!2839)))

(declare-fun b!126683 () Bool)

(declare-fun e!82720 () Bool)

(assert (=> b!126683 (= e!82720 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4511 () Bool)

(declare-fun mapRes!4511 () Bool)

(assert (=> mapIsEmpty!4511 mapRes!4511))

(declare-fun condMapEmpty!4511 () Bool)

(declare-fun mapDefault!4511 () ValueCell!1076)

(assert (=> mapNonEmpty!4509 (= condMapEmpty!4511 (= mapRest!4509 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4511)))))

(assert (=> mapNonEmpty!4509 (= tp!10971 (and e!82719 mapRes!4511))))

(declare-fun mapNonEmpty!4511 () Bool)

(declare-fun tp!10973 () Bool)

(assert (=> mapNonEmpty!4511 (= mapRes!4511 (and tp!10973 e!82720))))

(declare-fun mapValue!4511 () ValueCell!1076)

(declare-fun mapKey!4511 () (_ BitVec 32))

(declare-fun mapRest!4511 () (Array (_ BitVec 32) ValueCell!1076))

(assert (=> mapNonEmpty!4511 (= mapRest!4509 (store mapRest!4511 mapKey!4511 mapValue!4511))))

(assert (= (and mapNonEmpty!4509 condMapEmpty!4511) mapIsEmpty!4511))

(assert (= (and mapNonEmpty!4509 (not condMapEmpty!4511)) mapNonEmpty!4511))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1076) mapValue!4511)) b!126683))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1076) mapDefault!4511)) b!126684))

(declare-fun m!147591 () Bool)

(assert (=> mapNonEmpty!4511 m!147591))

(declare-fun b!126686 () Bool)

(declare-fun e!82721 () Bool)

(assert (=> b!126686 (= e!82721 tp_is_empty!2839)))

(declare-fun b!126685 () Bool)

(declare-fun e!82722 () Bool)

(assert (=> b!126685 (= e!82722 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4512 () Bool)

(declare-fun mapRes!4512 () Bool)

(assert (=> mapIsEmpty!4512 mapRes!4512))

(declare-fun condMapEmpty!4512 () Bool)

(declare-fun mapDefault!4512 () ValueCell!1076)

(assert (=> mapNonEmpty!4510 (= condMapEmpty!4512 (= mapRest!4510 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4512)))))

(assert (=> mapNonEmpty!4510 (= tp!10972 (and e!82721 mapRes!4512))))

(declare-fun mapNonEmpty!4512 () Bool)

(declare-fun tp!10974 () Bool)

(assert (=> mapNonEmpty!4512 (= mapRes!4512 (and tp!10974 e!82722))))

(declare-fun mapValue!4512 () ValueCell!1076)

(declare-fun mapRest!4512 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapKey!4512 () (_ BitVec 32))

(assert (=> mapNonEmpty!4512 (= mapRest!4510 (store mapRest!4512 mapKey!4512 mapValue!4512))))

(assert (= (and mapNonEmpty!4510 condMapEmpty!4512) mapIsEmpty!4512))

(assert (= (and mapNonEmpty!4510 (not condMapEmpty!4512)) mapNonEmpty!4512))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1076) mapValue!4512)) b!126685))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1076) mapDefault!4512)) b!126686))

(declare-fun m!147593 () Bool)

(assert (=> mapNonEmpty!4512 m!147593))

(declare-fun b_lambda!5567 () Bool)

(assert (= b_lambda!5557 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5567)))

(declare-fun b_lambda!5569 () Bool)

(assert (= b_lambda!5561 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5569)))

(declare-fun b_lambda!5571 () Bool)

(assert (= b_lambda!5563 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5571)))

(declare-fun b_lambda!5573 () Bool)

(assert (= b_lambda!5565 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5573)))

(declare-fun b_lambda!5575 () Bool)

(assert (= b_lambda!5559 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5575)))

(check-sat (not b!126447) (not b!126441) (not bm!13624) (not d!38047) (not b!126402) (not mapNonEmpty!4512) (not d!38089) (not b!126668) (not d!38065) (not b!126371) (not b!126476) (not d!38091) (not d!38143) (not b_next!2845) (not bm!13620) (not b_lambda!5555) (not bm!13601) (not d!38067) (not b!126357) (not b!126360) (not d!38051) (not b_lambda!5573) (not b!126435) (not b!126661) (not b!126443) (not b!126646) (not d!38099) (not b!126585) (not b!126374) (not d!38063) (not b_next!2847) (not b!126581) (not d!38155) (not b!126355) (not b_lambda!5569) (not b!126594) (not b!126527) (not d!38131) (not b!126614) (not d!38145) (not d!38103) (not bm!13598) (not b!126678) (not b!126362) (not b!126484) (not b!126507) (not d!38151) (not b!126674) (not b!126600) (not b!126608) (not bm!13616) (not b!126649) (not d!38083) (not bm!13603) (not d!38055) (not b!126516) (not bm!13630) (not d!38049) (not b!126418) (not d!38119) (not b!126659) (not d!38109) (not b!126664) (not bm!13637) (not b!126542) (not bm!13629) (not d!38069) b_and!7783 (not b!126481) (not b!126479) (not b!126650) (not b!126522) (not b!126395) (not bm!13614) (not b_lambda!5567) (not b!126645) (not d!38081) (not b_lambda!5575) (not bm!13621) (not b!126389) (not b!126440) (not b_lambda!5571) (not b!126424) (not b!126529) (not d!38123) (not b!126599) (not b!126673) (not d!38117) (not bm!13633) (not d!38147) (not d!38105) (not d!38115) (not b!126417) (not bm!13602) (not b!126592) (not bm!13622) (not mapNonEmpty!4511) (not d!38157) (not d!38059) (not b!126508) (not b!126404) (not b!126359) (not b!126512) (not b!126448) (not d!38129) (not d!38095) (not b!126473) (not bm!13592) (not d!38113) (not b!126492) (not d!38121) (not b!126438) (not b!126439) (not d!38073) (not bm!13615) (not d!38093) (not b!126536) (not d!38085) (not b!126658) (not bm!13605) (not d!38097) (not b!126535) tp_is_empty!2839 (not bm!13589) (not b!126643) (not d!38141) (not d!38087) (not b!126503) (not b!126578) (not b!126517) (not b!126532) (not b!126482) (not d!38101) (not b!126663) (not b!126475) (not b_lambda!5551) (not d!38137) (not b!126416) (not b!126657) (not b!126609) (not b!126612) (not b!126480) (not b!126400) (not b!126676) (not b!126595) (not b!126442) (not b!126610) (not b!126444) (not bm!13634) (not d!38159) (not d!38127) (not b!126537) (not b!126401) (not d!38107) (not b!126597) (not b!126446) (not d!38135) (not b!126604) (not b!126491) (not bm!13635) (not d!38057) (not b!126358) (not b!126647) (not bm!13595) (not b!126648) b_and!7781 (not b!126672) (not d!38111) (not b!126504) (not b!126518) (not b!126583) (not b!126520) (not b!126656))
(check-sat b_and!7781 b_and!7783 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun b!126687 () Bool)

(declare-fun e!82729 () ListLongMap!1647)

(declare-fun call!13643 () ListLongMap!1647)

(assert (=> b!126687 (= e!82729 call!13643)))

(declare-fun b!126688 () Bool)

(declare-fun e!82724 () Bool)

(declare-fun lt!65426 () ListLongMap!1647)

(assert (=> b!126688 (= e!82724 (= (apply!111 lt!65426 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 (_2!1283 lt!65108))))))

(declare-fun b!126689 () Bool)

(declare-fun e!82731 () Bool)

(assert (=> b!126689 (= e!82731 (= (apply!111 lt!65426 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 (_2!1283 lt!65108))))))

(declare-fun b!126690 () Bool)

(declare-fun e!82735 () ListLongMap!1647)

(declare-fun e!82734 () ListLongMap!1647)

(assert (=> b!126690 (= e!82735 e!82734)))

(declare-fun c!23178 () Bool)

(assert (=> b!126690 (= c!23178 (and (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13638 () Bool)

(declare-fun call!13645 () ListLongMap!1647)

(assert (=> bm!13638 (= call!13643 call!13645)))

(declare-fun b!126691 () Bool)

(declare-fun res!61251 () Bool)

(declare-fun e!82727 () Bool)

(assert (=> b!126691 (=> (not res!61251) (not e!82727))))

(declare-fun e!82725 () Bool)

(assert (=> b!126691 (= res!61251 e!82725)))

(declare-fun res!61255 () Bool)

(assert (=> b!126691 (=> res!61255 e!82725)))

(declare-fun e!82732 () Bool)

(assert (=> b!126691 (= res!61255 (not e!82732))))

(declare-fun res!61257 () Bool)

(assert (=> b!126691 (=> (not res!61257) (not e!82732))))

(assert (=> b!126691 (= res!61257 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(declare-fun bm!13639 () Bool)

(declare-fun call!13641 () ListLongMap!1647)

(declare-fun call!13646 () ListLongMap!1647)

(assert (=> bm!13639 (= call!13641 call!13646)))

(declare-fun b!126692 () Bool)

(declare-fun e!82726 () Bool)

(assert (=> b!126692 (= e!82726 e!82724)))

(declare-fun res!61256 () Bool)

(declare-fun call!13644 () Bool)

(assert (=> b!126692 (= res!61256 call!13644)))

(assert (=> b!126692 (=> (not res!61256) (not e!82724))))

(declare-fun bm!13640 () Bool)

(assert (=> bm!13640 (= call!13646 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun b!126693 () Bool)

(declare-fun e!82723 () Bool)

(assert (=> b!126693 (= e!82725 e!82723)))

(declare-fun res!61254 () Bool)

(assert (=> b!126693 (=> (not res!61254) (not e!82723))))

(assert (=> b!126693 (= res!61254 (contains!867 lt!65426 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(assert (=> b!126693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(declare-fun b!126694 () Bool)

(declare-fun e!82728 () Unit!3922)

(declare-fun Unit!3941 () Unit!3922)

(assert (=> b!126694 (= e!82728 Unit!3941)))

(declare-fun bm!13641 () Bool)

(declare-fun call!13647 () Bool)

(assert (=> bm!13641 (= call!13647 (contains!867 lt!65426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126695 () Bool)

(declare-fun e!82733 () Bool)

(assert (=> b!126695 (= e!82733 e!82731)))

(declare-fun res!61252 () Bool)

(assert (=> b!126695 (= res!61252 call!13647)))

(assert (=> b!126695 (=> (not res!61252) (not e!82731))))

(declare-fun b!126696 () Bool)

(declare-fun c!23181 () Bool)

(assert (=> b!126696 (= c!23181 (and (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126696 (= e!82734 e!82729)))

(declare-fun b!126697 () Bool)

(declare-fun e!82730 () Bool)

(assert (=> b!126697 (= e!82730 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun d!38161 () Bool)

(assert (=> d!38161 e!82727))

(declare-fun res!61258 () Bool)

(assert (=> d!38161 (=> (not res!61258) (not e!82727))))

(assert (=> d!38161 (= res!61258 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))))

(declare-fun lt!65423 () ListLongMap!1647)

(assert (=> d!38161 (= lt!65426 lt!65423)))

(declare-fun lt!65433 () Unit!3922)

(assert (=> d!38161 (= lt!65433 e!82728)))

(declare-fun c!23179 () Bool)

(assert (=> d!38161 (= c!23179 e!82730)))

(declare-fun res!61259 () Bool)

(assert (=> d!38161 (=> (not res!61259) (not e!82730))))

(assert (=> d!38161 (= res!61259 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(assert (=> d!38161 (= lt!65423 e!82735)))

(declare-fun c!23180 () Bool)

(assert (=> d!38161 (= c!23180 (and (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38161 (validMask!0 (mask!7037 (_2!1283 lt!65108)))))

(assert (=> d!38161 (= (getCurrentListMap!509 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))) lt!65426)))

(declare-fun b!126698 () Bool)

(assert (=> b!126698 (= e!82723 (= (apply!111 lt!65426 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (_values!2765 (_2!1283 lt!65108))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 (_2!1283 lt!65108)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (_values!2765 (_2!1283 lt!65108)))))))

(assert (=> b!126698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(declare-fun b!126699 () Bool)

(assert (=> b!126699 (= e!82732 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun b!126700 () Bool)

(assert (=> b!126700 (= e!82734 call!13643)))

(declare-fun b!126701 () Bool)

(declare-fun lt!65427 () Unit!3922)

(assert (=> b!126701 (= e!82728 lt!65427)))

(declare-fun lt!65422 () ListLongMap!1647)

(assert (=> b!126701 (= lt!65422 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun lt!65435 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65432 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65432 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000))))

(declare-fun lt!65440 () Unit!3922)

(assert (=> b!126701 (= lt!65440 (addStillContains!87 lt!65422 lt!65435 (zeroValue!2645 (_2!1283 lt!65108)) lt!65432))))

(assert (=> b!126701 (contains!867 (+!158 lt!65422 (tuple2!2543 lt!65435 (zeroValue!2645 (_2!1283 lt!65108)))) lt!65432)))

(declare-fun lt!65439 () Unit!3922)

(assert (=> b!126701 (= lt!65439 lt!65440)))

(declare-fun lt!65437 () ListLongMap!1647)

(assert (=> b!126701 (= lt!65437 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun lt!65430 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65429 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65429 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000))))

(declare-fun lt!65434 () Unit!3922)

(assert (=> b!126701 (= lt!65434 (addApplyDifferent!87 lt!65437 lt!65430 (minValue!2645 (_2!1283 lt!65108)) lt!65429))))

(assert (=> b!126701 (= (apply!111 (+!158 lt!65437 (tuple2!2543 lt!65430 (minValue!2645 (_2!1283 lt!65108)))) lt!65429) (apply!111 lt!65437 lt!65429))))

(declare-fun lt!65428 () Unit!3922)

(assert (=> b!126701 (= lt!65428 lt!65434)))

(declare-fun lt!65421 () ListLongMap!1647)

(assert (=> b!126701 (= lt!65421 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun lt!65419 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65424 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65424 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000))))

(declare-fun lt!65425 () Unit!3922)

(assert (=> b!126701 (= lt!65425 (addApplyDifferent!87 lt!65421 lt!65419 (zeroValue!2645 (_2!1283 lt!65108)) lt!65424))))

(assert (=> b!126701 (= (apply!111 (+!158 lt!65421 (tuple2!2543 lt!65419 (zeroValue!2645 (_2!1283 lt!65108)))) lt!65424) (apply!111 lt!65421 lt!65424))))

(declare-fun lt!65438 () Unit!3922)

(assert (=> b!126701 (= lt!65438 lt!65425)))

(declare-fun lt!65436 () ListLongMap!1647)

(assert (=> b!126701 (= lt!65436 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (_2!1283 lt!65108)) (_values!2765 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108)) (extraKeys!2563 (_2!1283 lt!65108)) (zeroValue!2645 (_2!1283 lt!65108)) (minValue!2645 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65108))))))

(declare-fun lt!65420 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65420 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65431 () (_ BitVec 64))

(assert (=> b!126701 (= lt!65431 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000))))

(assert (=> b!126701 (= lt!65427 (addApplyDifferent!87 lt!65436 lt!65420 (minValue!2645 (_2!1283 lt!65108)) lt!65431))))

(assert (=> b!126701 (= (apply!111 (+!158 lt!65436 (tuple2!2543 lt!65420 (minValue!2645 (_2!1283 lt!65108)))) lt!65431) (apply!111 lt!65436 lt!65431))))

(declare-fun call!13642 () ListLongMap!1647)

(declare-fun bm!13642 () Bool)

(assert (=> bm!13642 (= call!13645 (+!158 (ite c!23180 call!13646 (ite c!23178 call!13641 call!13642)) (ite (or c!23180 c!23178) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (_2!1283 lt!65108))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (_2!1283 lt!65108))))))))

(declare-fun b!126702 () Bool)

(assert (=> b!126702 (= e!82729 call!13642)))

(declare-fun b!126703 () Bool)

(assert (=> b!126703 (= e!82735 (+!158 call!13645 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (_2!1283 lt!65108)))))))

(declare-fun bm!13643 () Bool)

(assert (=> bm!13643 (= call!13642 call!13641)))

(declare-fun bm!13644 () Bool)

(assert (=> bm!13644 (= call!13644 (contains!867 lt!65426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126704 () Bool)

(assert (=> b!126704 (= e!82733 (not call!13647))))

(declare-fun b!126705 () Bool)

(assert (=> b!126705 (= e!82727 e!82726)))

(declare-fun c!23182 () Bool)

(assert (=> b!126705 (= c!23182 (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126706 () Bool)

(assert (=> b!126706 (= e!82726 (not call!13644))))

(declare-fun b!126707 () Bool)

(declare-fun res!61253 () Bool)

(assert (=> b!126707 (=> (not res!61253) (not e!82727))))

(assert (=> b!126707 (= res!61253 e!82733)))

(declare-fun c!23177 () Bool)

(assert (=> b!126707 (= c!23177 (not (= (bvand (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38161 c!23180) b!126703))

(assert (= (and d!38161 (not c!23180)) b!126690))

(assert (= (and b!126690 c!23178) b!126700))

(assert (= (and b!126690 (not c!23178)) b!126696))

(assert (= (and b!126696 c!23181) b!126687))

(assert (= (and b!126696 (not c!23181)) b!126702))

(assert (= (or b!126687 b!126702) bm!13643))

(assert (= (or b!126700 bm!13643) bm!13639))

(assert (= (or b!126700 b!126687) bm!13638))

(assert (= (or b!126703 bm!13639) bm!13640))

(assert (= (or b!126703 bm!13638) bm!13642))

(assert (= (and d!38161 res!61259) b!126697))

(assert (= (and d!38161 c!23179) b!126701))

(assert (= (and d!38161 (not c!23179)) b!126694))

(assert (= (and d!38161 res!61258) b!126691))

(assert (= (and b!126691 res!61257) b!126699))

(assert (= (and b!126691 (not res!61255)) b!126693))

(assert (= (and b!126693 res!61254) b!126698))

(assert (= (and b!126691 res!61251) b!126707))

(assert (= (and b!126707 c!23177) b!126695))

(assert (= (and b!126707 (not c!23177)) b!126704))

(assert (= (and b!126695 res!61252) b!126689))

(assert (= (or b!126695 b!126704) bm!13641))

(assert (= (and b!126707 res!61253) b!126705))

(assert (= (and b!126705 c!23182) b!126692))

(assert (= (and b!126705 (not c!23182)) b!126706))

(assert (= (and b!126692 res!61256) b!126688))

(assert (= (or b!126692 b!126706) bm!13644))

(declare-fun b_lambda!5577 () Bool)

(assert (=> (not b_lambda!5577) (not b!126698)))

(declare-fun tb!2317 () Bool)

(declare-fun t!6046 () Bool)

(assert (=> (and b!126004 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 (_2!1283 lt!65108))) t!6046) tb!2317))

(declare-fun result!3847 () Bool)

(assert (=> tb!2317 (= result!3847 tp_is_empty!2839)))

(assert (=> b!126698 t!6046))

(declare-fun b_and!7785 () Bool)

(assert (= b_and!7781 (and (=> t!6046 result!3847) b_and!7785)))

(declare-fun tb!2319 () Bool)

(declare-fun t!6048 () Bool)

(assert (=> (and b!126008 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (_2!1283 lt!65108))) t!6048) tb!2319))

(declare-fun result!3849 () Bool)

(assert (= result!3849 result!3847))

(assert (=> b!126698 t!6048))

(declare-fun b_and!7787 () Bool)

(assert (= b_and!7783 (and (=> t!6048 result!3849) b_and!7787)))

(declare-fun m!147595 () Bool)

(assert (=> b!126701 m!147595))

(declare-fun m!147597 () Bool)

(assert (=> b!126701 m!147597))

(declare-fun m!147599 () Bool)

(assert (=> b!126701 m!147599))

(declare-fun m!147601 () Bool)

(assert (=> b!126701 m!147601))

(declare-fun m!147603 () Bool)

(assert (=> b!126701 m!147603))

(declare-fun m!147605 () Bool)

(assert (=> b!126701 m!147605))

(declare-fun m!147607 () Bool)

(assert (=> b!126701 m!147607))

(declare-fun m!147609 () Bool)

(assert (=> b!126701 m!147609))

(declare-fun m!147611 () Bool)

(assert (=> b!126701 m!147611))

(declare-fun m!147613 () Bool)

(assert (=> b!126701 m!147613))

(assert (=> b!126701 m!147605))

(declare-fun m!147615 () Bool)

(assert (=> b!126701 m!147615))

(assert (=> b!126701 m!147611))

(declare-fun m!147617 () Bool)

(assert (=> b!126701 m!147617))

(declare-fun m!147619 () Bool)

(assert (=> b!126701 m!147619))

(declare-fun m!147621 () Bool)

(assert (=> b!126701 m!147621))

(assert (=> b!126701 m!147599))

(declare-fun m!147623 () Bool)

(assert (=> b!126701 m!147623))

(assert (=> b!126701 m!147603))

(declare-fun m!147625 () Bool)

(assert (=> b!126701 m!147625))

(declare-fun m!147627 () Bool)

(assert (=> b!126701 m!147627))

(assert (=> b!126699 m!147627))

(assert (=> b!126699 m!147627))

(declare-fun m!147629 () Bool)

(assert (=> b!126699 m!147629))

(declare-fun m!147631 () Bool)

(assert (=> bm!13642 m!147631))

(declare-fun m!147633 () Bool)

(assert (=> b!126689 m!147633))

(assert (=> b!126698 m!147627))

(declare-fun m!147635 () Bool)

(assert (=> b!126698 m!147635))

(assert (=> b!126698 m!147627))

(declare-fun m!147637 () Bool)

(assert (=> b!126698 m!147637))

(assert (=> b!126698 m!147637))

(declare-fun m!147639 () Bool)

(assert (=> b!126698 m!147639))

(declare-fun m!147641 () Bool)

(assert (=> b!126698 m!147641))

(assert (=> b!126698 m!147639))

(declare-fun m!147643 () Bool)

(assert (=> b!126688 m!147643))

(assert (=> bm!13640 m!147609))

(assert (=> b!126693 m!147627))

(assert (=> b!126693 m!147627))

(declare-fun m!147645 () Bool)

(assert (=> b!126693 m!147645))

(declare-fun m!147647 () Bool)

(assert (=> bm!13641 m!147647))

(declare-fun m!147649 () Bool)

(assert (=> b!126703 m!147649))

(declare-fun m!147651 () Bool)

(assert (=> bm!13644 m!147651))

(assert (=> b!126697 m!147627))

(assert (=> b!126697 m!147627))

(assert (=> b!126697 m!147629))

(declare-fun m!147653 () Bool)

(assert (=> d!38161 m!147653))

(assert (=> d!38151 d!38161))

(declare-fun d!38163 () Bool)

(assert (=> d!38163 (= (apply!111 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65013) (apply!111 lt!65021 lt!65013))))

(assert (=> d!38163 true))

(declare-fun _$34!950 () Unit!3922)

(assert (=> d!38163 (= (choose!769 lt!65021 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65013) _$34!950)))

(declare-fun bs!5232 () Bool)

(assert (= bs!5232 d!38163))

(assert (=> bs!5232 m!146933))

(assert (=> bs!5232 m!146933))

(assert (=> bs!5232 m!146955))

(assert (=> bs!5232 m!146949))

(assert (=> d!38107 d!38163))

(assert (=> d!38107 d!38101))

(assert (=> d!38107 d!38085))

(assert (=> d!38107 d!38083))

(declare-fun d!38165 () Bool)

(declare-fun e!82736 () Bool)

(assert (=> d!38165 e!82736))

(declare-fun res!61260 () Bool)

(assert (=> d!38165 (=> res!61260 e!82736)))

(declare-fun lt!65443 () Bool)

(assert (=> d!38165 (= res!61260 (not lt!65443))))

(declare-fun lt!65441 () Bool)

(assert (=> d!38165 (= lt!65443 lt!65441)))

(declare-fun lt!65444 () Unit!3922)

(declare-fun e!82737 () Unit!3922)

(assert (=> d!38165 (= lt!65444 e!82737)))

(declare-fun c!23183 () Bool)

(assert (=> d!38165 (= c!23183 lt!65441)))

(assert (=> d!38165 (= lt!65441 (containsKey!169 (toList!839 lt!65021) lt!65013))))

(assert (=> d!38165 (= (contains!867 lt!65021 lt!65013) lt!65443)))

(declare-fun b!126709 () Bool)

(declare-fun lt!65442 () Unit!3922)

(assert (=> b!126709 (= e!82737 lt!65442)))

(assert (=> b!126709 (= lt!65442 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65021) lt!65013))))

(assert (=> b!126709 (isDefined!119 (getValueByKey!165 (toList!839 lt!65021) lt!65013))))

(declare-fun b!126710 () Bool)

(declare-fun Unit!3942 () Unit!3922)

(assert (=> b!126710 (= e!82737 Unit!3942)))

(declare-fun b!126711 () Bool)

(assert (=> b!126711 (= e!82736 (isDefined!119 (getValueByKey!165 (toList!839 lt!65021) lt!65013)))))

(assert (= (and d!38165 c!23183) b!126709))

(assert (= (and d!38165 (not c!23183)) b!126710))

(assert (= (and d!38165 (not res!61260)) b!126711))

(declare-fun m!147655 () Bool)

(assert (=> d!38165 m!147655))

(declare-fun m!147657 () Bool)

(assert (=> b!126709 m!147657))

(assert (=> b!126709 m!147179))

(assert (=> b!126709 m!147179))

(declare-fun m!147659 () Bool)

(assert (=> b!126709 m!147659))

(assert (=> b!126711 m!147179))

(assert (=> b!126711 m!147179))

(assert (=> b!126711 m!147659))

(assert (=> d!38107 d!38165))

(declare-fun d!38167 () Bool)

(assert (=> d!38167 (= (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126518 d!38167))

(declare-fun b!126712 () Bool)

(declare-fun e!82739 () Bool)

(assert (=> b!126712 (= e!82739 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126712 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126713 () Bool)

(declare-fun e!82741 () Bool)

(declare-fun e!82743 () Bool)

(assert (=> b!126713 (= e!82741 e!82743)))

(declare-fun c!23185 () Bool)

(assert (=> b!126713 (= c!23185 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126714 () Bool)

(declare-fun res!61262 () Bool)

(declare-fun e!82738 () Bool)

(assert (=> b!126714 (=> (not res!61262) (not e!82738))))

(declare-fun lt!65449 () ListLongMap!1647)

(assert (=> b!126714 (= res!61262 (not (contains!867 lt!65449 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126715 () Bool)

(assert (=> b!126715 (= e!82743 (isEmpty!401 lt!65449))))

(declare-fun b!126716 () Bool)

(declare-fun e!82742 () ListLongMap!1647)

(assert (=> b!126716 (= e!82742 (ListLongMap!1648 Nil!1689))))

(declare-fun b!126717 () Bool)

(declare-fun e!82744 () ListLongMap!1647)

(declare-fun call!13648 () ListLongMap!1647)

(assert (=> b!126717 (= e!82744 call!13648)))

(declare-fun b!126718 () Bool)

(declare-fun e!82740 () Bool)

(assert (=> b!126718 (= e!82741 e!82740)))

(assert (=> b!126718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61264 () Bool)

(assert (=> b!126718 (= res!61264 (contains!867 lt!65449 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126718 (=> (not res!61264) (not e!82740))))

(declare-fun b!126719 () Bool)

(declare-fun lt!65445 () Unit!3922)

(declare-fun lt!65447 () Unit!3922)

(assert (=> b!126719 (= lt!65445 lt!65447)))

(declare-fun lt!65451 () V!3433)

(declare-fun lt!65450 () (_ BitVec 64))

(declare-fun lt!65446 () ListLongMap!1647)

(declare-fun lt!65448 () (_ BitVec 64))

(assert (=> b!126719 (not (contains!867 (+!158 lt!65446 (tuple2!2543 lt!65448 lt!65451)) lt!65450))))

(assert (=> b!126719 (= lt!65447 (addStillNotContains!57 lt!65446 lt!65448 lt!65451 lt!65450))))

(assert (=> b!126719 (= lt!65450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126719 (= lt!65451 (get!1442 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126719 (= lt!65448 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126719 (= lt!65446 call!13648)))

(assert (=> b!126719 (= e!82744 (+!158 call!13648 (tuple2!2543 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (get!1442 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38169 () Bool)

(assert (=> d!38169 e!82738))

(declare-fun res!61263 () Bool)

(assert (=> d!38169 (=> (not res!61263) (not e!82738))))

(assert (=> d!38169 (= res!61263 (not (contains!867 lt!65449 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38169 (= lt!65449 e!82742)))

(declare-fun c!23187 () Bool)

(assert (=> d!38169 (= c!23187 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38169 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38169 (= (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65449)))

(declare-fun b!126720 () Bool)

(assert (=> b!126720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> b!126720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))))))))

(assert (=> b!126720 (= e!82740 (= (apply!111 lt!65449 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126721 () Bool)

(assert (=> b!126721 (= e!82743 (= lt!65449 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13645 () Bool)

(assert (=> bm!13645 (= call!13648 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) (mask!7037 newMap!16) (ite (and c!23087 c!23089) lt!65100 (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126722 () Bool)

(assert (=> b!126722 (= e!82738 e!82741)))

(declare-fun c!23184 () Bool)

(assert (=> b!126722 (= c!23184 e!82739)))

(declare-fun res!61261 () Bool)

(assert (=> b!126722 (=> (not res!61261) (not e!82739))))

(assert (=> b!126722 (= res!61261 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126723 () Bool)

(assert (=> b!126723 (= e!82742 e!82744)))

(declare-fun c!23186 () Bool)

(assert (=> b!126723 (= c!23186 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38169 c!23187) b!126716))

(assert (= (and d!38169 (not c!23187)) b!126723))

(assert (= (and b!126723 c!23186) b!126719))

(assert (= (and b!126723 (not c!23186)) b!126717))

(assert (= (or b!126719 b!126717) bm!13645))

(assert (= (and d!38169 res!61263) b!126714))

(assert (= (and b!126714 res!61262) b!126722))

(assert (= (and b!126722 res!61261) b!126712))

(assert (= (and b!126722 c!23184) b!126718))

(assert (= (and b!126722 (not c!23184)) b!126713))

(assert (= (and b!126718 res!61264) b!126720))

(assert (= (and b!126713 c!23185) b!126721))

(assert (= (and b!126713 (not c!23185)) b!126715))

(declare-fun b_lambda!5579 () Bool)

(assert (=> (not b_lambda!5579) (not b!126719)))

(assert (=> b!126719 t!6042))

(declare-fun b_and!7789 () Bool)

(assert (= b_and!7785 (and (=> t!6042 result!3843) b_and!7789)))

(assert (=> b!126719 t!6044))

(declare-fun b_and!7791 () Bool)

(assert (= b_and!7787 (and (=> t!6044 result!3845) b_and!7791)))

(declare-fun b_lambda!5581 () Bool)

(assert (=> (not b_lambda!5581) (not b!126720)))

(assert (=> b!126720 t!6042))

(declare-fun b_and!7793 () Bool)

(assert (= b_and!7789 (and (=> t!6042 result!3843) b_and!7793)))

(assert (=> b!126720 t!6044))

(declare-fun b_and!7795 () Bool)

(assert (= b_and!7791 (and (=> t!6044 result!3845) b_and!7795)))

(declare-fun m!147661 () Bool)

(assert (=> b!126714 m!147661))

(assert (=> b!126723 m!147085))

(assert (=> b!126723 m!147085))

(assert (=> b!126723 m!147087))

(declare-fun m!147663 () Bool)

(assert (=> b!126721 m!147663))

(assert (=> b!126718 m!147085))

(assert (=> b!126718 m!147085))

(declare-fun m!147665 () Bool)

(assert (=> b!126718 m!147665))

(declare-fun m!147667 () Bool)

(assert (=> b!126715 m!147667))

(assert (=> b!126720 m!147085))

(assert (=> b!126720 m!147313))

(assert (=> b!126720 m!147085))

(declare-fun m!147669 () Bool)

(assert (=> b!126720 m!147669))

(assert (=> b!126720 m!147577))

(assert (=> b!126720 m!147577))

(assert (=> b!126720 m!147313))

(assert (=> b!126720 m!147579))

(assert (=> b!126712 m!147085))

(assert (=> b!126712 m!147085))

(assert (=> b!126712 m!147087))

(assert (=> bm!13645 m!147663))

(declare-fun m!147671 () Bool)

(assert (=> d!38169 m!147671))

(assert (=> d!38169 m!147061))

(assert (=> b!126719 m!147085))

(declare-fun m!147673 () Bool)

(assert (=> b!126719 m!147673))

(declare-fun m!147675 () Bool)

(assert (=> b!126719 m!147675))

(assert (=> b!126719 m!147313))

(assert (=> b!126719 m!147577))

(declare-fun m!147677 () Bool)

(assert (=> b!126719 m!147677))

(assert (=> b!126719 m!147673))

(declare-fun m!147679 () Bool)

(assert (=> b!126719 m!147679))

(assert (=> b!126719 m!147577))

(assert (=> b!126719 m!147313))

(assert (=> b!126719 m!147579))

(assert (=> b!126676 d!38169))

(declare-fun d!38171 () Bool)

(assert (=> d!38171 (= (apply!111 (+!158 lt!65415 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) lt!65407) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65415 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))) lt!65407)))))

(declare-fun bs!5233 () Bool)

(assert (= bs!5233 d!38171))

(declare-fun m!147681 () Bool)

(assert (=> bs!5233 m!147681))

(assert (=> bs!5233 m!147681))

(declare-fun m!147683 () Bool)

(assert (=> bs!5233 m!147683))

(assert (=> b!126676 d!38171))

(declare-fun d!38173 () Bool)

(assert (=> d!38173 (= (apply!111 (+!158 lt!65414 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) lt!65409) (apply!111 lt!65414 lt!65409))))

(declare-fun lt!65452 () Unit!3922)

(assert (=> d!38173 (= lt!65452 (choose!769 lt!65414 lt!65398 (minValue!2645 newMap!16) lt!65409))))

(declare-fun e!82745 () Bool)

(assert (=> d!38173 e!82745))

(declare-fun res!61265 () Bool)

(assert (=> d!38173 (=> (not res!61265) (not e!82745))))

(assert (=> d!38173 (= res!61265 (contains!867 lt!65414 lt!65409))))

(assert (=> d!38173 (= (addApplyDifferent!87 lt!65414 lt!65398 (minValue!2645 newMap!16) lt!65409) lt!65452)))

(declare-fun b!126724 () Bool)

(assert (=> b!126724 (= e!82745 (not (= lt!65409 lt!65398)))))

(assert (= (and d!38173 res!61265) b!126724))

(declare-fun m!147685 () Bool)

(assert (=> d!38173 m!147685))

(declare-fun m!147687 () Bool)

(assert (=> d!38173 m!147687))

(assert (=> d!38173 m!147549))

(assert (=> d!38173 m!147551))

(assert (=> d!38173 m!147565))

(assert (=> d!38173 m!147549))

(assert (=> b!126676 d!38173))

(declare-fun d!38175 () Bool)

(assert (=> d!38175 (= (apply!111 (+!158 lt!65414 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) lt!65409) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65414 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))) lt!65409)))))

(declare-fun bs!5234 () Bool)

(assert (= bs!5234 d!38175))

(declare-fun m!147689 () Bool)

(assert (=> bs!5234 m!147689))

(assert (=> bs!5234 m!147689))

(declare-fun m!147691 () Bool)

(assert (=> bs!5234 m!147691))

(assert (=> b!126676 d!38175))

(declare-fun d!38177 () Bool)

(assert (=> d!38177 (= (apply!111 lt!65399 lt!65402) (get!1446 (getValueByKey!165 (toList!839 lt!65399) lt!65402)))))

(declare-fun bs!5235 () Bool)

(assert (= bs!5235 d!38177))

(declare-fun m!147693 () Bool)

(assert (=> bs!5235 m!147693))

(assert (=> bs!5235 m!147693))

(declare-fun m!147695 () Bool)

(assert (=> bs!5235 m!147695))

(assert (=> b!126676 d!38177))

(declare-fun d!38179 () Bool)

(assert (=> d!38179 (= (apply!111 lt!65414 lt!65409) (get!1446 (getValueByKey!165 (toList!839 lt!65414) lt!65409)))))

(declare-fun bs!5236 () Bool)

(assert (= bs!5236 d!38179))

(declare-fun m!147697 () Bool)

(assert (=> bs!5236 m!147697))

(assert (=> bs!5236 m!147697))

(declare-fun m!147699 () Bool)

(assert (=> bs!5236 m!147699))

(assert (=> b!126676 d!38179))

(declare-fun d!38181 () Bool)

(assert (=> d!38181 (= (apply!111 (+!158 lt!65399 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65402) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65399 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65402)))))

(declare-fun bs!5237 () Bool)

(assert (= bs!5237 d!38181))

(declare-fun m!147701 () Bool)

(assert (=> bs!5237 m!147701))

(assert (=> bs!5237 m!147701))

(declare-fun m!147703 () Bool)

(assert (=> bs!5237 m!147703))

(assert (=> b!126676 d!38181))

(declare-fun d!38183 () Bool)

(declare-fun e!82746 () Bool)

(assert (=> d!38183 e!82746))

(declare-fun res!61266 () Bool)

(assert (=> d!38183 (=> (not res!61266) (not e!82746))))

(declare-fun lt!65455 () ListLongMap!1647)

(assert (=> d!38183 (= res!61266 (contains!867 lt!65455 (_1!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(declare-fun lt!65453 () List!1692)

(assert (=> d!38183 (= lt!65455 (ListLongMap!1648 lt!65453))))

(declare-fun lt!65456 () Unit!3922)

(declare-fun lt!65454 () Unit!3922)

(assert (=> d!38183 (= lt!65456 lt!65454)))

(assert (=> d!38183 (= (getValueByKey!165 lt!65453 (_1!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38183 (= lt!65454 (lemmaContainsTupThenGetReturnValue!83 lt!65453 (_1!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38183 (= lt!65453 (insertStrictlySorted!86 (toList!839 lt!65399) (_1!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38183 (= (+!158 lt!65399 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65455)))

(declare-fun b!126725 () Bool)

(declare-fun res!61267 () Bool)

(assert (=> b!126725 (=> (not res!61267) (not e!82746))))

(assert (=> b!126725 (= res!61267 (= (getValueByKey!165 (toList!839 lt!65455) (_1!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))))

(declare-fun b!126726 () Bool)

(assert (=> b!126726 (= e!82746 (contains!869 (toList!839 lt!65455) (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))

(assert (= (and d!38183 res!61266) b!126725))

(assert (= (and b!126725 res!61267) b!126726))

(declare-fun m!147705 () Bool)

(assert (=> d!38183 m!147705))

(declare-fun m!147707 () Bool)

(assert (=> d!38183 m!147707))

(declare-fun m!147709 () Bool)

(assert (=> d!38183 m!147709))

(declare-fun m!147711 () Bool)

(assert (=> d!38183 m!147711))

(declare-fun m!147713 () Bool)

(assert (=> b!126725 m!147713))

(declare-fun m!147715 () Bool)

(assert (=> b!126726 m!147715))

(assert (=> b!126676 d!38183))

(declare-fun d!38185 () Bool)

(declare-fun e!82747 () Bool)

(assert (=> d!38185 e!82747))

(declare-fun res!61268 () Bool)

(assert (=> d!38185 (=> (not res!61268) (not e!82747))))

(declare-fun lt!65459 () ListLongMap!1647)

(assert (=> d!38185 (= res!61268 (contains!867 lt!65459 (_1!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))))))

(declare-fun lt!65457 () List!1692)

(assert (=> d!38185 (= lt!65459 (ListLongMap!1648 lt!65457))))

(declare-fun lt!65460 () Unit!3922)

(declare-fun lt!65458 () Unit!3922)

(assert (=> d!38185 (= lt!65460 lt!65458)))

(assert (=> d!38185 (= (getValueByKey!165 lt!65457 (_1!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))))))

(assert (=> d!38185 (= lt!65458 (lemmaContainsTupThenGetReturnValue!83 lt!65457 (_1!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))))))

(assert (=> d!38185 (= lt!65457 (insertStrictlySorted!86 (toList!839 lt!65414) (_1!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))))))

(assert (=> d!38185 (= (+!158 lt!65414 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))) lt!65459)))

(declare-fun b!126727 () Bool)

(declare-fun res!61269 () Bool)

(assert (=> b!126727 (=> (not res!61269) (not e!82747))))

(assert (=> b!126727 (= res!61269 (= (getValueByKey!165 (toList!839 lt!65459) (_1!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65398 (minValue!2645 newMap!16))))))))

(declare-fun b!126728 () Bool)

(assert (=> b!126728 (= e!82747 (contains!869 (toList!839 lt!65459) (tuple2!2543 lt!65398 (minValue!2645 newMap!16))))))

(assert (= (and d!38185 res!61268) b!126727))

(assert (= (and b!126727 res!61269) b!126728))

(declare-fun m!147717 () Bool)

(assert (=> d!38185 m!147717))

(declare-fun m!147719 () Bool)

(assert (=> d!38185 m!147719))

(declare-fun m!147721 () Bool)

(assert (=> d!38185 m!147721))

(declare-fun m!147723 () Bool)

(assert (=> d!38185 m!147723))

(declare-fun m!147725 () Bool)

(assert (=> b!126727 m!147725))

(declare-fun m!147727 () Bool)

(assert (=> b!126728 m!147727))

(assert (=> b!126676 d!38185))

(declare-fun d!38187 () Bool)

(assert (=> d!38187 (contains!867 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65410)))

(declare-fun lt!65461 () Unit!3922)

(assert (=> d!38187 (= lt!65461 (choose!770 lt!65400 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65410))))

(assert (=> d!38187 (contains!867 lt!65400 lt!65410)))

(assert (=> d!38187 (= (addStillContains!87 lt!65400 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65410) lt!65461)))

(declare-fun bs!5238 () Bool)

(assert (= bs!5238 d!38187))

(assert (=> bs!5238 m!147543))

(assert (=> bs!5238 m!147543))

(assert (=> bs!5238 m!147545))

(declare-fun m!147729 () Bool)

(assert (=> bs!5238 m!147729))

(declare-fun m!147731 () Bool)

(assert (=> bs!5238 m!147731))

(assert (=> b!126676 d!38187))

(declare-fun d!38189 () Bool)

(assert (=> d!38189 (= (apply!111 (+!158 lt!65399 (tuple2!2543 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65402) (apply!111 lt!65399 lt!65402))))

(declare-fun lt!65462 () Unit!3922)

(assert (=> d!38189 (= lt!65462 (choose!769 lt!65399 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65402))))

(declare-fun e!82748 () Bool)

(assert (=> d!38189 e!82748))

(declare-fun res!61270 () Bool)

(assert (=> d!38189 (=> (not res!61270) (not e!82748))))

(assert (=> d!38189 (= res!61270 (contains!867 lt!65399 lt!65402))))

(assert (=> d!38189 (= (addApplyDifferent!87 lt!65399 lt!65397 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65402) lt!65462)))

(declare-fun b!126729 () Bool)

(assert (=> b!126729 (= e!82748 (not (= lt!65402 lt!65397)))))

(assert (= (and d!38189 res!61270) b!126729))

(declare-fun m!147733 () Bool)

(assert (=> d!38189 m!147733))

(declare-fun m!147735 () Bool)

(assert (=> d!38189 m!147735))

(assert (=> d!38189 m!147555))

(assert (=> d!38189 m!147561))

(assert (=> d!38189 m!147567))

(assert (=> d!38189 m!147555))

(assert (=> b!126676 d!38189))

(declare-fun d!38191 () Bool)

(assert (=> d!38191 (= (apply!111 (+!158 lt!65415 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) lt!65407) (apply!111 lt!65415 lt!65407))))

(declare-fun lt!65463 () Unit!3922)

(assert (=> d!38191 (= lt!65463 (choose!769 lt!65415 lt!65408 (minValue!2645 newMap!16) lt!65407))))

(declare-fun e!82749 () Bool)

(assert (=> d!38191 e!82749))

(declare-fun res!61271 () Bool)

(assert (=> d!38191 (=> (not res!61271) (not e!82749))))

(assert (=> d!38191 (= res!61271 (contains!867 lt!65415 lt!65407))))

(assert (=> d!38191 (= (addApplyDifferent!87 lt!65415 lt!65408 (minValue!2645 newMap!16) lt!65407) lt!65463)))

(declare-fun b!126730 () Bool)

(assert (=> b!126730 (= e!82749 (not (= lt!65407 lt!65408)))))

(assert (= (and d!38191 res!61271) b!126730))

(declare-fun m!147737 () Bool)

(assert (=> d!38191 m!147737))

(declare-fun m!147739 () Bool)

(assert (=> d!38191 m!147739))

(assert (=> d!38191 m!147547))

(assert (=> d!38191 m!147569))

(assert (=> d!38191 m!147563))

(assert (=> d!38191 m!147547))

(assert (=> b!126676 d!38191))

(declare-fun d!38193 () Bool)

(assert (=> d!38193 (= (apply!111 lt!65415 lt!65407) (get!1446 (getValueByKey!165 (toList!839 lt!65415) lt!65407)))))

(declare-fun bs!5239 () Bool)

(assert (= bs!5239 d!38193))

(declare-fun m!147741 () Bool)

(assert (=> bs!5239 m!147741))

(assert (=> bs!5239 m!147741))

(declare-fun m!147743 () Bool)

(assert (=> bs!5239 m!147743))

(assert (=> b!126676 d!38193))

(declare-fun d!38195 () Bool)

(declare-fun e!82750 () Bool)

(assert (=> d!38195 e!82750))

(declare-fun res!61272 () Bool)

(assert (=> d!38195 (=> (not res!61272) (not e!82750))))

(declare-fun lt!65466 () ListLongMap!1647)

(assert (=> d!38195 (= res!61272 (contains!867 lt!65466 (_1!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))))))

(declare-fun lt!65464 () List!1692)

(assert (=> d!38195 (= lt!65466 (ListLongMap!1648 lt!65464))))

(declare-fun lt!65467 () Unit!3922)

(declare-fun lt!65465 () Unit!3922)

(assert (=> d!38195 (= lt!65467 lt!65465)))

(assert (=> d!38195 (= (getValueByKey!165 lt!65464 (_1!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))))))

(assert (=> d!38195 (= lt!65465 (lemmaContainsTupThenGetReturnValue!83 lt!65464 (_1!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))))))

(assert (=> d!38195 (= lt!65464 (insertStrictlySorted!86 (toList!839 lt!65415) (_1!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))))))

(assert (=> d!38195 (= (+!158 lt!65415 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))) lt!65466)))

(declare-fun b!126731 () Bool)

(declare-fun res!61273 () Bool)

(assert (=> b!126731 (=> (not res!61273) (not e!82750))))

(assert (=> b!126731 (= res!61273 (= (getValueByKey!165 (toList!839 lt!65466) (_1!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65408 (minValue!2645 newMap!16))))))))

(declare-fun b!126732 () Bool)

(assert (=> b!126732 (= e!82750 (contains!869 (toList!839 lt!65466) (tuple2!2543 lt!65408 (minValue!2645 newMap!16))))))

(assert (= (and d!38195 res!61272) b!126731))

(assert (= (and b!126731 res!61273) b!126732))

(declare-fun m!147745 () Bool)

(assert (=> d!38195 m!147745))

(declare-fun m!147747 () Bool)

(assert (=> d!38195 m!147747))

(declare-fun m!147749 () Bool)

(assert (=> d!38195 m!147749))

(declare-fun m!147751 () Bool)

(assert (=> d!38195 m!147751))

(declare-fun m!147753 () Bool)

(assert (=> b!126731 m!147753))

(declare-fun m!147755 () Bool)

(assert (=> b!126732 m!147755))

(assert (=> b!126676 d!38195))

(declare-fun d!38197 () Bool)

(declare-fun e!82751 () Bool)

(assert (=> d!38197 e!82751))

(declare-fun res!61274 () Bool)

(assert (=> d!38197 (=> res!61274 e!82751)))

(declare-fun lt!65470 () Bool)

(assert (=> d!38197 (= res!61274 (not lt!65470))))

(declare-fun lt!65468 () Bool)

(assert (=> d!38197 (= lt!65470 lt!65468)))

(declare-fun lt!65471 () Unit!3922)

(declare-fun e!82752 () Unit!3922)

(assert (=> d!38197 (= lt!65471 e!82752)))

(declare-fun c!23188 () Bool)

(assert (=> d!38197 (= c!23188 lt!65468)))

(assert (=> d!38197 (= lt!65468 (containsKey!169 (toList!839 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65410))))

(assert (=> d!38197 (= (contains!867 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65410) lt!65470)))

(declare-fun b!126733 () Bool)

(declare-fun lt!65469 () Unit!3922)

(assert (=> b!126733 (= e!82752 lt!65469)))

(assert (=> b!126733 (= lt!65469 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65410))))

(assert (=> b!126733 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65410))))

(declare-fun b!126734 () Bool)

(declare-fun Unit!3943 () Unit!3922)

(assert (=> b!126734 (= e!82752 Unit!3943)))

(declare-fun b!126735 () Bool)

(assert (=> b!126735 (= e!82751 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65410)))))

(assert (= (and d!38197 c!23188) b!126733))

(assert (= (and d!38197 (not c!23188)) b!126734))

(assert (= (and d!38197 (not res!61274)) b!126735))

(declare-fun m!147757 () Bool)

(assert (=> d!38197 m!147757))

(declare-fun m!147759 () Bool)

(assert (=> b!126733 m!147759))

(declare-fun m!147761 () Bool)

(assert (=> b!126733 m!147761))

(assert (=> b!126733 m!147761))

(declare-fun m!147763 () Bool)

(assert (=> b!126733 m!147763))

(assert (=> b!126735 m!147761))

(assert (=> b!126735 m!147761))

(assert (=> b!126735 m!147763))

(assert (=> b!126676 d!38197))

(declare-fun d!38199 () Bool)

(declare-fun e!82753 () Bool)

(assert (=> d!38199 e!82753))

(declare-fun res!61275 () Bool)

(assert (=> d!38199 (=> (not res!61275) (not e!82753))))

(declare-fun lt!65474 () ListLongMap!1647)

(assert (=> d!38199 (= res!61275 (contains!867 lt!65474 (_1!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(declare-fun lt!65472 () List!1692)

(assert (=> d!38199 (= lt!65474 (ListLongMap!1648 lt!65472))))

(declare-fun lt!65475 () Unit!3922)

(declare-fun lt!65473 () Unit!3922)

(assert (=> d!38199 (= lt!65475 lt!65473)))

(assert (=> d!38199 (= (getValueByKey!165 lt!65472 (_1!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38199 (= lt!65473 (lemmaContainsTupThenGetReturnValue!83 lt!65472 (_1!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38199 (= lt!65472 (insertStrictlySorted!86 (toList!839 lt!65400) (_1!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38199 (= (+!158 lt!65400 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65474)))

(declare-fun b!126736 () Bool)

(declare-fun res!61276 () Bool)

(assert (=> b!126736 (=> (not res!61276) (not e!82753))))

(assert (=> b!126736 (= res!61276 (= (getValueByKey!165 (toList!839 lt!65474) (_1!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))))

(declare-fun b!126737 () Bool)

(assert (=> b!126737 (= e!82753 (contains!869 (toList!839 lt!65474) (tuple2!2543 lt!65413 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))

(assert (= (and d!38199 res!61275) b!126736))

(assert (= (and b!126736 res!61276) b!126737))

(declare-fun m!147765 () Bool)

(assert (=> d!38199 m!147765))

(declare-fun m!147767 () Bool)

(assert (=> d!38199 m!147767))

(declare-fun m!147769 () Bool)

(assert (=> d!38199 m!147769))

(declare-fun m!147771 () Bool)

(assert (=> d!38199 m!147771))

(declare-fun m!147773 () Bool)

(assert (=> b!126736 m!147773))

(declare-fun m!147775 () Bool)

(assert (=> b!126737 m!147775))

(assert (=> b!126676 d!38199))

(declare-fun d!38201 () Bool)

(declare-fun res!61277 () Bool)

(declare-fun e!82754 () Bool)

(assert (=> d!38201 (=> res!61277 e!82754)))

(assert (=> d!38201 (= res!61277 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38201 (= (containsKey!169 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!82754)))

(declare-fun b!126738 () Bool)

(declare-fun e!82755 () Bool)

(assert (=> b!126738 (= e!82754 e!82755)))

(declare-fun res!61278 () Bool)

(assert (=> b!126738 (=> (not res!61278) (not e!82755))))

(assert (=> b!126738 (= res!61278 (and (or (not ((_ is Cons!1688) (toList!839 lt!65010))) (bvsle (_1!1282 (h!2290 (toList!839 lt!65010))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1688) (toList!839 lt!65010)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65010))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!126739 () Bool)

(assert (=> b!126739 (= e!82755 (containsKey!169 (t!6030 (toList!839 lt!65010)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38201 (not res!61277)) b!126738))

(assert (= (and b!126738 res!61278) b!126739))

(assert (=> b!126739 m!146957))

(declare-fun m!147777 () Bool)

(assert (=> b!126739 m!147777))

(assert (=> d!38141 d!38201))

(assert (=> b!126484 d!38079))

(assert (=> b!126672 d!38167))

(declare-fun b!126740 () Bool)

(declare-fun e!82756 () Option!171)

(assert (=> b!126740 (= e!82756 (Some!170 (_2!1282 (h!2290 (t!6030 (toList!839 lt!64938))))))))

(declare-fun e!82757 () Option!171)

(declare-fun b!126742 () Bool)

(assert (=> b!126742 (= e!82757 (getValueByKey!165 (t!6030 (t!6030 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun d!38203 () Bool)

(declare-fun c!23189 () Bool)

(assert (=> d!38203 (= c!23189 (and ((_ is Cons!1688) (t!6030 (toList!839 lt!64938))) (= (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938)))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38203 (= (getValueByKey!165 (t!6030 (toList!839 lt!64938)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82756)))

(declare-fun b!126743 () Bool)

(assert (=> b!126743 (= e!82757 None!169)))

(declare-fun b!126741 () Bool)

(assert (=> b!126741 (= e!82756 e!82757)))

(declare-fun c!23190 () Bool)

(assert (=> b!126741 (= c!23190 (and ((_ is Cons!1688) (t!6030 (toList!839 lt!64938))) (not (= (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938)))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(assert (= (and d!38203 c!23189) b!126740))

(assert (= (and d!38203 (not c!23189)) b!126741))

(assert (= (and b!126741 c!23190) b!126742))

(assert (= (and b!126741 (not c!23190)) b!126743))

(assert (=> b!126742 m!146811))

(declare-fun m!147779 () Bool)

(assert (=> b!126742 m!147779))

(assert (=> b!126355 d!38203))

(declare-fun d!38205 () Bool)

(assert (=> d!38205 (isDefined!119 (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun lt!65476 () Unit!3922)

(assert (=> d!38205 (= lt!65476 (choose!768 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun e!82758 () Bool)

(assert (=> d!38205 e!82758))

(declare-fun res!61279 () Bool)

(assert (=> d!38205 (=> (not res!61279) (not e!82758))))

(assert (=> d!38205 (= res!61279 (isStrictlySorted!312 (toList!839 call!13571)))))

(assert (=> d!38205 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65476)))

(declare-fun b!126744 () Bool)

(assert (=> b!126744 (= e!82758 (containsKey!169 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38205 res!61279) b!126744))

(assert (=> d!38205 m!146811))

(assert (=> d!38205 m!147535))

(assert (=> d!38205 m!147535))

(assert (=> d!38205 m!147537))

(assert (=> d!38205 m!146811))

(declare-fun m!147781 () Bool)

(assert (=> d!38205 m!147781))

(declare-fun m!147783 () Bool)

(assert (=> d!38205 m!147783))

(assert (=> b!126744 m!146811))

(assert (=> b!126744 m!147531))

(assert (=> b!126659 d!38205))

(declare-fun d!38207 () Bool)

(assert (=> d!38207 (= (isDefined!119 (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) (not (isEmpty!400 (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(declare-fun bs!5240 () Bool)

(assert (= bs!5240 d!38207))

(assert (=> bs!5240 m!147535))

(declare-fun m!147785 () Bool)

(assert (=> bs!5240 m!147785))

(assert (=> b!126659 d!38207))

(declare-fun b!126745 () Bool)

(declare-fun e!82759 () Option!171)

(assert (=> b!126745 (= e!82759 (Some!170 (_2!1282 (h!2290 (toList!839 call!13571)))))))

(declare-fun e!82760 () Option!171)

(declare-fun b!126747 () Bool)

(assert (=> b!126747 (= e!82760 (getValueByKey!165 (t!6030 (toList!839 call!13571)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun d!38209 () Bool)

(declare-fun c!23191 () Bool)

(assert (=> d!38209 (= c!23191 (and ((_ is Cons!1688) (toList!839 call!13571)) (= (_1!1282 (h!2290 (toList!839 call!13571))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38209 (= (getValueByKey!165 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82759)))

(declare-fun b!126748 () Bool)

(assert (=> b!126748 (= e!82760 None!169)))

(declare-fun b!126746 () Bool)

(assert (=> b!126746 (= e!82759 e!82760)))

(declare-fun c!23192 () Bool)

(assert (=> b!126746 (= c!23192 (and ((_ is Cons!1688) (toList!839 call!13571)) (not (= (_1!1282 (h!2290 (toList!839 call!13571))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(assert (= (and d!38209 c!23191) b!126745))

(assert (= (and d!38209 (not c!23191)) b!126746))

(assert (= (and b!126746 c!23192) b!126747))

(assert (= (and b!126746 (not c!23192)) b!126748))

(assert (=> b!126747 m!146811))

(declare-fun m!147787 () Bool)

(assert (=> b!126747 m!147787))

(assert (=> b!126659 d!38209))

(declare-fun b!126749 () Bool)

(declare-fun e!82761 () Option!171)

(assert (=> b!126749 (= e!82761 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65167)))))))

(declare-fun b!126751 () Bool)

(declare-fun e!82762 () Option!171)

(assert (=> b!126751 (= e!82762 (getValueByKey!165 (t!6030 (toList!839 lt!65167)) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38211 () Bool)

(declare-fun c!23193 () Bool)

(assert (=> d!38211 (= c!23193 (and ((_ is Cons!1688) (toList!839 lt!65167)) (= (_1!1282 (h!2290 (toList!839 lt!65167))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38211 (= (getValueByKey!165 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82761)))

(declare-fun b!126752 () Bool)

(assert (=> b!126752 (= e!82762 None!169)))

(declare-fun b!126750 () Bool)

(assert (=> b!126750 (= e!82761 e!82762)))

(declare-fun c!23194 () Bool)

(assert (=> b!126750 (= c!23194 (and ((_ is Cons!1688) (toList!839 lt!65167)) (not (= (_1!1282 (h!2290 (toList!839 lt!65167))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38211 c!23193) b!126749))

(assert (= (and d!38211 (not c!23193)) b!126750))

(assert (= (and b!126750 c!23194) b!126751))

(assert (= (and b!126750 (not c!23194)) b!126752))

(declare-fun m!147789 () Bool)

(assert (=> b!126751 m!147789))

(assert (=> b!126417 d!38211))

(declare-fun b!126753 () Bool)

(declare-fun e!82763 () (_ BitVec 32))

(declare-fun call!13649 () (_ BitVec 32))

(assert (=> b!126753 (= e!82763 (bvadd #b00000000000000000000000000000001 call!13649))))

(declare-fun bm!13646 () Bool)

(assert (=> bm!13646 (= call!13649 (arrayCountValidKeys!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126754 () Bool)

(assert (=> b!126754 (= e!82763 call!13649)))

(declare-fun b!126755 () Bool)

(declare-fun e!82764 () (_ BitVec 32))

(assert (=> b!126755 (= e!82764 #b00000000000000000000000000000000)))

(declare-fun b!126756 () Bool)

(assert (=> b!126756 (= e!82764 e!82763)))

(declare-fun c!23195 () Bool)

(assert (=> b!126756 (= c!23195 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!38213 () Bool)

(declare-fun lt!65477 () (_ BitVec 32))

(assert (=> d!38213 (and (bvsge lt!65477 #b00000000000000000000000000000000) (bvsle lt!65477 (bvsub (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!38213 (= lt!65477 e!82764)))

(declare-fun c!23196 () Bool)

(assert (=> d!38213 (= c!23196 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38213 (and (bvsle #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38213 (= (arrayCountValidKeys!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))) lt!65477)))

(assert (= (and d!38213 c!23196) b!126755))

(assert (= (and d!38213 (not c!23196)) b!126756))

(assert (= (and b!126756 c!23195) b!126753))

(assert (= (and b!126756 (not c!23195)) b!126754))

(assert (= (or b!126753 b!126754) bm!13646))

(declare-fun m!147791 () Bool)

(assert (=> bm!13646 m!147791))

(declare-fun m!147793 () Bool)

(assert (=> b!126756 m!147793))

(assert (=> b!126756 m!147793))

(declare-fun m!147795 () Bool)

(assert (=> b!126756 m!147795))

(assert (=> b!126357 d!38213))

(declare-fun d!38215 () Bool)

(assert (=> d!38215 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65478 () Unit!3922)

(assert (=> d!38215 (= lt!65478 (choose!768 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82765 () Bool)

(assert (=> d!38215 e!82765))

(declare-fun res!61280 () Bool)

(assert (=> d!38215 (=> (not res!61280) (not e!82765))))

(assert (=> d!38215 (= res!61280 (isStrictlySorted!312 (toList!839 lt!65010)))))

(assert (=> d!38215 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000) lt!65478)))

(declare-fun b!126757 () Bool)

(assert (=> b!126757 (= e!82765 (containsKey!169 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38215 res!61280) b!126757))

(assert (=> d!38215 m!147051))

(assert (=> d!38215 m!147051))

(assert (=> d!38215 m!147083))

(declare-fun m!147797 () Bool)

(assert (=> d!38215 m!147797))

(declare-fun m!147799 () Bool)

(assert (=> d!38215 m!147799))

(assert (=> b!126757 m!147079))

(assert (=> b!126360 d!38215))

(declare-fun d!38217 () Bool)

(assert (=> d!38217 (= (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!400 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5241 () Bool)

(assert (= bs!5241 d!38217))

(assert (=> bs!5241 m!147051))

(declare-fun m!147801 () Bool)

(assert (=> bs!5241 m!147801))

(assert (=> b!126360 d!38217))

(declare-fun b!126758 () Bool)

(declare-fun e!82766 () Option!171)

(assert (=> b!126758 (= e!82766 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65010)))))))

(declare-fun b!126760 () Bool)

(declare-fun e!82767 () Option!171)

(assert (=> b!126760 (= e!82767 (getValueByKey!165 (t!6030 (toList!839 lt!65010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38219 () Bool)

(declare-fun c!23197 () Bool)

(assert (=> d!38219 (= c!23197 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38219 (= (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000) e!82766)))

(declare-fun b!126761 () Bool)

(assert (=> b!126761 (= e!82767 None!169)))

(declare-fun b!126759 () Bool)

(assert (=> b!126759 (= e!82766 e!82767)))

(declare-fun c!23198 () Bool)

(assert (=> b!126759 (= c!23198 (and ((_ is Cons!1688) (toList!839 lt!65010)) (not (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38219 c!23197) b!126758))

(assert (= (and d!38219 (not c!23197)) b!126759))

(assert (= (and b!126759 c!23198) b!126760))

(assert (= (and b!126759 (not c!23198)) b!126761))

(declare-fun m!147803 () Bool)

(assert (=> b!126760 m!147803))

(assert (=> b!126360 d!38219))

(declare-fun b!126765 () Bool)

(declare-fun e!82768 () Bool)

(assert (=> b!126765 (= e!82768 (and (bvsge (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000011) (bvsge (_vacant!579 (_2!1283 lt!65108)) #b00000000000000000000000000000000)))))

(declare-fun b!126763 () Bool)

(declare-fun res!61283 () Bool)

(assert (=> b!126763 (=> (not res!61283) (not e!82768))))

(assert (=> b!126763 (= res!61283 (bvsge (size!2483 (_2!1283 lt!65108)) (_size!579 (_2!1283 lt!65108))))))

(declare-fun b!126762 () Bool)

(declare-fun res!61284 () Bool)

(assert (=> b!126762 (=> (not res!61284) (not e!82768))))

(assert (=> b!126762 (= res!61284 (and (= (size!2478 (_values!2765 (_2!1283 lt!65108))) (bvadd (mask!7037 (_2!1283 lt!65108)) #b00000000000000000000000000000001)) (= (size!2477 (_keys!4514 (_2!1283 lt!65108))) (size!2478 (_values!2765 (_2!1283 lt!65108)))) (bvsge (_size!579 (_2!1283 lt!65108)) #b00000000000000000000000000000000) (bvsle (_size!579 (_2!1283 lt!65108)) (bvadd (mask!7037 (_2!1283 lt!65108)) #b00000000000000000000000000000001))))))

(declare-fun d!38221 () Bool)

(declare-fun res!61282 () Bool)

(assert (=> d!38221 (=> (not res!61282) (not e!82768))))

(assert (=> d!38221 (= res!61282 (validMask!0 (mask!7037 (_2!1283 lt!65108))))))

(assert (=> d!38221 (= (simpleValid!87 (_2!1283 lt!65108)) e!82768)))

(declare-fun b!126764 () Bool)

(declare-fun res!61281 () Bool)

(assert (=> b!126764 (=> (not res!61281) (not e!82768))))

(assert (=> b!126764 (= res!61281 (= (size!2483 (_2!1283 lt!65108)) (bvadd (_size!579 (_2!1283 lt!65108)) (bvsdiv (bvadd (extraKeys!2563 (_2!1283 lt!65108)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!38221 res!61282) b!126762))

(assert (= (and b!126762 res!61284) b!126763))

(assert (= (and b!126763 res!61283) b!126764))

(assert (= (and b!126764 res!61281) b!126765))

(declare-fun m!147805 () Bool)

(assert (=> b!126763 m!147805))

(assert (=> d!38221 m!147653))

(assert (=> b!126764 m!147805))

(assert (=> d!38145 d!38221))

(declare-fun d!38223 () Bool)

(declare-fun e!82769 () Bool)

(assert (=> d!38223 e!82769))

(declare-fun res!61285 () Bool)

(assert (=> d!38223 (=> res!61285 e!82769)))

(declare-fun lt!65481 () Bool)

(assert (=> d!38223 (= res!61285 (not lt!65481))))

(declare-fun lt!65479 () Bool)

(assert (=> d!38223 (= lt!65481 lt!65479)))

(declare-fun lt!65482 () Unit!3922)

(declare-fun e!82770 () Unit!3922)

(assert (=> d!38223 (= lt!65482 e!82770)))

(declare-fun c!23199 () Bool)

(assert (=> d!38223 (= c!23199 lt!65479)))

(assert (=> d!38223 (= lt!65479 (containsKey!169 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38223 (= (contains!867 lt!65175 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65481)))

(declare-fun b!126766 () Bool)

(declare-fun lt!65480 () Unit!3922)

(assert (=> b!126766 (= e!82770 lt!65480)))

(assert (=> b!126766 (= lt!65480 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> b!126766 (isDefined!119 (getValueByKey!165 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126767 () Bool)

(declare-fun Unit!3944 () Unit!3922)

(assert (=> b!126767 (= e!82770 Unit!3944)))

(declare-fun b!126768 () Bool)

(assert (=> b!126768 (= e!82769 (isDefined!119 (getValueByKey!165 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38223 c!23199) b!126766))

(assert (= (and d!38223 (not c!23199)) b!126767))

(assert (= (and d!38223 (not res!61285)) b!126768))

(declare-fun m!147807 () Bool)

(assert (=> d!38223 m!147807))

(declare-fun m!147809 () Bool)

(assert (=> b!126766 m!147809))

(assert (=> b!126766 m!147175))

(assert (=> b!126766 m!147175))

(declare-fun m!147811 () Bool)

(assert (=> b!126766 m!147811))

(assert (=> b!126768 m!147175))

(assert (=> b!126768 m!147175))

(assert (=> b!126768 m!147811))

(assert (=> d!38083 d!38223))

(declare-fun b!126769 () Bool)

(declare-fun e!82771 () Option!171)

(assert (=> b!126769 (= e!82771 (Some!170 (_2!1282 (h!2290 lt!65173))))))

(declare-fun b!126771 () Bool)

(declare-fun e!82772 () Option!171)

(assert (=> b!126771 (= e!82772 (getValueByKey!165 (t!6030 lt!65173) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun c!23200 () Bool)

(declare-fun d!38225 () Bool)

(assert (=> d!38225 (= c!23200 (and ((_ is Cons!1688) lt!65173) (= (_1!1282 (h!2290 lt!65173)) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38225 (= (getValueByKey!165 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82771)))

(declare-fun b!126772 () Bool)

(assert (=> b!126772 (= e!82772 None!169)))

(declare-fun b!126770 () Bool)

(assert (=> b!126770 (= e!82771 e!82772)))

(declare-fun c!23201 () Bool)

(assert (=> b!126770 (= c!23201 (and ((_ is Cons!1688) lt!65173) (not (= (_1!1282 (h!2290 lt!65173)) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38225 c!23200) b!126769))

(assert (= (and d!38225 (not c!23200)) b!126770))

(assert (= (and b!126770 c!23201) b!126771))

(assert (= (and b!126770 (not c!23201)) b!126772))

(declare-fun m!147813 () Bool)

(assert (=> b!126771 m!147813))

(assert (=> d!38083 d!38225))

(declare-fun d!38227 () Bool)

(assert (=> d!38227 (= (getValueByKey!165 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65485 () Unit!3922)

(declare-fun choose!776 (List!1692 (_ BitVec 64) V!3433) Unit!3922)

(assert (=> d!38227 (= lt!65485 (choose!776 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!82775 () Bool)

(assert (=> d!38227 e!82775))

(declare-fun res!61290 () Bool)

(assert (=> d!38227 (=> (not res!61290) (not e!82775))))

(assert (=> d!38227 (= res!61290 (isStrictlySorted!312 lt!65173))))

(assert (=> d!38227 (= (lemmaContainsTupThenGetReturnValue!83 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65485)))

(declare-fun b!126777 () Bool)

(declare-fun res!61291 () Bool)

(assert (=> b!126777 (=> (not res!61291) (not e!82775))))

(assert (=> b!126777 (= res!61291 (containsKey!169 lt!65173 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126778 () Bool)

(assert (=> b!126778 (= e!82775 (contains!869 lt!65173 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38227 res!61290) b!126777))

(assert (= (and b!126777 res!61291) b!126778))

(assert (=> d!38227 m!147169))

(declare-fun m!147815 () Bool)

(assert (=> d!38227 m!147815))

(declare-fun m!147817 () Bool)

(assert (=> d!38227 m!147817))

(declare-fun m!147819 () Bool)

(assert (=> b!126777 m!147819))

(declare-fun m!147821 () Bool)

(assert (=> b!126778 m!147821))

(assert (=> d!38083 d!38227))

(declare-fun bm!13653 () Bool)

(declare-fun call!13657 () List!1692)

(declare-fun call!13656 () List!1692)

(assert (=> bm!13653 (= call!13657 call!13656)))

(declare-fun b!126799 () Bool)

(declare-fun e!82786 () Bool)

(declare-fun lt!65488 () List!1692)

(assert (=> b!126799 (= e!82786 (contains!869 lt!65488 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun c!23213 () Bool)

(declare-fun bm!13654 () Bool)

(declare-fun e!82788 () List!1692)

(declare-fun $colon$colon!88 (List!1692 tuple2!2542) List!1692)

(assert (=> bm!13654 (= call!13656 ($colon$colon!88 e!82788 (ite c!23213 (h!2290 (toList!839 lt!65021)) (tuple2!2543 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun c!23211 () Bool)

(assert (=> bm!13654 (= c!23211 c!23213)))

(declare-fun b!126800 () Bool)

(declare-fun e!82790 () List!1692)

(declare-fun call!13658 () List!1692)

(assert (=> b!126800 (= e!82790 call!13658)))

(declare-fun b!126801 () Bool)

(declare-fun e!82789 () List!1692)

(declare-fun e!82787 () List!1692)

(assert (=> b!126801 (= e!82789 e!82787)))

(declare-fun c!23212 () Bool)

(assert (=> b!126801 (= c!23212 (and ((_ is Cons!1688) (toList!839 lt!65021)) (= (_1!1282 (h!2290 (toList!839 lt!65021))) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126802 () Bool)

(assert (=> b!126802 (= e!82790 call!13658)))

(declare-fun b!126803 () Bool)

(declare-fun c!23210 () Bool)

(assert (=> b!126803 (= e!82788 (ite c!23212 (t!6030 (toList!839 lt!65021)) (ite c!23210 (Cons!1688 (h!2290 (toList!839 lt!65021)) (t!6030 (toList!839 lt!65021))) Nil!1689)))))

(declare-fun b!126804 () Bool)

(assert (=> b!126804 (= e!82789 call!13656)))

(declare-fun b!126805 () Bool)

(assert (=> b!126805 (= c!23210 (and ((_ is Cons!1688) (toList!839 lt!65021)) (bvsgt (_1!1282 (h!2290 (toList!839 lt!65021))) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!126805 (= e!82787 e!82790)))

(declare-fun b!126806 () Bool)

(declare-fun res!61296 () Bool)

(assert (=> b!126806 (=> (not res!61296) (not e!82786))))

(assert (=> b!126806 (= res!61296 (containsKey!169 lt!65488 (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38229 () Bool)

(assert (=> d!38229 e!82786))

(declare-fun res!61297 () Bool)

(assert (=> d!38229 (=> (not res!61297) (not e!82786))))

(assert (=> d!38229 (= res!61297 (isStrictlySorted!312 lt!65488))))

(assert (=> d!38229 (= lt!65488 e!82789)))

(assert (=> d!38229 (= c!23213 (and ((_ is Cons!1688) (toList!839 lt!65021)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65021))) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38229 (isStrictlySorted!312 (toList!839 lt!65021))))

(assert (=> d!38229 (= (insertStrictlySorted!86 (toList!839 lt!65021) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65488)))

(declare-fun bm!13655 () Bool)

(assert (=> bm!13655 (= call!13658 call!13657)))

(declare-fun b!126807 () Bool)

(assert (=> b!126807 (= e!82788 (insertStrictlySorted!86 (t!6030 (toList!839 lt!65021)) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126808 () Bool)

(assert (=> b!126808 (= e!82787 call!13657)))

(assert (= (and d!38229 c!23213) b!126804))

(assert (= (and d!38229 (not c!23213)) b!126801))

(assert (= (and b!126801 c!23212) b!126808))

(assert (= (and b!126801 (not c!23212)) b!126805))

(assert (= (and b!126805 c!23210) b!126802))

(assert (= (and b!126805 (not c!23210)) b!126800))

(assert (= (or b!126802 b!126800) bm!13655))

(assert (= (or b!126808 bm!13655) bm!13653))

(assert (= (or b!126804 bm!13653) bm!13654))

(assert (= (and bm!13654 c!23211) b!126807))

(assert (= (and bm!13654 (not c!23211)) b!126803))

(assert (= (and d!38229 res!61297) b!126806))

(assert (= (and b!126806 res!61296) b!126799))

(declare-fun m!147823 () Bool)

(assert (=> b!126799 m!147823))

(declare-fun m!147825 () Bool)

(assert (=> bm!13654 m!147825))

(declare-fun m!147827 () Bool)

(assert (=> b!126806 m!147827))

(declare-fun m!147829 () Bool)

(assert (=> b!126807 m!147829))

(declare-fun m!147831 () Bool)

(assert (=> d!38229 m!147831))

(declare-fun m!147833 () Bool)

(assert (=> d!38229 m!147833))

(assert (=> d!38083 d!38229))

(declare-fun d!38231 () Bool)

(assert (=> d!38231 (= (get!1446 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3122 (getValueByKey!165 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38047 d!38231))

(assert (=> d!38047 d!38219))

(declare-fun d!38233 () Bool)

(declare-fun e!82791 () Bool)

(assert (=> d!38233 e!82791))

(declare-fun res!61298 () Bool)

(assert (=> d!38233 (=> res!61298 e!82791)))

(declare-fun lt!65491 () Bool)

(assert (=> d!38233 (= res!61298 (not lt!65491))))

(declare-fun lt!65489 () Bool)

(assert (=> d!38233 (= lt!65491 lt!65489)))

(declare-fun lt!65492 () Unit!3922)

(declare-fun e!82792 () Unit!3922)

(assert (=> d!38233 (= lt!65492 e!82792)))

(declare-fun c!23214 () Bool)

(assert (=> d!38233 (= c!23214 lt!65489)))

(assert (=> d!38233 (= lt!65489 (containsKey!169 (toList!839 lt!65357) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38233 (= (contains!867 lt!65357 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) lt!65491)))

(declare-fun b!126809 () Bool)

(declare-fun lt!65490 () Unit!3922)

(assert (=> b!126809 (= e!82792 lt!65490)))

(assert (=> b!126809 (= lt!65490 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65357) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126809 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126810 () Bool)

(declare-fun Unit!3945 () Unit!3922)

(assert (=> b!126810 (= e!82792 Unit!3945)))

(declare-fun b!126811 () Bool)

(assert (=> b!126811 (= e!82791 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38233 c!23214) b!126809))

(assert (= (and d!38233 (not c!23214)) b!126810))

(assert (= (and d!38233 (not res!61298)) b!126811))

(assert (=> d!38233 m!147085))

(declare-fun m!147835 () Bool)

(assert (=> d!38233 m!147835))

(assert (=> b!126809 m!147085))

(declare-fun m!147837 () Bool)

(assert (=> b!126809 m!147837))

(assert (=> b!126809 m!147085))

(declare-fun m!147839 () Bool)

(assert (=> b!126809 m!147839))

(assert (=> b!126809 m!147839))

(declare-fun m!147841 () Bool)

(assert (=> b!126809 m!147841))

(assert (=> b!126811 m!147085))

(assert (=> b!126811 m!147839))

(assert (=> b!126811 m!147839))

(assert (=> b!126811 m!147841))

(assert (=> b!126604 d!38233))

(declare-fun d!38235 () Bool)

(declare-fun e!82793 () Bool)

(assert (=> d!38235 e!82793))

(declare-fun res!61299 () Bool)

(assert (=> d!38235 (=> (not res!61299) (not e!82793))))

(declare-fun lt!65495 () ListLongMap!1647)

(assert (=> d!38235 (= res!61299 (contains!867 lt!65495 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65493 () List!1692)

(assert (=> d!38235 (= lt!65495 (ListLongMap!1648 lt!65493))))

(declare-fun lt!65496 () Unit!3922)

(declare-fun lt!65494 () Unit!3922)

(assert (=> d!38235 (= lt!65496 lt!65494)))

(assert (=> d!38235 (= (getValueByKey!165 lt!65493 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38235 (= lt!65494 (lemmaContainsTupThenGetReturnValue!83 lt!65493 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38235 (= lt!65493 (insertStrictlySorted!86 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38235 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65495)))

(declare-fun b!126812 () Bool)

(declare-fun res!61300 () Bool)

(assert (=> b!126812 (=> (not res!61300) (not e!82793))))

(assert (=> b!126812 (= res!61300 (= (getValueByKey!165 (toList!839 lt!65495) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126813 () Bool)

(assert (=> b!126813 (= e!82793 (contains!869 (toList!839 lt!65495) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38235 res!61299) b!126812))

(assert (= (and b!126812 res!61300) b!126813))

(declare-fun m!147843 () Bool)

(assert (=> d!38235 m!147843))

(declare-fun m!147845 () Bool)

(assert (=> d!38235 m!147845))

(declare-fun m!147847 () Bool)

(assert (=> d!38235 m!147847))

(declare-fun m!147849 () Bool)

(assert (=> d!38235 m!147849))

(declare-fun m!147851 () Bool)

(assert (=> b!126812 m!147851))

(declare-fun m!147853 () Bool)

(assert (=> b!126813 m!147853))

(assert (=> d!38147 d!38235))

(declare-fun b!126814 () Bool)

(declare-fun e!82800 () ListLongMap!1647)

(declare-fun call!13661 () ListLongMap!1647)

(assert (=> b!126814 (= e!82800 call!13661)))

(declare-fun lt!65504 () ListLongMap!1647)

(declare-fun b!126815 () Bool)

(declare-fun e!82795 () Bool)

(assert (=> b!126815 (= e!82795 (= (apply!111 lt!65504 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126816 () Bool)

(declare-fun e!82802 () Bool)

(assert (=> b!126816 (= e!82802 (= (apply!111 lt!65504 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!126817 () Bool)

(declare-fun e!82806 () ListLongMap!1647)

(declare-fun e!82805 () ListLongMap!1647)

(assert (=> b!126817 (= e!82806 e!82805)))

(declare-fun c!23216 () Bool)

(assert (=> b!126817 (= c!23216 (and (not (= (bvand lt!65095 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65095 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13656 () Bool)

(declare-fun call!13663 () ListLongMap!1647)

(assert (=> bm!13656 (= call!13661 call!13663)))

(declare-fun b!126818 () Bool)

(declare-fun res!61301 () Bool)

(declare-fun e!82798 () Bool)

(assert (=> b!126818 (=> (not res!61301) (not e!82798))))

(declare-fun e!82796 () Bool)

(assert (=> b!126818 (= res!61301 e!82796)))

(declare-fun res!61305 () Bool)

(assert (=> b!126818 (=> res!61305 e!82796)))

(declare-fun e!82803 () Bool)

(assert (=> b!126818 (= res!61305 (not e!82803))))

(declare-fun res!61307 () Bool)

(assert (=> b!126818 (=> (not res!61307) (not e!82803))))

(assert (=> b!126818 (= res!61307 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13657 () Bool)

(declare-fun call!13659 () ListLongMap!1647)

(declare-fun call!13664 () ListLongMap!1647)

(assert (=> bm!13657 (= call!13659 call!13664)))

(declare-fun b!126819 () Bool)

(declare-fun e!82797 () Bool)

(assert (=> b!126819 (= e!82797 e!82795)))

(declare-fun res!61306 () Bool)

(declare-fun call!13662 () Bool)

(assert (=> b!126819 (= res!61306 call!13662)))

(assert (=> b!126819 (=> (not res!61306) (not e!82795))))

(declare-fun bm!13658 () Bool)

(assert (=> bm!13658 (= call!13664 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126820 () Bool)

(declare-fun e!82794 () Bool)

(assert (=> b!126820 (= e!82796 e!82794)))

(declare-fun res!61304 () Bool)

(assert (=> b!126820 (=> (not res!61304) (not e!82794))))

(assert (=> b!126820 (= res!61304 (contains!867 lt!65504 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126821 () Bool)

(declare-fun e!82799 () Unit!3922)

(declare-fun Unit!3946 () Unit!3922)

(assert (=> b!126821 (= e!82799 Unit!3946)))

(declare-fun bm!13659 () Bool)

(declare-fun call!13665 () Bool)

(assert (=> bm!13659 (= call!13665 (contains!867 lt!65504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126822 () Bool)

(declare-fun e!82804 () Bool)

(assert (=> b!126822 (= e!82804 e!82802)))

(declare-fun res!61302 () Bool)

(assert (=> b!126822 (= res!61302 call!13665)))

(assert (=> b!126822 (=> (not res!61302) (not e!82802))))

(declare-fun b!126823 () Bool)

(declare-fun c!23219 () Bool)

(assert (=> b!126823 (= c!23219 (and (not (= (bvand lt!65095 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65095 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126823 (= e!82805 e!82800)))

(declare-fun b!126824 () Bool)

(declare-fun e!82801 () Bool)

(assert (=> b!126824 (= e!82801 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38237 () Bool)

(assert (=> d!38237 e!82798))

(declare-fun res!61308 () Bool)

(assert (=> d!38237 (=> (not res!61308) (not e!82798))))

(assert (=> d!38237 (= res!61308 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65501 () ListLongMap!1647)

(assert (=> d!38237 (= lt!65504 lt!65501)))

(declare-fun lt!65511 () Unit!3922)

(assert (=> d!38237 (= lt!65511 e!82799)))

(declare-fun c!23217 () Bool)

(assert (=> d!38237 (= c!23217 e!82801)))

(declare-fun res!61309 () Bool)

(assert (=> d!38237 (=> (not res!61309) (not e!82801))))

(assert (=> d!38237 (= res!61309 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38237 (= lt!65501 e!82806)))

(declare-fun c!23218 () Bool)

(assert (=> d!38237 (= c!23218 (and (not (= (bvand lt!65095 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65095 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38237 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38237 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65504)))

(declare-fun b!126825 () Bool)

(assert (=> b!126825 (= e!82794 (= (apply!111 lt!65504 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (_values!2765 newMap!16))))))

(assert (=> b!126825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126826 () Bool)

(assert (=> b!126826 (= e!82803 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126827 () Bool)

(assert (=> b!126827 (= e!82805 call!13661)))

(declare-fun b!126828 () Bool)

(declare-fun lt!65505 () Unit!3922)

(assert (=> b!126828 (= e!82799 lt!65505)))

(declare-fun lt!65500 () ListLongMap!1647)

(assert (=> b!126828 (= lt!65500 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65513 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65510 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65510 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65518 () Unit!3922)

(assert (=> b!126828 (= lt!65518 (addStillContains!87 lt!65500 lt!65513 (zeroValue!2645 newMap!16) lt!65510))))

(assert (=> b!126828 (contains!867 (+!158 lt!65500 (tuple2!2543 lt!65513 (zeroValue!2645 newMap!16))) lt!65510)))

(declare-fun lt!65517 () Unit!3922)

(assert (=> b!126828 (= lt!65517 lt!65518)))

(declare-fun lt!65515 () ListLongMap!1647)

(assert (=> b!126828 (= lt!65515 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65508 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65507 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65507 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65512 () Unit!3922)

(assert (=> b!126828 (= lt!65512 (addApplyDifferent!87 lt!65515 lt!65508 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65507))))

(assert (=> b!126828 (= (apply!111 (+!158 lt!65515 (tuple2!2543 lt!65508 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65507) (apply!111 lt!65515 lt!65507))))

(declare-fun lt!65506 () Unit!3922)

(assert (=> b!126828 (= lt!65506 lt!65512)))

(declare-fun lt!65499 () ListLongMap!1647)

(assert (=> b!126828 (= lt!65499 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65497 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65502 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65502 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65503 () Unit!3922)

(assert (=> b!126828 (= lt!65503 (addApplyDifferent!87 lt!65499 lt!65497 (zeroValue!2645 newMap!16) lt!65502))))

(assert (=> b!126828 (= (apply!111 (+!158 lt!65499 (tuple2!2543 lt!65497 (zeroValue!2645 newMap!16))) lt!65502) (apply!111 lt!65499 lt!65502))))

(declare-fun lt!65516 () Unit!3922)

(assert (=> b!126828 (= lt!65516 lt!65503)))

(declare-fun lt!65514 () ListLongMap!1647)

(assert (=> b!126828 (= lt!65514 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65498 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65509 () (_ BitVec 64))

(assert (=> b!126828 (= lt!65509 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126828 (= lt!65505 (addApplyDifferent!87 lt!65514 lt!65498 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65509))))

(assert (=> b!126828 (= (apply!111 (+!158 lt!65514 (tuple2!2543 lt!65498 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65509) (apply!111 lt!65514 lt!65509))))

(declare-fun call!13660 () ListLongMap!1647)

(declare-fun bm!13660 () Bool)

(assert (=> bm!13660 (= call!13663 (+!158 (ite c!23218 call!13664 (ite c!23216 call!13659 call!13660)) (ite (or c!23218 c!23216) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126829 () Bool)

(assert (=> b!126829 (= e!82800 call!13660)))

(declare-fun b!126830 () Bool)

(assert (=> b!126830 (= e!82806 (+!158 call!13663 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!13661 () Bool)

(assert (=> bm!13661 (= call!13660 call!13659)))

(declare-fun bm!13662 () Bool)

(assert (=> bm!13662 (= call!13662 (contains!867 lt!65504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126831 () Bool)

(assert (=> b!126831 (= e!82804 (not call!13665))))

(declare-fun b!126832 () Bool)

(assert (=> b!126832 (= e!82798 e!82797)))

(declare-fun c!23220 () Bool)

(assert (=> b!126832 (= c!23220 (not (= (bvand lt!65095 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126833 () Bool)

(assert (=> b!126833 (= e!82797 (not call!13662))))

(declare-fun b!126834 () Bool)

(declare-fun res!61303 () Bool)

(assert (=> b!126834 (=> (not res!61303) (not e!82798))))

(assert (=> b!126834 (= res!61303 e!82804)))

(declare-fun c!23215 () Bool)

(assert (=> b!126834 (= c!23215 (not (= (bvand lt!65095 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38237 c!23218) b!126830))

(assert (= (and d!38237 (not c!23218)) b!126817))

(assert (= (and b!126817 c!23216) b!126827))

(assert (= (and b!126817 (not c!23216)) b!126823))

(assert (= (and b!126823 c!23219) b!126814))

(assert (= (and b!126823 (not c!23219)) b!126829))

(assert (= (or b!126814 b!126829) bm!13661))

(assert (= (or b!126827 bm!13661) bm!13657))

(assert (= (or b!126827 b!126814) bm!13656))

(assert (= (or b!126830 bm!13657) bm!13658))

(assert (= (or b!126830 bm!13656) bm!13660))

(assert (= (and d!38237 res!61309) b!126824))

(assert (= (and d!38237 c!23217) b!126828))

(assert (= (and d!38237 (not c!23217)) b!126821))

(assert (= (and d!38237 res!61308) b!126818))

(assert (= (and b!126818 res!61307) b!126826))

(assert (= (and b!126818 (not res!61305)) b!126820))

(assert (= (and b!126820 res!61304) b!126825))

(assert (= (and b!126818 res!61301) b!126834))

(assert (= (and b!126834 c!23215) b!126822))

(assert (= (and b!126834 (not c!23215)) b!126831))

(assert (= (and b!126822 res!61302) b!126816))

(assert (= (or b!126822 b!126831) bm!13659))

(assert (= (and b!126834 res!61303) b!126832))

(assert (= (and b!126832 c!23220) b!126819))

(assert (= (and b!126832 (not c!23220)) b!126833))

(assert (= (and b!126819 res!61306) b!126815))

(assert (= (or b!126819 b!126833) bm!13662))

(declare-fun b_lambda!5583 () Bool)

(assert (=> (not b_lambda!5583) (not b!126825)))

(assert (=> b!126825 t!6042))

(declare-fun b_and!7797 () Bool)

(assert (= b_and!7793 (and (=> t!6042 result!3843) b_and!7797)))

(assert (=> b!126825 t!6044))

(declare-fun b_and!7799 () Bool)

(assert (= b_and!7795 (and (=> t!6044 result!3845) b_and!7799)))

(declare-fun m!147855 () Bool)

(assert (=> b!126828 m!147855))

(assert (=> b!126828 m!146831))

(declare-fun m!147857 () Bool)

(assert (=> b!126828 m!147857))

(declare-fun m!147859 () Bool)

(assert (=> b!126828 m!147859))

(declare-fun m!147861 () Bool)

(assert (=> b!126828 m!147861))

(declare-fun m!147863 () Bool)

(assert (=> b!126828 m!147863))

(declare-fun m!147865 () Bool)

(assert (=> b!126828 m!147865))

(declare-fun m!147867 () Bool)

(assert (=> b!126828 m!147867))

(assert (=> b!126828 m!146831))

(declare-fun m!147869 () Bool)

(assert (=> b!126828 m!147869))

(declare-fun m!147871 () Bool)

(assert (=> b!126828 m!147871))

(assert (=> b!126828 m!146831))

(declare-fun m!147873 () Bool)

(assert (=> b!126828 m!147873))

(assert (=> b!126828 m!147865))

(declare-fun m!147875 () Bool)

(assert (=> b!126828 m!147875))

(assert (=> b!126828 m!147871))

(declare-fun m!147877 () Bool)

(assert (=> b!126828 m!147877))

(declare-fun m!147879 () Bool)

(assert (=> b!126828 m!147879))

(declare-fun m!147881 () Bool)

(assert (=> b!126828 m!147881))

(assert (=> b!126828 m!147859))

(declare-fun m!147883 () Bool)

(assert (=> b!126828 m!147883))

(assert (=> b!126828 m!147863))

(declare-fun m!147885 () Bool)

(assert (=> b!126828 m!147885))

(assert (=> b!126828 m!147085))

(assert (=> b!126826 m!147085))

(assert (=> b!126826 m!147085))

(assert (=> b!126826 m!147087))

(declare-fun m!147887 () Bool)

(assert (=> bm!13660 m!147887))

(declare-fun m!147889 () Bool)

(assert (=> b!126816 m!147889))

(assert (=> b!126825 m!147085))

(declare-fun m!147891 () Bool)

(assert (=> b!126825 m!147891))

(assert (=> b!126825 m!147085))

(assert (=> b!126825 m!147311))

(assert (=> b!126825 m!147311))

(assert (=> b!126825 m!147313))

(assert (=> b!126825 m!147315))

(assert (=> b!126825 m!147313))

(declare-fun m!147893 () Bool)

(assert (=> b!126815 m!147893))

(assert (=> bm!13658 m!146831))

(assert (=> bm!13658 m!147869))

(assert (=> b!126820 m!147085))

(assert (=> b!126820 m!147085))

(declare-fun m!147895 () Bool)

(assert (=> b!126820 m!147895))

(declare-fun m!147897 () Bool)

(assert (=> bm!13659 m!147897))

(declare-fun m!147899 () Bool)

(assert (=> b!126830 m!147899))

(declare-fun m!147901 () Bool)

(assert (=> bm!13662 m!147901))

(assert (=> b!126824 m!147085))

(assert (=> b!126824 m!147085))

(assert (=> b!126824 m!147087))

(assert (=> d!38237 m!147061))

(assert (=> d!38147 d!38237))

(assert (=> d!38147 d!38115))

(declare-fun d!38239 () Bool)

(assert (=> d!38239 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38239 true))

(declare-fun _$8!109 () Unit!3922)

(assert (=> d!38239 (= (choose!775 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65095 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) _$8!109)))

(declare-fun bs!5242 () Bool)

(assert (= bs!5242 d!38239))

(assert (=> bs!5242 m!146923))

(assert (=> bs!5242 m!146923))

(assert (=> bs!5242 m!147509))

(assert (=> bs!5242 m!146831))

(assert (=> bs!5242 m!147513))

(assert (=> d!38147 d!38239))

(declare-fun d!38241 () Bool)

(assert (=> d!38241 (= (validMask!0 (mask!7037 newMap!16)) (and (or (= (mask!7037 newMap!16) #b00000000000000000000000000000111) (= (mask!7037 newMap!16) #b00000000000000000000000000001111) (= (mask!7037 newMap!16) #b00000000000000000000000000011111) (= (mask!7037 newMap!16) #b00000000000000000000000000111111) (= (mask!7037 newMap!16) #b00000000000000000000000001111111) (= (mask!7037 newMap!16) #b00000000000000000000000011111111) (= (mask!7037 newMap!16) #b00000000000000000000000111111111) (= (mask!7037 newMap!16) #b00000000000000000000001111111111) (= (mask!7037 newMap!16) #b00000000000000000000011111111111) (= (mask!7037 newMap!16) #b00000000000000000000111111111111) (= (mask!7037 newMap!16) #b00000000000000000001111111111111) (= (mask!7037 newMap!16) #b00000000000000000011111111111111) (= (mask!7037 newMap!16) #b00000000000000000111111111111111) (= (mask!7037 newMap!16) #b00000000000000001111111111111111) (= (mask!7037 newMap!16) #b00000000000000011111111111111111) (= (mask!7037 newMap!16) #b00000000000000111111111111111111) (= (mask!7037 newMap!16) #b00000000000001111111111111111111) (= (mask!7037 newMap!16) #b00000000000011111111111111111111) (= (mask!7037 newMap!16) #b00000000000111111111111111111111) (= (mask!7037 newMap!16) #b00000000001111111111111111111111) (= (mask!7037 newMap!16) #b00000000011111111111111111111111) (= (mask!7037 newMap!16) #b00000000111111111111111111111111) (= (mask!7037 newMap!16) #b00000001111111111111111111111111) (= (mask!7037 newMap!16) #b00000011111111111111111111111111) (= (mask!7037 newMap!16) #b00000111111111111111111111111111) (= (mask!7037 newMap!16) #b00001111111111111111111111111111) (= (mask!7037 newMap!16) #b00011111111111111111111111111111) (= (mask!7037 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7037 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38147 d!38241))

(declare-fun d!38243 () Bool)

(declare-fun res!61310 () Bool)

(declare-fun e!82807 () Bool)

(assert (=> d!38243 (=> res!61310 e!82807)))

(assert (=> d!38243 (= res!61310 (= (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38243 (= (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!82807)))

(declare-fun b!126835 () Bool)

(declare-fun e!82808 () Bool)

(assert (=> b!126835 (= e!82807 e!82808)))

(declare-fun res!61311 () Bool)

(assert (=> b!126835 (=> (not res!61311) (not e!82808))))

(assert (=> b!126835 (= res!61311 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126836 () Bool)

(assert (=> b!126836 (= e!82808 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!38243 (not res!61310)) b!126835))

(assert (= (and b!126835 res!61311) b!126836))

(declare-fun m!147903 () Bool)

(assert (=> d!38243 m!147903))

(assert (=> b!126836 m!146811))

(declare-fun m!147905 () Bool)

(assert (=> b!126836 m!147905))

(assert (=> b!126424 d!38243))

(declare-fun b!126837 () Bool)

(declare-fun e!82810 () Bool)

(assert (=> b!126837 (= e!82810 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126837 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126838 () Bool)

(declare-fun e!82812 () Bool)

(declare-fun e!82814 () Bool)

(assert (=> b!126838 (= e!82812 e!82814)))

(declare-fun c!23222 () Bool)

(assert (=> b!126838 (= c!23222 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126839 () Bool)

(declare-fun res!61313 () Bool)

(declare-fun e!82809 () Bool)

(assert (=> b!126839 (=> (not res!61313) (not e!82809))))

(declare-fun lt!65523 () ListLongMap!1647)

(assert (=> b!126839 (= res!61313 (not (contains!867 lt!65523 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126840 () Bool)

(assert (=> b!126840 (= e!82814 (isEmpty!401 lt!65523))))

(declare-fun b!126841 () Bool)

(declare-fun e!82813 () ListLongMap!1647)

(assert (=> b!126841 (= e!82813 (ListLongMap!1648 Nil!1689))))

(declare-fun b!126842 () Bool)

(declare-fun e!82815 () ListLongMap!1647)

(declare-fun call!13666 () ListLongMap!1647)

(assert (=> b!126842 (= e!82815 call!13666)))

(declare-fun b!126843 () Bool)

(declare-fun e!82811 () Bool)

(assert (=> b!126843 (= e!82812 e!82811)))

(assert (=> b!126843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61315 () Bool)

(assert (=> b!126843 (= res!61315 (contains!867 lt!65523 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126843 (=> (not res!61315) (not e!82811))))

(declare-fun b!126844 () Bool)

(declare-fun lt!65519 () Unit!3922)

(declare-fun lt!65521 () Unit!3922)

(assert (=> b!126844 (= lt!65519 lt!65521)))

(declare-fun lt!65525 () V!3433)

(declare-fun lt!65522 () (_ BitVec 64))

(declare-fun lt!65524 () (_ BitVec 64))

(declare-fun lt!65520 () ListLongMap!1647)

(assert (=> b!126844 (not (contains!867 (+!158 lt!65520 (tuple2!2543 lt!65522 lt!65525)) lt!65524))))

(assert (=> b!126844 (= lt!65521 (addStillNotContains!57 lt!65520 lt!65522 lt!65525 lt!65524))))

(assert (=> b!126844 (= lt!65524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126844 (= lt!65525 (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126844 (= lt!65522 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126844 (= lt!65520 call!13666)))

(assert (=> b!126844 (= e!82815 (+!158 call!13666 (tuple2!2543 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38245 () Bool)

(assert (=> d!38245 e!82809))

(declare-fun res!61314 () Bool)

(assert (=> d!38245 (=> (not res!61314) (not e!82809))))

(assert (=> d!38245 (= res!61314 (not (contains!867 lt!65523 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38245 (= lt!65523 e!82813)))

(declare-fun c!23224 () Bool)

(assert (=> d!38245 (= c!23224 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38245 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38245 (= (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65523)))

(declare-fun b!126845 () Bool)

(assert (=> b!126845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> b!126845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (_values!2765 newMap!16))))))

(assert (=> b!126845 (= e!82811 (= (apply!111 lt!65523 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126846 () Bool)

(assert (=> b!126846 (= e!82814 (= lt!65523 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13663 () Bool)

(assert (=> bm!13663 (= call!13666 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126847 () Bool)

(assert (=> b!126847 (= e!82809 e!82812)))

(declare-fun c!23221 () Bool)

(assert (=> b!126847 (= c!23221 e!82810)))

(declare-fun res!61312 () Bool)

(assert (=> b!126847 (=> (not res!61312) (not e!82810))))

(assert (=> b!126847 (= res!61312 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126848 () Bool)

(assert (=> b!126848 (= e!82813 e!82815)))

(declare-fun c!23223 () Bool)

(assert (=> b!126848 (= c!23223 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38245 c!23224) b!126841))

(assert (= (and d!38245 (not c!23224)) b!126848))

(assert (= (and b!126848 c!23223) b!126844))

(assert (= (and b!126848 (not c!23223)) b!126842))

(assert (= (or b!126844 b!126842) bm!13663))

(assert (= (and d!38245 res!61314) b!126839))

(assert (= (and b!126839 res!61313) b!126847))

(assert (= (and b!126847 res!61312) b!126837))

(assert (= (and b!126847 c!23221) b!126843))

(assert (= (and b!126847 (not c!23221)) b!126838))

(assert (= (and b!126843 res!61315) b!126845))

(assert (= (and b!126838 c!23222) b!126846))

(assert (= (and b!126838 (not c!23222)) b!126840))

(declare-fun b_lambda!5585 () Bool)

(assert (=> (not b_lambda!5585) (not b!126844)))

(assert (=> b!126844 t!6042))

(declare-fun b_and!7801 () Bool)

(assert (= b_and!7797 (and (=> t!6042 result!3843) b_and!7801)))

(assert (=> b!126844 t!6044))

(declare-fun b_and!7803 () Bool)

(assert (= b_and!7799 (and (=> t!6044 result!3845) b_and!7803)))

(declare-fun b_lambda!5587 () Bool)

(assert (=> (not b_lambda!5587) (not b!126845)))

(assert (=> b!126845 t!6042))

(declare-fun b_and!7805 () Bool)

(assert (= b_and!7801 (and (=> t!6042 result!3843) b_and!7805)))

(assert (=> b!126845 t!6044))

(declare-fun b_and!7807 () Bool)

(assert (= b_and!7803 (and (=> t!6044 result!3845) b_and!7807)))

(declare-fun m!147907 () Bool)

(assert (=> b!126839 m!147907))

(assert (=> b!126848 m!147085))

(assert (=> b!126848 m!147085))

(assert (=> b!126848 m!147087))

(declare-fun m!147909 () Bool)

(assert (=> b!126846 m!147909))

(assert (=> b!126843 m!147085))

(assert (=> b!126843 m!147085))

(declare-fun m!147911 () Bool)

(assert (=> b!126843 m!147911))

(declare-fun m!147913 () Bool)

(assert (=> b!126840 m!147913))

(assert (=> b!126845 m!147085))

(assert (=> b!126845 m!147313))

(assert (=> b!126845 m!147085))

(declare-fun m!147915 () Bool)

(assert (=> b!126845 m!147915))

(assert (=> b!126845 m!147311))

(assert (=> b!126845 m!147311))

(assert (=> b!126845 m!147313))

(assert (=> b!126845 m!147315))

(assert (=> b!126837 m!147085))

(assert (=> b!126837 m!147085))

(assert (=> b!126837 m!147087))

(assert (=> bm!13663 m!147909))

(declare-fun m!147917 () Bool)

(assert (=> d!38245 m!147917))

(assert (=> d!38245 m!147061))

(assert (=> b!126844 m!147085))

(declare-fun m!147919 () Bool)

(assert (=> b!126844 m!147919))

(declare-fun m!147921 () Bool)

(assert (=> b!126844 m!147921))

(assert (=> b!126844 m!147313))

(assert (=> b!126844 m!147311))

(declare-fun m!147923 () Bool)

(assert (=> b!126844 m!147923))

(assert (=> b!126844 m!147919))

(declare-fun m!147925 () Bool)

(assert (=> b!126844 m!147925))

(assert (=> b!126844 m!147311))

(assert (=> b!126844 m!147313))

(assert (=> b!126844 m!147315))

(assert (=> bm!13601 d!38245))

(declare-fun d!38247 () Bool)

(assert (=> d!38247 (= (apply!111 lt!65203 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1446 (getValueByKey!165 (toList!839 lt!65203) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5243 () Bool)

(assert (= bs!5243 d!38247))

(assert (=> bs!5243 m!146957))

(declare-fun m!147927 () Bool)

(assert (=> bs!5243 m!147927))

(assert (=> bs!5243 m!147927))

(declare-fun m!147929 () Bool)

(assert (=> bs!5243 m!147929))

(assert (=> b!126481 d!38247))

(assert (=> b!126481 d!38125))

(declare-fun d!38249 () Bool)

(declare-fun e!82816 () Bool)

(assert (=> d!38249 e!82816))

(declare-fun res!61316 () Bool)

(assert (=> d!38249 (=> res!61316 e!82816)))

(declare-fun lt!65528 () Bool)

(assert (=> d!38249 (= res!61316 (not lt!65528))))

(declare-fun lt!65526 () Bool)

(assert (=> d!38249 (= lt!65528 lt!65526)))

(declare-fun lt!65529 () Unit!3922)

(declare-fun e!82817 () Unit!3922)

(assert (=> d!38249 (= lt!65529 e!82817)))

(declare-fun c!23225 () Bool)

(assert (=> d!38249 (= c!23225 lt!65526)))

(assert (=> d!38249 (= lt!65526 (containsKey!169 (toList!839 (map!1369 (_2!1283 lt!65342))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38249 (= (contains!867 (map!1369 (_2!1283 lt!65342)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65528)))

(declare-fun b!126849 () Bool)

(declare-fun lt!65527 () Unit!3922)

(assert (=> b!126849 (= e!82817 lt!65527)))

(assert (=> b!126849 (= lt!65527 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (map!1369 (_2!1283 lt!65342))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!126849 (isDefined!119 (getValueByKey!165 (toList!839 (map!1369 (_2!1283 lt!65342))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!126850 () Bool)

(declare-fun Unit!3947 () Unit!3922)

(assert (=> b!126850 (= e!82817 Unit!3947)))

(declare-fun b!126851 () Bool)

(assert (=> b!126851 (= e!82816 (isDefined!119 (getValueByKey!165 (toList!839 (map!1369 (_2!1283 lt!65342))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (= (and d!38249 c!23225) b!126849))

(assert (= (and d!38249 (not c!23225)) b!126850))

(assert (= (and d!38249 (not res!61316)) b!126851))

(assert (=> d!38249 m!146811))

(declare-fun m!147931 () Bool)

(assert (=> d!38249 m!147931))

(assert (=> b!126849 m!146811))

(declare-fun m!147933 () Bool)

(assert (=> b!126849 m!147933))

(assert (=> b!126849 m!146811))

(declare-fun m!147935 () Bool)

(assert (=> b!126849 m!147935))

(assert (=> b!126849 m!147935))

(declare-fun m!147937 () Bool)

(assert (=> b!126849 m!147937))

(assert (=> b!126851 m!146811))

(assert (=> b!126851 m!147935))

(assert (=> b!126851 m!147935))

(assert (=> b!126851 m!147937))

(assert (=> b!126594 d!38249))

(declare-fun d!38251 () Bool)

(assert (=> d!38251 (= (map!1369 (_2!1283 lt!65342)) (getCurrentListMap!509 (_keys!4514 (_2!1283 lt!65342)) (_values!2765 (_2!1283 lt!65342)) (mask!7037 (_2!1283 lt!65342)) (extraKeys!2563 (_2!1283 lt!65342)) (zeroValue!2645 (_2!1283 lt!65342)) (minValue!2645 (_2!1283 lt!65342)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1283 lt!65342))))))

(declare-fun bs!5244 () Bool)

(assert (= bs!5244 d!38251))

(declare-fun m!147939 () Bool)

(assert (=> bs!5244 m!147939))

(assert (=> b!126594 d!38251))

(declare-fun d!38253 () Bool)

(declare-fun res!61317 () Bool)

(declare-fun e!82818 () Bool)

(assert (=> d!38253 (=> res!61317 e!82818)))

(assert (=> d!38253 (= res!61317 (and ((_ is Cons!1688) (toList!839 e!82505)) (= (_1!1282 (h!2290 (toList!839 e!82505))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38253 (= (containsKey!169 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82818)))

(declare-fun b!126852 () Bool)

(declare-fun e!82819 () Bool)

(assert (=> b!126852 (= e!82818 e!82819)))

(declare-fun res!61318 () Bool)

(assert (=> b!126852 (=> (not res!61318) (not e!82819))))

(assert (=> b!126852 (= res!61318 (and (or (not ((_ is Cons!1688) (toList!839 e!82505))) (bvsle (_1!1282 (h!2290 (toList!839 e!82505))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) ((_ is Cons!1688) (toList!839 e!82505)) (bvslt (_1!1282 (h!2290 (toList!839 e!82505))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(declare-fun b!126853 () Bool)

(assert (=> b!126853 (= e!82819 (containsKey!169 (t!6030 (toList!839 e!82505)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38253 (not res!61317)) b!126852))

(assert (= (and b!126852 res!61318) b!126853))

(assert (=> b!126853 m!146811))

(declare-fun m!147941 () Bool)

(assert (=> b!126853 m!147941))

(assert (=> d!38069 d!38253))

(declare-fun d!38255 () Bool)

(declare-fun e!82820 () Bool)

(assert (=> d!38255 e!82820))

(declare-fun res!61319 () Bool)

(assert (=> d!38255 (=> res!61319 e!82820)))

(declare-fun lt!65532 () Bool)

(assert (=> d!38255 (= res!61319 (not lt!65532))))

(declare-fun lt!65530 () Bool)

(assert (=> d!38255 (= lt!65532 lt!65530)))

(declare-fun lt!65533 () Unit!3922)

(declare-fun e!82821 () Unit!3922)

(assert (=> d!38255 (= lt!65533 e!82821)))

(declare-fun c!23226 () Bool)

(assert (=> d!38255 (= c!23226 lt!65530)))

(assert (=> d!38255 (= lt!65530 (containsKey!169 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38255 (= (contains!867 lt!65167 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65532)))

(declare-fun b!126854 () Bool)

(declare-fun lt!65531 () Unit!3922)

(assert (=> b!126854 (= e!82821 lt!65531)))

(assert (=> b!126854 (= lt!65531 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> b!126854 (isDefined!119 (getValueByKey!165 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126855 () Bool)

(declare-fun Unit!3948 () Unit!3922)

(assert (=> b!126855 (= e!82821 Unit!3948)))

(declare-fun b!126856 () Bool)

(assert (=> b!126856 (= e!82820 (isDefined!119 (getValueByKey!165 (toList!839 lt!65167) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38255 c!23226) b!126854))

(assert (= (and d!38255 (not c!23226)) b!126855))

(assert (= (and d!38255 (not res!61319)) b!126856))

(declare-fun m!147943 () Bool)

(assert (=> d!38255 m!147943))

(declare-fun m!147945 () Bool)

(assert (=> b!126854 m!147945))

(assert (=> b!126854 m!147145))

(assert (=> b!126854 m!147145))

(declare-fun m!147947 () Bool)

(assert (=> b!126854 m!147947))

(assert (=> b!126856 m!147145))

(assert (=> b!126856 m!147145))

(assert (=> b!126856 m!147947))

(assert (=> d!38073 d!38255))

(declare-fun b!126857 () Bool)

(declare-fun e!82822 () Option!171)

(assert (=> b!126857 (= e!82822 (Some!170 (_2!1282 (h!2290 lt!65165))))))

(declare-fun b!126859 () Bool)

(declare-fun e!82823 () Option!171)

(assert (=> b!126859 (= e!82823 (getValueByKey!165 (t!6030 lt!65165) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38257 () Bool)

(declare-fun c!23227 () Bool)

(assert (=> d!38257 (= c!23227 (and ((_ is Cons!1688) lt!65165) (= (_1!1282 (h!2290 lt!65165)) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38257 (= (getValueByKey!165 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82822)))

(declare-fun b!126860 () Bool)

(assert (=> b!126860 (= e!82823 None!169)))

(declare-fun b!126858 () Bool)

(assert (=> b!126858 (= e!82822 e!82823)))

(declare-fun c!23228 () Bool)

(assert (=> b!126858 (= c!23228 (and ((_ is Cons!1688) lt!65165) (not (= (_1!1282 (h!2290 lt!65165)) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38257 c!23227) b!126857))

(assert (= (and d!38257 (not c!23227)) b!126858))

(assert (= (and b!126858 c!23228) b!126859))

(assert (= (and b!126858 (not c!23228)) b!126860))

(declare-fun m!147949 () Bool)

(assert (=> b!126859 m!147949))

(assert (=> d!38073 d!38257))

(declare-fun d!38259 () Bool)

(assert (=> d!38259 (= (getValueByKey!165 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65534 () Unit!3922)

(assert (=> d!38259 (= lt!65534 (choose!776 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!82824 () Bool)

(assert (=> d!38259 e!82824))

(declare-fun res!61320 () Bool)

(assert (=> d!38259 (=> (not res!61320) (not e!82824))))

(assert (=> d!38259 (= res!61320 (isStrictlySorted!312 lt!65165))))

(assert (=> d!38259 (= (lemmaContainsTupThenGetReturnValue!83 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65534)))

(declare-fun b!126861 () Bool)

(declare-fun res!61321 () Bool)

(assert (=> b!126861 (=> (not res!61321) (not e!82824))))

(assert (=> b!126861 (= res!61321 (containsKey!169 lt!65165 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126862 () Bool)

(assert (=> b!126862 (= e!82824 (contains!869 lt!65165 (tuple2!2543 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38259 res!61320) b!126861))

(assert (= (and b!126861 res!61321) b!126862))

(assert (=> d!38259 m!147139))

(declare-fun m!147951 () Bool)

(assert (=> d!38259 m!147951))

(declare-fun m!147953 () Bool)

(assert (=> d!38259 m!147953))

(declare-fun m!147955 () Bool)

(assert (=> b!126861 m!147955))

(declare-fun m!147957 () Bool)

(assert (=> b!126862 m!147957))

(assert (=> d!38073 d!38259))

(declare-fun bm!13664 () Bool)

(declare-fun call!13668 () List!1692)

(declare-fun call!13667 () List!1692)

(assert (=> bm!13664 (= call!13668 call!13667)))

(declare-fun b!126863 () Bool)

(declare-fun e!82825 () Bool)

(declare-fun lt!65535 () List!1692)

(assert (=> b!126863 (= e!82825 (contains!869 lt!65535 (tuple2!2543 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun c!23232 () Bool)

(declare-fun e!82827 () List!1692)

(declare-fun bm!13665 () Bool)

(assert (=> bm!13665 (= call!13667 ($colon$colon!88 e!82827 (ite c!23232 (h!2290 (toList!839 call!13515)) (tuple2!2543 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun c!23230 () Bool)

(assert (=> bm!13665 (= c!23230 c!23232)))

(declare-fun b!126864 () Bool)

(declare-fun e!82829 () List!1692)

(declare-fun call!13669 () List!1692)

(assert (=> b!126864 (= e!82829 call!13669)))

(declare-fun b!126865 () Bool)

(declare-fun e!82828 () List!1692)

(declare-fun e!82826 () List!1692)

(assert (=> b!126865 (= e!82828 e!82826)))

(declare-fun c!23231 () Bool)

(assert (=> b!126865 (= c!23231 (and ((_ is Cons!1688) (toList!839 call!13515)) (= (_1!1282 (h!2290 (toList!839 call!13515))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126866 () Bool)

(assert (=> b!126866 (= e!82829 call!13669)))

(declare-fun b!126867 () Bool)

(declare-fun c!23229 () Bool)

(assert (=> b!126867 (= e!82827 (ite c!23231 (t!6030 (toList!839 call!13515)) (ite c!23229 (Cons!1688 (h!2290 (toList!839 call!13515)) (t!6030 (toList!839 call!13515))) Nil!1689)))))

(declare-fun b!126868 () Bool)

(assert (=> b!126868 (= e!82828 call!13667)))

(declare-fun b!126869 () Bool)

(assert (=> b!126869 (= c!23229 (and ((_ is Cons!1688) (toList!839 call!13515)) (bvsgt (_1!1282 (h!2290 (toList!839 call!13515))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!126869 (= e!82826 e!82829)))

(declare-fun b!126870 () Bool)

(declare-fun res!61322 () Bool)

(assert (=> b!126870 (=> (not res!61322) (not e!82825))))

(assert (=> b!126870 (= res!61322 (containsKey!169 lt!65535 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38261 () Bool)

(assert (=> d!38261 e!82825))

(declare-fun res!61323 () Bool)

(assert (=> d!38261 (=> (not res!61323) (not e!82825))))

(assert (=> d!38261 (= res!61323 (isStrictlySorted!312 lt!65535))))

(assert (=> d!38261 (= lt!65535 e!82828)))

(assert (=> d!38261 (= c!23232 (and ((_ is Cons!1688) (toList!839 call!13515)) (bvslt (_1!1282 (h!2290 (toList!839 call!13515))) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38261 (isStrictlySorted!312 (toList!839 call!13515))))

(assert (=> d!38261 (= (insertStrictlySorted!86 (toList!839 call!13515) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65535)))

(declare-fun bm!13666 () Bool)

(assert (=> bm!13666 (= call!13669 call!13668)))

(declare-fun b!126871 () Bool)

(assert (=> b!126871 (= e!82827 (insertStrictlySorted!86 (t!6030 (toList!839 call!13515)) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126872 () Bool)

(assert (=> b!126872 (= e!82826 call!13668)))

(assert (= (and d!38261 c!23232) b!126868))

(assert (= (and d!38261 (not c!23232)) b!126865))

(assert (= (and b!126865 c!23231) b!126872))

(assert (= (and b!126865 (not c!23231)) b!126869))

(assert (= (and b!126869 c!23229) b!126866))

(assert (= (and b!126869 (not c!23229)) b!126864))

(assert (= (or b!126866 b!126864) bm!13666))

(assert (= (or b!126872 bm!13666) bm!13664))

(assert (= (or b!126868 bm!13664) bm!13665))

(assert (= (and bm!13665 c!23230) b!126871))

(assert (= (and bm!13665 (not c!23230)) b!126867))

(assert (= (and d!38261 res!61323) b!126870))

(assert (= (and b!126870 res!61322) b!126863))

(declare-fun m!147959 () Bool)

(assert (=> b!126863 m!147959))

(declare-fun m!147961 () Bool)

(assert (=> bm!13665 m!147961))

(declare-fun m!147963 () Bool)

(assert (=> b!126870 m!147963))

(declare-fun m!147965 () Bool)

(assert (=> b!126871 m!147965))

(declare-fun m!147967 () Bool)

(assert (=> d!38261 m!147967))

(declare-fun m!147969 () Bool)

(assert (=> d!38261 m!147969))

(assert (=> d!38073 d!38261))

(declare-fun b!126873 () Bool)

(declare-fun e!82830 () Option!171)

(assert (=> b!126873 (= e!82830 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65183)))))))

(declare-fun b!126875 () Bool)

(declare-fun e!82831 () Option!171)

(assert (=> b!126875 (= e!82831 (getValueByKey!165 (t!6030 (toList!839 lt!65183)) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun c!23233 () Bool)

(declare-fun d!38263 () Bool)

(assert (=> d!38263 (= c!23233 (and ((_ is Cons!1688) (toList!839 lt!65183)) (= (_1!1282 (h!2290 (toList!839 lt!65183))) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38263 (= (getValueByKey!165 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82830)))

(declare-fun b!126876 () Bool)

(assert (=> b!126876 (= e!82831 None!169)))

(declare-fun b!126874 () Bool)

(assert (=> b!126874 (= e!82830 e!82831)))

(declare-fun c!23234 () Bool)

(assert (=> b!126874 (= c!23234 (and ((_ is Cons!1688) (toList!839 lt!65183)) (not (= (_1!1282 (h!2290 (toList!839 lt!65183))) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38263 c!23233) b!126873))

(assert (= (and d!38263 (not c!23233)) b!126874))

(assert (= (and b!126874 c!23234) b!126875))

(assert (= (and b!126874 (not c!23234)) b!126876))

(declare-fun m!147971 () Bool)

(assert (=> b!126875 m!147971))

(assert (=> b!126447 d!38263))

(declare-fun d!38265 () Bool)

(assert (=> d!38265 (= (size!2483 newMap!16) (bvadd (_size!579 newMap!16) (bvsdiv (bvadd (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!126504 d!38265))

(assert (=> b!126416 d!38167))

(declare-fun d!38267 () Bool)

(assert (=> d!38267 (= (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016)) (not (isEmpty!400 (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))))

(declare-fun bs!5245 () Bool)

(assert (= bs!5245 d!38267))

(assert (=> bs!5245 m!147195))

(declare-fun m!147973 () Bool)

(assert (=> bs!5245 m!147973))

(assert (=> b!126446 d!38267))

(declare-fun b!126877 () Bool)

(declare-fun e!82832 () Option!171)

(assert (=> b!126877 (= e!82832 (Some!170 (_2!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(declare-fun b!126879 () Bool)

(declare-fun e!82833 () Option!171)

(assert (=> b!126879 (= e!82833 (getValueByKey!165 (t!6030 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65016))))

(declare-fun d!38269 () Bool)

(declare-fun c!23235 () Bool)

(assert (=> d!38269 (= c!23235 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65016)))))

(assert (=> d!38269 (= (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016) e!82832)))

(declare-fun b!126880 () Bool)

(assert (=> b!126880 (= e!82833 None!169)))

(declare-fun b!126878 () Bool)

(assert (=> b!126878 (= e!82832 e!82833)))

(declare-fun c!23236 () Bool)

(assert (=> b!126878 (= c!23236 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (not (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65016))))))

(assert (= (and d!38269 c!23235) b!126877))

(assert (= (and d!38269 (not c!23235)) b!126878))

(assert (= (and b!126878 c!23236) b!126879))

(assert (= (and b!126878 (not c!23236)) b!126880))

(declare-fun m!147975 () Bool)

(assert (=> b!126879 m!147975))

(assert (=> b!126446 d!38269))

(assert (=> d!38065 d!38051))

(assert (=> d!38065 d!38053))

(declare-fun d!38271 () Bool)

(assert (=> d!38271 (isDefined!119 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38271 true))

(declare-fun _$12!390 () Unit!3922)

(assert (=> d!38271 (= (choose!768 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) _$12!390)))

(declare-fun bs!5246 () Bool)

(assert (= bs!5246 d!38271))

(assert (=> bs!5246 m!146811))

(assert (=> bs!5246 m!146985))

(assert (=> bs!5246 m!146985))

(assert (=> bs!5246 m!146987))

(assert (=> d!38065 d!38271))

(declare-fun d!38273 () Bool)

(declare-fun res!61328 () Bool)

(declare-fun e!82838 () Bool)

(assert (=> d!38273 (=> res!61328 e!82838)))

(assert (=> d!38273 (= res!61328 (or ((_ is Nil!1689) (toList!839 lt!64938)) ((_ is Nil!1689) (t!6030 (toList!839 lt!64938)))))))

(assert (=> d!38273 (= (isStrictlySorted!312 (toList!839 lt!64938)) e!82838)))

(declare-fun b!126885 () Bool)

(declare-fun e!82839 () Bool)

(assert (=> b!126885 (= e!82838 e!82839)))

(declare-fun res!61329 () Bool)

(assert (=> b!126885 (=> (not res!61329) (not e!82839))))

(assert (=> b!126885 (= res!61329 (bvslt (_1!1282 (h!2290 (toList!839 lt!64938))) (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938))))))))

(declare-fun b!126886 () Bool)

(assert (=> b!126886 (= e!82839 (isStrictlySorted!312 (t!6030 (toList!839 lt!64938))))))

(assert (= (and d!38273 (not res!61328)) b!126885))

(assert (= (and b!126885 res!61329) b!126886))

(declare-fun m!147977 () Bool)

(assert (=> b!126886 m!147977))

(assert (=> d!38065 d!38273))

(assert (=> d!38135 d!38241))

(assert (=> d!38099 d!38081))

(declare-fun d!38275 () Bool)

(assert (=> d!38275 (= (apply!111 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65015) (apply!111 lt!65020 lt!65015))))

(assert (=> d!38275 true))

(declare-fun _$34!951 () Unit!3922)

(assert (=> d!38275 (= (choose!769 lt!65020 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65015) _$34!951)))

(declare-fun bs!5247 () Bool)

(assert (= bs!5247 d!38275))

(assert (=> bs!5247 m!146935))

(assert (=> bs!5247 m!146935))

(assert (=> bs!5247 m!146937))

(assert (=> bs!5247 m!146951))

(assert (=> d!38099 d!38275))

(assert (=> d!38099 d!38087))

(assert (=> d!38099 d!38089))

(declare-fun d!38277 () Bool)

(declare-fun e!82840 () Bool)

(assert (=> d!38277 e!82840))

(declare-fun res!61330 () Bool)

(assert (=> d!38277 (=> res!61330 e!82840)))

(declare-fun lt!65538 () Bool)

(assert (=> d!38277 (= res!61330 (not lt!65538))))

(declare-fun lt!65536 () Bool)

(assert (=> d!38277 (= lt!65538 lt!65536)))

(declare-fun lt!65539 () Unit!3922)

(declare-fun e!82841 () Unit!3922)

(assert (=> d!38277 (= lt!65539 e!82841)))

(declare-fun c!23237 () Bool)

(assert (=> d!38277 (= c!23237 lt!65536)))

(assert (=> d!38277 (= lt!65536 (containsKey!169 (toList!839 lt!65020) lt!65015))))

(assert (=> d!38277 (= (contains!867 lt!65020 lt!65015) lt!65538)))

(declare-fun b!126887 () Bool)

(declare-fun lt!65537 () Unit!3922)

(assert (=> b!126887 (= e!82841 lt!65537)))

(assert (=> b!126887 (= lt!65537 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65020) lt!65015))))

(assert (=> b!126887 (isDefined!119 (getValueByKey!165 (toList!839 lt!65020) lt!65015))))

(declare-fun b!126888 () Bool)

(declare-fun Unit!3949 () Unit!3922)

(assert (=> b!126888 (= e!82841 Unit!3949)))

(declare-fun b!126889 () Bool)

(assert (=> b!126889 (= e!82840 (isDefined!119 (getValueByKey!165 (toList!839 lt!65020) lt!65015)))))

(assert (= (and d!38277 c!23237) b!126887))

(assert (= (and d!38277 (not c!23237)) b!126888))

(assert (= (and d!38277 (not res!61330)) b!126889))

(declare-fun m!147979 () Bool)

(assert (=> d!38277 m!147979))

(declare-fun m!147981 () Bool)

(assert (=> b!126887 m!147981))

(assert (=> b!126887 m!147183))

(assert (=> b!126887 m!147183))

(declare-fun m!147983 () Bool)

(assert (=> b!126887 m!147983))

(assert (=> b!126889 m!147183))

(assert (=> b!126889 m!147183))

(assert (=> b!126889 m!147983))

(assert (=> d!38099 d!38277))

(declare-fun lt!65542 () Bool)

(declare-fun d!38279 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!125 (List!1692) (InoxSet tuple2!2542))

(assert (=> d!38279 (= lt!65542 (select (content!125 (toList!839 lt!65175)) (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun e!82847 () Bool)

(assert (=> d!38279 (= lt!65542 e!82847)))

(declare-fun res!61336 () Bool)

(assert (=> d!38279 (=> (not res!61336) (not e!82847))))

(assert (=> d!38279 (= res!61336 ((_ is Cons!1688) (toList!839 lt!65175)))))

(assert (=> d!38279 (= (contains!869 (toList!839 lt!65175) (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65542)))

(declare-fun b!126894 () Bool)

(declare-fun e!82846 () Bool)

(assert (=> b!126894 (= e!82847 e!82846)))

(declare-fun res!61335 () Bool)

(assert (=> b!126894 (=> res!61335 e!82846)))

(assert (=> b!126894 (= res!61335 (= (h!2290 (toList!839 lt!65175)) (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!126895 () Bool)

(assert (=> b!126895 (= e!82846 (contains!869 (t!6030 (toList!839 lt!65175)) (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38279 res!61336) b!126894))

(assert (= (and b!126894 (not res!61335)) b!126895))

(declare-fun m!147985 () Bool)

(assert (=> d!38279 m!147985))

(declare-fun m!147987 () Bool)

(assert (=> d!38279 m!147987))

(declare-fun m!147989 () Bool)

(assert (=> b!126895 m!147989))

(assert (=> b!126443 d!38279))

(declare-fun d!38281 () Bool)

(assert (=> d!38281 (= (apply!111 lt!65357 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5248 () Bool)

(assert (= bs!5248 d!38281))

(declare-fun m!147991 () Bool)

(assert (=> bs!5248 m!147991))

(assert (=> bs!5248 m!147991))

(declare-fun m!147993 () Bool)

(assert (=> bs!5248 m!147993))

(assert (=> b!126599 d!38281))

(declare-fun d!38283 () Bool)

(assert (=> d!38283 (= (get!1446 (getValueByKey!165 (toList!839 lt!65020) lt!65015)) (v!3122 (getValueByKey!165 (toList!839 lt!65020) lt!65015)))))

(assert (=> d!38087 d!38283))

(declare-fun b!126896 () Bool)

(declare-fun e!82848 () Option!171)

(assert (=> b!126896 (= e!82848 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65020)))))))

(declare-fun b!126898 () Bool)

(declare-fun e!82849 () Option!171)

(assert (=> b!126898 (= e!82849 (getValueByKey!165 (t!6030 (toList!839 lt!65020)) lt!65015))))

(declare-fun d!38285 () Bool)

(declare-fun c!23238 () Bool)

(assert (=> d!38285 (= c!23238 (and ((_ is Cons!1688) (toList!839 lt!65020)) (= (_1!1282 (h!2290 (toList!839 lt!65020))) lt!65015)))))

(assert (=> d!38285 (= (getValueByKey!165 (toList!839 lt!65020) lt!65015) e!82848)))

(declare-fun b!126899 () Bool)

(assert (=> b!126899 (= e!82849 None!169)))

(declare-fun b!126897 () Bool)

(assert (=> b!126897 (= e!82848 e!82849)))

(declare-fun c!23239 () Bool)

(assert (=> b!126897 (= c!23239 (and ((_ is Cons!1688) (toList!839 lt!65020)) (not (= (_1!1282 (h!2290 (toList!839 lt!65020))) lt!65015))))))

(assert (= (and d!38285 c!23238) b!126896))

(assert (= (and d!38285 (not c!23238)) b!126897))

(assert (= (and b!126897 c!23239) b!126898))

(assert (= (and b!126897 (not c!23239)) b!126899))

(declare-fun m!147995 () Bool)

(assert (=> b!126898 m!147995))

(assert (=> d!38087 d!38285))

(declare-fun d!38287 () Bool)

(assert (=> d!38287 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!65543 () Unit!3922)

(assert (=> d!38287 (= lt!65543 (choose!768 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82850 () Bool)

(assert (=> d!38287 e!82850))

(declare-fun res!61337 () Bool)

(assert (=> d!38287 (=> (not res!61337) (not e!82850))))

(assert (=> d!38287 (= res!61337 (isStrictlySorted!312 (toList!839 lt!65010)))))

(assert (=> d!38287 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65543)))

(declare-fun b!126900 () Bool)

(assert (=> b!126900 (= e!82850 (containsKey!169 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38287 res!61337) b!126900))

(assert (=> d!38287 m!146957))

(assert (=> d!38287 m!147347))

(assert (=> d!38287 m!147347))

(assert (=> d!38287 m!147487))

(assert (=> d!38287 m!146957))

(declare-fun m!147997 () Bool)

(assert (=> d!38287 m!147997))

(assert (=> d!38287 m!147799))

(assert (=> b!126900 m!146957))

(assert (=> b!126900 m!147483))

(assert (=> b!126643 d!38287))

(declare-fun d!38289 () Bool)

(assert (=> d!38289 (= (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!400 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5249 () Bool)

(assert (= bs!5249 d!38289))

(assert (=> bs!5249 m!147347))

(declare-fun m!147999 () Bool)

(assert (=> bs!5249 m!147999))

(assert (=> b!126643 d!38289))

(declare-fun b!126901 () Bool)

(declare-fun e!82851 () Option!171)

(assert (=> b!126901 (= e!82851 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65010)))))))

(declare-fun b!126903 () Bool)

(declare-fun e!82852 () Option!171)

(assert (=> b!126903 (= e!82852 (getValueByKey!165 (t!6030 (toList!839 lt!65010)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun c!23240 () Bool)

(declare-fun d!38291 () Bool)

(assert (=> d!38291 (= c!23240 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38291 (= (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!82851)))

(declare-fun b!126904 () Bool)

(assert (=> b!126904 (= e!82852 None!169)))

(declare-fun b!126902 () Bool)

(assert (=> b!126902 (= e!82851 e!82852)))

(declare-fun c!23241 () Bool)

(assert (=> b!126902 (= c!23241 (and ((_ is Cons!1688) (toList!839 lt!65010)) (not (= (_1!1282 (h!2290 (toList!839 lt!65010))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(assert (= (and d!38291 c!23240) b!126901))

(assert (= (and d!38291 (not c!23240)) b!126902))

(assert (= (and b!126902 c!23241) b!126903))

(assert (= (and b!126902 (not c!23241)) b!126904))

(assert (=> b!126903 m!146957))

(declare-fun m!148001 () Bool)

(assert (=> b!126903 m!148001))

(assert (=> b!126643 d!38291))

(declare-fun d!38293 () Bool)

(declare-fun e!82853 () Bool)

(assert (=> d!38293 e!82853))

(declare-fun res!61338 () Bool)

(assert (=> d!38293 (=> res!61338 e!82853)))

(declare-fun lt!65546 () Bool)

(assert (=> d!38293 (= res!61338 (not lt!65546))))

(declare-fun lt!65544 () Bool)

(assert (=> d!38293 (= lt!65546 lt!65544)))

(declare-fun lt!65547 () Unit!3922)

(declare-fun e!82854 () Unit!3922)

(assert (=> d!38293 (= lt!65547 e!82854)))

(declare-fun c!23242 () Bool)

(assert (=> d!38293 (= c!23242 lt!65544)))

(assert (=> d!38293 (= lt!65544 (containsKey!169 (toList!839 lt!65404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38293 (= (contains!867 lt!65404 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65546)))

(declare-fun b!126905 () Bool)

(declare-fun lt!65545 () Unit!3922)

(assert (=> b!126905 (= e!82854 lt!65545)))

(assert (=> b!126905 (= lt!65545 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126905 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126906 () Bool)

(declare-fun Unit!3950 () Unit!3922)

(assert (=> b!126906 (= e!82854 Unit!3950)))

(declare-fun b!126907 () Bool)

(assert (=> b!126907 (= e!82853 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38293 c!23242) b!126905))

(assert (= (and d!38293 (not c!23242)) b!126906))

(assert (= (and d!38293 (not res!61338)) b!126907))

(declare-fun m!148003 () Bool)

(assert (=> d!38293 m!148003))

(declare-fun m!148005 () Bool)

(assert (=> b!126905 m!148005))

(declare-fun m!148007 () Bool)

(assert (=> b!126905 m!148007))

(assert (=> b!126905 m!148007))

(declare-fun m!148009 () Bool)

(assert (=> b!126905 m!148009))

(assert (=> b!126907 m!148007))

(assert (=> b!126907 m!148007))

(assert (=> b!126907 m!148009))

(assert (=> bm!13637 d!38293))

(declare-fun d!38295 () Bool)

(declare-fun res!61339 () Bool)

(declare-fun e!82855 () Bool)

(assert (=> d!38295 (=> res!61339 e!82855)))

(assert (=> d!38295 (= res!61339 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38295 (= (containsKey!169 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000) e!82855)))

(declare-fun b!126908 () Bool)

(declare-fun e!82856 () Bool)

(assert (=> b!126908 (= e!82855 e!82856)))

(declare-fun res!61340 () Bool)

(assert (=> b!126908 (=> (not res!61340) (not e!82856))))

(assert (=> b!126908 (= res!61340 (and (or (not ((_ is Cons!1688) (toList!839 lt!65010))) (bvsle (_1!1282 (h!2290 (toList!839 lt!65010))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1688) (toList!839 lt!65010)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65010))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126909 () Bool)

(assert (=> b!126909 (= e!82856 (containsKey!169 (t!6030 (toList!839 lt!65010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38295 (not res!61339)) b!126908))

(assert (= (and b!126908 res!61340) b!126909))

(declare-fun m!148011 () Bool)

(assert (=> b!126909 m!148011))

(assert (=> d!38131 d!38295))

(declare-fun d!38297 () Bool)

(declare-fun e!82857 () Bool)

(assert (=> d!38297 e!82857))

(declare-fun res!61341 () Bool)

(assert (=> d!38297 (=> (not res!61341) (not e!82857))))

(declare-fun lt!65550 () ListLongMap!1647)

(assert (=> d!38297 (= res!61341 (contains!867 lt!65550 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun lt!65548 () List!1692)

(assert (=> d!38297 (= lt!65550 (ListLongMap!1648 lt!65548))))

(declare-fun lt!65551 () Unit!3922)

(declare-fun lt!65549 () Unit!3922)

(assert (=> d!38297 (= lt!65551 lt!65549)))

(assert (=> d!38297 (= (getValueByKey!165 lt!65548 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38297 (= lt!65549 (lemmaContainsTupThenGetReturnValue!83 lt!65548 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38297 (= lt!65548 (insertStrictlySorted!86 (toList!839 call!13606) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38297 (= (+!158 call!13606 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) lt!65550)))

(declare-fun b!126910 () Bool)

(declare-fun res!61342 () Bool)

(assert (=> b!126910 (=> (not res!61342) (not e!82857))))

(assert (=> b!126910 (= res!61342 (= (getValueByKey!165 (toList!839 lt!65550) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun b!126911 () Bool)

(assert (=> b!126911 (= e!82857 (contains!869 (toList!839 lt!65550) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(assert (= (and d!38297 res!61341) b!126910))

(assert (= (and b!126910 res!61342) b!126911))

(declare-fun m!148013 () Bool)

(assert (=> d!38297 m!148013))

(declare-fun m!148015 () Bool)

(assert (=> d!38297 m!148015))

(declare-fun m!148017 () Bool)

(assert (=> d!38297 m!148017))

(declare-fun m!148019 () Bool)

(assert (=> d!38297 m!148019))

(declare-fun m!148021 () Bool)

(assert (=> b!126910 m!148021))

(declare-fun m!148023 () Bool)

(assert (=> b!126911 m!148023))

(assert (=> b!126522 d!38297))

(assert (=> b!126473 d!38079))

(declare-fun d!38299 () Bool)

(assert (=> d!38299 (= (apply!111 lt!65404 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5250 () Bool)

(assert (= bs!5250 d!38299))

(declare-fun m!148025 () Bool)

(assert (=> bs!5250 m!148025))

(assert (=> bs!5250 m!148025))

(declare-fun m!148027 () Bool)

(assert (=> bs!5250 m!148027))

(assert (=> b!126664 d!38299))

(declare-fun d!38301 () Bool)

(declare-fun e!82858 () Bool)

(assert (=> d!38301 e!82858))

(declare-fun res!61343 () Bool)

(assert (=> d!38301 (=> (not res!61343) (not e!82858))))

(declare-fun lt!65554 () ListLongMap!1647)

(assert (=> d!38301 (= res!61343 (contains!867 lt!65554 (_1!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun lt!65552 () List!1692)

(assert (=> d!38301 (= lt!65554 (ListLongMap!1648 lt!65552))))

(declare-fun lt!65555 () Unit!3922)

(declare-fun lt!65553 () Unit!3922)

(assert (=> d!38301 (= lt!65555 lt!65553)))

(assert (=> d!38301 (= (getValueByKey!165 lt!65552 (_1!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38301 (= lt!65553 (lemmaContainsTupThenGetReturnValue!83 lt!65552 (_1!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38301 (= lt!65552 (insertStrictlySorted!86 (toList!839 (ite c!23174 call!13639 (ite c!23172 call!13634 call!13635))) (_1!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38301 (= (+!158 (ite c!23174 call!13639 (ite c!23172 call!13634 call!13635)) (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) lt!65554)))

(declare-fun b!126912 () Bool)

(declare-fun res!61344 () Bool)

(assert (=> b!126912 (=> (not res!61344) (not e!82858))))

(assert (=> b!126912 (= res!61344 (= (getValueByKey!165 (toList!839 lt!65554) (_1!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))))

(declare-fun b!126913 () Bool)

(assert (=> b!126913 (= e!82858 (contains!869 (toList!839 lt!65554) (ite (or c!23174 c!23172) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23089) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (= (and d!38301 res!61343) b!126912))

(assert (= (and b!126912 res!61344) b!126913))

(declare-fun m!148029 () Bool)

(assert (=> d!38301 m!148029))

(declare-fun m!148031 () Bool)

(assert (=> d!38301 m!148031))

(declare-fun m!148033 () Bool)

(assert (=> d!38301 m!148033))

(declare-fun m!148035 () Bool)

(assert (=> d!38301 m!148035))

(declare-fun m!148037 () Bool)

(assert (=> b!126912 m!148037))

(declare-fun m!148039 () Bool)

(assert (=> b!126913 m!148039))

(assert (=> bm!13635 d!38301))

(declare-fun d!38303 () Bool)

(assert (=> d!38303 (= (get!1446 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3122 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38055 d!38303))

(declare-fun b!126914 () Bool)

(declare-fun e!82859 () Option!171)

(assert (=> b!126914 (= e!82859 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65010)))))))

(declare-fun b!126916 () Bool)

(declare-fun e!82860 () Option!171)

(assert (=> b!126916 (= e!82860 (getValueByKey!165 (t!6030 (toList!839 lt!65010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38305 () Bool)

(declare-fun c!23243 () Bool)

(assert (=> d!38305 (= c!23243 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38305 (= (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000) e!82859)))

(declare-fun b!126917 () Bool)

(assert (=> b!126917 (= e!82860 None!169)))

(declare-fun b!126915 () Bool)

(assert (=> b!126915 (= e!82859 e!82860)))

(declare-fun c!23244 () Bool)

(assert (=> b!126915 (= c!23244 (and ((_ is Cons!1688) (toList!839 lt!65010)) (not (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38305 c!23243) b!126914))

(assert (= (and d!38305 (not c!23243)) b!126915))

(assert (= (and b!126915 c!23244) b!126916))

(assert (= (and b!126915 (not c!23244)) b!126917))

(declare-fun m!148041 () Bool)

(assert (=> b!126916 m!148041))

(assert (=> d!38055 d!38305))

(declare-fun d!38307 () Bool)

(declare-fun e!82861 () Bool)

(assert (=> d!38307 e!82861))

(declare-fun res!61345 () Bool)

(assert (=> d!38307 (=> res!61345 e!82861)))

(declare-fun lt!65558 () Bool)

(assert (=> d!38307 (= res!61345 (not lt!65558))))

(declare-fun lt!65556 () Bool)

(assert (=> d!38307 (= lt!65558 lt!65556)))

(declare-fun lt!65559 () Unit!3922)

(declare-fun e!82862 () Unit!3922)

(assert (=> d!38307 (= lt!65559 e!82862)))

(declare-fun c!23245 () Bool)

(assert (=> d!38307 (= c!23245 lt!65556)))

(assert (=> d!38307 (= lt!65556 (containsKey!169 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38307 (= (contains!867 lt!65183 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65558)))

(declare-fun b!126918 () Bool)

(declare-fun lt!65557 () Unit!3922)

(assert (=> b!126918 (= e!82862 lt!65557)))

(assert (=> b!126918 (= lt!65557 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> b!126918 (isDefined!119 (getValueByKey!165 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126919 () Bool)

(declare-fun Unit!3951 () Unit!3922)

(assert (=> b!126919 (= e!82862 Unit!3951)))

(declare-fun b!126920 () Bool)

(assert (=> b!126920 (= e!82861 (isDefined!119 (getValueByKey!165 (toList!839 lt!65183) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38307 c!23245) b!126918))

(assert (= (and d!38307 (not c!23245)) b!126919))

(assert (= (and d!38307 (not res!61345)) b!126920))

(declare-fun m!148043 () Bool)

(assert (=> d!38307 m!148043))

(declare-fun m!148045 () Bool)

(assert (=> b!126918 m!148045))

(assert (=> b!126918 m!147211))

(assert (=> b!126918 m!147211))

(declare-fun m!148047 () Bool)

(assert (=> b!126918 m!148047))

(assert (=> b!126920 m!147211))

(assert (=> b!126920 m!147211))

(assert (=> b!126920 m!148047))

(assert (=> d!38095 d!38307))

(declare-fun b!126921 () Bool)

(declare-fun e!82863 () Option!171)

(assert (=> b!126921 (= e!82863 (Some!170 (_2!1282 (h!2290 lt!65181))))))

(declare-fun e!82864 () Option!171)

(declare-fun b!126923 () Bool)

(assert (=> b!126923 (= e!82864 (getValueByKey!165 (t!6030 lt!65181) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38309 () Bool)

(declare-fun c!23246 () Bool)

(assert (=> d!38309 (= c!23246 (and ((_ is Cons!1688) lt!65181) (= (_1!1282 (h!2290 lt!65181)) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38309 (= (getValueByKey!165 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82863)))

(declare-fun b!126924 () Bool)

(assert (=> b!126924 (= e!82864 None!169)))

(declare-fun b!126922 () Bool)

(assert (=> b!126922 (= e!82863 e!82864)))

(declare-fun c!23247 () Bool)

(assert (=> b!126922 (= c!23247 (and ((_ is Cons!1688) lt!65181) (not (= (_1!1282 (h!2290 lt!65181)) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38309 c!23246) b!126921))

(assert (= (and d!38309 (not c!23246)) b!126922))

(assert (= (and b!126922 c!23247) b!126923))

(assert (= (and b!126922 (not c!23247)) b!126924))

(declare-fun m!148049 () Bool)

(assert (=> b!126923 m!148049))

(assert (=> d!38095 d!38309))

(declare-fun d!38311 () Bool)

(assert (=> d!38311 (= (getValueByKey!165 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65560 () Unit!3922)

(assert (=> d!38311 (= lt!65560 (choose!776 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!82865 () Bool)

(assert (=> d!38311 e!82865))

(declare-fun res!61346 () Bool)

(assert (=> d!38311 (=> (not res!61346) (not e!82865))))

(assert (=> d!38311 (= res!61346 (isStrictlySorted!312 lt!65181))))

(assert (=> d!38311 (= (lemmaContainsTupThenGetReturnValue!83 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65560)))

(declare-fun b!126925 () Bool)

(declare-fun res!61347 () Bool)

(assert (=> b!126925 (=> (not res!61347) (not e!82865))))

(assert (=> b!126925 (= res!61347 (containsKey!169 lt!65181 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126926 () Bool)

(assert (=> b!126926 (= e!82865 (contains!869 lt!65181 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38311 res!61346) b!126925))

(assert (= (and b!126925 res!61347) b!126926))

(assert (=> d!38311 m!147205))

(declare-fun m!148051 () Bool)

(assert (=> d!38311 m!148051))

(declare-fun m!148053 () Bool)

(assert (=> d!38311 m!148053))

(declare-fun m!148055 () Bool)

(assert (=> b!126925 m!148055))

(declare-fun m!148057 () Bool)

(assert (=> b!126926 m!148057))

(assert (=> d!38095 d!38311))

(declare-fun bm!13667 () Bool)

(declare-fun call!13671 () List!1692)

(declare-fun call!13670 () List!1692)

(assert (=> bm!13667 (= call!13671 call!13670)))

(declare-fun lt!65561 () List!1692)

(declare-fun e!82866 () Bool)

(declare-fun b!126927 () Bool)

(assert (=> b!126927 (= e!82866 (contains!869 lt!65561 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun c!23251 () Bool)

(declare-fun bm!13668 () Bool)

(declare-fun e!82868 () List!1692)

(assert (=> bm!13668 (= call!13670 ($colon$colon!88 e!82868 (ite c!23251 (h!2290 (toList!839 lt!65005)) (tuple2!2543 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun c!23249 () Bool)

(assert (=> bm!13668 (= c!23249 c!23251)))

(declare-fun b!126928 () Bool)

(declare-fun e!82870 () List!1692)

(declare-fun call!13672 () List!1692)

(assert (=> b!126928 (= e!82870 call!13672)))

(declare-fun b!126929 () Bool)

(declare-fun e!82869 () List!1692)

(declare-fun e!82867 () List!1692)

(assert (=> b!126929 (= e!82869 e!82867)))

(declare-fun c!23250 () Bool)

(assert (=> b!126929 (= c!23250 (and ((_ is Cons!1688) (toList!839 lt!65005)) (= (_1!1282 (h!2290 (toList!839 lt!65005))) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!126930 () Bool)

(assert (=> b!126930 (= e!82870 call!13672)))

(declare-fun c!23248 () Bool)

(declare-fun b!126931 () Bool)

(assert (=> b!126931 (= e!82868 (ite c!23250 (t!6030 (toList!839 lt!65005)) (ite c!23248 (Cons!1688 (h!2290 (toList!839 lt!65005)) (t!6030 (toList!839 lt!65005))) Nil!1689)))))

(declare-fun b!126932 () Bool)

(assert (=> b!126932 (= e!82869 call!13670)))

(declare-fun b!126933 () Bool)

(assert (=> b!126933 (= c!23248 (and ((_ is Cons!1688) (toList!839 lt!65005)) (bvsgt (_1!1282 (h!2290 (toList!839 lt!65005))) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!126933 (= e!82867 e!82870)))

(declare-fun b!126934 () Bool)

(declare-fun res!61348 () Bool)

(assert (=> b!126934 (=> (not res!61348) (not e!82866))))

(assert (=> b!126934 (= res!61348 (containsKey!169 lt!65561 (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38313 () Bool)

(assert (=> d!38313 e!82866))

(declare-fun res!61349 () Bool)

(assert (=> d!38313 (=> (not res!61349) (not e!82866))))

(assert (=> d!38313 (= res!61349 (isStrictlySorted!312 lt!65561))))

(assert (=> d!38313 (= lt!65561 e!82869)))

(assert (=> d!38313 (= c!23251 (and ((_ is Cons!1688) (toList!839 lt!65005)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65005))) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38313 (isStrictlySorted!312 (toList!839 lt!65005))))

(assert (=> d!38313 (= (insertStrictlySorted!86 (toList!839 lt!65005) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65561)))

(declare-fun bm!13669 () Bool)

(assert (=> bm!13669 (= call!13672 call!13671)))

(declare-fun b!126935 () Bool)

(assert (=> b!126935 (= e!82868 (insertStrictlySorted!86 (t!6030 (toList!839 lt!65005)) (_1!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126936 () Bool)

(assert (=> b!126936 (= e!82867 call!13671)))

(assert (= (and d!38313 c!23251) b!126932))

(assert (= (and d!38313 (not c!23251)) b!126929))

(assert (= (and b!126929 c!23250) b!126936))

(assert (= (and b!126929 (not c!23250)) b!126933))

(assert (= (and b!126933 c!23248) b!126930))

(assert (= (and b!126933 (not c!23248)) b!126928))

(assert (= (or b!126930 b!126928) bm!13669))

(assert (= (or b!126936 bm!13669) bm!13667))

(assert (= (or b!126932 bm!13667) bm!13668))

(assert (= (and bm!13668 c!23249) b!126935))

(assert (= (and bm!13668 (not c!23249)) b!126931))

(assert (= (and d!38313 res!61349) b!126934))

(assert (= (and b!126934 res!61348) b!126927))

(declare-fun m!148059 () Bool)

(assert (=> b!126927 m!148059))

(declare-fun m!148061 () Bool)

(assert (=> bm!13668 m!148061))

(declare-fun m!148063 () Bool)

(assert (=> b!126934 m!148063))

(declare-fun m!148065 () Bool)

(assert (=> b!126935 m!148065))

(declare-fun m!148067 () Bool)

(assert (=> d!38313 m!148067))

(declare-fun m!148069 () Bool)

(assert (=> d!38313 m!148069))

(assert (=> d!38095 d!38313))

(assert (=> b!126435 d!38167))

(declare-fun d!38315 () Bool)

(assert (=> d!38315 (= (apply!111 lt!65225 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (getValueByKey!165 (toList!839 lt!65225) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5251 () Bool)

(assert (= bs!5251 d!38315))

(assert (=> bs!5251 m!147085))

(declare-fun m!148071 () Bool)

(assert (=> bs!5251 m!148071))

(assert (=> bs!5251 m!148071))

(declare-fun m!148073 () Bool)

(assert (=> bs!5251 m!148073))

(assert (=> b!126517 d!38315))

(declare-fun d!38317 () Bool)

(declare-fun c!23252 () Bool)

(assert (=> d!38317 (= c!23252 ((_ is ValueCellFull!1076) (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82871 () V!3433)

(assert (=> d!38317 (= (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82871)))

(declare-fun b!126937 () Bool)

(assert (=> b!126937 (= e!82871 (get!1444 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126938 () Bool)

(assert (=> b!126938 (= e!82871 (get!1445 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38317 c!23252) b!126937))

(assert (= (and d!38317 (not c!23252)) b!126938))

(assert (=> b!126937 m!147311))

(assert (=> b!126937 m!147313))

(declare-fun m!148075 () Bool)

(assert (=> b!126937 m!148075))

(assert (=> b!126938 m!147311))

(assert (=> b!126938 m!147313))

(declare-fun m!148077 () Bool)

(assert (=> b!126938 m!148077))

(assert (=> b!126517 d!38317))

(declare-fun d!38319 () Bool)

(declare-fun res!61350 () Bool)

(declare-fun e!82872 () Bool)

(assert (=> d!38319 (=> (not res!61350) (not e!82872))))

(assert (=> d!38319 (= res!61350 (simpleValid!87 (_2!1283 lt!65342)))))

(assert (=> d!38319 (= (valid!509 (_2!1283 lt!65342)) e!82872)))

(declare-fun b!126939 () Bool)

(declare-fun res!61351 () Bool)

(assert (=> b!126939 (=> (not res!61351) (not e!82872))))

(assert (=> b!126939 (= res!61351 (= (arrayCountValidKeys!0 (_keys!4514 (_2!1283 lt!65342)) #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65342)))) (_size!579 (_2!1283 lt!65342))))))

(declare-fun b!126940 () Bool)

(declare-fun res!61352 () Bool)

(assert (=> b!126940 (=> (not res!61352) (not e!82872))))

(assert (=> b!126940 (= res!61352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 (_2!1283 lt!65342)) (mask!7037 (_2!1283 lt!65342))))))

(declare-fun b!126941 () Bool)

(assert (=> b!126941 (= e!82872 (arrayNoDuplicates!0 (_keys!4514 (_2!1283 lt!65342)) #b00000000000000000000000000000000 Nil!1691))))

(assert (= (and d!38319 res!61350) b!126939))

(assert (= (and b!126939 res!61351) b!126940))

(assert (= (and b!126940 res!61352) b!126941))

(declare-fun m!148079 () Bool)

(assert (=> d!38319 m!148079))

(declare-fun m!148081 () Bool)

(assert (=> b!126939 m!148081))

(declare-fun m!148083 () Bool)

(assert (=> b!126940 m!148083))

(declare-fun m!148085 () Bool)

(assert (=> b!126941 m!148085))

(assert (=> b!126585 d!38319))

(assert (=> b!126581 d!38127))

(assert (=> b!126610 d!38167))

(declare-fun d!38321 () Bool)

(declare-fun lt!65562 () Bool)

(assert (=> d!38321 (= lt!65562 (select (content!125 (toList!839 lt!65156)) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!82874 () Bool)

(assert (=> d!38321 (= lt!65562 e!82874)))

(declare-fun res!61354 () Bool)

(assert (=> d!38321 (=> (not res!61354) (not e!82874))))

(assert (=> d!38321 (= res!61354 ((_ is Cons!1688) (toList!839 lt!65156)))))

(assert (=> d!38321 (= (contains!869 (toList!839 lt!65156) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65562)))

(declare-fun b!126942 () Bool)

(declare-fun e!82873 () Bool)

(assert (=> b!126942 (= e!82874 e!82873)))

(declare-fun res!61353 () Bool)

(assert (=> b!126942 (=> res!61353 e!82873)))

(assert (=> b!126942 (= res!61353 (= (h!2290 (toList!839 lt!65156)) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!126943 () Bool)

(assert (=> b!126943 (= e!82873 (contains!869 (t!6030 (toList!839 lt!65156)) (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (= (and d!38321 res!61354) b!126942))

(assert (= (and b!126942 (not res!61353)) b!126943))

(declare-fun m!148087 () Bool)

(assert (=> d!38321 m!148087))

(declare-fun m!148089 () Bool)

(assert (=> d!38321 m!148089))

(declare-fun m!148091 () Bool)

(assert (=> b!126943 m!148091))

(assert (=> b!126401 d!38321))

(declare-fun d!38323 () Bool)

(assert (=> d!38323 (= (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!400 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5252 () Bool)

(assert (= bs!5252 d!38323))

(assert (=> bs!5252 m!147067))

(declare-fun m!148093 () Bool)

(assert (=> bs!5252 m!148093))

(assert (=> b!126597 d!38323))

(assert (=> b!126597 d!38305))

(assert (=> bm!13629 d!38075))

(declare-fun d!38325 () Bool)

(declare-fun e!82875 () Bool)

(assert (=> d!38325 e!82875))

(declare-fun res!61355 () Bool)

(assert (=> d!38325 (=> res!61355 e!82875)))

(declare-fun lt!65565 () Bool)

(assert (=> d!38325 (= res!61355 (not lt!65565))))

(declare-fun lt!65563 () Bool)

(assert (=> d!38325 (= lt!65565 lt!65563)))

(declare-fun lt!65566 () Unit!3922)

(declare-fun e!82876 () Unit!3922)

(assert (=> d!38325 (= lt!65566 e!82876)))

(declare-fun c!23253 () Bool)

(assert (=> d!38325 (= c!23253 lt!65563)))

(assert (=> d!38325 (= lt!65563 (containsKey!169 (toList!839 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38325 (= (contains!867 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65565)))

(declare-fun b!126944 () Bool)

(declare-fun lt!65564 () Unit!3922)

(assert (=> b!126944 (= e!82876 lt!65564)))

(assert (=> b!126944 (= lt!65564 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126944 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126945 () Bool)

(declare-fun Unit!3952 () Unit!3922)

(assert (=> b!126945 (= e!82876 Unit!3952)))

(declare-fun b!126946 () Bool)

(assert (=> b!126946 (= e!82875 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38325 c!23253) b!126944))

(assert (= (and d!38325 (not c!23253)) b!126945))

(assert (= (and d!38325 (not res!61355)) b!126946))

(declare-fun m!148095 () Bool)

(assert (=> d!38325 m!148095))

(declare-fun m!148097 () Bool)

(assert (=> b!126944 m!148097))

(declare-fun m!148099 () Bool)

(assert (=> b!126944 m!148099))

(assert (=> b!126944 m!148099))

(declare-fun m!148101 () Bool)

(assert (=> b!126944 m!148101))

(assert (=> b!126946 m!148099))

(assert (=> b!126946 m!148099))

(assert (=> b!126946 m!148101))

(assert (=> bm!13602 d!38325))

(declare-fun d!38327 () Bool)

(declare-fun e!82877 () Bool)

(assert (=> d!38327 e!82877))

(declare-fun res!61356 () Bool)

(assert (=> d!38327 (=> res!61356 e!82877)))

(declare-fun lt!65569 () Bool)

(assert (=> d!38327 (= res!61356 (not lt!65569))))

(declare-fun lt!65567 () Bool)

(assert (=> d!38327 (= lt!65569 lt!65567)))

(declare-fun lt!65570 () Unit!3922)

(declare-fun e!82878 () Unit!3922)

(assert (=> d!38327 (= lt!65570 e!82878)))

(declare-fun c!23254 () Bool)

(assert (=> d!38327 (= c!23254 lt!65567)))

(assert (=> d!38327 (= lt!65567 (containsKey!169 (toList!839 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205))) lt!65204))))

(assert (=> d!38327 (= (contains!867 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205)) lt!65204) lt!65569)))

(declare-fun b!126947 () Bool)

(declare-fun lt!65568 () Unit!3922)

(assert (=> b!126947 (= e!82878 lt!65568)))

(assert (=> b!126947 (= lt!65568 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205))) lt!65204))))

(assert (=> b!126947 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205))) lt!65204))))

(declare-fun b!126948 () Bool)

(declare-fun Unit!3953 () Unit!3922)

(assert (=> b!126948 (= e!82878 Unit!3953)))

(declare-fun b!126949 () Bool)

(assert (=> b!126949 (= e!82877 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205))) lt!65204)))))

(assert (= (and d!38327 c!23254) b!126947))

(assert (= (and d!38327 (not c!23254)) b!126948))

(assert (= (and d!38327 (not res!61356)) b!126949))

(declare-fun m!148103 () Bool)

(assert (=> d!38327 m!148103))

(declare-fun m!148105 () Bool)

(assert (=> b!126947 m!148105))

(declare-fun m!148107 () Bool)

(assert (=> b!126947 m!148107))

(assert (=> b!126947 m!148107))

(declare-fun m!148109 () Bool)

(assert (=> b!126947 m!148109))

(assert (=> b!126949 m!148107))

(assert (=> b!126949 m!148107))

(assert (=> b!126949 m!148109))

(assert (=> b!126480 d!38327))

(assert (=> b!126480 d!38125))

(declare-fun d!38329 () Bool)

(declare-fun e!82879 () Bool)

(assert (=> d!38329 e!82879))

(declare-fun res!61357 () Bool)

(assert (=> d!38329 (=> (not res!61357) (not e!82879))))

(declare-fun lt!65573 () ListLongMap!1647)

(assert (=> d!38329 (= res!61357 (contains!867 lt!65573 (_1!1282 (tuple2!2543 lt!65202 lt!65205))))))

(declare-fun lt!65571 () List!1692)

(assert (=> d!38329 (= lt!65573 (ListLongMap!1648 lt!65571))))

(declare-fun lt!65574 () Unit!3922)

(declare-fun lt!65572 () Unit!3922)

(assert (=> d!38329 (= lt!65574 lt!65572)))

(assert (=> d!38329 (= (getValueByKey!165 lt!65571 (_1!1282 (tuple2!2543 lt!65202 lt!65205))) (Some!170 (_2!1282 (tuple2!2543 lt!65202 lt!65205))))))

(assert (=> d!38329 (= lt!65572 (lemmaContainsTupThenGetReturnValue!83 lt!65571 (_1!1282 (tuple2!2543 lt!65202 lt!65205)) (_2!1282 (tuple2!2543 lt!65202 lt!65205))))))

(assert (=> d!38329 (= lt!65571 (insertStrictlySorted!86 (toList!839 lt!65200) (_1!1282 (tuple2!2543 lt!65202 lt!65205)) (_2!1282 (tuple2!2543 lt!65202 lt!65205))))))

(assert (=> d!38329 (= (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205)) lt!65573)))

(declare-fun b!126950 () Bool)

(declare-fun res!61358 () Bool)

(assert (=> b!126950 (=> (not res!61358) (not e!82879))))

(assert (=> b!126950 (= res!61358 (= (getValueByKey!165 (toList!839 lt!65573) (_1!1282 (tuple2!2543 lt!65202 lt!65205))) (Some!170 (_2!1282 (tuple2!2543 lt!65202 lt!65205)))))))

(declare-fun b!126951 () Bool)

(assert (=> b!126951 (= e!82879 (contains!869 (toList!839 lt!65573) (tuple2!2543 lt!65202 lt!65205)))))

(assert (= (and d!38329 res!61357) b!126950))

(assert (= (and b!126950 res!61358) b!126951))

(declare-fun m!148111 () Bool)

(assert (=> d!38329 m!148111))

(declare-fun m!148113 () Bool)

(assert (=> d!38329 m!148113))

(declare-fun m!148115 () Bool)

(assert (=> d!38329 m!148115))

(declare-fun m!148117 () Bool)

(assert (=> d!38329 m!148117))

(declare-fun m!148119 () Bool)

(assert (=> b!126950 m!148119))

(declare-fun m!148121 () Bool)

(assert (=> b!126951 m!148121))

(assert (=> b!126480 d!38329))

(declare-fun d!38331 () Bool)

(declare-fun e!82880 () Bool)

(assert (=> d!38331 e!82880))

(declare-fun res!61359 () Bool)

(assert (=> d!38331 (=> (not res!61359) (not e!82880))))

(declare-fun lt!65577 () ListLongMap!1647)

(assert (=> d!38331 (= res!61359 (contains!867 lt!65577 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65575 () List!1692)

(assert (=> d!38331 (= lt!65577 (ListLongMap!1648 lt!65575))))

(declare-fun lt!65578 () Unit!3922)

(declare-fun lt!65576 () Unit!3922)

(assert (=> d!38331 (= lt!65578 lt!65576)))

(assert (=> d!38331 (= (getValueByKey!165 lt!65575 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38331 (= lt!65576 (lemmaContainsTupThenGetReturnValue!83 lt!65575 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38331 (= lt!65575 (insertStrictlySorted!86 (toList!839 call!13601) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38331 (= (+!158 call!13601 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65577)))

(declare-fun b!126952 () Bool)

(declare-fun res!61360 () Bool)

(assert (=> b!126952 (=> (not res!61360) (not e!82880))))

(assert (=> b!126952 (= res!61360 (= (getValueByKey!165 (toList!839 lt!65577) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126953 () Bool)

(assert (=> b!126953 (= e!82880 (contains!869 (toList!839 lt!65577) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38331 res!61359) b!126952))

(assert (= (and b!126952 res!61360) b!126953))

(declare-fun m!148123 () Bool)

(assert (=> d!38331 m!148123))

(declare-fun m!148125 () Bool)

(assert (=> d!38331 m!148125))

(declare-fun m!148127 () Bool)

(assert (=> d!38331 m!148127))

(declare-fun m!148129 () Bool)

(assert (=> d!38331 m!148129))

(declare-fun m!148131 () Bool)

(assert (=> b!126952 m!148131))

(declare-fun m!148133 () Bool)

(assert (=> b!126953 m!148133))

(assert (=> b!126480 d!38331))

(declare-fun d!38333 () Bool)

(assert (=> d!38333 (not (contains!867 (+!158 lt!65200 (tuple2!2543 lt!65202 lt!65205)) lt!65204))))

(declare-fun lt!65581 () Unit!3922)

(declare-fun choose!777 (ListLongMap!1647 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3922)

(assert (=> d!38333 (= lt!65581 (choose!777 lt!65200 lt!65202 lt!65205 lt!65204))))

(declare-fun e!82883 () Bool)

(assert (=> d!38333 e!82883))

(declare-fun res!61363 () Bool)

(assert (=> d!38333 (=> (not res!61363) (not e!82883))))

(assert (=> d!38333 (= res!61363 (not (contains!867 lt!65200 lt!65204)))))

(assert (=> d!38333 (= (addStillNotContains!57 lt!65200 lt!65202 lt!65205 lt!65204) lt!65581)))

(declare-fun b!126957 () Bool)

(assert (=> b!126957 (= e!82883 (not (= lt!65202 lt!65204)))))

(assert (= (and d!38333 res!61363) b!126957))

(assert (=> d!38333 m!147227))

(assert (=> d!38333 m!147227))

(assert (=> d!38333 m!147229))

(declare-fun m!148135 () Bool)

(assert (=> d!38333 m!148135))

(declare-fun m!148137 () Bool)

(assert (=> d!38333 m!148137))

(assert (=> b!126480 d!38333))

(declare-fun d!38335 () Bool)

(declare-fun e!82884 () Bool)

(assert (=> d!38335 e!82884))

(declare-fun res!61364 () Bool)

(assert (=> d!38335 (=> res!61364 e!82884)))

(declare-fun lt!65584 () Bool)

(assert (=> d!38335 (= res!61364 (not lt!65584))))

(declare-fun lt!65582 () Bool)

(assert (=> d!38335 (= lt!65584 lt!65582)))

(declare-fun lt!65585 () Unit!3922)

(declare-fun e!82885 () Unit!3922)

(assert (=> d!38335 (= lt!65585 e!82885)))

(declare-fun c!23255 () Bool)

(assert (=> d!38335 (= c!23255 lt!65582)))

(assert (=> d!38335 (= lt!65582 (containsKey!169 (toList!839 lt!65404) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38335 (= (contains!867 lt!65404 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) lt!65584)))

(declare-fun b!126958 () Bool)

(declare-fun lt!65583 () Unit!3922)

(assert (=> b!126958 (= e!82885 lt!65583)))

(assert (=> b!126958 (= lt!65583 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65404) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126958 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126959 () Bool)

(declare-fun Unit!3954 () Unit!3922)

(assert (=> b!126959 (= e!82885 Unit!3954)))

(declare-fun b!126960 () Bool)

(assert (=> b!126960 (= e!82884 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38335 c!23255) b!126958))

(assert (= (and d!38335 (not c!23255)) b!126959))

(assert (= (and d!38335 (not res!61364)) b!126960))

(assert (=> d!38335 m!147085))

(declare-fun m!148139 () Bool)

(assert (=> d!38335 m!148139))

(assert (=> b!126958 m!147085))

(declare-fun m!148141 () Bool)

(assert (=> b!126958 m!148141))

(assert (=> b!126958 m!147085))

(declare-fun m!148143 () Bool)

(assert (=> b!126958 m!148143))

(assert (=> b!126958 m!148143))

(declare-fun m!148145 () Bool)

(assert (=> b!126958 m!148145))

(assert (=> b!126960 m!147085))

(assert (=> b!126960 m!148143))

(assert (=> b!126960 m!148143))

(assert (=> b!126960 m!148145))

(assert (=> b!126668 d!38335))

(assert (=> bm!13614 d!38063))

(declare-fun d!38337 () Bool)

(assert (=> d!38337 (= (get!1445 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126537 d!38337))

(declare-fun b!126964 () Bool)

(declare-fun e!82886 () Bool)

(assert (=> b!126964 (= e!82886 (and (bvsge (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!579 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!126962 () Bool)

(declare-fun res!61367 () Bool)

(assert (=> b!126962 (=> (not res!61367) (not e!82886))))

(assert (=> b!126962 (= res!61367 (bvsge (size!2483 (v!3117 (underlying!435 thiss!992))) (_size!579 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!126961 () Bool)

(declare-fun res!61368 () Bool)

(assert (=> b!126961 (=> (not res!61368) (not e!82886))))

(assert (=> b!126961 (= res!61368 (and (= (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001)) (= (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992))))) (bvsge (_size!579 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!579 (v!3117 (underlying!435 thiss!992))) (bvadd (mask!7037 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!38339 () Bool)

(declare-fun res!61366 () Bool)

(assert (=> d!38339 (=> (not res!61366) (not e!82886))))

(assert (=> d!38339 (= res!61366 (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992)))))))

(assert (=> d!38339 (= (simpleValid!87 (v!3117 (underlying!435 thiss!992))) e!82886)))

(declare-fun b!126963 () Bool)

(declare-fun res!61365 () Bool)

(assert (=> b!126963 (=> (not res!61365) (not e!82886))))

(assert (=> b!126963 (= res!61365 (= (size!2483 (v!3117 (underlying!435 thiss!992))) (bvadd (_size!579 (v!3117 (underlying!435 thiss!992))) (bvsdiv (bvadd (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!38339 res!61366) b!126961))

(assert (= (and b!126961 res!61368) b!126962))

(assert (= (and b!126962 res!61367) b!126963))

(assert (= (and b!126963 res!61365) b!126964))

(declare-fun m!148147 () Bool)

(assert (=> b!126962 m!148147))

(assert (=> d!38339 m!146817))

(assert (=> b!126963 m!148147))

(assert (=> d!38057 d!38339))

(assert (=> d!38159 d!38241))

(declare-fun d!38341 () Bool)

(assert (=> d!38341 (= (apply!111 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65008) (apply!111 lt!65005 lt!65008))))

(assert (=> d!38341 true))

(declare-fun _$34!952 () Unit!3922)

(assert (=> d!38341 (= (choose!769 lt!65005 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65008) _$34!952)))

(declare-fun bs!5253 () Bool)

(assert (= bs!5253 d!38341))

(assert (=> bs!5253 m!146941))

(assert (=> bs!5253 m!146941))

(assert (=> bs!5253 m!146947))

(assert (=> bs!5253 m!146953))

(assert (=> d!38111 d!38341))

(assert (=> d!38111 d!38095))

(assert (=> d!38111 d!38105))

(declare-fun d!38343 () Bool)

(declare-fun e!82887 () Bool)

(assert (=> d!38343 e!82887))

(declare-fun res!61369 () Bool)

(assert (=> d!38343 (=> res!61369 e!82887)))

(declare-fun lt!65588 () Bool)

(assert (=> d!38343 (= res!61369 (not lt!65588))))

(declare-fun lt!65586 () Bool)

(assert (=> d!38343 (= lt!65588 lt!65586)))

(declare-fun lt!65589 () Unit!3922)

(declare-fun e!82888 () Unit!3922)

(assert (=> d!38343 (= lt!65589 e!82888)))

(declare-fun c!23256 () Bool)

(assert (=> d!38343 (= c!23256 lt!65586)))

(assert (=> d!38343 (= lt!65586 (containsKey!169 (toList!839 lt!65005) lt!65008))))

(assert (=> d!38343 (= (contains!867 lt!65005 lt!65008) lt!65588)))

(declare-fun b!126965 () Bool)

(declare-fun lt!65587 () Unit!3922)

(assert (=> b!126965 (= e!82888 lt!65587)))

(assert (=> b!126965 (= lt!65587 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65005) lt!65008))))

(assert (=> b!126965 (isDefined!119 (getValueByKey!165 (toList!839 lt!65005) lt!65008))))

(declare-fun b!126966 () Bool)

(declare-fun Unit!3955 () Unit!3922)

(assert (=> b!126966 (= e!82888 Unit!3955)))

(declare-fun b!126967 () Bool)

(assert (=> b!126967 (= e!82887 (isDefined!119 (getValueByKey!165 (toList!839 lt!65005) lt!65008)))))

(assert (= (and d!38343 c!23256) b!126965))

(assert (= (and d!38343 (not c!23256)) b!126966))

(assert (= (and d!38343 (not res!61369)) b!126967))

(declare-fun m!148149 () Bool)

(assert (=> d!38343 m!148149))

(declare-fun m!148151 () Bool)

(assert (=> b!126965 m!148151))

(assert (=> b!126965 m!147199))

(assert (=> b!126965 m!147199))

(declare-fun m!148153 () Bool)

(assert (=> b!126965 m!148153))

(assert (=> b!126967 m!147199))

(assert (=> b!126967 m!147199))

(assert (=> b!126967 m!148153))

(assert (=> d!38111 d!38343))

(assert (=> d!38111 d!38093))

(declare-fun d!38345 () Bool)

(declare-fun res!61370 () Bool)

(declare-fun e!82889 () Bool)

(assert (=> d!38345 (=> res!61370 e!82889)))

(assert (=> d!38345 (= res!61370 (and ((_ is Cons!1688) (toList!839 call!13571)) (= (_1!1282 (h!2290 (toList!839 call!13571))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38345 (= (containsKey!169 (toList!839 call!13571) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!82889)))

(declare-fun b!126968 () Bool)

(declare-fun e!82890 () Bool)

(assert (=> b!126968 (= e!82889 e!82890)))

(declare-fun res!61371 () Bool)

(assert (=> b!126968 (=> (not res!61371) (not e!82890))))

(assert (=> b!126968 (= res!61371 (and (or (not ((_ is Cons!1688) (toList!839 call!13571))) (bvsle (_1!1282 (h!2290 (toList!839 call!13571))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) ((_ is Cons!1688) (toList!839 call!13571)) (bvslt (_1!1282 (h!2290 (toList!839 call!13571))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(declare-fun b!126969 () Bool)

(assert (=> b!126969 (= e!82890 (containsKey!169 (t!6030 (toList!839 call!13571)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38345 (not res!61370)) b!126968))

(assert (= (and b!126968 res!61371) b!126969))

(assert (=> b!126969 m!146811))

(declare-fun m!148155 () Bool)

(assert (=> b!126969 m!148155))

(assert (=> d!38157 d!38345))

(declare-fun d!38347 () Bool)

(assert (=> d!38347 (= (isDefined!119 (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))) (not (isEmpty!400 (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))))

(declare-fun bs!5254 () Bool)

(assert (= bs!5254 d!38347))

(assert (=> bs!5254 m!147331))

(declare-fun m!148157 () Bool)

(assert (=> bs!5254 m!148157))

(assert (=> b!126529 d!38347))

(declare-fun b!126970 () Bool)

(declare-fun e!82891 () Option!171)

(assert (=> b!126970 (= e!82891 (Some!170 (_2!1282 (h!2290 (toList!839 call!13567)))))))

(declare-fun e!82892 () Option!171)

(declare-fun b!126972 () Bool)

(assert (=> b!126972 (= e!82892 (getValueByKey!165 (t!6030 (toList!839 call!13567)) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(declare-fun c!23257 () Bool)

(declare-fun d!38349 () Bool)

(assert (=> d!38349 (= c!23257 (and ((_ is Cons!1688) (toList!839 call!13567)) (= (_1!1282 (h!2290 (toList!839 call!13567))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))))

(assert (=> d!38349 (= (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))) e!82891)))

(declare-fun b!126973 () Bool)

(assert (=> b!126973 (= e!82892 None!169)))

(declare-fun b!126971 () Bool)

(assert (=> b!126971 (= e!82891 e!82892)))

(declare-fun c!23258 () Bool)

(assert (=> b!126971 (= c!23258 (and ((_ is Cons!1688) (toList!839 call!13567)) (not (= (_1!1282 (h!2290 (toList!839 call!13567))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))))

(assert (= (and d!38349 c!23257) b!126970))

(assert (= (and d!38349 (not c!23257)) b!126971))

(assert (= (and b!126971 c!23258) b!126972))

(assert (= (and b!126971 (not c!23258)) b!126973))

(assert (=> b!126972 m!147013))

(declare-fun m!148159 () Bool)

(assert (=> b!126972 m!148159))

(assert (=> b!126529 d!38349))

(declare-fun d!38351 () Bool)

(assert (=> d!38351 (= (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65015)) (v!3122 (getValueByKey!165 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65015)))))

(assert (=> d!38089 d!38351))

(declare-fun b!126974 () Bool)

(declare-fun e!82893 () Option!171)

(assert (=> b!126974 (= e!82893 (Some!170 (_2!1282 (h!2290 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(declare-fun b!126976 () Bool)

(declare-fun e!82894 () Option!171)

(assert (=> b!126976 (= e!82894 (getValueByKey!165 (t!6030 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65015))))

(declare-fun d!38353 () Bool)

(declare-fun c!23259 () Bool)

(assert (=> d!38353 (= c!23259 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65015)))))

(assert (=> d!38353 (= (getValueByKey!165 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65015) e!82893)))

(declare-fun b!126977 () Bool)

(assert (=> b!126977 (= e!82894 None!169)))

(declare-fun b!126975 () Bool)

(assert (=> b!126975 (= e!82893 e!82894)))

(declare-fun c!23260 () Bool)

(assert (=> b!126975 (= c!23260 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (not (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65020 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65015))))))

(assert (= (and d!38353 c!23259) b!126974))

(assert (= (and d!38353 (not c!23259)) b!126975))

(assert (= (and b!126975 c!23260) b!126976))

(assert (= (and b!126975 (not c!23260)) b!126977))

(declare-fun m!148161 () Bool)

(assert (=> b!126976 m!148161))

(assert (=> d!38089 d!38353))

(declare-fun b!126978 () Bool)

(declare-fun e!82896 () Bool)

(assert (=> b!126978 (= e!82896 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126978 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126979 () Bool)

(declare-fun e!82898 () Bool)

(declare-fun e!82900 () Bool)

(assert (=> b!126979 (= e!82898 e!82900)))

(declare-fun c!23262 () Bool)

(assert (=> b!126979 (= c!23262 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126980 () Bool)

(declare-fun res!61373 () Bool)

(declare-fun e!82895 () Bool)

(assert (=> b!126980 (=> (not res!61373) (not e!82895))))

(declare-fun lt!65594 () ListLongMap!1647)

(assert (=> b!126980 (= res!61373 (not (contains!867 lt!65594 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126981 () Bool)

(assert (=> b!126981 (= e!82900 (isEmpty!401 lt!65594))))

(declare-fun b!126982 () Bool)

(declare-fun e!82899 () ListLongMap!1647)

(assert (=> b!126982 (= e!82899 (ListLongMap!1648 Nil!1689))))

(declare-fun b!126983 () Bool)

(declare-fun e!82901 () ListLongMap!1647)

(declare-fun call!13673 () ListLongMap!1647)

(assert (=> b!126983 (= e!82901 call!13673)))

(declare-fun b!126984 () Bool)

(declare-fun e!82897 () Bool)

(assert (=> b!126984 (= e!82898 e!82897)))

(assert (=> b!126984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61375 () Bool)

(assert (=> b!126984 (= res!61375 (contains!867 lt!65594 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126984 (=> (not res!61375) (not e!82897))))

(declare-fun b!126985 () Bool)

(declare-fun lt!65590 () Unit!3922)

(declare-fun lt!65592 () Unit!3922)

(assert (=> b!126985 (= lt!65590 lt!65592)))

(declare-fun lt!65591 () ListLongMap!1647)

(declare-fun lt!65595 () (_ BitVec 64))

(declare-fun lt!65596 () V!3433)

(declare-fun lt!65593 () (_ BitVec 64))

(assert (=> b!126985 (not (contains!867 (+!158 lt!65591 (tuple2!2543 lt!65593 lt!65596)) lt!65595))))

(assert (=> b!126985 (= lt!65592 (addStillNotContains!57 lt!65591 lt!65593 lt!65596 lt!65595))))

(assert (=> b!126985 (= lt!65595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126985 (= lt!65596 (get!1442 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126985 (= lt!65593 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126985 (= lt!65591 call!13673)))

(assert (=> b!126985 (= e!82901 (+!158 call!13673 (tuple2!2543 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (get!1442 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38355 () Bool)

(assert (=> d!38355 e!82895))

(declare-fun res!61374 () Bool)

(assert (=> d!38355 (=> (not res!61374) (not e!82895))))

(assert (=> d!38355 (= res!61374 (not (contains!867 lt!65594 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38355 (= lt!65594 e!82899)))

(declare-fun c!23264 () Bool)

(assert (=> d!38355 (= c!23264 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38355 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38355 (= (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65594)))

(declare-fun b!126986 () Bool)

(assert (=> b!126986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> b!126986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098))))))

(assert (=> b!126986 (= e!82897 (= (apply!111 lt!65594 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126987 () Bool)

(assert (=> b!126987 (= e!82900 (= lt!65594 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13670 () Bool)

(assert (=> bm!13670 (= call!13673 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098) (mask!7037 newMap!16) (ite c!23087 (ite c!23089 (extraKeys!2563 newMap!16) lt!65095) (extraKeys!2563 newMap!16)) (zeroValue!2645 newMap!16) (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126988 () Bool)

(assert (=> b!126988 (= e!82895 e!82898)))

(declare-fun c!23261 () Bool)

(assert (=> b!126988 (= c!23261 e!82896)))

(declare-fun res!61372 () Bool)

(assert (=> b!126988 (=> (not res!61372) (not e!82896))))

(assert (=> b!126988 (= res!61372 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!126989 () Bool)

(assert (=> b!126989 (= e!82899 e!82901)))

(declare-fun c!23263 () Bool)

(assert (=> b!126989 (= c!23263 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38355 c!23264) b!126982))

(assert (= (and d!38355 (not c!23264)) b!126989))

(assert (= (and b!126989 c!23263) b!126985))

(assert (= (and b!126989 (not c!23263)) b!126983))

(assert (= (or b!126985 b!126983) bm!13670))

(assert (= (and d!38355 res!61374) b!126980))

(assert (= (and b!126980 res!61373) b!126988))

(assert (= (and b!126988 res!61372) b!126978))

(assert (= (and b!126988 c!23261) b!126984))

(assert (= (and b!126988 (not c!23261)) b!126979))

(assert (= (and b!126984 res!61375) b!126986))

(assert (= (and b!126979 c!23262) b!126987))

(assert (= (and b!126979 (not c!23262)) b!126981))

(declare-fun b_lambda!5589 () Bool)

(assert (=> (not b_lambda!5589) (not b!126985)))

(assert (=> b!126985 t!6042))

(declare-fun b_and!7809 () Bool)

(assert (= b_and!7805 (and (=> t!6042 result!3843) b_and!7809)))

(assert (=> b!126985 t!6044))

(declare-fun b_and!7811 () Bool)

(assert (= b_and!7807 (and (=> t!6044 result!3845) b_and!7811)))

(declare-fun b_lambda!5591 () Bool)

(assert (=> (not b_lambda!5591) (not b!126986)))

(assert (=> b!126986 t!6042))

(declare-fun b_and!7813 () Bool)

(assert (= b_and!7809 (and (=> t!6042 result!3843) b_and!7813)))

(assert (=> b!126986 t!6044))

(declare-fun b_and!7815 () Bool)

(assert (= b_and!7811 (and (=> t!6044 result!3845) b_and!7815)))

(declare-fun m!148163 () Bool)

(assert (=> b!126980 m!148163))

(assert (=> b!126989 m!147085))

(assert (=> b!126989 m!147085))

(assert (=> b!126989 m!147087))

(declare-fun m!148165 () Bool)

(assert (=> b!126987 m!148165))

(assert (=> b!126984 m!147085))

(assert (=> b!126984 m!147085))

(declare-fun m!148167 () Bool)

(assert (=> b!126984 m!148167))

(declare-fun m!148169 () Bool)

(assert (=> b!126981 m!148169))

(assert (=> b!126986 m!147085))

(assert (=> b!126986 m!147313))

(assert (=> b!126986 m!147085))

(declare-fun m!148171 () Bool)

(assert (=> b!126986 m!148171))

(assert (=> b!126986 m!147461))

(assert (=> b!126986 m!147461))

(assert (=> b!126986 m!147313))

(assert (=> b!126986 m!147463))

(assert (=> b!126978 m!147085))

(assert (=> b!126978 m!147085))

(assert (=> b!126978 m!147087))

(assert (=> bm!13670 m!148165))

(declare-fun m!148173 () Bool)

(assert (=> d!38355 m!148173))

(assert (=> d!38355 m!147061))

(assert (=> b!126985 m!147085))

(declare-fun m!148175 () Bool)

(assert (=> b!126985 m!148175))

(declare-fun m!148177 () Bool)

(assert (=> b!126985 m!148177))

(assert (=> b!126985 m!147313))

(assert (=> b!126985 m!147461))

(declare-fun m!148179 () Bool)

(assert (=> b!126985 m!148179))

(assert (=> b!126985 m!148175))

(declare-fun m!148181 () Bool)

(assert (=> b!126985 m!148181))

(assert (=> b!126985 m!147461))

(assert (=> b!126985 m!147313))

(assert (=> b!126985 m!147463))

(assert (=> bm!13620 d!38355))

(declare-fun d!38357 () Bool)

(assert (=> d!38357 (= (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65013)) (v!3122 (getValueByKey!165 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65013)))))

(assert (=> d!38101 d!38357))

(declare-fun b!126990 () Bool)

(declare-fun e!82902 () Option!171)

(assert (=> b!126990 (= e!82902 (Some!170 (_2!1282 (h!2290 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(declare-fun b!126992 () Bool)

(declare-fun e!82903 () Option!171)

(assert (=> b!126992 (= e!82903 (getValueByKey!165 (t!6030 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65013))))

(declare-fun d!38359 () Bool)

(declare-fun c!23265 () Bool)

(assert (=> d!38359 (= c!23265 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65013)))))

(assert (=> d!38359 (= (getValueByKey!165 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65013) e!82902)))

(declare-fun b!126993 () Bool)

(assert (=> b!126993 (= e!82903 None!169)))

(declare-fun b!126991 () Bool)

(assert (=> b!126991 (= e!82902 e!82903)))

(declare-fun c!23266 () Bool)

(assert (=> b!126991 (= c!23266 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (not (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65021 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65013))))))

(assert (= (and d!38359 c!23265) b!126990))

(assert (= (and d!38359 (not c!23265)) b!126991))

(assert (= (and b!126991 c!23266) b!126992))

(assert (= (and b!126991 (not c!23266)) b!126993))

(declare-fun m!148183 () Bool)

(assert (=> b!126992 m!148183))

(assert (=> d!38101 d!38359))

(declare-fun d!38361 () Bool)

(declare-fun isEmpty!402 (List!1692) Bool)

(assert (=> d!38361 (= (isEmpty!401 lt!65203) (isEmpty!402 (toList!839 lt!65203)))))

(declare-fun bs!5255 () Bool)

(assert (= bs!5255 d!38361))

(declare-fun m!148185 () Bool)

(assert (=> bs!5255 m!148185))

(assert (=> b!126476 d!38361))

(declare-fun b!126994 () Bool)

(declare-fun e!82906 () Bool)

(declare-fun e!82905 () Bool)

(assert (=> b!126994 (= e!82906 e!82905)))

(declare-fun res!61377 () Bool)

(assert (=> b!126994 (=> (not res!61377) (not e!82905))))

(declare-fun e!82904 () Bool)

(assert (=> b!126994 (= res!61377 (not e!82904))))

(declare-fun res!61378 () Bool)

(assert (=> b!126994 (=> (not res!61378) (not e!82904))))

(assert (=> b!126994 (= res!61378 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!126996 () Bool)

(declare-fun e!82907 () Bool)

(declare-fun call!13674 () Bool)

(assert (=> b!126996 (= e!82907 call!13674)))

(declare-fun b!126997 () Bool)

(assert (=> b!126997 (= e!82904 (contains!870 (ite c!23122 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) Nil!1691) Nil!1691) (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38363 () Bool)

(declare-fun res!61376 () Bool)

(assert (=> d!38363 (=> res!61376 e!82906)))

(assert (=> d!38363 (= res!61376 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38363 (= (arrayNoDuplicates!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23122 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) Nil!1691) Nil!1691)) e!82906)))

(declare-fun b!126995 () Bool)

(assert (=> b!126995 (= e!82907 call!13674)))

(declare-fun b!126998 () Bool)

(assert (=> b!126998 (= e!82905 e!82907)))

(declare-fun c!23267 () Bool)

(assert (=> b!126998 (= c!23267 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13671 () Bool)

(assert (=> bm!13671 (= call!13674 (arrayNoDuplicates!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23267 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23122 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) Nil!1691) Nil!1691)) (ite c!23122 (Cons!1690 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) Nil!1691) Nil!1691))))))

(assert (= (and d!38363 (not res!61376)) b!126994))

(assert (= (and b!126994 res!61378) b!126997))

(assert (= (and b!126994 res!61377) b!126998))

(assert (= (and b!126998 c!23267) b!126995))

(assert (= (and b!126998 (not c!23267)) b!126996))

(assert (= (or b!126995 b!126996) bm!13671))

(assert (=> b!126994 m!147903))

(assert (=> b!126994 m!147903))

(declare-fun m!148187 () Bool)

(assert (=> b!126994 m!148187))

(assert (=> b!126997 m!147903))

(assert (=> b!126997 m!147903))

(declare-fun m!148189 () Bool)

(assert (=> b!126997 m!148189))

(assert (=> b!126998 m!147903))

(assert (=> b!126998 m!147903))

(assert (=> b!126998 m!148187))

(assert (=> bm!13671 m!147903))

(declare-fun m!148191 () Bool)

(assert (=> bm!13671 m!148191))

(assert (=> bm!13595 d!38363))

(declare-fun d!38365 () Bool)

(assert (=> d!38365 (= (apply!111 lt!65404 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5256 () Bool)

(assert (= bs!5256 d!38365))

(assert (=> bs!5256 m!148007))

(assert (=> bs!5256 m!148007))

(declare-fun m!148193 () Bool)

(assert (=> bs!5256 m!148193))

(assert (=> b!126663 d!38365))

(declare-fun d!38367 () Bool)

(declare-fun res!61379 () Bool)

(declare-fun e!82908 () Bool)

(assert (=> d!38367 (=> res!61379 e!82908)))

(assert (=> d!38367 (= res!61379 (and ((_ is Cons!1688) (toList!839 lt!65010)) (= (_1!1282 (h!2290 (toList!839 lt!65010))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38367 (= (containsKey!169 (toList!839 lt!65010) #b1000000000000000000000000000000000000000000000000000000000000000) e!82908)))

(declare-fun b!126999 () Bool)

(declare-fun e!82909 () Bool)

(assert (=> b!126999 (= e!82908 e!82909)))

(declare-fun res!61380 () Bool)

(assert (=> b!126999 (=> (not res!61380) (not e!82909))))

(assert (=> b!126999 (= res!61380 (and (or (not ((_ is Cons!1688) (toList!839 lt!65010))) (bvsle (_1!1282 (h!2290 (toList!839 lt!65010))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1688) (toList!839 lt!65010)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65010))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127000 () Bool)

(assert (=> b!127000 (= e!82909 (containsKey!169 (t!6030 (toList!839 lt!65010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38367 (not res!61379)) b!126999))

(assert (= (and b!126999 res!61380) b!127000))

(declare-fun m!148195 () Bool)

(assert (=> b!127000 m!148195))

(assert (=> d!38059 d!38367))

(assert (=> b!126503 d!38265))

(assert (=> b!126395 d!38153))

(declare-fun d!38369 () Bool)

(declare-fun e!82910 () Bool)

(assert (=> d!38369 e!82910))

(declare-fun res!61381 () Bool)

(assert (=> d!38369 (=> (not res!61381) (not e!82910))))

(declare-fun lt!65599 () ListLongMap!1647)

(assert (=> d!38369 (= res!61381 (contains!867 lt!65599 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65597 () List!1692)

(assert (=> d!38369 (= lt!65599 (ListLongMap!1648 lt!65597))))

(declare-fun lt!65600 () Unit!3922)

(declare-fun lt!65598 () Unit!3922)

(assert (=> d!38369 (= lt!65600 lt!65598)))

(assert (=> d!38369 (= (getValueByKey!165 lt!65597 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38369 (= lt!65598 (lemmaContainsTupThenGetReturnValue!83 lt!65597 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38369 (= lt!65597 (insertStrictlySorted!86 (toList!839 call!13625) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38369 (= (+!158 call!13625 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65599)))

(declare-fun b!127001 () Bool)

(declare-fun res!61382 () Bool)

(assert (=> b!127001 (=> (not res!61382) (not e!82910))))

(assert (=> b!127001 (= res!61382 (= (getValueByKey!165 (toList!839 lt!65599) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127002 () Bool)

(assert (=> b!127002 (= e!82910 (contains!869 (toList!839 lt!65599) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38369 res!61381) b!127001))

(assert (= (and b!127001 res!61382) b!127002))

(declare-fun m!148197 () Bool)

(assert (=> d!38369 m!148197))

(declare-fun m!148199 () Bool)

(assert (=> d!38369 m!148199))

(declare-fun m!148201 () Bool)

(assert (=> d!38369 m!148201))

(declare-fun m!148203 () Bool)

(assert (=> d!38369 m!148203))

(declare-fun m!148205 () Bool)

(assert (=> b!127001 m!148205))

(declare-fun m!148207 () Bool)

(assert (=> b!127002 m!148207))

(assert (=> b!126614 d!38369))

(declare-fun b!127003 () Bool)

(declare-fun e!82911 () Option!171)

(assert (=> b!127003 (= e!82911 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65175)))))))

(declare-fun b!127005 () Bool)

(declare-fun e!82912 () Option!171)

(assert (=> b!127005 (= e!82912 (getValueByKey!165 (t!6030 (toList!839 lt!65175)) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38371 () Bool)

(declare-fun c!23268 () Bool)

(assert (=> d!38371 (= c!23268 (and ((_ is Cons!1688) (toList!839 lt!65175)) (= (_1!1282 (h!2290 (toList!839 lt!65175))) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38371 (= (getValueByKey!165 (toList!839 lt!65175) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82911)))

(declare-fun b!127006 () Bool)

(assert (=> b!127006 (= e!82912 None!169)))

(declare-fun b!127004 () Bool)

(assert (=> b!127004 (= e!82911 e!82912)))

(declare-fun c!23269 () Bool)

(assert (=> b!127004 (= c!23269 (and ((_ is Cons!1688) (toList!839 lt!65175)) (not (= (_1!1282 (h!2290 (toList!839 lt!65175))) (_1!1282 (tuple2!2543 lt!65014 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38371 c!23268) b!127003))

(assert (= (and d!38371 (not c!23268)) b!127004))

(assert (= (and b!127004 c!23269) b!127005))

(assert (= (and b!127004 (not c!23269)) b!127006))

(declare-fun m!148209 () Bool)

(assert (=> b!127005 m!148209))

(assert (=> b!126442 d!38371))

(assert (=> b!126661 d!38207))

(assert (=> b!126661 d!38209))

(declare-fun d!38373 () Bool)

(declare-fun e!82913 () Bool)

(assert (=> d!38373 e!82913))

(declare-fun res!61383 () Bool)

(assert (=> d!38373 (=> res!61383 e!82913)))

(declare-fun lt!65603 () Bool)

(assert (=> d!38373 (= res!61383 (not lt!65603))))

(declare-fun lt!65601 () Bool)

(assert (=> d!38373 (= lt!65603 lt!65601)))

(declare-fun lt!65604 () Unit!3922)

(declare-fun e!82914 () Unit!3922)

(assert (=> d!38373 (= lt!65604 e!82914)))

(declare-fun c!23270 () Bool)

(assert (=> d!38373 (= c!23270 lt!65601)))

(assert (=> d!38373 (= lt!65601 (containsKey!169 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (=> d!38373 (= (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))) lt!65603)))

(declare-fun b!127007 () Bool)

(declare-fun lt!65602 () Unit!3922)

(assert (=> b!127007 (= e!82914 lt!65602)))

(assert (=> b!127007 (= lt!65602 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (=> b!127007 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(declare-fun b!127008 () Bool)

(declare-fun Unit!3956 () Unit!3922)

(assert (=> b!127008 (= e!82914 Unit!3956)))

(declare-fun b!127009 () Bool)

(assert (=> b!127009 (= e!82913 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))))

(assert (= (and d!38373 c!23270) b!127007))

(assert (= (and d!38373 (not c!23270)) b!127008))

(assert (= (and d!38373 (not res!61383)) b!127009))

(assert (=> d!38373 m!147013))

(declare-fun m!148211 () Bool)

(assert (=> d!38373 m!148211))

(assert (=> b!127007 m!147013))

(declare-fun m!148213 () Bool)

(assert (=> b!127007 m!148213))

(assert (=> b!127007 m!147013))

(declare-fun m!148215 () Bool)

(assert (=> b!127007 m!148215))

(assert (=> b!127007 m!148215))

(declare-fun m!148217 () Bool)

(assert (=> b!127007 m!148217))

(assert (=> b!127009 m!147013))

(assert (=> b!127009 m!148215))

(assert (=> b!127009 m!148215))

(assert (=> b!127009 m!148217))

(assert (=> b!126532 d!38373))

(declare-fun b!127010 () Bool)

(declare-fun e!82921 () ListLongMap!1647)

(declare-fun call!13677 () ListLongMap!1647)

(assert (=> b!127010 (= e!82921 call!13677)))

(declare-fun b!127011 () Bool)

(declare-fun e!82916 () Bool)

(declare-fun lt!65612 () ListLongMap!1647)

(assert (=> b!127011 (= e!82916 (= (apply!111 lt!65612 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127012 () Bool)

(declare-fun e!82923 () Bool)

(assert (=> b!127012 (= e!82923 (= (apply!111 lt!65612 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127013 () Bool)

(declare-fun e!82927 () ListLongMap!1647)

(declare-fun e!82926 () ListLongMap!1647)

(assert (=> b!127013 (= e!82927 e!82926)))

(declare-fun c!23272 () Bool)

(assert (=> b!127013 (= c!23272 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13672 () Bool)

(declare-fun call!13679 () ListLongMap!1647)

(assert (=> bm!13672 (= call!13677 call!13679)))

(declare-fun b!127014 () Bool)

(declare-fun res!61384 () Bool)

(declare-fun e!82919 () Bool)

(assert (=> b!127014 (=> (not res!61384) (not e!82919))))

(declare-fun e!82917 () Bool)

(assert (=> b!127014 (= res!61384 e!82917)))

(declare-fun res!61388 () Bool)

(assert (=> b!127014 (=> res!61388 e!82917)))

(declare-fun e!82924 () Bool)

(assert (=> b!127014 (= res!61388 (not e!82924))))

(declare-fun res!61390 () Bool)

(assert (=> b!127014 (=> (not res!61390) (not e!82924))))

(assert (=> b!127014 (= res!61390 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13673 () Bool)

(declare-fun call!13675 () ListLongMap!1647)

(declare-fun call!13680 () ListLongMap!1647)

(assert (=> bm!13673 (= call!13675 call!13680)))

(declare-fun b!127015 () Bool)

(declare-fun e!82918 () Bool)

(assert (=> b!127015 (= e!82918 e!82916)))

(declare-fun res!61389 () Bool)

(declare-fun call!13678 () Bool)

(assert (=> b!127015 (= res!61389 call!13678)))

(assert (=> b!127015 (=> (not res!61389) (not e!82916))))

(declare-fun bm!13674 () Bool)

(assert (=> bm!13674 (= call!13680 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!127016 () Bool)

(declare-fun e!82915 () Bool)

(assert (=> b!127016 (= e!82917 e!82915)))

(declare-fun res!61387 () Bool)

(assert (=> b!127016 (=> (not res!61387) (not e!82915))))

(assert (=> b!127016 (= res!61387 (contains!867 lt!65612 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127017 () Bool)

(declare-fun e!82920 () Unit!3922)

(declare-fun Unit!3957 () Unit!3922)

(assert (=> b!127017 (= e!82920 Unit!3957)))

(declare-fun bm!13675 () Bool)

(declare-fun call!13681 () Bool)

(assert (=> bm!13675 (= call!13681 (contains!867 lt!65612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127018 () Bool)

(declare-fun e!82925 () Bool)

(assert (=> b!127018 (= e!82925 e!82923)))

(declare-fun res!61385 () Bool)

(assert (=> b!127018 (= res!61385 call!13681)))

(assert (=> b!127018 (=> (not res!61385) (not e!82923))))

(declare-fun b!127019 () Bool)

(declare-fun c!23275 () Bool)

(assert (=> b!127019 (= c!23275 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127019 (= e!82926 e!82921)))

(declare-fun b!127020 () Bool)

(declare-fun e!82922 () Bool)

(assert (=> b!127020 (= e!82922 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38375 () Bool)

(assert (=> d!38375 e!82919))

(declare-fun res!61391 () Bool)

(assert (=> d!38375 (=> (not res!61391) (not e!82919))))

(assert (=> d!38375 (= res!61391 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65609 () ListLongMap!1647)

(assert (=> d!38375 (= lt!65612 lt!65609)))

(declare-fun lt!65619 () Unit!3922)

(assert (=> d!38375 (= lt!65619 e!82920)))

(declare-fun c!23273 () Bool)

(assert (=> d!38375 (= c!23273 e!82922)))

(declare-fun res!61392 () Bool)

(assert (=> d!38375 (=> (not res!61392) (not e!82922))))

(assert (=> d!38375 (= res!61392 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38375 (= lt!65609 e!82927)))

(declare-fun c!23274 () Bool)

(assert (=> d!38375 (= c!23274 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38375 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38375 (= (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65612)))

(declare-fun b!127021 () Bool)

(assert (=> b!127021 (= e!82915 (= (apply!111 lt!65612 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 lt!65098) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127021 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 lt!65098)))))

(assert (=> b!127021 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127022 () Bool)

(assert (=> b!127022 (= e!82924 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127023 () Bool)

(assert (=> b!127023 (= e!82926 call!13677)))

(declare-fun b!127024 () Bool)

(declare-fun lt!65613 () Unit!3922)

(assert (=> b!127024 (= e!82920 lt!65613)))

(declare-fun lt!65608 () ListLongMap!1647)

(assert (=> b!127024 (= lt!65608 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65621 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65618 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65618 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65626 () Unit!3922)

(assert (=> b!127024 (= lt!65626 (addStillContains!87 lt!65608 lt!65621 (zeroValue!2645 newMap!16) lt!65618))))

(assert (=> b!127024 (contains!867 (+!158 lt!65608 (tuple2!2543 lt!65621 (zeroValue!2645 newMap!16))) lt!65618)))

(declare-fun lt!65625 () Unit!3922)

(assert (=> b!127024 (= lt!65625 lt!65626)))

(declare-fun lt!65623 () ListLongMap!1647)

(assert (=> b!127024 (= lt!65623 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65616 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65616 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65615 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65615 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65620 () Unit!3922)

(assert (=> b!127024 (= lt!65620 (addApplyDifferent!87 lt!65623 lt!65616 (minValue!2645 newMap!16) lt!65615))))

(assert (=> b!127024 (= (apply!111 (+!158 lt!65623 (tuple2!2543 lt!65616 (minValue!2645 newMap!16))) lt!65615) (apply!111 lt!65623 lt!65615))))

(declare-fun lt!65614 () Unit!3922)

(assert (=> b!127024 (= lt!65614 lt!65620)))

(declare-fun lt!65607 () ListLongMap!1647)

(assert (=> b!127024 (= lt!65607 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65605 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65610 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65610 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65611 () Unit!3922)

(assert (=> b!127024 (= lt!65611 (addApplyDifferent!87 lt!65607 lt!65605 (zeroValue!2645 newMap!16) lt!65610))))

(assert (=> b!127024 (= (apply!111 (+!158 lt!65607 (tuple2!2543 lt!65605 (zeroValue!2645 newMap!16))) lt!65610) (apply!111 lt!65607 lt!65610))))

(declare-fun lt!65624 () Unit!3922)

(assert (=> b!127024 (= lt!65624 lt!65611)))

(declare-fun lt!65622 () ListLongMap!1647)

(assert (=> b!127024 (= lt!65622 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65606 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65617 () (_ BitVec 64))

(assert (=> b!127024 (= lt!65617 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127024 (= lt!65613 (addApplyDifferent!87 lt!65622 lt!65606 (minValue!2645 newMap!16) lt!65617))))

(assert (=> b!127024 (= (apply!111 (+!158 lt!65622 (tuple2!2543 lt!65606 (minValue!2645 newMap!16))) lt!65617) (apply!111 lt!65622 lt!65617))))

(declare-fun call!13676 () ListLongMap!1647)

(declare-fun bm!13676 () Bool)

(assert (=> bm!13676 (= call!13679 (+!158 (ite c!23274 call!13680 (ite c!23272 call!13675 call!13676)) (ite (or c!23274 c!23272) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!127025 () Bool)

(assert (=> b!127025 (= e!82921 call!13676)))

(declare-fun b!127026 () Bool)

(assert (=> b!127026 (= e!82927 (+!158 call!13679 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13677 () Bool)

(assert (=> bm!13677 (= call!13676 call!13675)))

(declare-fun bm!13678 () Bool)

(assert (=> bm!13678 (= call!13678 (contains!867 lt!65612 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127027 () Bool)

(assert (=> b!127027 (= e!82925 (not call!13681))))

(declare-fun b!127028 () Bool)

(assert (=> b!127028 (= e!82919 e!82918)))

(declare-fun c!23276 () Bool)

(assert (=> b!127028 (= c!23276 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127029 () Bool)

(assert (=> b!127029 (= e!82918 (not call!13678))))

(declare-fun b!127030 () Bool)

(declare-fun res!61386 () Bool)

(assert (=> b!127030 (=> (not res!61386) (not e!82919))))

(assert (=> b!127030 (= res!61386 e!82925)))

(declare-fun c!23271 () Bool)

(assert (=> b!127030 (= c!23271 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38375 c!23274) b!127026))

(assert (= (and d!38375 (not c!23274)) b!127013))

(assert (= (and b!127013 c!23272) b!127023))

(assert (= (and b!127013 (not c!23272)) b!127019))

(assert (= (and b!127019 c!23275) b!127010))

(assert (= (and b!127019 (not c!23275)) b!127025))

(assert (= (or b!127010 b!127025) bm!13677))

(assert (= (or b!127023 bm!13677) bm!13673))

(assert (= (or b!127023 b!127010) bm!13672))

(assert (= (or b!127026 bm!13673) bm!13674))

(assert (= (or b!127026 bm!13672) bm!13676))

(assert (= (and d!38375 res!61392) b!127020))

(assert (= (and d!38375 c!23273) b!127024))

(assert (= (and d!38375 (not c!23273)) b!127017))

(assert (= (and d!38375 res!61391) b!127014))

(assert (= (and b!127014 res!61390) b!127022))

(assert (= (and b!127014 (not res!61388)) b!127016))

(assert (= (and b!127016 res!61387) b!127021))

(assert (= (and b!127014 res!61384) b!127030))

(assert (= (and b!127030 c!23271) b!127018))

(assert (= (and b!127030 (not c!23271)) b!127027))

(assert (= (and b!127018 res!61385) b!127012))

(assert (= (or b!127018 b!127027) bm!13675))

(assert (= (and b!127030 res!61386) b!127028))

(assert (= (and b!127028 c!23276) b!127015))

(assert (= (and b!127028 (not c!23276)) b!127029))

(assert (= (and b!127015 res!61389) b!127011))

(assert (= (or b!127015 b!127029) bm!13678))

(declare-fun b_lambda!5593 () Bool)

(assert (=> (not b_lambda!5593) (not b!127021)))

(assert (=> b!127021 t!6042))

(declare-fun b_and!7817 () Bool)

(assert (= b_and!7813 (and (=> t!6042 result!3843) b_and!7817)))

(assert (=> b!127021 t!6044))

(declare-fun b_and!7819 () Bool)

(assert (= b_and!7815 (and (=> t!6044 result!3845) b_and!7819)))

(declare-fun m!148219 () Bool)

(assert (=> b!127024 m!148219))

(declare-fun m!148221 () Bool)

(assert (=> b!127024 m!148221))

(declare-fun m!148223 () Bool)

(assert (=> b!127024 m!148223))

(declare-fun m!148225 () Bool)

(assert (=> b!127024 m!148225))

(declare-fun m!148227 () Bool)

(assert (=> b!127024 m!148227))

(declare-fun m!148229 () Bool)

(assert (=> b!127024 m!148229))

(declare-fun m!148231 () Bool)

(assert (=> b!127024 m!148231))

(declare-fun m!148233 () Bool)

(assert (=> b!127024 m!148233))

(declare-fun m!148235 () Bool)

(assert (=> b!127024 m!148235))

(declare-fun m!148237 () Bool)

(assert (=> b!127024 m!148237))

(assert (=> b!127024 m!148229))

(declare-fun m!148239 () Bool)

(assert (=> b!127024 m!148239))

(assert (=> b!127024 m!148235))

(declare-fun m!148241 () Bool)

(assert (=> b!127024 m!148241))

(declare-fun m!148243 () Bool)

(assert (=> b!127024 m!148243))

(declare-fun m!148245 () Bool)

(assert (=> b!127024 m!148245))

(assert (=> b!127024 m!148223))

(declare-fun m!148247 () Bool)

(assert (=> b!127024 m!148247))

(assert (=> b!127024 m!148227))

(declare-fun m!148249 () Bool)

(assert (=> b!127024 m!148249))

(assert (=> b!127024 m!147085))

(assert (=> b!127022 m!147085))

(assert (=> b!127022 m!147085))

(assert (=> b!127022 m!147087))

(declare-fun m!148251 () Bool)

(assert (=> bm!13676 m!148251))

(declare-fun m!148253 () Bool)

(assert (=> b!127012 m!148253))

(assert (=> b!127021 m!147085))

(declare-fun m!148255 () Bool)

(assert (=> b!127021 m!148255))

(assert (=> b!127021 m!147085))

(declare-fun m!148257 () Bool)

(assert (=> b!127021 m!148257))

(assert (=> b!127021 m!148257))

(assert (=> b!127021 m!147313))

(declare-fun m!148259 () Bool)

(assert (=> b!127021 m!148259))

(assert (=> b!127021 m!147313))

(declare-fun m!148261 () Bool)

(assert (=> b!127011 m!148261))

(assert (=> bm!13674 m!148233))

(assert (=> b!127016 m!147085))

(assert (=> b!127016 m!147085))

(declare-fun m!148263 () Bool)

(assert (=> b!127016 m!148263))

(declare-fun m!148265 () Bool)

(assert (=> bm!13675 m!148265))

(declare-fun m!148267 () Bool)

(assert (=> b!127026 m!148267))

(declare-fun m!148269 () Bool)

(assert (=> bm!13678 m!148269))

(assert (=> b!127020 m!147085))

(assert (=> b!127020 m!147085))

(assert (=> b!127020 m!147087))

(assert (=> d!38375 m!147061))

(assert (=> b!126532 d!38375))

(declare-fun d!38377 () Bool)

(declare-fun e!82928 () Bool)

(assert (=> d!38377 e!82928))

(declare-fun res!61393 () Bool)

(assert (=> d!38377 (=> (not res!61393) (not e!82928))))

(declare-fun lt!65629 () ListLongMap!1647)

(assert (=> d!38377 (= res!61393 (contains!867 lt!65629 (_1!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun lt!65627 () List!1692)

(assert (=> d!38377 (= lt!65629 (ListLongMap!1648 lt!65627))))

(declare-fun lt!65630 () Unit!3922)

(declare-fun lt!65628 () Unit!3922)

(assert (=> d!38377 (= lt!65630 lt!65628)))

(assert (=> d!38377 (= (getValueByKey!165 lt!65627 (_1!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))) (Some!170 (_2!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38377 (= lt!65628 (lemmaContainsTupThenGetReturnValue!83 lt!65627 (_1!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (_2!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38377 (= lt!65627 (insertStrictlySorted!86 (toList!839 (ite c!23160 call!13626 (ite c!23158 call!13621 call!13622))) (_1!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (_2!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38377 (= (+!158 (ite c!23160 call!13626 (ite c!23158 call!13621 call!13622)) (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65629)))

(declare-fun b!127031 () Bool)

(declare-fun res!61394 () Bool)

(assert (=> b!127031 (=> (not res!61394) (not e!82928))))

(assert (=> b!127031 (= res!61394 (= (getValueByKey!165 (toList!839 lt!65629) (_1!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))) (Some!170 (_2!1282 (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))))

(declare-fun b!127032 () Bool)

(assert (=> b!127032 (= e!82928 (contains!869 (toList!839 lt!65629) (ite (or c!23160 c!23158) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (= (and d!38377 res!61393) b!127031))

(assert (= (and b!127031 res!61394) b!127032))

(declare-fun m!148271 () Bool)

(assert (=> d!38377 m!148271))

(declare-fun m!148273 () Bool)

(assert (=> d!38377 m!148273))

(declare-fun m!148275 () Bool)

(assert (=> d!38377 m!148275))

(declare-fun m!148277 () Bool)

(assert (=> d!38377 m!148277))

(declare-fun m!148279 () Bool)

(assert (=> b!127031 m!148279))

(declare-fun m!148281 () Bool)

(assert (=> b!127032 m!148281))

(assert (=> bm!13622 d!38377))

(declare-fun b!127033 () Bool)

(declare-fun e!82929 () Option!171)

(assert (=> b!127033 (= e!82929 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65156)))))))

(declare-fun e!82930 () Option!171)

(declare-fun b!127035 () Bool)

(assert (=> b!127035 (= e!82930 (getValueByKey!165 (t!6030 (toList!839 lt!65156)) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun c!23277 () Bool)

(declare-fun d!38379 () Bool)

(assert (=> d!38379 (= c!23277 (and ((_ is Cons!1688) (toList!839 lt!65156)) (= (_1!1282 (h!2290 (toList!839 lt!65156))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (=> d!38379 (= (getValueByKey!165 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) e!82929)))

(declare-fun b!127036 () Bool)

(assert (=> b!127036 (= e!82930 None!169)))

(declare-fun b!127034 () Bool)

(assert (=> b!127034 (= e!82929 e!82930)))

(declare-fun c!23278 () Bool)

(assert (=> b!127034 (= c!23278 (and ((_ is Cons!1688) (toList!839 lt!65156)) (not (= (_1!1282 (h!2290 (toList!839 lt!65156))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(assert (= (and d!38379 c!23277) b!127033))

(assert (= (and d!38379 (not c!23277)) b!127034))

(assert (= (and b!127034 c!23278) b!127035))

(assert (= (and b!127034 (not c!23278)) b!127036))

(declare-fun m!148283 () Bool)

(assert (=> b!127035 m!148283))

(assert (=> b!126400 d!38379))

(declare-fun lt!65631 () Bool)

(declare-fun d!38381 () Bool)

(assert (=> d!38381 (= lt!65631 (select (content!125 (toList!839 lt!65215)) (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun e!82932 () Bool)

(assert (=> d!38381 (= lt!65631 e!82932)))

(declare-fun res!61396 () Bool)

(assert (=> d!38381 (=> (not res!61396) (not e!82932))))

(assert (=> d!38381 (= res!61396 ((_ is Cons!1688) (toList!839 lt!65215)))))

(assert (=> d!38381 (= (contains!869 (toList!839 lt!65215) (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65631)))

(declare-fun b!127037 () Bool)

(declare-fun e!82931 () Bool)

(assert (=> b!127037 (= e!82932 e!82931)))

(declare-fun res!61395 () Bool)

(assert (=> b!127037 (=> res!61395 e!82931)))

(assert (=> b!127037 (= res!61395 (= (h!2290 (toList!839 lt!65215)) (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127038 () Bool)

(assert (=> b!127038 (= e!82931 (contains!869 (t!6030 (toList!839 lt!65215)) (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38381 res!61396) b!127037))

(assert (= (and b!127037 (not res!61395)) b!127038))

(declare-fun m!148285 () Bool)

(assert (=> d!38381 m!148285))

(declare-fun m!148287 () Bool)

(assert (=> d!38381 m!148287))

(declare-fun m!148289 () Bool)

(assert (=> b!127038 m!148289))

(assert (=> b!126492 d!38381))

(declare-fun d!38383 () Bool)

(assert (=> d!38383 (= (get!1446 (getValueByKey!165 (toList!839 lt!65005) lt!65008)) (v!3122 (getValueByKey!165 (toList!839 lt!65005) lt!65008)))))

(assert (=> d!38093 d!38383))

(declare-fun b!127039 () Bool)

(declare-fun e!82933 () Option!171)

(assert (=> b!127039 (= e!82933 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65005)))))))

(declare-fun b!127041 () Bool)

(declare-fun e!82934 () Option!171)

(assert (=> b!127041 (= e!82934 (getValueByKey!165 (t!6030 (toList!839 lt!65005)) lt!65008))))

(declare-fun d!38385 () Bool)

(declare-fun c!23279 () Bool)

(assert (=> d!38385 (= c!23279 (and ((_ is Cons!1688) (toList!839 lt!65005)) (= (_1!1282 (h!2290 (toList!839 lt!65005))) lt!65008)))))

(assert (=> d!38385 (= (getValueByKey!165 (toList!839 lt!65005) lt!65008) e!82933)))

(declare-fun b!127042 () Bool)

(assert (=> b!127042 (= e!82934 None!169)))

(declare-fun b!127040 () Bool)

(assert (=> b!127040 (= e!82933 e!82934)))

(declare-fun c!23280 () Bool)

(assert (=> b!127040 (= c!23280 (and ((_ is Cons!1688) (toList!839 lt!65005)) (not (= (_1!1282 (h!2290 (toList!839 lt!65005))) lt!65008))))))

(assert (= (and d!38385 c!23279) b!127039))

(assert (= (and d!38385 (not c!23279)) b!127040))

(assert (= (and b!127040 c!23280) b!127041))

(assert (= (and b!127040 (not c!23280)) b!127042))

(declare-fun m!148291 () Bool)

(assert (=> b!127041 m!148291))

(assert (=> d!38093 d!38385))

(declare-fun d!38387 () Bool)

(declare-fun lt!65632 () Bool)

(assert (=> d!38387 (= lt!65632 (select (content!125 (toList!839 lt!65391)) (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82936 () Bool)

(assert (=> d!38387 (= lt!65632 e!82936)))

(declare-fun res!61398 () Bool)

(assert (=> d!38387 (=> (not res!61398) (not e!82936))))

(assert (=> d!38387 (= res!61398 ((_ is Cons!1688) (toList!839 lt!65391)))))

(assert (=> d!38387 (= (contains!869 (toList!839 lt!65391) (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65632)))

(declare-fun b!127043 () Bool)

(declare-fun e!82935 () Bool)

(assert (=> b!127043 (= e!82936 e!82935)))

(declare-fun res!61397 () Bool)

(assert (=> b!127043 (=> res!61397 e!82935)))

(assert (=> b!127043 (= res!61397 (= (h!2290 (toList!839 lt!65391)) (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127044 () Bool)

(assert (=> b!127044 (= e!82935 (contains!869 (t!6030 (toList!839 lt!65391)) (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38387 res!61398) b!127043))

(assert (= (and b!127043 (not res!61397)) b!127044))

(declare-fun m!148293 () Bool)

(assert (=> d!38387 m!148293))

(declare-fun m!148295 () Bool)

(assert (=> d!38387 m!148295))

(declare-fun m!148297 () Bool)

(assert (=> b!127044 m!148297))

(assert (=> b!126658 d!38387))

(declare-fun b!127045 () Bool)

(declare-fun e!82939 () Bool)

(declare-fun e!82938 () Bool)

(assert (=> b!127045 (= e!82939 e!82938)))

(declare-fun res!61400 () Bool)

(assert (=> b!127045 (=> (not res!61400) (not e!82938))))

(declare-fun e!82937 () Bool)

(assert (=> b!127045 (= res!61400 (not e!82937))))

(declare-fun res!61401 () Bool)

(assert (=> b!127045 (=> (not res!61401) (not e!82937))))

(assert (=> b!127045 (= res!61401 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!127047 () Bool)

(declare-fun e!82940 () Bool)

(declare-fun call!13682 () Bool)

(assert (=> b!127047 (= e!82940 call!13682)))

(declare-fun b!127048 () Bool)

(assert (=> b!127048 (= e!82937 (contains!870 Nil!1691 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!38389 () Bool)

(declare-fun res!61399 () Bool)

(assert (=> d!38389 (=> res!61399 e!82939)))

(assert (=> d!38389 (= res!61399 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38389 (= (arrayNoDuplicates!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) #b00000000000000000000000000000000 Nil!1691) e!82939)))

(declare-fun b!127046 () Bool)

(assert (=> b!127046 (= e!82940 call!13682)))

(declare-fun b!127049 () Bool)

(assert (=> b!127049 (= e!82938 e!82940)))

(declare-fun c!23281 () Bool)

(assert (=> b!127049 (= c!23281 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13679 () Bool)

(assert (=> bm!13679 (= call!13682 (arrayNoDuplicates!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23281 (Cons!1690 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000) Nil!1691) Nil!1691)))))

(assert (= (and d!38389 (not res!61399)) b!127045))

(assert (= (and b!127045 res!61401) b!127048))

(assert (= (and b!127045 res!61400) b!127049))

(assert (= (and b!127049 c!23281) b!127046))

(assert (= (and b!127049 (not c!23281)) b!127047))

(assert (= (or b!127046 b!127047) bm!13679))

(assert (=> b!127045 m!147793))

(assert (=> b!127045 m!147793))

(assert (=> b!127045 m!147795))

(assert (=> b!127048 m!147793))

(assert (=> b!127048 m!147793))

(declare-fun m!148299 () Bool)

(assert (=> b!127048 m!148299))

(assert (=> b!127049 m!147793))

(assert (=> b!127049 m!147793))

(assert (=> b!127049 m!147795))

(assert (=> bm!13679 m!147793))

(declare-fun m!148301 () Bool)

(assert (=> bm!13679 m!148301))

(assert (=> b!126359 d!38389))

(assert (=> d!38103 d!38091))

(assert (=> d!38103 d!38109))

(declare-fun d!38391 () Bool)

(assert (=> d!38391 (contains!867 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65016)))

(assert (=> d!38391 true))

(declare-fun _$35!372 () Unit!3922)

(assert (=> d!38391 (= (choose!770 lt!65006 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) lt!65016) _$35!372)))

(declare-fun bs!5257 () Bool)

(assert (= bs!5257 d!38391))

(assert (=> bs!5257 m!146929))

(assert (=> bs!5257 m!146929))

(assert (=> bs!5257 m!146931))

(assert (=> d!38103 d!38391))

(declare-fun d!38393 () Bool)

(declare-fun e!82941 () Bool)

(assert (=> d!38393 e!82941))

(declare-fun res!61402 () Bool)

(assert (=> d!38393 (=> res!61402 e!82941)))

(declare-fun lt!65635 () Bool)

(assert (=> d!38393 (= res!61402 (not lt!65635))))

(declare-fun lt!65633 () Bool)

(assert (=> d!38393 (= lt!65635 lt!65633)))

(declare-fun lt!65636 () Unit!3922)

(declare-fun e!82942 () Unit!3922)

(assert (=> d!38393 (= lt!65636 e!82942)))

(declare-fun c!23282 () Bool)

(assert (=> d!38393 (= c!23282 lt!65633)))

(assert (=> d!38393 (= lt!65633 (containsKey!169 (toList!839 lt!65006) lt!65016))))

(assert (=> d!38393 (= (contains!867 lt!65006 lt!65016) lt!65635)))

(declare-fun b!127051 () Bool)

(declare-fun lt!65634 () Unit!3922)

(assert (=> b!127051 (= e!82942 lt!65634)))

(assert (=> b!127051 (= lt!65634 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65006) lt!65016))))

(assert (=> b!127051 (isDefined!119 (getValueByKey!165 (toList!839 lt!65006) lt!65016))))

(declare-fun b!127052 () Bool)

(declare-fun Unit!3958 () Unit!3922)

(assert (=> b!127052 (= e!82942 Unit!3958)))

(declare-fun b!127053 () Bool)

(assert (=> b!127053 (= e!82941 (isDefined!119 (getValueByKey!165 (toList!839 lt!65006) lt!65016)))))

(assert (= (and d!38393 c!23282) b!127051))

(assert (= (and d!38393 (not c!23282)) b!127052))

(assert (= (and d!38393 (not res!61402)) b!127053))

(declare-fun m!148303 () Bool)

(assert (=> d!38393 m!148303))

(declare-fun m!148305 () Bool)

(assert (=> b!127051 m!148305))

(declare-fun m!148307 () Bool)

(assert (=> b!127051 m!148307))

(assert (=> b!127051 m!148307))

(declare-fun m!148309 () Bool)

(assert (=> b!127051 m!148309))

(assert (=> b!127053 m!148307))

(assert (=> b!127053 m!148307))

(assert (=> b!127053 m!148309))

(assert (=> d!38103 d!38393))

(declare-fun d!38395 () Bool)

(assert (=> d!38395 (= (get!1446 (getValueByKey!165 (toList!839 lt!65021) lt!65013)) (v!3122 (getValueByKey!165 (toList!839 lt!65021) lt!65013)))))

(assert (=> d!38085 d!38395))

(declare-fun b!127054 () Bool)

(declare-fun e!82943 () Option!171)

(assert (=> b!127054 (= e!82943 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65021)))))))

(declare-fun b!127056 () Bool)

(declare-fun e!82944 () Option!171)

(assert (=> b!127056 (= e!82944 (getValueByKey!165 (t!6030 (toList!839 lt!65021)) lt!65013))))

(declare-fun d!38397 () Bool)

(declare-fun c!23283 () Bool)

(assert (=> d!38397 (= c!23283 (and ((_ is Cons!1688) (toList!839 lt!65021)) (= (_1!1282 (h!2290 (toList!839 lt!65021))) lt!65013)))))

(assert (=> d!38397 (= (getValueByKey!165 (toList!839 lt!65021) lt!65013) e!82943)))

(declare-fun b!127057 () Bool)

(assert (=> b!127057 (= e!82944 None!169)))

(declare-fun b!127055 () Bool)

(assert (=> b!127055 (= e!82943 e!82944)))

(declare-fun c!23284 () Bool)

(assert (=> b!127055 (= c!23284 (and ((_ is Cons!1688) (toList!839 lt!65021)) (not (= (_1!1282 (h!2290 (toList!839 lt!65021))) lt!65013))))))

(assert (= (and d!38397 c!23283) b!127054))

(assert (= (and d!38397 (not c!23283)) b!127055))

(assert (= (and b!127055 c!23284) b!127056))

(assert (= (and b!127055 (not c!23284)) b!127057))

(declare-fun m!148311 () Bool)

(assert (=> b!127056 m!148311))

(assert (=> d!38085 d!38397))

(declare-fun d!38399 () Bool)

(assert (=> d!38399 (= (apply!111 lt!65357 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (getValueByKey!165 (toList!839 lt!65357) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5258 () Bool)

(assert (= bs!5258 d!38399))

(assert (=> bs!5258 m!147085))

(assert (=> bs!5258 m!147839))

(assert (=> bs!5258 m!147839))

(declare-fun m!148313 () Bool)

(assert (=> bs!5258 m!148313))

(assert (=> b!126609 d!38399))

(declare-fun c!23285 () Bool)

(declare-fun d!38401 () Bool)

(assert (=> d!38401 (= c!23285 ((_ is ValueCellFull!1076) (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000)))))

(declare-fun e!82945 () V!3433)

(assert (=> d!38401 (= (get!1442 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82945)))

(declare-fun b!127058 () Bool)

(assert (=> b!127058 (= e!82945 (get!1444 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127059 () Bool)

(assert (=> b!127059 (= e!82945 (get!1445 (select (arr!2213 (ite (or c!23087 c!23082) (_values!2765 newMap!16) lt!65098)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38401 c!23285) b!127058))

(assert (= (and d!38401 (not c!23285)) b!127059))

(assert (=> b!127058 m!147461))

(assert (=> b!127058 m!147313))

(declare-fun m!148315 () Bool)

(assert (=> b!127058 m!148315))

(assert (=> b!127059 m!147461))

(assert (=> b!127059 m!147313))

(declare-fun m!148317 () Bool)

(assert (=> b!127059 m!148317))

(assert (=> b!126609 d!38401))

(declare-fun d!38403 () Bool)

(declare-fun res!61403 () Bool)

(declare-fun e!82946 () Bool)

(assert (=> d!38403 (=> res!61403 e!82946)))

(assert (=> d!38403 (= res!61403 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65016)))))

(assert (=> d!38403 (= (containsKey!169 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016) e!82946)))

(declare-fun b!127060 () Bool)

(declare-fun e!82947 () Bool)

(assert (=> b!127060 (= e!82946 e!82947)))

(declare-fun res!61404 () Bool)

(assert (=> b!127060 (=> (not res!61404) (not e!82947))))

(assert (=> b!127060 (= res!61404 (and (or (not ((_ is Cons!1688) (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) (bvsle (_1!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65016)) ((_ is Cons!1688) (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (bvslt (_1!1282 (h!2290 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65016)))))

(declare-fun b!127061 () Bool)

(assert (=> b!127061 (= e!82947 (containsKey!169 (t!6030 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65016))))

(assert (= (and d!38403 (not res!61403)) b!127060))

(assert (= (and b!127060 res!61404) b!127061))

(declare-fun m!148319 () Bool)

(assert (=> b!127061 m!148319))

(assert (=> d!38091 d!38403))

(assert (=> b!126516 d!38167))

(assert (=> b!126674 d!38167))

(declare-fun d!38405 () Bool)

(declare-fun e!82948 () Bool)

(assert (=> d!38405 e!82948))

(declare-fun res!61405 () Bool)

(assert (=> d!38405 (=> res!61405 e!82948)))

(declare-fun lt!65639 () Bool)

(assert (=> d!38405 (= res!61405 (not lt!65639))))

(declare-fun lt!65637 () Bool)

(assert (=> d!38405 (= lt!65639 lt!65637)))

(declare-fun lt!65640 () Unit!3922)

(declare-fun e!82949 () Unit!3922)

(assert (=> d!38405 (= lt!65640 e!82949)))

(declare-fun c!23286 () Bool)

(assert (=> d!38405 (= c!23286 lt!65637)))

(assert (=> d!38405 (= lt!65637 (containsKey!169 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38405 (= (contains!867 lt!65171 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65639)))

(declare-fun b!127062 () Bool)

(declare-fun lt!65638 () Unit!3922)

(assert (=> b!127062 (= e!82949 lt!65638)))

(assert (=> b!127062 (= lt!65638 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> b!127062 (isDefined!119 (getValueByKey!165 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127063 () Bool)

(declare-fun Unit!3959 () Unit!3922)

(assert (=> b!127063 (= e!82949 Unit!3959)))

(declare-fun b!127064 () Bool)

(assert (=> b!127064 (= e!82948 (isDefined!119 (getValueByKey!165 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38405 c!23286) b!127062))

(assert (= (and d!38405 (not c!23286)) b!127063))

(assert (= (and d!38405 (not res!61405)) b!127064))

(declare-fun m!148321 () Bool)

(assert (=> d!38405 m!148321))

(declare-fun m!148323 () Bool)

(assert (=> b!127062 m!148323))

(assert (=> b!127062 m!147163))

(assert (=> b!127062 m!147163))

(declare-fun m!148325 () Bool)

(assert (=> b!127062 m!148325))

(assert (=> b!127064 m!147163))

(assert (=> b!127064 m!147163))

(assert (=> b!127064 m!148325))

(assert (=> d!38081 d!38405))

(declare-fun b!127065 () Bool)

(declare-fun e!82950 () Option!171)

(assert (=> b!127065 (= e!82950 (Some!170 (_2!1282 (h!2290 lt!65169))))))

(declare-fun e!82951 () Option!171)

(declare-fun b!127067 () Bool)

(assert (=> b!127067 (= e!82951 (getValueByKey!165 (t!6030 lt!65169) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun c!23287 () Bool)

(declare-fun d!38407 () Bool)

(assert (=> d!38407 (= c!23287 (and ((_ is Cons!1688) lt!65169) (= (_1!1282 (h!2290 lt!65169)) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38407 (= (getValueByKey!165 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!82950)))

(declare-fun b!127068 () Bool)

(assert (=> b!127068 (= e!82951 None!169)))

(declare-fun b!127066 () Bool)

(assert (=> b!127066 (= e!82950 e!82951)))

(declare-fun c!23288 () Bool)

(assert (=> b!127066 (= c!23288 (and ((_ is Cons!1688) lt!65169) (not (= (_1!1282 (h!2290 lt!65169)) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38407 c!23287) b!127065))

(assert (= (and d!38407 (not c!23287)) b!127066))

(assert (= (and b!127066 c!23288) b!127067))

(assert (= (and b!127066 (not c!23288)) b!127068))

(declare-fun m!148327 () Bool)

(assert (=> b!127067 m!148327))

(assert (=> d!38081 d!38407))

(declare-fun d!38409 () Bool)

(assert (=> d!38409 (= (getValueByKey!165 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65641 () Unit!3922)

(assert (=> d!38409 (= lt!65641 (choose!776 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!82952 () Bool)

(assert (=> d!38409 e!82952))

(declare-fun res!61406 () Bool)

(assert (=> d!38409 (=> (not res!61406) (not e!82952))))

(assert (=> d!38409 (= res!61406 (isStrictlySorted!312 lt!65169))))

(assert (=> d!38409 (= (lemmaContainsTupThenGetReturnValue!83 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65641)))

(declare-fun b!127069 () Bool)

(declare-fun res!61407 () Bool)

(assert (=> b!127069 (=> (not res!61407) (not e!82952))))

(assert (=> b!127069 (= res!61407 (containsKey!169 lt!65169 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127070 () Bool)

(assert (=> b!127070 (= e!82952 (contains!869 lt!65169 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38409 res!61406) b!127069))

(assert (= (and b!127069 res!61407) b!127070))

(assert (=> d!38409 m!147157))

(declare-fun m!148329 () Bool)

(assert (=> d!38409 m!148329))

(declare-fun m!148331 () Bool)

(assert (=> d!38409 m!148331))

(declare-fun m!148333 () Bool)

(assert (=> b!127069 m!148333))

(declare-fun m!148335 () Bool)

(assert (=> b!127070 m!148335))

(assert (=> d!38081 d!38409))

(declare-fun bm!13680 () Bool)

(declare-fun call!13684 () List!1692)

(declare-fun call!13683 () List!1692)

(assert (=> bm!13680 (= call!13684 call!13683)))

(declare-fun lt!65642 () List!1692)

(declare-fun b!127071 () Bool)

(declare-fun e!82953 () Bool)

(assert (=> b!127071 (= e!82953 (contains!869 lt!65642 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun bm!13681 () Bool)

(declare-fun e!82955 () List!1692)

(declare-fun c!23292 () Bool)

(assert (=> bm!13681 (= call!13683 ($colon$colon!88 e!82955 (ite c!23292 (h!2290 (toList!839 lt!65020)) (tuple2!2543 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun c!23290 () Bool)

(assert (=> bm!13681 (= c!23290 c!23292)))

(declare-fun b!127072 () Bool)

(declare-fun e!82957 () List!1692)

(declare-fun call!13685 () List!1692)

(assert (=> b!127072 (= e!82957 call!13685)))

(declare-fun b!127073 () Bool)

(declare-fun e!82956 () List!1692)

(declare-fun e!82954 () List!1692)

(assert (=> b!127073 (= e!82956 e!82954)))

(declare-fun c!23291 () Bool)

(assert (=> b!127073 (= c!23291 (and ((_ is Cons!1688) (toList!839 lt!65020)) (= (_1!1282 (h!2290 (toList!839 lt!65020))) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!127074 () Bool)

(assert (=> b!127074 (= e!82957 call!13685)))

(declare-fun c!23289 () Bool)

(declare-fun b!127075 () Bool)

(assert (=> b!127075 (= e!82955 (ite c!23291 (t!6030 (toList!839 lt!65020)) (ite c!23289 (Cons!1688 (h!2290 (toList!839 lt!65020)) (t!6030 (toList!839 lt!65020))) Nil!1689)))))

(declare-fun b!127076 () Bool)

(assert (=> b!127076 (= e!82956 call!13683)))

(declare-fun b!127077 () Bool)

(assert (=> b!127077 (= c!23289 (and ((_ is Cons!1688) (toList!839 lt!65020)) (bvsgt (_1!1282 (h!2290 (toList!839 lt!65020))) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!127077 (= e!82954 e!82957)))

(declare-fun b!127078 () Bool)

(declare-fun res!61408 () Bool)

(assert (=> b!127078 (=> (not res!61408) (not e!82953))))

(assert (=> b!127078 (= res!61408 (containsKey!169 lt!65642 (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38411 () Bool)

(assert (=> d!38411 e!82953))

(declare-fun res!61409 () Bool)

(assert (=> d!38411 (=> (not res!61409) (not e!82953))))

(assert (=> d!38411 (= res!61409 (isStrictlySorted!312 lt!65642))))

(assert (=> d!38411 (= lt!65642 e!82956)))

(assert (=> d!38411 (= c!23292 (and ((_ is Cons!1688) (toList!839 lt!65020)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65020))) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38411 (isStrictlySorted!312 (toList!839 lt!65020))))

(assert (=> d!38411 (= (insertStrictlySorted!86 (toList!839 lt!65020) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65642)))

(declare-fun bm!13682 () Bool)

(assert (=> bm!13682 (= call!13685 call!13684)))

(declare-fun b!127079 () Bool)

(assert (=> b!127079 (= e!82955 (insertStrictlySorted!86 (t!6030 (toList!839 lt!65020)) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127080 () Bool)

(assert (=> b!127080 (= e!82954 call!13684)))

(assert (= (and d!38411 c!23292) b!127076))

(assert (= (and d!38411 (not c!23292)) b!127073))

(assert (= (and b!127073 c!23291) b!127080))

(assert (= (and b!127073 (not c!23291)) b!127077))

(assert (= (and b!127077 c!23289) b!127074))

(assert (= (and b!127077 (not c!23289)) b!127072))

(assert (= (or b!127074 b!127072) bm!13682))

(assert (= (or b!127080 bm!13682) bm!13680))

(assert (= (or b!127076 bm!13680) bm!13681))

(assert (= (and bm!13681 c!23290) b!127079))

(assert (= (and bm!13681 (not c!23290)) b!127075))

(assert (= (and d!38411 res!61409) b!127078))

(assert (= (and b!127078 res!61408) b!127071))

(declare-fun m!148337 () Bool)

(assert (=> b!127071 m!148337))

(declare-fun m!148339 () Bool)

(assert (=> bm!13681 m!148339))

(declare-fun m!148341 () Bool)

(assert (=> b!127078 m!148341))

(declare-fun m!148343 () Bool)

(assert (=> b!127079 m!148343))

(declare-fun m!148345 () Bool)

(assert (=> d!38411 m!148345))

(declare-fun m!148347 () Bool)

(assert (=> d!38411 m!148347))

(assert (=> d!38081 d!38411))

(declare-fun d!38413 () Bool)

(declare-fun e!82958 () Bool)

(assert (=> d!38413 e!82958))

(declare-fun res!61410 () Bool)

(assert (=> d!38413 (=> res!61410 e!82958)))

(declare-fun lt!65645 () Bool)

(assert (=> d!38413 (= res!61410 (not lt!65645))))

(declare-fun lt!65643 () Bool)

(assert (=> d!38413 (= lt!65645 lt!65643)))

(declare-fun lt!65646 () Unit!3922)

(declare-fun e!82959 () Unit!3922)

(assert (=> d!38413 (= lt!65646 e!82959)))

(declare-fun c!23293 () Bool)

(assert (=> d!38413 (= c!23293 lt!65643)))

(assert (=> d!38413 (= lt!65643 (containsKey!169 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38413 (= (contains!867 lt!65384 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65645)))

(declare-fun b!127081 () Bool)

(declare-fun lt!65644 () Unit!3922)

(assert (=> b!127081 (= e!82959 lt!65644)))

(assert (=> b!127081 (= lt!65644 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!127081 (isDefined!119 (getValueByKey!165 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127082 () Bool)

(declare-fun Unit!3960 () Unit!3922)

(assert (=> b!127082 (= e!82959 Unit!3960)))

(declare-fun b!127083 () Bool)

(assert (=> b!127083 (= e!82958 (isDefined!119 (getValueByKey!165 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38413 c!23293) b!127081))

(assert (= (and d!38413 (not c!23293)) b!127082))

(assert (= (and d!38413 (not res!61410)) b!127083))

(declare-fun m!148349 () Bool)

(assert (=> d!38413 m!148349))

(declare-fun m!148351 () Bool)

(assert (=> b!127081 m!148351))

(assert (=> b!127081 m!147497))

(assert (=> b!127081 m!147497))

(declare-fun m!148353 () Bool)

(assert (=> b!127081 m!148353))

(assert (=> b!127083 m!147497))

(assert (=> b!127083 m!147497))

(assert (=> b!127083 m!148353))

(assert (=> d!38143 d!38413))

(declare-fun b!127084 () Bool)

(declare-fun e!82960 () Option!171)

(assert (=> b!127084 (= e!82960 (Some!170 (_2!1282 (h!2290 lt!65382))))))

(declare-fun b!127086 () Bool)

(declare-fun e!82961 () Option!171)

(assert (=> b!127086 (= e!82961 (getValueByKey!165 (t!6030 lt!65382) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23294 () Bool)

(declare-fun d!38415 () Bool)

(assert (=> d!38415 (= c!23294 (and ((_ is Cons!1688) lt!65382) (= (_1!1282 (h!2290 lt!65382)) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38415 (= (getValueByKey!165 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82960)))

(declare-fun b!127087 () Bool)

(assert (=> b!127087 (= e!82961 None!169)))

(declare-fun b!127085 () Bool)

(assert (=> b!127085 (= e!82960 e!82961)))

(declare-fun c!23295 () Bool)

(assert (=> b!127085 (= c!23295 (and ((_ is Cons!1688) lt!65382) (not (= (_1!1282 (h!2290 lt!65382)) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38415 c!23294) b!127084))

(assert (= (and d!38415 (not c!23294)) b!127085))

(assert (= (and b!127085 c!23295) b!127086))

(assert (= (and b!127085 (not c!23295)) b!127087))

(declare-fun m!148355 () Bool)

(assert (=> b!127086 m!148355))

(assert (=> d!38143 d!38415))

(declare-fun d!38417 () Bool)

(assert (=> d!38417 (= (getValueByKey!165 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65647 () Unit!3922)

(assert (=> d!38417 (= lt!65647 (choose!776 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82962 () Bool)

(assert (=> d!38417 e!82962))

(declare-fun res!61411 () Bool)

(assert (=> d!38417 (=> (not res!61411) (not e!82962))))

(assert (=> d!38417 (= res!61411 (isStrictlySorted!312 lt!65382))))

(assert (=> d!38417 (= (lemmaContainsTupThenGetReturnValue!83 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65647)))

(declare-fun b!127088 () Bool)

(declare-fun res!61412 () Bool)

(assert (=> b!127088 (=> (not res!61412) (not e!82962))))

(assert (=> b!127088 (= res!61412 (containsKey!169 lt!65382 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127089 () Bool)

(assert (=> b!127089 (= e!82962 (contains!869 lt!65382 (tuple2!2543 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38417 res!61411) b!127088))

(assert (= (and b!127088 res!61412) b!127089))

(assert (=> d!38417 m!147491))

(declare-fun m!148357 () Bool)

(assert (=> d!38417 m!148357))

(declare-fun m!148359 () Bool)

(assert (=> d!38417 m!148359))

(declare-fun m!148361 () Bool)

(assert (=> b!127088 m!148361))

(declare-fun m!148363 () Bool)

(assert (=> b!127089 m!148363))

(assert (=> d!38143 d!38417))

(declare-fun bm!13683 () Bool)

(declare-fun call!13687 () List!1692)

(declare-fun call!13686 () List!1692)

(assert (=> bm!13683 (= call!13687 call!13686)))

(declare-fun lt!65648 () List!1692)

(declare-fun e!82963 () Bool)

(declare-fun b!127090 () Bool)

(assert (=> b!127090 (= e!82963 (contains!869 lt!65648 (tuple2!2543 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82965 () List!1692)

(declare-fun bm!13684 () Bool)

(declare-fun c!23299 () Bool)

(assert (=> bm!13684 (= call!13686 ($colon$colon!88 e!82965 (ite c!23299 (h!2290 (toList!839 call!13574)) (tuple2!2543 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23297 () Bool)

(assert (=> bm!13684 (= c!23297 c!23299)))

(declare-fun b!127091 () Bool)

(declare-fun e!82967 () List!1692)

(declare-fun call!13688 () List!1692)

(assert (=> b!127091 (= e!82967 call!13688)))

(declare-fun b!127092 () Bool)

(declare-fun e!82966 () List!1692)

(declare-fun e!82964 () List!1692)

(assert (=> b!127092 (= e!82966 e!82964)))

(declare-fun c!23298 () Bool)

(assert (=> b!127092 (= c!23298 (and ((_ is Cons!1688) (toList!839 call!13574)) (= (_1!1282 (h!2290 (toList!839 call!13574))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127093 () Bool)

(assert (=> b!127093 (= e!82967 call!13688)))

(declare-fun b!127094 () Bool)

(declare-fun c!23296 () Bool)

(assert (=> b!127094 (= e!82965 (ite c!23298 (t!6030 (toList!839 call!13574)) (ite c!23296 (Cons!1688 (h!2290 (toList!839 call!13574)) (t!6030 (toList!839 call!13574))) Nil!1689)))))

(declare-fun b!127095 () Bool)

(assert (=> b!127095 (= e!82966 call!13686)))

(declare-fun b!127096 () Bool)

(assert (=> b!127096 (= c!23296 (and ((_ is Cons!1688) (toList!839 call!13574)) (bvsgt (_1!1282 (h!2290 (toList!839 call!13574))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!127096 (= e!82964 e!82967)))

(declare-fun b!127097 () Bool)

(declare-fun res!61413 () Bool)

(assert (=> b!127097 (=> (not res!61413) (not e!82963))))

(assert (=> b!127097 (= res!61413 (containsKey!169 lt!65648 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!38419 () Bool)

(assert (=> d!38419 e!82963))

(declare-fun res!61414 () Bool)

(assert (=> d!38419 (=> (not res!61414) (not e!82963))))

(assert (=> d!38419 (= res!61414 (isStrictlySorted!312 lt!65648))))

(assert (=> d!38419 (= lt!65648 e!82966)))

(assert (=> d!38419 (= c!23299 (and ((_ is Cons!1688) (toList!839 call!13574)) (bvslt (_1!1282 (h!2290 (toList!839 call!13574))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38419 (isStrictlySorted!312 (toList!839 call!13574))))

(assert (=> d!38419 (= (insertStrictlySorted!86 (toList!839 call!13574) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65648)))

(declare-fun bm!13685 () Bool)

(assert (=> bm!13685 (= call!13688 call!13687)))

(declare-fun b!127098 () Bool)

(assert (=> b!127098 (= e!82965 (insertStrictlySorted!86 (t!6030 (toList!839 call!13574)) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127099 () Bool)

(assert (=> b!127099 (= e!82964 call!13687)))

(assert (= (and d!38419 c!23299) b!127095))

(assert (= (and d!38419 (not c!23299)) b!127092))

(assert (= (and b!127092 c!23298) b!127099))

(assert (= (and b!127092 (not c!23298)) b!127096))

(assert (= (and b!127096 c!23296) b!127093))

(assert (= (and b!127096 (not c!23296)) b!127091))

(assert (= (or b!127093 b!127091) bm!13685))

(assert (= (or b!127099 bm!13685) bm!13683))

(assert (= (or b!127095 bm!13683) bm!13684))

(assert (= (and bm!13684 c!23297) b!127098))

(assert (= (and bm!13684 (not c!23297)) b!127094))

(assert (= (and d!38419 res!61414) b!127097))

(assert (= (and b!127097 res!61413) b!127090))

(declare-fun m!148365 () Bool)

(assert (=> b!127090 m!148365))

(declare-fun m!148367 () Bool)

(assert (=> bm!13684 m!148367))

(declare-fun m!148369 () Bool)

(assert (=> b!127097 m!148369))

(declare-fun m!148371 () Bool)

(assert (=> b!127098 m!148371))

(declare-fun m!148373 () Bool)

(assert (=> d!38419 m!148373))

(declare-fun m!148375 () Bool)

(assert (=> d!38419 m!148375))

(assert (=> d!38143 d!38419))

(declare-fun b!127100 () Bool)

(declare-fun e!82969 () Bool)

(assert (=> b!127100 (= e!82969 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!127100 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!127101 () Bool)

(declare-fun e!82971 () Bool)

(declare-fun e!82973 () Bool)

(assert (=> b!127101 (= e!82971 e!82973)))

(declare-fun c!23301 () Bool)

(assert (=> b!127101 (= c!23301 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127102 () Bool)

(declare-fun res!61416 () Bool)

(declare-fun e!82968 () Bool)

(assert (=> b!127102 (=> (not res!61416) (not e!82968))))

(declare-fun lt!65653 () ListLongMap!1647)

(assert (=> b!127102 (= res!61416 (not (contains!867 lt!65653 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127103 () Bool)

(assert (=> b!127103 (= e!82973 (isEmpty!401 lt!65653))))

(declare-fun b!127104 () Bool)

(declare-fun e!82972 () ListLongMap!1647)

(assert (=> b!127104 (= e!82972 (ListLongMap!1648 Nil!1689))))

(declare-fun b!127105 () Bool)

(declare-fun e!82974 () ListLongMap!1647)

(declare-fun call!13689 () ListLongMap!1647)

(assert (=> b!127105 (= e!82974 call!13689)))

(declare-fun b!127106 () Bool)

(declare-fun e!82970 () Bool)

(assert (=> b!127106 (= e!82971 e!82970)))

(assert (=> b!127106 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun res!61418 () Bool)

(assert (=> b!127106 (= res!61418 (contains!867 lt!65653 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!127106 (=> (not res!61418) (not e!82970))))

(declare-fun b!127107 () Bool)

(declare-fun lt!65649 () Unit!3922)

(declare-fun lt!65651 () Unit!3922)

(assert (=> b!127107 (= lt!65649 lt!65651)))

(declare-fun lt!65652 () (_ BitVec 64))

(declare-fun lt!65650 () ListLongMap!1647)

(declare-fun lt!65654 () (_ BitVec 64))

(declare-fun lt!65655 () V!3433)

(assert (=> b!127107 (not (contains!867 (+!158 lt!65650 (tuple2!2543 lt!65652 lt!65655)) lt!65654))))

(assert (=> b!127107 (= lt!65651 (addStillNotContains!57 lt!65650 lt!65652 lt!65655 lt!65654))))

(assert (=> b!127107 (= lt!65654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!127107 (= lt!65655 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127107 (= lt!65652 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!127107 (= lt!65650 call!13689)))

(assert (=> b!127107 (= e!82974 (+!158 call!13689 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38421 () Bool)

(assert (=> d!38421 e!82968))

(declare-fun res!61417 () Bool)

(assert (=> d!38421 (=> (not res!61417) (not e!82968))))

(assert (=> d!38421 (= res!61417 (not (contains!867 lt!65653 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38421 (= lt!65653 e!82972)))

(declare-fun c!23303 () Bool)

(assert (=> d!38421 (= c!23303 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38421 (validMask!0 (mask!7037 (v!3117 (underlying!435 thiss!992))))))

(assert (=> d!38421 (= (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))) lt!65653)))

(declare-fun b!127108 () Bool)

(assert (=> b!127108 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> b!127108 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2478 (_values!2765 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> b!127108 (= e!82970 (= (apply!111 lt!65653 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127109 () Bool)

(assert (=> b!127109 (= e!82973 (= lt!65653 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun bm!13686 () Bool)

(assert (=> bm!13686 (= call!13689 (getCurrentListMapNoExtraKeys!123 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (_values!2765 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992))) (extraKeys!2563 (v!3117 (underlying!435 thiss!992))) (zeroValue!2645 (v!3117 (underlying!435 thiss!992))) (minValue!2645 (v!3117 (underlying!435 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!127110 () Bool)

(assert (=> b!127110 (= e!82968 e!82971)))

(declare-fun c!23300 () Bool)

(assert (=> b!127110 (= c!23300 e!82969)))

(declare-fun res!61415 () Bool)

(assert (=> b!127110 (=> (not res!61415) (not e!82969))))

(assert (=> b!127110 (= res!61415 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127111 () Bool)

(assert (=> b!127111 (= e!82972 e!82974)))

(declare-fun c!23302 () Bool)

(assert (=> b!127111 (= c!23302 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!38421 c!23303) b!127104))

(assert (= (and d!38421 (not c!23303)) b!127111))

(assert (= (and b!127111 c!23302) b!127107))

(assert (= (and b!127111 (not c!23302)) b!127105))

(assert (= (or b!127107 b!127105) bm!13686))

(assert (= (and d!38421 res!61417) b!127102))

(assert (= (and b!127102 res!61416) b!127110))

(assert (= (and b!127110 res!61415) b!127100))

(assert (= (and b!127110 c!23300) b!127106))

(assert (= (and b!127110 (not c!23300)) b!127101))

(assert (= (and b!127106 res!61418) b!127108))

(assert (= (and b!127101 c!23301) b!127109))

(assert (= (and b!127101 (not c!23301)) b!127103))

(declare-fun b_lambda!5595 () Bool)

(assert (=> (not b_lambda!5595) (not b!127107)))

(assert (=> b!127107 t!6027))

(declare-fun b_and!7821 () Bool)

(assert (= b_and!7817 (and (=> t!6027 result!3823) b_and!7821)))

(assert (=> b!127107 t!6029))

(declare-fun b_and!7823 () Bool)

(assert (= b_and!7819 (and (=> t!6029 result!3827) b_and!7823)))

(declare-fun b_lambda!5597 () Bool)

(assert (=> (not b_lambda!5597) (not b!127108)))

(assert (=> b!127108 t!6027))

(declare-fun b_and!7825 () Bool)

(assert (= b_and!7821 (and (=> t!6027 result!3823) b_and!7825)))

(assert (=> b!127108 t!6029))

(declare-fun b_and!7827 () Bool)

(assert (= b_and!7823 (and (=> t!6029 result!3827) b_and!7827)))

(declare-fun m!148377 () Bool)

(assert (=> b!127102 m!148377))

(declare-fun m!148379 () Bool)

(assert (=> b!127111 m!148379))

(assert (=> b!127111 m!148379))

(declare-fun m!148381 () Bool)

(assert (=> b!127111 m!148381))

(declare-fun m!148383 () Bool)

(assert (=> b!127109 m!148383))

(assert (=> b!127106 m!148379))

(assert (=> b!127106 m!148379))

(declare-fun m!148385 () Bool)

(assert (=> b!127106 m!148385))

(declare-fun m!148387 () Bool)

(assert (=> b!127103 m!148387))

(assert (=> b!127108 m!148379))

(assert (=> b!127108 m!146829))

(assert (=> b!127108 m!148379))

(declare-fun m!148389 () Bool)

(assert (=> b!127108 m!148389))

(declare-fun m!148391 () Bool)

(assert (=> b!127108 m!148391))

(assert (=> b!127108 m!148391))

(assert (=> b!127108 m!146829))

(declare-fun m!148393 () Bool)

(assert (=> b!127108 m!148393))

(assert (=> b!127100 m!148379))

(assert (=> b!127100 m!148379))

(assert (=> b!127100 m!148381))

(assert (=> bm!13686 m!148383))

(declare-fun m!148395 () Bool)

(assert (=> d!38421 m!148395))

(assert (=> d!38421 m!146817))

(assert (=> b!127107 m!148379))

(declare-fun m!148397 () Bool)

(assert (=> b!127107 m!148397))

(declare-fun m!148399 () Bool)

(assert (=> b!127107 m!148399))

(assert (=> b!127107 m!146829))

(assert (=> b!127107 m!148391))

(declare-fun m!148401 () Bool)

(assert (=> b!127107 m!148401))

(assert (=> b!127107 m!148397))

(declare-fun m!148403 () Bool)

(assert (=> b!127107 m!148403))

(assert (=> b!127107 m!148391))

(assert (=> b!127107 m!146829))

(assert (=> b!127107 m!148393))

(assert (=> bm!13598 d!38421))

(assert (=> b!126362 d!38217))

(assert (=> b!126362 d!38219))

(declare-fun b!127112 () Bool)

(declare-fun e!82977 () Bool)

(declare-fun e!82976 () Bool)

(assert (=> b!127112 (= e!82977 e!82976)))

(declare-fun res!61420 () Bool)

(assert (=> b!127112 (=> (not res!61420) (not e!82976))))

(declare-fun e!82975 () Bool)

(assert (=> b!127112 (= res!61420 (not e!82975))))

(declare-fun res!61421 () Bool)

(assert (=> b!127112 (=> (not res!61421) (not e!82975))))

(assert (=> b!127112 (= res!61421 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) lt!65318)))))

(declare-fun b!127114 () Bool)

(declare-fun e!82978 () Bool)

(declare-fun call!13690 () Bool)

(assert (=> b!127114 (= e!82978 call!13690)))

(declare-fun b!127115 () Bool)

(assert (=> b!127115 (= e!82975 (contains!870 lt!65345 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) lt!65318)))))

(declare-fun d!38423 () Bool)

(declare-fun res!61419 () Bool)

(assert (=> d!38423 (=> res!61419 e!82977)))

(assert (=> d!38423 (= res!61419 (bvsge lt!65318 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(assert (=> d!38423 (= (arrayNoDuplicates!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) lt!65318 lt!65345) e!82977)))

(declare-fun b!127113 () Bool)

(assert (=> b!127113 (= e!82978 call!13690)))

(declare-fun b!127116 () Bool)

(assert (=> b!127116 (= e!82976 e!82978)))

(declare-fun c!23304 () Bool)

(assert (=> b!127116 (= c!23304 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) lt!65318)))))

(declare-fun bm!13687 () Bool)

(assert (=> bm!13687 (= call!13690 (arrayNoDuplicates!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (bvadd lt!65318 #b00000000000000000000000000000001) (ite c!23304 (Cons!1690 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) lt!65318) lt!65345) lt!65345)))))

(assert (= (and d!38423 (not res!61419)) b!127112))

(assert (= (and b!127112 res!61421) b!127115))

(assert (= (and b!127112 res!61420) b!127116))

(assert (= (and b!127116 c!23304) b!127113))

(assert (= (and b!127116 (not c!23304)) b!127114))

(assert (= (or b!127113 b!127114) bm!13687))

(declare-fun m!148405 () Bool)

(assert (=> b!127112 m!148405))

(assert (=> b!127112 m!148405))

(declare-fun m!148407 () Bool)

(assert (=> b!127112 m!148407))

(assert (=> b!127115 m!148405))

(assert (=> b!127115 m!148405))

(declare-fun m!148409 () Bool)

(assert (=> b!127115 m!148409))

(assert (=> b!127116 m!148405))

(assert (=> b!127116 m!148405))

(assert (=> b!127116 m!148407))

(assert (=> bm!13687 m!148405))

(declare-fun m!148411 () Bool)

(assert (=> bm!13687 m!148411))

(assert (=> d!38129 d!38423))

(declare-fun b!127117 () Bool)

(declare-fun e!82979 () (_ BitVec 32))

(declare-fun call!13691 () (_ BitVec 32))

(assert (=> b!127117 (= e!82979 (bvadd #b00000000000000000000000000000001 call!13691))))

(declare-fun bm!13688 () Bool)

(assert (=> bm!13688 (= call!13691 (arrayCountValidKeys!0 lt!65328 (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)))))

(declare-fun b!127118 () Bool)

(assert (=> b!127118 (= e!82979 call!13691)))

(declare-fun b!127119 () Bool)

(declare-fun e!82980 () (_ BitVec 32))

(assert (=> b!127119 (= e!82980 #b00000000000000000000000000000000)))

(declare-fun b!127120 () Bool)

(assert (=> b!127120 (= e!82980 e!82979)))

(declare-fun c!23305 () Bool)

(assert (=> b!127120 (= c!23305 (validKeyInArray!0 (select (arr!2212 lt!65328) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(declare-fun lt!65656 () (_ BitVec 32))

(declare-fun d!38425 () Bool)

(assert (=> d!38425 (and (bvsge lt!65656 #b00000000000000000000000000000000) (bvsle lt!65656 (bvsub (size!2477 lt!65328) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(assert (=> d!38425 (= lt!65656 e!82980)))

(declare-fun c!23306 () Bool)

(assert (=> d!38425 (= c!23306 (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)))))

(assert (=> d!38425 (and (bvsle (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)) (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001) (size!2477 lt!65328)))))

(assert (=> d!38425 (= (arrayCountValidKeys!0 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)) lt!65656)))

(assert (= (and d!38425 c!23306) b!127119))

(assert (= (and d!38425 (not c!23306)) b!127120))

(assert (= (and b!127120 c!23305) b!127117))

(assert (= (and b!127120 (not c!23305)) b!127118))

(assert (= (or b!127117 b!127118) bm!13688))

(declare-fun m!148413 () Bool)

(assert (=> bm!13688 m!148413))

(declare-fun m!148415 () Bool)

(assert (=> b!127120 m!148415))

(assert (=> b!127120 m!148415))

(declare-fun m!148417 () Bool)

(assert (=> b!127120 m!148417))

(assert (=> d!38129 d!38425))

(declare-fun b!127121 () Bool)

(declare-fun e!82981 () (_ BitVec 32))

(declare-fun call!13692 () (_ BitVec 32))

(assert (=> b!127121 (= e!82981 (bvadd #b00000000000000000000000000000001 call!13692))))

(declare-fun bm!13689 () Bool)

(assert (=> bm!13689 (= call!13692 (arrayCountValidKeys!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127122 () Bool)

(assert (=> b!127122 (= e!82981 call!13692)))

(declare-fun b!127123 () Bool)

(declare-fun e!82982 () (_ BitVec 32))

(assert (=> b!127123 (= e!82982 #b00000000000000000000000000000000)))

(declare-fun b!127124 () Bool)

(assert (=> b!127124 (= e!82982 e!82981)))

(declare-fun c!23307 () Bool)

(assert (=> b!127124 (= c!23307 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38427 () Bool)

(declare-fun lt!65657 () (_ BitVec 32))

(assert (=> d!38427 (and (bvsge lt!65657 #b00000000000000000000000000000000) (bvsle lt!65657 (bvsub (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!38427 (= lt!65657 e!82982)))

(declare-fun c!23308 () Bool)

(assert (=> d!38427 (= c!23308 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38427 (and (bvsle #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2477 (_keys!4514 newMap!16)) (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(assert (=> d!38427 (= (arrayCountValidKeys!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) lt!65657)))

(assert (= (and d!38427 c!23308) b!127123))

(assert (= (and d!38427 (not c!23308)) b!127124))

(assert (= (and b!127124 c!23307) b!127121))

(assert (= (and b!127124 (not c!23307)) b!127122))

(assert (= (or b!127121 b!127122) bm!13689))

(declare-fun m!148419 () Bool)

(assert (=> bm!13689 m!148419))

(declare-fun m!148421 () Bool)

(assert (=> b!127124 m!148421))

(assert (=> b!127124 m!148421))

(declare-fun m!148423 () Bool)

(assert (=> b!127124 m!148423))

(assert (=> d!38129 d!38427))

(assert (=> d!38129 d!38071))

(declare-fun d!38429 () Bool)

(declare-fun res!61422 () Bool)

(declare-fun e!82983 () Bool)

(assert (=> d!38429 (=> res!61422 e!82983)))

(assert (=> d!38429 (= res!61422 (= (select (arr!2212 lt!65320) #b00000000000000000000000000000000) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38429 (= (arrayContainsKey!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82983)))

(declare-fun b!127125 () Bool)

(declare-fun e!82984 () Bool)

(assert (=> b!127125 (= e!82983 e!82984)))

(declare-fun res!61423 () Bool)

(assert (=> b!127125 (=> (not res!61423) (not e!82984))))

(assert (=> b!127125 (= res!61423 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 lt!65320)))))

(declare-fun b!127126 () Bool)

(assert (=> b!127126 (= e!82984 (arrayContainsKey!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38429 (not res!61422)) b!127125))

(assert (= (and b!127125 res!61423) b!127126))

(declare-fun m!148425 () Bool)

(assert (=> d!38429 m!148425))

(assert (=> b!127126 m!146811))

(declare-fun m!148427 () Bool)

(assert (=> b!127126 m!148427))

(assert (=> d!38129 d!38429))

(declare-fun d!38431 () Bool)

(assert (=> d!38431 (arrayContainsKey!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!65660 () Unit!3922)

(declare-fun choose!13 (array!4675 (_ BitVec 64) (_ BitVec 32)) Unit!3922)

(assert (=> d!38431 (= lt!65660 (choose!13 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(assert (=> d!38431 (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000)))

(assert (=> d!38431 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65320 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))) lt!65660)))

(declare-fun bs!5259 () Bool)

(assert (= bs!5259 d!38431))

(assert (=> bs!5259 m!146811))

(assert (=> bs!5259 m!147403))

(assert (=> bs!5259 m!146811))

(declare-fun m!148429 () Bool)

(assert (=> bs!5259 m!148429))

(assert (=> d!38129 d!38431))

(declare-fun b!127127 () Bool)

(declare-fun e!82991 () ListLongMap!1647)

(declare-fun call!13695 () ListLongMap!1647)

(assert (=> b!127127 (= e!82991 call!13695)))

(declare-fun b!127128 () Bool)

(declare-fun e!82986 () Bool)

(declare-fun lt!65668 () ListLongMap!1647)

(assert (=> b!127128 (= e!82986 (= (apply!111 lt!65668 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127129 () Bool)

(declare-fun e!82993 () Bool)

(assert (=> b!127129 (= e!82993 (= (apply!111 lt!65668 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127130 () Bool)

(declare-fun e!82997 () ListLongMap!1647)

(declare-fun e!82996 () ListLongMap!1647)

(assert (=> b!127130 (= e!82997 e!82996)))

(declare-fun c!23310 () Bool)

(assert (=> b!127130 (= c!23310 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13690 () Bool)

(declare-fun call!13697 () ListLongMap!1647)

(assert (=> bm!13690 (= call!13695 call!13697)))

(declare-fun b!127131 () Bool)

(declare-fun res!61424 () Bool)

(declare-fun e!82989 () Bool)

(assert (=> b!127131 (=> (not res!61424) (not e!82989))))

(declare-fun e!82987 () Bool)

(assert (=> b!127131 (= res!61424 e!82987)))

(declare-fun res!61428 () Bool)

(assert (=> b!127131 (=> res!61428 e!82987)))

(declare-fun e!82994 () Bool)

(assert (=> b!127131 (= res!61428 (not e!82994))))

(declare-fun res!61430 () Bool)

(assert (=> b!127131 (=> (not res!61430) (not e!82994))))

(assert (=> b!127131 (= res!61430 (bvslt #b00000000000000000000000000000000 (size!2477 lt!65316)))))

(declare-fun bm!13691 () Bool)

(declare-fun call!13693 () ListLongMap!1647)

(declare-fun call!13698 () ListLongMap!1647)

(assert (=> bm!13691 (= call!13693 call!13698)))

(declare-fun b!127132 () Bool)

(declare-fun e!82988 () Bool)

(assert (=> b!127132 (= e!82988 e!82986)))

(declare-fun res!61429 () Bool)

(declare-fun call!13696 () Bool)

(assert (=> b!127132 (= res!61429 call!13696)))

(assert (=> b!127132 (=> (not res!61429) (not e!82986))))

(declare-fun bm!13692 () Bool)

(assert (=> bm!13692 (= call!13698 (getCurrentListMapNoExtraKeys!123 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!127133 () Bool)

(declare-fun e!82985 () Bool)

(assert (=> b!127133 (= e!82987 e!82985)))

(declare-fun res!61427 () Bool)

(assert (=> b!127133 (=> (not res!61427) (not e!82985))))

(assert (=> b!127133 (= res!61427 (contains!867 lt!65668 (select (arr!2212 lt!65316) #b00000000000000000000000000000000)))))

(assert (=> b!127133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 lt!65316)))))

(declare-fun b!127134 () Bool)

(declare-fun e!82990 () Unit!3922)

(declare-fun Unit!3961 () Unit!3922)

(assert (=> b!127134 (= e!82990 Unit!3961)))

(declare-fun bm!13693 () Bool)

(declare-fun call!13699 () Bool)

(assert (=> bm!13693 (= call!13699 (contains!867 lt!65668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127135 () Bool)

(declare-fun e!82995 () Bool)

(assert (=> b!127135 (= e!82995 e!82993)))

(declare-fun res!61425 () Bool)

(assert (=> b!127135 (= res!61425 call!13699)))

(assert (=> b!127135 (=> (not res!61425) (not e!82993))))

(declare-fun b!127136 () Bool)

(declare-fun c!23313 () Bool)

(assert (=> b!127136 (= c!23313 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127136 (= e!82996 e!82991)))

(declare-fun b!127137 () Bool)

(declare-fun e!82992 () Bool)

(assert (=> b!127137 (= e!82992 (validKeyInArray!0 (select (arr!2212 lt!65316) #b00000000000000000000000000000000)))))

(declare-fun d!38433 () Bool)

(assert (=> d!38433 e!82989))

(declare-fun res!61431 () Bool)

(assert (=> d!38433 (=> (not res!61431) (not e!82989))))

(assert (=> d!38433 (= res!61431 (or (bvsge #b00000000000000000000000000000000 (size!2477 lt!65316)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 lt!65316)))))))

(declare-fun lt!65665 () ListLongMap!1647)

(assert (=> d!38433 (= lt!65668 lt!65665)))

(declare-fun lt!65675 () Unit!3922)

(assert (=> d!38433 (= lt!65675 e!82990)))

(declare-fun c!23311 () Bool)

(assert (=> d!38433 (= c!23311 e!82992)))

(declare-fun res!61432 () Bool)

(assert (=> d!38433 (=> (not res!61432) (not e!82992))))

(assert (=> d!38433 (= res!61432 (bvslt #b00000000000000000000000000000000 (size!2477 lt!65316)))))

(assert (=> d!38433 (= lt!65665 e!82997)))

(declare-fun c!23312 () Bool)

(assert (=> d!38433 (= c!23312 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38433 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38433 (= (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65668)))

(declare-fun b!127138 () Bool)

(assert (=> b!127138 (= e!82985 (= (apply!111 lt!65668 (select (arr!2212 lt!65316) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 lt!65319) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127138 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 lt!65319)))))

(assert (=> b!127138 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 lt!65316)))))

(declare-fun b!127139 () Bool)

(assert (=> b!127139 (= e!82994 (validKeyInArray!0 (select (arr!2212 lt!65316) #b00000000000000000000000000000000)))))

(declare-fun b!127140 () Bool)

(assert (=> b!127140 (= e!82996 call!13695)))

(declare-fun b!127141 () Bool)

(declare-fun lt!65669 () Unit!3922)

(assert (=> b!127141 (= e!82990 lt!65669)))

(declare-fun lt!65664 () ListLongMap!1647)

(assert (=> b!127141 (= lt!65664 (getCurrentListMapNoExtraKeys!123 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65677 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65674 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65674 (select (arr!2212 lt!65316) #b00000000000000000000000000000000))))

(declare-fun lt!65682 () Unit!3922)

(assert (=> b!127141 (= lt!65682 (addStillContains!87 lt!65664 lt!65677 (zeroValue!2645 newMap!16) lt!65674))))

(assert (=> b!127141 (contains!867 (+!158 lt!65664 (tuple2!2543 lt!65677 (zeroValue!2645 newMap!16))) lt!65674)))

(declare-fun lt!65681 () Unit!3922)

(assert (=> b!127141 (= lt!65681 lt!65682)))

(declare-fun lt!65679 () ListLongMap!1647)

(assert (=> b!127141 (= lt!65679 (getCurrentListMapNoExtraKeys!123 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65672 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65672 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65671 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65671 (select (arr!2212 lt!65316) #b00000000000000000000000000000000))))

(declare-fun lt!65676 () Unit!3922)

(assert (=> b!127141 (= lt!65676 (addApplyDifferent!87 lt!65679 lt!65672 (minValue!2645 newMap!16) lt!65671))))

(assert (=> b!127141 (= (apply!111 (+!158 lt!65679 (tuple2!2543 lt!65672 (minValue!2645 newMap!16))) lt!65671) (apply!111 lt!65679 lt!65671))))

(declare-fun lt!65670 () Unit!3922)

(assert (=> b!127141 (= lt!65670 lt!65676)))

(declare-fun lt!65663 () ListLongMap!1647)

(assert (=> b!127141 (= lt!65663 (getCurrentListMapNoExtraKeys!123 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65661 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65661 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65666 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65666 (select (arr!2212 lt!65316) #b00000000000000000000000000000000))))

(declare-fun lt!65667 () Unit!3922)

(assert (=> b!127141 (= lt!65667 (addApplyDifferent!87 lt!65663 lt!65661 (zeroValue!2645 newMap!16) lt!65666))))

(assert (=> b!127141 (= (apply!111 (+!158 lt!65663 (tuple2!2543 lt!65661 (zeroValue!2645 newMap!16))) lt!65666) (apply!111 lt!65663 lt!65666))))

(declare-fun lt!65680 () Unit!3922)

(assert (=> b!127141 (= lt!65680 lt!65667)))

(declare-fun lt!65678 () ListLongMap!1647)

(assert (=> b!127141 (= lt!65678 (getCurrentListMapNoExtraKeys!123 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65662 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65662 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65673 () (_ BitVec 64))

(assert (=> b!127141 (= lt!65673 (select (arr!2212 lt!65316) #b00000000000000000000000000000000))))

(assert (=> b!127141 (= lt!65669 (addApplyDifferent!87 lt!65678 lt!65662 (minValue!2645 newMap!16) lt!65673))))

(assert (=> b!127141 (= (apply!111 (+!158 lt!65678 (tuple2!2543 lt!65662 (minValue!2645 newMap!16))) lt!65673) (apply!111 lt!65678 lt!65673))))

(declare-fun bm!13694 () Bool)

(declare-fun call!13694 () ListLongMap!1647)

(assert (=> bm!13694 (= call!13697 (+!158 (ite c!23312 call!13698 (ite c!23310 call!13693 call!13694)) (ite (or c!23312 c!23310) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!127142 () Bool)

(assert (=> b!127142 (= e!82991 call!13694)))

(declare-fun b!127143 () Bool)

(assert (=> b!127143 (= e!82997 (+!158 call!13697 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13695 () Bool)

(assert (=> bm!13695 (= call!13694 call!13693)))

(declare-fun bm!13696 () Bool)

(assert (=> bm!13696 (= call!13696 (contains!867 lt!65668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127144 () Bool)

(assert (=> b!127144 (= e!82995 (not call!13699))))

(declare-fun b!127145 () Bool)

(assert (=> b!127145 (= e!82989 e!82988)))

(declare-fun c!23314 () Bool)

(assert (=> b!127145 (= c!23314 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127146 () Bool)

(assert (=> b!127146 (= e!82988 (not call!13696))))

(declare-fun b!127147 () Bool)

(declare-fun res!61426 () Bool)

(assert (=> b!127147 (=> (not res!61426) (not e!82989))))

(assert (=> b!127147 (= res!61426 e!82995)))

(declare-fun c!23309 () Bool)

(assert (=> b!127147 (= c!23309 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38433 c!23312) b!127143))

(assert (= (and d!38433 (not c!23312)) b!127130))

(assert (= (and b!127130 c!23310) b!127140))

(assert (= (and b!127130 (not c!23310)) b!127136))

(assert (= (and b!127136 c!23313) b!127127))

(assert (= (and b!127136 (not c!23313)) b!127142))

(assert (= (or b!127127 b!127142) bm!13695))

(assert (= (or b!127140 bm!13695) bm!13691))

(assert (= (or b!127140 b!127127) bm!13690))

(assert (= (or b!127143 bm!13691) bm!13692))

(assert (= (or b!127143 bm!13690) bm!13694))

(assert (= (and d!38433 res!61432) b!127137))

(assert (= (and d!38433 c!23311) b!127141))

(assert (= (and d!38433 (not c!23311)) b!127134))

(assert (= (and d!38433 res!61431) b!127131))

(assert (= (and b!127131 res!61430) b!127139))

(assert (= (and b!127131 (not res!61428)) b!127133))

(assert (= (and b!127133 res!61427) b!127138))

(assert (= (and b!127131 res!61424) b!127147))

(assert (= (and b!127147 c!23309) b!127135))

(assert (= (and b!127147 (not c!23309)) b!127144))

(assert (= (and b!127135 res!61425) b!127129))

(assert (= (or b!127135 b!127144) bm!13693))

(assert (= (and b!127147 res!61426) b!127145))

(assert (= (and b!127145 c!23314) b!127132))

(assert (= (and b!127145 (not c!23314)) b!127146))

(assert (= (and b!127132 res!61429) b!127128))

(assert (= (or b!127132 b!127146) bm!13696))

(declare-fun b_lambda!5599 () Bool)

(assert (=> (not b_lambda!5599) (not b!127138)))

(assert (=> b!127138 t!6042))

(declare-fun b_and!7829 () Bool)

(assert (= b_and!7825 (and (=> t!6042 result!3843) b_and!7829)))

(assert (=> b!127138 t!6044))

(declare-fun b_and!7831 () Bool)

(assert (= b_and!7827 (and (=> t!6044 result!3845) b_and!7831)))

(declare-fun m!148431 () Bool)

(assert (=> b!127141 m!148431))

(declare-fun m!148433 () Bool)

(assert (=> b!127141 m!148433))

(declare-fun m!148435 () Bool)

(assert (=> b!127141 m!148435))

(declare-fun m!148437 () Bool)

(assert (=> b!127141 m!148437))

(declare-fun m!148439 () Bool)

(assert (=> b!127141 m!148439))

(declare-fun m!148441 () Bool)

(assert (=> b!127141 m!148441))

(declare-fun m!148443 () Bool)

(assert (=> b!127141 m!148443))

(declare-fun m!148445 () Bool)

(assert (=> b!127141 m!148445))

(declare-fun m!148447 () Bool)

(assert (=> b!127141 m!148447))

(declare-fun m!148449 () Bool)

(assert (=> b!127141 m!148449))

(assert (=> b!127141 m!148441))

(declare-fun m!148451 () Bool)

(assert (=> b!127141 m!148451))

(assert (=> b!127141 m!148447))

(declare-fun m!148453 () Bool)

(assert (=> b!127141 m!148453))

(declare-fun m!148455 () Bool)

(assert (=> b!127141 m!148455))

(declare-fun m!148457 () Bool)

(assert (=> b!127141 m!148457))

(assert (=> b!127141 m!148435))

(declare-fun m!148459 () Bool)

(assert (=> b!127141 m!148459))

(assert (=> b!127141 m!148439))

(declare-fun m!148461 () Bool)

(assert (=> b!127141 m!148461))

(declare-fun m!148463 () Bool)

(assert (=> b!127141 m!148463))

(assert (=> b!127139 m!148463))

(assert (=> b!127139 m!148463))

(declare-fun m!148465 () Bool)

(assert (=> b!127139 m!148465))

(declare-fun m!148467 () Bool)

(assert (=> bm!13694 m!148467))

(declare-fun m!148469 () Bool)

(assert (=> b!127129 m!148469))

(assert (=> b!127138 m!148463))

(declare-fun m!148471 () Bool)

(assert (=> b!127138 m!148471))

(assert (=> b!127138 m!148463))

(declare-fun m!148473 () Bool)

(assert (=> b!127138 m!148473))

(assert (=> b!127138 m!148473))

(assert (=> b!127138 m!147313))

(declare-fun m!148475 () Bool)

(assert (=> b!127138 m!148475))

(assert (=> b!127138 m!147313))

(declare-fun m!148477 () Bool)

(assert (=> b!127128 m!148477))

(assert (=> bm!13692 m!148445))

(assert (=> b!127133 m!148463))

(assert (=> b!127133 m!148463))

(declare-fun m!148479 () Bool)

(assert (=> b!127133 m!148479))

(declare-fun m!148481 () Bool)

(assert (=> bm!13693 m!148481))

(declare-fun m!148483 () Bool)

(assert (=> b!127143 m!148483))

(declare-fun m!148485 () Bool)

(assert (=> bm!13696 m!148485))

(assert (=> b!127137 m!148463))

(assert (=> b!127137 m!148463))

(assert (=> b!127137 m!148465))

(assert (=> d!38433 m!147061))

(assert (=> d!38129 d!38433))

(declare-fun b!127148 () Bool)

(declare-fun e!83000 () Bool)

(declare-fun e!82998 () Bool)

(assert (=> b!127148 (= e!83000 e!82998)))

(declare-fun c!23315 () Bool)

(assert (=> b!127148 (= c!23315 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!127149 () Bool)

(declare-fun call!13700 () Bool)

(assert (=> b!127149 (= e!82998 call!13700)))

(declare-fun d!38435 () Bool)

(declare-fun res!61433 () Bool)

(assert (=> d!38435 (=> res!61433 e!83000)))

(assert (=> d!38435 (= res!61433 (bvsge #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(assert (=> d!38435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (mask!7037 newMap!16)) e!83000)))

(declare-fun bm!13697 () Bool)

(assert (=> bm!13697 (= call!13700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (mask!7037 newMap!16)))))

(declare-fun b!127150 () Bool)

(declare-fun e!82999 () Bool)

(assert (=> b!127150 (= e!82999 call!13700)))

(declare-fun b!127151 () Bool)

(assert (=> b!127151 (= e!82998 e!82999)))

(declare-fun lt!65685 () (_ BitVec 64))

(assert (=> b!127151 (= lt!65685 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65684 () Unit!3922)

(assert (=> b!127151 (= lt!65684 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) lt!65685 #b00000000000000000000000000000000))))

(assert (=> b!127151 (arrayContainsKey!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) lt!65685 #b00000000000000000000000000000000)))

(declare-fun lt!65683 () Unit!3922)

(assert (=> b!127151 (= lt!65683 lt!65684)))

(declare-fun res!61434 () Bool)

(assert (=> b!127151 (= res!61434 (= (seekEntryOrOpen!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000) (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (mask!7037 newMap!16)) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!127151 (=> (not res!61434) (not e!82999))))

(assert (= (and d!38435 (not res!61433)) b!127148))

(assert (= (and b!127148 c!23315) b!127151))

(assert (= (and b!127148 (not c!23315)) b!127149))

(assert (= (and b!127151 res!61434) b!127150))

(assert (= (or b!127150 b!127149) bm!13697))

(assert (=> b!127148 m!148421))

(assert (=> b!127148 m!148421))

(assert (=> b!127148 m!148423))

(declare-fun m!148487 () Bool)

(assert (=> bm!13697 m!148487))

(assert (=> b!127151 m!148421))

(declare-fun m!148489 () Bool)

(assert (=> b!127151 m!148489))

(declare-fun m!148491 () Bool)

(assert (=> b!127151 m!148491))

(assert (=> b!127151 m!148421))

(declare-fun m!148493 () Bool)

(assert (=> b!127151 m!148493))

(assert (=> d!38129 d!38435))

(declare-fun b!127152 () Bool)

(declare-fun e!83007 () ListLongMap!1647)

(declare-fun call!13703 () ListLongMap!1647)

(assert (=> b!127152 (= e!83007 call!13703)))

(declare-fun b!127153 () Bool)

(declare-fun e!83002 () Bool)

(declare-fun lt!65693 () ListLongMap!1647)

(assert (=> b!127153 (= e!83002 (= (apply!111 lt!65693 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127154 () Bool)

(declare-fun e!83009 () Bool)

(assert (=> b!127154 (= e!83009 (= (apply!111 lt!65693 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127155 () Bool)

(declare-fun e!83013 () ListLongMap!1647)

(declare-fun e!83012 () ListLongMap!1647)

(assert (=> b!127155 (= e!83013 e!83012)))

(declare-fun c!23317 () Bool)

(assert (=> b!127155 (= c!23317 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13698 () Bool)

(declare-fun call!13705 () ListLongMap!1647)

(assert (=> bm!13698 (= call!13703 call!13705)))

(declare-fun b!127156 () Bool)

(declare-fun res!61435 () Bool)

(declare-fun e!83005 () Bool)

(assert (=> b!127156 (=> (not res!61435) (not e!83005))))

(declare-fun e!83003 () Bool)

(assert (=> b!127156 (= res!61435 e!83003)))

(declare-fun res!61439 () Bool)

(assert (=> b!127156 (=> res!61439 e!83003)))

(declare-fun e!83010 () Bool)

(assert (=> b!127156 (= res!61439 (not e!83010))))

(declare-fun res!61441 () Bool)

(assert (=> b!127156 (=> (not res!61441) (not e!83010))))

(assert (=> b!127156 (= res!61441 (bvslt #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun bm!13699 () Bool)

(declare-fun call!13701 () ListLongMap!1647)

(declare-fun call!13706 () ListLongMap!1647)

(assert (=> bm!13699 (= call!13701 call!13706)))

(declare-fun b!127157 () Bool)

(declare-fun e!83004 () Bool)

(assert (=> b!127157 (= e!83004 e!83002)))

(declare-fun res!61440 () Bool)

(declare-fun call!13704 () Bool)

(assert (=> b!127157 (= res!61440 call!13704)))

(assert (=> b!127157 (=> (not res!61440) (not e!83002))))

(declare-fun bm!13700 () Bool)

(assert (=> bm!13700 (= call!13706 (getCurrentListMapNoExtraKeys!123 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!127158 () Bool)

(declare-fun e!83001 () Bool)

(assert (=> b!127158 (= e!83003 e!83001)))

(declare-fun res!61438 () Bool)

(assert (=> b!127158 (=> (not res!61438) (not e!83001))))

(assert (=> b!127158 (= res!61438 (contains!867 lt!65693 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!127158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun b!127159 () Bool)

(declare-fun e!83006 () Unit!3922)

(declare-fun Unit!3962 () Unit!3922)

(assert (=> b!127159 (= e!83006 Unit!3962)))

(declare-fun bm!13701 () Bool)

(declare-fun call!13707 () Bool)

(assert (=> bm!13701 (= call!13707 (contains!867 lt!65693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127160 () Bool)

(declare-fun e!83011 () Bool)

(assert (=> b!127160 (= e!83011 e!83009)))

(declare-fun res!61436 () Bool)

(assert (=> b!127160 (= res!61436 call!13707)))

(assert (=> b!127160 (=> (not res!61436) (not e!83009))))

(declare-fun b!127161 () Bool)

(declare-fun c!23320 () Bool)

(assert (=> b!127161 (= c!23320 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127161 (= e!83012 e!83007)))

(declare-fun b!127162 () Bool)

(declare-fun e!83008 () Bool)

(assert (=> b!127162 (= e!83008 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38437 () Bool)

(assert (=> d!38437 e!83005))

(declare-fun res!61442 () Bool)

(assert (=> d!38437 (=> (not res!61442) (not e!83005))))

(assert (=> d!38437 (= res!61442 (or (bvsge #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))))

(declare-fun lt!65690 () ListLongMap!1647)

(assert (=> d!38437 (= lt!65693 lt!65690)))

(declare-fun lt!65700 () Unit!3922)

(assert (=> d!38437 (= lt!65700 e!83006)))

(declare-fun c!23318 () Bool)

(assert (=> d!38437 (= c!23318 e!83008)))

(declare-fun res!61443 () Bool)

(assert (=> d!38437 (=> (not res!61443) (not e!83008))))

(assert (=> d!38437 (= res!61443 (bvslt #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(assert (=> d!38437 (= lt!65690 e!83013)))

(declare-fun c!23319 () Bool)

(assert (=> d!38437 (= c!23319 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38437 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38437 (= (getCurrentListMap!509 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65693)))

(declare-fun b!127163 () Bool)

(assert (=> b!127163 (= e!83001 (= (apply!111 lt!65693 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))))))

(assert (=> b!127163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun b!127164 () Bool)

(assert (=> b!127164 (= e!83010 (validKeyInArray!0 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!127165 () Bool)

(assert (=> b!127165 (= e!83012 call!13703)))

(declare-fun b!127166 () Bool)

(declare-fun lt!65694 () Unit!3922)

(assert (=> b!127166 (= e!83006 lt!65694)))

(declare-fun lt!65689 () ListLongMap!1647)

(assert (=> b!127166 (= lt!65689 (getCurrentListMapNoExtraKeys!123 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65702 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65699 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65699 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65707 () Unit!3922)

(assert (=> b!127166 (= lt!65707 (addStillContains!87 lt!65689 lt!65702 (zeroValue!2645 newMap!16) lt!65699))))

(assert (=> b!127166 (contains!867 (+!158 lt!65689 (tuple2!2543 lt!65702 (zeroValue!2645 newMap!16))) lt!65699)))

(declare-fun lt!65706 () Unit!3922)

(assert (=> b!127166 (= lt!65706 lt!65707)))

(declare-fun lt!65704 () ListLongMap!1647)

(assert (=> b!127166 (= lt!65704 (getCurrentListMapNoExtraKeys!123 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65697 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65697 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65696 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65696 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65701 () Unit!3922)

(assert (=> b!127166 (= lt!65701 (addApplyDifferent!87 lt!65704 lt!65697 (minValue!2645 newMap!16) lt!65696))))

(assert (=> b!127166 (= (apply!111 (+!158 lt!65704 (tuple2!2543 lt!65697 (minValue!2645 newMap!16))) lt!65696) (apply!111 lt!65704 lt!65696))))

(declare-fun lt!65695 () Unit!3922)

(assert (=> b!127166 (= lt!65695 lt!65701)))

(declare-fun lt!65688 () ListLongMap!1647)

(assert (=> b!127166 (= lt!65688 (getCurrentListMapNoExtraKeys!123 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65686 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65691 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65691 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65692 () Unit!3922)

(assert (=> b!127166 (= lt!65692 (addApplyDifferent!87 lt!65688 lt!65686 (zeroValue!2645 newMap!16) lt!65691))))

(assert (=> b!127166 (= (apply!111 (+!158 lt!65688 (tuple2!2543 lt!65686 (zeroValue!2645 newMap!16))) lt!65691) (apply!111 lt!65688 lt!65691))))

(declare-fun lt!65705 () Unit!3922)

(assert (=> b!127166 (= lt!65705 lt!65692)))

(declare-fun lt!65703 () ListLongMap!1647)

(assert (=> b!127166 (= lt!65703 (getCurrentListMapNoExtraKeys!123 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65687 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65698 () (_ BitVec 64))

(assert (=> b!127166 (= lt!65698 (select (arr!2212 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!127166 (= lt!65694 (addApplyDifferent!87 lt!65703 lt!65687 (minValue!2645 newMap!16) lt!65698))))

(assert (=> b!127166 (= (apply!111 (+!158 lt!65703 (tuple2!2543 lt!65687 (minValue!2645 newMap!16))) lt!65698) (apply!111 lt!65703 lt!65698))))

(declare-fun call!13702 () ListLongMap!1647)

(declare-fun bm!13702 () Bool)

(assert (=> bm!13702 (= call!13705 (+!158 (ite c!23319 call!13706 (ite c!23317 call!13701 call!13702)) (ite (or c!23319 c!23317) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!127167 () Bool)

(assert (=> b!127167 (= e!83007 call!13702)))

(declare-fun b!127168 () Bool)

(assert (=> b!127168 (= e!83013 (+!158 call!13705 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13703 () Bool)

(assert (=> bm!13703 (= call!13702 call!13701)))

(declare-fun bm!13704 () Bool)

(assert (=> bm!13704 (= call!13704 (contains!867 lt!65693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127169 () Bool)

(assert (=> b!127169 (= e!83011 (not call!13707))))

(declare-fun b!127170 () Bool)

(assert (=> b!127170 (= e!83005 e!83004)))

(declare-fun c!23321 () Bool)

(assert (=> b!127170 (= c!23321 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127171 () Bool)

(assert (=> b!127171 (= e!83004 (not call!13704))))

(declare-fun b!127172 () Bool)

(declare-fun res!61437 () Bool)

(assert (=> b!127172 (=> (not res!61437) (not e!83005))))

(assert (=> b!127172 (= res!61437 e!83011)))

(declare-fun c!23316 () Bool)

(assert (=> b!127172 (= c!23316 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38437 c!23319) b!127168))

(assert (= (and d!38437 (not c!23319)) b!127155))

(assert (= (and b!127155 c!23317) b!127165))

(assert (= (and b!127155 (not c!23317)) b!127161))

(assert (= (and b!127161 c!23320) b!127152))

(assert (= (and b!127161 (not c!23320)) b!127167))

(assert (= (or b!127152 b!127167) bm!13703))

(assert (= (or b!127165 bm!13703) bm!13699))

(assert (= (or b!127165 b!127152) bm!13698))

(assert (= (or b!127168 bm!13699) bm!13700))

(assert (= (or b!127168 bm!13698) bm!13702))

(assert (= (and d!38437 res!61443) b!127162))

(assert (= (and d!38437 c!23318) b!127166))

(assert (= (and d!38437 (not c!23318)) b!127159))

(assert (= (and d!38437 res!61442) b!127156))

(assert (= (and b!127156 res!61441) b!127164))

(assert (= (and b!127156 (not res!61439)) b!127158))

(assert (= (and b!127158 res!61438) b!127163))

(assert (= (and b!127156 res!61435) b!127172))

(assert (= (and b!127172 c!23316) b!127160))

(assert (= (and b!127172 (not c!23316)) b!127169))

(assert (= (and b!127160 res!61436) b!127154))

(assert (= (or b!127160 b!127169) bm!13701))

(assert (= (and b!127172 res!61437) b!127170))

(assert (= (and b!127170 c!23321) b!127157))

(assert (= (and b!127170 (not c!23321)) b!127171))

(assert (= (and b!127157 res!61440) b!127153))

(assert (= (or b!127157 b!127171) bm!13704))

(declare-fun b_lambda!5601 () Bool)

(assert (=> (not b_lambda!5601) (not b!127163)))

(assert (=> b!127163 t!6042))

(declare-fun b_and!7833 () Bool)

(assert (= b_and!7829 (and (=> t!6042 result!3843) b_and!7833)))

(assert (=> b!127163 t!6044))

(declare-fun b_and!7835 () Bool)

(assert (= b_and!7831 (and (=> t!6044 result!3845) b_and!7835)))

(declare-fun m!148495 () Bool)

(assert (=> b!127166 m!148495))

(declare-fun m!148497 () Bool)

(assert (=> b!127166 m!148497))

(declare-fun m!148499 () Bool)

(assert (=> b!127166 m!148499))

(declare-fun m!148501 () Bool)

(assert (=> b!127166 m!148501))

(declare-fun m!148503 () Bool)

(assert (=> b!127166 m!148503))

(declare-fun m!148505 () Bool)

(assert (=> b!127166 m!148505))

(declare-fun m!148507 () Bool)

(assert (=> b!127166 m!148507))

(declare-fun m!148509 () Bool)

(assert (=> b!127166 m!148509))

(declare-fun m!148511 () Bool)

(assert (=> b!127166 m!148511))

(declare-fun m!148513 () Bool)

(assert (=> b!127166 m!148513))

(assert (=> b!127166 m!148505))

(declare-fun m!148515 () Bool)

(assert (=> b!127166 m!148515))

(assert (=> b!127166 m!148511))

(declare-fun m!148517 () Bool)

(assert (=> b!127166 m!148517))

(declare-fun m!148519 () Bool)

(assert (=> b!127166 m!148519))

(declare-fun m!148521 () Bool)

(assert (=> b!127166 m!148521))

(assert (=> b!127166 m!148499))

(declare-fun m!148523 () Bool)

(assert (=> b!127166 m!148523))

(assert (=> b!127166 m!148503))

(declare-fun m!148525 () Bool)

(assert (=> b!127166 m!148525))

(assert (=> b!127166 m!148421))

(assert (=> b!127164 m!148421))

(assert (=> b!127164 m!148421))

(assert (=> b!127164 m!148423))

(declare-fun m!148527 () Bool)

(assert (=> bm!13702 m!148527))

(declare-fun m!148529 () Bool)

(assert (=> b!127154 m!148529))

(assert (=> b!127163 m!148421))

(declare-fun m!148531 () Bool)

(assert (=> b!127163 m!148531))

(assert (=> b!127163 m!148421))

(declare-fun m!148533 () Bool)

(assert (=> b!127163 m!148533))

(assert (=> b!127163 m!148533))

(assert (=> b!127163 m!147313))

(declare-fun m!148535 () Bool)

(assert (=> b!127163 m!148535))

(assert (=> b!127163 m!147313))

(declare-fun m!148537 () Bool)

(assert (=> b!127153 m!148537))

(assert (=> bm!13700 m!148509))

(assert (=> b!127158 m!148421))

(assert (=> b!127158 m!148421))

(declare-fun m!148539 () Bool)

(assert (=> b!127158 m!148539))

(declare-fun m!148541 () Bool)

(assert (=> bm!13701 m!148541))

(declare-fun m!148543 () Bool)

(assert (=> b!127168 m!148543))

(declare-fun m!148545 () Bool)

(assert (=> bm!13704 m!148545))

(assert (=> b!127162 m!148421))

(assert (=> b!127162 m!148421))

(assert (=> b!127162 m!148423))

(assert (=> d!38437 m!147061))

(assert (=> d!38129 d!38437))

(declare-fun d!38439 () Bool)

(declare-fun e!83016 () Bool)

(assert (=> d!38439 e!83016))

(declare-fun res!61446 () Bool)

(assert (=> d!38439 (=> (not res!61446) (not e!83016))))

(assert (=> d!38439 (= res!61446 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 (_keys!4514 newMap!16)))))))

(declare-fun lt!65710 () Unit!3922)

(declare-fun choose!41 (array!4675 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1694) Unit!3922)

(assert (=> d!38439 (= lt!65710 (choose!41 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) lt!65318 lt!65345))))

(assert (=> d!38439 (bvslt (size!2477 (_keys!4514 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38439 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) lt!65318 lt!65345) lt!65710)))

(declare-fun b!127175 () Bool)

(assert (=> b!127175 (= e!83016 (arrayNoDuplicates!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) lt!65318 lt!65345))))

(assert (= (and d!38439 res!61446) b!127175))

(assert (=> d!38439 m!146811))

(declare-fun m!148547 () Bool)

(assert (=> d!38439 m!148547))

(assert (=> b!127175 m!147409))

(assert (=> b!127175 m!147393))

(assert (=> d!38129 d!38439))

(declare-fun d!38441 () Bool)

(declare-fun e!83017 () Bool)

(assert (=> d!38441 e!83017))

(declare-fun res!61447 () Bool)

(assert (=> d!38441 (=> (not res!61447) (not e!83017))))

(declare-fun lt!65713 () ListLongMap!1647)

(assert (=> d!38441 (= res!61447 (contains!867 lt!65713 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65711 () List!1692)

(assert (=> d!38441 (= lt!65713 (ListLongMap!1648 lt!65711))))

(declare-fun lt!65714 () Unit!3922)

(declare-fun lt!65712 () Unit!3922)

(assert (=> d!38441 (= lt!65714 lt!65712)))

(assert (=> d!38441 (= (getValueByKey!165 lt!65711 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38441 (= lt!65712 (lemmaContainsTupThenGetReturnValue!83 lt!65711 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38441 (= lt!65711 (insertStrictlySorted!86 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38441 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65713)))

(declare-fun b!127176 () Bool)

(declare-fun res!61448 () Bool)

(assert (=> b!127176 (=> (not res!61448) (not e!83017))))

(assert (=> b!127176 (= res!61448 (= (getValueByKey!165 (toList!839 lt!65713) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127177 () Bool)

(assert (=> b!127177 (= e!83017 (contains!869 (toList!839 lt!65713) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38441 res!61447) b!127176))

(assert (= (and b!127176 res!61448) b!127177))

(declare-fun m!148549 () Bool)

(assert (=> d!38441 m!148549))

(declare-fun m!148551 () Bool)

(assert (=> d!38441 m!148551))

(declare-fun m!148553 () Bool)

(assert (=> d!38441 m!148553))

(declare-fun m!148555 () Bool)

(assert (=> d!38441 m!148555))

(declare-fun m!148557 () Bool)

(assert (=> b!127176 m!148557))

(declare-fun m!148559 () Bool)

(assert (=> b!127177 m!148559))

(assert (=> d!38129 d!38441))

(declare-fun d!38443 () Bool)

(declare-fun e!83018 () Bool)

(assert (=> d!38443 e!83018))

(declare-fun res!61449 () Bool)

(assert (=> d!38443 (=> res!61449 e!83018)))

(declare-fun lt!65717 () Bool)

(assert (=> d!38443 (= res!61449 (not lt!65717))))

(declare-fun lt!65715 () Bool)

(assert (=> d!38443 (= lt!65717 lt!65715)))

(declare-fun lt!65718 () Unit!3922)

(declare-fun e!83019 () Unit!3922)

(assert (=> d!38443 (= lt!65718 e!83019)))

(declare-fun c!23322 () Bool)

(assert (=> d!38443 (= c!23322 lt!65715)))

(assert (=> d!38443 (= lt!65715 (containsKey!169 (toList!839 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(assert (=> d!38443 (= (contains!867 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))) lt!65717)))

(declare-fun b!127178 () Bool)

(declare-fun lt!65716 () Unit!3922)

(assert (=> b!127178 (= e!83019 lt!65716)))

(assert (=> b!127178 (= lt!65716 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(assert (=> b!127178 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(declare-fun b!127179 () Bool)

(declare-fun Unit!3963 () Unit!3922)

(assert (=> b!127179 (= e!83019 Unit!3963)))

(declare-fun b!127180 () Bool)

(assert (=> b!127180 (= e!83018 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))))

(assert (= (and d!38443 c!23322) b!127178))

(assert (= (and d!38443 (not c!23322)) b!127179))

(assert (= (and d!38443 (not res!61449)) b!127180))

(assert (=> d!38443 m!147399))

(declare-fun m!148561 () Bool)

(assert (=> d!38443 m!148561))

(assert (=> b!127178 m!147399))

(declare-fun m!148563 () Bool)

(assert (=> b!127178 m!148563))

(assert (=> b!127178 m!147399))

(declare-fun m!148565 () Bool)

(assert (=> b!127178 m!148565))

(assert (=> b!127178 m!148565))

(declare-fun m!148567 () Bool)

(assert (=> b!127178 m!148567))

(assert (=> b!127180 m!147399))

(assert (=> b!127180 m!148565))

(assert (=> b!127180 m!148565))

(assert (=> b!127180 m!148567))

(assert (=> d!38129 d!38443))

(declare-fun d!38445 () Bool)

(declare-fun e!83022 () Bool)

(assert (=> d!38445 e!83022))

(declare-fun res!61452 () Bool)

(assert (=> d!38445 (=> (not res!61452) (not e!83022))))

(assert (=> d!38445 (= res!61452 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 (_keys!4514 newMap!16))) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2478 (_values!2765 newMap!16)))))))

(declare-fun lt!65721 () Unit!3922)

(declare-fun choose!778 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3922)

(assert (=> d!38445 (= lt!65721 (choose!778 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38445 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38445 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65721)))

(declare-fun b!127183 () Bool)

(assert (=> b!127183 (= e!83022 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))))

(assert (= (and d!38445 res!61452) b!127183))

(assert (=> d!38445 m!146811))

(assert (=> d!38445 m!146831))

(declare-fun m!148569 () Bool)

(assert (=> d!38445 m!148569))

(assert (=> d!38445 m!147061))

(assert (=> b!127183 m!146923))

(assert (=> b!127183 m!147391))

(assert (=> b!127183 m!147409))

(assert (=> b!127183 m!147407))

(assert (=> b!127183 m!146923))

(assert (=> b!127183 m!147343))

(assert (=> d!38129 d!38445))

(declare-fun d!38447 () Bool)

(declare-fun e!83023 () Bool)

(assert (=> d!38447 e!83023))

(declare-fun res!61453 () Bool)

(assert (=> d!38447 (=> (not res!61453) (not e!83023))))

(assert (=> d!38447 (= res!61453 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 lt!65316))))))

(declare-fun lt!65722 () Unit!3922)

(assert (=> d!38447 (= lt!65722 (choose!771 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38447 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38447 (= (lemmaValidKeyInArrayIsInListMap!115 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (defaultEntry!2782 newMap!16)) lt!65722)))

(declare-fun b!127184 () Bool)

(assert (=> b!127184 (= e!83023 (contains!867 (getCurrentListMap!509 lt!65316 lt!65319 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 lt!65316) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(assert (= (and d!38447 res!61453) b!127184))

(declare-fun m!148571 () Bool)

(assert (=> d!38447 m!148571))

(assert (=> d!38447 m!147061))

(assert (=> b!127184 m!147387))

(declare-fun m!148573 () Bool)

(assert (=> b!127184 m!148573))

(assert (=> b!127184 m!147387))

(assert (=> b!127184 m!148573))

(declare-fun m!148575 () Bool)

(assert (=> b!127184 m!148575))

(assert (=> d!38129 d!38447))

(declare-fun d!38449 () Bool)

(declare-fun e!83024 () Bool)

(assert (=> d!38449 e!83024))

(declare-fun res!61454 () Bool)

(assert (=> d!38449 (=> res!61454 e!83024)))

(declare-fun lt!65725 () Bool)

(assert (=> d!38449 (= res!61454 (not lt!65725))))

(declare-fun lt!65723 () Bool)

(assert (=> d!38449 (= lt!65725 lt!65723)))

(declare-fun lt!65726 () Unit!3922)

(declare-fun e!83025 () Unit!3922)

(assert (=> d!38449 (= lt!65726 e!83025)))

(declare-fun c!23323 () Bool)

(assert (=> d!38449 (= c!23323 lt!65723)))

(assert (=> d!38449 (= lt!65723 (containsKey!169 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> d!38449 (= (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65725)))

(declare-fun b!127185 () Bool)

(declare-fun lt!65724 () Unit!3922)

(assert (=> b!127185 (= e!83025 lt!65724)))

(assert (=> b!127185 (= lt!65724 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!127185 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!127186 () Bool)

(declare-fun Unit!3964 () Unit!3922)

(assert (=> b!127186 (= e!83025 Unit!3964)))

(declare-fun b!127187 () Bool)

(assert (=> b!127187 (= e!83024 (isDefined!119 (getValueByKey!165 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (= (and d!38449 c!23323) b!127185))

(assert (= (and d!38449 (not c!23323)) b!127186))

(assert (= (and d!38449 (not res!61454)) b!127187))

(assert (=> d!38449 m!146811))

(declare-fun m!148577 () Bool)

(assert (=> d!38449 m!148577))

(assert (=> b!127185 m!146811))

(declare-fun m!148579 () Bool)

(assert (=> b!127185 m!148579))

(assert (=> b!127185 m!146811))

(declare-fun m!148581 () Bool)

(assert (=> b!127185 m!148581))

(assert (=> b!127185 m!148581))

(declare-fun m!148583 () Bool)

(assert (=> b!127185 m!148583))

(assert (=> b!127187 m!146811))

(assert (=> b!127187 m!148581))

(assert (=> b!127187 m!148581))

(assert (=> b!127187 m!148583))

(assert (=> d!38129 d!38449))

(assert (=> d!38129 d!38115))

(declare-fun d!38451 () Bool)

(assert (=> d!38451 (= (arrayCountValidKeys!0 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (bvadd (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!65729 () Unit!3922)

(declare-fun choose!2 (array!4675 (_ BitVec 32)) Unit!3922)

(assert (=> d!38451 (= lt!65729 (choose!2 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))

(declare-fun e!83028 () Bool)

(assert (=> d!38451 e!83028))

(declare-fun res!61459 () Bool)

(assert (=> d!38451 (=> (not res!61459) (not e!83028))))

(assert (=> d!38451 (= res!61459 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 lt!65328))))))

(assert (=> d!38451 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65328 (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))) lt!65729)))

(declare-fun b!127192 () Bool)

(declare-fun res!61460 () Bool)

(assert (=> b!127192 (=> (not res!61460) (not e!83028))))

(assert (=> b!127192 (= res!61460 (validKeyInArray!0 (select (arr!2212 lt!65328) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)))))))

(declare-fun b!127193 () Bool)

(assert (=> b!127193 (= e!83028 (bvslt (size!2477 lt!65328) #b01111111111111111111111111111111))))

(assert (= (and d!38451 res!61459) b!127192))

(assert (= (and b!127192 res!61460) b!127193))

(assert (=> d!38451 m!147397))

(declare-fun m!148585 () Bool)

(assert (=> d!38451 m!148585))

(assert (=> b!127192 m!148415))

(assert (=> b!127192 m!148415))

(assert (=> b!127192 m!148417))

(assert (=> d!38129 d!38451))

(declare-fun d!38453 () Bool)

(declare-fun e!83033 () Bool)

(assert (=> d!38453 e!83033))

(declare-fun res!61470 () Bool)

(assert (=> d!38453 (=> (not res!61470) (not e!83033))))

(assert (=> d!38453 (= res!61470 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 (_keys!4514 newMap!16)))))))

(declare-fun lt!65732 () Unit!3922)

(declare-fun choose!1 (array!4675 (_ BitVec 32) (_ BitVec 64)) Unit!3922)

(assert (=> d!38453 (= lt!65732 (choose!1 (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun e!83034 () Bool)

(assert (=> d!38453 e!83034))

(declare-fun res!61472 () Bool)

(assert (=> d!38453 (=> (not res!61472) (not e!83034))))

(assert (=> d!38453 (= res!61472 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 (_keys!4514 newMap!16)))))))

(assert (=> d!38453 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65732)))

(declare-fun b!127205 () Bool)

(assert (=> b!127205 (= e!83033 (= (arrayCountValidKeys!0 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4514 newMap!16) #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!127202 () Bool)

(declare-fun res!61471 () Bool)

(assert (=> b!127202 (=> (not res!61471) (not e!83034))))

(assert (=> b!127202 (= res!61471 (not (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101))))))))

(declare-fun b!127203 () Bool)

(declare-fun res!61469 () Bool)

(assert (=> b!127203 (=> (not res!61469) (not e!83034))))

(assert (=> b!127203 (= res!61469 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!127204 () Bool)

(assert (=> b!127204 (= e!83034 (bvslt (size!2477 (_keys!4514 newMap!16)) #b01111111111111111111111111111111))))

(assert (= (and d!38453 res!61472) b!127202))

(assert (= (and b!127202 res!61471) b!127203))

(assert (= (and b!127203 res!61469) b!127204))

(assert (= (and d!38453 res!61470) b!127205))

(assert (=> d!38453 m!146811))

(declare-fun m!148587 () Bool)

(assert (=> d!38453 m!148587))

(assert (=> b!127205 m!147409))

(assert (=> b!127205 m!147415))

(assert (=> b!127205 m!146915))

(declare-fun m!148589 () Bool)

(assert (=> b!127202 m!148589))

(assert (=> b!127202 m!148589))

(declare-fun m!148591 () Bool)

(assert (=> b!127202 m!148591))

(assert (=> b!127203 m!146811))

(declare-fun m!148593 () Bool)

(assert (=> b!127203 m!148593))

(assert (=> d!38129 d!38453))

(assert (=> d!38129 d!38023))

(assert (=> d!38129 d!38075))

(declare-fun d!38455 () Bool)

(declare-fun e!83037 () Bool)

(assert (=> d!38455 e!83037))

(declare-fun res!61475 () Bool)

(assert (=> d!38455 (=> (not res!61475) (not e!83037))))

(assert (=> d!38455 (= res!61475 (and (bvsge (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) #b00000000000000000000000000000000) (bvslt (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (size!2477 (_keys!4514 newMap!16)))))))

(declare-fun lt!65735 () Unit!3922)

(declare-fun choose!102 ((_ BitVec 64) array!4675 (_ BitVec 32) (_ BitVec 32)) Unit!3922)

(assert (=> d!38455 (= lt!65735 (choose!102 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (mask!7037 newMap!16)))))

(assert (=> d!38455 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38455 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (mask!7037 newMap!16)) lt!65735)))

(declare-fun b!127208 () Bool)

(assert (=> b!127208 (= e!83037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4676 (store (arr!2212 (_keys!4514 newMap!16)) (ite c!23088 (index!3250 lt!65101) (index!3247 lt!65101)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (size!2477 (_keys!4514 newMap!16))) (mask!7037 newMap!16)))))

(assert (= (and d!38455 res!61475) b!127208))

(assert (=> d!38455 m!146811))

(declare-fun m!148595 () Bool)

(assert (=> d!38455 m!148595))

(assert (=> d!38455 m!147061))

(assert (=> b!127208 m!147409))

(assert (=> b!127208 m!147385))

(assert (=> d!38129 d!38455))

(declare-fun d!38457 () Bool)

(assert (=> d!38457 (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))

(declare-fun lt!65738 () Unit!3922)

(declare-fun choose!779 (array!4675 array!4677 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) (_ BitVec 32) Int) Unit!3922)

(assert (=> d!38457 (= lt!65738 (choose!779 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38457 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38457 (= (lemmaArrayContainsKeyThenInListMap!37 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65738)))

(declare-fun bs!5260 () Bool)

(assert (= bs!5260 d!38457))

(assert (=> bs!5260 m!146923))

(assert (=> bs!5260 m!146923))

(assert (=> bs!5260 m!146811))

(assert (=> bs!5260 m!147365))

(assert (=> bs!5260 m!146811))

(declare-fun m!148597 () Bool)

(assert (=> bs!5260 m!148597))

(assert (=> bs!5260 m!147061))

(assert (=> b!126578 d!38457))

(assert (=> b!126578 d!38449))

(assert (=> b!126578 d!38115))

(declare-fun d!38459 () Bool)

(declare-fun e!83038 () Bool)

(assert (=> d!38459 e!83038))

(declare-fun res!61476 () Bool)

(assert (=> d!38459 (=> res!61476 e!83038)))

(declare-fun lt!65741 () Bool)

(assert (=> d!38459 (= res!61476 (not lt!65741))))

(declare-fun lt!65739 () Bool)

(assert (=> d!38459 (= lt!65741 lt!65739)))

(declare-fun lt!65742 () Unit!3922)

(declare-fun e!83039 () Unit!3922)

(assert (=> d!38459 (= lt!65742 e!83039)))

(declare-fun c!23324 () Bool)

(assert (=> d!38459 (= c!23324 lt!65739)))

(assert (=> d!38459 (= lt!65739 (containsKey!169 (toList!839 lt!65357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38459 (= (contains!867 lt!65357 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65741)))

(declare-fun b!127209 () Bool)

(declare-fun lt!65740 () Unit!3922)

(assert (=> b!127209 (= e!83039 lt!65740)))

(assert (=> b!127209 (= lt!65740 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127209 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127210 () Bool)

(declare-fun Unit!3965 () Unit!3922)

(assert (=> b!127210 (= e!83039 Unit!3965)))

(declare-fun b!127211 () Bool)

(assert (=> b!127211 (= e!83038 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38459 c!23324) b!127209))

(assert (= (and d!38459 (not c!23324)) b!127210))

(assert (= (and d!38459 (not res!61476)) b!127211))

(declare-fun m!148599 () Bool)

(assert (=> d!38459 m!148599))

(declare-fun m!148601 () Bool)

(assert (=> b!127209 m!148601))

(declare-fun m!148603 () Bool)

(assert (=> b!127209 m!148603))

(assert (=> b!127209 m!148603))

(declare-fun m!148605 () Bool)

(assert (=> b!127209 m!148605))

(assert (=> b!127211 m!148603))

(assert (=> b!127211 m!148603))

(assert (=> b!127211 m!148605))

(assert (=> bm!13621 d!38459))

(declare-fun b!127224 () Bool)

(declare-fun e!83046 () SeekEntryResult!273)

(assert (=> b!127224 (= e!83046 (MissingVacant!273 (index!3249 lt!65141)))))

(declare-fun b!127225 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!127225 (= e!83046 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14965 lt!65141) #b00000000000000000000000000000001) (nextIndex!0 (index!3249 lt!65141) (x!14965 lt!65141) (mask!7037 newMap!16)) (index!3249 lt!65141) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!127226 () Bool)

(declare-fun e!83047 () SeekEntryResult!273)

(assert (=> b!127226 (= e!83047 (Found!273 (index!3249 lt!65141)))))

(declare-fun lt!65747 () SeekEntryResult!273)

(declare-fun d!38461 () Bool)

(assert (=> d!38461 (and (or ((_ is Undefined!273) lt!65747) (not ((_ is Found!273) lt!65747)) (and (bvsge (index!3248 lt!65747) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65747) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65747) ((_ is Found!273) lt!65747) (not ((_ is MissingVacant!273) lt!65747)) (not (= (index!3250 lt!65747) (index!3249 lt!65141))) (and (bvsge (index!3250 lt!65747) #b00000000000000000000000000000000) (bvslt (index!3250 lt!65747) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65747) (ite ((_ is Found!273) lt!65747) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65747)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (and ((_ is MissingVacant!273) lt!65747) (= (index!3250 lt!65747) (index!3249 lt!65141)) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65747)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!83048 () SeekEntryResult!273)

(assert (=> d!38461 (= lt!65747 e!83048)))

(declare-fun c!23332 () Bool)

(assert (=> d!38461 (= c!23332 (bvsge (x!14965 lt!65141) #b01111111111111111111111111111110))))

(declare-fun lt!65748 () (_ BitVec 64))

(assert (=> d!38461 (= lt!65748 (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65141)))))

(assert (=> d!38461 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38461 (= (seekKeyOrZeroReturnVacant!0 (x!14965 lt!65141) (index!3249 lt!65141) (index!3249 lt!65141) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)) lt!65747)))

(declare-fun b!127227 () Bool)

(assert (=> b!127227 (= e!83048 Undefined!273)))

(declare-fun b!127228 () Bool)

(assert (=> b!127228 (= e!83048 e!83047)))

(declare-fun c!23331 () Bool)

(assert (=> b!127228 (= c!23331 (= lt!65748 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun b!127229 () Bool)

(declare-fun c!23333 () Bool)

(assert (=> b!127229 (= c!23333 (= lt!65748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127229 (= e!83047 e!83046)))

(assert (= (and d!38461 c!23332) b!127227))

(assert (= (and d!38461 (not c!23332)) b!127228))

(assert (= (and b!127228 c!23331) b!127226))

(assert (= (and b!127228 (not c!23331)) b!127229))

(assert (= (and b!127229 c!23333) b!127224))

(assert (= (and b!127229 (not c!23333)) b!127225))

(declare-fun m!148607 () Bool)

(assert (=> b!127225 m!148607))

(assert (=> b!127225 m!148607))

(assert (=> b!127225 m!146811))

(declare-fun m!148609 () Bool)

(assert (=> b!127225 m!148609))

(declare-fun m!148611 () Bool)

(assert (=> d!38461 m!148611))

(declare-fun m!148613 () Bool)

(assert (=> d!38461 m!148613))

(assert (=> d!38461 m!147109))

(assert (=> d!38461 m!147061))

(assert (=> b!126389 d!38461))

(declare-fun d!38463 () Bool)

(declare-fun e!83049 () Bool)

(assert (=> d!38463 e!83049))

(declare-fun res!61477 () Bool)

(assert (=> d!38463 (=> res!61477 e!83049)))

(declare-fun lt!65751 () Bool)

(assert (=> d!38463 (= res!61477 (not lt!65751))))

(declare-fun lt!65749 () Bool)

(assert (=> d!38463 (= lt!65751 lt!65749)))

(declare-fun lt!65752 () Unit!3922)

(declare-fun e!83050 () Unit!3922)

(assert (=> d!38463 (= lt!65752 e!83050)))

(declare-fun c!23334 () Bool)

(assert (=> d!38463 (= c!23334 lt!65749)))

(assert (=> d!38463 (= lt!65749 (containsKey!169 (toList!839 lt!65203) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38463 (= (contains!867 lt!65203 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65751)))

(declare-fun b!127230 () Bool)

(declare-fun lt!65750 () Unit!3922)

(assert (=> b!127230 (= e!83050 lt!65750)))

(assert (=> b!127230 (= lt!65750 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65203) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127230 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127231 () Bool)

(declare-fun Unit!3966 () Unit!3922)

(assert (=> b!127231 (= e!83050 Unit!3966)))

(declare-fun b!127232 () Bool)

(assert (=> b!127232 (= e!83049 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38463 c!23334) b!127230))

(assert (= (and d!38463 (not c!23334)) b!127231))

(assert (= (and d!38463 (not res!61477)) b!127232))

(assert (=> d!38463 m!146957))

(declare-fun m!148615 () Bool)

(assert (=> d!38463 m!148615))

(assert (=> b!127230 m!146957))

(declare-fun m!148617 () Bool)

(assert (=> b!127230 m!148617))

(assert (=> b!127230 m!146957))

(assert (=> b!127230 m!147927))

(assert (=> b!127230 m!147927))

(declare-fun m!148619 () Bool)

(assert (=> b!127230 m!148619))

(assert (=> b!127232 m!146957))

(assert (=> b!127232 m!147927))

(assert (=> b!127232 m!147927))

(assert (=> b!127232 m!148619))

(assert (=> b!126479 d!38463))

(assert (=> bm!13633 d!38169))

(assert (=> b!126645 d!38289))

(assert (=> b!126645 d!38291))

(declare-fun d!38465 () Bool)

(assert (=> d!38465 (= (apply!111 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5261 () Bool)

(assert (= bs!5261 d!38465))

(assert (=> bs!5261 m!148099))

(assert (=> bs!5261 m!148099))

(declare-fun m!148621 () Bool)

(assert (=> bs!5261 m!148621))

(assert (=> b!126508 d!38465))

(declare-fun d!38467 () Bool)

(declare-fun e!83051 () Bool)

(assert (=> d!38467 e!83051))

(declare-fun res!61478 () Bool)

(assert (=> d!38467 (=> res!61478 e!83051)))

(declare-fun lt!65755 () Bool)

(assert (=> d!38467 (= res!61478 (not lt!65755))))

(declare-fun lt!65753 () Bool)

(assert (=> d!38467 (= lt!65755 lt!65753)))

(declare-fun lt!65756 () Unit!3922)

(declare-fun e!83052 () Unit!3922)

(assert (=> d!38467 (= lt!65756 e!83052)))

(declare-fun c!23335 () Bool)

(assert (=> d!38467 (= c!23335 lt!65753)))

(assert (=> d!38467 (= lt!65753 (containsKey!169 (toList!839 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38467 (= (contains!867 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65755)))

(declare-fun b!127233 () Bool)

(declare-fun lt!65754 () Unit!3922)

(assert (=> b!127233 (= e!83052 lt!65754)))

(assert (=> b!127233 (= lt!65754 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127233 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127234 () Bool)

(declare-fun Unit!3967 () Unit!3922)

(assert (=> b!127234 (= e!83052 Unit!3967)))

(declare-fun b!127235 () Bool)

(assert (=> b!127235 (= e!83051 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38467 c!23335) b!127233))

(assert (= (and d!38467 (not c!23335)) b!127234))

(assert (= (and d!38467 (not res!61478)) b!127235))

(declare-fun m!148623 () Bool)

(assert (=> d!38467 m!148623))

(declare-fun m!148625 () Bool)

(assert (=> b!127233 m!148625))

(declare-fun m!148627 () Bool)

(assert (=> b!127233 m!148627))

(assert (=> b!127233 m!148627))

(declare-fun m!148629 () Bool)

(assert (=> b!127233 m!148629))

(assert (=> b!127235 m!148627))

(assert (=> b!127235 m!148627))

(assert (=> b!127235 m!148629))

(assert (=> bm!13605 d!38467))

(declare-fun d!38469 () Bool)

(declare-fun e!83053 () Bool)

(assert (=> d!38469 e!83053))

(declare-fun res!61479 () Bool)

(assert (=> d!38469 (=> res!61479 e!83053)))

(declare-fun lt!65759 () Bool)

(assert (=> d!38469 (= res!61479 (not lt!65759))))

(declare-fun lt!65757 () Bool)

(assert (=> d!38469 (= lt!65759 lt!65757)))

(declare-fun lt!65760 () Unit!3922)

(declare-fun e!83054 () Unit!3922)

(assert (=> d!38469 (= lt!65760 e!83054)))

(declare-fun c!23336 () Bool)

(assert (=> d!38469 (= c!23336 lt!65757)))

(assert (=> d!38469 (= lt!65757 (containsKey!169 (toList!839 lt!65203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38469 (= (contains!867 lt!65203 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65759)))

(declare-fun b!127236 () Bool)

(declare-fun lt!65758 () Unit!3922)

(assert (=> b!127236 (= e!83054 lt!65758)))

(assert (=> b!127236 (= lt!65758 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127236 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127237 () Bool)

(declare-fun Unit!3968 () Unit!3922)

(assert (=> b!127237 (= e!83054 Unit!3968)))

(declare-fun b!127238 () Bool)

(assert (=> b!127238 (= e!83053 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38469 c!23336) b!127236))

(assert (= (and d!38469 (not c!23336)) b!127237))

(assert (= (and d!38469 (not res!61479)) b!127238))

(declare-fun m!148631 () Bool)

(assert (=> d!38469 m!148631))

(declare-fun m!148633 () Bool)

(assert (=> b!127236 m!148633))

(declare-fun m!148635 () Bool)

(assert (=> b!127236 m!148635))

(assert (=> b!127236 m!148635))

(declare-fun m!148637 () Bool)

(assert (=> b!127236 m!148637))

(assert (=> b!127238 m!148635))

(assert (=> b!127238 m!148635))

(assert (=> b!127238 m!148637))

(assert (=> b!126475 d!38469))

(assert (=> b!126592 d!38137))

(declare-fun b!127239 () Bool)

(declare-fun e!83057 () Bool)

(declare-fun e!83055 () Bool)

(assert (=> b!127239 (= e!83057 e!83055)))

(declare-fun c!23337 () Bool)

(assert (=> b!127239 (= c!23337 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!127240 () Bool)

(declare-fun call!13708 () Bool)

(assert (=> b!127240 (= e!83055 call!13708)))

(declare-fun d!38471 () Bool)

(declare-fun res!61480 () Bool)

(assert (=> d!38471 (=> res!61480 e!83057)))

(assert (=> d!38471 (= res!61480 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38471 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4514 newMap!16) (mask!7037 newMap!16)) e!83057)))

(declare-fun bm!13705 () Bool)

(assert (=> bm!13705 (= call!13708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!127241 () Bool)

(declare-fun e!83056 () Bool)

(assert (=> b!127241 (= e!83056 call!13708)))

(declare-fun b!127242 () Bool)

(assert (=> b!127242 (= e!83055 e!83056)))

(declare-fun lt!65763 () (_ BitVec 64))

(assert (=> b!127242 (= lt!65763 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!65762 () Unit!3922)

(assert (=> b!127242 (= lt!65762 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4514 newMap!16) lt!65763 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!127242 (arrayContainsKey!0 (_keys!4514 newMap!16) lt!65763 #b00000000000000000000000000000000)))

(declare-fun lt!65761 () Unit!3922)

(assert (=> b!127242 (= lt!65761 lt!65762)))

(declare-fun res!61481 () Bool)

(assert (=> b!127242 (= res!61481 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4514 newMap!16) (mask!7037 newMap!16)) (Found!273 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!127242 (=> (not res!61481) (not e!83056))))

(assert (= (and d!38471 (not res!61480)) b!127239))

(assert (= (and b!127239 c!23337) b!127242))

(assert (= (and b!127239 (not c!23337)) b!127240))

(assert (= (and b!127242 res!61481) b!127241))

(assert (= (or b!127241 b!127240) bm!13705))

(assert (=> b!127239 m!147903))

(assert (=> b!127239 m!147903))

(assert (=> b!127239 m!148187))

(declare-fun m!148639 () Bool)

(assert (=> bm!13705 m!148639))

(assert (=> b!127242 m!147903))

(declare-fun m!148641 () Bool)

(assert (=> b!127242 m!148641))

(declare-fun m!148643 () Bool)

(assert (=> b!127242 m!148643))

(assert (=> b!127242 m!147903))

(declare-fun m!148645 () Bool)

(assert (=> b!127242 m!148645))

(assert (=> bm!13589 d!38471))

(declare-fun d!38473 () Bool)

(assert (=> d!38473 (= (get!1444 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3116 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126536 d!38473))

(declare-fun d!38475 () Bool)

(declare-fun e!83058 () Bool)

(assert (=> d!38475 e!83058))

(declare-fun res!61482 () Bool)

(assert (=> d!38475 (=> res!61482 e!83058)))

(declare-fun lt!65766 () Bool)

(assert (=> d!38475 (= res!61482 (not lt!65766))))

(declare-fun lt!65764 () Bool)

(assert (=> d!38475 (= lt!65766 lt!65764)))

(declare-fun lt!65767 () Unit!3922)

(declare-fun e!83059 () Unit!3922)

(assert (=> d!38475 (= lt!65767 e!83059)))

(declare-fun c!23338 () Bool)

(assert (=> d!38475 (= c!23338 lt!65764)))

(assert (=> d!38475 (= lt!65764 (containsKey!169 (toList!839 lt!65203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38475 (= (contains!867 lt!65203 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65766)))

(declare-fun b!127243 () Bool)

(declare-fun lt!65765 () Unit!3922)

(assert (=> b!127243 (= e!83059 lt!65765)))

(assert (=> b!127243 (= lt!65765 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127243 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127244 () Bool)

(declare-fun Unit!3969 () Unit!3922)

(assert (=> b!127244 (= e!83059 Unit!3969)))

(declare-fun b!127245 () Bool)

(assert (=> b!127245 (= e!83058 (isDefined!119 (getValueByKey!165 (toList!839 lt!65203) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38475 c!23338) b!127243))

(assert (= (and d!38475 (not c!23338)) b!127244))

(assert (= (and d!38475 (not res!61482)) b!127245))

(declare-fun m!148647 () Bool)

(assert (=> d!38475 m!148647))

(declare-fun m!148649 () Bool)

(assert (=> b!127243 m!148649))

(declare-fun m!148651 () Bool)

(assert (=> b!127243 m!148651))

(assert (=> b!127243 m!148651))

(declare-fun m!148653 () Bool)

(assert (=> b!127243 m!148653))

(assert (=> b!127245 m!148651))

(assert (=> b!127245 m!148651))

(assert (=> b!127245 m!148653))

(assert (=> d!38097 d!38475))

(assert (=> d!38097 d!38045))

(assert (=> d!38137 d!38063))

(declare-fun b!127262 () Bool)

(declare-fun e!83068 () Bool)

(declare-fun e!83069 () Bool)

(assert (=> b!127262 (= e!83068 e!83069)))

(declare-fun res!61493 () Bool)

(declare-fun call!13713 () Bool)

(assert (=> b!127262 (= res!61493 call!13713)))

(assert (=> b!127262 (=> (not res!61493) (not e!83069))))

(declare-fun lt!65770 () SeekEntryResult!273)

(declare-fun bm!13710 () Bool)

(declare-fun c!23344 () Bool)

(assert (=> bm!13710 (= call!13713 (inRange!0 (ite c!23344 (index!3247 lt!65770) (index!3250 lt!65770)) (mask!7037 newMap!16)))))

(declare-fun b!127263 () Bool)

(declare-fun call!13714 () Bool)

(assert (=> b!127263 (= e!83069 (not call!13714))))

(declare-fun b!127264 () Bool)

(declare-fun e!83070 () Bool)

(assert (=> b!127264 (= e!83070 ((_ is Undefined!273) lt!65770))))

(declare-fun d!38477 () Bool)

(assert (=> d!38477 e!83068))

(assert (=> d!38477 (= c!23344 ((_ is MissingZero!273) lt!65770))))

(assert (=> d!38477 (= lt!65770 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(assert (=> d!38477 true))

(declare-fun _$34!955 () Unit!3922)

(assert (=> d!38477 (= (choose!774 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) _$34!955)))

(declare-fun b!127265 () Bool)

(assert (=> b!127265 (= e!83068 e!83070)))

(declare-fun c!23343 () Bool)

(assert (=> b!127265 (= c!23343 ((_ is MissingVacant!273) lt!65770))))

(declare-fun b!127266 () Bool)

(declare-fun e!83071 () Bool)

(assert (=> b!127266 (= e!83071 (not call!13714))))

(declare-fun b!127267 () Bool)

(declare-fun res!61494 () Bool)

(assert (=> b!127267 (=> (not res!61494) (not e!83071))))

(assert (=> b!127267 (= res!61494 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127268 () Bool)

(declare-fun res!61492 () Bool)

(assert (=> b!127268 (=> (not res!61492) (not e!83071))))

(assert (=> b!127268 (= res!61492 call!13713)))

(assert (=> b!127268 (= e!83070 e!83071)))

(declare-fun bm!13711 () Bool)

(assert (=> bm!13711 (= call!13714 (arrayContainsKey!0 (_keys!4514 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!127269 () Bool)

(declare-fun res!61491 () Bool)

(assert (=> b!127269 (= res!61491 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127269 (=> (not res!61491) (not e!83069))))

(assert (= (and d!38477 c!23344) b!127262))

(assert (= (and d!38477 (not c!23344)) b!127265))

(assert (= (and b!127262 res!61493) b!127269))

(assert (= (and b!127269 res!61491) b!127263))

(assert (= (and b!127265 c!23343) b!127268))

(assert (= (and b!127265 (not c!23343)) b!127264))

(assert (= (and b!127268 res!61492) b!127267))

(assert (= (and b!127267 res!61494) b!127266))

(assert (= (or b!127262 b!127268) bm!13710))

(assert (= (or b!127263 b!127266) bm!13711))

(declare-fun m!148655 () Bool)

(assert (=> b!127267 m!148655))

(assert (=> bm!13711 m!146811))

(assert (=> bm!13711 m!147005))

(assert (=> d!38477 m!146811))

(assert (=> d!38477 m!147021))

(declare-fun m!148657 () Bool)

(assert (=> b!127269 m!148657))

(declare-fun m!148659 () Bool)

(assert (=> bm!13710 m!148659))

(assert (=> d!38137 d!38477))

(assert (=> d!38137 d!38241))

(declare-fun d!38479 () Bool)

(assert (=> d!38479 (= (isEmpty!400 (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) (not ((_ is Some!170) (getValueByKey!165 (toList!839 lt!64938) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(assert (=> d!38051 d!38479))

(declare-fun d!38481 () Bool)

(assert (=> d!38481 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(declare-fun lt!65771 () Unit!3922)

(assert (=> d!38481 (= lt!65771 (choose!768 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(declare-fun e!83072 () Bool)

(assert (=> d!38481 e!83072))

(declare-fun res!61495 () Bool)

(assert (=> d!38481 (=> (not res!61495) (not e!83072))))

(assert (=> d!38481 (= res!61495 (isStrictlySorted!312 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38481 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016) lt!65771)))

(declare-fun b!127270 () Bool)

(assert (=> b!127270 (= e!83072 (containsKey!169 (toList!839 (+!158 lt!65006 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65016))))

(assert (= (and d!38481 res!61495) b!127270))

(assert (=> d!38481 m!147195))

(assert (=> d!38481 m!147195))

(assert (=> d!38481 m!147197))

(declare-fun m!148661 () Bool)

(assert (=> d!38481 m!148661))

(declare-fun m!148663 () Bool)

(assert (=> d!38481 m!148663))

(assert (=> b!127270 m!147191))

(assert (=> b!126444 d!38481))

(assert (=> b!126444 d!38267))

(assert (=> b!126444 d!38269))

(declare-fun d!38483 () Bool)

(declare-fun e!83073 () Bool)

(assert (=> d!38483 e!83073))

(declare-fun res!61496 () Bool)

(assert (=> d!38483 (=> (not res!61496) (not e!83073))))

(declare-fun lt!65774 () ListLongMap!1647)

(assert (=> d!38483 (= res!61496 (contains!867 lt!65774 (_1!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65772 () List!1692)

(assert (=> d!38483 (= lt!65774 (ListLongMap!1648 lt!65772))))

(declare-fun lt!65775 () Unit!3922)

(declare-fun lt!65773 () Unit!3922)

(assert (=> d!38483 (= lt!65775 lt!65773)))

(assert (=> d!38483 (= (getValueByKey!165 lt!65772 (_1!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38483 (= lt!65773 (lemmaContainsTupThenGetReturnValue!83 lt!65772 (_1!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38483 (= lt!65772 (insertStrictlySorted!86 (toList!839 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38483 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65774)))

(declare-fun b!127271 () Bool)

(declare-fun res!61497 () Bool)

(assert (=> b!127271 (=> (not res!61497) (not e!83073))))

(assert (=> b!127271 (= res!61497 (= (getValueByKey!165 (toList!839 lt!65774) (_1!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127272 () Bool)

(assert (=> b!127272 (= e!83073 (contains!869 (toList!839 lt!65774) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38483 res!61496) b!127271))

(assert (= (and b!127271 res!61497) b!127272))

(declare-fun m!148665 () Bool)

(assert (=> d!38483 m!148665))

(declare-fun m!148667 () Bool)

(assert (=> d!38483 m!148667))

(declare-fun m!148669 () Bool)

(assert (=> d!38483 m!148669))

(declare-fun m!148671 () Bool)

(assert (=> d!38483 m!148671))

(declare-fun m!148673 () Bool)

(assert (=> b!127271 m!148673))

(declare-fun m!148675 () Bool)

(assert (=> b!127272 m!148675))

(assert (=> d!38049 d!38483))

(declare-fun d!38485 () Bool)

(assert (=> d!38485 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38485 true))

(declare-fun _$7!107 () Unit!3922)

(assert (=> d!38485 (= (choose!767 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) lt!65100 (zeroValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)) _$7!107)))

(declare-fun bs!5262 () Bool)

(assert (= bs!5262 d!38485))

(assert (=> bs!5262 m!146923))

(assert (=> bs!5262 m!146923))

(assert (=> bs!5262 m!147059))

(assert (=> bs!5262 m!146831))

(assert (=> bs!5262 m!147055))

(assert (=> d!38049 d!38485))

(assert (=> d!38049 d!38241))

(assert (=> d!38049 d!38115))

(declare-fun b!127273 () Bool)

(declare-fun e!83080 () ListLongMap!1647)

(declare-fun call!13717 () ListLongMap!1647)

(assert (=> b!127273 (= e!83080 call!13717)))

(declare-fun b!127274 () Bool)

(declare-fun e!83075 () Bool)

(declare-fun lt!65783 () ListLongMap!1647)

(assert (=> b!127274 (= e!83075 (= (apply!111 lt!65783 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun e!83082 () Bool)

(declare-fun b!127275 () Bool)

(assert (=> b!127275 (= e!83082 (= (apply!111 lt!65783 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127276 () Bool)

(declare-fun e!83086 () ListLongMap!1647)

(declare-fun e!83085 () ListLongMap!1647)

(assert (=> b!127276 (= e!83086 e!83085)))

(declare-fun c!23346 () Bool)

(assert (=> b!127276 (= c!23346 (and (not (= (bvand lt!65100 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65100 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13712 () Bool)

(declare-fun call!13719 () ListLongMap!1647)

(assert (=> bm!13712 (= call!13717 call!13719)))

(declare-fun b!127277 () Bool)

(declare-fun res!61498 () Bool)

(declare-fun e!83078 () Bool)

(assert (=> b!127277 (=> (not res!61498) (not e!83078))))

(declare-fun e!83076 () Bool)

(assert (=> b!127277 (= res!61498 e!83076)))

(declare-fun res!61502 () Bool)

(assert (=> b!127277 (=> res!61502 e!83076)))

(declare-fun e!83083 () Bool)

(assert (=> b!127277 (= res!61502 (not e!83083))))

(declare-fun res!61504 () Bool)

(assert (=> b!127277 (=> (not res!61504) (not e!83083))))

(assert (=> b!127277 (= res!61504 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13713 () Bool)

(declare-fun call!13715 () ListLongMap!1647)

(declare-fun call!13720 () ListLongMap!1647)

(assert (=> bm!13713 (= call!13715 call!13720)))

(declare-fun b!127278 () Bool)

(declare-fun e!83077 () Bool)

(assert (=> b!127278 (= e!83077 e!83075)))

(declare-fun res!61503 () Bool)

(declare-fun call!13718 () Bool)

(assert (=> b!127278 (= res!61503 call!13718)))

(assert (=> b!127278 (=> (not res!61503) (not e!83075))))

(declare-fun bm!13714 () Bool)

(assert (=> bm!13714 (= call!13720 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!127279 () Bool)

(declare-fun e!83074 () Bool)

(assert (=> b!127279 (= e!83076 e!83074)))

(declare-fun res!61501 () Bool)

(assert (=> b!127279 (=> (not res!61501) (not e!83074))))

(assert (=> b!127279 (= res!61501 (contains!867 lt!65783 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127280 () Bool)

(declare-fun e!83079 () Unit!3922)

(declare-fun Unit!3970 () Unit!3922)

(assert (=> b!127280 (= e!83079 Unit!3970)))

(declare-fun bm!13715 () Bool)

(declare-fun call!13721 () Bool)

(assert (=> bm!13715 (= call!13721 (contains!867 lt!65783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127281 () Bool)

(declare-fun e!83084 () Bool)

(assert (=> b!127281 (= e!83084 e!83082)))

(declare-fun res!61499 () Bool)

(assert (=> b!127281 (= res!61499 call!13721)))

(assert (=> b!127281 (=> (not res!61499) (not e!83082))))

(declare-fun b!127282 () Bool)

(declare-fun c!23349 () Bool)

(assert (=> b!127282 (= c!23349 (and (not (= (bvand lt!65100 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65100 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127282 (= e!83085 e!83080)))

(declare-fun b!127283 () Bool)

(declare-fun e!83081 () Bool)

(assert (=> b!127283 (= e!83081 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38487 () Bool)

(assert (=> d!38487 e!83078))

(declare-fun res!61505 () Bool)

(assert (=> d!38487 (=> (not res!61505) (not e!83078))))

(assert (=> d!38487 (= res!61505 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65780 () ListLongMap!1647)

(assert (=> d!38487 (= lt!65783 lt!65780)))

(declare-fun lt!65790 () Unit!3922)

(assert (=> d!38487 (= lt!65790 e!83079)))

(declare-fun c!23347 () Bool)

(assert (=> d!38487 (= c!23347 e!83081)))

(declare-fun res!61506 () Bool)

(assert (=> d!38487 (=> (not res!61506) (not e!83081))))

(assert (=> d!38487 (= res!61506 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38487 (= lt!65780 e!83086)))

(declare-fun c!23348 () Bool)

(assert (=> d!38487 (= c!23348 (and (not (= (bvand lt!65100 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65100 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38487 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38487 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65783)))

(declare-fun b!127284 () Bool)

(assert (=> b!127284 (= e!83074 (= (apply!111 lt!65783 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (_values!2765 newMap!16))))))

(assert (=> b!127284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127285 () Bool)

(assert (=> b!127285 (= e!83083 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127286 () Bool)

(assert (=> b!127286 (= e!83085 call!13717)))

(declare-fun b!127287 () Bool)

(declare-fun lt!65784 () Unit!3922)

(assert (=> b!127287 (= e!83079 lt!65784)))

(declare-fun lt!65779 () ListLongMap!1647)

(assert (=> b!127287 (= lt!65779 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65792 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65789 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65789 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65797 () Unit!3922)

(assert (=> b!127287 (= lt!65797 (addStillContains!87 lt!65779 lt!65792 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65789))))

(assert (=> b!127287 (contains!867 (+!158 lt!65779 (tuple2!2543 lt!65792 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65789)))

(declare-fun lt!65796 () Unit!3922)

(assert (=> b!127287 (= lt!65796 lt!65797)))

(declare-fun lt!65794 () ListLongMap!1647)

(assert (=> b!127287 (= lt!65794 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65787 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65787 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65786 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65786 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65791 () Unit!3922)

(assert (=> b!127287 (= lt!65791 (addApplyDifferent!87 lt!65794 lt!65787 (minValue!2645 newMap!16) lt!65786))))

(assert (=> b!127287 (= (apply!111 (+!158 lt!65794 (tuple2!2543 lt!65787 (minValue!2645 newMap!16))) lt!65786) (apply!111 lt!65794 lt!65786))))

(declare-fun lt!65785 () Unit!3922)

(assert (=> b!127287 (= lt!65785 lt!65791)))

(declare-fun lt!65778 () ListLongMap!1647)

(assert (=> b!127287 (= lt!65778 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65776 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65781 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65781 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65782 () Unit!3922)

(assert (=> b!127287 (= lt!65782 (addApplyDifferent!87 lt!65778 lt!65776 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65781))))

(assert (=> b!127287 (= (apply!111 (+!158 lt!65778 (tuple2!2543 lt!65776 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65781) (apply!111 lt!65778 lt!65781))))

(declare-fun lt!65795 () Unit!3922)

(assert (=> b!127287 (= lt!65795 lt!65782)))

(declare-fun lt!65793 () ListLongMap!1647)

(assert (=> b!127287 (= lt!65793 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) lt!65100 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65777 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65777 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65788 () (_ BitVec 64))

(assert (=> b!127287 (= lt!65788 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127287 (= lt!65784 (addApplyDifferent!87 lt!65793 lt!65777 (minValue!2645 newMap!16) lt!65788))))

(assert (=> b!127287 (= (apply!111 (+!158 lt!65793 (tuple2!2543 lt!65777 (minValue!2645 newMap!16))) lt!65788) (apply!111 lt!65793 lt!65788))))

(declare-fun call!13716 () ListLongMap!1647)

(declare-fun bm!13716 () Bool)

(assert (=> bm!13716 (= call!13719 (+!158 (ite c!23348 call!13720 (ite c!23346 call!13715 call!13716)) (ite (or c!23348 c!23346) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!127288 () Bool)

(assert (=> b!127288 (= e!83080 call!13716)))

(declare-fun b!127289 () Bool)

(assert (=> b!127289 (= e!83086 (+!158 call!13719 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13717 () Bool)

(assert (=> bm!13717 (= call!13716 call!13715)))

(declare-fun bm!13718 () Bool)

(assert (=> bm!13718 (= call!13718 (contains!867 lt!65783 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127290 () Bool)

(assert (=> b!127290 (= e!83084 (not call!13721))))

(declare-fun b!127291 () Bool)

(assert (=> b!127291 (= e!83078 e!83077)))

(declare-fun c!23350 () Bool)

(assert (=> b!127291 (= c!23350 (not (= (bvand lt!65100 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127292 () Bool)

(assert (=> b!127292 (= e!83077 (not call!13718))))

(declare-fun b!127293 () Bool)

(declare-fun res!61500 () Bool)

(assert (=> b!127293 (=> (not res!61500) (not e!83078))))

(assert (=> b!127293 (= res!61500 e!83084)))

(declare-fun c!23345 () Bool)

(assert (=> b!127293 (= c!23345 (not (= (bvand lt!65100 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38487 c!23348) b!127289))

(assert (= (and d!38487 (not c!23348)) b!127276))

(assert (= (and b!127276 c!23346) b!127286))

(assert (= (and b!127276 (not c!23346)) b!127282))

(assert (= (and b!127282 c!23349) b!127273))

(assert (= (and b!127282 (not c!23349)) b!127288))

(assert (= (or b!127273 b!127288) bm!13717))

(assert (= (or b!127286 bm!13717) bm!13713))

(assert (= (or b!127286 b!127273) bm!13712))

(assert (= (or b!127289 bm!13713) bm!13714))

(assert (= (or b!127289 bm!13712) bm!13716))

(assert (= (and d!38487 res!61506) b!127283))

(assert (= (and d!38487 c!23347) b!127287))

(assert (= (and d!38487 (not c!23347)) b!127280))

(assert (= (and d!38487 res!61505) b!127277))

(assert (= (and b!127277 res!61504) b!127285))

(assert (= (and b!127277 (not res!61502)) b!127279))

(assert (= (and b!127279 res!61501) b!127284))

(assert (= (and b!127277 res!61498) b!127293))

(assert (= (and b!127293 c!23345) b!127281))

(assert (= (and b!127293 (not c!23345)) b!127290))

(assert (= (and b!127281 res!61499) b!127275))

(assert (= (or b!127281 b!127290) bm!13715))

(assert (= (and b!127293 res!61500) b!127291))

(assert (= (and b!127291 c!23350) b!127278))

(assert (= (and b!127291 (not c!23350)) b!127292))

(assert (= (and b!127278 res!61503) b!127274))

(assert (= (or b!127278 b!127292) bm!13718))

(declare-fun b_lambda!5603 () Bool)

(assert (=> (not b_lambda!5603) (not b!127284)))

(assert (=> b!127284 t!6042))

(declare-fun b_and!7837 () Bool)

(assert (= b_and!7833 (and (=> t!6042 result!3843) b_and!7837)))

(assert (=> b!127284 t!6044))

(declare-fun b_and!7839 () Bool)

(assert (= b_and!7835 (and (=> t!6044 result!3845) b_and!7839)))

(assert (=> b!127287 m!146831))

(declare-fun m!148677 () Bool)

(assert (=> b!127287 m!148677))

(declare-fun m!148679 () Bool)

(assert (=> b!127287 m!148679))

(declare-fun m!148681 () Bool)

(assert (=> b!127287 m!148681))

(declare-fun m!148683 () Bool)

(assert (=> b!127287 m!148683))

(declare-fun m!148685 () Bool)

(assert (=> b!127287 m!148685))

(declare-fun m!148687 () Bool)

(assert (=> b!127287 m!148687))

(declare-fun m!148689 () Bool)

(assert (=> b!127287 m!148689))

(assert (=> b!127287 m!146831))

(declare-fun m!148691 () Bool)

(assert (=> b!127287 m!148691))

(declare-fun m!148693 () Bool)

(assert (=> b!127287 m!148693))

(declare-fun m!148695 () Bool)

(assert (=> b!127287 m!148695))

(assert (=> b!127287 m!148687))

(assert (=> b!127287 m!146831))

(declare-fun m!148697 () Bool)

(assert (=> b!127287 m!148697))

(assert (=> b!127287 m!148693))

(declare-fun m!148699 () Bool)

(assert (=> b!127287 m!148699))

(declare-fun m!148701 () Bool)

(assert (=> b!127287 m!148701))

(declare-fun m!148703 () Bool)

(assert (=> b!127287 m!148703))

(assert (=> b!127287 m!148681))

(declare-fun m!148705 () Bool)

(assert (=> b!127287 m!148705))

(assert (=> b!127287 m!148685))

(declare-fun m!148707 () Bool)

(assert (=> b!127287 m!148707))

(assert (=> b!127287 m!147085))

(assert (=> b!127285 m!147085))

(assert (=> b!127285 m!147085))

(assert (=> b!127285 m!147087))

(declare-fun m!148709 () Bool)

(assert (=> bm!13716 m!148709))

(declare-fun m!148711 () Bool)

(assert (=> b!127275 m!148711))

(assert (=> b!127284 m!147085))

(declare-fun m!148713 () Bool)

(assert (=> b!127284 m!148713))

(assert (=> b!127284 m!147085))

(assert (=> b!127284 m!147311))

(assert (=> b!127284 m!147311))

(assert (=> b!127284 m!147313))

(assert (=> b!127284 m!147315))

(assert (=> b!127284 m!147313))

(declare-fun m!148715 () Bool)

(assert (=> b!127274 m!148715))

(assert (=> bm!13714 m!146831))

(assert (=> bm!13714 m!148691))

(assert (=> b!127279 m!147085))

(assert (=> b!127279 m!147085))

(declare-fun m!148717 () Bool)

(assert (=> b!127279 m!148717))

(declare-fun m!148719 () Bool)

(assert (=> bm!13715 m!148719))

(declare-fun m!148721 () Bool)

(assert (=> b!127289 m!148721))

(declare-fun m!148723 () Bool)

(assert (=> bm!13718 m!148723))

(assert (=> b!127283 m!147085))

(assert (=> b!127283 m!147085))

(assert (=> b!127283 m!147087))

(assert (=> d!38487 m!147061))

(assert (=> d!38049 d!38487))

(declare-fun d!38489 () Bool)

(assert (=> d!38489 (= (isDefined!119 (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) (not (isEmpty!400 (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(declare-fun bs!5263 () Bool)

(assert (= bs!5263 d!38489))

(assert (=> bs!5263 m!147131))

(declare-fun m!148725 () Bool)

(assert (=> bs!5263 m!148725))

(assert (=> b!126404 d!38489))

(declare-fun b!127294 () Bool)

(declare-fun e!83087 () Option!171)

(assert (=> b!127294 (= e!83087 (Some!170 (_2!1282 (h!2290 (toList!839 e!82505)))))))

(declare-fun b!127296 () Bool)

(declare-fun e!83088 () Option!171)

(assert (=> b!127296 (= e!83088 (getValueByKey!165 (t!6030 (toList!839 e!82505)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun c!23351 () Bool)

(declare-fun d!38491 () Bool)

(assert (=> d!38491 (= c!23351 (and ((_ is Cons!1688) (toList!839 e!82505)) (= (_1!1282 (h!2290 (toList!839 e!82505))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38491 (= (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!83087)))

(declare-fun b!127297 () Bool)

(assert (=> b!127297 (= e!83088 None!169)))

(declare-fun b!127295 () Bool)

(assert (=> b!127295 (= e!83087 e!83088)))

(declare-fun c!23352 () Bool)

(assert (=> b!127295 (= c!23352 (and ((_ is Cons!1688) (toList!839 e!82505)) (not (= (_1!1282 (h!2290 (toList!839 e!82505))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))))

(assert (= (and d!38491 c!23351) b!127294))

(assert (= (and d!38491 (not c!23351)) b!127295))

(assert (= (and b!127295 c!23352) b!127296))

(assert (= (and b!127295 (not c!23352)) b!127297))

(assert (=> b!127296 m!146811))

(declare-fun m!148727 () Bool)

(assert (=> b!127296 m!148727))

(assert (=> b!126404 d!38491))

(declare-fun b!127298 () Bool)

(declare-fun e!83091 () Bool)

(declare-fun e!83090 () Bool)

(assert (=> b!127298 (= e!83091 e!83090)))

(declare-fun res!61508 () Bool)

(assert (=> b!127298 (=> (not res!61508) (not e!83090))))

(declare-fun e!83089 () Bool)

(assert (=> b!127298 (= res!61508 (not e!83089))))

(declare-fun res!61509 () Bool)

(assert (=> b!127298 (=> (not res!61509) (not e!83089))))

(assert (=> b!127298 (= res!61509 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun b!127300 () Bool)

(declare-fun e!83092 () Bool)

(declare-fun call!13722 () Bool)

(assert (=> b!127300 (= e!83092 call!13722)))

(declare-fun b!127301 () Bool)

(assert (=> b!127301 (= e!83089 (contains!870 Nil!1691 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun d!38493 () Bool)

(declare-fun res!61507 () Bool)

(assert (=> d!38493 (=> res!61507 e!83091)))

(assert (=> d!38493 (= res!61507 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(assert (=> d!38493 (= (arrayNoDuplicates!0 (_keys!4514 (_2!1283 lt!65108)) #b00000000000000000000000000000000 Nil!1691) e!83091)))

(declare-fun b!127299 () Bool)

(assert (=> b!127299 (= e!83092 call!13722)))

(declare-fun b!127302 () Bool)

(assert (=> b!127302 (= e!83090 e!83092)))

(declare-fun c!23353 () Bool)

(assert (=> b!127302 (= c!23353 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun bm!13719 () Bool)

(assert (=> bm!13719 (= call!13722 (arrayNoDuplicates!0 (_keys!4514 (_2!1283 lt!65108)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23353 (Cons!1690 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000) Nil!1691) Nil!1691)))))

(assert (= (and d!38493 (not res!61507)) b!127298))

(assert (= (and b!127298 res!61509) b!127301))

(assert (= (and b!127298 res!61508) b!127302))

(assert (= (and b!127302 c!23353) b!127299))

(assert (= (and b!127302 (not c!23353)) b!127300))

(assert (= (or b!127299 b!127300) bm!13719))

(assert (=> b!127298 m!147627))

(assert (=> b!127298 m!147627))

(assert (=> b!127298 m!147629))

(assert (=> b!127301 m!147627))

(assert (=> b!127301 m!147627))

(declare-fun m!148729 () Bool)

(assert (=> b!127301 m!148729))

(assert (=> b!127302 m!147627))

(assert (=> b!127302 m!147627))

(assert (=> b!127302 m!147629))

(assert (=> bm!13719 m!147627))

(declare-fun m!148731 () Bool)

(assert (=> bm!13719 m!148731))

(assert (=> b!126650 d!38493))

(assert (=> b!126439 d!38167))

(declare-fun lt!65798 () Bool)

(declare-fun d!38495 () Bool)

(assert (=> d!38495 (= lt!65798 (select (content!125 (toList!839 lt!65384)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!83094 () Bool)

(assert (=> d!38495 (= lt!65798 e!83094)))

(declare-fun res!61511 () Bool)

(assert (=> d!38495 (=> (not res!61511) (not e!83094))))

(assert (=> d!38495 (= res!61511 ((_ is Cons!1688) (toList!839 lt!65384)))))

(assert (=> d!38495 (= (contains!869 (toList!839 lt!65384) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65798)))

(declare-fun b!127303 () Bool)

(declare-fun e!83093 () Bool)

(assert (=> b!127303 (= e!83094 e!83093)))

(declare-fun res!61510 () Bool)

(assert (=> b!127303 (=> res!61510 e!83093)))

(assert (=> b!127303 (= res!61510 (= (h!2290 (toList!839 lt!65384)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!127304 () Bool)

(assert (=> b!127304 (= e!83093 (contains!869 (t!6030 (toList!839 lt!65384)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38495 res!61511) b!127303))

(assert (= (and b!127303 (not res!61510)) b!127304))

(declare-fun m!148733 () Bool)

(assert (=> d!38495 m!148733))

(declare-fun m!148735 () Bool)

(assert (=> d!38495 m!148735))

(declare-fun m!148737 () Bool)

(assert (=> b!127304 m!148737))

(assert (=> b!126647 d!38495))

(declare-fun b!127323 () Bool)

(declare-fun lt!65804 () SeekEntryResult!273)

(assert (=> b!127323 (and (bvsge (index!3249 lt!65804) #b00000000000000000000000000000000) (bvslt (index!3249 lt!65804) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun e!83105 () Bool)

(assert (=> b!127323 (= e!83105 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65804)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127324 () Bool)

(declare-fun e!83106 () SeekEntryResult!273)

(assert (=> b!127324 (= e!83106 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) #b00000000000000000000000000000000 (mask!7037 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!127325 () Bool)

(declare-fun e!83109 () Bool)

(assert (=> b!127325 (= e!83109 (bvsge (x!14965 lt!65804) #b01111111111111111111111111111110))))

(declare-fun b!127326 () Bool)

(assert (=> b!127326 (= e!83106 (Intermediate!273 false (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun e!83107 () SeekEntryResult!273)

(declare-fun b!127327 () Bool)

(assert (=> b!127327 (= e!83107 (Intermediate!273 true (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!127328 () Bool)

(assert (=> b!127328 (and (bvsge (index!3249 lt!65804) #b00000000000000000000000000000000) (bvslt (index!3249 lt!65804) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61520 () Bool)

(assert (=> b!127328 (= res!61520 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65804)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127328 (=> res!61520 e!83105)))

(declare-fun b!127329 () Bool)

(assert (=> b!127329 (and (bvsge (index!3249 lt!65804) #b00000000000000000000000000000000) (bvslt (index!3249 lt!65804) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun res!61519 () Bool)

(assert (=> b!127329 (= res!61519 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65804)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (=> b!127329 (=> res!61519 e!83105)))

(declare-fun e!83108 () Bool)

(assert (=> b!127329 (= e!83108 e!83105)))

(declare-fun b!127330 () Bool)

(assert (=> b!127330 (= e!83109 e!83108)))

(declare-fun res!61518 () Bool)

(assert (=> b!127330 (= res!61518 (and ((_ is Intermediate!273) lt!65804) (not (undefined!1085 lt!65804)) (bvslt (x!14965 lt!65804) #b01111111111111111111111111111110) (bvsge (x!14965 lt!65804) #b00000000000000000000000000000000) (bvsge (x!14965 lt!65804) #b00000000000000000000000000000000)))))

(assert (=> b!127330 (=> (not res!61518) (not e!83108))))

(declare-fun d!38497 () Bool)

(assert (=> d!38497 e!83109))

(declare-fun c!23361 () Bool)

(assert (=> d!38497 (= c!23361 (and ((_ is Intermediate!273) lt!65804) (undefined!1085 lt!65804)))))

(assert (=> d!38497 (= lt!65804 e!83107)))

(declare-fun c!23360 () Bool)

(assert (=> d!38497 (= c!23360 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!65803 () (_ BitVec 64))

(assert (=> d!38497 (= lt!65803 (select (arr!2212 (_keys!4514 newMap!16)) (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16))))))

(assert (=> d!38497 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)) lt!65804)))

(declare-fun b!127331 () Bool)

(assert (=> b!127331 (= e!83107 e!83106)))

(declare-fun c!23362 () Bool)

(assert (=> b!127331 (= c!23362 (or (= lt!65803 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) (= (bvadd lt!65803 lt!65803) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38497 c!23360) b!127327))

(assert (= (and d!38497 (not c!23360)) b!127331))

(assert (= (and b!127331 c!23362) b!127326))

(assert (= (and b!127331 (not c!23362)) b!127324))

(assert (= (and d!38497 c!23361) b!127325))

(assert (= (and d!38497 (not c!23361)) b!127330))

(assert (= (and b!127330 res!61518) b!127329))

(assert (= (and b!127329 (not res!61519)) b!127328))

(assert (= (and b!127328 (not res!61520)) b!127323))

(declare-fun m!148739 () Bool)

(assert (=> b!127323 m!148739))

(assert (=> b!127328 m!148739))

(assert (=> d!38497 m!147099))

(declare-fun m!148741 () Bool)

(assert (=> d!38497 m!148741))

(assert (=> d!38497 m!147061))

(assert (=> b!127329 m!148739))

(assert (=> b!127324 m!147099))

(declare-fun m!148743 () Bool)

(assert (=> b!127324 m!148743))

(assert (=> b!127324 m!148743))

(assert (=> b!127324 m!146811))

(declare-fun m!148745 () Bool)

(assert (=> b!127324 m!148745))

(assert (=> d!38063 d!38497))

(declare-fun d!38499 () Bool)

(declare-fun lt!65810 () (_ BitVec 32))

(declare-fun lt!65809 () (_ BitVec 32))

(assert (=> d!38499 (= lt!65810 (bvmul (bvxor lt!65809 (bvlshr lt!65809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!38499 (= lt!65809 ((_ extract 31 0) (bvand (bvxor (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvlshr (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!38499 (and (bvsge (mask!7037 newMap!16) #b00000000000000000000000000000000) (let ((res!61521 (let ((h!2293 ((_ extract 31 0) (bvand (bvxor (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (bvlshr (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15069 (bvmul (bvxor h!2293 (bvlshr h!2293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15069 (bvlshr x!15069 #b00000000000000000000000000001101)) (mask!7037 newMap!16)))))) (and (bvslt res!61521 (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001)) (bvsge res!61521 #b00000000000000000000000000000000))))))

(assert (=> d!38499 (= (toIndex!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (mask!7037 newMap!16)) (bvand (bvxor lt!65810 (bvlshr lt!65810 #b00000000000000000000000000001101)) (mask!7037 newMap!16)))))

(assert (=> d!38063 d!38499))

(assert (=> d!38063 d!38241))

(declare-fun lt!65811 () Bool)

(declare-fun d!38501 () Bool)

(assert (=> d!38501 (= lt!65811 (select (content!125 (toList!839 lt!65171)) (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun e!83111 () Bool)

(assert (=> d!38501 (= lt!65811 e!83111)))

(declare-fun res!61523 () Bool)

(assert (=> d!38501 (=> (not res!61523) (not e!83111))))

(assert (=> d!38501 (= res!61523 ((_ is Cons!1688) (toList!839 lt!65171)))))

(assert (=> d!38501 (= (contains!869 (toList!839 lt!65171) (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65811)))

(declare-fun b!127332 () Bool)

(declare-fun e!83110 () Bool)

(assert (=> b!127332 (= e!83111 e!83110)))

(declare-fun res!61522 () Bool)

(assert (=> b!127332 (=> res!61522 e!83110)))

(assert (=> b!127332 (= res!61522 (= (h!2290 (toList!839 lt!65171)) (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127333 () Bool)

(assert (=> b!127333 (= e!83110 (contains!869 (t!6030 (toList!839 lt!65171)) (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38501 res!61523) b!127332))

(assert (= (and b!127332 (not res!61522)) b!127333))

(declare-fun m!148747 () Bool)

(assert (=> d!38501 m!148747))

(declare-fun m!148749 () Bool)

(assert (=> d!38501 m!148749))

(declare-fun m!148751 () Bool)

(assert (=> b!127333 m!148751))

(assert (=> b!126441 d!38501))

(declare-fun d!38503 () Bool)

(declare-fun e!83112 () Bool)

(assert (=> d!38503 e!83112))

(declare-fun res!61524 () Bool)

(assert (=> d!38503 (=> (not res!61524) (not e!83112))))

(declare-fun lt!65814 () ListLongMap!1647)

(assert (=> d!38503 (= res!61524 (contains!867 lt!65814 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun lt!65812 () List!1692)

(assert (=> d!38503 (= lt!65814 (ListLongMap!1648 lt!65812))))

(declare-fun lt!65815 () Unit!3922)

(declare-fun lt!65813 () Unit!3922)

(assert (=> d!38503 (= lt!65815 lt!65813)))

(assert (=> d!38503 (= (getValueByKey!165 lt!65812 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38503 (= lt!65813 (lemmaContainsTupThenGetReturnValue!83 lt!65812 (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38503 (= lt!65812 (insertStrictlySorted!86 (toList!839 call!13638) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38503 (= (+!158 call!13638 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) lt!65814)))

(declare-fun b!127334 () Bool)

(declare-fun res!61525 () Bool)

(assert (=> b!127334 (=> (not res!61525) (not e!83112))))

(assert (=> b!127334 (= res!61525 (= (getValueByKey!165 (toList!839 lt!65814) (_1!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun b!127335 () Bool)

(assert (=> b!127335 (= e!83112 (contains!869 (toList!839 lt!65814) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(assert (= (and d!38503 res!61524) b!127334))

(assert (= (and b!127334 res!61525) b!127335))

(declare-fun m!148753 () Bool)

(assert (=> d!38503 m!148753))

(declare-fun m!148755 () Bool)

(assert (=> d!38503 m!148755))

(declare-fun m!148757 () Bool)

(assert (=> d!38503 m!148757))

(declare-fun m!148759 () Bool)

(assert (=> d!38503 m!148759))

(declare-fun m!148761 () Bool)

(assert (=> b!127334 m!148761))

(declare-fun m!148763 () Bool)

(assert (=> b!127335 m!148763))

(assert (=> b!126678 d!38503))

(declare-fun d!38505 () Bool)

(declare-fun e!83113 () Bool)

(assert (=> d!38505 e!83113))

(declare-fun res!61526 () Bool)

(assert (=> d!38505 (=> (not res!61526) (not e!83113))))

(declare-fun lt!65818 () ListLongMap!1647)

(assert (=> d!38505 (= res!61526 (contains!867 lt!65818 (_1!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun lt!65816 () List!1692)

(assert (=> d!38505 (= lt!65818 (ListLongMap!1648 lt!65816))))

(declare-fun lt!65819 () Unit!3922)

(declare-fun lt!65817 () Unit!3922)

(assert (=> d!38505 (= lt!65819 lt!65817)))

(assert (=> d!38505 (= (getValueByKey!165 lt!65816 (_1!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38505 (= lt!65817 (lemmaContainsTupThenGetReturnValue!83 lt!65816 (_1!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38505 (= lt!65816 (insertStrictlySorted!86 (toList!839 (ite c!23139 call!13607 (ite c!23137 call!13602 call!13603))) (_1!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38505 (= (+!158 (ite c!23139 call!13607 (ite c!23137 call!13602 call!13603)) (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) lt!65818)))

(declare-fun b!127336 () Bool)

(declare-fun res!61527 () Bool)

(assert (=> b!127336 (=> (not res!61527) (not e!83113))))

(assert (=> b!127336 (= res!61527 (= (getValueByKey!165 (toList!839 lt!65818) (_1!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))))

(declare-fun b!127337 () Bool)

(assert (=> b!127337 (= e!83113 (contains!869 (toList!839 lt!65818) (ite (or c!23139 c!23137) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (= (and d!38505 res!61526) b!127336))

(assert (= (and b!127336 res!61527) b!127337))

(declare-fun m!148765 () Bool)

(assert (=> d!38505 m!148765))

(declare-fun m!148767 () Bool)

(assert (=> d!38505 m!148767))

(declare-fun m!148769 () Bool)

(assert (=> d!38505 m!148769))

(declare-fun m!148771 () Bool)

(assert (=> d!38505 m!148771))

(declare-fun m!148773 () Bool)

(assert (=> b!127336 m!148773))

(declare-fun m!148775 () Bool)

(assert (=> b!127337 m!148775))

(assert (=> bm!13603 d!38505))

(declare-fun d!38507 () Bool)

(assert (=> d!38507 (isDefined!119 (getValueByKey!165 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun lt!65820 () Unit!3922)

(assert (=> d!38507 (= lt!65820 (choose!768 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(declare-fun e!83114 () Bool)

(assert (=> d!38507 e!83114))

(declare-fun res!61528 () Bool)

(assert (=> d!38507 (=> (not res!61528) (not e!83114))))

(assert (=> d!38507 (= res!61528 (isStrictlySorted!312 (toList!839 e!82505)))))

(assert (=> d!38507 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) lt!65820)))

(declare-fun b!127338 () Bool)

(assert (=> b!127338 (= e!83114 (containsKey!169 (toList!839 e!82505) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38507 res!61528) b!127338))

(assert (=> d!38507 m!146811))

(assert (=> d!38507 m!147131))

(assert (=> d!38507 m!147131))

(assert (=> d!38507 m!147133))

(assert (=> d!38507 m!146811))

(declare-fun m!148777 () Bool)

(assert (=> d!38507 m!148777))

(declare-fun m!148779 () Bool)

(assert (=> d!38507 m!148779))

(assert (=> b!127338 m!146811))

(assert (=> b!127338 m!147127))

(assert (=> b!126402 d!38507))

(assert (=> b!126402 d!38489))

(assert (=> b!126402 d!38491))

(assert (=> d!38113 d!38241))

(declare-fun d!38509 () Bool)

(assert (=> d!38509 (= (get!1446 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3122 (getValueByKey!165 (toList!839 lt!65010) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38123 d!38509))

(assert (=> d!38123 d!38291))

(declare-fun d!38511 () Bool)

(assert (=> d!38511 (contains!867 (getCurrentListMap!509 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))

(assert (=> d!38511 true))

(declare-fun _$16!142 () Unit!3922)

(assert (=> d!38511 (= (choose!771 (_keys!4514 newMap!16) lt!65098 (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (defaultEntry!2782 newMap!16)) _$16!142)))

(declare-fun bs!5264 () Bool)

(assert (= bs!5264 d!38511))

(assert (=> bs!5264 m!147337))

(assert (=> bs!5264 m!147013))

(assert (=> bs!5264 m!147337))

(assert (=> bs!5264 m!147013))

(assert (=> bs!5264 m!147339))

(assert (=> d!38119 d!38511))

(assert (=> d!38119 d!38241))

(declare-fun d!38513 () Bool)

(assert (=> d!38513 (= (apply!111 (+!158 lt!65352 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) lt!65355) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65352 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))) lt!65355)))))

(declare-fun bs!5265 () Bool)

(assert (= bs!5265 d!38513))

(declare-fun m!148781 () Bool)

(assert (=> bs!5265 m!148781))

(assert (=> bs!5265 m!148781))

(declare-fun m!148783 () Bool)

(assert (=> bs!5265 m!148783))

(assert (=> b!126612 d!38513))

(declare-fun d!38515 () Bool)

(assert (=> d!38515 (= (apply!111 lt!65352 lt!65355) (get!1446 (getValueByKey!165 (toList!839 lt!65352) lt!65355)))))

(declare-fun bs!5266 () Bool)

(assert (= bs!5266 d!38515))

(declare-fun m!148785 () Bool)

(assert (=> bs!5266 m!148785))

(assert (=> bs!5266 m!148785))

(declare-fun m!148787 () Bool)

(assert (=> bs!5266 m!148787))

(assert (=> b!126612 d!38515))

(declare-fun d!38517 () Bool)

(declare-fun e!83115 () Bool)

(assert (=> d!38517 e!83115))

(declare-fun res!61529 () Bool)

(assert (=> d!38517 (=> (not res!61529) (not e!83115))))

(declare-fun lt!65823 () ListLongMap!1647)

(assert (=> d!38517 (= res!61529 (contains!867 lt!65823 (_1!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65821 () List!1692)

(assert (=> d!38517 (= lt!65823 (ListLongMap!1648 lt!65821))))

(declare-fun lt!65824 () Unit!3922)

(declare-fun lt!65822 () Unit!3922)

(assert (=> d!38517 (= lt!65824 lt!65822)))

(assert (=> d!38517 (= (getValueByKey!165 lt!65821 (_1!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38517 (= lt!65822 (lemmaContainsTupThenGetReturnValue!83 lt!65821 (_1!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38517 (= lt!65821 (insertStrictlySorted!86 (toList!839 lt!65367) (_1!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38517 (= (+!158 lt!65367 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65823)))

(declare-fun b!127339 () Bool)

(declare-fun res!61530 () Bool)

(assert (=> b!127339 (=> (not res!61530) (not e!83115))))

(assert (=> b!127339 (= res!61530 (= (getValueByKey!165 (toList!839 lt!65823) (_1!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127340 () Bool)

(assert (=> b!127340 (= e!83115 (contains!869 (toList!839 lt!65823) (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38517 res!61529) b!127339))

(assert (= (and b!127339 res!61530) b!127340))

(declare-fun m!148789 () Bool)

(assert (=> d!38517 m!148789))

(declare-fun m!148791 () Bool)

(assert (=> d!38517 m!148791))

(declare-fun m!148793 () Bool)

(assert (=> d!38517 m!148793))

(declare-fun m!148795 () Bool)

(assert (=> d!38517 m!148795))

(declare-fun m!148797 () Bool)

(assert (=> b!127339 m!148797))

(declare-fun m!148799 () Bool)

(assert (=> b!127340 m!148799))

(assert (=> b!126612 d!38517))

(declare-fun d!38519 () Bool)

(assert (=> d!38519 (= (apply!111 lt!65367 lt!65362) (get!1446 (getValueByKey!165 (toList!839 lt!65367) lt!65362)))))

(declare-fun bs!5267 () Bool)

(assert (= bs!5267 d!38519))

(declare-fun m!148801 () Bool)

(assert (=> bs!5267 m!148801))

(assert (=> bs!5267 m!148801))

(declare-fun m!148803 () Bool)

(assert (=> bs!5267 m!148803))

(assert (=> b!126612 d!38519))

(declare-fun d!38521 () Bool)

(assert (=> d!38521 (= (apply!111 (+!158 lt!65352 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) lt!65355) (apply!111 lt!65352 lt!65355))))

(declare-fun lt!65825 () Unit!3922)

(assert (=> d!38521 (= lt!65825 (choose!769 lt!65352 lt!65350 (zeroValue!2645 newMap!16) lt!65355))))

(declare-fun e!83116 () Bool)

(assert (=> d!38521 e!83116))

(declare-fun res!61531 () Bool)

(assert (=> d!38521 (=> (not res!61531) (not e!83116))))

(assert (=> d!38521 (= res!61531 (contains!867 lt!65352 lt!65355))))

(assert (=> d!38521 (= (addApplyDifferent!87 lt!65352 lt!65350 (zeroValue!2645 newMap!16) lt!65355) lt!65825)))

(declare-fun b!127341 () Bool)

(assert (=> b!127341 (= e!83116 (not (= lt!65355 lt!65350)))))

(assert (= (and d!38521 res!61531) b!127341))

(declare-fun m!148805 () Bool)

(assert (=> d!38521 m!148805))

(declare-fun m!148807 () Bool)

(assert (=> d!38521 m!148807))

(assert (=> d!38521 m!147439))

(assert (=> d!38521 m!147445))

(assert (=> d!38521 m!147451))

(assert (=> d!38521 m!147439))

(assert (=> b!126612 d!38521))

(declare-fun d!38523 () Bool)

(assert (=> d!38523 (= (apply!111 (+!158 lt!65368 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65360) (apply!111 lt!65368 lt!65360))))

(declare-fun lt!65826 () Unit!3922)

(assert (=> d!38523 (= lt!65826 (choose!769 lt!65368 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65360))))

(declare-fun e!83117 () Bool)

(assert (=> d!38523 e!83117))

(declare-fun res!61532 () Bool)

(assert (=> d!38523 (=> (not res!61532) (not e!83117))))

(assert (=> d!38523 (= res!61532 (contains!867 lt!65368 lt!65360))))

(assert (=> d!38523 (= (addApplyDifferent!87 lt!65368 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65360) lt!65826)))

(declare-fun b!127342 () Bool)

(assert (=> b!127342 (= e!83117 (not (= lt!65360 lt!65361)))))

(assert (= (and d!38523 res!61532) b!127342))

(declare-fun m!148809 () Bool)

(assert (=> d!38523 m!148809))

(declare-fun m!148811 () Bool)

(assert (=> d!38523 m!148811))

(assert (=> d!38523 m!147431))

(assert (=> d!38523 m!147453))

(assert (=> d!38523 m!147447))

(assert (=> d!38523 m!147431))

(assert (=> b!126612 d!38523))

(declare-fun d!38525 () Bool)

(declare-fun e!83118 () Bool)

(assert (=> d!38525 e!83118))

(declare-fun res!61533 () Bool)

(assert (=> d!38525 (=> (not res!61533) (not e!83118))))

(declare-fun lt!65829 () ListLongMap!1647)

(assert (=> d!38525 (= res!61533 (contains!867 lt!65829 (_1!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65827 () List!1692)

(assert (=> d!38525 (= lt!65829 (ListLongMap!1648 lt!65827))))

(declare-fun lt!65830 () Unit!3922)

(declare-fun lt!65828 () Unit!3922)

(assert (=> d!38525 (= lt!65830 lt!65828)))

(assert (=> d!38525 (= (getValueByKey!165 lt!65827 (_1!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38525 (= lt!65828 (lemmaContainsTupThenGetReturnValue!83 lt!65827 (_1!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38525 (= lt!65827 (insertStrictlySorted!86 (toList!839 lt!65352) (_1!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38525 (= (+!158 lt!65352 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))) lt!65829)))

(declare-fun b!127343 () Bool)

(declare-fun res!61534 () Bool)

(assert (=> b!127343 (=> (not res!61534) (not e!83118))))

(assert (=> b!127343 (= res!61534 (= (getValueByKey!165 (toList!839 lt!65829) (_1!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127344 () Bool)

(assert (=> b!127344 (= e!83118 (contains!869 (toList!839 lt!65829) (tuple2!2543 lt!65350 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38525 res!61533) b!127343))

(assert (= (and b!127343 res!61534) b!127344))

(declare-fun m!148813 () Bool)

(assert (=> d!38525 m!148813))

(declare-fun m!148815 () Bool)

(assert (=> d!38525 m!148815))

(declare-fun m!148817 () Bool)

(assert (=> d!38525 m!148817))

(declare-fun m!148819 () Bool)

(assert (=> d!38525 m!148819))

(declare-fun m!148821 () Bool)

(assert (=> b!127343 m!148821))

(declare-fun m!148823 () Bool)

(assert (=> b!127344 m!148823))

(assert (=> b!126612 d!38525))

(declare-fun d!38527 () Bool)

(assert (=> d!38527 (= (apply!111 (+!158 lt!65367 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65362) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65367 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65362)))))

(declare-fun bs!5268 () Bool)

(assert (= bs!5268 d!38527))

(declare-fun m!148825 () Bool)

(assert (=> bs!5268 m!148825))

(assert (=> bs!5268 m!148825))

(declare-fun m!148827 () Bool)

(assert (=> bs!5268 m!148827))

(assert (=> b!126612 d!38527))

(declare-fun d!38529 () Bool)

(declare-fun e!83119 () Bool)

(assert (=> d!38529 e!83119))

(declare-fun res!61535 () Bool)

(assert (=> d!38529 (=> (not res!61535) (not e!83119))))

(declare-fun lt!65833 () ListLongMap!1647)

(assert (=> d!38529 (= res!61535 (contains!867 lt!65833 (_1!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65831 () List!1692)

(assert (=> d!38529 (= lt!65833 (ListLongMap!1648 lt!65831))))

(declare-fun lt!65834 () Unit!3922)

(declare-fun lt!65832 () Unit!3922)

(assert (=> d!38529 (= lt!65834 lt!65832)))

(assert (=> d!38529 (= (getValueByKey!165 lt!65831 (_1!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38529 (= lt!65832 (lemmaContainsTupThenGetReturnValue!83 lt!65831 (_1!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38529 (= lt!65831 (insertStrictlySorted!86 (toList!839 lt!65368) (_1!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38529 (= (+!158 lt!65368 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65833)))

(declare-fun b!127345 () Bool)

(declare-fun res!61536 () Bool)

(assert (=> b!127345 (=> (not res!61536) (not e!83119))))

(assert (=> b!127345 (= res!61536 (= (getValueByKey!165 (toList!839 lt!65833) (_1!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!170 (_2!1282 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127346 () Bool)

(assert (=> b!127346 (= e!83119 (contains!869 (toList!839 lt!65833) (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38529 res!61535) b!127345))

(assert (= (and b!127345 res!61536) b!127346))

(declare-fun m!148829 () Bool)

(assert (=> d!38529 m!148829))

(declare-fun m!148831 () Bool)

(assert (=> d!38529 m!148831))

(declare-fun m!148833 () Bool)

(assert (=> d!38529 m!148833))

(declare-fun m!148835 () Bool)

(assert (=> d!38529 m!148835))

(declare-fun m!148837 () Bool)

(assert (=> b!127345 m!148837))

(declare-fun m!148839 () Bool)

(assert (=> b!127346 m!148839))

(assert (=> b!126612 d!38529))

(declare-fun d!38531 () Bool)

(declare-fun e!83120 () Bool)

(assert (=> d!38531 e!83120))

(declare-fun res!61537 () Bool)

(assert (=> d!38531 (=> res!61537 e!83120)))

(declare-fun lt!65837 () Bool)

(assert (=> d!38531 (= res!61537 (not lt!65837))))

(declare-fun lt!65835 () Bool)

(assert (=> d!38531 (= lt!65837 lt!65835)))

(declare-fun lt!65838 () Unit!3922)

(declare-fun e!83121 () Unit!3922)

(assert (=> d!38531 (= lt!65838 e!83121)))

(declare-fun c!23363 () Bool)

(assert (=> d!38531 (= c!23363 lt!65835)))

(assert (=> d!38531 (= lt!65835 (containsKey!169 (toList!839 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) lt!65363))))

(assert (=> d!38531 (= (contains!867 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) lt!65363) lt!65837)))

(declare-fun b!127347 () Bool)

(declare-fun lt!65836 () Unit!3922)

(assert (=> b!127347 (= e!83121 lt!65836)))

(assert (=> b!127347 (= lt!65836 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) lt!65363))))

(assert (=> b!127347 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) lt!65363))))

(declare-fun b!127348 () Bool)

(declare-fun Unit!3971 () Unit!3922)

(assert (=> b!127348 (= e!83121 Unit!3971)))

(declare-fun b!127349 () Bool)

(assert (=> b!127349 (= e!83120 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) lt!65363)))))

(assert (= (and d!38531 c!23363) b!127347))

(assert (= (and d!38531 (not c!23363)) b!127348))

(assert (= (and d!38531 (not res!61537)) b!127349))

(declare-fun m!148841 () Bool)

(assert (=> d!38531 m!148841))

(declare-fun m!148843 () Bool)

(assert (=> b!127347 m!148843))

(declare-fun m!148845 () Bool)

(assert (=> b!127347 m!148845))

(assert (=> b!127347 m!148845))

(declare-fun m!148847 () Bool)

(assert (=> b!127347 m!148847))

(assert (=> b!127349 m!148845))

(assert (=> b!127349 m!148845))

(assert (=> b!127349 m!148847))

(assert (=> b!126612 d!38531))

(declare-fun d!38533 () Bool)

(assert (=> d!38533 (= (apply!111 (+!158 lt!65368 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65360) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65368 (tuple2!2543 lt!65361 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65360)))))

(declare-fun bs!5269 () Bool)

(assert (= bs!5269 d!38533))

(declare-fun m!148849 () Bool)

(assert (=> bs!5269 m!148849))

(assert (=> bs!5269 m!148849))

(declare-fun m!148851 () Bool)

(assert (=> bs!5269 m!148851))

(assert (=> b!126612 d!38533))

(declare-fun d!38535 () Bool)

(declare-fun e!83122 () Bool)

(assert (=> d!38535 e!83122))

(declare-fun res!61538 () Bool)

(assert (=> d!38535 (=> (not res!61538) (not e!83122))))

(declare-fun lt!65841 () ListLongMap!1647)

(assert (=> d!38535 (= res!61538 (contains!867 lt!65841 (_1!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65839 () List!1692)

(assert (=> d!38535 (= lt!65841 (ListLongMap!1648 lt!65839))))

(declare-fun lt!65842 () Unit!3922)

(declare-fun lt!65840 () Unit!3922)

(assert (=> d!38535 (= lt!65842 lt!65840)))

(assert (=> d!38535 (= (getValueByKey!165 lt!65839 (_1!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38535 (= lt!65840 (lemmaContainsTupThenGetReturnValue!83 lt!65839 (_1!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38535 (= lt!65839 (insertStrictlySorted!86 (toList!839 lt!65353) (_1!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38535 (= (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) lt!65841)))

(declare-fun b!127350 () Bool)

(declare-fun res!61539 () Bool)

(assert (=> b!127350 (=> (not res!61539) (not e!83122))))

(assert (=> b!127350 (= res!61539 (= (getValueByKey!165 (toList!839 lt!65841) (_1!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127351 () Bool)

(assert (=> b!127351 (= e!83122 (contains!869 (toList!839 lt!65841) (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38535 res!61538) b!127350))

(assert (= (and b!127350 res!61539) b!127351))

(declare-fun m!148853 () Bool)

(assert (=> d!38535 m!148853))

(declare-fun m!148855 () Bool)

(assert (=> d!38535 m!148855))

(declare-fun m!148857 () Bool)

(assert (=> d!38535 m!148857))

(declare-fun m!148859 () Bool)

(assert (=> d!38535 m!148859))

(declare-fun m!148861 () Bool)

(assert (=> b!127350 m!148861))

(declare-fun m!148863 () Bool)

(assert (=> b!127351 m!148863))

(assert (=> b!126612 d!38535))

(declare-fun d!38537 () Bool)

(assert (=> d!38537 (= (apply!111 lt!65368 lt!65360) (get!1446 (getValueByKey!165 (toList!839 lt!65368) lt!65360)))))

(declare-fun bs!5270 () Bool)

(assert (= bs!5270 d!38537))

(declare-fun m!148865 () Bool)

(assert (=> bs!5270 m!148865))

(assert (=> bs!5270 m!148865))

(declare-fun m!148867 () Bool)

(assert (=> bs!5270 m!148867))

(assert (=> b!126612 d!38537))

(declare-fun d!38539 () Bool)

(assert (=> d!38539 (contains!867 (+!158 lt!65353 (tuple2!2543 lt!65366 (zeroValue!2645 newMap!16))) lt!65363)))

(declare-fun lt!65843 () Unit!3922)

(assert (=> d!38539 (= lt!65843 (choose!770 lt!65353 lt!65366 (zeroValue!2645 newMap!16) lt!65363))))

(assert (=> d!38539 (contains!867 lt!65353 lt!65363)))

(assert (=> d!38539 (= (addStillContains!87 lt!65353 lt!65366 (zeroValue!2645 newMap!16) lt!65363) lt!65843)))

(declare-fun bs!5271 () Bool)

(assert (= bs!5271 d!38539))

(assert (=> bs!5271 m!147427))

(assert (=> bs!5271 m!147427))

(assert (=> bs!5271 m!147429))

(declare-fun m!148869 () Bool)

(assert (=> bs!5271 m!148869))

(declare-fun m!148871 () Bool)

(assert (=> bs!5271 m!148871))

(assert (=> b!126612 d!38539))

(assert (=> b!126612 d!38355))

(declare-fun d!38541 () Bool)

(assert (=> d!38541 (= (apply!111 (+!158 lt!65367 (tuple2!2543 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65362) (apply!111 lt!65367 lt!65362))))

(declare-fun lt!65844 () Unit!3922)

(assert (=> d!38541 (= lt!65844 (choose!769 lt!65367 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65362))))

(declare-fun e!83123 () Bool)

(assert (=> d!38541 e!83123))

(declare-fun res!61540 () Bool)

(assert (=> d!38541 (=> (not res!61540) (not e!83123))))

(assert (=> d!38541 (= res!61540 (contains!867 lt!65367 lt!65362))))

(assert (=> d!38541 (= (addApplyDifferent!87 lt!65367 lt!65351 (ite c!23087 (ite c!23089 (minValue!2645 newMap!16) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65362) lt!65844)))

(declare-fun b!127352 () Bool)

(assert (=> b!127352 (= e!83123 (not (= lt!65362 lt!65351)))))

(assert (= (and d!38541 res!61540) b!127352))

(declare-fun m!148873 () Bool)

(assert (=> d!38541 m!148873))

(declare-fun m!148875 () Bool)

(assert (=> d!38541 m!148875))

(assert (=> d!38541 m!147433))

(assert (=> d!38541 m!147435))

(assert (=> d!38541 m!147449))

(assert (=> d!38541 m!147433))

(assert (=> b!126612 d!38541))

(declare-fun d!38543 () Bool)

(declare-fun res!61541 () Bool)

(declare-fun e!83124 () Bool)

(assert (=> d!38543 (=> res!61541 e!83124)))

(assert (=> d!38543 (= res!61541 (and ((_ is Cons!1688) (toList!839 call!13567)) (= (_1!1282 (h!2290 (toList!839 call!13567))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))))

(assert (=> d!38543 (= (containsKey!169 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))) e!83124)))

(declare-fun b!127353 () Bool)

(declare-fun e!83125 () Bool)

(assert (=> b!127353 (= e!83124 e!83125)))

(declare-fun res!61542 () Bool)

(assert (=> b!127353 (=> (not res!61542) (not e!83125))))

(assert (=> b!127353 (= res!61542 (and (or (not ((_ is Cons!1688) (toList!839 call!13567))) (bvsle (_1!1282 (h!2290 (toList!839 call!13567))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))) ((_ is Cons!1688) (toList!839 call!13567)) (bvslt (_1!1282 (h!2290 (toList!839 call!13567))) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101)))))))

(declare-fun b!127354 () Bool)

(assert (=> b!127354 (= e!83125 (containsKey!169 (t!6030 (toList!839 call!13567)) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (= (and d!38543 (not res!61541)) b!127353))

(assert (= (and b!127353 res!61542) b!127354))

(assert (=> b!127354 m!147013))

(declare-fun m!148877 () Bool)

(assert (=> b!127354 m!148877))

(assert (=> d!38117 d!38543))

(declare-fun b!127355 () Bool)

(declare-fun e!83126 () (_ BitVec 32))

(declare-fun call!13723 () (_ BitVec 32))

(assert (=> b!127355 (= e!83126 (bvadd #b00000000000000000000000000000001 call!13723))))

(declare-fun bm!13720 () Bool)

(assert (=> bm!13720 (= call!13723 (arrayCountValidKeys!0 (_keys!4514 (_2!1283 lt!65108)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(declare-fun b!127356 () Bool)

(assert (=> b!127356 (= e!83126 call!13723)))

(declare-fun b!127357 () Bool)

(declare-fun e!83127 () (_ BitVec 32))

(assert (=> b!127357 (= e!83127 #b00000000000000000000000000000000)))

(declare-fun b!127358 () Bool)

(assert (=> b!127358 (= e!83127 e!83126)))

(declare-fun c!23364 () Bool)

(assert (=> b!127358 (= c!23364 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun d!38545 () Bool)

(declare-fun lt!65845 () (_ BitVec 32))

(assert (=> d!38545 (and (bvsge lt!65845 #b00000000000000000000000000000000) (bvsle lt!65845 (bvsub (size!2477 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(assert (=> d!38545 (= lt!65845 e!83127)))

(declare-fun c!23365 () Bool)

(assert (=> d!38545 (= c!23365 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(assert (=> d!38545 (and (bvsle #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2477 (_keys!4514 (_2!1283 lt!65108))) (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(assert (=> d!38545 (= (arrayCountValidKeys!0 (_keys!4514 (_2!1283 lt!65108)) #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))) lt!65845)))

(assert (= (and d!38545 c!23365) b!127357))

(assert (= (and d!38545 (not c!23365)) b!127358))

(assert (= (and b!127358 c!23364) b!127355))

(assert (= (and b!127358 (not c!23364)) b!127356))

(assert (= (or b!127355 b!127356) bm!13720))

(declare-fun m!148879 () Bool)

(assert (=> bm!13720 m!148879))

(assert (=> b!127358 m!147627))

(assert (=> b!127358 m!147627))

(assert (=> b!127358 m!147629))

(assert (=> b!126648 d!38545))

(declare-fun d!38547 () Bool)

(assert (=> d!38547 (= (apply!111 lt!65404 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (getValueByKey!165 (toList!839 lt!65404) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5272 () Bool)

(assert (= bs!5272 d!38547))

(assert (=> bs!5272 m!147085))

(assert (=> bs!5272 m!148143))

(assert (=> bs!5272 m!148143))

(declare-fun m!148881 () Bool)

(assert (=> bs!5272 m!148881))

(assert (=> b!126673 d!38547))

(declare-fun d!38549 () Bool)

(declare-fun c!23366 () Bool)

(assert (=> d!38549 (= c!23366 ((_ is ValueCellFull!1076) (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!83128 () V!3433)

(assert (=> d!38549 (= (get!1442 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83128)))

(declare-fun b!127359 () Bool)

(assert (=> b!127359 (= e!83128 (get!1444 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127360 () Bool)

(assert (=> b!127360 (= e!83128 (get!1445 (select (arr!2213 (ite c!23087 (_values!2765 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38549 c!23366) b!127359))

(assert (= (and d!38549 (not c!23366)) b!127360))

(assert (=> b!127359 m!147577))

(assert (=> b!127359 m!147313))

(declare-fun m!148883 () Bool)

(assert (=> b!127359 m!148883))

(assert (=> b!127360 m!147577))

(assert (=> b!127360 m!147313))

(declare-fun m!148885 () Bool)

(assert (=> b!127360 m!148885))

(assert (=> b!126673 d!38549))

(declare-fun d!38551 () Bool)

(assert (=> d!38551 (= (inRange!0 (ite c!23167 (index!3247 lt!65376) (index!3250 lt!65376)) (mask!7037 newMap!16)) (and (bvsge (ite c!23167 (index!3247 lt!65376) (index!3250 lt!65376)) #b00000000000000000000000000000000) (bvslt (ite c!23167 (index!3247 lt!65376) (index!3250 lt!65376)) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13630 d!38551))

(declare-fun d!38553 () Bool)

(declare-fun lt!65846 () Bool)

(assert (=> d!38553 (= lt!65846 (select (content!125 (toList!839 lt!65167)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun e!83130 () Bool)

(assert (=> d!38553 (= lt!65846 e!83130)))

(declare-fun res!61544 () Bool)

(assert (=> d!38553 (=> (not res!61544) (not e!83130))))

(assert (=> d!38553 (= res!61544 ((_ is Cons!1688) (toList!839 lt!65167)))))

(assert (=> d!38553 (= (contains!869 (toList!839 lt!65167) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65846)))

(declare-fun b!127361 () Bool)

(declare-fun e!83129 () Bool)

(assert (=> b!127361 (= e!83130 e!83129)))

(declare-fun res!61543 () Bool)

(assert (=> b!127361 (=> res!61543 e!83129)))

(assert (=> b!127361 (= res!61543 (= (h!2290 (toList!839 lt!65167)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127362 () Bool)

(assert (=> b!127362 (= e!83129 (contains!869 (t!6030 (toList!839 lt!65167)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38553 res!61544) b!127361))

(assert (= (and b!127361 (not res!61543)) b!127362))

(declare-fun m!148887 () Bool)

(assert (=> d!38553 m!148887))

(declare-fun m!148889 () Bool)

(assert (=> d!38553 m!148889))

(declare-fun m!148891 () Bool)

(assert (=> b!127362 m!148891))

(assert (=> b!126418 d!38553))

(assert (=> b!126583 d!38251))

(declare-fun d!38555 () Bool)

(declare-fun e!83131 () Bool)

(assert (=> d!38555 e!83131))

(declare-fun res!61545 () Bool)

(assert (=> d!38555 (=> (not res!61545) (not e!83131))))

(declare-fun lt!65849 () ListLongMap!1647)

(assert (=> d!38555 (= res!61545 (contains!867 lt!65849 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65847 () List!1692)

(assert (=> d!38555 (= lt!65849 (ListLongMap!1648 lt!65847))))

(declare-fun lt!65850 () Unit!3922)

(declare-fun lt!65848 () Unit!3922)

(assert (=> d!38555 (= lt!65850 lt!65848)))

(assert (=> d!38555 (= (getValueByKey!165 lt!65847 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38555 (= lt!65848 (lemmaContainsTupThenGetReturnValue!83 lt!65847 (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38555 (= lt!65847 (insertStrictlySorted!86 (toList!839 (map!1369 newMap!16)) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38555 (= (+!158 (map!1369 newMap!16) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65849)))

(declare-fun b!127363 () Bool)

(declare-fun res!61546 () Bool)

(assert (=> b!127363 (=> (not res!61546) (not e!83131))))

(assert (=> b!127363 (= res!61546 (= (getValueByKey!165 (toList!839 lt!65849) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127364 () Bool)

(assert (=> b!127364 (= e!83131 (contains!869 (toList!839 lt!65849) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38555 res!61545) b!127363))

(assert (= (and b!127363 res!61546) b!127364))

(declare-fun m!148893 () Bool)

(assert (=> d!38555 m!148893))

(declare-fun m!148895 () Bool)

(assert (=> d!38555 m!148895))

(declare-fun m!148897 () Bool)

(assert (=> d!38555 m!148897))

(declare-fun m!148899 () Bool)

(assert (=> d!38555 m!148899))

(declare-fun m!148901 () Bool)

(assert (=> b!127363 m!148901))

(declare-fun m!148903 () Bool)

(assert (=> b!127364 m!148903))

(assert (=> b!126583 d!38555))

(assert (=> b!126583 d!38035))

(declare-fun d!38557 () Bool)

(declare-fun e!83132 () Bool)

(assert (=> d!38557 e!83132))

(declare-fun res!61547 () Bool)

(assert (=> d!38557 (=> res!61547 e!83132)))

(declare-fun lt!65853 () Bool)

(assert (=> d!38557 (= res!61547 (not lt!65853))))

(declare-fun lt!65851 () Bool)

(assert (=> d!38557 (= lt!65853 lt!65851)))

(declare-fun lt!65854 () Unit!3922)

(declare-fun e!83133 () Unit!3922)

(assert (=> d!38557 (= lt!65854 e!83133)))

(declare-fun c!23367 () Bool)

(assert (=> d!38557 (= c!23367 lt!65851)))

(assert (=> d!38557 (= lt!65851 (containsKey!169 (toList!839 lt!65404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38557 (= (contains!867 lt!65404 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65853)))

(declare-fun b!127365 () Bool)

(declare-fun lt!65852 () Unit!3922)

(assert (=> b!127365 (= e!83133 lt!65852)))

(assert (=> b!127365 (= lt!65852 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127365 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127366 () Bool)

(declare-fun Unit!3972 () Unit!3922)

(assert (=> b!127366 (= e!83133 Unit!3972)))

(declare-fun b!127367 () Bool)

(assert (=> b!127367 (= e!83132 (isDefined!119 (getValueByKey!165 (toList!839 lt!65404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38557 c!23367) b!127365))

(assert (= (and d!38557 (not c!23367)) b!127366))

(assert (= (and d!38557 (not res!61547)) b!127367))

(declare-fun m!148905 () Bool)

(assert (=> d!38557 m!148905))

(declare-fun m!148907 () Bool)

(assert (=> b!127365 m!148907))

(assert (=> b!127365 m!148025))

(assert (=> b!127365 m!148025))

(declare-fun m!148909 () Bool)

(assert (=> b!127365 m!148909))

(assert (=> b!127367 m!148025))

(assert (=> b!127367 m!148025))

(assert (=> b!127367 m!148909))

(assert (=> bm!13634 d!38557))

(declare-fun d!38559 () Bool)

(declare-fun e!83134 () Bool)

(assert (=> d!38559 e!83134))

(declare-fun res!61548 () Bool)

(assert (=> d!38559 (=> res!61548 e!83134)))

(declare-fun lt!65857 () Bool)

(assert (=> d!38559 (= res!61548 (not lt!65857))))

(declare-fun lt!65855 () Bool)

(assert (=> d!38559 (= lt!65857 lt!65855)))

(declare-fun lt!65858 () Unit!3922)

(declare-fun e!83135 () Unit!3922)

(assert (=> d!38559 (= lt!65858 e!83135)))

(declare-fun c!23368 () Bool)

(assert (=> d!38559 (= c!23368 lt!65855)))

(assert (=> d!38559 (= lt!65855 (containsKey!169 (toList!839 lt!65225) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38559 (= (contains!867 lt!65225 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) lt!65857)))

(declare-fun b!127368 () Bool)

(declare-fun lt!65856 () Unit!3922)

(assert (=> b!127368 (= e!83135 lt!65856)))

(assert (=> b!127368 (= lt!65856 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65225) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127368 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127369 () Bool)

(declare-fun Unit!3973 () Unit!3922)

(assert (=> b!127369 (= e!83135 Unit!3973)))

(declare-fun b!127370 () Bool)

(assert (=> b!127370 (= e!83134 (isDefined!119 (getValueByKey!165 (toList!839 lt!65225) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38559 c!23368) b!127368))

(assert (= (and d!38559 (not c!23368)) b!127369))

(assert (= (and d!38559 (not res!61548)) b!127370))

(assert (=> d!38559 m!147085))

(declare-fun m!148911 () Bool)

(assert (=> d!38559 m!148911))

(assert (=> b!127368 m!147085))

(declare-fun m!148913 () Bool)

(assert (=> b!127368 m!148913))

(assert (=> b!127368 m!147085))

(assert (=> b!127368 m!148071))

(assert (=> b!127368 m!148071))

(declare-fun m!148915 () Bool)

(assert (=> b!127368 m!148915))

(assert (=> b!127370 m!147085))

(assert (=> b!127370 m!148071))

(assert (=> b!127370 m!148071))

(assert (=> b!127370 m!148915))

(assert (=> b!126512 d!38559))

(assert (=> bm!13615 d!38075))

(assert (=> d!38127 d!38063))

(declare-fun d!38561 () Bool)

(declare-fun e!83138 () Bool)

(assert (=> d!38561 e!83138))

(declare-fun res!61554 () Bool)

(assert (=> d!38561 (=> (not res!61554) (not e!83138))))

(declare-fun lt!65861 () SeekEntryResult!273)

(assert (=> d!38561 (= res!61554 ((_ is Found!273) lt!65861))))

(assert (=> d!38561 (= lt!65861 (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(assert (=> d!38561 true))

(declare-fun _$33!105 () Unit!3922)

(assert (=> d!38561 (= (choose!773 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) _$33!105)))

(declare-fun b!127375 () Bool)

(declare-fun res!61553 () Bool)

(assert (=> b!127375 (=> (not res!61553) (not e!83138))))

(assert (=> b!127375 (= res!61553 (inRange!0 (index!3248 lt!65861) (mask!7037 newMap!16)))))

(declare-fun b!127376 () Bool)

(assert (=> b!127376 (= e!83138 (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65861)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38561 res!61554) b!127375))

(assert (= (and b!127375 res!61553) b!127376))

(assert (=> d!38561 m!146811))

(assert (=> d!38561 m!147021))

(declare-fun m!148917 () Bool)

(assert (=> b!127375 m!148917))

(declare-fun m!148919 () Bool)

(assert (=> b!127376 m!148919))

(assert (=> d!38127 d!38561))

(assert (=> d!38127 d!38241))

(declare-fun b!127377 () Bool)

(declare-fun e!83139 () Option!171)

(assert (=> b!127377 (= e!83139 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65391)))))))

(declare-fun b!127379 () Bool)

(declare-fun e!83140 () Option!171)

(assert (=> b!127379 (= e!83140 (getValueByKey!165 (t!6030 (toList!839 lt!65391)) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!23369 () Bool)

(declare-fun d!38563 () Bool)

(assert (=> d!38563 (= c!23369 (and ((_ is Cons!1688) (toList!839 lt!65391)) (= (_1!1282 (h!2290 (toList!839 lt!65391))) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38563 (= (getValueByKey!165 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83139)))

(declare-fun b!127380 () Bool)

(assert (=> b!127380 (= e!83140 None!169)))

(declare-fun b!127378 () Bool)

(assert (=> b!127378 (= e!83139 e!83140)))

(declare-fun c!23370 () Bool)

(assert (=> b!127378 (= c!23370 (and ((_ is Cons!1688) (toList!839 lt!65391)) (not (= (_1!1282 (h!2290 (toList!839 lt!65391))) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!38563 c!23369) b!127377))

(assert (= (and d!38563 (not c!23369)) b!127378))

(assert (= (and b!127378 c!23370) b!127379))

(assert (= (and b!127378 (not c!23370)) b!127380))

(declare-fun m!148921 () Bool)

(assert (=> b!127379 m!148921))

(assert (=> b!126657 d!38563))

(declare-fun b!127381 () Bool)

(declare-fun e!83143 () Bool)

(declare-fun e!83141 () Bool)

(assert (=> b!127381 (= e!83143 e!83141)))

(declare-fun c!23371 () Bool)

(assert (=> b!127381 (= c!23371 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!127382 () Bool)

(declare-fun call!13724 () Bool)

(assert (=> b!127382 (= e!83141 call!13724)))

(declare-fun d!38565 () Bool)

(declare-fun res!61555 () Bool)

(assert (=> d!38565 (=> res!61555 e!83143)))

(assert (=> d!38565 (= res!61555 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (v!3117 (underlying!435 thiss!992))))))))

(assert (=> d!38565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992)))) e!83143)))

(declare-fun bm!13721 () Bool)

(assert (=> bm!13721 (= call!13724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4514 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992)))))))

(declare-fun b!127383 () Bool)

(declare-fun e!83142 () Bool)

(assert (=> b!127383 (= e!83142 call!13724)))

(declare-fun b!127384 () Bool)

(assert (=> b!127384 (= e!83141 e!83142)))

(declare-fun lt!65864 () (_ BitVec 64))

(assert (=> b!127384 (= lt!65864 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!65863 () Unit!3922)

(assert (=> b!127384 (= lt!65863 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) lt!65864 #b00000000000000000000000000000000))))

(assert (=> b!127384 (arrayContainsKey!0 (_keys!4514 (v!3117 (underlying!435 thiss!992))) lt!65864 #b00000000000000000000000000000000)))

(declare-fun lt!65862 () Unit!3922)

(assert (=> b!127384 (= lt!65862 lt!65863)))

(declare-fun res!61556 () Bool)

(assert (=> b!127384 (= res!61556 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) #b00000000000000000000000000000000) (_keys!4514 (v!3117 (underlying!435 thiss!992))) (mask!7037 (v!3117 (underlying!435 thiss!992)))) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!127384 (=> (not res!61556) (not e!83142))))

(assert (= (and d!38565 (not res!61555)) b!127381))

(assert (= (and b!127381 c!23371) b!127384))

(assert (= (and b!127381 (not c!23371)) b!127382))

(assert (= (and b!127384 res!61556) b!127383))

(assert (= (or b!127383 b!127382) bm!13721))

(assert (=> b!127381 m!147793))

(assert (=> b!127381 m!147793))

(assert (=> b!127381 m!147795))

(declare-fun m!148923 () Bool)

(assert (=> bm!13721 m!148923))

(assert (=> b!127384 m!147793))

(declare-fun m!148925 () Bool)

(assert (=> b!127384 m!148925))

(declare-fun m!148927 () Bool)

(assert (=> b!127384 m!148927))

(assert (=> b!127384 m!147793))

(declare-fun m!148929 () Bool)

(assert (=> b!127384 m!148929))

(assert (=> b!126358 d!38565))

(declare-fun b!127385 () Bool)

(declare-fun e!83144 () Option!171)

(assert (=> b!127385 (= e!83144 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65215)))))))

(declare-fun b!127387 () Bool)

(declare-fun e!83145 () Option!171)

(assert (=> b!127387 (= e!83145 (getValueByKey!165 (t!6030 (toList!839 lt!65215)) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun c!23372 () Bool)

(declare-fun d!38567 () Bool)

(assert (=> d!38567 (= c!23372 (and ((_ is Cons!1688) (toList!839 lt!65215)) (= (_1!1282 (h!2290 (toList!839 lt!65215))) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38567 (= (getValueByKey!165 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!83144)))

(declare-fun b!127388 () Bool)

(assert (=> b!127388 (= e!83145 None!169)))

(declare-fun b!127386 () Bool)

(assert (=> b!127386 (= e!83144 e!83145)))

(declare-fun c!23373 () Bool)

(assert (=> b!127386 (= c!23373 (and ((_ is Cons!1688) (toList!839 lt!65215)) (not (= (_1!1282 (h!2290 (toList!839 lt!65215))) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38567 c!23372) b!127385))

(assert (= (and d!38567 (not c!23372)) b!127386))

(assert (= (and b!127386 c!23373) b!127387))

(assert (= (and b!127386 (not c!23373)) b!127388))

(declare-fun m!148931 () Bool)

(assert (=> b!127387 m!148931))

(assert (=> b!126491 d!38567))

(assert (=> b!126608 d!38167))

(declare-fun d!38569 () Bool)

(declare-fun lt!65865 () Bool)

(assert (=> d!38569 (= lt!65865 (select (content!125 (toList!839 lt!65183)) (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun e!83147 () Bool)

(assert (=> d!38569 (= lt!65865 e!83147)))

(declare-fun res!61558 () Bool)

(assert (=> d!38569 (=> (not res!61558) (not e!83147))))

(assert (=> d!38569 (= res!61558 ((_ is Cons!1688) (toList!839 lt!65183)))))

(assert (=> d!38569 (= (contains!869 (toList!839 lt!65183) (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) lt!65865)))

(declare-fun b!127389 () Bool)

(declare-fun e!83146 () Bool)

(assert (=> b!127389 (= e!83147 e!83146)))

(declare-fun res!61557 () Bool)

(assert (=> b!127389 (=> res!61557 e!83146)))

(assert (=> b!127389 (= res!61557 (= (h!2290 (toList!839 lt!65183)) (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(declare-fun b!127390 () Bool)

(assert (=> b!127390 (= e!83146 (contains!869 (t!6030 (toList!839 lt!65183)) (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))

(assert (= (and d!38569 res!61558) b!127389))

(assert (= (and b!127389 (not res!61557)) b!127390))

(declare-fun m!148933 () Bool)

(assert (=> d!38569 m!148933))

(declare-fun m!148935 () Bool)

(assert (=> d!38569 m!148935))

(declare-fun m!148937 () Bool)

(assert (=> b!127390 m!148937))

(assert (=> b!126448 d!38569))

(assert (=> b!126535 d!38441))

(assert (=> b!126535 d!38115))

(declare-fun b!127391 () Bool)

(declare-fun e!83154 () ListLongMap!1647)

(declare-fun call!13727 () ListLongMap!1647)

(assert (=> b!127391 (= e!83154 call!13727)))

(declare-fun b!127392 () Bool)

(declare-fun e!83149 () Bool)

(declare-fun lt!65873 () ListLongMap!1647)

(assert (=> b!127392 (= e!83149 (= (apply!111 lt!65873 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127393 () Bool)

(declare-fun e!83156 () Bool)

(assert (=> b!127393 (= e!83156 (= (apply!111 lt!65873 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127394 () Bool)

(declare-fun e!83160 () ListLongMap!1647)

(declare-fun e!83159 () ListLongMap!1647)

(assert (=> b!127394 (= e!83160 e!83159)))

(declare-fun c!23375 () Bool)

(assert (=> b!127394 (= c!23375 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13722 () Bool)

(declare-fun call!13729 () ListLongMap!1647)

(assert (=> bm!13722 (= call!13727 call!13729)))

(declare-fun b!127395 () Bool)

(declare-fun res!61559 () Bool)

(declare-fun e!83152 () Bool)

(assert (=> b!127395 (=> (not res!61559) (not e!83152))))

(declare-fun e!83150 () Bool)

(assert (=> b!127395 (= res!61559 e!83150)))

(declare-fun res!61563 () Bool)

(assert (=> b!127395 (=> res!61563 e!83150)))

(declare-fun e!83157 () Bool)

(assert (=> b!127395 (= res!61563 (not e!83157))))

(declare-fun res!61565 () Bool)

(assert (=> b!127395 (=> (not res!61565) (not e!83157))))

(assert (=> b!127395 (= res!61565 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun bm!13723 () Bool)

(declare-fun call!13725 () ListLongMap!1647)

(declare-fun call!13730 () ListLongMap!1647)

(assert (=> bm!13723 (= call!13725 call!13730)))

(declare-fun b!127396 () Bool)

(declare-fun e!83151 () Bool)

(assert (=> b!127396 (= e!83151 e!83149)))

(declare-fun res!61564 () Bool)

(declare-fun call!13728 () Bool)

(assert (=> b!127396 (= res!61564 call!13728)))

(assert (=> b!127396 (=> (not res!61564) (not e!83149))))

(declare-fun bm!13724 () Bool)

(assert (=> bm!13724 (= call!13730 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!127397 () Bool)

(declare-fun e!83148 () Bool)

(assert (=> b!127397 (= e!83150 e!83148)))

(declare-fun res!61562 () Bool)

(assert (=> b!127397 (=> (not res!61562) (not e!83148))))

(assert (=> b!127397 (= res!61562 (contains!867 lt!65873 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127397 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127398 () Bool)

(declare-fun e!83153 () Unit!3922)

(declare-fun Unit!3974 () Unit!3922)

(assert (=> b!127398 (= e!83153 Unit!3974)))

(declare-fun bm!13725 () Bool)

(declare-fun call!13731 () Bool)

(assert (=> bm!13725 (= call!13731 (contains!867 lt!65873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127399 () Bool)

(declare-fun e!83158 () Bool)

(assert (=> b!127399 (= e!83158 e!83156)))

(declare-fun res!61560 () Bool)

(assert (=> b!127399 (= res!61560 call!13731)))

(assert (=> b!127399 (=> (not res!61560) (not e!83156))))

(declare-fun b!127400 () Bool)

(declare-fun c!23378 () Bool)

(assert (=> b!127400 (= c!23378 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127400 (= e!83159 e!83154)))

(declare-fun b!127401 () Bool)

(declare-fun e!83155 () Bool)

(assert (=> b!127401 (= e!83155 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38571 () Bool)

(assert (=> d!38571 e!83152))

(declare-fun res!61566 () Bool)

(assert (=> d!38571 (=> (not res!61566) (not e!83152))))

(assert (=> d!38571 (= res!61566 (or (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))))

(declare-fun lt!65870 () ListLongMap!1647)

(assert (=> d!38571 (= lt!65873 lt!65870)))

(declare-fun lt!65880 () Unit!3922)

(assert (=> d!38571 (= lt!65880 e!83153)))

(declare-fun c!23376 () Bool)

(assert (=> d!38571 (= c!23376 e!83155)))

(declare-fun res!61567 () Bool)

(assert (=> d!38571 (=> (not res!61567) (not e!83155))))

(assert (=> d!38571 (= res!61567 (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38571 (= lt!65870 e!83160)))

(declare-fun c!23377 () Bool)

(assert (=> d!38571 (= c!23377 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38571 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38571 (= (getCurrentListMap!509 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65873)))

(declare-fun b!127402 () Bool)

(assert (=> b!127402 (= e!83148 (= (apply!111 lt!65873 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (get!1442 (select (arr!2213 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2478 (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))))))))

(assert (=> b!127402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127403 () Bool)

(assert (=> b!127403 (= e!83157 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127404 () Bool)

(assert (=> b!127404 (= e!83159 call!13727)))

(declare-fun b!127405 () Bool)

(declare-fun lt!65874 () Unit!3922)

(assert (=> b!127405 (= e!83153 lt!65874)))

(declare-fun lt!65869 () ListLongMap!1647)

(assert (=> b!127405 (= lt!65869 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65882 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65879 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65879 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65887 () Unit!3922)

(assert (=> b!127405 (= lt!65887 (addStillContains!87 lt!65869 lt!65882 (zeroValue!2645 newMap!16) lt!65879))))

(assert (=> b!127405 (contains!867 (+!158 lt!65869 (tuple2!2543 lt!65882 (zeroValue!2645 newMap!16))) lt!65879)))

(declare-fun lt!65886 () Unit!3922)

(assert (=> b!127405 (= lt!65886 lt!65887)))

(declare-fun lt!65884 () ListLongMap!1647)

(assert (=> b!127405 (= lt!65884 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65877 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65877 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65876 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65876 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65881 () Unit!3922)

(assert (=> b!127405 (= lt!65881 (addApplyDifferent!87 lt!65884 lt!65877 (minValue!2645 newMap!16) lt!65876))))

(assert (=> b!127405 (= (apply!111 (+!158 lt!65884 (tuple2!2543 lt!65877 (minValue!2645 newMap!16))) lt!65876) (apply!111 lt!65884 lt!65876))))

(declare-fun lt!65875 () Unit!3922)

(assert (=> b!127405 (= lt!65875 lt!65881)))

(declare-fun lt!65868 () ListLongMap!1647)

(assert (=> b!127405 (= lt!65868 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65866 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65871 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65871 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65872 () Unit!3922)

(assert (=> b!127405 (= lt!65872 (addApplyDifferent!87 lt!65868 lt!65866 (zeroValue!2645 newMap!16) lt!65871))))

(assert (=> b!127405 (= (apply!111 (+!158 lt!65868 (tuple2!2543 lt!65866 (zeroValue!2645 newMap!16))) lt!65871) (apply!111 lt!65868 lt!65871))))

(declare-fun lt!65885 () Unit!3922)

(assert (=> b!127405 (= lt!65885 lt!65872)))

(declare-fun lt!65883 () ListLongMap!1647)

(assert (=> b!127405 (= lt!65883 (getCurrentListMapNoExtraKeys!123 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65867 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65878 () (_ BitVec 64))

(assert (=> b!127405 (= lt!65878 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127405 (= lt!65874 (addApplyDifferent!87 lt!65883 lt!65867 (minValue!2645 newMap!16) lt!65878))))

(assert (=> b!127405 (= (apply!111 (+!158 lt!65883 (tuple2!2543 lt!65867 (minValue!2645 newMap!16))) lt!65878) (apply!111 lt!65883 lt!65878))))

(declare-fun call!13726 () ListLongMap!1647)

(declare-fun bm!13726 () Bool)

(assert (=> bm!13726 (= call!13729 (+!158 (ite c!23377 call!13730 (ite c!23375 call!13725 call!13726)) (ite (or c!23377 c!23375) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun b!127406 () Bool)

(assert (=> b!127406 (= e!83154 call!13726)))

(declare-fun b!127407 () Bool)

(assert (=> b!127407 (= e!83160 (+!158 call!13729 (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun bm!13727 () Bool)

(assert (=> bm!13727 (= call!13726 call!13725)))

(declare-fun bm!13728 () Bool)

(assert (=> bm!13728 (= call!13728 (contains!867 lt!65873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127408 () Bool)

(assert (=> b!127408 (= e!83158 (not call!13731))))

(declare-fun b!127409 () Bool)

(assert (=> b!127409 (= e!83152 e!83151)))

(declare-fun c!23379 () Bool)

(assert (=> b!127409 (= c!23379 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127410 () Bool)

(assert (=> b!127410 (= e!83151 (not call!13728))))

(declare-fun b!127411 () Bool)

(declare-fun res!61561 () Bool)

(assert (=> b!127411 (=> (not res!61561) (not e!83152))))

(assert (=> b!127411 (= res!61561 e!83158)))

(declare-fun c!23374 () Bool)

(assert (=> b!127411 (= c!23374 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!38571 c!23377) b!127407))

(assert (= (and d!38571 (not c!23377)) b!127394))

(assert (= (and b!127394 c!23375) b!127404))

(assert (= (and b!127394 (not c!23375)) b!127400))

(assert (= (and b!127400 c!23378) b!127391))

(assert (= (and b!127400 (not c!23378)) b!127406))

(assert (= (or b!127391 b!127406) bm!13727))

(assert (= (or b!127404 bm!13727) bm!13723))

(assert (= (or b!127404 b!127391) bm!13722))

(assert (= (or b!127407 bm!13723) bm!13724))

(assert (= (or b!127407 bm!13722) bm!13726))

(assert (= (and d!38571 res!61567) b!127401))

(assert (= (and d!38571 c!23376) b!127405))

(assert (= (and d!38571 (not c!23376)) b!127398))

(assert (= (and d!38571 res!61566) b!127395))

(assert (= (and b!127395 res!61565) b!127403))

(assert (= (and b!127395 (not res!61563)) b!127397))

(assert (= (and b!127397 res!61562) b!127402))

(assert (= (and b!127395 res!61559) b!127411))

(assert (= (and b!127411 c!23374) b!127399))

(assert (= (and b!127411 (not c!23374)) b!127408))

(assert (= (and b!127399 res!61560) b!127393))

(assert (= (or b!127399 b!127408) bm!13725))

(assert (= (and b!127411 res!61561) b!127409))

(assert (= (and b!127409 c!23379) b!127396))

(assert (= (and b!127409 (not c!23379)) b!127410))

(assert (= (and b!127396 res!61564) b!127392))

(assert (= (or b!127396 b!127410) bm!13728))

(declare-fun b_lambda!5605 () Bool)

(assert (=> (not b_lambda!5605) (not b!127402)))

(assert (=> b!127402 t!6042))

(declare-fun b_and!7841 () Bool)

(assert (= b_and!7837 (and (=> t!6042 result!3843) b_and!7841)))

(assert (=> b!127402 t!6044))

(declare-fun b_and!7843 () Bool)

(assert (= b_and!7839 (and (=> t!6044 result!3845) b_and!7843)))

(declare-fun m!148939 () Bool)

(assert (=> b!127405 m!148939))

(declare-fun m!148941 () Bool)

(assert (=> b!127405 m!148941))

(declare-fun m!148943 () Bool)

(assert (=> b!127405 m!148943))

(declare-fun m!148945 () Bool)

(assert (=> b!127405 m!148945))

(declare-fun m!148947 () Bool)

(assert (=> b!127405 m!148947))

(declare-fun m!148949 () Bool)

(assert (=> b!127405 m!148949))

(declare-fun m!148951 () Bool)

(assert (=> b!127405 m!148951))

(declare-fun m!148953 () Bool)

(assert (=> b!127405 m!148953))

(declare-fun m!148955 () Bool)

(assert (=> b!127405 m!148955))

(declare-fun m!148957 () Bool)

(assert (=> b!127405 m!148957))

(assert (=> b!127405 m!148949))

(declare-fun m!148959 () Bool)

(assert (=> b!127405 m!148959))

(assert (=> b!127405 m!148955))

(declare-fun m!148961 () Bool)

(assert (=> b!127405 m!148961))

(declare-fun m!148963 () Bool)

(assert (=> b!127405 m!148963))

(declare-fun m!148965 () Bool)

(assert (=> b!127405 m!148965))

(assert (=> b!127405 m!148943))

(declare-fun m!148967 () Bool)

(assert (=> b!127405 m!148967))

(assert (=> b!127405 m!148947))

(declare-fun m!148969 () Bool)

(assert (=> b!127405 m!148969))

(assert (=> b!127405 m!147085))

(assert (=> b!127403 m!147085))

(assert (=> b!127403 m!147085))

(assert (=> b!127403 m!147087))

(declare-fun m!148971 () Bool)

(assert (=> bm!13726 m!148971))

(declare-fun m!148973 () Bool)

(assert (=> b!127393 m!148973))

(assert (=> b!127402 m!147085))

(declare-fun m!148975 () Bool)

(assert (=> b!127402 m!148975))

(assert (=> b!127402 m!147085))

(declare-fun m!148977 () Bool)

(assert (=> b!127402 m!148977))

(assert (=> b!127402 m!148977))

(assert (=> b!127402 m!147313))

(declare-fun m!148979 () Bool)

(assert (=> b!127402 m!148979))

(assert (=> b!127402 m!147313))

(declare-fun m!148981 () Bool)

(assert (=> b!127392 m!148981))

(assert (=> bm!13724 m!148953))

(assert (=> b!127397 m!147085))

(assert (=> b!127397 m!147085))

(declare-fun m!148983 () Bool)

(assert (=> b!127397 m!148983))

(declare-fun m!148985 () Bool)

(assert (=> bm!13725 m!148985))

(declare-fun m!148987 () Bool)

(assert (=> b!127407 m!148987))

(declare-fun m!148989 () Bool)

(assert (=> bm!13728 m!148989))

(assert (=> b!127401 m!147085))

(assert (=> b!127401 m!147085))

(assert (=> b!127401 m!147087))

(assert (=> d!38571 m!147061))

(assert (=> b!126535 d!38571))

(declare-fun d!38573 () Bool)

(assert (=> d!38573 (= (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65008)) (v!3122 (getValueByKey!165 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65008)))))

(assert (=> d!38105 d!38573))

(declare-fun b!127412 () Bool)

(declare-fun e!83161 () Option!171)

(assert (=> b!127412 (= e!83161 (Some!170 (_2!1282 (h!2290 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(declare-fun e!83162 () Option!171)

(declare-fun b!127414 () Bool)

(assert (=> b!127414 (= e!83162 (getValueByKey!165 (t!6030 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65008))))

(declare-fun c!23380 () Bool)

(declare-fun d!38575 () Bool)

(assert (=> d!38575 (= c!23380 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65008)))))

(assert (=> d!38575 (= (getValueByKey!165 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65008) e!83161)))

(declare-fun b!127415 () Bool)

(assert (=> b!127415 (= e!83162 None!169)))

(declare-fun b!127413 () Bool)

(assert (=> b!127413 (= e!83161 e!83162)))

(declare-fun c!23381 () Bool)

(assert (=> b!127413 (= c!23381 (and ((_ is Cons!1688) (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))) (not (= (_1!1282 (h!2290 (toList!839 (+!158 lt!65005 (tuple2!2543 lt!65003 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))) lt!65008))))))

(assert (= (and d!38575 c!23380) b!127412))

(assert (= (and d!38575 (not c!23380)) b!127413))

(assert (= (and b!127413 c!23381) b!127414))

(assert (= (and b!127413 (not c!23381)) b!127415))

(declare-fun m!148991 () Bool)

(assert (=> b!127414 m!148991))

(assert (=> d!38105 d!38575))

(declare-fun d!38577 () Bool)

(assert (=> d!38577 (isDefined!119 (getValueByKey!165 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65888 () Unit!3922)

(assert (=> d!38577 (= lt!65888 (choose!768 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83163 () Bool)

(assert (=> d!38577 e!83163))

(declare-fun res!61568 () Bool)

(assert (=> d!38577 (=> (not res!61568) (not e!83163))))

(assert (=> d!38577 (= res!61568 (isStrictlySorted!312 (toList!839 lt!65010)))))

(assert (=> d!38577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000) lt!65888)))

(declare-fun b!127416 () Bool)

(assert (=> b!127416 (= e!83163 (containsKey!169 (toList!839 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38577 res!61568) b!127416))

(assert (=> d!38577 m!147067))

(assert (=> d!38577 m!147067))

(assert (=> d!38577 m!147421))

(declare-fun m!148993 () Bool)

(assert (=> d!38577 m!148993))

(assert (=> d!38577 m!147799))

(assert (=> b!127416 m!147417))

(assert (=> b!126595 d!38577))

(assert (=> b!126595 d!38323))

(assert (=> b!126595 d!38305))

(assert (=> b!126482 d!38421))

(declare-fun d!38579 () Bool)

(declare-fun e!83164 () Bool)

(assert (=> d!38579 e!83164))

(declare-fun res!61569 () Bool)

(assert (=> d!38579 (=> res!61569 e!83164)))

(declare-fun lt!65891 () Bool)

(assert (=> d!38579 (= res!61569 (not lt!65891))))

(declare-fun lt!65889 () Bool)

(assert (=> d!38579 (= lt!65891 lt!65889)))

(declare-fun lt!65892 () Unit!3922)

(declare-fun e!83165 () Unit!3922)

(assert (=> d!38579 (= lt!65892 e!83165)))

(declare-fun c!23382 () Bool)

(assert (=> d!38579 (= c!23382 lt!65889)))

(assert (=> d!38579 (= lt!65889 (containsKey!169 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38579 (= (contains!867 lt!65156 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65891)))

(declare-fun b!127417 () Bool)

(declare-fun lt!65890 () Unit!3922)

(assert (=> b!127417 (= e!83165 lt!65890)))

(assert (=> b!127417 (= lt!65890 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!127417 (isDefined!119 (getValueByKey!165 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!127418 () Bool)

(declare-fun Unit!3975 () Unit!3922)

(assert (=> b!127418 (= e!83165 Unit!3975)))

(declare-fun b!127419 () Bool)

(assert (=> b!127419 (= e!83164 (isDefined!119 (getValueByKey!165 (toList!839 lt!65156) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38579 c!23382) b!127417))

(assert (= (and d!38579 (not c!23382)) b!127418))

(assert (= (and d!38579 (not res!61569)) b!127419))

(declare-fun m!148995 () Bool)

(assert (=> d!38579 m!148995))

(declare-fun m!148997 () Bool)

(assert (=> b!127417 m!148997))

(assert (=> b!127417 m!147123))

(assert (=> b!127417 m!147123))

(declare-fun m!148999 () Bool)

(assert (=> b!127417 m!148999))

(assert (=> b!127419 m!147123))

(assert (=> b!127419 m!147123))

(assert (=> b!127419 m!148999))

(assert (=> d!38067 d!38579))

(declare-fun b!127420 () Bool)

(declare-fun e!83166 () Option!171)

(assert (=> b!127420 (= e!83166 (Some!170 (_2!1282 (h!2290 lt!65154))))))

(declare-fun e!83167 () Option!171)

(declare-fun b!127422 () Bool)

(assert (=> b!127422 (= e!83167 (getValueByKey!165 (t!6030 lt!65154) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun d!38581 () Bool)

(declare-fun c!23383 () Bool)

(assert (=> d!38581 (= c!23383 (and ((_ is Cons!1688) lt!65154) (= (_1!1282 (h!2290 lt!65154)) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (=> d!38581 (= (getValueByKey!165 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) e!83166)))

(declare-fun b!127423 () Bool)

(assert (=> b!127423 (= e!83167 None!169)))

(declare-fun b!127421 () Bool)

(assert (=> b!127421 (= e!83166 e!83167)))

(declare-fun c!23384 () Bool)

(assert (=> b!127421 (= c!23384 (and ((_ is Cons!1688) lt!65154) (not (= (_1!1282 (h!2290 lt!65154)) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(assert (= (and d!38581 c!23383) b!127420))

(assert (= (and d!38581 (not c!23383)) b!127421))

(assert (= (and b!127421 c!23384) b!127422))

(assert (= (and b!127421 (not c!23384)) b!127423))

(declare-fun m!149001 () Bool)

(assert (=> b!127422 m!149001))

(assert (=> d!38067 d!38581))

(declare-fun d!38583 () Bool)

(assert (=> d!38583 (= (getValueByKey!165 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) (Some!170 (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun lt!65893 () Unit!3922)

(assert (=> d!38583 (= lt!65893 (choose!776 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun e!83168 () Bool)

(assert (=> d!38583 e!83168))

(declare-fun res!61570 () Bool)

(assert (=> d!38583 (=> (not res!61570) (not e!83168))))

(assert (=> d!38583 (= res!61570 (isStrictlySorted!312 lt!65154))))

(assert (=> d!38583 (= (lemmaContainsTupThenGetReturnValue!83 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65893)))

(declare-fun b!127424 () Bool)

(declare-fun res!61571 () Bool)

(assert (=> b!127424 (=> (not res!61571) (not e!83168))))

(assert (=> b!127424 (= res!61571 (containsKey!169 lt!65154 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!127425 () Bool)

(assert (=> b!127425 (= e!83168 (contains!869 lt!65154 (tuple2!2543 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38583 res!61570) b!127424))

(assert (= (and b!127424 res!61571) b!127425))

(assert (=> d!38583 m!147117))

(declare-fun m!149003 () Bool)

(assert (=> d!38583 m!149003))

(declare-fun m!149005 () Bool)

(assert (=> d!38583 m!149005))

(declare-fun m!149007 () Bool)

(assert (=> b!127424 m!149007))

(declare-fun m!149009 () Bool)

(assert (=> b!127425 m!149009))

(assert (=> d!38067 d!38583))

(declare-fun bm!13729 () Bool)

(declare-fun call!13733 () List!1692)

(declare-fun call!13732 () List!1692)

(assert (=> bm!13729 (= call!13733 call!13732)))

(declare-fun lt!65894 () List!1692)

(declare-fun e!83169 () Bool)

(declare-fun b!127426 () Bool)

(assert (=> b!127426 (= e!83169 (contains!869 lt!65894 (tuple2!2543 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun e!83171 () List!1692)

(declare-fun c!23388 () Bool)

(declare-fun bm!13730 () Bool)

(assert (=> bm!13730 (= call!13732 ($colon$colon!88 e!83171 (ite c!23388 (h!2290 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (tuple2!2543 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))))

(declare-fun c!23386 () Bool)

(assert (=> bm!13730 (= c!23386 c!23388)))

(declare-fun b!127427 () Bool)

(declare-fun e!83173 () List!1692)

(declare-fun call!13734 () List!1692)

(assert (=> b!127427 (= e!83173 call!13734)))

(declare-fun b!127428 () Bool)

(declare-fun e!83172 () List!1692)

(declare-fun e!83170 () List!1692)

(assert (=> b!127428 (= e!83172 e!83170)))

(declare-fun c!23387 () Bool)

(assert (=> b!127428 (= c!23387 (and ((_ is Cons!1688) (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (= (_1!1282 (h!2290 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun b!127429 () Bool)

(assert (=> b!127429 (= e!83173 call!13734)))

(declare-fun c!23385 () Bool)

(declare-fun b!127430 () Bool)

(assert (=> b!127430 (= e!83171 (ite c!23387 (t!6030 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (ite c!23385 (Cons!1688 (h!2290 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (t!6030 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))))) Nil!1689)))))

(declare-fun b!127431 () Bool)

(assert (=> b!127431 (= e!83172 call!13732)))

(declare-fun b!127432 () Bool)

(assert (=> b!127432 (= c!23385 (and ((_ is Cons!1688) (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (bvsgt (_1!1282 (h!2290 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (=> b!127432 (= e!83170 e!83173)))

(declare-fun b!127433 () Bool)

(declare-fun res!61572 () Bool)

(assert (=> b!127433 (=> (not res!61572) (not e!83169))))

(assert (=> b!127433 (= res!61572 (containsKey!169 lt!65894 (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun d!38585 () Bool)

(assert (=> d!38585 e!83169))

(declare-fun res!61573 () Bool)

(assert (=> d!38585 (=> (not res!61573) (not e!83169))))

(assert (=> d!38585 (= res!61573 (isStrictlySorted!312 lt!65894))))

(assert (=> d!38585 (= lt!65894 e!83172)))

(assert (=> d!38585 (= c!23388 (and ((_ is Cons!1688) (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (bvslt (_1!1282 (h!2290 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (=> d!38585 (isStrictlySorted!312 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))))))

(assert (=> d!38585 (= (insertStrictlySorted!86 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))) lt!65894)))

(declare-fun bm!13731 () Bool)

(assert (=> bm!13731 (= call!13734 call!13733)))

(declare-fun b!127434 () Bool)

(assert (=> b!127434 (= e!83171 (insertStrictlySorted!86 (t!6030 (toList!839 (ite c!23043 call!13516 (ite c!23041 call!13511 call!13512)))) (_1!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) (_2!1282 (ite (or c!23043 c!23041) (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!127435 () Bool)

(assert (=> b!127435 (= e!83170 call!13733)))

(assert (= (and d!38585 c!23388) b!127431))

(assert (= (and d!38585 (not c!23388)) b!127428))

(assert (= (and b!127428 c!23387) b!127435))

(assert (= (and b!127428 (not c!23387)) b!127432))

(assert (= (and b!127432 c!23385) b!127429))

(assert (= (and b!127432 (not c!23385)) b!127427))

(assert (= (or b!127429 b!127427) bm!13731))

(assert (= (or b!127435 bm!13731) bm!13729))

(assert (= (or b!127431 bm!13729) bm!13730))

(assert (= (and bm!13730 c!23386) b!127434))

(assert (= (and bm!13730 (not c!23386)) b!127430))

(assert (= (and d!38585 res!61573) b!127433))

(assert (= (and b!127433 res!61572) b!127426))

(declare-fun m!149011 () Bool)

(assert (=> b!127426 m!149011))

(declare-fun m!149013 () Bool)

(assert (=> bm!13730 m!149013))

(declare-fun m!149015 () Bool)

(assert (=> b!127433 m!149015))

(declare-fun m!149017 () Bool)

(assert (=> b!127434 m!149017))

(declare-fun m!149019 () Bool)

(assert (=> d!38585 m!149019))

(declare-fun m!149021 () Bool)

(assert (=> d!38585 m!149021))

(assert (=> d!38067 d!38585))

(assert (=> d!38115 d!38241))

(declare-fun d!38587 () Bool)

(assert (=> d!38587 (arrayContainsKey!0 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000)))

(declare-fun lt!65895 () Unit!3922)

(assert (=> d!38587 (= lt!65895 (choose!13 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000))))

(assert (=> d!38587 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!38587 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000) lt!65895)))

(declare-fun bs!5273 () Bool)

(assert (= bs!5273 d!38587))

(assert (=> bs!5273 m!147093))

(declare-fun m!149023 () Bool)

(assert (=> bs!5273 m!149023))

(assert (=> b!126374 d!38587))

(declare-fun d!38589 () Bool)

(declare-fun res!61574 () Bool)

(declare-fun e!83174 () Bool)

(assert (=> d!38589 (=> res!61574 e!83174)))

(assert (=> d!38589 (= res!61574 (= (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) lt!65133))))

(assert (=> d!38589 (= (arrayContainsKey!0 (_keys!4514 newMap!16) lt!65133 #b00000000000000000000000000000000) e!83174)))

(declare-fun b!127436 () Bool)

(declare-fun e!83175 () Bool)

(assert (=> b!127436 (= e!83174 e!83175)))

(declare-fun res!61575 () Bool)

(assert (=> b!127436 (=> (not res!61575) (not e!83175))))

(assert (=> b!127436 (= res!61575 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127437 () Bool)

(assert (=> b!127437 (= e!83175 (arrayContainsKey!0 (_keys!4514 newMap!16) lt!65133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38589 (not res!61574)) b!127436))

(assert (= (and b!127436 res!61575) b!127437))

(assert (=> d!38589 m!147085))

(declare-fun m!149025 () Bool)

(assert (=> b!127437 m!149025))

(assert (=> b!126374 d!38589))

(declare-fun b!127438 () Bool)

(declare-fun e!83176 () SeekEntryResult!273)

(declare-fun lt!65897 () SeekEntryResult!273)

(assert (=> b!127438 (= e!83176 (Found!273 (index!3249 lt!65897)))))

(declare-fun b!127439 () Bool)

(declare-fun e!83177 () SeekEntryResult!273)

(assert (=> b!127439 (= e!83177 (MissingZero!273 (index!3249 lt!65897)))))

(declare-fun b!127440 () Bool)

(assert (=> b!127440 (= e!83177 (seekKeyOrZeroReturnVacant!0 (x!14965 lt!65897) (index!3249 lt!65897) (index!3249 lt!65897) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(declare-fun b!127441 () Bool)

(declare-fun c!23389 () Bool)

(declare-fun lt!65896 () (_ BitVec 64))

(assert (=> b!127441 (= c!23389 (= lt!65896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127441 (= e!83176 e!83177)))

(declare-fun b!127442 () Bool)

(declare-fun e!83178 () SeekEntryResult!273)

(assert (=> b!127442 (= e!83178 Undefined!273)))

(declare-fun d!38591 () Bool)

(declare-fun lt!65898 () SeekEntryResult!273)

(assert (=> d!38591 (and (or ((_ is Undefined!273) lt!65898) (not ((_ is Found!273) lt!65898)) (and (bvsge (index!3248 lt!65898) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65898) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65898) ((_ is Found!273) lt!65898) (not ((_ is MissingZero!273) lt!65898)) (and (bvsge (index!3247 lt!65898) #b00000000000000000000000000000000) (bvslt (index!3247 lt!65898) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65898) ((_ is Found!273) lt!65898) ((_ is MissingZero!273) lt!65898) (not ((_ is MissingVacant!273) lt!65898)) (and (bvsge (index!3250 lt!65898) #b00000000000000000000000000000000) (bvslt (index!3250 lt!65898) (size!2477 (_keys!4514 newMap!16))))) (or ((_ is Undefined!273) lt!65898) (ite ((_ is Found!273) lt!65898) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65898)) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!273) lt!65898) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3247 lt!65898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!273) lt!65898) (= (select (arr!2212 (_keys!4514 newMap!16)) (index!3250 lt!65898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38591 (= lt!65898 e!83178)))

(declare-fun c!23391 () Bool)

(assert (=> d!38591 (= c!23391 (and ((_ is Intermediate!273) lt!65897) (undefined!1085 lt!65897)))))

(assert (=> d!38591 (= lt!65897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (mask!7037 newMap!16)) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (_keys!4514 newMap!16) (mask!7037 newMap!16)))))

(assert (=> d!38591 (validMask!0 (mask!7037 newMap!16))))

(assert (=> d!38591 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000) (_keys!4514 newMap!16) (mask!7037 newMap!16)) lt!65898)))

(declare-fun b!127443 () Bool)

(assert (=> b!127443 (= e!83178 e!83176)))

(assert (=> b!127443 (= lt!65896 (select (arr!2212 (_keys!4514 newMap!16)) (index!3249 lt!65897)))))

(declare-fun c!23390 () Bool)

(assert (=> b!127443 (= c!23390 (= lt!65896 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38591 c!23391) b!127442))

(assert (= (and d!38591 (not c!23391)) b!127443))

(assert (= (and b!127443 c!23390) b!127438))

(assert (= (and b!127443 (not c!23390)) b!127441))

(assert (= (and b!127441 c!23389) b!127439))

(assert (= (and b!127441 (not c!23389)) b!127440))

(assert (=> b!127440 m!147085))

(declare-fun m!149027 () Bool)

(assert (=> b!127440 m!149027))

(assert (=> d!38591 m!147085))

(declare-fun m!149029 () Bool)

(assert (=> d!38591 m!149029))

(declare-fun m!149031 () Bool)

(assert (=> d!38591 m!149031))

(assert (=> d!38591 m!149029))

(assert (=> d!38591 m!147085))

(declare-fun m!149033 () Bool)

(assert (=> d!38591 m!149033))

(declare-fun m!149035 () Bool)

(assert (=> d!38591 m!149035))

(declare-fun m!149037 () Bool)

(assert (=> d!38591 m!149037))

(assert (=> d!38591 m!147061))

(declare-fun m!149039 () Bool)

(assert (=> b!127443 m!149039))

(assert (=> b!126374 d!38591))

(declare-fun d!38593 () Bool)

(assert (=> d!38593 (= (apply!111 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5274 () Bool)

(assert (= bs!5274 d!38593))

(assert (=> bs!5274 m!148627))

(assert (=> bs!5274 m!148627))

(declare-fun m!149041 () Bool)

(assert (=> bs!5274 m!149041))

(assert (=> b!126507 d!38593))

(assert (=> b!126371 d!38167))

(declare-fun d!38595 () Bool)

(assert (=> d!38595 (= (+!158 (getCurrentListMap!509 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!509 (_keys!4514 newMap!16) (array!4678 (store (arr!2213 (_values!2765 newMap!16)) (index!3248 lt!65101) (ValueCellFull!1076 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2478 (_values!2765 newMap!16))) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38595 true))

(declare-fun _$5!125 () Unit!3922)

(assert (=> d!38595 (= (choose!772 (_keys!4514 newMap!16) (_values!2765 newMap!16) (mask!7037 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3248 lt!65101) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) _$5!125)))

(declare-fun bs!5275 () Bool)

(assert (= bs!5275 d!38595))

(assert (=> bs!5275 m!146923))

(assert (=> bs!5275 m!146923))

(assert (=> bs!5275 m!147343))

(assert (=> bs!5275 m!146993))

(assert (=> bs!5275 m!147345))

(assert (=> d!38121 d!38595))

(assert (=> d!38121 d!38241))

(declare-fun d!38597 () Bool)

(declare-fun e!83179 () Bool)

(assert (=> d!38597 e!83179))

(declare-fun res!61576 () Bool)

(assert (=> d!38597 (=> res!61576 e!83179)))

(declare-fun lt!65901 () Bool)

(assert (=> d!38597 (= res!61576 (not lt!65901))))

(declare-fun lt!65899 () Bool)

(assert (=> d!38597 (= lt!65901 lt!65899)))

(declare-fun lt!65902 () Unit!3922)

(declare-fun e!83180 () Unit!3922)

(assert (=> d!38597 (= lt!65902 e!83180)))

(declare-fun c!23392 () Bool)

(assert (=> d!38597 (= c!23392 lt!65899)))

(assert (=> d!38597 (= lt!65899 (containsKey!169 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38597 (= (contains!867 lt!65391 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65901)))

(declare-fun b!127444 () Bool)

(declare-fun lt!65900 () Unit!3922)

(assert (=> b!127444 (= e!83180 lt!65900)))

(assert (=> b!127444 (= lt!65900 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!127444 (isDefined!119 (getValueByKey!165 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127445 () Bool)

(declare-fun Unit!3976 () Unit!3922)

(assert (=> b!127445 (= e!83180 Unit!3976)))

(declare-fun b!127446 () Bool)

(assert (=> b!127446 (= e!83179 (isDefined!119 (getValueByKey!165 (toList!839 lt!65391) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38597 c!23392) b!127444))

(assert (= (and d!38597 (not c!23392)) b!127445))

(assert (= (and d!38597 (not res!61576)) b!127446))

(declare-fun m!149043 () Bool)

(assert (=> d!38597 m!149043))

(declare-fun m!149045 () Bool)

(assert (=> b!127444 m!149045))

(assert (=> b!127444 m!147527))

(assert (=> b!127444 m!147527))

(declare-fun m!149047 () Bool)

(assert (=> b!127444 m!149047))

(assert (=> b!127446 m!147527))

(assert (=> b!127446 m!147527))

(assert (=> b!127446 m!149047))

(assert (=> d!38155 d!38597))

(declare-fun b!127447 () Bool)

(declare-fun e!83181 () Option!171)

(assert (=> b!127447 (= e!83181 (Some!170 (_2!1282 (h!2290 lt!65389))))))

(declare-fun b!127449 () Bool)

(declare-fun e!83182 () Option!171)

(assert (=> b!127449 (= e!83182 (getValueByKey!165 (t!6030 lt!65389) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!23393 () Bool)

(declare-fun d!38599 () Bool)

(assert (=> d!38599 (= c!23393 (and ((_ is Cons!1688) lt!65389) (= (_1!1282 (h!2290 lt!65389)) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38599 (= (getValueByKey!165 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83181)))

(declare-fun b!127450 () Bool)

(assert (=> b!127450 (= e!83182 None!169)))

(declare-fun b!127448 () Bool)

(assert (=> b!127448 (= e!83181 e!83182)))

(declare-fun c!23394 () Bool)

(assert (=> b!127448 (= c!23394 (and ((_ is Cons!1688) lt!65389) (not (= (_1!1282 (h!2290 lt!65389)) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!38599 c!23393) b!127447))

(assert (= (and d!38599 (not c!23393)) b!127448))

(assert (= (and b!127448 c!23394) b!127449))

(assert (= (and b!127448 (not c!23394)) b!127450))

(declare-fun m!149049 () Bool)

(assert (=> b!127449 m!149049))

(assert (=> d!38155 d!38599))

(declare-fun d!38601 () Bool)

(assert (=> d!38601 (= (getValueByKey!165 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!170 (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65903 () Unit!3922)

(assert (=> d!38601 (= lt!65903 (choose!776 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!83183 () Bool)

(assert (=> d!38601 e!83183))

(declare-fun res!61577 () Bool)

(assert (=> d!38601 (=> (not res!61577) (not e!83183))))

(assert (=> d!38601 (= res!61577 (isStrictlySorted!312 lt!65389))))

(assert (=> d!38601 (= (lemmaContainsTupThenGetReturnValue!83 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65903)))

(declare-fun b!127451 () Bool)

(declare-fun res!61578 () Bool)

(assert (=> b!127451 (=> (not res!61578) (not e!83183))))

(assert (=> b!127451 (= res!61578 (containsKey!169 lt!65389 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127452 () Bool)

(assert (=> b!127452 (= e!83183 (contains!869 lt!65389 (tuple2!2543 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38601 res!61577) b!127451))

(assert (= (and b!127451 res!61578) b!127452))

(assert (=> d!38601 m!147521))

(declare-fun m!149051 () Bool)

(assert (=> d!38601 m!149051))

(declare-fun m!149053 () Bool)

(assert (=> d!38601 m!149053))

(declare-fun m!149055 () Bool)

(assert (=> b!127451 m!149055))

(declare-fun m!149057 () Bool)

(assert (=> b!127452 m!149057))

(assert (=> d!38155 d!38601))

(declare-fun bm!13732 () Bool)

(declare-fun call!13736 () List!1692)

(declare-fun call!13735 () List!1692)

(assert (=> bm!13732 (= call!13736 call!13735)))

(declare-fun b!127453 () Bool)

(declare-fun e!83184 () Bool)

(declare-fun lt!65904 () List!1692)

(assert (=> b!127453 (= e!83184 (contains!869 lt!65904 (tuple2!2543 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23398 () Bool)

(declare-fun bm!13733 () Bool)

(declare-fun e!83186 () List!1692)

(assert (=> bm!13733 (= call!13735 ($colon$colon!88 e!83186 (ite c!23398 (h!2290 (toList!839 e!82491)) (tuple2!2543 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23396 () Bool)

(assert (=> bm!13733 (= c!23396 c!23398)))

(declare-fun b!127454 () Bool)

(declare-fun e!83188 () List!1692)

(declare-fun call!13737 () List!1692)

(assert (=> b!127454 (= e!83188 call!13737)))

(declare-fun b!127455 () Bool)

(declare-fun e!83187 () List!1692)

(declare-fun e!83185 () List!1692)

(assert (=> b!127455 (= e!83187 e!83185)))

(declare-fun c!23397 () Bool)

(assert (=> b!127455 (= c!23397 (and ((_ is Cons!1688) (toList!839 e!82491)) (= (_1!1282 (h!2290 (toList!839 e!82491))) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!127456 () Bool)

(assert (=> b!127456 (= e!83188 call!13737)))

(declare-fun b!127457 () Bool)

(declare-fun c!23395 () Bool)

(assert (=> b!127457 (= e!83186 (ite c!23397 (t!6030 (toList!839 e!82491)) (ite c!23395 (Cons!1688 (h!2290 (toList!839 e!82491)) (t!6030 (toList!839 e!82491))) Nil!1689)))))

(declare-fun b!127458 () Bool)

(assert (=> b!127458 (= e!83187 call!13735)))

(declare-fun b!127459 () Bool)

(assert (=> b!127459 (= c!23395 (and ((_ is Cons!1688) (toList!839 e!82491)) (bvsgt (_1!1282 (h!2290 (toList!839 e!82491))) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!127459 (= e!83185 e!83188)))

(declare-fun b!127460 () Bool)

(declare-fun res!61579 () Bool)

(assert (=> b!127460 (=> (not res!61579) (not e!83184))))

(assert (=> b!127460 (= res!61579 (containsKey!169 lt!65904 (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!38603 () Bool)

(assert (=> d!38603 e!83184))

(declare-fun res!61580 () Bool)

(assert (=> d!38603 (=> (not res!61580) (not e!83184))))

(assert (=> d!38603 (= res!61580 (isStrictlySorted!312 lt!65904))))

(assert (=> d!38603 (= lt!65904 e!83187)))

(assert (=> d!38603 (= c!23398 (and ((_ is Cons!1688) (toList!839 e!82491)) (bvslt (_1!1282 (h!2290 (toList!839 e!82491))) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38603 (isStrictlySorted!312 (toList!839 e!82491))))

(assert (=> d!38603 (= (insertStrictlySorted!86 (toList!839 e!82491) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65904)))

(declare-fun bm!13734 () Bool)

(assert (=> bm!13734 (= call!13737 call!13736)))

(declare-fun b!127461 () Bool)

(assert (=> b!127461 (= e!83186 (insertStrictlySorted!86 (t!6030 (toList!839 e!82491)) (_1!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1282 (ite c!23087 (ite c!23089 (tuple2!2543 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2543 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127462 () Bool)

(assert (=> b!127462 (= e!83185 call!13736)))

(assert (= (and d!38603 c!23398) b!127458))

(assert (= (and d!38603 (not c!23398)) b!127455))

(assert (= (and b!127455 c!23397) b!127462))

(assert (= (and b!127455 (not c!23397)) b!127459))

(assert (= (and b!127459 c!23395) b!127456))

(assert (= (and b!127459 (not c!23395)) b!127454))

(assert (= (or b!127456 b!127454) bm!13734))

(assert (= (or b!127462 bm!13734) bm!13732))

(assert (= (or b!127458 bm!13732) bm!13733))

(assert (= (and bm!13733 c!23396) b!127461))

(assert (= (and bm!13733 (not c!23396)) b!127457))

(assert (= (and d!38603 res!61580) b!127460))

(assert (= (and b!127460 res!61579) b!127453))

(declare-fun m!149059 () Bool)

(assert (=> b!127453 m!149059))

(declare-fun m!149061 () Bool)

(assert (=> bm!13733 m!149061))

(declare-fun m!149063 () Bool)

(assert (=> b!127460 m!149063))

(declare-fun m!149065 () Bool)

(assert (=> b!127461 m!149065))

(declare-fun m!149067 () Bool)

(assert (=> d!38603 m!149067))

(declare-fun m!149069 () Bool)

(assert (=> d!38603 m!149069))

(assert (=> d!38155 d!38603))

(declare-fun d!38605 () Bool)

(assert (=> d!38605 (isDefined!119 (getValueByKey!165 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(declare-fun lt!65905 () Unit!3922)

(assert (=> d!38605 (= lt!65905 (choose!768 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(declare-fun e!83189 () Bool)

(assert (=> d!38605 e!83189))

(declare-fun res!61581 () Bool)

(assert (=> d!38605 (=> (not res!61581) (not e!83189))))

(assert (=> d!38605 (= res!61581 (isStrictlySorted!312 (toList!839 call!13567)))))

(assert (=> d!38605 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))) lt!65905)))

(declare-fun b!127463 () Bool)

(assert (=> b!127463 (= e!83189 (containsKey!169 (toList!839 call!13567) (select (arr!2212 (_keys!4514 newMap!16)) (index!3248 lt!65101))))))

(assert (= (and d!38605 res!61581) b!127463))

(assert (=> d!38605 m!147013))

(assert (=> d!38605 m!147331))

(assert (=> d!38605 m!147331))

(assert (=> d!38605 m!147333))

(assert (=> d!38605 m!147013))

(declare-fun m!149071 () Bool)

(assert (=> d!38605 m!149071))

(declare-fun m!149073 () Bool)

(assert (=> d!38605 m!149073))

(assert (=> b!127463 m!147013))

(assert (=> b!127463 m!147327))

(assert (=> b!126527 d!38605))

(assert (=> b!126527 d!38347))

(assert (=> b!126527 d!38349))

(declare-fun d!38607 () Bool)

(declare-fun e!83190 () Bool)

(assert (=> d!38607 e!83190))

(declare-fun res!61582 () Bool)

(assert (=> d!38607 (=> res!61582 e!83190)))

(declare-fun lt!65908 () Bool)

(assert (=> d!38607 (= res!61582 (not lt!65908))))

(declare-fun lt!65906 () Bool)

(assert (=> d!38607 (= lt!65908 lt!65906)))

(declare-fun lt!65909 () Unit!3922)

(declare-fun e!83191 () Unit!3922)

(assert (=> d!38607 (= lt!65909 e!83191)))

(declare-fun c!23399 () Bool)

(assert (=> d!38607 (= c!23399 lt!65906)))

(assert (=> d!38607 (= lt!65906 (containsKey!169 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> d!38607 (= (contains!867 lt!65215 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65908)))

(declare-fun b!127464 () Bool)

(declare-fun lt!65907 () Unit!3922)

(assert (=> b!127464 (= e!83191 lt!65907)))

(assert (=> b!127464 (= lt!65907 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(assert (=> b!127464 (isDefined!119 (getValueByKey!165 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127465 () Bool)

(declare-fun Unit!3977 () Unit!3922)

(assert (=> b!127465 (= e!83191 Unit!3977)))

(declare-fun b!127466 () Bool)

(assert (=> b!127466 (= e!83190 (isDefined!119 (getValueByKey!165 (toList!839 lt!65215) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38607 c!23399) b!127464))

(assert (= (and d!38607 (not c!23399)) b!127465))

(assert (= (and d!38607 (not res!61582)) b!127466))

(declare-fun m!149075 () Bool)

(assert (=> d!38607 m!149075))

(declare-fun m!149077 () Bool)

(assert (=> b!127464 m!149077))

(assert (=> b!127464 m!147263))

(assert (=> b!127464 m!147263))

(declare-fun m!149079 () Bool)

(assert (=> b!127464 m!149079))

(assert (=> b!127466 m!147263))

(assert (=> b!127466 m!147263))

(assert (=> b!127466 m!149079))

(assert (=> d!38109 d!38607))

(declare-fun b!127467 () Bool)

(declare-fun e!83192 () Option!171)

(assert (=> b!127467 (= e!83192 (Some!170 (_2!1282 (h!2290 lt!65213))))))

(declare-fun e!83193 () Option!171)

(declare-fun b!127469 () Bool)

(assert (=> b!127469 (= e!83193 (getValueByKey!165 (t!6030 lt!65213) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38609 () Bool)

(declare-fun c!23400 () Bool)

(assert (=> d!38609 (= c!23400 (and ((_ is Cons!1688) lt!65213) (= (_1!1282 (h!2290 lt!65213)) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38609 (= (getValueByKey!165 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!83192)))

(declare-fun b!127470 () Bool)

(assert (=> b!127470 (= e!83193 None!169)))

(declare-fun b!127468 () Bool)

(assert (=> b!127468 (= e!83192 e!83193)))

(declare-fun c!23401 () Bool)

(assert (=> b!127468 (= c!23401 (and ((_ is Cons!1688) lt!65213) (not (= (_1!1282 (h!2290 lt!65213)) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38609 c!23400) b!127467))

(assert (= (and d!38609 (not c!23400)) b!127468))

(assert (= (and b!127468 c!23401) b!127469))

(assert (= (and b!127468 (not c!23401)) b!127470))

(declare-fun m!149081 () Bool)

(assert (=> b!127469 m!149081))

(assert (=> d!38109 d!38609))

(declare-fun d!38611 () Bool)

(assert (=> d!38611 (= (getValueByKey!165 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) (Some!170 (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun lt!65910 () Unit!3922)

(assert (=> d!38611 (= lt!65910 (choose!776 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun e!83194 () Bool)

(assert (=> d!38611 e!83194))

(declare-fun res!61583 () Bool)

(assert (=> d!38611 (=> (not res!61583) (not e!83194))))

(assert (=> d!38611 (= res!61583 (isStrictlySorted!312 lt!65213))))

(assert (=> d!38611 (= (lemmaContainsTupThenGetReturnValue!83 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65910)))

(declare-fun b!127471 () Bool)

(declare-fun res!61584 () Bool)

(assert (=> b!127471 (=> (not res!61584) (not e!83194))))

(assert (=> b!127471 (= res!61584 (containsKey!169 lt!65213 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127472 () Bool)

(assert (=> b!127472 (= e!83194 (contains!869 lt!65213 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (= (and d!38611 res!61583) b!127471))

(assert (= (and b!127471 res!61584) b!127472))

(assert (=> d!38611 m!147257))

(declare-fun m!149083 () Bool)

(assert (=> d!38611 m!149083))

(declare-fun m!149085 () Bool)

(assert (=> d!38611 m!149085))

(declare-fun m!149087 () Bool)

(assert (=> b!127471 m!149087))

(declare-fun m!149089 () Bool)

(assert (=> b!127472 m!149089))

(assert (=> d!38109 d!38611))

(declare-fun bm!13735 () Bool)

(declare-fun call!13739 () List!1692)

(declare-fun call!13738 () List!1692)

(assert (=> bm!13735 (= call!13739 call!13738)))

(declare-fun b!127473 () Bool)

(declare-fun lt!65911 () List!1692)

(declare-fun e!83195 () Bool)

(assert (=> b!127473 (= e!83195 (contains!869 lt!65911 (tuple2!2543 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun e!83197 () List!1692)

(declare-fun bm!13736 () Bool)

(declare-fun c!23405 () Bool)

(assert (=> bm!13736 (= call!13738 ($colon$colon!88 e!83197 (ite c!23405 (h!2290 (toList!839 lt!65006)) (tuple2!2543 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(declare-fun c!23403 () Bool)

(assert (=> bm!13736 (= c!23403 c!23405)))

(declare-fun b!127474 () Bool)

(declare-fun e!83199 () List!1692)

(declare-fun call!13740 () List!1692)

(assert (=> b!127474 (= e!83199 call!13740)))

(declare-fun b!127475 () Bool)

(declare-fun e!83198 () List!1692)

(declare-fun e!83196 () List!1692)

(assert (=> b!127475 (= e!83198 e!83196)))

(declare-fun c!23404 () Bool)

(assert (=> b!127475 (= c!23404 (and ((_ is Cons!1688) (toList!839 lt!65006)) (= (_1!1282 (h!2290 (toList!839 lt!65006))) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(declare-fun b!127476 () Bool)

(assert (=> b!127476 (= e!83199 call!13740)))

(declare-fun b!127477 () Bool)

(declare-fun c!23402 () Bool)

(assert (=> b!127477 (= e!83197 (ite c!23404 (t!6030 (toList!839 lt!65006)) (ite c!23402 (Cons!1688 (h!2290 (toList!839 lt!65006)) (t!6030 (toList!839 lt!65006))) Nil!1689)))))

(declare-fun b!127478 () Bool)

(assert (=> b!127478 (= e!83198 call!13738)))

(declare-fun b!127479 () Bool)

(assert (=> b!127479 (= c!23402 (and ((_ is Cons!1688) (toList!839 lt!65006)) (bvsgt (_1!1282 (h!2290 (toList!839 lt!65006))) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> b!127479 (= e!83196 e!83199)))

(declare-fun b!127480 () Bool)

(declare-fun res!61585 () Bool)

(assert (=> b!127480 (=> (not res!61585) (not e!83195))))

(assert (=> b!127480 (= res!61585 (containsKey!169 lt!65911 (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38613 () Bool)

(assert (=> d!38613 e!83195))

(declare-fun res!61586 () Bool)

(assert (=> d!38613 (=> (not res!61586) (not e!83195))))

(assert (=> d!38613 (= res!61586 (isStrictlySorted!312 lt!65911))))

(assert (=> d!38613 (= lt!65911 e!83198)))

(assert (=> d!38613 (= c!23405 (and ((_ is Cons!1688) (toList!839 lt!65006)) (bvslt (_1!1282 (h!2290 (toList!839 lt!65006))) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38613 (isStrictlySorted!312 (toList!839 lt!65006))))

(assert (=> d!38613 (= (insertStrictlySorted!86 (toList!839 lt!65006) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))) lt!65911)))

(declare-fun bm!13737 () Bool)

(assert (=> bm!13737 (= call!13740 call!13739)))

(declare-fun b!127481 () Bool)

(assert (=> b!127481 (= e!83197 (insertStrictlySorted!86 (t!6030 (toList!839 lt!65006)) (_1!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992))))) (_2!1282 (tuple2!2543 lt!65019 (zeroValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun b!127482 () Bool)

(assert (=> b!127482 (= e!83196 call!13739)))

(assert (= (and d!38613 c!23405) b!127478))

(assert (= (and d!38613 (not c!23405)) b!127475))

(assert (= (and b!127475 c!23404) b!127482))

(assert (= (and b!127475 (not c!23404)) b!127479))

(assert (= (and b!127479 c!23402) b!127476))

(assert (= (and b!127479 (not c!23402)) b!127474))

(assert (= (or b!127476 b!127474) bm!13737))

(assert (= (or b!127482 bm!13737) bm!13735))

(assert (= (or b!127478 bm!13735) bm!13736))

(assert (= (and bm!13736 c!23403) b!127481))

(assert (= (and bm!13736 (not c!23403)) b!127477))

(assert (= (and d!38613 res!61586) b!127480))

(assert (= (and b!127480 res!61585) b!127473))

(declare-fun m!149091 () Bool)

(assert (=> b!127473 m!149091))

(declare-fun m!149093 () Bool)

(assert (=> bm!13736 m!149093))

(declare-fun m!149095 () Bool)

(assert (=> b!127480 m!149095))

(declare-fun m!149097 () Bool)

(assert (=> b!127481 m!149097))

(declare-fun m!149099 () Bool)

(assert (=> d!38613 m!149099))

(declare-fun m!149101 () Bool)

(assert (=> d!38613 m!149101))

(assert (=> d!38109 d!38613))

(declare-fun d!38615 () Bool)

(declare-fun res!61587 () Bool)

(declare-fun e!83200 () Bool)

(assert (=> d!38615 (=> res!61587 e!83200)))

(assert (=> d!38615 (= res!61587 (and ((_ is Cons!1688) (t!6030 (toList!839 lt!64938))) (= (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938)))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(assert (=> d!38615 (= (containsKey!169 (t!6030 (toList!839 lt!64938)) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)) e!83200)))

(declare-fun b!127483 () Bool)

(declare-fun e!83201 () Bool)

(assert (=> b!127483 (= e!83200 e!83201)))

(declare-fun res!61588 () Bool)

(assert (=> b!127483 (=> (not res!61588) (not e!83201))))

(assert (=> b!127483 (= res!61588 (and (or (not ((_ is Cons!1688) (t!6030 (toList!839 lt!64938)))) (bvsle (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938)))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))) ((_ is Cons!1688) (t!6030 (toList!839 lt!64938))) (bvslt (_1!1282 (h!2290 (t!6030 (toList!839 lt!64938)))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355))))))

(declare-fun b!127484 () Bool)

(assert (=> b!127484 (= e!83201 (containsKey!169 (t!6030 (t!6030 (toList!839 lt!64938))) (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355)))))

(assert (= (and d!38615 (not res!61587)) b!127483))

(assert (= (and b!127483 res!61588) b!127484))

(assert (=> b!127484 m!146811))

(declare-fun m!149103 () Bool)

(assert (=> b!127484 m!149103))

(assert (=> b!126656 d!38615))

(declare-fun d!38617 () Bool)

(declare-fun e!83202 () Bool)

(assert (=> d!38617 e!83202))

(declare-fun res!61589 () Bool)

(assert (=> d!38617 (=> res!61589 e!83202)))

(declare-fun lt!65914 () Bool)

(assert (=> d!38617 (= res!61589 (not lt!65914))))

(declare-fun lt!65912 () Bool)

(assert (=> d!38617 (= lt!65914 lt!65912)))

(declare-fun lt!65915 () Unit!3922)

(declare-fun e!83203 () Unit!3922)

(assert (=> d!38617 (= lt!65915 e!83203)))

(declare-fun c!23406 () Bool)

(assert (=> d!38617 (= c!23406 lt!65912)))

(assert (=> d!38617 (= lt!65912 (containsKey!169 (toList!839 lt!65357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38617 (= (contains!867 lt!65357 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65914)))

(declare-fun b!127485 () Bool)

(declare-fun lt!65913 () Unit!3922)

(assert (=> b!127485 (= e!83203 lt!65913)))

(assert (=> b!127485 (= lt!65913 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 lt!65357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127485 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127486 () Bool)

(declare-fun Unit!3978 () Unit!3922)

(assert (=> b!127486 (= e!83203 Unit!3978)))

(declare-fun b!127487 () Bool)

(assert (=> b!127487 (= e!83202 (isDefined!119 (getValueByKey!165 (toList!839 lt!65357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38617 c!23406) b!127485))

(assert (= (and d!38617 (not c!23406)) b!127486))

(assert (= (and d!38617 (not res!61589)) b!127487))

(declare-fun m!149105 () Bool)

(assert (=> d!38617 m!149105))

(declare-fun m!149107 () Bool)

(assert (=> b!127485 m!149107))

(assert (=> b!127485 m!147991))

(assert (=> b!127485 m!147991))

(declare-fun m!149109 () Bool)

(assert (=> b!127485 m!149109))

(assert (=> b!127487 m!147991))

(assert (=> b!127487 m!147991))

(assert (=> b!127487 m!149109))

(assert (=> bm!13624 d!38617))

(declare-fun d!38619 () Bool)

(assert (=> d!38619 (= (apply!111 lt!65357 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1446 (getValueByKey!165 (toList!839 lt!65357) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5276 () Bool)

(assert (= bs!5276 d!38619))

(assert (=> bs!5276 m!148603))

(assert (=> bs!5276 m!148603))

(declare-fun m!149111 () Bool)

(assert (=> bs!5276 m!149111))

(assert (=> b!126600 d!38619))

(declare-fun b!127488 () Bool)

(declare-fun e!83204 () Option!171)

(assert (=> b!127488 (= e!83204 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65171)))))))

(declare-fun e!83205 () Option!171)

(declare-fun b!127490 () Bool)

(assert (=> b!127490 (= e!83205 (getValueByKey!165 (t!6030 (toList!839 lt!65171)) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))

(declare-fun d!38621 () Bool)

(declare-fun c!23407 () Bool)

(assert (=> d!38621 (= c!23407 (and ((_ is Cons!1688) (toList!839 lt!65171)) (= (_1!1282 (h!2290 (toList!839 lt!65171))) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992))))))))))

(assert (=> d!38621 (= (getValueByKey!165 (toList!839 lt!65171) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))) e!83204)))

(declare-fun b!127491 () Bool)

(assert (=> b!127491 (= e!83205 None!169)))

(declare-fun b!127489 () Bool)

(assert (=> b!127489 (= e!83204 e!83205)))

(declare-fun c!23408 () Bool)

(assert (=> b!127489 (= c!23408 (and ((_ is Cons!1688) (toList!839 lt!65171)) (not (= (_1!1282 (h!2290 (toList!839 lt!65171))) (_1!1282 (tuple2!2543 lt!65004 (minValue!2645 (v!3117 (underlying!435 thiss!992)))))))))))

(assert (= (and d!38621 c!23407) b!127488))

(assert (= (and d!38621 (not c!23407)) b!127489))

(assert (= (and b!127489 c!23408) b!127490))

(assert (= (and b!127489 (not c!23408)) b!127491))

(declare-fun m!149113 () Bool)

(assert (=> b!127490 m!149113))

(assert (=> b!126440 d!38621))

(declare-fun b!127492 () Bool)

(declare-fun e!83208 () Bool)

(declare-fun e!83206 () Bool)

(assert (=> b!127492 (= e!83208 e!83206)))

(declare-fun c!23409 () Bool)

(assert (=> b!127492 (= c!23409 (validKeyInArray!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000)))))

(declare-fun b!127493 () Bool)

(declare-fun call!13741 () Bool)

(assert (=> b!127493 (= e!83206 call!13741)))

(declare-fun d!38623 () Bool)

(declare-fun res!61590 () Bool)

(assert (=> d!38623 (=> res!61590 e!83208)))

(assert (=> d!38623 (= res!61590 (bvsge #b00000000000000000000000000000000 (size!2477 (_keys!4514 (_2!1283 lt!65108)))))))

(assert (=> d!38623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4514 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108))) e!83208)))

(declare-fun bm!13738 () Bool)

(assert (=> bm!13738 (= call!13741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4514 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108))))))

(declare-fun b!127494 () Bool)

(declare-fun e!83207 () Bool)

(assert (=> b!127494 (= e!83207 call!13741)))

(declare-fun b!127495 () Bool)

(assert (=> b!127495 (= e!83206 e!83207)))

(declare-fun lt!65918 () (_ BitVec 64))

(assert (=> b!127495 (= lt!65918 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000))))

(declare-fun lt!65917 () Unit!3922)

(assert (=> b!127495 (= lt!65917 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4514 (_2!1283 lt!65108)) lt!65918 #b00000000000000000000000000000000))))

(assert (=> b!127495 (arrayContainsKey!0 (_keys!4514 (_2!1283 lt!65108)) lt!65918 #b00000000000000000000000000000000)))

(declare-fun lt!65916 () Unit!3922)

(assert (=> b!127495 (= lt!65916 lt!65917)))

(declare-fun res!61591 () Bool)

(assert (=> b!127495 (= res!61591 (= (seekEntryOrOpen!0 (select (arr!2212 (_keys!4514 (_2!1283 lt!65108))) #b00000000000000000000000000000000) (_keys!4514 (_2!1283 lt!65108)) (mask!7037 (_2!1283 lt!65108))) (Found!273 #b00000000000000000000000000000000)))))

(assert (=> b!127495 (=> (not res!61591) (not e!83207))))

(assert (= (and d!38623 (not res!61590)) b!127492))

(assert (= (and b!127492 c!23409) b!127495))

(assert (= (and b!127492 (not c!23409)) b!127493))

(assert (= (and b!127495 res!61591) b!127494))

(assert (= (or b!127494 b!127493) bm!13738))

(assert (=> b!127492 m!147627))

(assert (=> b!127492 m!147627))

(assert (=> b!127492 m!147629))

(declare-fun m!149115 () Bool)

(assert (=> bm!13738 m!149115))

(assert (=> b!127495 m!147627))

(declare-fun m!149117 () Bool)

(assert (=> b!127495 m!149117))

(declare-fun m!149119 () Bool)

(assert (=> b!127495 m!149119))

(assert (=> b!127495 m!147627))

(declare-fun m!149121 () Bool)

(assert (=> b!127495 m!149121))

(assert (=> b!126649 d!38623))

(declare-fun b!127496 () Bool)

(declare-fun e!83209 () Option!171)

(assert (=> b!127496 (= e!83209 (Some!170 (_2!1282 (h!2290 (toList!839 lt!65384)))))))

(declare-fun e!83210 () Option!171)

(declare-fun b!127498 () Bool)

(assert (=> b!127498 (= e!83210 (getValueByKey!165 (t!6030 (toList!839 lt!65384)) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23410 () Bool)

(declare-fun d!38625 () Bool)

(assert (=> d!38625 (= c!23410 (and ((_ is Cons!1688) (toList!839 lt!65384)) (= (_1!1282 (h!2290 (toList!839 lt!65384))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38625 (= (getValueByKey!165 (toList!839 lt!65384) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!83209)))

(declare-fun b!127499 () Bool)

(assert (=> b!127499 (= e!83210 None!169)))

(declare-fun b!127497 () Bool)

(assert (=> b!127497 (= e!83209 e!83210)))

(declare-fun c!23411 () Bool)

(assert (=> b!127497 (= c!23411 (and ((_ is Cons!1688) (toList!839 lt!65384)) (not (= (_1!1282 (h!2290 (toList!839 lt!65384))) (_1!1282 (tuple2!2543 (select (arr!2212 (_keys!4514 (v!3117 (underlying!435 thiss!992)))) from!355) (get!1442 (select (arr!2213 (_values!2765 (v!3117 (underlying!435 thiss!992)))) from!355) (dynLambda!409 (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38625 c!23410) b!127496))

(assert (= (and d!38625 (not c!23410)) b!127497))

(assert (= (and b!127497 c!23411) b!127498))

(assert (= (and b!127497 (not c!23411)) b!127499))

(declare-fun m!149123 () Bool)

(assert (=> b!127498 m!149123))

(assert (=> b!126646 d!38625))

(declare-fun d!38627 () Bool)

(assert (=> d!38627 (= (apply!111 lt!65220 lt!65223) (get!1446 (getValueByKey!165 (toList!839 lt!65220) lt!65223)))))

(declare-fun bs!5277 () Bool)

(assert (= bs!5277 d!38627))

(declare-fun m!149125 () Bool)

(assert (=> bs!5277 m!149125))

(assert (=> bs!5277 m!149125))

(declare-fun m!149127 () Bool)

(assert (=> bs!5277 m!149127))

(assert (=> b!126520 d!38627))

(declare-fun d!38629 () Bool)

(assert (=> d!38629 (= (apply!111 (+!158 lt!65235 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) lt!65230) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65235 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))) lt!65230)))))

(declare-fun bs!5278 () Bool)

(assert (= bs!5278 d!38629))

(declare-fun m!149129 () Bool)

(assert (=> bs!5278 m!149129))

(assert (=> bs!5278 m!149129))

(declare-fun m!149131 () Bool)

(assert (=> bs!5278 m!149131))

(assert (=> b!126520 d!38629))

(declare-fun d!38631 () Bool)

(assert (=> d!38631 (= (apply!111 (+!158 lt!65220 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) lt!65223) (apply!111 lt!65220 lt!65223))))

(declare-fun lt!65919 () Unit!3922)

(assert (=> d!38631 (= lt!65919 (choose!769 lt!65220 lt!65218 (zeroValue!2645 newMap!16) lt!65223))))

(declare-fun e!83211 () Bool)

(assert (=> d!38631 e!83211))

(declare-fun res!61592 () Bool)

(assert (=> d!38631 (=> (not res!61592) (not e!83211))))

(assert (=> d!38631 (= res!61592 (contains!867 lt!65220 lt!65223))))

(assert (=> d!38631 (= (addApplyDifferent!87 lt!65220 lt!65218 (zeroValue!2645 newMap!16) lt!65223) lt!65919)))

(declare-fun b!127500 () Bool)

(assert (=> b!127500 (= e!83211 (not (= lt!65223 lt!65218)))))

(assert (= (and d!38631 res!61592) b!127500))

(declare-fun m!149133 () Bool)

(assert (=> d!38631 m!149133))

(declare-fun m!149135 () Bool)

(assert (=> d!38631 m!149135))

(assert (=> d!38631 m!147289))

(assert (=> d!38631 m!147295))

(assert (=> d!38631 m!147301))

(assert (=> d!38631 m!147289))

(assert (=> b!126520 d!38631))

(declare-fun d!38633 () Bool)

(assert (=> d!38633 (= (apply!111 lt!65236 lt!65228) (get!1446 (getValueByKey!165 (toList!839 lt!65236) lt!65228)))))

(declare-fun bs!5279 () Bool)

(assert (= bs!5279 d!38633))

(declare-fun m!149137 () Bool)

(assert (=> bs!5279 m!149137))

(assert (=> bs!5279 m!149137))

(declare-fun m!149139 () Bool)

(assert (=> bs!5279 m!149139))

(assert (=> b!126520 d!38633))

(declare-fun d!38635 () Bool)

(declare-fun e!83212 () Bool)

(assert (=> d!38635 e!83212))

(declare-fun res!61593 () Bool)

(assert (=> d!38635 (=> (not res!61593) (not e!83212))))

(declare-fun lt!65922 () ListLongMap!1647)

(assert (=> d!38635 (= res!61593 (contains!867 lt!65922 (_1!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65920 () List!1692)

(assert (=> d!38635 (= lt!65922 (ListLongMap!1648 lt!65920))))

(declare-fun lt!65923 () Unit!3922)

(declare-fun lt!65921 () Unit!3922)

(assert (=> d!38635 (= lt!65923 lt!65921)))

(assert (=> d!38635 (= (getValueByKey!165 lt!65920 (_1!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38635 (= lt!65921 (lemmaContainsTupThenGetReturnValue!83 lt!65920 (_1!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38635 (= lt!65920 (insertStrictlySorted!86 (toList!839 lt!65221) (_1!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38635 (= (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) lt!65922)))

(declare-fun b!127501 () Bool)

(declare-fun res!61594 () Bool)

(assert (=> b!127501 (=> (not res!61594) (not e!83212))))

(assert (=> b!127501 (= res!61594 (= (getValueByKey!165 (toList!839 lt!65922) (_1!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127502 () Bool)

(assert (=> b!127502 (= e!83212 (contains!869 (toList!839 lt!65922) (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38635 res!61593) b!127501))

(assert (= (and b!127501 res!61594) b!127502))

(declare-fun m!149141 () Bool)

(assert (=> d!38635 m!149141))

(declare-fun m!149143 () Bool)

(assert (=> d!38635 m!149143))

(declare-fun m!149145 () Bool)

(assert (=> d!38635 m!149145))

(declare-fun m!149147 () Bool)

(assert (=> d!38635 m!149147))

(declare-fun m!149149 () Bool)

(assert (=> b!127501 m!149149))

(declare-fun m!149151 () Bool)

(assert (=> b!127502 m!149151))

(assert (=> b!126520 d!38635))

(declare-fun d!38637 () Bool)

(declare-fun e!83213 () Bool)

(assert (=> d!38637 e!83213))

(declare-fun res!61595 () Bool)

(assert (=> d!38637 (=> (not res!61595) (not e!83213))))

(declare-fun lt!65926 () ListLongMap!1647)

(assert (=> d!38637 (= res!61595 (contains!867 lt!65926 (_1!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))))))

(declare-fun lt!65924 () List!1692)

(assert (=> d!38637 (= lt!65926 (ListLongMap!1648 lt!65924))))

(declare-fun lt!65927 () Unit!3922)

(declare-fun lt!65925 () Unit!3922)

(assert (=> d!38637 (= lt!65927 lt!65925)))

(assert (=> d!38637 (= (getValueByKey!165 lt!65924 (_1!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))))))

(assert (=> d!38637 (= lt!65925 (lemmaContainsTupThenGetReturnValue!83 lt!65924 (_1!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))))))

(assert (=> d!38637 (= lt!65924 (insertStrictlySorted!86 (toList!839 lt!65236) (_1!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))))))

(assert (=> d!38637 (= (+!158 lt!65236 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) lt!65926)))

(declare-fun b!127503 () Bool)

(declare-fun res!61596 () Bool)

(assert (=> b!127503 (=> (not res!61596) (not e!83213))))

(assert (=> b!127503 (= res!61596 (= (getValueByKey!165 (toList!839 lt!65926) (_1!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))))))))

(declare-fun b!127504 () Bool)

(assert (=> b!127504 (= e!83213 (contains!869 (toList!839 lt!65926) (tuple2!2543 lt!65229 (minValue!2645 newMap!16))))))

(assert (= (and d!38637 res!61595) b!127503))

(assert (= (and b!127503 res!61596) b!127504))

(declare-fun m!149153 () Bool)

(assert (=> d!38637 m!149153))

(declare-fun m!149155 () Bool)

(assert (=> d!38637 m!149155))

(declare-fun m!149157 () Bool)

(assert (=> d!38637 m!149157))

(declare-fun m!149159 () Bool)

(assert (=> d!38637 m!149159))

(declare-fun m!149161 () Bool)

(assert (=> b!127503 m!149161))

(declare-fun m!149163 () Bool)

(assert (=> b!127504 m!149163))

(assert (=> b!126520 d!38637))

(declare-fun d!38639 () Bool)

(assert (=> d!38639 (= (apply!111 (+!158 lt!65236 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) lt!65228) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65236 (tuple2!2543 lt!65229 (minValue!2645 newMap!16)))) lt!65228)))))

(declare-fun bs!5280 () Bool)

(assert (= bs!5280 d!38639))

(declare-fun m!149165 () Bool)

(assert (=> bs!5280 m!149165))

(assert (=> bs!5280 m!149165))

(declare-fun m!149167 () Bool)

(assert (=> bs!5280 m!149167))

(assert (=> b!126520 d!38639))

(declare-fun d!38641 () Bool)

(assert (=> d!38641 (= (apply!111 (+!158 lt!65235 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) lt!65230) (apply!111 lt!65235 lt!65230))))

(declare-fun lt!65928 () Unit!3922)

(assert (=> d!38641 (= lt!65928 (choose!769 lt!65235 lt!65219 (minValue!2645 newMap!16) lt!65230))))

(declare-fun e!83214 () Bool)

(assert (=> d!38641 e!83214))

(declare-fun res!61597 () Bool)

(assert (=> d!38641 (=> (not res!61597) (not e!83214))))

(assert (=> d!38641 (= res!61597 (contains!867 lt!65235 lt!65230))))

(assert (=> d!38641 (= (addApplyDifferent!87 lt!65235 lt!65219 (minValue!2645 newMap!16) lt!65230) lt!65928)))

(declare-fun b!127505 () Bool)

(assert (=> b!127505 (= e!83214 (not (= lt!65230 lt!65219)))))

(assert (= (and d!38641 res!61597) b!127505))

(declare-fun m!149169 () Bool)

(assert (=> d!38641 m!149169))

(declare-fun m!149171 () Bool)

(assert (=> d!38641 m!149171))

(assert (=> d!38641 m!147283))

(assert (=> d!38641 m!147285))

(assert (=> d!38641 m!147299))

(assert (=> d!38641 m!147283))

(assert (=> b!126520 d!38641))

(declare-fun d!38643 () Bool)

(assert (=> d!38643 (= (apply!111 (+!158 lt!65220 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) lt!65223) (get!1446 (getValueByKey!165 (toList!839 (+!158 lt!65220 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))) lt!65223)))))

(declare-fun bs!5281 () Bool)

(assert (= bs!5281 d!38643))

(declare-fun m!149173 () Bool)

(assert (=> bs!5281 m!149173))

(assert (=> bs!5281 m!149173))

(declare-fun m!149175 () Bool)

(assert (=> bs!5281 m!149175))

(assert (=> b!126520 d!38643))

(declare-fun d!38645 () Bool)

(declare-fun e!83215 () Bool)

(assert (=> d!38645 e!83215))

(declare-fun res!61598 () Bool)

(assert (=> d!38645 (=> res!61598 e!83215)))

(declare-fun lt!65931 () Bool)

(assert (=> d!38645 (= res!61598 (not lt!65931))))

(declare-fun lt!65929 () Bool)

(assert (=> d!38645 (= lt!65931 lt!65929)))

(declare-fun lt!65932 () Unit!3922)

(declare-fun e!83216 () Unit!3922)

(assert (=> d!38645 (= lt!65932 e!83216)))

(declare-fun c!23412 () Bool)

(assert (=> d!38645 (= c!23412 lt!65929)))

(assert (=> d!38645 (= lt!65929 (containsKey!169 (toList!839 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) lt!65231))))

(assert (=> d!38645 (= (contains!867 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) lt!65231) lt!65931)))

(declare-fun b!127506 () Bool)

(declare-fun lt!65930 () Unit!3922)

(assert (=> b!127506 (= e!83216 lt!65930)))

(assert (=> b!127506 (= lt!65930 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!839 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) lt!65231))))

(assert (=> b!127506 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) lt!65231))))

(declare-fun b!127507 () Bool)

(declare-fun Unit!3979 () Unit!3922)

(assert (=> b!127507 (= e!83216 Unit!3979)))

(declare-fun b!127508 () Bool)

(assert (=> b!127508 (= e!83215 (isDefined!119 (getValueByKey!165 (toList!839 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16)))) lt!65231)))))

(assert (= (and d!38645 c!23412) b!127506))

(assert (= (and d!38645 (not c!23412)) b!127507))

(assert (= (and d!38645 (not res!61598)) b!127508))

(declare-fun m!149177 () Bool)

(assert (=> d!38645 m!149177))

(declare-fun m!149179 () Bool)

(assert (=> b!127506 m!149179))

(declare-fun m!149181 () Bool)

(assert (=> b!127506 m!149181))

(assert (=> b!127506 m!149181))

(declare-fun m!149183 () Bool)

(assert (=> b!127506 m!149183))

(assert (=> b!127508 m!149181))

(assert (=> b!127508 m!149181))

(assert (=> b!127508 m!149183))

(assert (=> b!126520 d!38645))

(declare-fun d!38647 () Bool)

(declare-fun e!83217 () Bool)

(assert (=> d!38647 e!83217))

(declare-fun res!61599 () Bool)

(assert (=> d!38647 (=> (not res!61599) (not e!83217))))

(declare-fun lt!65935 () ListLongMap!1647)

(assert (=> d!38647 (= res!61599 (contains!867 lt!65935 (_1!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))))))

(declare-fun lt!65933 () List!1692)

(assert (=> d!38647 (= lt!65935 (ListLongMap!1648 lt!65933))))

(declare-fun lt!65936 () Unit!3922)

(declare-fun lt!65934 () Unit!3922)

(assert (=> d!38647 (= lt!65936 lt!65934)))

(assert (=> d!38647 (= (getValueByKey!165 lt!65933 (_1!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))))))

(assert (=> d!38647 (= lt!65934 (lemmaContainsTupThenGetReturnValue!83 lt!65933 (_1!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))))))

(assert (=> d!38647 (= lt!65933 (insertStrictlySorted!86 (toList!839 lt!65235) (_1!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))))))

(assert (=> d!38647 (= (+!158 lt!65235 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))) lt!65935)))

(declare-fun b!127509 () Bool)

(declare-fun res!61600 () Bool)

(assert (=> b!127509 (=> (not res!61600) (not e!83217))))

(assert (=> b!127509 (= res!61600 (= (getValueByKey!165 (toList!839 lt!65935) (_1!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65219 (minValue!2645 newMap!16))))))))

(declare-fun b!127510 () Bool)

(assert (=> b!127510 (= e!83217 (contains!869 (toList!839 lt!65935) (tuple2!2543 lt!65219 (minValue!2645 newMap!16))))))

(assert (= (and d!38647 res!61599) b!127509))

(assert (= (and b!127509 res!61600) b!127510))

(declare-fun m!149185 () Bool)

(assert (=> d!38647 m!149185))

(declare-fun m!149187 () Bool)

(assert (=> d!38647 m!149187))

(declare-fun m!149189 () Bool)

(assert (=> d!38647 m!149189))

(declare-fun m!149191 () Bool)

(assert (=> d!38647 m!149191))

(declare-fun m!149193 () Bool)

(assert (=> b!127509 m!149193))

(declare-fun m!149195 () Bool)

(assert (=> b!127510 m!149195))

(assert (=> b!126520 d!38647))

(declare-fun d!38649 () Bool)

(assert (=> d!38649 (= (apply!111 lt!65235 lt!65230) (get!1446 (getValueByKey!165 (toList!839 lt!65235) lt!65230)))))

(declare-fun bs!5282 () Bool)

(assert (= bs!5282 d!38649))

(declare-fun m!149197 () Bool)

(assert (=> bs!5282 m!149197))

(assert (=> bs!5282 m!149197))

(declare-fun m!149199 () Bool)

(assert (=> bs!5282 m!149199))

(assert (=> b!126520 d!38649))

(declare-fun d!38651 () Bool)

(assert (=> d!38651 (contains!867 (+!158 lt!65221 (tuple2!2543 lt!65234 (zeroValue!2645 newMap!16))) lt!65231)))

(declare-fun lt!65937 () Unit!3922)

(assert (=> d!38651 (= lt!65937 (choose!770 lt!65221 lt!65234 (zeroValue!2645 newMap!16) lt!65231))))

(assert (=> d!38651 (contains!867 lt!65221 lt!65231)))

(assert (=> d!38651 (= (addStillContains!87 lt!65221 lt!65234 (zeroValue!2645 newMap!16) lt!65231) lt!65937)))

(declare-fun bs!5283 () Bool)

(assert (= bs!5283 d!38651))

(assert (=> bs!5283 m!147277))

(assert (=> bs!5283 m!147277))

(assert (=> bs!5283 m!147279))

(declare-fun m!149201 () Bool)

(assert (=> bs!5283 m!149201))

(declare-fun m!149203 () Bool)

(assert (=> bs!5283 m!149203))

(assert (=> b!126520 d!38651))

(assert (=> b!126520 d!38245))

(declare-fun d!38653 () Bool)

(assert (=> d!38653 (= (apply!111 (+!158 lt!65236 (tuple2!2543 lt!65229 (minValue!2645 newMap!16))) lt!65228) (apply!111 lt!65236 lt!65228))))

(declare-fun lt!65938 () Unit!3922)

(assert (=> d!38653 (= lt!65938 (choose!769 lt!65236 lt!65229 (minValue!2645 newMap!16) lt!65228))))

(declare-fun e!83218 () Bool)

(assert (=> d!38653 e!83218))

(declare-fun res!61601 () Bool)

(assert (=> d!38653 (=> (not res!61601) (not e!83218))))

(assert (=> d!38653 (= res!61601 (contains!867 lt!65236 lt!65228))))

(assert (=> d!38653 (= (addApplyDifferent!87 lt!65236 lt!65229 (minValue!2645 newMap!16) lt!65228) lt!65938)))

(declare-fun b!127511 () Bool)

(assert (=> b!127511 (= e!83218 (not (= lt!65228 lt!65229)))))

(assert (= (and d!38653 res!61601) b!127511))

(declare-fun m!149205 () Bool)

(assert (=> d!38653 m!149205))

(declare-fun m!149207 () Bool)

(assert (=> d!38653 m!149207))

(assert (=> d!38653 m!147281))

(assert (=> d!38653 m!147303))

(assert (=> d!38653 m!147297))

(assert (=> d!38653 m!147281))

(assert (=> b!126520 d!38653))

(declare-fun d!38655 () Bool)

(declare-fun e!83219 () Bool)

(assert (=> d!38655 e!83219))

(declare-fun res!61602 () Bool)

(assert (=> d!38655 (=> (not res!61602) (not e!83219))))

(declare-fun lt!65941 () ListLongMap!1647)

(assert (=> d!38655 (= res!61602 (contains!867 lt!65941 (_1!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65939 () List!1692)

(assert (=> d!38655 (= lt!65941 (ListLongMap!1648 lt!65939))))

(declare-fun lt!65942 () Unit!3922)

(declare-fun lt!65940 () Unit!3922)

(assert (=> d!38655 (= lt!65942 lt!65940)))

(assert (=> d!38655 (= (getValueByKey!165 lt!65939 (_1!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38655 (= lt!65940 (lemmaContainsTupThenGetReturnValue!83 lt!65939 (_1!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38655 (= lt!65939 (insertStrictlySorted!86 (toList!839 lt!65220) (_1!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) (_2!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38655 (= (+!158 lt!65220 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))) lt!65941)))

(declare-fun b!127512 () Bool)

(declare-fun res!61603 () Bool)

(assert (=> b!127512 (=> (not res!61603) (not e!83219))))

(assert (=> b!127512 (= res!61603 (= (getValueByKey!165 (toList!839 lt!65941) (_1!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16)))) (Some!170 (_2!1282 (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127513 () Bool)

(assert (=> b!127513 (= e!83219 (contains!869 (toList!839 lt!65941) (tuple2!2543 lt!65218 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38655 res!61602) b!127512))

(assert (= (and b!127512 res!61603) b!127513))

(declare-fun m!149209 () Bool)

(assert (=> d!38655 m!149209))

(declare-fun m!149211 () Bool)

(assert (=> d!38655 m!149211))

(declare-fun m!149213 () Bool)

(assert (=> d!38655 m!149213))

(declare-fun m!149215 () Bool)

(assert (=> d!38655 m!149215))

(declare-fun m!149217 () Bool)

(assert (=> b!127512 m!149217))

(declare-fun m!149219 () Bool)

(assert (=> b!127513 m!149219))

(assert (=> b!126520 d!38655))

(declare-fun d!38657 () Bool)

(declare-fun lt!65945 () Bool)

(declare-fun content!126 (List!1694) (InoxSet (_ BitVec 64)))

(assert (=> d!38657 (= lt!65945 (select (content!126 Nil!1691) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83225 () Bool)

(assert (=> d!38657 (= lt!65945 e!83225)))

(declare-fun res!61608 () Bool)

(assert (=> d!38657 (=> (not res!61608) (not e!83225))))

(assert (=> d!38657 (= res!61608 ((_ is Cons!1690) Nil!1691))))

(assert (=> d!38657 (= (contains!870 Nil!1691 (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)) lt!65945)))

(declare-fun b!127518 () Bool)

(declare-fun e!83224 () Bool)

(assert (=> b!127518 (= e!83225 e!83224)))

(declare-fun res!61609 () Bool)

(assert (=> b!127518 (=> res!61609 e!83224)))

(assert (=> b!127518 (= res!61609 (= (h!2292 Nil!1691) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127519 () Bool)

(assert (=> b!127519 (= e!83224 (contains!870 (t!6040 Nil!1691) (select (arr!2212 (_keys!4514 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38657 res!61608) b!127518))

(assert (= (and b!127518 (not res!61609)) b!127519))

(declare-fun m!149221 () Bool)

(assert (=> d!38657 m!149221))

(assert (=> d!38657 m!147085))

(declare-fun m!149223 () Bool)

(assert (=> d!38657 m!149223))

(assert (=> b!127519 m!147085))

(declare-fun m!149225 () Bool)

(assert (=> b!127519 m!149225))

(assert (=> b!126438 d!38657))

(declare-fun d!38659 () Bool)

(assert (=> d!38659 (= (inRange!0 (index!3248 lt!65255) (mask!7037 newMap!16)) (and (bvsge (index!3248 lt!65255) #b00000000000000000000000000000000) (bvslt (index!3248 lt!65255) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!126542 d!38659))

(declare-fun b!127520 () Bool)

(declare-fun e!83226 () (_ BitVec 32))

(declare-fun call!13742 () (_ BitVec 32))

(assert (=> b!127520 (= e!83226 (bvadd #b00000000000000000000000000000001 call!13742))))

(declare-fun bm!13739 () Bool)

(assert (=> bm!13739 (= call!13742 (arrayCountValidKeys!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(declare-fun b!127521 () Bool)

(assert (=> b!127521 (= e!83226 call!13742)))

(declare-fun b!127522 () Bool)

(declare-fun e!83227 () (_ BitVec 32))

(assert (=> b!127522 (= e!83227 #b00000000000000000000000000000000)))

(declare-fun b!127523 () Bool)

(assert (=> b!127523 (= e!83227 e!83226)))

(declare-fun c!23413 () Bool)

(assert (=> b!127523 (= c!23413 (validKeyInArray!0 (select (arr!2212 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38661 () Bool)

(declare-fun lt!65946 () (_ BitVec 32))

(assert (=> d!38661 (and (bvsge lt!65946 #b00000000000000000000000000000000) (bvsle lt!65946 (bvsub (size!2477 (_keys!4514 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!38661 (= lt!65946 e!83227)))

(declare-fun c!23414 () Bool)

(assert (=> d!38661 (= c!23414 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38661 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2477 (_keys!4514 newMap!16)) (size!2477 (_keys!4514 newMap!16))))))

(assert (=> d!38661 (= (arrayCountValidKeys!0 (_keys!4514 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2477 (_keys!4514 newMap!16))) lt!65946)))

(assert (= (and d!38661 c!23414) b!127522))

(assert (= (and d!38661 (not c!23414)) b!127523))

(assert (= (and b!127523 c!23413) b!127520))

(assert (= (and b!127523 (not c!23413)) b!127521))

(assert (= (or b!127520 b!127521) bm!13739))

(declare-fun m!149227 () Bool)

(assert (=> bm!13739 m!149227))

(assert (=> b!127523 m!147903))

(assert (=> b!127523 m!147903))

(assert (=> b!127523 m!148187))

(assert (=> bm!13592 d!38661))

(declare-fun d!38663 () Bool)

(assert (=> d!38663 (= (inRange!0 (ite c!23153 (index!3248 lt!65341) (ite c!23152 (index!3247 lt!65332) (index!3250 lt!65332))) (mask!7037 newMap!16)) (and (bvsge (ite c!23153 (index!3248 lt!65341) (ite c!23152 (index!3247 lt!65332) (index!3250 lt!65332))) #b00000000000000000000000000000000) (bvslt (ite c!23153 (index!3248 lt!65341) (ite c!23152 (index!3247 lt!65332) (index!3250 lt!65332))) (bvadd (mask!7037 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13616 d!38663))

(declare-fun b!127525 () Bool)

(declare-fun e!83228 () Bool)

(assert (=> b!127525 (= e!83228 tp_is_empty!2839)))

(declare-fun b!127524 () Bool)

(declare-fun e!83229 () Bool)

(assert (=> b!127524 (= e!83229 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4513 () Bool)

(declare-fun mapRes!4513 () Bool)

(assert (=> mapIsEmpty!4513 mapRes!4513))

(declare-fun condMapEmpty!4513 () Bool)

(declare-fun mapDefault!4513 () ValueCell!1076)

(assert (=> mapNonEmpty!4512 (= condMapEmpty!4513 (= mapRest!4512 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4513)))))

(assert (=> mapNonEmpty!4512 (= tp!10974 (and e!83228 mapRes!4513))))

(declare-fun mapNonEmpty!4513 () Bool)

(declare-fun tp!10975 () Bool)

(assert (=> mapNonEmpty!4513 (= mapRes!4513 (and tp!10975 e!83229))))

(declare-fun mapKey!4513 () (_ BitVec 32))

(declare-fun mapValue!4513 () ValueCell!1076)

(declare-fun mapRest!4513 () (Array (_ BitVec 32) ValueCell!1076))

(assert (=> mapNonEmpty!4513 (= mapRest!4512 (store mapRest!4513 mapKey!4513 mapValue!4513))))

(assert (= (and mapNonEmpty!4512 condMapEmpty!4513) mapIsEmpty!4513))

(assert (= (and mapNonEmpty!4512 (not condMapEmpty!4513)) mapNonEmpty!4513))

(assert (= (and mapNonEmpty!4513 ((_ is ValueCellFull!1076) mapValue!4513)) b!127524))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1076) mapDefault!4513)) b!127525))

(declare-fun m!149229 () Bool)

(assert (=> mapNonEmpty!4513 m!149229))

(declare-fun b!127527 () Bool)

(declare-fun e!83230 () Bool)

(assert (=> b!127527 (= e!83230 tp_is_empty!2839)))

(declare-fun b!127526 () Bool)

(declare-fun e!83231 () Bool)

(assert (=> b!127526 (= e!83231 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4514 () Bool)

(declare-fun mapRes!4514 () Bool)

(assert (=> mapIsEmpty!4514 mapRes!4514))

(declare-fun condMapEmpty!4514 () Bool)

(declare-fun mapDefault!4514 () ValueCell!1076)

(assert (=> mapNonEmpty!4511 (= condMapEmpty!4514 (= mapRest!4511 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4514)))))

(assert (=> mapNonEmpty!4511 (= tp!10973 (and e!83230 mapRes!4514))))

(declare-fun mapNonEmpty!4514 () Bool)

(declare-fun tp!10976 () Bool)

(assert (=> mapNonEmpty!4514 (= mapRes!4514 (and tp!10976 e!83231))))

(declare-fun mapValue!4514 () ValueCell!1076)

(declare-fun mapRest!4514 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapKey!4514 () (_ BitVec 32))

(assert (=> mapNonEmpty!4514 (= mapRest!4511 (store mapRest!4514 mapKey!4514 mapValue!4514))))

(assert (= (and mapNonEmpty!4511 condMapEmpty!4514) mapIsEmpty!4514))

(assert (= (and mapNonEmpty!4511 (not condMapEmpty!4514)) mapNonEmpty!4514))

(assert (= (and mapNonEmpty!4514 ((_ is ValueCellFull!1076) mapValue!4514)) b!127526))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1076) mapDefault!4514)) b!127527))

(declare-fun m!149231 () Bool)

(assert (=> mapNonEmpty!4514 m!149231))

(declare-fun b_lambda!5607 () Bool)

(assert (= b_lambda!5587 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5607)))

(declare-fun b_lambda!5609 () Bool)

(assert (= b_lambda!5581 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5609)))

(declare-fun b_lambda!5611 () Bool)

(assert (= b_lambda!5597 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5611)))

(declare-fun b_lambda!5613 () Bool)

(assert (= b_lambda!5603 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5613)))

(declare-fun b_lambda!5615 () Bool)

(assert (= b_lambda!5585 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5615)))

(declare-fun b_lambda!5617 () Bool)

(assert (= b_lambda!5601 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5617)))

(declare-fun b_lambda!5619 () Bool)

(assert (= b_lambda!5605 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5619)))

(declare-fun b_lambda!5621 () Bool)

(assert (= b_lambda!5593 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5621)))

(declare-fun b_lambda!5623 () Bool)

(assert (= b_lambda!5583 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5623)))

(declare-fun b_lambda!5625 () Bool)

(assert (= b_lambda!5579 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5625)))

(declare-fun b_lambda!5627 () Bool)

(assert (= b_lambda!5599 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5627)))

(declare-fun b_lambda!5629 () Bool)

(assert (= b_lambda!5591 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5629)))

(declare-fun b_lambda!5631 () Bool)

(assert (= b_lambda!5595 (or (and b!126004 b_free!2845) (and b!126008 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))))) b_lambda!5631)))

(declare-fun b_lambda!5633 () Bool)

(assert (= b_lambda!5589 (or (and b!126004 b_free!2845 (= (defaultEntry!2782 (v!3117 (underlying!435 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126008 b_free!2847) b_lambda!5633)))

(check-sat (not b!126697) (not d!38577) (not b!127405) (not b!127466) (not b!127402) (not b!127379) (not d!38511) (not d!38605) (not d!38323) (not d!38355) (not d!38503) (not d!38189) (not b!126934) (not b!126714) (not b!127078) (not b!127166) (not b!127164) (not bm!13681) (not d!38571) (not b!126952) (not b!127009) (not b!127211) (not d!38525) (not d!38281) (not b!127346) (not b!127463) (not d!38647) (not d!38523) (not d!38445) (not b!126836) (not bm!13718) (not d!38449) (not b!127417) (not d!38207) (not bm!13659) (not d!38311) (not d!38165) (not b!127183) (not b!127024) (not b!127503) (not b!127192) (not b!127334) (not b!126912) (not d!38457) (not b!127089) (not d!38319) (not b!126703) (not d!38373) (not b!127304) (not b_lambda!5573) (not b!127209) (not b!126937) (not b_next!2845) (not d!38187) (not bm!13738) (not bm!13678) (not b!127071) (not b!126693) (not d!38185) (not b_lambda!5555) (not d!38539) (not d!38439) (not b!127108) (not b!126950) (not b_lambda!5577) (not b!127270) (not b!127088) (not d!38183) (not b!127236) (not mapNonEmpty!4513) (not b!126699) (not b!127387) (not b!126967) (not b!126960) (not d!38411) (not bm!13687) (not b!127111) (not d!38569) (not b!127116) (not b!126806) (not b!126935) (not d!38629) (not b_next!2847) (not b!126813) (not d!38377) (not b!127508) (not b!127473) (not bm!13736) (not d!38611) (not b!126844) (not b!127335) (not b!126766) (not d!38515) (not b!127460) (not b!127461) (not d!38329) (not b!126994) (not b!126875) (not b!127102) (not d!38245) (not bm!13715) (not b!127510) (not b!126742) (not d!38637) (not b!127424) (not bm!13645) (not d!38495) (not b!127336) (not b!127464) (not b!126863) (not b!126843) (not b!127422) (not d!38287) (not d!38163) (not b!127397) (not d!38173) (not b!127350) (not b!127492) (not b!127360) (not d!38177) (not b_lambda!5569) (not b!126811) (not d!38443) (not d!38217) (not b!127504) (not d!38481) (not b!126764) (not b!127081) (not b!127141) (not d!38633) (not b!126715) (not b!127370) (not d!38175) (not b!127137) (not b!127180) (not b_lambda!5631) (not b!127059) (not b!126887) (not d!38393) (not bm!13721) (not b!127103) (not b!127044) (not b!126969) (not b!126737) (not b!127472) (not b!126839) (not b!126736) (not b!126963) (not b!127302) (not d!38527) (not b!127208) (not b_lambda!5615) (not d!38559) (not b!126946) (not bm!13739) (not b!127175) (not d!38293) (not b!127062) (not b!127163) (not bm!13641) (not b!127495) (not bm!13688) (not d!38643) (not b!126711) (not b!126862) (not b!126709) (not b!127469) (not d!38655) (not b!126997) (not d!38507) (not d!38247) (not b!127020) (not b!127289) (not d!38583) (not bm!13730) (not bm!13665) (not bm!13692) (not b!127392) (not b!127120) (not b!126998) (not b!127359) (not b!127129) (not b!127154) (not b!127506) (not bm!13674) (not b!127079) (not bm!13644) (not bm!13714) (not b!127016) (not d!38517) (not b!126751) (not b!126735) (not b!127153) (not b!127285) (not d!38593) (not d!38465) (not b!127158) (not b!126886) (not d!38405) (not b_lambda!5633) (not b!126733) (not d!38649) (not bm!13716) (not d!38417) (not d!38315) (not b!126747) (not d!38533) (not d!38381) (not b!127407) (not b!126732) (not b!126851) (not b!126777) (not d!38387) (not b!126910) (not b!126728) (not d!38463) (not b!127337) (not b!127340) (not bm!13646) (not d!38251) (not d!38275) (not d!38447) (not d!38341) (not d!38343) (not b!126980) (not b!127012) (not b_lambda!5567) (not b!127390) (not b!127007) (not b!127375) (not b!126976) (not b!127203) (not b!126978) (not bm!13720) (not b!127414) (not b!127339) (not b!126918) (not b!127056) (not d!38235) (not b!126723) (not bm!13719) (not b!127230) (not d!38365) (not b!126698) (not d!38617) (not d!38215) (not b!126721) (not b!126898) (not d!38437) (not b!127324) (not b!127444) (not b!127124) (not b_lambda!5575) (not b!127107) (not d!38535) (not b!126712) (not b!126820) (not d!38489) (not b!127279) (not d!38591) (not b!126725) (not b!126815) (not b_lambda!5571) (not b!127176) (not b!126859) (not b!127426) (not d!38477) (not b!127233) (not d!38279) (not b!126701) (not b!126848) (not b!126905) (not b!126871) (not b!126895) (not d!38197) (not b!127284) (not b!127202) (not b!127381) (not b!127471) (not d!38249) (not b_lambda!5621) (not b!127283) (not d!38221) (not d!38537) (not d!38505) (not d!38297) (not b!127239) (not d!38645) (not b_lambda!5607) (not b!126958) (not b!126870) (not b!127035) (not b!127367) (not b!126962) (not b!127115) (not d!38169) (not b!126845) (not d!38603) (not b_lambda!5619) (not d!38205) (not d!38459) (not d!38339) (not b!126949) (not b_lambda!5609) (not bm!13697) (not b!126947) (not b!126849) (not d!38193) (not b!126879) (not b!127272) (not d!38327) (not d!38607) (not b!127480) (not d!38555) (not bm!13658) (not b!126985) (not bm!13654) (not d!38199) (not b!127345) (not b!127490) (not bm!13733) (not b!126853) (not b!127097) (not b!127232) (not b!127287) (not b!127143) (not b!126856) (not bm!13696) (not bm!13705) (not b!126854) (not d!38229) (not d!38547) (not b!127112) (not b!127362) (not b!127067) (not b!127106) (not b!127274) (not b!127440) (not d!38453) (not d!38597) (not b!126907) (not b_lambda!5625) (not b!127128) (not d!38635) (not d!38171) (not d!38467) (not bm!13670) (not bm!13660) (not b!127002) (not b!126760) (not b!127148) (not b!127064) (not bm!13679) (not b!127238) (not b!127512) (not b!126809) (not b!127501) (not d!38469) (not d!38485) (not b!127187) (not b!126812) (not b!126951) (not b!127344) (not b!126739) (not b!127513) (not b!126771) (not b!126972) (not b_lambda!5611) (not b!126953) (not d!38181) (not b!127333) (not d!38399) (not b!127011) (not b!127343) (not b!126807) (not b!126965) (not b!126840) (not bm!13675) (not b!127433) (not b!127070) (not b!127048) (not bm!13640) (not b!126720) tp_is_empty!2839 (not b_lambda!5629) (not b!127419) (not d!38333) (not b!126763) (not b!127162) (not d!38237) (not d!38239) (not b_lambda!5617) (not b!127151) (not b!127225) (not b!127523) (not b!126943) (not d!38255) (not b!127245) (not b!127032) (not bm!13710) (not b!127451) (not d!38299) (not b!127425) (not b!127349) (not b!126757) (not bm!13694) (not d!38347) (not d!38455) (not d!38375) (not d!38271) (not b!126816) (not b!127090) (not b!126900) (not d!38321) (not b!127452) (not d!38529) (not b!127098) (not b!127205) (not b!126927) (not d!38307) (not b!127005) (not b!127235) (not b!127242) (not d!38431) (not b_lambda!5627) (not b!126923) (not b!126828) (not d!38419) (not b!127086) (not b!126824) (not d!38561) (not b!127184) (not b!126744) (not b!126987) (not b!127178) (not b!127185) b_and!7843 (not mapNonEmpty!4514) (not b!126889) (not b!127083) (not b!127484) (not b!126984) (not bm!13693) (not d!38223) (not d!38475) (not d!38451) (not b!127481) (not b!127502) (not b!127031) (not d!38619) (not bm!13711) (not d!38595) (not b!127058) (not d!38361) (not d!38413) (not b!127275) (not b!126846) (not d!38195) (not b!127038) (not bm!13726) (not b!127069) (not d!38541) (not b!127403) (not b!126718) (not d!38651) (not b!127126) (not d!38513) (not b!127177) (not d!38301) (not b!127354) (not d!38553) (not b!127446) (not b!127449) (not b!127001) (not b!126938) (not b_lambda!5551) (not b!126926) (not d!38653) (not b!127000) (not b!127045) (not b!127358) (not d!38531) (not b!127416) (not b!127401) (not b!127338) (not d!38639) (not b!127139) (not b!127364) (not b!127487) (not b!126727) (not b!127351) (not b!127026) (not b!126981) (not b!126992) (not b!126903) (not b!126726) (not b!127049) (not d!38521) (not bm!13704) (not bm!13689) (not d!38433) (not d!38313) (not d!38409) (not b!126756) (not b!127168) (not b!126689) (not b!126944) (not b!127393) (not b!127041) (not bm!13671) (not b!127022) (not b!127498) (not b!126925) (not b!126916) (not b!127519) (not b!127509) (not b!126939) (not b!127021) (not b!126837) (not b!127109) (not d!38233) (not bm!13668) (not b!127301) (not d!38441) (not b!127347) (not b!126826) (not b!126909) (not d!38585) (not bm!13724) (not b!127485) (not d!38261) (not d!38179) (not d!38501) (not bm!13676) (not b!127051) (not b_lambda!5613) (not d!38487) (not d!38497) (not d!38369) (not d!38579) (not b!127138) (not bm!13702) (not d!38587) (not d!38335) (not d!38191) (not b!126778) (not b!127061) (not b!127296) (not d!38259) (not b!127053) (not b_lambda!5623) (not b!126719) (not b!126941) (not d!38613) (not b!126986) (not d!38421) (not d!38227) (not b!126825) (not bm!13663) (not b!127384) (not bm!13701) (not d!38601) (not b!126768) (not b!127365) (not d!38461) (not b!127133) (not d!38631) (not b!127368) (not b!126830) (not b!126799) b_and!7841 (not b!127453) (not d!38627) (not d!38557) (not bm!13686) (not bm!13728) (not b!127434) (not b!127437) (not bm!13684) (not b!126688) (not b!127100) (not d!38331) (not bm!13700) (not d!38277) (not b!126731) (not bm!13725) (not b!127243) (not d!38267) (not b!126913) (not d!38391) (not d!38483) (not b!127363) (not bm!13642) (not d!38657) (not d!38289) (not b!126861) (not b!127271) (not b!126989) (not bm!13662) (not b!126920) (not d!38641) (not d!38161) (not b!127298) (not d!38325) (not b!126911) (not b!126940) (not d!38519))
(check-sat b_and!7841 b_and!7843 (not b_next!2845) (not b_next!2847))
