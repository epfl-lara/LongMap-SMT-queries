; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79996 () Bool)

(assert start!79996)

(declare-fun b!940482 () Bool)

(declare-fun b_free!17869 () Bool)

(declare-fun b_next!17869 () Bool)

(assert (=> b!940482 (= b_free!17869 (not b_next!17869))))

(declare-fun tp!62082 () Bool)

(declare-fun b_and!29255 () Bool)

(assert (=> b!940482 (= tp!62082 b_and!29255)))

(declare-fun b!940477 () Bool)

(declare-fun res!632411 () Bool)

(declare-fun e!528574 () Bool)

(assert (=> b!940477 (=> (not res!632411) (not e!528574))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940477 (= res!632411 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32356 () Bool)

(declare-fun mapRes!32356 () Bool)

(assert (=> mapIsEmpty!32356 mapRes!32356))

(declare-fun res!632406 () Bool)

(assert (=> start!79996 (=> (not res!632406) (not e!528574))))

(declare-datatypes ((V!32135 0))(
  ( (V!32136 (val!10239 Int)) )
))
(declare-datatypes ((ValueCell!9707 0))(
  ( (ValueCellFull!9707 (v!12769 V!32135)) (EmptyCell!9707) )
))
(declare-datatypes ((array!56667 0))(
  ( (array!56668 (arr!27269 (Array (_ BitVec 32) ValueCell!9707)) (size!27732 (_ BitVec 32))) )
))
(declare-datatypes ((array!56669 0))(
  ( (array!56670 (arr!27270 (Array (_ BitVec 32) (_ BitVec 64))) (size!27733 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4564 0))(
  ( (LongMapFixedSize!4565 (defaultEntry!5573 Int) (mask!27113 (_ BitVec 32)) (extraKeys!5305 (_ BitVec 32)) (zeroValue!5409 V!32135) (minValue!5409 V!32135) (_size!2337 (_ BitVec 32)) (_keys!10418 array!56669) (_values!5596 array!56667) (_vacant!2337 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4564)

(declare-fun valid!1757 (LongMapFixedSize!4564) Bool)

(assert (=> start!79996 (= res!632406 (valid!1757 thiss!1141))))

(assert (=> start!79996 e!528574))

(declare-fun e!528575 () Bool)

(assert (=> start!79996 e!528575))

(assert (=> start!79996 true))

(declare-fun b!940478 () Bool)

(declare-fun e!528569 () Bool)

(assert (=> b!940478 (= e!528569 true)))

(declare-fun lt!424557 () Bool)

(declare-datatypes ((List!19207 0))(
  ( (Nil!19204) (Cons!19203 (h!20349 (_ BitVec 64)) (t!27513 List!19207)) )
))
(declare-fun arrayNoDuplicates!0 (array!56669 (_ BitVec 32) List!19207) Bool)

(assert (=> b!940478 (= lt!424557 (arrayNoDuplicates!0 (_keys!10418 thiss!1141) #b00000000000000000000000000000000 Nil!19204))))

(declare-fun b!940479 () Bool)

(declare-fun res!632407 () Bool)

(assert (=> b!940479 (=> res!632407 e!528569)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56669 (_ BitVec 32)) Bool)

(assert (=> b!940479 (= res!632407 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10418 thiss!1141) (mask!27113 thiss!1141))))))

(declare-fun b!940480 () Bool)

(declare-fun res!632410 () Bool)

(assert (=> b!940480 (=> res!632410 e!528569)))

(assert (=> b!940480 (= res!632410 (or (not (= (size!27732 (_values!5596 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27113 thiss!1141)))) (not (= (size!27733 (_keys!10418 thiss!1141)) (size!27732 (_values!5596 thiss!1141)))) (bvslt (mask!27113 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5305 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5305 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940481 () Bool)

(declare-fun e!528571 () Bool)

(assert (=> b!940481 (= e!528571 (not e!528569))))

(declare-fun res!632409 () Bool)

(assert (=> b!940481 (=> res!632409 e!528569)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940481 (= res!632409 (not (validMask!0 (mask!27113 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940481 (arrayContainsKey!0 (_keys!10418 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31665 0))(
  ( (Unit!31666) )
))
(declare-fun lt!424559 () Unit!31665)

(declare-datatypes ((SeekEntryResult!9006 0))(
  ( (MissingZero!9006 (index!38395 (_ BitVec 32))) (Found!9006 (index!38396 (_ BitVec 32))) (Intermediate!9006 (undefined!9818 Bool) (index!38397 (_ BitVec 32)) (x!80686 (_ BitVec 32))) (Undefined!9006) (MissingVacant!9006 (index!38398 (_ BitVec 32))) )
))
(declare-fun lt!424558 () SeekEntryResult!9006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56669 (_ BitVec 64) (_ BitVec 32)) Unit!31665)

(assert (=> b!940481 (= lt!424559 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10418 thiss!1141) key!756 (index!38396 lt!424558)))))

(declare-fun mapNonEmpty!32356 () Bool)

(declare-fun tp!62083 () Bool)

(declare-fun e!528570 () Bool)

(assert (=> mapNonEmpty!32356 (= mapRes!32356 (and tp!62083 e!528570))))

(declare-fun mapKey!32356 () (_ BitVec 32))

(declare-fun mapValue!32356 () ValueCell!9707)

(declare-fun mapRest!32356 () (Array (_ BitVec 32) ValueCell!9707))

(assert (=> mapNonEmpty!32356 (= (arr!27269 (_values!5596 thiss!1141)) (store mapRest!32356 mapKey!32356 mapValue!32356))))

(declare-fun tp_is_empty!20377 () Bool)

(declare-fun e!528572 () Bool)

(declare-fun array_inv!21258 (array!56669) Bool)

(declare-fun array_inv!21259 (array!56667) Bool)

(assert (=> b!940482 (= e!528575 (and tp!62082 tp_is_empty!20377 (array_inv!21258 (_keys!10418 thiss!1141)) (array_inv!21259 (_values!5596 thiss!1141)) e!528572))))

(declare-fun b!940483 () Bool)

(assert (=> b!940483 (= e!528570 tp_is_empty!20377)))

(declare-fun b!940484 () Bool)

(declare-fun e!528576 () Bool)

(assert (=> b!940484 (= e!528572 (and e!528576 mapRes!32356))))

(declare-fun condMapEmpty!32356 () Bool)

(declare-fun mapDefault!32356 () ValueCell!9707)

(assert (=> b!940484 (= condMapEmpty!32356 (= (arr!27269 (_values!5596 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9707)) mapDefault!32356)))))

(declare-fun b!940485 () Bool)

(assert (=> b!940485 (= e!528576 tp_is_empty!20377)))

(declare-fun b!940486 () Bool)

(assert (=> b!940486 (= e!528574 e!528571)))

(declare-fun res!632408 () Bool)

(assert (=> b!940486 (=> (not res!632408) (not e!528571))))

(get-info :version)

(assert (=> b!940486 (= res!632408 ((_ is Found!9006) lt!424558))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56669 (_ BitVec 32)) SeekEntryResult!9006)

(assert (=> b!940486 (= lt!424558 (seekEntry!0 key!756 (_keys!10418 thiss!1141) (mask!27113 thiss!1141)))))

(assert (= (and start!79996 res!632406) b!940477))

(assert (= (and b!940477 res!632411) b!940486))

(assert (= (and b!940486 res!632408) b!940481))

(assert (= (and b!940481 (not res!632409)) b!940480))

(assert (= (and b!940480 (not res!632410)) b!940479))

(assert (= (and b!940479 (not res!632407)) b!940478))

(assert (= (and b!940484 condMapEmpty!32356) mapIsEmpty!32356))

(assert (= (and b!940484 (not condMapEmpty!32356)) mapNonEmpty!32356))

(assert (= (and mapNonEmpty!32356 ((_ is ValueCellFull!9707) mapValue!32356)) b!940483))

(assert (= (and b!940484 ((_ is ValueCellFull!9707) mapDefault!32356)) b!940485))

(assert (= b!940482 b!940484))

(assert (= start!79996 b!940482))

(declare-fun m!875315 () Bool)

(assert (=> b!940478 m!875315))

(declare-fun m!875317 () Bool)

(assert (=> start!79996 m!875317))

(declare-fun m!875319 () Bool)

(assert (=> mapNonEmpty!32356 m!875319))

(declare-fun m!875321 () Bool)

(assert (=> b!940482 m!875321))

(declare-fun m!875323 () Bool)

(assert (=> b!940482 m!875323))

(declare-fun m!875325 () Bool)

(assert (=> b!940481 m!875325))

(declare-fun m!875327 () Bool)

(assert (=> b!940481 m!875327))

(declare-fun m!875329 () Bool)

(assert (=> b!940481 m!875329))

(declare-fun m!875331 () Bool)

(assert (=> b!940486 m!875331))

(declare-fun m!875333 () Bool)

(assert (=> b!940479 m!875333))

(check-sat (not b!940479) tp_is_empty!20377 (not b_next!17869) b_and!29255 (not mapNonEmpty!32356) (not b!940482) (not start!79996) (not b!940486) (not b!940478) (not b!940481))
(check-sat b_and!29255 (not b_next!17869))
