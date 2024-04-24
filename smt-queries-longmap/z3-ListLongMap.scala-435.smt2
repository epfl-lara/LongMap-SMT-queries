; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8198 () Bool)

(assert start!8198)

(declare-fun b!51710 () Bool)

(declare-fun b_free!1609 () Bool)

(declare-fun b_next!1609 () Bool)

(assert (=> b!51710 (= b_free!1609 (not b_next!1609))))

(declare-fun tp!6924 () Bool)

(declare-fun b_and!2817 () Bool)

(assert (=> b!51710 (= tp!6924 b_and!2817)))

(declare-fun b!51700 () Bool)

(declare-fun b_free!1611 () Bool)

(declare-fun b_next!1611 () Bool)

(assert (=> b!51700 (= b_free!1611 (not b_next!1611))))

(declare-fun tp!6923 () Bool)

(declare-fun b_and!2819 () Bool)

(assert (=> b!51700 (= tp!6923 b_and!2819)))

(declare-fun b!51695 () Bool)

(declare-fun res!29532 () Bool)

(declare-fun e!33547 () Bool)

(assert (=> b!51695 (=> (not res!29532) (not e!33547))))

(declare-datatypes ((V!2609 0))(
  ( (V!2610 (val!1155 Int)) )
))
(declare-datatypes ((array!3349 0))(
  ( (array!3350 (arr!1598 (Array (_ BitVec 32) (_ BitVec 64))) (size!1826 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!767 0))(
  ( (ValueCellFull!767 (v!2199 V!2609)) (EmptyCell!767) )
))
(declare-datatypes ((array!3351 0))(
  ( (array!3352 (arr!1599 (Array (_ BitVec 32) ValueCell!767)) (size!1827 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!442 0))(
  ( (LongMapFixedSize!443 (defaultEntry!1935 Int) (mask!5749 (_ BitVec 32)) (extraKeys!1826 (_ BitVec 32)) (zeroValue!1853 V!2609) (minValue!1853 V!2609) (_size!270 (_ BitVec 32)) (_keys!3553 array!3349) (_values!1918 array!3351) (_vacant!270 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!264 0))(
  ( (Cell!265 (v!2200 LongMapFixedSize!442)) )
))
(declare-datatypes ((LongMap!264 0))(
  ( (LongMap!265 (underlying!143 Cell!264)) )
))
(declare-fun thiss!992 () LongMap!264)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3349 (_ BitVec 32)) Bool)

(assert (=> b!51695 (= res!29532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51696 () Bool)

(declare-datatypes ((List!1320 0))(
  ( (Nil!1317) (Cons!1316 (h!1896 (_ BitVec 64)) (t!4354 List!1320)) )
))
(declare-fun arrayNoDuplicates!0 (array!3349 (_ BitVec 32) List!1320) Bool)

(assert (=> b!51696 (= e!33547 (not (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000 Nil!1317)))))

(declare-fun b!51697 () Bool)

(declare-fun e!33549 () Bool)

(declare-fun tp_is_empty!2221 () Bool)

(assert (=> b!51697 (= e!33549 tp_is_empty!2221)))

(declare-fun b!51698 () Bool)

(declare-fun e!33550 () Bool)

(assert (=> b!51698 (= e!33550 tp_is_empty!2221)))

(declare-fun b!51699 () Bool)

(declare-fun res!29536 () Bool)

(assert (=> b!51699 (=> (not res!29536) (not e!33547))))

(declare-fun newMap!16 () LongMapFixedSize!442)

(assert (=> b!51699 (= res!29536 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5749 newMap!16)) (_size!270 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun mapNonEmpty!2327 () Bool)

(declare-fun mapRes!2327 () Bool)

(declare-fun tp!6922 () Bool)

(declare-fun e!33545 () Bool)

(assert (=> mapNonEmpty!2327 (= mapRes!2327 (and tp!6922 e!33545))))

(declare-fun mapRest!2328 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapKey!2328 () (_ BitVec 32))

(declare-fun mapValue!2327 () ValueCell!767)

(assert (=> mapNonEmpty!2327 (= (arr!1599 (_values!1918 (v!2200 (underlying!143 thiss!992)))) (store mapRest!2328 mapKey!2328 mapValue!2327))))

(declare-fun mapNonEmpty!2328 () Bool)

(declare-fun mapRes!2328 () Bool)

(declare-fun tp!6921 () Bool)

(assert (=> mapNonEmpty!2328 (= mapRes!2328 (and tp!6921 e!33549))))

(declare-fun mapKey!2327 () (_ BitVec 32))

(declare-fun mapValue!2328 () ValueCell!767)

(declare-fun mapRest!2327 () (Array (_ BitVec 32) ValueCell!767))

(assert (=> mapNonEmpty!2328 (= (arr!1599 (_values!1918 newMap!16)) (store mapRest!2327 mapKey!2327 mapValue!2328))))

(declare-fun res!29534 () Bool)

(assert (=> start!8198 (=> (not res!29534) (not e!33547))))

(declare-fun valid!166 (LongMap!264) Bool)

(assert (=> start!8198 (= res!29534 (valid!166 thiss!992))))

(assert (=> start!8198 e!33547))

(declare-fun e!33542 () Bool)

(assert (=> start!8198 e!33542))

(assert (=> start!8198 true))

(declare-fun e!33551 () Bool)

(assert (=> start!8198 e!33551))

(declare-fun e!33543 () Bool)

(declare-fun array_inv!963 (array!3349) Bool)

(declare-fun array_inv!964 (array!3351) Bool)

(assert (=> b!51700 (= e!33551 (and tp!6923 tp_is_empty!2221 (array_inv!963 (_keys!3553 newMap!16)) (array_inv!964 (_values!1918 newMap!16)) e!33543))))

(declare-fun b!51701 () Bool)

(assert (=> b!51701 (= e!33545 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2327 () Bool)

(assert (=> mapIsEmpty!2327 mapRes!2328))

(declare-fun b!51702 () Bool)

(declare-fun res!29535 () Bool)

(assert (=> b!51702 (=> (not res!29535) (not e!33547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51702 (= res!29535 (validMask!0 (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51703 () Bool)

(declare-fun res!29533 () Bool)

(assert (=> b!51703 (=> (not res!29533) (not e!33547))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51703 (= res!29533 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992)))))))))

(declare-fun b!51704 () Bool)

(declare-fun e!33546 () Bool)

(declare-fun e!33548 () Bool)

(assert (=> b!51704 (= e!33546 e!33548)))

(declare-fun b!51705 () Bool)

(declare-fun res!29538 () Bool)

(assert (=> b!51705 (=> (not res!29538) (not e!33547))))

(assert (=> b!51705 (= res!29538 (and (= (size!1827 (_values!1918 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5749 (v!2200 (underlying!143 thiss!992))))) (= (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (size!1827 (_values!1918 (v!2200 (underlying!143 thiss!992))))) (bvsge (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1826 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1826 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51706 () Bool)

(declare-fun e!33552 () Bool)

(declare-fun e!33541 () Bool)

(assert (=> b!51706 (= e!33552 (and e!33541 mapRes!2327))))

(declare-fun condMapEmpty!2328 () Bool)

(declare-fun mapDefault!2327 () ValueCell!767)

(assert (=> b!51706 (= condMapEmpty!2328 (= (arr!1599 (_values!1918 (v!2200 (underlying!143 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2327)))))

(declare-fun b!51707 () Bool)

(assert (=> b!51707 (= e!33541 tp_is_empty!2221)))

(declare-fun b!51708 () Bool)

(assert (=> b!51708 (= e!33542 e!33546)))

(declare-fun b!51709 () Bool)

(declare-fun res!29537 () Bool)

(assert (=> b!51709 (=> (not res!29537) (not e!33547))))

(declare-fun valid!167 (LongMapFixedSize!442) Bool)

(assert (=> b!51709 (= res!29537 (valid!167 newMap!16))))

(assert (=> b!51710 (= e!33548 (and tp!6924 tp_is_empty!2221 (array_inv!963 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (array_inv!964 (_values!1918 (v!2200 (underlying!143 thiss!992)))) e!33552))))

(declare-fun b!51711 () Bool)

(assert (=> b!51711 (= e!33543 (and e!33550 mapRes!2328))))

(declare-fun condMapEmpty!2327 () Bool)

(declare-fun mapDefault!2328 () ValueCell!767)

(assert (=> b!51711 (= condMapEmpty!2327 (= (arr!1599 (_values!1918 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2328)))))

(declare-fun mapIsEmpty!2328 () Bool)

(assert (=> mapIsEmpty!2328 mapRes!2327))

(assert (= (and start!8198 res!29534) b!51703))

(assert (= (and b!51703 res!29533) b!51709))

(assert (= (and b!51709 res!29537) b!51699))

(assert (= (and b!51699 res!29536) b!51702))

(assert (= (and b!51702 res!29535) b!51705))

(assert (= (and b!51705 res!29538) b!51695))

(assert (= (and b!51695 res!29532) b!51696))

(assert (= (and b!51706 condMapEmpty!2328) mapIsEmpty!2328))

(assert (= (and b!51706 (not condMapEmpty!2328)) mapNonEmpty!2327))

(get-info :version)

(assert (= (and mapNonEmpty!2327 ((_ is ValueCellFull!767) mapValue!2327)) b!51701))

(assert (= (and b!51706 ((_ is ValueCellFull!767) mapDefault!2327)) b!51707))

(assert (= b!51710 b!51706))

(assert (= b!51704 b!51710))

(assert (= b!51708 b!51704))

(assert (= start!8198 b!51708))

(assert (= (and b!51711 condMapEmpty!2327) mapIsEmpty!2327))

(assert (= (and b!51711 (not condMapEmpty!2327)) mapNonEmpty!2328))

(assert (= (and mapNonEmpty!2328 ((_ is ValueCellFull!767) mapValue!2328)) b!51697))

(assert (= (and b!51711 ((_ is ValueCellFull!767) mapDefault!2328)) b!51698))

(assert (= b!51700 b!51711))

(assert (= start!8198 b!51700))

(declare-fun m!44361 () Bool)

(assert (=> start!8198 m!44361))

(declare-fun m!44363 () Bool)

(assert (=> b!51700 m!44363))

(declare-fun m!44365 () Bool)

(assert (=> b!51700 m!44365))

(declare-fun m!44367 () Bool)

(assert (=> b!51709 m!44367))

(declare-fun m!44369 () Bool)

(assert (=> b!51695 m!44369))

(declare-fun m!44371 () Bool)

(assert (=> b!51702 m!44371))

(declare-fun m!44373 () Bool)

(assert (=> b!51710 m!44373))

(declare-fun m!44375 () Bool)

(assert (=> b!51710 m!44375))

(declare-fun m!44377 () Bool)

(assert (=> mapNonEmpty!2327 m!44377))

(declare-fun m!44379 () Bool)

(assert (=> mapNonEmpty!2328 m!44379))

(declare-fun m!44381 () Bool)

(assert (=> b!51696 m!44381))

(check-sat tp_is_empty!2221 (not start!8198) (not b_next!1611) (not b!51700) (not b!51710) (not b_next!1609) b_and!2817 (not mapNonEmpty!2327) (not b!51695) (not b!51696) (not b!51702) (not mapNonEmpty!2328) b_and!2819 (not b!51709))
(check-sat b_and!2817 b_and!2819 (not b_next!1609) (not b_next!1611))
(get-model)

(declare-fun d!10383 () Bool)

(declare-fun res!29587 () Bool)

(declare-fun e!33634 () Bool)

(assert (=> d!10383 (=> (not res!29587) (not e!33634))))

(declare-fun simpleValid!39 (LongMapFixedSize!442) Bool)

(assert (=> d!10383 (= res!29587 (simpleValid!39 newMap!16))))

(assert (=> d!10383 (= (valid!167 newMap!16) e!33634)))

(declare-fun b!51820 () Bool)

(declare-fun res!29588 () Bool)

(assert (=> b!51820 (=> (not res!29588) (not e!33634))))

(declare-fun arrayCountValidKeys!0 (array!3349 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51820 (= res!29588 (= (arrayCountValidKeys!0 (_keys!3553 newMap!16) #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))) (_size!270 newMap!16)))))

(declare-fun b!51821 () Bool)

(declare-fun res!29589 () Bool)

(assert (=> b!51821 (=> (not res!29589) (not e!33634))))

(assert (=> b!51821 (= res!29589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3553 newMap!16) (mask!5749 newMap!16)))))

(declare-fun b!51822 () Bool)

(assert (=> b!51822 (= e!33634 (arrayNoDuplicates!0 (_keys!3553 newMap!16) #b00000000000000000000000000000000 Nil!1317))))

(assert (= (and d!10383 res!29587) b!51820))

(assert (= (and b!51820 res!29588) b!51821))

(assert (= (and b!51821 res!29589) b!51822))

(declare-fun m!44427 () Bool)

(assert (=> d!10383 m!44427))

(declare-fun m!44429 () Bool)

(assert (=> b!51820 m!44429))

(declare-fun m!44431 () Bool)

(assert (=> b!51821 m!44431))

(declare-fun m!44433 () Bool)

(assert (=> b!51822 m!44433))

(assert (=> b!51709 d!10383))

(declare-fun d!10385 () Bool)

(declare-fun res!29598 () Bool)

(declare-fun e!33644 () Bool)

(assert (=> d!10385 (=> res!29598 e!33644)))

(assert (=> d!10385 (= res!29598 (bvsge #b00000000000000000000000000000000 (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))))

(assert (=> d!10385 (= (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000 Nil!1317) e!33644)))

(declare-fun b!51833 () Bool)

(declare-fun e!33646 () Bool)

(declare-fun contains!615 (List!1320 (_ BitVec 64)) Bool)

(assert (=> b!51833 (= e!33646 (contains!615 Nil!1317 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51834 () Bool)

(declare-fun e!33643 () Bool)

(declare-fun call!3946 () Bool)

(assert (=> b!51834 (= e!33643 call!3946)))

(declare-fun b!51835 () Bool)

(declare-fun e!33645 () Bool)

(assert (=> b!51835 (= e!33645 e!33643)))

(declare-fun c!6914 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51835 (= c!6914 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51836 () Bool)

(assert (=> b!51836 (= e!33644 e!33645)))

(declare-fun res!29597 () Bool)

(assert (=> b!51836 (=> (not res!29597) (not e!33645))))

(assert (=> b!51836 (= res!29597 (not e!33646))))

(declare-fun res!29596 () Bool)

(assert (=> b!51836 (=> (not res!29596) (not e!33646))))

(assert (=> b!51836 (= res!29596 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3943 () Bool)

(assert (=> bm!3943 (= call!3946 (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6914 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) Nil!1317) Nil!1317)))))

(declare-fun b!51837 () Bool)

(assert (=> b!51837 (= e!33643 call!3946)))

(assert (= (and d!10385 (not res!29598)) b!51836))

(assert (= (and b!51836 res!29596) b!51833))

(assert (= (and b!51836 res!29597) b!51835))

(assert (= (and b!51835 c!6914) b!51834))

(assert (= (and b!51835 (not c!6914)) b!51837))

(assert (= (or b!51834 b!51837) bm!3943))

(declare-fun m!44435 () Bool)

(assert (=> b!51833 m!44435))

(assert (=> b!51833 m!44435))

(declare-fun m!44437 () Bool)

(assert (=> b!51833 m!44437))

(assert (=> b!51835 m!44435))

(assert (=> b!51835 m!44435))

(declare-fun m!44439 () Bool)

(assert (=> b!51835 m!44439))

(assert (=> b!51836 m!44435))

(assert (=> b!51836 m!44435))

(assert (=> b!51836 m!44439))

(assert (=> bm!3943 m!44435))

(declare-fun m!44441 () Bool)

(assert (=> bm!3943 m!44441))

(assert (=> b!51696 d!10385))

(declare-fun d!10387 () Bool)

(assert (=> d!10387 (= (array_inv!963 (_keys!3553 newMap!16)) (bvsge (size!1826 (_keys!3553 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51700 d!10387))

(declare-fun d!10389 () Bool)

(assert (=> d!10389 (= (array_inv!964 (_values!1918 newMap!16)) (bvsge (size!1827 (_values!1918 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51700 d!10389))

(declare-fun d!10391 () Bool)

(assert (=> d!10391 (= (valid!166 thiss!992) (valid!167 (v!2200 (underlying!143 thiss!992))))))

(declare-fun bs!2386 () Bool)

(assert (= bs!2386 d!10391))

(declare-fun m!44443 () Bool)

(assert (=> bs!2386 m!44443))

(assert (=> start!8198 d!10391))

(declare-fun d!10393 () Bool)

(assert (=> d!10393 (= (array_inv!963 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvsge (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51710 d!10393))

(declare-fun d!10395 () Bool)

(assert (=> d!10395 (= (array_inv!964 (_values!1918 (v!2200 (underlying!143 thiss!992)))) (bvsge (size!1827 (_values!1918 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51710 d!10395))

(declare-fun bm!3946 () Bool)

(declare-fun call!3949 () Bool)

(assert (=> bm!3946 (= call!3949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51846 () Bool)

(declare-fun e!33654 () Bool)

(assert (=> b!51846 (= e!33654 call!3949)))

(declare-fun b!51847 () Bool)

(declare-fun e!33655 () Bool)

(assert (=> b!51847 (= e!33655 e!33654)))

(declare-fun c!6917 () Bool)

(assert (=> b!51847 (= c!6917 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51849 () Bool)

(declare-fun e!33653 () Bool)

(assert (=> b!51849 (= e!33654 e!33653)))

(declare-fun lt!21181 () (_ BitVec 64))

(assert (=> b!51849 (= lt!21181 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1440 0))(
  ( (Unit!1441) )
))
(declare-fun lt!21180 () Unit!1440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3349 (_ BitVec 64) (_ BitVec 32)) Unit!1440)

(assert (=> b!51849 (= lt!21180 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51849 (arrayContainsKey!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000)))

(declare-fun lt!21182 () Unit!1440)

(assert (=> b!51849 (= lt!21182 lt!21180)))

(declare-fun res!29604 () Bool)

(declare-datatypes ((SeekEntryResult!218 0))(
  ( (MissingZero!218 (index!2994 (_ BitVec 32))) (Found!218 (index!2995 (_ BitVec 32))) (Intermediate!218 (undefined!1030 Bool) (index!2996 (_ BitVec 32)) (x!9418 (_ BitVec 32))) (Undefined!218) (MissingVacant!218 (index!2997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3349 (_ BitVec 32)) SeekEntryResult!218)

(assert (=> b!51849 (= res!29604 (= (seekEntryOrOpen!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))) (Found!218 #b00000000000000000000000000000000)))))

(assert (=> b!51849 (=> (not res!29604) (not e!33653))))

(declare-fun d!10397 () Bool)

(declare-fun res!29603 () Bool)

(assert (=> d!10397 (=> res!29603 e!33655)))

(assert (=> d!10397 (= res!29603 (bvsge #b00000000000000000000000000000000 (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))))

(assert (=> d!10397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))) e!33655)))

(declare-fun b!51848 () Bool)

(assert (=> b!51848 (= e!33653 call!3949)))

(assert (= (and d!10397 (not res!29603)) b!51847))

(assert (= (and b!51847 c!6917) b!51849))

(assert (= (and b!51847 (not c!6917)) b!51846))

(assert (= (and b!51849 res!29604) b!51848))

(assert (= (or b!51848 b!51846) bm!3946))

(declare-fun m!44445 () Bool)

(assert (=> bm!3946 m!44445))

(assert (=> b!51847 m!44435))

(assert (=> b!51847 m!44435))

(assert (=> b!51847 m!44439))

(assert (=> b!51849 m!44435))

(declare-fun m!44447 () Bool)

(assert (=> b!51849 m!44447))

(declare-fun m!44449 () Bool)

(assert (=> b!51849 m!44449))

(assert (=> b!51849 m!44435))

(declare-fun m!44451 () Bool)

(assert (=> b!51849 m!44451))

(assert (=> b!51695 d!10397))

(declare-fun d!10399 () Bool)

(assert (=> d!10399 (= (validMask!0 (mask!5749 (v!2200 (underlying!143 thiss!992)))) (and (or (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000001111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000011111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000001111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000011111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000001111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000011111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000001111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000011111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000000111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000001111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000011111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000000111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000001111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000011111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000000111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000001111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000011111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000000111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000001111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000011111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00000111111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00001111111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00011111111111111111111111111111) (= (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5749 (v!2200 (underlying!143 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51702 d!10399))

(declare-fun b!51856 () Bool)

(declare-fun e!33660 () Bool)

(assert (=> b!51856 (= e!33660 tp_is_empty!2221)))

(declare-fun mapNonEmpty!2343 () Bool)

(declare-fun mapRes!2343 () Bool)

(declare-fun tp!6951 () Bool)

(assert (=> mapNonEmpty!2343 (= mapRes!2343 (and tp!6951 e!33660))))

(declare-fun mapKey!2343 () (_ BitVec 32))

(declare-fun mapValue!2343 () ValueCell!767)

(declare-fun mapRest!2343 () (Array (_ BitVec 32) ValueCell!767))

(assert (=> mapNonEmpty!2343 (= mapRest!2327 (store mapRest!2343 mapKey!2343 mapValue!2343))))

(declare-fun b!51857 () Bool)

(declare-fun e!33661 () Bool)

(assert (=> b!51857 (= e!33661 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2343 () Bool)

(assert (=> mapIsEmpty!2343 mapRes!2343))

(declare-fun condMapEmpty!2343 () Bool)

(declare-fun mapDefault!2343 () ValueCell!767)

(assert (=> mapNonEmpty!2328 (= condMapEmpty!2343 (= mapRest!2327 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2343)))))

(assert (=> mapNonEmpty!2328 (= tp!6921 (and e!33661 mapRes!2343))))

(assert (= (and mapNonEmpty!2328 condMapEmpty!2343) mapIsEmpty!2343))

(assert (= (and mapNonEmpty!2328 (not condMapEmpty!2343)) mapNonEmpty!2343))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!767) mapValue!2343)) b!51856))

(assert (= (and mapNonEmpty!2328 ((_ is ValueCellFull!767) mapDefault!2343)) b!51857))

(declare-fun m!44453 () Bool)

(assert (=> mapNonEmpty!2343 m!44453))

(declare-fun b!51858 () Bool)

(declare-fun e!33662 () Bool)

(assert (=> b!51858 (= e!33662 tp_is_empty!2221)))

(declare-fun mapNonEmpty!2344 () Bool)

(declare-fun mapRes!2344 () Bool)

(declare-fun tp!6952 () Bool)

(assert (=> mapNonEmpty!2344 (= mapRes!2344 (and tp!6952 e!33662))))

(declare-fun mapRest!2344 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapKey!2344 () (_ BitVec 32))

(declare-fun mapValue!2344 () ValueCell!767)

(assert (=> mapNonEmpty!2344 (= mapRest!2328 (store mapRest!2344 mapKey!2344 mapValue!2344))))

(declare-fun b!51859 () Bool)

(declare-fun e!33663 () Bool)

(assert (=> b!51859 (= e!33663 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2344 () Bool)

(assert (=> mapIsEmpty!2344 mapRes!2344))

(declare-fun condMapEmpty!2344 () Bool)

(declare-fun mapDefault!2344 () ValueCell!767)

(assert (=> mapNonEmpty!2327 (= condMapEmpty!2344 (= mapRest!2328 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2344)))))

(assert (=> mapNonEmpty!2327 (= tp!6922 (and e!33663 mapRes!2344))))

(assert (= (and mapNonEmpty!2327 condMapEmpty!2344) mapIsEmpty!2344))

(assert (= (and mapNonEmpty!2327 (not condMapEmpty!2344)) mapNonEmpty!2344))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!767) mapValue!2344)) b!51858))

(assert (= (and mapNonEmpty!2327 ((_ is ValueCellFull!767) mapDefault!2344)) b!51859))

(declare-fun m!44455 () Bool)

(assert (=> mapNonEmpty!2344 m!44455))

(check-sat tp_is_empty!2221 (not d!10391) (not b_next!1611) (not b!51835) (not b!51822) (not b_next!1609) b_and!2817 (not mapNonEmpty!2344) (not b!51847) (not b!51849) (not mapNonEmpty!2343) (not bm!3943) b_and!2819 (not b!51821) (not b!51820) (not bm!3946) (not d!10383) (not b!51833) (not b!51836))
(check-sat b_and!2817 b_and!2819 (not b_next!1609) (not b_next!1611))
(get-model)

(declare-fun b!51868 () Bool)

(declare-fun e!33668 () (_ BitVec 32))

(assert (=> b!51868 (= e!33668 #b00000000000000000000000000000000)))

(declare-fun b!51869 () Bool)

(declare-fun e!33669 () (_ BitVec 32))

(declare-fun call!3952 () (_ BitVec 32))

(assert (=> b!51869 (= e!33669 call!3952)))

(declare-fun b!51870 () Bool)

(assert (=> b!51870 (= e!33668 e!33669)))

(declare-fun c!6922 () Bool)

(assert (=> b!51870 (= c!6922 (validKeyInArray!0 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51871 () Bool)

(assert (=> b!51871 (= e!33669 (bvadd #b00000000000000000000000000000001 call!3952))))

(declare-fun d!10401 () Bool)

(declare-fun lt!21185 () (_ BitVec 32))

(assert (=> d!10401 (and (bvsge lt!21185 #b00000000000000000000000000000000) (bvsle lt!21185 (bvsub (size!1826 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10401 (= lt!21185 e!33668)))

(declare-fun c!6923 () Bool)

(assert (=> d!10401 (= c!6923 (bvsge #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))))))

(assert (=> d!10401 (and (bvsle #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1826 (_keys!3553 newMap!16)) (size!1826 (_keys!3553 newMap!16))))))

(assert (=> d!10401 (= (arrayCountValidKeys!0 (_keys!3553 newMap!16) #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))) lt!21185)))

(declare-fun bm!3949 () Bool)

(assert (=> bm!3949 (= call!3952 (arrayCountValidKeys!0 (_keys!3553 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1826 (_keys!3553 newMap!16))))))

(assert (= (and d!10401 c!6923) b!51868))

(assert (= (and d!10401 (not c!6923)) b!51870))

(assert (= (and b!51870 c!6922) b!51871))

(assert (= (and b!51870 (not c!6922)) b!51869))

(assert (= (or b!51871 b!51869) bm!3949))

(declare-fun m!44457 () Bool)

(assert (=> b!51870 m!44457))

(assert (=> b!51870 m!44457))

(declare-fun m!44459 () Bool)

(assert (=> b!51870 m!44459))

(declare-fun m!44461 () Bool)

(assert (=> bm!3949 m!44461))

(assert (=> b!51820 d!10401))

(declare-fun b!51883 () Bool)

(declare-fun e!33672 () Bool)

(assert (=> b!51883 (= e!33672 (and (bvsge (extraKeys!1826 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1826 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!270 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51882 () Bool)

(declare-fun res!29615 () Bool)

(assert (=> b!51882 (=> (not res!29615) (not e!33672))))

(declare-fun size!1832 (LongMapFixedSize!442) (_ BitVec 32))

(assert (=> b!51882 (= res!29615 (= (size!1832 newMap!16) (bvadd (_size!270 newMap!16) (bvsdiv (bvadd (extraKeys!1826 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51880 () Bool)

(declare-fun res!29616 () Bool)

(assert (=> b!51880 (=> (not res!29616) (not e!33672))))

(assert (=> b!51880 (= res!29616 (and (= (size!1827 (_values!1918 newMap!16)) (bvadd (mask!5749 newMap!16) #b00000000000000000000000000000001)) (= (size!1826 (_keys!3553 newMap!16)) (size!1827 (_values!1918 newMap!16))) (bvsge (_size!270 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!270 newMap!16) (bvadd (mask!5749 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10403 () Bool)

(declare-fun res!29614 () Bool)

(assert (=> d!10403 (=> (not res!29614) (not e!33672))))

(assert (=> d!10403 (= res!29614 (validMask!0 (mask!5749 newMap!16)))))

(assert (=> d!10403 (= (simpleValid!39 newMap!16) e!33672)))

(declare-fun b!51881 () Bool)

(declare-fun res!29613 () Bool)

(assert (=> b!51881 (=> (not res!29613) (not e!33672))))

(assert (=> b!51881 (= res!29613 (bvsge (size!1832 newMap!16) (_size!270 newMap!16)))))

(assert (= (and d!10403 res!29614) b!51880))

(assert (= (and b!51880 res!29616) b!51881))

(assert (= (and b!51881 res!29613) b!51882))

(assert (= (and b!51882 res!29615) b!51883))

(declare-fun m!44463 () Bool)

(assert (=> b!51882 m!44463))

(declare-fun m!44465 () Bool)

(assert (=> d!10403 m!44465))

(assert (=> b!51881 m!44463))

(assert (=> d!10383 d!10403))

(declare-fun bm!3950 () Bool)

(declare-fun call!3953 () Bool)

(assert (=> bm!3950 (= call!3953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3553 newMap!16) (mask!5749 newMap!16)))))

(declare-fun b!51884 () Bool)

(declare-fun e!33674 () Bool)

(assert (=> b!51884 (= e!33674 call!3953)))

(declare-fun b!51885 () Bool)

(declare-fun e!33675 () Bool)

(assert (=> b!51885 (= e!33675 e!33674)))

(declare-fun c!6924 () Bool)

(assert (=> b!51885 (= c!6924 (validKeyInArray!0 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51887 () Bool)

(declare-fun e!33673 () Bool)

(assert (=> b!51887 (= e!33674 e!33673)))

(declare-fun lt!21187 () (_ BitVec 64))

(assert (=> b!51887 (= lt!21187 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21186 () Unit!1440)

(assert (=> b!51887 (= lt!21186 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3553 newMap!16) lt!21187 #b00000000000000000000000000000000))))

(assert (=> b!51887 (arrayContainsKey!0 (_keys!3553 newMap!16) lt!21187 #b00000000000000000000000000000000)))

(declare-fun lt!21188 () Unit!1440)

(assert (=> b!51887 (= lt!21188 lt!21186)))

(declare-fun res!29618 () Bool)

(assert (=> b!51887 (= res!29618 (= (seekEntryOrOpen!0 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000) (_keys!3553 newMap!16) (mask!5749 newMap!16)) (Found!218 #b00000000000000000000000000000000)))))

(assert (=> b!51887 (=> (not res!29618) (not e!33673))))

(declare-fun d!10405 () Bool)

(declare-fun res!29617 () Bool)

(assert (=> d!10405 (=> res!29617 e!33675)))

(assert (=> d!10405 (= res!29617 (bvsge #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))))))

(assert (=> d!10405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3553 newMap!16) (mask!5749 newMap!16)) e!33675)))

(declare-fun b!51886 () Bool)

(assert (=> b!51886 (= e!33673 call!3953)))

(assert (= (and d!10405 (not res!29617)) b!51885))

(assert (= (and b!51885 c!6924) b!51887))

(assert (= (and b!51885 (not c!6924)) b!51884))

(assert (= (and b!51887 res!29618) b!51886))

(assert (= (or b!51886 b!51884) bm!3950))

(declare-fun m!44467 () Bool)

(assert (=> bm!3950 m!44467))

(assert (=> b!51885 m!44457))

(assert (=> b!51885 m!44457))

(assert (=> b!51885 m!44459))

(assert (=> b!51887 m!44457))

(declare-fun m!44469 () Bool)

(assert (=> b!51887 m!44469))

(declare-fun m!44471 () Bool)

(assert (=> b!51887 m!44471))

(assert (=> b!51887 m!44457))

(declare-fun m!44473 () Bool)

(assert (=> b!51887 m!44473))

(assert (=> b!51821 d!10405))

(declare-fun bm!3951 () Bool)

(declare-fun call!3954 () Bool)

(assert (=> bm!3951 (= call!3954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51888 () Bool)

(declare-fun e!33677 () Bool)

(assert (=> b!51888 (= e!33677 call!3954)))

(declare-fun b!51889 () Bool)

(declare-fun e!33678 () Bool)

(assert (=> b!51889 (= e!33678 e!33677)))

(declare-fun c!6925 () Bool)

(assert (=> b!51889 (= c!6925 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51891 () Bool)

(declare-fun e!33676 () Bool)

(assert (=> b!51891 (= e!33677 e!33676)))

(declare-fun lt!21190 () (_ BitVec 64))

(assert (=> b!51891 (= lt!21190 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21189 () Unit!1440)

(assert (=> b!51891 (= lt!21189 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51891 (arrayContainsKey!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21190 #b00000000000000000000000000000000)))

(declare-fun lt!21191 () Unit!1440)

(assert (=> b!51891 (= lt!21191 lt!21189)))

(declare-fun res!29620 () Bool)

(assert (=> b!51891 (= res!29620 (= (seekEntryOrOpen!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))) (Found!218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51891 (=> (not res!29620) (not e!33676))))

(declare-fun d!10407 () Bool)

(declare-fun res!29619 () Bool)

(assert (=> d!10407 (=> res!29619 e!33678)))

(assert (=> d!10407 (= res!29619 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))))

(assert (=> d!10407 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))) e!33678)))

(declare-fun b!51890 () Bool)

(assert (=> b!51890 (= e!33676 call!3954)))

(assert (= (and d!10407 (not res!29619)) b!51889))

(assert (= (and b!51889 c!6925) b!51891))

(assert (= (and b!51889 (not c!6925)) b!51888))

(assert (= (and b!51891 res!29620) b!51890))

(assert (= (or b!51890 b!51888) bm!3951))

(declare-fun m!44475 () Bool)

(assert (=> bm!3951 m!44475))

(declare-fun m!44477 () Bool)

(assert (=> b!51889 m!44477))

(assert (=> b!51889 m!44477))

(declare-fun m!44479 () Bool)

(assert (=> b!51889 m!44479))

(assert (=> b!51891 m!44477))

(declare-fun m!44481 () Bool)

(assert (=> b!51891 m!44481))

(declare-fun m!44483 () Bool)

(assert (=> b!51891 m!44483))

(assert (=> b!51891 m!44477))

(declare-fun m!44485 () Bool)

(assert (=> b!51891 m!44485))

(assert (=> bm!3946 d!10407))

(declare-fun d!10409 () Bool)

(declare-fun res!29621 () Bool)

(declare-fun e!33679 () Bool)

(assert (=> d!10409 (=> (not res!29621) (not e!33679))))

(assert (=> d!10409 (= res!29621 (simpleValid!39 (v!2200 (underlying!143 thiss!992))))))

(assert (=> d!10409 (= (valid!167 (v!2200 (underlying!143 thiss!992))) e!33679)))

(declare-fun b!51892 () Bool)

(declare-fun res!29622 () Bool)

(assert (=> b!51892 (=> (not res!29622) (not e!33679))))

(assert (=> b!51892 (= res!29622 (= (arrayCountValidKeys!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000 (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))) (_size!270 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51893 () Bool)

(declare-fun res!29623 () Bool)

(assert (=> b!51893 (=> (not res!29623) (not e!33679))))

(assert (=> b!51893 (= res!29623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51894 () Bool)

(assert (=> b!51894 (= e!33679 (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) #b00000000000000000000000000000000 Nil!1317))))

(assert (= (and d!10409 res!29621) b!51892))

(assert (= (and b!51892 res!29622) b!51893))

(assert (= (and b!51893 res!29623) b!51894))

(declare-fun m!44487 () Bool)

(assert (=> d!10409 m!44487))

(declare-fun m!44489 () Bool)

(assert (=> b!51892 m!44489))

(assert (=> b!51893 m!44369))

(assert (=> b!51894 m!44381))

(assert (=> d!10391 d!10409))

(declare-fun d!10411 () Bool)

(declare-fun res!29626 () Bool)

(declare-fun e!33681 () Bool)

(assert (=> d!10411 (=> res!29626 e!33681)))

(assert (=> d!10411 (= res!29626 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))))

(assert (=> d!10411 (= (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6914 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) Nil!1317) Nil!1317)) e!33681)))

(declare-fun b!51895 () Bool)

(declare-fun e!33683 () Bool)

(assert (=> b!51895 (= e!33683 (contains!615 (ite c!6914 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) Nil!1317) Nil!1317) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51896 () Bool)

(declare-fun e!33680 () Bool)

(declare-fun call!3955 () Bool)

(assert (=> b!51896 (= e!33680 call!3955)))

(declare-fun b!51897 () Bool)

(declare-fun e!33682 () Bool)

(assert (=> b!51897 (= e!33682 e!33680)))

(declare-fun c!6926 () Bool)

(assert (=> b!51897 (= c!6926 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51898 () Bool)

(assert (=> b!51898 (= e!33681 e!33682)))

(declare-fun res!29625 () Bool)

(assert (=> b!51898 (=> (not res!29625) (not e!33682))))

(assert (=> b!51898 (= res!29625 (not e!33683))))

(declare-fun res!29624 () Bool)

(assert (=> b!51898 (=> (not res!29624) (not e!33683))))

(assert (=> b!51898 (= res!29624 (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3952 () Bool)

(assert (=> bm!3952 (= call!3955 (arrayNoDuplicates!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6926 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6914 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) Nil!1317) Nil!1317)) (ite c!6914 (Cons!1316 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) Nil!1317) Nil!1317))))))

(declare-fun b!51899 () Bool)

(assert (=> b!51899 (= e!33680 call!3955)))

(assert (= (and d!10411 (not res!29626)) b!51898))

(assert (= (and b!51898 res!29624) b!51895))

(assert (= (and b!51898 res!29625) b!51897))

(assert (= (and b!51897 c!6926) b!51896))

(assert (= (and b!51897 (not c!6926)) b!51899))

(assert (= (or b!51896 b!51899) bm!3952))

(assert (=> b!51895 m!44477))

(assert (=> b!51895 m!44477))

(declare-fun m!44491 () Bool)

(assert (=> b!51895 m!44491))

(assert (=> b!51897 m!44477))

(assert (=> b!51897 m!44477))

(assert (=> b!51897 m!44479))

(assert (=> b!51898 m!44477))

(assert (=> b!51898 m!44477))

(assert (=> b!51898 m!44479))

(assert (=> bm!3952 m!44477))

(declare-fun m!44493 () Bool)

(assert (=> bm!3952 m!44493))

(assert (=> bm!3943 d!10411))

(declare-fun d!10413 () Bool)

(assert (=> d!10413 (arrayContainsKey!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000)))

(declare-fun lt!21194 () Unit!1440)

(declare-fun choose!13 (array!3349 (_ BitVec 64) (_ BitVec 32)) Unit!1440)

(assert (=> d!10413 (= lt!21194 (choose!13 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000))))

(assert (=> d!10413 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10413 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000) lt!21194)))

(declare-fun bs!2387 () Bool)

(assert (= bs!2387 d!10413))

(assert (=> bs!2387 m!44449))

(declare-fun m!44495 () Bool)

(assert (=> bs!2387 m!44495))

(assert (=> b!51849 d!10413))

(declare-fun d!10415 () Bool)

(declare-fun res!29631 () Bool)

(declare-fun e!33688 () Bool)

(assert (=> d!10415 (=> res!29631 e!33688)))

(assert (=> d!10415 (= res!29631 (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) lt!21181))))

(assert (=> d!10415 (= (arrayContainsKey!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 #b00000000000000000000000000000000) e!33688)))

(declare-fun b!51904 () Bool)

(declare-fun e!33689 () Bool)

(assert (=> b!51904 (= e!33688 e!33689)))

(declare-fun res!29632 () Bool)

(assert (=> b!51904 (=> (not res!29632) (not e!33689))))

(assert (=> b!51904 (= res!29632 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))))

(declare-fun b!51905 () Bool)

(assert (=> b!51905 (= e!33689 (arrayContainsKey!0 (_keys!3553 (v!2200 (underlying!143 thiss!992))) lt!21181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10415 (not res!29631)) b!51904))

(assert (= (and b!51904 res!29632) b!51905))

(assert (=> d!10415 m!44435))

(declare-fun m!44497 () Bool)

(assert (=> b!51905 m!44497))

(assert (=> b!51849 d!10415))

(declare-fun b!51918 () Bool)

(declare-fun e!33698 () SeekEntryResult!218)

(declare-fun lt!21203 () SeekEntryResult!218)

(assert (=> b!51918 (= e!33698 (Found!218 (index!2996 lt!21203)))))

(declare-fun b!51919 () Bool)

(declare-fun e!33696 () SeekEntryResult!218)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3349 (_ BitVec 32)) SeekEntryResult!218)

(assert (=> b!51919 (= e!33696 (seekKeyOrZeroReturnVacant!0 (x!9418 lt!21203) (index!2996 lt!21203) (index!2996 lt!21203) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(declare-fun b!51920 () Bool)

(assert (=> b!51920 (= e!33696 (MissingZero!218 (index!2996 lt!21203)))))

(declare-fun b!51921 () Bool)

(declare-fun e!33697 () SeekEntryResult!218)

(assert (=> b!51921 (= e!33697 e!33698)))

(declare-fun lt!21201 () (_ BitVec 64))

(assert (=> b!51921 (= lt!21201 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (index!2996 lt!21203)))))

(declare-fun c!6935 () Bool)

(assert (=> b!51921 (= c!6935 (= lt!21201 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10417 () Bool)

(declare-fun lt!21202 () SeekEntryResult!218)

(assert (=> d!10417 (and (or ((_ is Undefined!218) lt!21202) (not ((_ is Found!218) lt!21202)) (and (bvsge (index!2995 lt!21202) #b00000000000000000000000000000000) (bvslt (index!2995 lt!21202) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))) (or ((_ is Undefined!218) lt!21202) ((_ is Found!218) lt!21202) (not ((_ is MissingZero!218) lt!21202)) (and (bvsge (index!2994 lt!21202) #b00000000000000000000000000000000) (bvslt (index!2994 lt!21202) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))) (or ((_ is Undefined!218) lt!21202) ((_ is Found!218) lt!21202) ((_ is MissingZero!218) lt!21202) (not ((_ is MissingVacant!218) lt!21202)) (and (bvsge (index!2997 lt!21202) #b00000000000000000000000000000000) (bvslt (index!2997 lt!21202) (size!1826 (_keys!3553 (v!2200 (underlying!143 thiss!992))))))) (or ((_ is Undefined!218) lt!21202) (ite ((_ is Found!218) lt!21202) (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (index!2995 lt!21202)) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!218) lt!21202) (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (index!2994 lt!21202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!218) lt!21202) (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) (index!2997 lt!21202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10417 (= lt!21202 e!33697)))

(declare-fun c!6933 () Bool)

(assert (=> d!10417 (= c!6933 (and ((_ is Intermediate!218) lt!21203) (undefined!1030 lt!21203)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3349 (_ BitVec 32)) SeekEntryResult!218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10417 (= lt!21203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) (mask!5749 (v!2200 (underlying!143 thiss!992)))) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))))))

(assert (=> d!10417 (validMask!0 (mask!5749 (v!2200 (underlying!143 thiss!992))))))

(assert (=> d!10417 (= (seekEntryOrOpen!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) (_keys!3553 (v!2200 (underlying!143 thiss!992))) (mask!5749 (v!2200 (underlying!143 thiss!992)))) lt!21202)))

(declare-fun b!51922 () Bool)

(assert (=> b!51922 (= e!33697 Undefined!218)))

(declare-fun b!51923 () Bool)

(declare-fun c!6934 () Bool)

(assert (=> b!51923 (= c!6934 (= lt!21201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51923 (= e!33698 e!33696)))

(assert (= (and d!10417 c!6933) b!51922))

(assert (= (and d!10417 (not c!6933)) b!51921))

(assert (= (and b!51921 c!6935) b!51918))

(assert (= (and b!51921 (not c!6935)) b!51923))

(assert (= (and b!51923 c!6934) b!51920))

(assert (= (and b!51923 (not c!6934)) b!51919))

(assert (=> b!51919 m!44435))

(declare-fun m!44499 () Bool)

(assert (=> b!51919 m!44499))

(declare-fun m!44501 () Bool)

(assert (=> b!51921 m!44501))

(declare-fun m!44503 () Bool)

(assert (=> d!10417 m!44503))

(assert (=> d!10417 m!44435))

(declare-fun m!44505 () Bool)

(assert (=> d!10417 m!44505))

(declare-fun m!44507 () Bool)

(assert (=> d!10417 m!44507))

(assert (=> d!10417 m!44435))

(assert (=> d!10417 m!44503))

(declare-fun m!44509 () Bool)

(assert (=> d!10417 m!44509))

(declare-fun m!44511 () Bool)

(assert (=> d!10417 m!44511))

(assert (=> d!10417 m!44371))

(assert (=> b!51849 d!10417))

(declare-fun d!10419 () Bool)

(assert (=> d!10419 (= (validKeyInArray!0 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51835 d!10419))

(assert (=> b!51836 d!10419))

(declare-fun d!10421 () Bool)

(declare-fun res!29635 () Bool)

(declare-fun e!33700 () Bool)

(assert (=> d!10421 (=> res!29635 e!33700)))

(assert (=> d!10421 (= res!29635 (bvsge #b00000000000000000000000000000000 (size!1826 (_keys!3553 newMap!16))))))

(assert (=> d!10421 (= (arrayNoDuplicates!0 (_keys!3553 newMap!16) #b00000000000000000000000000000000 Nil!1317) e!33700)))

(declare-fun b!51924 () Bool)

(declare-fun e!33702 () Bool)

(assert (=> b!51924 (= e!33702 (contains!615 Nil!1317 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51925 () Bool)

(declare-fun e!33699 () Bool)

(declare-fun call!3956 () Bool)

(assert (=> b!51925 (= e!33699 call!3956)))

(declare-fun b!51926 () Bool)

(declare-fun e!33701 () Bool)

(assert (=> b!51926 (= e!33701 e!33699)))

(declare-fun c!6936 () Bool)

(assert (=> b!51926 (= c!6936 (validKeyInArray!0 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51927 () Bool)

(assert (=> b!51927 (= e!33700 e!33701)))

(declare-fun res!29634 () Bool)

(assert (=> b!51927 (=> (not res!29634) (not e!33701))))

(assert (=> b!51927 (= res!29634 (not e!33702))))

(declare-fun res!29633 () Bool)

(assert (=> b!51927 (=> (not res!29633) (not e!33702))))

(assert (=> b!51927 (= res!29633 (validKeyInArray!0 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3953 () Bool)

(assert (=> bm!3953 (= call!3956 (arrayNoDuplicates!0 (_keys!3553 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6936 (Cons!1316 (select (arr!1598 (_keys!3553 newMap!16)) #b00000000000000000000000000000000) Nil!1317) Nil!1317)))))

(declare-fun b!51928 () Bool)

(assert (=> b!51928 (= e!33699 call!3956)))

(assert (= (and d!10421 (not res!29635)) b!51927))

(assert (= (and b!51927 res!29633) b!51924))

(assert (= (and b!51927 res!29634) b!51926))

(assert (= (and b!51926 c!6936) b!51925))

(assert (= (and b!51926 (not c!6936)) b!51928))

(assert (= (or b!51925 b!51928) bm!3953))

(assert (=> b!51924 m!44457))

(assert (=> b!51924 m!44457))

(declare-fun m!44513 () Bool)

(assert (=> b!51924 m!44513))

(assert (=> b!51926 m!44457))

(assert (=> b!51926 m!44457))

(assert (=> b!51926 m!44459))

(assert (=> b!51927 m!44457))

(assert (=> b!51927 m!44457))

(assert (=> b!51927 m!44459))

(assert (=> bm!3953 m!44457))

(declare-fun m!44515 () Bool)

(assert (=> bm!3953 m!44515))

(assert (=> b!51822 d!10421))

(assert (=> b!51847 d!10419))

(declare-fun d!10423 () Bool)

(declare-fun lt!21206 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!61 (List!1320) (InoxSet (_ BitVec 64)))

(assert (=> d!10423 (= lt!21206 (select (content!61 Nil!1317) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33707 () Bool)

(assert (=> d!10423 (= lt!21206 e!33707)))

(declare-fun res!29640 () Bool)

(assert (=> d!10423 (=> (not res!29640) (not e!33707))))

(assert (=> d!10423 (= res!29640 ((_ is Cons!1316) Nil!1317))))

(assert (=> d!10423 (= (contains!615 Nil!1317 (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)) lt!21206)))

(declare-fun b!51933 () Bool)

(declare-fun e!33708 () Bool)

(assert (=> b!51933 (= e!33707 e!33708)))

(declare-fun res!29641 () Bool)

(assert (=> b!51933 (=> res!29641 e!33708)))

(assert (=> b!51933 (= res!29641 (= (h!1896 Nil!1317) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51934 () Bool)

(assert (=> b!51934 (= e!33708 (contains!615 (t!4354 Nil!1317) (select (arr!1598 (_keys!3553 (v!2200 (underlying!143 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10423 res!29640) b!51933))

(assert (= (and b!51933 (not res!29641)) b!51934))

(declare-fun m!44517 () Bool)

(assert (=> d!10423 m!44517))

(assert (=> d!10423 m!44435))

(declare-fun m!44519 () Bool)

(assert (=> d!10423 m!44519))

(assert (=> b!51934 m!44435))

(declare-fun m!44521 () Bool)

(assert (=> b!51934 m!44521))

(assert (=> b!51833 d!10423))

(declare-fun b!51935 () Bool)

(declare-fun e!33709 () Bool)

(assert (=> b!51935 (= e!33709 tp_is_empty!2221)))

(declare-fun mapNonEmpty!2345 () Bool)

(declare-fun mapRes!2345 () Bool)

(declare-fun tp!6953 () Bool)

(assert (=> mapNonEmpty!2345 (= mapRes!2345 (and tp!6953 e!33709))))

(declare-fun mapRest!2345 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapKey!2345 () (_ BitVec 32))

(declare-fun mapValue!2345 () ValueCell!767)

(assert (=> mapNonEmpty!2345 (= mapRest!2344 (store mapRest!2345 mapKey!2345 mapValue!2345))))

(declare-fun b!51936 () Bool)

(declare-fun e!33710 () Bool)

(assert (=> b!51936 (= e!33710 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2345 () Bool)

(assert (=> mapIsEmpty!2345 mapRes!2345))

(declare-fun condMapEmpty!2345 () Bool)

(declare-fun mapDefault!2345 () ValueCell!767)

(assert (=> mapNonEmpty!2344 (= condMapEmpty!2345 (= mapRest!2344 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2345)))))

(assert (=> mapNonEmpty!2344 (= tp!6952 (and e!33710 mapRes!2345))))

(assert (= (and mapNonEmpty!2344 condMapEmpty!2345) mapIsEmpty!2345))

(assert (= (and mapNonEmpty!2344 (not condMapEmpty!2345)) mapNonEmpty!2345))

(assert (= (and mapNonEmpty!2345 ((_ is ValueCellFull!767) mapValue!2345)) b!51935))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!767) mapDefault!2345)) b!51936))

(declare-fun m!44523 () Bool)

(assert (=> mapNonEmpty!2345 m!44523))

(declare-fun b!51937 () Bool)

(declare-fun e!33711 () Bool)

(assert (=> b!51937 (= e!33711 tp_is_empty!2221)))

(declare-fun mapNonEmpty!2346 () Bool)

(declare-fun mapRes!2346 () Bool)

(declare-fun tp!6954 () Bool)

(assert (=> mapNonEmpty!2346 (= mapRes!2346 (and tp!6954 e!33711))))

(declare-fun mapKey!2346 () (_ BitVec 32))

(declare-fun mapRest!2346 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapValue!2346 () ValueCell!767)

(assert (=> mapNonEmpty!2346 (= mapRest!2343 (store mapRest!2346 mapKey!2346 mapValue!2346))))

(declare-fun b!51938 () Bool)

(declare-fun e!33712 () Bool)

(assert (=> b!51938 (= e!33712 tp_is_empty!2221)))

(declare-fun mapIsEmpty!2346 () Bool)

(assert (=> mapIsEmpty!2346 mapRes!2346))

(declare-fun condMapEmpty!2346 () Bool)

(declare-fun mapDefault!2346 () ValueCell!767)

(assert (=> mapNonEmpty!2343 (= condMapEmpty!2346 (= mapRest!2343 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2346)))))

(assert (=> mapNonEmpty!2343 (= tp!6951 (and e!33712 mapRes!2346))))

(assert (= (and mapNonEmpty!2343 condMapEmpty!2346) mapIsEmpty!2346))

(assert (= (and mapNonEmpty!2343 (not condMapEmpty!2346)) mapNonEmpty!2346))

(assert (= (and mapNonEmpty!2346 ((_ is ValueCellFull!767) mapValue!2346)) b!51937))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!767) mapDefault!2346)) b!51938))

(declare-fun m!44525 () Bool)

(assert (=> mapNonEmpty!2346 m!44525))

(check-sat tp_is_empty!2221 (not b!51924) (not d!10417) (not d!10409) (not b_next!1611) (not b!51934) (not b!51919) (not d!10403) (not b!51926) (not mapNonEmpty!2346) (not b!51882) (not b!51881) (not d!10413) (not b_next!1609) (not b!51895) (not bm!3950) (not b!51889) (not b!51887) b_and!2817 (not b!51898) (not bm!3949) (not b!51885) (not b!51894) (not b!51892) (not b!51897) (not d!10423) (not b!51893) (not bm!3953) (not bm!3952) (not b!51927) (not b!51891) (not bm!3951) (not b!51870) (not b!51905) (not mapNonEmpty!2345) b_and!2819)
(check-sat b_and!2817 b_and!2819 (not b_next!1609) (not b_next!1611))
