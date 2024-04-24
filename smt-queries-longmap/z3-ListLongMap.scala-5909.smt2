; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76638 () Bool)

(assert start!76638)

(declare-fun b!897429 () Bool)

(declare-fun b_free!15955 () Bool)

(declare-fun b_next!15955 () Bool)

(assert (=> b!897429 (= b_free!15955 (not b_next!15955))))

(declare-fun tp!55901 () Bool)

(declare-fun b_and!26257 () Bool)

(assert (=> b!897429 (= tp!55901 b_and!26257)))

(declare-fun b!897422 () Bool)

(declare-fun e!501713 () Bool)

(declare-fun e!501719 () Bool)

(declare-fun mapRes!29045 () Bool)

(assert (=> b!897422 (= e!501713 (and e!501719 mapRes!29045))))

(declare-fun condMapEmpty!29045 () Bool)

(declare-datatypes ((array!52623 0))(
  ( (array!52624 (arr!25294 (Array (_ BitVec 32) (_ BitVec 64))) (size!25746 (_ BitVec 32))) )
))
(declare-datatypes ((V!29343 0))(
  ( (V!29344 (val!9192 Int)) )
))
(declare-datatypes ((ValueCell!8660 0))(
  ( (ValueCellFull!8660 (v!11679 V!29343)) (EmptyCell!8660) )
))
(declare-datatypes ((array!52625 0))(
  ( (array!52626 (arr!25295 (Array (_ BitVec 32) ValueCell!8660)) (size!25747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4336 0))(
  ( (LongMapFixedSize!4337 (defaultEntry!5380 Int) (mask!26069 (_ BitVec 32)) (extraKeys!5082 (_ BitVec 32)) (zeroValue!5186 V!29343) (minValue!5186 V!29343) (_size!2223 (_ BitVec 32)) (_keys!10143 array!52623) (_values!5373 array!52625) (_vacant!2223 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4336)

(declare-fun mapDefault!29045 () ValueCell!8660)

(assert (=> b!897422 (= condMapEmpty!29045 (= (arr!25295 (_values!5373 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29045)))))

(declare-fun res!606533 () Bool)

(declare-fun e!501714 () Bool)

(assert (=> start!76638 (=> (not res!606533) (not e!501714))))

(declare-fun valid!1683 (LongMapFixedSize!4336) Bool)

(assert (=> start!76638 (= res!606533 (valid!1683 thiss!1181))))

(assert (=> start!76638 e!501714))

(declare-fun e!501718 () Bool)

(assert (=> start!76638 e!501718))

(assert (=> start!76638 true))

(declare-fun b!897423 () Bool)

(declare-fun e!501721 () Bool)

(declare-fun tp_is_empty!18283 () Bool)

(assert (=> b!897423 (= e!501721 tp_is_empty!18283)))

(declare-fun b!897424 () Bool)

(assert (=> b!897424 (= e!501719 tp_is_empty!18283)))

(declare-fun mapIsEmpty!29045 () Bool)

(assert (=> mapIsEmpty!29045 mapRes!29045))

(declare-fun b!897425 () Bool)

(declare-fun e!501720 () Bool)

(assert (=> b!897425 (= e!501720 (= (size!25747 (_values!5373 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26069 thiss!1181))))))

(declare-fun mapNonEmpty!29045 () Bool)

(declare-fun tp!55900 () Bool)

(assert (=> mapNonEmpty!29045 (= mapRes!29045 (and tp!55900 e!501721))))

(declare-fun mapValue!29045 () ValueCell!8660)

(declare-fun mapKey!29045 () (_ BitVec 32))

(declare-fun mapRest!29045 () (Array (_ BitVec 32) ValueCell!8660))

(assert (=> mapNonEmpty!29045 (= (arr!25295 (_values!5373 thiss!1181)) (store mapRest!29045 mapKey!29045 mapValue!29045))))

(declare-fun b!897426 () Bool)

(declare-fun e!501716 () Bool)

(declare-datatypes ((SeekEntryResult!8850 0))(
  ( (MissingZero!8850 (index!37771 (_ BitVec 32))) (Found!8850 (index!37772 (_ BitVec 32))) (Intermediate!8850 (undefined!9662 Bool) (index!37773 (_ BitVec 32)) (x!76313 (_ BitVec 32))) (Undefined!8850) (MissingVacant!8850 (index!37774 (_ BitVec 32))) )
))
(declare-fun lt!405213 () SeekEntryResult!8850)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897426 (= e!501716 (inRange!0 (index!37772 lt!405213) (mask!26069 thiss!1181)))))

(declare-fun b!897427 () Bool)

(declare-fun e!501715 () Bool)

(assert (=> b!897427 (= e!501714 (not e!501715))))

(declare-fun res!606532 () Bool)

(assert (=> b!897427 (=> res!606532 e!501715)))

(get-info :version)

(assert (=> b!897427 (= res!606532 (not ((_ is Found!8850) lt!405213)))))

(assert (=> b!897427 e!501716))

(declare-fun res!606530 () Bool)

(assert (=> b!897427 (=> res!606530 e!501716)))

(assert (=> b!897427 (= res!606530 (not ((_ is Found!8850) lt!405213)))))

(declare-datatypes ((Unit!30474 0))(
  ( (Unit!30475) )
))
(declare-fun lt!405214 () Unit!30474)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!78 (array!52623 array!52625 (_ BitVec 32) (_ BitVec 32) V!29343 V!29343 (_ BitVec 64)) Unit!30474)

(assert (=> b!897427 (= lt!405214 (lemmaSeekEntryGivesInRangeIndex!78 (_keys!10143 thiss!1181) (_values!5373 thiss!1181) (mask!26069 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8850)

(assert (=> b!897427 (= lt!405213 (seekEntry!0 key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(declare-fun b!897428 () Bool)

(assert (=> b!897428 (= e!501715 e!501720)))

(declare-fun res!606529 () Bool)

(assert (=> b!897428 (=> res!606529 e!501720)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897428 (= res!606529 (not (validMask!0 (mask!26069 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897428 (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405215 () Unit!30474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52623 (_ BitVec 64) (_ BitVec 32)) Unit!30474)

(assert (=> b!897428 (= lt!405215 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10143 thiss!1181) key!785 (index!37772 lt!405213)))))

(declare-fun array_inv!19904 (array!52623) Bool)

(declare-fun array_inv!19905 (array!52625) Bool)

(assert (=> b!897429 (= e!501718 (and tp!55901 tp_is_empty!18283 (array_inv!19904 (_keys!10143 thiss!1181)) (array_inv!19905 (_values!5373 thiss!1181)) e!501713))))

(declare-fun b!897430 () Bool)

(declare-fun res!606531 () Bool)

(assert (=> b!897430 (=> (not res!606531) (not e!501714))))

(assert (=> b!897430 (= res!606531 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76638 res!606533) b!897430))

(assert (= (and b!897430 res!606531) b!897427))

(assert (= (and b!897427 (not res!606530)) b!897426))

(assert (= (and b!897427 (not res!606532)) b!897428))

(assert (= (and b!897428 (not res!606529)) b!897425))

(assert (= (and b!897422 condMapEmpty!29045) mapIsEmpty!29045))

(assert (= (and b!897422 (not condMapEmpty!29045)) mapNonEmpty!29045))

(assert (= (and mapNonEmpty!29045 ((_ is ValueCellFull!8660) mapValue!29045)) b!897423))

(assert (= (and b!897422 ((_ is ValueCellFull!8660) mapDefault!29045)) b!897424))

(assert (= b!897429 b!897422))

(assert (= start!76638 b!897429))

(declare-fun m!834973 () Bool)

(assert (=> b!897429 m!834973))

(declare-fun m!834975 () Bool)

(assert (=> b!897429 m!834975))

(declare-fun m!834977 () Bool)

(assert (=> b!897427 m!834977))

(declare-fun m!834979 () Bool)

(assert (=> b!897427 m!834979))

(declare-fun m!834981 () Bool)

(assert (=> start!76638 m!834981))

(declare-fun m!834983 () Bool)

(assert (=> b!897426 m!834983))

(declare-fun m!834985 () Bool)

(assert (=> mapNonEmpty!29045 m!834985))

(declare-fun m!834987 () Bool)

(assert (=> b!897428 m!834987))

(declare-fun m!834989 () Bool)

(assert (=> b!897428 m!834989))

(declare-fun m!834991 () Bool)

(assert (=> b!897428 m!834991))

(check-sat (not b!897426) (not b_next!15955) b_and!26257 (not b!897427) (not start!76638) tp_is_empty!18283 (not b!897429) (not b!897428) (not mapNonEmpty!29045))
(check-sat b_and!26257 (not b_next!15955))
(get-model)

(declare-fun d!111251 () Bool)

(assert (=> d!111251 (= (inRange!0 (index!37772 lt!405213) (mask!26069 thiss!1181)) (and (bvsge (index!37772 lt!405213) #b00000000000000000000000000000000) (bvslt (index!37772 lt!405213) (bvadd (mask!26069 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897426 d!111251))

(declare-fun d!111253 () Bool)

(declare-fun e!501778 () Bool)

(assert (=> d!111253 e!501778))

(declare-fun res!606566 () Bool)

(assert (=> d!111253 (=> res!606566 e!501778)))

(declare-fun lt!405239 () SeekEntryResult!8850)

(assert (=> d!111253 (= res!606566 (not ((_ is Found!8850) lt!405239)))))

(assert (=> d!111253 (= lt!405239 (seekEntry!0 key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(declare-fun lt!405238 () Unit!30474)

(declare-fun choose!1485 (array!52623 array!52625 (_ BitVec 32) (_ BitVec 32) V!29343 V!29343 (_ BitVec 64)) Unit!30474)

(assert (=> d!111253 (= lt!405238 (choose!1485 (_keys!10143 thiss!1181) (_values!5373 thiss!1181) (mask!26069 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785))))

(assert (=> d!111253 (validMask!0 (mask!26069 thiss!1181))))

(assert (=> d!111253 (= (lemmaSeekEntryGivesInRangeIndex!78 (_keys!10143 thiss!1181) (_values!5373 thiss!1181) (mask!26069 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785) lt!405238)))

(declare-fun b!897487 () Bool)

(assert (=> b!897487 (= e!501778 (inRange!0 (index!37772 lt!405239) (mask!26069 thiss!1181)))))

(assert (= (and d!111253 (not res!606566)) b!897487))

(assert (=> d!111253 m!834979))

(declare-fun m!835033 () Bool)

(assert (=> d!111253 m!835033))

(assert (=> d!111253 m!834987))

(declare-fun m!835035 () Bool)

(assert (=> b!897487 m!835035))

(assert (=> b!897427 d!111253))

(declare-fun b!897500 () Bool)

(declare-fun c!94980 () Bool)

(declare-fun lt!405250 () (_ BitVec 64))

(assert (=> b!897500 (= c!94980 (= lt!405250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501786 () SeekEntryResult!8850)

(declare-fun e!501785 () SeekEntryResult!8850)

(assert (=> b!897500 (= e!501786 e!501785)))

(declare-fun b!897501 () Bool)

(declare-fun lt!405251 () SeekEntryResult!8850)

(assert (=> b!897501 (= e!501785 (MissingZero!8850 (index!37773 lt!405251)))))

(declare-fun b!897502 () Bool)

(declare-fun e!501787 () SeekEntryResult!8850)

(assert (=> b!897502 (= e!501787 e!501786)))

(assert (=> b!897502 (= lt!405250 (select (arr!25294 (_keys!10143 thiss!1181)) (index!37773 lt!405251)))))

(declare-fun c!94982 () Bool)

(assert (=> b!897502 (= c!94982 (= lt!405250 key!785))))

(declare-fun b!897503 () Bool)

(assert (=> b!897503 (= e!501787 Undefined!8850)))

(declare-fun b!897504 () Bool)

(assert (=> b!897504 (= e!501786 (Found!8850 (index!37773 lt!405251)))))

(declare-fun d!111255 () Bool)

(declare-fun lt!405249 () SeekEntryResult!8850)

(assert (=> d!111255 (and (or ((_ is MissingVacant!8850) lt!405249) (not ((_ is Found!8850) lt!405249)) (and (bvsge (index!37772 lt!405249) #b00000000000000000000000000000000) (bvslt (index!37772 lt!405249) (size!25746 (_keys!10143 thiss!1181))))) (not ((_ is MissingVacant!8850) lt!405249)) (or (not ((_ is Found!8850) lt!405249)) (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37772 lt!405249)) key!785)))))

(assert (=> d!111255 (= lt!405249 e!501787)))

(declare-fun c!94981 () Bool)

(assert (=> d!111255 (= c!94981 (and ((_ is Intermediate!8850) lt!405251) (undefined!9662 lt!405251)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111255 (= lt!405251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26069 thiss!1181)) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(assert (=> d!111255 (validMask!0 (mask!26069 thiss!1181))))

(assert (=> d!111255 (= (seekEntry!0 key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)) lt!405249)))

(declare-fun b!897505 () Bool)

(declare-fun lt!405248 () SeekEntryResult!8850)

(assert (=> b!897505 (= e!501785 (ite ((_ is MissingVacant!8850) lt!405248) (MissingZero!8850 (index!37774 lt!405248)) lt!405248))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8850)

(assert (=> b!897505 (= lt!405248 (seekKeyOrZeroReturnVacant!0 (x!76313 lt!405251) (index!37773 lt!405251) (index!37773 lt!405251) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(assert (= (and d!111255 c!94981) b!897503))

(assert (= (and d!111255 (not c!94981)) b!897502))

(assert (= (and b!897502 c!94982) b!897504))

(assert (= (and b!897502 (not c!94982)) b!897500))

(assert (= (and b!897500 c!94980) b!897501))

(assert (= (and b!897500 (not c!94980)) b!897505))

(declare-fun m!835037 () Bool)

(assert (=> b!897502 m!835037))

(declare-fun m!835039 () Bool)

(assert (=> d!111255 m!835039))

(declare-fun m!835041 () Bool)

(assert (=> d!111255 m!835041))

(assert (=> d!111255 m!835041))

(declare-fun m!835043 () Bool)

(assert (=> d!111255 m!835043))

(assert (=> d!111255 m!834987))

(declare-fun m!835045 () Bool)

(assert (=> b!897505 m!835045))

(assert (=> b!897427 d!111255))

(declare-fun d!111257 () Bool)

(declare-fun res!606573 () Bool)

(declare-fun e!501790 () Bool)

(assert (=> d!111257 (=> (not res!606573) (not e!501790))))

(declare-fun simpleValid!314 (LongMapFixedSize!4336) Bool)

(assert (=> d!111257 (= res!606573 (simpleValid!314 thiss!1181))))

(assert (=> d!111257 (= (valid!1683 thiss!1181) e!501790)))

(declare-fun b!897512 () Bool)

(declare-fun res!606574 () Bool)

(assert (=> b!897512 (=> (not res!606574) (not e!501790))))

(declare-fun arrayCountValidKeys!0 (array!52623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897512 (= res!606574 (= (arrayCountValidKeys!0 (_keys!10143 thiss!1181) #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))) (_size!2223 thiss!1181)))))

(declare-fun b!897513 () Bool)

(declare-fun res!606575 () Bool)

(assert (=> b!897513 (=> (not res!606575) (not e!501790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52623 (_ BitVec 32)) Bool)

(assert (=> b!897513 (= res!606575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(declare-fun b!897514 () Bool)

(declare-datatypes ((List!17774 0))(
  ( (Nil!17771) (Cons!17770 (h!18914 (_ BitVec 64)) (t!25105 List!17774)) )
))
(declare-fun arrayNoDuplicates!0 (array!52623 (_ BitVec 32) List!17774) Bool)

(assert (=> b!897514 (= e!501790 (arrayNoDuplicates!0 (_keys!10143 thiss!1181) #b00000000000000000000000000000000 Nil!17771))))

(assert (= (and d!111257 res!606573) b!897512))

(assert (= (and b!897512 res!606574) b!897513))

(assert (= (and b!897513 res!606575) b!897514))

(declare-fun m!835047 () Bool)

(assert (=> d!111257 m!835047))

(declare-fun m!835049 () Bool)

(assert (=> b!897512 m!835049))

(declare-fun m!835051 () Bool)

(assert (=> b!897513 m!835051))

(declare-fun m!835053 () Bool)

(assert (=> b!897514 m!835053))

(assert (=> start!76638 d!111257))

(declare-fun d!111259 () Bool)

(assert (=> d!111259 (= (validMask!0 (mask!26069 thiss!1181)) (and (or (= (mask!26069 thiss!1181) #b00000000000000000000000000000111) (= (mask!26069 thiss!1181) #b00000000000000000000000000001111) (= (mask!26069 thiss!1181) #b00000000000000000000000000011111) (= (mask!26069 thiss!1181) #b00000000000000000000000000111111) (= (mask!26069 thiss!1181) #b00000000000000000000000001111111) (= (mask!26069 thiss!1181) #b00000000000000000000000011111111) (= (mask!26069 thiss!1181) #b00000000000000000000000111111111) (= (mask!26069 thiss!1181) #b00000000000000000000001111111111) (= (mask!26069 thiss!1181) #b00000000000000000000011111111111) (= (mask!26069 thiss!1181) #b00000000000000000000111111111111) (= (mask!26069 thiss!1181) #b00000000000000000001111111111111) (= (mask!26069 thiss!1181) #b00000000000000000011111111111111) (= (mask!26069 thiss!1181) #b00000000000000000111111111111111) (= (mask!26069 thiss!1181) #b00000000000000001111111111111111) (= (mask!26069 thiss!1181) #b00000000000000011111111111111111) (= (mask!26069 thiss!1181) #b00000000000000111111111111111111) (= (mask!26069 thiss!1181) #b00000000000001111111111111111111) (= (mask!26069 thiss!1181) #b00000000000011111111111111111111) (= (mask!26069 thiss!1181) #b00000000000111111111111111111111) (= (mask!26069 thiss!1181) #b00000000001111111111111111111111) (= (mask!26069 thiss!1181) #b00000000011111111111111111111111) (= (mask!26069 thiss!1181) #b00000000111111111111111111111111) (= (mask!26069 thiss!1181) #b00000001111111111111111111111111) (= (mask!26069 thiss!1181) #b00000011111111111111111111111111) (= (mask!26069 thiss!1181) #b00000111111111111111111111111111) (= (mask!26069 thiss!1181) #b00001111111111111111111111111111) (= (mask!26069 thiss!1181) #b00011111111111111111111111111111) (= (mask!26069 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26069 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897428 d!111259))

(declare-fun d!111261 () Bool)

(declare-fun res!606580 () Bool)

(declare-fun e!501795 () Bool)

(assert (=> d!111261 (=> res!606580 e!501795)))

(assert (=> d!111261 (= res!606580 (= (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111261 (= (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 #b00000000000000000000000000000000) e!501795)))

(declare-fun b!897519 () Bool)

(declare-fun e!501796 () Bool)

(assert (=> b!897519 (= e!501795 e!501796)))

(declare-fun res!606581 () Bool)

(assert (=> b!897519 (=> (not res!606581) (not e!501796))))

(assert (=> b!897519 (= res!606581 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun b!897520 () Bool)

(assert (=> b!897520 (= e!501796 (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111261 (not res!606580)) b!897519))

(assert (= (and b!897519 res!606581) b!897520))

(declare-fun m!835055 () Bool)

(assert (=> d!111261 m!835055))

(declare-fun m!835057 () Bool)

(assert (=> b!897520 m!835057))

(assert (=> b!897428 d!111261))

(declare-fun d!111263 () Bool)

(assert (=> d!111263 (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405254 () Unit!30474)

(declare-fun choose!13 (array!52623 (_ BitVec 64) (_ BitVec 32)) Unit!30474)

(assert (=> d!111263 (= lt!405254 (choose!13 (_keys!10143 thiss!1181) key!785 (index!37772 lt!405213)))))

(assert (=> d!111263 (bvsge (index!37772 lt!405213) #b00000000000000000000000000000000)))

(assert (=> d!111263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10143 thiss!1181) key!785 (index!37772 lt!405213)) lt!405254)))

(declare-fun bs!25183 () Bool)

(assert (= bs!25183 d!111263))

(assert (=> bs!25183 m!834989))

(declare-fun m!835059 () Bool)

(assert (=> bs!25183 m!835059))

(assert (=> b!897428 d!111263))

(declare-fun d!111265 () Bool)

(assert (=> d!111265 (= (array_inv!19904 (_keys!10143 thiss!1181)) (bvsge (size!25746 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897429 d!111265))

(declare-fun d!111267 () Bool)

(assert (=> d!111267 (= (array_inv!19905 (_values!5373 thiss!1181)) (bvsge (size!25747 (_values!5373 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897429 d!111267))

(declare-fun mapIsEmpty!29054 () Bool)

(declare-fun mapRes!29054 () Bool)

(assert (=> mapIsEmpty!29054 mapRes!29054))

(declare-fun condMapEmpty!29054 () Bool)

(declare-fun mapDefault!29054 () ValueCell!8660)

(assert (=> mapNonEmpty!29045 (= condMapEmpty!29054 (= mapRest!29045 ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29054)))))

(declare-fun e!501801 () Bool)

(assert (=> mapNonEmpty!29045 (= tp!55900 (and e!501801 mapRes!29054))))

(declare-fun mapNonEmpty!29054 () Bool)

(declare-fun tp!55916 () Bool)

(declare-fun e!501802 () Bool)

(assert (=> mapNonEmpty!29054 (= mapRes!29054 (and tp!55916 e!501802))))

(declare-fun mapValue!29054 () ValueCell!8660)

(declare-fun mapRest!29054 () (Array (_ BitVec 32) ValueCell!8660))

(declare-fun mapKey!29054 () (_ BitVec 32))

(assert (=> mapNonEmpty!29054 (= mapRest!29045 (store mapRest!29054 mapKey!29054 mapValue!29054))))

(declare-fun b!897527 () Bool)

(assert (=> b!897527 (= e!501802 tp_is_empty!18283)))

(declare-fun b!897528 () Bool)

(assert (=> b!897528 (= e!501801 tp_is_empty!18283)))

(assert (= (and mapNonEmpty!29045 condMapEmpty!29054) mapIsEmpty!29054))

(assert (= (and mapNonEmpty!29045 (not condMapEmpty!29054)) mapNonEmpty!29054))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8660) mapValue!29054)) b!897527))

(assert (= (and mapNonEmpty!29045 ((_ is ValueCellFull!8660) mapDefault!29054)) b!897528))

(declare-fun m!835061 () Bool)

(assert (=> mapNonEmpty!29054 m!835061))

(check-sat (not d!111255) (not b!897513) (not b_next!15955) b_and!26257 (not b!897512) tp_is_empty!18283 (not d!111263) (not b!897505) (not mapNonEmpty!29054) (not b!897514) (not d!111257) (not b!897520) (not d!111253) (not b!897487))
(check-sat b_and!26257 (not b_next!15955))
(get-model)

(declare-fun d!111269 () Bool)

(declare-fun res!606582 () Bool)

(declare-fun e!501803 () Bool)

(assert (=> d!111269 (=> res!606582 e!501803)))

(assert (=> d!111269 (= res!606582 (= (select (arr!25294 (_keys!10143 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111269 (= (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501803)))

(declare-fun b!897529 () Bool)

(declare-fun e!501804 () Bool)

(assert (=> b!897529 (= e!501803 e!501804)))

(declare-fun res!606583 () Bool)

(assert (=> b!897529 (=> (not res!606583) (not e!501804))))

(assert (=> b!897529 (= res!606583 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun b!897530 () Bool)

(assert (=> b!897530 (= e!501804 (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111269 (not res!606582)) b!897529))

(assert (= (and b!897529 res!606583) b!897530))

(declare-fun m!835063 () Bool)

(assert (=> d!111269 m!835063))

(declare-fun m!835065 () Bool)

(assert (=> b!897530 m!835065))

(assert (=> b!897520 d!111269))

(declare-fun b!897550 () Bool)

(declare-fun lt!405260 () SeekEntryResult!8850)

(assert (=> b!897550 (and (bvsge (index!37773 lt!405260) #b00000000000000000000000000000000) (bvslt (index!37773 lt!405260) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun e!501819 () Bool)

(assert (=> b!897550 (= e!501819 (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37773 lt!405260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!897551 () Bool)

(assert (=> b!897551 (and (bvsge (index!37773 lt!405260) #b00000000000000000000000000000000) (bvslt (index!37773 lt!405260) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun res!606591 () Bool)

(assert (=> b!897551 (= res!606591 (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37773 lt!405260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897551 (=> res!606591 e!501819)))

(declare-fun b!897552 () Bool)

(assert (=> b!897552 (and (bvsge (index!37773 lt!405260) #b00000000000000000000000000000000) (bvslt (index!37773 lt!405260) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun res!606590 () Bool)

(assert (=> b!897552 (= res!606590 (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37773 lt!405260)) key!785))))

(assert (=> b!897552 (=> res!606590 e!501819)))

(declare-fun e!501818 () Bool)

(assert (=> b!897552 (= e!501818 e!501819)))

(declare-fun b!897553 () Bool)

(declare-fun e!501817 () SeekEntryResult!8850)

(assert (=> b!897553 (= e!501817 (Intermediate!8850 true (toIndex!0 key!785 (mask!26069 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897554 () Bool)

(declare-fun e!501816 () SeekEntryResult!8850)

(assert (=> b!897554 (= e!501816 (Intermediate!8850 false (toIndex!0 key!785 (mask!26069 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897549 () Bool)

(declare-fun e!501815 () Bool)

(assert (=> b!897549 (= e!501815 e!501818)))

(declare-fun res!606592 () Bool)

(assert (=> b!897549 (= res!606592 (and ((_ is Intermediate!8850) lt!405260) (not (undefined!9662 lt!405260)) (bvslt (x!76313 lt!405260) #b01111111111111111111111111111110) (bvsge (x!76313 lt!405260) #b00000000000000000000000000000000) (bvsge (x!76313 lt!405260) #b00000000000000000000000000000000)))))

(assert (=> b!897549 (=> (not res!606592) (not e!501818))))

(declare-fun d!111271 () Bool)

(assert (=> d!111271 e!501815))

(declare-fun c!94990 () Bool)

(assert (=> d!111271 (= c!94990 (and ((_ is Intermediate!8850) lt!405260) (undefined!9662 lt!405260)))))

(assert (=> d!111271 (= lt!405260 e!501817)))

(declare-fun c!94991 () Bool)

(assert (=> d!111271 (= c!94991 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!405259 () (_ BitVec 64))

(assert (=> d!111271 (= lt!405259 (select (arr!25294 (_keys!10143 thiss!1181)) (toIndex!0 key!785 (mask!26069 thiss!1181))))))

(assert (=> d!111271 (validMask!0 (mask!26069 thiss!1181))))

(assert (=> d!111271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26069 thiss!1181)) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)) lt!405260)))

(declare-fun b!897555 () Bool)

(assert (=> b!897555 (= e!501815 (bvsge (x!76313 lt!405260) #b01111111111111111111111111111110))))

(declare-fun b!897556 () Bool)

(assert (=> b!897556 (= e!501817 e!501816)))

(declare-fun c!94989 () Bool)

(assert (=> b!897556 (= c!94989 (or (= lt!405259 key!785) (= (bvadd lt!405259 lt!405259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!897557 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897557 (= e!501816 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26069 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26069 thiss!1181)) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(assert (= (and d!111271 c!94991) b!897553))

(assert (= (and d!111271 (not c!94991)) b!897556))

(assert (= (and b!897556 c!94989) b!897554))

(assert (= (and b!897556 (not c!94989)) b!897557))

(assert (= (and d!111271 c!94990) b!897555))

(assert (= (and d!111271 (not c!94990)) b!897549))

(assert (= (and b!897549 res!606592) b!897552))

(assert (= (and b!897552 (not res!606590)) b!897551))

(assert (= (and b!897551 (not res!606591)) b!897550))

(declare-fun m!835067 () Bool)

(assert (=> b!897551 m!835067))

(assert (=> b!897552 m!835067))

(assert (=> b!897557 m!835041))

(declare-fun m!835069 () Bool)

(assert (=> b!897557 m!835069))

(assert (=> b!897557 m!835069))

(declare-fun m!835071 () Bool)

(assert (=> b!897557 m!835071))

(assert (=> b!897550 m!835067))

(assert (=> d!111271 m!835041))

(declare-fun m!835073 () Bool)

(assert (=> d!111271 m!835073))

(assert (=> d!111271 m!834987))

(assert (=> d!111255 d!111271))

(declare-fun d!111273 () Bool)

(declare-fun lt!405266 () (_ BitVec 32))

(declare-fun lt!405265 () (_ BitVec 32))

(assert (=> d!111273 (= lt!405266 (bvmul (bvxor lt!405265 (bvlshr lt!405265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111273 (= lt!405265 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111273 (and (bvsge (mask!26069 thiss!1181) #b00000000000000000000000000000000) (let ((res!606593 (let ((h!18915 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76331 (bvmul (bvxor h!18915 (bvlshr h!18915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76331 (bvlshr x!76331 #b00000000000000000000000000001101)) (mask!26069 thiss!1181)))))) (and (bvslt res!606593 (bvadd (mask!26069 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606593 #b00000000000000000000000000000000))))))

(assert (=> d!111273 (= (toIndex!0 key!785 (mask!26069 thiss!1181)) (bvand (bvxor lt!405266 (bvlshr lt!405266 #b00000000000000000000000000001101)) (mask!26069 thiss!1181)))))

(assert (=> d!111255 d!111273))

(assert (=> d!111255 d!111259))

(assert (=> d!111263 d!111261))

(declare-fun d!111275 () Bool)

(assert (=> d!111275 (arrayContainsKey!0 (_keys!10143 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111275 true))

(declare-fun _$60!406 () Unit!30474)

(assert (=> d!111275 (= (choose!13 (_keys!10143 thiss!1181) key!785 (index!37772 lt!405213)) _$60!406)))

(declare-fun bs!25184 () Bool)

(assert (= bs!25184 d!111275))

(assert (=> bs!25184 m!834989))

(assert (=> d!111263 d!111275))

(declare-fun b!897570 () Bool)

(declare-fun e!501828 () SeekEntryResult!8850)

(assert (=> b!897570 (= e!501828 (Found!8850 (index!37773 lt!405251)))))

(declare-fun b!897571 () Bool)

(declare-fun e!501827 () SeekEntryResult!8850)

(assert (=> b!897571 (= e!501827 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76313 lt!405251) #b00000000000000000000000000000001) (nextIndex!0 (index!37773 lt!405251) (bvadd (x!76313 lt!405251) #b00000000000000000000000000000001) (mask!26069 thiss!1181)) (index!37773 lt!405251) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(declare-fun b!897572 () Bool)

(declare-fun c!94999 () Bool)

(declare-fun lt!405272 () (_ BitVec 64))

(assert (=> b!897572 (= c!94999 (= lt!405272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897572 (= e!501828 e!501827)))

(declare-fun d!111277 () Bool)

(declare-fun lt!405271 () SeekEntryResult!8850)

(assert (=> d!111277 (and (or ((_ is Undefined!8850) lt!405271) (not ((_ is Found!8850) lt!405271)) (and (bvsge (index!37772 lt!405271) #b00000000000000000000000000000000) (bvslt (index!37772 lt!405271) (size!25746 (_keys!10143 thiss!1181))))) (or ((_ is Undefined!8850) lt!405271) ((_ is Found!8850) lt!405271) (not ((_ is MissingVacant!8850) lt!405271)) (not (= (index!37774 lt!405271) (index!37773 lt!405251))) (and (bvsge (index!37774 lt!405271) #b00000000000000000000000000000000) (bvslt (index!37774 lt!405271) (size!25746 (_keys!10143 thiss!1181))))) (or ((_ is Undefined!8850) lt!405271) (ite ((_ is Found!8850) lt!405271) (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37772 lt!405271)) key!785) (and ((_ is MissingVacant!8850) lt!405271) (= (index!37774 lt!405271) (index!37773 lt!405251)) (= (select (arr!25294 (_keys!10143 thiss!1181)) (index!37774 lt!405271)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!501826 () SeekEntryResult!8850)

(assert (=> d!111277 (= lt!405271 e!501826)))

(declare-fun c!94998 () Bool)

(assert (=> d!111277 (= c!94998 (bvsge (x!76313 lt!405251) #b01111111111111111111111111111110))))

(assert (=> d!111277 (= lt!405272 (select (arr!25294 (_keys!10143 thiss!1181)) (index!37773 lt!405251)))))

(assert (=> d!111277 (validMask!0 (mask!26069 thiss!1181))))

(assert (=> d!111277 (= (seekKeyOrZeroReturnVacant!0 (x!76313 lt!405251) (index!37773 lt!405251) (index!37773 lt!405251) key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)) lt!405271)))

(declare-fun b!897573 () Bool)

(assert (=> b!897573 (= e!501826 Undefined!8850)))

(declare-fun b!897574 () Bool)

(assert (=> b!897574 (= e!501827 (MissingVacant!8850 (index!37773 lt!405251)))))

(declare-fun b!897575 () Bool)

(assert (=> b!897575 (= e!501826 e!501828)))

(declare-fun c!95000 () Bool)

(assert (=> b!897575 (= c!95000 (= lt!405272 key!785))))

(assert (= (and d!111277 c!94998) b!897573))

(assert (= (and d!111277 (not c!94998)) b!897575))

(assert (= (and b!897575 c!95000) b!897570))

(assert (= (and b!897575 (not c!95000)) b!897572))

(assert (= (and b!897572 c!94999) b!897574))

(assert (= (and b!897572 (not c!94999)) b!897571))

(declare-fun m!835075 () Bool)

(assert (=> b!897571 m!835075))

(assert (=> b!897571 m!835075))

(declare-fun m!835077 () Bool)

(assert (=> b!897571 m!835077))

(declare-fun m!835079 () Bool)

(assert (=> d!111277 m!835079))

(declare-fun m!835081 () Bool)

(assert (=> d!111277 m!835081))

(assert (=> d!111277 m!835037))

(assert (=> d!111277 m!834987))

(assert (=> b!897505 d!111277))

(declare-fun d!111279 () Bool)

(declare-fun res!606604 () Bool)

(declare-fun e!501831 () Bool)

(assert (=> d!111279 (=> (not res!606604) (not e!501831))))

(assert (=> d!111279 (= res!606604 (validMask!0 (mask!26069 thiss!1181)))))

(assert (=> d!111279 (= (simpleValid!314 thiss!1181) e!501831)))

(declare-fun b!897586 () Bool)

(declare-fun res!606603 () Bool)

(assert (=> b!897586 (=> (not res!606603) (not e!501831))))

(declare-fun size!25752 (LongMapFixedSize!4336) (_ BitVec 32))

(assert (=> b!897586 (= res!606603 (= (size!25752 thiss!1181) (bvadd (_size!2223 thiss!1181) (bvsdiv (bvadd (extraKeys!5082 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897585 () Bool)

(declare-fun res!606602 () Bool)

(assert (=> b!897585 (=> (not res!606602) (not e!501831))))

(assert (=> b!897585 (= res!606602 (bvsge (size!25752 thiss!1181) (_size!2223 thiss!1181)))))

(declare-fun b!897584 () Bool)

(declare-fun res!606605 () Bool)

(assert (=> b!897584 (=> (not res!606605) (not e!501831))))

(assert (=> b!897584 (= res!606605 (and (= (size!25747 (_values!5373 thiss!1181)) (bvadd (mask!26069 thiss!1181) #b00000000000000000000000000000001)) (= (size!25746 (_keys!10143 thiss!1181)) (size!25747 (_values!5373 thiss!1181))) (bvsge (_size!2223 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2223 thiss!1181) (bvadd (mask!26069 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!897587 () Bool)

(assert (=> b!897587 (= e!501831 (and (bvsge (extraKeys!5082 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5082 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2223 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!111279 res!606604) b!897584))

(assert (= (and b!897584 res!606605) b!897585))

(assert (= (and b!897585 res!606602) b!897586))

(assert (= (and b!897586 res!606603) b!897587))

(assert (=> d!111279 m!834987))

(declare-fun m!835083 () Bool)

(assert (=> b!897586 m!835083))

(assert (=> b!897585 m!835083))

(assert (=> d!111257 d!111279))

(assert (=> d!111253 d!111255))

(declare-fun d!111281 () Bool)

(declare-fun e!501834 () Bool)

(assert (=> d!111281 e!501834))

(declare-fun res!606608 () Bool)

(assert (=> d!111281 (=> res!606608 e!501834)))

(declare-fun lt!405275 () SeekEntryResult!8850)

(assert (=> d!111281 (= res!606608 (not ((_ is Found!8850) lt!405275)))))

(assert (=> d!111281 (= lt!405275 (seekEntry!0 key!785 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(assert (=> d!111281 true))

(declare-fun _$36!354 () Unit!30474)

(assert (=> d!111281 (= (choose!1485 (_keys!10143 thiss!1181) (_values!5373 thiss!1181) (mask!26069 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785) _$36!354)))

(declare-fun b!897590 () Bool)

(assert (=> b!897590 (= e!501834 (inRange!0 (index!37772 lt!405275) (mask!26069 thiss!1181)))))

(assert (= (and d!111281 (not res!606608)) b!897590))

(assert (=> d!111281 m!834979))

(declare-fun m!835085 () Bool)

(assert (=> b!897590 m!835085))

(assert (=> d!111253 d!111281))

(assert (=> d!111253 d!111259))

(declare-fun bm!39823 () Bool)

(declare-fun call!39826 () (_ BitVec 32))

(assert (=> bm!39823 (= call!39826 (arrayCountValidKeys!0 (_keys!10143 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25746 (_keys!10143 thiss!1181))))))

(declare-fun b!897599 () Bool)

(declare-fun e!501839 () (_ BitVec 32))

(assert (=> b!897599 (= e!501839 call!39826)))

(declare-fun b!897600 () Bool)

(assert (=> b!897600 (= e!501839 (bvadd #b00000000000000000000000000000001 call!39826))))

(declare-fun d!111283 () Bool)

(declare-fun lt!405278 () (_ BitVec 32))

(assert (=> d!111283 (and (bvsge lt!405278 #b00000000000000000000000000000000) (bvsle lt!405278 (bvsub (size!25746 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!501840 () (_ BitVec 32))

(assert (=> d!111283 (= lt!405278 e!501840)))

(declare-fun c!95005 () Bool)

(assert (=> d!111283 (= c!95005 (bvsge #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))))))

(assert (=> d!111283 (and (bvsle #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25746 (_keys!10143 thiss!1181)) (size!25746 (_keys!10143 thiss!1181))))))

(assert (=> d!111283 (= (arrayCountValidKeys!0 (_keys!10143 thiss!1181) #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))) lt!405278)))

(declare-fun b!897601 () Bool)

(assert (=> b!897601 (= e!501840 #b00000000000000000000000000000000)))

(declare-fun b!897602 () Bool)

(assert (=> b!897602 (= e!501840 e!501839)))

(declare-fun c!95006 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897602 (= c!95006 (validKeyInArray!0 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111283 c!95005) b!897601))

(assert (= (and d!111283 (not c!95005)) b!897602))

(assert (= (and b!897602 c!95006) b!897600))

(assert (= (and b!897602 (not c!95006)) b!897599))

(assert (= (or b!897600 b!897599) bm!39823))

(declare-fun m!835087 () Bool)

(assert (=> bm!39823 m!835087))

(assert (=> b!897602 m!835055))

(assert (=> b!897602 m!835055))

(declare-fun m!835089 () Bool)

(assert (=> b!897602 m!835089))

(assert (=> b!897512 d!111283))

(declare-fun b!897611 () Bool)

(declare-fun e!501847 () Bool)

(declare-fun e!501848 () Bool)

(assert (=> b!897611 (= e!501847 e!501848)))

(declare-fun c!95009 () Bool)

(assert (=> b!897611 (= c!95009 (validKeyInArray!0 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897612 () Bool)

(declare-fun e!501849 () Bool)

(declare-fun call!39829 () Bool)

(assert (=> b!897612 (= e!501849 call!39829)))

(declare-fun b!897613 () Bool)

(assert (=> b!897613 (= e!501848 e!501849)))

(declare-fun lt!405285 () (_ BitVec 64))

(assert (=> b!897613 (= lt!405285 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405286 () Unit!30474)

(assert (=> b!897613 (= lt!405286 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10143 thiss!1181) lt!405285 #b00000000000000000000000000000000))))

(assert (=> b!897613 (arrayContainsKey!0 (_keys!10143 thiss!1181) lt!405285 #b00000000000000000000000000000000)))

(declare-fun lt!405287 () Unit!30474)

(assert (=> b!897613 (= lt!405287 lt!405286)))

(declare-fun res!606614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52623 (_ BitVec 32)) SeekEntryResult!8850)

(assert (=> b!897613 (= res!606614 (= (seekEntryOrOpen!0 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000) (_keys!10143 thiss!1181) (mask!26069 thiss!1181)) (Found!8850 #b00000000000000000000000000000000)))))

(assert (=> b!897613 (=> (not res!606614) (not e!501849))))

(declare-fun bm!39826 () Bool)

(assert (=> bm!39826 (= call!39829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10143 thiss!1181) (mask!26069 thiss!1181)))))

(declare-fun b!897614 () Bool)

(assert (=> b!897614 (= e!501848 call!39829)))

(declare-fun d!111285 () Bool)

(declare-fun res!606613 () Bool)

(assert (=> d!111285 (=> res!606613 e!501847)))

(assert (=> d!111285 (= res!606613 (bvsge #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))))))

(assert (=> d!111285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10143 thiss!1181) (mask!26069 thiss!1181)) e!501847)))

(assert (= (and d!111285 (not res!606613)) b!897611))

(assert (= (and b!897611 c!95009) b!897613))

(assert (= (and b!897611 (not c!95009)) b!897614))

(assert (= (and b!897613 res!606614) b!897612))

(assert (= (or b!897612 b!897614) bm!39826))

(assert (=> b!897611 m!835055))

(assert (=> b!897611 m!835055))

(assert (=> b!897611 m!835089))

(assert (=> b!897613 m!835055))

(declare-fun m!835091 () Bool)

(assert (=> b!897613 m!835091))

(declare-fun m!835093 () Bool)

(assert (=> b!897613 m!835093))

(assert (=> b!897613 m!835055))

(declare-fun m!835095 () Bool)

(assert (=> b!897613 m!835095))

(declare-fun m!835097 () Bool)

(assert (=> bm!39826 m!835097))

(assert (=> b!897513 d!111285))

(declare-fun b!897625 () Bool)

(declare-fun e!501859 () Bool)

(declare-fun call!39832 () Bool)

(assert (=> b!897625 (= e!501859 call!39832)))

(declare-fun b!897626 () Bool)

(assert (=> b!897626 (= e!501859 call!39832)))

(declare-fun b!897627 () Bool)

(declare-fun e!501860 () Bool)

(declare-fun contains!4372 (List!17774 (_ BitVec 64)) Bool)

(assert (=> b!897627 (= e!501860 (contains!4372 Nil!17771 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897628 () Bool)

(declare-fun e!501858 () Bool)

(assert (=> b!897628 (= e!501858 e!501859)))

(declare-fun c!95012 () Bool)

(assert (=> b!897628 (= c!95012 (validKeyInArray!0 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111287 () Bool)

(declare-fun res!606622 () Bool)

(declare-fun e!501861 () Bool)

(assert (=> d!111287 (=> res!606622 e!501861)))

(assert (=> d!111287 (= res!606622 (bvsge #b00000000000000000000000000000000 (size!25746 (_keys!10143 thiss!1181))))))

(assert (=> d!111287 (= (arrayNoDuplicates!0 (_keys!10143 thiss!1181) #b00000000000000000000000000000000 Nil!17771) e!501861)))

(declare-fun bm!39829 () Bool)

(assert (=> bm!39829 (= call!39832 (arrayNoDuplicates!0 (_keys!10143 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95012 (Cons!17770 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000) Nil!17771) Nil!17771)))))

(declare-fun b!897629 () Bool)

(assert (=> b!897629 (= e!501861 e!501858)))

(declare-fun res!606623 () Bool)

(assert (=> b!897629 (=> (not res!606623) (not e!501858))))

(assert (=> b!897629 (= res!606623 (not e!501860))))

(declare-fun res!606621 () Bool)

(assert (=> b!897629 (=> (not res!606621) (not e!501860))))

(assert (=> b!897629 (= res!606621 (validKeyInArray!0 (select (arr!25294 (_keys!10143 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111287 (not res!606622)) b!897629))

(assert (= (and b!897629 res!606621) b!897627))

(assert (= (and b!897629 res!606623) b!897628))

(assert (= (and b!897628 c!95012) b!897625))

(assert (= (and b!897628 (not c!95012)) b!897626))

(assert (= (or b!897625 b!897626) bm!39829))

(assert (=> b!897627 m!835055))

(assert (=> b!897627 m!835055))

(declare-fun m!835099 () Bool)

(assert (=> b!897627 m!835099))

(assert (=> b!897628 m!835055))

(assert (=> b!897628 m!835055))

(assert (=> b!897628 m!835089))

(assert (=> bm!39829 m!835055))

(declare-fun m!835101 () Bool)

(assert (=> bm!39829 m!835101))

(assert (=> b!897629 m!835055))

(assert (=> b!897629 m!835055))

(assert (=> b!897629 m!835089))

(assert (=> b!897514 d!111287))

(declare-fun d!111289 () Bool)

(assert (=> d!111289 (= (inRange!0 (index!37772 lt!405239) (mask!26069 thiss!1181)) (and (bvsge (index!37772 lt!405239) #b00000000000000000000000000000000) (bvslt (index!37772 lt!405239) (bvadd (mask!26069 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897487 d!111289))

(declare-fun mapIsEmpty!29055 () Bool)

(declare-fun mapRes!29055 () Bool)

(assert (=> mapIsEmpty!29055 mapRes!29055))

(declare-fun condMapEmpty!29055 () Bool)

(declare-fun mapDefault!29055 () ValueCell!8660)

(assert (=> mapNonEmpty!29054 (= condMapEmpty!29055 (= mapRest!29054 ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29055)))))

(declare-fun e!501862 () Bool)

(assert (=> mapNonEmpty!29054 (= tp!55916 (and e!501862 mapRes!29055))))

(declare-fun mapNonEmpty!29055 () Bool)

(declare-fun tp!55917 () Bool)

(declare-fun e!501863 () Bool)

(assert (=> mapNonEmpty!29055 (= mapRes!29055 (and tp!55917 e!501863))))

(declare-fun mapKey!29055 () (_ BitVec 32))

(declare-fun mapValue!29055 () ValueCell!8660)

(declare-fun mapRest!29055 () (Array (_ BitVec 32) ValueCell!8660))

(assert (=> mapNonEmpty!29055 (= mapRest!29054 (store mapRest!29055 mapKey!29055 mapValue!29055))))

(declare-fun b!897630 () Bool)

(assert (=> b!897630 (= e!501863 tp_is_empty!18283)))

(declare-fun b!897631 () Bool)

(assert (=> b!897631 (= e!501862 tp_is_empty!18283)))

(assert (= (and mapNonEmpty!29054 condMapEmpty!29055) mapIsEmpty!29055))

(assert (= (and mapNonEmpty!29054 (not condMapEmpty!29055)) mapNonEmpty!29055))

(assert (= (and mapNonEmpty!29055 ((_ is ValueCellFull!8660) mapValue!29055)) b!897630))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8660) mapDefault!29055)) b!897631))

(declare-fun m!835103 () Bool)

(assert (=> mapNonEmpty!29055 m!835103))

(check-sat (not b!897613) b_and!26257 (not b!897530) (not d!111275) tp_is_empty!18283 (not b!897627) (not b!897628) (not b!897586) (not d!111277) (not d!111279) (not d!111271) (not b!897629) (not bm!39829) (not b!897590) (not d!111281) (not b_next!15955) (not b!897602) (not b!897557) (not bm!39823) (not b!897571) (not bm!39826) (not b!897585) (not mapNonEmpty!29055) (not b!897611))
(check-sat b_and!26257 (not b_next!15955))
