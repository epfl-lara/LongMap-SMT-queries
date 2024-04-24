; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16072 () Bool)

(assert start!16072)

(declare-fun b!159584 () Bool)

(declare-fun b_free!3529 () Bool)

(declare-fun b_next!3529 () Bool)

(assert (=> b!159584 (= b_free!3529 (not b_next!3529))))

(declare-fun tp!13157 () Bool)

(declare-fun b_and!9957 () Bool)

(assert (=> b!159584 (= tp!13157 b_and!9957)))

(declare-fun b!159575 () Bool)

(declare-fun e!104434 () Bool)

(declare-fun tp_is_empty!3331 () Bool)

(assert (=> b!159575 (= e!104434 tp_is_empty!3331)))

(declare-fun b!159576 () Bool)

(declare-fun e!104433 () Bool)

(assert (=> b!159576 (= e!104433 false)))

(declare-fun lt!82065 () Bool)

(declare-datatypes ((V!4089 0))(
  ( (V!4090 (val!1710 Int)) )
))
(declare-datatypes ((ValueCell!1322 0))(
  ( (ValueCellFull!1322 (v!3576 V!4089)) (EmptyCell!1322) )
))
(declare-datatypes ((array!5727 0))(
  ( (array!5728 (arr!2708 (Array (_ BitVec 32) (_ BitVec 64))) (size!2992 (_ BitVec 32))) )
))
(declare-datatypes ((array!5729 0))(
  ( (array!5730 (arr!2709 (Array (_ BitVec 32) ValueCell!1322)) (size!2993 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1552 0))(
  ( (LongMapFixedSize!1553 (defaultEntry!3218 Int) (mask!7770 (_ BitVec 32)) (extraKeys!2959 (_ BitVec 32)) (zeroValue!3061 V!4089) (minValue!3061 V!4089) (_size!825 (_ BitVec 32)) (_keys!5019 array!5727) (_values!3201 array!5729) (_vacant!825 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1552)

(declare-datatypes ((List!1890 0))(
  ( (Nil!1887) (Cons!1886 (h!2499 (_ BitVec 64)) (t!6684 List!1890)) )
))
(declare-fun arrayNoDuplicates!0 (array!5727 (_ BitVec 32) List!1890) Bool)

(assert (=> b!159576 (= lt!82065 (arrayNoDuplicates!0 (_keys!5019 thiss!1248) #b00000000000000000000000000000000 Nil!1887))))

(declare-fun res!75412 () Bool)

(assert (=> start!16072 (=> (not res!75412) (not e!104433))))

(declare-fun valid!745 (LongMapFixedSize!1552) Bool)

(assert (=> start!16072 (= res!75412 (valid!745 thiss!1248))))

(assert (=> start!16072 e!104433))

(declare-fun e!104432 () Bool)

(assert (=> start!16072 e!104432))

(assert (=> start!16072 true))

(declare-fun b!159577 () Bool)

(declare-fun res!75407 () Bool)

(assert (=> b!159577 (=> (not res!75407) (not e!104433))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2824 0))(
  ( (tuple2!2825 (_1!1423 (_ BitVec 64)) (_2!1423 V!4089)) )
))
(declare-datatypes ((List!1891 0))(
  ( (Nil!1888) (Cons!1887 (h!2500 tuple2!2824) (t!6685 List!1891)) )
))
(declare-datatypes ((ListLongMap!1823 0))(
  ( (ListLongMap!1824 (toList!927 List!1891)) )
))
(declare-fun contains!973 (ListLongMap!1823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!594 (array!5727 array!5729 (_ BitVec 32) (_ BitVec 32) V!4089 V!4089 (_ BitVec 32) Int) ListLongMap!1823)

(assert (=> b!159577 (= res!75407 (contains!973 (getCurrentListMap!594 (_keys!5019 thiss!1248) (_values!3201 thiss!1248) (mask!7770 thiss!1248) (extraKeys!2959 thiss!1248) (zeroValue!3061 thiss!1248) (minValue!3061 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3218 thiss!1248)) key!828))))

(declare-fun b!159578 () Bool)

(declare-fun res!75413 () Bool)

(assert (=> b!159578 (=> (not res!75413) (not e!104433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5727 (_ BitVec 32)) Bool)

(assert (=> b!159578 (= res!75413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5019 thiss!1248) (mask!7770 thiss!1248)))))

(declare-fun b!159579 () Bool)

(declare-fun res!75408 () Bool)

(assert (=> b!159579 (=> (not res!75408) (not e!104433))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!307 0))(
  ( (MissingZero!307 (index!3396 (_ BitVec 32))) (Found!307 (index!3397 (_ BitVec 32))) (Intermediate!307 (undefined!1119 Bool) (index!3398 (_ BitVec 32)) (x!17611 (_ BitVec 32))) (Undefined!307) (MissingVacant!307 (index!3399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5727 (_ BitVec 32)) SeekEntryResult!307)

(assert (=> b!159579 (= res!75408 ((_ is Undefined!307) (seekEntryOrOpen!0 key!828 (_keys!5019 thiss!1248) (mask!7770 thiss!1248))))))

(declare-fun mapIsEmpty!5684 () Bool)

(declare-fun mapRes!5684 () Bool)

(assert (=> mapIsEmpty!5684 mapRes!5684))

(declare-fun b!159580 () Bool)

(declare-fun res!75409 () Bool)

(assert (=> b!159580 (=> (not res!75409) (not e!104433))))

(assert (=> b!159580 (= res!75409 (and (= (size!2993 (_values!3201 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7770 thiss!1248))) (= (size!2992 (_keys!5019 thiss!1248)) (size!2993 (_values!3201 thiss!1248))) (bvsge (mask!7770 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2959 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2959 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159581 () Bool)

(declare-fun res!75410 () Bool)

(assert (=> b!159581 (=> (not res!75410) (not e!104433))))

(assert (=> b!159581 (= res!75410 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159582 () Bool)

(declare-fun res!75411 () Bool)

(assert (=> b!159582 (=> (not res!75411) (not e!104433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159582 (= res!75411 (validMask!0 (mask!7770 thiss!1248)))))

(declare-fun mapNonEmpty!5684 () Bool)

(declare-fun tp!13156 () Bool)

(assert (=> mapNonEmpty!5684 (= mapRes!5684 (and tp!13156 e!104434))))

(declare-fun mapRest!5684 () (Array (_ BitVec 32) ValueCell!1322))

(declare-fun mapValue!5684 () ValueCell!1322)

(declare-fun mapKey!5684 () (_ BitVec 32))

(assert (=> mapNonEmpty!5684 (= (arr!2709 (_values!3201 thiss!1248)) (store mapRest!5684 mapKey!5684 mapValue!5684))))

(declare-fun b!159583 () Bool)

(declare-fun e!104435 () Bool)

(declare-fun e!104436 () Bool)

(assert (=> b!159583 (= e!104435 (and e!104436 mapRes!5684))))

(declare-fun condMapEmpty!5684 () Bool)

(declare-fun mapDefault!5684 () ValueCell!1322)

(assert (=> b!159583 (= condMapEmpty!5684 (= (arr!2709 (_values!3201 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1322)) mapDefault!5684)))))

(declare-fun array_inv!1725 (array!5727) Bool)

(declare-fun array_inv!1726 (array!5729) Bool)

(assert (=> b!159584 (= e!104432 (and tp!13157 tp_is_empty!3331 (array_inv!1725 (_keys!5019 thiss!1248)) (array_inv!1726 (_values!3201 thiss!1248)) e!104435))))

(declare-fun b!159585 () Bool)

(assert (=> b!159585 (= e!104436 tp_is_empty!3331)))

(assert (= (and start!16072 res!75412) b!159581))

(assert (= (and b!159581 res!75410) b!159579))

(assert (= (and b!159579 res!75408) b!159577))

(assert (= (and b!159577 res!75407) b!159582))

(assert (= (and b!159582 res!75411) b!159580))

(assert (= (and b!159580 res!75409) b!159578))

(assert (= (and b!159578 res!75413) b!159576))

(assert (= (and b!159583 condMapEmpty!5684) mapIsEmpty!5684))

(assert (= (and b!159583 (not condMapEmpty!5684)) mapNonEmpty!5684))

(assert (= (and mapNonEmpty!5684 ((_ is ValueCellFull!1322) mapValue!5684)) b!159575))

(assert (= (and b!159583 ((_ is ValueCellFull!1322) mapDefault!5684)) b!159585))

(assert (= b!159584 b!159583))

(assert (= start!16072 b!159584))

(declare-fun m!191939 () Bool)

(assert (=> b!159577 m!191939))

(assert (=> b!159577 m!191939))

(declare-fun m!191941 () Bool)

(assert (=> b!159577 m!191941))

(declare-fun m!191943 () Bool)

(assert (=> start!16072 m!191943))

(declare-fun m!191945 () Bool)

(assert (=> b!159578 m!191945))

(declare-fun m!191947 () Bool)

(assert (=> b!159582 m!191947))

(declare-fun m!191949 () Bool)

(assert (=> mapNonEmpty!5684 m!191949))

(declare-fun m!191951 () Bool)

(assert (=> b!159579 m!191951))

(declare-fun m!191953 () Bool)

(assert (=> b!159584 m!191953))

(declare-fun m!191955 () Bool)

(assert (=> b!159584 m!191955))

(declare-fun m!191957 () Bool)

(assert (=> b!159576 m!191957))

(check-sat (not b!159577) (not mapNonEmpty!5684) (not b!159584) (not b!159582) (not start!16072) tp_is_empty!3331 (not b!159578) (not b_next!3529) (not b!159576) (not b!159579) b_and!9957)
(check-sat b_and!9957 (not b_next!3529))
