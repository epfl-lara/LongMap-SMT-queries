; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75726 () Bool)

(assert start!75726)

(declare-fun b!890434 () Bool)

(declare-fun b_free!15715 () Bool)

(declare-fun b_next!15715 () Bool)

(assert (=> b!890434 (= b_free!15715 (not b_next!15715))))

(declare-fun tp!55115 () Bool)

(declare-fun b_and!25929 () Bool)

(assert (=> b!890434 (= tp!55115 b_and!25929)))

(declare-fun b!890424 () Bool)

(declare-fun e!496667 () Bool)

(declare-fun tp_is_empty!18043 () Bool)

(assert (=> b!890424 (= e!496667 tp_is_empty!18043)))

(declare-fun mapIsEmpty!28619 () Bool)

(declare-fun mapRes!28619 () Bool)

(assert (=> mapIsEmpty!28619 mapRes!28619))

(declare-fun res!603359 () Bool)

(declare-fun e!496662 () Bool)

(assert (=> start!75726 (=> (not res!603359) (not e!496662))))

(declare-datatypes ((array!52049 0))(
  ( (array!52050 (arr!25031 (Array (_ BitVec 32) (_ BitVec 64))) (size!25477 (_ BitVec 32))) )
))
(declare-datatypes ((V!29023 0))(
  ( (V!29024 (val!9072 Int)) )
))
(declare-datatypes ((ValueCell!8540 0))(
  ( (ValueCellFull!8540 (v!11544 V!29023)) (EmptyCell!8540) )
))
(declare-datatypes ((array!52051 0))(
  ( (array!52052 (arr!25032 (Array (_ BitVec 32) ValueCell!8540)) (size!25478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4096 0))(
  ( (LongMapFixedSize!4097 (defaultEntry!5245 Int) (mask!25717 (_ BitVec 32)) (extraKeys!4939 (_ BitVec 32)) (zeroValue!5043 V!29023) (minValue!5043 V!29023) (_size!2103 (_ BitVec 32)) (_keys!9923 array!52049) (_values!5230 array!52051) (_vacant!2103 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4096)

(declare-fun valid!1597 (LongMapFixedSize!4096) Bool)

(assert (=> start!75726 (= res!603359 (valid!1597 thiss!1181))))

(assert (=> start!75726 e!496662))

(declare-fun e!496664 () Bool)

(assert (=> start!75726 e!496664))

(assert (=> start!75726 true))

(declare-fun b!890425 () Bool)

(declare-fun e!496669 () Bool)

(declare-datatypes ((SeekEntryResult!8807 0))(
  ( (MissingZero!8807 (index!37599 (_ BitVec 32))) (Found!8807 (index!37600 (_ BitVec 32))) (Intermediate!8807 (undefined!9619 Bool) (index!37601 (_ BitVec 32)) (x!75666 (_ BitVec 32))) (Undefined!8807) (MissingVacant!8807 (index!37602 (_ BitVec 32))) )
))
(declare-fun lt!402143 () SeekEntryResult!8807)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890425 (= e!496669 (inRange!0 (index!37600 lt!402143) (mask!25717 thiss!1181)))))

(declare-fun mapNonEmpty!28619 () Bool)

(declare-fun tp!55114 () Bool)

(assert (=> mapNonEmpty!28619 (= mapRes!28619 (and tp!55114 e!496667))))

(declare-fun mapValue!28619 () ValueCell!8540)

(declare-fun mapKey!28619 () (_ BitVec 32))

(declare-fun mapRest!28619 () (Array (_ BitVec 32) ValueCell!8540))

(assert (=> mapNonEmpty!28619 (= (arr!25032 (_values!5230 thiss!1181)) (store mapRest!28619 mapKey!28619 mapValue!28619))))

(declare-fun b!890426 () Bool)

(declare-fun res!603356 () Bool)

(declare-fun e!496663 () Bool)

(assert (=> b!890426 (=> res!603356 e!496663)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52049 (_ BitVec 32)) Bool)

(assert (=> b!890426 (= res!603356 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9923 thiss!1181) (mask!25717 thiss!1181))))))

(declare-fun b!890427 () Bool)

(declare-fun res!603357 () Bool)

(assert (=> b!890427 (=> (not res!603357) (not e!496662))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890427 (= res!603357 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890428 () Bool)

(declare-fun e!496666 () Bool)

(declare-fun e!496665 () Bool)

(assert (=> b!890428 (= e!496666 (and e!496665 mapRes!28619))))

(declare-fun condMapEmpty!28619 () Bool)

(declare-fun mapDefault!28619 () ValueCell!8540)

(assert (=> b!890428 (= condMapEmpty!28619 (= (arr!25032 (_values!5230 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8540)) mapDefault!28619)))))

(declare-fun b!890429 () Bool)

(declare-fun e!496668 () Bool)

(assert (=> b!890429 (= e!496662 (not e!496668))))

(declare-fun res!603360 () Bool)

(assert (=> b!890429 (=> res!603360 e!496668)))

(get-info :version)

(assert (=> b!890429 (= res!603360 (not ((_ is Found!8807) lt!402143)))))

(assert (=> b!890429 e!496669))

(declare-fun res!603358 () Bool)

(assert (=> b!890429 (=> res!603358 e!496669)))

(assert (=> b!890429 (= res!603358 (not ((_ is Found!8807) lt!402143)))))

(declare-datatypes ((Unit!30252 0))(
  ( (Unit!30253) )
))
(declare-fun lt!402146 () Unit!30252)

(declare-fun lemmaSeekEntryGivesInRangeIndex!16 (array!52049 array!52051 (_ BitVec 32) (_ BitVec 32) V!29023 V!29023 (_ BitVec 64)) Unit!30252)

(assert (=> b!890429 (= lt!402146 (lemmaSeekEntryGivesInRangeIndex!16 (_keys!9923 thiss!1181) (_values!5230 thiss!1181) (mask!25717 thiss!1181) (extraKeys!4939 thiss!1181) (zeroValue!5043 thiss!1181) (minValue!5043 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52049 (_ BitVec 32)) SeekEntryResult!8807)

(assert (=> b!890429 (= lt!402143 (seekEntry!0 key!785 (_keys!9923 thiss!1181) (mask!25717 thiss!1181)))))

(declare-fun b!890430 () Bool)

(assert (=> b!890430 (= e!496663 true)))

(declare-fun lt!402145 () Bool)

(declare-datatypes ((List!17734 0))(
  ( (Nil!17731) (Cons!17730 (h!18861 (_ BitVec 64)) (t!25024 List!17734)) )
))
(declare-fun arrayNoDuplicates!0 (array!52049 (_ BitVec 32) List!17734) Bool)

(assert (=> b!890430 (= lt!402145 (arrayNoDuplicates!0 (_keys!9923 thiss!1181) #b00000000000000000000000000000000 Nil!17731))))

(declare-fun b!890431 () Bool)

(assert (=> b!890431 (= e!496668 e!496663)))

(declare-fun res!603355 () Bool)

(assert (=> b!890431 (=> res!603355 e!496663)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890431 (= res!603355 (not (validMask!0 (mask!25717 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890431 (arrayContainsKey!0 (_keys!9923 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402144 () Unit!30252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52049 (_ BitVec 64) (_ BitVec 32)) Unit!30252)

(assert (=> b!890431 (= lt!402144 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9923 thiss!1181) key!785 (index!37600 lt!402143)))))

(declare-fun b!890432 () Bool)

(assert (=> b!890432 (= e!496665 tp_is_empty!18043)))

(declare-fun b!890433 () Bool)

(declare-fun res!603354 () Bool)

(assert (=> b!890433 (=> res!603354 e!496663)))

(assert (=> b!890433 (= res!603354 (or (not (= (size!25478 (_values!5230 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25717 thiss!1181)))) (not (= (size!25477 (_keys!9923 thiss!1181)) (size!25478 (_values!5230 thiss!1181)))) (bvslt (mask!25717 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19724 (array!52049) Bool)

(declare-fun array_inv!19725 (array!52051) Bool)

(assert (=> b!890434 (= e!496664 (and tp!55115 tp_is_empty!18043 (array_inv!19724 (_keys!9923 thiss!1181)) (array_inv!19725 (_values!5230 thiss!1181)) e!496666))))

(assert (= (and start!75726 res!603359) b!890427))

(assert (= (and b!890427 res!603357) b!890429))

(assert (= (and b!890429 (not res!603358)) b!890425))

(assert (= (and b!890429 (not res!603360)) b!890431))

(assert (= (and b!890431 (not res!603355)) b!890433))

(assert (= (and b!890433 (not res!603354)) b!890426))

(assert (= (and b!890426 (not res!603356)) b!890430))

(assert (= (and b!890428 condMapEmpty!28619) mapIsEmpty!28619))

(assert (= (and b!890428 (not condMapEmpty!28619)) mapNonEmpty!28619))

(assert (= (and mapNonEmpty!28619 ((_ is ValueCellFull!8540) mapValue!28619)) b!890424))

(assert (= (and b!890428 ((_ is ValueCellFull!8540) mapDefault!28619)) b!890432))

(assert (= b!890434 b!890428))

(assert (= start!75726 b!890434))

(declare-fun m!828391 () Bool)

(assert (=> b!890430 m!828391))

(declare-fun m!828393 () Bool)

(assert (=> start!75726 m!828393))

(declare-fun m!828395 () Bool)

(assert (=> b!890425 m!828395))

(declare-fun m!828397 () Bool)

(assert (=> b!890434 m!828397))

(declare-fun m!828399 () Bool)

(assert (=> b!890434 m!828399))

(declare-fun m!828401 () Bool)

(assert (=> b!890426 m!828401))

(declare-fun m!828403 () Bool)

(assert (=> b!890429 m!828403))

(declare-fun m!828405 () Bool)

(assert (=> b!890429 m!828405))

(declare-fun m!828407 () Bool)

(assert (=> mapNonEmpty!28619 m!828407))

(declare-fun m!828409 () Bool)

(assert (=> b!890431 m!828409))

(declare-fun m!828411 () Bool)

(assert (=> b!890431 m!828411))

(declare-fun m!828413 () Bool)

(assert (=> b!890431 m!828413))

(check-sat b_and!25929 (not b_next!15715) (not start!75726) (not b!890434) (not b!890430) (not b!890425) (not b!890431) (not mapNonEmpty!28619) (not b!890429) (not b!890426) tp_is_empty!18043)
(check-sat b_and!25929 (not b_next!15715))
