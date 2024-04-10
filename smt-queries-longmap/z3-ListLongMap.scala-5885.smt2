; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75842 () Bool)

(assert start!75842)

(declare-fun b!892382 () Bool)

(declare-fun b_free!15813 () Bool)

(declare-fun b_next!15813 () Bool)

(assert (=> b!892382 (= b_free!15813 (not b_next!15813))))

(declare-fun tp!55408 () Bool)

(declare-fun b_and!26053 () Bool)

(assert (=> b!892382 (= tp!55408 b_and!26053)))

(declare-fun b!892375 () Bool)

(declare-fun e!498140 () Bool)

(declare-fun tp_is_empty!18141 () Bool)

(assert (=> b!892375 (= e!498140 tp_is_empty!18141)))

(declare-fun b!892376 () Bool)

(declare-fun e!498134 () Bool)

(declare-datatypes ((SeekEntryResult!8846 0))(
  ( (MissingZero!8846 (index!37755 (_ BitVec 32))) (Found!8846 (index!37756 (_ BitVec 32))) (Intermediate!8846 (undefined!9658 Bool) (index!37757 (_ BitVec 32)) (x!75838 (_ BitVec 32))) (Undefined!8846) (MissingVacant!8846 (index!37758 (_ BitVec 32))) )
))
(declare-fun lt!403162 () SeekEntryResult!8846)

