; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21662 () Bool)

(assert start!21662)

(declare-fun b!217400 () Bool)

(declare-fun b_free!5811 () Bool)

(declare-fun b_next!5811 () Bool)

(assert (=> b!217400 (= b_free!5811 (not b_next!5811))))

(declare-fun tp!20568 () Bool)

(declare-fun b_and!12701 () Bool)

(assert (=> b!217400 (= tp!20568 b_and!12701)))

(declare-fun b!217393 () Bool)

(declare-fun res!106445 () Bool)

(declare-fun e!141430 () Bool)

(assert (=> b!217393 (=> (not res!106445) (not e!141430))))

(declare-datatypes ((V!7211 0))(
  ( (V!7212 (val!2881 Int)) )
))
(declare-datatypes ((ValueCell!2493 0))(
  ( (ValueCellFull!2493 (v!4899 V!7211)) (EmptyCell!2493) )
))
(declare-datatypes ((array!10585 0))(
  ( (array!10586 (arr!5014 (Array (_ BitVec 32) ValueCell!2493)) (size!5346 (_ BitVec 32))) )
))
(declare-datatypes ((array!10587 0))(
  ( (array!10588 (arr!5015 (Array (_ BitVec 32) (_ BitVec 64))) (size!5347 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2886 0))(
  ( (LongMapFixedSize!2887 (defaultEntry!4093 Int) (mask!9848 (_ BitVec 32)) (extraKeys!3830 (_ BitVec 32)) (zeroValue!3934 V!7211) (minValue!3934 V!7211) (_size!1492 (_ BitVec 32)) (_keys!6142 array!10587) (_values!4076 array!10585) (_vacant!1492 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2886)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217393 (= res!106445 (validMask!0 (mask!9848 thiss!1504)))))

(declare-fun b!217394 () Bool)

(declare-fun res!106444 () Bool)

(assert (=> b!217394 (=> (not res!106444) (not e!141430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10587 (_ BitVec 32)) Bool)

(assert (=> b!217394 (= res!106444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6142 thiss!1504) (mask!9848 thiss!1504)))))

(declare-fun mapNonEmpty!9672 () Bool)

(declare-fun mapRes!9672 () Bool)

(declare-fun tp!20567 () Bool)

(declare-fun e!141428 () Bool)

(assert (=> mapNonEmpty!9672 (= mapRes!9672 (and tp!20567 e!141428))))

(declare-fun mapRest!9672 () (Array (_ BitVec 32) ValueCell!2493))

(declare-fun mapKey!9672 () (_ BitVec 32))

(declare-fun mapValue!9672 () ValueCell!2493)

(assert (=> mapNonEmpty!9672 (= (arr!5014 (_values!4076 thiss!1504)) (store mapRest!9672 mapKey!9672 mapValue!9672))))

(declare-fun b!217395 () Bool)

(declare-fun res!106440 () Bool)

(declare-fun e!141424 () Bool)

(assert (=> b!217395 (=> (not res!106440) (not e!141424))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217395 (= res!106440 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217396 () Bool)

(declare-fun e!141426 () Bool)

(declare-fun tp_is_empty!5673 () Bool)

(assert (=> b!217396 (= e!141426 tp_is_empty!5673)))

(declare-fun b!217397 () Bool)

(declare-fun res!106442 () Bool)

(assert (=> b!217397 (=> (not res!106442) (not e!141430))))

(assert (=> b!217397 (= res!106442 (and (= (size!5346 (_values!4076 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9848 thiss!1504))) (= (size!5347 (_keys!6142 thiss!1504)) (size!5346 (_values!4076 thiss!1504))) (bvsge (mask!9848 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3830 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3830 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217398 () Bool)

(assert (=> b!217398 (= e!141428 tp_is_empty!5673)))

(declare-fun b!217399 () Bool)

(declare-fun res!106443 () Bool)

(assert (=> b!217399 (=> (not res!106443) (not e!141430))))

(declare-datatypes ((tuple2!4286 0))(
  ( (tuple2!4287 (_1!2154 (_ BitVec 64)) (_2!2154 V!7211)) )
))
(declare-datatypes ((List!3190 0))(
  ( (Nil!3187) (Cons!3186 (h!3833 tuple2!4286) (t!8145 List!3190)) )
))
(declare-datatypes ((ListLongMap!3199 0))(
  ( (ListLongMap!3200 (toList!1615 List!3190)) )
))
(declare-fun contains!1456 (ListLongMap!3199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1143 (array!10587 array!10585 (_ BitVec 32) (_ BitVec 32) V!7211 V!7211 (_ BitVec 32) Int) ListLongMap!3199)

(assert (=> b!217399 (= res!106443 (contains!1456 (getCurrentListMap!1143 (_keys!6142 thiss!1504) (_values!4076 thiss!1504) (mask!9848 thiss!1504) (extraKeys!3830 thiss!1504) (zeroValue!3934 thiss!1504) (minValue!3934 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4093 thiss!1504)) key!932))))

(declare-fun e!141427 () Bool)

(declare-fun e!141425 () Bool)

(declare-fun array_inv!3321 (array!10587) Bool)

(declare-fun array_inv!3322 (array!10585) Bool)

(assert (=> b!217400 (= e!141425 (and tp!20568 tp_is_empty!5673 (array_inv!3321 (_keys!6142 thiss!1504)) (array_inv!3322 (_values!4076 thiss!1504)) e!141427))))

(declare-fun b!217401 () Bool)

(assert (=> b!217401 (= e!141424 e!141430)))

(declare-fun res!106446 () Bool)

(assert (=> b!217401 (=> (not res!106446) (not e!141430))))

(declare-datatypes ((SeekEntryResult!767 0))(
  ( (MissingZero!767 (index!5238 (_ BitVec 32))) (Found!767 (index!5239 (_ BitVec 32))) (Intermediate!767 (undefined!1579 Bool) (index!5240 (_ BitVec 32)) (x!22735 (_ BitVec 32))) (Undefined!767) (MissingVacant!767 (index!5241 (_ BitVec 32))) )
))
(declare-fun lt!111339 () SeekEntryResult!767)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217401 (= res!106446 (or (= lt!111339 (MissingZero!767 index!297)) (= lt!111339 (MissingVacant!767 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10587 (_ BitVec 32)) SeekEntryResult!767)

(assert (=> b!217401 (= lt!111339 (seekEntryOrOpen!0 key!932 (_keys!6142 thiss!1504) (mask!9848 thiss!1504)))))

(declare-fun b!217402 () Bool)

(assert (=> b!217402 (= e!141427 (and e!141426 mapRes!9672))))

(declare-fun condMapEmpty!9672 () Bool)

(declare-fun mapDefault!9672 () ValueCell!2493)

(assert (=> b!217402 (= condMapEmpty!9672 (= (arr!5014 (_values!4076 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2493)) mapDefault!9672)))))

(declare-fun b!217403 () Bool)

(assert (=> b!217403 (= e!141430 false)))

(declare-fun lt!111338 () Bool)

(declare-datatypes ((List!3191 0))(
  ( (Nil!3188) (Cons!3187 (h!3834 (_ BitVec 64)) (t!8146 List!3191)) )
))
(declare-fun arrayNoDuplicates!0 (array!10587 (_ BitVec 32) List!3191) Bool)

(assert (=> b!217403 (= lt!111338 (arrayNoDuplicates!0 (_keys!6142 thiss!1504) #b00000000000000000000000000000000 Nil!3188))))

(declare-fun mapIsEmpty!9672 () Bool)

(assert (=> mapIsEmpty!9672 mapRes!9672))

(declare-fun res!106441 () Bool)

(assert (=> start!21662 (=> (not res!106441) (not e!141424))))

(declare-fun valid!1173 (LongMapFixedSize!2886) Bool)

(assert (=> start!21662 (= res!106441 (valid!1173 thiss!1504))))

(assert (=> start!21662 e!141424))

(assert (=> start!21662 e!141425))

(assert (=> start!21662 true))

(assert (= (and start!21662 res!106441) b!217395))

(assert (= (and b!217395 res!106440) b!217401))

(assert (= (and b!217401 res!106446) b!217399))

(assert (= (and b!217399 res!106443) b!217393))

(assert (= (and b!217393 res!106445) b!217397))

(assert (= (and b!217397 res!106442) b!217394))

(assert (= (and b!217394 res!106444) b!217403))

(assert (= (and b!217402 condMapEmpty!9672) mapIsEmpty!9672))

(assert (= (and b!217402 (not condMapEmpty!9672)) mapNonEmpty!9672))

(get-info :version)

(assert (= (and mapNonEmpty!9672 ((_ is ValueCellFull!2493) mapValue!9672)) b!217398))

(assert (= (and b!217402 ((_ is ValueCellFull!2493) mapDefault!9672)) b!217396))

(assert (= b!217400 b!217402))

(assert (= start!21662 b!217400))

(declare-fun m!243729 () Bool)

(assert (=> b!217401 m!243729))

(declare-fun m!243731 () Bool)

(assert (=> b!217394 m!243731))

(declare-fun m!243733 () Bool)

(assert (=> b!217399 m!243733))

(assert (=> b!217399 m!243733))

(declare-fun m!243735 () Bool)

(assert (=> b!217399 m!243735))

(declare-fun m!243737 () Bool)

(assert (=> start!21662 m!243737))

(declare-fun m!243739 () Bool)

(assert (=> b!217403 m!243739))

(declare-fun m!243741 () Bool)

(assert (=> b!217393 m!243741))

(declare-fun m!243743 () Bool)

(assert (=> b!217400 m!243743))

(declare-fun m!243745 () Bool)

(assert (=> b!217400 m!243745))

(declare-fun m!243747 () Bool)

(assert (=> mapNonEmpty!9672 m!243747))

(check-sat b_and!12701 (not start!21662) (not b_next!5811) (not mapNonEmpty!9672) (not b!217400) (not b!217403) tp_is_empty!5673 (not b!217394) (not b!217401) (not b!217393) (not b!217399))
(check-sat b_and!12701 (not b_next!5811))
