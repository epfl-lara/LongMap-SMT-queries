; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80158 () Bool)

(assert start!80158)

(declare-fun b!941265 () Bool)

(declare-fun b_free!17845 () Bool)

(declare-fun b_next!17845 () Bool)

(assert (=> b!941265 (= b_free!17845 (not b_next!17845))))

(declare-fun tp!62011 () Bool)

(declare-fun b_and!29267 () Bool)

(assert (=> b!941265 (= tp!62011 b_and!29267)))

(declare-fun b!941259 () Bool)

(declare-fun e!529015 () Bool)

(declare-fun e!529011 () Bool)

(assert (=> b!941259 (= e!529015 e!529011)))

(declare-fun res!632649 () Bool)

(assert (=> b!941259 (=> (not res!632649) (not e!529011))))

(declare-datatypes ((SeekEntryResult!8952 0))(
  ( (MissingZero!8952 (index!38179 (_ BitVec 32))) (Found!8952 (index!38180 (_ BitVec 32))) (Intermediate!8952 (undefined!9764 Bool) (index!38181 (_ BitVec 32)) (x!80619 (_ BitVec 32))) (Undefined!8952) (MissingVacant!8952 (index!38182 (_ BitVec 32))) )
))
(declare-fun lt!425046 () SeekEntryResult!8952)

(get-info :version)

