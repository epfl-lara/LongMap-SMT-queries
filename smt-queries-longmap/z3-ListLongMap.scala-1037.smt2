; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21908 () Bool)

(assert start!21908)

(declare-fun b!222221 () Bool)

(declare-fun b_free!5971 () Bool)

(declare-fun b_next!5971 () Bool)

(assert (=> b!222221 (= b_free!5971 (not b_next!5971))))

(declare-fun tp!21054 () Bool)

(declare-fun b_and!12883 () Bool)

(assert (=> b!222221 (= tp!21054 b_and!12883)))

(declare-fun bm!20732 () Bool)

(declare-fun call!20735 () Bool)

(declare-datatypes ((V!7425 0))(
  ( (V!7426 (val!2961 Int)) )
))
(declare-datatypes ((ValueCell!2573 0))(
  ( (ValueCellFull!2573 (v!4982 V!7425)) (EmptyCell!2573) )
))
(declare-datatypes ((array!10907 0))(
  ( (array!10908 (arr!5173 (Array (_ BitVec 32) ValueCell!2573)) (size!5506 (_ BitVec 32))) )
))
(declare-datatypes ((array!10909 0))(
  ( (array!10910 (arr!5174 (Array (_ BitVec 32) (_ BitVec 64))) (size!5507 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3046 0))(
  ( (LongMapFixedSize!3047 (defaultEntry!4182 Int) (mask!10000 (_ BitVec 32)) (extraKeys!3919 (_ BitVec 32)) (zeroValue!4023 V!7425) (minValue!4023 V!7425) (_size!1572 (_ BitVec 32)) (_keys!6236 array!10909) (_values!4165 array!10907) (_vacant!1572 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3046)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20732 (= call!20735 (arrayContainsKey!0 (_keys!6236 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222207 () Bool)

(declare-fun c!36936 () Bool)

(declare-datatypes ((SeekEntryResult!807 0))(
  ( (MissingZero!807 (index!5398 (_ BitVec 32))) (Found!807 (index!5399 (_ BitVec 32))) (Intermediate!807 (undefined!1619 Bool) (index!5400 (_ BitVec 32)) (x!23019 (_ BitVec 32))) (Undefined!807) (MissingVacant!807 (index!5401 (_ BitVec 32))) )
))
(declare-fun lt!112644 () SeekEntryResult!807)

(get-info :version)

(assert (=> b!222207 (= c!36936 ((_ is MissingVacant!807) lt!112644))))

(declare-fun e!144399 () Bool)

(declare-fun e!144398 () Bool)

(assert (=> b!222207 (= e!144399 e!144398)))

(declare-fun b!222208 () Bool)

(declare-fun e!144397 () Bool)

(declare-fun e!144400 () Bool)

(assert (=> b!222208 (= e!144397 e!144400)))

(declare-fun res!109076 () Bool)

(assert (=> b!222208 (=> (not res!109076) (not e!144400))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222208 (= res!109076 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222209 () Bool)

(declare-fun res!109064 () Bool)

(assert (=> b!222209 (= res!109064 (= (select (arr!5174 (_keys!6236 thiss!1504)) (index!5401 lt!112644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144396 () Bool)

(assert (=> b!222209 (=> (not res!109064) (not e!144396))))

(declare-fun res!109068 () Bool)

(declare-fun e!144409 () Bool)

(assert (=> start!21908 (=> (not res!109068) (not e!144409))))

(declare-fun valid!1235 (LongMapFixedSize!3046) Bool)

(assert (=> start!21908 (= res!109068 (valid!1235 thiss!1504))))

(assert (=> start!21908 e!144409))

(declare-fun e!144410 () Bool)

(assert (=> start!21908 e!144410))

(assert (=> start!21908 true))

(declare-fun b!222210 () Bool)

(declare-datatypes ((List!3202 0))(
  ( (Nil!3199) (Cons!3198 (h!3846 (_ BitVec 64)) (t!8153 List!3202)) )
))
(declare-fun contains!1488 (List!3202 (_ BitVec 64)) Bool)

(assert (=> b!222210 (= e!144400 (not (contains!1488 Nil!3199 key!932)))))

(declare-fun b!222211 () Bool)

(assert (=> b!222211 (= e!144396 (not call!20735))))

(declare-fun b!222212 () Bool)

(declare-datatypes ((Unit!6612 0))(
  ( (Unit!6613) )
))
(declare-fun e!144407 () Unit!6612)

(declare-fun Unit!6614 () Unit!6612)

(assert (=> b!222212 (= e!144407 Unit!6614)))

(declare-fun lt!112647 () Unit!6612)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!216 (array!10909 array!10907 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) Int) Unit!6612)

(assert (=> b!222212 (= lt!112647 (lemmaInListMapThenSeekEntryOrOpenFindsIt!216 (_keys!6236 thiss!1504) (_values!4165 thiss!1504) (mask!10000 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222212 false))

(declare-fun mapNonEmpty!9919 () Bool)

(declare-fun mapRes!9919 () Bool)

(declare-fun tp!21055 () Bool)

(declare-fun e!144404 () Bool)

(assert (=> mapNonEmpty!9919 (= mapRes!9919 (and tp!21055 e!144404))))

(declare-fun mapValue!9919 () ValueCell!2573)

(declare-fun mapKey!9919 () (_ BitVec 32))

(declare-fun mapRest!9919 () (Array (_ BitVec 32) ValueCell!2573))

(assert (=> mapNonEmpty!9919 (= (arr!5173 (_values!4165 thiss!1504)) (store mapRest!9919 mapKey!9919 mapValue!9919))))

(declare-fun b!222213 () Bool)

(declare-fun res!109075 () Bool)

(declare-fun e!144408 () Bool)

(assert (=> b!222213 (=> (not res!109075) (not e!144408))))

(declare-fun call!20736 () Bool)

(assert (=> b!222213 (= res!109075 call!20736)))

(assert (=> b!222213 (= e!144399 e!144408)))

(declare-fun b!222214 () Bool)

(assert (=> b!222214 (= e!144398 e!144396)))

(declare-fun res!109067 () Bool)

(assert (=> b!222214 (= res!109067 call!20736)))

(assert (=> b!222214 (=> (not res!109067) (not e!144396))))

(declare-fun b!222215 () Bool)

(declare-fun e!144403 () Bool)

(assert (=> b!222215 (= e!144403 (contains!1488 Nil!3199 key!932))))

(declare-fun b!222216 () Bool)

(declare-fun res!109065 () Bool)

(assert (=> b!222216 (=> (not res!109065) (not e!144408))))

(assert (=> b!222216 (= res!109065 (= (select (arr!5174 (_keys!6236 thiss!1504)) (index!5398 lt!112644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222217 () Bool)

(declare-fun e!144402 () Bool)

(declare-fun e!144406 () Bool)

(assert (=> b!222217 (= e!144402 e!144406)))

(declare-fun res!109066 () Bool)

(assert (=> b!222217 (=> (not res!109066) (not e!144406))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222217 (= res!109066 (inRange!0 index!297 (mask!10000 thiss!1504)))))

(declare-fun lt!112642 () Unit!6612)

(assert (=> b!222217 (= lt!112642 e!144407)))

(declare-fun c!36934 () Bool)

(declare-datatypes ((tuple2!4306 0))(
  ( (tuple2!4307 (_1!2164 (_ BitVec 64)) (_2!2164 V!7425)) )
))
(declare-datatypes ((List!3203 0))(
  ( (Nil!3200) (Cons!3199 (h!3847 tuple2!4306) (t!8154 List!3203)) )
))
(declare-datatypes ((ListLongMap!3221 0))(
  ( (ListLongMap!3222 (toList!1626 List!3203)) )
))
(declare-fun contains!1489 (ListLongMap!3221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1158 (array!10909 array!10907 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 32) Int) ListLongMap!3221)

(assert (=> b!222217 (= c!36934 (contains!1489 (getCurrentListMap!1158 (_keys!6236 thiss!1504) (_values!4165 thiss!1504) (mask!10000 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4182 thiss!1504)) key!932))))

(declare-fun b!222218 () Bool)

(declare-fun res!109073 () Bool)

(assert (=> b!222218 (=> (not res!109073) (not e!144409))))

(assert (=> b!222218 (= res!109073 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222219 () Bool)

(assert (=> b!222219 (= e!144398 ((_ is Undefined!807) lt!112644))))

(declare-fun b!222220 () Bool)

(declare-fun e!144412 () Bool)

(assert (=> b!222220 (= e!144412 false)))

(declare-fun lt!112646 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10909 (_ BitVec 32) List!3202) Bool)

(assert (=> b!222220 (= lt!112646 (arrayNoDuplicates!0 (_keys!6236 thiss!1504) #b00000000000000000000000000000000 Nil!3199))))

(declare-fun e!144401 () Bool)

(declare-fun tp_is_empty!5833 () Bool)

(declare-fun array_inv!3397 (array!10909) Bool)

(declare-fun array_inv!3398 (array!10907) Bool)

(assert (=> b!222221 (= e!144410 (and tp!21054 tp_is_empty!5833 (array_inv!3397 (_keys!6236 thiss!1504)) (array_inv!3398 (_values!4165 thiss!1504)) e!144401))))

(declare-fun b!222222 () Bool)

(declare-fun res!109070 () Bool)

(assert (=> b!222222 (=> (not res!109070) (not e!144412))))

(assert (=> b!222222 (= res!109070 (not (contains!1488 Nil!3199 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20733 () Bool)

(declare-fun c!36937 () Bool)

(assert (=> bm!20733 (= call!20736 (inRange!0 (ite c!36937 (index!5398 lt!112644) (index!5401 lt!112644)) (mask!10000 thiss!1504)))))

(declare-fun b!222223 () Bool)

(declare-fun e!144411 () Unit!6612)

(declare-fun Unit!6615 () Unit!6612)

(assert (=> b!222223 (= e!144411 Unit!6615)))

(declare-fun b!222224 () Bool)

(declare-fun e!144405 () Bool)

(assert (=> b!222224 (= e!144401 (and e!144405 mapRes!9919))))

(declare-fun condMapEmpty!9919 () Bool)

(declare-fun mapDefault!9919 () ValueCell!2573)

(assert (=> b!222224 (= condMapEmpty!9919 (= (arr!5173 (_values!4165 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2573)) mapDefault!9919)))))

(declare-fun b!222225 () Bool)

(declare-fun lt!112643 () Unit!6612)

(assert (=> b!222225 (= e!144407 lt!112643)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!210 (array!10909 array!10907 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) Int) Unit!6612)

(assert (=> b!222225 (= lt!112643 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!210 (_keys!6236 thiss!1504) (_values!4165 thiss!1504) (mask!10000 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222225 (= c!36937 ((_ is MissingZero!807) lt!112644))))

(assert (=> b!222225 e!144399))

(declare-fun b!222226 () Bool)

(assert (=> b!222226 (= e!144405 tp_is_empty!5833)))

(declare-fun b!222227 () Bool)

(declare-fun res!109074 () Bool)

(assert (=> b!222227 (=> (not res!109074) (not e!144412))))

(assert (=> b!222227 (= res!109074 e!144397)))

(declare-fun res!109069 () Bool)

(assert (=> b!222227 (=> res!109069 e!144397)))

(assert (=> b!222227 (= res!109069 e!144403)))

(declare-fun res!109071 () Bool)

(assert (=> b!222227 (=> (not res!109071) (not e!144403))))

(assert (=> b!222227 (= res!109071 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun mapIsEmpty!9919 () Bool)

(assert (=> mapIsEmpty!9919 mapRes!9919))

(declare-fun b!222228 () Bool)

(declare-fun Unit!6616 () Unit!6612)

(assert (=> b!222228 (= e!144411 Unit!6616)))

(declare-fun lt!112648 () Unit!6612)

(declare-fun lemmaArrayContainsKeyThenInListMap!57 (array!10909 array!10907 (_ BitVec 32) (_ BitVec 32) V!7425 V!7425 (_ BitVec 64) (_ BitVec 32) Int) Unit!6612)

(assert (=> b!222228 (= lt!112648 (lemmaArrayContainsKeyThenInListMap!57 (_keys!6236 thiss!1504) (_values!4165 thiss!1504) (mask!10000 thiss!1504) (extraKeys!3919 thiss!1504) (zeroValue!4023 thiss!1504) (minValue!4023 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4182 thiss!1504)))))

(assert (=> b!222228 false))

(declare-fun b!222229 () Bool)

(assert (=> b!222229 (= e!144404 tp_is_empty!5833)))

(declare-fun b!222230 () Bool)

(assert (=> b!222230 (= e!144408 (not call!20735))))

(declare-fun b!222231 () Bool)

(declare-fun res!109072 () Bool)

(assert (=> b!222231 (=> (not res!109072) (not e!144412))))

(assert (=> b!222231 (= res!109072 (not (contains!1488 Nil!3199 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222232 () Bool)

(assert (=> b!222232 (= e!144406 e!144412)))

(declare-fun res!109063 () Bool)

(assert (=> b!222232 (=> (not res!109063) (not e!144412))))

(assert (=> b!222232 (= res!109063 (and (bvslt (size!5507 (_keys!6236 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5507 (_keys!6236 thiss!1504)))))))

(declare-fun lt!112645 () Unit!6612)

(assert (=> b!222232 (= lt!112645 e!144411)))

(declare-fun c!36935 () Bool)

(assert (=> b!222232 (= c!36935 (arrayContainsKey!0 (_keys!6236 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222233 () Bool)

(assert (=> b!222233 (= e!144409 e!144402)))

(declare-fun res!109078 () Bool)

(assert (=> b!222233 (=> (not res!109078) (not e!144402))))

(assert (=> b!222233 (= res!109078 (or (= lt!112644 (MissingZero!807 index!297)) (= lt!112644 (MissingVacant!807 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10909 (_ BitVec 32)) SeekEntryResult!807)

(assert (=> b!222233 (= lt!112644 (seekEntryOrOpen!0 key!932 (_keys!6236 thiss!1504) (mask!10000 thiss!1504)))))

(declare-fun b!222234 () Bool)

(declare-fun res!109077 () Bool)

(assert (=> b!222234 (=> (not res!109077) (not e!144412))))

(declare-fun noDuplicate!66 (List!3202) Bool)

(assert (=> b!222234 (= res!109077 (noDuplicate!66 Nil!3199))))

(assert (= (and start!21908 res!109068) b!222218))

(assert (= (and b!222218 res!109073) b!222233))

(assert (= (and b!222233 res!109078) b!222217))

(assert (= (and b!222217 c!36934) b!222212))

(assert (= (and b!222217 (not c!36934)) b!222225))

(assert (= (and b!222225 c!36937) b!222213))

(assert (= (and b!222225 (not c!36937)) b!222207))

(assert (= (and b!222213 res!109075) b!222216))

(assert (= (and b!222216 res!109065) b!222230))

(assert (= (and b!222207 c!36936) b!222214))

(assert (= (and b!222207 (not c!36936)) b!222219))

(assert (= (and b!222214 res!109067) b!222209))

(assert (= (and b!222209 res!109064) b!222211))

(assert (= (or b!222213 b!222214) bm!20733))

(assert (= (or b!222230 b!222211) bm!20732))

(assert (= (and b!222217 res!109066) b!222232))

(assert (= (and b!222232 c!36935) b!222228))

(assert (= (and b!222232 (not c!36935)) b!222223))

(assert (= (and b!222232 res!109063) b!222234))

(assert (= (and b!222234 res!109077) b!222231))

(assert (= (and b!222231 res!109072) b!222222))

(assert (= (and b!222222 res!109070) b!222227))

(assert (= (and b!222227 res!109071) b!222215))

(assert (= (and b!222227 (not res!109069)) b!222208))

(assert (= (and b!222208 res!109076) b!222210))

(assert (= (and b!222227 res!109074) b!222220))

(assert (= (and b!222224 condMapEmpty!9919) mapIsEmpty!9919))

(assert (= (and b!222224 (not condMapEmpty!9919)) mapNonEmpty!9919))

(assert (= (and mapNonEmpty!9919 ((_ is ValueCellFull!2573) mapValue!9919)) b!222229))

(assert (= (and b!222224 ((_ is ValueCellFull!2573) mapDefault!9919)) b!222226))

(assert (= b!222221 b!222224))

(assert (= start!21908 b!222221))

(declare-fun m!246607 () Bool)

(assert (=> mapNonEmpty!9919 m!246607))

(declare-fun m!246609 () Bool)

(assert (=> b!222212 m!246609))

(declare-fun m!246611 () Bool)

(assert (=> start!21908 m!246611))

(declare-fun m!246613 () Bool)

(assert (=> b!222221 m!246613))

(declare-fun m!246615 () Bool)

(assert (=> b!222221 m!246615))

(declare-fun m!246617 () Bool)

(assert (=> b!222234 m!246617))

(declare-fun m!246619 () Bool)

(assert (=> b!222209 m!246619))

(declare-fun m!246621 () Bool)

(assert (=> b!222210 m!246621))

(declare-fun m!246623 () Bool)

(assert (=> b!222228 m!246623))

(declare-fun m!246625 () Bool)

(assert (=> b!222232 m!246625))

(declare-fun m!246627 () Bool)

(assert (=> bm!20733 m!246627))

(declare-fun m!246629 () Bool)

(assert (=> b!222225 m!246629))

(declare-fun m!246631 () Bool)

(assert (=> b!222217 m!246631))

(declare-fun m!246633 () Bool)

(assert (=> b!222217 m!246633))

(assert (=> b!222217 m!246633))

(declare-fun m!246635 () Bool)

(assert (=> b!222217 m!246635))

(assert (=> b!222215 m!246621))

(declare-fun m!246637 () Bool)

(assert (=> b!222222 m!246637))

(declare-fun m!246639 () Bool)

(assert (=> b!222220 m!246639))

(declare-fun m!246641 () Bool)

(assert (=> b!222233 m!246641))

(declare-fun m!246643 () Bool)

(assert (=> b!222216 m!246643))

(assert (=> bm!20732 m!246625))

(declare-fun m!246645 () Bool)

(assert (=> b!222231 m!246645))

(check-sat (not b!222228) (not b!222231) tp_is_empty!5833 (not start!21908) (not b!222225) (not b!222222) (not b!222234) (not b!222220) (not b!222217) (not b!222215) (not b!222233) (not b!222212) (not mapNonEmpty!9919) (not b!222232) (not bm!20732) (not bm!20733) (not b!222221) b_and!12883 (not b!222210) (not b_next!5971))
(check-sat b_and!12883 (not b_next!5971))
