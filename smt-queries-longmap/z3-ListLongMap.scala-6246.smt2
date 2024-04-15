; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79898 () Bool)

(assert start!79898)

(declare-fun b!939497 () Bool)

(declare-fun b_free!17797 () Bool)

(declare-fun b_next!17797 () Bool)

(assert (=> b!939497 (= b_free!17797 (not b_next!17797))))

(declare-fun tp!61859 () Bool)

(declare-fun b_and!29183 () Bool)

(assert (=> b!939497 (= tp!61859 b_and!29183)))

(declare-fun b!939493 () Bool)

(declare-fun e!527764 () Bool)

(declare-fun tp_is_empty!20305 () Bool)

(assert (=> b!939493 (= e!527764 tp_is_empty!20305)))

(declare-fun b!939494 () Bool)

(declare-fun res!631897 () Bool)

(declare-fun e!527759 () Bool)

(assert (=> b!939494 (=> (not res!631897) (not e!527759))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939494 (= res!631897 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939495 () Bool)

(declare-fun e!527762 () Bool)

(assert (=> b!939495 (= e!527762 tp_is_empty!20305)))

(declare-fun res!631898 () Bool)

(assert (=> start!79898 (=> (not res!631898) (not e!527759))))

(declare-datatypes ((V!32039 0))(
  ( (V!32040 (val!10203 Int)) )
))
(declare-datatypes ((ValueCell!9671 0))(
  ( (ValueCellFull!9671 (v!12733 V!32039)) (EmptyCell!9671) )
))
(declare-datatypes ((array!56519 0))(
  ( (array!56520 (arr!27197 (Array (_ BitVec 32) ValueCell!9671)) (size!27659 (_ BitVec 32))) )
))
(declare-datatypes ((array!56521 0))(
  ( (array!56522 (arr!27198 (Array (_ BitVec 32) (_ BitVec 64))) (size!27660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4492 0))(
  ( (LongMapFixedSize!4493 (defaultEntry!5537 Int) (mask!27050 (_ BitVec 32)) (extraKeys!5269 (_ BitVec 32)) (zeroValue!5373 V!32039) (minValue!5373 V!32039) (_size!2301 (_ BitVec 32)) (_keys!10381 array!56521) (_values!5560 array!56519) (_vacant!2301 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4492)

(declare-fun valid!1734 (LongMapFixedSize!4492) Bool)

(assert (=> start!79898 (= res!631898 (valid!1734 thiss!1141))))

(assert (=> start!79898 e!527759))

(declare-fun e!527763 () Bool)

(assert (=> start!79898 e!527763))

(assert (=> start!79898 true))

(declare-fun b!939496 () Bool)

(declare-fun e!527760 () Bool)

(declare-fun mapRes!32241 () Bool)

(assert (=> b!939496 (= e!527760 (and e!527764 mapRes!32241))))

(declare-fun condMapEmpty!32241 () Bool)

(declare-fun mapDefault!32241 () ValueCell!9671)

(assert (=> b!939496 (= condMapEmpty!32241 (= (arr!27197 (_values!5560 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32241)))))

(declare-fun mapIsEmpty!32241 () Bool)

(assert (=> mapIsEmpty!32241 mapRes!32241))

(declare-fun array_inv!21218 (array!56521) Bool)

(declare-fun array_inv!21219 (array!56519) Bool)

(assert (=> b!939497 (= e!527763 (and tp!61859 tp_is_empty!20305 (array_inv!21218 (_keys!10381 thiss!1141)) (array_inv!21219 (_values!5560 thiss!1141)) e!527760))))

(declare-fun b!939498 () Bool)

(declare-fun res!631896 () Bool)

(assert (=> b!939498 (=> (not res!631896) (not e!527759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939498 (= res!631896 (validMask!0 (mask!27050 thiss!1141)))))

(declare-fun b!939499 () Bool)

(assert (=> b!939499 (= e!527759 (not (= (size!27660 (_keys!10381 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27050 thiss!1141)))))))

(declare-fun mapNonEmpty!32241 () Bool)

(declare-fun tp!61860 () Bool)

(assert (=> mapNonEmpty!32241 (= mapRes!32241 (and tp!61860 e!527762))))

(declare-fun mapValue!32241 () ValueCell!9671)

(declare-fun mapRest!32241 () (Array (_ BitVec 32) ValueCell!9671))

(declare-fun mapKey!32241 () (_ BitVec 32))

(assert (=> mapNonEmpty!32241 (= (arr!27197 (_values!5560 thiss!1141)) (store mapRest!32241 mapKey!32241 mapValue!32241))))

(assert (= (and start!79898 res!631898) b!939494))

(assert (= (and b!939494 res!631897) b!939498))

(assert (= (and b!939498 res!631896) b!939499))

(assert (= (and b!939496 condMapEmpty!32241) mapIsEmpty!32241))

(assert (= (and b!939496 (not condMapEmpty!32241)) mapNonEmpty!32241))

(get-info :version)

(assert (= (and mapNonEmpty!32241 ((_ is ValueCellFull!9671) mapValue!32241)) b!939495))

(assert (= (and b!939496 ((_ is ValueCellFull!9671) mapDefault!32241)) b!939493))

(assert (= b!939497 b!939496))

(assert (= start!79898 b!939497))

(declare-fun m!874727 () Bool)

(assert (=> start!79898 m!874727))

(declare-fun m!874729 () Bool)

(assert (=> b!939497 m!874729))

(declare-fun m!874731 () Bool)

(assert (=> b!939497 m!874731))

(declare-fun m!874733 () Bool)

(assert (=> b!939498 m!874733))

(declare-fun m!874735 () Bool)

(assert (=> mapNonEmpty!32241 m!874735))

(check-sat (not b_next!17797) (not mapNonEmpty!32241) (not b!939497) tp_is_empty!20305 b_and!29183 (not b!939498) (not start!79898))
(check-sat b_and!29183 (not b_next!17797))
(get-model)

(declare-fun d!113773 () Bool)

(assert (=> d!113773 (= (array_inv!21218 (_keys!10381 thiss!1141)) (bvsge (size!27660 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939497 d!113773))

(declare-fun d!113775 () Bool)

(assert (=> d!113775 (= (array_inv!21219 (_values!5560 thiss!1141)) (bvsge (size!27659 (_values!5560 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939497 d!113775))

(declare-fun d!113777 () Bool)

(declare-fun res!631923 () Bool)

(declare-fun e!527803 () Bool)

(assert (=> d!113777 (=> (not res!631923) (not e!527803))))

(declare-fun simpleValid!337 (LongMapFixedSize!4492) Bool)

(assert (=> d!113777 (= res!631923 (simpleValid!337 thiss!1141))))

(assert (=> d!113777 (= (valid!1734 thiss!1141) e!527803)))

(declare-fun b!939548 () Bool)

(declare-fun res!631924 () Bool)

(assert (=> b!939548 (=> (not res!631924) (not e!527803))))

(declare-fun arrayCountValidKeys!0 (array!56521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939548 (= res!631924 (= (arrayCountValidKeys!0 (_keys!10381 thiss!1141) #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))) (_size!2301 thiss!1141)))))

(declare-fun b!939549 () Bool)

(declare-fun res!631925 () Bool)

(assert (=> b!939549 (=> (not res!631925) (not e!527803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56521 (_ BitVec 32)) Bool)

(assert (=> b!939549 (= res!631925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10381 thiss!1141) (mask!27050 thiss!1141)))))

(declare-fun b!939550 () Bool)

(declare-datatypes ((List!19195 0))(
  ( (Nil!19192) (Cons!19191 (h!20337 (_ BitVec 64)) (t!27501 List!19195)) )
))
(declare-fun arrayNoDuplicates!0 (array!56521 (_ BitVec 32) List!19195) Bool)

(assert (=> b!939550 (= e!527803 (arrayNoDuplicates!0 (_keys!10381 thiss!1141) #b00000000000000000000000000000000 Nil!19192))))

(assert (= (and d!113777 res!631923) b!939548))

(assert (= (and b!939548 res!631924) b!939549))

(assert (= (and b!939549 res!631925) b!939550))

(declare-fun m!874757 () Bool)

(assert (=> d!113777 m!874757))

(declare-fun m!874759 () Bool)

(assert (=> b!939548 m!874759))

(declare-fun m!874761 () Bool)

(assert (=> b!939549 m!874761))

(declare-fun m!874763 () Bool)

(assert (=> b!939550 m!874763))

(assert (=> start!79898 d!113777))

(declare-fun d!113779 () Bool)

(assert (=> d!113779 (= (validMask!0 (mask!27050 thiss!1141)) (and (or (= (mask!27050 thiss!1141) #b00000000000000000000000000000111) (= (mask!27050 thiss!1141) #b00000000000000000000000000001111) (= (mask!27050 thiss!1141) #b00000000000000000000000000011111) (= (mask!27050 thiss!1141) #b00000000000000000000000000111111) (= (mask!27050 thiss!1141) #b00000000000000000000000001111111) (= (mask!27050 thiss!1141) #b00000000000000000000000011111111) (= (mask!27050 thiss!1141) #b00000000000000000000000111111111) (= (mask!27050 thiss!1141) #b00000000000000000000001111111111) (= (mask!27050 thiss!1141) #b00000000000000000000011111111111) (= (mask!27050 thiss!1141) #b00000000000000000000111111111111) (= (mask!27050 thiss!1141) #b00000000000000000001111111111111) (= (mask!27050 thiss!1141) #b00000000000000000011111111111111) (= (mask!27050 thiss!1141) #b00000000000000000111111111111111) (= (mask!27050 thiss!1141) #b00000000000000001111111111111111) (= (mask!27050 thiss!1141) #b00000000000000011111111111111111) (= (mask!27050 thiss!1141) #b00000000000000111111111111111111) (= (mask!27050 thiss!1141) #b00000000000001111111111111111111) (= (mask!27050 thiss!1141) #b00000000000011111111111111111111) (= (mask!27050 thiss!1141) #b00000000000111111111111111111111) (= (mask!27050 thiss!1141) #b00000000001111111111111111111111) (= (mask!27050 thiss!1141) #b00000000011111111111111111111111) (= (mask!27050 thiss!1141) #b00000000111111111111111111111111) (= (mask!27050 thiss!1141) #b00000001111111111111111111111111) (= (mask!27050 thiss!1141) #b00000011111111111111111111111111) (= (mask!27050 thiss!1141) #b00000111111111111111111111111111) (= (mask!27050 thiss!1141) #b00001111111111111111111111111111) (= (mask!27050 thiss!1141) #b00011111111111111111111111111111) (= (mask!27050 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27050 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939498 d!113779))

(declare-fun mapIsEmpty!32250 () Bool)

(declare-fun mapRes!32250 () Bool)

(assert (=> mapIsEmpty!32250 mapRes!32250))

(declare-fun b!939558 () Bool)

(declare-fun e!527809 () Bool)

(assert (=> b!939558 (= e!527809 tp_is_empty!20305)))

(declare-fun mapNonEmpty!32250 () Bool)

(declare-fun tp!61875 () Bool)

(declare-fun e!527808 () Bool)

(assert (=> mapNonEmpty!32250 (= mapRes!32250 (and tp!61875 e!527808))))

(declare-fun mapRest!32250 () (Array (_ BitVec 32) ValueCell!9671))

(declare-fun mapKey!32250 () (_ BitVec 32))

(declare-fun mapValue!32250 () ValueCell!9671)

(assert (=> mapNonEmpty!32250 (= mapRest!32241 (store mapRest!32250 mapKey!32250 mapValue!32250))))

(declare-fun condMapEmpty!32250 () Bool)

(declare-fun mapDefault!32250 () ValueCell!9671)

(assert (=> mapNonEmpty!32241 (= condMapEmpty!32250 (= mapRest!32241 ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32250)))))

(assert (=> mapNonEmpty!32241 (= tp!61860 (and e!527809 mapRes!32250))))

(declare-fun b!939557 () Bool)

(assert (=> b!939557 (= e!527808 tp_is_empty!20305)))

(assert (= (and mapNonEmpty!32241 condMapEmpty!32250) mapIsEmpty!32250))

(assert (= (and mapNonEmpty!32241 (not condMapEmpty!32250)) mapNonEmpty!32250))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9671) mapValue!32250)) b!939557))

(assert (= (and mapNonEmpty!32241 ((_ is ValueCellFull!9671) mapDefault!32250)) b!939558))

(declare-fun m!874765 () Bool)

(assert (=> mapNonEmpty!32250 m!874765))

(check-sat (not b_next!17797) (not b!939549) (not d!113777) tp_is_empty!20305 b_and!29183 (not b!939550) (not mapNonEmpty!32250) (not b!939548))
(check-sat b_and!29183 (not b_next!17797))
(get-model)

(declare-fun b!939569 () Bool)

(declare-fun res!631935 () Bool)

(declare-fun e!527812 () Bool)

(assert (=> b!939569 (=> (not res!631935) (not e!527812))))

(declare-fun size!27665 (LongMapFixedSize!4492) (_ BitVec 32))

(assert (=> b!939569 (= res!631935 (= (size!27665 thiss!1141) (bvadd (_size!2301 thiss!1141) (bvsdiv (bvadd (extraKeys!5269 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!113781 () Bool)

(declare-fun res!631937 () Bool)

(assert (=> d!113781 (=> (not res!631937) (not e!527812))))

(assert (=> d!113781 (= res!631937 (validMask!0 (mask!27050 thiss!1141)))))

(assert (=> d!113781 (= (simpleValid!337 thiss!1141) e!527812)))

(declare-fun b!939567 () Bool)

(declare-fun res!631936 () Bool)

(assert (=> b!939567 (=> (not res!631936) (not e!527812))))

(assert (=> b!939567 (= res!631936 (and (= (size!27659 (_values!5560 thiss!1141)) (bvadd (mask!27050 thiss!1141) #b00000000000000000000000000000001)) (= (size!27660 (_keys!10381 thiss!1141)) (size!27659 (_values!5560 thiss!1141))) (bvsge (_size!2301 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2301 thiss!1141) (bvadd (mask!27050 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!939568 () Bool)

(declare-fun res!631934 () Bool)

(assert (=> b!939568 (=> (not res!631934) (not e!527812))))

(assert (=> b!939568 (= res!631934 (bvsge (size!27665 thiss!1141) (_size!2301 thiss!1141)))))

(declare-fun b!939570 () Bool)

(assert (=> b!939570 (= e!527812 (and (bvsge (extraKeys!5269 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5269 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2301 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!113781 res!631937) b!939567))

(assert (= (and b!939567 res!631936) b!939568))

(assert (= (and b!939568 res!631934) b!939569))

(assert (= (and b!939569 res!631935) b!939570))

(declare-fun m!874767 () Bool)

(assert (=> b!939569 m!874767))

(assert (=> d!113781 m!874733))

(assert (=> b!939568 m!874767))

(assert (=> d!113777 d!113781))

(declare-fun bm!40879 () Bool)

(declare-fun call!40882 () (_ BitVec 32))

(assert (=> bm!40879 (= call!40882 (arrayCountValidKeys!0 (_keys!10381 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27660 (_keys!10381 thiss!1141))))))

(declare-fun b!939579 () Bool)

(declare-fun e!527817 () (_ BitVec 32))

(assert (=> b!939579 (= e!527817 call!40882)))

(declare-fun b!939580 () Bool)

(declare-fun e!527818 () (_ BitVec 32))

(assert (=> b!939580 (= e!527818 #b00000000000000000000000000000000)))

(declare-fun d!113783 () Bool)

(declare-fun lt!424343 () (_ BitVec 32))

(assert (=> d!113783 (and (bvsge lt!424343 #b00000000000000000000000000000000) (bvsle lt!424343 (bvsub (size!27660 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113783 (= lt!424343 e!527818)))

(declare-fun c!97954 () Bool)

(assert (=> d!113783 (= c!97954 (bvsge #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))))))

(assert (=> d!113783 (and (bvsle #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27660 (_keys!10381 thiss!1141)) (size!27660 (_keys!10381 thiss!1141))))))

(assert (=> d!113783 (= (arrayCountValidKeys!0 (_keys!10381 thiss!1141) #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))) lt!424343)))

(declare-fun b!939581 () Bool)

(assert (=> b!939581 (= e!527818 e!527817)))

(declare-fun c!97955 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939581 (= c!97955 (validKeyInArray!0 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939582 () Bool)

(assert (=> b!939582 (= e!527817 (bvadd #b00000000000000000000000000000001 call!40882))))

(assert (= (and d!113783 c!97954) b!939580))

(assert (= (and d!113783 (not c!97954)) b!939581))

(assert (= (and b!939581 c!97955) b!939582))

(assert (= (and b!939581 (not c!97955)) b!939579))

(assert (= (or b!939582 b!939579) bm!40879))

(declare-fun m!874769 () Bool)

(assert (=> bm!40879 m!874769))

(declare-fun m!874771 () Bool)

(assert (=> b!939581 m!874771))

(assert (=> b!939581 m!874771))

(declare-fun m!874773 () Bool)

(assert (=> b!939581 m!874773))

(assert (=> b!939548 d!113783))

(declare-fun b!939593 () Bool)

(declare-fun e!527828 () Bool)

(declare-fun contains!5092 (List!19195 (_ BitVec 64)) Bool)

(assert (=> b!939593 (= e!527828 (contains!5092 Nil!19192 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939594 () Bool)

(declare-fun e!527830 () Bool)

(declare-fun e!527829 () Bool)

(assert (=> b!939594 (= e!527830 e!527829)))

(declare-fun c!97958 () Bool)

(assert (=> b!939594 (= c!97958 (validKeyInArray!0 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939595 () Bool)

(declare-fun call!40885 () Bool)

(assert (=> b!939595 (= e!527829 call!40885)))

(declare-fun b!939596 () Bool)

(declare-fun e!527827 () Bool)

(assert (=> b!939596 (= e!527827 e!527830)))

(declare-fun res!631944 () Bool)

(assert (=> b!939596 (=> (not res!631944) (not e!527830))))

(assert (=> b!939596 (= res!631944 (not e!527828))))

(declare-fun res!631946 () Bool)

(assert (=> b!939596 (=> (not res!631946) (not e!527828))))

(assert (=> b!939596 (= res!631946 (validKeyInArray!0 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939597 () Bool)

(assert (=> b!939597 (= e!527829 call!40885)))

(declare-fun bm!40882 () Bool)

(assert (=> bm!40882 (= call!40885 (arrayNoDuplicates!0 (_keys!10381 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97958 (Cons!19191 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000) Nil!19192) Nil!19192)))))

(declare-fun d!113785 () Bool)

(declare-fun res!631945 () Bool)

(assert (=> d!113785 (=> res!631945 e!527827)))

(assert (=> d!113785 (= res!631945 (bvsge #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))))))

(assert (=> d!113785 (= (arrayNoDuplicates!0 (_keys!10381 thiss!1141) #b00000000000000000000000000000000 Nil!19192) e!527827)))

(assert (= (and d!113785 (not res!631945)) b!939596))

(assert (= (and b!939596 res!631946) b!939593))

(assert (= (and b!939596 res!631944) b!939594))

(assert (= (and b!939594 c!97958) b!939595))

(assert (= (and b!939594 (not c!97958)) b!939597))

(assert (= (or b!939595 b!939597) bm!40882))

(assert (=> b!939593 m!874771))

(assert (=> b!939593 m!874771))

(declare-fun m!874775 () Bool)

(assert (=> b!939593 m!874775))

(assert (=> b!939594 m!874771))

(assert (=> b!939594 m!874771))

(assert (=> b!939594 m!874773))

(assert (=> b!939596 m!874771))

(assert (=> b!939596 m!874771))

(assert (=> b!939596 m!874773))

(assert (=> bm!40882 m!874771))

(declare-fun m!874777 () Bool)

(assert (=> bm!40882 m!874777))

(assert (=> b!939550 d!113785))

(declare-fun b!939606 () Bool)

(declare-fun e!527839 () Bool)

(declare-fun call!40888 () Bool)

(assert (=> b!939606 (= e!527839 call!40888)))

(declare-fun b!939607 () Bool)

(declare-fun e!527837 () Bool)

(assert (=> b!939607 (= e!527837 call!40888)))

(declare-fun b!939608 () Bool)

(assert (=> b!939608 (= e!527837 e!527839)))

(declare-fun lt!424350 () (_ BitVec 64))

(assert (=> b!939608 (= lt!424350 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31639 0))(
  ( (Unit!31640) )
))
(declare-fun lt!424352 () Unit!31639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56521 (_ BitVec 64) (_ BitVec 32)) Unit!31639)

(assert (=> b!939608 (= lt!424352 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10381 thiss!1141) lt!424350 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939608 (arrayContainsKey!0 (_keys!10381 thiss!1141) lt!424350 #b00000000000000000000000000000000)))

(declare-fun lt!424351 () Unit!31639)

(assert (=> b!939608 (= lt!424351 lt!424352)))

(declare-fun res!631951 () Bool)

(declare-datatypes ((SeekEntryResult!8984 0))(
  ( (MissingZero!8984 (index!38307 (_ BitVec 32))) (Found!8984 (index!38308 (_ BitVec 32))) (Intermediate!8984 (undefined!9796 Bool) (index!38309 (_ BitVec 32)) (x!80560 (_ BitVec 32))) (Undefined!8984) (MissingVacant!8984 (index!38310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56521 (_ BitVec 32)) SeekEntryResult!8984)

(assert (=> b!939608 (= res!631951 (= (seekEntryOrOpen!0 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000) (_keys!10381 thiss!1141) (mask!27050 thiss!1141)) (Found!8984 #b00000000000000000000000000000000)))))

(assert (=> b!939608 (=> (not res!631951) (not e!527839))))

(declare-fun b!939609 () Bool)

(declare-fun e!527838 () Bool)

(assert (=> b!939609 (= e!527838 e!527837)))

(declare-fun c!97961 () Bool)

(assert (=> b!939609 (= c!97961 (validKeyInArray!0 (select (arr!27198 (_keys!10381 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40885 () Bool)

(assert (=> bm!40885 (= call!40888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10381 thiss!1141) (mask!27050 thiss!1141)))))

(declare-fun d!113787 () Bool)

(declare-fun res!631952 () Bool)

(assert (=> d!113787 (=> res!631952 e!527838)))

(assert (=> d!113787 (= res!631952 (bvsge #b00000000000000000000000000000000 (size!27660 (_keys!10381 thiss!1141))))))

(assert (=> d!113787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10381 thiss!1141) (mask!27050 thiss!1141)) e!527838)))

(assert (= (and d!113787 (not res!631952)) b!939609))

(assert (= (and b!939609 c!97961) b!939608))

(assert (= (and b!939609 (not c!97961)) b!939607))

(assert (= (and b!939608 res!631951) b!939606))

(assert (= (or b!939606 b!939607) bm!40885))

(assert (=> b!939608 m!874771))

(declare-fun m!874779 () Bool)

(assert (=> b!939608 m!874779))

(declare-fun m!874781 () Bool)

(assert (=> b!939608 m!874781))

(assert (=> b!939608 m!874771))

(declare-fun m!874783 () Bool)

(assert (=> b!939608 m!874783))

(assert (=> b!939609 m!874771))

(assert (=> b!939609 m!874771))

(assert (=> b!939609 m!874773))

(declare-fun m!874785 () Bool)

(assert (=> bm!40885 m!874785))

(assert (=> b!939549 d!113787))

(declare-fun mapIsEmpty!32251 () Bool)

(declare-fun mapRes!32251 () Bool)

(assert (=> mapIsEmpty!32251 mapRes!32251))

(declare-fun b!939611 () Bool)

(declare-fun e!527841 () Bool)

(assert (=> b!939611 (= e!527841 tp_is_empty!20305)))

(declare-fun mapNonEmpty!32251 () Bool)

(declare-fun tp!61876 () Bool)

(declare-fun e!527840 () Bool)

(assert (=> mapNonEmpty!32251 (= mapRes!32251 (and tp!61876 e!527840))))

(declare-fun mapRest!32251 () (Array (_ BitVec 32) ValueCell!9671))

(declare-fun mapKey!32251 () (_ BitVec 32))

(declare-fun mapValue!32251 () ValueCell!9671)

(assert (=> mapNonEmpty!32251 (= mapRest!32250 (store mapRest!32251 mapKey!32251 mapValue!32251))))

(declare-fun condMapEmpty!32251 () Bool)

(declare-fun mapDefault!32251 () ValueCell!9671)

(assert (=> mapNonEmpty!32250 (= condMapEmpty!32251 (= mapRest!32250 ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32251)))))

(assert (=> mapNonEmpty!32250 (= tp!61875 (and e!527841 mapRes!32251))))

(declare-fun b!939610 () Bool)

(assert (=> b!939610 (= e!527840 tp_is_empty!20305)))

(assert (= (and mapNonEmpty!32250 condMapEmpty!32251) mapIsEmpty!32251))

(assert (= (and mapNonEmpty!32250 (not condMapEmpty!32251)) mapNonEmpty!32251))

(assert (= (and mapNonEmpty!32251 ((_ is ValueCellFull!9671) mapValue!32251)) b!939610))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9671) mapDefault!32251)) b!939611))

(declare-fun m!874787 () Bool)

(assert (=> mapNonEmpty!32251 m!874787))

(check-sat (not b!939609) (not b!939596) (not bm!40885) (not b_next!17797) (not bm!40879) (not b!939608) (not d!113781) (not mapNonEmpty!32251) (not b!939569) (not b!939594) tp_is_empty!20305 (not b!939593) (not b!939581) (not bm!40882) (not b!939568) b_and!29183)
(check-sat b_and!29183 (not b_next!17797))
