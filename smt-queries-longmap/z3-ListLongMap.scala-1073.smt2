; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22124 () Bool)

(assert start!22124)

(declare-fun b!230149 () Bool)

(declare-fun b_free!6187 () Bool)

(declare-fun b_next!6187 () Bool)

(assert (=> b!230149 (= b_free!6187 (not b_next!6187))))

(declare-fun tp!21703 () Bool)

(declare-fun b_and!13059 () Bool)

(assert (=> b!230149 (= tp!21703 b_and!13059)))

(declare-fun b!230133 () Bool)

(declare-fun e!149336 () Bool)

(declare-datatypes ((SeekEntryResult!932 0))(
  ( (MissingZero!932 (index!5898 (_ BitVec 32))) (Found!932 (index!5899 (_ BitVec 32))) (Intermediate!932 (undefined!1744 Bool) (index!5900 (_ BitVec 32)) (x!23431 (_ BitVec 32))) (Undefined!932) (MissingVacant!932 (index!5901 (_ BitVec 32))) )
))
(declare-fun lt!115705 () SeekEntryResult!932)

(get-info :version)

(assert (=> b!230133 (= e!149336 ((_ is Undefined!932) lt!115705))))

(declare-fun b!230134 () Bool)

(declare-datatypes ((Unit!7018 0))(
  ( (Unit!7019) )
))
(declare-fun e!149334 () Unit!7018)

(declare-fun Unit!7020 () Unit!7018)

(assert (=> b!230134 (= e!149334 Unit!7020)))

(declare-fun lt!115706 () Unit!7018)

