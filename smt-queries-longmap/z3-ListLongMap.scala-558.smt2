; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15192 () Bool)

(assert start!15192)

(declare-fun b!145906 () Bool)

(declare-fun b_free!3089 () Bool)

(declare-fun b_next!3089 () Bool)

(assert (=> b!145906 (= b_free!3089 (not b_next!3089))))

(declare-fun tp!11769 () Bool)

(declare-fun b_and!9095 () Bool)

(assert (=> b!145906 (= tp!11769 b_and!9095)))

(declare-fun b!145904 () Bool)

(declare-fun b_free!3091 () Bool)

(declare-fun b_next!3091 () Bool)

(assert (=> b!145904 (= b_free!3091 (not b_next!3091))))

(declare-fun tp!11770 () Bool)

(declare-fun b_and!9097 () Bool)

(assert (=> b!145904 (= tp!11770 b_and!9097)))

(declare-fun b!145899 () Bool)

(declare-fun res!69479 () Bool)

(declare-fun e!95103 () Bool)

(assert (=> b!145899 (=> (not res!69479) (not e!95103))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3595 0))(
  ( (V!3596 (val!1525 Int)) )
))
(declare-datatypes ((array!4967 0))(
  ( (array!4968 (arr!2345 (Array (_ BitVec 32) (_ BitVec 64))) (size!2621 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1137 0))(
  ( (ValueCellFull!1137 (v!3340 V!3595)) (EmptyCell!1137) )
))
(declare-datatypes ((array!4969 0))(
  ( (array!4970 (arr!2346 (Array (_ BitVec 32) ValueCell!1137)) (size!2622 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1182 0))(
  ( (LongMapFixedSize!1183 (defaultEntry!3007 Int) (mask!7379 (_ BitVec 32)) (extraKeys!2752 (_ BitVec 32)) (zeroValue!2852 V!3595) (minValue!2852 V!3595) (_size!640 (_ BitVec 32)) (_keys!4776 array!4967) (_values!2990 array!4969) (_vacant!640 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!966 0))(
  ( (Cell!967 (v!3341 LongMapFixedSize!1182)) )
))
(declare-datatypes ((LongMap!966 0))(
  ( (LongMap!967 (underlying!494 Cell!966)) )
))
(declare-fun thiss!992 () LongMap!966)

(assert (=> b!145899 (= res!69479 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2621 (_keys!4776 (v!3341 (underlying!494 thiss!992)))))))))

(declare-fun b!145901 () Bool)

(declare-fun e!95096 () Bool)

(assert (=> b!145901 (= e!95103 e!95096)))

(declare-fun res!69475 () Bool)

(assert (=> b!145901 (=> (not res!69475) (not e!95096))))

(declare-datatypes ((tuple2!2746 0))(
  ( (tuple2!2747 (_1!1384 (_ BitVec 64)) (_2!1384 V!3595)) )
))
(declare-datatypes ((List!1770 0))(
  ( (Nil!1767) (Cons!1766 (h!2374 tuple2!2746) (t!6443 List!1770)) )
))
(declare-datatypes ((ListLongMap!1769 0))(
  ( (ListLongMap!1770 (toList!900 List!1770)) )
))
(declare-fun lt!76729 () ListLongMap!1769)

(declare-fun lt!76730 () ListLongMap!1769)

(assert (=> b!145901 (= res!69475 (and (= lt!76730 lt!76729) (not (= (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1182)

(declare-fun map!1460 (LongMapFixedSize!1182) ListLongMap!1769)

(assert (=> b!145901 (= lt!76729 (map!1460 newMap!16))))

(declare-fun getCurrentListMap!569 (array!4967 array!4969 (_ BitVec 32) (_ BitVec 32) V!3595 V!3595 (_ BitVec 32) Int) ListLongMap!1769)

(assert (=> b!145901 (= lt!76730 (getCurrentListMap!569 (_keys!4776 (v!3341 (underlying!494 thiss!992))) (_values!2990 (v!3341 (underlying!494 thiss!992))) (mask!7379 (v!3341 (underlying!494 thiss!992))) (extraKeys!2752 (v!3341 (underlying!494 thiss!992))) (zeroValue!2852 (v!3341 (underlying!494 thiss!992))) (minValue!2852 (v!3341 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3007 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun b!145902 () Bool)

(declare-fun e!95101 () Bool)

(declare-fun e!95102 () Bool)

(assert (=> b!145902 (= e!95101 e!95102)))

(declare-fun b!145903 () Bool)

(declare-fun e!95090 () Bool)

(assert (=> b!145903 (= e!95090 (not true))))

(assert (=> b!145903 false))

(declare-datatypes ((Unit!4610 0))(
  ( (Unit!4611) )
))
(declare-fun lt!76728 () Unit!4610)

(declare-datatypes ((List!1771 0))(
  ( (Nil!1768) (Cons!1767 (h!2375 (_ BitVec 64)) (t!6444 List!1771)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4967 (_ BitVec 32) (_ BitVec 64) List!1771) Unit!4610)

(assert (=> b!145903 (= lt!76728 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4776 (v!3341 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) (Cons!1767 (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) Nil!1768)))))

(declare-fun arrayNoDuplicates!0 (array!4967 (_ BitVec 32) List!1771) Bool)

(assert (=> b!145903 (arrayNoDuplicates!0 (_keys!4776 (v!3341 (underlying!494 thiss!992))) from!355 Nil!1768)))

(declare-fun lt!76732 () Unit!4610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4967 (_ BitVec 32) (_ BitVec 32)) Unit!4610)

(assert (=> b!145903 (= lt!76732 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4776 (v!3341 (underlying!494 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145903 (arrayContainsKey!0 (_keys!4776 (v!3341 (underlying!494 thiss!992))) (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76731 () Unit!4610)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!150 (array!4967 array!4969 (_ BitVec 32) (_ BitVec 32) V!3595 V!3595 (_ BitVec 64) (_ BitVec 32) Int) Unit!4610)

(assert (=> b!145903 (= lt!76731 (lemmaListMapContainsThenArrayContainsFrom!150 (_keys!4776 (v!3341 (underlying!494 thiss!992))) (_values!2990 (v!3341 (underlying!494 thiss!992))) (mask!7379 (v!3341 (underlying!494 thiss!992))) (extraKeys!2752 (v!3341 (underlying!494 thiss!992))) (zeroValue!2852 (v!3341 (underlying!494 thiss!992))) (minValue!2852 (v!3341 (underlying!494 thiss!992))) (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3007 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun mapIsEmpty!4955 () Bool)

(declare-fun mapRes!4955 () Bool)

(assert (=> mapIsEmpty!4955 mapRes!4955))

(declare-fun tp_is_empty!2961 () Bool)

(declare-fun e!95097 () Bool)

(declare-fun e!95104 () Bool)

(declare-fun array_inv!1475 (array!4967) Bool)

(declare-fun array_inv!1476 (array!4969) Bool)

(assert (=> b!145904 (= e!95104 (and tp!11770 tp_is_empty!2961 (array_inv!1475 (_keys!4776 newMap!16)) (array_inv!1476 (_values!2990 newMap!16)) e!95097))))

(declare-fun b!145905 () Bool)

(declare-fun e!95092 () Bool)

(assert (=> b!145905 (= e!95092 tp_is_empty!2961)))

(declare-fun e!95091 () Bool)

(assert (=> b!145906 (= e!95102 (and tp!11769 tp_is_empty!2961 (array_inv!1475 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) (array_inv!1476 (_values!2990 (v!3341 (underlying!494 thiss!992)))) e!95091))))

(declare-fun b!145907 () Bool)

(declare-fun e!95100 () Bool)

(assert (=> b!145907 (= e!95097 (and e!95100 mapRes!4955))))

(declare-fun condMapEmpty!4956 () Bool)

(declare-fun mapDefault!4955 () ValueCell!1137)

(assert (=> b!145907 (= condMapEmpty!4956 (= (arr!2346 (_values!2990 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1137)) mapDefault!4955)))))

(declare-fun b!145908 () Bool)

(assert (=> b!145908 (= e!95096 e!95090)))

(declare-fun res!69478 () Bool)

(assert (=> b!145908 (=> (not res!69478) (not e!95090))))

(declare-fun contains!948 (ListLongMap!1769 (_ BitVec 64)) Bool)

(assert (=> b!145908 (= res!69478 (contains!948 lt!76729 (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2748 0))(
  ( (tuple2!2749 (_1!1385 Bool) (_2!1385 LongMapFixedSize!1182)) )
))
(declare-fun lt!76733 () tuple2!2748)

(declare-fun update!223 (LongMapFixedSize!1182 (_ BitVec 64) V!3595) tuple2!2748)

(declare-fun get!1564 (ValueCell!1137 V!3595) V!3595)

(declare-fun dynLambda!454 (Int (_ BitVec 64)) V!3595)

(assert (=> b!145908 (= lt!76733 (update!223 newMap!16 (select (arr!2345 (_keys!4776 (v!3341 (underlying!494 thiss!992)))) from!355) (get!1564 (select (arr!2346 (_values!2990 (v!3341 (underlying!494 thiss!992)))) from!355) (dynLambda!454 (defaultEntry!3007 (v!3341 (underlying!494 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145909 () Bool)

(declare-fun e!95094 () Bool)

(assert (=> b!145909 (= e!95094 tp_is_empty!2961)))

(declare-fun b!145910 () Bool)

(declare-fun e!95093 () Bool)

(assert (=> b!145910 (= e!95093 tp_is_empty!2961)))

(declare-fun b!145911 () Bool)

(declare-fun res!69476 () Bool)

(assert (=> b!145911 (=> (not res!69476) (not e!95103))))

(declare-fun valid!573 (LongMapFixedSize!1182) Bool)

(assert (=> b!145911 (= res!69476 (valid!573 newMap!16))))

(declare-fun res!69477 () Bool)

(assert (=> start!15192 (=> (not res!69477) (not e!95103))))

(declare-fun valid!574 (LongMap!966) Bool)

(assert (=> start!15192 (= res!69477 (valid!574 thiss!992))))

(assert (=> start!15192 e!95103))

(declare-fun e!95095 () Bool)

(assert (=> start!15192 e!95095))

(assert (=> start!15192 true))

(assert (=> start!15192 e!95104))

(declare-fun b!145900 () Bool)

(assert (=> b!145900 (= e!95095 e!95101)))

(declare-fun b!145912 () Bool)

(declare-fun res!69480 () Bool)

(assert (=> b!145912 (=> (not res!69480) (not e!95103))))

(assert (=> b!145912 (= res!69480 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7379 newMap!16)) (_size!640 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun b!145913 () Bool)

(assert (=> b!145913 (= e!95100 tp_is_empty!2961)))

(declare-fun mapNonEmpty!4955 () Bool)

(declare-fun tp!11771 () Bool)

(assert (=> mapNonEmpty!4955 (= mapRes!4955 (and tp!11771 e!95092))))

(declare-fun mapKey!4955 () (_ BitVec 32))

(declare-fun mapValue!4956 () ValueCell!1137)

(declare-fun mapRest!4955 () (Array (_ BitVec 32) ValueCell!1137))

(assert (=> mapNonEmpty!4955 (= (arr!2346 (_values!2990 newMap!16)) (store mapRest!4955 mapKey!4955 mapValue!4956))))

(declare-fun mapNonEmpty!4956 () Bool)

(declare-fun mapRes!4956 () Bool)

(declare-fun tp!11772 () Bool)

(assert (=> mapNonEmpty!4956 (= mapRes!4956 (and tp!11772 e!95094))))

(declare-fun mapKey!4956 () (_ BitVec 32))

(declare-fun mapValue!4955 () ValueCell!1137)

(declare-fun mapRest!4956 () (Array (_ BitVec 32) ValueCell!1137))

(assert (=> mapNonEmpty!4956 (= (arr!2346 (_values!2990 (v!3341 (underlying!494 thiss!992)))) (store mapRest!4956 mapKey!4956 mapValue!4955))))

(declare-fun b!145914 () Bool)

(assert (=> b!145914 (= e!95091 (and e!95093 mapRes!4956))))

(declare-fun condMapEmpty!4955 () Bool)

(declare-fun mapDefault!4956 () ValueCell!1137)

(assert (=> b!145914 (= condMapEmpty!4955 (= (arr!2346 (_values!2990 (v!3341 (underlying!494 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1137)) mapDefault!4956)))))

(declare-fun mapIsEmpty!4956 () Bool)

(assert (=> mapIsEmpty!4956 mapRes!4956))

(assert (= (and start!15192 res!69477) b!145899))

(assert (= (and b!145899 res!69479) b!145911))

(assert (= (and b!145911 res!69476) b!145912))

(assert (= (and b!145912 res!69480) b!145901))

(assert (= (and b!145901 res!69475) b!145908))

(assert (= (and b!145908 res!69478) b!145903))

(assert (= (and b!145914 condMapEmpty!4955) mapIsEmpty!4956))

(assert (= (and b!145914 (not condMapEmpty!4955)) mapNonEmpty!4956))

(get-info :version)

(assert (= (and mapNonEmpty!4956 ((_ is ValueCellFull!1137) mapValue!4955)) b!145909))

(assert (= (and b!145914 ((_ is ValueCellFull!1137) mapDefault!4956)) b!145910))

(assert (= b!145906 b!145914))

(assert (= b!145902 b!145906))

(assert (= b!145900 b!145902))

(assert (= start!15192 b!145900))

(assert (= (and b!145907 condMapEmpty!4956) mapIsEmpty!4955))

(assert (= (and b!145907 (not condMapEmpty!4956)) mapNonEmpty!4955))

(assert (= (and mapNonEmpty!4955 ((_ is ValueCellFull!1137) mapValue!4956)) b!145905))

(assert (= (and b!145907 ((_ is ValueCellFull!1137) mapDefault!4955)) b!145913))

(assert (= b!145904 b!145907))

(assert (= start!15192 b!145904))

(declare-fun b_lambda!6537 () Bool)

(assert (=> (not b_lambda!6537) (not b!145908)))

(declare-fun t!6440 () Bool)

(declare-fun tb!2633 () Bool)

(assert (=> (and b!145906 (= (defaultEntry!3007 (v!3341 (underlying!494 thiss!992))) (defaultEntry!3007 (v!3341 (underlying!494 thiss!992)))) t!6440) tb!2633))

(declare-fun result!4305 () Bool)

(assert (=> tb!2633 (= result!4305 tp_is_empty!2961)))

(assert (=> b!145908 t!6440))

(declare-fun b_and!9099 () Bool)

(assert (= b_and!9095 (and (=> t!6440 result!4305) b_and!9099)))

(declare-fun t!6442 () Bool)

(declare-fun tb!2635 () Bool)

(assert (=> (and b!145904 (= (defaultEntry!3007 newMap!16) (defaultEntry!3007 (v!3341 (underlying!494 thiss!992)))) t!6442) tb!2635))

(declare-fun result!4309 () Bool)

(assert (= result!4309 result!4305))

(assert (=> b!145908 t!6442))

(declare-fun b_and!9101 () Bool)

(assert (= b_and!9097 (and (=> t!6442 result!4309) b_and!9101)))

(declare-fun m!175739 () Bool)

(assert (=> mapNonEmpty!4955 m!175739))

(declare-fun m!175741 () Bool)

(assert (=> b!145901 m!175741))

(declare-fun m!175743 () Bool)

(assert (=> b!145901 m!175743))

(declare-fun m!175745 () Bool)

(assert (=> b!145901 m!175745))

(declare-fun m!175747 () Bool)

(assert (=> b!145904 m!175747))

(declare-fun m!175749 () Bool)

(assert (=> b!145904 m!175749))

(declare-fun m!175751 () Bool)

(assert (=> start!15192 m!175751))

(declare-fun m!175753 () Bool)

(assert (=> mapNonEmpty!4956 m!175753))

(assert (=> b!145908 m!175741))

(declare-fun m!175755 () Bool)

(assert (=> b!145908 m!175755))

(declare-fun m!175757 () Bool)

(assert (=> b!145908 m!175757))

(declare-fun m!175759 () Bool)

(assert (=> b!145908 m!175759))

(declare-fun m!175761 () Bool)

(assert (=> b!145908 m!175761))

(assert (=> b!145908 m!175741))

(assert (=> b!145908 m!175759))

(assert (=> b!145908 m!175741))

(assert (=> b!145908 m!175761))

(declare-fun m!175763 () Bool)

(assert (=> b!145908 m!175763))

(assert (=> b!145908 m!175757))

(declare-fun m!175765 () Bool)

(assert (=> b!145906 m!175765))

(declare-fun m!175767 () Bool)

(assert (=> b!145906 m!175767))

(declare-fun m!175769 () Bool)

(assert (=> b!145911 m!175769))

(declare-fun m!175771 () Bool)

(assert (=> b!145903 m!175771))

(declare-fun m!175773 () Bool)

(assert (=> b!145903 m!175773))

(assert (=> b!145903 m!175741))

(declare-fun m!175775 () Bool)

(assert (=> b!145903 m!175775))

(assert (=> b!145903 m!175741))

(assert (=> b!145903 m!175741))

(declare-fun m!175777 () Bool)

(assert (=> b!145903 m!175777))

(assert (=> b!145903 m!175741))

(declare-fun m!175779 () Bool)

(assert (=> b!145903 m!175779))

(check-sat (not b!145901) tp_is_empty!2961 (not b_next!3091) (not start!15192) (not b!145903) (not b!145906) (not b_lambda!6537) b_and!9101 (not b_next!3089) (not mapNonEmpty!4955) (not b!145908) (not mapNonEmpty!4956) (not b!145904) (not b!145911) b_and!9099)
(check-sat b_and!9099 b_and!9101 (not b_next!3089) (not b_next!3091))
