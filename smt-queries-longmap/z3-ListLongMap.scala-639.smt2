; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16186 () Bool)

(assert start!16186)

(declare-fun b!161225 () Bool)

(declare-fun b_free!3643 () Bool)

(declare-fun b_next!3643 () Bool)

(assert (=> b!161225 (= b_free!3643 (not b_next!3643))))

(declare-fun tp!13498 () Bool)

(declare-fun b_and!10031 () Bool)

(assert (=> b!161225 (= tp!13498 b_and!10031)))

(declare-fun b!161222 () Bool)

(declare-fun res!76409 () Bool)

(declare-fun e!105353 () Bool)

(assert (=> b!161222 (=> (not res!76409) (not e!105353))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4241 0))(
  ( (V!4242 (val!1767 Int)) )
))
(declare-datatypes ((ValueCell!1379 0))(
  ( (ValueCellFull!1379 (v!3626 V!4241)) (EmptyCell!1379) )
))
(declare-datatypes ((array!5949 0))(
  ( (array!5950 (arr!2818 (Array (_ BitVec 32) (_ BitVec 64))) (size!3103 (_ BitVec 32))) )
))
(declare-datatypes ((array!5951 0))(
  ( (array!5952 (arr!2819 (Array (_ BitVec 32) ValueCell!1379)) (size!3104 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1666 0))(
  ( (LongMapFixedSize!1667 (defaultEntry!3275 Int) (mask!7864 (_ BitVec 32)) (extraKeys!3016 (_ BitVec 32)) (zeroValue!3118 V!4241) (minValue!3118 V!4241) (_size!882 (_ BitVec 32)) (_keys!5075 array!5949) (_values!3258 array!5951) (_vacant!882 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1666)

(get-info :version)

(declare-datatypes ((SeekEntryResult!358 0))(
  ( (MissingZero!358 (index!3600 (_ BitVec 32))) (Found!358 (index!3601 (_ BitVec 32))) (Intermediate!358 (undefined!1170 Bool) (index!3602 (_ BitVec 32)) (x!17813 (_ BitVec 32))) (Undefined!358) (MissingVacant!358 (index!3603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5949 (_ BitVec 32)) SeekEntryResult!358)

(assert (=> b!161222 (= res!76409 ((_ is Undefined!358) (seekEntryOrOpen!0 key!828 (_keys!5075 thiss!1248) (mask!7864 thiss!1248))))))

(declare-fun mapIsEmpty!5855 () Bool)

(declare-fun mapRes!5855 () Bool)

(assert (=> mapIsEmpty!5855 mapRes!5855))

(declare-fun b!161224 () Bool)

(assert (=> b!161224 (= e!105353 false)))

(declare-datatypes ((Unit!4988 0))(
  ( (Unit!4989) )
))
(declare-fun lt!82016 () Unit!4988)

(declare-fun e!105358 () Unit!4988)

(assert (=> b!161224 (= lt!82016 e!105358)))

(declare-fun c!29927 () Bool)

(declare-datatypes ((tuple2!2932 0))(
  ( (tuple2!2933 (_1!1477 (_ BitVec 64)) (_2!1477 V!4241)) )
))
(declare-datatypes ((List!1979 0))(
  ( (Nil!1976) (Cons!1975 (h!2588 tuple2!2932) (t!6772 List!1979)) )
))
(declare-datatypes ((ListLongMap!1919 0))(
  ( (ListLongMap!1920 (toList!975 List!1979)) )
))
(declare-fun contains!1014 (ListLongMap!1919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!625 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 32) Int) ListLongMap!1919)

(assert (=> b!161224 (= c!29927 (contains!1014 (getCurrentListMap!625 (_keys!5075 thiss!1248) (_values!3258 thiss!1248) (mask!7864 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3275 thiss!1248)) key!828))))

(declare-fun e!105357 () Bool)

(declare-fun e!105356 () Bool)

(declare-fun tp_is_empty!3445 () Bool)

(declare-fun array_inv!1817 (array!5949) Bool)

(declare-fun array_inv!1818 (array!5951) Bool)

(assert (=> b!161225 (= e!105357 (and tp!13498 tp_is_empty!3445 (array_inv!1817 (_keys!5075 thiss!1248)) (array_inv!1818 (_values!3258 thiss!1248)) e!105356))))

(declare-fun b!161226 () Bool)

(declare-fun e!105355 () Bool)

(assert (=> b!161226 (= e!105355 tp_is_empty!3445)))

(declare-fun b!161227 () Bool)

(declare-fun res!76410 () Bool)

(assert (=> b!161227 (=> (not res!76410) (not e!105353))))

(assert (=> b!161227 (= res!76410 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161228 () Bool)

(assert (=> b!161228 (= e!105356 (and e!105355 mapRes!5855))))

(declare-fun condMapEmpty!5855 () Bool)

(declare-fun mapDefault!5855 () ValueCell!1379)

(assert (=> b!161228 (= condMapEmpty!5855 (= (arr!2819 (_values!3258 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1379)) mapDefault!5855)))))

(declare-fun b!161229 () Bool)

(declare-fun Unit!4990 () Unit!4988)

(assert (=> b!161229 (= e!105358 Unit!4990)))

(declare-fun lt!82017 () Unit!4988)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!76 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 64) Int) Unit!4988)

(assert (=> b!161229 (= lt!82017 (lemmaInListMapThenSeekEntryOrOpenFindsIt!76 (_keys!5075 thiss!1248) (_values!3258 thiss!1248) (mask!7864 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) key!828 (defaultEntry!3275 thiss!1248)))))

(assert (=> b!161229 false))

(declare-fun mapNonEmpty!5855 () Bool)

(declare-fun tp!13499 () Bool)

(declare-fun e!105354 () Bool)

(assert (=> mapNonEmpty!5855 (= mapRes!5855 (and tp!13499 e!105354))))

(declare-fun mapValue!5855 () ValueCell!1379)

(declare-fun mapRest!5855 () (Array (_ BitVec 32) ValueCell!1379))

(declare-fun mapKey!5855 () (_ BitVec 32))

(assert (=> mapNonEmpty!5855 (= (arr!2819 (_values!3258 thiss!1248)) (store mapRest!5855 mapKey!5855 mapValue!5855))))

(declare-fun b!161230 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!75 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 64) Int) Unit!4988)

(assert (=> b!161230 (= e!105358 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!75 (_keys!5075 thiss!1248) (_values!3258 thiss!1248) (mask!7864 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) key!828 (defaultEntry!3275 thiss!1248)))))

(declare-fun b!161223 () Bool)

(assert (=> b!161223 (= e!105354 tp_is_empty!3445)))

(declare-fun res!76408 () Bool)

(assert (=> start!16186 (=> (not res!76408) (not e!105353))))

(declare-fun valid!765 (LongMapFixedSize!1666) Bool)

(assert (=> start!16186 (= res!76408 (valid!765 thiss!1248))))

(assert (=> start!16186 e!105353))

(assert (=> start!16186 e!105357))

(assert (=> start!16186 true))

(assert (= (and start!16186 res!76408) b!161227))

(assert (= (and b!161227 res!76410) b!161222))

(assert (= (and b!161222 res!76409) b!161224))

(assert (= (and b!161224 c!29927) b!161229))

(assert (= (and b!161224 (not c!29927)) b!161230))

(assert (= (and b!161228 condMapEmpty!5855) mapIsEmpty!5855))

(assert (= (and b!161228 (not condMapEmpty!5855)) mapNonEmpty!5855))

(assert (= (and mapNonEmpty!5855 ((_ is ValueCellFull!1379) mapValue!5855)) b!161223))

(assert (= (and b!161228 ((_ is ValueCellFull!1379) mapDefault!5855)) b!161226))

(assert (= b!161225 b!161228))

(assert (= start!16186 b!161225))

(declare-fun m!192265 () Bool)

(assert (=> b!161225 m!192265))

(declare-fun m!192267 () Bool)

(assert (=> b!161225 m!192267))

(declare-fun m!192269 () Bool)

(assert (=> b!161222 m!192269))

(declare-fun m!192271 () Bool)

(assert (=> b!161229 m!192271))

(declare-fun m!192273 () Bool)

(assert (=> b!161230 m!192273))

(declare-fun m!192275 () Bool)

(assert (=> b!161224 m!192275))

(assert (=> b!161224 m!192275))

(declare-fun m!192277 () Bool)

(assert (=> b!161224 m!192277))

(declare-fun m!192279 () Bool)

(assert (=> start!16186 m!192279))

(declare-fun m!192281 () Bool)

(assert (=> mapNonEmpty!5855 m!192281))

(check-sat (not b!161225) (not b!161224) tp_is_empty!3445 (not mapNonEmpty!5855) (not b!161229) (not b_next!3643) (not b!161222) (not b!161230) b_and!10031 (not start!16186))
(check-sat b_and!10031 (not b_next!3643))
