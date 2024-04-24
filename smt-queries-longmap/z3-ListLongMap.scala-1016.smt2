; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21700 () Bool)

(assert start!21700)

(declare-fun b!218010 () Bool)

(declare-fun b_free!5845 () Bool)

(declare-fun b_next!5845 () Bool)

(assert (=> b!218010 (= b_free!5845 (not b_next!5845))))

(declare-fun tp!20669 () Bool)

(declare-fun b_and!12749 () Bool)

(assert (=> b!218010 (= tp!20669 b_and!12749)))

(declare-fun b!218001 () Bool)

(declare-fun e!141808 () Bool)

(declare-fun tp_is_empty!5707 () Bool)

(assert (=> b!218001 (= e!141808 tp_is_empty!5707)))

(declare-fun b!218002 () Bool)

(declare-fun res!106824 () Bool)

(declare-fun e!141806 () Bool)

(assert (=> b!218002 (=> (not res!106824) (not e!141806))))

(declare-datatypes ((V!7257 0))(
  ( (V!7258 (val!2898 Int)) )
))
(declare-datatypes ((ValueCell!2510 0))(
  ( (ValueCellFull!2510 (v!4917 V!7257)) (EmptyCell!2510) )
))
(declare-datatypes ((array!10651 0))(
  ( (array!10652 (arr!5047 (Array (_ BitVec 32) ValueCell!2510)) (size!5379 (_ BitVec 32))) )
))
(declare-datatypes ((array!10653 0))(
  ( (array!10654 (arr!5048 (Array (_ BitVec 32) (_ BitVec 64))) (size!5380 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2920 0))(
  ( (LongMapFixedSize!2921 (defaultEntry!4110 Int) (mask!9877 (_ BitVec 32)) (extraKeys!3847 (_ BitVec 32)) (zeroValue!3951 V!7257) (minValue!3951 V!7257) (_size!1509 (_ BitVec 32)) (_keys!6159 array!10653) (_values!4093 array!10651) (_vacant!1509 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2920)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218002 (= res!106824 (validMask!0 (mask!9877 thiss!1504)))))

(declare-fun b!218003 () Bool)

(declare-fun res!106820 () Bool)

(assert (=> b!218003 (=> (not res!106820) (not e!141806))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4228 0))(
  ( (tuple2!4229 (_1!2125 (_ BitVec 64)) (_2!2125 V!7257)) )
))
(declare-datatypes ((List!3130 0))(
  ( (Nil!3127) (Cons!3126 (h!3773 tuple2!4228) (t!8077 List!3130)) )
))
(declare-datatypes ((ListLongMap!3143 0))(
  ( (ListLongMap!3144 (toList!1587 List!3130)) )
))
(declare-fun contains!1442 (ListLongMap!3143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1119 (array!10653 array!10651 (_ BitVec 32) (_ BitVec 32) V!7257 V!7257 (_ BitVec 32) Int) ListLongMap!3143)

(assert (=> b!218003 (= res!106820 (not (contains!1442 (getCurrentListMap!1119 (_keys!6159 thiss!1504) (_values!4093 thiss!1504) (mask!9877 thiss!1504) (extraKeys!3847 thiss!1504) (zeroValue!3951 thiss!1504) (minValue!3951 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4110 thiss!1504)) key!932)))))

(declare-fun res!106819 () Bool)

(declare-fun e!141809 () Bool)

(assert (=> start!21700 (=> (not res!106819) (not e!141809))))

(declare-fun valid!1199 (LongMapFixedSize!2920) Bool)

(assert (=> start!21700 (= res!106819 (valid!1199 thiss!1504))))

(assert (=> start!21700 e!141809))

(declare-fun e!141811 () Bool)

(assert (=> start!21700 e!141811))

(assert (=> start!21700 true))

(declare-fun mapNonEmpty!9723 () Bool)

(declare-fun mapRes!9723 () Bool)

(declare-fun tp!20670 () Bool)

(declare-fun e!141805 () Bool)

(assert (=> mapNonEmpty!9723 (= mapRes!9723 (and tp!20670 e!141805))))

(declare-fun mapValue!9723 () ValueCell!2510)

(declare-fun mapRest!9723 () (Array (_ BitVec 32) ValueCell!2510))

(declare-fun mapKey!9723 () (_ BitVec 32))

(assert (=> mapNonEmpty!9723 (= (arr!5047 (_values!4093 thiss!1504)) (store mapRest!9723 mapKey!9723 mapValue!9723))))

(declare-fun b!218004 () Bool)

(declare-fun res!106823 () Bool)

(assert (=> b!218004 (=> (not res!106823) (not e!141806))))

(assert (=> b!218004 (= res!106823 (and (= (size!5379 (_values!4093 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9877 thiss!1504))) (= (size!5380 (_keys!6159 thiss!1504)) (size!5379 (_values!4093 thiss!1504))) (bvsge (mask!9877 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3847 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3847 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9723 () Bool)

(assert (=> mapIsEmpty!9723 mapRes!9723))

(declare-fun b!218005 () Bool)

(declare-fun res!106821 () Bool)

(assert (=> b!218005 (=> (not res!106821) (not e!141809))))

(assert (=> b!218005 (= res!106821 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218006 () Bool)

(assert (=> b!218006 (= e!141806 false)))

(declare-fun lt!111499 () Bool)

(declare-datatypes ((List!3131 0))(
  ( (Nil!3128) (Cons!3127 (h!3774 (_ BitVec 64)) (t!8078 List!3131)) )
))
(declare-fun arrayNoDuplicates!0 (array!10653 (_ BitVec 32) List!3131) Bool)

(assert (=> b!218006 (= lt!111499 (arrayNoDuplicates!0 (_keys!6159 thiss!1504) #b00000000000000000000000000000000 Nil!3128))))

(declare-fun b!218007 () Bool)

(declare-fun e!141810 () Bool)

(assert (=> b!218007 (= e!141810 (and e!141808 mapRes!9723))))

(declare-fun condMapEmpty!9723 () Bool)

(declare-fun mapDefault!9723 () ValueCell!2510)

(assert (=> b!218007 (= condMapEmpty!9723 (= (arr!5047 (_values!4093 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2510)) mapDefault!9723)))))

(declare-fun b!218008 () Bool)

(assert (=> b!218008 (= e!141809 e!141806)))

(declare-fun res!106822 () Bool)

(assert (=> b!218008 (=> (not res!106822) (not e!141806))))

(declare-datatypes ((SeekEntryResult!758 0))(
  ( (MissingZero!758 (index!5202 (_ BitVec 32))) (Found!758 (index!5203 (_ BitVec 32))) (Intermediate!758 (undefined!1570 Bool) (index!5204 (_ BitVec 32)) (x!22774 (_ BitVec 32))) (Undefined!758) (MissingVacant!758 (index!5205 (_ BitVec 32))) )
))
(declare-fun lt!111500 () SeekEntryResult!758)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218008 (= res!106822 (or (= lt!111500 (MissingZero!758 index!297)) (= lt!111500 (MissingVacant!758 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10653 (_ BitVec 32)) SeekEntryResult!758)

(assert (=> b!218008 (= lt!111500 (seekEntryOrOpen!0 key!932 (_keys!6159 thiss!1504) (mask!9877 thiss!1504)))))

(declare-fun b!218009 () Bool)

(assert (=> b!218009 (= e!141805 tp_is_empty!5707)))

(declare-fun array_inv!3319 (array!10653) Bool)

(declare-fun array_inv!3320 (array!10651) Bool)

(assert (=> b!218010 (= e!141811 (and tp!20669 tp_is_empty!5707 (array_inv!3319 (_keys!6159 thiss!1504)) (array_inv!3320 (_values!4093 thiss!1504)) e!141810))))

(declare-fun b!218011 () Bool)

(declare-fun res!106818 () Bool)

(assert (=> b!218011 (=> (not res!106818) (not e!141806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10653 (_ BitVec 32)) Bool)

(assert (=> b!218011 (= res!106818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6159 thiss!1504) (mask!9877 thiss!1504)))))

(assert (= (and start!21700 res!106819) b!218005))

(assert (= (and b!218005 res!106821) b!218008))

(assert (= (and b!218008 res!106822) b!218003))

(assert (= (and b!218003 res!106820) b!218002))

(assert (= (and b!218002 res!106824) b!218004))

(assert (= (and b!218004 res!106823) b!218011))

(assert (= (and b!218011 res!106818) b!218006))

(assert (= (and b!218007 condMapEmpty!9723) mapIsEmpty!9723))

(assert (= (and b!218007 (not condMapEmpty!9723)) mapNonEmpty!9723))

(get-info :version)

(assert (= (and mapNonEmpty!9723 ((_ is ValueCellFull!2510) mapValue!9723)) b!218009))

(assert (= (and b!218007 ((_ is ValueCellFull!2510) mapDefault!9723)) b!218001))

(assert (= b!218010 b!218007))

(assert (= start!21700 b!218010))

(declare-fun m!244251 () Bool)

(assert (=> b!218006 m!244251))

(declare-fun m!244253 () Bool)

(assert (=> b!218003 m!244253))

(assert (=> b!218003 m!244253))

(declare-fun m!244255 () Bool)

(assert (=> b!218003 m!244255))

(declare-fun m!244257 () Bool)

(assert (=> b!218002 m!244257))

(declare-fun m!244259 () Bool)

(assert (=> start!21700 m!244259))

(declare-fun m!244261 () Bool)

(assert (=> b!218011 m!244261))

(declare-fun m!244263 () Bool)

(assert (=> b!218008 m!244263))

(declare-fun m!244265 () Bool)

(assert (=> mapNonEmpty!9723 m!244265))

(declare-fun m!244267 () Bool)

(assert (=> b!218010 m!244267))

(declare-fun m!244269 () Bool)

(assert (=> b!218010 m!244269))

(check-sat (not mapNonEmpty!9723) (not b_next!5845) tp_is_empty!5707 (not start!21700) (not b!218010) (not b!218003) (not b!218008) b_and!12749 (not b!218011) (not b!218002) (not b!218006))
(check-sat b_and!12749 (not b_next!5845))
