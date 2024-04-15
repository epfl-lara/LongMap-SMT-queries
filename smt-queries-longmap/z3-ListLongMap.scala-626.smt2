; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16108 () Bool)

(assert start!16108)

(declare-fun b!159980 () Bool)

(declare-fun b_free!3565 () Bool)

(declare-fun b_next!3565 () Bool)

(assert (=> b!159980 (= b_free!3565 (not b_next!3565))))

(declare-fun tp!13264 () Bool)

(declare-fun b_and!9953 () Bool)

(assert (=> b!159980 (= tp!13264 b_and!9953)))

(declare-fun b!159975 () Bool)

(declare-fun e!104635 () Bool)

(declare-fun tp_is_empty!3367 () Bool)

(assert (=> b!159975 (= e!104635 tp_is_empty!3367)))

(declare-fun b!159976 () Bool)

(declare-fun res!75672 () Bool)

(declare-fun e!104633 () Bool)

(assert (=> b!159976 (=> (not res!75672) (not e!104633))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4137 0))(
  ( (V!4138 (val!1728 Int)) )
))
(declare-datatypes ((ValueCell!1340 0))(
  ( (ValueCellFull!1340 (v!3587 V!4137)) (EmptyCell!1340) )
))
(declare-datatypes ((array!5793 0))(
  ( (array!5794 (arr!2740 (Array (_ BitVec 32) (_ BitVec 64))) (size!3025 (_ BitVec 32))) )
))
(declare-datatypes ((array!5795 0))(
  ( (array!5796 (arr!2741 (Array (_ BitVec 32) ValueCell!1340)) (size!3026 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1588 0))(
  ( (LongMapFixedSize!1589 (defaultEntry!3236 Int) (mask!7799 (_ BitVec 32)) (extraKeys!2977 (_ BitVec 32)) (zeroValue!3079 V!4137) (minValue!3079 V!4137) (_size!843 (_ BitVec 32)) (_keys!5036 array!5793) (_values!3219 array!5795) (_vacant!843 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1588)

(get-info :version)

(declare-datatypes ((SeekEntryResult!329 0))(
  ( (MissingZero!329 (index!3484 (_ BitVec 32))) (Found!329 (index!3485 (_ BitVec 32))) (Intermediate!329 (undefined!1141 Bool) (index!3486 (_ BitVec 32)) (x!17680 (_ BitVec 32))) (Undefined!329) (MissingVacant!329 (index!3487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5793 (_ BitVec 32)) SeekEntryResult!329)

(assert (=> b!159976 (= res!75672 ((_ is Undefined!329) (seekEntryOrOpen!0 key!828 (_keys!5036 thiss!1248) (mask!7799 thiss!1248))))))

(declare-fun mapNonEmpty!5738 () Bool)

(declare-fun mapRes!5738 () Bool)

(declare-fun tp!13265 () Bool)

(declare-fun e!104632 () Bool)

(assert (=> mapNonEmpty!5738 (= mapRes!5738 (and tp!13265 e!104632))))

(declare-fun mapRest!5738 () (Array (_ BitVec 32) ValueCell!1340))

(declare-fun mapKey!5738 () (_ BitVec 32))

(declare-fun mapValue!5738 () ValueCell!1340)

(assert (=> mapNonEmpty!5738 (= (arr!2741 (_values!3219 thiss!1248)) (store mapRest!5738 mapKey!5738 mapValue!5738))))

(declare-fun res!75673 () Bool)

(assert (=> start!16108 (=> (not res!75673) (not e!104633))))

(declare-fun valid!739 (LongMapFixedSize!1588) Bool)

(assert (=> start!16108 (= res!75673 (valid!739 thiss!1248))))

(assert (=> start!16108 e!104633))

(declare-fun e!104631 () Bool)

(assert (=> start!16108 e!104631))

(assert (=> start!16108 true))

(declare-fun b!159977 () Bool)

(declare-fun res!75671 () Bool)

(assert (=> b!159977 (=> (not res!75671) (not e!104633))))

(declare-datatypes ((tuple2!2872 0))(
  ( (tuple2!2873 (_1!1447 (_ BitVec 64)) (_2!1447 V!4137)) )
))
(declare-datatypes ((List!1924 0))(
  ( (Nil!1921) (Cons!1920 (h!2533 tuple2!2872) (t!6717 List!1924)) )
))
(declare-datatypes ((ListLongMap!1859 0))(
  ( (ListLongMap!1860 (toList!945 List!1924)) )
))
(declare-fun contains!984 (ListLongMap!1859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!595 (array!5793 array!5795 (_ BitVec 32) (_ BitVec 32) V!4137 V!4137 (_ BitVec 32) Int) ListLongMap!1859)

(assert (=> b!159977 (= res!75671 (contains!984 (getCurrentListMap!595 (_keys!5036 thiss!1248) (_values!3219 thiss!1248) (mask!7799 thiss!1248) (extraKeys!2977 thiss!1248) (zeroValue!3079 thiss!1248) (minValue!3079 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3236 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!5738 () Bool)

(assert (=> mapIsEmpty!5738 mapRes!5738))

(declare-fun b!159978 () Bool)

(assert (=> b!159978 (= e!104632 tp_is_empty!3367)))

(declare-fun b!159979 () Bool)

(declare-fun res!75669 () Bool)

(assert (=> b!159979 (=> (not res!75669) (not e!104633))))

(assert (=> b!159979 (= res!75669 (and (= (size!3026 (_values!3219 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7799 thiss!1248))) (= (size!3025 (_keys!5036 thiss!1248)) (size!3026 (_values!3219 thiss!1248))) (bvsge (mask!7799 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2977 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2977 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!104634 () Bool)

(declare-fun array_inv!1753 (array!5793) Bool)

(declare-fun array_inv!1754 (array!5795) Bool)

(assert (=> b!159980 (= e!104631 (and tp!13264 tp_is_empty!3367 (array_inv!1753 (_keys!5036 thiss!1248)) (array_inv!1754 (_values!3219 thiss!1248)) e!104634))))

(declare-fun b!159981 () Bool)

(assert (=> b!159981 (= e!104633 false)))

(declare-fun lt!81879 () Bool)

(declare-datatypes ((List!1925 0))(
  ( (Nil!1922) (Cons!1921 (h!2534 (_ BitVec 64)) (t!6718 List!1925)) )
))
(declare-fun arrayNoDuplicates!0 (array!5793 (_ BitVec 32) List!1925) Bool)

(assert (=> b!159981 (= lt!81879 (arrayNoDuplicates!0 (_keys!5036 thiss!1248) #b00000000000000000000000000000000 Nil!1922))))

(declare-fun b!159982 () Bool)

(assert (=> b!159982 (= e!104634 (and e!104635 mapRes!5738))))

(declare-fun condMapEmpty!5738 () Bool)

(declare-fun mapDefault!5738 () ValueCell!1340)

(assert (=> b!159982 (= condMapEmpty!5738 (= (arr!2741 (_values!3219 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1340)) mapDefault!5738)))))

(declare-fun b!159983 () Bool)

(declare-fun res!75674 () Bool)

(assert (=> b!159983 (=> (not res!75674) (not e!104633))))

(assert (=> b!159983 (= res!75674 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159984 () Bool)

(declare-fun res!75675 () Bool)

(assert (=> b!159984 (=> (not res!75675) (not e!104633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159984 (= res!75675 (validMask!0 (mask!7799 thiss!1248)))))

(declare-fun b!159985 () Bool)

(declare-fun res!75670 () Bool)

(assert (=> b!159985 (=> (not res!75670) (not e!104633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5793 (_ BitVec 32)) Bool)

(assert (=> b!159985 (= res!75670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5036 thiss!1248) (mask!7799 thiss!1248)))))

(assert (= (and start!16108 res!75673) b!159983))

(assert (= (and b!159983 res!75674) b!159976))

(assert (= (and b!159976 res!75672) b!159977))

(assert (= (and b!159977 res!75671) b!159984))

(assert (= (and b!159984 res!75675) b!159979))

(assert (= (and b!159979 res!75669) b!159985))

(assert (= (and b!159985 res!75670) b!159981))

(assert (= (and b!159982 condMapEmpty!5738) mapIsEmpty!5738))

(assert (= (and b!159982 (not condMapEmpty!5738)) mapNonEmpty!5738))

(assert (= (and mapNonEmpty!5738 ((_ is ValueCellFull!1340) mapValue!5738)) b!159978))

(assert (= (and b!159982 ((_ is ValueCellFull!1340) mapDefault!5738)) b!159975))

(assert (= b!159980 b!159982))

(assert (= start!16108 b!159980))

(declare-fun m!191497 () Bool)

(assert (=> b!159984 m!191497))

(declare-fun m!191499 () Bool)

(assert (=> start!16108 m!191499))

(declare-fun m!191501 () Bool)

(assert (=> b!159980 m!191501))

(declare-fun m!191503 () Bool)

(assert (=> b!159980 m!191503))

(declare-fun m!191505 () Bool)

(assert (=> b!159981 m!191505))

(declare-fun m!191507 () Bool)

(assert (=> b!159976 m!191507))

(declare-fun m!191509 () Bool)

(assert (=> mapNonEmpty!5738 m!191509))

(declare-fun m!191511 () Bool)

(assert (=> b!159985 m!191511))

(declare-fun m!191513 () Bool)

(assert (=> b!159977 m!191513))

(assert (=> b!159977 m!191513))

(declare-fun m!191515 () Bool)

(assert (=> b!159977 m!191515))

(check-sat (not b!159981) tp_is_empty!3367 (not b!159977) (not b!159980) (not b!159985) (not b_next!3565) (not b!159976) (not mapNonEmpty!5738) b_and!9953 (not start!16108) (not b!159984))
(check-sat b_and!9953 (not b_next!3565))
