; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16580 () Bool)

(assert start!16580)

(declare-fun b!165248 () Bool)

(declare-fun b_free!3885 () Bool)

(declare-fun b_next!3885 () Bool)

(assert (=> b!165248 (= b_free!3885 (not b_next!3885))))

(declare-fun tp!14255 () Bool)

(declare-fun b_and!10299 () Bool)

(assert (=> b!165248 (= tp!14255 b_and!10299)))

(declare-fun b!165239 () Bool)

(declare-fun e!108397 () Bool)

(declare-fun e!108399 () Bool)

(assert (=> b!165239 (= e!108397 e!108399)))

(declare-fun res!78364 () Bool)

(assert (=> b!165239 (=> (not res!78364) (not e!108399))))

(declare-datatypes ((SeekEntryResult!431 0))(
  ( (MissingZero!431 (index!3892 (_ BitVec 32))) (Found!431 (index!3893 (_ BitVec 32))) (Intermediate!431 (undefined!1243 Bool) (index!3894 (_ BitVec 32)) (x!18315 (_ BitVec 32))) (Undefined!431) (MissingVacant!431 (index!3895 (_ BitVec 32))) )
))
(declare-fun lt!83034 () SeekEntryResult!431)

(get-info :version)

(assert (=> b!165239 (= res!78364 (and (not ((_ is Undefined!431) lt!83034)) (not ((_ is MissingVacant!431) lt!83034)) (not ((_ is MissingZero!431) lt!83034)) ((_ is Found!431) lt!83034)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4563 0))(
  ( (V!4564 (val!1888 Int)) )
))
(declare-datatypes ((ValueCell!1500 0))(
  ( (ValueCellFull!1500 (v!3753 V!4563)) (EmptyCell!1500) )
))
(declare-datatypes ((array!6471 0))(
  ( (array!6472 (arr!3071 (Array (_ BitVec 32) (_ BitVec 64))) (size!3359 (_ BitVec 32))) )
))
(declare-datatypes ((array!6473 0))(
  ( (array!6474 (arr!3072 (Array (_ BitVec 32) ValueCell!1500)) (size!3360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1908 0))(
  ( (LongMapFixedSize!1909 (defaultEntry!3396 Int) (mask!8103 (_ BitVec 32)) (extraKeys!3137 (_ BitVec 32)) (zeroValue!3239 V!4563) (minValue!3239 V!4563) (_size!1003 (_ BitVec 32)) (_keys!5221 array!6471) (_values!3379 array!6473) (_vacant!1003 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1908)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6471 (_ BitVec 32)) SeekEntryResult!431)

(assert (=> b!165239 (= lt!83034 (seekEntryOrOpen!0 key!828 (_keys!5221 thiss!1248) (mask!8103 thiss!1248)))))

(declare-fun b!165240 () Bool)

(declare-fun e!108401 () Bool)

(declare-fun tp_is_empty!3687 () Bool)

(assert (=> b!165240 (= e!108401 tp_is_empty!3687)))

(declare-fun b!165241 () Bool)

(declare-fun res!78363 () Bool)

(assert (=> b!165241 (=> (not res!78363) (not e!108399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6471 (_ BitVec 32)) Bool)

(assert (=> b!165241 (= res!78363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5221 thiss!1248) (mask!8103 thiss!1248)))))

(declare-fun b!165242 () Bool)

(declare-fun res!78366 () Bool)

(assert (=> b!165242 (=> (not res!78366) (not e!108399))))

(assert (=> b!165242 (= res!78366 (and (= (size!3360 (_values!3379 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8103 thiss!1248))) (= (size!3359 (_keys!5221 thiss!1248)) (size!3360 (_values!3379 thiss!1248))) (bvsge (mask!8103 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3137 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3137 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165243 () Bool)

(declare-fun res!78365 () Bool)

(assert (=> b!165243 (=> (not res!78365) (not e!108397))))

(assert (=> b!165243 (= res!78365 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78369 () Bool)

(assert (=> start!16580 (=> (not res!78369) (not e!108397))))

(declare-fun valid!844 (LongMapFixedSize!1908) Bool)

(assert (=> start!16580 (= res!78369 (valid!844 thiss!1248))))

(assert (=> start!16580 e!108397))

(declare-fun e!108396 () Bool)

(assert (=> start!16580 e!108396))

(assert (=> start!16580 true))

(declare-fun b!165244 () Bool)

(declare-fun e!108400 () Bool)

(assert (=> b!165244 (= e!108400 tp_is_empty!3687)))

(declare-fun b!165245 () Bool)

(declare-fun res!78367 () Bool)

(assert (=> b!165245 (=> (not res!78367) (not e!108399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165245 (= res!78367 (validMask!0 (mask!8103 thiss!1248)))))

(declare-fun b!165246 () Bool)

(assert (=> b!165246 (= e!108399 false)))

(declare-fun lt!83035 () Bool)

(declare-datatypes ((List!2041 0))(
  ( (Nil!2038) (Cons!2037 (h!2654 (_ BitVec 64)) (t!6843 List!2041)) )
))
(declare-fun arrayNoDuplicates!0 (array!6471 (_ BitVec 32) List!2041) Bool)

(assert (=> b!165246 (= lt!83035 (arrayNoDuplicates!0 (_keys!5221 thiss!1248) #b00000000000000000000000000000000 Nil!2038))))

(declare-fun b!165247 () Bool)

(declare-fun e!108395 () Bool)

(declare-fun mapRes!6249 () Bool)

(assert (=> b!165247 (= e!108395 (and e!108400 mapRes!6249))))

(declare-fun condMapEmpty!6249 () Bool)

(declare-fun mapDefault!6249 () ValueCell!1500)

(assert (=> b!165247 (= condMapEmpty!6249 (= (arr!3072 (_values!3379 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1500)) mapDefault!6249)))))

(declare-fun array_inv!1971 (array!6471) Bool)

(declare-fun array_inv!1972 (array!6473) Bool)

(assert (=> b!165248 (= e!108396 (and tp!14255 tp_is_empty!3687 (array_inv!1971 (_keys!5221 thiss!1248)) (array_inv!1972 (_values!3379 thiss!1248)) e!108395))))

(declare-fun mapNonEmpty!6249 () Bool)

(declare-fun tp!14256 () Bool)

(assert (=> mapNonEmpty!6249 (= mapRes!6249 (and tp!14256 e!108401))))

(declare-fun mapKey!6249 () (_ BitVec 32))

(declare-fun mapValue!6249 () ValueCell!1500)

(declare-fun mapRest!6249 () (Array (_ BitVec 32) ValueCell!1500))

(assert (=> mapNonEmpty!6249 (= (arr!3072 (_values!3379 thiss!1248)) (store mapRest!6249 mapKey!6249 mapValue!6249))))

(declare-fun b!165249 () Bool)

(declare-fun res!78368 () Bool)

(assert (=> b!165249 (=> (not res!78368) (not e!108399))))

(declare-datatypes ((tuple2!3058 0))(
  ( (tuple2!3059 (_1!1540 (_ BitVec 64)) (_2!1540 V!4563)) )
))
(declare-datatypes ((List!2042 0))(
  ( (Nil!2039) (Cons!2038 (h!2655 tuple2!3058) (t!6844 List!2042)) )
))
(declare-datatypes ((ListLongMap!2013 0))(
  ( (ListLongMap!2014 (toList!1022 List!2042)) )
))
(declare-fun contains!1064 (ListLongMap!2013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!680 (array!6471 array!6473 (_ BitVec 32) (_ BitVec 32) V!4563 V!4563 (_ BitVec 32) Int) ListLongMap!2013)

(assert (=> b!165249 (= res!78368 (not (contains!1064 (getCurrentListMap!680 (_keys!5221 thiss!1248) (_values!3379 thiss!1248) (mask!8103 thiss!1248) (extraKeys!3137 thiss!1248) (zeroValue!3239 thiss!1248) (minValue!3239 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3396 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6249 () Bool)

(assert (=> mapIsEmpty!6249 mapRes!6249))

(assert (= (and start!16580 res!78369) b!165243))

(assert (= (and b!165243 res!78365) b!165239))

(assert (= (and b!165239 res!78364) b!165249))

(assert (= (and b!165249 res!78368) b!165245))

(assert (= (and b!165245 res!78367) b!165242))

(assert (= (and b!165242 res!78366) b!165241))

(assert (= (and b!165241 res!78363) b!165246))

(assert (= (and b!165247 condMapEmpty!6249) mapIsEmpty!6249))

(assert (= (and b!165247 (not condMapEmpty!6249)) mapNonEmpty!6249))

(assert (= (and mapNonEmpty!6249 ((_ is ValueCellFull!1500) mapValue!6249)) b!165240))

(assert (= (and b!165247 ((_ is ValueCellFull!1500) mapDefault!6249)) b!165244))

(assert (= b!165248 b!165247))

(assert (= start!16580 b!165248))

(declare-fun m!195131 () Bool)

(assert (=> b!165239 m!195131))

(declare-fun m!195133 () Bool)

(assert (=> b!165241 m!195133))

(declare-fun m!195135 () Bool)

(assert (=> b!165245 m!195135))

(declare-fun m!195137 () Bool)

(assert (=> start!16580 m!195137))

(declare-fun m!195139 () Bool)

(assert (=> b!165249 m!195139))

(assert (=> b!165249 m!195139))

(declare-fun m!195141 () Bool)

(assert (=> b!165249 m!195141))

(declare-fun m!195143 () Bool)

(assert (=> b!165248 m!195143))

(declare-fun m!195145 () Bool)

(assert (=> b!165248 m!195145))

(declare-fun m!195147 () Bool)

(assert (=> mapNonEmpty!6249 m!195147))

(declare-fun m!195149 () Bool)

(assert (=> b!165246 m!195149))

(check-sat (not b!165249) (not b_next!3885) (not b!165241) (not b!165239) tp_is_empty!3687 (not b!165246) b_and!10299 (not b!165248) (not b!165245) (not mapNonEmpty!6249) (not start!16580))
(check-sat b_and!10299 (not b_next!3885))
