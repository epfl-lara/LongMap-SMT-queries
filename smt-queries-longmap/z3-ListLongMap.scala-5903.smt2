; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76500 () Bool)

(assert start!76500)

(declare-fun b!896640 () Bool)

(declare-fun b_free!15919 () Bool)

(declare-fun b_next!15919 () Bool)

(assert (=> b!896640 (= b_free!15919 (not b_next!15919))))

(declare-fun tp!55773 () Bool)

(declare-fun b_and!26221 () Bool)

(assert (=> b!896640 (= tp!55773 b_and!26221)))

(declare-fun b!896636 () Bool)

(declare-fun e!501098 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896636 (= e!501098 (not (validKeyInArray!0 key!785)))))

(declare-fun b!896637 () Bool)

(declare-fun e!501104 () Bool)

(declare-fun e!501099 () Bool)

(declare-fun mapRes!28972 () Bool)

(assert (=> b!896637 (= e!501104 (and e!501099 mapRes!28972))))

(declare-fun condMapEmpty!28972 () Bool)

(declare-datatypes ((array!52539 0))(
  ( (array!52540 (arr!25258 (Array (_ BitVec 32) (_ BitVec 64))) (size!25709 (_ BitVec 32))) )
))
(declare-datatypes ((V!29295 0))(
  ( (V!29296 (val!9174 Int)) )
))
(declare-datatypes ((ValueCell!8642 0))(
  ( (ValueCellFull!8642 (v!11661 V!29295)) (EmptyCell!8642) )
))
(declare-datatypes ((array!52541 0))(
  ( (array!52542 (arr!25259 (Array (_ BitVec 32) ValueCell!8642)) (size!25710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4300 0))(
  ( (LongMapFixedSize!4301 (defaultEntry!5362 Int) (mask!26014 (_ BitVec 32)) (extraKeys!5058 (_ BitVec 32)) (zeroValue!5162 V!29295) (minValue!5162 V!29295) (_size!2205 (_ BitVec 32)) (_keys!10109 array!52539) (_values!5349 array!52541) (_vacant!2205 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4300)

(declare-fun mapDefault!28972 () ValueCell!8642)

(assert (=> b!896637 (= condMapEmpty!28972 (= (arr!25259 (_values!5349 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8642)) mapDefault!28972)))))

(declare-fun b!896638 () Bool)

(declare-fun e!501101 () Bool)

(assert (=> b!896638 (= e!501101 e!501098)))

(declare-fun res!606188 () Bool)

(assert (=> b!896638 (=> (not res!606188) (not e!501098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896638 (= res!606188 (validMask!0 (mask!26014 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8837 0))(
  ( (MissingZero!8837 (index!37719 (_ BitVec 32))) (Found!8837 (index!37720 (_ BitVec 32))) (Intermediate!8837 (undefined!9649 Bool) (index!37721 (_ BitVec 32)) (x!76195 (_ BitVec 32))) (Undefined!8837) (MissingVacant!8837 (index!37722 (_ BitVec 32))) )
))
(declare-fun lt!404954 () SeekEntryResult!8837)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8837)

(assert (=> b!896638 (= lt!404954 (seekEntry!0 key!785 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(declare-fun res!606192 () Bool)

(assert (=> start!76500 (=> (not res!606192) (not e!501101))))

(declare-fun valid!1671 (LongMapFixedSize!4300) Bool)

(assert (=> start!76500 (= res!606192 (valid!1671 thiss!1181))))

(assert (=> start!76500 e!501101))

(declare-fun e!501103 () Bool)

(assert (=> start!76500 e!501103))

(assert (=> start!76500 true))

(declare-fun b!896639 () Bool)

(declare-fun res!606191 () Bool)

(assert (=> b!896639 (=> (not res!606191) (not e!501101))))

(assert (=> b!896639 (= res!606191 (not (= key!785 (bvneg key!785))))))

(declare-fun tp_is_empty!18247 () Bool)

(declare-fun array_inv!19876 (array!52539) Bool)

(declare-fun array_inv!19877 (array!52541) Bool)

(assert (=> b!896640 (= e!501103 (and tp!55773 tp_is_empty!18247 (array_inv!19876 (_keys!10109 thiss!1181)) (array_inv!19877 (_values!5349 thiss!1181)) e!501104))))

(declare-fun b!896641 () Bool)

(assert (=> b!896641 (= e!501099 tp_is_empty!18247)))

(declare-fun b!896642 () Bool)

(declare-fun res!606193 () Bool)

(assert (=> b!896642 (=> (not res!606193) (not e!501098))))

(assert (=> b!896642 (= res!606193 (and (= (size!25710 (_values!5349 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26014 thiss!1181))) (= (size!25709 (_keys!10109 thiss!1181)) (size!25710 (_values!5349 thiss!1181))) (bvsge (mask!26014 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5058 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5058 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!896643 () Bool)

(declare-fun res!606190 () Bool)

(assert (=> b!896643 (=> (not res!606190) (not e!501098))))

(declare-datatypes ((List!17767 0))(
  ( (Nil!17764) (Cons!17763 (h!18906 (_ BitVec 64)) (t!25098 List!17767)) )
))
(declare-fun arrayNoDuplicates!0 (array!52539 (_ BitVec 32) List!17767) Bool)

(assert (=> b!896643 (= res!606190 (arrayNoDuplicates!0 (_keys!10109 thiss!1181) #b00000000000000000000000000000000 Nil!17764))))

(declare-fun mapIsEmpty!28972 () Bool)

(assert (=> mapIsEmpty!28972 mapRes!28972))

(declare-fun b!896644 () Bool)

(declare-fun res!606189 () Bool)

(assert (=> b!896644 (=> (not res!606189) (not e!501098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52539 (_ BitVec 32)) Bool)

(assert (=> b!896644 (= res!606189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(declare-fun mapNonEmpty!28972 () Bool)

(declare-fun tp!55774 () Bool)

(declare-fun e!501102 () Bool)

(assert (=> mapNonEmpty!28972 (= mapRes!28972 (and tp!55774 e!501102))))

(declare-fun mapRest!28972 () (Array (_ BitVec 32) ValueCell!8642))

(declare-fun mapValue!28972 () ValueCell!8642)

(declare-fun mapKey!28972 () (_ BitVec 32))

(assert (=> mapNonEmpty!28972 (= (arr!25259 (_values!5349 thiss!1181)) (store mapRest!28972 mapKey!28972 mapValue!28972))))

(declare-fun b!896645 () Bool)

(assert (=> b!896645 (= e!501102 tp_is_empty!18247)))

(assert (= (and start!76500 res!606192) b!896639))

(assert (= (and b!896639 res!606191) b!896638))

(assert (= (and b!896638 res!606188) b!896642))

(assert (= (and b!896642 res!606193) b!896644))

(assert (= (and b!896644 res!606189) b!896643))

(assert (= (and b!896643 res!606190) b!896636))

(assert (= (and b!896637 condMapEmpty!28972) mapIsEmpty!28972))

(assert (= (and b!896637 (not condMapEmpty!28972)) mapNonEmpty!28972))

(get-info :version)

(assert (= (and mapNonEmpty!28972 ((_ is ValueCellFull!8642) mapValue!28972)) b!896645))

(assert (= (and b!896637 ((_ is ValueCellFull!8642) mapDefault!28972)) b!896641))

(assert (= b!896640 b!896637))

(assert (= start!76500 b!896640))

(declare-fun m!834475 () Bool)

(assert (=> b!896643 m!834475))

(declare-fun m!834477 () Bool)

(assert (=> b!896640 m!834477))

(declare-fun m!834479 () Bool)

(assert (=> b!896640 m!834479))

(declare-fun m!834481 () Bool)

(assert (=> b!896636 m!834481))

(declare-fun m!834483 () Bool)

(assert (=> start!76500 m!834483))

(declare-fun m!834485 () Bool)

(assert (=> mapNonEmpty!28972 m!834485))

(declare-fun m!834487 () Bool)

(assert (=> b!896644 m!834487))

(declare-fun m!834489 () Bool)

(assert (=> b!896638 m!834489))

(declare-fun m!834491 () Bool)

(assert (=> b!896638 m!834491))

(check-sat (not b!896640) (not start!76500) (not b_next!15919) (not b!896638) b_and!26221 (not b!896643) (not b!896636) (not b!896644) (not mapNonEmpty!28972) tp_is_empty!18247)
(check-sat b_and!26221 (not b_next!15919))
(get-model)

(declare-fun d!111135 () Bool)

(assert (=> d!111135 (= (validMask!0 (mask!26014 thiss!1181)) (and (or (= (mask!26014 thiss!1181) #b00000000000000000000000000000111) (= (mask!26014 thiss!1181) #b00000000000000000000000000001111) (= (mask!26014 thiss!1181) #b00000000000000000000000000011111) (= (mask!26014 thiss!1181) #b00000000000000000000000000111111) (= (mask!26014 thiss!1181) #b00000000000000000000000001111111) (= (mask!26014 thiss!1181) #b00000000000000000000000011111111) (= (mask!26014 thiss!1181) #b00000000000000000000000111111111) (= (mask!26014 thiss!1181) #b00000000000000000000001111111111) (= (mask!26014 thiss!1181) #b00000000000000000000011111111111) (= (mask!26014 thiss!1181) #b00000000000000000000111111111111) (= (mask!26014 thiss!1181) #b00000000000000000001111111111111) (= (mask!26014 thiss!1181) #b00000000000000000011111111111111) (= (mask!26014 thiss!1181) #b00000000000000000111111111111111) (= (mask!26014 thiss!1181) #b00000000000000001111111111111111) (= (mask!26014 thiss!1181) #b00000000000000011111111111111111) (= (mask!26014 thiss!1181) #b00000000000000111111111111111111) (= (mask!26014 thiss!1181) #b00000000000001111111111111111111) (= (mask!26014 thiss!1181) #b00000000000011111111111111111111) (= (mask!26014 thiss!1181) #b00000000000111111111111111111111) (= (mask!26014 thiss!1181) #b00000000001111111111111111111111) (= (mask!26014 thiss!1181) #b00000000011111111111111111111111) (= (mask!26014 thiss!1181) #b00000000111111111111111111111111) (= (mask!26014 thiss!1181) #b00000001111111111111111111111111) (= (mask!26014 thiss!1181) #b00000011111111111111111111111111) (= (mask!26014 thiss!1181) #b00000111111111111111111111111111) (= (mask!26014 thiss!1181) #b00001111111111111111111111111111) (= (mask!26014 thiss!1181) #b00011111111111111111111111111111) (= (mask!26014 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26014 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896638 d!111135))

(declare-fun b!896718 () Bool)

(declare-fun e!501153 () SeekEntryResult!8837)

(declare-fun lt!404970 () SeekEntryResult!8837)

(assert (=> b!896718 (= e!501153 (MissingZero!8837 (index!37721 lt!404970)))))

(declare-fun b!896719 () Bool)

(declare-fun e!501154 () SeekEntryResult!8837)

(assert (=> b!896719 (= e!501154 Undefined!8837)))

(declare-fun b!896720 () Bool)

(declare-fun e!501155 () SeekEntryResult!8837)

(assert (=> b!896720 (= e!501154 e!501155)))

(declare-fun lt!404972 () (_ BitVec 64))

(assert (=> b!896720 (= lt!404972 (select (arr!25258 (_keys!10109 thiss!1181)) (index!37721 lt!404970)))))

(declare-fun c!94892 () Bool)

(assert (=> b!896720 (= c!94892 (= lt!404972 key!785))))

(declare-fun d!111137 () Bool)

(declare-fun lt!404969 () SeekEntryResult!8837)

(assert (=> d!111137 (and (or ((_ is MissingVacant!8837) lt!404969) (not ((_ is Found!8837) lt!404969)) (and (bvsge (index!37720 lt!404969) #b00000000000000000000000000000000) (bvslt (index!37720 lt!404969) (size!25709 (_keys!10109 thiss!1181))))) (not ((_ is MissingVacant!8837) lt!404969)) (or (not ((_ is Found!8837) lt!404969)) (= (select (arr!25258 (_keys!10109 thiss!1181)) (index!37720 lt!404969)) key!785)))))

(assert (=> d!111137 (= lt!404969 e!501154)))

(declare-fun c!94891 () Bool)

(assert (=> d!111137 (= c!94891 (and ((_ is Intermediate!8837) lt!404970) (undefined!9649 lt!404970)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111137 (= lt!404970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26014 thiss!1181)) key!785 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(assert (=> d!111137 (validMask!0 (mask!26014 thiss!1181))))

(assert (=> d!111137 (= (seekEntry!0 key!785 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)) lt!404969)))

(declare-fun b!896721 () Bool)

(declare-fun c!94890 () Bool)

(assert (=> b!896721 (= c!94890 (= lt!404972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896721 (= e!501155 e!501153)))

(declare-fun b!896722 () Bool)

(declare-fun lt!404971 () SeekEntryResult!8837)

(assert (=> b!896722 (= e!501153 (ite ((_ is MissingVacant!8837) lt!404971) (MissingZero!8837 (index!37722 lt!404971)) lt!404971))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8837)

(assert (=> b!896722 (= lt!404971 (seekKeyOrZeroReturnVacant!0 (x!76195 lt!404970) (index!37721 lt!404970) (index!37721 lt!404970) key!785 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(declare-fun b!896723 () Bool)

(assert (=> b!896723 (= e!501155 (Found!8837 (index!37721 lt!404970)))))

(assert (= (and d!111137 c!94891) b!896719))

(assert (= (and d!111137 (not c!94891)) b!896720))

(assert (= (and b!896720 c!94892) b!896723))

(assert (= (and b!896720 (not c!94892)) b!896721))

(assert (= (and b!896721 c!94890) b!896718))

(assert (= (and b!896721 (not c!94890)) b!896722))

(declare-fun m!834529 () Bool)

(assert (=> b!896720 m!834529))

(declare-fun m!834531 () Bool)

(assert (=> d!111137 m!834531))

(declare-fun m!834533 () Bool)

(assert (=> d!111137 m!834533))

(assert (=> d!111137 m!834533))

(declare-fun m!834535 () Bool)

(assert (=> d!111137 m!834535))

(assert (=> d!111137 m!834489))

(declare-fun m!834537 () Bool)

(assert (=> b!896722 m!834537))

(assert (=> b!896638 d!111137))

(declare-fun d!111139 () Bool)

(declare-fun res!606236 () Bool)

(declare-fun e!501167 () Bool)

(assert (=> d!111139 (=> res!606236 e!501167)))

(assert (=> d!111139 (= res!606236 (bvsge #b00000000000000000000000000000000 (size!25709 (_keys!10109 thiss!1181))))))

(assert (=> d!111139 (= (arrayNoDuplicates!0 (_keys!10109 thiss!1181) #b00000000000000000000000000000000 Nil!17764) e!501167)))

(declare-fun b!896734 () Bool)

(declare-fun e!501166 () Bool)

(declare-fun call!39811 () Bool)

(assert (=> b!896734 (= e!501166 call!39811)))

(declare-fun b!896735 () Bool)

(declare-fun e!501165 () Bool)

(assert (=> b!896735 (= e!501167 e!501165)))

(declare-fun res!606237 () Bool)

(assert (=> b!896735 (=> (not res!606237) (not e!501165))))

(declare-fun e!501164 () Bool)

(assert (=> b!896735 (= res!606237 (not e!501164))))

(declare-fun res!606238 () Bool)

(assert (=> b!896735 (=> (not res!606238) (not e!501164))))

(assert (=> b!896735 (= res!606238 (validKeyInArray!0 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896736 () Bool)

(assert (=> b!896736 (= e!501165 e!501166)))

(declare-fun c!94895 () Bool)

(assert (=> b!896736 (= c!94895 (validKeyInArray!0 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896737 () Bool)

(declare-fun contains!4370 (List!17767 (_ BitVec 64)) Bool)

(assert (=> b!896737 (= e!501164 (contains!4370 Nil!17764 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896738 () Bool)

(assert (=> b!896738 (= e!501166 call!39811)))

(declare-fun bm!39808 () Bool)

(assert (=> bm!39808 (= call!39811 (arrayNoDuplicates!0 (_keys!10109 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94895 (Cons!17763 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000) Nil!17764) Nil!17764)))))

(assert (= (and d!111139 (not res!606236)) b!896735))

(assert (= (and b!896735 res!606238) b!896737))

(assert (= (and b!896735 res!606237) b!896736))

(assert (= (and b!896736 c!94895) b!896738))

(assert (= (and b!896736 (not c!94895)) b!896734))

(assert (= (or b!896738 b!896734) bm!39808))

(declare-fun m!834539 () Bool)

(assert (=> b!896735 m!834539))

(assert (=> b!896735 m!834539))

(declare-fun m!834541 () Bool)

(assert (=> b!896735 m!834541))

(assert (=> b!896736 m!834539))

(assert (=> b!896736 m!834539))

(assert (=> b!896736 m!834541))

(assert (=> b!896737 m!834539))

(assert (=> b!896737 m!834539))

(declare-fun m!834543 () Bool)

(assert (=> b!896737 m!834543))

(assert (=> bm!39808 m!834539))

(declare-fun m!834545 () Bool)

(assert (=> bm!39808 m!834545))

(assert (=> b!896643 d!111139))

(declare-fun d!111141 () Bool)

(assert (=> d!111141 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!896636 d!111141))

(declare-fun d!111143 () Bool)

(assert (=> d!111143 (= (array_inv!19876 (_keys!10109 thiss!1181)) (bvsge (size!25709 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896640 d!111143))

(declare-fun d!111145 () Bool)

(assert (=> d!111145 (= (array_inv!19877 (_values!5349 thiss!1181)) (bvsge (size!25710 (_values!5349 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896640 d!111145))

(declare-fun b!896747 () Bool)

(declare-fun e!501176 () Bool)

(declare-fun e!501174 () Bool)

(assert (=> b!896747 (= e!501176 e!501174)))

(declare-fun c!94898 () Bool)

(assert (=> b!896747 (= c!94898 (validKeyInArray!0 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39811 () Bool)

(declare-fun call!39814 () Bool)

(assert (=> bm!39811 (= call!39814 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(declare-fun b!896748 () Bool)

(declare-fun e!501175 () Bool)

(assert (=> b!896748 (= e!501175 call!39814)))

(declare-fun d!111147 () Bool)

(declare-fun res!606243 () Bool)

(assert (=> d!111147 (=> res!606243 e!501176)))

(assert (=> d!111147 (= res!606243 (bvsge #b00000000000000000000000000000000 (size!25709 (_keys!10109 thiss!1181))))))

(assert (=> d!111147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)) e!501176)))

(declare-fun b!896749 () Bool)

(assert (=> b!896749 (= e!501174 call!39814)))

(declare-fun b!896750 () Bool)

(assert (=> b!896750 (= e!501174 e!501175)))

(declare-fun lt!404979 () (_ BitVec 64))

(assert (=> b!896750 (= lt!404979 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30452 0))(
  ( (Unit!30453) )
))
(declare-fun lt!404980 () Unit!30452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52539 (_ BitVec 64) (_ BitVec 32)) Unit!30452)

(assert (=> b!896750 (= lt!404980 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10109 thiss!1181) lt!404979 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896750 (arrayContainsKey!0 (_keys!10109 thiss!1181) lt!404979 #b00000000000000000000000000000000)))

(declare-fun lt!404981 () Unit!30452)

(assert (=> b!896750 (= lt!404981 lt!404980)))

(declare-fun res!606244 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52539 (_ BitVec 32)) SeekEntryResult!8837)

(assert (=> b!896750 (= res!606244 (= (seekEntryOrOpen!0 (select (arr!25258 (_keys!10109 thiss!1181)) #b00000000000000000000000000000000) (_keys!10109 thiss!1181) (mask!26014 thiss!1181)) (Found!8837 #b00000000000000000000000000000000)))))

(assert (=> b!896750 (=> (not res!606244) (not e!501175))))

(assert (= (and d!111147 (not res!606243)) b!896747))

(assert (= (and b!896747 c!94898) b!896750))

(assert (= (and b!896747 (not c!94898)) b!896749))

(assert (= (and b!896750 res!606244) b!896748))

(assert (= (or b!896748 b!896749) bm!39811))

(assert (=> b!896747 m!834539))

(assert (=> b!896747 m!834539))

(assert (=> b!896747 m!834541))

(declare-fun m!834547 () Bool)

(assert (=> bm!39811 m!834547))

(assert (=> b!896750 m!834539))

(declare-fun m!834549 () Bool)

(assert (=> b!896750 m!834549))

(declare-fun m!834551 () Bool)

(assert (=> b!896750 m!834551))

(assert (=> b!896750 m!834539))

(declare-fun m!834553 () Bool)

(assert (=> b!896750 m!834553))

(assert (=> b!896644 d!111147))

(declare-fun d!111149 () Bool)

(declare-fun res!606251 () Bool)

(declare-fun e!501179 () Bool)

(assert (=> d!111149 (=> (not res!606251) (not e!501179))))

(declare-fun simpleValid!308 (LongMapFixedSize!4300) Bool)

(assert (=> d!111149 (= res!606251 (simpleValid!308 thiss!1181))))

(assert (=> d!111149 (= (valid!1671 thiss!1181) e!501179)))

(declare-fun b!896757 () Bool)

(declare-fun res!606252 () Bool)

(assert (=> b!896757 (=> (not res!606252) (not e!501179))))

(declare-fun arrayCountValidKeys!0 (array!52539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896757 (= res!606252 (= (arrayCountValidKeys!0 (_keys!10109 thiss!1181) #b00000000000000000000000000000000 (size!25709 (_keys!10109 thiss!1181))) (_size!2205 thiss!1181)))))

(declare-fun b!896758 () Bool)

(declare-fun res!606253 () Bool)

(assert (=> b!896758 (=> (not res!606253) (not e!501179))))

(assert (=> b!896758 (= res!606253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10109 thiss!1181) (mask!26014 thiss!1181)))))

(declare-fun b!896759 () Bool)

(assert (=> b!896759 (= e!501179 (arrayNoDuplicates!0 (_keys!10109 thiss!1181) #b00000000000000000000000000000000 Nil!17764))))

(assert (= (and d!111149 res!606251) b!896757))

(assert (= (and b!896757 res!606252) b!896758))

(assert (= (and b!896758 res!606253) b!896759))

(declare-fun m!834555 () Bool)

(assert (=> d!111149 m!834555))

(declare-fun m!834557 () Bool)

(assert (=> b!896757 m!834557))

(assert (=> b!896758 m!834487))

(assert (=> b!896759 m!834475))

(assert (=> start!76500 d!111149))

(declare-fun mapIsEmpty!28981 () Bool)

(declare-fun mapRes!28981 () Bool)

(assert (=> mapIsEmpty!28981 mapRes!28981))

(declare-fun condMapEmpty!28981 () Bool)

(declare-fun mapDefault!28981 () ValueCell!8642)

(assert (=> mapNonEmpty!28972 (= condMapEmpty!28981 (= mapRest!28972 ((as const (Array (_ BitVec 32) ValueCell!8642)) mapDefault!28981)))))

(declare-fun e!501185 () Bool)

(assert (=> mapNonEmpty!28972 (= tp!55774 (and e!501185 mapRes!28981))))

(declare-fun mapNonEmpty!28981 () Bool)

(declare-fun tp!55789 () Bool)

(declare-fun e!501184 () Bool)

(assert (=> mapNonEmpty!28981 (= mapRes!28981 (and tp!55789 e!501184))))

(declare-fun mapKey!28981 () (_ BitVec 32))

(declare-fun mapValue!28981 () ValueCell!8642)

(declare-fun mapRest!28981 () (Array (_ BitVec 32) ValueCell!8642))

(assert (=> mapNonEmpty!28981 (= mapRest!28972 (store mapRest!28981 mapKey!28981 mapValue!28981))))

(declare-fun b!896767 () Bool)

(assert (=> b!896767 (= e!501185 tp_is_empty!18247)))

(declare-fun b!896766 () Bool)

(assert (=> b!896766 (= e!501184 tp_is_empty!18247)))

(assert (= (and mapNonEmpty!28972 condMapEmpty!28981) mapIsEmpty!28981))

(assert (= (and mapNonEmpty!28972 (not condMapEmpty!28981)) mapNonEmpty!28981))

(assert (= (and mapNonEmpty!28981 ((_ is ValueCellFull!8642) mapValue!28981)) b!896766))

(assert (= (and mapNonEmpty!28972 ((_ is ValueCellFull!8642) mapDefault!28981)) b!896767))

(declare-fun m!834559 () Bool)

(assert (=> mapNonEmpty!28981 m!834559))

(check-sat (not b!896758) (not d!111137) tp_is_empty!18247 (not b_next!15919) (not b!896735) b_and!26221 (not bm!39808) (not b!896722) (not b!896747) (not b!896737) (not b!896759) (not b!896757) (not d!111149) (not bm!39811) (not b!896750) (not b!896736) (not mapNonEmpty!28981))
(check-sat b_and!26221 (not b_next!15919))
