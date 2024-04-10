; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17402 () Bool)

(assert start!17402)

(declare-fun b!174671 () Bool)

(declare-fun b_free!4323 () Bool)

(declare-fun b_next!4323 () Bool)

(assert (=> b!174671 (= b_free!4323 (not b_next!4323))))

(declare-fun tp!15641 () Bool)

(declare-fun b_and!10791 () Bool)

(assert (=> b!174671 (= tp!15641 b_and!10791)))

(declare-fun b!174666 () Bool)

(declare-fun res!82841 () Bool)

(declare-fun e!115338 () Bool)

(assert (=> b!174666 (=> (not res!82841) (not e!115338))))

(declare-datatypes ((V!5107 0))(
  ( (V!5108 (val!2092 Int)) )
))
(declare-datatypes ((ValueCell!1704 0))(
  ( (ValueCellFull!1704 (v!3964 V!5107)) (EmptyCell!1704) )
))
(declare-datatypes ((array!7325 0))(
  ( (array!7326 (arr!3479 (Array (_ BitVec 32) (_ BitVec 64))) (size!3779 (_ BitVec 32))) )
))
(declare-datatypes ((array!7327 0))(
  ( (array!7328 (arr!3480 (Array (_ BitVec 32) ValueCell!1704)) (size!3780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2316 0))(
  ( (LongMapFixedSize!2317 (defaultEntry!3609 Int) (mask!8490 (_ BitVec 32)) (extraKeys!3346 (_ BitVec 32)) (zeroValue!3450 V!5107) (minValue!3450 V!5107) (_size!1207 (_ BitVec 32)) (_keys!5453 array!7325) (_values!3592 array!7327) (_vacant!1207 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2316)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3252 0))(
  ( (tuple2!3253 (_1!1637 (_ BitVec 64)) (_2!1637 V!5107)) )
))
(declare-datatypes ((List!2214 0))(
  ( (Nil!2211) (Cons!2210 (h!2827 tuple2!3252) (t!7028 List!2214)) )
))
(declare-datatypes ((ListLongMap!2179 0))(
  ( (ListLongMap!2180 (toList!1105 List!2214)) )
))
(declare-fun contains!1161 (ListLongMap!2179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!757 (array!7325 array!7327 (_ BitVec 32) (_ BitVec 32) V!5107 V!5107 (_ BitVec 32) Int) ListLongMap!2179)

(assert (=> b!174666 (= res!82841 (contains!1161 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)) key!828))))

(declare-fun b!174667 () Bool)

(declare-fun e!115341 () Bool)

(declare-fun tp_is_empty!4095 () Bool)

(assert (=> b!174667 (= e!115341 tp_is_empty!4095)))

(declare-fun b!174668 () Bool)

(assert (=> b!174668 (= e!115338 (not (= (size!3780 (_values!3592 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8490 thiss!1248)))))))

(declare-fun mapNonEmpty!6977 () Bool)

(declare-fun mapRes!6977 () Bool)

(declare-fun tp!15640 () Bool)

(declare-fun e!115339 () Bool)

(assert (=> mapNonEmpty!6977 (= mapRes!6977 (and tp!15640 e!115339))))

(declare-fun mapRest!6977 () (Array (_ BitVec 32) ValueCell!1704))

(declare-fun mapKey!6977 () (_ BitVec 32))

(declare-fun mapValue!6977 () ValueCell!1704)

(assert (=> mapNonEmpty!6977 (= (arr!3480 (_values!3592 thiss!1248)) (store mapRest!6977 mapKey!6977 mapValue!6977))))

(declare-fun b!174669 () Bool)

(declare-fun res!82842 () Bool)

(assert (=> b!174669 (=> (not res!82842) (not e!115338))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!546 0))(
  ( (MissingZero!546 (index!4352 (_ BitVec 32))) (Found!546 (index!4353 (_ BitVec 32))) (Intermediate!546 (undefined!1358 Bool) (index!4354 (_ BitVec 32)) (x!19234 (_ BitVec 32))) (Undefined!546) (MissingVacant!546 (index!4355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7325 (_ BitVec 32)) SeekEntryResult!546)

(assert (=> b!174669 (= res!82842 ((_ is Undefined!546) (seekEntryOrOpen!0 key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248))))))

(declare-fun b!174670 () Bool)

(assert (=> b!174670 (= e!115339 tp_is_empty!4095)))

(declare-fun mapIsEmpty!6977 () Bool)

(assert (=> mapIsEmpty!6977 mapRes!6977))

(declare-fun b!174672 () Bool)

(declare-fun res!82840 () Bool)

(assert (=> b!174672 (=> (not res!82840) (not e!115338))))

(assert (=> b!174672 (= res!82840 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174673 () Bool)

(declare-fun e!115340 () Bool)

(assert (=> b!174673 (= e!115340 (and e!115341 mapRes!6977))))

(declare-fun condMapEmpty!6977 () Bool)

(declare-fun mapDefault!6977 () ValueCell!1704)

(assert (=> b!174673 (= condMapEmpty!6977 (= (arr!3480 (_values!3592 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1704)) mapDefault!6977)))))

(declare-fun b!174674 () Bool)

(declare-fun res!82839 () Bool)

(assert (=> b!174674 (=> (not res!82839) (not e!115338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174674 (= res!82839 (validMask!0 (mask!8490 thiss!1248)))))

(declare-fun e!115337 () Bool)

(declare-fun array_inv!2227 (array!7325) Bool)

(declare-fun array_inv!2228 (array!7327) Bool)

(assert (=> b!174671 (= e!115337 (and tp!15641 tp_is_empty!4095 (array_inv!2227 (_keys!5453 thiss!1248)) (array_inv!2228 (_values!3592 thiss!1248)) e!115340))))

(declare-fun res!82838 () Bool)

(assert (=> start!17402 (=> (not res!82838) (not e!115338))))

(declare-fun valid!978 (LongMapFixedSize!2316) Bool)

(assert (=> start!17402 (= res!82838 (valid!978 thiss!1248))))

(assert (=> start!17402 e!115338))

(assert (=> start!17402 e!115337))

(assert (=> start!17402 true))

(assert (= (and start!17402 res!82838) b!174672))

(assert (= (and b!174672 res!82840) b!174669))

(assert (= (and b!174669 res!82842) b!174666))

(assert (= (and b!174666 res!82841) b!174674))

(assert (= (and b!174674 res!82839) b!174668))

(assert (= (and b!174673 condMapEmpty!6977) mapIsEmpty!6977))

(assert (= (and b!174673 (not condMapEmpty!6977)) mapNonEmpty!6977))

(assert (= (and mapNonEmpty!6977 ((_ is ValueCellFull!1704) mapValue!6977)) b!174670))

(assert (= (and b!174673 ((_ is ValueCellFull!1704) mapDefault!6977)) b!174667))

(assert (= b!174671 b!174673))

(assert (= start!17402 b!174671))

(declare-fun m!203667 () Bool)

(assert (=> b!174666 m!203667))

(assert (=> b!174666 m!203667))

(declare-fun m!203669 () Bool)

(assert (=> b!174666 m!203669))

(declare-fun m!203671 () Bool)

(assert (=> start!17402 m!203671))

(declare-fun m!203673 () Bool)

(assert (=> b!174669 m!203673))

(declare-fun m!203675 () Bool)

(assert (=> mapNonEmpty!6977 m!203675))

(declare-fun m!203677 () Bool)

(assert (=> b!174671 m!203677))

(declare-fun m!203679 () Bool)

(assert (=> b!174671 m!203679))

(declare-fun m!203681 () Bool)

(assert (=> b!174674 m!203681))

(check-sat (not b!174674) tp_is_empty!4095 (not b_next!4323) (not b!174666) (not mapNonEmpty!6977) b_and!10791 (not b!174671) (not b!174669) (not start!17402))
(check-sat b_and!10791 (not b_next!4323))
(get-model)

(declare-fun d!53293 () Bool)

(assert (=> d!53293 (= (array_inv!2227 (_keys!5453 thiss!1248)) (bvsge (size!3779 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174671 d!53293))

(declare-fun d!53295 () Bool)

(assert (=> d!53295 (= (array_inv!2228 (_values!3592 thiss!1248)) (bvsge (size!3780 (_values!3592 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174671 d!53295))

(declare-fun d!53297 () Bool)

(declare-fun res!82864 () Bool)

(declare-fun e!115362 () Bool)

(assert (=> d!53297 (=> (not res!82864) (not e!115362))))

(declare-fun simpleValid!146 (LongMapFixedSize!2316) Bool)

(assert (=> d!53297 (= res!82864 (simpleValid!146 thiss!1248))))

(assert (=> d!53297 (= (valid!978 thiss!1248) e!115362)))

(declare-fun b!174708 () Bool)

(declare-fun res!82865 () Bool)

(assert (=> b!174708 (=> (not res!82865) (not e!115362))))

(declare-fun arrayCountValidKeys!0 (array!7325 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174708 (= res!82865 (= (arrayCountValidKeys!0 (_keys!5453 thiss!1248) #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))) (_size!1207 thiss!1248)))))

(declare-fun b!174709 () Bool)

(declare-fun res!82866 () Bool)

(assert (=> b!174709 (=> (not res!82866) (not e!115362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7325 (_ BitVec 32)) Bool)

(assert (=> b!174709 (= res!82866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(declare-fun b!174710 () Bool)

(declare-datatypes ((List!2216 0))(
  ( (Nil!2213) (Cons!2212 (h!2829 (_ BitVec 64)) (t!7032 List!2216)) )
))
(declare-fun arrayNoDuplicates!0 (array!7325 (_ BitVec 32) List!2216) Bool)

(assert (=> b!174710 (= e!115362 (arrayNoDuplicates!0 (_keys!5453 thiss!1248) #b00000000000000000000000000000000 Nil!2213))))

(assert (= (and d!53297 res!82864) b!174708))

(assert (= (and b!174708 res!82865) b!174709))

(assert (= (and b!174709 res!82866) b!174710))

(declare-fun m!203699 () Bool)

(assert (=> d!53297 m!203699))

(declare-fun m!203701 () Bool)

(assert (=> b!174708 m!203701))

(declare-fun m!203703 () Bool)

(assert (=> b!174709 m!203703))

(declare-fun m!203705 () Bool)

(assert (=> b!174710 m!203705))

(assert (=> start!17402 d!53297))

(declare-fun b!174723 () Bool)

(declare-fun e!115371 () SeekEntryResult!546)

(assert (=> b!174723 (= e!115371 Undefined!546)))

(declare-fun b!174724 () Bool)

(declare-fun e!115369 () SeekEntryResult!546)

(declare-fun lt!86411 () SeekEntryResult!546)

(assert (=> b!174724 (= e!115369 (MissingZero!546 (index!4354 lt!86411)))))

(declare-fun b!174725 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7325 (_ BitVec 32)) SeekEntryResult!546)

(assert (=> b!174725 (= e!115369 (seekKeyOrZeroReturnVacant!0 (x!19234 lt!86411) (index!4354 lt!86411) (index!4354 lt!86411) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(declare-fun b!174726 () Bool)

(declare-fun c!31265 () Bool)

(declare-fun lt!86412 () (_ BitVec 64))

(assert (=> b!174726 (= c!31265 (= lt!86412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115370 () SeekEntryResult!546)

(assert (=> b!174726 (= e!115370 e!115369)))

(declare-fun b!174727 () Bool)

(assert (=> b!174727 (= e!115370 (Found!546 (index!4354 lt!86411)))))

(declare-fun d!53299 () Bool)

(declare-fun lt!86413 () SeekEntryResult!546)

(assert (=> d!53299 (and (or ((_ is Undefined!546) lt!86413) (not ((_ is Found!546) lt!86413)) (and (bvsge (index!4353 lt!86413) #b00000000000000000000000000000000) (bvslt (index!4353 lt!86413) (size!3779 (_keys!5453 thiss!1248))))) (or ((_ is Undefined!546) lt!86413) ((_ is Found!546) lt!86413) (not ((_ is MissingZero!546) lt!86413)) (and (bvsge (index!4352 lt!86413) #b00000000000000000000000000000000) (bvslt (index!4352 lt!86413) (size!3779 (_keys!5453 thiss!1248))))) (or ((_ is Undefined!546) lt!86413) ((_ is Found!546) lt!86413) ((_ is MissingZero!546) lt!86413) (not ((_ is MissingVacant!546) lt!86413)) (and (bvsge (index!4355 lt!86413) #b00000000000000000000000000000000) (bvslt (index!4355 lt!86413) (size!3779 (_keys!5453 thiss!1248))))) (or ((_ is Undefined!546) lt!86413) (ite ((_ is Found!546) lt!86413) (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4353 lt!86413)) key!828) (ite ((_ is MissingZero!546) lt!86413) (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4352 lt!86413)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!546) lt!86413) (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4355 lt!86413)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53299 (= lt!86413 e!115371)))

(declare-fun c!31264 () Bool)

(assert (=> d!53299 (= c!31264 (and ((_ is Intermediate!546) lt!86411) (undefined!1358 lt!86411)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7325 (_ BitVec 32)) SeekEntryResult!546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53299 (= lt!86411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8490 thiss!1248)) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(assert (=> d!53299 (validMask!0 (mask!8490 thiss!1248))))

(assert (=> d!53299 (= (seekEntryOrOpen!0 key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)) lt!86413)))

(declare-fun b!174728 () Bool)

(assert (=> b!174728 (= e!115371 e!115370)))

(assert (=> b!174728 (= lt!86412 (select (arr!3479 (_keys!5453 thiss!1248)) (index!4354 lt!86411)))))

(declare-fun c!31266 () Bool)

(assert (=> b!174728 (= c!31266 (= lt!86412 key!828))))

(assert (= (and d!53299 c!31264) b!174723))

(assert (= (and d!53299 (not c!31264)) b!174728))

(assert (= (and b!174728 c!31266) b!174727))

(assert (= (and b!174728 (not c!31266)) b!174726))

(assert (= (and b!174726 c!31265) b!174724))

(assert (= (and b!174726 (not c!31265)) b!174725))

(declare-fun m!203707 () Bool)

(assert (=> b!174725 m!203707))

(declare-fun m!203709 () Bool)

(assert (=> d!53299 m!203709))

(assert (=> d!53299 m!203681))

(declare-fun m!203711 () Bool)

(assert (=> d!53299 m!203711))

(declare-fun m!203713 () Bool)

(assert (=> d!53299 m!203713))

(declare-fun m!203715 () Bool)

(assert (=> d!53299 m!203715))

(assert (=> d!53299 m!203713))

(declare-fun m!203717 () Bool)

(assert (=> d!53299 m!203717))

(declare-fun m!203719 () Bool)

(assert (=> b!174728 m!203719))

(assert (=> b!174669 d!53299))

(declare-fun d!53301 () Bool)

(assert (=> d!53301 (= (validMask!0 (mask!8490 thiss!1248)) (and (or (= (mask!8490 thiss!1248) #b00000000000000000000000000000111) (= (mask!8490 thiss!1248) #b00000000000000000000000000001111) (= (mask!8490 thiss!1248) #b00000000000000000000000000011111) (= (mask!8490 thiss!1248) #b00000000000000000000000000111111) (= (mask!8490 thiss!1248) #b00000000000000000000000001111111) (= (mask!8490 thiss!1248) #b00000000000000000000000011111111) (= (mask!8490 thiss!1248) #b00000000000000000000000111111111) (= (mask!8490 thiss!1248) #b00000000000000000000001111111111) (= (mask!8490 thiss!1248) #b00000000000000000000011111111111) (= (mask!8490 thiss!1248) #b00000000000000000000111111111111) (= (mask!8490 thiss!1248) #b00000000000000000001111111111111) (= (mask!8490 thiss!1248) #b00000000000000000011111111111111) (= (mask!8490 thiss!1248) #b00000000000000000111111111111111) (= (mask!8490 thiss!1248) #b00000000000000001111111111111111) (= (mask!8490 thiss!1248) #b00000000000000011111111111111111) (= (mask!8490 thiss!1248) #b00000000000000111111111111111111) (= (mask!8490 thiss!1248) #b00000000000001111111111111111111) (= (mask!8490 thiss!1248) #b00000000000011111111111111111111) (= (mask!8490 thiss!1248) #b00000000000111111111111111111111) (= (mask!8490 thiss!1248) #b00000000001111111111111111111111) (= (mask!8490 thiss!1248) #b00000000011111111111111111111111) (= (mask!8490 thiss!1248) #b00000000111111111111111111111111) (= (mask!8490 thiss!1248) #b00000001111111111111111111111111) (= (mask!8490 thiss!1248) #b00000011111111111111111111111111) (= (mask!8490 thiss!1248) #b00000111111111111111111111111111) (= (mask!8490 thiss!1248) #b00001111111111111111111111111111) (= (mask!8490 thiss!1248) #b00011111111111111111111111111111) (= (mask!8490 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8490 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174674 d!53301))

(declare-fun d!53303 () Bool)

(declare-fun e!115376 () Bool)

(assert (=> d!53303 e!115376))

(declare-fun res!82869 () Bool)

(assert (=> d!53303 (=> res!82869 e!115376)))

(declare-fun lt!86423 () Bool)

(assert (=> d!53303 (= res!82869 (not lt!86423))))

(declare-fun lt!86425 () Bool)

(assert (=> d!53303 (= lt!86423 lt!86425)))

(declare-datatypes ((Unit!5368 0))(
  ( (Unit!5369) )
))
(declare-fun lt!86424 () Unit!5368)

(declare-fun e!115377 () Unit!5368)

(assert (=> d!53303 (= lt!86424 e!115377)))

(declare-fun c!31269 () Bool)

(assert (=> d!53303 (= c!31269 lt!86425)))

(declare-fun containsKey!191 (List!2214 (_ BitVec 64)) Bool)

(assert (=> d!53303 (= lt!86425 (containsKey!191 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(assert (=> d!53303 (= (contains!1161 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)) key!828) lt!86423)))

(declare-fun b!174735 () Bool)

(declare-fun lt!86422 () Unit!5368)

(assert (=> b!174735 (= e!115377 lt!86422)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!139 (List!2214 (_ BitVec 64)) Unit!5368)

(assert (=> b!174735 (= lt!86422 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(declare-datatypes ((Option!193 0))(
  ( (Some!192 (v!3966 V!5107)) (None!191) )
))
(declare-fun isDefined!140 (Option!193) Bool)

(declare-fun getValueByKey!187 (List!2214 (_ BitVec 64)) Option!193)

(assert (=> b!174735 (isDefined!140 (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(declare-fun b!174736 () Bool)

(declare-fun Unit!5370 () Unit!5368)

(assert (=> b!174736 (= e!115377 Unit!5370)))

(declare-fun b!174737 () Bool)

(assert (=> b!174737 (= e!115376 (isDefined!140 (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828)))))

(assert (= (and d!53303 c!31269) b!174735))

(assert (= (and d!53303 (not c!31269)) b!174736))

(assert (= (and d!53303 (not res!82869)) b!174737))

(declare-fun m!203721 () Bool)

(assert (=> d!53303 m!203721))

(declare-fun m!203723 () Bool)

(assert (=> b!174735 m!203723))

(declare-fun m!203725 () Bool)

(assert (=> b!174735 m!203725))

(assert (=> b!174735 m!203725))

(declare-fun m!203727 () Bool)

(assert (=> b!174735 m!203727))

(assert (=> b!174737 m!203725))

(assert (=> b!174737 m!203725))

(assert (=> b!174737 m!203727))

(assert (=> b!174666 d!53303))

(declare-fun bm!17704 () Bool)

(declare-fun call!17709 () Bool)

(declare-fun lt!86491 () ListLongMap!2179)

(assert (=> bm!17704 (= call!17709 (contains!1161 lt!86491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174780 () Bool)

(declare-fun e!115408 () Bool)

(declare-fun e!115405 () Bool)

(assert (=> b!174780 (= e!115408 e!115405)))

(declare-fun res!82888 () Bool)

(assert (=> b!174780 (=> (not res!82888) (not e!115405))))

(assert (=> b!174780 (= res!82888 (contains!1161 lt!86491 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun bm!17705 () Bool)

(declare-fun call!17710 () ListLongMap!2179)

(declare-fun call!17712 () ListLongMap!2179)

(assert (=> bm!17705 (= call!17710 call!17712)))

(declare-fun b!174781 () Bool)

(declare-fun e!115406 () Unit!5368)

(declare-fun Unit!5371 () Unit!5368)

(assert (=> b!174781 (= e!115406 Unit!5371)))

(declare-fun b!174782 () Bool)

(declare-fun e!115407 () ListLongMap!2179)

(assert (=> b!174782 (= e!115407 call!17710)))

(declare-fun b!174783 () Bool)

(declare-fun e!115414 () Bool)

(declare-fun call!17707 () Bool)

(assert (=> b!174783 (= e!115414 (not call!17707))))

(declare-fun bm!17706 () Bool)

(assert (=> bm!17706 (= call!17707 (contains!1161 lt!86491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174784 () Bool)

(declare-fun e!115412 () ListLongMap!2179)

(declare-fun +!249 (ListLongMap!2179 tuple2!3252) ListLongMap!2179)

(assert (=> b!174784 (= e!115412 (+!249 call!17712 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))

(declare-fun b!174785 () Bool)

(declare-fun lt!86475 () Unit!5368)

(assert (=> b!174785 (= e!115406 lt!86475)))

(declare-fun lt!86489 () ListLongMap!2179)

(declare-fun getCurrentListMapNoExtraKeys!165 (array!7325 array!7327 (_ BitVec 32) (_ BitVec 32) V!5107 V!5107 (_ BitVec 32) Int) ListLongMap!2179)

(assert (=> b!174785 (= lt!86489 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))

(declare-fun lt!86474 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86479 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86479 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86487 () Unit!5368)

(declare-fun addStillContains!108 (ListLongMap!2179 (_ BitVec 64) V!5107 (_ BitVec 64)) Unit!5368)

(assert (=> b!174785 (= lt!86487 (addStillContains!108 lt!86489 lt!86474 (zeroValue!3450 thiss!1248) lt!86479))))

(assert (=> b!174785 (contains!1161 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) lt!86479)))

(declare-fun lt!86473 () Unit!5368)

(assert (=> b!174785 (= lt!86473 lt!86487)))

(declare-fun lt!86484 () ListLongMap!2179)

(assert (=> b!174785 (= lt!86484 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))

(declare-fun lt!86480 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86477 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86477 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86478 () Unit!5368)

(declare-fun addApplyDifferent!108 (ListLongMap!2179 (_ BitVec 64) V!5107 (_ BitVec 64)) Unit!5368)

(assert (=> b!174785 (= lt!86478 (addApplyDifferent!108 lt!86484 lt!86480 (minValue!3450 thiss!1248) lt!86477))))

(declare-fun apply!132 (ListLongMap!2179 (_ BitVec 64)) V!5107)

(assert (=> b!174785 (= (apply!132 (+!249 lt!86484 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) lt!86477) (apply!132 lt!86484 lt!86477))))

(declare-fun lt!86472 () Unit!5368)

(assert (=> b!174785 (= lt!86472 lt!86478)))

(declare-fun lt!86488 () ListLongMap!2179)

(assert (=> b!174785 (= lt!86488 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))

(declare-fun lt!86485 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86471 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86471 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86482 () Unit!5368)

(assert (=> b!174785 (= lt!86482 (addApplyDifferent!108 lt!86488 lt!86485 (zeroValue!3450 thiss!1248) lt!86471))))

(assert (=> b!174785 (= (apply!132 (+!249 lt!86488 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) lt!86471) (apply!132 lt!86488 lt!86471))))

(declare-fun lt!86476 () Unit!5368)

(assert (=> b!174785 (= lt!86476 lt!86482)))

(declare-fun lt!86483 () ListLongMap!2179)

(assert (=> b!174785 (= lt!86483 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))

(declare-fun lt!86470 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86470 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86481 () (_ BitVec 64))

(assert (=> b!174785 (= lt!86481 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174785 (= lt!86475 (addApplyDifferent!108 lt!86483 lt!86470 (minValue!3450 thiss!1248) lt!86481))))

(assert (=> b!174785 (= (apply!132 (+!249 lt!86483 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) lt!86481) (apply!132 lt!86483 lt!86481))))

(declare-fun b!174786 () Bool)

(declare-fun e!115413 () ListLongMap!2179)

(declare-fun call!17711 () ListLongMap!2179)

(assert (=> b!174786 (= e!115413 call!17711)))

(declare-fun c!31285 () Bool)

(declare-fun bm!17707 () Bool)

(declare-fun call!17708 () ListLongMap!2179)

(declare-fun c!31283 () Bool)

(declare-fun call!17713 () ListLongMap!2179)

(assert (=> bm!17707 (= call!17712 (+!249 (ite c!31285 call!17708 (ite c!31283 call!17713 call!17711)) (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(declare-fun b!174787 () Bool)

(declare-fun res!82890 () Bool)

(declare-fun e!115409 () Bool)

(assert (=> b!174787 (=> (not res!82890) (not e!115409))))

(assert (=> b!174787 (= res!82890 e!115414)))

(declare-fun c!31287 () Bool)

(assert (=> b!174787 (= c!31287 (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17708 () Bool)

(assert (=> bm!17708 (= call!17713 call!17708)))

(declare-fun b!174788 () Bool)

(declare-fun e!115404 () Bool)

(assert (=> b!174788 (= e!115404 (= (apply!132 lt!86491 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3450 thiss!1248)))))

(declare-fun bm!17709 () Bool)

(assert (=> bm!17709 (= call!17711 call!17713)))

(declare-fun b!174789 () Bool)

(assert (=> b!174789 (= e!115414 e!115404)))

(declare-fun res!82893 () Bool)

(assert (=> b!174789 (= res!82893 call!17707)))

(assert (=> b!174789 (=> (not res!82893) (not e!115404))))

(declare-fun b!174790 () Bool)

(declare-fun e!115410 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174790 (= e!115410 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174791 () Bool)

(declare-fun e!115415 () Bool)

(assert (=> b!174791 (= e!115415 (= (apply!132 lt!86491 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3450 thiss!1248)))))

(declare-fun b!174792 () Bool)

(declare-fun c!31282 () Bool)

(assert (=> b!174792 (= c!31282 (and (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!174792 (= e!115407 e!115413)))

(declare-fun b!174793 () Bool)

(assert (=> b!174793 (= e!115413 call!17710)))

(declare-fun b!174794 () Bool)

(declare-fun get!1977 (ValueCell!1704 V!5107) V!5107)

(declare-fun dynLambda!475 (Int (_ BitVec 64)) V!5107)

(assert (=> b!174794 (= e!115405 (= (apply!132 lt!86491 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)) (get!1977 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3780 (_values!3592 thiss!1248))))))

(assert (=> b!174794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun b!174795 () Bool)

(declare-fun e!115416 () Bool)

(assert (=> b!174795 (= e!115416 e!115415)))

(declare-fun res!82892 () Bool)

(assert (=> b!174795 (= res!82892 call!17709)))

(assert (=> b!174795 (=> (not res!82892) (not e!115415))))

(declare-fun b!174796 () Bool)

(declare-fun e!115411 () Bool)

(assert (=> b!174796 (= e!115411 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174797 () Bool)

(assert (=> b!174797 (= e!115412 e!115407)))

(assert (=> b!174797 (= c!31283 (and (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174798 () Bool)

(assert (=> b!174798 (= e!115416 (not call!17709))))

(declare-fun b!174799 () Bool)

(assert (=> b!174799 (= e!115409 e!115416)))

(declare-fun c!31284 () Bool)

(assert (=> b!174799 (= c!31284 (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17710 () Bool)

(assert (=> bm!17710 (= call!17708 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))

(declare-fun b!174800 () Bool)

(declare-fun res!82896 () Bool)

(assert (=> b!174800 (=> (not res!82896) (not e!115409))))

(assert (=> b!174800 (= res!82896 e!115408)))

(declare-fun res!82889 () Bool)

(assert (=> b!174800 (=> res!82889 e!115408)))

(assert (=> b!174800 (= res!82889 (not e!115411))))

(declare-fun res!82891 () Bool)

(assert (=> b!174800 (=> (not res!82891) (not e!115411))))

(assert (=> b!174800 (= res!82891 (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun d!53305 () Bool)

(assert (=> d!53305 e!115409))

(declare-fun res!82895 () Bool)

(assert (=> d!53305 (=> (not res!82895) (not e!115409))))

(assert (=> d!53305 (= res!82895 (or (bvsge #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))))

(declare-fun lt!86490 () ListLongMap!2179)

(assert (=> d!53305 (= lt!86491 lt!86490)))

(declare-fun lt!86486 () Unit!5368)

(assert (=> d!53305 (= lt!86486 e!115406)))

(declare-fun c!31286 () Bool)

(assert (=> d!53305 (= c!31286 e!115410)))

(declare-fun res!82894 () Bool)

(assert (=> d!53305 (=> (not res!82894) (not e!115410))))

(assert (=> d!53305 (= res!82894 (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53305 (= lt!86490 e!115412)))

(assert (=> d!53305 (= c!31285 (and (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3346 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53305 (validMask!0 (mask!8490 thiss!1248))))

(assert (=> d!53305 (= (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)) lt!86491)))

(assert (= (and d!53305 c!31285) b!174784))

(assert (= (and d!53305 (not c!31285)) b!174797))

(assert (= (and b!174797 c!31283) b!174782))

(assert (= (and b!174797 (not c!31283)) b!174792))

(assert (= (and b!174792 c!31282) b!174793))

(assert (= (and b!174792 (not c!31282)) b!174786))

(assert (= (or b!174793 b!174786) bm!17709))

(assert (= (or b!174782 bm!17709) bm!17708))

(assert (= (or b!174782 b!174793) bm!17705))

(assert (= (or b!174784 bm!17708) bm!17710))

(assert (= (or b!174784 bm!17705) bm!17707))

(assert (= (and d!53305 res!82894) b!174790))

(assert (= (and d!53305 c!31286) b!174785))

(assert (= (and d!53305 (not c!31286)) b!174781))

(assert (= (and d!53305 res!82895) b!174800))

(assert (= (and b!174800 res!82891) b!174796))

(assert (= (and b!174800 (not res!82889)) b!174780))

(assert (= (and b!174780 res!82888) b!174794))

(assert (= (and b!174800 res!82896) b!174787))

(assert (= (and b!174787 c!31287) b!174789))

(assert (= (and b!174787 (not c!31287)) b!174783))

(assert (= (and b!174789 res!82893) b!174788))

(assert (= (or b!174789 b!174783) bm!17706))

(assert (= (and b!174787 res!82890) b!174799))

(assert (= (and b!174799 c!31284) b!174795))

(assert (= (and b!174799 (not c!31284)) b!174798))

(assert (= (and b!174795 res!82892) b!174791))

(assert (= (or b!174795 b!174798) bm!17704))

(declare-fun b_lambda!6987 () Bool)

(assert (=> (not b_lambda!6987) (not b!174794)))

(declare-fun t!7031 () Bool)

(declare-fun tb!2775 () Bool)

(assert (=> (and b!174671 (= (defaultEntry!3609 thiss!1248) (defaultEntry!3609 thiss!1248)) t!7031) tb!2775))

(declare-fun result!4599 () Bool)

(assert (=> tb!2775 (= result!4599 tp_is_empty!4095)))

(assert (=> b!174794 t!7031))

(declare-fun b_and!10795 () Bool)

(assert (= b_and!10791 (and (=> t!7031 result!4599) b_and!10795)))

(declare-fun m!203729 () Bool)

(assert (=> b!174788 m!203729))

(declare-fun m!203731 () Bool)

(assert (=> b!174791 m!203731))

(declare-fun m!203733 () Bool)

(assert (=> bm!17710 m!203733))

(assert (=> d!53305 m!203681))

(declare-fun m!203735 () Bool)

(assert (=> b!174780 m!203735))

(assert (=> b!174780 m!203735))

(declare-fun m!203737 () Bool)

(assert (=> b!174780 m!203737))

(declare-fun m!203739 () Bool)

(assert (=> b!174794 m!203739))

(assert (=> b!174794 m!203739))

(declare-fun m!203741 () Bool)

(assert (=> b!174794 m!203741))

(declare-fun m!203743 () Bool)

(assert (=> b!174794 m!203743))

(assert (=> b!174794 m!203735))

(declare-fun m!203745 () Bool)

(assert (=> b!174794 m!203745))

(assert (=> b!174794 m!203741))

(assert (=> b!174794 m!203735))

(declare-fun m!203747 () Bool)

(assert (=> bm!17706 m!203747))

(assert (=> b!174796 m!203735))

(assert (=> b!174796 m!203735))

(declare-fun m!203749 () Bool)

(assert (=> b!174796 m!203749))

(declare-fun m!203751 () Bool)

(assert (=> bm!17707 m!203751))

(declare-fun m!203753 () Bool)

(assert (=> bm!17704 m!203753))

(declare-fun m!203755 () Bool)

(assert (=> b!174784 m!203755))

(assert (=> b!174790 m!203735))

(assert (=> b!174790 m!203735))

(assert (=> b!174790 m!203749))

(declare-fun m!203757 () Bool)

(assert (=> b!174785 m!203757))

(declare-fun m!203759 () Bool)

(assert (=> b!174785 m!203759))

(declare-fun m!203761 () Bool)

(assert (=> b!174785 m!203761))

(declare-fun m!203763 () Bool)

(assert (=> b!174785 m!203763))

(declare-fun m!203765 () Bool)

(assert (=> b!174785 m!203765))

(declare-fun m!203767 () Bool)

(assert (=> b!174785 m!203767))

(declare-fun m!203769 () Bool)

(assert (=> b!174785 m!203769))

(assert (=> b!174785 m!203761))

(assert (=> b!174785 m!203735))

(declare-fun m!203771 () Bool)

(assert (=> b!174785 m!203771))

(declare-fun m!203773 () Bool)

(assert (=> b!174785 m!203773))

(declare-fun m!203775 () Bool)

(assert (=> b!174785 m!203775))

(declare-fun m!203777 () Bool)

(assert (=> b!174785 m!203777))

(declare-fun m!203779 () Bool)

(assert (=> b!174785 m!203779))

(declare-fun m!203781 () Bool)

(assert (=> b!174785 m!203781))

(assert (=> b!174785 m!203733))

(declare-fun m!203783 () Bool)

(assert (=> b!174785 m!203783))

(assert (=> b!174785 m!203757))

(assert (=> b!174785 m!203783))

(declare-fun m!203785 () Bool)

(assert (=> b!174785 m!203785))

(assert (=> b!174785 m!203777))

(assert (=> b!174666 d!53305))

(declare-fun mapIsEmpty!6983 () Bool)

(declare-fun mapRes!6983 () Bool)

(assert (=> mapIsEmpty!6983 mapRes!6983))

(declare-fun b!174809 () Bool)

(declare-fun e!115421 () Bool)

(assert (=> b!174809 (= e!115421 tp_is_empty!4095)))

(declare-fun mapNonEmpty!6983 () Bool)

(declare-fun tp!15650 () Bool)

(assert (=> mapNonEmpty!6983 (= mapRes!6983 (and tp!15650 e!115421))))

(declare-fun mapValue!6983 () ValueCell!1704)

(declare-fun mapRest!6983 () (Array (_ BitVec 32) ValueCell!1704))

(declare-fun mapKey!6983 () (_ BitVec 32))

(assert (=> mapNonEmpty!6983 (= mapRest!6977 (store mapRest!6983 mapKey!6983 mapValue!6983))))

(declare-fun b!174810 () Bool)

(declare-fun e!115422 () Bool)

(assert (=> b!174810 (= e!115422 tp_is_empty!4095)))

(declare-fun condMapEmpty!6983 () Bool)

(declare-fun mapDefault!6983 () ValueCell!1704)

(assert (=> mapNonEmpty!6977 (= condMapEmpty!6983 (= mapRest!6977 ((as const (Array (_ BitVec 32) ValueCell!1704)) mapDefault!6983)))))

(assert (=> mapNonEmpty!6977 (= tp!15640 (and e!115422 mapRes!6983))))

(assert (= (and mapNonEmpty!6977 condMapEmpty!6983) mapIsEmpty!6983))

(assert (= (and mapNonEmpty!6977 (not condMapEmpty!6983)) mapNonEmpty!6983))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1704) mapValue!6983)) b!174809))

(assert (= (and mapNonEmpty!6977 ((_ is ValueCellFull!1704) mapDefault!6983)) b!174810))

(declare-fun m!203787 () Bool)

(assert (=> mapNonEmpty!6983 m!203787))

(declare-fun b_lambda!6989 () Bool)

(assert (= b_lambda!6987 (or (and b!174671 b_free!4323) b_lambda!6989)))

(check-sat (not b!174796) (not bm!17706) (not b!174708) (not b_next!4323) (not bm!17707) b_and!10795 (not b!174791) (not b!174709) (not b!174725) (not b!174780) (not b_lambda!6989) (not b!174785) (not d!53297) (not b!174784) (not b!174735) tp_is_empty!4095 (not b!174710) (not b!174790) (not b!174737) (not d!53305) (not bm!17710) (not mapNonEmpty!6983) (not bm!17704) (not b!174794) (not d!53299) (not b!174788) (not d!53303))
(check-sat b_and!10795 (not b_next!4323))
(get-model)

(declare-fun d!53307 () Bool)

(declare-fun isEmpty!439 (Option!193) Bool)

(assert (=> d!53307 (= (isDefined!140 (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828)) (not (isEmpty!439 (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))))

(declare-fun bs!7216 () Bool)

(assert (= bs!7216 d!53307))

(assert (=> bs!7216 m!203725))

(declare-fun m!203789 () Bool)

(assert (=> bs!7216 m!203789))

(assert (=> b!174737 d!53307))

(declare-fun d!53309 () Bool)

(declare-fun c!31292 () Bool)

(assert (=> d!53309 (= c!31292 (and ((_ is Cons!2210) (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) (= (_1!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) key!828)))))

(declare-fun e!115427 () Option!193)

(assert (=> d!53309 (= (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828) e!115427)))

(declare-fun b!174821 () Bool)

(declare-fun e!115428 () Option!193)

(assert (=> b!174821 (= e!115428 (getValueByKey!187 (t!7028 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) key!828))))

(declare-fun b!174820 () Bool)

(assert (=> b!174820 (= e!115427 e!115428)))

(declare-fun c!31293 () Bool)

(assert (=> b!174820 (= c!31293 (and ((_ is Cons!2210) (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) (not (= (_1!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) key!828))))))

(declare-fun b!174819 () Bool)

(assert (=> b!174819 (= e!115427 (Some!192 (_2!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))))))

(declare-fun b!174822 () Bool)

(assert (=> b!174822 (= e!115428 None!191)))

(assert (= (and d!53309 c!31292) b!174819))

(assert (= (and d!53309 (not c!31292)) b!174820))

(assert (= (and b!174820 c!31293) b!174821))

(assert (= (and b!174820 (not c!31293)) b!174822))

(declare-fun m!203791 () Bool)

(assert (=> b!174821 m!203791))

(assert (=> b!174737 d!53309))

(declare-fun d!53311 () Bool)

(assert (=> d!53311 (contains!1161 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) lt!86479)))

(declare-fun lt!86494 () Unit!5368)

(declare-fun choose!934 (ListLongMap!2179 (_ BitVec 64) V!5107 (_ BitVec 64)) Unit!5368)

(assert (=> d!53311 (= lt!86494 (choose!934 lt!86489 lt!86474 (zeroValue!3450 thiss!1248) lt!86479))))

(assert (=> d!53311 (contains!1161 lt!86489 lt!86479)))

(assert (=> d!53311 (= (addStillContains!108 lt!86489 lt!86474 (zeroValue!3450 thiss!1248) lt!86479) lt!86494)))

(declare-fun bs!7217 () Bool)

(assert (= bs!7217 d!53311))

(assert (=> bs!7217 m!203783))

(assert (=> bs!7217 m!203783))

(assert (=> bs!7217 m!203785))

(declare-fun m!203793 () Bool)

(assert (=> bs!7217 m!203793))

(declare-fun m!203795 () Bool)

(assert (=> bs!7217 m!203795))

(assert (=> b!174785 d!53311))

(declare-fun b!174848 () Bool)

(declare-fun e!115449 () Bool)

(declare-fun e!115444 () Bool)

(assert (=> b!174848 (= e!115449 e!115444)))

(declare-fun c!31305 () Bool)

(assert (=> b!174848 (= c!31305 (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun b!174849 () Bool)

(declare-fun lt!86514 () ListLongMap!2179)

(assert (=> b!174849 (= e!115444 (= lt!86514 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3609 thiss!1248))))))

(declare-fun b!174850 () Bool)

(declare-fun isEmpty!440 (ListLongMap!2179) Bool)

(assert (=> b!174850 (= e!115444 (isEmpty!440 lt!86514))))

(declare-fun b!174851 () Bool)

(declare-fun res!82907 () Bool)

(declare-fun e!115448 () Bool)

(assert (=> b!174851 (=> (not res!82907) (not e!115448))))

(assert (=> b!174851 (= res!82907 (not (contains!1161 lt!86514 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174852 () Bool)

(declare-fun lt!86510 () Unit!5368)

(declare-fun lt!86512 () Unit!5368)

(assert (=> b!174852 (= lt!86510 lt!86512)))

(declare-fun lt!86515 () (_ BitVec 64))

(declare-fun lt!86513 () ListLongMap!2179)

(declare-fun lt!86511 () (_ BitVec 64))

(declare-fun lt!86509 () V!5107)

(assert (=> b!174852 (not (contains!1161 (+!249 lt!86513 (tuple2!3253 lt!86511 lt!86509)) lt!86515))))

(declare-fun addStillNotContains!73 (ListLongMap!2179 (_ BitVec 64) V!5107 (_ BitVec 64)) Unit!5368)

(assert (=> b!174852 (= lt!86512 (addStillNotContains!73 lt!86513 lt!86511 lt!86509 lt!86515))))

(assert (=> b!174852 (= lt!86515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174852 (= lt!86509 (get!1977 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174852 (= lt!86511 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17716 () ListLongMap!2179)

(assert (=> b!174852 (= lt!86513 call!17716)))

(declare-fun e!115447 () ListLongMap!2179)

(assert (=> b!174852 (= e!115447 (+!249 call!17716 (tuple2!3253 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000) (get!1977 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174853 () Bool)

(declare-fun e!115445 () Bool)

(assert (=> b!174853 (= e!115449 e!115445)))

(assert (=> b!174853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun res!82908 () Bool)

(assert (=> b!174853 (= res!82908 (contains!1161 lt!86514 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174853 (=> (not res!82908) (not e!115445))))

(declare-fun bm!17713 () Bool)

(assert (=> bm!17713 (= call!17716 (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3609 thiss!1248)))))

(declare-fun b!174854 () Bool)

(declare-fun e!115446 () ListLongMap!2179)

(assert (=> b!174854 (= e!115446 e!115447)))

(declare-fun c!31302 () Bool)

(assert (=> b!174854 (= c!31302 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174855 () Bool)

(assert (=> b!174855 (= e!115448 e!115449)))

(declare-fun c!31304 () Bool)

(declare-fun e!115443 () Bool)

(assert (=> b!174855 (= c!31304 e!115443)))

(declare-fun res!82906 () Bool)

(assert (=> b!174855 (=> (not res!82906) (not e!115443))))

(assert (=> b!174855 (= res!82906 (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun b!174856 () Bool)

(assert (=> b!174856 (= e!115446 (ListLongMap!2180 Nil!2211))))

(declare-fun d!53313 () Bool)

(assert (=> d!53313 e!115448))

(declare-fun res!82905 () Bool)

(assert (=> d!53313 (=> (not res!82905) (not e!115448))))

(assert (=> d!53313 (= res!82905 (not (contains!1161 lt!86514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53313 (= lt!86514 e!115446)))

(declare-fun c!31303 () Bool)

(assert (=> d!53313 (= c!31303 (bvsge #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53313 (validMask!0 (mask!8490 thiss!1248))))

(assert (=> d!53313 (= (getCurrentListMapNoExtraKeys!165 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)) lt!86514)))

(declare-fun b!174857 () Bool)

(assert (=> b!174857 (= e!115447 call!17716)))

(declare-fun b!174858 () Bool)

(assert (=> b!174858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> b!174858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3780 (_values!3592 thiss!1248))))))

(assert (=> b!174858 (= e!115445 (= (apply!132 lt!86514 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)) (get!1977 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174859 () Bool)

(assert (=> b!174859 (= e!115443 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174859 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!53313 c!31303) b!174856))

(assert (= (and d!53313 (not c!31303)) b!174854))

(assert (= (and b!174854 c!31302) b!174852))

(assert (= (and b!174854 (not c!31302)) b!174857))

(assert (= (or b!174852 b!174857) bm!17713))

(assert (= (and d!53313 res!82905) b!174851))

(assert (= (and b!174851 res!82907) b!174855))

(assert (= (and b!174855 res!82906) b!174859))

(assert (= (and b!174855 c!31304) b!174853))

(assert (= (and b!174855 (not c!31304)) b!174848))

(assert (= (and b!174853 res!82908) b!174858))

(assert (= (and b!174848 c!31305) b!174849))

(assert (= (and b!174848 (not c!31305)) b!174850))

(declare-fun b_lambda!6991 () Bool)

(assert (=> (not b_lambda!6991) (not b!174852)))

(assert (=> b!174852 t!7031))

(declare-fun b_and!10797 () Bool)

(assert (= b_and!10795 (and (=> t!7031 result!4599) b_and!10797)))

(declare-fun b_lambda!6993 () Bool)

(assert (=> (not b_lambda!6993) (not b!174858)))

(assert (=> b!174858 t!7031))

(declare-fun b_and!10799 () Bool)

(assert (= b_and!10797 (and (=> t!7031 result!4599) b_and!10799)))

(assert (=> b!174853 m!203735))

(assert (=> b!174853 m!203735))

(declare-fun m!203797 () Bool)

(assert (=> b!174853 m!203797))

(assert (=> b!174859 m!203735))

(assert (=> b!174859 m!203735))

(assert (=> b!174859 m!203749))

(declare-fun m!203799 () Bool)

(assert (=> b!174850 m!203799))

(declare-fun m!203801 () Bool)

(assert (=> b!174849 m!203801))

(assert (=> bm!17713 m!203801))

(declare-fun m!203803 () Bool)

(assert (=> b!174851 m!203803))

(assert (=> b!174854 m!203735))

(assert (=> b!174854 m!203735))

(assert (=> b!174854 m!203749))

(declare-fun m!203805 () Bool)

(assert (=> d!53313 m!203805))

(assert (=> d!53313 m!203681))

(assert (=> b!174858 m!203735))

(declare-fun m!203807 () Bool)

(assert (=> b!174858 m!203807))

(assert (=> b!174858 m!203739))

(assert (=> b!174858 m!203739))

(assert (=> b!174858 m!203741))

(assert (=> b!174858 m!203743))

(assert (=> b!174858 m!203735))

(assert (=> b!174858 m!203741))

(declare-fun m!203809 () Bool)

(assert (=> b!174852 m!203809))

(assert (=> b!174852 m!203739))

(assert (=> b!174852 m!203739))

(assert (=> b!174852 m!203741))

(assert (=> b!174852 m!203743))

(declare-fun m!203811 () Bool)

(assert (=> b!174852 m!203811))

(assert (=> b!174852 m!203735))

(assert (=> b!174852 m!203741))

(assert (=> b!174852 m!203811))

(declare-fun m!203813 () Bool)

(assert (=> b!174852 m!203813))

(declare-fun m!203815 () Bool)

(assert (=> b!174852 m!203815))

(assert (=> b!174785 d!53313))

(declare-fun d!53315 () Bool)

(declare-fun get!1978 (Option!193) V!5107)

(assert (=> d!53315 (= (apply!132 lt!86483 lt!86481) (get!1978 (getValueByKey!187 (toList!1105 lt!86483) lt!86481)))))

(declare-fun bs!7218 () Bool)

(assert (= bs!7218 d!53315))

(declare-fun m!203817 () Bool)

(assert (=> bs!7218 m!203817))

(assert (=> bs!7218 m!203817))

(declare-fun m!203819 () Bool)

(assert (=> bs!7218 m!203819))

(assert (=> b!174785 d!53315))

(declare-fun d!53317 () Bool)

(assert (=> d!53317 (= (apply!132 (+!249 lt!86483 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) lt!86481) (get!1978 (getValueByKey!187 (toList!1105 (+!249 lt!86483 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))) lt!86481)))))

(declare-fun bs!7219 () Bool)

(assert (= bs!7219 d!53317))

(declare-fun m!203821 () Bool)

(assert (=> bs!7219 m!203821))

(assert (=> bs!7219 m!203821))

(declare-fun m!203823 () Bool)

(assert (=> bs!7219 m!203823))

(assert (=> b!174785 d!53317))

(declare-fun d!53319 () Bool)

(assert (=> d!53319 (= (apply!132 (+!249 lt!86488 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) lt!86471) (get!1978 (getValueByKey!187 (toList!1105 (+!249 lt!86488 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))) lt!86471)))))

(declare-fun bs!7220 () Bool)

(assert (= bs!7220 d!53319))

(declare-fun m!203825 () Bool)

(assert (=> bs!7220 m!203825))

(assert (=> bs!7220 m!203825))

(declare-fun m!203827 () Bool)

(assert (=> bs!7220 m!203827))

(assert (=> b!174785 d!53319))

(declare-fun d!53321 () Bool)

(assert (=> d!53321 (= (apply!132 (+!249 lt!86488 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) lt!86471) (apply!132 lt!86488 lt!86471))))

(declare-fun lt!86518 () Unit!5368)

(declare-fun choose!935 (ListLongMap!2179 (_ BitVec 64) V!5107 (_ BitVec 64)) Unit!5368)

(assert (=> d!53321 (= lt!86518 (choose!935 lt!86488 lt!86485 (zeroValue!3450 thiss!1248) lt!86471))))

(declare-fun e!115452 () Bool)

(assert (=> d!53321 e!115452))

(declare-fun res!82911 () Bool)

(assert (=> d!53321 (=> (not res!82911) (not e!115452))))

(assert (=> d!53321 (= res!82911 (contains!1161 lt!86488 lt!86471))))

(assert (=> d!53321 (= (addApplyDifferent!108 lt!86488 lt!86485 (zeroValue!3450 thiss!1248) lt!86471) lt!86518)))

(declare-fun b!174863 () Bool)

(assert (=> b!174863 (= e!115452 (not (= lt!86471 lt!86485)))))

(assert (= (and d!53321 res!82911) b!174863))

(assert (=> d!53321 m!203777))

(assert (=> d!53321 m!203779))

(assert (=> d!53321 m!203777))

(declare-fun m!203829 () Bool)

(assert (=> d!53321 m!203829))

(assert (=> d!53321 m!203773))

(declare-fun m!203831 () Bool)

(assert (=> d!53321 m!203831))

(assert (=> b!174785 d!53321))

(declare-fun d!53323 () Bool)

(assert (=> d!53323 (= (apply!132 lt!86484 lt!86477) (get!1978 (getValueByKey!187 (toList!1105 lt!86484) lt!86477)))))

(declare-fun bs!7221 () Bool)

(assert (= bs!7221 d!53323))

(declare-fun m!203833 () Bool)

(assert (=> bs!7221 m!203833))

(assert (=> bs!7221 m!203833))

(declare-fun m!203835 () Bool)

(assert (=> bs!7221 m!203835))

(assert (=> b!174785 d!53323))

(declare-fun d!53325 () Bool)

(assert (=> d!53325 (= (apply!132 lt!86488 lt!86471) (get!1978 (getValueByKey!187 (toList!1105 lt!86488) lt!86471)))))

(declare-fun bs!7222 () Bool)

(assert (= bs!7222 d!53325))

(declare-fun m!203837 () Bool)

(assert (=> bs!7222 m!203837))

(assert (=> bs!7222 m!203837))

(declare-fun m!203839 () Bool)

(assert (=> bs!7222 m!203839))

(assert (=> b!174785 d!53325))

(declare-fun d!53327 () Bool)

(declare-fun e!115455 () Bool)

(assert (=> d!53327 e!115455))

(declare-fun res!82916 () Bool)

(assert (=> d!53327 (=> (not res!82916) (not e!115455))))

(declare-fun lt!86529 () ListLongMap!2179)

(assert (=> d!53327 (= res!82916 (contains!1161 lt!86529 (_1!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))))))

(declare-fun lt!86527 () List!2214)

(assert (=> d!53327 (= lt!86529 (ListLongMap!2180 lt!86527))))

(declare-fun lt!86528 () Unit!5368)

(declare-fun lt!86530 () Unit!5368)

(assert (=> d!53327 (= lt!86528 lt!86530)))

(assert (=> d!53327 (= (getValueByKey!187 lt!86527 (_1!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!99 (List!2214 (_ BitVec 64) V!5107) Unit!5368)

(assert (=> d!53327 (= lt!86530 (lemmaContainsTupThenGetReturnValue!99 lt!86527 (_1!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))))))

(declare-fun insertStrictlySorted!102 (List!2214 (_ BitVec 64) V!5107) List!2214)

(assert (=> d!53327 (= lt!86527 (insertStrictlySorted!102 (toList!1105 lt!86488) (_1!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))))))

(assert (=> d!53327 (= (+!249 lt!86488 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))) lt!86529)))

(declare-fun b!174868 () Bool)

(declare-fun res!82917 () Bool)

(assert (=> b!174868 (=> (not res!82917) (not e!115455))))

(assert (=> b!174868 (= res!82917 (= (getValueByKey!187 (toList!1105 lt!86529) (_1!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))))))))

(declare-fun b!174869 () Bool)

(declare-fun contains!1163 (List!2214 tuple2!3252) Bool)

(assert (=> b!174869 (= e!115455 (contains!1163 (toList!1105 lt!86529) (tuple2!3253 lt!86485 (zeroValue!3450 thiss!1248))))))

(assert (= (and d!53327 res!82916) b!174868))

(assert (= (and b!174868 res!82917) b!174869))

(declare-fun m!203841 () Bool)

(assert (=> d!53327 m!203841))

(declare-fun m!203843 () Bool)

(assert (=> d!53327 m!203843))

(declare-fun m!203845 () Bool)

(assert (=> d!53327 m!203845))

(declare-fun m!203847 () Bool)

(assert (=> d!53327 m!203847))

(declare-fun m!203849 () Bool)

(assert (=> b!174868 m!203849))

(declare-fun m!203851 () Bool)

(assert (=> b!174869 m!203851))

(assert (=> b!174785 d!53327))

(declare-fun d!53329 () Bool)

(assert (=> d!53329 (= (apply!132 (+!249 lt!86484 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) lt!86477) (apply!132 lt!86484 lt!86477))))

(declare-fun lt!86531 () Unit!5368)

(assert (=> d!53329 (= lt!86531 (choose!935 lt!86484 lt!86480 (minValue!3450 thiss!1248) lt!86477))))

(declare-fun e!115456 () Bool)

(assert (=> d!53329 e!115456))

(declare-fun res!82918 () Bool)

(assert (=> d!53329 (=> (not res!82918) (not e!115456))))

(assert (=> d!53329 (= res!82918 (contains!1161 lt!86484 lt!86477))))

(assert (=> d!53329 (= (addApplyDifferent!108 lt!86484 lt!86480 (minValue!3450 thiss!1248) lt!86477) lt!86531)))

(declare-fun b!174870 () Bool)

(assert (=> b!174870 (= e!115456 (not (= lt!86477 lt!86480)))))

(assert (= (and d!53329 res!82918) b!174870))

(assert (=> d!53329 m!203761))

(assert (=> d!53329 m!203763))

(assert (=> d!53329 m!203761))

(declare-fun m!203853 () Bool)

(assert (=> d!53329 m!203853))

(assert (=> d!53329 m!203769))

(declare-fun m!203855 () Bool)

(assert (=> d!53329 m!203855))

(assert (=> b!174785 d!53329))

(declare-fun d!53331 () Bool)

(declare-fun e!115457 () Bool)

(assert (=> d!53331 e!115457))

(declare-fun res!82919 () Bool)

(assert (=> d!53331 (=> (not res!82919) (not e!115457))))

(declare-fun lt!86534 () ListLongMap!2179)

(assert (=> d!53331 (= res!82919 (contains!1161 lt!86534 (_1!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))))))

(declare-fun lt!86532 () List!2214)

(assert (=> d!53331 (= lt!86534 (ListLongMap!2180 lt!86532))))

(declare-fun lt!86533 () Unit!5368)

(declare-fun lt!86535 () Unit!5368)

(assert (=> d!53331 (= lt!86533 lt!86535)))

(assert (=> d!53331 (= (getValueByKey!187 lt!86532 (_1!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))))))

(assert (=> d!53331 (= lt!86535 (lemmaContainsTupThenGetReturnValue!99 lt!86532 (_1!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))))))

(assert (=> d!53331 (= lt!86532 (insertStrictlySorted!102 (toList!1105 lt!86483) (_1!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))))))

(assert (=> d!53331 (= (+!249 lt!86483 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) lt!86534)))

(declare-fun b!174871 () Bool)

(declare-fun res!82920 () Bool)

(assert (=> b!174871 (=> (not res!82920) (not e!115457))))

(assert (=> b!174871 (= res!82920 (= (getValueByKey!187 (toList!1105 lt!86534) (_1!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))))))))

(declare-fun b!174872 () Bool)

(assert (=> b!174872 (= e!115457 (contains!1163 (toList!1105 lt!86534) (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))))))

(assert (= (and d!53331 res!82919) b!174871))

(assert (= (and b!174871 res!82920) b!174872))

(declare-fun m!203857 () Bool)

(assert (=> d!53331 m!203857))

(declare-fun m!203859 () Bool)

(assert (=> d!53331 m!203859))

(declare-fun m!203861 () Bool)

(assert (=> d!53331 m!203861))

(declare-fun m!203863 () Bool)

(assert (=> d!53331 m!203863))

(declare-fun m!203865 () Bool)

(assert (=> b!174871 m!203865))

(declare-fun m!203867 () Bool)

(assert (=> b!174872 m!203867))

(assert (=> b!174785 d!53331))

(declare-fun d!53333 () Bool)

(assert (=> d!53333 (= (apply!132 (+!249 lt!86483 (tuple2!3253 lt!86470 (minValue!3450 thiss!1248))) lt!86481) (apply!132 lt!86483 lt!86481))))

(declare-fun lt!86536 () Unit!5368)

(assert (=> d!53333 (= lt!86536 (choose!935 lt!86483 lt!86470 (minValue!3450 thiss!1248) lt!86481))))

(declare-fun e!115458 () Bool)

(assert (=> d!53333 e!115458))

(declare-fun res!82921 () Bool)

(assert (=> d!53333 (=> (not res!82921) (not e!115458))))

(assert (=> d!53333 (= res!82921 (contains!1161 lt!86483 lt!86481))))

(assert (=> d!53333 (= (addApplyDifferent!108 lt!86483 lt!86470 (minValue!3450 thiss!1248) lt!86481) lt!86536)))

(declare-fun b!174873 () Bool)

(assert (=> b!174873 (= e!115458 (not (= lt!86481 lt!86470)))))

(assert (= (and d!53333 res!82921) b!174873))

(assert (=> d!53333 m!203757))

(assert (=> d!53333 m!203759))

(assert (=> d!53333 m!203757))

(declare-fun m!203869 () Bool)

(assert (=> d!53333 m!203869))

(assert (=> d!53333 m!203781))

(declare-fun m!203871 () Bool)

(assert (=> d!53333 m!203871))

(assert (=> b!174785 d!53333))

(declare-fun d!53335 () Bool)

(declare-fun e!115459 () Bool)

(assert (=> d!53335 e!115459))

(declare-fun res!82922 () Bool)

(assert (=> d!53335 (=> res!82922 e!115459)))

(declare-fun lt!86538 () Bool)

(assert (=> d!53335 (= res!82922 (not lt!86538))))

(declare-fun lt!86540 () Bool)

(assert (=> d!53335 (= lt!86538 lt!86540)))

(declare-fun lt!86539 () Unit!5368)

(declare-fun e!115460 () Unit!5368)

(assert (=> d!53335 (= lt!86539 e!115460)))

(declare-fun c!31306 () Bool)

(assert (=> d!53335 (= c!31306 lt!86540)))

(assert (=> d!53335 (= lt!86540 (containsKey!191 (toList!1105 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) lt!86479))))

(assert (=> d!53335 (= (contains!1161 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) lt!86479) lt!86538)))

(declare-fun b!174874 () Bool)

(declare-fun lt!86537 () Unit!5368)

(assert (=> b!174874 (= e!115460 lt!86537)))

(assert (=> b!174874 (= lt!86537 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) lt!86479))))

(assert (=> b!174874 (isDefined!140 (getValueByKey!187 (toList!1105 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) lt!86479))))

(declare-fun b!174875 () Bool)

(declare-fun Unit!5372 () Unit!5368)

(assert (=> b!174875 (= e!115460 Unit!5372)))

(declare-fun b!174876 () Bool)

(assert (=> b!174876 (= e!115459 (isDefined!140 (getValueByKey!187 (toList!1105 (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) lt!86479)))))

(assert (= (and d!53335 c!31306) b!174874))

(assert (= (and d!53335 (not c!31306)) b!174875))

(assert (= (and d!53335 (not res!82922)) b!174876))

(declare-fun m!203873 () Bool)

(assert (=> d!53335 m!203873))

(declare-fun m!203875 () Bool)

(assert (=> b!174874 m!203875))

(declare-fun m!203877 () Bool)

(assert (=> b!174874 m!203877))

(assert (=> b!174874 m!203877))

(declare-fun m!203879 () Bool)

(assert (=> b!174874 m!203879))

(assert (=> b!174876 m!203877))

(assert (=> b!174876 m!203877))

(assert (=> b!174876 m!203879))

(assert (=> b!174785 d!53335))

(declare-fun d!53337 () Bool)

(assert (=> d!53337 (= (apply!132 (+!249 lt!86484 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) lt!86477) (get!1978 (getValueByKey!187 (toList!1105 (+!249 lt!86484 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))) lt!86477)))))

(declare-fun bs!7223 () Bool)

(assert (= bs!7223 d!53337))

(declare-fun m!203881 () Bool)

(assert (=> bs!7223 m!203881))

(assert (=> bs!7223 m!203881))

(declare-fun m!203883 () Bool)

(assert (=> bs!7223 m!203883))

(assert (=> b!174785 d!53337))

(declare-fun d!53339 () Bool)

(declare-fun e!115461 () Bool)

(assert (=> d!53339 e!115461))

(declare-fun res!82923 () Bool)

(assert (=> d!53339 (=> (not res!82923) (not e!115461))))

(declare-fun lt!86543 () ListLongMap!2179)

(assert (=> d!53339 (= res!82923 (contains!1161 lt!86543 (_1!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))))))

(declare-fun lt!86541 () List!2214)

(assert (=> d!53339 (= lt!86543 (ListLongMap!2180 lt!86541))))

(declare-fun lt!86542 () Unit!5368)

(declare-fun lt!86544 () Unit!5368)

(assert (=> d!53339 (= lt!86542 lt!86544)))

(assert (=> d!53339 (= (getValueByKey!187 lt!86541 (_1!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))))))

(assert (=> d!53339 (= lt!86544 (lemmaContainsTupThenGetReturnValue!99 lt!86541 (_1!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))))))

(assert (=> d!53339 (= lt!86541 (insertStrictlySorted!102 (toList!1105 lt!86489) (_1!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))))))

(assert (=> d!53339 (= (+!249 lt!86489 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))) lt!86543)))

(declare-fun b!174877 () Bool)

(declare-fun res!82924 () Bool)

(assert (=> b!174877 (=> (not res!82924) (not e!115461))))

(assert (=> b!174877 (= res!82924 (= (getValueByKey!187 (toList!1105 lt!86543) (_1!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))))))))

(declare-fun b!174878 () Bool)

(assert (=> b!174878 (= e!115461 (contains!1163 (toList!1105 lt!86543) (tuple2!3253 lt!86474 (zeroValue!3450 thiss!1248))))))

(assert (= (and d!53339 res!82923) b!174877))

(assert (= (and b!174877 res!82924) b!174878))

(declare-fun m!203885 () Bool)

(assert (=> d!53339 m!203885))

(declare-fun m!203887 () Bool)

(assert (=> d!53339 m!203887))

(declare-fun m!203889 () Bool)

(assert (=> d!53339 m!203889))

(declare-fun m!203891 () Bool)

(assert (=> d!53339 m!203891))

(declare-fun m!203893 () Bool)

(assert (=> b!174877 m!203893))

(declare-fun m!203895 () Bool)

(assert (=> b!174878 m!203895))

(assert (=> b!174785 d!53339))

(declare-fun d!53341 () Bool)

(declare-fun e!115462 () Bool)

(assert (=> d!53341 e!115462))

(declare-fun res!82925 () Bool)

(assert (=> d!53341 (=> (not res!82925) (not e!115462))))

(declare-fun lt!86547 () ListLongMap!2179)

(assert (=> d!53341 (= res!82925 (contains!1161 lt!86547 (_1!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))))))

(declare-fun lt!86545 () List!2214)

(assert (=> d!53341 (= lt!86547 (ListLongMap!2180 lt!86545))))

(declare-fun lt!86546 () Unit!5368)

(declare-fun lt!86548 () Unit!5368)

(assert (=> d!53341 (= lt!86546 lt!86548)))

(assert (=> d!53341 (= (getValueByKey!187 lt!86545 (_1!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))))))

(assert (=> d!53341 (= lt!86548 (lemmaContainsTupThenGetReturnValue!99 lt!86545 (_1!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))))))

(assert (=> d!53341 (= lt!86545 (insertStrictlySorted!102 (toList!1105 lt!86484) (_1!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))))))

(assert (=> d!53341 (= (+!249 lt!86484 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))) lt!86547)))

(declare-fun b!174879 () Bool)

(declare-fun res!82926 () Bool)

(assert (=> b!174879 (=> (not res!82926) (not e!115462))))

(assert (=> b!174879 (= res!82926 (= (getValueByKey!187 (toList!1105 lt!86547) (_1!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))))))))

(declare-fun b!174880 () Bool)

(assert (=> b!174880 (= e!115462 (contains!1163 (toList!1105 lt!86547) (tuple2!3253 lt!86480 (minValue!3450 thiss!1248))))))

(assert (= (and d!53341 res!82925) b!174879))

(assert (= (and b!174879 res!82926) b!174880))

(declare-fun m!203897 () Bool)

(assert (=> d!53341 m!203897))

(declare-fun m!203899 () Bool)

(assert (=> d!53341 m!203899))

(declare-fun m!203901 () Bool)

(assert (=> d!53341 m!203901))

(declare-fun m!203903 () Bool)

(assert (=> d!53341 m!203903))

(declare-fun m!203905 () Bool)

(assert (=> b!174879 m!203905))

(declare-fun m!203907 () Bool)

(assert (=> b!174880 m!203907))

(assert (=> b!174785 d!53341))

(declare-fun d!53343 () Bool)

(assert (=> d!53343 (= (apply!132 lt!86491 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)) (get!1978 (getValueByKey!187 (toList!1105 lt!86491) (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7224 () Bool)

(assert (= bs!7224 d!53343))

(assert (=> bs!7224 m!203735))

(declare-fun m!203909 () Bool)

(assert (=> bs!7224 m!203909))

(assert (=> bs!7224 m!203909))

(declare-fun m!203911 () Bool)

(assert (=> bs!7224 m!203911))

(assert (=> b!174794 d!53343))

(declare-fun d!53345 () Bool)

(declare-fun c!31309 () Bool)

(assert (=> d!53345 (= c!31309 ((_ is ValueCellFull!1704) (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115465 () V!5107)

(assert (=> d!53345 (= (get!1977 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115465)))

(declare-fun b!174885 () Bool)

(declare-fun get!1979 (ValueCell!1704 V!5107) V!5107)

(assert (=> b!174885 (= e!115465 (get!1979 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174886 () Bool)

(declare-fun get!1980 (ValueCell!1704 V!5107) V!5107)

(assert (=> b!174886 (= e!115465 (get!1980 (select (arr!3480 (_values!3592 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3609 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53345 c!31309) b!174885))

(assert (= (and d!53345 (not c!31309)) b!174886))

(assert (=> b!174885 m!203739))

(assert (=> b!174885 m!203741))

(declare-fun m!203913 () Bool)

(assert (=> b!174885 m!203913))

(assert (=> b!174886 m!203739))

(assert (=> b!174886 m!203741))

(declare-fun m!203915 () Bool)

(assert (=> b!174886 m!203915))

(assert (=> b!174794 d!53345))

(declare-fun d!53347 () Bool)

(declare-fun e!115466 () Bool)

(assert (=> d!53347 e!115466))

(declare-fun res!82927 () Bool)

(assert (=> d!53347 (=> (not res!82927) (not e!115466))))

(declare-fun lt!86551 () ListLongMap!2179)

(assert (=> d!53347 (= res!82927 (contains!1161 lt!86551 (_1!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))))

(declare-fun lt!86549 () List!2214)

(assert (=> d!53347 (= lt!86551 (ListLongMap!2180 lt!86549))))

(declare-fun lt!86550 () Unit!5368)

(declare-fun lt!86552 () Unit!5368)

(assert (=> d!53347 (= lt!86550 lt!86552)))

(assert (=> d!53347 (= (getValueByKey!187 lt!86549 (_1!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))) (Some!192 (_2!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))))

(assert (=> d!53347 (= lt!86552 (lemmaContainsTupThenGetReturnValue!99 lt!86549 (_1!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))) (_2!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))))

(assert (=> d!53347 (= lt!86549 (insertStrictlySorted!102 (toList!1105 (ite c!31285 call!17708 (ite c!31283 call!17713 call!17711))) (_1!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))) (_2!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))))

(assert (=> d!53347 (= (+!249 (ite c!31285 call!17708 (ite c!31283 call!17713 call!17711)) (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))) lt!86551)))

(declare-fun b!174887 () Bool)

(declare-fun res!82928 () Bool)

(assert (=> b!174887 (=> (not res!82928) (not e!115466))))

(assert (=> b!174887 (= res!82928 (= (getValueByKey!187 (toList!1105 lt!86551) (_1!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))) (Some!192 (_2!1637 (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))))

(declare-fun b!174888 () Bool)

(assert (=> b!174888 (= e!115466 (contains!1163 (toList!1105 lt!86551) (ite (or c!31285 c!31283) (tuple2!3253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3450 thiss!1248)) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(assert (= (and d!53347 res!82927) b!174887))

(assert (= (and b!174887 res!82928) b!174888))

(declare-fun m!203917 () Bool)

(assert (=> d!53347 m!203917))

(declare-fun m!203919 () Bool)

(assert (=> d!53347 m!203919))

(declare-fun m!203921 () Bool)

(assert (=> d!53347 m!203921))

(declare-fun m!203923 () Bool)

(assert (=> d!53347 m!203923))

(declare-fun m!203925 () Bool)

(assert (=> b!174887 m!203925))

(declare-fun m!203927 () Bool)

(assert (=> b!174888 m!203927))

(assert (=> bm!17707 d!53347))

(declare-fun d!53349 () Bool)

(declare-fun e!115467 () Bool)

(assert (=> d!53349 e!115467))

(declare-fun res!82929 () Bool)

(assert (=> d!53349 (=> res!82929 e!115467)))

(declare-fun lt!86554 () Bool)

(assert (=> d!53349 (= res!82929 (not lt!86554))))

(declare-fun lt!86556 () Bool)

(assert (=> d!53349 (= lt!86554 lt!86556)))

(declare-fun lt!86555 () Unit!5368)

(declare-fun e!115468 () Unit!5368)

(assert (=> d!53349 (= lt!86555 e!115468)))

(declare-fun c!31310 () Bool)

(assert (=> d!53349 (= c!31310 lt!86556)))

(assert (=> d!53349 (= lt!86556 (containsKey!191 (toList!1105 lt!86491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53349 (= (contains!1161 lt!86491 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86554)))

(declare-fun b!174889 () Bool)

(declare-fun lt!86553 () Unit!5368)

(assert (=> b!174889 (= e!115468 lt!86553)))

(assert (=> b!174889 (= lt!86553 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 lt!86491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174889 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174890 () Bool)

(declare-fun Unit!5373 () Unit!5368)

(assert (=> b!174890 (= e!115468 Unit!5373)))

(declare-fun b!174891 () Bool)

(assert (=> b!174891 (= e!115467 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53349 c!31310) b!174889))

(assert (= (and d!53349 (not c!31310)) b!174890))

(assert (= (and d!53349 (not res!82929)) b!174891))

(declare-fun m!203929 () Bool)

(assert (=> d!53349 m!203929))

(declare-fun m!203931 () Bool)

(assert (=> b!174889 m!203931))

(declare-fun m!203933 () Bool)

(assert (=> b!174889 m!203933))

(assert (=> b!174889 m!203933))

(declare-fun m!203935 () Bool)

(assert (=> b!174889 m!203935))

(assert (=> b!174891 m!203933))

(assert (=> b!174891 m!203933))

(assert (=> b!174891 m!203935))

(assert (=> bm!17704 d!53349))

(declare-fun b!174904 () Bool)

(declare-fun c!31318 () Bool)

(declare-fun lt!86561 () (_ BitVec 64))

(assert (=> b!174904 (= c!31318 (= lt!86561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115477 () SeekEntryResult!546)

(declare-fun e!115475 () SeekEntryResult!546)

(assert (=> b!174904 (= e!115477 e!115475)))

(declare-fun b!174905 () Bool)

(declare-fun e!115476 () SeekEntryResult!546)

(assert (=> b!174905 (= e!115476 Undefined!546)))

(declare-fun b!174906 () Bool)

(assert (=> b!174906 (= e!115477 (Found!546 (index!4354 lt!86411)))))

(declare-fun b!174907 () Bool)

(assert (=> b!174907 (= e!115476 e!115477)))

(declare-fun c!31319 () Bool)

(assert (=> b!174907 (= c!31319 (= lt!86561 key!828))))

(declare-fun d!53351 () Bool)

(declare-fun lt!86562 () SeekEntryResult!546)

(assert (=> d!53351 (and (or ((_ is Undefined!546) lt!86562) (not ((_ is Found!546) lt!86562)) (and (bvsge (index!4353 lt!86562) #b00000000000000000000000000000000) (bvslt (index!4353 lt!86562) (size!3779 (_keys!5453 thiss!1248))))) (or ((_ is Undefined!546) lt!86562) ((_ is Found!546) lt!86562) (not ((_ is MissingVacant!546) lt!86562)) (not (= (index!4355 lt!86562) (index!4354 lt!86411))) (and (bvsge (index!4355 lt!86562) #b00000000000000000000000000000000) (bvslt (index!4355 lt!86562) (size!3779 (_keys!5453 thiss!1248))))) (or ((_ is Undefined!546) lt!86562) (ite ((_ is Found!546) lt!86562) (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4353 lt!86562)) key!828) (and ((_ is MissingVacant!546) lt!86562) (= (index!4355 lt!86562) (index!4354 lt!86411)) (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4355 lt!86562)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53351 (= lt!86562 e!115476)))

(declare-fun c!31317 () Bool)

(assert (=> d!53351 (= c!31317 (bvsge (x!19234 lt!86411) #b01111111111111111111111111111110))))

(assert (=> d!53351 (= lt!86561 (select (arr!3479 (_keys!5453 thiss!1248)) (index!4354 lt!86411)))))

(assert (=> d!53351 (validMask!0 (mask!8490 thiss!1248))))

(assert (=> d!53351 (= (seekKeyOrZeroReturnVacant!0 (x!19234 lt!86411) (index!4354 lt!86411) (index!4354 lt!86411) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)) lt!86562)))

(declare-fun b!174908 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174908 (= e!115475 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19234 lt!86411) #b00000000000000000000000000000001) (nextIndex!0 (index!4354 lt!86411) (x!19234 lt!86411) (mask!8490 thiss!1248)) (index!4354 lt!86411) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(declare-fun b!174909 () Bool)

(assert (=> b!174909 (= e!115475 (MissingVacant!546 (index!4354 lt!86411)))))

(assert (= (and d!53351 c!31317) b!174905))

(assert (= (and d!53351 (not c!31317)) b!174907))

(assert (= (and b!174907 c!31319) b!174906))

(assert (= (and b!174907 (not c!31319)) b!174904))

(assert (= (and b!174904 c!31318) b!174909))

(assert (= (and b!174904 (not c!31318)) b!174908))

(declare-fun m!203937 () Bool)

(assert (=> d!53351 m!203937))

(declare-fun m!203939 () Bool)

(assert (=> d!53351 m!203939))

(assert (=> d!53351 m!203719))

(assert (=> d!53351 m!203681))

(declare-fun m!203941 () Bool)

(assert (=> b!174908 m!203941))

(assert (=> b!174908 m!203941))

(declare-fun m!203943 () Bool)

(assert (=> b!174908 m!203943))

(assert (=> b!174725 d!53351))

(declare-fun d!53353 () Bool)

(assert (=> d!53353 (= (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174796 d!53353))

(declare-fun d!53355 () Bool)

(declare-fun e!115478 () Bool)

(assert (=> d!53355 e!115478))

(declare-fun res!82930 () Bool)

(assert (=> d!53355 (=> res!82930 e!115478)))

(declare-fun lt!86564 () Bool)

(assert (=> d!53355 (= res!82930 (not lt!86564))))

(declare-fun lt!86566 () Bool)

(assert (=> d!53355 (= lt!86564 lt!86566)))

(declare-fun lt!86565 () Unit!5368)

(declare-fun e!115479 () Unit!5368)

(assert (=> d!53355 (= lt!86565 e!115479)))

(declare-fun c!31320 () Bool)

(assert (=> d!53355 (= c!31320 lt!86566)))

(assert (=> d!53355 (= lt!86566 (containsKey!191 (toList!1105 lt!86491) (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53355 (= (contains!1161 lt!86491 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)) lt!86564)))

(declare-fun b!174910 () Bool)

(declare-fun lt!86563 () Unit!5368)

(assert (=> b!174910 (= e!115479 lt!86563)))

(assert (=> b!174910 (= lt!86563 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 lt!86491) (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174910 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174911 () Bool)

(declare-fun Unit!5374 () Unit!5368)

(assert (=> b!174911 (= e!115479 Unit!5374)))

(declare-fun b!174912 () Bool)

(assert (=> b!174912 (= e!115478 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53355 c!31320) b!174910))

(assert (= (and d!53355 (not c!31320)) b!174911))

(assert (= (and d!53355 (not res!82930)) b!174912))

(assert (=> d!53355 m!203735))

(declare-fun m!203945 () Bool)

(assert (=> d!53355 m!203945))

(assert (=> b!174910 m!203735))

(declare-fun m!203947 () Bool)

(assert (=> b!174910 m!203947))

(assert (=> b!174910 m!203735))

(assert (=> b!174910 m!203909))

(assert (=> b!174910 m!203909))

(declare-fun m!203949 () Bool)

(assert (=> b!174910 m!203949))

(assert (=> b!174912 m!203735))

(assert (=> b!174912 m!203909))

(assert (=> b!174912 m!203909))

(assert (=> b!174912 m!203949))

(assert (=> b!174780 d!53355))

(declare-fun b!174923 () Bool)

(declare-fun res!82939 () Bool)

(declare-fun e!115482 () Bool)

(assert (=> b!174923 (=> (not res!82939) (not e!115482))))

(declare-fun size!3783 (LongMapFixedSize!2316) (_ BitVec 32))

(assert (=> b!174923 (= res!82939 (= (size!3783 thiss!1248) (bvadd (_size!1207 thiss!1248) (bvsdiv (bvadd (extraKeys!3346 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!53357 () Bool)

(declare-fun res!82941 () Bool)

(assert (=> d!53357 (=> (not res!82941) (not e!115482))))

(assert (=> d!53357 (= res!82941 (validMask!0 (mask!8490 thiss!1248)))))

(assert (=> d!53357 (= (simpleValid!146 thiss!1248) e!115482)))

(declare-fun b!174924 () Bool)

(assert (=> b!174924 (= e!115482 (and (bvsge (extraKeys!3346 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3346 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1207 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!174921 () Bool)

(declare-fun res!82942 () Bool)

(assert (=> b!174921 (=> (not res!82942) (not e!115482))))

(assert (=> b!174921 (= res!82942 (and (= (size!3780 (_values!3592 thiss!1248)) (bvadd (mask!8490 thiss!1248) #b00000000000000000000000000000001)) (= (size!3779 (_keys!5453 thiss!1248)) (size!3780 (_values!3592 thiss!1248))) (bvsge (_size!1207 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1207 thiss!1248) (bvadd (mask!8490 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!174922 () Bool)

(declare-fun res!82940 () Bool)

(assert (=> b!174922 (=> (not res!82940) (not e!115482))))

(assert (=> b!174922 (= res!82940 (bvsge (size!3783 thiss!1248) (_size!1207 thiss!1248)))))

(assert (= (and d!53357 res!82941) b!174921))

(assert (= (and b!174921 res!82942) b!174922))

(assert (= (and b!174922 res!82940) b!174923))

(assert (= (and b!174923 res!82939) b!174924))

(declare-fun m!203951 () Bool)

(assert (=> b!174923 m!203951))

(assert (=> d!53357 m!203681))

(assert (=> b!174922 m!203951))

(assert (=> d!53297 d!53357))

(declare-fun d!53359 () Bool)

(assert (=> d!53359 (= (apply!132 lt!86491 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1978 (getValueByKey!187 (toList!1105 lt!86491) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7225 () Bool)

(assert (= bs!7225 d!53359))

(declare-fun m!203953 () Bool)

(assert (=> bs!7225 m!203953))

(assert (=> bs!7225 m!203953))

(declare-fun m!203955 () Bool)

(assert (=> bs!7225 m!203955))

(assert (=> b!174788 d!53359))

(declare-fun b!174933 () Bool)

(declare-fun e!115488 () (_ BitVec 32))

(assert (=> b!174933 (= e!115488 #b00000000000000000000000000000000)))

(declare-fun bm!17716 () Bool)

(declare-fun call!17719 () (_ BitVec 32))

(assert (=> bm!17716 (= call!17719 (arrayCountValidKeys!0 (_keys!5453 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun b!174934 () Bool)

(declare-fun e!115487 () (_ BitVec 32))

(assert (=> b!174934 (= e!115487 (bvadd #b00000000000000000000000000000001 call!17719))))

(declare-fun b!174935 () Bool)

(assert (=> b!174935 (= e!115488 e!115487)))

(declare-fun c!31325 () Bool)

(assert (=> b!174935 (= c!31325 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53361 () Bool)

(declare-fun lt!86569 () (_ BitVec 32))

(assert (=> d!53361 (and (bvsge lt!86569 #b00000000000000000000000000000000) (bvsle lt!86569 (bvsub (size!3779 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53361 (= lt!86569 e!115488)))

(declare-fun c!31326 () Bool)

(assert (=> d!53361 (= c!31326 (bvsge #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53361 (and (bvsle #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3779 (_keys!5453 thiss!1248)) (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53361 (= (arrayCountValidKeys!0 (_keys!5453 thiss!1248) #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))) lt!86569)))

(declare-fun b!174936 () Bool)

(assert (=> b!174936 (= e!115487 call!17719)))

(assert (= (and d!53361 c!31326) b!174933))

(assert (= (and d!53361 (not c!31326)) b!174935))

(assert (= (and b!174935 c!31325) b!174934))

(assert (= (and b!174935 (not c!31325)) b!174936))

(assert (= (or b!174934 b!174936) bm!17716))

(declare-fun m!203957 () Bool)

(assert (=> bm!17716 m!203957))

(assert (=> b!174935 m!203735))

(assert (=> b!174935 m!203735))

(assert (=> b!174935 m!203749))

(assert (=> b!174708 d!53361))

(declare-fun b!174945 () Bool)

(declare-fun e!115497 () Bool)

(declare-fun call!17722 () Bool)

(assert (=> b!174945 (= e!115497 call!17722)))

(declare-fun b!174946 () Bool)

(declare-fun e!115495 () Bool)

(declare-fun e!115496 () Bool)

(assert (=> b!174946 (= e!115495 e!115496)))

(declare-fun c!31329 () Bool)

(assert (=> b!174946 (= c!31329 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53363 () Bool)

(declare-fun res!82948 () Bool)

(assert (=> d!53363 (=> res!82948 e!115495)))

(assert (=> d!53363 (= res!82948 (bvsge #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)) e!115495)))

(declare-fun b!174947 () Bool)

(assert (=> b!174947 (= e!115496 e!115497)))

(declare-fun lt!86576 () (_ BitVec 64))

(assert (=> b!174947 (= lt!86576 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86577 () Unit!5368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7325 (_ BitVec 64) (_ BitVec 32)) Unit!5368)

(assert (=> b!174947 (= lt!86577 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5453 thiss!1248) lt!86576 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!174947 (arrayContainsKey!0 (_keys!5453 thiss!1248) lt!86576 #b00000000000000000000000000000000)))

(declare-fun lt!86578 () Unit!5368)

(assert (=> b!174947 (= lt!86578 lt!86577)))

(declare-fun res!82947 () Bool)

(assert (=> b!174947 (= res!82947 (= (seekEntryOrOpen!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000) (_keys!5453 thiss!1248) (mask!8490 thiss!1248)) (Found!546 #b00000000000000000000000000000000)))))

(assert (=> b!174947 (=> (not res!82947) (not e!115497))))

(declare-fun b!174948 () Bool)

(assert (=> b!174948 (= e!115496 call!17722)))

(declare-fun bm!17719 () Bool)

(assert (=> bm!17719 (= call!17722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(assert (= (and d!53363 (not res!82948)) b!174946))

(assert (= (and b!174946 c!31329) b!174947))

(assert (= (and b!174946 (not c!31329)) b!174948))

(assert (= (and b!174947 res!82947) b!174945))

(assert (= (or b!174945 b!174948) bm!17719))

(assert (=> b!174946 m!203735))

(assert (=> b!174946 m!203735))

(assert (=> b!174946 m!203749))

(assert (=> b!174947 m!203735))

(declare-fun m!203959 () Bool)

(assert (=> b!174947 m!203959))

(declare-fun m!203961 () Bool)

(assert (=> b!174947 m!203961))

(assert (=> b!174947 m!203735))

(declare-fun m!203963 () Bool)

(assert (=> b!174947 m!203963))

(declare-fun m!203965 () Bool)

(assert (=> bm!17719 m!203965))

(assert (=> b!174709 d!53363))

(declare-fun d!53365 () Bool)

(declare-fun res!82953 () Bool)

(declare-fun e!115502 () Bool)

(assert (=> d!53365 (=> res!82953 e!115502)))

(assert (=> d!53365 (= res!82953 (and ((_ is Cons!2210) (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) (= (_1!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) key!828)))))

(assert (=> d!53365 (= (containsKey!191 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828) e!115502)))

(declare-fun b!174953 () Bool)

(declare-fun e!115503 () Bool)

(assert (=> b!174953 (= e!115502 e!115503)))

(declare-fun res!82954 () Bool)

(assert (=> b!174953 (=> (not res!82954) (not e!115503))))

(assert (=> b!174953 (= res!82954 (and (or (not ((_ is Cons!2210) (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) (bvsle (_1!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) key!828)) ((_ is Cons!2210) (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) (bvslt (_1!1637 (h!2827 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))))) key!828)))))

(declare-fun b!174954 () Bool)

(assert (=> b!174954 (= e!115503 (containsKey!191 (t!7028 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))) key!828))))

(assert (= (and d!53365 (not res!82953)) b!174953))

(assert (= (and b!174953 res!82954) b!174954))

(declare-fun m!203967 () Bool)

(assert (=> b!174954 m!203967))

(assert (=> d!53303 d!53365))

(declare-fun b!174973 () Bool)

(declare-fun e!115516 () SeekEntryResult!546)

(assert (=> b!174973 (= e!115516 (Intermediate!546 true (toIndex!0 key!828 (mask!8490 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!174974 () Bool)

(declare-fun e!115518 () Bool)

(declare-fun lt!86584 () SeekEntryResult!546)

(assert (=> b!174974 (= e!115518 (bvsge (x!19234 lt!86584) #b01111111111111111111111111111110))))

(declare-fun b!174975 () Bool)

(assert (=> b!174975 (and (bvsge (index!4354 lt!86584) #b00000000000000000000000000000000) (bvslt (index!4354 lt!86584) (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun e!115515 () Bool)

(assert (=> b!174975 (= e!115515 (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4354 lt!86584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174976 () Bool)

(declare-fun e!115517 () Bool)

(assert (=> b!174976 (= e!115518 e!115517)))

(declare-fun res!82961 () Bool)

(assert (=> b!174976 (= res!82961 (and ((_ is Intermediate!546) lt!86584) (not (undefined!1358 lt!86584)) (bvslt (x!19234 lt!86584) #b01111111111111111111111111111110) (bvsge (x!19234 lt!86584) #b00000000000000000000000000000000) (bvsge (x!19234 lt!86584) #b00000000000000000000000000000000)))))

(assert (=> b!174976 (=> (not res!82961) (not e!115517))))

(declare-fun d!53367 () Bool)

(assert (=> d!53367 e!115518))

(declare-fun c!31337 () Bool)

(assert (=> d!53367 (= c!31337 (and ((_ is Intermediate!546) lt!86584) (undefined!1358 lt!86584)))))

(assert (=> d!53367 (= lt!86584 e!115516)))

(declare-fun c!31338 () Bool)

(assert (=> d!53367 (= c!31338 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!86583 () (_ BitVec 64))

(assert (=> d!53367 (= lt!86583 (select (arr!3479 (_keys!5453 thiss!1248)) (toIndex!0 key!828 (mask!8490 thiss!1248))))))

(assert (=> d!53367 (validMask!0 (mask!8490 thiss!1248))))

(assert (=> d!53367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8490 thiss!1248)) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)) lt!86584)))

(declare-fun b!174977 () Bool)

(declare-fun e!115514 () SeekEntryResult!546)

(assert (=> b!174977 (= e!115514 (Intermediate!546 false (toIndex!0 key!828 (mask!8490 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!174978 () Bool)

(assert (=> b!174978 (and (bvsge (index!4354 lt!86584) #b00000000000000000000000000000000) (bvslt (index!4354 lt!86584) (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun res!82962 () Bool)

(assert (=> b!174978 (= res!82962 (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4354 lt!86584)) key!828))))

(assert (=> b!174978 (=> res!82962 e!115515)))

(assert (=> b!174978 (= e!115517 e!115515)))

(declare-fun b!174979 () Bool)

(assert (=> b!174979 (= e!115514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8490 thiss!1248)) #b00000000000000000000000000000000 (mask!8490 thiss!1248)) key!828 (_keys!5453 thiss!1248) (mask!8490 thiss!1248)))))

(declare-fun b!174980 () Bool)

(assert (=> b!174980 (and (bvsge (index!4354 lt!86584) #b00000000000000000000000000000000) (bvslt (index!4354 lt!86584) (size!3779 (_keys!5453 thiss!1248))))))

(declare-fun res!82963 () Bool)

(assert (=> b!174980 (= res!82963 (= (select (arr!3479 (_keys!5453 thiss!1248)) (index!4354 lt!86584)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174980 (=> res!82963 e!115515)))

(declare-fun b!174981 () Bool)

(assert (=> b!174981 (= e!115516 e!115514)))

(declare-fun c!31336 () Bool)

(assert (=> b!174981 (= c!31336 (or (= lt!86583 key!828) (= (bvadd lt!86583 lt!86583) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53367 c!31338) b!174973))

(assert (= (and d!53367 (not c!31338)) b!174981))

(assert (= (and b!174981 c!31336) b!174977))

(assert (= (and b!174981 (not c!31336)) b!174979))

(assert (= (and d!53367 c!31337) b!174974))

(assert (= (and d!53367 (not c!31337)) b!174976))

(assert (= (and b!174976 res!82961) b!174978))

(assert (= (and b!174978 (not res!82962)) b!174980))

(assert (= (and b!174980 (not res!82963)) b!174975))

(declare-fun m!203969 () Bool)

(assert (=> b!174980 m!203969))

(assert (=> b!174979 m!203713))

(declare-fun m!203971 () Bool)

(assert (=> b!174979 m!203971))

(assert (=> b!174979 m!203971))

(declare-fun m!203973 () Bool)

(assert (=> b!174979 m!203973))

(assert (=> b!174975 m!203969))

(assert (=> b!174978 m!203969))

(assert (=> d!53367 m!203713))

(declare-fun m!203975 () Bool)

(assert (=> d!53367 m!203975))

(assert (=> d!53367 m!203681))

(assert (=> d!53299 d!53367))

(declare-fun d!53369 () Bool)

(declare-fun lt!86590 () (_ BitVec 32))

(declare-fun lt!86589 () (_ BitVec 32))

(assert (=> d!53369 (= lt!86590 (bvmul (bvxor lt!86589 (bvlshr lt!86589 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53369 (= lt!86589 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53369 (and (bvsge (mask!8490 thiss!1248) #b00000000000000000000000000000000) (let ((res!82964 (let ((h!2830 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19253 (bvmul (bvxor h!2830 (bvlshr h!2830 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19253 (bvlshr x!19253 #b00000000000000000000000000001101)) (mask!8490 thiss!1248)))))) (and (bvslt res!82964 (bvadd (mask!8490 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!82964 #b00000000000000000000000000000000))))))

(assert (=> d!53369 (= (toIndex!0 key!828 (mask!8490 thiss!1248)) (bvand (bvxor lt!86590 (bvlshr lt!86590 #b00000000000000000000000000001101)) (mask!8490 thiss!1248)))))

(assert (=> d!53299 d!53369))

(assert (=> d!53299 d!53301))

(declare-fun bm!17722 () Bool)

(declare-fun call!17725 () Bool)

(declare-fun c!31341 () Bool)

(assert (=> bm!17722 (= call!17725 (arrayNoDuplicates!0 (_keys!5453 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31341 (Cons!2212 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000) Nil!2213) Nil!2213)))))

(declare-fun b!174992 () Bool)

(declare-fun e!115528 () Bool)

(assert (=> b!174992 (= e!115528 call!17725)))

(declare-fun d!53371 () Bool)

(declare-fun res!82972 () Bool)

(declare-fun e!115530 () Bool)

(assert (=> d!53371 (=> res!82972 e!115530)))

(assert (=> d!53371 (= res!82972 (bvsge #b00000000000000000000000000000000 (size!3779 (_keys!5453 thiss!1248))))))

(assert (=> d!53371 (= (arrayNoDuplicates!0 (_keys!5453 thiss!1248) #b00000000000000000000000000000000 Nil!2213) e!115530)))

(declare-fun b!174993 () Bool)

(declare-fun e!115529 () Bool)

(assert (=> b!174993 (= e!115529 e!115528)))

(assert (=> b!174993 (= c!31341 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174994 () Bool)

(assert (=> b!174994 (= e!115530 e!115529)))

(declare-fun res!82971 () Bool)

(assert (=> b!174994 (=> (not res!82971) (not e!115529))))

(declare-fun e!115527 () Bool)

(assert (=> b!174994 (= res!82971 (not e!115527))))

(declare-fun res!82973 () Bool)

(assert (=> b!174994 (=> (not res!82973) (not e!115527))))

(assert (=> b!174994 (= res!82973 (validKeyInArray!0 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174995 () Bool)

(assert (=> b!174995 (= e!115528 call!17725)))

(declare-fun b!174996 () Bool)

(declare-fun contains!1164 (List!2216 (_ BitVec 64)) Bool)

(assert (=> b!174996 (= e!115527 (contains!1164 Nil!2213 (select (arr!3479 (_keys!5453 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53371 (not res!82972)) b!174994))

(assert (= (and b!174994 res!82973) b!174996))

(assert (= (and b!174994 res!82971) b!174993))

(assert (= (and b!174993 c!31341) b!174992))

(assert (= (and b!174993 (not c!31341)) b!174995))

(assert (= (or b!174992 b!174995) bm!17722))

(assert (=> bm!17722 m!203735))

(declare-fun m!203977 () Bool)

(assert (=> bm!17722 m!203977))

(assert (=> b!174993 m!203735))

(assert (=> b!174993 m!203735))

(assert (=> b!174993 m!203749))

(assert (=> b!174994 m!203735))

(assert (=> b!174994 m!203735))

(assert (=> b!174994 m!203749))

(assert (=> b!174996 m!203735))

(assert (=> b!174996 m!203735))

(declare-fun m!203979 () Bool)

(assert (=> b!174996 m!203979))

(assert (=> b!174710 d!53371))

(assert (=> bm!17710 d!53313))

(assert (=> b!174790 d!53353))

(declare-fun d!53373 () Bool)

(assert (=> d!53373 (isDefined!140 (getValueByKey!187 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(declare-fun lt!86593 () Unit!5368)

(declare-fun choose!936 (List!2214 (_ BitVec 64)) Unit!5368)

(assert (=> d!53373 (= lt!86593 (choose!936 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(declare-fun e!115533 () Bool)

(assert (=> d!53373 e!115533))

(declare-fun res!82976 () Bool)

(assert (=> d!53373 (=> (not res!82976) (not e!115533))))

(declare-fun isStrictlySorted!333 (List!2214) Bool)

(assert (=> d!53373 (= res!82976 (isStrictlySorted!333 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248)))))))

(assert (=> d!53373 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828) lt!86593)))

(declare-fun b!174999 () Bool)

(assert (=> b!174999 (= e!115533 (containsKey!191 (toList!1105 (getCurrentListMap!757 (_keys!5453 thiss!1248) (_values!3592 thiss!1248) (mask!8490 thiss!1248) (extraKeys!3346 thiss!1248) (zeroValue!3450 thiss!1248) (minValue!3450 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3609 thiss!1248))) key!828))))

(assert (= (and d!53373 res!82976) b!174999))

(assert (=> d!53373 m!203725))

(assert (=> d!53373 m!203725))

(assert (=> d!53373 m!203727))

(declare-fun m!203981 () Bool)

(assert (=> d!53373 m!203981))

(declare-fun m!203983 () Bool)

(assert (=> d!53373 m!203983))

(assert (=> b!174999 m!203721))

(assert (=> b!174735 d!53373))

(assert (=> b!174735 d!53307))

(assert (=> b!174735 d!53309))

(declare-fun d!53375 () Bool)

(declare-fun e!115534 () Bool)

(assert (=> d!53375 e!115534))

(declare-fun res!82977 () Bool)

(assert (=> d!53375 (=> res!82977 e!115534)))

(declare-fun lt!86595 () Bool)

(assert (=> d!53375 (= res!82977 (not lt!86595))))

(declare-fun lt!86597 () Bool)

(assert (=> d!53375 (= lt!86595 lt!86597)))

(declare-fun lt!86596 () Unit!5368)

(declare-fun e!115535 () Unit!5368)

(assert (=> d!53375 (= lt!86596 e!115535)))

(declare-fun c!31342 () Bool)

(assert (=> d!53375 (= c!31342 lt!86597)))

(assert (=> d!53375 (= lt!86597 (containsKey!191 (toList!1105 lt!86491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53375 (= (contains!1161 lt!86491 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86595)))

(declare-fun b!175000 () Bool)

(declare-fun lt!86594 () Unit!5368)

(assert (=> b!175000 (= e!115535 lt!86594)))

(assert (=> b!175000 (= lt!86594 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1105 lt!86491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175000 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175001 () Bool)

(declare-fun Unit!5375 () Unit!5368)

(assert (=> b!175001 (= e!115535 Unit!5375)))

(declare-fun b!175002 () Bool)

(assert (=> b!175002 (= e!115534 (isDefined!140 (getValueByKey!187 (toList!1105 lt!86491) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53375 c!31342) b!175000))

(assert (= (and d!53375 (not c!31342)) b!175001))

(assert (= (and d!53375 (not res!82977)) b!175002))

(declare-fun m!203985 () Bool)

(assert (=> d!53375 m!203985))

(declare-fun m!203987 () Bool)

(assert (=> b!175000 m!203987))

(assert (=> b!175000 m!203953))

(assert (=> b!175000 m!203953))

(declare-fun m!203989 () Bool)

(assert (=> b!175000 m!203989))

(assert (=> b!175002 m!203953))

(assert (=> b!175002 m!203953))

(assert (=> b!175002 m!203989))

(assert (=> bm!17706 d!53375))

(declare-fun d!53377 () Bool)

(assert (=> d!53377 (= (apply!132 lt!86491 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1978 (getValueByKey!187 (toList!1105 lt!86491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7226 () Bool)

(assert (= bs!7226 d!53377))

(assert (=> bs!7226 m!203933))

(assert (=> bs!7226 m!203933))

(declare-fun m!203991 () Bool)

(assert (=> bs!7226 m!203991))

(assert (=> b!174791 d!53377))

(assert (=> d!53305 d!53301))

(declare-fun d!53379 () Bool)

(declare-fun e!115536 () Bool)

(assert (=> d!53379 e!115536))

(declare-fun res!82978 () Bool)

(assert (=> d!53379 (=> (not res!82978) (not e!115536))))

(declare-fun lt!86600 () ListLongMap!2179)

(assert (=> d!53379 (= res!82978 (contains!1161 lt!86600 (_1!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(declare-fun lt!86598 () List!2214)

(assert (=> d!53379 (= lt!86600 (ListLongMap!2180 lt!86598))))

(declare-fun lt!86599 () Unit!5368)

(declare-fun lt!86601 () Unit!5368)

(assert (=> d!53379 (= lt!86599 lt!86601)))

(assert (=> d!53379 (= (getValueByKey!187 lt!86598 (_1!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(assert (=> d!53379 (= lt!86601 (lemmaContainsTupThenGetReturnValue!99 lt!86598 (_1!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(assert (=> d!53379 (= lt!86598 (insertStrictlySorted!102 (toList!1105 call!17712) (_1!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))) (_2!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))))))

(assert (=> d!53379 (= (+!249 call!17712 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))) lt!86600)))

(declare-fun b!175003 () Bool)

(declare-fun res!82979 () Bool)

(assert (=> b!175003 (=> (not res!82979) (not e!115536))))

(assert (=> b!175003 (= res!82979 (= (getValueByKey!187 (toList!1105 lt!86600) (_1!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248)))) (Some!192 (_2!1637 (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))))

(declare-fun b!175004 () Bool)

(assert (=> b!175004 (= e!115536 (contains!1163 (toList!1105 lt!86600) (tuple2!3253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3450 thiss!1248))))))

(assert (= (and d!53379 res!82978) b!175003))

(assert (= (and b!175003 res!82979) b!175004))

(declare-fun m!203993 () Bool)

(assert (=> d!53379 m!203993))

(declare-fun m!203995 () Bool)

(assert (=> d!53379 m!203995))

(declare-fun m!203997 () Bool)

(assert (=> d!53379 m!203997))

(declare-fun m!203999 () Bool)

(assert (=> d!53379 m!203999))

(declare-fun m!204001 () Bool)

(assert (=> b!175003 m!204001))

(declare-fun m!204003 () Bool)

(assert (=> b!175004 m!204003))

(assert (=> b!174784 d!53379))

(declare-fun mapIsEmpty!6984 () Bool)

(declare-fun mapRes!6984 () Bool)

(assert (=> mapIsEmpty!6984 mapRes!6984))

(declare-fun b!175005 () Bool)

(declare-fun e!115537 () Bool)

(assert (=> b!175005 (= e!115537 tp_is_empty!4095)))

(declare-fun mapNonEmpty!6984 () Bool)

(declare-fun tp!15651 () Bool)

(assert (=> mapNonEmpty!6984 (= mapRes!6984 (and tp!15651 e!115537))))

(declare-fun mapKey!6984 () (_ BitVec 32))

(declare-fun mapValue!6984 () ValueCell!1704)

(declare-fun mapRest!6984 () (Array (_ BitVec 32) ValueCell!1704))

(assert (=> mapNonEmpty!6984 (= mapRest!6983 (store mapRest!6984 mapKey!6984 mapValue!6984))))

(declare-fun b!175006 () Bool)

(declare-fun e!115538 () Bool)

(assert (=> b!175006 (= e!115538 tp_is_empty!4095)))

(declare-fun condMapEmpty!6984 () Bool)

(declare-fun mapDefault!6984 () ValueCell!1704)

(assert (=> mapNonEmpty!6983 (= condMapEmpty!6984 (= mapRest!6983 ((as const (Array (_ BitVec 32) ValueCell!1704)) mapDefault!6984)))))

(assert (=> mapNonEmpty!6983 (= tp!15650 (and e!115538 mapRes!6984))))

(assert (= (and mapNonEmpty!6983 condMapEmpty!6984) mapIsEmpty!6984))

(assert (= (and mapNonEmpty!6983 (not condMapEmpty!6984)) mapNonEmpty!6984))

(assert (= (and mapNonEmpty!6984 ((_ is ValueCellFull!1704) mapValue!6984)) b!175005))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1704) mapDefault!6984)) b!175006))

(declare-fun m!204005 () Bool)

(assert (=> mapNonEmpty!6984 m!204005))

(declare-fun b_lambda!6995 () Bool)

(assert (= b_lambda!6993 (or (and b!174671 b_free!4323) b_lambda!6995)))

(declare-fun b_lambda!6997 () Bool)

(assert (= b_lambda!6991 (or (and b!174671 b_free!4323) b_lambda!6997)))

(check-sat (not b!174869) (not d!53323) (not b!174886) (not b!174946) (not d!53349) (not b!174821) (not d!53339) (not d!53311) (not b!174879) (not d!53377) (not b!174993) (not d!53359) (not b!174849) tp_is_empty!4095 (not b!174935) (not d!53343) (not b!174891) (not d!53351) (not d!53355) (not b!174889) (not d!53379) (not d!53325) (not d!53335) (not d!53307) (not b_next!4323) (not b!174850) (not d!53315) (not d!53317) (not d!53333) (not b!174871) (not b!174868) (not b_lambda!6997) (not b!174852) (not d!53337) (not b!174858) (not d!53375) (not d!53313) (not b!174912) (not d!53327) b_and!10799 (not b!174876) (not b_lambda!6995) (not b!174887) (not b!174910) (not b!174922) (not b!174979) (not b!174994) (not b!174996) (not d!53329) (not b!174854) (not d!53321) (not b!174923) (not b!174999) (not d!53357) (not b!174853) (not bm!17716) (not d!53367) (not b!174880) (not b!174885) (not b!175004) (not d!53331) (not d!53341) (not b!174908) (not mapNonEmpty!6984) (not d!53373) (not b!175002) (not bm!17722) (not bm!17713) (not b!174877) (not b_lambda!6989) (not b!174888) (not b!174954) (not b!174859) (not d!53319) (not d!53347) (not b!174851) (not bm!17719) (not b!174878) (not b!174872) (not b!174947) (not b!175000) (not b!174874) (not b!175003))
(check-sat b_and!10799 (not b_next!4323))
