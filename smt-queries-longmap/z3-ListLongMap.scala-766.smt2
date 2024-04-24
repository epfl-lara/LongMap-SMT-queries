; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18068 () Bool)

(assert start!18068)

(declare-fun b!179899 () Bool)

(declare-fun b_free!4435 () Bool)

(declare-fun b_next!4435 () Bool)

(assert (=> b!179899 (= b_free!4435 (not b_next!4435))))

(declare-fun tp!16036 () Bool)

(declare-fun b_and!10983 () Bool)

(assert (=> b!179899 (= tp!16036 b_and!10983)))

(declare-fun b!179890 () Bool)

(declare-fun e!118471 () Bool)

(declare-fun tp_is_empty!4207 () Bool)

(assert (=> b!179890 (= e!118471 tp_is_empty!4207)))

(declare-fun b!179891 () Bool)

(declare-fun res!85212 () Bool)

(declare-fun e!118469 () Bool)

(assert (=> b!179891 (=> (not res!85212) (not e!118469))))

(declare-datatypes ((V!5257 0))(
  ( (V!5258 (val!2148 Int)) )
))
(declare-datatypes ((ValueCell!1760 0))(
  ( (ValueCellFull!1760 (v!4038 V!5257)) (EmptyCell!1760) )
))
(declare-datatypes ((array!7569 0))(
  ( (array!7570 (arr!3584 (Array (_ BitVec 32) (_ BitVec 64))) (size!3892 (_ BitVec 32))) )
))
(declare-datatypes ((array!7571 0))(
  ( (array!7572 (arr!3585 (Array (_ BitVec 32) ValueCell!1760)) (size!3893 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2428 0))(
  ( (LongMapFixedSize!2429 (defaultEntry!3690 Int) (mask!8681 (_ BitVec 32)) (extraKeys!3427 (_ BitVec 32)) (zeroValue!3531 V!5257) (minValue!3531 V!5257) (_size!1263 (_ BitVec 32)) (_keys!5581 array!7569) (_values!3673 array!7571) (_vacant!1263 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2428)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179891 (= res!85212 (validMask!0 (mask!8681 thiss!1248)))))

(declare-fun b!179892 () Bool)

(assert (=> b!179892 (= e!118469 false)))

(declare-fun lt!88897 () Bool)

(declare-datatypes ((List!2253 0))(
  ( (Nil!2250) (Cons!2249 (h!2874 (_ BitVec 64)) (t!7093 List!2253)) )
))
(declare-fun arrayNoDuplicates!0 (array!7569 (_ BitVec 32) List!2253) Bool)

(assert (=> b!179892 (= lt!88897 (arrayNoDuplicates!0 (_keys!5581 thiss!1248) #b00000000000000000000000000000000 Nil!2250))))

(declare-fun b!179893 () Bool)

(declare-fun res!85213 () Bool)

(assert (=> b!179893 (=> (not res!85213) (not e!118469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7569 (_ BitVec 32)) Bool)

(assert (=> b!179893 (= res!85213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5581 thiss!1248) (mask!8681 thiss!1248)))))

(declare-fun mapIsEmpty!7204 () Bool)

(declare-fun mapRes!7204 () Bool)

(assert (=> mapIsEmpty!7204 mapRes!7204))

(declare-fun b!179894 () Bool)

(declare-fun res!85214 () Bool)

(assert (=> b!179894 (=> (not res!85214) (not e!118469))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3290 0))(
  ( (tuple2!3291 (_1!1656 (_ BitVec 64)) (_2!1656 V!5257)) )
))
(declare-datatypes ((List!2254 0))(
  ( (Nil!2251) (Cons!2250 (h!2875 tuple2!3290) (t!7094 List!2254)) )
))
(declare-datatypes ((ListLongMap!2223 0))(
  ( (ListLongMap!2224 (toList!1127 List!2254)) )
))
(declare-fun contains!1214 (ListLongMap!2223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!782 (array!7569 array!7571 (_ BitVec 32) (_ BitVec 32) V!5257 V!5257 (_ BitVec 32) Int) ListLongMap!2223)

(assert (=> b!179894 (= res!85214 (not (contains!1214 (getCurrentListMap!782 (_keys!5581 thiss!1248) (_values!3673 thiss!1248) (mask!8681 thiss!1248) (extraKeys!3427 thiss!1248) (zeroValue!3531 thiss!1248) (minValue!3531 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3690 thiss!1248)) key!828)))))

(declare-fun b!179895 () Bool)

(declare-fun res!85216 () Bool)

(assert (=> b!179895 (=> (not res!85216) (not e!118469))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!578 0))(
  ( (MissingZero!578 (index!4480 (_ BitVec 32))) (Found!578 (index!4481 (_ BitVec 32))) (Intermediate!578 (undefined!1390 Bool) (index!4482 (_ BitVec 32)) (x!19652 (_ BitVec 32))) (Undefined!578) (MissingVacant!578 (index!4483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7569 (_ BitVec 32)) SeekEntryResult!578)

(assert (=> b!179895 (= res!85216 ((_ is Undefined!578) (seekEntryOrOpen!0 key!828 (_keys!5581 thiss!1248) (mask!8681 thiss!1248))))))

(declare-fun res!85215 () Bool)

(assert (=> start!18068 (=> (not res!85215) (not e!118469))))

(declare-fun valid!1035 (LongMapFixedSize!2428) Bool)

(assert (=> start!18068 (= res!85215 (valid!1035 thiss!1248))))

(assert (=> start!18068 e!118469))

(declare-fun e!118474 () Bool)

(assert (=> start!18068 e!118474))

(assert (=> start!18068 true))

(declare-fun b!179896 () Bool)

(declare-fun res!85210 () Bool)

(assert (=> b!179896 (=> (not res!85210) (not e!118469))))

(assert (=> b!179896 (= res!85210 (and (= (size!3893 (_values!3673 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8681 thiss!1248))) (= (size!3892 (_keys!5581 thiss!1248)) (size!3893 (_values!3673 thiss!1248))) (bvsge (mask!8681 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3427 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3427 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179897 () Bool)

(declare-fun e!118470 () Bool)

(assert (=> b!179897 (= e!118470 tp_is_empty!4207)))

(declare-fun b!179898 () Bool)

(declare-fun res!85211 () Bool)

(assert (=> b!179898 (=> (not res!85211) (not e!118469))))

(assert (=> b!179898 (= res!85211 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7204 () Bool)

(declare-fun tp!16035 () Bool)

(assert (=> mapNonEmpty!7204 (= mapRes!7204 (and tp!16035 e!118470))))

(declare-fun mapRest!7204 () (Array (_ BitVec 32) ValueCell!1760))

(declare-fun mapValue!7204 () ValueCell!1760)

(declare-fun mapKey!7204 () (_ BitVec 32))

(assert (=> mapNonEmpty!7204 (= (arr!3585 (_values!3673 thiss!1248)) (store mapRest!7204 mapKey!7204 mapValue!7204))))

(declare-fun e!118472 () Bool)

(declare-fun array_inv!2313 (array!7569) Bool)

(declare-fun array_inv!2314 (array!7571) Bool)

(assert (=> b!179899 (= e!118474 (and tp!16036 tp_is_empty!4207 (array_inv!2313 (_keys!5581 thiss!1248)) (array_inv!2314 (_values!3673 thiss!1248)) e!118472))))

(declare-fun b!179900 () Bool)

(assert (=> b!179900 (= e!118472 (and e!118471 mapRes!7204))))

(declare-fun condMapEmpty!7204 () Bool)

(declare-fun mapDefault!7204 () ValueCell!1760)

(assert (=> b!179900 (= condMapEmpty!7204 (= (arr!3585 (_values!3673 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1760)) mapDefault!7204)))))

(assert (= (and start!18068 res!85215) b!179898))

(assert (= (and b!179898 res!85211) b!179895))

(assert (= (and b!179895 res!85216) b!179894))

(assert (= (and b!179894 res!85214) b!179891))

(assert (= (and b!179891 res!85212) b!179896))

(assert (= (and b!179896 res!85210) b!179893))

(assert (= (and b!179893 res!85213) b!179892))

(assert (= (and b!179900 condMapEmpty!7204) mapIsEmpty!7204))

(assert (= (and b!179900 (not condMapEmpty!7204)) mapNonEmpty!7204))

(assert (= (and mapNonEmpty!7204 ((_ is ValueCellFull!1760) mapValue!7204)) b!179897))

(assert (= (and b!179900 ((_ is ValueCellFull!1760) mapDefault!7204)) b!179890))

(assert (= b!179899 b!179900))

(assert (= start!18068 b!179899))

(declare-fun m!208147 () Bool)

(assert (=> b!179893 m!208147))

(declare-fun m!208149 () Bool)

(assert (=> start!18068 m!208149))

(declare-fun m!208151 () Bool)

(assert (=> b!179895 m!208151))

(declare-fun m!208153 () Bool)

(assert (=> b!179891 m!208153))

(declare-fun m!208155 () Bool)

(assert (=> b!179894 m!208155))

(assert (=> b!179894 m!208155))

(declare-fun m!208157 () Bool)

(assert (=> b!179894 m!208157))

(declare-fun m!208159 () Bool)

(assert (=> b!179892 m!208159))

(declare-fun m!208161 () Bool)

(assert (=> mapNonEmpty!7204 m!208161))

(declare-fun m!208163 () Bool)

(assert (=> b!179899 m!208163))

(declare-fun m!208165 () Bool)

(assert (=> b!179899 m!208165))

(check-sat tp_is_empty!4207 (not b!179895) (not b!179893) (not b!179899) (not mapNonEmpty!7204) (not b!179892) (not b_next!4435) (not b!179891) b_and!10983 (not b!179894) (not start!18068))
(check-sat b_and!10983 (not b_next!4435))
