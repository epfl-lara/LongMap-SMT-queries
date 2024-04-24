; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16552 () Bool)

(assert start!16552)

(declare-fun b!164765 () Bool)

(declare-fun b_free!3853 () Bool)

(declare-fun b_next!3853 () Bool)

(assert (=> b!164765 (= b_free!3853 (not b_next!3853))))

(declare-fun tp!14159 () Bool)

(declare-fun b_and!10281 () Bool)

(assert (=> b!164765 (= tp!14159 b_and!10281)))

(declare-fun mapNonEmpty!6201 () Bool)

(declare-fun mapRes!6201 () Bool)

(declare-fun tp!14160 () Bool)

(declare-fun e!108084 () Bool)

(assert (=> mapNonEmpty!6201 (= mapRes!6201 (and tp!14160 e!108084))))

(declare-datatypes ((V!4521 0))(
  ( (V!4522 (val!1872 Int)) )
))
(declare-datatypes ((ValueCell!1484 0))(
  ( (ValueCellFull!1484 (v!3738 V!4521)) (EmptyCell!1484) )
))
(declare-fun mapValue!6201 () ValueCell!1484)

(declare-fun mapKey!6201 () (_ BitVec 32))

(declare-datatypes ((array!6393 0))(
  ( (array!6394 (arr!3032 (Array (_ BitVec 32) (_ BitVec 64))) (size!3320 (_ BitVec 32))) )
))
(declare-datatypes ((array!6395 0))(
  ( (array!6396 (arr!3033 (Array (_ BitVec 32) ValueCell!1484)) (size!3321 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1876 0))(
  ( (LongMapFixedSize!1877 (defaultEntry!3380 Int) (mask!8077 (_ BitVec 32)) (extraKeys!3121 (_ BitVec 32)) (zeroValue!3223 V!4521) (minValue!3223 V!4521) (_size!987 (_ BitVec 32)) (_keys!5205 array!6393) (_values!3363 array!6395) (_vacant!987 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1876)

(declare-fun mapRest!6201 () (Array (_ BitVec 32) ValueCell!1484))

(assert (=> mapNonEmpty!6201 (= (arr!3033 (_values!3363 thiss!1248)) (store mapRest!6201 mapKey!6201 mapValue!6201))))

(declare-fun b!164758 () Bool)

(declare-fun e!108089 () Bool)

(declare-fun tp_is_empty!3655 () Bool)

(assert (=> b!164758 (= e!108089 tp_is_empty!3655)))

(declare-fun res!78049 () Bool)

(declare-fun e!108087 () Bool)

(assert (=> start!16552 (=> (not res!78049) (not e!108087))))

(declare-fun valid!852 (LongMapFixedSize!1876) Bool)

(assert (=> start!16552 (= res!78049 (valid!852 thiss!1248))))

(assert (=> start!16552 e!108087))

(declare-fun e!108083 () Bool)

(assert (=> start!16552 e!108083))

(assert (=> start!16552 true))

(declare-fun b!164759 () Bool)

(declare-fun e!108088 () Bool)

(assert (=> b!164759 (= e!108087 e!108088)))

(declare-fun res!78053 () Bool)

(assert (=> b!164759 (=> (not res!78053) (not e!108088))))

(declare-datatypes ((SeekEntryResult!417 0))(
  ( (MissingZero!417 (index!3836 (_ BitVec 32))) (Found!417 (index!3837 (_ BitVec 32))) (Intermediate!417 (undefined!1229 Bool) (index!3838 (_ BitVec 32)) (x!18261 (_ BitVec 32))) (Undefined!417) (MissingVacant!417 (index!3839 (_ BitVec 32))) )
))
(declare-fun lt!82998 () SeekEntryResult!417)

(get-info :version)

(assert (=> b!164759 (= res!78053 (and (not ((_ is Undefined!417) lt!82998)) (not ((_ is MissingVacant!417) lt!82998)) (not ((_ is MissingZero!417) lt!82998)) ((_ is Found!417) lt!82998)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6393 (_ BitVec 32)) SeekEntryResult!417)

(assert (=> b!164759 (= lt!82998 (seekEntryOrOpen!0 key!828 (_keys!5205 thiss!1248) (mask!8077 thiss!1248)))))

(declare-fun b!164760 () Bool)

(assert (=> b!164760 (= e!108088 false)))

(declare-fun lt!82997 () Bool)

(declare-datatypes ((List!2013 0))(
  ( (Nil!2010) (Cons!2009 (h!2626 (_ BitVec 64)) (t!6807 List!2013)) )
))
(declare-fun arrayNoDuplicates!0 (array!6393 (_ BitVec 32) List!2013) Bool)

(assert (=> b!164760 (= lt!82997 (arrayNoDuplicates!0 (_keys!5205 thiss!1248) #b00000000000000000000000000000000 Nil!2010))))

(declare-fun b!164761 () Bool)

(declare-fun e!108085 () Bool)

(assert (=> b!164761 (= e!108085 (and e!108089 mapRes!6201))))

(declare-fun condMapEmpty!6201 () Bool)

(declare-fun mapDefault!6201 () ValueCell!1484)

(assert (=> b!164761 (= condMapEmpty!6201 (= (arr!3033 (_values!3363 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1484)) mapDefault!6201)))))

(declare-fun b!164762 () Bool)

(declare-fun res!78052 () Bool)

(assert (=> b!164762 (=> (not res!78052) (not e!108088))))

(declare-datatypes ((tuple2!2992 0))(
  ( (tuple2!2993 (_1!1507 (_ BitVec 64)) (_2!1507 V!4521)) )
))
(declare-datatypes ((List!2014 0))(
  ( (Nil!2011) (Cons!2010 (h!2627 tuple2!2992) (t!6808 List!2014)) )
))
(declare-datatypes ((ListLongMap!1953 0))(
  ( (ListLongMap!1954 (toList!992 List!2014)) )
))
(declare-fun contains!1044 (ListLongMap!1953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!654 (array!6393 array!6395 (_ BitVec 32) (_ BitVec 32) V!4521 V!4521 (_ BitVec 32) Int) ListLongMap!1953)

(assert (=> b!164762 (= res!78052 (contains!1044 (getCurrentListMap!654 (_keys!5205 thiss!1248) (_values!3363 thiss!1248) (mask!8077 thiss!1248) (extraKeys!3121 thiss!1248) (zeroValue!3223 thiss!1248) (minValue!3223 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3380 thiss!1248)) key!828))))

(declare-fun b!164763 () Bool)

(declare-fun res!78050 () Bool)

(assert (=> b!164763 (=> (not res!78050) (not e!108087))))

(assert (=> b!164763 (= res!78050 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6201 () Bool)

(assert (=> mapIsEmpty!6201 mapRes!6201))

(declare-fun b!164764 () Bool)

(declare-fun res!78051 () Bool)

(assert (=> b!164764 (=> (not res!78051) (not e!108088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164764 (= res!78051 (validMask!0 (mask!8077 thiss!1248)))))

(declare-fun array_inv!1945 (array!6393) Bool)

(declare-fun array_inv!1946 (array!6395) Bool)

(assert (=> b!164765 (= e!108083 (and tp!14159 tp_is_empty!3655 (array_inv!1945 (_keys!5205 thiss!1248)) (array_inv!1946 (_values!3363 thiss!1248)) e!108085))))

(declare-fun b!164766 () Bool)

(assert (=> b!164766 (= e!108084 tp_is_empty!3655)))

(declare-fun b!164767 () Bool)

(declare-fun res!78048 () Bool)

(assert (=> b!164767 (=> (not res!78048) (not e!108088))))

(assert (=> b!164767 (= res!78048 (and (= (size!3321 (_values!3363 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8077 thiss!1248))) (= (size!3320 (_keys!5205 thiss!1248)) (size!3321 (_values!3363 thiss!1248))) (bvsge (mask!8077 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3121 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3121 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164768 () Bool)

(declare-fun res!78054 () Bool)

(assert (=> b!164768 (=> (not res!78054) (not e!108088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6393 (_ BitVec 32)) Bool)

(assert (=> b!164768 (= res!78054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5205 thiss!1248) (mask!8077 thiss!1248)))))

(assert (= (and start!16552 res!78049) b!164763))

(assert (= (and b!164763 res!78050) b!164759))

(assert (= (and b!164759 res!78053) b!164762))

(assert (= (and b!164762 res!78052) b!164764))

(assert (= (and b!164764 res!78051) b!164767))

(assert (= (and b!164767 res!78048) b!164768))

(assert (= (and b!164768 res!78054) b!164760))

(assert (= (and b!164761 condMapEmpty!6201) mapIsEmpty!6201))

(assert (= (and b!164761 (not condMapEmpty!6201)) mapNonEmpty!6201))

(assert (= (and mapNonEmpty!6201 ((_ is ValueCellFull!1484) mapValue!6201)) b!164766))

(assert (= (and b!164761 ((_ is ValueCellFull!1484) mapDefault!6201)) b!164758))

(assert (= b!164765 b!164761))

(assert (= start!16552 b!164765))

(declare-fun m!194993 () Bool)

(assert (=> b!164765 m!194993))

(declare-fun m!194995 () Bool)

(assert (=> b!164765 m!194995))

(declare-fun m!194997 () Bool)

(assert (=> b!164762 m!194997))

(assert (=> b!164762 m!194997))

(declare-fun m!194999 () Bool)

(assert (=> b!164762 m!194999))

(declare-fun m!195001 () Bool)

(assert (=> start!16552 m!195001))

(declare-fun m!195003 () Bool)

(assert (=> b!164760 m!195003))

(declare-fun m!195005 () Bool)

(assert (=> b!164759 m!195005))

(declare-fun m!195007 () Bool)

(assert (=> b!164764 m!195007))

(declare-fun m!195009 () Bool)

(assert (=> mapNonEmpty!6201 m!195009))

(declare-fun m!195011 () Bool)

(assert (=> b!164768 m!195011))

(check-sat (not b!164768) (not b!164764) (not mapNonEmpty!6201) (not b!164762) tp_is_empty!3655 (not start!16552) b_and!10281 (not b!164765) (not b!164760) (not b!164759) (not b_next!3853))
(check-sat b_and!10281 (not b_next!3853))
