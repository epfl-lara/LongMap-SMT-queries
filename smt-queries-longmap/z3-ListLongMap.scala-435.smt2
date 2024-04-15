; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8198 () Bool)

(assert start!8198)

(declare-fun b!51695 () Bool)

(declare-fun b_free!1609 () Bool)

(declare-fun b_next!1609 () Bool)

(assert (=> b!51695 (= b_free!1609 (not b_next!1609))))

(declare-fun tp!6921 () Bool)

(declare-fun b_and!2821 () Bool)

(assert (=> b!51695 (= tp!6921 b_and!2821)))

(declare-fun b!51691 () Bool)

(declare-fun b_free!1611 () Bool)

(declare-fun b_next!1611 () Bool)

(assert (=> b!51691 (= b_free!1611 (not b_next!1611))))

(declare-fun tp!6924 () Bool)

(declare-fun b_and!2823 () Bool)

(assert (=> b!51691 (= tp!6924 b_and!2823)))

(declare-fun b!51686 () Bool)

(declare-fun e!33547 () Bool)

(declare-fun tp_is_empty!2221 () Bool)

(assert (=> b!51686 (= e!33547 tp_is_empty!2221)))

(declare-fun b!51687 () Bool)

(declare-fun res!29541 () Bool)

(declare-fun e!33544 () Bool)

(assert (=> b!51687 (=> (not res!29541) (not e!33544))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2609 0))(
  ( (V!2610 (val!1155 Int)) )
))
(declare-datatypes ((array!3343 0))(
  ( (array!3344 (arr!1594 (Array (_ BitVec 32) (_ BitVec 64))) (size!1823 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!767 0))(
  ( (ValueCellFull!767 (v!2197 V!2609)) (EmptyCell!767) )
))
(declare-datatypes ((array!3345 0))(
  ( (array!3346 (arr!1595 (Array (_ BitVec 32) ValueCell!767)) (size!1824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!442 0))(
  ( (LongMapFixedSize!443 (defaultEntry!1935 Int) (mask!5748 (_ BitVec 32)) (extraKeys!1826 (_ BitVec 32)) (zeroValue!1853 V!2609) (minValue!1853 V!2609) (_size!270 (_ BitVec 32)) (_keys!3552 array!3343) (_values!1918 array!3345) (_vacant!270 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!266 0))(
  ( (Cell!267 (v!2198 LongMapFixedSize!442)) )
))
(declare-datatypes ((LongMap!266 0))(
  ( (LongMap!267 (underlying!144 Cell!266)) )
))
(declare-fun thiss!992 () LongMap!266)

(assert (=> b!51687 (= res!29541 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992)))))))))

(declare-fun b!51688 () Bool)

(declare-fun res!29540 () Bool)

