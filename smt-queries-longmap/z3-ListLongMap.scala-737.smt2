; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17186 () Bool)

(assert start!17186)

(declare-fun b!172567 () Bool)

(declare-fun b_free!4261 () Bool)

(declare-fun b_next!4261 () Bool)

(assert (=> b!172567 (= b_free!4261 (not b_next!4261))))

(declare-fun tp!15433 () Bool)

(declare-fun b_and!10715 () Bool)

(assert (=> b!172567 (= tp!15433 b_and!10715)))

(declare-fun b!172566 () Bool)

(declare-fun res!81938 () Bool)

(declare-fun e!113912 () Bool)

(assert (=> b!172566 (=> (not res!81938) (not e!113912))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172566 (= res!81938 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!113913 () Bool)

(declare-datatypes ((V!5025 0))(
  ( (V!5026 (val!2061 Int)) )
))
(declare-datatypes ((ValueCell!1673 0))(
  ( (ValueCellFull!1673 (v!3930 V!5025)) (EmptyCell!1673) )
))
(declare-datatypes ((array!7175 0))(
  ( (array!7176 (arr!3410 (Array (_ BitVec 32) (_ BitVec 64))) (size!3707 (_ BitVec 32))) )
))
(declare-datatypes ((array!7177 0))(
  ( (array!7178 (arr!3411 (Array (_ BitVec 32) ValueCell!1673)) (size!3708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2254 0))(
  ( (LongMapFixedSize!2255 (defaultEntry!3573 Int) (mask!8421 (_ BitVec 32)) (extraKeys!3312 (_ BitVec 32)) (zeroValue!3414 V!5025) (minValue!3416 V!5025) (_size!1176 (_ BitVec 32)) (_keys!5410 array!7175) (_values!3556 array!7177) (_vacant!1176 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2254)

(declare-fun e!113909 () Bool)

(declare-fun tp_is_empty!4033 () Bool)

(declare-fun array_inv!2193 (array!7175) Bool)

(declare-fun array_inv!2194 (array!7177) Bool)

(assert (=> b!172567 (= e!113909 (and tp!15433 tp_is_empty!4033 (array_inv!2193 (_keys!5410 thiss!1248)) (array_inv!2194 (_values!3556 thiss!1248)) e!113913))))

(declare-fun b!172568 () Bool)

(declare-fun res!81939 () Bool)

(assert (=> b!172568 (=> (not res!81939) (not e!113912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172568 (= res!81939 (validMask!0 (mask!8421 thiss!1248)))))

(declare-fun res!81937 () Bool)

(assert (=> start!17186 (=> (not res!81937) (not e!113912))))

(declare-fun valid!972 (LongMapFixedSize!2254) Bool)

(assert (=> start!17186 (= res!81937 (valid!972 thiss!1248))))

(assert (=> start!17186 e!113912))

(assert (=> start!17186 e!113909))

(assert (=> start!17186 true))

(declare-fun mapIsEmpty!6862 () Bool)

(declare-fun mapRes!6862 () Bool)

(assert (=> mapIsEmpty!6862 mapRes!6862))

(declare-fun b!172569 () Bool)

(declare-fun e!113910 () Bool)

(assert (=> b!172569 (= e!113913 (and e!113910 mapRes!6862))))

(declare-fun condMapEmpty!6862 () Bool)

(declare-fun mapDefault!6862 () ValueCell!1673)

(assert (=> b!172569 (= condMapEmpty!6862 (= (arr!3411 (_values!3556 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6862)))))

(declare-fun b!172570 () Bool)

(declare-fun e!113911 () Bool)

(assert (=> b!172570 (= e!113911 tp_is_empty!4033)))

(declare-fun b!172571 () Bool)

(assert (=> b!172571 (= e!113910 tp_is_empty!4033)))

(declare-fun b!172572 () Bool)

(assert (=> b!172572 (= e!113912 (and (= (size!3708 (_values!3556 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8421 thiss!1248))) (= (size!3707 (_keys!5410 thiss!1248)) (size!3708 (_values!3556 thiss!1248))) (bvsge (mask!8421 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3312 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6862 () Bool)

(declare-fun tp!15432 () Bool)

(assert (=> mapNonEmpty!6862 (= mapRes!6862 (and tp!15432 e!113911))))

(declare-fun mapValue!6862 () ValueCell!1673)

(declare-fun mapRest!6862 () (Array (_ BitVec 32) ValueCell!1673))

(declare-fun mapKey!6862 () (_ BitVec 32))

(assert (=> mapNonEmpty!6862 (= (arr!3411 (_values!3556 thiss!1248)) (store mapRest!6862 mapKey!6862 mapValue!6862))))

(assert (= (and start!17186 res!81937) b!172566))

(assert (= (and b!172566 res!81938) b!172568))

(assert (= (and b!172568 res!81939) b!172572))

(assert (= (and b!172569 condMapEmpty!6862) mapIsEmpty!6862))

(assert (= (and b!172569 (not condMapEmpty!6862)) mapNonEmpty!6862))

(get-info :version)

(assert (= (and mapNonEmpty!6862 ((_ is ValueCellFull!1673) mapValue!6862)) b!172570))

(assert (= (and b!172569 ((_ is ValueCellFull!1673) mapDefault!6862)) b!172571))

(assert (= b!172567 b!172569))

(assert (= start!17186 b!172567))

(declare-fun m!201451 () Bool)

(assert (=> b!172567 m!201451))

(declare-fun m!201453 () Bool)

(assert (=> b!172567 m!201453))

(declare-fun m!201455 () Bool)

(assert (=> b!172568 m!201455))

(declare-fun m!201457 () Bool)

(assert (=> start!17186 m!201457))

(declare-fun m!201459 () Bool)

(assert (=> mapNonEmpty!6862 m!201459))

(check-sat tp_is_empty!4033 (not b!172567) (not b_next!4261) (not b!172568) (not mapNonEmpty!6862) b_and!10715 (not start!17186))
(check-sat b_and!10715 (not b_next!4261))
(get-model)

(declare-fun d!52593 () Bool)

(declare-fun res!81964 () Bool)

(declare-fun e!113953 () Bool)

(assert (=> d!52593 (=> (not res!81964) (not e!113953))))

(declare-fun simpleValid!140 (LongMapFixedSize!2254) Bool)

(assert (=> d!52593 (= res!81964 (simpleValid!140 thiss!1248))))

(assert (=> d!52593 (= (valid!972 thiss!1248) e!113953)))

(declare-fun b!172621 () Bool)

(declare-fun res!81965 () Bool)

(assert (=> b!172621 (=> (not res!81965) (not e!113953))))

(declare-fun arrayCountValidKeys!0 (array!7175 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172621 (= res!81965 (= (arrayCountValidKeys!0 (_keys!5410 thiss!1248) #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))) (_size!1176 thiss!1248)))))

(declare-fun b!172622 () Bool)

(declare-fun res!81966 () Bool)

(assert (=> b!172622 (=> (not res!81966) (not e!113953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7175 (_ BitVec 32)) Bool)

(assert (=> b!172622 (= res!81966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5410 thiss!1248) (mask!8421 thiss!1248)))))

(declare-fun b!172623 () Bool)

(declare-datatypes ((List!2183 0))(
  ( (Nil!2180) (Cons!2179 (h!2796 (_ BitVec 64)) (t!6982 List!2183)) )
))
(declare-fun arrayNoDuplicates!0 (array!7175 (_ BitVec 32) List!2183) Bool)

(assert (=> b!172623 (= e!113953 (arrayNoDuplicates!0 (_keys!5410 thiss!1248) #b00000000000000000000000000000000 Nil!2180))))

(assert (= (and d!52593 res!81964) b!172621))

(assert (= (and b!172621 res!81965) b!172622))

(assert (= (and b!172622 res!81966) b!172623))

(declare-fun m!201481 () Bool)

(assert (=> d!52593 m!201481))

(declare-fun m!201483 () Bool)

(assert (=> b!172621 m!201483))

(declare-fun m!201485 () Bool)

(assert (=> b!172622 m!201485))

(declare-fun m!201487 () Bool)

(assert (=> b!172623 m!201487))

(assert (=> start!17186 d!52593))

(declare-fun d!52595 () Bool)

(assert (=> d!52595 (= (validMask!0 (mask!8421 thiss!1248)) (and (or (= (mask!8421 thiss!1248) #b00000000000000000000000000000111) (= (mask!8421 thiss!1248) #b00000000000000000000000000001111) (= (mask!8421 thiss!1248) #b00000000000000000000000000011111) (= (mask!8421 thiss!1248) #b00000000000000000000000000111111) (= (mask!8421 thiss!1248) #b00000000000000000000000001111111) (= (mask!8421 thiss!1248) #b00000000000000000000000011111111) (= (mask!8421 thiss!1248) #b00000000000000000000000111111111) (= (mask!8421 thiss!1248) #b00000000000000000000001111111111) (= (mask!8421 thiss!1248) #b00000000000000000000011111111111) (= (mask!8421 thiss!1248) #b00000000000000000000111111111111) (= (mask!8421 thiss!1248) #b00000000000000000001111111111111) (= (mask!8421 thiss!1248) #b00000000000000000011111111111111) (= (mask!8421 thiss!1248) #b00000000000000000111111111111111) (= (mask!8421 thiss!1248) #b00000000000000001111111111111111) (= (mask!8421 thiss!1248) #b00000000000000011111111111111111) (= (mask!8421 thiss!1248) #b00000000000000111111111111111111) (= (mask!8421 thiss!1248) #b00000000000001111111111111111111) (= (mask!8421 thiss!1248) #b00000000000011111111111111111111) (= (mask!8421 thiss!1248) #b00000000000111111111111111111111) (= (mask!8421 thiss!1248) #b00000000001111111111111111111111) (= (mask!8421 thiss!1248) #b00000000011111111111111111111111) (= (mask!8421 thiss!1248) #b00000000111111111111111111111111) (= (mask!8421 thiss!1248) #b00000001111111111111111111111111) (= (mask!8421 thiss!1248) #b00000011111111111111111111111111) (= (mask!8421 thiss!1248) #b00000111111111111111111111111111) (= (mask!8421 thiss!1248) #b00001111111111111111111111111111) (= (mask!8421 thiss!1248) #b00011111111111111111111111111111) (= (mask!8421 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8421 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172568 d!52595))

(declare-fun d!52597 () Bool)

(assert (=> d!52597 (= (array_inv!2193 (_keys!5410 thiss!1248)) (bvsge (size!3707 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172567 d!52597))

(declare-fun d!52599 () Bool)

(assert (=> d!52599 (= (array_inv!2194 (_values!3556 thiss!1248)) (bvsge (size!3708 (_values!3556 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172567 d!52599))

(declare-fun condMapEmpty!6871 () Bool)

(declare-fun mapDefault!6871 () ValueCell!1673)

(assert (=> mapNonEmpty!6862 (= condMapEmpty!6871 (= mapRest!6862 ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6871)))))

(declare-fun e!113959 () Bool)

(declare-fun mapRes!6871 () Bool)

(assert (=> mapNonEmpty!6862 (= tp!15432 (and e!113959 mapRes!6871))))

(declare-fun b!172630 () Bool)

(declare-fun e!113958 () Bool)

(assert (=> b!172630 (= e!113958 tp_is_empty!4033)))

(declare-fun mapIsEmpty!6871 () Bool)

(assert (=> mapIsEmpty!6871 mapRes!6871))

(declare-fun mapNonEmpty!6871 () Bool)

(declare-fun tp!15448 () Bool)

(assert (=> mapNonEmpty!6871 (= mapRes!6871 (and tp!15448 e!113958))))

(declare-fun mapKey!6871 () (_ BitVec 32))

(declare-fun mapRest!6871 () (Array (_ BitVec 32) ValueCell!1673))

(declare-fun mapValue!6871 () ValueCell!1673)

(assert (=> mapNonEmpty!6871 (= mapRest!6862 (store mapRest!6871 mapKey!6871 mapValue!6871))))

(declare-fun b!172631 () Bool)

(assert (=> b!172631 (= e!113959 tp_is_empty!4033)))

(assert (= (and mapNonEmpty!6862 condMapEmpty!6871) mapIsEmpty!6871))

(assert (= (and mapNonEmpty!6862 (not condMapEmpty!6871)) mapNonEmpty!6871))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1673) mapValue!6871)) b!172630))

(assert (= (and mapNonEmpty!6862 ((_ is ValueCellFull!1673) mapDefault!6871)) b!172631))

(declare-fun m!201489 () Bool)

(assert (=> mapNonEmpty!6871 m!201489))

(check-sat (not d!52593) tp_is_empty!4033 (not mapNonEmpty!6871) (not b!172621) (not b_next!4261) (not b!172623) b_and!10715 (not b!172622))
(check-sat b_and!10715 (not b_next!4261))
(get-model)

(declare-fun d!52601 () Bool)

(declare-fun res!81973 () Bool)

(declare-fun e!113971 () Bool)

(assert (=> d!52601 (=> res!81973 e!113971)))

(assert (=> d!52601 (= res!81973 (bvsge #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))))))

(assert (=> d!52601 (= (arrayNoDuplicates!0 (_keys!5410 thiss!1248) #b00000000000000000000000000000000 Nil!2180) e!113971)))

(declare-fun bm!17518 () Bool)

(declare-fun call!17521 () Bool)

(declare-fun c!30879 () Bool)

(assert (=> bm!17518 (= call!17521 (arrayNoDuplicates!0 (_keys!5410 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30879 (Cons!2179 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000) Nil!2180) Nil!2180)))))

(declare-fun b!172642 () Bool)

(declare-fun e!113969 () Bool)

(assert (=> b!172642 (= e!113969 call!17521)))

(declare-fun b!172643 () Bool)

(assert (=> b!172643 (= e!113969 call!17521)))

(declare-fun b!172644 () Bool)

(declare-fun e!113968 () Bool)

(declare-fun contains!1146 (List!2183 (_ BitVec 64)) Bool)

(assert (=> b!172644 (= e!113968 (contains!1146 Nil!2180 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172645 () Bool)

(declare-fun e!113970 () Bool)

(assert (=> b!172645 (= e!113970 e!113969)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172645 (= c!30879 (validKeyInArray!0 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172646 () Bool)

(assert (=> b!172646 (= e!113971 e!113970)))

(declare-fun res!81975 () Bool)

(assert (=> b!172646 (=> (not res!81975) (not e!113970))))

(assert (=> b!172646 (= res!81975 (not e!113968))))

(declare-fun res!81974 () Bool)

(assert (=> b!172646 (=> (not res!81974) (not e!113968))))

(assert (=> b!172646 (= res!81974 (validKeyInArray!0 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52601 (not res!81973)) b!172646))

(assert (= (and b!172646 res!81974) b!172644))

(assert (= (and b!172646 res!81975) b!172645))

(assert (= (and b!172645 c!30879) b!172642))

(assert (= (and b!172645 (not c!30879)) b!172643))

(assert (= (or b!172642 b!172643) bm!17518))

(declare-fun m!201491 () Bool)

(assert (=> bm!17518 m!201491))

(declare-fun m!201493 () Bool)

(assert (=> bm!17518 m!201493))

(assert (=> b!172644 m!201491))

(assert (=> b!172644 m!201491))

(declare-fun m!201495 () Bool)

(assert (=> b!172644 m!201495))

(assert (=> b!172645 m!201491))

(assert (=> b!172645 m!201491))

(declare-fun m!201497 () Bool)

(assert (=> b!172645 m!201497))

(assert (=> b!172646 m!201491))

(assert (=> b!172646 m!201491))

(assert (=> b!172646 m!201497))

(assert (=> b!172623 d!52601))

(declare-fun d!52603 () Bool)

(declare-fun res!81980 () Bool)

(declare-fun e!113978 () Bool)

(assert (=> d!52603 (=> res!81980 e!113978)))

(assert (=> d!52603 (= res!81980 (bvsge #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))))))

(assert (=> d!52603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5410 thiss!1248) (mask!8421 thiss!1248)) e!113978)))

(declare-fun b!172655 () Bool)

(declare-fun e!113980 () Bool)

(declare-fun e!113979 () Bool)

(assert (=> b!172655 (= e!113980 e!113979)))

(declare-fun lt!85736 () (_ BitVec 64))

(assert (=> b!172655 (= lt!85736 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5307 0))(
  ( (Unit!5308) )
))
(declare-fun lt!85735 () Unit!5307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7175 (_ BitVec 64) (_ BitVec 32)) Unit!5307)

(assert (=> b!172655 (= lt!85735 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5410 thiss!1248) lt!85736 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172655 (arrayContainsKey!0 (_keys!5410 thiss!1248) lt!85736 #b00000000000000000000000000000000)))

(declare-fun lt!85737 () Unit!5307)

(assert (=> b!172655 (= lt!85737 lt!85735)))

(declare-fun res!81981 () Bool)

(declare-datatypes ((SeekEntryResult!532 0))(
  ( (MissingZero!532 (index!4296 (_ BitVec 32))) (Found!532 (index!4297 (_ BitVec 32))) (Intermediate!532 (undefined!1344 Bool) (index!4298 (_ BitVec 32)) (x!19069 (_ BitVec 32))) (Undefined!532) (MissingVacant!532 (index!4299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7175 (_ BitVec 32)) SeekEntryResult!532)

(assert (=> b!172655 (= res!81981 (= (seekEntryOrOpen!0 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000) (_keys!5410 thiss!1248) (mask!8421 thiss!1248)) (Found!532 #b00000000000000000000000000000000)))))

(assert (=> b!172655 (=> (not res!81981) (not e!113979))))

(declare-fun b!172656 () Bool)

(declare-fun call!17524 () Bool)

(assert (=> b!172656 (= e!113979 call!17524)))

(declare-fun bm!17521 () Bool)

(assert (=> bm!17521 (= call!17524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5410 thiss!1248) (mask!8421 thiss!1248)))))

(declare-fun b!172657 () Bool)

(assert (=> b!172657 (= e!113978 e!113980)))

(declare-fun c!30882 () Bool)

(assert (=> b!172657 (= c!30882 (validKeyInArray!0 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172658 () Bool)

(assert (=> b!172658 (= e!113980 call!17524)))

(assert (= (and d!52603 (not res!81980)) b!172657))

(assert (= (and b!172657 c!30882) b!172655))

(assert (= (and b!172657 (not c!30882)) b!172658))

(assert (= (and b!172655 res!81981) b!172656))

(assert (= (or b!172656 b!172658) bm!17521))

(assert (=> b!172655 m!201491))

(declare-fun m!201499 () Bool)

(assert (=> b!172655 m!201499))

(declare-fun m!201501 () Bool)

(assert (=> b!172655 m!201501))

(assert (=> b!172655 m!201491))

(declare-fun m!201503 () Bool)

(assert (=> b!172655 m!201503))

(declare-fun m!201505 () Bool)

(assert (=> bm!17521 m!201505))

(assert (=> b!172657 m!201491))

(assert (=> b!172657 m!201491))

(assert (=> b!172657 m!201497))

(assert (=> b!172622 d!52603))

(declare-fun b!172667 () Bool)

(declare-fun e!113985 () (_ BitVec 32))

(declare-fun call!17527 () (_ BitVec 32))

(assert (=> b!172667 (= e!113985 call!17527)))

(declare-fun bm!17524 () Bool)

(assert (=> bm!17524 (= call!17527 (arrayCountValidKeys!0 (_keys!5410 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3707 (_keys!5410 thiss!1248))))))

(declare-fun b!172669 () Bool)

(declare-fun e!113986 () (_ BitVec 32))

(assert (=> b!172669 (= e!113986 e!113985)))

(declare-fun c!30887 () Bool)

(assert (=> b!172669 (= c!30887 (validKeyInArray!0 (select (arr!3410 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172670 () Bool)

(assert (=> b!172670 (= e!113986 #b00000000000000000000000000000000)))

(declare-fun d!52605 () Bool)

(declare-fun lt!85740 () (_ BitVec 32))

(assert (=> d!52605 (and (bvsge lt!85740 #b00000000000000000000000000000000) (bvsle lt!85740 (bvsub (size!3707 (_keys!5410 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52605 (= lt!85740 e!113986)))

(declare-fun c!30888 () Bool)

(assert (=> d!52605 (= c!30888 (bvsge #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))))))

(assert (=> d!52605 (and (bvsle #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3707 (_keys!5410 thiss!1248)) (size!3707 (_keys!5410 thiss!1248))))))

(assert (=> d!52605 (= (arrayCountValidKeys!0 (_keys!5410 thiss!1248) #b00000000000000000000000000000000 (size!3707 (_keys!5410 thiss!1248))) lt!85740)))

(declare-fun b!172668 () Bool)

(assert (=> b!172668 (= e!113985 (bvadd #b00000000000000000000000000000001 call!17527))))

(assert (= (and d!52605 c!30888) b!172670))

(assert (= (and d!52605 (not c!30888)) b!172669))

(assert (= (and b!172669 c!30887) b!172668))

(assert (= (and b!172669 (not c!30887)) b!172667))

(assert (= (or b!172668 b!172667) bm!17524))

(declare-fun m!201507 () Bool)

(assert (=> bm!17524 m!201507))

(assert (=> b!172669 m!201491))

(assert (=> b!172669 m!201491))

(assert (=> b!172669 m!201497))

(assert (=> b!172621 d!52605))

(declare-fun b!172680 () Bool)

(declare-fun res!81991 () Bool)

(declare-fun e!113989 () Bool)

(assert (=> b!172680 (=> (not res!81991) (not e!113989))))

(declare-fun size!3713 (LongMapFixedSize!2254) (_ BitVec 32))

(assert (=> b!172680 (= res!81991 (bvsge (size!3713 thiss!1248) (_size!1176 thiss!1248)))))

(declare-fun b!172679 () Bool)

(declare-fun res!81992 () Bool)

(assert (=> b!172679 (=> (not res!81992) (not e!113989))))

(assert (=> b!172679 (= res!81992 (and (= (size!3708 (_values!3556 thiss!1248)) (bvadd (mask!8421 thiss!1248) #b00000000000000000000000000000001)) (= (size!3707 (_keys!5410 thiss!1248)) (size!3708 (_values!3556 thiss!1248))) (bvsge (_size!1176 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1176 thiss!1248) (bvadd (mask!8421 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172682 () Bool)

(assert (=> b!172682 (= e!113989 (and (bvsge (extraKeys!3312 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3312 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1176 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172681 () Bool)

(declare-fun res!81993 () Bool)

(assert (=> b!172681 (=> (not res!81993) (not e!113989))))

(assert (=> b!172681 (= res!81993 (= (size!3713 thiss!1248) (bvadd (_size!1176 thiss!1248) (bvsdiv (bvadd (extraKeys!3312 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!52607 () Bool)

(declare-fun res!81990 () Bool)

(assert (=> d!52607 (=> (not res!81990) (not e!113989))))

(assert (=> d!52607 (= res!81990 (validMask!0 (mask!8421 thiss!1248)))))

(assert (=> d!52607 (= (simpleValid!140 thiss!1248) e!113989)))

(assert (= (and d!52607 res!81990) b!172679))

(assert (= (and b!172679 res!81992) b!172680))

(assert (= (and b!172680 res!81991) b!172681))

(assert (= (and b!172681 res!81993) b!172682))

(declare-fun m!201509 () Bool)

(assert (=> b!172680 m!201509))

(assert (=> b!172681 m!201509))

(assert (=> d!52607 m!201455))

(assert (=> d!52593 d!52607))

(declare-fun condMapEmpty!6872 () Bool)

(declare-fun mapDefault!6872 () ValueCell!1673)

(assert (=> mapNonEmpty!6871 (= condMapEmpty!6872 (= mapRest!6871 ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6872)))))

(declare-fun e!113991 () Bool)

(declare-fun mapRes!6872 () Bool)

(assert (=> mapNonEmpty!6871 (= tp!15448 (and e!113991 mapRes!6872))))

(declare-fun b!172683 () Bool)

(declare-fun e!113990 () Bool)

(assert (=> b!172683 (= e!113990 tp_is_empty!4033)))

(declare-fun mapIsEmpty!6872 () Bool)

(assert (=> mapIsEmpty!6872 mapRes!6872))

(declare-fun mapNonEmpty!6872 () Bool)

(declare-fun tp!15449 () Bool)

(assert (=> mapNonEmpty!6872 (= mapRes!6872 (and tp!15449 e!113990))))

(declare-fun mapKey!6872 () (_ BitVec 32))

(declare-fun mapValue!6872 () ValueCell!1673)

(declare-fun mapRest!6872 () (Array (_ BitVec 32) ValueCell!1673))

(assert (=> mapNonEmpty!6872 (= mapRest!6871 (store mapRest!6872 mapKey!6872 mapValue!6872))))

(declare-fun b!172684 () Bool)

(assert (=> b!172684 (= e!113991 tp_is_empty!4033)))

(assert (= (and mapNonEmpty!6871 condMapEmpty!6872) mapIsEmpty!6872))

(assert (= (and mapNonEmpty!6871 (not condMapEmpty!6872)) mapNonEmpty!6872))

(assert (= (and mapNonEmpty!6872 ((_ is ValueCellFull!1673) mapValue!6872)) b!172683))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1673) mapDefault!6872)) b!172684))

(declare-fun m!201511 () Bool)

(assert (=> mapNonEmpty!6872 m!201511))

(check-sat (not bm!17521) (not mapNonEmpty!6872) tp_is_empty!4033 (not b!172645) (not b!172646) (not b!172655) (not b_next!4261) (not b!172681) (not b!172669) (not b!172644) (not bm!17518) (not bm!17524) (not b!172657) (not b!172680) (not d!52607) b_and!10715)
(check-sat b_and!10715 (not b_next!4261))
