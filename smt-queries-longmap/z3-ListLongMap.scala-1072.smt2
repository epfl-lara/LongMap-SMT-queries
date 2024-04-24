; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22118 () Bool)

(assert start!22118)

(declare-fun b!230166 () Bool)

(declare-fun b_free!6181 () Bool)

(declare-fun b_next!6181 () Bool)

(assert (=> b!230166 (= b_free!6181 (not b_next!6181))))

(declare-fun tp!21684 () Bool)

(declare-fun b_and!13093 () Bool)

(assert (=> b!230166 (= tp!21684 b_and!13093)))

(declare-fun res!113228 () Bool)

(declare-fun e!149334 () Bool)

(assert (=> start!22118 (=> (not res!113228) (not e!149334))))

(declare-datatypes ((V!7705 0))(
  ( (V!7706 (val!3066 Int)) )
))
(declare-datatypes ((ValueCell!2678 0))(
  ( (ValueCellFull!2678 (v!5087 V!7705)) (EmptyCell!2678) )
))
(declare-datatypes ((array!11327 0))(
  ( (array!11328 (arr!5383 (Array (_ BitVec 32) ValueCell!2678)) (size!5716 (_ BitVec 32))) )
))
(declare-datatypes ((array!11329 0))(
  ( (array!11330 (arr!5384 (Array (_ BitVec 32) (_ BitVec 64))) (size!5717 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3256 0))(
  ( (LongMapFixedSize!3257 (defaultEntry!4287 Int) (mask!10175 (_ BitVec 32)) (extraKeys!4024 (_ BitVec 32)) (zeroValue!4128 V!7705) (minValue!4128 V!7705) (_size!1677 (_ BitVec 32)) (_keys!6341 array!11329) (_values!4270 array!11327) (_vacant!1677 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3256)

(declare-fun valid!1308 (LongMapFixedSize!3256) Bool)

(assert (=> start!22118 (= res!113228 (valid!1308 thiss!1504))))

(assert (=> start!22118 e!149334))

(declare-fun e!149339 () Bool)

(assert (=> start!22118 e!149339))

(assert (=> start!22118 true))

(declare-fun tp_is_empty!6043 () Bool)

(assert (=> start!22118 tp_is_empty!6043))

(declare-fun b!230147 () Bool)

(declare-fun e!149329 () Bool)

(assert (=> b!230147 (= e!149334 e!149329)))

(declare-fun res!113224 () Bool)

(assert (=> b!230147 (=> (not res!113224) (not e!149329))))

(declare-datatypes ((SeekEntryResult!898 0))(
  ( (MissingZero!898 (index!5762 (_ BitVec 32))) (Found!898 (index!5763 (_ BitVec 32))) (Intermediate!898 (undefined!1710 Bool) (index!5764 (_ BitVec 32)) (x!23390 (_ BitVec 32))) (Undefined!898) (MissingVacant!898 (index!5765 (_ BitVec 32))) )
))
(declare-fun lt!115830 () SeekEntryResult!898)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230147 (= res!113224 (or (= lt!115830 (MissingZero!898 index!297)) (= lt!115830 (MissingVacant!898 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11329 (_ BitVec 32)) SeekEntryResult!898)

(assert (=> b!230147 (= lt!115830 (seekEntryOrOpen!0 key!932 (_keys!6341 thiss!1504) (mask!10175 thiss!1504)))))

(declare-fun call!21365 () Bool)

(declare-fun bm!21362 () Bool)

(declare-fun c!38197 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21362 (= call!21365 (inRange!0 (ite c!38197 (index!5762 lt!115830) (index!5765 lt!115830)) (mask!10175 thiss!1504)))))

(declare-fun b!230148 () Bool)

(declare-fun res!113229 () Bool)

(declare-fun e!149342 () Bool)

(assert (=> b!230148 (=> (not res!113229) (not e!149342))))

(assert (=> b!230148 (= res!113229 (= (select (arr!5384 (_keys!6341 thiss!1504)) (index!5762 lt!115830)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230149 () Bool)

(declare-fun e!149332 () Bool)

(assert (=> b!230149 (= e!149332 tp_is_empty!6043)))

(declare-fun b!230150 () Bool)

(declare-fun e!149335 () Bool)

(assert (=> b!230150 (= e!149335 (not true))))

(declare-fun v!346 () V!7705)

(declare-fun lt!115834 () array!11329)

(declare-datatypes ((tuple2!4450 0))(
  ( (tuple2!4451 (_1!2236 (_ BitVec 64)) (_2!2236 V!7705)) )
))
(declare-datatypes ((List!3364 0))(
  ( (Nil!3361) (Cons!3360 (h!4008 tuple2!4450) (t!8315 List!3364)) )
))
(declare-datatypes ((ListLongMap!3365 0))(
  ( (ListLongMap!3366 (toList!1698 List!3364)) )
))
(declare-fun lt!115840 () ListLongMap!3365)

(declare-fun +!598 (ListLongMap!3365 tuple2!4450) ListLongMap!3365)

(declare-fun getCurrentListMap!1230 (array!11329 array!11327 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) Int) ListLongMap!3365)

(assert (=> b!230150 (= (+!598 lt!115840 (tuple2!4451 key!932 v!346)) (getCurrentListMap!1230 lt!115834 (array!11328 (store (arr!5383 (_values!4270 thiss!1504)) index!297 (ValueCellFull!2678 v!346)) (size!5716 (_values!4270 thiss!1504))) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-datatypes ((Unit!7017 0))(
  ( (Unit!7018) )
))
(declare-fun lt!115829 () Unit!7017)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!57 (array!11329 array!11327 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) (_ BitVec 64) V!7705 Int) Unit!7017)

(assert (=> b!230150 (= lt!115829 (lemmaAddValidKeyToArrayThenAddPairToListMap!57 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) index!297 key!932 v!346 (defaultEntry!4287 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11329 (_ BitVec 32)) Bool)

(assert (=> b!230150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115834 (mask!10175 thiss!1504))))

(declare-fun lt!115839 () Unit!7017)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11329 (_ BitVec 32) (_ BitVec 32)) Unit!7017)

(assert (=> b!230150 (= lt!115839 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6341 thiss!1504) index!297 (mask!10175 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230150 (= (arrayCountValidKeys!0 lt!115834 #b00000000000000000000000000000000 (size!5717 (_keys!6341 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6341 thiss!1504) #b00000000000000000000000000000000 (size!5717 (_keys!6341 thiss!1504)))))))

(declare-fun lt!115835 () Unit!7017)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11329 (_ BitVec 32) (_ BitVec 64)) Unit!7017)

(assert (=> b!230150 (= lt!115835 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6341 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3365 0))(
  ( (Nil!3362) (Cons!3361 (h!4009 (_ BitVec 64)) (t!8316 List!3365)) )
))
(declare-fun arrayNoDuplicates!0 (array!11329 (_ BitVec 32) List!3365) Bool)

(assert (=> b!230150 (arrayNoDuplicates!0 lt!115834 #b00000000000000000000000000000000 Nil!3362)))

(assert (=> b!230150 (= lt!115834 (array!11330 (store (arr!5384 (_keys!6341 thiss!1504)) index!297 key!932) (size!5717 (_keys!6341 thiss!1504))))))

(declare-fun lt!115837 () Unit!7017)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3365) Unit!7017)

(assert (=> b!230150 (= lt!115837 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6341 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3362))))

(declare-fun lt!115836 () Unit!7017)

(declare-fun e!149330 () Unit!7017)

(assert (=> b!230150 (= lt!115836 e!149330)))

(declare-fun c!38196 () Bool)

(declare-fun arrayContainsKey!0 (array!11329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230150 (= c!38196 (arrayContainsKey!0 (_keys!6341 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230151 () Bool)

(declare-fun e!149341 () Unit!7017)

(declare-fun lt!115831 () Unit!7017)

(assert (=> b!230151 (= e!149341 lt!115831)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!282 (array!11329 array!11327 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7017)

(assert (=> b!230151 (= lt!115831 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!282 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(get-info :version)

(assert (=> b!230151 (= c!38197 ((_ is MissingZero!898) lt!115830))))

(declare-fun e!149338 () Bool)

(assert (=> b!230151 e!149338))

(declare-fun b!230152 () Bool)

(declare-fun res!113226 () Bool)

(assert (=> b!230152 (=> (not res!113226) (not e!149334))))

(assert (=> b!230152 (= res!113226 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230153 () Bool)

(declare-fun Unit!7019 () Unit!7017)

(assert (=> b!230153 (= e!149341 Unit!7019)))

(declare-fun lt!115838 () Unit!7017)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!290 (array!11329 array!11327 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7017)

(assert (=> b!230153 (= lt!115838 (lemmaInListMapThenSeekEntryOrOpenFindsIt!290 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!230153 false))

(declare-fun b!230154 () Bool)

(declare-fun call!21366 () Bool)

(assert (=> b!230154 (= e!149342 (not call!21366))))

(declare-fun bm!21363 () Bool)

(assert (=> bm!21363 (= call!21366 (arrayContainsKey!0 (_keys!6341 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230155 () Bool)

(declare-fun res!113227 () Bool)

(assert (=> b!230155 (= res!113227 (= (select (arr!5384 (_keys!6341 thiss!1504)) (index!5765 lt!115830)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149340 () Bool)

(assert (=> b!230155 (=> (not res!113227) (not e!149340))))

(declare-fun b!230156 () Bool)

(declare-fun e!149331 () Bool)

(assert (=> b!230156 (= e!149331 e!149340)))

(declare-fun res!113223 () Bool)

(assert (=> b!230156 (= res!113223 call!21365)))

(assert (=> b!230156 (=> (not res!113223) (not e!149340))))

(declare-fun b!230157 () Bool)

(declare-fun Unit!7020 () Unit!7017)

(assert (=> b!230157 (= e!149330 Unit!7020)))

(declare-fun lt!115832 () Unit!7017)

(declare-fun lemmaArrayContainsKeyThenInListMap!127 (array!11329 array!11327 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) (_ BitVec 32) Int) Unit!7017)

(assert (=> b!230157 (= lt!115832 (lemmaArrayContainsKeyThenInListMap!127 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!230157 false))

(declare-fun b!230158 () Bool)

(assert (=> b!230158 (= e!149329 e!149335)))

(declare-fun res!113230 () Bool)

(assert (=> b!230158 (=> (not res!113230) (not e!149335))))

(assert (=> b!230158 (= res!113230 (inRange!0 index!297 (mask!10175 thiss!1504)))))

(declare-fun lt!115833 () Unit!7017)

(assert (=> b!230158 (= lt!115833 e!149341)))

(declare-fun c!38194 () Bool)

(declare-fun contains!1587 (ListLongMap!3365 (_ BitVec 64)) Bool)

(assert (=> b!230158 (= c!38194 (contains!1587 lt!115840 key!932))))

(assert (=> b!230158 (= lt!115840 (getCurrentListMap!1230 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-fun b!230159 () Bool)

(declare-fun Unit!7021 () Unit!7017)

(assert (=> b!230159 (= e!149330 Unit!7021)))

(declare-fun b!230160 () Bool)

(assert (=> b!230160 (= e!149340 (not call!21366))))

(declare-fun b!230161 () Bool)

(assert (=> b!230161 (= e!149331 ((_ is Undefined!898) lt!115830))))

(declare-fun mapNonEmpty!10234 () Bool)

(declare-fun mapRes!10234 () Bool)

(declare-fun tp!21685 () Bool)

(declare-fun e!149336 () Bool)

(assert (=> mapNonEmpty!10234 (= mapRes!10234 (and tp!21685 e!149336))))

(declare-fun mapRest!10234 () (Array (_ BitVec 32) ValueCell!2678))

(declare-fun mapValue!10234 () ValueCell!2678)

(declare-fun mapKey!10234 () (_ BitVec 32))

(assert (=> mapNonEmpty!10234 (= (arr!5383 (_values!4270 thiss!1504)) (store mapRest!10234 mapKey!10234 mapValue!10234))))

(declare-fun b!230162 () Bool)

(declare-fun e!149337 () Bool)

(assert (=> b!230162 (= e!149337 (and e!149332 mapRes!10234))))

(declare-fun condMapEmpty!10234 () Bool)

(declare-fun mapDefault!10234 () ValueCell!2678)

(assert (=> b!230162 (= condMapEmpty!10234 (= (arr!5383 (_values!4270 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2678)) mapDefault!10234)))))

(declare-fun b!230163 () Bool)

(declare-fun c!38195 () Bool)

(assert (=> b!230163 (= c!38195 ((_ is MissingVacant!898) lt!115830))))

(assert (=> b!230163 (= e!149338 e!149331)))

(declare-fun b!230164 () Bool)

(assert (=> b!230164 (= e!149336 tp_is_empty!6043)))

(declare-fun mapIsEmpty!10234 () Bool)

(assert (=> mapIsEmpty!10234 mapRes!10234))

(declare-fun b!230165 () Bool)

(declare-fun res!113225 () Bool)

(assert (=> b!230165 (=> (not res!113225) (not e!149342))))

(assert (=> b!230165 (= res!113225 call!21365)))

(assert (=> b!230165 (= e!149338 e!149342)))

(declare-fun array_inv!3535 (array!11329) Bool)

(declare-fun array_inv!3536 (array!11327) Bool)

(assert (=> b!230166 (= e!149339 (and tp!21684 tp_is_empty!6043 (array_inv!3535 (_keys!6341 thiss!1504)) (array_inv!3536 (_values!4270 thiss!1504)) e!149337))))

(assert (= (and start!22118 res!113228) b!230152))

(assert (= (and b!230152 res!113226) b!230147))

(assert (= (and b!230147 res!113224) b!230158))

(assert (= (and b!230158 c!38194) b!230153))

(assert (= (and b!230158 (not c!38194)) b!230151))

(assert (= (and b!230151 c!38197) b!230165))

(assert (= (and b!230151 (not c!38197)) b!230163))

(assert (= (and b!230165 res!113225) b!230148))

(assert (= (and b!230148 res!113229) b!230154))

(assert (= (and b!230163 c!38195) b!230156))

(assert (= (and b!230163 (not c!38195)) b!230161))

(assert (= (and b!230156 res!113223) b!230155))

(assert (= (and b!230155 res!113227) b!230160))

(assert (= (or b!230165 b!230156) bm!21362))

(assert (= (or b!230154 b!230160) bm!21363))

(assert (= (and b!230158 res!113230) b!230150))

(assert (= (and b!230150 c!38196) b!230157))

(assert (= (and b!230150 (not c!38196)) b!230159))

(assert (= (and b!230162 condMapEmpty!10234) mapIsEmpty!10234))

(assert (= (and b!230162 (not condMapEmpty!10234)) mapNonEmpty!10234))

(assert (= (and mapNonEmpty!10234 ((_ is ValueCellFull!2678) mapValue!10234)) b!230164))

(assert (= (and b!230162 ((_ is ValueCellFull!2678) mapDefault!10234)) b!230149))

(assert (= b!230166 b!230162))

(assert (= start!22118 b!230166))

(declare-fun m!251689 () Bool)

(assert (=> b!230153 m!251689))

(declare-fun m!251691 () Bool)

(assert (=> b!230158 m!251691))

(declare-fun m!251693 () Bool)

(assert (=> b!230158 m!251693))

(declare-fun m!251695 () Bool)

(assert (=> b!230158 m!251695))

(declare-fun m!251697 () Bool)

(assert (=> b!230147 m!251697))

(declare-fun m!251699 () Bool)

(assert (=> b!230155 m!251699))

(declare-fun m!251701 () Bool)

(assert (=> start!22118 m!251701))

(declare-fun m!251703 () Bool)

(assert (=> b!230150 m!251703))

(declare-fun m!251705 () Bool)

(assert (=> b!230150 m!251705))

(declare-fun m!251707 () Bool)

(assert (=> b!230150 m!251707))

(declare-fun m!251709 () Bool)

(assert (=> b!230150 m!251709))

(declare-fun m!251711 () Bool)

(assert (=> b!230150 m!251711))

(declare-fun m!251713 () Bool)

(assert (=> b!230150 m!251713))

(declare-fun m!251715 () Bool)

(assert (=> b!230150 m!251715))

(declare-fun m!251717 () Bool)

(assert (=> b!230150 m!251717))

(declare-fun m!251719 () Bool)

(assert (=> b!230150 m!251719))

(declare-fun m!251721 () Bool)

(assert (=> b!230150 m!251721))

(declare-fun m!251723 () Bool)

(assert (=> b!230150 m!251723))

(declare-fun m!251725 () Bool)

(assert (=> b!230150 m!251725))

(declare-fun m!251727 () Bool)

(assert (=> b!230150 m!251727))

(assert (=> bm!21363 m!251705))

(declare-fun m!251729 () Bool)

(assert (=> b!230151 m!251729))

(declare-fun m!251731 () Bool)

(assert (=> b!230148 m!251731))

(declare-fun m!251733 () Bool)

(assert (=> b!230166 m!251733))

(declare-fun m!251735 () Bool)

(assert (=> b!230166 m!251735))

(declare-fun m!251737 () Bool)

(assert (=> bm!21362 m!251737))

(declare-fun m!251739 () Bool)

(assert (=> mapNonEmpty!10234 m!251739))

(declare-fun m!251741 () Bool)

(assert (=> b!230157 m!251741))

(check-sat (not b!230166) (not b!230153) (not mapNonEmpty!10234) b_and!13093 (not b!230150) (not b!230157) tp_is_empty!6043 (not start!22118) (not b!230147) (not bm!21362) (not b_next!6181) (not bm!21363) (not b!230151) (not b!230158))
(check-sat b_and!13093 (not b_next!6181))
