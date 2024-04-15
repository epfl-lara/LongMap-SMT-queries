; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19196 () Bool)

(assert start!19196)

(declare-fun b!188659 () Bool)

(declare-fun b_free!4633 () Bool)

(declare-fun b_next!4633 () Bool)

(assert (=> b!188659 (= b_free!4633 (not b_next!4633))))

(declare-fun tp!16726 () Bool)

(declare-fun b_and!11241 () Bool)

(assert (=> b!188659 (= tp!16726 b_and!11241)))

(declare-fun mapNonEmpty!7597 () Bool)

(declare-fun mapRes!7597 () Bool)

(declare-fun tp!16725 () Bool)

(declare-fun e!124161 () Bool)

(assert (=> mapNonEmpty!7597 (= mapRes!7597 (and tp!16725 e!124161))))

(declare-datatypes ((V!5521 0))(
  ( (V!5522 (val!2247 Int)) )
))
(declare-datatypes ((ValueCell!1859 0))(
  ( (ValueCellFull!1859 (v!4160 V!5521)) (EmptyCell!1859) )
))
(declare-fun mapValue!7597 () ValueCell!1859)

(declare-fun mapKey!7597 () (_ BitVec 32))

(declare-fun mapRest!7597 () (Array (_ BitVec 32) ValueCell!1859))

