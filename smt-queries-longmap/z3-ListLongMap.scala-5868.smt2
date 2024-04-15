; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75720 () Bool)

(assert start!75720)

(declare-fun b!890328 () Bool)

(declare-fun b_free!15709 () Bool)

(declare-fun b_next!15709 () Bool)

(assert (=> b!890328 (= b_free!15709 (not b_next!15709))))

(declare-fun tp!55097 () Bool)

(declare-fun b_and!25923 () Bool)

(assert (=> b!890328 (= tp!55097 b_and!25923)))

(declare-fun mapNonEmpty!28610 () Bool)

(declare-fun mapRes!28610 () Bool)

(declare-fun tp!55096 () Bool)

(declare-fun e!496587 () Bool)

(assert (=> mapNonEmpty!28610 (= mapRes!28610 (and tp!55096 e!496587))))

(declare-datatypes ((V!29015 0))(
  ( (V!29016 (val!9069 Int)) )
))
(declare-datatypes ((ValueCell!8537 0))(
  ( (ValueCellFull!8537 (v!11541 V!29015)) (EmptyCell!8537) )
))
(declare-fun mapRest!28610 () (Array (_ BitVec 32) ValueCell!8537))

(declare-fun mapKey!28610 () (_ BitVec 32))

(declare-datatypes ((array!52037 0))(
  ( (array!52038 (arr!25025 (Array (_ BitVec 32) (_ BitVec 64))) (size!25471 (_ BitVec 32))) )
))
(declare-datatypes ((array!52039 0))(
  ( (array!52040 (arr!25026 (Array (_ BitVec 32) ValueCell!8537)) (size!25472 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4090 0))(
  ( (LongMapFixedSize!4091 (defaultEntry!5242 Int) (mask!25712 (_ BitVec 32)) (extraKeys!4936 (_ BitVec 32)) (zeroValue!5040 V!29015) (minValue!5040 V!29015) (_size!2100 (_ BitVec 32)) (_keys!9920 array!52037) (_values!5227 array!52039) (_vacant!2100 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4090)

(declare-fun mapValue!28610 () ValueCell!8537)

(assert (=> mapNonEmpty!28610 (= (arr!25026 (_values!5227 thiss!1181)) (store mapRest!28610 mapKey!28610 mapValue!28610))))

(declare-fun b!890325 () Bool)

(declare-fun e!496581 () Bool)

(declare-fun e!496582 () Bool)

(assert (=> b!890325 (= e!496581 e!496582)))

(declare-fun res!603293 () Bool)

(assert (=> b!890325 (=> res!603293 e!496582)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890325 (= res!603293 (not (validMask!0 (mask!25712 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890325 (arrayContainsKey!0 (_keys!9920 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8805 0))(
  ( (MissingZero!8805 (index!37591 (_ BitVec 32))) (Found!8805 (index!37592 (_ BitVec 32))) (Intermediate!8805 (undefined!9617 Bool) (index!37593 (_ BitVec 32)) (x!75656 (_ BitVec 32))) (Undefined!8805) (MissingVacant!8805 (index!37594 (_ BitVec 32))) )
))
(declare-fun lt!402109 () SeekEntryResult!8805)

(declare-datatypes ((Unit!30250 0))(
  ( (Unit!30251) )
))
(declare-fun lt!402110 () Unit!30250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52037 (_ BitVec 64) (_ BitVec 32)) Unit!30250)

(assert (=> b!890325 (= lt!402110 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9920 thiss!1181) key!785 (index!37592 lt!402109)))))

(declare-fun b!890326 () Bool)

(declare-fun e!496585 () Bool)

(declare-fun tp_is_empty!18037 () Bool)

(assert (=> b!890326 (= e!496585 tp_is_empty!18037)))

(declare-fun b!890327 () Bool)

(declare-fun e!496586 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890327 (= e!496586 (inRange!0 (index!37592 lt!402109) (mask!25712 thiss!1181)))))

(declare-fun e!496588 () Bool)

(declare-fun e!496583 () Bool)

(declare-fun array_inv!19720 (array!52037) Bool)

(declare-fun array_inv!19721 (array!52039) Bool)

(assert (=> b!890328 (= e!496583 (and tp!55097 tp_is_empty!18037 (array_inv!19720 (_keys!9920 thiss!1181)) (array_inv!19721 (_values!5227 thiss!1181)) e!496588))))

(declare-fun b!890329 () Bool)

(assert (=> b!890329 (= e!496588 (and e!496585 mapRes!28610))))

(declare-fun condMapEmpty!28610 () Bool)

(declare-fun mapDefault!28610 () ValueCell!8537)

(assert (=> b!890329 (= condMapEmpty!28610 (= (arr!25026 (_values!5227 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8537)) mapDefault!28610)))))

(declare-fun mapIsEmpty!28610 () Bool)

(assert (=> mapIsEmpty!28610 mapRes!28610))

(declare-fun res!603292 () Bool)

(declare-fun e!496589 () Bool)

(assert (=> start!75720 (=> (not res!603292) (not e!496589))))

(declare-fun valid!1596 (LongMapFixedSize!4090) Bool)

(assert (=> start!75720 (= res!603292 (valid!1596 thiss!1181))))

(assert (=> start!75720 e!496589))

(assert (=> start!75720 e!496583))

(assert (=> start!75720 true))

(declare-fun b!890330 () Bool)

(declare-fun res!603295 () Bool)

(assert (=> b!890330 (=> (not res!603295) (not e!496589))))

(assert (=> b!890330 (= res!603295 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890331 () Bool)

(assert (=> b!890331 (= e!496582 true)))

(declare-fun lt!402108 () Bool)

(declare-datatypes ((List!17732 0))(
  ( (Nil!17729) (Cons!17728 (h!18859 (_ BitVec 64)) (t!25022 List!17732)) )
))
(declare-fun arrayNoDuplicates!0 (array!52037 (_ BitVec 32) List!17732) Bool)

(assert (=> b!890331 (= lt!402108 (arrayNoDuplicates!0 (_keys!9920 thiss!1181) #b00000000000000000000000000000000 Nil!17729))))

(declare-fun b!890332 () Bool)

(declare-fun res!603297 () Bool)

(assert (=> b!890332 (=> res!603297 e!496582)))

(assert (=> b!890332 (= res!603297 (or (not (= (size!25472 (_values!5227 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25712 thiss!1181)))) (not (= (size!25471 (_keys!9920 thiss!1181)) (size!25472 (_values!5227 thiss!1181)))) (bvslt (mask!25712 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890333 () Bool)

(declare-fun res!603291 () Bool)

(assert (=> b!890333 (=> res!603291 e!496582)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52037 (_ BitVec 32)) Bool)

(assert (=> b!890333 (= res!603291 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9920 thiss!1181) (mask!25712 thiss!1181))))))

(declare-fun b!890334 () Bool)

(assert (=> b!890334 (= e!496587 tp_is_empty!18037)))

(declare-fun b!890335 () Bool)

(assert (=> b!890335 (= e!496589 (not e!496581))))

(declare-fun res!603294 () Bool)

(assert (=> b!890335 (=> res!603294 e!496581)))

(get-info :version)

(assert (=> b!890335 (= res!603294 (not ((_ is Found!8805) lt!402109)))))

(assert (=> b!890335 e!496586))

(declare-fun res!603296 () Bool)

(assert (=> b!890335 (=> res!603296 e!496586)))

(assert (=> b!890335 (= res!603296 (not ((_ is Found!8805) lt!402109)))))

(declare-fun lt!402107 () Unit!30250)

(declare-fun lemmaSeekEntryGivesInRangeIndex!15 (array!52037 array!52039 (_ BitVec 32) (_ BitVec 32) V!29015 V!29015 (_ BitVec 64)) Unit!30250)

(assert (=> b!890335 (= lt!402107 (lemmaSeekEntryGivesInRangeIndex!15 (_keys!9920 thiss!1181) (_values!5227 thiss!1181) (mask!25712 thiss!1181) (extraKeys!4936 thiss!1181) (zeroValue!5040 thiss!1181) (minValue!5040 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52037 (_ BitVec 32)) SeekEntryResult!8805)

(assert (=> b!890335 (= lt!402109 (seekEntry!0 key!785 (_keys!9920 thiss!1181) (mask!25712 thiss!1181)))))

(assert (= (and start!75720 res!603292) b!890330))

(assert (= (and b!890330 res!603295) b!890335))

(assert (= (and b!890335 (not res!603296)) b!890327))

(assert (= (and b!890335 (not res!603294)) b!890325))

(assert (= (and b!890325 (not res!603293)) b!890332))

(assert (= (and b!890332 (not res!603297)) b!890333))

(assert (= (and b!890333 (not res!603291)) b!890331))

(assert (= (and b!890329 condMapEmpty!28610) mapIsEmpty!28610))

(assert (= (and b!890329 (not condMapEmpty!28610)) mapNonEmpty!28610))

(assert (= (and mapNonEmpty!28610 ((_ is ValueCellFull!8537) mapValue!28610)) b!890334))

(assert (= (and b!890329 ((_ is ValueCellFull!8537) mapDefault!28610)) b!890326))

(assert (= b!890328 b!890329))

(assert (= start!75720 b!890328))

(declare-fun m!828319 () Bool)

(assert (=> b!890331 m!828319))

(declare-fun m!828321 () Bool)

(assert (=> start!75720 m!828321))

(declare-fun m!828323 () Bool)

(assert (=> mapNonEmpty!28610 m!828323))

(declare-fun m!828325 () Bool)

(assert (=> b!890333 m!828325))

(declare-fun m!828327 () Bool)

(assert (=> b!890325 m!828327))

(declare-fun m!828329 () Bool)

(assert (=> b!890325 m!828329))

(declare-fun m!828331 () Bool)

(assert (=> b!890325 m!828331))

(declare-fun m!828333 () Bool)

(assert (=> b!890327 m!828333))

(declare-fun m!828335 () Bool)

(assert (=> b!890335 m!828335))

(declare-fun m!828337 () Bool)

(assert (=> b!890335 m!828337))

(declare-fun m!828339 () Bool)

(assert (=> b!890328 m!828339))

(declare-fun m!828341 () Bool)

(assert (=> b!890328 m!828341))

(check-sat (not b!890331) (not b!890325) (not start!75720) (not b!890335) (not b!890333) (not b!890328) (not mapNonEmpty!28610) (not b_next!15709) b_and!25923 (not b!890327) tp_is_empty!18037)
(check-sat b_and!25923 (not b_next!15709))
