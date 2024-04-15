; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16096 () Bool)

(assert start!16096)

(declare-fun b!159785 () Bool)

(declare-fun b_free!3553 () Bool)

(declare-fun b_next!3553 () Bool)

(assert (=> b!159785 (= b_free!3553 (not b_next!3553))))

(declare-fun tp!13229 () Bool)

(declare-fun b_and!9941 () Bool)

(assert (=> b!159785 (= tp!13229 b_and!9941)))

(declare-fun b!159777 () Bool)

(declare-fun res!75548 () Bool)

(declare-fun e!104526 () Bool)

(assert (=> b!159777 (=> (not res!75548) (not e!104526))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159777 (= res!75548 (not (= key!828 (bvneg key!828))))))

(declare-fun res!75549 () Bool)

(assert (=> start!16096 (=> (not res!75549) (not e!104526))))

(declare-datatypes ((V!4121 0))(
  ( (V!4122 (val!1722 Int)) )
))
(declare-datatypes ((ValueCell!1334 0))(
  ( (ValueCellFull!1334 (v!3581 V!4121)) (EmptyCell!1334) )
))
(declare-datatypes ((array!5769 0))(
  ( (array!5770 (arr!2728 (Array (_ BitVec 32) (_ BitVec 64))) (size!3013 (_ BitVec 32))) )
))
(declare-datatypes ((array!5771 0))(
  ( (array!5772 (arr!2729 (Array (_ BitVec 32) ValueCell!1334)) (size!3014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1576 0))(
  ( (LongMapFixedSize!1577 (defaultEntry!3230 Int) (mask!7789 (_ BitVec 32)) (extraKeys!2971 (_ BitVec 32)) (zeroValue!3073 V!4121) (minValue!3073 V!4121) (_size!837 (_ BitVec 32)) (_keys!5030 array!5769) (_values!3213 array!5771) (_vacant!837 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1576)

(declare-fun valid!736 (LongMapFixedSize!1576) Bool)

(assert (=> start!16096 (= res!75549 (valid!736 thiss!1248))))

(assert (=> start!16096 e!104526))

(declare-fun e!104525 () Bool)

(assert (=> start!16096 e!104525))

(assert (=> start!16096 true))

(declare-fun b!159778 () Bool)

(declare-fun e!104522 () Bool)

(declare-fun e!104523 () Bool)

(declare-fun mapRes!5720 () Bool)

(assert (=> b!159778 (= e!104522 (and e!104523 mapRes!5720))))

(declare-fun condMapEmpty!5720 () Bool)

(declare-fun mapDefault!5720 () ValueCell!1334)

(assert (=> b!159778 (= condMapEmpty!5720 (= (arr!2729 (_values!3213 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1334)) mapDefault!5720)))))

(declare-fun b!159779 () Bool)

(declare-fun tp_is_empty!3355 () Bool)

(assert (=> b!159779 (= e!104523 tp_is_empty!3355)))

(declare-fun mapIsEmpty!5720 () Bool)

(assert (=> mapIsEmpty!5720 mapRes!5720))

(declare-fun mapNonEmpty!5720 () Bool)

(declare-fun tp!13228 () Bool)

(declare-fun e!104524 () Bool)

(assert (=> mapNonEmpty!5720 (= mapRes!5720 (and tp!13228 e!104524))))

(declare-fun mapRest!5720 () (Array (_ BitVec 32) ValueCell!1334))

(declare-fun mapValue!5720 () ValueCell!1334)

(declare-fun mapKey!5720 () (_ BitVec 32))

(assert (=> mapNonEmpty!5720 (= (arr!2729 (_values!3213 thiss!1248)) (store mapRest!5720 mapKey!5720 mapValue!5720))))

(declare-fun b!159780 () Bool)

(declare-fun res!75544 () Bool)

(assert (=> b!159780 (=> (not res!75544) (not e!104526))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!325 0))(
  ( (MissingZero!325 (index!3468 (_ BitVec 32))) (Found!325 (index!3469 (_ BitVec 32))) (Intermediate!325 (undefined!1137 Bool) (index!3470 (_ BitVec 32)) (x!17660 (_ BitVec 32))) (Undefined!325) (MissingVacant!325 (index!3471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5769 (_ BitVec 32)) SeekEntryResult!325)

(assert (=> b!159780 (= res!75544 ((_ is Undefined!325) (seekEntryOrOpen!0 key!828 (_keys!5030 thiss!1248) (mask!7789 thiss!1248))))))

(declare-fun b!159781 () Bool)

(declare-fun res!75546 () Bool)

(assert (=> b!159781 (=> (not res!75546) (not e!104526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159781 (= res!75546 (validMask!0 (mask!7789 thiss!1248)))))

(declare-fun b!159782 () Bool)

(declare-fun res!75545 () Bool)

(assert (=> b!159782 (=> (not res!75545) (not e!104526))))

(declare-datatypes ((tuple2!2866 0))(
  ( (tuple2!2867 (_1!1444 (_ BitVec 64)) (_2!1444 V!4121)) )
))
(declare-datatypes ((List!1919 0))(
  ( (Nil!1916) (Cons!1915 (h!2528 tuple2!2866) (t!6712 List!1919)) )
))
(declare-datatypes ((ListLongMap!1853 0))(
  ( (ListLongMap!1854 (toList!942 List!1919)) )
))
(declare-fun contains!981 (ListLongMap!1853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!592 (array!5769 array!5771 (_ BitVec 32) (_ BitVec 32) V!4121 V!4121 (_ BitVec 32) Int) ListLongMap!1853)

(assert (=> b!159782 (= res!75545 (contains!981 (getCurrentListMap!592 (_keys!5030 thiss!1248) (_values!3213 thiss!1248) (mask!7789 thiss!1248) (extraKeys!2971 thiss!1248) (zeroValue!3073 thiss!1248) (minValue!3073 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3230 thiss!1248)) key!828))))

(declare-fun b!159783 () Bool)

(declare-fun res!75543 () Bool)

(assert (=> b!159783 (=> (not res!75543) (not e!104526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5769 (_ BitVec 32)) Bool)

(assert (=> b!159783 (= res!75543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5030 thiss!1248) (mask!7789 thiss!1248)))))

(declare-fun b!159784 () Bool)

(assert (=> b!159784 (= e!104526 false)))

(declare-fun lt!81861 () Bool)

(declare-datatypes ((List!1920 0))(
  ( (Nil!1917) (Cons!1916 (h!2529 (_ BitVec 64)) (t!6713 List!1920)) )
))
(declare-fun arrayNoDuplicates!0 (array!5769 (_ BitVec 32) List!1920) Bool)

(assert (=> b!159784 (= lt!81861 (arrayNoDuplicates!0 (_keys!5030 thiss!1248) #b00000000000000000000000000000000 Nil!1917))))

(declare-fun array_inv!1747 (array!5769) Bool)

(declare-fun array_inv!1748 (array!5771) Bool)

(assert (=> b!159785 (= e!104525 (and tp!13229 tp_is_empty!3355 (array_inv!1747 (_keys!5030 thiss!1248)) (array_inv!1748 (_values!3213 thiss!1248)) e!104522))))

(declare-fun b!159786 () Bool)

(assert (=> b!159786 (= e!104524 tp_is_empty!3355)))

(declare-fun b!159787 () Bool)

(declare-fun res!75547 () Bool)

(assert (=> b!159787 (=> (not res!75547) (not e!104526))))

(assert (=> b!159787 (= res!75547 (and (= (size!3014 (_values!3213 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7789 thiss!1248))) (= (size!3013 (_keys!5030 thiss!1248)) (size!3014 (_values!3213 thiss!1248))) (bvsge (mask!7789 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2971 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2971 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16096 res!75549) b!159777))

(assert (= (and b!159777 res!75548) b!159780))

(assert (= (and b!159780 res!75544) b!159782))

(assert (= (and b!159782 res!75545) b!159781))

(assert (= (and b!159781 res!75546) b!159787))

(assert (= (and b!159787 res!75547) b!159783))

(assert (= (and b!159783 res!75543) b!159784))

(assert (= (and b!159778 condMapEmpty!5720) mapIsEmpty!5720))

(assert (= (and b!159778 (not condMapEmpty!5720)) mapNonEmpty!5720))

(assert (= (and mapNonEmpty!5720 ((_ is ValueCellFull!1334) mapValue!5720)) b!159786))

(assert (= (and b!159778 ((_ is ValueCellFull!1334) mapDefault!5720)) b!159779))

(assert (= b!159785 b!159778))

(assert (= start!16096 b!159785))

(declare-fun m!191377 () Bool)

(assert (=> b!159782 m!191377))

(assert (=> b!159782 m!191377))

(declare-fun m!191379 () Bool)

(assert (=> b!159782 m!191379))

(declare-fun m!191381 () Bool)

(assert (=> b!159785 m!191381))

(declare-fun m!191383 () Bool)

(assert (=> b!159785 m!191383))

(declare-fun m!191385 () Bool)

(assert (=> b!159780 m!191385))

(declare-fun m!191387 () Bool)

(assert (=> b!159781 m!191387))

(declare-fun m!191389 () Bool)

(assert (=> b!159783 m!191389))

(declare-fun m!191391 () Bool)

(assert (=> mapNonEmpty!5720 m!191391))

(declare-fun m!191393 () Bool)

(assert (=> b!159784 m!191393))

(declare-fun m!191395 () Bool)

(assert (=> start!16096 m!191395))

(check-sat (not b!159782) (not b!159781) b_and!9941 (not b!159784) (not b!159785) (not b!159780) (not b_next!3553) tp_is_empty!3355 (not start!16096) (not b!159783) (not mapNonEmpty!5720))
(check-sat b_and!9941 (not b_next!3553))
