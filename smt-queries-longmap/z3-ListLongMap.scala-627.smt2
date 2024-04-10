; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16112 () Bool)

(assert start!16112)

(declare-fun b!160264 () Bool)

(declare-fun b_free!3573 () Bool)

(declare-fun b_next!3573 () Bool)

(assert (=> b!160264 (= b_free!3573 (not b_next!3573))))

(declare-fun tp!13288 () Bool)

(declare-fun b_and!9987 () Bool)

(assert (=> b!160264 (= tp!13288 b_and!9987)))

(declare-fun b!160254 () Bool)

(declare-fun e!104805 () Bool)

(declare-fun tp_is_empty!3375 () Bool)

(assert (=> b!160254 (= e!104805 tp_is_empty!3375)))

(declare-fun b!160255 () Bool)

(declare-fun res!75852 () Bool)

(declare-fun e!104806 () Bool)

(assert (=> b!160255 (=> (not res!75852) (not e!104806))))

(declare-datatypes ((V!4147 0))(
  ( (V!4148 (val!1732 Int)) )
))
(declare-datatypes ((ValueCell!1344 0))(
  ( (ValueCellFull!1344 (v!3597 V!4147)) (EmptyCell!1344) )
))
(declare-datatypes ((array!5829 0))(
  ( (array!5830 (arr!2759 (Array (_ BitVec 32) (_ BitVec 64))) (size!3043 (_ BitVec 32))) )
))
(declare-datatypes ((array!5831 0))(
  ( (array!5832 (arr!2760 (Array (_ BitVec 32) ValueCell!1344)) (size!3044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1596 0))(
  ( (LongMapFixedSize!1597 (defaultEntry!3240 Int) (mask!7806 (_ BitVec 32)) (extraKeys!2981 (_ BitVec 32)) (zeroValue!3083 V!4147) (minValue!3083 V!4147) (_size!847 (_ BitVec 32)) (_keys!5041 array!5829) (_values!3223 array!5831) (_vacant!847 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1596)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2912 0))(
  ( (tuple2!2913 (_1!1467 (_ BitVec 64)) (_2!1467 V!4147)) )
))
(declare-datatypes ((List!1935 0))(
  ( (Nil!1932) (Cons!1931 (h!2544 tuple2!2912) (t!6737 List!1935)) )
))
(declare-datatypes ((ListLongMap!1899 0))(
  ( (ListLongMap!1900 (toList!965 List!1935)) )
))
(declare-fun contains!1001 (ListLongMap!1899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!629 (array!5829 array!5831 (_ BitVec 32) (_ BitVec 32) V!4147 V!4147 (_ BitVec 32) Int) ListLongMap!1899)

(assert (=> b!160255 (= res!75852 (not (contains!1001 (getCurrentListMap!629 (_keys!5041 thiss!1248) (_values!3223 thiss!1248) (mask!7806 thiss!1248) (extraKeys!2981 thiss!1248) (zeroValue!3083 thiss!1248) (minValue!3083 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3240 thiss!1248)) key!828)))))

(declare-fun b!160256 () Bool)

(declare-fun res!75853 () Bool)

(assert (=> b!160256 (=> (not res!75853) (not e!104806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5829 (_ BitVec 32)) Bool)

(assert (=> b!160256 (= res!75853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5041 thiss!1248) (mask!7806 thiss!1248)))))

(declare-fun res!75854 () Bool)

(assert (=> start!16112 (=> (not res!75854) (not e!104806))))

(declare-fun valid!740 (LongMapFixedSize!1596) Bool)

(assert (=> start!16112 (= res!75854 (valid!740 thiss!1248))))

(assert (=> start!16112 e!104806))

(declare-fun e!104807 () Bool)

(assert (=> start!16112 e!104807))

(assert (=> start!16112 true))

(declare-fun b!160257 () Bool)

(declare-fun res!75850 () Bool)

(assert (=> b!160257 (=> (not res!75850) (not e!104806))))

(assert (=> b!160257 (= res!75850 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160258 () Bool)

(declare-fun e!104804 () Bool)

(declare-fun mapRes!5750 () Bool)

(assert (=> b!160258 (= e!104804 (and e!104805 mapRes!5750))))

(declare-fun condMapEmpty!5750 () Bool)

(declare-fun mapDefault!5750 () ValueCell!1344)

(assert (=> b!160258 (= condMapEmpty!5750 (= (arr!2760 (_values!3223 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1344)) mapDefault!5750)))))

(declare-fun b!160259 () Bool)

(declare-fun e!104808 () Bool)

(assert (=> b!160259 (= e!104808 tp_is_empty!3375)))

(declare-fun b!160260 () Bool)

(assert (=> b!160260 (= e!104806 false)))

(declare-fun lt!82072 () Bool)

(declare-datatypes ((List!1936 0))(
  ( (Nil!1933) (Cons!1932 (h!2545 (_ BitVec 64)) (t!6738 List!1936)) )
))
(declare-fun arrayNoDuplicates!0 (array!5829 (_ BitVec 32) List!1936) Bool)

(assert (=> b!160260 (= lt!82072 (arrayNoDuplicates!0 (_keys!5041 thiss!1248) #b00000000000000000000000000000000 Nil!1933))))

(declare-fun b!160261 () Bool)

(declare-fun res!75848 () Bool)

(assert (=> b!160261 (=> (not res!75848) (not e!104806))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!326 0))(
  ( (MissingZero!326 (index!3472 (_ BitVec 32))) (Found!326 (index!3473 (_ BitVec 32))) (Intermediate!326 (undefined!1138 Bool) (index!3474 (_ BitVec 32)) (x!17686 (_ BitVec 32))) (Undefined!326) (MissingVacant!326 (index!3475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5829 (_ BitVec 32)) SeekEntryResult!326)

(assert (=> b!160261 (= res!75848 ((_ is Undefined!326) (seekEntryOrOpen!0 key!828 (_keys!5041 thiss!1248) (mask!7806 thiss!1248))))))

(declare-fun mapNonEmpty!5750 () Bool)

(declare-fun tp!13289 () Bool)

(assert (=> mapNonEmpty!5750 (= mapRes!5750 (and tp!13289 e!104808))))

(declare-fun mapValue!5750 () ValueCell!1344)

(declare-fun mapRest!5750 () (Array (_ BitVec 32) ValueCell!1344))

(declare-fun mapKey!5750 () (_ BitVec 32))

(assert (=> mapNonEmpty!5750 (= (arr!2760 (_values!3223 thiss!1248)) (store mapRest!5750 mapKey!5750 mapValue!5750))))

(declare-fun b!160262 () Bool)

(declare-fun res!75851 () Bool)

(assert (=> b!160262 (=> (not res!75851) (not e!104806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160262 (= res!75851 (validMask!0 (mask!7806 thiss!1248)))))

(declare-fun b!160263 () Bool)

(declare-fun res!75849 () Bool)

(assert (=> b!160263 (=> (not res!75849) (not e!104806))))

(assert (=> b!160263 (= res!75849 (and (= (size!3044 (_values!3223 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7806 thiss!1248))) (= (size!3043 (_keys!5041 thiss!1248)) (size!3044 (_values!3223 thiss!1248))) (bvsge (mask!7806 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2981 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2981 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5750 () Bool)

(assert (=> mapIsEmpty!5750 mapRes!5750))

(declare-fun array_inv!1757 (array!5829) Bool)

(declare-fun array_inv!1758 (array!5831) Bool)

(assert (=> b!160264 (= e!104807 (and tp!13288 tp_is_empty!3375 (array_inv!1757 (_keys!5041 thiss!1248)) (array_inv!1758 (_values!3223 thiss!1248)) e!104804))))

(assert (= (and start!16112 res!75854) b!160257))

(assert (= (and b!160257 res!75850) b!160261))

(assert (= (and b!160261 res!75848) b!160255))

(assert (= (and b!160255 res!75852) b!160262))

(assert (= (and b!160262 res!75851) b!160263))

(assert (= (and b!160263 res!75849) b!160256))

(assert (= (and b!160256 res!75853) b!160260))

(assert (= (and b!160258 condMapEmpty!5750) mapIsEmpty!5750))

(assert (= (and b!160258 (not condMapEmpty!5750)) mapNonEmpty!5750))

(assert (= (and mapNonEmpty!5750 ((_ is ValueCellFull!1344) mapValue!5750)) b!160259))

(assert (= (and b!160258 ((_ is ValueCellFull!1344) mapDefault!5750)) b!160254))

(assert (= b!160264 b!160258))

(assert (= start!16112 b!160264))

(declare-fun m!192197 () Bool)

(assert (=> b!160256 m!192197))

(declare-fun m!192199 () Bool)

(assert (=> b!160255 m!192199))

(assert (=> b!160255 m!192199))

(declare-fun m!192201 () Bool)

(assert (=> b!160255 m!192201))

(declare-fun m!192203 () Bool)

(assert (=> b!160262 m!192203))

(declare-fun m!192205 () Bool)

(assert (=> start!16112 m!192205))

(declare-fun m!192207 () Bool)

(assert (=> b!160264 m!192207))

(declare-fun m!192209 () Bool)

(assert (=> b!160264 m!192209))

(declare-fun m!192211 () Bool)

(assert (=> b!160260 m!192211))

(declare-fun m!192213 () Bool)

(assert (=> mapNonEmpty!5750 m!192213))

(declare-fun m!192215 () Bool)

(assert (=> b!160261 m!192215))

(check-sat tp_is_empty!3375 b_and!9987 (not mapNonEmpty!5750) (not b!160256) (not b!160262) (not start!16112) (not b!160261) (not b!160264) (not b_next!3573) (not b!160260) (not b!160255))
(check-sat b_and!9987 (not b_next!3573))
