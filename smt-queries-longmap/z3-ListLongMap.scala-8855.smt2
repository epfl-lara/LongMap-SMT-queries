; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107412 () Bool)

(assert start!107412)

(declare-fun b!1272527 () Bool)

(declare-fun b_free!27673 () Bool)

(declare-fun b_next!27673 () Bool)

(assert (=> b!1272527 (= b_free!27673 (not b_next!27673))))

(declare-fun tp!97540 () Bool)

(declare-fun b_and!45711 () Bool)

(assert (=> b!1272527 (= tp!97540 b_and!45711)))

(declare-fun b!1272524 () Bool)

(declare-fun e!725853 () Bool)

(declare-fun tp_is_empty!33043 () Bool)

(assert (=> b!1272524 (= e!725853 tp_is_empty!33043)))

(declare-fun b!1272525 () Bool)

(declare-fun e!725851 () Bool)

(declare-datatypes ((V!49251 0))(
  ( (V!49252 (val!16596 Int)) )
))
(declare-datatypes ((ValueCell!15668 0))(
  ( (ValueCellFull!15668 (v!19232 V!49251)) (EmptyCell!15668) )
))
(declare-datatypes ((array!83241 0))(
  ( (array!83242 (arr!40154 (Array (_ BitVec 32) ValueCell!15668)) (size!40694 (_ BitVec 32))) )
))
(declare-datatypes ((array!83243 0))(
  ( (array!83244 (arr!40155 (Array (_ BitVec 32) (_ BitVec 64))) (size!40695 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6100 0))(
  ( (LongMapFixedSize!6101 (defaultEntry!6696 Int) (mask!34443 (_ BitVec 32)) (extraKeys!6375 (_ BitVec 32)) (zeroValue!6481 V!49251) (minValue!6481 V!49251) (_size!3105 (_ BitVec 32)) (_keys!12100 array!83243) (_values!6719 array!83241) (_vacant!3105 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6100)

(assert (=> b!1272525 (= e!725851 (and (= (size!40694 (_values!6719 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34443 thiss!1559))) (not (= (size!40695 (_keys!12100 thiss!1559)) (size!40694 (_values!6719 thiss!1559))))))))

(declare-fun mapIsEmpty!51159 () Bool)

(declare-fun mapRes!51159 () Bool)

(assert (=> mapIsEmpty!51159 mapRes!51159))

(declare-fun b!1272526 () Bool)

(declare-fun e!725856 () Bool)

(assert (=> b!1272526 (= e!725856 tp_is_empty!33043)))

(declare-fun e!725852 () Bool)

(declare-fun e!725855 () Bool)

(declare-fun array_inv!30693 (array!83243) Bool)

(declare-fun array_inv!30694 (array!83241) Bool)

(assert (=> b!1272527 (= e!725852 (and tp!97540 tp_is_empty!33043 (array_inv!30693 (_keys!12100 thiss!1559)) (array_inv!30694 (_values!6719 thiss!1559)) e!725855))))

(declare-fun res!846438 () Bool)

(assert (=> start!107412 (=> (not res!846438) (not e!725851))))

(declare-fun valid!2282 (LongMapFixedSize!6100) Bool)

(assert (=> start!107412 (= res!846438 (valid!2282 thiss!1559))))

(assert (=> start!107412 e!725851))

(assert (=> start!107412 e!725852))

(declare-fun b!1272528 () Bool)

(declare-fun res!846437 () Bool)

(assert (=> b!1272528 (=> (not res!846437) (not e!725851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272528 (= res!846437 (validMask!0 (mask!34443 thiss!1559)))))

(declare-fun b!1272529 () Bool)

(assert (=> b!1272529 (= e!725855 (and e!725853 mapRes!51159))))

(declare-fun condMapEmpty!51159 () Bool)

(declare-fun mapDefault!51159 () ValueCell!15668)

(assert (=> b!1272529 (= condMapEmpty!51159 (= (arr!40154 (_values!6719 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51159)))))

(declare-fun mapNonEmpty!51159 () Bool)

(declare-fun tp!97539 () Bool)

(assert (=> mapNonEmpty!51159 (= mapRes!51159 (and tp!97539 e!725856))))

(declare-fun mapKey!51159 () (_ BitVec 32))

(declare-fun mapRest!51159 () (Array (_ BitVec 32) ValueCell!15668))

(declare-fun mapValue!51159 () ValueCell!15668)

(assert (=> mapNonEmpty!51159 (= (arr!40154 (_values!6719 thiss!1559)) (store mapRest!51159 mapKey!51159 mapValue!51159))))

(assert (= (and start!107412 res!846438) b!1272528))

(assert (= (and b!1272528 res!846437) b!1272525))

(assert (= (and b!1272529 condMapEmpty!51159) mapIsEmpty!51159))

(assert (= (and b!1272529 (not condMapEmpty!51159)) mapNonEmpty!51159))

(get-info :version)

(assert (= (and mapNonEmpty!51159 ((_ is ValueCellFull!15668) mapValue!51159)) b!1272526))

(assert (= (and b!1272529 ((_ is ValueCellFull!15668) mapDefault!51159)) b!1272524))

(assert (= b!1272527 b!1272529))

(assert (= start!107412 b!1272527))

(declare-fun m!1169683 () Bool)

(assert (=> b!1272527 m!1169683))

(declare-fun m!1169685 () Bool)

(assert (=> b!1272527 m!1169685))

(declare-fun m!1169687 () Bool)

(assert (=> start!107412 m!1169687))

(declare-fun m!1169689 () Bool)

(assert (=> b!1272528 m!1169689))

(declare-fun m!1169691 () Bool)

(assert (=> mapNonEmpty!51159 m!1169691))

(check-sat (not mapNonEmpty!51159) b_and!45711 (not b!1272527) (not b_next!27673) (not start!107412) tp_is_empty!33043 (not b!1272528))
(check-sat b_and!45711 (not b_next!27673))
(get-model)

(declare-fun d!139769 () Bool)

(assert (=> d!139769 (= (array_inv!30693 (_keys!12100 thiss!1559)) (bvsge (size!40695 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272527 d!139769))

(declare-fun d!139771 () Bool)

(assert (=> d!139771 (= (array_inv!30694 (_values!6719 thiss!1559)) (bvsge (size!40694 (_values!6719 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272527 d!139771))

(declare-fun d!139773 () Bool)

(assert (=> d!139773 (= (validMask!0 (mask!34443 thiss!1559)) (and (or (= (mask!34443 thiss!1559) #b00000000000000000000000000000111) (= (mask!34443 thiss!1559) #b00000000000000000000000000001111) (= (mask!34443 thiss!1559) #b00000000000000000000000000011111) (= (mask!34443 thiss!1559) #b00000000000000000000000000111111) (= (mask!34443 thiss!1559) #b00000000000000000000000001111111) (= (mask!34443 thiss!1559) #b00000000000000000000000011111111) (= (mask!34443 thiss!1559) #b00000000000000000000000111111111) (= (mask!34443 thiss!1559) #b00000000000000000000001111111111) (= (mask!34443 thiss!1559) #b00000000000000000000011111111111) (= (mask!34443 thiss!1559) #b00000000000000000000111111111111) (= (mask!34443 thiss!1559) #b00000000000000000001111111111111) (= (mask!34443 thiss!1559) #b00000000000000000011111111111111) (= (mask!34443 thiss!1559) #b00000000000000000111111111111111) (= (mask!34443 thiss!1559) #b00000000000000001111111111111111) (= (mask!34443 thiss!1559) #b00000000000000011111111111111111) (= (mask!34443 thiss!1559) #b00000000000000111111111111111111) (= (mask!34443 thiss!1559) #b00000000000001111111111111111111) (= (mask!34443 thiss!1559) #b00000000000011111111111111111111) (= (mask!34443 thiss!1559) #b00000000000111111111111111111111) (= (mask!34443 thiss!1559) #b00000000001111111111111111111111) (= (mask!34443 thiss!1559) #b00000000011111111111111111111111) (= (mask!34443 thiss!1559) #b00000000111111111111111111111111) (= (mask!34443 thiss!1559) #b00000001111111111111111111111111) (= (mask!34443 thiss!1559) #b00000011111111111111111111111111) (= (mask!34443 thiss!1559) #b00000111111111111111111111111111) (= (mask!34443 thiss!1559) #b00001111111111111111111111111111) (= (mask!34443 thiss!1559) #b00011111111111111111111111111111) (= (mask!34443 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34443 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272528 d!139773))

(declare-fun d!139775 () Bool)

(declare-fun res!846457 () Bool)

(declare-fun e!725895 () Bool)

(assert (=> d!139775 (=> (not res!846457) (not e!725895))))

(declare-fun simpleValid!457 (LongMapFixedSize!6100) Bool)

(assert (=> d!139775 (= res!846457 (simpleValid!457 thiss!1559))))

(assert (=> d!139775 (= (valid!2282 thiss!1559) e!725895)))

(declare-fun b!1272572 () Bool)

(declare-fun res!846458 () Bool)

(assert (=> b!1272572 (=> (not res!846458) (not e!725895))))

(declare-fun arrayCountValidKeys!0 (array!83243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272572 (= res!846458 (= (arrayCountValidKeys!0 (_keys!12100 thiss!1559) #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))) (_size!3105 thiss!1559)))))

(declare-fun b!1272573 () Bool)

(declare-fun res!846459 () Bool)

(assert (=> b!1272573 (=> (not res!846459) (not e!725895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83243 (_ BitVec 32)) Bool)

(assert (=> b!1272573 (= res!846459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12100 thiss!1559) (mask!34443 thiss!1559)))))

(declare-fun b!1272574 () Bool)

(declare-datatypes ((List!28632 0))(
  ( (Nil!28629) (Cons!28628 (h!29837 (_ BitVec 64)) (t!42157 List!28632)) )
))
(declare-fun arrayNoDuplicates!0 (array!83243 (_ BitVec 32) List!28632) Bool)

(assert (=> b!1272574 (= e!725895 (arrayNoDuplicates!0 (_keys!12100 thiss!1559) #b00000000000000000000000000000000 Nil!28629))))

(assert (= (and d!139775 res!846457) b!1272572))

(assert (= (and b!1272572 res!846458) b!1272573))

(assert (= (and b!1272573 res!846459) b!1272574))

(declare-fun m!1169713 () Bool)

(assert (=> d!139775 m!1169713))

(declare-fun m!1169715 () Bool)

(assert (=> b!1272572 m!1169715))

(declare-fun m!1169717 () Bool)

(assert (=> b!1272573 m!1169717))

(declare-fun m!1169719 () Bool)

(assert (=> b!1272574 m!1169719))

(assert (=> start!107412 d!139775))

(declare-fun condMapEmpty!51168 () Bool)

(declare-fun mapDefault!51168 () ValueCell!15668)

(assert (=> mapNonEmpty!51159 (= condMapEmpty!51168 (= mapRest!51159 ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51168)))))

(declare-fun e!725900 () Bool)

(declare-fun mapRes!51168 () Bool)

(assert (=> mapNonEmpty!51159 (= tp!97539 (and e!725900 mapRes!51168))))

(declare-fun mapNonEmpty!51168 () Bool)

(declare-fun tp!97555 () Bool)

(declare-fun e!725901 () Bool)

(assert (=> mapNonEmpty!51168 (= mapRes!51168 (and tp!97555 e!725901))))

(declare-fun mapRest!51168 () (Array (_ BitVec 32) ValueCell!15668))

(declare-fun mapValue!51168 () ValueCell!15668)

(declare-fun mapKey!51168 () (_ BitVec 32))

(assert (=> mapNonEmpty!51168 (= mapRest!51159 (store mapRest!51168 mapKey!51168 mapValue!51168))))

(declare-fun b!1272581 () Bool)

(assert (=> b!1272581 (= e!725901 tp_is_empty!33043)))

(declare-fun b!1272582 () Bool)

(assert (=> b!1272582 (= e!725900 tp_is_empty!33043)))

(declare-fun mapIsEmpty!51168 () Bool)

(assert (=> mapIsEmpty!51168 mapRes!51168))

(assert (= (and mapNonEmpty!51159 condMapEmpty!51168) mapIsEmpty!51168))

(assert (= (and mapNonEmpty!51159 (not condMapEmpty!51168)) mapNonEmpty!51168))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15668) mapValue!51168)) b!1272581))

(assert (= (and mapNonEmpty!51159 ((_ is ValueCellFull!15668) mapDefault!51168)) b!1272582))

(declare-fun m!1169721 () Bool)

(assert (=> mapNonEmpty!51168 m!1169721))

(check-sat (not d!139775) b_and!45711 (not b!1272574) (not b!1272573) (not mapNonEmpty!51168) tp_is_empty!33043 (not b!1272572) (not b_next!27673))
(check-sat b_and!45711 (not b_next!27673))
(get-model)

(declare-fun b!1272593 () Bool)

(declare-fun e!725911 () Bool)

(declare-fun call!62539 () Bool)

(assert (=> b!1272593 (= e!725911 call!62539)))

(declare-fun bm!62536 () Bool)

(declare-fun c!123695 () Bool)

(assert (=> bm!62536 (= call!62539 (arrayNoDuplicates!0 (_keys!12100 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123695 (Cons!28628 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000) Nil!28629) Nil!28629)))))

(declare-fun b!1272594 () Bool)

(declare-fun e!725912 () Bool)

(assert (=> b!1272594 (= e!725912 e!725911)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272594 (= c!123695 (validKeyInArray!0 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139777 () Bool)

(declare-fun res!846466 () Bool)

(declare-fun e!725910 () Bool)

(assert (=> d!139777 (=> res!846466 e!725910)))

(assert (=> d!139777 (= res!846466 (bvsge #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))))))

(assert (=> d!139777 (= (arrayNoDuplicates!0 (_keys!12100 thiss!1559) #b00000000000000000000000000000000 Nil!28629) e!725910)))

(declare-fun b!1272595 () Bool)

(assert (=> b!1272595 (= e!725911 call!62539)))

(declare-fun b!1272596 () Bool)

(declare-fun e!725913 () Bool)

(declare-fun contains!7639 (List!28632 (_ BitVec 64)) Bool)

(assert (=> b!1272596 (= e!725913 (contains!7639 Nil!28629 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272597 () Bool)

(assert (=> b!1272597 (= e!725910 e!725912)))

(declare-fun res!846468 () Bool)

(assert (=> b!1272597 (=> (not res!846468) (not e!725912))))

(assert (=> b!1272597 (= res!846468 (not e!725913))))

(declare-fun res!846467 () Bool)

(assert (=> b!1272597 (=> (not res!846467) (not e!725913))))

(assert (=> b!1272597 (= res!846467 (validKeyInArray!0 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139777 (not res!846466)) b!1272597))

(assert (= (and b!1272597 res!846467) b!1272596))

(assert (= (and b!1272597 res!846468) b!1272594))

(assert (= (and b!1272594 c!123695) b!1272595))

(assert (= (and b!1272594 (not c!123695)) b!1272593))

(assert (= (or b!1272595 b!1272593) bm!62536))

(declare-fun m!1169723 () Bool)

(assert (=> bm!62536 m!1169723))

(declare-fun m!1169725 () Bool)

(assert (=> bm!62536 m!1169725))

(assert (=> b!1272594 m!1169723))

(assert (=> b!1272594 m!1169723))

(declare-fun m!1169727 () Bool)

(assert (=> b!1272594 m!1169727))

(assert (=> b!1272596 m!1169723))

(assert (=> b!1272596 m!1169723))

(declare-fun m!1169729 () Bool)

(assert (=> b!1272596 m!1169729))

(assert (=> b!1272597 m!1169723))

(assert (=> b!1272597 m!1169723))

(assert (=> b!1272597 m!1169727))

(assert (=> b!1272574 d!139777))

(declare-fun bm!62539 () Bool)

(declare-fun call!62542 () Bool)

(assert (=> bm!62539 (= call!62542 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12100 thiss!1559) (mask!34443 thiss!1559)))))

(declare-fun b!1272606 () Bool)

(declare-fun e!725920 () Bool)

(assert (=> b!1272606 (= e!725920 call!62542)))

(declare-fun b!1272607 () Bool)

(declare-fun e!725922 () Bool)

(assert (=> b!1272607 (= e!725920 e!725922)))

(declare-fun lt!574898 () (_ BitVec 64))

(assert (=> b!1272607 (= lt!574898 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42168 0))(
  ( (Unit!42169) )
))
(declare-fun lt!574899 () Unit!42168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83243 (_ BitVec 64) (_ BitVec 32)) Unit!42168)

(assert (=> b!1272607 (= lt!574899 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12100 thiss!1559) lt!574898 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272607 (arrayContainsKey!0 (_keys!12100 thiss!1559) lt!574898 #b00000000000000000000000000000000)))

(declare-fun lt!574897 () Unit!42168)

(assert (=> b!1272607 (= lt!574897 lt!574899)))

(declare-fun res!846474 () Bool)

(declare-datatypes ((SeekEntryResult!9990 0))(
  ( (MissingZero!9990 (index!42331 (_ BitVec 32))) (Found!9990 (index!42332 (_ BitVec 32))) (Intermediate!9990 (undefined!10802 Bool) (index!42333 (_ BitVec 32)) (x!112452 (_ BitVec 32))) (Undefined!9990) (MissingVacant!9990 (index!42334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83243 (_ BitVec 32)) SeekEntryResult!9990)

(assert (=> b!1272607 (= res!846474 (= (seekEntryOrOpen!0 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000) (_keys!12100 thiss!1559) (mask!34443 thiss!1559)) (Found!9990 #b00000000000000000000000000000000)))))

(assert (=> b!1272607 (=> (not res!846474) (not e!725922))))

(declare-fun b!1272608 () Bool)

(assert (=> b!1272608 (= e!725922 call!62542)))

(declare-fun b!1272609 () Bool)

(declare-fun e!725921 () Bool)

(assert (=> b!1272609 (= e!725921 e!725920)))

(declare-fun c!123698 () Bool)

(assert (=> b!1272609 (= c!123698 (validKeyInArray!0 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139779 () Bool)

(declare-fun res!846473 () Bool)

(assert (=> d!139779 (=> res!846473 e!725921)))

(assert (=> d!139779 (= res!846473 (bvsge #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))))))

(assert (=> d!139779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12100 thiss!1559) (mask!34443 thiss!1559)) e!725921)))

(assert (= (and d!139779 (not res!846473)) b!1272609))

(assert (= (and b!1272609 c!123698) b!1272607))

(assert (= (and b!1272609 (not c!123698)) b!1272606))

(assert (= (and b!1272607 res!846474) b!1272608))

(assert (= (or b!1272608 b!1272606) bm!62539))

(declare-fun m!1169731 () Bool)

(assert (=> bm!62539 m!1169731))

(assert (=> b!1272607 m!1169723))

(declare-fun m!1169733 () Bool)

(assert (=> b!1272607 m!1169733))

(declare-fun m!1169735 () Bool)

(assert (=> b!1272607 m!1169735))

(assert (=> b!1272607 m!1169723))

(declare-fun m!1169737 () Bool)

(assert (=> b!1272607 m!1169737))

(assert (=> b!1272609 m!1169723))

(assert (=> b!1272609 m!1169723))

(assert (=> b!1272609 m!1169727))

(assert (=> b!1272573 d!139779))

(declare-fun b!1272621 () Bool)

(declare-fun e!725925 () Bool)

(assert (=> b!1272621 (= e!725925 (and (bvsge (extraKeys!6375 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6375 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3105 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272618 () Bool)

(declare-fun res!846484 () Bool)

(assert (=> b!1272618 (=> (not res!846484) (not e!725925))))

(assert (=> b!1272618 (= res!846484 (and (= (size!40694 (_values!6719 thiss!1559)) (bvadd (mask!34443 thiss!1559) #b00000000000000000000000000000001)) (= (size!40695 (_keys!12100 thiss!1559)) (size!40694 (_values!6719 thiss!1559))) (bvsge (_size!3105 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3105 thiss!1559) (bvadd (mask!34443 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272619 () Bool)

(declare-fun res!846486 () Bool)

(assert (=> b!1272619 (=> (not res!846486) (not e!725925))))

(declare-fun size!40700 (LongMapFixedSize!6100) (_ BitVec 32))

(assert (=> b!1272619 (= res!846486 (bvsge (size!40700 thiss!1559) (_size!3105 thiss!1559)))))

(declare-fun b!1272620 () Bool)

(declare-fun res!846483 () Bool)

(assert (=> b!1272620 (=> (not res!846483) (not e!725925))))

(assert (=> b!1272620 (= res!846483 (= (size!40700 thiss!1559) (bvadd (_size!3105 thiss!1559) (bvsdiv (bvadd (extraKeys!6375 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!139781 () Bool)

(declare-fun res!846485 () Bool)

(assert (=> d!139781 (=> (not res!846485) (not e!725925))))

(assert (=> d!139781 (= res!846485 (validMask!0 (mask!34443 thiss!1559)))))

(assert (=> d!139781 (= (simpleValid!457 thiss!1559) e!725925)))

(assert (= (and d!139781 res!846485) b!1272618))

(assert (= (and b!1272618 res!846484) b!1272619))

(assert (= (and b!1272619 res!846486) b!1272620))

(assert (= (and b!1272620 res!846483) b!1272621))

(declare-fun m!1169739 () Bool)

(assert (=> b!1272619 m!1169739))

(assert (=> b!1272620 m!1169739))

(assert (=> d!139781 m!1169689))

(assert (=> d!139775 d!139781))

(declare-fun bm!62542 () Bool)

(declare-fun call!62545 () (_ BitVec 32))

(assert (=> bm!62542 (= call!62545 (arrayCountValidKeys!0 (_keys!12100 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40695 (_keys!12100 thiss!1559))))))

(declare-fun b!1272630 () Bool)

(declare-fun e!725931 () (_ BitVec 32))

(declare-fun e!725930 () (_ BitVec 32))

(assert (=> b!1272630 (= e!725931 e!725930)))

(declare-fun c!123703 () Bool)

(assert (=> b!1272630 (= c!123703 (validKeyInArray!0 (select (arr!40155 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272631 () Bool)

(assert (=> b!1272631 (= e!725930 (bvadd #b00000000000000000000000000000001 call!62545))))

(declare-fun b!1272632 () Bool)

(assert (=> b!1272632 (= e!725931 #b00000000000000000000000000000000)))

(declare-fun b!1272633 () Bool)

(assert (=> b!1272633 (= e!725930 call!62545)))

(declare-fun d!139783 () Bool)

(declare-fun lt!574902 () (_ BitVec 32))

(assert (=> d!139783 (and (bvsge lt!574902 #b00000000000000000000000000000000) (bvsle lt!574902 (bvsub (size!40695 (_keys!12100 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139783 (= lt!574902 e!725931)))

(declare-fun c!123704 () Bool)

(assert (=> d!139783 (= c!123704 (bvsge #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))))))

(assert (=> d!139783 (and (bvsle #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40695 (_keys!12100 thiss!1559)) (size!40695 (_keys!12100 thiss!1559))))))

(assert (=> d!139783 (= (arrayCountValidKeys!0 (_keys!12100 thiss!1559) #b00000000000000000000000000000000 (size!40695 (_keys!12100 thiss!1559))) lt!574902)))

(assert (= (and d!139783 c!123704) b!1272632))

(assert (= (and d!139783 (not c!123704)) b!1272630))

(assert (= (and b!1272630 c!123703) b!1272631))

(assert (= (and b!1272630 (not c!123703)) b!1272633))

(assert (= (or b!1272631 b!1272633) bm!62542))

(declare-fun m!1169741 () Bool)

(assert (=> bm!62542 m!1169741))

(assert (=> b!1272630 m!1169723))

(assert (=> b!1272630 m!1169723))

(assert (=> b!1272630 m!1169727))

(assert (=> b!1272572 d!139783))

(declare-fun condMapEmpty!51169 () Bool)

(declare-fun mapDefault!51169 () ValueCell!15668)

(assert (=> mapNonEmpty!51168 (= condMapEmpty!51169 (= mapRest!51168 ((as const (Array (_ BitVec 32) ValueCell!15668)) mapDefault!51169)))))

(declare-fun e!725932 () Bool)

(declare-fun mapRes!51169 () Bool)

(assert (=> mapNonEmpty!51168 (= tp!97555 (and e!725932 mapRes!51169))))

(declare-fun mapNonEmpty!51169 () Bool)

(declare-fun tp!97556 () Bool)

(declare-fun e!725933 () Bool)

(assert (=> mapNonEmpty!51169 (= mapRes!51169 (and tp!97556 e!725933))))

(declare-fun mapKey!51169 () (_ BitVec 32))

(declare-fun mapRest!51169 () (Array (_ BitVec 32) ValueCell!15668))

(declare-fun mapValue!51169 () ValueCell!15668)

(assert (=> mapNonEmpty!51169 (= mapRest!51168 (store mapRest!51169 mapKey!51169 mapValue!51169))))

(declare-fun b!1272634 () Bool)

(assert (=> b!1272634 (= e!725933 tp_is_empty!33043)))

(declare-fun b!1272635 () Bool)

(assert (=> b!1272635 (= e!725932 tp_is_empty!33043)))

(declare-fun mapIsEmpty!51169 () Bool)

(assert (=> mapIsEmpty!51169 mapRes!51169))

(assert (= (and mapNonEmpty!51168 condMapEmpty!51169) mapIsEmpty!51169))

(assert (= (and mapNonEmpty!51168 (not condMapEmpty!51169)) mapNonEmpty!51169))

(assert (= (and mapNonEmpty!51169 ((_ is ValueCellFull!15668) mapValue!51169)) b!1272634))

(assert (= (and mapNonEmpty!51168 ((_ is ValueCellFull!15668) mapDefault!51169)) b!1272635))

(declare-fun m!1169743 () Bool)

(assert (=> mapNonEmpty!51169 m!1169743))

(check-sat (not b!1272594) (not b!1272597) (not mapNonEmpty!51169) (not b!1272596) (not b!1272609) (not b_next!27673) tp_is_empty!33043 (not d!139781) (not b!1272620) (not bm!62542) (not b!1272607) (not bm!62539) (not b!1272619) (not b!1272630) (not bm!62536) b_and!45711)
(check-sat b_and!45711 (not b_next!27673))
