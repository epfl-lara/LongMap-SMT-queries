; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11266 () Bool)

(assert start!11266)

(declare-fun b!92861 () Bool)

(declare-fun b_free!2357 () Bool)

(declare-fun b_next!2357 () Bool)

(assert (=> b!92861 (= b_free!2357 (not b_next!2357))))

(declare-fun tp!9332 () Bool)

(declare-fun b_and!5643 () Bool)

(assert (=> b!92861 (= tp!9332 b_and!5643)))

(declare-fun b!92867 () Bool)

(declare-fun b_free!2359 () Bool)

(declare-fun b_next!2359 () Bool)

(assert (=> b!92867 (= b_free!2359 (not b_next!2359))))

(declare-fun tp!9330 () Bool)

(declare-fun b_and!5645 () Bool)

(assert (=> b!92867 (= tp!9330 b_and!5645)))

(declare-fun b!92848 () Bool)

(declare-datatypes ((Unit!2769 0))(
  ( (Unit!2770) )
))
(declare-fun e!60575 () Unit!2769)

(declare-fun Unit!2771 () Unit!2769)

(assert (=> b!92848 (= e!60575 Unit!2771)))

(declare-fun lt!45732 () Unit!2769)

(declare-datatypes ((V!3107 0))(
  ( (V!3108 (val!1342 Int)) )
))
(declare-datatypes ((array!4161 0))(
  ( (array!4162 (arr!1979 (Array (_ BitVec 32) (_ BitVec 64))) (size!2227 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!954 0))(
  ( (ValueCellFull!954 (v!2739 V!3107)) (EmptyCell!954) )
))
(declare-datatypes ((array!4163 0))(
  ( (array!4164 (arr!1980 (Array (_ BitVec 32) ValueCell!954)) (size!2228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!816 0))(
  ( (LongMapFixedSize!817 (defaultEntry!2422 Int) (mask!6490 (_ BitVec 32)) (extraKeys!2251 (_ BitVec 32)) (zeroValue!2309 V!3107) (minValue!2309 V!3107) (_size!457 (_ BitVec 32)) (_keys!4104 array!4161) (_values!2405 array!4163) (_vacant!457 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!616 0))(
  ( (Cell!617 (v!2740 LongMapFixedSize!816)) )
))
(declare-datatypes ((LongMap!616 0))(
  ( (LongMap!617 (underlying!319 Cell!616)) )
))
(declare-fun thiss!992 () LongMap!616)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!81 (array!4161 array!4163 (_ BitVec 32) (_ BitVec 32) V!3107 V!3107 (_ BitVec 64) (_ BitVec 32) Int) Unit!2769)

(assert (=> b!92848 (= lt!45732 (lemmaListMapContainsThenArrayContainsFrom!81 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (_values!2405 (v!2740 (underlying!319 thiss!992))) (mask!6490 (v!2740 (underlying!319 thiss!992))) (extraKeys!2251 (v!2740 (underlying!319 thiss!992))) (zeroValue!2309 (v!2740 (underlying!319 thiss!992))) (minValue!2309 (v!2740 (underlying!319 thiss!992))) (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92848 (arrayContainsKey!0 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45720 () Unit!2769)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4161 (_ BitVec 32) (_ BitVec 32)) Unit!2769)

(assert (=> b!92848 (= lt!45720 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4104 (v!2740 (underlying!319 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1559 0))(
  ( (Nil!1556) (Cons!1555 (h!2147 (_ BitVec 64)) (t!5425 List!1559)) )
))
(declare-fun arrayNoDuplicates!0 (array!4161 (_ BitVec 32) List!1559) Bool)

(assert (=> b!92848 (arrayNoDuplicates!0 (_keys!4104 (v!2740 (underlying!319 thiss!992))) from!355 Nil!1556)))

(declare-fun lt!45716 () Unit!2769)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4161 (_ BitVec 32) (_ BitVec 64) List!1559) Unit!2769)

(assert (=> b!92848 (= lt!45716 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) (Cons!1555 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) Nil!1556)))))

(assert (=> b!92848 false))

(declare-fun b!92849 () Bool)

(declare-fun e!60572 () Bool)

(declare-fun e!60570 () Bool)

(assert (=> b!92849 (= e!60572 e!60570)))

(declare-fun res!47185 () Bool)

(assert (=> b!92849 (=> res!47185 e!60570)))

(declare-datatypes ((tuple2!2286 0))(
  ( (tuple2!2287 (_1!1154 Bool) (_2!1154 LongMapFixedSize!816)) )
))
(declare-fun lt!45715 () tuple2!2286)

(assert (=> b!92849 (= res!47185 (not (_1!1154 lt!45715)))))

(declare-fun lt!45714 () tuple2!2286)

(declare-fun repackFrom!10 (LongMap!616 LongMapFixedSize!816 (_ BitVec 32)) tuple2!2286)

(assert (=> b!92849 (= lt!45715 (repackFrom!10 thiss!992 (_2!1154 lt!45714) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!3613 () Bool)

(declare-fun mapRes!3614 () Bool)

(assert (=> mapIsEmpty!3613 mapRes!3614))

(declare-fun mapIsEmpty!3614 () Bool)

(declare-fun mapRes!3613 () Bool)

(assert (=> mapIsEmpty!3614 mapRes!3613))

(declare-fun b!92850 () Bool)

(declare-fun Unit!2772 () Unit!2769)

(assert (=> b!92850 (= e!60575 Unit!2772)))

(declare-fun b!92852 () Bool)

(declare-fun e!60574 () Bool)

(declare-fun e!60563 () Bool)

(assert (=> b!92852 (= e!60574 e!60563)))

(declare-fun res!47190 () Bool)

(assert (=> b!92852 (=> (not res!47190) (not e!60563))))

(assert (=> b!92852 (= res!47190 (and (not (= (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45723 () V!3107)

(declare-fun get!1247 (ValueCell!954 V!3107) V!3107)

(declare-fun dynLambda!357 (Int (_ BitVec 64)) V!3107)

(assert (=> b!92852 (= lt!45723 (get!1247 (select (arr!1980 (_values!2405 (v!2740 (underlying!319 thiss!992)))) from!355) (dynLambda!357 (defaultEntry!2422 (v!2740 (underlying!319 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92853 () Bool)

(declare-fun e!60577 () Bool)

(declare-fun tp_is_empty!2595 () Bool)

(assert (=> b!92853 (= e!60577 tp_is_empty!2595)))

(declare-fun b!92854 () Bool)

(declare-fun e!60571 () Bool)

(assert (=> b!92854 (= e!60571 (not e!60572))))

(declare-fun res!47189 () Bool)

(assert (=> b!92854 (=> res!47189 e!60572)))

(declare-datatypes ((tuple2!2288 0))(
  ( (tuple2!2289 (_1!1155 (_ BitVec 64)) (_2!1155 V!3107)) )
))
(declare-datatypes ((List!1560 0))(
  ( (Nil!1557) (Cons!1556 (h!2148 tuple2!2288) (t!5426 List!1560)) )
))
(declare-datatypes ((ListLongMap!1509 0))(
  ( (ListLongMap!1510 (toList!770 List!1560)) )
))
(declare-fun getCurrentListMap!462 (array!4161 array!4163 (_ BitVec 32) (_ BitVec 32) V!3107 V!3107 (_ BitVec 32) Int) ListLongMap!1509)

(declare-fun map!1231 (LongMapFixedSize!816) ListLongMap!1509)

(assert (=> b!92854 (= res!47189 (not (= (getCurrentListMap!462 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (_values!2405 (v!2740 (underlying!319 thiss!992))) (mask!6490 (v!2740 (underlying!319 thiss!992))) (extraKeys!2251 (v!2740 (underlying!319 thiss!992))) (zeroValue!2309 (v!2740 (underlying!319 thiss!992))) (minValue!2309 (v!2740 (underlying!319 thiss!992))) from!355 (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))) (map!1231 (_2!1154 lt!45714)))))))

(declare-fun lt!45725 () tuple2!2288)

(declare-fun lt!45726 () ListLongMap!1509)

(declare-fun lt!45718 () tuple2!2288)

(declare-fun lt!45724 () ListLongMap!1509)

(declare-fun +!130 (ListLongMap!1509 tuple2!2288) ListLongMap!1509)

(assert (=> b!92854 (= (+!130 lt!45726 lt!45725) (+!130 (+!130 lt!45724 lt!45725) lt!45718))))

(assert (=> b!92854 (= lt!45725 (tuple2!2289 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2309 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun lt!45730 () Unit!2769)

(declare-fun addCommutativeForDiffKeys!49 (ListLongMap!1509 (_ BitVec 64) V!3107 (_ BitVec 64) V!3107) Unit!2769)

(assert (=> b!92854 (= lt!45730 (addCommutativeForDiffKeys!49 lt!45724 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) lt!45723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2309 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun lt!45722 () ListLongMap!1509)

(assert (=> b!92854 (= lt!45722 lt!45726)))

(assert (=> b!92854 (= lt!45726 (+!130 lt!45724 lt!45718))))

(declare-fun lt!45713 () ListLongMap!1509)

(declare-fun lt!45727 () tuple2!2288)

(assert (=> b!92854 (= lt!45722 (+!130 lt!45713 lt!45727))))

(declare-fun lt!45728 () ListLongMap!1509)

(assert (=> b!92854 (= lt!45724 (+!130 lt!45728 lt!45727))))

(assert (=> b!92854 (= lt!45727 (tuple2!2289 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2309 (v!2740 (underlying!319 thiss!992)))))))

(assert (=> b!92854 (= lt!45713 (+!130 lt!45728 lt!45718))))

(assert (=> b!92854 (= lt!45718 (tuple2!2289 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) lt!45723))))

(declare-fun lt!45721 () Unit!2769)

(assert (=> b!92854 (= lt!45721 (addCommutativeForDiffKeys!49 lt!45728 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) lt!45723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2309 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!95 (array!4161 array!4163 (_ BitVec 32) (_ BitVec 32) V!3107 V!3107 (_ BitVec 32) Int) ListLongMap!1509)

(assert (=> b!92854 (= lt!45728 (getCurrentListMapNoExtraKeys!95 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (_values!2405 (v!2740 (underlying!319 thiss!992))) (mask!6490 (v!2740 (underlying!319 thiss!992))) (extraKeys!2251 (v!2740 (underlying!319 thiss!992))) (zeroValue!2309 (v!2740 (underlying!319 thiss!992))) (minValue!2309 (v!2740 (underlying!319 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun b!92855 () Bool)

(declare-fun res!47184 () Bool)

(declare-fun e!60568 () Bool)

(assert (=> b!92855 (=> (not res!47184) (not e!60568))))

(declare-fun newMap!16 () LongMapFixedSize!816)

(assert (=> b!92855 (= res!47184 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6490 newMap!16)) (_size!457 (v!2740 (underlying!319 thiss!992)))))))

(declare-fun b!92856 () Bool)

(declare-fun e!60569 () Bool)

(assert (=> b!92856 (= e!60569 tp_is_empty!2595)))

(declare-fun b!92857 () Bool)

(declare-fun res!47188 () Bool)

(assert (=> b!92857 (=> (not res!47188) (not e!60568))))

(declare-fun valid!361 (LongMapFixedSize!816) Bool)

(assert (=> b!92857 (= res!47188 (valid!361 newMap!16))))

(declare-fun b!92858 () Bool)

(declare-fun res!47182 () Bool)

(assert (=> b!92858 (=> (not res!47182) (not e!60568))))

(assert (=> b!92858 (= res!47182 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2227 (_keys!4104 (v!2740 (underlying!319 thiss!992)))))))))

(declare-fun b!92859 () Bool)

(declare-fun e!60566 () Bool)

(declare-fun e!60564 () Bool)

(assert (=> b!92859 (= e!60566 e!60564)))

(declare-fun b!92860 () Bool)

(declare-fun e!60578 () Bool)

(assert (=> b!92860 (= e!60578 e!60566)))

(declare-fun e!60576 () Bool)

(declare-fun array_inv!1227 (array!4161) Bool)

(declare-fun array_inv!1228 (array!4163) Bool)

(assert (=> b!92861 (= e!60564 (and tp!9332 tp_is_empty!2595 (array_inv!1227 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) (array_inv!1228 (_values!2405 (v!2740 (underlying!319 thiss!992)))) e!60576))))

(declare-fun mapNonEmpty!3613 () Bool)

(declare-fun tp!9331 () Bool)

(assert (=> mapNonEmpty!3613 (= mapRes!3614 (and tp!9331 e!60569))))

(declare-fun mapRest!3613 () (Array (_ BitVec 32) ValueCell!954))

(declare-fun mapValue!3614 () ValueCell!954)

(declare-fun mapKey!3613 () (_ BitVec 32))

(assert (=> mapNonEmpty!3613 (= (arr!1980 (_values!2405 newMap!16)) (store mapRest!3613 mapKey!3613 mapValue!3614))))

(declare-fun b!92862 () Bool)

(declare-fun e!60581 () Bool)

(assert (=> b!92862 (= e!60581 tp_is_empty!2595)))

(declare-fun b!92863 () Bool)

(declare-fun e!60567 () Bool)

(assert (=> b!92863 (= e!60567 (and e!60581 mapRes!3614))))

(declare-fun condMapEmpty!3613 () Bool)

(declare-fun mapDefault!3614 () ValueCell!954)

(assert (=> b!92863 (= condMapEmpty!3613 (= (arr!1980 (_values!2405 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!954)) mapDefault!3614)))))

(declare-fun b!92864 () Bool)

(assert (=> b!92864 (= e!60570 true)))

(declare-fun lt!45717 () Bool)

(assert (=> b!92864 (= lt!45717 (valid!361 (_2!1154 lt!45715)))))

(declare-fun b!92865 () Bool)

(assert (=> b!92865 (= e!60576 (and e!60577 mapRes!3613))))

(declare-fun condMapEmpty!3614 () Bool)

(declare-fun mapDefault!3613 () ValueCell!954)

(assert (=> b!92865 (= condMapEmpty!3614 (= (arr!1980 (_values!2405 (v!2740 (underlying!319 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!954)) mapDefault!3613)))))

(declare-fun b!92866 () Bool)

(declare-fun e!60573 () Bool)

(assert (=> b!92866 (= e!60573 tp_is_empty!2595)))

(declare-fun b!92851 () Bool)

(assert (=> b!92851 (= e!60563 e!60571)))

(declare-fun res!47183 () Bool)

(assert (=> b!92851 (=> (not res!47183) (not e!60571))))

(assert (=> b!92851 (= res!47183 (and (_1!1154 lt!45714) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!45729 () Unit!2769)

(assert (=> b!92851 (= lt!45729 e!60575)))

(declare-fun c!15460 () Bool)

(declare-fun lt!45719 () ListLongMap!1509)

(declare-fun contains!783 (ListLongMap!1509 (_ BitVec 64)) Bool)

(assert (=> b!92851 (= c!15460 (contains!783 lt!45719 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355)))))

(declare-fun update!130 (LongMapFixedSize!816 (_ BitVec 64) V!3107) tuple2!2286)

(assert (=> b!92851 (= lt!45714 (update!130 newMap!16 (select (arr!1979 (_keys!4104 (v!2740 (underlying!319 thiss!992)))) from!355) lt!45723))))

(declare-fun res!47187 () Bool)

(assert (=> start!11266 (=> (not res!47187) (not e!60568))))

(declare-fun valid!362 (LongMap!616) Bool)

(assert (=> start!11266 (= res!47187 (valid!362 thiss!992))))

(assert (=> start!11266 e!60568))

(assert (=> start!11266 e!60578))

(assert (=> start!11266 true))

(declare-fun e!60580 () Bool)

(assert (=> start!11266 e!60580))

(declare-fun mapNonEmpty!3614 () Bool)

(declare-fun tp!9329 () Bool)

(assert (=> mapNonEmpty!3614 (= mapRes!3613 (and tp!9329 e!60573))))

(declare-fun mapRest!3614 () (Array (_ BitVec 32) ValueCell!954))

(declare-fun mapKey!3614 () (_ BitVec 32))

(declare-fun mapValue!3613 () ValueCell!954)

(assert (=> mapNonEmpty!3614 (= (arr!1980 (_values!2405 (v!2740 (underlying!319 thiss!992)))) (store mapRest!3614 mapKey!3614 mapValue!3613))))

(assert (=> b!92867 (= e!60580 (and tp!9330 tp_is_empty!2595 (array_inv!1227 (_keys!4104 newMap!16)) (array_inv!1228 (_values!2405 newMap!16)) e!60567))))

(declare-fun b!92868 () Bool)

(assert (=> b!92868 (= e!60568 e!60574)))

(declare-fun res!47186 () Bool)

(assert (=> b!92868 (=> (not res!47186) (not e!60574))))

(declare-fun lt!45731 () ListLongMap!1509)

(assert (=> b!92868 (= res!47186 (= lt!45731 lt!45719))))

(assert (=> b!92868 (= lt!45719 (map!1231 newMap!16))))

(assert (=> b!92868 (= lt!45731 (getCurrentListMap!462 (_keys!4104 (v!2740 (underlying!319 thiss!992))) (_values!2405 (v!2740 (underlying!319 thiss!992))) (mask!6490 (v!2740 (underlying!319 thiss!992))) (extraKeys!2251 (v!2740 (underlying!319 thiss!992))) (zeroValue!2309 (v!2740 (underlying!319 thiss!992))) (minValue!2309 (v!2740 (underlying!319 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))))))

(assert (= (and start!11266 res!47187) b!92858))

(assert (= (and b!92858 res!47182) b!92857))

(assert (= (and b!92857 res!47188) b!92855))

(assert (= (and b!92855 res!47184) b!92868))

(assert (= (and b!92868 res!47186) b!92852))

(assert (= (and b!92852 res!47190) b!92851))

(assert (= (and b!92851 c!15460) b!92848))

(assert (= (and b!92851 (not c!15460)) b!92850))

(assert (= (and b!92851 res!47183) b!92854))

(assert (= (and b!92854 (not res!47189)) b!92849))

(assert (= (and b!92849 (not res!47185)) b!92864))

(assert (= (and b!92865 condMapEmpty!3614) mapIsEmpty!3614))

(assert (= (and b!92865 (not condMapEmpty!3614)) mapNonEmpty!3614))

(get-info :version)

(assert (= (and mapNonEmpty!3614 ((_ is ValueCellFull!954) mapValue!3613)) b!92866))

(assert (= (and b!92865 ((_ is ValueCellFull!954) mapDefault!3613)) b!92853))

(assert (= b!92861 b!92865))

(assert (= b!92859 b!92861))

(assert (= b!92860 b!92859))

(assert (= start!11266 b!92860))

(assert (= (and b!92863 condMapEmpty!3613) mapIsEmpty!3613))

(assert (= (and b!92863 (not condMapEmpty!3613)) mapNonEmpty!3613))

(assert (= (and mapNonEmpty!3613 ((_ is ValueCellFull!954) mapValue!3614)) b!92856))

(assert (= (and b!92863 ((_ is ValueCellFull!954) mapDefault!3614)) b!92862))

(assert (= b!92867 b!92863))

(assert (= start!11266 b!92867))

(declare-fun b_lambda!4097 () Bool)

(assert (=> (not b_lambda!4097) (not b!92852)))

(declare-fun t!5422 () Bool)

(declare-fun tb!1833 () Bool)

(assert (=> (and b!92861 (= (defaultEntry!2422 (v!2740 (underlying!319 thiss!992))) (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))) t!5422) tb!1833))

(declare-fun result!3129 () Bool)

(assert (=> tb!1833 (= result!3129 tp_is_empty!2595)))

(assert (=> b!92852 t!5422))

(declare-fun b_and!5647 () Bool)

(assert (= b_and!5643 (and (=> t!5422 result!3129) b_and!5647)))

(declare-fun t!5424 () Bool)

(declare-fun tb!1835 () Bool)

(assert (=> (and b!92867 (= (defaultEntry!2422 newMap!16) (defaultEntry!2422 (v!2740 (underlying!319 thiss!992)))) t!5424) tb!1835))

(declare-fun result!3133 () Bool)

(assert (= result!3133 result!3129))

(assert (=> b!92852 t!5424))

(declare-fun b_and!5649 () Bool)

(assert (= b_and!5645 (and (=> t!5424 result!3133) b_and!5649)))

(declare-fun m!100277 () Bool)

(assert (=> mapNonEmpty!3613 m!100277))

(declare-fun m!100279 () Bool)

(assert (=> b!92851 m!100279))

(assert (=> b!92851 m!100279))

(declare-fun m!100281 () Bool)

(assert (=> b!92851 m!100281))

(assert (=> b!92851 m!100279))

(declare-fun m!100283 () Bool)

(assert (=> b!92851 m!100283))

(declare-fun m!100285 () Bool)

(assert (=> b!92848 m!100285))

(declare-fun m!100287 () Bool)

(assert (=> b!92848 m!100287))

(assert (=> b!92848 m!100279))

(declare-fun m!100289 () Bool)

(assert (=> b!92848 m!100289))

(assert (=> b!92848 m!100279))

(assert (=> b!92848 m!100279))

(declare-fun m!100291 () Bool)

(assert (=> b!92848 m!100291))

(assert (=> b!92848 m!100279))

(declare-fun m!100293 () Bool)

(assert (=> b!92848 m!100293))

(declare-fun m!100295 () Bool)

(assert (=> start!11266 m!100295))

(declare-fun m!100297 () Bool)

(assert (=> b!92854 m!100297))

(declare-fun m!100299 () Bool)

(assert (=> b!92854 m!100299))

(assert (=> b!92854 m!100279))

(declare-fun m!100301 () Bool)

(assert (=> b!92854 m!100301))

(declare-fun m!100303 () Bool)

(assert (=> b!92854 m!100303))

(assert (=> b!92854 m!100279))

(declare-fun m!100305 () Bool)

(assert (=> b!92854 m!100305))

(declare-fun m!100307 () Bool)

(assert (=> b!92854 m!100307))

(assert (=> b!92854 m!100297))

(declare-fun m!100309 () Bool)

(assert (=> b!92854 m!100309))

(declare-fun m!100311 () Bool)

(assert (=> b!92854 m!100311))

(declare-fun m!100313 () Bool)

(assert (=> b!92854 m!100313))

(declare-fun m!100315 () Bool)

(assert (=> b!92854 m!100315))

(assert (=> b!92854 m!100279))

(declare-fun m!100317 () Bool)

(assert (=> b!92854 m!100317))

(declare-fun m!100319 () Bool)

(assert (=> b!92854 m!100319))

(declare-fun m!100321 () Bool)

(assert (=> b!92849 m!100321))

(declare-fun m!100323 () Bool)

(assert (=> mapNonEmpty!3614 m!100323))

(declare-fun m!100325 () Bool)

(assert (=> b!92864 m!100325))

(declare-fun m!100327 () Bool)

(assert (=> b!92861 m!100327))

(declare-fun m!100329 () Bool)

(assert (=> b!92861 m!100329))

(declare-fun m!100331 () Bool)

(assert (=> b!92857 m!100331))

(declare-fun m!100333 () Bool)

(assert (=> b!92867 m!100333))

(declare-fun m!100335 () Bool)

(assert (=> b!92867 m!100335))

(assert (=> b!92852 m!100279))

(declare-fun m!100337 () Bool)

(assert (=> b!92852 m!100337))

(declare-fun m!100339 () Bool)

(assert (=> b!92852 m!100339))

(assert (=> b!92852 m!100337))

(assert (=> b!92852 m!100339))

(declare-fun m!100341 () Bool)

(assert (=> b!92852 m!100341))

(declare-fun m!100343 () Bool)

(assert (=> b!92868 m!100343))

(declare-fun m!100345 () Bool)

(assert (=> b!92868 m!100345))

(check-sat (not b!92868) (not mapNonEmpty!3614) tp_is_empty!2595 (not b!92848) b_and!5649 (not b!92851) (not b!92854) (not b!92852) (not b!92861) (not b_next!2359) (not b!92864) (not b!92849) (not b_lambda!4097) b_and!5647 (not mapNonEmpty!3613) (not b!92857) (not b!92867) (not b_next!2357) (not start!11266))
(check-sat b_and!5647 b_and!5649 (not b_next!2357) (not b_next!2359))
