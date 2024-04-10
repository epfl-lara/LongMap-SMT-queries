; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80010 () Bool)

(assert start!80010)

(declare-fun b!940658 () Bool)

(declare-fun b_free!17865 () Bool)

(declare-fun b_next!17865 () Bool)

(assert (=> b!940658 (= b_free!17865 (not b_next!17865))))

(declare-fun tp!62069 () Bool)

(declare-fun b_and!29277 () Bool)

(assert (=> b!940658 (= tp!62069 b_and!29277)))

(declare-fun b!940656 () Bool)

(declare-fun e!528676 () Bool)

(declare-fun e!528669 () Bool)

(declare-fun mapRes!32350 () Bool)

(assert (=> b!940656 (= e!528676 (and e!528669 mapRes!32350))))

(declare-fun condMapEmpty!32350 () Bool)

(declare-datatypes ((V!32129 0))(
  ( (V!32130 (val!10237 Int)) )
))
(declare-datatypes ((ValueCell!9705 0))(
  ( (ValueCellFull!9705 (v!12768 V!32129)) (EmptyCell!9705) )
))
(declare-datatypes ((array!56694 0))(
  ( (array!56695 (arr!27282 (Array (_ BitVec 32) ValueCell!9705)) (size!27743 (_ BitVec 32))) )
))
(declare-datatypes ((array!56696 0))(
  ( (array!56697 (arr!27283 (Array (_ BitVec 32) (_ BitVec 64))) (size!27744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4560 0))(
  ( (LongMapFixedSize!4561 (defaultEntry!5571 Int) (mask!27116 (_ BitVec 32)) (extraKeys!5303 (_ BitVec 32)) (zeroValue!5407 V!32129) (minValue!5407 V!32129) (_size!2335 (_ BitVec 32)) (_keys!10421 array!56696) (_values!5594 array!56694) (_vacant!2335 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4560)

(declare-fun mapDefault!32350 () ValueCell!9705)

(assert (=> b!940656 (= condMapEmpty!32350 (= (arr!27282 (_values!5594 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9705)) mapDefault!32350)))))

(declare-fun b!940657 () Bool)

(declare-fun e!528675 () Bool)

(assert (=> b!940657 (= e!528675 true)))

(declare-fun lt!424775 () Bool)

(declare-datatypes ((List!19193 0))(
  ( (Nil!19190) (Cons!19189 (h!20335 (_ BitVec 64)) (t!27508 List!19193)) )
))
(declare-fun arrayNoDuplicates!0 (array!56696 (_ BitVec 32) List!19193) Bool)

(assert (=> b!940657 (= lt!424775 (arrayNoDuplicates!0 (_keys!10421 thiss!1141) #b00000000000000000000000000000000 Nil!19190))))

(declare-fun mapNonEmpty!32350 () Bool)

(declare-fun tp!62070 () Bool)

(declare-fun e!528674 () Bool)

(assert (=> mapNonEmpty!32350 (= mapRes!32350 (and tp!62070 e!528674))))

(declare-fun mapRest!32350 () (Array (_ BitVec 32) ValueCell!9705))

(declare-fun mapKey!32350 () (_ BitVec 32))

(declare-fun mapValue!32350 () ValueCell!9705)

(assert (=> mapNonEmpty!32350 (= (arr!27282 (_values!5594 thiss!1141)) (store mapRest!32350 mapKey!32350 mapValue!32350))))

(declare-fun e!528671 () Bool)

(declare-fun tp_is_empty!20373 () Bool)

(declare-fun array_inv!21206 (array!56696) Bool)

(declare-fun array_inv!21207 (array!56694) Bool)

(assert (=> b!940658 (= e!528671 (and tp!62069 tp_is_empty!20373 (array_inv!21206 (_keys!10421 thiss!1141)) (array_inv!21207 (_values!5594 thiss!1141)) e!528676))))

(declare-fun b!940659 () Bool)

(declare-fun e!528672 () Bool)

(declare-fun e!528670 () Bool)

(assert (=> b!940659 (= e!528672 e!528670)))

(declare-fun res!632485 () Bool)

(assert (=> b!940659 (=> (not res!632485) (not e!528670))))

(declare-datatypes ((SeekEntryResult!9004 0))(
  ( (MissingZero!9004 (index!38387 (_ BitVec 32))) (Found!9004 (index!38388 (_ BitVec 32))) (Intermediate!9004 (undefined!9816 Bool) (index!38389 (_ BitVec 32)) (x!80681 (_ BitVec 32))) (Undefined!9004) (MissingVacant!9004 (index!38390 (_ BitVec 32))) )
))
(declare-fun lt!424776 () SeekEntryResult!9004)

(get-info :version)

(assert (=> b!940659 (= res!632485 ((_ is Found!9004) lt!424776))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56696 (_ BitVec 32)) SeekEntryResult!9004)

(assert (=> b!940659 (= lt!424776 (seekEntry!0 key!756 (_keys!10421 thiss!1141) (mask!27116 thiss!1141)))))

(declare-fun b!940660 () Bool)

(assert (=> b!940660 (= e!528669 tp_is_empty!20373)))

(declare-fun mapIsEmpty!32350 () Bool)

(assert (=> mapIsEmpty!32350 mapRes!32350))

(declare-fun b!940661 () Bool)

(assert (=> b!940661 (= e!528674 tp_is_empty!20373)))

(declare-fun b!940662 () Bool)

(declare-fun res!632482 () Bool)

(assert (=> b!940662 (=> res!632482 e!528675)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56696 (_ BitVec 32)) Bool)

(assert (=> b!940662 (= res!632482 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10421 thiss!1141) (mask!27116 thiss!1141))))))

(declare-fun b!940663 () Bool)

(assert (=> b!940663 (= e!528670 (not e!528675))))

(declare-fun res!632480 () Bool)

(assert (=> b!940663 (=> res!632480 e!528675)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940663 (= res!632480 (not (validMask!0 (mask!27116 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940663 (arrayContainsKey!0 (_keys!10421 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31774 0))(
  ( (Unit!31775) )
))
(declare-fun lt!424777 () Unit!31774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56696 (_ BitVec 64) (_ BitVec 32)) Unit!31774)

(assert (=> b!940663 (= lt!424777 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10421 thiss!1141) key!756 (index!38388 lt!424776)))))

(declare-fun b!940664 () Bool)

(declare-fun res!632481 () Bool)

(assert (=> b!940664 (=> (not res!632481) (not e!528672))))

(assert (=> b!940664 (= res!632481 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940665 () Bool)

(declare-fun res!632483 () Bool)

(assert (=> b!940665 (=> res!632483 e!528675)))

(assert (=> b!940665 (= res!632483 (or (not (= (size!27743 (_values!5594 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27116 thiss!1141)))) (not (= (size!27744 (_keys!10421 thiss!1141)) (size!27743 (_values!5594 thiss!1141)))) (bvslt (mask!27116 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5303 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5303 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!632484 () Bool)

(assert (=> start!80010 (=> (not res!632484) (not e!528672))))

(declare-fun valid!1749 (LongMapFixedSize!4560) Bool)

(assert (=> start!80010 (= res!632484 (valid!1749 thiss!1141))))

(assert (=> start!80010 e!528672))

(assert (=> start!80010 e!528671))

(assert (=> start!80010 true))

(assert (= (and start!80010 res!632484) b!940664))

(assert (= (and b!940664 res!632481) b!940659))

(assert (= (and b!940659 res!632485) b!940663))

(assert (= (and b!940663 (not res!632480)) b!940665))

(assert (= (and b!940665 (not res!632483)) b!940662))

(assert (= (and b!940662 (not res!632482)) b!940657))

(assert (= (and b!940656 condMapEmpty!32350) mapIsEmpty!32350))

(assert (= (and b!940656 (not condMapEmpty!32350)) mapNonEmpty!32350))

(assert (= (and mapNonEmpty!32350 ((_ is ValueCellFull!9705) mapValue!32350)) b!940661))

(assert (= (and b!940656 ((_ is ValueCellFull!9705) mapDefault!32350)) b!940660))

(assert (= b!940658 b!940656))

(assert (= start!80010 b!940658))

(declare-fun m!876033 () Bool)

(assert (=> b!940659 m!876033))

(declare-fun m!876035 () Bool)

(assert (=> b!940658 m!876035))

(declare-fun m!876037 () Bool)

(assert (=> b!940658 m!876037))

(declare-fun m!876039 () Bool)

(assert (=> mapNonEmpty!32350 m!876039))

(declare-fun m!876041 () Bool)

(assert (=> b!940662 m!876041))

(declare-fun m!876043 () Bool)

(assert (=> b!940663 m!876043))

(declare-fun m!876045 () Bool)

(assert (=> b!940663 m!876045))

(declare-fun m!876047 () Bool)

(assert (=> b!940663 m!876047))

(declare-fun m!876049 () Bool)

(assert (=> start!80010 m!876049))

(declare-fun m!876051 () Bool)

(assert (=> b!940657 m!876051))

(check-sat (not b!940657) (not b!940658) (not b_next!17865) (not b!940663) (not mapNonEmpty!32350) (not b!940659) (not start!80010) (not b!940662) b_and!29277 tp_is_empty!20373)
(check-sat b_and!29277 (not b_next!17865))
