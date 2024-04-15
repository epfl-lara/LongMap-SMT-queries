; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80008 () Bool)

(assert start!80008)

(declare-fun b!940666 () Bool)

(declare-fun b_free!17881 () Bool)

(declare-fun b_next!17881 () Bool)

(assert (=> b!940666 (= b_free!17881 (not b_next!17881))))

(declare-fun tp!62118 () Bool)

(declare-fun b_and!29267 () Bool)

(assert (=> b!940666 (= tp!62118 b_and!29267)))

(declare-fun b!940657 () Bool)

(declare-fun res!632514 () Bool)

(declare-fun e!528716 () Bool)

(assert (=> b!940657 (=> (not res!632514) (not e!528716))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940657 (= res!632514 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940658 () Bool)

(declare-fun res!632517 () Bool)

(declare-fun e!528714 () Bool)

(assert (=> b!940658 (=> res!632517 e!528714)))

(declare-datatypes ((V!32151 0))(
  ( (V!32152 (val!10245 Int)) )
))
(declare-datatypes ((ValueCell!9713 0))(
  ( (ValueCellFull!9713 (v!12775 V!32151)) (EmptyCell!9713) )
))
(declare-datatypes ((array!56691 0))(
  ( (array!56692 (arr!27281 (Array (_ BitVec 32) ValueCell!9713)) (size!27744 (_ BitVec 32))) )
))
(declare-datatypes ((array!56693 0))(
  ( (array!56694 (arr!27282 (Array (_ BitVec 32) (_ BitVec 64))) (size!27745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4576 0))(
  ( (LongMapFixedSize!4577 (defaultEntry!5579 Int) (mask!27123 (_ BitVec 32)) (extraKeys!5311 (_ BitVec 32)) (zeroValue!5415 V!32151) (minValue!5415 V!32151) (_size!2343 (_ BitVec 32)) (_keys!10424 array!56693) (_values!5602 array!56691) (_vacant!2343 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4576)

(assert (=> b!940658 (= res!632517 (or (not (= (size!27744 (_values!5602 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27123 thiss!1141)))) (not (= (size!27745 (_keys!10424 thiss!1141)) (size!27744 (_values!5602 thiss!1141)))) (bvslt (mask!27123 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940659 () Bool)

(declare-fun e!528717 () Bool)

(assert (=> b!940659 (= e!528717 (not e!528714))))

(declare-fun res!632518 () Bool)

(assert (=> b!940659 (=> res!632518 e!528714)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940659 (= res!632518 (not (validMask!0 (mask!27123 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940659 (arrayContainsKey!0 (_keys!10424 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31675 0))(
  ( (Unit!31676) )
))
(declare-fun lt!424613 () Unit!31675)

(declare-datatypes ((SeekEntryResult!9011 0))(
  ( (MissingZero!9011 (index!38415 (_ BitVec 32))) (Found!9011 (index!38416 (_ BitVec 32))) (Intermediate!9011 (undefined!9823 Bool) (index!38417 (_ BitVec 32)) (x!80707 (_ BitVec 32))) (Undefined!9011) (MissingVacant!9011 (index!38418 (_ BitVec 32))) )
))
(declare-fun lt!424611 () SeekEntryResult!9011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56693 (_ BitVec 64) (_ BitVec 32)) Unit!31675)

(assert (=> b!940659 (= lt!424613 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10424 thiss!1141) key!756 (index!38416 lt!424611)))))

(declare-fun b!940660 () Bool)

(assert (=> b!940660 (= e!528716 e!528717)))

(declare-fun res!632516 () Bool)

(assert (=> b!940660 (=> (not res!632516) (not e!528717))))

(get-info :version)

(assert (=> b!940660 (= res!632516 ((_ is Found!9011) lt!424611))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56693 (_ BitVec 32)) SeekEntryResult!9011)

(assert (=> b!940660 (= lt!424611 (seekEntry!0 key!756 (_keys!10424 thiss!1141) (mask!27123 thiss!1141)))))

(declare-fun b!940661 () Bool)

(declare-fun e!528713 () Bool)

(declare-fun e!528718 () Bool)

(declare-fun mapRes!32374 () Bool)

(assert (=> b!940661 (= e!528713 (and e!528718 mapRes!32374))))

(declare-fun condMapEmpty!32374 () Bool)

(declare-fun mapDefault!32374 () ValueCell!9713)

(assert (=> b!940661 (= condMapEmpty!32374 (= (arr!27281 (_values!5602 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9713)) mapDefault!32374)))))

(declare-fun mapIsEmpty!32374 () Bool)

(assert (=> mapIsEmpty!32374 mapRes!32374))

(declare-fun b!940662 () Bool)

(declare-fun tp_is_empty!20389 () Bool)

(assert (=> b!940662 (= e!528718 tp_is_empty!20389)))

(declare-fun b!940663 () Bool)

(assert (=> b!940663 (= e!528714 true)))

(declare-fun lt!424612 () Bool)

(declare-datatypes ((List!19211 0))(
  ( (Nil!19208) (Cons!19207 (h!20353 (_ BitVec 64)) (t!27517 List!19211)) )
))
(declare-fun arrayNoDuplicates!0 (array!56693 (_ BitVec 32) List!19211) Bool)

(assert (=> b!940663 (= lt!424612 (arrayNoDuplicates!0 (_keys!10424 thiss!1141) #b00000000000000000000000000000000 Nil!19208))))

(declare-fun b!940664 () Bool)

(declare-fun e!528719 () Bool)

(assert (=> b!940664 (= e!528719 tp_is_empty!20389)))

(declare-fun res!632515 () Bool)

(assert (=> start!80008 (=> (not res!632515) (not e!528716))))

(declare-fun valid!1762 (LongMapFixedSize!4576) Bool)

(assert (=> start!80008 (= res!632515 (valid!1762 thiss!1141))))

(assert (=> start!80008 e!528716))

(declare-fun e!528720 () Bool)

(assert (=> start!80008 e!528720))

(assert (=> start!80008 true))

(declare-fun mapNonEmpty!32374 () Bool)

(declare-fun tp!62119 () Bool)

(assert (=> mapNonEmpty!32374 (= mapRes!32374 (and tp!62119 e!528719))))

(declare-fun mapRest!32374 () (Array (_ BitVec 32) ValueCell!9713))

(declare-fun mapKey!32374 () (_ BitVec 32))

(declare-fun mapValue!32374 () ValueCell!9713)

(assert (=> mapNonEmpty!32374 (= (arr!27281 (_values!5602 thiss!1141)) (store mapRest!32374 mapKey!32374 mapValue!32374))))

(declare-fun b!940665 () Bool)

(declare-fun res!632519 () Bool)

(assert (=> b!940665 (=> res!632519 e!528714)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56693 (_ BitVec 32)) Bool)

(assert (=> b!940665 (= res!632519 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10424 thiss!1141) (mask!27123 thiss!1141))))))

(declare-fun array_inv!21270 (array!56693) Bool)

(declare-fun array_inv!21271 (array!56691) Bool)

(assert (=> b!940666 (= e!528720 (and tp!62118 tp_is_empty!20389 (array_inv!21270 (_keys!10424 thiss!1141)) (array_inv!21271 (_values!5602 thiss!1141)) e!528713))))

(assert (= (and start!80008 res!632515) b!940657))

(assert (= (and b!940657 res!632514) b!940660))

(assert (= (and b!940660 res!632516) b!940659))

(assert (= (and b!940659 (not res!632518)) b!940658))

(assert (= (and b!940658 (not res!632517)) b!940665))

(assert (= (and b!940665 (not res!632519)) b!940663))

(assert (= (and b!940661 condMapEmpty!32374) mapIsEmpty!32374))

(assert (= (and b!940661 (not condMapEmpty!32374)) mapNonEmpty!32374))

(assert (= (and mapNonEmpty!32374 ((_ is ValueCellFull!9713) mapValue!32374)) b!940664))

(assert (= (and b!940661 ((_ is ValueCellFull!9713) mapDefault!32374)) b!940662))

(assert (= b!940666 b!940661))

(assert (= start!80008 b!940666))

(declare-fun m!875435 () Bool)

(assert (=> b!940659 m!875435))

(declare-fun m!875437 () Bool)

(assert (=> b!940659 m!875437))

(declare-fun m!875439 () Bool)

(assert (=> b!940659 m!875439))

(declare-fun m!875441 () Bool)

(assert (=> b!940660 m!875441))

(declare-fun m!875443 () Bool)

(assert (=> b!940666 m!875443))

(declare-fun m!875445 () Bool)

(assert (=> b!940666 m!875445))

(declare-fun m!875447 () Bool)

(assert (=> b!940663 m!875447))

(declare-fun m!875449 () Bool)

(assert (=> start!80008 m!875449))

(declare-fun m!875451 () Bool)

(assert (=> mapNonEmpty!32374 m!875451))

(declare-fun m!875453 () Bool)

(assert (=> b!940665 m!875453))

(check-sat (not b!940666) (not b!940665) (not b!940660) b_and!29267 tp_is_empty!20389 (not b_next!17881) (not b!940663) (not b!940659) (not mapNonEmpty!32374) (not start!80008))
(check-sat b_and!29267 (not b_next!17881))
