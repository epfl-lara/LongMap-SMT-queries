; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21670 () Bool)

(assert start!21670)

(declare-fun b!217315 () Bool)

(declare-fun b_free!5815 () Bool)

(declare-fun b_next!5815 () Bool)

(assert (=> b!217315 (= b_free!5815 (not b_next!5815))))

(declare-fun tp!20580 () Bool)

(declare-fun b_and!12679 () Bool)

(assert (=> b!217315 (= tp!20580 b_and!12679)))

(declare-fun b!217312 () Bool)

(declare-fun res!106387 () Bool)

(declare-fun e!141368 () Bool)

(assert (=> b!217312 (=> (not res!106387) (not e!141368))))

(declare-datatypes ((V!7217 0))(
  ( (V!7218 (val!2883 Int)) )
))
(declare-datatypes ((ValueCell!2495 0))(
  ( (ValueCellFull!2495 (v!4895 V!7217)) (EmptyCell!2495) )
))
(declare-datatypes ((array!10585 0))(
  ( (array!10586 (arr!5013 (Array (_ BitVec 32) ValueCell!2495)) (size!5346 (_ BitVec 32))) )
))
(declare-datatypes ((array!10587 0))(
  ( (array!10588 (arr!5014 (Array (_ BitVec 32) (_ BitVec 64))) (size!5347 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2890 0))(
  ( (LongMapFixedSize!2891 (defaultEntry!4095 Int) (mask!9851 (_ BitVec 32)) (extraKeys!3832 (_ BitVec 32)) (zeroValue!3936 V!7217) (minValue!3936 V!7217) (_size!1494 (_ BitVec 32)) (_keys!6143 array!10587) (_values!4078 array!10585) (_vacant!1494 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2890)

(assert (=> b!217312 (= res!106387 (and (= (size!5346 (_values!4078 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9851 thiss!1504))) (= (size!5347 (_keys!6143 thiss!1504)) (size!5346 (_values!4078 thiss!1504))) (bvsge (mask!9851 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3832 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3832 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217313 () Bool)

(declare-fun res!106393 () Bool)

(assert (=> b!217313 (=> (not res!106393) (not e!141368))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4248 0))(
  ( (tuple2!4249 (_1!2135 (_ BitVec 64)) (_2!2135 V!7217)) )
))
(declare-datatypes ((List!3175 0))(
  ( (Nil!3172) (Cons!3171 (h!3818 tuple2!4248) (t!8121 List!3175)) )
))
(declare-datatypes ((ListLongMap!3151 0))(
  ( (ListLongMap!3152 (toList!1591 List!3175)) )
))
(declare-fun contains!1432 (ListLongMap!3151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1100 (array!10587 array!10585 (_ BitVec 32) (_ BitVec 32) V!7217 V!7217 (_ BitVec 32) Int) ListLongMap!3151)

(assert (=> b!217313 (= res!106393 (not (contains!1432 (getCurrentListMap!1100 (_keys!6143 thiss!1504) (_values!4078 thiss!1504) (mask!9851 thiss!1504) (extraKeys!3832 thiss!1504) (zeroValue!3936 thiss!1504) (minValue!3936 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4095 thiss!1504)) key!932)))))

(declare-fun mapIsEmpty!9678 () Bool)

(declare-fun mapRes!9678 () Bool)

(assert (=> mapIsEmpty!9678 mapRes!9678))

(declare-fun mapNonEmpty!9678 () Bool)

(declare-fun tp!20579 () Bool)

(declare-fun e!141371 () Bool)

(assert (=> mapNonEmpty!9678 (= mapRes!9678 (and tp!20579 e!141371))))

(declare-fun mapValue!9678 () ValueCell!2495)

(declare-fun mapKey!9678 () (_ BitVec 32))

(declare-fun mapRest!9678 () (Array (_ BitVec 32) ValueCell!2495))

(assert (=> mapNonEmpty!9678 (= (arr!5013 (_values!4078 thiss!1504)) (store mapRest!9678 mapKey!9678 mapValue!9678))))

(declare-fun res!106390 () Bool)

(declare-fun e!141370 () Bool)

(assert (=> start!21670 (=> (not res!106390) (not e!141370))))

(declare-fun valid!1189 (LongMapFixedSize!2890) Bool)

(assert (=> start!21670 (= res!106390 (valid!1189 thiss!1504))))

(assert (=> start!21670 e!141370))

(declare-fun e!141365 () Bool)

(assert (=> start!21670 e!141365))

(assert (=> start!21670 true))

(declare-fun b!217314 () Bool)

(assert (=> b!217314 (= e!141370 e!141368)))

(declare-fun res!106391 () Bool)

(assert (=> b!217314 (=> (not res!106391) (not e!141368))))

(declare-datatypes ((SeekEntryResult!763 0))(
  ( (MissingZero!763 (index!5222 (_ BitVec 32))) (Found!763 (index!5223 (_ BitVec 32))) (Intermediate!763 (undefined!1575 Bool) (index!5224 (_ BitVec 32)) (x!22738 (_ BitVec 32))) (Undefined!763) (MissingVacant!763 (index!5225 (_ BitVec 32))) )
))
(declare-fun lt!111169 () SeekEntryResult!763)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217314 (= res!106391 (or (= lt!111169 (MissingZero!763 index!297)) (= lt!111169 (MissingVacant!763 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10587 (_ BitVec 32)) SeekEntryResult!763)

(assert (=> b!217314 (= lt!111169 (seekEntryOrOpen!0 key!932 (_keys!6143 thiss!1504) (mask!9851 thiss!1504)))))

(declare-fun e!141367 () Bool)

(declare-fun tp_is_empty!5677 () Bool)

(declare-fun array_inv!3301 (array!10587) Bool)

(declare-fun array_inv!3302 (array!10585) Bool)

(assert (=> b!217315 (= e!141365 (and tp!20580 tp_is_empty!5677 (array_inv!3301 (_keys!6143 thiss!1504)) (array_inv!3302 (_values!4078 thiss!1504)) e!141367))))

(declare-fun b!217316 () Bool)

(declare-fun e!141366 () Bool)

(assert (=> b!217316 (= e!141366 tp_is_empty!5677)))

(declare-fun b!217317 () Bool)

(assert (=> b!217317 (= e!141371 tp_is_empty!5677)))

(declare-fun b!217318 () Bool)

(declare-fun res!106389 () Bool)

(assert (=> b!217318 (=> (not res!106389) (not e!141368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10587 (_ BitVec 32)) Bool)

(assert (=> b!217318 (= res!106389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6143 thiss!1504) (mask!9851 thiss!1504)))))

(declare-fun b!217319 () Bool)

(declare-fun res!106392 () Bool)

(assert (=> b!217319 (=> (not res!106392) (not e!141370))))

(assert (=> b!217319 (= res!106392 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217320 () Bool)

(assert (=> b!217320 (= e!141367 (and e!141366 mapRes!9678))))

(declare-fun condMapEmpty!9678 () Bool)

(declare-fun mapDefault!9678 () ValueCell!2495)

(assert (=> b!217320 (= condMapEmpty!9678 (= (arr!5013 (_values!4078 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2495)) mapDefault!9678)))))

(declare-fun b!217321 () Bool)

(assert (=> b!217321 (= e!141368 false)))

(declare-fun lt!111170 () Bool)

(declare-datatypes ((List!3176 0))(
  ( (Nil!3173) (Cons!3172 (h!3819 (_ BitVec 64)) (t!8122 List!3176)) )
))
(declare-fun arrayNoDuplicates!0 (array!10587 (_ BitVec 32) List!3176) Bool)

(assert (=> b!217321 (= lt!111170 (arrayNoDuplicates!0 (_keys!6143 thiss!1504) #b00000000000000000000000000000000 Nil!3173))))

(declare-fun b!217322 () Bool)

(declare-fun res!106388 () Bool)

(assert (=> b!217322 (=> (not res!106388) (not e!141368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217322 (= res!106388 (validMask!0 (mask!9851 thiss!1504)))))

(assert (= (and start!21670 res!106390) b!217319))

(assert (= (and b!217319 res!106392) b!217314))

(assert (= (and b!217314 res!106391) b!217313))

(assert (= (and b!217313 res!106393) b!217322))

(assert (= (and b!217322 res!106388) b!217312))

(assert (= (and b!217312 res!106387) b!217318))

(assert (= (and b!217318 res!106389) b!217321))

(assert (= (and b!217320 condMapEmpty!9678) mapIsEmpty!9678))

(assert (= (and b!217320 (not condMapEmpty!9678)) mapNonEmpty!9678))

(get-info :version)

(assert (= (and mapNonEmpty!9678 ((_ is ValueCellFull!2495) mapValue!9678)) b!217317))

(assert (= (and b!217320 ((_ is ValueCellFull!2495) mapDefault!9678)) b!217316))

(assert (= b!217315 b!217320))

(assert (= start!21670 b!217315))

(declare-fun m!243153 () Bool)

(assert (=> b!217314 m!243153))

(declare-fun m!243155 () Bool)

(assert (=> start!21670 m!243155))

(declare-fun m!243157 () Bool)

(assert (=> b!217322 m!243157))

(declare-fun m!243159 () Bool)

(assert (=> b!217313 m!243159))

(assert (=> b!217313 m!243159))

(declare-fun m!243161 () Bool)

(assert (=> b!217313 m!243161))

(declare-fun m!243163 () Bool)

(assert (=> b!217318 m!243163))

(declare-fun m!243165 () Bool)

(assert (=> b!217321 m!243165))

(declare-fun m!243167 () Bool)

(assert (=> mapNonEmpty!9678 m!243167))

(declare-fun m!243169 () Bool)

(assert (=> b!217315 m!243169))

(declare-fun m!243171 () Bool)

(assert (=> b!217315 m!243171))

(check-sat b_and!12679 (not b!217318) (not b!217321) (not b!217322) (not mapNonEmpty!9678) (not b_next!5815) (not start!21670) (not b!217315) (not b!217314) tp_is_empty!5677 (not b!217313))
(check-sat b_and!12679 (not b_next!5815))
