; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14704 () Bool)

(assert start!14704)

(declare-fun b!139146 () Bool)

(declare-fun b_free!3017 () Bool)

(declare-fun b_next!3017 () Bool)

(assert (=> b!139146 (= b_free!3017 (not b_next!3017))))

(declare-fun tp!11522 () Bool)

(declare-fun b_and!8671 () Bool)

(assert (=> b!139146 (= tp!11522 b_and!8671)))

(declare-fun b!139150 () Bool)

(declare-fun b_free!3019 () Bool)

(declare-fun b_next!3019 () Bool)

(assert (=> b!139150 (= b_free!3019 (not b_next!3019))))

(declare-fun tp!11524 () Bool)

(declare-fun b_and!8673 () Bool)

(assert (=> b!139150 (= tp!11524 b_and!8673)))

(declare-fun b!139135 () Bool)

(declare-fun e!90743 () Bool)

(declare-fun e!90740 () Bool)

(declare-fun mapRes!4816 () Bool)

(assert (=> b!139135 (= e!90743 (and e!90740 mapRes!4816))))

(declare-fun condMapEmpty!4816 () Bool)

(declare-datatypes ((V!3547 0))(
  ( (V!3548 (val!1507 Int)) )
))
(declare-datatypes ((array!4885 0))(
  ( (array!4886 (arr!2309 (Array (_ BitVec 32) (_ BitVec 64))) (size!2581 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1119 0))(
  ( (ValueCellFull!1119 (v!3273 V!3547)) (EmptyCell!1119) )
))
(declare-datatypes ((array!4887 0))(
  ( (array!4888 (arr!2310 (Array (_ BitVec 32) ValueCell!1119)) (size!2582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1146 0))(
  ( (LongMapFixedSize!1147 (defaultEntry!2937 Int) (mask!7275 (_ BitVec 32)) (extraKeys!2692 (_ BitVec 32)) (zeroValue!2787 V!3547) (minValue!2787 V!3547) (_size!622 (_ BitVec 32)) (_keys!4696 array!4885) (_values!2920 array!4887) (_vacant!622 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!932 0))(
  ( (Cell!933 (v!3274 LongMapFixedSize!1146)) )
))
(declare-datatypes ((LongMap!932 0))(
  ( (LongMap!933 (underlying!477 Cell!932)) )
))
(declare-fun thiss!992 () LongMap!932)

(declare-fun mapDefault!4816 () ValueCell!1119)

(assert (=> b!139135 (= condMapEmpty!4816 (= (arr!2310 (_values!2920 (v!3274 (underlying!477 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1119)) mapDefault!4816)))))

(declare-fun mapNonEmpty!4815 () Bool)

(declare-fun mapRes!4815 () Bool)

(declare-fun tp!11523 () Bool)

(declare-fun e!90731 () Bool)

(assert (=> mapNonEmpty!4815 (= mapRes!4815 (and tp!11523 e!90731))))

(declare-fun mapKey!4815 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!1146)

(declare-fun mapRest!4816 () (Array (_ BitVec 32) ValueCell!1119))

(declare-fun mapValue!4816 () ValueCell!1119)

(assert (=> mapNonEmpty!4815 (= (arr!2310 (_values!2920 newMap!16)) (store mapRest!4816 mapKey!4815 mapValue!4816))))

(declare-fun b!139136 () Bool)

(declare-fun e!90734 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!139136 (= e!90734 (not (or (bvsge (size!2581 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1741 0))(
  ( (Nil!1738) (Cons!1737 (h!2344 (_ BitVec 64)) (t!6313 List!1741)) )
))
(declare-fun arrayNoDuplicates!0 (array!4885 (_ BitVec 32) List!1741) Bool)

(assert (=> b!139136 (arrayNoDuplicates!0 (_keys!4696 (v!3274 (underlying!477 thiss!992))) from!355 Nil!1738)))

(declare-datatypes ((Unit!4369 0))(
  ( (Unit!4370) )
))
(declare-fun lt!72779 () Unit!4369)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4885 (_ BitVec 32) (_ BitVec 32)) Unit!4369)

(assert (=> b!139136 (= lt!72779 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4696 (v!3274 (underlying!477 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139136 (arrayContainsKey!0 (_keys!4696 (v!3274 (underlying!477 thiss!992))) (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72782 () Unit!4369)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!137 (array!4885 array!4887 (_ BitVec 32) (_ BitVec 32) V!3547 V!3547 (_ BitVec 64) (_ BitVec 32) Int) Unit!4369)

(assert (=> b!139136 (= lt!72782 (lemmaListMapContainsThenArrayContainsFrom!137 (_keys!4696 (v!3274 (underlying!477 thiss!992))) (_values!2920 (v!3274 (underlying!477 thiss!992))) (mask!7275 (v!3274 (underlying!477 thiss!992))) (extraKeys!2692 (v!3274 (underlying!477 thiss!992))) (zeroValue!2787 (v!3274 (underlying!477 thiss!992))) (minValue!2787 (v!3274 (underlying!477 thiss!992))) (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2937 (v!3274 (underlying!477 thiss!992)))))))

(declare-fun b!139137 () Bool)

(declare-fun e!90738 () Bool)

(declare-fun tp_is_empty!2925 () Bool)

(assert (=> b!139137 (= e!90738 tp_is_empty!2925)))

(declare-fun b!139138 () Bool)

(declare-fun e!90742 () Bool)

(declare-fun e!90735 () Bool)

(assert (=> b!139138 (= e!90742 e!90735)))

(declare-fun res!66578 () Bool)

(assert (=> b!139138 (=> (not res!66578) (not e!90735))))

(declare-datatypes ((tuple2!2690 0))(
  ( (tuple2!2691 (_1!1356 (_ BitVec 64)) (_2!1356 V!3547)) )
))
(declare-datatypes ((List!1742 0))(
  ( (Nil!1739) (Cons!1738 (h!2345 tuple2!2690) (t!6314 List!1742)) )
))
(declare-datatypes ((ListLongMap!1741 0))(
  ( (ListLongMap!1742 (toList!886 List!1742)) )
))
(declare-fun lt!72778 () ListLongMap!1741)

(declare-fun lt!72781 () ListLongMap!1741)

(assert (=> b!139138 (= res!66578 (and (= lt!72778 lt!72781) (not (= (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1439 (LongMapFixedSize!1146) ListLongMap!1741)

(assert (=> b!139138 (= lt!72781 (map!1439 newMap!16))))

(declare-fun getCurrentListMap!560 (array!4885 array!4887 (_ BitVec 32) (_ BitVec 32) V!3547 V!3547 (_ BitVec 32) Int) ListLongMap!1741)

(assert (=> b!139138 (= lt!72778 (getCurrentListMap!560 (_keys!4696 (v!3274 (underlying!477 thiss!992))) (_values!2920 (v!3274 (underlying!477 thiss!992))) (mask!7275 (v!3274 (underlying!477 thiss!992))) (extraKeys!2692 (v!3274 (underlying!477 thiss!992))) (zeroValue!2787 (v!3274 (underlying!477 thiss!992))) (minValue!2787 (v!3274 (underlying!477 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2937 (v!3274 (underlying!477 thiss!992)))))))

(declare-fun b!139139 () Bool)

(assert (=> b!139139 (= e!90740 tp_is_empty!2925)))

(declare-fun b!139140 () Bool)

(declare-fun e!90739 () Bool)

(declare-fun e!90736 () Bool)

(assert (=> b!139140 (= e!90739 e!90736)))

(declare-fun b!139141 () Bool)

(declare-fun e!90729 () Bool)

(assert (=> b!139141 (= e!90729 tp_is_empty!2925)))

(declare-fun mapIsEmpty!4815 () Bool)

(assert (=> mapIsEmpty!4815 mapRes!4816))

(declare-fun b!139142 () Bool)

(declare-fun e!90737 () Bool)

(assert (=> b!139142 (= e!90737 e!90739)))

(declare-fun b!139143 () Bool)

(declare-fun e!90741 () Bool)

(assert (=> b!139143 (= e!90741 (and e!90729 mapRes!4815))))

(declare-fun condMapEmpty!4815 () Bool)

(declare-fun mapDefault!4815 () ValueCell!1119)

(assert (=> b!139143 (= condMapEmpty!4815 (= (arr!2310 (_values!2920 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1119)) mapDefault!4815)))))

(declare-fun b!139144 () Bool)

(declare-fun res!66581 () Bool)

(assert (=> b!139144 (=> (not res!66581) (not e!90742))))

(declare-fun valid!553 (LongMapFixedSize!1146) Bool)

(assert (=> b!139144 (= res!66581 (valid!553 newMap!16))))

(declare-fun b!139145 () Bool)

(declare-fun res!66577 () Bool)

(assert (=> b!139145 (=> (not res!66577) (not e!90742))))

(assert (=> b!139145 (= res!66577 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2581 (_keys!4696 (v!3274 (underlying!477 thiss!992)))))))))

(declare-fun mapIsEmpty!4816 () Bool)

(assert (=> mapIsEmpty!4816 mapRes!4815))

(declare-fun res!66576 () Bool)

(assert (=> start!14704 (=> (not res!66576) (not e!90742))))

(declare-fun valid!554 (LongMap!932) Bool)

(assert (=> start!14704 (= res!66576 (valid!554 thiss!992))))

(assert (=> start!14704 e!90742))

(assert (=> start!14704 e!90737))

(assert (=> start!14704 true))

(declare-fun e!90730 () Bool)

(assert (=> start!14704 e!90730))

(declare-fun mapNonEmpty!4816 () Bool)

(declare-fun tp!11521 () Bool)

(assert (=> mapNonEmpty!4816 (= mapRes!4816 (and tp!11521 e!90738))))

(declare-fun mapValue!4815 () ValueCell!1119)

(declare-fun mapKey!4816 () (_ BitVec 32))

(declare-fun mapRest!4815 () (Array (_ BitVec 32) ValueCell!1119))

(assert (=> mapNonEmpty!4816 (= (arr!2310 (_values!2920 (v!3274 (underlying!477 thiss!992)))) (store mapRest!4815 mapKey!4816 mapValue!4815))))

(declare-fun array_inv!1451 (array!4885) Bool)

(declare-fun array_inv!1452 (array!4887) Bool)

(assert (=> b!139146 (= e!90736 (and tp!11522 tp_is_empty!2925 (array_inv!1451 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) (array_inv!1452 (_values!2920 (v!3274 (underlying!477 thiss!992)))) e!90743))))

(declare-fun b!139147 () Bool)

(assert (=> b!139147 (= e!90731 tp_is_empty!2925)))

(declare-fun b!139148 () Bool)

(declare-fun res!66579 () Bool)

(assert (=> b!139148 (=> (not res!66579) (not e!90742))))

(assert (=> b!139148 (= res!66579 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7275 newMap!16)) (_size!622 (v!3274 (underlying!477 thiss!992)))))))

(declare-fun b!139149 () Bool)

(assert (=> b!139149 (= e!90735 e!90734)))

(declare-fun res!66580 () Bool)

(assert (=> b!139149 (=> (not res!66580) (not e!90734))))

(declare-fun contains!921 (ListLongMap!1741 (_ BitVec 64)) Bool)

(assert (=> b!139149 (= res!66580 (contains!921 lt!72781 (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2692 0))(
  ( (tuple2!2693 (_1!1357 Bool) (_2!1357 LongMapFixedSize!1146)) )
))
(declare-fun lt!72780 () tuple2!2692)

(declare-fun update!209 (LongMapFixedSize!1146 (_ BitVec 64) V!3547) tuple2!2692)

(declare-fun get!1524 (ValueCell!1119 V!3547) V!3547)

(declare-fun dynLambda!440 (Int (_ BitVec 64)) V!3547)

(assert (=> b!139149 (= lt!72780 (update!209 newMap!16 (select (arr!2309 (_keys!4696 (v!3274 (underlying!477 thiss!992)))) from!355) (get!1524 (select (arr!2310 (_values!2920 (v!3274 (underlying!477 thiss!992)))) from!355) (dynLambda!440 (defaultEntry!2937 (v!3274 (underlying!477 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!139150 (= e!90730 (and tp!11524 tp_is_empty!2925 (array_inv!1451 (_keys!4696 newMap!16)) (array_inv!1452 (_values!2920 newMap!16)) e!90741))))

(assert (= (and start!14704 res!66576) b!139145))

(assert (= (and b!139145 res!66577) b!139144))

(assert (= (and b!139144 res!66581) b!139148))

(assert (= (and b!139148 res!66579) b!139138))

(assert (= (and b!139138 res!66578) b!139149))

(assert (= (and b!139149 res!66580) b!139136))

(assert (= (and b!139135 condMapEmpty!4816) mapIsEmpty!4815))

(assert (= (and b!139135 (not condMapEmpty!4816)) mapNonEmpty!4816))

(get-info :version)

(assert (= (and mapNonEmpty!4816 ((_ is ValueCellFull!1119) mapValue!4815)) b!139137))

(assert (= (and b!139135 ((_ is ValueCellFull!1119) mapDefault!4816)) b!139139))

(assert (= b!139146 b!139135))

(assert (= b!139140 b!139146))

(assert (= b!139142 b!139140))

(assert (= start!14704 b!139142))

(assert (= (and b!139143 condMapEmpty!4815) mapIsEmpty!4816))

(assert (= (and b!139143 (not condMapEmpty!4815)) mapNonEmpty!4815))

(assert (= (and mapNonEmpty!4815 ((_ is ValueCellFull!1119) mapValue!4816)) b!139147))

(assert (= (and b!139143 ((_ is ValueCellFull!1119) mapDefault!4815)) b!139141))

(assert (= b!139150 b!139143))

(assert (= start!14704 b!139150))

(declare-fun b_lambda!6221 () Bool)

(assert (=> (not b_lambda!6221) (not b!139149)))

(declare-fun t!6310 () Bool)

(declare-fun tb!2533 () Bool)

(assert (=> (and b!139146 (= (defaultEntry!2937 (v!3274 (underlying!477 thiss!992))) (defaultEntry!2937 (v!3274 (underlying!477 thiss!992)))) t!6310) tb!2533))

(declare-fun result!4159 () Bool)

(assert (=> tb!2533 (= result!4159 tp_is_empty!2925)))

(assert (=> b!139149 t!6310))

(declare-fun b_and!8675 () Bool)

(assert (= b_and!8671 (and (=> t!6310 result!4159) b_and!8675)))

(declare-fun t!6312 () Bool)

(declare-fun tb!2535 () Bool)

(assert (=> (and b!139150 (= (defaultEntry!2937 newMap!16) (defaultEntry!2937 (v!3274 (underlying!477 thiss!992)))) t!6312) tb!2535))

(declare-fun result!4163 () Bool)

(assert (= result!4163 result!4159))

(assert (=> b!139149 t!6312))

(declare-fun b_and!8677 () Bool)

(assert (= b_and!8673 (and (=> t!6312 result!4163) b_and!8677)))

(declare-fun m!165889 () Bool)

(assert (=> b!139150 m!165889))

(declare-fun m!165891 () Bool)

(assert (=> b!139150 m!165891))

(declare-fun m!165893 () Bool)

(assert (=> b!139144 m!165893))

(declare-fun m!165895 () Bool)

(assert (=> mapNonEmpty!4815 m!165895))

(declare-fun m!165897 () Bool)

(assert (=> mapNonEmpty!4816 m!165897))

(declare-fun m!165899 () Bool)

(assert (=> b!139149 m!165899))

(declare-fun m!165901 () Bool)

(assert (=> b!139149 m!165901))

(declare-fun m!165903 () Bool)

(assert (=> b!139149 m!165903))

(declare-fun m!165905 () Bool)

(assert (=> b!139149 m!165905))

(assert (=> b!139149 m!165905))

(declare-fun m!165907 () Bool)

(assert (=> b!139149 m!165907))

(assert (=> b!139149 m!165901))

(assert (=> b!139149 m!165905))

(assert (=> b!139149 m!165903))

(declare-fun m!165909 () Bool)

(assert (=> b!139149 m!165909))

(assert (=> b!139149 m!165899))

(declare-fun m!165911 () Bool)

(assert (=> start!14704 m!165911))

(declare-fun m!165913 () Bool)

(assert (=> b!139146 m!165913))

(declare-fun m!165915 () Bool)

(assert (=> b!139146 m!165915))

(declare-fun m!165917 () Bool)

(assert (=> b!139136 m!165917))

(declare-fun m!165919 () Bool)

(assert (=> b!139136 m!165919))

(assert (=> b!139136 m!165905))

(declare-fun m!165921 () Bool)

(assert (=> b!139136 m!165921))

(assert (=> b!139136 m!165905))

(assert (=> b!139136 m!165905))

(declare-fun m!165923 () Bool)

(assert (=> b!139136 m!165923))

(assert (=> b!139138 m!165905))

(declare-fun m!165925 () Bool)

(assert (=> b!139138 m!165925))

(declare-fun m!165927 () Bool)

(assert (=> b!139138 m!165927))

(check-sat b_and!8675 tp_is_empty!2925 (not mapNonEmpty!4816) (not b!139136) b_and!8677 (not b!139146) (not start!14704) (not b_lambda!6221) (not b_next!3017) (not b!139150) (not b!139138) (not b!139149) (not b!139144) (not b_next!3019) (not mapNonEmpty!4815))
(check-sat b_and!8675 b_and!8677 (not b_next!3017) (not b_next!3019))
