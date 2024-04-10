; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75800 () Bool)

(assert start!75800)

(declare-fun b!891619 () Bool)

(declare-fun b_free!15771 () Bool)

(declare-fun b_next!15771 () Bool)

(assert (=> b!891619 (= b_free!15771 (not b_next!15771))))

(declare-fun tp!55281 () Bool)

(declare-fun b_and!26011 () Bool)

(assert (=> b!891619 (= tp!55281 b_and!26011)))

(declare-fun res!604085 () Bool)

(declare-fun e!497571 () Bool)

(assert (=> start!75800 (=> (not res!604085) (not e!497571))))

(declare-datatypes ((array!52178 0))(
  ( (array!52179 (arr!25095 (Array (_ BitVec 32) (_ BitVec 64))) (size!25539 (_ BitVec 32))) )
))
(declare-datatypes ((V!29097 0))(
  ( (V!29098 (val!9100 Int)) )
))
(declare-datatypes ((ValueCell!8568 0))(
  ( (ValueCellFull!8568 (v!11578 V!29097)) (EmptyCell!8568) )
))
(declare-datatypes ((array!52180 0))(
  ( (array!52181 (arr!25096 (Array (_ BitVec 32) ValueCell!8568)) (size!25540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4152 0))(
  ( (LongMapFixedSize!4153 (defaultEntry!5273 Int) (mask!25770 (_ BitVec 32)) (extraKeys!4967 (_ BitVec 32)) (zeroValue!5071 V!29097) (minValue!5071 V!29097) (_size!2131 (_ BitVec 32)) (_keys!9956 array!52178) (_values!5258 array!52180) (_vacant!2131 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4152)

(declare-fun valid!1607 (LongMapFixedSize!4152) Bool)

(assert (=> start!75800 (= res!604085 (valid!1607 thiss!1181))))

(assert (=> start!75800 e!497571))

(declare-fun e!497572 () Bool)

(assert (=> start!75800 e!497572))

(assert (=> start!75800 true))

(declare-fun tp_is_empty!18099 () Bool)

(declare-fun e!497568 () Bool)

(declare-fun array_inv!19714 (array!52178) Bool)

(declare-fun array_inv!19715 (array!52180) Bool)

(assert (=> b!891619 (= e!497572 (and tp!55281 tp_is_empty!18099 (array_inv!19714 (_keys!9956 thiss!1181)) (array_inv!19715 (_values!5258 thiss!1181)) e!497568))))

(declare-fun mapIsEmpty!28703 () Bool)

(declare-fun mapRes!28703 () Bool)

(assert (=> mapIsEmpty!28703 mapRes!28703))

(declare-fun b!891620 () Bool)

(declare-fun res!604088 () Bool)

(declare-fun e!497574 () Bool)

(assert (=> b!891620 (=> res!604088 e!497574)))

(assert (=> b!891620 (= res!604088 (or (not (= (size!25540 (_values!5258 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25770 thiss!1181)))) (not (= (size!25539 (_keys!9956 thiss!1181)) (size!25540 (_values!5258 thiss!1181)))) (bvslt (mask!25770 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4967 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4967 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891621 () Bool)

(declare-fun res!604086 () Bool)

(assert (=> b!891621 (=> res!604086 e!497574)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52178 (_ BitVec 32)) Bool)

(assert (=> b!891621 (= res!604086 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9956 thiss!1181) (mask!25770 thiss!1181))))))

(declare-fun b!891622 () Bool)

(declare-fun res!604090 () Bool)

(assert (=> b!891622 (=> (not res!604090) (not e!497571))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891622 (= res!604090 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891623 () Bool)

(declare-fun e!497566 () Bool)

(assert (=> b!891623 (= e!497566 e!497574)))

(declare-fun res!604089 () Bool)

(assert (=> b!891623 (=> res!604089 e!497574)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891623 (= res!604089 (not (validMask!0 (mask!25770 thiss!1181))))))

(declare-datatypes ((tuple2!11958 0))(
  ( (tuple2!11959 (_1!5990 (_ BitVec 64)) (_2!5990 V!29097)) )
))
(declare-datatypes ((List!17750 0))(
  ( (Nil!17747) (Cons!17746 (h!18877 tuple2!11958) (t!25049 List!17750)) )
))
(declare-datatypes ((ListLongMap!10655 0))(
  ( (ListLongMap!10656 (toList!5343 List!17750)) )
))
(declare-fun lt!402779 () ListLongMap!10655)

(declare-datatypes ((SeekEntryResult!8828 0))(
  ( (MissingZero!8828 (index!37683 (_ BitVec 32))) (Found!8828 (index!37684 (_ BitVec 32))) (Intermediate!8828 (undefined!9640 Bool) (index!37685 (_ BitVec 32)) (x!75764 (_ BitVec 32))) (Undefined!8828) (MissingVacant!8828 (index!37686 (_ BitVec 32))) )
))
(declare-fun lt!402782 () SeekEntryResult!8828)

(declare-fun contains!4345 (ListLongMap!10655 (_ BitVec 64)) Bool)

(assert (=> b!891623 (contains!4345 lt!402779 (select (arr!25095 (_keys!9956 thiss!1181)) (index!37684 lt!402782)))))

(declare-fun getCurrentListMap!2626 (array!52178 array!52180 (_ BitVec 32) (_ BitVec 32) V!29097 V!29097 (_ BitVec 32) Int) ListLongMap!10655)

(assert (=> b!891623 (= lt!402779 (getCurrentListMap!2626 (_keys!9956 thiss!1181) (_values!5258 thiss!1181) (mask!25770 thiss!1181) (extraKeys!4967 thiss!1181) (zeroValue!5071 thiss!1181) (minValue!5071 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5273 thiss!1181)))))

(declare-datatypes ((Unit!30352 0))(
  ( (Unit!30353) )
))
(declare-fun lt!402780 () Unit!30352)

(declare-fun lemmaValidKeyInArrayIsInListMap!215 (array!52178 array!52180 (_ BitVec 32) (_ BitVec 32) V!29097 V!29097 (_ BitVec 32) Int) Unit!30352)

(assert (=> b!891623 (= lt!402780 (lemmaValidKeyInArrayIsInListMap!215 (_keys!9956 thiss!1181) (_values!5258 thiss!1181) (mask!25770 thiss!1181) (extraKeys!4967 thiss!1181) (zeroValue!5071 thiss!1181) (minValue!5071 thiss!1181) (index!37684 lt!402782) (defaultEntry!5273 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891623 (arrayContainsKey!0 (_keys!9956 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402781 () Unit!30352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52178 (_ BitVec 64) (_ BitVec 32)) Unit!30352)

(assert (=> b!891623 (= lt!402781 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9956 thiss!1181) key!785 (index!37684 lt!402782)))))

(declare-fun b!891624 () Bool)

(declare-fun e!497570 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891624 (= e!497570 (inRange!0 (index!37684 lt!402782) (mask!25770 thiss!1181)))))

(declare-fun b!891625 () Bool)

(assert (=> b!891625 (= e!497574 true)))

(declare-fun lt!402783 () Bool)

(assert (=> b!891625 (= lt!402783 (contains!4345 lt!402779 key!785))))

(declare-fun b!891626 () Bool)

(declare-fun res!604091 () Bool)

(assert (=> b!891626 (=> res!604091 e!497574)))

(declare-datatypes ((List!17751 0))(
  ( (Nil!17748) (Cons!17747 (h!18878 (_ BitVec 64)) (t!25050 List!17751)) )
))
(declare-fun arrayNoDuplicates!0 (array!52178 (_ BitVec 32) List!17751) Bool)

(assert (=> b!891626 (= res!604091 (not (arrayNoDuplicates!0 (_keys!9956 thiss!1181) #b00000000000000000000000000000000 Nil!17748)))))

(declare-fun b!891627 () Bool)

(assert (=> b!891627 (= e!497571 (not e!497566))))

(declare-fun res!604087 () Bool)

(assert (=> b!891627 (=> res!604087 e!497566)))

(get-info :version)

(assert (=> b!891627 (= res!604087 (not ((_ is Found!8828) lt!402782)))))

(assert (=> b!891627 e!497570))

(declare-fun res!604084 () Bool)

(assert (=> b!891627 (=> res!604084 e!497570)))

(assert (=> b!891627 (= res!604084 (not ((_ is Found!8828) lt!402782)))))

(declare-fun lt!402784 () Unit!30352)

(declare-fun lemmaSeekEntryGivesInRangeIndex!30 (array!52178 array!52180 (_ BitVec 32) (_ BitVec 32) V!29097 V!29097 (_ BitVec 64)) Unit!30352)

(assert (=> b!891627 (= lt!402784 (lemmaSeekEntryGivesInRangeIndex!30 (_keys!9956 thiss!1181) (_values!5258 thiss!1181) (mask!25770 thiss!1181) (extraKeys!4967 thiss!1181) (zeroValue!5071 thiss!1181) (minValue!5071 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52178 (_ BitVec 32)) SeekEntryResult!8828)

(assert (=> b!891627 (= lt!402782 (seekEntry!0 key!785 (_keys!9956 thiss!1181) (mask!25770 thiss!1181)))))

(declare-fun b!891628 () Bool)

(declare-fun e!497569 () Bool)

(assert (=> b!891628 (= e!497568 (and e!497569 mapRes!28703))))

(declare-fun condMapEmpty!28703 () Bool)

(declare-fun mapDefault!28703 () ValueCell!8568)

(assert (=> b!891628 (= condMapEmpty!28703 (= (arr!25096 (_values!5258 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8568)) mapDefault!28703)))))

(declare-fun mapNonEmpty!28703 () Bool)

(declare-fun tp!55282 () Bool)

(declare-fun e!497567 () Bool)

(assert (=> mapNonEmpty!28703 (= mapRes!28703 (and tp!55282 e!497567))))

(declare-fun mapRest!28703 () (Array (_ BitVec 32) ValueCell!8568))

(declare-fun mapKey!28703 () (_ BitVec 32))

(declare-fun mapValue!28703 () ValueCell!8568)

(assert (=> mapNonEmpty!28703 (= (arr!25096 (_values!5258 thiss!1181)) (store mapRest!28703 mapKey!28703 mapValue!28703))))

(declare-fun b!891629 () Bool)

(assert (=> b!891629 (= e!497567 tp_is_empty!18099)))

(declare-fun b!891630 () Bool)

(assert (=> b!891630 (= e!497569 tp_is_empty!18099)))

(assert (= (and start!75800 res!604085) b!891622))

(assert (= (and b!891622 res!604090) b!891627))

(assert (= (and b!891627 (not res!604084)) b!891624))

(assert (= (and b!891627 (not res!604087)) b!891623))

(assert (= (and b!891623 (not res!604089)) b!891620))

(assert (= (and b!891620 (not res!604088)) b!891621))

(assert (= (and b!891621 (not res!604086)) b!891626))

(assert (= (and b!891626 (not res!604091)) b!891625))

(assert (= (and b!891628 condMapEmpty!28703) mapIsEmpty!28703))

(assert (= (and b!891628 (not condMapEmpty!28703)) mapNonEmpty!28703))

(assert (= (and mapNonEmpty!28703 ((_ is ValueCellFull!8568) mapValue!28703)) b!891629))

(assert (= (and b!891628 ((_ is ValueCellFull!8568) mapDefault!28703)) b!891630))

(assert (= b!891619 b!891628))

(assert (= start!75800 b!891619))

(declare-fun m!829921 () Bool)

(assert (=> b!891626 m!829921))

(declare-fun m!829923 () Bool)

(assert (=> b!891624 m!829923))

(declare-fun m!829925 () Bool)

(assert (=> b!891625 m!829925))

(declare-fun m!829927 () Bool)

(assert (=> b!891621 m!829927))

(declare-fun m!829929 () Bool)

(assert (=> b!891623 m!829929))

(declare-fun m!829931 () Bool)

(assert (=> b!891623 m!829931))

(declare-fun m!829933 () Bool)

(assert (=> b!891623 m!829933))

(declare-fun m!829935 () Bool)

(assert (=> b!891623 m!829935))

(declare-fun m!829937 () Bool)

(assert (=> b!891623 m!829937))

(assert (=> b!891623 m!829931))

(declare-fun m!829939 () Bool)

(assert (=> b!891623 m!829939))

(declare-fun m!829941 () Bool)

(assert (=> b!891623 m!829941))

(declare-fun m!829943 () Bool)

(assert (=> start!75800 m!829943))

(declare-fun m!829945 () Bool)

(assert (=> b!891619 m!829945))

(declare-fun m!829947 () Bool)

(assert (=> b!891619 m!829947))

(declare-fun m!829949 () Bool)

(assert (=> mapNonEmpty!28703 m!829949))

(declare-fun m!829951 () Bool)

(assert (=> b!891627 m!829951))

(declare-fun m!829953 () Bool)

(assert (=> b!891627 m!829953))

(check-sat (not b!891621) tp_is_empty!18099 (not mapNonEmpty!28703) (not b!891626) (not b!891619) (not b!891623) (not b!891624) (not b!891627) (not start!75800) b_and!26011 (not b_next!15771) (not b!891625))
(check-sat b_and!26011 (not b_next!15771))
