; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79918 () Bool)

(assert start!79918)

(declare-fun b!939755 () Bool)

(declare-fun b_free!17799 () Bool)

(declare-fun b_next!17799 () Bool)

(assert (=> b!939755 (= b_free!17799 (not b_next!17799))))

(declare-fun tp!61865 () Bool)

(declare-fun b_and!29211 () Bool)

(assert (=> b!939755 (= tp!61865 b_and!29211)))

(declare-fun res!632015 () Bool)

(declare-fun e!527927 () Bool)

(assert (=> start!79918 (=> (not res!632015) (not e!527927))))

(declare-datatypes ((V!32041 0))(
  ( (V!32042 (val!10204 Int)) )
))
(declare-datatypes ((ValueCell!9672 0))(
  ( (ValueCellFull!9672 (v!12735 V!32041)) (EmptyCell!9672) )
))
(declare-datatypes ((array!56558 0))(
  ( (array!56559 (arr!27216 (Array (_ BitVec 32) ValueCell!9672)) (size!27676 (_ BitVec 32))) )
))
(declare-datatypes ((array!56560 0))(
  ( (array!56561 (arr!27217 (Array (_ BitVec 32) (_ BitVec 64))) (size!27677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4494 0))(
  ( (LongMapFixedSize!4495 (defaultEntry!5538 Int) (mask!27058 (_ BitVec 32)) (extraKeys!5270 (_ BitVec 32)) (zeroValue!5374 V!32041) (minValue!5374 V!32041) (_size!2302 (_ BitVec 32)) (_keys!10387 array!56560) (_values!5561 array!56558) (_vacant!2302 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4494)

(declare-fun valid!1726 (LongMapFixedSize!4494) Bool)

(assert (=> start!79918 (= res!632015 (valid!1726 thiss!1141))))

(assert (=> start!79918 e!527927))

(declare-fun e!527930 () Bool)

(assert (=> start!79918 e!527930))

(assert (=> start!79918 true))

(declare-fun b!939753 () Bool)

(assert (=> b!939753 (= e!527927 (not (= (size!27677 (_keys!10387 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27058 thiss!1141)))))))

(declare-fun b!939754 () Bool)

(declare-fun e!527928 () Bool)

(declare-fun tp_is_empty!20307 () Bool)

(assert (=> b!939754 (= e!527928 tp_is_empty!20307)))

(declare-fun e!527925 () Bool)

(declare-fun array_inv!21166 (array!56560) Bool)

(declare-fun array_inv!21167 (array!56558) Bool)

(assert (=> b!939755 (= e!527930 (and tp!61865 tp_is_empty!20307 (array_inv!21166 (_keys!10387 thiss!1141)) (array_inv!21167 (_values!5561 thiss!1141)) e!527925))))

(declare-fun mapIsEmpty!32244 () Bool)

(declare-fun mapRes!32244 () Bool)

(assert (=> mapIsEmpty!32244 mapRes!32244))

(declare-fun b!939756 () Bool)

(declare-fun e!527929 () Bool)

(assert (=> b!939756 (= e!527925 (and e!527929 mapRes!32244))))

(declare-fun condMapEmpty!32244 () Bool)

(declare-fun mapDefault!32244 () ValueCell!9672)

(assert (=> b!939756 (= condMapEmpty!32244 (= (arr!27216 (_values!5561 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9672)) mapDefault!32244)))))

(declare-fun b!939757 () Bool)

(assert (=> b!939757 (= e!527929 tp_is_empty!20307)))

(declare-fun b!939758 () Bool)

(declare-fun res!632016 () Bool)

(assert (=> b!939758 (=> (not res!632016) (not e!527927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939758 (= res!632016 (validMask!0 (mask!27058 thiss!1141)))))

(declare-fun b!939759 () Bool)

(declare-fun res!632017 () Bool)

(assert (=> b!939759 (=> (not res!632017) (not e!527927))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939759 (= res!632017 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32244 () Bool)

(declare-fun tp!61864 () Bool)

(assert (=> mapNonEmpty!32244 (= mapRes!32244 (and tp!61864 e!527928))))

(declare-fun mapKey!32244 () (_ BitVec 32))

(declare-fun mapRest!32244 () (Array (_ BitVec 32) ValueCell!9672))

(declare-fun mapValue!32244 () ValueCell!9672)

(assert (=> mapNonEmpty!32244 (= (arr!27216 (_values!5561 thiss!1141)) (store mapRest!32244 mapKey!32244 mapValue!32244))))

(assert (= (and start!79918 res!632015) b!939759))

(assert (= (and b!939759 res!632017) b!939758))

(assert (= (and b!939758 res!632016) b!939753))

(assert (= (and b!939756 condMapEmpty!32244) mapIsEmpty!32244))

(assert (= (and b!939756 (not condMapEmpty!32244)) mapNonEmpty!32244))

(get-info :version)

(assert (= (and mapNonEmpty!32244 ((_ is ValueCellFull!9672) mapValue!32244)) b!939754))

(assert (= (and b!939756 ((_ is ValueCellFull!9672) mapDefault!32244)) b!939757))

(assert (= b!939755 b!939756))

(assert (= start!79918 b!939755))

(declare-fun m!875495 () Bool)

(assert (=> start!79918 m!875495))

(declare-fun m!875497 () Bool)

(assert (=> b!939755 m!875497))

(declare-fun m!875499 () Bool)

(assert (=> b!939755 m!875499))

(declare-fun m!875501 () Bool)

(assert (=> b!939758 m!875501))

(declare-fun m!875503 () Bool)

(assert (=> mapNonEmpty!32244 m!875503))

(check-sat (not b_next!17799) tp_is_empty!20307 b_and!29211 (not b!939755) (not mapNonEmpty!32244) (not start!79918) (not b!939758))
(check-sat b_and!29211 (not b_next!17799))
(get-model)

(declare-fun d!113971 () Bool)

(declare-fun res!632033 () Bool)

(declare-fun e!527951 () Bool)

(assert (=> d!113971 (=> (not res!632033) (not e!527951))))

(declare-fun simpleValid!337 (LongMapFixedSize!4494) Bool)

(assert (=> d!113971 (= res!632033 (simpleValid!337 thiss!1141))))

(assert (=> d!113971 (= (valid!1726 thiss!1141) e!527951)))

(declare-fun b!939787 () Bool)

(declare-fun res!632034 () Bool)

(assert (=> b!939787 (=> (not res!632034) (not e!527951))))

(declare-fun arrayCountValidKeys!0 (array!56560 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939787 (= res!632034 (= (arrayCountValidKeys!0 (_keys!10387 thiss!1141) #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))) (_size!2302 thiss!1141)))))

(declare-fun b!939788 () Bool)

(declare-fun res!632035 () Bool)

(assert (=> b!939788 (=> (not res!632035) (not e!527951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56560 (_ BitVec 32)) Bool)

(assert (=> b!939788 (= res!632035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10387 thiss!1141) (mask!27058 thiss!1141)))))

(declare-fun b!939789 () Bool)

(declare-datatypes ((List!19180 0))(
  ( (Nil!19177) (Cons!19176 (h!20322 (_ BitVec 64)) (t!27495 List!19180)) )
))
(declare-fun arrayNoDuplicates!0 (array!56560 (_ BitVec 32) List!19180) Bool)

(assert (=> b!939789 (= e!527951 (arrayNoDuplicates!0 (_keys!10387 thiss!1141) #b00000000000000000000000000000000 Nil!19177))))

(assert (= (and d!113971 res!632033) b!939787))

(assert (= (and b!939787 res!632034) b!939788))

(assert (= (and b!939788 res!632035) b!939789))

(declare-fun m!875515 () Bool)

(assert (=> d!113971 m!875515))

(declare-fun m!875517 () Bool)

(assert (=> b!939787 m!875517))

(declare-fun m!875519 () Bool)

(assert (=> b!939788 m!875519))

(declare-fun m!875521 () Bool)

(assert (=> b!939789 m!875521))

(assert (=> start!79918 d!113971))

(declare-fun d!113973 () Bool)

(assert (=> d!113973 (= (array_inv!21166 (_keys!10387 thiss!1141)) (bvsge (size!27677 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939755 d!113973))

(declare-fun d!113975 () Bool)

(assert (=> d!113975 (= (array_inv!21167 (_values!5561 thiss!1141)) (bvsge (size!27676 (_values!5561 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939755 d!113975))

(declare-fun d!113977 () Bool)

(assert (=> d!113977 (= (validMask!0 (mask!27058 thiss!1141)) (and (or (= (mask!27058 thiss!1141) #b00000000000000000000000000000111) (= (mask!27058 thiss!1141) #b00000000000000000000000000001111) (= (mask!27058 thiss!1141) #b00000000000000000000000000011111) (= (mask!27058 thiss!1141) #b00000000000000000000000000111111) (= (mask!27058 thiss!1141) #b00000000000000000000000001111111) (= (mask!27058 thiss!1141) #b00000000000000000000000011111111) (= (mask!27058 thiss!1141) #b00000000000000000000000111111111) (= (mask!27058 thiss!1141) #b00000000000000000000001111111111) (= (mask!27058 thiss!1141) #b00000000000000000000011111111111) (= (mask!27058 thiss!1141) #b00000000000000000000111111111111) (= (mask!27058 thiss!1141) #b00000000000000000001111111111111) (= (mask!27058 thiss!1141) #b00000000000000000011111111111111) (= (mask!27058 thiss!1141) #b00000000000000000111111111111111) (= (mask!27058 thiss!1141) #b00000000000000001111111111111111) (= (mask!27058 thiss!1141) #b00000000000000011111111111111111) (= (mask!27058 thiss!1141) #b00000000000000111111111111111111) (= (mask!27058 thiss!1141) #b00000000000001111111111111111111) (= (mask!27058 thiss!1141) #b00000000000011111111111111111111) (= (mask!27058 thiss!1141) #b00000000000111111111111111111111) (= (mask!27058 thiss!1141) #b00000000001111111111111111111111) (= (mask!27058 thiss!1141) #b00000000011111111111111111111111) (= (mask!27058 thiss!1141) #b00000000111111111111111111111111) (= (mask!27058 thiss!1141) #b00000001111111111111111111111111) (= (mask!27058 thiss!1141) #b00000011111111111111111111111111) (= (mask!27058 thiss!1141) #b00000111111111111111111111111111) (= (mask!27058 thiss!1141) #b00001111111111111111111111111111) (= (mask!27058 thiss!1141) #b00011111111111111111111111111111) (= (mask!27058 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27058 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939758 d!113977))

(declare-fun condMapEmpty!32250 () Bool)

(declare-fun mapDefault!32250 () ValueCell!9672)

(assert (=> mapNonEmpty!32244 (= condMapEmpty!32250 (= mapRest!32244 ((as const (Array (_ BitVec 32) ValueCell!9672)) mapDefault!32250)))))

(declare-fun e!527957 () Bool)

(declare-fun mapRes!32250 () Bool)

(assert (=> mapNonEmpty!32244 (= tp!61864 (and e!527957 mapRes!32250))))

(declare-fun b!939796 () Bool)

(declare-fun e!527956 () Bool)

(assert (=> b!939796 (= e!527956 tp_is_empty!20307)))

(declare-fun mapIsEmpty!32250 () Bool)

(assert (=> mapIsEmpty!32250 mapRes!32250))

(declare-fun mapNonEmpty!32250 () Bool)

(declare-fun tp!61874 () Bool)

(assert (=> mapNonEmpty!32250 (= mapRes!32250 (and tp!61874 e!527956))))

(declare-fun mapRest!32250 () (Array (_ BitVec 32) ValueCell!9672))

(declare-fun mapValue!32250 () ValueCell!9672)

(declare-fun mapKey!32250 () (_ BitVec 32))

(assert (=> mapNonEmpty!32250 (= mapRest!32244 (store mapRest!32250 mapKey!32250 mapValue!32250))))

(declare-fun b!939797 () Bool)

(assert (=> b!939797 (= e!527957 tp_is_empty!20307)))

(assert (= (and mapNonEmpty!32244 condMapEmpty!32250) mapIsEmpty!32250))

(assert (= (and mapNonEmpty!32244 (not condMapEmpty!32250)) mapNonEmpty!32250))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9672) mapValue!32250)) b!939796))

(assert (= (and mapNonEmpty!32244 ((_ is ValueCellFull!9672) mapDefault!32250)) b!939797))

(declare-fun m!875523 () Bool)

(assert (=> mapNonEmpty!32250 m!875523))

(check-sat (not b!939788) tp_is_empty!20307 b_and!29211 (not b!939789) (not mapNonEmpty!32250) (not d!113971) (not b!939787) (not b_next!17799))
(check-sat b_and!29211 (not b_next!17799))
(get-model)

(declare-fun b!939806 () Bool)

(declare-fun e!527963 () (_ BitVec 32))

(declare-fun call!40908 () (_ BitVec 32))

(assert (=> b!939806 (= e!527963 call!40908)))

(declare-fun b!939807 () Bool)

(declare-fun e!527962 () (_ BitVec 32))

(assert (=> b!939807 (= e!527962 #b00000000000000000000000000000000)))

(declare-fun b!939808 () Bool)

(assert (=> b!939808 (= e!527963 (bvadd #b00000000000000000000000000000001 call!40908))))

(declare-fun b!939809 () Bool)

(assert (=> b!939809 (= e!527962 e!527963)))

(declare-fun c!98020 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939809 (= c!98020 (validKeyInArray!0 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40905 () Bool)

(assert (=> bm!40905 (= call!40908 (arrayCountValidKeys!0 (_keys!10387 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27677 (_keys!10387 thiss!1141))))))

(declare-fun d!113979 () Bool)

(declare-fun lt!424579 () (_ BitVec 32))

(assert (=> d!113979 (and (bvsge lt!424579 #b00000000000000000000000000000000) (bvsle lt!424579 (bvsub (size!27677 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113979 (= lt!424579 e!527962)))

(declare-fun c!98019 () Bool)

(assert (=> d!113979 (= c!98019 (bvsge #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))))))

(assert (=> d!113979 (and (bvsle #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27677 (_keys!10387 thiss!1141)) (size!27677 (_keys!10387 thiss!1141))))))

(assert (=> d!113979 (= (arrayCountValidKeys!0 (_keys!10387 thiss!1141) #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))) lt!424579)))

(assert (= (and d!113979 c!98019) b!939807))

(assert (= (and d!113979 (not c!98019)) b!939809))

(assert (= (and b!939809 c!98020) b!939808))

(assert (= (and b!939809 (not c!98020)) b!939806))

(assert (= (or b!939808 b!939806) bm!40905))

(declare-fun m!875525 () Bool)

(assert (=> b!939809 m!875525))

(assert (=> b!939809 m!875525))

(declare-fun m!875527 () Bool)

(assert (=> b!939809 m!875527))

(declare-fun m!875529 () Bool)

(assert (=> bm!40905 m!875529))

(assert (=> b!939787 d!113979))

(declare-fun b!939818 () Bool)

(declare-fun e!527971 () Bool)

(declare-fun call!40911 () Bool)

(assert (=> b!939818 (= e!527971 call!40911)))

(declare-fun d!113981 () Bool)

(declare-fun res!632041 () Bool)

(declare-fun e!527970 () Bool)

(assert (=> d!113981 (=> res!632041 e!527970)))

(assert (=> d!113981 (= res!632041 (bvsge #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))))))

(assert (=> d!113981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10387 thiss!1141) (mask!27058 thiss!1141)) e!527970)))

(declare-fun bm!40908 () Bool)

(assert (=> bm!40908 (= call!40911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10387 thiss!1141) (mask!27058 thiss!1141)))))

(declare-fun b!939819 () Bool)

(declare-fun e!527972 () Bool)

(assert (=> b!939819 (= e!527970 e!527972)))

(declare-fun c!98023 () Bool)

(assert (=> b!939819 (= c!98023 (validKeyInArray!0 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939820 () Bool)

(assert (=> b!939820 (= e!527972 call!40911)))

(declare-fun b!939821 () Bool)

(assert (=> b!939821 (= e!527972 e!527971)))

(declare-fun lt!424587 () (_ BitVec 64))

(assert (=> b!939821 (= lt!424587 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31754 0))(
  ( (Unit!31755) )
))
(declare-fun lt!424588 () Unit!31754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56560 (_ BitVec 64) (_ BitVec 32)) Unit!31754)

(assert (=> b!939821 (= lt!424588 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10387 thiss!1141) lt!424587 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939821 (arrayContainsKey!0 (_keys!10387 thiss!1141) lt!424587 #b00000000000000000000000000000000)))

(declare-fun lt!424586 () Unit!31754)

(assert (=> b!939821 (= lt!424586 lt!424588)))

(declare-fun res!632040 () Bool)

(declare-datatypes ((SeekEntryResult!8984 0))(
  ( (MissingZero!8984 (index!38307 (_ BitVec 32))) (Found!8984 (index!38308 (_ BitVec 32))) (Intermediate!8984 (undefined!9796 Bool) (index!38309 (_ BitVec 32)) (x!80565 (_ BitVec 32))) (Undefined!8984) (MissingVacant!8984 (index!38310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56560 (_ BitVec 32)) SeekEntryResult!8984)

(assert (=> b!939821 (= res!632040 (= (seekEntryOrOpen!0 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000) (_keys!10387 thiss!1141) (mask!27058 thiss!1141)) (Found!8984 #b00000000000000000000000000000000)))))

(assert (=> b!939821 (=> (not res!632040) (not e!527971))))

(assert (= (and d!113981 (not res!632041)) b!939819))

(assert (= (and b!939819 c!98023) b!939821))

(assert (= (and b!939819 (not c!98023)) b!939820))

(assert (= (and b!939821 res!632040) b!939818))

(assert (= (or b!939818 b!939820) bm!40908))

(declare-fun m!875531 () Bool)

(assert (=> bm!40908 m!875531))

(assert (=> b!939819 m!875525))

(assert (=> b!939819 m!875525))

(assert (=> b!939819 m!875527))

(assert (=> b!939821 m!875525))

(declare-fun m!875533 () Bool)

(assert (=> b!939821 m!875533))

(declare-fun m!875535 () Bool)

(assert (=> b!939821 m!875535))

(assert (=> b!939821 m!875525))

(declare-fun m!875537 () Bool)

(assert (=> b!939821 m!875537))

(assert (=> b!939788 d!113981))

(declare-fun d!113983 () Bool)

(declare-fun res!632053 () Bool)

(declare-fun e!527975 () Bool)

(assert (=> d!113983 (=> (not res!632053) (not e!527975))))

(assert (=> d!113983 (= res!632053 (validMask!0 (mask!27058 thiss!1141)))))

(assert (=> d!113983 (= (simpleValid!337 thiss!1141) e!527975)))

(declare-fun b!939830 () Bool)

(declare-fun res!632052 () Bool)

(assert (=> b!939830 (=> (not res!632052) (not e!527975))))

(assert (=> b!939830 (= res!632052 (and (= (size!27676 (_values!5561 thiss!1141)) (bvadd (mask!27058 thiss!1141) #b00000000000000000000000000000001)) (= (size!27677 (_keys!10387 thiss!1141)) (size!27676 (_values!5561 thiss!1141))) (bvsge (_size!2302 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2302 thiss!1141) (bvadd (mask!27058 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!939832 () Bool)

(declare-fun res!632051 () Bool)

(assert (=> b!939832 (=> (not res!632051) (not e!527975))))

(declare-fun size!27680 (LongMapFixedSize!4494) (_ BitVec 32))

(assert (=> b!939832 (= res!632051 (= (size!27680 thiss!1141) (bvadd (_size!2302 thiss!1141) (bvsdiv (bvadd (extraKeys!5270 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!939833 () Bool)

(assert (=> b!939833 (= e!527975 (and (bvsge (extraKeys!5270 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5270 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2302 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!939831 () Bool)

(declare-fun res!632050 () Bool)

(assert (=> b!939831 (=> (not res!632050) (not e!527975))))

(assert (=> b!939831 (= res!632050 (bvsge (size!27680 thiss!1141) (_size!2302 thiss!1141)))))

(assert (= (and d!113983 res!632053) b!939830))

(assert (= (and b!939830 res!632052) b!939831))

(assert (= (and b!939831 res!632050) b!939832))

(assert (= (and b!939832 res!632051) b!939833))

(assert (=> d!113983 m!875501))

(declare-fun m!875539 () Bool)

(assert (=> b!939832 m!875539))

(assert (=> b!939831 m!875539))

(assert (=> d!113971 d!113983))

(declare-fun b!939844 () Bool)

(declare-fun e!527984 () Bool)

(declare-fun e!527985 () Bool)

(assert (=> b!939844 (= e!527984 e!527985)))

(declare-fun res!632062 () Bool)

(assert (=> b!939844 (=> (not res!632062) (not e!527985))))

(declare-fun e!527987 () Bool)

(assert (=> b!939844 (= res!632062 (not e!527987))))

(declare-fun res!632061 () Bool)

(assert (=> b!939844 (=> (not res!632061) (not e!527987))))

(assert (=> b!939844 (= res!632061 (validKeyInArray!0 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939845 () Bool)

(declare-fun contains!5128 (List!19180 (_ BitVec 64)) Bool)

(assert (=> b!939845 (= e!527987 (contains!5128 Nil!19177 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939846 () Bool)

(declare-fun e!527986 () Bool)

(assert (=> b!939846 (= e!527985 e!527986)))

(declare-fun c!98026 () Bool)

(assert (=> b!939846 (= c!98026 (validKeyInArray!0 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939847 () Bool)

(declare-fun call!40914 () Bool)

(assert (=> b!939847 (= e!527986 call!40914)))

(declare-fun d!113985 () Bool)

(declare-fun res!632060 () Bool)

(assert (=> d!113985 (=> res!632060 e!527984)))

(assert (=> d!113985 (= res!632060 (bvsge #b00000000000000000000000000000000 (size!27677 (_keys!10387 thiss!1141))))))

(assert (=> d!113985 (= (arrayNoDuplicates!0 (_keys!10387 thiss!1141) #b00000000000000000000000000000000 Nil!19177) e!527984)))

(declare-fun b!939848 () Bool)

(assert (=> b!939848 (= e!527986 call!40914)))

(declare-fun bm!40911 () Bool)

(assert (=> bm!40911 (= call!40914 (arrayNoDuplicates!0 (_keys!10387 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98026 (Cons!19176 (select (arr!27217 (_keys!10387 thiss!1141)) #b00000000000000000000000000000000) Nil!19177) Nil!19177)))))

(assert (= (and d!113985 (not res!632060)) b!939844))

(assert (= (and b!939844 res!632061) b!939845))

(assert (= (and b!939844 res!632062) b!939846))

(assert (= (and b!939846 c!98026) b!939847))

(assert (= (and b!939846 (not c!98026)) b!939848))

(assert (= (or b!939847 b!939848) bm!40911))

(assert (=> b!939844 m!875525))

(assert (=> b!939844 m!875525))

(assert (=> b!939844 m!875527))

(assert (=> b!939845 m!875525))

(assert (=> b!939845 m!875525))

(declare-fun m!875541 () Bool)

(assert (=> b!939845 m!875541))

(assert (=> b!939846 m!875525))

(assert (=> b!939846 m!875525))

(assert (=> b!939846 m!875527))

(assert (=> bm!40911 m!875525))

(declare-fun m!875543 () Bool)

(assert (=> bm!40911 m!875543))

(assert (=> b!939789 d!113985))

(declare-fun condMapEmpty!32251 () Bool)

(declare-fun mapDefault!32251 () ValueCell!9672)

(assert (=> mapNonEmpty!32250 (= condMapEmpty!32251 (= mapRest!32250 ((as const (Array (_ BitVec 32) ValueCell!9672)) mapDefault!32251)))))

(declare-fun e!527989 () Bool)

(declare-fun mapRes!32251 () Bool)

(assert (=> mapNonEmpty!32250 (= tp!61874 (and e!527989 mapRes!32251))))

(declare-fun b!939849 () Bool)

(declare-fun e!527988 () Bool)

(assert (=> b!939849 (= e!527988 tp_is_empty!20307)))

(declare-fun mapIsEmpty!32251 () Bool)

(assert (=> mapIsEmpty!32251 mapRes!32251))

(declare-fun mapNonEmpty!32251 () Bool)

(declare-fun tp!61875 () Bool)

(assert (=> mapNonEmpty!32251 (= mapRes!32251 (and tp!61875 e!527988))))

(declare-fun mapValue!32251 () ValueCell!9672)

(declare-fun mapKey!32251 () (_ BitVec 32))

(declare-fun mapRest!32251 () (Array (_ BitVec 32) ValueCell!9672))

(assert (=> mapNonEmpty!32251 (= mapRest!32250 (store mapRest!32251 mapKey!32251 mapValue!32251))))

(declare-fun b!939850 () Bool)

(assert (=> b!939850 (= e!527989 tp_is_empty!20307)))

(assert (= (and mapNonEmpty!32250 condMapEmpty!32251) mapIsEmpty!32251))

(assert (= (and mapNonEmpty!32250 (not condMapEmpty!32251)) mapNonEmpty!32251))

(assert (= (and mapNonEmpty!32251 ((_ is ValueCellFull!9672) mapValue!32251)) b!939849))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9672) mapDefault!32251)) b!939850))

(declare-fun m!875545 () Bool)

(assert (=> mapNonEmpty!32251 m!875545))

(check-sat (not bm!40908) tp_is_empty!20307 b_and!29211 (not bm!40905) (not d!113983) (not b!939809) (not bm!40911) (not mapNonEmpty!32251) (not b!939819) (not b!939844) (not b!939821) (not b!939846) (not b_next!17799) (not b!939831) (not b!939832) (not b!939845))
(check-sat b_and!29211 (not b_next!17799))
