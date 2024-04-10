; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9114 () Bool)

(assert start!9114)

(declare-fun b!64706 () Bool)

(declare-fun b_free!2021 () Bool)

(declare-fun b_next!2021 () Bool)

(assert (=> b!64706 (= b_free!2021 (not b_next!2021))))

(declare-fun tp!8206 () Bool)

(declare-fun b_and!3971 () Bool)

(assert (=> b!64706 (= tp!8206 b_and!3971)))

(declare-fun b!64704 () Bool)

(declare-fun b_free!2023 () Bool)

(declare-fun b_next!2023 () Bool)

(assert (=> b!64704 (= b_free!2023 (not b_next!2023))))

(declare-fun tp!8208 () Bool)

(declare-fun b_and!3973 () Bool)

(assert (=> b!64704 (= tp!8208 b_and!3973)))

(declare-fun b!64687 () Bool)

(declare-fun res!35263 () Bool)

(declare-fun e!42408 () Bool)

(assert (=> b!64687 (=> (not res!35263) (not e!42408))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2883 0))(
  ( (V!2884 (val!1258 Int)) )
))
(declare-datatypes ((array!3789 0))(
  ( (array!3790 (arr!1811 (Array (_ BitVec 32) (_ BitVec 64))) (size!2045 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!870 0))(
  ( (ValueCellFull!870 (v!2446 V!2883)) (EmptyCell!870) )
))
(declare-datatypes ((array!3791 0))(
  ( (array!3792 (arr!1812 (Array (_ BitVec 32) ValueCell!870)) (size!2046 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!648 0))(
  ( (LongMapFixedSize!649 (defaultEntry!2122 Int) (mask!6044 (_ BitVec 32)) (extraKeys!1995 (_ BitVec 32)) (zeroValue!2031 V!2883) (minValue!2031 V!2883) (_size!373 (_ BitVec 32)) (_keys!3760 array!3789) (_values!2105 array!3791) (_vacant!373 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!456 0))(
  ( (Cell!457 (v!2447 LongMapFixedSize!648)) )
))
(declare-datatypes ((LongMap!456 0))(
  ( (LongMap!457 (underlying!239 Cell!456)) )
))
(declare-fun thiss!992 () LongMap!456)

(assert (=> b!64687 (= res!35263 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun res!35268 () Bool)

(assert (=> start!9114 (=> (not res!35268) (not e!42408))))

(declare-fun valid!267 (LongMap!456) Bool)

(assert (=> start!9114 (= res!35268 (valid!267 thiss!992))))

(assert (=> start!9114 e!42408))

(declare-fun e!42406 () Bool)

(assert (=> start!9114 e!42406))

(assert (=> start!9114 true))

(declare-fun e!42398 () Bool)

(assert (=> start!9114 e!42398))

(declare-fun mapIsEmpty!2993 () Bool)

(declare-fun mapRes!2994 () Bool)

(assert (=> mapIsEmpty!2993 mapRes!2994))

(declare-fun b!64688 () Bool)

(declare-datatypes ((Unit!1783 0))(
  ( (Unit!1784) )
))
(declare-fun e!42395 () Unit!1783)

(declare-fun Unit!1785 () Unit!1783)

(assert (=> b!64688 (= e!42395 Unit!1785)))

(declare-fun lt!27584 () Unit!1783)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!38 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) (_ BitVec 32) Int) Unit!1783)

(assert (=> b!64688 (= lt!27584 (lemmaListMapContainsThenArrayContainsFrom!38 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!64688 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27586 () Unit!1783)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3789 (_ BitVec 32) (_ BitVec 32)) Unit!1783)

(assert (=> b!64688 (= lt!27586 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1448 0))(
  ( (Nil!1445) (Cons!1444 (h!2028 (_ BitVec 64)) (t!4878 List!1448)) )
))
(declare-fun arrayNoDuplicates!0 (array!3789 (_ BitVec 32) List!1448) Bool)

(assert (=> b!64688 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1445)))

(declare-fun lt!27588 () Unit!1783)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3789 (_ BitVec 32) (_ BitVec 64) List!1448) Unit!1783)

(assert (=> b!64688 (= lt!27588 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445)))))

(assert (=> b!64688 false))

(declare-fun b!64689 () Bool)

(declare-fun res!35260 () Bool)

(declare-fun e!42405 () Bool)

(assert (=> b!64689 (=> (not res!35260) (not e!42405))))

(assert (=> b!64689 (= res!35260 (and (= (size!2046 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6044 (v!2447 (underlying!239 thiss!992))))) (= (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (size!2046 (_values!2105 (v!2447 (underlying!239 thiss!992))))) (bvsge (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!64690 () Bool)

(declare-fun Unit!1786 () Unit!1783)

(assert (=> b!64690 (= e!42395 Unit!1786)))

(declare-fun b!64691 () Bool)

(declare-fun e!42396 () Bool)

(assert (=> b!64691 (= e!42396 e!42405)))

(declare-fun res!35261 () Bool)

(assert (=> b!64691 (=> (not res!35261) (not e!42405))))

(declare-datatypes ((tuple2!2056 0))(
  ( (tuple2!2057 (_1!1039 Bool) (_2!1039 LongMapFixedSize!648)) )
))
(declare-fun lt!27583 () tuple2!2056)

(assert (=> b!64691 (= res!35261 (and (_1!1039 lt!27583) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!27587 () Unit!1783)

(assert (=> b!64691 (= lt!27587 e!42395)))

(declare-datatypes ((tuple2!2058 0))(
  ( (tuple2!2059 (_1!1040 (_ BitVec 64)) (_2!1040 V!2883)) )
))
(declare-datatypes ((List!1449 0))(
  ( (Nil!1446) (Cons!1445 (h!2029 tuple2!2058) (t!4879 List!1449)) )
))
(declare-datatypes ((ListLongMap!1383 0))(
  ( (ListLongMap!1384 (toList!707 List!1449)) )
))
(declare-fun lt!27589 () ListLongMap!1383)

(declare-fun c!8847 () Bool)

(declare-fun contains!698 (ListLongMap!1383 (_ BitVec 64)) Bool)

(assert (=> b!64691 (= c!8847 (contains!698 lt!27589 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!648)

(declare-fun update!81 (LongMapFixedSize!648 (_ BitVec 64) V!2883) tuple2!2056)

(declare-fun get!1096 (ValueCell!870 V!2883) V!2883)

(declare-fun dynLambda!312 (Int (_ BitVec 64)) V!2883)

(assert (=> b!64691 (= lt!27583 (update!81 newMap!16 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64692 () Bool)

(declare-fun res!35267 () Bool)

(assert (=> b!64692 (=> (not res!35267) (not e!42408))))

(assert (=> b!64692 (= res!35267 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6044 newMap!16)) (_size!373 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64693 () Bool)

(declare-fun e!42404 () Bool)

(declare-fun tp_is_empty!2427 () Bool)

(assert (=> b!64693 (= e!42404 tp_is_empty!2427)))

(declare-fun b!64694 () Bool)

(declare-fun e!42407 () Bool)

(declare-fun e!42402 () Bool)

(assert (=> b!64694 (= e!42407 (and e!42402 mapRes!2994))))

(declare-fun condMapEmpty!2993 () Bool)

(declare-fun mapDefault!2993 () ValueCell!870)

(assert (=> b!64694 (= condMapEmpty!2993 (= (arr!1812 (_values!2105 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!2993)))))

(declare-fun b!64695 () Bool)

(assert (=> b!64695 (= e!42405 (not (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1445)))))

(declare-fun b!64696 () Bool)

(declare-fun e!42397 () Bool)

(assert (=> b!64696 (= e!42406 e!42397)))

(declare-fun mapNonEmpty!2993 () Bool)

(declare-fun mapRes!2993 () Bool)

(declare-fun tp!8207 () Bool)

(declare-fun e!42403 () Bool)

(assert (=> mapNonEmpty!2993 (= mapRes!2993 (and tp!8207 e!42403))))

(declare-fun mapValue!2993 () ValueCell!870)

(declare-fun mapKey!2993 () (_ BitVec 32))

(declare-fun mapRest!2994 () (Array (_ BitVec 32) ValueCell!870))

(assert (=> mapNonEmpty!2993 (= (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (store mapRest!2994 mapKey!2993 mapValue!2993))))

(declare-fun b!64697 () Bool)

(declare-fun res!35266 () Bool)

(assert (=> b!64697 (=> (not res!35266) (not e!42405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!64697 (= res!35266 (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64698 () Bool)

(assert (=> b!64698 (= e!42408 e!42396)))

(declare-fun res!35264 () Bool)

(assert (=> b!64698 (=> (not res!35264) (not e!42396))))

(declare-fun lt!27585 () ListLongMap!1383)

(assert (=> b!64698 (= res!35264 (and (= lt!27585 lt!27589) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1122 (LongMapFixedSize!648) ListLongMap!1383)

(assert (=> b!64698 (= lt!27589 (map!1122 newMap!16))))

(declare-fun getCurrentListMap!409 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) Int) ListLongMap!1383)

(assert (=> b!64698 (= lt!27585 (getCurrentListMap!409 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64699 () Bool)

(assert (=> b!64699 (= e!42402 tp_is_empty!2427)))

(declare-fun b!64700 () Bool)

(declare-fun e!42399 () Bool)

(assert (=> b!64700 (= e!42397 e!42399)))

(declare-fun mapNonEmpty!2994 () Bool)

(declare-fun tp!8205 () Bool)

(assert (=> mapNonEmpty!2994 (= mapRes!2994 (and tp!8205 e!42404))))

(declare-fun mapKey!2994 () (_ BitVec 32))

(declare-fun mapValue!2994 () ValueCell!870)

(declare-fun mapRest!2993 () (Array (_ BitVec 32) ValueCell!870))

(assert (=> mapNonEmpty!2994 (= (arr!1812 (_values!2105 newMap!16)) (store mapRest!2993 mapKey!2994 mapValue!2994))))

(declare-fun mapIsEmpty!2994 () Bool)

(assert (=> mapIsEmpty!2994 mapRes!2993))

(declare-fun b!64701 () Bool)

(declare-fun res!35265 () Bool)

(assert (=> b!64701 (=> (not res!35265) (not e!42405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3789 (_ BitVec 32)) Bool)

(assert (=> b!64701 (= res!35265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64702 () Bool)

(declare-fun e!42401 () Bool)

(declare-fun e!42409 () Bool)

(assert (=> b!64702 (= e!42401 (and e!42409 mapRes!2993))))

(declare-fun condMapEmpty!2994 () Bool)

(declare-fun mapDefault!2994 () ValueCell!870)

(assert (=> b!64702 (= condMapEmpty!2994 (= (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!2994)))))

(declare-fun b!64703 () Bool)

(declare-fun res!35262 () Bool)

(assert (=> b!64703 (=> (not res!35262) (not e!42408))))

(declare-fun valid!268 (LongMapFixedSize!648) Bool)

(assert (=> b!64703 (= res!35262 (valid!268 newMap!16))))

(declare-fun array_inv!1117 (array!3789) Bool)

(declare-fun array_inv!1118 (array!3791) Bool)

(assert (=> b!64704 (= e!42398 (and tp!8208 tp_is_empty!2427 (array_inv!1117 (_keys!3760 newMap!16)) (array_inv!1118 (_values!2105 newMap!16)) e!42407))))

(declare-fun b!64705 () Bool)

(assert (=> b!64705 (= e!42409 tp_is_empty!2427)))

(assert (=> b!64706 (= e!42399 (and tp!8206 tp_is_empty!2427 (array_inv!1117 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (array_inv!1118 (_values!2105 (v!2447 (underlying!239 thiss!992)))) e!42401))))

(declare-fun b!64707 () Bool)

(assert (=> b!64707 (= e!42403 tp_is_empty!2427)))

(assert (= (and start!9114 res!35268) b!64687))

(assert (= (and b!64687 res!35263) b!64703))

(assert (= (and b!64703 res!35262) b!64692))

(assert (= (and b!64692 res!35267) b!64698))

(assert (= (and b!64698 res!35264) b!64691))

(assert (= (and b!64691 c!8847) b!64688))

(assert (= (and b!64691 (not c!8847)) b!64690))

(assert (= (and b!64691 res!35261) b!64697))

(assert (= (and b!64697 res!35266) b!64689))

(assert (= (and b!64689 res!35260) b!64701))

(assert (= (and b!64701 res!35265) b!64695))

(assert (= (and b!64702 condMapEmpty!2994) mapIsEmpty!2994))

(assert (= (and b!64702 (not condMapEmpty!2994)) mapNonEmpty!2993))

(get-info :version)

(assert (= (and mapNonEmpty!2993 ((_ is ValueCellFull!870) mapValue!2993)) b!64707))

(assert (= (and b!64702 ((_ is ValueCellFull!870) mapDefault!2994)) b!64705))

(assert (= b!64706 b!64702))

(assert (= b!64700 b!64706))

(assert (= b!64696 b!64700))

(assert (= start!9114 b!64696))

(assert (= (and b!64694 condMapEmpty!2993) mapIsEmpty!2993))

(assert (= (and b!64694 (not condMapEmpty!2993)) mapNonEmpty!2994))

(assert (= (and mapNonEmpty!2994 ((_ is ValueCellFull!870) mapValue!2994)) b!64693))

(assert (= (and b!64694 ((_ is ValueCellFull!870) mapDefault!2993)) b!64699))

(assert (= b!64704 b!64694))

(assert (= start!9114 b!64704))

(declare-fun b_lambda!2911 () Bool)

(assert (=> (not b_lambda!2911) (not b!64691)))

(declare-fun t!4875 () Bool)

(declare-fun tb!1405 () Bool)

(assert (=> (and b!64706 (= (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) t!4875) tb!1405))

(declare-fun result!2497 () Bool)

(assert (=> tb!1405 (= result!2497 tp_is_empty!2427)))

(assert (=> b!64691 t!4875))

(declare-fun b_and!3975 () Bool)

(assert (= b_and!3971 (and (=> t!4875 result!2497) b_and!3975)))

(declare-fun tb!1407 () Bool)

(declare-fun t!4877 () Bool)

(assert (=> (and b!64704 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) t!4877) tb!1407))

(declare-fun result!2501 () Bool)

(assert (= result!2501 result!2497))

(assert (=> b!64691 t!4877))

(declare-fun b_and!3977 () Bool)

(assert (= b_and!3973 (and (=> t!4877 result!2501) b_and!3977)))

(declare-fun m!59475 () Bool)

(assert (=> start!9114 m!59475))

(declare-fun m!59477 () Bool)

(assert (=> mapNonEmpty!2994 m!59477))

(declare-fun m!59479 () Bool)

(assert (=> b!64703 m!59479))

(declare-fun m!59481 () Bool)

(assert (=> b!64691 m!59481))

(declare-fun m!59483 () Bool)

(assert (=> b!64691 m!59483))

(declare-fun m!59485 () Bool)

(assert (=> b!64691 m!59485))

(declare-fun m!59487 () Bool)

(assert (=> b!64691 m!59487))

(declare-fun m!59489 () Bool)

(assert (=> b!64691 m!59489))

(assert (=> b!64691 m!59481))

(assert (=> b!64691 m!59487))

(assert (=> b!64691 m!59481))

(assert (=> b!64691 m!59489))

(declare-fun m!59491 () Bool)

(assert (=> b!64691 m!59491))

(assert (=> b!64691 m!59485))

(declare-fun m!59493 () Bool)

(assert (=> b!64688 m!59493))

(declare-fun m!59495 () Bool)

(assert (=> b!64688 m!59495))

(assert (=> b!64688 m!59481))

(declare-fun m!59497 () Bool)

(assert (=> b!64688 m!59497))

(assert (=> b!64688 m!59481))

(assert (=> b!64688 m!59481))

(declare-fun m!59499 () Bool)

(assert (=> b!64688 m!59499))

(assert (=> b!64688 m!59481))

(declare-fun m!59501 () Bool)

(assert (=> b!64688 m!59501))

(declare-fun m!59503 () Bool)

(assert (=> b!64695 m!59503))

(declare-fun m!59505 () Bool)

(assert (=> b!64701 m!59505))

(declare-fun m!59507 () Bool)

(assert (=> b!64697 m!59507))

(declare-fun m!59509 () Bool)

(assert (=> b!64704 m!59509))

(declare-fun m!59511 () Bool)

(assert (=> b!64704 m!59511))

(declare-fun m!59513 () Bool)

(assert (=> b!64706 m!59513))

(declare-fun m!59515 () Bool)

(assert (=> b!64706 m!59515))

(declare-fun m!59517 () Bool)

(assert (=> mapNonEmpty!2993 m!59517))

(assert (=> b!64698 m!59481))

(declare-fun m!59519 () Bool)

(assert (=> b!64698 m!59519))

(declare-fun m!59521 () Bool)

(assert (=> b!64698 m!59521))

(check-sat (not b!64703) b_and!3977 b_and!3975 (not mapNonEmpty!2993) (not b!64697) (not b_lambda!2911) tp_is_empty!2427 (not b!64688) (not b_next!2021) (not start!9114) (not b!64704) (not b!64698) (not b!64695) (not b!64701) (not b_next!2023) (not mapNonEmpty!2994) (not b!64706) (not b!64691))
(check-sat b_and!3975 b_and!3977 (not b_next!2021) (not b_next!2023))
(get-model)

(declare-fun b_lambda!2915 () Bool)

(assert (= b_lambda!2911 (or (and b!64706 b_free!2021) (and b!64704 b_free!2023 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))))) b_lambda!2915)))

(check-sat (not b!64703) b_and!3975 (not mapNonEmpty!2993) (not b!64697) tp_is_empty!2427 (not b!64688) (not b_next!2021) (not start!9114) (not b!64704) (not b!64698) (not b!64695) (not b!64701) (not b_lambda!2915) b_and!3977 (not b_next!2023) (not mapNonEmpty!2994) (not b!64706) (not b!64691))
(check-sat b_and!3975 b_and!3977 (not b_next!2021) (not b_next!2023))
(get-model)

(declare-fun d!13525 () Bool)

(declare-fun e!42463 () Bool)

(assert (=> d!13525 e!42463))

(declare-fun res!35298 () Bool)

(assert (=> d!13525 (=> res!35298 e!42463)))

(declare-fun lt!27622 () Bool)

(assert (=> d!13525 (= res!35298 (not lt!27622))))

(declare-fun lt!27620 () Bool)

(assert (=> d!13525 (= lt!27622 lt!27620)))

(declare-fun lt!27619 () Unit!1783)

(declare-fun e!42464 () Unit!1783)

(assert (=> d!13525 (= lt!27619 e!42464)))

(declare-fun c!8853 () Bool)

(assert (=> d!13525 (= c!8853 lt!27620)))

(declare-fun containsKey!132 (List!1449 (_ BitVec 64)) Bool)

(assert (=> d!13525 (= lt!27620 (containsKey!132 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13525 (= (contains!698 lt!27589 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27622)))

(declare-fun b!64781 () Bool)

(declare-fun lt!27621 () Unit!1783)

(assert (=> b!64781 (= e!42464 lt!27621)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!80 (List!1449 (_ BitVec 64)) Unit!1783)

(assert (=> b!64781 (= lt!27621 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-datatypes ((Option!134 0))(
  ( (Some!133 (v!2451 V!2883)) (None!132) )
))
(declare-fun isDefined!81 (Option!134) Bool)

(declare-fun getValueByKey!128 (List!1449 (_ BitVec 64)) Option!134)

(assert (=> b!64781 (isDefined!81 (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64782 () Bool)

(declare-fun Unit!1791 () Unit!1783)

(assert (=> b!64782 (= e!42464 Unit!1791)))

(declare-fun b!64783 () Bool)

(assert (=> b!64783 (= e!42463 (isDefined!81 (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13525 c!8853) b!64781))

(assert (= (and d!13525 (not c!8853)) b!64782))

(assert (= (and d!13525 (not res!35298)) b!64783))

(assert (=> d!13525 m!59481))

(declare-fun m!59571 () Bool)

(assert (=> d!13525 m!59571))

(assert (=> b!64781 m!59481))

(declare-fun m!59573 () Bool)

(assert (=> b!64781 m!59573))

(assert (=> b!64781 m!59481))

(declare-fun m!59575 () Bool)

(assert (=> b!64781 m!59575))

(assert (=> b!64781 m!59575))

(declare-fun m!59577 () Bool)

(assert (=> b!64781 m!59577))

(assert (=> b!64783 m!59481))

(assert (=> b!64783 m!59575))

(assert (=> b!64783 m!59575))

(assert (=> b!64783 m!59577))

(assert (=> b!64691 d!13525))

(declare-fun b!64868 () Bool)

(declare-fun e!42527 () Bool)

(declare-fun call!5283 () Bool)

(assert (=> b!64868 (= e!42527 (not call!5283))))

(declare-fun b!64869 () Bool)

(declare-fun res!35337 () Bool)

(declare-fun call!5287 () Bool)

(assert (=> b!64869 (= res!35337 call!5287)))

(declare-fun e!42528 () Bool)

(assert (=> b!64869 (=> (not res!35337) (not e!42528))))

(declare-fun b!64870 () Bool)

(declare-fun e!42530 () Bool)

(declare-fun e!42524 () Bool)

(assert (=> b!64870 (= e!42530 e!42524)))

(declare-fun res!35336 () Bool)

(declare-fun call!5295 () Bool)

(assert (=> b!64870 (= res!35336 call!5295)))

(assert (=> b!64870 (=> (not res!35336) (not e!42524))))

(declare-fun b!64871 () Bool)

(declare-fun e!42520 () ListLongMap!1383)

(declare-fun call!5275 () ListLongMap!1383)

(assert (=> b!64871 (= e!42520 call!5275)))

(declare-fun b!64872 () Bool)

(assert (=> b!64872 (= e!42520 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun bm!5272 () Bool)

(declare-fun call!5289 () Bool)

(declare-fun call!5297 () Bool)

(assert (=> bm!5272 (= call!5289 call!5297)))

(declare-fun bm!5273 () Bool)

(declare-fun call!5285 () ListLongMap!1383)

(declare-fun call!5278 () ListLongMap!1383)

(assert (=> bm!5273 (= call!5285 call!5278)))

(declare-fun b!64873 () Bool)

(declare-fun e!42512 () Bool)

(assert (=> b!64873 (= e!42512 e!42527)))

(declare-fun res!35330 () Bool)

(declare-fun call!5279 () Bool)

(assert (=> b!64873 (= res!35330 call!5279)))

(assert (=> b!64873 (=> (not res!35330) (not e!42527))))

(declare-fun b!64874 () Bool)

(declare-fun res!35340 () Bool)

(declare-fun e!42511 () Bool)

(assert (=> b!64874 (=> (not res!35340) (not e!42511))))

(declare-datatypes ((SeekEntryResult!231 0))(
  ( (MissingZero!231 (index!3051 (_ BitVec 32))) (Found!231 (index!3052 (_ BitVec 32))) (Intermediate!231 (undefined!1043 Bool) (index!3053 (_ BitVec 32)) (x!10542 (_ BitVec 32))) (Undefined!231) (MissingVacant!231 (index!3054 (_ BitVec 32))) )
))
(declare-fun lt!27685 () SeekEntryResult!231)

(assert (=> b!64874 (= res!35340 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3051 lt!27685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64875 () Bool)

(declare-fun res!35333 () Bool)

(assert (=> b!64875 (=> (not res!35333) (not e!42511))))

(assert (=> b!64875 (= res!35333 call!5295)))

(declare-fun e!42522 () Bool)

(assert (=> b!64875 (= e!42522 e!42511)))

(declare-fun bm!5274 () Bool)

(declare-fun call!5290 () ListLongMap!1383)

(declare-fun call!5284 () ListLongMap!1383)

(assert (=> bm!5274 (= call!5290 call!5284)))

(declare-fun bm!5275 () Bool)

(declare-fun c!8884 () Bool)

(declare-fun c!8882 () Bool)

(assert (=> bm!5275 (= c!8884 c!8882)))

(declare-fun call!5298 () Bool)

(assert (=> bm!5275 (= call!5298 (contains!698 e!42520 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64876 () Bool)

(declare-fun e!42516 () Bool)

(declare-fun lt!27679 () SeekEntryResult!231)

(assert (=> b!64876 (= e!42516 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27679)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64877 () Bool)

(declare-fun e!42509 () Bool)

(declare-fun e!42510 () Bool)

(assert (=> b!64877 (= e!42509 e!42510)))

(declare-fun res!35335 () Bool)

(declare-fun call!5292 () ListLongMap!1383)

(assert (=> b!64877 (= res!35335 (contains!698 call!5292 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!64877 (=> (not res!35335) (not e!42510))))

(declare-fun b!64878 () Bool)

(declare-fun e!42519 () ListLongMap!1383)

(assert (=> b!64878 (= e!42519 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun b!64879 () Bool)

(declare-fun res!35327 () Bool)

(assert (=> b!64879 (= res!35327 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3054 lt!27685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64879 (=> (not res!35327) (not e!42524))))

(declare-fun b!64880 () Bool)

(declare-fun call!5286 () Bool)

(assert (=> b!64880 (= e!42511 (not call!5286))))

(declare-fun b!64881 () Bool)

(declare-fun c!8883 () Bool)

(declare-fun lt!27687 () SeekEntryResult!231)

(assert (=> b!64881 (= c!8883 ((_ is MissingVacant!231) lt!27687))))

(declare-fun e!42518 () Bool)

(assert (=> b!64881 (= e!42518 e!42512)))

(declare-fun b!64882 () Bool)

(declare-fun res!35332 () Bool)

(assert (=> b!64882 (= res!35332 call!5289)))

(assert (=> b!64882 (=> (not res!35332) (not e!42516))))

(declare-fun bm!5276 () Bool)

(declare-fun call!5293 () SeekEntryResult!231)

(declare-fun call!5281 () SeekEntryResult!231)

(assert (=> bm!5276 (= call!5293 call!5281)))

(declare-fun bm!5277 () Bool)

(declare-fun call!5296 () ListLongMap!1383)

(assert (=> bm!5277 (= call!5296 (map!1122 newMap!16))))

(declare-fun b!64883 () Bool)

(assert (=> b!64883 (= e!42512 ((_ is Undefined!231) lt!27687))))

(declare-fun b!64884 () Bool)

(declare-fun lt!27686 () Unit!1783)

(declare-fun lt!27690 () Unit!1783)

(assert (=> b!64884 (= lt!27686 lt!27690)))

(declare-fun call!5277 () ListLongMap!1383)

(assert (=> b!64884 (= call!5277 call!5290)))

(declare-fun lt!27678 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 V!2883 Int) Unit!1783)

(assert (=> b!64884 (= lt!27690 (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27678 (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)))))

(assert (=> b!64884 (= lt!27678 (bvor (extraKeys!1995 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!42529 () tuple2!2056)

(assert (=> b!64884 (= e!42529 (tuple2!2057 true (LongMapFixedSize!649 (defaultEntry!2122 newMap!16) (mask!6044 newMap!16) (bvor (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) (zeroValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!373 newMap!16) (_keys!3760 newMap!16) (_values!2105 newMap!16) (_vacant!373 newMap!16))))))

(declare-fun bm!5278 () Bool)

(declare-fun lt!27702 () SeekEntryResult!231)

(declare-fun c!8888 () Bool)

(declare-fun call!5280 () tuple2!2056)

(declare-fun updateHelperNewKey!19 (LongMapFixedSize!648 (_ BitVec 64) V!2883 (_ BitVec 32)) tuple2!2056)

(assert (=> bm!5278 (= call!5280 (updateHelperNewKey!19 newMap!16 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702))))))

(declare-fun b!64885 () Bool)

(declare-fun e!42526 () tuple2!2056)

(assert (=> b!64885 (= e!42526 e!42529)))

(declare-fun c!8887 () Bool)

(assert (=> b!64885 (= c!8887 (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5279 () Bool)

(declare-fun call!5276 () Bool)

(assert (=> bm!5279 (= call!5283 call!5276)))

(declare-fun d!13527 () Bool)

(declare-fun e!42513 () Bool)

(assert (=> d!13527 e!42513))

(declare-fun res!35328 () Bool)

(assert (=> d!13527 (=> (not res!35328) (not e!42513))))

(declare-fun lt!27694 () tuple2!2056)

(assert (=> d!13527 (= res!35328 (valid!268 (_2!1039 lt!27694)))))

(assert (=> d!13527 (= lt!27694 e!42526)))

(declare-fun c!8894 () Bool)

(assert (=> d!13527 (= c!8894 (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvneg (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (=> d!13527 (valid!268 newMap!16)))

(assert (=> d!13527 (= (update!81 newMap!16 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!27694)))

(declare-fun b!64886 () Bool)

(declare-fun lt!27684 () Unit!1783)

(declare-fun e!42523 () Unit!1783)

(assert (=> b!64886 (= lt!27684 e!42523)))

(declare-fun c!8886 () Bool)

(assert (=> b!64886 (= c!8886 call!5298)))

(declare-fun e!42525 () tuple2!2056)

(assert (=> b!64886 (= e!42525 (tuple2!2057 false newMap!16))))

(declare-fun b!64887 () Bool)

(declare-fun lt!27680 () Unit!1783)

(assert (=> b!64887 (= e!42523 lt!27680)))

(declare-fun call!5291 () Unit!1783)

(assert (=> b!64887 (= lt!27680 call!5291)))

(declare-fun call!5288 () SeekEntryResult!231)

(assert (=> b!64887 (= lt!27685 call!5288)))

(declare-fun c!8895 () Bool)

(assert (=> b!64887 (= c!8895 ((_ is MissingZero!231) lt!27685))))

(assert (=> b!64887 e!42522))

(declare-fun bm!5280 () Bool)

(assert (=> bm!5280 (= call!5295 call!5287)))

(declare-fun bm!5281 () Bool)

(assert (=> bm!5281 (= call!5279 call!5289)))

(declare-fun bm!5282 () Bool)

(assert (=> bm!5282 (= call!5288 call!5281)))

(declare-fun b!64888 () Bool)

(assert (=> b!64888 (= c!8888 ((_ is MissingVacant!231) lt!27702))))

(declare-fun e!42515 () tuple2!2056)

(assert (=> b!64888 (= e!42525 e!42515)))

(declare-fun bm!5283 () Bool)

(declare-fun call!5294 () ListLongMap!1383)

(assert (=> bm!5283 (= call!5277 call!5294)))

(declare-fun bm!5284 () Bool)

(declare-fun +!85 (ListLongMap!1383 tuple2!2058) ListLongMap!1383)

(assert (=> bm!5284 (= call!5294 (+!85 e!42519 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!8889 () Bool)

(assert (=> bm!5284 (= c!8889 c!8894)))

(declare-fun b!64889 () Bool)

(assert (=> b!64889 (= e!42526 e!42525)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3789 (_ BitVec 32)) SeekEntryResult!231)

(assert (=> b!64889 (= lt!27702 (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(assert (=> b!64889 (= c!8882 ((_ is Undefined!231) lt!27702))))

(declare-fun bm!5285 () Bool)

(declare-fun lt!27700 () array!3791)

(assert (=> bm!5285 (= call!5278 (getCurrentListMap!409 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun bm!5286 () Bool)

(assert (=> bm!5286 (= call!5287 call!5297)))

(declare-fun b!64890 () Bool)

(declare-fun lt!27689 () SeekEntryResult!231)

(assert (=> b!64890 (= e!42528 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27689)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64891 () Bool)

(assert (=> b!64891 (= e!42510 (= call!5292 (+!85 call!5296 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!5287 () Bool)

(assert (=> bm!5287 (= call!5281 (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun bm!5288 () Bool)

(assert (=> bm!5288 (= call!5286 call!5276)))

(declare-fun b!64892 () Bool)

(declare-fun Unit!1792 () Unit!1783)

(assert (=> b!64892 (= e!42523 Unit!1792)))

(declare-fun lt!27703 () Unit!1783)

(declare-fun call!5282 () Unit!1783)

(assert (=> b!64892 (= lt!27703 call!5282)))

(assert (=> b!64892 (= lt!27689 call!5288)))

(declare-fun res!35338 () Bool)

(assert (=> b!64892 (= res!35338 ((_ is Found!231) lt!27689))))

(assert (=> b!64892 (=> (not res!35338) (not e!42528))))

(assert (=> b!64892 e!42528))

(declare-fun lt!27701 () Unit!1783)

(assert (=> b!64892 (= lt!27701 lt!27703)))

(assert (=> b!64892 false))

(declare-fun bm!5289 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) Int) Unit!1783)

(assert (=> bm!5289 (= call!5291 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(declare-fun bm!5290 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) Int) Unit!1783)

(assert (=> bm!5290 (= call!5282 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(declare-fun b!64893 () Bool)

(declare-fun e!42521 () Unit!1783)

(declare-fun Unit!1793 () Unit!1783)

(assert (=> b!64893 (= e!42521 Unit!1793)))

(declare-fun lt!27695 () Unit!1783)

(assert (=> b!64893 (= lt!27695 call!5291)))

(assert (=> b!64893 (= lt!27687 call!5293)))

(declare-fun c!8891 () Bool)

(assert (=> b!64893 (= c!8891 ((_ is MissingZero!231) lt!27687))))

(assert (=> b!64893 e!42518))

(declare-fun lt!27693 () Unit!1783)

(assert (=> b!64893 (= lt!27693 lt!27695)))

(assert (=> b!64893 false))

(declare-fun b!64894 () Bool)

(declare-fun lt!27692 () tuple2!2056)

(assert (=> b!64894 (= e!42515 (tuple2!2057 (_1!1039 lt!27692) (_2!1039 lt!27692)))))

(assert (=> b!64894 (= lt!27692 call!5280)))

(declare-fun b!64895 () Bool)

(declare-fun e!42517 () Bool)

(assert (=> b!64895 (= e!42517 (not call!5283))))

(declare-fun b!64896 () Bool)

(assert (=> b!64896 (= e!42530 ((_ is Undefined!231) lt!27685))))

(declare-fun b!64897 () Bool)

(declare-fun lt!27677 () Unit!1783)

(declare-fun lt!27697 () Unit!1783)

(assert (=> b!64897 (= lt!27677 lt!27697)))

(assert (=> b!64897 (= call!5277 call!5290)))

(declare-fun lt!27699 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!19 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 V!2883 Int) Unit!1783)

(assert (=> b!64897 (= lt!27697 (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27699 (zeroValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2031 newMap!16) (defaultEntry!2122 newMap!16)))))

(assert (=> b!64897 (= lt!27699 (bvor (extraKeys!1995 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!64897 (= e!42529 (tuple2!2057 true (LongMapFixedSize!649 (defaultEntry!2122 newMap!16) (mask!6044 newMap!16) (bvor (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2031 newMap!16) (_size!373 newMap!16) (_keys!3760 newMap!16) (_values!2105 newMap!16) (_vacant!373 newMap!16))))))

(declare-fun b!64898 () Bool)

(declare-fun res!35329 () Bool)

(assert (=> b!64898 (=> (not res!35329) (not e!42517))))

(assert (=> b!64898 (= res!35329 call!5279)))

(assert (=> b!64898 (= e!42518 e!42517)))

(declare-fun b!64899 () Bool)

(declare-fun c!8885 () Bool)

(assert (=> b!64899 (= c!8885 ((_ is MissingVacant!231) lt!27685))))

(assert (=> b!64899 (= e!42522 e!42530)))

(declare-fun bm!5291 () Bool)

(assert (=> bm!5291 (= call!5292 (map!1122 (_2!1039 lt!27694)))))

(declare-fun b!64900 () Bool)

(declare-fun lt!27691 () Unit!1783)

(assert (=> b!64900 (= e!42521 lt!27691)))

(assert (=> b!64900 (= lt!27691 call!5282)))

(assert (=> b!64900 (= lt!27679 call!5293)))

(declare-fun res!35339 () Bool)

(assert (=> b!64900 (= res!35339 ((_ is Found!231) lt!27679))))

(assert (=> b!64900 (=> (not res!35339) (not e!42516))))

(assert (=> b!64900 e!42516))

(declare-fun b!64901 () Bool)

(assert (=> b!64901 (= e!42509 (= call!5292 call!5296))))

(declare-fun bm!5292 () Bool)

(assert (=> bm!5292 (= call!5276 (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64902 () Bool)

(declare-fun res!35334 () Bool)

(assert (=> b!64902 (= res!35334 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3054 lt!27687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64902 (=> (not res!35334) (not e!42527))))

(declare-fun bm!5293 () Bool)

(assert (=> bm!5293 (= call!5284 (getCurrentListMap!409 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun bm!5294 () Bool)

(assert (=> bm!5294 (= call!5275 call!5284)))

(declare-fun c!8890 () Bool)

(declare-fun bm!5295 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5295 (= call!5297 (inRange!0 (ite c!8882 (ite c!8886 (index!3052 lt!27689) (ite c!8895 (index!3051 lt!27685) (index!3054 lt!27685))) (ite c!8890 (index!3052 lt!27679) (ite c!8891 (index!3051 lt!27687) (index!3054 lt!27687)))) (mask!6044 newMap!16)))))

(declare-fun b!64903 () Bool)

(assert (=> b!64903 (= e!42519 call!5285)))

(declare-fun b!64904 () Bool)

(declare-fun lt!27681 () tuple2!2056)

(assert (=> b!64904 (= lt!27681 call!5280)))

(declare-fun e!42514 () tuple2!2056)

(assert (=> b!64904 (= e!42514 (tuple2!2057 (_1!1039 lt!27681) (_2!1039 lt!27681)))))

(declare-fun b!64905 () Bool)

(assert (=> b!64905 (= e!42513 e!42509)))

(declare-fun c!8893 () Bool)

(assert (=> b!64905 (= c!8893 (_1!1039 lt!27694))))

(declare-fun b!64906 () Bool)

(declare-fun lt!27696 () Unit!1783)

(declare-fun lt!27682 () Unit!1783)

(assert (=> b!64906 (= lt!27696 lt!27682)))

(assert (=> b!64906 (contains!698 call!5278 (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!80 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) Int) Unit!1783)

(assert (=> b!64906 (= lt!27682 (lemmaValidKeyInArrayIsInListMap!80 (_keys!3760 newMap!16) lt!27700 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (defaultEntry!2122 newMap!16)))))

(assert (=> b!64906 (= lt!27700 (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))))))

(declare-fun lt!27683 () Unit!1783)

(declare-fun lt!27698 () Unit!1783)

(assert (=> b!64906 (= lt!27683 lt!27698)))

(assert (=> b!64906 (= call!5294 call!5275)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) (_ BitVec 64) V!2883 Int) Unit!1783)

(assert (=> b!64906 (= lt!27698 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27688 () Unit!1783)

(assert (=> b!64906 (= lt!27688 e!42521)))

(assert (=> b!64906 (= c!8890 call!5298)))

(assert (=> b!64906 (= e!42514 (tuple2!2057 true (LongMapFixedSize!649 (defaultEntry!2122 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (_size!373 newMap!16) (_keys!3760 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))) (_vacant!373 newMap!16))))))

(declare-fun b!64907 () Bool)

(assert (=> b!64907 (= e!42524 (not call!5286))))

(declare-fun b!64908 () Bool)

(declare-fun res!35331 () Bool)

(assert (=> b!64908 (=> (not res!35331) (not e!42517))))

(assert (=> b!64908 (= res!35331 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3051 lt!27687)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64909 () Bool)

(assert (=> b!64909 (= e!42515 e!42514)))

(declare-fun c!8892 () Bool)

(assert (=> b!64909 (= c!8892 ((_ is MissingZero!231) lt!27702))))

(assert (= (and d!13527 c!8894) b!64885))

(assert (= (and d!13527 (not c!8894)) b!64889))

(assert (= (and b!64885 c!8887) b!64897))

(assert (= (and b!64885 (not c!8887)) b!64884))

(assert (= (or b!64897 b!64884) bm!5273))

(assert (= (or b!64897 b!64884) bm!5274))

(assert (= (or b!64897 b!64884) bm!5283))

(assert (= (and b!64889 c!8882) b!64886))

(assert (= (and b!64889 (not c!8882)) b!64888))

(assert (= (and b!64886 c!8886) b!64892))

(assert (= (and b!64886 (not c!8886)) b!64887))

(assert (= (and b!64892 res!35338) b!64869))

(assert (= (and b!64869 res!35337) b!64890))

(assert (= (and b!64887 c!8895) b!64875))

(assert (= (and b!64887 (not c!8895)) b!64899))

(assert (= (and b!64875 res!35333) b!64874))

(assert (= (and b!64874 res!35340) b!64880))

(assert (= (and b!64899 c!8885) b!64870))

(assert (= (and b!64899 (not c!8885)) b!64896))

(assert (= (and b!64870 res!35336) b!64879))

(assert (= (and b!64879 res!35327) b!64907))

(assert (= (or b!64875 b!64870) bm!5280))

(assert (= (or b!64880 b!64907) bm!5288))

(assert (= (or b!64869 bm!5280) bm!5286))

(assert (= (or b!64892 b!64887) bm!5282))

(assert (= (and b!64888 c!8888) b!64894))

(assert (= (and b!64888 (not c!8888)) b!64909))

(assert (= (and b!64909 c!8892) b!64904))

(assert (= (and b!64909 (not c!8892)) b!64906))

(assert (= (and b!64906 c!8890) b!64900))

(assert (= (and b!64906 (not c!8890)) b!64893))

(assert (= (and b!64900 res!35339) b!64882))

(assert (= (and b!64882 res!35332) b!64876))

(assert (= (and b!64893 c!8891) b!64898))

(assert (= (and b!64893 (not c!8891)) b!64881))

(assert (= (and b!64898 res!35329) b!64908))

(assert (= (and b!64908 res!35331) b!64895))

(assert (= (and b!64881 c!8883) b!64873))

(assert (= (and b!64881 (not c!8883)) b!64883))

(assert (= (and b!64873 res!35330) b!64902))

(assert (= (and b!64902 res!35334) b!64868))

(assert (= (or b!64898 b!64873) bm!5281))

(assert (= (or b!64895 b!64868) bm!5279))

(assert (= (or b!64882 bm!5281) bm!5272))

(assert (= (or b!64900 b!64893) bm!5276))

(assert (= (or b!64894 b!64904) bm!5278))

(assert (= (or bm!5286 bm!5272) bm!5295))

(assert (= (or b!64892 b!64900) bm!5290))

(assert (= (or bm!5288 bm!5279) bm!5292))

(assert (= (or b!64886 b!64906) bm!5294))

(assert (= (or bm!5282 bm!5276) bm!5287))

(assert (= (or b!64887 b!64893) bm!5289))

(assert (= (or b!64886 b!64906) bm!5275))

(assert (= (and bm!5275 c!8884) b!64871))

(assert (= (and bm!5275 (not c!8884)) b!64872))

(assert (= (or bm!5273 b!64906) bm!5285))

(assert (= (or bm!5274 bm!5294) bm!5293))

(assert (= (or bm!5283 b!64906) bm!5284))

(assert (= (and bm!5284 c!8889) b!64903))

(assert (= (and bm!5284 (not c!8889)) b!64878))

(assert (= (and d!13527 res!35328) b!64905))

(assert (= (and b!64905 c!8893) b!64877))

(assert (= (and b!64905 (not c!8893)) b!64901))

(assert (= (and b!64877 res!35335) b!64891))

(assert (= (or b!64891 b!64901) bm!5277))

(assert (= (or b!64877 b!64891 b!64901) bm!5291))

(declare-fun m!59579 () Bool)

(assert (=> b!64879 m!59579))

(assert (=> b!64889 m!59481))

(declare-fun m!59581 () Bool)

(assert (=> b!64889 m!59581))

(declare-fun m!59583 () Bool)

(assert (=> d!13527 m!59583))

(assert (=> d!13527 m!59479))

(assert (=> bm!5290 m!59481))

(declare-fun m!59585 () Bool)

(assert (=> bm!5290 m!59585))

(assert (=> b!64897 m!59489))

(declare-fun m!59587 () Bool)

(assert (=> b!64897 m!59587))

(declare-fun m!59589 () Bool)

(assert (=> b!64891 m!59589))

(declare-fun m!59591 () Bool)

(assert (=> bm!5295 m!59591))

(assert (=> bm!5292 m!59481))

(declare-fun m!59593 () Bool)

(assert (=> bm!5292 m!59593))

(declare-fun m!59595 () Bool)

(assert (=> bm!5285 m!59595))

(assert (=> bm!5287 m!59481))

(assert (=> bm!5287 m!59581))

(assert (=> b!64877 m!59481))

(declare-fun m!59597 () Bool)

(assert (=> b!64877 m!59597))

(assert (=> bm!5278 m!59481))

(assert (=> bm!5278 m!59489))

(declare-fun m!59599 () Bool)

(assert (=> bm!5278 m!59599))

(assert (=> bm!5275 m!59481))

(declare-fun m!59601 () Bool)

(assert (=> bm!5275 m!59601))

(declare-fun m!59603 () Bool)

(assert (=> b!64908 m!59603))

(declare-fun m!59605 () Bool)

(assert (=> b!64902 m!59605))

(declare-fun m!59607 () Bool)

(assert (=> b!64890 m!59607))

(declare-fun m!59609 () Bool)

(assert (=> bm!5284 m!59609))

(declare-fun m!59611 () Bool)

(assert (=> bm!5293 m!59611))

(declare-fun m!59613 () Bool)

(assert (=> bm!5293 m!59613))

(assert (=> bm!5289 m!59481))

(declare-fun m!59615 () Bool)

(assert (=> bm!5289 m!59615))

(declare-fun m!59617 () Bool)

(assert (=> b!64876 m!59617))

(declare-fun m!59619 () Bool)

(assert (=> b!64872 m!59619))

(assert (=> b!64878 m!59619))

(assert (=> b!64884 m!59489))

(declare-fun m!59621 () Bool)

(assert (=> b!64884 m!59621))

(declare-fun m!59623 () Bool)

(assert (=> b!64874 m!59623))

(declare-fun m!59625 () Bool)

(assert (=> bm!5291 m!59625))

(assert (=> b!64906 m!59481))

(assert (=> b!64906 m!59489))

(declare-fun m!59627 () Bool)

(assert (=> b!64906 m!59627))

(declare-fun m!59629 () Bool)

(assert (=> b!64906 m!59629))

(declare-fun m!59631 () Bool)

(assert (=> b!64906 m!59631))

(assert (=> b!64906 m!59629))

(declare-fun m!59633 () Bool)

(assert (=> b!64906 m!59633))

(assert (=> b!64906 m!59611))

(assert (=> bm!5277 m!59519))

(assert (=> b!64691 d!13527))

(declare-fun d!13529 () Bool)

(declare-fun c!8898 () Bool)

(assert (=> d!13529 (= c!8898 ((_ is ValueCellFull!870) (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42533 () V!2883)

(assert (=> d!13529 (= (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42533)))

(declare-fun b!64914 () Bool)

(declare-fun get!1098 (ValueCell!870 V!2883) V!2883)

(assert (=> b!64914 (= e!42533 (get!1098 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64915 () Bool)

(declare-fun get!1099 (ValueCell!870 V!2883) V!2883)

(assert (=> b!64915 (= e!42533 (get!1099 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13529 c!8898) b!64914))

(assert (= (and d!13529 (not c!8898)) b!64915))

(assert (=> b!64914 m!59485))

(assert (=> b!64914 m!59487))

(declare-fun m!59635 () Bool)

(assert (=> b!64914 m!59635))

(assert (=> b!64915 m!59485))

(assert (=> b!64915 m!59487))

(declare-fun m!59637 () Bool)

(assert (=> b!64915 m!59637))

(assert (=> b!64691 d!13529))

(declare-fun d!13531 () Bool)

(assert (=> d!13531 (= (array_inv!1117 (_keys!3760 newMap!16)) (bvsge (size!2045 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64704 d!13531))

(declare-fun d!13533 () Bool)

(assert (=> d!13533 (= (array_inv!1118 (_values!2105 newMap!16)) (bvsge (size!2046 (_values!2105 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64704 d!13533))

(declare-fun d!13535 () Bool)

(declare-fun res!35347 () Bool)

(declare-fun e!42536 () Bool)

(assert (=> d!13535 (=> (not res!35347) (not e!42536))))

(declare-fun simpleValid!46 (LongMapFixedSize!648) Bool)

(assert (=> d!13535 (= res!35347 (simpleValid!46 newMap!16))))

(assert (=> d!13535 (= (valid!268 newMap!16) e!42536)))

(declare-fun b!64922 () Bool)

(declare-fun res!35348 () Bool)

(assert (=> b!64922 (=> (not res!35348) (not e!42536))))

(declare-fun arrayCountValidKeys!0 (array!3789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!64922 (= res!35348 (= (arrayCountValidKeys!0 (_keys!3760 newMap!16) #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (_size!373 newMap!16)))))

(declare-fun b!64923 () Bool)

(declare-fun res!35349 () Bool)

(assert (=> b!64923 (=> (not res!35349) (not e!42536))))

(assert (=> b!64923 (= res!35349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun b!64924 () Bool)

(assert (=> b!64924 (= e!42536 (arrayNoDuplicates!0 (_keys!3760 newMap!16) #b00000000000000000000000000000000 Nil!1445))))

(assert (= (and d!13535 res!35347) b!64922))

(assert (= (and b!64922 res!35348) b!64923))

(assert (= (and b!64923 res!35349) b!64924))

(declare-fun m!59639 () Bool)

(assert (=> d!13535 m!59639))

(declare-fun m!59641 () Bool)

(assert (=> b!64922 m!59641))

(declare-fun m!59643 () Bool)

(assert (=> b!64923 m!59643))

(declare-fun m!59645 () Bool)

(assert (=> b!64924 m!59645))

(assert (=> b!64703 d!13535))

(declare-fun b!64935 () Bool)

(declare-fun e!42545 () Bool)

(declare-fun call!5301 () Bool)

(assert (=> b!64935 (= e!42545 call!5301)))

(declare-fun bm!5298 () Bool)

(declare-fun c!8901 () Bool)

(assert (=> bm!5298 (= call!5301 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8901 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1445) Nil!1445)))))

(declare-fun b!64936 () Bool)

(declare-fun e!42547 () Bool)

(declare-fun contains!700 (List!1448 (_ BitVec 64)) Bool)

(assert (=> b!64936 (= e!42547 (contains!700 Nil!1445 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64937 () Bool)

(assert (=> b!64937 (= e!42545 call!5301)))

(declare-fun d!13537 () Bool)

(declare-fun res!35358 () Bool)

(declare-fun e!42546 () Bool)

(assert (=> d!13537 (=> res!35358 e!42546)))

(assert (=> d!13537 (= res!35358 (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13537 (= (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1445) e!42546)))

(declare-fun b!64938 () Bool)

(declare-fun e!42548 () Bool)

(assert (=> b!64938 (= e!42546 e!42548)))

(declare-fun res!35357 () Bool)

(assert (=> b!64938 (=> (not res!35357) (not e!42548))))

(assert (=> b!64938 (= res!35357 (not e!42547))))

(declare-fun res!35356 () Bool)

(assert (=> b!64938 (=> (not res!35356) (not e!42547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!64938 (= res!35356 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64939 () Bool)

(assert (=> b!64939 (= e!42548 e!42545)))

(assert (=> b!64939 (= c!8901 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13537 (not res!35358)) b!64938))

(assert (= (and b!64938 res!35356) b!64936))

(assert (= (and b!64938 res!35357) b!64939))

(assert (= (and b!64939 c!8901) b!64937))

(assert (= (and b!64939 (not c!8901)) b!64935))

(assert (= (or b!64937 b!64935) bm!5298))

(declare-fun m!59647 () Bool)

(assert (=> bm!5298 m!59647))

(declare-fun m!59649 () Bool)

(assert (=> bm!5298 m!59649))

(assert (=> b!64936 m!59647))

(assert (=> b!64936 m!59647))

(declare-fun m!59651 () Bool)

(assert (=> b!64936 m!59651))

(assert (=> b!64938 m!59647))

(assert (=> b!64938 m!59647))

(declare-fun m!59653 () Bool)

(assert (=> b!64938 m!59653))

(assert (=> b!64939 m!59647))

(assert (=> b!64939 m!59647))

(assert (=> b!64939 m!59653))

(assert (=> b!64695 d!13537))

(declare-fun d!13539 () Bool)

(assert (=> d!13539 (= (map!1122 newMap!16) (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun bs!2824 () Bool)

(assert (= bs!2824 d!13539))

(assert (=> bs!2824 m!59619))

(assert (=> b!64698 d!13539))

(declare-fun b!64982 () Bool)

(declare-fun e!42587 () Bool)

(declare-fun call!5319 () Bool)

(assert (=> b!64982 (= e!42587 (not call!5319))))

(declare-fun b!64983 () Bool)

(declare-fun e!42579 () ListLongMap!1383)

(declare-fun call!5321 () ListLongMap!1383)

(assert (=> b!64983 (= e!42579 call!5321)))

(declare-fun b!64984 () Bool)

(declare-fun e!42586 () Unit!1783)

(declare-fun Unit!1794 () Unit!1783)

(assert (=> b!64984 (= e!42586 Unit!1794)))

(declare-fun bm!5313 () Bool)

(declare-fun call!5317 () ListLongMap!1383)

(declare-fun getCurrentListMapNoExtraKeys!48 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) Int) ListLongMap!1383)

(assert (=> bm!5313 (= call!5317 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64985 () Bool)

(declare-fun e!42575 () Bool)

(declare-fun call!5322 () Bool)

(assert (=> b!64985 (= e!42575 (not call!5322))))

(declare-fun b!64986 () Bool)

(declare-fun e!42577 () Bool)

(assert (=> b!64986 (= e!42577 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64987 () Bool)

(declare-fun e!42582 () Bool)

(declare-fun e!42585 () Bool)

(assert (=> b!64987 (= e!42582 e!42585)))

(declare-fun res!35385 () Bool)

(assert (=> b!64987 (=> (not res!35385) (not e!42585))))

(declare-fun lt!27753 () ListLongMap!1383)

(assert (=> b!64987 (= res!35385 (contains!698 lt!27753 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64987 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun bm!5314 () Bool)

(assert (=> bm!5314 (= call!5319 (contains!698 lt!27753 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5315 () Bool)

(declare-fun call!5316 () ListLongMap!1383)

(assert (=> bm!5315 (= call!5316 call!5317)))

(declare-fun b!64988 () Bool)

(declare-fun e!42583 () Bool)

(assert (=> b!64988 (= e!42587 e!42583)))

(declare-fun res!35382 () Bool)

(assert (=> b!64988 (= res!35382 call!5319)))

(assert (=> b!64988 (=> (not res!35382) (not e!42583))))

(declare-fun bm!5316 () Bool)

(assert (=> bm!5316 (= call!5321 call!5316)))

(declare-fun b!64990 () Bool)

(declare-fun e!42581 () Bool)

(assert (=> b!64990 (= e!42581 e!42587)))

(declare-fun c!8915 () Bool)

(assert (=> b!64990 (= c!8915 (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64991 () Bool)

(declare-fun apply!70 (ListLongMap!1383 (_ BitVec 64)) V!2883)

(assert (=> b!64991 (= e!42585 (= (apply!70 lt!27753 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64991 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2046 (_values!2105 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> b!64991 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64992 () Bool)

(declare-fun e!42576 () ListLongMap!1383)

(declare-fun e!42580 () ListLongMap!1383)

(assert (=> b!64992 (= e!42576 e!42580)))

(declare-fun c!8919 () Bool)

(assert (=> b!64992 (= c!8919 (and (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64993 () Bool)

(declare-fun res!35381 () Bool)

(assert (=> b!64993 (=> (not res!35381) (not e!42581))))

(assert (=> b!64993 (= res!35381 e!42575)))

(declare-fun c!8916 () Bool)

(assert (=> b!64993 (= c!8916 (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!64994 () Bool)

(assert (=> b!64994 (= e!42583 (= (apply!70 lt!27753 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64995 () Bool)

(declare-fun e!42584 () Bool)

(assert (=> b!64995 (= e!42584 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64996 () Bool)

(declare-fun call!5318 () ListLongMap!1383)

(assert (=> b!64996 (= e!42580 call!5318)))

(declare-fun call!5320 () ListLongMap!1383)

(declare-fun c!8918 () Bool)

(declare-fun bm!5317 () Bool)

(assert (=> bm!5317 (= call!5320 (+!85 (ite c!8918 call!5317 (ite c!8919 call!5316 call!5321)) (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun b!64997 () Bool)

(declare-fun e!42578 () Bool)

(assert (=> b!64997 (= e!42575 e!42578)))

(declare-fun res!35379 () Bool)

(assert (=> b!64997 (= res!35379 call!5322)))

(assert (=> b!64997 (=> (not res!35379) (not e!42578))))

(declare-fun b!64989 () Bool)

(declare-fun c!8914 () Bool)

(assert (=> b!64989 (= c!8914 (and (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64989 (= e!42580 e!42579)))

(declare-fun d!13541 () Bool)

(assert (=> d!13541 e!42581))

(declare-fun res!35380 () Bool)

(assert (=> d!13541 (=> (not res!35380) (not e!42581))))

(assert (=> d!13541 (= res!35380 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun lt!27764 () ListLongMap!1383)

(assert (=> d!13541 (= lt!27753 lt!27764)))

(declare-fun lt!27751 () Unit!1783)

(assert (=> d!13541 (= lt!27751 e!42586)))

(declare-fun c!8917 () Bool)

(assert (=> d!13541 (= c!8917 e!42584)))

(declare-fun res!35383 () Bool)

(assert (=> d!13541 (=> (not res!35383) (not e!42584))))

(assert (=> d!13541 (= res!35383 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13541 (= lt!27764 e!42576)))

(assert (=> d!13541 (= c!8918 (and (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13541 (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13541 (= (getCurrentListMap!409 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) lt!27753)))

(declare-fun b!64998 () Bool)

(assert (=> b!64998 (= e!42576 (+!85 call!5320 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64999 () Bool)

(assert (=> b!64999 (= e!42579 call!5318)))

(declare-fun b!65000 () Bool)

(assert (=> b!65000 (= e!42578 (= (apply!70 lt!27753 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun bm!5318 () Bool)

(assert (=> bm!5318 (= call!5322 (contains!698 lt!27753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65001 () Bool)

(declare-fun res!35378 () Bool)

(assert (=> b!65001 (=> (not res!35378) (not e!42581))))

(assert (=> b!65001 (= res!35378 e!42582)))

(declare-fun res!35384 () Bool)

(assert (=> b!65001 (=> res!35384 e!42582)))

(assert (=> b!65001 (= res!35384 (not e!42577))))

(declare-fun res!35377 () Bool)

(assert (=> b!65001 (=> (not res!35377) (not e!42577))))

(assert (=> b!65001 (= res!35377 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun bm!5319 () Bool)

(assert (=> bm!5319 (= call!5318 call!5320)))

(declare-fun b!65002 () Bool)

(declare-fun lt!27766 () Unit!1783)

(assert (=> b!65002 (= e!42586 lt!27766)))

(declare-fun lt!27749 () ListLongMap!1383)

(assert (=> b!65002 (= lt!27749 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27752 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27768 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27768 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27748 () Unit!1783)

(declare-fun addStillContains!46 (ListLongMap!1383 (_ BitVec 64) V!2883 (_ BitVec 64)) Unit!1783)

(assert (=> b!65002 (= lt!27748 (addStillContains!46 lt!27749 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27768))))

(assert (=> b!65002 (contains!698 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27768)))

(declare-fun lt!27755 () Unit!1783)

(assert (=> b!65002 (= lt!27755 lt!27748)))

(declare-fun lt!27750 () ListLongMap!1383)

(assert (=> b!65002 (= lt!27750 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27759 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27759 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27763 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27763 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27756 () Unit!1783)

(declare-fun addApplyDifferent!46 (ListLongMap!1383 (_ BitVec 64) V!2883 (_ BitVec 64)) Unit!1783)

(assert (=> b!65002 (= lt!27756 (addApplyDifferent!46 lt!27750 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27763))))

(assert (=> b!65002 (= (apply!70 (+!85 lt!27750 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27763) (apply!70 lt!27750 lt!27763))))

(declare-fun lt!27765 () Unit!1783)

(assert (=> b!65002 (= lt!27765 lt!27756)))

(declare-fun lt!27754 () ListLongMap!1383)

(assert (=> b!65002 (= lt!27754 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27767 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27760 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27760 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27758 () Unit!1783)

(assert (=> b!65002 (= lt!27758 (addApplyDifferent!46 lt!27754 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27760))))

(assert (=> b!65002 (= (apply!70 (+!85 lt!27754 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27760) (apply!70 lt!27754 lt!27760))))

(declare-fun lt!27761 () Unit!1783)

(assert (=> b!65002 (= lt!27761 lt!27758)))

(declare-fun lt!27762 () ListLongMap!1383)

(assert (=> b!65002 (= lt!27762 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27757 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27769 () (_ BitVec 64))

(assert (=> b!65002 (= lt!27769 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65002 (= lt!27766 (addApplyDifferent!46 lt!27762 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27769))))

(assert (=> b!65002 (= (apply!70 (+!85 lt!27762 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27769) (apply!70 lt!27762 lt!27769))))

(assert (= (and d!13541 c!8918) b!64998))

(assert (= (and d!13541 (not c!8918)) b!64992))

(assert (= (and b!64992 c!8919) b!64996))

(assert (= (and b!64992 (not c!8919)) b!64989))

(assert (= (and b!64989 c!8914) b!64999))

(assert (= (and b!64989 (not c!8914)) b!64983))

(assert (= (or b!64999 b!64983) bm!5316))

(assert (= (or b!64996 bm!5316) bm!5315))

(assert (= (or b!64996 b!64999) bm!5319))

(assert (= (or b!64998 bm!5315) bm!5313))

(assert (= (or b!64998 bm!5319) bm!5317))

(assert (= (and d!13541 res!35383) b!64995))

(assert (= (and d!13541 c!8917) b!65002))

(assert (= (and d!13541 (not c!8917)) b!64984))

(assert (= (and d!13541 res!35380) b!65001))

(assert (= (and b!65001 res!35377) b!64986))

(assert (= (and b!65001 (not res!35384)) b!64987))

(assert (= (and b!64987 res!35385) b!64991))

(assert (= (and b!65001 res!35378) b!64993))

(assert (= (and b!64993 c!8916) b!64997))

(assert (= (and b!64993 (not c!8916)) b!64985))

(assert (= (and b!64997 res!35379) b!65000))

(assert (= (or b!64997 b!64985) bm!5318))

(assert (= (and b!64993 res!35381) b!64990))

(assert (= (and b!64990 c!8915) b!64988))

(assert (= (and b!64990 (not c!8915)) b!64982))

(assert (= (and b!64988 res!35382) b!64994))

(assert (= (or b!64988 b!64982) bm!5314))

(declare-fun b_lambda!2917 () Bool)

(assert (=> (not b_lambda!2917) (not b!64991)))

(assert (=> b!64991 t!4875))

(declare-fun b_and!3987 () Bool)

(assert (= b_and!3975 (and (=> t!4875 result!2497) b_and!3987)))

(assert (=> b!64991 t!4877))

(declare-fun b_and!3989 () Bool)

(assert (= b_and!3977 (and (=> t!4877 result!2501) b_and!3989)))

(declare-fun m!59655 () Bool)

(assert (=> b!64986 m!59655))

(assert (=> b!64986 m!59655))

(declare-fun m!59657 () Bool)

(assert (=> b!64986 m!59657))

(declare-fun m!59659 () Bool)

(assert (=> bm!5318 m!59659))

(declare-fun m!59661 () Bool)

(assert (=> bm!5313 m!59661))

(assert (=> b!64991 m!59487))

(declare-fun m!59663 () Bool)

(assert (=> b!64991 m!59663))

(assert (=> b!64991 m!59655))

(assert (=> b!64991 m!59663))

(assert (=> b!64991 m!59487))

(declare-fun m!59665 () Bool)

(assert (=> b!64991 m!59665))

(assert (=> b!64991 m!59655))

(declare-fun m!59667 () Bool)

(assert (=> b!64991 m!59667))

(declare-fun m!59669 () Bool)

(assert (=> bm!5317 m!59669))

(declare-fun m!59671 () Bool)

(assert (=> b!65002 m!59671))

(declare-fun m!59673 () Bool)

(assert (=> b!65002 m!59673))

(declare-fun m!59675 () Bool)

(assert (=> b!65002 m!59675))

(declare-fun m!59677 () Bool)

(assert (=> b!65002 m!59677))

(declare-fun m!59679 () Bool)

(assert (=> b!65002 m!59679))

(declare-fun m!59681 () Bool)

(assert (=> b!65002 m!59681))

(assert (=> b!65002 m!59673))

(declare-fun m!59683 () Bool)

(assert (=> b!65002 m!59683))

(assert (=> b!65002 m!59655))

(declare-fun m!59685 () Bool)

(assert (=> b!65002 m!59685))

(assert (=> b!65002 m!59677))

(declare-fun m!59687 () Bool)

(assert (=> b!65002 m!59687))

(declare-fun m!59689 () Bool)

(assert (=> b!65002 m!59689))

(declare-fun m!59691 () Bool)

(assert (=> b!65002 m!59691))

(assert (=> b!65002 m!59675))

(declare-fun m!59693 () Bool)

(assert (=> b!65002 m!59693))

(assert (=> b!65002 m!59685))

(declare-fun m!59695 () Bool)

(assert (=> b!65002 m!59695))

(assert (=> b!65002 m!59661))

(declare-fun m!59697 () Bool)

(assert (=> b!65002 m!59697))

(declare-fun m!59699 () Bool)

(assert (=> b!65002 m!59699))

(assert (=> b!64995 m!59655))

(assert (=> b!64995 m!59655))

(assert (=> b!64995 m!59657))

(assert (=> d!13541 m!59507))

(declare-fun m!59701 () Bool)

(assert (=> b!65000 m!59701))

(declare-fun m!59703 () Bool)

(assert (=> b!64994 m!59703))

(assert (=> b!64987 m!59655))

(assert (=> b!64987 m!59655))

(declare-fun m!59705 () Bool)

(assert (=> b!64987 m!59705))

(declare-fun m!59707 () Bool)

(assert (=> bm!5314 m!59707))

(declare-fun m!59709 () Bool)

(assert (=> b!64998 m!59709))

(assert (=> b!64698 d!13541))

(declare-fun d!13543 () Bool)

(assert (=> d!13543 (= (valid!267 thiss!992) (valid!268 (v!2447 (underlying!239 thiss!992))))))

(declare-fun bs!2825 () Bool)

(assert (= bs!2825 d!13543))

(declare-fun m!59711 () Bool)

(assert (=> bs!2825 m!59711))

(assert (=> start!9114 d!13543))

(declare-fun d!13545 () Bool)

(assert (=> d!13545 (= (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992)))) (and (or (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000001111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000011111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000001111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000011111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000001111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000011111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000001111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000011111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000000111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000001111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000011111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000000111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000001111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000011111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000000111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000001111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000011111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000000111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000001111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000011111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00000111111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00001111111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00011111111111111111111111111111) (= (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6044 (v!2447 (underlying!239 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!64697 d!13545))

(declare-fun d!13547 () Bool)

(assert (=> d!13547 (not (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27772 () Unit!1783)

(declare-fun choose!68 (array!3789 (_ BitVec 32) (_ BitVec 64) List!1448) Unit!1783)

(assert (=> d!13547 (= lt!27772 (choose!68 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445)))))

(assert (=> d!13547 (bvslt (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13547 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445)) lt!27772)))

(declare-fun bs!2826 () Bool)

(assert (= bs!2826 d!13547))

(assert (=> bs!2826 m!59481))

(assert (=> bs!2826 m!59499))

(assert (=> bs!2826 m!59481))

(declare-fun m!59713 () Bool)

(assert (=> bs!2826 m!59713))

(assert (=> b!64688 d!13547))

(declare-fun d!13549 () Bool)

(assert (=> d!13549 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1445)))

(declare-fun lt!27775 () Unit!1783)

(declare-fun choose!39 (array!3789 (_ BitVec 32) (_ BitVec 32)) Unit!1783)

(assert (=> d!13549 (= lt!27775 (choose!39 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13549 (bvslt (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13549 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355) lt!27775)))

(declare-fun bs!2827 () Bool)

(assert (= bs!2827 d!13549))

(assert (=> bs!2827 m!59495))

(declare-fun m!59715 () Bool)

(assert (=> bs!2827 m!59715))

(assert (=> b!64688 d!13549))

(declare-fun d!13551 () Bool)

(declare-fun res!35390 () Bool)

(declare-fun e!42592 () Bool)

(assert (=> d!13551 (=> res!35390 e!42592)))

(assert (=> d!13551 (= res!35390 (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13551 (= (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!42592)))

(declare-fun b!65007 () Bool)

(declare-fun e!42593 () Bool)

(assert (=> b!65007 (= e!42592 e!42593)))

(declare-fun res!35391 () Bool)

(assert (=> b!65007 (=> (not res!35391) (not e!42593))))

(assert (=> b!65007 (= res!35391 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65008 () Bool)

(assert (=> b!65008 (= e!42593 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13551 (not res!35390)) b!65007))

(assert (= (and b!65007 res!35391) b!65008))

(assert (=> d!13551 m!59655))

(assert (=> b!65008 m!59481))

(declare-fun m!59717 () Bool)

(assert (=> b!65008 m!59717))

(assert (=> b!64688 d!13551))

(declare-fun d!13553 () Bool)

(declare-fun e!42596 () Bool)

(assert (=> d!13553 e!42596))

(declare-fun c!8922 () Bool)

(assert (=> d!13553 (= c!8922 (and (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27778 () Unit!1783)

(declare-fun choose!353 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) (_ BitVec 32) Int) Unit!1783)

(assert (=> d!13553 (= lt!27778 (choose!353 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(assert (=> d!13553 (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13553 (= (lemmaListMapContainsThenArrayContainsFrom!38 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) lt!27778)))

(declare-fun b!65013 () Bool)

(assert (=> b!65013 (= e!42596 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!65014 () Bool)

(assert (=> b!65014 (= e!42596 (ite (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13553 c!8922) b!65013))

(assert (= (and d!13553 (not c!8922)) b!65014))

(assert (=> d!13553 m!59481))

(declare-fun m!59719 () Bool)

(assert (=> d!13553 m!59719))

(assert (=> d!13553 m!59507))

(assert (=> b!65013 m!59481))

(assert (=> b!65013 m!59499))

(assert (=> b!64688 d!13553))

(declare-fun b!65015 () Bool)

(declare-fun e!42597 () Bool)

(declare-fun call!5323 () Bool)

(assert (=> b!65015 (= e!42597 call!5323)))

(declare-fun bm!5320 () Bool)

(declare-fun c!8923 () Bool)

(assert (=> bm!5320 (= call!5323 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8923 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445) Nil!1445)))))

(declare-fun b!65016 () Bool)

(declare-fun e!42599 () Bool)

(assert (=> b!65016 (= e!42599 (contains!700 Nil!1445 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65017 () Bool)

(assert (=> b!65017 (= e!42597 call!5323)))

(declare-fun d!13555 () Bool)

(declare-fun res!35394 () Bool)

(declare-fun e!42598 () Bool)

(assert (=> d!13555 (=> res!35394 e!42598)))

(assert (=> d!13555 (= res!35394 (bvsge from!355 (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13555 (= (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1445) e!42598)))

(declare-fun b!65018 () Bool)

(declare-fun e!42600 () Bool)

(assert (=> b!65018 (= e!42598 e!42600)))

(declare-fun res!35393 () Bool)

(assert (=> b!65018 (=> (not res!35393) (not e!42600))))

(assert (=> b!65018 (= res!35393 (not e!42599))))

(declare-fun res!35392 () Bool)

(assert (=> b!65018 (=> (not res!35392) (not e!42599))))

(assert (=> b!65018 (= res!35392 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65019 () Bool)

(assert (=> b!65019 (= e!42600 e!42597)))

(assert (=> b!65019 (= c!8923 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13555 (not res!35394)) b!65018))

(assert (= (and b!65018 res!35392) b!65016))

(assert (= (and b!65018 res!35393) b!65019))

(assert (= (and b!65019 c!8923) b!65017))

(assert (= (and b!65019 (not c!8923)) b!65015))

(assert (= (or b!65017 b!65015) bm!5320))

(assert (=> bm!5320 m!59481))

(declare-fun m!59721 () Bool)

(assert (=> bm!5320 m!59721))

(assert (=> b!65016 m!59481))

(assert (=> b!65016 m!59481))

(declare-fun m!59723 () Bool)

(assert (=> b!65016 m!59723))

(assert (=> b!65018 m!59481))

(assert (=> b!65018 m!59481))

(declare-fun m!59725 () Bool)

(assert (=> b!65018 m!59725))

(assert (=> b!65019 m!59481))

(assert (=> b!65019 m!59481))

(assert (=> b!65019 m!59725))

(assert (=> b!64688 d!13555))

(declare-fun bm!5323 () Bool)

(declare-fun call!5326 () Bool)

(assert (=> bm!5323 (= call!5326 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65028 () Bool)

(declare-fun e!42609 () Bool)

(declare-fun e!42607 () Bool)

(assert (=> b!65028 (= e!42609 e!42607)))

(declare-fun c!8926 () Bool)

(assert (=> b!65028 (= c!8926 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65029 () Bool)

(assert (=> b!65029 (= e!42607 call!5326)))

(declare-fun b!65030 () Bool)

(declare-fun e!42608 () Bool)

(assert (=> b!65030 (= e!42608 call!5326)))

(declare-fun b!65031 () Bool)

(assert (=> b!65031 (= e!42607 e!42608)))

(declare-fun lt!27786 () (_ BitVec 64))

(assert (=> b!65031 (= lt!27786 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!27785 () Unit!1783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3789 (_ BitVec 64) (_ BitVec 32)) Unit!1783)

(assert (=> b!65031 (= lt!27785 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000))))

(assert (=> b!65031 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000)))

(declare-fun lt!27787 () Unit!1783)

(assert (=> b!65031 (= lt!27787 lt!27785)))

(declare-fun res!35399 () Bool)

(assert (=> b!65031 (= res!35399 (= (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))) (Found!231 #b00000000000000000000000000000000)))))

(assert (=> b!65031 (=> (not res!35399) (not e!42608))))

(declare-fun d!13557 () Bool)

(declare-fun res!35400 () Bool)

(assert (=> d!13557 (=> res!35400 e!42609)))

(assert (=> d!13557 (= res!35400 (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))) e!42609)))

(assert (= (and d!13557 (not res!35400)) b!65028))

(assert (= (and b!65028 c!8926) b!65031))

(assert (= (and b!65028 (not c!8926)) b!65029))

(assert (= (and b!65031 res!35399) b!65030))

(assert (= (or b!65030 b!65029) bm!5323))

(declare-fun m!59727 () Bool)

(assert (=> bm!5323 m!59727))

(assert (=> b!65028 m!59647))

(assert (=> b!65028 m!59647))

(assert (=> b!65028 m!59653))

(assert (=> b!65031 m!59647))

(declare-fun m!59729 () Bool)

(assert (=> b!65031 m!59729))

(declare-fun m!59731 () Bool)

(assert (=> b!65031 m!59731))

(assert (=> b!65031 m!59647))

(declare-fun m!59733 () Bool)

(assert (=> b!65031 m!59733))

(assert (=> b!64701 d!13557))

(declare-fun d!13559 () Bool)

(assert (=> d!13559 (= (array_inv!1117 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvsge (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64706 d!13559))

(declare-fun d!13561 () Bool)

(assert (=> d!13561 (= (array_inv!1118 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvsge (size!2046 (_values!2105 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64706 d!13561))

(declare-fun mapIsEmpty!3003 () Bool)

(declare-fun mapRes!3003 () Bool)

(assert (=> mapIsEmpty!3003 mapRes!3003))

(declare-fun b!65038 () Bool)

(declare-fun e!42614 () Bool)

(assert (=> b!65038 (= e!42614 tp_is_empty!2427)))

(declare-fun condMapEmpty!3003 () Bool)

(declare-fun mapDefault!3003 () ValueCell!870)

(assert (=> mapNonEmpty!2994 (= condMapEmpty!3003 (= mapRest!2993 ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!3003)))))

(declare-fun e!42615 () Bool)

(assert (=> mapNonEmpty!2994 (= tp!8205 (and e!42615 mapRes!3003))))

(declare-fun b!65039 () Bool)

(assert (=> b!65039 (= e!42615 tp_is_empty!2427)))

(declare-fun mapNonEmpty!3003 () Bool)

(declare-fun tp!8223 () Bool)

(assert (=> mapNonEmpty!3003 (= mapRes!3003 (and tp!8223 e!42614))))

(declare-fun mapKey!3003 () (_ BitVec 32))

(declare-fun mapValue!3003 () ValueCell!870)

(declare-fun mapRest!3003 () (Array (_ BitVec 32) ValueCell!870))

(assert (=> mapNonEmpty!3003 (= mapRest!2993 (store mapRest!3003 mapKey!3003 mapValue!3003))))

(assert (= (and mapNonEmpty!2994 condMapEmpty!3003) mapIsEmpty!3003))

(assert (= (and mapNonEmpty!2994 (not condMapEmpty!3003)) mapNonEmpty!3003))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!870) mapValue!3003)) b!65038))

(assert (= (and mapNonEmpty!2994 ((_ is ValueCellFull!870) mapDefault!3003)) b!65039))

(declare-fun m!59735 () Bool)

(assert (=> mapNonEmpty!3003 m!59735))

(declare-fun mapIsEmpty!3004 () Bool)

(declare-fun mapRes!3004 () Bool)

(assert (=> mapIsEmpty!3004 mapRes!3004))

(declare-fun b!65040 () Bool)

(declare-fun e!42616 () Bool)

(assert (=> b!65040 (= e!42616 tp_is_empty!2427)))

(declare-fun condMapEmpty!3004 () Bool)

(declare-fun mapDefault!3004 () ValueCell!870)

(assert (=> mapNonEmpty!2993 (= condMapEmpty!3004 (= mapRest!2994 ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!3004)))))

(declare-fun e!42617 () Bool)

(assert (=> mapNonEmpty!2993 (= tp!8207 (and e!42617 mapRes!3004))))

(declare-fun b!65041 () Bool)

(assert (=> b!65041 (= e!42617 tp_is_empty!2427)))

(declare-fun mapNonEmpty!3004 () Bool)

(declare-fun tp!8224 () Bool)

(assert (=> mapNonEmpty!3004 (= mapRes!3004 (and tp!8224 e!42616))))

(declare-fun mapKey!3004 () (_ BitVec 32))

(declare-fun mapRest!3004 () (Array (_ BitVec 32) ValueCell!870))

(declare-fun mapValue!3004 () ValueCell!870)

(assert (=> mapNonEmpty!3004 (= mapRest!2994 (store mapRest!3004 mapKey!3004 mapValue!3004))))

(assert (= (and mapNonEmpty!2993 condMapEmpty!3004) mapIsEmpty!3004))

(assert (= (and mapNonEmpty!2993 (not condMapEmpty!3004)) mapNonEmpty!3004))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!870) mapValue!3004)) b!65040))

(assert (= (and mapNonEmpty!2993 ((_ is ValueCellFull!870) mapDefault!3004)) b!65041))

(declare-fun m!59737 () Bool)

(assert (=> mapNonEmpty!3004 m!59737))

(declare-fun b_lambda!2919 () Bool)

(assert (= b_lambda!2917 (or (and b!64706 b_free!2021) (and b!64704 b_free!2023 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))))) b_lambda!2919)))

(check-sat (not b!64986) (not b!64991) (not d!13553) (not d!13527) (not b_next!2021) b_and!3987 (not b!64877) (not b!64987) (not b!65019) (not b!65028) (not bm!5275) (not b!64938) (not bm!5290) (not b!64924) (not b!65000) (not d!13543) (not d!13525) (not b!64897) (not d!13549) (not b_lambda!2915) (not bm!5323) (not bm!5289) (not b!64781) (not b!64878) (not d!13535) (not bm!5295) (not b!64914) (not bm!5293) (not b!65018) (not b!65031) tp_is_empty!2427 (not b!64936) (not b!65016) (not b!64994) (not bm!5278) (not bm!5317) (not bm!5320) b_and!3989 (not b_next!2023) (not b!64783) (not mapNonEmpty!3004) (not b!64923) (not b!65002) (not b!64915) (not b!64998) (not b!64872) (not d!13539) (not b_lambda!2919) (not b!64884) (not d!13547) (not bm!5318) (not b!64906) (not bm!5298) (not b!65013) (not b!64939) (not bm!5277) (not b!65008) (not bm!5292) (not b!64889) (not b!64995) (not d!13541) (not mapNonEmpty!3003) (not bm!5285) (not bm!5313) (not bm!5314) (not bm!5287) (not bm!5291) (not b!64922) (not b!64891) (not bm!5284))
(check-sat b_and!3987 b_and!3989 (not b_next!2021) (not b_next!2023))
(get-model)

(declare-fun b!65042 () Bool)

(declare-fun e!42630 () Bool)

(declare-fun call!5330 () Bool)

(assert (=> b!65042 (= e!42630 (not call!5330))))

(declare-fun b!65043 () Bool)

(declare-fun e!42622 () ListLongMap!1383)

(declare-fun call!5332 () ListLongMap!1383)

(assert (=> b!65043 (= e!42622 call!5332)))

(declare-fun b!65044 () Bool)

(declare-fun e!42629 () Unit!1783)

(declare-fun Unit!1795 () Unit!1783)

(assert (=> b!65044 (= e!42629 Unit!1795)))

(declare-fun bm!5324 () Bool)

(declare-fun call!5328 () ListLongMap!1383)

(assert (=> bm!5324 (= call!5328 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun b!65045 () Bool)

(declare-fun e!42618 () Bool)

(declare-fun call!5333 () Bool)

(assert (=> b!65045 (= e!42618 (not call!5333))))

(declare-fun b!65046 () Bool)

(declare-fun e!42620 () Bool)

(assert (=> b!65046 (= e!42620 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65047 () Bool)

(declare-fun e!42625 () Bool)

(declare-fun e!42628 () Bool)

(assert (=> b!65047 (= e!42625 e!42628)))

(declare-fun res!35409 () Bool)

(assert (=> b!65047 (=> (not res!35409) (not e!42628))))

(declare-fun lt!27793 () ListLongMap!1383)

(assert (=> b!65047 (= res!35409 (contains!698 lt!27793 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5325 () Bool)

(assert (=> bm!5325 (= call!5330 (contains!698 lt!27793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5326 () Bool)

(declare-fun call!5327 () ListLongMap!1383)

(assert (=> bm!5326 (= call!5327 call!5328)))

(declare-fun b!65048 () Bool)

(declare-fun e!42626 () Bool)

(assert (=> b!65048 (= e!42630 e!42626)))

(declare-fun res!35406 () Bool)

(assert (=> b!65048 (= res!35406 call!5330)))

(assert (=> b!65048 (=> (not res!35406) (not e!42626))))

(declare-fun bm!5327 () Bool)

(assert (=> bm!5327 (= call!5332 call!5327)))

(declare-fun b!65050 () Bool)

(declare-fun e!42624 () Bool)

(assert (=> b!65050 (= e!42624 e!42630)))

(declare-fun c!8928 () Bool)

(assert (=> b!65050 (= c!8928 (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65051 () Bool)

(assert (=> b!65051 (= e!42628 (= (apply!70 lt!27793 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)) (get!1096 (select (arr!1812 (_values!2105 newMap!16)) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2122 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2046 (_values!2105 newMap!16))))))

(assert (=> b!65051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65052 () Bool)

(declare-fun e!42619 () ListLongMap!1383)

(declare-fun e!42623 () ListLongMap!1383)

(assert (=> b!65052 (= e!42619 e!42623)))

(declare-fun c!8932 () Bool)

(assert (=> b!65052 (= c!8932 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65053 () Bool)

(declare-fun res!35405 () Bool)

(assert (=> b!65053 (=> (not res!35405) (not e!42624))))

(assert (=> b!65053 (= res!35405 e!42618)))

(declare-fun c!8929 () Bool)

(assert (=> b!65053 (= c!8929 (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65054 () Bool)

(assert (=> b!65054 (= e!42626 (= (apply!70 lt!27793 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2031 newMap!16)))))

(declare-fun b!65055 () Bool)

(declare-fun e!42627 () Bool)

(assert (=> b!65055 (= e!42627 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65056 () Bool)

(declare-fun call!5329 () ListLongMap!1383)

(assert (=> b!65056 (= e!42623 call!5329)))

(declare-fun call!5331 () ListLongMap!1383)

(declare-fun bm!5328 () Bool)

(declare-fun c!8931 () Bool)

(assert (=> bm!5328 (= call!5331 (+!85 (ite c!8931 call!5328 (ite c!8932 call!5327 call!5332)) (ite (or c!8931 c!8932) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 newMap!16)) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 newMap!16)))))))

(declare-fun b!65057 () Bool)

(declare-fun e!42621 () Bool)

(assert (=> b!65057 (= e!42618 e!42621)))

(declare-fun res!35403 () Bool)

(assert (=> b!65057 (= res!35403 call!5333)))

(assert (=> b!65057 (=> (not res!35403) (not e!42621))))

(declare-fun b!65049 () Bool)

(declare-fun c!8927 () Bool)

(assert (=> b!65049 (= c!8927 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65049 (= e!42623 e!42622)))

(declare-fun d!13563 () Bool)

(assert (=> d!13563 e!42624))

(declare-fun res!35404 () Bool)

(assert (=> d!13563 (=> (not res!35404) (not e!42624))))

(assert (=> d!13563 (= res!35404 (or (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))))

(declare-fun lt!27804 () ListLongMap!1383)

(assert (=> d!13563 (= lt!27793 lt!27804)))

(declare-fun lt!27791 () Unit!1783)

(assert (=> d!13563 (= lt!27791 e!42629)))

(declare-fun c!8930 () Bool)

(assert (=> d!13563 (= c!8930 e!42627)))

(declare-fun res!35407 () Bool)

(assert (=> d!13563 (=> (not res!35407) (not e!42627))))

(assert (=> d!13563 (= res!35407 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13563 (= lt!27804 e!42619)))

(assert (=> d!13563 (= c!8931 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13563 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13563 (= (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) lt!27793)))

(declare-fun b!65058 () Bool)

(assert (=> b!65058 (= e!42619 (+!85 call!5331 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 newMap!16))))))

(declare-fun b!65059 () Bool)

(assert (=> b!65059 (= e!42622 call!5329)))

(declare-fun b!65060 () Bool)

(assert (=> b!65060 (= e!42621 (= (apply!70 lt!27793 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2031 newMap!16)))))

(declare-fun bm!5329 () Bool)

(assert (=> bm!5329 (= call!5333 (contains!698 lt!27793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65061 () Bool)

(declare-fun res!35402 () Bool)

(assert (=> b!65061 (=> (not res!35402) (not e!42624))))

(assert (=> b!65061 (= res!35402 e!42625)))

(declare-fun res!35408 () Bool)

(assert (=> b!65061 (=> res!35408 e!42625)))

(assert (=> b!65061 (= res!35408 (not e!42620))))

(declare-fun res!35401 () Bool)

(assert (=> b!65061 (=> (not res!35401) (not e!42620))))

(assert (=> b!65061 (= res!35401 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5330 () Bool)

(assert (=> bm!5330 (= call!5329 call!5331)))

(declare-fun b!65062 () Bool)

(declare-fun lt!27806 () Unit!1783)

(assert (=> b!65062 (= e!42629 lt!27806)))

(declare-fun lt!27789 () ListLongMap!1383)

(assert (=> b!65062 (= lt!27789 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27792 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27808 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27808 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27788 () Unit!1783)

(assert (=> b!65062 (= lt!27788 (addStillContains!46 lt!27789 lt!27792 (zeroValue!2031 newMap!16) lt!27808))))

(assert (=> b!65062 (contains!698 (+!85 lt!27789 (tuple2!2059 lt!27792 (zeroValue!2031 newMap!16))) lt!27808)))

(declare-fun lt!27795 () Unit!1783)

(assert (=> b!65062 (= lt!27795 lt!27788)))

(declare-fun lt!27790 () ListLongMap!1383)

(assert (=> b!65062 (= lt!27790 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27799 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27799 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27803 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27803 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27796 () Unit!1783)

(assert (=> b!65062 (= lt!27796 (addApplyDifferent!46 lt!27790 lt!27799 (minValue!2031 newMap!16) lt!27803))))

(assert (=> b!65062 (= (apply!70 (+!85 lt!27790 (tuple2!2059 lt!27799 (minValue!2031 newMap!16))) lt!27803) (apply!70 lt!27790 lt!27803))))

(declare-fun lt!27805 () Unit!1783)

(assert (=> b!65062 (= lt!27805 lt!27796)))

(declare-fun lt!27794 () ListLongMap!1383)

(assert (=> b!65062 (= lt!27794 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27807 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27800 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27800 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27798 () Unit!1783)

(assert (=> b!65062 (= lt!27798 (addApplyDifferent!46 lt!27794 lt!27807 (zeroValue!2031 newMap!16) lt!27800))))

(assert (=> b!65062 (= (apply!70 (+!85 lt!27794 (tuple2!2059 lt!27807 (zeroValue!2031 newMap!16))) lt!27800) (apply!70 lt!27794 lt!27800))))

(declare-fun lt!27801 () Unit!1783)

(assert (=> b!65062 (= lt!27801 lt!27798)))

(declare-fun lt!27802 () ListLongMap!1383)

(assert (=> b!65062 (= lt!27802 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27797 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27809 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27809 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65062 (= lt!27806 (addApplyDifferent!46 lt!27802 lt!27797 (minValue!2031 newMap!16) lt!27809))))

(assert (=> b!65062 (= (apply!70 (+!85 lt!27802 (tuple2!2059 lt!27797 (minValue!2031 newMap!16))) lt!27809) (apply!70 lt!27802 lt!27809))))

(assert (= (and d!13563 c!8931) b!65058))

(assert (= (and d!13563 (not c!8931)) b!65052))

(assert (= (and b!65052 c!8932) b!65056))

(assert (= (and b!65052 (not c!8932)) b!65049))

(assert (= (and b!65049 c!8927) b!65059))

(assert (= (and b!65049 (not c!8927)) b!65043))

(assert (= (or b!65059 b!65043) bm!5327))

(assert (= (or b!65056 bm!5327) bm!5326))

(assert (= (or b!65056 b!65059) bm!5330))

(assert (= (or b!65058 bm!5326) bm!5324))

(assert (= (or b!65058 bm!5330) bm!5328))

(assert (= (and d!13563 res!35407) b!65055))

(assert (= (and d!13563 c!8930) b!65062))

(assert (= (and d!13563 (not c!8930)) b!65044))

(assert (= (and d!13563 res!35404) b!65061))

(assert (= (and b!65061 res!35401) b!65046))

(assert (= (and b!65061 (not res!35408)) b!65047))

(assert (= (and b!65047 res!35409) b!65051))

(assert (= (and b!65061 res!35402) b!65053))

(assert (= (and b!65053 c!8929) b!65057))

(assert (= (and b!65053 (not c!8929)) b!65045))

(assert (= (and b!65057 res!35403) b!65060))

(assert (= (or b!65057 b!65045) bm!5329))

(assert (= (and b!65053 res!35405) b!65050))

(assert (= (and b!65050 c!8928) b!65048))

(assert (= (and b!65050 (not c!8928)) b!65042))

(assert (= (and b!65048 res!35406) b!65054))

(assert (= (or b!65048 b!65042) bm!5325))

(declare-fun b_lambda!2921 () Bool)

(assert (=> (not b_lambda!2921) (not b!65051)))

(declare-fun tb!1413 () Bool)

(declare-fun t!4887 () Bool)

(assert (=> (and b!64706 (= (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2122 newMap!16)) t!4887) tb!1413))

(declare-fun result!2511 () Bool)

(assert (=> tb!1413 (= result!2511 tp_is_empty!2427)))

(assert (=> b!65051 t!4887))

(declare-fun b_and!3991 () Bool)

(assert (= b_and!3987 (and (=> t!4887 result!2511) b_and!3991)))

(declare-fun t!4889 () Bool)

(declare-fun tb!1415 () Bool)

(assert (=> (and b!64704 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 newMap!16)) t!4889) tb!1415))

(declare-fun result!2513 () Bool)

(assert (= result!2513 result!2511))

(assert (=> b!65051 t!4889))

(declare-fun b_and!3993 () Bool)

(assert (= b_and!3989 (and (=> t!4889 result!2513) b_and!3993)))

(declare-fun m!59739 () Bool)

(assert (=> b!65046 m!59739))

(assert (=> b!65046 m!59739))

(declare-fun m!59741 () Bool)

(assert (=> b!65046 m!59741))

(declare-fun m!59743 () Bool)

(assert (=> bm!5329 m!59743))

(declare-fun m!59745 () Bool)

(assert (=> bm!5324 m!59745))

(declare-fun m!59747 () Bool)

(assert (=> b!65051 m!59747))

(declare-fun m!59749 () Bool)

(assert (=> b!65051 m!59749))

(assert (=> b!65051 m!59739))

(assert (=> b!65051 m!59749))

(assert (=> b!65051 m!59747))

(declare-fun m!59751 () Bool)

(assert (=> b!65051 m!59751))

(assert (=> b!65051 m!59739))

(declare-fun m!59753 () Bool)

(assert (=> b!65051 m!59753))

(declare-fun m!59755 () Bool)

(assert (=> bm!5328 m!59755))

(declare-fun m!59757 () Bool)

(assert (=> b!65062 m!59757))

(declare-fun m!59759 () Bool)

(assert (=> b!65062 m!59759))

(declare-fun m!59761 () Bool)

(assert (=> b!65062 m!59761))

(declare-fun m!59763 () Bool)

(assert (=> b!65062 m!59763))

(declare-fun m!59765 () Bool)

(assert (=> b!65062 m!59765))

(declare-fun m!59767 () Bool)

(assert (=> b!65062 m!59767))

(assert (=> b!65062 m!59759))

(declare-fun m!59769 () Bool)

(assert (=> b!65062 m!59769))

(assert (=> b!65062 m!59739))

(declare-fun m!59771 () Bool)

(assert (=> b!65062 m!59771))

(assert (=> b!65062 m!59763))

(declare-fun m!59773 () Bool)

(assert (=> b!65062 m!59773))

(declare-fun m!59775 () Bool)

(assert (=> b!65062 m!59775))

(declare-fun m!59777 () Bool)

(assert (=> b!65062 m!59777))

(assert (=> b!65062 m!59761))

(declare-fun m!59779 () Bool)

(assert (=> b!65062 m!59779))

(assert (=> b!65062 m!59771))

(declare-fun m!59781 () Bool)

(assert (=> b!65062 m!59781))

(assert (=> b!65062 m!59745))

(declare-fun m!59783 () Bool)

(assert (=> b!65062 m!59783))

(declare-fun m!59785 () Bool)

(assert (=> b!65062 m!59785))

(assert (=> b!65055 m!59739))

(assert (=> b!65055 m!59739))

(assert (=> b!65055 m!59741))

(declare-fun m!59787 () Bool)

(assert (=> d!13563 m!59787))

(declare-fun m!59789 () Bool)

(assert (=> b!65060 m!59789))

(declare-fun m!59791 () Bool)

(assert (=> b!65054 m!59791))

(assert (=> b!65047 m!59739))

(assert (=> b!65047 m!59739))

(declare-fun m!59793 () Bool)

(assert (=> b!65047 m!59793))

(declare-fun m!59795 () Bool)

(assert (=> bm!5325 m!59795))

(declare-fun m!59797 () Bool)

(assert (=> b!65058 m!59797))

(assert (=> d!13539 d!13563))

(declare-fun d!13565 () Bool)

(assert (=> d!13565 (= (inRange!0 (ite c!8882 (ite c!8886 (index!3052 lt!27689) (ite c!8895 (index!3051 lt!27685) (index!3054 lt!27685))) (ite c!8890 (index!3052 lt!27679) (ite c!8891 (index!3051 lt!27687) (index!3054 lt!27687)))) (mask!6044 newMap!16)) (and (bvsge (ite c!8882 (ite c!8886 (index!3052 lt!27689) (ite c!8895 (index!3051 lt!27685) (index!3054 lt!27685))) (ite c!8890 (index!3052 lt!27679) (ite c!8891 (index!3051 lt!27687) (index!3054 lt!27687)))) #b00000000000000000000000000000000) (bvslt (ite c!8882 (ite c!8886 (index!3052 lt!27689) (ite c!8895 (index!3051 lt!27685) (index!3054 lt!27685))) (ite c!8890 (index!3052 lt!27679) (ite c!8891 (index!3051 lt!27687) (index!3054 lt!27687)))) (bvadd (mask!6044 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5295 d!13565))

(declare-fun d!13567 () Bool)

(assert (=> d!13567 (= (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (and (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65019 d!13567))

(declare-fun b!65063 () Bool)

(declare-fun e!42643 () Bool)

(declare-fun call!5337 () Bool)

(assert (=> b!65063 (= e!42643 (not call!5337))))

(declare-fun b!65064 () Bool)

(declare-fun e!42635 () ListLongMap!1383)

(declare-fun call!5339 () ListLongMap!1383)

(assert (=> b!65064 (= e!42635 call!5339)))

(declare-fun b!65065 () Bool)

(declare-fun e!42642 () Unit!1783)

(declare-fun Unit!1796 () Unit!1783)

(assert (=> b!65065 (= e!42642 Unit!1796)))

(declare-fun call!5335 () ListLongMap!1383)

(declare-fun bm!5331 () Bool)

(assert (=> bm!5331 (= call!5335 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun b!65066 () Bool)

(declare-fun e!42631 () Bool)

(declare-fun call!5340 () Bool)

(assert (=> b!65066 (= e!42631 (not call!5340))))

(declare-fun b!65067 () Bool)

(declare-fun e!42633 () Bool)

(assert (=> b!65067 (= e!42633 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65068 () Bool)

(declare-fun e!42638 () Bool)

(declare-fun e!42641 () Bool)

(assert (=> b!65068 (= e!42638 e!42641)))

(declare-fun res!35418 () Bool)

(assert (=> b!65068 (=> (not res!35418) (not e!42641))))

(declare-fun lt!27815 () ListLongMap!1383)

(assert (=> b!65068 (= res!35418 (contains!698 lt!27815 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5332 () Bool)

(assert (=> bm!5332 (= call!5337 (contains!698 lt!27815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5333 () Bool)

(declare-fun call!5334 () ListLongMap!1383)

(assert (=> bm!5333 (= call!5334 call!5335)))

(declare-fun b!65069 () Bool)

(declare-fun e!42639 () Bool)

(assert (=> b!65069 (= e!42643 e!42639)))

(declare-fun res!35415 () Bool)

(assert (=> b!65069 (= res!35415 call!5337)))

(assert (=> b!65069 (=> (not res!35415) (not e!42639))))

(declare-fun bm!5334 () Bool)

(assert (=> bm!5334 (= call!5339 call!5334)))

(declare-fun b!65071 () Bool)

(declare-fun e!42637 () Bool)

(assert (=> b!65071 (= e!42637 e!42643)))

(declare-fun c!8934 () Bool)

(assert (=> b!65071 (= c!8934 (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65072 () Bool)

(assert (=> b!65072 (= e!42641 (= (apply!70 lt!27815 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)) (get!1096 (select (arr!1812 (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2122 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2046 (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))))))))

(assert (=> b!65072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65073 () Bool)

(declare-fun e!42632 () ListLongMap!1383)

(declare-fun e!42636 () ListLongMap!1383)

(assert (=> b!65073 (= e!42632 e!42636)))

(declare-fun c!8938 () Bool)

(assert (=> b!65073 (= c!8938 (and (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65074 () Bool)

(declare-fun res!35414 () Bool)

(assert (=> b!65074 (=> (not res!35414) (not e!42637))))

(assert (=> b!65074 (= res!35414 e!42631)))

(declare-fun c!8935 () Bool)

(assert (=> b!65074 (= c!8935 (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65075 () Bool)

(assert (=> b!65075 (= e!42639 (= (apply!70 lt!27815 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16))))))

(declare-fun b!65076 () Bool)

(declare-fun e!42640 () Bool)

(assert (=> b!65076 (= e!42640 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65077 () Bool)

(declare-fun call!5336 () ListLongMap!1383)

(assert (=> b!65077 (= e!42636 call!5336)))

(declare-fun c!8937 () Bool)

(declare-fun bm!5335 () Bool)

(declare-fun call!5338 () ListLongMap!1383)

(assert (=> bm!5335 (= call!5338 (+!85 (ite c!8937 call!5335 (ite c!8938 call!5334 call!5339)) (ite (or c!8937 c!8938) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16))))))))

(declare-fun b!65078 () Bool)

(declare-fun e!42634 () Bool)

(assert (=> b!65078 (= e!42631 e!42634)))

(declare-fun res!35412 () Bool)

(assert (=> b!65078 (= res!35412 call!5340)))

(assert (=> b!65078 (=> (not res!35412) (not e!42634))))

(declare-fun b!65070 () Bool)

(declare-fun c!8933 () Bool)

(assert (=> b!65070 (= c!8933 (and (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65070 (= e!42636 e!42635)))

(declare-fun d!13569 () Bool)

(assert (=> d!13569 e!42637))

(declare-fun res!35413 () Bool)

(assert (=> d!13569 (=> (not res!35413) (not e!42637))))

(assert (=> d!13569 (= res!35413 (or (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))))

(declare-fun lt!27826 () ListLongMap!1383)

(assert (=> d!13569 (= lt!27815 lt!27826)))

(declare-fun lt!27813 () Unit!1783)

(assert (=> d!13569 (= lt!27813 e!42642)))

(declare-fun c!8936 () Bool)

(assert (=> d!13569 (= c!8936 e!42640)))

(declare-fun res!35416 () Bool)

(assert (=> d!13569 (=> (not res!35416) (not e!42640))))

(assert (=> d!13569 (= res!35416 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13569 (= lt!27826 e!42632)))

(assert (=> d!13569 (= c!8937 (and (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13569 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13569 (= (getCurrentListMap!409 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) lt!27815)))

(declare-fun b!65079 () Bool)

(assert (=> b!65079 (= e!42632 (+!85 call!5338 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)))))))

(declare-fun b!65080 () Bool)

(assert (=> b!65080 (= e!42635 call!5336)))

(declare-fun b!65081 () Bool)

(assert (=> b!65081 (= e!42634 (= (apply!70 lt!27815 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16))))))

(declare-fun bm!5336 () Bool)

(assert (=> bm!5336 (= call!5340 (contains!698 lt!27815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65082 () Bool)

(declare-fun res!35411 () Bool)

(assert (=> b!65082 (=> (not res!35411) (not e!42637))))

(assert (=> b!65082 (= res!35411 e!42638)))

(declare-fun res!35417 () Bool)

(assert (=> b!65082 (=> res!35417 e!42638)))

(assert (=> b!65082 (= res!35417 (not e!42633))))

(declare-fun res!35410 () Bool)

(assert (=> b!65082 (=> (not res!35410) (not e!42633))))

(assert (=> b!65082 (= res!35410 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5337 () Bool)

(assert (=> bm!5337 (= call!5336 call!5338)))

(declare-fun b!65083 () Bool)

(declare-fun lt!27828 () Unit!1783)

(assert (=> b!65083 (= e!42642 lt!27828)))

(declare-fun lt!27811 () ListLongMap!1383)

(assert (=> b!65083 (= lt!27811 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27814 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27830 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27830 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27810 () Unit!1783)

(assert (=> b!65083 (= lt!27810 (addStillContains!46 lt!27811 lt!27814 (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) lt!27830))))

(assert (=> b!65083 (contains!698 (+!85 lt!27811 (tuple2!2059 lt!27814 (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)))) lt!27830)))

(declare-fun lt!27817 () Unit!1783)

(assert (=> b!65083 (= lt!27817 lt!27810)))

(declare-fun lt!27812 () ListLongMap!1383)

(assert (=> b!65083 (= lt!27812 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27821 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27825 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27825 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27818 () Unit!1783)

(assert (=> b!65083 (= lt!27818 (addApplyDifferent!46 lt!27812 lt!27821 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) lt!27825))))

(assert (=> b!65083 (= (apply!70 (+!85 lt!27812 (tuple2!2059 lt!27821 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)))) lt!27825) (apply!70 lt!27812 lt!27825))))

(declare-fun lt!27827 () Unit!1783)

(assert (=> b!65083 (= lt!27827 lt!27818)))

(declare-fun lt!27816 () ListLongMap!1383)

(assert (=> b!65083 (= lt!27816 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27829 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27822 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27822 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27820 () Unit!1783)

(assert (=> b!65083 (= lt!27820 (addApplyDifferent!46 lt!27816 lt!27829 (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) lt!27822))))

(assert (=> b!65083 (= (apply!70 (+!85 lt!27816 (tuple2!2059 lt!27829 (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)))) lt!27822) (apply!70 lt!27816 lt!27822))))

(declare-fun lt!27823 () Unit!1783)

(assert (=> b!65083 (= lt!27823 lt!27820)))

(declare-fun lt!27824 () ListLongMap!1383)

(assert (=> b!65083 (= lt!27824 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite (or c!8894 c!8882) (_values!2105 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16)))) (mask!6044 newMap!16) (ite c!8894 (ite c!8887 lt!27699 lt!27678) (extraKeys!1995 newMap!16)) (ite (and c!8894 c!8887) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2031 newMap!16)) (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27819 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27819 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27831 () (_ BitVec 64))

(assert (=> b!65083 (= lt!27831 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65083 (= lt!27828 (addApplyDifferent!46 lt!27824 lt!27819 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)) lt!27831))))

(assert (=> b!65083 (= (apply!70 (+!85 lt!27824 (tuple2!2059 lt!27819 (ite c!8894 (ite c!8887 (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2031 newMap!16)))) lt!27831) (apply!70 lt!27824 lt!27831))))

(assert (= (and d!13569 c!8937) b!65079))

(assert (= (and d!13569 (not c!8937)) b!65073))

(assert (= (and b!65073 c!8938) b!65077))

(assert (= (and b!65073 (not c!8938)) b!65070))

(assert (= (and b!65070 c!8933) b!65080))

(assert (= (and b!65070 (not c!8933)) b!65064))

(assert (= (or b!65080 b!65064) bm!5334))

(assert (= (or b!65077 bm!5334) bm!5333))

(assert (= (or b!65077 b!65080) bm!5337))

(assert (= (or b!65079 bm!5333) bm!5331))

(assert (= (or b!65079 bm!5337) bm!5335))

(assert (= (and d!13569 res!35416) b!65076))

(assert (= (and d!13569 c!8936) b!65083))

(assert (= (and d!13569 (not c!8936)) b!65065))

(assert (= (and d!13569 res!35413) b!65082))

(assert (= (and b!65082 res!35410) b!65067))

(assert (= (and b!65082 (not res!35417)) b!65068))

(assert (= (and b!65068 res!35418) b!65072))

(assert (= (and b!65082 res!35411) b!65074))

(assert (= (and b!65074 c!8935) b!65078))

(assert (= (and b!65074 (not c!8935)) b!65066))

(assert (= (and b!65078 res!35412) b!65081))

(assert (= (or b!65078 b!65066) bm!5336))

(assert (= (and b!65074 res!35414) b!65071))

(assert (= (and b!65071 c!8934) b!65069))

(assert (= (and b!65071 (not c!8934)) b!65063))

(assert (= (and b!65069 res!35415) b!65075))

(assert (= (or b!65069 b!65063) bm!5332))

(declare-fun b_lambda!2923 () Bool)

(assert (=> (not b_lambda!2923) (not b!65072)))

(assert (=> b!65072 t!4887))

(declare-fun b_and!3995 () Bool)

(assert (= b_and!3991 (and (=> t!4887 result!2511) b_and!3995)))

(assert (=> b!65072 t!4889))

(declare-fun b_and!3997 () Bool)

(assert (= b_and!3993 (and (=> t!4889 result!2513) b_and!3997)))

(assert (=> b!65067 m!59739))

(assert (=> b!65067 m!59739))

(assert (=> b!65067 m!59741))

(declare-fun m!59799 () Bool)

(assert (=> bm!5336 m!59799))

(declare-fun m!59801 () Bool)

(assert (=> bm!5331 m!59801))

(assert (=> b!65072 m!59747))

(declare-fun m!59803 () Bool)

(assert (=> b!65072 m!59803))

(assert (=> b!65072 m!59739))

(assert (=> b!65072 m!59803))

(assert (=> b!65072 m!59747))

(declare-fun m!59805 () Bool)

(assert (=> b!65072 m!59805))

(assert (=> b!65072 m!59739))

(declare-fun m!59807 () Bool)

(assert (=> b!65072 m!59807))

(declare-fun m!59809 () Bool)

(assert (=> bm!5335 m!59809))

(declare-fun m!59811 () Bool)

(assert (=> b!65083 m!59811))

(declare-fun m!59813 () Bool)

(assert (=> b!65083 m!59813))

(declare-fun m!59815 () Bool)

(assert (=> b!65083 m!59815))

(declare-fun m!59817 () Bool)

(assert (=> b!65083 m!59817))

(declare-fun m!59819 () Bool)

(assert (=> b!65083 m!59819))

(declare-fun m!59821 () Bool)

(assert (=> b!65083 m!59821))

(assert (=> b!65083 m!59813))

(declare-fun m!59823 () Bool)

(assert (=> b!65083 m!59823))

(assert (=> b!65083 m!59739))

(declare-fun m!59825 () Bool)

(assert (=> b!65083 m!59825))

(assert (=> b!65083 m!59817))

(declare-fun m!59827 () Bool)

(assert (=> b!65083 m!59827))

(declare-fun m!59829 () Bool)

(assert (=> b!65083 m!59829))

(declare-fun m!59831 () Bool)

(assert (=> b!65083 m!59831))

(assert (=> b!65083 m!59815))

(declare-fun m!59833 () Bool)

(assert (=> b!65083 m!59833))

(assert (=> b!65083 m!59825))

(declare-fun m!59835 () Bool)

(assert (=> b!65083 m!59835))

(assert (=> b!65083 m!59801))

(declare-fun m!59837 () Bool)

(assert (=> b!65083 m!59837))

(declare-fun m!59839 () Bool)

(assert (=> b!65083 m!59839))

(assert (=> b!65076 m!59739))

(assert (=> b!65076 m!59739))

(assert (=> b!65076 m!59741))

(assert (=> d!13569 m!59787))

(declare-fun m!59841 () Bool)

(assert (=> b!65081 m!59841))

(declare-fun m!59843 () Bool)

(assert (=> b!65075 m!59843))

(assert (=> b!65068 m!59739))

(assert (=> b!65068 m!59739))

(declare-fun m!59845 () Bool)

(assert (=> b!65068 m!59845))

(declare-fun m!59847 () Bool)

(assert (=> bm!5332 m!59847))

(declare-fun m!59849 () Bool)

(assert (=> b!65079 m!59849))

(assert (=> bm!5293 d!13569))

(declare-fun b!65084 () Bool)

(declare-fun e!42656 () Bool)

(declare-fun call!5344 () Bool)

(assert (=> b!65084 (= e!42656 (not call!5344))))

(declare-fun b!65085 () Bool)

(declare-fun e!42648 () ListLongMap!1383)

(declare-fun call!5346 () ListLongMap!1383)

(assert (=> b!65085 (= e!42648 call!5346)))

(declare-fun b!65086 () Bool)

(declare-fun e!42655 () Unit!1783)

(declare-fun Unit!1797 () Unit!1783)

(assert (=> b!65086 (= e!42655 Unit!1797)))

(declare-fun call!5342 () ListLongMap!1383)

(declare-fun bm!5338 () Bool)

(assert (=> bm!5338 (= call!5342 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun b!65087 () Bool)

(declare-fun e!42644 () Bool)

(declare-fun call!5347 () Bool)

(assert (=> b!65087 (= e!42644 (not call!5347))))

(declare-fun b!65088 () Bool)

(declare-fun e!42646 () Bool)

(assert (=> b!65088 (= e!42646 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65089 () Bool)

(declare-fun e!42651 () Bool)

(declare-fun e!42654 () Bool)

(assert (=> b!65089 (= e!42651 e!42654)))

(declare-fun res!35427 () Bool)

(assert (=> b!65089 (=> (not res!35427) (not e!42654))))

(declare-fun lt!27837 () ListLongMap!1383)

(assert (=> b!65089 (= res!35427 (contains!698 lt!27837 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5339 () Bool)

(assert (=> bm!5339 (= call!5344 (contains!698 lt!27837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5340 () Bool)

(declare-fun call!5341 () ListLongMap!1383)

(assert (=> bm!5340 (= call!5341 call!5342)))

(declare-fun b!65090 () Bool)

(declare-fun e!42652 () Bool)

(assert (=> b!65090 (= e!42656 e!42652)))

(declare-fun res!35424 () Bool)

(assert (=> b!65090 (= res!35424 call!5344)))

(assert (=> b!65090 (=> (not res!35424) (not e!42652))))

(declare-fun bm!5341 () Bool)

(assert (=> bm!5341 (= call!5346 call!5341)))

(declare-fun b!65092 () Bool)

(declare-fun e!42650 () Bool)

(assert (=> b!65092 (= e!42650 e!42656)))

(declare-fun c!8940 () Bool)

(assert (=> b!65092 (= c!8940 (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65093 () Bool)

(assert (=> b!65093 (= e!42654 (= (apply!70 lt!27837 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)) (get!1096 (select (arr!1812 (ite c!8894 (_values!2105 newMap!16) lt!27700)) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2122 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2046 (ite c!8894 (_values!2105 newMap!16) lt!27700))))))

(assert (=> b!65093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65094 () Bool)

(declare-fun e!42645 () ListLongMap!1383)

(declare-fun e!42649 () ListLongMap!1383)

(assert (=> b!65094 (= e!42645 e!42649)))

(declare-fun c!8944 () Bool)

(assert (=> b!65094 (= c!8944 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65095 () Bool)

(declare-fun res!35423 () Bool)

(assert (=> b!65095 (=> (not res!35423) (not e!42650))))

(assert (=> b!65095 (= res!35423 e!42644)))

(declare-fun c!8941 () Bool)

(assert (=> b!65095 (= c!8941 (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!65096 () Bool)

(assert (=> b!65096 (= e!42652 (= (apply!70 lt!27837 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2031 newMap!16)))))

(declare-fun b!65097 () Bool)

(declare-fun e!42653 () Bool)

(assert (=> b!65097 (= e!42653 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65098 () Bool)

(declare-fun call!5343 () ListLongMap!1383)

(assert (=> b!65098 (= e!42649 call!5343)))

(declare-fun call!5345 () ListLongMap!1383)

(declare-fun bm!5342 () Bool)

(declare-fun c!8943 () Bool)

(assert (=> bm!5342 (= call!5345 (+!85 (ite c!8943 call!5342 (ite c!8944 call!5341 call!5346)) (ite (or c!8943 c!8944) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 newMap!16)) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 newMap!16)))))))

(declare-fun b!65099 () Bool)

(declare-fun e!42647 () Bool)

(assert (=> b!65099 (= e!42644 e!42647)))

(declare-fun res!35421 () Bool)

(assert (=> b!65099 (= res!35421 call!5347)))

(assert (=> b!65099 (=> (not res!35421) (not e!42647))))

(declare-fun b!65091 () Bool)

(declare-fun c!8939 () Bool)

(assert (=> b!65091 (= c!8939 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65091 (= e!42649 e!42648)))

(declare-fun d!13571 () Bool)

(assert (=> d!13571 e!42650))

(declare-fun res!35422 () Bool)

(assert (=> d!13571 (=> (not res!35422) (not e!42650))))

(assert (=> d!13571 (= res!35422 (or (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))))

(declare-fun lt!27848 () ListLongMap!1383)

(assert (=> d!13571 (= lt!27837 lt!27848)))

(declare-fun lt!27835 () Unit!1783)

(assert (=> d!13571 (= lt!27835 e!42655)))

(declare-fun c!8942 () Bool)

(assert (=> d!13571 (= c!8942 e!42653)))

(declare-fun res!35425 () Bool)

(assert (=> d!13571 (=> (not res!35425) (not e!42653))))

(assert (=> d!13571 (= res!35425 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13571 (= lt!27848 e!42645)))

(assert (=> d!13571 (= c!8943 (and (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1995 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13571 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13571 (= (getCurrentListMap!409 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) lt!27837)))

(declare-fun b!65100 () Bool)

(assert (=> b!65100 (= e!42645 (+!85 call!5345 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 newMap!16))))))

(declare-fun b!65101 () Bool)

(assert (=> b!65101 (= e!42648 call!5343)))

(declare-fun b!65102 () Bool)

(assert (=> b!65102 (= e!42647 (= (apply!70 lt!27837 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2031 newMap!16)))))

(declare-fun bm!5343 () Bool)

(assert (=> bm!5343 (= call!5347 (contains!698 lt!27837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65103 () Bool)

(declare-fun res!35420 () Bool)

(assert (=> b!65103 (=> (not res!35420) (not e!42650))))

(assert (=> b!65103 (= res!35420 e!42651)))

(declare-fun res!35426 () Bool)

(assert (=> b!65103 (=> res!35426 e!42651)))

(assert (=> b!65103 (= res!35426 (not e!42646))))

(declare-fun res!35419 () Bool)

(assert (=> b!65103 (=> (not res!35419) (not e!42646))))

(assert (=> b!65103 (= res!35419 (bvslt #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(declare-fun bm!5344 () Bool)

(assert (=> bm!5344 (= call!5343 call!5345)))

(declare-fun b!65104 () Bool)

(declare-fun lt!27850 () Unit!1783)

(assert (=> b!65104 (= e!42655 lt!27850)))

(declare-fun lt!27833 () ListLongMap!1383)

(assert (=> b!65104 (= lt!27833 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27836 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27852 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27852 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27832 () Unit!1783)

(assert (=> b!65104 (= lt!27832 (addStillContains!46 lt!27833 lt!27836 (zeroValue!2031 newMap!16) lt!27852))))

(assert (=> b!65104 (contains!698 (+!85 lt!27833 (tuple2!2059 lt!27836 (zeroValue!2031 newMap!16))) lt!27852)))

(declare-fun lt!27839 () Unit!1783)

(assert (=> b!65104 (= lt!27839 lt!27832)))

(declare-fun lt!27834 () ListLongMap!1383)

(assert (=> b!65104 (= lt!27834 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27843 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27847 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27847 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27840 () Unit!1783)

(assert (=> b!65104 (= lt!27840 (addApplyDifferent!46 lt!27834 lt!27843 (minValue!2031 newMap!16) lt!27847))))

(assert (=> b!65104 (= (apply!70 (+!85 lt!27834 (tuple2!2059 lt!27843 (minValue!2031 newMap!16))) lt!27847) (apply!70 lt!27834 lt!27847))))

(declare-fun lt!27849 () Unit!1783)

(assert (=> b!65104 (= lt!27849 lt!27840)))

(declare-fun lt!27838 () ListLongMap!1383)

(assert (=> b!65104 (= lt!27838 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27851 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27844 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27844 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27842 () Unit!1783)

(assert (=> b!65104 (= lt!27842 (addApplyDifferent!46 lt!27838 lt!27851 (zeroValue!2031 newMap!16) lt!27844))))

(assert (=> b!65104 (= (apply!70 (+!85 lt!27838 (tuple2!2059 lt!27851 (zeroValue!2031 newMap!16))) lt!27844) (apply!70 lt!27838 lt!27844))))

(declare-fun lt!27845 () Unit!1783)

(assert (=> b!65104 (= lt!27845 lt!27842)))

(declare-fun lt!27846 () ListLongMap!1383)

(assert (=> b!65104 (= lt!27846 (getCurrentListMapNoExtraKeys!48 (_keys!3760 newMap!16) (ite c!8894 (_values!2105 newMap!16) lt!27700) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27841 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27853 () (_ BitVec 64))

(assert (=> b!65104 (= lt!27853 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65104 (= lt!27850 (addApplyDifferent!46 lt!27846 lt!27841 (minValue!2031 newMap!16) lt!27853))))

(assert (=> b!65104 (= (apply!70 (+!85 lt!27846 (tuple2!2059 lt!27841 (minValue!2031 newMap!16))) lt!27853) (apply!70 lt!27846 lt!27853))))

(assert (= (and d!13571 c!8943) b!65100))

(assert (= (and d!13571 (not c!8943)) b!65094))

(assert (= (and b!65094 c!8944) b!65098))

(assert (= (and b!65094 (not c!8944)) b!65091))

(assert (= (and b!65091 c!8939) b!65101))

(assert (= (and b!65091 (not c!8939)) b!65085))

(assert (= (or b!65101 b!65085) bm!5341))

(assert (= (or b!65098 bm!5341) bm!5340))

(assert (= (or b!65098 b!65101) bm!5344))

(assert (= (or b!65100 bm!5340) bm!5338))

(assert (= (or b!65100 bm!5344) bm!5342))

(assert (= (and d!13571 res!35425) b!65097))

(assert (= (and d!13571 c!8942) b!65104))

(assert (= (and d!13571 (not c!8942)) b!65086))

(assert (= (and d!13571 res!35422) b!65103))

(assert (= (and b!65103 res!35419) b!65088))

(assert (= (and b!65103 (not res!35426)) b!65089))

(assert (= (and b!65089 res!35427) b!65093))

(assert (= (and b!65103 res!35420) b!65095))

(assert (= (and b!65095 c!8941) b!65099))

(assert (= (and b!65095 (not c!8941)) b!65087))

(assert (= (and b!65099 res!35421) b!65102))

(assert (= (or b!65099 b!65087) bm!5343))

(assert (= (and b!65095 res!35423) b!65092))

(assert (= (and b!65092 c!8940) b!65090))

(assert (= (and b!65092 (not c!8940)) b!65084))

(assert (= (and b!65090 res!35424) b!65096))

(assert (= (or b!65090 b!65084) bm!5339))

(declare-fun b_lambda!2925 () Bool)

(assert (=> (not b_lambda!2925) (not b!65093)))

(assert (=> b!65093 t!4887))

(declare-fun b_and!3999 () Bool)

(assert (= b_and!3995 (and (=> t!4887 result!2511) b_and!3999)))

(assert (=> b!65093 t!4889))

(declare-fun b_and!4001 () Bool)

(assert (= b_and!3997 (and (=> t!4889 result!2513) b_and!4001)))

(assert (=> b!65088 m!59739))

(assert (=> b!65088 m!59739))

(assert (=> b!65088 m!59741))

(declare-fun m!59851 () Bool)

(assert (=> bm!5343 m!59851))

(declare-fun m!59853 () Bool)

(assert (=> bm!5338 m!59853))

(assert (=> b!65093 m!59747))

(declare-fun m!59855 () Bool)

(assert (=> b!65093 m!59855))

(assert (=> b!65093 m!59739))

(assert (=> b!65093 m!59855))

(assert (=> b!65093 m!59747))

(declare-fun m!59857 () Bool)

(assert (=> b!65093 m!59857))

(assert (=> b!65093 m!59739))

(declare-fun m!59859 () Bool)

(assert (=> b!65093 m!59859))

(declare-fun m!59861 () Bool)

(assert (=> bm!5342 m!59861))

(declare-fun m!59863 () Bool)

(assert (=> b!65104 m!59863))

(declare-fun m!59865 () Bool)

(assert (=> b!65104 m!59865))

(declare-fun m!59867 () Bool)

(assert (=> b!65104 m!59867))

(declare-fun m!59869 () Bool)

(assert (=> b!65104 m!59869))

(declare-fun m!59871 () Bool)

(assert (=> b!65104 m!59871))

(declare-fun m!59873 () Bool)

(assert (=> b!65104 m!59873))

(assert (=> b!65104 m!59865))

(declare-fun m!59875 () Bool)

(assert (=> b!65104 m!59875))

(assert (=> b!65104 m!59739))

(declare-fun m!59877 () Bool)

(assert (=> b!65104 m!59877))

(assert (=> b!65104 m!59869))

(declare-fun m!59879 () Bool)

(assert (=> b!65104 m!59879))

(declare-fun m!59881 () Bool)

(assert (=> b!65104 m!59881))

(declare-fun m!59883 () Bool)

(assert (=> b!65104 m!59883))

(assert (=> b!65104 m!59867))

(declare-fun m!59885 () Bool)

(assert (=> b!65104 m!59885))

(assert (=> b!65104 m!59877))

(declare-fun m!59887 () Bool)

(assert (=> b!65104 m!59887))

(assert (=> b!65104 m!59853))

(declare-fun m!59889 () Bool)

(assert (=> b!65104 m!59889))

(declare-fun m!59891 () Bool)

(assert (=> b!65104 m!59891))

(assert (=> b!65097 m!59739))

(assert (=> b!65097 m!59739))

(assert (=> b!65097 m!59741))

(assert (=> d!13571 m!59787))

(declare-fun m!59893 () Bool)

(assert (=> b!65102 m!59893))

(declare-fun m!59895 () Bool)

(assert (=> b!65096 m!59895))

(assert (=> b!65089 m!59739))

(assert (=> b!65089 m!59739))

(declare-fun m!59897 () Bool)

(assert (=> b!65089 m!59897))

(declare-fun m!59899 () Bool)

(assert (=> bm!5339 m!59899))

(declare-fun m!59901 () Bool)

(assert (=> b!65100 m!59901))

(assert (=> bm!5285 d!13571))

(assert (=> b!64878 d!13563))

(declare-fun d!13573 () Bool)

(declare-fun e!42659 () Bool)

(assert (=> d!13573 e!42659))

(declare-fun res!35433 () Bool)

(assert (=> d!13573 (=> (not res!35433) (not e!42659))))

(declare-fun lt!27865 () ListLongMap!1383)

(assert (=> d!13573 (= res!35433 (contains!698 lt!27865 (_1!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!27863 () List!1449)

(assert (=> d!13573 (= lt!27865 (ListLongMap!1384 lt!27863))))

(declare-fun lt!27862 () Unit!1783)

(declare-fun lt!27864 () Unit!1783)

(assert (=> d!13573 (= lt!27862 lt!27864)))

(assert (=> d!13573 (= (getValueByKey!128 lt!27863 (_1!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!133 (_2!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!45 (List!1449 (_ BitVec 64) V!2883) Unit!1783)

(assert (=> d!13573 (= lt!27864 (lemmaContainsTupThenGetReturnValue!45 lt!27863 (_1!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!48 (List!1449 (_ BitVec 64) V!2883) List!1449)

(assert (=> d!13573 (= lt!27863 (insertStrictlySorted!48 (toList!707 e!42519) (_1!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13573 (= (+!85 e!42519 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!27865)))

(declare-fun b!65109 () Bool)

(declare-fun res!35432 () Bool)

(assert (=> b!65109 (=> (not res!35432) (not e!42659))))

(assert (=> b!65109 (= res!35432 (= (getValueByKey!128 (toList!707 lt!27865) (_1!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!133 (_2!1040 (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!65110 () Bool)

(declare-fun contains!701 (List!1449 tuple2!2058) Bool)

(assert (=> b!65110 (= e!42659 (contains!701 (toList!707 lt!27865) (ite c!8894 (ite c!8887 (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13573 res!35433) b!65109))

(assert (= (and b!65109 res!35432) b!65110))

(declare-fun m!59903 () Bool)

(assert (=> d!13573 m!59903))

(declare-fun m!59905 () Bool)

(assert (=> d!13573 m!59905))

(declare-fun m!59907 () Bool)

(assert (=> d!13573 m!59907))

(declare-fun m!59909 () Bool)

(assert (=> d!13573 m!59909))

(declare-fun m!59911 () Bool)

(assert (=> b!65109 m!59911))

(declare-fun m!59913 () Bool)

(assert (=> b!65110 m!59913))

(assert (=> bm!5284 d!13573))

(declare-fun d!13575 () Bool)

(declare-fun res!35434 () Bool)

(declare-fun e!42660 () Bool)

(assert (=> d!13575 (=> res!35434 e!42660)))

(assert (=> d!13575 (= res!35434 (= (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13575 (= (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42660)))

(declare-fun b!65111 () Bool)

(declare-fun e!42661 () Bool)

(assert (=> b!65111 (= e!42660 e!42661)))

(declare-fun res!35435 () Bool)

(assert (=> b!65111 (=> (not res!35435) (not e!42661))))

(assert (=> b!65111 (= res!35435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65112 () Bool)

(assert (=> b!65112 (= e!42661 (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13575 (not res!35434)) b!65111))

(assert (= (and b!65111 res!35435) b!65112))

(assert (=> d!13575 m!59739))

(assert (=> b!65112 m!59481))

(declare-fun m!59915 () Bool)

(assert (=> b!65112 m!59915))

(assert (=> bm!5292 d!13575))

(declare-fun b!65113 () Bool)

(declare-fun e!42662 () Bool)

(declare-fun call!5348 () Bool)

(assert (=> b!65113 (= e!42662 call!5348)))

(declare-fun bm!5345 () Bool)

(declare-fun c!8945 () Bool)

(assert (=> bm!5345 (= call!5348 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8945 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8923 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445) Nil!1445)) (ite c!8923 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445) Nil!1445))))))

(declare-fun e!42664 () Bool)

(declare-fun b!65114 () Bool)

(assert (=> b!65114 (= e!42664 (contains!700 (ite c!8923 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445) Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!65115 () Bool)

(assert (=> b!65115 (= e!42662 call!5348)))

(declare-fun d!13577 () Bool)

(declare-fun res!35438 () Bool)

(declare-fun e!42663 () Bool)

(assert (=> d!13577 (=> res!35438 e!42663)))

(assert (=> d!13577 (= res!35438 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13577 (= (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8923 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445) Nil!1445)) e!42663)))

(declare-fun b!65116 () Bool)

(declare-fun e!42665 () Bool)

(assert (=> b!65116 (= e!42663 e!42665)))

(declare-fun res!35437 () Bool)

(assert (=> b!65116 (=> (not res!35437) (not e!42665))))

(assert (=> b!65116 (= res!35437 (not e!42664))))

(declare-fun res!35436 () Bool)

(assert (=> b!65116 (=> (not res!35436) (not e!42664))))

(assert (=> b!65116 (= res!35436 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!65117 () Bool)

(assert (=> b!65117 (= e!42665 e!42662)))

(assert (=> b!65117 (= c!8945 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!13577 (not res!35438)) b!65116))

(assert (= (and b!65116 res!35436) b!65114))

(assert (= (and b!65116 res!35437) b!65117))

(assert (= (and b!65117 c!8945) b!65115))

(assert (= (and b!65117 (not c!8945)) b!65113))

(assert (= (or b!65115 b!65113) bm!5345))

(declare-fun m!59917 () Bool)

(assert (=> bm!5345 m!59917))

(declare-fun m!59919 () Bool)

(assert (=> bm!5345 m!59919))

(assert (=> b!65114 m!59917))

(assert (=> b!65114 m!59917))

(declare-fun m!59921 () Bool)

(assert (=> b!65114 m!59921))

(assert (=> b!65116 m!59917))

(assert (=> b!65116 m!59917))

(declare-fun m!59923 () Bool)

(assert (=> b!65116 m!59923))

(assert (=> b!65117 m!59917))

(assert (=> b!65117 m!59917))

(assert (=> b!65117 m!59923))

(assert (=> bm!5320 d!13577))

(declare-fun d!13579 () Bool)

(assert (=> d!13579 (= (get!1098 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2446 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!64914 d!13579))

(declare-fun d!13581 () Bool)

(declare-fun get!1100 (Option!134) V!2883)

(assert (=> d!13581 (= (apply!70 (+!85 lt!27750 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27763) (get!1100 (getValueByKey!128 (toList!707 (+!85 lt!27750 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27763)))))

(declare-fun bs!2828 () Bool)

(assert (= bs!2828 d!13581))

(declare-fun m!59925 () Bool)

(assert (=> bs!2828 m!59925))

(assert (=> bs!2828 m!59925))

(declare-fun m!59927 () Bool)

(assert (=> bs!2828 m!59927))

(assert (=> b!65002 d!13581))

(declare-fun d!13583 () Bool)

(assert (=> d!13583 (= (apply!70 lt!27750 lt!27763) (get!1100 (getValueByKey!128 (toList!707 lt!27750) lt!27763)))))

(declare-fun bs!2829 () Bool)

(assert (= bs!2829 d!13583))

(declare-fun m!59929 () Bool)

(assert (=> bs!2829 m!59929))

(assert (=> bs!2829 m!59929))

(declare-fun m!59931 () Bool)

(assert (=> bs!2829 m!59931))

(assert (=> b!65002 d!13583))

(declare-fun d!13585 () Bool)

(declare-fun e!42666 () Bool)

(assert (=> d!13585 e!42666))

(declare-fun res!35440 () Bool)

(assert (=> d!13585 (=> (not res!35440) (not e!42666))))

(declare-fun lt!27869 () ListLongMap!1383)

(assert (=> d!13585 (= res!35440 (contains!698 lt!27869 (_1!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27867 () List!1449)

(assert (=> d!13585 (= lt!27869 (ListLongMap!1384 lt!27867))))

(declare-fun lt!27866 () Unit!1783)

(declare-fun lt!27868 () Unit!1783)

(assert (=> d!13585 (= lt!27866 lt!27868)))

(assert (=> d!13585 (= (getValueByKey!128 lt!27867 (_1!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13585 (= lt!27868 (lemmaContainsTupThenGetReturnValue!45 lt!27867 (_1!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13585 (= lt!27867 (insertStrictlySorted!48 (toList!707 lt!27750) (_1!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13585 (= (+!85 lt!27750 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27869)))

(declare-fun b!65118 () Bool)

(declare-fun res!35439 () Bool)

(assert (=> b!65118 (=> (not res!35439) (not e!42666))))

(assert (=> b!65118 (= res!35439 (= (getValueByKey!128 (toList!707 lt!27869) (_1!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65119 () Bool)

(assert (=> b!65119 (= e!42666 (contains!701 (toList!707 lt!27869) (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13585 res!35440) b!65118))

(assert (= (and b!65118 res!35439) b!65119))

(declare-fun m!59933 () Bool)

(assert (=> d!13585 m!59933))

(declare-fun m!59935 () Bool)

(assert (=> d!13585 m!59935))

(declare-fun m!59937 () Bool)

(assert (=> d!13585 m!59937))

(declare-fun m!59939 () Bool)

(assert (=> d!13585 m!59939))

(declare-fun m!59941 () Bool)

(assert (=> b!65118 m!59941))

(declare-fun m!59943 () Bool)

(assert (=> b!65119 m!59943))

(assert (=> b!65002 d!13585))

(declare-fun b!65144 () Bool)

(assert (=> b!65144 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> b!65144 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2046 (_values!2105 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun e!42687 () Bool)

(declare-fun lt!27886 () ListLongMap!1383)

(assert (=> b!65144 (= e!42687 (= (apply!70 lt!27886 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65146 () Bool)

(declare-fun e!42681 () ListLongMap!1383)

(declare-fun call!5351 () ListLongMap!1383)

(assert (=> b!65146 (= e!42681 call!5351)))

(declare-fun b!65147 () Bool)

(declare-fun e!42682 () Bool)

(declare-fun e!42685 () Bool)

(assert (=> b!65147 (= e!42682 e!42685)))

(declare-fun c!8954 () Bool)

(assert (=> b!65147 (= c!8954 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65148 () Bool)

(assert (=> b!65148 (= e!42685 (= lt!27886 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65149 () Bool)

(declare-fun e!42686 () ListLongMap!1383)

(assert (=> b!65149 (= e!42686 (ListLongMap!1384 Nil!1446))))

(declare-fun b!65150 () Bool)

(assert (=> b!65150 (= e!42682 e!42687)))

(assert (=> b!65150 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun res!35450 () Bool)

(assert (=> b!65150 (= res!35450 (contains!698 lt!27886 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65150 (=> (not res!35450) (not e!42687))))

(declare-fun b!65151 () Bool)

(declare-fun lt!27884 () Unit!1783)

(declare-fun lt!27890 () Unit!1783)

(assert (=> b!65151 (= lt!27884 lt!27890)))

(declare-fun lt!27889 () ListLongMap!1383)

(declare-fun lt!27885 () (_ BitVec 64))

(declare-fun lt!27887 () V!2883)

(declare-fun lt!27888 () (_ BitVec 64))

(assert (=> b!65151 (not (contains!698 (+!85 lt!27889 (tuple2!2059 lt!27888 lt!27887)) lt!27885))))

(declare-fun addStillNotContains!19 (ListLongMap!1383 (_ BitVec 64) V!2883 (_ BitVec 64)) Unit!1783)

(assert (=> b!65151 (= lt!27890 (addStillNotContains!19 lt!27889 lt!27888 lt!27887 lt!27885))))

(assert (=> b!65151 (= lt!27885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!65151 (= lt!27887 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65151 (= lt!27888 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65151 (= lt!27889 call!5351)))

(assert (=> b!65151 (= e!42681 (+!85 call!5351 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!65152 () Bool)

(declare-fun e!42683 () Bool)

(assert (=> b!65152 (= e!42683 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65152 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun bm!5348 () Bool)

(assert (=> bm!5348 (= call!5351 (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65153 () Bool)

(declare-fun isEmpty!304 (ListLongMap!1383) Bool)

(assert (=> b!65153 (= e!42685 (isEmpty!304 lt!27886))))

(declare-fun b!65145 () Bool)

(assert (=> b!65145 (= e!42686 e!42681)))

(declare-fun c!8956 () Bool)

(assert (=> b!65145 (= c!8956 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!13587 () Bool)

(declare-fun e!42684 () Bool)

(assert (=> d!13587 e!42684))

(declare-fun res!35451 () Bool)

(assert (=> d!13587 (=> (not res!35451) (not e!42684))))

(assert (=> d!13587 (= res!35451 (not (contains!698 lt!27886 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13587 (= lt!27886 e!42686)))

(declare-fun c!8955 () Bool)

(assert (=> d!13587 (= c!8955 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13587 (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13587 (= (getCurrentListMapNoExtraKeys!48 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) lt!27886)))

(declare-fun b!65154 () Bool)

(declare-fun res!35449 () Bool)

(assert (=> b!65154 (=> (not res!35449) (not e!42684))))

(assert (=> b!65154 (= res!35449 (not (contains!698 lt!27886 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65155 () Bool)

(assert (=> b!65155 (= e!42684 e!42682)))

(declare-fun c!8957 () Bool)

(assert (=> b!65155 (= c!8957 e!42683)))

(declare-fun res!35452 () Bool)

(assert (=> b!65155 (=> (not res!35452) (not e!42683))))

(assert (=> b!65155 (= res!35452 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13587 c!8955) b!65149))

(assert (= (and d!13587 (not c!8955)) b!65145))

(assert (= (and b!65145 c!8956) b!65151))

(assert (= (and b!65145 (not c!8956)) b!65146))

(assert (= (or b!65151 b!65146) bm!5348))

(assert (= (and d!13587 res!35451) b!65154))

(assert (= (and b!65154 res!35449) b!65155))

(assert (= (and b!65155 res!35452) b!65152))

(assert (= (and b!65155 c!8957) b!65150))

(assert (= (and b!65155 (not c!8957)) b!65147))

(assert (= (and b!65150 res!35450) b!65144))

(assert (= (and b!65147 c!8954) b!65148))

(assert (= (and b!65147 (not c!8954)) b!65153))

(declare-fun b_lambda!2927 () Bool)

(assert (=> (not b_lambda!2927) (not b!65144)))

(assert (=> b!65144 t!4875))

(declare-fun b_and!4003 () Bool)

(assert (= b_and!3999 (and (=> t!4875 result!2497) b_and!4003)))

(assert (=> b!65144 t!4877))

(declare-fun b_and!4005 () Bool)

(assert (= b_and!4001 (and (=> t!4877 result!2501) b_and!4005)))

(declare-fun b_lambda!2929 () Bool)

(assert (=> (not b_lambda!2929) (not b!65151)))

(assert (=> b!65151 t!4875))

(declare-fun b_and!4007 () Bool)

(assert (= b_and!4003 (and (=> t!4875 result!2497) b_and!4007)))

(assert (=> b!65151 t!4877))

(declare-fun b_and!4009 () Bool)

(assert (= b_and!4005 (and (=> t!4877 result!2501) b_and!4009)))

(declare-fun m!59945 () Bool)

(assert (=> d!13587 m!59945))

(assert (=> d!13587 m!59507))

(declare-fun m!59947 () Bool)

(assert (=> b!65148 m!59947))

(assert (=> b!65144 m!59655))

(assert (=> b!65144 m!59663))

(assert (=> b!65144 m!59487))

(assert (=> b!65144 m!59665))

(assert (=> b!65144 m!59487))

(assert (=> b!65144 m!59663))

(assert (=> b!65144 m!59655))

(declare-fun m!59949 () Bool)

(assert (=> b!65144 m!59949))

(declare-fun m!59951 () Bool)

(assert (=> b!65153 m!59951))

(assert (=> b!65145 m!59655))

(assert (=> b!65145 m!59655))

(assert (=> b!65145 m!59657))

(assert (=> b!65151 m!59655))

(declare-fun m!59953 () Bool)

(assert (=> b!65151 m!59953))

(declare-fun m!59955 () Bool)

(assert (=> b!65151 m!59955))

(assert (=> b!65151 m!59663))

(assert (=> b!65151 m!59487))

(assert (=> b!65151 m!59665))

(assert (=> b!65151 m!59487))

(assert (=> b!65151 m!59953))

(assert (=> b!65151 m!59663))

(declare-fun m!59957 () Bool)

(assert (=> b!65151 m!59957))

(declare-fun m!59959 () Bool)

(assert (=> b!65151 m!59959))

(assert (=> b!65150 m!59655))

(assert (=> b!65150 m!59655))

(declare-fun m!59961 () Bool)

(assert (=> b!65150 m!59961))

(declare-fun m!59963 () Bool)

(assert (=> b!65154 m!59963))

(assert (=> bm!5348 m!59947))

(assert (=> b!65152 m!59655))

(assert (=> b!65152 m!59655))

(assert (=> b!65152 m!59657))

(assert (=> b!65002 d!13587))

(declare-fun d!13589 () Bool)

(assert (=> d!13589 (= (apply!70 (+!85 lt!27754 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27760) (apply!70 lt!27754 lt!27760))))

(declare-fun lt!27893 () Unit!1783)

(declare-fun choose!354 (ListLongMap!1383 (_ BitVec 64) V!2883 (_ BitVec 64)) Unit!1783)

(assert (=> d!13589 (= lt!27893 (choose!354 lt!27754 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27760))))

(declare-fun e!42690 () Bool)

(assert (=> d!13589 e!42690))

(declare-fun res!35455 () Bool)

(assert (=> d!13589 (=> (not res!35455) (not e!42690))))

(assert (=> d!13589 (= res!35455 (contains!698 lt!27754 lt!27760))))

(assert (=> d!13589 (= (addApplyDifferent!46 lt!27754 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27760) lt!27893)))

(declare-fun b!65159 () Bool)

(assert (=> b!65159 (= e!42690 (not (= lt!27760 lt!27767)))))

(assert (= (and d!13589 res!35455) b!65159))

(assert (=> d!13589 m!59681))

(declare-fun m!59965 () Bool)

(assert (=> d!13589 m!59965))

(declare-fun m!59967 () Bool)

(assert (=> d!13589 m!59967))

(assert (=> d!13589 m!59675))

(assert (=> d!13589 m!59693))

(assert (=> d!13589 m!59675))

(assert (=> b!65002 d!13589))

(declare-fun d!13591 () Bool)

(declare-fun e!42691 () Bool)

(assert (=> d!13591 e!42691))

(declare-fun res!35457 () Bool)

(assert (=> d!13591 (=> (not res!35457) (not e!42691))))

(declare-fun lt!27897 () ListLongMap!1383)

(assert (=> d!13591 (= res!35457 (contains!698 lt!27897 (_1!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27895 () List!1449)

(assert (=> d!13591 (= lt!27897 (ListLongMap!1384 lt!27895))))

(declare-fun lt!27894 () Unit!1783)

(declare-fun lt!27896 () Unit!1783)

(assert (=> d!13591 (= lt!27894 lt!27896)))

(assert (=> d!13591 (= (getValueByKey!128 lt!27895 (_1!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13591 (= lt!27896 (lemmaContainsTupThenGetReturnValue!45 lt!27895 (_1!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13591 (= lt!27895 (insertStrictlySorted!48 (toList!707 lt!27762) (_1!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13591 (= (+!85 lt!27762 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27897)))

(declare-fun b!65160 () Bool)

(declare-fun res!35456 () Bool)

(assert (=> b!65160 (=> (not res!35456) (not e!42691))))

(assert (=> b!65160 (= res!35456 (= (getValueByKey!128 (toList!707 lt!27897) (_1!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65161 () Bool)

(assert (=> b!65161 (= e!42691 (contains!701 (toList!707 lt!27897) (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13591 res!35457) b!65160))

(assert (= (and b!65160 res!35456) b!65161))

(declare-fun m!59969 () Bool)

(assert (=> d!13591 m!59969))

(declare-fun m!59971 () Bool)

(assert (=> d!13591 m!59971))

(declare-fun m!59973 () Bool)

(assert (=> d!13591 m!59973))

(declare-fun m!59975 () Bool)

(assert (=> d!13591 m!59975))

(declare-fun m!59977 () Bool)

(assert (=> b!65160 m!59977))

(declare-fun m!59979 () Bool)

(assert (=> b!65161 m!59979))

(assert (=> b!65002 d!13591))

(declare-fun d!13593 () Bool)

(declare-fun e!42692 () Bool)

(assert (=> d!13593 e!42692))

(declare-fun res!35459 () Bool)

(assert (=> d!13593 (=> (not res!35459) (not e!42692))))

(declare-fun lt!27901 () ListLongMap!1383)

(assert (=> d!13593 (= res!35459 (contains!698 lt!27901 (_1!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27899 () List!1449)

(assert (=> d!13593 (= lt!27901 (ListLongMap!1384 lt!27899))))

(declare-fun lt!27898 () Unit!1783)

(declare-fun lt!27900 () Unit!1783)

(assert (=> d!13593 (= lt!27898 lt!27900)))

(assert (=> d!13593 (= (getValueByKey!128 lt!27899 (_1!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13593 (= lt!27900 (lemmaContainsTupThenGetReturnValue!45 lt!27899 (_1!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13593 (= lt!27899 (insertStrictlySorted!48 (toList!707 lt!27754) (_1!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13593 (= (+!85 lt!27754 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27901)))

(declare-fun b!65162 () Bool)

(declare-fun res!35458 () Bool)

(assert (=> b!65162 (=> (not res!35458) (not e!42692))))

(assert (=> b!65162 (= res!35458 (= (getValueByKey!128 (toList!707 lt!27901) (_1!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65163 () Bool)

(assert (=> b!65163 (= e!42692 (contains!701 (toList!707 lt!27901) (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13593 res!35459) b!65162))

(assert (= (and b!65162 res!35458) b!65163))

(declare-fun m!59981 () Bool)

(assert (=> d!13593 m!59981))

(declare-fun m!59983 () Bool)

(assert (=> d!13593 m!59983))

(declare-fun m!59985 () Bool)

(assert (=> d!13593 m!59985))

(declare-fun m!59987 () Bool)

(assert (=> d!13593 m!59987))

(declare-fun m!59989 () Bool)

(assert (=> b!65162 m!59989))

(declare-fun m!59991 () Bool)

(assert (=> b!65163 m!59991))

(assert (=> b!65002 d!13593))

(declare-fun d!13595 () Bool)

(assert (=> d!13595 (= (apply!70 (+!85 lt!27762 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27769) (get!1100 (getValueByKey!128 (toList!707 (+!85 lt!27762 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27769)))))

(declare-fun bs!2830 () Bool)

(assert (= bs!2830 d!13595))

(declare-fun m!59993 () Bool)

(assert (=> bs!2830 m!59993))

(assert (=> bs!2830 m!59993))

(declare-fun m!59995 () Bool)

(assert (=> bs!2830 m!59995))

(assert (=> b!65002 d!13595))

(declare-fun d!13597 () Bool)

(assert (=> d!13597 (= (apply!70 (+!85 lt!27762 (tuple2!2059 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27769) (apply!70 lt!27762 lt!27769))))

(declare-fun lt!27902 () Unit!1783)

(assert (=> d!13597 (= lt!27902 (choose!354 lt!27762 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27769))))

(declare-fun e!42693 () Bool)

(assert (=> d!13597 e!42693))

(declare-fun res!35460 () Bool)

(assert (=> d!13597 (=> (not res!35460) (not e!42693))))

(assert (=> d!13597 (= res!35460 (contains!698 lt!27762 lt!27769))))

(assert (=> d!13597 (= (addApplyDifferent!46 lt!27762 lt!27757 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27769) lt!27902)))

(declare-fun b!65164 () Bool)

(assert (=> b!65164 (= e!42693 (not (= lt!27769 lt!27757)))))

(assert (= (and d!13597 res!35460) b!65164))

(assert (=> d!13597 m!59699))

(declare-fun m!59997 () Bool)

(assert (=> d!13597 m!59997))

(declare-fun m!59999 () Bool)

(assert (=> d!13597 m!59999))

(assert (=> d!13597 m!59677))

(assert (=> d!13597 m!59687))

(assert (=> d!13597 m!59677))

(assert (=> b!65002 d!13597))

(declare-fun d!13599 () Bool)

(assert (=> d!13599 (= (apply!70 (+!85 lt!27750 (tuple2!2059 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27763) (apply!70 lt!27750 lt!27763))))

(declare-fun lt!27903 () Unit!1783)

(assert (=> d!13599 (= lt!27903 (choose!354 lt!27750 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27763))))

(declare-fun e!42694 () Bool)

(assert (=> d!13599 e!42694))

(declare-fun res!35461 () Bool)

(assert (=> d!13599 (=> (not res!35461) (not e!42694))))

(assert (=> d!13599 (= res!35461 (contains!698 lt!27750 lt!27763))))

(assert (=> d!13599 (= (addApplyDifferent!46 lt!27750 lt!27759 (minValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27763) lt!27903)))

(declare-fun b!65165 () Bool)

(assert (=> b!65165 (= e!42694 (not (= lt!27763 lt!27759)))))

(assert (= (and d!13599 res!35461) b!65165))

(assert (=> d!13599 m!59671))

(declare-fun m!60001 () Bool)

(assert (=> d!13599 m!60001))

(declare-fun m!60003 () Bool)

(assert (=> d!13599 m!60003))

(assert (=> d!13599 m!59685))

(assert (=> d!13599 m!59695))

(assert (=> d!13599 m!59685))

(assert (=> b!65002 d!13599))

(declare-fun d!13601 () Bool)

(assert (=> d!13601 (contains!698 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27768)))

(declare-fun lt!27906 () Unit!1783)

(declare-fun choose!355 (ListLongMap!1383 (_ BitVec 64) V!2883 (_ BitVec 64)) Unit!1783)

(assert (=> d!13601 (= lt!27906 (choose!355 lt!27749 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27768))))

(assert (=> d!13601 (contains!698 lt!27749 lt!27768)))

(assert (=> d!13601 (= (addStillContains!46 lt!27749 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) lt!27768) lt!27906)))

(declare-fun bs!2831 () Bool)

(assert (= bs!2831 d!13601))

(assert (=> bs!2831 m!59673))

(assert (=> bs!2831 m!59673))

(assert (=> bs!2831 m!59683))

(declare-fun m!60005 () Bool)

(assert (=> bs!2831 m!60005))

(declare-fun m!60007 () Bool)

(assert (=> bs!2831 m!60007))

(assert (=> b!65002 d!13601))

(declare-fun d!13603 () Bool)

(assert (=> d!13603 (= (apply!70 lt!27754 lt!27760) (get!1100 (getValueByKey!128 (toList!707 lt!27754) lt!27760)))))

(declare-fun bs!2832 () Bool)

(assert (= bs!2832 d!13603))

(declare-fun m!60009 () Bool)

(assert (=> bs!2832 m!60009))

(assert (=> bs!2832 m!60009))

(declare-fun m!60011 () Bool)

(assert (=> bs!2832 m!60011))

(assert (=> b!65002 d!13603))

(declare-fun d!13605 () Bool)

(declare-fun e!42695 () Bool)

(assert (=> d!13605 e!42695))

(declare-fun res!35462 () Bool)

(assert (=> d!13605 (=> res!35462 e!42695)))

(declare-fun lt!27910 () Bool)

(assert (=> d!13605 (= res!35462 (not lt!27910))))

(declare-fun lt!27908 () Bool)

(assert (=> d!13605 (= lt!27910 lt!27908)))

(declare-fun lt!27907 () Unit!1783)

(declare-fun e!42696 () Unit!1783)

(assert (=> d!13605 (= lt!27907 e!42696)))

(declare-fun c!8958 () Bool)

(assert (=> d!13605 (= c!8958 lt!27908)))

(assert (=> d!13605 (= lt!27908 (containsKey!132 (toList!707 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27768))))

(assert (=> d!13605 (= (contains!698 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27768) lt!27910)))

(declare-fun b!65167 () Bool)

(declare-fun lt!27909 () Unit!1783)

(assert (=> b!65167 (= e!42696 lt!27909)))

(assert (=> b!65167 (= lt!27909 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27768))))

(assert (=> b!65167 (isDefined!81 (getValueByKey!128 (toList!707 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27768))))

(declare-fun b!65168 () Bool)

(declare-fun Unit!1798 () Unit!1783)

(assert (=> b!65168 (= e!42696 Unit!1798)))

(declare-fun b!65169 () Bool)

(assert (=> b!65169 (= e!42695 (isDefined!81 (getValueByKey!128 (toList!707 (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27768)))))

(assert (= (and d!13605 c!8958) b!65167))

(assert (= (and d!13605 (not c!8958)) b!65168))

(assert (= (and d!13605 (not res!35462)) b!65169))

(declare-fun m!60013 () Bool)

(assert (=> d!13605 m!60013))

(declare-fun m!60015 () Bool)

(assert (=> b!65167 m!60015))

(declare-fun m!60017 () Bool)

(assert (=> b!65167 m!60017))

(assert (=> b!65167 m!60017))

(declare-fun m!60019 () Bool)

(assert (=> b!65167 m!60019))

(assert (=> b!65169 m!60017))

(assert (=> b!65169 m!60017))

(assert (=> b!65169 m!60019))

(assert (=> b!65002 d!13605))

(declare-fun d!13607 () Bool)

(declare-fun e!42697 () Bool)

(assert (=> d!13607 e!42697))

(declare-fun res!35464 () Bool)

(assert (=> d!13607 (=> (not res!35464) (not e!42697))))

(declare-fun lt!27914 () ListLongMap!1383)

(assert (=> d!13607 (= res!35464 (contains!698 lt!27914 (_1!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27912 () List!1449)

(assert (=> d!13607 (= lt!27914 (ListLongMap!1384 lt!27912))))

(declare-fun lt!27911 () Unit!1783)

(declare-fun lt!27913 () Unit!1783)

(assert (=> d!13607 (= lt!27911 lt!27913)))

(assert (=> d!13607 (= (getValueByKey!128 lt!27912 (_1!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13607 (= lt!27913 (lemmaContainsTupThenGetReturnValue!45 lt!27912 (_1!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13607 (= lt!27912 (insertStrictlySorted!48 (toList!707 lt!27749) (_1!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13607 (= (+!85 lt!27749 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27914)))

(declare-fun b!65170 () Bool)

(declare-fun res!35463 () Bool)

(assert (=> b!65170 (=> (not res!35463) (not e!42697))))

(assert (=> b!65170 (= res!35463 (= (getValueByKey!128 (toList!707 lt!27914) (_1!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65171 () Bool)

(assert (=> b!65171 (= e!42697 (contains!701 (toList!707 lt!27914) (tuple2!2059 lt!27752 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13607 res!35464) b!65170))

(assert (= (and b!65170 res!35463) b!65171))

(declare-fun m!60021 () Bool)

(assert (=> d!13607 m!60021))

(declare-fun m!60023 () Bool)

(assert (=> d!13607 m!60023))

(declare-fun m!60025 () Bool)

(assert (=> d!13607 m!60025))

(declare-fun m!60027 () Bool)

(assert (=> d!13607 m!60027))

(declare-fun m!60029 () Bool)

(assert (=> b!65170 m!60029))

(declare-fun m!60031 () Bool)

(assert (=> b!65171 m!60031))

(assert (=> b!65002 d!13607))

(declare-fun d!13609 () Bool)

(assert (=> d!13609 (= (apply!70 lt!27762 lt!27769) (get!1100 (getValueByKey!128 (toList!707 lt!27762) lt!27769)))))

(declare-fun bs!2833 () Bool)

(assert (= bs!2833 d!13609))

(declare-fun m!60033 () Bool)

(assert (=> bs!2833 m!60033))

(assert (=> bs!2833 m!60033))

(declare-fun m!60035 () Bool)

(assert (=> bs!2833 m!60035))

(assert (=> b!65002 d!13609))

(declare-fun d!13611 () Bool)

(assert (=> d!13611 (= (apply!70 (+!85 lt!27754 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!27760) (get!1100 (getValueByKey!128 (toList!707 (+!85 lt!27754 (tuple2!2059 lt!27767 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!27760)))))

(declare-fun bs!2834 () Bool)

(assert (= bs!2834 d!13611))

(declare-fun m!60037 () Bool)

(assert (=> bs!2834 m!60037))

(assert (=> bs!2834 m!60037))

(declare-fun m!60039 () Bool)

(assert (=> bs!2834 m!60039))

(assert (=> b!65002 d!13611))

(declare-fun d!13613 () Bool)

(declare-fun e!42698 () Bool)

(assert (=> d!13613 e!42698))

(declare-fun res!35465 () Bool)

(assert (=> d!13613 (=> res!35465 e!42698)))

(declare-fun lt!27918 () Bool)

(assert (=> d!13613 (= res!35465 (not lt!27918))))

(declare-fun lt!27916 () Bool)

(assert (=> d!13613 (= lt!27918 lt!27916)))

(declare-fun lt!27915 () Unit!1783)

(declare-fun e!42699 () Unit!1783)

(assert (=> d!13613 (= lt!27915 e!42699)))

(declare-fun c!8959 () Bool)

(assert (=> d!13613 (= c!8959 lt!27916)))

(assert (=> d!13613 (= lt!27916 (containsKey!132 (toList!707 lt!27753) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13613 (= (contains!698 lt!27753 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!27918)))

(declare-fun b!65172 () Bool)

(declare-fun lt!27917 () Unit!1783)

(assert (=> b!65172 (= e!42699 lt!27917)))

(assert (=> b!65172 (= lt!27917 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 lt!27753) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65172 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65173 () Bool)

(declare-fun Unit!1799 () Unit!1783)

(assert (=> b!65173 (= e!42699 Unit!1799)))

(declare-fun b!65174 () Bool)

(assert (=> b!65174 (= e!42698 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13613 c!8959) b!65172))

(assert (= (and d!13613 (not c!8959)) b!65173))

(assert (= (and d!13613 (not res!35465)) b!65174))

(assert (=> d!13613 m!59655))

(declare-fun m!60041 () Bool)

(assert (=> d!13613 m!60041))

(assert (=> b!65172 m!59655))

(declare-fun m!60043 () Bool)

(assert (=> b!65172 m!60043))

(assert (=> b!65172 m!59655))

(declare-fun m!60045 () Bool)

(assert (=> b!65172 m!60045))

(assert (=> b!65172 m!60045))

(declare-fun m!60047 () Bool)

(assert (=> b!65172 m!60047))

(assert (=> b!65174 m!59655))

(assert (=> b!65174 m!60045))

(assert (=> b!65174 m!60045))

(assert (=> b!65174 m!60047))

(assert (=> b!64987 d!13613))

(declare-fun d!13615 () Bool)

(declare-fun res!35466 () Bool)

(declare-fun e!42700 () Bool)

(assert (=> d!13615 (=> (not res!35466) (not e!42700))))

(assert (=> d!13615 (= res!35466 (simpleValid!46 (_2!1039 lt!27694)))))

(assert (=> d!13615 (= (valid!268 (_2!1039 lt!27694)) e!42700)))

(declare-fun b!65175 () Bool)

(declare-fun res!35467 () Bool)

(assert (=> b!65175 (=> (not res!35467) (not e!42700))))

(assert (=> b!65175 (= res!35467 (= (arrayCountValidKeys!0 (_keys!3760 (_2!1039 lt!27694)) #b00000000000000000000000000000000 (size!2045 (_keys!3760 (_2!1039 lt!27694)))) (_size!373 (_2!1039 lt!27694))))))

(declare-fun b!65176 () Bool)

(declare-fun res!35468 () Bool)

(assert (=> b!65176 (=> (not res!35468) (not e!42700))))

(assert (=> b!65176 (= res!35468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 (_2!1039 lt!27694)) (mask!6044 (_2!1039 lt!27694))))))

(declare-fun b!65177 () Bool)

(assert (=> b!65177 (= e!42700 (arrayNoDuplicates!0 (_keys!3760 (_2!1039 lt!27694)) #b00000000000000000000000000000000 Nil!1445))))

(assert (= (and d!13615 res!35466) b!65175))

(assert (= (and b!65175 res!35467) b!65176))

(assert (= (and b!65176 res!35468) b!65177))

(declare-fun m!60049 () Bool)

(assert (=> d!13615 m!60049))

(declare-fun m!60051 () Bool)

(assert (=> b!65175 m!60051))

(declare-fun m!60053 () Bool)

(assert (=> b!65176 m!60053))

(declare-fun m!60055 () Bool)

(assert (=> b!65177 m!60055))

(assert (=> d!13527 d!13615))

(assert (=> d!13527 d!13535))

(declare-fun bm!5349 () Bool)

(declare-fun call!5352 () Bool)

(assert (=> bm!5349 (= call!5352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun b!65178 () Bool)

(declare-fun e!42703 () Bool)

(declare-fun e!42701 () Bool)

(assert (=> b!65178 (= e!42703 e!42701)))

(declare-fun c!8960 () Bool)

(assert (=> b!65178 (= c!8960 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65179 () Bool)

(assert (=> b!65179 (= e!42701 call!5352)))

(declare-fun b!65180 () Bool)

(declare-fun e!42702 () Bool)

(assert (=> b!65180 (= e!42702 call!5352)))

(declare-fun b!65181 () Bool)

(assert (=> b!65181 (= e!42701 e!42702)))

(declare-fun lt!27920 () (_ BitVec 64))

(assert (=> b!65181 (= lt!27920 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27919 () Unit!1783)

(assert (=> b!65181 (= lt!27919 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3760 newMap!16) lt!27920 #b00000000000000000000000000000000))))

(assert (=> b!65181 (arrayContainsKey!0 (_keys!3760 newMap!16) lt!27920 #b00000000000000000000000000000000)))

(declare-fun lt!27921 () Unit!1783)

(assert (=> b!65181 (= lt!27921 lt!27919)))

(declare-fun res!35469 () Bool)

(assert (=> b!65181 (= res!35469 (= (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000) (_keys!3760 newMap!16) (mask!6044 newMap!16)) (Found!231 #b00000000000000000000000000000000)))))

(assert (=> b!65181 (=> (not res!35469) (not e!42702))))

(declare-fun d!13617 () Bool)

(declare-fun res!35470 () Bool)

(assert (=> d!13617 (=> res!35470 e!42703)))

(assert (=> d!13617 (= res!35470 (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 newMap!16) (mask!6044 newMap!16)) e!42703)))

(assert (= (and d!13617 (not res!35470)) b!65178))

(assert (= (and b!65178 c!8960) b!65181))

(assert (= (and b!65178 (not c!8960)) b!65179))

(assert (= (and b!65181 res!35469) b!65180))

(assert (= (or b!65180 b!65179) bm!5349))

(declare-fun m!60057 () Bool)

(assert (=> bm!5349 m!60057))

(assert (=> b!65178 m!59739))

(assert (=> b!65178 m!59739))

(assert (=> b!65178 m!59741))

(assert (=> b!65181 m!59739))

(declare-fun m!60059 () Bool)

(assert (=> b!65181 m!60059))

(declare-fun m!60061 () Bool)

(assert (=> b!65181 m!60061))

(assert (=> b!65181 m!59739))

(declare-fun m!60063 () Bool)

(assert (=> b!65181 m!60063))

(assert (=> b!64923 d!13617))

(declare-fun d!13619 () Bool)

(assert (=> d!13619 (= (+!85 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) lt!27699 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27924 () Unit!1783)

(declare-fun choose!356 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 V!2883 Int) Unit!1783)

(assert (=> d!13619 (= lt!27924 (choose!356 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27699 (zeroValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2031 newMap!16) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13619 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13619 (= (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27699 (zeroValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2031 newMap!16) (defaultEntry!2122 newMap!16)) lt!27924)))

(declare-fun bs!2835 () Bool)

(assert (= bs!2835 d!13619))

(assert (=> bs!2835 m!59489))

(declare-fun m!60065 () Bool)

(assert (=> bs!2835 m!60065))

(assert (=> bs!2835 m!59619))

(assert (=> bs!2835 m!59787))

(assert (=> bs!2835 m!59489))

(declare-fun m!60067 () Bool)

(assert (=> bs!2835 m!60067))

(assert (=> bs!2835 m!59619))

(declare-fun m!60069 () Bool)

(assert (=> bs!2835 m!60069))

(assert (=> b!64897 d!13619))

(declare-fun b!65193 () Bool)

(declare-fun e!42706 () Bool)

(assert (=> b!65193 (= e!42706 (and (bvsge (extraKeys!1995 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1995 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!373 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!65191 () Bool)

(declare-fun res!35482 () Bool)

(assert (=> b!65191 (=> (not res!35482) (not e!42706))))

(declare-fun size!2049 (LongMapFixedSize!648) (_ BitVec 32))

(assert (=> b!65191 (= res!35482 (bvsge (size!2049 newMap!16) (_size!373 newMap!16)))))

(declare-fun b!65192 () Bool)

(declare-fun res!35480 () Bool)

(assert (=> b!65192 (=> (not res!35480) (not e!42706))))

(assert (=> b!65192 (= res!35480 (= (size!2049 newMap!16) (bvadd (_size!373 newMap!16) (bvsdiv (bvadd (extraKeys!1995 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!13621 () Bool)

(declare-fun res!35479 () Bool)

(assert (=> d!13621 (=> (not res!35479) (not e!42706))))

(assert (=> d!13621 (= res!35479 (validMask!0 (mask!6044 newMap!16)))))

(assert (=> d!13621 (= (simpleValid!46 newMap!16) e!42706)))

(declare-fun b!65190 () Bool)

(declare-fun res!35481 () Bool)

(assert (=> b!65190 (=> (not res!35481) (not e!42706))))

(assert (=> b!65190 (= res!35481 (and (= (size!2046 (_values!2105 newMap!16)) (bvadd (mask!6044 newMap!16) #b00000000000000000000000000000001)) (= (size!2045 (_keys!3760 newMap!16)) (size!2046 (_values!2105 newMap!16))) (bvsge (_size!373 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!373 newMap!16) (bvadd (mask!6044 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!13621 res!35479) b!65190))

(assert (= (and b!65190 res!35481) b!65191))

(assert (= (and b!65191 res!35482) b!65192))

(assert (= (and b!65192 res!35480) b!65193))

(declare-fun m!60071 () Bool)

(assert (=> b!65191 m!60071))

(assert (=> b!65192 m!60071))

(assert (=> d!13621 m!59787))

(assert (=> d!13535 d!13621))

(declare-fun d!13623 () Bool)

(declare-fun res!35487 () Bool)

(declare-fun e!42711 () Bool)

(assert (=> d!13623 (=> res!35487 e!42711)))

(assert (=> d!13623 (= res!35487 (and ((_ is Cons!1445) (toList!707 lt!27589)) (= (_1!1040 (h!2029 (toList!707 lt!27589))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (=> d!13623 (= (containsKey!132 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) e!42711)))

(declare-fun b!65198 () Bool)

(declare-fun e!42712 () Bool)

(assert (=> b!65198 (= e!42711 e!42712)))

(declare-fun res!35488 () Bool)

(assert (=> b!65198 (=> (not res!35488) (not e!42712))))

(assert (=> b!65198 (= res!35488 (and (or (not ((_ is Cons!1445) (toList!707 lt!27589))) (bvsle (_1!1040 (h!2029 (toList!707 lt!27589))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))) ((_ is Cons!1445) (toList!707 lt!27589)) (bvslt (_1!1040 (h!2029 (toList!707 lt!27589))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(declare-fun b!65199 () Bool)

(assert (=> b!65199 (= e!42712 (containsKey!132 (t!4879 (toList!707 lt!27589)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13623 (not res!35487)) b!65198))

(assert (= (and b!65198 res!35488) b!65199))

(assert (=> b!65199 m!59481))

(declare-fun m!60073 () Bool)

(assert (=> b!65199 m!60073))

(assert (=> d!13525 d!13623))

(declare-fun bm!5350 () Bool)

(declare-fun call!5353 () Bool)

(assert (=> bm!5350 (= call!5353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65200 () Bool)

(declare-fun e!42715 () Bool)

(declare-fun e!42713 () Bool)

(assert (=> b!65200 (= e!42715 e!42713)))

(declare-fun c!8961 () Bool)

(assert (=> b!65200 (= c!8961 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!65201 () Bool)

(assert (=> b!65201 (= e!42713 call!5353)))

(declare-fun b!65202 () Bool)

(declare-fun e!42714 () Bool)

(assert (=> b!65202 (= e!42714 call!5353)))

(declare-fun b!65203 () Bool)

(assert (=> b!65203 (= e!42713 e!42714)))

(declare-fun lt!27926 () (_ BitVec 64))

(assert (=> b!65203 (= lt!27926 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27925 () Unit!1783)

(assert (=> b!65203 (= lt!27925 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27926 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!65203 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27926 #b00000000000000000000000000000000)))

(declare-fun lt!27927 () Unit!1783)

(assert (=> b!65203 (= lt!27927 lt!27925)))

(declare-fun res!35489 () Bool)

(assert (=> b!65203 (= res!35489 (= (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))) (Found!231 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!65203 (=> (not res!35489) (not e!42714))))

(declare-fun d!13625 () Bool)

(declare-fun res!35490 () Bool)

(assert (=> d!13625 (=> res!35490 e!42715)))

(assert (=> d!13625 (= res!35490 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13625 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))) e!42715)))

(assert (= (and d!13625 (not res!35490)) b!65200))

(assert (= (and b!65200 c!8961) b!65203))

(assert (= (and b!65200 (not c!8961)) b!65201))

(assert (= (and b!65203 res!35489) b!65202))

(assert (= (or b!65202 b!65201) bm!5350))

(declare-fun m!60075 () Bool)

(assert (=> bm!5350 m!60075))

(declare-fun m!60077 () Bool)

(assert (=> b!65200 m!60077))

(assert (=> b!65200 m!60077))

(declare-fun m!60079 () Bool)

(assert (=> b!65200 m!60079))

(assert (=> b!65203 m!60077))

(declare-fun m!60081 () Bool)

(assert (=> b!65203 m!60081))

(declare-fun m!60083 () Bool)

(assert (=> b!65203 m!60083))

(assert (=> b!65203 m!60077))

(declare-fun m!60085 () Bool)

(assert (=> b!65203 m!60085))

(assert (=> bm!5323 d!13625))

(declare-fun d!13627 () Bool)

(assert (=> d!13627 (= (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64938 d!13627))

(declare-fun d!13629 () Bool)

(declare-fun lt!27930 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!70 (List!1448) (InoxSet (_ BitVec 64)))

(assert (=> d!13629 (= lt!27930 (select (content!70 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!42721 () Bool)

(assert (=> d!13629 (= lt!27930 e!42721)))

(declare-fun res!35496 () Bool)

(assert (=> d!13629 (=> (not res!35496) (not e!42721))))

(assert (=> d!13629 (= res!35496 ((_ is Cons!1444) Nil!1445))))

(assert (=> d!13629 (= (contains!700 Nil!1445 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) lt!27930)))

(declare-fun b!65208 () Bool)

(declare-fun e!42720 () Bool)

(assert (=> b!65208 (= e!42721 e!42720)))

(declare-fun res!35495 () Bool)

(assert (=> b!65208 (=> res!35495 e!42720)))

(assert (=> b!65208 (= res!35495 (= (h!2028 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65209 () Bool)

(assert (=> b!65209 (= e!42720 (contains!700 (t!4878 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13629 res!35496) b!65208))

(assert (= (and b!65208 (not res!35495)) b!65209))

(declare-fun m!60087 () Bool)

(assert (=> d!13629 m!60087))

(assert (=> d!13629 m!59647))

(declare-fun m!60089 () Bool)

(assert (=> d!13629 m!60089))

(assert (=> b!65209 m!59647))

(declare-fun m!60091 () Bool)

(assert (=> b!65209 m!60091))

(assert (=> b!64936 d!13629))

(assert (=> d!13547 d!13551))

(declare-fun d!13631 () Bool)

(assert (=> d!13631 (not (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13631 true))

(declare-fun _$68!43 () Unit!1783)

(assert (=> d!13631 (= (choose!68 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1445)) _$68!43)))

(declare-fun bs!2836 () Bool)

(assert (= bs!2836 d!13631))

(assert (=> bs!2836 m!59481))

(assert (=> bs!2836 m!59499))

(assert (=> d!13547 d!13631))

(declare-fun d!13633 () Bool)

(declare-fun e!42724 () Bool)

(assert (=> d!13633 e!42724))

(declare-fun res!35501 () Bool)

(assert (=> d!13633 (=> (not res!35501) (not e!42724))))

(declare-fun lt!27935 () SeekEntryResult!231)

(assert (=> d!13633 (= res!35501 ((_ is Found!231) lt!27935))))

(assert (=> d!13633 (= lt!27935 (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun lt!27936 () Unit!1783)

(declare-fun choose!357 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) Int) Unit!1783)

(assert (=> d!13633 (= lt!27936 (choose!357 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13633 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13633 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)) lt!27936)))

(declare-fun b!65214 () Bool)

(declare-fun res!35502 () Bool)

(assert (=> b!65214 (=> (not res!35502) (not e!42724))))

(assert (=> b!65214 (= res!35502 (inRange!0 (index!3052 lt!27935) (mask!6044 newMap!16)))))

(declare-fun b!65215 () Bool)

(assert (=> b!65215 (= e!42724 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27935)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65215 (and (bvsge (index!3052 lt!27935) #b00000000000000000000000000000000) (bvslt (index!3052 lt!27935) (size!2045 (_keys!3760 newMap!16))))))

(assert (= (and d!13633 res!35501) b!65214))

(assert (= (and b!65214 res!35502) b!65215))

(assert (=> d!13633 m!59481))

(assert (=> d!13633 m!59581))

(assert (=> d!13633 m!59481))

(declare-fun m!60093 () Bool)

(assert (=> d!13633 m!60093))

(assert (=> d!13633 m!59787))

(declare-fun m!60095 () Bool)

(assert (=> b!65214 m!60095))

(declare-fun m!60097 () Bool)

(assert (=> b!65215 m!60097))

(assert (=> bm!5290 d!13633))

(declare-fun d!13635 () Bool)

(assert (=> d!13635 (= (+!85 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) lt!27678 (zeroValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lt!27939 () Unit!1783)

(declare-fun choose!358 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 V!2883 Int) Unit!1783)

(assert (=> d!13635 (= lt!27939 (choose!358 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27678 (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13635 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13635 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) lt!27678 (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)) lt!27939)))

(declare-fun bs!2837 () Bool)

(assert (= bs!2837 d!13635))

(assert (=> bs!2837 m!59489))

(declare-fun m!60099 () Bool)

(assert (=> bs!2837 m!60099))

(assert (=> bs!2837 m!59619))

(assert (=> bs!2837 m!59787))

(assert (=> bs!2837 m!59489))

(declare-fun m!60101 () Bool)

(assert (=> bs!2837 m!60101))

(assert (=> bs!2837 m!59619))

(declare-fun m!60103 () Bool)

(assert (=> bs!2837 m!60103))

(assert (=> b!64884 d!13635))

(assert (=> bm!5277 d!13539))

(assert (=> d!13541 d!13545))

(declare-fun d!13637 () Bool)

(assert (=> d!13637 (= (apply!70 lt!27753 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1100 (getValueByKey!128 (toList!707 lt!27753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2838 () Bool)

(assert (= bs!2838 d!13637))

(declare-fun m!60105 () Bool)

(assert (=> bs!2838 m!60105))

(assert (=> bs!2838 m!60105))

(declare-fun m!60107 () Bool)

(assert (=> bs!2838 m!60107))

(assert (=> b!64994 d!13637))

(declare-fun d!13639 () Bool)

(declare-fun e!42725 () Bool)

(assert (=> d!13639 e!42725))

(declare-fun res!35503 () Bool)

(assert (=> d!13639 (=> res!35503 e!42725)))

(declare-fun lt!27943 () Bool)

(assert (=> d!13639 (= res!35503 (not lt!27943))))

(declare-fun lt!27941 () Bool)

(assert (=> d!13639 (= lt!27943 lt!27941)))

(declare-fun lt!27940 () Unit!1783)

(declare-fun e!42726 () Unit!1783)

(assert (=> d!13639 (= lt!27940 e!42726)))

(declare-fun c!8962 () Bool)

(assert (=> d!13639 (= c!8962 lt!27941)))

(assert (=> d!13639 (= lt!27941 (containsKey!132 (toList!707 call!5278) (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702))))))

(assert (=> d!13639 (= (contains!698 call!5278 (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702))) lt!27943)))

(declare-fun b!65216 () Bool)

(declare-fun lt!27942 () Unit!1783)

(assert (=> b!65216 (= e!42726 lt!27942)))

(assert (=> b!65216 (= lt!27942 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 call!5278) (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702))))))

(assert (=> b!65216 (isDefined!81 (getValueByKey!128 (toList!707 call!5278) (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702))))))

(declare-fun b!65217 () Bool)

(declare-fun Unit!1800 () Unit!1783)

(assert (=> b!65217 (= e!42726 Unit!1800)))

(declare-fun b!65218 () Bool)

(assert (=> b!65218 (= e!42725 (isDefined!81 (getValueByKey!128 (toList!707 call!5278) (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702)))))))

(assert (= (and d!13639 c!8962) b!65216))

(assert (= (and d!13639 (not c!8962)) b!65217))

(assert (= (and d!13639 (not res!35503)) b!65218))

(assert (=> d!13639 m!59629))

(declare-fun m!60109 () Bool)

(assert (=> d!13639 m!60109))

(assert (=> b!65216 m!59629))

(declare-fun m!60111 () Bool)

(assert (=> b!65216 m!60111))

(assert (=> b!65216 m!59629))

(declare-fun m!60113 () Bool)

(assert (=> b!65216 m!60113))

(assert (=> b!65216 m!60113))

(declare-fun m!60115 () Bool)

(assert (=> b!65216 m!60115))

(assert (=> b!65218 m!59629))

(assert (=> b!65218 m!60113))

(assert (=> b!65218 m!60113))

(assert (=> b!65218 m!60115))

(assert (=> b!64906 d!13639))

(declare-fun d!13641 () Bool)

(declare-fun e!42729 () Bool)

(assert (=> d!13641 e!42729))

(declare-fun res!35506 () Bool)

(assert (=> d!13641 (=> (not res!35506) (not e!42729))))

(assert (=> d!13641 (= res!35506 (and (bvsge (index!3052 lt!27702) #b00000000000000000000000000000000) (bvslt (index!3052 lt!27702) (size!2045 (_keys!3760 newMap!16)))))))

(declare-fun lt!27946 () Unit!1783)

(declare-fun choose!359 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) Int) Unit!1783)

(assert (=> d!13641 (= lt!27946 (choose!359 (_keys!3760 newMap!16) lt!27700 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13641 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13641 (= (lemmaValidKeyInArrayIsInListMap!80 (_keys!3760 newMap!16) lt!27700 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (defaultEntry!2122 newMap!16)) lt!27946)))

(declare-fun b!65221 () Bool)

(assert (=> b!65221 (= e!42729 (contains!698 (getCurrentListMap!409 (_keys!3760 newMap!16) lt!27700 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27702))))))

(assert (= (and d!13641 res!35506) b!65221))

(declare-fun m!60117 () Bool)

(assert (=> d!13641 m!60117))

(assert (=> d!13641 m!59787))

(declare-fun m!60119 () Bool)

(assert (=> b!65221 m!60119))

(assert (=> b!65221 m!59629))

(assert (=> b!65221 m!60119))

(assert (=> b!65221 m!59629))

(declare-fun m!60121 () Bool)

(assert (=> b!65221 m!60121))

(assert (=> b!64906 d!13641))

(declare-fun d!13643 () Bool)

(declare-fun e!42732 () Bool)

(assert (=> d!13643 e!42732))

(declare-fun res!35509 () Bool)

(assert (=> d!13643 (=> (not res!35509) (not e!42732))))

(assert (=> d!13643 (= res!35509 (and (bvsge (index!3052 lt!27702) #b00000000000000000000000000000000) (bvslt (index!3052 lt!27702) (size!2046 (_values!2105 newMap!16)))))))

(declare-fun lt!27949 () Unit!1783)

(declare-fun choose!360 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) (_ BitVec 64) V!2883 Int) Unit!1783)

(assert (=> d!13643 (= lt!27949 (choose!360 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13643 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13643 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (index!3052 lt!27702) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)) lt!27949)))

(declare-fun b!65224 () Bool)

(assert (=> b!65224 (= e!42732 (= (+!85 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!409 (_keys!3760 newMap!16) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (index!3052 lt!27702) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16))))))

(assert (= (and d!13643 res!35509) b!65224))

(assert (=> d!13643 m!59481))

(assert (=> d!13643 m!59489))

(declare-fun m!60123 () Bool)

(assert (=> d!13643 m!60123))

(assert (=> d!13643 m!59787))

(assert (=> b!65224 m!59619))

(assert (=> b!65224 m!59619))

(declare-fun m!60125 () Bool)

(assert (=> b!65224 m!60125))

(assert (=> b!65224 m!59611))

(declare-fun m!60127 () Bool)

(assert (=> b!65224 m!60127))

(assert (=> b!64906 d!13643))

(declare-fun b!65237 () Bool)

(declare-fun e!42739 () SeekEntryResult!231)

(declare-fun lt!27957 () SeekEntryResult!231)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3789 (_ BitVec 32)) SeekEntryResult!231)

(assert (=> b!65237 (= e!42739 (seekKeyOrZeroReturnVacant!0 (x!10542 lt!27957) (index!3053 lt!27957) (index!3053 lt!27957) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun b!65238 () Bool)

(declare-fun e!42741 () SeekEntryResult!231)

(declare-fun e!42740 () SeekEntryResult!231)

(assert (=> b!65238 (= e!42741 e!42740)))

(declare-fun lt!27958 () (_ BitVec 64))

(assert (=> b!65238 (= lt!27958 (select (arr!1811 (_keys!3760 newMap!16)) (index!3053 lt!27957)))))

(declare-fun c!8971 () Bool)

(assert (=> b!65238 (= c!8971 (= lt!27958 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65239 () Bool)

(declare-fun c!8970 () Bool)

(assert (=> b!65239 (= c!8970 (= lt!27958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65239 (= e!42740 e!42739)))

(declare-fun b!65240 () Bool)

(assert (=> b!65240 (= e!42739 (MissingZero!231 (index!3053 lt!27957)))))

(declare-fun d!13645 () Bool)

(declare-fun lt!27956 () SeekEntryResult!231)

(assert (=> d!13645 (and (or ((_ is Undefined!231) lt!27956) (not ((_ is Found!231) lt!27956)) (and (bvsge (index!3052 lt!27956) #b00000000000000000000000000000000) (bvslt (index!3052 lt!27956) (size!2045 (_keys!3760 newMap!16))))) (or ((_ is Undefined!231) lt!27956) ((_ is Found!231) lt!27956) (not ((_ is MissingZero!231) lt!27956)) (and (bvsge (index!3051 lt!27956) #b00000000000000000000000000000000) (bvslt (index!3051 lt!27956) (size!2045 (_keys!3760 newMap!16))))) (or ((_ is Undefined!231) lt!27956) ((_ is Found!231) lt!27956) ((_ is MissingZero!231) lt!27956) (not ((_ is MissingVacant!231) lt!27956)) (and (bvsge (index!3054 lt!27956) #b00000000000000000000000000000000) (bvslt (index!3054 lt!27956) (size!2045 (_keys!3760 newMap!16))))) (or ((_ is Undefined!231) lt!27956) (ite ((_ is Found!231) lt!27956) (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!27956)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (ite ((_ is MissingZero!231) lt!27956) (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3051 lt!27956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!231) lt!27956) (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3054 lt!27956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13645 (= lt!27956 e!42741)))

(declare-fun c!8969 () Bool)

(assert (=> d!13645 (= c!8969 (and ((_ is Intermediate!231) lt!27957) (undefined!1043 lt!27957)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3789 (_ BitVec 32)) SeekEntryResult!231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13645 (= lt!27957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (mask!6044 newMap!16)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(assert (=> d!13645 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13645 (= (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)) lt!27956)))

(declare-fun b!65241 () Bool)

(assert (=> b!65241 (= e!42741 Undefined!231)))

(declare-fun b!65242 () Bool)

(assert (=> b!65242 (= e!42740 (Found!231 (index!3053 lt!27957)))))

(assert (= (and d!13645 c!8969) b!65241))

(assert (= (and d!13645 (not c!8969)) b!65238))

(assert (= (and b!65238 c!8971) b!65242))

(assert (= (and b!65238 (not c!8971)) b!65239))

(assert (= (and b!65239 c!8970) b!65240))

(assert (= (and b!65239 (not c!8970)) b!65237))

(assert (=> b!65237 m!59481))

(declare-fun m!60129 () Bool)

(assert (=> b!65237 m!60129))

(declare-fun m!60131 () Bool)

(assert (=> b!65238 m!60131))

(declare-fun m!60133 () Bool)

(assert (=> d!13645 m!60133))

(assert (=> d!13645 m!59481))

(declare-fun m!60135 () Bool)

(assert (=> d!13645 m!60135))

(declare-fun m!60137 () Bool)

(assert (=> d!13645 m!60137))

(assert (=> d!13645 m!60135))

(assert (=> d!13645 m!59481))

(declare-fun m!60139 () Bool)

(assert (=> d!13645 m!60139))

(declare-fun m!60141 () Bool)

(assert (=> d!13645 m!60141))

(assert (=> d!13645 m!59787))

(assert (=> bm!5287 d!13645))

(assert (=> b!65013 d!13551))

(declare-fun d!13647 () Bool)

(assert (=> d!13647 (= (apply!70 lt!27753 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1100 (getValueByKey!128 (toList!707 lt!27753) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2839 () Bool)

(assert (= bs!2839 d!13647))

(assert (=> bs!2839 m!59655))

(assert (=> bs!2839 m!60045))

(assert (=> bs!2839 m!60045))

(declare-fun m!60143 () Bool)

(assert (=> bs!2839 m!60143))

(assert (=> b!64991 d!13647))

(declare-fun d!13649 () Bool)

(declare-fun c!8972 () Bool)

(assert (=> d!13649 (= c!8972 ((_ is ValueCellFull!870) (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42742 () V!2883)

(assert (=> d!13649 (= (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42742)))

(declare-fun b!65243 () Bool)

(assert (=> b!65243 (= e!42742 (get!1098 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65244 () Bool)

(assert (=> b!65244 (= e!42742 (get!1099 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13649 c!8972) b!65243))

(assert (= (and d!13649 (not c!8972)) b!65244))

(assert (=> b!65243 m!59663))

(assert (=> b!65243 m!59487))

(declare-fun m!60145 () Bool)

(assert (=> b!65243 m!60145))

(assert (=> b!65244 m!59663))

(assert (=> b!65244 m!59487))

(declare-fun m!60147 () Bool)

(assert (=> b!65244 m!60147))

(assert (=> b!64991 d!13649))

(declare-fun d!13651 () Bool)

(declare-fun e!42743 () Bool)

(assert (=> d!13651 e!42743))

(declare-fun res!35510 () Bool)

(assert (=> d!13651 (=> res!35510 e!42743)))

(declare-fun lt!27962 () Bool)

(assert (=> d!13651 (= res!35510 (not lt!27962))))

(declare-fun lt!27960 () Bool)

(assert (=> d!13651 (= lt!27962 lt!27960)))

(declare-fun lt!27959 () Unit!1783)

(declare-fun e!42744 () Unit!1783)

(assert (=> d!13651 (= lt!27959 e!42744)))

(declare-fun c!8973 () Bool)

(assert (=> d!13651 (= c!8973 lt!27960)))

(assert (=> d!13651 (= lt!27960 (containsKey!132 (toList!707 call!5292) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13651 (= (contains!698 call!5292 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27962)))

(declare-fun b!65245 () Bool)

(declare-fun lt!27961 () Unit!1783)

(assert (=> b!65245 (= e!42744 lt!27961)))

(assert (=> b!65245 (= lt!27961 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 call!5292) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65245 (isDefined!81 (getValueByKey!128 (toList!707 call!5292) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65246 () Bool)

(declare-fun Unit!1801 () Unit!1783)

(assert (=> b!65246 (= e!42744 Unit!1801)))

(declare-fun b!65247 () Bool)

(assert (=> b!65247 (= e!42743 (isDefined!81 (getValueByKey!128 (toList!707 call!5292) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13651 c!8973) b!65245))

(assert (= (and d!13651 (not c!8973)) b!65246))

(assert (= (and d!13651 (not res!35510)) b!65247))

(assert (=> d!13651 m!59481))

(declare-fun m!60149 () Bool)

(assert (=> d!13651 m!60149))

(assert (=> b!65245 m!59481))

(declare-fun m!60151 () Bool)

(assert (=> b!65245 m!60151))

(assert (=> b!65245 m!59481))

(declare-fun m!60153 () Bool)

(assert (=> b!65245 m!60153))

(assert (=> b!65245 m!60153))

(declare-fun m!60155 () Bool)

(assert (=> b!65245 m!60155))

(assert (=> b!65247 m!59481))

(assert (=> b!65247 m!60153))

(assert (=> b!65247 m!60153))

(assert (=> b!65247 m!60155))

(assert (=> b!64877 d!13651))

(assert (=> d!13549 d!13555))

(declare-fun d!13653 () Bool)

(assert (=> d!13653 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1445)))

(assert (=> d!13653 true))

(declare-fun _$71!84 () Unit!1783)

(assert (=> d!13653 (= (choose!39 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!84)))

(declare-fun bs!2840 () Bool)

(assert (= bs!2840 d!13653))

(assert (=> bs!2840 m!59495))

(assert (=> d!13549 d!13653))

(assert (=> b!65018 d!13567))

(assert (=> b!64889 d!13645))

(declare-fun d!13655 () Bool)

(declare-fun lt!27963 () Bool)

(assert (=> d!13655 (= lt!27963 (select (content!70 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42746 () Bool)

(assert (=> d!13655 (= lt!27963 e!42746)))

(declare-fun res!35512 () Bool)

(assert (=> d!13655 (=> (not res!35512) (not e!42746))))

(assert (=> d!13655 (= res!35512 ((_ is Cons!1444) Nil!1445))))

(assert (=> d!13655 (= (contains!700 Nil!1445 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27963)))

(declare-fun b!65248 () Bool)

(declare-fun e!42745 () Bool)

(assert (=> b!65248 (= e!42746 e!42745)))

(declare-fun res!35511 () Bool)

(assert (=> b!65248 (=> res!35511 e!42745)))

(assert (=> b!65248 (= res!35511 (= (h!2028 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65249 () Bool)

(assert (=> b!65249 (= e!42745 (contains!700 (t!4878 Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13655 res!35512) b!65248))

(assert (= (and b!65248 (not res!35511)) b!65249))

(assert (=> d!13655 m!60087))

(assert (=> d!13655 m!59481))

(declare-fun m!60157 () Bool)

(assert (=> d!13655 m!60157))

(assert (=> b!65249 m!59481))

(declare-fun m!60159 () Bool)

(assert (=> b!65249 m!60159))

(assert (=> b!65016 d!13655))

(declare-fun d!13657 () Bool)

(declare-fun e!42749 () Bool)

(assert (=> d!13657 e!42749))

(declare-fun c!8976 () Bool)

(assert (=> d!13657 (= c!8976 (and (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13657 true))

(declare-fun _$29!78 () Unit!1783)

(assert (=> d!13657 (= (choose!353 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (_values!2105 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992))) (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) (zeroValue!2031 (v!2447 (underlying!239 thiss!992))) (minValue!2031 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992)))) _$29!78)))

(declare-fun b!65254 () Bool)

(assert (=> b!65254 (= e!42749 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!65255 () Bool)

(assert (=> b!65255 (= e!42749 (ite (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1995 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13657 c!8976) b!65254))

(assert (= (and d!13657 (not c!8976)) b!65255))

(assert (=> b!65254 m!59481))

(assert (=> b!65254 m!59499))

(assert (=> d!13553 d!13657))

(assert (=> d!13553 d!13545))

(declare-fun d!13659 () Bool)

(assert (=> d!13659 (= (get!1099 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64915 d!13659))

(declare-fun d!13661 () Bool)

(declare-fun e!42750 () Bool)

(assert (=> d!13661 e!42750))

(declare-fun res!35513 () Bool)

(assert (=> d!13661 (=> res!35513 e!42750)))

(declare-fun lt!27967 () Bool)

(assert (=> d!13661 (= res!35513 (not lt!27967))))

(declare-fun lt!27965 () Bool)

(assert (=> d!13661 (= lt!27967 lt!27965)))

(declare-fun lt!27964 () Unit!1783)

(declare-fun e!42751 () Unit!1783)

(assert (=> d!13661 (= lt!27964 e!42751)))

(declare-fun c!8977 () Bool)

(assert (=> d!13661 (= c!8977 lt!27965)))

(assert (=> d!13661 (= lt!27965 (containsKey!132 (toList!707 e!42520) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13661 (= (contains!698 e!42520 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27967)))

(declare-fun b!65256 () Bool)

(declare-fun lt!27966 () Unit!1783)

(assert (=> b!65256 (= e!42751 lt!27966)))

(assert (=> b!65256 (= lt!27966 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 e!42520) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65256 (isDefined!81 (getValueByKey!128 (toList!707 e!42520) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65257 () Bool)

(declare-fun Unit!1802 () Unit!1783)

(assert (=> b!65257 (= e!42751 Unit!1802)))

(declare-fun b!65258 () Bool)

(assert (=> b!65258 (= e!42750 (isDefined!81 (getValueByKey!128 (toList!707 e!42520) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13661 c!8977) b!65256))

(assert (= (and d!13661 (not c!8977)) b!65257))

(assert (= (and d!13661 (not res!35513)) b!65258))

(assert (=> d!13661 m!59481))

(declare-fun m!60161 () Bool)

(assert (=> d!13661 m!60161))

(assert (=> b!65256 m!59481))

(declare-fun m!60163 () Bool)

(assert (=> b!65256 m!60163))

(assert (=> b!65256 m!59481))

(declare-fun m!60165 () Bool)

(assert (=> b!65256 m!60165))

(assert (=> b!65256 m!60165))

(declare-fun m!60167 () Bool)

(assert (=> b!65256 m!60167))

(assert (=> b!65258 m!59481))

(assert (=> b!65258 m!60165))

(assert (=> b!65258 m!60165))

(assert (=> b!65258 m!60167))

(assert (=> bm!5275 d!13661))

(declare-fun d!13663 () Bool)

(declare-fun e!42752 () Bool)

(assert (=> d!13663 e!42752))

(declare-fun res!35514 () Bool)

(assert (=> d!13663 (=> res!35514 e!42752)))

(declare-fun lt!27971 () Bool)

(assert (=> d!13663 (= res!35514 (not lt!27971))))

(declare-fun lt!27969 () Bool)

(assert (=> d!13663 (= lt!27971 lt!27969)))

(declare-fun lt!27968 () Unit!1783)

(declare-fun e!42753 () Unit!1783)

(assert (=> d!13663 (= lt!27968 e!42753)))

(declare-fun c!8978 () Bool)

(assert (=> d!13663 (= c!8978 lt!27969)))

(assert (=> d!13663 (= lt!27969 (containsKey!132 (toList!707 lt!27753) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13663 (= (contains!698 lt!27753 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27971)))

(declare-fun b!65259 () Bool)

(declare-fun lt!27970 () Unit!1783)

(assert (=> b!65259 (= e!42753 lt!27970)))

(assert (=> b!65259 (= lt!27970 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 lt!27753) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65259 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65260 () Bool)

(declare-fun Unit!1803 () Unit!1783)

(assert (=> b!65260 (= e!42753 Unit!1803)))

(declare-fun b!65261 () Bool)

(assert (=> b!65261 (= e!42752 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13663 c!8978) b!65259))

(assert (= (and d!13663 (not c!8978)) b!65260))

(assert (= (and d!13663 (not res!35514)) b!65261))

(declare-fun m!60169 () Bool)

(assert (=> d!13663 m!60169))

(declare-fun m!60171 () Bool)

(assert (=> b!65259 m!60171))

(assert (=> b!65259 m!60105))

(assert (=> b!65259 m!60105))

(declare-fun m!60173 () Bool)

(assert (=> b!65259 m!60173))

(assert (=> b!65261 m!60105))

(assert (=> b!65261 m!60105))

(assert (=> b!65261 m!60173))

(assert (=> bm!5314 d!13663))

(declare-fun d!13665 () Bool)

(declare-fun res!35515 () Bool)

(declare-fun e!42754 () Bool)

(assert (=> d!13665 (=> (not res!35515) (not e!42754))))

(assert (=> d!13665 (= res!35515 (simpleValid!46 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13665 (= (valid!268 (v!2447 (underlying!239 thiss!992))) e!42754)))

(declare-fun b!65262 () Bool)

(declare-fun res!35516 () Bool)

(assert (=> b!65262 (=> (not res!35516) (not e!42754))))

(assert (=> b!65262 (= res!35516 (= (arrayCountValidKeys!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))) (_size!373 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65263 () Bool)

(declare-fun res!35517 () Bool)

(assert (=> b!65263 (=> (not res!35517) (not e!42754))))

(assert (=> b!65263 (= res!35517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65264 () Bool)

(assert (=> b!65264 (= e!42754 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1445))))

(assert (= (and d!13665 res!35515) b!65262))

(assert (= (and b!65262 res!35516) b!65263))

(assert (= (and b!65263 res!35517) b!65264))

(declare-fun m!60175 () Bool)

(assert (=> d!13665 m!60175))

(declare-fun m!60177 () Bool)

(assert (=> b!65262 m!60177))

(assert (=> b!65263 m!59505))

(assert (=> b!65264 m!59503))

(assert (=> d!13543 d!13665))

(declare-fun b!65265 () Bool)

(declare-fun e!42755 () Bool)

(declare-fun call!5354 () Bool)

(assert (=> b!65265 (= e!42755 call!5354)))

(declare-fun bm!5351 () Bool)

(declare-fun c!8979 () Bool)

(assert (=> bm!5351 (= call!5354 (arrayNoDuplicates!0 (_keys!3760 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8979 (Cons!1444 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000) Nil!1445) Nil!1445)))))

(declare-fun b!65266 () Bool)

(declare-fun e!42757 () Bool)

(assert (=> b!65266 (= e!42757 (contains!700 Nil!1445 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65267 () Bool)

(assert (=> b!65267 (= e!42755 call!5354)))

(declare-fun d!13667 () Bool)

(declare-fun res!35520 () Bool)

(declare-fun e!42756 () Bool)

(assert (=> d!13667 (=> res!35520 e!42756)))

(assert (=> d!13667 (= res!35520 (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13667 (= (arrayNoDuplicates!0 (_keys!3760 newMap!16) #b00000000000000000000000000000000 Nil!1445) e!42756)))

(declare-fun b!65268 () Bool)

(declare-fun e!42758 () Bool)

(assert (=> b!65268 (= e!42756 e!42758)))

(declare-fun res!35519 () Bool)

(assert (=> b!65268 (=> (not res!35519) (not e!42758))))

(assert (=> b!65268 (= res!35519 (not e!42757))))

(declare-fun res!35518 () Bool)

(assert (=> b!65268 (=> (not res!35518) (not e!42757))))

(assert (=> b!65268 (= res!35518 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65269 () Bool)

(assert (=> b!65269 (= e!42758 e!42755)))

(assert (=> b!65269 (= c!8979 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!13667 (not res!35520)) b!65268))

(assert (= (and b!65268 res!35518) b!65266))

(assert (= (and b!65268 res!35519) b!65269))

(assert (= (and b!65269 c!8979) b!65267))

(assert (= (and b!65269 (not c!8979)) b!65265))

(assert (= (or b!65267 b!65265) bm!5351))

(assert (=> bm!5351 m!59739))

(declare-fun m!60179 () Bool)

(assert (=> bm!5351 m!60179))

(assert (=> b!65266 m!59739))

(assert (=> b!65266 m!59739))

(declare-fun m!60181 () Bool)

(assert (=> b!65266 m!60181))

(assert (=> b!65268 m!59739))

(assert (=> b!65268 m!59739))

(assert (=> b!65268 m!59741))

(assert (=> b!65269 m!59739))

(assert (=> b!65269 m!59739))

(assert (=> b!65269 m!59741))

(assert (=> b!64924 d!13667))

(declare-fun d!13669 () Bool)

(assert (=> d!13669 (= (map!1122 (_2!1039 lt!27694)) (getCurrentListMap!409 (_keys!3760 (_2!1039 lt!27694)) (_values!2105 (_2!1039 lt!27694)) (mask!6044 (_2!1039 lt!27694)) (extraKeys!1995 (_2!1039 lt!27694)) (zeroValue!2031 (_2!1039 lt!27694)) (minValue!2031 (_2!1039 lt!27694)) #b00000000000000000000000000000000 (defaultEntry!2122 (_2!1039 lt!27694))))))

(declare-fun bs!2841 () Bool)

(assert (= bs!2841 d!13669))

(declare-fun m!60183 () Bool)

(assert (=> bs!2841 m!60183))

(assert (=> bm!5291 d!13669))

(declare-fun b!65278 () Bool)

(declare-fun e!42764 () (_ BitVec 32))

(declare-fun e!42763 () (_ BitVec 32))

(assert (=> b!65278 (= e!42764 e!42763)))

(declare-fun c!8985 () Bool)

(assert (=> b!65278 (= c!8985 (validKeyInArray!0 (select (arr!1811 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65279 () Bool)

(declare-fun call!5357 () (_ BitVec 32))

(assert (=> b!65279 (= e!42763 (bvadd #b00000000000000000000000000000001 call!5357))))

(declare-fun d!13671 () Bool)

(declare-fun lt!27974 () (_ BitVec 32))

(assert (=> d!13671 (and (bvsge lt!27974 #b00000000000000000000000000000000) (bvsle lt!27974 (bvsub (size!2045 (_keys!3760 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13671 (= lt!27974 e!42764)))

(declare-fun c!8984 () Bool)

(assert (=> d!13671 (= c!8984 (bvsge #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13671 (and (bvsle #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2045 (_keys!3760 newMap!16)) (size!2045 (_keys!3760 newMap!16))))))

(assert (=> d!13671 (= (arrayCountValidKeys!0 (_keys!3760 newMap!16) #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) lt!27974)))

(declare-fun bm!5354 () Bool)

(assert (=> bm!5354 (= call!5357 (arrayCountValidKeys!0 (_keys!3760 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65280 () Bool)

(assert (=> b!65280 (= e!42763 call!5357)))

(declare-fun b!65281 () Bool)

(assert (=> b!65281 (= e!42764 #b00000000000000000000000000000000)))

(assert (= (and d!13671 c!8984) b!65281))

(assert (= (and d!13671 (not c!8984)) b!65278))

(assert (= (and b!65278 c!8985) b!65279))

(assert (= (and b!65278 (not c!8985)) b!65280))

(assert (= (or b!65279 b!65280) bm!5354))

(assert (=> b!65278 m!59739))

(assert (=> b!65278 m!59739))

(assert (=> b!65278 m!59741))

(declare-fun m!60185 () Bool)

(assert (=> bm!5354 m!60185))

(assert (=> b!64922 d!13671))

(declare-fun d!13673 () Bool)

(declare-fun res!35521 () Bool)

(declare-fun e!42765 () Bool)

(assert (=> d!13673 (=> res!35521 e!42765)))

(assert (=> d!13673 (= res!35521 (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13673 (= (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42765)))

(declare-fun b!65282 () Bool)

(declare-fun e!42766 () Bool)

(assert (=> b!65282 (= e!42765 e!42766)))

(declare-fun res!35522 () Bool)

(assert (=> b!65282 (=> (not res!35522) (not e!42766))))

(assert (=> b!65282 (= res!35522 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65283 () Bool)

(assert (=> b!65283 (= e!42766 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13673 (not res!35521)) b!65282))

(assert (= (and b!65282 res!35522) b!65283))

(declare-fun m!60187 () Bool)

(assert (=> d!13673 m!60187))

(assert (=> b!65283 m!59481))

(declare-fun m!60189 () Bool)

(assert (=> b!65283 m!60189))

(assert (=> b!65008 d!13673))

(declare-fun d!13675 () Bool)

(assert (=> d!13675 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000)))

(declare-fun lt!27977 () Unit!1783)

(declare-fun choose!13 (array!3789 (_ BitVec 64) (_ BitVec 32)) Unit!1783)

(assert (=> d!13675 (= lt!27977 (choose!13 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000))))

(assert (=> d!13675 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13675 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000) lt!27977)))

(declare-fun bs!2842 () Bool)

(assert (= bs!2842 d!13675))

(assert (=> bs!2842 m!59731))

(declare-fun m!60191 () Bool)

(assert (=> bs!2842 m!60191))

(assert (=> b!65031 d!13675))

(declare-fun d!13677 () Bool)

(declare-fun res!35523 () Bool)

(declare-fun e!42767 () Bool)

(assert (=> d!13677 (=> res!35523 e!42767)))

(assert (=> d!13677 (= res!35523 (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) lt!27786))))

(assert (=> d!13677 (= (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 #b00000000000000000000000000000000) e!42767)))

(declare-fun b!65284 () Bool)

(declare-fun e!42768 () Bool)

(assert (=> b!65284 (= e!42767 e!42768)))

(declare-fun res!35524 () Bool)

(assert (=> b!65284 (=> (not res!35524) (not e!42768))))

(assert (=> b!65284 (= res!35524 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65285 () Bool)

(assert (=> b!65285 (= e!42768 (arrayContainsKey!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) lt!27786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13677 (not res!35523)) b!65284))

(assert (= (and b!65284 res!35524) b!65285))

(assert (=> d!13677 m!59647))

(declare-fun m!60193 () Bool)

(assert (=> b!65285 m!60193))

(assert (=> b!65031 d!13677))

(declare-fun b!65286 () Bool)

(declare-fun e!42769 () SeekEntryResult!231)

(declare-fun lt!27979 () SeekEntryResult!231)

(assert (=> b!65286 (= e!42769 (seekKeyOrZeroReturnVacant!0 (x!10542 lt!27979) (index!3053 lt!27979) (index!3053 lt!27979) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65287 () Bool)

(declare-fun e!42771 () SeekEntryResult!231)

(declare-fun e!42770 () SeekEntryResult!231)

(assert (=> b!65287 (= e!42771 e!42770)))

(declare-fun lt!27980 () (_ BitVec 64))

(assert (=> b!65287 (= lt!27980 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (index!3053 lt!27979)))))

(declare-fun c!8988 () Bool)

(assert (=> b!65287 (= c!8988 (= lt!27980 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65288 () Bool)

(declare-fun c!8987 () Bool)

(assert (=> b!65288 (= c!8987 (= lt!27980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65288 (= e!42770 e!42769)))

(declare-fun b!65289 () Bool)

(assert (=> b!65289 (= e!42769 (MissingZero!231 (index!3053 lt!27979)))))

(declare-fun d!13679 () Bool)

(declare-fun lt!27978 () SeekEntryResult!231)

(assert (=> d!13679 (and (or ((_ is Undefined!231) lt!27978) (not ((_ is Found!231) lt!27978)) (and (bvsge (index!3052 lt!27978) #b00000000000000000000000000000000) (bvslt (index!3052 lt!27978) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!231) lt!27978) ((_ is Found!231) lt!27978) (not ((_ is MissingZero!231) lt!27978)) (and (bvsge (index!3051 lt!27978) #b00000000000000000000000000000000) (bvslt (index!3051 lt!27978) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!231) lt!27978) ((_ is Found!231) lt!27978) ((_ is MissingZero!231) lt!27978) (not ((_ is MissingVacant!231) lt!27978)) (and (bvsge (index!3054 lt!27978) #b00000000000000000000000000000000) (bvslt (index!3054 lt!27978) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!231) lt!27978) (ite ((_ is Found!231) lt!27978) (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (index!3052 lt!27978)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!231) lt!27978) (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (index!3051 lt!27978)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!231) lt!27978) (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (index!3054 lt!27978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13679 (= lt!27978 e!42771)))

(declare-fun c!8986 () Bool)

(assert (=> d!13679 (= c!8986 (and ((_ is Intermediate!231) lt!27979) (undefined!1043 lt!27979)))))

(assert (=> d!13679 (= lt!27979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (mask!6044 (v!2447 (underlying!239 thiss!992)))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))))))

(assert (=> d!13679 (validMask!0 (mask!6044 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13679 (= (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3760 (v!2447 (underlying!239 thiss!992))) (mask!6044 (v!2447 (underlying!239 thiss!992)))) lt!27978)))

(declare-fun b!65290 () Bool)

(assert (=> b!65290 (= e!42771 Undefined!231)))

(declare-fun b!65291 () Bool)

(assert (=> b!65291 (= e!42770 (Found!231 (index!3053 lt!27979)))))

(assert (= (and d!13679 c!8986) b!65290))

(assert (= (and d!13679 (not c!8986)) b!65287))

(assert (= (and b!65287 c!8988) b!65291))

(assert (= (and b!65287 (not c!8988)) b!65288))

(assert (= (and b!65288 c!8987) b!65289))

(assert (= (and b!65288 (not c!8987)) b!65286))

(assert (=> b!65286 m!59647))

(declare-fun m!60195 () Bool)

(assert (=> b!65286 m!60195))

(declare-fun m!60197 () Bool)

(assert (=> b!65287 m!60197))

(declare-fun m!60199 () Bool)

(assert (=> d!13679 m!60199))

(assert (=> d!13679 m!59647))

(declare-fun m!60201 () Bool)

(assert (=> d!13679 m!60201))

(declare-fun m!60203 () Bool)

(assert (=> d!13679 m!60203))

(assert (=> d!13679 m!60201))

(assert (=> d!13679 m!59647))

(declare-fun m!60205 () Bool)

(assert (=> d!13679 m!60205))

(declare-fun m!60207 () Bool)

(assert (=> d!13679 m!60207))

(assert (=> d!13679 m!59507))

(assert (=> b!65031 d!13679))

(declare-fun d!13681 () Bool)

(assert (=> d!13681 (= (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64986 d!13681))

(declare-fun d!13683 () Bool)

(declare-fun e!42772 () Bool)

(assert (=> d!13683 e!42772))

(declare-fun res!35525 () Bool)

(assert (=> d!13683 (=> res!35525 e!42772)))

(declare-fun lt!27984 () Bool)

(assert (=> d!13683 (= res!35525 (not lt!27984))))

(declare-fun lt!27982 () Bool)

(assert (=> d!13683 (= lt!27984 lt!27982)))

(declare-fun lt!27981 () Unit!1783)

(declare-fun e!42773 () Unit!1783)

(assert (=> d!13683 (= lt!27981 e!42773)))

(declare-fun c!8989 () Bool)

(assert (=> d!13683 (= c!8989 lt!27982)))

(assert (=> d!13683 (= lt!27982 (containsKey!132 (toList!707 lt!27753) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13683 (= (contains!698 lt!27753 #b0000000000000000000000000000000000000000000000000000000000000000) lt!27984)))

(declare-fun b!65292 () Bool)

(declare-fun lt!27983 () Unit!1783)

(assert (=> b!65292 (= e!42773 lt!27983)))

(assert (=> b!65292 (= lt!27983 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 lt!27753) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65292 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65293 () Bool)

(declare-fun Unit!1804 () Unit!1783)

(assert (=> b!65293 (= e!42773 Unit!1804)))

(declare-fun b!65294 () Bool)

(assert (=> b!65294 (= e!42772 (isDefined!81 (getValueByKey!128 (toList!707 lt!27753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13683 c!8989) b!65292))

(assert (= (and d!13683 (not c!8989)) b!65293))

(assert (= (and d!13683 (not res!35525)) b!65294))

(declare-fun m!60209 () Bool)

(assert (=> d!13683 m!60209))

(declare-fun m!60211 () Bool)

(assert (=> b!65292 m!60211))

(declare-fun m!60213 () Bool)

(assert (=> b!65292 m!60213))

(assert (=> b!65292 m!60213))

(declare-fun m!60215 () Bool)

(assert (=> b!65292 m!60215))

(assert (=> b!65294 m!60213))

(assert (=> b!65294 m!60213))

(assert (=> b!65294 m!60215))

(assert (=> bm!5318 d!13683))

(assert (=> bm!5313 d!13587))

(declare-fun d!13685 () Bool)

(assert (=> d!13685 (= (apply!70 lt!27753 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1100 (getValueByKey!128 (toList!707 lt!27753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2843 () Bool)

(assert (= bs!2843 d!13685))

(assert (=> bs!2843 m!60213))

(assert (=> bs!2843 m!60213))

(declare-fun m!60217 () Bool)

(assert (=> bs!2843 m!60217))

(assert (=> b!65000 d!13685))

(assert (=> b!64872 d!13563))

(assert (=> b!65028 d!13627))

(assert (=> b!64939 d!13627))

(declare-fun b!65329 () Bool)

(declare-fun e!42797 () Bool)

(declare-fun e!42790 () Bool)

(assert (=> b!65329 (= e!42797 e!42790)))

(declare-fun res!35548 () Bool)

(declare-fun call!5368 () Bool)

(assert (=> b!65329 (= res!35548 call!5368)))

(assert (=> b!65329 (=> (not res!35548) (not e!42790))))

(declare-fun b!65330 () Bool)

(declare-fun res!35551 () Bool)

(declare-fun e!42796 () Bool)

(assert (=> b!65330 (=> (not res!35551) (not e!42796))))

(declare-fun lt!28059 () SeekEntryResult!231)

(assert (=> b!65330 (= res!35551 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3051 lt!28059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65331 () Bool)

(declare-fun e!42792 () Unit!1783)

(declare-fun Unit!1805 () Unit!1783)

(assert (=> b!65331 (= e!42792 Unit!1805)))

(declare-fun lt!28069 () Unit!1783)

(declare-fun lemmaArrayContainsKeyThenInListMap!9 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) (_ BitVec 32) Int) Unit!1783)

(assert (=> b!65331 (= lt!28069 (lemmaArrayContainsKeyThenInListMap!9 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(assert (=> b!65331 (contains!698 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))

(declare-fun lt!28053 () Unit!1783)

(assert (=> b!65331 (= lt!28053 lt!28069)))

(assert (=> b!65331 false))

(declare-fun b!65332 () Bool)

(declare-fun res!35549 () Bool)

(declare-fun e!42793 () Bool)

(assert (=> b!65332 (=> (not res!35549) (not e!42793))))

(declare-fun lt!28065 () tuple2!2056)

(assert (=> b!65332 (= res!35549 (contains!698 (map!1122 (_2!1039 lt!28065)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun call!5366 () Bool)

(declare-fun bm!5363 () Bool)

(assert (=> bm!5363 (= call!5366 (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!65333 () Bool)

(declare-fun res!35545 () Bool)

(declare-fun call!5367 () Bool)

(assert (=> b!65333 (= res!35545 call!5367)))

(declare-fun e!42795 () Bool)

(assert (=> b!65333 (=> (not res!35545) (not e!42795))))

(declare-fun b!65334 () Bool)

(assert (=> b!65334 (= e!42797 ((_ is Undefined!231) lt!28059))))

(declare-fun b!65335 () Bool)

(declare-fun res!35547 () Bool)

(assert (=> b!65335 (=> (not res!35547) (not e!42796))))

(assert (=> b!65335 (= res!35547 call!5368)))

(declare-fun e!42791 () Bool)

(assert (=> b!65335 (= e!42791 e!42796)))

(declare-fun bm!5364 () Bool)

(assert (=> bm!5364 (= call!5368 call!5367)))

(declare-fun d!13687 () Bool)

(assert (=> d!13687 e!42793))

(declare-fun res!35550 () Bool)

(assert (=> d!13687 (=> (not res!35550) (not e!42793))))

(assert (=> d!13687 (= res!35550 (_1!1039 lt!28065))))

(assert (=> d!13687 (= lt!28065 (tuple2!2057 true (LongMapFixedSize!649 (defaultEntry!2122 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (bvadd (_size!373 newMap!16) #b00000000000000000000000000000001) (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))) (_vacant!373 newMap!16))))))

(declare-fun lt!28064 () Unit!1783)

(declare-fun lt!28066 () Unit!1783)

(assert (=> d!13687 (= lt!28064 lt!28066)))

(declare-fun lt!28054 () array!3789)

(declare-fun lt!28051 () array!3791)

(assert (=> d!13687 (contains!698 (getCurrentListMap!409 lt!28054 lt!28051 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (select (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702))))))

(assert (=> d!13687 (= lt!28066 (lemmaValidKeyInArrayIsInListMap!80 lt!28054 lt!28051 (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13687 (= lt!28051 (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))))))

(assert (=> d!13687 (= lt!28054 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun lt!28073 () Unit!1783)

(declare-fun lt!28063 () Unit!1783)

(assert (=> d!13687 (= lt!28073 lt!28063)))

(declare-fun lt!28048 () array!3789)

(assert (=> d!13687 (= (arrayCountValidKeys!0 lt!28048 (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (bvadd (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3789 (_ BitVec 32)) Unit!1783)

(assert (=> d!13687 (= lt!28063 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!28048 (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702))))))

(assert (=> d!13687 (= lt!28048 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun lt!28045 () Unit!1783)

(declare-fun lt!28071 () Unit!1783)

(assert (=> d!13687 (= lt!28045 lt!28071)))

(declare-fun lt!28055 () array!3789)

(assert (=> d!13687 (arrayContainsKey!0 lt!28055 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13687 (= lt!28071 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!28055 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702))))))

(assert (=> d!13687 (= lt!28055 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun lt!28061 () Unit!1783)

(declare-fun lt!28046 () Unit!1783)

(assert (=> d!13687 (= lt!28061 lt!28046)))

(assert (=> d!13687 (= (+!85 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!409 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))) (array!3792 (store (arr!1812 (_values!2105 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (ValueCellFull!870 (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2046 (_values!2105 newMap!16))) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!9 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 32) (_ BitVec 64) V!2883 Int) Unit!1783)

(assert (=> d!13687 (= lt!28046 (lemmaAddValidKeyToArrayThenAddPairToListMap!9 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2122 newMap!16)))))

(declare-fun lt!28050 () Unit!1783)

(declare-fun lt!28060 () Unit!1783)

(assert (=> d!13687 (= lt!28050 lt!28060)))

(assert (=> d!13687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))) (mask!6044 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3789 (_ BitVec 32) (_ BitVec 32)) Unit!1783)

(assert (=> d!13687 (= lt!28060 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (mask!6044 newMap!16)))))

(declare-fun lt!28062 () Unit!1783)

(declare-fun lt!28067 () Unit!1783)

(assert (=> d!13687 (= lt!28062 lt!28067)))

(assert (=> d!13687 (= (arrayCountValidKeys!0 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))) #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3760 newMap!16) #b00000000000000000000000000000000 (size!2045 (_keys!3760 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3789 (_ BitVec 32) (_ BitVec 64)) Unit!1783)

(assert (=> d!13687 (= lt!28067 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3760 newMap!16) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun lt!28047 () Unit!1783)

(declare-fun lt!28072 () Unit!1783)

(assert (=> d!13687 (= lt!28047 lt!28072)))

(declare-fun lt!28074 () (_ BitVec 32))

(declare-fun lt!28068 () List!1448)

(assert (=> d!13687 (arrayNoDuplicates!0 (array!3790 (store (arr!1811 (_keys!3760 newMap!16)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2045 (_keys!3760 newMap!16))) lt!28074 lt!28068)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3789 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1448) Unit!1783)

(assert (=> d!13687 (= lt!28072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702)) lt!28074 lt!28068))))

(assert (=> d!13687 (= lt!28068 Nil!1445)))

(assert (=> d!13687 (= lt!28074 #b00000000000000000000000000000000)))

(declare-fun lt!28049 () Unit!1783)

(assert (=> d!13687 (= lt!28049 e!42792)))

(declare-fun c!8998 () Bool)

(assert (=> d!13687 (= c!8998 (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!28058 () Unit!1783)

(declare-fun e!42794 () Unit!1783)

(assert (=> d!13687 (= lt!28058 e!42794)))

(declare-fun c!9001 () Bool)

(assert (=> d!13687 (= c!9001 (contains!698 (getCurrentListMap!409 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2122 newMap!16)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13687 (valid!268 newMap!16)))

(assert (=> d!13687 (= (updateHelperNewKey!19 newMap!16 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8888 (index!3054 lt!27702) (index!3051 lt!27702))) lt!28065)))

(declare-fun b!65336 () Bool)

(assert (=> b!65336 (= e!42790 (not call!5366))))

(declare-fun b!65337 () Bool)

(declare-fun res!35544 () Bool)

(assert (=> b!65337 (=> (not res!35544) (not e!42793))))

(assert (=> b!65337 (= res!35544 (valid!268 (_2!1039 lt!28065)))))

(declare-fun b!65338 () Bool)

(declare-fun Unit!1806 () Unit!1783)

(assert (=> b!65338 (= e!42794 Unit!1806)))

(declare-fun lt!28056 () Unit!1783)

(assert (=> b!65338 (= lt!28056 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(declare-fun lt!28057 () SeekEntryResult!231)

(declare-fun call!5369 () SeekEntryResult!231)

(assert (=> b!65338 (= lt!28057 call!5369)))

(declare-fun res!35546 () Bool)

(assert (=> b!65338 (= res!35546 ((_ is Found!231) lt!28057))))

(assert (=> b!65338 (=> (not res!35546) (not e!42795))))

(assert (=> b!65338 e!42795))

(declare-fun lt!28070 () Unit!1783)

(assert (=> b!65338 (= lt!28070 lt!28056)))

(assert (=> b!65338 false))

(declare-fun b!65339 () Bool)

(assert (=> b!65339 (= e!42795 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3052 lt!28057)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65340 () Bool)

(assert (=> b!65340 (= e!42796 (not call!5366))))

(declare-fun b!65341 () Bool)

(declare-fun lt!28052 () Unit!1783)

(assert (=> b!65341 (= e!42794 lt!28052)))

(assert (=> b!65341 (= lt!28052 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(assert (=> b!65341 (= lt!28059 call!5369)))

(declare-fun c!8999 () Bool)

(assert (=> b!65341 (= c!8999 ((_ is MissingZero!231) lt!28059))))

(assert (=> b!65341 e!42791))

(declare-fun bm!5365 () Bool)

(assert (=> bm!5365 (= call!5369 (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun b!65342 () Bool)

(declare-fun c!9000 () Bool)

(assert (=> b!65342 (= c!9000 ((_ is MissingVacant!231) lt!28059))))

(assert (=> b!65342 (= e!42791 e!42797)))

(declare-fun b!65343 () Bool)

(declare-fun res!35552 () Bool)

(assert (=> b!65343 (= res!35552 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3054 lt!28059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65343 (=> (not res!35552) (not e!42790))))

(declare-fun b!65344 () Bool)

(assert (=> b!65344 (= e!42793 (= (map!1122 (_2!1039 lt!28065)) (+!85 (map!1122 newMap!16) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!5366 () Bool)

(assert (=> bm!5366 (= call!5367 (inRange!0 (ite c!9001 (index!3052 lt!28057) (ite c!8999 (index!3051 lt!28059) (index!3054 lt!28059))) (mask!6044 newMap!16)))))

(declare-fun b!65345 () Bool)

(declare-fun Unit!1807 () Unit!1783)

(assert (=> b!65345 (= e!42792 Unit!1807)))

(assert (= (and d!13687 c!9001) b!65338))

(assert (= (and d!13687 (not c!9001)) b!65341))

(assert (= (and b!65338 res!35546) b!65333))

(assert (= (and b!65333 res!35545) b!65339))

(assert (= (and b!65341 c!8999) b!65335))

(assert (= (and b!65341 (not c!8999)) b!65342))

(assert (= (and b!65335 res!35547) b!65330))

(assert (= (and b!65330 res!35551) b!65340))

(assert (= (and b!65342 c!9000) b!65329))

(assert (= (and b!65342 (not c!9000)) b!65334))

(assert (= (and b!65329 res!35548) b!65343))

(assert (= (and b!65343 res!35552) b!65336))

(assert (= (or b!65335 b!65329) bm!5364))

(assert (= (or b!65340 b!65336) bm!5363))

(assert (= (or b!65333 bm!5364) bm!5366))

(assert (= (or b!65338 b!65341) bm!5365))

(assert (= (and d!13687 c!8998) b!65331))

(assert (= (and d!13687 (not c!8998)) b!65345))

(assert (= (and d!13687 res!35550) b!65337))

(assert (= (and b!65337 res!35544) b!65332))

(assert (= (and b!65332 res!35549) b!65344))

(declare-fun m!60219 () Bool)

(assert (=> b!65332 m!60219))

(assert (=> b!65332 m!60219))

(assert (=> b!65332 m!59481))

(declare-fun m!60221 () Bool)

(assert (=> b!65332 m!60221))

(declare-fun m!60223 () Bool)

(assert (=> bm!5366 m!60223))

(assert (=> b!65331 m!59481))

(declare-fun m!60225 () Bool)

(assert (=> b!65331 m!60225))

(assert (=> b!65331 m!59619))

(assert (=> b!65331 m!59619))

(assert (=> b!65331 m!59481))

(declare-fun m!60227 () Bool)

(assert (=> b!65331 m!60227))

(assert (=> b!65344 m!60219))

(assert (=> b!65344 m!59519))

(assert (=> b!65344 m!59519))

(declare-fun m!60229 () Bool)

(assert (=> b!65344 m!60229))

(assert (=> bm!5365 m!59481))

(assert (=> bm!5365 m!59581))

(declare-fun m!60231 () Bool)

(assert (=> b!65339 m!60231))

(assert (=> bm!5363 m!59481))

(assert (=> bm!5363 m!59593))

(declare-fun m!60233 () Bool)

(assert (=> b!65343 m!60233))

(declare-fun m!60235 () Bool)

(assert (=> d!13687 m!60235))

(declare-fun m!60237 () Bool)

(assert (=> d!13687 m!60237))

(assert (=> d!13687 m!59479))

(assert (=> d!13687 m!59641))

(assert (=> d!13687 m!59481))

(assert (=> d!13687 m!59489))

(declare-fun m!60239 () Bool)

(assert (=> d!13687 m!60239))

(assert (=> d!13687 m!59619))

(assert (=> d!13687 m!59481))

(assert (=> d!13687 m!60227))

(assert (=> d!13687 m!59481))

(declare-fun m!60241 () Bool)

(assert (=> d!13687 m!60241))

(declare-fun m!60243 () Bool)

(assert (=> d!13687 m!60243))

(assert (=> d!13687 m!59619))

(assert (=> d!13687 m!59481))

(assert (=> d!13687 m!59593))

(declare-fun m!60245 () Bool)

(assert (=> d!13687 m!60245))

(declare-fun m!60247 () Bool)

(assert (=> d!13687 m!60247))

(assert (=> d!13687 m!59619))

(assert (=> d!13687 m!60125))

(declare-fun m!60249 () Bool)

(assert (=> d!13687 m!60249))

(assert (=> d!13687 m!59481))

(declare-fun m!60251 () Bool)

(assert (=> d!13687 m!60251))

(declare-fun m!60253 () Bool)

(assert (=> d!13687 m!60253))

(assert (=> d!13687 m!60247))

(declare-fun m!60255 () Bool)

(assert (=> d!13687 m!60255))

(declare-fun m!60257 () Bool)

(assert (=> d!13687 m!60257))

(declare-fun m!60259 () Bool)

(assert (=> d!13687 m!60259))

(assert (=> d!13687 m!59481))

(declare-fun m!60261 () Bool)

(assert (=> d!13687 m!60261))

(assert (=> d!13687 m!59481))

(declare-fun m!60263 () Bool)

(assert (=> d!13687 m!60263))

(assert (=> d!13687 m!59481))

(declare-fun m!60265 () Bool)

(assert (=> d!13687 m!60265))

(declare-fun m!60267 () Bool)

(assert (=> d!13687 m!60267))

(assert (=> d!13687 m!60253))

(declare-fun m!60269 () Bool)

(assert (=> d!13687 m!60269))

(assert (=> b!65341 m!59481))

(assert (=> b!65341 m!59615))

(declare-fun m!60271 () Bool)

(assert (=> b!65337 m!60271))

(declare-fun m!60273 () Bool)

(assert (=> b!65330 m!60273))

(assert (=> b!65338 m!59481))

(assert (=> b!65338 m!59585))

(assert (=> bm!5278 d!13687))

(declare-fun d!13689 () Bool)

(declare-fun e!42798 () Bool)

(assert (=> d!13689 e!42798))

(declare-fun res!35554 () Bool)

(assert (=> d!13689 (=> (not res!35554) (not e!42798))))

(declare-fun lt!28078 () ListLongMap!1383)

(assert (=> d!13689 (= res!35554 (contains!698 lt!28078 (_1!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!28076 () List!1449)

(assert (=> d!13689 (= lt!28078 (ListLongMap!1384 lt!28076))))

(declare-fun lt!28075 () Unit!1783)

(declare-fun lt!28077 () Unit!1783)

(assert (=> d!13689 (= lt!28075 lt!28077)))

(assert (=> d!13689 (= (getValueByKey!128 lt!28076 (_1!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13689 (= lt!28077 (lemmaContainsTupThenGetReturnValue!45 lt!28076 (_1!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13689 (= lt!28076 (insertStrictlySorted!48 (toList!707 call!5320) (_1!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) (_2!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13689 (= (+!85 call!5320 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))) lt!28078)))

(declare-fun b!65346 () Bool)

(declare-fun res!35553 () Bool)

(assert (=> b!65346 (=> (not res!35553) (not e!42798))))

(assert (=> b!65346 (= res!35553 (= (getValueByKey!128 (toList!707 lt!28078) (_1!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (Some!133 (_2!1040 (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65347 () Bool)

(assert (=> b!65347 (= e!42798 (contains!701 (toList!707 lt!28078) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13689 res!35554) b!65346))

(assert (= (and b!65346 res!35553) b!65347))

(declare-fun m!60275 () Bool)

(assert (=> d!13689 m!60275))

(declare-fun m!60277 () Bool)

(assert (=> d!13689 m!60277))

(declare-fun m!60279 () Bool)

(assert (=> d!13689 m!60279))

(declare-fun m!60281 () Bool)

(assert (=> d!13689 m!60281))

(declare-fun m!60283 () Bool)

(assert (=> b!65346 m!60283))

(declare-fun m!60285 () Bool)

(assert (=> b!65347 m!60285))

(assert (=> b!64998 d!13689))

(declare-fun d!13691 () Bool)

(declare-fun e!42799 () Bool)

(assert (=> d!13691 e!42799))

(declare-fun res!35556 () Bool)

(assert (=> d!13691 (=> (not res!35556) (not e!42799))))

(declare-fun lt!28082 () ListLongMap!1383)

(assert (=> d!13691 (= res!35556 (contains!698 lt!28082 (_1!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun lt!28080 () List!1449)

(assert (=> d!13691 (= lt!28082 (ListLongMap!1384 lt!28080))))

(declare-fun lt!28079 () Unit!1783)

(declare-fun lt!28081 () Unit!1783)

(assert (=> d!13691 (= lt!28079 lt!28081)))

(assert (=> d!13691 (= (getValueByKey!128 lt!28080 (_1!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))) (Some!133 (_2!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13691 (= lt!28081 (lemmaContainsTupThenGetReturnValue!45 lt!28080 (_1!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (_2!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13691 (= lt!28080 (insertStrictlySorted!48 (toList!707 (ite c!8918 call!5317 (ite c!8919 call!5316 call!5321))) (_1!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) (_2!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13691 (= (+!85 (ite c!8918 call!5317 (ite c!8919 call!5316 call!5321)) (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))) lt!28082)))

(declare-fun b!65348 () Bool)

(declare-fun res!35555 () Bool)

(assert (=> b!65348 (=> (not res!35555) (not e!42799))))

(assert (=> b!65348 (= res!35555 (= (getValueByKey!128 (toList!707 lt!28082) (_1!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992))))))) (Some!133 (_2!1040 (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))))

(declare-fun b!65349 () Bool)

(assert (=> b!65349 (= e!42799 (contains!701 (toList!707 lt!28082) (ite (or c!8918 c!8919) (tuple2!2059 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2031 (v!2447 (underlying!239 thiss!992)))) (tuple2!2059 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2031 (v!2447 (underlying!239 thiss!992)))))))))

(assert (= (and d!13691 res!35556) b!65348))

(assert (= (and b!65348 res!35555) b!65349))

(declare-fun m!60287 () Bool)

(assert (=> d!13691 m!60287))

(declare-fun m!60289 () Bool)

(assert (=> d!13691 m!60289))

(declare-fun m!60291 () Bool)

(assert (=> d!13691 m!60291))

(declare-fun m!60293 () Bool)

(assert (=> d!13691 m!60293))

(declare-fun m!60295 () Bool)

(assert (=> b!65348 m!60295))

(declare-fun m!60297 () Bool)

(assert (=> b!65349 m!60297))

(assert (=> bm!5317 d!13691))

(declare-fun b!65350 () Bool)

(declare-fun e!42800 () Bool)

(declare-fun call!5370 () Bool)

(assert (=> b!65350 (= e!42800 call!5370)))

(declare-fun bm!5367 () Bool)

(declare-fun c!9002 () Bool)

(assert (=> bm!5367 (= call!5370 (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!9002 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!8901 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1445) Nil!1445)) (ite c!8901 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1445) Nil!1445))))))

(declare-fun b!65351 () Bool)

(declare-fun e!42802 () Bool)

(assert (=> b!65351 (= e!42802 (contains!700 (ite c!8901 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1445) Nil!1445) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!65352 () Bool)

(assert (=> b!65352 (= e!42800 call!5370)))

(declare-fun d!13693 () Bool)

(declare-fun res!35559 () Bool)

(declare-fun e!42801 () Bool)

(assert (=> d!13693 (=> res!35559 e!42801)))

(assert (=> d!13693 (= res!35559 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2045 (_keys!3760 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13693 (= (arrayNoDuplicates!0 (_keys!3760 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8901 (Cons!1444 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1445) Nil!1445)) e!42801)))

(declare-fun b!65353 () Bool)

(declare-fun e!42803 () Bool)

(assert (=> b!65353 (= e!42801 e!42803)))

(declare-fun res!35558 () Bool)

(assert (=> b!65353 (=> (not res!35558) (not e!42803))))

(assert (=> b!65353 (= res!35558 (not e!42802))))

(declare-fun res!35557 () Bool)

(assert (=> b!65353 (=> (not res!35557) (not e!42802))))

(assert (=> b!65353 (= res!35557 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!65354 () Bool)

(assert (=> b!65354 (= e!42803 e!42800)))

(assert (=> b!65354 (= c!9002 (validKeyInArray!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!13693 (not res!35559)) b!65353))

(assert (= (and b!65353 res!35557) b!65351))

(assert (= (and b!65353 res!35558) b!65354))

(assert (= (and b!65354 c!9002) b!65352))

(assert (= (and b!65354 (not c!9002)) b!65350))

(assert (= (or b!65352 b!65350) bm!5367))

(assert (=> bm!5367 m!60077))

(declare-fun m!60299 () Bool)

(assert (=> bm!5367 m!60299))

(assert (=> b!65351 m!60077))

(assert (=> b!65351 m!60077))

(declare-fun m!60301 () Bool)

(assert (=> b!65351 m!60301))

(assert (=> b!65353 m!60077))

(assert (=> b!65353 m!60077))

(assert (=> b!65353 m!60079))

(assert (=> b!65354 m!60077))

(assert (=> b!65354 m!60077))

(assert (=> b!65354 m!60079))

(assert (=> bm!5298 d!13693))

(declare-fun bm!5372 () Bool)

(declare-fun call!5376 () Bool)

(assert (=> bm!5372 (= call!5376 (arrayContainsKey!0 (_keys!3760 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun call!5375 () Bool)

(declare-fun c!9007 () Bool)

(declare-fun bm!5373 () Bool)

(declare-fun lt!28088 () SeekEntryResult!231)

(assert (=> bm!5373 (= call!5375 (inRange!0 (ite c!9007 (index!3051 lt!28088) (index!3054 lt!28088)) (mask!6044 newMap!16)))))

(declare-fun b!65371 () Bool)

(declare-fun res!35568 () Bool)

(declare-fun e!42812 () Bool)

(assert (=> b!65371 (=> (not res!35568) (not e!42812))))

(assert (=> b!65371 (= res!35568 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3054 lt!28088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65371 (and (bvsge (index!3054 lt!28088) #b00000000000000000000000000000000) (bvslt (index!3054 lt!28088) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun b!65372 () Bool)

(declare-fun res!35571 () Bool)

(assert (=> b!65372 (=> (not res!35571) (not e!42812))))

(assert (=> b!65372 (= res!35571 call!5375)))

(declare-fun e!42813 () Bool)

(assert (=> b!65372 (= e!42813 e!42812)))

(declare-fun b!65373 () Bool)

(declare-fun e!42814 () Bool)

(assert (=> b!65373 (= e!42814 e!42813)))

(declare-fun c!9008 () Bool)

(assert (=> b!65373 (= c!9008 ((_ is MissingVacant!231) lt!28088))))

(declare-fun b!65374 () Bool)

(assert (=> b!65374 (= e!42812 (not call!5376))))

(declare-fun b!65375 () Bool)

(assert (=> b!65375 (= e!42813 ((_ is Undefined!231) lt!28088))))

(declare-fun d!13695 () Bool)

(assert (=> d!13695 e!42814))

(assert (=> d!13695 (= c!9007 ((_ is MissingZero!231) lt!28088))))

(assert (=> d!13695 (= lt!28088 (seekEntryOrOpen!0 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3760 newMap!16) (mask!6044 newMap!16)))))

(declare-fun lt!28087 () Unit!1783)

(declare-fun choose!361 (array!3789 array!3791 (_ BitVec 32) (_ BitVec 32) V!2883 V!2883 (_ BitVec 64) Int) Unit!1783)

(assert (=> d!13695 (= lt!28087 (choose!361 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)))))

(assert (=> d!13695 (validMask!0 (mask!6044 newMap!16))))

(assert (=> d!13695 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3760 newMap!16) (_values!2105 newMap!16) (mask!6044 newMap!16) (extraKeys!1995 newMap!16) (zeroValue!2031 newMap!16) (minValue!2031 newMap!16) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2122 newMap!16)) lt!28087)))

(declare-fun b!65376 () Bool)

(assert (=> b!65376 (and (bvsge (index!3051 lt!28088) #b00000000000000000000000000000000) (bvslt (index!3051 lt!28088) (size!2045 (_keys!3760 newMap!16))))))

(declare-fun res!35570 () Bool)

(assert (=> b!65376 (= res!35570 (= (select (arr!1811 (_keys!3760 newMap!16)) (index!3051 lt!28088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42815 () Bool)

(assert (=> b!65376 (=> (not res!35570) (not e!42815))))

(declare-fun b!65377 () Bool)

(assert (=> b!65377 (= e!42815 (not call!5376))))

(declare-fun b!65378 () Bool)

(assert (=> b!65378 (= e!42814 e!42815)))

(declare-fun res!35569 () Bool)

(assert (=> b!65378 (= res!35569 call!5375)))

(assert (=> b!65378 (=> (not res!35569) (not e!42815))))

(assert (= (and d!13695 c!9007) b!65378))

(assert (= (and d!13695 (not c!9007)) b!65373))

(assert (= (and b!65378 res!35569) b!65376))

(assert (= (and b!65376 res!35570) b!65377))

(assert (= (and b!65373 c!9008) b!65372))

(assert (= (and b!65373 (not c!9008)) b!65375))

(assert (= (and b!65372 res!35571) b!65371))

(assert (= (and b!65371 res!35568) b!65374))

(assert (= (or b!65378 b!65372) bm!5373))

(assert (= (or b!65377 b!65374) bm!5372))

(declare-fun m!60303 () Bool)

(assert (=> bm!5373 m!60303))

(declare-fun m!60305 () Bool)

(assert (=> b!65376 m!60305))

(assert (=> d!13695 m!59481))

(assert (=> d!13695 m!59581))

(assert (=> d!13695 m!59481))

(declare-fun m!60307 () Bool)

(assert (=> d!13695 m!60307))

(assert (=> d!13695 m!59787))

(declare-fun m!60309 () Bool)

(assert (=> b!65371 m!60309))

(assert (=> bm!5372 m!59481))

(assert (=> bm!5372 m!59593))

(assert (=> bm!5289 d!13695))

(declare-fun d!13697 () Bool)

(declare-fun isEmpty!305 (Option!134) Bool)

(assert (=> d!13697 (= (isDefined!81 (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))) (not (isEmpty!305 (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))))

(declare-fun bs!2844 () Bool)

(assert (= bs!2844 d!13697))

(assert (=> bs!2844 m!59575))

(declare-fun m!60311 () Bool)

(assert (=> bs!2844 m!60311))

(assert (=> b!64783 d!13697))

(declare-fun b!65390 () Bool)

(declare-fun e!42821 () Option!134)

(assert (=> b!65390 (= e!42821 None!132)))

(declare-fun b!65389 () Bool)

(assert (=> b!65389 (= e!42821 (getValueByKey!128 (t!4879 (toList!707 lt!27589)) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun c!9013 () Bool)

(declare-fun d!13699 () Bool)

(assert (=> d!13699 (= c!9013 (and ((_ is Cons!1445) (toList!707 lt!27589)) (= (_1!1040 (h!2029 (toList!707 lt!27589))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(declare-fun e!42820 () Option!134)

(assert (=> d!13699 (= (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) e!42820)))

(declare-fun b!65387 () Bool)

(assert (=> b!65387 (= e!42820 (Some!133 (_2!1040 (h!2029 (toList!707 lt!27589)))))))

(declare-fun b!65388 () Bool)

(assert (=> b!65388 (= e!42820 e!42821)))

(declare-fun c!9014 () Bool)

(assert (=> b!65388 (= c!9014 (and ((_ is Cons!1445) (toList!707 lt!27589)) (not (= (_1!1040 (h!2029 (toList!707 lt!27589))) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))))

(assert (= (and d!13699 c!9013) b!65387))

(assert (= (and d!13699 (not c!9013)) b!65388))

(assert (= (and b!65388 c!9014) b!65389))

(assert (= (and b!65388 (not c!9014)) b!65390))

(assert (=> b!65389 m!59481))

(declare-fun m!60313 () Bool)

(assert (=> b!65389 m!60313))

(assert (=> b!64783 d!13699))

(assert (=> b!64995 d!13681))

(declare-fun d!13701 () Bool)

(assert (=> d!13701 (isDefined!81 (getValueByKey!128 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun lt!28091 () Unit!1783)

(declare-fun choose!362 (List!1449 (_ BitVec 64)) Unit!1783)

(assert (=> d!13701 (= lt!28091 (choose!362 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42824 () Bool)

(assert (=> d!13701 e!42824))

(declare-fun res!35574 () Bool)

(assert (=> d!13701 (=> (not res!35574) (not e!42824))))

(declare-fun isStrictlySorted!288 (List!1449) Bool)

(assert (=> d!13701 (= res!35574 (isStrictlySorted!288 (toList!707 lt!27589)))))

(assert (=> d!13701 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!28091)))

(declare-fun b!65393 () Bool)

(assert (=> b!65393 (= e!42824 (containsKey!132 (toList!707 lt!27589) (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13701 res!35574) b!65393))

(assert (=> d!13701 m!59481))

(assert (=> d!13701 m!59575))

(assert (=> d!13701 m!59575))

(assert (=> d!13701 m!59577))

(assert (=> d!13701 m!59481))

(declare-fun m!60315 () Bool)

(assert (=> d!13701 m!60315))

(declare-fun m!60317 () Bool)

(assert (=> d!13701 m!60317))

(assert (=> b!65393 m!59481))

(assert (=> b!65393 m!59571))

(assert (=> b!64781 d!13701))

(assert (=> b!64781 d!13697))

(assert (=> b!64781 d!13699))

(declare-fun d!13703 () Bool)

(declare-fun e!42825 () Bool)

(assert (=> d!13703 e!42825))

(declare-fun res!35576 () Bool)

(assert (=> d!13703 (=> (not res!35576) (not e!42825))))

(declare-fun lt!28095 () ListLongMap!1383)

(assert (=> d!13703 (= res!35576 (contains!698 lt!28095 (_1!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!28093 () List!1449)

(assert (=> d!13703 (= lt!28095 (ListLongMap!1384 lt!28093))))

(declare-fun lt!28092 () Unit!1783)

(declare-fun lt!28094 () Unit!1783)

(assert (=> d!13703 (= lt!28092 lt!28094)))

(assert (=> d!13703 (= (getValueByKey!128 lt!28093 (_1!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!133 (_2!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13703 (= lt!28094 (lemmaContainsTupThenGetReturnValue!45 lt!28093 (_1!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13703 (= lt!28093 (insertStrictlySorted!48 (toList!707 call!5296) (_1!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13703 (= (+!85 call!5296 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!28095)))

(declare-fun b!65394 () Bool)

(declare-fun res!35575 () Bool)

(assert (=> b!65394 (=> (not res!35575) (not e!42825))))

(assert (=> b!65394 (= res!35575 (= (getValueByKey!128 (toList!707 lt!28095) (_1!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!133 (_2!1040 (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!65395 () Bool)

(assert (=> b!65395 (= e!42825 (contains!701 (toList!707 lt!28095) (tuple2!2059 (select (arr!1811 (_keys!3760 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1096 (select (arr!1812 (_values!2105 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13703 res!35576) b!65394))

(assert (= (and b!65394 res!35575) b!65395))

(declare-fun m!60319 () Bool)

(assert (=> d!13703 m!60319))

(declare-fun m!60321 () Bool)

(assert (=> d!13703 m!60321))

(declare-fun m!60323 () Bool)

(assert (=> d!13703 m!60323))

(declare-fun m!60325 () Bool)

(assert (=> d!13703 m!60325))

(declare-fun m!60327 () Bool)

(assert (=> b!65394 m!60327))

(declare-fun m!60329 () Bool)

(assert (=> b!65395 m!60329))

(assert (=> b!64891 d!13703))

(declare-fun mapIsEmpty!3005 () Bool)

(declare-fun mapRes!3005 () Bool)

(assert (=> mapIsEmpty!3005 mapRes!3005))

(declare-fun b!65396 () Bool)

(declare-fun e!42826 () Bool)

(assert (=> b!65396 (= e!42826 tp_is_empty!2427)))

(declare-fun condMapEmpty!3005 () Bool)

(declare-fun mapDefault!3005 () ValueCell!870)

(assert (=> mapNonEmpty!3003 (= condMapEmpty!3005 (= mapRest!3003 ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!3005)))))

(declare-fun e!42827 () Bool)

(assert (=> mapNonEmpty!3003 (= tp!8223 (and e!42827 mapRes!3005))))

(declare-fun b!65397 () Bool)

(assert (=> b!65397 (= e!42827 tp_is_empty!2427)))

(declare-fun mapNonEmpty!3005 () Bool)

(declare-fun tp!8225 () Bool)

(assert (=> mapNonEmpty!3005 (= mapRes!3005 (and tp!8225 e!42826))))

(declare-fun mapRest!3005 () (Array (_ BitVec 32) ValueCell!870))

(declare-fun mapValue!3005 () ValueCell!870)

(declare-fun mapKey!3005 () (_ BitVec 32))

(assert (=> mapNonEmpty!3005 (= mapRest!3003 (store mapRest!3005 mapKey!3005 mapValue!3005))))

(assert (= (and mapNonEmpty!3003 condMapEmpty!3005) mapIsEmpty!3005))

(assert (= (and mapNonEmpty!3003 (not condMapEmpty!3005)) mapNonEmpty!3005))

(assert (= (and mapNonEmpty!3005 ((_ is ValueCellFull!870) mapValue!3005)) b!65396))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!870) mapDefault!3005)) b!65397))

(declare-fun m!60331 () Bool)

(assert (=> mapNonEmpty!3005 m!60331))

(declare-fun mapIsEmpty!3006 () Bool)

(declare-fun mapRes!3006 () Bool)

(assert (=> mapIsEmpty!3006 mapRes!3006))

(declare-fun b!65398 () Bool)

(declare-fun e!42828 () Bool)

(assert (=> b!65398 (= e!42828 tp_is_empty!2427)))

(declare-fun condMapEmpty!3006 () Bool)

(declare-fun mapDefault!3006 () ValueCell!870)

(assert (=> mapNonEmpty!3004 (= condMapEmpty!3006 (= mapRest!3004 ((as const (Array (_ BitVec 32) ValueCell!870)) mapDefault!3006)))))

(declare-fun e!42829 () Bool)

(assert (=> mapNonEmpty!3004 (= tp!8224 (and e!42829 mapRes!3006))))

(declare-fun b!65399 () Bool)

(assert (=> b!65399 (= e!42829 tp_is_empty!2427)))

(declare-fun mapNonEmpty!3006 () Bool)

(declare-fun tp!8226 () Bool)

(assert (=> mapNonEmpty!3006 (= mapRes!3006 (and tp!8226 e!42828))))

(declare-fun mapRest!3006 () (Array (_ BitVec 32) ValueCell!870))

(declare-fun mapKey!3006 () (_ BitVec 32))

(declare-fun mapValue!3006 () ValueCell!870)

(assert (=> mapNonEmpty!3006 (= mapRest!3004 (store mapRest!3006 mapKey!3006 mapValue!3006))))

(assert (= (and mapNonEmpty!3004 condMapEmpty!3006) mapIsEmpty!3006))

(assert (= (and mapNonEmpty!3004 (not condMapEmpty!3006)) mapNonEmpty!3006))

(assert (= (and mapNonEmpty!3006 ((_ is ValueCellFull!870) mapValue!3006)) b!65398))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!870) mapDefault!3006)) b!65399))

(declare-fun m!60333 () Bool)

(assert (=> mapNonEmpty!3006 m!60333))

(declare-fun b_lambda!2931 () Bool)

(assert (= b_lambda!2923 (or (and b!64706 b_free!2021 (= (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2122 newMap!16))) (and b!64704 b_free!2023) b_lambda!2931)))

(declare-fun b_lambda!2933 () Bool)

(assert (= b_lambda!2927 (or (and b!64706 b_free!2021) (and b!64704 b_free!2023 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))))) b_lambda!2933)))

(declare-fun b_lambda!2935 () Bool)

(assert (= b_lambda!2921 (or (and b!64706 b_free!2021 (= (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2122 newMap!16))) (and b!64704 b_free!2023) b_lambda!2935)))

(declare-fun b_lambda!2937 () Bool)

(assert (= b_lambda!2929 (or (and b!64706 b_free!2021) (and b!64704 b_free!2023 (= (defaultEntry!2122 newMap!16) (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))))) b_lambda!2937)))

(declare-fun b_lambda!2939 () Bool)

(assert (= b_lambda!2925 (or (and b!64706 b_free!2021 (= (defaultEntry!2122 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2122 newMap!16))) (and b!64704 b_free!2023) b_lambda!2939)))

(check-sat (not b!65269) (not mapNonEmpty!3005) (not b!65075) (not b!65259) (not b!65153) (not b!65116) (not bm!5342) (not d!13687) (not bm!5373) (not b_lambda!2935) (not d!13651) (not d!13597) (not b!65394) (not b!65079) (not b!65247) (not b!65351) (not b!65244) (not b!65268) (not b!65067) (not d!13595) (not b!65209) (not b!65088) (not d!13571) (not d!13679) (not b!65068) b_and!4009 (not bm!5324) (not b!65175) (not b!65114) (not d!13683) (not d!13621) (not bm!5349) (not d!13603) (not d!13587) (not b!65346) (not b!65167) (not d!13647) (not d!13663) (not b!65047) (not bm!5328) (not b!65256) (not d!13619) (not b!65104) (not b!65174) (not b_lambda!2915) (not bm!5366) (not b!65151) (not b!65162) (not b!65170) (not b!65254) (not b!65286) (not bm!5367) (not b!65062) (not b!65110) (not d!13701) (not d!13661) (not mapNonEmpty!3006) (not d!13643) (not b!65349) (not b!65163) (not b!65109) (not bm!5335) (not bm!5365) (not b!65266) (not b!65072) (not b_lambda!2939) (not d!13573) (not b!65200) (not b!65178) (not b!65243) (not b!65191) (not b!65118) (not bm!5343) (not b!65055) (not d!13607) (not b!65176) (not b!65221) (not b!65389) (not b!65283) (not d!13695) (not b!65292) (not d!13591) (not b!65278) (not b!65338) (not d!13675) (not d!13697) (not b!65348) (not b_lambda!2933) (not d!13665) (not bm!5351) (not b!65192) tp_is_empty!2427 (not b!65076) (not d!13655) (not b!65332) (not b!65264) (not bm!5331) (not b!65046) (not b!65218) (not d!13691) (not b!65097) (not b!65395) (not b!65152) (not d!13585) (not b!65294) (not b!65331) (not d!13653) (not d!13703) (not b!65181) (not b!65154) (not b_next!2021) (not d!13609) (not b!65245) (not b!65102) (not b!65093) (not d!13569) (not d!13669) (not b!65285) (not b!65344) (not b!65262) (not b!65258) (not b!65112) (not d!13645) (not d!13593) (not bm!5350) (not b!65150) (not d!13581) (not b_next!2023) b_and!4007 (not b!65058) (not d!13639) (not b!65337) (not b!65144) (not d!13611) (not bm!5332) (not b!65237) (not d!13583) (not bm!5336) (not b!65148) (not bm!5325) (not d!13641) (not b!65117) (not b!65249) (not d!13635) (not b!65203) (not b!65160) (not bm!5363) (not b!65100) (not d!13615) (not b!65393) (not b!65171) (not b_lambda!2937) (not b_lambda!2931) (not d!13685) (not b!65199) (not b!65224) (not bm!5354) (not d!13563) (not b!65119) (not b!65054) (not b!65161) (not b_lambda!2919) (not b!65263) (not b!65347) (not b!65051) (not bm!5338) (not b!65177) (not bm!5339) (not d!13599) (not b!65172) (not d!13605) (not b!65081) (not b!65089) (not d!13613) (not bm!5372) (not b!65214) (not b!65169) (not d!13589) (not b!65341) (not d!13601) (not bm!5348) (not b!65145) (not b!65096) (not b!65060) (not b!65354) (not d!13633) (not d!13631) (not b!65216) (not d!13689) (not b!65353) (not d!13637) (not d!13629) (not bm!5345) (not b!65083) (not bm!5329) (not b!65261))
(check-sat b_and!4007 b_and!4009 (not b_next!2021) (not b_next!2023))
