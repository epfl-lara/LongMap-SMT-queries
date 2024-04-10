; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21650 () Bool)

(assert start!21650)

(declare-fun b!217195 () Bool)

(declare-fun b_free!5799 () Bool)

(declare-fun b_next!5799 () Bool)

(assert (=> b!217195 (= b_free!5799 (not b_next!5799))))

(declare-fun tp!20532 () Bool)

(declare-fun b_and!12689 () Bool)

(assert (=> b!217195 (= tp!20532 b_and!12689)))

(declare-fun tp_is_empty!5661 () Bool)

(declare-datatypes ((V!7195 0))(
  ( (V!7196 (val!2875 Int)) )
))
(declare-datatypes ((ValueCell!2487 0))(
  ( (ValueCellFull!2487 (v!4893 V!7195)) (EmptyCell!2487) )
))
(declare-datatypes ((array!10561 0))(
  ( (array!10562 (arr!5002 (Array (_ BitVec 32) ValueCell!2487)) (size!5334 (_ BitVec 32))) )
))
(declare-datatypes ((array!10563 0))(
  ( (array!10564 (arr!5003 (Array (_ BitVec 32) (_ BitVec 64))) (size!5335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2874 0))(
  ( (LongMapFixedSize!2875 (defaultEntry!4087 Int) (mask!9838 (_ BitVec 32)) (extraKeys!3824 (_ BitVec 32)) (zeroValue!3928 V!7195) (minValue!3928 V!7195) (_size!1486 (_ BitVec 32)) (_keys!6136 array!10563) (_values!4070 array!10561) (_vacant!1486 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2874)

(declare-fun e!141303 () Bool)

(declare-fun e!141298 () Bool)

(declare-fun array_inv!3313 (array!10563) Bool)

(declare-fun array_inv!3314 (array!10561) Bool)

(assert (=> b!217195 (= e!141303 (and tp!20532 tp_is_empty!5661 (array_inv!3313 (_keys!6136 thiss!1504)) (array_inv!3314 (_values!4070 thiss!1504)) e!141298))))

(declare-fun b!217196 () Bool)

(declare-fun res!106316 () Bool)

(declare-fun e!141304 () Bool)

(assert (=> b!217196 (=> (not res!106316) (not e!141304))))

(assert (=> b!217196 (= res!106316 (and (= (size!5334 (_values!4070 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9838 thiss!1504))) (= (size!5335 (_keys!6136 thiss!1504)) (size!5334 (_values!4070 thiss!1504))) (bvsge (mask!9838 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3824 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3824 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217197 () Bool)

(declare-fun res!106319 () Bool)

(assert (=> b!217197 (=> (not res!106319) (not e!141304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217197 (= res!106319 (validMask!0 (mask!9838 thiss!1504)))))

(declare-fun mapIsEmpty!9654 () Bool)

(declare-fun mapRes!9654 () Bool)

(assert (=> mapIsEmpty!9654 mapRes!9654))

(declare-fun b!217198 () Bool)

(declare-fun e!141299 () Bool)

(assert (=> b!217198 (= e!141299 tp_is_empty!5661)))

(declare-fun b!217199 () Bool)

(declare-fun res!106318 () Bool)

(assert (=> b!217199 (=> (not res!106318) (not e!141304))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4278 0))(
  ( (tuple2!4279 (_1!2150 (_ BitVec 64)) (_2!2150 V!7195)) )
))
(declare-datatypes ((List!3181 0))(
  ( (Nil!3178) (Cons!3177 (h!3824 tuple2!4278) (t!8136 List!3181)) )
))
(declare-datatypes ((ListLongMap!3191 0))(
  ( (ListLongMap!3192 (toList!1611 List!3181)) )
))
(declare-fun contains!1452 (ListLongMap!3191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1139 (array!10563 array!10561 (_ BitVec 32) (_ BitVec 32) V!7195 V!7195 (_ BitVec 32) Int) ListLongMap!3191)

(assert (=> b!217199 (= res!106318 (contains!1452 (getCurrentListMap!1139 (_keys!6136 thiss!1504) (_values!4070 thiss!1504) (mask!9838 thiss!1504) (extraKeys!3824 thiss!1504) (zeroValue!3928 thiss!1504) (minValue!3928 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4087 thiss!1504)) key!932))))

(declare-fun b!217200 () Bool)

(assert (=> b!217200 (= e!141298 (and e!141299 mapRes!9654))))

(declare-fun condMapEmpty!9654 () Bool)

(declare-fun mapDefault!9654 () ValueCell!2487)

(assert (=> b!217200 (= condMapEmpty!9654 (= (arr!5002 (_values!4070 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2487)) mapDefault!9654)))))

(declare-fun b!217201 () Bool)

(declare-fun e!141301 () Bool)

(assert (=> b!217201 (= e!141301 e!141304)))

(declare-fun res!106315 () Bool)

(assert (=> b!217201 (=> (not res!106315) (not e!141304))))

(declare-datatypes ((SeekEntryResult!763 0))(
  ( (MissingZero!763 (index!5222 (_ BitVec 32))) (Found!763 (index!5223 (_ BitVec 32))) (Intermediate!763 (undefined!1575 Bool) (index!5224 (_ BitVec 32)) (x!22715 (_ BitVec 32))) (Undefined!763) (MissingVacant!763 (index!5225 (_ BitVec 32))) )
))
(declare-fun lt!111303 () SeekEntryResult!763)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217201 (= res!106315 (or (= lt!111303 (MissingZero!763 index!297)) (= lt!111303 (MissingVacant!763 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10563 (_ BitVec 32)) SeekEntryResult!763)

(assert (=> b!217201 (= lt!111303 (seekEntryOrOpen!0 key!932 (_keys!6136 thiss!1504) (mask!9838 thiss!1504)))))

(declare-fun b!217202 () Bool)

(declare-fun res!106314 () Bool)

(assert (=> b!217202 (=> (not res!106314) (not e!141301))))

(assert (=> b!217202 (= res!106314 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217203 () Bool)

(declare-fun e!141300 () Bool)

(assert (=> b!217203 (= e!141300 tp_is_empty!5661)))

(declare-fun res!106320 () Bool)

(assert (=> start!21650 (=> (not res!106320) (not e!141301))))

(declare-fun valid!1168 (LongMapFixedSize!2874) Bool)

(assert (=> start!21650 (= res!106320 (valid!1168 thiss!1504))))

(assert (=> start!21650 e!141301))

(assert (=> start!21650 e!141303))

(assert (=> start!21650 true))

(declare-fun b!217204 () Bool)

(declare-fun res!106317 () Bool)

(assert (=> b!217204 (=> (not res!106317) (not e!141304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10563 (_ BitVec 32)) Bool)

(assert (=> b!217204 (= res!106317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6136 thiss!1504) (mask!9838 thiss!1504)))))

(declare-fun b!217205 () Bool)

(assert (=> b!217205 (= e!141304 false)))

(declare-fun lt!111302 () Bool)

(declare-datatypes ((List!3182 0))(
  ( (Nil!3179) (Cons!3178 (h!3825 (_ BitVec 64)) (t!8137 List!3182)) )
))
(declare-fun arrayNoDuplicates!0 (array!10563 (_ BitVec 32) List!3182) Bool)

(assert (=> b!217205 (= lt!111302 (arrayNoDuplicates!0 (_keys!6136 thiss!1504) #b00000000000000000000000000000000 Nil!3179))))

(declare-fun mapNonEmpty!9654 () Bool)

(declare-fun tp!20531 () Bool)

(assert (=> mapNonEmpty!9654 (= mapRes!9654 (and tp!20531 e!141300))))

(declare-fun mapKey!9654 () (_ BitVec 32))

(declare-fun mapRest!9654 () (Array (_ BitVec 32) ValueCell!2487))

(declare-fun mapValue!9654 () ValueCell!2487)

(assert (=> mapNonEmpty!9654 (= (arr!5002 (_values!4070 thiss!1504)) (store mapRest!9654 mapKey!9654 mapValue!9654))))

(assert (= (and start!21650 res!106320) b!217202))

(assert (= (and b!217202 res!106314) b!217201))

(assert (= (and b!217201 res!106315) b!217199))

(assert (= (and b!217199 res!106318) b!217197))

(assert (= (and b!217197 res!106319) b!217196))

(assert (= (and b!217196 res!106316) b!217204))

(assert (= (and b!217204 res!106317) b!217205))

(assert (= (and b!217200 condMapEmpty!9654) mapIsEmpty!9654))

(assert (= (and b!217200 (not condMapEmpty!9654)) mapNonEmpty!9654))

(get-info :version)

(assert (= (and mapNonEmpty!9654 ((_ is ValueCellFull!2487) mapValue!9654)) b!217203))

(assert (= (and b!217200 ((_ is ValueCellFull!2487) mapDefault!9654)) b!217198))

(assert (= b!217195 b!217200))

(assert (= start!21650 b!217195))

(declare-fun m!243609 () Bool)

(assert (=> b!217201 m!243609))

(declare-fun m!243611 () Bool)

(assert (=> b!217205 m!243611))

(declare-fun m!243613 () Bool)

(assert (=> b!217197 m!243613))

(declare-fun m!243615 () Bool)

(assert (=> b!217204 m!243615))

(declare-fun m!243617 () Bool)

(assert (=> mapNonEmpty!9654 m!243617))

(declare-fun m!243619 () Bool)

(assert (=> start!21650 m!243619))

(declare-fun m!243621 () Bool)

(assert (=> b!217199 m!243621))

(assert (=> b!217199 m!243621))

(declare-fun m!243623 () Bool)

(assert (=> b!217199 m!243623))

(declare-fun m!243625 () Bool)

(assert (=> b!217195 m!243625))

(declare-fun m!243627 () Bool)

(assert (=> b!217195 m!243627))

(check-sat tp_is_empty!5661 (not start!21650) (not b!217205) b_and!12689 (not b!217201) (not mapNonEmpty!9654) (not b!217204) (not b_next!5799) (not b!217197) (not b!217199) (not b!217195))
(check-sat b_and!12689 (not b_next!5799))
