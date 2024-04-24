; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21652 () Bool)

(assert start!21652)

(declare-fun b!217211 () Bool)

(declare-fun b_free!5797 () Bool)

(declare-fun b_next!5797 () Bool)

(assert (=> b!217211 (= b_free!5797 (not b_next!5797))))

(declare-fun tp!20525 () Bool)

(declare-fun b_and!12701 () Bool)

(assert (=> b!217211 (= tp!20525 b_and!12701)))

(declare-fun mapNonEmpty!9651 () Bool)

(declare-fun mapRes!9651 () Bool)

(declare-fun tp!20526 () Bool)

(declare-fun e!141301 () Bool)

(assert (=> mapNonEmpty!9651 (= mapRes!9651 (and tp!20526 e!141301))))

(declare-datatypes ((V!7193 0))(
  ( (V!7194 (val!2874 Int)) )
))
(declare-datatypes ((ValueCell!2486 0))(
  ( (ValueCellFull!2486 (v!4893 V!7193)) (EmptyCell!2486) )
))
(declare-fun mapRest!9651 () (Array (_ BitVec 32) ValueCell!2486))

(declare-datatypes ((array!10555 0))(
  ( (array!10556 (arr!4999 (Array (_ BitVec 32) ValueCell!2486)) (size!5331 (_ BitVec 32))) )
))
(declare-datatypes ((array!10557 0))(
  ( (array!10558 (arr!5000 (Array (_ BitVec 32) (_ BitVec 64))) (size!5332 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2872 0))(
  ( (LongMapFixedSize!2873 (defaultEntry!4086 Int) (mask!9837 (_ BitVec 32)) (extraKeys!3823 (_ BitVec 32)) (zeroValue!3927 V!7193) (minValue!3927 V!7193) (_size!1485 (_ BitVec 32)) (_keys!6135 array!10557) (_values!4069 array!10555) (_vacant!1485 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2872)

(declare-fun mapValue!9651 () ValueCell!2486)

(declare-fun mapKey!9651 () (_ BitVec 32))

(assert (=> mapNonEmpty!9651 (= (arr!4999 (_values!4069 thiss!1504)) (store mapRest!9651 mapKey!9651 mapValue!9651))))

(declare-fun b!217209 () Bool)

(declare-fun e!141303 () Bool)

(declare-fun tp_is_empty!5659 () Bool)

(assert (=> b!217209 (= e!141303 tp_is_empty!5659)))

(declare-fun e!141307 () Bool)

(declare-fun e!141306 () Bool)

(declare-fun array_inv!3283 (array!10557) Bool)

(declare-fun array_inv!3284 (array!10555) Bool)

(assert (=> b!217211 (= e!141307 (and tp!20525 tp_is_empty!5659 (array_inv!3283 (_keys!6135 thiss!1504)) (array_inv!3284 (_values!4069 thiss!1504)) e!141306))))

(declare-fun b!217212 () Bool)

(declare-fun e!141304 () Bool)

(assert (=> b!217212 (= e!141304 false)))

(declare-fun lt!111355 () Bool)

(declare-datatypes ((List!3098 0))(
  ( (Nil!3095) (Cons!3094 (h!3741 (_ BitVec 64)) (t!8045 List!3098)) )
))
(declare-fun arrayNoDuplicates!0 (array!10557 (_ BitVec 32) List!3098) Bool)

(assert (=> b!217212 (= lt!111355 (arrayNoDuplicates!0 (_keys!6135 thiss!1504) #b00000000000000000000000000000000 Nil!3095))))

(declare-fun b!217213 () Bool)

(declare-fun res!106316 () Bool)

(declare-fun e!141305 () Bool)

(assert (=> b!217213 (=> (not res!106316) (not e!141305))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217213 (= res!106316 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217214 () Bool)

(assert (=> b!217214 (= e!141306 (and e!141303 mapRes!9651))))

(declare-fun condMapEmpty!9651 () Bool)

(declare-fun mapDefault!9651 () ValueCell!2486)

(assert (=> b!217214 (= condMapEmpty!9651 (= (arr!4999 (_values!4069 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2486)) mapDefault!9651)))))

(declare-fun mapIsEmpty!9651 () Bool)

(assert (=> mapIsEmpty!9651 mapRes!9651))

(declare-fun b!217215 () Bool)

(declare-fun res!106319 () Bool)

(assert (=> b!217215 (=> (not res!106319) (not e!141304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10557 (_ BitVec 32)) Bool)

(assert (=> b!217215 (= res!106319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6135 thiss!1504) (mask!9837 thiss!1504)))))

(declare-fun b!217216 () Bool)

(declare-fun res!106315 () Bool)

(assert (=> b!217216 (=> (not res!106315) (not e!141304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217216 (= res!106315 (validMask!0 (mask!9837 thiss!1504)))))

(declare-fun b!217217 () Bool)

(declare-fun res!106318 () Bool)

(assert (=> b!217217 (=> (not res!106318) (not e!141304))))

(assert (=> b!217217 (= res!106318 (and (= (size!5331 (_values!4069 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9837 thiss!1504))) (= (size!5332 (_keys!6135 thiss!1504)) (size!5331 (_values!4069 thiss!1504))) (bvsge (mask!9837 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3823 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3823 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217218 () Bool)

(assert (=> b!217218 (= e!141305 e!141304)))

(declare-fun res!106317 () Bool)

(assert (=> b!217218 (=> (not res!106317) (not e!141304))))

(declare-datatypes ((SeekEntryResult!743 0))(
  ( (MissingZero!743 (index!5142 (_ BitVec 32))) (Found!743 (index!5143 (_ BitVec 32))) (Intermediate!743 (undefined!1555 Bool) (index!5144 (_ BitVec 32)) (x!22695 (_ BitVec 32))) (Undefined!743) (MissingVacant!743 (index!5145 (_ BitVec 32))) )
))
(declare-fun lt!111356 () SeekEntryResult!743)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217218 (= res!106317 (or (= lt!111356 (MissingZero!743 index!297)) (= lt!111356 (MissingVacant!743 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10557 (_ BitVec 32)) SeekEntryResult!743)

(assert (=> b!217218 (= lt!111356 (seekEntryOrOpen!0 key!932 (_keys!6135 thiss!1504) (mask!9837 thiss!1504)))))

(declare-fun b!217219 () Bool)

(assert (=> b!217219 (= e!141301 tp_is_empty!5659)))

(declare-fun res!106314 () Bool)

(assert (=> start!21652 (=> (not res!106314) (not e!141305))))

(declare-fun valid!1183 (LongMapFixedSize!2872) Bool)

(assert (=> start!21652 (= res!106314 (valid!1183 thiss!1504))))

(assert (=> start!21652 e!141305))

(assert (=> start!21652 e!141307))

(assert (=> start!21652 true))

(declare-fun b!217210 () Bool)

(declare-fun res!106320 () Bool)

(assert (=> b!217210 (=> (not res!106320) (not e!141304))))

(declare-datatypes ((tuple2!4196 0))(
  ( (tuple2!4197 (_1!2109 (_ BitVec 64)) (_2!2109 V!7193)) )
))
(declare-datatypes ((List!3099 0))(
  ( (Nil!3096) (Cons!3095 (h!3742 tuple2!4196) (t!8046 List!3099)) )
))
(declare-datatypes ((ListLongMap!3111 0))(
  ( (ListLongMap!3112 (toList!1571 List!3099)) )
))
(declare-fun contains!1426 (ListLongMap!3111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1103 (array!10557 array!10555 (_ BitVec 32) (_ BitVec 32) V!7193 V!7193 (_ BitVec 32) Int) ListLongMap!3111)

(assert (=> b!217210 (= res!106320 (contains!1426 (getCurrentListMap!1103 (_keys!6135 thiss!1504) (_values!4069 thiss!1504) (mask!9837 thiss!1504) (extraKeys!3823 thiss!1504) (zeroValue!3927 thiss!1504) (minValue!3927 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4086 thiss!1504)) key!932))))

(assert (= (and start!21652 res!106314) b!217213))

(assert (= (and b!217213 res!106316) b!217218))

(assert (= (and b!217218 res!106317) b!217210))

(assert (= (and b!217210 res!106320) b!217216))

(assert (= (and b!217216 res!106315) b!217217))

(assert (= (and b!217217 res!106318) b!217215))

(assert (= (and b!217215 res!106319) b!217212))

(assert (= (and b!217214 condMapEmpty!9651) mapIsEmpty!9651))

(assert (= (and b!217214 (not condMapEmpty!9651)) mapNonEmpty!9651))

(get-info :version)

(assert (= (and mapNonEmpty!9651 ((_ is ValueCellFull!2486) mapValue!9651)) b!217219))

(assert (= (and b!217214 ((_ is ValueCellFull!2486) mapDefault!9651)) b!217209))

(assert (= b!217211 b!217214))

(assert (= start!21652 b!217211))

(declare-fun m!243771 () Bool)

(assert (=> b!217215 m!243771))

(declare-fun m!243773 () Bool)

(assert (=> b!217218 m!243773))

(declare-fun m!243775 () Bool)

(assert (=> b!217211 m!243775))

(declare-fun m!243777 () Bool)

(assert (=> b!217211 m!243777))

(declare-fun m!243779 () Bool)

(assert (=> mapNonEmpty!9651 m!243779))

(declare-fun m!243781 () Bool)

(assert (=> b!217212 m!243781))

(declare-fun m!243783 () Bool)

(assert (=> start!21652 m!243783))

(declare-fun m!243785 () Bool)

(assert (=> b!217210 m!243785))

(assert (=> b!217210 m!243785))

(declare-fun m!243787 () Bool)

(assert (=> b!217210 m!243787))

(declare-fun m!243789 () Bool)

(assert (=> b!217216 m!243789))

(check-sat (not b!217216) tp_is_empty!5659 (not b!217218) (not b!217210) (not b!217215) b_and!12701 (not b_next!5797) (not mapNonEmpty!9651) (not b!217211) (not b!217212) (not start!21652))
(check-sat b_and!12701 (not b_next!5797))
