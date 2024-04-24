; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13062 () Bool)

(assert start!13062)

(declare-fun b!113665 () Bool)

(declare-fun b_free!2593 () Bool)

(declare-fun b_next!2593 () Bool)

(assert (=> b!113665 (= b_free!2593 (not b_next!2593))))

(declare-fun tp!10137 () Bool)

(declare-fun b_and!6973 () Bool)

(assert (=> b!113665 (= tp!10137 b_and!6973)))

(declare-fun b!113677 () Bool)

(declare-fun b_free!2595 () Bool)

(declare-fun b_next!2595 () Bool)

(assert (=> b!113677 (= b_free!2595 (not b_next!2595))))

(declare-fun tp!10139 () Bool)

(declare-fun b_and!6975 () Bool)

(assert (=> b!113677 (= tp!10139 b_and!6975)))

(declare-fun b!113658 () Bool)

(declare-fun res!56018 () Bool)

(declare-fun e!73865 () Bool)

(assert (=> b!113658 (=> (not res!56018) (not e!73865))))

(declare-datatypes ((V!3265 0))(
  ( (V!3266 (val!1401 Int)) )
))
(declare-datatypes ((array!4413 0))(
  ( (array!4414 (arr!2090 (Array (_ BitVec 32) (_ BitVec 64))) (size!2350 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1013 0))(
  ( (ValueCellFull!1013 (v!2971 V!3265)) (EmptyCell!1013) )
))
(declare-datatypes ((array!4415 0))(
  ( (array!4416 (arr!2091 (Array (_ BitVec 32) ValueCell!1013)) (size!2351 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!934 0))(
  ( (LongMapFixedSize!935 (defaultEntry!2673 Int) (mask!6863 (_ BitVec 32)) (extraKeys!2462 (_ BitVec 32)) (zeroValue!2540 V!3265) (minValue!2540 V!3265) (_size!516 (_ BitVec 32)) (_keys!4395 array!4413) (_values!2656 array!4415) (_vacant!516 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!934)

(declare-datatypes ((Cell!736 0))(
  ( (Cell!737 (v!2972 LongMapFixedSize!934)) )
))
(declare-datatypes ((LongMap!736 0))(
  ( (LongMap!737 (underlying!379 Cell!736)) )
))
(declare-fun thiss!992 () LongMap!736)

(assert (=> b!113658 (= res!56018 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6863 newMap!16)) (_size!516 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun b!113659 () Bool)

(declare-fun res!56016 () Bool)

(declare-fun e!73863 () Bool)

(assert (=> b!113659 (=> res!56016 e!73863)))

(assert (=> b!113659 (= res!56016 (or (not (= (size!2351 (_values!2656 (v!2972 (underlying!379 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6863 (v!2972 (underlying!379 thiss!992)))))) (not (= (size!2350 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) (size!2351 (_values!2656 (v!2972 (underlying!379 thiss!992)))))) (bvslt (mask!6863 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2462 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2462 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!113660 () Bool)

(declare-fun e!73852 () Bool)

(declare-fun e!73851 () Bool)

(assert (=> b!113660 (= e!73852 e!73851)))

(declare-fun b!113661 () Bool)

(declare-fun res!56013 () Bool)

(assert (=> b!113661 (=> (not res!56013) (not e!73865))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!113661 (= res!56013 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2350 (_keys!4395 (v!2972 (underlying!379 thiss!992)))))))))

(declare-fun b!113662 () Bool)

(declare-fun e!73850 () Bool)

(declare-fun tp_is_empty!2713 () Bool)

(assert (=> b!113662 (= e!73850 tp_is_empty!2713)))

(declare-fun b!113663 () Bool)

(declare-datatypes ((Unit!3532 0))(
  ( (Unit!3533) )
))
(declare-fun e!73857 () Unit!3532)

(declare-fun Unit!3534 () Unit!3532)

(assert (=> b!113663 (= e!73857 Unit!3534)))

(declare-fun lt!59033 () Unit!3532)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!110 (array!4413 array!4415 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 64) (_ BitVec 32) Int) Unit!3532)

(assert (=> b!113663 (= lt!59033 (lemmaListMapContainsThenArrayContainsFrom!110 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (_values!2656 (v!2972 (underlying!379 thiss!992))) (mask!6863 (v!2972 (underlying!379 thiss!992))) (extraKeys!2462 (v!2972 (underlying!379 thiss!992))) (zeroValue!2540 (v!2972 (underlying!379 thiss!992))) (minValue!2540 (v!2972 (underlying!379 thiss!992))) (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113663 (arrayContainsKey!0 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59024 () Unit!3532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4413 (_ BitVec 32) (_ BitVec 32)) Unit!3532)

(assert (=> b!113663 (= lt!59024 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4395 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1623 0))(
  ( (Nil!1620) (Cons!1619 (h!2219 (_ BitVec 64)) (t!5805 List!1623)) )
))
(declare-fun arrayNoDuplicates!0 (array!4413 (_ BitVec 32) List!1623) Bool)

(assert (=> b!113663 (arrayNoDuplicates!0 (_keys!4395 (v!2972 (underlying!379 thiss!992))) from!355 Nil!1620)))

(declare-fun lt!59022 () Unit!3532)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4413 (_ BitVec 32) (_ BitVec 64) List!1623) Unit!3532)

(assert (=> b!113663 (= lt!59022 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) (Cons!1619 (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) Nil!1620)))))

(assert (=> b!113663 false))

(declare-fun b!113664 () Bool)

(declare-fun e!73859 () Bool)

(assert (=> b!113664 (= e!73859 e!73852)))

(declare-fun e!73864 () Bool)

(declare-fun array_inv!1295 (array!4413) Bool)

(declare-fun array_inv!1296 (array!4415) Bool)

(assert (=> b!113665 (= e!73851 (and tp!10137 tp_is_empty!2713 (array_inv!1295 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) (array_inv!1296 (_values!2656 (v!2972 (underlying!379 thiss!992)))) e!73864))))

(declare-fun b!113666 () Bool)

(declare-fun e!73862 () Bool)

(assert (=> b!113666 (= e!73865 e!73862)))

(declare-fun res!56017 () Bool)

(assert (=> b!113666 (=> (not res!56017) (not e!73862))))

(declare-datatypes ((tuple2!2416 0))(
  ( (tuple2!2417 (_1!1219 (_ BitVec 64)) (_2!1219 V!3265)) )
))
(declare-datatypes ((List!1624 0))(
  ( (Nil!1621) (Cons!1620 (h!2220 tuple2!2416) (t!5806 List!1624)) )
))
(declare-datatypes ((ListLongMap!1563 0))(
  ( (ListLongMap!1564 (toList!797 List!1624)) )
))
(declare-fun lt!59030 () ListLongMap!1563)

(declare-fun lt!59023 () ListLongMap!1563)

(assert (=> b!113666 (= res!56017 (= lt!59030 lt!59023))))

(declare-fun map!1306 (LongMapFixedSize!934) ListLongMap!1563)

(assert (=> b!113666 (= lt!59023 (map!1306 newMap!16))))

(declare-fun getCurrentListMap!480 (array!4413 array!4415 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 32) Int) ListLongMap!1563)

(assert (=> b!113666 (= lt!59030 (getCurrentListMap!480 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (_values!2656 (v!2972 (underlying!379 thiss!992))) (mask!6863 (v!2972 (underlying!379 thiss!992))) (extraKeys!2462 (v!2972 (underlying!379 thiss!992))) (zeroValue!2540 (v!2972 (underlying!379 thiss!992))) (minValue!2540 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun res!56015 () Bool)

(assert (=> start!13062 (=> (not res!56015) (not e!73865))))

(declare-fun valid!443 (LongMap!736) Bool)

(assert (=> start!13062 (= res!56015 (valid!443 thiss!992))))

(assert (=> start!13062 e!73865))

(assert (=> start!13062 e!73859))

(assert (=> start!13062 true))

(declare-fun e!73855 () Bool)

(assert (=> start!13062 e!73855))

(declare-fun b!113667 () Bool)

(declare-fun e!73861 () Bool)

(assert (=> b!113667 (= e!73861 tp_is_empty!2713)))

(declare-fun mapNonEmpty!4067 () Bool)

(declare-fun mapRes!4067 () Bool)

(declare-fun tp!10140 () Bool)

(assert (=> mapNonEmpty!4067 (= mapRes!4067 (and tp!10140 e!73861))))

(declare-fun mapKey!4068 () (_ BitVec 32))

(declare-fun mapRest!4067 () (Array (_ BitVec 32) ValueCell!1013))

(declare-fun mapValue!4068 () ValueCell!1013)

(assert (=> mapNonEmpty!4067 (= (arr!2091 (_values!2656 (v!2972 (underlying!379 thiss!992)))) (store mapRest!4067 mapKey!4068 mapValue!4068))))

(declare-fun b!113668 () Bool)

(declare-fun e!73866 () Bool)

(declare-fun e!73853 () Bool)

(declare-fun mapRes!4068 () Bool)

(assert (=> b!113668 (= e!73866 (and e!73853 mapRes!4068))))

(declare-fun condMapEmpty!4068 () Bool)

(declare-fun mapDefault!4068 () ValueCell!1013)

(assert (=> b!113668 (= condMapEmpty!4068 (= (arr!2091 (_values!2656 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1013)) mapDefault!4068)))))

(declare-fun b!113669 () Bool)

(declare-fun e!73854 () Bool)

(assert (=> b!113669 (= e!73854 tp_is_empty!2713)))

(declare-fun b!113670 () Bool)

(assert (=> b!113670 (= e!73853 tp_is_empty!2713)))

(declare-fun mapNonEmpty!4068 () Bool)

(declare-fun tp!10138 () Bool)

(assert (=> mapNonEmpty!4068 (= mapRes!4068 (and tp!10138 e!73854))))

(declare-fun mapValue!4067 () ValueCell!1013)

(declare-fun mapKey!4067 () (_ BitVec 32))

(declare-fun mapRest!4068 () (Array (_ BitVec 32) ValueCell!1013))

(assert (=> mapNonEmpty!4068 (= (arr!2091 (_values!2656 newMap!16)) (store mapRest!4068 mapKey!4067 mapValue!4067))))

(declare-fun b!113671 () Bool)

(declare-fun res!56011 () Bool)

(assert (=> b!113671 (=> res!56011 e!73863)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4413 (_ BitVec 32)) Bool)

(assert (=> b!113671 (= res!56011 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (mask!6863 (v!2972 (underlying!379 thiss!992))))))))

(declare-fun b!113672 () Bool)

(assert (=> b!113672 (= e!73863 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!113673 () Bool)

(declare-fun res!56012 () Bool)

(assert (=> b!113673 (=> res!56012 e!73863)))

(assert (=> b!113673 (= res!56012 (not (arrayNoDuplicates!0 (_keys!4395 (v!2972 (underlying!379 thiss!992))) #b00000000000000000000000000000000 Nil!1620)))))

(declare-fun b!113674 () Bool)

(declare-fun e!73858 () Bool)

(assert (=> b!113674 (= e!73858 (not e!73863))))

(declare-fun res!56010 () Bool)

(assert (=> b!113674 (=> res!56010 e!73863)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!113674 (= res!56010 (not (validMask!0 (mask!6863 (v!2972 (underlying!379 thiss!992))))))))

(declare-fun lt!59026 () ListLongMap!1563)

(declare-fun lt!59031 () tuple2!2416)

(declare-fun lt!59025 () tuple2!2416)

(declare-fun +!152 (ListLongMap!1563 tuple2!2416) ListLongMap!1563)

(assert (=> b!113674 (= (+!152 (+!152 lt!59026 lt!59031) lt!59025) (+!152 (+!152 lt!59026 lt!59025) lt!59031))))

(assert (=> b!113674 (= lt!59025 (tuple2!2417 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2540 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun lt!59028 () V!3265)

(assert (=> b!113674 (= lt!59031 (tuple2!2417 (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59028))))

(declare-fun lt!59029 () Unit!3532)

(declare-fun addCommutativeForDiffKeys!65 (ListLongMap!1563 (_ BitVec 64) V!3265 (_ BitVec 64) V!3265) Unit!3532)

(assert (=> b!113674 (= lt!59029 (addCommutativeForDiffKeys!65 lt!59026 (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59028 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2540 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!119 (array!4413 array!4415 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 32) Int) ListLongMap!1563)

(assert (=> b!113674 (= lt!59026 (getCurrentListMapNoExtraKeys!119 (_keys!4395 (v!2972 (underlying!379 thiss!992))) (_values!2656 (v!2972 (underlying!379 thiss!992))) (mask!6863 (v!2972 (underlying!379 thiss!992))) (extraKeys!2462 (v!2972 (underlying!379 thiss!992))) (zeroValue!2540 (v!2972 (underlying!379 thiss!992))) (minValue!2540 (v!2972 (underlying!379 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2972 (underlying!379 thiss!992)))))))

(declare-fun b!113675 () Bool)

(declare-fun e!73860 () Bool)

(assert (=> b!113675 (= e!73860 e!73858)))

(declare-fun res!56009 () Bool)

(assert (=> b!113675 (=> (not res!56009) (not e!73858))))

(declare-datatypes ((tuple2!2418 0))(
  ( (tuple2!2419 (_1!1220 Bool) (_2!1220 LongMapFixedSize!934)) )
))
(declare-fun lt!59032 () tuple2!2418)

(assert (=> b!113675 (= res!56009 (and (_1!1220 lt!59032) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59027 () Unit!3532)

(assert (=> b!113675 (= lt!59027 e!73857)))

(declare-fun c!20370 () Bool)

(declare-fun contains!837 (ListLongMap!1563 (_ BitVec 64)) Bool)

(assert (=> b!113675 (= c!20370 (contains!837 lt!59023 (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355)))))

(declare-fun update!172 (LongMapFixedSize!934 (_ BitVec 64) V!3265) tuple2!2418)

(assert (=> b!113675 (= lt!59032 (update!172 newMap!16 (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) lt!59028))))

(declare-fun mapIsEmpty!4067 () Bool)

(assert (=> mapIsEmpty!4067 mapRes!4067))

(declare-fun b!113676 () Bool)

(declare-fun Unit!3535 () Unit!3532)

(assert (=> b!113676 (= e!73857 Unit!3535)))

(assert (=> b!113677 (= e!73855 (and tp!10139 tp_is_empty!2713 (array_inv!1295 (_keys!4395 newMap!16)) (array_inv!1296 (_values!2656 newMap!16)) e!73866))))

(declare-fun mapIsEmpty!4068 () Bool)

(assert (=> mapIsEmpty!4068 mapRes!4068))

(declare-fun b!113678 () Bool)

(assert (=> b!113678 (= e!73864 (and e!73850 mapRes!4067))))

(declare-fun condMapEmpty!4067 () Bool)

(declare-fun mapDefault!4067 () ValueCell!1013)

(assert (=> b!113678 (= condMapEmpty!4067 (= (arr!2091 (_values!2656 (v!2972 (underlying!379 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1013)) mapDefault!4067)))))

(declare-fun b!113679 () Bool)

(assert (=> b!113679 (= e!73862 e!73860)))

(declare-fun res!56008 () Bool)

(assert (=> b!113679 (=> (not res!56008) (not e!73860))))

(assert (=> b!113679 (= res!56008 (and (not (= (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2090 (_keys!4395 (v!2972 (underlying!379 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1373 (ValueCell!1013 V!3265) V!3265)

(declare-fun dynLambda!395 (Int (_ BitVec 64)) V!3265)

(assert (=> b!113679 (= lt!59028 (get!1373 (select (arr!2091 (_values!2656 (v!2972 (underlying!379 thiss!992)))) from!355) (dynLambda!395 (defaultEntry!2673 (v!2972 (underlying!379 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113680 () Bool)

(declare-fun res!56014 () Bool)

(assert (=> b!113680 (=> (not res!56014) (not e!73865))))

(declare-fun valid!444 (LongMapFixedSize!934) Bool)

(assert (=> b!113680 (= res!56014 (valid!444 newMap!16))))

(assert (= (and start!13062 res!56015) b!113661))

(assert (= (and b!113661 res!56013) b!113680))

(assert (= (and b!113680 res!56014) b!113658))

(assert (= (and b!113658 res!56018) b!113666))

(assert (= (and b!113666 res!56017) b!113679))

(assert (= (and b!113679 res!56008) b!113675))

(assert (= (and b!113675 c!20370) b!113663))

(assert (= (and b!113675 (not c!20370)) b!113676))

(assert (= (and b!113675 res!56009) b!113674))

(assert (= (and b!113674 (not res!56010)) b!113659))

(assert (= (and b!113659 (not res!56016)) b!113671))

(assert (= (and b!113671 (not res!56011)) b!113673))

(assert (= (and b!113673 (not res!56012)) b!113672))

(assert (= (and b!113678 condMapEmpty!4067) mapIsEmpty!4067))

(assert (= (and b!113678 (not condMapEmpty!4067)) mapNonEmpty!4067))

(get-info :version)

(assert (= (and mapNonEmpty!4067 ((_ is ValueCellFull!1013) mapValue!4068)) b!113667))

(assert (= (and b!113678 ((_ is ValueCellFull!1013) mapDefault!4067)) b!113662))

(assert (= b!113665 b!113678))

(assert (= b!113660 b!113665))

(assert (= b!113664 b!113660))

(assert (= start!13062 b!113664))

(assert (= (and b!113668 condMapEmpty!4068) mapIsEmpty!4068))

(assert (= (and b!113668 (not condMapEmpty!4068)) mapNonEmpty!4068))

(assert (= (and mapNonEmpty!4068 ((_ is ValueCellFull!1013) mapValue!4067)) b!113669))

(assert (= (and b!113668 ((_ is ValueCellFull!1013) mapDefault!4068)) b!113670))

(assert (= b!113677 b!113668))

(assert (= start!13062 b!113677))

(declare-fun b_lambda!5091 () Bool)

(assert (=> (not b_lambda!5091) (not b!113679)))

(declare-fun t!5802 () Bool)

(declare-fun tb!2145 () Bool)

(assert (=> (and b!113665 (= (defaultEntry!2673 (v!2972 (underlying!379 thiss!992))) (defaultEntry!2673 (v!2972 (underlying!379 thiss!992)))) t!5802) tb!2145))

(declare-fun result!3589 () Bool)

(assert (=> tb!2145 (= result!3589 tp_is_empty!2713)))

(assert (=> b!113679 t!5802))

(declare-fun b_and!6977 () Bool)

(assert (= b_and!6973 (and (=> t!5802 result!3589) b_and!6977)))

(declare-fun t!5804 () Bool)

(declare-fun tb!2147 () Bool)

(assert (=> (and b!113677 (= (defaultEntry!2673 newMap!16) (defaultEntry!2673 (v!2972 (underlying!379 thiss!992)))) t!5804) tb!2147))

(declare-fun result!3593 () Bool)

(assert (= result!3593 result!3589))

(assert (=> b!113679 t!5804))

(declare-fun b_and!6979 () Bool)

(assert (= b_and!6975 (and (=> t!5804 result!3593) b_and!6979)))

(declare-fun m!129949 () Bool)

(assert (=> b!113680 m!129949))

(declare-fun m!129951 () Bool)

(assert (=> b!113665 m!129951))

(declare-fun m!129953 () Bool)

(assert (=> b!113665 m!129953))

(declare-fun m!129955 () Bool)

(assert (=> b!113674 m!129955))

(declare-fun m!129957 () Bool)

(assert (=> b!113674 m!129957))

(declare-fun m!129959 () Bool)

(assert (=> b!113674 m!129959))

(declare-fun m!129961 () Bool)

(assert (=> b!113674 m!129961))

(assert (=> b!113674 m!129955))

(declare-fun m!129963 () Bool)

(assert (=> b!113674 m!129963))

(declare-fun m!129965 () Bool)

(assert (=> b!113674 m!129965))

(assert (=> b!113674 m!129961))

(declare-fun m!129967 () Bool)

(assert (=> b!113674 m!129967))

(declare-fun m!129969 () Bool)

(assert (=> b!113674 m!129969))

(assert (=> b!113674 m!129963))

(declare-fun m!129971 () Bool)

(assert (=> mapNonEmpty!4067 m!129971))

(declare-fun m!129973 () Bool)

(assert (=> start!13062 m!129973))

(declare-fun m!129975 () Bool)

(assert (=> mapNonEmpty!4068 m!129975))

(declare-fun m!129977 () Bool)

(assert (=> b!113663 m!129977))

(declare-fun m!129979 () Bool)

(assert (=> b!113663 m!129979))

(assert (=> b!113663 m!129955))

(declare-fun m!129981 () Bool)

(assert (=> b!113663 m!129981))

(assert (=> b!113663 m!129955))

(assert (=> b!113663 m!129955))

(declare-fun m!129983 () Bool)

(assert (=> b!113663 m!129983))

(assert (=> b!113663 m!129955))

(declare-fun m!129985 () Bool)

(assert (=> b!113663 m!129985))

(declare-fun m!129987 () Bool)

(assert (=> b!113673 m!129987))

(declare-fun m!129989 () Bool)

(assert (=> b!113671 m!129989))

(declare-fun m!129991 () Bool)

(assert (=> b!113677 m!129991))

(declare-fun m!129993 () Bool)

(assert (=> b!113677 m!129993))

(assert (=> b!113679 m!129955))

(declare-fun m!129995 () Bool)

(assert (=> b!113679 m!129995))

(declare-fun m!129997 () Bool)

(assert (=> b!113679 m!129997))

(assert (=> b!113679 m!129995))

(assert (=> b!113679 m!129997))

(declare-fun m!129999 () Bool)

(assert (=> b!113679 m!129999))

(declare-fun m!130001 () Bool)

(assert (=> b!113666 m!130001))

(declare-fun m!130003 () Bool)

(assert (=> b!113666 m!130003))

(assert (=> b!113675 m!129955))

(assert (=> b!113675 m!129955))

(declare-fun m!130005 () Bool)

(assert (=> b!113675 m!130005))

(assert (=> b!113675 m!129955))

(declare-fun m!130007 () Bool)

(assert (=> b!113675 m!130007))

(check-sat (not b!113674) (not b!113671) (not b_next!2595) b_and!6977 (not mapNonEmpty!4068) (not b!113677) (not b!113665) (not start!13062) (not mapNonEmpty!4067) (not b!113675) (not b!113663) (not b_lambda!5091) (not b_next!2593) (not b!113673) b_and!6979 (not b!113680) tp_is_empty!2713 (not b!113679) (not b!113666))
(check-sat b_and!6977 b_and!6979 (not b_next!2593) (not b_next!2595))
