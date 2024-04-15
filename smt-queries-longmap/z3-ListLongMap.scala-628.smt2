; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16120 () Bool)

(assert start!16120)

(declare-fun b!160179 () Bool)

(declare-fun b_free!3577 () Bool)

(declare-fun b_next!3577 () Bool)

(assert (=> b!160179 (= b_free!3577 (not b_next!3577))))

(declare-fun tp!13301 () Bool)

(declare-fun b_and!9965 () Bool)

(assert (=> b!160179 (= tp!13301 b_and!9965)))

(declare-fun b!160173 () Bool)

(declare-fun res!75796 () Bool)

(declare-fun e!104741 () Bool)

(assert (=> b!160173 (=> (not res!75796) (not e!104741))))

(declare-datatypes ((V!4153 0))(
  ( (V!4154 (val!1734 Int)) )
))
(declare-datatypes ((ValueCell!1346 0))(
  ( (ValueCellFull!1346 (v!3593 V!4153)) (EmptyCell!1346) )
))
(declare-datatypes ((array!5817 0))(
  ( (array!5818 (arr!2752 (Array (_ BitVec 32) (_ BitVec 64))) (size!3037 (_ BitVec 32))) )
))
(declare-datatypes ((array!5819 0))(
  ( (array!5820 (arr!2753 (Array (_ BitVec 32) ValueCell!1346)) (size!3038 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1600 0))(
  ( (LongMapFixedSize!1601 (defaultEntry!3242 Int) (mask!7809 (_ BitVec 32)) (extraKeys!2983 (_ BitVec 32)) (zeroValue!3085 V!4153) (minValue!3085 V!4153) (_size!849 (_ BitVec 32)) (_keys!5042 array!5817) (_values!3225 array!5819) (_vacant!849 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1600)

(assert (=> b!160173 (= res!75796 (and (= (size!3038 (_values!3225 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7809 thiss!1248))) (= (size!3037 (_keys!5042 thiss!1248)) (size!3038 (_values!3225 thiss!1248))) (bvsge (mask!7809 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2983 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2983 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5756 () Bool)

(declare-fun mapRes!5756 () Bool)

(declare-fun tp!13300 () Bool)

(declare-fun e!104739 () Bool)

(assert (=> mapNonEmpty!5756 (= mapRes!5756 (and tp!13300 e!104739))))

(declare-fun mapRest!5756 () (Array (_ BitVec 32) ValueCell!1346))

(declare-fun mapKey!5756 () (_ BitVec 32))

(declare-fun mapValue!5756 () ValueCell!1346)

(assert (=> mapNonEmpty!5756 (= (arr!2753 (_values!3225 thiss!1248)) (store mapRest!5756 mapKey!5756 mapValue!5756))))

(declare-fun b!160174 () Bool)

(declare-fun res!75795 () Bool)

(assert (=> b!160174 (=> (not res!75795) (not e!104741))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160174 (= res!75795 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160175 () Bool)

(assert (=> b!160175 (= e!104741 false)))

(declare-fun lt!81897 () Bool)

(declare-datatypes ((List!1933 0))(
  ( (Nil!1930) (Cons!1929 (h!2542 (_ BitVec 64)) (t!6726 List!1933)) )
))
(declare-fun arrayNoDuplicates!0 (array!5817 (_ BitVec 32) List!1933) Bool)

(assert (=> b!160175 (= lt!81897 (arrayNoDuplicates!0 (_keys!5042 thiss!1248) #b00000000000000000000000000000000 Nil!1930))))

(declare-fun b!160176 () Bool)

(declare-fun res!75798 () Bool)

(assert (=> b!160176 (=> (not res!75798) (not e!104741))))

(declare-datatypes ((tuple2!2882 0))(
  ( (tuple2!2883 (_1!1452 (_ BitVec 64)) (_2!1452 V!4153)) )
))
(declare-datatypes ((List!1934 0))(
  ( (Nil!1931) (Cons!1930 (h!2543 tuple2!2882) (t!6727 List!1934)) )
))
(declare-datatypes ((ListLongMap!1869 0))(
  ( (ListLongMap!1870 (toList!950 List!1934)) )
))
(declare-fun contains!989 (ListLongMap!1869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!600 (array!5817 array!5819 (_ BitVec 32) (_ BitVec 32) V!4153 V!4153 (_ BitVec 32) Int) ListLongMap!1869)

(assert (=> b!160176 (= res!75798 (not (contains!989 (getCurrentListMap!600 (_keys!5042 thiss!1248) (_values!3225 thiss!1248) (mask!7809 thiss!1248) (extraKeys!2983 thiss!1248) (zeroValue!3085 thiss!1248) (minValue!3085 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3242 thiss!1248)) key!828)))))

(declare-fun b!160177 () Bool)

(declare-fun tp_is_empty!3379 () Bool)

(assert (=> b!160177 (= e!104739 tp_is_empty!3379)))

(declare-fun b!160178 () Bool)

(declare-fun res!75797 () Bool)

(assert (=> b!160178 (=> (not res!75797) (not e!104741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5817 (_ BitVec 32)) Bool)

(assert (=> b!160178 (= res!75797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5042 thiss!1248) (mask!7809 thiss!1248)))))

(declare-fun res!75800 () Bool)

(assert (=> start!16120 (=> (not res!75800) (not e!104741))))

(declare-fun valid!742 (LongMapFixedSize!1600) Bool)

(assert (=> start!16120 (= res!75800 (valid!742 thiss!1248))))

(assert (=> start!16120 e!104741))

(declare-fun e!104738 () Bool)

(assert (=> start!16120 e!104738))

(assert (=> start!16120 true))

(declare-fun e!104742 () Bool)

(declare-fun array_inv!1763 (array!5817) Bool)

(declare-fun array_inv!1764 (array!5819) Bool)

(assert (=> b!160179 (= e!104738 (and tp!13301 tp_is_empty!3379 (array_inv!1763 (_keys!5042 thiss!1248)) (array_inv!1764 (_values!3225 thiss!1248)) e!104742))))

(declare-fun b!160180 () Bool)

(declare-fun res!75799 () Bool)

(assert (=> b!160180 (=> (not res!75799) (not e!104741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160180 (= res!75799 (validMask!0 (mask!7809 thiss!1248)))))

(declare-fun mapIsEmpty!5756 () Bool)

(assert (=> mapIsEmpty!5756 mapRes!5756))

(declare-fun b!160181 () Bool)

(declare-fun e!104740 () Bool)

(assert (=> b!160181 (= e!104742 (and e!104740 mapRes!5756))))

(declare-fun condMapEmpty!5756 () Bool)

(declare-fun mapDefault!5756 () ValueCell!1346)

(assert (=> b!160181 (= condMapEmpty!5756 (= (arr!2753 (_values!3225 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1346)) mapDefault!5756)))))

(declare-fun b!160182 () Bool)

(declare-fun res!75801 () Bool)

(assert (=> b!160182 (=> (not res!75801) (not e!104741))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!334 0))(
  ( (MissingZero!334 (index!3504 (_ BitVec 32))) (Found!334 (index!3505 (_ BitVec 32))) (Intermediate!334 (undefined!1146 Bool) (index!3506 (_ BitVec 32)) (x!17701 (_ BitVec 32))) (Undefined!334) (MissingVacant!334 (index!3507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5817 (_ BitVec 32)) SeekEntryResult!334)

(assert (=> b!160182 (= res!75801 ((_ is Undefined!334) (seekEntryOrOpen!0 key!828 (_keys!5042 thiss!1248) (mask!7809 thiss!1248))))))

(declare-fun b!160183 () Bool)

(assert (=> b!160183 (= e!104740 tp_is_empty!3379)))

(assert (= (and start!16120 res!75800) b!160174))

(assert (= (and b!160174 res!75795) b!160182))

(assert (= (and b!160182 res!75801) b!160176))

(assert (= (and b!160176 res!75798) b!160180))

(assert (= (and b!160180 res!75799) b!160173))

(assert (= (and b!160173 res!75796) b!160178))

(assert (= (and b!160178 res!75797) b!160175))

(assert (= (and b!160181 condMapEmpty!5756) mapIsEmpty!5756))

(assert (= (and b!160181 (not condMapEmpty!5756)) mapNonEmpty!5756))

(assert (= (and mapNonEmpty!5756 ((_ is ValueCellFull!1346) mapValue!5756)) b!160177))

(assert (= (and b!160181 ((_ is ValueCellFull!1346) mapDefault!5756)) b!160183))

(assert (= b!160179 b!160181))

(assert (= start!16120 b!160179))

(declare-fun m!191617 () Bool)

(assert (=> b!160175 m!191617))

(declare-fun m!191619 () Bool)

(assert (=> mapNonEmpty!5756 m!191619))

(declare-fun m!191621 () Bool)

(assert (=> b!160180 m!191621))

(declare-fun m!191623 () Bool)

(assert (=> b!160178 m!191623))

(declare-fun m!191625 () Bool)

(assert (=> start!16120 m!191625))

(declare-fun m!191627 () Bool)

(assert (=> b!160179 m!191627))

(declare-fun m!191629 () Bool)

(assert (=> b!160179 m!191629))

(declare-fun m!191631 () Bool)

(assert (=> b!160176 m!191631))

(assert (=> b!160176 m!191631))

(declare-fun m!191633 () Bool)

(assert (=> b!160176 m!191633))

(declare-fun m!191635 () Bool)

(assert (=> b!160182 m!191635))

(check-sat (not b_next!3577) (not b!160182) (not b!160178) (not start!16120) (not b!160176) (not b!160179) tp_is_empty!3379 (not b!160175) (not mapNonEmpty!5756) (not b!160180) b_and!9965)
(check-sat b_and!9965 (not b_next!3577))
