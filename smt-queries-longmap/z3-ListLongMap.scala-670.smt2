; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16528 () Bool)

(assert start!16528)

(declare-fun b!164174 () Bool)

(declare-fun b_free!3829 () Bool)

(declare-fun b_next!3829 () Bool)

(assert (=> b!164174 (= b_free!3829 (not b_next!3829))))

(declare-fun tp!14087 () Bool)

(declare-fun b_and!10217 () Bool)

(assert (=> b!164174 (= tp!14087 b_and!10217)))

(declare-fun mapIsEmpty!6165 () Bool)

(declare-fun mapRes!6165 () Bool)

(assert (=> mapIsEmpty!6165 mapRes!6165))

(declare-fun res!77683 () Bool)

(declare-fun e!107708 () Bool)

(assert (=> start!16528 (=> (not res!77683) (not e!107708))))

(declare-datatypes ((V!4489 0))(
  ( (V!4490 (val!1860 Int)) )
))
(declare-datatypes ((ValueCell!1472 0))(
  ( (ValueCellFull!1472 (v!3719 V!4489)) (EmptyCell!1472) )
))
(declare-datatypes ((array!6339 0))(
  ( (array!6340 (arr!3004 (Array (_ BitVec 32) (_ BitVec 64))) (size!3293 (_ BitVec 32))) )
))
(declare-datatypes ((array!6341 0))(
  ( (array!6342 (arr!3005 (Array (_ BitVec 32) ValueCell!1472)) (size!3294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1852 0))(
  ( (LongMapFixedSize!1853 (defaultEntry!3368 Int) (mask!8056 (_ BitVec 32)) (extraKeys!3109 (_ BitVec 32)) (zeroValue!3211 V!4489) (minValue!3211 V!4489) (_size!975 (_ BitVec 32)) (_keys!5192 array!6339) (_values!3351 array!6341) (_vacant!975 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1852)

(declare-fun valid!832 (LongMapFixedSize!1852) Bool)

(assert (=> start!16528 (= res!77683 (valid!832 thiss!1248))))

(assert (=> start!16528 e!107708))

(declare-fun e!107710 () Bool)

(assert (=> start!16528 e!107710))

(assert (=> start!16528 true))

(declare-fun b!164168 () Bool)

(declare-fun res!77684 () Bool)

(declare-fun e!107709 () Bool)

(assert (=> b!164168 (=> (not res!77684) (not e!107709))))

(assert (=> b!164168 (= res!77684 (and (= (size!3294 (_values!3351 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8056 thiss!1248))) (= (size!3293 (_keys!5192 thiss!1248)) (size!3294 (_values!3351 thiss!1248))) (bvsge (mask!8056 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3109 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3109 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164169 () Bool)

(declare-fun res!77685 () Bool)

(assert (=> b!164169 (=> (not res!77685) (not e!107708))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164169 (= res!77685 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164170 () Bool)

(assert (=> b!164170 (= e!107708 e!107709)))

(declare-fun res!77681 () Bool)

(assert (=> b!164170 (=> (not res!77681) (not e!107709))))

(declare-datatypes ((SeekEntryResult!422 0))(
  ( (MissingZero!422 (index!3856 (_ BitVec 32))) (Found!422 (index!3857 (_ BitVec 32))) (Intermediate!422 (undefined!1234 Bool) (index!3858 (_ BitVec 32)) (x!18233 (_ BitVec 32))) (Undefined!422) (MissingVacant!422 (index!3859 (_ BitVec 32))) )
))
(declare-fun lt!82686 () SeekEntryResult!422)

(get-info :version)

(assert (=> b!164170 (= res!77681 (and (not ((_ is Undefined!422) lt!82686)) (not ((_ is MissingVacant!422) lt!82686)) (not ((_ is MissingZero!422) lt!82686)) ((_ is Found!422) lt!82686)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6339 (_ BitVec 32)) SeekEntryResult!422)

(assert (=> b!164170 (= lt!82686 (seekEntryOrOpen!0 key!828 (_keys!5192 thiss!1248) (mask!8056 thiss!1248)))))

(declare-fun b!164171 () Bool)

(declare-fun e!107706 () Bool)

(declare-fun e!107707 () Bool)

(assert (=> b!164171 (= e!107706 (and e!107707 mapRes!6165))))

(declare-fun condMapEmpty!6165 () Bool)

(declare-fun mapDefault!6165 () ValueCell!1472)

(assert (=> b!164171 (= condMapEmpty!6165 (= (arr!3005 (_values!3351 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1472)) mapDefault!6165)))))

(declare-fun mapNonEmpty!6165 () Bool)

(declare-fun tp!14088 () Bool)

(declare-fun e!107711 () Bool)

(assert (=> mapNonEmpty!6165 (= mapRes!6165 (and tp!14088 e!107711))))

(declare-fun mapValue!6165 () ValueCell!1472)

(declare-fun mapKey!6165 () (_ BitVec 32))

(declare-fun mapRest!6165 () (Array (_ BitVec 32) ValueCell!1472))

(assert (=> mapNonEmpty!6165 (= (arr!3005 (_values!3351 thiss!1248)) (store mapRest!6165 mapKey!6165 mapValue!6165))))

(declare-fun b!164172 () Bool)

(declare-fun res!77686 () Bool)

(assert (=> b!164172 (=> (not res!77686) (not e!107709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6339 (_ BitVec 32)) Bool)

(assert (=> b!164172 (= res!77686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5192 thiss!1248) (mask!8056 thiss!1248)))))

(declare-fun b!164173 () Bool)

(declare-fun res!77682 () Bool)

(assert (=> b!164173 (=> (not res!77682) (not e!107709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164173 (= res!77682 (validMask!0 (mask!8056 thiss!1248)))))

(declare-fun tp_is_empty!3631 () Bool)

(declare-fun array_inv!1933 (array!6339) Bool)

(declare-fun array_inv!1934 (array!6341) Bool)

(assert (=> b!164174 (= e!107710 (and tp!14087 tp_is_empty!3631 (array_inv!1933 (_keys!5192 thiss!1248)) (array_inv!1934 (_values!3351 thiss!1248)) e!107706))))

(declare-fun b!164175 () Bool)

(assert (=> b!164175 (= e!107707 tp_is_empty!3631)))

(declare-fun b!164176 () Bool)

(assert (=> b!164176 (= e!107709 false)))

(declare-fun lt!82685 () Bool)

(declare-datatypes ((List!2008 0))(
  ( (Nil!2005) (Cons!2004 (h!2621 (_ BitVec 64)) (t!6801 List!2008)) )
))
(declare-fun arrayNoDuplicates!0 (array!6339 (_ BitVec 32) List!2008) Bool)

(assert (=> b!164176 (= lt!82685 (arrayNoDuplicates!0 (_keys!5192 thiss!1248) #b00000000000000000000000000000000 Nil!2005))))

(declare-fun b!164177 () Bool)

(assert (=> b!164177 (= e!107711 tp_is_empty!3631)))

(declare-fun b!164178 () Bool)

(declare-fun res!77680 () Bool)

(assert (=> b!164178 (=> (not res!77680) (not e!107709))))

(declare-datatypes ((tuple2!3008 0))(
  ( (tuple2!3009 (_1!1515 (_ BitVec 64)) (_2!1515 V!4489)) )
))
(declare-datatypes ((List!2009 0))(
  ( (Nil!2006) (Cons!2005 (h!2622 tuple2!3008) (t!6802 List!2009)) )
))
(declare-datatypes ((ListLongMap!1951 0))(
  ( (ListLongMap!1952 (toList!991 List!2009)) )
))
(declare-fun contains!1036 (ListLongMap!1951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!633 (array!6339 array!6341 (_ BitVec 32) (_ BitVec 32) V!4489 V!4489 (_ BitVec 32) Int) ListLongMap!1951)

(assert (=> b!164178 (= res!77680 (contains!1036 (getCurrentListMap!633 (_keys!5192 thiss!1248) (_values!3351 thiss!1248) (mask!8056 thiss!1248) (extraKeys!3109 thiss!1248) (zeroValue!3211 thiss!1248) (minValue!3211 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3368 thiss!1248)) key!828))))

(assert (= (and start!16528 res!77683) b!164169))

(assert (= (and b!164169 res!77685) b!164170))

(assert (= (and b!164170 res!77681) b!164178))

(assert (= (and b!164178 res!77680) b!164173))

(assert (= (and b!164173 res!77682) b!164168))

(assert (= (and b!164168 res!77684) b!164172))

(assert (= (and b!164172 res!77686) b!164176))

(assert (= (and b!164171 condMapEmpty!6165) mapIsEmpty!6165))

(assert (= (and b!164171 (not condMapEmpty!6165)) mapNonEmpty!6165))

(assert (= (and mapNonEmpty!6165 ((_ is ValueCellFull!1472) mapValue!6165)) b!164177))

(assert (= (and b!164171 ((_ is ValueCellFull!1472) mapDefault!6165)) b!164175))

(assert (= b!164174 b!164171))

(assert (= start!16528 b!164174))

(declare-fun m!193951 () Bool)

(assert (=> b!164176 m!193951))

(declare-fun m!193953 () Bool)

(assert (=> b!164170 m!193953))

(declare-fun m!193955 () Bool)

(assert (=> b!164174 m!193955))

(declare-fun m!193957 () Bool)

(assert (=> b!164174 m!193957))

(declare-fun m!193959 () Bool)

(assert (=> start!16528 m!193959))

(declare-fun m!193961 () Bool)

(assert (=> mapNonEmpty!6165 m!193961))

(declare-fun m!193963 () Bool)

(assert (=> b!164173 m!193963))

(declare-fun m!193965 () Bool)

(assert (=> b!164172 m!193965))

(declare-fun m!193967 () Bool)

(assert (=> b!164178 m!193967))

(assert (=> b!164178 m!193967))

(declare-fun m!193969 () Bool)

(assert (=> b!164178 m!193969))

(check-sat (not b!164178) (not b!164176) (not start!16528) (not b!164170) (not b!164172) (not b!164174) b_and!10217 (not b!164173) (not b_next!3829) tp_is_empty!3631 (not mapNonEmpty!6165))
(check-sat b_and!10217 (not b_next!3829))
