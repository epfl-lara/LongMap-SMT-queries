; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16078 () Bool)

(assert start!16078)

(declare-fun b!159680 () Bool)

(declare-fun b_free!3535 () Bool)

(declare-fun b_next!3535 () Bool)

(assert (=> b!159680 (= b_free!3535 (not b_next!3535))))

(declare-fun tp!13174 () Bool)

(declare-fun b_and!9963 () Bool)

(assert (=> b!159680 (= tp!13174 b_and!9963)))

(declare-fun b!159674 () Bool)

(declare-fun res!75470 () Bool)

(declare-fun e!104485 () Bool)

(assert (=> b!159674 (=> (not res!75470) (not e!104485))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4097 0))(
  ( (V!4098 (val!1713 Int)) )
))
(declare-datatypes ((ValueCell!1325 0))(
  ( (ValueCellFull!1325 (v!3579 V!4097)) (EmptyCell!1325) )
))
(declare-datatypes ((array!5739 0))(
  ( (array!5740 (arr!2714 (Array (_ BitVec 32) (_ BitVec 64))) (size!2998 (_ BitVec 32))) )
))
(declare-datatypes ((array!5741 0))(
  ( (array!5742 (arr!2715 (Array (_ BitVec 32) ValueCell!1325)) (size!2999 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1558 0))(
  ( (LongMapFixedSize!1559 (defaultEntry!3221 Int) (mask!7775 (_ BitVec 32)) (extraKeys!2962 (_ BitVec 32)) (zeroValue!3064 V!4097) (minValue!3064 V!4097) (_size!828 (_ BitVec 32)) (_keys!5022 array!5739) (_values!3204 array!5741) (_vacant!828 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1558)

(get-info :version)

(declare-datatypes ((SeekEntryResult!310 0))(
  ( (MissingZero!310 (index!3408 (_ BitVec 32))) (Found!310 (index!3409 (_ BitVec 32))) (Intermediate!310 (undefined!1122 Bool) (index!3410 (_ BitVec 32)) (x!17622 (_ BitVec 32))) (Undefined!310) (MissingVacant!310 (index!3411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5739 (_ BitVec 32)) SeekEntryResult!310)

(assert (=> b!159674 (= res!75470 ((_ is Undefined!310) (seekEntryOrOpen!0 key!828 (_keys!5022 thiss!1248) (mask!7775 thiss!1248))))))

(declare-fun mapNonEmpty!5693 () Bool)

(declare-fun mapRes!5693 () Bool)

(declare-fun tp!13175 () Bool)

(declare-fun e!104488 () Bool)

(assert (=> mapNonEmpty!5693 (= mapRes!5693 (and tp!13175 e!104488))))

(declare-fun mapRest!5693 () (Array (_ BitVec 32) ValueCell!1325))

(declare-fun mapKey!5693 () (_ BitVec 32))

(declare-fun mapValue!5693 () ValueCell!1325)

(assert (=> mapNonEmpty!5693 (= (arr!2715 (_values!3204 thiss!1248)) (store mapRest!5693 mapKey!5693 mapValue!5693))))

(declare-fun b!159675 () Bool)

(assert (=> b!159675 (= e!104485 false)))

(declare-fun lt!82074 () Bool)

(declare-datatypes ((List!1896 0))(
  ( (Nil!1893) (Cons!1892 (h!2505 (_ BitVec 64)) (t!6690 List!1896)) )
))
(declare-fun arrayNoDuplicates!0 (array!5739 (_ BitVec 32) List!1896) Bool)

(assert (=> b!159675 (= lt!82074 (arrayNoDuplicates!0 (_keys!5022 thiss!1248) #b00000000000000000000000000000000 Nil!1893))))

(declare-fun b!159676 () Bool)

(declare-fun res!75475 () Bool)

(assert (=> b!159676 (=> (not res!75475) (not e!104485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159676 (= res!75475 (validMask!0 (mask!7775 thiss!1248)))))

(declare-fun b!159677 () Bool)

(declare-fun res!75473 () Bool)

(assert (=> b!159677 (=> (not res!75473) (not e!104485))))

(declare-datatypes ((tuple2!2830 0))(
  ( (tuple2!2831 (_1!1426 (_ BitVec 64)) (_2!1426 V!4097)) )
))
(declare-datatypes ((List!1897 0))(
  ( (Nil!1894) (Cons!1893 (h!2506 tuple2!2830) (t!6691 List!1897)) )
))
(declare-datatypes ((ListLongMap!1829 0))(
  ( (ListLongMap!1830 (toList!930 List!1897)) )
))
(declare-fun contains!976 (ListLongMap!1829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!597 (array!5739 array!5741 (_ BitVec 32) (_ BitVec 32) V!4097 V!4097 (_ BitVec 32) Int) ListLongMap!1829)

(assert (=> b!159677 (= res!75473 (contains!976 (getCurrentListMap!597 (_keys!5022 thiss!1248) (_values!3204 thiss!1248) (mask!7775 thiss!1248) (extraKeys!2962 thiss!1248) (zeroValue!3064 thiss!1248) (minValue!3064 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3221 thiss!1248)) key!828))))

(declare-fun b!159678 () Bool)

(declare-fun e!104487 () Bool)

(declare-fun e!104490 () Bool)

(assert (=> b!159678 (= e!104487 (and e!104490 mapRes!5693))))

(declare-fun condMapEmpty!5693 () Bool)

(declare-fun mapDefault!5693 () ValueCell!1325)

(assert (=> b!159678 (= condMapEmpty!5693 (= (arr!2715 (_values!3204 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1325)) mapDefault!5693)))))

(declare-fun b!159679 () Bool)

(declare-fun res!75476 () Bool)

(assert (=> b!159679 (=> (not res!75476) (not e!104485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5739 (_ BitVec 32)) Bool)

(assert (=> b!159679 (= res!75476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5022 thiss!1248) (mask!7775 thiss!1248)))))

(declare-fun tp_is_empty!3337 () Bool)

(declare-fun e!104486 () Bool)

(declare-fun array_inv!1731 (array!5739) Bool)

(declare-fun array_inv!1732 (array!5741) Bool)

(assert (=> b!159680 (= e!104486 (and tp!13174 tp_is_empty!3337 (array_inv!1731 (_keys!5022 thiss!1248)) (array_inv!1732 (_values!3204 thiss!1248)) e!104487))))

(declare-fun b!159681 () Bool)

(assert (=> b!159681 (= e!104488 tp_is_empty!3337)))

(declare-fun res!75471 () Bool)

(assert (=> start!16078 (=> (not res!75471) (not e!104485))))

(declare-fun valid!747 (LongMapFixedSize!1558) Bool)

(assert (=> start!16078 (= res!75471 (valid!747 thiss!1248))))

(assert (=> start!16078 e!104485))

(assert (=> start!16078 e!104486))

(assert (=> start!16078 true))

(declare-fun b!159682 () Bool)

(assert (=> b!159682 (= e!104490 tp_is_empty!3337)))

(declare-fun mapIsEmpty!5693 () Bool)

(assert (=> mapIsEmpty!5693 mapRes!5693))

(declare-fun b!159683 () Bool)

(declare-fun res!75472 () Bool)

(assert (=> b!159683 (=> (not res!75472) (not e!104485))))

(assert (=> b!159683 (= res!75472 (and (= (size!2999 (_values!3204 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7775 thiss!1248))) (= (size!2998 (_keys!5022 thiss!1248)) (size!2999 (_values!3204 thiss!1248))) (bvsge (mask!7775 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2962 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2962 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159684 () Bool)

(declare-fun res!75474 () Bool)

(assert (=> b!159684 (=> (not res!75474) (not e!104485))))

(assert (=> b!159684 (= res!75474 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16078 res!75471) b!159684))

(assert (= (and b!159684 res!75474) b!159674))

(assert (= (and b!159674 res!75470) b!159677))

(assert (= (and b!159677 res!75473) b!159676))

(assert (= (and b!159676 res!75475) b!159683))

(assert (= (and b!159683 res!75472) b!159679))

(assert (= (and b!159679 res!75476) b!159675))

(assert (= (and b!159678 condMapEmpty!5693) mapIsEmpty!5693))

(assert (= (and b!159678 (not condMapEmpty!5693)) mapNonEmpty!5693))

(assert (= (and mapNonEmpty!5693 ((_ is ValueCellFull!1325) mapValue!5693)) b!159681))

(assert (= (and b!159678 ((_ is ValueCellFull!1325) mapDefault!5693)) b!159682))

(assert (= b!159680 b!159678))

(assert (= start!16078 b!159680))

(declare-fun m!191999 () Bool)

(assert (=> mapNonEmpty!5693 m!191999))

(declare-fun m!192001 () Bool)

(assert (=> b!159677 m!192001))

(assert (=> b!159677 m!192001))

(declare-fun m!192003 () Bool)

(assert (=> b!159677 m!192003))

(declare-fun m!192005 () Bool)

(assert (=> b!159675 m!192005))

(declare-fun m!192007 () Bool)

(assert (=> b!159676 m!192007))

(declare-fun m!192009 () Bool)

(assert (=> start!16078 m!192009))

(declare-fun m!192011 () Bool)

(assert (=> b!159679 m!192011))

(declare-fun m!192013 () Bool)

(assert (=> b!159680 m!192013))

(declare-fun m!192015 () Bool)

(assert (=> b!159680 m!192015))

(declare-fun m!192017 () Bool)

(assert (=> b!159674 m!192017))

(check-sat (not b!159674) tp_is_empty!3337 b_and!9963 (not b!159680) (not start!16078) (not b!159676) (not b!159677) (not b!159675) (not b_next!3535) (not b!159679) (not mapNonEmpty!5693))
(check-sat b_and!9963 (not b_next!3535))
