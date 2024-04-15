; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75822 () Bool)

(assert start!75822)

(declare-fun b!892111 () Bool)

(declare-fun b_free!15811 () Bool)

(declare-fun b_next!15811 () Bool)

(assert (=> b!892111 (= b_free!15811 (not b_next!15811))))

(declare-fun tp!55403 () Bool)

(declare-fun b_and!26025 () Bool)

(assert (=> b!892111 (= tp!55403 b_and!26025)))

(declare-fun b!892100 () Bool)

(declare-fun res!604459 () Bool)

(declare-fun e!497965 () Bool)

(assert (=> b!892100 (=> (not res!604459) (not e!497965))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892100 (= res!604459 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892101 () Bool)

(declare-fun e!497959 () Bool)

(declare-fun e!497966 () Bool)

(assert (=> b!892101 (= e!497959 e!497966)))

(declare-fun res!604460 () Bool)

(assert (=> b!892101 (=> res!604460 e!497966)))

(declare-datatypes ((array!52241 0))(
  ( (array!52242 (arr!25127 (Array (_ BitVec 32) (_ BitVec 64))) (size!25573 (_ BitVec 32))) )
))
(declare-datatypes ((V!29151 0))(
  ( (V!29152 (val!9120 Int)) )
))
(declare-datatypes ((ValueCell!8588 0))(
  ( (ValueCellFull!8588 (v!11592 V!29151)) (EmptyCell!8588) )
))
(declare-datatypes ((array!52243 0))(
  ( (array!52244 (arr!25128 (Array (_ BitVec 32) ValueCell!8588)) (size!25574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4192 0))(
  ( (LongMapFixedSize!4193 (defaultEntry!5293 Int) (mask!25797 (_ BitVec 32)) (extraKeys!4987 (_ BitVec 32)) (zeroValue!5091 V!29151) (minValue!5091 V!29151) (_size!2151 (_ BitVec 32)) (_keys!9971 array!52241) (_values!5278 array!52243) (_vacant!2151 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4192)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892101 (= res!604460 (not (validMask!0 (mask!25797 thiss!1181))))))

(declare-datatypes ((tuple2!12006 0))(
  ( (tuple2!12007 (_1!6014 (_ BitVec 64)) (_2!6014 V!29151)) )
))
(declare-datatypes ((List!17786 0))(
  ( (Nil!17783) (Cons!17782 (h!18913 tuple2!12006) (t!25076 List!17786)) )
))
(declare-datatypes ((ListLongMap!10693 0))(
  ( (ListLongMap!10694 (toList!5362 List!17786)) )
))
(declare-fun lt!402904 () ListLongMap!10693)

(declare-datatypes ((SeekEntryResult!8850 0))(
  ( (MissingZero!8850 (index!37771 (_ BitVec 32))) (Found!8850 (index!37772 (_ BitVec 32))) (Intermediate!8850 (undefined!9662 Bool) (index!37773 (_ BitVec 32)) (x!75837 (_ BitVec 32))) (Undefined!8850) (MissingVacant!8850 (index!37774 (_ BitVec 32))) )
))
(declare-fun lt!402906 () SeekEntryResult!8850)

(declare-fun contains!4332 (ListLongMap!10693 (_ BitVec 64)) Bool)

(assert (=> b!892101 (contains!4332 lt!402904 (select (arr!25127 (_keys!9971 thiss!1181)) (index!37772 lt!402906)))))

(declare-fun getCurrentListMap!2588 (array!52241 array!52243 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 32) Int) ListLongMap!10693)

(assert (=> b!892101 (= lt!402904 (getCurrentListMap!2588 (_keys!9971 thiss!1181) (_values!5278 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5293 thiss!1181)))))

(declare-datatypes ((Unit!30332 0))(
  ( (Unit!30333) )
))
(declare-fun lt!402907 () Unit!30332)

(declare-fun lemmaValidKeyInArrayIsInListMap!224 (array!52241 array!52243 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 32) Int) Unit!30332)

(assert (=> b!892101 (= lt!402907 (lemmaValidKeyInArrayIsInListMap!224 (_keys!9971 thiss!1181) (_values!5278 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) (index!37772 lt!402906) (defaultEntry!5293 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892101 (arrayContainsKey!0 (_keys!9971 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402903 () Unit!30332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52241 (_ BitVec 64) (_ BitVec 32)) Unit!30332)

(assert (=> b!892101 (= lt!402903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9971 thiss!1181) key!785 (index!37772 lt!402906)))))

(declare-fun b!892102 () Bool)

(declare-fun res!604456 () Bool)

(assert (=> b!892102 (=> res!604456 e!497966)))

(assert (=> b!892102 (= res!604456 (or (not (= (size!25574 (_values!5278 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25797 thiss!1181)))) (not (= (size!25573 (_keys!9971 thiss!1181)) (size!25574 (_values!5278 thiss!1181)))) (bvslt (mask!25797 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4987 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4987 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892103 () Bool)

(declare-fun res!604458 () Bool)

(assert (=> b!892103 (=> res!604458 e!497966)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52241 (_ BitVec 32)) Bool)

(assert (=> b!892103 (= res!604458 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9971 thiss!1181) (mask!25797 thiss!1181))))))

(declare-fun b!892104 () Bool)

(declare-fun e!497962 () Bool)

(declare-fun tp_is_empty!18139 () Bool)

(assert (=> b!892104 (= e!497962 tp_is_empty!18139)))

(declare-fun b!892105 () Bool)

(declare-fun res!604454 () Bool)

(assert (=> b!892105 (=> res!604454 e!497966)))

(declare-datatypes ((List!17787 0))(
  ( (Nil!17784) (Cons!17783 (h!18914 (_ BitVec 64)) (t!25077 List!17787)) )
))
(declare-fun arrayNoDuplicates!0 (array!52241 (_ BitVec 32) List!17787) Bool)

(assert (=> b!892105 (= res!604454 (not (arrayNoDuplicates!0 (_keys!9971 thiss!1181) #b00000000000000000000000000000000 Nil!17784)))))

(declare-fun b!892106 () Bool)

(assert (=> b!892106 (= e!497965 (not e!497959))))

(declare-fun res!604455 () Bool)

(assert (=> b!892106 (=> res!604455 e!497959)))

(get-info :version)

(assert (=> b!892106 (= res!604455 (not ((_ is Found!8850) lt!402906)))))

(declare-fun e!497961 () Bool)

(assert (=> b!892106 e!497961))

(declare-fun res!604457 () Bool)

(assert (=> b!892106 (=> res!604457 e!497961)))

(assert (=> b!892106 (= res!604457 (not ((_ is Found!8850) lt!402906)))))

(declare-fun lt!402905 () Unit!30332)

(declare-fun lemmaSeekEntryGivesInRangeIndex!52 (array!52241 array!52243 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 64)) Unit!30332)

(assert (=> b!892106 (= lt!402905 (lemmaSeekEntryGivesInRangeIndex!52 (_keys!9971 thiss!1181) (_values!5278 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52241 (_ BitVec 32)) SeekEntryResult!8850)

(assert (=> b!892106 (= lt!402906 (seekEntry!0 key!785 (_keys!9971 thiss!1181) (mask!25797 thiss!1181)))))

(declare-fun b!892107 () Bool)

(declare-fun e!497958 () Bool)

(declare-fun e!497960 () Bool)

(declare-fun mapRes!28763 () Bool)

(assert (=> b!892107 (= e!497958 (and e!497960 mapRes!28763))))

(declare-fun condMapEmpty!28763 () Bool)

(declare-fun mapDefault!28763 () ValueCell!8588)

(assert (=> b!892107 (= condMapEmpty!28763 (= (arr!25128 (_values!5278 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8588)) mapDefault!28763)))))

(declare-fun mapIsEmpty!28763 () Bool)

(assert (=> mapIsEmpty!28763 mapRes!28763))

(declare-fun mapNonEmpty!28763 () Bool)

(declare-fun tp!55402 () Bool)

(assert (=> mapNonEmpty!28763 (= mapRes!28763 (and tp!55402 e!497962))))

(declare-fun mapKey!28763 () (_ BitVec 32))

(declare-fun mapRest!28763 () (Array (_ BitVec 32) ValueCell!8588))

(declare-fun mapValue!28763 () ValueCell!8588)

(assert (=> mapNonEmpty!28763 (= (arr!25128 (_values!5278 thiss!1181)) (store mapRest!28763 mapKey!28763 mapValue!28763))))

(declare-fun res!604461 () Bool)

(assert (=> start!75822 (=> (not res!604461) (not e!497965))))

(declare-fun valid!1628 (LongMapFixedSize!4192) Bool)

(assert (=> start!75822 (= res!604461 (valid!1628 thiss!1181))))

(assert (=> start!75822 e!497965))

(declare-fun e!497963 () Bool)

(assert (=> start!75822 e!497963))

(assert (=> start!75822 true))

(declare-fun b!892108 () Bool)

(assert (=> b!892108 (= e!497960 tp_is_empty!18139)))

(declare-fun b!892109 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892109 (= e!497961 (inRange!0 (index!37772 lt!402906) (mask!25797 thiss!1181)))))

(declare-fun b!892110 () Bool)

(assert (=> b!892110 (= e!497966 true)))

(declare-fun lt!402908 () Bool)

(assert (=> b!892110 (= lt!402908 (contains!4332 lt!402904 key!785))))

(declare-fun array_inv!19798 (array!52241) Bool)

(declare-fun array_inv!19799 (array!52243) Bool)

(assert (=> b!892111 (= e!497963 (and tp!55403 tp_is_empty!18139 (array_inv!19798 (_keys!9971 thiss!1181)) (array_inv!19799 (_values!5278 thiss!1181)) e!497958))))

(assert (= (and start!75822 res!604461) b!892100))

(assert (= (and b!892100 res!604459) b!892106))

(assert (= (and b!892106 (not res!604457)) b!892109))

(assert (= (and b!892106 (not res!604455)) b!892101))

(assert (= (and b!892101 (not res!604460)) b!892102))

(assert (= (and b!892102 (not res!604456)) b!892103))

(assert (= (and b!892103 (not res!604458)) b!892105))

(assert (= (and b!892105 (not res!604454)) b!892110))

(assert (= (and b!892107 condMapEmpty!28763) mapIsEmpty!28763))

(assert (= (and b!892107 (not condMapEmpty!28763)) mapNonEmpty!28763))

(assert (= (and mapNonEmpty!28763 ((_ is ValueCellFull!8588) mapValue!28763)) b!892104))

(assert (= (and b!892107 ((_ is ValueCellFull!8588) mapDefault!28763)) b!892108))

(assert (= b!892111 b!892107))

(assert (= start!75822 b!892111))

(declare-fun m!829843 () Bool)

(assert (=> b!892103 m!829843))

(declare-fun m!829845 () Bool)

(assert (=> b!892110 m!829845))

(declare-fun m!829847 () Bool)

(assert (=> start!75822 m!829847))

(declare-fun m!829849 () Bool)

(assert (=> b!892106 m!829849))

(declare-fun m!829851 () Bool)

(assert (=> b!892106 m!829851))

(declare-fun m!829853 () Bool)

(assert (=> b!892105 m!829853))

(declare-fun m!829855 () Bool)

(assert (=> mapNonEmpty!28763 m!829855))

(declare-fun m!829857 () Bool)

(assert (=> b!892111 m!829857))

(declare-fun m!829859 () Bool)

(assert (=> b!892111 m!829859))

(declare-fun m!829861 () Bool)

(assert (=> b!892101 m!829861))

(declare-fun m!829863 () Bool)

(assert (=> b!892101 m!829863))

(declare-fun m!829865 () Bool)

(assert (=> b!892101 m!829865))

(declare-fun m!829867 () Bool)

(assert (=> b!892101 m!829867))

(declare-fun m!829869 () Bool)

(assert (=> b!892101 m!829869))

(assert (=> b!892101 m!829869))

(declare-fun m!829871 () Bool)

(assert (=> b!892101 m!829871))

(declare-fun m!829873 () Bool)

(assert (=> b!892101 m!829873))

(declare-fun m!829875 () Bool)

(assert (=> b!892109 m!829875))

(check-sat (not b!892106) (not b!892105) tp_is_empty!18139 (not start!75822) (not b_next!15811) (not b!892103) (not b!892110) (not b!892101) (not b!892109) b_and!26025 (not mapNonEmpty!28763) (not b!892111))
(check-sat b_and!26025 (not b_next!15811))
