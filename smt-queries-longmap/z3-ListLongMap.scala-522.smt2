; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13126 () Bool)

(assert start!13126)

(declare-fun b!114843 () Bool)

(declare-fun b_free!2653 () Bool)

(declare-fun b_next!2653 () Bool)

(assert (=> b!114843 (= b_free!2653 (not b_next!2653))))

(declare-fun tp!10324 () Bool)

(declare-fun b_and!7097 () Bool)

(assert (=> b!114843 (= tp!10324 b_and!7097)))

(declare-fun b!114836 () Bool)

(declare-fun b_free!2655 () Bool)

(declare-fun b_next!2655 () Bool)

(assert (=> b!114836 (= b_free!2655 (not b_next!2655))))

(declare-fun tp!10323 () Bool)

(declare-fun b_and!7099 () Bool)

(assert (=> b!114836 (= tp!10323 b_and!7099)))

(declare-fun mapNonEmpty!4161 () Bool)

(declare-fun mapRes!4161 () Bool)

(declare-fun tp!10321 () Bool)

(declare-fun e!74774 () Bool)

(assert (=> mapNonEmpty!4161 (= mapRes!4161 (and tp!10321 e!74774))))

(declare-fun mapKey!4161 () (_ BitVec 32))

(declare-datatypes ((V!3305 0))(
  ( (V!3306 (val!1416 Int)) )
))
(declare-datatypes ((ValueCell!1028 0))(
  ( (ValueCellFull!1028 (v!2993 V!3305)) (EmptyCell!1028) )
))
(declare-fun mapValue!4162 () ValueCell!1028)

