; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21710 () Bool)

(assert start!21710)

(declare-fun b!218191 () Bool)

(declare-fun b_free!5859 () Bool)

(declare-fun b_next!5859 () Bool)

(assert (=> b!218191 (= b_free!5859 (not b_next!5859))))

(declare-fun tp!20712 () Bool)

(declare-fun b_and!12749 () Bool)

(assert (=> b!218191 (= tp!20712 b_and!12749)))

(declare-fun b!218185 () Bool)

(declare-fun res!106950 () Bool)

(declare-fun e!141933 () Bool)

(assert (=> b!218185 (=> (not res!106950) (not e!141933))))

(declare-datatypes ((V!7275 0))(
  ( (V!7276 (val!2905 Int)) )
))
(declare-datatypes ((ValueCell!2517 0))(
  ( (ValueCellFull!2517 (v!4923 V!7275)) (EmptyCell!2517) )
))
(declare-datatypes ((array!10681 0))(
  ( (array!10682 (arr!5062 (Array (_ BitVec 32) ValueCell!2517)) (size!5394 (_ BitVec 32))) )
))
(declare-datatypes ((array!10683 0))(
  ( (array!10684 (arr!5063 (Array (_ BitVec 32) (_ BitVec 64))) (size!5395 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2934 0))(
  ( (LongMapFixedSize!2935 (defaultEntry!4117 Int) (mask!9888 (_ BitVec 32)) (extraKeys!3854 (_ BitVec 32)) (zeroValue!3958 V!7275) (minValue!3958 V!7275) (_size!1516 (_ BitVec 32)) (_keys!6166 array!10683) (_values!4100 array!10681) (_vacant!1516 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2934)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218185 (= res!106950 (validMask!0 (mask!9888 thiss!1504)))))

(declare-fun b!218186 () Bool)

(declare-fun e!141932 () Bool)

(declare-fun tp_is_empty!5721 () Bool)

(assert (=> b!218186 (= e!141932 tp_is_empty!5721)))

(declare-fun b!218187 () Bool)

(declare-fun res!106949 () Bool)

(assert (=> b!218187 (=> (not res!106949) (not e!141933))))

(assert (=> b!218187 (= res!106949 (and (= (size!5394 (_values!4100 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9888 thiss!1504))) (= (size!5395 (_keys!6166 thiss!1504)) (size!5394 (_values!4100 thiss!1504))) (bvsge (mask!9888 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3854 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3854 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9744 () Bool)

(declare-fun mapRes!9744 () Bool)

(assert (=> mapIsEmpty!9744 mapRes!9744))

(declare-fun b!218189 () Bool)

(declare-fun res!106946 () Bool)

(declare-fun e!141934 () Bool)

(assert (=> b!218189 (=> (not res!106946) (not e!141934))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218189 (= res!106946 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218190 () Bool)

(assert (=> b!218190 (= e!141934 e!141933)))

(declare-fun res!106948 () Bool)

(assert (=> b!218190 (=> (not res!106948) (not e!141933))))

(declare-datatypes ((SeekEntryResult!782 0))(
  ( (MissingZero!782 (index!5298 (_ BitVec 32))) (Found!782 (index!5299 (_ BitVec 32))) (Intermediate!782 (undefined!1594 Bool) (index!5300 (_ BitVec 32)) (x!22814 (_ BitVec 32))) (Undefined!782) (MissingVacant!782 (index!5301 (_ BitVec 32))) )
))
(declare-fun lt!111482 () SeekEntryResult!782)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218190 (= res!106948 (or (= lt!111482 (MissingZero!782 index!297)) (= lt!111482 (MissingVacant!782 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10683 (_ BitVec 32)) SeekEntryResult!782)

(assert (=> b!218190 (= lt!111482 (seekEntryOrOpen!0 key!932 (_keys!6166 thiss!1504) (mask!9888 thiss!1504)))))

(declare-fun e!141930 () Bool)

(declare-fun e!141931 () Bool)

(declare-fun array_inv!3355 (array!10683) Bool)

(declare-fun array_inv!3356 (array!10681) Bool)

(assert (=> b!218191 (= e!141931 (and tp!20712 tp_is_empty!5721 (array_inv!3355 (_keys!6166 thiss!1504)) (array_inv!3356 (_values!4100 thiss!1504)) e!141930))))

(declare-fun b!218192 () Bool)

(declare-fun res!106945 () Bool)

(assert (=> b!218192 (=> (not res!106945) (not e!141933))))

(declare-datatypes ((tuple2!4316 0))(
  ( (tuple2!4317 (_1!2169 (_ BitVec 64)) (_2!2169 V!7275)) )
))
(declare-datatypes ((List!3222 0))(
  ( (Nil!3219) (Cons!3218 (h!3865 tuple2!4316) (t!8177 List!3222)) )
))
(declare-datatypes ((ListLongMap!3229 0))(
  ( (ListLongMap!3230 (toList!1630 List!3222)) )
))
(declare-fun contains!1471 (ListLongMap!3229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1158 (array!10683 array!10681 (_ BitVec 32) (_ BitVec 32) V!7275 V!7275 (_ BitVec 32) Int) ListLongMap!3229)

(assert (=> b!218192 (= res!106945 (not (contains!1471 (getCurrentListMap!1158 (_keys!6166 thiss!1504) (_values!4100 thiss!1504) (mask!9888 thiss!1504) (extraKeys!3854 thiss!1504) (zeroValue!3958 thiss!1504) (minValue!3958 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4117 thiss!1504)) key!932)))))

(declare-fun b!218193 () Bool)

(assert (=> b!218193 (= e!141933 false)))

(declare-fun lt!111483 () Bool)

(declare-datatypes ((List!3223 0))(
  ( (Nil!3220) (Cons!3219 (h!3866 (_ BitVec 64)) (t!8178 List!3223)) )
))
(declare-fun arrayNoDuplicates!0 (array!10683 (_ BitVec 32) List!3223) Bool)

(assert (=> b!218193 (= lt!111483 (arrayNoDuplicates!0 (_keys!6166 thiss!1504) #b00000000000000000000000000000000 Nil!3220))))

(declare-fun mapNonEmpty!9744 () Bool)

(declare-fun tp!20711 () Bool)

(assert (=> mapNonEmpty!9744 (= mapRes!9744 (and tp!20711 e!141932))))

(declare-fun mapValue!9744 () ValueCell!2517)

(declare-fun mapRest!9744 () (Array (_ BitVec 32) ValueCell!2517))

(declare-fun mapKey!9744 () (_ BitVec 32))

(assert (=> mapNonEmpty!9744 (= (arr!5062 (_values!4100 thiss!1504)) (store mapRest!9744 mapKey!9744 mapValue!9744))))

(declare-fun b!218194 () Bool)

(declare-fun e!141928 () Bool)

(assert (=> b!218194 (= e!141930 (and e!141928 mapRes!9744))))

(declare-fun condMapEmpty!9744 () Bool)

(declare-fun mapDefault!9744 () ValueCell!2517)

(assert (=> b!218194 (= condMapEmpty!9744 (= (arr!5062 (_values!4100 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2517)) mapDefault!9744)))))

(declare-fun b!218195 () Bool)

(assert (=> b!218195 (= e!141928 tp_is_empty!5721)))

(declare-fun res!106947 () Bool)

(assert (=> start!21710 (=> (not res!106947) (not e!141934))))

(declare-fun valid!1189 (LongMapFixedSize!2934) Bool)

(assert (=> start!21710 (= res!106947 (valid!1189 thiss!1504))))

(assert (=> start!21710 e!141934))

(assert (=> start!21710 e!141931))

(assert (=> start!21710 true))

(declare-fun b!218188 () Bool)

(declare-fun res!106944 () Bool)

(assert (=> b!218188 (=> (not res!106944) (not e!141933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10683 (_ BitVec 32)) Bool)

(assert (=> b!218188 (= res!106944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6166 thiss!1504) (mask!9888 thiss!1504)))))

(assert (= (and start!21710 res!106947) b!218189))

(assert (= (and b!218189 res!106946) b!218190))

(assert (= (and b!218190 res!106948) b!218192))

(assert (= (and b!218192 res!106945) b!218185))

(assert (= (and b!218185 res!106950) b!218187))

(assert (= (and b!218187 res!106949) b!218188))

(assert (= (and b!218188 res!106944) b!218193))

(assert (= (and b!218194 condMapEmpty!9744) mapIsEmpty!9744))

(assert (= (and b!218194 (not condMapEmpty!9744)) mapNonEmpty!9744))

(get-info :version)

(assert (= (and mapNonEmpty!9744 ((_ is ValueCellFull!2517) mapValue!9744)) b!218186))

(assert (= (and b!218194 ((_ is ValueCellFull!2517) mapDefault!9744)) b!218195))

(assert (= b!218191 b!218194))

(assert (= start!21710 b!218191))

(declare-fun m!244209 () Bool)

(assert (=> b!218190 m!244209))

(declare-fun m!244211 () Bool)

(assert (=> b!218191 m!244211))

(declare-fun m!244213 () Bool)

(assert (=> b!218191 m!244213))

(declare-fun m!244215 () Bool)

(assert (=> b!218193 m!244215))

(declare-fun m!244217 () Bool)

(assert (=> start!21710 m!244217))

(declare-fun m!244219 () Bool)

(assert (=> b!218188 m!244219))

(declare-fun m!244221 () Bool)

(assert (=> b!218192 m!244221))

(assert (=> b!218192 m!244221))

(declare-fun m!244223 () Bool)

(assert (=> b!218192 m!244223))

(declare-fun m!244225 () Bool)

(assert (=> mapNonEmpty!9744 m!244225))

(declare-fun m!244227 () Bool)

(assert (=> b!218185 m!244227))

(check-sat (not b!218192) b_and!12749 (not b!218190) (not b!218188) (not b!218191) (not start!21710) tp_is_empty!5721 (not b_next!5859) (not b!218193) (not b!218185) (not mapNonEmpty!9744))
(check-sat b_and!12749 (not b_next!5859))
