; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80194 () Bool)

(assert start!80194)

(declare-fun b!941808 () Bool)

(declare-fun b_free!17881 () Bool)

(declare-fun b_next!17881 () Bool)

(assert (=> b!941808 (= b_free!17881 (not b_next!17881))))

(declare-fun tp!62118 () Bool)

(declare-fun b_and!29303 () Bool)

(assert (=> b!941808 (= tp!62118 b_and!29303)))

(declare-fun b!941799 () Bool)

(declare-fun e!529444 () Bool)

(declare-fun tp_is_empty!20389 () Bool)

(assert (=> b!941799 (= e!529444 tp_is_empty!20389)))

(declare-fun b!941800 () Bool)

(declare-fun e!529447 () Bool)

(assert (=> b!941800 (= e!529447 true)))

(declare-fun lt!425210 () Bool)

(declare-datatypes ((V!32151 0))(
  ( (V!32152 (val!10245 Int)) )
))
(declare-datatypes ((ValueCell!9713 0))(
  ( (ValueCellFull!9713 (v!12773 V!32151)) (EmptyCell!9713) )
))
(declare-datatypes ((array!56777 0))(
  ( (array!56778 (arr!27319 (Array (_ BitVec 32) ValueCell!9713)) (size!27781 (_ BitVec 32))) )
))
(declare-datatypes ((array!56779 0))(
  ( (array!56780 (arr!27320 (Array (_ BitVec 32) (_ BitVec 64))) (size!27782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4576 0))(
  ( (LongMapFixedSize!4577 (defaultEntry!5579 Int) (mask!27173 (_ BitVec 32)) (extraKeys!5311 (_ BitVec 32)) (zeroValue!5415 V!32151) (minValue!5415 V!32151) (_size!2343 (_ BitVec 32)) (_keys!10457 array!56779) (_values!5602 array!56777) (_vacant!2343 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4576)

(declare-datatypes ((List!19184 0))(
  ( (Nil!19181) (Cons!19180 (h!20332 (_ BitVec 64)) (t!27491 List!19184)) )
))
(declare-fun arrayNoDuplicates!0 (array!56779 (_ BitVec 32) List!19184) Bool)

(assert (=> b!941800 (= lt!425210 (arrayNoDuplicates!0 (_keys!10457 thiss!1141) #b00000000000000000000000000000000 Nil!19181))))

(declare-fun b!941801 () Bool)

(declare-fun e!529449 () Bool)

(declare-fun e!529448 () Bool)

(assert (=> b!941801 (= e!529449 e!529448)))

(declare-fun res!632971 () Bool)

(assert (=> b!941801 (=> (not res!632971) (not e!529448))))

(declare-datatypes ((SeekEntryResult!8965 0))(
  ( (MissingZero!8965 (index!38231 (_ BitVec 32))) (Found!8965 (index!38232 (_ BitVec 32))) (Intermediate!8965 (undefined!9777 Bool) (index!38233 (_ BitVec 32)) (x!80680 (_ BitVec 32))) (Undefined!8965) (MissingVacant!8965 (index!38234 (_ BitVec 32))) )
))
(declare-fun lt!425208 () SeekEntryResult!8965)

(get-info :version)

(assert (=> b!941801 (= res!632971 ((_ is Found!8965) lt!425208))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56779 (_ BitVec 32)) SeekEntryResult!8965)

(assert (=> b!941801 (= lt!425208 (seekEntry!0 key!756 (_keys!10457 thiss!1141) (mask!27173 thiss!1141)))))

(declare-fun b!941802 () Bool)

(declare-fun e!529443 () Bool)

(declare-fun e!529450 () Bool)

(declare-fun mapRes!32374 () Bool)

(assert (=> b!941802 (= e!529443 (and e!529450 mapRes!32374))))

(declare-fun condMapEmpty!32374 () Bool)

(declare-fun mapDefault!32374 () ValueCell!9713)

(assert (=> b!941802 (= condMapEmpty!32374 (= (arr!27319 (_values!5602 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9713)) mapDefault!32374)))))

(declare-fun mapNonEmpty!32374 () Bool)

(declare-fun tp!62119 () Bool)

(assert (=> mapNonEmpty!32374 (= mapRes!32374 (and tp!62119 e!529444))))

(declare-fun mapValue!32374 () ValueCell!9713)

(declare-fun mapKey!32374 () (_ BitVec 32))

(declare-fun mapRest!32374 () (Array (_ BitVec 32) ValueCell!9713))

(assert (=> mapNonEmpty!32374 (= (arr!27319 (_values!5602 thiss!1141)) (store mapRest!32374 mapKey!32374 mapValue!32374))))

(declare-fun b!941803 () Bool)

(assert (=> b!941803 (= e!529448 (not e!529447))))

(declare-fun res!632970 () Bool)

(assert (=> b!941803 (=> res!632970 e!529447)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941803 (= res!632970 (not (validMask!0 (mask!27173 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941803 (arrayContainsKey!0 (_keys!10457 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31766 0))(
  ( (Unit!31767) )
))
(declare-fun lt!425209 () Unit!31766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56779 (_ BitVec 64) (_ BitVec 32)) Unit!31766)

(assert (=> b!941803 (= lt!425209 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10457 thiss!1141) key!756 (index!38232 lt!425208)))))

(declare-fun res!632969 () Bool)

(assert (=> start!80194 (=> (not res!632969) (not e!529449))))

(declare-fun valid!1760 (LongMapFixedSize!4576) Bool)

(assert (=> start!80194 (= res!632969 (valid!1760 thiss!1141))))

(assert (=> start!80194 e!529449))

(declare-fun e!529446 () Bool)

(assert (=> start!80194 e!529446))

(assert (=> start!80194 true))

(declare-fun b!941804 () Bool)

(assert (=> b!941804 (= e!529450 tp_is_empty!20389)))

(declare-fun b!941805 () Bool)

(declare-fun res!632972 () Bool)

(assert (=> b!941805 (=> res!632972 e!529447)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56779 (_ BitVec 32)) Bool)

(assert (=> b!941805 (= res!632972 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10457 thiss!1141) (mask!27173 thiss!1141))))))

(declare-fun mapIsEmpty!32374 () Bool)

(assert (=> mapIsEmpty!32374 mapRes!32374))

(declare-fun b!941806 () Bool)

(declare-fun res!632968 () Bool)

(assert (=> b!941806 (=> (not res!632968) (not e!529449))))

(assert (=> b!941806 (= res!632968 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941807 () Bool)

(declare-fun res!632973 () Bool)

(assert (=> b!941807 (=> res!632973 e!529447)))

(assert (=> b!941807 (= res!632973 (or (not (= (size!27781 (_values!5602 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27173 thiss!1141)))) (not (= (size!27782 (_keys!10457 thiss!1141)) (size!27781 (_values!5602 thiss!1141)))) (bvslt (mask!27173 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun array_inv!21324 (array!56779) Bool)

(declare-fun array_inv!21325 (array!56777) Bool)

(assert (=> b!941808 (= e!529446 (and tp!62118 tp_is_empty!20389 (array_inv!21324 (_keys!10457 thiss!1141)) (array_inv!21325 (_values!5602 thiss!1141)) e!529443))))

(assert (= (and start!80194 res!632969) b!941806))

(assert (= (and b!941806 res!632968) b!941801))

(assert (= (and b!941801 res!632971) b!941803))

(assert (= (and b!941803 (not res!632970)) b!941807))

(assert (= (and b!941807 (not res!632973)) b!941805))

(assert (= (and b!941805 (not res!632972)) b!941800))

(assert (= (and b!941802 condMapEmpty!32374) mapIsEmpty!32374))

(assert (= (and b!941802 (not condMapEmpty!32374)) mapNonEmpty!32374))

(assert (= (and mapNonEmpty!32374 ((_ is ValueCellFull!9713) mapValue!32374)) b!941799))

(assert (= (and b!941802 ((_ is ValueCellFull!9713) mapDefault!32374)) b!941804))

(assert (= b!941808 b!941802))

(assert (= start!80194 b!941808))

(declare-fun m!877487 () Bool)

(assert (=> start!80194 m!877487))

(declare-fun m!877489 () Bool)

(assert (=> b!941803 m!877489))

(declare-fun m!877491 () Bool)

(assert (=> b!941803 m!877491))

(declare-fun m!877493 () Bool)

(assert (=> b!941803 m!877493))

(declare-fun m!877495 () Bool)

(assert (=> b!941801 m!877495))

(declare-fun m!877497 () Bool)

(assert (=> mapNonEmpty!32374 m!877497))

(declare-fun m!877499 () Bool)

(assert (=> b!941805 m!877499))

(declare-fun m!877501 () Bool)

(assert (=> b!941800 m!877501))

(declare-fun m!877503 () Bool)

(assert (=> b!941808 m!877503))

(declare-fun m!877505 () Bool)

(assert (=> b!941808 m!877505))

(check-sat (not b!941803) (not b!941800) b_and!29303 (not start!80194) (not b!941805) (not b!941801) tp_is_empty!20389 (not mapNonEmpty!32374) (not b_next!17881) (not b!941808))
(check-sat b_and!29303 (not b_next!17881))
