; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16168 () Bool)

(assert start!16168)

(declare-fun b!161167 () Bool)

(declare-fun b_free!3625 () Bool)

(declare-fun b_next!3625 () Bool)

(assert (=> b!161167 (= b_free!3625 (not b_next!3625))))

(declare-fun tp!13445 () Bool)

(declare-fun b_and!10053 () Bool)

(assert (=> b!161167 (= tp!13445 b_and!10053)))

(declare-fun b!161159 () Bool)

(declare-fun e!105297 () Bool)

(declare-fun e!105298 () Bool)

(declare-fun mapRes!5828 () Bool)

(assert (=> b!161159 (= e!105297 (and e!105298 mapRes!5828))))

(declare-fun condMapEmpty!5828 () Bool)

(declare-datatypes ((V!4217 0))(
  ( (V!4218 (val!1758 Int)) )
))
(declare-datatypes ((ValueCell!1370 0))(
  ( (ValueCellFull!1370 (v!3624 V!4217)) (EmptyCell!1370) )
))
(declare-datatypes ((array!5919 0))(
  ( (array!5920 (arr!2804 (Array (_ BitVec 32) (_ BitVec 64))) (size!3088 (_ BitVec 32))) )
))
(declare-datatypes ((array!5921 0))(
  ( (array!5922 (arr!2805 (Array (_ BitVec 32) ValueCell!1370)) (size!3089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1648 0))(
  ( (LongMapFixedSize!1649 (defaultEntry!3266 Int) (mask!7850 (_ BitVec 32)) (extraKeys!3007 (_ BitVec 32)) (zeroValue!3109 V!4217) (minValue!3109 V!4217) (_size!873 (_ BitVec 32)) (_keys!5067 array!5919) (_values!3249 array!5921) (_vacant!873 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1648)

(declare-fun mapDefault!5828 () ValueCell!1370)

(assert (=> b!161159 (= condMapEmpty!5828 (= (arr!2805 (_values!3249 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1370)) mapDefault!5828)))))

(declare-fun b!161160 () Bool)

(declare-fun res!76415 () Bool)

(declare-fun e!105300 () Bool)

(assert (=> b!161160 (=> (not res!76415) (not e!105300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161160 (= res!76415 (validMask!0 (mask!7850 thiss!1248)))))

(declare-fun b!161162 () Bool)

(declare-fun res!76417 () Bool)

(assert (=> b!161162 (=> (not res!76417) (not e!105300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5919 (_ BitVec 32)) Bool)

(assert (=> b!161162 (= res!76417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5067 thiss!1248) (mask!7850 thiss!1248)))))

(declare-fun b!161163 () Bool)

(declare-fun res!76421 () Bool)

(assert (=> b!161163 (=> (not res!76421) (not e!105300))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2896 0))(
  ( (tuple2!2897 (_1!1459 (_ BitVec 64)) (_2!1459 V!4217)) )
))
(declare-datatypes ((List!1961 0))(
  ( (Nil!1958) (Cons!1957 (h!2570 tuple2!2896) (t!6755 List!1961)) )
))
(declare-datatypes ((ListLongMap!1895 0))(
  ( (ListLongMap!1896 (toList!963 List!1961)) )
))
(declare-fun contains!1009 (ListLongMap!1895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!630 (array!5919 array!5921 (_ BitVec 32) (_ BitVec 32) V!4217 V!4217 (_ BitVec 32) Int) ListLongMap!1895)

(assert (=> b!161163 (= res!76421 (not (contains!1009 (getCurrentListMap!630 (_keys!5067 thiss!1248) (_values!3249 thiss!1248) (mask!7850 thiss!1248) (extraKeys!3007 thiss!1248) (zeroValue!3109 thiss!1248) (minValue!3109 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3266 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!5828 () Bool)

(assert (=> mapIsEmpty!5828 mapRes!5828))

(declare-fun b!161164 () Bool)

(assert (=> b!161164 (= e!105300 false)))

(declare-fun lt!82209 () Bool)

(declare-datatypes ((List!1962 0))(
  ( (Nil!1959) (Cons!1958 (h!2571 (_ BitVec 64)) (t!6756 List!1962)) )
))
(declare-fun arrayNoDuplicates!0 (array!5919 (_ BitVec 32) List!1962) Bool)

(assert (=> b!161164 (= lt!82209 (arrayNoDuplicates!0 (_keys!5067 thiss!1248) #b00000000000000000000000000000000 Nil!1959))))

(declare-fun b!161165 () Bool)

(declare-fun res!76418 () Bool)

(assert (=> b!161165 (=> (not res!76418) (not e!105300))))

(assert (=> b!161165 (= res!76418 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161166 () Bool)

(declare-fun tp_is_empty!3427 () Bool)

(assert (=> b!161166 (= e!105298 tp_is_empty!3427)))

(declare-fun e!105295 () Bool)

(declare-fun array_inv!1791 (array!5919) Bool)

(declare-fun array_inv!1792 (array!5921) Bool)

(assert (=> b!161167 (= e!105295 (and tp!13445 tp_is_empty!3427 (array_inv!1791 (_keys!5067 thiss!1248)) (array_inv!1792 (_values!3249 thiss!1248)) e!105297))))

(declare-fun b!161168 () Bool)

(declare-fun e!105296 () Bool)

(assert (=> b!161168 (= e!105296 tp_is_empty!3427)))

(declare-fun mapNonEmpty!5828 () Bool)

(declare-fun tp!13444 () Bool)

(assert (=> mapNonEmpty!5828 (= mapRes!5828 (and tp!13444 e!105296))))

(declare-fun mapValue!5828 () ValueCell!1370)

(declare-fun mapRest!5828 () (Array (_ BitVec 32) ValueCell!1370))

(declare-fun mapKey!5828 () (_ BitVec 32))

(assert (=> mapNonEmpty!5828 (= (arr!2805 (_values!3249 thiss!1248)) (store mapRest!5828 mapKey!5828 mapValue!5828))))

(declare-fun b!161169 () Bool)

(declare-fun res!76419 () Bool)

(assert (=> b!161169 (=> (not res!76419) (not e!105300))))

(assert (=> b!161169 (= res!76419 (and (= (size!3089 (_values!3249 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7850 thiss!1248))) (= (size!3088 (_keys!5067 thiss!1248)) (size!3089 (_values!3249 thiss!1248))) (bvsge (mask!7850 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3007 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3007 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!76420 () Bool)

(assert (=> start!16168 (=> (not res!76420) (not e!105300))))

(declare-fun valid!777 (LongMapFixedSize!1648) Bool)

(assert (=> start!16168 (= res!76420 (valid!777 thiss!1248))))

(assert (=> start!16168 e!105300))

(assert (=> start!16168 e!105295))

(assert (=> start!16168 true))

(declare-fun b!161161 () Bool)

(declare-fun res!76416 () Bool)

(assert (=> b!161161 (=> (not res!76416) (not e!105300))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!338 0))(
  ( (MissingZero!338 (index!3520 (_ BitVec 32))) (Found!338 (index!3521 (_ BitVec 32))) (Intermediate!338 (undefined!1150 Bool) (index!3522 (_ BitVec 32)) (x!17770 (_ BitVec 32))) (Undefined!338) (MissingVacant!338 (index!3523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5919 (_ BitVec 32)) SeekEntryResult!338)

(assert (=> b!161161 (= res!76416 ((_ is Undefined!338) (seekEntryOrOpen!0 key!828 (_keys!5067 thiss!1248) (mask!7850 thiss!1248))))))

(assert (= (and start!16168 res!76420) b!161165))

(assert (= (and b!161165 res!76418) b!161161))

(assert (= (and b!161161 res!76416) b!161163))

(assert (= (and b!161163 res!76421) b!161160))

(assert (= (and b!161160 res!76415) b!161169))

(assert (= (and b!161169 res!76419) b!161162))

(assert (= (and b!161162 res!76417) b!161164))

(assert (= (and b!161159 condMapEmpty!5828) mapIsEmpty!5828))

(assert (= (and b!161159 (not condMapEmpty!5828)) mapNonEmpty!5828))

(assert (= (and mapNonEmpty!5828 ((_ is ValueCellFull!1370) mapValue!5828)) b!161168))

(assert (= (and b!161159 ((_ is ValueCellFull!1370) mapDefault!5828)) b!161166))

(assert (= b!161167 b!161159))

(assert (= start!16168 b!161167))

(declare-fun m!192899 () Bool)

(assert (=> b!161161 m!192899))

(declare-fun m!192901 () Bool)

(assert (=> b!161163 m!192901))

(assert (=> b!161163 m!192901))

(declare-fun m!192903 () Bool)

(assert (=> b!161163 m!192903))

(declare-fun m!192905 () Bool)

(assert (=> mapNonEmpty!5828 m!192905))

(declare-fun m!192907 () Bool)

(assert (=> b!161164 m!192907))

(declare-fun m!192909 () Bool)

(assert (=> b!161160 m!192909))

(declare-fun m!192911 () Bool)

(assert (=> b!161162 m!192911))

(declare-fun m!192913 () Bool)

(assert (=> start!16168 m!192913))

(declare-fun m!192915 () Bool)

(assert (=> b!161167 m!192915))

(declare-fun m!192917 () Bool)

(assert (=> b!161167 m!192917))

(check-sat (not b!161160) (not b!161162) b_and!10053 (not b!161161) (not b_next!3625) (not mapNonEmpty!5828) (not start!16168) tp_is_empty!3427 (not b!161167) (not b!161163) (not b!161164))
(check-sat b_and!10053 (not b_next!3625))
