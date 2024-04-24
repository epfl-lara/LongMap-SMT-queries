; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76432 () Bool)

(assert start!76432)

(declare-fun b!896178 () Bool)

(declare-fun b_free!15901 () Bool)

(declare-fun b_next!15901 () Bool)

(assert (=> b!896178 (= b_free!15901 (not b_next!15901))))

(declare-fun tp!55710 () Bool)

(declare-fun b_and!26203 () Bool)

(assert (=> b!896178 (= tp!55710 b_and!26203)))

(declare-fun b!896172 () Bool)

(declare-fun e!500769 () Bool)

(declare-fun tp_is_empty!18229 () Bool)

(assert (=> b!896172 (= e!500769 tp_is_empty!18229)))

(declare-fun b!896173 () Bool)

(declare-fun res!605991 () Bool)

(declare-fun e!500774 () Bool)

(assert (=> b!896173 (=> (not res!605991) (not e!500774))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896173 (= res!605991 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896174 () Bool)

(declare-fun e!500770 () Bool)

(assert (=> b!896174 (= e!500774 e!500770)))

(declare-fun res!605989 () Bool)

(assert (=> b!896174 (=> (not res!605989) (not e!500770))))

(declare-datatypes ((array!52497 0))(
  ( (array!52498 (arr!25240 (Array (_ BitVec 32) (_ BitVec 64))) (size!25690 (_ BitVec 32))) )
))
(declare-datatypes ((V!29271 0))(
  ( (V!29272 (val!9165 Int)) )
))
(declare-datatypes ((ValueCell!8633 0))(
  ( (ValueCellFull!8633 (v!11652 V!29271)) (EmptyCell!8633) )
))
(declare-datatypes ((array!52499 0))(
  ( (array!52500 (arr!25241 (Array (_ BitVec 32) ValueCell!8633)) (size!25691 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4282 0))(
  ( (LongMapFixedSize!4283 (defaultEntry!5353 Int) (mask!25987 (_ BitVec 32)) (extraKeys!5049 (_ BitVec 32)) (zeroValue!5153 V!29271) (minValue!5153 V!29271) (_size!2196 (_ BitVec 32)) (_keys!10092 array!52497) (_values!5340 array!52499) (_vacant!2196 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4282)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896174 (= res!605989 (validMask!0 (mask!25987 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8830 0))(
  ( (MissingZero!8830 (index!37691 (_ BitVec 32))) (Found!8830 (index!37692 (_ BitVec 32))) (Intermediate!8830 (undefined!9642 Bool) (index!37693 (_ BitVec 32)) (x!76131 (_ BitVec 32))) (Undefined!8830) (MissingVacant!8830 (index!37694 (_ BitVec 32))) )
))
(declare-fun lt!404843 () SeekEntryResult!8830)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8830)

(assert (=> b!896174 (= lt!404843 (seekEntry!0 key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun mapNonEmpty!28935 () Bool)

(declare-fun mapRes!28935 () Bool)

(declare-fun tp!55709 () Bool)

(assert (=> mapNonEmpty!28935 (= mapRes!28935 (and tp!55709 e!500769))))

(declare-fun mapValue!28935 () ValueCell!8633)

(declare-fun mapKey!28935 () (_ BitVec 32))

(declare-fun mapRest!28935 () (Array (_ BitVec 32) ValueCell!8633))

(assert (=> mapNonEmpty!28935 (= (arr!25241 (_values!5340 thiss!1181)) (store mapRest!28935 mapKey!28935 mapValue!28935))))

(declare-fun b!896175 () Bool)

(declare-fun e!500771 () Bool)

(declare-fun e!500772 () Bool)

(assert (=> b!896175 (= e!500771 (and e!500772 mapRes!28935))))

(declare-fun condMapEmpty!28935 () Bool)

(declare-fun mapDefault!28935 () ValueCell!8633)

(assert (=> b!896175 (= condMapEmpty!28935 (= (arr!25241 (_values!5340 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28935)))))

(declare-fun b!896176 () Bool)

(assert (=> b!896176 (= e!500772 tp_is_empty!18229)))

(declare-fun res!605990 () Bool)

(assert (=> start!76432 (=> (not res!605990) (not e!500774))))

(declare-fun valid!1664 (LongMapFixedSize!4282) Bool)

(assert (=> start!76432 (= res!605990 (valid!1664 thiss!1181))))

(assert (=> start!76432 e!500774))

(declare-fun e!500773 () Bool)

(assert (=> start!76432 e!500773))

(assert (=> start!76432 true))

(declare-fun b!896177 () Bool)

(assert (=> b!896177 (= e!500770 (and (= (size!25691 (_values!5340 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25987 thiss!1181))) (= (size!25690 (_keys!10092 thiss!1181)) (size!25691 (_values!5340 thiss!1181))) (bvsge (mask!25987 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5049 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5049 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28935 () Bool)

(assert (=> mapIsEmpty!28935 mapRes!28935))

(declare-fun array_inv!19864 (array!52497) Bool)

(declare-fun array_inv!19865 (array!52499) Bool)

(assert (=> b!896178 (= e!500773 (and tp!55710 tp_is_empty!18229 (array_inv!19864 (_keys!10092 thiss!1181)) (array_inv!19865 (_values!5340 thiss!1181)) e!500771))))

(assert (= (and start!76432 res!605990) b!896173))

(assert (= (and b!896173 res!605991) b!896174))

(assert (= (and b!896174 res!605989) b!896177))

(assert (= (and b!896175 condMapEmpty!28935) mapIsEmpty!28935))

(assert (= (and b!896175 (not condMapEmpty!28935)) mapNonEmpty!28935))

(get-info :version)

(assert (= (and mapNonEmpty!28935 ((_ is ValueCellFull!8633) mapValue!28935)) b!896172))

(assert (= (and b!896175 ((_ is ValueCellFull!8633) mapDefault!28935)) b!896176))

(assert (= b!896178 b!896175))

(assert (= start!76432 b!896178))

(declare-fun m!834229 () Bool)

(assert (=> b!896174 m!834229))

(declare-fun m!834231 () Bool)

(assert (=> b!896174 m!834231))

(declare-fun m!834233 () Bool)

(assert (=> mapNonEmpty!28935 m!834233))

(declare-fun m!834235 () Bool)

(assert (=> start!76432 m!834235))

(declare-fun m!834237 () Bool)

(assert (=> b!896178 m!834237))

(declare-fun m!834239 () Bool)

(assert (=> b!896178 m!834239))

(check-sat b_and!26203 (not start!76432) (not b!896178) (not b_next!15901) (not b!896174) tp_is_empty!18229 (not mapNonEmpty!28935))
(check-sat b_and!26203 (not b_next!15901))
(get-model)

(declare-fun d!111079 () Bool)

(assert (=> d!111079 (= (validMask!0 (mask!25987 thiss!1181)) (and (or (= (mask!25987 thiss!1181) #b00000000000000000000000000000111) (= (mask!25987 thiss!1181) #b00000000000000000000000000001111) (= (mask!25987 thiss!1181) #b00000000000000000000000000011111) (= (mask!25987 thiss!1181) #b00000000000000000000000000111111) (= (mask!25987 thiss!1181) #b00000000000000000000000001111111) (= (mask!25987 thiss!1181) #b00000000000000000000000011111111) (= (mask!25987 thiss!1181) #b00000000000000000000000111111111) (= (mask!25987 thiss!1181) #b00000000000000000000001111111111) (= (mask!25987 thiss!1181) #b00000000000000000000011111111111) (= (mask!25987 thiss!1181) #b00000000000000000000111111111111) (= (mask!25987 thiss!1181) #b00000000000000000001111111111111) (= (mask!25987 thiss!1181) #b00000000000000000011111111111111) (= (mask!25987 thiss!1181) #b00000000000000000111111111111111) (= (mask!25987 thiss!1181) #b00000000000000001111111111111111) (= (mask!25987 thiss!1181) #b00000000000000011111111111111111) (= (mask!25987 thiss!1181) #b00000000000000111111111111111111) (= (mask!25987 thiss!1181) #b00000000000001111111111111111111) (= (mask!25987 thiss!1181) #b00000000000011111111111111111111) (= (mask!25987 thiss!1181) #b00000000000111111111111111111111) (= (mask!25987 thiss!1181) #b00000000001111111111111111111111) (= (mask!25987 thiss!1181) #b00000000011111111111111111111111) (= (mask!25987 thiss!1181) #b00000000111111111111111111111111) (= (mask!25987 thiss!1181) #b00000001111111111111111111111111) (= (mask!25987 thiss!1181) #b00000011111111111111111111111111) (= (mask!25987 thiss!1181) #b00000111111111111111111111111111) (= (mask!25987 thiss!1181) #b00001111111111111111111111111111) (= (mask!25987 thiss!1181) #b00011111111111111111111111111111) (= (mask!25987 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25987 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896174 d!111079))

(declare-fun b!896233 () Bool)

(declare-fun e!500826 () SeekEntryResult!8830)

(assert (=> b!896233 (= e!500826 Undefined!8830)))

(declare-fun d!111081 () Bool)

(declare-fun lt!404860 () SeekEntryResult!8830)

(assert (=> d!111081 (and (or ((_ is MissingVacant!8830) lt!404860) (not ((_ is Found!8830) lt!404860)) (and (bvsge (index!37692 lt!404860) #b00000000000000000000000000000000) (bvslt (index!37692 lt!404860) (size!25690 (_keys!10092 thiss!1181))))) (not ((_ is MissingVacant!8830) lt!404860)) (or (not ((_ is Found!8830) lt!404860)) (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37692 lt!404860)) key!785)))))

(assert (=> d!111081 (= lt!404860 e!500826)))

(declare-fun c!94824 () Bool)

(declare-fun lt!404859 () SeekEntryResult!8830)

(assert (=> d!111081 (= c!94824 (and ((_ is Intermediate!8830) lt!404859) (undefined!9642 lt!404859)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8830)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111081 (= lt!404859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25987 thiss!1181)) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(assert (=> d!111081 (validMask!0 (mask!25987 thiss!1181))))

(assert (=> d!111081 (= (seekEntry!0 key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)) lt!404860)))

(declare-fun b!896234 () Bool)

(declare-fun c!94825 () Bool)

(declare-fun lt!404861 () (_ BitVec 64))

(assert (=> b!896234 (= c!94825 (= lt!404861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500824 () SeekEntryResult!8830)

(declare-fun e!500825 () SeekEntryResult!8830)

(assert (=> b!896234 (= e!500824 e!500825)))

(declare-fun b!896235 () Bool)

(declare-fun lt!404858 () SeekEntryResult!8830)

(assert (=> b!896235 (= e!500825 (ite ((_ is MissingVacant!8830) lt!404858) (MissingZero!8830 (index!37694 lt!404858)) lt!404858))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8830)

(assert (=> b!896235 (= lt!404858 (seekKeyOrZeroReturnVacant!0 (x!76131 lt!404859) (index!37693 lt!404859) (index!37693 lt!404859) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun b!896236 () Bool)

(assert (=> b!896236 (= e!500825 (MissingZero!8830 (index!37693 lt!404859)))))

(declare-fun b!896237 () Bool)

(assert (=> b!896237 (= e!500826 e!500824)))

(assert (=> b!896237 (= lt!404861 (select (arr!25240 (_keys!10092 thiss!1181)) (index!37693 lt!404859)))))

(declare-fun c!94826 () Bool)

(assert (=> b!896237 (= c!94826 (= lt!404861 key!785))))

(declare-fun b!896238 () Bool)

(assert (=> b!896238 (= e!500824 (Found!8830 (index!37693 lt!404859)))))

(assert (= (and d!111081 c!94824) b!896233))

(assert (= (and d!111081 (not c!94824)) b!896237))

(assert (= (and b!896237 c!94826) b!896238))

(assert (= (and b!896237 (not c!94826)) b!896234))

(assert (= (and b!896234 c!94825) b!896236))

(assert (= (and b!896234 (not c!94825)) b!896235))

(declare-fun m!834265 () Bool)

(assert (=> d!111081 m!834265))

(declare-fun m!834267 () Bool)

(assert (=> d!111081 m!834267))

(assert (=> d!111081 m!834267))

(declare-fun m!834269 () Bool)

(assert (=> d!111081 m!834269))

(assert (=> d!111081 m!834229))

(declare-fun m!834271 () Bool)

(assert (=> b!896235 m!834271))

(declare-fun m!834273 () Bool)

(assert (=> b!896237 m!834273))

(assert (=> b!896174 d!111081))

(declare-fun d!111083 () Bool)

(declare-fun res!606016 () Bool)

(declare-fun e!500829 () Bool)

(assert (=> d!111083 (=> (not res!606016) (not e!500829))))

(declare-fun simpleValid!305 (LongMapFixedSize!4282) Bool)

(assert (=> d!111083 (= res!606016 (simpleValid!305 thiss!1181))))

(assert (=> d!111083 (= (valid!1664 thiss!1181) e!500829)))

(declare-fun b!896245 () Bool)

(declare-fun res!606017 () Bool)

(assert (=> b!896245 (=> (not res!606017) (not e!500829))))

(declare-fun arrayCountValidKeys!0 (array!52497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896245 (= res!606017 (= (arrayCountValidKeys!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))) (_size!2196 thiss!1181)))))

(declare-fun b!896246 () Bool)

(declare-fun res!606018 () Bool)

(assert (=> b!896246 (=> (not res!606018) (not e!500829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52497 (_ BitVec 32)) Bool)

(assert (=> b!896246 (= res!606018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun b!896247 () Bool)

(declare-datatypes ((List!17764 0))(
  ( (Nil!17761) (Cons!17760 (h!18902 (_ BitVec 64)) (t!25095 List!17764)) )
))
(declare-fun arrayNoDuplicates!0 (array!52497 (_ BitVec 32) List!17764) Bool)

(assert (=> b!896247 (= e!500829 (arrayNoDuplicates!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 Nil!17761))))

(assert (= (and d!111083 res!606016) b!896245))

(assert (= (and b!896245 res!606017) b!896246))

(assert (= (and b!896246 res!606018) b!896247))

(declare-fun m!834275 () Bool)

(assert (=> d!111083 m!834275))

(declare-fun m!834277 () Bool)

(assert (=> b!896245 m!834277))

(declare-fun m!834279 () Bool)

(assert (=> b!896246 m!834279))

(declare-fun m!834281 () Bool)

(assert (=> b!896247 m!834281))

(assert (=> start!76432 d!111083))

(declare-fun d!111085 () Bool)

(assert (=> d!111085 (= (array_inv!19864 (_keys!10092 thiss!1181)) (bvsge (size!25690 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896178 d!111085))

(declare-fun d!111087 () Bool)

(assert (=> d!111087 (= (array_inv!19865 (_values!5340 thiss!1181)) (bvsge (size!25691 (_values!5340 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896178 d!111087))

(declare-fun b!896254 () Bool)

(declare-fun e!500835 () Bool)

(assert (=> b!896254 (= e!500835 tp_is_empty!18229)))

(declare-fun condMapEmpty!28944 () Bool)

(declare-fun mapDefault!28944 () ValueCell!8633)

(assert (=> mapNonEmpty!28935 (= condMapEmpty!28944 (= mapRest!28935 ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28944)))))

(declare-fun e!500834 () Bool)

(declare-fun mapRes!28944 () Bool)

(assert (=> mapNonEmpty!28935 (= tp!55709 (and e!500834 mapRes!28944))))

(declare-fun b!896255 () Bool)

(assert (=> b!896255 (= e!500834 tp_is_empty!18229)))

(declare-fun mapNonEmpty!28944 () Bool)

(declare-fun tp!55725 () Bool)

(assert (=> mapNonEmpty!28944 (= mapRes!28944 (and tp!55725 e!500835))))

(declare-fun mapKey!28944 () (_ BitVec 32))

(declare-fun mapValue!28944 () ValueCell!8633)

(declare-fun mapRest!28944 () (Array (_ BitVec 32) ValueCell!8633))

(assert (=> mapNonEmpty!28944 (= mapRest!28935 (store mapRest!28944 mapKey!28944 mapValue!28944))))

(declare-fun mapIsEmpty!28944 () Bool)

(assert (=> mapIsEmpty!28944 mapRes!28944))

(assert (= (and mapNonEmpty!28935 condMapEmpty!28944) mapIsEmpty!28944))

(assert (= (and mapNonEmpty!28935 (not condMapEmpty!28944)) mapNonEmpty!28944))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8633) mapValue!28944)) b!896254))

(assert (= (and mapNonEmpty!28935 ((_ is ValueCellFull!8633) mapDefault!28944)) b!896255))

(declare-fun m!834283 () Bool)

(assert (=> mapNonEmpty!28944 m!834283))

(check-sat (not b!896247) (not b!896235) (not d!111081) tp_is_empty!18229 (not mapNonEmpty!28944) (not b!896245) (not b!896246) b_and!26203 (not b_next!15901) (not d!111083))
(check-sat b_and!26203 (not b_next!15901))
(get-model)

(declare-fun b!896264 () Bool)

(declare-fun e!500843 () Bool)

(declare-fun call!39793 () Bool)

(assert (=> b!896264 (= e!500843 call!39793)))

(declare-fun bm!39790 () Bool)

(assert (=> bm!39790 (= call!39793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun b!896265 () Bool)

(declare-fun e!500844 () Bool)

(assert (=> b!896265 (= e!500843 e!500844)))

(declare-fun lt!404870 () (_ BitVec 64))

(assert (=> b!896265 (= lt!404870 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30446 0))(
  ( (Unit!30447) )
))
(declare-fun lt!404869 () Unit!30446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52497 (_ BitVec 64) (_ BitVec 32)) Unit!30446)

(assert (=> b!896265 (= lt!404869 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10092 thiss!1181) lt!404870 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896265 (arrayContainsKey!0 (_keys!10092 thiss!1181) lt!404870 #b00000000000000000000000000000000)))

(declare-fun lt!404868 () Unit!30446)

(assert (=> b!896265 (= lt!404868 lt!404869)))

(declare-fun res!606024 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8830)

(assert (=> b!896265 (= res!606024 (= (seekEntryOrOpen!0 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000) (_keys!10092 thiss!1181) (mask!25987 thiss!1181)) (Found!8830 #b00000000000000000000000000000000)))))

(assert (=> b!896265 (=> (not res!606024) (not e!500844))))

(declare-fun b!896266 () Bool)

(declare-fun e!500842 () Bool)

(assert (=> b!896266 (= e!500842 e!500843)))

(declare-fun c!94829 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896266 (= c!94829 (validKeyInArray!0 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896267 () Bool)

(assert (=> b!896267 (= e!500844 call!39793)))

(declare-fun d!111089 () Bool)

(declare-fun res!606023 () Bool)

(assert (=> d!111089 (=> res!606023 e!500842)))

(assert (=> d!111089 (= res!606023 (bvsge #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))))))

(assert (=> d!111089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)) e!500842)))

(assert (= (and d!111089 (not res!606023)) b!896266))

(assert (= (and b!896266 c!94829) b!896265))

(assert (= (and b!896266 (not c!94829)) b!896264))

(assert (= (and b!896265 res!606024) b!896267))

(assert (= (or b!896267 b!896264) bm!39790))

(declare-fun m!834285 () Bool)

(assert (=> bm!39790 m!834285))

(declare-fun m!834287 () Bool)

(assert (=> b!896265 m!834287))

(declare-fun m!834289 () Bool)

(assert (=> b!896265 m!834289))

(declare-fun m!834291 () Bool)

(assert (=> b!896265 m!834291))

(assert (=> b!896265 m!834287))

(declare-fun m!834293 () Bool)

(assert (=> b!896265 m!834293))

(assert (=> b!896266 m!834287))

(assert (=> b!896266 m!834287))

(declare-fun m!834295 () Bool)

(assert (=> b!896266 m!834295))

(assert (=> b!896246 d!111089))

(declare-fun bm!39793 () Bool)

(declare-fun call!39796 () Bool)

(declare-fun c!94832 () Bool)

(assert (=> bm!39793 (= call!39796 (arrayNoDuplicates!0 (_keys!10092 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94832 (Cons!17760 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000) Nil!17761) Nil!17761)))))

(declare-fun b!896278 () Bool)

(declare-fun e!500853 () Bool)

(assert (=> b!896278 (= e!500853 call!39796)))

(declare-fun b!896279 () Bool)

(declare-fun e!500855 () Bool)

(declare-fun contains!4368 (List!17764 (_ BitVec 64)) Bool)

(assert (=> b!896279 (= e!500855 (contains!4368 Nil!17761 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896280 () Bool)

(declare-fun e!500856 () Bool)

(declare-fun e!500854 () Bool)

(assert (=> b!896280 (= e!500856 e!500854)))

(declare-fun res!606033 () Bool)

(assert (=> b!896280 (=> (not res!606033) (not e!500854))))

(assert (=> b!896280 (= res!606033 (not e!500855))))

(declare-fun res!606032 () Bool)

(assert (=> b!896280 (=> (not res!606032) (not e!500855))))

(assert (=> b!896280 (= res!606032 (validKeyInArray!0 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896281 () Bool)

(assert (=> b!896281 (= e!500853 call!39796)))

(declare-fun b!896282 () Bool)

(assert (=> b!896282 (= e!500854 e!500853)))

(assert (=> b!896282 (= c!94832 (validKeyInArray!0 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111091 () Bool)

(declare-fun res!606031 () Bool)

(assert (=> d!111091 (=> res!606031 e!500856)))

(assert (=> d!111091 (= res!606031 (bvsge #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))))))

(assert (=> d!111091 (= (arrayNoDuplicates!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 Nil!17761) e!500856)))

(assert (= (and d!111091 (not res!606031)) b!896280))

(assert (= (and b!896280 res!606032) b!896279))

(assert (= (and b!896280 res!606033) b!896282))

(assert (= (and b!896282 c!94832) b!896281))

(assert (= (and b!896282 (not c!94832)) b!896278))

(assert (= (or b!896281 b!896278) bm!39793))

(assert (=> bm!39793 m!834287))

(declare-fun m!834297 () Bool)

(assert (=> bm!39793 m!834297))

(assert (=> b!896279 m!834287))

(assert (=> b!896279 m!834287))

(declare-fun m!834299 () Bool)

(assert (=> b!896279 m!834299))

(assert (=> b!896280 m!834287))

(assert (=> b!896280 m!834287))

(assert (=> b!896280 m!834295))

(assert (=> b!896282 m!834287))

(assert (=> b!896282 m!834287))

(assert (=> b!896282 m!834295))

(assert (=> b!896247 d!111091))

(declare-fun b!896302 () Bool)

(declare-fun lt!404875 () SeekEntryResult!8830)

(assert (=> b!896302 (and (bvsge (index!37693 lt!404875) #b00000000000000000000000000000000) (bvslt (index!37693 lt!404875) (size!25690 (_keys!10092 thiss!1181))))))

(declare-fun res!606041 () Bool)

(assert (=> b!896302 (= res!606041 (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37693 lt!404875)) key!785))))

(declare-fun e!500871 () Bool)

(assert (=> b!896302 (=> res!606041 e!500871)))

(declare-fun e!500869 () Bool)

(assert (=> b!896302 (= e!500869 e!500871)))

(declare-fun b!896303 () Bool)

(assert (=> b!896303 (and (bvsge (index!37693 lt!404875) #b00000000000000000000000000000000) (bvslt (index!37693 lt!404875) (size!25690 (_keys!10092 thiss!1181))))))

(assert (=> b!896303 (= e!500871 (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37693 lt!404875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896304 () Bool)

(declare-fun e!500867 () SeekEntryResult!8830)

(declare-fun e!500870 () SeekEntryResult!8830)

(assert (=> b!896304 (= e!500867 e!500870)))

(declare-fun c!94840 () Bool)

(declare-fun lt!404876 () (_ BitVec 64))

(assert (=> b!896304 (= c!94840 (or (= lt!404876 key!785) (= (bvadd lt!404876 lt!404876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!896305 () Bool)

(assert (=> b!896305 (and (bvsge (index!37693 lt!404875) #b00000000000000000000000000000000) (bvslt (index!37693 lt!404875) (size!25690 (_keys!10092 thiss!1181))))))

(declare-fun res!606042 () Bool)

(assert (=> b!896305 (= res!606042 (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37693 lt!404875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896305 (=> res!606042 e!500871)))

(declare-fun d!111093 () Bool)

(declare-fun e!500868 () Bool)

(assert (=> d!111093 e!500868))

(declare-fun c!94839 () Bool)

(assert (=> d!111093 (= c!94839 (and ((_ is Intermediate!8830) lt!404875) (undefined!9642 lt!404875)))))

(assert (=> d!111093 (= lt!404875 e!500867)))

(declare-fun c!94841 () Bool)

(assert (=> d!111093 (= c!94841 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111093 (= lt!404876 (select (arr!25240 (_keys!10092 thiss!1181)) (toIndex!0 key!785 (mask!25987 thiss!1181))))))

(assert (=> d!111093 (validMask!0 (mask!25987 thiss!1181))))

(assert (=> d!111093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25987 thiss!1181)) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)) lt!404875)))

(declare-fun b!896301 () Bool)

(assert (=> b!896301 (= e!500867 (Intermediate!8830 true (toIndex!0 key!785 (mask!25987 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896306 () Bool)

(assert (=> b!896306 (= e!500868 e!500869)))

(declare-fun res!606040 () Bool)

(assert (=> b!896306 (= res!606040 (and ((_ is Intermediate!8830) lt!404875) (not (undefined!9642 lt!404875)) (bvslt (x!76131 lt!404875) #b01111111111111111111111111111110) (bvsge (x!76131 lt!404875) #b00000000000000000000000000000000) (bvsge (x!76131 lt!404875) #b00000000000000000000000000000000)))))

(assert (=> b!896306 (=> (not res!606040) (not e!500869))))

(declare-fun b!896307 () Bool)

(assert (=> b!896307 (= e!500870 (Intermediate!8830 false (toIndex!0 key!785 (mask!25987 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896308 () Bool)

(assert (=> b!896308 (= e!500868 (bvsge (x!76131 lt!404875) #b01111111111111111111111111111110))))

(declare-fun b!896309 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896309 (= e!500870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25987 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25987 thiss!1181)) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(assert (= (and d!111093 c!94841) b!896301))

(assert (= (and d!111093 (not c!94841)) b!896304))

(assert (= (and b!896304 c!94840) b!896307))

(assert (= (and b!896304 (not c!94840)) b!896309))

(assert (= (and d!111093 c!94839) b!896308))

(assert (= (and d!111093 (not c!94839)) b!896306))

(assert (= (and b!896306 res!606040) b!896302))

(assert (= (and b!896302 (not res!606041)) b!896305))

(assert (= (and b!896305 (not res!606042)) b!896303))

(declare-fun m!834301 () Bool)

(assert (=> b!896305 m!834301))

(assert (=> b!896309 m!834267))

(declare-fun m!834303 () Bool)

(assert (=> b!896309 m!834303))

(assert (=> b!896309 m!834303))

(declare-fun m!834305 () Bool)

(assert (=> b!896309 m!834305))

(assert (=> b!896303 m!834301))

(assert (=> b!896302 m!834301))

(assert (=> d!111093 m!834267))

(declare-fun m!834307 () Bool)

(assert (=> d!111093 m!834307))

(assert (=> d!111093 m!834229))

(assert (=> d!111081 d!111093))

(declare-fun d!111095 () Bool)

(declare-fun lt!404882 () (_ BitVec 32))

(declare-fun lt!404881 () (_ BitVec 32))

(assert (=> d!111095 (= lt!404882 (bvmul (bvxor lt!404881 (bvlshr lt!404881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111095 (= lt!404881 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111095 (and (bvsge (mask!25987 thiss!1181) #b00000000000000000000000000000000) (let ((res!606043 (let ((h!18903 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76149 (bvmul (bvxor h!18903 (bvlshr h!18903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76149 (bvlshr x!76149 #b00000000000000000000000000001101)) (mask!25987 thiss!1181)))))) (and (bvslt res!606043 (bvadd (mask!25987 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606043 #b00000000000000000000000000000000))))))

(assert (=> d!111095 (= (toIndex!0 key!785 (mask!25987 thiss!1181)) (bvand (bvxor lt!404882 (bvlshr lt!404882 #b00000000000000000000000000001101)) (mask!25987 thiss!1181)))))

(assert (=> d!111081 d!111095))

(assert (=> d!111081 d!111079))

(declare-fun b!896319 () Bool)

(declare-fun res!606053 () Bool)

(declare-fun e!500874 () Bool)

(assert (=> b!896319 (=> (not res!606053) (not e!500874))))

(declare-fun size!25696 (LongMapFixedSize!4282) (_ BitVec 32))

(assert (=> b!896319 (= res!606053 (bvsge (size!25696 thiss!1181) (_size!2196 thiss!1181)))))

(declare-fun b!896320 () Bool)

(declare-fun res!606052 () Bool)

(assert (=> b!896320 (=> (not res!606052) (not e!500874))))

(assert (=> b!896320 (= res!606052 (= (size!25696 thiss!1181) (bvadd (_size!2196 thiss!1181) (bvsdiv (bvadd (extraKeys!5049 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!896318 () Bool)

(declare-fun res!606055 () Bool)

(assert (=> b!896318 (=> (not res!606055) (not e!500874))))

(assert (=> b!896318 (= res!606055 (and (= (size!25691 (_values!5340 thiss!1181)) (bvadd (mask!25987 thiss!1181) #b00000000000000000000000000000001)) (= (size!25690 (_keys!10092 thiss!1181)) (size!25691 (_values!5340 thiss!1181))) (bvsge (_size!2196 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2196 thiss!1181) (bvadd (mask!25987 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111097 () Bool)

(declare-fun res!606054 () Bool)

(assert (=> d!111097 (=> (not res!606054) (not e!500874))))

(assert (=> d!111097 (= res!606054 (validMask!0 (mask!25987 thiss!1181)))))

(assert (=> d!111097 (= (simpleValid!305 thiss!1181) e!500874)))

(declare-fun b!896321 () Bool)

(assert (=> b!896321 (= e!500874 (and (bvsge (extraKeys!5049 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5049 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2196 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!111097 res!606054) b!896318))

(assert (= (and b!896318 res!606055) b!896319))

(assert (= (and b!896319 res!606053) b!896320))

(assert (= (and b!896320 res!606052) b!896321))

(declare-fun m!834309 () Bool)

(assert (=> b!896319 m!834309))

(assert (=> b!896320 m!834309))

(assert (=> d!111097 m!834229))

(assert (=> d!111083 d!111097))

(declare-fun b!896334 () Bool)

(declare-fun c!94848 () Bool)

(declare-fun lt!404887 () (_ BitVec 64))

(assert (=> b!896334 (= c!94848 (= lt!404887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500882 () SeekEntryResult!8830)

(declare-fun e!500883 () SeekEntryResult!8830)

(assert (=> b!896334 (= e!500882 e!500883)))

(declare-fun lt!404888 () SeekEntryResult!8830)

(declare-fun d!111099 () Bool)

(assert (=> d!111099 (and (or ((_ is Undefined!8830) lt!404888) (not ((_ is Found!8830) lt!404888)) (and (bvsge (index!37692 lt!404888) #b00000000000000000000000000000000) (bvslt (index!37692 lt!404888) (size!25690 (_keys!10092 thiss!1181))))) (or ((_ is Undefined!8830) lt!404888) ((_ is Found!8830) lt!404888) (not ((_ is MissingVacant!8830) lt!404888)) (not (= (index!37694 lt!404888) (index!37693 lt!404859))) (and (bvsge (index!37694 lt!404888) #b00000000000000000000000000000000) (bvslt (index!37694 lt!404888) (size!25690 (_keys!10092 thiss!1181))))) (or ((_ is Undefined!8830) lt!404888) (ite ((_ is Found!8830) lt!404888) (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37692 lt!404888)) key!785) (and ((_ is MissingVacant!8830) lt!404888) (= (index!37694 lt!404888) (index!37693 lt!404859)) (= (select (arr!25240 (_keys!10092 thiss!1181)) (index!37694 lt!404888)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!500881 () SeekEntryResult!8830)

(assert (=> d!111099 (= lt!404888 e!500881)))

(declare-fun c!94850 () Bool)

(assert (=> d!111099 (= c!94850 (bvsge (x!76131 lt!404859) #b01111111111111111111111111111110))))

(assert (=> d!111099 (= lt!404887 (select (arr!25240 (_keys!10092 thiss!1181)) (index!37693 lt!404859)))))

(assert (=> d!111099 (validMask!0 (mask!25987 thiss!1181))))

(assert (=> d!111099 (= (seekKeyOrZeroReturnVacant!0 (x!76131 lt!404859) (index!37693 lt!404859) (index!37693 lt!404859) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)) lt!404888)))

(declare-fun b!896335 () Bool)

(assert (=> b!896335 (= e!500881 Undefined!8830)))

(declare-fun b!896336 () Bool)

(assert (=> b!896336 (= e!500883 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76131 lt!404859) #b00000000000000000000000000000001) (nextIndex!0 (index!37693 lt!404859) (bvadd (x!76131 lt!404859) #b00000000000000000000000000000001) (mask!25987 thiss!1181)) (index!37693 lt!404859) key!785 (_keys!10092 thiss!1181) (mask!25987 thiss!1181)))))

(declare-fun b!896337 () Bool)

(assert (=> b!896337 (= e!500882 (Found!8830 (index!37693 lt!404859)))))

(declare-fun b!896338 () Bool)

(assert (=> b!896338 (= e!500881 e!500882)))

(declare-fun c!94849 () Bool)

(assert (=> b!896338 (= c!94849 (= lt!404887 key!785))))

(declare-fun b!896339 () Bool)

(assert (=> b!896339 (= e!500883 (MissingVacant!8830 (index!37693 lt!404859)))))

(assert (= (and d!111099 c!94850) b!896335))

(assert (= (and d!111099 (not c!94850)) b!896338))

(assert (= (and b!896338 c!94849) b!896337))

(assert (= (and b!896338 (not c!94849)) b!896334))

(assert (= (and b!896334 c!94848) b!896339))

(assert (= (and b!896334 (not c!94848)) b!896336))

(declare-fun m!834311 () Bool)

(assert (=> d!111099 m!834311))

(declare-fun m!834313 () Bool)

(assert (=> d!111099 m!834313))

(assert (=> d!111099 m!834273))

(assert (=> d!111099 m!834229))

(declare-fun m!834315 () Bool)

(assert (=> b!896336 m!834315))

(assert (=> b!896336 m!834315))

(declare-fun m!834317 () Bool)

(assert (=> b!896336 m!834317))

(assert (=> b!896235 d!111099))

(declare-fun b!896348 () Bool)

(declare-fun e!500888 () (_ BitVec 32))

(declare-fun e!500889 () (_ BitVec 32))

(assert (=> b!896348 (= e!500888 e!500889)))

(declare-fun c!94856 () Bool)

(assert (=> b!896348 (= c!94856 (validKeyInArray!0 (select (arr!25240 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39796 () Bool)

(declare-fun call!39799 () (_ BitVec 32))

(assert (=> bm!39796 (= call!39799 (arrayCountValidKeys!0 (_keys!10092 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25690 (_keys!10092 thiss!1181))))))

(declare-fun d!111101 () Bool)

(declare-fun lt!404891 () (_ BitVec 32))

(assert (=> d!111101 (and (bvsge lt!404891 #b00000000000000000000000000000000) (bvsle lt!404891 (bvsub (size!25690 (_keys!10092 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111101 (= lt!404891 e!500888)))

(declare-fun c!94855 () Bool)

(assert (=> d!111101 (= c!94855 (bvsge #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))))))

(assert (=> d!111101 (and (bvsle #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25690 (_keys!10092 thiss!1181)) (size!25690 (_keys!10092 thiss!1181))))))

(assert (=> d!111101 (= (arrayCountValidKeys!0 (_keys!10092 thiss!1181) #b00000000000000000000000000000000 (size!25690 (_keys!10092 thiss!1181))) lt!404891)))

(declare-fun b!896349 () Bool)

(assert (=> b!896349 (= e!500889 (bvadd #b00000000000000000000000000000001 call!39799))))

(declare-fun b!896350 () Bool)

(assert (=> b!896350 (= e!500889 call!39799)))

(declare-fun b!896351 () Bool)

(assert (=> b!896351 (= e!500888 #b00000000000000000000000000000000)))

(assert (= (and d!111101 c!94855) b!896351))

(assert (= (and d!111101 (not c!94855)) b!896348))

(assert (= (and b!896348 c!94856) b!896349))

(assert (= (and b!896348 (not c!94856)) b!896350))

(assert (= (or b!896349 b!896350) bm!39796))

(assert (=> b!896348 m!834287))

(assert (=> b!896348 m!834287))

(assert (=> b!896348 m!834295))

(declare-fun m!834319 () Bool)

(assert (=> bm!39796 m!834319))

(assert (=> b!896245 d!111101))

(declare-fun b!896352 () Bool)

(declare-fun e!500891 () Bool)

(assert (=> b!896352 (= e!500891 tp_is_empty!18229)))

(declare-fun condMapEmpty!28945 () Bool)

(declare-fun mapDefault!28945 () ValueCell!8633)

(assert (=> mapNonEmpty!28944 (= condMapEmpty!28945 (= mapRest!28944 ((as const (Array (_ BitVec 32) ValueCell!8633)) mapDefault!28945)))))

(declare-fun e!500890 () Bool)

(declare-fun mapRes!28945 () Bool)

(assert (=> mapNonEmpty!28944 (= tp!55725 (and e!500890 mapRes!28945))))

(declare-fun b!896353 () Bool)

(assert (=> b!896353 (= e!500890 tp_is_empty!18229)))

(declare-fun mapNonEmpty!28945 () Bool)

(declare-fun tp!55726 () Bool)

(assert (=> mapNonEmpty!28945 (= mapRes!28945 (and tp!55726 e!500891))))

(declare-fun mapKey!28945 () (_ BitVec 32))

(declare-fun mapRest!28945 () (Array (_ BitVec 32) ValueCell!8633))

(declare-fun mapValue!28945 () ValueCell!8633)

(assert (=> mapNonEmpty!28945 (= mapRest!28944 (store mapRest!28945 mapKey!28945 mapValue!28945))))

(declare-fun mapIsEmpty!28945 () Bool)

(assert (=> mapIsEmpty!28945 mapRes!28945))

(assert (= (and mapNonEmpty!28944 condMapEmpty!28945) mapIsEmpty!28945))

(assert (= (and mapNonEmpty!28944 (not condMapEmpty!28945)) mapNonEmpty!28945))

(assert (= (and mapNonEmpty!28945 ((_ is ValueCellFull!8633) mapValue!28945)) b!896352))

(assert (= (and mapNonEmpty!28944 ((_ is ValueCellFull!8633) mapDefault!28945)) b!896353))

(declare-fun m!834321 () Bool)

(assert (=> mapNonEmpty!28945 m!834321))

(check-sat (not b!896282) (not d!111097) (not b!896309) (not b!896265) (not bm!39796) (not b!896280) tp_is_empty!18229 (not mapNonEmpty!28945) (not d!111093) (not b!896336) (not bm!39790) (not b!896320) b_and!26203 (not b!896279) (not b!896348) (not b!896319) (not b!896266) (not b_next!15901) (not d!111099) (not bm!39793))
(check-sat b_and!26203 (not b_next!15901))
