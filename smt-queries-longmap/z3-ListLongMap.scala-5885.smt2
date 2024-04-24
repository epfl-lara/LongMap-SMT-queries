; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76008 () Bool)

(assert start!76008)

(declare-fun b!893252 () Bool)

(declare-fun b_free!15811 () Bool)

(declare-fun b_next!15811 () Bool)

(assert (=> b!893252 (= b_free!15811 (not b_next!15811))))

(declare-fun tp!55402 () Bool)

(declare-fun b_and!26061 () Bool)

(assert (=> b!893252 (= tp!55402 b_and!26061)))

(declare-fun b!893242 () Bool)

(declare-fun e!498688 () Bool)

(declare-datatypes ((SeekEntryResult!8803 0))(
  ( (MissingZero!8803 (index!37583 (_ BitVec 32))) (Found!8803 (index!37584 (_ BitVec 32))) (Intermediate!8803 (undefined!9615 Bool) (index!37585 (_ BitVec 32)) (x!75809 (_ BitVec 32))) (Undefined!8803) (MissingVacant!8803 (index!37586 (_ BitVec 32))) )
))
(declare-fun lt!403505 () SeekEntryResult!8803)

(declare-datatypes ((array!52297 0))(
  ( (array!52298 (arr!25150 (Array (_ BitVec 32) (_ BitVec 64))) (size!25595 (_ BitVec 32))) )
))
(declare-datatypes ((V!29151 0))(
  ( (V!29152 (val!9120 Int)) )
))
(declare-datatypes ((ValueCell!8588 0))(
  ( (ValueCellFull!8588 (v!11595 V!29151)) (EmptyCell!8588) )
))
(declare-datatypes ((array!52299 0))(
  ( (array!52300 (arr!25151 (Array (_ BitVec 32) ValueCell!8588)) (size!25596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4192 0))(
  ( (LongMapFixedSize!4193 (defaultEntry!5293 Int) (mask!25847 (_ BitVec 32)) (extraKeys!4987 (_ BitVec 32)) (zeroValue!5091 V!29151) (minValue!5091 V!29151) (_size!2151 (_ BitVec 32)) (_keys!10004 array!52297) (_values!5278 array!52299) (_vacant!2151 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4192)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893242 (= e!498688 (inRange!0 (index!37584 lt!403505) (mask!25847 thiss!1181)))))

(declare-fun b!893243 () Bool)

(declare-fun res!604914 () Bool)

(declare-fun e!498691 () Bool)

(assert (=> b!893243 (=> (not res!604914) (not e!498691))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!893243 (= res!604914 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28763 () Bool)

(declare-fun mapRes!28763 () Bool)

(declare-fun tp!55403 () Bool)

(declare-fun e!498692 () Bool)

(assert (=> mapNonEmpty!28763 (= mapRes!28763 (and tp!55403 e!498692))))

(declare-fun mapRest!28763 () (Array (_ BitVec 32) ValueCell!8588))

(declare-fun mapKey!28763 () (_ BitVec 32))

(declare-fun mapValue!28763 () ValueCell!8588)

(assert (=> mapNonEmpty!28763 (= (arr!25151 (_values!5278 thiss!1181)) (store mapRest!28763 mapKey!28763 mapValue!28763))))

(declare-fun res!604913 () Bool)

(assert (=> start!76008 (=> (not res!604913) (not e!498691))))

(declare-fun valid!1634 (LongMapFixedSize!4192) Bool)

(assert (=> start!76008 (= res!604913 (valid!1634 thiss!1181))))

(assert (=> start!76008 e!498691))

(declare-fun e!498694 () Bool)

(assert (=> start!76008 e!498694))

(assert (=> start!76008 true))

(declare-fun b!893244 () Bool)

(declare-fun res!604911 () Bool)

(declare-fun e!498690 () Bool)

(assert (=> b!893244 (=> res!604911 e!498690)))

(assert (=> b!893244 (= res!604911 (or (not (= (size!25596 (_values!5278 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25847 thiss!1181)))) (not (= (size!25595 (_keys!10004 thiss!1181)) (size!25596 (_values!5278 thiss!1181)))) (bvslt (mask!25847 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4987 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4987 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!893245 () Bool)

(declare-fun e!498695 () Bool)

(declare-fun tp_is_empty!18139 () Bool)

(assert (=> b!893245 (= e!498695 tp_is_empty!18139)))

(declare-fun b!893246 () Bool)

(declare-fun res!604909 () Bool)

(assert (=> b!893246 (=> res!604909 e!498690)))

(declare-datatypes ((List!17735 0))(
  ( (Nil!17732) (Cons!17731 (h!18868 (_ BitVec 64)) (t!25026 List!17735)) )
))
(declare-fun arrayNoDuplicates!0 (array!52297 (_ BitVec 32) List!17735) Bool)

(assert (=> b!893246 (= res!604909 (not (arrayNoDuplicates!0 (_keys!10004 thiss!1181) #b00000000000000000000000000000000 Nil!17732)))))

(declare-fun b!893247 () Bool)

(declare-fun res!604908 () Bool)

(assert (=> b!893247 (=> res!604908 e!498690)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52297 (_ BitVec 32)) Bool)

(assert (=> b!893247 (= res!604908 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10004 thiss!1181) (mask!25847 thiss!1181))))))

(declare-fun b!893248 () Bool)

(assert (=> b!893248 (= e!498690 true)))

(declare-fun lt!403503 () Bool)

(declare-datatypes ((tuple2!11910 0))(
  ( (tuple2!11911 (_1!5966 (_ BitVec 64)) (_2!5966 V!29151)) )
))
(declare-datatypes ((List!17736 0))(
  ( (Nil!17733) (Cons!17732 (h!18869 tuple2!11910) (t!25027 List!17736)) )
))
(declare-datatypes ((ListLongMap!10609 0))(
  ( (ListLongMap!10610 (toList!5320 List!17736)) )
))
(declare-fun lt!403502 () ListLongMap!10609)

(declare-fun contains!4333 (ListLongMap!10609 (_ BitVec 64)) Bool)

(assert (=> b!893248 (= lt!403503 (contains!4333 lt!403502 key!785))))

(declare-fun mapIsEmpty!28763 () Bool)

(assert (=> mapIsEmpty!28763 mapRes!28763))

(declare-fun b!893249 () Bool)

(assert (=> b!893249 (= e!498692 tp_is_empty!18139)))

(declare-fun b!893250 () Bool)

(declare-fun e!498689 () Bool)

(assert (=> b!893250 (= e!498689 e!498690)))

(declare-fun res!604910 () Bool)

(assert (=> b!893250 (=> res!604910 e!498690)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!893250 (= res!604910 (not (validMask!0 (mask!25847 thiss!1181))))))

(assert (=> b!893250 (contains!4333 lt!403502 (select (arr!25150 (_keys!10004 thiss!1181)) (index!37584 lt!403505)))))

(declare-fun getCurrentListMap!2597 (array!52297 array!52299 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 32) Int) ListLongMap!10609)

(assert (=> b!893250 (= lt!403502 (getCurrentListMap!2597 (_keys!10004 thiss!1181) (_values!5278 thiss!1181) (mask!25847 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5293 thiss!1181)))))

(declare-datatypes ((Unit!30374 0))(
  ( (Unit!30375) )
))
(declare-fun lt!403500 () Unit!30374)

(declare-fun lemmaValidKeyInArrayIsInListMap!227 (array!52297 array!52299 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 32) Int) Unit!30374)

(assert (=> b!893250 (= lt!403500 (lemmaValidKeyInArrayIsInListMap!227 (_keys!10004 thiss!1181) (_values!5278 thiss!1181) (mask!25847 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) (index!37584 lt!403505) (defaultEntry!5293 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893250 (arrayContainsKey!0 (_keys!10004 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403504 () Unit!30374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52297 (_ BitVec 64) (_ BitVec 32)) Unit!30374)

(assert (=> b!893250 (= lt!403504 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10004 thiss!1181) key!785 (index!37584 lt!403505)))))

(declare-fun b!893251 () Bool)

(declare-fun e!498696 () Bool)

(assert (=> b!893251 (= e!498696 (and e!498695 mapRes!28763))))

(declare-fun condMapEmpty!28763 () Bool)

(declare-fun mapDefault!28763 () ValueCell!8588)

(assert (=> b!893251 (= condMapEmpty!28763 (= (arr!25151 (_values!5278 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8588)) mapDefault!28763)))))

(declare-fun array_inv!19804 (array!52297) Bool)

(declare-fun array_inv!19805 (array!52299) Bool)

(assert (=> b!893252 (= e!498694 (and tp!55402 tp_is_empty!18139 (array_inv!19804 (_keys!10004 thiss!1181)) (array_inv!19805 (_values!5278 thiss!1181)) e!498696))))

(declare-fun b!893253 () Bool)

(assert (=> b!893253 (= e!498691 (not e!498689))))

(declare-fun res!604912 () Bool)

(assert (=> b!893253 (=> res!604912 e!498689)))

(get-info :version)

(assert (=> b!893253 (= res!604912 (not ((_ is Found!8803) lt!403505)))))

(assert (=> b!893253 e!498688))

(declare-fun res!604915 () Bool)

(assert (=> b!893253 (=> res!604915 e!498688)))

(assert (=> b!893253 (= res!604915 (not ((_ is Found!8803) lt!403505)))))

(declare-fun lt!403501 () Unit!30374)

(declare-fun lemmaSeekEntryGivesInRangeIndex!53 (array!52297 array!52299 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 64)) Unit!30374)

(assert (=> b!893253 (= lt!403501 (lemmaSeekEntryGivesInRangeIndex!53 (_keys!10004 thiss!1181) (_values!5278 thiss!1181) (mask!25847 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52297 (_ BitVec 32)) SeekEntryResult!8803)

(assert (=> b!893253 (= lt!403505 (seekEntry!0 key!785 (_keys!10004 thiss!1181) (mask!25847 thiss!1181)))))

(assert (= (and start!76008 res!604913) b!893243))

(assert (= (and b!893243 res!604914) b!893253))

(assert (= (and b!893253 (not res!604915)) b!893242))

(assert (= (and b!893253 (not res!604912)) b!893250))

(assert (= (and b!893250 (not res!604910)) b!893244))

(assert (= (and b!893244 (not res!604911)) b!893247))

(assert (= (and b!893247 (not res!604908)) b!893246))

(assert (= (and b!893246 (not res!604909)) b!893248))

(assert (= (and b!893251 condMapEmpty!28763) mapIsEmpty!28763))

(assert (= (and b!893251 (not condMapEmpty!28763)) mapNonEmpty!28763))

(assert (= (and mapNonEmpty!28763 ((_ is ValueCellFull!8588) mapValue!28763)) b!893249))

(assert (= (and b!893251 ((_ is ValueCellFull!8588) mapDefault!28763)) b!893245))

(assert (= b!893252 b!893251))

(assert (= start!76008 b!893252))

(declare-fun m!831895 () Bool)

(assert (=> b!893242 m!831895))

(declare-fun m!831897 () Bool)

(assert (=> b!893247 m!831897))

(declare-fun m!831899 () Bool)

(assert (=> b!893253 m!831899))

(declare-fun m!831901 () Bool)

(assert (=> b!893253 m!831901))

(declare-fun m!831903 () Bool)

(assert (=> b!893248 m!831903))

(declare-fun m!831905 () Bool)

(assert (=> b!893252 m!831905))

(declare-fun m!831907 () Bool)

(assert (=> b!893252 m!831907))

(declare-fun m!831909 () Bool)

(assert (=> b!893250 m!831909))

(declare-fun m!831911 () Bool)

(assert (=> b!893250 m!831911))

(declare-fun m!831913 () Bool)

(assert (=> b!893250 m!831913))

(assert (=> b!893250 m!831909))

(declare-fun m!831915 () Bool)

(assert (=> b!893250 m!831915))

(declare-fun m!831917 () Bool)

(assert (=> b!893250 m!831917))

(declare-fun m!831919 () Bool)

(assert (=> b!893250 m!831919))

(declare-fun m!831921 () Bool)

(assert (=> b!893250 m!831921))

(declare-fun m!831923 () Bool)

(assert (=> start!76008 m!831923))

(declare-fun m!831925 () Bool)

(assert (=> b!893246 m!831925))

(declare-fun m!831927 () Bool)

(assert (=> mapNonEmpty!28763 m!831927))

(check-sat b_and!26061 (not b!893250) (not b_next!15811) (not b!893246) (not start!76008) (not b!893247) (not b!893248) tp_is_empty!18139 (not mapNonEmpty!28763) (not b!893242) (not b!893252) (not b!893253))
(check-sat b_and!26061 (not b_next!15811))
