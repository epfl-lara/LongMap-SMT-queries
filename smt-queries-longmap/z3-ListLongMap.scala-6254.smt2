; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79972 () Bool)

(assert start!79972)

(declare-fun b!940120 () Bool)

(declare-fun b_free!17845 () Bool)

(declare-fun b_next!17845 () Bool)

(assert (=> b!940120 (= b_free!17845 (not b_next!17845))))

(declare-fun tp!62011 () Bool)

(declare-fun b_and!29231 () Bool)

(assert (=> b!940120 (= tp!62011 b_and!29231)))

(declare-fun b!940117 () Bool)

(declare-fun e!528286 () Bool)

(declare-fun tp_is_empty!20353 () Bool)

(assert (=> b!940117 (= e!528286 tp_is_empty!20353)))

(declare-fun b!940118 () Bool)

(declare-fun e!528288 () Bool)

(declare-fun e!528287 () Bool)

(assert (=> b!940118 (= e!528288 e!528287)))

(declare-fun res!632194 () Bool)

(assert (=> b!940118 (=> (not res!632194) (not e!528287))))

(declare-datatypes ((SeekEntryResult!8997 0))(
  ( (MissingZero!8997 (index!38359 (_ BitVec 32))) (Found!8997 (index!38360 (_ BitVec 32))) (Intermediate!8997 (undefined!9809 Bool) (index!38361 (_ BitVec 32)) (x!80645 (_ BitVec 32))) (Undefined!8997) (MissingVacant!8997 (index!38362 (_ BitVec 32))) )
))
(declare-fun lt!424449 () SeekEntryResult!8997)

(get-info :version)

