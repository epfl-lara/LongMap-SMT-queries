; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22950 () Bool)

(assert start!22950)

(declare-fun b!239982 () Bool)

(declare-fun b_free!6453 () Bool)

(declare-fun b_next!6453 () Bool)

(assert (=> b!239982 (= b_free!6453 (not b_next!6453))))

(declare-fun tp!22563 () Bool)

(declare-fun b_and!13419 () Bool)

(assert (=> b!239982 (= tp!22563 b_and!13419)))

(declare-fun b!239979 () Bool)

(declare-fun e!155811 () Bool)

(declare-fun tp_is_empty!6315 () Bool)

(assert (=> b!239979 (= e!155811 tp_is_empty!6315)))

(declare-fun b!239980 () Bool)

(declare-fun e!155805 () Bool)

(declare-fun call!22319 () Bool)

(assert (=> b!239980 (= e!155805 (not call!22319))))

(declare-fun b!239981 () Bool)

(declare-fun c!39990 () Bool)

(declare-datatypes ((SeekEntryResult!1040 0))(
  ( (MissingZero!1040 (index!6330 (_ BitVec 32))) (Found!1040 (index!6331 (_ BitVec 32))) (Intermediate!1040 (undefined!1852 Bool) (index!6332 (_ BitVec 32)) (x!24136 (_ BitVec 32))) (Undefined!1040) (MissingVacant!1040 (index!6333 (_ BitVec 32))) )
))
(declare-fun lt!120895 () SeekEntryResult!1040)

(get-info :version)

(assert (=> b!239981 (= c!39990 ((_ is MissingVacant!1040) lt!120895))))

(declare-fun e!155809 () Bool)

(declare-fun e!155803 () Bool)

(assert (=> b!239981 (= e!155809 e!155803)))

