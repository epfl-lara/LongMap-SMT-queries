; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75806 () Bool)

(assert start!75806)

(declare-fun b!891729 () Bool)

(declare-fun b_free!15777 () Bool)

(declare-fun b_next!15777 () Bool)

(assert (=> b!891729 (= b_free!15777 (not b_next!15777))))

(declare-fun tp!55300 () Bool)

(declare-fun b_and!26017 () Bool)

(assert (=> b!891729 (= tp!55300 b_and!26017)))

(declare-fun b!891727 () Bool)

(declare-fun e!497648 () Bool)

(declare-fun e!497647 () Bool)

(assert (=> b!891727 (= e!497648 e!497647)))

(declare-fun res!604158 () Bool)

(assert (=> b!891727 (=> res!604158 e!497647)))

(declare-datatypes ((array!52190 0))(
  ( (array!52191 (arr!25101 (Array (_ BitVec 32) (_ BitVec 64))) (size!25545 (_ BitVec 32))) )
))
(declare-datatypes ((V!29105 0))(
  ( (V!29106 (val!9103 Int)) )
))
(declare-datatypes ((ValueCell!8571 0))(
  ( (ValueCellFull!8571 (v!11581 V!29105)) (EmptyCell!8571) )
))
(declare-datatypes ((array!52192 0))(
  ( (array!52193 (arr!25102 (Array (_ BitVec 32) ValueCell!8571)) (size!25546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4158 0))(
  ( (LongMapFixedSize!4159 (defaultEntry!5276 Int) (mask!25775 (_ BitVec 32)) (extraKeys!4970 (_ BitVec 32)) (zeroValue!5074 V!29105) (minValue!5074 V!29105) (_size!2134 (_ BitVec 32)) (_keys!9959 array!52190) (_values!5261 array!52192) (_vacant!2134 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4158)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891727 (= res!604158 (not (validMask!0 (mask!25775 thiss!1181))))))

(declare-datatypes ((tuple2!11964 0))(
  ( (tuple2!11965 (_1!5993 (_ BitVec 64)) (_2!5993 V!29105)) )
))
(declare-datatypes ((List!17756 0))(
  ( (Nil!17753) (Cons!17752 (h!18883 tuple2!11964) (t!25055 List!17756)) )
))
(declare-datatypes ((ListLongMap!10661 0))(
  ( (ListLongMap!10662 (toList!5346 List!17756)) )
))
(declare-fun lt!402837 () ListLongMap!10661)

(declare-datatypes ((SeekEntryResult!8831 0))(
  ( (MissingZero!8831 (index!37695 (_ BitVec 32))) (Found!8831 (index!37696 (_ BitVec 32))) (Intermediate!8831 (undefined!9643 Bool) (index!37697 (_ BitVec 32)) (x!75775 (_ BitVec 32))) (Undefined!8831) (MissingVacant!8831 (index!37698 (_ BitVec 32))) )
))
(declare-fun lt!402833 () SeekEntryResult!8831)

(declare-fun contains!4348 (ListLongMap!10661 (_ BitVec 64)) Bool)

(assert (=> b!891727 (contains!4348 lt!402837 (select (arr!25101 (_keys!9959 thiss!1181)) (index!37696 lt!402833)))))

(declare-fun getCurrentListMap!2629 (array!52190 array!52192 (_ BitVec 32) (_ BitVec 32) V!29105 V!29105 (_ BitVec 32) Int) ListLongMap!10661)

(assert (=> b!891727 (= lt!402837 (getCurrentListMap!2629 (_keys!9959 thiss!1181) (_values!5261 thiss!1181) (mask!25775 thiss!1181) (extraKeys!4970 thiss!1181) (zeroValue!5074 thiss!1181) (minValue!5074 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5276 thiss!1181)))))

(declare-datatypes ((Unit!30358 0))(
  ( (Unit!30359) )
))
(declare-fun lt!402836 () Unit!30358)

(declare-fun lemmaValidKeyInArrayIsInListMap!218 (array!52190 array!52192 (_ BitVec 32) (_ BitVec 32) V!29105 V!29105 (_ BitVec 32) Int) Unit!30358)

(assert (=> b!891727 (= lt!402836 (lemmaValidKeyInArrayIsInListMap!218 (_keys!9959 thiss!1181) (_values!5261 thiss!1181) (mask!25775 thiss!1181) (extraKeys!4970 thiss!1181) (zeroValue!5074 thiss!1181) (minValue!5074 thiss!1181) (index!37696 lt!402833) (defaultEntry!5276 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891727 (arrayContainsKey!0 (_keys!9959 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402835 () Unit!30358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52190 (_ BitVec 64) (_ BitVec 32)) Unit!30358)

(assert (=> b!891727 (= lt!402835 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9959 thiss!1181) key!785 (index!37696 lt!402833)))))

(declare-fun b!891728 () Bool)

(declare-fun e!497652 () Bool)

(declare-fun e!497651 () Bool)

(declare-fun mapRes!28712 () Bool)

(assert (=> b!891728 (= e!497652 (and e!497651 mapRes!28712))))

(declare-fun condMapEmpty!28712 () Bool)

(declare-fun mapDefault!28712 () ValueCell!8571)

(assert (=> b!891728 (= condMapEmpty!28712 (= (arr!25102 (_values!5261 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8571)) mapDefault!28712)))))

(declare-fun b!891730 () Bool)

(declare-fun res!604157 () Bool)

(assert (=> b!891730 (=> res!604157 e!497647)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52190 (_ BitVec 32)) Bool)

(assert (=> b!891730 (= res!604157 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9959 thiss!1181) (mask!25775 thiss!1181))))))

(declare-fun b!891731 () Bool)

(declare-fun e!497653 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891731 (= e!497653 (inRange!0 (index!37696 lt!402833) (mask!25775 thiss!1181)))))

(declare-fun mapNonEmpty!28712 () Bool)

(declare-fun tp!55299 () Bool)

(declare-fun e!497649 () Bool)

(assert (=> mapNonEmpty!28712 (= mapRes!28712 (and tp!55299 e!497649))))

(declare-fun mapKey!28712 () (_ BitVec 32))

(declare-fun mapRest!28712 () (Array (_ BitVec 32) ValueCell!8571))

(declare-fun mapValue!28712 () ValueCell!8571)

(assert (=> mapNonEmpty!28712 (= (arr!25102 (_values!5261 thiss!1181)) (store mapRest!28712 mapKey!28712 mapValue!28712))))

(declare-fun b!891732 () Bool)

(declare-fun e!497654 () Bool)

(assert (=> b!891732 (= e!497654 (not e!497648))))

(declare-fun res!604160 () Bool)

(assert (=> b!891732 (=> res!604160 e!497648)))

(get-info :version)

(assert (=> b!891732 (= res!604160 (not ((_ is Found!8831) lt!402833)))))

(assert (=> b!891732 e!497653))

(declare-fun res!604161 () Bool)

(assert (=> b!891732 (=> res!604161 e!497653)))

(assert (=> b!891732 (= res!604161 (not ((_ is Found!8831) lt!402833)))))

(declare-fun lt!402838 () Unit!30358)

(declare-fun lemmaSeekEntryGivesInRangeIndex!33 (array!52190 array!52192 (_ BitVec 32) (_ BitVec 32) V!29105 V!29105 (_ BitVec 64)) Unit!30358)

(assert (=> b!891732 (= lt!402838 (lemmaSeekEntryGivesInRangeIndex!33 (_keys!9959 thiss!1181) (_values!5261 thiss!1181) (mask!25775 thiss!1181) (extraKeys!4970 thiss!1181) (zeroValue!5074 thiss!1181) (minValue!5074 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52190 (_ BitVec 32)) SeekEntryResult!8831)

(assert (=> b!891732 (= lt!402833 (seekEntry!0 key!785 (_keys!9959 thiss!1181) (mask!25775 thiss!1181)))))

(declare-fun b!891733 () Bool)

(assert (=> b!891733 (= e!497647 true)))

(declare-fun lt!402834 () Bool)

(assert (=> b!891733 (= lt!402834 (contains!4348 lt!402837 key!785))))

(declare-fun b!891734 () Bool)

(declare-fun res!604162 () Bool)

(assert (=> b!891734 (=> (not res!604162) (not e!497654))))

(assert (=> b!891734 (= res!604162 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28712 () Bool)

(assert (=> mapIsEmpty!28712 mapRes!28712))

(declare-fun b!891735 () Bool)

(declare-fun res!604159 () Bool)

(assert (=> b!891735 (=> res!604159 e!497647)))

(assert (=> b!891735 (= res!604159 (or (not (= (size!25546 (_values!5261 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25775 thiss!1181)))) (not (= (size!25545 (_keys!9959 thiss!1181)) (size!25546 (_values!5261 thiss!1181)))) (bvslt (mask!25775 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4970 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4970 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891736 () Bool)

(declare-fun tp_is_empty!18105 () Bool)

(assert (=> b!891736 (= e!497649 tp_is_empty!18105)))

(declare-fun e!497655 () Bool)

(declare-fun array_inv!19720 (array!52190) Bool)

(declare-fun array_inv!19721 (array!52192) Bool)

(assert (=> b!891729 (= e!497655 (and tp!55300 tp_is_empty!18105 (array_inv!19720 (_keys!9959 thiss!1181)) (array_inv!19721 (_values!5261 thiss!1181)) e!497652))))

(declare-fun res!604156 () Bool)

(assert (=> start!75806 (=> (not res!604156) (not e!497654))))

(declare-fun valid!1610 (LongMapFixedSize!4158) Bool)

(assert (=> start!75806 (= res!604156 (valid!1610 thiss!1181))))

(assert (=> start!75806 e!497654))

(assert (=> start!75806 e!497655))

(assert (=> start!75806 true))

(declare-fun b!891737 () Bool)

(assert (=> b!891737 (= e!497651 tp_is_empty!18105)))

(declare-fun b!891738 () Bool)

(declare-fun res!604163 () Bool)

(assert (=> b!891738 (=> res!604163 e!497647)))

(declare-datatypes ((List!17757 0))(
  ( (Nil!17754) (Cons!17753 (h!18884 (_ BitVec 64)) (t!25056 List!17757)) )
))
(declare-fun arrayNoDuplicates!0 (array!52190 (_ BitVec 32) List!17757) Bool)

(assert (=> b!891738 (= res!604163 (not (arrayNoDuplicates!0 (_keys!9959 thiss!1181) #b00000000000000000000000000000000 Nil!17754)))))

(assert (= (and start!75806 res!604156) b!891734))

(assert (= (and b!891734 res!604162) b!891732))

(assert (= (and b!891732 (not res!604161)) b!891731))

(assert (= (and b!891732 (not res!604160)) b!891727))

(assert (= (and b!891727 (not res!604158)) b!891735))

(assert (= (and b!891735 (not res!604159)) b!891730))

(assert (= (and b!891730 (not res!604157)) b!891738))

(assert (= (and b!891738 (not res!604163)) b!891733))

(assert (= (and b!891728 condMapEmpty!28712) mapIsEmpty!28712))

(assert (= (and b!891728 (not condMapEmpty!28712)) mapNonEmpty!28712))

(assert (= (and mapNonEmpty!28712 ((_ is ValueCellFull!8571) mapValue!28712)) b!891736))

(assert (= (and b!891728 ((_ is ValueCellFull!8571) mapDefault!28712)) b!891737))

(assert (= b!891729 b!891728))

(assert (= start!75806 b!891729))

(declare-fun m!830023 () Bool)

(assert (=> b!891727 m!830023))

(declare-fun m!830025 () Bool)

(assert (=> b!891727 m!830025))

(declare-fun m!830027 () Bool)

(assert (=> b!891727 m!830027))

(declare-fun m!830029 () Bool)

(assert (=> b!891727 m!830029))

(declare-fun m!830031 () Bool)

(assert (=> b!891727 m!830031))

(declare-fun m!830033 () Bool)

(assert (=> b!891727 m!830033))

(declare-fun m!830035 () Bool)

(assert (=> b!891727 m!830035))

(assert (=> b!891727 m!830025))

(declare-fun m!830037 () Bool)

(assert (=> b!891729 m!830037))

(declare-fun m!830039 () Bool)

(assert (=> b!891729 m!830039))

(declare-fun m!830041 () Bool)

(assert (=> b!891730 m!830041))

(declare-fun m!830043 () Bool)

(assert (=> b!891738 m!830043))

(declare-fun m!830045 () Bool)

(assert (=> b!891732 m!830045))

(declare-fun m!830047 () Bool)

(assert (=> b!891732 m!830047))

(declare-fun m!830049 () Bool)

(assert (=> b!891733 m!830049))

(declare-fun m!830051 () Bool)

(assert (=> b!891731 m!830051))

(declare-fun m!830053 () Bool)

(assert (=> mapNonEmpty!28712 m!830053))

(declare-fun m!830055 () Bool)

(assert (=> start!75806 m!830055))

(check-sat (not b!891730) b_and!26017 (not b!891729) (not b!891733) (not b_next!15777) tp_is_empty!18105 (not b!891727) (not start!75806) (not mapNonEmpty!28712) (not b!891732) (not b!891731) (not b!891738))
(check-sat b_and!26017 (not b_next!15777))
