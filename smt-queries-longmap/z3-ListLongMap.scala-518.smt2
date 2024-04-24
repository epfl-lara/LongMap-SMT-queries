; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13068 () Bool)

(assert start!13068)

(declare-fun b!113869 () Bool)

(declare-fun b_free!2605 () Bool)

(declare-fun b_next!2605 () Bool)

(assert (=> b!113869 (= b_free!2605 (not b_next!2605))))

(declare-fun tp!10174 () Bool)

(declare-fun b_and!6997 () Bool)

(assert (=> b!113869 (= tp!10174 b_and!6997)))

(declare-fun b!113874 () Bool)

(declare-fun b_free!2607 () Bool)

(declare-fun b_next!2607 () Bool)

(assert (=> b!113874 (= b_free!2607 (not b_next!2607))))

(declare-fun tp!10175 () Bool)

(declare-fun b_and!6999 () Bool)

(assert (=> b!113874 (= tp!10175 b_and!6999)))

(declare-fun b!113863 () Bool)

(declare-fun e!74024 () Bool)

(declare-fun tp_is_empty!2719 () Bool)

(assert (=> b!113863 (= e!74024 tp_is_empty!2719)))

(declare-fun b!113864 () Bool)

(declare-fun res!56105 () Bool)

(declare-fun e!74016 () Bool)

(assert (=> b!113864 (=> (not res!56105) (not e!74016))))

