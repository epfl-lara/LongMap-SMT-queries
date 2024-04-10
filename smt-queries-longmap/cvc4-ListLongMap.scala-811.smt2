; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19730 () Bool)

(assert start!19730)

(declare-fun b!193394 () Bool)

(declare-fun b_free!4709 () Bool)

(declare-fun b_next!4709 () Bool)

(assert (=> b!193394 (= b_free!4709 (not b_next!4709))))

(declare-fun tp!16990 () Bool)

(declare-fun b_and!11415 () Bool)

(assert (=> b!193394 (= tp!16990 b_and!11415)))

(declare-fun b!193381 () Bool)

(declare-fun res!91384 () Bool)

(declare-fun e!127244 () Bool)

(assert (=> b!193381 (=> res!91384 e!127244)))

(declare-datatypes ((V!5621 0))(
  ( (V!5622 (val!2285 Int)) )
))
(declare-datatypes ((ValueCell!1897 0))(
  ( (ValueCellFull!1897 (v!4241 V!5621)) (EmptyCell!1897) )
))
(declare-datatypes ((array!8209 0))(
  ( (array!8210 (arr!3865 (Array (_ BitVec 32) (_ BitVec 64))) (size!4189 (_ BitVec 32))) )
))
(declare-datatypes ((array!8211 0))(
  ( (array!8212 (arr!3866 (Array (_ BitVec 32) ValueCell!1897)) (size!4190 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2702 0))(
  ( (LongMapFixedSize!2703 (defaultEntry!3947 Int) (mask!9198 (_ BitVec 32)) (extraKeys!3684 (_ BitVec 32)) (zeroValue!3788 V!5621) (minValue!3788 V!5621) (_size!1400 (_ BitVec 32)) (_keys!5937 array!8209) (_values!3930 array!8211) (_vacant!1400 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2702)

(assert (=> b!193381 (= res!91384 (or (not (= (size!4190 (_values!3930 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9198 thiss!1248)))) (not (= (size!4189 (_keys!5937 thiss!1248)) (size!4190 (_values!3930 thiss!1248)))) (bvslt (mask!9198 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3684 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3684 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193382 () Bool)

(declare-fun e!127247 () Bool)

(declare-fun e!127248 () Bool)

(assert (=> b!193382 (= e!127247 e!127248)))

(declare-fun res!91389 () Bool)

(assert (=> b!193382 (=> (not res!91389) (not e!127248))))

(declare-datatypes ((SeekEntryResult!689 0))(
  ( (MissingZero!689 (index!4926 (_ BitVec 32))) (Found!689 (index!4927 (_ BitVec 32))) (Intermediate!689 (undefined!1501 Bool) (index!4928 (_ BitVec 32)) (x!20649 (_ BitVec 32))) (Undefined!689) (MissingVacant!689 (index!4929 (_ BitVec 32))) )
))
(declare-fun lt!96256 () SeekEntryResult!689)

(assert (=> b!193382 (= res!91389 (and (not (is-Undefined!689 lt!96256)) (not (is-MissingVacant!689 lt!96256)) (not (is-MissingZero!689 lt!96256)) (is-Found!689 lt!96256)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8209 (_ BitVec 32)) SeekEntryResult!689)

(assert (=> b!193382 (= lt!96256 (seekEntryOrOpen!0 key!828 (_keys!5937 thiss!1248) (mask!9198 thiss!1248)))))

(declare-fun e!127243 () Bool)

(declare-fun b!193383 () Bool)

(assert (=> b!193383 (= e!127243 (= (select (arr!3865 (_keys!5937 thiss!1248)) (index!4927 lt!96256)) key!828))))

(declare-fun b!193384 () Bool)

(declare-fun res!91385 () Bool)

(assert (=> b!193384 (=> res!91385 e!127244)))

(declare-datatypes ((List!2441 0))(
  ( (Nil!2438) (Cons!2437 (h!3078 (_ BitVec 64)) (t!7363 List!2441)) )
))
(declare-fun arrayNoDuplicates!0 (array!8209 (_ BitVec 32) List!2441) Bool)

(assert (=> b!193384 (= res!91385 (not (arrayNoDuplicates!0 (_keys!5937 thiss!1248) #b00000000000000000000000000000000 Nil!2438)))))

(declare-fun b!193385 () Bool)

(declare-fun res!91387 () Bool)

(assert (=> b!193385 (=> res!91387 e!127244)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8209 (_ BitVec 32)) Bool)

(assert (=> b!193385 (= res!91387 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5937 thiss!1248) (mask!9198 thiss!1248))))))

(declare-fun b!193386 () Bool)

(declare-fun res!91388 () Bool)

(assert (=> b!193386 (=> (not res!91388) (not e!127247))))

(assert (=> b!193386 (= res!91388 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7748 () Bool)

(declare-fun mapRes!7748 () Bool)

(assert (=> mapIsEmpty!7748 mapRes!7748))

(declare-fun b!193388 () Bool)

(assert (=> b!193388 (= e!127248 (not e!127244))))

(declare-fun res!91390 () Bool)

(assert (=> b!193388 (=> res!91390 e!127244)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193388 (= res!91390 (not (validMask!0 (mask!9198 thiss!1248))))))

(declare-fun v!309 () V!5621)

(declare-datatypes ((tuple2!3550 0))(
  ( (tuple2!3551 (_1!1786 (_ BitVec 64)) (_2!1786 V!5621)) )
))
(declare-datatypes ((List!2442 0))(
  ( (Nil!2439) (Cons!2438 (h!3079 tuple2!3550) (t!7364 List!2442)) )
))
(declare-datatypes ((ListLongMap!2467 0))(
  ( (ListLongMap!2468 (toList!1249 List!2442)) )
))
(declare-fun lt!96257 () ListLongMap!2467)

(declare-fun +!317 (ListLongMap!2467 tuple2!3550) ListLongMap!2467)

(declare-fun getCurrentListMap!897 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5621 V!5621 (_ BitVec 32) Int) ListLongMap!2467)

(assert (=> b!193388 (= (+!317 lt!96257 (tuple2!3551 key!828 v!309)) (getCurrentListMap!897 (_keys!5937 thiss!1248) (array!8212 (store (arr!3866 (_values!3930 thiss!1248)) (index!4927 lt!96256) (ValueCellFull!1897 v!309)) (size!4190 (_values!3930 thiss!1248))) (mask!9198 thiss!1248) (extraKeys!3684 thiss!1248) (zeroValue!3788 thiss!1248) (minValue!3788 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3947 thiss!1248)))))

(declare-datatypes ((Unit!5859 0))(
  ( (Unit!5860) )
))
(declare-fun lt!96255 () Unit!5859)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!118 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5621 V!5621 (_ BitVec 32) (_ BitVec 64) V!5621 Int) Unit!5859)

(assert (=> b!193388 (= lt!96255 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!118 (_keys!5937 thiss!1248) (_values!3930 thiss!1248) (mask!9198 thiss!1248) (extraKeys!3684 thiss!1248) (zeroValue!3788 thiss!1248) (minValue!3788 thiss!1248) (index!4927 lt!96256) key!828 v!309 (defaultEntry!3947 thiss!1248)))))

(declare-fun lt!96258 () Unit!5859)

(declare-fun e!127250 () Unit!5859)

(assert (=> b!193388 (= lt!96258 e!127250)))

(declare-fun c!34871 () Bool)

(declare-fun contains!1370 (ListLongMap!2467 (_ BitVec 64)) Bool)

(assert (=> b!193388 (= c!34871 (contains!1370 lt!96257 key!828))))

(assert (=> b!193388 (= lt!96257 (getCurrentListMap!897 (_keys!5937 thiss!1248) (_values!3930 thiss!1248) (mask!9198 thiss!1248) (extraKeys!3684 thiss!1248) (zeroValue!3788 thiss!1248) (minValue!3788 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3947 thiss!1248)))))

(declare-fun b!193389 () Bool)

(declare-fun e!127249 () Bool)

(declare-fun tp_is_empty!4481 () Bool)

(assert (=> b!193389 (= e!127249 tp_is_empty!4481)))

(declare-fun b!193390 () Bool)

(declare-fun lt!96259 () Unit!5859)

(assert (=> b!193390 (= e!127250 lt!96259)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!183 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5621 V!5621 (_ BitVec 64) Int) Unit!5859)

(assert (=> b!193390 (= lt!96259 (lemmaInListMapThenSeekEntryOrOpenFindsIt!183 (_keys!5937 thiss!1248) (_values!3930 thiss!1248) (mask!9198 thiss!1248) (extraKeys!3684 thiss!1248) (zeroValue!3788 thiss!1248) (minValue!3788 thiss!1248) key!828 (defaultEntry!3947 thiss!1248)))))

(declare-fun res!91383 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193390 (= res!91383 (inRange!0 (index!4927 lt!96256) (mask!9198 thiss!1248)))))

(assert (=> b!193390 (=> (not res!91383) (not e!127243))))

(assert (=> b!193390 e!127243))

(declare-fun b!193391 () Bool)

(declare-fun e!127242 () Bool)

(assert (=> b!193391 (= e!127242 (and e!127249 mapRes!7748))))

(declare-fun condMapEmpty!7748 () Bool)

(declare-fun mapDefault!7748 () ValueCell!1897)

