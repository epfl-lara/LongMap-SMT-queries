; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16534 () Bool)

(assert start!16534)

(declare-fun b!164461 () Bool)

(declare-fun b_free!3835 () Bool)

(declare-fun b_next!3835 () Bool)

(assert (=> b!164461 (= b_free!3835 (not b_next!3835))))

(declare-fun tp!14106 () Bool)

(declare-fun b_and!10263 () Bool)

(assert (=> b!164461 (= tp!14106 b_and!10263)))

(declare-fun mapIsEmpty!6174 () Bool)

(declare-fun mapRes!6174 () Bool)

(assert (=> mapIsEmpty!6174 mapRes!6174))

(declare-fun e!107900 () Bool)

(declare-datatypes ((V!4497 0))(
  ( (V!4498 (val!1863 Int)) )
))
(declare-datatypes ((ValueCell!1475 0))(
  ( (ValueCellFull!1475 (v!3729 V!4497)) (EmptyCell!1475) )
))
(declare-datatypes ((array!6357 0))(
  ( (array!6358 (arr!3014 (Array (_ BitVec 32) (_ BitVec 64))) (size!3302 (_ BitVec 32))) )
))
(declare-datatypes ((array!6359 0))(
  ( (array!6360 (arr!3015 (Array (_ BitVec 32) ValueCell!1475)) (size!3303 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1858 0))(
  ( (LongMapFixedSize!1859 (defaultEntry!3371 Int) (mask!8062 (_ BitVec 32)) (extraKeys!3112 (_ BitVec 32)) (zeroValue!3214 V!4497) (minValue!3214 V!4497) (_size!978 (_ BitVec 32)) (_keys!5196 array!6357) (_values!3354 array!6359) (_vacant!978 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1858)

(declare-fun tp_is_empty!3637 () Bool)

(declare-fun e!107895 () Bool)

(declare-fun array_inv!1933 (array!6357) Bool)

(declare-fun array_inv!1934 (array!6359) Bool)

(assert (=> b!164461 (= e!107900 (and tp!14106 tp_is_empty!3637 (array_inv!1933 (_keys!5196 thiss!1248)) (array_inv!1934 (_values!3354 thiss!1248)) e!107895))))

(declare-fun b!164462 () Bool)

(declare-fun res!77860 () Bool)

(declare-fun e!107898 () Bool)

(assert (=> b!164462 (=> (not res!77860) (not e!107898))))

(assert (=> b!164462 (= res!77860 (and (= (size!3303 (_values!3354 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8062 thiss!1248))) (= (size!3302 (_keys!5196 thiss!1248)) (size!3303 (_values!3354 thiss!1248))) (bvsge (mask!8062 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3112 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3112 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164463 () Bool)

(declare-fun e!107899 () Bool)

(assert (=> b!164463 (= e!107899 tp_is_empty!3637)))

(declare-fun b!164464 () Bool)

(declare-fun res!77859 () Bool)

(assert (=> b!164464 (=> (not res!77859) (not e!107898))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2976 0))(
  ( (tuple2!2977 (_1!1499 (_ BitVec 64)) (_2!1499 V!4497)) )
))
(declare-datatypes ((List!1999 0))(
  ( (Nil!1996) (Cons!1995 (h!2612 tuple2!2976) (t!6793 List!1999)) )
))
(declare-datatypes ((ListLongMap!1937 0))(
  ( (ListLongMap!1938 (toList!984 List!1999)) )
))
(declare-fun contains!1036 (ListLongMap!1937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!646 (array!6357 array!6359 (_ BitVec 32) (_ BitVec 32) V!4497 V!4497 (_ BitVec 32) Int) ListLongMap!1937)

(assert (=> b!164464 (= res!77859 (contains!1036 (getCurrentListMap!646 (_keys!5196 thiss!1248) (_values!3354 thiss!1248) (mask!8062 thiss!1248) (extraKeys!3112 thiss!1248) (zeroValue!3214 thiss!1248) (minValue!3214 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3371 thiss!1248)) key!828))))

(declare-fun b!164465 () Bool)

(assert (=> b!164465 (= e!107895 (and e!107899 mapRes!6174))))

(declare-fun condMapEmpty!6174 () Bool)

(declare-fun mapDefault!6174 () ValueCell!1475)

(assert (=> b!164465 (= condMapEmpty!6174 (= (arr!3015 (_values!3354 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1475)) mapDefault!6174)))))

(declare-fun b!164466 () Bool)

(declare-fun e!107897 () Bool)

(assert (=> b!164466 (= e!107897 tp_is_empty!3637)))

(declare-fun b!164467 () Bool)

(declare-fun res!77861 () Bool)

(declare-fun e!107896 () Bool)

(assert (=> b!164467 (=> (not res!77861) (not e!107896))))

(assert (=> b!164467 (= res!77861 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164468 () Bool)

(declare-fun res!77865 () Bool)

(assert (=> b!164468 (=> (not res!77865) (not e!107898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164468 (= res!77865 (validMask!0 (mask!8062 thiss!1248)))))

(declare-fun mapNonEmpty!6174 () Bool)

(declare-fun tp!14105 () Bool)

(assert (=> mapNonEmpty!6174 (= mapRes!6174 (and tp!14105 e!107897))))

(declare-fun mapKey!6174 () (_ BitVec 32))

(declare-fun mapRest!6174 () (Array (_ BitVec 32) ValueCell!1475))

(declare-fun mapValue!6174 () ValueCell!1475)

(assert (=> mapNonEmpty!6174 (= (arr!3015 (_values!3354 thiss!1248)) (store mapRest!6174 mapKey!6174 mapValue!6174))))

(declare-fun b!164469 () Bool)

(declare-fun res!77864 () Bool)

(assert (=> b!164469 (=> (not res!77864) (not e!107898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6357 (_ BitVec 32)) Bool)

(assert (=> b!164469 (= res!77864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5196 thiss!1248) (mask!8062 thiss!1248)))))

(declare-fun b!164470 () Bool)

(assert (=> b!164470 (= e!107898 false)))

(declare-fun lt!82944 () Bool)

(declare-datatypes ((List!2000 0))(
  ( (Nil!1997) (Cons!1996 (h!2613 (_ BitVec 64)) (t!6794 List!2000)) )
))
(declare-fun arrayNoDuplicates!0 (array!6357 (_ BitVec 32) List!2000) Bool)

(assert (=> b!164470 (= lt!82944 (arrayNoDuplicates!0 (_keys!5196 thiss!1248) #b00000000000000000000000000000000 Nil!1997))))

(declare-fun b!164471 () Bool)

(assert (=> b!164471 (= e!107896 e!107898)))

(declare-fun res!77863 () Bool)

(assert (=> b!164471 (=> (not res!77863) (not e!107898))))

(declare-datatypes ((SeekEntryResult!409 0))(
  ( (MissingZero!409 (index!3804 (_ BitVec 32))) (Found!409 (index!3805 (_ BitVec 32))) (Intermediate!409 (undefined!1221 Bool) (index!3806 (_ BitVec 32)) (x!18229 (_ BitVec 32))) (Undefined!409) (MissingVacant!409 (index!3807 (_ BitVec 32))) )
))
(declare-fun lt!82943 () SeekEntryResult!409)

(get-info :version)

(assert (=> b!164471 (= res!77863 (and (not ((_ is Undefined!409) lt!82943)) (not ((_ is MissingVacant!409) lt!82943)) (not ((_ is MissingZero!409) lt!82943)) ((_ is Found!409) lt!82943)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6357 (_ BitVec 32)) SeekEntryResult!409)

(assert (=> b!164471 (= lt!82943 (seekEntryOrOpen!0 key!828 (_keys!5196 thiss!1248) (mask!8062 thiss!1248)))))

(declare-fun res!77862 () Bool)

(assert (=> start!16534 (=> (not res!77862) (not e!107896))))

(declare-fun valid!846 (LongMapFixedSize!1858) Bool)

(assert (=> start!16534 (= res!77862 (valid!846 thiss!1248))))

(assert (=> start!16534 e!107896))

(assert (=> start!16534 e!107900))

(assert (=> start!16534 true))

(assert (= (and start!16534 res!77862) b!164467))

(assert (= (and b!164467 res!77861) b!164471))

(assert (= (and b!164471 res!77863) b!164464))

(assert (= (and b!164464 res!77859) b!164468))

(assert (= (and b!164468 res!77865) b!164462))

(assert (= (and b!164462 res!77860) b!164469))

(assert (= (and b!164469 res!77864) b!164470))

(assert (= (and b!164465 condMapEmpty!6174) mapIsEmpty!6174))

(assert (= (and b!164465 (not condMapEmpty!6174)) mapNonEmpty!6174))

(assert (= (and mapNonEmpty!6174 ((_ is ValueCellFull!1475) mapValue!6174)) b!164466))

(assert (= (and b!164465 ((_ is ValueCellFull!1475) mapDefault!6174)) b!164463))

(assert (= b!164461 b!164465))

(assert (= start!16534 b!164461))

(declare-fun m!194813 () Bool)

(assert (=> b!164464 m!194813))

(assert (=> b!164464 m!194813))

(declare-fun m!194815 () Bool)

(assert (=> b!164464 m!194815))

(declare-fun m!194817 () Bool)

(assert (=> start!16534 m!194817))

(declare-fun m!194819 () Bool)

(assert (=> b!164469 m!194819))

(declare-fun m!194821 () Bool)

(assert (=> mapNonEmpty!6174 m!194821))

(declare-fun m!194823 () Bool)

(assert (=> b!164471 m!194823))

(declare-fun m!194825 () Bool)

(assert (=> b!164468 m!194825))

(declare-fun m!194827 () Bool)

(assert (=> b!164461 m!194827))

(declare-fun m!194829 () Bool)

(assert (=> b!164461 m!194829))

(declare-fun m!194831 () Bool)

(assert (=> b!164470 m!194831))

(check-sat (not b!164469) (not b!164470) (not start!16534) (not b_next!3835) (not mapNonEmpty!6174) tp_is_empty!3637 b_and!10263 (not b!164464) (not b!164461) (not b!164468) (not b!164471))
(check-sat b_and!10263 (not b_next!3835))
