; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75768 () Bool)

(assert start!75768)

(declare-fun b!891133 () Bool)

(declare-fun b_free!15757 () Bool)

(declare-fun b_next!15757 () Bool)

(assert (=> b!891133 (= b_free!15757 (not b_next!15757))))

(declare-fun tp!55241 () Bool)

(declare-fun b_and!25971 () Bool)

(assert (=> b!891133 (= tp!55241 b_and!25971)))

(declare-fun b!891128 () Bool)

(declare-fun e!497230 () Bool)

(declare-fun tp_is_empty!18085 () Bool)

(assert (=> b!891128 (= e!497230 tp_is_empty!18085)))

(declare-fun b!891129 () Bool)

(declare-fun res!603808 () Bool)

(declare-fun e!497231 () Bool)

(assert (=> b!891129 (=> res!603808 e!497231)))

(declare-datatypes ((array!52133 0))(
  ( (array!52134 (arr!25073 (Array (_ BitVec 32) (_ BitVec 64))) (size!25519 (_ BitVec 32))) )
))
(declare-datatypes ((V!29079 0))(
  ( (V!29080 (val!9093 Int)) )
))
(declare-datatypes ((ValueCell!8561 0))(
  ( (ValueCellFull!8561 (v!11565 V!29079)) (EmptyCell!8561) )
))
(declare-datatypes ((array!52135 0))(
  ( (array!52136 (arr!25074 (Array (_ BitVec 32) ValueCell!8561)) (size!25520 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4138 0))(
  ( (LongMapFixedSize!4139 (defaultEntry!5266 Int) (mask!25752 (_ BitVec 32)) (extraKeys!4960 (_ BitVec 32)) (zeroValue!5064 V!29079) (minValue!5064 V!29079) (_size!2124 (_ BitVec 32)) (_keys!9944 array!52133) (_values!5251 array!52135) (_vacant!2124 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4138)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52133 (_ BitVec 32)) Bool)

(assert (=> b!891129 (= res!603808 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9944 thiss!1181) (mask!25752 thiss!1181))))))

(declare-fun b!891130 () Bool)

(declare-fun res!603809 () Bool)

(assert (=> b!891130 (=> res!603809 e!497231)))

(declare-datatypes ((List!17748 0))(
  ( (Nil!17745) (Cons!17744 (h!18875 (_ BitVec 64)) (t!25038 List!17748)) )
))
(declare-fun arrayNoDuplicates!0 (array!52133 (_ BitVec 32) List!17748) Bool)

(assert (=> b!891130 (= res!603809 (not (arrayNoDuplicates!0 (_keys!9944 thiss!1181) #b00000000000000000000000000000000 Nil!17745)))))

(declare-fun b!891131 () Bool)

(declare-fun e!497232 () Bool)

(assert (=> b!891131 (= e!497232 tp_is_empty!18085)))

(declare-fun e!497233 () Bool)

(declare-fun e!497229 () Bool)

(declare-fun array_inv!19754 (array!52133) Bool)

(declare-fun array_inv!19755 (array!52135) Bool)

(assert (=> b!891133 (= e!497233 (and tp!55241 tp_is_empty!18085 (array_inv!19754 (_keys!9944 thiss!1181)) (array_inv!19755 (_values!5251 thiss!1181)) e!497229))))

(declare-fun b!891134 () Bool)

(declare-fun res!603811 () Bool)

(declare-fun e!497234 () Bool)

(assert (=> b!891134 (=> (not res!603811) (not e!497234))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891134 (= res!603811 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891135 () Bool)

(assert (=> b!891135 (= e!497231 true)))

(declare-fun lt!402421 () Bool)

(declare-datatypes ((tuple2!11966 0))(
  ( (tuple2!11967 (_1!5994 (_ BitVec 64)) (_2!5994 V!29079)) )
))
(declare-datatypes ((List!17749 0))(
  ( (Nil!17746) (Cons!17745 (h!18876 tuple2!11966) (t!25039 List!17749)) )
))
(declare-datatypes ((ListLongMap!10653 0))(
  ( (ListLongMap!10654 (toList!5342 List!17749)) )
))
(declare-fun lt!402418 () ListLongMap!10653)

(declare-fun contains!4312 (ListLongMap!10653 (_ BitVec 64)) Bool)

(assert (=> b!891135 (= lt!402421 (contains!4312 lt!402418 key!785))))

(declare-fun b!891136 () Bool)

(declare-fun res!603806 () Bool)

(assert (=> b!891136 (=> res!603806 e!497231)))

(assert (=> b!891136 (= res!603806 (or (not (= (size!25520 (_values!5251 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25752 thiss!1181)))) (not (= (size!25519 (_keys!9944 thiss!1181)) (size!25520 (_values!5251 thiss!1181)))) (bvslt (mask!25752 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4960 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4960 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28682 () Bool)

(declare-fun mapRes!28682 () Bool)

(declare-fun tp!55240 () Bool)

(assert (=> mapNonEmpty!28682 (= mapRes!28682 (and tp!55240 e!497230))))

(declare-fun mapRest!28682 () (Array (_ BitVec 32) ValueCell!8561))

(declare-fun mapKey!28682 () (_ BitVec 32))

(declare-fun mapValue!28682 () ValueCell!8561)

(assert (=> mapNonEmpty!28682 (= (arr!25074 (_values!5251 thiss!1181)) (store mapRest!28682 mapKey!28682 mapValue!28682))))

(declare-fun mapIsEmpty!28682 () Bool)

(assert (=> mapIsEmpty!28682 mapRes!28682))

(declare-fun b!891137 () Bool)

(assert (=> b!891137 (= e!497229 (and e!497232 mapRes!28682))))

(declare-fun condMapEmpty!28682 () Bool)

(declare-fun mapDefault!28682 () ValueCell!8561)

(assert (=> b!891137 (= condMapEmpty!28682 (= (arr!25074 (_values!5251 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8561)) mapDefault!28682)))))

(declare-fun b!891138 () Bool)

(declare-fun e!497236 () Bool)

(declare-datatypes ((SeekEntryResult!8825 0))(
  ( (MissingZero!8825 (index!37671 (_ BitVec 32))) (Found!8825 (index!37672 (_ BitVec 32))) (Intermediate!8825 (undefined!9637 Bool) (index!37673 (_ BitVec 32)) (x!75740 (_ BitVec 32))) (Undefined!8825) (MissingVacant!8825 (index!37674 (_ BitVec 32))) )
))
(declare-fun lt!402419 () SeekEntryResult!8825)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891138 (= e!497236 (inRange!0 (index!37672 lt!402419) (mask!25752 thiss!1181)))))

(declare-fun b!891139 () Bool)

(declare-fun e!497235 () Bool)

(assert (=> b!891139 (= e!497234 (not e!497235))))

(declare-fun res!603813 () Bool)

(assert (=> b!891139 (=> res!603813 e!497235)))

(get-info :version)

(assert (=> b!891139 (= res!603813 (not ((_ is Found!8825) lt!402419)))))

(assert (=> b!891139 e!497236))

(declare-fun res!603812 () Bool)

(assert (=> b!891139 (=> res!603812 e!497236)))

(assert (=> b!891139 (= res!603812 (not ((_ is Found!8825) lt!402419)))))

(declare-datatypes ((Unit!30286 0))(
  ( (Unit!30287) )
))
(declare-fun lt!402420 () Unit!30286)

(declare-fun lemmaSeekEntryGivesInRangeIndex!32 (array!52133 array!52135 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 64)) Unit!30286)

(assert (=> b!891139 (= lt!402420 (lemmaSeekEntryGivesInRangeIndex!32 (_keys!9944 thiss!1181) (_values!5251 thiss!1181) (mask!25752 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52133 (_ BitVec 32)) SeekEntryResult!8825)

(assert (=> b!891139 (= lt!402419 (seekEntry!0 key!785 (_keys!9944 thiss!1181) (mask!25752 thiss!1181)))))

(declare-fun res!603810 () Bool)

(assert (=> start!75768 (=> (not res!603810) (not e!497234))))

(declare-fun valid!1611 (LongMapFixedSize!4138) Bool)

(assert (=> start!75768 (= res!603810 (valid!1611 thiss!1181))))

(assert (=> start!75768 e!497234))

(assert (=> start!75768 e!497233))

(assert (=> start!75768 true))

(declare-fun b!891132 () Bool)

(assert (=> b!891132 (= e!497235 e!497231)))

(declare-fun res!603807 () Bool)

(assert (=> b!891132 (=> res!603807 e!497231)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891132 (= res!603807 (not (validMask!0 (mask!25752 thiss!1181))))))

(assert (=> b!891132 (contains!4312 lt!402418 (select (arr!25073 (_keys!9944 thiss!1181)) (index!37672 lt!402419)))))

(declare-fun getCurrentListMap!2570 (array!52133 array!52135 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) ListLongMap!10653)

(assert (=> b!891132 (= lt!402418 (getCurrentListMap!2570 (_keys!9944 thiss!1181) (_values!5251 thiss!1181) (mask!25752 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5266 thiss!1181)))))

(declare-fun lt!402417 () Unit!30286)

(declare-fun lemmaValidKeyInArrayIsInListMap!206 (array!52133 array!52135 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) Unit!30286)

(assert (=> b!891132 (= lt!402417 (lemmaValidKeyInArrayIsInListMap!206 (_keys!9944 thiss!1181) (_values!5251 thiss!1181) (mask!25752 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) (index!37672 lt!402419) (defaultEntry!5266 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891132 (arrayContainsKey!0 (_keys!9944 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402422 () Unit!30286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52133 (_ BitVec 64) (_ BitVec 32)) Unit!30286)

(assert (=> b!891132 (= lt!402422 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9944 thiss!1181) key!785 (index!37672 lt!402419)))))

(assert (= (and start!75768 res!603810) b!891134))

(assert (= (and b!891134 res!603811) b!891139))

(assert (= (and b!891139 (not res!603812)) b!891138))

(assert (= (and b!891139 (not res!603813)) b!891132))

(assert (= (and b!891132 (not res!603807)) b!891136))

(assert (= (and b!891136 (not res!603806)) b!891129))

(assert (= (and b!891129 (not res!603808)) b!891130))

(assert (= (and b!891130 (not res!603809)) b!891135))

(assert (= (and b!891137 condMapEmpty!28682) mapIsEmpty!28682))

(assert (= (and b!891137 (not condMapEmpty!28682)) mapNonEmpty!28682))

(assert (= (and mapNonEmpty!28682 ((_ is ValueCellFull!8561) mapValue!28682)) b!891128))

(assert (= (and b!891137 ((_ is ValueCellFull!8561) mapDefault!28682)) b!891131))

(assert (= b!891133 b!891137))

(assert (= start!75768 b!891133))

(declare-fun m!828925 () Bool)

(assert (=> b!891138 m!828925))

(declare-fun m!828927 () Bool)

(assert (=> b!891130 m!828927))

(declare-fun m!828929 () Bool)

(assert (=> b!891135 m!828929))

(declare-fun m!828931 () Bool)

(assert (=> b!891129 m!828931))

(declare-fun m!828933 () Bool)

(assert (=> mapNonEmpty!28682 m!828933))

(declare-fun m!828935 () Bool)

(assert (=> b!891133 m!828935))

(declare-fun m!828937 () Bool)

(assert (=> b!891133 m!828937))

(declare-fun m!828939 () Bool)

(assert (=> b!891132 m!828939))

(declare-fun m!828941 () Bool)

(assert (=> b!891132 m!828941))

(declare-fun m!828943 () Bool)

(assert (=> b!891132 m!828943))

(declare-fun m!828945 () Bool)

(assert (=> b!891132 m!828945))

(declare-fun m!828947 () Bool)

(assert (=> b!891132 m!828947))

(assert (=> b!891132 m!828941))

(declare-fun m!828949 () Bool)

(assert (=> b!891132 m!828949))

(declare-fun m!828951 () Bool)

(assert (=> b!891132 m!828951))

(declare-fun m!828953 () Bool)

(assert (=> b!891139 m!828953))

(declare-fun m!828955 () Bool)

(assert (=> b!891139 m!828955))

(declare-fun m!828957 () Bool)

(assert (=> start!75768 m!828957))

(check-sat (not b!891132) (not mapNonEmpty!28682) (not b!891138) (not b!891135) b_and!25971 (not start!75768) (not b!891129) (not b_next!15757) (not b!891130) (not b!891133) tp_is_empty!18085 (not b!891139))
(check-sat b_and!25971 (not b_next!15757))
