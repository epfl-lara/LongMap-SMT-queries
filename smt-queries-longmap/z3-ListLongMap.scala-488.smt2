; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10840 () Bool)

(assert start!10840)

(declare-fun b!87755 () Bool)

(declare-fun b_free!2249 () Bool)

(declare-fun b_next!2249 () Bool)

(assert (=> b!87755 (= b_free!2249 (not b_next!2249))))

(declare-fun tp!8980 () Bool)

(declare-fun b_and!5287 () Bool)

(assert (=> b!87755 (= tp!8980 b_and!5287)))

(declare-fun b!87751 () Bool)

(declare-fun b_free!2251 () Bool)

(declare-fun b_next!2251 () Bool)

(assert (=> b!87751 (= b_free!2251 (not b_next!2251))))

(declare-fun tp!8982 () Bool)

(declare-fun b_and!5289 () Bool)

(assert (=> b!87751 (= tp!8982 b_and!5289)))

(declare-fun b!87739 () Bool)

(declare-datatypes ((Unit!2600 0))(
  ( (Unit!2601) )
))
(declare-fun e!57175 () Unit!2600)

(declare-fun Unit!2602 () Unit!2600)

(assert (=> b!87739 (= e!57175 Unit!2602)))

(declare-fun mapNonEmpty!3425 () Bool)

(declare-fun mapRes!3426 () Bool)

(declare-fun tp!8979 () Bool)

(declare-fun e!57183 () Bool)

(assert (=> mapNonEmpty!3425 (= mapRes!3426 (and tp!8979 e!57183))))

(declare-datatypes ((V!3035 0))(
  ( (V!3036 (val!1315 Int)) )
))
(declare-datatypes ((array!4043 0))(
  ( (array!4044 (arr!1925 (Array (_ BitVec 32) (_ BitVec 64))) (size!2170 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!927 0))(
  ( (ValueCellFull!927 (v!2660 V!3035)) (EmptyCell!927) )
))
(declare-datatypes ((array!4045 0))(
  ( (array!4046 (arr!1926 (Array (_ BitVec 32) ValueCell!927)) (size!2171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!762 0))(
  ( (LongMapFixedSize!763 (defaultEntry!2359 Int) (mask!6397 (_ BitVec 32)) (extraKeys!2194 (_ BitVec 32)) (zeroValue!2249 V!3035) (minValue!2249 V!3035) (_size!430 (_ BitVec 32)) (_keys!4035 array!4043) (_values!2342 array!4045) (_vacant!430 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!762)

(declare-fun mapRest!3426 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapValue!3426 () ValueCell!927)

(declare-fun mapKey!3425 () (_ BitVec 32))

(assert (=> mapNonEmpty!3425 (= (arr!1926 (_values!2342 newMap!16)) (store mapRest!3426 mapKey!3425 mapValue!3426))))

(declare-fun b!87740 () Bool)

(declare-fun e!57179 () Bool)

(declare-fun e!57181 () Bool)

(assert (=> b!87740 (= e!57179 (and e!57181 mapRes!3426))))

(declare-fun condMapEmpty!3425 () Bool)

(declare-fun mapDefault!3426 () ValueCell!927)

(assert (=> b!87740 (= condMapEmpty!3425 (= (arr!1926 (_values!2342 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3426)))))

(declare-fun res!45000 () Bool)

(declare-fun e!57182 () Bool)

(assert (=> start!10840 (=> (not res!45000) (not e!57182))))

(declare-datatypes ((Cell!562 0))(
  ( (Cell!563 (v!2661 LongMapFixedSize!762)) )
))
(declare-datatypes ((LongMap!562 0))(
  ( (LongMap!563 (underlying!292 Cell!562)) )
))
(declare-fun thiss!992 () LongMap!562)

(declare-fun valid!326 (LongMap!562) Bool)

(assert (=> start!10840 (= res!45000 (valid!326 thiss!992))))

(assert (=> start!10840 e!57182))

(declare-fun e!57172 () Bool)

(assert (=> start!10840 e!57172))

(assert (=> start!10840 true))

(declare-fun e!57171 () Bool)

(assert (=> start!10840 e!57171))

(declare-fun b!87741 () Bool)

(declare-fun res!44994 () Bool)

(assert (=> b!87741 (=> (not res!44994) (not e!57182))))

(assert (=> b!87741 (= res!44994 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6397 newMap!16)) (_size!430 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!87742 () Bool)

(declare-fun res!45002 () Bool)

(declare-fun e!57174 () Bool)

(assert (=> b!87742 (=> res!45002 e!57174)))

(assert (=> b!87742 (= res!45002 (or (not (= (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6397 (v!2661 (underlying!292 thiss!992)))))) (not (= (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992)))))) (bvslt (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!87743 () Bool)

(declare-fun e!57178 () Bool)

(declare-fun e!57184 () Bool)

(declare-fun mapRes!3425 () Bool)

(assert (=> b!87743 (= e!57178 (and e!57184 mapRes!3425))))

(declare-fun condMapEmpty!3426 () Bool)

(declare-fun mapDefault!3425 () ValueCell!927)

(assert (=> b!87743 (= condMapEmpty!3426 (= (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3425)))))

(declare-fun mapIsEmpty!3425 () Bool)

(assert (=> mapIsEmpty!3425 mapRes!3426))

(declare-fun b!87744 () Bool)

(declare-fun e!57176 () Bool)

(declare-fun tp_is_empty!2541 () Bool)

(assert (=> b!87744 (= e!57176 tp_is_empty!2541)))

(declare-fun b!87745 () Bool)

(assert (=> b!87745 (= e!57181 tp_is_empty!2541)))

(declare-fun b!87746 () Bool)

(declare-fun res!44996 () Bool)

(assert (=> b!87746 (=> (not res!44996) (not e!57182))))

(declare-fun valid!327 (LongMapFixedSize!762) Bool)

(assert (=> b!87746 (= res!44996 (valid!327 newMap!16))))

(declare-fun b!87747 () Bool)

(declare-fun res!45001 () Bool)

(assert (=> b!87747 (=> (not res!45001) (not e!57182))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!87747 (= res!45001 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun mapNonEmpty!3426 () Bool)

(declare-fun tp!8981 () Bool)

(assert (=> mapNonEmpty!3426 (= mapRes!3425 (and tp!8981 e!57176))))

(declare-fun mapKey!3426 () (_ BitVec 32))

(declare-fun mapRest!3425 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapValue!3425 () ValueCell!927)

(assert (=> mapNonEmpty!3426 (= (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (store mapRest!3425 mapKey!3426 mapValue!3425))))

(declare-fun b!87748 () Bool)

(declare-fun e!57167 () Bool)

(declare-fun e!57173 () Bool)

(assert (=> b!87748 (= e!57167 e!57173)))

(declare-fun res!44997 () Bool)

(assert (=> b!87748 (=> (not res!44997) (not e!57173))))

(declare-datatypes ((tuple2!2202 0))(
  ( (tuple2!2203 (_1!1112 Bool) (_2!1112 LongMapFixedSize!762)) )
))
(declare-fun lt!41737 () tuple2!2202)

(assert (=> b!87748 (= res!44997 (and (_1!1112 lt!41737) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!41741 () Unit!2600)

(assert (=> b!87748 (= lt!41741 e!57175)))

(declare-datatypes ((tuple2!2204 0))(
  ( (tuple2!2205 (_1!1113 (_ BitVec 64)) (_2!1113 V!3035)) )
))
(declare-datatypes ((List!1522 0))(
  ( (Nil!1519) (Cons!1518 (h!2110 tuple2!2204) (t!5264 List!1522)) )
))
(declare-datatypes ((ListLongMap!1465 0))(
  ( (ListLongMap!1466 (toList!748 List!1522)) )
))
(declare-fun lt!41740 () ListLongMap!1465)

(declare-fun c!14467 () Bool)

(declare-fun contains!756 (ListLongMap!1465 (_ BitVec 64)) Bool)

(assert (=> b!87748 (= c!14467 (contains!756 lt!41740 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun lt!41734 () V!3035)

(declare-fun update!113 (LongMapFixedSize!762 (_ BitVec 64) V!3035) tuple2!2202)

(assert (=> b!87748 (= lt!41737 (update!113 newMap!16 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))

(declare-fun mapIsEmpty!3426 () Bool)

(assert (=> mapIsEmpty!3426 mapRes!3425))

(declare-fun b!87749 () Bool)

(assert (=> b!87749 (= e!57173 (not e!57174))))

(declare-fun res!44998 () Bool)

(assert (=> b!87749 (=> res!44998 e!57174)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!87749 (= res!44998 (not (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun lt!41747 () ListLongMap!1465)

(declare-fun lt!41744 () tuple2!2204)

(declare-fun lt!41746 () ListLongMap!1465)

(declare-fun lt!41735 () tuple2!2204)

(declare-fun +!112 (ListLongMap!1465 tuple2!2204) ListLongMap!1465)

(assert (=> b!87749 (= (+!112 lt!41746 lt!41735) (+!112 (+!112 lt!41747 lt!41735) lt!41744))))

(assert (=> b!87749 (= lt!41735 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41730 () Unit!2600)

(declare-fun addCommutativeForDiffKeys!31 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64) V!3035) Unit!2600)

(assert (=> b!87749 (= lt!41730 (addCommutativeForDiffKeys!31 lt!41747 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41743 () ListLongMap!1465)

(assert (=> b!87749 (= lt!41743 lt!41746)))

(assert (=> b!87749 (= lt!41746 (+!112 lt!41747 lt!41744))))

(declare-fun lt!41742 () ListLongMap!1465)

(declare-fun lt!41733 () tuple2!2204)

(assert (=> b!87749 (= lt!41743 (+!112 lt!41742 lt!41733))))

(declare-fun lt!41738 () ListLongMap!1465)

(assert (=> b!87749 (= lt!41747 (+!112 lt!41738 lt!41733))))

(assert (=> b!87749 (= lt!41733 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(assert (=> b!87749 (= lt!41742 (+!112 lt!41738 lt!41744))))

(assert (=> b!87749 (= lt!41744 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))

(declare-fun lt!41732 () Unit!2600)

(assert (=> b!87749 (= lt!41732 (addCommutativeForDiffKeys!31 lt!41738 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!77 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) Int) ListLongMap!1465)

(assert (=> b!87749 (= lt!41738 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!87750 () Bool)

(assert (=> b!87750 (= e!57184 tp_is_empty!2541)))

(declare-fun array_inv!1191 (array!4043) Bool)

(declare-fun array_inv!1192 (array!4045) Bool)

(assert (=> b!87751 (= e!57171 (and tp!8982 tp_is_empty!2541 (array_inv!1191 (_keys!4035 newMap!16)) (array_inv!1192 (_values!2342 newMap!16)) e!57179))))

(declare-fun b!87752 () Bool)

(declare-fun e!57170 () Bool)

(declare-fun e!57180 () Bool)

(assert (=> b!87752 (= e!57170 e!57180)))

(declare-fun b!87753 () Bool)

(assert (=> b!87753 (= e!57172 e!57170)))

(declare-fun b!87754 () Bool)

(declare-fun e!57169 () Bool)

(assert (=> b!87754 (= e!57169 e!57167)))

(declare-fun res!44995 () Bool)

(assert (=> b!87754 (=> (not res!44995) (not e!57167))))

(assert (=> b!87754 (= res!44995 (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1201 (ValueCell!927 V!3035) V!3035)

(declare-fun dynLambda!342 (Int (_ BitVec 64)) V!3035)

(assert (=> b!87754 (= lt!41734 (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!87755 (= e!57180 (and tp!8980 tp_is_empty!2541 (array_inv!1191 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (array_inv!1192 (_values!2342 (v!2661 (underlying!292 thiss!992)))) e!57178))))

(declare-fun b!87756 () Bool)

(declare-fun Unit!2603 () Unit!2600)

(assert (=> b!87756 (= e!57175 Unit!2603)))

(declare-fun lt!41745 () Unit!2600)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!68 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) (_ BitVec 32) Int) Unit!2600)

(assert (=> b!87756 (= lt!41745 (lemmaListMapContainsThenArrayContainsFrom!68 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!87756 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!41736 () Unit!2600)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4043 (_ BitVec 32) (_ BitVec 32)) Unit!2600)

(assert (=> b!87756 (= lt!41736 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1523 0))(
  ( (Nil!1520) (Cons!1519 (h!2111 (_ BitVec 64)) (t!5265 List!1523)) )
))
(declare-fun arrayNoDuplicates!0 (array!4043 (_ BitVec 32) List!1523) Bool)

(assert (=> b!87756 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) from!355 Nil!1520)))

(declare-fun lt!41731 () Unit!2600)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4043 (_ BitVec 32) (_ BitVec 64) List!1523) Unit!2600)

(assert (=> b!87756 (= lt!41731 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520)))))

(assert (=> b!87756 false))

(declare-fun b!87757 () Bool)

(assert (=> b!87757 (= e!57183 tp_is_empty!2541)))

(declare-fun b!87758 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4043 (_ BitVec 32)) Bool)

(assert (=> b!87758 (= e!57174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!87759 () Bool)

(assert (=> b!87759 (= e!57182 e!57169)))

(declare-fun res!44999 () Bool)

(assert (=> b!87759 (=> (not res!44999) (not e!57169))))

(declare-fun lt!41739 () ListLongMap!1465)

(assert (=> b!87759 (= res!44999 (= lt!41739 lt!41740))))

(declare-fun map!1192 (LongMapFixedSize!762) ListLongMap!1465)

(assert (=> b!87759 (= lt!41740 (map!1192 newMap!16))))

(declare-fun getCurrentListMap!441 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) Int) ListLongMap!1465)

(assert (=> b!87759 (= lt!41739 (getCurrentListMap!441 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(assert (= (and start!10840 res!45000) b!87747))

(assert (= (and b!87747 res!45001) b!87746))

(assert (= (and b!87746 res!44996) b!87741))

(assert (= (and b!87741 res!44994) b!87759))

(assert (= (and b!87759 res!44999) b!87754))

(assert (= (and b!87754 res!44995) b!87748))

(assert (= (and b!87748 c!14467) b!87756))

(assert (= (and b!87748 (not c!14467)) b!87739))

(assert (= (and b!87748 res!44997) b!87749))

(assert (= (and b!87749 (not res!44998)) b!87742))

(assert (= (and b!87742 (not res!45002)) b!87758))

(assert (= (and b!87743 condMapEmpty!3426) mapIsEmpty!3426))

(assert (= (and b!87743 (not condMapEmpty!3426)) mapNonEmpty!3426))

(get-info :version)

(assert (= (and mapNonEmpty!3426 ((_ is ValueCellFull!927) mapValue!3425)) b!87744))

(assert (= (and b!87743 ((_ is ValueCellFull!927) mapDefault!3425)) b!87750))

(assert (= b!87755 b!87743))

(assert (= b!87752 b!87755))

(assert (= b!87753 b!87752))

(assert (= start!10840 b!87753))

(assert (= (and b!87740 condMapEmpty!3425) mapIsEmpty!3425))

(assert (= (and b!87740 (not condMapEmpty!3425)) mapNonEmpty!3425))

(assert (= (and mapNonEmpty!3425 ((_ is ValueCellFull!927) mapValue!3426)) b!87757))

(assert (= (and b!87740 ((_ is ValueCellFull!927) mapDefault!3426)) b!87745))

(assert (= b!87751 b!87740))

(assert (= start!10840 b!87751))

(declare-fun b_lambda!3895 () Bool)

(assert (=> (not b_lambda!3895) (not b!87754)))

(declare-fun t!5261 () Bool)

(declare-fun tb!1709 () Bool)

(assert (=> (and b!87755 (= (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) t!5261) tb!1709))

(declare-fun result!2941 () Bool)

(assert (=> tb!1709 (= result!2941 tp_is_empty!2541)))

(assert (=> b!87754 t!5261))

(declare-fun b_and!5291 () Bool)

(assert (= b_and!5287 (and (=> t!5261 result!2941) b_and!5291)))

(declare-fun t!5263 () Bool)

(declare-fun tb!1711 () Bool)

(assert (=> (and b!87751 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) t!5263) tb!1711))

(declare-fun result!2945 () Bool)

(assert (= result!2945 result!2941))

(assert (=> b!87754 t!5263))

(declare-fun b_and!5293 () Bool)

(assert (= b_and!5289 (and (=> t!5263 result!2945) b_and!5293)))

(declare-fun m!93697 () Bool)

(assert (=> mapNonEmpty!3425 m!93697))

(declare-fun m!93699 () Bool)

(assert (=> b!87754 m!93699))

(declare-fun m!93701 () Bool)

(assert (=> b!87754 m!93701))

(declare-fun m!93703 () Bool)

(assert (=> b!87754 m!93703))

(assert (=> b!87754 m!93701))

(assert (=> b!87754 m!93703))

(declare-fun m!93705 () Bool)

(assert (=> b!87754 m!93705))

(declare-fun m!93707 () Bool)

(assert (=> b!87755 m!93707))

(declare-fun m!93709 () Bool)

(assert (=> b!87755 m!93709))

(declare-fun m!93711 () Bool)

(assert (=> b!87746 m!93711))

(declare-fun m!93713 () Bool)

(assert (=> b!87756 m!93713))

(declare-fun m!93715 () Bool)

(assert (=> b!87756 m!93715))

(assert (=> b!87756 m!93699))

(declare-fun m!93717 () Bool)

(assert (=> b!87756 m!93717))

(assert (=> b!87756 m!93699))

(assert (=> b!87756 m!93699))

(declare-fun m!93719 () Bool)

(assert (=> b!87756 m!93719))

(assert (=> b!87756 m!93699))

(declare-fun m!93721 () Bool)

(assert (=> b!87756 m!93721))

(assert (=> b!87748 m!93699))

(assert (=> b!87748 m!93699))

(declare-fun m!93723 () Bool)

(assert (=> b!87748 m!93723))

(assert (=> b!87748 m!93699))

(declare-fun m!93725 () Bool)

(assert (=> b!87748 m!93725))

(declare-fun m!93727 () Bool)

(assert (=> b!87758 m!93727))

(declare-fun m!93729 () Bool)

(assert (=> b!87749 m!93729))

(assert (=> b!87749 m!93699))

(declare-fun m!93731 () Bool)

(assert (=> b!87749 m!93731))

(assert (=> b!87749 m!93699))

(assert (=> b!87749 m!93699))

(declare-fun m!93733 () Bool)

(assert (=> b!87749 m!93733))

(declare-fun m!93735 () Bool)

(assert (=> b!87749 m!93735))

(declare-fun m!93737 () Bool)

(assert (=> b!87749 m!93737))

(declare-fun m!93739 () Bool)

(assert (=> b!87749 m!93739))

(assert (=> b!87749 m!93737))

(declare-fun m!93741 () Bool)

(assert (=> b!87749 m!93741))

(declare-fun m!93743 () Bool)

(assert (=> b!87749 m!93743))

(declare-fun m!93745 () Bool)

(assert (=> b!87749 m!93745))

(declare-fun m!93747 () Bool)

(assert (=> b!87749 m!93747))

(declare-fun m!93749 () Bool)

(assert (=> b!87749 m!93749))

(declare-fun m!93751 () Bool)

(assert (=> start!10840 m!93751))

(declare-fun m!93753 () Bool)

(assert (=> b!87759 m!93753))

(declare-fun m!93755 () Bool)

(assert (=> b!87759 m!93755))

(declare-fun m!93757 () Bool)

(assert (=> b!87751 m!93757))

(declare-fun m!93759 () Bool)

(assert (=> b!87751 m!93759))

(declare-fun m!93761 () Bool)

(assert (=> mapNonEmpty!3426 m!93761))

(check-sat (not b!87756) (not b_next!2249) (not b!87758) (not b!87759) (not b!87748) (not b!87746) (not mapNonEmpty!3425) (not b_lambda!3895) (not mapNonEmpty!3426) (not b!87755) (not b!87754) (not b!87749) b_and!5293 (not start!10840) (not b!87751) b_and!5291 (not b_next!2251) tp_is_empty!2541)
(check-sat b_and!5291 b_and!5293 (not b_next!2249) (not b_next!2251))
(get-model)

(declare-fun b_lambda!3899 () Bool)

(assert (= b_lambda!3895 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3899)))

(check-sat (not b!87756) (not b_next!2249) (not b!87758) (not b!87759) (not b!87748) (not b!87746) (not mapNonEmpty!3425) (not b_lambda!3899) (not mapNonEmpty!3426) (not b!87755) (not b!87754) (not b!87749) b_and!5293 (not start!10840) (not b!87751) b_and!5291 (not b_next!2251) tp_is_empty!2541)
(check-sat b_and!5291 b_and!5293 (not b_next!2249) (not b_next!2251))
(get-model)

(declare-fun d!23349 () Bool)

(declare-fun e!57244 () Bool)

(assert (=> d!23349 e!57244))

(declare-fun res!45032 () Bool)

(assert (=> d!23349 (=> res!45032 e!57244)))

(declare-fun lt!41813 () Bool)

(assert (=> d!23349 (= res!45032 (not lt!41813))))

(declare-fun lt!41810 () Bool)

(assert (=> d!23349 (= lt!41813 lt!41810)))

(declare-fun lt!41811 () Unit!2600)

(declare-fun e!57243 () Unit!2600)

(assert (=> d!23349 (= lt!41811 e!57243)))

(declare-fun c!14473 () Bool)

(assert (=> d!23349 (= c!14473 lt!41810)))

(declare-fun containsKey!145 (List!1522 (_ BitVec 64)) Bool)

(assert (=> d!23349 (= lt!41810 (containsKey!145 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23349 (= (contains!756 lt!41740 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) lt!41813)))

(declare-fun b!87833 () Bool)

(declare-fun lt!41812 () Unit!2600)

(assert (=> b!87833 (= e!57243 lt!41812)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!93 (List!1522 (_ BitVec 64)) Unit!2600)

(assert (=> b!87833 (= lt!41812 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-datatypes ((Option!147 0))(
  ( (Some!146 (v!2665 V!3035)) (None!145) )
))
(declare-fun isDefined!94 (Option!147) Bool)

(declare-fun getValueByKey!141 (List!1522 (_ BitVec 64)) Option!147)

(assert (=> b!87833 (isDefined!94 (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!87834 () Bool)

(declare-fun Unit!2604 () Unit!2600)

(assert (=> b!87834 (= e!57243 Unit!2604)))

(declare-fun b!87835 () Bool)

(assert (=> b!87835 (= e!57244 (isDefined!94 (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (= (and d!23349 c!14473) b!87833))

(assert (= (and d!23349 (not c!14473)) b!87834))

(assert (= (and d!23349 (not res!45032)) b!87835))

(assert (=> d!23349 m!93699))

(declare-fun m!93829 () Bool)

(assert (=> d!23349 m!93829))

(assert (=> b!87833 m!93699))

(declare-fun m!93831 () Bool)

(assert (=> b!87833 m!93831))

(assert (=> b!87833 m!93699))

(declare-fun m!93833 () Bool)

(assert (=> b!87833 m!93833))

(assert (=> b!87833 m!93833))

(declare-fun m!93835 () Bool)

(assert (=> b!87833 m!93835))

(assert (=> b!87835 m!93699))

(assert (=> b!87835 m!93833))

(assert (=> b!87835 m!93833))

(assert (=> b!87835 m!93835))

(assert (=> b!87748 d!23349))

(declare-fun b!87920 () Bool)

(declare-fun e!57291 () Bool)

(declare-fun e!57298 () Bool)

(assert (=> b!87920 (= e!57291 e!57298)))

(declare-fun res!45071 () Bool)

(declare-fun call!8423 () Bool)

(assert (=> b!87920 (= res!45071 call!8423)))

(assert (=> b!87920 (=> (not res!45071) (not e!57298))))

(declare-fun b!87921 () Bool)

(declare-fun res!45073 () Bool)

(declare-fun call!8446 () Bool)

(assert (=> b!87921 (= res!45073 call!8446)))

(declare-fun e!57302 () Bool)

(assert (=> b!87921 (=> (not res!45073) (not e!57302))))

(declare-fun bm!8420 () Bool)

(declare-fun call!8442 () ListLongMap!1465)

(assert (=> bm!8420 (= call!8442 (map!1192 newMap!16))))

(declare-fun bm!8421 () Bool)

(declare-fun call!8445 () Bool)

(declare-fun call!8430 () Bool)

(assert (=> bm!8421 (= call!8445 call!8430)))

(declare-fun b!87922 () Bool)

(declare-datatypes ((SeekEntryResult!244 0))(
  ( (MissingZero!244 (index!3114 (_ BitVec 32))) (Found!244 (index!3115 (_ BitVec 32))) (Intermediate!244 (undefined!1056 Bool) (index!3116 (_ BitVec 32)) (x!12141 (_ BitVec 32))) (Undefined!244) (MissingVacant!244 (index!3117 (_ BitVec 32))) )
))
(declare-fun lt!41892 () SeekEntryResult!244)

(assert (=> b!87922 (= e!57291 ((_ is Undefined!244) lt!41892))))

(declare-fun c!14503 () Bool)

(declare-fun e!57305 () ListLongMap!1465)

(declare-fun bm!8422 () Bool)

(declare-fun c!14502 () Bool)

(declare-fun call!8429 () ListLongMap!1465)

(assert (=> bm!8422 (= call!8429 (+!112 e!57305 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun c!14505 () Bool)

(assert (=> bm!8422 (= c!14505 c!14502)))

(declare-fun b!87923 () Bool)

(declare-fun res!45061 () Bool)

(declare-fun e!57289 () Bool)

(assert (=> b!87923 (=> (not res!45061) (not e!57289))))

(declare-fun call!8424 () Bool)

(assert (=> b!87923 (= res!45061 call!8424)))

(declare-fun e!57309 () Bool)

(assert (=> b!87923 (= e!57309 e!57289)))

(declare-fun bm!8423 () Bool)

(declare-fun call!8433 () Bool)

(assert (=> bm!8423 (= call!8433 call!8430)))

(declare-fun bm!8424 () Bool)

(assert (=> bm!8424 (= call!8423 call!8446)))

(declare-fun b!87924 () Bool)

(declare-fun res!45066 () Bool)

(declare-fun lt!41891 () SeekEntryResult!244)

(assert (=> b!87924 (= res!45066 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3117 lt!41891)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57310 () Bool)

(assert (=> b!87924 (=> (not res!45066) (not e!57310))))

(declare-fun call!8434 () SeekEntryResult!244)

(declare-fun bm!8425 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4043 (_ BitVec 32)) SeekEntryResult!244)

(assert (=> bm!8425 (= call!8434 (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun c!14514 () Bool)

(declare-fun lt!41868 () SeekEntryResult!244)

(declare-fun c!14511 () Bool)

(declare-fun lt!41880 () SeekEntryResult!244)

(declare-fun call!8432 () Bool)

(declare-fun bm!8426 () Bool)

(declare-fun c!14509 () Bool)

(declare-fun c!14508 () Bool)

(declare-fun c!14513 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8426 (= call!8432 (inRange!0 (ite c!14511 (ite c!14513 (index!3115 lt!41880) (ite c!14514 (index!3114 lt!41892) (index!3117 lt!41892))) (ite c!14508 (index!3115 lt!41868) (ite c!14509 (index!3114 lt!41891) (index!3117 lt!41891)))) (mask!6397 newMap!16)))))

(declare-fun b!87925 () Bool)

(assert (=> b!87925 (= e!57305 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun b!87926 () Bool)

(declare-fun lt!41879 () tuple2!2202)

(declare-fun call!8439 () tuple2!2202)

(assert (=> b!87926 (= lt!41879 call!8439)))

(declare-fun e!57295 () tuple2!2202)

(assert (=> b!87926 (= e!57295 (tuple2!2203 (_1!1112 lt!41879) (_2!1112 lt!41879)))))

(declare-fun bm!8427 () Bool)

(declare-fun call!8441 () SeekEntryResult!244)

(assert (=> bm!8427 (= call!8441 call!8434)))

(declare-fun bm!8428 () Bool)

(assert (=> bm!8428 (= call!8430 (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!87927 () Bool)

(declare-fun e!57300 () Unit!2600)

(declare-fun Unit!2605 () Unit!2600)

(assert (=> b!87927 (= e!57300 Unit!2605)))

(declare-fun lt!41882 () Unit!2600)

(declare-fun call!8425 () Unit!2600)

(assert (=> b!87927 (= lt!41882 call!8425)))

(declare-fun call!8435 () SeekEntryResult!244)

(assert (=> b!87927 (= lt!41880 call!8435)))

(declare-fun res!45068 () Bool)

(assert (=> b!87927 (= res!45068 ((_ is Found!244) lt!41880))))

(assert (=> b!87927 (=> (not res!45068) (not e!57302))))

(assert (=> b!87927 e!57302))

(declare-fun lt!41881 () Unit!2600)

(assert (=> b!87927 (= lt!41881 lt!41882)))

(assert (=> b!87927 false))

(declare-fun b!87928 () Bool)

(declare-fun res!45067 () Bool)

(assert (=> b!87928 (= res!45067 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3117 lt!41892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87928 (=> (not res!45067) (not e!57298))))

(declare-fun b!87929 () Bool)

(declare-fun e!57293 () tuple2!2202)

(assert (=> b!87929 (= e!57293 e!57295)))

(declare-fun c!14510 () Bool)

(declare-fun lt!41874 () SeekEntryResult!244)

(assert (=> b!87929 (= c!14510 ((_ is MissingZero!244) lt!41874))))

(declare-fun b!87930 () Bool)

(declare-fun e!57296 () tuple2!2202)

(declare-fun e!57303 () tuple2!2202)

(assert (=> b!87930 (= e!57296 e!57303)))

(assert (=> b!87930 (= c!14503 (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8429 () Bool)

(declare-fun call!8440 () ListLongMap!1465)

(declare-fun lt!41889 () (_ BitVec 32))

(declare-fun lt!41886 () array!4045)

(assert (=> bm!8429 (= call!8440 (getCurrentListMap!441 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun b!87931 () Bool)

(declare-fun c!14504 () Bool)

(assert (=> b!87931 (= c!14504 ((_ is MissingVacant!244) lt!41891))))

(declare-fun e!57299 () Bool)

(assert (=> b!87931 (= e!57309 e!57299)))

(declare-fun b!87932 () Bool)

(declare-fun lt!41875 () Unit!2600)

(declare-fun lt!41885 () Unit!2600)

(assert (=> b!87932 (= lt!41875 lt!41885)))

(declare-fun call!8437 () ListLongMap!1465)

(declare-fun call!8444 () ListLongMap!1465)

(assert (=> b!87932 (= call!8437 call!8444)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 V!3035 Int) Unit!2600)

(assert (=> b!87932 (= lt!41885 (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41889 (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) lt!41734 (defaultEntry!2359 newMap!16)))))

(assert (=> b!87932 (= lt!41889 (bvor (extraKeys!2194 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!87932 (= e!57303 (tuple2!2203 true (LongMapFixedSize!763 (defaultEntry!2359 newMap!16) (mask!6397 newMap!16) (bvor (extraKeys!2194 newMap!16) #b00000000000000000000000000000010) (zeroValue!2249 newMap!16) lt!41734 (_size!430 newMap!16) (_keys!4035 newMap!16) (_values!2342 newMap!16) (_vacant!430 newMap!16))))))

(declare-fun bm!8430 () Bool)

(declare-fun call!8426 () Unit!2600)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) Int) Unit!2600)

(assert (=> bm!8430 (= call!8426 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(declare-fun b!87933 () Bool)

(assert (=> b!87933 (= e!57299 e!57310)))

(declare-fun res!45062 () Bool)

(assert (=> b!87933 (= res!45062 call!8424)))

(assert (=> b!87933 (=> (not res!45062) (not e!57310))))

(declare-fun b!87934 () Bool)

(declare-fun c!14506 () Bool)

(assert (=> b!87934 (= c!14506 ((_ is MissingVacant!244) lt!41874))))

(declare-fun e!57304 () tuple2!2202)

(assert (=> b!87934 (= e!57304 e!57293)))

(declare-fun b!87935 () Bool)

(assert (=> b!87935 (= e!57302 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41880)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!87936 () Bool)

(declare-fun e!57297 () ListLongMap!1465)

(assert (=> b!87936 (= e!57297 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun b!87937 () Bool)

(assert (=> b!87937 (= e!57299 ((_ is Undefined!244) lt!41891))))

(declare-fun d!23351 () Bool)

(declare-fun e!57290 () Bool)

(assert (=> d!23351 e!57290))

(declare-fun res!45069 () Bool)

(assert (=> d!23351 (=> (not res!45069) (not e!57290))))

(declare-fun lt!41888 () tuple2!2202)

(assert (=> d!23351 (= res!45069 (valid!327 (_2!1112 lt!41888)))))

(assert (=> d!23351 (= lt!41888 e!57296)))

(assert (=> d!23351 (= c!14502 (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvneg (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (=> d!23351 (valid!327 newMap!16)))

(assert (=> d!23351 (= (update!113 newMap!16 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734) lt!41888)))

(declare-fun b!87938 () Bool)

(declare-fun e!57301 () Unit!2600)

(declare-fun lt!41887 () Unit!2600)

(assert (=> b!87938 (= e!57301 lt!41887)))

(assert (=> b!87938 (= lt!41887 call!8425)))

(assert (=> b!87938 (= lt!41868 call!8441)))

(declare-fun res!45070 () Bool)

(assert (=> b!87938 (= res!45070 ((_ is Found!244) lt!41868))))

(declare-fun e!57308 () Bool)

(assert (=> b!87938 (=> (not res!45070) (not e!57308))))

(assert (=> b!87938 e!57308))

(declare-fun bm!8431 () Bool)

(declare-fun call!8427 () ListLongMap!1465)

(assert (=> bm!8431 (= call!8427 (map!1192 (_2!1112 lt!41888)))))

(declare-fun b!87939 () Bool)

(assert (=> b!87939 (= e!57298 (not call!8433))))

(declare-fun bm!8432 () Bool)

(assert (=> bm!8432 (= call!8435 call!8434)))

(declare-fun b!87940 () Bool)

(declare-fun res!45065 () Bool)

(assert (=> b!87940 (=> (not res!45065) (not e!57289))))

(assert (=> b!87940 (= res!45065 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3114 lt!41891)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8433 () Bool)

(assert (=> bm!8433 (= call!8446 call!8432)))

(declare-fun bm!8434 () Bool)

(declare-fun call!8438 () Bool)

(assert (=> bm!8434 (= call!8424 call!8438)))

(declare-fun b!87941 () Bool)

(declare-fun Unit!2606 () Unit!2600)

(assert (=> b!87941 (= e!57301 Unit!2606)))

(declare-fun lt!41873 () Unit!2600)

(assert (=> b!87941 (= lt!41873 call!8426)))

(assert (=> b!87941 (= lt!41891 call!8441)))

(assert (=> b!87941 (= c!14509 ((_ is MissingZero!244) lt!41891))))

(assert (=> b!87941 e!57309))

(declare-fun lt!41884 () Unit!2600)

(assert (=> b!87941 (= lt!41884 lt!41873)))

(assert (=> b!87941 false))

(declare-fun b!87942 () Bool)

(declare-fun lt!41893 () tuple2!2202)

(assert (=> b!87942 (= e!57293 (tuple2!2203 (_1!1112 lt!41893) (_2!1112 lt!41893)))))

(assert (=> b!87942 (= lt!41893 call!8439)))

(declare-fun b!87943 () Bool)

(declare-fun res!45074 () Bool)

(assert (=> b!87943 (= res!45074 call!8438)))

(assert (=> b!87943 (=> (not res!45074) (not e!57308))))

(declare-fun bm!8435 () Bool)

(declare-fun call!8428 () ListLongMap!1465)

(declare-fun call!8431 () ListLongMap!1465)

(assert (=> bm!8435 (= call!8428 call!8431)))

(declare-fun b!87944 () Bool)

(declare-fun call!8443 () ListLongMap!1465)

(assert (=> b!87944 (= e!57305 (ite c!14503 call!8444 call!8443))))

(declare-fun bm!8436 () Bool)

(assert (=> bm!8436 (= call!8443 call!8431)))

(declare-fun b!87945 () Bool)

(assert (=> b!87945 (= e!57310 (not call!8445))))

(declare-fun b!87946 () Bool)

(declare-fun lt!41870 () Unit!2600)

(assert (=> b!87946 (= e!57300 lt!41870)))

(assert (=> b!87946 (= lt!41870 call!8426)))

(assert (=> b!87946 (= lt!41892 call!8435)))

(assert (=> b!87946 (= c!14514 ((_ is MissingZero!244) lt!41892))))

(declare-fun e!57294 () Bool)

(assert (=> b!87946 e!57294))

(declare-fun bm!8437 () Bool)

(assert (=> bm!8437 (= call!8438 call!8432)))

(declare-fun b!87947 () Bool)

(declare-fun e!57292 () Bool)

(declare-fun e!57307 () Bool)

(assert (=> b!87947 (= e!57292 e!57307)))

(declare-fun res!45072 () Bool)

(assert (=> b!87947 (= res!45072 (contains!756 call!8427 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> b!87947 (=> (not res!45072) (not e!57307))))

(declare-fun b!87948 () Bool)

(assert (=> b!87948 (= e!57307 (= call!8427 (+!112 call!8442 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun b!87949 () Bool)

(assert (=> b!87949 (= e!57296 e!57304)))

(assert (=> b!87949 (= lt!41874 (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(assert (=> b!87949 (= c!14511 ((_ is Undefined!244) lt!41874))))

(declare-fun bm!8438 () Bool)

(assert (=> bm!8438 (= call!8437 call!8429)))

(declare-fun bm!8439 () Bool)

(assert (=> bm!8439 (= call!8444 call!8440)))

(declare-fun b!87950 () Bool)

(assert (=> b!87950 (= e!57289 (not call!8445))))

(declare-fun bm!8440 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) Int) Unit!2600)

(assert (=> bm!8440 (= call!8425 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(declare-fun b!87951 () Bool)

(declare-fun res!45063 () Bool)

(declare-fun e!57306 () Bool)

(assert (=> b!87951 (=> (not res!45063) (not e!57306))))

(assert (=> b!87951 (= res!45063 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3114 lt!41892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87952 () Bool)

(assert (=> b!87952 (= e!57306 (not call!8433))))

(declare-fun b!87953 () Bool)

(declare-fun c!14512 () Bool)

(assert (=> b!87953 (= c!14512 ((_ is MissingVacant!244) lt!41892))))

(assert (=> b!87953 (= e!57294 e!57291)))

(declare-fun b!87954 () Bool)

(declare-fun lt!41877 () Unit!2600)

(assert (=> b!87954 (= lt!41877 e!57300)))

(declare-fun call!8436 () Bool)

(assert (=> b!87954 (= c!14513 call!8436)))

(assert (=> b!87954 (= e!57304 (tuple2!2203 false newMap!16))))

(declare-fun b!87955 () Bool)

(assert (=> b!87955 (= e!57308 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41868)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!87956 () Bool)

(assert (=> b!87956 (= e!57290 e!57292)))

(declare-fun c!14515 () Bool)

(assert (=> b!87956 (= c!14515 (_1!1112 lt!41888))))

(declare-fun b!87957 () Bool)

(declare-fun lt!41869 () Unit!2600)

(declare-fun lt!41871 () Unit!2600)

(assert (=> b!87957 (= lt!41869 lt!41871)))

(assert (=> b!87957 (= call!8437 call!8443)))

(declare-fun lt!41890 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!32 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 V!3035 Int) Unit!2600)

(assert (=> b!87957 (= lt!41871 (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41890 (zeroValue!2249 newMap!16) lt!41734 (minValue!2249 newMap!16) (defaultEntry!2359 newMap!16)))))

(assert (=> b!87957 (= lt!41890 (bvor (extraKeys!2194 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!87957 (= e!57303 (tuple2!2203 true (LongMapFixedSize!763 (defaultEntry!2359 newMap!16) (mask!6397 newMap!16) (bvor (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) lt!41734 (minValue!2249 newMap!16) (_size!430 newMap!16) (_keys!4035 newMap!16) (_values!2342 newMap!16) (_vacant!430 newMap!16))))))

(declare-fun bm!8441 () Bool)

(declare-fun c!14507 () Bool)

(assert (=> bm!8441 (= c!14507 c!14511)))

(assert (=> bm!8441 (= call!8436 (contains!756 e!57297 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun bm!8442 () Bool)

(declare-fun updateHelperNewKey!32 (LongMapFixedSize!762 (_ BitVec 64) V!3035 (_ BitVec 32)) tuple2!2202)

(assert (=> bm!8442 (= call!8439 (updateHelperNewKey!32 newMap!16 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874))))))

(declare-fun b!87958 () Bool)

(assert (=> b!87958 (= e!57297 call!8428)))

(declare-fun b!87959 () Bool)

(assert (=> b!87959 (= e!57292 (= call!8427 call!8442))))

(declare-fun b!87960 () Bool)

(declare-fun lt!41872 () Unit!2600)

(declare-fun lt!41894 () Unit!2600)

(assert (=> b!87960 (= lt!41872 lt!41894)))

(assert (=> b!87960 (contains!756 call!8440 (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!93 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) Int) Unit!2600)

(assert (=> b!87960 (= lt!41894 (lemmaValidKeyInArrayIsInListMap!93 (_keys!4035 newMap!16) lt!41886 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (defaultEntry!2359 newMap!16)))))

(assert (=> b!87960 (= lt!41886 (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))))))

(declare-fun lt!41876 () Unit!2600)

(declare-fun lt!41878 () Unit!2600)

(assert (=> b!87960 (= lt!41876 lt!41878)))

(assert (=> b!87960 (= call!8429 call!8428)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) (_ BitVec 64) V!3035 Int) Unit!2600)

(assert (=> b!87960 (= lt!41878 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!41883 () Unit!2600)

(assert (=> b!87960 (= lt!41883 e!57301)))

(assert (=> b!87960 (= c!14508 call!8436)))

(assert (=> b!87960 (= e!57295 (tuple2!2203 true (LongMapFixedSize!763 (defaultEntry!2359 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (_size!430 newMap!16) (_keys!4035 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))) (_vacant!430 newMap!16))))))

(declare-fun b!87961 () Bool)

(declare-fun res!45064 () Bool)

(assert (=> b!87961 (=> (not res!45064) (not e!57306))))

(assert (=> b!87961 (= res!45064 call!8423)))

(assert (=> b!87961 (= e!57294 e!57306)))

(declare-fun bm!8443 () Bool)

(assert (=> bm!8443 (= call!8431 (getCurrentListMap!441 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(assert (= (and d!23351 c!14502) b!87930))

(assert (= (and d!23351 (not c!14502)) b!87949))

(assert (= (and b!87930 c!14503) b!87957))

(assert (= (and b!87930 (not c!14503)) b!87932))

(assert (= (or b!87957 b!87932) bm!8436))

(assert (= (or b!87957 b!87932) bm!8439))

(assert (= (or b!87957 b!87932) bm!8438))

(assert (= (and b!87949 c!14511) b!87954))

(assert (= (and b!87949 (not c!14511)) b!87934))

(assert (= (and b!87954 c!14513) b!87927))

(assert (= (and b!87954 (not c!14513)) b!87946))

(assert (= (and b!87927 res!45068) b!87921))

(assert (= (and b!87921 res!45073) b!87935))

(assert (= (and b!87946 c!14514) b!87961))

(assert (= (and b!87946 (not c!14514)) b!87953))

(assert (= (and b!87961 res!45064) b!87951))

(assert (= (and b!87951 res!45063) b!87952))

(assert (= (and b!87953 c!14512) b!87920))

(assert (= (and b!87953 (not c!14512)) b!87922))

(assert (= (and b!87920 res!45071) b!87928))

(assert (= (and b!87928 res!45067) b!87939))

(assert (= (or b!87961 b!87920) bm!8424))

(assert (= (or b!87952 b!87939) bm!8423))

(assert (= (or b!87921 bm!8424) bm!8433))

(assert (= (or b!87927 b!87946) bm!8432))

(assert (= (and b!87934 c!14506) b!87942))

(assert (= (and b!87934 (not c!14506)) b!87929))

(assert (= (and b!87929 c!14510) b!87926))

(assert (= (and b!87929 (not c!14510)) b!87960))

(assert (= (and b!87960 c!14508) b!87938))

(assert (= (and b!87960 (not c!14508)) b!87941))

(assert (= (and b!87938 res!45070) b!87943))

(assert (= (and b!87943 res!45074) b!87955))

(assert (= (and b!87941 c!14509) b!87923))

(assert (= (and b!87941 (not c!14509)) b!87931))

(assert (= (and b!87923 res!45061) b!87940))

(assert (= (and b!87940 res!45065) b!87950))

(assert (= (and b!87931 c!14504) b!87933))

(assert (= (and b!87931 (not c!14504)) b!87937))

(assert (= (and b!87933 res!45062) b!87924))

(assert (= (and b!87924 res!45066) b!87945))

(assert (= (or b!87923 b!87933) bm!8434))

(assert (= (or b!87950 b!87945) bm!8421))

(assert (= (or b!87943 bm!8434) bm!8437))

(assert (= (or b!87938 b!87941) bm!8427))

(assert (= (or b!87942 b!87926) bm!8442))

(assert (= (or bm!8433 bm!8437) bm!8426))

(assert (= (or b!87946 b!87941) bm!8430))

(assert (= (or bm!8423 bm!8421) bm!8428))

(assert (= (or b!87927 b!87938) bm!8440))

(assert (= (or b!87954 b!87960) bm!8435))

(assert (= (or bm!8432 bm!8427) bm!8425))

(assert (= (or b!87954 b!87960) bm!8441))

(assert (= (and bm!8441 c!14507) b!87958))

(assert (= (and bm!8441 (not c!14507)) b!87936))

(assert (= (or bm!8436 bm!8435) bm!8443))

(assert (= (or bm!8439 b!87960) bm!8429))

(assert (= (or bm!8438 b!87960) bm!8422))

(assert (= (and bm!8422 c!14505) b!87944))

(assert (= (and bm!8422 (not c!14505)) b!87925))

(assert (= (and d!23351 res!45069) b!87956))

(assert (= (and b!87956 c!14515) b!87947))

(assert (= (and b!87956 (not c!14515)) b!87959))

(assert (= (and b!87947 res!45072) b!87948))

(assert (= (or b!87947 b!87948 b!87959) bm!8431))

(assert (= (or b!87948 b!87959) bm!8420))

(declare-fun m!93837 () Bool)

(assert (=> b!87960 m!93837))

(assert (=> b!87960 m!93699))

(declare-fun m!93839 () Bool)

(assert (=> b!87960 m!93839))

(declare-fun m!93841 () Bool)

(assert (=> b!87960 m!93841))

(declare-fun m!93843 () Bool)

(assert (=> b!87960 m!93843))

(assert (=> b!87960 m!93841))

(declare-fun m!93845 () Bool)

(assert (=> b!87960 m!93845))

(declare-fun m!93847 () Bool)

(assert (=> b!87951 m!93847))

(declare-fun m!93849 () Bool)

(assert (=> d!23351 m!93849))

(assert (=> d!23351 m!93711))

(assert (=> bm!8425 m!93699))

(declare-fun m!93851 () Bool)

(assert (=> bm!8425 m!93851))

(declare-fun m!93853 () Bool)

(assert (=> b!87955 m!93853))

(assert (=> bm!8430 m!93699))

(declare-fun m!93855 () Bool)

(assert (=> bm!8430 m!93855))

(assert (=> bm!8428 m!93699))

(declare-fun m!93857 () Bool)

(assert (=> bm!8428 m!93857))

(declare-fun m!93859 () Bool)

(assert (=> bm!8429 m!93859))

(assert (=> bm!8443 m!93837))

(declare-fun m!93861 () Bool)

(assert (=> bm!8443 m!93861))

(declare-fun m!93863 () Bool)

(assert (=> b!87924 m!93863))

(declare-fun m!93865 () Bool)

(assert (=> b!87936 m!93865))

(declare-fun m!93867 () Bool)

(assert (=> bm!8431 m!93867))

(assert (=> bm!8442 m!93699))

(declare-fun m!93869 () Bool)

(assert (=> bm!8442 m!93869))

(declare-fun m!93871 () Bool)

(assert (=> b!87957 m!93871))

(assert (=> bm!8440 m!93699))

(declare-fun m!93873 () Bool)

(assert (=> bm!8440 m!93873))

(declare-fun m!93875 () Bool)

(assert (=> b!87935 m!93875))

(assert (=> b!87947 m!93699))

(declare-fun m!93877 () Bool)

(assert (=> b!87947 m!93877))

(declare-fun m!93879 () Bool)

(assert (=> b!87940 m!93879))

(assert (=> b!87925 m!93865))

(assert (=> bm!8420 m!93753))

(declare-fun m!93881 () Bool)

(assert (=> b!87932 m!93881))

(declare-fun m!93883 () Bool)

(assert (=> b!87928 m!93883))

(assert (=> bm!8441 m!93699))

(declare-fun m!93885 () Bool)

(assert (=> bm!8441 m!93885))

(assert (=> b!87949 m!93699))

(assert (=> b!87949 m!93851))

(declare-fun m!93887 () Bool)

(assert (=> bm!8426 m!93887))

(declare-fun m!93889 () Bool)

(assert (=> b!87948 m!93889))

(declare-fun m!93891 () Bool)

(assert (=> bm!8422 m!93891))

(assert (=> b!87748 d!23351))

(declare-fun b!87970 () Bool)

(declare-fun e!57317 () Bool)

(declare-fun call!8449 () Bool)

(assert (=> b!87970 (= e!57317 call!8449)))

(declare-fun b!87971 () Bool)

(declare-fun e!57318 () Bool)

(assert (=> b!87971 (= e!57318 e!57317)))

(declare-fun c!14518 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!87971 (= c!14518 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!87972 () Bool)

(declare-fun e!57319 () Bool)

(assert (=> b!87972 (= e!57317 e!57319)))

(declare-fun lt!41901 () (_ BitVec 64))

(assert (=> b!87972 (= lt!41901 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!41903 () Unit!2600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4043 (_ BitVec 64) (_ BitVec 32)) Unit!2600)

(assert (=> b!87972 (= lt!41903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000))))

(assert (=> b!87972 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000)))

(declare-fun lt!41902 () Unit!2600)

(assert (=> b!87972 (= lt!41902 lt!41903)))

(declare-fun res!45079 () Bool)

(assert (=> b!87972 (= res!45079 (= (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))) (Found!244 #b00000000000000000000000000000000)))))

(assert (=> b!87972 (=> (not res!45079) (not e!57319))))

(declare-fun d!23353 () Bool)

(declare-fun res!45080 () Bool)

(assert (=> d!23353 (=> res!45080 e!57318)))

(assert (=> d!23353 (= res!45080 (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))) e!57318)))

(declare-fun bm!8446 () Bool)

(assert (=> bm!8446 (= call!8449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!87973 () Bool)

(assert (=> b!87973 (= e!57319 call!8449)))

(assert (= (and d!23353 (not res!45080)) b!87971))

(assert (= (and b!87971 c!14518) b!87972))

(assert (= (and b!87971 (not c!14518)) b!87970))

(assert (= (and b!87972 res!45079) b!87973))

(assert (= (or b!87973 b!87970) bm!8446))

(declare-fun m!93893 () Bool)

(assert (=> b!87971 m!93893))

(assert (=> b!87971 m!93893))

(declare-fun m!93895 () Bool)

(assert (=> b!87971 m!93895))

(assert (=> b!87972 m!93893))

(declare-fun m!93897 () Bool)

(assert (=> b!87972 m!93897))

(declare-fun m!93899 () Bool)

(assert (=> b!87972 m!93899))

(assert (=> b!87972 m!93893))

(declare-fun m!93901 () Bool)

(assert (=> b!87972 m!93901))

(declare-fun m!93903 () Bool)

(assert (=> bm!8446 m!93903))

(assert (=> b!87758 d!23353))

(declare-fun d!23355 () Bool)

(assert (=> d!23355 (= (valid!326 thiss!992) (valid!327 (v!2661 (underlying!292 thiss!992))))))

(declare-fun bs!3717 () Bool)

(assert (= bs!3717 d!23355))

(declare-fun m!93905 () Bool)

(assert (=> bs!3717 m!93905))

(assert (=> start!10840 d!23355))

(declare-fun d!23357 () Bool)

(assert (=> d!23357 (= (map!1192 newMap!16) (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun bs!3718 () Bool)

(assert (= bs!3718 d!23357))

(assert (=> bs!3718 m!93865))

(assert (=> b!87759 d!23357))

(declare-fun d!23359 () Bool)

(declare-fun e!57358 () Bool)

(assert (=> d!23359 e!57358))

(declare-fun res!45100 () Bool)

(assert (=> d!23359 (=> (not res!45100) (not e!57358))))

(assert (=> d!23359 (= res!45100 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun lt!41956 () ListLongMap!1465)

(declare-fun lt!41963 () ListLongMap!1465)

(assert (=> d!23359 (= lt!41956 lt!41963)))

(declare-fun lt!41957 () Unit!2600)

(declare-fun e!57351 () Unit!2600)

(assert (=> d!23359 (= lt!41957 e!57351)))

(declare-fun c!14533 () Bool)

(declare-fun e!57356 () Bool)

(assert (=> d!23359 (= c!14533 e!57356)))

(declare-fun res!45105 () Bool)

(assert (=> d!23359 (=> (not res!45105) (not e!57356))))

(assert (=> d!23359 (= res!45105 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun e!57354 () ListLongMap!1465)

(assert (=> d!23359 (= lt!41963 e!57354)))

(declare-fun c!14532 () Bool)

(assert (=> d!23359 (= c!14532 (and (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23359 (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23359 (= (getCurrentListMap!441 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) lt!41956)))

(declare-fun b!88016 () Bool)

(declare-fun call!8469 () ListLongMap!1465)

(assert (=> b!88016 (= e!57354 (+!112 call!8469 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88017 () Bool)

(declare-fun e!57352 () Bool)

(declare-fun apply!83 (ListLongMap!1465 (_ BitVec 64)) V!3035)

(assert (=> b!88017 (= e!57352 (= (apply!83 lt!41956 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88018 () Bool)

(declare-fun e!57355 () Bool)

(declare-fun call!8468 () Bool)

(assert (=> b!88018 (= e!57355 (not call!8468))))

(declare-fun e!57348 () Bool)

(declare-fun b!88019 () Bool)

(assert (=> b!88019 (= e!57348 (= (apply!83 lt!41956 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> b!88019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88020 () Bool)

(declare-fun e!57346 () Bool)

(declare-fun call!8466 () Bool)

(assert (=> b!88020 (= e!57346 (not call!8466))))

(declare-fun b!88021 () Bool)

(declare-fun e!57353 () Bool)

(assert (=> b!88021 (= e!57353 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88022 () Bool)

(declare-fun res!45102 () Bool)

(assert (=> b!88022 (=> (not res!45102) (not e!57358))))

(assert (=> b!88022 (= res!45102 e!57346)))

(declare-fun c!14534 () Bool)

(assert (=> b!88022 (= c!14534 (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8461 () Bool)

(declare-fun call!8470 () ListLongMap!1465)

(assert (=> bm!8461 (= call!8470 call!8469)))

(declare-fun b!88023 () Bool)

(declare-fun Unit!2607 () Unit!2600)

(assert (=> b!88023 (= e!57351 Unit!2607)))

(declare-fun b!88024 () Bool)

(declare-fun lt!41961 () Unit!2600)

(assert (=> b!88024 (= e!57351 lt!41961)))

(declare-fun lt!41962 () ListLongMap!1465)

(assert (=> b!88024 (= lt!41962 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41965 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41969 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41969 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41954 () Unit!2600)

(declare-fun addStillContains!59 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> b!88024 (= lt!41954 (addStillContains!59 lt!41962 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41969))))

(assert (=> b!88024 (contains!756 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41969)))

(declare-fun lt!41968 () Unit!2600)

(assert (=> b!88024 (= lt!41968 lt!41954)))

(declare-fun lt!41951 () ListLongMap!1465)

(assert (=> b!88024 (= lt!41951 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41966 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41966 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41967 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41967 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41950 () Unit!2600)

(declare-fun addApplyDifferent!59 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> b!88024 (= lt!41950 (addApplyDifferent!59 lt!41951 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41967))))

(assert (=> b!88024 (= (apply!83 (+!112 lt!41951 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41967) (apply!83 lt!41951 lt!41967))))

(declare-fun lt!41958 () Unit!2600)

(assert (=> b!88024 (= lt!41958 lt!41950)))

(declare-fun lt!41953 () ListLongMap!1465)

(assert (=> b!88024 (= lt!41953 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41948 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41960 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41960 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41955 () Unit!2600)

(assert (=> b!88024 (= lt!41955 (addApplyDifferent!59 lt!41953 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41960))))

(assert (=> b!88024 (= (apply!83 (+!112 lt!41953 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41960) (apply!83 lt!41953 lt!41960))))

(declare-fun lt!41949 () Unit!2600)

(assert (=> b!88024 (= lt!41949 lt!41955)))

(declare-fun lt!41959 () ListLongMap!1465)

(assert (=> b!88024 (= lt!41959 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun lt!41964 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41952 () (_ BitVec 64))

(assert (=> b!88024 (= lt!41952 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!88024 (= lt!41961 (addApplyDifferent!59 lt!41959 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41952))))

(assert (=> b!88024 (= (apply!83 (+!112 lt!41959 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41952) (apply!83 lt!41959 lt!41952))))

(declare-fun b!88025 () Bool)

(declare-fun c!14531 () Bool)

(assert (=> b!88025 (= c!14531 (and (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57357 () ListLongMap!1465)

(declare-fun e!57349 () ListLongMap!1465)

(assert (=> b!88025 (= e!57357 e!57349)))

(declare-fun b!88026 () Bool)

(declare-fun e!57347 () Bool)

(assert (=> b!88026 (= e!57347 e!57348)))

(declare-fun res!45107 () Bool)

(assert (=> b!88026 (=> (not res!45107) (not e!57348))))

(assert (=> b!88026 (= res!45107 (contains!756 lt!41956 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88027 () Bool)

(declare-fun call!8464 () ListLongMap!1465)

(assert (=> b!88027 (= e!57349 call!8464)))

(declare-fun b!88028 () Bool)

(assert (=> b!88028 (= e!57346 e!57352)))

(declare-fun res!45103 () Bool)

(assert (=> b!88028 (= res!45103 call!8466)))

(assert (=> b!88028 (=> (not res!45103) (not e!57352))))

(declare-fun b!88029 () Bool)

(declare-fun e!57350 () Bool)

(assert (=> b!88029 (= e!57350 (= (apply!83 lt!41956 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun bm!8462 () Bool)

(assert (=> bm!8462 (= call!8468 (contains!756 lt!41956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8463 () Bool)

(declare-fun call!8465 () ListLongMap!1465)

(assert (=> bm!8463 (= call!8465 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun bm!8464 () Bool)

(assert (=> bm!8464 (= call!8466 (contains!756 lt!41956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88030 () Bool)

(assert (=> b!88030 (= e!57357 call!8470)))

(declare-fun b!88031 () Bool)

(assert (=> b!88031 (= e!57354 e!57357)))

(declare-fun c!14536 () Bool)

(assert (=> b!88031 (= c!14536 (and (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88032 () Bool)

(declare-fun res!45101 () Bool)

(assert (=> b!88032 (=> (not res!45101) (not e!57358))))

(assert (=> b!88032 (= res!45101 e!57347)))

(declare-fun res!45106 () Bool)

(assert (=> b!88032 (=> res!45106 e!57347)))

(assert (=> b!88032 (= res!45106 (not e!57353))))

(declare-fun res!45099 () Bool)

(assert (=> b!88032 (=> (not res!45099) (not e!57353))))

(assert (=> b!88032 (= res!45099 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88033 () Bool)

(assert (=> b!88033 (= e!57358 e!57355)))

(declare-fun c!14535 () Bool)

(assert (=> b!88033 (= c!14535 (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8465 () Bool)

(declare-fun call!8467 () ListLongMap!1465)

(assert (=> bm!8465 (= call!8469 (+!112 (ite c!14532 call!8465 (ite c!14536 call!8467 call!8464)) (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun b!88034 () Bool)

(assert (=> b!88034 (= e!57349 call!8470)))

(declare-fun bm!8466 () Bool)

(assert (=> bm!8466 (= call!8467 call!8465)))

(declare-fun b!88035 () Bool)

(assert (=> b!88035 (= e!57355 e!57350)))

(declare-fun res!45104 () Bool)

(assert (=> b!88035 (= res!45104 call!8468)))

(assert (=> b!88035 (=> (not res!45104) (not e!57350))))

(declare-fun bm!8467 () Bool)

(assert (=> bm!8467 (= call!8464 call!8467)))

(declare-fun b!88036 () Bool)

(assert (=> b!88036 (= e!57356 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!23359 c!14532) b!88016))

(assert (= (and d!23359 (not c!14532)) b!88031))

(assert (= (and b!88031 c!14536) b!88030))

(assert (= (and b!88031 (not c!14536)) b!88025))

(assert (= (and b!88025 c!14531) b!88034))

(assert (= (and b!88025 (not c!14531)) b!88027))

(assert (= (or b!88034 b!88027) bm!8467))

(assert (= (or b!88030 bm!8467) bm!8466))

(assert (= (or b!88030 b!88034) bm!8461))

(assert (= (or b!88016 bm!8466) bm!8463))

(assert (= (or b!88016 bm!8461) bm!8465))

(assert (= (and d!23359 res!45105) b!88036))

(assert (= (and d!23359 c!14533) b!88024))

(assert (= (and d!23359 (not c!14533)) b!88023))

(assert (= (and d!23359 res!45100) b!88032))

(assert (= (and b!88032 res!45099) b!88021))

(assert (= (and b!88032 (not res!45106)) b!88026))

(assert (= (and b!88026 res!45107) b!88019))

(assert (= (and b!88032 res!45101) b!88022))

(assert (= (and b!88022 c!14534) b!88028))

(assert (= (and b!88022 (not c!14534)) b!88020))

(assert (= (and b!88028 res!45103) b!88017))

(assert (= (or b!88028 b!88020) bm!8464))

(assert (= (and b!88022 res!45102) b!88033))

(assert (= (and b!88033 c!14535) b!88035))

(assert (= (and b!88033 (not c!14535)) b!88018))

(assert (= (and b!88035 res!45104) b!88029))

(assert (= (or b!88035 b!88018) bm!8462))

(declare-fun b_lambda!3901 () Bool)

(assert (=> (not b_lambda!3901) (not b!88019)))

(assert (=> b!88019 t!5261))

(declare-fun b_and!5303 () Bool)

(assert (= b_and!5291 (and (=> t!5261 result!2941) b_and!5303)))

(assert (=> b!88019 t!5263))

(declare-fun b_and!5305 () Bool)

(assert (= b_and!5293 (and (=> t!5263 result!2945) b_and!5305)))

(declare-fun m!93907 () Bool)

(assert (=> bm!8464 m!93907))

(declare-fun m!93909 () Bool)

(assert (=> b!88019 m!93909))

(assert (=> b!88019 m!93703))

(declare-fun m!93911 () Bool)

(assert (=> b!88019 m!93911))

(declare-fun m!93913 () Bool)

(assert (=> b!88019 m!93913))

(declare-fun m!93915 () Bool)

(assert (=> b!88019 m!93915))

(assert (=> b!88019 m!93909))

(assert (=> b!88019 m!93703))

(assert (=> b!88019 m!93913))

(declare-fun m!93917 () Bool)

(assert (=> b!88029 m!93917))

(assert (=> bm!8463 m!93739))

(assert (=> b!88021 m!93913))

(assert (=> b!88021 m!93913))

(declare-fun m!93919 () Bool)

(assert (=> b!88021 m!93919))

(declare-fun m!93921 () Bool)

(assert (=> b!88017 m!93921))

(declare-fun m!93923 () Bool)

(assert (=> b!88016 m!93923))

(assert (=> b!88026 m!93913))

(assert (=> b!88026 m!93913))

(declare-fun m!93925 () Bool)

(assert (=> b!88026 m!93925))

(declare-fun m!93927 () Bool)

(assert (=> b!88024 m!93927))

(declare-fun m!93929 () Bool)

(assert (=> b!88024 m!93929))

(declare-fun m!93931 () Bool)

(assert (=> b!88024 m!93931))

(declare-fun m!93933 () Bool)

(assert (=> b!88024 m!93933))

(declare-fun m!93935 () Bool)

(assert (=> b!88024 m!93935))

(declare-fun m!93937 () Bool)

(assert (=> b!88024 m!93937))

(assert (=> b!88024 m!93931))

(declare-fun m!93939 () Bool)

(assert (=> b!88024 m!93939))

(declare-fun m!93941 () Bool)

(assert (=> b!88024 m!93941))

(assert (=> b!88024 m!93913))

(declare-fun m!93943 () Bool)

(assert (=> b!88024 m!93943))

(declare-fun m!93945 () Bool)

(assert (=> b!88024 m!93945))

(declare-fun m!93947 () Bool)

(assert (=> b!88024 m!93947))

(assert (=> b!88024 m!93739))

(assert (=> b!88024 m!93927))

(assert (=> b!88024 m!93945))

(assert (=> b!88024 m!93937))

(declare-fun m!93949 () Bool)

(assert (=> b!88024 m!93949))

(declare-fun m!93951 () Bool)

(assert (=> b!88024 m!93951))

(declare-fun m!93953 () Bool)

(assert (=> b!88024 m!93953))

(declare-fun m!93955 () Bool)

(assert (=> b!88024 m!93955))

(assert (=> d!23359 m!93745))

(declare-fun m!93957 () Bool)

(assert (=> bm!8465 m!93957))

(declare-fun m!93959 () Bool)

(assert (=> bm!8462 m!93959))

(assert (=> b!88036 m!93913))

(assert (=> b!88036 m!93913))

(assert (=> b!88036 m!93919))

(assert (=> b!87759 d!23359))

(declare-fun d!23361 () Bool)

(declare-fun c!14539 () Bool)

(assert (=> d!23361 (= c!14539 ((_ is ValueCellFull!927) (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun e!57361 () V!3035)

(assert (=> d!23361 (= (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57361)))

(declare-fun b!88041 () Bool)

(declare-fun get!1202 (ValueCell!927 V!3035) V!3035)

(assert (=> b!88041 (= e!57361 (get!1202 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88042 () Bool)

(declare-fun get!1203 (ValueCell!927 V!3035) V!3035)

(assert (=> b!88042 (= e!57361 (get!1203 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23361 c!14539) b!88041))

(assert (= (and d!23361 (not c!14539)) b!88042))

(assert (=> b!88041 m!93701))

(assert (=> b!88041 m!93703))

(declare-fun m!93961 () Bool)

(assert (=> b!88041 m!93961))

(assert (=> b!88042 m!93701))

(assert (=> b!88042 m!93703))

(declare-fun m!93963 () Bool)

(assert (=> b!88042 m!93963))

(assert (=> b!87754 d!23361))

(declare-fun d!23363 () Bool)

(assert (=> d!23363 (= (array_inv!1191 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvsge (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87755 d!23363))

(declare-fun d!23365 () Bool)

(assert (=> d!23365 (= (array_inv!1192 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvsge (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87755 d!23365))

(declare-fun d!23367 () Bool)

(declare-fun e!57364 () Bool)

(assert (=> d!23367 e!57364))

(declare-fun res!45112 () Bool)

(assert (=> d!23367 (=> (not res!45112) (not e!57364))))

(declare-fun lt!41979 () ListLongMap!1465)

(assert (=> d!23367 (= res!45112 (contains!756 lt!41979 (_1!1113 lt!41744)))))

(declare-fun lt!41980 () List!1522)

(assert (=> d!23367 (= lt!41979 (ListLongMap!1466 lt!41980))))

(declare-fun lt!41981 () Unit!2600)

(declare-fun lt!41978 () Unit!2600)

(assert (=> d!23367 (= lt!41981 lt!41978)))

(assert (=> d!23367 (= (getValueByKey!141 lt!41980 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(declare-fun lemmaContainsTupThenGetReturnValue!58 (List!1522 (_ BitVec 64) V!3035) Unit!2600)

(assert (=> d!23367 (= lt!41978 (lemmaContainsTupThenGetReturnValue!58 lt!41980 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun insertStrictlySorted!61 (List!1522 (_ BitVec 64) V!3035) List!1522)

(assert (=> d!23367 (= lt!41980 (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(assert (=> d!23367 (= (+!112 lt!41738 lt!41744) lt!41979)))

(declare-fun b!88047 () Bool)

(declare-fun res!45113 () Bool)

(assert (=> b!88047 (=> (not res!45113) (not e!57364))))

(assert (=> b!88047 (= res!45113 (= (getValueByKey!141 (toList!748 lt!41979) (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744))))))

(declare-fun b!88048 () Bool)

(declare-fun contains!757 (List!1522 tuple2!2204) Bool)

(assert (=> b!88048 (= e!57364 (contains!757 (toList!748 lt!41979) lt!41744))))

(assert (= (and d!23367 res!45112) b!88047))

(assert (= (and b!88047 res!45113) b!88048))

(declare-fun m!93965 () Bool)

(assert (=> d!23367 m!93965))

(declare-fun m!93967 () Bool)

(assert (=> d!23367 m!93967))

(declare-fun m!93969 () Bool)

(assert (=> d!23367 m!93969))

(declare-fun m!93971 () Bool)

(assert (=> d!23367 m!93971))

(declare-fun m!93973 () Bool)

(assert (=> b!88047 m!93973))

(declare-fun m!93975 () Bool)

(assert (=> b!88048 m!93975))

(assert (=> b!87749 d!23367))

(declare-fun d!23369 () Bool)

(declare-fun e!57365 () Bool)

(assert (=> d!23369 e!57365))

(declare-fun res!45114 () Bool)

(assert (=> d!23369 (=> (not res!45114) (not e!57365))))

(declare-fun lt!41983 () ListLongMap!1465)

(assert (=> d!23369 (= res!45114 (contains!756 lt!41983 (_1!1113 lt!41735)))))

(declare-fun lt!41984 () List!1522)

(assert (=> d!23369 (= lt!41983 (ListLongMap!1466 lt!41984))))

(declare-fun lt!41985 () Unit!2600)

(declare-fun lt!41982 () Unit!2600)

(assert (=> d!23369 (= lt!41985 lt!41982)))

(assert (=> d!23369 (= (getValueByKey!141 lt!41984 (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735)))))

(assert (=> d!23369 (= lt!41982 (lemmaContainsTupThenGetReturnValue!58 lt!41984 (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(assert (=> d!23369 (= lt!41984 (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(assert (=> d!23369 (= (+!112 lt!41747 lt!41735) lt!41983)))

(declare-fun b!88049 () Bool)

(declare-fun res!45115 () Bool)

(assert (=> b!88049 (=> (not res!45115) (not e!57365))))

(assert (=> b!88049 (= res!45115 (= (getValueByKey!141 (toList!748 lt!41983) (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735))))))

(declare-fun b!88050 () Bool)

(assert (=> b!88050 (= e!57365 (contains!757 (toList!748 lt!41983) lt!41735))))

(assert (= (and d!23369 res!45114) b!88049))

(assert (= (and b!88049 res!45115) b!88050))

(declare-fun m!93977 () Bool)

(assert (=> d!23369 m!93977))

(declare-fun m!93979 () Bool)

(assert (=> d!23369 m!93979))

(declare-fun m!93981 () Bool)

(assert (=> d!23369 m!93981))

(declare-fun m!93983 () Bool)

(assert (=> d!23369 m!93983))

(declare-fun m!93985 () Bool)

(assert (=> b!88049 m!93985))

(declare-fun m!93987 () Bool)

(assert (=> b!88050 m!93987))

(assert (=> b!87749 d!23369))

(declare-fun d!23371 () Bool)

(declare-fun e!57366 () Bool)

(assert (=> d!23371 e!57366))

(declare-fun res!45116 () Bool)

(assert (=> d!23371 (=> (not res!45116) (not e!57366))))

(declare-fun lt!41987 () ListLongMap!1465)

(assert (=> d!23371 (= res!45116 (contains!756 lt!41987 (_1!1113 lt!41733)))))

(declare-fun lt!41988 () List!1522)

(assert (=> d!23371 (= lt!41987 (ListLongMap!1466 lt!41988))))

(declare-fun lt!41989 () Unit!2600)

(declare-fun lt!41986 () Unit!2600)

(assert (=> d!23371 (= lt!41989 lt!41986)))

(assert (=> d!23371 (= (getValueByKey!141 lt!41988 (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733)))))

(assert (=> d!23371 (= lt!41986 (lemmaContainsTupThenGetReturnValue!58 lt!41988 (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(assert (=> d!23371 (= lt!41988 (insertStrictlySorted!61 (toList!748 lt!41742) (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(assert (=> d!23371 (= (+!112 lt!41742 lt!41733) lt!41987)))

(declare-fun b!88051 () Bool)

(declare-fun res!45117 () Bool)

(assert (=> b!88051 (=> (not res!45117) (not e!57366))))

(assert (=> b!88051 (= res!45117 (= (getValueByKey!141 (toList!748 lt!41987) (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733))))))

(declare-fun b!88052 () Bool)

(assert (=> b!88052 (= e!57366 (contains!757 (toList!748 lt!41987) lt!41733))))

(assert (= (and d!23371 res!45116) b!88051))

(assert (= (and b!88051 res!45117) b!88052))

(declare-fun m!93989 () Bool)

(assert (=> d!23371 m!93989))

(declare-fun m!93991 () Bool)

(assert (=> d!23371 m!93991))

(declare-fun m!93993 () Bool)

(assert (=> d!23371 m!93993))

(declare-fun m!93995 () Bool)

(assert (=> d!23371 m!93995))

(declare-fun m!93997 () Bool)

(assert (=> b!88051 m!93997))

(declare-fun m!93999 () Bool)

(assert (=> b!88052 m!93999))

(assert (=> b!87749 d!23371))

(declare-fun e!57386 () Bool)

(declare-fun lt!42007 () ListLongMap!1465)

(declare-fun b!88077 () Bool)

(assert (=> b!88077 (= e!57386 (= lt!42007 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88078 () Bool)

(declare-fun e!57385 () Bool)

(assert (=> b!88078 (= e!57385 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88078 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!88079 () Bool)

(declare-fun e!57384 () ListLongMap!1465)

(declare-fun call!8473 () ListLongMap!1465)

(assert (=> b!88079 (= e!57384 call!8473)))

(declare-fun b!88080 () Bool)

(declare-fun isEmpty!338 (ListLongMap!1465) Bool)

(assert (=> b!88080 (= e!57386 (isEmpty!338 lt!42007))))

(declare-fun b!88081 () Bool)

(declare-fun e!57387 () Bool)

(declare-fun e!57383 () Bool)

(assert (=> b!88081 (= e!57387 e!57383)))

(assert (=> b!88081 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun res!45129 () Bool)

(assert (=> b!88081 (= res!45129 (contains!756 lt!42007 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88081 (=> (not res!45129) (not e!57383))))

(declare-fun b!88082 () Bool)

(declare-fun e!57381 () ListLongMap!1465)

(assert (=> b!88082 (= e!57381 e!57384)))

(declare-fun c!14548 () Bool)

(assert (=> b!88082 (= c!14548 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88083 () Bool)

(assert (=> b!88083 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> b!88083 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> b!88083 (= e!57383 (= (apply!83 lt!42007 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88084 () Bool)

(declare-fun lt!42009 () Unit!2600)

(declare-fun lt!42010 () Unit!2600)

(assert (=> b!88084 (= lt!42009 lt!42010)))

(declare-fun lt!42008 () (_ BitVec 64))

(declare-fun lt!42006 () ListLongMap!1465)

(declare-fun lt!42004 () V!3035)

(declare-fun lt!42005 () (_ BitVec 64))

(assert (=> b!88084 (not (contains!756 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004)) lt!42008))))

(declare-fun addStillNotContains!32 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> b!88084 (= lt!42010 (addStillNotContains!32 lt!42006 lt!42005 lt!42004 lt!42008))))

(assert (=> b!88084 (= lt!42008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88084 (= lt!42004 (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88084 (= lt!42005 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!88084 (= lt!42006 call!8473)))

(assert (=> b!88084 (= e!57384 (+!112 call!8473 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!8470 () Bool)

(assert (=> bm!8470 (= call!8473 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88086 () Bool)

(declare-fun e!57382 () Bool)

(assert (=> b!88086 (= e!57382 e!57387)))

(declare-fun c!14550 () Bool)

(assert (=> b!88086 (= c!14550 e!57385)))

(declare-fun res!45127 () Bool)

(assert (=> b!88086 (=> (not res!45127) (not e!57385))))

(assert (=> b!88086 (= res!45127 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88087 () Bool)

(declare-fun res!45126 () Bool)

(assert (=> b!88087 (=> (not res!45126) (not e!57382))))

(assert (=> b!88087 (= res!45126 (not (contains!756 lt!42007 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88088 () Bool)

(assert (=> b!88088 (= e!57387 e!57386)))

(declare-fun c!14551 () Bool)

(assert (=> b!88088 (= c!14551 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88085 () Bool)

(assert (=> b!88085 (= e!57381 (ListLongMap!1466 Nil!1519))))

(declare-fun d!23373 () Bool)

(assert (=> d!23373 e!57382))

(declare-fun res!45128 () Bool)

(assert (=> d!23373 (=> (not res!45128) (not e!57382))))

(assert (=> d!23373 (= res!45128 (not (contains!756 lt!42007 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23373 (= lt!42007 e!57381)))

(declare-fun c!14549 () Bool)

(assert (=> d!23373 (= c!14549 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23373 (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23373 (= (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) lt!42007)))

(assert (= (and d!23373 c!14549) b!88085))

(assert (= (and d!23373 (not c!14549)) b!88082))

(assert (= (and b!88082 c!14548) b!88084))

(assert (= (and b!88082 (not c!14548)) b!88079))

(assert (= (or b!88084 b!88079) bm!8470))

(assert (= (and d!23373 res!45128) b!88087))

(assert (= (and b!88087 res!45126) b!88086))

(assert (= (and b!88086 res!45127) b!88078))

(assert (= (and b!88086 c!14550) b!88081))

(assert (= (and b!88086 (not c!14550)) b!88088))

(assert (= (and b!88081 res!45129) b!88083))

(assert (= (and b!88088 c!14551) b!88077))

(assert (= (and b!88088 (not c!14551)) b!88080))

(declare-fun b_lambda!3903 () Bool)

(assert (=> (not b_lambda!3903) (not b!88083)))

(assert (=> b!88083 t!5261))

(declare-fun b_and!5307 () Bool)

(assert (= b_and!5303 (and (=> t!5261 result!2941) b_and!5307)))

(assert (=> b!88083 t!5263))

(declare-fun b_and!5309 () Bool)

(assert (= b_and!5305 (and (=> t!5263 result!2945) b_and!5309)))

(declare-fun b_lambda!3905 () Bool)

(assert (=> (not b_lambda!3905) (not b!88084)))

(assert (=> b!88084 t!5261))

(declare-fun b_and!5311 () Bool)

(assert (= b_and!5307 (and (=> t!5261 result!2941) b_and!5311)))

(assert (=> b!88084 t!5263))

(declare-fun b_and!5313 () Bool)

(assert (= b_and!5309 (and (=> t!5263 result!2945) b_and!5313)))

(assert (=> b!88081 m!93913))

(assert (=> b!88081 m!93913))

(declare-fun m!94001 () Bool)

(assert (=> b!88081 m!94001))

(assert (=> b!88078 m!93913))

(assert (=> b!88078 m!93913))

(assert (=> b!88078 m!93919))

(declare-fun m!94003 () Bool)

(assert (=> b!88080 m!94003))

(assert (=> b!88083 m!93703))

(assert (=> b!88083 m!93913))

(declare-fun m!94005 () Bool)

(assert (=> b!88083 m!94005))

(assert (=> b!88083 m!93909))

(assert (=> b!88083 m!93703))

(assert (=> b!88083 m!93911))

(assert (=> b!88083 m!93913))

(assert (=> b!88083 m!93909))

(declare-fun m!94007 () Bool)

(assert (=> b!88084 m!94007))

(assert (=> b!88084 m!94007))

(declare-fun m!94009 () Bool)

(assert (=> b!88084 m!94009))

(assert (=> b!88084 m!93703))

(assert (=> b!88084 m!93909))

(assert (=> b!88084 m!93703))

(assert (=> b!88084 m!93911))

(assert (=> b!88084 m!93913))

(assert (=> b!88084 m!93909))

(declare-fun m!94011 () Bool)

(assert (=> b!88084 m!94011))

(declare-fun m!94013 () Bool)

(assert (=> b!88084 m!94013))

(declare-fun m!94015 () Bool)

(assert (=> b!88077 m!94015))

(assert (=> b!88082 m!93913))

(assert (=> b!88082 m!93913))

(assert (=> b!88082 m!93919))

(declare-fun m!94017 () Bool)

(assert (=> b!88087 m!94017))

(assert (=> bm!8470 m!94015))

(declare-fun m!94019 () Bool)

(assert (=> d!23373 m!94019))

(assert (=> d!23373 m!93745))

(assert (=> b!87749 d!23373))

(declare-fun d!23375 () Bool)

(declare-fun e!57388 () Bool)

(assert (=> d!23375 e!57388))

(declare-fun res!45130 () Bool)

(assert (=> d!23375 (=> (not res!45130) (not e!57388))))

(declare-fun lt!42012 () ListLongMap!1465)

(assert (=> d!23375 (= res!45130 (contains!756 lt!42012 (_1!1113 lt!41733)))))

(declare-fun lt!42013 () List!1522)

(assert (=> d!23375 (= lt!42012 (ListLongMap!1466 lt!42013))))

(declare-fun lt!42014 () Unit!2600)

(declare-fun lt!42011 () Unit!2600)

(assert (=> d!23375 (= lt!42014 lt!42011)))

(assert (=> d!23375 (= (getValueByKey!141 lt!42013 (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733)))))

(assert (=> d!23375 (= lt!42011 (lemmaContainsTupThenGetReturnValue!58 lt!42013 (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(assert (=> d!23375 (= lt!42013 (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(assert (=> d!23375 (= (+!112 lt!41738 lt!41733) lt!42012)))

(declare-fun b!88089 () Bool)

(declare-fun res!45131 () Bool)

(assert (=> b!88089 (=> (not res!45131) (not e!57388))))

(assert (=> b!88089 (= res!45131 (= (getValueByKey!141 (toList!748 lt!42012) (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733))))))

(declare-fun b!88090 () Bool)

(assert (=> b!88090 (= e!57388 (contains!757 (toList!748 lt!42012) lt!41733))))

(assert (= (and d!23375 res!45130) b!88089))

(assert (= (and b!88089 res!45131) b!88090))

(declare-fun m!94021 () Bool)

(assert (=> d!23375 m!94021))

(declare-fun m!94023 () Bool)

(assert (=> d!23375 m!94023))

(declare-fun m!94025 () Bool)

(assert (=> d!23375 m!94025))

(declare-fun m!94027 () Bool)

(assert (=> d!23375 m!94027))

(declare-fun m!94029 () Bool)

(assert (=> b!88089 m!94029))

(declare-fun m!94031 () Bool)

(assert (=> b!88090 m!94031))

(assert (=> b!87749 d!23375))

(declare-fun d!23377 () Bool)

(declare-fun e!57389 () Bool)

(assert (=> d!23377 e!57389))

(declare-fun res!45132 () Bool)

(assert (=> d!23377 (=> (not res!45132) (not e!57389))))

(declare-fun lt!42016 () ListLongMap!1465)

(assert (=> d!23377 (= res!45132 (contains!756 lt!42016 (_1!1113 lt!41744)))))

(declare-fun lt!42017 () List!1522)

(assert (=> d!23377 (= lt!42016 (ListLongMap!1466 lt!42017))))

(declare-fun lt!42018 () Unit!2600)

(declare-fun lt!42015 () Unit!2600)

(assert (=> d!23377 (= lt!42018 lt!42015)))

(assert (=> d!23377 (= (getValueByKey!141 lt!42017 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(assert (=> d!23377 (= lt!42015 (lemmaContainsTupThenGetReturnValue!58 lt!42017 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(assert (=> d!23377 (= lt!42017 (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(assert (=> d!23377 (= (+!112 lt!41747 lt!41744) lt!42016)))

(declare-fun b!88091 () Bool)

(declare-fun res!45133 () Bool)

(assert (=> b!88091 (=> (not res!45133) (not e!57389))))

(assert (=> b!88091 (= res!45133 (= (getValueByKey!141 (toList!748 lt!42016) (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744))))))

(declare-fun b!88092 () Bool)

(assert (=> b!88092 (= e!57389 (contains!757 (toList!748 lt!42016) lt!41744))))

(assert (= (and d!23377 res!45132) b!88091))

(assert (= (and b!88091 res!45133) b!88092))

(declare-fun m!94033 () Bool)

(assert (=> d!23377 m!94033))

(declare-fun m!94035 () Bool)

(assert (=> d!23377 m!94035))

(declare-fun m!94037 () Bool)

(assert (=> d!23377 m!94037))

(declare-fun m!94039 () Bool)

(assert (=> d!23377 m!94039))

(declare-fun m!94041 () Bool)

(assert (=> b!88091 m!94041))

(declare-fun m!94043 () Bool)

(assert (=> b!88092 m!94043))

(assert (=> b!87749 d!23377))

(declare-fun d!23379 () Bool)

(assert (=> d!23379 (= (+!112 (+!112 lt!41738 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (+!112 (+!112 lt!41738 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(declare-fun lt!42021 () Unit!2600)

(declare-fun choose!513 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64) V!3035) Unit!2600)

(assert (=> d!23379 (= lt!42021 (choose!513 lt!41738 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(assert (=> d!23379 (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23379 (= (addCommutativeForDiffKeys!31 lt!41738 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) lt!42021)))

(declare-fun bs!3719 () Bool)

(assert (= bs!3719 d!23379))

(assert (=> bs!3719 m!93699))

(declare-fun m!94045 () Bool)

(assert (=> bs!3719 m!94045))

(declare-fun m!94047 () Bool)

(assert (=> bs!3719 m!94047))

(declare-fun m!94049 () Bool)

(assert (=> bs!3719 m!94049))

(assert (=> bs!3719 m!94047))

(declare-fun m!94051 () Bool)

(assert (=> bs!3719 m!94051))

(assert (=> bs!3719 m!94049))

(declare-fun m!94053 () Bool)

(assert (=> bs!3719 m!94053))

(assert (=> b!87749 d!23379))

(declare-fun d!23381 () Bool)

(declare-fun e!57390 () Bool)

(assert (=> d!23381 e!57390))

(declare-fun res!45134 () Bool)

(assert (=> d!23381 (=> (not res!45134) (not e!57390))))

(declare-fun lt!42023 () ListLongMap!1465)

(assert (=> d!23381 (= res!45134 (contains!756 lt!42023 (_1!1113 lt!41735)))))

(declare-fun lt!42024 () List!1522)

(assert (=> d!23381 (= lt!42023 (ListLongMap!1466 lt!42024))))

(declare-fun lt!42025 () Unit!2600)

(declare-fun lt!42022 () Unit!2600)

(assert (=> d!23381 (= lt!42025 lt!42022)))

(assert (=> d!23381 (= (getValueByKey!141 lt!42024 (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735)))))

(assert (=> d!23381 (= lt!42022 (lemmaContainsTupThenGetReturnValue!58 lt!42024 (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(assert (=> d!23381 (= lt!42024 (insertStrictlySorted!61 (toList!748 lt!41746) (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(assert (=> d!23381 (= (+!112 lt!41746 lt!41735) lt!42023)))

(declare-fun b!88093 () Bool)

(declare-fun res!45135 () Bool)

(assert (=> b!88093 (=> (not res!45135) (not e!57390))))

(assert (=> b!88093 (= res!45135 (= (getValueByKey!141 (toList!748 lt!42023) (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735))))))

(declare-fun b!88094 () Bool)

(assert (=> b!88094 (= e!57390 (contains!757 (toList!748 lt!42023) lt!41735))))

(assert (= (and d!23381 res!45134) b!88093))

(assert (= (and b!88093 res!45135) b!88094))

(declare-fun m!94055 () Bool)

(assert (=> d!23381 m!94055))

(declare-fun m!94057 () Bool)

(assert (=> d!23381 m!94057))

(declare-fun m!94059 () Bool)

(assert (=> d!23381 m!94059))

(declare-fun m!94061 () Bool)

(assert (=> d!23381 m!94061))

(declare-fun m!94063 () Bool)

(assert (=> b!88093 m!94063))

(declare-fun m!94065 () Bool)

(assert (=> b!88094 m!94065))

(assert (=> b!87749 d!23381))

(declare-fun d!23383 () Bool)

(assert (=> d!23383 (= (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992)))) (and (or (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000001111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000011111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000001111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000011111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000001111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000011111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000001111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000011111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000000111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000001111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000011111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000000111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000001111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000011111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000000111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000001111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000011111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000000111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000001111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000011111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00000111111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00001111111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00011111111111111111111111111111) (= (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6397 (v!2661 (underlying!292 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!87749 d!23383))

(declare-fun d!23385 () Bool)

(declare-fun e!57391 () Bool)

(assert (=> d!23385 e!57391))

(declare-fun res!45136 () Bool)

(assert (=> d!23385 (=> (not res!45136) (not e!57391))))

(declare-fun lt!42027 () ListLongMap!1465)

(assert (=> d!23385 (= res!45136 (contains!756 lt!42027 (_1!1113 lt!41744)))))

(declare-fun lt!42028 () List!1522)

(assert (=> d!23385 (= lt!42027 (ListLongMap!1466 lt!42028))))

(declare-fun lt!42029 () Unit!2600)

(declare-fun lt!42026 () Unit!2600)

(assert (=> d!23385 (= lt!42029 lt!42026)))

(assert (=> d!23385 (= (getValueByKey!141 lt!42028 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(assert (=> d!23385 (= lt!42026 (lemmaContainsTupThenGetReturnValue!58 lt!42028 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(assert (=> d!23385 (= lt!42028 (insertStrictlySorted!61 (toList!748 (+!112 lt!41747 lt!41735)) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(assert (=> d!23385 (= (+!112 (+!112 lt!41747 lt!41735) lt!41744) lt!42027)))

(declare-fun b!88095 () Bool)

(declare-fun res!45137 () Bool)

(assert (=> b!88095 (=> (not res!45137) (not e!57391))))

(assert (=> b!88095 (= res!45137 (= (getValueByKey!141 (toList!748 lt!42027) (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744))))))

(declare-fun b!88096 () Bool)

(assert (=> b!88096 (= e!57391 (contains!757 (toList!748 lt!42027) lt!41744))))

(assert (= (and d!23385 res!45136) b!88095))

(assert (= (and b!88095 res!45137) b!88096))

(declare-fun m!94067 () Bool)

(assert (=> d!23385 m!94067))

(declare-fun m!94069 () Bool)

(assert (=> d!23385 m!94069))

(declare-fun m!94071 () Bool)

(assert (=> d!23385 m!94071))

(declare-fun m!94073 () Bool)

(assert (=> d!23385 m!94073))

(declare-fun m!94075 () Bool)

(assert (=> b!88095 m!94075))

(declare-fun m!94077 () Bool)

(assert (=> b!88096 m!94077))

(assert (=> b!87749 d!23385))

(declare-fun d!23387 () Bool)

(assert (=> d!23387 (= (+!112 (+!112 lt!41747 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (+!112 (+!112 lt!41747 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(declare-fun lt!42030 () Unit!2600)

(assert (=> d!23387 (= lt!42030 (choose!513 lt!41747 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))

(assert (=> d!23387 (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23387 (= (addCommutativeForDiffKeys!31 lt!41747 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))) lt!42030)))

(declare-fun bs!3720 () Bool)

(assert (= bs!3720 d!23387))

(assert (=> bs!3720 m!93699))

(declare-fun m!94079 () Bool)

(assert (=> bs!3720 m!94079))

(declare-fun m!94081 () Bool)

(assert (=> bs!3720 m!94081))

(declare-fun m!94083 () Bool)

(assert (=> bs!3720 m!94083))

(assert (=> bs!3720 m!94081))

(declare-fun m!94085 () Bool)

(assert (=> bs!3720 m!94085))

(assert (=> bs!3720 m!94083))

(declare-fun m!94087 () Bool)

(assert (=> bs!3720 m!94087))

(assert (=> b!87749 d!23387))

(declare-fun d!23389 () Bool)

(declare-fun res!45144 () Bool)

(declare-fun e!57394 () Bool)

(assert (=> d!23389 (=> (not res!45144) (not e!57394))))

(declare-fun simpleValid!59 (LongMapFixedSize!762) Bool)

(assert (=> d!23389 (= res!45144 (simpleValid!59 newMap!16))))

(assert (=> d!23389 (= (valid!327 newMap!16) e!57394)))

(declare-fun b!88103 () Bool)

(declare-fun res!45145 () Bool)

(assert (=> b!88103 (=> (not res!45145) (not e!57394))))

(declare-fun arrayCountValidKeys!0 (array!4043 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!88103 (= res!45145 (= (arrayCountValidKeys!0 (_keys!4035 newMap!16) #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (_size!430 newMap!16)))))

(declare-fun b!88104 () Bool)

(declare-fun res!45146 () Bool)

(assert (=> b!88104 (=> (not res!45146) (not e!57394))))

(assert (=> b!88104 (= res!45146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun b!88105 () Bool)

(assert (=> b!88105 (= e!57394 (arrayNoDuplicates!0 (_keys!4035 newMap!16) #b00000000000000000000000000000000 Nil!1520))))

(assert (= (and d!23389 res!45144) b!88103))

(assert (= (and b!88103 res!45145) b!88104))

(assert (= (and b!88104 res!45146) b!88105))

(declare-fun m!94089 () Bool)

(assert (=> d!23389 m!94089))

(declare-fun m!94091 () Bool)

(assert (=> b!88103 m!94091))

(declare-fun m!94093 () Bool)

(assert (=> b!88104 m!94093))

(declare-fun m!94095 () Bool)

(assert (=> b!88105 m!94095))

(assert (=> b!87746 d!23389))

(declare-fun d!23391 () Bool)

(assert (=> d!23391 (= (array_inv!1191 (_keys!4035 newMap!16)) (bvsge (size!2170 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87751 d!23391))

(declare-fun d!23393 () Bool)

(assert (=> d!23393 (= (array_inv!1192 (_values!2342 newMap!16)) (bvsge (size!2171 (_values!2342 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87751 d!23393))

(declare-fun d!23395 () Bool)

(assert (=> d!23395 (not (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42033 () Unit!2600)

(declare-fun choose!68 (array!4043 (_ BitVec 32) (_ BitVec 64) List!1523) Unit!2600)

(assert (=> d!23395 (= lt!42033 (choose!68 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520)))))

(assert (=> d!23395 (bvslt (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23395 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520)) lt!42033)))

(declare-fun bs!3721 () Bool)

(assert (= bs!3721 d!23395))

(assert (=> bs!3721 m!93699))

(assert (=> bs!3721 m!93719))

(assert (=> bs!3721 m!93699))

(declare-fun m!94097 () Bool)

(assert (=> bs!3721 m!94097))

(assert (=> b!87756 d!23395))

(declare-fun d!23397 () Bool)

(assert (=> d!23397 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) from!355 Nil!1520)))

(declare-fun lt!42036 () Unit!2600)

(declare-fun choose!39 (array!4043 (_ BitVec 32) (_ BitVec 32)) Unit!2600)

(assert (=> d!23397 (= lt!42036 (choose!39 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23397 (bvslt (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23397 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 from!355) lt!42036)))

(declare-fun bs!3722 () Bool)

(assert (= bs!3722 d!23397))

(assert (=> bs!3722 m!93715))

(declare-fun m!94099 () Bool)

(assert (=> bs!3722 m!94099))

(assert (=> b!87756 d!23397))

(declare-fun d!23399 () Bool)

(declare-fun res!45151 () Bool)

(declare-fun e!57399 () Bool)

(assert (=> d!23399 (=> res!45151 e!57399)))

(assert (=> d!23399 (= res!45151 (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23399 (= (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!57399)))

(declare-fun b!88110 () Bool)

(declare-fun e!57400 () Bool)

(assert (=> b!88110 (= e!57399 e!57400)))

(declare-fun res!45152 () Bool)

(assert (=> b!88110 (=> (not res!45152) (not e!57400))))

(assert (=> b!88110 (= res!45152 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88111 () Bool)

(assert (=> b!88111 (= e!57400 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23399 (not res!45151)) b!88110))

(assert (= (and b!88110 res!45152) b!88111))

(assert (=> d!23399 m!93913))

(assert (=> b!88111 m!93699))

(declare-fun m!94101 () Bool)

(assert (=> b!88111 m!94101))

(assert (=> b!87756 d!23399))

(declare-fun d!23401 () Bool)

(declare-fun e!57403 () Bool)

(assert (=> d!23401 e!57403))

(declare-fun c!14554 () Bool)

(assert (=> d!23401 (= c!14554 (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42039 () Unit!2600)

(declare-fun choose!514 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) (_ BitVec 32) Int) Unit!2600)

(assert (=> d!23401 (= lt!42039 (choose!514 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(assert (=> d!23401 (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23401 (= (lemmaListMapContainsThenArrayContainsFrom!68 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) lt!42039)))

(declare-fun b!88116 () Bool)

(assert (=> b!88116 (= e!57403 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88117 () Bool)

(assert (=> b!88117 (= e!57403 (ite (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23401 c!14554) b!88116))

(assert (= (and d!23401 (not c!14554)) b!88117))

(assert (=> d!23401 m!93699))

(declare-fun m!94103 () Bool)

(assert (=> d!23401 m!94103))

(assert (=> d!23401 m!93745))

(assert (=> b!88116 m!93699))

(assert (=> b!88116 m!93719))

(assert (=> b!87756 d!23401))

(declare-fun d!23403 () Bool)

(declare-fun res!45161 () Bool)

(declare-fun e!57413 () Bool)

(assert (=> d!23403 (=> res!45161 e!57413)))

(assert (=> d!23403 (= res!45161 (bvsge from!355 (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23403 (= (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) from!355 Nil!1520) e!57413)))

(declare-fun b!88128 () Bool)

(declare-fun e!57415 () Bool)

(declare-fun call!8476 () Bool)

(assert (=> b!88128 (= e!57415 call!8476)))

(declare-fun b!88129 () Bool)

(declare-fun e!57412 () Bool)

(assert (=> b!88129 (= e!57412 e!57415)))

(declare-fun c!14557 () Bool)

(assert (=> b!88129 (= c!14557 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun bm!8473 () Bool)

(assert (=> bm!8473 (= call!8476 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14557 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520) Nil!1520)))))

(declare-fun b!88130 () Bool)

(declare-fun e!57414 () Bool)

(declare-fun contains!758 (List!1523 (_ BitVec 64)) Bool)

(assert (=> b!88130 (= e!57414 (contains!758 Nil!1520 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88131 () Bool)

(assert (=> b!88131 (= e!57415 call!8476)))

(declare-fun b!88132 () Bool)

(assert (=> b!88132 (= e!57413 e!57412)))

(declare-fun res!45159 () Bool)

(assert (=> b!88132 (=> (not res!45159) (not e!57412))))

(assert (=> b!88132 (= res!45159 (not e!57414))))

(declare-fun res!45160 () Bool)

(assert (=> b!88132 (=> (not res!45160) (not e!57414))))

(assert (=> b!88132 (= res!45160 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (= (and d!23403 (not res!45161)) b!88132))

(assert (= (and b!88132 res!45160) b!88130))

(assert (= (and b!88132 res!45159) b!88129))

(assert (= (and b!88129 c!14557) b!88131))

(assert (= (and b!88129 (not c!14557)) b!88128))

(assert (= (or b!88131 b!88128) bm!8473))

(assert (=> b!88129 m!93699))

(assert (=> b!88129 m!93699))

(declare-fun m!94105 () Bool)

(assert (=> b!88129 m!94105))

(assert (=> bm!8473 m!93699))

(declare-fun m!94107 () Bool)

(assert (=> bm!8473 m!94107))

(assert (=> b!88130 m!93699))

(assert (=> b!88130 m!93699))

(declare-fun m!94109 () Bool)

(assert (=> b!88130 m!94109))

(assert (=> b!88132 m!93699))

(assert (=> b!88132 m!93699))

(assert (=> b!88132 m!94105))

(assert (=> b!87756 d!23403))

(declare-fun condMapEmpty!3435 () Bool)

(declare-fun mapDefault!3435 () ValueCell!927)

(assert (=> mapNonEmpty!3425 (= condMapEmpty!3435 (= mapRest!3426 ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3435)))))

(declare-fun e!57421 () Bool)

(declare-fun mapRes!3435 () Bool)

(assert (=> mapNonEmpty!3425 (= tp!8979 (and e!57421 mapRes!3435))))

(declare-fun b!88140 () Bool)

(assert (=> b!88140 (= e!57421 tp_is_empty!2541)))

(declare-fun b!88139 () Bool)

(declare-fun e!57420 () Bool)

(assert (=> b!88139 (= e!57420 tp_is_empty!2541)))

(declare-fun mapIsEmpty!3435 () Bool)

(assert (=> mapIsEmpty!3435 mapRes!3435))

(declare-fun mapNonEmpty!3435 () Bool)

(declare-fun tp!8997 () Bool)

(assert (=> mapNonEmpty!3435 (= mapRes!3435 (and tp!8997 e!57420))))

(declare-fun mapValue!3435 () ValueCell!927)

(declare-fun mapRest!3435 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapKey!3435 () (_ BitVec 32))

(assert (=> mapNonEmpty!3435 (= mapRest!3426 (store mapRest!3435 mapKey!3435 mapValue!3435))))

(assert (= (and mapNonEmpty!3425 condMapEmpty!3435) mapIsEmpty!3435))

(assert (= (and mapNonEmpty!3425 (not condMapEmpty!3435)) mapNonEmpty!3435))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!927) mapValue!3435)) b!88139))

(assert (= (and mapNonEmpty!3425 ((_ is ValueCellFull!927) mapDefault!3435)) b!88140))

(declare-fun m!94111 () Bool)

(assert (=> mapNonEmpty!3435 m!94111))

(declare-fun condMapEmpty!3436 () Bool)

(declare-fun mapDefault!3436 () ValueCell!927)

(assert (=> mapNonEmpty!3426 (= condMapEmpty!3436 (= mapRest!3425 ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3436)))))

(declare-fun e!57423 () Bool)

(declare-fun mapRes!3436 () Bool)

(assert (=> mapNonEmpty!3426 (= tp!8981 (and e!57423 mapRes!3436))))

(declare-fun b!88142 () Bool)

(assert (=> b!88142 (= e!57423 tp_is_empty!2541)))

(declare-fun b!88141 () Bool)

(declare-fun e!57422 () Bool)

(assert (=> b!88141 (= e!57422 tp_is_empty!2541)))

(declare-fun mapIsEmpty!3436 () Bool)

(assert (=> mapIsEmpty!3436 mapRes!3436))

(declare-fun mapNonEmpty!3436 () Bool)

(declare-fun tp!8998 () Bool)

(assert (=> mapNonEmpty!3436 (= mapRes!3436 (and tp!8998 e!57422))))

(declare-fun mapKey!3436 () (_ BitVec 32))

(declare-fun mapRest!3436 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapValue!3436 () ValueCell!927)

(assert (=> mapNonEmpty!3436 (= mapRest!3425 (store mapRest!3436 mapKey!3436 mapValue!3436))))

(assert (= (and mapNonEmpty!3426 condMapEmpty!3436) mapIsEmpty!3436))

(assert (= (and mapNonEmpty!3426 (not condMapEmpty!3436)) mapNonEmpty!3436))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!927) mapValue!3436)) b!88141))

(assert (= (and mapNonEmpty!3426 ((_ is ValueCellFull!927) mapDefault!3436)) b!88142))

(declare-fun m!94113 () Bool)

(assert (=> mapNonEmpty!3436 m!94113))

(declare-fun b_lambda!3907 () Bool)

(assert (= b_lambda!3903 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3907)))

(declare-fun b_lambda!3909 () Bool)

(assert (= b_lambda!3901 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3909)))

(declare-fun b_lambda!3911 () Bool)

(assert (= b_lambda!3905 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3911)))

(check-sat (not b_next!2249) (not b!88077) (not b!88096) (not d!23355) (not b!88105) (not b!88095) (not d!23377) (not b!87971) (not b!88094) (not b!88103) (not b!87972) (not d!23371) (not b!88050) (not b!88081) (not b!88092) (not b!88017) (not bm!8426) b_and!5311 (not b!88048) (not b!87925) (not bm!8443) (not d!23385) (not d!23389) (not bm!8429) (not b_lambda!3909) (not b!87936) (not bm!8473) (not b!88080) (not b!88021) (not d!23387) (not b_lambda!3907) (not b!88130) (not b!87947) (not d!23375) (not d!23359) (not b!88024) (not b!88111) (not b!87835) (not b!88051) (not bm!8462) (not b!88104) (not b!88091) (not b!87948) (not b!88041) (not mapNonEmpty!3436) (not d!23379) (not b!88132) (not b!87932) (not bm!8463) (not bm!8441) (not b!88084) (not bm!8430) (not bm!8465) (not bm!8440) (not b!88019) (not b_lambda!3911) (not b!88016) (not bm!8442) (not d!23369) (not bm!8420) (not b!87957) (not d!23367) (not b!88049) (not bm!8470) (not bm!8425) (not b!88116) (not b!88029) (not b_next!2251) (not b!88078) tp_is_empty!2541 (not bm!8464) (not bm!8446) (not b!88083) (not b!88047) (not b!88129) (not mapNonEmpty!3435) (not b_lambda!3899) (not d!23395) (not b!88082) (not b!87960) (not b!88093) (not d!23349) (not d!23381) b_and!5313 (not bm!8428) (not b!88089) (not b!87949) (not bm!8422) (not b!88090) (not d!23397) (not d!23401) (not d!23373) (not b!88026) (not b!88036) (not b!88042) (not bm!8431) (not b!88052) (not d!23357) (not d!23351) (not b!88087) (not b!87833))
(check-sat b_and!5311 b_and!5313 (not b_next!2249) (not b_next!2251))
(get-model)

(declare-fun d!23405 () Bool)

(assert (=> d!23405 (= (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88082 d!23405))

(declare-fun d!23407 () Bool)

(declare-fun lt!42042 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!91 (List!1522) (InoxSet tuple2!2204))

(assert (=> d!23407 (= lt!42042 (select (content!91 (toList!748 lt!41983)) lt!41735))))

(declare-fun e!57428 () Bool)

(assert (=> d!23407 (= lt!42042 e!57428)))

(declare-fun res!45167 () Bool)

(assert (=> d!23407 (=> (not res!45167) (not e!57428))))

(assert (=> d!23407 (= res!45167 ((_ is Cons!1518) (toList!748 lt!41983)))))

(assert (=> d!23407 (= (contains!757 (toList!748 lt!41983) lt!41735) lt!42042)))

(declare-fun b!88147 () Bool)

(declare-fun e!57429 () Bool)

(assert (=> b!88147 (= e!57428 e!57429)))

(declare-fun res!45166 () Bool)

(assert (=> b!88147 (=> res!45166 e!57429)))

(assert (=> b!88147 (= res!45166 (= (h!2110 (toList!748 lt!41983)) lt!41735))))

(declare-fun b!88148 () Bool)

(assert (=> b!88148 (= e!57429 (contains!757 (t!5264 (toList!748 lt!41983)) lt!41735))))

(assert (= (and d!23407 res!45167) b!88147))

(assert (= (and b!88147 (not res!45166)) b!88148))

(declare-fun m!94115 () Bool)

(assert (=> d!23407 m!94115))

(declare-fun m!94117 () Bool)

(assert (=> d!23407 m!94117))

(declare-fun m!94119 () Bool)

(assert (=> b!88148 m!94119))

(assert (=> b!88050 d!23407))

(assert (=> b!88021 d!23405))

(declare-fun b!88183 () Bool)

(declare-fun res!45193 () Bool)

(declare-fun lt!42132 () SeekEntryResult!244)

(assert (=> b!88183 (= res!45193 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3117 lt!42132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57453 () Bool)

(assert (=> b!88183 (=> (not res!45193) (not e!57453))))

(declare-fun b!88184 () Bool)

(declare-fun res!45192 () Bool)

(declare-fun e!57452 () Bool)

(assert (=> b!88184 (=> (not res!45192) (not e!57452))))

(assert (=> b!88184 (= res!45192 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3114 lt!42132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88185 () Bool)

(declare-fun e!57448 () Unit!2600)

(declare-fun Unit!2608 () Unit!2600)

(assert (=> b!88185 (= e!57448 Unit!2608)))

(declare-fun lt!42125 () Unit!2600)

(assert (=> b!88185 (= lt!42125 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42110 () SeekEntryResult!244)

(declare-fun call!8487 () SeekEntryResult!244)

(assert (=> b!88185 (= lt!42110 call!8487)))

(declare-fun res!45189 () Bool)

(assert (=> b!88185 (= res!45189 ((_ is Found!244) lt!42110))))

(declare-fun e!57450 () Bool)

(assert (=> b!88185 (=> (not res!45189) (not e!57450))))

(assert (=> b!88185 e!57450))

(declare-fun lt!42131 () Unit!2600)

(assert (=> b!88185 (= lt!42131 lt!42125)))

(assert (=> b!88185 false))

(declare-fun d!23409 () Bool)

(declare-fun e!57449 () Bool)

(assert (=> d!23409 e!57449))

(declare-fun res!45186 () Bool)

(assert (=> d!23409 (=> (not res!45186) (not e!57449))))

(declare-fun lt!42108 () tuple2!2202)

(assert (=> d!23409 (= res!45186 (_1!1112 lt!42108))))

(assert (=> d!23409 (= lt!42108 (tuple2!2203 true (LongMapFixedSize!763 (defaultEntry!2359 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (bvadd (_size!430 newMap!16) #b00000000000000000000000000000001) (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))) (_vacant!430 newMap!16))))))

(declare-fun lt!42122 () Unit!2600)

(declare-fun lt!42113 () Unit!2600)

(assert (=> d!23409 (= lt!42122 lt!42113)))

(declare-fun lt!42129 () array!4045)

(declare-fun lt!42106 () array!4043)

(assert (=> d!23409 (contains!756 (getCurrentListMap!441 lt!42106 lt!42129 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (select (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874))))))

(assert (=> d!23409 (= lt!42113 (lemmaValidKeyInArrayIsInListMap!93 lt!42106 lt!42129 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (defaultEntry!2359 newMap!16)))))

(assert (=> d!23409 (= lt!42129 (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))))))

(assert (=> d!23409 (= lt!42106 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun lt!42105 () Unit!2600)

(declare-fun lt!42124 () Unit!2600)

(assert (=> d!23409 (= lt!42105 lt!42124)))

(declare-fun lt!42128 () array!4043)

(assert (=> d!23409 (= (arrayCountValidKeys!0 lt!42128 (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (bvadd (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4043 (_ BitVec 32)) Unit!2600)

(assert (=> d!23409 (= lt!42124 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!42128 (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874))))))

(assert (=> d!23409 (= lt!42128 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun lt!42123 () Unit!2600)

(declare-fun lt!42114 () Unit!2600)

(assert (=> d!23409 (= lt!42123 lt!42114)))

(declare-fun lt!42103 () array!4043)

(assert (=> d!23409 (arrayContainsKey!0 lt!42103 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23409 (= lt!42114 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!42103 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874))))))

(assert (=> d!23409 (= lt!42103 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun lt!42104 () Unit!2600)

(declare-fun lt!42130 () Unit!2600)

(assert (=> d!23409 (= lt!42104 lt!42130)))

(assert (=> d!23409 (= (+!112 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (getCurrentListMap!441 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!20 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) (_ BitVec 64) V!3035 Int) Unit!2600)

(assert (=> d!23409 (= lt!42130 (lemmaAddValidKeyToArrayThenAddPairToListMap!20 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42127 () Unit!2600)

(declare-fun lt!42117 () Unit!2600)

(assert (=> d!23409 (= lt!42127 lt!42117)))

(assert (=> d!23409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))) (mask!6397 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4043 (_ BitVec 32) (_ BitVec 32)) Unit!2600)

(assert (=> d!23409 (= lt!42117 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (mask!6397 newMap!16)))))

(declare-fun lt!42107 () Unit!2600)

(declare-fun lt!42115 () Unit!2600)

(assert (=> d!23409 (= lt!42107 lt!42115)))

(assert (=> d!23409 (= (arrayCountValidKeys!0 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))) #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4035 newMap!16) #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4043 (_ BitVec 32) (_ BitVec 64)) Unit!2600)

(assert (=> d!23409 (= lt!42115 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4035 newMap!16) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun lt!42118 () Unit!2600)

(declare-fun lt!42116 () Unit!2600)

(assert (=> d!23409 (= lt!42118 lt!42116)))

(declare-fun lt!42120 () (_ BitVec 32))

(declare-fun lt!42126 () List!1523)

(assert (=> d!23409 (arrayNoDuplicates!0 (array!4044 (store (arr!1925 (_keys!4035 newMap!16)) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (size!2170 (_keys!4035 newMap!16))) lt!42120 lt!42126)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4043 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1523) Unit!2600)

(assert (=> d!23409 (= lt!42116 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874)) lt!42120 lt!42126))))

(assert (=> d!23409 (= lt!42126 Nil!1520)))

(assert (=> d!23409 (= lt!42120 #b00000000000000000000000000000000)))

(declare-fun lt!42112 () Unit!2600)

(declare-fun e!57451 () Unit!2600)

(assert (=> d!23409 (= lt!42112 e!57451)))

(declare-fun c!14569 () Bool)

(assert (=> d!23409 (= c!14569 (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!42111 () Unit!2600)

(assert (=> d!23409 (= lt!42111 e!57448)))

(declare-fun c!14567 () Bool)

(assert (=> d!23409 (= c!14567 (contains!756 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23409 (valid!327 newMap!16)))

(assert (=> d!23409 (= (updateHelperNewKey!32 newMap!16 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (ite c!14506 (index!3117 lt!41874) (index!3114 lt!41874))) lt!42108)))

(declare-fun b!88186 () Bool)

(declare-fun e!57447 () Bool)

(assert (=> b!88186 (= e!57447 ((_ is Undefined!244) lt!42132))))

(declare-fun b!88187 () Bool)

(declare-fun Unit!2609 () Unit!2600)

(assert (=> b!88187 (= e!57451 Unit!2609)))

(declare-fun b!88188 () Bool)

(declare-fun call!8485 () Bool)

(assert (=> b!88188 (= e!57452 (not call!8485))))

(declare-fun b!88189 () Bool)

(assert (=> b!88189 (= e!57449 (= (map!1192 (_2!1112 lt!42108)) (+!112 (map!1192 newMap!16) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun b!88190 () Bool)

(assert (=> b!88190 (= e!57450 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!42110)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88191 () Bool)

(assert (=> b!88191 (= e!57453 (not call!8485))))

(declare-fun b!88192 () Bool)

(declare-fun c!14566 () Bool)

(assert (=> b!88192 (= c!14566 ((_ is MissingVacant!244) lt!42132))))

(declare-fun e!57446 () Bool)

(assert (=> b!88192 (= e!57446 e!57447)))

(declare-fun b!88193 () Bool)

(declare-fun lt!42121 () Unit!2600)

(assert (=> b!88193 (= e!57448 lt!42121)))

(assert (=> b!88193 (= lt!42121 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(assert (=> b!88193 (= lt!42132 call!8487)))

(declare-fun c!14568 () Bool)

(assert (=> b!88193 (= c!14568 ((_ is MissingZero!244) lt!42132))))

(assert (=> b!88193 e!57446))

(declare-fun bm!8482 () Bool)

(declare-fun call!8488 () Bool)

(declare-fun call!8486 () Bool)

(assert (=> bm!8482 (= call!8488 call!8486)))

(declare-fun b!88194 () Bool)

(declare-fun Unit!2610 () Unit!2600)

(assert (=> b!88194 (= e!57451 Unit!2610)))

(declare-fun lt!42119 () Unit!2600)

(declare-fun lemmaArrayContainsKeyThenInListMap!20 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) (_ BitVec 32) Int) Unit!2600)

(assert (=> b!88194 (= lt!42119 (lemmaArrayContainsKeyThenInListMap!20 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(assert (=> b!88194 (contains!756 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))

(declare-fun lt!42109 () Unit!2600)

(assert (=> b!88194 (= lt!42109 lt!42119)))

(assert (=> b!88194 false))

(declare-fun b!88195 () Bool)

(declare-fun res!45191 () Bool)

(assert (=> b!88195 (=> (not res!45191) (not e!57452))))

(assert (=> b!88195 (= res!45191 call!8488)))

(assert (=> b!88195 (= e!57446 e!57452)))

(declare-fun b!88196 () Bool)

(declare-fun res!45188 () Bool)

(assert (=> b!88196 (=> (not res!45188) (not e!57449))))

(assert (=> b!88196 (= res!45188 (contains!756 (map!1192 (_2!1112 lt!42108)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun bm!8483 () Bool)

(assert (=> bm!8483 (= call!8486 (inRange!0 (ite c!14567 (index!3115 lt!42110) (ite c!14568 (index!3114 lt!42132) (index!3117 lt!42132))) (mask!6397 newMap!16)))))

(declare-fun bm!8484 () Bool)

(assert (=> bm!8484 (= call!8485 (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88197 () Bool)

(declare-fun res!45190 () Bool)

(assert (=> b!88197 (=> (not res!45190) (not e!57449))))

(assert (=> b!88197 (= res!45190 (valid!327 (_2!1112 lt!42108)))))

(declare-fun bm!8485 () Bool)

(assert (=> bm!8485 (= call!8487 (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun b!88198 () Bool)

(assert (=> b!88198 (= e!57447 e!57453)))

(declare-fun res!45187 () Bool)

(assert (=> b!88198 (= res!45187 call!8488)))

(assert (=> b!88198 (=> (not res!45187) (not e!57453))))

(declare-fun b!88199 () Bool)

(declare-fun res!45194 () Bool)

(assert (=> b!88199 (= res!45194 call!8486)))

(assert (=> b!88199 (=> (not res!45194) (not e!57450))))

(assert (= (and d!23409 c!14567) b!88185))

(assert (= (and d!23409 (not c!14567)) b!88193))

(assert (= (and b!88185 res!45189) b!88199))

(assert (= (and b!88199 res!45194) b!88190))

(assert (= (and b!88193 c!14568) b!88195))

(assert (= (and b!88193 (not c!14568)) b!88192))

(assert (= (and b!88195 res!45191) b!88184))

(assert (= (and b!88184 res!45192) b!88188))

(assert (= (and b!88192 c!14566) b!88198))

(assert (= (and b!88192 (not c!14566)) b!88186))

(assert (= (and b!88198 res!45187) b!88183))

(assert (= (and b!88183 res!45193) b!88191))

(assert (= (or b!88195 b!88198) bm!8482))

(assert (= (or b!88188 b!88191) bm!8484))

(assert (= (or b!88199 bm!8482) bm!8483))

(assert (= (or b!88185 b!88193) bm!8485))

(assert (= (and d!23409 c!14569) b!88194))

(assert (= (and d!23409 (not c!14569)) b!88187))

(assert (= (and d!23409 res!45186) b!88197))

(assert (= (and b!88197 res!45190) b!88196))

(assert (= (and b!88196 res!45188) b!88189))

(assert (=> bm!8485 m!93699))

(assert (=> bm!8485 m!93851))

(declare-fun m!94121 () Bool)

(assert (=> b!88197 m!94121))

(assert (=> b!88193 m!93699))

(assert (=> b!88193 m!93855))

(declare-fun m!94123 () Bool)

(assert (=> b!88189 m!94123))

(assert (=> b!88189 m!93753))

(assert (=> b!88189 m!93753))

(declare-fun m!94125 () Bool)

(assert (=> b!88189 m!94125))

(declare-fun m!94127 () Bool)

(assert (=> bm!8483 m!94127))

(declare-fun m!94129 () Bool)

(assert (=> d!23409 m!94129))

(declare-fun m!94131 () Bool)

(assert (=> d!23409 m!94131))

(declare-fun m!94133 () Bool)

(assert (=> d!23409 m!94133))

(assert (=> d!23409 m!93699))

(declare-fun m!94135 () Bool)

(assert (=> d!23409 m!94135))

(assert (=> d!23409 m!93699))

(assert (=> d!23409 m!93857))

(assert (=> d!23409 m!93699))

(declare-fun m!94137 () Bool)

(assert (=> d!23409 m!94137))

(declare-fun m!94139 () Bool)

(assert (=> d!23409 m!94139))

(assert (=> d!23409 m!93865))

(assert (=> d!23409 m!93865))

(assert (=> d!23409 m!93699))

(declare-fun m!94141 () Bool)

(assert (=> d!23409 m!94141))

(declare-fun m!94143 () Bool)

(assert (=> d!23409 m!94143))

(assert (=> d!23409 m!93865))

(declare-fun m!94145 () Bool)

(assert (=> d!23409 m!94145))

(assert (=> d!23409 m!93699))

(declare-fun m!94147 () Bool)

(assert (=> d!23409 m!94147))

(declare-fun m!94149 () Bool)

(assert (=> d!23409 m!94149))

(declare-fun m!94151 () Bool)

(assert (=> d!23409 m!94151))

(declare-fun m!94153 () Bool)

(assert (=> d!23409 m!94153))

(assert (=> d!23409 m!94091))

(assert (=> d!23409 m!93699))

(declare-fun m!94155 () Bool)

(assert (=> d!23409 m!94155))

(assert (=> d!23409 m!93699))

(declare-fun m!94157 () Bool)

(assert (=> d!23409 m!94157))

(assert (=> d!23409 m!93711))

(declare-fun m!94159 () Bool)

(assert (=> d!23409 m!94159))

(assert (=> d!23409 m!94131))

(declare-fun m!94161 () Bool)

(assert (=> d!23409 m!94161))

(assert (=> d!23409 m!93699))

(declare-fun m!94163 () Bool)

(assert (=> d!23409 m!94163))

(declare-fun m!94165 () Bool)

(assert (=> d!23409 m!94165))

(declare-fun m!94167 () Bool)

(assert (=> d!23409 m!94167))

(assert (=> d!23409 m!94159))

(declare-fun m!94169 () Bool)

(assert (=> b!88190 m!94169))

(assert (=> b!88196 m!94123))

(assert (=> b!88196 m!94123))

(assert (=> b!88196 m!93699))

(declare-fun m!94171 () Bool)

(assert (=> b!88196 m!94171))

(assert (=> bm!8484 m!93699))

(assert (=> bm!8484 m!93857))

(assert (=> b!88194 m!93699))

(declare-fun m!94173 () Bool)

(assert (=> b!88194 m!94173))

(assert (=> b!88194 m!93865))

(assert (=> b!88194 m!93865))

(assert (=> b!88194 m!93699))

(assert (=> b!88194 m!94141))

(declare-fun m!94175 () Bool)

(assert (=> b!88184 m!94175))

(assert (=> b!88185 m!93699))

(assert (=> b!88185 m!93873))

(declare-fun m!94177 () Bool)

(assert (=> b!88183 m!94177))

(assert (=> bm!8442 d!23409))

(declare-fun d!23411 () Bool)

(assert (=> d!23411 (not (contains!756 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004)) lt!42008))))

(declare-fun lt!42135 () Unit!2600)

(declare-fun choose!515 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> d!23411 (= lt!42135 (choose!515 lt!42006 lt!42005 lt!42004 lt!42008))))

(declare-fun e!57456 () Bool)

(assert (=> d!23411 e!57456))

(declare-fun res!45197 () Bool)

(assert (=> d!23411 (=> (not res!45197) (not e!57456))))

(assert (=> d!23411 (= res!45197 (not (contains!756 lt!42006 lt!42008)))))

(assert (=> d!23411 (= (addStillNotContains!32 lt!42006 lt!42005 lt!42004 lt!42008) lt!42135)))

(declare-fun b!88203 () Bool)

(assert (=> b!88203 (= e!57456 (not (= lt!42005 lt!42008)))))

(assert (= (and d!23411 res!45197) b!88203))

(assert (=> d!23411 m!94007))

(assert (=> d!23411 m!94007))

(assert (=> d!23411 m!94009))

(declare-fun m!94179 () Bool)

(assert (=> d!23411 m!94179))

(declare-fun m!94181 () Bool)

(assert (=> d!23411 m!94181))

(assert (=> b!88084 d!23411))

(declare-fun d!23413 () Bool)

(declare-fun c!14570 () Bool)

(assert (=> d!23413 (= c!14570 ((_ is ValueCellFull!927) (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!57457 () V!3035)

(assert (=> d!23413 (= (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57457)))

(declare-fun b!88204 () Bool)

(assert (=> b!88204 (= e!57457 (get!1202 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88205 () Bool)

(assert (=> b!88205 (= e!57457 (get!1203 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23413 c!14570) b!88204))

(assert (= (and d!23413 (not c!14570)) b!88205))

(assert (=> b!88204 m!93909))

(assert (=> b!88204 m!93703))

(declare-fun m!94183 () Bool)

(assert (=> b!88204 m!94183))

(assert (=> b!88205 m!93909))

(assert (=> b!88205 m!93703))

(declare-fun m!94185 () Bool)

(assert (=> b!88205 m!94185))

(assert (=> b!88084 d!23413))

(declare-fun d!23415 () Bool)

(declare-fun e!57459 () Bool)

(assert (=> d!23415 e!57459))

(declare-fun res!45198 () Bool)

(assert (=> d!23415 (=> res!45198 e!57459)))

(declare-fun lt!42139 () Bool)

(assert (=> d!23415 (= res!45198 (not lt!42139))))

(declare-fun lt!42136 () Bool)

(assert (=> d!23415 (= lt!42139 lt!42136)))

(declare-fun lt!42137 () Unit!2600)

(declare-fun e!57458 () Unit!2600)

(assert (=> d!23415 (= lt!42137 e!57458)))

(declare-fun c!14571 () Bool)

(assert (=> d!23415 (= c!14571 lt!42136)))

(assert (=> d!23415 (= lt!42136 (containsKey!145 (toList!748 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004))) lt!42008))))

(assert (=> d!23415 (= (contains!756 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004)) lt!42008) lt!42139)))

(declare-fun b!88206 () Bool)

(declare-fun lt!42138 () Unit!2600)

(assert (=> b!88206 (= e!57458 lt!42138)))

(assert (=> b!88206 (= lt!42138 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004))) lt!42008))))

(assert (=> b!88206 (isDefined!94 (getValueByKey!141 (toList!748 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004))) lt!42008))))

(declare-fun b!88207 () Bool)

(declare-fun Unit!2611 () Unit!2600)

(assert (=> b!88207 (= e!57458 Unit!2611)))

(declare-fun b!88208 () Bool)

(assert (=> b!88208 (= e!57459 (isDefined!94 (getValueByKey!141 (toList!748 (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004))) lt!42008)))))

(assert (= (and d!23415 c!14571) b!88206))

(assert (= (and d!23415 (not c!14571)) b!88207))

(assert (= (and d!23415 (not res!45198)) b!88208))

(declare-fun m!94187 () Bool)

(assert (=> d!23415 m!94187))

(declare-fun m!94189 () Bool)

(assert (=> b!88206 m!94189))

(declare-fun m!94191 () Bool)

(assert (=> b!88206 m!94191))

(assert (=> b!88206 m!94191))

(declare-fun m!94193 () Bool)

(assert (=> b!88206 m!94193))

(assert (=> b!88208 m!94191))

(assert (=> b!88208 m!94191))

(assert (=> b!88208 m!94193))

(assert (=> b!88084 d!23415))

(declare-fun d!23417 () Bool)

(declare-fun e!57460 () Bool)

(assert (=> d!23417 e!57460))

(declare-fun res!45199 () Bool)

(assert (=> d!23417 (=> (not res!45199) (not e!57460))))

(declare-fun lt!42141 () ListLongMap!1465)

(assert (=> d!23417 (= res!45199 (contains!756 lt!42141 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!42142 () List!1522)

(assert (=> d!23417 (= lt!42141 (ListLongMap!1466 lt!42142))))

(declare-fun lt!42143 () Unit!2600)

(declare-fun lt!42140 () Unit!2600)

(assert (=> d!23417 (= lt!42143 lt!42140)))

(assert (=> d!23417 (= (getValueByKey!141 lt!42142 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23417 (= lt!42140 (lemmaContainsTupThenGetReturnValue!58 lt!42142 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23417 (= lt!42142 (insertStrictlySorted!61 (toList!748 call!8473) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23417 (= (+!112 call!8473 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!42141)))

(declare-fun b!88209 () Bool)

(declare-fun res!45200 () Bool)

(assert (=> b!88209 (=> (not res!45200) (not e!57460))))

(assert (=> b!88209 (= res!45200 (= (getValueByKey!141 (toList!748 lt!42141) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!88210 () Bool)

(assert (=> b!88210 (= e!57460 (contains!757 (toList!748 lt!42141) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23417 res!45199) b!88209))

(assert (= (and b!88209 res!45200) b!88210))

(declare-fun m!94195 () Bool)

(assert (=> d!23417 m!94195))

(declare-fun m!94197 () Bool)

(assert (=> d!23417 m!94197))

(declare-fun m!94199 () Bool)

(assert (=> d!23417 m!94199))

(declare-fun m!94201 () Bool)

(assert (=> d!23417 m!94201))

(declare-fun m!94203 () Bool)

(assert (=> b!88209 m!94203))

(declare-fun m!94205 () Bool)

(assert (=> b!88210 m!94205))

(assert (=> b!88084 d!23417))

(declare-fun d!23419 () Bool)

(declare-fun e!57461 () Bool)

(assert (=> d!23419 e!57461))

(declare-fun res!45201 () Bool)

(assert (=> d!23419 (=> (not res!45201) (not e!57461))))

(declare-fun lt!42145 () ListLongMap!1465)

(assert (=> d!23419 (= res!45201 (contains!756 lt!42145 (_1!1113 (tuple2!2205 lt!42005 lt!42004))))))

(declare-fun lt!42146 () List!1522)

(assert (=> d!23419 (= lt!42145 (ListLongMap!1466 lt!42146))))

(declare-fun lt!42147 () Unit!2600)

(declare-fun lt!42144 () Unit!2600)

(assert (=> d!23419 (= lt!42147 lt!42144)))

(assert (=> d!23419 (= (getValueByKey!141 lt!42146 (_1!1113 (tuple2!2205 lt!42005 lt!42004))) (Some!146 (_2!1113 (tuple2!2205 lt!42005 lt!42004))))))

(assert (=> d!23419 (= lt!42144 (lemmaContainsTupThenGetReturnValue!58 lt!42146 (_1!1113 (tuple2!2205 lt!42005 lt!42004)) (_2!1113 (tuple2!2205 lt!42005 lt!42004))))))

(assert (=> d!23419 (= lt!42146 (insertStrictlySorted!61 (toList!748 lt!42006) (_1!1113 (tuple2!2205 lt!42005 lt!42004)) (_2!1113 (tuple2!2205 lt!42005 lt!42004))))))

(assert (=> d!23419 (= (+!112 lt!42006 (tuple2!2205 lt!42005 lt!42004)) lt!42145)))

(declare-fun b!88211 () Bool)

(declare-fun res!45202 () Bool)

(assert (=> b!88211 (=> (not res!45202) (not e!57461))))

(assert (=> b!88211 (= res!45202 (= (getValueByKey!141 (toList!748 lt!42145) (_1!1113 (tuple2!2205 lt!42005 lt!42004))) (Some!146 (_2!1113 (tuple2!2205 lt!42005 lt!42004)))))))

(declare-fun b!88212 () Bool)

(assert (=> b!88212 (= e!57461 (contains!757 (toList!748 lt!42145) (tuple2!2205 lt!42005 lt!42004)))))

(assert (= (and d!23419 res!45201) b!88211))

(assert (= (and b!88211 res!45202) b!88212))

(declare-fun m!94207 () Bool)

(assert (=> d!23419 m!94207))

(declare-fun m!94209 () Bool)

(assert (=> d!23419 m!94209))

(declare-fun m!94211 () Bool)

(assert (=> d!23419 m!94211))

(declare-fun m!94213 () Bool)

(assert (=> d!23419 m!94213))

(declare-fun m!94215 () Bool)

(assert (=> b!88211 m!94215))

(declare-fun m!94217 () Bool)

(assert (=> b!88212 m!94217))

(assert (=> b!88084 d!23419))

(declare-fun d!23421 () Bool)

(declare-fun lt!42148 () Bool)

(assert (=> d!23421 (= lt!42148 (select (content!91 (toList!748 lt!41987)) lt!41733))))

(declare-fun e!57462 () Bool)

(assert (=> d!23421 (= lt!42148 e!57462)))

(declare-fun res!45204 () Bool)

(assert (=> d!23421 (=> (not res!45204) (not e!57462))))

(assert (=> d!23421 (= res!45204 ((_ is Cons!1518) (toList!748 lt!41987)))))

(assert (=> d!23421 (= (contains!757 (toList!748 lt!41987) lt!41733) lt!42148)))

(declare-fun b!88213 () Bool)

(declare-fun e!57463 () Bool)

(assert (=> b!88213 (= e!57462 e!57463)))

(declare-fun res!45203 () Bool)

(assert (=> b!88213 (=> res!45203 e!57463)))

(assert (=> b!88213 (= res!45203 (= (h!2110 (toList!748 lt!41987)) lt!41733))))

(declare-fun b!88214 () Bool)

(assert (=> b!88214 (= e!57463 (contains!757 (t!5264 (toList!748 lt!41987)) lt!41733))))

(assert (= (and d!23421 res!45204) b!88213))

(assert (= (and b!88213 (not res!45203)) b!88214))

(declare-fun m!94219 () Bool)

(assert (=> d!23421 m!94219))

(declare-fun m!94221 () Bool)

(assert (=> d!23421 m!94221))

(declare-fun m!94223 () Bool)

(assert (=> b!88214 m!94223))

(assert (=> b!88052 d!23421))

(declare-fun d!23423 () Bool)

(declare-fun get!1204 (Option!147) V!3035)

(assert (=> d!23423 (= (apply!83 lt!41956 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1204 (getValueByKey!141 (toList!748 lt!41956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3723 () Bool)

(assert (= bs!3723 d!23423))

(declare-fun m!94225 () Bool)

(assert (=> bs!3723 m!94225))

(assert (=> bs!3723 m!94225))

(declare-fun m!94227 () Bool)

(assert (=> bs!3723 m!94227))

(assert (=> b!88017 d!23423))

(declare-fun d!23425 () Bool)

(declare-fun lt!42149 () Bool)

(assert (=> d!23425 (= lt!42149 (select (content!91 (toList!748 lt!42027)) lt!41744))))

(declare-fun e!57464 () Bool)

(assert (=> d!23425 (= lt!42149 e!57464)))

(declare-fun res!45206 () Bool)

(assert (=> d!23425 (=> (not res!45206) (not e!57464))))

(assert (=> d!23425 (= res!45206 ((_ is Cons!1518) (toList!748 lt!42027)))))

(assert (=> d!23425 (= (contains!757 (toList!748 lt!42027) lt!41744) lt!42149)))

(declare-fun b!88215 () Bool)

(declare-fun e!57465 () Bool)

(assert (=> b!88215 (= e!57464 e!57465)))

(declare-fun res!45205 () Bool)

(assert (=> b!88215 (=> res!45205 e!57465)))

(assert (=> b!88215 (= res!45205 (= (h!2110 (toList!748 lt!42027)) lt!41744))))

(declare-fun b!88216 () Bool)

(assert (=> b!88216 (= e!57465 (contains!757 (t!5264 (toList!748 lt!42027)) lt!41744))))

(assert (= (and d!23425 res!45206) b!88215))

(assert (= (and b!88215 (not res!45205)) b!88216))

(declare-fun m!94229 () Bool)

(assert (=> d!23425 m!94229))

(declare-fun m!94231 () Bool)

(assert (=> d!23425 m!94231))

(declare-fun m!94233 () Bool)

(assert (=> b!88216 m!94233))

(assert (=> b!88096 d!23425))

(declare-fun d!23427 () Bool)

(declare-fun isEmpty!339 (List!1522) Bool)

(assert (=> d!23427 (= (isEmpty!338 lt!42007) (isEmpty!339 (toList!748 lt!42007)))))

(declare-fun bs!3724 () Bool)

(assert (= bs!3724 d!23427))

(declare-fun m!94235 () Bool)

(assert (=> bs!3724 m!94235))

(assert (=> b!88080 d!23427))

(declare-fun d!23429 () Bool)

(declare-fun lt!42150 () Bool)

(assert (=> d!23429 (= lt!42150 (select (content!91 (toList!748 lt!41979)) lt!41744))))

(declare-fun e!57466 () Bool)

(assert (=> d!23429 (= lt!42150 e!57466)))

(declare-fun res!45208 () Bool)

(assert (=> d!23429 (=> (not res!45208) (not e!57466))))

(assert (=> d!23429 (= res!45208 ((_ is Cons!1518) (toList!748 lt!41979)))))

(assert (=> d!23429 (= (contains!757 (toList!748 lt!41979) lt!41744) lt!42150)))

(declare-fun b!88217 () Bool)

(declare-fun e!57467 () Bool)

(assert (=> b!88217 (= e!57466 e!57467)))

(declare-fun res!45207 () Bool)

(assert (=> b!88217 (=> res!45207 e!57467)))

(assert (=> b!88217 (= res!45207 (= (h!2110 (toList!748 lt!41979)) lt!41744))))

(declare-fun b!88218 () Bool)

(assert (=> b!88218 (= e!57467 (contains!757 (t!5264 (toList!748 lt!41979)) lt!41744))))

(assert (= (and d!23429 res!45208) b!88217))

(assert (= (and b!88217 (not res!45207)) b!88218))

(declare-fun m!94237 () Bool)

(assert (=> d!23429 m!94237))

(declare-fun m!94239 () Bool)

(assert (=> d!23429 m!94239))

(declare-fun m!94241 () Bool)

(assert (=> b!88218 m!94241))

(assert (=> b!88048 d!23429))

(declare-fun d!23431 () Bool)

(assert (=> d!23431 (= (apply!83 lt!41956 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1204 (getValueByKey!141 (toList!748 lt!41956) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3725 () Bool)

(assert (= bs!3725 d!23431))

(assert (=> bs!3725 m!93913))

(declare-fun m!94243 () Bool)

(assert (=> bs!3725 m!94243))

(assert (=> bs!3725 m!94243))

(declare-fun m!94245 () Bool)

(assert (=> bs!3725 m!94245))

(assert (=> b!88019 d!23431))

(assert (=> b!88019 d!23413))

(declare-fun d!23433 () Bool)

(assert (=> d!23433 (= (+!112 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) lt!41890 lt!41734 (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42153 () Unit!2600)

(declare-fun choose!516 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 V!3035 Int) Unit!2600)

(assert (=> d!23433 (= lt!42153 (choose!516 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41890 (zeroValue!2249 newMap!16) lt!41734 (minValue!2249 newMap!16) (defaultEntry!2359 newMap!16)))))

(assert (=> d!23433 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23433 (= (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41890 (zeroValue!2249 newMap!16) lt!41734 (minValue!2249 newMap!16) (defaultEntry!2359 newMap!16)) lt!42153)))

(declare-fun bs!3726 () Bool)

(assert (= bs!3726 d!23433))

(declare-fun m!94247 () Bool)

(assert (=> bs!3726 m!94247))

(assert (=> bs!3726 m!93865))

(assert (=> bs!3726 m!93865))

(declare-fun m!94249 () Bool)

(assert (=> bs!3726 m!94249))

(declare-fun m!94251 () Bool)

(assert (=> bs!3726 m!94251))

(declare-fun m!94253 () Bool)

(assert (=> bs!3726 m!94253))

(assert (=> b!87957 d!23433))

(declare-fun d!23435 () Bool)

(declare-fun e!57480 () Bool)

(assert (=> d!23435 e!57480))

(declare-fun res!45210 () Bool)

(assert (=> d!23435 (=> (not res!45210) (not e!57480))))

(assert (=> d!23435 (= res!45210 (or (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))))

(declare-fun lt!42162 () ListLongMap!1465)

(declare-fun lt!42169 () ListLongMap!1465)

(assert (=> d!23435 (= lt!42162 lt!42169)))

(declare-fun lt!42163 () Unit!2600)

(declare-fun e!57473 () Unit!2600)

(assert (=> d!23435 (= lt!42163 e!57473)))

(declare-fun c!14574 () Bool)

(declare-fun e!57478 () Bool)

(assert (=> d!23435 (= c!14574 e!57478)))

(declare-fun res!45215 () Bool)

(assert (=> d!23435 (=> (not res!45215) (not e!57478))))

(assert (=> d!23435 (= res!45215 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun e!57476 () ListLongMap!1465)

(assert (=> d!23435 (= lt!42169 e!57476)))

(declare-fun c!14573 () Bool)

(assert (=> d!23435 (= c!14573 (and (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23435 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23435 (= (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) lt!42162)))

(declare-fun b!88219 () Bool)

(declare-fun call!8494 () ListLongMap!1465)

(assert (=> b!88219 (= e!57476 (+!112 call!8494 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 newMap!16))))))

(declare-fun b!88220 () Bool)

(declare-fun e!57474 () Bool)

(assert (=> b!88220 (= e!57474 (= (apply!83 lt!42162 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2249 newMap!16)))))

(declare-fun b!88221 () Bool)

(declare-fun e!57477 () Bool)

(declare-fun call!8493 () Bool)

(assert (=> b!88221 (= e!57477 (not call!8493))))

(declare-fun b!88222 () Bool)

(declare-fun e!57470 () Bool)

(assert (=> b!88222 (= e!57470 (= (apply!83 lt!42162 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)) (get!1201 (select (arr!1926 (_values!2342 newMap!16)) #b00000000000000000000000000000000) (dynLambda!342 (defaultEntry!2359 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2171 (_values!2342 newMap!16))))))

(assert (=> b!88222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88223 () Bool)

(declare-fun e!57468 () Bool)

(declare-fun call!8491 () Bool)

(assert (=> b!88223 (= e!57468 (not call!8491))))

(declare-fun b!88224 () Bool)

(declare-fun e!57475 () Bool)

(assert (=> b!88224 (= e!57475 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88225 () Bool)

(declare-fun res!45212 () Bool)

(assert (=> b!88225 (=> (not res!45212) (not e!57480))))

(assert (=> b!88225 (= res!45212 e!57468)))

(declare-fun c!14575 () Bool)

(assert (=> b!88225 (= c!14575 (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8486 () Bool)

(declare-fun call!8495 () ListLongMap!1465)

(assert (=> bm!8486 (= call!8495 call!8494)))

(declare-fun b!88226 () Bool)

(declare-fun Unit!2612 () Unit!2600)

(assert (=> b!88226 (= e!57473 Unit!2612)))

(declare-fun b!88227 () Bool)

(declare-fun lt!42167 () Unit!2600)

(assert (=> b!88227 (= e!57473 lt!42167)))

(declare-fun lt!42168 () ListLongMap!1465)

(assert (=> b!88227 (= lt!42168 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42171 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42175 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42175 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42160 () Unit!2600)

(assert (=> b!88227 (= lt!42160 (addStillContains!59 lt!42168 lt!42171 (zeroValue!2249 newMap!16) lt!42175))))

(assert (=> b!88227 (contains!756 (+!112 lt!42168 (tuple2!2205 lt!42171 (zeroValue!2249 newMap!16))) lt!42175)))

(declare-fun lt!42174 () Unit!2600)

(assert (=> b!88227 (= lt!42174 lt!42160)))

(declare-fun lt!42157 () ListLongMap!1465)

(assert (=> b!88227 (= lt!42157 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42172 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42173 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42173 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42156 () Unit!2600)

(assert (=> b!88227 (= lt!42156 (addApplyDifferent!59 lt!42157 lt!42172 (minValue!2249 newMap!16) lt!42173))))

(assert (=> b!88227 (= (apply!83 (+!112 lt!42157 (tuple2!2205 lt!42172 (minValue!2249 newMap!16))) lt!42173) (apply!83 lt!42157 lt!42173))))

(declare-fun lt!42164 () Unit!2600)

(assert (=> b!88227 (= lt!42164 lt!42156)))

(declare-fun lt!42159 () ListLongMap!1465)

(assert (=> b!88227 (= lt!42159 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42154 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42154 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42166 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42166 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42161 () Unit!2600)

(assert (=> b!88227 (= lt!42161 (addApplyDifferent!59 lt!42159 lt!42154 (zeroValue!2249 newMap!16) lt!42166))))

(assert (=> b!88227 (= (apply!83 (+!112 lt!42159 (tuple2!2205 lt!42154 (zeroValue!2249 newMap!16))) lt!42166) (apply!83 lt!42159 lt!42166))))

(declare-fun lt!42155 () Unit!2600)

(assert (=> b!88227 (= lt!42155 lt!42161)))

(declare-fun lt!42165 () ListLongMap!1465)

(assert (=> b!88227 (= lt!42165 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42170 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42170 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42158 () (_ BitVec 64))

(assert (=> b!88227 (= lt!42158 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88227 (= lt!42167 (addApplyDifferent!59 lt!42165 lt!42170 (minValue!2249 newMap!16) lt!42158))))

(assert (=> b!88227 (= (apply!83 (+!112 lt!42165 (tuple2!2205 lt!42170 (minValue!2249 newMap!16))) lt!42158) (apply!83 lt!42165 lt!42158))))

(declare-fun b!88228 () Bool)

(declare-fun c!14572 () Bool)

(assert (=> b!88228 (= c!14572 (and (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57479 () ListLongMap!1465)

(declare-fun e!57471 () ListLongMap!1465)

(assert (=> b!88228 (= e!57479 e!57471)))

(declare-fun b!88229 () Bool)

(declare-fun e!57469 () Bool)

(assert (=> b!88229 (= e!57469 e!57470)))

(declare-fun res!45217 () Bool)

(assert (=> b!88229 (=> (not res!45217) (not e!57470))))

(assert (=> b!88229 (= res!45217 (contains!756 lt!42162 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88229 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88230 () Bool)

(declare-fun call!8489 () ListLongMap!1465)

(assert (=> b!88230 (= e!57471 call!8489)))

(declare-fun b!88231 () Bool)

(assert (=> b!88231 (= e!57468 e!57474)))

(declare-fun res!45213 () Bool)

(assert (=> b!88231 (= res!45213 call!8491)))

(assert (=> b!88231 (=> (not res!45213) (not e!57474))))

(declare-fun b!88232 () Bool)

(declare-fun e!57472 () Bool)

(assert (=> b!88232 (= e!57472 (= (apply!83 lt!42162 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2249 newMap!16)))))

(declare-fun bm!8487 () Bool)

(assert (=> bm!8487 (= call!8493 (contains!756 lt!42162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8488 () Bool)

(declare-fun call!8490 () ListLongMap!1465)

(assert (=> bm!8488 (= call!8490 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun bm!8489 () Bool)

(assert (=> bm!8489 (= call!8491 (contains!756 lt!42162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88233 () Bool)

(assert (=> b!88233 (= e!57479 call!8495)))

(declare-fun b!88234 () Bool)

(assert (=> b!88234 (= e!57476 e!57479)))

(declare-fun c!14577 () Bool)

(assert (=> b!88234 (= c!14577 (and (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88235 () Bool)

(declare-fun res!45211 () Bool)

(assert (=> b!88235 (=> (not res!45211) (not e!57480))))

(assert (=> b!88235 (= res!45211 e!57469)))

(declare-fun res!45216 () Bool)

(assert (=> b!88235 (=> res!45216 e!57469)))

(assert (=> b!88235 (= res!45216 (not e!57475))))

(declare-fun res!45209 () Bool)

(assert (=> b!88235 (=> (not res!45209) (not e!57475))))

(assert (=> b!88235 (= res!45209 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88236 () Bool)

(assert (=> b!88236 (= e!57480 e!57477)))

(declare-fun c!14576 () Bool)

(assert (=> b!88236 (= c!14576 (not (= (bvand (extraKeys!2194 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8490 () Bool)

(declare-fun call!8492 () ListLongMap!1465)

(assert (=> bm!8490 (= call!8494 (+!112 (ite c!14573 call!8490 (ite c!14577 call!8492 call!8489)) (ite (or c!14573 c!14577) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 newMap!16)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 newMap!16)))))))

(declare-fun b!88237 () Bool)

(assert (=> b!88237 (= e!57471 call!8495)))

(declare-fun bm!8491 () Bool)

(assert (=> bm!8491 (= call!8492 call!8490)))

(declare-fun b!88238 () Bool)

(assert (=> b!88238 (= e!57477 e!57472)))

(declare-fun res!45214 () Bool)

(assert (=> b!88238 (= res!45214 call!8493)))

(assert (=> b!88238 (=> (not res!45214) (not e!57472))))

(declare-fun bm!8492 () Bool)

(assert (=> bm!8492 (= call!8489 call!8492)))

(declare-fun b!88239 () Bool)

(assert (=> b!88239 (= e!57478 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23435 c!14573) b!88219))

(assert (= (and d!23435 (not c!14573)) b!88234))

(assert (= (and b!88234 c!14577) b!88233))

(assert (= (and b!88234 (not c!14577)) b!88228))

(assert (= (and b!88228 c!14572) b!88237))

(assert (= (and b!88228 (not c!14572)) b!88230))

(assert (= (or b!88237 b!88230) bm!8492))

(assert (= (or b!88233 bm!8492) bm!8491))

(assert (= (or b!88233 b!88237) bm!8486))

(assert (= (or b!88219 bm!8491) bm!8488))

(assert (= (or b!88219 bm!8486) bm!8490))

(assert (= (and d!23435 res!45215) b!88239))

(assert (= (and d!23435 c!14574) b!88227))

(assert (= (and d!23435 (not c!14574)) b!88226))

(assert (= (and d!23435 res!45210) b!88235))

(assert (= (and b!88235 res!45209) b!88224))

(assert (= (and b!88235 (not res!45216)) b!88229))

(assert (= (and b!88229 res!45217) b!88222))

(assert (= (and b!88235 res!45211) b!88225))

(assert (= (and b!88225 c!14575) b!88231))

(assert (= (and b!88225 (not c!14575)) b!88223))

(assert (= (and b!88231 res!45213) b!88220))

(assert (= (or b!88231 b!88223) bm!8489))

(assert (= (and b!88225 res!45212) b!88236))

(assert (= (and b!88236 c!14576) b!88238))

(assert (= (and b!88236 (not c!14576)) b!88221))

(assert (= (and b!88238 res!45214) b!88232))

(assert (= (or b!88238 b!88221) bm!8487))

(declare-fun b_lambda!3913 () Bool)

(assert (=> (not b_lambda!3913) (not b!88222)))

(declare-fun t!5271 () Bool)

(declare-fun tb!1717 () Bool)

(assert (=> (and b!87755 (= (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) (defaultEntry!2359 newMap!16)) t!5271) tb!1717))

(declare-fun result!2955 () Bool)

(assert (=> tb!1717 (= result!2955 tp_is_empty!2541)))

(assert (=> b!88222 t!5271))

(declare-fun b_and!5315 () Bool)

(assert (= b_and!5311 (and (=> t!5271 result!2955) b_and!5315)))

(declare-fun t!5273 () Bool)

(declare-fun tb!1719 () Bool)

(assert (=> (and b!87751 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 newMap!16)) t!5273) tb!1719))

(declare-fun result!2957 () Bool)

(assert (= result!2957 result!2955))

(assert (=> b!88222 t!5273))

(declare-fun b_and!5317 () Bool)

(assert (= b_and!5313 (and (=> t!5273 result!2957) b_and!5317)))

(declare-fun m!94255 () Bool)

(assert (=> bm!8489 m!94255))

(declare-fun m!94257 () Bool)

(assert (=> b!88222 m!94257))

(declare-fun m!94259 () Bool)

(assert (=> b!88222 m!94259))

(declare-fun m!94261 () Bool)

(assert (=> b!88222 m!94261))

(declare-fun m!94263 () Bool)

(assert (=> b!88222 m!94263))

(declare-fun m!94265 () Bool)

(assert (=> b!88222 m!94265))

(assert (=> b!88222 m!94257))

(assert (=> b!88222 m!94259))

(assert (=> b!88222 m!94263))

(declare-fun m!94267 () Bool)

(assert (=> b!88232 m!94267))

(declare-fun m!94269 () Bool)

(assert (=> bm!8488 m!94269))

(assert (=> b!88224 m!94263))

(assert (=> b!88224 m!94263))

(declare-fun m!94271 () Bool)

(assert (=> b!88224 m!94271))

(declare-fun m!94273 () Bool)

(assert (=> b!88220 m!94273))

(declare-fun m!94275 () Bool)

(assert (=> b!88219 m!94275))

(assert (=> b!88229 m!94263))

(assert (=> b!88229 m!94263))

(declare-fun m!94277 () Bool)

(assert (=> b!88229 m!94277))

(declare-fun m!94279 () Bool)

(assert (=> b!88227 m!94279))

(declare-fun m!94281 () Bool)

(assert (=> b!88227 m!94281))

(declare-fun m!94283 () Bool)

(assert (=> b!88227 m!94283))

(declare-fun m!94285 () Bool)

(assert (=> b!88227 m!94285))

(declare-fun m!94287 () Bool)

(assert (=> b!88227 m!94287))

(declare-fun m!94289 () Bool)

(assert (=> b!88227 m!94289))

(assert (=> b!88227 m!94283))

(declare-fun m!94291 () Bool)

(assert (=> b!88227 m!94291))

(declare-fun m!94293 () Bool)

(assert (=> b!88227 m!94293))

(assert (=> b!88227 m!94263))

(declare-fun m!94295 () Bool)

(assert (=> b!88227 m!94295))

(declare-fun m!94297 () Bool)

(assert (=> b!88227 m!94297))

(declare-fun m!94299 () Bool)

(assert (=> b!88227 m!94299))

(assert (=> b!88227 m!94269))

(assert (=> b!88227 m!94279))

(assert (=> b!88227 m!94297))

(assert (=> b!88227 m!94289))

(declare-fun m!94301 () Bool)

(assert (=> b!88227 m!94301))

(declare-fun m!94303 () Bool)

(assert (=> b!88227 m!94303))

(declare-fun m!94305 () Bool)

(assert (=> b!88227 m!94305))

(declare-fun m!94307 () Bool)

(assert (=> b!88227 m!94307))

(assert (=> d!23435 m!94251))

(declare-fun m!94309 () Bool)

(assert (=> bm!8490 m!94309))

(declare-fun m!94311 () Bool)

(assert (=> bm!8487 m!94311))

(assert (=> b!88239 m!94263))

(assert (=> b!88239 m!94263))

(assert (=> b!88239 m!94271))

(assert (=> b!87925 d!23435))

(assert (=> b!88078 d!23405))

(declare-fun d!23437 () Bool)

(declare-fun e!57481 () Bool)

(assert (=> d!23437 e!57481))

(declare-fun res!45218 () Bool)

(assert (=> d!23437 (=> (not res!45218) (not e!57481))))

(declare-fun lt!42177 () ListLongMap!1465)

(assert (=> d!23437 (= res!45218 (contains!756 lt!42177 (_1!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun lt!42178 () List!1522)

(assert (=> d!23437 (= lt!42177 (ListLongMap!1466 lt!42178))))

(declare-fun lt!42179 () Unit!2600)

(declare-fun lt!42176 () Unit!2600)

(assert (=> d!23437 (= lt!42179 lt!42176)))

(assert (=> d!23437 (= (getValueByKey!141 lt!42178 (_1!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))) (Some!146 (_2!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(assert (=> d!23437 (= lt!42176 (lemmaContainsTupThenGetReturnValue!58 lt!42178 (_1!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (_2!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(assert (=> d!23437 (= lt!42178 (insertStrictlySorted!61 (toList!748 (ite c!14532 call!8465 (ite c!14536 call!8467 call!8464))) (_1!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (_2!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(assert (=> d!23437 (= (+!112 (ite c!14532 call!8465 (ite c!14536 call!8467 call!8464)) (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!42177)))

(declare-fun b!88240 () Bool)

(declare-fun res!45219 () Bool)

(assert (=> b!88240 (=> (not res!45219) (not e!57481))))

(assert (=> b!88240 (= res!45219 (= (getValueByKey!141 (toList!748 lt!42177) (_1!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))) (Some!146 (_2!1113 (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))))

(declare-fun b!88241 () Bool)

(assert (=> b!88241 (= e!57481 (contains!757 (toList!748 lt!42177) (ite (or c!14532 c!14536) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (= (and d!23437 res!45218) b!88240))

(assert (= (and b!88240 res!45219) b!88241))

(declare-fun m!94313 () Bool)

(assert (=> d!23437 m!94313))

(declare-fun m!94315 () Bool)

(assert (=> d!23437 m!94315))

(declare-fun m!94317 () Bool)

(assert (=> d!23437 m!94317))

(declare-fun m!94319 () Bool)

(assert (=> d!23437 m!94319))

(declare-fun m!94321 () Bool)

(assert (=> b!88240 m!94321))

(declare-fun m!94323 () Bool)

(assert (=> b!88241 m!94323))

(assert (=> bm!8465 d!23437))

(assert (=> d!23397 d!23403))

(declare-fun d!23439 () Bool)

(assert (=> d!23439 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) from!355 Nil!1520)))

(assert (=> d!23439 true))

(declare-fun _$71!117 () Unit!2600)

(assert (=> d!23439 (= (choose!39 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!117)))

(declare-fun bs!3727 () Bool)

(assert (= bs!3727 d!23439))

(assert (=> bs!3727 m!93715))

(assert (=> d!23397 d!23439))

(assert (=> d!23359 d!23383))

(assert (=> b!88116 d!23399))

(declare-fun d!23441 () Bool)

(assert (=> d!23441 (= (get!1202 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2660 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> b!88041 d!23441))

(declare-fun b!88254 () Bool)

(declare-fun c!14586 () Bool)

(declare-fun lt!42186 () (_ BitVec 64))

(assert (=> b!88254 (= c!14586 (= lt!42186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57488 () SeekEntryResult!244)

(declare-fun e!57490 () SeekEntryResult!244)

(assert (=> b!88254 (= e!57488 e!57490)))

(declare-fun lt!42188 () SeekEntryResult!244)

(declare-fun b!88255 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4043 (_ BitVec 32)) SeekEntryResult!244)

(assert (=> b!88255 (= e!57490 (seekKeyOrZeroReturnVacant!0 (x!12141 lt!42188) (index!3116 lt!42188) (index!3116 lt!42188) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun b!88256 () Bool)

(declare-fun e!57489 () SeekEntryResult!244)

(assert (=> b!88256 (= e!57489 e!57488)))

(assert (=> b!88256 (= lt!42186 (select (arr!1925 (_keys!4035 newMap!16)) (index!3116 lt!42188)))))

(declare-fun c!14584 () Bool)

(assert (=> b!88256 (= c!14584 (= lt!42186 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88257 () Bool)

(assert (=> b!88257 (= e!57490 (MissingZero!244 (index!3116 lt!42188)))))

(declare-fun b!88258 () Bool)

(assert (=> b!88258 (= e!57489 Undefined!244)))

(declare-fun d!23443 () Bool)

(declare-fun lt!42187 () SeekEntryResult!244)

(assert (=> d!23443 (and (or ((_ is Undefined!244) lt!42187) (not ((_ is Found!244) lt!42187)) (and (bvsge (index!3115 lt!42187) #b00000000000000000000000000000000) (bvslt (index!3115 lt!42187) (size!2170 (_keys!4035 newMap!16))))) (or ((_ is Undefined!244) lt!42187) ((_ is Found!244) lt!42187) (not ((_ is MissingZero!244) lt!42187)) (and (bvsge (index!3114 lt!42187) #b00000000000000000000000000000000) (bvslt (index!3114 lt!42187) (size!2170 (_keys!4035 newMap!16))))) (or ((_ is Undefined!244) lt!42187) ((_ is Found!244) lt!42187) ((_ is MissingZero!244) lt!42187) (not ((_ is MissingVacant!244) lt!42187)) (and (bvsge (index!3117 lt!42187) #b00000000000000000000000000000000) (bvslt (index!3117 lt!42187) (size!2170 (_keys!4035 newMap!16))))) (or ((_ is Undefined!244) lt!42187) (ite ((_ is Found!244) lt!42187) (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!42187)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (ite ((_ is MissingZero!244) lt!42187) (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3114 lt!42187)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!244) lt!42187) (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3117 lt!42187)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23443 (= lt!42187 e!57489)))

(declare-fun c!14585 () Bool)

(assert (=> d!23443 (= c!14585 (and ((_ is Intermediate!244) lt!42188) (undefined!1056 lt!42188)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4043 (_ BitVec 32)) SeekEntryResult!244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23443 (= lt!42188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (mask!6397 newMap!16)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(assert (=> d!23443 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23443 (= (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)) lt!42187)))

(declare-fun b!88259 () Bool)

(assert (=> b!88259 (= e!57488 (Found!244 (index!3116 lt!42188)))))

(assert (= (and d!23443 c!14585) b!88258))

(assert (= (and d!23443 (not c!14585)) b!88256))

(assert (= (and b!88256 c!14584) b!88259))

(assert (= (and b!88256 (not c!14584)) b!88254))

(assert (= (and b!88254 c!14586) b!88257))

(assert (= (and b!88254 (not c!14586)) b!88255))

(assert (=> b!88255 m!93699))

(declare-fun m!94325 () Bool)

(assert (=> b!88255 m!94325))

(declare-fun m!94327 () Bool)

(assert (=> b!88256 m!94327))

(assert (=> d!23443 m!93699))

(declare-fun m!94329 () Bool)

(assert (=> d!23443 m!94329))

(declare-fun m!94331 () Bool)

(assert (=> d!23443 m!94331))

(declare-fun m!94333 () Bool)

(assert (=> d!23443 m!94333))

(declare-fun m!94335 () Bool)

(assert (=> d!23443 m!94335))

(assert (=> d!23443 m!94329))

(assert (=> d!23443 m!93699))

(declare-fun m!94337 () Bool)

(assert (=> d!23443 m!94337))

(assert (=> d!23443 m!94251))

(assert (=> bm!8425 d!23443))

(declare-fun d!23445 () Bool)

(declare-fun e!57492 () Bool)

(assert (=> d!23445 e!57492))

(declare-fun res!45220 () Bool)

(assert (=> d!23445 (=> res!45220 e!57492)))

(declare-fun lt!42192 () Bool)

(assert (=> d!23445 (= res!45220 (not lt!42192))))

(declare-fun lt!42189 () Bool)

(assert (=> d!23445 (= lt!42192 lt!42189)))

(declare-fun lt!42190 () Unit!2600)

(declare-fun e!57491 () Unit!2600)

(assert (=> d!23445 (= lt!42190 e!57491)))

(declare-fun c!14587 () Bool)

(assert (=> d!23445 (= c!14587 lt!42189)))

(assert (=> d!23445 (= lt!42189 (containsKey!145 (toList!748 lt!41956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23445 (= (contains!756 lt!41956 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42192)))

(declare-fun b!88260 () Bool)

(declare-fun lt!42191 () Unit!2600)

(assert (=> b!88260 (= e!57491 lt!42191)))

(assert (=> b!88260 (= lt!42191 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88260 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88261 () Bool)

(declare-fun Unit!2613 () Unit!2600)

(assert (=> b!88261 (= e!57491 Unit!2613)))

(declare-fun b!88262 () Bool)

(assert (=> b!88262 (= e!57492 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23445 c!14587) b!88260))

(assert (= (and d!23445 (not c!14587)) b!88261))

(assert (= (and d!23445 (not res!45220)) b!88262))

(declare-fun m!94339 () Bool)

(assert (=> d!23445 m!94339))

(declare-fun m!94341 () Bool)

(assert (=> b!88260 m!94341))

(declare-fun m!94343 () Bool)

(assert (=> b!88260 m!94343))

(assert (=> b!88260 m!94343))

(declare-fun m!94345 () Bool)

(assert (=> b!88260 m!94345))

(assert (=> b!88262 m!94343))

(assert (=> b!88262 m!94343))

(assert (=> b!88262 m!94345))

(assert (=> bm!8462 d!23445))

(declare-fun d!23447 () Bool)

(declare-fun e!57493 () Bool)

(assert (=> d!23447 e!57493))

(declare-fun res!45221 () Bool)

(assert (=> d!23447 (=> (not res!45221) (not e!57493))))

(declare-fun lt!42194 () ListLongMap!1465)

(assert (=> d!23447 (= res!45221 (contains!756 lt!42194 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42195 () List!1522)

(assert (=> d!23447 (= lt!42194 (ListLongMap!1466 lt!42195))))

(declare-fun lt!42196 () Unit!2600)

(declare-fun lt!42193 () Unit!2600)

(assert (=> d!23447 (= lt!42196 lt!42193)))

(assert (=> d!23447 (= (getValueByKey!141 lt!42195 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23447 (= lt!42193 (lemmaContainsTupThenGetReturnValue!58 lt!42195 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23447 (= lt!42195 (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23447 (= (+!112 lt!41747 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42194)))

(declare-fun b!88263 () Bool)

(declare-fun res!45222 () Bool)

(assert (=> b!88263 (=> (not res!45222) (not e!57493))))

(assert (=> b!88263 (= res!45222 (= (getValueByKey!141 (toList!748 lt!42194) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88264 () Bool)

(assert (=> b!88264 (= e!57493 (contains!757 (toList!748 lt!42194) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23447 res!45221) b!88263))

(assert (= (and b!88263 res!45222) b!88264))

(declare-fun m!94347 () Bool)

(assert (=> d!23447 m!94347))

(declare-fun m!94349 () Bool)

(assert (=> d!23447 m!94349))

(declare-fun m!94351 () Bool)

(assert (=> d!23447 m!94351))

(declare-fun m!94353 () Bool)

(assert (=> d!23447 m!94353))

(declare-fun m!94355 () Bool)

(assert (=> b!88263 m!94355))

(declare-fun m!94357 () Bool)

(assert (=> b!88264 m!94357))

(assert (=> d!23387 d!23447))

(declare-fun d!23449 () Bool)

(declare-fun e!57494 () Bool)

(assert (=> d!23449 e!57494))

(declare-fun res!45223 () Bool)

(assert (=> d!23449 (=> (not res!45223) (not e!57494))))

(declare-fun lt!42198 () ListLongMap!1465)

(assert (=> d!23449 (= res!45223 (contains!756 lt!42198 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun lt!42199 () List!1522)

(assert (=> d!23449 (= lt!42198 (ListLongMap!1466 lt!42199))))

(declare-fun lt!42200 () Unit!2600)

(declare-fun lt!42197 () Unit!2600)

(assert (=> d!23449 (= lt!42200 lt!42197)))

(assert (=> d!23449 (= (getValueByKey!141 lt!42199 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23449 (= lt!42197 (lemmaContainsTupThenGetReturnValue!58 lt!42199 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23449 (= lt!42199 (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23449 (= (+!112 lt!41747 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) lt!42198)))

(declare-fun b!88265 () Bool)

(declare-fun res!45224 () Bool)

(assert (=> b!88265 (=> (not res!45224) (not e!57494))))

(assert (=> b!88265 (= res!45224 (= (getValueByKey!141 (toList!748 lt!42198) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun b!88266 () Bool)

(assert (=> b!88266 (= e!57494 (contains!757 (toList!748 lt!42198) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (= (and d!23449 res!45223) b!88265))

(assert (= (and b!88265 res!45224) b!88266))

(declare-fun m!94359 () Bool)

(assert (=> d!23449 m!94359))

(declare-fun m!94361 () Bool)

(assert (=> d!23449 m!94361))

(declare-fun m!94363 () Bool)

(assert (=> d!23449 m!94363))

(declare-fun m!94365 () Bool)

(assert (=> d!23449 m!94365))

(declare-fun m!94367 () Bool)

(assert (=> b!88265 m!94367))

(declare-fun m!94369 () Bool)

(assert (=> b!88266 m!94369))

(assert (=> d!23387 d!23449))

(declare-fun d!23451 () Bool)

(assert (=> d!23451 (= (+!112 (+!112 lt!41747 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (+!112 (+!112 lt!41747 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (=> d!23451 true))

(declare-fun _$28!146 () Unit!2600)

(assert (=> d!23451 (= (choose!513 lt!41747 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))) _$28!146)))

(declare-fun bs!3728 () Bool)

(assert (= bs!3728 d!23451))

(assert (=> bs!3728 m!94081))

(assert (=> bs!3728 m!94081))

(assert (=> bs!3728 m!94085))

(assert (=> bs!3728 m!94083))

(assert (=> bs!3728 m!94083))

(assert (=> bs!3728 m!94087))

(assert (=> d!23387 d!23451))

(declare-fun d!23453 () Bool)

(declare-fun e!57495 () Bool)

(assert (=> d!23453 e!57495))

(declare-fun res!45225 () Bool)

(assert (=> d!23453 (=> (not res!45225) (not e!57495))))

(declare-fun lt!42202 () ListLongMap!1465)

(assert (=> d!23453 (= res!45225 (contains!756 lt!42202 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42203 () List!1522)

(assert (=> d!23453 (= lt!42202 (ListLongMap!1466 lt!42203))))

(declare-fun lt!42204 () Unit!2600)

(declare-fun lt!42201 () Unit!2600)

(assert (=> d!23453 (= lt!42204 lt!42201)))

(assert (=> d!23453 (= (getValueByKey!141 lt!42203 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23453 (= lt!42201 (lemmaContainsTupThenGetReturnValue!58 lt!42203 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23453 (= lt!42203 (insertStrictlySorted!61 (toList!748 (+!112 lt!41747 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23453 (= (+!112 (+!112 lt!41747 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42202)))

(declare-fun b!88267 () Bool)

(declare-fun res!45226 () Bool)

(assert (=> b!88267 (=> (not res!45226) (not e!57495))))

(assert (=> b!88267 (= res!45226 (= (getValueByKey!141 (toList!748 lt!42202) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88268 () Bool)

(assert (=> b!88268 (= e!57495 (contains!757 (toList!748 lt!42202) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23453 res!45225) b!88267))

(assert (= (and b!88267 res!45226) b!88268))

(declare-fun m!94371 () Bool)

(assert (=> d!23453 m!94371))

(declare-fun m!94373 () Bool)

(assert (=> d!23453 m!94373))

(declare-fun m!94375 () Bool)

(assert (=> d!23453 m!94375))

(declare-fun m!94377 () Bool)

(assert (=> d!23453 m!94377))

(declare-fun m!94379 () Bool)

(assert (=> b!88267 m!94379))

(declare-fun m!94381 () Bool)

(assert (=> b!88268 m!94381))

(assert (=> d!23387 d!23453))

(declare-fun d!23455 () Bool)

(declare-fun e!57496 () Bool)

(assert (=> d!23455 e!57496))

(declare-fun res!45227 () Bool)

(assert (=> d!23455 (=> (not res!45227) (not e!57496))))

(declare-fun lt!42206 () ListLongMap!1465)

(assert (=> d!23455 (= res!45227 (contains!756 lt!42206 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun lt!42207 () List!1522)

(assert (=> d!23455 (= lt!42206 (ListLongMap!1466 lt!42207))))

(declare-fun lt!42208 () Unit!2600)

(declare-fun lt!42205 () Unit!2600)

(assert (=> d!23455 (= lt!42208 lt!42205)))

(assert (=> d!23455 (= (getValueByKey!141 lt!42207 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23455 (= lt!42205 (lemmaContainsTupThenGetReturnValue!58 lt!42207 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23455 (= lt!42207 (insertStrictlySorted!61 (toList!748 (+!112 lt!41747 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23455 (= (+!112 (+!112 lt!41747 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) lt!42206)))

(declare-fun b!88269 () Bool)

(declare-fun res!45228 () Bool)

(assert (=> b!88269 (=> (not res!45228) (not e!57496))))

(assert (=> b!88269 (= res!45228 (= (getValueByKey!141 (toList!748 lt!42206) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun b!88270 () Bool)

(assert (=> b!88270 (= e!57496 (contains!757 (toList!748 lt!42206) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (= (and d!23455 res!45227) b!88269))

(assert (= (and b!88269 res!45228) b!88270))

(declare-fun m!94383 () Bool)

(assert (=> d!23455 m!94383))

(declare-fun m!94385 () Bool)

(assert (=> d!23455 m!94385))

(declare-fun m!94387 () Bool)

(assert (=> d!23455 m!94387))

(declare-fun m!94389 () Bool)

(assert (=> d!23455 m!94389))

(declare-fun m!94391 () Bool)

(assert (=> b!88269 m!94391))

(declare-fun m!94393 () Bool)

(assert (=> b!88270 m!94393))

(assert (=> d!23387 d!23455))

(declare-fun d!23457 () Bool)

(declare-fun lt!42209 () Bool)

(assert (=> d!23457 (= lt!42209 (select (content!91 (toList!748 lt!42023)) lt!41735))))

(declare-fun e!57497 () Bool)

(assert (=> d!23457 (= lt!42209 e!57497)))

(declare-fun res!45230 () Bool)

(assert (=> d!23457 (=> (not res!45230) (not e!57497))))

(assert (=> d!23457 (= res!45230 ((_ is Cons!1518) (toList!748 lt!42023)))))

(assert (=> d!23457 (= (contains!757 (toList!748 lt!42023) lt!41735) lt!42209)))

(declare-fun b!88271 () Bool)

(declare-fun e!57498 () Bool)

(assert (=> b!88271 (= e!57497 e!57498)))

(declare-fun res!45229 () Bool)

(assert (=> b!88271 (=> res!45229 e!57498)))

(assert (=> b!88271 (= res!45229 (= (h!2110 (toList!748 lt!42023)) lt!41735))))

(declare-fun b!88272 () Bool)

(assert (=> b!88272 (= e!57498 (contains!757 (t!5264 (toList!748 lt!42023)) lt!41735))))

(assert (= (and d!23457 res!45230) b!88271))

(assert (= (and b!88271 (not res!45229)) b!88272))

(declare-fun m!94395 () Bool)

(assert (=> d!23457 m!94395))

(declare-fun m!94397 () Bool)

(assert (=> d!23457 m!94397))

(declare-fun m!94399 () Bool)

(assert (=> b!88272 m!94399))

(assert (=> b!88094 d!23457))

(declare-fun d!23459 () Bool)

(declare-fun e!57500 () Bool)

(assert (=> d!23459 e!57500))

(declare-fun res!45231 () Bool)

(assert (=> d!23459 (=> res!45231 e!57500)))

(declare-fun lt!42213 () Bool)

(assert (=> d!23459 (= res!45231 (not lt!42213))))

(declare-fun lt!42210 () Bool)

(assert (=> d!23459 (= lt!42213 lt!42210)))

(declare-fun lt!42211 () Unit!2600)

(declare-fun e!57499 () Unit!2600)

(assert (=> d!23459 (= lt!42211 e!57499)))

(declare-fun c!14588 () Bool)

(assert (=> d!23459 (= c!14588 lt!42210)))

(assert (=> d!23459 (= lt!42210 (containsKey!145 (toList!748 lt!41983) (_1!1113 lt!41735)))))

(assert (=> d!23459 (= (contains!756 lt!41983 (_1!1113 lt!41735)) lt!42213)))

(declare-fun b!88273 () Bool)

(declare-fun lt!42212 () Unit!2600)

(assert (=> b!88273 (= e!57499 lt!42212)))

(assert (=> b!88273 (= lt!42212 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41983) (_1!1113 lt!41735)))))

(assert (=> b!88273 (isDefined!94 (getValueByKey!141 (toList!748 lt!41983) (_1!1113 lt!41735)))))

(declare-fun b!88274 () Bool)

(declare-fun Unit!2614 () Unit!2600)

(assert (=> b!88274 (= e!57499 Unit!2614)))

(declare-fun b!88275 () Bool)

(assert (=> b!88275 (= e!57500 (isDefined!94 (getValueByKey!141 (toList!748 lt!41983) (_1!1113 lt!41735))))))

(assert (= (and d!23459 c!14588) b!88273))

(assert (= (and d!23459 (not c!14588)) b!88274))

(assert (= (and d!23459 (not res!45231)) b!88275))

(declare-fun m!94401 () Bool)

(assert (=> d!23459 m!94401))

(declare-fun m!94403 () Bool)

(assert (=> b!88273 m!94403))

(assert (=> b!88273 m!93985))

(assert (=> b!88273 m!93985))

(declare-fun m!94405 () Bool)

(assert (=> b!88273 m!94405))

(assert (=> b!88275 m!93985))

(assert (=> b!88275 m!93985))

(assert (=> b!88275 m!94405))

(assert (=> d!23369 d!23459))

(declare-fun b!88284 () Bool)

(declare-fun e!57505 () Option!147)

(assert (=> b!88284 (= e!57505 (Some!146 (_2!1113 (h!2110 lt!41984))))))

(declare-fun b!88285 () Bool)

(declare-fun e!57506 () Option!147)

(assert (=> b!88285 (= e!57505 e!57506)))

(declare-fun c!14594 () Bool)

(assert (=> b!88285 (= c!14594 (and ((_ is Cons!1518) lt!41984) (not (= (_1!1113 (h!2110 lt!41984)) (_1!1113 lt!41735)))))))

(declare-fun d!23461 () Bool)

(declare-fun c!14593 () Bool)

(assert (=> d!23461 (= c!14593 (and ((_ is Cons!1518) lt!41984) (= (_1!1113 (h!2110 lt!41984)) (_1!1113 lt!41735))))))

(assert (=> d!23461 (= (getValueByKey!141 lt!41984 (_1!1113 lt!41735)) e!57505)))

(declare-fun b!88286 () Bool)

(assert (=> b!88286 (= e!57506 (getValueByKey!141 (t!5264 lt!41984) (_1!1113 lt!41735)))))

(declare-fun b!88287 () Bool)

(assert (=> b!88287 (= e!57506 None!145)))

(assert (= (and d!23461 c!14593) b!88284))

(assert (= (and d!23461 (not c!14593)) b!88285))

(assert (= (and b!88285 c!14594) b!88286))

(assert (= (and b!88285 (not c!14594)) b!88287))

(declare-fun m!94407 () Bool)

(assert (=> b!88286 m!94407))

(assert (=> d!23369 d!23461))

(declare-fun d!23463 () Bool)

(assert (=> d!23463 (= (getValueByKey!141 lt!41984 (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735)))))

(declare-fun lt!42216 () Unit!2600)

(declare-fun choose!517 (List!1522 (_ BitVec 64) V!3035) Unit!2600)

(assert (=> d!23463 (= lt!42216 (choose!517 lt!41984 (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(declare-fun e!57509 () Bool)

(assert (=> d!23463 e!57509))

(declare-fun res!45236 () Bool)

(assert (=> d!23463 (=> (not res!45236) (not e!57509))))

(declare-fun isStrictlySorted!299 (List!1522) Bool)

(assert (=> d!23463 (= res!45236 (isStrictlySorted!299 lt!41984))))

(assert (=> d!23463 (= (lemmaContainsTupThenGetReturnValue!58 lt!41984 (_1!1113 lt!41735) (_2!1113 lt!41735)) lt!42216)))

(declare-fun b!88292 () Bool)

(declare-fun res!45237 () Bool)

(assert (=> b!88292 (=> (not res!45237) (not e!57509))))

(assert (=> b!88292 (= res!45237 (containsKey!145 lt!41984 (_1!1113 lt!41735)))))

(declare-fun b!88293 () Bool)

(assert (=> b!88293 (= e!57509 (contains!757 lt!41984 (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735))))))

(assert (= (and d!23463 res!45236) b!88292))

(assert (= (and b!88292 res!45237) b!88293))

(assert (=> d!23463 m!93979))

(declare-fun m!94409 () Bool)

(assert (=> d!23463 m!94409))

(declare-fun m!94411 () Bool)

(assert (=> d!23463 m!94411))

(declare-fun m!94413 () Bool)

(assert (=> b!88292 m!94413))

(declare-fun m!94415 () Bool)

(assert (=> b!88293 m!94415))

(assert (=> d!23369 d!23463))

(declare-fun e!57524 () List!1522)

(declare-fun call!8504 () List!1522)

(declare-fun bm!8499 () Bool)

(declare-fun c!14604 () Bool)

(declare-fun $colon$colon!73 (List!1522 tuple2!2204) List!1522)

(assert (=> bm!8499 (= call!8504 ($colon$colon!73 e!57524 (ite c!14604 (h!2110 (toList!748 lt!41747)) (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735)))))))

(declare-fun c!14606 () Bool)

(assert (=> bm!8499 (= c!14606 c!14604)))

(declare-fun b!88314 () Bool)

(declare-fun c!14605 () Bool)

(assert (=> b!88314 (= c!14605 (and ((_ is Cons!1518) (toList!748 lt!41747)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41735))))))

(declare-fun e!57520 () List!1522)

(declare-fun e!57522 () List!1522)

(assert (=> b!88314 (= e!57520 e!57522)))

(declare-fun b!88315 () Bool)

(declare-fun e!57521 () List!1522)

(assert (=> b!88315 (= e!57521 e!57520)))

(declare-fun c!14603 () Bool)

(assert (=> b!88315 (= c!14603 (and ((_ is Cons!1518) (toList!748 lt!41747)) (= (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41735))))))

(declare-fun b!88316 () Bool)

(declare-fun call!8503 () List!1522)

(assert (=> b!88316 (= e!57522 call!8503)))

(declare-fun b!88317 () Bool)

(declare-fun res!45243 () Bool)

(declare-fun e!57523 () Bool)

(assert (=> b!88317 (=> (not res!45243) (not e!57523))))

(declare-fun lt!42219 () List!1522)

(assert (=> b!88317 (= res!45243 (containsKey!145 lt!42219 (_1!1113 lt!41735)))))

(declare-fun b!88318 () Bool)

(assert (=> b!88318 (= e!57522 call!8503)))

(declare-fun d!23465 () Bool)

(assert (=> d!23465 e!57523))

(declare-fun res!45242 () Bool)

(assert (=> d!23465 (=> (not res!45242) (not e!57523))))

(assert (=> d!23465 (= res!45242 (isStrictlySorted!299 lt!42219))))

(assert (=> d!23465 (= lt!42219 e!57521)))

(assert (=> d!23465 (= c!14604 (and ((_ is Cons!1518) (toList!748 lt!41747)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41735))))))

(assert (=> d!23465 (isStrictlySorted!299 (toList!748 lt!41747))))

(assert (=> d!23465 (= (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 lt!41735) (_2!1113 lt!41735)) lt!42219)))

(declare-fun b!88319 () Bool)

(declare-fun call!8502 () List!1522)

(assert (=> b!88319 (= e!57520 call!8502)))

(declare-fun b!88320 () Bool)

(assert (=> b!88320 (= e!57524 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41747)) (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(declare-fun bm!8500 () Bool)

(assert (=> bm!8500 (= call!8502 call!8504)))

(declare-fun b!88321 () Bool)

(assert (=> b!88321 (= e!57523 (contains!757 lt!42219 (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735))))))

(declare-fun b!88322 () Bool)

(assert (=> b!88322 (= e!57524 (ite c!14603 (t!5264 (toList!748 lt!41747)) (ite c!14605 (Cons!1518 (h!2110 (toList!748 lt!41747)) (t!5264 (toList!748 lt!41747))) Nil!1519)))))

(declare-fun bm!8501 () Bool)

(assert (=> bm!8501 (= call!8503 call!8502)))

(declare-fun b!88323 () Bool)

(assert (=> b!88323 (= e!57521 call!8504)))

(assert (= (and d!23465 c!14604) b!88323))

(assert (= (and d!23465 (not c!14604)) b!88315))

(assert (= (and b!88315 c!14603) b!88319))

(assert (= (and b!88315 (not c!14603)) b!88314))

(assert (= (and b!88314 c!14605) b!88316))

(assert (= (and b!88314 (not c!14605)) b!88318))

(assert (= (or b!88316 b!88318) bm!8501))

(assert (= (or b!88319 bm!8501) bm!8500))

(assert (= (or b!88323 bm!8500) bm!8499))

(assert (= (and bm!8499 c!14606) b!88320))

(assert (= (and bm!8499 (not c!14606)) b!88322))

(assert (= (and d!23465 res!45242) b!88317))

(assert (= (and b!88317 res!45243) b!88321))

(declare-fun m!94417 () Bool)

(assert (=> b!88317 m!94417))

(declare-fun m!94419 () Bool)

(assert (=> bm!8499 m!94419))

(declare-fun m!94421 () Bool)

(assert (=> b!88320 m!94421))

(declare-fun m!94423 () Bool)

(assert (=> b!88321 m!94423))

(declare-fun m!94425 () Bool)

(assert (=> d!23465 m!94425))

(declare-fun m!94427 () Bool)

(assert (=> d!23465 m!94427))

(assert (=> d!23369 d!23465))

(declare-fun d!23467 () Bool)

(declare-fun res!45248 () Bool)

(declare-fun e!57529 () Bool)

(assert (=> d!23467 (=> res!45248 e!57529)))

(assert (=> d!23467 (= res!45248 (and ((_ is Cons!1518) (toList!748 lt!41740)) (= (_1!1113 (h!2110 (toList!748 lt!41740))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (=> d!23467 (= (containsKey!145 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) e!57529)))

(declare-fun b!88328 () Bool)

(declare-fun e!57530 () Bool)

(assert (=> b!88328 (= e!57529 e!57530)))

(declare-fun res!45249 () Bool)

(assert (=> b!88328 (=> (not res!45249) (not e!57530))))

(assert (=> b!88328 (= res!45249 (and (or (not ((_ is Cons!1518) (toList!748 lt!41740))) (bvsle (_1!1113 (h!2110 (toList!748 lt!41740))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))) ((_ is Cons!1518) (toList!748 lt!41740)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41740))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(declare-fun b!88329 () Bool)

(assert (=> b!88329 (= e!57530 (containsKey!145 (t!5264 (toList!748 lt!41740)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (= (and d!23467 (not res!45248)) b!88328))

(assert (= (and b!88328 res!45249) b!88329))

(assert (=> b!88329 m!93699))

(declare-fun m!94429 () Bool)

(assert (=> b!88329 m!94429))

(assert (=> d!23349 d!23467))

(declare-fun d!23469 () Bool)

(declare-fun lt!42220 () Bool)

(assert (=> d!23469 (= lt!42220 (select (content!91 (toList!748 lt!42016)) lt!41744))))

(declare-fun e!57531 () Bool)

(assert (=> d!23469 (= lt!42220 e!57531)))

(declare-fun res!45251 () Bool)

(assert (=> d!23469 (=> (not res!45251) (not e!57531))))

(assert (=> d!23469 (= res!45251 ((_ is Cons!1518) (toList!748 lt!42016)))))

(assert (=> d!23469 (= (contains!757 (toList!748 lt!42016) lt!41744) lt!42220)))

(declare-fun b!88330 () Bool)

(declare-fun e!57532 () Bool)

(assert (=> b!88330 (= e!57531 e!57532)))

(declare-fun res!45250 () Bool)

(assert (=> b!88330 (=> res!45250 e!57532)))

(assert (=> b!88330 (= res!45250 (= (h!2110 (toList!748 lt!42016)) lt!41744))))

(declare-fun b!88331 () Bool)

(assert (=> b!88331 (= e!57532 (contains!757 (t!5264 (toList!748 lt!42016)) lt!41744))))

(assert (= (and d!23469 res!45251) b!88330))

(assert (= (and b!88330 (not res!45250)) b!88331))

(declare-fun m!94431 () Bool)

(assert (=> d!23469 m!94431))

(declare-fun m!94433 () Bool)

(assert (=> d!23469 m!94433))

(declare-fun m!94435 () Bool)

(assert (=> b!88331 m!94435))

(assert (=> b!88092 d!23469))

(assert (=> b!87949 d!23443))

(declare-fun d!23471 () Bool)

(declare-fun e!57533 () Bool)

(assert (=> d!23471 e!57533))

(declare-fun res!45252 () Bool)

(assert (=> d!23471 (=> (not res!45252) (not e!57533))))

(declare-fun lt!42222 () ListLongMap!1465)

(assert (=> d!23471 (= res!45252 (contains!756 lt!42222 (_1!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun lt!42223 () List!1522)

(assert (=> d!23471 (= lt!42222 (ListLongMap!1466 lt!42223))))

(declare-fun lt!42224 () Unit!2600)

(declare-fun lt!42221 () Unit!2600)

(assert (=> d!23471 (= lt!42224 lt!42221)))

(assert (=> d!23471 (= (getValueByKey!141 lt!42223 (_1!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))) (Some!146 (_2!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(assert (=> d!23471 (= lt!42221 (lemmaContainsTupThenGetReturnValue!58 lt!42223 (_1!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (_2!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(assert (=> d!23471 (= lt!42223 (insertStrictlySorted!61 (toList!748 e!57305) (_1!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (_2!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(assert (=> d!23471 (= (+!112 e!57305 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) lt!42222)))

(declare-fun b!88332 () Bool)

(declare-fun res!45253 () Bool)

(assert (=> b!88332 (=> (not res!45253) (not e!57533))))

(assert (=> b!88332 (= res!45253 (= (getValueByKey!141 (toList!748 lt!42222) (_1!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))) (Some!146 (_2!1113 (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))))

(declare-fun b!88333 () Bool)

(assert (=> b!88333 (= e!57533 (contains!757 (toList!748 lt!42222) (ite c!14502 (ite c!14503 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41734) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (= (and d!23471 res!45252) b!88332))

(assert (= (and b!88332 res!45253) b!88333))

(declare-fun m!94437 () Bool)

(assert (=> d!23471 m!94437))

(declare-fun m!94439 () Bool)

(assert (=> d!23471 m!94439))

(declare-fun m!94441 () Bool)

(assert (=> d!23471 m!94441))

(declare-fun m!94443 () Bool)

(assert (=> d!23471 m!94443))

(declare-fun m!94445 () Bool)

(assert (=> b!88332 m!94445))

(declare-fun m!94447 () Bool)

(assert (=> b!88333 m!94447))

(assert (=> bm!8422 d!23471))

(declare-fun d!23473 () Bool)

(declare-fun e!57535 () Bool)

(assert (=> d!23473 e!57535))

(declare-fun res!45254 () Bool)

(assert (=> d!23473 (=> res!45254 e!57535)))

(declare-fun lt!42228 () Bool)

(assert (=> d!23473 (= res!45254 (not lt!42228))))

(declare-fun lt!42225 () Bool)

(assert (=> d!23473 (= lt!42228 lt!42225)))

(declare-fun lt!42226 () Unit!2600)

(declare-fun e!57534 () Unit!2600)

(assert (=> d!23473 (= lt!42226 e!57534)))

(declare-fun c!14607 () Bool)

(assert (=> d!23473 (= c!14607 lt!42225)))

(assert (=> d!23473 (= lt!42225 (containsKey!145 (toList!748 lt!42027) (_1!1113 lt!41744)))))

(assert (=> d!23473 (= (contains!756 lt!42027 (_1!1113 lt!41744)) lt!42228)))

(declare-fun b!88334 () Bool)

(declare-fun lt!42227 () Unit!2600)

(assert (=> b!88334 (= e!57534 lt!42227)))

(assert (=> b!88334 (= lt!42227 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42027) (_1!1113 lt!41744)))))

(assert (=> b!88334 (isDefined!94 (getValueByKey!141 (toList!748 lt!42027) (_1!1113 lt!41744)))))

(declare-fun b!88335 () Bool)

(declare-fun Unit!2615 () Unit!2600)

(assert (=> b!88335 (= e!57534 Unit!2615)))

(declare-fun b!88336 () Bool)

(assert (=> b!88336 (= e!57535 (isDefined!94 (getValueByKey!141 (toList!748 lt!42027) (_1!1113 lt!41744))))))

(assert (= (and d!23473 c!14607) b!88334))

(assert (= (and d!23473 (not c!14607)) b!88335))

(assert (= (and d!23473 (not res!45254)) b!88336))

(declare-fun m!94449 () Bool)

(assert (=> d!23473 m!94449))

(declare-fun m!94451 () Bool)

(assert (=> b!88334 m!94451))

(assert (=> b!88334 m!94075))

(assert (=> b!88334 m!94075))

(declare-fun m!94453 () Bool)

(assert (=> b!88334 m!94453))

(assert (=> b!88336 m!94075))

(assert (=> b!88336 m!94075))

(assert (=> b!88336 m!94453))

(assert (=> d!23385 d!23473))

(declare-fun b!88337 () Bool)

(declare-fun e!57536 () Option!147)

(assert (=> b!88337 (= e!57536 (Some!146 (_2!1113 (h!2110 lt!42028))))))

(declare-fun b!88338 () Bool)

(declare-fun e!57537 () Option!147)

(assert (=> b!88338 (= e!57536 e!57537)))

(declare-fun c!14609 () Bool)

(assert (=> b!88338 (= c!14609 (and ((_ is Cons!1518) lt!42028) (not (= (_1!1113 (h!2110 lt!42028)) (_1!1113 lt!41744)))))))

(declare-fun d!23475 () Bool)

(declare-fun c!14608 () Bool)

(assert (=> d!23475 (= c!14608 (and ((_ is Cons!1518) lt!42028) (= (_1!1113 (h!2110 lt!42028)) (_1!1113 lt!41744))))))

(assert (=> d!23475 (= (getValueByKey!141 lt!42028 (_1!1113 lt!41744)) e!57536)))

(declare-fun b!88339 () Bool)

(assert (=> b!88339 (= e!57537 (getValueByKey!141 (t!5264 lt!42028) (_1!1113 lt!41744)))))

(declare-fun b!88340 () Bool)

(assert (=> b!88340 (= e!57537 None!145)))

(assert (= (and d!23475 c!14608) b!88337))

(assert (= (and d!23475 (not c!14608)) b!88338))

(assert (= (and b!88338 c!14609) b!88339))

(assert (= (and b!88338 (not c!14609)) b!88340))

(declare-fun m!94455 () Bool)

(assert (=> b!88339 m!94455))

(assert (=> d!23385 d!23475))

(declare-fun d!23477 () Bool)

(assert (=> d!23477 (= (getValueByKey!141 lt!42028 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(declare-fun lt!42229 () Unit!2600)

(assert (=> d!23477 (= lt!42229 (choose!517 lt!42028 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun e!57538 () Bool)

(assert (=> d!23477 e!57538))

(declare-fun res!45255 () Bool)

(assert (=> d!23477 (=> (not res!45255) (not e!57538))))

(assert (=> d!23477 (= res!45255 (isStrictlySorted!299 lt!42028))))

(assert (=> d!23477 (= (lemmaContainsTupThenGetReturnValue!58 lt!42028 (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42229)))

(declare-fun b!88341 () Bool)

(declare-fun res!45256 () Bool)

(assert (=> b!88341 (=> (not res!45256) (not e!57538))))

(assert (=> b!88341 (= res!45256 (containsKey!145 lt!42028 (_1!1113 lt!41744)))))

(declare-fun b!88342 () Bool)

(assert (=> b!88342 (= e!57538 (contains!757 lt!42028 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(assert (= (and d!23477 res!45255) b!88341))

(assert (= (and b!88341 res!45256) b!88342))

(assert (=> d!23477 m!94069))

(declare-fun m!94457 () Bool)

(assert (=> d!23477 m!94457))

(declare-fun m!94459 () Bool)

(assert (=> d!23477 m!94459))

(declare-fun m!94461 () Bool)

(assert (=> b!88341 m!94461))

(declare-fun m!94463 () Bool)

(assert (=> b!88342 m!94463))

(assert (=> d!23385 d!23477))

(declare-fun bm!8502 () Bool)

(declare-fun e!57543 () List!1522)

(declare-fun call!8507 () List!1522)

(declare-fun c!14611 () Bool)

(assert (=> bm!8502 (= call!8507 ($colon$colon!73 e!57543 (ite c!14611 (h!2110 (toList!748 (+!112 lt!41747 lt!41735))) (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744)))))))

(declare-fun c!14613 () Bool)

(assert (=> bm!8502 (= c!14613 c!14611)))

(declare-fun b!88343 () Bool)

(declare-fun c!14612 () Bool)

(assert (=> b!88343 (= c!14612 (and ((_ is Cons!1518) (toList!748 (+!112 lt!41747 lt!41735))) (bvsgt (_1!1113 (h!2110 (toList!748 (+!112 lt!41747 lt!41735)))) (_1!1113 lt!41744))))))

(declare-fun e!57539 () List!1522)

(declare-fun e!57541 () List!1522)

(assert (=> b!88343 (= e!57539 e!57541)))

(declare-fun b!88344 () Bool)

(declare-fun e!57540 () List!1522)

(assert (=> b!88344 (= e!57540 e!57539)))

(declare-fun c!14610 () Bool)

(assert (=> b!88344 (= c!14610 (and ((_ is Cons!1518) (toList!748 (+!112 lt!41747 lt!41735))) (= (_1!1113 (h!2110 (toList!748 (+!112 lt!41747 lt!41735)))) (_1!1113 lt!41744))))))

(declare-fun b!88345 () Bool)

(declare-fun call!8506 () List!1522)

(assert (=> b!88345 (= e!57541 call!8506)))

(declare-fun b!88346 () Bool)

(declare-fun res!45258 () Bool)

(declare-fun e!57542 () Bool)

(assert (=> b!88346 (=> (not res!45258) (not e!57542))))

(declare-fun lt!42230 () List!1522)

(assert (=> b!88346 (= res!45258 (containsKey!145 lt!42230 (_1!1113 lt!41744)))))

(declare-fun b!88347 () Bool)

(assert (=> b!88347 (= e!57541 call!8506)))

(declare-fun d!23479 () Bool)

(assert (=> d!23479 e!57542))

(declare-fun res!45257 () Bool)

(assert (=> d!23479 (=> (not res!45257) (not e!57542))))

(assert (=> d!23479 (= res!45257 (isStrictlySorted!299 lt!42230))))

(assert (=> d!23479 (= lt!42230 e!57540)))

(assert (=> d!23479 (= c!14611 (and ((_ is Cons!1518) (toList!748 (+!112 lt!41747 lt!41735))) (bvslt (_1!1113 (h!2110 (toList!748 (+!112 lt!41747 lt!41735)))) (_1!1113 lt!41744))))))

(assert (=> d!23479 (isStrictlySorted!299 (toList!748 (+!112 lt!41747 lt!41735)))))

(assert (=> d!23479 (= (insertStrictlySorted!61 (toList!748 (+!112 lt!41747 lt!41735)) (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42230)))

(declare-fun b!88348 () Bool)

(declare-fun call!8505 () List!1522)

(assert (=> b!88348 (= e!57539 call!8505)))

(declare-fun b!88349 () Bool)

(assert (=> b!88349 (= e!57543 (insertStrictlySorted!61 (t!5264 (toList!748 (+!112 lt!41747 lt!41735))) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun bm!8503 () Bool)

(assert (=> bm!8503 (= call!8505 call!8507)))

(declare-fun b!88350 () Bool)

(assert (=> b!88350 (= e!57542 (contains!757 lt!42230 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(declare-fun b!88351 () Bool)

(assert (=> b!88351 (= e!57543 (ite c!14610 (t!5264 (toList!748 (+!112 lt!41747 lt!41735))) (ite c!14612 (Cons!1518 (h!2110 (toList!748 (+!112 lt!41747 lt!41735))) (t!5264 (toList!748 (+!112 lt!41747 lt!41735)))) Nil!1519)))))

(declare-fun bm!8504 () Bool)

(assert (=> bm!8504 (= call!8506 call!8505)))

(declare-fun b!88352 () Bool)

(assert (=> b!88352 (= e!57540 call!8507)))

(assert (= (and d!23479 c!14611) b!88352))

(assert (= (and d!23479 (not c!14611)) b!88344))

(assert (= (and b!88344 c!14610) b!88348))

(assert (= (and b!88344 (not c!14610)) b!88343))

(assert (= (and b!88343 c!14612) b!88345))

(assert (= (and b!88343 (not c!14612)) b!88347))

(assert (= (or b!88345 b!88347) bm!8504))

(assert (= (or b!88348 bm!8504) bm!8503))

(assert (= (or b!88352 bm!8503) bm!8502))

(assert (= (and bm!8502 c!14613) b!88349))

(assert (= (and bm!8502 (not c!14613)) b!88351))

(assert (= (and d!23479 res!45257) b!88346))

(assert (= (and b!88346 res!45258) b!88350))

(declare-fun m!94465 () Bool)

(assert (=> b!88346 m!94465))

(declare-fun m!94467 () Bool)

(assert (=> bm!8502 m!94467))

(declare-fun m!94469 () Bool)

(assert (=> b!88349 m!94469))

(declare-fun m!94471 () Bool)

(assert (=> b!88350 m!94471))

(declare-fun m!94473 () Bool)

(assert (=> d!23479 m!94473))

(declare-fun m!94475 () Bool)

(assert (=> d!23479 m!94475))

(assert (=> d!23385 d!23479))

(declare-fun bm!8507 () Bool)

(declare-fun call!8510 () (_ BitVec 32))

(assert (=> bm!8507 (= call!8510 (arrayCountValidKeys!0 (_keys!4035 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88361 () Bool)

(declare-fun e!57548 () (_ BitVec 32))

(declare-fun e!57549 () (_ BitVec 32))

(assert (=> b!88361 (= e!57548 e!57549)))

(declare-fun c!14618 () Bool)

(assert (=> b!88361 (= c!14618 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!23481 () Bool)

(declare-fun lt!42233 () (_ BitVec 32))

(assert (=> d!23481 (and (bvsge lt!42233 #b00000000000000000000000000000000) (bvsle lt!42233 (bvsub (size!2170 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!23481 (= lt!42233 e!57548)))

(declare-fun c!14619 () Bool)

(assert (=> d!23481 (= c!14619 (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(assert (=> d!23481 (and (bvsle #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2170 (_keys!4035 newMap!16)) (size!2170 (_keys!4035 newMap!16))))))

(assert (=> d!23481 (= (arrayCountValidKeys!0 (_keys!4035 newMap!16) #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) lt!42233)))

(declare-fun b!88362 () Bool)

(assert (=> b!88362 (= e!57549 call!8510)))

(declare-fun b!88363 () Bool)

(assert (=> b!88363 (= e!57548 #b00000000000000000000000000000000)))

(declare-fun b!88364 () Bool)

(assert (=> b!88364 (= e!57549 (bvadd #b00000000000000000000000000000001 call!8510))))

(assert (= (and d!23481 c!14619) b!88363))

(assert (= (and d!23481 (not c!14619)) b!88361))

(assert (= (and b!88361 c!14618) b!88364))

(assert (= (and b!88361 (not c!14618)) b!88362))

(assert (= (or b!88364 b!88362) bm!8507))

(declare-fun m!94477 () Bool)

(assert (=> bm!8507 m!94477))

(assert (=> b!88361 m!94263))

(assert (=> b!88361 m!94263))

(assert (=> b!88361 m!94271))

(assert (=> b!88103 d!23481))

(declare-fun d!23483 () Bool)

(assert (=> d!23483 (= (apply!83 (+!112 lt!41959 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41952) (apply!83 lt!41959 lt!41952))))

(declare-fun lt!42236 () Unit!2600)

(declare-fun choose!518 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> d!23483 (= lt!42236 (choose!518 lt!41959 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41952))))

(declare-fun e!57552 () Bool)

(assert (=> d!23483 e!57552))

(declare-fun res!45261 () Bool)

(assert (=> d!23483 (=> (not res!45261) (not e!57552))))

(assert (=> d!23483 (= res!45261 (contains!756 lt!41959 lt!41952))))

(assert (=> d!23483 (= (addApplyDifferent!59 lt!41959 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41952) lt!42236)))

(declare-fun b!88368 () Bool)

(assert (=> b!88368 (= e!57552 (not (= lt!41952 lt!41964)))))

(assert (= (and d!23483 res!45261) b!88368))

(assert (=> d!23483 m!93939))

(assert (=> d!23483 m!93945))

(assert (=> d!23483 m!93947))

(declare-fun m!94479 () Bool)

(assert (=> d!23483 m!94479))

(assert (=> d!23483 m!93945))

(declare-fun m!94481 () Bool)

(assert (=> d!23483 m!94481))

(assert (=> b!88024 d!23483))

(declare-fun d!23485 () Bool)

(assert (=> d!23485 (= (apply!83 (+!112 lt!41951 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41967) (apply!83 lt!41951 lt!41967))))

(declare-fun lt!42237 () Unit!2600)

(assert (=> d!23485 (= lt!42237 (choose!518 lt!41951 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41967))))

(declare-fun e!57553 () Bool)

(assert (=> d!23485 e!57553))

(declare-fun res!45262 () Bool)

(assert (=> d!23485 (=> (not res!45262) (not e!57553))))

(assert (=> d!23485 (= res!45262 (contains!756 lt!41951 lt!41967))))

(assert (=> d!23485 (= (addApplyDifferent!59 lt!41951 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41967) lt!42237)))

(declare-fun b!88369 () Bool)

(assert (=> b!88369 (= e!57553 (not (= lt!41967 lt!41966)))))

(assert (= (and d!23485 res!45262) b!88369))

(assert (=> d!23485 m!93951))

(assert (=> d!23485 m!93931))

(assert (=> d!23485 m!93933))

(declare-fun m!94483 () Bool)

(assert (=> d!23485 m!94483))

(assert (=> d!23485 m!93931))

(declare-fun m!94485 () Bool)

(assert (=> d!23485 m!94485))

(assert (=> b!88024 d!23485))

(declare-fun d!23487 () Bool)

(assert (=> d!23487 (= (apply!83 (+!112 lt!41953 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41960) (apply!83 lt!41953 lt!41960))))

(declare-fun lt!42238 () Unit!2600)

(assert (=> d!23487 (= lt!42238 (choose!518 lt!41953 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41960))))

(declare-fun e!57554 () Bool)

(assert (=> d!23487 e!57554))

(declare-fun res!45263 () Bool)

(assert (=> d!23487 (=> (not res!45263) (not e!57554))))

(assert (=> d!23487 (= res!45263 (contains!756 lt!41953 lt!41960))))

(assert (=> d!23487 (= (addApplyDifferent!59 lt!41953 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41960) lt!42238)))

(declare-fun b!88370 () Bool)

(assert (=> b!88370 (= e!57554 (not (= lt!41960 lt!41948)))))

(assert (= (and d!23487 res!45263) b!88370))

(assert (=> d!23487 m!93941))

(assert (=> d!23487 m!93937))

(assert (=> d!23487 m!93949))

(declare-fun m!94487 () Bool)

(assert (=> d!23487 m!94487))

(assert (=> d!23487 m!93937))

(declare-fun m!94489 () Bool)

(assert (=> d!23487 m!94489))

(assert (=> b!88024 d!23487))

(assert (=> b!88024 d!23373))

(declare-fun d!23489 () Bool)

(assert (=> d!23489 (= (apply!83 (+!112 lt!41953 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41960) (get!1204 (getValueByKey!141 (toList!748 (+!112 lt!41953 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41960)))))

(declare-fun bs!3729 () Bool)

(assert (= bs!3729 d!23489))

(declare-fun m!94491 () Bool)

(assert (=> bs!3729 m!94491))

(assert (=> bs!3729 m!94491))

(declare-fun m!94493 () Bool)

(assert (=> bs!3729 m!94493))

(assert (=> b!88024 d!23489))

(declare-fun d!23491 () Bool)

(assert (=> d!23491 (= (apply!83 (+!112 lt!41951 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41967) (get!1204 (getValueByKey!141 (toList!748 (+!112 lt!41951 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41967)))))

(declare-fun bs!3730 () Bool)

(assert (= bs!3730 d!23491))

(declare-fun m!94495 () Bool)

(assert (=> bs!3730 m!94495))

(assert (=> bs!3730 m!94495))

(declare-fun m!94497 () Bool)

(assert (=> bs!3730 m!94497))

(assert (=> b!88024 d!23491))

(declare-fun d!23493 () Bool)

(declare-fun e!57555 () Bool)

(assert (=> d!23493 e!57555))

(declare-fun res!45264 () Bool)

(assert (=> d!23493 (=> (not res!45264) (not e!57555))))

(declare-fun lt!42240 () ListLongMap!1465)

(assert (=> d!23493 (= res!45264 (contains!756 lt!42240 (_1!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42241 () List!1522)

(assert (=> d!23493 (= lt!42240 (ListLongMap!1466 lt!42241))))

(declare-fun lt!42242 () Unit!2600)

(declare-fun lt!42239 () Unit!2600)

(assert (=> d!23493 (= lt!42242 lt!42239)))

(assert (=> d!23493 (= (getValueByKey!141 lt!42241 (_1!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23493 (= lt!42239 (lemmaContainsTupThenGetReturnValue!58 lt!42241 (_1!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23493 (= lt!42241 (insertStrictlySorted!61 (toList!748 lt!41953) (_1!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23493 (= (+!112 lt!41953 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42240)))

(declare-fun b!88371 () Bool)

(declare-fun res!45265 () Bool)

(assert (=> b!88371 (=> (not res!45265) (not e!57555))))

(assert (=> b!88371 (= res!45265 (= (getValueByKey!141 (toList!748 lt!42240) (_1!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88372 () Bool)

(assert (=> b!88372 (= e!57555 (contains!757 (toList!748 lt!42240) (tuple2!2205 lt!41948 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23493 res!45264) b!88371))

(assert (= (and b!88371 res!45265) b!88372))

(declare-fun m!94499 () Bool)

(assert (=> d!23493 m!94499))

(declare-fun m!94501 () Bool)

(assert (=> d!23493 m!94501))

(declare-fun m!94503 () Bool)

(assert (=> d!23493 m!94503))

(declare-fun m!94505 () Bool)

(assert (=> d!23493 m!94505))

(declare-fun m!94507 () Bool)

(assert (=> b!88371 m!94507))

(declare-fun m!94509 () Bool)

(assert (=> b!88372 m!94509))

(assert (=> b!88024 d!23493))

(declare-fun d!23495 () Bool)

(declare-fun e!57556 () Bool)

(assert (=> d!23495 e!57556))

(declare-fun res!45266 () Bool)

(assert (=> d!23495 (=> (not res!45266) (not e!57556))))

(declare-fun lt!42244 () ListLongMap!1465)

(assert (=> d!23495 (= res!45266 (contains!756 lt!42244 (_1!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42245 () List!1522)

(assert (=> d!23495 (= lt!42244 (ListLongMap!1466 lt!42245))))

(declare-fun lt!42246 () Unit!2600)

(declare-fun lt!42243 () Unit!2600)

(assert (=> d!23495 (= lt!42246 lt!42243)))

(assert (=> d!23495 (= (getValueByKey!141 lt!42245 (_1!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23495 (= lt!42243 (lemmaContainsTupThenGetReturnValue!58 lt!42245 (_1!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23495 (= lt!42245 (insertStrictlySorted!61 (toList!748 lt!41951) (_1!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23495 (= (+!112 lt!41951 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42244)))

(declare-fun b!88373 () Bool)

(declare-fun res!45267 () Bool)

(assert (=> b!88373 (=> (not res!45267) (not e!57556))))

(assert (=> b!88373 (= res!45267 (= (getValueByKey!141 (toList!748 lt!42244) (_1!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88374 () Bool)

(assert (=> b!88374 (= e!57556 (contains!757 (toList!748 lt!42244) (tuple2!2205 lt!41966 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23495 res!45266) b!88373))

(assert (= (and b!88373 res!45267) b!88374))

(declare-fun m!94511 () Bool)

(assert (=> d!23495 m!94511))

(declare-fun m!94513 () Bool)

(assert (=> d!23495 m!94513))

(declare-fun m!94515 () Bool)

(assert (=> d!23495 m!94515))

(declare-fun m!94517 () Bool)

(assert (=> d!23495 m!94517))

(declare-fun m!94519 () Bool)

(assert (=> b!88373 m!94519))

(declare-fun m!94521 () Bool)

(assert (=> b!88374 m!94521))

(assert (=> b!88024 d!23495))

(declare-fun d!23497 () Bool)

(assert (=> d!23497 (= (apply!83 (+!112 lt!41959 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41952) (get!1204 (getValueByKey!141 (toList!748 (+!112 lt!41959 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41952)))))

(declare-fun bs!3731 () Bool)

(assert (= bs!3731 d!23497))

(declare-fun m!94523 () Bool)

(assert (=> bs!3731 m!94523))

(assert (=> bs!3731 m!94523))

(declare-fun m!94525 () Bool)

(assert (=> bs!3731 m!94525))

(assert (=> b!88024 d!23497))

(declare-fun d!23499 () Bool)

(assert (=> d!23499 (= (apply!83 lt!41959 lt!41952) (get!1204 (getValueByKey!141 (toList!748 lt!41959) lt!41952)))))

(declare-fun bs!3732 () Bool)

(assert (= bs!3732 d!23499))

(declare-fun m!94527 () Bool)

(assert (=> bs!3732 m!94527))

(assert (=> bs!3732 m!94527))

(declare-fun m!94529 () Bool)

(assert (=> bs!3732 m!94529))

(assert (=> b!88024 d!23499))

(declare-fun d!23501 () Bool)

(declare-fun e!57557 () Bool)

(assert (=> d!23501 e!57557))

(declare-fun res!45268 () Bool)

(assert (=> d!23501 (=> (not res!45268) (not e!57557))))

(declare-fun lt!42248 () ListLongMap!1465)

(assert (=> d!23501 (= res!45268 (contains!756 lt!42248 (_1!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42249 () List!1522)

(assert (=> d!23501 (= lt!42248 (ListLongMap!1466 lt!42249))))

(declare-fun lt!42250 () Unit!2600)

(declare-fun lt!42247 () Unit!2600)

(assert (=> d!23501 (= lt!42250 lt!42247)))

(assert (=> d!23501 (= (getValueByKey!141 lt!42249 (_1!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23501 (= lt!42247 (lemmaContainsTupThenGetReturnValue!58 lt!42249 (_1!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23501 (= lt!42249 (insertStrictlySorted!61 (toList!748 lt!41962) (_1!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23501 (= (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42248)))

(declare-fun b!88375 () Bool)

(declare-fun res!45269 () Bool)

(assert (=> b!88375 (=> (not res!45269) (not e!57557))))

(assert (=> b!88375 (= res!45269 (= (getValueByKey!141 (toList!748 lt!42248) (_1!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88376 () Bool)

(assert (=> b!88376 (= e!57557 (contains!757 (toList!748 lt!42248) (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23501 res!45268) b!88375))

(assert (= (and b!88375 res!45269) b!88376))

(declare-fun m!94531 () Bool)

(assert (=> d!23501 m!94531))

(declare-fun m!94533 () Bool)

(assert (=> d!23501 m!94533))

(declare-fun m!94535 () Bool)

(assert (=> d!23501 m!94535))

(declare-fun m!94537 () Bool)

(assert (=> d!23501 m!94537))

(declare-fun m!94539 () Bool)

(assert (=> b!88375 m!94539))

(declare-fun m!94541 () Bool)

(assert (=> b!88376 m!94541))

(assert (=> b!88024 d!23501))

(declare-fun d!23503 () Bool)

(declare-fun e!57558 () Bool)

(assert (=> d!23503 e!57558))

(declare-fun res!45270 () Bool)

(assert (=> d!23503 (=> (not res!45270) (not e!57558))))

(declare-fun lt!42252 () ListLongMap!1465)

(assert (=> d!23503 (= res!45270 (contains!756 lt!42252 (_1!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42253 () List!1522)

(assert (=> d!23503 (= lt!42252 (ListLongMap!1466 lt!42253))))

(declare-fun lt!42254 () Unit!2600)

(declare-fun lt!42251 () Unit!2600)

(assert (=> d!23503 (= lt!42254 lt!42251)))

(assert (=> d!23503 (= (getValueByKey!141 lt!42253 (_1!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23503 (= lt!42251 (lemmaContainsTupThenGetReturnValue!58 lt!42253 (_1!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23503 (= lt!42253 (insertStrictlySorted!61 (toList!748 lt!41959) (_1!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23503 (= (+!112 lt!41959 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42252)))

(declare-fun b!88377 () Bool)

(declare-fun res!45271 () Bool)

(assert (=> b!88377 (=> (not res!45271) (not e!57558))))

(assert (=> b!88377 (= res!45271 (= (getValueByKey!141 (toList!748 lt!42252) (_1!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88378 () Bool)

(assert (=> b!88378 (= e!57558 (contains!757 (toList!748 lt!42252) (tuple2!2205 lt!41964 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23503 res!45270) b!88377))

(assert (= (and b!88377 res!45271) b!88378))

(declare-fun m!94543 () Bool)

(assert (=> d!23503 m!94543))

(declare-fun m!94545 () Bool)

(assert (=> d!23503 m!94545))

(declare-fun m!94547 () Bool)

(assert (=> d!23503 m!94547))

(declare-fun m!94549 () Bool)

(assert (=> d!23503 m!94549))

(declare-fun m!94551 () Bool)

(assert (=> b!88377 m!94551))

(declare-fun m!94553 () Bool)

(assert (=> b!88378 m!94553))

(assert (=> b!88024 d!23503))

(declare-fun d!23505 () Bool)

(assert (=> d!23505 (= (apply!83 lt!41951 lt!41967) (get!1204 (getValueByKey!141 (toList!748 lt!41951) lt!41967)))))

(declare-fun bs!3733 () Bool)

(assert (= bs!3733 d!23505))

(declare-fun m!94555 () Bool)

(assert (=> bs!3733 m!94555))

(assert (=> bs!3733 m!94555))

(declare-fun m!94557 () Bool)

(assert (=> bs!3733 m!94557))

(assert (=> b!88024 d!23505))

(declare-fun d!23507 () Bool)

(declare-fun e!57560 () Bool)

(assert (=> d!23507 e!57560))

(declare-fun res!45272 () Bool)

(assert (=> d!23507 (=> res!45272 e!57560)))

(declare-fun lt!42258 () Bool)

(assert (=> d!23507 (= res!45272 (not lt!42258))))

(declare-fun lt!42255 () Bool)

(assert (=> d!23507 (= lt!42258 lt!42255)))

(declare-fun lt!42256 () Unit!2600)

(declare-fun e!57559 () Unit!2600)

(assert (=> d!23507 (= lt!42256 e!57559)))

(declare-fun c!14620 () Bool)

(assert (=> d!23507 (= c!14620 lt!42255)))

(assert (=> d!23507 (= lt!42255 (containsKey!145 (toList!748 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41969))))

(assert (=> d!23507 (= (contains!756 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41969) lt!42258)))

(declare-fun b!88379 () Bool)

(declare-fun lt!42257 () Unit!2600)

(assert (=> b!88379 (= e!57559 lt!42257)))

(assert (=> b!88379 (= lt!42257 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41969))))

(assert (=> b!88379 (isDefined!94 (getValueByKey!141 (toList!748 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41969))))

(declare-fun b!88380 () Bool)

(declare-fun Unit!2616 () Unit!2600)

(assert (=> b!88380 (= e!57559 Unit!2616)))

(declare-fun b!88381 () Bool)

(assert (=> b!88381 (= e!57560 (isDefined!94 (getValueByKey!141 (toList!748 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) lt!41969)))))

(assert (= (and d!23507 c!14620) b!88379))

(assert (= (and d!23507 (not c!14620)) b!88380))

(assert (= (and d!23507 (not res!45272)) b!88381))

(declare-fun m!94559 () Bool)

(assert (=> d!23507 m!94559))

(declare-fun m!94561 () Bool)

(assert (=> b!88379 m!94561))

(declare-fun m!94563 () Bool)

(assert (=> b!88379 m!94563))

(assert (=> b!88379 m!94563))

(declare-fun m!94565 () Bool)

(assert (=> b!88379 m!94565))

(assert (=> b!88381 m!94563))

(assert (=> b!88381 m!94563))

(assert (=> b!88381 m!94565))

(assert (=> b!88024 d!23507))

(declare-fun d!23509 () Bool)

(assert (=> d!23509 (contains!756 (+!112 lt!41962 (tuple2!2205 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!41969)))

(declare-fun lt!42261 () Unit!2600)

(declare-fun choose!519 (ListLongMap!1465 (_ BitVec 64) V!3035 (_ BitVec 64)) Unit!2600)

(assert (=> d!23509 (= lt!42261 (choose!519 lt!41962 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41969))))

(assert (=> d!23509 (contains!756 lt!41962 lt!41969)))

(assert (=> d!23509 (= (addStillContains!59 lt!41962 lt!41965 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) lt!41969) lt!42261)))

(declare-fun bs!3734 () Bool)

(assert (= bs!3734 d!23509))

(assert (=> bs!3734 m!93927))

(assert (=> bs!3734 m!93927))

(assert (=> bs!3734 m!93929))

(declare-fun m!94567 () Bool)

(assert (=> bs!3734 m!94567))

(declare-fun m!94569 () Bool)

(assert (=> bs!3734 m!94569))

(assert (=> b!88024 d!23509))

(declare-fun d!23511 () Bool)

(assert (=> d!23511 (= (apply!83 lt!41953 lt!41960) (get!1204 (getValueByKey!141 (toList!748 lt!41953) lt!41960)))))

(declare-fun bs!3735 () Bool)

(assert (= bs!3735 d!23511))

(declare-fun m!94571 () Bool)

(assert (=> bs!3735 m!94571))

(assert (=> bs!3735 m!94571))

(declare-fun m!94573 () Bool)

(assert (=> bs!3735 m!94573))

(assert (=> b!88024 d!23511))

(declare-fun d!23513 () Bool)

(assert (=> d!23513 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000)))

(declare-fun lt!42264 () Unit!2600)

(declare-fun choose!13 (array!4043 (_ BitVec 64) (_ BitVec 32)) Unit!2600)

(assert (=> d!23513 (= lt!42264 (choose!13 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000))))

(assert (=> d!23513 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23513 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000) lt!42264)))

(declare-fun bs!3736 () Bool)

(assert (= bs!3736 d!23513))

(assert (=> bs!3736 m!93899))

(declare-fun m!94575 () Bool)

(assert (=> bs!3736 m!94575))

(assert (=> b!87972 d!23513))

(declare-fun d!23515 () Bool)

(declare-fun res!45273 () Bool)

(declare-fun e!57561 () Bool)

(assert (=> d!23515 (=> res!45273 e!57561)))

(assert (=> d!23515 (= res!45273 (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) lt!41901))))

(assert (=> d!23515 (= (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 #b00000000000000000000000000000000) e!57561)))

(declare-fun b!88383 () Bool)

(declare-fun e!57562 () Bool)

(assert (=> b!88383 (= e!57561 e!57562)))

(declare-fun res!45274 () Bool)

(assert (=> b!88383 (=> (not res!45274) (not e!57562))))

(assert (=> b!88383 (= res!45274 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88384 () Bool)

(assert (=> b!88384 (= e!57562 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!41901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23515 (not res!45273)) b!88383))

(assert (= (and b!88383 res!45274) b!88384))

(assert (=> d!23515 m!93893))

(declare-fun m!94577 () Bool)

(assert (=> b!88384 m!94577))

(assert (=> b!87972 d!23515))

(declare-fun b!88385 () Bool)

(declare-fun c!14623 () Bool)

(declare-fun lt!42265 () (_ BitVec 64))

(assert (=> b!88385 (= c!14623 (= lt!42265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57563 () SeekEntryResult!244)

(declare-fun e!57565 () SeekEntryResult!244)

(assert (=> b!88385 (= e!57563 e!57565)))

(declare-fun b!88386 () Bool)

(declare-fun lt!42267 () SeekEntryResult!244)

(assert (=> b!88386 (= e!57565 (seekKeyOrZeroReturnVacant!0 (x!12141 lt!42267) (index!3116 lt!42267) (index!3116 lt!42267) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88387 () Bool)

(declare-fun e!57564 () SeekEntryResult!244)

(assert (=> b!88387 (= e!57564 e!57563)))

(assert (=> b!88387 (= lt!42265 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (index!3116 lt!42267)))))

(declare-fun c!14621 () Bool)

(assert (=> b!88387 (= c!14621 (= lt!42265 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!88388 () Bool)

(assert (=> b!88388 (= e!57565 (MissingZero!244 (index!3116 lt!42267)))))

(declare-fun b!88389 () Bool)

(assert (=> b!88389 (= e!57564 Undefined!244)))

(declare-fun d!23517 () Bool)

(declare-fun lt!42266 () SeekEntryResult!244)

(assert (=> d!23517 (and (or ((_ is Undefined!244) lt!42266) (not ((_ is Found!244) lt!42266)) (and (bvsge (index!3115 lt!42266) #b00000000000000000000000000000000) (bvslt (index!3115 lt!42266) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))) (or ((_ is Undefined!244) lt!42266) ((_ is Found!244) lt!42266) (not ((_ is MissingZero!244) lt!42266)) (and (bvsge (index!3114 lt!42266) #b00000000000000000000000000000000) (bvslt (index!3114 lt!42266) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))) (or ((_ is Undefined!244) lt!42266) ((_ is Found!244) lt!42266) ((_ is MissingZero!244) lt!42266) (not ((_ is MissingVacant!244) lt!42266)) (and (bvsge (index!3117 lt!42266) #b00000000000000000000000000000000) (bvslt (index!3117 lt!42266) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))) (or ((_ is Undefined!244) lt!42266) (ite ((_ is Found!244) lt!42266) (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (index!3115 lt!42266)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!244) lt!42266) (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (index!3114 lt!42266)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!244) lt!42266) (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (index!3117 lt!42266)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23517 (= lt!42266 e!57564)))

(declare-fun c!14622 () Bool)

(assert (=> d!23517 (= c!14622 (and ((_ is Intermediate!244) lt!42267) (undefined!1056 lt!42267)))))

(assert (=> d!23517 (= lt!42267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) (mask!6397 (v!2661 (underlying!292 thiss!992)))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(assert (=> d!23517 (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23517 (= (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))) lt!42266)))

(declare-fun b!88390 () Bool)

(assert (=> b!88390 (= e!57563 (Found!244 (index!3116 lt!42267)))))

(assert (= (and d!23517 c!14622) b!88389))

(assert (= (and d!23517 (not c!14622)) b!88387))

(assert (= (and b!88387 c!14621) b!88390))

(assert (= (and b!88387 (not c!14621)) b!88385))

(assert (= (and b!88385 c!14623) b!88388))

(assert (= (and b!88385 (not c!14623)) b!88386))

(assert (=> b!88386 m!93893))

(declare-fun m!94579 () Bool)

(assert (=> b!88386 m!94579))

(declare-fun m!94581 () Bool)

(assert (=> b!88387 m!94581))

(assert (=> d!23517 m!93893))

(declare-fun m!94583 () Bool)

(assert (=> d!23517 m!94583))

(declare-fun m!94585 () Bool)

(assert (=> d!23517 m!94585))

(declare-fun m!94587 () Bool)

(assert (=> d!23517 m!94587))

(declare-fun m!94589 () Bool)

(assert (=> d!23517 m!94589))

(assert (=> d!23517 m!94583))

(assert (=> d!23517 m!93893))

(declare-fun m!94591 () Bool)

(assert (=> d!23517 m!94591))

(assert (=> d!23517 m!93745))

(assert (=> b!87972 d!23517))

(declare-fun d!23519 () Bool)

(assert (=> d!23519 (= (+!112 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41734)) (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) lt!41889 (zeroValue!2249 newMap!16) lt!41734 #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42270 () Unit!2600)

(declare-fun choose!520 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 V!3035 Int) Unit!2600)

(assert (=> d!23519 (= lt!42270 (choose!520 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41889 (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) lt!41734 (defaultEntry!2359 newMap!16)))))

(assert (=> d!23519 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23519 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) lt!41889 (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) lt!41734 (defaultEntry!2359 newMap!16)) lt!42270)))

(declare-fun bs!3737 () Bool)

(assert (= bs!3737 d!23519))

(declare-fun m!94593 () Bool)

(assert (=> bs!3737 m!94593))

(assert (=> bs!3737 m!93865))

(declare-fun m!94595 () Bool)

(assert (=> bs!3737 m!94595))

(assert (=> bs!3737 m!93865))

(assert (=> bs!3737 m!94251))

(declare-fun m!94597 () Bool)

(assert (=> bs!3737 m!94597))

(assert (=> b!87932 d!23519))

(declare-fun d!23521 () Bool)

(declare-fun e!57567 () Bool)

(assert (=> d!23521 e!57567))

(declare-fun res!45275 () Bool)

(assert (=> d!23521 (=> res!45275 e!57567)))

(declare-fun lt!42274 () Bool)

(assert (=> d!23521 (= res!45275 (not lt!42274))))

(declare-fun lt!42271 () Bool)

(assert (=> d!23521 (= lt!42274 lt!42271)))

(declare-fun lt!42272 () Unit!2600)

(declare-fun e!57566 () Unit!2600)

(assert (=> d!23521 (= lt!42272 e!57566)))

(declare-fun c!14624 () Bool)

(assert (=> d!23521 (= c!14624 lt!42271)))

(assert (=> d!23521 (= lt!42271 (containsKey!145 (toList!748 lt!42007) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23521 (= (contains!756 lt!42007 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42274)))

(declare-fun b!88391 () Bool)

(declare-fun lt!42273 () Unit!2600)

(assert (=> b!88391 (= e!57566 lt!42273)))

(assert (=> b!88391 (= lt!42273 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42007) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88391 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88392 () Bool)

(declare-fun Unit!2617 () Unit!2600)

(assert (=> b!88392 (= e!57566 Unit!2617)))

(declare-fun b!88393 () Bool)

(assert (=> b!88393 (= e!57567 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23521 c!14624) b!88391))

(assert (= (and d!23521 (not c!14624)) b!88392))

(assert (= (and d!23521 (not res!45275)) b!88393))

(declare-fun m!94599 () Bool)

(assert (=> d!23521 m!94599))

(declare-fun m!94601 () Bool)

(assert (=> b!88391 m!94601))

(declare-fun m!94603 () Bool)

(assert (=> b!88391 m!94603))

(assert (=> b!88391 m!94603))

(declare-fun m!94605 () Bool)

(assert (=> b!88391 m!94605))

(assert (=> b!88393 m!94603))

(assert (=> b!88393 m!94603))

(assert (=> b!88393 m!94605))

(assert (=> b!88087 d!23521))

(declare-fun d!23523 () Bool)

(declare-fun res!45278 () Bool)

(declare-fun e!57569 () Bool)

(assert (=> d!23523 (=> res!45278 e!57569)))

(assert (=> d!23523 (= res!45278 (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(assert (=> d!23523 (= (arrayNoDuplicates!0 (_keys!4035 newMap!16) #b00000000000000000000000000000000 Nil!1520) e!57569)))

(declare-fun b!88394 () Bool)

(declare-fun e!57571 () Bool)

(declare-fun call!8511 () Bool)

(assert (=> b!88394 (= e!57571 call!8511)))

(declare-fun b!88395 () Bool)

(declare-fun e!57568 () Bool)

(assert (=> b!88395 (= e!57568 e!57571)))

(declare-fun c!14625 () Bool)

(assert (=> b!88395 (= c!14625 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8508 () Bool)

(assert (=> bm!8508 (= call!8511 (arrayNoDuplicates!0 (_keys!4035 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14625 (Cons!1519 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000) Nil!1520) Nil!1520)))))

(declare-fun b!88396 () Bool)

(declare-fun e!57570 () Bool)

(assert (=> b!88396 (= e!57570 (contains!758 Nil!1520 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88397 () Bool)

(assert (=> b!88397 (= e!57571 call!8511)))

(declare-fun b!88398 () Bool)

(assert (=> b!88398 (= e!57569 e!57568)))

(declare-fun res!45276 () Bool)

(assert (=> b!88398 (=> (not res!45276) (not e!57568))))

(assert (=> b!88398 (= res!45276 (not e!57570))))

(declare-fun res!45277 () Bool)

(assert (=> b!88398 (=> (not res!45277) (not e!57570))))

(assert (=> b!88398 (= res!45277 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23523 (not res!45278)) b!88398))

(assert (= (and b!88398 res!45277) b!88396))

(assert (= (and b!88398 res!45276) b!88395))

(assert (= (and b!88395 c!14625) b!88397))

(assert (= (and b!88395 (not c!14625)) b!88394))

(assert (= (or b!88397 b!88394) bm!8508))

(assert (=> b!88395 m!94263))

(assert (=> b!88395 m!94263))

(assert (=> b!88395 m!94271))

(assert (=> bm!8508 m!94263))

(declare-fun m!94607 () Bool)

(assert (=> bm!8508 m!94607))

(assert (=> b!88396 m!94263))

(assert (=> b!88396 m!94263))

(declare-fun m!94609 () Bool)

(assert (=> b!88396 m!94609))

(assert (=> b!88398 m!94263))

(assert (=> b!88398 m!94263))

(assert (=> b!88398 m!94271))

(assert (=> b!88105 d!23523))

(declare-fun d!23525 () Bool)

(declare-fun e!57573 () Bool)

(assert (=> d!23525 e!57573))

(declare-fun res!45279 () Bool)

(assert (=> d!23525 (=> res!45279 e!57573)))

(declare-fun lt!42278 () Bool)

(assert (=> d!23525 (= res!45279 (not lt!42278))))

(declare-fun lt!42275 () Bool)

(assert (=> d!23525 (= lt!42278 lt!42275)))

(declare-fun lt!42276 () Unit!2600)

(declare-fun e!57572 () Unit!2600)

(assert (=> d!23525 (= lt!42276 e!57572)))

(declare-fun c!14626 () Bool)

(assert (=> d!23525 (= c!14626 lt!42275)))

(assert (=> d!23525 (= lt!42275 (containsKey!145 (toList!748 lt!41956) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23525 (= (contains!756 lt!41956 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42278)))

(declare-fun b!88399 () Bool)

(declare-fun lt!42277 () Unit!2600)

(assert (=> b!88399 (= e!57572 lt!42277)))

(assert (=> b!88399 (= lt!42277 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41956) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88399 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88400 () Bool)

(declare-fun Unit!2618 () Unit!2600)

(assert (=> b!88400 (= e!57572 Unit!2618)))

(declare-fun b!88401 () Bool)

(assert (=> b!88401 (= e!57573 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23525 c!14626) b!88399))

(assert (= (and d!23525 (not c!14626)) b!88400))

(assert (= (and d!23525 (not res!45279)) b!88401))

(assert (=> d!23525 m!93913))

(declare-fun m!94611 () Bool)

(assert (=> d!23525 m!94611))

(assert (=> b!88399 m!93913))

(declare-fun m!94613 () Bool)

(assert (=> b!88399 m!94613))

(assert (=> b!88399 m!93913))

(assert (=> b!88399 m!94243))

(assert (=> b!88399 m!94243))

(declare-fun m!94615 () Bool)

(assert (=> b!88399 m!94615))

(assert (=> b!88401 m!93913))

(assert (=> b!88401 m!94243))

(assert (=> b!88401 m!94243))

(assert (=> b!88401 m!94615))

(assert (=> b!88026 d!23525))

(declare-fun d!23527 () Bool)

(declare-fun res!45282 () Bool)

(declare-fun e!57575 () Bool)

(assert (=> d!23527 (=> res!45282 e!57575)))

(assert (=> d!23527 (= res!45282 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23527 (= (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14557 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520) Nil!1520)) e!57575)))

(declare-fun b!88402 () Bool)

(declare-fun e!57577 () Bool)

(declare-fun call!8512 () Bool)

(assert (=> b!88402 (= e!57577 call!8512)))

(declare-fun b!88403 () Bool)

(declare-fun e!57574 () Bool)

(assert (=> b!88403 (= e!57574 e!57577)))

(declare-fun c!14627 () Bool)

(assert (=> b!88403 (= c!14627 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!8509 () Bool)

(assert (=> bm!8509 (= call!8512 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14627 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14557 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520) Nil!1520)) (ite c!14557 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520) Nil!1520))))))

(declare-fun b!88404 () Bool)

(declare-fun e!57576 () Bool)

(assert (=> b!88404 (= e!57576 (contains!758 (ite c!14557 (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520) Nil!1520) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88405 () Bool)

(assert (=> b!88405 (= e!57577 call!8512)))

(declare-fun b!88406 () Bool)

(assert (=> b!88406 (= e!57575 e!57574)))

(declare-fun res!45280 () Bool)

(assert (=> b!88406 (=> (not res!45280) (not e!57574))))

(assert (=> b!88406 (= res!45280 (not e!57576))))

(declare-fun res!45281 () Bool)

(assert (=> b!88406 (=> (not res!45281) (not e!57576))))

(assert (=> b!88406 (= res!45281 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!23527 (not res!45282)) b!88406))

(assert (= (and b!88406 res!45281) b!88404))

(assert (= (and b!88406 res!45280) b!88403))

(assert (= (and b!88403 c!14627) b!88405))

(assert (= (and b!88403 (not c!14627)) b!88402))

(assert (= (or b!88405 b!88402) bm!8509))

(declare-fun m!94617 () Bool)

(assert (=> b!88403 m!94617))

(assert (=> b!88403 m!94617))

(declare-fun m!94619 () Bool)

(assert (=> b!88403 m!94619))

(assert (=> bm!8509 m!94617))

(declare-fun m!94621 () Bool)

(assert (=> bm!8509 m!94621))

(assert (=> b!88404 m!94617))

(assert (=> b!88404 m!94617))

(declare-fun m!94623 () Bool)

(assert (=> b!88404 m!94623))

(assert (=> b!88406 m!94617))

(assert (=> b!88406 m!94617))

(assert (=> b!88406 m!94619))

(assert (=> bm!8473 d!23527))

(declare-fun d!23529 () Bool)

(declare-fun lt!42279 () Bool)

(assert (=> d!23529 (= lt!42279 (select (content!91 (toList!748 lt!42012)) lt!41733))))

(declare-fun e!57578 () Bool)

(assert (=> d!23529 (= lt!42279 e!57578)))

(declare-fun res!45284 () Bool)

(assert (=> d!23529 (=> (not res!45284) (not e!57578))))

(assert (=> d!23529 (= res!45284 ((_ is Cons!1518) (toList!748 lt!42012)))))

(assert (=> d!23529 (= (contains!757 (toList!748 lt!42012) lt!41733) lt!42279)))

(declare-fun b!88407 () Bool)

(declare-fun e!57579 () Bool)

(assert (=> b!88407 (= e!57578 e!57579)))

(declare-fun res!45283 () Bool)

(assert (=> b!88407 (=> res!45283 e!57579)))

(assert (=> b!88407 (= res!45283 (= (h!2110 (toList!748 lt!42012)) lt!41733))))

(declare-fun b!88408 () Bool)

(assert (=> b!88408 (= e!57579 (contains!757 (t!5264 (toList!748 lt!42012)) lt!41733))))

(assert (= (and d!23529 res!45284) b!88407))

(assert (= (and b!88407 (not res!45283)) b!88408))

(declare-fun m!94625 () Bool)

(assert (=> d!23529 m!94625))

(declare-fun m!94627 () Bool)

(assert (=> d!23529 m!94627))

(declare-fun m!94629 () Bool)

(assert (=> b!88408 m!94629))

(assert (=> b!88090 d!23529))

(declare-fun d!23531 () Bool)

(declare-fun e!57581 () Bool)

(assert (=> d!23531 e!57581))

(declare-fun res!45285 () Bool)

(assert (=> d!23531 (=> res!45285 e!57581)))

(declare-fun lt!42283 () Bool)

(assert (=> d!23531 (= res!45285 (not lt!42283))))

(declare-fun lt!42280 () Bool)

(assert (=> d!23531 (= lt!42283 lt!42280)))

(declare-fun lt!42281 () Unit!2600)

(declare-fun e!57580 () Unit!2600)

(assert (=> d!23531 (= lt!42281 e!57580)))

(declare-fun c!14628 () Bool)

(assert (=> d!23531 (= c!14628 lt!42280)))

(assert (=> d!23531 (= lt!42280 (containsKey!145 (toList!748 call!8427) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23531 (= (contains!756 call!8427 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) lt!42283)))

(declare-fun b!88409 () Bool)

(declare-fun lt!42282 () Unit!2600)

(assert (=> b!88409 (= e!57580 lt!42282)))

(assert (=> b!88409 (= lt!42282 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 call!8427) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> b!88409 (isDefined!94 (getValueByKey!141 (toList!748 call!8427) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88410 () Bool)

(declare-fun Unit!2619 () Unit!2600)

(assert (=> b!88410 (= e!57580 Unit!2619)))

(declare-fun b!88411 () Bool)

(assert (=> b!88411 (= e!57581 (isDefined!94 (getValueByKey!141 (toList!748 call!8427) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (= (and d!23531 c!14628) b!88409))

(assert (= (and d!23531 (not c!14628)) b!88410))

(assert (= (and d!23531 (not res!45285)) b!88411))

(assert (=> d!23531 m!93699))

(declare-fun m!94631 () Bool)

(assert (=> d!23531 m!94631))

(assert (=> b!88409 m!93699))

(declare-fun m!94633 () Bool)

(assert (=> b!88409 m!94633))

(assert (=> b!88409 m!93699))

(declare-fun m!94635 () Bool)

(assert (=> b!88409 m!94635))

(assert (=> b!88409 m!94635))

(declare-fun m!94637 () Bool)

(assert (=> b!88409 m!94637))

(assert (=> b!88411 m!93699))

(assert (=> b!88411 m!94635))

(assert (=> b!88411 m!94635))

(assert (=> b!88411 m!94637))

(assert (=> b!87947 d!23531))

(declare-fun d!23533 () Bool)

(declare-fun e!57594 () Bool)

(assert (=> d!23533 e!57594))

(declare-fun res!45287 () Bool)

(assert (=> d!23533 (=> (not res!45287) (not e!57594))))

(assert (=> d!23533 (= res!45287 (or (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))))

(declare-fun lt!42292 () ListLongMap!1465)

(declare-fun lt!42299 () ListLongMap!1465)

(assert (=> d!23533 (= lt!42292 lt!42299)))

(declare-fun lt!42293 () Unit!2600)

(declare-fun e!57587 () Unit!2600)

(assert (=> d!23533 (= lt!42293 e!57587)))

(declare-fun c!14631 () Bool)

(declare-fun e!57592 () Bool)

(assert (=> d!23533 (= c!14631 e!57592)))

(declare-fun res!45292 () Bool)

(assert (=> d!23533 (=> (not res!45292) (not e!57592))))

(assert (=> d!23533 (= res!45292 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun e!57590 () ListLongMap!1465)

(assert (=> d!23533 (= lt!42299 e!57590)))

(declare-fun c!14630 () Bool)

(assert (=> d!23533 (= c!14630 (and (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23533 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23533 (= (getCurrentListMap!441 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) lt!42292)))

(declare-fun call!8518 () ListLongMap!1465)

(declare-fun b!88412 () Bool)

(assert (=> b!88412 (= e!57590 (+!112 call!8518 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)))))))

(declare-fun b!88413 () Bool)

(declare-fun e!57588 () Bool)

(assert (=> b!88413 (= e!57588 (= (apply!83 lt!42292 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2249 newMap!16)))))

(declare-fun b!88414 () Bool)

(declare-fun e!57591 () Bool)

(declare-fun call!8517 () Bool)

(assert (=> b!88414 (= e!57591 (not call!8517))))

(declare-fun e!57584 () Bool)

(declare-fun b!88415 () Bool)

(assert (=> b!88415 (= e!57584 (= (apply!83 lt!42292 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)) (get!1201 (select (arr!1926 (ite c!14502 (_values!2342 newMap!16) lt!41886)) #b00000000000000000000000000000000) (dynLambda!342 (defaultEntry!2359 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2171 (ite c!14502 (_values!2342 newMap!16) lt!41886))))))

(assert (=> b!88415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88416 () Bool)

(declare-fun e!57582 () Bool)

(declare-fun call!8515 () Bool)

(assert (=> b!88416 (= e!57582 (not call!8515))))

(declare-fun b!88417 () Bool)

(declare-fun e!57589 () Bool)

(assert (=> b!88417 (= e!57589 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88418 () Bool)

(declare-fun res!45289 () Bool)

(assert (=> b!88418 (=> (not res!45289) (not e!57594))))

(assert (=> b!88418 (= res!45289 e!57582)))

(declare-fun c!14632 () Bool)

(assert (=> b!88418 (= c!14632 (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8510 () Bool)

(declare-fun call!8519 () ListLongMap!1465)

(assert (=> bm!8510 (= call!8519 call!8518)))

(declare-fun b!88419 () Bool)

(declare-fun Unit!2620 () Unit!2600)

(assert (=> b!88419 (= e!57587 Unit!2620)))

(declare-fun b!88420 () Bool)

(declare-fun lt!42297 () Unit!2600)

(assert (=> b!88420 (= e!57587 lt!42297)))

(declare-fun lt!42298 () ListLongMap!1465)

(assert (=> b!88420 (= lt!42298 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42301 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42305 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42305 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42290 () Unit!2600)

(assert (=> b!88420 (= lt!42290 (addStillContains!59 lt!42298 lt!42301 (zeroValue!2249 newMap!16) lt!42305))))

(assert (=> b!88420 (contains!756 (+!112 lt!42298 (tuple2!2205 lt!42301 (zeroValue!2249 newMap!16))) lt!42305)))

(declare-fun lt!42304 () Unit!2600)

(assert (=> b!88420 (= lt!42304 lt!42290)))

(declare-fun lt!42287 () ListLongMap!1465)

(assert (=> b!88420 (= lt!42287 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42302 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42302 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42303 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42303 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42286 () Unit!2600)

(assert (=> b!88420 (= lt!42286 (addApplyDifferent!59 lt!42287 lt!42302 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) lt!42303))))

(assert (=> b!88420 (= (apply!83 (+!112 lt!42287 (tuple2!2205 lt!42302 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)))) lt!42303) (apply!83 lt!42287 lt!42303))))

(declare-fun lt!42294 () Unit!2600)

(assert (=> b!88420 (= lt!42294 lt!42286)))

(declare-fun lt!42289 () ListLongMap!1465)

(assert (=> b!88420 (= lt!42289 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42284 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42296 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42296 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42291 () Unit!2600)

(assert (=> b!88420 (= lt!42291 (addApplyDifferent!59 lt!42289 lt!42284 (zeroValue!2249 newMap!16) lt!42296))))

(assert (=> b!88420 (= (apply!83 (+!112 lt!42289 (tuple2!2205 lt!42284 (zeroValue!2249 newMap!16))) lt!42296) (apply!83 lt!42289 lt!42296))))

(declare-fun lt!42285 () Unit!2600)

(assert (=> b!88420 (= lt!42285 lt!42291)))

(declare-fun lt!42295 () ListLongMap!1465)

(assert (=> b!88420 (= lt!42295 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42300 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42288 () (_ BitVec 64))

(assert (=> b!88420 (= lt!42288 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88420 (= lt!42297 (addApplyDifferent!59 lt!42295 lt!42300 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) lt!42288))))

(assert (=> b!88420 (= (apply!83 (+!112 lt!42295 (tuple2!2205 lt!42300 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)))) lt!42288) (apply!83 lt!42295 lt!42288))))

(declare-fun b!88421 () Bool)

(declare-fun c!14629 () Bool)

(assert (=> b!88421 (= c!14629 (and (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57593 () ListLongMap!1465)

(declare-fun e!57585 () ListLongMap!1465)

(assert (=> b!88421 (= e!57593 e!57585)))

(declare-fun b!88422 () Bool)

(declare-fun e!57583 () Bool)

(assert (=> b!88422 (= e!57583 e!57584)))

(declare-fun res!45294 () Bool)

(assert (=> b!88422 (=> (not res!45294) (not e!57584))))

(assert (=> b!88422 (= res!45294 (contains!756 lt!42292 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88423 () Bool)

(declare-fun call!8513 () ListLongMap!1465)

(assert (=> b!88423 (= e!57585 call!8513)))

(declare-fun b!88424 () Bool)

(assert (=> b!88424 (= e!57582 e!57588)))

(declare-fun res!45290 () Bool)

(assert (=> b!88424 (= res!45290 call!8515)))

(assert (=> b!88424 (=> (not res!45290) (not e!57588))))

(declare-fun e!57586 () Bool)

(declare-fun b!88425 () Bool)

(assert (=> b!88425 (= e!57586 (= (apply!83 lt!42292 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16))))))

(declare-fun bm!8511 () Bool)

(assert (=> bm!8511 (= call!8517 (contains!756 lt!42292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!8514 () ListLongMap!1465)

(declare-fun bm!8512 () Bool)

(assert (=> bm!8512 (= call!8514 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite c!14502 (_values!2342 newMap!16) lt!41886) (mask!6397 newMap!16) (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) (zeroValue!2249 newMap!16) (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun bm!8513 () Bool)

(assert (=> bm!8513 (= call!8515 (contains!756 lt!42292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88426 () Bool)

(assert (=> b!88426 (= e!57593 call!8519)))

(declare-fun b!88427 () Bool)

(assert (=> b!88427 (= e!57590 e!57593)))

(declare-fun c!14634 () Bool)

(assert (=> b!88427 (= c!14634 (and (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88428 () Bool)

(declare-fun res!45288 () Bool)

(assert (=> b!88428 (=> (not res!45288) (not e!57594))))

(assert (=> b!88428 (= res!45288 e!57583)))

(declare-fun res!45293 () Bool)

(assert (=> b!88428 (=> res!45293 e!57583)))

(assert (=> b!88428 (= res!45293 (not e!57589))))

(declare-fun res!45286 () Bool)

(assert (=> b!88428 (=> (not res!45286) (not e!57589))))

(assert (=> b!88428 (= res!45286 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88429 () Bool)

(assert (=> b!88429 (= e!57594 e!57591)))

(declare-fun c!14633 () Bool)

(assert (=> b!88429 (= c!14633 (not (= (bvand (ite c!14502 (ite c!14503 (extraKeys!2194 newMap!16) lt!41889) (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8514 () Bool)

(declare-fun call!8516 () ListLongMap!1465)

(assert (=> bm!8514 (= call!8518 (+!112 (ite c!14630 call!8514 (ite c!14634 call!8516 call!8513)) (ite (or c!14630 c!14634) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 newMap!16)) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14502 (ite c!14503 (minValue!2249 newMap!16) lt!41734) (minValue!2249 newMap!16))))))))

(declare-fun b!88430 () Bool)

(assert (=> b!88430 (= e!57585 call!8519)))

(declare-fun bm!8515 () Bool)

(assert (=> bm!8515 (= call!8516 call!8514)))

(declare-fun b!88431 () Bool)

(assert (=> b!88431 (= e!57591 e!57586)))

(declare-fun res!45291 () Bool)

(assert (=> b!88431 (= res!45291 call!8517)))

(assert (=> b!88431 (=> (not res!45291) (not e!57586))))

(declare-fun bm!8516 () Bool)

(assert (=> bm!8516 (= call!8513 call!8516)))

(declare-fun b!88432 () Bool)

(assert (=> b!88432 (= e!57592 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23533 c!14630) b!88412))

(assert (= (and d!23533 (not c!14630)) b!88427))

(assert (= (and b!88427 c!14634) b!88426))

(assert (= (and b!88427 (not c!14634)) b!88421))

(assert (= (and b!88421 c!14629) b!88430))

(assert (= (and b!88421 (not c!14629)) b!88423))

(assert (= (or b!88430 b!88423) bm!8516))

(assert (= (or b!88426 bm!8516) bm!8515))

(assert (= (or b!88426 b!88430) bm!8510))

(assert (= (or b!88412 bm!8515) bm!8512))

(assert (= (or b!88412 bm!8510) bm!8514))

(assert (= (and d!23533 res!45292) b!88432))

(assert (= (and d!23533 c!14631) b!88420))

(assert (= (and d!23533 (not c!14631)) b!88419))

(assert (= (and d!23533 res!45287) b!88428))

(assert (= (and b!88428 res!45286) b!88417))

(assert (= (and b!88428 (not res!45293)) b!88422))

(assert (= (and b!88422 res!45294) b!88415))

(assert (= (and b!88428 res!45288) b!88418))

(assert (= (and b!88418 c!14632) b!88424))

(assert (= (and b!88418 (not c!14632)) b!88416))

(assert (= (and b!88424 res!45290) b!88413))

(assert (= (or b!88424 b!88416) bm!8513))

(assert (= (and b!88418 res!45289) b!88429))

(assert (= (and b!88429 c!14633) b!88431))

(assert (= (and b!88429 (not c!14633)) b!88414))

(assert (= (and b!88431 res!45291) b!88425))

(assert (= (or b!88431 b!88414) bm!8511))

(declare-fun b_lambda!3915 () Bool)

(assert (=> (not b_lambda!3915) (not b!88415)))

(assert (=> b!88415 t!5271))

(declare-fun b_and!5319 () Bool)

(assert (= b_and!5315 (and (=> t!5271 result!2955) b_and!5319)))

(assert (=> b!88415 t!5273))

(declare-fun b_and!5321 () Bool)

(assert (= b_and!5317 (and (=> t!5273 result!2957) b_and!5321)))

(declare-fun m!94639 () Bool)

(assert (=> bm!8513 m!94639))

(declare-fun m!94641 () Bool)

(assert (=> b!88415 m!94641))

(assert (=> b!88415 m!94259))

(declare-fun m!94643 () Bool)

(assert (=> b!88415 m!94643))

(assert (=> b!88415 m!94263))

(declare-fun m!94645 () Bool)

(assert (=> b!88415 m!94645))

(assert (=> b!88415 m!94641))

(assert (=> b!88415 m!94259))

(assert (=> b!88415 m!94263))

(declare-fun m!94647 () Bool)

(assert (=> b!88425 m!94647))

(declare-fun m!94649 () Bool)

(assert (=> bm!8512 m!94649))

(assert (=> b!88417 m!94263))

(assert (=> b!88417 m!94263))

(assert (=> b!88417 m!94271))

(declare-fun m!94651 () Bool)

(assert (=> b!88413 m!94651))

(declare-fun m!94653 () Bool)

(assert (=> b!88412 m!94653))

(assert (=> b!88422 m!94263))

(assert (=> b!88422 m!94263))

(declare-fun m!94655 () Bool)

(assert (=> b!88422 m!94655))

(declare-fun m!94657 () Bool)

(assert (=> b!88420 m!94657))

(declare-fun m!94659 () Bool)

(assert (=> b!88420 m!94659))

(declare-fun m!94661 () Bool)

(assert (=> b!88420 m!94661))

(declare-fun m!94663 () Bool)

(assert (=> b!88420 m!94663))

(declare-fun m!94665 () Bool)

(assert (=> b!88420 m!94665))

(declare-fun m!94667 () Bool)

(assert (=> b!88420 m!94667))

(assert (=> b!88420 m!94661))

(declare-fun m!94669 () Bool)

(assert (=> b!88420 m!94669))

(declare-fun m!94671 () Bool)

(assert (=> b!88420 m!94671))

(assert (=> b!88420 m!94263))

(declare-fun m!94673 () Bool)

(assert (=> b!88420 m!94673))

(declare-fun m!94675 () Bool)

(assert (=> b!88420 m!94675))

(declare-fun m!94677 () Bool)

(assert (=> b!88420 m!94677))

(assert (=> b!88420 m!94649))

(assert (=> b!88420 m!94657))

(assert (=> b!88420 m!94675))

(assert (=> b!88420 m!94667))

(declare-fun m!94679 () Bool)

(assert (=> b!88420 m!94679))

(declare-fun m!94681 () Bool)

(assert (=> b!88420 m!94681))

(declare-fun m!94683 () Bool)

(assert (=> b!88420 m!94683))

(declare-fun m!94685 () Bool)

(assert (=> b!88420 m!94685))

(assert (=> d!23533 m!94251))

(declare-fun m!94687 () Bool)

(assert (=> bm!8514 m!94687))

(declare-fun m!94689 () Bool)

(assert (=> bm!8511 m!94689))

(assert (=> b!88432 m!94263))

(assert (=> b!88432 m!94263))

(assert (=> b!88432 m!94271))

(assert (=> bm!8429 d!23533))

(declare-fun b!88433 () Bool)

(declare-fun lt!42309 () ListLongMap!1465)

(declare-fun e!57600 () Bool)

(assert (=> b!88433 (= e!57600 (= lt!42309 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88434 () Bool)

(declare-fun e!57599 () Bool)

(assert (=> b!88434 (= e!57599 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88434 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!88435 () Bool)

(declare-fun e!57598 () ListLongMap!1465)

(declare-fun call!8520 () ListLongMap!1465)

(assert (=> b!88435 (= e!57598 call!8520)))

(declare-fun b!88436 () Bool)

(assert (=> b!88436 (= e!57600 (isEmpty!338 lt!42309))))

(declare-fun b!88437 () Bool)

(declare-fun e!57601 () Bool)

(declare-fun e!57597 () Bool)

(assert (=> b!88437 (= e!57601 e!57597)))

(assert (=> b!88437 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun res!45298 () Bool)

(assert (=> b!88437 (= res!45298 (contains!756 lt!42309 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88437 (=> (not res!45298) (not e!57597))))

(declare-fun b!88438 () Bool)

(declare-fun e!57595 () ListLongMap!1465)

(assert (=> b!88438 (= e!57595 e!57598)))

(declare-fun c!14635 () Bool)

(assert (=> b!88438 (= c!14635 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88439 () Bool)

(assert (=> b!88439 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> b!88439 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2171 (_values!2342 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> b!88439 (= e!57597 (= (apply!83 lt!42309 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88440 () Bool)

(declare-fun lt!42311 () Unit!2600)

(declare-fun lt!42312 () Unit!2600)

(assert (=> b!88440 (= lt!42311 lt!42312)))

(declare-fun lt!42307 () (_ BitVec 64))

(declare-fun lt!42310 () (_ BitVec 64))

(declare-fun lt!42308 () ListLongMap!1465)

(declare-fun lt!42306 () V!3035)

(assert (=> b!88440 (not (contains!756 (+!112 lt!42308 (tuple2!2205 lt!42307 lt!42306)) lt!42310))))

(assert (=> b!88440 (= lt!42312 (addStillNotContains!32 lt!42308 lt!42307 lt!42306 lt!42310))))

(assert (=> b!88440 (= lt!42310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88440 (= lt!42306 (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88440 (= lt!42307 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!88440 (= lt!42308 call!8520)))

(assert (=> b!88440 (= e!57598 (+!112 call!8520 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1201 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!8517 () Bool)

(assert (=> bm!8517 (= call!8520 (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88442 () Bool)

(declare-fun e!57596 () Bool)

(assert (=> b!88442 (= e!57596 e!57601)))

(declare-fun c!14637 () Bool)

(assert (=> b!88442 (= c!14637 e!57599)))

(declare-fun res!45296 () Bool)

(assert (=> b!88442 (=> (not res!45296) (not e!57599))))

(assert (=> b!88442 (= res!45296 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88443 () Bool)

(declare-fun res!45295 () Bool)

(assert (=> b!88443 (=> (not res!45295) (not e!57596))))

(assert (=> b!88443 (= res!45295 (not (contains!756 lt!42309 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88444 () Bool)

(assert (=> b!88444 (= e!57601 e!57600)))

(declare-fun c!14638 () Bool)

(assert (=> b!88444 (= c!14638 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88441 () Bool)

(assert (=> b!88441 (= e!57595 (ListLongMap!1466 Nil!1519))))

(declare-fun d!23535 () Bool)

(assert (=> d!23535 e!57596))

(declare-fun res!45297 () Bool)

(assert (=> d!23535 (=> (not res!45297) (not e!57596))))

(assert (=> d!23535 (= res!45297 (not (contains!756 lt!42309 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23535 (= lt!42309 e!57595)))

(declare-fun c!14636 () Bool)

(assert (=> d!23535 (= c!14636 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23535 (validMask!0 (mask!6397 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23535 (= (getCurrentListMapNoExtraKeys!77 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) lt!42309)))

(assert (= (and d!23535 c!14636) b!88441))

(assert (= (and d!23535 (not c!14636)) b!88438))

(assert (= (and b!88438 c!14635) b!88440))

(assert (= (and b!88438 (not c!14635)) b!88435))

(assert (= (or b!88440 b!88435) bm!8517))

(assert (= (and d!23535 res!45297) b!88443))

(assert (= (and b!88443 res!45295) b!88442))

(assert (= (and b!88442 res!45296) b!88434))

(assert (= (and b!88442 c!14637) b!88437))

(assert (= (and b!88442 (not c!14637)) b!88444))

(assert (= (and b!88437 res!45298) b!88439))

(assert (= (and b!88444 c!14638) b!88433))

(assert (= (and b!88444 (not c!14638)) b!88436))

(declare-fun b_lambda!3917 () Bool)

(assert (=> (not b_lambda!3917) (not b!88439)))

(assert (=> b!88439 t!5261))

(declare-fun b_and!5323 () Bool)

(assert (= b_and!5319 (and (=> t!5261 result!2941) b_and!5323)))

(assert (=> b!88439 t!5263))

(declare-fun b_and!5325 () Bool)

(assert (= b_and!5321 (and (=> t!5263 result!2945) b_and!5325)))

(declare-fun b_lambda!3919 () Bool)

(assert (=> (not b_lambda!3919) (not b!88440)))

(assert (=> b!88440 t!5261))

(declare-fun b_and!5327 () Bool)

(assert (= b_and!5323 (and (=> t!5261 result!2941) b_and!5327)))

(assert (=> b!88440 t!5263))

(declare-fun b_and!5329 () Bool)

(assert (= b_and!5325 (and (=> t!5263 result!2945) b_and!5329)))

(declare-fun m!94691 () Bool)

(assert (=> b!88437 m!94691))

(assert (=> b!88437 m!94691))

(declare-fun m!94693 () Bool)

(assert (=> b!88437 m!94693))

(assert (=> b!88434 m!94691))

(assert (=> b!88434 m!94691))

(declare-fun m!94695 () Bool)

(assert (=> b!88434 m!94695))

(declare-fun m!94697 () Bool)

(assert (=> b!88436 m!94697))

(assert (=> b!88439 m!93703))

(assert (=> b!88439 m!94691))

(declare-fun m!94699 () Bool)

(assert (=> b!88439 m!94699))

(declare-fun m!94701 () Bool)

(assert (=> b!88439 m!94701))

(assert (=> b!88439 m!93703))

(declare-fun m!94703 () Bool)

(assert (=> b!88439 m!94703))

(assert (=> b!88439 m!94691))

(assert (=> b!88439 m!94701))

(declare-fun m!94705 () Bool)

(assert (=> b!88440 m!94705))

(assert (=> b!88440 m!94705))

(declare-fun m!94707 () Bool)

(assert (=> b!88440 m!94707))

(assert (=> b!88440 m!93703))

(assert (=> b!88440 m!94701))

(assert (=> b!88440 m!93703))

(assert (=> b!88440 m!94703))

(assert (=> b!88440 m!94691))

(assert (=> b!88440 m!94701))

(declare-fun m!94709 () Bool)

(assert (=> b!88440 m!94709))

(declare-fun m!94711 () Bool)

(assert (=> b!88440 m!94711))

(declare-fun m!94713 () Bool)

(assert (=> b!88433 m!94713))

(assert (=> b!88438 m!94691))

(assert (=> b!88438 m!94691))

(assert (=> b!88438 m!94695))

(declare-fun m!94715 () Bool)

(assert (=> b!88443 m!94715))

(assert (=> bm!8517 m!94713))

(declare-fun m!94717 () Bool)

(assert (=> d!23535 m!94717))

(assert (=> d!23535 m!93745))

(assert (=> bm!8470 d!23535))

(declare-fun d!23537 () Bool)

(assert (=> d!23537 (isDefined!94 (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun lt!42315 () Unit!2600)

(declare-fun choose!521 (List!1522 (_ BitVec 64)) Unit!2600)

(assert (=> d!23537 (= lt!42315 (choose!521 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun e!57604 () Bool)

(assert (=> d!23537 e!57604))

(declare-fun res!45301 () Bool)

(assert (=> d!23537 (=> (not res!45301) (not e!57604))))

(assert (=> d!23537 (= res!45301 (isStrictlySorted!299 (toList!748 lt!41740)))))

(assert (=> d!23537 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) lt!42315)))

(declare-fun b!88447 () Bool)

(assert (=> b!88447 (= e!57604 (containsKey!145 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (= (and d!23537 res!45301) b!88447))

(assert (=> d!23537 m!93699))

(assert (=> d!23537 m!93833))

(assert (=> d!23537 m!93833))

(assert (=> d!23537 m!93835))

(assert (=> d!23537 m!93699))

(declare-fun m!94719 () Bool)

(assert (=> d!23537 m!94719))

(declare-fun m!94721 () Bool)

(assert (=> d!23537 m!94721))

(assert (=> b!88447 m!93699))

(assert (=> b!88447 m!93829))

(assert (=> b!87833 d!23537))

(declare-fun d!23539 () Bool)

(declare-fun isEmpty!340 (Option!147) Bool)

(assert (=> d!23539 (= (isDefined!94 (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))) (not (isEmpty!340 (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))))

(declare-fun bs!3738 () Bool)

(assert (= bs!3738 d!23539))

(assert (=> bs!3738 m!93833))

(declare-fun m!94723 () Bool)

(assert (=> bs!3738 m!94723))

(assert (=> b!87833 d!23539))

(declare-fun b!88448 () Bool)

(declare-fun e!57605 () Option!147)

(assert (=> b!88448 (= e!57605 (Some!146 (_2!1113 (h!2110 (toList!748 lt!41740)))))))

(declare-fun b!88449 () Bool)

(declare-fun e!57606 () Option!147)

(assert (=> b!88449 (= e!57605 e!57606)))

(declare-fun c!14640 () Bool)

(assert (=> b!88449 (= c!14640 (and ((_ is Cons!1518) (toList!748 lt!41740)) (not (= (_1!1113 (h!2110 (toList!748 lt!41740))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))))

(declare-fun d!23541 () Bool)

(declare-fun c!14639 () Bool)

(assert (=> d!23541 (= c!14639 (and ((_ is Cons!1518) (toList!748 lt!41740)) (= (_1!1113 (h!2110 (toList!748 lt!41740))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (=> d!23541 (= (getValueByKey!141 (toList!748 lt!41740) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) e!57605)))

(declare-fun b!88450 () Bool)

(assert (=> b!88450 (= e!57606 (getValueByKey!141 (t!5264 (toList!748 lt!41740)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88451 () Bool)

(assert (=> b!88451 (= e!57606 None!145)))

(assert (= (and d!23541 c!14639) b!88448))

(assert (= (and d!23541 (not c!14639)) b!88449))

(assert (= (and b!88449 c!14640) b!88450))

(assert (= (and b!88449 (not c!14640)) b!88451))

(assert (=> b!88450 m!93699))

(declare-fun m!94725 () Bool)

(assert (=> b!88450 m!94725))

(assert (=> b!87833 d!23541))

(assert (=> d!23395 d!23399))

(declare-fun d!23543 () Bool)

(assert (=> d!23543 (not (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23543 true))

(declare-fun _$68!76 () Unit!2600)

(assert (=> d!23543 (= (choose!68 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (Cons!1519 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) Nil!1520)) _$68!76)))

(declare-fun bs!3739 () Bool)

(assert (= bs!3739 d!23543))

(assert (=> bs!3739 m!93699))

(assert (=> bs!3739 m!93719))

(assert (=> d!23395 d!23543))

(declare-fun d!23545 () Bool)

(declare-fun e!57608 () Bool)

(assert (=> d!23545 e!57608))

(declare-fun res!45302 () Bool)

(assert (=> d!23545 (=> res!45302 e!57608)))

(declare-fun lt!42319 () Bool)

(assert (=> d!23545 (= res!45302 (not lt!42319))))

(declare-fun lt!42316 () Bool)

(assert (=> d!23545 (= lt!42319 lt!42316)))

(declare-fun lt!42317 () Unit!2600)

(declare-fun e!57607 () Unit!2600)

(assert (=> d!23545 (= lt!42317 e!57607)))

(declare-fun c!14641 () Bool)

(assert (=> d!23545 (= c!14641 lt!42316)))

(assert (=> d!23545 (= lt!42316 (containsKey!145 (toList!748 lt!42016) (_1!1113 lt!41744)))))

(assert (=> d!23545 (= (contains!756 lt!42016 (_1!1113 lt!41744)) lt!42319)))

(declare-fun b!88452 () Bool)

(declare-fun lt!42318 () Unit!2600)

(assert (=> b!88452 (= e!57607 lt!42318)))

(assert (=> b!88452 (= lt!42318 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42016) (_1!1113 lt!41744)))))

(assert (=> b!88452 (isDefined!94 (getValueByKey!141 (toList!748 lt!42016) (_1!1113 lt!41744)))))

(declare-fun b!88453 () Bool)

(declare-fun Unit!2621 () Unit!2600)

(assert (=> b!88453 (= e!57607 Unit!2621)))

(declare-fun b!88454 () Bool)

(assert (=> b!88454 (= e!57608 (isDefined!94 (getValueByKey!141 (toList!748 lt!42016) (_1!1113 lt!41744))))))

(assert (= (and d!23545 c!14641) b!88452))

(assert (= (and d!23545 (not c!14641)) b!88453))

(assert (= (and d!23545 (not res!45302)) b!88454))

(declare-fun m!94727 () Bool)

(assert (=> d!23545 m!94727))

(declare-fun m!94729 () Bool)

(assert (=> b!88452 m!94729))

(assert (=> b!88452 m!94041))

(assert (=> b!88452 m!94041))

(declare-fun m!94731 () Bool)

(assert (=> b!88452 m!94731))

(assert (=> b!88454 m!94041))

(assert (=> b!88454 m!94041))

(assert (=> b!88454 m!94731))

(assert (=> d!23377 d!23545))

(declare-fun b!88455 () Bool)

(declare-fun e!57609 () Option!147)

(assert (=> b!88455 (= e!57609 (Some!146 (_2!1113 (h!2110 lt!42017))))))

(declare-fun b!88456 () Bool)

(declare-fun e!57610 () Option!147)

(assert (=> b!88456 (= e!57609 e!57610)))

(declare-fun c!14643 () Bool)

(assert (=> b!88456 (= c!14643 (and ((_ is Cons!1518) lt!42017) (not (= (_1!1113 (h!2110 lt!42017)) (_1!1113 lt!41744)))))))

(declare-fun d!23547 () Bool)

(declare-fun c!14642 () Bool)

(assert (=> d!23547 (= c!14642 (and ((_ is Cons!1518) lt!42017) (= (_1!1113 (h!2110 lt!42017)) (_1!1113 lt!41744))))))

(assert (=> d!23547 (= (getValueByKey!141 lt!42017 (_1!1113 lt!41744)) e!57609)))

(declare-fun b!88457 () Bool)

(assert (=> b!88457 (= e!57610 (getValueByKey!141 (t!5264 lt!42017) (_1!1113 lt!41744)))))

(declare-fun b!88458 () Bool)

(assert (=> b!88458 (= e!57610 None!145)))

(assert (= (and d!23547 c!14642) b!88455))

(assert (= (and d!23547 (not c!14642)) b!88456))

(assert (= (and b!88456 c!14643) b!88457))

(assert (= (and b!88456 (not c!14643)) b!88458))

(declare-fun m!94733 () Bool)

(assert (=> b!88457 m!94733))

(assert (=> d!23377 d!23547))

(declare-fun d!23549 () Bool)

(assert (=> d!23549 (= (getValueByKey!141 lt!42017 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(declare-fun lt!42320 () Unit!2600)

(assert (=> d!23549 (= lt!42320 (choose!517 lt!42017 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun e!57611 () Bool)

(assert (=> d!23549 e!57611))

(declare-fun res!45303 () Bool)

(assert (=> d!23549 (=> (not res!45303) (not e!57611))))

(assert (=> d!23549 (= res!45303 (isStrictlySorted!299 lt!42017))))

(assert (=> d!23549 (= (lemmaContainsTupThenGetReturnValue!58 lt!42017 (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42320)))

(declare-fun b!88459 () Bool)

(declare-fun res!45304 () Bool)

(assert (=> b!88459 (=> (not res!45304) (not e!57611))))

(assert (=> b!88459 (= res!45304 (containsKey!145 lt!42017 (_1!1113 lt!41744)))))

(declare-fun b!88460 () Bool)

(assert (=> b!88460 (= e!57611 (contains!757 lt!42017 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(assert (= (and d!23549 res!45303) b!88459))

(assert (= (and b!88459 res!45304) b!88460))

(assert (=> d!23549 m!94035))

(declare-fun m!94735 () Bool)

(assert (=> d!23549 m!94735))

(declare-fun m!94737 () Bool)

(assert (=> d!23549 m!94737))

(declare-fun m!94739 () Bool)

(assert (=> b!88459 m!94739))

(declare-fun m!94741 () Bool)

(assert (=> b!88460 m!94741))

(assert (=> d!23377 d!23549))

(declare-fun bm!8518 () Bool)

(declare-fun c!14645 () Bool)

(declare-fun call!8523 () List!1522)

(declare-fun e!57616 () List!1522)

(assert (=> bm!8518 (= call!8523 ($colon$colon!73 e!57616 (ite c!14645 (h!2110 (toList!748 lt!41747)) (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744)))))))

(declare-fun c!14647 () Bool)

(assert (=> bm!8518 (= c!14647 c!14645)))

(declare-fun b!88461 () Bool)

(declare-fun c!14646 () Bool)

(assert (=> b!88461 (= c!14646 (and ((_ is Cons!1518) (toList!748 lt!41747)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41744))))))

(declare-fun e!57612 () List!1522)

(declare-fun e!57614 () List!1522)

(assert (=> b!88461 (= e!57612 e!57614)))

(declare-fun b!88462 () Bool)

(declare-fun e!57613 () List!1522)

(assert (=> b!88462 (= e!57613 e!57612)))

(declare-fun c!14644 () Bool)

(assert (=> b!88462 (= c!14644 (and ((_ is Cons!1518) (toList!748 lt!41747)) (= (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41744))))))

(declare-fun b!88463 () Bool)

(declare-fun call!8522 () List!1522)

(assert (=> b!88463 (= e!57614 call!8522)))

(declare-fun b!88464 () Bool)

(declare-fun res!45306 () Bool)

(declare-fun e!57615 () Bool)

(assert (=> b!88464 (=> (not res!45306) (not e!57615))))

(declare-fun lt!42321 () List!1522)

(assert (=> b!88464 (= res!45306 (containsKey!145 lt!42321 (_1!1113 lt!41744)))))

(declare-fun b!88465 () Bool)

(assert (=> b!88465 (= e!57614 call!8522)))

(declare-fun d!23551 () Bool)

(assert (=> d!23551 e!57615))

(declare-fun res!45305 () Bool)

(assert (=> d!23551 (=> (not res!45305) (not e!57615))))

(assert (=> d!23551 (= res!45305 (isStrictlySorted!299 lt!42321))))

(assert (=> d!23551 (= lt!42321 e!57613)))

(assert (=> d!23551 (= c!14645 (and ((_ is Cons!1518) (toList!748 lt!41747)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41747))) (_1!1113 lt!41744))))))

(assert (=> d!23551 (isStrictlySorted!299 (toList!748 lt!41747))))

(assert (=> d!23551 (= (insertStrictlySorted!61 (toList!748 lt!41747) (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42321)))

(declare-fun b!88466 () Bool)

(declare-fun call!8521 () List!1522)

(assert (=> b!88466 (= e!57612 call!8521)))

(declare-fun b!88467 () Bool)

(assert (=> b!88467 (= e!57616 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41747)) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun bm!8519 () Bool)

(assert (=> bm!8519 (= call!8521 call!8523)))

(declare-fun b!88468 () Bool)

(assert (=> b!88468 (= e!57615 (contains!757 lt!42321 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(declare-fun b!88469 () Bool)

(assert (=> b!88469 (= e!57616 (ite c!14644 (t!5264 (toList!748 lt!41747)) (ite c!14646 (Cons!1518 (h!2110 (toList!748 lt!41747)) (t!5264 (toList!748 lt!41747))) Nil!1519)))))

(declare-fun bm!8520 () Bool)

(assert (=> bm!8520 (= call!8522 call!8521)))

(declare-fun b!88470 () Bool)

(assert (=> b!88470 (= e!57613 call!8523)))

(assert (= (and d!23551 c!14645) b!88470))

(assert (= (and d!23551 (not c!14645)) b!88462))

(assert (= (and b!88462 c!14644) b!88466))

(assert (= (and b!88462 (not c!14644)) b!88461))

(assert (= (and b!88461 c!14646) b!88463))

(assert (= (and b!88461 (not c!14646)) b!88465))

(assert (= (or b!88463 b!88465) bm!8520))

(assert (= (or b!88466 bm!8520) bm!8519))

(assert (= (or b!88470 bm!8519) bm!8518))

(assert (= (and bm!8518 c!14647) b!88467))

(assert (= (and bm!8518 (not c!14647)) b!88469))

(assert (= (and d!23551 res!45305) b!88464))

(assert (= (and b!88464 res!45306) b!88468))

(declare-fun m!94743 () Bool)

(assert (=> b!88464 m!94743))

(declare-fun m!94745 () Bool)

(assert (=> bm!8518 m!94745))

(declare-fun m!94747 () Bool)

(assert (=> b!88467 m!94747))

(declare-fun m!94749 () Bool)

(assert (=> b!88468 m!94749))

(declare-fun m!94751 () Bool)

(assert (=> d!23551 m!94751))

(assert (=> d!23551 m!94427))

(assert (=> d!23377 d!23551))

(declare-fun d!23553 () Bool)

(declare-fun res!45307 () Bool)

(declare-fun e!57617 () Bool)

(assert (=> d!23553 (=> (not res!45307) (not e!57617))))

(assert (=> d!23553 (= res!45307 (simpleValid!59 (v!2661 (underlying!292 thiss!992))))))

(assert (=> d!23553 (= (valid!327 (v!2661 (underlying!292 thiss!992))) e!57617)))

(declare-fun b!88471 () Bool)

(declare-fun res!45308 () Bool)

(assert (=> b!88471 (=> (not res!45308) (not e!57617))))

(assert (=> b!88471 (= res!45308 (= (arrayCountValidKeys!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))) (_size!430 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88472 () Bool)

(declare-fun res!45309 () Bool)

(assert (=> b!88472 (=> (not res!45309) (not e!57617))))

(assert (=> b!88472 (= res!45309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88473 () Bool)

(assert (=> b!88473 (= e!57617 (arrayNoDuplicates!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000000 Nil!1520))))

(assert (= (and d!23553 res!45307) b!88471))

(assert (= (and b!88471 res!45308) b!88472))

(assert (= (and b!88472 res!45309) b!88473))

(declare-fun m!94753 () Bool)

(assert (=> d!23553 m!94753))

(declare-fun m!94755 () Bool)

(assert (=> b!88471 m!94755))

(assert (=> b!88472 m!93727))

(declare-fun m!94757 () Bool)

(assert (=> b!88473 m!94757))

(assert (=> d!23355 d!23553))

(declare-fun d!23555 () Bool)

(declare-fun e!57619 () Bool)

(assert (=> d!23555 e!57619))

(declare-fun res!45310 () Bool)

(assert (=> d!23555 (=> res!45310 e!57619)))

(declare-fun lt!42325 () Bool)

(assert (=> d!23555 (= res!45310 (not lt!42325))))

(declare-fun lt!42322 () Bool)

(assert (=> d!23555 (= lt!42325 lt!42322)))

(declare-fun lt!42323 () Unit!2600)

(declare-fun e!57618 () Unit!2600)

(assert (=> d!23555 (= lt!42323 e!57618)))

(declare-fun c!14648 () Bool)

(assert (=> d!23555 (= c!14648 lt!42322)))

(assert (=> d!23555 (= lt!42322 (containsKey!145 (toList!748 e!57297) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23555 (= (contains!756 e!57297 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) lt!42325)))

(declare-fun b!88474 () Bool)

(declare-fun lt!42324 () Unit!2600)

(assert (=> b!88474 (= e!57618 lt!42324)))

(assert (=> b!88474 (= lt!42324 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 e!57297) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> b!88474 (isDefined!94 (getValueByKey!141 (toList!748 e!57297) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88475 () Bool)

(declare-fun Unit!2622 () Unit!2600)

(assert (=> b!88475 (= e!57618 Unit!2622)))

(declare-fun b!88476 () Bool)

(assert (=> b!88476 (= e!57619 (isDefined!94 (getValueByKey!141 (toList!748 e!57297) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355))))))

(assert (= (and d!23555 c!14648) b!88474))

(assert (= (and d!23555 (not c!14648)) b!88475))

(assert (= (and d!23555 (not res!45310)) b!88476))

(assert (=> d!23555 m!93699))

(declare-fun m!94759 () Bool)

(assert (=> d!23555 m!94759))

(assert (=> b!88474 m!93699))

(declare-fun m!94761 () Bool)

(assert (=> b!88474 m!94761))

(assert (=> b!88474 m!93699))

(declare-fun m!94763 () Bool)

(assert (=> b!88474 m!94763))

(assert (=> b!88474 m!94763))

(declare-fun m!94765 () Bool)

(assert (=> b!88474 m!94765))

(assert (=> b!88476 m!93699))

(assert (=> b!88476 m!94763))

(assert (=> b!88476 m!94763))

(assert (=> b!88476 m!94765))

(assert (=> bm!8441 d!23555))

(declare-fun d!23557 () Bool)

(assert (=> d!23557 (= (apply!83 lt!42007 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1204 (getValueByKey!141 (toList!748 lt!42007) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3740 () Bool)

(assert (= bs!3740 d!23557))

(assert (=> bs!3740 m!93913))

(declare-fun m!94767 () Bool)

(assert (=> bs!3740 m!94767))

(assert (=> bs!3740 m!94767))

(declare-fun m!94769 () Bool)

(assert (=> bs!3740 m!94769))

(assert (=> b!88083 d!23557))

(assert (=> b!88083 d!23413))

(declare-fun b!88477 () Bool)

(declare-fun e!57620 () Option!147)

(assert (=> b!88477 (= e!57620 (Some!146 (_2!1113 (h!2110 (toList!748 lt!41987)))))))

(declare-fun b!88478 () Bool)

(declare-fun e!57621 () Option!147)

(assert (=> b!88478 (= e!57620 e!57621)))

(declare-fun c!14650 () Bool)

(assert (=> b!88478 (= c!14650 (and ((_ is Cons!1518) (toList!748 lt!41987)) (not (= (_1!1113 (h!2110 (toList!748 lt!41987))) (_1!1113 lt!41733)))))))

(declare-fun d!23559 () Bool)

(declare-fun c!14649 () Bool)

(assert (=> d!23559 (= c!14649 (and ((_ is Cons!1518) (toList!748 lt!41987)) (= (_1!1113 (h!2110 (toList!748 lt!41987))) (_1!1113 lt!41733))))))

(assert (=> d!23559 (= (getValueByKey!141 (toList!748 lt!41987) (_1!1113 lt!41733)) e!57620)))

(declare-fun b!88479 () Bool)

(assert (=> b!88479 (= e!57621 (getValueByKey!141 (t!5264 (toList!748 lt!41987)) (_1!1113 lt!41733)))))

(declare-fun b!88480 () Bool)

(assert (=> b!88480 (= e!57621 None!145)))

(assert (= (and d!23559 c!14649) b!88477))

(assert (= (and d!23559 (not c!14649)) b!88478))

(assert (= (and b!88478 c!14650) b!88479))

(assert (= (and b!88478 (not c!14650)) b!88480))

(declare-fun m!94771 () Bool)

(assert (=> b!88479 m!94771))

(assert (=> b!88051 d!23559))

(assert (=> b!87835 d!23539))

(assert (=> b!87835 d!23541))

(declare-fun d!23561 () Bool)

(declare-fun e!57622 () Bool)

(assert (=> d!23561 e!57622))

(declare-fun res!45311 () Bool)

(assert (=> d!23561 (=> (not res!45311) (not e!57622))))

(declare-fun lt!42327 () ListLongMap!1465)

(assert (=> d!23561 (= res!45311 (contains!756 lt!42327 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42328 () List!1522)

(assert (=> d!23561 (= lt!42327 (ListLongMap!1466 lt!42328))))

(declare-fun lt!42329 () Unit!2600)

(declare-fun lt!42326 () Unit!2600)

(assert (=> d!23561 (= lt!42329 lt!42326)))

(assert (=> d!23561 (= (getValueByKey!141 lt!42328 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23561 (= lt!42326 (lemmaContainsTupThenGetReturnValue!58 lt!42328 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23561 (= lt!42328 (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23561 (= (+!112 lt!41738 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42327)))

(declare-fun b!88481 () Bool)

(declare-fun res!45312 () Bool)

(assert (=> b!88481 (=> (not res!45312) (not e!57622))))

(assert (=> b!88481 (= res!45312 (= (getValueByKey!141 (toList!748 lt!42327) (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88482 () Bool)

(assert (=> b!88482 (= e!57622 (contains!757 (toList!748 lt!42327) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23561 res!45311) b!88481))

(assert (= (and b!88481 res!45312) b!88482))

(declare-fun m!94773 () Bool)

(assert (=> d!23561 m!94773))

(declare-fun m!94775 () Bool)

(assert (=> d!23561 m!94775))

(declare-fun m!94777 () Bool)

(assert (=> d!23561 m!94777))

(declare-fun m!94779 () Bool)

(assert (=> d!23561 m!94779))

(declare-fun m!94781 () Bool)

(assert (=> b!88481 m!94781))

(declare-fun m!94783 () Bool)

(assert (=> b!88482 m!94783))

(assert (=> d!23379 d!23561))

(declare-fun d!23563 () Bool)

(assert (=> d!23563 (= (+!112 (+!112 lt!41738 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (+!112 (+!112 lt!41738 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (=> d!23563 true))

(declare-fun _$28!147 () Unit!2600)

(assert (=> d!23563 (= (choose!513 lt!41738 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))) _$28!147)))

(declare-fun bs!3741 () Bool)

(assert (= bs!3741 d!23563))

(assert (=> bs!3741 m!94047))

(assert (=> bs!3741 m!94047))

(assert (=> bs!3741 m!94051))

(assert (=> bs!3741 m!94049))

(assert (=> bs!3741 m!94049))

(assert (=> bs!3741 m!94053))

(assert (=> d!23379 d!23563))

(declare-fun d!23565 () Bool)

(declare-fun e!57623 () Bool)

(assert (=> d!23565 e!57623))

(declare-fun res!45313 () Bool)

(assert (=> d!23565 (=> (not res!45313) (not e!57623))))

(declare-fun lt!42331 () ListLongMap!1465)

(assert (=> d!23565 (= res!45313 (contains!756 lt!42331 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun lt!42332 () List!1522)

(assert (=> d!23565 (= lt!42331 (ListLongMap!1466 lt!42332))))

(declare-fun lt!42333 () Unit!2600)

(declare-fun lt!42330 () Unit!2600)

(assert (=> d!23565 (= lt!42333 lt!42330)))

(assert (=> d!23565 (= (getValueByKey!141 lt!42332 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23565 (= lt!42330 (lemmaContainsTupThenGetReturnValue!58 lt!42332 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23565 (= lt!42332 (insertStrictlySorted!61 (toList!748 (+!112 lt!41738 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23565 (= (+!112 (+!112 lt!41738 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) lt!42331)))

(declare-fun b!88483 () Bool)

(declare-fun res!45314 () Bool)

(assert (=> b!88483 (=> (not res!45314) (not e!57623))))

(assert (=> b!88483 (= res!45314 (= (getValueByKey!141 (toList!748 lt!42331) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun b!88484 () Bool)

(assert (=> b!88484 (= e!57623 (contains!757 (toList!748 lt!42331) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (= (and d!23565 res!45313) b!88483))

(assert (= (and b!88483 res!45314) b!88484))

(declare-fun m!94785 () Bool)

(assert (=> d!23565 m!94785))

(declare-fun m!94787 () Bool)

(assert (=> d!23565 m!94787))

(declare-fun m!94789 () Bool)

(assert (=> d!23565 m!94789))

(declare-fun m!94791 () Bool)

(assert (=> d!23565 m!94791))

(declare-fun m!94793 () Bool)

(assert (=> b!88483 m!94793))

(declare-fun m!94795 () Bool)

(assert (=> b!88484 m!94795))

(assert (=> d!23379 d!23565))

(declare-fun d!23567 () Bool)

(declare-fun e!57624 () Bool)

(assert (=> d!23567 e!57624))

(declare-fun res!45315 () Bool)

(assert (=> d!23567 (=> (not res!45315) (not e!57624))))

(declare-fun lt!42335 () ListLongMap!1465)

(assert (=> d!23567 (= res!45315 (contains!756 lt!42335 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun lt!42336 () List!1522)

(assert (=> d!23567 (= lt!42335 (ListLongMap!1466 lt!42336))))

(declare-fun lt!42337 () Unit!2600)

(declare-fun lt!42334 () Unit!2600)

(assert (=> d!23567 (= lt!42337 lt!42334)))

(assert (=> d!23567 (= (getValueByKey!141 lt!42336 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23567 (= lt!42334 (lemmaContainsTupThenGetReturnValue!58 lt!42336 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23567 (= lt!42336 (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23567 (= (+!112 lt!41738 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) lt!42335)))

(declare-fun b!88485 () Bool)

(declare-fun res!45316 () Bool)

(assert (=> b!88485 (=> (not res!45316) (not e!57624))))

(assert (=> b!88485 (= res!45316 (= (getValueByKey!141 (toList!748 lt!42335) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun b!88486 () Bool)

(assert (=> b!88486 (= e!57624 (contains!757 (toList!748 lt!42335) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (= (and d!23567 res!45315) b!88485))

(assert (= (and b!88485 res!45316) b!88486))

(declare-fun m!94797 () Bool)

(assert (=> d!23567 m!94797))

(declare-fun m!94799 () Bool)

(assert (=> d!23567 m!94799))

(declare-fun m!94801 () Bool)

(assert (=> d!23567 m!94801))

(declare-fun m!94803 () Bool)

(assert (=> d!23567 m!94803))

(declare-fun m!94805 () Bool)

(assert (=> b!88485 m!94805))

(declare-fun m!94807 () Bool)

(assert (=> b!88486 m!94807))

(assert (=> d!23379 d!23567))

(declare-fun d!23569 () Bool)

(declare-fun e!57625 () Bool)

(assert (=> d!23569 e!57625))

(declare-fun res!45317 () Bool)

(assert (=> d!23569 (=> (not res!45317) (not e!57625))))

(declare-fun lt!42339 () ListLongMap!1465)

(assert (=> d!23569 (= res!45317 (contains!756 lt!42339 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42340 () List!1522)

(assert (=> d!23569 (= lt!42339 (ListLongMap!1466 lt!42340))))

(declare-fun lt!42341 () Unit!2600)

(declare-fun lt!42338 () Unit!2600)

(assert (=> d!23569 (= lt!42341 lt!42338)))

(assert (=> d!23569 (= (getValueByKey!141 lt!42340 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23569 (= lt!42338 (lemmaContainsTupThenGetReturnValue!58 lt!42340 (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23569 (= lt!42340 (insertStrictlySorted!61 (toList!748 (+!112 lt!41738 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23569 (= (+!112 (+!112 lt!41738 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42339)))

(declare-fun b!88487 () Bool)

(declare-fun res!45318 () Bool)

(assert (=> b!88487 (=> (not res!45318) (not e!57625))))

(assert (=> b!88487 (= res!45318 (= (getValueByKey!141 (toList!748 lt!42339) (_1!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88488 () Bool)

(assert (=> b!88488 (= e!57625 (contains!757 (toList!748 lt!42339) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23569 res!45317) b!88487))

(assert (= (and b!88487 res!45318) b!88488))

(declare-fun m!94809 () Bool)

(assert (=> d!23569 m!94809))

(declare-fun m!94811 () Bool)

(assert (=> d!23569 m!94811))

(declare-fun m!94813 () Bool)

(assert (=> d!23569 m!94813))

(declare-fun m!94815 () Bool)

(assert (=> d!23569 m!94815))

(declare-fun m!94817 () Bool)

(assert (=> b!88487 m!94817))

(declare-fun m!94819 () Bool)

(assert (=> b!88488 m!94819))

(assert (=> d!23379 d!23569))

(assert (=> b!88036 d!23405))

(declare-fun d!23571 () Bool)

(assert (=> d!23571 (= (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88129 d!23571))

(declare-fun b!88489 () Bool)

(declare-fun e!57626 () Option!147)

(assert (=> b!88489 (= e!57626 (Some!146 (_2!1113 (h!2110 (toList!748 lt!41979)))))))

(declare-fun b!88490 () Bool)

(declare-fun e!57627 () Option!147)

(assert (=> b!88490 (= e!57626 e!57627)))

(declare-fun c!14652 () Bool)

(assert (=> b!88490 (= c!14652 (and ((_ is Cons!1518) (toList!748 lt!41979)) (not (= (_1!1113 (h!2110 (toList!748 lt!41979))) (_1!1113 lt!41744)))))))

(declare-fun d!23573 () Bool)

(declare-fun c!14651 () Bool)

(assert (=> d!23573 (= c!14651 (and ((_ is Cons!1518) (toList!748 lt!41979)) (= (_1!1113 (h!2110 (toList!748 lt!41979))) (_1!1113 lt!41744))))))

(assert (=> d!23573 (= (getValueByKey!141 (toList!748 lt!41979) (_1!1113 lt!41744)) e!57626)))

(declare-fun b!88491 () Bool)

(assert (=> b!88491 (= e!57627 (getValueByKey!141 (t!5264 (toList!748 lt!41979)) (_1!1113 lt!41744)))))

(declare-fun b!88492 () Bool)

(assert (=> b!88492 (= e!57627 None!145)))

(assert (= (and d!23573 c!14651) b!88489))

(assert (= (and d!23573 (not c!14651)) b!88490))

(assert (= (and b!88490 c!14652) b!88491))

(assert (= (and b!88490 (not c!14652)) b!88492))

(declare-fun m!94821 () Bool)

(assert (=> b!88491 m!94821))

(assert (=> b!88047 d!23573))

(declare-fun d!23575 () Bool)

(declare-fun res!45319 () Bool)

(declare-fun e!57628 () Bool)

(assert (=> d!23575 (=> res!45319 e!57628)))

(assert (=> d!23575 (= res!45319 (= (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23575 (= (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000) e!57628)))

(declare-fun b!88493 () Bool)

(declare-fun e!57629 () Bool)

(assert (=> b!88493 (= e!57628 e!57629)))

(declare-fun res!45320 () Bool)

(assert (=> b!88493 (=> (not res!45320) (not e!57629))))

(assert (=> b!88493 (= res!45320 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88494 () Bool)

(assert (=> b!88494 (= e!57629 (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23575 (not res!45319)) b!88493))

(assert (= (and b!88493 res!45320) b!88494))

(assert (=> d!23575 m!94263))

(assert (=> b!88494 m!93699))

(declare-fun m!94823 () Bool)

(assert (=> b!88494 m!94823))

(assert (=> bm!8428 d!23575))

(declare-fun d!23577 () Bool)

(declare-fun e!57631 () Bool)

(assert (=> d!23577 e!57631))

(declare-fun res!45321 () Bool)

(assert (=> d!23577 (=> res!45321 e!57631)))

(declare-fun lt!42345 () Bool)

(assert (=> d!23577 (= res!45321 (not lt!42345))))

(declare-fun lt!42342 () Bool)

(assert (=> d!23577 (= lt!42345 lt!42342)))

(declare-fun lt!42343 () Unit!2600)

(declare-fun e!57630 () Unit!2600)

(assert (=> d!23577 (= lt!42343 e!57630)))

(declare-fun c!14653 () Bool)

(assert (=> d!23577 (= c!14653 lt!42342)))

(assert (=> d!23577 (= lt!42342 (containsKey!145 (toList!748 lt!42012) (_1!1113 lt!41733)))))

(assert (=> d!23577 (= (contains!756 lt!42012 (_1!1113 lt!41733)) lt!42345)))

(declare-fun b!88495 () Bool)

(declare-fun lt!42344 () Unit!2600)

(assert (=> b!88495 (= e!57630 lt!42344)))

(assert (=> b!88495 (= lt!42344 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42012) (_1!1113 lt!41733)))))

(assert (=> b!88495 (isDefined!94 (getValueByKey!141 (toList!748 lt!42012) (_1!1113 lt!41733)))))

(declare-fun b!88496 () Bool)

(declare-fun Unit!2623 () Unit!2600)

(assert (=> b!88496 (= e!57630 Unit!2623)))

(declare-fun b!88497 () Bool)

(assert (=> b!88497 (= e!57631 (isDefined!94 (getValueByKey!141 (toList!748 lt!42012) (_1!1113 lt!41733))))))

(assert (= (and d!23577 c!14653) b!88495))

(assert (= (and d!23577 (not c!14653)) b!88496))

(assert (= (and d!23577 (not res!45321)) b!88497))

(declare-fun m!94825 () Bool)

(assert (=> d!23577 m!94825))

(declare-fun m!94827 () Bool)

(assert (=> b!88495 m!94827))

(assert (=> b!88495 m!94029))

(assert (=> b!88495 m!94029))

(declare-fun m!94829 () Bool)

(assert (=> b!88495 m!94829))

(assert (=> b!88497 m!94029))

(assert (=> b!88497 m!94029))

(assert (=> b!88497 m!94829))

(assert (=> d!23375 d!23577))

(declare-fun b!88498 () Bool)

(declare-fun e!57632 () Option!147)

(assert (=> b!88498 (= e!57632 (Some!146 (_2!1113 (h!2110 lt!42013))))))

(declare-fun b!88499 () Bool)

(declare-fun e!57633 () Option!147)

(assert (=> b!88499 (= e!57632 e!57633)))

(declare-fun c!14655 () Bool)

(assert (=> b!88499 (= c!14655 (and ((_ is Cons!1518) lt!42013) (not (= (_1!1113 (h!2110 lt!42013)) (_1!1113 lt!41733)))))))

(declare-fun d!23579 () Bool)

(declare-fun c!14654 () Bool)

(assert (=> d!23579 (= c!14654 (and ((_ is Cons!1518) lt!42013) (= (_1!1113 (h!2110 lt!42013)) (_1!1113 lt!41733))))))

(assert (=> d!23579 (= (getValueByKey!141 lt!42013 (_1!1113 lt!41733)) e!57632)))

(declare-fun b!88500 () Bool)

(assert (=> b!88500 (= e!57633 (getValueByKey!141 (t!5264 lt!42013) (_1!1113 lt!41733)))))

(declare-fun b!88501 () Bool)

(assert (=> b!88501 (= e!57633 None!145)))

(assert (= (and d!23579 c!14654) b!88498))

(assert (= (and d!23579 (not c!14654)) b!88499))

(assert (= (and b!88499 c!14655) b!88500))

(assert (= (and b!88499 (not c!14655)) b!88501))

(declare-fun m!94831 () Bool)

(assert (=> b!88500 m!94831))

(assert (=> d!23375 d!23579))

(declare-fun d!23581 () Bool)

(assert (=> d!23581 (= (getValueByKey!141 lt!42013 (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733)))))

(declare-fun lt!42346 () Unit!2600)

(assert (=> d!23581 (= lt!42346 (choose!517 lt!42013 (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(declare-fun e!57634 () Bool)

(assert (=> d!23581 e!57634))

(declare-fun res!45322 () Bool)

(assert (=> d!23581 (=> (not res!45322) (not e!57634))))

(assert (=> d!23581 (= res!45322 (isStrictlySorted!299 lt!42013))))

(assert (=> d!23581 (= (lemmaContainsTupThenGetReturnValue!58 lt!42013 (_1!1113 lt!41733) (_2!1113 lt!41733)) lt!42346)))

(declare-fun b!88502 () Bool)

(declare-fun res!45323 () Bool)

(assert (=> b!88502 (=> (not res!45323) (not e!57634))))

(assert (=> b!88502 (= res!45323 (containsKey!145 lt!42013 (_1!1113 lt!41733)))))

(declare-fun b!88503 () Bool)

(assert (=> b!88503 (= e!57634 (contains!757 lt!42013 (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733))))))

(assert (= (and d!23581 res!45322) b!88502))

(assert (= (and b!88502 res!45323) b!88503))

(assert (=> d!23581 m!94023))

(declare-fun m!94833 () Bool)

(assert (=> d!23581 m!94833))

(declare-fun m!94835 () Bool)

(assert (=> d!23581 m!94835))

(declare-fun m!94837 () Bool)

(assert (=> b!88502 m!94837))

(declare-fun m!94839 () Bool)

(assert (=> b!88503 m!94839))

(assert (=> d!23375 d!23581))

(declare-fun e!57639 () List!1522)

(declare-fun c!14657 () Bool)

(declare-fun bm!8521 () Bool)

(declare-fun call!8526 () List!1522)

(assert (=> bm!8521 (= call!8526 ($colon$colon!73 e!57639 (ite c!14657 (h!2110 (toList!748 lt!41738)) (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733)))))))

(declare-fun c!14659 () Bool)

(assert (=> bm!8521 (= c!14659 c!14657)))

(declare-fun b!88504 () Bool)

(declare-fun c!14658 () Bool)

(assert (=> b!88504 (= c!14658 (and ((_ is Cons!1518) (toList!748 lt!41738)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41733))))))

(declare-fun e!57635 () List!1522)

(declare-fun e!57637 () List!1522)

(assert (=> b!88504 (= e!57635 e!57637)))

(declare-fun b!88505 () Bool)

(declare-fun e!57636 () List!1522)

(assert (=> b!88505 (= e!57636 e!57635)))

(declare-fun c!14656 () Bool)

(assert (=> b!88505 (= c!14656 (and ((_ is Cons!1518) (toList!748 lt!41738)) (= (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41733))))))

(declare-fun b!88506 () Bool)

(declare-fun call!8525 () List!1522)

(assert (=> b!88506 (= e!57637 call!8525)))

(declare-fun b!88507 () Bool)

(declare-fun res!45325 () Bool)

(declare-fun e!57638 () Bool)

(assert (=> b!88507 (=> (not res!45325) (not e!57638))))

(declare-fun lt!42347 () List!1522)

(assert (=> b!88507 (= res!45325 (containsKey!145 lt!42347 (_1!1113 lt!41733)))))

(declare-fun b!88508 () Bool)

(assert (=> b!88508 (= e!57637 call!8525)))

(declare-fun d!23583 () Bool)

(assert (=> d!23583 e!57638))

(declare-fun res!45324 () Bool)

(assert (=> d!23583 (=> (not res!45324) (not e!57638))))

(assert (=> d!23583 (= res!45324 (isStrictlySorted!299 lt!42347))))

(assert (=> d!23583 (= lt!42347 e!57636)))

(assert (=> d!23583 (= c!14657 (and ((_ is Cons!1518) (toList!748 lt!41738)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41733))))))

(assert (=> d!23583 (isStrictlySorted!299 (toList!748 lt!41738))))

(assert (=> d!23583 (= (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 lt!41733) (_2!1113 lt!41733)) lt!42347)))

(declare-fun b!88509 () Bool)

(declare-fun call!8524 () List!1522)

(assert (=> b!88509 (= e!57635 call!8524)))

(declare-fun b!88510 () Bool)

(assert (=> b!88510 (= e!57639 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41738)) (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(declare-fun bm!8522 () Bool)

(assert (=> bm!8522 (= call!8524 call!8526)))

(declare-fun b!88511 () Bool)

(assert (=> b!88511 (= e!57638 (contains!757 lt!42347 (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733))))))

(declare-fun b!88512 () Bool)

(assert (=> b!88512 (= e!57639 (ite c!14656 (t!5264 (toList!748 lt!41738)) (ite c!14658 (Cons!1518 (h!2110 (toList!748 lt!41738)) (t!5264 (toList!748 lt!41738))) Nil!1519)))))

(declare-fun bm!8523 () Bool)

(assert (=> bm!8523 (= call!8525 call!8524)))

(declare-fun b!88513 () Bool)

(assert (=> b!88513 (= e!57636 call!8526)))

(assert (= (and d!23583 c!14657) b!88513))

(assert (= (and d!23583 (not c!14657)) b!88505))

(assert (= (and b!88505 c!14656) b!88509))

(assert (= (and b!88505 (not c!14656)) b!88504))

(assert (= (and b!88504 c!14658) b!88506))

(assert (= (and b!88504 (not c!14658)) b!88508))

(assert (= (or b!88506 b!88508) bm!8523))

(assert (= (or b!88509 bm!8523) bm!8522))

(assert (= (or b!88513 bm!8522) bm!8521))

(assert (= (and bm!8521 c!14659) b!88510))

(assert (= (and bm!8521 (not c!14659)) b!88512))

(assert (= (and d!23583 res!45324) b!88507))

(assert (= (and b!88507 res!45325) b!88511))

(declare-fun m!94841 () Bool)

(assert (=> b!88507 m!94841))

(declare-fun m!94843 () Bool)

(assert (=> bm!8521 m!94843))

(declare-fun m!94845 () Bool)

(assert (=> b!88510 m!94845))

(declare-fun m!94847 () Bool)

(assert (=> b!88511 m!94847))

(declare-fun m!94849 () Bool)

(assert (=> d!23583 m!94849))

(declare-fun m!94851 () Bool)

(assert (=> d!23583 m!94851))

(assert (=> d!23375 d!23583))

(declare-fun d!23585 () Bool)

(declare-fun e!57641 () Bool)

(assert (=> d!23585 e!57641))

(declare-fun res!45326 () Bool)

(assert (=> d!23585 (=> res!45326 e!57641)))

(declare-fun lt!42351 () Bool)

(assert (=> d!23585 (= res!45326 (not lt!42351))))

(declare-fun lt!42348 () Bool)

(assert (=> d!23585 (= lt!42351 lt!42348)))

(declare-fun lt!42349 () Unit!2600)

(declare-fun e!57640 () Unit!2600)

(assert (=> d!23585 (= lt!42349 e!57640)))

(declare-fun c!14660 () Bool)

(assert (=> d!23585 (= c!14660 lt!42348)))

(assert (=> d!23585 (= lt!42348 (containsKey!145 (toList!748 lt!42007) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23585 (= (contains!756 lt!42007 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42351)))

(declare-fun b!88514 () Bool)

(declare-fun lt!42350 () Unit!2600)

(assert (=> b!88514 (= e!57640 lt!42350)))

(assert (=> b!88514 (= lt!42350 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42007) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88514 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88515 () Bool)

(declare-fun Unit!2624 () Unit!2600)

(assert (=> b!88515 (= e!57640 Unit!2624)))

(declare-fun b!88516 () Bool)

(assert (=> b!88516 (= e!57641 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23585 c!14660) b!88514))

(assert (= (and d!23585 (not c!14660)) b!88515))

(assert (= (and d!23585 (not res!45326)) b!88516))

(assert (=> d!23585 m!93913))

(declare-fun m!94853 () Bool)

(assert (=> d!23585 m!94853))

(assert (=> b!88514 m!93913))

(declare-fun m!94855 () Bool)

(assert (=> b!88514 m!94855))

(assert (=> b!88514 m!93913))

(assert (=> b!88514 m!94767))

(assert (=> b!88514 m!94767))

(declare-fun m!94857 () Bool)

(assert (=> b!88514 m!94857))

(assert (=> b!88516 m!93913))

(assert (=> b!88516 m!94767))

(assert (=> b!88516 m!94767))

(assert (=> b!88516 m!94857))

(assert (=> b!88081 d!23585))

(declare-fun b!88517 () Bool)

(declare-fun e!57642 () Option!147)

(assert (=> b!88517 (= e!57642 (Some!146 (_2!1113 (h!2110 (toList!748 lt!41983)))))))

(declare-fun b!88518 () Bool)

(declare-fun e!57643 () Option!147)

(assert (=> b!88518 (= e!57642 e!57643)))

(declare-fun c!14662 () Bool)

(assert (=> b!88518 (= c!14662 (and ((_ is Cons!1518) (toList!748 lt!41983)) (not (= (_1!1113 (h!2110 (toList!748 lt!41983))) (_1!1113 lt!41735)))))))

(declare-fun d!23587 () Bool)

(declare-fun c!14661 () Bool)

(assert (=> d!23587 (= c!14661 (and ((_ is Cons!1518) (toList!748 lt!41983)) (= (_1!1113 (h!2110 (toList!748 lt!41983))) (_1!1113 lt!41735))))))

(assert (=> d!23587 (= (getValueByKey!141 (toList!748 lt!41983) (_1!1113 lt!41735)) e!57642)))

(declare-fun b!88519 () Bool)

(assert (=> b!88519 (= e!57643 (getValueByKey!141 (t!5264 (toList!748 lt!41983)) (_1!1113 lt!41735)))))

(declare-fun b!88520 () Bool)

(assert (=> b!88520 (= e!57643 None!145)))

(assert (= (and d!23587 c!14661) b!88517))

(assert (= (and d!23587 (not c!14661)) b!88518))

(assert (= (and b!88518 c!14662) b!88519))

(assert (= (and b!88518 (not c!14662)) b!88520))

(declare-fun m!94859 () Bool)

(assert (=> b!88519 m!94859))

(assert (=> b!88049 d!23587))

(declare-fun d!23589 () Bool)

(assert (=> d!23589 (= (inRange!0 (ite c!14511 (ite c!14513 (index!3115 lt!41880) (ite c!14514 (index!3114 lt!41892) (index!3117 lt!41892))) (ite c!14508 (index!3115 lt!41868) (ite c!14509 (index!3114 lt!41891) (index!3117 lt!41891)))) (mask!6397 newMap!16)) (and (bvsge (ite c!14511 (ite c!14513 (index!3115 lt!41880) (ite c!14514 (index!3114 lt!41892) (index!3117 lt!41892))) (ite c!14508 (index!3115 lt!41868) (ite c!14509 (index!3114 lt!41891) (index!3117 lt!41891)))) #b00000000000000000000000000000000) (bvslt (ite c!14511 (ite c!14513 (index!3115 lt!41880) (ite c!14514 (index!3114 lt!41892) (index!3117 lt!41892))) (ite c!14508 (index!3115 lt!41868) (ite c!14509 (index!3114 lt!41891) (index!3117 lt!41891)))) (bvadd (mask!6397 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8426 d!23589))

(declare-fun d!23591 () Bool)

(assert (=> d!23591 (= (get!1203 (select (arr!1926 (_values!2342 (v!2661 (underlying!292 thiss!992)))) from!355) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!342 (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88042 d!23591))

(declare-fun d!23593 () Bool)

(declare-fun e!57645 () Bool)

(assert (=> d!23593 e!57645))

(declare-fun res!45327 () Bool)

(assert (=> d!23593 (=> res!45327 e!57645)))

(declare-fun lt!42355 () Bool)

(assert (=> d!23593 (= res!45327 (not lt!42355))))

(declare-fun lt!42352 () Bool)

(assert (=> d!23593 (= lt!42355 lt!42352)))

(declare-fun lt!42353 () Unit!2600)

(declare-fun e!57644 () Unit!2600)

(assert (=> d!23593 (= lt!42353 e!57644)))

(declare-fun c!14663 () Bool)

(assert (=> d!23593 (= c!14663 lt!42352)))

(assert (=> d!23593 (= lt!42352 (containsKey!145 (toList!748 lt!42007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23593 (= (contains!756 lt!42007 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42355)))

(declare-fun b!88521 () Bool)

(declare-fun lt!42354 () Unit!2600)

(assert (=> b!88521 (= e!57644 lt!42354)))

(assert (=> b!88521 (= lt!42354 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88521 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88522 () Bool)

(declare-fun Unit!2625 () Unit!2600)

(assert (=> b!88522 (= e!57644 Unit!2625)))

(declare-fun b!88523 () Bool)

(assert (=> b!88523 (= e!57645 (isDefined!94 (getValueByKey!141 (toList!748 lt!42007) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23593 c!14663) b!88521))

(assert (= (and d!23593 (not c!14663)) b!88522))

(assert (= (and d!23593 (not res!45327)) b!88523))

(declare-fun m!94861 () Bool)

(assert (=> d!23593 m!94861))

(declare-fun m!94863 () Bool)

(assert (=> b!88521 m!94863))

(declare-fun m!94865 () Bool)

(assert (=> b!88521 m!94865))

(assert (=> b!88521 m!94865))

(declare-fun m!94867 () Bool)

(assert (=> b!88521 m!94867))

(assert (=> b!88523 m!94865))

(assert (=> b!88523 m!94865))

(assert (=> b!88523 m!94867))

(assert (=> d!23373 d!23593))

(assert (=> d!23373 d!23383))

(assert (=> b!88077 d!23535))

(declare-fun d!23595 () Bool)

(declare-fun e!57646 () Bool)

(assert (=> d!23595 e!57646))

(declare-fun res!45328 () Bool)

(assert (=> d!23595 (=> (not res!45328) (not e!57646))))

(declare-fun lt!42357 () ListLongMap!1465)

(assert (=> d!23595 (= res!45328 (contains!756 lt!42357 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(declare-fun lt!42358 () List!1522)

(assert (=> d!23595 (= lt!42357 (ListLongMap!1466 lt!42358))))

(declare-fun lt!42359 () Unit!2600)

(declare-fun lt!42356 () Unit!2600)

(assert (=> d!23595 (= lt!42359 lt!42356)))

(assert (=> d!23595 (= (getValueByKey!141 lt!42358 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23595 (= lt!42356 (lemmaContainsTupThenGetReturnValue!58 lt!42358 (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23595 (= lt!42358 (insertStrictlySorted!61 (toList!748 call!8469) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))))))

(assert (=> d!23595 (= (+!112 call!8469 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))) lt!42357)))

(declare-fun b!88524 () Bool)

(declare-fun res!45329 () Bool)

(assert (=> b!88524 (=> (not res!45329) (not e!57646))))

(assert (=> b!88524 (= res!45329 (= (getValueByKey!141 (toList!748 lt!42357) (_1!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992)))))) (Some!146 (_2!1113 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))))

(declare-fun b!88525 () Bool)

(assert (=> b!88525 (= e!57646 (contains!757 (toList!748 lt!42357) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 (v!2661 (underlying!292 thiss!992))))))))

(assert (= (and d!23595 res!45328) b!88524))

(assert (= (and b!88524 res!45329) b!88525))

(declare-fun m!94869 () Bool)

(assert (=> d!23595 m!94869))

(declare-fun m!94871 () Bool)

(assert (=> d!23595 m!94871))

(declare-fun m!94873 () Bool)

(assert (=> d!23595 m!94873))

(declare-fun m!94875 () Bool)

(assert (=> d!23595 m!94875))

(declare-fun m!94877 () Bool)

(assert (=> b!88524 m!94877))

(declare-fun m!94879 () Bool)

(assert (=> b!88525 m!94879))

(assert (=> b!88016 d!23595))

(declare-fun b!88526 () Bool)

(declare-fun e!57647 () Option!147)

(assert (=> b!88526 (= e!57647 (Some!146 (_2!1113 (h!2110 (toList!748 lt!42027)))))))

(declare-fun b!88527 () Bool)

(declare-fun e!57648 () Option!147)

(assert (=> b!88527 (= e!57647 e!57648)))

(declare-fun c!14665 () Bool)

(assert (=> b!88527 (= c!14665 (and ((_ is Cons!1518) (toList!748 lt!42027)) (not (= (_1!1113 (h!2110 (toList!748 lt!42027))) (_1!1113 lt!41744)))))))

(declare-fun d!23597 () Bool)

(declare-fun c!14664 () Bool)

(assert (=> d!23597 (= c!14664 (and ((_ is Cons!1518) (toList!748 lt!42027)) (= (_1!1113 (h!2110 (toList!748 lt!42027))) (_1!1113 lt!41744))))))

(assert (=> d!23597 (= (getValueByKey!141 (toList!748 lt!42027) (_1!1113 lt!41744)) e!57647)))

(declare-fun b!88528 () Bool)

(assert (=> b!88528 (= e!57648 (getValueByKey!141 (t!5264 (toList!748 lt!42027)) (_1!1113 lt!41744)))))

(declare-fun b!88529 () Bool)

(assert (=> b!88529 (= e!57648 None!145)))

(assert (= (and d!23597 c!14664) b!88526))

(assert (= (and d!23597 (not c!14664)) b!88527))

(assert (= (and b!88527 c!14665) b!88528))

(assert (= (and b!88527 (not c!14665)) b!88529))

(declare-fun m!94881 () Bool)

(assert (=> b!88528 m!94881))

(assert (=> b!88095 d!23597))

(declare-fun d!23599 () Bool)

(declare-fun e!57650 () Bool)

(assert (=> d!23599 e!57650))

(declare-fun res!45330 () Bool)

(assert (=> d!23599 (=> res!45330 e!57650)))

(declare-fun lt!42363 () Bool)

(assert (=> d!23599 (= res!45330 (not lt!42363))))

(declare-fun lt!42360 () Bool)

(assert (=> d!23599 (= lt!42363 lt!42360)))

(declare-fun lt!42361 () Unit!2600)

(declare-fun e!57649 () Unit!2600)

(assert (=> d!23599 (= lt!42361 e!57649)))

(declare-fun c!14666 () Bool)

(assert (=> d!23599 (= c!14666 lt!42360)))

(assert (=> d!23599 (= lt!42360 (containsKey!145 (toList!748 lt!41956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23599 (= (contains!756 lt!41956 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42363)))

(declare-fun b!88530 () Bool)

(declare-fun lt!42362 () Unit!2600)

(assert (=> b!88530 (= e!57649 lt!42362)))

(assert (=> b!88530 (= lt!42362 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88530 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88531 () Bool)

(declare-fun Unit!2626 () Unit!2600)

(assert (=> b!88531 (= e!57649 Unit!2626)))

(declare-fun b!88532 () Bool)

(assert (=> b!88532 (= e!57650 (isDefined!94 (getValueByKey!141 (toList!748 lt!41956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23599 c!14666) b!88530))

(assert (= (and d!23599 (not c!14666)) b!88531))

(assert (= (and d!23599 (not res!45330)) b!88532))

(declare-fun m!94883 () Bool)

(assert (=> d!23599 m!94883))

(declare-fun m!94885 () Bool)

(assert (=> b!88530 m!94885))

(assert (=> b!88530 m!94225))

(assert (=> b!88530 m!94225))

(declare-fun m!94887 () Bool)

(assert (=> b!88530 m!94887))

(assert (=> b!88532 m!94225))

(assert (=> b!88532 m!94225))

(assert (=> b!88532 m!94887))

(assert (=> bm!8464 d!23599))

(declare-fun d!23601 () Bool)

(declare-fun e!57653 () Bool)

(assert (=> d!23601 e!57653))

(declare-fun res!45335 () Bool)

(assert (=> d!23601 (=> (not res!45335) (not e!57653))))

(declare-fun lt!42368 () SeekEntryResult!244)

(assert (=> d!23601 (= res!45335 ((_ is Found!244) lt!42368))))

(assert (=> d!23601 (= lt!42368 (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun lt!42369 () Unit!2600)

(declare-fun choose!522 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) Int) Unit!2600)

(assert (=> d!23601 (= lt!42369 (choose!522 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(assert (=> d!23601 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23601 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)) lt!42369)))

(declare-fun b!88537 () Bool)

(declare-fun res!45336 () Bool)

(assert (=> b!88537 (=> (not res!45336) (not e!57653))))

(assert (=> b!88537 (= res!45336 (inRange!0 (index!3115 lt!42368) (mask!6397 newMap!16)))))

(declare-fun b!88538 () Bool)

(assert (=> b!88538 (= e!57653 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!42368)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> b!88538 (and (bvsge (index!3115 lt!42368) #b00000000000000000000000000000000) (bvslt (index!3115 lt!42368) (size!2170 (_keys!4035 newMap!16))))))

(assert (= (and d!23601 res!45335) b!88537))

(assert (= (and b!88537 res!45336) b!88538))

(assert (=> d!23601 m!93699))

(assert (=> d!23601 m!93851))

(assert (=> d!23601 m!93699))

(declare-fun m!94889 () Bool)

(assert (=> d!23601 m!94889))

(assert (=> d!23601 m!94251))

(declare-fun m!94891 () Bool)

(assert (=> b!88537 m!94891))

(declare-fun m!94893 () Bool)

(assert (=> b!88538 m!94893))

(assert (=> bm!8440 d!23601))

(declare-fun d!23603 () Bool)

(assert (=> d!23603 (= (map!1192 (_2!1112 lt!41888)) (getCurrentListMap!441 (_keys!4035 (_2!1112 lt!41888)) (_values!2342 (_2!1112 lt!41888)) (mask!6397 (_2!1112 lt!41888)) (extraKeys!2194 (_2!1112 lt!41888)) (zeroValue!2249 (_2!1112 lt!41888)) (minValue!2249 (_2!1112 lt!41888)) #b00000000000000000000000000000000 (defaultEntry!2359 (_2!1112 lt!41888))))))

(declare-fun bs!3742 () Bool)

(assert (= bs!3742 d!23603))

(declare-fun m!94895 () Bool)

(assert (=> bs!3742 m!94895))

(assert (=> bm!8431 d!23603))

(declare-fun d!23605 () Bool)

(declare-fun e!57655 () Bool)

(assert (=> d!23605 e!57655))

(declare-fun res!45337 () Bool)

(assert (=> d!23605 (=> res!45337 e!57655)))

(declare-fun lt!42373 () Bool)

(assert (=> d!23605 (= res!45337 (not lt!42373))))

(declare-fun lt!42370 () Bool)

(assert (=> d!23605 (= lt!42373 lt!42370)))

(declare-fun lt!42371 () Unit!2600)

(declare-fun e!57654 () Unit!2600)

(assert (=> d!23605 (= lt!42371 e!57654)))

(declare-fun c!14667 () Bool)

(assert (=> d!23605 (= c!14667 lt!42370)))

(assert (=> d!23605 (= lt!42370 (containsKey!145 (toList!748 lt!41987) (_1!1113 lt!41733)))))

(assert (=> d!23605 (= (contains!756 lt!41987 (_1!1113 lt!41733)) lt!42373)))

(declare-fun b!88539 () Bool)

(declare-fun lt!42372 () Unit!2600)

(assert (=> b!88539 (= e!57654 lt!42372)))

(assert (=> b!88539 (= lt!42372 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41987) (_1!1113 lt!41733)))))

(assert (=> b!88539 (isDefined!94 (getValueByKey!141 (toList!748 lt!41987) (_1!1113 lt!41733)))))

(declare-fun b!88540 () Bool)

(declare-fun Unit!2627 () Unit!2600)

(assert (=> b!88540 (= e!57654 Unit!2627)))

(declare-fun b!88541 () Bool)

(assert (=> b!88541 (= e!57655 (isDefined!94 (getValueByKey!141 (toList!748 lt!41987) (_1!1113 lt!41733))))))

(assert (= (and d!23605 c!14667) b!88539))

(assert (= (and d!23605 (not c!14667)) b!88540))

(assert (= (and d!23605 (not res!45337)) b!88541))

(declare-fun m!94897 () Bool)

(assert (=> d!23605 m!94897))

(declare-fun m!94899 () Bool)

(assert (=> b!88539 m!94899))

(assert (=> b!88539 m!93997))

(assert (=> b!88539 m!93997))

(declare-fun m!94901 () Bool)

(assert (=> b!88539 m!94901))

(assert (=> b!88541 m!93997))

(assert (=> b!88541 m!93997))

(assert (=> b!88541 m!94901))

(assert (=> d!23371 d!23605))

(declare-fun b!88542 () Bool)

(declare-fun e!57656 () Option!147)

(assert (=> b!88542 (= e!57656 (Some!146 (_2!1113 (h!2110 lt!41988))))))

(declare-fun b!88543 () Bool)

(declare-fun e!57657 () Option!147)

(assert (=> b!88543 (= e!57656 e!57657)))

(declare-fun c!14669 () Bool)

(assert (=> b!88543 (= c!14669 (and ((_ is Cons!1518) lt!41988) (not (= (_1!1113 (h!2110 lt!41988)) (_1!1113 lt!41733)))))))

(declare-fun d!23607 () Bool)

(declare-fun c!14668 () Bool)

(assert (=> d!23607 (= c!14668 (and ((_ is Cons!1518) lt!41988) (= (_1!1113 (h!2110 lt!41988)) (_1!1113 lt!41733))))))

(assert (=> d!23607 (= (getValueByKey!141 lt!41988 (_1!1113 lt!41733)) e!57656)))

(declare-fun b!88544 () Bool)

(assert (=> b!88544 (= e!57657 (getValueByKey!141 (t!5264 lt!41988) (_1!1113 lt!41733)))))

(declare-fun b!88545 () Bool)

(assert (=> b!88545 (= e!57657 None!145)))

(assert (= (and d!23607 c!14668) b!88542))

(assert (= (and d!23607 (not c!14668)) b!88543))

(assert (= (and b!88543 c!14669) b!88544))

(assert (= (and b!88543 (not c!14669)) b!88545))

(declare-fun m!94903 () Bool)

(assert (=> b!88544 m!94903))

(assert (=> d!23371 d!23607))

(declare-fun d!23609 () Bool)

(assert (=> d!23609 (= (getValueByKey!141 lt!41988 (_1!1113 lt!41733)) (Some!146 (_2!1113 lt!41733)))))

(declare-fun lt!42374 () Unit!2600)

(assert (=> d!23609 (= lt!42374 (choose!517 lt!41988 (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(declare-fun e!57658 () Bool)

(assert (=> d!23609 e!57658))

(declare-fun res!45338 () Bool)

(assert (=> d!23609 (=> (not res!45338) (not e!57658))))

(assert (=> d!23609 (= res!45338 (isStrictlySorted!299 lt!41988))))

(assert (=> d!23609 (= (lemmaContainsTupThenGetReturnValue!58 lt!41988 (_1!1113 lt!41733) (_2!1113 lt!41733)) lt!42374)))

(declare-fun b!88546 () Bool)

(declare-fun res!45339 () Bool)

(assert (=> b!88546 (=> (not res!45339) (not e!57658))))

(assert (=> b!88546 (= res!45339 (containsKey!145 lt!41988 (_1!1113 lt!41733)))))

(declare-fun b!88547 () Bool)

(assert (=> b!88547 (= e!57658 (contains!757 lt!41988 (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733))))))

(assert (= (and d!23609 res!45338) b!88546))

(assert (= (and b!88546 res!45339) b!88547))

(assert (=> d!23609 m!93991))

(declare-fun m!94905 () Bool)

(assert (=> d!23609 m!94905))

(declare-fun m!94907 () Bool)

(assert (=> d!23609 m!94907))

(declare-fun m!94909 () Bool)

(assert (=> b!88546 m!94909))

(declare-fun m!94911 () Bool)

(assert (=> b!88547 m!94911))

(assert (=> d!23371 d!23609))

(declare-fun e!57663 () List!1522)

(declare-fun bm!8524 () Bool)

(declare-fun call!8529 () List!1522)

(declare-fun c!14671 () Bool)

(assert (=> bm!8524 (= call!8529 ($colon$colon!73 e!57663 (ite c!14671 (h!2110 (toList!748 lt!41742)) (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733)))))))

(declare-fun c!14673 () Bool)

(assert (=> bm!8524 (= c!14673 c!14671)))

(declare-fun b!88548 () Bool)

(declare-fun c!14672 () Bool)

(assert (=> b!88548 (= c!14672 (and ((_ is Cons!1518) (toList!748 lt!41742)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41742))) (_1!1113 lt!41733))))))

(declare-fun e!57659 () List!1522)

(declare-fun e!57661 () List!1522)

(assert (=> b!88548 (= e!57659 e!57661)))

(declare-fun b!88549 () Bool)

(declare-fun e!57660 () List!1522)

(assert (=> b!88549 (= e!57660 e!57659)))

(declare-fun c!14670 () Bool)

(assert (=> b!88549 (= c!14670 (and ((_ is Cons!1518) (toList!748 lt!41742)) (= (_1!1113 (h!2110 (toList!748 lt!41742))) (_1!1113 lt!41733))))))

(declare-fun b!88550 () Bool)

(declare-fun call!8528 () List!1522)

(assert (=> b!88550 (= e!57661 call!8528)))

(declare-fun b!88551 () Bool)

(declare-fun res!45341 () Bool)

(declare-fun e!57662 () Bool)

(assert (=> b!88551 (=> (not res!45341) (not e!57662))))

(declare-fun lt!42375 () List!1522)

(assert (=> b!88551 (= res!45341 (containsKey!145 lt!42375 (_1!1113 lt!41733)))))

(declare-fun b!88552 () Bool)

(assert (=> b!88552 (= e!57661 call!8528)))

(declare-fun d!23611 () Bool)

(assert (=> d!23611 e!57662))

(declare-fun res!45340 () Bool)

(assert (=> d!23611 (=> (not res!45340) (not e!57662))))

(assert (=> d!23611 (= res!45340 (isStrictlySorted!299 lt!42375))))

(assert (=> d!23611 (= lt!42375 e!57660)))

(assert (=> d!23611 (= c!14671 (and ((_ is Cons!1518) (toList!748 lt!41742)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41742))) (_1!1113 lt!41733))))))

(assert (=> d!23611 (isStrictlySorted!299 (toList!748 lt!41742))))

(assert (=> d!23611 (= (insertStrictlySorted!61 (toList!748 lt!41742) (_1!1113 lt!41733) (_2!1113 lt!41733)) lt!42375)))

(declare-fun b!88553 () Bool)

(declare-fun call!8527 () List!1522)

(assert (=> b!88553 (= e!57659 call!8527)))

(declare-fun b!88554 () Bool)

(assert (=> b!88554 (= e!57663 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41742)) (_1!1113 lt!41733) (_2!1113 lt!41733)))))

(declare-fun bm!8525 () Bool)

(assert (=> bm!8525 (= call!8527 call!8529)))

(declare-fun b!88555 () Bool)

(assert (=> b!88555 (= e!57662 (contains!757 lt!42375 (tuple2!2205 (_1!1113 lt!41733) (_2!1113 lt!41733))))))

(declare-fun b!88556 () Bool)

(assert (=> b!88556 (= e!57663 (ite c!14670 (t!5264 (toList!748 lt!41742)) (ite c!14672 (Cons!1518 (h!2110 (toList!748 lt!41742)) (t!5264 (toList!748 lt!41742))) Nil!1519)))))

(declare-fun bm!8526 () Bool)

(assert (=> bm!8526 (= call!8528 call!8527)))

(declare-fun b!88557 () Bool)

(assert (=> b!88557 (= e!57660 call!8529)))

(assert (= (and d!23611 c!14671) b!88557))

(assert (= (and d!23611 (not c!14671)) b!88549))

(assert (= (and b!88549 c!14670) b!88553))

(assert (= (and b!88549 (not c!14670)) b!88548))

(assert (= (and b!88548 c!14672) b!88550))

(assert (= (and b!88548 (not c!14672)) b!88552))

(assert (= (or b!88550 b!88552) bm!8526))

(assert (= (or b!88553 bm!8526) bm!8525))

(assert (= (or b!88557 bm!8525) bm!8524))

(assert (= (and bm!8524 c!14673) b!88554))

(assert (= (and bm!8524 (not c!14673)) b!88556))

(assert (= (and d!23611 res!45340) b!88551))

(assert (= (and b!88551 res!45341) b!88555))

(declare-fun m!94913 () Bool)

(assert (=> b!88551 m!94913))

(declare-fun m!94915 () Bool)

(assert (=> bm!8524 m!94915))

(declare-fun m!94917 () Bool)

(assert (=> b!88554 m!94917))

(declare-fun m!94919 () Bool)

(assert (=> b!88555 m!94919))

(declare-fun m!94921 () Bool)

(assert (=> d!23611 m!94921))

(declare-fun m!94923 () Bool)

(assert (=> d!23611 m!94923))

(assert (=> d!23371 d!23611))

(assert (=> b!87936 d!23435))

(declare-fun d!23613 () Bool)

(declare-fun e!57665 () Bool)

(assert (=> d!23613 e!57665))

(declare-fun res!45342 () Bool)

(assert (=> d!23613 (=> res!45342 e!57665)))

(declare-fun lt!42379 () Bool)

(assert (=> d!23613 (= res!45342 (not lt!42379))))

(declare-fun lt!42376 () Bool)

(assert (=> d!23613 (= lt!42379 lt!42376)))

(declare-fun lt!42377 () Unit!2600)

(declare-fun e!57664 () Unit!2600)

(assert (=> d!23613 (= lt!42377 e!57664)))

(declare-fun c!14674 () Bool)

(assert (=> d!23613 (= c!14674 lt!42376)))

(assert (=> d!23613 (= lt!42376 (containsKey!145 (toList!748 lt!41979) (_1!1113 lt!41744)))))

(assert (=> d!23613 (= (contains!756 lt!41979 (_1!1113 lt!41744)) lt!42379)))

(declare-fun b!88558 () Bool)

(declare-fun lt!42378 () Unit!2600)

(assert (=> b!88558 (= e!57664 lt!42378)))

(assert (=> b!88558 (= lt!42378 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!41979) (_1!1113 lt!41744)))))

(assert (=> b!88558 (isDefined!94 (getValueByKey!141 (toList!748 lt!41979) (_1!1113 lt!41744)))))

(declare-fun b!88559 () Bool)

(declare-fun Unit!2628 () Unit!2600)

(assert (=> b!88559 (= e!57664 Unit!2628)))

(declare-fun b!88560 () Bool)

(assert (=> b!88560 (= e!57665 (isDefined!94 (getValueByKey!141 (toList!748 lt!41979) (_1!1113 lt!41744))))))

(assert (= (and d!23613 c!14674) b!88558))

(assert (= (and d!23613 (not c!14674)) b!88559))

(assert (= (and d!23613 (not res!45342)) b!88560))

(declare-fun m!94925 () Bool)

(assert (=> d!23613 m!94925))

(declare-fun m!94927 () Bool)

(assert (=> b!88558 m!94927))

(assert (=> b!88558 m!93973))

(assert (=> b!88558 m!93973))

(declare-fun m!94929 () Bool)

(assert (=> b!88558 m!94929))

(assert (=> b!88560 m!93973))

(assert (=> b!88560 m!93973))

(assert (=> b!88560 m!94929))

(assert (=> d!23367 d!23613))

(declare-fun b!88561 () Bool)

(declare-fun e!57666 () Option!147)

(assert (=> b!88561 (= e!57666 (Some!146 (_2!1113 (h!2110 lt!41980))))))

(declare-fun b!88562 () Bool)

(declare-fun e!57667 () Option!147)

(assert (=> b!88562 (= e!57666 e!57667)))

(declare-fun c!14676 () Bool)

(assert (=> b!88562 (= c!14676 (and ((_ is Cons!1518) lt!41980) (not (= (_1!1113 (h!2110 lt!41980)) (_1!1113 lt!41744)))))))

(declare-fun d!23615 () Bool)

(declare-fun c!14675 () Bool)

(assert (=> d!23615 (= c!14675 (and ((_ is Cons!1518) lt!41980) (= (_1!1113 (h!2110 lt!41980)) (_1!1113 lt!41744))))))

(assert (=> d!23615 (= (getValueByKey!141 lt!41980 (_1!1113 lt!41744)) e!57666)))

(declare-fun b!88563 () Bool)

(assert (=> b!88563 (= e!57667 (getValueByKey!141 (t!5264 lt!41980) (_1!1113 lt!41744)))))

(declare-fun b!88564 () Bool)

(assert (=> b!88564 (= e!57667 None!145)))

(assert (= (and d!23615 c!14675) b!88561))

(assert (= (and d!23615 (not c!14675)) b!88562))

(assert (= (and b!88562 c!14676) b!88563))

(assert (= (and b!88562 (not c!14676)) b!88564))

(declare-fun m!94931 () Bool)

(assert (=> b!88563 m!94931))

(assert (=> d!23367 d!23615))

(declare-fun d!23617 () Bool)

(assert (=> d!23617 (= (getValueByKey!141 lt!41980 (_1!1113 lt!41744)) (Some!146 (_2!1113 lt!41744)))))

(declare-fun lt!42380 () Unit!2600)

(assert (=> d!23617 (= lt!42380 (choose!517 lt!41980 (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun e!57668 () Bool)

(assert (=> d!23617 e!57668))

(declare-fun res!45343 () Bool)

(assert (=> d!23617 (=> (not res!45343) (not e!57668))))

(assert (=> d!23617 (= res!45343 (isStrictlySorted!299 lt!41980))))

(assert (=> d!23617 (= (lemmaContainsTupThenGetReturnValue!58 lt!41980 (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42380)))

(declare-fun b!88565 () Bool)

(declare-fun res!45344 () Bool)

(assert (=> b!88565 (=> (not res!45344) (not e!57668))))

(assert (=> b!88565 (= res!45344 (containsKey!145 lt!41980 (_1!1113 lt!41744)))))

(declare-fun b!88566 () Bool)

(assert (=> b!88566 (= e!57668 (contains!757 lt!41980 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(assert (= (and d!23617 res!45343) b!88565))

(assert (= (and b!88565 res!45344) b!88566))

(assert (=> d!23617 m!93967))

(declare-fun m!94933 () Bool)

(assert (=> d!23617 m!94933))

(declare-fun m!94935 () Bool)

(assert (=> d!23617 m!94935))

(declare-fun m!94937 () Bool)

(assert (=> b!88565 m!94937))

(declare-fun m!94939 () Bool)

(assert (=> b!88566 m!94939))

(assert (=> d!23367 d!23617))

(declare-fun e!57673 () List!1522)

(declare-fun c!14678 () Bool)

(declare-fun bm!8527 () Bool)

(declare-fun call!8532 () List!1522)

(assert (=> bm!8527 (= call!8532 ($colon$colon!73 e!57673 (ite c!14678 (h!2110 (toList!748 lt!41738)) (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744)))))))

(declare-fun c!14680 () Bool)

(assert (=> bm!8527 (= c!14680 c!14678)))

(declare-fun b!88567 () Bool)

(declare-fun c!14679 () Bool)

(assert (=> b!88567 (= c!14679 (and ((_ is Cons!1518) (toList!748 lt!41738)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41744))))))

(declare-fun e!57669 () List!1522)

(declare-fun e!57671 () List!1522)

(assert (=> b!88567 (= e!57669 e!57671)))

(declare-fun b!88568 () Bool)

(declare-fun e!57670 () List!1522)

(assert (=> b!88568 (= e!57670 e!57669)))

(declare-fun c!14677 () Bool)

(assert (=> b!88568 (= c!14677 (and ((_ is Cons!1518) (toList!748 lt!41738)) (= (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41744))))))

(declare-fun b!88569 () Bool)

(declare-fun call!8531 () List!1522)

(assert (=> b!88569 (= e!57671 call!8531)))

(declare-fun b!88570 () Bool)

(declare-fun res!45346 () Bool)

(declare-fun e!57672 () Bool)

(assert (=> b!88570 (=> (not res!45346) (not e!57672))))

(declare-fun lt!42381 () List!1522)

(assert (=> b!88570 (= res!45346 (containsKey!145 lt!42381 (_1!1113 lt!41744)))))

(declare-fun b!88571 () Bool)

(assert (=> b!88571 (= e!57671 call!8531)))

(declare-fun d!23619 () Bool)

(assert (=> d!23619 e!57672))

(declare-fun res!45345 () Bool)

(assert (=> d!23619 (=> (not res!45345) (not e!57672))))

(assert (=> d!23619 (= res!45345 (isStrictlySorted!299 lt!42381))))

(assert (=> d!23619 (= lt!42381 e!57670)))

(assert (=> d!23619 (= c!14678 (and ((_ is Cons!1518) (toList!748 lt!41738)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41738))) (_1!1113 lt!41744))))))

(assert (=> d!23619 (isStrictlySorted!299 (toList!748 lt!41738))))

(assert (=> d!23619 (= (insertStrictlySorted!61 (toList!748 lt!41738) (_1!1113 lt!41744) (_2!1113 lt!41744)) lt!42381)))

(declare-fun b!88572 () Bool)

(declare-fun call!8530 () List!1522)

(assert (=> b!88572 (= e!57669 call!8530)))

(declare-fun b!88573 () Bool)

(assert (=> b!88573 (= e!57673 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41738)) (_1!1113 lt!41744) (_2!1113 lt!41744)))))

(declare-fun bm!8528 () Bool)

(assert (=> bm!8528 (= call!8530 call!8532)))

(declare-fun b!88574 () Bool)

(assert (=> b!88574 (= e!57672 (contains!757 lt!42381 (tuple2!2205 (_1!1113 lt!41744) (_2!1113 lt!41744))))))

(declare-fun b!88575 () Bool)

(assert (=> b!88575 (= e!57673 (ite c!14677 (t!5264 (toList!748 lt!41738)) (ite c!14679 (Cons!1518 (h!2110 (toList!748 lt!41738)) (t!5264 (toList!748 lt!41738))) Nil!1519)))))

(declare-fun bm!8529 () Bool)

(assert (=> bm!8529 (= call!8531 call!8530)))

(declare-fun b!88576 () Bool)

(assert (=> b!88576 (= e!57670 call!8532)))

(assert (= (and d!23619 c!14678) b!88576))

(assert (= (and d!23619 (not c!14678)) b!88568))

(assert (= (and b!88568 c!14677) b!88572))

(assert (= (and b!88568 (not c!14677)) b!88567))

(assert (= (and b!88567 c!14679) b!88569))

(assert (= (and b!88567 (not c!14679)) b!88571))

(assert (= (or b!88569 b!88571) bm!8529))

(assert (= (or b!88572 bm!8529) bm!8528))

(assert (= (or b!88576 bm!8528) bm!8527))

(assert (= (and bm!8527 c!14680) b!88573))

(assert (= (and bm!8527 (not c!14680)) b!88575))

(assert (= (and d!23619 res!45345) b!88570))

(assert (= (and b!88570 res!45346) b!88574))

(declare-fun m!94941 () Bool)

(assert (=> b!88570 m!94941))

(declare-fun m!94943 () Bool)

(assert (=> bm!8527 m!94943))

(declare-fun m!94945 () Bool)

(assert (=> b!88573 m!94945))

(declare-fun m!94947 () Bool)

(assert (=> b!88574 m!94947))

(declare-fun m!94949 () Bool)

(assert (=> d!23619 m!94949))

(assert (=> d!23619 m!94851))

(assert (=> d!23367 d!23619))

(declare-fun d!23621 () Bool)

(declare-fun e!57676 () Bool)

(assert (=> d!23621 e!57676))

(declare-fun c!14683 () Bool)

(assert (=> d!23621 (= c!14683 (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23621 true))

(declare-fun _$29!111 () Unit!2600)

(assert (=> d!23621 (= (choose!514 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (_values!2342 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992))) (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) (zeroValue!2249 (v!2661 (underlying!292 thiss!992))) (minValue!2249 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992)))) _$29!111)))

(declare-fun b!88581 () Bool)

(assert (=> b!88581 (= e!57676 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88582 () Bool)

(assert (=> b!88582 (= e!57676 (ite (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2194 (v!2661 (underlying!292 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23621 c!14683) b!88581))

(assert (= (and d!23621 (not c!14683)) b!88582))

(assert (=> b!88581 m!93699))

(assert (=> b!88581 m!93719))

(assert (=> d!23401 d!23621))

(assert (=> d!23401 d!23383))

(declare-fun b!88583 () Bool)

(declare-fun e!57677 () Option!147)

(assert (=> b!88583 (= e!57677 (Some!146 (_2!1113 (h!2110 (toList!748 lt!42023)))))))

(declare-fun b!88584 () Bool)

(declare-fun e!57678 () Option!147)

(assert (=> b!88584 (= e!57677 e!57678)))

(declare-fun c!14685 () Bool)

(assert (=> b!88584 (= c!14685 (and ((_ is Cons!1518) (toList!748 lt!42023)) (not (= (_1!1113 (h!2110 (toList!748 lt!42023))) (_1!1113 lt!41735)))))))

(declare-fun d!23623 () Bool)

(declare-fun c!14684 () Bool)

(assert (=> d!23623 (= c!14684 (and ((_ is Cons!1518) (toList!748 lt!42023)) (= (_1!1113 (h!2110 (toList!748 lt!42023))) (_1!1113 lt!41735))))))

(assert (=> d!23623 (= (getValueByKey!141 (toList!748 lt!42023) (_1!1113 lt!41735)) e!57677)))

(declare-fun b!88585 () Bool)

(assert (=> b!88585 (= e!57678 (getValueByKey!141 (t!5264 (toList!748 lt!42023)) (_1!1113 lt!41735)))))

(declare-fun b!88586 () Bool)

(assert (=> b!88586 (= e!57678 None!145)))

(assert (= (and d!23623 c!14684) b!88583))

(assert (= (and d!23623 (not c!14684)) b!88584))

(assert (= (and b!88584 c!14685) b!88585))

(assert (= (and b!88584 (not c!14685)) b!88586))

(declare-fun m!94951 () Bool)

(assert (=> b!88585 m!94951))

(assert (=> b!88093 d!23623))

(declare-fun d!23625 () Bool)

(declare-fun res!45347 () Bool)

(declare-fun e!57679 () Bool)

(assert (=> d!23625 (=> (not res!45347) (not e!57679))))

(assert (=> d!23625 (= res!45347 (simpleValid!59 (_2!1112 lt!41888)))))

(assert (=> d!23625 (= (valid!327 (_2!1112 lt!41888)) e!57679)))

(declare-fun b!88587 () Bool)

(declare-fun res!45348 () Bool)

(assert (=> b!88587 (=> (not res!45348) (not e!57679))))

(assert (=> b!88587 (= res!45348 (= (arrayCountValidKeys!0 (_keys!4035 (_2!1112 lt!41888)) #b00000000000000000000000000000000 (size!2170 (_keys!4035 (_2!1112 lt!41888)))) (_size!430 (_2!1112 lt!41888))))))

(declare-fun b!88588 () Bool)

(declare-fun res!45349 () Bool)

(assert (=> b!88588 (=> (not res!45349) (not e!57679))))

(assert (=> b!88588 (= res!45349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 (_2!1112 lt!41888)) (mask!6397 (_2!1112 lt!41888))))))

(declare-fun b!88589 () Bool)

(assert (=> b!88589 (= e!57679 (arrayNoDuplicates!0 (_keys!4035 (_2!1112 lt!41888)) #b00000000000000000000000000000000 Nil!1520))))

(assert (= (and d!23625 res!45347) b!88587))

(assert (= (and b!88587 res!45348) b!88588))

(assert (= (and b!88588 res!45349) b!88589))

(declare-fun m!94953 () Bool)

(assert (=> d!23625 m!94953))

(declare-fun m!94955 () Bool)

(assert (=> b!88587 m!94955))

(declare-fun m!94957 () Bool)

(assert (=> b!88588 m!94957))

(declare-fun m!94959 () Bool)

(assert (=> b!88589 m!94959))

(assert (=> d!23351 d!23625))

(assert (=> d!23351 d!23389))

(assert (=> bm!8463 d!23373))

(declare-fun b!88590 () Bool)

(declare-fun e!57680 () Option!147)

(assert (=> b!88590 (= e!57680 (Some!146 (_2!1113 (h!2110 (toList!748 lt!42016)))))))

(declare-fun b!88591 () Bool)

(declare-fun e!57681 () Option!147)

(assert (=> b!88591 (= e!57680 e!57681)))

(declare-fun c!14687 () Bool)

(assert (=> b!88591 (= c!14687 (and ((_ is Cons!1518) (toList!748 lt!42016)) (not (= (_1!1113 (h!2110 (toList!748 lt!42016))) (_1!1113 lt!41744)))))))

(declare-fun d!23627 () Bool)

(declare-fun c!14686 () Bool)

(assert (=> d!23627 (= c!14686 (and ((_ is Cons!1518) (toList!748 lt!42016)) (= (_1!1113 (h!2110 (toList!748 lt!42016))) (_1!1113 lt!41744))))))

(assert (=> d!23627 (= (getValueByKey!141 (toList!748 lt!42016) (_1!1113 lt!41744)) e!57680)))

(declare-fun b!88592 () Bool)

(assert (=> b!88592 (= e!57681 (getValueByKey!141 (t!5264 (toList!748 lt!42016)) (_1!1113 lt!41744)))))

(declare-fun b!88593 () Bool)

(assert (=> b!88593 (= e!57681 None!145)))

(assert (= (and d!23627 c!14686) b!88590))

(assert (= (and d!23627 (not c!14686)) b!88591))

(assert (= (and b!88591 c!14687) b!88592))

(assert (= (and b!88591 (not c!14687)) b!88593))

(declare-fun m!94961 () Bool)

(assert (=> b!88592 m!94961))

(assert (=> b!88091 d!23627))

(assert (=> d!23357 d!23435))

(declare-fun d!23629 () Bool)

(declare-fun e!57682 () Bool)

(assert (=> d!23629 e!57682))

(declare-fun res!45350 () Bool)

(assert (=> d!23629 (=> (not res!45350) (not e!57682))))

(declare-fun lt!42383 () ListLongMap!1465)

(assert (=> d!23629 (= res!45350 (contains!756 lt!42383 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(declare-fun lt!42384 () List!1522)

(assert (=> d!23629 (= lt!42383 (ListLongMap!1466 lt!42384))))

(declare-fun lt!42385 () Unit!2600)

(declare-fun lt!42382 () Unit!2600)

(assert (=> d!23629 (= lt!42385 lt!42382)))

(assert (=> d!23629 (= (getValueByKey!141 lt!42384 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23629 (= lt!42382 (lemmaContainsTupThenGetReturnValue!58 lt!42384 (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23629 (= lt!42384 (insertStrictlySorted!61 (toList!748 call!8442) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))))))

(assert (=> d!23629 (= (+!112 call!8442 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) lt!42383)))

(declare-fun b!88594 () Bool)

(declare-fun res!45351 () Bool)

(assert (=> b!88594 (=> (not res!45351) (not e!57682))))

(assert (=> b!88594 (= res!45351 (= (getValueByKey!141 (toList!748 lt!42383) (_1!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734))) (Some!146 (_2!1113 (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))))

(declare-fun b!88595 () Bool)

(assert (=> b!88595 (= e!57682 (contains!757 (toList!748 lt!42383) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)))))

(assert (= (and d!23629 res!45350) b!88594))

(assert (= (and b!88594 res!45351) b!88595))

(declare-fun m!94963 () Bool)

(assert (=> d!23629 m!94963))

(declare-fun m!94965 () Bool)

(assert (=> d!23629 m!94965))

(declare-fun m!94967 () Bool)

(assert (=> d!23629 m!94967))

(declare-fun m!94969 () Bool)

(assert (=> d!23629 m!94969))

(declare-fun m!94971 () Bool)

(assert (=> b!88594 m!94971))

(declare-fun m!94973 () Bool)

(assert (=> b!88595 m!94973))

(assert (=> b!87948 d!23629))

(declare-fun d!23631 () Bool)

(assert (=> d!23631 (= (apply!83 lt!41956 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1204 (getValueByKey!141 (toList!748 lt!41956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3743 () Bool)

(assert (= bs!3743 d!23631))

(assert (=> bs!3743 m!94343))

(assert (=> bs!3743 m!94343))

(declare-fun m!94975 () Bool)

(assert (=> bs!3743 m!94975))

(assert (=> b!88029 d!23631))

(declare-fun b!88596 () Bool)

(declare-fun e!57683 () Bool)

(declare-fun call!8533 () Bool)

(assert (=> b!88596 (= e!57683 call!8533)))

(declare-fun b!88597 () Bool)

(declare-fun e!57684 () Bool)

(assert (=> b!88597 (= e!57684 e!57683)))

(declare-fun c!14688 () Bool)

(assert (=> b!88597 (= c!14688 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88598 () Bool)

(declare-fun e!57685 () Bool)

(assert (=> b!88598 (= e!57683 e!57685)))

(declare-fun lt!42386 () (_ BitVec 64))

(assert (=> b!88598 (= lt!42386 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42388 () Unit!2600)

(assert (=> b!88598 (= lt!42388 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4035 newMap!16) lt!42386 #b00000000000000000000000000000000))))

(assert (=> b!88598 (arrayContainsKey!0 (_keys!4035 newMap!16) lt!42386 #b00000000000000000000000000000000)))

(declare-fun lt!42387 () Unit!2600)

(assert (=> b!88598 (= lt!42387 lt!42388)))

(declare-fun res!45352 () Bool)

(assert (=> b!88598 (= res!45352 (= (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000) (_keys!4035 newMap!16) (mask!6397 newMap!16)) (Found!244 #b00000000000000000000000000000000)))))

(assert (=> b!88598 (=> (not res!45352) (not e!57685))))

(declare-fun d!23633 () Bool)

(declare-fun res!45353 () Bool)

(assert (=> d!23633 (=> res!45353 e!57684)))

(assert (=> d!23633 (= res!45353 (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(assert (=> d!23633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4035 newMap!16) (mask!6397 newMap!16)) e!57684)))

(declare-fun bm!8530 () Bool)

(assert (=> bm!8530 (= call!8533 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun b!88599 () Bool)

(assert (=> b!88599 (= e!57685 call!8533)))

(assert (= (and d!23633 (not res!45353)) b!88597))

(assert (= (and b!88597 c!14688) b!88598))

(assert (= (and b!88597 (not c!14688)) b!88596))

(assert (= (and b!88598 res!45352) b!88599))

(assert (= (or b!88599 b!88596) bm!8530))

(assert (=> b!88597 m!94263))

(assert (=> b!88597 m!94263))

(assert (=> b!88597 m!94271))

(assert (=> b!88598 m!94263))

(declare-fun m!94977 () Bool)

(assert (=> b!88598 m!94977))

(declare-fun m!94979 () Bool)

(assert (=> b!88598 m!94979))

(assert (=> b!88598 m!94263))

(declare-fun m!94981 () Bool)

(assert (=> b!88598 m!94981))

(declare-fun m!94983 () Bool)

(assert (=> bm!8530 m!94983))

(assert (=> b!88104 d!23633))

(declare-fun d!23635 () Bool)

(declare-fun e!57698 () Bool)

(assert (=> d!23635 e!57698))

(declare-fun res!45355 () Bool)

(assert (=> d!23635 (=> (not res!45355) (not e!57698))))

(assert (=> d!23635 (= res!45355 (or (bvsge #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))))

(declare-fun lt!42397 () ListLongMap!1465)

(declare-fun lt!42404 () ListLongMap!1465)

(assert (=> d!23635 (= lt!42397 lt!42404)))

(declare-fun lt!42398 () Unit!2600)

(declare-fun e!57691 () Unit!2600)

(assert (=> d!23635 (= lt!42398 e!57691)))

(declare-fun c!14691 () Bool)

(declare-fun e!57696 () Bool)

(assert (=> d!23635 (= c!14691 e!57696)))

(declare-fun res!45360 () Bool)

(assert (=> d!23635 (=> (not res!45360) (not e!57696))))

(assert (=> d!23635 (= res!45360 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun e!57694 () ListLongMap!1465)

(assert (=> d!23635 (= lt!42404 e!57694)))

(declare-fun c!14690 () Bool)

(assert (=> d!23635 (= c!14690 (and (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23635 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23635 (= (getCurrentListMap!441 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) lt!42397)))

(declare-fun b!88600 () Bool)

(declare-fun call!8539 () ListLongMap!1465)

(assert (=> b!88600 (= e!57694 (+!112 call!8539 (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 newMap!16))))))

(declare-fun b!88601 () Bool)

(declare-fun e!57692 () Bool)

(assert (=> b!88601 (= e!57692 (= (apply!83 lt!42397 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16))))))

(declare-fun b!88602 () Bool)

(declare-fun e!57695 () Bool)

(declare-fun call!8538 () Bool)

(assert (=> b!88602 (= e!57695 (not call!8538))))

(declare-fun e!57688 () Bool)

(declare-fun b!88603 () Bool)

(assert (=> b!88603 (= e!57688 (= (apply!83 lt!42397 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)) (get!1201 (select (arr!1926 (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!342 (defaultEntry!2359 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2171 (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))))))))

(assert (=> b!88603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88604 () Bool)

(declare-fun e!57686 () Bool)

(declare-fun call!8536 () Bool)

(assert (=> b!88604 (= e!57686 (not call!8536))))

(declare-fun b!88605 () Bool)

(declare-fun e!57693 () Bool)

(assert (=> b!88605 (= e!57693 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88606 () Bool)

(declare-fun res!45357 () Bool)

(assert (=> b!88606 (=> (not res!45357) (not e!57698))))

(assert (=> b!88606 (= res!45357 e!57686)))

(declare-fun c!14692 () Bool)

(assert (=> b!88606 (= c!14692 (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8531 () Bool)

(declare-fun call!8540 () ListLongMap!1465)

(assert (=> bm!8531 (= call!8540 call!8539)))

(declare-fun b!88607 () Bool)

(declare-fun Unit!2629 () Unit!2600)

(assert (=> b!88607 (= e!57691 Unit!2629)))

(declare-fun b!88608 () Bool)

(declare-fun lt!42402 () Unit!2600)

(assert (=> b!88608 (= e!57691 lt!42402)))

(declare-fun lt!42403 () ListLongMap!1465)

(assert (=> b!88608 (= lt!42403 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42406 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42410 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42410 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42395 () Unit!2600)

(assert (=> b!88608 (= lt!42395 (addStillContains!59 lt!42403 lt!42406 (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) lt!42410))))

(assert (=> b!88608 (contains!756 (+!112 lt!42403 (tuple2!2205 lt!42406 (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)))) lt!42410)))

(declare-fun lt!42409 () Unit!2600)

(assert (=> b!88608 (= lt!42409 lt!42395)))

(declare-fun lt!42392 () ListLongMap!1465)

(assert (=> b!88608 (= lt!42392 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42407 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42407 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42408 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42408 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42391 () Unit!2600)

(assert (=> b!88608 (= lt!42391 (addApplyDifferent!59 lt!42392 lt!42407 (minValue!2249 newMap!16) lt!42408))))

(assert (=> b!88608 (= (apply!83 (+!112 lt!42392 (tuple2!2205 lt!42407 (minValue!2249 newMap!16))) lt!42408) (apply!83 lt!42392 lt!42408))))

(declare-fun lt!42399 () Unit!2600)

(assert (=> b!88608 (= lt!42399 lt!42391)))

(declare-fun lt!42394 () ListLongMap!1465)

(assert (=> b!88608 (= lt!42394 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42389 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42401 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42401 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42396 () Unit!2600)

(assert (=> b!88608 (= lt!42396 (addApplyDifferent!59 lt!42394 lt!42389 (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) lt!42401))))

(assert (=> b!88608 (= (apply!83 (+!112 lt!42394 (tuple2!2205 lt!42389 (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)))) lt!42401) (apply!83 lt!42394 lt!42401))))

(declare-fun lt!42390 () Unit!2600)

(assert (=> b!88608 (= lt!42390 lt!42396)))

(declare-fun lt!42400 () ListLongMap!1465)

(assert (=> b!88608 (= lt!42400 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun lt!42405 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42393 () (_ BitVec 64))

(assert (=> b!88608 (= lt!42393 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88608 (= lt!42402 (addApplyDifferent!59 lt!42400 lt!42405 (minValue!2249 newMap!16) lt!42393))))

(assert (=> b!88608 (= (apply!83 (+!112 lt!42400 (tuple2!2205 lt!42405 (minValue!2249 newMap!16))) lt!42393) (apply!83 lt!42400 lt!42393))))

(declare-fun b!88609 () Bool)

(declare-fun c!14689 () Bool)

(assert (=> b!88609 (= c!14689 (and (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57697 () ListLongMap!1465)

(declare-fun e!57689 () ListLongMap!1465)

(assert (=> b!88609 (= e!57697 e!57689)))

(declare-fun b!88610 () Bool)

(declare-fun e!57687 () Bool)

(assert (=> b!88610 (= e!57687 e!57688)))

(declare-fun res!45362 () Bool)

(assert (=> b!88610 (=> (not res!45362) (not e!57688))))

(assert (=> b!88610 (= res!45362 (contains!756 lt!42397 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88611 () Bool)

(declare-fun call!8534 () ListLongMap!1465)

(assert (=> b!88611 (= e!57689 call!8534)))

(declare-fun b!88612 () Bool)

(assert (=> b!88612 (= e!57686 e!57692)))

(declare-fun res!45358 () Bool)

(assert (=> b!88612 (= res!45358 call!8536)))

(assert (=> b!88612 (=> (not res!45358) (not e!57692))))

(declare-fun b!88613 () Bool)

(declare-fun e!57690 () Bool)

(assert (=> b!88613 (= e!57690 (= (apply!83 lt!42397 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2249 newMap!16)))))

(declare-fun bm!8532 () Bool)

(assert (=> bm!8532 (= call!8538 (contains!756 lt!42397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!8535 () ListLongMap!1465)

(declare-fun bm!8533 () Bool)

(assert (=> bm!8533 (= call!8535 (getCurrentListMapNoExtraKeys!77 (_keys!4035 newMap!16) (ite (or c!14502 c!14511) (_values!2342 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16)))) (mask!6397 newMap!16) (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16)) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)))))

(declare-fun bm!8534 () Bool)

(assert (=> bm!8534 (= call!8536 (contains!756 lt!42397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88614 () Bool)

(assert (=> b!88614 (= e!57697 call!8540)))

(declare-fun b!88615 () Bool)

(assert (=> b!88615 (= e!57694 e!57697)))

(declare-fun c!14694 () Bool)

(assert (=> b!88615 (= c!14694 (and (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88616 () Bool)

(declare-fun res!45356 () Bool)

(assert (=> b!88616 (=> (not res!45356) (not e!57698))))

(assert (=> b!88616 (= res!45356 e!57687)))

(declare-fun res!45361 () Bool)

(assert (=> b!88616 (=> res!45361 e!57687)))

(assert (=> b!88616 (= res!45361 (not e!57693))))

(declare-fun res!45354 () Bool)

(assert (=> b!88616 (=> (not res!45354) (not e!57693))))

(assert (=> b!88616 (= res!45354 (bvslt #b00000000000000000000000000000000 (size!2170 (_keys!4035 newMap!16))))))

(declare-fun b!88617 () Bool)

(assert (=> b!88617 (= e!57698 e!57695)))

(declare-fun c!14693 () Bool)

(assert (=> b!88617 (= c!14693 (not (= (bvand (ite (and c!14502 c!14503) lt!41890 (extraKeys!2194 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8535 () Bool)

(declare-fun call!8537 () ListLongMap!1465)

(assert (=> bm!8535 (= call!8539 (+!112 (ite c!14690 call!8535 (ite c!14694 call!8537 call!8534)) (ite (or c!14690 c!14694) (tuple2!2205 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14502 c!14503) lt!41734 (zeroValue!2249 newMap!16))) (tuple2!2205 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2249 newMap!16)))))))

(declare-fun b!88618 () Bool)

(assert (=> b!88618 (= e!57689 call!8540)))

(declare-fun bm!8536 () Bool)

(assert (=> bm!8536 (= call!8537 call!8535)))

(declare-fun b!88619 () Bool)

(assert (=> b!88619 (= e!57695 e!57690)))

(declare-fun res!45359 () Bool)

(assert (=> b!88619 (= res!45359 call!8538)))

(assert (=> b!88619 (=> (not res!45359) (not e!57690))))

(declare-fun bm!8537 () Bool)

(assert (=> bm!8537 (= call!8534 call!8537)))

(declare-fun b!88620 () Bool)

(assert (=> b!88620 (= e!57696 (validKeyInArray!0 (select (arr!1925 (_keys!4035 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23635 c!14690) b!88600))

(assert (= (and d!23635 (not c!14690)) b!88615))

(assert (= (and b!88615 c!14694) b!88614))

(assert (= (and b!88615 (not c!14694)) b!88609))

(assert (= (and b!88609 c!14689) b!88618))

(assert (= (and b!88609 (not c!14689)) b!88611))

(assert (= (or b!88618 b!88611) bm!8537))

(assert (= (or b!88614 bm!8537) bm!8536))

(assert (= (or b!88614 b!88618) bm!8531))

(assert (= (or b!88600 bm!8536) bm!8533))

(assert (= (or b!88600 bm!8531) bm!8535))

(assert (= (and d!23635 res!45360) b!88620))

(assert (= (and d!23635 c!14691) b!88608))

(assert (= (and d!23635 (not c!14691)) b!88607))

(assert (= (and d!23635 res!45355) b!88616))

(assert (= (and b!88616 res!45354) b!88605))

(assert (= (and b!88616 (not res!45361)) b!88610))

(assert (= (and b!88610 res!45362) b!88603))

(assert (= (and b!88616 res!45356) b!88606))

(assert (= (and b!88606 c!14692) b!88612))

(assert (= (and b!88606 (not c!14692)) b!88604))

(assert (= (and b!88612 res!45358) b!88601))

(assert (= (or b!88612 b!88604) bm!8534))

(assert (= (and b!88606 res!45357) b!88617))

(assert (= (and b!88617 c!14693) b!88619))

(assert (= (and b!88617 (not c!14693)) b!88602))

(assert (= (and b!88619 res!45359) b!88613))

(assert (= (or b!88619 b!88602) bm!8532))

(declare-fun b_lambda!3921 () Bool)

(assert (=> (not b_lambda!3921) (not b!88603)))

(assert (=> b!88603 t!5271))

(declare-fun b_and!5331 () Bool)

(assert (= b_and!5327 (and (=> t!5271 result!2955) b_and!5331)))

(assert (=> b!88603 t!5273))

(declare-fun b_and!5333 () Bool)

(assert (= b_and!5329 (and (=> t!5273 result!2957) b_and!5333)))

(declare-fun m!94985 () Bool)

(assert (=> bm!8534 m!94985))

(declare-fun m!94987 () Bool)

(assert (=> b!88603 m!94987))

(assert (=> b!88603 m!94259))

(declare-fun m!94989 () Bool)

(assert (=> b!88603 m!94989))

(assert (=> b!88603 m!94263))

(declare-fun m!94991 () Bool)

(assert (=> b!88603 m!94991))

(assert (=> b!88603 m!94987))

(assert (=> b!88603 m!94259))

(assert (=> b!88603 m!94263))

(declare-fun m!94993 () Bool)

(assert (=> b!88613 m!94993))

(declare-fun m!94995 () Bool)

(assert (=> bm!8533 m!94995))

(assert (=> b!88605 m!94263))

(assert (=> b!88605 m!94263))

(assert (=> b!88605 m!94271))

(declare-fun m!94997 () Bool)

(assert (=> b!88601 m!94997))

(declare-fun m!94999 () Bool)

(assert (=> b!88600 m!94999))

(assert (=> b!88610 m!94263))

(assert (=> b!88610 m!94263))

(declare-fun m!95001 () Bool)

(assert (=> b!88610 m!95001))

(declare-fun m!95003 () Bool)

(assert (=> b!88608 m!95003))

(declare-fun m!95005 () Bool)

(assert (=> b!88608 m!95005))

(declare-fun m!95007 () Bool)

(assert (=> b!88608 m!95007))

(declare-fun m!95009 () Bool)

(assert (=> b!88608 m!95009))

(declare-fun m!95011 () Bool)

(assert (=> b!88608 m!95011))

(declare-fun m!95013 () Bool)

(assert (=> b!88608 m!95013))

(assert (=> b!88608 m!95007))

(declare-fun m!95015 () Bool)

(assert (=> b!88608 m!95015))

(declare-fun m!95017 () Bool)

(assert (=> b!88608 m!95017))

(assert (=> b!88608 m!94263))

(declare-fun m!95019 () Bool)

(assert (=> b!88608 m!95019))

(declare-fun m!95021 () Bool)

(assert (=> b!88608 m!95021))

(declare-fun m!95023 () Bool)

(assert (=> b!88608 m!95023))

(assert (=> b!88608 m!94995))

(assert (=> b!88608 m!95003))

(assert (=> b!88608 m!95021))

(assert (=> b!88608 m!95013))

(declare-fun m!95025 () Bool)

(assert (=> b!88608 m!95025))

(declare-fun m!95027 () Bool)

(assert (=> b!88608 m!95027))

(declare-fun m!95029 () Bool)

(assert (=> b!88608 m!95029))

(declare-fun m!95031 () Bool)

(assert (=> b!88608 m!95031))

(assert (=> d!23635 m!94251))

(declare-fun m!95033 () Bool)

(assert (=> bm!8535 m!95033))

(declare-fun m!95035 () Bool)

(assert (=> bm!8532 m!95035))

(assert (=> b!88620 m!94263))

(assert (=> b!88620 m!94263))

(assert (=> b!88620 m!94271))

(assert (=> bm!8443 d!23635))

(declare-fun d!23637 () Bool)

(declare-fun lt!42413 () Bool)

(declare-fun content!92 (List!1523) (InoxSet (_ BitVec 64)))

(assert (=> d!23637 (= lt!42413 (select (content!92 Nil!1520) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun e!57704 () Bool)

(assert (=> d!23637 (= lt!42413 e!57704)))

(declare-fun res!45368 () Bool)

(assert (=> d!23637 (=> (not res!45368) (not e!57704))))

(assert (=> d!23637 (= res!45368 ((_ is Cons!1519) Nil!1520))))

(assert (=> d!23637 (= (contains!758 Nil!1520 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)) lt!42413)))

(declare-fun b!88625 () Bool)

(declare-fun e!57703 () Bool)

(assert (=> b!88625 (= e!57704 e!57703)))

(declare-fun res!45367 () Bool)

(assert (=> b!88625 (=> res!45367 e!57703)))

(assert (=> b!88625 (= res!45367 (= (h!2111 Nil!1520) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(declare-fun b!88626 () Bool)

(assert (=> b!88626 (= e!57703 (contains!758 (t!5265 Nil!1520) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (= (and d!23637 res!45368) b!88625))

(assert (= (and b!88625 (not res!45367)) b!88626))

(declare-fun m!95037 () Bool)

(assert (=> d!23637 m!95037))

(assert (=> d!23637 m!93699))

(declare-fun m!95039 () Bool)

(assert (=> d!23637 m!95039))

(assert (=> b!88626 m!93699))

(declare-fun m!95041 () Bool)

(assert (=> b!88626 m!95041))

(assert (=> b!88130 d!23637))

(declare-fun b!88643 () Bool)

(declare-fun e!57714 () Bool)

(declare-fun call!8545 () Bool)

(assert (=> b!88643 (= e!57714 (not call!8545))))

(declare-fun b!88644 () Bool)

(declare-fun e!57715 () Bool)

(assert (=> b!88644 (= e!57715 e!57714)))

(declare-fun res!45378 () Bool)

(declare-fun call!8546 () Bool)

(assert (=> b!88644 (= res!45378 call!8546)))

(assert (=> b!88644 (=> (not res!45378) (not e!57714))))

(declare-fun b!88645 () Bool)

(declare-fun lt!42419 () SeekEntryResult!244)

(assert (=> b!88645 (and (bvsge (index!3114 lt!42419) #b00000000000000000000000000000000) (bvslt (index!3114 lt!42419) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun res!45377 () Bool)

(assert (=> b!88645 (= res!45377 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3114 lt!42419)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88645 (=> (not res!45377) (not e!57714))))

(declare-fun b!88646 () Bool)

(declare-fun res!45380 () Bool)

(declare-fun e!57713 () Bool)

(assert (=> b!88646 (=> (not res!45380) (not e!57713))))

(assert (=> b!88646 (= res!45380 call!8546)))

(declare-fun e!57716 () Bool)

(assert (=> b!88646 (= e!57716 e!57713)))

(declare-fun b!88647 () Bool)

(assert (=> b!88647 (= e!57716 ((_ is Undefined!244) lt!42419))))

(declare-fun b!88648 () Bool)

(assert (=> b!88648 (= e!57713 (not call!8545))))

(declare-fun b!88649 () Bool)

(declare-fun res!45379 () Bool)

(assert (=> b!88649 (=> (not res!45379) (not e!57713))))

(assert (=> b!88649 (= res!45379 (= (select (arr!1925 (_keys!4035 newMap!16)) (index!3117 lt!42419)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88649 (and (bvsge (index!3117 lt!42419) #b00000000000000000000000000000000) (bvslt (index!3117 lt!42419) (size!2170 (_keys!4035 newMap!16))))))

(declare-fun bm!8543 () Bool)

(assert (=> bm!8543 (= call!8545 (arrayContainsKey!0 (_keys!4035 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88650 () Bool)

(assert (=> b!88650 (= e!57715 e!57716)))

(declare-fun c!14699 () Bool)

(assert (=> b!88650 (= c!14699 ((_ is MissingVacant!244) lt!42419))))

(declare-fun bm!8542 () Bool)

(declare-fun c!14700 () Bool)

(assert (=> bm!8542 (= call!8546 (inRange!0 (ite c!14700 (index!3114 lt!42419) (index!3117 lt!42419)) (mask!6397 newMap!16)))))

(declare-fun d!23639 () Bool)

(assert (=> d!23639 e!57715))

(assert (=> d!23639 (= c!14700 ((_ is MissingZero!244) lt!42419))))

(assert (=> d!23639 (= lt!42419 (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (_keys!4035 newMap!16) (mask!6397 newMap!16)))))

(declare-fun lt!42418 () Unit!2600)

(declare-fun choose!523 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 64) Int) Unit!2600)

(assert (=> d!23639 (= lt!42418 (choose!523 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)))))

(assert (=> d!23639 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23639 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (defaultEntry!2359 newMap!16)) lt!42418)))

(assert (= (and d!23639 c!14700) b!88644))

(assert (= (and d!23639 (not c!14700)) b!88650))

(assert (= (and b!88644 res!45378) b!88645))

(assert (= (and b!88645 res!45377) b!88643))

(assert (= (and b!88650 c!14699) b!88646))

(assert (= (and b!88650 (not c!14699)) b!88647))

(assert (= (and b!88646 res!45380) b!88649))

(assert (= (and b!88649 res!45379) b!88648))

(assert (= (or b!88644 b!88646) bm!8542))

(assert (= (or b!88643 b!88648) bm!8543))

(declare-fun m!95043 () Bool)

(assert (=> b!88649 m!95043))

(declare-fun m!95045 () Bool)

(assert (=> b!88645 m!95045))

(assert (=> bm!8543 m!93699))

(assert (=> bm!8543 m!93857))

(declare-fun m!95047 () Bool)

(assert (=> bm!8542 m!95047))

(assert (=> d!23639 m!93699))

(assert (=> d!23639 m!93851))

(assert (=> d!23639 m!93699))

(declare-fun m!95049 () Bool)

(assert (=> d!23639 m!95049))

(assert (=> d!23639 m!94251))

(assert (=> bm!8430 d!23639))

(declare-fun b!88651 () Bool)

(declare-fun e!57717 () Option!147)

(assert (=> b!88651 (= e!57717 (Some!146 (_2!1113 (h!2110 (toList!748 lt!42012)))))))

(declare-fun b!88652 () Bool)

(declare-fun e!57718 () Option!147)

(assert (=> b!88652 (= e!57717 e!57718)))

(declare-fun c!14702 () Bool)

(assert (=> b!88652 (= c!14702 (and ((_ is Cons!1518) (toList!748 lt!42012)) (not (= (_1!1113 (h!2110 (toList!748 lt!42012))) (_1!1113 lt!41733)))))))

(declare-fun d!23641 () Bool)

(declare-fun c!14701 () Bool)

(assert (=> d!23641 (= c!14701 (and ((_ is Cons!1518) (toList!748 lt!42012)) (= (_1!1113 (h!2110 (toList!748 lt!42012))) (_1!1113 lt!41733))))))

(assert (=> d!23641 (= (getValueByKey!141 (toList!748 lt!42012) (_1!1113 lt!41733)) e!57717)))

(declare-fun b!88653 () Bool)

(assert (=> b!88653 (= e!57718 (getValueByKey!141 (t!5264 (toList!748 lt!42012)) (_1!1113 lt!41733)))))

(declare-fun b!88654 () Bool)

(assert (=> b!88654 (= e!57718 None!145)))

(assert (= (and d!23641 c!14701) b!88651))

(assert (= (and d!23641 (not c!14701)) b!88652))

(assert (= (and b!88652 c!14702) b!88653))

(assert (= (and b!88652 (not c!14702)) b!88654))

(declare-fun m!95051 () Bool)

(assert (=> b!88653 m!95051))

(assert (=> b!88089 d!23641))

(declare-fun b!88655 () Bool)

(declare-fun e!57719 () Bool)

(declare-fun call!8547 () Bool)

(assert (=> b!88655 (= e!57719 call!8547)))

(declare-fun b!88656 () Bool)

(declare-fun e!57720 () Bool)

(assert (=> b!88656 (= e!57720 e!57719)))

(declare-fun c!14703 () Bool)

(assert (=> b!88656 (= c!14703 (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!88657 () Bool)

(declare-fun e!57721 () Bool)

(assert (=> b!88657 (= e!57719 e!57721)))

(declare-fun lt!42420 () (_ BitVec 64))

(assert (=> b!88657 (= lt!42420 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!42422 () Unit!2600)

(assert (=> b!88657 (= lt!42422 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!42420 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!88657 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) lt!42420 #b00000000000000000000000000000000)))

(declare-fun lt!42421 () Unit!2600)

(assert (=> b!88657 (= lt!42421 lt!42422)))

(declare-fun res!45381 () Bool)

(assert (=> b!88657 (= res!45381 (= (seekEntryOrOpen!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))) (Found!244 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!88657 (=> (not res!45381) (not e!57721))))

(declare-fun d!23643 () Bool)

(declare-fun res!45382 () Bool)

(assert (=> d!23643 (=> res!45382 e!57720)))

(assert (=> d!23643 (= res!45382 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(assert (=> d!23643 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))) e!57720)))

(declare-fun bm!8544 () Bool)

(assert (=> bm!8544 (= call!8547 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4035 (v!2661 (underlying!292 thiss!992))) (mask!6397 (v!2661 (underlying!292 thiss!992)))))))

(declare-fun b!88658 () Bool)

(assert (=> b!88658 (= e!57721 call!8547)))

(assert (= (and d!23643 (not res!45382)) b!88656))

(assert (= (and b!88656 c!14703) b!88657))

(assert (= (and b!88656 (not c!14703)) b!88655))

(assert (= (and b!88657 res!45381) b!88658))

(assert (= (or b!88658 b!88655) bm!8544))

(declare-fun m!95053 () Bool)

(assert (=> b!88656 m!95053))

(assert (=> b!88656 m!95053))

(declare-fun m!95055 () Bool)

(assert (=> b!88656 m!95055))

(assert (=> b!88657 m!95053))

(declare-fun m!95057 () Bool)

(assert (=> b!88657 m!95057))

(declare-fun m!95059 () Bool)

(assert (=> b!88657 m!95059))

(assert (=> b!88657 m!95053))

(declare-fun m!95061 () Bool)

(assert (=> b!88657 m!95061))

(declare-fun m!95063 () Bool)

(assert (=> bm!8544 m!95063))

(assert (=> bm!8446 d!23643))

(declare-fun d!23645 () Bool)

(declare-fun res!45383 () Bool)

(declare-fun e!57722 () Bool)

(assert (=> d!23645 (=> res!45383 e!57722)))

(assert (=> d!23645 (= res!45383 (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355)))))

(assert (=> d!23645 (= (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!57722)))

(declare-fun b!88659 () Bool)

(declare-fun e!57723 () Bool)

(assert (=> b!88659 (= e!57722 e!57723)))

(declare-fun res!45384 () Bool)

(assert (=> b!88659 (=> (not res!45384) (not e!57723))))

(assert (=> b!88659 (= res!45384 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2170 (_keys!4035 (v!2661 (underlying!292 thiss!992))))))))

(declare-fun b!88660 () Bool)

(assert (=> b!88660 (= e!57723 (arrayContainsKey!0 (_keys!4035 (v!2661 (underlying!292 thiss!992))) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23645 (not res!45383)) b!88659))

(assert (= (and b!88659 res!45384) b!88660))

(assert (=> d!23645 m!94691))

(assert (=> b!88660 m!93699))

(declare-fun m!95065 () Bool)

(assert (=> b!88660 m!95065))

(assert (=> b!88111 d!23645))

(assert (=> bm!8420 d!23357))

(declare-fun d!23647 () Bool)

(declare-fun e!57725 () Bool)

(assert (=> d!23647 e!57725))

(declare-fun res!45385 () Bool)

(assert (=> d!23647 (=> res!45385 e!57725)))

(declare-fun lt!42426 () Bool)

(assert (=> d!23647 (= res!45385 (not lt!42426))))

(declare-fun lt!42423 () Bool)

(assert (=> d!23647 (= lt!42426 lt!42423)))

(declare-fun lt!42424 () Unit!2600)

(declare-fun e!57724 () Unit!2600)

(assert (=> d!23647 (= lt!42424 e!57724)))

(declare-fun c!14704 () Bool)

(assert (=> d!23647 (= c!14704 lt!42423)))

(assert (=> d!23647 (= lt!42423 (containsKey!145 (toList!748 lt!42023) (_1!1113 lt!41735)))))

(assert (=> d!23647 (= (contains!756 lt!42023 (_1!1113 lt!41735)) lt!42426)))

(declare-fun b!88661 () Bool)

(declare-fun lt!42425 () Unit!2600)

(assert (=> b!88661 (= e!57724 lt!42425)))

(assert (=> b!88661 (= lt!42425 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 lt!42023) (_1!1113 lt!41735)))))

(assert (=> b!88661 (isDefined!94 (getValueByKey!141 (toList!748 lt!42023) (_1!1113 lt!41735)))))

(declare-fun b!88662 () Bool)

(declare-fun Unit!2630 () Unit!2600)

(assert (=> b!88662 (= e!57724 Unit!2630)))

(declare-fun b!88663 () Bool)

(assert (=> b!88663 (= e!57725 (isDefined!94 (getValueByKey!141 (toList!748 lt!42023) (_1!1113 lt!41735))))))

(assert (= (and d!23647 c!14704) b!88661))

(assert (= (and d!23647 (not c!14704)) b!88662))

(assert (= (and d!23647 (not res!45385)) b!88663))

(declare-fun m!95067 () Bool)

(assert (=> d!23647 m!95067))

(declare-fun m!95069 () Bool)

(assert (=> b!88661 m!95069))

(assert (=> b!88661 m!94063))

(assert (=> b!88661 m!94063))

(declare-fun m!95071 () Bool)

(assert (=> b!88661 m!95071))

(assert (=> b!88663 m!94063))

(assert (=> b!88663 m!94063))

(assert (=> b!88663 m!95071))

(assert (=> d!23381 d!23647))

(declare-fun b!88664 () Bool)

(declare-fun e!57726 () Option!147)

(assert (=> b!88664 (= e!57726 (Some!146 (_2!1113 (h!2110 lt!42024))))))

(declare-fun b!88665 () Bool)

(declare-fun e!57727 () Option!147)

(assert (=> b!88665 (= e!57726 e!57727)))

(declare-fun c!14706 () Bool)

(assert (=> b!88665 (= c!14706 (and ((_ is Cons!1518) lt!42024) (not (= (_1!1113 (h!2110 lt!42024)) (_1!1113 lt!41735)))))))

(declare-fun d!23649 () Bool)

(declare-fun c!14705 () Bool)

(assert (=> d!23649 (= c!14705 (and ((_ is Cons!1518) lt!42024) (= (_1!1113 (h!2110 lt!42024)) (_1!1113 lt!41735))))))

(assert (=> d!23649 (= (getValueByKey!141 lt!42024 (_1!1113 lt!41735)) e!57726)))

(declare-fun b!88666 () Bool)

(assert (=> b!88666 (= e!57727 (getValueByKey!141 (t!5264 lt!42024) (_1!1113 lt!41735)))))

(declare-fun b!88667 () Bool)

(assert (=> b!88667 (= e!57727 None!145)))

(assert (= (and d!23649 c!14705) b!88664))

(assert (= (and d!23649 (not c!14705)) b!88665))

(assert (= (and b!88665 c!14706) b!88666))

(assert (= (and b!88665 (not c!14706)) b!88667))

(declare-fun m!95073 () Bool)

(assert (=> b!88666 m!95073))

(assert (=> d!23381 d!23649))

(declare-fun d!23651 () Bool)

(assert (=> d!23651 (= (getValueByKey!141 lt!42024 (_1!1113 lt!41735)) (Some!146 (_2!1113 lt!41735)))))

(declare-fun lt!42427 () Unit!2600)

(assert (=> d!23651 (= lt!42427 (choose!517 lt!42024 (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(declare-fun e!57728 () Bool)

(assert (=> d!23651 e!57728))

(declare-fun res!45386 () Bool)

(assert (=> d!23651 (=> (not res!45386) (not e!57728))))

(assert (=> d!23651 (= res!45386 (isStrictlySorted!299 lt!42024))))

(assert (=> d!23651 (= (lemmaContainsTupThenGetReturnValue!58 lt!42024 (_1!1113 lt!41735) (_2!1113 lt!41735)) lt!42427)))

(declare-fun b!88668 () Bool)

(declare-fun res!45387 () Bool)

(assert (=> b!88668 (=> (not res!45387) (not e!57728))))

(assert (=> b!88668 (= res!45387 (containsKey!145 lt!42024 (_1!1113 lt!41735)))))

(declare-fun b!88669 () Bool)

(assert (=> b!88669 (= e!57728 (contains!757 lt!42024 (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735))))))

(assert (= (and d!23651 res!45386) b!88668))

(assert (= (and b!88668 res!45387) b!88669))

(assert (=> d!23651 m!94057))

(declare-fun m!95075 () Bool)

(assert (=> d!23651 m!95075))

(declare-fun m!95077 () Bool)

(assert (=> d!23651 m!95077))

(declare-fun m!95079 () Bool)

(assert (=> b!88668 m!95079))

(declare-fun m!95081 () Bool)

(assert (=> b!88669 m!95081))

(assert (=> d!23381 d!23651))

(declare-fun c!14708 () Bool)

(declare-fun e!57733 () List!1522)

(declare-fun call!8550 () List!1522)

(declare-fun bm!8545 () Bool)

(assert (=> bm!8545 (= call!8550 ($colon$colon!73 e!57733 (ite c!14708 (h!2110 (toList!748 lt!41746)) (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735)))))))

(declare-fun c!14710 () Bool)

(assert (=> bm!8545 (= c!14710 c!14708)))

(declare-fun b!88670 () Bool)

(declare-fun c!14709 () Bool)

(assert (=> b!88670 (= c!14709 (and ((_ is Cons!1518) (toList!748 lt!41746)) (bvsgt (_1!1113 (h!2110 (toList!748 lt!41746))) (_1!1113 lt!41735))))))

(declare-fun e!57729 () List!1522)

(declare-fun e!57731 () List!1522)

(assert (=> b!88670 (= e!57729 e!57731)))

(declare-fun b!88671 () Bool)

(declare-fun e!57730 () List!1522)

(assert (=> b!88671 (= e!57730 e!57729)))

(declare-fun c!14707 () Bool)

(assert (=> b!88671 (= c!14707 (and ((_ is Cons!1518) (toList!748 lt!41746)) (= (_1!1113 (h!2110 (toList!748 lt!41746))) (_1!1113 lt!41735))))))

(declare-fun b!88672 () Bool)

(declare-fun call!8549 () List!1522)

(assert (=> b!88672 (= e!57731 call!8549)))

(declare-fun b!88673 () Bool)

(declare-fun res!45389 () Bool)

(declare-fun e!57732 () Bool)

(assert (=> b!88673 (=> (not res!45389) (not e!57732))))

(declare-fun lt!42428 () List!1522)

(assert (=> b!88673 (= res!45389 (containsKey!145 lt!42428 (_1!1113 lt!41735)))))

(declare-fun b!88674 () Bool)

(assert (=> b!88674 (= e!57731 call!8549)))

(declare-fun d!23653 () Bool)

(assert (=> d!23653 e!57732))

(declare-fun res!45388 () Bool)

(assert (=> d!23653 (=> (not res!45388) (not e!57732))))

(assert (=> d!23653 (= res!45388 (isStrictlySorted!299 lt!42428))))

(assert (=> d!23653 (= lt!42428 e!57730)))

(assert (=> d!23653 (= c!14708 (and ((_ is Cons!1518) (toList!748 lt!41746)) (bvslt (_1!1113 (h!2110 (toList!748 lt!41746))) (_1!1113 lt!41735))))))

(assert (=> d!23653 (isStrictlySorted!299 (toList!748 lt!41746))))

(assert (=> d!23653 (= (insertStrictlySorted!61 (toList!748 lt!41746) (_1!1113 lt!41735) (_2!1113 lt!41735)) lt!42428)))

(declare-fun b!88675 () Bool)

(declare-fun call!8548 () List!1522)

(assert (=> b!88675 (= e!57729 call!8548)))

(declare-fun b!88676 () Bool)

(assert (=> b!88676 (= e!57733 (insertStrictlySorted!61 (t!5264 (toList!748 lt!41746)) (_1!1113 lt!41735) (_2!1113 lt!41735)))))

(declare-fun bm!8546 () Bool)

(assert (=> bm!8546 (= call!8548 call!8550)))

(declare-fun b!88677 () Bool)

(assert (=> b!88677 (= e!57732 (contains!757 lt!42428 (tuple2!2205 (_1!1113 lt!41735) (_2!1113 lt!41735))))))

(declare-fun b!88678 () Bool)

(assert (=> b!88678 (= e!57733 (ite c!14707 (t!5264 (toList!748 lt!41746)) (ite c!14709 (Cons!1518 (h!2110 (toList!748 lt!41746)) (t!5264 (toList!748 lt!41746))) Nil!1519)))))

(declare-fun bm!8547 () Bool)

(assert (=> bm!8547 (= call!8549 call!8548)))

(declare-fun b!88679 () Bool)

(assert (=> b!88679 (= e!57730 call!8550)))

(assert (= (and d!23653 c!14708) b!88679))

(assert (= (and d!23653 (not c!14708)) b!88671))

(assert (= (and b!88671 c!14707) b!88675))

(assert (= (and b!88671 (not c!14707)) b!88670))

(assert (= (and b!88670 c!14709) b!88672))

(assert (= (and b!88670 (not c!14709)) b!88674))

(assert (= (or b!88672 b!88674) bm!8547))

(assert (= (or b!88675 bm!8547) bm!8546))

(assert (= (or b!88679 bm!8546) bm!8545))

(assert (= (and bm!8545 c!14710) b!88676))

(assert (= (and bm!8545 (not c!14710)) b!88678))

(assert (= (and d!23653 res!45388) b!88673))

(assert (= (and b!88673 res!45389) b!88677))

(declare-fun m!95083 () Bool)

(assert (=> b!88673 m!95083))

(declare-fun m!95085 () Bool)

(assert (=> bm!8545 m!95085))

(declare-fun m!95087 () Bool)

(assert (=> b!88676 m!95087))

(declare-fun m!95089 () Bool)

(assert (=> b!88677 m!95089))

(declare-fun m!95091 () Bool)

(assert (=> d!23653 m!95091))

(declare-fun m!95093 () Bool)

(assert (=> d!23653 m!95093))

(assert (=> d!23381 d!23653))

(declare-fun d!23655 () Bool)

(declare-fun e!57735 () Bool)

(assert (=> d!23655 e!57735))

(declare-fun res!45390 () Bool)

(assert (=> d!23655 (=> res!45390 e!57735)))

(declare-fun lt!42432 () Bool)

(assert (=> d!23655 (= res!45390 (not lt!42432))))

(declare-fun lt!42429 () Bool)

(assert (=> d!23655 (= lt!42432 lt!42429)))

(declare-fun lt!42430 () Unit!2600)

(declare-fun e!57734 () Unit!2600)

(assert (=> d!23655 (= lt!42430 e!57734)))

(declare-fun c!14711 () Bool)

(assert (=> d!23655 (= c!14711 lt!42429)))

(assert (=> d!23655 (= lt!42429 (containsKey!145 (toList!748 call!8440) (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874))))))

(assert (=> d!23655 (= (contains!756 call!8440 (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874))) lt!42432)))

(declare-fun b!88680 () Bool)

(declare-fun lt!42431 () Unit!2600)

(assert (=> b!88680 (= e!57734 lt!42431)))

(assert (=> b!88680 (= lt!42431 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!748 call!8440) (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874))))))

(assert (=> b!88680 (isDefined!94 (getValueByKey!141 (toList!748 call!8440) (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874))))))

(declare-fun b!88681 () Bool)

(declare-fun Unit!2631 () Unit!2600)

(assert (=> b!88681 (= e!57734 Unit!2631)))

(declare-fun b!88682 () Bool)

(assert (=> b!88682 (= e!57735 (isDefined!94 (getValueByKey!141 (toList!748 call!8440) (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874)))))))

(assert (= (and d!23655 c!14711) b!88680))

(assert (= (and d!23655 (not c!14711)) b!88681))

(assert (= (and d!23655 (not res!45390)) b!88682))

(assert (=> d!23655 m!93841))

(declare-fun m!95095 () Bool)

(assert (=> d!23655 m!95095))

(assert (=> b!88680 m!93841))

(declare-fun m!95097 () Bool)

(assert (=> b!88680 m!95097))

(assert (=> b!88680 m!93841))

(declare-fun m!95099 () Bool)

(assert (=> b!88680 m!95099))

(assert (=> b!88680 m!95099))

(declare-fun m!95101 () Bool)

(assert (=> b!88680 m!95101))

(assert (=> b!88682 m!93841))

(assert (=> b!88682 m!95099))

(assert (=> b!88682 m!95099))

(assert (=> b!88682 m!95101))

(assert (=> b!87960 d!23655))

(declare-fun d!23657 () Bool)

(declare-fun e!57738 () Bool)

(assert (=> d!23657 e!57738))

(declare-fun res!45393 () Bool)

(assert (=> d!23657 (=> (not res!45393) (not e!57738))))

(assert (=> d!23657 (= res!45393 (and (bvsge (index!3115 lt!41874) #b00000000000000000000000000000000) (bvslt (index!3115 lt!41874) (size!2170 (_keys!4035 newMap!16)))))))

(declare-fun lt!42435 () Unit!2600)

(declare-fun choose!524 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) Int) Unit!2600)

(assert (=> d!23657 (= lt!42435 (choose!524 (_keys!4035 newMap!16) lt!41886 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (defaultEntry!2359 newMap!16)))))

(assert (=> d!23657 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23657 (= (lemmaValidKeyInArrayIsInListMap!93 (_keys!4035 newMap!16) lt!41886 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (defaultEntry!2359 newMap!16)) lt!42435)))

(declare-fun b!88685 () Bool)

(assert (=> b!88685 (= e!57738 (contains!756 (getCurrentListMap!441 (_keys!4035 newMap!16) lt!41886 (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (select (arr!1925 (_keys!4035 newMap!16)) (index!3115 lt!41874))))))

(assert (= (and d!23657 res!45393) b!88685))

(declare-fun m!95103 () Bool)

(assert (=> d!23657 m!95103))

(assert (=> d!23657 m!94251))

(declare-fun m!95105 () Bool)

(assert (=> b!88685 m!95105))

(assert (=> b!88685 m!93841))

(assert (=> b!88685 m!95105))

(assert (=> b!88685 m!93841))

(declare-fun m!95107 () Bool)

(assert (=> b!88685 m!95107))

(assert (=> b!87960 d!23657))

(declare-fun d!23659 () Bool)

(declare-fun e!57741 () Bool)

(assert (=> d!23659 e!57741))

(declare-fun res!45396 () Bool)

(assert (=> d!23659 (=> (not res!45396) (not e!57741))))

(assert (=> d!23659 (= res!45396 (and (bvsge (index!3115 lt!41874) #b00000000000000000000000000000000) (bvslt (index!3115 lt!41874) (size!2171 (_values!2342 newMap!16)))))))

(declare-fun lt!42438 () Unit!2600)

(declare-fun choose!525 (array!4043 array!4045 (_ BitVec 32) (_ BitVec 32) V!3035 V!3035 (_ BitVec 32) (_ BitVec 64) V!3035 Int) Unit!2600)

(assert (=> d!23659 (= lt!42438 (choose!525 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (defaultEntry!2359 newMap!16)))))

(assert (=> d!23659 (validMask!0 (mask!6397 newMap!16))))

(assert (=> d!23659 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) (index!3115 lt!41874) (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734 (defaultEntry!2359 newMap!16)) lt!42438)))

(declare-fun b!88688 () Bool)

(assert (=> b!88688 (= e!57741 (= (+!112 (getCurrentListMap!441 (_keys!4035 newMap!16) (_values!2342 newMap!16) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16)) (tuple2!2205 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) from!355) lt!41734)) (getCurrentListMap!441 (_keys!4035 newMap!16) (array!4046 (store (arr!1926 (_values!2342 newMap!16)) (index!3115 lt!41874) (ValueCellFull!927 lt!41734)) (size!2171 (_values!2342 newMap!16))) (mask!6397 newMap!16) (extraKeys!2194 newMap!16) (zeroValue!2249 newMap!16) (minValue!2249 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2359 newMap!16))))))

(assert (= (and d!23659 res!45396) b!88688))

(assert (=> d!23659 m!93699))

(declare-fun m!95109 () Bool)

(assert (=> d!23659 m!95109))

(assert (=> d!23659 m!94251))

(assert (=> b!88688 m!93865))

(assert (=> b!88688 m!93865))

(assert (=> b!88688 m!94145))

(assert (=> b!88688 m!93837))

(declare-fun m!95111 () Bool)

(assert (=> b!88688 m!95111))

(assert (=> b!87960 d!23659))

(assert (=> b!88132 d!23571))

(declare-fun b!88697 () Bool)

(declare-fun res!45406 () Bool)

(declare-fun e!57744 () Bool)

(assert (=> b!88697 (=> (not res!45406) (not e!57744))))

(assert (=> b!88697 (= res!45406 (and (= (size!2171 (_values!2342 newMap!16)) (bvadd (mask!6397 newMap!16) #b00000000000000000000000000000001)) (= (size!2170 (_keys!4035 newMap!16)) (size!2171 (_values!2342 newMap!16))) (bvsge (_size!430 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!430 newMap!16) (bvadd (mask!6397 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!88698 () Bool)

(declare-fun res!45405 () Bool)

(assert (=> b!88698 (=> (not res!45405) (not e!57744))))

(declare-fun size!2174 (LongMapFixedSize!762) (_ BitVec 32))

(assert (=> b!88698 (= res!45405 (bvsge (size!2174 newMap!16) (_size!430 newMap!16)))))

(declare-fun b!88699 () Bool)

(declare-fun res!45407 () Bool)

(assert (=> b!88699 (=> (not res!45407) (not e!57744))))

(assert (=> b!88699 (= res!45407 (= (size!2174 newMap!16) (bvadd (_size!430 newMap!16) (bvsdiv (bvadd (extraKeys!2194 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!23661 () Bool)

(declare-fun res!45408 () Bool)

(assert (=> d!23661 (=> (not res!45408) (not e!57744))))

(assert (=> d!23661 (= res!45408 (validMask!0 (mask!6397 newMap!16)))))

(assert (=> d!23661 (= (simpleValid!59 newMap!16) e!57744)))

(declare-fun b!88700 () Bool)

(assert (=> b!88700 (= e!57744 (and (bvsge (extraKeys!2194 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2194 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!430 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!23661 res!45408) b!88697))

(assert (= (and b!88697 res!45406) b!88698))

(assert (= (and b!88698 res!45405) b!88699))

(assert (= (and b!88699 res!45407) b!88700))

(declare-fun m!95113 () Bool)

(assert (=> b!88698 m!95113))

(assert (=> b!88699 m!95113))

(assert (=> d!23661 m!94251))

(assert (=> d!23389 d!23661))

(declare-fun d!23663 () Bool)

(assert (=> d!23663 (= (validKeyInArray!0 (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1925 (_keys!4035 (v!2661 (underlying!292 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87971 d!23663))

(declare-fun condMapEmpty!3437 () Bool)

(declare-fun mapDefault!3437 () ValueCell!927)

(assert (=> mapNonEmpty!3435 (= condMapEmpty!3437 (= mapRest!3435 ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3437)))))

(declare-fun e!57746 () Bool)

(declare-fun mapRes!3437 () Bool)

(assert (=> mapNonEmpty!3435 (= tp!8997 (and e!57746 mapRes!3437))))

(declare-fun b!88702 () Bool)

(assert (=> b!88702 (= e!57746 tp_is_empty!2541)))

(declare-fun b!88701 () Bool)

(declare-fun e!57745 () Bool)

(assert (=> b!88701 (= e!57745 tp_is_empty!2541)))

(declare-fun mapIsEmpty!3437 () Bool)

(assert (=> mapIsEmpty!3437 mapRes!3437))

(declare-fun mapNonEmpty!3437 () Bool)

(declare-fun tp!8999 () Bool)

(assert (=> mapNonEmpty!3437 (= mapRes!3437 (and tp!8999 e!57745))))

(declare-fun mapValue!3437 () ValueCell!927)

(declare-fun mapRest!3437 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapKey!3437 () (_ BitVec 32))

(assert (=> mapNonEmpty!3437 (= mapRest!3435 (store mapRest!3437 mapKey!3437 mapValue!3437))))

(assert (= (and mapNonEmpty!3435 condMapEmpty!3437) mapIsEmpty!3437))

(assert (= (and mapNonEmpty!3435 (not condMapEmpty!3437)) mapNonEmpty!3437))

(assert (= (and mapNonEmpty!3437 ((_ is ValueCellFull!927) mapValue!3437)) b!88701))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!927) mapDefault!3437)) b!88702))

(declare-fun m!95115 () Bool)

(assert (=> mapNonEmpty!3437 m!95115))

(declare-fun condMapEmpty!3438 () Bool)

(declare-fun mapDefault!3438 () ValueCell!927)

(assert (=> mapNonEmpty!3436 (= condMapEmpty!3438 (= mapRest!3436 ((as const (Array (_ BitVec 32) ValueCell!927)) mapDefault!3438)))))

(declare-fun e!57748 () Bool)

(declare-fun mapRes!3438 () Bool)

(assert (=> mapNonEmpty!3436 (= tp!8998 (and e!57748 mapRes!3438))))

(declare-fun b!88704 () Bool)

(assert (=> b!88704 (= e!57748 tp_is_empty!2541)))

(declare-fun b!88703 () Bool)

(declare-fun e!57747 () Bool)

(assert (=> b!88703 (= e!57747 tp_is_empty!2541)))

(declare-fun mapIsEmpty!3438 () Bool)

(assert (=> mapIsEmpty!3438 mapRes!3438))

(declare-fun mapNonEmpty!3438 () Bool)

(declare-fun tp!9000 () Bool)

(assert (=> mapNonEmpty!3438 (= mapRes!3438 (and tp!9000 e!57747))))

(declare-fun mapValue!3438 () ValueCell!927)

(declare-fun mapRest!3438 () (Array (_ BitVec 32) ValueCell!927))

(declare-fun mapKey!3438 () (_ BitVec 32))

(assert (=> mapNonEmpty!3438 (= mapRest!3436 (store mapRest!3438 mapKey!3438 mapValue!3438))))

(assert (= (and mapNonEmpty!3436 condMapEmpty!3438) mapIsEmpty!3438))

(assert (= (and mapNonEmpty!3436 (not condMapEmpty!3438)) mapNonEmpty!3438))

(assert (= (and mapNonEmpty!3438 ((_ is ValueCellFull!927) mapValue!3438)) b!88703))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!927) mapDefault!3438)) b!88704))

(declare-fun m!95117 () Bool)

(assert (=> mapNonEmpty!3438 m!95117))

(declare-fun b_lambda!3923 () Bool)

(assert (= b_lambda!3915 (or (and b!87755 b_free!2249 (= (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) (defaultEntry!2359 newMap!16))) (and b!87751 b_free!2251) b_lambda!3923)))

(declare-fun b_lambda!3925 () Bool)

(assert (= b_lambda!3919 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3925)))

(declare-fun b_lambda!3927 () Bool)

(assert (= b_lambda!3913 (or (and b!87755 b_free!2249 (= (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) (defaultEntry!2359 newMap!16))) (and b!87751 b_free!2251) b_lambda!3927)))

(declare-fun b_lambda!3929 () Bool)

(assert (= b_lambda!3917 (or (and b!87755 b_free!2249) (and b!87751 b_free!2251 (= (defaultEntry!2359 newMap!16) (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))))) b_lambda!3929)))

(declare-fun b_lambda!3931 () Bool)

(assert (= b_lambda!3921 (or (and b!87755 b_free!2249 (= (defaultEntry!2359 (v!2661 (underlying!292 thiss!992))) (defaultEntry!2359 newMap!16))) (and b!87751 b_free!2251) b_lambda!3931)))

(check-sat (not d!23487) (not d!23505) (not d!23583) (not b!88361) (not d!23409) (not b!88676) (not b!88420) (not bm!8532) (not b!88270) (not d!23465) (not b!88415) (not b!88661) (not b!88432) (not b!88263) (not b!88511) (not b!88528) (not d!23529) (not b!88626) (not d!23609) (not d!23603) (not bm!8514) (not d!23543) (not d!23473) (not b_next!2249) (not b!88220) (not b!88663) (not b_lambda!3931) (not b!88212) (not b_lambda!3923) (not b!88265) (not b!88222) (not d!23455) (not bm!8535) (not d!23601) (not b!88292) (not b!88403) (not b!88613) (not b!88653) (not d!23443) (not b!88601) (not b!88588) (not d!23595) (not b!88485) (not d!23421) (not b!88551) (not b!88495) (not b!88537) (not bm!8488) (not b!88523) (not bm!8524) (not b!88510) (not bm!8483) (not b!88519) (not d!23423) (not b!88669) (not bm!8507) (not b!88682) (not d!23657) (not b!88668) (not b!88262) (not b!88555) (not b!88587) (not b!88532) (not d!23555) (not b!88240) (not b!88185) (not d!23561) (not b!88459) (not b_lambda!3909) (not d!23629) (not b!88381) (not d!23581) (not d!23605) (not b!88395) (not b!88589) (not b!88554) (not b!88386) (not b!88685) (not b!88409) (not b!88677) (not bm!8545) (not b!88547) (not bm!8509) b_and!5331 (not d!23451) (not b!88408) (not d!23477) (not b!88673) (not d!23551) (not b!88214) (not b!88264) (not d!23469) (not b!88573) (not b!88275) (not d!23457) (not d!23471) (not b_lambda!3907) (not b!88502) (not d!23493) (not b!88227) (not b!88521) (not b!88605) (not d!23501) (not b!88204) (not b!88608) (not d!23611) (not d!23511) (not b!88595) (not d!23435) (not b!88379) (not b!88497) (not d!23659) (not d!23499) (not bm!8499) (not b!88597) (not b!88594) (not d!23661) (not d!23491) (not b!88336) (not b!88433) (not b!88660) (not b!88471) (not bm!8543) (not b!88148) (not b!88467) (not d!23533) (not b!88565) (not d!23449) (not bm!8518) (not b!88514) (not b!88620) (not b!88666) (not d!23509) (not d!23637) (not d!23655) (not d!23539) (not d!23567) (not d!23563) (not bm!8511) (not b!88404) (not b!88208) (not d!23437) (not b!88486) (not d!23651) (not d!23429) (not b!88481) (not d!23521) (not d!23485) (not b!88585) (not b!88468) (not mapNonEmpty!3438) (not b!88610) (not d!23593) (not b!88398) (not b!88598) (not b!88581) (not b!88255) (not b!88349) (not b!88189) (not b!88377) (not d!23497) (not b!88472) (not d!23483) (not b!88267) (not b!88474) (not b!88205) (not b!88570) (not b!88688) (not bm!8484) (not d!23545) (not b!88333) (not d!23411) (not b!88436) (not d!23419) (not d!23537) (not d!23639) (not b!88341) (not b!88413) (not d!23565) (not bm!8542) (not b!88216) (not bm!8534) (not d!23557) (not d!23489) (not b!88372) (not b!88447) (not b!88210) (not b!88229) (not b!88321) (not b_lambda!3929) (not d!23585) (not b!88487) (not mapNonEmpty!3437) (not b!88491) (not b!88211) (not b!88488) (not b!88399) (not b!88454) (not b!88516) (not d!23535) (not b!88272) (not b!88503) (not b!88206) (not b!88194) (not d!23445) (not b!88563) (not b!88525) (not d!23525) (not b!88193) (not b!88371) (not b!88329) (not d!23513) (not d!23549) (not bm!8487) (not b_lambda!3911) (not bm!8544) (not b!88401) (not d!23495) (not b!88603) (not d!23617) (not d!23415) (not b!88266) (not b!88396) (not b!88699) (not b!88286) (not b!88657) (not b!88350) (not d!23577) (not bm!8521) (not b!88443) (not b!88332) (not b!88346) (not b!88440) (not b!88425) (not bm!8490) (not b!88339) (not b!88373) (not bm!8530) (not d!23431) (not bm!8485) (not d!23425) (not d!23599) (not b!88600) (not d!23407) (not b!88439) (not d!23447) (not b!88656) (not b!88482) (not d!23619) (not b!88476) (not b!88342) (not b!88376) (not d!23653) (not b!88218) (not bm!8489) (not b!88334) (not bm!8502) (not d!23531) (not b!88269) (not d!23453) (not b_lambda!3925) (not b!88698) (not d!23517) (not b!88393) (not b!88260) tp_is_empty!2541 (not bm!8508) (not b_next!2251) (not b!88239) (not b!88494) (not b!88484) (not b!88331) (not d!23569) (not b!88500) (not b_lambda!3899) (not b!88479) (not b!88317) (not b!88450) (not bm!8512) (not b!88680) (not b!88197) (not bm!8517) (not b!88592) (not b!88411) (not b!88417) (not b!88460) (not b!88374) b_and!5333 (not d!23439) (not b!88391) (not d!23553) (not b!88457) (not d!23463) (not b!88375) (not b!88473) (not b!88384) (not b!88566) (not b!88530) (not d!23433) (not b!88378) (not b!88406) (not b!88558) (not b!88422) (not b!88524) (not b!88232) (not b!88241) (not d!23631) (not b!88209) (not b_lambda!3927) (not b!88464) (not d!23635) (not bm!8513) (not b!88574) (not b!88412) (not b!88452) (not d!23507) (not bm!8527) (not b!88541) (not b!88437) (not d!23459) (not b!88560) (not b!88539) (not b!88483) (not b!88224) (not d!23647) (not b!88507) (not d!23625) (not b!88320) (not b!88293) (not d!23427) (not b!88434) (not d!23503) (not b!88219) (not d!23519) (not b!88544) (not d!23613) (not d!23417) (not b!88438) (not bm!8533) (not b!88546) (not b!88268) (not b!88196) (not b!88273) (not d!23479))
(check-sat b_and!5331 b_and!5333 (not b_next!2249) (not b_next!2251))
