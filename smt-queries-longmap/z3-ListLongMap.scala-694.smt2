; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16672 () Bool)

(assert start!16672)

(declare-fun b!166843 () Bool)

(declare-fun b_free!3973 () Bool)

(declare-fun b_next!3973 () Bool)

(assert (=> b!166843 (= b_free!3973 (not b_next!3973))))

(declare-fun tp!14519 () Bool)

(declare-fun b_and!10401 () Bool)

(assert (=> b!166843 (= tp!14519 b_and!10401)))

(declare-fun b!166832 () Bool)

(declare-fun e!109485 () Bool)

(declare-fun tp_is_empty!3775 () Bool)

(assert (=> b!166832 (= e!109485 tp_is_empty!3775)))

(declare-fun res!79310 () Bool)

(declare-fun e!109491 () Bool)

(assert (=> start!16672 (=> (not res!79310) (not e!109491))))

(declare-datatypes ((V!4681 0))(
  ( (V!4682 (val!1932 Int)) )
))
(declare-datatypes ((ValueCell!1544 0))(
  ( (ValueCellFull!1544 (v!3798 V!4681)) (EmptyCell!1544) )
))
(declare-datatypes ((array!6633 0))(
  ( (array!6634 (arr!3152 (Array (_ BitVec 32) (_ BitVec 64))) (size!3440 (_ BitVec 32))) )
))
(declare-datatypes ((array!6635 0))(
  ( (array!6636 (arr!3153 (Array (_ BitVec 32) ValueCell!1544)) (size!3441 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1996 0))(
  ( (LongMapFixedSize!1997 (defaultEntry!3440 Int) (mask!8177 (_ BitVec 32)) (extraKeys!3181 (_ BitVec 32)) (zeroValue!3283 V!4681) (minValue!3283 V!4681) (_size!1047 (_ BitVec 32)) (_keys!5265 array!6633) (_values!3423 array!6635) (_vacant!1047 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1996)

(declare-fun valid!888 (LongMapFixedSize!1996) Bool)

(assert (=> start!16672 (= res!79310 (valid!888 thiss!1248))))

(assert (=> start!16672 e!109491))

(declare-fun e!109484 () Bool)

(assert (=> start!16672 e!109484))

(assert (=> start!16672 true))

(declare-datatypes ((SeekEntryResult!459 0))(
  ( (MissingZero!459 (index!4004 (_ BitVec 32))) (Found!459 (index!4005 (_ BitVec 32))) (Intermediate!459 (undefined!1271 Bool) (index!4006 (_ BitVec 32)) (x!18463 (_ BitVec 32))) (Undefined!459) (MissingVacant!459 (index!4007 (_ BitVec 32))) )
))
(declare-fun lt!83499 () SeekEntryResult!459)

(declare-fun b!166833 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!109487 () Bool)

(assert (=> b!166833 (= e!109487 (= (select (arr!3152 (_keys!5265 thiss!1248)) (index!4005 lt!83499)) key!828))))

(declare-fun b!166834 () Bool)

(declare-fun res!79313 () Bool)

(declare-fun e!109490 () Bool)

(assert (=> b!166834 (=> (not res!79313) (not e!109490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6633 (_ BitVec 32)) Bool)

(assert (=> b!166834 (= res!79313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5265 thiss!1248) (mask!8177 thiss!1248)))))

(declare-fun mapNonEmpty!6381 () Bool)

(declare-fun mapRes!6381 () Bool)

(declare-fun tp!14520 () Bool)

(declare-fun e!109489 () Bool)

(assert (=> mapNonEmpty!6381 (= mapRes!6381 (and tp!14520 e!109489))))

(declare-fun mapKey!6381 () (_ BitVec 32))

(declare-fun mapRest!6381 () (Array (_ BitVec 32) ValueCell!1544))

(declare-fun mapValue!6381 () ValueCell!1544)

(assert (=> mapNonEmpty!6381 (= (arr!3153 (_values!3423 thiss!1248)) (store mapRest!6381 mapKey!6381 mapValue!6381))))

(declare-fun mapIsEmpty!6381 () Bool)

(assert (=> mapIsEmpty!6381 mapRes!6381))

(declare-fun b!166835 () Bool)

(assert (=> b!166835 (= e!109489 tp_is_empty!3775)))

(declare-fun b!166836 () Bool)

(assert (=> b!166836 (= e!109490 false)))

(declare-fun lt!83502 () Bool)

(declare-datatypes ((List!2090 0))(
  ( (Nil!2087) (Cons!2086 (h!2703 (_ BitVec 64)) (t!6884 List!2090)) )
))
(declare-fun arrayNoDuplicates!0 (array!6633 (_ BitVec 32) List!2090) Bool)

(assert (=> b!166836 (= lt!83502 (arrayNoDuplicates!0 (_keys!5265 thiss!1248) #b00000000000000000000000000000000 Nil!2087))))

(declare-fun b!166837 () Bool)

(declare-datatypes ((Unit!5098 0))(
  ( (Unit!5099) )
))
(declare-fun e!109486 () Unit!5098)

(declare-fun lt!83501 () Unit!5098)

(assert (=> b!166837 (= e!109486 lt!83501)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!97 (array!6633 array!6635 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 64) Int) Unit!5098)

(assert (=> b!166837 (= lt!83501 (lemmaInListMapThenSeekEntryOrOpenFindsIt!97 (_keys!5265 thiss!1248) (_values!3423 thiss!1248) (mask!8177 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) key!828 (defaultEntry!3440 thiss!1248)))))

(declare-fun res!79308 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166837 (= res!79308 (inRange!0 (index!4005 lt!83499) (mask!8177 thiss!1248)))))

(assert (=> b!166837 (=> (not res!79308) (not e!109487))))

(assert (=> b!166837 e!109487))

(declare-fun b!166838 () Bool)

(declare-fun e!109492 () Bool)

(assert (=> b!166838 (= e!109492 e!109490)))

(declare-fun res!79311 () Bool)

(assert (=> b!166838 (=> (not res!79311) (not e!109490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166838 (= res!79311 (validMask!0 (mask!8177 thiss!1248)))))

(declare-fun lt!83498 () Unit!5098)

(assert (=> b!166838 (= lt!83498 e!109486)))

(declare-fun c!30254 () Bool)

(declare-datatypes ((tuple2!3072 0))(
  ( (tuple2!3073 (_1!1547 (_ BitVec 64)) (_2!1547 V!4681)) )
))
(declare-datatypes ((List!2091 0))(
  ( (Nil!2088) (Cons!2087 (h!2704 tuple2!3072) (t!6885 List!2091)) )
))
(declare-datatypes ((ListLongMap!2033 0))(
  ( (ListLongMap!2034 (toList!1032 List!2091)) )
))
(declare-fun contains!1084 (ListLongMap!2033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!694 (array!6633 array!6635 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 32) Int) ListLongMap!2033)

(assert (=> b!166838 (= c!30254 (contains!1084 (getCurrentListMap!694 (_keys!5265 thiss!1248) (_values!3423 thiss!1248) (mask!8177 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3440 thiss!1248)) key!828))))

(declare-fun b!166839 () Bool)

(declare-fun res!79309 () Bool)

(assert (=> b!166839 (=> (not res!79309) (not e!109491))))

(assert (=> b!166839 (= res!79309 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166840 () Bool)

(declare-fun res!79312 () Bool)

(assert (=> b!166840 (=> (not res!79312) (not e!109490))))

(assert (=> b!166840 (= res!79312 (and (= (size!3441 (_values!3423 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8177 thiss!1248))) (= (size!3440 (_keys!5265 thiss!1248)) (size!3441 (_values!3423 thiss!1248))) (bvsge (mask!8177 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3181 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3181 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166841 () Bool)

(declare-fun Unit!5100 () Unit!5098)

(assert (=> b!166841 (= e!109486 Unit!5100)))

(declare-fun lt!83500 () Unit!5098)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!94 (array!6633 array!6635 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 64) Int) Unit!5098)

(assert (=> b!166841 (= lt!83500 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!94 (_keys!5265 thiss!1248) (_values!3423 thiss!1248) (mask!8177 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) key!828 (defaultEntry!3440 thiss!1248)))))

(assert (=> b!166841 false))

(declare-fun b!166842 () Bool)

(declare-fun e!109493 () Bool)

(assert (=> b!166842 (= e!109493 (and e!109485 mapRes!6381))))

(declare-fun condMapEmpty!6381 () Bool)

(declare-fun mapDefault!6381 () ValueCell!1544)

(assert (=> b!166842 (= condMapEmpty!6381 (= (arr!3153 (_values!3423 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1544)) mapDefault!6381)))))

(declare-fun array_inv!2013 (array!6633) Bool)

(declare-fun array_inv!2014 (array!6635) Bool)

(assert (=> b!166843 (= e!109484 (and tp!14519 tp_is_empty!3775 (array_inv!2013 (_keys!5265 thiss!1248)) (array_inv!2014 (_values!3423 thiss!1248)) e!109493))))

(declare-fun b!166844 () Bool)

(assert (=> b!166844 (= e!109491 e!109492)))

(declare-fun res!79314 () Bool)

(assert (=> b!166844 (=> (not res!79314) (not e!109492))))

(get-info :version)

(assert (=> b!166844 (= res!79314 (and (not ((_ is Undefined!459) lt!83499)) (not ((_ is MissingVacant!459) lt!83499)) (not ((_ is MissingZero!459) lt!83499)) ((_ is Found!459) lt!83499)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6633 (_ BitVec 32)) SeekEntryResult!459)

(assert (=> b!166844 (= lt!83499 (seekEntryOrOpen!0 key!828 (_keys!5265 thiss!1248) (mask!8177 thiss!1248)))))

(assert (= (and start!16672 res!79310) b!166839))

(assert (= (and b!166839 res!79309) b!166844))

(assert (= (and b!166844 res!79314) b!166838))

(assert (= (and b!166838 c!30254) b!166837))

(assert (= (and b!166838 (not c!30254)) b!166841))

(assert (= (and b!166837 res!79308) b!166833))

(assert (= (and b!166838 res!79311) b!166840))

(assert (= (and b!166840 res!79312) b!166834))

(assert (= (and b!166834 res!79313) b!166836))

(assert (= (and b!166842 condMapEmpty!6381) mapIsEmpty!6381))

(assert (= (and b!166842 (not condMapEmpty!6381)) mapNonEmpty!6381))

(assert (= (and mapNonEmpty!6381 ((_ is ValueCellFull!1544) mapValue!6381)) b!166835))

(assert (= (and b!166842 ((_ is ValueCellFull!1544) mapDefault!6381)) b!166832))

(assert (= b!166843 b!166842))

(assert (= start!16672 b!166843))

(declare-fun m!196313 () Bool)

(assert (=> mapNonEmpty!6381 m!196313))

(declare-fun m!196315 () Bool)

(assert (=> b!166836 m!196315))

(declare-fun m!196317 () Bool)

(assert (=> b!166833 m!196317))

(declare-fun m!196319 () Bool)

(assert (=> b!166843 m!196319))

(declare-fun m!196321 () Bool)

(assert (=> b!166843 m!196321))

(declare-fun m!196323 () Bool)

(assert (=> b!166844 m!196323))

(declare-fun m!196325 () Bool)

(assert (=> b!166838 m!196325))

(declare-fun m!196327 () Bool)

(assert (=> b!166838 m!196327))

(assert (=> b!166838 m!196327))

(declare-fun m!196329 () Bool)

(assert (=> b!166838 m!196329))

(declare-fun m!196331 () Bool)

(assert (=> b!166837 m!196331))

(declare-fun m!196333 () Bool)

(assert (=> b!166837 m!196333))

(declare-fun m!196335 () Bool)

(assert (=> b!166841 m!196335))

(declare-fun m!196337 () Bool)

(assert (=> start!16672 m!196337))

(declare-fun m!196339 () Bool)

(assert (=> b!166834 m!196339))

(check-sat (not b!166841) (not b!166838) (not b!166834) (not start!16672) tp_is_empty!3775 b_and!10401 (not mapNonEmpty!6381) (not b!166844) (not b!166843) (not b_next!3973) (not b!166836) (not b!166837))
(check-sat b_and!10401 (not b_next!3973))
