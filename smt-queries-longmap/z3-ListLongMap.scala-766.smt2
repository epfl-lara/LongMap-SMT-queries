; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18068 () Bool)

(assert start!18068)

(declare-fun b!179704 () Bool)

(declare-fun b_free!4435 () Bool)

(declare-fun b_next!4435 () Bool)

(assert (=> b!179704 (= b_free!4435 (not b_next!4435))))

(declare-fun tp!16036 () Bool)

(declare-fun b_and!10943 () Bool)

(assert (=> b!179704 (= tp!16036 b_and!10943)))

(declare-fun b!179696 () Bool)

(declare-fun e!118345 () Bool)

(assert (=> b!179696 (= e!118345 false)))

(declare-fun lt!88657 () Bool)

(declare-datatypes ((V!5257 0))(
  ( (V!5258 (val!2148 Int)) )
))
(declare-datatypes ((ValueCell!1760 0))(
  ( (ValueCellFull!1760 (v!4031 V!5257)) (EmptyCell!1760) )
))
(declare-datatypes ((array!7563 0))(
  ( (array!7564 (arr!3580 (Array (_ BitVec 32) (_ BitVec 64))) (size!3889 (_ BitVec 32))) )
))
(declare-datatypes ((array!7565 0))(
  ( (array!7566 (arr!3581 (Array (_ BitVec 32) ValueCell!1760)) (size!3890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2428 0))(
  ( (LongMapFixedSize!2429 (defaultEntry!3690 Int) (mask!8680 (_ BitVec 32)) (extraKeys!3427 (_ BitVec 32)) (zeroValue!3531 V!5257) (minValue!3531 V!5257) (_size!1263 (_ BitVec 32)) (_keys!5580 array!7563) (_values!3673 array!7565) (_vacant!1263 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2428)

(declare-datatypes ((List!2279 0))(
  ( (Nil!2276) (Cons!2275 (h!2900 (_ BitVec 64)) (t!7118 List!2279)) )
))
(declare-fun arrayNoDuplicates!0 (array!7563 (_ BitVec 32) List!2279) Bool)

(assert (=> b!179696 (= lt!88657 (arrayNoDuplicates!0 (_keys!5580 thiss!1248) #b00000000000000000000000000000000 Nil!2276))))

(declare-fun mapNonEmpty!7204 () Bool)

(declare-fun mapRes!7204 () Bool)

(declare-fun tp!16035 () Bool)

(declare-fun e!118349 () Bool)

(assert (=> mapNonEmpty!7204 (= mapRes!7204 (and tp!16035 e!118349))))

(declare-fun mapRest!7204 () (Array (_ BitVec 32) ValueCell!1760))

(declare-fun mapKey!7204 () (_ BitVec 32))

(declare-fun mapValue!7204 () ValueCell!1760)

(assert (=> mapNonEmpty!7204 (= (arr!3581 (_values!3673 thiss!1248)) (store mapRest!7204 mapKey!7204 mapValue!7204))))

(declare-fun b!179697 () Bool)

(declare-fun res!85098 () Bool)

(assert (=> b!179697 (=> (not res!85098) (not e!118345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179697 (= res!85098 (validMask!0 (mask!8680 thiss!1248)))))

(declare-fun b!179698 () Bool)

(declare-fun res!85097 () Bool)

(assert (=> b!179698 (=> (not res!85097) (not e!118345))))

(assert (=> b!179698 (= res!85097 (and (= (size!3890 (_values!3673 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8680 thiss!1248))) (= (size!3889 (_keys!5580 thiss!1248)) (size!3890 (_values!3673 thiss!1248))) (bvsge (mask!8680 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3427 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3427 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179699 () Bool)

(declare-fun e!118348 () Bool)

(declare-fun tp_is_empty!4207 () Bool)

(assert (=> b!179699 (= e!118348 tp_is_empty!4207)))

(declare-fun mapIsEmpty!7204 () Bool)

(assert (=> mapIsEmpty!7204 mapRes!7204))

(declare-fun b!179700 () Bool)

(declare-fun res!85100 () Bool)

(assert (=> b!179700 (=> (not res!85100) (not e!118345))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3316 0))(
  ( (tuple2!3317 (_1!1669 (_ BitVec 64)) (_2!1669 V!5257)) )
))
(declare-datatypes ((List!2280 0))(
  ( (Nil!2277) (Cons!2276 (h!2901 tuple2!3316) (t!7119 List!2280)) )
))
(declare-datatypes ((ListLongMap!2235 0))(
  ( (ListLongMap!2236 (toList!1133 List!2280)) )
))
(declare-fun contains!1214 (ListLongMap!2235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!769 (array!7563 array!7565 (_ BitVec 32) (_ BitVec 32) V!5257 V!5257 (_ BitVec 32) Int) ListLongMap!2235)

(assert (=> b!179700 (= res!85100 (not (contains!1214 (getCurrentListMap!769 (_keys!5580 thiss!1248) (_values!3673 thiss!1248) (mask!8680 thiss!1248) (extraKeys!3427 thiss!1248) (zeroValue!3531 thiss!1248) (minValue!3531 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3690 thiss!1248)) key!828)))))

(declare-fun b!179702 () Bool)

(declare-fun res!85099 () Bool)

(assert (=> b!179702 (=> (not res!85099) (not e!118345))))

(assert (=> b!179702 (= res!85099 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179703 () Bool)

(declare-fun res!85094 () Bool)

(assert (=> b!179703 (=> (not res!85094) (not e!118345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7563 (_ BitVec 32)) Bool)

(assert (=> b!179703 (= res!85094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5580 thiss!1248) (mask!8680 thiss!1248)))))

(declare-fun e!118346 () Bool)

(declare-fun e!118347 () Bool)

(declare-fun array_inv!2317 (array!7563) Bool)

(declare-fun array_inv!2318 (array!7565) Bool)

(assert (=> b!179704 (= e!118347 (and tp!16036 tp_is_empty!4207 (array_inv!2317 (_keys!5580 thiss!1248)) (array_inv!2318 (_values!3673 thiss!1248)) e!118346))))

(declare-fun b!179705 () Bool)

(assert (=> b!179705 (= e!118349 tp_is_empty!4207)))

(declare-fun b!179706 () Bool)

(assert (=> b!179706 (= e!118346 (and e!118348 mapRes!7204))))

(declare-fun condMapEmpty!7204 () Bool)

(declare-fun mapDefault!7204 () ValueCell!1760)

(assert (=> b!179706 (= condMapEmpty!7204 (= (arr!3581 (_values!3673 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1760)) mapDefault!7204)))))

(declare-fun b!179701 () Bool)

(declare-fun res!85096 () Bool)

(assert (=> b!179701 (=> (not res!85096) (not e!118345))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!595 0))(
  ( (MissingZero!595 (index!4548 (_ BitVec 32))) (Found!595 (index!4549 (_ BitVec 32))) (Intermediate!595 (undefined!1407 Bool) (index!4550 (_ BitVec 32)) (x!19668 (_ BitVec 32))) (Undefined!595) (MissingVacant!595 (index!4551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7563 (_ BitVec 32)) SeekEntryResult!595)

(assert (=> b!179701 (= res!85096 ((_ is Undefined!595) (seekEntryOrOpen!0 key!828 (_keys!5580 thiss!1248) (mask!8680 thiss!1248))))))

(declare-fun res!85095 () Bool)

(assert (=> start!18068 (=> (not res!85095) (not e!118345))))

(declare-fun valid!1029 (LongMapFixedSize!2428) Bool)

(assert (=> start!18068 (= res!85095 (valid!1029 thiss!1248))))

(assert (=> start!18068 e!118345))

(assert (=> start!18068 e!118347))

(assert (=> start!18068 true))

(assert (= (and start!18068 res!85095) b!179702))

(assert (= (and b!179702 res!85099) b!179701))

(assert (= (and b!179701 res!85096) b!179700))

(assert (= (and b!179700 res!85100) b!179697))

(assert (= (and b!179697 res!85098) b!179698))

(assert (= (and b!179698 res!85097) b!179703))

(assert (= (and b!179703 res!85094) b!179696))

(assert (= (and b!179706 condMapEmpty!7204) mapIsEmpty!7204))

(assert (= (and b!179706 (not condMapEmpty!7204)) mapNonEmpty!7204))

(assert (= (and mapNonEmpty!7204 ((_ is ValueCellFull!1760) mapValue!7204)) b!179705))

(assert (= (and b!179706 ((_ is ValueCellFull!1760) mapDefault!7204)) b!179699))

(assert (= b!179704 b!179706))

(assert (= start!18068 b!179704))

(declare-fun m!207345 () Bool)

(assert (=> b!179701 m!207345))

(declare-fun m!207347 () Bool)

(assert (=> b!179700 m!207347))

(assert (=> b!179700 m!207347))

(declare-fun m!207349 () Bool)

(assert (=> b!179700 m!207349))

(declare-fun m!207351 () Bool)

(assert (=> b!179704 m!207351))

(declare-fun m!207353 () Bool)

(assert (=> b!179704 m!207353))

(declare-fun m!207355 () Bool)

(assert (=> start!18068 m!207355))

(declare-fun m!207357 () Bool)

(assert (=> b!179703 m!207357))

(declare-fun m!207359 () Bool)

(assert (=> b!179697 m!207359))

(declare-fun m!207361 () Bool)

(assert (=> b!179696 m!207361))

(declare-fun m!207363 () Bool)

(assert (=> mapNonEmpty!7204 m!207363))

(check-sat (not b_next!4435) (not b!179700) (not b!179703) (not mapNonEmpty!7204) (not start!18068) (not b!179696) (not b!179701) b_and!10943 (not b!179704) tp_is_empty!4207 (not b!179697))
(check-sat b_and!10943 (not b_next!4435))
