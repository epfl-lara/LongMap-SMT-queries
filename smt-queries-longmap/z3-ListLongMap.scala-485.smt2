; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10510 () Bool)

(assert start!10510)

(declare-fun b!82684 () Bool)

(declare-fun b_free!2213 () Bool)

(declare-fun b_next!2213 () Bool)

(assert (=> b!82684 (= b_free!2213 (not b_next!2213))))

(declare-fun tp!8855 () Bool)

(declare-fun b_and!5023 () Bool)

(assert (=> b!82684 (= tp!8855 b_and!5023)))

(declare-fun b!82693 () Bool)

(declare-fun b_free!2215 () Bool)

(declare-fun b_next!2215 () Bool)

(assert (=> b!82693 (= b_free!2215 (not b_next!2215))))

(declare-fun tp!8857 () Bool)

(declare-fun b_and!5025 () Bool)

(assert (=> b!82693 (= tp!8857 b_and!5025)))

(declare-fun b!82681 () Bool)

(declare-fun e!53964 () Bool)

(declare-fun e!53952 () Bool)

(assert (=> b!82681 (= e!53964 e!53952)))

(declare-fun b!82682 () Bool)

(declare-fun e!53953 () Bool)

(declare-fun e!53960 () Bool)

(assert (=> b!82682 (= e!53953 e!53960)))

(declare-fun res!42864 () Bool)

(assert (=> b!82682 (=> (not res!42864) (not e!53960))))

