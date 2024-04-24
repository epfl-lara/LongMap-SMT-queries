; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18434 () Bool)

(assert start!18434)

(declare-fun b!182839 () Bool)

(declare-fun b_free!4507 () Bool)

(declare-fun b_next!4507 () Bool)

(assert (=> b!182839 (= b_free!4507 (not b_next!4507))))

(declare-fun tp!16285 () Bool)

(declare-fun b_and!11087 () Bool)

(assert (=> b!182839 (= tp!16285 b_and!11087)))

(declare-fun b!182837 () Bool)

(declare-fun e!120375 () Bool)

(declare-fun tp_is_empty!4279 () Bool)

(assert (=> b!182837 (= e!120375 tp_is_empty!4279)))

(declare-fun b!182838 () Bool)

(declare-fun res!86529 () Bool)

(declare-fun e!120376 () Bool)

(assert (=> b!182838 (=> (not res!86529) (not e!120376))))

(declare-datatypes ((V!5353 0))(
  ( (V!5354 (val!2184 Int)) )
))
(declare-datatypes ((ValueCell!1796 0))(
  ( (ValueCellFull!1796 (v!4086 V!5353)) (EmptyCell!1796) )
))
(declare-datatypes ((array!7733 0))(
  ( (array!7734 (arr!3656 (Array (_ BitVec 32) (_ BitVec 64))) (size!3968 (_ BitVec 32))) )
))
(declare-datatypes ((array!7735 0))(
  ( (array!7736 (arr!3657 (Array (_ BitVec 32) ValueCell!1796)) (size!3969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2500 0))(
  ( (LongMapFixedSize!2501 (defaultEntry!3738 Int) (mask!8789 (_ BitVec 32)) (extraKeys!3475 (_ BitVec 32)) (zeroValue!3579 V!5353) (minValue!3579 V!5353) (_size!1299 (_ BitVec 32)) (_keys!5653 array!7733) (_values!3721 array!7735) (_vacant!1299 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2500)

(assert (=> b!182838 (= res!86529 (and (= (size!3969 (_values!3721 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8789 thiss!1248))) (= (size!3968 (_keys!5653 thiss!1248)) (size!3969 (_values!3721 thiss!1248))) (bvsge (mask!8789 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3475 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3475 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!120374 () Bool)

(declare-fun e!120379 () Bool)

(declare-fun array_inv!2361 (array!7733) Bool)

(declare-fun array_inv!2362 (array!7735) Bool)

(assert (=> b!182839 (= e!120374 (and tp!16285 tp_is_empty!4279 (array_inv!2361 (_keys!5653 thiss!1248)) (array_inv!2362 (_values!3721 thiss!1248)) e!120379))))

(declare-fun b!182840 () Bool)

(assert (=> b!182840 (= e!120376 false)))

(declare-fun lt!90461 () Bool)

(declare-datatypes ((List!2288 0))(
  ( (Nil!2285) (Cons!2284 (h!2913 (_ BitVec 64)) (t!7144 List!2288)) )
))
(declare-fun arrayNoDuplicates!0 (array!7733 (_ BitVec 32) List!2288) Bool)

(assert (=> b!182840 (= lt!90461 (arrayNoDuplicates!0 (_keys!5653 thiss!1248) #b00000000000000000000000000000000 Nil!2285))))

(declare-fun b!182841 () Bool)

(declare-fun res!86535 () Bool)

(assert (=> b!182841 (=> (not res!86535) (not e!120376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7733 (_ BitVec 32)) Bool)

(assert (=> b!182841 (= res!86535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5653 thiss!1248) (mask!8789 thiss!1248)))))

(declare-fun mapNonEmpty!7346 () Bool)

(declare-fun mapRes!7346 () Bool)

(declare-fun tp!16286 () Bool)

(assert (=> mapNonEmpty!7346 (= mapRes!7346 (and tp!16286 e!120375))))

(declare-fun mapRest!7346 () (Array (_ BitVec 32) ValueCell!1796))

(declare-fun mapValue!7346 () ValueCell!1796)

(declare-fun mapKey!7346 () (_ BitVec 32))

(assert (=> mapNonEmpty!7346 (= (arr!3657 (_values!3721 thiss!1248)) (store mapRest!7346 mapKey!7346 mapValue!7346))))

(declare-fun b!182842 () Bool)

(declare-fun e!120377 () Bool)

(assert (=> b!182842 (= e!120379 (and e!120377 mapRes!7346))))

(declare-fun condMapEmpty!7346 () Bool)

(declare-fun mapDefault!7346 () ValueCell!1796)

(assert (=> b!182842 (= condMapEmpty!7346 (= (arr!3657 (_values!3721 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1796)) mapDefault!7346)))))

(declare-fun b!182843 () Bool)

(declare-fun res!86532 () Bool)

(assert (=> b!182843 (=> (not res!86532) (not e!120376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182843 (= res!86532 (validMask!0 (mask!8789 thiss!1248)))))

(declare-fun b!182844 () Bool)

(assert (=> b!182844 (= e!120377 tp_is_empty!4279)))

(declare-fun b!182845 () Bool)

(declare-fun res!86533 () Bool)

(declare-fun e!120378 () Bool)

(assert (=> b!182845 (=> (not res!86533) (not e!120378))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182845 (= res!86533 (not (= key!828 (bvneg key!828))))))

(declare-fun res!86531 () Bool)

(assert (=> start!18434 (=> (not res!86531) (not e!120378))))

(declare-fun valid!1058 (LongMapFixedSize!2500) Bool)

(assert (=> start!18434 (= res!86531 (valid!1058 thiss!1248))))

(assert (=> start!18434 e!120378))

(assert (=> start!18434 e!120374))

(assert (=> start!18434 true))

(declare-fun b!182846 () Bool)

(assert (=> b!182846 (= e!120378 e!120376)))

(declare-fun res!86530 () Bool)

(assert (=> b!182846 (=> (not res!86530) (not e!120376))))

(declare-datatypes ((SeekEntryResult!600 0))(
  ( (MissingZero!600 (index!4570 (_ BitVec 32))) (Found!600 (index!4571 (_ BitVec 32))) (Intermediate!600 (undefined!1412 Bool) (index!4572 (_ BitVec 32)) (x!19910 (_ BitVec 32))) (Undefined!600) (MissingVacant!600 (index!4573 (_ BitVec 32))) )
))
(declare-fun lt!90462 () SeekEntryResult!600)

(get-info :version)

(assert (=> b!182846 (= res!86530 (and (not ((_ is Undefined!600) lt!90462)) (not ((_ is MissingVacant!600) lt!90462)) (not ((_ is MissingZero!600) lt!90462)) ((_ is Found!600) lt!90462)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7733 (_ BitVec 32)) SeekEntryResult!600)

(assert (=> b!182846 (= lt!90462 (seekEntryOrOpen!0 key!828 (_keys!5653 thiss!1248) (mask!8789 thiss!1248)))))

(declare-fun b!182847 () Bool)

(declare-fun res!86534 () Bool)

(assert (=> b!182847 (=> (not res!86534) (not e!120376))))

(declare-datatypes ((tuple2!3348 0))(
  ( (tuple2!3349 (_1!1685 (_ BitVec 64)) (_2!1685 V!5353)) )
))
(declare-datatypes ((List!2289 0))(
  ( (Nil!2286) (Cons!2285 (h!2914 tuple2!3348) (t!7145 List!2289)) )
))
(declare-datatypes ((ListLongMap!2269 0))(
  ( (ListLongMap!2270 (toList!1150 List!2289)) )
))
(declare-fun contains!1247 (ListLongMap!2269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!802 (array!7733 array!7735 (_ BitVec 32) (_ BitVec 32) V!5353 V!5353 (_ BitVec 32) Int) ListLongMap!2269)

(assert (=> b!182847 (= res!86534 (contains!1247 (getCurrentListMap!802 (_keys!5653 thiss!1248) (_values!3721 thiss!1248) (mask!8789 thiss!1248) (extraKeys!3475 thiss!1248) (zeroValue!3579 thiss!1248) (minValue!3579 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3738 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7346 () Bool)

(assert (=> mapIsEmpty!7346 mapRes!7346))

(assert (= (and start!18434 res!86531) b!182845))

(assert (= (and b!182845 res!86533) b!182846))

(assert (= (and b!182846 res!86530) b!182847))

(assert (= (and b!182847 res!86534) b!182843))

(assert (= (and b!182843 res!86532) b!182838))

(assert (= (and b!182838 res!86529) b!182841))

(assert (= (and b!182841 res!86535) b!182840))

(assert (= (and b!182842 condMapEmpty!7346) mapIsEmpty!7346))

(assert (= (and b!182842 (not condMapEmpty!7346)) mapNonEmpty!7346))

(assert (= (and mapNonEmpty!7346 ((_ is ValueCellFull!1796) mapValue!7346)) b!182837))

(assert (= (and b!182842 ((_ is ValueCellFull!1796) mapDefault!7346)) b!182844))

(assert (= b!182839 b!182842))

(assert (= start!18434 b!182839))

(declare-fun m!210651 () Bool)

(assert (=> b!182843 m!210651))

(declare-fun m!210653 () Bool)

(assert (=> start!18434 m!210653))

(declare-fun m!210655 () Bool)

(assert (=> b!182839 m!210655))

(declare-fun m!210657 () Bool)

(assert (=> b!182839 m!210657))

(declare-fun m!210659 () Bool)

(assert (=> b!182841 m!210659))

(declare-fun m!210661 () Bool)

(assert (=> b!182847 m!210661))

(assert (=> b!182847 m!210661))

(declare-fun m!210663 () Bool)

(assert (=> b!182847 m!210663))

(declare-fun m!210665 () Bool)

(assert (=> b!182846 m!210665))

(declare-fun m!210667 () Bool)

(assert (=> mapNonEmpty!7346 m!210667))

(declare-fun m!210669 () Bool)

(assert (=> b!182840 m!210669))

(check-sat (not b!182840) (not b!182843) (not mapNonEmpty!7346) (not start!18434) b_and!11087 (not b!182847) (not b!182846) (not b_next!4507) tp_is_empty!4279 (not b!182839) (not b!182841))
(check-sat b_and!11087 (not b_next!4507))
