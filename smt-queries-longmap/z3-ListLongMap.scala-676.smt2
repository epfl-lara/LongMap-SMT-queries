; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16564 () Bool)

(assert start!16564)

(declare-fun b!164767 () Bool)

(declare-fun b_free!3865 () Bool)

(declare-fun b_next!3865 () Bool)

(assert (=> b!164767 (= b_free!3865 (not b_next!3865))))

(declare-fun tp!14196 () Bool)

(declare-fun b_and!10253 () Bool)

(assert (=> b!164767 (= tp!14196 b_and!10253)))

(declare-fun b!164762 () Bool)

(declare-fun res!78059 () Bool)

(declare-fun e!108087 () Bool)

(assert (=> b!164762 (=> (not res!78059) (not e!108087))))

(declare-datatypes ((V!4537 0))(
  ( (V!4538 (val!1878 Int)) )
))
(declare-datatypes ((ValueCell!1490 0))(
  ( (ValueCellFull!1490 (v!3737 V!4537)) (EmptyCell!1490) )
))
(declare-datatypes ((array!6411 0))(
  ( (array!6412 (arr!3040 (Array (_ BitVec 32) (_ BitVec 64))) (size!3329 (_ BitVec 32))) )
))
(declare-datatypes ((array!6413 0))(
  ( (array!6414 (arr!3041 (Array (_ BitVec 32) ValueCell!1490)) (size!3330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1888 0))(
  ( (LongMapFixedSize!1889 (defaultEntry!3386 Int) (mask!8086 (_ BitVec 32)) (extraKeys!3127 (_ BitVec 32)) (zeroValue!3229 V!4537) (minValue!3229 V!4537) (_size!993 (_ BitVec 32)) (_keys!5210 array!6411) (_values!3369 array!6413) (_vacant!993 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1888)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164762 (= res!78059 (validMask!0 (mask!8086 thiss!1248)))))

(declare-fun mapNonEmpty!6219 () Bool)

(declare-fun mapRes!6219 () Bool)

(declare-fun tp!14195 () Bool)

(declare-fun e!108085 () Bool)

(assert (=> mapNonEmpty!6219 (= mapRes!6219 (and tp!14195 e!108085))))

(declare-fun mapKey!6219 () (_ BitVec 32))

(declare-fun mapRest!6219 () (Array (_ BitVec 32) ValueCell!1490))

(declare-fun mapValue!6219 () ValueCell!1490)

(assert (=> mapNonEmpty!6219 (= (arr!3041 (_values!3369 thiss!1248)) (store mapRest!6219 mapKey!6219 mapValue!6219))))

(declare-fun b!164763 () Bool)

(assert (=> b!164763 (= e!108087 false)))

(declare-fun lt!82793 () Bool)

(declare-datatypes ((List!2035 0))(
  ( (Nil!2032) (Cons!2031 (h!2648 (_ BitVec 64)) (t!6828 List!2035)) )
))
(declare-fun arrayNoDuplicates!0 (array!6411 (_ BitVec 32) List!2035) Bool)

(assert (=> b!164763 (= lt!82793 (arrayNoDuplicates!0 (_keys!5210 thiss!1248) #b00000000000000000000000000000000 Nil!2032))))

(declare-fun b!164764 () Bool)

(declare-fun res!78061 () Bool)

(assert (=> b!164764 (=> (not res!78061) (not e!108087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6411 (_ BitVec 32)) Bool)

(assert (=> b!164764 (= res!78061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5210 thiss!1248) (mask!8086 thiss!1248)))))

(declare-fun b!164765 () Bool)

(declare-fun tp_is_empty!3667 () Bool)

(assert (=> b!164765 (= e!108085 tp_is_empty!3667)))

(declare-fun mapIsEmpty!6219 () Bool)

(assert (=> mapIsEmpty!6219 mapRes!6219))

(declare-fun res!78060 () Bool)

(declare-fun e!108090 () Bool)

(assert (=> start!16564 (=> (not res!78060) (not e!108090))))

(declare-fun valid!844 (LongMapFixedSize!1888) Bool)

(assert (=> start!16564 (= res!78060 (valid!844 thiss!1248))))

(assert (=> start!16564 e!108090))

(declare-fun e!108084 () Bool)

(assert (=> start!16564 e!108084))

(assert (=> start!16564 true))

(declare-fun b!164766 () Bool)

(declare-fun res!78062 () Bool)

(assert (=> b!164766 (=> (not res!78062) (not e!108087))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3036 0))(
  ( (tuple2!3037 (_1!1529 (_ BitVec 64)) (_2!1529 V!4537)) )
))
(declare-datatypes ((List!2036 0))(
  ( (Nil!2033) (Cons!2032 (h!2649 tuple2!3036) (t!6829 List!2036)) )
))
(declare-datatypes ((ListLongMap!1979 0))(
  ( (ListLongMap!1980 (toList!1005 List!2036)) )
))
(declare-fun contains!1050 (ListLongMap!1979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!647 (array!6411 array!6413 (_ BitVec 32) (_ BitVec 32) V!4537 V!4537 (_ BitVec 32) Int) ListLongMap!1979)

(assert (=> b!164766 (= res!78062 (contains!1050 (getCurrentListMap!647 (_keys!5210 thiss!1248) (_values!3369 thiss!1248) (mask!8086 thiss!1248) (extraKeys!3127 thiss!1248) (zeroValue!3229 thiss!1248) (minValue!3229 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3386 thiss!1248)) key!828))))

(declare-fun e!108086 () Bool)

(declare-fun array_inv!1957 (array!6411) Bool)

(declare-fun array_inv!1958 (array!6413) Bool)

(assert (=> b!164767 (= e!108084 (and tp!14196 tp_is_empty!3667 (array_inv!1957 (_keys!5210 thiss!1248)) (array_inv!1958 (_values!3369 thiss!1248)) e!108086))))

(declare-fun b!164768 () Bool)

(declare-fun e!108088 () Bool)

(assert (=> b!164768 (= e!108086 (and e!108088 mapRes!6219))))

(declare-fun condMapEmpty!6219 () Bool)

(declare-fun mapDefault!6219 () ValueCell!1490)

(assert (=> b!164768 (= condMapEmpty!6219 (= (arr!3041 (_values!3369 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1490)) mapDefault!6219)))))

(declare-fun b!164769 () Bool)

(assert (=> b!164769 (= e!108088 tp_is_empty!3667)))

(declare-fun b!164770 () Bool)

(declare-fun res!78064 () Bool)

(assert (=> b!164770 (=> (not res!78064) (not e!108090))))

(assert (=> b!164770 (= res!78064 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164771 () Bool)

(declare-fun res!78058 () Bool)

(assert (=> b!164771 (=> (not res!78058) (not e!108087))))

(assert (=> b!164771 (= res!78058 (and (= (size!3330 (_values!3369 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8086 thiss!1248))) (= (size!3329 (_keys!5210 thiss!1248)) (size!3330 (_values!3369 thiss!1248))) (bvsge (mask!8086 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3127 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3127 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164772 () Bool)

(assert (=> b!164772 (= e!108090 e!108087)))

(declare-fun res!78063 () Bool)

(assert (=> b!164772 (=> (not res!78063) (not e!108087))))

(declare-datatypes ((SeekEntryResult!435 0))(
  ( (MissingZero!435 (index!3908 (_ BitVec 32))) (Found!435 (index!3909 (_ BitVec 32))) (Intermediate!435 (undefined!1247 Bool) (index!3910 (_ BitVec 32)) (x!18294 (_ BitVec 32))) (Undefined!435) (MissingVacant!435 (index!3911 (_ BitVec 32))) )
))
(declare-fun lt!82794 () SeekEntryResult!435)

(get-info :version)

(assert (=> b!164772 (= res!78063 (and (not ((_ is Undefined!435) lt!82794)) (not ((_ is MissingVacant!435) lt!82794)) (not ((_ is MissingZero!435) lt!82794)) ((_ is Found!435) lt!82794)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6411 (_ BitVec 32)) SeekEntryResult!435)

(assert (=> b!164772 (= lt!82794 (seekEntryOrOpen!0 key!828 (_keys!5210 thiss!1248) (mask!8086 thiss!1248)))))

(assert (= (and start!16564 res!78060) b!164770))

(assert (= (and b!164770 res!78064) b!164772))

(assert (= (and b!164772 res!78063) b!164766))

(assert (= (and b!164766 res!78062) b!164762))

(assert (= (and b!164762 res!78059) b!164771))

(assert (= (and b!164771 res!78058) b!164764))

(assert (= (and b!164764 res!78061) b!164763))

(assert (= (and b!164768 condMapEmpty!6219) mapIsEmpty!6219))

(assert (= (and b!164768 (not condMapEmpty!6219)) mapNonEmpty!6219))

(assert (= (and mapNonEmpty!6219 ((_ is ValueCellFull!1490) mapValue!6219)) b!164765))

(assert (= (and b!164768 ((_ is ValueCellFull!1490) mapDefault!6219)) b!164769))

(assert (= b!164767 b!164768))

(assert (= start!16564 b!164767))

(declare-fun m!194311 () Bool)

(assert (=> start!16564 m!194311))

(declare-fun m!194313 () Bool)

(assert (=> b!164766 m!194313))

(assert (=> b!164766 m!194313))

(declare-fun m!194315 () Bool)

(assert (=> b!164766 m!194315))

(declare-fun m!194317 () Bool)

(assert (=> b!164762 m!194317))

(declare-fun m!194319 () Bool)

(assert (=> b!164763 m!194319))

(declare-fun m!194321 () Bool)

(assert (=> b!164764 m!194321))

(declare-fun m!194323 () Bool)

(assert (=> b!164767 m!194323))

(declare-fun m!194325 () Bool)

(assert (=> b!164767 m!194325))

(declare-fun m!194327 () Bool)

(assert (=> b!164772 m!194327))

(declare-fun m!194329 () Bool)

(assert (=> mapNonEmpty!6219 m!194329))

(check-sat (not b!164764) (not start!16564) (not b!164766) (not b!164762) b_and!10253 (not b_next!3865) (not b!164763) (not b!164767) (not mapNonEmpty!6219) (not b!164772) tp_is_empty!3667)
(check-sat b_and!10253 (not b_next!3865))
