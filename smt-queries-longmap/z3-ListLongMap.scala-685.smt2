; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16616 () Bool)

(assert start!16616)

(declare-fun b!165836 () Bool)

(declare-fun b_free!3921 () Bool)

(declare-fun b_next!3921 () Bool)

(assert (=> b!165836 (= b_free!3921 (not b_next!3921))))

(declare-fun tp!14363 () Bool)

(declare-fun b_and!10335 () Bool)

(assert (=> b!165836 (= tp!14363 b_and!10335)))

(declare-fun b!165833 () Bool)

(declare-fun res!78746 () Bool)

(declare-fun e!108773 () Bool)

(assert (=> b!165833 (=> (not res!78746) (not e!108773))))

(declare-datatypes ((V!4611 0))(
  ( (V!4612 (val!1906 Int)) )
))
(declare-datatypes ((ValueCell!1518 0))(
  ( (ValueCellFull!1518 (v!3771 V!4611)) (EmptyCell!1518) )
))
(declare-datatypes ((array!6543 0))(
  ( (array!6544 (arr!3107 (Array (_ BitVec 32) (_ BitVec 64))) (size!3395 (_ BitVec 32))) )
))
(declare-datatypes ((array!6545 0))(
  ( (array!6546 (arr!3108 (Array (_ BitVec 32) ValueCell!1518)) (size!3396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1944 0))(
  ( (LongMapFixedSize!1945 (defaultEntry!3414 Int) (mask!8133 (_ BitVec 32)) (extraKeys!3155 (_ BitVec 32)) (zeroValue!3257 V!4611) (minValue!3257 V!4611) (_size!1021 (_ BitVec 32)) (_keys!5239 array!6543) (_values!3397 array!6545) (_vacant!1021 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1944)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3084 0))(
  ( (tuple2!3085 (_1!1553 (_ BitVec 64)) (_2!1553 V!4611)) )
))
(declare-datatypes ((List!2070 0))(
  ( (Nil!2067) (Cons!2066 (h!2683 tuple2!3084) (t!6872 List!2070)) )
))
(declare-datatypes ((ListLongMap!2039 0))(
  ( (ListLongMap!2040 (toList!1035 List!2070)) )
))
(declare-fun contains!1077 (ListLongMap!2039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!693 (array!6543 array!6545 (_ BitVec 32) (_ BitVec 32) V!4611 V!4611 (_ BitVec 32) Int) ListLongMap!2039)

(assert (=> b!165833 (= res!78746 (not (contains!1077 (getCurrentListMap!693 (_keys!5239 thiss!1248) (_values!3397 thiss!1248) (mask!8133 thiss!1248) (extraKeys!3155 thiss!1248) (zeroValue!3257 thiss!1248) (minValue!3257 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3414 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6303 () Bool)

(declare-fun mapRes!6303 () Bool)

(declare-fun tp!14364 () Bool)

(declare-fun e!108779 () Bool)

(assert (=> mapNonEmpty!6303 (= mapRes!6303 (and tp!14364 e!108779))))

(declare-fun mapValue!6303 () ValueCell!1518)

(declare-fun mapKey!6303 () (_ BitVec 32))

(declare-fun mapRest!6303 () (Array (_ BitVec 32) ValueCell!1518))

(assert (=> mapNonEmpty!6303 (= (arr!3108 (_values!3397 thiss!1248)) (store mapRest!6303 mapKey!6303 mapValue!6303))))

(declare-fun b!165835 () Bool)

(declare-fun res!78742 () Bool)

(assert (=> b!165835 (=> (not res!78742) (not e!108773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6543 (_ BitVec 32)) Bool)

(assert (=> b!165835 (= res!78742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5239 thiss!1248) (mask!8133 thiss!1248)))))

(declare-fun e!108776 () Bool)

(declare-fun tp_is_empty!3723 () Bool)

(declare-fun e!108775 () Bool)

(declare-fun array_inv!1993 (array!6543) Bool)

(declare-fun array_inv!1994 (array!6545) Bool)

(assert (=> b!165836 (= e!108775 (and tp!14363 tp_is_empty!3723 (array_inv!1993 (_keys!5239 thiss!1248)) (array_inv!1994 (_values!3397 thiss!1248)) e!108776))))

(declare-fun b!165837 () Bool)

(declare-fun res!78743 () Bool)

(assert (=> b!165837 (=> (not res!78743) (not e!108773))))

(assert (=> b!165837 (= res!78743 (and (= (size!3396 (_values!3397 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8133 thiss!1248))) (= (size!3395 (_keys!5239 thiss!1248)) (size!3396 (_values!3397 thiss!1248))) (bvsge (mask!8133 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3155 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3155 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165838 () Bool)

(declare-fun res!78744 () Bool)

(declare-fun e!108778 () Bool)

(assert (=> b!165838 (=> (not res!78744) (not e!108778))))

(assert (=> b!165838 (= res!78744 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6303 () Bool)

(assert (=> mapIsEmpty!6303 mapRes!6303))

(declare-fun b!165839 () Bool)

(assert (=> b!165839 (= e!108773 false)))

(declare-fun lt!83142 () Bool)

(declare-datatypes ((List!2071 0))(
  ( (Nil!2068) (Cons!2067 (h!2684 (_ BitVec 64)) (t!6873 List!2071)) )
))
(declare-fun arrayNoDuplicates!0 (array!6543 (_ BitVec 32) List!2071) Bool)

(assert (=> b!165839 (= lt!83142 (arrayNoDuplicates!0 (_keys!5239 thiss!1248) #b00000000000000000000000000000000 Nil!2068))))

(declare-fun res!78741 () Bool)

(assert (=> start!16616 (=> (not res!78741) (not e!108778))))

(declare-fun valid!858 (LongMapFixedSize!1944) Bool)

(assert (=> start!16616 (= res!78741 (valid!858 thiss!1248))))

(assert (=> start!16616 e!108778))

(assert (=> start!16616 e!108775))

(assert (=> start!16616 true))

(declare-fun b!165834 () Bool)

(declare-fun e!108777 () Bool)

(assert (=> b!165834 (= e!108776 (and e!108777 mapRes!6303))))

(declare-fun condMapEmpty!6303 () Bool)

(declare-fun mapDefault!6303 () ValueCell!1518)

(assert (=> b!165834 (= condMapEmpty!6303 (= (arr!3108 (_values!3397 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1518)) mapDefault!6303)))))

(declare-fun b!165840 () Bool)

(assert (=> b!165840 (= e!108779 tp_is_empty!3723)))

(declare-fun b!165841 () Bool)

(declare-fun res!78747 () Bool)

(assert (=> b!165841 (=> (not res!78747) (not e!108773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165841 (= res!78747 (validMask!0 (mask!8133 thiss!1248)))))

(declare-fun b!165842 () Bool)

(assert (=> b!165842 (= e!108777 tp_is_empty!3723)))

(declare-fun b!165843 () Bool)

(assert (=> b!165843 (= e!108778 e!108773)))

(declare-fun res!78745 () Bool)

(assert (=> b!165843 (=> (not res!78745) (not e!108773))))

(declare-datatypes ((SeekEntryResult!443 0))(
  ( (MissingZero!443 (index!3940 (_ BitVec 32))) (Found!443 (index!3941 (_ BitVec 32))) (Intermediate!443 (undefined!1255 Bool) (index!3942 (_ BitVec 32)) (x!18375 (_ BitVec 32))) (Undefined!443) (MissingVacant!443 (index!3943 (_ BitVec 32))) )
))
(declare-fun lt!83143 () SeekEntryResult!443)

(get-info :version)

(assert (=> b!165843 (= res!78745 (and (not ((_ is Undefined!443) lt!83143)) (not ((_ is MissingVacant!443) lt!83143)) (not ((_ is MissingZero!443) lt!83143)) ((_ is Found!443) lt!83143)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6543 (_ BitVec 32)) SeekEntryResult!443)

(assert (=> b!165843 (= lt!83143 (seekEntryOrOpen!0 key!828 (_keys!5239 thiss!1248) (mask!8133 thiss!1248)))))

(assert (= (and start!16616 res!78741) b!165838))

(assert (= (and b!165838 res!78744) b!165843))

(assert (= (and b!165843 res!78745) b!165833))

(assert (= (and b!165833 res!78746) b!165841))

(assert (= (and b!165841 res!78747) b!165837))

(assert (= (and b!165837 res!78743) b!165835))

(assert (= (and b!165835 res!78742) b!165839))

(assert (= (and b!165834 condMapEmpty!6303) mapIsEmpty!6303))

(assert (= (and b!165834 (not condMapEmpty!6303)) mapNonEmpty!6303))

(assert (= (and mapNonEmpty!6303 ((_ is ValueCellFull!1518) mapValue!6303)) b!165840))

(assert (= (and b!165834 ((_ is ValueCellFull!1518) mapDefault!6303)) b!165842))

(assert (= b!165836 b!165834))

(assert (= start!16616 b!165836))

(declare-fun m!195491 () Bool)

(assert (=> b!165843 m!195491))

(declare-fun m!195493 () Bool)

(assert (=> mapNonEmpty!6303 m!195493))

(declare-fun m!195495 () Bool)

(assert (=> start!16616 m!195495))

(declare-fun m!195497 () Bool)

(assert (=> b!165841 m!195497))

(declare-fun m!195499 () Bool)

(assert (=> b!165833 m!195499))

(assert (=> b!165833 m!195499))

(declare-fun m!195501 () Bool)

(assert (=> b!165833 m!195501))

(declare-fun m!195503 () Bool)

(assert (=> b!165839 m!195503))

(declare-fun m!195505 () Bool)

(assert (=> b!165835 m!195505))

(declare-fun m!195507 () Bool)

(assert (=> b!165836 m!195507))

(declare-fun m!195509 () Bool)

(assert (=> b!165836 m!195509))

(check-sat (not b!165835) b_and!10335 (not b!165836) (not start!16616) (not mapNonEmpty!6303) (not b!165841) (not b!165843) (not b!165833) (not b!165839) (not b_next!3921) tp_is_empty!3723)
(check-sat b_and!10335 (not b_next!3921))