(assert (=> b!51688 (=> (not res!29540) (not e!33544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51688 (= res!29540 (validMask!0 (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun mapNonEmpty!2327 () Bool)

(declare-fun mapRes!2327 () Bool)

(declare-fun tp!6922 () Bool)

(declare-fun e!33537 () Bool)

(assert (=> mapNonEmpty!2327 (= mapRes!2327 (and tp!6922 e!33537))))

(declare-fun mapRest!2328 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun newMap!16 () LongMapFixedSize!442)

(declare-fun mapValue!2328 () ValueCell!767)

(declare-fun mapKey!2327 () (_ BitVec 32))

(assert (=> mapNonEmpty!2327 (= (arr!1595 (_values!1918 newMap!16)) (store mapRest!2328 mapKey!2327 mapValue!2328))))

(declare-fun b!51689 () Bool)

(declare-fun res!29542 () Bool)

(assert (=> b!51689 (=> (not res!29542) (not e!33544))))

(assert (=> b!51689 (= res!29542 (and (= (size!1824 (_values!1918 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5748 (v!2198 (underlying!144 thiss!992))))) (= (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (size!1824 (_values!1918 (v!2198 (underlying!144 thiss!992))))) (bvsge (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1826 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1826 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51690 () Bool)

(declare-fun e!33539 () Bool)

(assert (=> b!51690 (= e!33539 tp_is_empty!2221)))

(declare-fun e!33543 () Bool)

(declare-fun e!33538 () Bool)

(declare-fun array_inv!977 (array!3343) Bool)

(declare-fun array_inv!978 (array!3345) Bool)

(assert (=> b!51691 (= e!33543 (and tp!6924 tp_is_empty!2221 (array_inv!977 (_keys!3552 newMap!16)) (array_inv!978 (_values!1918 newMap!16)) e!33538))))

(declare-fun b!51692 () Bool)

(declare-fun e!33542 () Bool)

(declare-fun e!33540 () Bool)

(assert (=> b!51692 (= e!33542 e!33540)))

(declare-fun b!51693 () Bool)

(declare-fun res!29537 () Bool)

(assert (=> b!51693 (=> (not res!29537) (not e!33544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3343 (_ BitVec 32)) Bool)

(assert (=> b!51693 (= res!29537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51694 () Bool)

(assert (=> b!51694 (= e!33537 tp_is_empty!2221)))

(declare-fun mapNonEmpty!2328 () Bool)

(declare-fun mapRes!2328 () Bool)

(declare-fun tp!6923 () Bool)

(assert (=> mapNonEmpty!2328 (= mapRes!2328 (and tp!6923 e!33547))))

(declare-fun mapKey!2328 () (_ BitVec 32))

(declare-fun mapValue!2327 () ValueCell!767)

(declare-fun mapRest!2327 () (Array (_ BitVec 32) ValueCell!767))

(assert (=> mapNonEmpty!2328 (= (arr!1595 (_values!1918 (v!2198 (underlying!144 thiss!992)))) (store mapRest!2327 mapKey!2328 mapValue!2327))))

(declare-fun res!29543 () Bool)

(assert (=> start!8198 (=> (not res!29543) (not e!33544))))

(declare-fun valid!164 (LongMap!266) Bool)

(assert (=> start!8198 (= res!29543 (valid!164 thiss!992))))

(assert (=> start!8198 e!33544))

(assert (=> start!8198 e!33542))

(assert (=> start!8198 true))

(assert (=> start!8198 e!33543))

(declare-fun mapIsEmpty!2327 () Bool)

(assert (=> mapIsEmpty!2327 mapRes!2327))

(declare-fun mapIsEmpty!2328 () Bool)

(assert (=> mapIsEmpty!2328 mapRes!2328))

(declare-fun e!33536 () Bool)

(declare-fun e!33546 () Bool)

(assert (=> b!51695 (= e!33536 (and tp!6921 tp_is_empty!2221 (array_inv!977 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (array_inv!978 (_values!1918 (v!2198 (underlying!144 thiss!992)))) e!33546))))

(declare-fun b!51696 () Bool)

(assert (=> b!51696 (= e!33546 (and e!33539 mapRes!2328))))

(declare-fun condMapEmpty!2327 () Bool)

(declare-fun mapDefault!2327 () ValueCell!767)

(assert (=> b!51696 (= condMapEmpty!2327 (= (arr!1595 (_values!1918 (v!2198 (underlying!144 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2327)))))

(declare-fun b!51697 () Bool)

(declare-datatypes ((List!1330 0))(
  ( (Nil!1327) (Cons!1326 (h!1906 (_ BitVec 64)) (t!4363 List!1330)) )
))
(declare-fun arrayNoDuplicates!0 (array!3343 (_ BitVec 32) List!1330) Bool)

(assert (=> b!51697 (= e!33544 (not (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000 Nil!1327)))))

(declare-fun b!51698 () Bool)

(declare-fun res!29538 () Bool)

(assert (=> b!51698 (=> (not res!29538) (not e!33544))))

(assert (=> b!51698 (= res!29538 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5748 newMap!16)) (_size!270 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51699 () Bool)

(declare-fun res!29539 () Bool)

(assert (=> b!51699 (=> (not res!29539) (not e!33544))))

(declare-fun valid!165 (LongMapFixedSize!442) Bool)

(assert (=> b!51699 (= res!29539 (valid!165 newMap!16))))

(declare-fun b!51700 () Bool)

(assert (=> b!51700 (= e!33540 e!33536)))

(declare-fun b!51701 () Bool)

(declare-fun e!33541 () Bool)

(assert (=> b!51701 (= e!33538 (and e!33541 mapRes!2327))))

(declare-fun condMapEmpty!2328 () Bool)

(declare-fun mapDefault!2328 () ValueCell!767)

(assert (=> b!51701 (= condMapEmpty!2328 (= (arr!1595 (_values!1918 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2328)))))

(declare-fun b!51702 () Bool)

(assert (=> b!51702 (= e!33541 tp_is_empty!2221)))

(assert (= (and start!8198 res!29543) b!51687))

(assert (= (and b!51687 res!29541) b!51699))

(assert (= (and b!51699 res!29539) b!51698))

(assert (= (and b!51698 res!29538) b!51688))

(assert (= (and b!51688 res!29540) b!51689))

(assert (= (and b!51689 res!29542) b!51693))

(assert (= (and b!51693 res!29537) b!51697))

(assert (= (and b!51696 condMapEmpty!2327) mapIsEmpty!2328))

(assert (= (and b!51696 (not condMapEmpty!2327)) mapNonEmpty!2328))

(get-info :version)

(assert (= (and mapNonEmpty!2328 ((_ is ValueCellFull!767) mapValue!2327)) b!51686))

(assert (= (and b!51696 ((_ is ValueCellFull!767) mapDefault!2327)) b!51690))

(assert (= b!51695 b!51696))

(assert (= b!51700 b!51695))

(assert (= b!51692 b!51700))

(assert (= start!8198 b!51692))

(assert (= (and b!51701 condMapEmpty!2328) mapIsEmpty!2327))

(assert (= (and b!51701 (not condMapEmpty!2328)) mapNonEmpty!2327))

(assert (= (and mapNonEmpty!2327 ((_ is ValueCellFull!767) mapValue!2328)) b!51694))

(assert (= (and b!51701 ((_ is ValueCellFull!767) mapDefault!2328)) b!51702))

(assert (= b!51691 b!51701))

(assert (= start!8198 b!51691))

(declare-fun m!44403 () Bool)

(assert (=> b!51688 m!44403))

(declare-fun m!44405 () Bool)

(assert (=> start!8198 m!44405))

(declare-fun m!44407 () Bool)

(assert (=> b!51697 m!44407))

(declare-fun m!44409 () Bool)

(assert (=> mapNonEmpty!2327 m!44409))

(declare-fun m!44411 () Bool)

(assert (=> b!51691 m!44411))

(declare-fun m!44413 () Bool)

(assert (=> b!51691 m!44413))

(declare-fun m!44415 () Bool)

(assert (=> b!51695 m!44415))

(declare-fun m!44417 () Bool)

(assert (=> b!51695 m!44417))

(declare-fun m!44419 () Bool)

(assert (=> b!51699 m!44419))

(declare-fun m!44421 () Bool)

(assert (=> mapNonEmpty!2328 m!44421))

(declare-fun m!44423 () Bool)

(assert (=> b!51693 m!44423))

(check-sat (not b!51697) (not b_next!1611) (not b!51699) (not start!8198) (not b!51695) (not b_next!1609) (not mapNonEmpty!2327) (not b!51688) b_and!2823 tp_is_empty!2221 (not b!51693) (not b!51691) b_and!2821 (not mapNonEmpty!2328))
(check-sat b_and!2821 b_and!2823 (not b_next!1609) (not b_next!1611))
(get-model)

(declare-fun d!10373 () Bool)

(assert (=> d!10373 (= (valid!164 thiss!992) (valid!165 (v!2198 (underlying!144 thiss!992))))))

(declare-fun bs!2385 () Bool)

(assert (= bs!2385 d!10373))

(declare-fun m!44469 () Bool)

(assert (=> bs!2385 m!44469))

(assert (=> start!8198 d!10373))

(declare-fun d!10375 () Bool)

(assert (=> d!10375 (= (validMask!0 (mask!5748 (v!2198 (underlying!144 thiss!992)))) (and (or (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000001111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000011111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000001111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000011111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000001111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000011111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000001111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000011111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000000111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000001111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000011111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000000111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000001111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000011111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000000111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000001111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000011111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000000111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000001111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000011111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00000111111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00001111111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00011111111111111111111111111111) (= (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5748 (v!2198 (underlying!144 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51688 d!10375))

(declare-fun d!10377 () Bool)

(declare-fun res!29592 () Bool)

(declare-fun e!33628 () Bool)

(assert (=> d!10377 (=> (not res!29592) (not e!33628))))

(declare-fun simpleValid!39 (LongMapFixedSize!442) Bool)

(assert (=> d!10377 (= res!29592 (simpleValid!39 newMap!16))))

(assert (=> d!10377 (= (valid!165 newMap!16) e!33628)))

(declare-fun b!51811 () Bool)

(declare-fun res!29593 () Bool)

(assert (=> b!51811 (=> (not res!29593) (not e!33628))))

(declare-fun arrayCountValidKeys!0 (array!3343 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51811 (= res!29593 (= (arrayCountValidKeys!0 (_keys!3552 newMap!16) #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))) (_size!270 newMap!16)))))

(declare-fun b!51812 () Bool)

(declare-fun res!29594 () Bool)

(assert (=> b!51812 (=> (not res!29594) (not e!33628))))

(assert (=> b!51812 (= res!29594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3552 newMap!16) (mask!5748 newMap!16)))))

(declare-fun b!51813 () Bool)

(assert (=> b!51813 (= e!33628 (arrayNoDuplicates!0 (_keys!3552 newMap!16) #b00000000000000000000000000000000 Nil!1327))))

(assert (= (and d!10377 res!29592) b!51811))

(assert (= (and b!51811 res!29593) b!51812))

(assert (= (and b!51812 res!29594) b!51813))

(declare-fun m!44471 () Bool)

(assert (=> d!10377 m!44471))

(declare-fun m!44473 () Bool)

(assert (=> b!51811 m!44473))

(declare-fun m!44475 () Bool)

(assert (=> b!51812 m!44475))

(declare-fun m!44477 () Bool)

(assert (=> b!51813 m!44477))

(assert (=> b!51699 d!10377))

(declare-fun d!10379 () Bool)

(assert (=> d!10379 (= (array_inv!977 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvsge (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51695 d!10379))

(declare-fun d!10381 () Bool)

(assert (=> d!10381 (= (array_inv!978 (_values!1918 (v!2198 (underlying!144 thiss!992)))) (bvsge (size!1824 (_values!1918 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51695 d!10381))

(declare-fun b!51822 () Bool)

(declare-fun e!33636 () Bool)

(declare-fun call!3959 () Bool)

(assert (=> b!51822 (= e!33636 call!3959)))

(declare-fun b!51823 () Bool)

(declare-fun e!33637 () Bool)

(assert (=> b!51823 (= e!33637 e!33636)))

(declare-fun lt!21208 () (_ BitVec 64))

(assert (=> b!51823 (= lt!21208 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1434 0))(
  ( (Unit!1435) )
))
(declare-fun lt!21209 () Unit!1434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3343 (_ BitVec 64) (_ BitVec 32)) Unit!1434)

(assert (=> b!51823 (= lt!21209 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51823 (arrayContainsKey!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000)))

(declare-fun lt!21207 () Unit!1434)

(assert (=> b!51823 (= lt!21207 lt!21209)))

(declare-fun res!29599 () Bool)

(declare-datatypes ((SeekEntryResult!227 0))(
  ( (MissingZero!227 (index!3030 (_ BitVec 32))) (Found!227 (index!3031 (_ BitVec 32))) (Intermediate!227 (undefined!1039 Bool) (index!3032 (_ BitVec 32)) (x!9426 (_ BitVec 32))) (Undefined!227) (MissingVacant!227 (index!3033 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3343 (_ BitVec 32)) SeekEntryResult!227)

(assert (=> b!51823 (= res!29599 (= (seekEntryOrOpen!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))) (Found!227 #b00000000000000000000000000000000)))))

(assert (=> b!51823 (=> (not res!29599) (not e!33636))))

(declare-fun d!10383 () Bool)

(declare-fun res!29600 () Bool)

(declare-fun e!33635 () Bool)

(assert (=> d!10383 (=> res!29600 e!33635)))

(assert (=> d!10383 (= res!29600 (bvsge #b00000000000000000000000000000000 (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))))

(assert (=> d!10383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))) e!33635)))

(declare-fun b!51824 () Bool)

(assert (=> b!51824 (= e!33637 call!3959)))

(declare-fun bm!3956 () Bool)

(assert (=> bm!3956 (= call!3959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51825 () Bool)

(assert (=> b!51825 (= e!33635 e!33637)))

(declare-fun c!6907 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51825 (= c!6907 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10383 (not res!29600)) b!51825))

(assert (= (and b!51825 c!6907) b!51823))

(assert (= (and b!51825 (not c!6907)) b!51824))

(assert (= (and b!51823 res!29599) b!51822))

(assert (= (or b!51822 b!51824) bm!3956))

(declare-fun m!44479 () Bool)

(assert (=> b!51823 m!44479))

(declare-fun m!44481 () Bool)

(assert (=> b!51823 m!44481))

(declare-fun m!44483 () Bool)

(assert (=> b!51823 m!44483))

(assert (=> b!51823 m!44479))

(declare-fun m!44485 () Bool)

(assert (=> b!51823 m!44485))

(declare-fun m!44487 () Bool)

(assert (=> bm!3956 m!44487))

(assert (=> b!51825 m!44479))

(assert (=> b!51825 m!44479))

(declare-fun m!44489 () Bool)

(assert (=> b!51825 m!44489))

(assert (=> b!51693 d!10383))

(declare-fun b!51836 () Bool)

(declare-fun e!33646 () Bool)

(declare-fun e!33647 () Bool)

(assert (=> b!51836 (= e!33646 e!33647)))

(declare-fun res!29609 () Bool)

(assert (=> b!51836 (=> (not res!29609) (not e!33647))))

(declare-fun e!33649 () Bool)

(assert (=> b!51836 (= res!29609 (not e!33649))))

(declare-fun res!29608 () Bool)

(assert (=> b!51836 (=> (not res!29608) (not e!33649))))

(assert (=> b!51836 (= res!29608 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3959 () Bool)

(declare-fun call!3962 () Bool)

(declare-fun c!6910 () Bool)

(assert (=> bm!3959 (= call!3962 (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6910 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327)))))

(declare-fun b!51837 () Bool)

(declare-fun contains!620 (List!1330 (_ BitVec 64)) Bool)

(assert (=> b!51837 (= e!33649 (contains!620 Nil!1327 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10385 () Bool)

(declare-fun res!29607 () Bool)

(assert (=> d!10385 (=> res!29607 e!33646)))

(assert (=> d!10385 (= res!29607 (bvsge #b00000000000000000000000000000000 (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))))

(assert (=> d!10385 (= (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000 Nil!1327) e!33646)))

(declare-fun b!51838 () Bool)

(declare-fun e!33648 () Bool)

(assert (=> b!51838 (= e!33648 call!3962)))

(declare-fun b!51839 () Bool)

(assert (=> b!51839 (= e!33647 e!33648)))

(assert (=> b!51839 (= c!6910 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51840 () Bool)

(assert (=> b!51840 (= e!33648 call!3962)))

(assert (= (and d!10385 (not res!29607)) b!51836))

(assert (= (and b!51836 res!29608) b!51837))

(assert (= (and b!51836 res!29609) b!51839))

(assert (= (and b!51839 c!6910) b!51838))

(assert (= (and b!51839 (not c!6910)) b!51840))

(assert (= (or b!51838 b!51840) bm!3959))

(assert (=> b!51836 m!44479))

(assert (=> b!51836 m!44479))

(assert (=> b!51836 m!44489))

(assert (=> bm!3959 m!44479))

(declare-fun m!44491 () Bool)

(assert (=> bm!3959 m!44491))

(assert (=> b!51837 m!44479))

(assert (=> b!51837 m!44479))

(declare-fun m!44493 () Bool)

(assert (=> b!51837 m!44493))

(assert (=> b!51839 m!44479))

(assert (=> b!51839 m!44479))

(assert (=> b!51839 m!44489))

(assert (=> b!51697 d!10385))

(declare-fun d!10387 () Bool)

(assert (=> d!10387 (= (array_inv!977 (_keys!3552 newMap!16)) (bvsge (size!1823 (_keys!3552 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51691 d!10387))

(declare-fun d!10389 () Bool)

(assert (=> d!10389 (= (array_inv!978 (_values!1918 newMap!16)) (bvsge (size!1824 (_values!1918 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51691 d!10389))

(declare-fun mapNonEmpty!2343 () Bool)

(declare-fun mapRes!2343 () Bool)

(declare-fun tp!6951 () Bool)

(declare-fun e!33655 () Bool)

(assert (=> mapNonEmpty!2343 (= mapRes!2343 (and tp!6951 e!33655))))

(declare-fun mapKey!2343 () (_ BitVec 32))

(declare-fun mapValue!2343 () ValueCell!767)

(declare-fun mapRest!2343 () (Array (_ BitVec 32) ValueCell!767))

(assert (=> mapNonEmpty!2343 (= mapRest!2328 (store mapRest!2343 mapKey!2343 mapValue!2343))))

(declare-fun b!51847 () Bool)

(assert (=> b!51847 (= e!33655 tp_is_empty!2221)))

(declare-fun b!51848 () Bool)

(declare-fun e!33654 () Bool)

(assert (=> b!51848 (= e!33654 tp_is_empty!2221)))

(declare-fun condMapEmpty!2343 () Bool)

(declare-fun mapDefault!2343 () ValueCell!767)

(assert (=> mapNonEmpty!2327 (= condMapEmpty!2343 (= mapRest!2328 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2343)))))

(assert (=> mapNonEmpty!2327 (= tp!6922 (and e!33654 mapRes!2343))))

(declare-fun mapIsEmpty!2343 () Bool)

(assert (=> mapIsEmpty!2343 mapRes!2343))

(assert (= (and mapNonEmpty!2327 condMapEmpty!2343) mapIsEmpty!2343))

(assert (= (and mapNonEmpty!2327 (not condMapEmpty!2343)) mapNonEmpty!2343))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!767) mapValue!2343)) b!51847))

(assert (= (and mapNonEmpty!2327 ((_ is ValueCellFull!767) mapDefault!2343)) b!51848))

(declare-fun m!44495 () Bool)

(assert (=> mapNonEmpty!2343 m!44495))

(declare-fun mapNonEmpty!2344 () Bool)

(declare-fun mapRes!2344 () Bool)

(declare-fun tp!6952 () Bool)

(declare-fun e!33657 () Bool)

(assert (=> mapNonEmpty!2344 (= mapRes!2344 (and tp!6952 e!33657))))

(declare-fun mapKey!2344 () (_ BitVec 32))

(declare-fun mapValue!2344 () ValueCell!767)

(declare-fun mapRest!2344 () (Array (_ BitVec 32) ValueCell!767))

(assert (=> mapNonEmpty!2344 (= mapRest!2327 (store mapRest!2344 mapKey!2344 mapValue!2344))))

(declare-fun b!51849 () Bool)

(assert (=> b!51849 (= e!33657 tp_is_empty!2221)))

(declare-fun b!51850 () Bool)

(declare-fun e!33656 () Bool)

(assert (=> b!51850 (= e!33656 tp_is_empty!2221)))

(declare-fun condMapEmpty!2344 () Bool)

(declare-fun mapDefault!2344 () ValueCell!767)

(assert (=> mapNonEmpty!2328 (= condMapEmpty!2344 (= mapRest!2327 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2344)))))

(assert (=> mapNonEmpty!2328 (= tp!6923 (and e!33656 mapRes!2344))))

(declare-fun mapIsEmpty!2344 () Bool)

(assert (=> mapIsEmpty!2344 mapRes!2344))

(assert (= (and mapNonEmpty!2328 condMapEmpty!2344) mapIsEmpty!2344))

(assert (= (and mapNonEmpty!2328 (not condMapEmpty!2344)) mapNonEmpty!2344))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!767) mapValue!2344)) b!51849))

(assert (= (and mapNonEmpty!2328 ((_ is ValueCellFull!767) mapDefault!2344)) b!51850))

(declare-fun m!44497 () Bool)

(assert (=> mapNonEmpty!2344 m!44497))

(check-sat (not b!51837) (not mapNonEmpty!2343) (not bm!3956) b_and!2821 (not b_next!1611) (not b!51823) (not b!51811) (not b!51839) (not b_next!1609) (not d!10373) (not d!10377) (not b!51825) b_and!2823 (not b!51812) tp_is_empty!2221 (not b!51813) (not bm!3959) (not mapNonEmpty!2344) (not b!51836))
(check-sat b_and!2821 b_and!2823 (not b_next!1609) (not b_next!1611))
(get-model)

(declare-fun b!51851 () Bool)

(declare-fun e!33659 () Bool)

(declare-fun call!3963 () Bool)

(assert (=> b!51851 (= e!33659 call!3963)))

(declare-fun b!51852 () Bool)

(declare-fun e!33660 () Bool)

(assert (=> b!51852 (= e!33660 e!33659)))

(declare-fun lt!21211 () (_ BitVec 64))

(assert (=> b!51852 (= lt!21211 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21212 () Unit!1434)

(assert (=> b!51852 (= lt!21212 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3552 newMap!16) lt!21211 #b00000000000000000000000000000000))))

(assert (=> b!51852 (arrayContainsKey!0 (_keys!3552 newMap!16) lt!21211 #b00000000000000000000000000000000)))

(declare-fun lt!21210 () Unit!1434)

(assert (=> b!51852 (= lt!21210 lt!21212)))

(declare-fun res!29610 () Bool)

(assert (=> b!51852 (= res!29610 (= (seekEntryOrOpen!0 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000) (_keys!3552 newMap!16) (mask!5748 newMap!16)) (Found!227 #b00000000000000000000000000000000)))))

(assert (=> b!51852 (=> (not res!29610) (not e!33659))))

(declare-fun d!10391 () Bool)

(declare-fun res!29611 () Bool)

(declare-fun e!33658 () Bool)

(assert (=> d!10391 (=> res!29611 e!33658)))

(assert (=> d!10391 (= res!29611 (bvsge #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))))))

(assert (=> d!10391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3552 newMap!16) (mask!5748 newMap!16)) e!33658)))

(declare-fun b!51853 () Bool)

(assert (=> b!51853 (= e!33660 call!3963)))

(declare-fun bm!3960 () Bool)

(assert (=> bm!3960 (= call!3963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3552 newMap!16) (mask!5748 newMap!16)))))

(declare-fun b!51854 () Bool)

(assert (=> b!51854 (= e!33658 e!33660)))

(declare-fun c!6911 () Bool)

(assert (=> b!51854 (= c!6911 (validKeyInArray!0 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10391 (not res!29611)) b!51854))

(assert (= (and b!51854 c!6911) b!51852))

(assert (= (and b!51854 (not c!6911)) b!51853))

(assert (= (and b!51852 res!29610) b!51851))

(assert (= (or b!51851 b!51853) bm!3960))

(declare-fun m!44499 () Bool)

(assert (=> b!51852 m!44499))

(declare-fun m!44501 () Bool)

(assert (=> b!51852 m!44501))

(declare-fun m!44503 () Bool)

(assert (=> b!51852 m!44503))

(assert (=> b!51852 m!44499))

(declare-fun m!44505 () Bool)

(assert (=> b!51852 m!44505))

(declare-fun m!44507 () Bool)

(assert (=> bm!3960 m!44507))

(assert (=> b!51854 m!44499))

(assert (=> b!51854 m!44499))

(declare-fun m!44509 () Bool)

(assert (=> b!51854 m!44509))

(assert (=> b!51812 d!10391))

(declare-fun b!51855 () Bool)

(declare-fun e!33661 () Bool)

(declare-fun e!33662 () Bool)

(assert (=> b!51855 (= e!33661 e!33662)))

(declare-fun res!29614 () Bool)

(assert (=> b!51855 (=> (not res!29614) (not e!33662))))

(declare-fun e!33664 () Bool)

(assert (=> b!51855 (= res!29614 (not e!33664))))

(declare-fun res!29613 () Bool)

(assert (=> b!51855 (=> (not res!29613) (not e!33664))))

(assert (=> b!51855 (= res!29613 (validKeyInArray!0 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3961 () Bool)

(declare-fun call!3964 () Bool)

(declare-fun c!6912 () Bool)

(assert (=> bm!3961 (= call!3964 (arrayNoDuplicates!0 (_keys!3552 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6912 (Cons!1326 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327)))))

(declare-fun b!51856 () Bool)

(assert (=> b!51856 (= e!33664 (contains!620 Nil!1327 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10393 () Bool)

(declare-fun res!29612 () Bool)

(assert (=> d!10393 (=> res!29612 e!33661)))

(assert (=> d!10393 (= res!29612 (bvsge #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))))))

(assert (=> d!10393 (= (arrayNoDuplicates!0 (_keys!3552 newMap!16) #b00000000000000000000000000000000 Nil!1327) e!33661)))

(declare-fun b!51857 () Bool)

(declare-fun e!33663 () Bool)

(assert (=> b!51857 (= e!33663 call!3964)))

(declare-fun b!51858 () Bool)

(assert (=> b!51858 (= e!33662 e!33663)))

(assert (=> b!51858 (= c!6912 (validKeyInArray!0 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51859 () Bool)

(assert (=> b!51859 (= e!33663 call!3964)))

(assert (= (and d!10393 (not res!29612)) b!51855))

(assert (= (and b!51855 res!29613) b!51856))

(assert (= (and b!51855 res!29614) b!51858))

(assert (= (and b!51858 c!6912) b!51857))

(assert (= (and b!51858 (not c!6912)) b!51859))

(assert (= (or b!51857 b!51859) bm!3961))

(assert (=> b!51855 m!44499))

(assert (=> b!51855 m!44499))

(assert (=> b!51855 m!44509))

(assert (=> bm!3961 m!44499))

(declare-fun m!44511 () Bool)

(assert (=> bm!3961 m!44511))

(assert (=> b!51856 m!44499))

(assert (=> b!51856 m!44499))

(declare-fun m!44513 () Bool)

(assert (=> b!51856 m!44513))

(assert (=> b!51858 m!44499))

(assert (=> b!51858 m!44499))

(assert (=> b!51858 m!44509))

(assert (=> b!51813 d!10393))

(declare-fun d!10395 () Bool)

(assert (=> d!10395 (= (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51836 d!10395))

(declare-fun b!51871 () Bool)

(declare-fun e!33667 () Bool)

(assert (=> b!51871 (= e!33667 (and (bvsge (extraKeys!1826 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1826 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!270 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51870 () Bool)

(declare-fun res!29626 () Bool)

(assert (=> b!51870 (=> (not res!29626) (not e!33667))))

(declare-fun size!1829 (LongMapFixedSize!442) (_ BitVec 32))

(assert (=> b!51870 (= res!29626 (= (size!1829 newMap!16) (bvadd (_size!270 newMap!16) (bvsdiv (bvadd (extraKeys!1826 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51868 () Bool)

(declare-fun res!29623 () Bool)

(assert (=> b!51868 (=> (not res!29623) (not e!33667))))

(assert (=> b!51868 (= res!29623 (and (= (size!1824 (_values!1918 newMap!16)) (bvadd (mask!5748 newMap!16) #b00000000000000000000000000000001)) (= (size!1823 (_keys!3552 newMap!16)) (size!1824 (_values!1918 newMap!16))) (bvsge (_size!270 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!270 newMap!16) (bvadd (mask!5748 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51869 () Bool)

(declare-fun res!29624 () Bool)

(assert (=> b!51869 (=> (not res!29624) (not e!33667))))

(assert (=> b!51869 (= res!29624 (bvsge (size!1829 newMap!16) (_size!270 newMap!16)))))

(declare-fun d!10397 () Bool)

(declare-fun res!29625 () Bool)

(assert (=> d!10397 (=> (not res!29625) (not e!33667))))

(assert (=> d!10397 (= res!29625 (validMask!0 (mask!5748 newMap!16)))))

(assert (=> d!10397 (= (simpleValid!39 newMap!16) e!33667)))

(assert (= (and d!10397 res!29625) b!51868))

(assert (= (and b!51868 res!29623) b!51869))

(assert (= (and b!51869 res!29624) b!51870))

(assert (= (and b!51870 res!29626) b!51871))

(declare-fun m!44515 () Bool)

(assert (=> b!51870 m!44515))

(assert (=> b!51869 m!44515))

(declare-fun m!44517 () Bool)

(assert (=> d!10397 m!44517))

(assert (=> d!10377 d!10397))

(declare-fun b!51880 () Bool)

(declare-fun e!33673 () (_ BitVec 32))

(declare-fun e!33672 () (_ BitVec 32))

(assert (=> b!51880 (= e!33673 e!33672)))

(declare-fun c!6918 () Bool)

(assert (=> b!51880 (= c!6918 (validKeyInArray!0 (select (arr!1594 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51881 () Bool)

(assert (=> b!51881 (= e!33673 #b00000000000000000000000000000000)))

(declare-fun d!10399 () Bool)

(declare-fun lt!21215 () (_ BitVec 32))

(assert (=> d!10399 (and (bvsge lt!21215 #b00000000000000000000000000000000) (bvsle lt!21215 (bvsub (size!1823 (_keys!3552 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10399 (= lt!21215 e!33673)))

(declare-fun c!6917 () Bool)

(assert (=> d!10399 (= c!6917 (bvsge #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))))))

(assert (=> d!10399 (and (bvsle #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1823 (_keys!3552 newMap!16)) (size!1823 (_keys!3552 newMap!16))))))

(assert (=> d!10399 (= (arrayCountValidKeys!0 (_keys!3552 newMap!16) #b00000000000000000000000000000000 (size!1823 (_keys!3552 newMap!16))) lt!21215)))

(declare-fun b!51882 () Bool)

(declare-fun call!3967 () (_ BitVec 32))

(assert (=> b!51882 (= e!33672 (bvadd #b00000000000000000000000000000001 call!3967))))

(declare-fun b!51883 () Bool)

(assert (=> b!51883 (= e!33672 call!3967)))

(declare-fun bm!3964 () Bool)

(assert (=> bm!3964 (= call!3967 (arrayCountValidKeys!0 (_keys!3552 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1823 (_keys!3552 newMap!16))))))

(assert (= (and d!10399 c!6917) b!51881))

(assert (= (and d!10399 (not c!6917)) b!51880))

(assert (= (and b!51880 c!6918) b!51882))

(assert (= (and b!51880 (not c!6918)) b!51883))

(assert (= (or b!51882 b!51883) bm!3964))

(assert (=> b!51880 m!44499))

(assert (=> b!51880 m!44499))

(assert (=> b!51880 m!44509))

(declare-fun m!44519 () Bool)

(assert (=> bm!3964 m!44519))

(assert (=> b!51811 d!10399))

(assert (=> b!51839 d!10395))

(declare-fun b!51884 () Bool)

(declare-fun e!33675 () Bool)

(declare-fun call!3968 () Bool)

(assert (=> b!51884 (= e!33675 call!3968)))

(declare-fun b!51885 () Bool)

(declare-fun e!33676 () Bool)

(assert (=> b!51885 (= e!33676 e!33675)))

(declare-fun lt!21217 () (_ BitVec 64))

(assert (=> b!51885 (= lt!21217 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21218 () Unit!1434)

(assert (=> b!51885 (= lt!21218 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21217 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51885 (arrayContainsKey!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21217 #b00000000000000000000000000000000)))

(declare-fun lt!21216 () Unit!1434)

(assert (=> b!51885 (= lt!21216 lt!21218)))

(declare-fun res!29627 () Bool)

(assert (=> b!51885 (= res!29627 (= (seekEntryOrOpen!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))) (Found!227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51885 (=> (not res!29627) (not e!33675))))

(declare-fun d!10401 () Bool)

(declare-fun res!29628 () Bool)

(declare-fun e!33674 () Bool)

(assert (=> d!10401 (=> res!29628 e!33674)))

(assert (=> d!10401 (= res!29628 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))))

(assert (=> d!10401 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))) e!33674)))

(declare-fun b!51886 () Bool)

(assert (=> b!51886 (= e!33676 call!3968)))

(declare-fun bm!3965 () Bool)

(assert (=> bm!3965 (= call!3968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51887 () Bool)

(assert (=> b!51887 (= e!33674 e!33676)))

(declare-fun c!6919 () Bool)

(assert (=> b!51887 (= c!6919 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10401 (not res!29628)) b!51887))

(assert (= (and b!51887 c!6919) b!51885))

(assert (= (and b!51887 (not c!6919)) b!51886))

(assert (= (and b!51885 res!29627) b!51884))

(assert (= (or b!51884 b!51886) bm!3965))

(declare-fun m!44521 () Bool)

(assert (=> b!51885 m!44521))

(declare-fun m!44523 () Bool)

(assert (=> b!51885 m!44523))

(declare-fun m!44525 () Bool)

(assert (=> b!51885 m!44525))

(assert (=> b!51885 m!44521))

(declare-fun m!44527 () Bool)

(assert (=> b!51885 m!44527))

(declare-fun m!44529 () Bool)

(assert (=> bm!3965 m!44529))

(assert (=> b!51887 m!44521))

(assert (=> b!51887 m!44521))

(declare-fun m!44531 () Bool)

(assert (=> b!51887 m!44531))

(assert (=> bm!3956 d!10401))

(assert (=> b!51825 d!10395))

(declare-fun d!10403 () Bool)

(declare-fun res!29629 () Bool)

(declare-fun e!33677 () Bool)

(assert (=> d!10403 (=> (not res!29629) (not e!33677))))

(assert (=> d!10403 (= res!29629 (simpleValid!39 (v!2198 (underlying!144 thiss!992))))))

(assert (=> d!10403 (= (valid!165 (v!2198 (underlying!144 thiss!992))) e!33677)))

(declare-fun b!51888 () Bool)

(declare-fun res!29630 () Bool)

(assert (=> b!51888 (=> (not res!29630) (not e!33677))))

(assert (=> b!51888 (= res!29630 (= (arrayCountValidKeys!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000 (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))) (_size!270 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51889 () Bool)

(declare-fun res!29631 () Bool)

(assert (=> b!51889 (=> (not res!29631) (not e!33677))))

(assert (=> b!51889 (= res!29631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51890 () Bool)

(assert (=> b!51890 (= e!33677 (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) #b00000000000000000000000000000000 Nil!1327))))

(assert (= (and d!10403 res!29629) b!51888))

(assert (= (and b!51888 res!29630) b!51889))

(assert (= (and b!51889 res!29631) b!51890))

(declare-fun m!44533 () Bool)

(assert (=> d!10403 m!44533))

(declare-fun m!44535 () Bool)

(assert (=> b!51888 m!44535))

(assert (=> b!51889 m!44423))

(assert (=> b!51890 m!44407))

(assert (=> d!10373 d!10403))

(declare-fun b!51891 () Bool)

(declare-fun e!33678 () Bool)

(declare-fun e!33679 () Bool)

(assert (=> b!51891 (= e!33678 e!33679)))

(declare-fun res!29634 () Bool)

(assert (=> b!51891 (=> (not res!29634) (not e!33679))))

(declare-fun e!33681 () Bool)

(assert (=> b!51891 (= res!29634 (not e!33681))))

(declare-fun res!29633 () Bool)

(assert (=> b!51891 (=> (not res!29633) (not e!33681))))

(assert (=> b!51891 (= res!29633 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!3969 () Bool)

(declare-fun c!6920 () Bool)

(declare-fun bm!3966 () Bool)

(assert (=> bm!3966 (= call!3969 (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6920 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6910 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327)) (ite c!6910 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327))))))

(declare-fun b!51892 () Bool)

(assert (=> b!51892 (= e!33681 (contains!620 (ite c!6910 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10405 () Bool)

(declare-fun res!29632 () Bool)

(assert (=> d!10405 (=> res!29632 e!33678)))

(assert (=> d!10405 (= res!29632 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))))

(assert (=> d!10405 (= (arrayNoDuplicates!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6910 (Cons!1326 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327)) e!33678)))

(declare-fun b!51893 () Bool)

(declare-fun e!33680 () Bool)

(assert (=> b!51893 (= e!33680 call!3969)))

(declare-fun b!51894 () Bool)

(assert (=> b!51894 (= e!33679 e!33680)))

(assert (=> b!51894 (= c!6920 (validKeyInArray!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51895 () Bool)

(assert (=> b!51895 (= e!33680 call!3969)))

(assert (= (and d!10405 (not res!29632)) b!51891))

(assert (= (and b!51891 res!29633) b!51892))

(assert (= (and b!51891 res!29634) b!51894))

(assert (= (and b!51894 c!6920) b!51893))

(assert (= (and b!51894 (not c!6920)) b!51895))

(assert (= (or b!51893 b!51895) bm!3966))

(assert (=> b!51891 m!44521))

(assert (=> b!51891 m!44521))

(assert (=> b!51891 m!44531))

(assert (=> bm!3966 m!44521))

(declare-fun m!44537 () Bool)

(assert (=> bm!3966 m!44537))

(assert (=> b!51892 m!44521))

(assert (=> b!51892 m!44521))

(declare-fun m!44539 () Bool)

(assert (=> b!51892 m!44539))

(assert (=> b!51894 m!44521))

(assert (=> b!51894 m!44521))

(assert (=> b!51894 m!44531))

(assert (=> bm!3959 d!10405))

(declare-fun d!10407 () Bool)

(declare-fun lt!21221 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!60 (List!1330) (InoxSet (_ BitVec 64)))

(assert (=> d!10407 (= lt!21221 (select (content!60 Nil!1327) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33687 () Bool)

(assert (=> d!10407 (= lt!21221 e!33687)))

(declare-fun res!29639 () Bool)

(assert (=> d!10407 (=> (not res!29639) (not e!33687))))

(assert (=> d!10407 (= res!29639 ((_ is Cons!1326) Nil!1327))))

(assert (=> d!10407 (= (contains!620 Nil!1327 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)) lt!21221)))

(declare-fun b!51900 () Bool)

(declare-fun e!33686 () Bool)

(assert (=> b!51900 (= e!33687 e!33686)))

(declare-fun res!29640 () Bool)

(assert (=> b!51900 (=> res!29640 e!33686)))

(assert (=> b!51900 (= res!29640 (= (h!1906 Nil!1327) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51901 () Bool)

(assert (=> b!51901 (= e!33686 (contains!620 (t!4363 Nil!1327) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10407 res!29639) b!51900))

(assert (= (and b!51900 (not res!29640)) b!51901))

(declare-fun m!44541 () Bool)

(assert (=> d!10407 m!44541))

(assert (=> d!10407 m!44479))

(declare-fun m!44543 () Bool)

(assert (=> d!10407 m!44543))

(assert (=> b!51901 m!44479))

(declare-fun m!44545 () Bool)

(assert (=> b!51901 m!44545))

(assert (=> b!51837 d!10407))

(declare-fun d!10409 () Bool)

(assert (=> d!10409 (arrayContainsKey!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000)))

(declare-fun lt!21224 () Unit!1434)

(declare-fun choose!13 (array!3343 (_ BitVec 64) (_ BitVec 32)) Unit!1434)

(assert (=> d!10409 (= lt!21224 (choose!13 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000))))

(assert (=> d!10409 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10409 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000) lt!21224)))

(declare-fun bs!2386 () Bool)

(assert (= bs!2386 d!10409))

(assert (=> bs!2386 m!44483))

(declare-fun m!44547 () Bool)

(assert (=> bs!2386 m!44547))

(assert (=> b!51823 d!10409))

(declare-fun d!10411 () Bool)

(declare-fun res!29645 () Bool)

(declare-fun e!33692 () Bool)

(assert (=> d!10411 (=> res!29645 e!33692)))

(assert (=> d!10411 (= res!29645 (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) lt!21208))))

(assert (=> d!10411 (= (arrayContainsKey!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 #b00000000000000000000000000000000) e!33692)))

(declare-fun b!51906 () Bool)

(declare-fun e!33693 () Bool)

(assert (=> b!51906 (= e!33692 e!33693)))

(declare-fun res!29646 () Bool)

(assert (=> b!51906 (=> (not res!29646) (not e!33693))))

(assert (=> b!51906 (= res!29646 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))))

(declare-fun b!51907 () Bool)

(assert (=> b!51907 (= e!33693 (arrayContainsKey!0 (_keys!3552 (v!2198 (underlying!144 thiss!992))) lt!21208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10411 (not res!29645)) b!51906))

(assert (= (and b!51906 res!29646) b!51907))

(assert (=> d!10411 m!44479))

(declare-fun m!44549 () Bool)

(assert (=> b!51907 m!44549))

(assert (=> b!51823 d!10411))

(declare-fun d!10413 () Bool)

(declare-fun lt!21231 () SeekEntryResult!227)

(assert (=> d!10413 (and (or ((_ is Undefined!227) lt!21231) (not ((_ is Found!227) lt!21231)) (and (bvsge (index!3031 lt!21231) #b00000000000000000000000000000000) (bvslt (index!3031 lt!21231) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))) (or ((_ is Undefined!227) lt!21231) ((_ is Found!227) lt!21231) (not ((_ is MissingZero!227) lt!21231)) (and (bvsge (index!3030 lt!21231) #b00000000000000000000000000000000) (bvslt (index!3030 lt!21231) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))) (or ((_ is Undefined!227) lt!21231) ((_ is Found!227) lt!21231) ((_ is MissingZero!227) lt!21231) (not ((_ is MissingVacant!227) lt!21231)) (and (bvsge (index!3033 lt!21231) #b00000000000000000000000000000000) (bvslt (index!3033 lt!21231) (size!1823 (_keys!3552 (v!2198 (underlying!144 thiss!992))))))) (or ((_ is Undefined!227) lt!21231) (ite ((_ is Found!227) lt!21231) (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (index!3031 lt!21231)) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!227) lt!21231) (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (index!3030 lt!21231)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!227) lt!21231) (= (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (index!3033 lt!21231)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!33701 () SeekEntryResult!227)

(assert (=> d!10413 (= lt!21231 e!33701)))

(declare-fun c!6928 () Bool)

(declare-fun lt!21232 () SeekEntryResult!227)

(assert (=> d!10413 (= c!6928 (and ((_ is Intermediate!227) lt!21232) (undefined!1039 lt!21232)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3343 (_ BitVec 32)) SeekEntryResult!227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10413 (= lt!21232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) (mask!5748 (v!2198 (underlying!144 thiss!992)))) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(assert (=> d!10413 (validMask!0 (mask!5748 (v!2198 (underlying!144 thiss!992))))))

(assert (=> d!10413 (= (seekEntryOrOpen!0 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))) lt!21231)))

(declare-fun b!51920 () Bool)

(declare-fun c!6927 () Bool)

(declare-fun lt!21233 () (_ BitVec 64))

(assert (=> b!51920 (= c!6927 (= lt!21233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33702 () SeekEntryResult!227)

(declare-fun e!33700 () SeekEntryResult!227)

(assert (=> b!51920 (= e!33702 e!33700)))

(declare-fun b!51921 () Bool)

(assert (=> b!51921 (= e!33701 Undefined!227)))

(declare-fun b!51922 () Bool)

(assert (=> b!51922 (= e!33702 (Found!227 (index!3032 lt!21232)))))

(declare-fun b!51923 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3343 (_ BitVec 32)) SeekEntryResult!227)

(assert (=> b!51923 (= e!33700 (seekKeyOrZeroReturnVacant!0 (x!9426 lt!21232) (index!3032 lt!21232) (index!3032 lt!21232) (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000) (_keys!3552 (v!2198 (underlying!144 thiss!992))) (mask!5748 (v!2198 (underlying!144 thiss!992)))))))

(declare-fun b!51924 () Bool)

(assert (=> b!51924 (= e!33701 e!33702)))

(assert (=> b!51924 (= lt!21233 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) (index!3032 lt!21232)))))

(declare-fun c!6929 () Bool)

(assert (=> b!51924 (= c!6929 (= lt!21233 (select (arr!1594 (_keys!3552 (v!2198 (underlying!144 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51925 () Bool)

(assert (=> b!51925 (= e!33700 (MissingZero!227 (index!3032 lt!21232)))))

(assert (= (and d!10413 c!6928) b!51921))

(assert (= (and d!10413 (not c!6928)) b!51924))

(assert (= (and b!51924 c!6929) b!51922))

(assert (= (and b!51924 (not c!6929)) b!51920))

(assert (= (and b!51920 c!6927) b!51925))

(assert (= (and b!51920 (not c!6927)) b!51923))

(assert (=> d!10413 m!44479))

(declare-fun m!44551 () Bool)

(assert (=> d!10413 m!44551))

(declare-fun m!44553 () Bool)

(assert (=> d!10413 m!44553))

(assert (=> d!10413 m!44551))

(assert (=> d!10413 m!44479))

(declare-fun m!44555 () Bool)

(assert (=> d!10413 m!44555))

(declare-fun m!44557 () Bool)

(assert (=> d!10413 m!44557))

(assert (=> d!10413 m!44403))

(declare-fun m!44559 () Bool)

(assert (=> d!10413 m!44559))

(assert (=> b!51923 m!44479))

(declare-fun m!44561 () Bool)

(assert (=> b!51923 m!44561))

(declare-fun m!44563 () Bool)

(assert (=> b!51924 m!44563))

(assert (=> b!51823 d!10413))

(declare-fun mapNonEmpty!2345 () Bool)

(declare-fun mapRes!2345 () Bool)

(declare-fun tp!6953 () Bool)

(declare-fun e!33704 () Bool)

(assert (=> mapNonEmpty!2345 (= mapRes!2345 (and tp!6953 e!33704))))

(declare-fun mapKey!2345 () (_ BitVec 32))

(declare-fun mapRest!2345 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapValue!2345 () ValueCell!767)

(assert (=> mapNonEmpty!2345 (= mapRest!2344 (store mapRest!2345 mapKey!2345 mapValue!2345))))

(declare-fun b!51926 () Bool)

(assert (=> b!51926 (= e!33704 tp_is_empty!2221)))

(declare-fun b!51927 () Bool)

(declare-fun e!33703 () Bool)

(assert (=> b!51927 (= e!33703 tp_is_empty!2221)))

(declare-fun condMapEmpty!2345 () Bool)

(declare-fun mapDefault!2345 () ValueCell!767)

(assert (=> mapNonEmpty!2344 (= condMapEmpty!2345 (= mapRest!2344 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2345)))))

(assert (=> mapNonEmpty!2344 (= tp!6952 (and e!33703 mapRes!2345))))

(declare-fun mapIsEmpty!2345 () Bool)

(assert (=> mapIsEmpty!2345 mapRes!2345))

(assert (= (and mapNonEmpty!2344 condMapEmpty!2345) mapIsEmpty!2345))

(assert (= (and mapNonEmpty!2344 (not condMapEmpty!2345)) mapNonEmpty!2345))

(assert (= (and mapNonEmpty!2345 ((_ is ValueCellFull!767) mapValue!2345)) b!51926))

(assert (= (and mapNonEmpty!2344 ((_ is ValueCellFull!767) mapDefault!2345)) b!51927))

(declare-fun m!44565 () Bool)

(assert (=> mapNonEmpty!2345 m!44565))

(declare-fun mapNonEmpty!2346 () Bool)

(declare-fun mapRes!2346 () Bool)

(declare-fun tp!6954 () Bool)

(declare-fun e!33706 () Bool)

(assert (=> mapNonEmpty!2346 (= mapRes!2346 (and tp!6954 e!33706))))

(declare-fun mapRest!2346 () (Array (_ BitVec 32) ValueCell!767))

(declare-fun mapValue!2346 () ValueCell!767)

(declare-fun mapKey!2346 () (_ BitVec 32))

(assert (=> mapNonEmpty!2346 (= mapRest!2343 (store mapRest!2346 mapKey!2346 mapValue!2346))))

(declare-fun b!51928 () Bool)

(assert (=> b!51928 (= e!33706 tp_is_empty!2221)))

(declare-fun b!51929 () Bool)

(declare-fun e!33705 () Bool)

(assert (=> b!51929 (= e!33705 tp_is_empty!2221)))

(declare-fun condMapEmpty!2346 () Bool)

(declare-fun mapDefault!2346 () ValueCell!767)

(assert (=> mapNonEmpty!2343 (= condMapEmpty!2346 (= mapRest!2343 ((as const (Array (_ BitVec 32) ValueCell!767)) mapDefault!2346)))))

(assert (=> mapNonEmpty!2343 (= tp!6951 (and e!33705 mapRes!2346))))

(declare-fun mapIsEmpty!2346 () Bool)

(assert (=> mapIsEmpty!2346 mapRes!2346))

(assert (= (and mapNonEmpty!2343 condMapEmpty!2346) mapIsEmpty!2346))

(assert (= (and mapNonEmpty!2343 (not condMapEmpty!2346)) mapNonEmpty!2346))

(assert (= (and mapNonEmpty!2346 ((_ is ValueCellFull!767) mapValue!2346)) b!51928))

(assert (= (and mapNonEmpty!2343 ((_ is ValueCellFull!767) mapDefault!2346)) b!51929))

(declare-fun m!44567 () Bool)

(assert (=> mapNonEmpty!2346 m!44567))

(check-sat (not d!10409) (not bm!3961) (not d!10407) (not b!51891) (not bm!3965) (not b!51890) (not b_next!1611) (not b!51870) (not b!51894) (not b!51889) (not b!51901) (not mapNonEmpty!2346) (not d!10403) (not b!51880) b_and!2823 tp_is_empty!2221 b_and!2821 (not b!51858) (not bm!3964) (not b!51856) (not b!51888) (not b!51892) (not b!51855) (not bm!3960) (not b!51887) (not d!10397) (not bm!3966) (not b!51923) (not b_next!1609) (not b!51885) (not b!51854) (not d!10413) (not mapNonEmpty!2345) (not b!51869) (not b!51852) (not b!51907))
(check-sat b_and!2821 b_and!2823 (not b_next!1609) (not b_next!1611))
