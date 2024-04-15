; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21682 () Bool)

(assert start!21682)

(declare-fun b!217520 () Bool)

(declare-fun b_free!5827 () Bool)

(declare-fun b_next!5827 () Bool)

(assert (=> b!217520 (= b_free!5827 (not b_next!5827))))

(declare-fun tp!20615 () Bool)

(declare-fun b_and!12691 () Bool)

(assert (=> b!217520 (= tp!20615 b_and!12691)))

(declare-fun b!217510 () Bool)

(declare-fun res!106514 () Bool)

(declare-fun e!141492 () Bool)

(assert (=> b!217510 (=> (not res!106514) (not e!141492))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217510 (= res!106514 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217511 () Bool)

(declare-fun res!106513 () Bool)

(declare-fun e!141496 () Bool)

(assert (=> b!217511 (=> (not res!106513) (not e!141496))))

(declare-datatypes ((V!7233 0))(
  ( (V!7234 (val!2889 Int)) )
))
(declare-datatypes ((ValueCell!2501 0))(
  ( (ValueCellFull!2501 (v!4901 V!7233)) (EmptyCell!2501) )
))
(declare-datatypes ((array!10609 0))(
  ( (array!10610 (arr!5025 (Array (_ BitVec 32) ValueCell!2501)) (size!5358 (_ BitVec 32))) )
))
(declare-datatypes ((array!10611 0))(
  ( (array!10612 (arr!5026 (Array (_ BitVec 32) (_ BitVec 64))) (size!5359 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2902 0))(
  ( (LongMapFixedSize!2903 (defaultEntry!4101 Int) (mask!9861 (_ BitVec 32)) (extraKeys!3838 (_ BitVec 32)) (zeroValue!3942 V!7233) (minValue!3942 V!7233) (_size!1500 (_ BitVec 32)) (_keys!6149 array!10611) (_values!4084 array!10609) (_vacant!1500 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2902)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10611 (_ BitVec 32)) Bool)

(assert (=> b!217511 (= res!106513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6149 thiss!1504) (mask!9861 thiss!1504)))))

(declare-fun b!217512 () Bool)

(declare-fun res!106516 () Bool)

(assert (=> b!217512 (=> (not res!106516) (not e!141496))))

(assert (=> b!217512 (= res!106516 (and (= (size!5358 (_values!4084 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9861 thiss!1504))) (= (size!5359 (_keys!6149 thiss!1504)) (size!5358 (_values!4084 thiss!1504))) (bvsge (mask!9861 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3838 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3838 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106517 () Bool)

(assert (=> start!21682 (=> (not res!106517) (not e!141492))))

(declare-fun valid!1194 (LongMapFixedSize!2902) Bool)

(assert (=> start!21682 (= res!106517 (valid!1194 thiss!1504))))

(assert (=> start!21682 e!141492))

(declare-fun e!141495 () Bool)

(assert (=> start!21682 e!141495))

(assert (=> start!21682 true))

(declare-fun b!217513 () Bool)

(declare-fun res!106519 () Bool)

(assert (=> b!217513 (=> (not res!106519) (not e!141496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217513 (= res!106519 (validMask!0 (mask!9861 thiss!1504)))))

(declare-fun b!217514 () Bool)

(declare-fun e!141491 () Bool)

(declare-fun tp_is_empty!5689 () Bool)

(assert (=> b!217514 (= e!141491 tp_is_empty!5689)))

(declare-fun b!217515 () Bool)

(assert (=> b!217515 (= e!141492 e!141496)))

(declare-fun res!106515 () Bool)

(assert (=> b!217515 (=> (not res!106515) (not e!141496))))

(declare-datatypes ((SeekEntryResult!768 0))(
  ( (MissingZero!768 (index!5242 (_ BitVec 32))) (Found!768 (index!5243 (_ BitVec 32))) (Intermediate!768 (undefined!1580 Bool) (index!5244 (_ BitVec 32)) (x!22759 (_ BitVec 32))) (Undefined!768) (MissingVacant!768 (index!5245 (_ BitVec 32))) )
))
(declare-fun lt!111206 () SeekEntryResult!768)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217515 (= res!106515 (or (= lt!111206 (MissingZero!768 index!297)) (= lt!111206 (MissingVacant!768 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10611 (_ BitVec 32)) SeekEntryResult!768)

(assert (=> b!217515 (= lt!111206 (seekEntryOrOpen!0 key!932 (_keys!6149 thiss!1504) (mask!9861 thiss!1504)))))

(declare-fun b!217516 () Bool)

(declare-fun e!141497 () Bool)

(declare-fun mapRes!9696 () Bool)

(assert (=> b!217516 (= e!141497 (and e!141491 mapRes!9696))))

(declare-fun condMapEmpty!9696 () Bool)

(declare-fun mapDefault!9696 () ValueCell!2501)

(assert (=> b!217516 (= condMapEmpty!9696 (= (arr!5025 (_values!4084 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2501)) mapDefault!9696)))))

(declare-fun b!217517 () Bool)

(assert (=> b!217517 (= e!141496 false)))

(declare-fun lt!111205 () Bool)

(declare-datatypes ((List!3184 0))(
  ( (Nil!3181) (Cons!3180 (h!3827 (_ BitVec 64)) (t!8130 List!3184)) )
))
(declare-fun arrayNoDuplicates!0 (array!10611 (_ BitVec 32) List!3184) Bool)

(assert (=> b!217517 (= lt!111205 (arrayNoDuplicates!0 (_keys!6149 thiss!1504) #b00000000000000000000000000000000 Nil!3181))))

(declare-fun b!217518 () Bool)

(declare-fun res!106518 () Bool)

(assert (=> b!217518 (=> (not res!106518) (not e!141496))))

(declare-datatypes ((tuple2!4258 0))(
  ( (tuple2!4259 (_1!2140 (_ BitVec 64)) (_2!2140 V!7233)) )
))
(declare-datatypes ((List!3185 0))(
  ( (Nil!3182) (Cons!3181 (h!3828 tuple2!4258) (t!8131 List!3185)) )
))
(declare-datatypes ((ListLongMap!3161 0))(
  ( (ListLongMap!3162 (toList!1596 List!3185)) )
))
(declare-fun contains!1437 (ListLongMap!3161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1105 (array!10611 array!10609 (_ BitVec 32) (_ BitVec 32) V!7233 V!7233 (_ BitVec 32) Int) ListLongMap!3161)

(assert (=> b!217518 (= res!106518 (not (contains!1437 (getCurrentListMap!1105 (_keys!6149 thiss!1504) (_values!4084 thiss!1504) (mask!9861 thiss!1504) (extraKeys!3838 thiss!1504) (zeroValue!3942 thiss!1504) (minValue!3942 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4101 thiss!1504)) key!932)))))

(declare-fun b!217519 () Bool)

(declare-fun e!141494 () Bool)

(assert (=> b!217519 (= e!141494 tp_is_empty!5689)))

(declare-fun array_inv!3311 (array!10611) Bool)

(declare-fun array_inv!3312 (array!10609) Bool)

(assert (=> b!217520 (= e!141495 (and tp!20615 tp_is_empty!5689 (array_inv!3311 (_keys!6149 thiss!1504)) (array_inv!3312 (_values!4084 thiss!1504)) e!141497))))

(declare-fun mapIsEmpty!9696 () Bool)

(assert (=> mapIsEmpty!9696 mapRes!9696))

(declare-fun mapNonEmpty!9696 () Bool)

(declare-fun tp!20616 () Bool)

(assert (=> mapNonEmpty!9696 (= mapRes!9696 (and tp!20616 e!141494))))

(declare-fun mapRest!9696 () (Array (_ BitVec 32) ValueCell!2501))

(declare-fun mapKey!9696 () (_ BitVec 32))

(declare-fun mapValue!9696 () ValueCell!2501)

(assert (=> mapNonEmpty!9696 (= (arr!5025 (_values!4084 thiss!1504)) (store mapRest!9696 mapKey!9696 mapValue!9696))))

(assert (= (and start!21682 res!106517) b!217510))

(assert (= (and b!217510 res!106514) b!217515))

(assert (= (and b!217515 res!106515) b!217518))

(assert (= (and b!217518 res!106518) b!217513))

(assert (= (and b!217513 res!106519) b!217512))

(assert (= (and b!217512 res!106516) b!217511))

(assert (= (and b!217511 res!106513) b!217517))

(assert (= (and b!217516 condMapEmpty!9696) mapIsEmpty!9696))

(assert (= (and b!217516 (not condMapEmpty!9696)) mapNonEmpty!9696))

(get-info :version)

(assert (= (and mapNonEmpty!9696 ((_ is ValueCellFull!2501) mapValue!9696)) b!217519))

(assert (= (and b!217516 ((_ is ValueCellFull!2501) mapDefault!9696)) b!217514))

(assert (= b!217520 b!217516))

(assert (= start!21682 b!217520))

(declare-fun m!243273 () Bool)

(assert (=> b!217520 m!243273))

(declare-fun m!243275 () Bool)

(assert (=> b!217520 m!243275))

(declare-fun m!243277 () Bool)

(assert (=> start!21682 m!243277))

(declare-fun m!243279 () Bool)

(assert (=> b!217518 m!243279))

(assert (=> b!217518 m!243279))

(declare-fun m!243281 () Bool)

(assert (=> b!217518 m!243281))

(declare-fun m!243283 () Bool)

(assert (=> b!217515 m!243283))

(declare-fun m!243285 () Bool)

(assert (=> b!217517 m!243285))

(declare-fun m!243287 () Bool)

(assert (=> mapNonEmpty!9696 m!243287))

(declare-fun m!243289 () Bool)

(assert (=> b!217513 m!243289))

(declare-fun m!243291 () Bool)

(assert (=> b!217511 m!243291))

(check-sat (not mapNonEmpty!9696) b_and!12691 (not b!217511) (not b!217518) (not b!217515) (not start!21682) (not b!217517) (not b!217520) (not b_next!5827) tp_is_empty!5689 (not b!217513))
(check-sat b_and!12691 (not b_next!5827))
