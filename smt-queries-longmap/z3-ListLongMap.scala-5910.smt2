; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76494 () Bool)

(assert start!76494)

(declare-fun b!896512 () Bool)

(declare-fun b_free!15961 () Bool)

(declare-fun b_next!15961 () Bool)

(assert (=> b!896512 (= b_free!15961 (not b_next!15961))))

(declare-fun tp!55922 () Bool)

(declare-fun b_and!26227 () Bool)

(assert (=> b!896512 (= tp!55922 b_and!26227)))

(declare-fun mapNonEmpty!29058 () Bool)

(declare-fun mapRes!29058 () Bool)

(declare-fun tp!55923 () Bool)

(declare-fun e!501158 () Bool)

(assert (=> mapNonEmpty!29058 (= mapRes!29058 (and tp!55923 e!501158))))

(declare-fun mapKey!29058 () (_ BitVec 32))

(declare-datatypes ((V!29351 0))(
  ( (V!29352 (val!9195 Int)) )
))
(declare-datatypes ((ValueCell!8663 0))(
  ( (ValueCellFull!8663 (v!11682 V!29351)) (EmptyCell!8663) )
))
(declare-fun mapRest!29058 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapValue!29058 () ValueCell!8663)

(declare-datatypes ((array!52581 0))(
  ( (array!52582 (arr!25277 (Array (_ BitVec 32) (_ BitVec 64))) (size!25731 (_ BitVec 32))) )
))
(declare-datatypes ((array!52583 0))(
  ( (array!52584 (arr!25278 (Array (_ BitVec 32) ValueCell!8663)) (size!25732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4342 0))(
  ( (LongMapFixedSize!4343 (defaultEntry!5383 Int) (mask!26033 (_ BitVec 32)) (extraKeys!5087 (_ BitVec 32)) (zeroValue!5191 V!29351) (minValue!5191 V!29351) (_size!2226 (_ BitVec 32)) (_keys!10119 array!52581) (_values!5378 array!52583) (_vacant!2226 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4342)

(assert (=> mapNonEmpty!29058 (= (arr!25278 (_values!5378 thiss!1181)) (store mapRest!29058 mapKey!29058 mapValue!29058))))

(declare-fun b!896508 () Bool)

(declare-fun tp_is_empty!18289 () Bool)

(assert (=> b!896508 (= e!501158 tp_is_empty!18289)))

(declare-fun b!896509 () Bool)

(declare-fun e!501160 () Bool)

(declare-fun e!501159 () Bool)

(assert (=> b!896509 (= e!501160 (and e!501159 mapRes!29058))))

(declare-fun condMapEmpty!29058 () Bool)

(declare-fun mapDefault!29058 () ValueCell!8663)

(assert (=> b!896509 (= condMapEmpty!29058 (= (arr!25278 (_values!5378 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29058)))))

(declare-fun b!896510 () Bool)

(declare-fun e!501152 () Bool)

(declare-datatypes ((SeekEntryResult!8906 0))(
  ( (MissingZero!8906 (index!37995 (_ BitVec 32))) (Found!8906 (index!37996 (_ BitVec 32))) (Intermediate!8906 (undefined!9718 Bool) (index!37997 (_ BitVec 32)) (x!76375 (_ BitVec 32))) (Undefined!8906) (MissingVacant!8906 (index!37998 (_ BitVec 32))) )
))
(declare-fun lt!404697 () SeekEntryResult!8906)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896510 (= e!501152 (inRange!0 (index!37996 lt!404697) (mask!26033 thiss!1181)))))

(declare-fun b!896511 () Bool)

(declare-fun e!501154 () Bool)

(declare-fun e!501155 () Bool)

(assert (=> b!896511 (= e!501154 e!501155)))

(declare-fun res!606182 () Bool)

(assert (=> b!896511 (=> res!606182 e!501155)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896511 (= res!606182 (not (validMask!0 (mask!26033 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896511 (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30436 0))(
  ( (Unit!30437) )
))
(declare-fun lt!404698 () Unit!30436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52581 (_ BitVec 64) (_ BitVec 32)) Unit!30436)

(assert (=> b!896511 (= lt!404698 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10119 thiss!1181) key!785 (index!37996 lt!404697)))))

(declare-fun e!501153 () Bool)

(declare-fun array_inv!19896 (array!52581) Bool)

(declare-fun array_inv!19897 (array!52583) Bool)

(assert (=> b!896512 (= e!501153 (and tp!55922 tp_is_empty!18289 (array_inv!19896 (_keys!10119 thiss!1181)) (array_inv!19897 (_values!5378 thiss!1181)) e!501160))))

(declare-fun b!896513 () Bool)

(declare-fun res!606180 () Bool)

(declare-fun e!501157 () Bool)

(assert (=> b!896513 (=> (not res!606180) (not e!501157))))

(assert (=> b!896513 (= res!606180 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606183 () Bool)

(assert (=> start!76494 (=> (not res!606183) (not e!501157))))

(declare-fun valid!1680 (LongMapFixedSize!4342) Bool)

(assert (=> start!76494 (= res!606183 (valid!1680 thiss!1181))))

(assert (=> start!76494 e!501157))

(assert (=> start!76494 e!501153))

(assert (=> start!76494 true))

(declare-fun mapIsEmpty!29058 () Bool)

(assert (=> mapIsEmpty!29058 mapRes!29058))

(declare-fun b!896514 () Bool)

(assert (=> b!896514 (= e!501157 (not e!501154))))

(declare-fun res!606184 () Bool)

(assert (=> b!896514 (=> res!606184 e!501154)))

(get-info :version)

(assert (=> b!896514 (= res!606184 (not ((_ is Found!8906) lt!404697)))))

(assert (=> b!896514 e!501152))

(declare-fun res!606181 () Bool)

(assert (=> b!896514 (=> res!606181 e!501152)))

(assert (=> b!896514 (= res!606181 (not ((_ is Found!8906) lt!404697)))))

(declare-fun lt!404699 () Unit!30436)

(declare-fun lemmaSeekEntryGivesInRangeIndex!76 (array!52581 array!52583 (_ BitVec 32) (_ BitVec 32) V!29351 V!29351 (_ BitVec 64)) Unit!30436)

(assert (=> b!896514 (= lt!404699 (lemmaSeekEntryGivesInRangeIndex!76 (_keys!10119 thiss!1181) (_values!5378 thiss!1181) (mask!26033 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!896514 (= lt!404697 (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun b!896515 () Bool)

(assert (=> b!896515 (= e!501155 (or (not (= (size!25732 (_values!5378 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26033 thiss!1181)))) (= (size!25731 (_keys!10119 thiss!1181)) (size!25732 (_values!5378 thiss!1181)))))))

(declare-fun b!896516 () Bool)

(assert (=> b!896516 (= e!501159 tp_is_empty!18289)))

(assert (= (and start!76494 res!606183) b!896513))

(assert (= (and b!896513 res!606180) b!896514))

(assert (= (and b!896514 (not res!606181)) b!896510))

(assert (= (and b!896514 (not res!606184)) b!896511))

(assert (= (and b!896511 (not res!606182)) b!896515))

(assert (= (and b!896509 condMapEmpty!29058) mapIsEmpty!29058))

(assert (= (and b!896509 (not condMapEmpty!29058)) mapNonEmpty!29058))

(assert (= (and mapNonEmpty!29058 ((_ is ValueCellFull!8663) mapValue!29058)) b!896508))

(assert (= (and b!896509 ((_ is ValueCellFull!8663) mapDefault!29058)) b!896516))

(assert (= b!896512 b!896509))

(assert (= start!76494 b!896512))

(declare-fun m!833053 () Bool)

(assert (=> b!896510 m!833053))

(declare-fun m!833055 () Bool)

(assert (=> b!896512 m!833055))

(declare-fun m!833057 () Bool)

(assert (=> b!896512 m!833057))

(declare-fun m!833059 () Bool)

(assert (=> b!896511 m!833059))

(declare-fun m!833061 () Bool)

(assert (=> b!896511 m!833061))

(declare-fun m!833063 () Bool)

(assert (=> b!896511 m!833063))

(declare-fun m!833065 () Bool)

(assert (=> start!76494 m!833065))

(declare-fun m!833067 () Bool)

(assert (=> mapNonEmpty!29058 m!833067))

(declare-fun m!833069 () Bool)

(assert (=> b!896514 m!833069))

(declare-fun m!833071 () Bool)

(assert (=> b!896514 m!833071))

(check-sat (not b!896512) (not b!896514) (not b_next!15961) tp_is_empty!18289 (not mapNonEmpty!29058) (not b!896510) (not b!896511) (not start!76494) b_and!26227)
(check-sat b_and!26227 (not b_next!15961))
(get-model)

(declare-fun d!110773 () Bool)

(assert (=> d!110773 (= (array_inv!19896 (_keys!10119 thiss!1181)) (bvsge (size!25731 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896512 d!110773))

(declare-fun d!110775 () Bool)

(assert (=> d!110775 (= (array_inv!19897 (_values!5378 thiss!1181)) (bvsge (size!25732 (_values!5378 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896512 d!110775))

(declare-fun d!110777 () Bool)

(assert (=> d!110777 (= (validMask!0 (mask!26033 thiss!1181)) (and (or (= (mask!26033 thiss!1181) #b00000000000000000000000000000111) (= (mask!26033 thiss!1181) #b00000000000000000000000000001111) (= (mask!26033 thiss!1181) #b00000000000000000000000000011111) (= (mask!26033 thiss!1181) #b00000000000000000000000000111111) (= (mask!26033 thiss!1181) #b00000000000000000000000001111111) (= (mask!26033 thiss!1181) #b00000000000000000000000011111111) (= (mask!26033 thiss!1181) #b00000000000000000000000111111111) (= (mask!26033 thiss!1181) #b00000000000000000000001111111111) (= (mask!26033 thiss!1181) #b00000000000000000000011111111111) (= (mask!26033 thiss!1181) #b00000000000000000000111111111111) (= (mask!26033 thiss!1181) #b00000000000000000001111111111111) (= (mask!26033 thiss!1181) #b00000000000000000011111111111111) (= (mask!26033 thiss!1181) #b00000000000000000111111111111111) (= (mask!26033 thiss!1181) #b00000000000000001111111111111111) (= (mask!26033 thiss!1181) #b00000000000000011111111111111111) (= (mask!26033 thiss!1181) #b00000000000000111111111111111111) (= (mask!26033 thiss!1181) #b00000000000001111111111111111111) (= (mask!26033 thiss!1181) #b00000000000011111111111111111111) (= (mask!26033 thiss!1181) #b00000000000111111111111111111111) (= (mask!26033 thiss!1181) #b00000000001111111111111111111111) (= (mask!26033 thiss!1181) #b00000000011111111111111111111111) (= (mask!26033 thiss!1181) #b00000000111111111111111111111111) (= (mask!26033 thiss!1181) #b00000001111111111111111111111111) (= (mask!26033 thiss!1181) #b00000011111111111111111111111111) (= (mask!26033 thiss!1181) #b00000111111111111111111111111111) (= (mask!26033 thiss!1181) #b00001111111111111111111111111111) (= (mask!26033 thiss!1181) #b00011111111111111111111111111111) (= (mask!26033 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26033 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896511 d!110777))

(declare-fun d!110779 () Bool)

(declare-fun res!606219 () Bool)

(declare-fun e!501219 () Bool)

(assert (=> d!110779 (=> res!606219 e!501219)))

(assert (=> d!110779 (= res!606219 (= (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110779 (= (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 #b00000000000000000000000000000000) e!501219)))

(declare-fun b!896575 () Bool)

(declare-fun e!501220 () Bool)

(assert (=> b!896575 (= e!501219 e!501220)))

(declare-fun res!606220 () Bool)

(assert (=> b!896575 (=> (not res!606220) (not e!501220))))

(assert (=> b!896575 (= res!606220 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25731 (_keys!10119 thiss!1181))))))

(declare-fun b!896576 () Bool)

(assert (=> b!896576 (= e!501220 (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110779 (not res!606219)) b!896575))

(assert (= (and b!896575 res!606220) b!896576))

(declare-fun m!833113 () Bool)

(assert (=> d!110779 m!833113))

(declare-fun m!833115 () Bool)

(assert (=> b!896576 m!833115))

(assert (=> b!896511 d!110779))

(declare-fun d!110781 () Bool)

(assert (=> d!110781 (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404720 () Unit!30436)

(declare-fun choose!13 (array!52581 (_ BitVec 64) (_ BitVec 32)) Unit!30436)

(assert (=> d!110781 (= lt!404720 (choose!13 (_keys!10119 thiss!1181) key!785 (index!37996 lt!404697)))))

(assert (=> d!110781 (bvsge (index!37996 lt!404697) #b00000000000000000000000000000000)))

(assert (=> d!110781 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10119 thiss!1181) key!785 (index!37996 lt!404697)) lt!404720)))

(declare-fun bs!25142 () Bool)

(assert (= bs!25142 d!110781))

(assert (=> bs!25142 m!833061))

(declare-fun m!833117 () Bool)

(assert (=> bs!25142 m!833117))

(assert (=> b!896511 d!110781))

(declare-fun d!110783 () Bool)

(declare-fun e!501223 () Bool)

(assert (=> d!110783 e!501223))

(declare-fun res!606223 () Bool)

(assert (=> d!110783 (=> res!606223 e!501223)))

(declare-fun lt!404726 () SeekEntryResult!8906)

(assert (=> d!110783 (= res!606223 (not ((_ is Found!8906) lt!404726)))))

(assert (=> d!110783 (= lt!404726 (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun lt!404725 () Unit!30436)

(declare-fun choose!1489 (array!52581 array!52583 (_ BitVec 32) (_ BitVec 32) V!29351 V!29351 (_ BitVec 64)) Unit!30436)

(assert (=> d!110783 (= lt!404725 (choose!1489 (_keys!10119 thiss!1181) (_values!5378 thiss!1181) (mask!26033 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785))))

(assert (=> d!110783 (validMask!0 (mask!26033 thiss!1181))))

(assert (=> d!110783 (= (lemmaSeekEntryGivesInRangeIndex!76 (_keys!10119 thiss!1181) (_values!5378 thiss!1181) (mask!26033 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785) lt!404725)))

(declare-fun b!896579 () Bool)

(assert (=> b!896579 (= e!501223 (inRange!0 (index!37996 lt!404726) (mask!26033 thiss!1181)))))

(assert (= (and d!110783 (not res!606223)) b!896579))

(assert (=> d!110783 m!833071))

(declare-fun m!833119 () Bool)

(assert (=> d!110783 m!833119))

(assert (=> d!110783 m!833059))

(declare-fun m!833121 () Bool)

(assert (=> b!896579 m!833121))

(assert (=> b!896514 d!110783))

(declare-fun d!110785 () Bool)

(declare-fun lt!404738 () SeekEntryResult!8906)

(assert (=> d!110785 (and (or ((_ is MissingVacant!8906) lt!404738) (not ((_ is Found!8906) lt!404738)) (and (bvsge (index!37996 lt!404738) #b00000000000000000000000000000000) (bvslt (index!37996 lt!404738) (size!25731 (_keys!10119 thiss!1181))))) (not ((_ is MissingVacant!8906) lt!404738)) (or (not ((_ is Found!8906) lt!404738)) (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37996 lt!404738)) key!785)))))

(declare-fun e!501230 () SeekEntryResult!8906)

(assert (=> d!110785 (= lt!404738 e!501230)))

(declare-fun c!94673 () Bool)

(declare-fun lt!404737 () SeekEntryResult!8906)

(assert (=> d!110785 (= c!94673 (and ((_ is Intermediate!8906) lt!404737) (undefined!9718 lt!404737)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110785 (= lt!404737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26033 thiss!1181)) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(assert (=> d!110785 (validMask!0 (mask!26033 thiss!1181))))

(assert (=> d!110785 (= (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)) lt!404738)))

(declare-fun b!896592 () Bool)

(declare-fun e!501231 () SeekEntryResult!8906)

(assert (=> b!896592 (= e!501230 e!501231)))

(declare-fun lt!404735 () (_ BitVec 64))

(assert (=> b!896592 (= lt!404735 (select (arr!25277 (_keys!10119 thiss!1181)) (index!37997 lt!404737)))))

(declare-fun c!94672 () Bool)

(assert (=> b!896592 (= c!94672 (= lt!404735 key!785))))

(declare-fun b!896593 () Bool)

(declare-fun c!94674 () Bool)

(assert (=> b!896593 (= c!94674 (= lt!404735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501232 () SeekEntryResult!8906)

(assert (=> b!896593 (= e!501231 e!501232)))

(declare-fun b!896594 () Bool)

(assert (=> b!896594 (= e!501232 (MissingZero!8906 (index!37997 lt!404737)))))

(declare-fun b!896595 () Bool)

(declare-fun lt!404736 () SeekEntryResult!8906)

(assert (=> b!896595 (= e!501232 (ite ((_ is MissingVacant!8906) lt!404736) (MissingZero!8906 (index!37998 lt!404736)) lt!404736))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!896595 (= lt!404736 (seekKeyOrZeroReturnVacant!0 (x!76375 lt!404737) (index!37997 lt!404737) (index!37997 lt!404737) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun b!896596 () Bool)

(assert (=> b!896596 (= e!501230 Undefined!8906)))

(declare-fun b!896597 () Bool)

(assert (=> b!896597 (= e!501231 (Found!8906 (index!37997 lt!404737)))))

(assert (= (and d!110785 c!94673) b!896596))

(assert (= (and d!110785 (not c!94673)) b!896592))

(assert (= (and b!896592 c!94672) b!896597))

(assert (= (and b!896592 (not c!94672)) b!896593))

(assert (= (and b!896593 c!94674) b!896594))

(assert (= (and b!896593 (not c!94674)) b!896595))

(declare-fun m!833123 () Bool)

(assert (=> d!110785 m!833123))

(declare-fun m!833125 () Bool)

(assert (=> d!110785 m!833125))

(assert (=> d!110785 m!833125))

(declare-fun m!833127 () Bool)

(assert (=> d!110785 m!833127))

(assert (=> d!110785 m!833059))

(declare-fun m!833129 () Bool)

(assert (=> b!896592 m!833129))

(declare-fun m!833131 () Bool)

(assert (=> b!896595 m!833131))

(assert (=> b!896514 d!110785))

(declare-fun d!110787 () Bool)

(assert (=> d!110787 (= (inRange!0 (index!37996 lt!404697) (mask!26033 thiss!1181)) (and (bvsge (index!37996 lt!404697) #b00000000000000000000000000000000) (bvslt (index!37996 lt!404697) (bvadd (mask!26033 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896510 d!110787))

(declare-fun d!110789 () Bool)

(declare-fun res!606230 () Bool)

(declare-fun e!501235 () Bool)

(assert (=> d!110789 (=> (not res!606230) (not e!501235))))

(declare-fun simpleValid!315 (LongMapFixedSize!4342) Bool)

(assert (=> d!110789 (= res!606230 (simpleValid!315 thiss!1181))))

(assert (=> d!110789 (= (valid!1680 thiss!1181) e!501235)))

(declare-fun b!896604 () Bool)

(declare-fun res!606231 () Bool)

(assert (=> b!896604 (=> (not res!606231) (not e!501235))))

(declare-fun arrayCountValidKeys!0 (array!52581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896604 (= res!606231 (= (arrayCountValidKeys!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))) (_size!2226 thiss!1181)))))

(declare-fun b!896605 () Bool)

(declare-fun res!606232 () Bool)

(assert (=> b!896605 (=> (not res!606232) (not e!501235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52581 (_ BitVec 32)) Bool)

(assert (=> b!896605 (= res!606232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun b!896606 () Bool)

(declare-datatypes ((List!17833 0))(
  ( (Nil!17830) (Cons!17829 (h!18968 (_ BitVec 64)) (t!25163 List!17833)) )
))
(declare-fun arrayNoDuplicates!0 (array!52581 (_ BitVec 32) List!17833) Bool)

(assert (=> b!896606 (= e!501235 (arrayNoDuplicates!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 Nil!17830))))

(assert (= (and d!110789 res!606230) b!896604))

(assert (= (and b!896604 res!606231) b!896605))

(assert (= (and b!896605 res!606232) b!896606))

(declare-fun m!833133 () Bool)

(assert (=> d!110789 m!833133))

(declare-fun m!833135 () Bool)

(assert (=> b!896604 m!833135))

(declare-fun m!833137 () Bool)

(assert (=> b!896605 m!833137))

(declare-fun m!833139 () Bool)

(assert (=> b!896606 m!833139))

(assert (=> start!76494 d!110789))

(declare-fun condMapEmpty!29067 () Bool)

(declare-fun mapDefault!29067 () ValueCell!8663)

(assert (=> mapNonEmpty!29058 (= condMapEmpty!29067 (= mapRest!29058 ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29067)))))

(declare-fun e!501240 () Bool)

(declare-fun mapRes!29067 () Bool)

(assert (=> mapNonEmpty!29058 (= tp!55923 (and e!501240 mapRes!29067))))

(declare-fun mapIsEmpty!29067 () Bool)

(assert (=> mapIsEmpty!29067 mapRes!29067))

(declare-fun mapNonEmpty!29067 () Bool)

(declare-fun tp!55938 () Bool)

(declare-fun e!501241 () Bool)

(assert (=> mapNonEmpty!29067 (= mapRes!29067 (and tp!55938 e!501241))))

(declare-fun mapRest!29067 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapValue!29067 () ValueCell!8663)

(declare-fun mapKey!29067 () (_ BitVec 32))

(assert (=> mapNonEmpty!29067 (= mapRest!29058 (store mapRest!29067 mapKey!29067 mapValue!29067))))

(declare-fun b!896613 () Bool)

(assert (=> b!896613 (= e!501241 tp_is_empty!18289)))

(declare-fun b!896614 () Bool)

(assert (=> b!896614 (= e!501240 tp_is_empty!18289)))

(assert (= (and mapNonEmpty!29058 condMapEmpty!29067) mapIsEmpty!29067))

(assert (= (and mapNonEmpty!29058 (not condMapEmpty!29067)) mapNonEmpty!29067))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8663) mapValue!29067)) b!896613))

(assert (= (and mapNonEmpty!29058 ((_ is ValueCellFull!8663) mapDefault!29067)) b!896614))

(declare-fun m!833141 () Bool)

(assert (=> mapNonEmpty!29067 m!833141))

(check-sat (not b!896606) (not d!110781) (not d!110785) (not b_next!15961) (not b!896605) (not b!896595) (not b!896604) b_and!26227 tp_is_empty!18289 (not b!896576) (not d!110783) (not d!110789) (not b!896579) (not mapNonEmpty!29067))
(check-sat b_and!26227 (not b_next!15961))
(get-model)

(assert (=> d!110781 d!110779))

(declare-fun d!110791 () Bool)

(assert (=> d!110791 (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110791 true))

(declare-fun _$60!406 () Unit!30436)

(assert (=> d!110791 (= (choose!13 (_keys!10119 thiss!1181) key!785 (index!37996 lt!404697)) _$60!406)))

(declare-fun bs!25143 () Bool)

(assert (= bs!25143 d!110791))

(assert (=> bs!25143 m!833061))

(assert (=> d!110781 d!110791))

(declare-fun d!110793 () Bool)

(assert (=> d!110793 (= (inRange!0 (index!37996 lt!404726) (mask!26033 thiss!1181)) (and (bvsge (index!37996 lt!404726) #b00000000000000000000000000000000) (bvslt (index!37996 lt!404726) (bvadd (mask!26033 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896579 d!110793))

(declare-fun b!896625 () Bool)

(declare-fun e!501252 () Bool)

(declare-fun call!39764 () Bool)

(assert (=> b!896625 (= e!501252 call!39764)))

(declare-fun bm!39761 () Bool)

(declare-fun c!94677 () Bool)

(assert (=> bm!39761 (= call!39764 (arrayNoDuplicates!0 (_keys!10119 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94677 (Cons!17829 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000) Nil!17830) Nil!17830)))))

(declare-fun d!110795 () Bool)

(declare-fun res!606240 () Bool)

(declare-fun e!501253 () Bool)

(assert (=> d!110795 (=> res!606240 e!501253)))

(assert (=> d!110795 (= res!606240 (bvsge #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))))))

(assert (=> d!110795 (= (arrayNoDuplicates!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 Nil!17830) e!501253)))

(declare-fun b!896626 () Bool)

(declare-fun e!501251 () Bool)

(assert (=> b!896626 (= e!501251 e!501252)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896626 (= c!94677 (validKeyInArray!0 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896627 () Bool)

(assert (=> b!896627 (= e!501253 e!501251)))

(declare-fun res!606239 () Bool)

(assert (=> b!896627 (=> (not res!606239) (not e!501251))))

(declare-fun e!501250 () Bool)

(assert (=> b!896627 (= res!606239 (not e!501250))))

(declare-fun res!606241 () Bool)

(assert (=> b!896627 (=> (not res!606241) (not e!501250))))

(assert (=> b!896627 (= res!606241 (validKeyInArray!0 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896628 () Bool)

(declare-fun contains!4372 (List!17833 (_ BitVec 64)) Bool)

(assert (=> b!896628 (= e!501250 (contains!4372 Nil!17830 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896629 () Bool)

(assert (=> b!896629 (= e!501252 call!39764)))

(assert (= (and d!110795 (not res!606240)) b!896627))

(assert (= (and b!896627 res!606241) b!896628))

(assert (= (and b!896627 res!606239) b!896626))

(assert (= (and b!896626 c!94677) b!896629))

(assert (= (and b!896626 (not c!94677)) b!896625))

(assert (= (or b!896629 b!896625) bm!39761))

(assert (=> bm!39761 m!833113))

(declare-fun m!833143 () Bool)

(assert (=> bm!39761 m!833143))

(assert (=> b!896626 m!833113))

(assert (=> b!896626 m!833113))

(declare-fun m!833145 () Bool)

(assert (=> b!896626 m!833145))

(assert (=> b!896627 m!833113))

(assert (=> b!896627 m!833113))

(assert (=> b!896627 m!833145))

(assert (=> b!896628 m!833113))

(assert (=> b!896628 m!833113))

(declare-fun m!833147 () Bool)

(assert (=> b!896628 m!833147))

(assert (=> b!896606 d!110795))

(declare-fun d!110797 () Bool)

(declare-fun e!501266 () Bool)

(assert (=> d!110797 e!501266))

(declare-fun c!94686 () Bool)

(declare-fun lt!404743 () SeekEntryResult!8906)

(assert (=> d!110797 (= c!94686 (and ((_ is Intermediate!8906) lt!404743) (undefined!9718 lt!404743)))))

(declare-fun e!501264 () SeekEntryResult!8906)

(assert (=> d!110797 (= lt!404743 e!501264)))

(declare-fun c!94685 () Bool)

(assert (=> d!110797 (= c!94685 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404744 () (_ BitVec 64))

(assert (=> d!110797 (= lt!404744 (select (arr!25277 (_keys!10119 thiss!1181)) (toIndex!0 key!785 (mask!26033 thiss!1181))))))

(assert (=> d!110797 (validMask!0 (mask!26033 thiss!1181))))

(assert (=> d!110797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26033 thiss!1181)) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)) lt!404743)))

(declare-fun b!896648 () Bool)

(declare-fun e!501268 () SeekEntryResult!8906)

(assert (=> b!896648 (= e!501268 (Intermediate!8906 false (toIndex!0 key!785 (mask!26033 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896649 () Bool)

(assert (=> b!896649 (and (bvsge (index!37997 lt!404743) #b00000000000000000000000000000000) (bvslt (index!37997 lt!404743) (size!25731 (_keys!10119 thiss!1181))))))

(declare-fun res!606248 () Bool)

(assert (=> b!896649 (= res!606248 (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37997 lt!404743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501267 () Bool)

(assert (=> b!896649 (=> res!606248 e!501267)))

(declare-fun b!896650 () Bool)

(declare-fun e!501265 () Bool)

(assert (=> b!896650 (= e!501266 e!501265)))

(declare-fun res!606250 () Bool)

(assert (=> b!896650 (= res!606250 (and ((_ is Intermediate!8906) lt!404743) (not (undefined!9718 lt!404743)) (bvslt (x!76375 lt!404743) #b01111111111111111111111111111110) (bvsge (x!76375 lt!404743) #b00000000000000000000000000000000) (bvsge (x!76375 lt!404743) #b00000000000000000000000000000000)))))

(assert (=> b!896650 (=> (not res!606250) (not e!501265))))

(declare-fun b!896651 () Bool)

(assert (=> b!896651 (= e!501264 (Intermediate!8906 true (toIndex!0 key!785 (mask!26033 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896652 () Bool)

(assert (=> b!896652 (and (bvsge (index!37997 lt!404743) #b00000000000000000000000000000000) (bvslt (index!37997 lt!404743) (size!25731 (_keys!10119 thiss!1181))))))

(declare-fun res!606249 () Bool)

(assert (=> b!896652 (= res!606249 (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37997 lt!404743)) key!785))))

(assert (=> b!896652 (=> res!606249 e!501267)))

(assert (=> b!896652 (= e!501265 e!501267)))

(declare-fun b!896653 () Bool)

(assert (=> b!896653 (and (bvsge (index!37997 lt!404743) #b00000000000000000000000000000000) (bvslt (index!37997 lt!404743) (size!25731 (_keys!10119 thiss!1181))))))

(assert (=> b!896653 (= e!501267 (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37997 lt!404743)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896654 () Bool)

(assert (=> b!896654 (= e!501266 (bvsge (x!76375 lt!404743) #b01111111111111111111111111111110))))

(declare-fun b!896655 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896655 (= e!501268 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26033 thiss!1181)) #b00000000000000000000000000000000 (mask!26033 thiss!1181)) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun b!896656 () Bool)

(assert (=> b!896656 (= e!501264 e!501268)))

(declare-fun c!94684 () Bool)

(assert (=> b!896656 (= c!94684 (or (= lt!404744 key!785) (= (bvadd lt!404744 lt!404744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110797 c!94685) b!896651))

(assert (= (and d!110797 (not c!94685)) b!896656))

(assert (= (and b!896656 c!94684) b!896648))

(assert (= (and b!896656 (not c!94684)) b!896655))

(assert (= (and d!110797 c!94686) b!896654))

(assert (= (and d!110797 (not c!94686)) b!896650))

(assert (= (and b!896650 res!606250) b!896652))

(assert (= (and b!896652 (not res!606249)) b!896649))

(assert (= (and b!896649 (not res!606248)) b!896653))

(declare-fun m!833149 () Bool)

(assert (=> b!896652 m!833149))

(assert (=> b!896655 m!833125))

(declare-fun m!833151 () Bool)

(assert (=> b!896655 m!833151))

(assert (=> b!896655 m!833151))

(declare-fun m!833153 () Bool)

(assert (=> b!896655 m!833153))

(assert (=> d!110797 m!833125))

(declare-fun m!833155 () Bool)

(assert (=> d!110797 m!833155))

(assert (=> d!110797 m!833059))

(assert (=> b!896653 m!833149))

(assert (=> b!896649 m!833149))

(assert (=> d!110785 d!110797))

(declare-fun d!110799 () Bool)

(declare-fun lt!404750 () (_ BitVec 32))

(declare-fun lt!404749 () (_ BitVec 32))

(assert (=> d!110799 (= lt!404750 (bvmul (bvxor lt!404749 (bvlshr lt!404749 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110799 (= lt!404749 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110799 (and (bvsge (mask!26033 thiss!1181) #b00000000000000000000000000000000) (let ((res!606251 (let ((h!18969 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76391 (bvmul (bvxor h!18969 (bvlshr h!18969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76391 (bvlshr x!76391 #b00000000000000000000000000001101)) (mask!26033 thiss!1181)))))) (and (bvslt res!606251 (bvadd (mask!26033 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606251 #b00000000000000000000000000000000))))))

(assert (=> d!110799 (= (toIndex!0 key!785 (mask!26033 thiss!1181)) (bvand (bvxor lt!404750 (bvlshr lt!404750 #b00000000000000000000000000001101)) (mask!26033 thiss!1181)))))

(assert (=> d!110785 d!110799))

(assert (=> d!110785 d!110777))

(declare-fun d!110801 () Bool)

(declare-fun lt!404753 () (_ BitVec 32))

(assert (=> d!110801 (and (bvsge lt!404753 #b00000000000000000000000000000000) (bvsle lt!404753 (bvsub (size!25731 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!501273 () (_ BitVec 32))

(assert (=> d!110801 (= lt!404753 e!501273)))

(declare-fun c!94691 () Bool)

(assert (=> d!110801 (= c!94691 (bvsge #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))))))

(assert (=> d!110801 (and (bvsle #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25731 (_keys!10119 thiss!1181)) (size!25731 (_keys!10119 thiss!1181))))))

(assert (=> d!110801 (= (arrayCountValidKeys!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))) lt!404753)))

(declare-fun bm!39764 () Bool)

(declare-fun call!39767 () (_ BitVec 32))

(assert (=> bm!39764 (= call!39767 (arrayCountValidKeys!0 (_keys!10119 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25731 (_keys!10119 thiss!1181))))))

(declare-fun b!896665 () Bool)

(declare-fun e!501274 () (_ BitVec 32))

(assert (=> b!896665 (= e!501274 (bvadd #b00000000000000000000000000000001 call!39767))))

(declare-fun b!896666 () Bool)

(assert (=> b!896666 (= e!501273 #b00000000000000000000000000000000)))

(declare-fun b!896667 () Bool)

(assert (=> b!896667 (= e!501274 call!39767)))

(declare-fun b!896668 () Bool)

(assert (=> b!896668 (= e!501273 e!501274)))

(declare-fun c!94692 () Bool)

(assert (=> b!896668 (= c!94692 (validKeyInArray!0 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110801 c!94691) b!896666))

(assert (= (and d!110801 (not c!94691)) b!896668))

(assert (= (and b!896668 c!94692) b!896665))

(assert (= (and b!896668 (not c!94692)) b!896667))

(assert (= (or b!896665 b!896667) bm!39764))

(declare-fun m!833157 () Bool)

(assert (=> bm!39764 m!833157))

(assert (=> b!896668 m!833113))

(assert (=> b!896668 m!833113))

(assert (=> b!896668 m!833145))

(assert (=> b!896604 d!110801))

(declare-fun b!896677 () Bool)

(declare-fun e!501282 () Bool)

(declare-fun e!501281 () Bool)

(assert (=> b!896677 (= e!501282 e!501281)))

(declare-fun lt!404761 () (_ BitVec 64))

(assert (=> b!896677 (= lt!404761 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404760 () Unit!30436)

(assert (=> b!896677 (= lt!404760 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10119 thiss!1181) lt!404761 #b00000000000000000000000000000000))))

(assert (=> b!896677 (arrayContainsKey!0 (_keys!10119 thiss!1181) lt!404761 #b00000000000000000000000000000000)))

(declare-fun lt!404762 () Unit!30436)

(assert (=> b!896677 (= lt!404762 lt!404760)))

(declare-fun res!606256 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!896677 (= res!606256 (= (seekEntryOrOpen!0 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000) (_keys!10119 thiss!1181) (mask!26033 thiss!1181)) (Found!8906 #b00000000000000000000000000000000)))))

(assert (=> b!896677 (=> (not res!606256) (not e!501281))))

(declare-fun b!896678 () Bool)

(declare-fun call!39770 () Bool)

(assert (=> b!896678 (= e!501282 call!39770)))

(declare-fun bm!39767 () Bool)

(assert (=> bm!39767 (= call!39770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun b!896679 () Bool)

(declare-fun e!501283 () Bool)

(assert (=> b!896679 (= e!501283 e!501282)))

(declare-fun c!94695 () Bool)

(assert (=> b!896679 (= c!94695 (validKeyInArray!0 (select (arr!25277 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110803 () Bool)

(declare-fun res!606257 () Bool)

(assert (=> d!110803 (=> res!606257 e!501283)))

(assert (=> d!110803 (= res!606257 (bvsge #b00000000000000000000000000000000 (size!25731 (_keys!10119 thiss!1181))))))

(assert (=> d!110803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)) e!501283)))

(declare-fun b!896680 () Bool)

(assert (=> b!896680 (= e!501281 call!39770)))

(assert (= (and d!110803 (not res!606257)) b!896679))

(assert (= (and b!896679 c!94695) b!896677))

(assert (= (and b!896679 (not c!94695)) b!896678))

(assert (= (and b!896677 res!606256) b!896680))

(assert (= (or b!896680 b!896678) bm!39767))

(assert (=> b!896677 m!833113))

(declare-fun m!833159 () Bool)

(assert (=> b!896677 m!833159))

(declare-fun m!833161 () Bool)

(assert (=> b!896677 m!833161))

(assert (=> b!896677 m!833113))

(declare-fun m!833163 () Bool)

(assert (=> b!896677 m!833163))

(declare-fun m!833165 () Bool)

(assert (=> bm!39767 m!833165))

(assert (=> b!896679 m!833113))

(assert (=> b!896679 m!833113))

(assert (=> b!896679 m!833145))

(assert (=> b!896605 d!110803))

(declare-fun d!110805 () Bool)

(declare-fun res!606258 () Bool)

(declare-fun e!501284 () Bool)

(assert (=> d!110805 (=> res!606258 e!501284)))

(assert (=> d!110805 (= res!606258 (= (select (arr!25277 (_keys!10119 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110805 (= (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501284)))

(declare-fun b!896681 () Bool)

(declare-fun e!501285 () Bool)

(assert (=> b!896681 (= e!501284 e!501285)))

(declare-fun res!606259 () Bool)

(assert (=> b!896681 (=> (not res!606259) (not e!501285))))

(assert (=> b!896681 (= res!606259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25731 (_keys!10119 thiss!1181))))))

(declare-fun b!896682 () Bool)

(assert (=> b!896682 (= e!501285 (arrayContainsKey!0 (_keys!10119 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110805 (not res!606258)) b!896681))

(assert (= (and b!896681 res!606259) b!896682))

(declare-fun m!833167 () Bool)

(assert (=> d!110805 m!833167))

(declare-fun m!833169 () Bool)

(assert (=> b!896682 m!833169))

(assert (=> b!896576 d!110805))

(declare-fun b!896695 () Bool)

(declare-fun e!501294 () SeekEntryResult!8906)

(assert (=> b!896695 (= e!501294 Undefined!8906)))

(declare-fun b!896696 () Bool)

(declare-fun c!94704 () Bool)

(declare-fun lt!404767 () (_ BitVec 64))

(assert (=> b!896696 (= c!94704 (= lt!404767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501292 () SeekEntryResult!8906)

(declare-fun e!501293 () SeekEntryResult!8906)

(assert (=> b!896696 (= e!501292 e!501293)))

(declare-fun b!896697 () Bool)

(assert (=> b!896697 (= e!501294 e!501292)))

(declare-fun c!94702 () Bool)

(assert (=> b!896697 (= c!94702 (= lt!404767 key!785))))

(declare-fun b!896699 () Bool)

(assert (=> b!896699 (= e!501292 (Found!8906 (index!37997 lt!404737)))))

(declare-fun b!896700 () Bool)

(assert (=> b!896700 (= e!501293 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76375 lt!404737) #b00000000000000000000000000000001) (nextIndex!0 (index!37997 lt!404737) (x!76375 lt!404737) (mask!26033 thiss!1181)) (index!37997 lt!404737) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(declare-fun lt!404768 () SeekEntryResult!8906)

(declare-fun d!110807 () Bool)

(assert (=> d!110807 (and (or ((_ is Undefined!8906) lt!404768) (not ((_ is Found!8906) lt!404768)) (and (bvsge (index!37996 lt!404768) #b00000000000000000000000000000000) (bvslt (index!37996 lt!404768) (size!25731 (_keys!10119 thiss!1181))))) (or ((_ is Undefined!8906) lt!404768) ((_ is Found!8906) lt!404768) (not ((_ is MissingVacant!8906) lt!404768)) (not (= (index!37998 lt!404768) (index!37997 lt!404737))) (and (bvsge (index!37998 lt!404768) #b00000000000000000000000000000000) (bvslt (index!37998 lt!404768) (size!25731 (_keys!10119 thiss!1181))))) (or ((_ is Undefined!8906) lt!404768) (ite ((_ is Found!8906) lt!404768) (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37996 lt!404768)) key!785) (and ((_ is MissingVacant!8906) lt!404768) (= (index!37998 lt!404768) (index!37997 lt!404737)) (= (select (arr!25277 (_keys!10119 thiss!1181)) (index!37998 lt!404768)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110807 (= lt!404768 e!501294)))

(declare-fun c!94703 () Bool)

(assert (=> d!110807 (= c!94703 (bvsge (x!76375 lt!404737) #b01111111111111111111111111111110))))

(assert (=> d!110807 (= lt!404767 (select (arr!25277 (_keys!10119 thiss!1181)) (index!37997 lt!404737)))))

(assert (=> d!110807 (validMask!0 (mask!26033 thiss!1181))))

(assert (=> d!110807 (= (seekKeyOrZeroReturnVacant!0 (x!76375 lt!404737) (index!37997 lt!404737) (index!37997 lt!404737) key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)) lt!404768)))

(declare-fun b!896698 () Bool)

(assert (=> b!896698 (= e!501293 (MissingVacant!8906 (index!37997 lt!404737)))))

(assert (= (and d!110807 c!94703) b!896695))

(assert (= (and d!110807 (not c!94703)) b!896697))

(assert (= (and b!896697 c!94702) b!896699))

(assert (= (and b!896697 (not c!94702)) b!896696))

(assert (= (and b!896696 c!94704) b!896698))

(assert (= (and b!896696 (not c!94704)) b!896700))

(declare-fun m!833171 () Bool)

(assert (=> b!896700 m!833171))

(assert (=> b!896700 m!833171))

(declare-fun m!833173 () Bool)

(assert (=> b!896700 m!833173))

(declare-fun m!833175 () Bool)

(assert (=> d!110807 m!833175))

(declare-fun m!833177 () Bool)

(assert (=> d!110807 m!833177))

(assert (=> d!110807 m!833129))

(assert (=> d!110807 m!833059))

(assert (=> b!896595 d!110807))

(assert (=> d!110783 d!110785))

(declare-fun d!110809 () Bool)

(declare-fun e!501297 () Bool)

(assert (=> d!110809 e!501297))

(declare-fun res!606262 () Bool)

(assert (=> d!110809 (=> res!606262 e!501297)))

(declare-fun lt!404771 () SeekEntryResult!8906)

(assert (=> d!110809 (= res!606262 (not ((_ is Found!8906) lt!404771)))))

(assert (=> d!110809 (= lt!404771 (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26033 thiss!1181)))))

(assert (=> d!110809 true))

(declare-fun _$36!357 () Unit!30436)

(assert (=> d!110809 (= (choose!1489 (_keys!10119 thiss!1181) (_values!5378 thiss!1181) (mask!26033 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785) _$36!357)))

(declare-fun b!896703 () Bool)

(assert (=> b!896703 (= e!501297 (inRange!0 (index!37996 lt!404771) (mask!26033 thiss!1181)))))

(assert (= (and d!110809 (not res!606262)) b!896703))

(assert (=> d!110809 m!833071))

(declare-fun m!833179 () Bool)

(assert (=> b!896703 m!833179))

(assert (=> d!110783 d!110809))

(assert (=> d!110783 d!110777))

(declare-fun b!896712 () Bool)

(declare-fun res!606272 () Bool)

(declare-fun e!501300 () Bool)

(assert (=> b!896712 (=> (not res!606272) (not e!501300))))

(assert (=> b!896712 (= res!606272 (and (= (size!25732 (_values!5378 thiss!1181)) (bvadd (mask!26033 thiss!1181) #b00000000000000000000000000000001)) (= (size!25731 (_keys!10119 thiss!1181)) (size!25732 (_values!5378 thiss!1181))) (bvsge (_size!2226 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2226 thiss!1181) (bvadd (mask!26033 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110811 () Bool)

(declare-fun res!606271 () Bool)

(assert (=> d!110811 (=> (not res!606271) (not e!501300))))

(assert (=> d!110811 (= res!606271 (validMask!0 (mask!26033 thiss!1181)))))

(assert (=> d!110811 (= (simpleValid!315 thiss!1181) e!501300)))

(declare-fun b!896714 () Bool)

(declare-fun res!606273 () Bool)

(assert (=> b!896714 (=> (not res!606273) (not e!501300))))

(declare-fun size!25737 (LongMapFixedSize!4342) (_ BitVec 32))

(assert (=> b!896714 (= res!606273 (= (size!25737 thiss!1181) (bvadd (_size!2226 thiss!1181) (bvsdiv (bvadd (extraKeys!5087 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!896715 () Bool)

(assert (=> b!896715 (= e!501300 (and (bvsge (extraKeys!5087 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5087 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2226 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!896713 () Bool)

(declare-fun res!606274 () Bool)

(assert (=> b!896713 (=> (not res!606274) (not e!501300))))

(assert (=> b!896713 (= res!606274 (bvsge (size!25737 thiss!1181) (_size!2226 thiss!1181)))))

(assert (= (and d!110811 res!606271) b!896712))

(assert (= (and b!896712 res!606272) b!896713))

(assert (= (and b!896713 res!606274) b!896714))

(assert (= (and b!896714 res!606273) b!896715))

(assert (=> d!110811 m!833059))

(declare-fun m!833181 () Bool)

(assert (=> b!896714 m!833181))

(assert (=> b!896713 m!833181))

(assert (=> d!110789 d!110811))

(declare-fun condMapEmpty!29068 () Bool)

(declare-fun mapDefault!29068 () ValueCell!8663)

(assert (=> mapNonEmpty!29067 (= condMapEmpty!29068 (= mapRest!29067 ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29068)))))

(declare-fun e!501301 () Bool)

(declare-fun mapRes!29068 () Bool)

(assert (=> mapNonEmpty!29067 (= tp!55938 (and e!501301 mapRes!29068))))

(declare-fun mapIsEmpty!29068 () Bool)

(assert (=> mapIsEmpty!29068 mapRes!29068))

(declare-fun mapNonEmpty!29068 () Bool)

(declare-fun tp!55939 () Bool)

(declare-fun e!501302 () Bool)

(assert (=> mapNonEmpty!29068 (= mapRes!29068 (and tp!55939 e!501302))))

(declare-fun mapRest!29068 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapValue!29068 () ValueCell!8663)

(declare-fun mapKey!29068 () (_ BitVec 32))

(assert (=> mapNonEmpty!29068 (= mapRest!29067 (store mapRest!29068 mapKey!29068 mapValue!29068))))

(declare-fun b!896716 () Bool)

(assert (=> b!896716 (= e!501302 tp_is_empty!18289)))

(declare-fun b!896717 () Bool)

(assert (=> b!896717 (= e!501301 tp_is_empty!18289)))

(assert (= (and mapNonEmpty!29067 condMapEmpty!29068) mapIsEmpty!29068))

(assert (= (and mapNonEmpty!29067 (not condMapEmpty!29068)) mapNonEmpty!29068))

(assert (= (and mapNonEmpty!29068 ((_ is ValueCellFull!8663) mapValue!29068)) b!896716))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8663) mapDefault!29068)) b!896717))

(declare-fun m!833183 () Bool)

(assert (=> mapNonEmpty!29068 m!833183))

(check-sat (not b!896679) (not b!896714) tp_is_empty!18289 (not d!110791) (not b!896655) (not b!896668) (not b!896677) (not bm!39764) (not bm!39767) b_and!26227 (not mapNonEmpty!29068) (not d!110807) (not b!896703) (not b!896682) (not bm!39761) (not b!896626) (not b_next!15961) (not d!110809) (not b!896627) (not b!896713) (not b!896700) (not d!110811) (not d!110797) (not b!896628))
(check-sat b_and!26227 (not b_next!15961))