(declare-datatypes ((V!7713 0))(
  ( (V!7714 (val!3069 Int)) )
))
(declare-datatypes ((ValueCell!2681 0))(
  ( (ValueCellFull!2681 (v!5083 V!7713)) (EmptyCell!2681) )
))
(declare-datatypes ((array!11333 0))(
  ( (array!11334 (arr!5385 (Array (_ BitVec 32) ValueCell!2681)) (size!5719 (_ BitVec 32))) )
))
(declare-datatypes ((array!11335 0))(
  ( (array!11336 (arr!5386 (Array (_ BitVec 32) (_ BitVec 64))) (size!5720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3262 0))(
  ( (LongMapFixedSize!3263 (defaultEntry!4290 Int) (mask!10179 (_ BitVec 32)) (extraKeys!4027 (_ BitVec 32)) (zeroValue!4131 V!7713) (minValue!4131 V!7713) (_size!1680 (_ BitVec 32)) (_keys!6343 array!11335) (_values!4273 array!11333) (_vacant!1680 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3262)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!130 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) (_ BitVec 32) Int) Unit!7018)

(assert (=> b!230134 (= lt!115706 (lemmaArrayContainsKeyThenInListMap!130 (_keys!6343 thiss!1504) (_values!4273 thiss!1504) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(assert (=> b!230134 false))

(declare-fun b!230135 () Bool)

(declare-fun res!113179 () Bool)

(declare-fun e!149337 () Bool)

(assert (=> b!230135 (=> (not res!113179) (not e!149337))))

(assert (=> b!230135 (= res!113179 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230136 () Bool)

(declare-fun e!149335 () Bool)

(declare-fun e!149341 () Bool)

(assert (=> b!230136 (= e!149335 e!149341)))

(declare-fun res!113181 () Bool)

(assert (=> b!230136 (=> (not res!113181) (not e!149341))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230136 (= res!113181 (inRange!0 index!297 (mask!10179 thiss!1504)))))

(declare-fun lt!115700 () Unit!7018)

(declare-fun e!149339 () Unit!7018)

(assert (=> b!230136 (= lt!115700 e!149339)))

(declare-fun c!38191 () Bool)

(declare-datatypes ((tuple2!4498 0))(
  ( (tuple2!4499 (_1!2260 (_ BitVec 64)) (_2!2260 V!7713)) )
))
(declare-datatypes ((List!3436 0))(
  ( (Nil!3433) (Cons!3432 (h!4080 tuple2!4498) (t!8386 List!3436)) )
))
(declare-datatypes ((ListLongMap!3401 0))(
  ( (ListLongMap!3402 (toList!1716 List!3436)) )
))
(declare-fun lt!115708 () ListLongMap!3401)

(declare-fun contains!1591 (ListLongMap!3401 (_ BitVec 64)) Bool)

(assert (=> b!230136 (= c!38191 (contains!1591 lt!115708 key!932))))

(declare-fun getCurrentListMap!1225 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 32) Int) ListLongMap!3401)

(assert (=> b!230136 (= lt!115708 (getCurrentListMap!1225 (_keys!6343 thiss!1504) (_values!4273 thiss!1504) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(declare-fun mapNonEmpty!10243 () Bool)

(declare-fun mapRes!10243 () Bool)

(declare-fun tp!21702 () Bool)

(declare-fun e!149331 () Bool)

(assert (=> mapNonEmpty!10243 (= mapRes!10243 (and tp!21702 e!149331))))

(declare-fun mapKey!10243 () (_ BitVec 32))

(declare-fun mapValue!10243 () ValueCell!2681)

(declare-fun mapRest!10243 () (Array (_ BitVec 32) ValueCell!2681))

(assert (=> mapNonEmpty!10243 (= (arr!5385 (_values!4273 thiss!1504)) (store mapRest!10243 mapKey!10243 mapValue!10243))))

(declare-fun b!230137 () Bool)

(assert (=> b!230137 (= e!149341 (not true))))

(declare-fun lt!115707 () array!11335)

(declare-fun v!346 () V!7713)

(declare-fun +!602 (ListLongMap!3401 tuple2!4498) ListLongMap!3401)

(assert (=> b!230137 (= (+!602 lt!115708 (tuple2!4499 key!932 v!346)) (getCurrentListMap!1225 lt!115707 (array!11334 (store (arr!5385 (_values!4273 thiss!1504)) index!297 (ValueCellFull!2681 v!346)) (size!5719 (_values!4273 thiss!1504))) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4290 thiss!1504)))))

(declare-fun lt!115703 () Unit!7018)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!57 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 32) (_ BitVec 64) V!7713 Int) Unit!7018)

(assert (=> b!230137 (= lt!115703 (lemmaAddValidKeyToArrayThenAddPairToListMap!57 (_keys!6343 thiss!1504) (_values!4273 thiss!1504) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) index!297 key!932 v!346 (defaultEntry!4290 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11335 (_ BitVec 32)) Bool)

(assert (=> b!230137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115707 (mask!10179 thiss!1504))))

(declare-fun lt!115698 () Unit!7018)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11335 (_ BitVec 32) (_ BitVec 32)) Unit!7018)

(assert (=> b!230137 (= lt!115698 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6343 thiss!1504) index!297 (mask!10179 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230137 (= (arrayCountValidKeys!0 lt!115707 #b00000000000000000000000000000000 (size!5720 (_keys!6343 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6343 thiss!1504) #b00000000000000000000000000000000 (size!5720 (_keys!6343 thiss!1504)))))))

(declare-fun lt!115701 () Unit!7018)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11335 (_ BitVec 32) (_ BitVec 64)) Unit!7018)

(assert (=> b!230137 (= lt!115701 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6343 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3437 0))(
  ( (Nil!3434) (Cons!3433 (h!4081 (_ BitVec 64)) (t!8387 List!3437)) )
))
(declare-fun arrayNoDuplicates!0 (array!11335 (_ BitVec 32) List!3437) Bool)

(assert (=> b!230137 (arrayNoDuplicates!0 lt!115707 #b00000000000000000000000000000000 Nil!3434)))

(assert (=> b!230137 (= lt!115707 (array!11336 (store (arr!5386 (_keys!6343 thiss!1504)) index!297 key!932) (size!5720 (_keys!6343 thiss!1504))))))

(declare-fun lt!115699 () Unit!7018)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3437) Unit!7018)

(assert (=> b!230137 (= lt!115699 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6343 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3434))))

(declare-fun lt!115704 () Unit!7018)

(assert (=> b!230137 (= lt!115704 e!149334)))

(declare-fun c!38192 () Bool)

(declare-fun arrayContainsKey!0 (array!11335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230137 (= c!38192 (arrayContainsKey!0 (_keys!6343 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113183 () Bool)

(assert (=> start!22124 (=> (not res!113183) (not e!149337))))

(declare-fun valid!1312 (LongMapFixedSize!3262) Bool)

(assert (=> start!22124 (= res!113183 (valid!1312 thiss!1504))))

(assert (=> start!22124 e!149337))

(declare-fun e!149343 () Bool)

(assert (=> start!22124 e!149343))

(assert (=> start!22124 true))

(declare-fun tp_is_empty!6049 () Bool)

(assert (=> start!22124 tp_is_empty!6049))

(declare-fun bm!21368 () Bool)

(declare-fun call!21371 () Bool)

(assert (=> bm!21368 (= call!21371 (arrayContainsKey!0 (_keys!6343 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230138 () Bool)

(declare-fun lt!115697 () Unit!7018)

(assert (=> b!230138 (= e!149339 lt!115697)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) Int) Unit!7018)

(assert (=> b!230138 (= lt!115697 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!286 (_keys!6343 thiss!1504) (_values!4273 thiss!1504) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 (defaultEntry!4290 thiss!1504)))))

(declare-fun c!38193 () Bool)

(assert (=> b!230138 (= c!38193 ((_ is MissingZero!932) lt!115705))))

(declare-fun e!149338 () Bool)

(assert (=> b!230138 e!149338))

(declare-fun mapIsEmpty!10243 () Bool)

(assert (=> mapIsEmpty!10243 mapRes!10243))

(declare-fun b!230139 () Bool)

(declare-fun res!113184 () Bool)

(declare-fun e!149330 () Bool)

(assert (=> b!230139 (=> (not res!113184) (not e!149330))))

(declare-fun call!21372 () Bool)

(assert (=> b!230139 (= res!113184 call!21372)))

(assert (=> b!230139 (= e!149338 e!149330)))

(declare-fun b!230140 () Bool)

(assert (=> b!230140 (= e!149337 e!149335)))

(declare-fun res!113182 () Bool)

(assert (=> b!230140 (=> (not res!113182) (not e!149335))))

(assert (=> b!230140 (= res!113182 (or (= lt!115705 (MissingZero!932 index!297)) (= lt!115705 (MissingVacant!932 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11335 (_ BitVec 32)) SeekEntryResult!932)

(assert (=> b!230140 (= lt!115705 (seekEntryOrOpen!0 key!932 (_keys!6343 thiss!1504) (mask!10179 thiss!1504)))))

(declare-fun b!230141 () Bool)

(declare-fun c!38194 () Bool)

(assert (=> b!230141 (= c!38194 ((_ is MissingVacant!932) lt!115705))))

(assert (=> b!230141 (= e!149338 e!149336)))

(declare-fun b!230142 () Bool)

(declare-fun e!149342 () Bool)

(assert (=> b!230142 (= e!149342 (not call!21371))))

(declare-fun bm!21369 () Bool)

(assert (=> bm!21369 (= call!21372 (inRange!0 (ite c!38193 (index!5898 lt!115705) (index!5901 lt!115705)) (mask!10179 thiss!1504)))))

(declare-fun b!230143 () Bool)

(declare-fun Unit!7021 () Unit!7018)

(assert (=> b!230143 (= e!149339 Unit!7021)))

(declare-fun lt!115702 () Unit!7018)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7713 V!7713 (_ BitVec 64) Int) Unit!7018)

(assert (=> b!230143 (= lt!115702 (lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (_keys!6343 thiss!1504) (_values!4273 thiss!1504) (mask!10179 thiss!1504) (extraKeys!4027 thiss!1504) (zeroValue!4131 thiss!1504) (minValue!4131 thiss!1504) key!932 (defaultEntry!4290 thiss!1504)))))

(assert (=> b!230143 false))

(declare-fun b!230144 () Bool)

(assert (=> b!230144 (= e!149331 tp_is_empty!6049)))

(declare-fun b!230145 () Bool)

(declare-fun Unit!7022 () Unit!7018)

(assert (=> b!230145 (= e!149334 Unit!7022)))

(declare-fun b!230146 () Bool)

(declare-fun e!149332 () Bool)

(assert (=> b!230146 (= e!149332 tp_is_empty!6049)))

(declare-fun b!230147 () Bool)

(assert (=> b!230147 (= e!149330 (not call!21371))))

(declare-fun b!230148 () Bool)

(assert (=> b!230148 (= e!149336 e!149342)))

(declare-fun res!113186 () Bool)

(assert (=> b!230148 (= res!113186 call!21372)))

(assert (=> b!230148 (=> (not res!113186) (not e!149342))))

(declare-fun e!149340 () Bool)

(declare-fun array_inv!3553 (array!11335) Bool)

(declare-fun array_inv!3554 (array!11333) Bool)

(assert (=> b!230149 (= e!149343 (and tp!21703 tp_is_empty!6049 (array_inv!3553 (_keys!6343 thiss!1504)) (array_inv!3554 (_values!4273 thiss!1504)) e!149340))))

(declare-fun b!230150 () Bool)

(declare-fun res!113180 () Bool)

(assert (=> b!230150 (=> (not res!113180) (not e!149330))))

(assert (=> b!230150 (= res!113180 (= (select (arr!5386 (_keys!6343 thiss!1504)) (index!5898 lt!115705)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230151 () Bool)

(assert (=> b!230151 (= e!149340 (and e!149332 mapRes!10243))))

(declare-fun condMapEmpty!10243 () Bool)

(declare-fun mapDefault!10243 () ValueCell!2681)

(assert (=> b!230151 (= condMapEmpty!10243 (= (arr!5385 (_values!4273 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2681)) mapDefault!10243)))))

(declare-fun b!230152 () Bool)

(declare-fun res!113185 () Bool)

(assert (=> b!230152 (= res!113185 (= (select (arr!5386 (_keys!6343 thiss!1504)) (index!5901 lt!115705)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230152 (=> (not res!113185) (not e!149342))))

(assert (= (and start!22124 res!113183) b!230135))

(assert (= (and b!230135 res!113179) b!230140))

(assert (= (and b!230140 res!113182) b!230136))

(assert (= (and b!230136 c!38191) b!230143))

(assert (= (and b!230136 (not c!38191)) b!230138))

(assert (= (and b!230138 c!38193) b!230139))

(assert (= (and b!230138 (not c!38193)) b!230141))

(assert (= (and b!230139 res!113184) b!230150))

(assert (= (and b!230150 res!113180) b!230147))

(assert (= (and b!230141 c!38194) b!230148))

(assert (= (and b!230141 (not c!38194)) b!230133))

(assert (= (and b!230148 res!113186) b!230152))

(assert (= (and b!230152 res!113185) b!230142))

(assert (= (or b!230139 b!230148) bm!21369))

(assert (= (or b!230147 b!230142) bm!21368))

(assert (= (and b!230136 res!113181) b!230137))

(assert (= (and b!230137 c!38192) b!230134))

(assert (= (and b!230137 (not c!38192)) b!230145))

(assert (= (and b!230151 condMapEmpty!10243) mapIsEmpty!10243))

(assert (= (and b!230151 (not condMapEmpty!10243)) mapNonEmpty!10243))

(assert (= (and mapNonEmpty!10243 ((_ is ValueCellFull!2681) mapValue!10243)) b!230144))

(assert (= (and b!230151 ((_ is ValueCellFull!2681) mapDefault!10243)) b!230146))

(assert (= b!230149 b!230151))

(assert (= start!22124 b!230149))

(declare-fun m!251053 () Bool)

(assert (=> mapNonEmpty!10243 m!251053))

(declare-fun m!251055 () Bool)

(assert (=> b!230137 m!251055))

(declare-fun m!251057 () Bool)

(assert (=> b!230137 m!251057))

(declare-fun m!251059 () Bool)

(assert (=> b!230137 m!251059))

(declare-fun m!251061 () Bool)

(assert (=> b!230137 m!251061))

(declare-fun m!251063 () Bool)

(assert (=> b!230137 m!251063))

(declare-fun m!251065 () Bool)

(assert (=> b!230137 m!251065))

(declare-fun m!251067 () Bool)

(assert (=> b!230137 m!251067))

(declare-fun m!251069 () Bool)

(assert (=> b!230137 m!251069))

(declare-fun m!251071 () Bool)

(assert (=> b!230137 m!251071))

(declare-fun m!251073 () Bool)

(assert (=> b!230137 m!251073))

(declare-fun m!251075 () Bool)

(assert (=> b!230137 m!251075))

(declare-fun m!251077 () Bool)

(assert (=> b!230137 m!251077))

(declare-fun m!251079 () Bool)

(assert (=> b!230137 m!251079))

(declare-fun m!251081 () Bool)

(assert (=> b!230134 m!251081))

(declare-fun m!251083 () Bool)

(assert (=> bm!21369 m!251083))

(declare-fun m!251085 () Bool)

(assert (=> b!230136 m!251085))

(declare-fun m!251087 () Bool)

(assert (=> b!230136 m!251087))

(declare-fun m!251089 () Bool)

(assert (=> b!230136 m!251089))

(declare-fun m!251091 () Bool)

(assert (=> b!230140 m!251091))

(declare-fun m!251093 () Bool)

(assert (=> start!22124 m!251093))

(declare-fun m!251095 () Bool)

(assert (=> b!230150 m!251095))

(declare-fun m!251097 () Bool)

(assert (=> b!230149 m!251097))

(declare-fun m!251099 () Bool)

(assert (=> b!230149 m!251099))

(declare-fun m!251101 () Bool)

(assert (=> b!230152 m!251101))

(declare-fun m!251103 () Bool)

(assert (=> b!230138 m!251103))

(declare-fun m!251105 () Bool)

(assert (=> b!230143 m!251105))

(assert (=> bm!21368 m!251077))

(check-sat (not b!230149) b_and!13059 (not bm!21369) (not b!230140) (not b!230143) tp_is_empty!6049 (not start!22124) (not mapNonEmpty!10243) (not b!230134) (not b!230136) (not b_next!6187) (not b!230137) (not bm!21368) (not b!230138))
(check-sat b_and!13059 (not b_next!6187))