(declare-datatypes ((array!8015 0))(
  ( (array!8016 (arr!3778 (Array (_ BitVec 32) (_ BitVec 64))) (size!4099 (_ BitVec 32))) )
))
(declare-datatypes ((array!8017 0))(
  ( (array!8018 (arr!3779 (Array (_ BitVec 32) ValueCell!1859)) (size!4100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2626 0))(
  ( (LongMapFixedSize!2627 (defaultEntry!3851 Int) (mask!9025 (_ BitVec 32)) (extraKeys!3588 (_ BitVec 32)) (zeroValue!3692 V!5521) (minValue!3692 V!5521) (_size!1362 (_ BitVec 32)) (_keys!5813 array!8015) (_values!3834 array!8017) (_vacant!1362 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2626)

(assert (=> mapNonEmpty!7597 (= (arr!3779 (_values!3834 thiss!1248)) (store mapRest!7597 mapKey!7597 mapValue!7597))))

(declare-fun b!188657 () Bool)

(declare-fun e!124162 () Bool)

(declare-fun e!124159 () Bool)

(assert (=> b!188657 (= e!124162 (and e!124159 mapRes!7597))))

(declare-fun condMapEmpty!7597 () Bool)

(declare-fun mapDefault!7597 () ValueCell!1859)

(assert (=> b!188657 (= condMapEmpty!7597 (= (arr!3779 (_values!3834 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1859)) mapDefault!7597)))))

(declare-fun b!188658 () Bool)

(declare-fun tp_is_empty!4405 () Bool)

(assert (=> b!188658 (= e!124159 tp_is_empty!4405)))

(declare-fun e!124156 () Bool)

(declare-fun array_inv!2443 (array!8015) Bool)

(declare-fun array_inv!2444 (array!8017) Bool)

(assert (=> b!188659 (= e!124156 (and tp!16726 tp_is_empty!4405 (array_inv!2443 (_keys!5813 thiss!1248)) (array_inv!2444 (_values!3834 thiss!1248)) e!124162))))

(declare-fun b!188660 () Bool)

(declare-datatypes ((Unit!5652 0))(
  ( (Unit!5653) )
))
(declare-fun e!124158 () Unit!5652)

(declare-fun lt!93280 () Unit!5652)

(assert (=> b!188660 (= e!124158 lt!93280)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5652)

(assert (=> b!188660 (= lt!93280 (lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(declare-fun res!89160 () Bool)

(declare-datatypes ((SeekEntryResult!661 0))(
  ( (MissingZero!661 (index!4814 (_ BitVec 32))) (Found!661 (index!4815 (_ BitVec 32))) (Intermediate!661 (undefined!1473 Bool) (index!4816 (_ BitVec 32)) (x!20382 (_ BitVec 32))) (Undefined!661) (MissingVacant!661 (index!4817 (_ BitVec 32))) )
))
(declare-fun lt!93277 () SeekEntryResult!661)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188660 (= res!89160 (inRange!0 (index!4815 lt!93277) (mask!9025 thiss!1248)))))

(declare-fun e!124153 () Bool)

(assert (=> b!188660 (=> (not res!89160) (not e!124153))))

(assert (=> b!188660 e!124153))

(declare-fun b!188661 () Bool)

(declare-fun res!89155 () Bool)

(declare-fun e!124155 () Bool)

(assert (=> b!188661 (=> (not res!89155) (not e!124155))))

(assert (=> b!188661 (= res!89155 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188662 () Bool)

(assert (=> b!188662 (= e!124161 tp_is_empty!4405)))

(declare-fun res!89157 () Bool)

(assert (=> start!19196 (=> (not res!89157) (not e!124155))))

(declare-fun valid!1098 (LongMapFixedSize!2626) Bool)

(assert (=> start!19196 (= res!89157 (valid!1098 thiss!1248))))

(assert (=> start!19196 e!124155))

(assert (=> start!19196 e!124156))

(assert (=> start!19196 true))

(declare-fun b!188663 () Bool)

(declare-fun res!89161 () Bool)

(declare-fun e!124160 () Bool)

(assert (=> b!188663 (=> (not res!89161) (not e!124160))))

(declare-datatypes ((List!2380 0))(
  ( (Nil!2377) (Cons!2376 (h!3013 (_ BitVec 64)) (t!7271 List!2380)) )
))
(declare-fun arrayNoDuplicates!0 (array!8015 (_ BitVec 32) List!2380) Bool)

(assert (=> b!188663 (= res!89161 (arrayNoDuplicates!0 (_keys!5813 thiss!1248) #b00000000000000000000000000000000 Nil!2377))))

(declare-fun b!188664 () Bool)

(declare-fun Unit!5654 () Unit!5652)

(assert (=> b!188664 (= e!124158 Unit!5654)))

(declare-fun lt!93279 () Unit!5652)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5652)

(assert (=> b!188664 (= lt!93279 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> b!188664 false))

(declare-fun b!188665 () Bool)

(declare-fun res!89162 () Bool)

(assert (=> b!188665 (=> (not res!89162) (not e!124160))))

(assert (=> b!188665 (= res!89162 (and (= (size!4100 (_values!3834 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9025 thiss!1248))) (= (size!4099 (_keys!5813 thiss!1248)) (size!4100 (_values!3834 thiss!1248))) (bvsge (mask!9025 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3588 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3588 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188666 () Bool)

(assert (=> b!188666 (= e!124160 (or (bvslt (index!4815 lt!93277) #b00000000000000000000000000000000) (bvsge (index!4815 lt!93277) (size!4099 (_keys!5813 thiss!1248)))))))

(declare-fun b!188667 () Bool)

(declare-fun e!124154 () Bool)

(assert (=> b!188667 (= e!124154 e!124160)))

(declare-fun res!89158 () Bool)

(assert (=> b!188667 (=> (not res!89158) (not e!124160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188667 (= res!89158 (validMask!0 (mask!9025 thiss!1248)))))

(declare-fun lt!93278 () Unit!5652)

(assert (=> b!188667 (= lt!93278 e!124158)))

(declare-fun c!33912 () Bool)

(declare-datatypes ((tuple2!3454 0))(
  ( (tuple2!3455 (_1!1738 (_ BitVec 64)) (_2!1738 V!5521)) )
))
(declare-datatypes ((List!2381 0))(
  ( (Nil!2378) (Cons!2377 (h!3014 tuple2!3454) (t!7272 List!2381)) )
))
(declare-datatypes ((ListLongMap!2363 0))(
  ( (ListLongMap!2364 (toList!1197 List!2381)) )
))
(declare-fun contains!1308 (ListLongMap!2363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!830 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 32) Int) ListLongMap!2363)

(assert (=> b!188667 (= c!33912 (contains!1308 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7597 () Bool)

(assert (=> mapIsEmpty!7597 mapRes!7597))

(declare-fun b!188668 () Bool)

(declare-fun res!89159 () Bool)

(assert (=> b!188668 (=> (not res!89159) (not e!124160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8015 (_ BitVec 32)) Bool)

(assert (=> b!188668 (= res!89159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun b!188669 () Bool)

(assert (=> b!188669 (= e!124155 e!124154)))

(declare-fun res!89156 () Bool)

(assert (=> b!188669 (=> (not res!89156) (not e!124154))))

(get-info :version)

(assert (=> b!188669 (= res!89156 (and (not ((_ is Undefined!661) lt!93277)) (not ((_ is MissingVacant!661) lt!93277)) (not ((_ is MissingZero!661) lt!93277)) ((_ is Found!661) lt!93277)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8015 (_ BitVec 32)) SeekEntryResult!661)

(assert (=> b!188669 (= lt!93277 (seekEntryOrOpen!0 key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun b!188670 () Bool)

(assert (=> b!188670 (= e!124153 (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4815 lt!93277)) key!828))))

(assert (= (and start!19196 res!89157) b!188661))

(assert (= (and b!188661 res!89155) b!188669))

(assert (= (and b!188669 res!89156) b!188667))

(assert (= (and b!188667 c!33912) b!188660))

(assert (= (and b!188667 (not c!33912)) b!188664))

(assert (= (and b!188660 res!89160) b!188670))

(assert (= (and b!188667 res!89158) b!188665))

(assert (= (and b!188665 res!89162) b!188668))

(assert (= (and b!188668 res!89159) b!188663))

(assert (= (and b!188663 res!89161) b!188666))

(assert (= (and b!188657 condMapEmpty!7597) mapIsEmpty!7597))

(assert (= (and b!188657 (not condMapEmpty!7597)) mapNonEmpty!7597))

(assert (= (and mapNonEmpty!7597 ((_ is ValueCellFull!1859) mapValue!7597)) b!188662))

(assert (= (and b!188657 ((_ is ValueCellFull!1859) mapDefault!7597)) b!188658))

(assert (= b!188659 b!188657))

(assert (= start!19196 b!188659))

(declare-fun m!214733 () Bool)

(assert (=> b!188659 m!214733))

(declare-fun m!214735 () Bool)

(assert (=> b!188659 m!214735))

(declare-fun m!214737 () Bool)

(assert (=> b!188660 m!214737))

(declare-fun m!214739 () Bool)

(assert (=> b!188660 m!214739))

(declare-fun m!214741 () Bool)

(assert (=> b!188670 m!214741))

(declare-fun m!214743 () Bool)

(assert (=> start!19196 m!214743))

(declare-fun m!214745 () Bool)

(assert (=> b!188667 m!214745))

(declare-fun m!214747 () Bool)

(assert (=> b!188667 m!214747))

(assert (=> b!188667 m!214747))

(declare-fun m!214749 () Bool)

(assert (=> b!188667 m!214749))

(declare-fun m!214751 () Bool)

(assert (=> b!188663 m!214751))

(declare-fun m!214753 () Bool)

(assert (=> b!188664 m!214753))

(declare-fun m!214755 () Bool)

(assert (=> b!188669 m!214755))

(declare-fun m!214757 () Bool)

(assert (=> b!188668 m!214757))

(declare-fun m!214759 () Bool)

(assert (=> mapNonEmpty!7597 m!214759))

(check-sat (not b!188663) (not start!19196) (not b!188659) (not b!188664) (not b!188669) tp_is_empty!4405 b_and!11241 (not b!188668) (not mapNonEmpty!7597) (not b!188667) (not b!188660) (not b_next!4633))
(check-sat b_and!11241 (not b_next!4633))
(get-model)

(declare-fun b!188771 () Bool)

(declare-fun e!124234 () Bool)

(declare-fun e!124232 () Bool)

(assert (=> b!188771 (= e!124234 e!124232)))

(declare-fun c!33924 () Bool)

(declare-fun lt!93310 () SeekEntryResult!661)

(assert (=> b!188771 (= c!33924 ((_ is MissingVacant!661) lt!93310))))

(declare-fun b!188773 () Bool)

(declare-fun e!124233 () Bool)

(declare-fun call!19018 () Bool)

(assert (=> b!188773 (= e!124233 (not call!19018))))

(declare-fun call!19017 () Bool)

(declare-fun bm!19014 () Bool)

(declare-fun c!33923 () Bool)

(assert (=> bm!19014 (= call!19017 (inRange!0 (ite c!33923 (index!4814 lt!93310) (index!4817 lt!93310)) (mask!9025 thiss!1248)))))

(declare-fun b!188774 () Bool)

(assert (=> b!188774 (and (bvsge (index!4814 lt!93310) #b00000000000000000000000000000000) (bvslt (index!4814 lt!93310) (size!4099 (_keys!5813 thiss!1248))))))

(declare-fun res!89222 () Bool)

(assert (=> b!188774 (= res!89222 (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4814 lt!93310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188774 (=> (not res!89222) (not e!124233))))

(declare-fun b!188775 () Bool)

(assert (=> b!188775 (= e!124232 ((_ is Undefined!661) lt!93310))))

(declare-fun bm!19015 () Bool)

(declare-fun arrayContainsKey!0 (array!8015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19015 (= call!19018 (arrayContainsKey!0 (_keys!5813 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188776 () Bool)

(assert (=> b!188776 (= e!124234 e!124233)))

(declare-fun res!89220 () Bool)

(assert (=> b!188776 (= res!89220 call!19017)))

(assert (=> b!188776 (=> (not res!89220) (not e!124233))))

(declare-fun b!188777 () Bool)

(declare-fun e!124231 () Bool)

(assert (=> b!188777 (= e!124231 (not call!19018))))

(declare-fun b!188778 () Bool)

(declare-fun res!89221 () Bool)

(assert (=> b!188778 (=> (not res!89221) (not e!124231))))

(assert (=> b!188778 (= res!89221 (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4817 lt!93310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188778 (and (bvsge (index!4817 lt!93310) #b00000000000000000000000000000000) (bvslt (index!4817 lt!93310) (size!4099 (_keys!5813 thiss!1248))))))

(declare-fun d!55513 () Bool)

(assert (=> d!55513 e!124234))

(assert (=> d!55513 (= c!33923 ((_ is MissingZero!661) lt!93310))))

(assert (=> d!55513 (= lt!93310 (seekEntryOrOpen!0 key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun lt!93309 () Unit!5652)

(declare-fun choose!1017 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5652)

(assert (=> d!55513 (= lt!93309 (choose!1017 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> d!55513 (validMask!0 (mask!9025 thiss!1248))))

(assert (=> d!55513 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)) lt!93309)))

(declare-fun b!188772 () Bool)

(declare-fun res!89219 () Bool)

(assert (=> b!188772 (=> (not res!89219) (not e!124231))))

(assert (=> b!188772 (= res!89219 call!19017)))

(assert (=> b!188772 (= e!124232 e!124231)))

(assert (= (and d!55513 c!33923) b!188776))

(assert (= (and d!55513 (not c!33923)) b!188771))

(assert (= (and b!188776 res!89220) b!188774))

(assert (= (and b!188774 res!89222) b!188773))

(assert (= (and b!188771 c!33924) b!188772))

(assert (= (and b!188771 (not c!33924)) b!188775))

(assert (= (and b!188772 res!89219) b!188778))

(assert (= (and b!188778 res!89221) b!188777))

(assert (= (or b!188776 b!188772) bm!19014))

(assert (= (or b!188773 b!188777) bm!19015))

(assert (=> d!55513 m!214755))

(declare-fun m!214817 () Bool)

(assert (=> d!55513 m!214817))

(assert (=> d!55513 m!214745))

(declare-fun m!214819 () Bool)

(assert (=> b!188774 m!214819))

(declare-fun m!214821 () Bool)

(assert (=> bm!19015 m!214821))

(declare-fun m!214823 () Bool)

(assert (=> bm!19014 m!214823))

(declare-fun m!214825 () Bool)

(assert (=> b!188778 m!214825))

(assert (=> b!188664 d!55513))

(declare-fun d!55515 () Bool)

(declare-fun res!89227 () Bool)

(declare-fun e!124241 () Bool)

(assert (=> d!55515 (=> res!89227 e!124241)))

(assert (=> d!55515 (= res!89227 (bvsge #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(assert (=> d!55515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)) e!124241)))

(declare-fun b!188787 () Bool)

(declare-fun e!124243 () Bool)

(declare-fun call!19021 () Bool)

(assert (=> b!188787 (= e!124243 call!19021)))

(declare-fun b!188788 () Bool)

(declare-fun e!124242 () Bool)

(assert (=> b!188788 (= e!124243 e!124242)))

(declare-fun lt!93319 () (_ BitVec 64))

(assert (=> b!188788 (= lt!93319 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93317 () Unit!5652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8015 (_ BitVec 64) (_ BitVec 32)) Unit!5652)

(assert (=> b!188788 (= lt!93317 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5813 thiss!1248) lt!93319 #b00000000000000000000000000000000))))

(assert (=> b!188788 (arrayContainsKey!0 (_keys!5813 thiss!1248) lt!93319 #b00000000000000000000000000000000)))

(declare-fun lt!93318 () Unit!5652)

(assert (=> b!188788 (= lt!93318 lt!93317)))

(declare-fun res!89228 () Bool)

(assert (=> b!188788 (= res!89228 (= (seekEntryOrOpen!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000) (_keys!5813 thiss!1248) (mask!9025 thiss!1248)) (Found!661 #b00000000000000000000000000000000)))))

(assert (=> b!188788 (=> (not res!89228) (not e!124242))))

(declare-fun b!188789 () Bool)

(assert (=> b!188789 (= e!124242 call!19021)))

(declare-fun b!188790 () Bool)

(assert (=> b!188790 (= e!124241 e!124243)))

(declare-fun c!33927 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188790 (= c!33927 (validKeyInArray!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19018 () Bool)

(assert (=> bm!19018 (= call!19021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(assert (= (and d!55515 (not res!89227)) b!188790))

(assert (= (and b!188790 c!33927) b!188788))

(assert (= (and b!188790 (not c!33927)) b!188787))

(assert (= (and b!188788 res!89228) b!188789))

(assert (= (or b!188789 b!188787) bm!19018))

(declare-fun m!214827 () Bool)

(assert (=> b!188788 m!214827))

(declare-fun m!214829 () Bool)

(assert (=> b!188788 m!214829))

(declare-fun m!214831 () Bool)

(assert (=> b!188788 m!214831))

(assert (=> b!188788 m!214827))

(declare-fun m!214833 () Bool)

(assert (=> b!188788 m!214833))

(assert (=> b!188790 m!214827))

(assert (=> b!188790 m!214827))

(declare-fun m!214835 () Bool)

(assert (=> b!188790 m!214835))

(declare-fun m!214837 () Bool)

(assert (=> bm!19018 m!214837))

(assert (=> b!188668 d!55515))

(declare-fun d!55517 () Bool)

(declare-fun res!89237 () Bool)

(declare-fun e!124254 () Bool)

(assert (=> d!55517 (=> res!89237 e!124254)))

(assert (=> d!55517 (= res!89237 (bvsge #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(assert (=> d!55517 (= (arrayNoDuplicates!0 (_keys!5813 thiss!1248) #b00000000000000000000000000000000 Nil!2377) e!124254)))

(declare-fun b!188801 () Bool)

(declare-fun e!124253 () Bool)

(assert (=> b!188801 (= e!124254 e!124253)))

(declare-fun res!89236 () Bool)

(assert (=> b!188801 (=> (not res!89236) (not e!124253))))

(declare-fun e!124255 () Bool)

(assert (=> b!188801 (= res!89236 (not e!124255))))

(declare-fun res!89235 () Bool)

(assert (=> b!188801 (=> (not res!89235) (not e!124255))))

(assert (=> b!188801 (= res!89235 (validKeyInArray!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188802 () Bool)

(declare-fun e!124252 () Bool)

(assert (=> b!188802 (= e!124253 e!124252)))

(declare-fun c!33930 () Bool)

(assert (=> b!188802 (= c!33930 (validKeyInArray!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188803 () Bool)

(declare-fun call!19024 () Bool)

(assert (=> b!188803 (= e!124252 call!19024)))

(declare-fun b!188804 () Bool)

(declare-fun contains!1309 (List!2380 (_ BitVec 64)) Bool)

(assert (=> b!188804 (= e!124255 (contains!1309 Nil!2377 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19021 () Bool)

(assert (=> bm!19021 (= call!19024 (arrayNoDuplicates!0 (_keys!5813 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33930 (Cons!2376 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000) Nil!2377) Nil!2377)))))

(declare-fun b!188805 () Bool)

(assert (=> b!188805 (= e!124252 call!19024)))

(assert (= (and d!55517 (not res!89237)) b!188801))

(assert (= (and b!188801 res!89235) b!188804))

(assert (= (and b!188801 res!89236) b!188802))

(assert (= (and b!188802 c!33930) b!188805))

(assert (= (and b!188802 (not c!33930)) b!188803))

(assert (= (or b!188805 b!188803) bm!19021))

(assert (=> b!188801 m!214827))

(assert (=> b!188801 m!214827))

(assert (=> b!188801 m!214835))

(assert (=> b!188802 m!214827))

(assert (=> b!188802 m!214827))

(assert (=> b!188802 m!214835))

(assert (=> b!188804 m!214827))

(assert (=> b!188804 m!214827))

(declare-fun m!214839 () Bool)

(assert (=> b!188804 m!214839))

(assert (=> bm!19021 m!214827))

(declare-fun m!214841 () Bool)

(assert (=> bm!19021 m!214841))

(assert (=> b!188663 d!55517))

(declare-fun d!55519 () Bool)

(declare-fun e!124258 () Bool)

(assert (=> d!55519 e!124258))

(declare-fun res!89242 () Bool)

(assert (=> d!55519 (=> (not res!89242) (not e!124258))))

(declare-fun lt!93325 () SeekEntryResult!661)

(assert (=> d!55519 (= res!89242 ((_ is Found!661) lt!93325))))

(assert (=> d!55519 (= lt!93325 (seekEntryOrOpen!0 key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun lt!93324 () Unit!5652)

(declare-fun choose!1018 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5652)

(assert (=> d!55519 (= lt!93324 (choose!1018 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> d!55519 (validMask!0 (mask!9025 thiss!1248))))

(assert (=> d!55519 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)) lt!93324)))

(declare-fun b!188810 () Bool)

(declare-fun res!89243 () Bool)

(assert (=> b!188810 (=> (not res!89243) (not e!124258))))

(assert (=> b!188810 (= res!89243 (inRange!0 (index!4815 lt!93325) (mask!9025 thiss!1248)))))

(declare-fun b!188811 () Bool)

(assert (=> b!188811 (= e!124258 (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4815 lt!93325)) key!828))))

(assert (=> b!188811 (and (bvsge (index!4815 lt!93325) #b00000000000000000000000000000000) (bvslt (index!4815 lt!93325) (size!4099 (_keys!5813 thiss!1248))))))

(assert (= (and d!55519 res!89242) b!188810))

(assert (= (and b!188810 res!89243) b!188811))

(assert (=> d!55519 m!214755))

(declare-fun m!214843 () Bool)

(assert (=> d!55519 m!214843))

(assert (=> d!55519 m!214745))

(declare-fun m!214845 () Bool)

(assert (=> b!188810 m!214845))

(declare-fun m!214847 () Bool)

(assert (=> b!188811 m!214847))

(assert (=> b!188660 d!55519))

(declare-fun d!55521 () Bool)

(assert (=> d!55521 (= (inRange!0 (index!4815 lt!93277) (mask!9025 thiss!1248)) (and (bvsge (index!4815 lt!93277) #b00000000000000000000000000000000) (bvslt (index!4815 lt!93277) (bvadd (mask!9025 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188660 d!55521))

(declare-fun b!188824 () Bool)

(declare-fun e!124265 () SeekEntryResult!661)

(declare-fun e!124267 () SeekEntryResult!661)

(assert (=> b!188824 (= e!124265 e!124267)))

(declare-fun lt!93334 () (_ BitVec 64))

(declare-fun lt!93333 () SeekEntryResult!661)

(assert (=> b!188824 (= lt!93334 (select (arr!3778 (_keys!5813 thiss!1248)) (index!4816 lt!93333)))))

(declare-fun c!33938 () Bool)

(assert (=> b!188824 (= c!33938 (= lt!93334 key!828))))

(declare-fun b!188825 () Bool)

(assert (=> b!188825 (= e!124265 Undefined!661)))

(declare-fun d!55523 () Bool)

(declare-fun lt!93332 () SeekEntryResult!661)

(assert (=> d!55523 (and (or ((_ is Undefined!661) lt!93332) (not ((_ is Found!661) lt!93332)) (and (bvsge (index!4815 lt!93332) #b00000000000000000000000000000000) (bvslt (index!4815 lt!93332) (size!4099 (_keys!5813 thiss!1248))))) (or ((_ is Undefined!661) lt!93332) ((_ is Found!661) lt!93332) (not ((_ is MissingZero!661) lt!93332)) (and (bvsge (index!4814 lt!93332) #b00000000000000000000000000000000) (bvslt (index!4814 lt!93332) (size!4099 (_keys!5813 thiss!1248))))) (or ((_ is Undefined!661) lt!93332) ((_ is Found!661) lt!93332) ((_ is MissingZero!661) lt!93332) (not ((_ is MissingVacant!661) lt!93332)) (and (bvsge (index!4817 lt!93332) #b00000000000000000000000000000000) (bvslt (index!4817 lt!93332) (size!4099 (_keys!5813 thiss!1248))))) (or ((_ is Undefined!661) lt!93332) (ite ((_ is Found!661) lt!93332) (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4815 lt!93332)) key!828) (ite ((_ is MissingZero!661) lt!93332) (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4814 lt!93332)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!661) lt!93332) (= (select (arr!3778 (_keys!5813 thiss!1248)) (index!4817 lt!93332)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55523 (= lt!93332 e!124265)))

(declare-fun c!33937 () Bool)

(assert (=> d!55523 (= c!33937 (and ((_ is Intermediate!661) lt!93333) (undefined!1473 lt!93333)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8015 (_ BitVec 32)) SeekEntryResult!661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55523 (= lt!93333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9025 thiss!1248)) key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(assert (=> d!55523 (validMask!0 (mask!9025 thiss!1248))))

(assert (=> d!55523 (= (seekEntryOrOpen!0 key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)) lt!93332)))

(declare-fun b!188826 () Bool)

(assert (=> b!188826 (= e!124267 (Found!661 (index!4816 lt!93333)))))

(declare-fun b!188827 () Bool)

(declare-fun e!124266 () SeekEntryResult!661)

(assert (=> b!188827 (= e!124266 (MissingZero!661 (index!4816 lt!93333)))))

(declare-fun b!188828 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8015 (_ BitVec 32)) SeekEntryResult!661)

(assert (=> b!188828 (= e!124266 (seekKeyOrZeroReturnVacant!0 (x!20382 lt!93333) (index!4816 lt!93333) (index!4816 lt!93333) key!828 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun b!188829 () Bool)

(declare-fun c!33939 () Bool)

(assert (=> b!188829 (= c!33939 (= lt!93334 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188829 (= e!124267 e!124266)))

(assert (= (and d!55523 c!33937) b!188825))

(assert (= (and d!55523 (not c!33937)) b!188824))

(assert (= (and b!188824 c!33938) b!188826))

(assert (= (and b!188824 (not c!33938)) b!188829))

(assert (= (and b!188829 c!33939) b!188827))

(assert (= (and b!188829 (not c!33939)) b!188828))

(declare-fun m!214849 () Bool)

(assert (=> b!188824 m!214849))

(declare-fun m!214851 () Bool)

(assert (=> d!55523 m!214851))

(declare-fun m!214853 () Bool)

(assert (=> d!55523 m!214853))

(declare-fun m!214855 () Bool)

(assert (=> d!55523 m!214855))

(assert (=> d!55523 m!214851))

(declare-fun m!214857 () Bool)

(assert (=> d!55523 m!214857))

(assert (=> d!55523 m!214745))

(declare-fun m!214859 () Bool)

(assert (=> d!55523 m!214859))

(declare-fun m!214861 () Bool)

(assert (=> b!188828 m!214861))

(assert (=> b!188669 d!55523))

(declare-fun d!55525 () Bool)

(assert (=> d!55525 (= (array_inv!2443 (_keys!5813 thiss!1248)) (bvsge (size!4099 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188659 d!55525))

(declare-fun d!55527 () Bool)

(assert (=> d!55527 (= (array_inv!2444 (_values!3834 thiss!1248)) (bvsge (size!4100 (_values!3834 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188659 d!55527))

(declare-fun d!55529 () Bool)

(declare-fun res!89250 () Bool)

(declare-fun e!124270 () Bool)

(assert (=> d!55529 (=> (not res!89250) (not e!124270))))

(declare-fun simpleValid!191 (LongMapFixedSize!2626) Bool)

(assert (=> d!55529 (= res!89250 (simpleValid!191 thiss!1248))))

(assert (=> d!55529 (= (valid!1098 thiss!1248) e!124270)))

(declare-fun b!188836 () Bool)

(declare-fun res!89251 () Bool)

(assert (=> b!188836 (=> (not res!89251) (not e!124270))))

(declare-fun arrayCountValidKeys!0 (array!8015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188836 (= res!89251 (= (arrayCountValidKeys!0 (_keys!5813 thiss!1248) #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))) (_size!1362 thiss!1248)))))

(declare-fun b!188837 () Bool)

(declare-fun res!89252 () Bool)

(assert (=> b!188837 (=> (not res!89252) (not e!124270))))

(assert (=> b!188837 (= res!89252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5813 thiss!1248) (mask!9025 thiss!1248)))))

(declare-fun b!188838 () Bool)

(assert (=> b!188838 (= e!124270 (arrayNoDuplicates!0 (_keys!5813 thiss!1248) #b00000000000000000000000000000000 Nil!2377))))

(assert (= (and d!55529 res!89250) b!188836))

(assert (= (and b!188836 res!89251) b!188837))

(assert (= (and b!188837 res!89252) b!188838))

(declare-fun m!214863 () Bool)

(assert (=> d!55529 m!214863))

(declare-fun m!214865 () Bool)

(assert (=> b!188836 m!214865))

(assert (=> b!188837 m!214757))

(assert (=> b!188838 m!214751))

(assert (=> start!19196 d!55529))

(declare-fun d!55531 () Bool)

(assert (=> d!55531 (= (validMask!0 (mask!9025 thiss!1248)) (and (or (= (mask!9025 thiss!1248) #b00000000000000000000000000000111) (= (mask!9025 thiss!1248) #b00000000000000000000000000001111) (= (mask!9025 thiss!1248) #b00000000000000000000000000011111) (= (mask!9025 thiss!1248) #b00000000000000000000000000111111) (= (mask!9025 thiss!1248) #b00000000000000000000000001111111) (= (mask!9025 thiss!1248) #b00000000000000000000000011111111) (= (mask!9025 thiss!1248) #b00000000000000000000000111111111) (= (mask!9025 thiss!1248) #b00000000000000000000001111111111) (= (mask!9025 thiss!1248) #b00000000000000000000011111111111) (= (mask!9025 thiss!1248) #b00000000000000000000111111111111) (= (mask!9025 thiss!1248) #b00000000000000000001111111111111) (= (mask!9025 thiss!1248) #b00000000000000000011111111111111) (= (mask!9025 thiss!1248) #b00000000000000000111111111111111) (= (mask!9025 thiss!1248) #b00000000000000001111111111111111) (= (mask!9025 thiss!1248) #b00000000000000011111111111111111) (= (mask!9025 thiss!1248) #b00000000000000111111111111111111) (= (mask!9025 thiss!1248) #b00000000000001111111111111111111) (= (mask!9025 thiss!1248) #b00000000000011111111111111111111) (= (mask!9025 thiss!1248) #b00000000000111111111111111111111) (= (mask!9025 thiss!1248) #b00000000001111111111111111111111) (= (mask!9025 thiss!1248) #b00000000011111111111111111111111) (= (mask!9025 thiss!1248) #b00000000111111111111111111111111) (= (mask!9025 thiss!1248) #b00000001111111111111111111111111) (= (mask!9025 thiss!1248) #b00000011111111111111111111111111) (= (mask!9025 thiss!1248) #b00000111111111111111111111111111) (= (mask!9025 thiss!1248) #b00001111111111111111111111111111) (= (mask!9025 thiss!1248) #b00011111111111111111111111111111) (= (mask!9025 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9025 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188667 d!55531))

(declare-fun d!55533 () Bool)

(declare-fun e!124276 () Bool)

(assert (=> d!55533 e!124276))

(declare-fun res!89255 () Bool)

(assert (=> d!55533 (=> res!89255 e!124276)))

(declare-fun lt!93343 () Bool)

(assert (=> d!55533 (= res!89255 (not lt!93343))))

(declare-fun lt!93345 () Bool)

(assert (=> d!55533 (= lt!93343 lt!93345)))

(declare-fun lt!93344 () Unit!5652)

(declare-fun e!124275 () Unit!5652)

(assert (=> d!55533 (= lt!93344 e!124275)))

(declare-fun c!33942 () Bool)

(assert (=> d!55533 (= c!33942 lt!93345)))

(declare-fun containsKey!234 (List!2381 (_ BitVec 64)) Bool)

(assert (=> d!55533 (= lt!93345 (containsKey!234 (toList!1197 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(assert (=> d!55533 (= (contains!1308 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) key!828) lt!93343)))

(declare-fun b!188845 () Bool)

(declare-fun lt!93346 () Unit!5652)

(assert (=> b!188845 (= e!124275 lt!93346)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!183 (List!2381 (_ BitVec 64)) Unit!5652)

(assert (=> b!188845 (= lt!93346 (lemmaContainsKeyImpliesGetValueByKeyDefined!183 (toList!1197 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(declare-datatypes ((Option!236 0))(
  ( (Some!235 (v!4163 V!5521)) (None!234) )
))
(declare-fun isDefined!184 (Option!236) Bool)

(declare-fun getValueByKey!230 (List!2381 (_ BitVec 64)) Option!236)

(assert (=> b!188845 (isDefined!184 (getValueByKey!230 (toList!1197 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(declare-fun b!188846 () Bool)

(declare-fun Unit!5661 () Unit!5652)

(assert (=> b!188846 (= e!124275 Unit!5661)))

(declare-fun b!188847 () Bool)

(assert (=> b!188847 (= e!124276 (isDefined!184 (getValueByKey!230 (toList!1197 (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828)))))

(assert (= (and d!55533 c!33942) b!188845))

(assert (= (and d!55533 (not c!33942)) b!188846))

(assert (= (and d!55533 (not res!89255)) b!188847))

(declare-fun m!214867 () Bool)

(assert (=> d!55533 m!214867))

(declare-fun m!214869 () Bool)

(assert (=> b!188845 m!214869))

(declare-fun m!214871 () Bool)

(assert (=> b!188845 m!214871))

(assert (=> b!188845 m!214871))

(declare-fun m!214873 () Bool)

(assert (=> b!188845 m!214873))

(assert (=> b!188847 m!214871))

(assert (=> b!188847 m!214871))

(assert (=> b!188847 m!214873))

(assert (=> b!188667 d!55533))

(declare-fun b!188890 () Bool)

(declare-fun e!124303 () ListLongMap!2363)

(declare-fun call!19040 () ListLongMap!2363)

(assert (=> b!188890 (= e!124303 call!19040)))

(declare-fun bm!19036 () Bool)

(declare-fun call!19039 () Bool)

(declare-fun lt!93410 () ListLongMap!2363)

(assert (=> bm!19036 (= call!19039 (contains!1308 lt!93410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188891 () Bool)

(declare-fun e!124306 () Bool)

(declare-fun apply!175 (ListLongMap!2363 (_ BitVec 64)) V!5521)

(declare-fun get!2178 (ValueCell!1859 V!5521) V!5521)

(declare-fun dynLambda!509 (Int (_ BitVec 64)) V!5521)

(assert (=> b!188891 (= e!124306 (= (apply!175 lt!93410 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)) (get!2178 (select (arr!3779 (_values!3834 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!509 (defaultEntry!3851 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188891 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4100 (_values!3834 thiss!1248))))))

(assert (=> b!188891 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(declare-fun b!188892 () Bool)

(declare-fun e!124310 () Bool)

(declare-fun e!124311 () Bool)

(assert (=> b!188892 (= e!124310 e!124311)))

(declare-fun c!33960 () Bool)

(assert (=> b!188892 (= c!33960 (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19037 () Bool)

(declare-fun call!19044 () ListLongMap!2363)

(declare-fun call!19041 () ListLongMap!2363)

(assert (=> bm!19037 (= call!19044 call!19041)))

(declare-fun b!188893 () Bool)

(assert (=> b!188893 (= e!124303 call!19044)))

(declare-fun b!188894 () Bool)

(declare-fun e!124314 () Unit!5652)

(declare-fun Unit!5662 () Unit!5652)

(assert (=> b!188894 (= e!124314 Unit!5662)))

(declare-fun b!188895 () Bool)

(declare-fun c!33958 () Bool)

(assert (=> b!188895 (= c!33958 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124309 () ListLongMap!2363)

(assert (=> b!188895 (= e!124309 e!124303)))

(declare-fun b!188896 () Bool)

(declare-fun e!124308 () ListLongMap!2363)

(declare-fun call!19043 () ListLongMap!2363)

(declare-fun +!292 (ListLongMap!2363 tuple2!3454) ListLongMap!2363)

(assert (=> b!188896 (= e!124308 (+!292 call!19043 (tuple2!3455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3692 thiss!1248))))))

(declare-fun b!188897 () Bool)

(declare-fun call!19045 () Bool)

(assert (=> b!188897 (= e!124311 (not call!19045))))

(declare-fun b!188898 () Bool)

(declare-fun e!124315 () Bool)

(assert (=> b!188898 (= e!124311 e!124315)))

(declare-fun res!89277 () Bool)

(assert (=> b!188898 (= res!89277 call!19045)))

(assert (=> b!188898 (=> (not res!89277) (not e!124315))))

(declare-fun b!188899 () Bool)

(assert (=> b!188899 (= e!124315 (= (apply!175 lt!93410 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3692 thiss!1248)))))

(declare-fun b!188900 () Bool)

(declare-fun e!124312 () Bool)

(assert (=> b!188900 (= e!124312 (not call!19039))))

(declare-fun b!188901 () Bool)

(declare-fun lt!93399 () Unit!5652)

(assert (=> b!188901 (= e!124314 lt!93399)))

(declare-fun lt!93404 () ListLongMap!2363)

(declare-fun getCurrentListMapNoExtraKeys!196 (array!8015 array!8017 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 32) Int) ListLongMap!2363)

(assert (=> b!188901 (= lt!93404 (getCurrentListMapNoExtraKeys!196 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93394 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93409 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93409 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93391 () Unit!5652)

(declare-fun addStillContains!151 (ListLongMap!2363 (_ BitVec 64) V!5521 (_ BitVec 64)) Unit!5652)

(assert (=> b!188901 (= lt!93391 (addStillContains!151 lt!93404 lt!93394 (zeroValue!3692 thiss!1248) lt!93409))))

(assert (=> b!188901 (contains!1308 (+!292 lt!93404 (tuple2!3455 lt!93394 (zeroValue!3692 thiss!1248))) lt!93409)))

(declare-fun lt!93401 () Unit!5652)

(assert (=> b!188901 (= lt!93401 lt!93391)))

(declare-fun lt!93402 () ListLongMap!2363)

(assert (=> b!188901 (= lt!93402 (getCurrentListMapNoExtraKeys!196 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93393 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93400 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93400 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93397 () Unit!5652)

(declare-fun addApplyDifferent!151 (ListLongMap!2363 (_ BitVec 64) V!5521 (_ BitVec 64)) Unit!5652)

(assert (=> b!188901 (= lt!93397 (addApplyDifferent!151 lt!93402 lt!93393 (minValue!3692 thiss!1248) lt!93400))))

(assert (=> b!188901 (= (apply!175 (+!292 lt!93402 (tuple2!3455 lt!93393 (minValue!3692 thiss!1248))) lt!93400) (apply!175 lt!93402 lt!93400))))

(declare-fun lt!93408 () Unit!5652)

(assert (=> b!188901 (= lt!93408 lt!93397)))

(declare-fun lt!93405 () ListLongMap!2363)

(assert (=> b!188901 (= lt!93405 (getCurrentListMapNoExtraKeys!196 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93411 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93407 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93407 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93396 () Unit!5652)

(assert (=> b!188901 (= lt!93396 (addApplyDifferent!151 lt!93405 lt!93411 (zeroValue!3692 thiss!1248) lt!93407))))

(assert (=> b!188901 (= (apply!175 (+!292 lt!93405 (tuple2!3455 lt!93411 (zeroValue!3692 thiss!1248))) lt!93407) (apply!175 lt!93405 lt!93407))))

(declare-fun lt!93403 () Unit!5652)

(assert (=> b!188901 (= lt!93403 lt!93396)))

(declare-fun lt!93398 () ListLongMap!2363)

(assert (=> b!188901 (= lt!93398 (getCurrentListMapNoExtraKeys!196 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93395 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93406 () (_ BitVec 64))

(assert (=> b!188901 (= lt!93406 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188901 (= lt!93399 (addApplyDifferent!151 lt!93398 lt!93395 (minValue!3692 thiss!1248) lt!93406))))

(assert (=> b!188901 (= (apply!175 (+!292 lt!93398 (tuple2!3455 lt!93395 (minValue!3692 thiss!1248))) lt!93406) (apply!175 lt!93398 lt!93406))))

(declare-fun b!188902 () Bool)

(declare-fun e!124307 () Bool)

(assert (=> b!188902 (= e!124307 (validKeyInArray!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188903 () Bool)

(assert (=> b!188903 (= e!124308 e!124309)))

(declare-fun c!33959 () Bool)

(assert (=> b!188903 (= c!33959 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188904 () Bool)

(assert (=> b!188904 (= e!124309 call!19040)))

(declare-fun bm!19038 () Bool)

(declare-fun c!33957 () Bool)

(declare-fun call!19042 () ListLongMap!2363)

(assert (=> bm!19038 (= call!19043 (+!292 (ite c!33957 call!19042 (ite c!33959 call!19041 call!19044)) (ite (or c!33957 c!33959) (tuple2!3455 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3692 thiss!1248)) (tuple2!3455 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3692 thiss!1248)))))))

(declare-fun bm!19039 () Bool)

(assert (=> bm!19039 (= call!19045 (contains!1308 lt!93410 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188905 () Bool)

(declare-fun e!124313 () Bool)

(assert (=> b!188905 (= e!124313 (= (apply!175 lt!93410 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3692 thiss!1248)))))

(declare-fun bm!19040 () Bool)

(assert (=> bm!19040 (= call!19040 call!19043)))

(declare-fun b!188906 () Bool)

(declare-fun e!124305 () Bool)

(assert (=> b!188906 (= e!124305 e!124306)))

(declare-fun res!89281 () Bool)

(assert (=> b!188906 (=> (not res!89281) (not e!124306))))

(assert (=> b!188906 (= res!89281 (contains!1308 lt!93410 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(declare-fun bm!19041 () Bool)

(assert (=> bm!19041 (= call!19042 (getCurrentListMapNoExtraKeys!196 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun b!188907 () Bool)

(assert (=> b!188907 (= e!124312 e!124313)))

(declare-fun res!89274 () Bool)

(assert (=> b!188907 (= res!89274 call!19039)))

(assert (=> b!188907 (=> (not res!89274) (not e!124313))))

(declare-fun d!55535 () Bool)

(assert (=> d!55535 e!124310))

(declare-fun res!89276 () Bool)

(assert (=> d!55535 (=> (not res!89276) (not e!124310))))

(assert (=> d!55535 (= res!89276 (or (bvsge #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))))

(declare-fun lt!93412 () ListLongMap!2363)

(assert (=> d!55535 (= lt!93410 lt!93412)))

(declare-fun lt!93392 () Unit!5652)

(assert (=> d!55535 (= lt!93392 e!124314)))

(declare-fun c!33956 () Bool)

(declare-fun e!124304 () Bool)

(assert (=> d!55535 (= c!33956 e!124304)))

(declare-fun res!89280 () Bool)

(assert (=> d!55535 (=> (not res!89280) (not e!124304))))

(assert (=> d!55535 (= res!89280 (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(assert (=> d!55535 (= lt!93412 e!124308)))

(assert (=> d!55535 (= c!33957 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55535 (validMask!0 (mask!9025 thiss!1248))))

(assert (=> d!55535 (= (getCurrentListMap!830 (_keys!5813 thiss!1248) (_values!3834 thiss!1248) (mask!9025 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) lt!93410)))

(declare-fun bm!19042 () Bool)

(assert (=> bm!19042 (= call!19041 call!19042)))

(declare-fun b!188908 () Bool)

(assert (=> b!188908 (= e!124304 (validKeyInArray!0 (select (arr!3778 (_keys!5813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188909 () Bool)

(declare-fun res!89279 () Bool)

(assert (=> b!188909 (=> (not res!89279) (not e!124310))))

(assert (=> b!188909 (= res!89279 e!124305)))

(declare-fun res!89278 () Bool)

(assert (=> b!188909 (=> res!89278 e!124305)))

(assert (=> b!188909 (= res!89278 (not e!124307))))

(declare-fun res!89282 () Bool)

(assert (=> b!188909 (=> (not res!89282) (not e!124307))))

(assert (=> b!188909 (= res!89282 (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5813 thiss!1248))))))

(declare-fun b!188910 () Bool)

(declare-fun res!89275 () Bool)

(assert (=> b!188910 (=> (not res!89275) (not e!124310))))

(assert (=> b!188910 (= res!89275 e!124312)))

(declare-fun c!33955 () Bool)

(assert (=> b!188910 (= c!33955 (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!55535 c!33957) b!188896))

(assert (= (and d!55535 (not c!33957)) b!188903))

(assert (= (and b!188903 c!33959) b!188904))

(assert (= (and b!188903 (not c!33959)) b!188895))

(assert (= (and b!188895 c!33958) b!188890))

(assert (= (and b!188895 (not c!33958)) b!188893))

(assert (= (or b!188890 b!188893) bm!19037))

(assert (= (or b!188904 bm!19037) bm!19042))

(assert (= (or b!188904 b!188890) bm!19040))

(assert (= (or b!188896 bm!19042) bm!19041))

(assert (= (or b!188896 bm!19040) bm!19038))

(assert (= (and d!55535 res!89280) b!188908))

(assert (= (and d!55535 c!33956) b!188901))

(assert (= (and d!55535 (not c!33956)) b!188894))

(assert (= (and d!55535 res!89276) b!188909))

(assert (= (and b!188909 res!89282) b!188902))

(assert (= (and b!188909 (not res!89278)) b!188906))

(assert (= (and b!188906 res!89281) b!188891))

(assert (= (and b!188909 res!89279) b!188910))

(assert (= (and b!188910 c!33955) b!188907))

(assert (= (and b!188910 (not c!33955)) b!188900))

(assert (= (and b!188907 res!89274) b!188905))

(assert (= (or b!188907 b!188900) bm!19036))

(assert (= (and b!188910 res!89275) b!188892))

(assert (= (and b!188892 c!33960) b!188898))

(assert (= (and b!188892 (not c!33960)) b!188897))

(assert (= (and b!188898 res!89277) b!188899))

(assert (= (or b!188898 b!188897) bm!19039))

(declare-fun b_lambda!7301 () Bool)

(assert (=> (not b_lambda!7301) (not b!188891)))

(declare-fun t!7276 () Bool)

(declare-fun tb!2853 () Bool)

(assert (=> (and b!188659 (= (defaultEntry!3851 thiss!1248) (defaultEntry!3851 thiss!1248)) t!7276) tb!2853))

(declare-fun result!4853 () Bool)

(assert (=> tb!2853 (= result!4853 tp_is_empty!4405)))

(assert (=> b!188891 t!7276))

(declare-fun b_and!11247 () Bool)

(assert (= b_and!11241 (and (=> t!7276 result!4853) b_and!11247)))

(assert (=> d!55535 m!214745))

(declare-fun m!214875 () Bool)

(assert (=> bm!19041 m!214875))

(declare-fun m!214877 () Bool)

(assert (=> b!188891 m!214877))

(declare-fun m!214879 () Bool)

(assert (=> b!188891 m!214879))

(declare-fun m!214881 () Bool)

(assert (=> b!188891 m!214881))

(assert (=> b!188891 m!214877))

(assert (=> b!188891 m!214827))

(declare-fun m!214883 () Bool)

(assert (=> b!188891 m!214883))

(assert (=> b!188891 m!214827))

(assert (=> b!188891 m!214879))

(assert (=> b!188906 m!214827))

(assert (=> b!188906 m!214827))

(declare-fun m!214885 () Bool)

(assert (=> b!188906 m!214885))

(declare-fun m!214887 () Bool)

(assert (=> bm!19039 m!214887))

(assert (=> b!188908 m!214827))

(assert (=> b!188908 m!214827))

(assert (=> b!188908 m!214835))

(declare-fun m!214889 () Bool)

(assert (=> b!188899 m!214889))

(declare-fun m!214891 () Bool)

(assert (=> bm!19038 m!214891))

(declare-fun m!214893 () Bool)

(assert (=> b!188901 m!214893))

(declare-fun m!214895 () Bool)

(assert (=> b!188901 m!214895))

(declare-fun m!214897 () Bool)

(assert (=> b!188901 m!214897))

(declare-fun m!214899 () Bool)

(assert (=> b!188901 m!214899))

(declare-fun m!214901 () Bool)

(assert (=> b!188901 m!214901))

(declare-fun m!214903 () Bool)

(assert (=> b!188901 m!214903))

(declare-fun m!214905 () Bool)

(assert (=> b!188901 m!214905))

(assert (=> b!188901 m!214905))

(declare-fun m!214907 () Bool)

(assert (=> b!188901 m!214907))

(declare-fun m!214909 () Bool)

(assert (=> b!188901 m!214909))

(assert (=> b!188901 m!214875))

(declare-fun m!214911 () Bool)

(assert (=> b!188901 m!214911))

(declare-fun m!214913 () Bool)

(assert (=> b!188901 m!214913))

(assert (=> b!188901 m!214827))

(declare-fun m!214915 () Bool)

(assert (=> b!188901 m!214915))

(declare-fun m!214917 () Bool)

(assert (=> b!188901 m!214917))

(assert (=> b!188901 m!214909))

(declare-fun m!214919 () Bool)

(assert (=> b!188901 m!214919))

(assert (=> b!188901 m!214897))

(declare-fun m!214921 () Bool)

(assert (=> b!188901 m!214921))

(assert (=> b!188901 m!214901))

(declare-fun m!214923 () Bool)

(assert (=> b!188905 m!214923))

(declare-fun m!214925 () Bool)

(assert (=> b!188896 m!214925))

(assert (=> b!188902 m!214827))

(assert (=> b!188902 m!214827))

(assert (=> b!188902 m!214835))

(declare-fun m!214927 () Bool)

(assert (=> bm!19036 m!214927))

(assert (=> b!188667 d!55535))

(declare-fun mapIsEmpty!7606 () Bool)

(declare-fun mapRes!7606 () Bool)

(assert (=> mapIsEmpty!7606 mapRes!7606))

(declare-fun condMapEmpty!7606 () Bool)

(declare-fun mapDefault!7606 () ValueCell!1859)

(assert (=> mapNonEmpty!7597 (= condMapEmpty!7606 (= mapRest!7597 ((as const (Array (_ BitVec 32) ValueCell!1859)) mapDefault!7606)))))

(declare-fun e!124321 () Bool)

(assert (=> mapNonEmpty!7597 (= tp!16725 (and e!124321 mapRes!7606))))

(declare-fun mapNonEmpty!7606 () Bool)

(declare-fun tp!16741 () Bool)

(declare-fun e!124320 () Bool)

(assert (=> mapNonEmpty!7606 (= mapRes!7606 (and tp!16741 e!124320))))

(declare-fun mapKey!7606 () (_ BitVec 32))

(declare-fun mapValue!7606 () ValueCell!1859)

(declare-fun mapRest!7606 () (Array (_ BitVec 32) ValueCell!1859))

(assert (=> mapNonEmpty!7606 (= mapRest!7597 (store mapRest!7606 mapKey!7606 mapValue!7606))))

(declare-fun b!188919 () Bool)

(assert (=> b!188919 (= e!124320 tp_is_empty!4405)))

(declare-fun b!188920 () Bool)

(assert (=> b!188920 (= e!124321 tp_is_empty!4405)))

(assert (= (and mapNonEmpty!7597 condMapEmpty!7606) mapIsEmpty!7606))

(assert (= (and mapNonEmpty!7597 (not condMapEmpty!7606)) mapNonEmpty!7606))

(assert (= (and mapNonEmpty!7606 ((_ is ValueCellFull!1859) mapValue!7606)) b!188919))

(assert (= (and mapNonEmpty!7597 ((_ is ValueCellFull!1859) mapDefault!7606)) b!188920))

(declare-fun m!214929 () Bool)

(assert (=> mapNonEmpty!7606 m!214929))

(declare-fun b_lambda!7303 () Bool)

(assert (= b_lambda!7301 (or (and b!188659 b_free!4633) b_lambda!7303)))

(check-sat (not b!188908) (not mapNonEmpty!7606) (not b!188804) (not b!188788) (not b!188845) (not bm!19018) (not b!188801) (not b!188906) (not b!188838) (not d!55523) (not d!55533) (not b!188901) (not d!55519) b_and!11247 (not b!188905) (not bm!19015) (not b_next!4633) (not b!188802) (not bm!19021) (not b!188899) (not b!188891) (not bm!19014) (not b!188836) (not bm!19036) (not bm!19039) (not b_lambda!7303) (not bm!19038) (not d!55529) (not b!188837) (not d!55513) tp_is_empty!4405 (not b!188902) (not b!188828) (not b!188810) (not b!188896) (not bm!19041) (not b!188847) (not d!55535) (not b!188790))
(check-sat b_and!11247 (not b_next!4633))
