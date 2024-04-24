; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18074 () Bool)

(assert start!18074)

(declare-fun b!179991 () Bool)

(declare-fun b_free!4441 () Bool)

(declare-fun b_next!4441 () Bool)

(assert (=> b!179991 (= b_free!4441 (not b_next!4441))))

(declare-fun tp!16053 () Bool)

(declare-fun b_and!10989 () Bool)

(assert (=> b!179991 (= tp!16053 b_and!10989)))

(declare-fun b!179985 () Bool)

(declare-datatypes ((Unit!5471 0))(
  ( (Unit!5472) )
))
(declare-fun e!118530 () Unit!5471)

(declare-fun Unit!5473 () Unit!5471)

(assert (=> b!179985 (= e!118530 Unit!5473)))

(declare-fun lt!88910 () Unit!5471)

(declare-datatypes ((V!5265 0))(
  ( (V!5266 (val!2151 Int)) )
))
(declare-datatypes ((ValueCell!1763 0))(
  ( (ValueCellFull!1763 (v!4041 V!5265)) (EmptyCell!1763) )
))
(declare-datatypes ((array!7581 0))(
  ( (array!7582 (arr!3590 (Array (_ BitVec 32) (_ BitVec 64))) (size!3898 (_ BitVec 32))) )
))
(declare-datatypes ((array!7583 0))(
  ( (array!7584 (arr!3591 (Array (_ BitVec 32) ValueCell!1763)) (size!3899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2434 0))(
  ( (LongMapFixedSize!2435 (defaultEntry!3693 Int) (mask!8686 (_ BitVec 32)) (extraKeys!3430 (_ BitVec 32)) (zeroValue!3534 V!5265) (minValue!3534 V!5265) (_size!1266 (_ BitVec 32)) (_keys!5584 array!7581) (_values!3676 array!7583) (_vacant!1266 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2434)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (array!7581 array!7583 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5471)

(assert (=> b!179985 (= lt!88910 (lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(assert (=> b!179985 false))

(declare-fun b!179986 () Bool)

(declare-fun e!118528 () Bool)

(declare-fun e!118529 () Bool)

(declare-fun mapRes!7213 () Bool)

(assert (=> b!179986 (= e!118528 (and e!118529 mapRes!7213))))

(declare-fun condMapEmpty!7213 () Bool)

(declare-fun mapDefault!7213 () ValueCell!1763)

(assert (=> b!179986 (= condMapEmpty!7213 (= (arr!3591 (_values!3676 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1763)) mapDefault!7213)))))

(declare-fun b!179987 () Bool)

(declare-fun tp_is_empty!4213 () Bool)

(assert (=> b!179987 (= e!118529 tp_is_empty!4213)))

(declare-fun mapIsEmpty!7213 () Bool)

(assert (=> mapIsEmpty!7213 mapRes!7213))

(declare-fun mapNonEmpty!7213 () Bool)

(declare-fun tp!16054 () Bool)

(declare-fun e!118527 () Bool)

(assert (=> mapNonEmpty!7213 (= mapRes!7213 (and tp!16054 e!118527))))

(declare-fun mapKey!7213 () (_ BitVec 32))

(declare-fun mapValue!7213 () ValueCell!1763)

(declare-fun mapRest!7213 () (Array (_ BitVec 32) ValueCell!1763))

(assert (=> mapNonEmpty!7213 (= (arr!3591 (_values!3676 thiss!1248)) (store mapRest!7213 mapKey!7213 mapValue!7213))))

(declare-fun b!179988 () Bool)

(declare-fun res!85265 () Bool)

(declare-fun e!118525 () Bool)

(assert (=> b!179988 (=> (not res!85265) (not e!118525))))

(assert (=> b!179988 (= res!85265 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179989 () Bool)

(assert (=> b!179989 (= e!118527 tp_is_empty!4213)))

(declare-fun b!179990 () Bool)

(assert (=> b!179990 (= e!118525 false)))

(declare-datatypes ((tuple2!3294 0))(
  ( (tuple2!3295 (_1!1658 (_ BitVec 64)) (_2!1658 V!5265)) )
))
(declare-datatypes ((List!2257 0))(
  ( (Nil!2254) (Cons!2253 (h!2878 tuple2!3294) (t!7097 List!2257)) )
))
(declare-datatypes ((ListLongMap!2227 0))(
  ( (ListLongMap!2228 (toList!1129 List!2257)) )
))
(declare-fun lt!88911 () ListLongMap!2227)

(declare-fun map!1920 (LongMapFixedSize!2434) ListLongMap!2227)

(assert (=> b!179990 (= lt!88911 (map!1920 thiss!1248))))

(declare-fun lt!88912 () Unit!5471)

(assert (=> b!179990 (= lt!88912 e!118530)))

(declare-fun c!32253 () Bool)

(declare-fun contains!1216 (ListLongMap!2227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!784 (array!7581 array!7583 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 32) Int) ListLongMap!2227)

(assert (=> b!179990 (= c!32253 (contains!1216 (getCurrentListMap!784 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3693 thiss!1248)) key!828))))

(declare-fun e!118526 () Bool)

(declare-fun array_inv!2315 (array!7581) Bool)

(declare-fun array_inv!2316 (array!7583) Bool)

(assert (=> b!179991 (= e!118526 (and tp!16053 tp_is_empty!4213 (array_inv!2315 (_keys!5584 thiss!1248)) (array_inv!2316 (_values!3676 thiss!1248)) e!118528))))

(declare-fun b!179993 () Bool)

(declare-fun res!85267 () Bool)

(assert (=> b!179993 (=> (not res!85267) (not e!118525))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!580 0))(
  ( (MissingZero!580 (index!4488 (_ BitVec 32))) (Found!580 (index!4489 (_ BitVec 32))) (Intermediate!580 (undefined!1392 Bool) (index!4490 (_ BitVec 32)) (x!19662 (_ BitVec 32))) (Undefined!580) (MissingVacant!580 (index!4491 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7581 (_ BitVec 32)) SeekEntryResult!580)

(assert (=> b!179993 (= res!85267 ((_ is Undefined!580) (seekEntryOrOpen!0 key!828 (_keys!5584 thiss!1248) (mask!8686 thiss!1248))))))

(declare-fun res!85266 () Bool)

(assert (=> start!18074 (=> (not res!85266) (not e!118525))))

(declare-fun valid!1037 (LongMapFixedSize!2434) Bool)

(assert (=> start!18074 (= res!85266 (valid!1037 thiss!1248))))

(assert (=> start!18074 e!118525))

(assert (=> start!18074 e!118526))

(assert (=> start!18074 true))

(declare-fun b!179992 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!129 (array!7581 array!7583 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5471)

(assert (=> b!179992 (= e!118530 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!129 (_keys!5584 thiss!1248) (_values!3676 thiss!1248) (mask!8686 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(assert (= (and start!18074 res!85266) b!179988))

(assert (= (and b!179988 res!85265) b!179993))

(assert (= (and b!179993 res!85267) b!179990))

(assert (= (and b!179990 c!32253) b!179985))

(assert (= (and b!179990 (not c!32253)) b!179992))

(assert (= (and b!179986 condMapEmpty!7213) mapIsEmpty!7213))

(assert (= (and b!179986 (not condMapEmpty!7213)) mapNonEmpty!7213))

(assert (= (and mapNonEmpty!7213 ((_ is ValueCellFull!1763) mapValue!7213)) b!179989))

(assert (= (and b!179986 ((_ is ValueCellFull!1763) mapDefault!7213)) b!179987))

(assert (= b!179991 b!179986))

(assert (= start!18074 b!179991))

(declare-fun m!208207 () Bool)

(assert (=> b!179992 m!208207))

(declare-fun m!208209 () Bool)

(assert (=> b!179991 m!208209))

(declare-fun m!208211 () Bool)

(assert (=> b!179991 m!208211))

(declare-fun m!208213 () Bool)

(assert (=> b!179993 m!208213))

(declare-fun m!208215 () Bool)

(assert (=> b!179990 m!208215))

(declare-fun m!208217 () Bool)

(assert (=> b!179990 m!208217))

(assert (=> b!179990 m!208217))

(declare-fun m!208219 () Bool)

(assert (=> b!179990 m!208219))

(declare-fun m!208221 () Bool)

(assert (=> mapNonEmpty!7213 m!208221))

(declare-fun m!208223 () Bool)

(assert (=> start!18074 m!208223))

(declare-fun m!208225 () Bool)

(assert (=> b!179985 m!208225))

(check-sat tp_is_empty!4213 (not start!18074) (not b!179992) (not mapNonEmpty!7213) (not b!179990) (not b!179993) (not b_next!4441) (not b!179991) b_and!10989 (not b!179985))
(check-sat b_and!10989 (not b_next!4441))
