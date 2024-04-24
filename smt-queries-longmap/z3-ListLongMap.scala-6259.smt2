; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80188 () Bool)

(assert start!80188)

(declare-fun b!941716 () Bool)

(declare-fun b_free!17875 () Bool)

(declare-fun b_next!17875 () Bool)

(assert (=> b!941716 (= b_free!17875 (not b_next!17875))))

(declare-fun tp!62101 () Bool)

(declare-fun b_and!29297 () Bool)

(assert (=> b!941716 (= tp!62101 b_and!29297)))

(declare-fun res!632919 () Bool)

(declare-fun e!529378 () Bool)

(assert (=> start!80188 (=> (not res!632919) (not e!529378))))

(declare-datatypes ((V!32143 0))(
  ( (V!32144 (val!10242 Int)) )
))
(declare-datatypes ((ValueCell!9710 0))(
  ( (ValueCellFull!9710 (v!12770 V!32143)) (EmptyCell!9710) )
))
(declare-datatypes ((array!56765 0))(
  ( (array!56766 (arr!27313 (Array (_ BitVec 32) ValueCell!9710)) (size!27775 (_ BitVec 32))) )
))
(declare-datatypes ((array!56767 0))(
  ( (array!56768 (arr!27314 (Array (_ BitVec 32) (_ BitVec 64))) (size!27776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4570 0))(
  ( (LongMapFixedSize!4571 (defaultEntry!5576 Int) (mask!27168 (_ BitVec 32)) (extraKeys!5308 (_ BitVec 32)) (zeroValue!5412 V!32143) (minValue!5412 V!32143) (_size!2340 (_ BitVec 32)) (_keys!10454 array!56767) (_values!5599 array!56765) (_vacant!2340 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4570)

(declare-fun valid!1758 (LongMapFixedSize!4570) Bool)

(assert (=> start!80188 (= res!632919 (valid!1758 thiss!1141))))

(assert (=> start!80188 e!529378))

(declare-fun e!529376 () Bool)

(assert (=> start!80188 e!529376))

(assert (=> start!80188 true))

(declare-fun b!941709 () Bool)

(declare-fun e!529371 () Bool)

(declare-fun tp_is_empty!20383 () Bool)

(assert (=> b!941709 (= e!529371 tp_is_empty!20383)))

(declare-fun b!941710 () Bool)

(declare-fun e!529377 () Bool)

(assert (=> b!941710 (= e!529378 e!529377)))

(declare-fun res!632916 () Bool)

(assert (=> b!941710 (=> (not res!632916) (not e!529377))))

(declare-datatypes ((SeekEntryResult!8963 0))(
  ( (MissingZero!8963 (index!38223 (_ BitVec 32))) (Found!8963 (index!38224 (_ BitVec 32))) (Intermediate!8963 (undefined!9775 Bool) (index!38225 (_ BitVec 32)) (x!80670 (_ BitVec 32))) (Undefined!8963) (MissingVacant!8963 (index!38226 (_ BitVec 32))) )
))
(declare-fun lt!425183 () SeekEntryResult!8963)

(get-info :version)

(assert (=> b!941710 (= res!632916 ((_ is Found!8963) lt!425183))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56767 (_ BitVec 32)) SeekEntryResult!8963)

(assert (=> b!941710 (= lt!425183 (seekEntry!0 key!756 (_keys!10454 thiss!1141) (mask!27168 thiss!1141)))))

(declare-fun b!941711 () Bool)

(declare-fun e!529374 () Bool)

(declare-fun e!529373 () Bool)

(declare-fun mapRes!32365 () Bool)

(assert (=> b!941711 (= e!529374 (and e!529373 mapRes!32365))))

(declare-fun condMapEmpty!32365 () Bool)

(declare-fun mapDefault!32365 () ValueCell!9710)

(assert (=> b!941711 (= condMapEmpty!32365 (= (arr!27313 (_values!5599 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9710)) mapDefault!32365)))))

(declare-fun b!941712 () Bool)

(declare-fun res!632917 () Bool)

(declare-fun e!529375 () Bool)

(assert (=> b!941712 (=> res!632917 e!529375)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56767 (_ BitVec 32)) Bool)

(assert (=> b!941712 (= res!632917 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10454 thiss!1141) (mask!27168 thiss!1141))))))

(declare-fun mapIsEmpty!32365 () Bool)

(assert (=> mapIsEmpty!32365 mapRes!32365))

(declare-fun b!941713 () Bool)

(assert (=> b!941713 (= e!529375 true)))

(declare-fun lt!425181 () Bool)

(declare-datatypes ((List!19182 0))(
  ( (Nil!19179) (Cons!19178 (h!20330 (_ BitVec 64)) (t!27489 List!19182)) )
))
(declare-fun arrayNoDuplicates!0 (array!56767 (_ BitVec 32) List!19182) Bool)

(assert (=> b!941713 (= lt!425181 (arrayNoDuplicates!0 (_keys!10454 thiss!1141) #b00000000000000000000000000000000 Nil!19179))))

(declare-fun b!941714 () Bool)

(declare-fun res!632918 () Bool)

(assert (=> b!941714 (=> res!632918 e!529375)))

(assert (=> b!941714 (= res!632918 (or (not (= (size!27775 (_values!5599 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27168 thiss!1141)))) (not (= (size!27776 (_keys!10454 thiss!1141)) (size!27775 (_values!5599 thiss!1141)))) (bvslt (mask!27168 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5308 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5308 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941715 () Bool)

(declare-fun res!632915 () Bool)

(assert (=> b!941715 (=> (not res!632915) (not e!529378))))

(assert (=> b!941715 (= res!632915 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32365 () Bool)

(declare-fun tp!62100 () Bool)

(assert (=> mapNonEmpty!32365 (= mapRes!32365 (and tp!62100 e!529371))))

(declare-fun mapRest!32365 () (Array (_ BitVec 32) ValueCell!9710))

(declare-fun mapValue!32365 () ValueCell!9710)

(declare-fun mapKey!32365 () (_ BitVec 32))

(assert (=> mapNonEmpty!32365 (= (arr!27313 (_values!5599 thiss!1141)) (store mapRest!32365 mapKey!32365 mapValue!32365))))

(declare-fun array_inv!21322 (array!56767) Bool)

(declare-fun array_inv!21323 (array!56765) Bool)

(assert (=> b!941716 (= e!529376 (and tp!62101 tp_is_empty!20383 (array_inv!21322 (_keys!10454 thiss!1141)) (array_inv!21323 (_values!5599 thiss!1141)) e!529374))))

(declare-fun b!941717 () Bool)

(assert (=> b!941717 (= e!529373 tp_is_empty!20383)))

(declare-fun b!941718 () Bool)

(assert (=> b!941718 (= e!529377 (not e!529375))))

(declare-fun res!632914 () Bool)

(assert (=> b!941718 (=> res!632914 e!529375)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941718 (= res!632914 (not (validMask!0 (mask!27168 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941718 (arrayContainsKey!0 (_keys!10454 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31762 0))(
  ( (Unit!31763) )
))
(declare-fun lt!425182 () Unit!31762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56767 (_ BitVec 64) (_ BitVec 32)) Unit!31762)

(assert (=> b!941718 (= lt!425182 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10454 thiss!1141) key!756 (index!38224 lt!425183)))))

(assert (= (and start!80188 res!632919) b!941715))

(assert (= (and b!941715 res!632915) b!941710))

(assert (= (and b!941710 res!632916) b!941718))

(assert (= (and b!941718 (not res!632914)) b!941714))

(assert (= (and b!941714 (not res!632918)) b!941712))

(assert (= (and b!941712 (not res!632917)) b!941713))

(assert (= (and b!941711 condMapEmpty!32365) mapIsEmpty!32365))

(assert (= (and b!941711 (not condMapEmpty!32365)) mapNonEmpty!32365))

(assert (= (and mapNonEmpty!32365 ((_ is ValueCellFull!9710) mapValue!32365)) b!941709))

(assert (= (and b!941711 ((_ is ValueCellFull!9710) mapDefault!32365)) b!941717))

(assert (= b!941716 b!941711))

(assert (= start!80188 b!941716))

(declare-fun m!877427 () Bool)

(assert (=> b!941716 m!877427))

(declare-fun m!877429 () Bool)

(assert (=> b!941716 m!877429))

(declare-fun m!877431 () Bool)

(assert (=> b!941712 m!877431))

(declare-fun m!877433 () Bool)

(assert (=> b!941713 m!877433))

(declare-fun m!877435 () Bool)

(assert (=> b!941718 m!877435))

(declare-fun m!877437 () Bool)

(assert (=> b!941718 m!877437))

(declare-fun m!877439 () Bool)

(assert (=> b!941718 m!877439))

(declare-fun m!877441 () Bool)

(assert (=> start!80188 m!877441))

(declare-fun m!877443 () Bool)

(assert (=> mapNonEmpty!32365 m!877443))

(declare-fun m!877445 () Bool)

(assert (=> b!941710 m!877445))

(check-sat (not b!941712) (not b!941718) (not b!941710) (not b!941713) (not b!941716) tp_is_empty!20383 (not mapNonEmpty!32365) (not start!80188) (not b_next!17875) b_and!29297)
(check-sat b_and!29297 (not b_next!17875))