(declare-datatypes ((V!3273 0))(
  ( (V!3274 (val!1404 Int)) )
))
(declare-datatypes ((array!4425 0))(
  ( (array!4426 (arr!2096 (Array (_ BitVec 32) (_ BitVec 64))) (size!2356 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1016 0))(
  ( (ValueCellFull!1016 (v!2977 V!3273)) (EmptyCell!1016) )
))
(declare-datatypes ((array!4427 0))(
  ( (array!4428 (arr!2097 (Array (_ BitVec 32) ValueCell!1016)) (size!2357 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!940 0))(
  ( (LongMapFixedSize!941 (defaultEntry!2676 Int) (mask!6868 (_ BitVec 32)) (extraKeys!2465 (_ BitVec 32)) (zeroValue!2543 V!3273) (minValue!2543 V!3273) (_size!519 (_ BitVec 32)) (_keys!4398 array!4425) (_values!2659 array!4427) (_vacant!519 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!940)

(declare-fun valid!447 (LongMapFixedSize!940) Bool)

(assert (=> b!113864 (= res!56105 (valid!447 newMap!16))))

(declare-fun b!113865 () Bool)

(declare-fun e!74026 () Bool)

(assert (=> b!113865 (= e!74026 tp_is_empty!2719)))

(declare-fun b!113867 () Bool)

(declare-fun e!74018 () Bool)

(declare-fun e!74019 () Bool)

(assert (=> b!113867 (= e!74018 e!74019)))

(declare-fun b!113868 () Bool)

(declare-fun res!56104 () Bool)

(assert (=> b!113868 (=> (not res!56104) (not e!74016))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!742 0))(
  ( (Cell!743 (v!2978 LongMapFixedSize!940)) )
))
(declare-datatypes ((LongMap!742 0))(
  ( (LongMap!743 (underlying!382 Cell!742)) )
))
(declare-fun thiss!992 () LongMap!742)

(assert (=> b!113868 (= res!56104 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2356 (_keys!4398 (v!2978 (underlying!382 thiss!992)))))))))

(declare-fun e!74010 () Bool)

(declare-fun e!74015 () Bool)

(declare-fun array_inv!1301 (array!4425) Bool)

(declare-fun array_inv!1302 (array!4427) Bool)

(assert (=> b!113869 (= e!74015 (and tp!10174 tp_is_empty!2719 (array_inv!1301 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) (array_inv!1302 (_values!2659 (v!2978 (underlying!382 thiss!992)))) e!74010))))

(declare-fun b!113870 () Bool)

(declare-fun mapRes!4086 () Bool)

(assert (=> b!113870 (= e!74010 (and e!74026 mapRes!4086))))

(declare-fun condMapEmpty!4085 () Bool)

(declare-fun mapDefault!4085 () ValueCell!1016)

(assert (=> b!113870 (= condMapEmpty!4085 (= (arr!2097 (_values!2659 (v!2978 (underlying!382 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1016)) mapDefault!4085)))))

(declare-fun b!113871 () Bool)

(declare-fun e!74012 () Bool)

(assert (=> b!113871 (= e!74012 (not true))))

(declare-datatypes ((tuple2!2424 0))(
  ( (tuple2!2425 (_1!1223 (_ BitVec 64)) (_2!1223 V!3273)) )
))
(declare-datatypes ((List!1626 0))(
  ( (Nil!1623) (Cons!1622 (h!2222 tuple2!2424) (t!5820 List!1626)) )
))
(declare-datatypes ((ListLongMap!1567 0))(
  ( (ListLongMap!1568 (toList!799 List!1626)) )
))
(declare-fun lt!59137 () ListLongMap!1567)

(declare-fun lt!59136 () tuple2!2424)

(declare-fun lt!59140 () tuple2!2424)

(declare-fun +!153 (ListLongMap!1567 tuple2!2424) ListLongMap!1567)

(assert (=> b!113871 (= (+!153 (+!153 lt!59137 lt!59136) lt!59140) (+!153 (+!153 lt!59137 lt!59140) lt!59136))))

(assert (=> b!113871 (= lt!59140 (tuple2!2425 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun lt!59131 () V!3273)

(assert (=> b!113871 (= lt!59136 (tuple2!2425 (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59131))))

(declare-datatypes ((Unit!3539 0))(
  ( (Unit!3540) )
))
(declare-fun lt!59134 () Unit!3539)

(declare-fun addCommutativeForDiffKeys!66 (ListLongMap!1567 (_ BitVec 64) V!3273 (_ BitVec 64) V!3273) Unit!3539)

(assert (=> b!113871 (= lt!59134 (addCommutativeForDiffKeys!66 lt!59137 (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59131 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!120 (array!4425 array!4427 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1567)

(assert (=> b!113871 (= lt!59137 (getCurrentListMapNoExtraKeys!120 (_keys!4398 (v!2978 (underlying!382 thiss!992))) (_values!2659 (v!2978 (underlying!382 thiss!992))) (mask!6868 (v!2978 (underlying!382 thiss!992))) (extraKeys!2465 (v!2978 (underlying!382 thiss!992))) (zeroValue!2543 (v!2978 (underlying!382 thiss!992))) (minValue!2543 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun mapIsEmpty!4085 () Bool)

(declare-fun mapRes!4085 () Bool)

(assert (=> mapIsEmpty!4085 mapRes!4085))

(declare-fun mapNonEmpty!4085 () Bool)

(declare-fun tp!10176 () Bool)

(declare-fun e!74022 () Bool)

(assert (=> mapNonEmpty!4085 (= mapRes!4085 (and tp!10176 e!74022))))

(declare-fun mapKey!4086 () (_ BitVec 32))

(declare-fun mapValue!4085 () ValueCell!1016)

(declare-fun mapRest!4086 () (Array (_ BitVec 32) ValueCell!1016))

(assert (=> mapNonEmpty!4085 (= (arr!2097 (_values!2659 newMap!16)) (store mapRest!4086 mapKey!4086 mapValue!4085))))

(declare-fun b!113872 () Bool)

(declare-fun e!74023 () Bool)

(assert (=> b!113872 (= e!74016 e!74023)))

(declare-fun res!56099 () Bool)

(assert (=> b!113872 (=> (not res!56099) (not e!74023))))

(declare-fun lt!59133 () ListLongMap!1567)

(declare-fun lt!59139 () ListLongMap!1567)

(assert (=> b!113872 (= res!56099 (= lt!59133 lt!59139))))

(declare-fun map!1310 (LongMapFixedSize!940) ListLongMap!1567)

(assert (=> b!113872 (= lt!59139 (map!1310 newMap!16))))

(declare-fun getCurrentListMap!482 (array!4425 array!4427 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1567)

(assert (=> b!113872 (= lt!59133 (getCurrentListMap!482 (_keys!4398 (v!2978 (underlying!382 thiss!992))) (_values!2659 (v!2978 (underlying!382 thiss!992))) (mask!6868 (v!2978 (underlying!382 thiss!992))) (extraKeys!2465 (v!2978 (underlying!382 thiss!992))) (zeroValue!2543 (v!2978 (underlying!382 thiss!992))) (minValue!2543 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun b!113873 () Bool)

(declare-fun e!74017 () Bool)

(assert (=> b!113873 (= e!74017 e!74012)))

(declare-fun res!56101 () Bool)

(assert (=> b!113873 (=> (not res!56101) (not e!74012))))

(declare-datatypes ((tuple2!2426 0))(
  ( (tuple2!2427 (_1!1224 Bool) (_2!1224 LongMapFixedSize!940)) )
))
(declare-fun lt!59132 () tuple2!2426)

(assert (=> b!113873 (= res!56101 (and (_1!1224 lt!59132) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59130 () Unit!3539)

(declare-fun e!74020 () Unit!3539)

(assert (=> b!113873 (= lt!59130 e!74020)))

(declare-fun c!20379 () Bool)

(declare-fun contains!839 (ListLongMap!1567 (_ BitVec 64)) Bool)

(assert (=> b!113873 (= c!20379 (contains!839 lt!59139 (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355)))))

(declare-fun update!174 (LongMapFixedSize!940 (_ BitVec 64) V!3273) tuple2!2426)

(assert (=> b!113873 (= lt!59132 (update!174 newMap!16 (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59131))))

(declare-fun e!74021 () Bool)

(declare-fun e!74013 () Bool)

(assert (=> b!113874 (= e!74013 (and tp!10175 tp_is_empty!2719 (array_inv!1301 (_keys!4398 newMap!16)) (array_inv!1302 (_values!2659 newMap!16)) e!74021))))

(declare-fun b!113875 () Bool)

(declare-fun Unit!3541 () Unit!3539)

(assert (=> b!113875 (= e!74020 Unit!3541)))

(declare-fun b!113876 () Bool)

(declare-fun res!56100 () Bool)

(assert (=> b!113876 (=> (not res!56100) (not e!74016))))

(assert (=> b!113876 (= res!56100 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6868 newMap!16)) (_size!519 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun b!113877 () Bool)

(assert (=> b!113877 (= e!74019 e!74015)))

(declare-fun res!56102 () Bool)

(assert (=> start!13068 (=> (not res!56102) (not e!74016))))

(declare-fun valid!448 (LongMap!742) Bool)

(assert (=> start!13068 (= res!56102 (valid!448 thiss!992))))

(assert (=> start!13068 e!74016))

(assert (=> start!13068 e!74018))

(assert (=> start!13068 true))

(assert (=> start!13068 e!74013))

(declare-fun b!113866 () Bool)

(assert (=> b!113866 (= e!74023 e!74017)))

(declare-fun res!56103 () Bool)

(assert (=> b!113866 (=> (not res!56103) (not e!74017))))

(assert (=> b!113866 (= res!56103 (and (not (= (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1377 (ValueCell!1016 V!3273) V!3273)

(declare-fun dynLambda!397 (Int (_ BitVec 64)) V!3273)

(assert (=> b!113866 (= lt!59131 (get!1377 (select (arr!2097 (_values!2659 (v!2978 (underlying!382 thiss!992)))) from!355) (dynLambda!397 (defaultEntry!2676 (v!2978 (underlying!382 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113878 () Bool)

(declare-fun e!74011 () Bool)

(assert (=> b!113878 (= e!74021 (and e!74011 mapRes!4085))))

(declare-fun condMapEmpty!4086 () Bool)

(declare-fun mapDefault!4086 () ValueCell!1016)

(assert (=> b!113878 (= condMapEmpty!4086 (= (arr!2097 (_values!2659 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1016)) mapDefault!4086)))))

(declare-fun b!113879 () Bool)

(declare-fun Unit!3542 () Unit!3539)

(assert (=> b!113879 (= e!74020 Unit!3542)))

(declare-fun lt!59141 () Unit!3539)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!111 (array!4425 array!4427 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 64) (_ BitVec 32) Int) Unit!3539)

(assert (=> b!113879 (= lt!59141 (lemmaListMapContainsThenArrayContainsFrom!111 (_keys!4398 (v!2978 (underlying!382 thiss!992))) (_values!2659 (v!2978 (underlying!382 thiss!992))) (mask!6868 (v!2978 (underlying!382 thiss!992))) (extraKeys!2465 (v!2978 (underlying!382 thiss!992))) (zeroValue!2543 (v!2978 (underlying!382 thiss!992))) (minValue!2543 (v!2978 (underlying!382 thiss!992))) (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113879 (arrayContainsKey!0 (_keys!4398 (v!2978 (underlying!382 thiss!992))) (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59138 () Unit!3539)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4425 (_ BitVec 32) (_ BitVec 32)) Unit!3539)

(assert (=> b!113879 (= lt!59138 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4398 (v!2978 (underlying!382 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1627 0))(
  ( (Nil!1624) (Cons!1623 (h!2223 (_ BitVec 64)) (t!5821 List!1627)) )
))
(declare-fun arrayNoDuplicates!0 (array!4425 (_ BitVec 32) List!1627) Bool)

(assert (=> b!113879 (arrayNoDuplicates!0 (_keys!4398 (v!2978 (underlying!382 thiss!992))) from!355 Nil!1624)))

(declare-fun lt!59135 () Unit!3539)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4425 (_ BitVec 32) (_ BitVec 64) List!1627) Unit!3539)

(assert (=> b!113879 (= lt!59135 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4398 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) (Cons!1623 (select (arr!2096 (_keys!4398 (v!2978 (underlying!382 thiss!992)))) from!355) Nil!1624)))))

(assert (=> b!113879 false))

(declare-fun mapNonEmpty!4086 () Bool)

(declare-fun tp!10173 () Bool)

(assert (=> mapNonEmpty!4086 (= mapRes!4086 (and tp!10173 e!74024))))

(declare-fun mapKey!4085 () (_ BitVec 32))

(declare-fun mapRest!4085 () (Array (_ BitVec 32) ValueCell!1016))

(declare-fun mapValue!4086 () ValueCell!1016)

(assert (=> mapNonEmpty!4086 (= (arr!2097 (_values!2659 (v!2978 (underlying!382 thiss!992)))) (store mapRest!4085 mapKey!4085 mapValue!4086))))

(declare-fun b!113880 () Bool)

(assert (=> b!113880 (= e!74011 tp_is_empty!2719)))

(declare-fun mapIsEmpty!4086 () Bool)

(assert (=> mapIsEmpty!4086 mapRes!4086))

(declare-fun b!113881 () Bool)

(assert (=> b!113881 (= e!74022 tp_is_empty!2719)))

(assert (= (and start!13068 res!56102) b!113868))

(assert (= (and b!113868 res!56104) b!113864))

(assert (= (and b!113864 res!56105) b!113876))

(assert (= (and b!113876 res!56100) b!113872))

(assert (= (and b!113872 res!56099) b!113866))

(assert (= (and b!113866 res!56103) b!113873))

(assert (= (and b!113873 c!20379) b!113879))

(assert (= (and b!113873 (not c!20379)) b!113875))

(assert (= (and b!113873 res!56101) b!113871))

(assert (= (and b!113870 condMapEmpty!4085) mapIsEmpty!4086))

(assert (= (and b!113870 (not condMapEmpty!4085)) mapNonEmpty!4086))

(get-info :version)

(assert (= (and mapNonEmpty!4086 ((_ is ValueCellFull!1016) mapValue!4086)) b!113863))

(assert (= (and b!113870 ((_ is ValueCellFull!1016) mapDefault!4085)) b!113865))

(assert (= b!113869 b!113870))

(assert (= b!113877 b!113869))

(assert (= b!113867 b!113877))

(assert (= start!13068 b!113867))

(assert (= (and b!113878 condMapEmpty!4086) mapIsEmpty!4085))

(assert (= (and b!113878 (not condMapEmpty!4086)) mapNonEmpty!4085))

(assert (= (and mapNonEmpty!4085 ((_ is ValueCellFull!1016) mapValue!4085)) b!113881))

(assert (= (and b!113878 ((_ is ValueCellFull!1016) mapDefault!4086)) b!113880))

(assert (= b!113874 b!113878))

(assert (= start!13068 b!113874))

(declare-fun b_lambda!5097 () Bool)

(assert (=> (not b_lambda!5097) (not b!113866)))

(declare-fun t!5817 () Bool)

(declare-fun tb!2157 () Bool)

(assert (=> (and b!113869 (= (defaultEntry!2676 (v!2978 (underlying!382 thiss!992))) (defaultEntry!2676 (v!2978 (underlying!382 thiss!992)))) t!5817) tb!2157))

(declare-fun result!3607 () Bool)

(assert (=> tb!2157 (= result!3607 tp_is_empty!2719)))

(assert (=> b!113866 t!5817))

(declare-fun b_and!7001 () Bool)

(assert (= b_and!6997 (and (=> t!5817 result!3607) b_and!7001)))

(declare-fun t!5819 () Bool)

(declare-fun tb!2159 () Bool)

(assert (=> (and b!113874 (= (defaultEntry!2676 newMap!16) (defaultEntry!2676 (v!2978 (underlying!382 thiss!992)))) t!5819) tb!2159))

(declare-fun result!3611 () Bool)

(assert (= result!3611 result!3607))

(assert (=> b!113866 t!5819))

(declare-fun b_and!7003 () Bool)

(assert (= b_and!6999 (and (=> t!5819 result!3611) b_and!7003)))

(declare-fun m!130129 () Bool)

(assert (=> b!113871 m!130129))

(declare-fun m!130131 () Bool)

(assert (=> b!113871 m!130131))

(declare-fun m!130133 () Bool)

(assert (=> b!113871 m!130133))

(declare-fun m!130135 () Bool)

(assert (=> b!113871 m!130135))

(declare-fun m!130137 () Bool)

(assert (=> b!113871 m!130137))

(declare-fun m!130139 () Bool)

(assert (=> b!113871 m!130139))

(assert (=> b!113871 m!130133))

(declare-fun m!130141 () Bool)

(assert (=> b!113871 m!130141))

(assert (=> b!113871 m!130135))

(assert (=> b!113871 m!130129))

(declare-fun m!130143 () Bool)

(assert (=> b!113864 m!130143))

(declare-fun m!130145 () Bool)

(assert (=> mapNonEmpty!4085 m!130145))

(declare-fun m!130147 () Bool)

(assert (=> start!13068 m!130147))

(declare-fun m!130149 () Bool)

(assert (=> b!113874 m!130149))

(declare-fun m!130151 () Bool)

(assert (=> b!113874 m!130151))

(declare-fun m!130153 () Bool)

(assert (=> b!113872 m!130153))

(declare-fun m!130155 () Bool)

(assert (=> b!113872 m!130155))

(assert (=> b!113873 m!130133))

(assert (=> b!113873 m!130133))

(declare-fun m!130157 () Bool)

(assert (=> b!113873 m!130157))

(assert (=> b!113873 m!130133))

(declare-fun m!130159 () Bool)

(assert (=> b!113873 m!130159))

(assert (=> b!113866 m!130133))

(declare-fun m!130161 () Bool)

(assert (=> b!113866 m!130161))

(declare-fun m!130163 () Bool)

(assert (=> b!113866 m!130163))

(assert (=> b!113866 m!130161))

(assert (=> b!113866 m!130163))

(declare-fun m!130165 () Bool)

(assert (=> b!113866 m!130165))

(declare-fun m!130167 () Bool)

(assert (=> mapNonEmpty!4086 m!130167))

(declare-fun m!130169 () Bool)

(assert (=> b!113879 m!130169))

(declare-fun m!130171 () Bool)

(assert (=> b!113879 m!130171))

(assert (=> b!113879 m!130133))

(declare-fun m!130173 () Bool)

(assert (=> b!113879 m!130173))

(assert (=> b!113879 m!130133))

(assert (=> b!113879 m!130133))

(declare-fun m!130175 () Bool)

(assert (=> b!113879 m!130175))

(assert (=> b!113879 m!130133))

(declare-fun m!130177 () Bool)

(assert (=> b!113879 m!130177))

(declare-fun m!130179 () Bool)

(assert (=> b!113869 m!130179))

(declare-fun m!130181 () Bool)

(assert (=> b!113869 m!130181))

(check-sat tp_is_empty!2719 (not b_lambda!5097) b_and!7003 (not mapNonEmpty!4086) (not b!113872) b_and!7001 (not b!113879) (not b!113866) (not b_next!2607) (not start!13068) (not mapNonEmpty!4085) (not b!113871) (not b_next!2605) (not b!113864) (not b!113874) (not b!113869) (not b!113873))
(check-sat b_and!7001 b_and!7003 (not b_next!2605) (not b_next!2607))
