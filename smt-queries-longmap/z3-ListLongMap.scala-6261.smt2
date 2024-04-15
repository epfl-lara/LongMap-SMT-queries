; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80014 () Bool)

(assert start!80014)

(declare-fun b!940748 () Bool)

(declare-fun b_free!17887 () Bool)

(declare-fun b_next!17887 () Bool)

(assert (=> b!940748 (= b_free!17887 (not b_next!17887))))

(declare-fun tp!62137 () Bool)

(declare-fun b_and!29273 () Bool)

(assert (=> b!940748 (= tp!62137 b_and!29273)))

(declare-fun mapNonEmpty!32383 () Bool)

(declare-fun mapRes!32383 () Bool)

(declare-fun tp!62136 () Bool)

(declare-fun e!528790 () Bool)

(assert (=> mapNonEmpty!32383 (= mapRes!32383 (and tp!62136 e!528790))))

(declare-datatypes ((V!32159 0))(
  ( (V!32160 (val!10248 Int)) )
))
(declare-datatypes ((ValueCell!9716 0))(
  ( (ValueCellFull!9716 (v!12778 V!32159)) (EmptyCell!9716) )
))
(declare-fun mapRest!32383 () (Array (_ BitVec 32) ValueCell!9716))

(declare-fun mapKey!32383 () (_ BitVec 32))

