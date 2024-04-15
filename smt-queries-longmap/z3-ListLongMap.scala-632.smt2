; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16144 () Bool)

(assert start!16144)

(declare-fun b!160572 () Bool)

(declare-fun b_free!3601 () Bool)

(declare-fun b_next!3601 () Bool)

(assert (=> b!160572 (= b_free!3601 (not b_next!3601))))

(declare-fun tp!13373 () Bool)

(declare-fun b_and!9989 () Bool)

(assert (=> b!160572 (= tp!13373 b_and!9989)))

(declare-fun b!160570 () Bool)

(declare-fun res!76051 () Bool)

(declare-fun e!104956 () Bool)

(assert (=> b!160570 (=> (not res!76051) (not e!104956))))

(declare-datatypes ((V!4185 0))(
  ( (V!4186 (val!1746 Int)) )
))
(declare-datatypes ((ValueCell!1358 0))(
  ( (ValueCellFull!1358 (v!3605 V!4185)) (EmptyCell!1358) )
))
(declare-datatypes ((array!5865 0))(
  ( (array!5866 (arr!2776 (Array (_ BitVec 32) (_ BitVec 64))) (size!3061 (_ BitVec 32))) )
))
(declare-datatypes ((array!5867 0))(
  ( (array!5868 (arr!2777 (Array (_ BitVec 32) ValueCell!1358)) (size!3062 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1624 0))(
  ( (LongMapFixedSize!1625 (defaultEntry!3254 Int) (mask!7829 (_ BitVec 32)) (extraKeys!2995 (_ BitVec 32)) (zeroValue!3097 V!4185) (minValue!3097 V!4185) (_size!861 (_ BitVec 32)) (_keys!5054 array!5865) (_values!3237 array!5867) (_vacant!861 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1624)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2906 0))(
  ( (tuple2!2907 (_1!1464 (_ BitVec 64)) (_2!1464 V!4185)) )
))
(declare-datatypes ((List!1956 0))(
  ( (Nil!1953) (Cons!1952 (h!2565 tuple2!2906) (t!6749 List!1956)) )
))
(declare-datatypes ((ListLongMap!1893 0))(
  ( (ListLongMap!1894 (toList!962 List!1956)) )
))
(declare-fun contains!1001 (ListLongMap!1893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!612 (array!5865 array!5867 (_ BitVec 32) (_ BitVec 32) V!4185 V!4185 (_ BitVec 32) Int) ListLongMap!1893)

(assert (=> b!160570 (= res!76051 (not (contains!1001 (getCurrentListMap!612 (_keys!5054 thiss!1248) (_values!3237 thiss!1248) (mask!7829 thiss!1248) (extraKeys!2995 thiss!1248) (zeroValue!3097 thiss!1248) (minValue!3097 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3254 thiss!1248)) key!828)))))

(declare-fun b!160571 () Bool)

(declare-fun res!76048 () Bool)

(assert (=> b!160571 (=> (not res!76048) (not e!104956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5865 (_ BitVec 32)) Bool)

(assert (=> b!160571 (= res!76048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5054 thiss!1248) (mask!7829 thiss!1248)))))

(declare-fun e!104955 () Bool)

(declare-fun tp_is_empty!3403 () Bool)

(declare-fun e!104958 () Bool)

(declare-fun array_inv!1785 (array!5865) Bool)

(declare-fun array_inv!1786 (array!5867) Bool)

(assert (=> b!160572 (= e!104958 (and tp!13373 tp_is_empty!3403 (array_inv!1785 (_keys!5054 thiss!1248)) (array_inv!1786 (_values!3237 thiss!1248)) e!104955))))

(declare-fun b!160573 () Bool)

(declare-fun res!76052 () Bool)

(assert (=> b!160573 (=> (not res!76052) (not e!104956))))

(assert (=> b!160573 (= res!76052 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160574 () Bool)

(declare-fun e!104959 () Bool)

(assert (=> b!160574 (= e!104959 tp_is_empty!3403)))

(declare-fun b!160575 () Bool)

(declare-fun res!76047 () Bool)

(assert (=> b!160575 (=> (not res!76047) (not e!104956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160575 (= res!76047 (validMask!0 (mask!7829 thiss!1248)))))

(declare-fun mapIsEmpty!5792 () Bool)

(declare-fun mapRes!5792 () Bool)

(assert (=> mapIsEmpty!5792 mapRes!5792))

(declare-fun res!76049 () Bool)

(assert (=> start!16144 (=> (not res!76049) (not e!104956))))

(declare-fun valid!751 (LongMapFixedSize!1624) Bool)

(assert (=> start!16144 (= res!76049 (valid!751 thiss!1248))))

(assert (=> start!16144 e!104956))

(assert (=> start!16144 e!104958))

(assert (=> start!16144 true))

(declare-fun b!160569 () Bool)

(assert (=> b!160569 (= e!104956 false)))

(declare-fun lt!81933 () Bool)

(declare-datatypes ((List!1957 0))(
  ( (Nil!1954) (Cons!1953 (h!2566 (_ BitVec 64)) (t!6750 List!1957)) )
))
(declare-fun arrayNoDuplicates!0 (array!5865 (_ BitVec 32) List!1957) Bool)

(assert (=> b!160569 (= lt!81933 (arrayNoDuplicates!0 (_keys!5054 thiss!1248) #b00000000000000000000000000000000 Nil!1954))))

(declare-fun b!160576 () Bool)

(declare-fun e!104954 () Bool)

(assert (=> b!160576 (= e!104954 tp_is_empty!3403)))

(declare-fun mapNonEmpty!5792 () Bool)

(declare-fun tp!13372 () Bool)

(assert (=> mapNonEmpty!5792 (= mapRes!5792 (and tp!13372 e!104954))))

(declare-fun mapValue!5792 () ValueCell!1358)

(declare-fun mapRest!5792 () (Array (_ BitVec 32) ValueCell!1358))

(declare-fun mapKey!5792 () (_ BitVec 32))

(assert (=> mapNonEmpty!5792 (= (arr!2777 (_values!3237 thiss!1248)) (store mapRest!5792 mapKey!5792 mapValue!5792))))

(declare-fun b!160577 () Bool)

(declare-fun res!76053 () Bool)

(assert (=> b!160577 (=> (not res!76053) (not e!104956))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!345 0))(
  ( (MissingZero!345 (index!3548 (_ BitVec 32))) (Found!345 (index!3549 (_ BitVec 32))) (Intermediate!345 (undefined!1157 Bool) (index!3550 (_ BitVec 32)) (x!17744 (_ BitVec 32))) (Undefined!345) (MissingVacant!345 (index!3551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5865 (_ BitVec 32)) SeekEntryResult!345)

(assert (=> b!160577 (= res!76053 ((_ is Undefined!345) (seekEntryOrOpen!0 key!828 (_keys!5054 thiss!1248) (mask!7829 thiss!1248))))))

(declare-fun b!160578 () Bool)

(declare-fun res!76050 () Bool)

(assert (=> b!160578 (=> (not res!76050) (not e!104956))))

(assert (=> b!160578 (= res!76050 (and (= (size!3062 (_values!3237 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7829 thiss!1248))) (= (size!3061 (_keys!5054 thiss!1248)) (size!3062 (_values!3237 thiss!1248))) (bvsge (mask!7829 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2995 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2995 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160579 () Bool)

(assert (=> b!160579 (= e!104955 (and e!104959 mapRes!5792))))

(declare-fun condMapEmpty!5792 () Bool)

(declare-fun mapDefault!5792 () ValueCell!1358)

(assert (=> b!160579 (= condMapEmpty!5792 (= (arr!2777 (_values!3237 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1358)) mapDefault!5792)))))

(assert (= (and start!16144 res!76049) b!160573))

(assert (= (and b!160573 res!76052) b!160577))

(assert (= (and b!160577 res!76053) b!160570))

(assert (= (and b!160570 res!76051) b!160575))

(assert (= (and b!160575 res!76047) b!160578))

(assert (= (and b!160578 res!76050) b!160571))

(assert (= (and b!160571 res!76048) b!160569))

(assert (= (and b!160579 condMapEmpty!5792) mapIsEmpty!5792))

(assert (= (and b!160579 (not condMapEmpty!5792)) mapNonEmpty!5792))

(assert (= (and mapNonEmpty!5792 ((_ is ValueCellFull!1358) mapValue!5792)) b!160576))

(assert (= (and b!160579 ((_ is ValueCellFull!1358) mapDefault!5792)) b!160574))

(assert (= b!160572 b!160579))

(assert (= start!16144 b!160572))

(declare-fun m!191857 () Bool)

(assert (=> b!160571 m!191857))

(declare-fun m!191859 () Bool)

(assert (=> b!160572 m!191859))

(declare-fun m!191861 () Bool)

(assert (=> b!160572 m!191861))

(declare-fun m!191863 () Bool)

(assert (=> b!160575 m!191863))

(declare-fun m!191865 () Bool)

(assert (=> b!160569 m!191865))

(declare-fun m!191867 () Bool)

(assert (=> mapNonEmpty!5792 m!191867))

(declare-fun m!191869 () Bool)

(assert (=> start!16144 m!191869))

(declare-fun m!191871 () Bool)

(assert (=> b!160577 m!191871))

(declare-fun m!191873 () Bool)

(assert (=> b!160570 m!191873))

(assert (=> b!160570 m!191873))

(declare-fun m!191875 () Bool)

(assert (=> b!160570 m!191875))

(check-sat (not b!160572) (not b!160577) (not b!160571) (not start!16144) (not mapNonEmpty!5792) (not b!160569) (not b!160570) tp_is_empty!3403 b_and!9989 (not b!160575) (not b_next!3601))
(check-sat b_and!9989 (not b_next!3601))
