; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79996 () Bool)

(assert start!79996)

(declare-fun b!940453 () Bool)

(declare-fun b_free!17851 () Bool)

(declare-fun b_next!17851 () Bool)

(assert (=> b!940453 (= b_free!17851 (not b_next!17851))))

(declare-fun tp!62028 () Bool)

(declare-fun b_and!29263 () Bool)

(assert (=> b!940453 (= tp!62028 b_and!29263)))

(declare-fun res!632356 () Bool)

(declare-fun e!528503 () Bool)

(assert (=> start!79996 (=> (not res!632356) (not e!528503))))

(declare-datatypes ((V!32111 0))(
  ( (V!32112 (val!10230 Int)) )
))
(declare-datatypes ((ValueCell!9698 0))(
  ( (ValueCellFull!9698 (v!12761 V!32111)) (EmptyCell!9698) )
))
(declare-datatypes ((array!56666 0))(
  ( (array!56667 (arr!27268 (Array (_ BitVec 32) ValueCell!9698)) (size!27729 (_ BitVec 32))) )
))
(declare-datatypes ((array!56668 0))(
  ( (array!56669 (arr!27269 (Array (_ BitVec 32) (_ BitVec 64))) (size!27730 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4546 0))(
  ( (LongMapFixedSize!4547 (defaultEntry!5564 Int) (mask!27105 (_ BitVec 32)) (extraKeys!5296 (_ BitVec 32)) (zeroValue!5400 V!32111) (minValue!5400 V!32111) (_size!2328 (_ BitVec 32)) (_keys!10414 array!56668) (_values!5587 array!56666) (_vacant!2328 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4546)

(declare-fun valid!1744 (LongMapFixedSize!4546) Bool)

(assert (=> start!79996 (= res!632356 (valid!1744 thiss!1141))))

(assert (=> start!79996 e!528503))

(declare-fun e!528507 () Bool)

(assert (=> start!79996 e!528507))

(assert (=> start!79996 true))

(declare-fun b!940446 () Bool)

(declare-fun e!528502 () Bool)

(declare-fun tp_is_empty!20359 () Bool)

(assert (=> b!940446 (= e!528502 tp_is_empty!20359)))

(declare-fun b!940447 () Bool)

(declare-fun res!632359 () Bool)

(assert (=> b!940447 (=> (not res!632359) (not e!528503))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940447 (= res!632359 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940448 () Bool)

(declare-fun e!528506 () Bool)

(declare-fun e!528505 () Bool)

(assert (=> b!940448 (= e!528506 (not e!528505))))

(declare-fun res!632354 () Bool)

(assert (=> b!940448 (=> res!632354 e!528505)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940448 (= res!632354 (not (validMask!0 (mask!27105 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940448 (arrayContainsKey!0 (_keys!10414 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8998 0))(
  ( (MissingZero!8998 (index!38363 (_ BitVec 32))) (Found!8998 (index!38364 (_ BitVec 32))) (Intermediate!8998 (undefined!9810 Bool) (index!38365 (_ BitVec 32)) (x!80659 (_ BitVec 32))) (Undefined!8998) (MissingVacant!8998 (index!38366 (_ BitVec 32))) )
))
(declare-fun lt!424713 () SeekEntryResult!8998)

(declare-datatypes ((Unit!31764 0))(
  ( (Unit!31765) )
))
(declare-fun lt!424712 () Unit!31764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56668 (_ BitVec 64) (_ BitVec 32)) Unit!31764)

(assert (=> b!940448 (= lt!424712 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10414 thiss!1141) key!756 (index!38364 lt!424713)))))

(declare-fun b!940449 () Bool)

(declare-fun res!632358 () Bool)

(assert (=> b!940449 (=> res!632358 e!528505)))

(assert (=> b!940449 (= res!632358 (or (not (= (size!27729 (_values!5587 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27105 thiss!1141)))) (not (= (size!27730 (_keys!10414 thiss!1141)) (size!27729 (_values!5587 thiss!1141)))) (bvslt (mask!27105 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5296 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940450 () Bool)

(declare-fun e!528501 () Bool)

(assert (=> b!940450 (= e!528501 tp_is_empty!20359)))

(declare-fun b!940451 () Bool)

(assert (=> b!940451 (= e!528505 true)))

(declare-fun lt!424714 () Bool)

(declare-datatypes ((List!19188 0))(
  ( (Nil!19185) (Cons!19184 (h!20330 (_ BitVec 64)) (t!27503 List!19188)) )
))
(declare-fun arrayNoDuplicates!0 (array!56668 (_ BitVec 32) List!19188) Bool)

(assert (=> b!940451 (= lt!424714 (arrayNoDuplicates!0 (_keys!10414 thiss!1141) #b00000000000000000000000000000000 Nil!19185))))

(declare-fun b!940452 () Bool)

(declare-fun res!632355 () Bool)

(assert (=> b!940452 (=> res!632355 e!528505)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56668 (_ BitVec 32)) Bool)

(assert (=> b!940452 (= res!632355 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10414 thiss!1141) (mask!27105 thiss!1141))))))

(declare-fun mapNonEmpty!32329 () Bool)

(declare-fun mapRes!32329 () Bool)

(declare-fun tp!62027 () Bool)

(assert (=> mapNonEmpty!32329 (= mapRes!32329 (and tp!62027 e!528501))))

(declare-fun mapRest!32329 () (Array (_ BitVec 32) ValueCell!9698))

(declare-fun mapKey!32329 () (_ BitVec 32))

(declare-fun mapValue!32329 () ValueCell!9698)

(assert (=> mapNonEmpty!32329 (= (arr!27268 (_values!5587 thiss!1141)) (store mapRest!32329 mapKey!32329 mapValue!32329))))

(declare-fun e!528508 () Bool)

(declare-fun array_inv!21194 (array!56668) Bool)

(declare-fun array_inv!21195 (array!56666) Bool)

(assert (=> b!940453 (= e!528507 (and tp!62028 tp_is_empty!20359 (array_inv!21194 (_keys!10414 thiss!1141)) (array_inv!21195 (_values!5587 thiss!1141)) e!528508))))

(declare-fun b!940454 () Bool)

(assert (=> b!940454 (= e!528503 e!528506)))

(declare-fun res!632357 () Bool)

(assert (=> b!940454 (=> (not res!632357) (not e!528506))))

(assert (=> b!940454 (= res!632357 (is-Found!8998 lt!424713))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56668 (_ BitVec 32)) SeekEntryResult!8998)

(assert (=> b!940454 (= lt!424713 (seekEntry!0 key!756 (_keys!10414 thiss!1141) (mask!27105 thiss!1141)))))

(declare-fun b!940455 () Bool)

(assert (=> b!940455 (= e!528508 (and e!528502 mapRes!32329))))

(declare-fun condMapEmpty!32329 () Bool)

(declare-fun mapDefault!32329 () ValueCell!9698)

