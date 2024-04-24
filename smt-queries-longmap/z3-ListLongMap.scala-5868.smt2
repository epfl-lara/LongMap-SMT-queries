; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75906 () Bool)

(assert start!75906)

(declare-fun b!891471 () Bool)

(declare-fun b_free!15709 () Bool)

(declare-fun b_next!15709 () Bool)

(assert (=> b!891471 (= b_free!15709 (not b_next!15709))))

(declare-fun tp!55097 () Bool)

(declare-fun b_and!25959 () Bool)

(assert (=> b!891471 (= tp!55097 b_and!25959)))

(declare-fun b!891467 () Bool)

(declare-fun res!603746 () Bool)

(declare-fun e!497313 () Bool)

(assert (=> b!891467 (=> (not res!603746) (not e!497313))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891467 (= res!603746 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891468 () Bool)

(declare-fun e!497311 () Bool)

(assert (=> b!891468 (= e!497313 (not e!497311))))

(declare-fun res!603751 () Bool)

(assert (=> b!891468 (=> res!603751 e!497311)))

(declare-datatypes ((SeekEntryResult!8761 0))(
  ( (MissingZero!8761 (index!37415 (_ BitVec 32))) (Found!8761 (index!37416 (_ BitVec 32))) (Intermediate!8761 (undefined!9573 Bool) (index!37417 (_ BitVec 32)) (x!75631 (_ BitVec 32))) (Undefined!8761) (MissingVacant!8761 (index!37418 (_ BitVec 32))) )
))
(declare-fun lt!402707 () SeekEntryResult!8761)

(get-info :version)

(assert (=> b!891468 (= res!603751 (not ((_ is Found!8761) lt!402707)))))

(declare-fun e!497316 () Bool)

(assert (=> b!891468 e!497316))

(declare-fun res!603749 () Bool)

(assert (=> b!891468 (=> res!603749 e!497316)))

(assert (=> b!891468 (= res!603749 (not ((_ is Found!8761) lt!402707)))))

(declare-datatypes ((Unit!30294 0))(
  ( (Unit!30295) )
))
(declare-fun lt!402704 () Unit!30294)

(declare-datatypes ((array!52093 0))(
  ( (array!52094 (arr!25048 (Array (_ BitVec 32) (_ BitVec 64))) (size!25493 (_ BitVec 32))) )
))
(declare-datatypes ((V!29015 0))(
  ( (V!29016 (val!9069 Int)) )
))
(declare-datatypes ((ValueCell!8537 0))(
  ( (ValueCellFull!8537 (v!11544 V!29015)) (EmptyCell!8537) )
))
(declare-datatypes ((array!52095 0))(
  ( (array!52096 (arr!25049 (Array (_ BitVec 32) ValueCell!8537)) (size!25494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4090 0))(
  ( (LongMapFixedSize!4091 (defaultEntry!5242 Int) (mask!25762 (_ BitVec 32)) (extraKeys!4936 (_ BitVec 32)) (zeroValue!5040 V!29015) (minValue!5040 V!29015) (_size!2100 (_ BitVec 32)) (_keys!9953 array!52093) (_values!5227 array!52095) (_vacant!2100 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4090)

(declare-fun lemmaSeekEntryGivesInRangeIndex!18 (array!52093 array!52095 (_ BitVec 32) (_ BitVec 32) V!29015 V!29015 (_ BitVec 64)) Unit!30294)

(assert (=> b!891468 (= lt!402704 (lemmaSeekEntryGivesInRangeIndex!18 (_keys!9953 thiss!1181) (_values!5227 thiss!1181) (mask!25762 thiss!1181) (extraKeys!4936 thiss!1181) (zeroValue!5040 thiss!1181) (minValue!5040 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52093 (_ BitVec 32)) SeekEntryResult!8761)

(assert (=> b!891468 (= lt!402707 (seekEntry!0 key!785 (_keys!9953 thiss!1181) (mask!25762 thiss!1181)))))

(declare-fun b!891470 () Bool)

(declare-fun res!603748 () Bool)

(declare-fun e!497315 () Bool)

(assert (=> b!891470 (=> res!603748 e!497315)))

(assert (=> b!891470 (= res!603748 (or (not (= (size!25494 (_values!5227 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25762 thiss!1181)))) (not (= (size!25493 (_keys!9953 thiss!1181)) (size!25494 (_values!5227 thiss!1181)))) (bvslt (mask!25762 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28610 () Bool)

(declare-fun mapRes!28610 () Bool)

(assert (=> mapIsEmpty!28610 mapRes!28610))

(declare-fun e!497312 () Bool)

(declare-fun tp_is_empty!18037 () Bool)

(declare-fun e!497318 () Bool)

(declare-fun array_inv!19740 (array!52093) Bool)

(declare-fun array_inv!19741 (array!52095) Bool)

(assert (=> b!891471 (= e!497312 (and tp!55097 tp_is_empty!18037 (array_inv!19740 (_keys!9953 thiss!1181)) (array_inv!19741 (_values!5227 thiss!1181)) e!497318))))

(declare-fun b!891472 () Bool)

(assert (=> b!891472 (= e!497315 true)))

(declare-fun lt!402705 () Bool)

(declare-datatypes ((List!17678 0))(
  ( (Nil!17675) (Cons!17674 (h!18811 (_ BitVec 64)) (t!24969 List!17678)) )
))
(declare-fun arrayNoDuplicates!0 (array!52093 (_ BitVec 32) List!17678) Bool)

(assert (=> b!891472 (= lt!402705 (arrayNoDuplicates!0 (_keys!9953 thiss!1181) #b00000000000000000000000000000000 Nil!17675))))

(declare-fun mapNonEmpty!28610 () Bool)

(declare-fun tp!55096 () Bool)

(declare-fun e!497317 () Bool)

(assert (=> mapNonEmpty!28610 (= mapRes!28610 (and tp!55096 e!497317))))

(declare-fun mapKey!28610 () (_ BitVec 32))

(declare-fun mapRest!28610 () (Array (_ BitVec 32) ValueCell!8537))

(declare-fun mapValue!28610 () ValueCell!8537)

(assert (=> mapNonEmpty!28610 (= (arr!25049 (_values!5227 thiss!1181)) (store mapRest!28610 mapKey!28610 mapValue!28610))))

(declare-fun b!891469 () Bool)

(declare-fun e!497319 () Bool)

(assert (=> b!891469 (= e!497319 tp_is_empty!18037)))

(declare-fun res!603750 () Bool)

(assert (=> start!75906 (=> (not res!603750) (not e!497313))))

(declare-fun valid!1599 (LongMapFixedSize!4090) Bool)

(assert (=> start!75906 (= res!603750 (valid!1599 thiss!1181))))

(assert (=> start!75906 e!497313))

(assert (=> start!75906 e!497312))

(assert (=> start!75906 true))

(declare-fun b!891473 () Bool)

(assert (=> b!891473 (= e!497318 (and e!497319 mapRes!28610))))

(declare-fun condMapEmpty!28610 () Bool)

(declare-fun mapDefault!28610 () ValueCell!8537)

(assert (=> b!891473 (= condMapEmpty!28610 (= (arr!25049 (_values!5227 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8537)) mapDefault!28610)))))

(declare-fun b!891474 () Bool)

(declare-fun res!603745 () Bool)

(assert (=> b!891474 (=> res!603745 e!497315)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52093 (_ BitVec 32)) Bool)

(assert (=> b!891474 (= res!603745 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9953 thiss!1181) (mask!25762 thiss!1181))))))

(declare-fun b!891475 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891475 (= e!497316 (inRange!0 (index!37416 lt!402707) (mask!25762 thiss!1181)))))

(declare-fun b!891476 () Bool)

(assert (=> b!891476 (= e!497317 tp_is_empty!18037)))

(declare-fun b!891477 () Bool)

(assert (=> b!891477 (= e!497311 e!497315)))

(declare-fun res!603747 () Bool)

(assert (=> b!891477 (=> res!603747 e!497315)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891477 (= res!603747 (not (validMask!0 (mask!25762 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891477 (arrayContainsKey!0 (_keys!9953 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402706 () Unit!30294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52093 (_ BitVec 64) (_ BitVec 32)) Unit!30294)

(assert (=> b!891477 (= lt!402706 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9953 thiss!1181) key!785 (index!37416 lt!402707)))))

(assert (= (and start!75906 res!603750) b!891467))

(assert (= (and b!891467 res!603746) b!891468))

(assert (= (and b!891468 (not res!603749)) b!891475))

(assert (= (and b!891468 (not res!603751)) b!891477))

(assert (= (and b!891477 (not res!603747)) b!891470))

(assert (= (and b!891470 (not res!603748)) b!891474))

(assert (= (and b!891474 (not res!603745)) b!891472))

(assert (= (and b!891473 condMapEmpty!28610) mapIsEmpty!28610))

(assert (= (and b!891473 (not condMapEmpty!28610)) mapNonEmpty!28610))

(assert (= (and mapNonEmpty!28610 ((_ is ValueCellFull!8537) mapValue!28610)) b!891476))

(assert (= (and b!891473 ((_ is ValueCellFull!8537) mapDefault!28610)) b!891469))

(assert (= b!891471 b!891473))

(assert (= start!75906 b!891471))

(declare-fun m!830371 () Bool)

(assert (=> start!75906 m!830371))

(declare-fun m!830373 () Bool)

(assert (=> b!891471 m!830373))

(declare-fun m!830375 () Bool)

(assert (=> b!891471 m!830375))

(declare-fun m!830377 () Bool)

(assert (=> b!891474 m!830377))

(declare-fun m!830379 () Bool)

(assert (=> b!891477 m!830379))

(declare-fun m!830381 () Bool)

(assert (=> b!891477 m!830381))

(declare-fun m!830383 () Bool)

(assert (=> b!891477 m!830383))

(declare-fun m!830385 () Bool)

(assert (=> mapNonEmpty!28610 m!830385))

(declare-fun m!830387 () Bool)

(assert (=> b!891472 m!830387))

(declare-fun m!830389 () Bool)

(assert (=> b!891468 m!830389))

(declare-fun m!830391 () Bool)

(assert (=> b!891468 m!830391))

(declare-fun m!830393 () Bool)

(assert (=> b!891475 m!830393))

(check-sat (not b!891474) tp_is_empty!18037 (not b!891472) (not b!891475) b_and!25959 (not mapNonEmpty!28610) (not b!891468) (not b!891477) (not start!75906) (not b_next!15709) (not b!891471))
(check-sat b_and!25959 (not b_next!15709))