(assert (=> b!940118 (= res!632194 ((_ is Found!8997) lt!424449))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32103 0))(
  ( (V!32104 (val!10227 Int)) )
))
(declare-datatypes ((ValueCell!9695 0))(
  ( (ValueCellFull!9695 (v!12757 V!32103)) (EmptyCell!9695) )
))
(declare-datatypes ((array!56619 0))(
  ( (array!56620 (arr!27245 (Array (_ BitVec 32) ValueCell!9695)) (size!27708 (_ BitVec 32))) )
))
(declare-datatypes ((array!56621 0))(
  ( (array!56622 (arr!27246 (Array (_ BitVec 32) (_ BitVec 64))) (size!27709 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4540 0))(
  ( (LongMapFixedSize!4541 (defaultEntry!5561 Int) (mask!27093 (_ BitVec 32)) (extraKeys!5293 (_ BitVec 32)) (zeroValue!5397 V!32103) (minValue!5397 V!32103) (_size!2325 (_ BitVec 32)) (_keys!10406 array!56621) (_values!5584 array!56619) (_vacant!2325 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4540)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56621 (_ BitVec 32)) SeekEntryResult!8997)

(assert (=> b!940118 (= lt!424449 (seekEntry!0 key!756 (_keys!10406 thiss!1141) (mask!27093 thiss!1141)))))

(declare-fun b!940119 () Bool)

(declare-fun e!528281 () Bool)

(assert (=> b!940119 (= e!528281 true)))

(declare-fun lt!424451 () Bool)

(declare-datatypes ((List!19200 0))(
  ( (Nil!19197) (Cons!19196 (h!20342 (_ BitVec 64)) (t!27506 List!19200)) )
))
(declare-fun arrayNoDuplicates!0 (array!56621 (_ BitVec 32) List!19200) Bool)

(assert (=> b!940119 (= lt!424451 (arrayNoDuplicates!0 (_keys!10406 thiss!1141) #b00000000000000000000000000000000 Nil!19197))))

(declare-fun mapNonEmpty!32320 () Bool)

(declare-fun mapRes!32320 () Bool)

(declare-fun tp!62010 () Bool)

(declare-fun e!528284 () Bool)

(assert (=> mapNonEmpty!32320 (= mapRes!32320 (and tp!62010 e!528284))))

(declare-fun mapKey!32320 () (_ BitVec 32))

(declare-fun mapRest!32320 () (Array (_ BitVec 32) ValueCell!9695))

(declare-fun mapValue!32320 () ValueCell!9695)

(assert (=> mapNonEmpty!32320 (= (arr!27245 (_values!5584 thiss!1141)) (store mapRest!32320 mapKey!32320 mapValue!32320))))

(declare-fun e!528282 () Bool)

(declare-fun e!528285 () Bool)

(declare-fun array_inv!21246 (array!56621) Bool)

(declare-fun array_inv!21247 (array!56619) Bool)

(assert (=> b!940120 (= e!528282 (and tp!62011 tp_is_empty!20353 (array_inv!21246 (_keys!10406 thiss!1141)) (array_inv!21247 (_values!5584 thiss!1141)) e!528285))))

(declare-fun b!940122 () Bool)

(declare-fun res!632193 () Bool)

(assert (=> b!940122 (=> res!632193 e!528281)))

(assert (=> b!940122 (= res!632193 (or (not (= (size!27708 (_values!5584 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27093 thiss!1141)))) (not (= (size!27709 (_keys!10406 thiss!1141)) (size!27708 (_values!5584 thiss!1141)))) (bvslt (mask!27093 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5293 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5293 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940123 () Bool)

(assert (=> b!940123 (= e!528287 (not e!528281))))

(declare-fun res!632191 () Bool)

(assert (=> b!940123 (=> res!632191 e!528281)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940123 (= res!632191 (not (validMask!0 (mask!27093 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940123 (arrayContainsKey!0 (_keys!10406 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31649 0))(
  ( (Unit!31650) )
))
(declare-fun lt!424450 () Unit!31649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56621 (_ BitVec 64) (_ BitVec 32)) Unit!31649)

(assert (=> b!940123 (= lt!424450 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10406 thiss!1141) key!756 (index!38360 lt!424449)))))

(declare-fun mapIsEmpty!32320 () Bool)

(assert (=> mapIsEmpty!32320 mapRes!32320))

(declare-fun b!940124 () Bool)

(declare-fun res!632195 () Bool)

(assert (=> b!940124 (=> (not res!632195) (not e!528288))))

(assert (=> b!940124 (= res!632195 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632192 () Bool)

(assert (=> start!79972 (=> (not res!632192) (not e!528288))))

(declare-fun valid!1749 (LongMapFixedSize!4540) Bool)

(assert (=> start!79972 (= res!632192 (valid!1749 thiss!1141))))

(assert (=> start!79972 e!528288))

(assert (=> start!79972 e!528282))

(assert (=> start!79972 true))

(declare-fun b!940121 () Bool)

(assert (=> b!940121 (= e!528284 tp_is_empty!20353)))

(declare-fun b!940125 () Bool)

(assert (=> b!940125 (= e!528285 (and e!528286 mapRes!32320))))

(declare-fun condMapEmpty!32320 () Bool)

(declare-fun mapDefault!32320 () ValueCell!9695)

(assert (=> b!940125 (= condMapEmpty!32320 (= (arr!27245 (_values!5584 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9695)) mapDefault!32320)))))

(declare-fun b!940126 () Bool)

(declare-fun res!632190 () Bool)

(assert (=> b!940126 (=> res!632190 e!528281)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56621 (_ BitVec 32)) Bool)

(assert (=> b!940126 (= res!632190 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10406 thiss!1141) (mask!27093 thiss!1141))))))

(assert (= (and start!79972 res!632192) b!940124))

(assert (= (and b!940124 res!632195) b!940118))

(assert (= (and b!940118 res!632194) b!940123))

(assert (= (and b!940123 (not res!632191)) b!940122))

(assert (= (and b!940122 (not res!632193)) b!940126))

(assert (= (and b!940126 (not res!632190)) b!940119))

(assert (= (and b!940125 condMapEmpty!32320) mapIsEmpty!32320))

(assert (= (and b!940125 (not condMapEmpty!32320)) mapNonEmpty!32320))

(assert (= (and mapNonEmpty!32320 ((_ is ValueCellFull!9695) mapValue!32320)) b!940121))

(assert (= (and b!940125 ((_ is ValueCellFull!9695) mapDefault!32320)) b!940117))

(assert (= b!940120 b!940125))

(assert (= start!79972 b!940120))

(declare-fun m!875075 () Bool)

(assert (=> b!940119 m!875075))

(declare-fun m!875077 () Bool)

(assert (=> b!940118 m!875077))

(declare-fun m!875079 () Bool)

(assert (=> b!940123 m!875079))

(declare-fun m!875081 () Bool)

(assert (=> b!940123 m!875081))

(declare-fun m!875083 () Bool)

(assert (=> b!940123 m!875083))

(declare-fun m!875085 () Bool)

(assert (=> b!940120 m!875085))

(declare-fun m!875087 () Bool)

(assert (=> b!940120 m!875087))

(declare-fun m!875089 () Bool)

(assert (=> mapNonEmpty!32320 m!875089))

(declare-fun m!875091 () Bool)

(assert (=> start!79972 m!875091))

(declare-fun m!875093 () Bool)

(assert (=> b!940126 m!875093))

(check-sat (not mapNonEmpty!32320) (not b!940123) b_and!29231 (not start!79972) (not b_next!17845) (not b!940118) (not b!940126) tp_is_empty!20353 (not b!940119) (not b!940120))
(check-sat b_and!29231 (not b_next!17845))