(assert (=> b!941259 (= res!632649 ((_ is Found!8952) lt!425046))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32103 0))(
  ( (V!32104 (val!10227 Int)) )
))
(declare-datatypes ((ValueCell!9695 0))(
  ( (ValueCellFull!9695 (v!12755 V!32103)) (EmptyCell!9695) )
))
(declare-datatypes ((array!56705 0))(
  ( (array!56706 (arr!27283 (Array (_ BitVec 32) ValueCell!9695)) (size!27745 (_ BitVec 32))) )
))
(declare-datatypes ((array!56707 0))(
  ( (array!56708 (arr!27284 (Array (_ BitVec 32) (_ BitVec 64))) (size!27746 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4540 0))(
  ( (LongMapFixedSize!4541 (defaultEntry!5561 Int) (mask!27143 (_ BitVec 32)) (extraKeys!5293 (_ BitVec 32)) (zeroValue!5397 V!32103) (minValue!5397 V!32103) (_size!2325 (_ BitVec 32)) (_keys!10439 array!56707) (_values!5584 array!56705) (_vacant!2325 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4540)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56707 (_ BitVec 32)) SeekEntryResult!8952)

(assert (=> b!941259 (= lt!425046 (seekEntry!0 key!756 (_keys!10439 thiss!1141) (mask!27143 thiss!1141)))))

(declare-fun b!941260 () Bool)

(declare-fun e!529017 () Bool)

(assert (=> b!941260 (= e!529017 true)))

(declare-fun lt!425047 () Bool)

(declare-datatypes ((List!19172 0))(
  ( (Nil!19169) (Cons!19168 (h!20320 (_ BitVec 64)) (t!27479 List!19172)) )
))
(declare-fun arrayNoDuplicates!0 (array!56707 (_ BitVec 32) List!19172) Bool)

(assert (=> b!941260 (= lt!425047 (arrayNoDuplicates!0 (_keys!10439 thiss!1141) #b00000000000000000000000000000000 Nil!19169))))

(declare-fun res!632648 () Bool)

(assert (=> start!80158 (=> (not res!632648) (not e!529015))))

(declare-fun valid!1749 (LongMapFixedSize!4540) Bool)

(assert (=> start!80158 (= res!632648 (valid!1749 thiss!1141))))

(assert (=> start!80158 e!529015))

(declare-fun e!529018 () Bool)

(assert (=> start!80158 e!529018))

(assert (=> start!80158 true))

(declare-fun b!941261 () Bool)

(declare-fun e!529016 () Bool)

(declare-fun e!529013 () Bool)

(declare-fun mapRes!32320 () Bool)

(assert (=> b!941261 (= e!529016 (and e!529013 mapRes!32320))))

(declare-fun condMapEmpty!32320 () Bool)

(declare-fun mapDefault!32320 () ValueCell!9695)

(assert (=> b!941261 (= condMapEmpty!32320 (= (arr!27283 (_values!5584 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9695)) mapDefault!32320)))))

(declare-fun mapIsEmpty!32320 () Bool)

(assert (=> mapIsEmpty!32320 mapRes!32320))

(declare-fun b!941262 () Bool)

(declare-fun tp_is_empty!20353 () Bool)

(assert (=> b!941262 (= e!529013 tp_is_empty!20353)))

(declare-fun b!941263 () Bool)

(declare-fun res!632645 () Bool)

(assert (=> b!941263 (=> res!632645 e!529017)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56707 (_ BitVec 32)) Bool)

(assert (=> b!941263 (= res!632645 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10439 thiss!1141) (mask!27143 thiss!1141))))))

(declare-fun b!941264 () Bool)

(assert (=> b!941264 (= e!529011 (not e!529017))))

(declare-fun res!632646 () Bool)

(assert (=> b!941264 (=> res!632646 e!529017)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941264 (= res!632646 (not (validMask!0 (mask!27143 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941264 (arrayContainsKey!0 (_keys!10439 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31744 0))(
  ( (Unit!31745) )
))
(declare-fun lt!425048 () Unit!31744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56707 (_ BitVec 64) (_ BitVec 32)) Unit!31744)

(assert (=> b!941264 (= lt!425048 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10439 thiss!1141) key!756 (index!38180 lt!425046)))))

(declare-fun array_inv!21298 (array!56707) Bool)

(declare-fun array_inv!21299 (array!56705) Bool)

(assert (=> b!941265 (= e!529018 (and tp!62011 tp_is_empty!20353 (array_inv!21298 (_keys!10439 thiss!1141)) (array_inv!21299 (_values!5584 thiss!1141)) e!529016))))

(declare-fun mapNonEmpty!32320 () Bool)

(declare-fun tp!62010 () Bool)

(declare-fun e!529012 () Bool)

(assert (=> mapNonEmpty!32320 (= mapRes!32320 (and tp!62010 e!529012))))

(declare-fun mapKey!32320 () (_ BitVec 32))

(declare-fun mapRest!32320 () (Array (_ BitVec 32) ValueCell!9695))

(declare-fun mapValue!32320 () ValueCell!9695)

(assert (=> mapNonEmpty!32320 (= (arr!27283 (_values!5584 thiss!1141)) (store mapRest!32320 mapKey!32320 mapValue!32320))))

(declare-fun b!941266 () Bool)

(declare-fun res!632647 () Bool)

(assert (=> b!941266 (=> (not res!632647) (not e!529015))))

(assert (=> b!941266 (= res!632647 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941267 () Bool)

(assert (=> b!941267 (= e!529012 tp_is_empty!20353)))

(declare-fun b!941268 () Bool)

(declare-fun res!632644 () Bool)

(assert (=> b!941268 (=> res!632644 e!529017)))

(assert (=> b!941268 (= res!632644 (or (not (= (size!27745 (_values!5584 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27143 thiss!1141)))) (not (= (size!27746 (_keys!10439 thiss!1141)) (size!27745 (_values!5584 thiss!1141)))) (bvslt (mask!27143 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5293 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5293 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80158 res!632648) b!941266))

(assert (= (and b!941266 res!632647) b!941259))

(assert (= (and b!941259 res!632649) b!941264))

(assert (= (and b!941264 (not res!632646)) b!941268))

(assert (= (and b!941268 (not res!632644)) b!941263))

(assert (= (and b!941263 (not res!632645)) b!941260))

(assert (= (and b!941261 condMapEmpty!32320) mapIsEmpty!32320))

(assert (= (and b!941261 (not condMapEmpty!32320)) mapNonEmpty!32320))

(assert (= (and mapNonEmpty!32320 ((_ is ValueCellFull!9695) mapValue!32320)) b!941267))

(assert (= (and b!941261 ((_ is ValueCellFull!9695) mapDefault!32320)) b!941262))

(assert (= b!941265 b!941261))

(assert (= start!80158 b!941265))

(declare-fun m!877127 () Bool)

(assert (=> start!80158 m!877127))

(declare-fun m!877129 () Bool)

(assert (=> b!941263 m!877129))

(declare-fun m!877131 () Bool)

(assert (=> mapNonEmpty!32320 m!877131))

(declare-fun m!877133 () Bool)

(assert (=> b!941260 m!877133))

(declare-fun m!877135 () Bool)

(assert (=> b!941259 m!877135))

(declare-fun m!877137 () Bool)

(assert (=> b!941264 m!877137))

(declare-fun m!877139 () Bool)

(assert (=> b!941264 m!877139))

(declare-fun m!877141 () Bool)

(assert (=> b!941264 m!877141))

(declare-fun m!877143 () Bool)

(assert (=> b!941265 m!877143))

(declare-fun m!877145 () Bool)

(assert (=> b!941265 m!877145))

(check-sat (not b!941260) (not mapNonEmpty!32320) (not b!941264) (not b_next!17845) b_and!29267 (not b!941265) tp_is_empty!20353 (not b!941259) (not start!80158) (not b!941263))
(check-sat b_and!29267 (not b_next!17845))