(declare-datatypes ((V!8067 0))(
  ( (V!8068 (val!3202 Int)) )
))
(declare-datatypes ((ValueCell!2814 0))(
  ( (ValueCellFull!2814 (v!5240 V!8067)) (EmptyCell!2814) )
))
(declare-datatypes ((array!11909 0))(
  ( (array!11910 (arr!5656 (Array (_ BitVec 32) ValueCell!2814)) (size!5997 (_ BitVec 32))) )
))
(declare-datatypes ((array!11911 0))(
  ( (array!11912 (arr!5657 (Array (_ BitVec 32) (_ BitVec 64))) (size!5998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3528 0))(
  ( (LongMapFixedSize!3529 (defaultEntry!4449 Int) (mask!10501 (_ BitVec 32)) (extraKeys!4186 (_ BitVec 32)) (zeroValue!4290 V!8067) (minValue!4290 V!8067) (_size!1813 (_ BitVec 32)) (_keys!6551 array!11911) (_values!4432 array!11909) (_vacant!1813 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3528)

(declare-fun e!155810 () Bool)

(declare-fun e!155806 () Bool)

(declare-fun array_inv!3743 (array!11911) Bool)

(declare-fun array_inv!3744 (array!11909) Bool)

(assert (=> b!239982 (= e!155810 (and tp!22563 tp_is_empty!6315 (array_inv!3743 (_keys!6551 thiss!1504)) (array_inv!3744 (_values!4432 thiss!1504)) e!155806))))

(declare-fun b!239984 () Bool)

(declare-fun res!117630 () Bool)

(declare-fun e!155800 () Bool)

(assert (=> b!239984 (=> (not res!117630) (not e!155800))))

(assert (=> b!239984 (= res!117630 (= (select (arr!5657 (_keys!6551 thiss!1504)) (index!6330 lt!120895)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239985 () Bool)

(declare-fun res!117629 () Bool)

(declare-fun e!155807 () Bool)

(assert (=> b!239985 (=> (not res!117629) (not e!155807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11911 (_ BitVec 32)) Bool)

(assert (=> b!239985 (= res!117629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6551 thiss!1504) (mask!10501 thiss!1504)))))

(declare-fun b!239986 () Bool)

(declare-datatypes ((Unit!7376 0))(
  ( (Unit!7377) )
))
(declare-fun e!155802 () Unit!7376)

(declare-fun lt!120897 () Unit!7376)

(assert (=> b!239986 (= e!155802 lt!120897)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8067 V!8067 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!239986 (= lt!120897 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!348 (_keys!6551 thiss!1504) (_values!4432 thiss!1504) (mask!10501 thiss!1504) (extraKeys!4186 thiss!1504) (zeroValue!4290 thiss!1504) (minValue!4290 thiss!1504) key!932 (defaultEntry!4449 thiss!1504)))))

(declare-fun c!39992 () Bool)

(assert (=> b!239986 (= c!39992 ((_ is MissingZero!1040) lt!120895))))

(assert (=> b!239986 e!155809))

(declare-fun mapIsEmpty!10704 () Bool)

(declare-fun mapRes!10704 () Bool)

(assert (=> mapIsEmpty!10704 mapRes!10704))

(declare-fun bm!22316 () Bool)

(declare-fun arrayContainsKey!0 (array!11911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22316 (= call!22319 (arrayContainsKey!0 (_keys!6551 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239987 () Bool)

(assert (=> b!239987 (= e!155800 (not call!22319))))

(declare-fun b!239988 () Bool)

(declare-fun e!155799 () Bool)

(assert (=> b!239988 (= e!155799 tp_is_empty!6315)))

(declare-fun b!239989 () Bool)

(declare-fun res!117638 () Bool)

(declare-fun e!155804 () Bool)

(assert (=> b!239989 (=> (not res!117638) (not e!155804))))

(assert (=> b!239989 (= res!117638 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239990 () Bool)

(declare-fun res!117636 () Bool)

(assert (=> b!239990 (=> (not res!117636) (not e!155807))))

(assert (=> b!239990 (= res!117636 (and (= (size!5997 (_values!4432 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10501 thiss!1504))) (= (size!5998 (_keys!6551 thiss!1504)) (size!5997 (_values!4432 thiss!1504))) (bvsge (mask!10501 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4186 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4186 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun call!22320 () Bool)

(declare-fun bm!22317 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22317 (= call!22320 (inRange!0 (ite c!39992 (index!6330 lt!120895) (index!6333 lt!120895)) (mask!10501 thiss!1504)))))

(declare-fun b!239991 () Bool)

(assert (=> b!239991 (= e!155803 e!155805)))

(declare-fun res!117632 () Bool)

(assert (=> b!239991 (= res!117632 call!22320)))

(assert (=> b!239991 (=> (not res!117632) (not e!155805))))

(declare-fun b!239983 () Bool)

(declare-fun res!117628 () Bool)

(assert (=> b!239983 (=> (not res!117628) (not e!155800))))

(assert (=> b!239983 (= res!117628 call!22320)))

(assert (=> b!239983 (= e!155809 e!155800)))

(declare-fun res!117627 () Bool)

(assert (=> start!22950 (=> (not res!117627) (not e!155804))))

(declare-fun valid!1390 (LongMapFixedSize!3528) Bool)

(assert (=> start!22950 (= res!117627 (valid!1390 thiss!1504))))

(assert (=> start!22950 e!155804))

(assert (=> start!22950 e!155810))

(assert (=> start!22950 true))

(declare-fun mapNonEmpty!10704 () Bool)

(declare-fun tp!22562 () Bool)

(assert (=> mapNonEmpty!10704 (= mapRes!10704 (and tp!22562 e!155811))))

(declare-fun mapKey!10704 () (_ BitVec 32))

(declare-fun mapValue!10704 () ValueCell!2814)

(declare-fun mapRest!10704 () (Array (_ BitVec 32) ValueCell!2814))

(assert (=> mapNonEmpty!10704 (= (arr!5656 (_values!4432 thiss!1504)) (store mapRest!10704 mapKey!10704 mapValue!10704))))

(declare-fun b!239992 () Bool)

(declare-fun e!155808 () Bool)

(assert (=> b!239992 (= e!155808 e!155807)))

(declare-fun res!117635 () Bool)

(assert (=> b!239992 (=> (not res!117635) (not e!155807))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239992 (= res!117635 (inRange!0 index!297 (mask!10501 thiss!1504)))))

(declare-fun lt!120894 () Unit!7376)

(assert (=> b!239992 (= lt!120894 e!155802)))

(declare-fun c!39991 () Bool)

(declare-datatypes ((tuple2!4720 0))(
  ( (tuple2!4721 (_1!2371 (_ BitVec 64)) (_2!2371 V!8067)) )
))
(declare-datatypes ((List!3602 0))(
  ( (Nil!3599) (Cons!3598 (h!4254 tuple2!4720) (t!8597 List!3602)) )
))
(declare-datatypes ((ListLongMap!3633 0))(
  ( (ListLongMap!3634 (toList!1832 List!3602)) )
))
(declare-fun contains!1720 (ListLongMap!3633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1360 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8067 V!8067 (_ BitVec 32) Int) ListLongMap!3633)

(assert (=> b!239992 (= c!39991 (contains!1720 (getCurrentListMap!1360 (_keys!6551 thiss!1504) (_values!4432 thiss!1504) (mask!10501 thiss!1504) (extraKeys!4186 thiss!1504) (zeroValue!4290 thiss!1504) (minValue!4290 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4449 thiss!1504)) key!932))))

(declare-fun b!239993 () Bool)

(assert (=> b!239993 (= e!155803 ((_ is Undefined!1040) lt!120895))))

(declare-fun b!239994 () Bool)

(assert (=> b!239994 (= e!155806 (and e!155799 mapRes!10704))))

(declare-fun condMapEmpty!10704 () Bool)

(declare-fun mapDefault!10704 () ValueCell!2814)

(assert (=> b!239994 (= condMapEmpty!10704 (= (arr!5656 (_values!4432 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2814)) mapDefault!10704)))))

(declare-fun b!239995 () Bool)

(declare-fun Unit!7378 () Unit!7376)

(assert (=> b!239995 (= e!155802 Unit!7378)))

(declare-fun lt!120896 () Unit!7376)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!334 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8067 V!8067 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!239995 (= lt!120896 (lemmaInListMapThenSeekEntryOrOpenFindsIt!334 (_keys!6551 thiss!1504) (_values!4432 thiss!1504) (mask!10501 thiss!1504) (extraKeys!4186 thiss!1504) (zeroValue!4290 thiss!1504) (minValue!4290 thiss!1504) key!932 (defaultEntry!4449 thiss!1504)))))

(assert (=> b!239995 false))

(declare-fun b!239996 () Bool)

(declare-datatypes ((List!3603 0))(
  ( (Nil!3600) (Cons!3599 (h!4255 (_ BitVec 64)) (t!8598 List!3603)) )
))
(declare-fun arrayNoDuplicates!0 (array!11911 (_ BitVec 32) List!3603) Bool)

(assert (=> b!239996 (= e!155807 (not (arrayNoDuplicates!0 (_keys!6551 thiss!1504) #b00000000000000000000000000000000 Nil!3600)))))

(declare-fun b!239997 () Bool)

(declare-fun res!117634 () Bool)

(assert (=> b!239997 (=> (not res!117634) (not e!155807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239997 (= res!117634 (validMask!0 (mask!10501 thiss!1504)))))

(declare-fun b!239998 () Bool)

(assert (=> b!239998 (= e!155804 e!155808)))

(declare-fun res!117633 () Bool)

(assert (=> b!239998 (=> (not res!117633) (not e!155808))))

(assert (=> b!239998 (= res!117633 (or (= lt!120895 (MissingZero!1040 index!297)) (= lt!120895 (MissingVacant!1040 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11911 (_ BitVec 32)) SeekEntryResult!1040)

(assert (=> b!239998 (= lt!120895 (seekEntryOrOpen!0 key!932 (_keys!6551 thiss!1504) (mask!10501 thiss!1504)))))

(declare-fun b!239999 () Bool)

(declare-fun res!117631 () Bool)

(assert (=> b!239999 (=> (not res!117631) (not e!155807))))

(assert (=> b!239999 (= res!117631 (arrayContainsKey!0 (_keys!6551 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240000 () Bool)

(declare-fun res!117637 () Bool)

(assert (=> b!240000 (= res!117637 (= (select (arr!5657 (_keys!6551 thiss!1504)) (index!6333 lt!120895)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240000 (=> (not res!117637) (not e!155805))))

(assert (= (and start!22950 res!117627) b!239989))

(assert (= (and b!239989 res!117638) b!239998))

(assert (= (and b!239998 res!117633) b!239992))

(assert (= (and b!239992 c!39991) b!239995))

(assert (= (and b!239992 (not c!39991)) b!239986))

(assert (= (and b!239986 c!39992) b!239983))

(assert (= (and b!239986 (not c!39992)) b!239981))

(assert (= (and b!239983 res!117628) b!239984))

(assert (= (and b!239984 res!117630) b!239987))

(assert (= (and b!239981 c!39990) b!239991))

(assert (= (and b!239981 (not c!39990)) b!239993))

(assert (= (and b!239991 res!117632) b!240000))

(assert (= (and b!240000 res!117637) b!239980))

(assert (= (or b!239983 b!239991) bm!22317))

(assert (= (or b!239987 b!239980) bm!22316))

(assert (= (and b!239992 res!117635) b!239999))

(assert (= (and b!239999 res!117631) b!239997))

(assert (= (and b!239997 res!117634) b!239990))

(assert (= (and b!239990 res!117636) b!239985))

(assert (= (and b!239985 res!117629) b!239996))

(assert (= (and b!239994 condMapEmpty!10704) mapIsEmpty!10704))

(assert (= (and b!239994 (not condMapEmpty!10704)) mapNonEmpty!10704))

(assert (= (and mapNonEmpty!10704 ((_ is ValueCellFull!2814) mapValue!10704)) b!239979))

(assert (= (and b!239994 ((_ is ValueCellFull!2814) mapDefault!10704)) b!239988))

(assert (= b!239982 b!239994))

(assert (= start!22950 b!239982))

(declare-fun m!259779 () Bool)

(assert (=> b!239986 m!259779))

(declare-fun m!259781 () Bool)

(assert (=> b!239984 m!259781))

(declare-fun m!259783 () Bool)

(assert (=> bm!22317 m!259783))

(declare-fun m!259785 () Bool)

(assert (=> b!240000 m!259785))

(declare-fun m!259787 () Bool)

(assert (=> b!239995 m!259787))

(declare-fun m!259789 () Bool)

(assert (=> start!22950 m!259789))

(declare-fun m!259791 () Bool)

(assert (=> mapNonEmpty!10704 m!259791))

(declare-fun m!259793 () Bool)

(assert (=> b!239996 m!259793))

(declare-fun m!259795 () Bool)

(assert (=> b!239997 m!259795))

(declare-fun m!259797 () Bool)

(assert (=> b!239982 m!259797))

(declare-fun m!259799 () Bool)

(assert (=> b!239982 m!259799))

(declare-fun m!259801 () Bool)

(assert (=> b!239985 m!259801))

(declare-fun m!259803 () Bool)

(assert (=> bm!22316 m!259803))

(declare-fun m!259805 () Bool)

(assert (=> b!239992 m!259805))

(declare-fun m!259807 () Bool)

(assert (=> b!239992 m!259807))

(assert (=> b!239992 m!259807))

(declare-fun m!259809 () Bool)

(assert (=> b!239992 m!259809))

(assert (=> b!239999 m!259803))

(declare-fun m!259811 () Bool)

(assert (=> b!239998 m!259811))

(check-sat (not mapNonEmpty!10704) (not b!239992) (not b!239997) (not bm!22317) (not b!239986) (not b!239985) (not b!239996) (not b!239999) (not b_next!6453) (not b!239998) (not bm!22316) (not b!239982) b_and!13419 (not b!239995) tp_is_empty!6315 (not start!22950))
(check-sat b_and!13419 (not b_next!6453))
