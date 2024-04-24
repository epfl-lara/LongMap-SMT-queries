; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75954 () Bool)

(assert start!75954)

(declare-fun b!892278 () Bool)

(declare-fun b_free!15757 () Bool)

(declare-fun b_next!15757 () Bool)

(assert (=> b!892278 (= b_free!15757 (not b_next!15757))))

(declare-fun tp!55241 () Bool)

(declare-fun b_and!26007 () Bool)

(assert (=> b!892278 (= tp!55241 b_and!26007)))

(declare-fun b!892270 () Bool)

(declare-fun e!497966 () Bool)

(declare-datatypes ((SeekEntryResult!8780 0))(
  ( (MissingZero!8780 (index!37491 (_ BitVec 32))) (Found!8780 (index!37492 (_ BitVec 32))) (Intermediate!8780 (undefined!9592 Bool) (index!37493 (_ BitVec 32)) (x!75714 (_ BitVec 32))) (Undefined!8780) (MissingVacant!8780 (index!37494 (_ BitVec 32))) )
))
(declare-fun lt!403015 () SeekEntryResult!8780)

(declare-datatypes ((array!52189 0))(
  ( (array!52190 (arr!25096 (Array (_ BitVec 32) (_ BitVec 64))) (size!25541 (_ BitVec 32))) )
))
(declare-datatypes ((V!29079 0))(
  ( (V!29080 (val!9093 Int)) )
))
(declare-datatypes ((ValueCell!8561 0))(
  ( (ValueCellFull!8561 (v!11568 V!29079)) (EmptyCell!8561) )
))
(declare-datatypes ((array!52191 0))(
  ( (array!52192 (arr!25097 (Array (_ BitVec 32) ValueCell!8561)) (size!25542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4138 0))(
  ( (LongMapFixedSize!4139 (defaultEntry!5266 Int) (mask!25802 (_ BitVec 32)) (extraKeys!4960 (_ BitVec 32)) (zeroValue!5064 V!29079) (minValue!5064 V!29079) (_size!2124 (_ BitVec 32)) (_keys!9977 array!52189) (_values!5251 array!52191) (_vacant!2124 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4138)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892270 (= e!497966 (inRange!0 (index!37492 lt!403015) (mask!25802 thiss!1181)))))

(declare-fun mapIsEmpty!28682 () Bool)

(declare-fun mapRes!28682 () Bool)

(assert (=> mapIsEmpty!28682 mapRes!28682))

(declare-fun mapNonEmpty!28682 () Bool)

(declare-fun tp!55240 () Bool)

(declare-fun e!497965 () Bool)

(assert (=> mapNonEmpty!28682 (= mapRes!28682 (and tp!55240 e!497965))))

(declare-fun mapKey!28682 () (_ BitVec 32))

(declare-fun mapRest!28682 () (Array (_ BitVec 32) ValueCell!8561))

(declare-fun mapValue!28682 () ValueCell!8561)

(assert (=> mapNonEmpty!28682 (= (arr!25097 (_values!5251 thiss!1181)) (store mapRest!28682 mapKey!28682 mapValue!28682))))

(declare-fun b!892271 () Bool)

(declare-fun res!604261 () Bool)

(declare-fun e!497960 () Bool)

(assert (=> b!892271 (=> (not res!604261) (not e!497960))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892271 (= res!604261 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892272 () Bool)

(declare-fun res!604262 () Bool)

(declare-fun e!497961 () Bool)

(assert (=> b!892272 (=> res!604262 e!497961)))

(assert (=> b!892272 (= res!604262 (or (not (= (size!25542 (_values!5251 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25802 thiss!1181)))) (not (= (size!25541 (_keys!9977 thiss!1181)) (size!25542 (_values!5251 thiss!1181)))) (bvslt (mask!25802 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4960 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4960 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!604265 () Bool)

(assert (=> start!75954 (=> (not res!604265) (not e!497960))))

(declare-fun valid!1616 (LongMapFixedSize!4138) Bool)

(assert (=> start!75954 (= res!604265 (valid!1616 thiss!1181))))

(assert (=> start!75954 e!497960))

(declare-fun e!497962 () Bool)

(assert (=> start!75954 e!497962))

(assert (=> start!75954 true))

(declare-fun b!892273 () Bool)

(declare-fun tp_is_empty!18085 () Bool)

(assert (=> b!892273 (= e!497965 tp_is_empty!18085)))

(declare-fun b!892274 () Bool)

(declare-fun e!497964 () Bool)

(assert (=> b!892274 (= e!497960 (not e!497964))))

(declare-fun res!604266 () Bool)

(assert (=> b!892274 (=> res!604266 e!497964)))

(get-info :version)

(assert (=> b!892274 (= res!604266 (not ((_ is Found!8780) lt!403015)))))

(assert (=> b!892274 e!497966))

(declare-fun res!604260 () Bool)

(assert (=> b!892274 (=> res!604260 e!497966)))

(assert (=> b!892274 (= res!604260 (not ((_ is Found!8780) lt!403015)))))

(declare-datatypes ((Unit!30330 0))(
  ( (Unit!30331) )
))
(declare-fun lt!403017 () Unit!30330)

(declare-fun lemmaSeekEntryGivesInRangeIndex!34 (array!52189 array!52191 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 64)) Unit!30330)

(assert (=> b!892274 (= lt!403017 (lemmaSeekEntryGivesInRangeIndex!34 (_keys!9977 thiss!1181) (_values!5251 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52189 (_ BitVec 32)) SeekEntryResult!8780)

(assert (=> b!892274 (= lt!403015 (seekEntry!0 key!785 (_keys!9977 thiss!1181) (mask!25802 thiss!1181)))))

(declare-fun b!892275 () Bool)

(declare-fun res!604267 () Bool)

(assert (=> b!892275 (=> res!604267 e!497961)))

(declare-datatypes ((List!17697 0))(
  ( (Nil!17694) (Cons!17693 (h!18830 (_ BitVec 64)) (t!24988 List!17697)) )
))
(declare-fun arrayNoDuplicates!0 (array!52189 (_ BitVec 32) List!17697) Bool)

(assert (=> b!892275 (= res!604267 (not (arrayNoDuplicates!0 (_keys!9977 thiss!1181) #b00000000000000000000000000000000 Nil!17694)))))

(declare-fun b!892276 () Bool)

(declare-fun e!497963 () Bool)

(declare-fun e!497959 () Bool)

(assert (=> b!892276 (= e!497963 (and e!497959 mapRes!28682))))

(declare-fun condMapEmpty!28682 () Bool)

(declare-fun mapDefault!28682 () ValueCell!8561)

(assert (=> b!892276 (= condMapEmpty!28682 (= (arr!25097 (_values!5251 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8561)) mapDefault!28682)))))

(declare-fun b!892277 () Bool)

(assert (=> b!892277 (= e!497961 true)))

(declare-fun lt!403014 () Bool)

(declare-datatypes ((tuple2!11870 0))(
  ( (tuple2!11871 (_1!5946 (_ BitVec 64)) (_2!5946 V!29079)) )
))
(declare-datatypes ((List!17698 0))(
  ( (Nil!17695) (Cons!17694 (h!18831 tuple2!11870) (t!24989 List!17698)) )
))
(declare-datatypes ((ListLongMap!10569 0))(
  ( (ListLongMap!10570 (toList!5300 List!17698)) )
))
(declare-fun lt!403019 () ListLongMap!10569)

(declare-fun contains!4313 (ListLongMap!10569 (_ BitVec 64)) Bool)

(assert (=> b!892277 (= lt!403014 (contains!4313 lt!403019 key!785))))

(declare-fun array_inv!19772 (array!52189) Bool)

(declare-fun array_inv!19773 (array!52191) Bool)

(assert (=> b!892278 (= e!497962 (and tp!55241 tp_is_empty!18085 (array_inv!19772 (_keys!9977 thiss!1181)) (array_inv!19773 (_values!5251 thiss!1181)) e!497963))))

(declare-fun b!892279 () Bool)

(declare-fun res!604264 () Bool)

(assert (=> b!892279 (=> res!604264 e!497961)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52189 (_ BitVec 32)) Bool)

(assert (=> b!892279 (= res!604264 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9977 thiss!1181) (mask!25802 thiss!1181))))))

(declare-fun b!892280 () Bool)

(assert (=> b!892280 (= e!497964 e!497961)))

(declare-fun res!604263 () Bool)

(assert (=> b!892280 (=> res!604263 e!497961)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892280 (= res!604263 (not (validMask!0 (mask!25802 thiss!1181))))))

(assert (=> b!892280 (contains!4313 lt!403019 (select (arr!25096 (_keys!9977 thiss!1181)) (index!37492 lt!403015)))))

(declare-fun getCurrentListMap!2578 (array!52189 array!52191 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) ListLongMap!10569)

(assert (=> b!892280 (= lt!403019 (getCurrentListMap!2578 (_keys!9977 thiss!1181) (_values!5251 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5266 thiss!1181)))))

(declare-fun lt!403016 () Unit!30330)

(declare-fun lemmaValidKeyInArrayIsInListMap!208 (array!52189 array!52191 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) Unit!30330)

(assert (=> b!892280 (= lt!403016 (lemmaValidKeyInArrayIsInListMap!208 (_keys!9977 thiss!1181) (_values!5251 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) (index!37492 lt!403015) (defaultEntry!5266 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892280 (arrayContainsKey!0 (_keys!9977 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403018 () Unit!30330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52189 (_ BitVec 64) (_ BitVec 32)) Unit!30330)

(assert (=> b!892280 (= lt!403018 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9977 thiss!1181) key!785 (index!37492 lt!403015)))))

(declare-fun b!892281 () Bool)

(assert (=> b!892281 (= e!497959 tp_is_empty!18085)))

(assert (= (and start!75954 res!604265) b!892271))

(assert (= (and b!892271 res!604261) b!892274))

(assert (= (and b!892274 (not res!604260)) b!892270))

(assert (= (and b!892274 (not res!604266)) b!892280))

(assert (= (and b!892280 (not res!604263)) b!892272))

(assert (= (and b!892272 (not res!604262)) b!892279))

(assert (= (and b!892279 (not res!604264)) b!892275))

(assert (= (and b!892275 (not res!604267)) b!892277))

(assert (= (and b!892276 condMapEmpty!28682) mapIsEmpty!28682))

(assert (= (and b!892276 (not condMapEmpty!28682)) mapNonEmpty!28682))

(assert (= (and mapNonEmpty!28682 ((_ is ValueCellFull!8561) mapValue!28682)) b!892273))

(assert (= (and b!892276 ((_ is ValueCellFull!8561) mapDefault!28682)) b!892281))

(assert (= b!892278 b!892276))

(assert (= start!75954 b!892278))

(declare-fun m!830977 () Bool)

(assert (=> mapNonEmpty!28682 m!830977))

(declare-fun m!830979 () Bool)

(assert (=> b!892275 m!830979))

(declare-fun m!830981 () Bool)

(assert (=> b!892270 m!830981))

(declare-fun m!830983 () Bool)

(assert (=> b!892279 m!830983))

(declare-fun m!830985 () Bool)

(assert (=> b!892277 m!830985))

(declare-fun m!830987 () Bool)

(assert (=> b!892274 m!830987))

(declare-fun m!830989 () Bool)

(assert (=> b!892274 m!830989))

(declare-fun m!830991 () Bool)

(assert (=> start!75954 m!830991))

(declare-fun m!830993 () Bool)

(assert (=> b!892280 m!830993))

(declare-fun m!830995 () Bool)

(assert (=> b!892280 m!830995))

(declare-fun m!830997 () Bool)

(assert (=> b!892280 m!830997))

(declare-fun m!830999 () Bool)

(assert (=> b!892280 m!830999))

(declare-fun m!831001 () Bool)

(assert (=> b!892280 m!831001))

(assert (=> b!892280 m!830997))

(declare-fun m!831003 () Bool)

(assert (=> b!892280 m!831003))

(declare-fun m!831005 () Bool)

(assert (=> b!892280 m!831005))

(declare-fun m!831007 () Bool)

(assert (=> b!892278 m!831007))

(declare-fun m!831009 () Bool)

(assert (=> b!892278 m!831009))

(check-sat (not b_next!15757) (not b!892278) (not b!892274) (not b!892270) (not mapNonEmpty!28682) (not start!75954) (not b!892275) b_and!26007 tp_is_empty!18085 (not b!892277) (not b!892279) (not b!892280))
(check-sat b_and!26007 (not b_next!15757))
