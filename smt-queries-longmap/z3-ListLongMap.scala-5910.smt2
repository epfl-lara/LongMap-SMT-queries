; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76680 () Bool)

(assert start!76680)

(declare-fun b!897654 () Bool)

(declare-fun b_free!15961 () Bool)

(declare-fun b_next!15961 () Bool)

(assert (=> b!897654 (= b_free!15961 (not b_next!15961))))

(declare-fun tp!55923 () Bool)

(declare-fun b_and!26263 () Bool)

(assert (=> b!897654 (= tp!55923 b_and!26263)))

(declare-fun b!897650 () Bool)

(declare-fun e!501883 () Bool)

(declare-datatypes ((SeekEntryResult!8853 0))(
  ( (MissingZero!8853 (index!37783 (_ BitVec 32))) (Found!8853 (index!37784 (_ BitVec 32))) (Intermediate!8853 (undefined!9665 Bool) (index!37785 (_ BitVec 32)) (x!76341 (_ BitVec 32))) (Undefined!8853) (MissingVacant!8853 (index!37786 (_ BitVec 32))) )
))
(declare-fun lt!405294 () SeekEntryResult!8853)

(declare-datatypes ((array!52637 0))(
  ( (array!52638 (arr!25300 (Array (_ BitVec 32) (_ BitVec 64))) (size!25753 (_ BitVec 32))) )
))
(declare-datatypes ((V!29351 0))(
  ( (V!29352 (val!9195 Int)) )
))
(declare-datatypes ((ValueCell!8663 0))(
  ( (ValueCellFull!8663 (v!11682 V!29351)) (EmptyCell!8663) )
))
(declare-datatypes ((array!52639 0))(
  ( (array!52640 (arr!25301 (Array (_ BitVec 32) ValueCell!8663)) (size!25754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4342 0))(
  ( (LongMapFixedSize!4343 (defaultEntry!5383 Int) (mask!26083 (_ BitVec 32)) (extraKeys!5087 (_ BitVec 32)) (zeroValue!5191 V!29351) (minValue!5191 V!29351) (_size!2226 (_ BitVec 32)) (_keys!10152 array!52637) (_values!5378 array!52639) (_vacant!2226 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4342)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897650 (= e!501883 (inRange!0 (index!37784 lt!405294) (mask!26083 thiss!1181)))))

(declare-fun b!897651 () Bool)

(declare-fun e!501890 () Bool)

(declare-fun e!501886 () Bool)

(assert (=> b!897651 (= e!501890 e!501886)))

(declare-fun res!606637 () Bool)

(assert (=> b!897651 (=> res!606637 e!501886)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897651 (= res!606637 (not (validMask!0 (mask!26083 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897651 (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30478 0))(
  ( (Unit!30479) )
))
(declare-fun lt!405296 () Unit!30478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52637 (_ BitVec 64) (_ BitVec 32)) Unit!30478)

(assert (=> b!897651 (= lt!405296 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10152 thiss!1181) key!785 (index!37784 lt!405294)))))

(declare-fun b!897652 () Bool)

(declare-fun e!501885 () Bool)

(declare-fun tp_is_empty!18289 () Bool)

(assert (=> b!897652 (= e!501885 tp_is_empty!18289)))

(declare-fun b!897653 () Bool)

(declare-fun e!501888 () Bool)

(declare-fun mapRes!29058 () Bool)

(assert (=> b!897653 (= e!501888 (and e!501885 mapRes!29058))))

(declare-fun condMapEmpty!29058 () Bool)

(declare-fun mapDefault!29058 () ValueCell!8663)

(assert (=> b!897653 (= condMapEmpty!29058 (= (arr!25301 (_values!5378 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29058)))))

(declare-fun e!501887 () Bool)

(declare-fun array_inv!19908 (array!52637) Bool)

(declare-fun array_inv!19909 (array!52639) Bool)

(assert (=> b!897654 (= e!501887 (and tp!55923 tp_is_empty!18289 (array_inv!19908 (_keys!10152 thiss!1181)) (array_inv!19909 (_values!5378 thiss!1181)) e!501888))))

(declare-fun b!897655 () Bool)

(declare-fun e!501882 () Bool)

(assert (=> b!897655 (= e!501882 tp_is_empty!18289)))

(declare-fun b!897656 () Bool)

(assert (=> b!897656 (= e!501886 (or (not (= (size!25754 (_values!5378 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26083 thiss!1181)))) (= (size!25753 (_keys!10152 thiss!1181)) (size!25754 (_values!5378 thiss!1181)))))))

(declare-fun b!897657 () Bool)

(declare-fun e!501889 () Bool)

(assert (=> b!897657 (= e!501889 (not e!501890))))

(declare-fun res!606638 () Bool)

(assert (=> b!897657 (=> res!606638 e!501890)))

(get-info :version)

(assert (=> b!897657 (= res!606638 (not ((_ is Found!8853) lt!405294)))))

(assert (=> b!897657 e!501883))

(declare-fun res!606636 () Bool)

(assert (=> b!897657 (=> res!606636 e!501883)))

(assert (=> b!897657 (= res!606636 (not ((_ is Found!8853) lt!405294)))))

(declare-fun lt!405295 () Unit!30478)

(declare-fun lemmaSeekEntryGivesInRangeIndex!80 (array!52637 array!52639 (_ BitVec 32) (_ BitVec 32) V!29351 V!29351 (_ BitVec 64)) Unit!30478)

(assert (=> b!897657 (= lt!405295 (lemmaSeekEntryGivesInRangeIndex!80 (_keys!10152 thiss!1181) (_values!5378 thiss!1181) (mask!26083 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8853)

(assert (=> b!897657 (= lt!405294 (seekEntry!0 key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun mapIsEmpty!29058 () Bool)

(assert (=> mapIsEmpty!29058 mapRes!29058))

(declare-fun b!897658 () Bool)

(declare-fun res!606635 () Bool)

(assert (=> b!897658 (=> (not res!606635) (not e!501889))))

(assert (=> b!897658 (= res!606635 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606634 () Bool)

(assert (=> start!76680 (=> (not res!606634) (not e!501889))))

(declare-fun valid!1684 (LongMapFixedSize!4342) Bool)

(assert (=> start!76680 (= res!606634 (valid!1684 thiss!1181))))

(assert (=> start!76680 e!501889))

(assert (=> start!76680 e!501887))

(assert (=> start!76680 true))

(declare-fun mapNonEmpty!29058 () Bool)

(declare-fun tp!55922 () Bool)

(assert (=> mapNonEmpty!29058 (= mapRes!29058 (and tp!55922 e!501882))))

(declare-fun mapValue!29058 () ValueCell!8663)

(declare-fun mapRest!29058 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapKey!29058 () (_ BitVec 32))

(assert (=> mapNonEmpty!29058 (= (arr!25301 (_values!5378 thiss!1181)) (store mapRest!29058 mapKey!29058 mapValue!29058))))

(assert (= (and start!76680 res!606634) b!897658))

(assert (= (and b!897658 res!606635) b!897657))

(assert (= (and b!897657 (not res!606636)) b!897650))

(assert (= (and b!897657 (not res!606638)) b!897651))

(assert (= (and b!897651 (not res!606637)) b!897656))

(assert (= (and b!897653 condMapEmpty!29058) mapIsEmpty!29058))

(assert (= (and b!897653 (not condMapEmpty!29058)) mapNonEmpty!29058))

(assert (= (and mapNonEmpty!29058 ((_ is ValueCellFull!8663) mapValue!29058)) b!897655))

(assert (= (and b!897653 ((_ is ValueCellFull!8663) mapDefault!29058)) b!897652))

(assert (= b!897654 b!897653))

(assert (= start!76680 b!897654))

(declare-fun m!835105 () Bool)

(assert (=> b!897657 m!835105))

(declare-fun m!835107 () Bool)

(assert (=> b!897657 m!835107))

(declare-fun m!835109 () Bool)

(assert (=> mapNonEmpty!29058 m!835109))

(declare-fun m!835111 () Bool)

(assert (=> b!897654 m!835111))

(declare-fun m!835113 () Bool)

(assert (=> b!897654 m!835113))

(declare-fun m!835115 () Bool)

(assert (=> b!897650 m!835115))

(declare-fun m!835117 () Bool)

(assert (=> start!76680 m!835117))

(declare-fun m!835119 () Bool)

(assert (=> b!897651 m!835119))

(declare-fun m!835121 () Bool)

(assert (=> b!897651 m!835121))

(declare-fun m!835123 () Bool)

(assert (=> b!897651 m!835123))

(check-sat (not b_next!15961) (not mapNonEmpty!29058) (not b!897651) (not b!897657) b_and!26263 (not b!897654) (not start!76680) (not b!897650) tp_is_empty!18289)
(check-sat b_and!26263 (not b_next!15961))
(get-model)

(declare-fun d!111293 () Bool)

(assert (=> d!111293 (= (inRange!0 (index!37784 lt!405294) (mask!26083 thiss!1181)) (and (bvsge (index!37784 lt!405294) #b00000000000000000000000000000000) (bvslt (index!37784 lt!405294) (bvadd (mask!26083 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897650 d!111293))

(declare-fun d!111295 () Bool)

(assert (=> d!111295 (= (validMask!0 (mask!26083 thiss!1181)) (and (or (= (mask!26083 thiss!1181) #b00000000000000000000000000000111) (= (mask!26083 thiss!1181) #b00000000000000000000000000001111) (= (mask!26083 thiss!1181) #b00000000000000000000000000011111) (= (mask!26083 thiss!1181) #b00000000000000000000000000111111) (= (mask!26083 thiss!1181) #b00000000000000000000000001111111) (= (mask!26083 thiss!1181) #b00000000000000000000000011111111) (= (mask!26083 thiss!1181) #b00000000000000000000000111111111) (= (mask!26083 thiss!1181) #b00000000000000000000001111111111) (= (mask!26083 thiss!1181) #b00000000000000000000011111111111) (= (mask!26083 thiss!1181) #b00000000000000000000111111111111) (= (mask!26083 thiss!1181) #b00000000000000000001111111111111) (= (mask!26083 thiss!1181) #b00000000000000000011111111111111) (= (mask!26083 thiss!1181) #b00000000000000000111111111111111) (= (mask!26083 thiss!1181) #b00000000000000001111111111111111) (= (mask!26083 thiss!1181) #b00000000000000011111111111111111) (= (mask!26083 thiss!1181) #b00000000000000111111111111111111) (= (mask!26083 thiss!1181) #b00000000000001111111111111111111) (= (mask!26083 thiss!1181) #b00000000000011111111111111111111) (= (mask!26083 thiss!1181) #b00000000000111111111111111111111) (= (mask!26083 thiss!1181) #b00000000001111111111111111111111) (= (mask!26083 thiss!1181) #b00000000011111111111111111111111) (= (mask!26083 thiss!1181) #b00000000111111111111111111111111) (= (mask!26083 thiss!1181) #b00000001111111111111111111111111) (= (mask!26083 thiss!1181) #b00000011111111111111111111111111) (= (mask!26083 thiss!1181) #b00000111111111111111111111111111) (= (mask!26083 thiss!1181) #b00001111111111111111111111111111) (= (mask!26083 thiss!1181) #b00011111111111111111111111111111) (= (mask!26083 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26083 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897651 d!111295))

(declare-fun d!111297 () Bool)

(declare-fun res!606673 () Bool)

(declare-fun e!501949 () Bool)

(assert (=> d!111297 (=> res!606673 e!501949)))

(assert (=> d!111297 (= res!606673 (= (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111297 (= (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 #b00000000000000000000000000000000) e!501949)))

(declare-fun b!897717 () Bool)

(declare-fun e!501950 () Bool)

(assert (=> b!897717 (= e!501949 e!501950)))

(declare-fun res!606674 () Bool)

(assert (=> b!897717 (=> (not res!606674) (not e!501950))))

(assert (=> b!897717 (= res!606674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25753 (_keys!10152 thiss!1181))))))

(declare-fun b!897718 () Bool)

(assert (=> b!897718 (= e!501950 (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111297 (not res!606673)) b!897717))

(assert (= (and b!897717 res!606674) b!897718))

(declare-fun m!835165 () Bool)

(assert (=> d!111297 m!835165))

(declare-fun m!835167 () Bool)

(assert (=> b!897718 m!835167))

(assert (=> b!897651 d!111297))

(declare-fun d!111299 () Bool)

(assert (=> d!111299 (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405317 () Unit!30478)

(declare-fun choose!13 (array!52637 (_ BitVec 64) (_ BitVec 32)) Unit!30478)

(assert (=> d!111299 (= lt!405317 (choose!13 (_keys!10152 thiss!1181) key!785 (index!37784 lt!405294)))))

(assert (=> d!111299 (bvsge (index!37784 lt!405294) #b00000000000000000000000000000000)))

(assert (=> d!111299 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10152 thiss!1181) key!785 (index!37784 lt!405294)) lt!405317)))

(declare-fun bs!25188 () Bool)

(assert (= bs!25188 d!111299))

(assert (=> bs!25188 m!835121))

(declare-fun m!835169 () Bool)

(assert (=> bs!25188 m!835169))

(assert (=> b!897651 d!111299))

(declare-fun d!111301 () Bool)

(declare-fun res!606681 () Bool)

(declare-fun e!501953 () Bool)

(assert (=> d!111301 (=> (not res!606681) (not e!501953))))

(declare-fun simpleValid!315 (LongMapFixedSize!4342) Bool)

(assert (=> d!111301 (= res!606681 (simpleValid!315 thiss!1181))))

(assert (=> d!111301 (= (valid!1684 thiss!1181) e!501953)))

(declare-fun b!897725 () Bool)

(declare-fun res!606682 () Bool)

(assert (=> b!897725 (=> (not res!606682) (not e!501953))))

(declare-fun arrayCountValidKeys!0 (array!52637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897725 (= res!606682 (= (arrayCountValidKeys!0 (_keys!10152 thiss!1181) #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))) (_size!2226 thiss!1181)))))

(declare-fun b!897726 () Bool)

(declare-fun res!606683 () Bool)

(assert (=> b!897726 (=> (not res!606683) (not e!501953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52637 (_ BitVec 32)) Bool)

(assert (=> b!897726 (= res!606683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun b!897727 () Bool)

(declare-datatypes ((List!17775 0))(
  ( (Nil!17772) (Cons!17771 (h!18916 (_ BitVec 64)) (t!25106 List!17775)) )
))
(declare-fun arrayNoDuplicates!0 (array!52637 (_ BitVec 32) List!17775) Bool)

(assert (=> b!897727 (= e!501953 (arrayNoDuplicates!0 (_keys!10152 thiss!1181) #b00000000000000000000000000000000 Nil!17772))))

(assert (= (and d!111301 res!606681) b!897725))

(assert (= (and b!897725 res!606682) b!897726))

(assert (= (and b!897726 res!606683) b!897727))

(declare-fun m!835171 () Bool)

(assert (=> d!111301 m!835171))

(declare-fun m!835173 () Bool)

(assert (=> b!897725 m!835173))

(declare-fun m!835175 () Bool)

(assert (=> b!897726 m!835175))

(declare-fun m!835177 () Bool)

(assert (=> b!897727 m!835177))

(assert (=> start!76680 d!111301))

(declare-fun d!111303 () Bool)

(declare-fun e!501956 () Bool)

(assert (=> d!111303 e!501956))

(declare-fun res!606686 () Bool)

(assert (=> d!111303 (=> res!606686 e!501956)))

(declare-fun lt!405323 () SeekEntryResult!8853)

(assert (=> d!111303 (= res!606686 (not ((_ is Found!8853) lt!405323)))))

(assert (=> d!111303 (= lt!405323 (seekEntry!0 key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun lt!405322 () Unit!30478)

(declare-fun choose!1486 (array!52637 array!52639 (_ BitVec 32) (_ BitVec 32) V!29351 V!29351 (_ BitVec 64)) Unit!30478)

(assert (=> d!111303 (= lt!405322 (choose!1486 (_keys!10152 thiss!1181) (_values!5378 thiss!1181) (mask!26083 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785))))

(assert (=> d!111303 (validMask!0 (mask!26083 thiss!1181))))

(assert (=> d!111303 (= (lemmaSeekEntryGivesInRangeIndex!80 (_keys!10152 thiss!1181) (_values!5378 thiss!1181) (mask!26083 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785) lt!405322)))

(declare-fun b!897730 () Bool)

(assert (=> b!897730 (= e!501956 (inRange!0 (index!37784 lt!405323) (mask!26083 thiss!1181)))))

(assert (= (and d!111303 (not res!606686)) b!897730))

(assert (=> d!111303 m!835107))

(declare-fun m!835179 () Bool)

(assert (=> d!111303 m!835179))

(assert (=> d!111303 m!835119))

(declare-fun m!835181 () Bool)

(assert (=> b!897730 m!835181))

(assert (=> b!897657 d!111303))

(declare-fun b!897743 () Bool)

(declare-fun c!95021 () Bool)

(declare-fun lt!405334 () (_ BitVec 64))

(assert (=> b!897743 (= c!95021 (= lt!405334 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501963 () SeekEntryResult!8853)

(declare-fun e!501964 () SeekEntryResult!8853)

(assert (=> b!897743 (= e!501963 e!501964)))

(declare-fun b!897744 () Bool)

(declare-fun lt!405335 () SeekEntryResult!8853)

(assert (=> b!897744 (= e!501964 (ite ((_ is MissingVacant!8853) lt!405335) (MissingZero!8853 (index!37786 lt!405335)) lt!405335))))

(declare-fun lt!405332 () SeekEntryResult!8853)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8853)

(assert (=> b!897744 (= lt!405335 (seekKeyOrZeroReturnVacant!0 (x!76341 lt!405332) (index!37785 lt!405332) (index!37785 lt!405332) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun b!897745 () Bool)

(assert (=> b!897745 (= e!501963 (Found!8853 (index!37785 lt!405332)))))

(declare-fun b!897746 () Bool)

(assert (=> b!897746 (= e!501964 (MissingZero!8853 (index!37785 lt!405332)))))

(declare-fun b!897747 () Bool)

(declare-fun e!501965 () SeekEntryResult!8853)

(assert (=> b!897747 (= e!501965 Undefined!8853)))

(declare-fun d!111305 () Bool)

(declare-fun lt!405333 () SeekEntryResult!8853)

(assert (=> d!111305 (and (or ((_ is MissingVacant!8853) lt!405333) (not ((_ is Found!8853) lt!405333)) (and (bvsge (index!37784 lt!405333) #b00000000000000000000000000000000) (bvslt (index!37784 lt!405333) (size!25753 (_keys!10152 thiss!1181))))) (not ((_ is MissingVacant!8853) lt!405333)) (or (not ((_ is Found!8853) lt!405333)) (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37784 lt!405333)) key!785)))))

(assert (=> d!111305 (= lt!405333 e!501965)))

(declare-fun c!95019 () Bool)

(assert (=> d!111305 (= c!95019 (and ((_ is Intermediate!8853) lt!405332) (undefined!9665 lt!405332)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111305 (= lt!405332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26083 thiss!1181)) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(assert (=> d!111305 (validMask!0 (mask!26083 thiss!1181))))

(assert (=> d!111305 (= (seekEntry!0 key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)) lt!405333)))

(declare-fun b!897748 () Bool)

(assert (=> b!897748 (= e!501965 e!501963)))

(assert (=> b!897748 (= lt!405334 (select (arr!25300 (_keys!10152 thiss!1181)) (index!37785 lt!405332)))))

(declare-fun c!95020 () Bool)

(assert (=> b!897748 (= c!95020 (= lt!405334 key!785))))

(assert (= (and d!111305 c!95019) b!897747))

(assert (= (and d!111305 (not c!95019)) b!897748))

(assert (= (and b!897748 c!95020) b!897745))

(assert (= (and b!897748 (not c!95020)) b!897743))

(assert (= (and b!897743 c!95021) b!897746))

(assert (= (and b!897743 (not c!95021)) b!897744))

(declare-fun m!835183 () Bool)

(assert (=> b!897744 m!835183))

(declare-fun m!835185 () Bool)

(assert (=> d!111305 m!835185))

(declare-fun m!835187 () Bool)

(assert (=> d!111305 m!835187))

(assert (=> d!111305 m!835187))

(declare-fun m!835189 () Bool)

(assert (=> d!111305 m!835189))

(assert (=> d!111305 m!835119))

(declare-fun m!835191 () Bool)

(assert (=> b!897748 m!835191))

(assert (=> b!897657 d!111305))

(declare-fun d!111307 () Bool)

(assert (=> d!111307 (= (array_inv!19908 (_keys!10152 thiss!1181)) (bvsge (size!25753 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897654 d!111307))

(declare-fun d!111309 () Bool)

(assert (=> d!111309 (= (array_inv!19909 (_values!5378 thiss!1181)) (bvsge (size!25754 (_values!5378 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897654 d!111309))

(declare-fun condMapEmpty!29067 () Bool)

(declare-fun mapDefault!29067 () ValueCell!8663)

(assert (=> mapNonEmpty!29058 (= condMapEmpty!29067 (= mapRest!29058 ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29067)))))

(declare-fun e!501970 () Bool)

(declare-fun mapRes!29067 () Bool)

(assert (=> mapNonEmpty!29058 (= tp!55922 (and e!501970 mapRes!29067))))

(declare-fun b!897755 () Bool)

(declare-fun e!501971 () Bool)

(assert (=> b!897755 (= e!501971 tp_is_empty!18289)))

(declare-fun mapNonEmpty!29067 () Bool)

(declare-fun tp!55938 () Bool)

(assert (=> mapNonEmpty!29067 (= mapRes!29067 (and tp!55938 e!501971))))

(declare-fun mapRest!29067 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapValue!29067 () ValueCell!8663)

(declare-fun mapKey!29067 () (_ BitVec 32))

(assert (=> mapNonEmpty!29067 (= mapRest!29058 (store mapRest!29067 mapKey!29067 mapValue!29067))))

(declare-fun b!897756 () Bool)

(assert (=> b!897756 (= e!501970 tp_is_empty!18289)))

(declare-fun mapIsEmpty!29067 () Bool)

(assert (=> mapIsEmpty!29067 mapRes!29067))

(assert (= (and mapNonEmpty!29058 condMapEmpty!29067) mapIsEmpty!29067))

(assert (= (and mapNonEmpty!29058 (not condMapEmpty!29067)) mapNonEmpty!29067))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8663) mapValue!29067)) b!897755))

(assert (= (and mapNonEmpty!29058 ((_ is ValueCellFull!8663) mapDefault!29067)) b!897756))

(declare-fun m!835193 () Bool)

(assert (=> mapNonEmpty!29067 m!835193))

(check-sat (not b!897726) (not d!111303) (not d!111305) (not d!111299) (not d!111301) (not b!897725) (not b!897718) tp_is_empty!18289 (not b_next!15961) (not b!897730) (not b!897727) b_and!26263 (not b!897744) (not mapNonEmpty!29067))
(check-sat b_and!26263 (not b_next!15961))
(get-model)

(declare-fun d!111311 () Bool)

(assert (=> d!111311 (= (inRange!0 (index!37784 lt!405323) (mask!26083 thiss!1181)) (and (bvsge (index!37784 lt!405323) #b00000000000000000000000000000000) (bvslt (index!37784 lt!405323) (bvadd (mask!26083 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897730 d!111311))

(declare-fun b!897775 () Bool)

(declare-fun lt!405340 () SeekEntryResult!8853)

(assert (=> b!897775 (and (bvsge (index!37785 lt!405340) #b00000000000000000000000000000000) (bvslt (index!37785 lt!405340) (size!25753 (_keys!10152 thiss!1181))))))

(declare-fun res!606694 () Bool)

(assert (=> b!897775 (= res!606694 (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37785 lt!405340)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501986 () Bool)

(assert (=> b!897775 (=> res!606694 e!501986)))

(declare-fun b!897776 () Bool)

(declare-fun e!501984 () Bool)

(declare-fun e!501985 () Bool)

(assert (=> b!897776 (= e!501984 e!501985)))

(declare-fun res!606693 () Bool)

(assert (=> b!897776 (= res!606693 (and ((_ is Intermediate!8853) lt!405340) (not (undefined!9665 lt!405340)) (bvslt (x!76341 lt!405340) #b01111111111111111111111111111110) (bvsge (x!76341 lt!405340) #b00000000000000000000000000000000) (bvsge (x!76341 lt!405340) #b00000000000000000000000000000000)))))

(assert (=> b!897776 (=> (not res!606693) (not e!501985))))

(declare-fun b!897777 () Bool)

(declare-fun e!501983 () SeekEntryResult!8853)

(assert (=> b!897777 (= e!501983 (Intermediate!8853 false (toIndex!0 key!785 (mask!26083 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897778 () Bool)

(declare-fun e!501982 () SeekEntryResult!8853)

(assert (=> b!897778 (= e!501982 e!501983)))

(declare-fun c!95028 () Bool)

(declare-fun lt!405341 () (_ BitVec 64))

(assert (=> b!897778 (= c!95028 (or (= lt!405341 key!785) (= (bvadd lt!405341 lt!405341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!897779 () Bool)

(assert (=> b!897779 (and (bvsge (index!37785 lt!405340) #b00000000000000000000000000000000) (bvslt (index!37785 lt!405340) (size!25753 (_keys!10152 thiss!1181))))))

(declare-fun res!606695 () Bool)

(assert (=> b!897779 (= res!606695 (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37785 lt!405340)) key!785))))

(assert (=> b!897779 (=> res!606695 e!501986)))

(assert (=> b!897779 (= e!501985 e!501986)))

(declare-fun b!897780 () Bool)

(assert (=> b!897780 (= e!501982 (Intermediate!8853 true (toIndex!0 key!785 (mask!26083 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111313 () Bool)

(assert (=> d!111313 e!501984))

(declare-fun c!95029 () Bool)

(assert (=> d!111313 (= c!95029 (and ((_ is Intermediate!8853) lt!405340) (undefined!9665 lt!405340)))))

(assert (=> d!111313 (= lt!405340 e!501982)))

(declare-fun c!95030 () Bool)

(assert (=> d!111313 (= c!95030 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111313 (= lt!405341 (select (arr!25300 (_keys!10152 thiss!1181)) (toIndex!0 key!785 (mask!26083 thiss!1181))))))

(assert (=> d!111313 (validMask!0 (mask!26083 thiss!1181))))

(assert (=> d!111313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26083 thiss!1181)) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)) lt!405340)))

(declare-fun b!897781 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897781 (= e!501983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26083 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26083 thiss!1181)) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun b!897782 () Bool)

(assert (=> b!897782 (= e!501984 (bvsge (x!76341 lt!405340) #b01111111111111111111111111111110))))

(declare-fun b!897783 () Bool)

(assert (=> b!897783 (and (bvsge (index!37785 lt!405340) #b00000000000000000000000000000000) (bvslt (index!37785 lt!405340) (size!25753 (_keys!10152 thiss!1181))))))

(assert (=> b!897783 (= e!501986 (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37785 lt!405340)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111313 c!95030) b!897780))

(assert (= (and d!111313 (not c!95030)) b!897778))

(assert (= (and b!897778 c!95028) b!897777))

(assert (= (and b!897778 (not c!95028)) b!897781))

(assert (= (and d!111313 c!95029) b!897782))

(assert (= (and d!111313 (not c!95029)) b!897776))

(assert (= (and b!897776 res!606693) b!897779))

(assert (= (and b!897779 (not res!606695)) b!897775))

(assert (= (and b!897775 (not res!606694)) b!897783))

(declare-fun m!835195 () Bool)

(assert (=> b!897779 m!835195))

(assert (=> b!897781 m!835187))

(declare-fun m!835197 () Bool)

(assert (=> b!897781 m!835197))

(assert (=> b!897781 m!835197))

(declare-fun m!835199 () Bool)

(assert (=> b!897781 m!835199))

(assert (=> b!897783 m!835195))

(assert (=> d!111313 m!835187))

(declare-fun m!835201 () Bool)

(assert (=> d!111313 m!835201))

(assert (=> d!111313 m!835119))

(assert (=> b!897775 m!835195))

(assert (=> d!111305 d!111313))

(declare-fun d!111315 () Bool)

(declare-fun lt!405347 () (_ BitVec 32))

(declare-fun lt!405346 () (_ BitVec 32))

(assert (=> d!111315 (= lt!405347 (bvmul (bvxor lt!405346 (bvlshr lt!405346 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111315 (= lt!405346 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111315 (and (bvsge (mask!26083 thiss!1181) #b00000000000000000000000000000000) (let ((res!606696 (let ((h!18917 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76359 (bvmul (bvxor h!18917 (bvlshr h!18917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76359 (bvlshr x!76359 #b00000000000000000000000000001101)) (mask!26083 thiss!1181)))))) (and (bvslt res!606696 (bvadd (mask!26083 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606696 #b00000000000000000000000000000000))))))

(assert (=> d!111315 (= (toIndex!0 key!785 (mask!26083 thiss!1181)) (bvand (bvxor lt!405347 (bvlshr lt!405347 #b00000000000000000000000000001101)) (mask!26083 thiss!1181)))))

(assert (=> d!111305 d!111315))

(assert (=> d!111305 d!111295))

(declare-fun b!897793 () Bool)

(declare-fun res!606707 () Bool)

(declare-fun e!501989 () Bool)

(assert (=> b!897793 (=> (not res!606707) (not e!501989))))

(declare-fun size!25759 (LongMapFixedSize!4342) (_ BitVec 32))

(assert (=> b!897793 (= res!606707 (bvsge (size!25759 thiss!1181) (_size!2226 thiss!1181)))))

(declare-fun b!897794 () Bool)

(declare-fun res!606705 () Bool)

(assert (=> b!897794 (=> (not res!606705) (not e!501989))))

(assert (=> b!897794 (= res!606705 (= (size!25759 thiss!1181) (bvadd (_size!2226 thiss!1181) (bvsdiv (bvadd (extraKeys!5087 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!111317 () Bool)

(declare-fun res!606708 () Bool)

(assert (=> d!111317 (=> (not res!606708) (not e!501989))))

(assert (=> d!111317 (= res!606708 (validMask!0 (mask!26083 thiss!1181)))))

(assert (=> d!111317 (= (simpleValid!315 thiss!1181) e!501989)))

(declare-fun b!897795 () Bool)

(assert (=> b!897795 (= e!501989 (and (bvsge (extraKeys!5087 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5087 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2226 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!897792 () Bool)

(declare-fun res!606706 () Bool)

(assert (=> b!897792 (=> (not res!606706) (not e!501989))))

(assert (=> b!897792 (= res!606706 (and (= (size!25754 (_values!5378 thiss!1181)) (bvadd (mask!26083 thiss!1181) #b00000000000000000000000000000001)) (= (size!25753 (_keys!10152 thiss!1181)) (size!25754 (_values!5378 thiss!1181))) (bvsge (_size!2226 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2226 thiss!1181) (bvadd (mask!26083 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!111317 res!606708) b!897792))

(assert (= (and b!897792 res!606706) b!897793))

(assert (= (and b!897793 res!606707) b!897794))

(assert (= (and b!897794 res!606705) b!897795))

(declare-fun m!835203 () Bool)

(assert (=> b!897793 m!835203))

(assert (=> b!897794 m!835203))

(assert (=> d!111317 m!835119))

(assert (=> d!111301 d!111317))

(declare-fun bm!39832 () Bool)

(declare-fun call!39835 () (_ BitVec 32))

(assert (=> bm!39832 (= call!39835 (arrayCountValidKeys!0 (_keys!10152 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25753 (_keys!10152 thiss!1181))))))

(declare-fun b!897804 () Bool)

(declare-fun e!501994 () (_ BitVec 32))

(declare-fun e!501995 () (_ BitVec 32))

(assert (=> b!897804 (= e!501994 e!501995)))

(declare-fun c!95036 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897804 (= c!95036 (validKeyInArray!0 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897805 () Bool)

(assert (=> b!897805 (= e!501995 (bvadd #b00000000000000000000000000000001 call!39835))))

(declare-fun d!111319 () Bool)

(declare-fun lt!405350 () (_ BitVec 32))

(assert (=> d!111319 (and (bvsge lt!405350 #b00000000000000000000000000000000) (bvsle lt!405350 (bvsub (size!25753 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111319 (= lt!405350 e!501994)))

(declare-fun c!95035 () Bool)

(assert (=> d!111319 (= c!95035 (bvsge #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))))))

(assert (=> d!111319 (and (bvsle #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25753 (_keys!10152 thiss!1181)) (size!25753 (_keys!10152 thiss!1181))))))

(assert (=> d!111319 (= (arrayCountValidKeys!0 (_keys!10152 thiss!1181) #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))) lt!405350)))

(declare-fun b!897806 () Bool)

(assert (=> b!897806 (= e!501995 call!39835)))

(declare-fun b!897807 () Bool)

(assert (=> b!897807 (= e!501994 #b00000000000000000000000000000000)))

(assert (= (and d!111319 c!95035) b!897807))

(assert (= (and d!111319 (not c!95035)) b!897804))

(assert (= (and b!897804 c!95036) b!897805))

(assert (= (and b!897804 (not c!95036)) b!897806))

(assert (= (or b!897805 b!897806) bm!39832))

(declare-fun m!835205 () Bool)

(assert (=> bm!39832 m!835205))

(assert (=> b!897804 m!835165))

(assert (=> b!897804 m!835165))

(declare-fun m!835207 () Bool)

(assert (=> b!897804 m!835207))

(assert (=> b!897725 d!111319))

(declare-fun b!897816 () Bool)

(declare-fun e!502004 () Bool)

(declare-fun e!502003 () Bool)

(assert (=> b!897816 (= e!502004 e!502003)))

(declare-fun lt!405357 () (_ BitVec 64))

(assert (=> b!897816 (= lt!405357 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405358 () Unit!30478)

(assert (=> b!897816 (= lt!405358 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10152 thiss!1181) lt!405357 #b00000000000000000000000000000000))))

(assert (=> b!897816 (arrayContainsKey!0 (_keys!10152 thiss!1181) lt!405357 #b00000000000000000000000000000000)))

(declare-fun lt!405359 () Unit!30478)

(assert (=> b!897816 (= lt!405359 lt!405358)))

(declare-fun res!606714 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8853)

(assert (=> b!897816 (= res!606714 (= (seekEntryOrOpen!0 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000) (_keys!10152 thiss!1181) (mask!26083 thiss!1181)) (Found!8853 #b00000000000000000000000000000000)))))

(assert (=> b!897816 (=> (not res!606714) (not e!502003))))

(declare-fun d!111321 () Bool)

(declare-fun res!606713 () Bool)

(declare-fun e!502002 () Bool)

(assert (=> d!111321 (=> res!606713 e!502002)))

(assert (=> d!111321 (= res!606713 (bvsge #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))))))

(assert (=> d!111321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)) e!502002)))

(declare-fun bm!39835 () Bool)

(declare-fun call!39838 () Bool)

(assert (=> bm!39835 (= call!39838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(declare-fun b!897817 () Bool)

(assert (=> b!897817 (= e!502004 call!39838)))

(declare-fun b!897818 () Bool)

(assert (=> b!897818 (= e!502002 e!502004)))

(declare-fun c!95039 () Bool)

(assert (=> b!897818 (= c!95039 (validKeyInArray!0 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897819 () Bool)

(assert (=> b!897819 (= e!502003 call!39838)))

(assert (= (and d!111321 (not res!606713)) b!897818))

(assert (= (and b!897818 c!95039) b!897816))

(assert (= (and b!897818 (not c!95039)) b!897817))

(assert (= (and b!897816 res!606714) b!897819))

(assert (= (or b!897819 b!897817) bm!39835))

(assert (=> b!897816 m!835165))

(declare-fun m!835209 () Bool)

(assert (=> b!897816 m!835209))

(declare-fun m!835211 () Bool)

(assert (=> b!897816 m!835211))

(assert (=> b!897816 m!835165))

(declare-fun m!835213 () Bool)

(assert (=> b!897816 m!835213))

(declare-fun m!835215 () Bool)

(assert (=> bm!39835 m!835215))

(assert (=> b!897818 m!835165))

(assert (=> b!897818 m!835165))

(assert (=> b!897818 m!835207))

(assert (=> b!897726 d!111321))

(declare-fun b!897832 () Bool)

(declare-fun e!502011 () SeekEntryResult!8853)

(assert (=> b!897832 (= e!502011 (Found!8853 (index!37785 lt!405332)))))

(declare-fun b!897833 () Bool)

(declare-fun e!502013 () SeekEntryResult!8853)

(assert (=> b!897833 (= e!502013 Undefined!8853)))

(declare-fun b!897834 () Bool)

(assert (=> b!897834 (= e!502013 e!502011)))

(declare-fun c!95046 () Bool)

(declare-fun lt!405364 () (_ BitVec 64))

(assert (=> b!897834 (= c!95046 (= lt!405364 key!785))))

(declare-fun b!897835 () Bool)

(declare-fun c!95048 () Bool)

(assert (=> b!897835 (= c!95048 (= lt!405364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502012 () SeekEntryResult!8853)

(assert (=> b!897835 (= e!502011 e!502012)))

(declare-fun lt!405365 () SeekEntryResult!8853)

(declare-fun d!111323 () Bool)

(assert (=> d!111323 (and (or ((_ is Undefined!8853) lt!405365) (not ((_ is Found!8853) lt!405365)) (and (bvsge (index!37784 lt!405365) #b00000000000000000000000000000000) (bvslt (index!37784 lt!405365) (size!25753 (_keys!10152 thiss!1181))))) (or ((_ is Undefined!8853) lt!405365) ((_ is Found!8853) lt!405365) (not ((_ is MissingVacant!8853) lt!405365)) (not (= (index!37786 lt!405365) (index!37785 lt!405332))) (and (bvsge (index!37786 lt!405365) #b00000000000000000000000000000000) (bvslt (index!37786 lt!405365) (size!25753 (_keys!10152 thiss!1181))))) (or ((_ is Undefined!8853) lt!405365) (ite ((_ is Found!8853) lt!405365) (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37784 lt!405365)) key!785) (and ((_ is MissingVacant!8853) lt!405365) (= (index!37786 lt!405365) (index!37785 lt!405332)) (= (select (arr!25300 (_keys!10152 thiss!1181)) (index!37786 lt!405365)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111323 (= lt!405365 e!502013)))

(declare-fun c!95047 () Bool)

(assert (=> d!111323 (= c!95047 (bvsge (x!76341 lt!405332) #b01111111111111111111111111111110))))

(assert (=> d!111323 (= lt!405364 (select (arr!25300 (_keys!10152 thiss!1181)) (index!37785 lt!405332)))))

(assert (=> d!111323 (validMask!0 (mask!26083 thiss!1181))))

(assert (=> d!111323 (= (seekKeyOrZeroReturnVacant!0 (x!76341 lt!405332) (index!37785 lt!405332) (index!37785 lt!405332) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)) lt!405365)))

(declare-fun b!897836 () Bool)

(assert (=> b!897836 (= e!502012 (MissingVacant!8853 (index!37785 lt!405332)))))

(declare-fun b!897837 () Bool)

(assert (=> b!897837 (= e!502012 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76341 lt!405332) #b00000000000000000000000000000001) (nextIndex!0 (index!37785 lt!405332) (bvadd (x!76341 lt!405332) #b00000000000000000000000000000001) (mask!26083 thiss!1181)) (index!37785 lt!405332) key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(assert (= (and d!111323 c!95047) b!897833))

(assert (= (and d!111323 (not c!95047)) b!897834))

(assert (= (and b!897834 c!95046) b!897832))

(assert (= (and b!897834 (not c!95046)) b!897835))

(assert (= (and b!897835 c!95048) b!897836))

(assert (= (and b!897835 (not c!95048)) b!897837))

(declare-fun m!835217 () Bool)

(assert (=> d!111323 m!835217))

(declare-fun m!835219 () Bool)

(assert (=> d!111323 m!835219))

(assert (=> d!111323 m!835191))

(assert (=> d!111323 m!835119))

(declare-fun m!835221 () Bool)

(assert (=> b!897837 m!835221))

(assert (=> b!897837 m!835221))

(declare-fun m!835223 () Bool)

(assert (=> b!897837 m!835223))

(assert (=> b!897744 d!111323))

(assert (=> d!111303 d!111305))

(declare-fun d!111325 () Bool)

(declare-fun e!502016 () Bool)

(assert (=> d!111325 e!502016))

(declare-fun res!606717 () Bool)

(assert (=> d!111325 (=> res!606717 e!502016)))

(declare-fun lt!405368 () SeekEntryResult!8853)

(assert (=> d!111325 (= res!606717 (not ((_ is Found!8853) lt!405368)))))

(assert (=> d!111325 (= lt!405368 (seekEntry!0 key!785 (_keys!10152 thiss!1181) (mask!26083 thiss!1181)))))

(assert (=> d!111325 true))

(declare-fun _$36!357 () Unit!30478)

(assert (=> d!111325 (= (choose!1486 (_keys!10152 thiss!1181) (_values!5378 thiss!1181) (mask!26083 thiss!1181) (extraKeys!5087 thiss!1181) (zeroValue!5191 thiss!1181) (minValue!5191 thiss!1181) key!785) _$36!357)))

(declare-fun b!897840 () Bool)

(assert (=> b!897840 (= e!502016 (inRange!0 (index!37784 lt!405368) (mask!26083 thiss!1181)))))

(assert (= (and d!111325 (not res!606717)) b!897840))

(assert (=> d!111325 m!835107))

(declare-fun m!835225 () Bool)

(assert (=> b!897840 m!835225))

(assert (=> d!111303 d!111325))

(assert (=> d!111303 d!111295))

(declare-fun d!111327 () Bool)

(declare-fun res!606718 () Bool)

(declare-fun e!502017 () Bool)

(assert (=> d!111327 (=> res!606718 e!502017)))

(assert (=> d!111327 (= res!606718 (= (select (arr!25300 (_keys!10152 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111327 (= (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502017)))

(declare-fun b!897841 () Bool)

(declare-fun e!502018 () Bool)

(assert (=> b!897841 (= e!502017 e!502018)))

(declare-fun res!606719 () Bool)

(assert (=> b!897841 (=> (not res!606719) (not e!502018))))

(assert (=> b!897841 (= res!606719 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25753 (_keys!10152 thiss!1181))))))

(declare-fun b!897842 () Bool)

(assert (=> b!897842 (= e!502018 (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111327 (not res!606718)) b!897841))

(assert (= (and b!897841 res!606719) b!897842))

(declare-fun m!835227 () Bool)

(assert (=> d!111327 m!835227))

(declare-fun m!835229 () Bool)

(assert (=> b!897842 m!835229))

(assert (=> b!897718 d!111327))

(declare-fun b!897853 () Bool)

(declare-fun e!502030 () Bool)

(declare-fun call!39841 () Bool)

(assert (=> b!897853 (= e!502030 call!39841)))

(declare-fun bm!39838 () Bool)

(declare-fun c!95051 () Bool)

(assert (=> bm!39838 (= call!39841 (arrayNoDuplicates!0 (_keys!10152 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95051 (Cons!17771 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000) Nil!17772) Nil!17772)))))

(declare-fun b!897854 () Bool)

(declare-fun e!502027 () Bool)

(declare-fun e!502029 () Bool)

(assert (=> b!897854 (= e!502027 e!502029)))

(declare-fun res!606727 () Bool)

(assert (=> b!897854 (=> (not res!606727) (not e!502029))))

(declare-fun e!502028 () Bool)

(assert (=> b!897854 (= res!606727 (not e!502028))))

(declare-fun res!606726 () Bool)

(assert (=> b!897854 (=> (not res!606726) (not e!502028))))

(assert (=> b!897854 (= res!606726 (validKeyInArray!0 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111329 () Bool)

(declare-fun res!606728 () Bool)

(assert (=> d!111329 (=> res!606728 e!502027)))

(assert (=> d!111329 (= res!606728 (bvsge #b00000000000000000000000000000000 (size!25753 (_keys!10152 thiss!1181))))))

(assert (=> d!111329 (= (arrayNoDuplicates!0 (_keys!10152 thiss!1181) #b00000000000000000000000000000000 Nil!17772) e!502027)))

(declare-fun b!897855 () Bool)

(declare-fun contains!4373 (List!17775 (_ BitVec 64)) Bool)

(assert (=> b!897855 (= e!502028 (contains!4373 Nil!17772 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897856 () Bool)

(assert (=> b!897856 (= e!502030 call!39841)))

(declare-fun b!897857 () Bool)

(assert (=> b!897857 (= e!502029 e!502030)))

(assert (=> b!897857 (= c!95051 (validKeyInArray!0 (select (arr!25300 (_keys!10152 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111329 (not res!606728)) b!897854))

(assert (= (and b!897854 res!606726) b!897855))

(assert (= (and b!897854 res!606727) b!897857))

(assert (= (and b!897857 c!95051) b!897856))

(assert (= (and b!897857 (not c!95051)) b!897853))

(assert (= (or b!897856 b!897853) bm!39838))

(assert (=> bm!39838 m!835165))

(declare-fun m!835231 () Bool)

(assert (=> bm!39838 m!835231))

(assert (=> b!897854 m!835165))

(assert (=> b!897854 m!835165))

(assert (=> b!897854 m!835207))

(assert (=> b!897855 m!835165))

(assert (=> b!897855 m!835165))

(declare-fun m!835233 () Bool)

(assert (=> b!897855 m!835233))

(assert (=> b!897857 m!835165))

(assert (=> b!897857 m!835165))

(assert (=> b!897857 m!835207))

(assert (=> b!897727 d!111329))

(assert (=> d!111299 d!111297))

(declare-fun d!111331 () Bool)

(assert (=> d!111331 (arrayContainsKey!0 (_keys!10152 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111331 true))

(declare-fun _$60!409 () Unit!30478)

(assert (=> d!111331 (= (choose!13 (_keys!10152 thiss!1181) key!785 (index!37784 lt!405294)) _$60!409)))

(declare-fun bs!25189 () Bool)

(assert (= bs!25189 d!111331))

(assert (=> bs!25189 m!835121))

(assert (=> d!111299 d!111331))

(declare-fun condMapEmpty!29068 () Bool)

(declare-fun mapDefault!29068 () ValueCell!8663)

(assert (=> mapNonEmpty!29067 (= condMapEmpty!29068 (= mapRest!29067 ((as const (Array (_ BitVec 32) ValueCell!8663)) mapDefault!29068)))))

(declare-fun e!502031 () Bool)

(declare-fun mapRes!29068 () Bool)

(assert (=> mapNonEmpty!29067 (= tp!55938 (and e!502031 mapRes!29068))))

(declare-fun b!897858 () Bool)

(declare-fun e!502032 () Bool)

(assert (=> b!897858 (= e!502032 tp_is_empty!18289)))

(declare-fun mapNonEmpty!29068 () Bool)

(declare-fun tp!55939 () Bool)

(assert (=> mapNonEmpty!29068 (= mapRes!29068 (and tp!55939 e!502032))))

(declare-fun mapKey!29068 () (_ BitVec 32))

(declare-fun mapRest!29068 () (Array (_ BitVec 32) ValueCell!8663))

(declare-fun mapValue!29068 () ValueCell!8663)

(assert (=> mapNonEmpty!29068 (= mapRest!29067 (store mapRest!29068 mapKey!29068 mapValue!29068))))

(declare-fun b!897859 () Bool)

(assert (=> b!897859 (= e!502031 tp_is_empty!18289)))

(declare-fun mapIsEmpty!29068 () Bool)

(assert (=> mapIsEmpty!29068 mapRes!29068))

(assert (= (and mapNonEmpty!29067 condMapEmpty!29068) mapIsEmpty!29068))

(assert (= (and mapNonEmpty!29067 (not condMapEmpty!29068)) mapNonEmpty!29068))

(assert (= (and mapNonEmpty!29068 ((_ is ValueCellFull!8663) mapValue!29068)) b!897858))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8663) mapDefault!29068)) b!897859))

(declare-fun m!835235 () Bool)

(assert (=> mapNonEmpty!29068 m!835235))

(check-sat (not bm!39832) (not mapNonEmpty!29068) (not b!897857) (not b!897781) (not b!897840) (not b!897855) (not b!897793) (not d!111325) (not b!897842) (not b!897837) (not b!897804) (not bm!39835) tp_is_empty!18289 (not d!111331) (not b_next!15961) (not b!897816) (not d!111323) (not bm!39838) (not d!111313) (not b!897794) b_and!26263 (not b!897854) (not d!111317) (not b!897818))
(check-sat b_and!26263 (not b_next!15961))
