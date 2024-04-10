; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76472 () Bool)

(assert start!76472)

(declare-fun b!896551 () Bool)

(declare-fun b_free!15957 () Bool)

(declare-fun b_next!15957 () Bool)

(assert (=> b!896551 (= b_free!15957 (not b_next!15957))))

(declare-fun tp!55906 () Bool)

(declare-fun b_and!26249 () Bool)

(assert (=> b!896551 (= tp!55906 b_and!26249)))

(declare-fun res!606204 () Bool)

(declare-fun e!501166 () Bool)

(assert (=> start!76472 (=> (not res!606204) (not e!501166))))

(declare-datatypes ((array!52588 0))(
  ( (array!52589 (arr!25281 (Array (_ BitVec 32) (_ BitVec 64))) (size!25732 (_ BitVec 32))) )
))
(declare-datatypes ((V!29345 0))(
  ( (V!29346 (val!9193 Int)) )
))
(declare-datatypes ((ValueCell!8661 0))(
  ( (ValueCellFull!8661 (v!11683 V!29345)) (EmptyCell!8661) )
))
(declare-datatypes ((array!52590 0))(
  ( (array!52591 (arr!25282 (Array (_ BitVec 32) ValueCell!8661)) (size!25733 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4338 0))(
  ( (LongMapFixedSize!4339 (defaultEntry!5381 Int) (mask!26027 (_ BitVec 32)) (extraKeys!5083 (_ BitVec 32)) (zeroValue!5187 V!29345) (minValue!5187 V!29345) (_size!2224 (_ BitVec 32)) (_keys!10116 array!52588) (_values!5374 array!52590) (_vacant!2224 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4338)

(declare-fun valid!1674 (LongMapFixedSize!4338) Bool)

(assert (=> start!76472 (= res!606204 (valid!1674 thiss!1181))))

(assert (=> start!76472 e!501166))

(declare-fun e!501164 () Bool)

(assert (=> start!76472 e!501164))

(assert (=> start!76472 true))

(declare-fun b!896546 () Bool)

(declare-fun e!501165 () Bool)

(assert (=> b!896546 (= e!501165 (= (size!25733 (_values!5374 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26027 thiss!1181))))))

(declare-fun b!896547 () Bool)

(declare-fun e!501162 () Bool)

(declare-datatypes ((SeekEntryResult!8900 0))(
  ( (MissingZero!8900 (index!37971 (_ BitVec 32))) (Found!8900 (index!37972 (_ BitVec 32))) (Intermediate!8900 (undefined!9712 Bool) (index!37973 (_ BitVec 32)) (x!76349 (_ BitVec 32))) (Undefined!8900) (MissingVacant!8900 (index!37974 (_ BitVec 32))) )
))
(declare-fun lt!404862 () SeekEntryResult!8900)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896547 (= e!501162 (inRange!0 (index!37972 lt!404862) (mask!26027 thiss!1181)))))

(declare-fun b!896548 () Bool)

(declare-fun res!606200 () Bool)

(assert (=> b!896548 (=> (not res!606200) (not e!501166))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896548 (= res!606200 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896549 () Bool)

(declare-fun e!501158 () Bool)

(assert (=> b!896549 (= e!501158 e!501165)))

(declare-fun res!606203 () Bool)

(assert (=> b!896549 (=> res!606203 e!501165)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896549 (= res!606203 (not (validMask!0 (mask!26027 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896549 (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30490 0))(
  ( (Unit!30491) )
))
(declare-fun lt!404861 () Unit!30490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52588 (_ BitVec 64) (_ BitVec 32)) Unit!30490)

(assert (=> b!896549 (= lt!404861 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10116 thiss!1181) key!785 (index!37972 lt!404862)))))

(declare-fun mapIsEmpty!29048 () Bool)

(declare-fun mapRes!29048 () Bool)

(assert (=> mapIsEmpty!29048 mapRes!29048))

(declare-fun b!896550 () Bool)

(assert (=> b!896550 (= e!501166 (not e!501158))))

(declare-fun res!606202 () Bool)

(assert (=> b!896550 (=> res!606202 e!501158)))

(get-info :version)

(assert (=> b!896550 (= res!606202 (not ((_ is Found!8900) lt!404862)))))

(assert (=> b!896550 e!501162))

(declare-fun res!606201 () Bool)

(assert (=> b!896550 (=> res!606201 e!501162)))

(assert (=> b!896550 (= res!606201 (not ((_ is Found!8900) lt!404862)))))

(declare-fun lt!404863 () Unit!30490)

(declare-fun lemmaSeekEntryGivesInRangeIndex!72 (array!52588 array!52590 (_ BitVec 32) (_ BitVec 32) V!29345 V!29345 (_ BitVec 64)) Unit!30490)

(assert (=> b!896550 (= lt!404863 (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10116 thiss!1181) (_values!5374 thiss!1181) (mask!26027 thiss!1181) (extraKeys!5083 thiss!1181) (zeroValue!5187 thiss!1181) (minValue!5187 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52588 (_ BitVec 32)) SeekEntryResult!8900)

(assert (=> b!896550 (= lt!404862 (seekEntry!0 key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun tp_is_empty!18285 () Bool)

(declare-fun e!501160 () Bool)

(declare-fun array_inv!19844 (array!52588) Bool)

(declare-fun array_inv!19845 (array!52590) Bool)

(assert (=> b!896551 (= e!501164 (and tp!55906 tp_is_empty!18285 (array_inv!19844 (_keys!10116 thiss!1181)) (array_inv!19845 (_values!5374 thiss!1181)) e!501160))))

(declare-fun mapNonEmpty!29048 () Bool)

(declare-fun tp!55905 () Bool)

(declare-fun e!501161 () Bool)

(assert (=> mapNonEmpty!29048 (= mapRes!29048 (and tp!55905 e!501161))))

(declare-fun mapValue!29048 () ValueCell!8661)

(declare-fun mapRest!29048 () (Array (_ BitVec 32) ValueCell!8661))

(declare-fun mapKey!29048 () (_ BitVec 32))

(assert (=> mapNonEmpty!29048 (= (arr!25282 (_values!5374 thiss!1181)) (store mapRest!29048 mapKey!29048 mapValue!29048))))

(declare-fun b!896552 () Bool)

(declare-fun e!501159 () Bool)

(assert (=> b!896552 (= e!501159 tp_is_empty!18285)))

(declare-fun b!896553 () Bool)

(assert (=> b!896553 (= e!501160 (and e!501159 mapRes!29048))))

(declare-fun condMapEmpty!29048 () Bool)

(declare-fun mapDefault!29048 () ValueCell!8661)

(assert (=> b!896553 (= condMapEmpty!29048 (= (arr!25282 (_values!5374 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8661)) mapDefault!29048)))))

(declare-fun b!896554 () Bool)

(assert (=> b!896554 (= e!501161 tp_is_empty!18285)))

(assert (= (and start!76472 res!606204) b!896548))

(assert (= (and b!896548 res!606200) b!896550))

(assert (= (and b!896550 (not res!606201)) b!896547))

(assert (= (and b!896550 (not res!606202)) b!896549))

(assert (= (and b!896549 (not res!606203)) b!896546))

(assert (= (and b!896553 condMapEmpty!29048) mapIsEmpty!29048))

(assert (= (and b!896553 (not condMapEmpty!29048)) mapNonEmpty!29048))

(assert (= (and mapNonEmpty!29048 ((_ is ValueCellFull!8661) mapValue!29048)) b!896554))

(assert (= (and b!896553 ((_ is ValueCellFull!8661) mapDefault!29048)) b!896552))

(assert (= b!896551 b!896553))

(assert (= start!76472 b!896551))

(declare-fun m!833699 () Bool)

(assert (=> mapNonEmpty!29048 m!833699))

(declare-fun m!833701 () Bool)

(assert (=> b!896549 m!833701))

(declare-fun m!833703 () Bool)

(assert (=> b!896549 m!833703))

(declare-fun m!833705 () Bool)

(assert (=> b!896549 m!833705))

(declare-fun m!833707 () Bool)

(assert (=> start!76472 m!833707))

(declare-fun m!833709 () Bool)

(assert (=> b!896547 m!833709))

(declare-fun m!833711 () Bool)

(assert (=> b!896550 m!833711))

(declare-fun m!833713 () Bool)

(assert (=> b!896550 m!833713))

(declare-fun m!833715 () Bool)

(assert (=> b!896551 m!833715))

(declare-fun m!833717 () Bool)

(assert (=> b!896551 m!833717))

(check-sat (not b!896549) (not b_next!15957) (not mapNonEmpty!29048) (not b!896550) (not b!896551) tp_is_empty!18285 b_and!26249 (not b!896547) (not start!76472))
(check-sat b_and!26249 (not b_next!15957))
(get-model)

(declare-fun d!110929 () Bool)

(assert (=> d!110929 (= (validMask!0 (mask!26027 thiss!1181)) (and (or (= (mask!26027 thiss!1181) #b00000000000000000000000000000111) (= (mask!26027 thiss!1181) #b00000000000000000000000000001111) (= (mask!26027 thiss!1181) #b00000000000000000000000000011111) (= (mask!26027 thiss!1181) #b00000000000000000000000000111111) (= (mask!26027 thiss!1181) #b00000000000000000000000001111111) (= (mask!26027 thiss!1181) #b00000000000000000000000011111111) (= (mask!26027 thiss!1181) #b00000000000000000000000111111111) (= (mask!26027 thiss!1181) #b00000000000000000000001111111111) (= (mask!26027 thiss!1181) #b00000000000000000000011111111111) (= (mask!26027 thiss!1181) #b00000000000000000000111111111111) (= (mask!26027 thiss!1181) #b00000000000000000001111111111111) (= (mask!26027 thiss!1181) #b00000000000000000011111111111111) (= (mask!26027 thiss!1181) #b00000000000000000111111111111111) (= (mask!26027 thiss!1181) #b00000000000000001111111111111111) (= (mask!26027 thiss!1181) #b00000000000000011111111111111111) (= (mask!26027 thiss!1181) #b00000000000000111111111111111111) (= (mask!26027 thiss!1181) #b00000000000001111111111111111111) (= (mask!26027 thiss!1181) #b00000000000011111111111111111111) (= (mask!26027 thiss!1181) #b00000000000111111111111111111111) (= (mask!26027 thiss!1181) #b00000000001111111111111111111111) (= (mask!26027 thiss!1181) #b00000000011111111111111111111111) (= (mask!26027 thiss!1181) #b00000000111111111111111111111111) (= (mask!26027 thiss!1181) #b00000001111111111111111111111111) (= (mask!26027 thiss!1181) #b00000011111111111111111111111111) (= (mask!26027 thiss!1181) #b00000111111111111111111111111111) (= (mask!26027 thiss!1181) #b00001111111111111111111111111111) (= (mask!26027 thiss!1181) #b00011111111111111111111111111111) (= (mask!26027 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26027 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896549 d!110929))

(declare-fun d!110931 () Bool)

(declare-fun res!606224 () Bool)

(declare-fun e!501198 () Bool)

(assert (=> d!110931 (=> res!606224 e!501198)))

(assert (=> d!110931 (= res!606224 (= (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110931 (= (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 #b00000000000000000000000000000000) e!501198)))

(declare-fun b!896586 () Bool)

(declare-fun e!501199 () Bool)

(assert (=> b!896586 (= e!501198 e!501199)))

(declare-fun res!606225 () Bool)

(assert (=> b!896586 (=> (not res!606225) (not e!501199))))

(assert (=> b!896586 (= res!606225 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25732 (_keys!10116 thiss!1181))))))

(declare-fun b!896587 () Bool)

(assert (=> b!896587 (= e!501199 (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110931 (not res!606224)) b!896586))

(assert (= (and b!896586 res!606225) b!896587))

(declare-fun m!833739 () Bool)

(assert (=> d!110931 m!833739))

(declare-fun m!833741 () Bool)

(assert (=> b!896587 m!833741))

(assert (=> b!896549 d!110931))

(declare-fun d!110933 () Bool)

(assert (=> d!110933 (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404875 () Unit!30490)

(declare-fun choose!13 (array!52588 (_ BitVec 64) (_ BitVec 32)) Unit!30490)

(assert (=> d!110933 (= lt!404875 (choose!13 (_keys!10116 thiss!1181) key!785 (index!37972 lt!404862)))))

(assert (=> d!110933 (bvsge (index!37972 lt!404862) #b00000000000000000000000000000000)))

(assert (=> d!110933 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10116 thiss!1181) key!785 (index!37972 lt!404862)) lt!404875)))

(declare-fun bs!25170 () Bool)

(assert (= bs!25170 d!110933))

(assert (=> bs!25170 m!833703))

(declare-fun m!833743 () Bool)

(assert (=> bs!25170 m!833743))

(assert (=> b!896549 d!110933))

(declare-fun d!110935 () Bool)

(declare-fun res!606232 () Bool)

(declare-fun e!501202 () Bool)

(assert (=> d!110935 (=> (not res!606232) (not e!501202))))

(declare-fun simpleValid!314 (LongMapFixedSize!4338) Bool)

(assert (=> d!110935 (= res!606232 (simpleValid!314 thiss!1181))))

(assert (=> d!110935 (= (valid!1674 thiss!1181) e!501202)))

(declare-fun b!896594 () Bool)

(declare-fun res!606233 () Bool)

(assert (=> b!896594 (=> (not res!606233) (not e!501202))))

(declare-fun arrayCountValidKeys!0 (array!52588 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896594 (= res!606233 (= (arrayCountValidKeys!0 (_keys!10116 thiss!1181) #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))) (_size!2224 thiss!1181)))))

(declare-fun b!896595 () Bool)

(declare-fun res!606234 () Bool)

(assert (=> b!896595 (=> (not res!606234) (not e!501202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52588 (_ BitVec 32)) Bool)

(assert (=> b!896595 (= res!606234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun b!896596 () Bool)

(declare-datatypes ((List!17824 0))(
  ( (Nil!17821) (Cons!17820 (h!18958 (_ BitVec 64)) (t!25163 List!17824)) )
))
(declare-fun arrayNoDuplicates!0 (array!52588 (_ BitVec 32) List!17824) Bool)

(assert (=> b!896596 (= e!501202 (arrayNoDuplicates!0 (_keys!10116 thiss!1181) #b00000000000000000000000000000000 Nil!17821))))

(assert (= (and d!110935 res!606232) b!896594))

(assert (= (and b!896594 res!606233) b!896595))

(assert (= (and b!896595 res!606234) b!896596))

(declare-fun m!833745 () Bool)

(assert (=> d!110935 m!833745))

(declare-fun m!833747 () Bool)

(assert (=> b!896594 m!833747))

(declare-fun m!833749 () Bool)

(assert (=> b!896595 m!833749))

(declare-fun m!833751 () Bool)

(assert (=> b!896596 m!833751))

(assert (=> start!76472 d!110935))

(declare-fun d!110937 () Bool)

(assert (=> d!110937 (= (inRange!0 (index!37972 lt!404862) (mask!26027 thiss!1181)) (and (bvsge (index!37972 lt!404862) #b00000000000000000000000000000000) (bvslt (index!37972 lt!404862) (bvadd (mask!26027 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896547 d!110937))

(declare-fun d!110939 () Bool)

(declare-fun e!501205 () Bool)

(assert (=> d!110939 e!501205))

(declare-fun res!606237 () Bool)

(assert (=> d!110939 (=> res!606237 e!501205)))

(declare-fun lt!404881 () SeekEntryResult!8900)

(assert (=> d!110939 (= res!606237 (not ((_ is Found!8900) lt!404881)))))

(assert (=> d!110939 (= lt!404881 (seekEntry!0 key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun lt!404880 () Unit!30490)

(declare-fun choose!1479 (array!52588 array!52590 (_ BitVec 32) (_ BitVec 32) V!29345 V!29345 (_ BitVec 64)) Unit!30490)

(assert (=> d!110939 (= lt!404880 (choose!1479 (_keys!10116 thiss!1181) (_values!5374 thiss!1181) (mask!26027 thiss!1181) (extraKeys!5083 thiss!1181) (zeroValue!5187 thiss!1181) (minValue!5187 thiss!1181) key!785))))

(assert (=> d!110939 (validMask!0 (mask!26027 thiss!1181))))

(assert (=> d!110939 (= (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10116 thiss!1181) (_values!5374 thiss!1181) (mask!26027 thiss!1181) (extraKeys!5083 thiss!1181) (zeroValue!5187 thiss!1181) (minValue!5187 thiss!1181) key!785) lt!404880)))

(declare-fun b!896599 () Bool)

(assert (=> b!896599 (= e!501205 (inRange!0 (index!37972 lt!404881) (mask!26027 thiss!1181)))))

(assert (= (and d!110939 (not res!606237)) b!896599))

(assert (=> d!110939 m!833713))

(declare-fun m!833753 () Bool)

(assert (=> d!110939 m!833753))

(assert (=> d!110939 m!833701))

(declare-fun m!833755 () Bool)

(assert (=> b!896599 m!833755))

(assert (=> b!896550 d!110939))

(declare-fun b!896612 () Bool)

(declare-fun e!501214 () SeekEntryResult!8900)

(declare-fun lt!404891 () SeekEntryResult!8900)

(assert (=> b!896612 (= e!501214 (Found!8900 (index!37973 lt!404891)))))

(declare-fun b!896613 () Bool)

(declare-fun e!501212 () SeekEntryResult!8900)

(assert (=> b!896613 (= e!501212 Undefined!8900)))

(declare-fun d!110941 () Bool)

(declare-fun lt!404892 () SeekEntryResult!8900)

(assert (=> d!110941 (and (or ((_ is MissingVacant!8900) lt!404892) (not ((_ is Found!8900) lt!404892)) (and (bvsge (index!37972 lt!404892) #b00000000000000000000000000000000) (bvslt (index!37972 lt!404892) (size!25732 (_keys!10116 thiss!1181))))) (not ((_ is MissingVacant!8900) lt!404892)) (or (not ((_ is Found!8900) lt!404892)) (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37972 lt!404892)) key!785)))))

(assert (=> d!110941 (= lt!404892 e!501212)))

(declare-fun c!94700 () Bool)

(assert (=> d!110941 (= c!94700 (and ((_ is Intermediate!8900) lt!404891) (undefined!9712 lt!404891)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52588 (_ BitVec 32)) SeekEntryResult!8900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110941 (= lt!404891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26027 thiss!1181)) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(assert (=> d!110941 (validMask!0 (mask!26027 thiss!1181))))

(assert (=> d!110941 (= (seekEntry!0 key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)) lt!404892)))

(declare-fun b!896614 () Bool)

(declare-fun e!501213 () SeekEntryResult!8900)

(declare-fun lt!404893 () SeekEntryResult!8900)

(assert (=> b!896614 (= e!501213 (ite ((_ is MissingVacant!8900) lt!404893) (MissingZero!8900 (index!37974 lt!404893)) lt!404893))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52588 (_ BitVec 32)) SeekEntryResult!8900)

(assert (=> b!896614 (= lt!404893 (seekKeyOrZeroReturnVacant!0 (x!76349 lt!404891) (index!37973 lt!404891) (index!37973 lt!404891) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun b!896615 () Bool)

(declare-fun c!94699 () Bool)

(declare-fun lt!404890 () (_ BitVec 64))

(assert (=> b!896615 (= c!94699 (= lt!404890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896615 (= e!501214 e!501213)))

(declare-fun b!896616 () Bool)

(assert (=> b!896616 (= e!501213 (MissingZero!8900 (index!37973 lt!404891)))))

(declare-fun b!896617 () Bool)

(assert (=> b!896617 (= e!501212 e!501214)))

(assert (=> b!896617 (= lt!404890 (select (arr!25281 (_keys!10116 thiss!1181)) (index!37973 lt!404891)))))

(declare-fun c!94698 () Bool)

(assert (=> b!896617 (= c!94698 (= lt!404890 key!785))))

(assert (= (and d!110941 c!94700) b!896613))

(assert (= (and d!110941 (not c!94700)) b!896617))

(assert (= (and b!896617 c!94698) b!896612))

(assert (= (and b!896617 (not c!94698)) b!896615))

(assert (= (and b!896615 c!94699) b!896616))

(assert (= (and b!896615 (not c!94699)) b!896614))

(declare-fun m!833757 () Bool)

(assert (=> d!110941 m!833757))

(declare-fun m!833759 () Bool)

(assert (=> d!110941 m!833759))

(assert (=> d!110941 m!833759))

(declare-fun m!833761 () Bool)

(assert (=> d!110941 m!833761))

(assert (=> d!110941 m!833701))

(declare-fun m!833763 () Bool)

(assert (=> b!896614 m!833763))

(declare-fun m!833765 () Bool)

(assert (=> b!896617 m!833765))

(assert (=> b!896550 d!110941))

(declare-fun d!110943 () Bool)

(assert (=> d!110943 (= (array_inv!19844 (_keys!10116 thiss!1181)) (bvsge (size!25732 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896551 d!110943))

(declare-fun d!110945 () Bool)

(assert (=> d!110945 (= (array_inv!19845 (_values!5374 thiss!1181)) (bvsge (size!25733 (_values!5374 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896551 d!110945))

(declare-fun mapNonEmpty!29054 () Bool)

(declare-fun mapRes!29054 () Bool)

(declare-fun tp!55915 () Bool)

(declare-fun e!501219 () Bool)

(assert (=> mapNonEmpty!29054 (= mapRes!29054 (and tp!55915 e!501219))))

(declare-fun mapValue!29054 () ValueCell!8661)

(declare-fun mapKey!29054 () (_ BitVec 32))

(declare-fun mapRest!29054 () (Array (_ BitVec 32) ValueCell!8661))

(assert (=> mapNonEmpty!29054 (= mapRest!29048 (store mapRest!29054 mapKey!29054 mapValue!29054))))

(declare-fun b!896625 () Bool)

(declare-fun e!501220 () Bool)

(assert (=> b!896625 (= e!501220 tp_is_empty!18285)))

(declare-fun b!896624 () Bool)

(assert (=> b!896624 (= e!501219 tp_is_empty!18285)))

(declare-fun mapIsEmpty!29054 () Bool)

(assert (=> mapIsEmpty!29054 mapRes!29054))

(declare-fun condMapEmpty!29054 () Bool)

(declare-fun mapDefault!29054 () ValueCell!8661)

(assert (=> mapNonEmpty!29048 (= condMapEmpty!29054 (= mapRest!29048 ((as const (Array (_ BitVec 32) ValueCell!8661)) mapDefault!29054)))))

(assert (=> mapNonEmpty!29048 (= tp!55905 (and e!501220 mapRes!29054))))

(assert (= (and mapNonEmpty!29048 condMapEmpty!29054) mapIsEmpty!29054))

(assert (= (and mapNonEmpty!29048 (not condMapEmpty!29054)) mapNonEmpty!29054))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8661) mapValue!29054)) b!896624))

(assert (= (and mapNonEmpty!29048 ((_ is ValueCellFull!8661) mapDefault!29054)) b!896625))

(declare-fun m!833767 () Bool)

(assert (=> mapNonEmpty!29054 m!833767))

(check-sat (not b!896587) (not d!110939) (not b!896594) (not d!110941) (not b!896595) tp_is_empty!18285 b_and!26249 (not b!896596) (not b!896614) (not b!896599) (not b_next!15957) (not d!110933) (not d!110935) (not mapNonEmpty!29054))
(check-sat b_and!26249 (not b_next!15957))
(get-model)

(declare-fun d!110947 () Bool)

(declare-fun res!606238 () Bool)

(declare-fun e!501221 () Bool)

(assert (=> d!110947 (=> res!606238 e!501221)))

(assert (=> d!110947 (= res!606238 (= (select (arr!25281 (_keys!10116 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110947 (= (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501221)))

(declare-fun b!896626 () Bool)

(declare-fun e!501222 () Bool)

(assert (=> b!896626 (= e!501221 e!501222)))

(declare-fun res!606239 () Bool)

(assert (=> b!896626 (=> (not res!606239) (not e!501222))))

(assert (=> b!896626 (= res!606239 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25732 (_keys!10116 thiss!1181))))))

(declare-fun b!896627 () Bool)

(assert (=> b!896627 (= e!501222 (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110947 (not res!606238)) b!896626))

(assert (= (and b!896626 res!606239) b!896627))

(declare-fun m!833769 () Bool)

(assert (=> d!110947 m!833769))

(declare-fun m!833771 () Bool)

(assert (=> b!896627 m!833771))

(assert (=> b!896587 d!110947))

(declare-fun bm!39778 () Bool)

(declare-fun call!39781 () Bool)

(declare-fun c!94703 () Bool)

(assert (=> bm!39778 (= call!39781 (arrayNoDuplicates!0 (_keys!10116 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94703 (Cons!17820 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000) Nil!17821) Nil!17821)))))

(declare-fun b!896638 () Bool)

(declare-fun e!501234 () Bool)

(assert (=> b!896638 (= e!501234 call!39781)))

(declare-fun b!896640 () Bool)

(assert (=> b!896640 (= e!501234 call!39781)))

(declare-fun b!896641 () Bool)

(declare-fun e!501231 () Bool)

(assert (=> b!896641 (= e!501231 e!501234)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896641 (= c!94703 (validKeyInArray!0 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896642 () Bool)

(declare-fun e!501232 () Bool)

(declare-fun contains!4401 (List!17824 (_ BitVec 64)) Bool)

(assert (=> b!896642 (= e!501232 (contains!4401 Nil!17821 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896639 () Bool)

(declare-fun e!501233 () Bool)

(assert (=> b!896639 (= e!501233 e!501231)))

(declare-fun res!606248 () Bool)

(assert (=> b!896639 (=> (not res!606248) (not e!501231))))

(assert (=> b!896639 (= res!606248 (not e!501232))))

(declare-fun res!606247 () Bool)

(assert (=> b!896639 (=> (not res!606247) (not e!501232))))

(assert (=> b!896639 (= res!606247 (validKeyInArray!0 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110949 () Bool)

(declare-fun res!606246 () Bool)

(assert (=> d!110949 (=> res!606246 e!501233)))

(assert (=> d!110949 (= res!606246 (bvsge #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))))))

(assert (=> d!110949 (= (arrayNoDuplicates!0 (_keys!10116 thiss!1181) #b00000000000000000000000000000000 Nil!17821) e!501233)))

(assert (= (and d!110949 (not res!606246)) b!896639))

(assert (= (and b!896639 res!606247) b!896642))

(assert (= (and b!896639 res!606248) b!896641))

(assert (= (and b!896641 c!94703) b!896640))

(assert (= (and b!896641 (not c!94703)) b!896638))

(assert (= (or b!896640 b!896638) bm!39778))

(assert (=> bm!39778 m!833739))

(declare-fun m!833773 () Bool)

(assert (=> bm!39778 m!833773))

(assert (=> b!896641 m!833739))

(assert (=> b!896641 m!833739))

(declare-fun m!833775 () Bool)

(assert (=> b!896641 m!833775))

(assert (=> b!896642 m!833739))

(assert (=> b!896642 m!833739))

(declare-fun m!833777 () Bool)

(assert (=> b!896642 m!833777))

(assert (=> b!896639 m!833739))

(assert (=> b!896639 m!833739))

(assert (=> b!896639 m!833775))

(assert (=> b!896596 d!110949))

(assert (=> d!110939 d!110941))

(declare-fun d!110951 () Bool)

(declare-fun e!501237 () Bool)

(assert (=> d!110951 e!501237))

(declare-fun res!606251 () Bool)

(assert (=> d!110951 (=> res!606251 e!501237)))

(declare-fun lt!404896 () SeekEntryResult!8900)

(assert (=> d!110951 (= res!606251 (not ((_ is Found!8900) lt!404896)))))

(assert (=> d!110951 (= lt!404896 (seekEntry!0 key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(assert (=> d!110951 true))

(declare-fun _$36!354 () Unit!30490)

(assert (=> d!110951 (= (choose!1479 (_keys!10116 thiss!1181) (_values!5374 thiss!1181) (mask!26027 thiss!1181) (extraKeys!5083 thiss!1181) (zeroValue!5187 thiss!1181) (minValue!5187 thiss!1181) key!785) _$36!354)))

(declare-fun b!896645 () Bool)

(assert (=> b!896645 (= e!501237 (inRange!0 (index!37972 lt!404896) (mask!26027 thiss!1181)))))

(assert (= (and d!110951 (not res!606251)) b!896645))

(assert (=> d!110951 m!833713))

(declare-fun m!833779 () Bool)

(assert (=> b!896645 m!833779))

(assert (=> d!110939 d!110951))

(assert (=> d!110939 d!110929))

(assert (=> d!110933 d!110931))

(declare-fun d!110953 () Bool)

(assert (=> d!110953 (arrayContainsKey!0 (_keys!10116 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110953 true))

(declare-fun _$60!406 () Unit!30490)

(assert (=> d!110953 (= (choose!13 (_keys!10116 thiss!1181) key!785 (index!37972 lt!404862)) _$60!406)))

(declare-fun bs!25171 () Bool)

(assert (= bs!25171 d!110953))

(assert (=> bs!25171 m!833703))

(assert (=> d!110933 d!110953))

(declare-fun b!896654 () Bool)

(declare-fun e!501246 () Bool)

(declare-fun call!39784 () Bool)

(assert (=> b!896654 (= e!501246 call!39784)))

(declare-fun d!110955 () Bool)

(declare-fun res!606257 () Bool)

(declare-fun e!501245 () Bool)

(assert (=> d!110955 (=> res!606257 e!501245)))

(assert (=> d!110955 (= res!606257 (bvsge #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))))))

(assert (=> d!110955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)) e!501245)))

(declare-fun bm!39781 () Bool)

(assert (=> bm!39781 (= call!39784 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun b!896655 () Bool)

(declare-fun e!501244 () Bool)

(assert (=> b!896655 (= e!501246 e!501244)))

(declare-fun lt!404904 () (_ BitVec 64))

(assert (=> b!896655 (= lt!404904 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404903 () Unit!30490)

(assert (=> b!896655 (= lt!404903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10116 thiss!1181) lt!404904 #b00000000000000000000000000000000))))

(assert (=> b!896655 (arrayContainsKey!0 (_keys!10116 thiss!1181) lt!404904 #b00000000000000000000000000000000)))

(declare-fun lt!404905 () Unit!30490)

(assert (=> b!896655 (= lt!404905 lt!404903)))

(declare-fun res!606256 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52588 (_ BitVec 32)) SeekEntryResult!8900)

(assert (=> b!896655 (= res!606256 (= (seekEntryOrOpen!0 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000) (_keys!10116 thiss!1181) (mask!26027 thiss!1181)) (Found!8900 #b00000000000000000000000000000000)))))

(assert (=> b!896655 (=> (not res!606256) (not e!501244))))

(declare-fun b!896656 () Bool)

(assert (=> b!896656 (= e!501245 e!501246)))

(declare-fun c!94706 () Bool)

(assert (=> b!896656 (= c!94706 (validKeyInArray!0 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896657 () Bool)

(assert (=> b!896657 (= e!501244 call!39784)))

(assert (= (and d!110955 (not res!606257)) b!896656))

(assert (= (and b!896656 c!94706) b!896655))

(assert (= (and b!896656 (not c!94706)) b!896654))

(assert (= (and b!896655 res!606256) b!896657))

(assert (= (or b!896657 b!896654) bm!39781))

(declare-fun m!833781 () Bool)

(assert (=> bm!39781 m!833781))

(assert (=> b!896655 m!833739))

(declare-fun m!833783 () Bool)

(assert (=> b!896655 m!833783))

(declare-fun m!833785 () Bool)

(assert (=> b!896655 m!833785))

(assert (=> b!896655 m!833739))

(declare-fun m!833787 () Bool)

(assert (=> b!896655 m!833787))

(assert (=> b!896656 m!833739))

(assert (=> b!896656 m!833739))

(assert (=> b!896656 m!833775))

(assert (=> b!896595 d!110955))

(declare-fun b!896669 () Bool)

(declare-fun e!501249 () Bool)

(assert (=> b!896669 (= e!501249 (and (bvsge (extraKeys!5083 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5083 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2224 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110957 () Bool)

(declare-fun res!606267 () Bool)

(assert (=> d!110957 (=> (not res!606267) (not e!501249))))

(assert (=> d!110957 (= res!606267 (validMask!0 (mask!26027 thiss!1181)))))

(assert (=> d!110957 (= (simpleValid!314 thiss!1181) e!501249)))

(declare-fun b!896668 () Bool)

(declare-fun res!606269 () Bool)

(assert (=> b!896668 (=> (not res!606269) (not e!501249))))

(declare-fun size!25736 (LongMapFixedSize!4338) (_ BitVec 32))

(assert (=> b!896668 (= res!606269 (= (size!25736 thiss!1181) (bvadd (_size!2224 thiss!1181) (bvsdiv (bvadd (extraKeys!5083 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!896667 () Bool)

(declare-fun res!606266 () Bool)

(assert (=> b!896667 (=> (not res!606266) (not e!501249))))

(assert (=> b!896667 (= res!606266 (bvsge (size!25736 thiss!1181) (_size!2224 thiss!1181)))))

(declare-fun b!896666 () Bool)

(declare-fun res!606268 () Bool)

(assert (=> b!896666 (=> (not res!606268) (not e!501249))))

(assert (=> b!896666 (= res!606268 (and (= (size!25733 (_values!5374 thiss!1181)) (bvadd (mask!26027 thiss!1181) #b00000000000000000000000000000001)) (= (size!25732 (_keys!10116 thiss!1181)) (size!25733 (_values!5374 thiss!1181))) (bvsge (_size!2224 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2224 thiss!1181) (bvadd (mask!26027 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!110957 res!606267) b!896666))

(assert (= (and b!896666 res!606268) b!896667))

(assert (= (and b!896667 res!606266) b!896668))

(assert (= (and b!896668 res!606269) b!896669))

(assert (=> d!110957 m!833701))

(declare-fun m!833789 () Bool)

(assert (=> b!896668 m!833789))

(assert (=> b!896667 m!833789))

(assert (=> d!110935 d!110957))

(declare-fun d!110959 () Bool)

(assert (=> d!110959 (= (inRange!0 (index!37972 lt!404881) (mask!26027 thiss!1181)) (and (bvsge (index!37972 lt!404881) #b00000000000000000000000000000000) (bvslt (index!37972 lt!404881) (bvadd (mask!26027 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896599 d!110959))

(declare-fun b!896678 () Bool)

(declare-fun e!501255 () (_ BitVec 32))

(declare-fun call!39787 () (_ BitVec 32))

(assert (=> b!896678 (= e!501255 (bvadd #b00000000000000000000000000000001 call!39787))))

(declare-fun b!896679 () Bool)

(declare-fun e!501254 () (_ BitVec 32))

(assert (=> b!896679 (= e!501254 e!501255)))

(declare-fun c!94712 () Bool)

(assert (=> b!896679 (= c!94712 (validKeyInArray!0 (select (arr!25281 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110961 () Bool)

(declare-fun lt!404908 () (_ BitVec 32))

(assert (=> d!110961 (and (bvsge lt!404908 #b00000000000000000000000000000000) (bvsle lt!404908 (bvsub (size!25732 (_keys!10116 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110961 (= lt!404908 e!501254)))

(declare-fun c!94711 () Bool)

(assert (=> d!110961 (= c!94711 (bvsge #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))))))

(assert (=> d!110961 (and (bvsle #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25732 (_keys!10116 thiss!1181)) (size!25732 (_keys!10116 thiss!1181))))))

(assert (=> d!110961 (= (arrayCountValidKeys!0 (_keys!10116 thiss!1181) #b00000000000000000000000000000000 (size!25732 (_keys!10116 thiss!1181))) lt!404908)))

(declare-fun b!896680 () Bool)

(assert (=> b!896680 (= e!501254 #b00000000000000000000000000000000)))

(declare-fun b!896681 () Bool)

(assert (=> b!896681 (= e!501255 call!39787)))

(declare-fun bm!39784 () Bool)

(assert (=> bm!39784 (= call!39787 (arrayCountValidKeys!0 (_keys!10116 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25732 (_keys!10116 thiss!1181))))))

(assert (= (and d!110961 c!94711) b!896680))

(assert (= (and d!110961 (not c!94711)) b!896679))

(assert (= (and b!896679 c!94712) b!896678))

(assert (= (and b!896679 (not c!94712)) b!896681))

(assert (= (or b!896678 b!896681) bm!39784))

(assert (=> b!896679 m!833739))

(assert (=> b!896679 m!833739))

(assert (=> b!896679 m!833775))

(declare-fun m!833791 () Bool)

(assert (=> bm!39784 m!833791))

(assert (=> b!896594 d!110961))

(declare-fun b!896700 () Bool)

(declare-fun e!501266 () Bool)

(declare-fun lt!404913 () SeekEntryResult!8900)

(assert (=> b!896700 (= e!501266 (bvsge (x!76349 lt!404913) #b01111111111111111111111111111110))))

(declare-fun b!896701 () Bool)

(declare-fun e!501270 () SeekEntryResult!8900)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896701 (= e!501270 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26027 thiss!1181)) #b00000000000000000000000000000000 (mask!26027 thiss!1181)) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun b!896702 () Bool)

(assert (=> b!896702 (and (bvsge (index!37973 lt!404913) #b00000000000000000000000000000000) (bvslt (index!37973 lt!404913) (size!25732 (_keys!10116 thiss!1181))))))

(declare-fun e!501268 () Bool)

(assert (=> b!896702 (= e!501268 (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37973 lt!404913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896703 () Bool)

(declare-fun e!501269 () SeekEntryResult!8900)

(assert (=> b!896703 (= e!501269 (Intermediate!8900 true (toIndex!0 key!785 (mask!26027 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896704 () Bool)

(assert (=> b!896704 (= e!501270 (Intermediate!8900 false (toIndex!0 key!785 (mask!26027 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896706 () Bool)

(assert (=> b!896706 (and (bvsge (index!37973 lt!404913) #b00000000000000000000000000000000) (bvslt (index!37973 lt!404913) (size!25732 (_keys!10116 thiss!1181))))))

(declare-fun res!606276 () Bool)

(assert (=> b!896706 (= res!606276 (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37973 lt!404913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896706 (=> res!606276 e!501268)))

(declare-fun b!896707 () Bool)

(declare-fun e!501267 () Bool)

(assert (=> b!896707 (= e!501266 e!501267)))

(declare-fun res!606277 () Bool)

(assert (=> b!896707 (= res!606277 (and ((_ is Intermediate!8900) lt!404913) (not (undefined!9712 lt!404913)) (bvslt (x!76349 lt!404913) #b01111111111111111111111111111110) (bvsge (x!76349 lt!404913) #b00000000000000000000000000000000) (bvsge (x!76349 lt!404913) #b00000000000000000000000000000000)))))

(assert (=> b!896707 (=> (not res!606277) (not e!501267))))

(declare-fun b!896708 () Bool)

(assert (=> b!896708 (and (bvsge (index!37973 lt!404913) #b00000000000000000000000000000000) (bvslt (index!37973 lt!404913) (size!25732 (_keys!10116 thiss!1181))))))

(declare-fun res!606278 () Bool)

(assert (=> b!896708 (= res!606278 (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37973 lt!404913)) key!785))))

(assert (=> b!896708 (=> res!606278 e!501268)))

(assert (=> b!896708 (= e!501267 e!501268)))

(declare-fun b!896705 () Bool)

(assert (=> b!896705 (= e!501269 e!501270)))

(declare-fun c!94719 () Bool)

(declare-fun lt!404914 () (_ BitVec 64))

(assert (=> b!896705 (= c!94719 (or (= lt!404914 key!785) (= (bvadd lt!404914 lt!404914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110963 () Bool)

(assert (=> d!110963 e!501266))

(declare-fun c!94720 () Bool)

(assert (=> d!110963 (= c!94720 (and ((_ is Intermediate!8900) lt!404913) (undefined!9712 lt!404913)))))

(assert (=> d!110963 (= lt!404913 e!501269)))

(declare-fun c!94721 () Bool)

(assert (=> d!110963 (= c!94721 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110963 (= lt!404914 (select (arr!25281 (_keys!10116 thiss!1181)) (toIndex!0 key!785 (mask!26027 thiss!1181))))))

(assert (=> d!110963 (validMask!0 (mask!26027 thiss!1181))))

(assert (=> d!110963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26027 thiss!1181)) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)) lt!404913)))

(assert (= (and d!110963 c!94721) b!896703))

(assert (= (and d!110963 (not c!94721)) b!896705))

(assert (= (and b!896705 c!94719) b!896704))

(assert (= (and b!896705 (not c!94719)) b!896701))

(assert (= (and d!110963 c!94720) b!896700))

(assert (= (and d!110963 (not c!94720)) b!896707))

(assert (= (and b!896707 res!606277) b!896708))

(assert (= (and b!896708 (not res!606278)) b!896706))

(assert (= (and b!896706 (not res!606276)) b!896702))

(declare-fun m!833793 () Bool)

(assert (=> b!896702 m!833793))

(assert (=> b!896708 m!833793))

(assert (=> b!896706 m!833793))

(assert (=> d!110963 m!833759))

(declare-fun m!833795 () Bool)

(assert (=> d!110963 m!833795))

(assert (=> d!110963 m!833701))

(assert (=> b!896701 m!833759))

(declare-fun m!833797 () Bool)

(assert (=> b!896701 m!833797))

(assert (=> b!896701 m!833797))

(declare-fun m!833799 () Bool)

(assert (=> b!896701 m!833799))

(assert (=> d!110941 d!110963))

(declare-fun d!110965 () Bool)

(declare-fun lt!404920 () (_ BitVec 32))

(declare-fun lt!404919 () (_ BitVec 32))

(assert (=> d!110965 (= lt!404920 (bvmul (bvxor lt!404919 (bvlshr lt!404919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110965 (= lt!404919 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110965 (and (bvsge (mask!26027 thiss!1181) #b00000000000000000000000000000000) (let ((res!606279 (let ((h!18959 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76365 (bvmul (bvxor h!18959 (bvlshr h!18959 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76365 (bvlshr x!76365 #b00000000000000000000000000001101)) (mask!26027 thiss!1181)))))) (and (bvslt res!606279 (bvadd (mask!26027 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606279 #b00000000000000000000000000000000))))))

(assert (=> d!110965 (= (toIndex!0 key!785 (mask!26027 thiss!1181)) (bvand (bvxor lt!404920 (bvlshr lt!404920 #b00000000000000000000000000001101)) (mask!26027 thiss!1181)))))

(assert (=> d!110941 d!110965))

(assert (=> d!110941 d!110929))

(declare-fun b!896721 () Bool)

(declare-fun c!94729 () Bool)

(declare-fun lt!404926 () (_ BitVec 64))

(assert (=> b!896721 (= c!94729 (= lt!404926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501277 () SeekEntryResult!8900)

(declare-fun e!501278 () SeekEntryResult!8900)

(assert (=> b!896721 (= e!501277 e!501278)))

(declare-fun b!896722 () Bool)

(declare-fun e!501279 () SeekEntryResult!8900)

(assert (=> b!896722 (= e!501279 e!501277)))

(declare-fun c!94728 () Bool)

(assert (=> b!896722 (= c!94728 (= lt!404926 key!785))))

(declare-fun b!896723 () Bool)

(assert (=> b!896723 (= e!501278 (MissingVacant!8900 (index!37973 lt!404891)))))

(declare-fun d!110967 () Bool)

(declare-fun lt!404925 () SeekEntryResult!8900)

(assert (=> d!110967 (and (or ((_ is Undefined!8900) lt!404925) (not ((_ is Found!8900) lt!404925)) (and (bvsge (index!37972 lt!404925) #b00000000000000000000000000000000) (bvslt (index!37972 lt!404925) (size!25732 (_keys!10116 thiss!1181))))) (or ((_ is Undefined!8900) lt!404925) ((_ is Found!8900) lt!404925) (not ((_ is MissingVacant!8900) lt!404925)) (not (= (index!37974 lt!404925) (index!37973 lt!404891))) (and (bvsge (index!37974 lt!404925) #b00000000000000000000000000000000) (bvslt (index!37974 lt!404925) (size!25732 (_keys!10116 thiss!1181))))) (or ((_ is Undefined!8900) lt!404925) (ite ((_ is Found!8900) lt!404925) (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37972 lt!404925)) key!785) (and ((_ is MissingVacant!8900) lt!404925) (= (index!37974 lt!404925) (index!37973 lt!404891)) (= (select (arr!25281 (_keys!10116 thiss!1181)) (index!37974 lt!404925)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110967 (= lt!404925 e!501279)))

(declare-fun c!94730 () Bool)

(assert (=> d!110967 (= c!94730 (bvsge (x!76349 lt!404891) #b01111111111111111111111111111110))))

(assert (=> d!110967 (= lt!404926 (select (arr!25281 (_keys!10116 thiss!1181)) (index!37973 lt!404891)))))

(assert (=> d!110967 (validMask!0 (mask!26027 thiss!1181))))

(assert (=> d!110967 (= (seekKeyOrZeroReturnVacant!0 (x!76349 lt!404891) (index!37973 lt!404891) (index!37973 lt!404891) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)) lt!404925)))

(declare-fun b!896724 () Bool)

(assert (=> b!896724 (= e!501279 Undefined!8900)))

(declare-fun b!896725 () Bool)

(assert (=> b!896725 (= e!501278 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76349 lt!404891) #b00000000000000000000000000000001) (nextIndex!0 (index!37973 lt!404891) (x!76349 lt!404891) (mask!26027 thiss!1181)) (index!37973 lt!404891) key!785 (_keys!10116 thiss!1181) (mask!26027 thiss!1181)))))

(declare-fun b!896726 () Bool)

(assert (=> b!896726 (= e!501277 (Found!8900 (index!37973 lt!404891)))))

(assert (= (and d!110967 c!94730) b!896724))

(assert (= (and d!110967 (not c!94730)) b!896722))

(assert (= (and b!896722 c!94728) b!896726))

(assert (= (and b!896722 (not c!94728)) b!896721))

(assert (= (and b!896721 c!94729) b!896723))

(assert (= (and b!896721 (not c!94729)) b!896725))

(declare-fun m!833801 () Bool)

(assert (=> d!110967 m!833801))

(declare-fun m!833803 () Bool)

(assert (=> d!110967 m!833803))

(assert (=> d!110967 m!833765))

(assert (=> d!110967 m!833701))

(declare-fun m!833805 () Bool)

(assert (=> b!896725 m!833805))

(assert (=> b!896725 m!833805))

(declare-fun m!833807 () Bool)

(assert (=> b!896725 m!833807))

(assert (=> b!896614 d!110967))

(declare-fun mapNonEmpty!29055 () Bool)

(declare-fun mapRes!29055 () Bool)

(declare-fun tp!55916 () Bool)

(declare-fun e!501280 () Bool)

(assert (=> mapNonEmpty!29055 (= mapRes!29055 (and tp!55916 e!501280))))

(declare-fun mapKey!29055 () (_ BitVec 32))

(declare-fun mapRest!29055 () (Array (_ BitVec 32) ValueCell!8661))

(declare-fun mapValue!29055 () ValueCell!8661)

(assert (=> mapNonEmpty!29055 (= mapRest!29054 (store mapRest!29055 mapKey!29055 mapValue!29055))))

(declare-fun b!896728 () Bool)

(declare-fun e!501281 () Bool)

(assert (=> b!896728 (= e!501281 tp_is_empty!18285)))

(declare-fun b!896727 () Bool)

(assert (=> b!896727 (= e!501280 tp_is_empty!18285)))

(declare-fun mapIsEmpty!29055 () Bool)

(assert (=> mapIsEmpty!29055 mapRes!29055))

(declare-fun condMapEmpty!29055 () Bool)

(declare-fun mapDefault!29055 () ValueCell!8661)

(assert (=> mapNonEmpty!29054 (= condMapEmpty!29055 (= mapRest!29054 ((as const (Array (_ BitVec 32) ValueCell!8661)) mapDefault!29055)))))

(assert (=> mapNonEmpty!29054 (= tp!55915 (and e!501281 mapRes!29055))))

(assert (= (and mapNonEmpty!29054 condMapEmpty!29055) mapIsEmpty!29055))

(assert (= (and mapNonEmpty!29054 (not condMapEmpty!29055)) mapNonEmpty!29055))

(assert (= (and mapNonEmpty!29055 ((_ is ValueCellFull!8661) mapValue!29055)) b!896727))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8661) mapDefault!29055)) b!896728))

(declare-fun m!833809 () Bool)

(assert (=> mapNonEmpty!29055 m!833809))

(check-sat (not d!110953) (not b!896639) (not b!896642) (not d!110951) (not b_next!15957) (not b!896668) (not bm!39778) (not b!896645) (not mapNonEmpty!29055) (not d!110963) (not b!896627) tp_is_empty!18285 (not b!896701) (not b!896725) (not b!896641) (not b!896655) (not bm!39781) (not d!110967) (not d!110957) (not b!896679) b_and!26249 (not b!896667) (not bm!39784) (not b!896656))
(check-sat b_and!26249 (not b_next!15957))
