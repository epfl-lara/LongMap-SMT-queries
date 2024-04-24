; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16156 () Bool)

(assert start!16156)

(declare-fun b!160968 () Bool)

(declare-fun b_free!3613 () Bool)

(declare-fun b_next!3613 () Bool)

(assert (=> b!160968 (= b_free!3613 (not b_next!3613))))

(declare-fun tp!13409 () Bool)

(declare-fun b_and!10041 () Bool)

(assert (=> b!160968 (= tp!13409 b_and!10041)))

(declare-fun b!160961 () Bool)

(declare-fun e!105190 () Bool)

(assert (=> b!160961 (= e!105190 false)))

(declare-fun lt!82191 () Bool)

(declare-datatypes ((V!4201 0))(
  ( (V!4202 (val!1752 Int)) )
))
(declare-datatypes ((ValueCell!1364 0))(
  ( (ValueCellFull!1364 (v!3618 V!4201)) (EmptyCell!1364) )
))
(declare-datatypes ((array!5895 0))(
  ( (array!5896 (arr!2792 (Array (_ BitVec 32) (_ BitVec 64))) (size!3076 (_ BitVec 32))) )
))
(declare-datatypes ((array!5897 0))(
  ( (array!5898 (arr!2793 (Array (_ BitVec 32) ValueCell!1364)) (size!3077 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1636 0))(
  ( (LongMapFixedSize!1637 (defaultEntry!3260 Int) (mask!7840 (_ BitVec 32)) (extraKeys!3001 (_ BitVec 32)) (zeroValue!3103 V!4201) (minValue!3103 V!4201) (_size!867 (_ BitVec 32)) (_keys!5061 array!5895) (_values!3243 array!5897) (_vacant!867 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1636)

(declare-datatypes ((List!1953 0))(
  ( (Nil!1950) (Cons!1949 (h!2562 (_ BitVec 64)) (t!6747 List!1953)) )
))
(declare-fun arrayNoDuplicates!0 (array!5895 (_ BitVec 32) List!1953) Bool)

(assert (=> b!160961 (= lt!82191 (arrayNoDuplicates!0 (_keys!5061 thiss!1248) #b00000000000000000000000000000000 Nil!1950))))

(declare-fun b!160962 () Bool)

(declare-fun e!105191 () Bool)

(declare-fun tp_is_empty!3415 () Bool)

(assert (=> b!160962 (= e!105191 tp_is_empty!3415)))

(declare-fun mapNonEmpty!5810 () Bool)

(declare-fun mapRes!5810 () Bool)

(declare-fun tp!13408 () Bool)

(declare-fun e!105189 () Bool)

(assert (=> mapNonEmpty!5810 (= mapRes!5810 (and tp!13408 e!105189))))

(declare-fun mapKey!5810 () (_ BitVec 32))

(declare-fun mapRest!5810 () (Array (_ BitVec 32) ValueCell!1364))

(declare-fun mapValue!5810 () ValueCell!1364)

(assert (=> mapNonEmpty!5810 (= (arr!2793 (_values!3243 thiss!1248)) (store mapRest!5810 mapKey!5810 mapValue!5810))))

(declare-fun b!160963 () Bool)

(declare-fun res!76294 () Bool)

(assert (=> b!160963 (=> (not res!76294) (not e!105190))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160963 (= res!76294 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160964 () Bool)

(assert (=> b!160964 (= e!105189 tp_is_empty!3415)))

(declare-fun b!160965 () Bool)

(declare-fun res!76291 () Bool)

(assert (=> b!160965 (=> (not res!76291) (not e!105190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160965 (= res!76291 (validMask!0 (mask!7840 thiss!1248)))))

(declare-fun b!160966 () Bool)

(declare-fun res!76295 () Bool)

(assert (=> b!160966 (=> (not res!76295) (not e!105190))))

(declare-datatypes ((tuple2!2888 0))(
  ( (tuple2!2889 (_1!1455 (_ BitVec 64)) (_2!1455 V!4201)) )
))
(declare-datatypes ((List!1954 0))(
  ( (Nil!1951) (Cons!1950 (h!2563 tuple2!2888) (t!6748 List!1954)) )
))
(declare-datatypes ((ListLongMap!1887 0))(
  ( (ListLongMap!1888 (toList!959 List!1954)) )
))
(declare-fun contains!1005 (ListLongMap!1887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!626 (array!5895 array!5897 (_ BitVec 32) (_ BitVec 32) V!4201 V!4201 (_ BitVec 32) Int) ListLongMap!1887)

(assert (=> b!160966 (= res!76295 (not (contains!1005 (getCurrentListMap!626 (_keys!5061 thiss!1248) (_values!3243 thiss!1248) (mask!7840 thiss!1248) (extraKeys!3001 thiss!1248) (zeroValue!3103 thiss!1248) (minValue!3103 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3260 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!5810 () Bool)

(assert (=> mapIsEmpty!5810 mapRes!5810))

(declare-fun e!105187 () Bool)

(declare-fun e!105188 () Bool)

(declare-fun array_inv!1785 (array!5895) Bool)

(declare-fun array_inv!1786 (array!5897) Bool)

(assert (=> b!160968 (= e!105188 (and tp!13409 tp_is_empty!3415 (array_inv!1785 (_keys!5061 thiss!1248)) (array_inv!1786 (_values!3243 thiss!1248)) e!105187))))

(declare-fun b!160969 () Bool)

(declare-fun res!76293 () Bool)

(assert (=> b!160969 (=> (not res!76293) (not e!105190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5895 (_ BitVec 32)) Bool)

(assert (=> b!160969 (= res!76293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5061 thiss!1248) (mask!7840 thiss!1248)))))

(declare-fun b!160967 () Bool)

(assert (=> b!160967 (= e!105187 (and e!105191 mapRes!5810))))

(declare-fun condMapEmpty!5810 () Bool)

(declare-fun mapDefault!5810 () ValueCell!1364)

(assert (=> b!160967 (= condMapEmpty!5810 (= (arr!2793 (_values!3243 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1364)) mapDefault!5810)))))

(declare-fun res!76292 () Bool)

(assert (=> start!16156 (=> (not res!76292) (not e!105190))))

(declare-fun valid!774 (LongMapFixedSize!1636) Bool)

(assert (=> start!16156 (= res!76292 (valid!774 thiss!1248))))

(assert (=> start!16156 e!105190))

(assert (=> start!16156 e!105188))

(assert (=> start!16156 true))

(declare-fun b!160970 () Bool)

(declare-fun res!76289 () Bool)

(assert (=> b!160970 (=> (not res!76289) (not e!105190))))

(assert (=> b!160970 (= res!76289 (and (= (size!3077 (_values!3243 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7840 thiss!1248))) (= (size!3076 (_keys!5061 thiss!1248)) (size!3077 (_values!3243 thiss!1248))) (bvsge (mask!7840 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3001 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3001 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160971 () Bool)

(declare-fun res!76290 () Bool)

(assert (=> b!160971 (=> (not res!76290) (not e!105190))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!334 0))(
  ( (MissingZero!334 (index!3504 (_ BitVec 32))) (Found!334 (index!3505 (_ BitVec 32))) (Intermediate!334 (undefined!1146 Bool) (index!3506 (_ BitVec 32)) (x!17750 (_ BitVec 32))) (Undefined!334) (MissingVacant!334 (index!3507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5895 (_ BitVec 32)) SeekEntryResult!334)

(assert (=> b!160971 (= res!76290 ((_ is Undefined!334) (seekEntryOrOpen!0 key!828 (_keys!5061 thiss!1248) (mask!7840 thiss!1248))))))

(assert (= (and start!16156 res!76292) b!160963))

(assert (= (and b!160963 res!76294) b!160971))

(assert (= (and b!160971 res!76290) b!160966))

(assert (= (and b!160966 res!76295) b!160965))

(assert (= (and b!160965 res!76291) b!160970))

(assert (= (and b!160970 res!76289) b!160969))

(assert (= (and b!160969 res!76293) b!160961))

(assert (= (and b!160967 condMapEmpty!5810) mapIsEmpty!5810))

(assert (= (and b!160967 (not condMapEmpty!5810)) mapNonEmpty!5810))

(assert (= (and mapNonEmpty!5810 ((_ is ValueCellFull!1364) mapValue!5810)) b!160964))

(assert (= (and b!160967 ((_ is ValueCellFull!1364) mapDefault!5810)) b!160962))

(assert (= b!160968 b!160967))

(assert (= start!16156 b!160968))

(declare-fun m!192779 () Bool)

(assert (=> b!160969 m!192779))

(declare-fun m!192781 () Bool)

(assert (=> b!160961 m!192781))

(declare-fun m!192783 () Bool)

(assert (=> b!160966 m!192783))

(assert (=> b!160966 m!192783))

(declare-fun m!192785 () Bool)

(assert (=> b!160966 m!192785))

(declare-fun m!192787 () Bool)

(assert (=> b!160971 m!192787))

(declare-fun m!192789 () Bool)

(assert (=> b!160965 m!192789))

(declare-fun m!192791 () Bool)

(assert (=> mapNonEmpty!5810 m!192791))

(declare-fun m!192793 () Bool)

(assert (=> start!16156 m!192793))

(declare-fun m!192795 () Bool)

(assert (=> b!160968 m!192795))

(declare-fun m!192797 () Bool)

(assert (=> b!160968 m!192797))

(check-sat (not b!160961) b_and!10041 (not b!160969) (not b!160968) (not b!160971) (not mapNonEmpty!5810) (not start!16156) (not b!160966) (not b_next!3613) (not b!160965) tp_is_empty!3415)
(check-sat b_and!10041 (not b_next!3613))
