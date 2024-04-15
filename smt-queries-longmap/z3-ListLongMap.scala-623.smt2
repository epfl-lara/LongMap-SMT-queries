; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16090 () Bool)

(assert start!16090)

(declare-fun b!159685 () Bool)

(declare-fun b_free!3547 () Bool)

(declare-fun b_next!3547 () Bool)

(assert (=> b!159685 (= b_free!3547 (not b_next!3547))))

(declare-fun tp!13210 () Bool)

(declare-fun b_and!9935 () Bool)

(assert (=> b!159685 (= tp!13210 b_and!9935)))

(declare-fun b!159678 () Bool)

(declare-fun res!75482 () Bool)

(declare-fun e!104468 () Bool)

(assert (=> b!159678 (=> (not res!75482) (not e!104468))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159678 (= res!75482 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159679 () Bool)

(declare-fun res!75485 () Bool)

(assert (=> b!159679 (=> (not res!75485) (not e!104468))))

(declare-datatypes ((V!4113 0))(
  ( (V!4114 (val!1719 Int)) )
))
(declare-datatypes ((ValueCell!1331 0))(
  ( (ValueCellFull!1331 (v!3578 V!4113)) (EmptyCell!1331) )
))
(declare-datatypes ((array!5757 0))(
  ( (array!5758 (arr!2722 (Array (_ BitVec 32) (_ BitVec 64))) (size!3007 (_ BitVec 32))) )
))
(declare-datatypes ((array!5759 0))(
  ( (array!5760 (arr!2723 (Array (_ BitVec 32) ValueCell!1331)) (size!3008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1570 0))(
  ( (LongMapFixedSize!1571 (defaultEntry!3227 Int) (mask!7784 (_ BitVec 32)) (extraKeys!2968 (_ BitVec 32)) (zeroValue!3070 V!4113) (minValue!3070 V!4113) (_size!834 (_ BitVec 32)) (_keys!5027 array!5757) (_values!3210 array!5759) (_vacant!834 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1570)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159679 (= res!75485 (validMask!0 (mask!7784 thiss!1248)))))

(declare-fun b!159680 () Bool)

(declare-fun res!75480 () Bool)

(assert (=> b!159680 (=> (not res!75480) (not e!104468))))

(assert (=> b!159680 (= res!75480 (and (= (size!3008 (_values!3210 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7784 thiss!1248))) (= (size!3007 (_keys!5027 thiss!1248)) (size!3008 (_values!3210 thiss!1248))) (bvsge (mask!7784 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2968 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2968 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159681 () Bool)

(declare-fun e!104471 () Bool)

(declare-fun tp_is_empty!3349 () Bool)

(assert (=> b!159681 (= e!104471 tp_is_empty!3349)))

(declare-fun b!159682 () Bool)

(declare-fun e!104470 () Bool)

(assert (=> b!159682 (= e!104470 tp_is_empty!3349)))

(declare-fun res!75486 () Bool)

(assert (=> start!16090 (=> (not res!75486) (not e!104468))))

(declare-fun valid!734 (LongMapFixedSize!1570) Bool)

(assert (=> start!16090 (= res!75486 (valid!734 thiss!1248))))

(assert (=> start!16090 e!104468))

(declare-fun e!104469 () Bool)

(assert (=> start!16090 e!104469))

(assert (=> start!16090 true))

(declare-fun mapNonEmpty!5711 () Bool)

(declare-fun mapRes!5711 () Bool)

(declare-fun tp!13211 () Bool)

(assert (=> mapNonEmpty!5711 (= mapRes!5711 (and tp!13211 e!104470))))

(declare-fun mapValue!5711 () ValueCell!1331)

(declare-fun mapRest!5711 () (Array (_ BitVec 32) ValueCell!1331))

(declare-fun mapKey!5711 () (_ BitVec 32))

(assert (=> mapNonEmpty!5711 (= (arr!2723 (_values!3210 thiss!1248)) (store mapRest!5711 mapKey!5711 mapValue!5711))))

(declare-fun b!159683 () Bool)

(assert (=> b!159683 (= e!104468 false)))

(declare-fun lt!81852 () Bool)

(declare-datatypes ((List!1916 0))(
  ( (Nil!1913) (Cons!1912 (h!2525 (_ BitVec 64)) (t!6709 List!1916)) )
))
(declare-fun arrayNoDuplicates!0 (array!5757 (_ BitVec 32) List!1916) Bool)

(assert (=> b!159683 (= lt!81852 (arrayNoDuplicates!0 (_keys!5027 thiss!1248) #b00000000000000000000000000000000 Nil!1913))))

(declare-fun b!159684 () Bool)

(declare-fun e!104472 () Bool)

(assert (=> b!159684 (= e!104472 (and e!104471 mapRes!5711))))

(declare-fun condMapEmpty!5711 () Bool)

(declare-fun mapDefault!5711 () ValueCell!1331)

(assert (=> b!159684 (= condMapEmpty!5711 (= (arr!2723 (_values!3210 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1331)) mapDefault!5711)))))

(declare-fun mapIsEmpty!5711 () Bool)

(assert (=> mapIsEmpty!5711 mapRes!5711))

(declare-fun array_inv!1743 (array!5757) Bool)

(declare-fun array_inv!1744 (array!5759) Bool)

(assert (=> b!159685 (= e!104469 (and tp!13210 tp_is_empty!3349 (array_inv!1743 (_keys!5027 thiss!1248)) (array_inv!1744 (_values!3210 thiss!1248)) e!104472))))

(declare-fun b!159686 () Bool)

(declare-fun res!75481 () Bool)

(assert (=> b!159686 (=> (not res!75481) (not e!104468))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!323 0))(
  ( (MissingZero!323 (index!3460 (_ BitVec 32))) (Found!323 (index!3461 (_ BitVec 32))) (Intermediate!323 (undefined!1135 Bool) (index!3462 (_ BitVec 32)) (x!17650 (_ BitVec 32))) (Undefined!323) (MissingVacant!323 (index!3463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5757 (_ BitVec 32)) SeekEntryResult!323)

(assert (=> b!159686 (= res!75481 ((_ is Undefined!323) (seekEntryOrOpen!0 key!828 (_keys!5027 thiss!1248) (mask!7784 thiss!1248))))))

(declare-fun b!159687 () Bool)

(declare-fun res!75483 () Bool)

(assert (=> b!159687 (=> (not res!75483) (not e!104468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5757 (_ BitVec 32)) Bool)

(assert (=> b!159687 (= res!75483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5027 thiss!1248) (mask!7784 thiss!1248)))))

(declare-fun b!159688 () Bool)

(declare-fun res!75484 () Bool)

(assert (=> b!159688 (=> (not res!75484) (not e!104468))))

(declare-datatypes ((tuple2!2864 0))(
  ( (tuple2!2865 (_1!1443 (_ BitVec 64)) (_2!1443 V!4113)) )
))
(declare-datatypes ((List!1917 0))(
  ( (Nil!1914) (Cons!1913 (h!2526 tuple2!2864) (t!6710 List!1917)) )
))
(declare-datatypes ((ListLongMap!1851 0))(
  ( (ListLongMap!1852 (toList!941 List!1917)) )
))
(declare-fun contains!980 (ListLongMap!1851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!591 (array!5757 array!5759 (_ BitVec 32) (_ BitVec 32) V!4113 V!4113 (_ BitVec 32) Int) ListLongMap!1851)

(assert (=> b!159688 (= res!75484 (contains!980 (getCurrentListMap!591 (_keys!5027 thiss!1248) (_values!3210 thiss!1248) (mask!7784 thiss!1248) (extraKeys!2968 thiss!1248) (zeroValue!3070 thiss!1248) (minValue!3070 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3227 thiss!1248)) key!828))))

(assert (= (and start!16090 res!75486) b!159678))

(assert (= (and b!159678 res!75482) b!159686))

(assert (= (and b!159686 res!75481) b!159688))

(assert (= (and b!159688 res!75484) b!159679))

(assert (= (and b!159679 res!75485) b!159680))

(assert (= (and b!159680 res!75480) b!159687))

(assert (= (and b!159687 res!75483) b!159683))

(assert (= (and b!159684 condMapEmpty!5711) mapIsEmpty!5711))

(assert (= (and b!159684 (not condMapEmpty!5711)) mapNonEmpty!5711))

(assert (= (and mapNonEmpty!5711 ((_ is ValueCellFull!1331) mapValue!5711)) b!159682))

(assert (= (and b!159684 ((_ is ValueCellFull!1331) mapDefault!5711)) b!159681))

(assert (= b!159685 b!159684))

(assert (= start!16090 b!159685))

(declare-fun m!191317 () Bool)

(assert (=> b!159688 m!191317))

(assert (=> b!159688 m!191317))

(declare-fun m!191319 () Bool)

(assert (=> b!159688 m!191319))

(declare-fun m!191321 () Bool)

(assert (=> mapNonEmpty!5711 m!191321))

(declare-fun m!191323 () Bool)

(assert (=> b!159679 m!191323))

(declare-fun m!191325 () Bool)

(assert (=> b!159686 m!191325))

(declare-fun m!191327 () Bool)

(assert (=> b!159685 m!191327))

(declare-fun m!191329 () Bool)

(assert (=> b!159685 m!191329))

(declare-fun m!191331 () Bool)

(assert (=> b!159683 m!191331))

(declare-fun m!191333 () Bool)

(assert (=> start!16090 m!191333))

(declare-fun m!191335 () Bool)

(assert (=> b!159687 m!191335))

(check-sat tp_is_empty!3349 (not b!159686) (not b!159683) (not mapNonEmpty!5711) (not b!159685) (not b!159688) (not b!159679) (not start!16090) b_and!9935 (not b_next!3547) (not b!159687))
(check-sat b_and!9935 (not b_next!3547))
