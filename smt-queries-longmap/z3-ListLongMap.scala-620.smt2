; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16072 () Bool)

(assert start!16072)

(declare-fun b!159383 () Bool)

(declare-fun b_free!3529 () Bool)

(declare-fun b_next!3529 () Bool)

(assert (=> b!159383 (= b_free!3529 (not b_next!3529))))

(declare-fun tp!13156 () Bool)

(declare-fun b_and!9917 () Bool)

(assert (=> b!159383 (= tp!13156 b_and!9917)))

(declare-fun b!159381 () Bool)

(declare-fun e!104308 () Bool)

(assert (=> b!159381 (= e!104308 false)))

(declare-fun lt!81825 () Bool)

(declare-datatypes ((V!4089 0))(
  ( (V!4090 (val!1710 Int)) )
))
(declare-datatypes ((ValueCell!1322 0))(
  ( (ValueCellFull!1322 (v!3569 V!4089)) (EmptyCell!1322) )
))
(declare-datatypes ((array!5721 0))(
  ( (array!5722 (arr!2704 (Array (_ BitVec 32) (_ BitVec 64))) (size!2989 (_ BitVec 32))) )
))
(declare-datatypes ((array!5723 0))(
  ( (array!5724 (arr!2705 (Array (_ BitVec 32) ValueCell!1322)) (size!2990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1552 0))(
  ( (LongMapFixedSize!1553 (defaultEntry!3218 Int) (mask!7769 (_ BitVec 32)) (extraKeys!2959 (_ BitVec 32)) (zeroValue!3061 V!4089) (minValue!3061 V!4089) (_size!825 (_ BitVec 32)) (_keys!5018 array!5721) (_values!3201 array!5723) (_vacant!825 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1552)

(declare-datatypes ((List!1905 0))(
  ( (Nil!1902) (Cons!1901 (h!2514 (_ BitVec 64)) (t!6698 List!1905)) )
))
(declare-fun arrayNoDuplicates!0 (array!5721 (_ BitVec 32) List!1905) Bool)

(assert (=> b!159381 (= lt!81825 (arrayNoDuplicates!0 (_keys!5018 thiss!1248) #b00000000000000000000000000000000 Nil!1902))))

(declare-fun b!159382 () Bool)

(declare-fun res!75297 () Bool)

(assert (=> b!159382 (=> (not res!75297) (not e!104308))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!318 0))(
  ( (MissingZero!318 (index!3440 (_ BitVec 32))) (Found!318 (index!3441 (_ BitVec 32))) (Intermediate!318 (undefined!1130 Bool) (index!3442 (_ BitVec 32)) (x!17621 (_ BitVec 32))) (Undefined!318) (MissingVacant!318 (index!3443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5721 (_ BitVec 32)) SeekEntryResult!318)

(assert (=> b!159382 (= res!75297 ((_ is Undefined!318) (seekEntryOrOpen!0 key!828 (_keys!5018 thiss!1248) (mask!7769 thiss!1248))))))

(declare-fun mapNonEmpty!5684 () Bool)

(declare-fun mapRes!5684 () Bool)

(declare-fun tp!13157 () Bool)

(declare-fun e!104310 () Bool)

(assert (=> mapNonEmpty!5684 (= mapRes!5684 (and tp!13157 e!104310))))

(declare-fun mapKey!5684 () (_ BitVec 32))

(declare-fun mapValue!5684 () ValueCell!1322)

(declare-fun mapRest!5684 () (Array (_ BitVec 32) ValueCell!1322))

(assert (=> mapNonEmpty!5684 (= (arr!2705 (_values!3201 thiss!1248)) (store mapRest!5684 mapKey!5684 mapValue!5684))))

(declare-fun tp_is_empty!3331 () Bool)

(declare-fun e!104306 () Bool)

(declare-fun e!104307 () Bool)

(declare-fun array_inv!1733 (array!5721) Bool)

(declare-fun array_inv!1734 (array!5723) Bool)

(assert (=> b!159383 (= e!104307 (and tp!13156 tp_is_empty!3331 (array_inv!1733 (_keys!5018 thiss!1248)) (array_inv!1734 (_values!3201 thiss!1248)) e!104306))))

(declare-fun b!159384 () Bool)

(declare-fun res!75291 () Bool)

(assert (=> b!159384 (=> (not res!75291) (not e!104308))))

(assert (=> b!159384 (= res!75291 (and (= (size!2990 (_values!3201 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7769 thiss!1248))) (= (size!2989 (_keys!5018 thiss!1248)) (size!2990 (_values!3201 thiss!1248))) (bvsge (mask!7769 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2959 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2959 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5684 () Bool)

(assert (=> mapIsEmpty!5684 mapRes!5684))

(declare-fun res!75292 () Bool)

(assert (=> start!16072 (=> (not res!75292) (not e!104308))))

(declare-fun valid!728 (LongMapFixedSize!1552) Bool)

(assert (=> start!16072 (= res!75292 (valid!728 thiss!1248))))

(assert (=> start!16072 e!104308))

(assert (=> start!16072 e!104307))

(assert (=> start!16072 true))

(declare-fun b!159385 () Bool)

(declare-fun e!104311 () Bool)

(assert (=> b!159385 (= e!104311 tp_is_empty!3331)))

(declare-fun b!159386 () Bool)

(declare-fun res!75295 () Bool)

(assert (=> b!159386 (=> (not res!75295) (not e!104308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159386 (= res!75295 (validMask!0 (mask!7769 thiss!1248)))))

(declare-fun b!159387 () Bool)

(assert (=> b!159387 (= e!104306 (and e!104311 mapRes!5684))))

(declare-fun condMapEmpty!5684 () Bool)

(declare-fun mapDefault!5684 () ValueCell!1322)

(assert (=> b!159387 (= condMapEmpty!5684 (= (arr!2705 (_values!3201 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1322)) mapDefault!5684)))))

(declare-fun b!159388 () Bool)

(assert (=> b!159388 (= e!104310 tp_is_empty!3331)))

(declare-fun b!159389 () Bool)

(declare-fun res!75293 () Bool)

(assert (=> b!159389 (=> (not res!75293) (not e!104308))))

(assert (=> b!159389 (= res!75293 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159390 () Bool)

(declare-fun res!75294 () Bool)

(assert (=> b!159390 (=> (not res!75294) (not e!104308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5721 (_ BitVec 32)) Bool)

(assert (=> b!159390 (= res!75294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5018 thiss!1248) (mask!7769 thiss!1248)))))

(declare-fun b!159391 () Bool)

(declare-fun res!75296 () Bool)

(assert (=> b!159391 (=> (not res!75296) (not e!104308))))

(declare-datatypes ((tuple2!2854 0))(
  ( (tuple2!2855 (_1!1438 (_ BitVec 64)) (_2!1438 V!4089)) )
))
(declare-datatypes ((List!1906 0))(
  ( (Nil!1903) (Cons!1902 (h!2515 tuple2!2854) (t!6699 List!1906)) )
))
(declare-datatypes ((ListLongMap!1841 0))(
  ( (ListLongMap!1842 (toList!936 List!1906)) )
))
(declare-fun contains!975 (ListLongMap!1841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!586 (array!5721 array!5723 (_ BitVec 32) (_ BitVec 32) V!4089 V!4089 (_ BitVec 32) Int) ListLongMap!1841)

(assert (=> b!159391 (= res!75296 (contains!975 (getCurrentListMap!586 (_keys!5018 thiss!1248) (_values!3201 thiss!1248) (mask!7769 thiss!1248) (extraKeys!2959 thiss!1248) (zeroValue!3061 thiss!1248) (minValue!3061 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3218 thiss!1248)) key!828))))

(assert (= (and start!16072 res!75292) b!159389))

(assert (= (and b!159389 res!75293) b!159382))

(assert (= (and b!159382 res!75297) b!159391))

(assert (= (and b!159391 res!75296) b!159386))

(assert (= (and b!159386 res!75295) b!159384))

(assert (= (and b!159384 res!75291) b!159390))

(assert (= (and b!159390 res!75294) b!159381))

(assert (= (and b!159387 condMapEmpty!5684) mapIsEmpty!5684))

(assert (= (and b!159387 (not condMapEmpty!5684)) mapNonEmpty!5684))

(assert (= (and mapNonEmpty!5684 ((_ is ValueCellFull!1322) mapValue!5684)) b!159388))

(assert (= (and b!159387 ((_ is ValueCellFull!1322) mapDefault!5684)) b!159385))

(assert (= b!159383 b!159387))

(assert (= start!16072 b!159383))

(declare-fun m!191137 () Bool)

(assert (=> b!159391 m!191137))

(assert (=> b!159391 m!191137))

(declare-fun m!191139 () Bool)

(assert (=> b!159391 m!191139))

(declare-fun m!191141 () Bool)

(assert (=> b!159383 m!191141))

(declare-fun m!191143 () Bool)

(assert (=> b!159383 m!191143))

(declare-fun m!191145 () Bool)

(assert (=> start!16072 m!191145))

(declare-fun m!191147 () Bool)

(assert (=> b!159381 m!191147))

(declare-fun m!191149 () Bool)

(assert (=> mapNonEmpty!5684 m!191149))

(declare-fun m!191151 () Bool)

(assert (=> b!159382 m!191151))

(declare-fun m!191153 () Bool)

(assert (=> b!159390 m!191153))

(declare-fun m!191155 () Bool)

(assert (=> b!159386 m!191155))

(check-sat (not b_next!3529) (not b!159390) (not b!159383) (not b!159381) (not b!159391) b_and!9917 (not start!16072) (not b!159382) (not mapNonEmpty!5684) tp_is_empty!3331 (not b!159386))
(check-sat b_and!9917 (not b_next!3529))
