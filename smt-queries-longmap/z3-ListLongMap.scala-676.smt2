; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16562 () Bool)

(assert start!16562)

(declare-fun b!164945 () Bool)

(declare-fun b_free!3867 () Bool)

(declare-fun b_next!3867 () Bool)

(assert (=> b!164945 (= b_free!3867 (not b_next!3867))))

(declare-fun tp!14202 () Bool)

(declare-fun b_and!10281 () Bool)

(assert (=> b!164945 (= tp!14202 b_and!10281)))

(declare-fun b!164942 () Bool)

(declare-fun e!108210 () Bool)

(declare-fun e!108212 () Bool)

(declare-fun mapRes!6222 () Bool)

(assert (=> b!164942 (= e!108210 (and e!108212 mapRes!6222))))

(declare-fun condMapEmpty!6222 () Bool)

(declare-datatypes ((V!4539 0))(
  ( (V!4540 (val!1879 Int)) )
))
(declare-datatypes ((ValueCell!1491 0))(
  ( (ValueCellFull!1491 (v!3744 V!4539)) (EmptyCell!1491) )
))
(declare-datatypes ((array!6435 0))(
  ( (array!6436 (arr!3053 (Array (_ BitVec 32) (_ BitVec 64))) (size!3341 (_ BitVec 32))) )
))
(declare-datatypes ((array!6437 0))(
  ( (array!6438 (arr!3054 (Array (_ BitVec 32) ValueCell!1491)) (size!3342 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1890 0))(
  ( (LongMapFixedSize!1891 (defaultEntry!3387 Int) (mask!8088 (_ BitVec 32)) (extraKeys!3128 (_ BitVec 32)) (zeroValue!3230 V!4539) (minValue!3230 V!4539) (_size!994 (_ BitVec 32)) (_keys!5212 array!6435) (_values!3370 array!6437) (_vacant!994 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1890)

(declare-fun mapDefault!6222 () ValueCell!1491)

(assert (=> b!164942 (= condMapEmpty!6222 (= (arr!3054 (_values!3370 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1491)) mapDefault!6222)))))

(declare-fun b!164943 () Bool)

(declare-fun e!108211 () Bool)

(assert (=> b!164943 (= e!108211 false)))

(declare-fun lt!82981 () Bool)

(declare-datatypes ((List!2030 0))(
  ( (Nil!2027) (Cons!2026 (h!2643 (_ BitVec 64)) (t!6832 List!2030)) )
))
(declare-fun arrayNoDuplicates!0 (array!6435 (_ BitVec 32) List!2030) Bool)

(assert (=> b!164943 (= lt!82981 (arrayNoDuplicates!0 (_keys!5212 thiss!1248) #b00000000000000000000000000000000 Nil!2027))))

(declare-fun b!164944 () Bool)

(declare-fun res!78179 () Bool)

(assert (=> b!164944 (=> (not res!78179) (not e!108211))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3048 0))(
  ( (tuple2!3049 (_1!1535 (_ BitVec 64)) (_2!1535 V!4539)) )
))
(declare-datatypes ((List!2031 0))(
  ( (Nil!2028) (Cons!2027 (h!2644 tuple2!3048) (t!6833 List!2031)) )
))
(declare-datatypes ((ListLongMap!2003 0))(
  ( (ListLongMap!2004 (toList!1017 List!2031)) )
))
(declare-fun contains!1059 (ListLongMap!2003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!675 (array!6435 array!6437 (_ BitVec 32) (_ BitVec 32) V!4539 V!4539 (_ BitVec 32) Int) ListLongMap!2003)

(assert (=> b!164944 (= res!78179 (contains!1059 (getCurrentListMap!675 (_keys!5212 thiss!1248) (_values!3370 thiss!1248) (mask!8088 thiss!1248) (extraKeys!3128 thiss!1248) (zeroValue!3230 thiss!1248) (minValue!3230 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3387 thiss!1248)) key!828))))

(declare-fun tp_is_empty!3669 () Bool)

(declare-fun e!108207 () Bool)

(declare-fun array_inv!1959 (array!6435) Bool)

(declare-fun array_inv!1960 (array!6437) Bool)

(assert (=> b!164945 (= e!108207 (and tp!14202 tp_is_empty!3669 (array_inv!1959 (_keys!5212 thiss!1248)) (array_inv!1960 (_values!3370 thiss!1248)) e!108210))))

(declare-fun b!164946 () Bool)

(declare-fun e!108206 () Bool)

(assert (=> b!164946 (= e!108206 e!108211)))

(declare-fun res!78175 () Bool)

(assert (=> b!164946 (=> (not res!78175) (not e!108211))))

(declare-datatypes ((SeekEntryResult!425 0))(
  ( (MissingZero!425 (index!3868 (_ BitVec 32))) (Found!425 (index!3869 (_ BitVec 32))) (Intermediate!425 (undefined!1237 Bool) (index!3870 (_ BitVec 32)) (x!18285 (_ BitVec 32))) (Undefined!425) (MissingVacant!425 (index!3871 (_ BitVec 32))) )
))
(declare-fun lt!82980 () SeekEntryResult!425)

(get-info :version)

(assert (=> b!164946 (= res!78175 (and (not ((_ is Undefined!425) lt!82980)) (not ((_ is MissingVacant!425) lt!82980)) (not ((_ is MissingZero!425) lt!82980)) ((_ is Found!425) lt!82980)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6435 (_ BitVec 32)) SeekEntryResult!425)

(assert (=> b!164946 (= lt!82980 (seekEntryOrOpen!0 key!828 (_keys!5212 thiss!1248) (mask!8088 thiss!1248)))))

(declare-fun b!164947 () Bool)

(declare-fun e!108208 () Bool)

(assert (=> b!164947 (= e!108208 tp_is_empty!3669)))

(declare-fun res!78176 () Bool)

(assert (=> start!16562 (=> (not res!78176) (not e!108206))))

(declare-fun valid!839 (LongMapFixedSize!1890) Bool)

(assert (=> start!16562 (= res!78176 (valid!839 thiss!1248))))

(assert (=> start!16562 e!108206))

(assert (=> start!16562 e!108207))

(assert (=> start!16562 true))

(declare-fun b!164948 () Bool)

(declare-fun res!78177 () Bool)

(assert (=> b!164948 (=> (not res!78177) (not e!108211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6435 (_ BitVec 32)) Bool)

(assert (=> b!164948 (= res!78177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5212 thiss!1248) (mask!8088 thiss!1248)))))

(declare-fun b!164949 () Bool)

(assert (=> b!164949 (= e!108212 tp_is_empty!3669)))

(declare-fun mapNonEmpty!6222 () Bool)

(declare-fun tp!14201 () Bool)

(assert (=> mapNonEmpty!6222 (= mapRes!6222 (and tp!14201 e!108208))))

(declare-fun mapKey!6222 () (_ BitVec 32))

(declare-fun mapValue!6222 () ValueCell!1491)

(declare-fun mapRest!6222 () (Array (_ BitVec 32) ValueCell!1491))

(assert (=> mapNonEmpty!6222 (= (arr!3054 (_values!3370 thiss!1248)) (store mapRest!6222 mapKey!6222 mapValue!6222))))

(declare-fun b!164950 () Bool)

(declare-fun res!78178 () Bool)

(assert (=> b!164950 (=> (not res!78178) (not e!108211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164950 (= res!78178 (validMask!0 (mask!8088 thiss!1248)))))

(declare-fun mapIsEmpty!6222 () Bool)

(assert (=> mapIsEmpty!6222 mapRes!6222))

(declare-fun b!164951 () Bool)

(declare-fun res!78174 () Bool)

(assert (=> b!164951 (=> (not res!78174) (not e!108206))))

(assert (=> b!164951 (= res!78174 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164952 () Bool)

(declare-fun res!78180 () Bool)

(assert (=> b!164952 (=> (not res!78180) (not e!108211))))

(assert (=> b!164952 (= res!78180 (and (= (size!3342 (_values!3370 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8088 thiss!1248))) (= (size!3341 (_keys!5212 thiss!1248)) (size!3342 (_values!3370 thiss!1248))) (bvsge (mask!8088 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3128 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3128 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16562 res!78176) b!164951))

(assert (= (and b!164951 res!78174) b!164946))

(assert (= (and b!164946 res!78175) b!164944))

(assert (= (and b!164944 res!78179) b!164950))

(assert (= (and b!164950 res!78178) b!164952))

(assert (= (and b!164952 res!78180) b!164948))

(assert (= (and b!164948 res!78177) b!164943))

(assert (= (and b!164942 condMapEmpty!6222) mapIsEmpty!6222))

(assert (= (and b!164942 (not condMapEmpty!6222)) mapNonEmpty!6222))

(assert (= (and mapNonEmpty!6222 ((_ is ValueCellFull!1491) mapValue!6222)) b!164947))

(assert (= (and b!164942 ((_ is ValueCellFull!1491) mapDefault!6222)) b!164949))

(assert (= b!164945 b!164942))

(assert (= start!16562 b!164945))

(declare-fun m!194951 () Bool)

(assert (=> b!164945 m!194951))

(declare-fun m!194953 () Bool)

(assert (=> b!164945 m!194953))

(declare-fun m!194955 () Bool)

(assert (=> start!16562 m!194955))

(declare-fun m!194957 () Bool)

(assert (=> b!164946 m!194957))

(declare-fun m!194959 () Bool)

(assert (=> mapNonEmpty!6222 m!194959))

(declare-fun m!194961 () Bool)

(assert (=> b!164943 m!194961))

(declare-fun m!194963 () Bool)

(assert (=> b!164944 m!194963))

(assert (=> b!164944 m!194963))

(declare-fun m!194965 () Bool)

(assert (=> b!164944 m!194965))

(declare-fun m!194967 () Bool)

(assert (=> b!164948 m!194967))

(declare-fun m!194969 () Bool)

(assert (=> b!164950 m!194969))

(check-sat (not b!164946) (not start!16562) tp_is_empty!3669 (not b!164950) b_and!10281 (not b!164945) (not mapNonEmpty!6222) (not b_next!3867) (not b!164948) (not b!164944) (not b!164943))
(check-sat b_and!10281 (not b_next!3867))
