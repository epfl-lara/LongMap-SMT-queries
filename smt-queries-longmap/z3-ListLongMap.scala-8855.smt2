; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107636 () Bool)

(assert start!107636)

(declare-fun b!1273895 () Bool)

(declare-fun b_free!27673 () Bool)

(declare-fun b_next!27673 () Bool)

(assert (=> b!1273895 (= b_free!27673 (not b_next!27673))))

(declare-fun tp!97539 () Bool)

(declare-fun b_and!45731 () Bool)

(assert (=> b!1273895 (= tp!97539 b_and!45731)))

(declare-fun b!1273893 () Bool)

(declare-fun res!846985 () Bool)

(declare-fun e!726727 () Bool)

(assert (=> b!1273893 (=> (not res!846985) (not e!726727))))

(declare-datatypes ((V!49251 0))(
  ( (V!49252 (val!16596 Int)) )
))
(declare-datatypes ((ValueCell!15668 0))(
  ( (ValueCellFull!15668 (v!19228 V!49251)) (EmptyCell!15668) )
))
(declare-datatypes ((array!83359 0))(
  ( (array!83360 (arr!40208 (Array (_ BitVec 32) ValueCell!15668)) (size!40747 (_ BitVec 32))) )
))
(declare-datatypes ((array!83361 0))(
  ( (array!83362 (arr!40209 (Array (_ BitVec 32) (_ BitVec 64))) (size!40748 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6100 0))(
  ( (LongMapFixedSize!6101 (defaultEntry!6696 Int) (mask!34508 (_ BitVec 32)) (extraKeys!6375 (_ BitVec 32)) (zeroValue!6481 V!49251) (minValue!6481 V!49251) (_size!3105 (_ BitVec 32)) (_keys!12142 array!83361) (_values!6719 array!83359) (_vacant!3105 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6100)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273893 (= res!846985 (validMask!0 (mask!34508 thiss!1559)))))

(declare-fun mapIsEmpty!51159 () Bool)

(declare-fun mapRes!51159 () Bool)

(assert (=> mapIsEmpty!51159 mapRes!51159))

(declare-fun b!1273894 () Bool)

(declare-fun e!726731 () Bool)

(declare-fun tp_is_empty!33043 () Bool)

(assert (=> b!1273894 (= e!726731 tp_is_empty!33043)))

(declare-fun res!846984 () Bool)

(assert (=> start!107636 (=> (not res!846984) (not e!726727))))

(declare-fun valid!2292 (LongMapFixedSize!6100) Bool)

(assert (=> start!107636 (= res!846984 (valid!2292 thiss!1559))))

(assert (=> start!107636 e!726727))

(declare-fun e!726730 () Bool)

(assert (=> start!107636 e!726730))

(declare-fun mapNonEmpty!51159 () Bool)

(declare-fun tp!97538 () Bool)

(declare-fun e!726732 () Bool)

(assert (=> mapNonEmpty!51159 (= mapRes!51159 (and tp!97538 e!726732))))

(declare-fun mapKey!51159 () (_ BitVec 32))

(declare-fun mapValue!51159 () ValueCell!15668)

(declare-fun mapRest!51159 () (Array (_ BitVec 32) ValueCell!15668))

(assert (=> mapNonEmpty!51159 (= (arr!40208 (_values!6719 thiss!1559)) (store mapRest!51159 mapKey!51159 mapValue!51159))))

(declare-fun e!726728 () Bool)

(declare-fun array_inv!30747 (array!83361) Bool)

(declare-fun array_inv!30748 (array!83359) Bool)

(assert (=> b!1273895 (= e!726730 (and tp!97539 tp_is_empty!33043 (array_inv!30747 (_keys!12142 thiss!1559)) (array_inv!30748 (_values!6719 thiss!1559)) e!726728))))

(declare-fun b!1273896 () Bool)

(assert (=> b!1273896 (= e!726728 (and e!726731 mapRes!51159))))

(declare-fun condMapEmpty!51159 () Bool)

(declare-fun mapDefault!51159 () ValueCell!15668)

(assert (=> b!1273896 (= condMapEmpty!51159 (= (arr!40208 (_values!6719 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51159)))))

(declare-fun b!1273897 () Bool)

(assert (=> b!1273897 (= e!726732 tp_is_empty!33043)))

(declare-fun b!1273898 () Bool)

(assert (=> b!1273898 (= e!726727 (and (= (size!40747 (_values!6719 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34508 thiss!1559))) (not (= (size!40748 (_keys!12142 thiss!1559)) (size!40747 (_values!6719 thiss!1559))))))))

(assert (= (and start!107636 res!846984) b!1273893))

(assert (= (and b!1273893 res!846985) b!1273898))

(assert (= (and b!1273896 condMapEmpty!51159) mapIsEmpty!51159))

(assert (= (and b!1273896 (not condMapEmpty!51159)) mapNonEmpty!51159))

(get-info :version)

(assert (= (and mapNonEmpty!51159 ((_ is ValueCellFull!15668) mapValue!51159)) b!1273897))

(assert (= (and b!1273896 ((_ is ValueCellFull!15668) mapDefault!51159)) b!1273894))

(assert (= b!1273895 b!1273896))

(assert (= start!107636 b!1273895))

(declare-fun m!1171795 () Bool)

(assert (=> b!1273893 m!1171795))

(declare-fun m!1171797 () Bool)

(assert (=> start!107636 m!1171797))

(declare-fun m!1171799 () Bool)

(assert (=> mapNonEmpty!51159 m!1171799))

(declare-fun m!1171801 () Bool)

(assert (=> b!1273895 m!1171801))

(declare-fun m!1171803 () Bool)

(assert (=> b!1273895 m!1171803))

(check-sat b_and!45731 (not start!107636) (not b!1273893) (not mapNonEmpty!51159) (not b_next!27673) tp_is_empty!33043 (not b!1273895))
(check-sat b_and!45731 (not b_next!27673))
(get-model)

(declare-fun d!140329 () Bool)

(assert (=> d!140329 (= (array_inv!30747 (_keys!12142 thiss!1559)) (bvsge (size!40748 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273895 d!140329))

(declare-fun d!140331 () Bool)

(assert (=> d!140331 (= (array_inv!30748 (_values!6719 thiss!1559)) (bvsge (size!40747 (_values!6719 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273895 d!140331))

(declare-fun d!140333 () Bool)

(declare-fun res!847004 () Bool)

(declare-fun e!726771 () Bool)

(assert (=> d!140333 (=> (not res!847004) (not e!726771))))

(declare-fun simpleValid!457 (LongMapFixedSize!6100) Bool)

(assert (=> d!140333 (= res!847004 (simpleValid!457 thiss!1559))))

(assert (=> d!140333 (= (valid!2292 thiss!1559) e!726771)))

(declare-fun b!1273941 () Bool)

(declare-fun res!847005 () Bool)

(assert (=> b!1273941 (=> (not res!847005) (not e!726771))))

(declare-fun arrayCountValidKeys!0 (array!83361 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273941 (= res!847005 (= (arrayCountValidKeys!0 (_keys!12142 thiss!1559) #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))) (_size!3105 thiss!1559)))))

(declare-fun b!1273942 () Bool)

(declare-fun res!847006 () Bool)

(assert (=> b!1273942 (=> (not res!847006) (not e!726771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83361 (_ BitVec 32)) Bool)

(assert (=> b!1273942 (= res!847006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12142 thiss!1559) (mask!34508 thiss!1559)))))

(declare-fun b!1273943 () Bool)

(declare-datatypes ((List!28586 0))(
  ( (Nil!28583) (Cons!28582 (h!29800 (_ BitVec 64)) (t!42111 List!28586)) )
))
(declare-fun arrayNoDuplicates!0 (array!83361 (_ BitVec 32) List!28586) Bool)

(assert (=> b!1273943 (= e!726771 (arrayNoDuplicates!0 (_keys!12142 thiss!1559) #b00000000000000000000000000000000 Nil!28583))))

(assert (= (and d!140333 res!847004) b!1273941))

(assert (= (and b!1273941 res!847005) b!1273942))

(assert (= (and b!1273942 res!847006) b!1273943))

(declare-fun m!1171825 () Bool)

(assert (=> d!140333 m!1171825))

(declare-fun m!1171827 () Bool)

(assert (=> b!1273941 m!1171827))

(declare-fun m!1171829 () Bool)

(assert (=> b!1273942 m!1171829))

(declare-fun m!1171831 () Bool)

(assert (=> b!1273943 m!1171831))

(assert (=> start!107636 d!140333))

(declare-fun d!140335 () Bool)

(assert (=> d!140335 (= (validMask!0 (mask!34508 thiss!1559)) (and (or (= (mask!34508 thiss!1559) #b00000000000000000000000000000111) (= (mask!34508 thiss!1559) #b00000000000000000000000000001111) (= (mask!34508 thiss!1559) #b00000000000000000000000000011111) (= (mask!34508 thiss!1559) #b00000000000000000000000000111111) (= (mask!34508 thiss!1559) #b00000000000000000000000001111111) (= (mask!34508 thiss!1559) #b00000000000000000000000011111111) (= (mask!34508 thiss!1559) #b00000000000000000000000111111111) (= (mask!34508 thiss!1559) #b00000000000000000000001111111111) (= (mask!34508 thiss!1559) #b00000000000000000000011111111111) (= (mask!34508 thiss!1559) #b00000000000000000000111111111111) (= (mask!34508 thiss!1559) #b00000000000000000001111111111111) (= (mask!34508 thiss!1559) #b00000000000000000011111111111111) (= (mask!34508 thiss!1559) #b00000000000000000111111111111111) (= (mask!34508 thiss!1559) #b00000000000000001111111111111111) (= (mask!34508 thiss!1559) #b00000000000000011111111111111111) (= (mask!34508 thiss!1559) #b00000000000000111111111111111111) (= (mask!34508 thiss!1559) #b00000000000001111111111111111111) (= (mask!34508 thiss!1559) #b00000000000011111111111111111111) (= (mask!34508 thiss!1559) #b00000000000111111111111111111111) (= (mask!34508 thiss!1559) #b00000000001111111111111111111111) (= (mask!34508 thiss!1559) #b00000000011111111111111111111111) (= (mask!34508 thiss!1559) #b00000000111111111111111111111111) (= (mask!34508 thiss!1559) #b00000001111111111111111111111111) (= (mask!34508 thiss!1559) #b00000011111111111111111111111111) (= (mask!34508 thiss!1559) #b00000111111111111111111111111111) (= (mask!34508 thiss!1559) #b00001111111111111111111111111111) (= (mask!34508 thiss!1559) #b00011111111111111111111111111111) (= (mask!34508 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34508 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273893 d!140335))

(declare-fun b!1273951 () Bool)

(declare-fun e!726776 () Bool)

(assert (=> b!1273951 (= e!726776 tp_is_empty!33043)))

(declare-fun b!1273950 () Bool)

(declare-fun e!726777 () Bool)

(assert (=> b!1273950 (= e!726777 tp_is_empty!33043)))

(declare-fun mapNonEmpty!51168 () Bool)

(declare-fun mapRes!51168 () Bool)

(declare-fun tp!97554 () Bool)

(assert (=> mapNonEmpty!51168 (= mapRes!51168 (and tp!97554 e!726777))))

(declare-fun mapKey!51168 () (_ BitVec 32))

(declare-fun mapValue!51168 () ValueCell!15668)

(declare-fun mapRest!51168 () (Array (_ BitVec 32) ValueCell!15668))

(assert (=> mapNonEmpty!51168 (= mapRest!51159 (store mapRest!51168 mapKey!51168 mapValue!51168))))

(declare-fun mapIsEmpty!51168 () Bool)

(assert (=> mapIsEmpty!51168 mapRes!51168))

(declare-fun condMapEmpty!51168 () Bool)

(declare-fun mapDefault!51168 () ValueCell!15668)

(assert (=> mapNonEmpty!51159 (= condMapEmpty!51168 (= mapRest!51159 ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51168)))))

(assert (=> mapNonEmpty!51159 (= tp!97538 (and e!726776 mapRes!51168))))

(assert (= (and mapNonEmpty!51159 condMapEmpty!51168) mapIsEmpty!51168))

(assert (= (and mapNonEmpty!51159 (not condMapEmpty!51168)) mapNonEmpty!51168))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15668) mapValue!51168)) b!1273950))

(assert (= (and mapNonEmpty!51159 ((_ is ValueCellFull!15668) mapDefault!51168)) b!1273951))

(declare-fun m!1171833 () Bool)

(assert (=> mapNonEmpty!51168 m!1171833))

(check-sat (not b!1273941) (not b!1273942) (not mapNonEmpty!51168) (not b_next!27673) (not d!140333) tp_is_empty!33043 b_and!45731 (not b!1273943))
(check-sat b_and!45731 (not b_next!27673))
(get-model)

(declare-fun bm!62620 () Bool)

(declare-fun call!62623 () Bool)

(assert (=> bm!62620 (= call!62623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12142 thiss!1559) (mask!34508 thiss!1559)))))

(declare-fun b!1273960 () Bool)

(declare-fun e!726786 () Bool)

(assert (=> b!1273960 (= e!726786 call!62623)))

(declare-fun b!1273961 () Bool)

(declare-fun e!726784 () Bool)

(assert (=> b!1273961 (= e!726784 e!726786)))

(declare-fun c!124111 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273961 (= c!124111 (validKeyInArray!0 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273962 () Bool)

(declare-fun e!726785 () Bool)

(assert (=> b!1273962 (= e!726785 call!62623)))

(declare-fun d!140337 () Bool)

(declare-fun res!847011 () Bool)

(assert (=> d!140337 (=> res!847011 e!726784)))

(assert (=> d!140337 (= res!847011 (bvsge #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))))))

(assert (=> d!140337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12142 thiss!1559) (mask!34508 thiss!1559)) e!726784)))

(declare-fun b!1273963 () Bool)

(assert (=> b!1273963 (= e!726786 e!726785)))

(declare-fun lt!575561 () (_ BitVec 64))

(assert (=> b!1273963 (= lt!575561 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42293 0))(
  ( (Unit!42294) )
))
(declare-fun lt!575559 () Unit!42293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83361 (_ BitVec 64) (_ BitVec 32)) Unit!42293)

(assert (=> b!1273963 (= lt!575559 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12142 thiss!1559) lt!575561 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273963 (arrayContainsKey!0 (_keys!12142 thiss!1559) lt!575561 #b00000000000000000000000000000000)))

(declare-fun lt!575560 () Unit!42293)

(assert (=> b!1273963 (= lt!575560 lt!575559)))

(declare-fun res!847012 () Bool)

(declare-datatypes ((SeekEntryResult!9947 0))(
  ( (MissingZero!9947 (index!42159 (_ BitVec 32))) (Found!9947 (index!42160 (_ BitVec 32))) (Intermediate!9947 (undefined!10759 Bool) (index!42161 (_ BitVec 32)) (x!112434 (_ BitVec 32))) (Undefined!9947) (MissingVacant!9947 (index!42162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83361 (_ BitVec 32)) SeekEntryResult!9947)

(assert (=> b!1273963 (= res!847012 (= (seekEntryOrOpen!0 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000) (_keys!12142 thiss!1559) (mask!34508 thiss!1559)) (Found!9947 #b00000000000000000000000000000000)))))

(assert (=> b!1273963 (=> (not res!847012) (not e!726785))))

(assert (= (and d!140337 (not res!847011)) b!1273961))

(assert (= (and b!1273961 c!124111) b!1273963))

(assert (= (and b!1273961 (not c!124111)) b!1273960))

(assert (= (and b!1273963 res!847012) b!1273962))

(assert (= (or b!1273962 b!1273960) bm!62620))

(declare-fun m!1171835 () Bool)

(assert (=> bm!62620 m!1171835))

(declare-fun m!1171837 () Bool)

(assert (=> b!1273961 m!1171837))

(assert (=> b!1273961 m!1171837))

(declare-fun m!1171839 () Bool)

(assert (=> b!1273961 m!1171839))

(assert (=> b!1273963 m!1171837))

(declare-fun m!1171841 () Bool)

(assert (=> b!1273963 m!1171841))

(declare-fun m!1171843 () Bool)

(assert (=> b!1273963 m!1171843))

(assert (=> b!1273963 m!1171837))

(declare-fun m!1171845 () Bool)

(assert (=> b!1273963 m!1171845))

(assert (=> b!1273942 d!140337))

(declare-fun b!1273974 () Bool)

(declare-fun res!847021 () Bool)

(declare-fun e!726789 () Bool)

(assert (=> b!1273974 (=> (not res!847021) (not e!726789))))

(declare-fun size!40753 (LongMapFixedSize!6100) (_ BitVec 32))

(assert (=> b!1273974 (= res!847021 (= (size!40753 thiss!1559) (bvadd (_size!3105 thiss!1559) (bvsdiv (bvadd (extraKeys!6375 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273973 () Bool)

(declare-fun res!847023 () Bool)

(assert (=> b!1273973 (=> (not res!847023) (not e!726789))))

(assert (=> b!1273973 (= res!847023 (bvsge (size!40753 thiss!1559) (_size!3105 thiss!1559)))))

(declare-fun b!1273972 () Bool)

(declare-fun res!847024 () Bool)

(assert (=> b!1273972 (=> (not res!847024) (not e!726789))))

(assert (=> b!1273972 (= res!847024 (and (= (size!40747 (_values!6719 thiss!1559)) (bvadd (mask!34508 thiss!1559) #b00000000000000000000000000000001)) (= (size!40748 (_keys!12142 thiss!1559)) (size!40747 (_values!6719 thiss!1559))) (bvsge (_size!3105 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3105 thiss!1559) (bvadd (mask!34508 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1273975 () Bool)

(assert (=> b!1273975 (= e!726789 (and (bvsge (extraKeys!6375 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6375 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3105 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!140339 () Bool)

(declare-fun res!847022 () Bool)

(assert (=> d!140339 (=> (not res!847022) (not e!726789))))

(assert (=> d!140339 (= res!847022 (validMask!0 (mask!34508 thiss!1559)))))

(assert (=> d!140339 (= (simpleValid!457 thiss!1559) e!726789)))

(assert (= (and d!140339 res!847022) b!1273972))

(assert (= (and b!1273972 res!847024) b!1273973))

(assert (= (and b!1273973 res!847023) b!1273974))

(assert (= (and b!1273974 res!847021) b!1273975))

(declare-fun m!1171847 () Bool)

(assert (=> b!1273974 m!1171847))

(assert (=> b!1273973 m!1171847))

(assert (=> d!140339 m!1171795))

(assert (=> d!140333 d!140339))

(declare-fun b!1273984 () Bool)

(declare-fun e!726794 () (_ BitVec 32))

(assert (=> b!1273984 (= e!726794 #b00000000000000000000000000000000)))

(declare-fun d!140341 () Bool)

(declare-fun lt!575564 () (_ BitVec 32))

(assert (=> d!140341 (and (bvsge lt!575564 #b00000000000000000000000000000000) (bvsle lt!575564 (bvsub (size!40748 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!140341 (= lt!575564 e!726794)))

(declare-fun c!124116 () Bool)

(assert (=> d!140341 (= c!124116 (bvsge #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))))))

(assert (=> d!140341 (and (bvsle #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40748 (_keys!12142 thiss!1559)) (size!40748 (_keys!12142 thiss!1559))))))

(assert (=> d!140341 (= (arrayCountValidKeys!0 (_keys!12142 thiss!1559) #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))) lt!575564)))

(declare-fun bm!62623 () Bool)

(declare-fun call!62626 () (_ BitVec 32))

(assert (=> bm!62623 (= call!62626 (arrayCountValidKeys!0 (_keys!12142 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40748 (_keys!12142 thiss!1559))))))

(declare-fun b!1273985 () Bool)

(declare-fun e!726795 () (_ BitVec 32))

(assert (=> b!1273985 (= e!726794 e!726795)))

(declare-fun c!124117 () Bool)

(assert (=> b!1273985 (= c!124117 (validKeyInArray!0 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273986 () Bool)

(assert (=> b!1273986 (= e!726795 (bvadd #b00000000000000000000000000000001 call!62626))))

(declare-fun b!1273987 () Bool)

(assert (=> b!1273987 (= e!726795 call!62626)))

(assert (= (and d!140341 c!124116) b!1273984))

(assert (= (and d!140341 (not c!124116)) b!1273985))

(assert (= (and b!1273985 c!124117) b!1273986))

(assert (= (and b!1273985 (not c!124117)) b!1273987))

(assert (= (or b!1273986 b!1273987) bm!62623))

(declare-fun m!1171849 () Bool)

(assert (=> bm!62623 m!1171849))

(assert (=> b!1273985 m!1171837))

(assert (=> b!1273985 m!1171837))

(assert (=> b!1273985 m!1171839))

(assert (=> b!1273941 d!140341))

(declare-fun d!140343 () Bool)

(declare-fun res!847032 () Bool)

(declare-fun e!726804 () Bool)

(assert (=> d!140343 (=> res!847032 e!726804)))

(assert (=> d!140343 (= res!847032 (bvsge #b00000000000000000000000000000000 (size!40748 (_keys!12142 thiss!1559))))))

(assert (=> d!140343 (= (arrayNoDuplicates!0 (_keys!12142 thiss!1559) #b00000000000000000000000000000000 Nil!28583) e!726804)))

(declare-fun b!1273998 () Bool)

(declare-fun e!726806 () Bool)

(declare-fun contains!7694 (List!28586 (_ BitVec 64)) Bool)

(assert (=> b!1273998 (= e!726806 (contains!7694 Nil!28583 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273999 () Bool)

(declare-fun e!726805 () Bool)

(declare-fun e!726807 () Bool)

(assert (=> b!1273999 (= e!726805 e!726807)))

(declare-fun c!124120 () Bool)

(assert (=> b!1273999 (= c!124120 (validKeyInArray!0 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62626 () Bool)

(declare-fun call!62629 () Bool)

(assert (=> bm!62626 (= call!62629 (arrayNoDuplicates!0 (_keys!12142 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124120 (Cons!28582 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000) Nil!28583) Nil!28583)))))

(declare-fun b!1274000 () Bool)

(assert (=> b!1274000 (= e!726807 call!62629)))

(declare-fun b!1274001 () Bool)

(assert (=> b!1274001 (= e!726804 e!726805)))

(declare-fun res!847031 () Bool)

(assert (=> b!1274001 (=> (not res!847031) (not e!726805))))

(assert (=> b!1274001 (= res!847031 (not e!726806))))

(declare-fun res!847033 () Bool)

(assert (=> b!1274001 (=> (not res!847033) (not e!726806))))

(assert (=> b!1274001 (= res!847033 (validKeyInArray!0 (select (arr!40209 (_keys!12142 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274002 () Bool)

(assert (=> b!1274002 (= e!726807 call!62629)))

(assert (= (and d!140343 (not res!847032)) b!1274001))

(assert (= (and b!1274001 res!847033) b!1273998))

(assert (= (and b!1274001 res!847031) b!1273999))

(assert (= (and b!1273999 c!124120) b!1274000))

(assert (= (and b!1273999 (not c!124120)) b!1274002))

(assert (= (or b!1274000 b!1274002) bm!62626))

(assert (=> b!1273998 m!1171837))

(assert (=> b!1273998 m!1171837))

(declare-fun m!1171851 () Bool)

(assert (=> b!1273998 m!1171851))

(assert (=> b!1273999 m!1171837))

(assert (=> b!1273999 m!1171837))

(assert (=> b!1273999 m!1171839))

(assert (=> bm!62626 m!1171837))

(declare-fun m!1171853 () Bool)

(assert (=> bm!62626 m!1171853))

(assert (=> b!1274001 m!1171837))

(assert (=> b!1274001 m!1171837))

(assert (=> b!1274001 m!1171839))

(assert (=> b!1273943 d!140343))

(declare-fun b!1274004 () Bool)

(declare-fun e!726808 () Bool)

(assert (=> b!1274004 (= e!726808 tp_is_empty!33043)))

(declare-fun b!1274003 () Bool)

(declare-fun e!726809 () Bool)

(assert (=> b!1274003 (= e!726809 tp_is_empty!33043)))

(declare-fun mapNonEmpty!51169 () Bool)

(declare-fun mapRes!51169 () Bool)

(declare-fun tp!97555 () Bool)

(assert (=> mapNonEmpty!51169 (= mapRes!51169 (and tp!97555 e!726809))))

(declare-fun mapKey!51169 () (_ BitVec 32))

(declare-fun mapRest!51169 () (Array (_ BitVec 32) ValueCell!15668))

(declare-fun mapValue!51169 () ValueCell!15668)

(assert (=> mapNonEmpty!51169 (= mapRest!51168 (store mapRest!51169 mapKey!51169 mapValue!51169))))

(declare-fun mapIsEmpty!51169 () Bool)

(assert (=> mapIsEmpty!51169 mapRes!51169))

(declare-fun condMapEmpty!51169 () Bool)

(declare-fun mapDefault!51169 () ValueCell!15668)

(assert (=> mapNonEmpty!51168 (= condMapEmpty!51169 (= mapRest!51168 ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51169)))))

(assert (=> mapNonEmpty!51168 (= tp!97554 (and e!726808 mapRes!51169))))

(assert (= (and mapNonEmpty!51168 condMapEmpty!51169) mapIsEmpty!51169))

(assert (= (and mapNonEmpty!51168 (not condMapEmpty!51169)) mapNonEmpty!51169))

(assert (= (and mapNonEmpty!51169 ((_ is ValueCellFull!15668) mapValue!51169)) b!1274003))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15668) mapDefault!51169)) b!1274004))

(declare-fun m!1171855 () Bool)

(assert (=> mapNonEmpty!51169 m!1171855))

(check-sat tp_is_empty!33043 (not bm!62623) b_and!45731 (not b!1273961) (not b!1274001) (not mapNonEmpty!51169) (not bm!62626) (not b!1273974) (not b!1273985) (not d!140339) (not bm!62620) (not b!1273998) (not b!1273999) (not b!1273963) (not b_next!27673) (not b!1273973))
(check-sat b_and!45731 (not b_next!27673))