(declare-datatypes ((array!52262 0))(
  ( (array!52263 (arr!25137 (Array (_ BitVec 32) (_ BitVec 64))) (size!25581 (_ BitVec 32))) )
))
(declare-datatypes ((V!29153 0))(
  ( (V!29154 (val!9121 Int)) )
))
(declare-datatypes ((ValueCell!8589 0))(
  ( (ValueCellFull!8589 (v!11599 V!29153)) (EmptyCell!8589) )
))
(declare-datatypes ((array!52264 0))(
  ( (array!52265 (arr!25138 (Array (_ BitVec 32) ValueCell!8589)) (size!25582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4194 0))(
  ( (LongMapFixedSize!4195 (defaultEntry!5294 Int) (mask!25805 (_ BitVec 32)) (extraKeys!4988 (_ BitVec 32)) (zeroValue!5092 V!29153) (minValue!5092 V!29153) (_size!2152 (_ BitVec 32)) (_keys!9977 array!52262) (_values!5279 array!52264) (_vacant!2152 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4194)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892376 (= e!498134 (inRange!0 (index!37756 lt!403162) (mask!25805 thiss!1181)))))

(declare-fun mapIsEmpty!28766 () Bool)

(declare-fun mapRes!28766 () Bool)

(assert (=> mapIsEmpty!28766 mapRes!28766))

(declare-fun mapNonEmpty!28766 () Bool)

(declare-fun tp!55407 () Bool)

(declare-fun e!498137 () Bool)

(assert (=> mapNonEmpty!28766 (= mapRes!28766 (and tp!55407 e!498137))))

(declare-fun mapValue!28766 () ValueCell!8589)

(declare-fun mapRest!28766 () (Array (_ BitVec 32) ValueCell!8589))

(declare-fun mapKey!28766 () (_ BitVec 32))

(assert (=> mapNonEmpty!28766 (= (arr!25138 (_values!5279 thiss!1181)) (store mapRest!28766 mapKey!28766 mapValue!28766))))

(declare-fun b!892377 () Bool)

(declare-fun res!604593 () Bool)

(declare-fun e!498139 () Bool)

(assert (=> b!892377 (=> res!604593 e!498139)))

(assert (=> b!892377 (= res!604593 (or (not (= (size!25582 (_values!5279 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25805 thiss!1181)))) (not (= (size!25581 (_keys!9977 thiss!1181)) (size!25582 (_values!5279 thiss!1181)))) (bvslt (mask!25805 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4988 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4988 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892378 () Bool)

(assert (=> b!892378 (= e!498139 true)))

(declare-fun lt!403158 () Bool)

(declare-datatypes ((tuple2!11992 0))(
  ( (tuple2!11993 (_1!6007 (_ BitVec 64)) (_2!6007 V!29153)) )
))
(declare-datatypes ((List!17781 0))(
  ( (Nil!17778) (Cons!17777 (h!18908 tuple2!11992) (t!25080 List!17781)) )
))
(declare-datatypes ((ListLongMap!10689 0))(
  ( (ListLongMap!10690 (toList!5360 List!17781)) )
))
(declare-fun lt!403159 () ListLongMap!10689)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4362 (ListLongMap!10689 (_ BitVec 64)) Bool)

(assert (=> b!892378 (= lt!403158 (contains!4362 lt!403159 key!785))))

(declare-fun b!892379 () Bool)

(assert (=> b!892379 (= e!498137 tp_is_empty!18141)))

(declare-fun res!604595 () Bool)

(declare-fun e!498133 () Bool)

(assert (=> start!75842 (=> (not res!604595) (not e!498133))))

(declare-fun valid!1622 (LongMapFixedSize!4194) Bool)

(assert (=> start!75842 (= res!604595 (valid!1622 thiss!1181))))

(assert (=> start!75842 e!498133))

(declare-fun e!498141 () Bool)

(assert (=> start!75842 e!498141))

(assert (=> start!75842 true))

(declare-fun b!892380 () Bool)

(declare-fun e!498136 () Bool)

(assert (=> b!892380 (= e!498136 (and e!498140 mapRes!28766))))

(declare-fun condMapEmpty!28766 () Bool)

(declare-fun mapDefault!28766 () ValueCell!8589)

(assert (=> b!892380 (= condMapEmpty!28766 (= (arr!25138 (_values!5279 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8589)) mapDefault!28766)))))

(declare-fun b!892381 () Bool)

(declare-fun res!604590 () Bool)

(assert (=> b!892381 (=> res!604590 e!498139)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52262 (_ BitVec 32)) Bool)

(assert (=> b!892381 (= res!604590 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9977 thiss!1181) (mask!25805 thiss!1181))))))

(declare-fun array_inv!19742 (array!52262) Bool)

(declare-fun array_inv!19743 (array!52264) Bool)

(assert (=> b!892382 (= e!498141 (and tp!55408 tp_is_empty!18141 (array_inv!19742 (_keys!9977 thiss!1181)) (array_inv!19743 (_values!5279 thiss!1181)) e!498136))))

(declare-fun b!892383 () Bool)

(declare-fun res!604594 () Bool)

(assert (=> b!892383 (=> res!604594 e!498139)))

(declare-datatypes ((List!17782 0))(
  ( (Nil!17779) (Cons!17778 (h!18909 (_ BitVec 64)) (t!25081 List!17782)) )
))
(declare-fun arrayNoDuplicates!0 (array!52262 (_ BitVec 32) List!17782) Bool)

(assert (=> b!892383 (= res!604594 (not (arrayNoDuplicates!0 (_keys!9977 thiss!1181) #b00000000000000000000000000000000 Nil!17779)))))

(declare-fun b!892384 () Bool)

(declare-fun e!498135 () Bool)

(assert (=> b!892384 (= e!498133 (not e!498135))))

(declare-fun res!604589 () Bool)

(assert (=> b!892384 (=> res!604589 e!498135)))

(get-info :version)

(assert (=> b!892384 (= res!604589 (not ((_ is Found!8846) lt!403162)))))

(assert (=> b!892384 e!498134))

(declare-fun res!604591 () Bool)

(assert (=> b!892384 (=> res!604591 e!498134)))

(assert (=> b!892384 (= res!604591 (not ((_ is Found!8846) lt!403162)))))

(declare-datatypes ((Unit!30388 0))(
  ( (Unit!30389) )
))
(declare-fun lt!403160 () Unit!30388)

(declare-fun lemmaSeekEntryGivesInRangeIndex!46 (array!52262 array!52264 (_ BitVec 32) (_ BitVec 32) V!29153 V!29153 (_ BitVec 64)) Unit!30388)

(assert (=> b!892384 (= lt!403160 (lemmaSeekEntryGivesInRangeIndex!46 (_keys!9977 thiss!1181) (_values!5279 thiss!1181) (mask!25805 thiss!1181) (extraKeys!4988 thiss!1181) (zeroValue!5092 thiss!1181) (minValue!5092 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52262 (_ BitVec 32)) SeekEntryResult!8846)

(assert (=> b!892384 (= lt!403162 (seekEntry!0 key!785 (_keys!9977 thiss!1181) (mask!25805 thiss!1181)))))

(declare-fun b!892385 () Bool)

(declare-fun res!604592 () Bool)

(assert (=> b!892385 (=> (not res!604592) (not e!498133))))

(assert (=> b!892385 (= res!604592 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892386 () Bool)

(assert (=> b!892386 (= e!498135 e!498139)))

(declare-fun res!604588 () Bool)

(assert (=> b!892386 (=> res!604588 e!498139)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892386 (= res!604588 (not (validMask!0 (mask!25805 thiss!1181))))))

(assert (=> b!892386 (contains!4362 lt!403159 (select (arr!25137 (_keys!9977 thiss!1181)) (index!37756 lt!403162)))))

(declare-fun getCurrentListMap!2641 (array!52262 array!52264 (_ BitVec 32) (_ BitVec 32) V!29153 V!29153 (_ BitVec 32) Int) ListLongMap!10689)

(assert (=> b!892386 (= lt!403159 (getCurrentListMap!2641 (_keys!9977 thiss!1181) (_values!5279 thiss!1181) (mask!25805 thiss!1181) (extraKeys!4988 thiss!1181) (zeroValue!5092 thiss!1181) (minValue!5092 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5294 thiss!1181)))))

(declare-fun lt!403161 () Unit!30388)

(declare-fun lemmaValidKeyInArrayIsInListMap!230 (array!52262 array!52264 (_ BitVec 32) (_ BitVec 32) V!29153 V!29153 (_ BitVec 32) Int) Unit!30388)

(assert (=> b!892386 (= lt!403161 (lemmaValidKeyInArrayIsInListMap!230 (_keys!9977 thiss!1181) (_values!5279 thiss!1181) (mask!25805 thiss!1181) (extraKeys!4988 thiss!1181) (zeroValue!5092 thiss!1181) (minValue!5092 thiss!1181) (index!37756 lt!403162) (defaultEntry!5294 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892386 (arrayContainsKey!0 (_keys!9977 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403157 () Unit!30388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52262 (_ BitVec 64) (_ BitVec 32)) Unit!30388)

(assert (=> b!892386 (= lt!403157 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9977 thiss!1181) key!785 (index!37756 lt!403162)))))

(assert (= (and start!75842 res!604595) b!892385))

(assert (= (and b!892385 res!604592) b!892384))

(assert (= (and b!892384 (not res!604591)) b!892376))

(assert (= (and b!892384 (not res!604589)) b!892386))

(assert (= (and b!892386 (not res!604588)) b!892377))

(assert (= (and b!892377 (not res!604593)) b!892381))

(assert (= (and b!892381 (not res!604590)) b!892383))

(assert (= (and b!892383 (not res!604594)) b!892378))

(assert (= (and b!892380 condMapEmpty!28766) mapIsEmpty!28766))

(assert (= (and b!892380 (not condMapEmpty!28766)) mapNonEmpty!28766))

(assert (= (and mapNonEmpty!28766 ((_ is ValueCellFull!8589) mapValue!28766)) b!892379))

(assert (= (and b!892380 ((_ is ValueCellFull!8589) mapDefault!28766)) b!892375))

(assert (= b!892382 b!892380))

(assert (= start!75842 b!892382))

(declare-fun m!830635 () Bool)

(assert (=> b!892384 m!830635))

(declare-fun m!830637 () Bool)

(assert (=> b!892384 m!830637))

(declare-fun m!830639 () Bool)

(assert (=> b!892378 m!830639))

(declare-fun m!830641 () Bool)

(assert (=> b!892383 m!830641))

(declare-fun m!830643 () Bool)

(assert (=> start!75842 m!830643))

(declare-fun m!830645 () Bool)

(assert (=> mapNonEmpty!28766 m!830645))

(declare-fun m!830647 () Bool)

(assert (=> b!892382 m!830647))

(declare-fun m!830649 () Bool)

(assert (=> b!892382 m!830649))

(declare-fun m!830651 () Bool)

(assert (=> b!892381 m!830651))

(declare-fun m!830653 () Bool)

(assert (=> b!892376 m!830653))

(declare-fun m!830655 () Bool)

(assert (=> b!892386 m!830655))

(declare-fun m!830657 () Bool)

(assert (=> b!892386 m!830657))

(declare-fun m!830659 () Bool)

(assert (=> b!892386 m!830659))

(declare-fun m!830661 () Bool)

(assert (=> b!892386 m!830661))

(declare-fun m!830663 () Bool)

(assert (=> b!892386 m!830663))

(assert (=> b!892386 m!830657))

(declare-fun m!830665 () Bool)

(assert (=> b!892386 m!830665))

(declare-fun m!830667 () Bool)

(assert (=> b!892386 m!830667))

(check-sat (not b!892382) (not b!892381) tp_is_empty!18141 (not b!892386) b_and!26053 (not b!892376) (not b!892378) (not start!75842) (not b_next!15813) (not b!892383) (not mapNonEmpty!28766) (not b!892384))
(check-sat b_and!26053 (not b_next!15813))
