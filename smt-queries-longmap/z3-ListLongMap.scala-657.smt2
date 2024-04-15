; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16294 () Bool)

(assert start!16294)

(declare-fun b!162395 () Bool)

(declare-fun b_free!3751 () Bool)

(declare-fun b_next!3751 () Bool)

(assert (=> b!162395 (= b_free!3751 (not b_next!3751))))

(declare-fun tp!13823 () Bool)

(declare-fun b_and!10139 () Bool)

(assert (=> b!162395 (= tp!13823 b_and!10139)))

(declare-fun b!162392 () Bool)

(declare-fun res!76882 () Bool)

(declare-fun e!106448 () Bool)

(assert (=> b!162392 (=> (not res!76882) (not e!106448))))

(declare-datatypes ((V!4385 0))(
  ( (V!4386 (val!1821 Int)) )
))
(declare-datatypes ((ValueCell!1433 0))(
  ( (ValueCellFull!1433 (v!3680 V!4385)) (EmptyCell!1433) )
))
(declare-datatypes ((array!6165 0))(
  ( (array!6166 (arr!2926 (Array (_ BitVec 32) (_ BitVec 64))) (size!3211 (_ BitVec 32))) )
))
(declare-datatypes ((array!6167 0))(
  ( (array!6168 (arr!2927 (Array (_ BitVec 32) ValueCell!1433)) (size!3212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1774 0))(
  ( (LongMapFixedSize!1775 (defaultEntry!3329 Int) (mask!7954 (_ BitVec 32)) (extraKeys!3070 (_ BitVec 32)) (zeroValue!3172 V!4385) (minValue!3172 V!4385) (_size!936 (_ BitVec 32)) (_keys!5129 array!6165) (_values!3312 array!6167) (_vacant!936 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2984 0))(
  ( (tuple2!2985 (_1!1503 Bool) (_2!1503 LongMapFixedSize!1774)) )
))
(declare-fun lt!82298 () tuple2!2984)

(assert (=> b!162392 (= res!76882 (_1!1503 lt!82298))))

(declare-fun b!162393 () Bool)

(declare-fun e!106445 () Bool)

(assert (=> b!162393 (= e!106445 e!106448)))

(declare-fun res!76884 () Bool)

(assert (=> b!162393 (=> (not res!76884) (not e!106448))))

(declare-fun valid!803 (LongMapFixedSize!1774) Bool)

(assert (=> b!162393 (= res!76884 (valid!803 (_2!1503 lt!82298)))))

(declare-datatypes ((SeekEntryResult!395 0))(
  ( (MissingZero!395 (index!3748 (_ BitVec 32))) (Found!395 (index!3749 (_ BitVec 32))) (Intermediate!395 (undefined!1207 Bool) (index!3750 (_ BitVec 32)) (x!17994 (_ BitVec 32))) (Undefined!395) (MissingVacant!395 (index!3751 (_ BitVec 32))) )
))
(declare-fun lt!82297 () SeekEntryResult!395)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4385)

(declare-fun thiss!1248 () LongMapFixedSize!1774)

(declare-fun updateHelperNewKey!85 (LongMapFixedSize!1774 (_ BitVec 64) V!4385 (_ BitVec 32)) tuple2!2984)

(assert (=> b!162393 (= lt!82298 (updateHelperNewKey!85 thiss!1248 key!828 v!309 (index!3748 lt!82297)))))

(declare-fun b!162394 () Bool)

(declare-fun e!106446 () Bool)

(declare-fun tp_is_empty!3553 () Bool)

(assert (=> b!162394 (= e!106446 tp_is_empty!3553)))

(declare-fun e!106443 () Bool)

(declare-fun e!106449 () Bool)

(declare-fun array_inv!1885 (array!6165) Bool)

(declare-fun array_inv!1886 (array!6167) Bool)

(assert (=> b!162395 (= e!106443 (and tp!13823 tp_is_empty!3553 (array_inv!1885 (_keys!5129 thiss!1248)) (array_inv!1886 (_values!3312 thiss!1248)) e!106449))))

(declare-fun res!76880 () Bool)

(declare-fun e!106450 () Bool)

(assert (=> start!16294 (=> (not res!76880) (not e!106450))))

(assert (=> start!16294 (= res!76880 (valid!803 thiss!1248))))

(assert (=> start!16294 e!106450))

(assert (=> start!16294 e!106443))

(assert (=> start!16294 true))

(assert (=> start!16294 tp_is_empty!3553))

(declare-fun mapIsEmpty!6017 () Bool)

(declare-fun mapRes!6017 () Bool)

(assert (=> mapIsEmpty!6017 mapRes!6017))

(declare-fun b!162396 () Bool)

(declare-fun res!76883 () Bool)

(assert (=> b!162396 (=> (not res!76883) (not e!106450))))

(assert (=> b!162396 (= res!76883 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162397 () Bool)

(declare-fun e!106444 () Bool)

(assert (=> b!162397 (= e!106444 tp_is_empty!3553)))

(declare-fun b!162398 () Bool)

(assert (=> b!162398 (= e!106450 e!106445)))

(declare-fun res!76881 () Bool)

(assert (=> b!162398 (=> (not res!76881) (not e!106445))))

(get-info :version)

(assert (=> b!162398 (= res!76881 (and (not ((_ is Undefined!395) lt!82297)) (not ((_ is MissingVacant!395) lt!82297)) ((_ is MissingZero!395) lt!82297)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6165 (_ BitVec 32)) SeekEntryResult!395)

(assert (=> b!162398 (= lt!82297 (seekEntryOrOpen!0 key!828 (_keys!5129 thiss!1248) (mask!7954 thiss!1248)))))

(declare-fun b!162399 () Bool)

(assert (=> b!162399 (= e!106448 false)))

(declare-fun lt!82299 () Bool)

(declare-datatypes ((tuple2!2986 0))(
  ( (tuple2!2987 (_1!1504 (_ BitVec 64)) (_2!1504 V!4385)) )
))
(declare-datatypes ((List!1990 0))(
  ( (Nil!1987) (Cons!1986 (h!2599 tuple2!2986) (t!6783 List!1990)) )
))
(declare-datatypes ((ListLongMap!1941 0))(
  ( (ListLongMap!1942 (toList!986 List!1990)) )
))
(declare-fun contains!1025 (ListLongMap!1941 (_ BitVec 64)) Bool)

(declare-fun map!1675 (LongMapFixedSize!1774) ListLongMap!1941)

(assert (=> b!162399 (= lt!82299 (contains!1025 (map!1675 (_2!1503 lt!82298)) key!828))))

(declare-fun mapNonEmpty!6017 () Bool)

(declare-fun tp!13822 () Bool)

(assert (=> mapNonEmpty!6017 (= mapRes!6017 (and tp!13822 e!106446))))

(declare-fun mapRest!6017 () (Array (_ BitVec 32) ValueCell!1433))

(declare-fun mapKey!6017 () (_ BitVec 32))

(declare-fun mapValue!6017 () ValueCell!1433)

(assert (=> mapNonEmpty!6017 (= (arr!2927 (_values!3312 thiss!1248)) (store mapRest!6017 mapKey!6017 mapValue!6017))))

(declare-fun b!162400 () Bool)

(assert (=> b!162400 (= e!106449 (and e!106444 mapRes!6017))))

(declare-fun condMapEmpty!6017 () Bool)

(declare-fun mapDefault!6017 () ValueCell!1433)

(assert (=> b!162400 (= condMapEmpty!6017 (= (arr!2927 (_values!3312 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1433)) mapDefault!6017)))))

(assert (= (and start!16294 res!76880) b!162396))

(assert (= (and b!162396 res!76883) b!162398))

(assert (= (and b!162398 res!76881) b!162393))

(assert (= (and b!162393 res!76884) b!162392))

(assert (= (and b!162392 res!76882) b!162399))

(assert (= (and b!162400 condMapEmpty!6017) mapIsEmpty!6017))

(assert (= (and b!162400 (not condMapEmpty!6017)) mapNonEmpty!6017))

(assert (= (and mapNonEmpty!6017 ((_ is ValueCellFull!1433) mapValue!6017)) b!162394))

(assert (= (and b!162400 ((_ is ValueCellFull!1433) mapDefault!6017)) b!162397))

(assert (= b!162395 b!162400))

(assert (= start!16294 b!162395))

(declare-fun m!192997 () Bool)

(assert (=> b!162398 m!192997))

(declare-fun m!192999 () Bool)

(assert (=> b!162399 m!192999))

(assert (=> b!162399 m!192999))

(declare-fun m!193001 () Bool)

(assert (=> b!162399 m!193001))

(declare-fun m!193003 () Bool)

(assert (=> b!162393 m!193003))

(declare-fun m!193005 () Bool)

(assert (=> b!162393 m!193005))

(declare-fun m!193007 () Bool)

(assert (=> b!162395 m!193007))

(declare-fun m!193009 () Bool)

(assert (=> b!162395 m!193009))

(declare-fun m!193011 () Bool)

(assert (=> mapNonEmpty!6017 m!193011))

(declare-fun m!193013 () Bool)

(assert (=> start!16294 m!193013))

(check-sat (not b!162393) b_and!10139 tp_is_empty!3553 (not mapNonEmpty!6017) (not b!162399) (not start!16294) (not b!162395) (not b_next!3751) (not b!162398))
(check-sat b_and!10139 (not b_next!3751))