(declare-datatypes ((array!56703 0))(
  ( (array!56704 (arr!27287 (Array (_ BitVec 32) ValueCell!9716)) (size!27750 (_ BitVec 32))) )
))
(declare-datatypes ((array!56705 0))(
  ( (array!56706 (arr!27288 (Array (_ BitVec 32) (_ BitVec 64))) (size!27751 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4582 0))(
  ( (LongMapFixedSize!4583 (defaultEntry!5582 Int) (mask!27128 (_ BitVec 32)) (extraKeys!5314 (_ BitVec 32)) (zeroValue!5418 V!32159) (minValue!5418 V!32159) (_size!2346 (_ BitVec 32)) (_keys!10427 array!56705) (_values!5605 array!56703) (_vacant!2346 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4582)

(declare-fun mapValue!32383 () ValueCell!9716)

(assert (=> mapNonEmpty!32383 (= (arr!27287 (_values!5605 thiss!1141)) (store mapRest!32383 mapKey!32383 mapValue!32383))))

(declare-fun b!940747 () Bool)

(declare-fun res!632568 () Bool)

(declare-fun e!528786 () Bool)

(assert (=> b!940747 (=> (not res!632568) (not e!528786))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940747 (= res!632568 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!20395 () Bool)

(declare-fun e!528787 () Bool)

(declare-fun e!528792 () Bool)

(declare-fun array_inv!21272 (array!56705) Bool)

(declare-fun array_inv!21273 (array!56703) Bool)

(assert (=> b!940748 (= e!528787 (and tp!62137 tp_is_empty!20395 (array_inv!21272 (_keys!10427 thiss!1141)) (array_inv!21273 (_values!5605 thiss!1141)) e!528792))))

(declare-fun b!940749 () Bool)

(declare-fun e!528788 () Bool)

(declare-fun e!528785 () Bool)

(assert (=> b!940749 (= e!528788 (not e!528785))))

(declare-fun res!632573 () Bool)

(assert (=> b!940749 (=> res!632573 e!528785)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940749 (= res!632573 (not (validMask!0 (mask!27128 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940749 (arrayContainsKey!0 (_keys!10427 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9012 0))(
  ( (MissingZero!9012 (index!38419 (_ BitVec 32))) (Found!9012 (index!38420 (_ BitVec 32))) (Intermediate!9012 (undefined!9824 Bool) (index!38421 (_ BitVec 32)) (x!80716 (_ BitVec 32))) (Undefined!9012) (MissingVacant!9012 (index!38422 (_ BitVec 32))) )
))
(declare-fun lt!424639 () SeekEntryResult!9012)

(declare-datatypes ((Unit!31677 0))(
  ( (Unit!31678) )
))
(declare-fun lt!424640 () Unit!31677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56705 (_ BitVec 64) (_ BitVec 32)) Unit!31677)

(assert (=> b!940749 (= lt!424640 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10427 thiss!1141) key!756 (index!38420 lt!424639)))))

(declare-fun res!632572 () Bool)

(assert (=> start!80014 (=> (not res!632572) (not e!528786))))

(declare-fun valid!1763 (LongMapFixedSize!4582) Bool)

(assert (=> start!80014 (= res!632572 (valid!1763 thiss!1141))))

(assert (=> start!80014 e!528786))

(assert (=> start!80014 e!528787))

(assert (=> start!80014 true))

(declare-fun b!940750 () Bool)

(declare-fun res!632571 () Bool)

(assert (=> b!940750 (=> res!632571 e!528785)))

(assert (=> b!940750 (= res!632571 (or (not (= (size!27750 (_values!5605 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27128 thiss!1141)))) (not (= (size!27751 (_keys!10427 thiss!1141)) (size!27750 (_values!5605 thiss!1141)))) (bvslt (mask!27128 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5314 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5314 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32383 () Bool)

(assert (=> mapIsEmpty!32383 mapRes!32383))

(declare-fun b!940751 () Bool)

(assert (=> b!940751 (= e!528785 true)))

(declare-fun lt!424638 () Bool)

(declare-datatypes ((List!19212 0))(
  ( (Nil!19209) (Cons!19208 (h!20354 (_ BitVec 64)) (t!27518 List!19212)) )
))
(declare-fun arrayNoDuplicates!0 (array!56705 (_ BitVec 32) List!19212) Bool)

(assert (=> b!940751 (= lt!424638 (arrayNoDuplicates!0 (_keys!10427 thiss!1141) #b00000000000000000000000000000000 Nil!19209))))

(declare-fun b!940752 () Bool)

(assert (=> b!940752 (= e!528790 tp_is_empty!20395)))

(declare-fun b!940753 () Bool)

(assert (=> b!940753 (= e!528786 e!528788)))

(declare-fun res!632570 () Bool)

(assert (=> b!940753 (=> (not res!632570) (not e!528788))))

(get-info :version)

(assert (=> b!940753 (= res!632570 ((_ is Found!9012) lt!424639))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56705 (_ BitVec 32)) SeekEntryResult!9012)

(assert (=> b!940753 (= lt!424639 (seekEntry!0 key!756 (_keys!10427 thiss!1141) (mask!27128 thiss!1141)))))

(declare-fun b!940754 () Bool)

(declare-fun res!632569 () Bool)

(assert (=> b!940754 (=> res!632569 e!528785)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56705 (_ BitVec 32)) Bool)

(assert (=> b!940754 (= res!632569 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10427 thiss!1141) (mask!27128 thiss!1141))))))

(declare-fun b!940755 () Bool)

(declare-fun e!528789 () Bool)

(assert (=> b!940755 (= e!528792 (and e!528789 mapRes!32383))))

(declare-fun condMapEmpty!32383 () Bool)

(declare-fun mapDefault!32383 () ValueCell!9716)

(assert (=> b!940755 (= condMapEmpty!32383 (= (arr!27287 (_values!5605 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9716)) mapDefault!32383)))))

(declare-fun b!940756 () Bool)

(assert (=> b!940756 (= e!528789 tp_is_empty!20395)))

(assert (= (and start!80014 res!632572) b!940747))

(assert (= (and b!940747 res!632568) b!940753))

(assert (= (and b!940753 res!632570) b!940749))

(assert (= (and b!940749 (not res!632573)) b!940750))

(assert (= (and b!940750 (not res!632571)) b!940754))

(assert (= (and b!940754 (not res!632569)) b!940751))

(assert (= (and b!940755 condMapEmpty!32383) mapIsEmpty!32383))

(assert (= (and b!940755 (not condMapEmpty!32383)) mapNonEmpty!32383))

(assert (= (and mapNonEmpty!32383 ((_ is ValueCellFull!9716) mapValue!32383)) b!940752))

(assert (= (and b!940755 ((_ is ValueCellFull!9716) mapDefault!32383)) b!940756))

(assert (= b!940748 b!940755))

(assert (= start!80014 b!940748))

(declare-fun m!875495 () Bool)

(assert (=> b!940753 m!875495))

(declare-fun m!875497 () Bool)

(assert (=> start!80014 m!875497))

(declare-fun m!875499 () Bool)

(assert (=> mapNonEmpty!32383 m!875499))

(declare-fun m!875501 () Bool)

(assert (=> b!940748 m!875501))

(declare-fun m!875503 () Bool)

(assert (=> b!940748 m!875503))

(declare-fun m!875505 () Bool)

(assert (=> b!940754 m!875505))

(declare-fun m!875507 () Bool)

(assert (=> b!940749 m!875507))

(declare-fun m!875509 () Bool)

(assert (=> b!940749 m!875509))

(declare-fun m!875511 () Bool)

(assert (=> b!940749 m!875511))

(declare-fun m!875513 () Bool)

(assert (=> b!940751 m!875513))

(check-sat (not b!940751) b_and!29273 tp_is_empty!20395 (not mapNonEmpty!32383) (not b!940748) (not b_next!17887) (not b!940754) (not start!80014) (not b!940753) (not b!940749))
(check-sat b_and!29273 (not b_next!17887))
