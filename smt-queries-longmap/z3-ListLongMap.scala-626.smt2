; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16106 () Bool)

(assert start!16106)

(declare-fun b!160159 () Bool)

(declare-fun b_free!3567 () Bool)

(declare-fun b_next!3567 () Bool)

(assert (=> b!160159 (= b_free!3567 (not b_next!3567))))

(declare-fun tp!13270 () Bool)

(declare-fun b_and!9981 () Bool)

(assert (=> b!160159 (= tp!13270 b_and!9981)))

(declare-fun b!160155 () Bool)

(declare-fun e!104751 () Bool)

(declare-fun tp_is_empty!3369 () Bool)

(assert (=> b!160155 (= e!104751 tp_is_empty!3369)))

(declare-fun b!160156 () Bool)

(declare-fun res!75786 () Bool)

(declare-fun e!104754 () Bool)

(assert (=> b!160156 (=> (not res!75786) (not e!104754))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160156 (= res!75786 (not (= key!828 (bvneg key!828))))))

(declare-fun res!75791 () Bool)

(assert (=> start!16106 (=> (not res!75791) (not e!104754))))

(declare-datatypes ((V!4139 0))(
  ( (V!4140 (val!1729 Int)) )
))
(declare-datatypes ((ValueCell!1341 0))(
  ( (ValueCellFull!1341 (v!3594 V!4139)) (EmptyCell!1341) )
))
(declare-datatypes ((array!5817 0))(
  ( (array!5818 (arr!2753 (Array (_ BitVec 32) (_ BitVec 64))) (size!3037 (_ BitVec 32))) )
))
(declare-datatypes ((array!5819 0))(
  ( (array!5820 (arr!2754 (Array (_ BitVec 32) ValueCell!1341)) (size!3038 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1590 0))(
  ( (LongMapFixedSize!1591 (defaultEntry!3237 Int) (mask!7801 (_ BitVec 32)) (extraKeys!2978 (_ BitVec 32)) (zeroValue!3080 V!4139) (minValue!3080 V!4139) (_size!844 (_ BitVec 32)) (_keys!5038 array!5817) (_values!3220 array!5819) (_vacant!844 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1590)

(declare-fun valid!738 (LongMapFixedSize!1590) Bool)

(assert (=> start!16106 (= res!75791 (valid!738 thiss!1248))))

(assert (=> start!16106 e!104754))

(declare-fun e!104753 () Bool)

(assert (=> start!16106 e!104753))

(assert (=> start!16106 true))

(declare-fun mapNonEmpty!5741 () Bool)

(declare-fun mapRes!5741 () Bool)

(declare-fun tp!13271 () Bool)

(assert (=> mapNonEmpty!5741 (= mapRes!5741 (and tp!13271 e!104751))))

(declare-fun mapKey!5741 () (_ BitVec 32))

(declare-fun mapValue!5741 () ValueCell!1341)

(declare-fun mapRest!5741 () (Array (_ BitVec 32) ValueCell!1341))

(assert (=> mapNonEmpty!5741 (= (arr!2754 (_values!3220 thiss!1248)) (store mapRest!5741 mapKey!5741 mapValue!5741))))

(declare-fun b!160157 () Bool)

(declare-fun e!104750 () Bool)

(assert (=> b!160157 (= e!104750 tp_is_empty!3369)))

(declare-fun b!160158 () Bool)

(declare-fun res!75787 () Bool)

(assert (=> b!160158 (=> (not res!75787) (not e!104754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160158 (= res!75787 (validMask!0 (mask!7801 thiss!1248)))))

(declare-fun e!104749 () Bool)

(declare-fun array_inv!1753 (array!5817) Bool)

(declare-fun array_inv!1754 (array!5819) Bool)

(assert (=> b!160159 (= e!104753 (and tp!13270 tp_is_empty!3369 (array_inv!1753 (_keys!5038 thiss!1248)) (array_inv!1754 (_values!3220 thiss!1248)) e!104749))))

(declare-fun b!160160 () Bool)

(declare-fun res!75788 () Bool)

(assert (=> b!160160 (=> (not res!75788) (not e!104754))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!325 0))(
  ( (MissingZero!325 (index!3468 (_ BitVec 32))) (Found!325 (index!3469 (_ BitVec 32))) (Intermediate!325 (undefined!1137 Bool) (index!3470 (_ BitVec 32)) (x!17677 (_ BitVec 32))) (Undefined!325) (MissingVacant!325 (index!3471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5817 (_ BitVec 32)) SeekEntryResult!325)

(assert (=> b!160160 (= res!75788 ((_ is Undefined!325) (seekEntryOrOpen!0 key!828 (_keys!5038 thiss!1248) (mask!7801 thiss!1248))))))

(declare-fun b!160161 () Bool)

(assert (=> b!160161 (= e!104754 false)))

(declare-fun lt!82063 () Bool)

(declare-datatypes ((List!1931 0))(
  ( (Nil!1928) (Cons!1927 (h!2540 (_ BitVec 64)) (t!6733 List!1931)) )
))
(declare-fun arrayNoDuplicates!0 (array!5817 (_ BitVec 32) List!1931) Bool)

(assert (=> b!160161 (= lt!82063 (arrayNoDuplicates!0 (_keys!5038 thiss!1248) #b00000000000000000000000000000000 Nil!1928))))

(declare-fun b!160162 () Bool)

(declare-fun res!75790 () Bool)

(assert (=> b!160162 (=> (not res!75790) (not e!104754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5817 (_ BitVec 32)) Bool)

(assert (=> b!160162 (= res!75790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5038 thiss!1248) (mask!7801 thiss!1248)))))

(declare-fun b!160163 () Bool)

(declare-fun res!75785 () Bool)

(assert (=> b!160163 (=> (not res!75785) (not e!104754))))

(assert (=> b!160163 (= res!75785 (and (= (size!3038 (_values!3220 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7801 thiss!1248))) (= (size!3037 (_keys!5038 thiss!1248)) (size!3038 (_values!3220 thiss!1248))) (bvsge (mask!7801 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2978 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2978 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5741 () Bool)

(assert (=> mapIsEmpty!5741 mapRes!5741))

(declare-fun b!160164 () Bool)

(declare-fun res!75789 () Bool)

(assert (=> b!160164 (=> (not res!75789) (not e!104754))))

(declare-datatypes ((tuple2!2908 0))(
  ( (tuple2!2909 (_1!1465 (_ BitVec 64)) (_2!1465 V!4139)) )
))
(declare-datatypes ((List!1932 0))(
  ( (Nil!1929) (Cons!1928 (h!2541 tuple2!2908) (t!6734 List!1932)) )
))
(declare-datatypes ((ListLongMap!1895 0))(
  ( (ListLongMap!1896 (toList!963 List!1932)) )
))
(declare-fun contains!999 (ListLongMap!1895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!627 (array!5817 array!5819 (_ BitVec 32) (_ BitVec 32) V!4139 V!4139 (_ BitVec 32) Int) ListLongMap!1895)

(assert (=> b!160164 (= res!75789 (contains!999 (getCurrentListMap!627 (_keys!5038 thiss!1248) (_values!3220 thiss!1248) (mask!7801 thiss!1248) (extraKeys!2978 thiss!1248) (zeroValue!3080 thiss!1248) (minValue!3080 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3237 thiss!1248)) key!828))))

(declare-fun b!160165 () Bool)

(assert (=> b!160165 (= e!104749 (and e!104750 mapRes!5741))))

(declare-fun condMapEmpty!5741 () Bool)

(declare-fun mapDefault!5741 () ValueCell!1341)

(assert (=> b!160165 (= condMapEmpty!5741 (= (arr!2754 (_values!3220 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1341)) mapDefault!5741)))))

(assert (= (and start!16106 res!75791) b!160156))

(assert (= (and b!160156 res!75786) b!160160))

(assert (= (and b!160160 res!75788) b!160164))

(assert (= (and b!160164 res!75789) b!160158))

(assert (= (and b!160158 res!75787) b!160163))

(assert (= (and b!160163 res!75785) b!160162))

(assert (= (and b!160162 res!75790) b!160161))

(assert (= (and b!160165 condMapEmpty!5741) mapIsEmpty!5741))

(assert (= (and b!160165 (not condMapEmpty!5741)) mapNonEmpty!5741))

(assert (= (and mapNonEmpty!5741 ((_ is ValueCellFull!1341) mapValue!5741)) b!160155))

(assert (= (and b!160165 ((_ is ValueCellFull!1341) mapDefault!5741)) b!160157))

(assert (= b!160159 b!160165))

(assert (= start!16106 b!160159))

(declare-fun m!192137 () Bool)

(assert (=> mapNonEmpty!5741 m!192137))

(declare-fun m!192139 () Bool)

(assert (=> b!160164 m!192139))

(assert (=> b!160164 m!192139))

(declare-fun m!192141 () Bool)

(assert (=> b!160164 m!192141))

(declare-fun m!192143 () Bool)

(assert (=> b!160162 m!192143))

(declare-fun m!192145 () Bool)

(assert (=> b!160159 m!192145))

(declare-fun m!192147 () Bool)

(assert (=> b!160159 m!192147))

(declare-fun m!192149 () Bool)

(assert (=> b!160161 m!192149))

(declare-fun m!192151 () Bool)

(assert (=> start!16106 m!192151))

(declare-fun m!192153 () Bool)

(assert (=> b!160158 m!192153))

(declare-fun m!192155 () Bool)

(assert (=> b!160160 m!192155))

(check-sat (not b!160158) tp_is_empty!3369 (not b!160160) (not b_next!3567) (not mapNonEmpty!5741) (not b!160162) (not b!160161) b_and!9981 (not b!160159) (not b!160164) (not start!16106))
(check-sat b_and!9981 (not b_next!3567))
