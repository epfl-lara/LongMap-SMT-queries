; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18800 () Bool)

(assert start!18800)

(declare-fun b!185777 () Bool)

(declare-fun b_free!4575 () Bool)

(declare-fun b_next!4575 () Bool)

(assert (=> b!185777 (= b_free!4575 (not b_next!4575))))

(declare-fun tp!16524 () Bool)

(declare-fun b_and!11177 () Bool)

(assert (=> b!185777 (= tp!16524 b_and!11177)))

(declare-fun b!185771 () Bool)

(declare-fun res!87889 () Bool)

(declare-fun e!122232 () Bool)

(assert (=> b!185771 (=> (not res!87889) (not e!122232))))

(declare-datatypes ((V!5443 0))(
  ( (V!5444 (val!2218 Int)) )
))
(declare-datatypes ((ValueCell!1830 0))(
  ( (ValueCellFull!1830 (v!4129 V!5443)) (EmptyCell!1830) )
))
(declare-datatypes ((array!7903 0))(
  ( (array!7904 (arr!3731 (Array (_ BitVec 32) (_ BitVec 64))) (size!4047 (_ BitVec 32))) )
))
(declare-datatypes ((array!7905 0))(
  ( (array!7906 (arr!3732 (Array (_ BitVec 32) ValueCell!1830)) (size!4048 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2568 0))(
  ( (LongMapFixedSize!2569 (defaultEntry!3786 Int) (mask!8899 (_ BitVec 32)) (extraKeys!3523 (_ BitVec 32)) (zeroValue!3627 V!5443) (minValue!3627 V!5443) (_size!1333 (_ BitVec 32)) (_keys!5727 array!7903) (_values!3769 array!7905) (_vacant!1333 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2568)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7903 (_ BitVec 32)) Bool)

(assert (=> b!185771 (= res!87889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5727 thiss!1248) (mask!8899 thiss!1248)))))

(declare-fun b!185772 () Bool)

(declare-fun res!87888 () Bool)

(assert (=> b!185772 (=> (not res!87888) (not e!122232))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3454 0))(
  ( (tuple2!3455 (_1!1738 (_ BitVec 64)) (_2!1738 V!5443)) )
))
(declare-datatypes ((List!2365 0))(
  ( (Nil!2362) (Cons!2361 (h!2994 tuple2!3454) (t!7249 List!2365)) )
))
(declare-datatypes ((ListLongMap!2371 0))(
  ( (ListLongMap!2372 (toList!1201 List!2365)) )
))
(declare-fun contains!1297 (ListLongMap!2371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!849 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5443 V!5443 (_ BitVec 32) Int) ListLongMap!2371)

(assert (=> b!185772 (= res!87888 (not (contains!1297 (getCurrentListMap!849 (_keys!5727 thiss!1248) (_values!3769 thiss!1248) (mask!8899 thiss!1248) (extraKeys!3523 thiss!1248) (zeroValue!3627 thiss!1248) (minValue!3627 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3786 thiss!1248)) key!828)))))

(declare-fun b!185773 () Bool)

(declare-fun res!87891 () Bool)

(assert (=> b!185773 (=> (not res!87891) (not e!122232))))

(assert (=> b!185773 (= res!87891 (and (= (size!4048 (_values!3769 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8899 thiss!1248))) (= (size!4047 (_keys!5727 thiss!1248)) (size!4048 (_values!3769 thiss!1248))) (bvsge (mask!8899 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3523 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3523 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185774 () Bool)

(declare-fun res!87892 () Bool)

(declare-fun e!122234 () Bool)

(assert (=> b!185774 (=> (not res!87892) (not e!122234))))

(assert (=> b!185774 (= res!87892 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7482 () Bool)

(declare-fun mapRes!7482 () Bool)

(assert (=> mapIsEmpty!7482 mapRes!7482))

(declare-fun b!185775 () Bool)

(assert (=> b!185775 (= e!122232 false)))

(declare-fun lt!91863 () Bool)

(declare-datatypes ((List!2366 0))(
  ( (Nil!2363) (Cons!2362 (h!2995 (_ BitVec 64)) (t!7250 List!2366)) )
))
(declare-fun arrayNoDuplicates!0 (array!7903 (_ BitVec 32) List!2366) Bool)

(assert (=> b!185775 (= lt!91863 (arrayNoDuplicates!0 (_keys!5727 thiss!1248) #b00000000000000000000000000000000 Nil!2363))))

(declare-fun res!87893 () Bool)

(assert (=> start!18800 (=> (not res!87893) (not e!122234))))

(declare-fun valid!1060 (LongMapFixedSize!2568) Bool)

(assert (=> start!18800 (= res!87893 (valid!1060 thiss!1248))))

(assert (=> start!18800 e!122234))

(declare-fun e!122231 () Bool)

(assert (=> start!18800 e!122231))

(assert (=> start!18800 true))

(declare-fun b!185776 () Bool)

(declare-fun e!122235 () Bool)

(declare-fun e!122236 () Bool)

(assert (=> b!185776 (= e!122235 (and e!122236 mapRes!7482))))

(declare-fun condMapEmpty!7482 () Bool)

(declare-fun mapDefault!7482 () ValueCell!1830)

(assert (=> b!185776 (= condMapEmpty!7482 (= (arr!3732 (_values!3769 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1830)) mapDefault!7482)))))

(declare-fun tp_is_empty!4347 () Bool)

(declare-fun array_inv!2415 (array!7903) Bool)

(declare-fun array_inv!2416 (array!7905) Bool)

(assert (=> b!185777 (= e!122231 (and tp!16524 tp_is_empty!4347 (array_inv!2415 (_keys!5727 thiss!1248)) (array_inv!2416 (_values!3769 thiss!1248)) e!122235))))

(declare-fun mapNonEmpty!7482 () Bool)

(declare-fun tp!16523 () Bool)

(declare-fun e!122233 () Bool)

(assert (=> mapNonEmpty!7482 (= mapRes!7482 (and tp!16523 e!122233))))

(declare-fun mapValue!7482 () ValueCell!1830)

(declare-fun mapKey!7482 () (_ BitVec 32))

(declare-fun mapRest!7482 () (Array (_ BitVec 32) ValueCell!1830))

(assert (=> mapNonEmpty!7482 (= (arr!3732 (_values!3769 thiss!1248)) (store mapRest!7482 mapKey!7482 mapValue!7482))))

(declare-fun b!185778 () Bool)

(assert (=> b!185778 (= e!122236 tp_is_empty!4347)))

(declare-fun b!185779 () Bool)

(assert (=> b!185779 (= e!122233 tp_is_empty!4347)))

(declare-fun b!185780 () Bool)

(assert (=> b!185780 (= e!122234 e!122232)))

(declare-fun res!87890 () Bool)

(assert (=> b!185780 (=> (not res!87890) (not e!122232))))

(declare-datatypes ((SeekEntryResult!636 0))(
  ( (MissingZero!636 (index!4714 (_ BitVec 32))) (Found!636 (index!4715 (_ BitVec 32))) (Intermediate!636 (undefined!1448 Bool) (index!4716 (_ BitVec 32)) (x!20166 (_ BitVec 32))) (Undefined!636) (MissingVacant!636 (index!4717 (_ BitVec 32))) )
))
(declare-fun lt!91862 () SeekEntryResult!636)

(get-info :version)

(assert (=> b!185780 (= res!87890 (and (not ((_ is Undefined!636) lt!91862)) (not ((_ is MissingVacant!636) lt!91862)) (not ((_ is MissingZero!636) lt!91862)) ((_ is Found!636) lt!91862)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7903 (_ BitVec 32)) SeekEntryResult!636)

(assert (=> b!185780 (= lt!91862 (seekEntryOrOpen!0 key!828 (_keys!5727 thiss!1248) (mask!8899 thiss!1248)))))

(declare-fun b!185781 () Bool)

(declare-fun res!87887 () Bool)

(assert (=> b!185781 (=> (not res!87887) (not e!122232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185781 (= res!87887 (validMask!0 (mask!8899 thiss!1248)))))

(assert (= (and start!18800 res!87893) b!185774))

(assert (= (and b!185774 res!87892) b!185780))

(assert (= (and b!185780 res!87890) b!185772))

(assert (= (and b!185772 res!87888) b!185781))

(assert (= (and b!185781 res!87887) b!185773))

(assert (= (and b!185773 res!87891) b!185771))

(assert (= (and b!185771 res!87889) b!185775))

(assert (= (and b!185776 condMapEmpty!7482) mapIsEmpty!7482))

(assert (= (and b!185776 (not condMapEmpty!7482)) mapNonEmpty!7482))

(assert (= (and mapNonEmpty!7482 ((_ is ValueCellFull!1830) mapValue!7482)) b!185779))

(assert (= (and b!185776 ((_ is ValueCellFull!1830) mapDefault!7482)) b!185778))

(assert (= b!185777 b!185776))

(assert (= start!18800 b!185777))

(declare-fun m!212885 () Bool)

(assert (=> b!185780 m!212885))

(declare-fun m!212887 () Bool)

(assert (=> b!185781 m!212887))

(declare-fun m!212889 () Bool)

(assert (=> b!185772 m!212889))

(assert (=> b!185772 m!212889))

(declare-fun m!212891 () Bool)

(assert (=> b!185772 m!212891))

(declare-fun m!212893 () Bool)

(assert (=> b!185777 m!212893))

(declare-fun m!212895 () Bool)

(assert (=> b!185777 m!212895))

(declare-fun m!212897 () Bool)

(assert (=> b!185771 m!212897))

(declare-fun m!212899 () Bool)

(assert (=> mapNonEmpty!7482 m!212899))

(declare-fun m!212901 () Bool)

(assert (=> b!185775 m!212901))

(declare-fun m!212903 () Bool)

(assert (=> start!18800 m!212903))

(check-sat (not b!185777) tp_is_empty!4347 (not b_next!4575) (not start!18800) (not b!185775) (not b!185771) (not b!185781) (not b!185780) (not b!185772) b_and!11177 (not mapNonEmpty!7482))
(check-sat b_and!11177 (not b_next!4575))
