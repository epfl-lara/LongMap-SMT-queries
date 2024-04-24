; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75972 () Bool)

(assert start!75972)

(declare-fun b!892596 () Bool)

(declare-fun b_free!15775 () Bool)

(declare-fun b_next!15775 () Bool)

(assert (=> b!892596 (= b_free!15775 (not b_next!15775))))

(declare-fun tp!55295 () Bool)

(declare-fun b_and!26025 () Bool)

(assert (=> b!892596 (= tp!55295 b_and!26025)))

(declare-fun b!892594 () Bool)

(declare-fun e!498210 () Bool)

(declare-datatypes ((SeekEntryResult!8788 0))(
  ( (MissingZero!8788 (index!37523 (_ BitVec 32))) (Found!8788 (index!37524 (_ BitVec 32))) (Intermediate!8788 (undefined!9600 Bool) (index!37525 (_ BitVec 32)) (x!75746 (_ BitVec 32))) (Undefined!8788) (MissingVacant!8788 (index!37526 (_ BitVec 32))) )
))
(declare-fun lt!403180 () SeekEntryResult!8788)

(declare-datatypes ((array!52225 0))(
  ( (array!52226 (arr!25114 (Array (_ BitVec 32) (_ BitVec 64))) (size!25559 (_ BitVec 32))) )
))
(declare-datatypes ((V!29103 0))(
  ( (V!29104 (val!9102 Int)) )
))
(declare-datatypes ((ValueCell!8570 0))(
  ( (ValueCellFull!8570 (v!11577 V!29103)) (EmptyCell!8570) )
))
(declare-datatypes ((array!52227 0))(
  ( (array!52228 (arr!25115 (Array (_ BitVec 32) ValueCell!8570)) (size!25560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4156 0))(
  ( (LongMapFixedSize!4157 (defaultEntry!5275 Int) (mask!25817 (_ BitVec 32)) (extraKeys!4969 (_ BitVec 32)) (zeroValue!5073 V!29103) (minValue!5073 V!29103) (_size!2133 (_ BitVec 32)) (_keys!9986 array!52225) (_values!5260 array!52227) (_vacant!2133 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4156)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892594 (= e!498210 (inRange!0 (index!37524 lt!403180) (mask!25817 thiss!1181)))))

(declare-fun mapIsEmpty!28709 () Bool)

(declare-fun mapRes!28709 () Bool)

(assert (=> mapIsEmpty!28709 mapRes!28709))

(declare-fun b!892595 () Bool)

(declare-fun e!498202 () Bool)

(declare-fun e!498205 () Bool)

(assert (=> b!892595 (= e!498202 (not e!498205))))

(declare-fun res!604480 () Bool)

(assert (=> b!892595 (=> res!604480 e!498205)))

(get-info :version)

(assert (=> b!892595 (= res!604480 (not ((_ is Found!8788) lt!403180)))))

(assert (=> b!892595 e!498210))

(declare-fun res!604477 () Bool)

(assert (=> b!892595 (=> res!604477 e!498210)))

(assert (=> b!892595 (= res!604477 (not ((_ is Found!8788) lt!403180)))))

(declare-datatypes ((Unit!30346 0))(
  ( (Unit!30347) )
))
(declare-fun lt!403177 () Unit!30346)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!40 (array!52225 array!52227 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 64)) Unit!30346)

(assert (=> b!892595 (= lt!403177 (lemmaSeekEntryGivesInRangeIndex!40 (_keys!9986 thiss!1181) (_values!5260 thiss!1181) (mask!25817 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52225 (_ BitVec 32)) SeekEntryResult!8788)

(assert (=> b!892595 (= lt!403180 (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25817 thiss!1181)))))

(declare-fun e!498209 () Bool)

(declare-fun e!498203 () Bool)

(declare-fun tp_is_empty!18103 () Bool)

(declare-fun array_inv!19784 (array!52225) Bool)

(declare-fun array_inv!19785 (array!52227) Bool)

(assert (=> b!892596 (= e!498209 (and tp!55295 tp_is_empty!18103 (array_inv!19784 (_keys!9986 thiss!1181)) (array_inv!19785 (_values!5260 thiss!1181)) e!498203))))

(declare-fun b!892597 () Bool)

(declare-fun e!498207 () Bool)

(assert (=> b!892597 (= e!498203 (and e!498207 mapRes!28709))))

(declare-fun condMapEmpty!28709 () Bool)

(declare-fun mapDefault!28709 () ValueCell!8570)

(assert (=> b!892597 (= condMapEmpty!28709 (= (arr!25115 (_values!5260 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8570)) mapDefault!28709)))))

(declare-fun b!892598 () Bool)

(declare-fun e!498206 () Bool)

(assert (=> b!892598 (= e!498205 e!498206)))

(declare-fun res!604478 () Bool)

(assert (=> b!892598 (=> res!604478 e!498206)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892598 (= res!604478 (not (validMask!0 (mask!25817 thiss!1181))))))

(declare-datatypes ((tuple2!11884 0))(
  ( (tuple2!11885 (_1!5953 (_ BitVec 64)) (_2!5953 V!29103)) )
))
(declare-datatypes ((List!17710 0))(
  ( (Nil!17707) (Cons!17706 (h!18843 tuple2!11884) (t!25001 List!17710)) )
))
(declare-datatypes ((ListLongMap!10583 0))(
  ( (ListLongMap!10584 (toList!5307 List!17710)) )
))
(declare-fun lt!403176 () ListLongMap!10583)

(declare-fun contains!4320 (ListLongMap!10583 (_ BitVec 64)) Bool)

(assert (=> b!892598 (contains!4320 lt!403176 (select (arr!25114 (_keys!9986 thiss!1181)) (index!37524 lt!403180)))))

(declare-fun getCurrentListMap!2585 (array!52225 array!52227 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) ListLongMap!10583)

(assert (=> b!892598 (= lt!403176 (getCurrentListMap!2585 (_keys!9986 thiss!1181) (_values!5260 thiss!1181) (mask!25817 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5275 thiss!1181)))))

(declare-fun lt!403181 () Unit!30346)

(declare-fun lemmaValidKeyInArrayIsInListMap!215 (array!52225 array!52227 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) Unit!30346)

(assert (=> b!892598 (= lt!403181 (lemmaValidKeyInArrayIsInListMap!215 (_keys!9986 thiss!1181) (_values!5260 thiss!1181) (mask!25817 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) (index!37524 lt!403180) (defaultEntry!5275 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892598 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403179 () Unit!30346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52225 (_ BitVec 64) (_ BitVec 32)) Unit!30346)

(assert (=> b!892598 (= lt!403179 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9986 thiss!1181) key!785 (index!37524 lt!403180)))))

(declare-fun b!892599 () Bool)

(assert (=> b!892599 (= e!498207 tp_is_empty!18103)))

(declare-fun mapNonEmpty!28709 () Bool)

(declare-fun tp!55294 () Bool)

(declare-fun e!498208 () Bool)

(assert (=> mapNonEmpty!28709 (= mapRes!28709 (and tp!55294 e!498208))))

(declare-fun mapValue!28709 () ValueCell!8570)

(declare-fun mapKey!28709 () (_ BitVec 32))

(declare-fun mapRest!28709 () (Array (_ BitVec 32) ValueCell!8570))

(assert (=> mapNonEmpty!28709 (= (arr!25115 (_values!5260 thiss!1181)) (store mapRest!28709 mapKey!28709 mapValue!28709))))

(declare-fun b!892601 () Bool)

(declare-fun res!604482 () Bool)

(assert (=> b!892601 (=> res!604482 e!498206)))

(assert (=> b!892601 (= res!604482 (or (not (= (size!25560 (_values!5260 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25817 thiss!1181)))) (not (= (size!25559 (_keys!9986 thiss!1181)) (size!25560 (_values!5260 thiss!1181)))) (bvslt (mask!25817 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892602 () Bool)

(assert (=> b!892602 (= e!498208 tp_is_empty!18103)))

(declare-fun b!892603 () Bool)

(declare-fun res!604479 () Bool)

(assert (=> b!892603 (=> res!604479 e!498206)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52225 (_ BitVec 32)) Bool)

(assert (=> b!892603 (= res!604479 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9986 thiss!1181) (mask!25817 thiss!1181))))))

(declare-fun b!892600 () Bool)

(declare-fun res!604483 () Bool)

(assert (=> b!892600 (=> (not res!604483) (not e!498202))))

(assert (=> b!892600 (= res!604483 (not (= key!785 (bvneg key!785))))))

(declare-fun res!604481 () Bool)

(assert (=> start!75972 (=> (not res!604481) (not e!498202))))

(declare-fun valid!1622 (LongMapFixedSize!4156) Bool)

(assert (=> start!75972 (= res!604481 (valid!1622 thiss!1181))))

(assert (=> start!75972 e!498202))

(assert (=> start!75972 e!498209))

(assert (=> start!75972 true))

(declare-fun b!892604 () Bool)

(declare-fun res!604476 () Bool)

(assert (=> b!892604 (=> res!604476 e!498206)))

(declare-datatypes ((List!17711 0))(
  ( (Nil!17708) (Cons!17707 (h!18844 (_ BitVec 64)) (t!25002 List!17711)) )
))
(declare-fun arrayNoDuplicates!0 (array!52225 (_ BitVec 32) List!17711) Bool)

(assert (=> b!892604 (= res!604476 (not (arrayNoDuplicates!0 (_keys!9986 thiss!1181) #b00000000000000000000000000000000 Nil!17708)))))

(declare-fun b!892605 () Bool)

(assert (=> b!892605 (= e!498206 true)))

(declare-fun lt!403178 () Bool)

(assert (=> b!892605 (= lt!403178 (contains!4320 lt!403176 key!785))))

(assert (= (and start!75972 res!604481) b!892600))

(assert (= (and b!892600 res!604483) b!892595))

(assert (= (and b!892595 (not res!604477)) b!892594))

(assert (= (and b!892595 (not res!604480)) b!892598))

(assert (= (and b!892598 (not res!604478)) b!892601))

(assert (= (and b!892601 (not res!604482)) b!892603))

(assert (= (and b!892603 (not res!604479)) b!892604))

(assert (= (and b!892604 (not res!604476)) b!892605))

(assert (= (and b!892597 condMapEmpty!28709) mapIsEmpty!28709))

(assert (= (and b!892597 (not condMapEmpty!28709)) mapNonEmpty!28709))

(assert (= (and mapNonEmpty!28709 ((_ is ValueCellFull!8570) mapValue!28709)) b!892602))

(assert (= (and b!892597 ((_ is ValueCellFull!8570) mapDefault!28709)) b!892599))

(assert (= b!892596 b!892597))

(assert (= start!75972 b!892596))

(declare-fun m!831283 () Bool)

(assert (=> b!892596 m!831283))

(declare-fun m!831285 () Bool)

(assert (=> b!892596 m!831285))

(declare-fun m!831287 () Bool)

(assert (=> b!892605 m!831287))

(declare-fun m!831289 () Bool)

(assert (=> start!75972 m!831289))

(declare-fun m!831291 () Bool)

(assert (=> b!892594 m!831291))

(declare-fun m!831293 () Bool)

(assert (=> b!892604 m!831293))

(declare-fun m!831295 () Bool)

(assert (=> mapNonEmpty!28709 m!831295))

(declare-fun m!831297 () Bool)

(assert (=> b!892598 m!831297))

(declare-fun m!831299 () Bool)

(assert (=> b!892598 m!831299))

(declare-fun m!831301 () Bool)

(assert (=> b!892598 m!831301))

(declare-fun m!831303 () Bool)

(assert (=> b!892598 m!831303))

(declare-fun m!831305 () Bool)

(assert (=> b!892598 m!831305))

(declare-fun m!831307 () Bool)

(assert (=> b!892598 m!831307))

(assert (=> b!892598 m!831297))

(declare-fun m!831309 () Bool)

(assert (=> b!892598 m!831309))

(declare-fun m!831311 () Bool)

(assert (=> b!892595 m!831311))

(declare-fun m!831313 () Bool)

(assert (=> b!892595 m!831313))

(declare-fun m!831315 () Bool)

(assert (=> b!892603 m!831315))

(check-sat (not b!892596) (not start!75972) (not b!892603) (not b!892594) (not b_next!15775) (not b!892598) (not b!892604) (not b!892605) b_and!26025 (not mapNonEmpty!28709) (not b!892595) tp_is_empty!18103)
(check-sat b_and!26025 (not b_next!15775))