(declare-datatypes ((V!3011 0))(
  ( (V!3012 (val!1306 Int)) )
))
(declare-datatypes ((array!4003 0))(
  ( (array!4004 (arr!1907 (Array (_ BitVec 32) (_ BitVec 64))) (size!2150 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!918 0))(
  ( (ValueCellFull!918 (v!2623 V!3011)) (EmptyCell!918) )
))
(declare-datatypes ((array!4005 0))(
  ( (array!4006 (arr!1908 (Array (_ BitVec 32) ValueCell!918)) (size!2151 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!744 0))(
  ( (LongMapFixedSize!745 (defaultEntry!2314 Int) (mask!6330 (_ BitVec 32)) (extraKeys!2157 (_ BitVec 32)) (zeroValue!2208 V!3011) (minValue!2208 V!3011) (_size!421 (_ BitVec 32)) (_keys!3982 array!4003) (_values!2297 array!4005) (_vacant!421 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2182 0))(
  ( (tuple2!2183 (_1!1102 Bool) (_2!1102 LongMapFixedSize!744)) )
))
(declare-fun lt!38696 () tuple2!2182)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!82682 (= res!42864 (and (_1!1102 lt!38696) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2423 0))(
  ( (Unit!2424) )
))
(declare-fun lt!38704 () Unit!2423)

(declare-fun e!53955 () Unit!2423)

(assert (=> b!82682 (= lt!38704 e!53955)))

(declare-datatypes ((tuple2!2184 0))(
  ( (tuple2!2185 (_1!1103 (_ BitVec 64)) (_2!1103 V!3011)) )
))
(declare-datatypes ((List!1513 0))(
  ( (Nil!1510) (Cons!1509 (h!2099 tuple2!2184) (t!5201 List!1513)) )
))
(declare-datatypes ((ListLongMap!1453 0))(
  ( (ListLongMap!1454 (toList!742 List!1513)) )
))
(declare-fun lt!38693 () ListLongMap!1453)

(declare-fun c!13173 () Bool)

(declare-datatypes ((Cell!546 0))(
  ( (Cell!547 (v!2624 LongMapFixedSize!744)) )
))
(declare-datatypes ((LongMap!546 0))(
  ( (LongMap!547 (underlying!284 Cell!546)) )
))
(declare-fun thiss!992 () LongMap!546)

(declare-fun contains!748 (ListLongMap!1453 (_ BitVec 64)) Bool)

(assert (=> b!82682 (= c!13173 (contains!748 lt!38693 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!744)

(declare-fun lt!38691 () V!3011)

(declare-fun update!109 (LongMapFixedSize!744 (_ BitVec 64) V!3011) tuple2!2182)

(assert (=> b!82682 (= lt!38696 (update!109 newMap!16 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) lt!38691))))

(declare-fun b!82683 () Bool)

(declare-fun e!53948 () Bool)

(declare-fun tp_is_empty!2523 () Bool)

(assert (=> b!82683 (= e!53948 tp_is_empty!2523)))

(declare-fun mapNonEmpty!3355 () Bool)

(declare-fun mapRes!3356 () Bool)

(declare-fun tp!8858 () Bool)

(assert (=> mapNonEmpty!3355 (= mapRes!3356 (and tp!8858 e!53948))))

(declare-fun mapValue!3355 () ValueCell!918)

(declare-fun mapRest!3355 () (Array (_ BitVec 32) ValueCell!918))

(declare-fun mapKey!3355 () (_ BitVec 32))

(assert (=> mapNonEmpty!3355 (= (arr!1908 (_values!2297 (v!2624 (underlying!284 thiss!992)))) (store mapRest!3355 mapKey!3355 mapValue!3355))))

(declare-fun e!53954 () Bool)

(declare-fun array_inv!1179 (array!4003) Bool)

(declare-fun array_inv!1180 (array!4005) Bool)

(assert (=> b!82684 (= e!53952 (and tp!8855 tp_is_empty!2523 (array_inv!1179 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) (array_inv!1180 (_values!2297 (v!2624 (underlying!284 thiss!992)))) e!53954))))

(declare-fun b!82685 () Bool)

(declare-fun Unit!2425 () Unit!2423)

(assert (=> b!82685 (= e!53955 Unit!2425)))

(declare-fun lt!38688 () Unit!2423)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!65 (array!4003 array!4005 (_ BitVec 32) (_ BitVec 32) V!3011 V!3011 (_ BitVec 64) (_ BitVec 32) Int) Unit!2423)

(assert (=> b!82685 (= lt!38688 (lemmaListMapContainsThenArrayContainsFrom!65 (_keys!3982 (v!2624 (underlying!284 thiss!992))) (_values!2297 (v!2624 (underlying!284 thiss!992))) (mask!6330 (v!2624 (underlying!284 thiss!992))) (extraKeys!2157 (v!2624 (underlying!284 thiss!992))) (zeroValue!2208 (v!2624 (underlying!284 thiss!992))) (minValue!2208 (v!2624 (underlying!284 thiss!992))) (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2314 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!82685 (arrayContainsKey!0 (_keys!3982 (v!2624 (underlying!284 thiss!992))) (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!38703 () Unit!2423)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4003 (_ BitVec 32) (_ BitVec 32)) Unit!2423)

(assert (=> b!82685 (= lt!38703 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3982 (v!2624 (underlying!284 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1514 0))(
  ( (Nil!1511) (Cons!1510 (h!2100 (_ BitVec 64)) (t!5202 List!1514)) )
))
(declare-fun arrayNoDuplicates!0 (array!4003 (_ BitVec 32) List!1514) Bool)

(assert (=> b!82685 (arrayNoDuplicates!0 (_keys!3982 (v!2624 (underlying!284 thiss!992))) from!355 Nil!1511)))

(declare-fun lt!38689 () Unit!2423)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4003 (_ BitVec 32) (_ BitVec 64) List!1514) Unit!2423)

(assert (=> b!82685 (= lt!38689 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3982 (v!2624 (underlying!284 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) (Cons!1510 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) Nil!1511)))))

(assert (=> b!82685 false))

(declare-fun b!82686 () Bool)

(declare-fun e!53958 () Bool)

(assert (=> b!82686 (= e!53960 (not e!53958))))

(declare-fun res!42859 () Bool)

(assert (=> b!82686 (=> res!42859 e!53958)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!82686 (= res!42859 (not (validMask!0 (mask!6330 (v!2624 (underlying!284 thiss!992))))))))

(declare-fun lt!38701 () tuple2!2184)

(declare-fun lt!38698 () tuple2!2184)

(declare-fun lt!38702 () ListLongMap!1453)

(declare-fun lt!38697 () ListLongMap!1453)

(declare-fun +!107 (ListLongMap!1453 tuple2!2184) ListLongMap!1453)

(assert (=> b!82686 (= (+!107 lt!38702 lt!38701) (+!107 (+!107 lt!38697 lt!38701) lt!38698))))

(assert (=> b!82686 (= lt!38701 (tuple2!2185 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2208 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun lt!38695 () Unit!2423)

(declare-fun addCommutativeForDiffKeys!26 (ListLongMap!1453 (_ BitVec 64) V!3011 (_ BitVec 64) V!3011) Unit!2423)

(assert (=> b!82686 (= lt!38695 (addCommutativeForDiffKeys!26 lt!38697 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) lt!38691 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2208 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun lt!38700 () ListLongMap!1453)

(assert (=> b!82686 (= lt!38700 lt!38702)))

(assert (=> b!82686 (= lt!38702 (+!107 lt!38697 lt!38698))))

(declare-fun lt!38694 () ListLongMap!1453)

(declare-fun lt!38690 () tuple2!2184)

(assert (=> b!82686 (= lt!38700 (+!107 lt!38694 lt!38690))))

(declare-fun lt!38699 () ListLongMap!1453)

(assert (=> b!82686 (= lt!38697 (+!107 lt!38699 lt!38690))))

(assert (=> b!82686 (= lt!38690 (tuple2!2185 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2208 (v!2624 (underlying!284 thiss!992)))))))

(assert (=> b!82686 (= lt!38694 (+!107 lt!38699 lt!38698))))

(assert (=> b!82686 (= lt!38698 (tuple2!2185 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) lt!38691))))

(declare-fun lt!38692 () Unit!2423)

(assert (=> b!82686 (= lt!38692 (addCommutativeForDiffKeys!26 lt!38699 (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) lt!38691 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2208 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!72 (array!4003 array!4005 (_ BitVec 32) (_ BitVec 32) V!3011 V!3011 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!82686 (= lt!38699 (getCurrentListMapNoExtraKeys!72 (_keys!3982 (v!2624 (underlying!284 thiss!992))) (_values!2297 (v!2624 (underlying!284 thiss!992))) (mask!6330 (v!2624 (underlying!284 thiss!992))) (extraKeys!2157 (v!2624 (underlying!284 thiss!992))) (zeroValue!2208 (v!2624 (underlying!284 thiss!992))) (minValue!2208 (v!2624 (underlying!284 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2314 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun mapIsEmpty!3355 () Bool)

(declare-fun mapRes!3355 () Bool)

(assert (=> mapIsEmpty!3355 mapRes!3355))

(declare-fun b!82687 () Bool)

(declare-fun res!42865 () Bool)

(declare-fun e!53961 () Bool)

(assert (=> b!82687 (=> (not res!42865) (not e!53961))))

(assert (=> b!82687 (= res!42865 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2150 (_keys!3982 (v!2624 (underlying!284 thiss!992)))))))))

(declare-fun b!82689 () Bool)

(declare-fun e!53959 () Bool)

(assert (=> b!82689 (= e!53959 e!53964)))

(declare-fun b!82690 () Bool)

(declare-fun e!53963 () Bool)

(assert (=> b!82690 (= e!53963 tp_is_empty!2523)))

(declare-fun b!82691 () Bool)

(declare-fun e!53950 () Bool)

(assert (=> b!82691 (= e!53950 tp_is_empty!2523)))

(declare-fun b!82692 () Bool)

(declare-fun e!53957 () Bool)

(assert (=> b!82692 (= e!53961 e!53957)))

(declare-fun res!42858 () Bool)

(assert (=> b!82692 (=> (not res!42858) (not e!53957))))

(declare-fun lt!38687 () ListLongMap!1453)

(assert (=> b!82692 (= res!42858 (= lt!38687 lt!38693))))

(declare-fun map!1181 (LongMapFixedSize!744) ListLongMap!1453)

(assert (=> b!82692 (= lt!38693 (map!1181 newMap!16))))

(declare-fun getCurrentListMap!436 (array!4003 array!4005 (_ BitVec 32) (_ BitVec 32) V!3011 V!3011 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!82692 (= lt!38687 (getCurrentListMap!436 (_keys!3982 (v!2624 (underlying!284 thiss!992))) (_values!2297 (v!2624 (underlying!284 thiss!992))) (mask!6330 (v!2624 (underlying!284 thiss!992))) (extraKeys!2157 (v!2624 (underlying!284 thiss!992))) (zeroValue!2208 (v!2624 (underlying!284 thiss!992))) (minValue!2208 (v!2624 (underlying!284 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2314 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun e!53949 () Bool)

(declare-fun e!53965 () Bool)

(assert (=> b!82693 (= e!53965 (and tp!8857 tp_is_empty!2523 (array_inv!1179 (_keys!3982 newMap!16)) (array_inv!1180 (_values!2297 newMap!16)) e!53949))))

(declare-fun mapNonEmpty!3356 () Bool)

(declare-fun tp!8856 () Bool)

(assert (=> mapNonEmpty!3356 (= mapRes!3355 (and tp!8856 e!53963))))

(declare-fun mapValue!3356 () ValueCell!918)

(declare-fun mapRest!3356 () (Array (_ BitVec 32) ValueCell!918))

(declare-fun mapKey!3356 () (_ BitVec 32))

(assert (=> mapNonEmpty!3356 (= (arr!1908 (_values!2297 newMap!16)) (store mapRest!3356 mapKey!3356 mapValue!3356))))

(declare-fun b!82694 () Bool)

(declare-fun Unit!2426 () Unit!2423)

(assert (=> b!82694 (= e!53955 Unit!2426)))

(declare-fun b!82695 () Bool)

(declare-fun e!53962 () Bool)

(assert (=> b!82695 (= e!53949 (and e!53962 mapRes!3355))))

(declare-fun condMapEmpty!3355 () Bool)

(declare-fun mapDefault!3355 () ValueCell!918)

(assert (=> b!82695 (= condMapEmpty!3355 (= (arr!1908 (_values!2297 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!918)) mapDefault!3355)))))

(declare-fun b!82696 () Bool)

(assert (=> b!82696 (= e!53958 (or (not (= (size!2151 (_values!2297 (v!2624 (underlying!284 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6330 (v!2624 (underlying!284 thiss!992)))))) (not (= (size!2150 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) (size!2151 (_values!2297 (v!2624 (underlying!284 thiss!992)))))) (bvsge (mask!6330 (v!2624 (underlying!284 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!82697 () Bool)

(assert (=> b!82697 (= e!53957 e!53953)))

(declare-fun res!42863 () Bool)

(assert (=> b!82697 (=> (not res!42863) (not e!53953))))

(assert (=> b!82697 (= res!42863 (and (not (= (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1907 (_keys!3982 (v!2624 (underlying!284 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1185 (ValueCell!918 V!3011) V!3011)

(declare-fun dynLambda!338 (Int (_ BitVec 64)) V!3011)

(assert (=> b!82697 (= lt!38691 (get!1185 (select (arr!1908 (_values!2297 (v!2624 (underlying!284 thiss!992)))) from!355) (dynLambda!338 (defaultEntry!2314 (v!2624 (underlying!284 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!82698 () Bool)

(declare-fun res!42860 () Bool)

(assert (=> b!82698 (=> (not res!42860) (not e!53961))))

(declare-fun valid!319 (LongMapFixedSize!744) Bool)

(assert (=> b!82698 (= res!42860 (valid!319 newMap!16))))

(declare-fun b!82699 () Bool)

(declare-fun res!42862 () Bool)

(assert (=> b!82699 (=> (not res!42862) (not e!53961))))

(assert (=> b!82699 (= res!42862 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6330 newMap!16)) (_size!421 (v!2624 (underlying!284 thiss!992)))))))

(declare-fun res!42861 () Bool)

(assert (=> start!10510 (=> (not res!42861) (not e!53961))))

(declare-fun valid!320 (LongMap!546) Bool)

(assert (=> start!10510 (= res!42861 (valid!320 thiss!992))))

(assert (=> start!10510 e!53961))

(assert (=> start!10510 e!53959))

(assert (=> start!10510 true))

(assert (=> start!10510 e!53965))

(declare-fun b!82688 () Bool)

(assert (=> b!82688 (= e!53954 (and e!53950 mapRes!3356))))

(declare-fun condMapEmpty!3356 () Bool)

(declare-fun mapDefault!3356 () ValueCell!918)

(assert (=> b!82688 (= condMapEmpty!3356 (= (arr!1908 (_values!2297 (v!2624 (underlying!284 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!918)) mapDefault!3356)))))

(declare-fun b!82700 () Bool)

(assert (=> b!82700 (= e!53962 tp_is_empty!2523)))

(declare-fun mapIsEmpty!3356 () Bool)

(assert (=> mapIsEmpty!3356 mapRes!3356))

(assert (= (and start!10510 res!42861) b!82687))

(assert (= (and b!82687 res!42865) b!82698))

(assert (= (and b!82698 res!42860) b!82699))

(assert (= (and b!82699 res!42862) b!82692))

(assert (= (and b!82692 res!42858) b!82697))

(assert (= (and b!82697 res!42863) b!82682))

(assert (= (and b!82682 c!13173) b!82685))

(assert (= (and b!82682 (not c!13173)) b!82694))

(assert (= (and b!82682 res!42864) b!82686))

(assert (= (and b!82686 (not res!42859)) b!82696))

(assert (= (and b!82688 condMapEmpty!3356) mapIsEmpty!3356))

(assert (= (and b!82688 (not condMapEmpty!3356)) mapNonEmpty!3355))

(get-info :version)

(assert (= (and mapNonEmpty!3355 ((_ is ValueCellFull!918) mapValue!3355)) b!82683))

(assert (= (and b!82688 ((_ is ValueCellFull!918) mapDefault!3356)) b!82691))

(assert (= b!82684 b!82688))

(assert (= b!82681 b!82684))

(assert (= b!82689 b!82681))

(assert (= start!10510 b!82689))

(assert (= (and b!82695 condMapEmpty!3355) mapIsEmpty!3355))

(assert (= (and b!82695 (not condMapEmpty!3355)) mapNonEmpty!3356))

(assert (= (and mapNonEmpty!3356 ((_ is ValueCellFull!918) mapValue!3356)) b!82690))

(assert (= (and b!82695 ((_ is ValueCellFull!918) mapDefault!3355)) b!82700))

(assert (= b!82693 b!82695))

(assert (= start!10510 b!82693))

(declare-fun b_lambda!3685 () Bool)

(assert (=> (not b_lambda!3685) (not b!82697)))

(declare-fun t!5198 () Bool)

(declare-fun tb!1657 () Bool)

(assert (=> (and b!82684 (= (defaultEntry!2314 (v!2624 (underlying!284 thiss!992))) (defaultEntry!2314 (v!2624 (underlying!284 thiss!992)))) t!5198) tb!1657))

(declare-fun result!2867 () Bool)

(assert (=> tb!1657 (= result!2867 tp_is_empty!2523)))

(assert (=> b!82697 t!5198))

(declare-fun b_and!5027 () Bool)

(assert (= b_and!5023 (and (=> t!5198 result!2867) b_and!5027)))

(declare-fun tb!1659 () Bool)

(declare-fun t!5200 () Bool)

(assert (=> (and b!82693 (= (defaultEntry!2314 newMap!16) (defaultEntry!2314 (v!2624 (underlying!284 thiss!992)))) t!5200) tb!1659))

(declare-fun result!2871 () Bool)

(assert (= result!2871 result!2867))

(assert (=> b!82697 t!5200))

(declare-fun b_and!5029 () Bool)

(assert (= b_and!5025 (and (=> t!5200 result!2871) b_and!5029)))

(declare-fun m!85653 () Bool)

(assert (=> b!82698 m!85653))

(declare-fun m!85655 () Bool)

(assert (=> mapNonEmpty!3355 m!85655))

(declare-fun m!85657 () Bool)

(assert (=> b!82686 m!85657))

(declare-fun m!85659 () Bool)

(assert (=> b!82686 m!85659))

(declare-fun m!85661 () Bool)

(assert (=> b!82686 m!85661))

(declare-fun m!85663 () Bool)

(assert (=> b!82686 m!85663))

(declare-fun m!85665 () Bool)

(assert (=> b!82686 m!85665))

(declare-fun m!85667 () Bool)

(assert (=> b!82686 m!85667))

(assert (=> b!82686 m!85661))

(declare-fun m!85669 () Bool)

(assert (=> b!82686 m!85669))

(declare-fun m!85671 () Bool)

(assert (=> b!82686 m!85671))

(declare-fun m!85673 () Bool)

(assert (=> b!82686 m!85673))

(assert (=> b!82686 m!85663))

(declare-fun m!85675 () Bool)

(assert (=> b!82686 m!85675))

(assert (=> b!82686 m!85663))

(declare-fun m!85677 () Bool)

(assert (=> b!82686 m!85677))

(declare-fun m!85679 () Bool)

(assert (=> b!82686 m!85679))

(declare-fun m!85681 () Bool)

(assert (=> b!82693 m!85681))

(declare-fun m!85683 () Bool)

(assert (=> b!82693 m!85683))

(declare-fun m!85685 () Bool)

(assert (=> mapNonEmpty!3356 m!85685))

(declare-fun m!85687 () Bool)

(assert (=> b!82685 m!85687))

(declare-fun m!85689 () Bool)

(assert (=> b!82685 m!85689))

(assert (=> b!82685 m!85663))

(declare-fun m!85691 () Bool)

(assert (=> b!82685 m!85691))

(assert (=> b!82685 m!85663))

(assert (=> b!82685 m!85663))

(declare-fun m!85693 () Bool)

(assert (=> b!82685 m!85693))

(assert (=> b!82685 m!85663))

(declare-fun m!85695 () Bool)

(assert (=> b!82685 m!85695))

(assert (=> b!82682 m!85663))

(assert (=> b!82682 m!85663))

(declare-fun m!85697 () Bool)

(assert (=> b!82682 m!85697))

(assert (=> b!82682 m!85663))

(declare-fun m!85699 () Bool)

(assert (=> b!82682 m!85699))

(assert (=> b!82697 m!85663))

(declare-fun m!85701 () Bool)

(assert (=> b!82697 m!85701))

(declare-fun m!85703 () Bool)

(assert (=> b!82697 m!85703))

(assert (=> b!82697 m!85701))

(assert (=> b!82697 m!85703))

(declare-fun m!85705 () Bool)

(assert (=> b!82697 m!85705))

(declare-fun m!85707 () Bool)

(assert (=> b!82684 m!85707))

(declare-fun m!85709 () Bool)

(assert (=> b!82684 m!85709))

(declare-fun m!85711 () Bool)

(assert (=> b!82692 m!85711))

(declare-fun m!85713 () Bool)

(assert (=> b!82692 m!85713))

(declare-fun m!85715 () Bool)

(assert (=> start!10510 m!85715))

(check-sat (not b!82685) (not b!82697) (not b!82698) (not b!82692) (not b!82686) b_and!5029 (not b_lambda!3685) (not mapNonEmpty!3355) (not b!82682) (not b!82684) (not b_next!2213) (not start!10510) b_and!5027 (not b!82693) tp_is_empty!2523 (not mapNonEmpty!3356) (not b_next!2215))
(check-sat b_and!5027 b_and!5029 (not b_next!2213) (not b_next!2215))
