; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16550 () Bool)

(assert start!16550)

(declare-fun b!164749 () Bool)

(declare-fun b_free!3855 () Bool)

(declare-fun b_next!3855 () Bool)

(assert (=> b!164749 (= b_free!3855 (not b_next!3855))))

(declare-fun tp!14165 () Bool)

(declare-fun b_and!10269 () Bool)

(assert (=> b!164749 (= tp!14165 b_and!10269)))

(declare-fun b!164744 () Bool)

(declare-fun e!108085 () Bool)

(declare-fun e!108083 () Bool)

(declare-fun mapRes!6204 () Bool)

(assert (=> b!164744 (= e!108085 (and e!108083 mapRes!6204))))

(declare-fun condMapEmpty!6204 () Bool)

(declare-datatypes ((V!4523 0))(
  ( (V!4524 (val!1873 Int)) )
))
(declare-datatypes ((ValueCell!1485 0))(
  ( (ValueCellFull!1485 (v!3738 V!4523)) (EmptyCell!1485) )
))
(declare-datatypes ((array!6411 0))(
  ( (array!6412 (arr!3041 (Array (_ BitVec 32) (_ BitVec 64))) (size!3329 (_ BitVec 32))) )
))
(declare-datatypes ((array!6413 0))(
  ( (array!6414 (arr!3042 (Array (_ BitVec 32) ValueCell!1485)) (size!3330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1878 0))(
  ( (LongMapFixedSize!1879 (defaultEntry!3381 Int) (mask!8078 (_ BitVec 32)) (extraKeys!3122 (_ BitVec 32)) (zeroValue!3224 V!4523) (minValue!3224 V!4523) (_size!988 (_ BitVec 32)) (_keys!5206 array!6411) (_values!3364 array!6413) (_vacant!988 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1878)

(declare-fun mapDefault!6204 () ValueCell!1485)

(assert (=> b!164744 (= condMapEmpty!6204 (= (arr!3042 (_values!3364 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1485)) mapDefault!6204)))))

(declare-fun b!164745 () Bool)

(declare-fun res!78052 () Bool)

(declare-fun e!108084 () Bool)

(assert (=> b!164745 (=> (not res!78052) (not e!108084))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164745 (= res!78052 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164746 () Bool)

(declare-fun e!108086 () Bool)

(assert (=> b!164746 (= e!108084 e!108086)))

(declare-fun res!78050 () Bool)

(assert (=> b!164746 (=> (not res!78050) (not e!108086))))

(declare-datatypes ((SeekEntryResult!422 0))(
  ( (MissingZero!422 (index!3856 (_ BitVec 32))) (Found!422 (index!3857 (_ BitVec 32))) (Intermediate!422 (undefined!1234 Bool) (index!3858 (_ BitVec 32)) (x!18266 (_ BitVec 32))) (Undefined!422) (MissingVacant!422 (index!3859 (_ BitVec 32))) )
))
(declare-fun lt!82944 () SeekEntryResult!422)

(get-info :version)

(assert (=> b!164746 (= res!78050 (and (not ((_ is Undefined!422) lt!82944)) (not ((_ is MissingVacant!422) lt!82944)) (not ((_ is MissingZero!422) lt!82944)) ((_ is Found!422) lt!82944)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6411 (_ BitVec 32)) SeekEntryResult!422)

(assert (=> b!164746 (= lt!82944 (seekEntryOrOpen!0 key!828 (_keys!5206 thiss!1248) (mask!8078 thiss!1248)))))

(declare-fun b!164747 () Bool)

(declare-fun res!78051 () Bool)

(assert (=> b!164747 (=> (not res!78051) (not e!108086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164747 (= res!78051 (validMask!0 (mask!8078 thiss!1248)))))

(declare-fun b!164748 () Bool)

(declare-fun e!108081 () Bool)

(declare-fun tp_is_empty!3657 () Bool)

(assert (=> b!164748 (= e!108081 tp_is_empty!3657)))

(declare-fun e!108082 () Bool)

(declare-fun array_inv!1949 (array!6411) Bool)

(declare-fun array_inv!1950 (array!6413) Bool)

(assert (=> b!164749 (= e!108082 (and tp!14165 tp_is_empty!3657 (array_inv!1949 (_keys!5206 thiss!1248)) (array_inv!1950 (_values!3364 thiss!1248)) e!108085))))

(declare-fun res!78049 () Bool)

(assert (=> start!16550 (=> (not res!78049) (not e!108084))))

(declare-fun valid!835 (LongMapFixedSize!1878) Bool)

(assert (=> start!16550 (= res!78049 (valid!835 thiss!1248))))

(assert (=> start!16550 e!108084))

(assert (=> start!16550 e!108082))

(assert (=> start!16550 true))

(declare-fun mapNonEmpty!6204 () Bool)

(declare-fun tp!14166 () Bool)

(assert (=> mapNonEmpty!6204 (= mapRes!6204 (and tp!14166 e!108081))))

(declare-fun mapValue!6204 () ValueCell!1485)

(declare-fun mapKey!6204 () (_ BitVec 32))

(declare-fun mapRest!6204 () (Array (_ BitVec 32) ValueCell!1485))

(assert (=> mapNonEmpty!6204 (= (arr!3042 (_values!3364 thiss!1248)) (store mapRest!6204 mapKey!6204 mapValue!6204))))

(declare-fun b!164750 () Bool)

(assert (=> b!164750 (= e!108086 false)))

(declare-fun lt!82945 () Bool)

(declare-datatypes ((List!2020 0))(
  ( (Nil!2017) (Cons!2016 (h!2633 (_ BitVec 64)) (t!6822 List!2020)) )
))
(declare-fun arrayNoDuplicates!0 (array!6411 (_ BitVec 32) List!2020) Bool)

(assert (=> b!164750 (= lt!82945 (arrayNoDuplicates!0 (_keys!5206 thiss!1248) #b00000000000000000000000000000000 Nil!2017))))

(declare-fun mapIsEmpty!6204 () Bool)

(assert (=> mapIsEmpty!6204 mapRes!6204))

(declare-fun b!164751 () Bool)

(declare-fun res!78054 () Bool)

(assert (=> b!164751 (=> (not res!78054) (not e!108086))))

(declare-datatypes ((tuple2!3038 0))(
  ( (tuple2!3039 (_1!1530 (_ BitVec 64)) (_2!1530 V!4523)) )
))
(declare-datatypes ((List!2021 0))(
  ( (Nil!2018) (Cons!2017 (h!2634 tuple2!3038) (t!6823 List!2021)) )
))
(declare-datatypes ((ListLongMap!1993 0))(
  ( (ListLongMap!1994 (toList!1012 List!2021)) )
))
(declare-fun contains!1054 (ListLongMap!1993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!670 (array!6411 array!6413 (_ BitVec 32) (_ BitVec 32) V!4523 V!4523 (_ BitVec 32) Int) ListLongMap!1993)

(assert (=> b!164751 (= res!78054 (contains!1054 (getCurrentListMap!670 (_keys!5206 thiss!1248) (_values!3364 thiss!1248) (mask!8078 thiss!1248) (extraKeys!3122 thiss!1248) (zeroValue!3224 thiss!1248) (minValue!3224 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3381 thiss!1248)) key!828))))

(declare-fun b!164752 () Bool)

(declare-fun res!78048 () Bool)

(assert (=> b!164752 (=> (not res!78048) (not e!108086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6411 (_ BitVec 32)) Bool)

(assert (=> b!164752 (= res!78048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5206 thiss!1248) (mask!8078 thiss!1248)))))

(declare-fun b!164753 () Bool)

(declare-fun res!78053 () Bool)

(assert (=> b!164753 (=> (not res!78053) (not e!108086))))

(assert (=> b!164753 (= res!78053 (and (= (size!3330 (_values!3364 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8078 thiss!1248))) (= (size!3329 (_keys!5206 thiss!1248)) (size!3330 (_values!3364 thiss!1248))) (bvsge (mask!8078 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3122 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3122 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164754 () Bool)

(assert (=> b!164754 (= e!108083 tp_is_empty!3657)))

(assert (= (and start!16550 res!78049) b!164745))

(assert (= (and b!164745 res!78052) b!164746))

(assert (= (and b!164746 res!78050) b!164751))

(assert (= (and b!164751 res!78054) b!164747))

(assert (= (and b!164747 res!78051) b!164753))

(assert (= (and b!164753 res!78053) b!164752))

(assert (= (and b!164752 res!78048) b!164750))

(assert (= (and b!164744 condMapEmpty!6204) mapIsEmpty!6204))

(assert (= (and b!164744 (not condMapEmpty!6204)) mapNonEmpty!6204))

(assert (= (and mapNonEmpty!6204 ((_ is ValueCellFull!1485) mapValue!6204)) b!164748))

(assert (= (and b!164744 ((_ is ValueCellFull!1485) mapDefault!6204)) b!164754))

(assert (= b!164749 b!164744))

(assert (= start!16550 b!164749))

(declare-fun m!194831 () Bool)

(assert (=> b!164746 m!194831))

(declare-fun m!194833 () Bool)

(assert (=> b!164747 m!194833))

(declare-fun m!194835 () Bool)

(assert (=> b!164749 m!194835))

(declare-fun m!194837 () Bool)

(assert (=> b!164749 m!194837))

(declare-fun m!194839 () Bool)

(assert (=> start!16550 m!194839))

(declare-fun m!194841 () Bool)

(assert (=> b!164750 m!194841))

(declare-fun m!194843 () Bool)

(assert (=> b!164752 m!194843))

(declare-fun m!194845 () Bool)

(assert (=> mapNonEmpty!6204 m!194845))

(declare-fun m!194847 () Bool)

(assert (=> b!164751 m!194847))

(assert (=> b!164751 m!194847))

(declare-fun m!194849 () Bool)

(assert (=> b!164751 m!194849))

(check-sat b_and!10269 (not b!164749) (not b!164747) (not b!164750) (not mapNonEmpty!6204) (not b!164752) tp_is_empty!3657 (not b_next!3855) (not b!164751) (not b!164746) (not start!16550))
(check-sat b_and!10269 (not b_next!3855))