(declare-datatypes ((array!4469 0))(
  ( (array!4470 (arr!2116 (Array (_ BitVec 32) (_ BitVec 64))) (size!2377 (_ BitVec 32))) )
))
(declare-datatypes ((array!4471 0))(
  ( (array!4472 (arr!2117 (Array (_ BitVec 32) ValueCell!1028)) (size!2378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!964 0))(
  ( (LongMapFixedSize!965 (defaultEntry!2691 Int) (mask!6890 (_ BitVec 32)) (extraKeys!2480 (_ BitVec 32)) (zeroValue!2558 V!3305) (minValue!2558 V!3305) (_size!531 (_ BitVec 32)) (_keys!4412 array!4469) (_values!2674 array!4471) (_vacant!531 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!964)

(declare-fun mapRest!4161 () (Array (_ BitVec 32) ValueCell!1028))

(assert (=> mapNonEmpty!4161 (= (arr!2117 (_values!2674 newMap!16)) (store mapRest!4161 mapKey!4161 mapValue!4162))))

(declare-fun b!114832 () Bool)

(declare-fun e!74761 () Bool)

(declare-fun e!74770 () Bool)

(assert (=> b!114832 (= e!74761 e!74770)))

(declare-fun b!114833 () Bool)

(declare-fun res!56446 () Bool)

(declare-fun e!74769 () Bool)

(assert (=> b!114833 (=> (not res!56446) (not e!74769))))

(declare-fun valid!456 (LongMapFixedSize!964) Bool)

(assert (=> b!114833 (= res!56446 (valid!456 newMap!16))))

(declare-fun b!114834 () Bool)

(declare-fun e!74775 () Bool)

(declare-fun tp_is_empty!2743 () Bool)

(assert (=> b!114834 (= e!74775 tp_is_empty!2743)))

(declare-fun b!114835 () Bool)

(declare-fun e!74764 () Bool)

(assert (=> b!114835 (= e!74764 e!74761)))

(declare-fun e!74762 () Bool)

(declare-fun e!74772 () Bool)

(declare-fun array_inv!1341 (array!4469) Bool)

(declare-fun array_inv!1342 (array!4471) Bool)

(assert (=> b!114836 (= e!74772 (and tp!10323 tp_is_empty!2743 (array_inv!1341 (_keys!4412 newMap!16)) (array_inv!1342 (_values!2674 newMap!16)) e!74762))))

(declare-fun mapNonEmpty!4162 () Bool)

(declare-fun mapRes!4162 () Bool)

(declare-fun tp!10322 () Bool)

(declare-fun e!74771 () Bool)

(assert (=> mapNonEmpty!4162 (= mapRes!4162 (and tp!10322 e!74771))))

(declare-datatypes ((Cell!752 0))(
  ( (Cell!753 (v!2994 LongMapFixedSize!964)) )
))
(declare-datatypes ((LongMap!752 0))(
  ( (LongMap!753 (underlying!387 Cell!752)) )
))
(declare-fun thiss!992 () LongMap!752)

(declare-fun mapRest!4162 () (Array (_ BitVec 32) ValueCell!1028))

(declare-fun mapValue!4161 () ValueCell!1028)

(declare-fun mapKey!4162 () (_ BitVec 32))

(assert (=> mapNonEmpty!4162 (= (arr!2117 (_values!2674 (v!2994 (underlying!387 thiss!992)))) (store mapRest!4162 mapKey!4162 mapValue!4161))))

(declare-fun b!114837 () Bool)

(declare-fun e!74765 () Bool)

(assert (=> b!114837 (= e!74769 e!74765)))

(declare-fun res!56448 () Bool)

(assert (=> b!114837 (=> (not res!56448) (not e!74765))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2458 0))(
  ( (tuple2!2459 (_1!1240 (_ BitVec 64)) (_2!1240 V!3305)) )
))
(declare-datatypes ((List!1653 0))(
  ( (Nil!1650) (Cons!1649 (h!2249 tuple2!2458) (t!5894 List!1653)) )
))
(declare-datatypes ((ListLongMap!1587 0))(
  ( (ListLongMap!1588 (toList!809 List!1653)) )
))
(declare-fun lt!59814 () ListLongMap!1587)

(declare-fun lt!59817 () ListLongMap!1587)

(assert (=> b!114837 (= res!56448 (and (= lt!59817 lt!59814) (not (= (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1309 (LongMapFixedSize!964) ListLongMap!1587)

(assert (=> b!114837 (= lt!59814 (map!1309 newMap!16))))

(declare-fun getCurrentListMap!481 (array!4469 array!4471 (_ BitVec 32) (_ BitVec 32) V!3305 V!3305 (_ BitVec 32) Int) ListLongMap!1587)

(assert (=> b!114837 (= lt!59817 (getCurrentListMap!481 (_keys!4412 (v!2994 (underlying!387 thiss!992))) (_values!2674 (v!2994 (underlying!387 thiss!992))) (mask!6890 (v!2994 (underlying!387 thiss!992))) (extraKeys!2480 (v!2994 (underlying!387 thiss!992))) (zeroValue!2558 (v!2994 (underlying!387 thiss!992))) (minValue!2558 (v!2994 (underlying!387 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2691 (v!2994 (underlying!387 thiss!992)))))))

(declare-fun b!114838 () Bool)

(declare-fun res!56444 () Bool)

(assert (=> b!114838 (=> (not res!56444) (not e!74769))))

(assert (=> b!114838 (= res!56444 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2377 (_keys!4412 (v!2994 (underlying!387 thiss!992)))))))))

(declare-fun b!114839 () Bool)

(assert (=> b!114839 (= e!74771 tp_is_empty!2743)))

(declare-fun b!114840 () Bool)

(declare-fun e!74773 () Bool)

(assert (=> b!114840 (= e!74762 (and e!74773 mapRes!4161))))

(declare-fun condMapEmpty!4162 () Bool)

(declare-fun mapDefault!4162 () ValueCell!1028)

(assert (=> b!114840 (= condMapEmpty!4162 (= (arr!2117 (_values!2674 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1028)) mapDefault!4162)))))

(declare-fun mapIsEmpty!4161 () Bool)

(assert (=> mapIsEmpty!4161 mapRes!4161))

(declare-fun b!114841 () Bool)

(declare-fun e!74763 () Bool)

(assert (=> b!114841 (= e!74763 (and e!74775 mapRes!4162))))

(declare-fun condMapEmpty!4161 () Bool)

(declare-fun mapDefault!4161 () ValueCell!1028)

(assert (=> b!114841 (= condMapEmpty!4161 (= (arr!2117 (_values!2674 (v!2994 (underlying!387 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1028)) mapDefault!4161)))))

(declare-fun res!56447 () Bool)

(assert (=> start!13126 (=> (not res!56447) (not e!74769))))

(declare-fun valid!457 (LongMap!752) Bool)

(assert (=> start!13126 (= res!56447 (valid!457 thiss!992))))

(assert (=> start!13126 e!74769))

(assert (=> start!13126 e!74764))

(assert (=> start!13126 true))

(assert (=> start!13126 e!74772))

(declare-fun mapIsEmpty!4162 () Bool)

(assert (=> mapIsEmpty!4162 mapRes!4162))

(declare-fun b!114842 () Bool)

(assert (=> b!114842 (= e!74765 false)))

(declare-datatypes ((Unit!3577 0))(
  ( (Unit!3578) )
))
(declare-fun lt!59815 () Unit!3577)

(declare-fun e!74766 () Unit!3577)

(assert (=> b!114842 (= lt!59815 e!74766)))

(declare-fun c!20494 () Bool)

(declare-fun contains!848 (ListLongMap!1587 (_ BitVec 64)) Bool)

(assert (=> b!114842 (= c!20494 (contains!848 lt!59814 (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2460 0))(
  ( (tuple2!2461 (_1!1241 Bool) (_2!1241 LongMapFixedSize!964)) )
))
(declare-fun lt!59812 () tuple2!2460)

(declare-fun update!175 (LongMapFixedSize!964 (_ BitVec 64) V!3305) tuple2!2460)

(declare-fun get!1385 (ValueCell!1028 V!3305) V!3305)

(declare-fun dynLambda!398 (Int (_ BitVec 64)) V!3305)

(assert (=> b!114842 (= lt!59812 (update!175 newMap!16 (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) (get!1385 (select (arr!2117 (_values!2674 (v!2994 (underlying!387 thiss!992)))) from!355) (dynLambda!398 (defaultEntry!2691 (v!2994 (underlying!387 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!114843 (= e!74770 (and tp!10324 tp_is_empty!2743 (array_inv!1341 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) (array_inv!1342 (_values!2674 (v!2994 (underlying!387 thiss!992)))) e!74763))))

(declare-fun b!114844 () Bool)

(declare-fun Unit!3579 () Unit!3577)

(assert (=> b!114844 (= e!74766 Unit!3579)))

(declare-fun b!114845 () Bool)

(declare-fun res!56445 () Bool)

(assert (=> b!114845 (=> (not res!56445) (not e!74769))))

(assert (=> b!114845 (= res!56445 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6890 newMap!16)) (_size!531 (v!2994 (underlying!387 thiss!992)))))))

(declare-fun b!114846 () Bool)

(assert (=> b!114846 (= e!74774 tp_is_empty!2743)))

(declare-fun b!114847 () Bool)

(declare-fun Unit!3580 () Unit!3577)

(assert (=> b!114847 (= e!74766 Unit!3580)))

(declare-fun lt!59816 () Unit!3577)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!125 (array!4469 array!4471 (_ BitVec 32) (_ BitVec 32) V!3305 V!3305 (_ BitVec 64) (_ BitVec 32) Int) Unit!3577)

(assert (=> b!114847 (= lt!59816 (lemmaListMapContainsThenArrayContainsFrom!125 (_keys!4412 (v!2994 (underlying!387 thiss!992))) (_values!2674 (v!2994 (underlying!387 thiss!992))) (mask!6890 (v!2994 (underlying!387 thiss!992))) (extraKeys!2480 (v!2994 (underlying!387 thiss!992))) (zeroValue!2558 (v!2994 (underlying!387 thiss!992))) (minValue!2558 (v!2994 (underlying!387 thiss!992))) (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2691 (v!2994 (underlying!387 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114847 (arrayContainsKey!0 (_keys!4412 (v!2994 (underlying!387 thiss!992))) (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59811 () Unit!3577)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4469 (_ BitVec 32) (_ BitVec 32)) Unit!3577)

(assert (=> b!114847 (= lt!59811 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4412 (v!2994 (underlying!387 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1654 0))(
  ( (Nil!1651) (Cons!1650 (h!2250 (_ BitVec 64)) (t!5895 List!1654)) )
))
(declare-fun arrayNoDuplicates!0 (array!4469 (_ BitVec 32) List!1654) Bool)

(assert (=> b!114847 (arrayNoDuplicates!0 (_keys!4412 (v!2994 (underlying!387 thiss!992))) from!355 Nil!1651)))

(declare-fun lt!59813 () Unit!3577)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4469 (_ BitVec 32) (_ BitVec 64) List!1654) Unit!3577)

(assert (=> b!114847 (= lt!59813 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4412 (v!2994 (underlying!387 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) (Cons!1650 (select (arr!2116 (_keys!4412 (v!2994 (underlying!387 thiss!992)))) from!355) Nil!1651)))))

(assert (=> b!114847 false))

(declare-fun b!114848 () Bool)

(assert (=> b!114848 (= e!74773 tp_is_empty!2743)))

(assert (= (and start!13126 res!56447) b!114838))

(assert (= (and b!114838 res!56444) b!114833))

(assert (= (and b!114833 res!56446) b!114845))

(assert (= (and b!114845 res!56445) b!114837))

(assert (= (and b!114837 res!56448) b!114842))

(assert (= (and b!114842 c!20494) b!114847))

(assert (= (and b!114842 (not c!20494)) b!114844))

(assert (= (and b!114841 condMapEmpty!4161) mapIsEmpty!4162))

(assert (= (and b!114841 (not condMapEmpty!4161)) mapNonEmpty!4162))

(get-info :version)

(assert (= (and mapNonEmpty!4162 ((_ is ValueCellFull!1028) mapValue!4161)) b!114839))

(assert (= (and b!114841 ((_ is ValueCellFull!1028) mapDefault!4161)) b!114834))

(assert (= b!114843 b!114841))

(assert (= b!114832 b!114843))

(assert (= b!114835 b!114832))

(assert (= start!13126 b!114835))

(assert (= (and b!114840 condMapEmpty!4162) mapIsEmpty!4161))

(assert (= (and b!114840 (not condMapEmpty!4162)) mapNonEmpty!4161))

(assert (= (and mapNonEmpty!4161 ((_ is ValueCellFull!1028) mapValue!4162)) b!114846))

(assert (= (and b!114840 ((_ is ValueCellFull!1028) mapDefault!4162)) b!114848))

(assert (= b!114836 b!114840))

(assert (= start!13126 b!114836))

(declare-fun b_lambda!5127 () Bool)

(assert (=> (not b_lambda!5127) (not b!114842)))

(declare-fun t!5891 () Bool)

(declare-fun tb!2205 () Bool)

(assert (=> (and b!114843 (= (defaultEntry!2691 (v!2994 (underlying!387 thiss!992))) (defaultEntry!2691 (v!2994 (underlying!387 thiss!992)))) t!5891) tb!2205))

(declare-fun result!3681 () Bool)

(assert (=> tb!2205 (= result!3681 tp_is_empty!2743)))

(assert (=> b!114842 t!5891))

(declare-fun b_and!7101 () Bool)

(assert (= b_and!7097 (and (=> t!5891 result!3681) b_and!7101)))

(declare-fun tb!2207 () Bool)

(declare-fun t!5893 () Bool)

(assert (=> (and b!114836 (= (defaultEntry!2691 newMap!16) (defaultEntry!2691 (v!2994 (underlying!387 thiss!992)))) t!5893) tb!2207))

(declare-fun result!3685 () Bool)

(assert (= result!3685 result!3681))

(assert (=> b!114842 t!5893))

(declare-fun b_and!7103 () Bool)

(assert (= b_and!7099 (and (=> t!5893 result!3685) b_and!7103)))

(declare-fun m!130935 () Bool)

(assert (=> mapNonEmpty!4161 m!130935))

(declare-fun m!130937 () Bool)

(assert (=> b!114847 m!130937))

(declare-fun m!130939 () Bool)

(assert (=> b!114847 m!130939))

(declare-fun m!130941 () Bool)

(assert (=> b!114847 m!130941))

(declare-fun m!130943 () Bool)

(assert (=> b!114847 m!130943))

(assert (=> b!114847 m!130941))

(assert (=> b!114847 m!130941))

(declare-fun m!130945 () Bool)

(assert (=> b!114847 m!130945))

(assert (=> b!114847 m!130941))

(declare-fun m!130947 () Bool)

(assert (=> b!114847 m!130947))

(declare-fun m!130949 () Bool)

(assert (=> start!13126 m!130949))

(declare-fun m!130951 () Bool)

(assert (=> b!114843 m!130951))

(declare-fun m!130953 () Bool)

(assert (=> b!114843 m!130953))

(declare-fun m!130955 () Bool)

(assert (=> b!114833 m!130955))

(declare-fun m!130957 () Bool)

(assert (=> b!114836 m!130957))

(declare-fun m!130959 () Bool)

(assert (=> b!114836 m!130959))

(assert (=> b!114842 m!130941))

(declare-fun m!130961 () Bool)

(assert (=> b!114842 m!130961))

(declare-fun m!130963 () Bool)

(assert (=> b!114842 m!130963))

(declare-fun m!130965 () Bool)

(assert (=> b!114842 m!130965))

(declare-fun m!130967 () Bool)

(assert (=> b!114842 m!130967))

(assert (=> b!114842 m!130941))

(assert (=> b!114842 m!130965))

(assert (=> b!114842 m!130941))

(assert (=> b!114842 m!130967))

(declare-fun m!130969 () Bool)

(assert (=> b!114842 m!130969))

(assert (=> b!114842 m!130963))

(assert (=> b!114837 m!130941))

(declare-fun m!130971 () Bool)

(assert (=> b!114837 m!130971))

(declare-fun m!130973 () Bool)

(assert (=> b!114837 m!130973))

(declare-fun m!130975 () Bool)

(assert (=> mapNonEmpty!4162 m!130975))

(check-sat (not b!114843) (not b!114847) tp_is_empty!2743 (not mapNonEmpty!4161) (not start!13126) (not b!114836) (not mapNonEmpty!4162) (not b!114833) (not b_next!2655) (not b!114842) (not b!114837) (not b_lambda!5127) b_and!7103 b_and!7101 (not b_next!2653))
(check-sat b_and!7101 b_and!7103 (not b_next!2653) (not b_next!2655))
