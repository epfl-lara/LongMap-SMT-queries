; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16268 () Bool)

(assert start!16268)

(declare-fun b!162303 () Bool)

(declare-fun b_free!3729 () Bool)

(declare-fun b_next!3729 () Bool)

(assert (=> b!162303 (= b_free!3729 (not b_next!3729))))

(declare-fun tp!13756 () Bool)

(declare-fun b_and!10143 () Bool)

(assert (=> b!162303 (= tp!13756 b_and!10143)))

(declare-fun b!162299 () Bool)

(declare-fun e!106320 () Bool)

(declare-fun e!106319 () Bool)

(declare-fun mapRes!5984 () Bool)

(assert (=> b!162299 (= e!106320 (and e!106319 mapRes!5984))))

(declare-fun condMapEmpty!5984 () Bool)

(declare-datatypes ((V!4355 0))(
  ( (V!4356 (val!1810 Int)) )
))
(declare-datatypes ((ValueCell!1422 0))(
  ( (ValueCellFull!1422 (v!3675 V!4355)) (EmptyCell!1422) )
))
(declare-datatypes ((array!6141 0))(
  ( (array!6142 (arr!2915 (Array (_ BitVec 32) (_ BitVec 64))) (size!3199 (_ BitVec 32))) )
))
(declare-datatypes ((array!6143 0))(
  ( (array!6144 (arr!2916 (Array (_ BitVec 32) ValueCell!1422)) (size!3200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1752 0))(
  ( (LongMapFixedSize!1753 (defaultEntry!3318 Int) (mask!7936 (_ BitVec 32)) (extraKeys!3059 (_ BitVec 32)) (zeroValue!3161 V!4355) (minValue!3161 V!4355) (_size!925 (_ BitVec 32)) (_keys!5119 array!6141) (_values!3301 array!6143) (_vacant!925 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1752)

(declare-fun mapDefault!5984 () ValueCell!1422)

(assert (=> b!162299 (= condMapEmpty!5984 (= (arr!2916 (_values!3301 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1422)) mapDefault!5984)))))

(declare-fun res!76867 () Bool)

(declare-fun e!106316 () Bool)

(assert (=> start!16268 (=> (not res!76867) (not e!106316))))

(declare-fun valid!793 (LongMapFixedSize!1752) Bool)

(assert (=> start!16268 (= res!76867 (valid!793 thiss!1248))))

(assert (=> start!16268 e!106316))

(declare-fun e!106318 () Bool)

(assert (=> start!16268 e!106318))

(assert (=> start!16268 true))

(declare-fun b!162300 () Bool)

(declare-datatypes ((SeekEntryResult!379 0))(
  ( (MissingZero!379 (index!3684 (_ BitVec 32))) (Found!379 (index!3685 (_ BitVec 32))) (Intermediate!379 (undefined!1191 Bool) (index!3686 (_ BitVec 32)) (x!17947 (_ BitVec 32))) (Undefined!379) (MissingVacant!379 (index!3687 (_ BitVec 32))) )
))
(declare-fun lt!82414 () SeekEntryResult!379)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162300 (= e!106316 (and (not ((_ is Undefined!379) lt!82414)) (not ((_ is MissingVacant!379) lt!82414)) ((_ is MissingZero!379) lt!82414) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6141 (_ BitVec 32)) SeekEntryResult!379)

(assert (=> b!162300 (= lt!82414 (seekEntryOrOpen!0 key!828 (_keys!5119 thiss!1248) (mask!7936 thiss!1248)))))

(declare-fun b!162301 () Bool)

(declare-fun res!76868 () Bool)

(assert (=> b!162301 (=> (not res!76868) (not e!106316))))

(assert (=> b!162301 (= res!76868 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5984 () Bool)

(assert (=> mapIsEmpty!5984 mapRes!5984))

(declare-fun b!162302 () Bool)

(declare-fun e!106315 () Bool)

(declare-fun tp_is_empty!3531 () Bool)

(assert (=> b!162302 (= e!106315 tp_is_empty!3531)))

(declare-fun array_inv!1865 (array!6141) Bool)

(declare-fun array_inv!1866 (array!6143) Bool)

(assert (=> b!162303 (= e!106318 (and tp!13756 tp_is_empty!3531 (array_inv!1865 (_keys!5119 thiss!1248)) (array_inv!1866 (_values!3301 thiss!1248)) e!106320))))

(declare-fun b!162304 () Bool)

(assert (=> b!162304 (= e!106319 tp_is_empty!3531)))

(declare-fun mapNonEmpty!5984 () Bool)

(declare-fun tp!13757 () Bool)

(assert (=> mapNonEmpty!5984 (= mapRes!5984 (and tp!13757 e!106315))))

(declare-fun mapRest!5984 () (Array (_ BitVec 32) ValueCell!1422))

(declare-fun mapKey!5984 () (_ BitVec 32))

(declare-fun mapValue!5984 () ValueCell!1422)

(assert (=> mapNonEmpty!5984 (= (arr!2916 (_values!3301 thiss!1248)) (store mapRest!5984 mapKey!5984 mapValue!5984))))

(assert (= (and start!16268 res!76867) b!162301))

(assert (= (and b!162301 res!76868) b!162300))

(assert (= (and b!162299 condMapEmpty!5984) mapIsEmpty!5984))

(assert (= (and b!162299 (not condMapEmpty!5984)) mapNonEmpty!5984))

(assert (= (and mapNonEmpty!5984 ((_ is ValueCellFull!1422) mapValue!5984)) b!162302))

(assert (= (and b!162299 ((_ is ValueCellFull!1422) mapDefault!5984)) b!162304))

(assert (= b!162303 b!162299))

(assert (= start!16268 b!162303))

(declare-fun m!193471 () Bool)

(assert (=> start!16268 m!193471))

(declare-fun m!193473 () Bool)

(assert (=> b!162300 m!193473))

(declare-fun m!193475 () Bool)

(assert (=> b!162303 m!193475))

(declare-fun m!193477 () Bool)

(assert (=> b!162303 m!193477))

(declare-fun m!193479 () Bool)

(assert (=> mapNonEmpty!5984 m!193479))

(check-sat b_and!10143 (not b_next!3729) (not mapNonEmpty!5984) (not b!162300) (not start!16268) (not b!162303) tp_is_empty!3531)
(check-sat b_and!10143 (not b_next!3729))
