; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75732 () Bool)

(assert start!75732)

(declare-fun b!890525 () Bool)

(declare-fun b_free!15721 () Bool)

(declare-fun b_next!15721 () Bool)

(assert (=> b!890525 (= b_free!15721 (not b_next!15721))))

(declare-fun tp!55132 () Bool)

(declare-fun b_and!25935 () Bool)

(assert (=> b!890525 (= tp!55132 b_and!25935)))

(declare-fun b!890523 () Bool)

(declare-fun e!496743 () Bool)

(declare-datatypes ((SeekEntryResult!8810 0))(
  ( (MissingZero!8810 (index!37611 (_ BitVec 32))) (Found!8810 (index!37612 (_ BitVec 32))) (Intermediate!8810 (undefined!9622 Bool) (index!37613 (_ BitVec 32)) (x!75677 (_ BitVec 32))) (Undefined!8810) (MissingVacant!8810 (index!37614 (_ BitVec 32))) )
))
(declare-fun lt!402181 () SeekEntryResult!8810)

(declare-datatypes ((array!52061 0))(
  ( (array!52062 (arr!25037 (Array (_ BitVec 32) (_ BitVec 64))) (size!25483 (_ BitVec 32))) )
))
(declare-datatypes ((V!29031 0))(
  ( (V!29032 (val!9075 Int)) )
))
(declare-datatypes ((ValueCell!8543 0))(
  ( (ValueCellFull!8543 (v!11547 V!29031)) (EmptyCell!8543) )
))
(declare-datatypes ((array!52063 0))(
  ( (array!52064 (arr!25038 (Array (_ BitVec 32) ValueCell!8543)) (size!25484 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4102 0))(
  ( (LongMapFixedSize!4103 (defaultEntry!5248 Int) (mask!25722 (_ BitVec 32)) (extraKeys!4942 (_ BitVec 32)) (zeroValue!5046 V!29031) (minValue!5046 V!29031) (_size!2106 (_ BitVec 32)) (_keys!9926 array!52061) (_values!5233 array!52063) (_vacant!2106 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4102)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890523 (= e!496743 (inRange!0 (index!37612 lt!402181) (mask!25722 thiss!1181)))))

(declare-fun b!890524 () Bool)

(declare-fun e!496751 () Bool)

(declare-fun tp_is_empty!18049 () Bool)

(assert (=> b!890524 (= e!496751 tp_is_empty!18049)))

(declare-fun e!496744 () Bool)

(declare-fun e!496749 () Bool)

(declare-fun array_inv!19728 (array!52061) Bool)

(declare-fun array_inv!19729 (array!52063) Bool)

(assert (=> b!890525 (= e!496744 (and tp!55132 tp_is_empty!18049 (array_inv!19728 (_keys!9926 thiss!1181)) (array_inv!19729 (_values!5233 thiss!1181)) e!496749))))

(declare-fun b!890526 () Bool)

(declare-fun res!603423 () Bool)

(declare-fun e!496745 () Bool)

(assert (=> b!890526 (=> res!603423 e!496745)))

(assert (=> b!890526 (= res!603423 (or (not (= (size!25484 (_values!5233 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25722 thiss!1181)))) (not (= (size!25483 (_keys!9926 thiss!1181)) (size!25484 (_values!5233 thiss!1181)))) (bvslt (mask!25722 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890527 () Bool)

(declare-fun e!496747 () Bool)

(declare-fun mapRes!28628 () Bool)

(assert (=> b!890527 (= e!496749 (and e!496747 mapRes!28628))))

(declare-fun condMapEmpty!28628 () Bool)

(declare-fun mapDefault!28628 () ValueCell!8543)

(assert (=> b!890527 (= condMapEmpty!28628 (= (arr!25038 (_values!5233 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8543)) mapDefault!28628)))))

(declare-fun b!890528 () Bool)

(declare-fun res!603417 () Bool)

(assert (=> b!890528 (=> res!603417 e!496745)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52061 (_ BitVec 32)) Bool)

(assert (=> b!890528 (= res!603417 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9926 thiss!1181) (mask!25722 thiss!1181))))))

(declare-fun b!890529 () Bool)

(declare-fun e!496748 () Bool)

(assert (=> b!890529 (= e!496748 e!496745)))

(declare-fun res!603422 () Bool)

(assert (=> b!890529 (=> res!603422 e!496745)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890529 (= res!603422 (not (validMask!0 (mask!25722 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890529 (arrayContainsKey!0 (_keys!9926 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30258 0))(
  ( (Unit!30259) )
))
(declare-fun lt!402179 () Unit!30258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52061 (_ BitVec 64) (_ BitVec 32)) Unit!30258)

(assert (=> b!890529 (= lt!402179 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9926 thiss!1181) key!785 (index!37612 lt!402181)))))

(declare-fun mapIsEmpty!28628 () Bool)

(assert (=> mapIsEmpty!28628 mapRes!28628))

(declare-fun b!890530 () Bool)

(assert (=> b!890530 (= e!496745 true)))

(declare-fun lt!402182 () Bool)

(declare-datatypes ((List!17735 0))(
  ( (Nil!17732) (Cons!17731 (h!18862 (_ BitVec 64)) (t!25025 List!17735)) )
))
(declare-fun arrayNoDuplicates!0 (array!52061 (_ BitVec 32) List!17735) Bool)

(assert (=> b!890530 (= lt!402182 (arrayNoDuplicates!0 (_keys!9926 thiss!1181) #b00000000000000000000000000000000 Nil!17732))))

(declare-fun res!603419 () Bool)

(declare-fun e!496750 () Bool)

(assert (=> start!75732 (=> (not res!603419) (not e!496750))))

(declare-fun valid!1599 (LongMapFixedSize!4102) Bool)

(assert (=> start!75732 (= res!603419 (valid!1599 thiss!1181))))

(assert (=> start!75732 e!496750))

(assert (=> start!75732 e!496744))

(assert (=> start!75732 true))

(declare-fun b!890531 () Bool)

(declare-fun res!603418 () Bool)

(assert (=> b!890531 (=> (not res!603418) (not e!496750))))

(assert (=> b!890531 (= res!603418 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28628 () Bool)

(declare-fun tp!55133 () Bool)

(assert (=> mapNonEmpty!28628 (= mapRes!28628 (and tp!55133 e!496751))))

(declare-fun mapValue!28628 () ValueCell!8543)

(declare-fun mapKey!28628 () (_ BitVec 32))

(declare-fun mapRest!28628 () (Array (_ BitVec 32) ValueCell!8543))

(assert (=> mapNonEmpty!28628 (= (arr!25038 (_values!5233 thiss!1181)) (store mapRest!28628 mapKey!28628 mapValue!28628))))

(declare-fun b!890532 () Bool)

(assert (=> b!890532 (= e!496750 (not e!496748))))

(declare-fun res!603421 () Bool)

(assert (=> b!890532 (=> res!603421 e!496748)))

(get-info :version)

(assert (=> b!890532 (= res!603421 (not ((_ is Found!8810) lt!402181)))))

(assert (=> b!890532 e!496743))

(declare-fun res!603420 () Bool)

(assert (=> b!890532 (=> res!603420 e!496743)))

(assert (=> b!890532 (= res!603420 (not ((_ is Found!8810) lt!402181)))))

(declare-fun lt!402180 () Unit!30258)

(declare-fun lemmaSeekEntryGivesInRangeIndex!19 (array!52061 array!52063 (_ BitVec 32) (_ BitVec 32) V!29031 V!29031 (_ BitVec 64)) Unit!30258)

(assert (=> b!890532 (= lt!402180 (lemmaSeekEntryGivesInRangeIndex!19 (_keys!9926 thiss!1181) (_values!5233 thiss!1181) (mask!25722 thiss!1181) (extraKeys!4942 thiss!1181) (zeroValue!5046 thiss!1181) (minValue!5046 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52061 (_ BitVec 32)) SeekEntryResult!8810)

(assert (=> b!890532 (= lt!402181 (seekEntry!0 key!785 (_keys!9926 thiss!1181) (mask!25722 thiss!1181)))))

(declare-fun b!890533 () Bool)

(assert (=> b!890533 (= e!496747 tp_is_empty!18049)))

(assert (= (and start!75732 res!603419) b!890531))

(assert (= (and b!890531 res!603418) b!890532))

(assert (= (and b!890532 (not res!603420)) b!890523))

(assert (= (and b!890532 (not res!603421)) b!890529))

(assert (= (and b!890529 (not res!603422)) b!890526))

(assert (= (and b!890526 (not res!603423)) b!890528))

(assert (= (and b!890528 (not res!603417)) b!890530))

(assert (= (and b!890527 condMapEmpty!28628) mapIsEmpty!28628))

(assert (= (and b!890527 (not condMapEmpty!28628)) mapNonEmpty!28628))

(assert (= (and mapNonEmpty!28628 ((_ is ValueCellFull!8543) mapValue!28628)) b!890524))

(assert (= (and b!890527 ((_ is ValueCellFull!8543) mapDefault!28628)) b!890533))

(assert (= b!890525 b!890527))

(assert (= start!75732 b!890525))

(declare-fun m!828463 () Bool)

(assert (=> b!890528 m!828463))

(declare-fun m!828465 () Bool)

(assert (=> start!75732 m!828465))

(declare-fun m!828467 () Bool)

(assert (=> b!890525 m!828467))

(declare-fun m!828469 () Bool)

(assert (=> b!890525 m!828469))

(declare-fun m!828471 () Bool)

(assert (=> b!890523 m!828471))

(declare-fun m!828473 () Bool)

(assert (=> b!890532 m!828473))

(declare-fun m!828475 () Bool)

(assert (=> b!890532 m!828475))

(declare-fun m!828477 () Bool)

(assert (=> b!890530 m!828477))

(declare-fun m!828479 () Bool)

(assert (=> b!890529 m!828479))

(declare-fun m!828481 () Bool)

(assert (=> b!890529 m!828481))

(declare-fun m!828483 () Bool)

(assert (=> b!890529 m!828483))

(declare-fun m!828485 () Bool)

(assert (=> mapNonEmpty!28628 m!828485))

(check-sat tp_is_empty!18049 b_and!25935 (not b!890523) (not start!75732) (not mapNonEmpty!28628) (not b!890532) (not b!890529) (not b_next!15721) (not b!890525) (not b!890528) (not b!890530))
(check-sat b_and!25935 (not b_next!15721))
