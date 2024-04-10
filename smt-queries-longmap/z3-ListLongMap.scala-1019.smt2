; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21716 () Bool)

(assert start!21716)

(declare-fun b!218284 () Bool)

(declare-fun b_free!5865 () Bool)

(declare-fun b_next!5865 () Bool)

(assert (=> b!218284 (= b_free!5865 (not b_next!5865))))

(declare-fun tp!20730 () Bool)

(declare-fun b_and!12755 () Bool)

(assert (=> b!218284 (= tp!20730 b_and!12755)))

(declare-fun e!141994 () Bool)

(declare-datatypes ((V!7283 0))(
  ( (V!7284 (val!2908 Int)) )
))
(declare-datatypes ((ValueCell!2520 0))(
  ( (ValueCellFull!2520 (v!4926 V!7283)) (EmptyCell!2520) )
))
(declare-datatypes ((array!10693 0))(
  ( (array!10694 (arr!5068 (Array (_ BitVec 32) ValueCell!2520)) (size!5400 (_ BitVec 32))) )
))
(declare-datatypes ((array!10695 0))(
  ( (array!10696 (arr!5069 (Array (_ BitVec 32) (_ BitVec 64))) (size!5401 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2940 0))(
  ( (LongMapFixedSize!2941 (defaultEntry!4120 Int) (mask!9893 (_ BitVec 32)) (extraKeys!3857 (_ BitVec 32)) (zeroValue!3961 V!7283) (minValue!3961 V!7283) (_size!1519 (_ BitVec 32)) (_keys!6169 array!10695) (_values!4103 array!10693) (_vacant!1519 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2940)

(declare-fun e!141997 () Bool)

(declare-fun tp_is_empty!5727 () Bool)

(declare-fun array_inv!3359 (array!10695) Bool)

(declare-fun array_inv!3360 (array!10693) Bool)

(assert (=> b!218284 (= e!141997 (and tp!20730 tp_is_empty!5727 (array_inv!3359 (_keys!6169 thiss!1504)) (array_inv!3360 (_values!4103 thiss!1504)) e!141994))))

(declare-fun b!218285 () Bool)

(declare-fun res!107008 () Bool)

(declare-fun e!141992 () Bool)

(assert (=> b!218285 (=> (not res!107008) (not e!141992))))

(assert (=> b!218285 (= res!107008 (and (= (size!5400 (_values!4103 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9893 thiss!1504))) (= (size!5401 (_keys!6169 thiss!1504)) (size!5400 (_values!4103 thiss!1504))) (bvsge (mask!9893 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3857 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3857 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!218286 () Bool)

(declare-fun e!141991 () Bool)

(assert (=> b!218286 (= e!141991 tp_is_empty!5727)))

(declare-fun b!218287 () Bool)

(declare-fun res!107009 () Bool)

(assert (=> b!218287 (=> (not res!107009) (not e!141992))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4322 0))(
  ( (tuple2!4323 (_1!2172 (_ BitVec 64)) (_2!2172 V!7283)) )
))
(declare-datatypes ((List!3227 0))(
  ( (Nil!3224) (Cons!3223 (h!3870 tuple2!4322) (t!8182 List!3227)) )
))
(declare-datatypes ((ListLongMap!3235 0))(
  ( (ListLongMap!3236 (toList!1633 List!3227)) )
))
(declare-fun contains!1474 (ListLongMap!3235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1161 (array!10695 array!10693 (_ BitVec 32) (_ BitVec 32) V!7283 V!7283 (_ BitVec 32) Int) ListLongMap!3235)

(assert (=> b!218287 (= res!107009 (not (contains!1474 (getCurrentListMap!1161 (_keys!6169 thiss!1504) (_values!4103 thiss!1504) (mask!9893 thiss!1504) (extraKeys!3857 thiss!1504) (zeroValue!3961 thiss!1504) (minValue!3961 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4120 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!9753 () Bool)

(declare-fun mapRes!9753 () Bool)

(declare-fun tp!20729 () Bool)

(assert (=> mapNonEmpty!9753 (= mapRes!9753 (and tp!20729 e!141991))))

(declare-fun mapRest!9753 () (Array (_ BitVec 32) ValueCell!2520))

(declare-fun mapKey!9753 () (_ BitVec 32))

(declare-fun mapValue!9753 () ValueCell!2520)

(assert (=> mapNonEmpty!9753 (= (arr!5068 (_values!4103 thiss!1504)) (store mapRest!9753 mapKey!9753 mapValue!9753))))

(declare-fun b!218289 () Bool)

(assert (=> b!218289 (= e!141992 false)))

(declare-fun lt!111501 () Bool)

(declare-datatypes ((List!3228 0))(
  ( (Nil!3225) (Cons!3224 (h!3871 (_ BitVec 64)) (t!8183 List!3228)) )
))
(declare-fun arrayNoDuplicates!0 (array!10695 (_ BitVec 32) List!3228) Bool)

(assert (=> b!218289 (= lt!111501 (arrayNoDuplicates!0 (_keys!6169 thiss!1504) #b00000000000000000000000000000000 Nil!3225))))

(declare-fun b!218290 () Bool)

(declare-fun e!141996 () Bool)

(assert (=> b!218290 (= e!141996 e!141992)))

(declare-fun res!107010 () Bool)

(assert (=> b!218290 (=> (not res!107010) (not e!141992))))

(declare-datatypes ((SeekEntryResult!785 0))(
  ( (MissingZero!785 (index!5310 (_ BitVec 32))) (Found!785 (index!5311 (_ BitVec 32))) (Intermediate!785 (undefined!1597 Bool) (index!5312 (_ BitVec 32)) (x!22825 (_ BitVec 32))) (Undefined!785) (MissingVacant!785 (index!5313 (_ BitVec 32))) )
))
(declare-fun lt!111500 () SeekEntryResult!785)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218290 (= res!107010 (or (= lt!111500 (MissingZero!785 index!297)) (= lt!111500 (MissingVacant!785 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10695 (_ BitVec 32)) SeekEntryResult!785)

(assert (=> b!218290 (= lt!111500 (seekEntryOrOpen!0 key!932 (_keys!6169 thiss!1504) (mask!9893 thiss!1504)))))

(declare-fun mapIsEmpty!9753 () Bool)

(assert (=> mapIsEmpty!9753 mapRes!9753))

(declare-fun b!218291 () Bool)

(declare-fun res!107007 () Bool)

(assert (=> b!218291 (=> (not res!107007) (not e!141992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218291 (= res!107007 (validMask!0 (mask!9893 thiss!1504)))))

(declare-fun b!218292 () Bool)

(declare-fun res!107012 () Bool)

(assert (=> b!218292 (=> (not res!107012) (not e!141992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10695 (_ BitVec 32)) Bool)

(assert (=> b!218292 (= res!107012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6169 thiss!1504) (mask!9893 thiss!1504)))))

(declare-fun b!218293 () Bool)

(declare-fun e!141995 () Bool)

(assert (=> b!218293 (= e!141995 tp_is_empty!5727)))

(declare-fun b!218294 () Bool)

(assert (=> b!218294 (= e!141994 (and e!141995 mapRes!9753))))

(declare-fun condMapEmpty!9753 () Bool)

(declare-fun mapDefault!9753 () ValueCell!2520)

(assert (=> b!218294 (= condMapEmpty!9753 (= (arr!5068 (_values!4103 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2520)) mapDefault!9753)))))

(declare-fun b!218288 () Bool)

(declare-fun res!107013 () Bool)

(assert (=> b!218288 (=> (not res!107013) (not e!141996))))

(assert (=> b!218288 (= res!107013 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!107011 () Bool)

(assert (=> start!21716 (=> (not res!107011) (not e!141996))))

(declare-fun valid!1192 (LongMapFixedSize!2940) Bool)

(assert (=> start!21716 (= res!107011 (valid!1192 thiss!1504))))

(assert (=> start!21716 e!141996))

(assert (=> start!21716 e!141997))

(assert (=> start!21716 true))

(assert (= (and start!21716 res!107011) b!218288))

(assert (= (and b!218288 res!107013) b!218290))

(assert (= (and b!218290 res!107010) b!218287))

(assert (= (and b!218287 res!107009) b!218291))

(assert (= (and b!218291 res!107007) b!218285))

(assert (= (and b!218285 res!107008) b!218292))

(assert (= (and b!218292 res!107012) b!218289))

(assert (= (and b!218294 condMapEmpty!9753) mapIsEmpty!9753))

(assert (= (and b!218294 (not condMapEmpty!9753)) mapNonEmpty!9753))

(get-info :version)

(assert (= (and mapNonEmpty!9753 ((_ is ValueCellFull!2520) mapValue!9753)) b!218286))

(assert (= (and b!218294 ((_ is ValueCellFull!2520) mapDefault!9753)) b!218293))

(assert (= b!218284 b!218294))

(assert (= start!21716 b!218284))

(declare-fun m!244269 () Bool)

(assert (=> b!218289 m!244269))

(declare-fun m!244271 () Bool)

(assert (=> start!21716 m!244271))

(declare-fun m!244273 () Bool)

(assert (=> mapNonEmpty!9753 m!244273))

(declare-fun m!244275 () Bool)

(assert (=> b!218284 m!244275))

(declare-fun m!244277 () Bool)

(assert (=> b!218284 m!244277))

(declare-fun m!244279 () Bool)

(assert (=> b!218290 m!244279))

(declare-fun m!244281 () Bool)

(assert (=> b!218287 m!244281))

(assert (=> b!218287 m!244281))

(declare-fun m!244283 () Bool)

(assert (=> b!218287 m!244283))

(declare-fun m!244285 () Bool)

(assert (=> b!218292 m!244285))

(declare-fun m!244287 () Bool)

(assert (=> b!218291 m!244287))

(check-sat (not start!21716) (not b!218290) (not b_next!5865) (not b!218284) (not b!218289) (not b!218291) tp_is_empty!5727 (not mapNonEmpty!9753) (not b!218287) (not b!218292) b_and!12755)
(check-sat b_and!12755 (not b_next!5865))
