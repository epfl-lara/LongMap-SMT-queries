; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75960 () Bool)

(assert start!75960)

(declare-fun b!892383 () Bool)

(declare-fun b_free!15763 () Bool)

(declare-fun b_next!15763 () Bool)

(assert (=> b!892383 (= b_free!15763 (not b_next!15763))))

(declare-fun tp!55258 () Bool)

(declare-fun b_and!26013 () Bool)

(assert (=> b!892383 (= tp!55258 b_and!26013)))

(declare-fun b!892378 () Bool)

(declare-fun e!498041 () Bool)

(declare-fun e!498048 () Bool)

(declare-fun mapRes!28691 () Bool)

(assert (=> b!892378 (= e!498041 (and e!498048 mapRes!28691))))

(declare-fun condMapEmpty!28691 () Bool)

(declare-datatypes ((array!52201 0))(
  ( (array!52202 (arr!25102 (Array (_ BitVec 32) (_ BitVec 64))) (size!25547 (_ BitVec 32))) )
))
(declare-datatypes ((V!29087 0))(
  ( (V!29088 (val!9096 Int)) )
))
(declare-datatypes ((ValueCell!8564 0))(
  ( (ValueCellFull!8564 (v!11571 V!29087)) (EmptyCell!8564) )
))
(declare-datatypes ((array!52203 0))(
  ( (array!52204 (arr!25103 (Array (_ BitVec 32) ValueCell!8564)) (size!25548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4144 0))(
  ( (LongMapFixedSize!4145 (defaultEntry!5269 Int) (mask!25807 (_ BitVec 32)) (extraKeys!4963 (_ BitVec 32)) (zeroValue!5067 V!29087) (minValue!5067 V!29087) (_size!2127 (_ BitVec 32)) (_keys!9980 array!52201) (_values!5254 array!52203) (_vacant!2127 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4144)

(declare-fun mapDefault!28691 () ValueCell!8564)

(assert (=> b!892378 (= condMapEmpty!28691 (= (arr!25103 (_values!5254 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8564)) mapDefault!28691)))))

(declare-fun b!892379 () Bool)

(declare-fun res!604339 () Bool)

(declare-fun e!498047 () Bool)

(assert (=> b!892379 (=> res!604339 e!498047)))

(declare-datatypes ((List!17701 0))(
  ( (Nil!17698) (Cons!17697 (h!18834 (_ BitVec 64)) (t!24992 List!17701)) )
))
(declare-fun arrayNoDuplicates!0 (array!52201 (_ BitVec 32) List!17701) Bool)

(assert (=> b!892379 (= res!604339 (not (arrayNoDuplicates!0 (_keys!9980 thiss!1181) #b00000000000000000000000000000000 Nil!17698)))))

(declare-fun b!892380 () Bool)

(declare-fun e!498046 () Bool)

(assert (=> b!892380 (= e!498046 e!498047)))

(declare-fun res!604338 () Bool)

(assert (=> b!892380 (=> res!604338 e!498047)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892380 (= res!604338 (not (validMask!0 (mask!25807 thiss!1181))))))

(declare-datatypes ((tuple2!11874 0))(
  ( (tuple2!11875 (_1!5948 (_ BitVec 64)) (_2!5948 V!29087)) )
))
(declare-datatypes ((List!17702 0))(
  ( (Nil!17699) (Cons!17698 (h!18835 tuple2!11874) (t!24993 List!17702)) )
))
(declare-datatypes ((ListLongMap!10573 0))(
  ( (ListLongMap!10574 (toList!5302 List!17702)) )
))
(declare-fun lt!403071 () ListLongMap!10573)

(declare-datatypes ((SeekEntryResult!8782 0))(
  ( (MissingZero!8782 (index!37499 (_ BitVec 32))) (Found!8782 (index!37500 (_ BitVec 32))) (Intermediate!8782 (undefined!9594 Bool) (index!37501 (_ BitVec 32)) (x!75724 (_ BitVec 32))) (Undefined!8782) (MissingVacant!8782 (index!37502 (_ BitVec 32))) )
))
(declare-fun lt!403069 () SeekEntryResult!8782)

(declare-fun contains!4315 (ListLongMap!10573 (_ BitVec 64)) Bool)

(assert (=> b!892380 (contains!4315 lt!403071 (select (arr!25102 (_keys!9980 thiss!1181)) (index!37500 lt!403069)))))

(declare-fun getCurrentListMap!2580 (array!52201 array!52203 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) ListLongMap!10573)

(assert (=> b!892380 (= lt!403071 (getCurrentListMap!2580 (_keys!9980 thiss!1181) (_values!5254 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5269 thiss!1181)))))

(declare-datatypes ((Unit!30334 0))(
  ( (Unit!30335) )
))
(declare-fun lt!403073 () Unit!30334)

(declare-fun lemmaValidKeyInArrayIsInListMap!210 (array!52201 array!52203 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) Unit!30334)

(assert (=> b!892380 (= lt!403073 (lemmaValidKeyInArrayIsInListMap!210 (_keys!9980 thiss!1181) (_values!5254 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) (index!37500 lt!403069) (defaultEntry!5269 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892380 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403068 () Unit!30334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52201 (_ BitVec 64) (_ BitVec 32)) Unit!30334)

(assert (=> b!892380 (= lt!403068 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9980 thiss!1181) key!785 (index!37500 lt!403069)))))

(declare-fun b!892381 () Bool)

(declare-fun res!604336 () Bool)

(assert (=> b!892381 (=> res!604336 e!498047)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52201 (_ BitVec 32)) Bool)

(assert (=> b!892381 (= res!604336 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9980 thiss!1181) (mask!25807 thiss!1181))))))

(declare-fun b!892382 () Bool)

(declare-fun res!604335 () Bool)

(assert (=> b!892382 (=> res!604335 e!498047)))

(assert (=> b!892382 (= res!604335 (or (not (= (size!25548 (_values!5254 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25807 thiss!1181)))) (not (= (size!25547 (_keys!9980 thiss!1181)) (size!25548 (_values!5254 thiss!1181)))) (bvslt (mask!25807 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4963 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4963 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!18091 () Bool)

(declare-fun e!498042 () Bool)

(declare-fun array_inv!19776 (array!52201) Bool)

(declare-fun array_inv!19777 (array!52203) Bool)

(assert (=> b!892383 (= e!498042 (and tp!55258 tp_is_empty!18091 (array_inv!19776 (_keys!9980 thiss!1181)) (array_inv!19777 (_values!5254 thiss!1181)) e!498041))))

(declare-fun res!604332 () Bool)

(declare-fun e!498043 () Bool)

(assert (=> start!75960 (=> (not res!604332) (not e!498043))))

(declare-fun valid!1618 (LongMapFixedSize!4144) Bool)

(assert (=> start!75960 (= res!604332 (valid!1618 thiss!1181))))

(assert (=> start!75960 e!498043))

(assert (=> start!75960 e!498042))

(assert (=> start!75960 true))

(declare-fun b!892384 () Bool)

(declare-fun e!498040 () Bool)

(assert (=> b!892384 (= e!498040 tp_is_empty!18091)))

(declare-fun b!892385 () Bool)

(assert (=> b!892385 (= e!498043 (not e!498046))))

(declare-fun res!604334 () Bool)

(assert (=> b!892385 (=> res!604334 e!498046)))

(get-info :version)

(assert (=> b!892385 (= res!604334 (not ((_ is Found!8782) lt!403069)))))

(declare-fun e!498044 () Bool)

(assert (=> b!892385 e!498044))

(declare-fun res!604337 () Bool)

(assert (=> b!892385 (=> res!604337 e!498044)))

(assert (=> b!892385 (= res!604337 (not ((_ is Found!8782) lt!403069)))))

(declare-fun lt!403072 () Unit!30334)

(declare-fun lemmaSeekEntryGivesInRangeIndex!36 (array!52201 array!52203 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 64)) Unit!30334)

(assert (=> b!892385 (= lt!403072 (lemmaSeekEntryGivesInRangeIndex!36 (_keys!9980 thiss!1181) (_values!5254 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52201 (_ BitVec 32)) SeekEntryResult!8782)

(assert (=> b!892385 (= lt!403069 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25807 thiss!1181)))))

(declare-fun b!892386 () Bool)

(declare-fun res!604333 () Bool)

(assert (=> b!892386 (=> (not res!604333) (not e!498043))))

(assert (=> b!892386 (= res!604333 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892387 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892387 (= e!498044 (inRange!0 (index!37500 lt!403069) (mask!25807 thiss!1181)))))

(declare-fun mapIsEmpty!28691 () Bool)

(assert (=> mapIsEmpty!28691 mapRes!28691))

(declare-fun b!892388 () Bool)

(assert (=> b!892388 (= e!498048 tp_is_empty!18091)))

(declare-fun b!892389 () Bool)

(assert (=> b!892389 (= e!498047 true)))

(declare-fun lt!403070 () Bool)

(assert (=> b!892389 (= lt!403070 (contains!4315 lt!403071 key!785))))

(declare-fun mapNonEmpty!28691 () Bool)

(declare-fun tp!55259 () Bool)

(assert (=> mapNonEmpty!28691 (= mapRes!28691 (and tp!55259 e!498040))))

(declare-fun mapRest!28691 () (Array (_ BitVec 32) ValueCell!8564))

(declare-fun mapValue!28691 () ValueCell!8564)

(declare-fun mapKey!28691 () (_ BitVec 32))

(assert (=> mapNonEmpty!28691 (= (arr!25103 (_values!5254 thiss!1181)) (store mapRest!28691 mapKey!28691 mapValue!28691))))

(assert (= (and start!75960 res!604332) b!892386))

(assert (= (and b!892386 res!604333) b!892385))

(assert (= (and b!892385 (not res!604337)) b!892387))

(assert (= (and b!892385 (not res!604334)) b!892380))

(assert (= (and b!892380 (not res!604338)) b!892382))

(assert (= (and b!892382 (not res!604335)) b!892381))

(assert (= (and b!892381 (not res!604336)) b!892379))

(assert (= (and b!892379 (not res!604339)) b!892389))

(assert (= (and b!892378 condMapEmpty!28691) mapIsEmpty!28691))

(assert (= (and b!892378 (not condMapEmpty!28691)) mapNonEmpty!28691))

(assert (= (and mapNonEmpty!28691 ((_ is ValueCellFull!8564) mapValue!28691)) b!892384))

(assert (= (and b!892378 ((_ is ValueCellFull!8564) mapDefault!28691)) b!892388))

(assert (= b!892383 b!892378))

(assert (= start!75960 b!892383))

(declare-fun m!831079 () Bool)

(assert (=> b!892389 m!831079))

(declare-fun m!831081 () Bool)

(assert (=> b!892379 m!831081))

(declare-fun m!831083 () Bool)

(assert (=> b!892381 m!831083))

(declare-fun m!831085 () Bool)

(assert (=> start!75960 m!831085))

(declare-fun m!831087 () Bool)

(assert (=> b!892385 m!831087))

(declare-fun m!831089 () Bool)

(assert (=> b!892385 m!831089))

(declare-fun m!831091 () Bool)

(assert (=> b!892380 m!831091))

(declare-fun m!831093 () Bool)

(assert (=> b!892380 m!831093))

(declare-fun m!831095 () Bool)

(assert (=> b!892380 m!831095))

(declare-fun m!831097 () Bool)

(assert (=> b!892380 m!831097))

(declare-fun m!831099 () Bool)

(assert (=> b!892380 m!831099))

(declare-fun m!831101 () Bool)

(assert (=> b!892380 m!831101))

(assert (=> b!892380 m!831099))

(declare-fun m!831103 () Bool)

(assert (=> b!892380 m!831103))

(declare-fun m!831105 () Bool)

(assert (=> b!892387 m!831105))

(declare-fun m!831107 () Bool)

(assert (=> b!892383 m!831107))

(declare-fun m!831109 () Bool)

(assert (=> b!892383 m!831109))

(declare-fun m!831111 () Bool)

(assert (=> mapNonEmpty!28691 m!831111))

(check-sat (not b!892383) (not mapNonEmpty!28691) (not b!892381) (not start!75960) tp_is_empty!18091 b_and!26013 (not b!892389) (not b!892385) (not b_next!15763) (not b!892380) (not b!892379) (not b!892387))
(check-sat b_and!26013 (not b_next!15763))
