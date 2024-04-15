; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16168 () Bool)

(assert start!16168)

(declare-fun b!160969 () Bool)

(declare-fun b_free!3625 () Bool)

(declare-fun b_next!3625 () Bool)

(assert (=> b!160969 (= b_free!3625 (not b_next!3625))))

(declare-fun tp!13445 () Bool)

(declare-fun b_and!10013 () Bool)

(assert (=> b!160969 (= tp!13445 b_and!10013)))

(declare-fun b!160965 () Bool)

(declare-fun res!76305 () Bool)

(declare-fun e!105175 () Bool)

(assert (=> b!160965 (=> (not res!76305) (not e!105175))))

(declare-datatypes ((V!4217 0))(
  ( (V!4218 (val!1758 Int)) )
))
(declare-datatypes ((ValueCell!1370 0))(
  ( (ValueCellFull!1370 (v!3617 V!4217)) (EmptyCell!1370) )
))
(declare-datatypes ((array!5913 0))(
  ( (array!5914 (arr!2800 (Array (_ BitVec 32) (_ BitVec 64))) (size!3085 (_ BitVec 32))) )
))
(declare-datatypes ((array!5915 0))(
  ( (array!5916 (arr!2801 (Array (_ BitVec 32) ValueCell!1370)) (size!3086 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1648 0))(
  ( (LongMapFixedSize!1649 (defaultEntry!3266 Int) (mask!7849 (_ BitVec 32)) (extraKeys!3007 (_ BitVec 32)) (zeroValue!3109 V!4217) (minValue!3109 V!4217) (_size!873 (_ BitVec 32)) (_keys!5066 array!5913) (_values!3249 array!5915) (_vacant!873 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1648)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2918 0))(
  ( (tuple2!2919 (_1!1470 (_ BitVec 64)) (_2!1470 V!4217)) )
))
(declare-datatypes ((List!1969 0))(
  ( (Nil!1966) (Cons!1965 (h!2578 tuple2!2918) (t!6762 List!1969)) )
))
(declare-datatypes ((ListLongMap!1905 0))(
  ( (ListLongMap!1906 (toList!968 List!1969)) )
))
(declare-fun contains!1007 (ListLongMap!1905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!618 (array!5913 array!5915 (_ BitVec 32) (_ BitVec 32) V!4217 V!4217 (_ BitVec 32) Int) ListLongMap!1905)

(assert (=> b!160965 (= res!76305 (not (contains!1007 (getCurrentListMap!618 (_keys!5066 thiss!1248) (_values!3249 thiss!1248) (mask!7849 thiss!1248) (extraKeys!3007 thiss!1248) (zeroValue!3109 thiss!1248) (minValue!3109 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3266 thiss!1248)) key!828)))))

(declare-fun b!160966 () Bool)

(declare-fun e!105172 () Bool)

(declare-fun e!105170 () Bool)

(declare-fun mapRes!5828 () Bool)

(assert (=> b!160966 (= e!105172 (and e!105170 mapRes!5828))))

(declare-fun condMapEmpty!5828 () Bool)

(declare-fun mapDefault!5828 () ValueCell!1370)

(assert (=> b!160966 (= condMapEmpty!5828 (= (arr!2801 (_values!3249 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1370)) mapDefault!5828)))))

(declare-fun mapNonEmpty!5828 () Bool)

(declare-fun tp!13444 () Bool)

(declare-fun e!105173 () Bool)

(assert (=> mapNonEmpty!5828 (= mapRes!5828 (and tp!13444 e!105173))))

(declare-fun mapRest!5828 () (Array (_ BitVec 32) ValueCell!1370))

(declare-fun mapValue!5828 () ValueCell!1370)

(declare-fun mapKey!5828 () (_ BitVec 32))

(assert (=> mapNonEmpty!5828 (= (arr!2801 (_values!3249 thiss!1248)) (store mapRest!5828 mapKey!5828 mapValue!5828))))

(declare-fun b!160967 () Bool)

(assert (=> b!160967 (= e!105175 false)))

(declare-fun lt!81969 () Bool)

(declare-datatypes ((List!1970 0))(
  ( (Nil!1967) (Cons!1966 (h!2579 (_ BitVec 64)) (t!6763 List!1970)) )
))
(declare-fun arrayNoDuplicates!0 (array!5913 (_ BitVec 32) List!1970) Bool)

(assert (=> b!160967 (= lt!81969 (arrayNoDuplicates!0 (_keys!5066 thiss!1248) #b00000000000000000000000000000000 Nil!1967))))

(declare-fun b!160968 () Bool)

(declare-fun res!76302 () Bool)

(assert (=> b!160968 (=> (not res!76302) (not e!105175))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!351 0))(
  ( (MissingZero!351 (index!3572 (_ BitVec 32))) (Found!351 (index!3573 (_ BitVec 32))) (Intermediate!351 (undefined!1163 Bool) (index!3574 (_ BitVec 32)) (x!17782 (_ BitVec 32))) (Undefined!351) (MissingVacant!351 (index!3575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5913 (_ BitVec 32)) SeekEntryResult!351)

(assert (=> b!160968 (= res!76302 ((_ is Undefined!351) (seekEntryOrOpen!0 key!828 (_keys!5066 thiss!1248) (mask!7849 thiss!1248))))))

(declare-fun e!105171 () Bool)

(declare-fun tp_is_empty!3427 () Bool)

(declare-fun array_inv!1799 (array!5913) Bool)

(declare-fun array_inv!1800 (array!5915) Bool)

(assert (=> b!160969 (= e!105171 (and tp!13445 tp_is_empty!3427 (array_inv!1799 (_keys!5066 thiss!1248)) (array_inv!1800 (_values!3249 thiss!1248)) e!105172))))

(declare-fun b!160970 () Bool)

(declare-fun res!76300 () Bool)

(assert (=> b!160970 (=> (not res!76300) (not e!105175))))

(assert (=> b!160970 (= res!76300 (and (= (size!3086 (_values!3249 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7849 thiss!1248))) (= (size!3085 (_keys!5066 thiss!1248)) (size!3086 (_values!3249 thiss!1248))) (bvsge (mask!7849 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3007 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3007 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160971 () Bool)

(declare-fun res!76299 () Bool)

(assert (=> b!160971 (=> (not res!76299) (not e!105175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160971 (= res!76299 (validMask!0 (mask!7849 thiss!1248)))))

(declare-fun res!76303 () Bool)

(assert (=> start!16168 (=> (not res!76303) (not e!105175))))

(declare-fun valid!759 (LongMapFixedSize!1648) Bool)

(assert (=> start!16168 (= res!76303 (valid!759 thiss!1248))))

(assert (=> start!16168 e!105175))

(assert (=> start!16168 e!105171))

(assert (=> start!16168 true))

(declare-fun mapIsEmpty!5828 () Bool)

(assert (=> mapIsEmpty!5828 mapRes!5828))

(declare-fun b!160972 () Bool)

(declare-fun res!76304 () Bool)

(assert (=> b!160972 (=> (not res!76304) (not e!105175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5913 (_ BitVec 32)) Bool)

(assert (=> b!160972 (= res!76304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5066 thiss!1248) (mask!7849 thiss!1248)))))

(declare-fun b!160973 () Bool)

(assert (=> b!160973 (= e!105170 tp_is_empty!3427)))

(declare-fun b!160974 () Bool)

(declare-fun res!76301 () Bool)

(assert (=> b!160974 (=> (not res!76301) (not e!105175))))

(assert (=> b!160974 (= res!76301 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160975 () Bool)

(assert (=> b!160975 (= e!105173 tp_is_empty!3427)))

(assert (= (and start!16168 res!76303) b!160974))

(assert (= (and b!160974 res!76301) b!160968))

(assert (= (and b!160968 res!76302) b!160965))

(assert (= (and b!160965 res!76305) b!160971))

(assert (= (and b!160971 res!76299) b!160970))

(assert (= (and b!160970 res!76300) b!160972))

(assert (= (and b!160972 res!76304) b!160967))

(assert (= (and b!160966 condMapEmpty!5828) mapIsEmpty!5828))

(assert (= (and b!160966 (not condMapEmpty!5828)) mapNonEmpty!5828))

(assert (= (and mapNonEmpty!5828 ((_ is ValueCellFull!1370) mapValue!5828)) b!160975))

(assert (= (and b!160966 ((_ is ValueCellFull!1370) mapDefault!5828)) b!160973))

(assert (= b!160969 b!160966))

(assert (= start!16168 b!160969))

(declare-fun m!192097 () Bool)

(assert (=> b!160971 m!192097))

(declare-fun m!192099 () Bool)

(assert (=> b!160972 m!192099))

(declare-fun m!192101 () Bool)

(assert (=> b!160968 m!192101))

(declare-fun m!192103 () Bool)

(assert (=> b!160969 m!192103))

(declare-fun m!192105 () Bool)

(assert (=> b!160969 m!192105))

(declare-fun m!192107 () Bool)

(assert (=> mapNonEmpty!5828 m!192107))

(declare-fun m!192109 () Bool)

(assert (=> b!160965 m!192109))

(assert (=> b!160965 m!192109))

(declare-fun m!192111 () Bool)

(assert (=> b!160965 m!192111))

(declare-fun m!192113 () Bool)

(assert (=> start!16168 m!192113))

(declare-fun m!192115 () Bool)

(assert (=> b!160967 m!192115))

(check-sat (not start!16168) (not b_next!3625) tp_is_empty!3427 (not b!160969) (not mapNonEmpty!5828) (not b!160965) (not b!160972) (not b!160971) b_and!10013 (not b!160968) (not b!160967))
(check-sat b_and!10013 (not b_next!3625))
