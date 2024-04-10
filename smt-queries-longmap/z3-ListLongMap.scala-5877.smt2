; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75794 () Bool)

(assert start!75794)

(declare-fun b!891521 () Bool)

(declare-fun b_free!15765 () Bool)

(declare-fun b_next!15765 () Bool)

(assert (=> b!891521 (= b_free!15765 (not b_next!15765))))

(declare-fun tp!55264 () Bool)

(declare-fun b_and!26005 () Bool)

(assert (=> b!891521 (= tp!55264 b_and!26005)))

(declare-fun b!891511 () Bool)

(declare-fun res!604013 () Bool)

(declare-fun e!497493 () Bool)

(assert (=> b!891511 (=> res!604013 e!497493)))

(declare-datatypes ((array!52166 0))(
  ( (array!52167 (arr!25089 (Array (_ BitVec 32) (_ BitVec 64))) (size!25533 (_ BitVec 32))) )
))
(declare-datatypes ((V!29089 0))(
  ( (V!29090 (val!9097 Int)) )
))
(declare-datatypes ((ValueCell!8565 0))(
  ( (ValueCellFull!8565 (v!11575 V!29089)) (EmptyCell!8565) )
))
(declare-datatypes ((array!52168 0))(
  ( (array!52169 (arr!25090 (Array (_ BitVec 32) ValueCell!8565)) (size!25534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4146 0))(
  ( (LongMapFixedSize!4147 (defaultEntry!5270 Int) (mask!25765 (_ BitVec 32)) (extraKeys!4964 (_ BitVec 32)) (zeroValue!5068 V!29089) (minValue!5068 V!29089) (_size!2128 (_ BitVec 32)) (_keys!9953 array!52166) (_values!5255 array!52168) (_vacant!2128 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4146)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52166 (_ BitVec 32)) Bool)

(assert (=> b!891511 (= res!604013 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9953 thiss!1181) (mask!25765 thiss!1181))))))

(declare-fun b!891512 () Bool)

(declare-fun e!497490 () Bool)

(declare-fun tp_is_empty!18093 () Bool)

(assert (=> b!891512 (= e!497490 tp_is_empty!18093)))

(declare-fun b!891513 () Bool)

(declare-fun e!497485 () Bool)

(assert (=> b!891513 (= e!497485 e!497493)))

(declare-fun res!604018 () Bool)

(assert (=> b!891513 (=> res!604018 e!497493)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891513 (= res!604018 (not (validMask!0 (mask!25765 thiss!1181))))))

(declare-datatypes ((tuple2!11952 0))(
  ( (tuple2!11953 (_1!5987 (_ BitVec 64)) (_2!5987 V!29089)) )
))
(declare-datatypes ((List!17745 0))(
  ( (Nil!17742) (Cons!17741 (h!18872 tuple2!11952) (t!25044 List!17745)) )
))
(declare-datatypes ((ListLongMap!10649 0))(
  ( (ListLongMap!10650 (toList!5340 List!17745)) )
))
(declare-fun lt!402726 () ListLongMap!10649)

(declare-datatypes ((SeekEntryResult!8825 0))(
  ( (MissingZero!8825 (index!37671 (_ BitVec 32))) (Found!8825 (index!37672 (_ BitVec 32))) (Intermediate!8825 (undefined!9637 Bool) (index!37673 (_ BitVec 32)) (x!75753 (_ BitVec 32))) (Undefined!8825) (MissingVacant!8825 (index!37674 (_ BitVec 32))) )
))
(declare-fun lt!402725 () SeekEntryResult!8825)

(declare-fun contains!4342 (ListLongMap!10649 (_ BitVec 64)) Bool)

(assert (=> b!891513 (contains!4342 lt!402726 (select (arr!25089 (_keys!9953 thiss!1181)) (index!37672 lt!402725)))))

(declare-fun getCurrentListMap!2623 (array!52166 array!52168 (_ BitVec 32) (_ BitVec 32) V!29089 V!29089 (_ BitVec 32) Int) ListLongMap!10649)

(assert (=> b!891513 (= lt!402726 (getCurrentListMap!2623 (_keys!9953 thiss!1181) (_values!5255 thiss!1181) (mask!25765 thiss!1181) (extraKeys!4964 thiss!1181) (zeroValue!5068 thiss!1181) (minValue!5068 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5270 thiss!1181)))))

(declare-datatypes ((Unit!30346 0))(
  ( (Unit!30347) )
))
(declare-fun lt!402727 () Unit!30346)

(declare-fun lemmaValidKeyInArrayIsInListMap!212 (array!52166 array!52168 (_ BitVec 32) (_ BitVec 32) V!29089 V!29089 (_ BitVec 32) Int) Unit!30346)

(assert (=> b!891513 (= lt!402727 (lemmaValidKeyInArrayIsInListMap!212 (_keys!9953 thiss!1181) (_values!5255 thiss!1181) (mask!25765 thiss!1181) (extraKeys!4964 thiss!1181) (zeroValue!5068 thiss!1181) (minValue!5068 thiss!1181) (index!37672 lt!402725) (defaultEntry!5270 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891513 (arrayContainsKey!0 (_keys!9953 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402729 () Unit!30346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52166 (_ BitVec 64) (_ BitVec 32)) Unit!30346)

(assert (=> b!891513 (= lt!402729 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9953 thiss!1181) key!785 (index!37672 lt!402725)))))

(declare-fun b!891514 () Bool)

(declare-fun e!497488 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891514 (= e!497488 (inRange!0 (index!37672 lt!402725) (mask!25765 thiss!1181)))))

(declare-fun b!891515 () Bool)

(declare-fun e!497491 () Bool)

(assert (=> b!891515 (= e!497491 (not e!497485))))

(declare-fun res!604017 () Bool)

(assert (=> b!891515 (=> res!604017 e!497485)))

(get-info :version)

(assert (=> b!891515 (= res!604017 (not ((_ is Found!8825) lt!402725)))))

(assert (=> b!891515 e!497488))

(declare-fun res!604012 () Bool)

(assert (=> b!891515 (=> res!604012 e!497488)))

(assert (=> b!891515 (= res!604012 (not ((_ is Found!8825) lt!402725)))))

(declare-fun lt!402730 () Unit!30346)

(declare-fun lemmaSeekEntryGivesInRangeIndex!28 (array!52166 array!52168 (_ BitVec 32) (_ BitVec 32) V!29089 V!29089 (_ BitVec 64)) Unit!30346)

(assert (=> b!891515 (= lt!402730 (lemmaSeekEntryGivesInRangeIndex!28 (_keys!9953 thiss!1181) (_values!5255 thiss!1181) (mask!25765 thiss!1181) (extraKeys!4964 thiss!1181) (zeroValue!5068 thiss!1181) (minValue!5068 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52166 (_ BitVec 32)) SeekEntryResult!8825)

(assert (=> b!891515 (= lt!402725 (seekEntry!0 key!785 (_keys!9953 thiss!1181) (mask!25765 thiss!1181)))))

(declare-fun res!604019 () Bool)

(assert (=> start!75794 (=> (not res!604019) (not e!497491))))

(declare-fun valid!1606 (LongMapFixedSize!4146) Bool)

(assert (=> start!75794 (= res!604019 (valid!1606 thiss!1181))))

(assert (=> start!75794 e!497491))

(declare-fun e!497489 () Bool)

(assert (=> start!75794 e!497489))

(assert (=> start!75794 true))

(declare-fun mapNonEmpty!28694 () Bool)

(declare-fun mapRes!28694 () Bool)

(declare-fun tp!55263 () Bool)

(assert (=> mapNonEmpty!28694 (= mapRes!28694 (and tp!55263 e!497490))))

(declare-fun mapRest!28694 () (Array (_ BitVec 32) ValueCell!8565))

(declare-fun mapValue!28694 () ValueCell!8565)

(declare-fun mapKey!28694 () (_ BitVec 32))

(assert (=> mapNonEmpty!28694 (= (arr!25090 (_values!5255 thiss!1181)) (store mapRest!28694 mapKey!28694 mapValue!28694))))

(declare-fun b!891516 () Bool)

(declare-fun e!497486 () Bool)

(assert (=> b!891516 (= e!497486 tp_is_empty!18093)))

(declare-fun mapIsEmpty!28694 () Bool)

(assert (=> mapIsEmpty!28694 mapRes!28694))

(declare-fun b!891517 () Bool)

(assert (=> b!891517 (= e!497493 true)))

(declare-fun lt!402728 () Bool)

(assert (=> b!891517 (= lt!402728 (contains!4342 lt!402726 key!785))))

(declare-fun b!891518 () Bool)

(declare-fun res!604015 () Bool)

(assert (=> b!891518 (=> res!604015 e!497493)))

(assert (=> b!891518 (= res!604015 (or (not (= (size!25534 (_values!5255 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25765 thiss!1181)))) (not (= (size!25533 (_keys!9953 thiss!1181)) (size!25534 (_values!5255 thiss!1181)))) (bvslt (mask!25765 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4964 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4964 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891519 () Bool)

(declare-fun res!604016 () Bool)

(assert (=> b!891519 (=> res!604016 e!497493)))

(declare-datatypes ((List!17746 0))(
  ( (Nil!17743) (Cons!17742 (h!18873 (_ BitVec 64)) (t!25045 List!17746)) )
))
(declare-fun arrayNoDuplicates!0 (array!52166 (_ BitVec 32) List!17746) Bool)

(assert (=> b!891519 (= res!604016 (not (arrayNoDuplicates!0 (_keys!9953 thiss!1181) #b00000000000000000000000000000000 Nil!17743)))))

(declare-fun b!891520 () Bool)

(declare-fun res!604014 () Bool)

(assert (=> b!891520 (=> (not res!604014) (not e!497491))))

(assert (=> b!891520 (= res!604014 (not (= key!785 (bvneg key!785))))))

(declare-fun e!497487 () Bool)

(declare-fun array_inv!19712 (array!52166) Bool)

(declare-fun array_inv!19713 (array!52168) Bool)

(assert (=> b!891521 (= e!497489 (and tp!55264 tp_is_empty!18093 (array_inv!19712 (_keys!9953 thiss!1181)) (array_inv!19713 (_values!5255 thiss!1181)) e!497487))))

(declare-fun b!891522 () Bool)

(assert (=> b!891522 (= e!497487 (and e!497486 mapRes!28694))))

(declare-fun condMapEmpty!28694 () Bool)

(declare-fun mapDefault!28694 () ValueCell!8565)

(assert (=> b!891522 (= condMapEmpty!28694 (= (arr!25090 (_values!5255 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8565)) mapDefault!28694)))))

(assert (= (and start!75794 res!604019) b!891520))

(assert (= (and b!891520 res!604014) b!891515))

(assert (= (and b!891515 (not res!604012)) b!891514))

(assert (= (and b!891515 (not res!604017)) b!891513))

(assert (= (and b!891513 (not res!604018)) b!891518))

(assert (= (and b!891518 (not res!604015)) b!891511))

(assert (= (and b!891511 (not res!604013)) b!891519))

(assert (= (and b!891519 (not res!604016)) b!891517))

(assert (= (and b!891522 condMapEmpty!28694) mapIsEmpty!28694))

(assert (= (and b!891522 (not condMapEmpty!28694)) mapNonEmpty!28694))

(assert (= (and mapNonEmpty!28694 ((_ is ValueCellFull!8565) mapValue!28694)) b!891512))

(assert (= (and b!891522 ((_ is ValueCellFull!8565) mapDefault!28694)) b!891516))

(assert (= b!891521 b!891522))

(assert (= start!75794 b!891521))

(declare-fun m!829819 () Bool)

(assert (=> b!891514 m!829819))

(declare-fun m!829821 () Bool)

(assert (=> b!891513 m!829821))

(declare-fun m!829823 () Bool)

(assert (=> b!891513 m!829823))

(declare-fun m!829825 () Bool)

(assert (=> b!891513 m!829825))

(declare-fun m!829827 () Bool)

(assert (=> b!891513 m!829827))

(declare-fun m!829829 () Bool)

(assert (=> b!891513 m!829829))

(declare-fun m!829831 () Bool)

(assert (=> b!891513 m!829831))

(assert (=> b!891513 m!829821))

(declare-fun m!829833 () Bool)

(assert (=> b!891513 m!829833))

(declare-fun m!829835 () Bool)

(assert (=> mapNonEmpty!28694 m!829835))

(declare-fun m!829837 () Bool)

(assert (=> b!891519 m!829837))

(declare-fun m!829839 () Bool)

(assert (=> b!891515 m!829839))

(declare-fun m!829841 () Bool)

(assert (=> b!891515 m!829841))

(declare-fun m!829843 () Bool)

(assert (=> b!891517 m!829843))

(declare-fun m!829845 () Bool)

(assert (=> start!75794 m!829845))

(declare-fun m!829847 () Bool)

(assert (=> b!891511 m!829847))

(declare-fun m!829849 () Bool)

(assert (=> b!891521 m!829849))

(declare-fun m!829851 () Bool)

(assert (=> b!891521 m!829851))

(check-sat b_and!26005 (not mapNonEmpty!28694) (not b_next!15765) (not b!891513) (not b!891515) (not b!891519) tp_is_empty!18093 (not b!891514) (not start!75794) (not b!891511) (not b!891517) (not b!891521))
(check-sat b_and!26005 (not b_next!15765))
