; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75786 () Bool)

(assert start!75786)

(declare-fun b!891457 () Bool)

(declare-fun b_free!15775 () Bool)

(declare-fun b_next!15775 () Bool)

(assert (=> b!891457 (= b_free!15775 (not b_next!15775))))

(declare-fun tp!55295 () Bool)

(declare-fun b_and!25989 () Bool)

(assert (=> b!891457 (= tp!55295 b_and!25989)))

(declare-fun b!891452 () Bool)

(declare-fun res!604024 () Bool)

(declare-fun e!497472 () Bool)

(assert (=> b!891452 (=> res!604024 e!497472)))

(declare-datatypes ((array!52169 0))(
  ( (array!52170 (arr!25091 (Array (_ BitVec 32) (_ BitVec 64))) (size!25537 (_ BitVec 32))) )
))
(declare-datatypes ((V!29103 0))(
  ( (V!29104 (val!9102 Int)) )
))
(declare-datatypes ((ValueCell!8570 0))(
  ( (ValueCellFull!8570 (v!11574 V!29103)) (EmptyCell!8570) )
))
(declare-datatypes ((array!52171 0))(
  ( (array!52172 (arr!25092 (Array (_ BitVec 32) ValueCell!8570)) (size!25538 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4156 0))(
  ( (LongMapFixedSize!4157 (defaultEntry!5275 Int) (mask!25767 (_ BitVec 32)) (extraKeys!4969 (_ BitVec 32)) (zeroValue!5073 V!29103) (minValue!5073 V!29103) (_size!2133 (_ BitVec 32)) (_keys!9953 array!52169) (_values!5260 array!52171) (_vacant!2133 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4156)

(assert (=> b!891452 (= res!604024 (or (not (= (size!25538 (_values!5260 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25767 thiss!1181)))) (not (= (size!25537 (_keys!9953 thiss!1181)) (size!25538 (_values!5260 thiss!1181)))) (bvslt (mask!25767 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891453 () Bool)

(assert (=> b!891453 (= e!497472 true)))

(declare-fun lt!402583 () Bool)

(declare-datatypes ((tuple2!11978 0))(
  ( (tuple2!11979 (_1!6000 (_ BitVec 64)) (_2!6000 V!29103)) )
))
(declare-datatypes ((List!17761 0))(
  ( (Nil!17758) (Cons!17757 (h!18888 tuple2!11978) (t!25051 List!17761)) )
))
(declare-datatypes ((ListLongMap!10665 0))(
  ( (ListLongMap!10666 (toList!5348 List!17761)) )
))
(declare-fun lt!402580 () ListLongMap!10665)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4318 (ListLongMap!10665 (_ BitVec 64)) Bool)

(assert (=> b!891453 (= lt!402583 (contains!4318 lt!402580 key!785))))

(declare-fun b!891454 () Bool)

(declare-fun e!497474 () Bool)

(declare-datatypes ((SeekEntryResult!8834 0))(
  ( (MissingZero!8834 (index!37707 (_ BitVec 32))) (Found!8834 (index!37708 (_ BitVec 32))) (Intermediate!8834 (undefined!9646 Bool) (index!37709 (_ BitVec 32)) (x!75773 (_ BitVec 32))) (Undefined!8834) (MissingVacant!8834 (index!37710 (_ BitVec 32))) )
))
(declare-fun lt!402579 () SeekEntryResult!8834)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891454 (= e!497474 (inRange!0 (index!37708 lt!402579) (mask!25767 thiss!1181)))))

(declare-fun b!891455 () Bool)

(declare-fun res!604026 () Bool)

(assert (=> b!891455 (=> res!604026 e!497472)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52169 (_ BitVec 32)) Bool)

(assert (=> b!891455 (= res!604026 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9953 thiss!1181) (mask!25767 thiss!1181))))))

(declare-fun b!891456 () Bool)

(declare-fun res!604029 () Bool)

(assert (=> b!891456 (=> res!604029 e!497472)))

(declare-datatypes ((List!17762 0))(
  ( (Nil!17759) (Cons!17758 (h!18889 (_ BitVec 64)) (t!25052 List!17762)) )
))
(declare-fun arrayNoDuplicates!0 (array!52169 (_ BitVec 32) List!17762) Bool)

(assert (=> b!891456 (= res!604029 (not (arrayNoDuplicates!0 (_keys!9953 thiss!1181) #b00000000000000000000000000000000 Nil!17759)))))

(declare-fun e!497476 () Bool)

(declare-fun tp_is_empty!18103 () Bool)

(declare-fun e!497477 () Bool)

(declare-fun array_inv!19772 (array!52169) Bool)

(declare-fun array_inv!19773 (array!52171) Bool)

(assert (=> b!891457 (= e!497476 (and tp!55295 tp_is_empty!18103 (array_inv!19772 (_keys!9953 thiss!1181)) (array_inv!19773 (_values!5260 thiss!1181)) e!497477))))

(declare-fun b!891458 () Bool)

(declare-fun e!497473 () Bool)

(assert (=> b!891458 (= e!497473 tp_is_empty!18103)))

(declare-fun b!891459 () Bool)

(declare-fun e!497475 () Bool)

(assert (=> b!891459 (= e!497475 tp_is_empty!18103)))

(declare-fun b!891460 () Bool)

(declare-fun e!497480 () Bool)

(assert (=> b!891460 (= e!497480 e!497472)))

(declare-fun res!604022 () Bool)

(assert (=> b!891460 (=> res!604022 e!497472)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891460 (= res!604022 (not (validMask!0 (mask!25767 thiss!1181))))))

(assert (=> b!891460 (contains!4318 lt!402580 (select (arr!25091 (_keys!9953 thiss!1181)) (index!37708 lt!402579)))))

(declare-fun getCurrentListMap!2576 (array!52169 array!52171 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) ListLongMap!10665)

(assert (=> b!891460 (= lt!402580 (getCurrentListMap!2576 (_keys!9953 thiss!1181) (_values!5260 thiss!1181) (mask!25767 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5275 thiss!1181)))))

(declare-datatypes ((Unit!30302 0))(
  ( (Unit!30303) )
))
(declare-fun lt!402582 () Unit!30302)

(declare-fun lemmaValidKeyInArrayIsInListMap!212 (array!52169 array!52171 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) Unit!30302)

(assert (=> b!891460 (= lt!402582 (lemmaValidKeyInArrayIsInListMap!212 (_keys!9953 thiss!1181) (_values!5260 thiss!1181) (mask!25767 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) (index!37708 lt!402579) (defaultEntry!5275 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891460 (arrayContainsKey!0 (_keys!9953 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402581 () Unit!30302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52169 (_ BitVec 64) (_ BitVec 32)) Unit!30302)

(assert (=> b!891460 (= lt!402581 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9953 thiss!1181) key!785 (index!37708 lt!402579)))))

(declare-fun res!604023 () Bool)

(declare-fun e!497479 () Bool)

(assert (=> start!75786 (=> (not res!604023) (not e!497479))))

(declare-fun valid!1617 (LongMapFixedSize!4156) Bool)

(assert (=> start!75786 (= res!604023 (valid!1617 thiss!1181))))

(assert (=> start!75786 e!497479))

(assert (=> start!75786 e!497476))

(assert (=> start!75786 true))

(declare-fun b!891461 () Bool)

(declare-fun res!604027 () Bool)

(assert (=> b!891461 (=> (not res!604027) (not e!497479))))

(assert (=> b!891461 (= res!604027 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891462 () Bool)

(assert (=> b!891462 (= e!497479 (not e!497480))))

(declare-fun res!604028 () Bool)

(assert (=> b!891462 (=> res!604028 e!497480)))

(get-info :version)

(assert (=> b!891462 (= res!604028 (not ((_ is Found!8834) lt!402579)))))

(assert (=> b!891462 e!497474))

(declare-fun res!604025 () Bool)

(assert (=> b!891462 (=> res!604025 e!497474)))

(assert (=> b!891462 (= res!604025 (not ((_ is Found!8834) lt!402579)))))

(declare-fun lt!402584 () Unit!30302)

(declare-fun lemmaSeekEntryGivesInRangeIndex!40 (array!52169 array!52171 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 64)) Unit!30302)

(assert (=> b!891462 (= lt!402584 (lemmaSeekEntryGivesInRangeIndex!40 (_keys!9953 thiss!1181) (_values!5260 thiss!1181) (mask!25767 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52169 (_ BitVec 32)) SeekEntryResult!8834)

(assert (=> b!891462 (= lt!402579 (seekEntry!0 key!785 (_keys!9953 thiss!1181) (mask!25767 thiss!1181)))))

(declare-fun mapIsEmpty!28709 () Bool)

(declare-fun mapRes!28709 () Bool)

(assert (=> mapIsEmpty!28709 mapRes!28709))

(declare-fun b!891463 () Bool)

(assert (=> b!891463 (= e!497477 (and e!497473 mapRes!28709))))

(declare-fun condMapEmpty!28709 () Bool)

(declare-fun mapDefault!28709 () ValueCell!8570)

(assert (=> b!891463 (= condMapEmpty!28709 (= (arr!25092 (_values!5260 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8570)) mapDefault!28709)))))

(declare-fun mapNonEmpty!28709 () Bool)

(declare-fun tp!55294 () Bool)

(assert (=> mapNonEmpty!28709 (= mapRes!28709 (and tp!55294 e!497475))))

(declare-fun mapValue!28709 () ValueCell!8570)

(declare-fun mapKey!28709 () (_ BitVec 32))

(declare-fun mapRest!28709 () (Array (_ BitVec 32) ValueCell!8570))

(assert (=> mapNonEmpty!28709 (= (arr!25092 (_values!5260 thiss!1181)) (store mapRest!28709 mapKey!28709 mapValue!28709))))

(assert (= (and start!75786 res!604023) b!891461))

(assert (= (and b!891461 res!604027) b!891462))

(assert (= (and b!891462 (not res!604025)) b!891454))

(assert (= (and b!891462 (not res!604028)) b!891460))

(assert (= (and b!891460 (not res!604022)) b!891452))

(assert (= (and b!891452 (not res!604024)) b!891455))

(assert (= (and b!891455 (not res!604026)) b!891456))

(assert (= (and b!891456 (not res!604029)) b!891453))

(assert (= (and b!891463 condMapEmpty!28709) mapIsEmpty!28709))

(assert (= (and b!891463 (not condMapEmpty!28709)) mapNonEmpty!28709))

(assert (= (and mapNonEmpty!28709 ((_ is ValueCellFull!8570) mapValue!28709)) b!891459))

(assert (= (and b!891463 ((_ is ValueCellFull!8570) mapDefault!28709)) b!891458))

(assert (= b!891457 b!891463))

(assert (= start!75786 b!891457))

(declare-fun m!829231 () Bool)

(assert (=> mapNonEmpty!28709 m!829231))

(declare-fun m!829233 () Bool)

(assert (=> b!891460 m!829233))

(declare-fun m!829235 () Bool)

(assert (=> b!891460 m!829235))

(declare-fun m!829237 () Bool)

(assert (=> b!891460 m!829237))

(declare-fun m!829239 () Bool)

(assert (=> b!891460 m!829239))

(declare-fun m!829241 () Bool)

(assert (=> b!891460 m!829241))

(declare-fun m!829243 () Bool)

(assert (=> b!891460 m!829243))

(assert (=> b!891460 m!829233))

(declare-fun m!829245 () Bool)

(assert (=> b!891460 m!829245))

(declare-fun m!829247 () Bool)

(assert (=> start!75786 m!829247))

(declare-fun m!829249 () Bool)

(assert (=> b!891454 m!829249))

(declare-fun m!829251 () Bool)

(assert (=> b!891453 m!829251))

(declare-fun m!829253 () Bool)

(assert (=> b!891455 m!829253))

(declare-fun m!829255 () Bool)

(assert (=> b!891457 m!829255))

(declare-fun m!829257 () Bool)

(assert (=> b!891457 m!829257))

(declare-fun m!829259 () Bool)

(assert (=> b!891462 m!829259))

(declare-fun m!829261 () Bool)

(assert (=> b!891462 m!829261))

(declare-fun m!829263 () Bool)

(assert (=> b!891456 m!829263))

(check-sat b_and!25989 tp_is_empty!18103 (not b_next!15775) (not b!891455) (not b!891454) (not b!891462) (not b!891457) (not b!891456) (not mapNonEmpty!28709) (not start!75786) (not b!891453) (not b!891460))
(check-sat b_and!25989 (not b_next!15775))
