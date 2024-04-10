; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10948 () Bool)

(assert start!10948)

(declare-fun b!88832 () Bool)

(declare-fun b_free!2261 () Bool)

(declare-fun b_next!2261 () Bool)

(assert (=> b!88832 (= b_free!2261 (not b_next!2261))))

(declare-fun tp!9022 () Bool)

(declare-fun b_and!5343 () Bool)

(assert (=> b!88832 (= tp!9022 b_and!5343)))

(declare-fun b!88818 () Bool)

(declare-fun b_free!2263 () Bool)

(declare-fun b_next!2263 () Bool)

(assert (=> b!88818 (= b_free!2263 (not b_next!2263))))

(declare-fun tp!9023 () Bool)

(declare-fun b_and!5345 () Bool)

(assert (=> b!88818 (= tp!9023 b_and!5345)))

(declare-fun b!88817 () Bool)

(declare-fun e!57850 () Bool)

(declare-fun tp_is_empty!2547 () Bool)

(assert (=> b!88817 (= e!57850 tp_is_empty!2547)))

(declare-fun e!57851 () Bool)

(declare-datatypes ((V!3043 0))(
  ( (V!3044 (val!1318 Int)) )
))
(declare-datatypes ((array!4057 0))(
  ( (array!4058 (arr!1931 (Array (_ BitVec 32) (_ BitVec 64))) (size!2177 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!930 0))(
  ( (ValueCellFull!930 (v!2673 V!3043)) (EmptyCell!930) )
))
(declare-datatypes ((array!4059 0))(
  ( (array!4060 (arr!1932 (Array (_ BitVec 32) ValueCell!930)) (size!2178 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!768 0))(
  ( (LongMapFixedSize!769 (defaultEntry!2372 Int) (mask!6416 (_ BitVec 32)) (extraKeys!2205 (_ BitVec 32)) (zeroValue!2261 V!3043) (minValue!2261 V!3043) (_size!433 (_ BitVec 32)) (_keys!4050 array!4057) (_values!2355 array!4059) (_vacant!433 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!768)

(declare-fun e!57847 () Bool)

(declare-fun array_inv!1195 (array!4057) Bool)

(declare-fun array_inv!1196 (array!4059) Bool)

(assert (=> b!88818 (= e!57847 (and tp!9023 tp_is_empty!2547 (array_inv!1195 (_keys!4050 newMap!16)) (array_inv!1196 (_values!2355 newMap!16)) e!57851))))

(declare-fun b!88819 () Bool)

(declare-fun res!45468 () Bool)

(declare-fun e!57844 () Bool)

(assert (=> b!88819 (=> (not res!45468) (not e!57844))))

(declare-datatypes ((Cell!568 0))(
  ( (Cell!569 (v!2674 LongMapFixedSize!768)) )
))
(declare-datatypes ((LongMap!568 0))(
  ( (LongMap!569 (underlying!295 Cell!568)) )
))
(declare-fun thiss!992 () LongMap!568)

(assert (=> b!88819 (= res!45468 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6416 newMap!16)) (_size!433 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!88820 () Bool)

(declare-fun e!57853 () Bool)

(declare-fun e!57843 () Bool)

(assert (=> b!88820 (= e!57853 e!57843)))

(declare-fun res!45460 () Bool)

(assert (=> b!88820 (=> (not res!45460) (not e!57843))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!88820 (= res!45460 (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42545 () V!3043)

(declare-fun get!1208 (ValueCell!930 V!3043) V!3043)

(declare-fun dynLambda!344 (Int (_ BitVec 64)) V!3043)

(assert (=> b!88820 (= lt!42545 (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88821 () Bool)

(declare-fun e!57845 () Bool)

(assert (=> b!88821 (= e!57845 tp_is_empty!2547)))

(declare-fun b!88822 () Bool)

(assert (=> b!88822 (= e!57844 e!57853)))

(declare-fun res!45462 () Bool)

(assert (=> b!88822 (=> (not res!45462) (not e!57853))))

(declare-datatypes ((tuple2!2210 0))(
  ( (tuple2!2211 (_1!1116 (_ BitVec 64)) (_2!1116 V!3043)) )
))
(declare-datatypes ((List!1526 0))(
  ( (Nil!1523) (Cons!1522 (h!2114 tuple2!2210) (t!5284 List!1526)) )
))
(declare-datatypes ((ListLongMap!1469 0))(
  ( (ListLongMap!1470 (toList!750 List!1526)) )
))
(declare-fun lt!42533 () ListLongMap!1469)

(declare-fun lt!42531 () ListLongMap!1469)

(assert (=> b!88822 (= res!45462 (= lt!42533 lt!42531))))

(declare-fun map!1196 (LongMapFixedSize!768) ListLongMap!1469)

(assert (=> b!88822 (= lt!42531 (map!1196 newMap!16))))

(declare-fun getCurrentListMap!443 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) Int) ListLongMap!1469)

(assert (=> b!88822 (= lt!42533 (getCurrentListMap!443 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!88823 () Bool)

(declare-datatypes ((Unit!2636 0))(
  ( (Unit!2637) )
))
(declare-fun e!57852 () Unit!2636)

(declare-fun Unit!2638 () Unit!2636)

(assert (=> b!88823 (= e!57852 Unit!2638)))

(declare-fun lt!42544 () Unit!2636)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!70 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) (_ BitVec 32) Int) Unit!2636)

(assert (=> b!88823 (= lt!42544 (lemmaListMapContainsThenArrayContainsFrom!70 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!88823 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!42543 () Unit!2636)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4057 (_ BitVec 32) (_ BitVec 32)) Unit!2636)

(assert (=> b!88823 (= lt!42543 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1527 0))(
  ( (Nil!1524) (Cons!1523 (h!2115 (_ BitVec 64)) (t!5285 List!1527)) )
))
(declare-fun arrayNoDuplicates!0 (array!4057 (_ BitVec 32) List!1527) Bool)

(assert (=> b!88823 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) from!355 Nil!1524)))

(declare-fun lt!42532 () Unit!2636)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4057 (_ BitVec 32) (_ BitVec 64) List!1527) Unit!2636)

(assert (=> b!88823 (= lt!42532 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524)))))

(assert (=> b!88823 false))

(declare-fun b!88824 () Bool)

(declare-fun e!57842 () Bool)

(assert (=> b!88824 (= e!57842 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 Nil!1524))))

(declare-fun b!88825 () Bool)

(declare-fun e!57840 () Bool)

(declare-fun mapRes!3449 () Bool)

(assert (=> b!88825 (= e!57851 (and e!57840 mapRes!3449))))

(declare-fun condMapEmpty!3450 () Bool)

(declare-fun mapDefault!3450 () ValueCell!930)

(assert (=> b!88825 (= condMapEmpty!3450 (= (arr!1932 (_values!2355 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3450)))))

(declare-fun b!88826 () Bool)

(declare-fun res!45466 () Bool)

(assert (=> b!88826 (=> (not res!45466) (not e!57844))))

(declare-fun valid!329 (LongMapFixedSize!768) Bool)

(assert (=> b!88826 (= res!45466 (valid!329 newMap!16))))

(declare-fun res!45464 () Bool)

(assert (=> start!10948 (=> (not res!45464) (not e!57844))))

(declare-fun valid!330 (LongMap!568) Bool)

(assert (=> start!10948 (= res!45464 (valid!330 thiss!992))))

(assert (=> start!10948 e!57844))

(declare-fun e!57839 () Bool)

(assert (=> start!10948 e!57839))

(assert (=> start!10948 true))

(assert (=> start!10948 e!57847))

(declare-fun b!88827 () Bool)

(declare-fun res!45463 () Bool)

(assert (=> b!88827 (=> res!45463 e!57842)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4057 (_ BitVec 32)) Bool)

(assert (=> b!88827 (= res!45463 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!88828 () Bool)

(declare-fun e!57854 () Bool)

(declare-fun e!57841 () Bool)

(assert (=> b!88828 (= e!57854 e!57841)))

(declare-fun b!88829 () Bool)

(declare-fun e!57855 () Bool)

(assert (=> b!88829 (= e!57855 tp_is_empty!2547)))

(declare-fun b!88830 () Bool)

(declare-fun e!57856 () Bool)

(assert (=> b!88830 (= e!57856 (not e!57842))))

(declare-fun res!45467 () Bool)

(assert (=> b!88830 (=> res!45467 e!57842)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!88830 (= res!45467 (not (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun lt!42530 () ListLongMap!1469)

(declare-fun lt!42538 () tuple2!2210)

(declare-fun lt!42546 () ListLongMap!1469)

(declare-fun lt!42541 () tuple2!2210)

(declare-fun +!113 (ListLongMap!1469 tuple2!2210) ListLongMap!1469)

(assert (=> b!88830 (= (+!113 lt!42546 lt!42538) (+!113 (+!113 lt!42530 lt!42538) lt!42541))))

(assert (=> b!88830 (= lt!42538 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42536 () Unit!2636)

(declare-fun addCommutativeForDiffKeys!32 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64) V!3043) Unit!2636)

(assert (=> b!88830 (= lt!42536 (addCommutativeForDiffKeys!32 lt!42530 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42542 () ListLongMap!1469)

(assert (=> b!88830 (= lt!42542 lt!42546)))

(assert (=> b!88830 (= lt!42546 (+!113 lt!42530 lt!42541))))

(declare-fun lt!42535 () ListLongMap!1469)

(declare-fun lt!42540 () tuple2!2210)

(assert (=> b!88830 (= lt!42542 (+!113 lt!42535 lt!42540))))

(declare-fun lt!42537 () ListLongMap!1469)

(assert (=> b!88830 (= lt!42530 (+!113 lt!42537 lt!42540))))

(assert (=> b!88830 (= lt!42540 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(assert (=> b!88830 (= lt!42535 (+!113 lt!42537 lt!42541))))

(assert (=> b!88830 (= lt!42541 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))

(declare-fun lt!42539 () Unit!2636)

(assert (=> b!88830 (= lt!42539 (addCommutativeForDiffKeys!32 lt!42537 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!78 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) Int) ListLongMap!1469)

(assert (=> b!88830 (= lt!42537 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!88831 () Bool)

(declare-fun res!45461 () Bool)

(assert (=> b!88831 (=> (not res!45461) (not e!57844))))

(assert (=> b!88831 (= res!45461 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun e!57848 () Bool)

(assert (=> b!88832 (= e!57841 (and tp!9022 tp_is_empty!2547 (array_inv!1195 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (array_inv!1196 (_values!2355 (v!2674 (underlying!295 thiss!992)))) e!57848))))

(declare-fun b!88833 () Bool)

(assert (=> b!88833 (= e!57843 e!57856)))

(declare-fun res!45459 () Bool)

(assert (=> b!88833 (=> (not res!45459) (not e!57856))))

(declare-datatypes ((tuple2!2212 0))(
  ( (tuple2!2213 (_1!1117 Bool) (_2!1117 LongMapFixedSize!768)) )
))
(declare-fun lt!42529 () tuple2!2212)

(assert (=> b!88833 (= res!45459 (and (_1!1117 lt!42529) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!42534 () Unit!2636)

(assert (=> b!88833 (= lt!42534 e!57852)))

(declare-fun c!14717 () Bool)

(declare-fun contains!760 (ListLongMap!1469 (_ BitVec 64)) Bool)

(assert (=> b!88833 (= c!14717 (contains!760 lt!42531 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun update!115 (LongMapFixedSize!768 (_ BitVec 64) V!3043) tuple2!2212)

(assert (=> b!88833 (= lt!42529 (update!115 newMap!16 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))

(declare-fun mapIsEmpty!3449 () Bool)

(assert (=> mapIsEmpty!3449 mapRes!3449))

(declare-fun b!88834 () Bool)

(assert (=> b!88834 (= e!57840 tp_is_empty!2547)))

(declare-fun b!88835 () Bool)

(declare-fun mapRes!3450 () Bool)

(assert (=> b!88835 (= e!57848 (and e!57850 mapRes!3450))))

(declare-fun condMapEmpty!3449 () Bool)

(declare-fun mapDefault!3449 () ValueCell!930)

(assert (=> b!88835 (= condMapEmpty!3449 (= (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3449)))))

(declare-fun b!88836 () Bool)

(declare-fun Unit!2639 () Unit!2636)

(assert (=> b!88836 (= e!57852 Unit!2639)))

(declare-fun mapIsEmpty!3450 () Bool)

(assert (=> mapIsEmpty!3450 mapRes!3450))

(declare-fun mapNonEmpty!3449 () Bool)

(declare-fun tp!9021 () Bool)

(assert (=> mapNonEmpty!3449 (= mapRes!3450 (and tp!9021 e!57845))))

(declare-fun mapKey!3449 () (_ BitVec 32))

(declare-fun mapRest!3450 () (Array (_ BitVec 32) ValueCell!930))

(declare-fun mapValue!3450 () ValueCell!930)

(assert (=> mapNonEmpty!3449 (= (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (store mapRest!3450 mapKey!3449 mapValue!3450))))

(declare-fun b!88837 () Bool)

(declare-fun res!45465 () Bool)

(assert (=> b!88837 (=> res!45465 e!57842)))

(assert (=> b!88837 (= res!45465 (or (not (= (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6416 (v!2674 (underlying!295 thiss!992)))))) (not (= (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992)))))) (bvslt (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!88838 () Bool)

(assert (=> b!88838 (= e!57839 e!57854)))

(declare-fun mapNonEmpty!3450 () Bool)

(declare-fun tp!9024 () Bool)

(assert (=> mapNonEmpty!3450 (= mapRes!3449 (and tp!9024 e!57855))))

(declare-fun mapKey!3450 () (_ BitVec 32))

(declare-fun mapRest!3449 () (Array (_ BitVec 32) ValueCell!930))

(declare-fun mapValue!3449 () ValueCell!930)

(assert (=> mapNonEmpty!3450 (= (arr!1932 (_values!2355 newMap!16)) (store mapRest!3449 mapKey!3450 mapValue!3449))))

(assert (= (and start!10948 res!45464) b!88831))

(assert (= (and b!88831 res!45461) b!88826))

(assert (= (and b!88826 res!45466) b!88819))

(assert (= (and b!88819 res!45468) b!88822))

(assert (= (and b!88822 res!45462) b!88820))

(assert (= (and b!88820 res!45460) b!88833))

(assert (= (and b!88833 c!14717) b!88823))

(assert (= (and b!88833 (not c!14717)) b!88836))

(assert (= (and b!88833 res!45459) b!88830))

(assert (= (and b!88830 (not res!45467)) b!88837))

(assert (= (and b!88837 (not res!45465)) b!88827))

(assert (= (and b!88827 (not res!45463)) b!88824))

(assert (= (and b!88835 condMapEmpty!3449) mapIsEmpty!3450))

(assert (= (and b!88835 (not condMapEmpty!3449)) mapNonEmpty!3449))

(get-info :version)

(assert (= (and mapNonEmpty!3449 ((_ is ValueCellFull!930) mapValue!3450)) b!88821))

(assert (= (and b!88835 ((_ is ValueCellFull!930) mapDefault!3449)) b!88817))

(assert (= b!88832 b!88835))

(assert (= b!88828 b!88832))

(assert (= b!88838 b!88828))

(assert (= start!10948 b!88838))

(assert (= (and b!88825 condMapEmpty!3450) mapIsEmpty!3449))

(assert (= (and b!88825 (not condMapEmpty!3450)) mapNonEmpty!3450))

(assert (= (and mapNonEmpty!3450 ((_ is ValueCellFull!930) mapValue!3449)) b!88829))

(assert (= (and b!88825 ((_ is ValueCellFull!930) mapDefault!3450)) b!88834))

(assert (= b!88818 b!88825))

(assert (= start!10948 b!88818))

(declare-fun b_lambda!3935 () Bool)

(assert (=> (not b_lambda!3935) (not b!88820)))

(declare-fun t!5281 () Bool)

(declare-fun tb!1725 () Bool)

(assert (=> (and b!88832 (= (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) t!5281) tb!1725))

(declare-fun result!2965 () Bool)

(assert (=> tb!1725 (= result!2965 tp_is_empty!2547)))

(assert (=> b!88820 t!5281))

(declare-fun b_and!5347 () Bool)

(assert (= b_and!5343 (and (=> t!5281 result!2965) b_and!5347)))

(declare-fun tb!1727 () Bool)

(declare-fun t!5283 () Bool)

(assert (=> (and b!88818 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) t!5283) tb!1727))

(declare-fun result!2969 () Bool)

(assert (= result!2969 result!2965))

(assert (=> b!88820 t!5283))

(declare-fun b_and!5349 () Bool)

(assert (= b_and!5345 (and (=> t!5283 result!2969) b_and!5349)))

(declare-fun m!95187 () Bool)

(assert (=> b!88832 m!95187))

(declare-fun m!95189 () Bool)

(assert (=> b!88832 m!95189))

(declare-fun m!95191 () Bool)

(assert (=> b!88826 m!95191))

(declare-fun m!95193 () Bool)

(assert (=> mapNonEmpty!3450 m!95193))

(declare-fun m!95195 () Bool)

(assert (=> b!88827 m!95195))

(declare-fun m!95197 () Bool)

(assert (=> start!10948 m!95197))

(declare-fun m!95199 () Bool)

(assert (=> b!88824 m!95199))

(declare-fun m!95201 () Bool)

(assert (=> b!88820 m!95201))

(declare-fun m!95203 () Bool)

(assert (=> b!88820 m!95203))

(declare-fun m!95205 () Bool)

(assert (=> b!88820 m!95205))

(assert (=> b!88820 m!95203))

(assert (=> b!88820 m!95205))

(declare-fun m!95207 () Bool)

(assert (=> b!88820 m!95207))

(declare-fun m!95209 () Bool)

(assert (=> b!88818 m!95209))

(declare-fun m!95211 () Bool)

(assert (=> b!88818 m!95211))

(declare-fun m!95213 () Bool)

(assert (=> mapNonEmpty!3449 m!95213))

(declare-fun m!95215 () Bool)

(assert (=> b!88822 m!95215))

(declare-fun m!95217 () Bool)

(assert (=> b!88822 m!95217))

(declare-fun m!95219 () Bool)

(assert (=> b!88823 m!95219))

(declare-fun m!95221 () Bool)

(assert (=> b!88823 m!95221))

(assert (=> b!88823 m!95201))

(declare-fun m!95223 () Bool)

(assert (=> b!88823 m!95223))

(assert (=> b!88823 m!95201))

(assert (=> b!88823 m!95201))

(declare-fun m!95225 () Bool)

(assert (=> b!88823 m!95225))

(assert (=> b!88823 m!95201))

(declare-fun m!95227 () Bool)

(assert (=> b!88823 m!95227))

(declare-fun m!95229 () Bool)

(assert (=> b!88830 m!95229))

(declare-fun m!95231 () Bool)

(assert (=> b!88830 m!95231))

(declare-fun m!95233 () Bool)

(assert (=> b!88830 m!95233))

(declare-fun m!95235 () Bool)

(assert (=> b!88830 m!95235))

(declare-fun m!95237 () Bool)

(assert (=> b!88830 m!95237))

(declare-fun m!95239 () Bool)

(assert (=> b!88830 m!95239))

(declare-fun m!95241 () Bool)

(assert (=> b!88830 m!95241))

(declare-fun m!95243 () Bool)

(assert (=> b!88830 m!95243))

(assert (=> b!88830 m!95201))

(declare-fun m!95245 () Bool)

(assert (=> b!88830 m!95245))

(assert (=> b!88830 m!95201))

(declare-fun m!95247 () Bool)

(assert (=> b!88830 m!95247))

(declare-fun m!95249 () Bool)

(assert (=> b!88830 m!95249))

(assert (=> b!88830 m!95201))

(assert (=> b!88830 m!95231))

(assert (=> b!88833 m!95201))

(assert (=> b!88833 m!95201))

(declare-fun m!95251 () Bool)

(assert (=> b!88833 m!95251))

(assert (=> b!88833 m!95201))

(declare-fun m!95253 () Bool)

(assert (=> b!88833 m!95253))

(check-sat (not b!88822) (not b!88826) (not b!88830) (not b!88820) (not b_next!2263) (not b!88824) b_and!5347 (not b!88833) (not mapNonEmpty!3449) (not b!88827) b_and!5349 (not start!10948) (not b!88818) (not b_lambda!3935) (not b!88832) (not b_next!2261) (not b!88823) (not mapNonEmpty!3450) tp_is_empty!2547)
(check-sat b_and!5347 b_and!5349 (not b_next!2261) (not b_next!2263))
(get-model)

(declare-fun b_lambda!3939 () Bool)

(assert (= b_lambda!3935 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3939)))

(check-sat (not b!88822) (not b!88830) (not b!88820) (not b_next!2263) (not b!88824) b_and!5347 (not b!88833) (not mapNonEmpty!3449) (not b!88827) b_and!5349 (not start!10948) (not b!88818) (not b!88826) (not b_lambda!3939) (not b!88832) (not b_next!2261) (not b!88823) (not mapNonEmpty!3450) tp_is_empty!2547)
(check-sat b_and!5347 b_and!5349 (not b_next!2261) (not b_next!2263))
(get-model)

(declare-fun d!23667 () Bool)

(assert (=> d!23667 (= (+!113 (+!113 lt!42530 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (+!113 (+!113 lt!42530 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(declare-fun lt!42603 () Unit!2636)

(declare-fun choose!526 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64) V!3043) Unit!2636)

(assert (=> d!23667 (= lt!42603 (choose!526 lt!42530 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(assert (=> d!23667 (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23667 (= (addCommutativeForDiffKeys!32 lt!42530 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))) lt!42603)))

(declare-fun bs!3747 () Bool)

(assert (= bs!3747 d!23667))

(declare-fun m!95323 () Bool)

(assert (=> bs!3747 m!95323))

(declare-fun m!95325 () Bool)

(assert (=> bs!3747 m!95325))

(declare-fun m!95327 () Bool)

(assert (=> bs!3747 m!95327))

(declare-fun m!95329 () Bool)

(assert (=> bs!3747 m!95329))

(assert (=> bs!3747 m!95327))

(assert (=> bs!3747 m!95323))

(assert (=> bs!3747 m!95201))

(declare-fun m!95331 () Bool)

(assert (=> bs!3747 m!95331))

(assert (=> b!88830 d!23667))

(declare-fun d!23669 () Bool)

(declare-fun e!57913 () Bool)

(assert (=> d!23669 e!57913))

(declare-fun res!45503 () Bool)

(assert (=> d!23669 (=> (not res!45503) (not e!57913))))

(declare-fun lt!42613 () ListLongMap!1469)

(assert (=> d!23669 (= res!45503 (contains!760 lt!42613 (_1!1116 lt!42541)))))

(declare-fun lt!42615 () List!1526)

(assert (=> d!23669 (= lt!42613 (ListLongMap!1470 lt!42615))))

(declare-fun lt!42614 () Unit!2636)

(declare-fun lt!42612 () Unit!2636)

(assert (=> d!23669 (= lt!42614 lt!42612)))

(declare-datatypes ((Option!148 0))(
  ( (Some!147 (v!2678 V!3043)) (None!146) )
))
(declare-fun getValueByKey!142 (List!1526 (_ BitVec 64)) Option!148)

(assert (=> d!23669 (= (getValueByKey!142 lt!42615 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(declare-fun lemmaContainsTupThenGetReturnValue!59 (List!1526 (_ BitVec 64) V!3043) Unit!2636)

(assert (=> d!23669 (= lt!42612 (lemmaContainsTupThenGetReturnValue!59 lt!42615 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun insertStrictlySorted!62 (List!1526 (_ BitVec 64) V!3043) List!1526)

(assert (=> d!23669 (= lt!42615 (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(assert (=> d!23669 (= (+!113 lt!42530 lt!42541) lt!42613)))

(declare-fun b!88913 () Bool)

(declare-fun res!45504 () Bool)

(assert (=> b!88913 (=> (not res!45504) (not e!57913))))

(assert (=> b!88913 (= res!45504 (= (getValueByKey!142 (toList!750 lt!42613) (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541))))))

(declare-fun b!88914 () Bool)

(declare-fun contains!761 (List!1526 tuple2!2210) Bool)

(assert (=> b!88914 (= e!57913 (contains!761 (toList!750 lt!42613) lt!42541))))

(assert (= (and d!23669 res!45503) b!88913))

(assert (= (and b!88913 res!45504) b!88914))

(declare-fun m!95333 () Bool)

(assert (=> d!23669 m!95333))

(declare-fun m!95335 () Bool)

(assert (=> d!23669 m!95335))

(declare-fun m!95337 () Bool)

(assert (=> d!23669 m!95337))

(declare-fun m!95339 () Bool)

(assert (=> d!23669 m!95339))

(declare-fun m!95341 () Bool)

(assert (=> b!88913 m!95341))

(declare-fun m!95343 () Bool)

(assert (=> b!88914 m!95343))

(assert (=> b!88830 d!23669))

(declare-fun b!88939 () Bool)

(declare-fun res!45513 () Bool)

(declare-fun e!57928 () Bool)

(assert (=> b!88939 (=> (not res!45513) (not e!57928))))

(declare-fun lt!42633 () ListLongMap!1469)

(assert (=> b!88939 (= res!45513 (not (contains!760 lt!42633 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88940 () Bool)

(declare-fun lt!42636 () Unit!2636)

(declare-fun lt!42634 () Unit!2636)

(assert (=> b!88940 (= lt!42636 lt!42634)))

(declare-fun lt!42632 () ListLongMap!1469)

(declare-fun lt!42630 () (_ BitVec 64))

(declare-fun lt!42631 () (_ BitVec 64))

(declare-fun lt!42635 () V!3043)

(assert (=> b!88940 (not (contains!760 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635)) lt!42630))))

(declare-fun addStillNotContains!33 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> b!88940 (= lt!42634 (addStillNotContains!33 lt!42632 lt!42631 lt!42635 lt!42630))))

(assert (=> b!88940 (= lt!42630 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88940 (= lt!42635 (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88940 (= lt!42631 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8553 () ListLongMap!1469)

(assert (=> b!88940 (= lt!42632 call!8553)))

(declare-fun e!57933 () ListLongMap!1469)

(assert (=> b!88940 (= e!57933 (+!113 call!8553 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88941 () Bool)

(assert (=> b!88941 (= e!57933 call!8553)))

(declare-fun b!88942 () Bool)

(declare-fun e!57931 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!88942 (= e!57931 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88942 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!88943 () Bool)

(declare-fun e!57934 () Bool)

(declare-fun isEmpty!341 (ListLongMap!1469) Bool)

(assert (=> b!88943 (= e!57934 (isEmpty!341 lt!42633))))

(declare-fun b!88944 () Bool)

(declare-fun e!57930 () Bool)

(declare-fun e!57929 () Bool)

(assert (=> b!88944 (= e!57930 e!57929)))

(assert (=> b!88944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun res!45516 () Bool)

(assert (=> b!88944 (= res!45516 (contains!760 lt!42633 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88944 (=> (not res!45516) (not e!57929))))

(declare-fun d!23671 () Bool)

(assert (=> d!23671 e!57928))

(declare-fun res!45515 () Bool)

(assert (=> d!23671 (=> (not res!45515) (not e!57928))))

(assert (=> d!23671 (= res!45515 (not (contains!760 lt!42633 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!57932 () ListLongMap!1469)

(assert (=> d!23671 (= lt!42633 e!57932)))

(declare-fun c!14730 () Bool)

(assert (=> d!23671 (= c!14730 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23671 (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23671 (= (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) lt!42633)))

(declare-fun bm!8550 () Bool)

(assert (=> bm!8550 (= call!8553 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!88945 () Bool)

(assert (=> b!88945 (= e!57932 e!57933)))

(declare-fun c!14732 () Bool)

(assert (=> b!88945 (= c!14732 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88946 () Bool)

(assert (=> b!88946 (= e!57930 e!57934)))

(declare-fun c!14729 () Bool)

(assert (=> b!88946 (= c!14729 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!88947 () Bool)

(assert (=> b!88947 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> b!88947 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun apply!84 (ListLongMap!1469 (_ BitVec 64)) V!3043)

(assert (=> b!88947 (= e!57929 (= (apply!84 lt!42633 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88948 () Bool)

(assert (=> b!88948 (= e!57932 (ListLongMap!1470 Nil!1523))))

(declare-fun b!88949 () Bool)

(assert (=> b!88949 (= e!57928 e!57930)))

(declare-fun c!14731 () Bool)

(assert (=> b!88949 (= c!14731 e!57931)))

(declare-fun res!45514 () Bool)

(assert (=> b!88949 (=> (not res!45514) (not e!57931))))

(assert (=> b!88949 (= res!45514 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!88950 () Bool)

(assert (=> b!88950 (= e!57934 (= lt!42633 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23671 c!14730) b!88948))

(assert (= (and d!23671 (not c!14730)) b!88945))

(assert (= (and b!88945 c!14732) b!88940))

(assert (= (and b!88945 (not c!14732)) b!88941))

(assert (= (or b!88940 b!88941) bm!8550))

(assert (= (and d!23671 res!45515) b!88939))

(assert (= (and b!88939 res!45513) b!88949))

(assert (= (and b!88949 res!45514) b!88942))

(assert (= (and b!88949 c!14731) b!88944))

(assert (= (and b!88949 (not c!14731)) b!88946))

(assert (= (and b!88944 res!45516) b!88947))

(assert (= (and b!88946 c!14729) b!88950))

(assert (= (and b!88946 (not c!14729)) b!88943))

(declare-fun b_lambda!3941 () Bool)

(assert (=> (not b_lambda!3941) (not b!88940)))

(assert (=> b!88940 t!5281))

(declare-fun b_and!5359 () Bool)

(assert (= b_and!5347 (and (=> t!5281 result!2965) b_and!5359)))

(assert (=> b!88940 t!5283))

(declare-fun b_and!5361 () Bool)

(assert (= b_and!5349 (and (=> t!5283 result!2969) b_and!5361)))

(declare-fun b_lambda!3943 () Bool)

(assert (=> (not b_lambda!3943) (not b!88947)))

(assert (=> b!88947 t!5281))

(declare-fun b_and!5363 () Bool)

(assert (= b_and!5359 (and (=> t!5281 result!2965) b_and!5363)))

(assert (=> b!88947 t!5283))

(declare-fun b_and!5365 () Bool)

(assert (= b_and!5361 (and (=> t!5283 result!2969) b_and!5365)))

(declare-fun m!95345 () Bool)

(assert (=> b!88940 m!95345))

(assert (=> b!88940 m!95205))

(declare-fun m!95347 () Bool)

(assert (=> b!88940 m!95347))

(declare-fun m!95349 () Bool)

(assert (=> b!88940 m!95349))

(assert (=> b!88940 m!95205))

(declare-fun m!95351 () Bool)

(assert (=> b!88940 m!95351))

(assert (=> b!88940 m!95349))

(declare-fun m!95353 () Bool)

(assert (=> b!88940 m!95353))

(declare-fun m!95355 () Bool)

(assert (=> b!88940 m!95355))

(assert (=> b!88940 m!95347))

(declare-fun m!95357 () Bool)

(assert (=> b!88940 m!95357))

(assert (=> b!88945 m!95353))

(assert (=> b!88945 m!95353))

(declare-fun m!95359 () Bool)

(assert (=> b!88945 m!95359))

(declare-fun m!95361 () Bool)

(assert (=> d!23671 m!95361))

(assert (=> d!23671 m!95229))

(declare-fun m!95363 () Bool)

(assert (=> b!88950 m!95363))

(assert (=> bm!8550 m!95363))

(assert (=> b!88947 m!95353))

(declare-fun m!95365 () Bool)

(assert (=> b!88947 m!95365))

(assert (=> b!88947 m!95205))

(assert (=> b!88947 m!95349))

(assert (=> b!88947 m!95205))

(assert (=> b!88947 m!95351))

(assert (=> b!88947 m!95349))

(assert (=> b!88947 m!95353))

(declare-fun m!95367 () Bool)

(assert (=> b!88939 m!95367))

(declare-fun m!95369 () Bool)

(assert (=> b!88943 m!95369))

(assert (=> b!88942 m!95353))

(assert (=> b!88942 m!95353))

(assert (=> b!88942 m!95359))

(assert (=> b!88944 m!95353))

(assert (=> b!88944 m!95353))

(declare-fun m!95371 () Bool)

(assert (=> b!88944 m!95371))

(assert (=> b!88830 d!23671))

(declare-fun d!23673 () Bool)

(declare-fun e!57935 () Bool)

(assert (=> d!23673 e!57935))

(declare-fun res!45517 () Bool)

(assert (=> d!23673 (=> (not res!45517) (not e!57935))))

(declare-fun lt!42638 () ListLongMap!1469)

(assert (=> d!23673 (= res!45517 (contains!760 lt!42638 (_1!1116 lt!42540)))))

(declare-fun lt!42640 () List!1526)

(assert (=> d!23673 (= lt!42638 (ListLongMap!1470 lt!42640))))

(declare-fun lt!42639 () Unit!2636)

(declare-fun lt!42637 () Unit!2636)

(assert (=> d!23673 (= lt!42639 lt!42637)))

(assert (=> d!23673 (= (getValueByKey!142 lt!42640 (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540)))))

(assert (=> d!23673 (= lt!42637 (lemmaContainsTupThenGetReturnValue!59 lt!42640 (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(assert (=> d!23673 (= lt!42640 (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(assert (=> d!23673 (= (+!113 lt!42537 lt!42540) lt!42638)))

(declare-fun b!88951 () Bool)

(declare-fun res!45518 () Bool)

(assert (=> b!88951 (=> (not res!45518) (not e!57935))))

(assert (=> b!88951 (= res!45518 (= (getValueByKey!142 (toList!750 lt!42638) (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540))))))

(declare-fun b!88952 () Bool)

(assert (=> b!88952 (= e!57935 (contains!761 (toList!750 lt!42638) lt!42540))))

(assert (= (and d!23673 res!45517) b!88951))

(assert (= (and b!88951 res!45518) b!88952))

(declare-fun m!95373 () Bool)

(assert (=> d!23673 m!95373))

(declare-fun m!95375 () Bool)

(assert (=> d!23673 m!95375))

(declare-fun m!95377 () Bool)

(assert (=> d!23673 m!95377))

(declare-fun m!95379 () Bool)

(assert (=> d!23673 m!95379))

(declare-fun m!95381 () Bool)

(assert (=> b!88951 m!95381))

(declare-fun m!95383 () Bool)

(assert (=> b!88952 m!95383))

(assert (=> b!88830 d!23673))

(declare-fun d!23675 () Bool)

(assert (=> d!23675 (= (+!113 (+!113 lt!42537 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (+!113 (+!113 lt!42537 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(declare-fun lt!42641 () Unit!2636)

(assert (=> d!23675 (= lt!42641 (choose!526 lt!42537 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(assert (=> d!23675 (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23675 (= (addCommutativeForDiffKeys!32 lt!42537 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) lt!42641)))

(declare-fun bs!3748 () Bool)

(assert (= bs!3748 d!23675))

(declare-fun m!95385 () Bool)

(assert (=> bs!3748 m!95385))

(declare-fun m!95387 () Bool)

(assert (=> bs!3748 m!95387))

(declare-fun m!95389 () Bool)

(assert (=> bs!3748 m!95389))

(declare-fun m!95391 () Bool)

(assert (=> bs!3748 m!95391))

(assert (=> bs!3748 m!95389))

(assert (=> bs!3748 m!95385))

(assert (=> bs!3748 m!95201))

(declare-fun m!95393 () Bool)

(assert (=> bs!3748 m!95393))

(assert (=> b!88830 d!23675))

(declare-fun d!23677 () Bool)

(declare-fun e!57936 () Bool)

(assert (=> d!23677 e!57936))

(declare-fun res!45519 () Bool)

(assert (=> d!23677 (=> (not res!45519) (not e!57936))))

(declare-fun lt!42643 () ListLongMap!1469)

(assert (=> d!23677 (= res!45519 (contains!760 lt!42643 (_1!1116 lt!42541)))))

(declare-fun lt!42645 () List!1526)

(assert (=> d!23677 (= lt!42643 (ListLongMap!1470 lt!42645))))

(declare-fun lt!42644 () Unit!2636)

(declare-fun lt!42642 () Unit!2636)

(assert (=> d!23677 (= lt!42644 lt!42642)))

(assert (=> d!23677 (= (getValueByKey!142 lt!42645 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(assert (=> d!23677 (= lt!42642 (lemmaContainsTupThenGetReturnValue!59 lt!42645 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(assert (=> d!23677 (= lt!42645 (insertStrictlySorted!62 (toList!750 (+!113 lt!42530 lt!42538)) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(assert (=> d!23677 (= (+!113 (+!113 lt!42530 lt!42538) lt!42541) lt!42643)))

(declare-fun b!88953 () Bool)

(declare-fun res!45520 () Bool)

(assert (=> b!88953 (=> (not res!45520) (not e!57936))))

(assert (=> b!88953 (= res!45520 (= (getValueByKey!142 (toList!750 lt!42643) (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541))))))

(declare-fun b!88954 () Bool)

(assert (=> b!88954 (= e!57936 (contains!761 (toList!750 lt!42643) lt!42541))))

(assert (= (and d!23677 res!45519) b!88953))

(assert (= (and b!88953 res!45520) b!88954))

(declare-fun m!95395 () Bool)

(assert (=> d!23677 m!95395))

(declare-fun m!95397 () Bool)

(assert (=> d!23677 m!95397))

(declare-fun m!95399 () Bool)

(assert (=> d!23677 m!95399))

(declare-fun m!95401 () Bool)

(assert (=> d!23677 m!95401))

(declare-fun m!95403 () Bool)

(assert (=> b!88953 m!95403))

(declare-fun m!95405 () Bool)

(assert (=> b!88954 m!95405))

(assert (=> b!88830 d!23677))

(declare-fun d!23679 () Bool)

(declare-fun e!57937 () Bool)

(assert (=> d!23679 e!57937))

(declare-fun res!45521 () Bool)

(assert (=> d!23679 (=> (not res!45521) (not e!57937))))

(declare-fun lt!42647 () ListLongMap!1469)

(assert (=> d!23679 (= res!45521 (contains!760 lt!42647 (_1!1116 lt!42538)))))

(declare-fun lt!42649 () List!1526)

(assert (=> d!23679 (= lt!42647 (ListLongMap!1470 lt!42649))))

(declare-fun lt!42648 () Unit!2636)

(declare-fun lt!42646 () Unit!2636)

(assert (=> d!23679 (= lt!42648 lt!42646)))

(assert (=> d!23679 (= (getValueByKey!142 lt!42649 (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538)))))

(assert (=> d!23679 (= lt!42646 (lemmaContainsTupThenGetReturnValue!59 lt!42649 (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(assert (=> d!23679 (= lt!42649 (insertStrictlySorted!62 (toList!750 lt!42546) (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(assert (=> d!23679 (= (+!113 lt!42546 lt!42538) lt!42647)))

(declare-fun b!88955 () Bool)

(declare-fun res!45522 () Bool)

(assert (=> b!88955 (=> (not res!45522) (not e!57937))))

(assert (=> b!88955 (= res!45522 (= (getValueByKey!142 (toList!750 lt!42647) (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538))))))

(declare-fun b!88956 () Bool)

(assert (=> b!88956 (= e!57937 (contains!761 (toList!750 lt!42647) lt!42538))))

(assert (= (and d!23679 res!45521) b!88955))

(assert (= (and b!88955 res!45522) b!88956))

(declare-fun m!95407 () Bool)

(assert (=> d!23679 m!95407))

(declare-fun m!95409 () Bool)

(assert (=> d!23679 m!95409))

(declare-fun m!95411 () Bool)

(assert (=> d!23679 m!95411))

(declare-fun m!95413 () Bool)

(assert (=> d!23679 m!95413))

(declare-fun m!95415 () Bool)

(assert (=> b!88955 m!95415))

(declare-fun m!95417 () Bool)

(assert (=> b!88956 m!95417))

(assert (=> b!88830 d!23679))

(declare-fun d!23681 () Bool)

(declare-fun e!57938 () Bool)

(assert (=> d!23681 e!57938))

(declare-fun res!45523 () Bool)

(assert (=> d!23681 (=> (not res!45523) (not e!57938))))

(declare-fun lt!42651 () ListLongMap!1469)

(assert (=> d!23681 (= res!45523 (contains!760 lt!42651 (_1!1116 lt!42538)))))

(declare-fun lt!42653 () List!1526)

(assert (=> d!23681 (= lt!42651 (ListLongMap!1470 lt!42653))))

(declare-fun lt!42652 () Unit!2636)

(declare-fun lt!42650 () Unit!2636)

(assert (=> d!23681 (= lt!42652 lt!42650)))

(assert (=> d!23681 (= (getValueByKey!142 lt!42653 (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538)))))

(assert (=> d!23681 (= lt!42650 (lemmaContainsTupThenGetReturnValue!59 lt!42653 (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(assert (=> d!23681 (= lt!42653 (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(assert (=> d!23681 (= (+!113 lt!42530 lt!42538) lt!42651)))

(declare-fun b!88957 () Bool)

(declare-fun res!45524 () Bool)

(assert (=> b!88957 (=> (not res!45524) (not e!57938))))

(assert (=> b!88957 (= res!45524 (= (getValueByKey!142 (toList!750 lt!42651) (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538))))))

(declare-fun b!88958 () Bool)

(assert (=> b!88958 (= e!57938 (contains!761 (toList!750 lt!42651) lt!42538))))

(assert (= (and d!23681 res!45523) b!88957))

(assert (= (and b!88957 res!45524) b!88958))

(declare-fun m!95419 () Bool)

(assert (=> d!23681 m!95419))

(declare-fun m!95421 () Bool)

(assert (=> d!23681 m!95421))

(declare-fun m!95423 () Bool)

(assert (=> d!23681 m!95423))

(declare-fun m!95425 () Bool)

(assert (=> d!23681 m!95425))

(declare-fun m!95427 () Bool)

(assert (=> b!88957 m!95427))

(declare-fun m!95429 () Bool)

(assert (=> b!88958 m!95429))

(assert (=> b!88830 d!23681))

(declare-fun d!23683 () Bool)

(declare-fun e!57939 () Bool)

(assert (=> d!23683 e!57939))

(declare-fun res!45525 () Bool)

(assert (=> d!23683 (=> (not res!45525) (not e!57939))))

(declare-fun lt!42655 () ListLongMap!1469)

(assert (=> d!23683 (= res!45525 (contains!760 lt!42655 (_1!1116 lt!42540)))))

(declare-fun lt!42657 () List!1526)

(assert (=> d!23683 (= lt!42655 (ListLongMap!1470 lt!42657))))

(declare-fun lt!42656 () Unit!2636)

(declare-fun lt!42654 () Unit!2636)

(assert (=> d!23683 (= lt!42656 lt!42654)))

(assert (=> d!23683 (= (getValueByKey!142 lt!42657 (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540)))))

(assert (=> d!23683 (= lt!42654 (lemmaContainsTupThenGetReturnValue!59 lt!42657 (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(assert (=> d!23683 (= lt!42657 (insertStrictlySorted!62 (toList!750 lt!42535) (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(assert (=> d!23683 (= (+!113 lt!42535 lt!42540) lt!42655)))

(declare-fun b!88959 () Bool)

(declare-fun res!45526 () Bool)

(assert (=> b!88959 (=> (not res!45526) (not e!57939))))

(assert (=> b!88959 (= res!45526 (= (getValueByKey!142 (toList!750 lt!42655) (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540))))))

(declare-fun b!88960 () Bool)

(assert (=> b!88960 (= e!57939 (contains!761 (toList!750 lt!42655) lt!42540))))

(assert (= (and d!23683 res!45525) b!88959))

(assert (= (and b!88959 res!45526) b!88960))

(declare-fun m!95431 () Bool)

(assert (=> d!23683 m!95431))

(declare-fun m!95433 () Bool)

(assert (=> d!23683 m!95433))

(declare-fun m!95435 () Bool)

(assert (=> d!23683 m!95435))

(declare-fun m!95437 () Bool)

(assert (=> d!23683 m!95437))

(declare-fun m!95439 () Bool)

(assert (=> b!88959 m!95439))

(declare-fun m!95441 () Bool)

(assert (=> b!88960 m!95441))

(assert (=> b!88830 d!23683))

(declare-fun d!23685 () Bool)

(assert (=> d!23685 (= (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992)))) (and (or (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000001111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000011111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000001111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000011111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000001111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000011111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000001111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000011111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000000111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000001111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000011111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000000111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000001111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000011111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000000111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000001111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000011111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000000111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000001111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000011111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00000111111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00001111111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00011111111111111111111111111111) (= (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6416 (v!2674 (underlying!295 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!88830 d!23685))

(declare-fun d!23687 () Bool)

(declare-fun e!57940 () Bool)

(assert (=> d!23687 e!57940))

(declare-fun res!45527 () Bool)

(assert (=> d!23687 (=> (not res!45527) (not e!57940))))

(declare-fun lt!42659 () ListLongMap!1469)

(assert (=> d!23687 (= res!45527 (contains!760 lt!42659 (_1!1116 lt!42541)))))

(declare-fun lt!42661 () List!1526)

(assert (=> d!23687 (= lt!42659 (ListLongMap!1470 lt!42661))))

(declare-fun lt!42660 () Unit!2636)

(declare-fun lt!42658 () Unit!2636)

(assert (=> d!23687 (= lt!42660 lt!42658)))

(assert (=> d!23687 (= (getValueByKey!142 lt!42661 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(assert (=> d!23687 (= lt!42658 (lemmaContainsTupThenGetReturnValue!59 lt!42661 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(assert (=> d!23687 (= lt!42661 (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(assert (=> d!23687 (= (+!113 lt!42537 lt!42541) lt!42659)))

(declare-fun b!88961 () Bool)

(declare-fun res!45528 () Bool)

(assert (=> b!88961 (=> (not res!45528) (not e!57940))))

(assert (=> b!88961 (= res!45528 (= (getValueByKey!142 (toList!750 lt!42659) (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541))))))

(declare-fun b!88962 () Bool)

(assert (=> b!88962 (= e!57940 (contains!761 (toList!750 lt!42659) lt!42541))))

(assert (= (and d!23687 res!45527) b!88961))

(assert (= (and b!88961 res!45528) b!88962))

(declare-fun m!95443 () Bool)

(assert (=> d!23687 m!95443))

(declare-fun m!95445 () Bool)

(assert (=> d!23687 m!95445))

(declare-fun m!95447 () Bool)

(assert (=> d!23687 m!95447))

(declare-fun m!95449 () Bool)

(assert (=> d!23687 m!95449))

(declare-fun m!95451 () Bool)

(assert (=> b!88961 m!95451))

(declare-fun m!95453 () Bool)

(assert (=> b!88962 m!95453))

(assert (=> b!88830 d!23687))

(declare-fun b!88973 () Bool)

(declare-fun e!57952 () Bool)

(declare-fun e!57951 () Bool)

(assert (=> b!88973 (= e!57952 e!57951)))

(declare-fun c!14735 () Bool)

(assert (=> b!88973 (= c!14735 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!8553 () Bool)

(declare-fun call!8556 () Bool)

(assert (=> bm!8553 (= call!8556 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14735 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) Nil!1524) Nil!1524)))))

(declare-fun b!88974 () Bool)

(declare-fun e!57949 () Bool)

(assert (=> b!88974 (= e!57949 e!57952)))

(declare-fun res!45535 () Bool)

(assert (=> b!88974 (=> (not res!45535) (not e!57952))))

(declare-fun e!57950 () Bool)

(assert (=> b!88974 (= res!45535 (not e!57950))))

(declare-fun res!45536 () Bool)

(assert (=> b!88974 (=> (not res!45536) (not e!57950))))

(assert (=> b!88974 (= res!45536 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!23689 () Bool)

(declare-fun res!45537 () Bool)

(assert (=> d!23689 (=> res!45537 e!57949)))

(assert (=> d!23689 (= res!45537 (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23689 (= (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 Nil!1524) e!57949)))

(declare-fun b!88975 () Bool)

(assert (=> b!88975 (= e!57951 call!8556)))

(declare-fun b!88976 () Bool)

(assert (=> b!88976 (= e!57951 call!8556)))

(declare-fun b!88977 () Bool)

(declare-fun contains!762 (List!1527 (_ BitVec 64)) Bool)

(assert (=> b!88977 (= e!57950 (contains!762 Nil!1524 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23689 (not res!45537)) b!88974))

(assert (= (and b!88974 res!45536) b!88977))

(assert (= (and b!88974 res!45535) b!88973))

(assert (= (and b!88973 c!14735) b!88975))

(assert (= (and b!88973 (not c!14735)) b!88976))

(assert (= (or b!88975 b!88976) bm!8553))

(declare-fun m!95455 () Bool)

(assert (=> b!88973 m!95455))

(assert (=> b!88973 m!95455))

(declare-fun m!95457 () Bool)

(assert (=> b!88973 m!95457))

(assert (=> bm!8553 m!95455))

(declare-fun m!95459 () Bool)

(assert (=> bm!8553 m!95459))

(assert (=> b!88974 m!95455))

(assert (=> b!88974 m!95455))

(assert (=> b!88974 m!95457))

(assert (=> b!88977 m!95455))

(assert (=> b!88977 m!95455))

(declare-fun m!95461 () Bool)

(assert (=> b!88977 m!95461))

(assert (=> b!88824 d!23689))

(declare-fun d!23691 () Bool)

(declare-fun res!45544 () Bool)

(declare-fun e!57955 () Bool)

(assert (=> d!23691 (=> (not res!45544) (not e!57955))))

(declare-fun simpleValid!60 (LongMapFixedSize!768) Bool)

(assert (=> d!23691 (= res!45544 (simpleValid!60 newMap!16))))

(assert (=> d!23691 (= (valid!329 newMap!16) e!57955)))

(declare-fun b!88984 () Bool)

(declare-fun res!45545 () Bool)

(assert (=> b!88984 (=> (not res!45545) (not e!57955))))

(declare-fun arrayCountValidKeys!0 (array!4057 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!88984 (= res!45545 (= (arrayCountValidKeys!0 (_keys!4050 newMap!16) #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (_size!433 newMap!16)))))

(declare-fun b!88985 () Bool)

(declare-fun res!45546 () Bool)

(assert (=> b!88985 (=> (not res!45546) (not e!57955))))

(assert (=> b!88985 (= res!45546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun b!88986 () Bool)

(assert (=> b!88986 (= e!57955 (arrayNoDuplicates!0 (_keys!4050 newMap!16) #b00000000000000000000000000000000 Nil!1524))))

(assert (= (and d!23691 res!45544) b!88984))

(assert (= (and b!88984 res!45545) b!88985))

(assert (= (and b!88985 res!45546) b!88986))

(declare-fun m!95463 () Bool)

(assert (=> d!23691 m!95463))

(declare-fun m!95465 () Bool)

(assert (=> b!88984 m!95465))

(declare-fun m!95467 () Bool)

(assert (=> b!88985 m!95467))

(declare-fun m!95469 () Bool)

(assert (=> b!88986 m!95469))

(assert (=> b!88826 d!23691))

(declare-fun d!23693 () Bool)

(declare-fun c!14738 () Bool)

(assert (=> d!23693 (= c!14738 ((_ is ValueCellFull!930) (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!57958 () V!3043)

(assert (=> d!23693 (= (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57958)))

(declare-fun b!88991 () Bool)

(declare-fun get!1209 (ValueCell!930 V!3043) V!3043)

(assert (=> b!88991 (= e!57958 (get!1209 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88992 () Bool)

(declare-fun get!1210 (ValueCell!930 V!3043) V!3043)

(assert (=> b!88992 (= e!57958 (get!1210 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23693 c!14738) b!88991))

(assert (= (and d!23693 (not c!14738)) b!88992))

(assert (=> b!88991 m!95203))

(assert (=> b!88991 m!95205))

(declare-fun m!95471 () Bool)

(assert (=> b!88991 m!95471))

(assert (=> b!88992 m!95203))

(assert (=> b!88992 m!95205))

(declare-fun m!95473 () Bool)

(assert (=> b!88992 m!95473))

(assert (=> b!88820 d!23693))

(declare-fun d!23695 () Bool)

(declare-fun e!57964 () Bool)

(assert (=> d!23695 e!57964))

(declare-fun res!45549 () Bool)

(assert (=> d!23695 (=> res!45549 e!57964)))

(declare-fun lt!42670 () Bool)

(assert (=> d!23695 (= res!45549 (not lt!42670))))

(declare-fun lt!42673 () Bool)

(assert (=> d!23695 (= lt!42670 lt!42673)))

(declare-fun lt!42672 () Unit!2636)

(declare-fun e!57963 () Unit!2636)

(assert (=> d!23695 (= lt!42672 e!57963)))

(declare-fun c!14741 () Bool)

(assert (=> d!23695 (= c!14741 lt!42673)))

(declare-fun containsKey!146 (List!1526 (_ BitVec 64)) Bool)

(assert (=> d!23695 (= lt!42673 (containsKey!146 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23695 (= (contains!760 lt!42531 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) lt!42670)))

(declare-fun b!88999 () Bool)

(declare-fun lt!42671 () Unit!2636)

(assert (=> b!88999 (= e!57963 lt!42671)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!94 (List!1526 (_ BitVec 64)) Unit!2636)

(assert (=> b!88999 (= lt!42671 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun isDefined!95 (Option!148) Bool)

(assert (=> b!88999 (isDefined!95 (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89000 () Bool)

(declare-fun Unit!2642 () Unit!2636)

(assert (=> b!89000 (= e!57963 Unit!2642)))

(declare-fun b!89001 () Bool)

(assert (=> b!89001 (= e!57964 (isDefined!95 (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23695 c!14741) b!88999))

(assert (= (and d!23695 (not c!14741)) b!89000))

(assert (= (and d!23695 (not res!45549)) b!89001))

(assert (=> d!23695 m!95201))

(declare-fun m!95475 () Bool)

(assert (=> d!23695 m!95475))

(assert (=> b!88999 m!95201))

(declare-fun m!95477 () Bool)

(assert (=> b!88999 m!95477))

(assert (=> b!88999 m!95201))

(declare-fun m!95479 () Bool)

(assert (=> b!88999 m!95479))

(assert (=> b!88999 m!95479))

(declare-fun m!95481 () Bool)

(assert (=> b!88999 m!95481))

(assert (=> b!89001 m!95201))

(assert (=> b!89001 m!95479))

(assert (=> b!89001 m!95479))

(assert (=> b!89001 m!95481))

(assert (=> b!88833 d!23695))

(declare-fun b!89086 () Bool)

(declare-fun e!58018 () Bool)

(declare-fun call!8609 () ListLongMap!1469)

(declare-fun call!8618 () ListLongMap!1469)

(assert (=> b!89086 (= e!58018 (= call!8609 call!8618))))

(declare-fun bm!8602 () Bool)

(declare-datatypes ((SeekEntryResult!245 0))(
  ( (MissingZero!245 (index!3119 (_ BitVec 32))) (Found!245 (index!3120 (_ BitVec 32))) (Intermediate!245 (undefined!1057 Bool) (index!3121 (_ BitVec 32)) (x!12231 (_ BitVec 32))) (Undefined!245) (MissingVacant!245 (index!3122 (_ BitVec 32))) )
))
(declare-fun call!8617 () SeekEntryResult!245)

(declare-fun call!8615 () SeekEntryResult!245)

(assert (=> bm!8602 (= call!8617 call!8615)))

(declare-fun b!89087 () Bool)

(declare-fun e!58012 () Bool)

(declare-fun lt!42754 () SeekEntryResult!245)

(assert (=> b!89087 (= e!58012 ((_ is Undefined!245) lt!42754))))

(declare-fun b!89088 () Bool)

(declare-fun e!58017 () Bool)

(declare-fun call!8626 () Bool)

(assert (=> b!89088 (= e!58017 (not call!8626))))

(declare-fun b!89089 () Bool)

(declare-fun e!58023 () Bool)

(declare-fun call!8624 () Bool)

(assert (=> b!89089 (= e!58023 (not call!8624))))

(declare-fun b!89090 () Bool)

(declare-fun e!58019 () Unit!2636)

(declare-fun lt!42746 () Unit!2636)

(assert (=> b!89090 (= e!58019 lt!42746)))

(declare-fun call!8616 () Unit!2636)

(assert (=> b!89090 (= lt!42746 call!8616)))

(declare-fun lt!42733 () SeekEntryResult!245)

(assert (=> b!89090 (= lt!42733 call!8617)))

(declare-fun res!45581 () Bool)

(assert (=> b!89090 (= res!45581 ((_ is Found!245) lt!42733))))

(declare-fun e!58015 () Bool)

(assert (=> b!89090 (=> (not res!45581) (not e!58015))))

(assert (=> b!89090 e!58015))

(declare-fun b!89091 () Bool)

(declare-fun Unit!2643 () Unit!2636)

(assert (=> b!89091 (= e!58019 Unit!2643)))

(declare-fun lt!42753 () Unit!2636)

(declare-fun call!8605 () Unit!2636)

(assert (=> b!89091 (= lt!42753 call!8605)))

(assert (=> b!89091 (= lt!42754 call!8617)))

(declare-fun c!14772 () Bool)

(assert (=> b!89091 (= c!14772 ((_ is MissingZero!245) lt!42754))))

(declare-fun e!58016 () Bool)

(assert (=> b!89091 e!58016))

(declare-fun lt!42738 () Unit!2636)

(assert (=> b!89091 (= lt!42738 lt!42753)))

(assert (=> b!89091 false))

(declare-fun b!89092 () Bool)

(declare-fun lt!42729 () Unit!2636)

(declare-fun lt!42751 () Unit!2636)

(assert (=> b!89092 (= lt!42729 lt!42751)))

(declare-fun call!8614 () ListLongMap!1469)

(declare-fun call!8621 () ListLongMap!1469)

(assert (=> b!89092 (= call!8614 call!8621)))

(declare-fun lt!42748 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!33 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 V!3043 Int) Unit!2636)

(assert (=> b!89092 (= lt!42751 (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42748 (zeroValue!2261 newMap!16) lt!42545 (minValue!2261 newMap!16) (defaultEntry!2372 newMap!16)))))

(assert (=> b!89092 (= lt!42748 (bvor (extraKeys!2205 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!58014 () tuple2!2212)

(assert (=> b!89092 (= e!58014 (tuple2!2213 true (LongMapFixedSize!769 (defaultEntry!2372 newMap!16) (mask!6416 newMap!16) (bvor (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) lt!42545 (minValue!2261 newMap!16) (_size!433 newMap!16) (_keys!4050 newMap!16) (_values!2355 newMap!16) (_vacant!433 newMap!16))))))

(declare-fun b!89093 () Bool)

(declare-fun res!45585 () Bool)

(declare-fun call!8619 () Bool)

(assert (=> b!89093 (= res!45585 call!8619)))

(assert (=> b!89093 (=> (not res!45585) (not e!58015))))

(declare-fun bm!8603 () Bool)

(declare-fun call!8628 () ListLongMap!1469)

(assert (=> bm!8603 (= call!8614 call!8628)))

(declare-fun bm!8604 () Bool)

(assert (=> bm!8604 (= call!8618 (map!1196 newMap!16))))

(declare-fun b!89094 () Bool)

(declare-fun res!45586 () Bool)

(declare-fun lt!42745 () SeekEntryResult!245)

(assert (=> b!89094 (= res!45586 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3122 lt!42745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58030 () Bool)

(assert (=> b!89094 (=> (not res!45586) (not e!58030))))

(declare-fun b!89095 () Bool)

(declare-fun e!58021 () Bool)

(declare-fun lt!42743 () SeekEntryResult!245)

(assert (=> b!89095 (= e!58021 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42743)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun bm!8605 () Bool)

(declare-fun call!8620 () ListLongMap!1469)

(declare-fun call!8608 () ListLongMap!1469)

(assert (=> bm!8605 (= call!8620 call!8608)))

(declare-fun bm!8606 () Bool)

(declare-fun call!8622 () Bool)

(assert (=> bm!8606 (= call!8626 call!8622)))

(declare-fun bm!8607 () Bool)

(assert (=> bm!8607 (= call!8624 call!8622)))

(declare-fun b!89096 () Bool)

(declare-fun res!45580 () Bool)

(assert (=> b!89096 (=> (not res!45580) (not e!58017))))

(declare-fun call!8625 () Bool)

(assert (=> b!89096 (= res!45580 call!8625)))

(assert (=> b!89096 (= e!58016 e!58017)))

(declare-fun b!89097 () Bool)

(declare-fun e!58024 () ListLongMap!1469)

(declare-fun call!8623 () ListLongMap!1469)

(assert (=> b!89097 (= e!58024 call!8623)))

(declare-fun b!89098 () Bool)

(declare-fun e!58013 () tuple2!2212)

(declare-fun e!58020 () tuple2!2212)

(assert (=> b!89098 (= e!58013 e!58020)))

(declare-fun lt!42750 () SeekEntryResult!245)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4057 (_ BitVec 32)) SeekEntryResult!245)

(assert (=> b!89098 (= lt!42750 (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun c!14775 () Bool)

(assert (=> b!89098 (= c!14775 ((_ is Undefined!245) lt!42750))))

(declare-fun b!89099 () Bool)

(declare-fun lt!42747 () Unit!2636)

(declare-fun lt!42728 () Unit!2636)

(assert (=> b!89099 (= lt!42747 lt!42728)))

(declare-fun call!8606 () Bool)

(assert (=> b!89099 call!8606))

(declare-fun lt!42734 () array!4059)

(declare-fun lemmaValidKeyInArrayIsInListMap!94 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) Int) Unit!2636)

(assert (=> b!89099 (= lt!42728 (lemmaValidKeyInArrayIsInListMap!94 (_keys!4050 newMap!16) lt!42734 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (defaultEntry!2372 newMap!16)))))

(assert (=> b!89099 (= lt!42734 (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))))))

(declare-fun lt!42732 () Unit!2636)

(declare-fun lt!42731 () Unit!2636)

(assert (=> b!89099 (= lt!42732 lt!42731)))

(declare-fun call!8607 () ListLongMap!1469)

(assert (=> b!89099 (= call!8628 call!8607)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) (_ BitVec 64) V!3043 Int) Unit!2636)

(assert (=> b!89099 (= lt!42731 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42737 () Unit!2636)

(assert (=> b!89099 (= lt!42737 e!58019)))

(declare-fun c!14777 () Bool)

(assert (=> b!89099 (= c!14777 (contains!760 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!58026 () tuple2!2212)

(assert (=> b!89099 (= e!58026 (tuple2!2213 true (LongMapFixedSize!769 (defaultEntry!2372 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (_size!433 newMap!16) (_keys!4050 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))) (_vacant!433 newMap!16))))))

(declare-fun c!14779 () Bool)

(declare-fun bm!8608 () Bool)

(declare-fun c!14770 () Bool)

(declare-fun lt!42736 () (_ BitVec 32))

(assert (=> bm!8608 (= call!8608 (getCurrentListMap!443 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun c!14781 () Bool)

(declare-fun bm!8609 () Bool)

(declare-fun c!14783 () Bool)

(declare-fun call!8613 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8609 (= call!8613 (inRange!0 (ite c!14775 (ite c!14781 (index!3120 lt!42743) (ite c!14783 (index!3119 lt!42745) (index!3122 lt!42745))) (ite c!14777 (index!3120 lt!42733) (ite c!14772 (index!3119 lt!42754) (index!3122 lt!42754)))) (mask!6416 newMap!16)))))

(declare-fun bm!8610 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) Int) Unit!2636)

(assert (=> bm!8610 (= call!8605 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(declare-fun b!89100 () Bool)

(assert (=> b!89100 (= e!58030 (not call!8624))))

(declare-fun b!89101 () Bool)

(declare-fun lt!42741 () tuple2!2212)

(declare-fun call!8611 () tuple2!2212)

(assert (=> b!89101 (= lt!42741 call!8611)))

(assert (=> b!89101 (= e!58026 (tuple2!2213 (_1!1117 lt!42741) (_2!1117 lt!42741)))))

(declare-fun b!89102 () Bool)

(declare-fun res!45588 () Bool)

(assert (=> b!89102 (=> (not res!45588) (not e!58017))))

(assert (=> b!89102 (= res!45588 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3119 lt!42754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8611 () Bool)

(declare-fun call!8612 () Bool)

(assert (=> bm!8611 (= call!8612 call!8613)))

(declare-fun bm!8612 () Bool)

(assert (=> bm!8612 (= call!8625 call!8619)))

(declare-fun bm!8613 () Bool)

(declare-fun call!8627 () Bool)

(assert (=> bm!8613 (= call!8627 call!8612)))

(declare-fun bm!8614 () Bool)

(declare-fun c!14774 () Bool)

(assert (=> bm!8614 (= c!14774 c!14775)))

(assert (=> bm!8614 (= call!8606 (contains!760 e!58024 (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750)))))))

(declare-fun b!89103 () Bool)

(declare-fun res!45578 () Bool)

(assert (=> b!89103 (=> (not res!45578) (not e!58023))))

(assert (=> b!89103 (= res!45578 call!8627)))

(declare-fun e!58011 () Bool)

(assert (=> b!89103 (= e!58011 e!58023)))

(declare-fun b!89104 () Bool)

(declare-fun e!58028 () Bool)

(assert (=> b!89104 (= e!58028 e!58030)))

(declare-fun res!45584 () Bool)

(assert (=> b!89104 (= res!45584 call!8627)))

(assert (=> b!89104 (=> (not res!45584) (not e!58030))))

(declare-fun b!89105 () Bool)

(declare-fun e!58027 () Bool)

(assert (=> b!89105 (= e!58027 e!58018)))

(declare-fun c!14782 () Bool)

(declare-fun lt!42749 () tuple2!2212)

(assert (=> b!89105 (= c!14782 (_1!1117 lt!42749))))

(declare-fun bm!8615 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) Int) Unit!2636)

(assert (=> bm!8615 (= call!8616 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(declare-fun bm!8616 () Bool)

(assert (=> bm!8616 (= call!8607 call!8608)))

(declare-fun b!89106 () Bool)

(declare-fun e!58009 () Unit!2636)

(declare-fun lt!42752 () Unit!2636)

(assert (=> b!89106 (= e!58009 lt!42752)))

(assert (=> b!89106 (= lt!42752 call!8605)))

(declare-fun call!8610 () SeekEntryResult!245)

(assert (=> b!89106 (= lt!42745 call!8610)))

(assert (=> b!89106 (= c!14783 ((_ is MissingZero!245) lt!42745))))

(assert (=> b!89106 e!58011))

(declare-fun b!89107 () Bool)

(declare-fun lt!42735 () Unit!2636)

(declare-fun lt!42730 () Unit!2636)

(assert (=> b!89107 (= lt!42735 lt!42730)))

(assert (=> b!89107 (= call!8614 call!8620)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 V!3043 Int) Unit!2636)

(assert (=> b!89107 (= lt!42730 (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42736 (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) lt!42545 (defaultEntry!2372 newMap!16)))))

(assert (=> b!89107 (= lt!42736 (bvor (extraKeys!2205 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!89107 (= e!58014 (tuple2!2213 true (LongMapFixedSize!769 (defaultEntry!2372 newMap!16) (mask!6416 newMap!16) (bvor (extraKeys!2205 newMap!16) #b00000000000000000000000000000010) (zeroValue!2261 newMap!16) lt!42545 (_size!433 newMap!16) (_keys!4050 newMap!16) (_values!2355 newMap!16) (_vacant!433 newMap!16))))))

(declare-fun b!89108 () Bool)

(declare-fun e!58022 () Bool)

(assert (=> b!89108 (= e!58022 (= call!8609 (+!113 call!8618 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun e!58025 () ListLongMap!1469)

(declare-fun b!89109 () Bool)

(assert (=> b!89109 (= e!58025 (ite c!14770 call!8620 call!8621))))

(declare-fun b!89110 () Bool)

(declare-fun res!45583 () Bool)

(assert (=> b!89110 (=> (not res!45583) (not e!58023))))

(assert (=> b!89110 (= res!45583 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3119 lt!42745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8617 () Bool)

(assert (=> bm!8617 (= call!8628 (+!113 e!58025 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun c!14778 () Bool)

(assert (=> bm!8617 (= c!14778 c!14779)))

(declare-fun b!89111 () Bool)

(assert (=> b!89111 (= e!58025 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun b!89112 () Bool)

(declare-fun res!45591 () Bool)

(assert (=> b!89112 (= res!45591 call!8612)))

(assert (=> b!89112 (=> (not res!45591) (not e!58021))))

(declare-fun bm!8618 () Bool)

(assert (=> bm!8618 (= call!8615 (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun bm!8619 () Bool)

(assert (=> bm!8619 (= call!8623 (getCurrentListMap!443 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun b!89113 () Bool)

(assert (=> b!89113 (= e!58015 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42733)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89114 () Bool)

(assert (=> b!89114 (= e!58013 e!58014)))

(assert (=> b!89114 (= c!14770 (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8620 () Bool)

(assert (=> bm!8620 (= call!8609 (map!1196 (_2!1117 lt!42749)))))

(declare-fun bm!8621 () Bool)

(assert (=> bm!8621 (= call!8622 (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!89115 () Bool)

(declare-fun e!58010 () tuple2!2212)

(assert (=> b!89115 (= e!58010 e!58026)))

(declare-fun c!14773 () Bool)

(assert (=> b!89115 (= c!14773 ((_ is MissingZero!245) lt!42750))))

(declare-fun b!89116 () Bool)

(assert (=> b!89116 (= e!58024 call!8607)))

(declare-fun b!89117 () Bool)

(declare-fun lt!42742 () Unit!2636)

(assert (=> b!89117 (= lt!42742 e!58009)))

(assert (=> b!89117 (= c!14781 call!8606)))

(assert (=> b!89117 (= e!58020 (tuple2!2213 false newMap!16))))

(declare-fun bm!8622 () Bool)

(assert (=> bm!8622 (= call!8619 call!8613)))

(declare-fun b!89119 () Bool)

(declare-fun e!58029 () Bool)

(assert (=> b!89119 (= e!58012 e!58029)))

(declare-fun res!45579 () Bool)

(assert (=> b!89119 (= res!45579 call!8625)))

(assert (=> b!89119 (=> (not res!45579) (not e!58029))))

(declare-fun b!89118 () Bool)

(declare-fun lt!42739 () tuple2!2212)

(assert (=> b!89118 (= e!58010 (tuple2!2213 (_1!1117 lt!42739) (_2!1117 lt!42739)))))

(assert (=> b!89118 (= lt!42739 call!8611)))

(declare-fun d!23697 () Bool)

(assert (=> d!23697 e!58027))

(declare-fun res!45589 () Bool)

(assert (=> d!23697 (=> (not res!45589) (not e!58027))))

(assert (=> d!23697 (= res!45589 (valid!329 (_2!1117 lt!42749)))))

(assert (=> d!23697 (= lt!42749 e!58013)))

(assert (=> d!23697 (= c!14779 (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvneg (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23697 (valid!329 newMap!16)))

(assert (=> d!23697 (= (update!115 newMap!16 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545) lt!42749)))

(declare-fun b!89120 () Bool)

(declare-fun res!45590 () Bool)

(assert (=> b!89120 (= res!45590 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3122 lt!42754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89120 (=> (not res!45590) (not e!58029))))

(declare-fun b!89121 () Bool)

(assert (=> b!89121 (= e!58018 e!58022)))

(declare-fun res!45587 () Bool)

(assert (=> b!89121 (= res!45587 (contains!760 call!8609 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!89121 (=> (not res!45587) (not e!58022))))

(declare-fun c!14771 () Bool)

(declare-fun bm!8623 () Bool)

(declare-fun updateHelperNewKey!33 (LongMapFixedSize!768 (_ BitVec 64) V!3043 (_ BitVec 32)) tuple2!2212)

(assert (=> bm!8623 (= call!8611 (updateHelperNewKey!33 newMap!16 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750))))))

(declare-fun b!89122 () Bool)

(assert (=> b!89122 (= c!14771 ((_ is MissingVacant!245) lt!42750))))

(assert (=> b!89122 (= e!58020 e!58010)))

(declare-fun b!89123 () Bool)

(declare-fun c!14776 () Bool)

(assert (=> b!89123 (= c!14776 ((_ is MissingVacant!245) lt!42745))))

(assert (=> b!89123 (= e!58011 e!58028)))

(declare-fun bm!8624 () Bool)

(assert (=> bm!8624 (= call!8621 call!8623)))

(declare-fun b!89124 () Bool)

(declare-fun c!14780 () Bool)

(assert (=> b!89124 (= c!14780 ((_ is MissingVacant!245) lt!42754))))

(assert (=> b!89124 (= e!58016 e!58012)))

(declare-fun b!89125 () Bool)

(assert (=> b!89125 (= e!58028 ((_ is Undefined!245) lt!42745))))

(declare-fun b!89126 () Bool)

(assert (=> b!89126 (= e!58029 (not call!8626))))

(declare-fun bm!8625 () Bool)

(assert (=> bm!8625 (= call!8610 call!8615)))

(declare-fun b!89127 () Bool)

(declare-fun Unit!2644 () Unit!2636)

(assert (=> b!89127 (= e!58009 Unit!2644)))

(declare-fun lt!42744 () Unit!2636)

(assert (=> b!89127 (= lt!42744 call!8616)))

(assert (=> b!89127 (= lt!42743 call!8610)))

(declare-fun res!45582 () Bool)

(assert (=> b!89127 (= res!45582 ((_ is Found!245) lt!42743))))

(assert (=> b!89127 (=> (not res!45582) (not e!58021))))

(assert (=> b!89127 e!58021))

(declare-fun lt!42740 () Unit!2636)

(assert (=> b!89127 (= lt!42740 lt!42744)))

(assert (=> b!89127 false))

(assert (= (and d!23697 c!14779) b!89114))

(assert (= (and d!23697 (not c!14779)) b!89098))

(assert (= (and b!89114 c!14770) b!89092))

(assert (= (and b!89114 (not c!14770)) b!89107))

(assert (= (or b!89092 b!89107) bm!8605))

(assert (= (or b!89092 b!89107) bm!8624))

(assert (= (or b!89092 b!89107) bm!8603))

(assert (= (and b!89098 c!14775) b!89117))

(assert (= (and b!89098 (not c!14775)) b!89122))

(assert (= (and b!89117 c!14781) b!89127))

(assert (= (and b!89117 (not c!14781)) b!89106))

(assert (= (and b!89127 res!45582) b!89112))

(assert (= (and b!89112 res!45591) b!89095))

(assert (= (and b!89106 c!14783) b!89103))

(assert (= (and b!89106 (not c!14783)) b!89123))

(assert (= (and b!89103 res!45578) b!89110))

(assert (= (and b!89110 res!45583) b!89089))

(assert (= (and b!89123 c!14776) b!89104))

(assert (= (and b!89123 (not c!14776)) b!89125))

(assert (= (and b!89104 res!45584) b!89094))

(assert (= (and b!89094 res!45586) b!89100))

(assert (= (or b!89103 b!89104) bm!8613))

(assert (= (or b!89089 b!89100) bm!8607))

(assert (= (or b!89112 bm!8613) bm!8611))

(assert (= (or b!89127 b!89106) bm!8625))

(assert (= (and b!89122 c!14771) b!89118))

(assert (= (and b!89122 (not c!14771)) b!89115))

(assert (= (and b!89115 c!14773) b!89101))

(assert (= (and b!89115 (not c!14773)) b!89099))

(assert (= (and b!89099 c!14777) b!89090))

(assert (= (and b!89099 (not c!14777)) b!89091))

(assert (= (and b!89090 res!45581) b!89093))

(assert (= (and b!89093 res!45585) b!89113))

(assert (= (and b!89091 c!14772) b!89096))

(assert (= (and b!89091 (not c!14772)) b!89124))

(assert (= (and b!89096 res!45580) b!89102))

(assert (= (and b!89102 res!45588) b!89088))

(assert (= (and b!89124 c!14780) b!89119))

(assert (= (and b!89124 (not c!14780)) b!89087))

(assert (= (and b!89119 res!45579) b!89120))

(assert (= (and b!89120 res!45590) b!89126))

(assert (= (or b!89096 b!89119) bm!8612))

(assert (= (or b!89088 b!89126) bm!8606))

(assert (= (or b!89093 bm!8612) bm!8622))

(assert (= (or b!89090 b!89091) bm!8602))

(assert (= (or b!89118 b!89101) bm!8623))

(assert (= (or b!89106 b!89091) bm!8610))

(assert (= (or bm!8611 bm!8622) bm!8609))

(assert (= (or bm!8625 bm!8602) bm!8618))

(assert (= (or bm!8607 bm!8606) bm!8621))

(assert (= (or b!89127 b!89090) bm!8615))

(assert (= (or b!89117 b!89099) bm!8616))

(assert (= (or b!89117 b!89099) bm!8614))

(assert (= (and bm!8614 c!14774) b!89116))

(assert (= (and bm!8614 (not c!14774)) b!89097))

(assert (= (or bm!8605 bm!8616) bm!8608))

(assert (= (or bm!8624 b!89097) bm!8619))

(assert (= (or bm!8603 b!89099) bm!8617))

(assert (= (and bm!8617 c!14778) b!89109))

(assert (= (and bm!8617 (not c!14778)) b!89111))

(assert (= (and d!23697 res!45589) b!89105))

(assert (= (and b!89105 c!14782) b!89121))

(assert (= (and b!89105 (not c!14782)) b!89086))

(assert (= (and b!89121 res!45587) b!89108))

(assert (= (or b!89108 b!89086) bm!8604))

(assert (= (or b!89121 b!89108 b!89086) bm!8620))

(assert (=> bm!8610 m!95201))

(declare-fun m!95483 () Bool)

(assert (=> bm!8610 m!95483))

(declare-fun m!95485 () Bool)

(assert (=> bm!8608 m!95485))

(declare-fun m!95487 () Bool)

(assert (=> bm!8608 m!95487))

(declare-fun m!95489 () Bool)

(assert (=> bm!8609 m!95489))

(declare-fun m!95491 () Bool)

(assert (=> b!89094 m!95491))

(declare-fun m!95493 () Bool)

(assert (=> b!89113 m!95493))

(declare-fun m!95495 () Bool)

(assert (=> b!89108 m!95495))

(assert (=> bm!8618 m!95201))

(declare-fun m!95497 () Bool)

(assert (=> bm!8618 m!95497))

(declare-fun m!95499 () Bool)

(assert (=> b!89095 m!95499))

(declare-fun m!95501 () Bool)

(assert (=> d!23697 m!95501))

(assert (=> d!23697 m!95191))

(assert (=> b!89121 m!95201))

(declare-fun m!95503 () Bool)

(assert (=> b!89121 m!95503))

(declare-fun m!95505 () Bool)

(assert (=> b!89102 m!95505))

(declare-fun m!95507 () Bool)

(assert (=> b!89111 m!95507))

(declare-fun m!95509 () Bool)

(assert (=> b!89120 m!95509))

(assert (=> bm!8621 m!95201))

(declare-fun m!95511 () Bool)

(assert (=> bm!8621 m!95511))

(declare-fun m!95513 () Bool)

(assert (=> bm!8620 m!95513))

(assert (=> bm!8623 m!95201))

(declare-fun m!95515 () Bool)

(assert (=> bm!8623 m!95515))

(assert (=> b!89098 m!95201))

(assert (=> b!89098 m!95497))

(declare-fun m!95517 () Bool)

(assert (=> b!89092 m!95517))

(assert (=> bm!8604 m!95215))

(assert (=> bm!8615 m!95201))

(declare-fun m!95519 () Bool)

(assert (=> bm!8615 m!95519))

(assert (=> b!89099 m!95507))

(assert (=> b!89099 m!95201))

(declare-fun m!95521 () Bool)

(assert (=> b!89099 m!95521))

(assert (=> b!89099 m!95201))

(declare-fun m!95523 () Bool)

(assert (=> b!89099 m!95523))

(declare-fun m!95525 () Bool)

(assert (=> b!89099 m!95525))

(assert (=> b!89099 m!95507))

(assert (=> b!89099 m!95485))

(declare-fun m!95527 () Bool)

(assert (=> bm!8614 m!95527))

(declare-fun m!95529 () Bool)

(assert (=> bm!8614 m!95529))

(declare-fun m!95531 () Bool)

(assert (=> b!89110 m!95531))

(declare-fun m!95533 () Bool)

(assert (=> bm!8617 m!95533))

(declare-fun m!95535 () Bool)

(assert (=> bm!8619 m!95535))

(declare-fun m!95537 () Bool)

(assert (=> b!89107 m!95537))

(assert (=> b!88833 d!23697))

(declare-fun d!23699 () Bool)

(assert (=> d!23699 (= (map!1196 newMap!16) (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun bs!3749 () Bool)

(assert (= bs!3749 d!23699))

(assert (=> bs!3749 m!95507))

(assert (=> b!88822 d!23699))

(declare-fun b!89170 () Bool)

(declare-fun e!58057 () Bool)

(declare-fun call!8648 () Bool)

(assert (=> b!89170 (= e!58057 (not call!8648))))

(declare-fun b!89171 () Bool)

(declare-fun e!58067 () Bool)

(assert (=> b!89171 (= e!58057 e!58067)))

(declare-fun res!45618 () Bool)

(assert (=> b!89171 (= res!45618 call!8648)))

(assert (=> b!89171 (=> (not res!45618) (not e!58067))))

(declare-fun bm!8640 () Bool)

(declare-fun lt!42811 () ListLongMap!1469)

(assert (=> bm!8640 (= call!8648 (contains!760 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89172 () Bool)

(assert (=> b!89172 (= e!58067 (= (apply!84 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun call!8645 () ListLongMap!1469)

(declare-fun call!8644 () ListLongMap!1469)

(declare-fun c!14798 () Bool)

(declare-fun bm!8641 () Bool)

(declare-fun call!8649 () ListLongMap!1469)

(declare-fun c!14800 () Bool)

(declare-fun call!8646 () ListLongMap!1469)

(assert (=> bm!8641 (= call!8649 (+!113 (ite c!14798 call!8646 (ite c!14800 call!8644 call!8645)) (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun bm!8642 () Bool)

(declare-fun call!8643 () Bool)

(assert (=> bm!8642 (= call!8643 (contains!760 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8643 () Bool)

(declare-fun call!8647 () ListLongMap!1469)

(assert (=> bm!8643 (= call!8647 call!8649)))

(declare-fun b!89173 () Bool)

(declare-fun e!58065 () ListLongMap!1469)

(assert (=> b!89173 (= e!58065 call!8647)))

(declare-fun b!89174 () Bool)

(declare-fun e!58060 () Unit!2636)

(declare-fun Unit!2645 () Unit!2636)

(assert (=> b!89174 (= e!58060 Unit!2645)))

(declare-fun d!23701 () Bool)

(declare-fun e!58058 () Bool)

(assert (=> d!23701 e!58058))

(declare-fun res!45615 () Bool)

(assert (=> d!23701 (=> (not res!45615) (not e!58058))))

(assert (=> d!23701 (= res!45615 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun lt!42817 () ListLongMap!1469)

(assert (=> d!23701 (= lt!42811 lt!42817)))

(declare-fun lt!42799 () Unit!2636)

(assert (=> d!23701 (= lt!42799 e!58060)))

(declare-fun c!14796 () Bool)

(declare-fun e!58063 () Bool)

(assert (=> d!23701 (= c!14796 e!58063)))

(declare-fun res!45613 () Bool)

(assert (=> d!23701 (=> (not res!45613) (not e!58063))))

(assert (=> d!23701 (= res!45613 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun e!58059 () ListLongMap!1469)

(assert (=> d!23701 (= lt!42817 e!58059)))

(assert (=> d!23701 (= c!14798 (and (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23701 (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23701 (= (getCurrentListMap!443 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) lt!42811)))

(declare-fun bm!8644 () Bool)

(assert (=> bm!8644 (= call!8645 call!8644)))

(declare-fun b!89175 () Bool)

(declare-fun res!45617 () Bool)

(assert (=> b!89175 (=> (not res!45617) (not e!58058))))

(declare-fun e!58062 () Bool)

(assert (=> b!89175 (= res!45617 e!58062)))

(declare-fun c!14797 () Bool)

(assert (=> b!89175 (= c!14797 (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8645 () Bool)

(assert (=> bm!8645 (= call!8646 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89176 () Bool)

(declare-fun res!45612 () Bool)

(assert (=> b!89176 (=> (not res!45612) (not e!58058))))

(declare-fun e!58061 () Bool)

(assert (=> b!89176 (= res!45612 e!58061)))

(declare-fun res!45611 () Bool)

(assert (=> b!89176 (=> res!45611 e!58061)))

(declare-fun e!58068 () Bool)

(assert (=> b!89176 (= res!45611 (not e!58068))))

(declare-fun res!45616 () Bool)

(assert (=> b!89176 (=> (not res!45616) (not e!58068))))

(assert (=> b!89176 (= res!45616 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89177 () Bool)

(declare-fun e!58066 () Bool)

(assert (=> b!89177 (= e!58066 (= (apply!84 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89178 () Bool)

(assert (=> b!89178 (= e!58059 (+!113 call!8649 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89179 () Bool)

(declare-fun e!58069 () ListLongMap!1469)

(assert (=> b!89179 (= e!58069 call!8647)))

(declare-fun b!89180 () Bool)

(assert (=> b!89180 (= e!58063 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89181 () Bool)

(assert (=> b!89181 (= e!58062 e!58066)))

(declare-fun res!45614 () Bool)

(assert (=> b!89181 (= res!45614 call!8643)))

(assert (=> b!89181 (=> (not res!45614) (not e!58066))))

(declare-fun b!89182 () Bool)

(assert (=> b!89182 (= e!58065 call!8645)))

(declare-fun b!89183 () Bool)

(declare-fun e!58064 () Bool)

(assert (=> b!89183 (= e!58061 e!58064)))

(declare-fun res!45610 () Bool)

(assert (=> b!89183 (=> (not res!45610) (not e!58064))))

(assert (=> b!89183 (= res!45610 (contains!760 lt!42811 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89183 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89184 () Bool)

(declare-fun lt!42816 () Unit!2636)

(assert (=> b!89184 (= e!58060 lt!42816)))

(declare-fun lt!42800 () ListLongMap!1469)

(assert (=> b!89184 (= lt!42800 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42808 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42806 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42806 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42805 () Unit!2636)

(declare-fun addStillContains!60 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> b!89184 (= lt!42805 (addStillContains!60 lt!42800 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42806))))

(assert (=> b!89184 (contains!760 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42806)))

(declare-fun lt!42815 () Unit!2636)

(assert (=> b!89184 (= lt!42815 lt!42805)))

(declare-fun lt!42807 () ListLongMap!1469)

(assert (=> b!89184 (= lt!42807 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42813 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42802 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42802 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42809 () Unit!2636)

(declare-fun addApplyDifferent!60 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> b!89184 (= lt!42809 (addApplyDifferent!60 lt!42807 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42802))))

(assert (=> b!89184 (= (apply!84 (+!113 lt!42807 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42802) (apply!84 lt!42807 lt!42802))))

(declare-fun lt!42804 () Unit!2636)

(assert (=> b!89184 (= lt!42804 lt!42809)))

(declare-fun lt!42814 () ListLongMap!1469)

(assert (=> b!89184 (= lt!42814 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42803 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42810 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42810 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42820 () Unit!2636)

(assert (=> b!89184 (= lt!42820 (addApplyDifferent!60 lt!42814 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42810))))

(assert (=> b!89184 (= (apply!84 (+!113 lt!42814 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42810) (apply!84 lt!42814 lt!42810))))

(declare-fun lt!42818 () Unit!2636)

(assert (=> b!89184 (= lt!42818 lt!42820)))

(declare-fun lt!42801 () ListLongMap!1469)

(assert (=> b!89184 (= lt!42801 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun lt!42812 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42819 () (_ BitVec 64))

(assert (=> b!89184 (= lt!42819 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!89184 (= lt!42816 (addApplyDifferent!60 lt!42801 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42819))))

(assert (=> b!89184 (= (apply!84 (+!113 lt!42801 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42819) (apply!84 lt!42801 lt!42819))))

(declare-fun b!89185 () Bool)

(assert (=> b!89185 (= e!58064 (= (apply!84 lt!42811 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89185 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> b!89185 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89186 () Bool)

(assert (=> b!89186 (= e!58059 e!58069)))

(assert (=> b!89186 (= c!14800 (and (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89187 () Bool)

(declare-fun c!14799 () Bool)

(assert (=> b!89187 (= c!14799 (and (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89187 (= e!58069 e!58065)))

(declare-fun b!89188 () Bool)

(assert (=> b!89188 (= e!58068 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89189 () Bool)

(assert (=> b!89189 (= e!58058 e!58057)))

(declare-fun c!14801 () Bool)

(assert (=> b!89189 (= c!14801 (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89190 () Bool)

(assert (=> b!89190 (= e!58062 (not call!8643))))

(declare-fun bm!8646 () Bool)

(assert (=> bm!8646 (= call!8644 call!8646)))

(assert (= (and d!23701 c!14798) b!89178))

(assert (= (and d!23701 (not c!14798)) b!89186))

(assert (= (and b!89186 c!14800) b!89179))

(assert (= (and b!89186 (not c!14800)) b!89187))

(assert (= (and b!89187 c!14799) b!89173))

(assert (= (and b!89187 (not c!14799)) b!89182))

(assert (= (or b!89173 b!89182) bm!8644))

(assert (= (or b!89179 bm!8644) bm!8646))

(assert (= (or b!89179 b!89173) bm!8643))

(assert (= (or b!89178 bm!8646) bm!8645))

(assert (= (or b!89178 bm!8643) bm!8641))

(assert (= (and d!23701 res!45613) b!89180))

(assert (= (and d!23701 c!14796) b!89184))

(assert (= (and d!23701 (not c!14796)) b!89174))

(assert (= (and d!23701 res!45615) b!89176))

(assert (= (and b!89176 res!45616) b!89188))

(assert (= (and b!89176 (not res!45611)) b!89183))

(assert (= (and b!89183 res!45610) b!89185))

(assert (= (and b!89176 res!45612) b!89175))

(assert (= (and b!89175 c!14797) b!89181))

(assert (= (and b!89175 (not c!14797)) b!89190))

(assert (= (and b!89181 res!45614) b!89177))

(assert (= (or b!89181 b!89190) bm!8642))

(assert (= (and b!89175 res!45617) b!89189))

(assert (= (and b!89189 c!14801) b!89171))

(assert (= (and b!89189 (not c!14801)) b!89170))

(assert (= (and b!89171 res!45618) b!89172))

(assert (= (or b!89171 b!89170) bm!8640))

(declare-fun b_lambda!3945 () Bool)

(assert (=> (not b_lambda!3945) (not b!89185)))

(assert (=> b!89185 t!5281))

(declare-fun b_and!5367 () Bool)

(assert (= b_and!5363 (and (=> t!5281 result!2965) b_and!5367)))

(assert (=> b!89185 t!5283))

(declare-fun b_and!5369 () Bool)

(assert (= b_and!5365 (and (=> t!5283 result!2969) b_and!5369)))

(declare-fun m!95539 () Bool)

(assert (=> b!89172 m!95539))

(declare-fun m!95541 () Bool)

(assert (=> bm!8642 m!95541))

(assert (=> b!89180 m!95353))

(assert (=> b!89180 m!95353))

(assert (=> b!89180 m!95359))

(declare-fun m!95543 () Bool)

(assert (=> bm!8640 m!95543))

(assert (=> b!89185 m!95349))

(assert (=> b!89185 m!95205))

(assert (=> b!89185 m!95351))

(assert (=> b!89185 m!95349))

(assert (=> b!89185 m!95205))

(assert (=> b!89185 m!95353))

(assert (=> b!89185 m!95353))

(declare-fun m!95545 () Bool)

(assert (=> b!89185 m!95545))

(assert (=> b!89183 m!95353))

(assert (=> b!89183 m!95353))

(declare-fun m!95547 () Bool)

(assert (=> b!89183 m!95547))

(declare-fun m!95549 () Bool)

(assert (=> bm!8641 m!95549))

(assert (=> b!89188 m!95353))

(assert (=> b!89188 m!95353))

(assert (=> b!89188 m!95359))

(declare-fun m!95551 () Bool)

(assert (=> b!89178 m!95551))

(assert (=> d!23701 m!95229))

(assert (=> bm!8645 m!95243))

(declare-fun m!95553 () Bool)

(assert (=> b!89177 m!95553))

(declare-fun m!95555 () Bool)

(assert (=> b!89184 m!95555))

(declare-fun m!95557 () Bool)

(assert (=> b!89184 m!95557))

(declare-fun m!95559 () Bool)

(assert (=> b!89184 m!95559))

(declare-fun m!95561 () Bool)

(assert (=> b!89184 m!95561))

(declare-fun m!95563 () Bool)

(assert (=> b!89184 m!95563))

(declare-fun m!95565 () Bool)

(assert (=> b!89184 m!95565))

(declare-fun m!95567 () Bool)

(assert (=> b!89184 m!95567))

(assert (=> b!89184 m!95353))

(declare-fun m!95569 () Bool)

(assert (=> b!89184 m!95569))

(assert (=> b!89184 m!95569))

(declare-fun m!95571 () Bool)

(assert (=> b!89184 m!95571))

(assert (=> b!89184 m!95559))

(declare-fun m!95573 () Bool)

(assert (=> b!89184 m!95573))

(declare-fun m!95575 () Bool)

(assert (=> b!89184 m!95575))

(declare-fun m!95577 () Bool)

(assert (=> b!89184 m!95577))

(assert (=> b!89184 m!95575))

(assert (=> b!89184 m!95243))

(assert (=> b!89184 m!95557))

(declare-fun m!95579 () Bool)

(assert (=> b!89184 m!95579))

(declare-fun m!95581 () Bool)

(assert (=> b!89184 m!95581))

(declare-fun m!95583 () Bool)

(assert (=> b!89184 m!95583))

(assert (=> b!88822 d!23701))

(declare-fun b!89199 () Bool)

(declare-fun e!58076 () Bool)

(declare-fun e!58077 () Bool)

(assert (=> b!89199 (= e!58076 e!58077)))

(declare-fun c!14804 () Bool)

(assert (=> b!89199 (= c!14804 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89200 () Bool)

(declare-fun e!58078 () Bool)

(declare-fun call!8652 () Bool)

(assert (=> b!89200 (= e!58078 call!8652)))

(declare-fun bm!8649 () Bool)

(assert (=> bm!8649 (= call!8652 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89201 () Bool)

(assert (=> b!89201 (= e!58077 e!58078)))

(declare-fun lt!42827 () (_ BitVec 64))

(assert (=> b!89201 (= lt!42827 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!42828 () Unit!2636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4057 (_ BitVec 64) (_ BitVec 32)) Unit!2636)

(assert (=> b!89201 (= lt!42828 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000))))

(assert (=> b!89201 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000)))

(declare-fun lt!42829 () Unit!2636)

(assert (=> b!89201 (= lt!42829 lt!42828)))

(declare-fun res!45623 () Bool)

(assert (=> b!89201 (= res!45623 (= (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))) (Found!245 #b00000000000000000000000000000000)))))

(assert (=> b!89201 (=> (not res!45623) (not e!58078))))

(declare-fun b!89202 () Bool)

(assert (=> b!89202 (= e!58077 call!8652)))

(declare-fun d!23703 () Bool)

(declare-fun res!45624 () Bool)

(assert (=> d!23703 (=> res!45624 e!58076)))

(assert (=> d!23703 (= res!45624 (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))) e!58076)))

(assert (= (and d!23703 (not res!45624)) b!89199))

(assert (= (and b!89199 c!14804) b!89201))

(assert (= (and b!89199 (not c!14804)) b!89202))

(assert (= (and b!89201 res!45623) b!89200))

(assert (= (or b!89200 b!89202) bm!8649))

(assert (=> b!89199 m!95455))

(assert (=> b!89199 m!95455))

(assert (=> b!89199 m!95457))

(declare-fun m!95585 () Bool)

(assert (=> bm!8649 m!95585))

(assert (=> b!89201 m!95455))

(declare-fun m!95587 () Bool)

(assert (=> b!89201 m!95587))

(declare-fun m!95589 () Bool)

(assert (=> b!89201 m!95589))

(assert (=> b!89201 m!95455))

(declare-fun m!95591 () Bool)

(assert (=> b!89201 m!95591))

(assert (=> b!88827 d!23703))

(declare-fun d!23705 () Bool)

(assert (=> d!23705 (= (valid!330 thiss!992) (valid!329 (v!2674 (underlying!295 thiss!992))))))

(declare-fun bs!3750 () Bool)

(assert (= bs!3750 d!23705))

(declare-fun m!95593 () Bool)

(assert (=> bs!3750 m!95593))

(assert (=> start!10948 d!23705))

(declare-fun d!23707 () Bool)

(assert (=> d!23707 (= (array_inv!1195 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvsge (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88832 d!23707))

(declare-fun d!23709 () Bool)

(assert (=> d!23709 (= (array_inv!1196 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvsge (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88832 d!23709))

(declare-fun d!23711 () Bool)

(assert (=> d!23711 (= (array_inv!1195 (_keys!4050 newMap!16)) (bvsge (size!2177 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88818 d!23711))

(declare-fun d!23713 () Bool)

(assert (=> d!23713 (= (array_inv!1196 (_values!2355 newMap!16)) (bvsge (size!2178 (_values!2355 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88818 d!23713))

(declare-fun d!23715 () Bool)

(assert (=> d!23715 (not (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42832 () Unit!2636)

(declare-fun choose!68 (array!4057 (_ BitVec 32) (_ BitVec 64) List!1527) Unit!2636)

(assert (=> d!23715 (= lt!42832 (choose!68 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524)))))

(assert (=> d!23715 (bvslt (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23715 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524)) lt!42832)))

(declare-fun bs!3751 () Bool)

(assert (= bs!3751 d!23715))

(assert (=> bs!3751 m!95201))

(assert (=> bs!3751 m!95225))

(assert (=> bs!3751 m!95201))

(declare-fun m!95595 () Bool)

(assert (=> bs!3751 m!95595))

(assert (=> b!88823 d!23715))

(declare-fun d!23717 () Bool)

(assert (=> d!23717 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) from!355 Nil!1524)))

(declare-fun lt!42835 () Unit!2636)

(declare-fun choose!39 (array!4057 (_ BitVec 32) (_ BitVec 32)) Unit!2636)

(assert (=> d!23717 (= lt!42835 (choose!39 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23717 (bvslt (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23717 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355) lt!42835)))

(declare-fun bs!3752 () Bool)

(assert (= bs!3752 d!23717))

(assert (=> bs!3752 m!95221))

(declare-fun m!95597 () Bool)

(assert (=> bs!3752 m!95597))

(assert (=> b!88823 d!23717))

(declare-fun d!23719 () Bool)

(declare-fun res!45629 () Bool)

(declare-fun e!58083 () Bool)

(assert (=> d!23719 (=> res!45629 e!58083)))

(assert (=> d!23719 (= res!45629 (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23719 (= (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!58083)))

(declare-fun b!89207 () Bool)

(declare-fun e!58084 () Bool)

(assert (=> b!89207 (= e!58083 e!58084)))

(declare-fun res!45630 () Bool)

(assert (=> b!89207 (=> (not res!45630) (not e!58084))))

(assert (=> b!89207 (= res!45630 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89208 () Bool)

(assert (=> b!89208 (= e!58084 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23719 (not res!45629)) b!89207))

(assert (= (and b!89207 res!45630) b!89208))

(assert (=> d!23719 m!95353))

(assert (=> b!89208 m!95201))

(declare-fun m!95599 () Bool)

(assert (=> b!89208 m!95599))

(assert (=> b!88823 d!23719))

(declare-fun d!23721 () Bool)

(declare-fun e!58087 () Bool)

(assert (=> d!23721 e!58087))

(declare-fun c!14807 () Bool)

(assert (=> d!23721 (= c!14807 (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42838 () Unit!2636)

(declare-fun choose!527 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) (_ BitVec 32) Int) Unit!2636)

(assert (=> d!23721 (= lt!42838 (choose!527 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(assert (=> d!23721 (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23721 (= (lemmaListMapContainsThenArrayContainsFrom!70 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) lt!42838)))

(declare-fun b!89213 () Bool)

(assert (=> b!89213 (= e!58087 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!89214 () Bool)

(assert (=> b!89214 (= e!58087 (ite (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23721 c!14807) b!89213))

(assert (= (and d!23721 (not c!14807)) b!89214))

(assert (=> d!23721 m!95201))

(declare-fun m!95601 () Bool)

(assert (=> d!23721 m!95601))

(assert (=> d!23721 m!95229))

(assert (=> b!89213 m!95201))

(assert (=> b!89213 m!95225))

(assert (=> b!88823 d!23721))

(declare-fun b!89215 () Bool)

(declare-fun e!58091 () Bool)

(declare-fun e!58090 () Bool)

(assert (=> b!89215 (= e!58091 e!58090)))

(declare-fun c!14808 () Bool)

(assert (=> b!89215 (= c!14808 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun call!8653 () Bool)

(declare-fun bm!8650 () Bool)

(assert (=> bm!8650 (= call!8653 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14808 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524) Nil!1524)))))

(declare-fun b!89216 () Bool)

(declare-fun e!58088 () Bool)

(assert (=> b!89216 (= e!58088 e!58091)))

(declare-fun res!45631 () Bool)

(assert (=> b!89216 (=> (not res!45631) (not e!58091))))

(declare-fun e!58089 () Bool)

(assert (=> b!89216 (= res!45631 (not e!58089))))

(declare-fun res!45632 () Bool)

(assert (=> b!89216 (=> (not res!45632) (not e!58089))))

(assert (=> b!89216 (= res!45632 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun d!23723 () Bool)

(declare-fun res!45633 () Bool)

(assert (=> d!23723 (=> res!45633 e!58088)))

(assert (=> d!23723 (= res!45633 (bvsge from!355 (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23723 (= (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) from!355 Nil!1524) e!58088)))

(declare-fun b!89217 () Bool)

(assert (=> b!89217 (= e!58090 call!8653)))

(declare-fun b!89218 () Bool)

(assert (=> b!89218 (= e!58090 call!8653)))

(declare-fun b!89219 () Bool)

(assert (=> b!89219 (= e!58089 (contains!762 Nil!1524 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23723 (not res!45633)) b!89216))

(assert (= (and b!89216 res!45632) b!89219))

(assert (= (and b!89216 res!45631) b!89215))

(assert (= (and b!89215 c!14808) b!89217))

(assert (= (and b!89215 (not c!14808)) b!89218))

(assert (= (or b!89217 b!89218) bm!8650))

(assert (=> b!89215 m!95201))

(assert (=> b!89215 m!95201))

(declare-fun m!95603 () Bool)

(assert (=> b!89215 m!95603))

(assert (=> bm!8650 m!95201))

(declare-fun m!95605 () Bool)

(assert (=> bm!8650 m!95605))

(assert (=> b!89216 m!95201))

(assert (=> b!89216 m!95201))

(assert (=> b!89216 m!95603))

(assert (=> b!89219 m!95201))

(assert (=> b!89219 m!95201))

(declare-fun m!95607 () Bool)

(assert (=> b!89219 m!95607))

(assert (=> b!88823 d!23723))

(declare-fun mapNonEmpty!3459 () Bool)

(declare-fun mapRes!3459 () Bool)

(declare-fun tp!9039 () Bool)

(declare-fun e!58097 () Bool)

(assert (=> mapNonEmpty!3459 (= mapRes!3459 (and tp!9039 e!58097))))

(declare-fun mapValue!3459 () ValueCell!930)

(declare-fun mapKey!3459 () (_ BitVec 32))

(declare-fun mapRest!3459 () (Array (_ BitVec 32) ValueCell!930))

(assert (=> mapNonEmpty!3459 (= mapRest!3449 (store mapRest!3459 mapKey!3459 mapValue!3459))))

(declare-fun b!89227 () Bool)

(declare-fun e!58096 () Bool)

(assert (=> b!89227 (= e!58096 tp_is_empty!2547)))

(declare-fun mapIsEmpty!3459 () Bool)

(assert (=> mapIsEmpty!3459 mapRes!3459))

(declare-fun b!89226 () Bool)

(assert (=> b!89226 (= e!58097 tp_is_empty!2547)))

(declare-fun condMapEmpty!3459 () Bool)

(declare-fun mapDefault!3459 () ValueCell!930)

(assert (=> mapNonEmpty!3450 (= condMapEmpty!3459 (= mapRest!3449 ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3459)))))

(assert (=> mapNonEmpty!3450 (= tp!9024 (and e!58096 mapRes!3459))))

(assert (= (and mapNonEmpty!3450 condMapEmpty!3459) mapIsEmpty!3459))

(assert (= (and mapNonEmpty!3450 (not condMapEmpty!3459)) mapNonEmpty!3459))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!930) mapValue!3459)) b!89226))

(assert (= (and mapNonEmpty!3450 ((_ is ValueCellFull!930) mapDefault!3459)) b!89227))

(declare-fun m!95609 () Bool)

(assert (=> mapNonEmpty!3459 m!95609))

(declare-fun mapNonEmpty!3460 () Bool)

(declare-fun mapRes!3460 () Bool)

(declare-fun tp!9040 () Bool)

(declare-fun e!58099 () Bool)

(assert (=> mapNonEmpty!3460 (= mapRes!3460 (and tp!9040 e!58099))))

(declare-fun mapRest!3460 () (Array (_ BitVec 32) ValueCell!930))

(declare-fun mapValue!3460 () ValueCell!930)

(declare-fun mapKey!3460 () (_ BitVec 32))

(assert (=> mapNonEmpty!3460 (= mapRest!3450 (store mapRest!3460 mapKey!3460 mapValue!3460))))

(declare-fun b!89229 () Bool)

(declare-fun e!58098 () Bool)

(assert (=> b!89229 (= e!58098 tp_is_empty!2547)))

(declare-fun mapIsEmpty!3460 () Bool)

(assert (=> mapIsEmpty!3460 mapRes!3460))

(declare-fun b!89228 () Bool)

(assert (=> b!89228 (= e!58099 tp_is_empty!2547)))

(declare-fun condMapEmpty!3460 () Bool)

(declare-fun mapDefault!3460 () ValueCell!930)

(assert (=> mapNonEmpty!3449 (= condMapEmpty!3460 (= mapRest!3450 ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3460)))))

(assert (=> mapNonEmpty!3449 (= tp!9021 (and e!58098 mapRes!3460))))

(assert (= (and mapNonEmpty!3449 condMapEmpty!3460) mapIsEmpty!3460))

(assert (= (and mapNonEmpty!3449 (not condMapEmpty!3460)) mapNonEmpty!3460))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!930) mapValue!3460)) b!89228))

(assert (= (and mapNonEmpty!3449 ((_ is ValueCellFull!930) mapDefault!3460)) b!89229))

(declare-fun m!95611 () Bool)

(assert (=> mapNonEmpty!3460 m!95611))

(declare-fun b_lambda!3947 () Bool)

(assert (= b_lambda!3941 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3947)))

(declare-fun b_lambda!3949 () Bool)

(assert (= b_lambda!3943 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3949)))

(declare-fun b_lambda!3951 () Bool)

(assert (= b_lambda!3945 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3951)))

(check-sat (not b!88954) (not bm!8620) (not b!89219) (not b!89201) (not d!23717) (not b!88943) (not b!89111) (not b!88913) (not d!23681) (not b!89183) (not b!88973) (not b!88985) (not b_lambda!3947) (not bm!8619) (not bm!8621) (not bm!8641) (not d!23699) (not b_lambda!3951) (not d!23683) (not b!89108) (not bm!8645) (not b!89180) (not b!89184) (not b!88974) (not b_lambda!3939) (not b!88942) (not bm!8640) (not b!88984) b_and!5367 (not b!89107) (not b!89199) (not b!88953) (not b!88956) (not b!88952) (not bm!8618) (not d!23697) (not b!89215) (not b!89208) (not b!88977) (not bm!8550) (not bm!8553) (not b!88962) (not bm!8623) (not d!23679) (not b!88950) (not d!23705) (not b_next!2263) (not b!89185) (not b!88939) (not b!88957) (not d!23715) (not bm!8604) (not b_lambda!3949) (not bm!8610) (not b_next!2261) (not bm!8642) (not b!88958) (not bm!8609) (not b!89001) (not d!23675) (not b!89178) (not b!89098) (not b!89172) (not b!88999) (not b!88914) (not b!88960) (not b!88940) (not b!88945) (not bm!8649) (not bm!8615) (not d!23671) (not b!88947) (not b!88991) (not d!23667) (not b!89188) (not b!89213) (not mapNonEmpty!3459) (not b!89216) (not b!89099) (not bm!8614) (not d!23687) b_and!5369 (not bm!8617) (not b!89121) (not b!88992) (not d!23669) (not b!88944) (not b!88951) (not b!88986) (not d!23695) (not b!89177) (not mapNonEmpty!3460) (not bm!8650) (not bm!8608) (not b!88961) (not d!23721) (not d!23677) (not b!88959) tp_is_empty!2547 (not b!88955) (not d!23673) (not d!23701) (not b!89092) (not d!23691))
(check-sat b_and!5367 b_and!5369 (not b_next!2261) (not b_next!2263))
(get-model)

(declare-fun b!89242 () Bool)

(declare-fun e!58106 () SeekEntryResult!245)

(assert (=> b!89242 (= e!58106 Undefined!245)))

(declare-fun b!89243 () Bool)

(declare-fun e!58107 () SeekEntryResult!245)

(assert (=> b!89243 (= e!58106 e!58107)))

(declare-fun lt!42847 () (_ BitVec 64))

(declare-fun lt!42845 () SeekEntryResult!245)

(assert (=> b!89243 (= lt!42847 (select (arr!1931 (_keys!4050 newMap!16)) (index!3121 lt!42845)))))

(declare-fun c!14816 () Bool)

(assert (=> b!89243 (= c!14816 (= lt!42847 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89244 () Bool)

(declare-fun e!58108 () SeekEntryResult!245)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4057 (_ BitVec 32)) SeekEntryResult!245)

(assert (=> b!89244 (= e!58108 (seekKeyOrZeroReturnVacant!0 (x!12231 lt!42845) (index!3121 lt!42845) (index!3121 lt!42845) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun b!89245 () Bool)

(assert (=> b!89245 (= e!58108 (MissingZero!245 (index!3121 lt!42845)))))

(declare-fun b!89246 () Bool)

(declare-fun c!14817 () Bool)

(assert (=> b!89246 (= c!14817 (= lt!42847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89246 (= e!58107 e!58108)))

(declare-fun d!23725 () Bool)

(declare-fun lt!42846 () SeekEntryResult!245)

(assert (=> d!23725 (and (or ((_ is Undefined!245) lt!42846) (not ((_ is Found!245) lt!42846)) (and (bvsge (index!3120 lt!42846) #b00000000000000000000000000000000) (bvslt (index!3120 lt!42846) (size!2177 (_keys!4050 newMap!16))))) (or ((_ is Undefined!245) lt!42846) ((_ is Found!245) lt!42846) (not ((_ is MissingZero!245) lt!42846)) (and (bvsge (index!3119 lt!42846) #b00000000000000000000000000000000) (bvslt (index!3119 lt!42846) (size!2177 (_keys!4050 newMap!16))))) (or ((_ is Undefined!245) lt!42846) ((_ is Found!245) lt!42846) ((_ is MissingZero!245) lt!42846) (not ((_ is MissingVacant!245) lt!42846)) (and (bvsge (index!3122 lt!42846) #b00000000000000000000000000000000) (bvslt (index!3122 lt!42846) (size!2177 (_keys!4050 newMap!16))))) (or ((_ is Undefined!245) lt!42846) (ite ((_ is Found!245) lt!42846) (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42846)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (ite ((_ is MissingZero!245) lt!42846) (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3119 lt!42846)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!245) lt!42846) (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3122 lt!42846)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23725 (= lt!42846 e!58106)))

(declare-fun c!14815 () Bool)

(assert (=> d!23725 (= c!14815 (and ((_ is Intermediate!245) lt!42845) (undefined!1057 lt!42845)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4057 (_ BitVec 32)) SeekEntryResult!245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23725 (= lt!42845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (mask!6416 newMap!16)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(assert (=> d!23725 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23725 (= (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)) lt!42846)))

(declare-fun b!89247 () Bool)

(assert (=> b!89247 (= e!58107 (Found!245 (index!3121 lt!42845)))))

(assert (= (and d!23725 c!14815) b!89242))

(assert (= (and d!23725 (not c!14815)) b!89243))

(assert (= (and b!89243 c!14816) b!89247))

(assert (= (and b!89243 (not c!14816)) b!89246))

(assert (= (and b!89246 c!14817) b!89245))

(assert (= (and b!89246 (not c!14817)) b!89244))

(declare-fun m!95613 () Bool)

(assert (=> b!89243 m!95613))

(assert (=> b!89244 m!95201))

(declare-fun m!95615 () Bool)

(assert (=> b!89244 m!95615))

(declare-fun m!95617 () Bool)

(assert (=> d!23725 m!95617))

(assert (=> d!23725 m!95201))

(declare-fun m!95619 () Bool)

(assert (=> d!23725 m!95619))

(declare-fun m!95621 () Bool)

(assert (=> d!23725 m!95621))

(declare-fun m!95623 () Bool)

(assert (=> d!23725 m!95623))

(declare-fun m!95625 () Bool)

(assert (=> d!23725 m!95625))

(assert (=> d!23725 m!95201))

(assert (=> d!23725 m!95617))

(declare-fun m!95627 () Bool)

(assert (=> d!23725 m!95627))

(assert (=> bm!8618 d!23725))

(declare-fun b!89265 () Bool)

(declare-fun e!58120 () Bool)

(declare-fun e!58118 () Bool)

(assert (=> b!89265 (= e!58120 e!58118)))

(declare-fun c!14822 () Bool)

(declare-fun lt!42853 () SeekEntryResult!245)

(assert (=> b!89265 (= c!14822 ((_ is MissingVacant!245) lt!42853))))

(declare-fun b!89266 () Bool)

(declare-fun res!45644 () Bool)

(declare-fun e!58117 () Bool)

(assert (=> b!89266 (=> (not res!45644) (not e!58117))))

(declare-fun call!8658 () Bool)

(assert (=> b!89266 (= res!45644 call!8658)))

(assert (=> b!89266 (= e!58118 e!58117)))

(declare-fun b!89267 () Bool)

(declare-fun res!45643 () Bool)

(assert (=> b!89267 (=> (not res!45643) (not e!58117))))

(assert (=> b!89267 (= res!45643 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3122 lt!42853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89267 (and (bvsge (index!3122 lt!42853) #b00000000000000000000000000000000) (bvslt (index!3122 lt!42853) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89268 () Bool)

(declare-fun call!8659 () Bool)

(assert (=> b!89268 (= e!58117 (not call!8659))))

(declare-fun b!89269 () Bool)

(assert (=> b!89269 (= e!58118 ((_ is Undefined!245) lt!42853))))

(declare-fun b!89270 () Bool)

(assert (=> b!89270 (and (bvsge (index!3119 lt!42853) #b00000000000000000000000000000000) (bvslt (index!3119 lt!42853) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun res!45645 () Bool)

(assert (=> b!89270 (= res!45645 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3119 lt!42853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58119 () Bool)

(assert (=> b!89270 (=> (not res!45645) (not e!58119))))

(declare-fun bm!8655 () Bool)

(declare-fun c!14823 () Bool)

(assert (=> bm!8655 (= call!8658 (inRange!0 (ite c!14823 (index!3119 lt!42853) (index!3122 lt!42853)) (mask!6416 newMap!16)))))

(declare-fun b!89271 () Bool)

(assert (=> b!89271 (= e!58119 (not call!8659))))

(declare-fun bm!8656 () Bool)

(assert (=> bm!8656 (= call!8659 (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!23727 () Bool)

(assert (=> d!23727 e!58120))

(assert (=> d!23727 (= c!14823 ((_ is MissingZero!245) lt!42853))))

(assert (=> d!23727 (= lt!42853 (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun lt!42852 () Unit!2636)

(declare-fun choose!528 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) Int) Unit!2636)

(assert (=> d!23727 (= lt!42852 (choose!528 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(assert (=> d!23727 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23727 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)) lt!42852)))

(declare-fun b!89264 () Bool)

(assert (=> b!89264 (= e!58120 e!58119)))

(declare-fun res!45642 () Bool)

(assert (=> b!89264 (= res!45642 call!8658)))

(assert (=> b!89264 (=> (not res!45642) (not e!58119))))

(assert (= (and d!23727 c!14823) b!89264))

(assert (= (and d!23727 (not c!14823)) b!89265))

(assert (= (and b!89264 res!45642) b!89270))

(assert (= (and b!89270 res!45645) b!89271))

(assert (= (and b!89265 c!14822) b!89266))

(assert (= (and b!89265 (not c!14822)) b!89269))

(assert (= (and b!89266 res!45644) b!89267))

(assert (= (and b!89267 res!45643) b!89268))

(assert (= (or b!89264 b!89266) bm!8655))

(assert (= (or b!89271 b!89268) bm!8656))

(assert (=> bm!8656 m!95201))

(assert (=> bm!8656 m!95511))

(declare-fun m!95629 () Bool)

(assert (=> b!89267 m!95629))

(declare-fun m!95631 () Bool)

(assert (=> bm!8655 m!95631))

(declare-fun m!95633 () Bool)

(assert (=> b!89270 m!95633))

(assert (=> d!23727 m!95201))

(assert (=> d!23727 m!95497))

(assert (=> d!23727 m!95201))

(declare-fun m!95635 () Bool)

(assert (=> d!23727 m!95635))

(assert (=> d!23727 m!95621))

(assert (=> bm!8610 d!23727))

(declare-fun d!23729 () Bool)

(declare-fun lt!42856 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!93 (List!1526) (InoxSet tuple2!2210))

(assert (=> d!23729 (= lt!42856 (select (content!93 (toList!750 lt!42659)) lt!42541))))

(declare-fun e!58126 () Bool)

(assert (=> d!23729 (= lt!42856 e!58126)))

(declare-fun res!45650 () Bool)

(assert (=> d!23729 (=> (not res!45650) (not e!58126))))

(assert (=> d!23729 (= res!45650 ((_ is Cons!1522) (toList!750 lt!42659)))))

(assert (=> d!23729 (= (contains!761 (toList!750 lt!42659) lt!42541) lt!42856)))

(declare-fun b!89276 () Bool)

(declare-fun e!58125 () Bool)

(assert (=> b!89276 (= e!58126 e!58125)))

(declare-fun res!45651 () Bool)

(assert (=> b!89276 (=> res!45651 e!58125)))

(assert (=> b!89276 (= res!45651 (= (h!2114 (toList!750 lt!42659)) lt!42541))))

(declare-fun b!89277 () Bool)

(assert (=> b!89277 (= e!58125 (contains!761 (t!5284 (toList!750 lt!42659)) lt!42541))))

(assert (= (and d!23729 res!45650) b!89276))

(assert (= (and b!89276 (not res!45651)) b!89277))

(declare-fun m!95637 () Bool)

(assert (=> d!23729 m!95637))

(declare-fun m!95639 () Bool)

(assert (=> d!23729 m!95639))

(declare-fun m!95641 () Bool)

(assert (=> b!89277 m!95641))

(assert (=> b!88962 d!23729))

(declare-fun d!23731 () Bool)

(declare-fun isEmpty!342 (List!1526) Bool)

(assert (=> d!23731 (= (isEmpty!341 lt!42633) (isEmpty!342 (toList!750 lt!42633)))))

(declare-fun bs!3753 () Bool)

(assert (= bs!3753 d!23731))

(declare-fun m!95643 () Bool)

(assert (=> bs!3753 m!95643))

(assert (=> b!88943 d!23731))

(declare-fun b!89278 () Bool)

(declare-fun res!45652 () Bool)

(declare-fun e!58127 () Bool)

(assert (=> b!89278 (=> (not res!45652) (not e!58127))))

(declare-fun lt!42860 () ListLongMap!1469)

(assert (=> b!89278 (= res!45652 (not (contains!760 lt!42860 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89279 () Bool)

(declare-fun lt!42863 () Unit!2636)

(declare-fun lt!42861 () Unit!2636)

(assert (=> b!89279 (= lt!42863 lt!42861)))

(declare-fun lt!42857 () (_ BitVec 64))

(declare-fun lt!42858 () (_ BitVec 64))

(declare-fun lt!42859 () ListLongMap!1469)

(declare-fun lt!42862 () V!3043)

(assert (=> b!89279 (not (contains!760 (+!113 lt!42859 (tuple2!2211 lt!42858 lt!42862)) lt!42857))))

(assert (=> b!89279 (= lt!42861 (addStillNotContains!33 lt!42859 lt!42858 lt!42862 lt!42857))))

(assert (=> b!89279 (= lt!42857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!89279 (= lt!42862 (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89279 (= lt!42858 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!8660 () ListLongMap!1469)

(assert (=> b!89279 (= lt!42859 call!8660)))

(declare-fun e!58132 () ListLongMap!1469)

(assert (=> b!89279 (= e!58132 (+!113 call!8660 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!89280 () Bool)

(assert (=> b!89280 (= e!58132 call!8660)))

(declare-fun b!89281 () Bool)

(declare-fun e!58130 () Bool)

(assert (=> b!89281 (= e!58130 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89281 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!89282 () Bool)

(declare-fun e!58133 () Bool)

(assert (=> b!89282 (= e!58133 (isEmpty!341 lt!42860))))

(declare-fun b!89283 () Bool)

(declare-fun e!58129 () Bool)

(declare-fun e!58128 () Bool)

(assert (=> b!89283 (= e!58129 e!58128)))

(assert (=> b!89283 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun res!45655 () Bool)

(assert (=> b!89283 (= res!45655 (contains!760 lt!42860 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89283 (=> (not res!45655) (not e!58128))))

(declare-fun d!23733 () Bool)

(assert (=> d!23733 e!58127))

(declare-fun res!45654 () Bool)

(assert (=> d!23733 (=> (not res!45654) (not e!58127))))

(assert (=> d!23733 (= res!45654 (not (contains!760 lt!42860 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!58131 () ListLongMap!1469)

(assert (=> d!23733 (= lt!42860 e!58131)))

(declare-fun c!14825 () Bool)

(assert (=> d!23733 (= c!14825 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23733 (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23733 (= (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) lt!42860)))

(declare-fun bm!8657 () Bool)

(assert (=> bm!8657 (= call!8660 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89284 () Bool)

(assert (=> b!89284 (= e!58131 e!58132)))

(declare-fun c!14827 () Bool)

(assert (=> b!89284 (= c!14827 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!89285 () Bool)

(assert (=> b!89285 (= e!58129 e!58133)))

(declare-fun c!14824 () Bool)

(assert (=> b!89285 (= c!14824 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89286 () Bool)

(assert (=> b!89286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> b!89286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2178 (_values!2355 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> b!89286 (= e!58128 (= (apply!84 lt!42860 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!89287 () Bool)

(assert (=> b!89287 (= e!58131 (ListLongMap!1470 Nil!1523))))

(declare-fun b!89288 () Bool)

(assert (=> b!89288 (= e!58127 e!58129)))

(declare-fun c!14826 () Bool)

(assert (=> b!89288 (= c!14826 e!58130)))

(declare-fun res!45653 () Bool)

(assert (=> b!89288 (=> (not res!45653) (not e!58130))))

(assert (=> b!89288 (= res!45653 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89289 () Bool)

(assert (=> b!89289 (= e!58133 (= lt!42860 (getCurrentListMapNoExtraKeys!78 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23733 c!14825) b!89287))

(assert (= (and d!23733 (not c!14825)) b!89284))

(assert (= (and b!89284 c!14827) b!89279))

(assert (= (and b!89284 (not c!14827)) b!89280))

(assert (= (or b!89279 b!89280) bm!8657))

(assert (= (and d!23733 res!45654) b!89278))

(assert (= (and b!89278 res!45652) b!89288))

(assert (= (and b!89288 res!45653) b!89281))

(assert (= (and b!89288 c!14826) b!89283))

(assert (= (and b!89288 (not c!14826)) b!89285))

(assert (= (and b!89283 res!45655) b!89286))

(assert (= (and b!89285 c!14824) b!89289))

(assert (= (and b!89285 (not c!14824)) b!89282))

(declare-fun b_lambda!3953 () Bool)

(assert (=> (not b_lambda!3953) (not b!89279)))

(assert (=> b!89279 t!5281))

(declare-fun b_and!5371 () Bool)

(assert (= b_and!5367 (and (=> t!5281 result!2965) b_and!5371)))

(assert (=> b!89279 t!5283))

(declare-fun b_and!5373 () Bool)

(assert (= b_and!5369 (and (=> t!5283 result!2969) b_and!5373)))

(declare-fun b_lambda!3955 () Bool)

(assert (=> (not b_lambda!3955) (not b!89286)))

(assert (=> b!89286 t!5281))

(declare-fun b_and!5375 () Bool)

(assert (= b_and!5371 (and (=> t!5281 result!2965) b_and!5375)))

(assert (=> b!89286 t!5283))

(declare-fun b_and!5377 () Bool)

(assert (= b_and!5373 (and (=> t!5283 result!2969) b_and!5377)))

(declare-fun m!95645 () Bool)

(assert (=> b!89279 m!95645))

(assert (=> b!89279 m!95205))

(declare-fun m!95647 () Bool)

(assert (=> b!89279 m!95647))

(declare-fun m!95649 () Bool)

(assert (=> b!89279 m!95649))

(assert (=> b!89279 m!95205))

(declare-fun m!95651 () Bool)

(assert (=> b!89279 m!95651))

(assert (=> b!89279 m!95649))

(declare-fun m!95653 () Bool)

(assert (=> b!89279 m!95653))

(declare-fun m!95655 () Bool)

(assert (=> b!89279 m!95655))

(assert (=> b!89279 m!95647))

(declare-fun m!95657 () Bool)

(assert (=> b!89279 m!95657))

(assert (=> b!89284 m!95653))

(assert (=> b!89284 m!95653))

(declare-fun m!95659 () Bool)

(assert (=> b!89284 m!95659))

(declare-fun m!95661 () Bool)

(assert (=> d!23733 m!95661))

(assert (=> d!23733 m!95229))

(declare-fun m!95663 () Bool)

(assert (=> b!89289 m!95663))

(assert (=> bm!8657 m!95663))

(assert (=> b!89286 m!95653))

(declare-fun m!95665 () Bool)

(assert (=> b!89286 m!95665))

(assert (=> b!89286 m!95205))

(assert (=> b!89286 m!95649))

(assert (=> b!89286 m!95205))

(assert (=> b!89286 m!95651))

(assert (=> b!89286 m!95649))

(assert (=> b!89286 m!95653))

(declare-fun m!95667 () Bool)

(assert (=> b!89278 m!95667))

(declare-fun m!95669 () Bool)

(assert (=> b!89282 m!95669))

(assert (=> b!89281 m!95653))

(assert (=> b!89281 m!95653))

(assert (=> b!89281 m!95659))

(assert (=> b!89283 m!95653))

(assert (=> b!89283 m!95653))

(declare-fun m!95671 () Bool)

(assert (=> b!89283 m!95671))

(assert (=> bm!8550 d!23733))

(declare-fun b!89298 () Bool)

(declare-fun e!58138 () Option!148)

(assert (=> b!89298 (= e!58138 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42613)))))))

(declare-fun d!23735 () Bool)

(declare-fun c!14832 () Bool)

(assert (=> d!23735 (= c!14832 (and ((_ is Cons!1522) (toList!750 lt!42613)) (= (_1!1116 (h!2114 (toList!750 lt!42613))) (_1!1116 lt!42541))))))

(assert (=> d!23735 (= (getValueByKey!142 (toList!750 lt!42613) (_1!1116 lt!42541)) e!58138)))

(declare-fun b!89301 () Bool)

(declare-fun e!58139 () Option!148)

(assert (=> b!89301 (= e!58139 None!146)))

(declare-fun b!89300 () Bool)

(assert (=> b!89300 (= e!58139 (getValueByKey!142 (t!5284 (toList!750 lt!42613)) (_1!1116 lt!42541)))))

(declare-fun b!89299 () Bool)

(assert (=> b!89299 (= e!58138 e!58139)))

(declare-fun c!14833 () Bool)

(assert (=> b!89299 (= c!14833 (and ((_ is Cons!1522) (toList!750 lt!42613)) (not (= (_1!1116 (h!2114 (toList!750 lt!42613))) (_1!1116 lt!42541)))))))

(assert (= (and d!23735 c!14832) b!89298))

(assert (= (and d!23735 (not c!14832)) b!89299))

(assert (= (and b!89299 c!14833) b!89300))

(assert (= (and b!89299 (not c!14833)) b!89301))

(declare-fun m!95673 () Bool)

(assert (=> b!89300 m!95673))

(assert (=> b!88913 d!23735))

(assert (=> d!23701 d!23685))

(declare-fun d!23737 () Bool)

(assert (=> d!23737 (= (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89199 d!23737))

(declare-fun d!23739 () Bool)

(declare-fun res!45660 () Bool)

(declare-fun e!58144 () Bool)

(assert (=> d!23739 (=> res!45660 e!58144)))

(assert (=> d!23739 (= res!45660 (and ((_ is Cons!1522) (toList!750 lt!42531)) (= (_1!1116 (h!2114 (toList!750 lt!42531))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23739 (= (containsKey!146 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) e!58144)))

(declare-fun b!89306 () Bool)

(declare-fun e!58145 () Bool)

(assert (=> b!89306 (= e!58144 e!58145)))

(declare-fun res!45661 () Bool)

(assert (=> b!89306 (=> (not res!45661) (not e!58145))))

(assert (=> b!89306 (= res!45661 (and (or (not ((_ is Cons!1522) (toList!750 lt!42531))) (bvsle (_1!1116 (h!2114 (toList!750 lt!42531))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))) ((_ is Cons!1522) (toList!750 lt!42531)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42531))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(declare-fun b!89307 () Bool)

(assert (=> b!89307 (= e!58145 (containsKey!146 (t!5284 (toList!750 lt!42531)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23739 (not res!45660)) b!89306))

(assert (= (and b!89306 res!45661) b!89307))

(assert (=> b!89307 m!95201))

(declare-fun m!95675 () Bool)

(assert (=> b!89307 m!95675))

(assert (=> d!23695 d!23739))

(declare-fun d!23741 () Bool)

(declare-fun get!1211 (Option!148) V!3043)

(assert (=> d!23741 (= (apply!84 (+!113 lt!42807 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42802) (get!1211 (getValueByKey!142 (toList!750 (+!113 lt!42807 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42802)))))

(declare-fun bs!3754 () Bool)

(assert (= bs!3754 d!23741))

(declare-fun m!95677 () Bool)

(assert (=> bs!3754 m!95677))

(assert (=> bs!3754 m!95677))

(declare-fun m!95679 () Bool)

(assert (=> bs!3754 m!95679))

(assert (=> b!89184 d!23741))

(declare-fun d!23743 () Bool)

(assert (=> d!23743 (= (apply!84 (+!113 lt!42814 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42810) (apply!84 lt!42814 lt!42810))))

(declare-fun lt!42866 () Unit!2636)

(declare-fun choose!529 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> d!23743 (= lt!42866 (choose!529 lt!42814 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42810))))

(declare-fun e!58148 () Bool)

(assert (=> d!23743 e!58148))

(declare-fun res!45664 () Bool)

(assert (=> d!23743 (=> (not res!45664) (not e!58148))))

(assert (=> d!23743 (= res!45664 (contains!760 lt!42814 lt!42810))))

(assert (=> d!23743 (= (addApplyDifferent!60 lt!42814 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42810) lt!42866)))

(declare-fun b!89311 () Bool)

(assert (=> b!89311 (= e!58148 (not (= lt!42810 lt!42803)))))

(assert (= (and d!23743 res!45664) b!89311))

(assert (=> d!23743 m!95555))

(assert (=> d!23743 m!95559))

(assert (=> d!23743 m!95573))

(assert (=> d!23743 m!95559))

(declare-fun m!95681 () Bool)

(assert (=> d!23743 m!95681))

(declare-fun m!95683 () Bool)

(assert (=> d!23743 m!95683))

(assert (=> b!89184 d!23743))

(assert (=> b!89184 d!23671))

(declare-fun d!23745 () Bool)

(assert (=> d!23745 (= (apply!84 (+!113 lt!42801 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42819) (apply!84 lt!42801 lt!42819))))

(declare-fun lt!42867 () Unit!2636)

(assert (=> d!23745 (= lt!42867 (choose!529 lt!42801 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42819))))

(declare-fun e!58149 () Bool)

(assert (=> d!23745 e!58149))

(declare-fun res!45665 () Bool)

(assert (=> d!23745 (=> (not res!45665) (not e!58149))))

(assert (=> d!23745 (= res!45665 (contains!760 lt!42801 lt!42819))))

(assert (=> d!23745 (= (addApplyDifferent!60 lt!42801 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42819) lt!42867)))

(declare-fun b!89312 () Bool)

(assert (=> b!89312 (= e!58149 (not (= lt!42819 lt!42812)))))

(assert (= (and d!23745 res!45665) b!89312))

(assert (=> d!23745 m!95565))

(assert (=> d!23745 m!95557))

(assert (=> d!23745 m!95579))

(assert (=> d!23745 m!95557))

(declare-fun m!95685 () Bool)

(assert (=> d!23745 m!95685))

(declare-fun m!95687 () Bool)

(assert (=> d!23745 m!95687))

(assert (=> b!89184 d!23745))

(declare-fun d!23747 () Bool)

(assert (=> d!23747 (= (apply!84 (+!113 lt!42814 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42810) (get!1211 (getValueByKey!142 (toList!750 (+!113 lt!42814 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42810)))))

(declare-fun bs!3755 () Bool)

(assert (= bs!3755 d!23747))

(declare-fun m!95689 () Bool)

(assert (=> bs!3755 m!95689))

(assert (=> bs!3755 m!95689))

(declare-fun m!95691 () Bool)

(assert (=> bs!3755 m!95691))

(assert (=> b!89184 d!23747))

(declare-fun d!23749 () Bool)

(declare-fun e!58150 () Bool)

(assert (=> d!23749 e!58150))

(declare-fun res!45666 () Bool)

(assert (=> d!23749 (=> (not res!45666) (not e!58150))))

(declare-fun lt!42869 () ListLongMap!1469)

(assert (=> d!23749 (= res!45666 (contains!760 lt!42869 (_1!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42871 () List!1526)

(assert (=> d!23749 (= lt!42869 (ListLongMap!1470 lt!42871))))

(declare-fun lt!42870 () Unit!2636)

(declare-fun lt!42868 () Unit!2636)

(assert (=> d!23749 (= lt!42870 lt!42868)))

(assert (=> d!23749 (= (getValueByKey!142 lt!42871 (_1!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23749 (= lt!42868 (lemmaContainsTupThenGetReturnValue!59 lt!42871 (_1!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23749 (= lt!42871 (insertStrictlySorted!62 (toList!750 lt!42814) (_1!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23749 (= (+!113 lt!42814 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42869)))

(declare-fun b!89313 () Bool)

(declare-fun res!45667 () Bool)

(assert (=> b!89313 (=> (not res!45667) (not e!58150))))

(assert (=> b!89313 (= res!45667 (= (getValueByKey!142 (toList!750 lt!42869) (_1!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89314 () Bool)

(assert (=> b!89314 (= e!58150 (contains!761 (toList!750 lt!42869) (tuple2!2211 lt!42803 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23749 res!45666) b!89313))

(assert (= (and b!89313 res!45667) b!89314))

(declare-fun m!95693 () Bool)

(assert (=> d!23749 m!95693))

(declare-fun m!95695 () Bool)

(assert (=> d!23749 m!95695))

(declare-fun m!95697 () Bool)

(assert (=> d!23749 m!95697))

(declare-fun m!95699 () Bool)

(assert (=> d!23749 m!95699))

(declare-fun m!95701 () Bool)

(assert (=> b!89313 m!95701))

(declare-fun m!95703 () Bool)

(assert (=> b!89314 m!95703))

(assert (=> b!89184 d!23749))

(declare-fun d!23751 () Bool)

(assert (=> d!23751 (contains!760 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42806)))

(declare-fun lt!42874 () Unit!2636)

(declare-fun choose!530 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> d!23751 (= lt!42874 (choose!530 lt!42800 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42806))))

(assert (=> d!23751 (contains!760 lt!42800 lt!42806)))

(assert (=> d!23751 (= (addStillContains!60 lt!42800 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42806) lt!42874)))

(declare-fun bs!3756 () Bool)

(assert (= bs!3756 d!23751))

(assert (=> bs!3756 m!95569))

(assert (=> bs!3756 m!95569))

(assert (=> bs!3756 m!95571))

(declare-fun m!95705 () Bool)

(assert (=> bs!3756 m!95705))

(declare-fun m!95707 () Bool)

(assert (=> bs!3756 m!95707))

(assert (=> b!89184 d!23751))

(declare-fun d!23753 () Bool)

(declare-fun e!58152 () Bool)

(assert (=> d!23753 e!58152))

(declare-fun res!45668 () Bool)

(assert (=> d!23753 (=> res!45668 e!58152)))

(declare-fun lt!42875 () Bool)

(assert (=> d!23753 (= res!45668 (not lt!42875))))

(declare-fun lt!42878 () Bool)

(assert (=> d!23753 (= lt!42875 lt!42878)))

(declare-fun lt!42877 () Unit!2636)

(declare-fun e!58151 () Unit!2636)

(assert (=> d!23753 (= lt!42877 e!58151)))

(declare-fun c!14834 () Bool)

(assert (=> d!23753 (= c!14834 lt!42878)))

(assert (=> d!23753 (= lt!42878 (containsKey!146 (toList!750 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42806))))

(assert (=> d!23753 (= (contains!760 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42806) lt!42875)))

(declare-fun b!89316 () Bool)

(declare-fun lt!42876 () Unit!2636)

(assert (=> b!89316 (= e!58151 lt!42876)))

(assert (=> b!89316 (= lt!42876 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42806))))

(assert (=> b!89316 (isDefined!95 (getValueByKey!142 (toList!750 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42806))))

(declare-fun b!89317 () Bool)

(declare-fun Unit!2646 () Unit!2636)

(assert (=> b!89317 (= e!58151 Unit!2646)))

(declare-fun b!89318 () Bool)

(assert (=> b!89318 (= e!58152 (isDefined!95 (getValueByKey!142 (toList!750 (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42806)))))

(assert (= (and d!23753 c!14834) b!89316))

(assert (= (and d!23753 (not c!14834)) b!89317))

(assert (= (and d!23753 (not res!45668)) b!89318))

(declare-fun m!95709 () Bool)

(assert (=> d!23753 m!95709))

(declare-fun m!95711 () Bool)

(assert (=> b!89316 m!95711))

(declare-fun m!95713 () Bool)

(assert (=> b!89316 m!95713))

(assert (=> b!89316 m!95713))

(declare-fun m!95715 () Bool)

(assert (=> b!89316 m!95715))

(assert (=> b!89318 m!95713))

(assert (=> b!89318 m!95713))

(assert (=> b!89318 m!95715))

(assert (=> b!89184 d!23753))

(declare-fun d!23755 () Bool)

(assert (=> d!23755 (= (apply!84 (+!113 lt!42801 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42819) (get!1211 (getValueByKey!142 (toList!750 (+!113 lt!42801 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!42819)))))

(declare-fun bs!3757 () Bool)

(assert (= bs!3757 d!23755))

(declare-fun m!95717 () Bool)

(assert (=> bs!3757 m!95717))

(assert (=> bs!3757 m!95717))

(declare-fun m!95719 () Bool)

(assert (=> bs!3757 m!95719))

(assert (=> b!89184 d!23755))

(declare-fun d!23757 () Bool)

(declare-fun e!58153 () Bool)

(assert (=> d!23757 e!58153))

(declare-fun res!45669 () Bool)

(assert (=> d!23757 (=> (not res!45669) (not e!58153))))

(declare-fun lt!42880 () ListLongMap!1469)

(assert (=> d!23757 (= res!45669 (contains!760 lt!42880 (_1!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42882 () List!1526)

(assert (=> d!23757 (= lt!42880 (ListLongMap!1470 lt!42882))))

(declare-fun lt!42881 () Unit!2636)

(declare-fun lt!42879 () Unit!2636)

(assert (=> d!23757 (= lt!42881 lt!42879)))

(assert (=> d!23757 (= (getValueByKey!142 lt!42882 (_1!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23757 (= lt!42879 (lemmaContainsTupThenGetReturnValue!59 lt!42882 (_1!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23757 (= lt!42882 (insertStrictlySorted!62 (toList!750 lt!42801) (_1!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23757 (= (+!113 lt!42801 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42880)))

(declare-fun b!89319 () Bool)

(declare-fun res!45670 () Bool)

(assert (=> b!89319 (=> (not res!45670) (not e!58153))))

(assert (=> b!89319 (= res!45670 (= (getValueByKey!142 (toList!750 lt!42880) (_1!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89320 () Bool)

(assert (=> b!89320 (= e!58153 (contains!761 (toList!750 lt!42880) (tuple2!2211 lt!42812 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23757 res!45669) b!89319))

(assert (= (and b!89319 res!45670) b!89320))

(declare-fun m!95721 () Bool)

(assert (=> d!23757 m!95721))

(declare-fun m!95723 () Bool)

(assert (=> d!23757 m!95723))

(declare-fun m!95725 () Bool)

(assert (=> d!23757 m!95725))

(declare-fun m!95727 () Bool)

(assert (=> d!23757 m!95727))

(declare-fun m!95729 () Bool)

(assert (=> b!89319 m!95729))

(declare-fun m!95731 () Bool)

(assert (=> b!89320 m!95731))

(assert (=> b!89184 d!23757))

(declare-fun d!23759 () Bool)

(assert (=> d!23759 (= (apply!84 lt!42807 lt!42802) (get!1211 (getValueByKey!142 (toList!750 lt!42807) lt!42802)))))

(declare-fun bs!3758 () Bool)

(assert (= bs!3758 d!23759))

(declare-fun m!95733 () Bool)

(assert (=> bs!3758 m!95733))

(assert (=> bs!3758 m!95733))

(declare-fun m!95735 () Bool)

(assert (=> bs!3758 m!95735))

(assert (=> b!89184 d!23759))

(declare-fun d!23761 () Bool)

(assert (=> d!23761 (= (apply!84 (+!113 lt!42807 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42802) (apply!84 lt!42807 lt!42802))))

(declare-fun lt!42883 () Unit!2636)

(assert (=> d!23761 (= lt!42883 (choose!529 lt!42807 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42802))))

(declare-fun e!58154 () Bool)

(assert (=> d!23761 e!58154))

(declare-fun res!45671 () Bool)

(assert (=> d!23761 (=> (not res!45671) (not e!58154))))

(assert (=> d!23761 (= res!45671 (contains!760 lt!42807 lt!42802))))

(assert (=> d!23761 (= (addApplyDifferent!60 lt!42807 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))) lt!42802) lt!42883)))

(declare-fun b!89321 () Bool)

(assert (=> b!89321 (= e!58154 (not (= lt!42802 lt!42813)))))

(assert (= (and d!23761 res!45671) b!89321))

(assert (=> d!23761 m!95561))

(assert (=> d!23761 m!95575))

(assert (=> d!23761 m!95577))

(assert (=> d!23761 m!95575))

(declare-fun m!95737 () Bool)

(assert (=> d!23761 m!95737))

(declare-fun m!95739 () Bool)

(assert (=> d!23761 m!95739))

(assert (=> b!89184 d!23761))

(declare-fun d!23763 () Bool)

(assert (=> d!23763 (= (apply!84 lt!42814 lt!42810) (get!1211 (getValueByKey!142 (toList!750 lt!42814) lt!42810)))))

(declare-fun bs!3759 () Bool)

(assert (= bs!3759 d!23763))

(declare-fun m!95741 () Bool)

(assert (=> bs!3759 m!95741))

(assert (=> bs!3759 m!95741))

(declare-fun m!95743 () Bool)

(assert (=> bs!3759 m!95743))

(assert (=> b!89184 d!23763))

(declare-fun d!23765 () Bool)

(assert (=> d!23765 (= (apply!84 lt!42801 lt!42819) (get!1211 (getValueByKey!142 (toList!750 lt!42801) lt!42819)))))

(declare-fun bs!3760 () Bool)

(assert (= bs!3760 d!23765))

(declare-fun m!95745 () Bool)

(assert (=> bs!3760 m!95745))

(assert (=> bs!3760 m!95745))

(declare-fun m!95747 () Bool)

(assert (=> bs!3760 m!95747))

(assert (=> b!89184 d!23765))

(declare-fun d!23767 () Bool)

(declare-fun e!58155 () Bool)

(assert (=> d!23767 e!58155))

(declare-fun res!45672 () Bool)

(assert (=> d!23767 (=> (not res!45672) (not e!58155))))

(declare-fun lt!42885 () ListLongMap!1469)

(assert (=> d!23767 (= res!45672 (contains!760 lt!42885 (_1!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42887 () List!1526)

(assert (=> d!23767 (= lt!42885 (ListLongMap!1470 lt!42887))))

(declare-fun lt!42886 () Unit!2636)

(declare-fun lt!42884 () Unit!2636)

(assert (=> d!23767 (= lt!42886 lt!42884)))

(assert (=> d!23767 (= (getValueByKey!142 lt!42887 (_1!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23767 (= lt!42884 (lemmaContainsTupThenGetReturnValue!59 lt!42887 (_1!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23767 (= lt!42887 (insertStrictlySorted!62 (toList!750 lt!42800) (_1!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23767 (= (+!113 lt!42800 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42885)))

(declare-fun b!89322 () Bool)

(declare-fun res!45673 () Bool)

(assert (=> b!89322 (=> (not res!45673) (not e!58155))))

(assert (=> b!89322 (= res!45673 (= (getValueByKey!142 (toList!750 lt!42885) (_1!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89323 () Bool)

(assert (=> b!89323 (= e!58155 (contains!761 (toList!750 lt!42885) (tuple2!2211 lt!42808 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23767 res!45672) b!89322))

(assert (= (and b!89322 res!45673) b!89323))

(declare-fun m!95749 () Bool)

(assert (=> d!23767 m!95749))

(declare-fun m!95751 () Bool)

(assert (=> d!23767 m!95751))

(declare-fun m!95753 () Bool)

(assert (=> d!23767 m!95753))

(declare-fun m!95755 () Bool)

(assert (=> d!23767 m!95755))

(declare-fun m!95757 () Bool)

(assert (=> b!89322 m!95757))

(declare-fun m!95759 () Bool)

(assert (=> b!89323 m!95759))

(assert (=> b!89184 d!23767))

(declare-fun d!23769 () Bool)

(declare-fun e!58156 () Bool)

(assert (=> d!23769 e!58156))

(declare-fun res!45674 () Bool)

(assert (=> d!23769 (=> (not res!45674) (not e!58156))))

(declare-fun lt!42889 () ListLongMap!1469)

(assert (=> d!23769 (= res!45674 (contains!760 lt!42889 (_1!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42891 () List!1526)

(assert (=> d!23769 (= lt!42889 (ListLongMap!1470 lt!42891))))

(declare-fun lt!42890 () Unit!2636)

(declare-fun lt!42888 () Unit!2636)

(assert (=> d!23769 (= lt!42890 lt!42888)))

(assert (=> d!23769 (= (getValueByKey!142 lt!42891 (_1!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23769 (= lt!42888 (lemmaContainsTupThenGetReturnValue!59 lt!42891 (_1!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23769 (= lt!42891 (insertStrictlySorted!62 (toList!750 lt!42807) (_1!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23769 (= (+!113 lt!42807 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42889)))

(declare-fun b!89324 () Bool)

(declare-fun res!45675 () Bool)

(assert (=> b!89324 (=> (not res!45675) (not e!58156))))

(assert (=> b!89324 (= res!45675 (= (getValueByKey!142 (toList!750 lt!42889) (_1!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89325 () Bool)

(assert (=> b!89325 (= e!58156 (contains!761 (toList!750 lt!42889) (tuple2!2211 lt!42813 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23769 res!45674) b!89324))

(assert (= (and b!89324 res!45675) b!89325))

(declare-fun m!95761 () Bool)

(assert (=> d!23769 m!95761))

(declare-fun m!95763 () Bool)

(assert (=> d!23769 m!95763))

(declare-fun m!95765 () Bool)

(assert (=> d!23769 m!95765))

(declare-fun m!95767 () Bool)

(assert (=> d!23769 m!95767))

(declare-fun m!95769 () Bool)

(assert (=> b!89324 m!95769))

(declare-fun m!95771 () Bool)

(assert (=> b!89325 m!95771))

(assert (=> b!89184 d!23769))

(declare-fun d!23771 () Bool)

(assert (=> d!23771 (= (map!1196 (_2!1117 lt!42749)) (getCurrentListMap!443 (_keys!4050 (_2!1117 lt!42749)) (_values!2355 (_2!1117 lt!42749)) (mask!6416 (_2!1117 lt!42749)) (extraKeys!2205 (_2!1117 lt!42749)) (zeroValue!2261 (_2!1117 lt!42749)) (minValue!2261 (_2!1117 lt!42749)) #b00000000000000000000000000000000 (defaultEntry!2372 (_2!1117 lt!42749))))))

(declare-fun bs!3761 () Bool)

(assert (= bs!3761 d!23771))

(declare-fun m!95773 () Bool)

(assert (=> bs!3761 m!95773))

(assert (=> bm!8620 d!23771))

(declare-fun d!23773 () Bool)

(declare-fun res!45676 () Bool)

(declare-fun e!58157 () Bool)

(assert (=> d!23773 (=> res!45676 e!58157)))

(assert (=> d!23773 (= res!45676 (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23773 (= (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!58157)))

(declare-fun b!89326 () Bool)

(declare-fun e!58158 () Bool)

(assert (=> b!89326 (= e!58157 e!58158)))

(declare-fun res!45677 () Bool)

(assert (=> b!89326 (=> (not res!45677) (not e!58158))))

(assert (=> b!89326 (= res!45677 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89327 () Bool)

(assert (=> b!89327 (= e!58158 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23773 (not res!45676)) b!89326))

(assert (= (and b!89326 res!45677) b!89327))

(assert (=> d!23773 m!95653))

(assert (=> b!89327 m!95201))

(declare-fun m!95775 () Bool)

(assert (=> b!89327 m!95775))

(assert (=> b!89208 d!23773))

(declare-fun d!23775 () Bool)

(declare-fun e!58160 () Bool)

(assert (=> d!23775 e!58160))

(declare-fun res!45678 () Bool)

(assert (=> d!23775 (=> res!45678 e!58160)))

(declare-fun lt!42892 () Bool)

(assert (=> d!23775 (= res!45678 (not lt!42892))))

(declare-fun lt!42895 () Bool)

(assert (=> d!23775 (= lt!42892 lt!42895)))

(declare-fun lt!42894 () Unit!2636)

(declare-fun e!58159 () Unit!2636)

(assert (=> d!23775 (= lt!42894 e!58159)))

(declare-fun c!14835 () Bool)

(assert (=> d!23775 (= c!14835 lt!42895)))

(assert (=> d!23775 (= lt!42895 (containsKey!146 (toList!750 lt!42633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23775 (= (contains!760 lt!42633 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42892)))

(declare-fun b!89328 () Bool)

(declare-fun lt!42893 () Unit!2636)

(assert (=> b!89328 (= e!58159 lt!42893)))

(assert (=> b!89328 (= lt!42893 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89328 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89329 () Bool)

(declare-fun Unit!2647 () Unit!2636)

(assert (=> b!89329 (= e!58159 Unit!2647)))

(declare-fun b!89330 () Bool)

(assert (=> b!89330 (= e!58160 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23775 c!14835) b!89328))

(assert (= (and d!23775 (not c!14835)) b!89329))

(assert (= (and d!23775 (not res!45678)) b!89330))

(declare-fun m!95777 () Bool)

(assert (=> d!23775 m!95777))

(declare-fun m!95779 () Bool)

(assert (=> b!89328 m!95779))

(declare-fun m!95781 () Bool)

(assert (=> b!89328 m!95781))

(assert (=> b!89328 m!95781))

(declare-fun m!95783 () Bool)

(assert (=> b!89328 m!95783))

(assert (=> b!89330 m!95781))

(assert (=> b!89330 m!95781))

(assert (=> b!89330 m!95783))

(assert (=> d!23671 d!23775))

(assert (=> d!23671 d!23685))

(declare-fun b!89331 () Bool)

(declare-fun e!58161 () Bool)

(declare-fun call!8666 () Bool)

(assert (=> b!89331 (= e!58161 (not call!8666))))

(declare-fun b!89332 () Bool)

(declare-fun e!58171 () Bool)

(assert (=> b!89332 (= e!58161 e!58171)))

(declare-fun res!45687 () Bool)

(assert (=> b!89332 (= res!45687 call!8666)))

(assert (=> b!89332 (=> (not res!45687) (not e!58171))))

(declare-fun bm!8658 () Bool)

(declare-fun lt!42908 () ListLongMap!1469)

(assert (=> bm!8658 (= call!8666 (contains!760 lt!42908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89333 () Bool)

(assert (=> b!89333 (= e!58171 (= (apply!84 lt!42908 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2261 newMap!16)))))

(declare-fun bm!8659 () Bool)

(declare-fun c!14838 () Bool)

(declare-fun call!8662 () ListLongMap!1469)

(declare-fun call!8663 () ListLongMap!1469)

(declare-fun c!14840 () Bool)

(declare-fun call!8667 () ListLongMap!1469)

(declare-fun call!8664 () ListLongMap!1469)

(assert (=> bm!8659 (= call!8667 (+!113 (ite c!14838 call!8664 (ite c!14840 call!8662 call!8663)) (ite (or c!14838 c!14840) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 newMap!16)))))))

(declare-fun bm!8660 () Bool)

(declare-fun call!8661 () Bool)

(assert (=> bm!8660 (= call!8661 (contains!760 lt!42908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8661 () Bool)

(declare-fun call!8665 () ListLongMap!1469)

(assert (=> bm!8661 (= call!8665 call!8667)))

(declare-fun b!89334 () Bool)

(declare-fun e!58169 () ListLongMap!1469)

(assert (=> b!89334 (= e!58169 call!8665)))

(declare-fun b!89335 () Bool)

(declare-fun e!58164 () Unit!2636)

(declare-fun Unit!2648 () Unit!2636)

(assert (=> b!89335 (= e!58164 Unit!2648)))

(declare-fun d!23777 () Bool)

(declare-fun e!58162 () Bool)

(assert (=> d!23777 e!58162))

(declare-fun res!45684 () Bool)

(assert (=> d!23777 (=> (not res!45684) (not e!58162))))

(assert (=> d!23777 (= res!45684 (or (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))))

(declare-fun lt!42914 () ListLongMap!1469)

(assert (=> d!23777 (= lt!42908 lt!42914)))

(declare-fun lt!42896 () Unit!2636)

(assert (=> d!23777 (= lt!42896 e!58164)))

(declare-fun c!14836 () Bool)

(declare-fun e!58167 () Bool)

(assert (=> d!23777 (= c!14836 e!58167)))

(declare-fun res!45682 () Bool)

(assert (=> d!23777 (=> (not res!45682) (not e!58167))))

(assert (=> d!23777 (= res!45682 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun e!58163 () ListLongMap!1469)

(assert (=> d!23777 (= lt!42914 e!58163)))

(assert (=> d!23777 (= c!14838 (and (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23777 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23777 (= (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) lt!42908)))

(declare-fun bm!8662 () Bool)

(assert (=> bm!8662 (= call!8663 call!8662)))

(declare-fun b!89336 () Bool)

(declare-fun res!45686 () Bool)

(assert (=> b!89336 (=> (not res!45686) (not e!58162))))

(declare-fun e!58166 () Bool)

(assert (=> b!89336 (= res!45686 e!58166)))

(declare-fun c!14837 () Bool)

(assert (=> b!89336 (= c!14837 (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8663 () Bool)

(assert (=> bm!8663 (= call!8664 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun b!89337 () Bool)

(declare-fun res!45681 () Bool)

(assert (=> b!89337 (=> (not res!45681) (not e!58162))))

(declare-fun e!58165 () Bool)

(assert (=> b!89337 (= res!45681 e!58165)))

(declare-fun res!45680 () Bool)

(assert (=> b!89337 (=> res!45680 e!58165)))

(declare-fun e!58172 () Bool)

(assert (=> b!89337 (= res!45680 (not e!58172))))

(declare-fun res!45685 () Bool)

(assert (=> b!89337 (=> (not res!45685) (not e!58172))))

(assert (=> b!89337 (= res!45685 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89338 () Bool)

(declare-fun e!58170 () Bool)

(assert (=> b!89338 (= e!58170 (= (apply!84 lt!42908 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2261 newMap!16)))))

(declare-fun b!89339 () Bool)

(assert (=> b!89339 (= e!58163 (+!113 call!8667 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 newMap!16))))))

(declare-fun b!89340 () Bool)

(declare-fun e!58173 () ListLongMap!1469)

(assert (=> b!89340 (= e!58173 call!8665)))

(declare-fun b!89341 () Bool)

(assert (=> b!89341 (= e!58167 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89342 () Bool)

(assert (=> b!89342 (= e!58166 e!58170)))

(declare-fun res!45683 () Bool)

(assert (=> b!89342 (= res!45683 call!8661)))

(assert (=> b!89342 (=> (not res!45683) (not e!58170))))

(declare-fun b!89343 () Bool)

(assert (=> b!89343 (= e!58169 call!8663)))

(declare-fun b!89344 () Bool)

(declare-fun e!58168 () Bool)

(assert (=> b!89344 (= e!58165 e!58168)))

(declare-fun res!45679 () Bool)

(assert (=> b!89344 (=> (not res!45679) (not e!58168))))

(assert (=> b!89344 (= res!45679 (contains!760 lt!42908 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89345 () Bool)

(declare-fun lt!42913 () Unit!2636)

(assert (=> b!89345 (= e!58164 lt!42913)))

(declare-fun lt!42897 () ListLongMap!1469)

(assert (=> b!89345 (= lt!42897 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42905 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42903 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42903 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42902 () Unit!2636)

(assert (=> b!89345 (= lt!42902 (addStillContains!60 lt!42897 lt!42905 (zeroValue!2261 newMap!16) lt!42903))))

(assert (=> b!89345 (contains!760 (+!113 lt!42897 (tuple2!2211 lt!42905 (zeroValue!2261 newMap!16))) lt!42903)))

(declare-fun lt!42912 () Unit!2636)

(assert (=> b!89345 (= lt!42912 lt!42902)))

(declare-fun lt!42904 () ListLongMap!1469)

(assert (=> b!89345 (= lt!42904 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42910 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42910 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42899 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42899 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42906 () Unit!2636)

(assert (=> b!89345 (= lt!42906 (addApplyDifferent!60 lt!42904 lt!42910 (minValue!2261 newMap!16) lt!42899))))

(assert (=> b!89345 (= (apply!84 (+!113 lt!42904 (tuple2!2211 lt!42910 (minValue!2261 newMap!16))) lt!42899) (apply!84 lt!42904 lt!42899))))

(declare-fun lt!42901 () Unit!2636)

(assert (=> b!89345 (= lt!42901 lt!42906)))

(declare-fun lt!42911 () ListLongMap!1469)

(assert (=> b!89345 (= lt!42911 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42900 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42900 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42907 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42907 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42917 () Unit!2636)

(assert (=> b!89345 (= lt!42917 (addApplyDifferent!60 lt!42911 lt!42900 (zeroValue!2261 newMap!16) lt!42907))))

(assert (=> b!89345 (= (apply!84 (+!113 lt!42911 (tuple2!2211 lt!42900 (zeroValue!2261 newMap!16))) lt!42907) (apply!84 lt!42911 lt!42907))))

(declare-fun lt!42915 () Unit!2636)

(assert (=> b!89345 (= lt!42915 lt!42917)))

(declare-fun lt!42898 () ListLongMap!1469)

(assert (=> b!89345 (= lt!42898 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42909 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42916 () (_ BitVec 64))

(assert (=> b!89345 (= lt!42916 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89345 (= lt!42913 (addApplyDifferent!60 lt!42898 lt!42909 (minValue!2261 newMap!16) lt!42916))))

(assert (=> b!89345 (= (apply!84 (+!113 lt!42898 (tuple2!2211 lt!42909 (minValue!2261 newMap!16))) lt!42916) (apply!84 lt!42898 lt!42916))))

(declare-fun b!89346 () Bool)

(assert (=> b!89346 (= e!58168 (= (apply!84 lt!42908 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)) (get!1208 (select (arr!1932 (_values!2355 newMap!16)) #b00000000000000000000000000000000) (dynLambda!344 (defaultEntry!2372 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89346 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2178 (_values!2355 newMap!16))))))

(assert (=> b!89346 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89347 () Bool)

(assert (=> b!89347 (= e!58163 e!58173)))

(assert (=> b!89347 (= c!14840 (and (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89348 () Bool)

(declare-fun c!14839 () Bool)

(assert (=> b!89348 (= c!14839 (and (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89348 (= e!58173 e!58169)))

(declare-fun b!89349 () Bool)

(assert (=> b!89349 (= e!58172 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89350 () Bool)

(assert (=> b!89350 (= e!58162 e!58161)))

(declare-fun c!14841 () Bool)

(assert (=> b!89350 (= c!14841 (not (= (bvand (extraKeys!2205 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89351 () Bool)

(assert (=> b!89351 (= e!58166 (not call!8661))))

(declare-fun bm!8664 () Bool)

(assert (=> bm!8664 (= call!8662 call!8664)))

(assert (= (and d!23777 c!14838) b!89339))

(assert (= (and d!23777 (not c!14838)) b!89347))

(assert (= (and b!89347 c!14840) b!89340))

(assert (= (and b!89347 (not c!14840)) b!89348))

(assert (= (and b!89348 c!14839) b!89334))

(assert (= (and b!89348 (not c!14839)) b!89343))

(assert (= (or b!89334 b!89343) bm!8662))

(assert (= (or b!89340 bm!8662) bm!8664))

(assert (= (or b!89340 b!89334) bm!8661))

(assert (= (or b!89339 bm!8664) bm!8663))

(assert (= (or b!89339 bm!8661) bm!8659))

(assert (= (and d!23777 res!45682) b!89341))

(assert (= (and d!23777 c!14836) b!89345))

(assert (= (and d!23777 (not c!14836)) b!89335))

(assert (= (and d!23777 res!45684) b!89337))

(assert (= (and b!89337 res!45685) b!89349))

(assert (= (and b!89337 (not res!45680)) b!89344))

(assert (= (and b!89344 res!45679) b!89346))

(assert (= (and b!89337 res!45681) b!89336))

(assert (= (and b!89336 c!14837) b!89342))

(assert (= (and b!89336 (not c!14837)) b!89351))

(assert (= (and b!89342 res!45683) b!89338))

(assert (= (or b!89342 b!89351) bm!8660))

(assert (= (and b!89336 res!45686) b!89350))

(assert (= (and b!89350 c!14841) b!89332))

(assert (= (and b!89350 (not c!14841)) b!89331))

(assert (= (and b!89332 res!45687) b!89333))

(assert (= (or b!89332 b!89331) bm!8658))

(declare-fun b_lambda!3957 () Bool)

(assert (=> (not b_lambda!3957) (not b!89346)))

(declare-fun tb!1733 () Bool)

(declare-fun t!5293 () Bool)

(assert (=> (and b!88832 (= (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) (defaultEntry!2372 newMap!16)) t!5293) tb!1733))

(declare-fun result!2979 () Bool)

(assert (=> tb!1733 (= result!2979 tp_is_empty!2547)))

(assert (=> b!89346 t!5293))

(declare-fun b_and!5379 () Bool)

(assert (= b_and!5375 (and (=> t!5293 result!2979) b_and!5379)))

(declare-fun t!5295 () Bool)

(declare-fun tb!1735 () Bool)

(assert (=> (and b!88818 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 newMap!16)) t!5295) tb!1735))

(declare-fun result!2981 () Bool)

(assert (= result!2981 result!2979))

(assert (=> b!89346 t!5295))

(declare-fun b_and!5381 () Bool)

(assert (= b_and!5377 (and (=> t!5295 result!2981) b_and!5381)))

(declare-fun m!95785 () Bool)

(assert (=> b!89333 m!95785))

(declare-fun m!95787 () Bool)

(assert (=> bm!8660 m!95787))

(declare-fun m!95789 () Bool)

(assert (=> b!89341 m!95789))

(assert (=> b!89341 m!95789))

(declare-fun m!95791 () Bool)

(assert (=> b!89341 m!95791))

(declare-fun m!95793 () Bool)

(assert (=> bm!8658 m!95793))

(declare-fun m!95795 () Bool)

(assert (=> b!89346 m!95795))

(declare-fun m!95797 () Bool)

(assert (=> b!89346 m!95797))

(declare-fun m!95799 () Bool)

(assert (=> b!89346 m!95799))

(assert (=> b!89346 m!95795))

(assert (=> b!89346 m!95797))

(assert (=> b!89346 m!95789))

(assert (=> b!89346 m!95789))

(declare-fun m!95801 () Bool)

(assert (=> b!89346 m!95801))

(assert (=> b!89344 m!95789))

(assert (=> b!89344 m!95789))

(declare-fun m!95803 () Bool)

(assert (=> b!89344 m!95803))

(declare-fun m!95805 () Bool)

(assert (=> bm!8659 m!95805))

(assert (=> b!89349 m!95789))

(assert (=> b!89349 m!95789))

(assert (=> b!89349 m!95791))

(declare-fun m!95807 () Bool)

(assert (=> b!89339 m!95807))

(assert (=> d!23777 m!95621))

(declare-fun m!95809 () Bool)

(assert (=> bm!8663 m!95809))

(declare-fun m!95811 () Bool)

(assert (=> b!89338 m!95811))

(declare-fun m!95813 () Bool)

(assert (=> b!89345 m!95813))

(declare-fun m!95815 () Bool)

(assert (=> b!89345 m!95815))

(declare-fun m!95817 () Bool)

(assert (=> b!89345 m!95817))

(declare-fun m!95819 () Bool)

(assert (=> b!89345 m!95819))

(declare-fun m!95821 () Bool)

(assert (=> b!89345 m!95821))

(declare-fun m!95823 () Bool)

(assert (=> b!89345 m!95823))

(declare-fun m!95825 () Bool)

(assert (=> b!89345 m!95825))

(assert (=> b!89345 m!95789))

(declare-fun m!95827 () Bool)

(assert (=> b!89345 m!95827))

(assert (=> b!89345 m!95827))

(declare-fun m!95829 () Bool)

(assert (=> b!89345 m!95829))

(assert (=> b!89345 m!95817))

(declare-fun m!95831 () Bool)

(assert (=> b!89345 m!95831))

(declare-fun m!95833 () Bool)

(assert (=> b!89345 m!95833))

(declare-fun m!95835 () Bool)

(assert (=> b!89345 m!95835))

(assert (=> b!89345 m!95833))

(assert (=> b!89345 m!95809))

(assert (=> b!89345 m!95815))

(declare-fun m!95837 () Bool)

(assert (=> b!89345 m!95837))

(declare-fun m!95839 () Bool)

(assert (=> b!89345 m!95839))

(declare-fun m!95841 () Bool)

(assert (=> b!89345 m!95841))

(assert (=> d!23699 d!23777))

(declare-fun d!23779 () Bool)

(declare-fun e!58174 () Bool)

(assert (=> d!23779 e!58174))

(declare-fun res!45688 () Bool)

(assert (=> d!23779 (=> (not res!45688) (not e!58174))))

(declare-fun lt!42919 () ListLongMap!1469)

(assert (=> d!23779 (= res!45688 (contains!760 lt!42919 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun lt!42921 () List!1526)

(assert (=> d!23779 (= lt!42919 (ListLongMap!1470 lt!42921))))

(declare-fun lt!42920 () Unit!2636)

(declare-fun lt!42918 () Unit!2636)

(assert (=> d!23779 (= lt!42920 lt!42918)))

(assert (=> d!23779 (= (getValueByKey!142 lt!42921 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23779 (= lt!42918 (lemmaContainsTupThenGetReturnValue!59 lt!42921 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23779 (= lt!42921 (insertStrictlySorted!62 (toList!750 call!8618) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23779 (= (+!113 call!8618 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) lt!42919)))

(declare-fun b!89352 () Bool)

(declare-fun res!45689 () Bool)

(assert (=> b!89352 (=> (not res!45689) (not e!58174))))

(assert (=> b!89352 (= res!45689 (= (getValueByKey!142 (toList!750 lt!42919) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun b!89353 () Bool)

(assert (=> b!89353 (= e!58174 (contains!761 (toList!750 lt!42919) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (= (and d!23779 res!45688) b!89352))

(assert (= (and b!89352 res!45689) b!89353))

(declare-fun m!95843 () Bool)

(assert (=> d!23779 m!95843))

(declare-fun m!95845 () Bool)

(assert (=> d!23779 m!95845))

(declare-fun m!95847 () Bool)

(assert (=> d!23779 m!95847))

(declare-fun m!95849 () Bool)

(assert (=> d!23779 m!95849))

(declare-fun m!95851 () Bool)

(assert (=> b!89352 m!95851))

(declare-fun m!95853 () Bool)

(assert (=> b!89353 m!95853))

(assert (=> b!89108 d!23779))

(declare-fun d!23781 () Bool)

(declare-fun lt!42922 () Bool)

(assert (=> d!23781 (= lt!42922 (select (content!93 (toList!750 lt!42638)) lt!42540))))

(declare-fun e!58176 () Bool)

(assert (=> d!23781 (= lt!42922 e!58176)))

(declare-fun res!45690 () Bool)

(assert (=> d!23781 (=> (not res!45690) (not e!58176))))

(assert (=> d!23781 (= res!45690 ((_ is Cons!1522) (toList!750 lt!42638)))))

(assert (=> d!23781 (= (contains!761 (toList!750 lt!42638) lt!42540) lt!42922)))

(declare-fun b!89354 () Bool)

(declare-fun e!58175 () Bool)

(assert (=> b!89354 (= e!58176 e!58175)))

(declare-fun res!45691 () Bool)

(assert (=> b!89354 (=> res!45691 e!58175)))

(assert (=> b!89354 (= res!45691 (= (h!2114 (toList!750 lt!42638)) lt!42540))))

(declare-fun b!89355 () Bool)

(assert (=> b!89355 (= e!58175 (contains!761 (t!5284 (toList!750 lt!42638)) lt!42540))))

(assert (= (and d!23781 res!45690) b!89354))

(assert (= (and b!89354 (not res!45691)) b!89355))

(declare-fun m!95855 () Bool)

(assert (=> d!23781 m!95855))

(declare-fun m!95857 () Bool)

(assert (=> d!23781 m!95857))

(declare-fun m!95859 () Bool)

(assert (=> b!89355 m!95859))

(assert (=> b!88952 d!23781))

(assert (=> b!89098 d!23725))

(declare-fun d!23783 () Bool)

(assert (=> d!23783 (= (get!1210 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88992 d!23783))

(assert (=> b!88973 d!23737))

(assert (=> d!23715 d!23719))

(declare-fun d!23785 () Bool)

(assert (=> d!23785 (not (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23785 true))

(declare-fun _$68!79 () Unit!2636)

(assert (=> d!23785 (= (choose!68 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524)) _$68!79)))

(declare-fun bs!3762 () Bool)

(assert (= bs!3762 d!23785))

(assert (=> bs!3762 m!95201))

(assert (=> bs!3762 m!95225))

(assert (=> d!23715 d!23785))

(declare-fun d!23787 () Bool)

(declare-fun e!58178 () Bool)

(assert (=> d!23787 e!58178))

(declare-fun res!45692 () Bool)

(assert (=> d!23787 (=> res!45692 e!58178)))

(declare-fun lt!42923 () Bool)

(assert (=> d!23787 (= res!45692 (not lt!42923))))

(declare-fun lt!42926 () Bool)

(assert (=> d!23787 (= lt!42923 lt!42926)))

(declare-fun lt!42925 () Unit!2636)

(declare-fun e!58177 () Unit!2636)

(assert (=> d!23787 (= lt!42925 e!58177)))

(declare-fun c!14842 () Bool)

(assert (=> d!23787 (= c!14842 lt!42926)))

(assert (=> d!23787 (= lt!42926 (containsKey!146 (toList!750 lt!42633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23787 (= (contains!760 lt!42633 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42923)))

(declare-fun b!89356 () Bool)

(declare-fun lt!42924 () Unit!2636)

(assert (=> b!89356 (= e!58177 lt!42924)))

(assert (=> b!89356 (= lt!42924 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89356 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89357 () Bool)

(declare-fun Unit!2649 () Unit!2636)

(assert (=> b!89357 (= e!58177 Unit!2649)))

(declare-fun b!89358 () Bool)

(assert (=> b!89358 (= e!58178 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23787 c!14842) b!89356))

(assert (= (and d!23787 (not c!14842)) b!89357))

(assert (= (and d!23787 (not res!45692)) b!89358))

(declare-fun m!95861 () Bool)

(assert (=> d!23787 m!95861))

(declare-fun m!95863 () Bool)

(assert (=> b!89356 m!95863))

(declare-fun m!95865 () Bool)

(assert (=> b!89356 m!95865))

(assert (=> b!89356 m!95865))

(declare-fun m!95867 () Bool)

(assert (=> b!89356 m!95867))

(assert (=> b!89358 m!95865))

(assert (=> b!89358 m!95865))

(assert (=> b!89358 m!95867))

(assert (=> b!88939 d!23787))

(assert (=> b!88974 d!23737))

(declare-fun d!23789 () Bool)

(declare-fun e!58179 () Bool)

(assert (=> d!23789 e!58179))

(declare-fun res!45693 () Bool)

(assert (=> d!23789 (=> (not res!45693) (not e!58179))))

(declare-fun lt!42928 () ListLongMap!1469)

(assert (=> d!23789 (= res!45693 (contains!760 lt!42928 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42930 () List!1526)

(assert (=> d!23789 (= lt!42928 (ListLongMap!1470 lt!42930))))

(declare-fun lt!42929 () Unit!2636)

(declare-fun lt!42927 () Unit!2636)

(assert (=> d!23789 (= lt!42929 lt!42927)))

(assert (=> d!23789 (= (getValueByKey!142 lt!42930 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23789 (= lt!42927 (lemmaContainsTupThenGetReturnValue!59 lt!42930 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23789 (= lt!42930 (insertStrictlySorted!62 (toList!750 call!8649) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23789 (= (+!113 call!8649 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42928)))

(declare-fun b!89359 () Bool)

(declare-fun res!45694 () Bool)

(assert (=> b!89359 (=> (not res!45694) (not e!58179))))

(assert (=> b!89359 (= res!45694 (= (getValueByKey!142 (toList!750 lt!42928) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89360 () Bool)

(assert (=> b!89360 (= e!58179 (contains!761 (toList!750 lt!42928) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23789 res!45693) b!89359))

(assert (= (and b!89359 res!45694) b!89360))

(declare-fun m!95869 () Bool)

(assert (=> d!23789 m!95869))

(declare-fun m!95871 () Bool)

(assert (=> d!23789 m!95871))

(declare-fun m!95873 () Bool)

(assert (=> d!23789 m!95873))

(declare-fun m!95875 () Bool)

(assert (=> d!23789 m!95875))

(declare-fun m!95877 () Bool)

(assert (=> b!89359 m!95877))

(declare-fun m!95879 () Bool)

(assert (=> b!89360 m!95879))

(assert (=> b!89178 d!23789))

(assert (=> b!89111 d!23777))

(declare-fun b!89361 () Bool)

(declare-fun e!58180 () Bool)

(declare-fun call!8673 () Bool)

(assert (=> b!89361 (= e!58180 (not call!8673))))

(declare-fun b!89362 () Bool)

(declare-fun e!58190 () Bool)

(assert (=> b!89362 (= e!58180 e!58190)))

(declare-fun res!45703 () Bool)

(assert (=> b!89362 (= res!45703 call!8673)))

(assert (=> b!89362 (=> (not res!45703) (not e!58190))))

(declare-fun bm!8665 () Bool)

(declare-fun lt!42943 () ListLongMap!1469)

(assert (=> bm!8665 (= call!8673 (contains!760 lt!42943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89363 () Bool)

(assert (=> b!89363 (= e!58190 (= (apply!84 lt!42943 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16))))))

(declare-fun call!8671 () ListLongMap!1469)

(declare-fun bm!8666 () Bool)

(declare-fun c!14845 () Bool)

(declare-fun call!8669 () ListLongMap!1469)

(declare-fun call!8670 () ListLongMap!1469)

(declare-fun call!8674 () ListLongMap!1469)

(declare-fun c!14847 () Bool)

(assert (=> bm!8666 (= call!8674 (+!113 (ite c!14845 call!8671 (ite c!14847 call!8669 call!8670)) (ite (or c!14845 c!14847) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16))))))))

(declare-fun bm!8667 () Bool)

(declare-fun call!8668 () Bool)

(assert (=> bm!8667 (= call!8668 (contains!760 lt!42943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8668 () Bool)

(declare-fun call!8672 () ListLongMap!1469)

(assert (=> bm!8668 (= call!8672 call!8674)))

(declare-fun b!89364 () Bool)

(declare-fun e!58188 () ListLongMap!1469)

(assert (=> b!89364 (= e!58188 call!8672)))

(declare-fun b!89365 () Bool)

(declare-fun e!58183 () Unit!2636)

(declare-fun Unit!2650 () Unit!2636)

(assert (=> b!89365 (= e!58183 Unit!2650)))

(declare-fun d!23791 () Bool)

(declare-fun e!58181 () Bool)

(assert (=> d!23791 e!58181))

(declare-fun res!45700 () Bool)

(assert (=> d!23791 (=> (not res!45700) (not e!58181))))

(assert (=> d!23791 (= res!45700 (or (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))))

(declare-fun lt!42949 () ListLongMap!1469)

(assert (=> d!23791 (= lt!42943 lt!42949)))

(declare-fun lt!42931 () Unit!2636)

(assert (=> d!23791 (= lt!42931 e!58183)))

(declare-fun c!14843 () Bool)

(declare-fun e!58186 () Bool)

(assert (=> d!23791 (= c!14843 e!58186)))

(declare-fun res!45698 () Bool)

(assert (=> d!23791 (=> (not res!45698) (not e!58186))))

(assert (=> d!23791 (= res!45698 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun e!58182 () ListLongMap!1469)

(assert (=> d!23791 (= lt!42949 e!58182)))

(assert (=> d!23791 (= c!14845 (and (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23791 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23791 (= (getCurrentListMap!443 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) lt!42943)))

(declare-fun bm!8669 () Bool)

(assert (=> bm!8669 (= call!8670 call!8669)))

(declare-fun b!89366 () Bool)

(declare-fun res!45702 () Bool)

(assert (=> b!89366 (=> (not res!45702) (not e!58181))))

(declare-fun e!58185 () Bool)

(assert (=> b!89366 (= res!45702 e!58185)))

(declare-fun c!14844 () Bool)

(assert (=> b!89366 (= c!14844 (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8670 () Bool)

(assert (=> bm!8670 (= call!8671 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun b!89367 () Bool)

(declare-fun res!45697 () Bool)

(assert (=> b!89367 (=> (not res!45697) (not e!58181))))

(declare-fun e!58184 () Bool)

(assert (=> b!89367 (= res!45697 e!58184)))

(declare-fun res!45696 () Bool)

(assert (=> b!89367 (=> res!45696 e!58184)))

(declare-fun e!58191 () Bool)

(assert (=> b!89367 (= res!45696 (not e!58191))))

(declare-fun res!45701 () Bool)

(assert (=> b!89367 (=> (not res!45701) (not e!58191))))

(assert (=> b!89367 (= res!45701 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89368 () Bool)

(declare-fun e!58189 () Bool)

(assert (=> b!89368 (= e!58189 (= (apply!84 lt!42943 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2261 newMap!16)))))

(declare-fun b!89369 () Bool)

(assert (=> b!89369 (= e!58182 (+!113 call!8674 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)))))))

(declare-fun b!89370 () Bool)

(declare-fun e!58192 () ListLongMap!1469)

(assert (=> b!89370 (= e!58192 call!8672)))

(declare-fun b!89371 () Bool)

(assert (=> b!89371 (= e!58186 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89372 () Bool)

(assert (=> b!89372 (= e!58185 e!58189)))

(declare-fun res!45699 () Bool)

(assert (=> b!89372 (= res!45699 call!8668)))

(assert (=> b!89372 (=> (not res!45699) (not e!58189))))

(declare-fun b!89373 () Bool)

(assert (=> b!89373 (= e!58188 call!8670)))

(declare-fun b!89374 () Bool)

(declare-fun e!58187 () Bool)

(assert (=> b!89374 (= e!58184 e!58187)))

(declare-fun res!45695 () Bool)

(assert (=> b!89374 (=> (not res!45695) (not e!58187))))

(assert (=> b!89374 (= res!45695 (contains!760 lt!42943 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89375 () Bool)

(declare-fun lt!42948 () Unit!2636)

(assert (=> b!89375 (= e!58183 lt!42948)))

(declare-fun lt!42932 () ListLongMap!1469)

(assert (=> b!89375 (= lt!42932 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42940 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42938 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42938 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42937 () Unit!2636)

(assert (=> b!89375 (= lt!42937 (addStillContains!60 lt!42932 lt!42940 (zeroValue!2261 newMap!16) lt!42938))))

(assert (=> b!89375 (contains!760 (+!113 lt!42932 (tuple2!2211 lt!42940 (zeroValue!2261 newMap!16))) lt!42938)))

(declare-fun lt!42947 () Unit!2636)

(assert (=> b!89375 (= lt!42947 lt!42937)))

(declare-fun lt!42939 () ListLongMap!1469)

(assert (=> b!89375 (= lt!42939 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42945 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42945 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42934 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42934 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42941 () Unit!2636)

(assert (=> b!89375 (= lt!42941 (addApplyDifferent!60 lt!42939 lt!42945 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) lt!42934))))

(assert (=> b!89375 (= (apply!84 (+!113 lt!42939 (tuple2!2211 lt!42945 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)))) lt!42934) (apply!84 lt!42939 lt!42934))))

(declare-fun lt!42936 () Unit!2636)

(assert (=> b!89375 (= lt!42936 lt!42941)))

(declare-fun lt!42946 () ListLongMap!1469)

(assert (=> b!89375 (= lt!42946 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42935 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42942 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42942 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42952 () Unit!2636)

(assert (=> b!89375 (= lt!42952 (addApplyDifferent!60 lt!42946 lt!42935 (zeroValue!2261 newMap!16) lt!42942))))

(assert (=> b!89375 (= (apply!84 (+!113 lt!42946 (tuple2!2211 lt!42935 (zeroValue!2261 newMap!16))) lt!42942) (apply!84 lt!42946 lt!42942))))

(declare-fun lt!42950 () Unit!2636)

(assert (=> b!89375 (= lt!42950 lt!42952)))

(declare-fun lt!42933 () ListLongMap!1469)

(assert (=> b!89375 (= lt!42933 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))) (mask!6416 newMap!16) (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) (zeroValue!2261 newMap!16) (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!42944 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42944 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42951 () (_ BitVec 64))

(assert (=> b!89375 (= lt!42951 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89375 (= lt!42948 (addApplyDifferent!60 lt!42933 lt!42944 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)) lt!42951))))

(assert (=> b!89375 (= (apply!84 (+!113 lt!42933 (tuple2!2211 lt!42944 (ite c!14779 (ite c!14770 (minValue!2261 newMap!16) lt!42545) (minValue!2261 newMap!16)))) lt!42951) (apply!84 lt!42933 lt!42951))))

(declare-fun b!89376 () Bool)

(assert (=> b!89376 (= e!58187 (= (apply!84 lt!42943 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)) (get!1208 (select (arr!1932 (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!344 (defaultEntry!2372 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2178 (ite (or c!14779 c!14775) (_values!2355 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16)))))))))

(assert (=> b!89376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89377 () Bool)

(assert (=> b!89377 (= e!58182 e!58192)))

(assert (=> b!89377 (= c!14847 (and (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89378 () Bool)

(declare-fun c!14846 () Bool)

(assert (=> b!89378 (= c!14846 (and (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89378 (= e!58192 e!58188)))

(declare-fun b!89379 () Bool)

(assert (=> b!89379 (= e!58191 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89380 () Bool)

(assert (=> b!89380 (= e!58181 e!58180)))

(declare-fun c!14848 () Bool)

(assert (=> b!89380 (= c!14848 (not (= (bvand (ite c!14779 (ite c!14770 (extraKeys!2205 newMap!16) lt!42736) (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89381 () Bool)

(assert (=> b!89381 (= e!58185 (not call!8668))))

(declare-fun bm!8671 () Bool)

(assert (=> bm!8671 (= call!8669 call!8671)))

(assert (= (and d!23791 c!14845) b!89369))

(assert (= (and d!23791 (not c!14845)) b!89377))

(assert (= (and b!89377 c!14847) b!89370))

(assert (= (and b!89377 (not c!14847)) b!89378))

(assert (= (and b!89378 c!14846) b!89364))

(assert (= (and b!89378 (not c!14846)) b!89373))

(assert (= (or b!89364 b!89373) bm!8669))

(assert (= (or b!89370 bm!8669) bm!8671))

(assert (= (or b!89370 b!89364) bm!8668))

(assert (= (or b!89369 bm!8671) bm!8670))

(assert (= (or b!89369 bm!8668) bm!8666))

(assert (= (and d!23791 res!45698) b!89371))

(assert (= (and d!23791 c!14843) b!89375))

(assert (= (and d!23791 (not c!14843)) b!89365))

(assert (= (and d!23791 res!45700) b!89367))

(assert (= (and b!89367 res!45701) b!89379))

(assert (= (and b!89367 (not res!45696)) b!89374))

(assert (= (and b!89374 res!45695) b!89376))

(assert (= (and b!89367 res!45697) b!89366))

(assert (= (and b!89366 c!14844) b!89372))

(assert (= (and b!89366 (not c!14844)) b!89381))

(assert (= (and b!89372 res!45699) b!89368))

(assert (= (or b!89372 b!89381) bm!8667))

(assert (= (and b!89366 res!45702) b!89380))

(assert (= (and b!89380 c!14848) b!89362))

(assert (= (and b!89380 (not c!14848)) b!89361))

(assert (= (and b!89362 res!45703) b!89363))

(assert (= (or b!89362 b!89361) bm!8665))

(declare-fun b_lambda!3959 () Bool)

(assert (=> (not b_lambda!3959) (not b!89376)))

(assert (=> b!89376 t!5293))

(declare-fun b_and!5383 () Bool)

(assert (= b_and!5379 (and (=> t!5293 result!2979) b_and!5383)))

(assert (=> b!89376 t!5295))

(declare-fun b_and!5385 () Bool)

(assert (= b_and!5381 (and (=> t!5295 result!2981) b_and!5385)))

(declare-fun m!95881 () Bool)

(assert (=> b!89363 m!95881))

(declare-fun m!95883 () Bool)

(assert (=> bm!8667 m!95883))

(assert (=> b!89371 m!95789))

(assert (=> b!89371 m!95789))

(assert (=> b!89371 m!95791))

(declare-fun m!95885 () Bool)

(assert (=> bm!8665 m!95885))

(declare-fun m!95887 () Bool)

(assert (=> b!89376 m!95887))

(assert (=> b!89376 m!95797))

(declare-fun m!95889 () Bool)

(assert (=> b!89376 m!95889))

(assert (=> b!89376 m!95887))

(assert (=> b!89376 m!95797))

(assert (=> b!89376 m!95789))

(assert (=> b!89376 m!95789))

(declare-fun m!95891 () Bool)

(assert (=> b!89376 m!95891))

(assert (=> b!89374 m!95789))

(assert (=> b!89374 m!95789))

(declare-fun m!95893 () Bool)

(assert (=> b!89374 m!95893))

(declare-fun m!95895 () Bool)

(assert (=> bm!8666 m!95895))

(assert (=> b!89379 m!95789))

(assert (=> b!89379 m!95789))

(assert (=> b!89379 m!95791))

(declare-fun m!95897 () Bool)

(assert (=> b!89369 m!95897))

(assert (=> d!23791 m!95621))

(declare-fun m!95899 () Bool)

(assert (=> bm!8670 m!95899))

(declare-fun m!95901 () Bool)

(assert (=> b!89368 m!95901))

(declare-fun m!95903 () Bool)

(assert (=> b!89375 m!95903))

(declare-fun m!95905 () Bool)

(assert (=> b!89375 m!95905))

(declare-fun m!95907 () Bool)

(assert (=> b!89375 m!95907))

(declare-fun m!95909 () Bool)

(assert (=> b!89375 m!95909))

(declare-fun m!95911 () Bool)

(assert (=> b!89375 m!95911))

(declare-fun m!95913 () Bool)

(assert (=> b!89375 m!95913))

(declare-fun m!95915 () Bool)

(assert (=> b!89375 m!95915))

(assert (=> b!89375 m!95789))

(declare-fun m!95917 () Bool)

(assert (=> b!89375 m!95917))

(assert (=> b!89375 m!95917))

(declare-fun m!95919 () Bool)

(assert (=> b!89375 m!95919))

(assert (=> b!89375 m!95907))

(declare-fun m!95921 () Bool)

(assert (=> b!89375 m!95921))

(declare-fun m!95923 () Bool)

(assert (=> b!89375 m!95923))

(declare-fun m!95925 () Bool)

(assert (=> b!89375 m!95925))

(assert (=> b!89375 m!95923))

(assert (=> b!89375 m!95899))

(assert (=> b!89375 m!95905))

(declare-fun m!95927 () Bool)

(assert (=> b!89375 m!95927))

(declare-fun m!95929 () Bool)

(assert (=> b!89375 m!95929))

(declare-fun m!95931 () Bool)

(assert (=> b!89375 m!95931))

(assert (=> bm!8608 d!23791))

(declare-fun d!23793 () Bool)

(assert (=> d!23793 (= (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89180 d!23793))

(assert (=> d!23717 d!23723))

(declare-fun d!23795 () Bool)

(assert (=> d!23795 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) from!355 Nil!1524)))

(assert (=> d!23795 true))

(declare-fun _$71!120 () Unit!2636)

(assert (=> d!23795 (= (choose!39 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!120)))

(declare-fun bs!3763 () Bool)

(assert (= bs!3763 d!23795))

(assert (=> bs!3763 m!95221))

(assert (=> d!23717 d!23795))

(declare-fun bm!8674 () Bool)

(declare-fun call!8677 () (_ BitVec 32))

(assert (=> bm!8674 (= call!8677 (arrayCountValidKeys!0 (_keys!4050 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89391 () Bool)

(declare-fun e!58198 () (_ BitVec 32))

(assert (=> b!89391 (= e!58198 #b00000000000000000000000000000000)))

(declare-fun b!89392 () Bool)

(declare-fun e!58197 () (_ BitVec 32))

(assert (=> b!89392 (= e!58198 e!58197)))

(declare-fun c!14854 () Bool)

(assert (=> b!89392 (= c!14854 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89393 () Bool)

(assert (=> b!89393 (= e!58197 call!8677)))

(declare-fun b!89390 () Bool)

(assert (=> b!89390 (= e!58197 (bvadd #b00000000000000000000000000000001 call!8677))))

(declare-fun d!23797 () Bool)

(declare-fun lt!42955 () (_ BitVec 32))

(assert (=> d!23797 (and (bvsge lt!42955 #b00000000000000000000000000000000) (bvsle lt!42955 (bvsub (size!2177 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!23797 (= lt!42955 e!58198)))

(declare-fun c!14853 () Bool)

(assert (=> d!23797 (= c!14853 (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(assert (=> d!23797 (and (bvsle #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2177 (_keys!4050 newMap!16)) (size!2177 (_keys!4050 newMap!16))))))

(assert (=> d!23797 (= (arrayCountValidKeys!0 (_keys!4050 newMap!16) #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) lt!42955)))

(assert (= (and d!23797 c!14853) b!89391))

(assert (= (and d!23797 (not c!14853)) b!89392))

(assert (= (and b!89392 c!14854) b!89390))

(assert (= (and b!89392 (not c!14854)) b!89393))

(assert (= (or b!89390 b!89393) bm!8674))

(declare-fun m!95933 () Bool)

(assert (=> bm!8674 m!95933))

(assert (=> b!89392 m!95789))

(assert (=> b!89392 m!95789))

(assert (=> b!89392 m!95791))

(assert (=> b!88984 d!23797))

(declare-fun d!23799 () Bool)

(declare-fun lt!42956 () Bool)

(assert (=> d!23799 (= lt!42956 (select (content!93 (toList!750 lt!42643)) lt!42541))))

(declare-fun e!58200 () Bool)

(assert (=> d!23799 (= lt!42956 e!58200)))

(declare-fun res!45704 () Bool)

(assert (=> d!23799 (=> (not res!45704) (not e!58200))))

(assert (=> d!23799 (= res!45704 ((_ is Cons!1522) (toList!750 lt!42643)))))

(assert (=> d!23799 (= (contains!761 (toList!750 lt!42643) lt!42541) lt!42956)))

(declare-fun b!89394 () Bool)

(declare-fun e!58199 () Bool)

(assert (=> b!89394 (= e!58200 e!58199)))

(declare-fun res!45705 () Bool)

(assert (=> b!89394 (=> res!45705 e!58199)))

(assert (=> b!89394 (= res!45705 (= (h!2114 (toList!750 lt!42643)) lt!42541))))

(declare-fun b!89395 () Bool)

(assert (=> b!89395 (= e!58199 (contains!761 (t!5284 (toList!750 lt!42643)) lt!42541))))

(assert (= (and d!23799 res!45704) b!89394))

(assert (= (and b!89394 (not res!45705)) b!89395))

(declare-fun m!95935 () Bool)

(assert (=> d!23799 m!95935))

(declare-fun m!95937 () Bool)

(assert (=> d!23799 m!95937))

(declare-fun m!95939 () Bool)

(assert (=> b!89395 m!95939))

(assert (=> b!88954 d!23799))

(declare-fun d!23801 () Bool)

(declare-fun e!58201 () Bool)

(assert (=> d!23801 e!58201))

(declare-fun res!45706 () Bool)

(assert (=> d!23801 (=> (not res!45706) (not e!58201))))

(declare-fun lt!42958 () ListLongMap!1469)

(assert (=> d!23801 (= res!45706 (contains!760 lt!42958 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42960 () List!1526)

(assert (=> d!23801 (= lt!42958 (ListLongMap!1470 lt!42960))))

(declare-fun lt!42959 () Unit!2636)

(declare-fun lt!42957 () Unit!2636)

(assert (=> d!23801 (= lt!42959 lt!42957)))

(assert (=> d!23801 (= (getValueByKey!142 lt!42960 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23801 (= lt!42957 (lemmaContainsTupThenGetReturnValue!59 lt!42960 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23801 (= lt!42960 (insertStrictlySorted!62 (toList!750 (+!113 lt!42530 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23801 (= (+!113 (+!113 lt!42530 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42958)))

(declare-fun b!89396 () Bool)

(declare-fun res!45707 () Bool)

(assert (=> b!89396 (=> (not res!45707) (not e!58201))))

(assert (=> b!89396 (= res!45707 (= (getValueByKey!142 (toList!750 lt!42958) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89397 () Bool)

(assert (=> b!89397 (= e!58201 (contains!761 (toList!750 lt!42958) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23801 res!45706) b!89396))

(assert (= (and b!89396 res!45707) b!89397))

(declare-fun m!95941 () Bool)

(assert (=> d!23801 m!95941))

(declare-fun m!95943 () Bool)

(assert (=> d!23801 m!95943))

(declare-fun m!95945 () Bool)

(assert (=> d!23801 m!95945))

(declare-fun m!95947 () Bool)

(assert (=> d!23801 m!95947))

(declare-fun m!95949 () Bool)

(assert (=> b!89396 m!95949))

(declare-fun m!95951 () Bool)

(assert (=> b!89397 m!95951))

(assert (=> d!23667 d!23801))

(declare-fun d!23803 () Bool)

(declare-fun e!58202 () Bool)

(assert (=> d!23803 e!58202))

(declare-fun res!45708 () Bool)

(assert (=> d!23803 (=> (not res!45708) (not e!58202))))

(declare-fun lt!42962 () ListLongMap!1469)

(assert (=> d!23803 (= res!45708 (contains!760 lt!42962 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun lt!42964 () List!1526)

(assert (=> d!23803 (= lt!42962 (ListLongMap!1470 lt!42964))))

(declare-fun lt!42963 () Unit!2636)

(declare-fun lt!42961 () Unit!2636)

(assert (=> d!23803 (= lt!42963 lt!42961)))

(assert (=> d!23803 (= (getValueByKey!142 lt!42964 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23803 (= lt!42961 (lemmaContainsTupThenGetReturnValue!59 lt!42964 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23803 (= lt!42964 (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23803 (= (+!113 lt!42530 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) lt!42962)))

(declare-fun b!89398 () Bool)

(declare-fun res!45709 () Bool)

(assert (=> b!89398 (=> (not res!45709) (not e!58202))))

(assert (=> b!89398 (= res!45709 (= (getValueByKey!142 (toList!750 lt!42962) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun b!89399 () Bool)

(assert (=> b!89399 (= e!58202 (contains!761 (toList!750 lt!42962) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (= (and d!23803 res!45708) b!89398))

(assert (= (and b!89398 res!45709) b!89399))

(declare-fun m!95953 () Bool)

(assert (=> d!23803 m!95953))

(declare-fun m!95955 () Bool)

(assert (=> d!23803 m!95955))

(declare-fun m!95957 () Bool)

(assert (=> d!23803 m!95957))

(declare-fun m!95959 () Bool)

(assert (=> d!23803 m!95959))

(declare-fun m!95961 () Bool)

(assert (=> b!89398 m!95961))

(declare-fun m!95963 () Bool)

(assert (=> b!89399 m!95963))

(assert (=> d!23667 d!23803))

(declare-fun d!23805 () Bool)

(declare-fun e!58203 () Bool)

(assert (=> d!23805 e!58203))

(declare-fun res!45710 () Bool)

(assert (=> d!23805 (=> (not res!45710) (not e!58203))))

(declare-fun lt!42966 () ListLongMap!1469)

(assert (=> d!23805 (= res!45710 (contains!760 lt!42966 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!42968 () List!1526)

(assert (=> d!23805 (= lt!42966 (ListLongMap!1470 lt!42968))))

(declare-fun lt!42967 () Unit!2636)

(declare-fun lt!42965 () Unit!2636)

(assert (=> d!23805 (= lt!42967 lt!42965)))

(assert (=> d!23805 (= (getValueByKey!142 lt!42968 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23805 (= lt!42965 (lemmaContainsTupThenGetReturnValue!59 lt!42968 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23805 (= lt!42968 (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23805 (= (+!113 lt!42530 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!42966)))

(declare-fun b!89400 () Bool)

(declare-fun res!45711 () Bool)

(assert (=> b!89400 (=> (not res!45711) (not e!58203))))

(assert (=> b!89400 (= res!45711 (= (getValueByKey!142 (toList!750 lt!42966) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89401 () Bool)

(assert (=> b!89401 (= e!58203 (contains!761 (toList!750 lt!42966) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23805 res!45710) b!89400))

(assert (= (and b!89400 res!45711) b!89401))

(declare-fun m!95965 () Bool)

(assert (=> d!23805 m!95965))

(declare-fun m!95967 () Bool)

(assert (=> d!23805 m!95967))

(declare-fun m!95969 () Bool)

(assert (=> d!23805 m!95969))

(declare-fun m!95971 () Bool)

(assert (=> d!23805 m!95971))

(declare-fun m!95973 () Bool)

(assert (=> b!89400 m!95973))

(declare-fun m!95975 () Bool)

(assert (=> b!89401 m!95975))

(assert (=> d!23667 d!23805))

(declare-fun d!23807 () Bool)

(assert (=> d!23807 (= (+!113 (+!113 lt!42530 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (+!113 (+!113 lt!42530 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (=> d!23807 true))

(declare-fun _$28!150 () Unit!2636)

(assert (=> d!23807 (= (choose!526 lt!42530 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))) _$28!150)))

(declare-fun bs!3764 () Bool)

(assert (= bs!3764 d!23807))

(assert (=> bs!3764 m!95323))

(assert (=> bs!3764 m!95323))

(assert (=> bs!3764 m!95325))

(assert (=> bs!3764 m!95327))

(assert (=> bs!3764 m!95327))

(assert (=> bs!3764 m!95329))

(assert (=> d!23667 d!23807))

(declare-fun d!23809 () Bool)

(declare-fun e!58204 () Bool)

(assert (=> d!23809 e!58204))

(declare-fun res!45712 () Bool)

(assert (=> d!23809 (=> (not res!45712) (not e!58204))))

(declare-fun lt!42970 () ListLongMap!1469)

(assert (=> d!23809 (= res!45712 (contains!760 lt!42970 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun lt!42972 () List!1526)

(assert (=> d!23809 (= lt!42970 (ListLongMap!1470 lt!42972))))

(declare-fun lt!42971 () Unit!2636)

(declare-fun lt!42969 () Unit!2636)

(assert (=> d!23809 (= lt!42971 lt!42969)))

(assert (=> d!23809 (= (getValueByKey!142 lt!42972 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23809 (= lt!42969 (lemmaContainsTupThenGetReturnValue!59 lt!42972 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23809 (= lt!42972 (insertStrictlySorted!62 (toList!750 (+!113 lt!42530 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23809 (= (+!113 (+!113 lt!42530 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) lt!42970)))

(declare-fun b!89402 () Bool)

(declare-fun res!45713 () Bool)

(assert (=> b!89402 (=> (not res!45713) (not e!58204))))

(assert (=> b!89402 (= res!45713 (= (getValueByKey!142 (toList!750 lt!42970) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun b!89403 () Bool)

(assert (=> b!89403 (= e!58204 (contains!761 (toList!750 lt!42970) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (= (and d!23809 res!45712) b!89402))

(assert (= (and b!89402 res!45713) b!89403))

(declare-fun m!95977 () Bool)

(assert (=> d!23809 m!95977))

(declare-fun m!95979 () Bool)

(assert (=> d!23809 m!95979))

(declare-fun m!95981 () Bool)

(assert (=> d!23809 m!95981))

(declare-fun m!95983 () Bool)

(assert (=> d!23809 m!95983))

(declare-fun m!95985 () Bool)

(assert (=> b!89402 m!95985))

(declare-fun m!95987 () Bool)

(assert (=> b!89403 m!95987))

(assert (=> d!23667 d!23809))

(assert (=> b!89213 d!23719))

(declare-fun d!23811 () Bool)

(declare-fun lt!42973 () Bool)

(assert (=> d!23811 (= lt!42973 (select (content!93 (toList!750 lt!42647)) lt!42538))))

(declare-fun e!58206 () Bool)

(assert (=> d!23811 (= lt!42973 e!58206)))

(declare-fun res!45714 () Bool)

(assert (=> d!23811 (=> (not res!45714) (not e!58206))))

(assert (=> d!23811 (= res!45714 ((_ is Cons!1522) (toList!750 lt!42647)))))

(assert (=> d!23811 (= (contains!761 (toList!750 lt!42647) lt!42538) lt!42973)))

(declare-fun b!89404 () Bool)

(declare-fun e!58205 () Bool)

(assert (=> b!89404 (= e!58206 e!58205)))

(declare-fun res!45715 () Bool)

(assert (=> b!89404 (=> res!45715 e!58205)))

(assert (=> b!89404 (= res!45715 (= (h!2114 (toList!750 lt!42647)) lt!42538))))

(declare-fun b!89405 () Bool)

(assert (=> b!89405 (= e!58205 (contains!761 (t!5284 (toList!750 lt!42647)) lt!42538))))

(assert (= (and d!23811 res!45714) b!89404))

(assert (= (and b!89404 (not res!45715)) b!89405))

(declare-fun m!95989 () Bool)

(assert (=> d!23811 m!95989))

(declare-fun m!95991 () Bool)

(assert (=> d!23811 m!95991))

(declare-fun m!95993 () Bool)

(assert (=> b!89405 m!95993))

(assert (=> b!88956 d!23811))

(declare-fun d!23813 () Bool)

(declare-fun lt!42974 () Bool)

(assert (=> d!23813 (= lt!42974 (select (content!93 (toList!750 lt!42651)) lt!42538))))

(declare-fun e!58208 () Bool)

(assert (=> d!23813 (= lt!42974 e!58208)))

(declare-fun res!45716 () Bool)

(assert (=> d!23813 (=> (not res!45716) (not e!58208))))

(assert (=> d!23813 (= res!45716 ((_ is Cons!1522) (toList!750 lt!42651)))))

(assert (=> d!23813 (= (contains!761 (toList!750 lt!42651) lt!42538) lt!42974)))

(declare-fun b!89406 () Bool)

(declare-fun e!58207 () Bool)

(assert (=> b!89406 (= e!58208 e!58207)))

(declare-fun res!45717 () Bool)

(assert (=> b!89406 (=> res!45717 e!58207)))

(assert (=> b!89406 (= res!45717 (= (h!2114 (toList!750 lt!42651)) lt!42538))))

(declare-fun b!89407 () Bool)

(assert (=> b!89407 (= e!58207 (contains!761 (t!5284 (toList!750 lt!42651)) lt!42538))))

(assert (= (and d!23813 res!45716) b!89406))

(assert (= (and b!89406 (not res!45717)) b!89407))

(declare-fun m!95995 () Bool)

(assert (=> d!23813 m!95995))

(declare-fun m!95997 () Bool)

(assert (=> d!23813 m!95997))

(declare-fun m!95999 () Bool)

(assert (=> b!89407 m!95999))

(assert (=> b!88958 d!23813))

(declare-fun d!23815 () Bool)

(declare-fun e!58210 () Bool)

(assert (=> d!23815 e!58210))

(declare-fun res!45718 () Bool)

(assert (=> d!23815 (=> res!45718 e!58210)))

(declare-fun lt!42975 () Bool)

(assert (=> d!23815 (= res!45718 (not lt!42975))))

(declare-fun lt!42978 () Bool)

(assert (=> d!23815 (= lt!42975 lt!42978)))

(declare-fun lt!42977 () Unit!2636)

(declare-fun e!58209 () Unit!2636)

(assert (=> d!23815 (= lt!42977 e!58209)))

(declare-fun c!14855 () Bool)

(assert (=> d!23815 (= c!14855 lt!42978)))

(assert (=> d!23815 (= lt!42978 (containsKey!146 (toList!750 lt!42659) (_1!1116 lt!42541)))))

(assert (=> d!23815 (= (contains!760 lt!42659 (_1!1116 lt!42541)) lt!42975)))

(declare-fun b!89408 () Bool)

(declare-fun lt!42976 () Unit!2636)

(assert (=> b!89408 (= e!58209 lt!42976)))

(assert (=> b!89408 (= lt!42976 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42659) (_1!1116 lt!42541)))))

(assert (=> b!89408 (isDefined!95 (getValueByKey!142 (toList!750 lt!42659) (_1!1116 lt!42541)))))

(declare-fun b!89409 () Bool)

(declare-fun Unit!2651 () Unit!2636)

(assert (=> b!89409 (= e!58209 Unit!2651)))

(declare-fun b!89410 () Bool)

(assert (=> b!89410 (= e!58210 (isDefined!95 (getValueByKey!142 (toList!750 lt!42659) (_1!1116 lt!42541))))))

(assert (= (and d!23815 c!14855) b!89408))

(assert (= (and d!23815 (not c!14855)) b!89409))

(assert (= (and d!23815 (not res!45718)) b!89410))

(declare-fun m!96001 () Bool)

(assert (=> d!23815 m!96001))

(declare-fun m!96003 () Bool)

(assert (=> b!89408 m!96003))

(assert (=> b!89408 m!95451))

(assert (=> b!89408 m!95451))

(declare-fun m!96005 () Bool)

(assert (=> b!89408 m!96005))

(assert (=> b!89410 m!95451))

(assert (=> b!89410 m!95451))

(assert (=> b!89410 m!96005))

(assert (=> d!23687 d!23815))

(declare-fun b!89411 () Bool)

(declare-fun e!58211 () Option!148)

(assert (=> b!89411 (= e!58211 (Some!147 (_2!1116 (h!2114 lt!42661))))))

(declare-fun d!23817 () Bool)

(declare-fun c!14856 () Bool)

(assert (=> d!23817 (= c!14856 (and ((_ is Cons!1522) lt!42661) (= (_1!1116 (h!2114 lt!42661)) (_1!1116 lt!42541))))))

(assert (=> d!23817 (= (getValueByKey!142 lt!42661 (_1!1116 lt!42541)) e!58211)))

(declare-fun b!89414 () Bool)

(declare-fun e!58212 () Option!148)

(assert (=> b!89414 (= e!58212 None!146)))

(declare-fun b!89413 () Bool)

(assert (=> b!89413 (= e!58212 (getValueByKey!142 (t!5284 lt!42661) (_1!1116 lt!42541)))))

(declare-fun b!89412 () Bool)

(assert (=> b!89412 (= e!58211 e!58212)))

(declare-fun c!14857 () Bool)

(assert (=> b!89412 (= c!14857 (and ((_ is Cons!1522) lt!42661) (not (= (_1!1116 (h!2114 lt!42661)) (_1!1116 lt!42541)))))))

(assert (= (and d!23817 c!14856) b!89411))

(assert (= (and d!23817 (not c!14856)) b!89412))

(assert (= (and b!89412 c!14857) b!89413))

(assert (= (and b!89412 (not c!14857)) b!89414))

(declare-fun m!96007 () Bool)

(assert (=> b!89413 m!96007))

(assert (=> d!23687 d!23817))

(declare-fun d!23819 () Bool)

(assert (=> d!23819 (= (getValueByKey!142 lt!42661 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(declare-fun lt!42981 () Unit!2636)

(declare-fun choose!531 (List!1526 (_ BitVec 64) V!3043) Unit!2636)

(assert (=> d!23819 (= lt!42981 (choose!531 lt!42661 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun e!58215 () Bool)

(assert (=> d!23819 e!58215))

(declare-fun res!45723 () Bool)

(assert (=> d!23819 (=> (not res!45723) (not e!58215))))

(declare-fun isStrictlySorted!300 (List!1526) Bool)

(assert (=> d!23819 (= res!45723 (isStrictlySorted!300 lt!42661))))

(assert (=> d!23819 (= (lemmaContainsTupThenGetReturnValue!59 lt!42661 (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!42981)))

(declare-fun b!89419 () Bool)

(declare-fun res!45724 () Bool)

(assert (=> b!89419 (=> (not res!45724) (not e!58215))))

(assert (=> b!89419 (= res!45724 (containsKey!146 lt!42661 (_1!1116 lt!42541)))))

(declare-fun b!89420 () Bool)

(assert (=> b!89420 (= e!58215 (contains!761 lt!42661 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(assert (= (and d!23819 res!45723) b!89419))

(assert (= (and b!89419 res!45724) b!89420))

(assert (=> d!23819 m!95445))

(declare-fun m!96009 () Bool)

(assert (=> d!23819 m!96009))

(declare-fun m!96011 () Bool)

(assert (=> d!23819 m!96011))

(declare-fun m!96013 () Bool)

(assert (=> b!89419 m!96013))

(declare-fun m!96015 () Bool)

(assert (=> b!89420 m!96015))

(assert (=> d!23687 d!23819))

(declare-fun b!89441 () Bool)

(declare-fun e!58226 () List!1526)

(declare-fun call!8685 () List!1526)

(assert (=> b!89441 (= e!58226 call!8685)))

(declare-fun b!89442 () Bool)

(declare-fun e!58230 () Bool)

(declare-fun lt!42984 () List!1526)

(assert (=> b!89442 (= e!58230 (contains!761 lt!42984 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(declare-fun b!89443 () Bool)

(declare-fun e!58229 () List!1526)

(declare-fun call!8684 () List!1526)

(assert (=> b!89443 (= e!58229 call!8684)))

(declare-fun bm!8681 () Bool)

(declare-fun call!8686 () List!1526)

(assert (=> bm!8681 (= call!8685 call!8686)))

(declare-fun b!89444 () Bool)

(declare-fun c!14867 () Bool)

(assert (=> b!89444 (= c!14867 (and ((_ is Cons!1522) (toList!750 lt!42537)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42541))))))

(declare-fun e!58228 () List!1526)

(assert (=> b!89444 (= e!58228 e!58226)))

(declare-fun b!89445 () Bool)

(declare-fun e!58227 () List!1526)

(assert (=> b!89445 (= e!58227 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42537)) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun bm!8683 () Bool)

(assert (=> bm!8683 (= call!8686 call!8684)))

(declare-fun c!14869 () Bool)

(declare-fun b!89446 () Bool)

(assert (=> b!89446 (= e!58227 (ite c!14869 (t!5284 (toList!750 lt!42537)) (ite c!14867 (Cons!1522 (h!2114 (toList!750 lt!42537)) (t!5284 (toList!750 lt!42537))) Nil!1523)))))

(declare-fun b!89447 () Bool)

(assert (=> b!89447 (= e!58228 call!8686)))

(declare-fun b!89448 () Bool)

(assert (=> b!89448 (= e!58229 e!58228)))

(assert (=> b!89448 (= c!14869 (and ((_ is Cons!1522) (toList!750 lt!42537)) (= (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42541))))))

(declare-fun bm!8682 () Bool)

(declare-fun c!14868 () Bool)

(declare-fun $colon$colon!74 (List!1526 tuple2!2210) List!1526)

(assert (=> bm!8682 (= call!8684 ($colon$colon!74 e!58227 (ite c!14868 (h!2114 (toList!750 lt!42537)) (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541)))))))

(declare-fun c!14866 () Bool)

(assert (=> bm!8682 (= c!14866 c!14868)))

(declare-fun d!23821 () Bool)

(assert (=> d!23821 e!58230))

(declare-fun res!45729 () Bool)

(assert (=> d!23821 (=> (not res!45729) (not e!58230))))

(assert (=> d!23821 (= res!45729 (isStrictlySorted!300 lt!42984))))

(assert (=> d!23821 (= lt!42984 e!58229)))

(assert (=> d!23821 (= c!14868 (and ((_ is Cons!1522) (toList!750 lt!42537)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42541))))))

(assert (=> d!23821 (isStrictlySorted!300 (toList!750 lt!42537))))

(assert (=> d!23821 (= (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!42984)))

(declare-fun b!89449 () Bool)

(declare-fun res!45730 () Bool)

(assert (=> b!89449 (=> (not res!45730) (not e!58230))))

(assert (=> b!89449 (= res!45730 (containsKey!146 lt!42984 (_1!1116 lt!42541)))))

(declare-fun b!89450 () Bool)

(assert (=> b!89450 (= e!58226 call!8685)))

(assert (= (and d!23821 c!14868) b!89443))

(assert (= (and d!23821 (not c!14868)) b!89448))

(assert (= (and b!89448 c!14869) b!89447))

(assert (= (and b!89448 (not c!14869)) b!89444))

(assert (= (and b!89444 c!14867) b!89441))

(assert (= (and b!89444 (not c!14867)) b!89450))

(assert (= (or b!89441 b!89450) bm!8681))

(assert (= (or b!89447 bm!8681) bm!8683))

(assert (= (or b!89443 bm!8683) bm!8682))

(assert (= (and bm!8682 c!14866) b!89445))

(assert (= (and bm!8682 (not c!14866)) b!89446))

(assert (= (and d!23821 res!45729) b!89449))

(assert (= (and b!89449 res!45730) b!89442))

(declare-fun m!96017 () Bool)

(assert (=> b!89442 m!96017))

(declare-fun m!96019 () Bool)

(assert (=> b!89449 m!96019))

(declare-fun m!96021 () Bool)

(assert (=> bm!8682 m!96021))

(declare-fun m!96023 () Bool)

(assert (=> b!89445 m!96023))

(declare-fun m!96025 () Bool)

(assert (=> d!23821 m!96025))

(declare-fun m!96027 () Bool)

(assert (=> d!23821 m!96027))

(assert (=> d!23687 d!23821))

(declare-fun b!89451 () Bool)

(declare-fun e!58234 () Bool)

(declare-fun e!58233 () Bool)

(assert (=> b!89451 (= e!58234 e!58233)))

(declare-fun c!14870 () Bool)

(assert (=> b!89451 (= c!14870 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8684 () Bool)

(declare-fun call!8687 () Bool)

(assert (=> bm!8684 (= call!8687 (arrayNoDuplicates!0 (_keys!4050 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14870 (Cons!1523 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000) Nil!1524) Nil!1524)))))

(declare-fun b!89452 () Bool)

(declare-fun e!58231 () Bool)

(assert (=> b!89452 (= e!58231 e!58234)))

(declare-fun res!45731 () Bool)

(assert (=> b!89452 (=> (not res!45731) (not e!58234))))

(declare-fun e!58232 () Bool)

(assert (=> b!89452 (= res!45731 (not e!58232))))

(declare-fun res!45732 () Bool)

(assert (=> b!89452 (=> (not res!45732) (not e!58232))))

(assert (=> b!89452 (= res!45732 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!23823 () Bool)

(declare-fun res!45733 () Bool)

(assert (=> d!23823 (=> res!45733 e!58231)))

(assert (=> d!23823 (= res!45733 (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(assert (=> d!23823 (= (arrayNoDuplicates!0 (_keys!4050 newMap!16) #b00000000000000000000000000000000 Nil!1524) e!58231)))

(declare-fun b!89453 () Bool)

(assert (=> b!89453 (= e!58233 call!8687)))

(declare-fun b!89454 () Bool)

(assert (=> b!89454 (= e!58233 call!8687)))

(declare-fun b!89455 () Bool)

(assert (=> b!89455 (= e!58232 (contains!762 Nil!1524 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23823 (not res!45733)) b!89452))

(assert (= (and b!89452 res!45732) b!89455))

(assert (= (and b!89452 res!45731) b!89451))

(assert (= (and b!89451 c!14870) b!89453))

(assert (= (and b!89451 (not c!14870)) b!89454))

(assert (= (or b!89453 b!89454) bm!8684))

(assert (=> b!89451 m!95789))

(assert (=> b!89451 m!95789))

(assert (=> b!89451 m!95791))

(assert (=> bm!8684 m!95789))

(declare-fun m!96029 () Bool)

(assert (=> bm!8684 m!96029))

(assert (=> b!89452 m!95789))

(assert (=> b!89452 m!95789))

(assert (=> b!89452 m!95791))

(assert (=> b!89455 m!95789))

(assert (=> b!89455 m!95789))

(declare-fun m!96031 () Bool)

(assert (=> b!89455 m!96031))

(assert (=> b!88986 d!23823))

(declare-fun b!89456 () Bool)

(declare-fun e!58235 () Option!148)

(assert (=> b!89456 (= e!58235 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42638)))))))

(declare-fun d!23825 () Bool)

(declare-fun c!14871 () Bool)

(assert (=> d!23825 (= c!14871 (and ((_ is Cons!1522) (toList!750 lt!42638)) (= (_1!1116 (h!2114 (toList!750 lt!42638))) (_1!1116 lt!42540))))))

(assert (=> d!23825 (= (getValueByKey!142 (toList!750 lt!42638) (_1!1116 lt!42540)) e!58235)))

(declare-fun b!89459 () Bool)

(declare-fun e!58236 () Option!148)

(assert (=> b!89459 (= e!58236 None!146)))

(declare-fun b!89458 () Bool)

(assert (=> b!89458 (= e!58236 (getValueByKey!142 (t!5284 (toList!750 lt!42638)) (_1!1116 lt!42540)))))

(declare-fun b!89457 () Bool)

(assert (=> b!89457 (= e!58235 e!58236)))

(declare-fun c!14872 () Bool)

(assert (=> b!89457 (= c!14872 (and ((_ is Cons!1522) (toList!750 lt!42638)) (not (= (_1!1116 (h!2114 (toList!750 lt!42638))) (_1!1116 lt!42540)))))))

(assert (= (and d!23825 c!14871) b!89456))

(assert (= (and d!23825 (not c!14871)) b!89457))

(assert (= (and b!89457 c!14872) b!89458))

(assert (= (and b!89457 (not c!14872)) b!89459))

(declare-fun m!96033 () Bool)

(assert (=> b!89458 m!96033))

(assert (=> b!88951 d!23825))

(declare-fun d!23827 () Bool)

(declare-fun lt!42985 () Bool)

(assert (=> d!23827 (= lt!42985 (select (content!93 (toList!750 lt!42655)) lt!42540))))

(declare-fun e!58238 () Bool)

(assert (=> d!23827 (= lt!42985 e!58238)))

(declare-fun res!45734 () Bool)

(assert (=> d!23827 (=> (not res!45734) (not e!58238))))

(assert (=> d!23827 (= res!45734 ((_ is Cons!1522) (toList!750 lt!42655)))))

(assert (=> d!23827 (= (contains!761 (toList!750 lt!42655) lt!42540) lt!42985)))

(declare-fun b!89460 () Bool)

(declare-fun e!58237 () Bool)

(assert (=> b!89460 (= e!58238 e!58237)))

(declare-fun res!45735 () Bool)

(assert (=> b!89460 (=> res!45735 e!58237)))

(assert (=> b!89460 (= res!45735 (= (h!2114 (toList!750 lt!42655)) lt!42540))))

(declare-fun b!89461 () Bool)

(assert (=> b!89461 (= e!58237 (contains!761 (t!5284 (toList!750 lt!42655)) lt!42540))))

(assert (= (and d!23827 res!45734) b!89460))

(assert (= (and b!89460 (not res!45735)) b!89461))

(declare-fun m!96035 () Bool)

(assert (=> d!23827 m!96035))

(declare-fun m!96037 () Bool)

(assert (=> d!23827 m!96037))

(declare-fun m!96039 () Bool)

(assert (=> b!89461 m!96039))

(assert (=> b!88960 d!23827))

(declare-fun b!89496 () Bool)

(declare-fun res!45756 () Bool)

(declare-fun e!58257 () Bool)

(assert (=> b!89496 (=> (not res!45756) (not e!58257))))

(declare-fun lt!43059 () tuple2!2212)

(assert (=> b!89496 (= res!45756 (valid!329 (_2!1117 lt!43059)))))

(declare-fun b!89497 () Bool)

(declare-fun res!45759 () Bool)

(declare-fun e!58260 () Bool)

(assert (=> b!89497 (=> (not res!45759) (not e!58260))))

(declare-fun call!8697 () Bool)

(assert (=> b!89497 (= res!45759 call!8697)))

(declare-fun e!58259 () Bool)

(assert (=> b!89497 (= e!58259 e!58260)))

(declare-fun b!89498 () Bool)

(declare-fun e!58255 () Unit!2636)

(declare-fun Unit!2652 () Unit!2636)

(assert (=> b!89498 (= e!58255 Unit!2652)))

(declare-fun lt!43046 () Unit!2636)

(assert (=> b!89498 (= lt!43046 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43071 () SeekEntryResult!245)

(declare-fun call!8696 () SeekEntryResult!245)

(assert (=> b!89498 (= lt!43071 call!8696)))

(declare-fun res!45758 () Bool)

(assert (=> b!89498 (= res!45758 ((_ is Found!245) lt!43071))))

(declare-fun e!58256 () Bool)

(assert (=> b!89498 (=> (not res!45758) (not e!58256))))

(assert (=> b!89498 e!58256))

(declare-fun lt!43060 () Unit!2636)

(assert (=> b!89498 (= lt!43060 lt!43046)))

(assert (=> b!89498 false))

(declare-fun b!89499 () Bool)

(assert (=> b!89499 (= e!58257 (= (map!1196 (_2!1117 lt!43059)) (+!113 (map!1196 newMap!16) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun b!89500 () Bool)

(declare-fun e!58258 () Bool)

(declare-fun lt!43063 () SeekEntryResult!245)

(assert (=> b!89500 (= e!58258 ((_ is Undefined!245) lt!43063))))

(declare-fun b!89501 () Bool)

(declare-fun res!45754 () Bool)

(declare-fun call!8698 () Bool)

(assert (=> b!89501 (= res!45754 call!8698)))

(assert (=> b!89501 (=> (not res!45754) (not e!58256))))

(declare-fun b!89502 () Bool)

(declare-fun e!58261 () Unit!2636)

(declare-fun Unit!2653 () Unit!2636)

(assert (=> b!89502 (= e!58261 Unit!2653)))

(declare-fun lt!43048 () Unit!2636)

(declare-fun lemmaArrayContainsKeyThenInListMap!21 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) (_ BitVec 32) Int) Unit!2636)

(assert (=> b!89502 (= lt!43048 (lemmaArrayContainsKeyThenInListMap!21 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(assert (=> b!89502 (contains!760 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))

(declare-fun lt!43053 () Unit!2636)

(assert (=> b!89502 (= lt!43053 lt!43048)))

(assert (=> b!89502 false))

(declare-fun b!89503 () Bool)

(declare-fun c!14881 () Bool)

(assert (=> b!89503 (= c!14881 ((_ is MissingVacant!245) lt!43063))))

(assert (=> b!89503 (= e!58259 e!58258)))

(declare-fun d!23829 () Bool)

(assert (=> d!23829 e!58257))

(declare-fun res!45762 () Bool)

(assert (=> d!23829 (=> (not res!45762) (not e!58257))))

(assert (=> d!23829 (= res!45762 (_1!1117 lt!43059))))

(assert (=> d!23829 (= lt!43059 (tuple2!2213 true (LongMapFixedSize!769 (defaultEntry!2372 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (bvadd (_size!433 newMap!16) #b00000000000000000000000000000001) (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))) (_vacant!433 newMap!16))))))

(declare-fun lt!43067 () Unit!2636)

(declare-fun lt!43057 () Unit!2636)

(assert (=> d!23829 (= lt!43067 lt!43057)))

(declare-fun lt!43050 () array!4059)

(declare-fun lt!43075 () array!4057)

(assert (=> d!23829 (contains!760 (getCurrentListMap!443 lt!43075 lt!43050 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750))))))

(assert (=> d!23829 (= lt!43057 (lemmaValidKeyInArrayIsInListMap!94 lt!43075 lt!43050 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (defaultEntry!2372 newMap!16)))))

(assert (=> d!23829 (= lt!43050 (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))))))

(assert (=> d!23829 (= lt!43075 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun lt!43074 () Unit!2636)

(declare-fun lt!43047 () Unit!2636)

(assert (=> d!23829 (= lt!43074 lt!43047)))

(declare-fun lt!43070 () array!4057)

(assert (=> d!23829 (= (arrayCountValidKeys!0 lt!43070 (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (bvadd (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4057 (_ BitVec 32)) Unit!2636)

(assert (=> d!23829 (= lt!43047 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!43070 (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750))))))

(assert (=> d!23829 (= lt!43070 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun lt!43069 () Unit!2636)

(declare-fun lt!43065 () Unit!2636)

(assert (=> d!23829 (= lt!43069 lt!43065)))

(declare-fun lt!43054 () array!4057)

(assert (=> d!23829 (arrayContainsKey!0 lt!43054 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23829 (= lt!43065 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!43054 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750))))))

(assert (=> d!23829 (= lt!43054 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun lt!43073 () Unit!2636)

(declare-fun lt!43055 () Unit!2636)

(assert (=> d!23829 (= lt!43073 lt!43055)))

(assert (=> d!23829 (= (+!113 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (getCurrentListMap!443 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!21 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) (_ BitVec 64) V!3043 Int) Unit!2636)

(assert (=> d!23829 (= lt!43055 (lemmaAddValidKeyToArrayThenAddPairToListMap!21 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43068 () Unit!2636)

(declare-fun lt!43061 () Unit!2636)

(assert (=> d!23829 (= lt!43068 lt!43061)))

(assert (=> d!23829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))) (mask!6416 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4057 (_ BitVec 32) (_ BitVec 32)) Unit!2636)

(assert (=> d!23829 (= lt!43061 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (mask!6416 newMap!16)))))

(declare-fun lt!43062 () Unit!2636)

(declare-fun lt!43051 () Unit!2636)

(assert (=> d!23829 (= lt!43062 lt!43051)))

(assert (=> d!23829 (= (arrayCountValidKeys!0 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))) #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4050 newMap!16) #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4057 (_ BitVec 32) (_ BitVec 64)) Unit!2636)

(assert (=> d!23829 (= lt!43051 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4050 newMap!16) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun lt!43066 () Unit!2636)

(declare-fun lt!43072 () Unit!2636)

(assert (=> d!23829 (= lt!43066 lt!43072)))

(declare-fun lt!43058 () (_ BitVec 32))

(declare-fun lt!43049 () List!1527)

(assert (=> d!23829 (arrayNoDuplicates!0 (array!4058 (store (arr!1931 (_keys!4050 newMap!16)) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (size!2177 (_keys!4050 newMap!16))) lt!43058 lt!43049)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1527) Unit!2636)

(assert (=> d!23829 (= lt!43072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750)) lt!43058 lt!43049))))

(assert (=> d!23829 (= lt!43049 Nil!1524)))

(assert (=> d!23829 (= lt!43058 #b00000000000000000000000000000000)))

(declare-fun lt!43052 () Unit!2636)

(assert (=> d!23829 (= lt!43052 e!58261)))

(declare-fun c!14882 () Bool)

(assert (=> d!23829 (= c!14882 (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!43056 () Unit!2636)

(assert (=> d!23829 (= lt!43056 e!58255)))

(declare-fun c!14884 () Bool)

(assert (=> d!23829 (= c!14884 (contains!760 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23829 (valid!329 newMap!16)))

(assert (=> d!23829 (= (updateHelperNewKey!33 newMap!16 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (ite c!14771 (index!3122 lt!42750) (index!3119 lt!42750))) lt!43059)))

(declare-fun b!89504 () Bool)

(declare-fun Unit!2654 () Unit!2636)

(assert (=> b!89504 (= e!58261 Unit!2654)))

(declare-fun b!89505 () Bool)

(declare-fun res!45760 () Bool)

(assert (=> b!89505 (=> (not res!45760) (not e!58257))))

(assert (=> b!89505 (= res!45760 (contains!760 (map!1196 (_2!1117 lt!43059)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89506 () Bool)

(declare-fun call!8699 () Bool)

(assert (=> b!89506 (= e!58260 (not call!8699))))

(declare-fun b!89507 () Bool)

(declare-fun e!58262 () Bool)

(assert (=> b!89507 (= e!58258 e!58262)))

(declare-fun res!45757 () Bool)

(assert (=> b!89507 (= res!45757 call!8697)))

(assert (=> b!89507 (=> (not res!45757) (not e!58262))))

(declare-fun c!14883 () Bool)

(declare-fun bm!8693 () Bool)

(assert (=> bm!8693 (= call!8698 (inRange!0 (ite c!14884 (index!3120 lt!43071) (ite c!14883 (index!3119 lt!43063) (index!3122 lt!43063))) (mask!6416 newMap!16)))))

(declare-fun bm!8694 () Bool)

(assert (=> bm!8694 (= call!8699 (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!8695 () Bool)

(assert (=> bm!8695 (= call!8696 (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun b!89508 () Bool)

(declare-fun lt!43064 () Unit!2636)

(assert (=> b!89508 (= e!58255 lt!43064)))

(assert (=> b!89508 (= lt!43064 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(assert (=> b!89508 (= lt!43063 call!8696)))

(assert (=> b!89508 (= c!14883 ((_ is MissingZero!245) lt!43063))))

(assert (=> b!89508 e!58259))

(declare-fun b!89509 () Bool)

(assert (=> b!89509 (= e!58262 (not call!8699))))

(declare-fun b!89510 () Bool)

(declare-fun res!45761 () Bool)

(assert (=> b!89510 (= res!45761 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3122 lt!43063)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89510 (=> (not res!45761) (not e!58262))))

(declare-fun bm!8696 () Bool)

(assert (=> bm!8696 (= call!8697 call!8698)))

(declare-fun b!89511 () Bool)

(assert (=> b!89511 (= e!58256 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!43071)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89512 () Bool)

(declare-fun res!45755 () Bool)

(assert (=> b!89512 (=> (not res!45755) (not e!58260))))

(assert (=> b!89512 (= res!45755 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3119 lt!43063)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23829 c!14884) b!89498))

(assert (= (and d!23829 (not c!14884)) b!89508))

(assert (= (and b!89498 res!45758) b!89501))

(assert (= (and b!89501 res!45754) b!89511))

(assert (= (and b!89508 c!14883) b!89497))

(assert (= (and b!89508 (not c!14883)) b!89503))

(assert (= (and b!89497 res!45759) b!89512))

(assert (= (and b!89512 res!45755) b!89506))

(assert (= (and b!89503 c!14881) b!89507))

(assert (= (and b!89503 (not c!14881)) b!89500))

(assert (= (and b!89507 res!45757) b!89510))

(assert (= (and b!89510 res!45761) b!89509))

(assert (= (or b!89497 b!89507) bm!8696))

(assert (= (or b!89506 b!89509) bm!8694))

(assert (= (or b!89501 bm!8696) bm!8693))

(assert (= (or b!89498 b!89508) bm!8695))

(assert (= (and d!23829 c!14882) b!89502))

(assert (= (and d!23829 (not c!14882)) b!89504))

(assert (= (and d!23829 res!45762) b!89496))

(assert (= (and b!89496 res!45756) b!89505))

(assert (= (and b!89505 res!45760) b!89499))

(assert (=> bm!8694 m!95201))

(assert (=> bm!8694 m!95511))

(declare-fun m!96041 () Bool)

(assert (=> b!89499 m!96041))

(assert (=> b!89499 m!95215))

(assert (=> b!89499 m!95215))

(declare-fun m!96043 () Bool)

(assert (=> b!89499 m!96043))

(declare-fun m!96045 () Bool)

(assert (=> d!23829 m!96045))

(assert (=> d!23829 m!95201))

(declare-fun m!96047 () Bool)

(assert (=> d!23829 m!96047))

(declare-fun m!96049 () Bool)

(assert (=> d!23829 m!96049))

(declare-fun m!96051 () Bool)

(assert (=> d!23829 m!96051))

(declare-fun m!96053 () Bool)

(assert (=> d!23829 m!96053))

(assert (=> d!23829 m!96049))

(assert (=> d!23829 m!95507))

(declare-fun m!96055 () Bool)

(assert (=> d!23829 m!96055))

(assert (=> d!23829 m!95507))

(assert (=> d!23829 m!95191))

(assert (=> d!23829 m!95201))

(declare-fun m!96057 () Bool)

(assert (=> d!23829 m!96057))

(assert (=> d!23829 m!96051))

(assert (=> d!23829 m!95201))

(declare-fun m!96059 () Bool)

(assert (=> d!23829 m!96059))

(declare-fun m!96061 () Bool)

(assert (=> d!23829 m!96061))

(declare-fun m!96063 () Bool)

(assert (=> d!23829 m!96063))

(declare-fun m!96065 () Bool)

(assert (=> d!23829 m!96065))

(assert (=> d!23829 m!95507))

(assert (=> d!23829 m!95201))

(assert (=> d!23829 m!95521))

(declare-fun m!96067 () Bool)

(assert (=> d!23829 m!96067))

(assert (=> d!23829 m!95201))

(assert (=> d!23829 m!95511))

(declare-fun m!96069 () Bool)

(assert (=> d!23829 m!96069))

(declare-fun m!96071 () Bool)

(assert (=> d!23829 m!96071))

(declare-fun m!96073 () Bool)

(assert (=> d!23829 m!96073))

(assert (=> d!23829 m!95201))

(declare-fun m!96075 () Bool)

(assert (=> d!23829 m!96075))

(declare-fun m!96077 () Bool)

(assert (=> d!23829 m!96077))

(assert (=> d!23829 m!95201))

(declare-fun m!96079 () Bool)

(assert (=> d!23829 m!96079))

(assert (=> d!23829 m!95465))

(assert (=> d!23829 m!95201))

(declare-fun m!96081 () Bool)

(assert (=> d!23829 m!96081))

(assert (=> bm!8695 m!95201))

(assert (=> bm!8695 m!95497))

(declare-fun m!96083 () Bool)

(assert (=> b!89512 m!96083))

(declare-fun m!96085 () Bool)

(assert (=> b!89496 m!96085))

(declare-fun m!96087 () Bool)

(assert (=> b!89511 m!96087))

(assert (=> b!89505 m!96041))

(assert (=> b!89505 m!96041))

(assert (=> b!89505 m!95201))

(declare-fun m!96089 () Bool)

(assert (=> b!89505 m!96089))

(declare-fun m!96091 () Bool)

(assert (=> bm!8693 m!96091))

(assert (=> b!89498 m!95201))

(assert (=> b!89498 m!95519))

(assert (=> b!89508 m!95201))

(assert (=> b!89508 m!95483))

(declare-fun m!96093 () Bool)

(assert (=> b!89510 m!96093))

(assert (=> b!89502 m!95201))

(declare-fun m!96095 () Bool)

(assert (=> b!89502 m!96095))

(assert (=> b!89502 m!95507))

(assert (=> b!89502 m!95507))

(assert (=> b!89502 m!95201))

(assert (=> b!89502 m!95521))

(assert (=> bm!8623 d!23829))

(assert (=> bm!8645 d!23671))

(declare-fun d!23831 () Bool)

(declare-fun e!58264 () Bool)

(assert (=> d!23831 e!58264))

(declare-fun res!45763 () Bool)

(assert (=> d!23831 (=> res!45763 e!58264)))

(declare-fun lt!43076 () Bool)

(assert (=> d!23831 (= res!45763 (not lt!43076))))

(declare-fun lt!43079 () Bool)

(assert (=> d!23831 (= lt!43076 lt!43079)))

(declare-fun lt!43078 () Unit!2636)

(declare-fun e!58263 () Unit!2636)

(assert (=> d!23831 (= lt!43078 e!58263)))

(declare-fun c!14885 () Bool)

(assert (=> d!23831 (= c!14885 lt!43079)))

(assert (=> d!23831 (= lt!43079 (containsKey!146 (toList!750 lt!42613) (_1!1116 lt!42541)))))

(assert (=> d!23831 (= (contains!760 lt!42613 (_1!1116 lt!42541)) lt!43076)))

(declare-fun b!89513 () Bool)

(declare-fun lt!43077 () Unit!2636)

(assert (=> b!89513 (= e!58263 lt!43077)))

(assert (=> b!89513 (= lt!43077 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42613) (_1!1116 lt!42541)))))

(assert (=> b!89513 (isDefined!95 (getValueByKey!142 (toList!750 lt!42613) (_1!1116 lt!42541)))))

(declare-fun b!89514 () Bool)

(declare-fun Unit!2655 () Unit!2636)

(assert (=> b!89514 (= e!58263 Unit!2655)))

(declare-fun b!89515 () Bool)

(assert (=> b!89515 (= e!58264 (isDefined!95 (getValueByKey!142 (toList!750 lt!42613) (_1!1116 lt!42541))))))

(assert (= (and d!23831 c!14885) b!89513))

(assert (= (and d!23831 (not c!14885)) b!89514))

(assert (= (and d!23831 (not res!45763)) b!89515))

(declare-fun m!96097 () Bool)

(assert (=> d!23831 m!96097))

(declare-fun m!96099 () Bool)

(assert (=> b!89513 m!96099))

(assert (=> b!89513 m!95341))

(assert (=> b!89513 m!95341))

(declare-fun m!96101 () Bool)

(assert (=> b!89513 m!96101))

(assert (=> b!89515 m!95341))

(assert (=> b!89515 m!95341))

(assert (=> b!89515 m!96101))

(assert (=> d!23669 d!23831))

(declare-fun b!89516 () Bool)

(declare-fun e!58265 () Option!148)

(assert (=> b!89516 (= e!58265 (Some!147 (_2!1116 (h!2114 lt!42615))))))

(declare-fun d!23833 () Bool)

(declare-fun c!14886 () Bool)

(assert (=> d!23833 (= c!14886 (and ((_ is Cons!1522) lt!42615) (= (_1!1116 (h!2114 lt!42615)) (_1!1116 lt!42541))))))

(assert (=> d!23833 (= (getValueByKey!142 lt!42615 (_1!1116 lt!42541)) e!58265)))

(declare-fun b!89519 () Bool)

(declare-fun e!58266 () Option!148)

(assert (=> b!89519 (= e!58266 None!146)))

(declare-fun b!89518 () Bool)

(assert (=> b!89518 (= e!58266 (getValueByKey!142 (t!5284 lt!42615) (_1!1116 lt!42541)))))

(declare-fun b!89517 () Bool)

(assert (=> b!89517 (= e!58265 e!58266)))

(declare-fun c!14887 () Bool)

(assert (=> b!89517 (= c!14887 (and ((_ is Cons!1522) lt!42615) (not (= (_1!1116 (h!2114 lt!42615)) (_1!1116 lt!42541)))))))

(assert (= (and d!23833 c!14886) b!89516))

(assert (= (and d!23833 (not c!14886)) b!89517))

(assert (= (and b!89517 c!14887) b!89518))

(assert (= (and b!89517 (not c!14887)) b!89519))

(declare-fun m!96103 () Bool)

(assert (=> b!89518 m!96103))

(assert (=> d!23669 d!23833))

(declare-fun d!23835 () Bool)

(assert (=> d!23835 (= (getValueByKey!142 lt!42615 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(declare-fun lt!43080 () Unit!2636)

(assert (=> d!23835 (= lt!43080 (choose!531 lt!42615 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun e!58267 () Bool)

(assert (=> d!23835 e!58267))

(declare-fun res!45764 () Bool)

(assert (=> d!23835 (=> (not res!45764) (not e!58267))))

(assert (=> d!23835 (= res!45764 (isStrictlySorted!300 lt!42615))))

(assert (=> d!23835 (= (lemmaContainsTupThenGetReturnValue!59 lt!42615 (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!43080)))

(declare-fun b!89520 () Bool)

(declare-fun res!45765 () Bool)

(assert (=> b!89520 (=> (not res!45765) (not e!58267))))

(assert (=> b!89520 (= res!45765 (containsKey!146 lt!42615 (_1!1116 lt!42541)))))

(declare-fun b!89521 () Bool)

(assert (=> b!89521 (= e!58267 (contains!761 lt!42615 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(assert (= (and d!23835 res!45764) b!89520))

(assert (= (and b!89520 res!45765) b!89521))

(assert (=> d!23835 m!95335))

(declare-fun m!96105 () Bool)

(assert (=> d!23835 m!96105))

(declare-fun m!96107 () Bool)

(assert (=> d!23835 m!96107))

(declare-fun m!96109 () Bool)

(assert (=> b!89520 m!96109))

(declare-fun m!96111 () Bool)

(assert (=> b!89521 m!96111))

(assert (=> d!23669 d!23835))

(declare-fun b!89522 () Bool)

(declare-fun e!58268 () List!1526)

(declare-fun call!8701 () List!1526)

(assert (=> b!89522 (= e!58268 call!8701)))

(declare-fun b!89523 () Bool)

(declare-fun e!58272 () Bool)

(declare-fun lt!43081 () List!1526)

(assert (=> b!89523 (= e!58272 (contains!761 lt!43081 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(declare-fun b!89524 () Bool)

(declare-fun e!58271 () List!1526)

(declare-fun call!8700 () List!1526)

(assert (=> b!89524 (= e!58271 call!8700)))

(declare-fun bm!8697 () Bool)

(declare-fun call!8702 () List!1526)

(assert (=> bm!8697 (= call!8701 call!8702)))

(declare-fun b!89525 () Bool)

(declare-fun c!14889 () Bool)

(assert (=> b!89525 (= c!14889 (and ((_ is Cons!1522) (toList!750 lt!42530)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42541))))))

(declare-fun e!58270 () List!1526)

(assert (=> b!89525 (= e!58270 e!58268)))

(declare-fun b!89526 () Bool)

(declare-fun e!58269 () List!1526)

(assert (=> b!89526 (= e!58269 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42530)) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun bm!8699 () Bool)

(assert (=> bm!8699 (= call!8702 call!8700)))

(declare-fun c!14891 () Bool)

(declare-fun b!89527 () Bool)

(assert (=> b!89527 (= e!58269 (ite c!14891 (t!5284 (toList!750 lt!42530)) (ite c!14889 (Cons!1522 (h!2114 (toList!750 lt!42530)) (t!5284 (toList!750 lt!42530))) Nil!1523)))))

(declare-fun b!89528 () Bool)

(assert (=> b!89528 (= e!58270 call!8702)))

(declare-fun b!89529 () Bool)

(assert (=> b!89529 (= e!58271 e!58270)))

(assert (=> b!89529 (= c!14891 (and ((_ is Cons!1522) (toList!750 lt!42530)) (= (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42541))))))

(declare-fun c!14890 () Bool)

(declare-fun bm!8698 () Bool)

(assert (=> bm!8698 (= call!8700 ($colon$colon!74 e!58269 (ite c!14890 (h!2114 (toList!750 lt!42530)) (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541)))))))

(declare-fun c!14888 () Bool)

(assert (=> bm!8698 (= c!14888 c!14890)))

(declare-fun d!23837 () Bool)

(assert (=> d!23837 e!58272))

(declare-fun res!45766 () Bool)

(assert (=> d!23837 (=> (not res!45766) (not e!58272))))

(assert (=> d!23837 (= res!45766 (isStrictlySorted!300 lt!43081))))

(assert (=> d!23837 (= lt!43081 e!58271)))

(assert (=> d!23837 (= c!14890 (and ((_ is Cons!1522) (toList!750 lt!42530)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42541))))))

(assert (=> d!23837 (isStrictlySorted!300 (toList!750 lt!42530))))

(assert (=> d!23837 (= (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!43081)))

(declare-fun b!89530 () Bool)

(declare-fun res!45767 () Bool)

(assert (=> b!89530 (=> (not res!45767) (not e!58272))))

(assert (=> b!89530 (= res!45767 (containsKey!146 lt!43081 (_1!1116 lt!42541)))))

(declare-fun b!89531 () Bool)

(assert (=> b!89531 (= e!58268 call!8701)))

(assert (= (and d!23837 c!14890) b!89524))

(assert (= (and d!23837 (not c!14890)) b!89529))

(assert (= (and b!89529 c!14891) b!89528))

(assert (= (and b!89529 (not c!14891)) b!89525))

(assert (= (and b!89525 c!14889) b!89522))

(assert (= (and b!89525 (not c!14889)) b!89531))

(assert (= (or b!89522 b!89531) bm!8697))

(assert (= (or b!89528 bm!8697) bm!8699))

(assert (= (or b!89524 bm!8699) bm!8698))

(assert (= (and bm!8698 c!14888) b!89526))

(assert (= (and bm!8698 (not c!14888)) b!89527))

(assert (= (and d!23837 res!45766) b!89530))

(assert (= (and b!89530 res!45767) b!89523))

(declare-fun m!96113 () Bool)

(assert (=> b!89523 m!96113))

(declare-fun m!96115 () Bool)

(assert (=> b!89530 m!96115))

(declare-fun m!96117 () Bool)

(assert (=> bm!8698 m!96117))

(declare-fun m!96119 () Bool)

(assert (=> b!89526 m!96119))

(declare-fun m!96121 () Bool)

(assert (=> d!23837 m!96121))

(declare-fun m!96123 () Bool)

(assert (=> d!23837 m!96123))

(assert (=> d!23669 d!23837))

(declare-fun d!23839 () Bool)

(assert (=> d!23839 (= (+!113 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) lt!42736 (zeroValue!2261 newMap!16) lt!42545 #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43084 () Unit!2636)

(declare-fun choose!532 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 V!3043 Int) Unit!2636)

(assert (=> d!23839 (= lt!43084 (choose!532 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42736 (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) lt!42545 (defaultEntry!2372 newMap!16)))))

(assert (=> d!23839 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23839 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42736 (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) lt!42545 (defaultEntry!2372 newMap!16)) lt!43084)))

(declare-fun bs!3765 () Bool)

(assert (= bs!3765 d!23839))

(assert (=> bs!3765 m!95507))

(assert (=> bs!3765 m!95507))

(declare-fun m!96125 () Bool)

(assert (=> bs!3765 m!96125))

(assert (=> bs!3765 m!95621))

(declare-fun m!96127 () Bool)

(assert (=> bs!3765 m!96127))

(declare-fun m!96129 () Bool)

(assert (=> bs!3765 m!96129))

(assert (=> b!89107 d!23839))

(declare-fun d!23841 () Bool)

(assert (=> d!23841 (= (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89215 d!23841))

(declare-fun b!89532 () Bool)

(declare-fun e!58273 () Bool)

(declare-fun e!58274 () Bool)

(assert (=> b!89532 (= e!58273 e!58274)))

(declare-fun c!14892 () Bool)

(assert (=> b!89532 (= c!14892 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!89533 () Bool)

(declare-fun e!58275 () Bool)

(declare-fun call!8703 () Bool)

(assert (=> b!89533 (= e!58275 call!8703)))

(declare-fun bm!8700 () Bool)

(assert (=> bm!8700 (= call!8703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89534 () Bool)

(assert (=> b!89534 (= e!58274 e!58275)))

(declare-fun lt!43085 () (_ BitVec 64))

(assert (=> b!89534 (= lt!43085 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!43086 () Unit!2636)

(assert (=> b!89534 (= lt!43086 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!43085 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!89534 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!43085 #b00000000000000000000000000000000)))

(declare-fun lt!43087 () Unit!2636)

(assert (=> b!89534 (= lt!43087 lt!43086)))

(declare-fun res!45768 () Bool)

(assert (=> b!89534 (= res!45768 (= (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))) (Found!245 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!89534 (=> (not res!45768) (not e!58275))))

(declare-fun b!89535 () Bool)

(assert (=> b!89535 (= e!58274 call!8703)))

(declare-fun d!23843 () Bool)

(declare-fun res!45769 () Bool)

(assert (=> d!23843 (=> res!45769 e!58273)))

(assert (=> d!23843 (= res!45769 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23843 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))) e!58273)))

(assert (= (and d!23843 (not res!45769)) b!89532))

(assert (= (and b!89532 c!14892) b!89534))

(assert (= (and b!89532 (not c!14892)) b!89535))

(assert (= (and b!89534 res!45768) b!89533))

(assert (= (or b!89533 b!89535) bm!8700))

(declare-fun m!96131 () Bool)

(assert (=> b!89532 m!96131))

(assert (=> b!89532 m!96131))

(declare-fun m!96133 () Bool)

(assert (=> b!89532 m!96133))

(declare-fun m!96135 () Bool)

(assert (=> bm!8700 m!96135))

(assert (=> b!89534 m!96131))

(declare-fun m!96137 () Bool)

(assert (=> b!89534 m!96137))

(declare-fun m!96139 () Bool)

(assert (=> b!89534 m!96139))

(assert (=> b!89534 m!96131))

(declare-fun m!96141 () Bool)

(assert (=> b!89534 m!96141))

(assert (=> bm!8649 d!23843))

(declare-fun d!23845 () Bool)

(assert (=> d!23845 (= (+!113 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) lt!42748 lt!42545 (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43090 () Unit!2636)

(declare-fun choose!533 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 V!3043 Int) Unit!2636)

(assert (=> d!23845 (= lt!43090 (choose!533 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42748 (zeroValue!2261 newMap!16) lt!42545 (minValue!2261 newMap!16) (defaultEntry!2372 newMap!16)))))

(assert (=> d!23845 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23845 (= (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) lt!42748 (zeroValue!2261 newMap!16) lt!42545 (minValue!2261 newMap!16) (defaultEntry!2372 newMap!16)) lt!43090)))

(declare-fun bs!3766 () Bool)

(assert (= bs!3766 d!23845))

(assert (=> bs!3766 m!95621))

(declare-fun m!96143 () Bool)

(assert (=> bs!3766 m!96143))

(assert (=> bs!3766 m!95507))

(declare-fun m!96145 () Bool)

(assert (=> bs!3766 m!96145))

(declare-fun m!96147 () Bool)

(assert (=> bs!3766 m!96147))

(assert (=> bs!3766 m!95507))

(assert (=> b!89092 d!23845))

(declare-fun d!23847 () Bool)

(declare-fun e!58277 () Bool)

(assert (=> d!23847 e!58277))

(declare-fun res!45770 () Bool)

(assert (=> d!23847 (=> res!45770 e!58277)))

(declare-fun lt!43091 () Bool)

(assert (=> d!23847 (= res!45770 (not lt!43091))))

(declare-fun lt!43094 () Bool)

(assert (=> d!23847 (= lt!43091 lt!43094)))

(declare-fun lt!43093 () Unit!2636)

(declare-fun e!58276 () Unit!2636)

(assert (=> d!23847 (= lt!43093 e!58276)))

(declare-fun c!14893 () Bool)

(assert (=> d!23847 (= c!14893 lt!43094)))

(assert (=> d!23847 (= lt!43094 (containsKey!146 (toList!750 lt!42638) (_1!1116 lt!42540)))))

(assert (=> d!23847 (= (contains!760 lt!42638 (_1!1116 lt!42540)) lt!43091)))

(declare-fun b!89536 () Bool)

(declare-fun lt!43092 () Unit!2636)

(assert (=> b!89536 (= e!58276 lt!43092)))

(assert (=> b!89536 (= lt!43092 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42638) (_1!1116 lt!42540)))))

(assert (=> b!89536 (isDefined!95 (getValueByKey!142 (toList!750 lt!42638) (_1!1116 lt!42540)))))

(declare-fun b!89537 () Bool)

(declare-fun Unit!2656 () Unit!2636)

(assert (=> b!89537 (= e!58276 Unit!2656)))

(declare-fun b!89538 () Bool)

(assert (=> b!89538 (= e!58277 (isDefined!95 (getValueByKey!142 (toList!750 lt!42638) (_1!1116 lt!42540))))))

(assert (= (and d!23847 c!14893) b!89536))

(assert (= (and d!23847 (not c!14893)) b!89537))

(assert (= (and d!23847 (not res!45770)) b!89538))

(declare-fun m!96149 () Bool)

(assert (=> d!23847 m!96149))

(declare-fun m!96151 () Bool)

(assert (=> b!89536 m!96151))

(assert (=> b!89536 m!95381))

(assert (=> b!89536 m!95381))

(declare-fun m!96153 () Bool)

(assert (=> b!89536 m!96153))

(assert (=> b!89538 m!95381))

(assert (=> b!89538 m!95381))

(assert (=> b!89538 m!96153))

(assert (=> d!23673 d!23847))

(declare-fun b!89539 () Bool)

(declare-fun e!58278 () Option!148)

(assert (=> b!89539 (= e!58278 (Some!147 (_2!1116 (h!2114 lt!42640))))))

(declare-fun d!23849 () Bool)

(declare-fun c!14894 () Bool)

(assert (=> d!23849 (= c!14894 (and ((_ is Cons!1522) lt!42640) (= (_1!1116 (h!2114 lt!42640)) (_1!1116 lt!42540))))))

(assert (=> d!23849 (= (getValueByKey!142 lt!42640 (_1!1116 lt!42540)) e!58278)))

(declare-fun b!89542 () Bool)

(declare-fun e!58279 () Option!148)

(assert (=> b!89542 (= e!58279 None!146)))

(declare-fun b!89541 () Bool)

(assert (=> b!89541 (= e!58279 (getValueByKey!142 (t!5284 lt!42640) (_1!1116 lt!42540)))))

(declare-fun b!89540 () Bool)

(assert (=> b!89540 (= e!58278 e!58279)))

(declare-fun c!14895 () Bool)

(assert (=> b!89540 (= c!14895 (and ((_ is Cons!1522) lt!42640) (not (= (_1!1116 (h!2114 lt!42640)) (_1!1116 lt!42540)))))))

(assert (= (and d!23849 c!14894) b!89539))

(assert (= (and d!23849 (not c!14894)) b!89540))

(assert (= (and b!89540 c!14895) b!89541))

(assert (= (and b!89540 (not c!14895)) b!89542))

(declare-fun m!96155 () Bool)

(assert (=> b!89541 m!96155))

(assert (=> d!23673 d!23849))

(declare-fun d!23851 () Bool)

(assert (=> d!23851 (= (getValueByKey!142 lt!42640 (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540)))))

(declare-fun lt!43095 () Unit!2636)

(assert (=> d!23851 (= lt!43095 (choose!531 lt!42640 (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(declare-fun e!58280 () Bool)

(assert (=> d!23851 e!58280))

(declare-fun res!45771 () Bool)

(assert (=> d!23851 (=> (not res!45771) (not e!58280))))

(assert (=> d!23851 (= res!45771 (isStrictlySorted!300 lt!42640))))

(assert (=> d!23851 (= (lemmaContainsTupThenGetReturnValue!59 lt!42640 (_1!1116 lt!42540) (_2!1116 lt!42540)) lt!43095)))

(declare-fun b!89543 () Bool)

(declare-fun res!45772 () Bool)

(assert (=> b!89543 (=> (not res!45772) (not e!58280))))

(assert (=> b!89543 (= res!45772 (containsKey!146 lt!42640 (_1!1116 lt!42540)))))

(declare-fun b!89544 () Bool)

(assert (=> b!89544 (= e!58280 (contains!761 lt!42640 (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540))))))

(assert (= (and d!23851 res!45771) b!89543))

(assert (= (and b!89543 res!45772) b!89544))

(assert (=> d!23851 m!95375))

(declare-fun m!96157 () Bool)

(assert (=> d!23851 m!96157))

(declare-fun m!96159 () Bool)

(assert (=> d!23851 m!96159))

(declare-fun m!96161 () Bool)

(assert (=> b!89543 m!96161))

(declare-fun m!96163 () Bool)

(assert (=> b!89544 m!96163))

(assert (=> d!23673 d!23851))

(declare-fun b!89545 () Bool)

(declare-fun e!58281 () List!1526)

(declare-fun call!8705 () List!1526)

(assert (=> b!89545 (= e!58281 call!8705)))

(declare-fun b!89546 () Bool)

(declare-fun e!58285 () Bool)

(declare-fun lt!43096 () List!1526)

(assert (=> b!89546 (= e!58285 (contains!761 lt!43096 (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540))))))

(declare-fun b!89547 () Bool)

(declare-fun e!58284 () List!1526)

(declare-fun call!8704 () List!1526)

(assert (=> b!89547 (= e!58284 call!8704)))

(declare-fun bm!8701 () Bool)

(declare-fun call!8706 () List!1526)

(assert (=> bm!8701 (= call!8705 call!8706)))

(declare-fun b!89548 () Bool)

(declare-fun c!14897 () Bool)

(assert (=> b!89548 (= c!14897 (and ((_ is Cons!1522) (toList!750 lt!42537)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42540))))))

(declare-fun e!58283 () List!1526)

(assert (=> b!89548 (= e!58283 e!58281)))

(declare-fun b!89549 () Bool)

(declare-fun e!58282 () List!1526)

(assert (=> b!89549 (= e!58282 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42537)) (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(declare-fun bm!8703 () Bool)

(assert (=> bm!8703 (= call!8706 call!8704)))

(declare-fun c!14899 () Bool)

(declare-fun b!89550 () Bool)

(assert (=> b!89550 (= e!58282 (ite c!14899 (t!5284 (toList!750 lt!42537)) (ite c!14897 (Cons!1522 (h!2114 (toList!750 lt!42537)) (t!5284 (toList!750 lt!42537))) Nil!1523)))))

(declare-fun b!89551 () Bool)

(assert (=> b!89551 (= e!58283 call!8706)))

(declare-fun b!89552 () Bool)

(assert (=> b!89552 (= e!58284 e!58283)))

(assert (=> b!89552 (= c!14899 (and ((_ is Cons!1522) (toList!750 lt!42537)) (= (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42540))))))

(declare-fun c!14898 () Bool)

(declare-fun bm!8702 () Bool)

(assert (=> bm!8702 (= call!8704 ($colon$colon!74 e!58282 (ite c!14898 (h!2114 (toList!750 lt!42537)) (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540)))))))

(declare-fun c!14896 () Bool)

(assert (=> bm!8702 (= c!14896 c!14898)))

(declare-fun d!23853 () Bool)

(assert (=> d!23853 e!58285))

(declare-fun res!45773 () Bool)

(assert (=> d!23853 (=> (not res!45773) (not e!58285))))

(assert (=> d!23853 (= res!45773 (isStrictlySorted!300 lt!43096))))

(assert (=> d!23853 (= lt!43096 e!58284)))

(assert (=> d!23853 (= c!14898 (and ((_ is Cons!1522) (toList!750 lt!42537)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42537))) (_1!1116 lt!42540))))))

(assert (=> d!23853 (isStrictlySorted!300 (toList!750 lt!42537))))

(assert (=> d!23853 (= (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 lt!42540) (_2!1116 lt!42540)) lt!43096)))

(declare-fun b!89553 () Bool)

(declare-fun res!45774 () Bool)

(assert (=> b!89553 (=> (not res!45774) (not e!58285))))

(assert (=> b!89553 (= res!45774 (containsKey!146 lt!43096 (_1!1116 lt!42540)))))

(declare-fun b!89554 () Bool)

(assert (=> b!89554 (= e!58281 call!8705)))

(assert (= (and d!23853 c!14898) b!89547))

(assert (= (and d!23853 (not c!14898)) b!89552))

(assert (= (and b!89552 c!14899) b!89551))

(assert (= (and b!89552 (not c!14899)) b!89548))

(assert (= (and b!89548 c!14897) b!89545))

(assert (= (and b!89548 (not c!14897)) b!89554))

(assert (= (or b!89545 b!89554) bm!8701))

(assert (= (or b!89551 bm!8701) bm!8703))

(assert (= (or b!89547 bm!8703) bm!8702))

(assert (= (and bm!8702 c!14896) b!89549))

(assert (= (and bm!8702 (not c!14896)) b!89550))

(assert (= (and d!23853 res!45773) b!89553))

(assert (= (and b!89553 res!45774) b!89546))

(declare-fun m!96165 () Bool)

(assert (=> b!89546 m!96165))

(declare-fun m!96167 () Bool)

(assert (=> b!89553 m!96167))

(declare-fun m!96169 () Bool)

(assert (=> bm!8702 m!96169))

(declare-fun m!96171 () Bool)

(assert (=> b!89549 m!96171))

(declare-fun m!96173 () Bool)

(assert (=> d!23853 m!96173))

(assert (=> d!23853 m!96027))

(assert (=> d!23673 d!23853))

(assert (=> b!89216 d!23841))

(declare-fun d!23855 () Bool)

(assert (=> d!23855 (= (apply!84 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1211 (getValueByKey!142 (toList!750 lt!42811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3767 () Bool)

(assert (= bs!3767 d!23855))

(declare-fun m!96175 () Bool)

(assert (=> bs!3767 m!96175))

(assert (=> bs!3767 m!96175))

(declare-fun m!96177 () Bool)

(assert (=> bs!3767 m!96177))

(assert (=> b!89172 d!23855))

(assert (=> b!89188 d!23793))

(declare-fun d!23857 () Bool)

(declare-fun e!58288 () Bool)

(assert (=> d!23857 e!58288))

(declare-fun c!14902 () Bool)

(assert (=> d!23857 (= c!14902 (and (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23857 true))

(declare-fun _$29!114 () Unit!2636)

(assert (=> d!23857 (= (choose!527 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (_values!2355 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992))) (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) (zeroValue!2261 (v!2674 (underlying!295 thiss!992))) (minValue!2261 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992)))) _$29!114)))

(declare-fun b!89559 () Bool)

(assert (=> b!89559 (= e!58288 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!89560 () Bool)

(assert (=> b!89560 (= e!58288 (ite (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2205 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23857 c!14902) b!89559))

(assert (= (and d!23857 (not c!14902)) b!89560))

(assert (=> b!89559 m!95201))

(assert (=> b!89559 m!95225))

(assert (=> d!23721 d!23857))

(assert (=> d!23721 d!23685))

(declare-fun d!23859 () Bool)

(declare-fun e!58289 () Bool)

(assert (=> d!23859 e!58289))

(declare-fun res!45775 () Bool)

(assert (=> d!23859 (=> (not res!45775) (not e!58289))))

(declare-fun lt!43098 () ListLongMap!1469)

(assert (=> d!23859 (= res!45775 (contains!760 lt!43098 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!43100 () List!1526)

(assert (=> d!23859 (= lt!43098 (ListLongMap!1470 lt!43100))))

(declare-fun lt!43099 () Unit!2636)

(declare-fun lt!43097 () Unit!2636)

(assert (=> d!23859 (= lt!43099 lt!43097)))

(assert (=> d!23859 (= (getValueByKey!142 lt!43100 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23859 (= lt!43097 (lemmaContainsTupThenGetReturnValue!59 lt!43100 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23859 (= lt!43100 (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23859 (= (+!113 lt!42537 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!43098)))

(declare-fun b!89561 () Bool)

(declare-fun res!45776 () Bool)

(assert (=> b!89561 (=> (not res!45776) (not e!58289))))

(assert (=> b!89561 (= res!45776 (= (getValueByKey!142 (toList!750 lt!43098) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89562 () Bool)

(assert (=> b!89562 (= e!58289 (contains!761 (toList!750 lt!43098) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23859 res!45775) b!89561))

(assert (= (and b!89561 res!45776) b!89562))

(declare-fun m!96179 () Bool)

(assert (=> d!23859 m!96179))

(declare-fun m!96181 () Bool)

(assert (=> d!23859 m!96181))

(declare-fun m!96183 () Bool)

(assert (=> d!23859 m!96183))

(declare-fun m!96185 () Bool)

(assert (=> d!23859 m!96185))

(declare-fun m!96187 () Bool)

(assert (=> b!89561 m!96187))

(declare-fun m!96189 () Bool)

(assert (=> b!89562 m!96189))

(assert (=> d!23675 d!23859))

(declare-fun d!23861 () Bool)

(assert (=> d!23861 (= (+!113 (+!113 lt!42537 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (+!113 (+!113 lt!42537 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (=> d!23861 true))

(declare-fun _$28!151 () Unit!2636)

(assert (=> d!23861 (= (choose!526 lt!42537 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) _$28!151)))

(declare-fun bs!3768 () Bool)

(assert (= bs!3768 d!23861))

(assert (=> bs!3768 m!95385))

(assert (=> bs!3768 m!95385))

(assert (=> bs!3768 m!95387))

(assert (=> bs!3768 m!95389))

(assert (=> bs!3768 m!95389))

(assert (=> bs!3768 m!95391))

(assert (=> d!23675 d!23861))

(declare-fun d!23863 () Bool)

(declare-fun e!58290 () Bool)

(assert (=> d!23863 e!58290))

(declare-fun res!45777 () Bool)

(assert (=> d!23863 (=> (not res!45777) (not e!58290))))

(declare-fun lt!43102 () ListLongMap!1469)

(assert (=> d!23863 (= res!45777 (contains!760 lt!43102 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun lt!43104 () List!1526)

(assert (=> d!23863 (= lt!43102 (ListLongMap!1470 lt!43104))))

(declare-fun lt!43103 () Unit!2636)

(declare-fun lt!43101 () Unit!2636)

(assert (=> d!23863 (= lt!43103 lt!43101)))

(assert (=> d!23863 (= (getValueByKey!142 lt!43104 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23863 (= lt!43101 (lemmaContainsTupThenGetReturnValue!59 lt!43104 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23863 (= lt!43104 (insertStrictlySorted!62 (toList!750 lt!42537) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23863 (= (+!113 lt!42537 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) lt!43102)))

(declare-fun b!89563 () Bool)

(declare-fun res!45778 () Bool)

(assert (=> b!89563 (=> (not res!45778) (not e!58290))))

(assert (=> b!89563 (= res!45778 (= (getValueByKey!142 (toList!750 lt!43102) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun b!89564 () Bool)

(assert (=> b!89564 (= e!58290 (contains!761 (toList!750 lt!43102) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (= (and d!23863 res!45777) b!89563))

(assert (= (and b!89563 res!45778) b!89564))

(declare-fun m!96191 () Bool)

(assert (=> d!23863 m!96191))

(declare-fun m!96193 () Bool)

(assert (=> d!23863 m!96193))

(declare-fun m!96195 () Bool)

(assert (=> d!23863 m!96195))

(declare-fun m!96197 () Bool)

(assert (=> d!23863 m!96197))

(declare-fun m!96199 () Bool)

(assert (=> b!89563 m!96199))

(declare-fun m!96201 () Bool)

(assert (=> b!89564 m!96201))

(assert (=> d!23675 d!23863))

(declare-fun d!23865 () Bool)

(declare-fun e!58291 () Bool)

(assert (=> d!23865 e!58291))

(declare-fun res!45779 () Bool)

(assert (=> d!23865 (=> (not res!45779) (not e!58291))))

(declare-fun lt!43106 () ListLongMap!1469)

(assert (=> d!23865 (= res!45779 (contains!760 lt!43106 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(declare-fun lt!43108 () List!1526)

(assert (=> d!23865 (= lt!43106 (ListLongMap!1470 lt!43108))))

(declare-fun lt!43107 () Unit!2636)

(declare-fun lt!43105 () Unit!2636)

(assert (=> d!23865 (= lt!43107 lt!43105)))

(assert (=> d!23865 (= (getValueByKey!142 lt!43108 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23865 (= lt!43105 (lemmaContainsTupThenGetReturnValue!59 lt!43108 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23865 (= lt!43108 (insertStrictlySorted!62 (toList!750 (+!113 lt!42537 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (=> d!23865 (= (+!113 (+!113 lt!42537 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) lt!43106)))

(declare-fun b!89565 () Bool)

(declare-fun res!45780 () Bool)

(assert (=> b!89565 (=> (not res!45780) (not e!58291))))

(assert (=> b!89565 (= res!45780 (= (getValueByKey!142 (toList!750 lt!43106) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (Some!147 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun b!89566 () Bool)

(assert (=> b!89566 (= e!58291 (contains!761 (toList!750 lt!43106) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))))))

(assert (= (and d!23865 res!45779) b!89565))

(assert (= (and b!89565 res!45780) b!89566))

(declare-fun m!96203 () Bool)

(assert (=> d!23865 m!96203))

(declare-fun m!96205 () Bool)

(assert (=> d!23865 m!96205))

(declare-fun m!96207 () Bool)

(assert (=> d!23865 m!96207))

(declare-fun m!96209 () Bool)

(assert (=> d!23865 m!96209))

(declare-fun m!96211 () Bool)

(assert (=> b!89565 m!96211))

(declare-fun m!96213 () Bool)

(assert (=> b!89566 m!96213))

(assert (=> d!23675 d!23865))

(declare-fun d!23867 () Bool)

(declare-fun e!58292 () Bool)

(assert (=> d!23867 e!58292))

(declare-fun res!45781 () Bool)

(assert (=> d!23867 (=> (not res!45781) (not e!58292))))

(declare-fun lt!43110 () ListLongMap!1469)

(assert (=> d!23867 (= res!45781 (contains!760 lt!43110 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(declare-fun lt!43112 () List!1526)

(assert (=> d!23867 (= lt!43110 (ListLongMap!1470 lt!43112))))

(declare-fun lt!43111 () Unit!2636)

(declare-fun lt!43109 () Unit!2636)

(assert (=> d!23867 (= lt!43111 lt!43109)))

(assert (=> d!23867 (= (getValueByKey!142 lt!43112 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23867 (= lt!43109 (lemmaContainsTupThenGetReturnValue!59 lt!43112 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23867 (= lt!43112 (insertStrictlySorted!62 (toList!750 (+!113 lt!42537 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))))) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (=> d!23867 (= (+!113 (+!113 lt!42537 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992))))) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) lt!43110)))

(declare-fun b!89567 () Bool)

(declare-fun res!45782 () Bool)

(assert (=> b!89567 (=> (not res!45782) (not e!58292))))

(assert (=> b!89567 (= res!45782 (= (getValueByKey!142 (toList!750 lt!43110) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun b!89568 () Bool)

(assert (=> b!89568 (= e!58292 (contains!761 (toList!750 lt!43110) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))

(assert (= (and d!23867 res!45781) b!89567))

(assert (= (and b!89567 res!45782) b!89568))

(declare-fun m!96215 () Bool)

(assert (=> d!23867 m!96215))

(declare-fun m!96217 () Bool)

(assert (=> d!23867 m!96217))

(declare-fun m!96219 () Bool)

(assert (=> d!23867 m!96219))

(declare-fun m!96221 () Bool)

(assert (=> d!23867 m!96221))

(declare-fun m!96223 () Bool)

(assert (=> b!89567 m!96223))

(declare-fun m!96225 () Bool)

(assert (=> b!89568 m!96225))

(assert (=> d!23675 d!23867))

(assert (=> b!88950 d!23733))

(declare-fun d!23869 () Bool)

(declare-fun e!58294 () Bool)

(assert (=> d!23869 e!58294))

(declare-fun res!45783 () Bool)

(assert (=> d!23869 (=> res!45783 e!58294)))

(declare-fun lt!43113 () Bool)

(assert (=> d!23869 (= res!45783 (not lt!43113))))

(declare-fun lt!43116 () Bool)

(assert (=> d!23869 (= lt!43113 lt!43116)))

(declare-fun lt!43115 () Unit!2636)

(declare-fun e!58293 () Unit!2636)

(assert (=> d!23869 (= lt!43115 e!58293)))

(declare-fun c!14903 () Bool)

(assert (=> d!23869 (= c!14903 lt!43116)))

(assert (=> d!23869 (= lt!43116 (containsKey!146 (toList!750 lt!42811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23869 (= (contains!760 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000) lt!43113)))

(declare-fun b!89569 () Bool)

(declare-fun lt!43114 () Unit!2636)

(assert (=> b!89569 (= e!58293 lt!43114)))

(assert (=> b!89569 (= lt!43114 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89569 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89570 () Bool)

(declare-fun Unit!2657 () Unit!2636)

(assert (=> b!89570 (= e!58293 Unit!2657)))

(declare-fun b!89571 () Bool)

(assert (=> b!89571 (= e!58294 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23869 c!14903) b!89569))

(assert (= (and d!23869 (not c!14903)) b!89570))

(assert (= (and d!23869 (not res!45783)) b!89571))

(declare-fun m!96227 () Bool)

(assert (=> d!23869 m!96227))

(declare-fun m!96229 () Bool)

(assert (=> b!89569 m!96229))

(declare-fun m!96231 () Bool)

(assert (=> b!89569 m!96231))

(assert (=> b!89569 m!96231))

(declare-fun m!96233 () Bool)

(assert (=> b!89569 m!96233))

(assert (=> b!89571 m!96231))

(assert (=> b!89571 m!96231))

(assert (=> b!89571 m!96233))

(assert (=> bm!8642 d!23869))

(declare-fun d!23871 () Bool)

(declare-fun e!58296 () Bool)

(assert (=> d!23871 e!58296))

(declare-fun res!45784 () Bool)

(assert (=> d!23871 (=> res!45784 e!58296)))

(declare-fun lt!43117 () Bool)

(assert (=> d!23871 (= res!45784 (not lt!43117))))

(declare-fun lt!43120 () Bool)

(assert (=> d!23871 (= lt!43117 lt!43120)))

(declare-fun lt!43119 () Unit!2636)

(declare-fun e!58295 () Unit!2636)

(assert (=> d!23871 (= lt!43119 e!58295)))

(declare-fun c!14904 () Bool)

(assert (=> d!23871 (= c!14904 lt!43120)))

(assert (=> d!23871 (= lt!43120 (containsKey!146 (toList!750 lt!42633) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23871 (= (contains!760 lt!42633 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!43117)))

(declare-fun b!89572 () Bool)

(declare-fun lt!43118 () Unit!2636)

(assert (=> b!89572 (= e!58295 lt!43118)))

(assert (=> b!89572 (= lt!43118 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42633) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89572 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89573 () Bool)

(declare-fun Unit!2658 () Unit!2636)

(assert (=> b!89573 (= e!58295 Unit!2658)))

(declare-fun b!89574 () Bool)

(assert (=> b!89574 (= e!58296 (isDefined!95 (getValueByKey!142 (toList!750 lt!42633) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23871 c!14904) b!89572))

(assert (= (and d!23871 (not c!14904)) b!89573))

(assert (= (and d!23871 (not res!45784)) b!89574))

(assert (=> d!23871 m!95353))

(declare-fun m!96235 () Bool)

(assert (=> d!23871 m!96235))

(assert (=> b!89572 m!95353))

(declare-fun m!96237 () Bool)

(assert (=> b!89572 m!96237))

(assert (=> b!89572 m!95353))

(declare-fun m!96239 () Bool)

(assert (=> b!89572 m!96239))

(assert (=> b!89572 m!96239))

(declare-fun m!96241 () Bool)

(assert (=> b!89572 m!96241))

(assert (=> b!89574 m!95353))

(assert (=> b!89574 m!96239))

(assert (=> b!89574 m!96239))

(assert (=> b!89574 m!96241))

(assert (=> b!88944 d!23871))

(declare-fun d!23873 () Bool)

(declare-fun lt!43123 () Bool)

(declare-fun content!94 (List!1527) (InoxSet (_ BitVec 64)))

(assert (=> d!23873 (= lt!43123 (select (content!94 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!58301 () Bool)

(assert (=> d!23873 (= lt!43123 e!58301)))

(declare-fun res!45789 () Bool)

(assert (=> d!23873 (=> (not res!45789) (not e!58301))))

(assert (=> d!23873 (= res!45789 ((_ is Cons!1523) Nil!1524))))

(assert (=> d!23873 (= (contains!762 Nil!1524 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)) lt!43123)))

(declare-fun b!89579 () Bool)

(declare-fun e!58302 () Bool)

(assert (=> b!89579 (= e!58301 e!58302)))

(declare-fun res!45790 () Bool)

(assert (=> b!89579 (=> res!45790 e!58302)))

(assert (=> b!89579 (= res!45790 (= (h!2115 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89580 () Bool)

(assert (=> b!89580 (= e!58302 (contains!762 (t!5285 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23873 res!45789) b!89579))

(assert (= (and b!89579 (not res!45790)) b!89580))

(declare-fun m!96243 () Bool)

(assert (=> d!23873 m!96243))

(assert (=> d!23873 m!95455))

(declare-fun m!96245 () Bool)

(assert (=> d!23873 m!96245))

(assert (=> b!89580 m!95455))

(declare-fun m!96247 () Bool)

(assert (=> b!89580 m!96247))

(assert (=> b!88977 d!23873))

(declare-fun d!23875 () Bool)

(assert (=> d!23875 (= (inRange!0 (ite c!14775 (ite c!14781 (index!3120 lt!42743) (ite c!14783 (index!3119 lt!42745) (index!3122 lt!42745))) (ite c!14777 (index!3120 lt!42733) (ite c!14772 (index!3119 lt!42754) (index!3122 lt!42754)))) (mask!6416 newMap!16)) (and (bvsge (ite c!14775 (ite c!14781 (index!3120 lt!42743) (ite c!14783 (index!3119 lt!42745) (index!3122 lt!42745))) (ite c!14777 (index!3120 lt!42733) (ite c!14772 (index!3119 lt!42754) (index!3122 lt!42754)))) #b00000000000000000000000000000000) (bvslt (ite c!14775 (ite c!14781 (index!3120 lt!42743) (ite c!14783 (index!3119 lt!42745) (index!3122 lt!42745))) (ite c!14777 (index!3120 lt!42733) (ite c!14772 (index!3119 lt!42754) (index!3122 lt!42754)))) (bvadd (mask!6416 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8609 d!23875))

(declare-fun b!89581 () Bool)

(declare-fun e!58303 () Option!148)

(assert (=> b!89581 (= e!58303 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42659)))))))

(declare-fun d!23877 () Bool)

(declare-fun c!14905 () Bool)

(assert (=> d!23877 (= c!14905 (and ((_ is Cons!1522) (toList!750 lt!42659)) (= (_1!1116 (h!2114 (toList!750 lt!42659))) (_1!1116 lt!42541))))))

(assert (=> d!23877 (= (getValueByKey!142 (toList!750 lt!42659) (_1!1116 lt!42541)) e!58303)))

(declare-fun b!89584 () Bool)

(declare-fun e!58304 () Option!148)

(assert (=> b!89584 (= e!58304 None!146)))

(declare-fun b!89583 () Bool)

(assert (=> b!89583 (= e!58304 (getValueByKey!142 (t!5284 (toList!750 lt!42659)) (_1!1116 lt!42541)))))

(declare-fun b!89582 () Bool)

(assert (=> b!89582 (= e!58303 e!58304)))

(declare-fun c!14906 () Bool)

(assert (=> b!89582 (= c!14906 (and ((_ is Cons!1522) (toList!750 lt!42659)) (not (= (_1!1116 (h!2114 (toList!750 lt!42659))) (_1!1116 lt!42541)))))))

(assert (= (and d!23877 c!14905) b!89581))

(assert (= (and d!23877 (not c!14905)) b!89582))

(assert (= (and b!89582 c!14906) b!89583))

(assert (= (and b!89582 (not c!14906)) b!89584))

(declare-fun m!96249 () Bool)

(assert (=> b!89583 m!96249))

(assert (=> b!88961 d!23877))

(declare-fun d!23879 () Bool)

(declare-fun e!58306 () Bool)

(assert (=> d!23879 e!58306))

(declare-fun res!45791 () Bool)

(assert (=> d!23879 (=> res!45791 e!58306)))

(declare-fun lt!43124 () Bool)

(assert (=> d!23879 (= res!45791 (not lt!43124))))

(declare-fun lt!43127 () Bool)

(assert (=> d!23879 (= lt!43124 lt!43127)))

(declare-fun lt!43126 () Unit!2636)

(declare-fun e!58305 () Unit!2636)

(assert (=> d!23879 (= lt!43126 e!58305)))

(declare-fun c!14907 () Bool)

(assert (=> d!23879 (= c!14907 lt!43127)))

(assert (=> d!23879 (= lt!43127 (containsKey!146 (toList!750 lt!42811) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23879 (= (contains!760 lt!42811 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!43124)))

(declare-fun b!89585 () Bool)

(declare-fun lt!43125 () Unit!2636)

(assert (=> b!89585 (= e!58305 lt!43125)))

(assert (=> b!89585 (= lt!43125 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42811) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89585 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89586 () Bool)

(declare-fun Unit!2659 () Unit!2636)

(assert (=> b!89586 (= e!58305 Unit!2659)))

(declare-fun b!89587 () Bool)

(assert (=> b!89587 (= e!58306 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23879 c!14907) b!89585))

(assert (= (and d!23879 (not c!14907)) b!89586))

(assert (= (and d!23879 (not res!45791)) b!89587))

(assert (=> d!23879 m!95353))

(declare-fun m!96251 () Bool)

(assert (=> d!23879 m!96251))

(assert (=> b!89585 m!95353))

(declare-fun m!96253 () Bool)

(assert (=> b!89585 m!96253))

(assert (=> b!89585 m!95353))

(declare-fun m!96255 () Bool)

(assert (=> b!89585 m!96255))

(assert (=> b!89585 m!96255))

(declare-fun m!96257 () Bool)

(assert (=> b!89585 m!96257))

(assert (=> b!89587 m!95353))

(assert (=> b!89587 m!96255))

(assert (=> b!89587 m!96255))

(assert (=> b!89587 m!96257))

(assert (=> b!89183 d!23879))

(declare-fun b!89588 () Bool)

(declare-fun e!58307 () Bool)

(declare-fun call!8712 () Bool)

(assert (=> b!89588 (= e!58307 (not call!8712))))

(declare-fun b!89589 () Bool)

(declare-fun e!58317 () Bool)

(assert (=> b!89589 (= e!58307 e!58317)))

(declare-fun res!45800 () Bool)

(assert (=> b!89589 (= res!45800 call!8712)))

(assert (=> b!89589 (=> (not res!45800) (not e!58317))))

(declare-fun bm!8704 () Bool)

(declare-fun lt!43140 () ListLongMap!1469)

(assert (=> bm!8704 (= call!8712 (contains!760 lt!43140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89590 () Bool)

(assert (=> b!89590 (= e!58317 (= (apply!84 lt!43140 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2261 newMap!16)))))

(declare-fun c!14910 () Bool)

(declare-fun call!8710 () ListLongMap!1469)

(declare-fun c!14912 () Bool)

(declare-fun bm!8705 () Bool)

(declare-fun call!8713 () ListLongMap!1469)

(declare-fun call!8708 () ListLongMap!1469)

(declare-fun call!8709 () ListLongMap!1469)

(assert (=> bm!8705 (= call!8713 (+!113 (ite c!14910 call!8710 (ite c!14912 call!8708 call!8709)) (ite (or c!14910 c!14912) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 newMap!16)))))))

(declare-fun bm!8706 () Bool)

(declare-fun call!8707 () Bool)

(assert (=> bm!8706 (= call!8707 (contains!760 lt!43140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8707 () Bool)

(declare-fun call!8711 () ListLongMap!1469)

(assert (=> bm!8707 (= call!8711 call!8713)))

(declare-fun b!89591 () Bool)

(declare-fun e!58315 () ListLongMap!1469)

(assert (=> b!89591 (= e!58315 call!8711)))

(declare-fun b!89592 () Bool)

(declare-fun e!58310 () Unit!2636)

(declare-fun Unit!2660 () Unit!2636)

(assert (=> b!89592 (= e!58310 Unit!2660)))

(declare-fun d!23881 () Bool)

(declare-fun e!58308 () Bool)

(assert (=> d!23881 e!58308))

(declare-fun res!45797 () Bool)

(assert (=> d!23881 (=> (not res!45797) (not e!58308))))

(assert (=> d!23881 (= res!45797 (or (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))))

(declare-fun lt!43146 () ListLongMap!1469)

(assert (=> d!23881 (= lt!43140 lt!43146)))

(declare-fun lt!43128 () Unit!2636)

(assert (=> d!23881 (= lt!43128 e!58310)))

(declare-fun c!14908 () Bool)

(declare-fun e!58313 () Bool)

(assert (=> d!23881 (= c!14908 e!58313)))

(declare-fun res!45795 () Bool)

(assert (=> d!23881 (=> (not res!45795) (not e!58313))))

(assert (=> d!23881 (= res!45795 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun e!58309 () ListLongMap!1469)

(assert (=> d!23881 (= lt!43146 e!58309)))

(assert (=> d!23881 (= c!14910 (and (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23881 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23881 (= (getCurrentListMap!443 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) lt!43140)))

(declare-fun bm!8708 () Bool)

(assert (=> bm!8708 (= call!8709 call!8708)))

(declare-fun b!89593 () Bool)

(declare-fun res!45799 () Bool)

(assert (=> b!89593 (=> (not res!45799) (not e!58308))))

(declare-fun e!58312 () Bool)

(assert (=> b!89593 (= res!45799 e!58312)))

(declare-fun c!14909 () Bool)

(assert (=> b!89593 (= c!14909 (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8709 () Bool)

(assert (=> bm!8709 (= call!8710 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun b!89594 () Bool)

(declare-fun res!45794 () Bool)

(assert (=> b!89594 (=> (not res!45794) (not e!58308))))

(declare-fun e!58311 () Bool)

(assert (=> b!89594 (= res!45794 e!58311)))

(declare-fun res!45793 () Bool)

(assert (=> b!89594 (=> res!45793 e!58311)))

(declare-fun e!58318 () Bool)

(assert (=> b!89594 (= res!45793 (not e!58318))))

(declare-fun res!45798 () Bool)

(assert (=> b!89594 (=> (not res!45798) (not e!58318))))

(assert (=> b!89594 (= res!45798 (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89595 () Bool)

(declare-fun e!58316 () Bool)

(assert (=> b!89595 (= e!58316 (= (apply!84 lt!43140 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16))))))

(declare-fun b!89596 () Bool)

(assert (=> b!89596 (= e!58309 (+!113 call!8713 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 newMap!16))))))

(declare-fun b!89597 () Bool)

(declare-fun e!58319 () ListLongMap!1469)

(assert (=> b!89597 (= e!58319 call!8711)))

(declare-fun b!89598 () Bool)

(assert (=> b!89598 (= e!58313 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89599 () Bool)

(assert (=> b!89599 (= e!58312 e!58316)))

(declare-fun res!45796 () Bool)

(assert (=> b!89599 (= res!45796 call!8707)))

(assert (=> b!89599 (=> (not res!45796) (not e!58316))))

(declare-fun b!89600 () Bool)

(assert (=> b!89600 (= e!58315 call!8709)))

(declare-fun b!89601 () Bool)

(declare-fun e!58314 () Bool)

(assert (=> b!89601 (= e!58311 e!58314)))

(declare-fun res!45792 () Bool)

(assert (=> b!89601 (=> (not res!45792) (not e!58314))))

(assert (=> b!89601 (= res!45792 (contains!760 lt!43140 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89601 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89602 () Bool)

(declare-fun lt!43145 () Unit!2636)

(assert (=> b!89602 (= e!58310 lt!43145)))

(declare-fun lt!43129 () ListLongMap!1469)

(assert (=> b!89602 (= lt!43129 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43137 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43135 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43135 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43134 () Unit!2636)

(assert (=> b!89602 (= lt!43134 (addStillContains!60 lt!43129 lt!43137 (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) lt!43135))))

(assert (=> b!89602 (contains!760 (+!113 lt!43129 (tuple2!2211 lt!43137 (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)))) lt!43135)))

(declare-fun lt!43144 () Unit!2636)

(assert (=> b!89602 (= lt!43144 lt!43134)))

(declare-fun lt!43136 () ListLongMap!1469)

(assert (=> b!89602 (= lt!43136 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43142 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43131 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43131 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43138 () Unit!2636)

(assert (=> b!89602 (= lt!43138 (addApplyDifferent!60 lt!43136 lt!43142 (minValue!2261 newMap!16) lt!43131))))

(assert (=> b!89602 (= (apply!84 (+!113 lt!43136 (tuple2!2211 lt!43142 (minValue!2261 newMap!16))) lt!43131) (apply!84 lt!43136 lt!43131))))

(declare-fun lt!43133 () Unit!2636)

(assert (=> b!89602 (= lt!43133 lt!43138)))

(declare-fun lt!43143 () ListLongMap!1469)

(assert (=> b!89602 (= lt!43143 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43132 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43139 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43139 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43149 () Unit!2636)

(assert (=> b!89602 (= lt!43149 (addApplyDifferent!60 lt!43143 lt!43132 (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) lt!43139))))

(assert (=> b!89602 (= (apply!84 (+!113 lt!43143 (tuple2!2211 lt!43132 (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)))) lt!43139) (apply!84 lt!43143 lt!43139))))

(declare-fun lt!43147 () Unit!2636)

(assert (=> b!89602 (= lt!43147 lt!43149)))

(declare-fun lt!43130 () ListLongMap!1469)

(assert (=> b!89602 (= lt!43130 (getCurrentListMapNoExtraKeys!78 (_keys!4050 newMap!16) (ite c!14779 (_values!2355 newMap!16) lt!42734) (mask!6416 newMap!16) (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) (ite (and c!14779 c!14770) lt!42545 (zeroValue!2261 newMap!16)) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)))))

(declare-fun lt!43141 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43141 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43148 () (_ BitVec 64))

(assert (=> b!89602 (= lt!43148 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89602 (= lt!43145 (addApplyDifferent!60 lt!43130 lt!43141 (minValue!2261 newMap!16) lt!43148))))

(assert (=> b!89602 (= (apply!84 (+!113 lt!43130 (tuple2!2211 lt!43141 (minValue!2261 newMap!16))) lt!43148) (apply!84 lt!43130 lt!43148))))

(declare-fun b!89603 () Bool)

(assert (=> b!89603 (= e!58314 (= (apply!84 lt!43140 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)) (get!1208 (select (arr!1932 (ite c!14779 (_values!2355 newMap!16) lt!42734)) #b00000000000000000000000000000000) (dynLambda!344 (defaultEntry!2372 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2178 (ite c!14779 (_values!2355 newMap!16) lt!42734))))))

(assert (=> b!89603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89604 () Bool)

(assert (=> b!89604 (= e!58309 e!58319)))

(assert (=> b!89604 (= c!14912 (and (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!14911 () Bool)

(declare-fun b!89605 () Bool)

(assert (=> b!89605 (= c!14911 (and (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!89605 (= e!58319 e!58315)))

(declare-fun b!89606 () Bool)

(assert (=> b!89606 (= e!58318 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89607 () Bool)

(assert (=> b!89607 (= e!58308 e!58307)))

(declare-fun c!14913 () Bool)

(assert (=> b!89607 (= c!14913 (not (= (bvand (ite (and c!14779 c!14770) lt!42748 (extraKeys!2205 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89608 () Bool)

(assert (=> b!89608 (= e!58312 (not call!8707))))

(declare-fun bm!8710 () Bool)

(assert (=> bm!8710 (= call!8708 call!8710)))

(assert (= (and d!23881 c!14910) b!89596))

(assert (= (and d!23881 (not c!14910)) b!89604))

(assert (= (and b!89604 c!14912) b!89597))

(assert (= (and b!89604 (not c!14912)) b!89605))

(assert (= (and b!89605 c!14911) b!89591))

(assert (= (and b!89605 (not c!14911)) b!89600))

(assert (= (or b!89591 b!89600) bm!8708))

(assert (= (or b!89597 bm!8708) bm!8710))

(assert (= (or b!89597 b!89591) bm!8707))

(assert (= (or b!89596 bm!8710) bm!8709))

(assert (= (or b!89596 bm!8707) bm!8705))

(assert (= (and d!23881 res!45795) b!89598))

(assert (= (and d!23881 c!14908) b!89602))

(assert (= (and d!23881 (not c!14908)) b!89592))

(assert (= (and d!23881 res!45797) b!89594))

(assert (= (and b!89594 res!45798) b!89606))

(assert (= (and b!89594 (not res!45793)) b!89601))

(assert (= (and b!89601 res!45792) b!89603))

(assert (= (and b!89594 res!45794) b!89593))

(assert (= (and b!89593 c!14909) b!89599))

(assert (= (and b!89593 (not c!14909)) b!89608))

(assert (= (and b!89599 res!45796) b!89595))

(assert (= (or b!89599 b!89608) bm!8706))

(assert (= (and b!89593 res!45799) b!89607))

(assert (= (and b!89607 c!14913) b!89589))

(assert (= (and b!89607 (not c!14913)) b!89588))

(assert (= (and b!89589 res!45800) b!89590))

(assert (= (or b!89589 b!89588) bm!8704))

(declare-fun b_lambda!3961 () Bool)

(assert (=> (not b_lambda!3961) (not b!89603)))

(assert (=> b!89603 t!5293))

(declare-fun b_and!5387 () Bool)

(assert (= b_and!5383 (and (=> t!5293 result!2979) b_and!5387)))

(assert (=> b!89603 t!5295))

(declare-fun b_and!5389 () Bool)

(assert (= b_and!5385 (and (=> t!5295 result!2981) b_and!5389)))

(declare-fun m!96259 () Bool)

(assert (=> b!89590 m!96259))

(declare-fun m!96261 () Bool)

(assert (=> bm!8706 m!96261))

(assert (=> b!89598 m!95789))

(assert (=> b!89598 m!95789))

(assert (=> b!89598 m!95791))

(declare-fun m!96263 () Bool)

(assert (=> bm!8704 m!96263))

(declare-fun m!96265 () Bool)

(assert (=> b!89603 m!96265))

(assert (=> b!89603 m!95797))

(declare-fun m!96267 () Bool)

(assert (=> b!89603 m!96267))

(assert (=> b!89603 m!96265))

(assert (=> b!89603 m!95797))

(assert (=> b!89603 m!95789))

(assert (=> b!89603 m!95789))

(declare-fun m!96269 () Bool)

(assert (=> b!89603 m!96269))

(assert (=> b!89601 m!95789))

(assert (=> b!89601 m!95789))

(declare-fun m!96271 () Bool)

(assert (=> b!89601 m!96271))

(declare-fun m!96273 () Bool)

(assert (=> bm!8705 m!96273))

(assert (=> b!89606 m!95789))

(assert (=> b!89606 m!95789))

(assert (=> b!89606 m!95791))

(declare-fun m!96275 () Bool)

(assert (=> b!89596 m!96275))

(assert (=> d!23881 m!95621))

(declare-fun m!96277 () Bool)

(assert (=> bm!8709 m!96277))

(declare-fun m!96279 () Bool)

(assert (=> b!89595 m!96279))

(declare-fun m!96281 () Bool)

(assert (=> b!89602 m!96281))

(declare-fun m!96283 () Bool)

(assert (=> b!89602 m!96283))

(declare-fun m!96285 () Bool)

(assert (=> b!89602 m!96285))

(declare-fun m!96287 () Bool)

(assert (=> b!89602 m!96287))

(declare-fun m!96289 () Bool)

(assert (=> b!89602 m!96289))

(declare-fun m!96291 () Bool)

(assert (=> b!89602 m!96291))

(declare-fun m!96293 () Bool)

(assert (=> b!89602 m!96293))

(assert (=> b!89602 m!95789))

(declare-fun m!96295 () Bool)

(assert (=> b!89602 m!96295))

(assert (=> b!89602 m!96295))

(declare-fun m!96297 () Bool)

(assert (=> b!89602 m!96297))

(assert (=> b!89602 m!96285))

(declare-fun m!96299 () Bool)

(assert (=> b!89602 m!96299))

(declare-fun m!96301 () Bool)

(assert (=> b!89602 m!96301))

(declare-fun m!96303 () Bool)

(assert (=> b!89602 m!96303))

(assert (=> b!89602 m!96301))

(assert (=> b!89602 m!96277))

(assert (=> b!89602 m!96283))

(declare-fun m!96305 () Bool)

(assert (=> b!89602 m!96305))

(declare-fun m!96307 () Bool)

(assert (=> b!89602 m!96307))

(declare-fun m!96309 () Bool)

(assert (=> b!89602 m!96309))

(assert (=> bm!8619 d!23881))

(declare-fun d!23883 () Bool)

(declare-fun e!58321 () Bool)

(assert (=> d!23883 e!58321))

(declare-fun res!45801 () Bool)

(assert (=> d!23883 (=> res!45801 e!58321)))

(declare-fun lt!43150 () Bool)

(assert (=> d!23883 (= res!45801 (not lt!43150))))

(declare-fun lt!43153 () Bool)

(assert (=> d!23883 (= lt!43150 lt!43153)))

(declare-fun lt!43152 () Unit!2636)

(declare-fun e!58320 () Unit!2636)

(assert (=> d!23883 (= lt!43152 e!58320)))

(declare-fun c!14914 () Bool)

(assert (=> d!23883 (= c!14914 lt!43153)))

(assert (=> d!23883 (= lt!43153 (containsKey!146 (toList!750 lt!42643) (_1!1116 lt!42541)))))

(assert (=> d!23883 (= (contains!760 lt!42643 (_1!1116 lt!42541)) lt!43150)))

(declare-fun b!89609 () Bool)

(declare-fun lt!43151 () Unit!2636)

(assert (=> b!89609 (= e!58320 lt!43151)))

(assert (=> b!89609 (= lt!43151 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42643) (_1!1116 lt!42541)))))

(assert (=> b!89609 (isDefined!95 (getValueByKey!142 (toList!750 lt!42643) (_1!1116 lt!42541)))))

(declare-fun b!89610 () Bool)

(declare-fun Unit!2661 () Unit!2636)

(assert (=> b!89610 (= e!58320 Unit!2661)))

(declare-fun b!89611 () Bool)

(assert (=> b!89611 (= e!58321 (isDefined!95 (getValueByKey!142 (toList!750 lt!42643) (_1!1116 lt!42541))))))

(assert (= (and d!23883 c!14914) b!89609))

(assert (= (and d!23883 (not c!14914)) b!89610))

(assert (= (and d!23883 (not res!45801)) b!89611))

(declare-fun m!96311 () Bool)

(assert (=> d!23883 m!96311))

(declare-fun m!96313 () Bool)

(assert (=> b!89609 m!96313))

(assert (=> b!89609 m!95403))

(assert (=> b!89609 m!95403))

(declare-fun m!96315 () Bool)

(assert (=> b!89609 m!96315))

(assert (=> b!89611 m!95403))

(assert (=> b!89611 m!95403))

(assert (=> b!89611 m!96315))

(assert (=> d!23677 d!23883))

(declare-fun b!89612 () Bool)

(declare-fun e!58322 () Option!148)

(assert (=> b!89612 (= e!58322 (Some!147 (_2!1116 (h!2114 lt!42645))))))

(declare-fun d!23885 () Bool)

(declare-fun c!14915 () Bool)

(assert (=> d!23885 (= c!14915 (and ((_ is Cons!1522) lt!42645) (= (_1!1116 (h!2114 lt!42645)) (_1!1116 lt!42541))))))

(assert (=> d!23885 (= (getValueByKey!142 lt!42645 (_1!1116 lt!42541)) e!58322)))

(declare-fun b!89615 () Bool)

(declare-fun e!58323 () Option!148)

(assert (=> b!89615 (= e!58323 None!146)))

(declare-fun b!89614 () Bool)

(assert (=> b!89614 (= e!58323 (getValueByKey!142 (t!5284 lt!42645) (_1!1116 lt!42541)))))

(declare-fun b!89613 () Bool)

(assert (=> b!89613 (= e!58322 e!58323)))

(declare-fun c!14916 () Bool)

(assert (=> b!89613 (= c!14916 (and ((_ is Cons!1522) lt!42645) (not (= (_1!1116 (h!2114 lt!42645)) (_1!1116 lt!42541)))))))

(assert (= (and d!23885 c!14915) b!89612))

(assert (= (and d!23885 (not c!14915)) b!89613))

(assert (= (and b!89613 c!14916) b!89614))

(assert (= (and b!89613 (not c!14916)) b!89615))

(declare-fun m!96317 () Bool)

(assert (=> b!89614 m!96317))

(assert (=> d!23677 d!23885))

(declare-fun d!23887 () Bool)

(assert (=> d!23887 (= (getValueByKey!142 lt!42645 (_1!1116 lt!42541)) (Some!147 (_2!1116 lt!42541)))))

(declare-fun lt!43154 () Unit!2636)

(assert (=> d!23887 (= lt!43154 (choose!531 lt!42645 (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun e!58324 () Bool)

(assert (=> d!23887 e!58324))

(declare-fun res!45802 () Bool)

(assert (=> d!23887 (=> (not res!45802) (not e!58324))))

(assert (=> d!23887 (= res!45802 (isStrictlySorted!300 lt!42645))))

(assert (=> d!23887 (= (lemmaContainsTupThenGetReturnValue!59 lt!42645 (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!43154)))

(declare-fun b!89616 () Bool)

(declare-fun res!45803 () Bool)

(assert (=> b!89616 (=> (not res!45803) (not e!58324))))

(assert (=> b!89616 (= res!45803 (containsKey!146 lt!42645 (_1!1116 lt!42541)))))

(declare-fun b!89617 () Bool)

(assert (=> b!89617 (= e!58324 (contains!761 lt!42645 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(assert (= (and d!23887 res!45802) b!89616))

(assert (= (and b!89616 res!45803) b!89617))

(assert (=> d!23887 m!95397))

(declare-fun m!96319 () Bool)

(assert (=> d!23887 m!96319))

(declare-fun m!96321 () Bool)

(assert (=> d!23887 m!96321))

(declare-fun m!96323 () Bool)

(assert (=> b!89616 m!96323))

(declare-fun m!96325 () Bool)

(assert (=> b!89617 m!96325))

(assert (=> d!23677 d!23887))

(declare-fun b!89618 () Bool)

(declare-fun e!58325 () List!1526)

(declare-fun call!8715 () List!1526)

(assert (=> b!89618 (= e!58325 call!8715)))

(declare-fun b!89619 () Bool)

(declare-fun e!58329 () Bool)

(declare-fun lt!43155 () List!1526)

(assert (=> b!89619 (= e!58329 (contains!761 lt!43155 (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541))))))

(declare-fun b!89620 () Bool)

(declare-fun e!58328 () List!1526)

(declare-fun call!8714 () List!1526)

(assert (=> b!89620 (= e!58328 call!8714)))

(declare-fun bm!8711 () Bool)

(declare-fun call!8716 () List!1526)

(assert (=> bm!8711 (= call!8715 call!8716)))

(declare-fun b!89621 () Bool)

(declare-fun c!14918 () Bool)

(assert (=> b!89621 (= c!14918 (and ((_ is Cons!1522) (toList!750 (+!113 lt!42530 lt!42538))) (bvsgt (_1!1116 (h!2114 (toList!750 (+!113 lt!42530 lt!42538)))) (_1!1116 lt!42541))))))

(declare-fun e!58327 () List!1526)

(assert (=> b!89621 (= e!58327 e!58325)))

(declare-fun e!58326 () List!1526)

(declare-fun b!89622 () Bool)

(assert (=> b!89622 (= e!58326 (insertStrictlySorted!62 (t!5284 (toList!750 (+!113 lt!42530 lt!42538))) (_1!1116 lt!42541) (_2!1116 lt!42541)))))

(declare-fun bm!8713 () Bool)

(assert (=> bm!8713 (= call!8716 call!8714)))

(declare-fun b!89623 () Bool)

(declare-fun c!14920 () Bool)

(assert (=> b!89623 (= e!58326 (ite c!14920 (t!5284 (toList!750 (+!113 lt!42530 lt!42538))) (ite c!14918 (Cons!1522 (h!2114 (toList!750 (+!113 lt!42530 lt!42538))) (t!5284 (toList!750 (+!113 lt!42530 lt!42538)))) Nil!1523)))))

(declare-fun b!89624 () Bool)

(assert (=> b!89624 (= e!58327 call!8716)))

(declare-fun b!89625 () Bool)

(assert (=> b!89625 (= e!58328 e!58327)))

(assert (=> b!89625 (= c!14920 (and ((_ is Cons!1522) (toList!750 (+!113 lt!42530 lt!42538))) (= (_1!1116 (h!2114 (toList!750 (+!113 lt!42530 lt!42538)))) (_1!1116 lt!42541))))))

(declare-fun c!14919 () Bool)

(declare-fun bm!8712 () Bool)

(assert (=> bm!8712 (= call!8714 ($colon$colon!74 e!58326 (ite c!14919 (h!2114 (toList!750 (+!113 lt!42530 lt!42538))) (tuple2!2211 (_1!1116 lt!42541) (_2!1116 lt!42541)))))))

(declare-fun c!14917 () Bool)

(assert (=> bm!8712 (= c!14917 c!14919)))

(declare-fun d!23889 () Bool)

(assert (=> d!23889 e!58329))

(declare-fun res!45804 () Bool)

(assert (=> d!23889 (=> (not res!45804) (not e!58329))))

(assert (=> d!23889 (= res!45804 (isStrictlySorted!300 lt!43155))))

(assert (=> d!23889 (= lt!43155 e!58328)))

(assert (=> d!23889 (= c!14919 (and ((_ is Cons!1522) (toList!750 (+!113 lt!42530 lt!42538))) (bvslt (_1!1116 (h!2114 (toList!750 (+!113 lt!42530 lt!42538)))) (_1!1116 lt!42541))))))

(assert (=> d!23889 (isStrictlySorted!300 (toList!750 (+!113 lt!42530 lt!42538)))))

(assert (=> d!23889 (= (insertStrictlySorted!62 (toList!750 (+!113 lt!42530 lt!42538)) (_1!1116 lt!42541) (_2!1116 lt!42541)) lt!43155)))

(declare-fun b!89626 () Bool)

(declare-fun res!45805 () Bool)

(assert (=> b!89626 (=> (not res!45805) (not e!58329))))

(assert (=> b!89626 (= res!45805 (containsKey!146 lt!43155 (_1!1116 lt!42541)))))

(declare-fun b!89627 () Bool)

(assert (=> b!89627 (= e!58325 call!8715)))

(assert (= (and d!23889 c!14919) b!89620))

(assert (= (and d!23889 (not c!14919)) b!89625))

(assert (= (and b!89625 c!14920) b!89624))

(assert (= (and b!89625 (not c!14920)) b!89621))

(assert (= (and b!89621 c!14918) b!89618))

(assert (= (and b!89621 (not c!14918)) b!89627))

(assert (= (or b!89618 b!89627) bm!8711))

(assert (= (or b!89624 bm!8711) bm!8713))

(assert (= (or b!89620 bm!8713) bm!8712))

(assert (= (and bm!8712 c!14917) b!89622))

(assert (= (and bm!8712 (not c!14917)) b!89623))

(assert (= (and d!23889 res!45804) b!89626))

(assert (= (and b!89626 res!45805) b!89619))

(declare-fun m!96327 () Bool)

(assert (=> b!89619 m!96327))

(declare-fun m!96329 () Bool)

(assert (=> b!89626 m!96329))

(declare-fun m!96331 () Bool)

(assert (=> bm!8712 m!96331))

(declare-fun m!96333 () Bool)

(assert (=> b!89622 m!96333))

(declare-fun m!96335 () Bool)

(assert (=> d!23889 m!96335))

(declare-fun m!96337 () Bool)

(assert (=> d!23889 m!96337))

(assert (=> d!23677 d!23889))

(declare-fun d!23891 () Bool)

(declare-fun e!58331 () Bool)

(assert (=> d!23891 e!58331))

(declare-fun res!45806 () Bool)

(assert (=> d!23891 (=> res!45806 e!58331)))

(declare-fun lt!43156 () Bool)

(assert (=> d!23891 (= res!45806 (not lt!43156))))

(declare-fun lt!43159 () Bool)

(assert (=> d!23891 (= lt!43156 lt!43159)))

(declare-fun lt!43158 () Unit!2636)

(declare-fun e!58330 () Unit!2636)

(assert (=> d!23891 (= lt!43158 e!58330)))

(declare-fun c!14921 () Bool)

(assert (=> d!23891 (= c!14921 lt!43159)))

(assert (=> d!23891 (= lt!43159 (containsKey!146 (toList!750 lt!42647) (_1!1116 lt!42538)))))

(assert (=> d!23891 (= (contains!760 lt!42647 (_1!1116 lt!42538)) lt!43156)))

(declare-fun b!89628 () Bool)

(declare-fun lt!43157 () Unit!2636)

(assert (=> b!89628 (= e!58330 lt!43157)))

(assert (=> b!89628 (= lt!43157 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42647) (_1!1116 lt!42538)))))

(assert (=> b!89628 (isDefined!95 (getValueByKey!142 (toList!750 lt!42647) (_1!1116 lt!42538)))))

(declare-fun b!89629 () Bool)

(declare-fun Unit!2662 () Unit!2636)

(assert (=> b!89629 (= e!58330 Unit!2662)))

(declare-fun b!89630 () Bool)

(assert (=> b!89630 (= e!58331 (isDefined!95 (getValueByKey!142 (toList!750 lt!42647) (_1!1116 lt!42538))))))

(assert (= (and d!23891 c!14921) b!89628))

(assert (= (and d!23891 (not c!14921)) b!89629))

(assert (= (and d!23891 (not res!45806)) b!89630))

(declare-fun m!96339 () Bool)

(assert (=> d!23891 m!96339))

(declare-fun m!96341 () Bool)

(assert (=> b!89628 m!96341))

(assert (=> b!89628 m!95415))

(assert (=> b!89628 m!95415))

(declare-fun m!96343 () Bool)

(assert (=> b!89628 m!96343))

(assert (=> b!89630 m!95415))

(assert (=> b!89630 m!95415))

(assert (=> b!89630 m!96343))

(assert (=> d!23679 d!23891))

(declare-fun b!89631 () Bool)

(declare-fun e!58332 () Option!148)

(assert (=> b!89631 (= e!58332 (Some!147 (_2!1116 (h!2114 lt!42649))))))

(declare-fun d!23893 () Bool)

(declare-fun c!14922 () Bool)

(assert (=> d!23893 (= c!14922 (and ((_ is Cons!1522) lt!42649) (= (_1!1116 (h!2114 lt!42649)) (_1!1116 lt!42538))))))

(assert (=> d!23893 (= (getValueByKey!142 lt!42649 (_1!1116 lt!42538)) e!58332)))

(declare-fun b!89634 () Bool)

(declare-fun e!58333 () Option!148)

(assert (=> b!89634 (= e!58333 None!146)))

(declare-fun b!89633 () Bool)

(assert (=> b!89633 (= e!58333 (getValueByKey!142 (t!5284 lt!42649) (_1!1116 lt!42538)))))

(declare-fun b!89632 () Bool)

(assert (=> b!89632 (= e!58332 e!58333)))

(declare-fun c!14923 () Bool)

(assert (=> b!89632 (= c!14923 (and ((_ is Cons!1522) lt!42649) (not (= (_1!1116 (h!2114 lt!42649)) (_1!1116 lt!42538)))))))

(assert (= (and d!23893 c!14922) b!89631))

(assert (= (and d!23893 (not c!14922)) b!89632))

(assert (= (and b!89632 c!14923) b!89633))

(assert (= (and b!89632 (not c!14923)) b!89634))

(declare-fun m!96345 () Bool)

(assert (=> b!89633 m!96345))

(assert (=> d!23679 d!23893))

(declare-fun d!23895 () Bool)

(assert (=> d!23895 (= (getValueByKey!142 lt!42649 (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538)))))

(declare-fun lt!43160 () Unit!2636)

(assert (=> d!23895 (= lt!43160 (choose!531 lt!42649 (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(declare-fun e!58334 () Bool)

(assert (=> d!23895 e!58334))

(declare-fun res!45807 () Bool)

(assert (=> d!23895 (=> (not res!45807) (not e!58334))))

(assert (=> d!23895 (= res!45807 (isStrictlySorted!300 lt!42649))))

(assert (=> d!23895 (= (lemmaContainsTupThenGetReturnValue!59 lt!42649 (_1!1116 lt!42538) (_2!1116 lt!42538)) lt!43160)))

(declare-fun b!89635 () Bool)

(declare-fun res!45808 () Bool)

(assert (=> b!89635 (=> (not res!45808) (not e!58334))))

(assert (=> b!89635 (= res!45808 (containsKey!146 lt!42649 (_1!1116 lt!42538)))))

(declare-fun b!89636 () Bool)

(assert (=> b!89636 (= e!58334 (contains!761 lt!42649 (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538))))))

(assert (= (and d!23895 res!45807) b!89635))

(assert (= (and b!89635 res!45808) b!89636))

(assert (=> d!23895 m!95409))

(declare-fun m!96347 () Bool)

(assert (=> d!23895 m!96347))

(declare-fun m!96349 () Bool)

(assert (=> d!23895 m!96349))

(declare-fun m!96351 () Bool)

(assert (=> b!89635 m!96351))

(declare-fun m!96353 () Bool)

(assert (=> b!89636 m!96353))

(assert (=> d!23679 d!23895))

(declare-fun b!89637 () Bool)

(declare-fun e!58335 () List!1526)

(declare-fun call!8718 () List!1526)

(assert (=> b!89637 (= e!58335 call!8718)))

(declare-fun b!89638 () Bool)

(declare-fun e!58339 () Bool)

(declare-fun lt!43161 () List!1526)

(assert (=> b!89638 (= e!58339 (contains!761 lt!43161 (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538))))))

(declare-fun b!89639 () Bool)

(declare-fun e!58338 () List!1526)

(declare-fun call!8717 () List!1526)

(assert (=> b!89639 (= e!58338 call!8717)))

(declare-fun bm!8714 () Bool)

(declare-fun call!8719 () List!1526)

(assert (=> bm!8714 (= call!8718 call!8719)))

(declare-fun b!89640 () Bool)

(declare-fun c!14925 () Bool)

(assert (=> b!89640 (= c!14925 (and ((_ is Cons!1522) (toList!750 lt!42546)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42546))) (_1!1116 lt!42538))))))

(declare-fun e!58337 () List!1526)

(assert (=> b!89640 (= e!58337 e!58335)))

(declare-fun b!89641 () Bool)

(declare-fun e!58336 () List!1526)

(assert (=> b!89641 (= e!58336 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42546)) (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(declare-fun bm!8716 () Bool)

(assert (=> bm!8716 (= call!8719 call!8717)))

(declare-fun b!89642 () Bool)

(declare-fun c!14927 () Bool)

(assert (=> b!89642 (= e!58336 (ite c!14927 (t!5284 (toList!750 lt!42546)) (ite c!14925 (Cons!1522 (h!2114 (toList!750 lt!42546)) (t!5284 (toList!750 lt!42546))) Nil!1523)))))

(declare-fun b!89643 () Bool)

(assert (=> b!89643 (= e!58337 call!8719)))

(declare-fun b!89644 () Bool)

(assert (=> b!89644 (= e!58338 e!58337)))

(assert (=> b!89644 (= c!14927 (and ((_ is Cons!1522) (toList!750 lt!42546)) (= (_1!1116 (h!2114 (toList!750 lt!42546))) (_1!1116 lt!42538))))))

(declare-fun c!14926 () Bool)

(declare-fun bm!8715 () Bool)

(assert (=> bm!8715 (= call!8717 ($colon$colon!74 e!58336 (ite c!14926 (h!2114 (toList!750 lt!42546)) (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538)))))))

(declare-fun c!14924 () Bool)

(assert (=> bm!8715 (= c!14924 c!14926)))

(declare-fun d!23897 () Bool)

(assert (=> d!23897 e!58339))

(declare-fun res!45809 () Bool)

(assert (=> d!23897 (=> (not res!45809) (not e!58339))))

(assert (=> d!23897 (= res!45809 (isStrictlySorted!300 lt!43161))))

(assert (=> d!23897 (= lt!43161 e!58338)))

(assert (=> d!23897 (= c!14926 (and ((_ is Cons!1522) (toList!750 lt!42546)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42546))) (_1!1116 lt!42538))))))

(assert (=> d!23897 (isStrictlySorted!300 (toList!750 lt!42546))))

(assert (=> d!23897 (= (insertStrictlySorted!62 (toList!750 lt!42546) (_1!1116 lt!42538) (_2!1116 lt!42538)) lt!43161)))

(declare-fun b!89645 () Bool)

(declare-fun res!45810 () Bool)

(assert (=> b!89645 (=> (not res!45810) (not e!58339))))

(assert (=> b!89645 (= res!45810 (containsKey!146 lt!43161 (_1!1116 lt!42538)))))

(declare-fun b!89646 () Bool)

(assert (=> b!89646 (= e!58335 call!8718)))

(assert (= (and d!23897 c!14926) b!89639))

(assert (= (and d!23897 (not c!14926)) b!89644))

(assert (= (and b!89644 c!14927) b!89643))

(assert (= (and b!89644 (not c!14927)) b!89640))

(assert (= (and b!89640 c!14925) b!89637))

(assert (= (and b!89640 (not c!14925)) b!89646))

(assert (= (or b!89637 b!89646) bm!8714))

(assert (= (or b!89643 bm!8714) bm!8716))

(assert (= (or b!89639 bm!8716) bm!8715))

(assert (= (and bm!8715 c!14924) b!89641))

(assert (= (and bm!8715 (not c!14924)) b!89642))

(assert (= (and d!23897 res!45809) b!89645))

(assert (= (and b!89645 res!45810) b!89638))

(declare-fun m!96355 () Bool)

(assert (=> b!89638 m!96355))

(declare-fun m!96357 () Bool)

(assert (=> b!89645 m!96357))

(declare-fun m!96359 () Bool)

(assert (=> bm!8715 m!96359))

(declare-fun m!96361 () Bool)

(assert (=> b!89641 m!96361))

(declare-fun m!96363 () Bool)

(assert (=> d!23897 m!96363))

(declare-fun m!96365 () Bool)

(assert (=> d!23897 m!96365))

(assert (=> d!23679 d!23897))

(assert (=> b!88945 d!23793))

(declare-fun d!23899 () Bool)

(declare-fun lt!43162 () Bool)

(assert (=> d!23899 (= lt!43162 (select (content!93 (toList!750 lt!42613)) lt!42541))))

(declare-fun e!58341 () Bool)

(assert (=> d!23899 (= lt!43162 e!58341)))

(declare-fun res!45811 () Bool)

(assert (=> d!23899 (=> (not res!45811) (not e!58341))))

(assert (=> d!23899 (= res!45811 ((_ is Cons!1522) (toList!750 lt!42613)))))

(assert (=> d!23899 (= (contains!761 (toList!750 lt!42613) lt!42541) lt!43162)))

(declare-fun b!89647 () Bool)

(declare-fun e!58340 () Bool)

(assert (=> b!89647 (= e!58341 e!58340)))

(declare-fun res!45812 () Bool)

(assert (=> b!89647 (=> res!45812 e!58340)))

(assert (=> b!89647 (= res!45812 (= (h!2114 (toList!750 lt!42613)) lt!42541))))

(declare-fun b!89648 () Bool)

(assert (=> b!89648 (= e!58340 (contains!761 (t!5284 (toList!750 lt!42613)) lt!42541))))

(assert (= (and d!23899 res!45811) b!89647))

(assert (= (and b!89647 (not res!45812)) b!89648))

(declare-fun m!96367 () Bool)

(assert (=> d!23899 m!96367))

(declare-fun m!96369 () Bool)

(assert (=> d!23899 m!96369))

(declare-fun m!96371 () Bool)

(assert (=> b!89648 m!96371))

(assert (=> b!88914 d!23899))

(declare-fun d!23901 () Bool)

(assert (=> d!23901 (= (apply!84 lt!42633 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1211 (getValueByKey!142 (toList!750 lt!42633) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3769 () Bool)

(assert (= bs!3769 d!23901))

(assert (=> bs!3769 m!95353))

(assert (=> bs!3769 m!96239))

(assert (=> bs!3769 m!96239))

(declare-fun m!96373 () Bool)

(assert (=> bs!3769 m!96373))

(assert (=> b!88947 d!23901))

(declare-fun d!23903 () Bool)

(declare-fun c!14928 () Bool)

(assert (=> d!23903 (= c!14928 ((_ is ValueCellFull!930) (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!58342 () V!3043)

(assert (=> d!23903 (= (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58342)))

(declare-fun b!89649 () Bool)

(assert (=> b!89649 (= e!58342 (get!1209 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89650 () Bool)

(assert (=> b!89650 (= e!58342 (get!1210 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23903 c!14928) b!89649))

(assert (= (and d!23903 (not c!14928)) b!89650))

(assert (=> b!89649 m!95349))

(assert (=> b!89649 m!95205))

(declare-fun m!96375 () Bool)

(assert (=> b!89649 m!96375))

(assert (=> b!89650 m!95349))

(assert (=> b!89650 m!95205))

(declare-fun m!96377 () Bool)

(assert (=> b!89650 m!96377))

(assert (=> b!88947 d!23903))

(declare-fun d!23905 () Bool)

(assert (=> d!23905 (= (apply!84 lt!42811 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1211 (getValueByKey!142 (toList!750 lt!42811) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3770 () Bool)

(assert (= bs!3770 d!23905))

(assert (=> bs!3770 m!95353))

(assert (=> bs!3770 m!96255))

(assert (=> bs!3770 m!96255))

(declare-fun m!96379 () Bool)

(assert (=> bs!3770 m!96379))

(assert (=> b!89185 d!23905))

(assert (=> b!89185 d!23903))

(declare-fun d!23907 () Bool)

(declare-fun e!58344 () Bool)

(assert (=> d!23907 e!58344))

(declare-fun res!45813 () Bool)

(assert (=> d!23907 (=> res!45813 e!58344)))

(declare-fun lt!43163 () Bool)

(assert (=> d!23907 (= res!45813 (not lt!43163))))

(declare-fun lt!43166 () Bool)

(assert (=> d!23907 (= lt!43163 lt!43166)))

(declare-fun lt!43165 () Unit!2636)

(declare-fun e!58343 () Unit!2636)

(assert (=> d!23907 (= lt!43165 e!58343)))

(declare-fun c!14929 () Bool)

(assert (=> d!23907 (= c!14929 lt!43166)))

(assert (=> d!23907 (= lt!43166 (containsKey!146 (toList!750 lt!42651) (_1!1116 lt!42538)))))

(assert (=> d!23907 (= (contains!760 lt!42651 (_1!1116 lt!42538)) lt!43163)))

(declare-fun b!89651 () Bool)

(declare-fun lt!43164 () Unit!2636)

(assert (=> b!89651 (= e!58343 lt!43164)))

(assert (=> b!89651 (= lt!43164 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42651) (_1!1116 lt!42538)))))

(assert (=> b!89651 (isDefined!95 (getValueByKey!142 (toList!750 lt!42651) (_1!1116 lt!42538)))))

(declare-fun b!89652 () Bool)

(declare-fun Unit!2663 () Unit!2636)

(assert (=> b!89652 (= e!58343 Unit!2663)))

(declare-fun b!89653 () Bool)

(assert (=> b!89653 (= e!58344 (isDefined!95 (getValueByKey!142 (toList!750 lt!42651) (_1!1116 lt!42538))))))

(assert (= (and d!23907 c!14929) b!89651))

(assert (= (and d!23907 (not c!14929)) b!89652))

(assert (= (and d!23907 (not res!45813)) b!89653))

(declare-fun m!96381 () Bool)

(assert (=> d!23907 m!96381))

(declare-fun m!96383 () Bool)

(assert (=> b!89651 m!96383))

(assert (=> b!89651 m!95427))

(assert (=> b!89651 m!95427))

(declare-fun m!96385 () Bool)

(assert (=> b!89651 m!96385))

(assert (=> b!89653 m!95427))

(assert (=> b!89653 m!95427))

(assert (=> b!89653 m!96385))

(assert (=> d!23681 d!23907))

(declare-fun b!89654 () Bool)

(declare-fun e!58345 () Option!148)

(assert (=> b!89654 (= e!58345 (Some!147 (_2!1116 (h!2114 lt!42653))))))

(declare-fun d!23909 () Bool)

(declare-fun c!14930 () Bool)

(assert (=> d!23909 (= c!14930 (and ((_ is Cons!1522) lt!42653) (= (_1!1116 (h!2114 lt!42653)) (_1!1116 lt!42538))))))

(assert (=> d!23909 (= (getValueByKey!142 lt!42653 (_1!1116 lt!42538)) e!58345)))

(declare-fun b!89657 () Bool)

(declare-fun e!58346 () Option!148)

(assert (=> b!89657 (= e!58346 None!146)))

(declare-fun b!89656 () Bool)

(assert (=> b!89656 (= e!58346 (getValueByKey!142 (t!5284 lt!42653) (_1!1116 lt!42538)))))

(declare-fun b!89655 () Bool)

(assert (=> b!89655 (= e!58345 e!58346)))

(declare-fun c!14931 () Bool)

(assert (=> b!89655 (= c!14931 (and ((_ is Cons!1522) lt!42653) (not (= (_1!1116 (h!2114 lt!42653)) (_1!1116 lt!42538)))))))

(assert (= (and d!23909 c!14930) b!89654))

(assert (= (and d!23909 (not c!14930)) b!89655))

(assert (= (and b!89655 c!14931) b!89656))

(assert (= (and b!89655 (not c!14931)) b!89657))

(declare-fun m!96387 () Bool)

(assert (=> b!89656 m!96387))

(assert (=> d!23681 d!23909))

(declare-fun d!23911 () Bool)

(assert (=> d!23911 (= (getValueByKey!142 lt!42653 (_1!1116 lt!42538)) (Some!147 (_2!1116 lt!42538)))))

(declare-fun lt!43167 () Unit!2636)

(assert (=> d!23911 (= lt!43167 (choose!531 lt!42653 (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(declare-fun e!58347 () Bool)

(assert (=> d!23911 e!58347))

(declare-fun res!45814 () Bool)

(assert (=> d!23911 (=> (not res!45814) (not e!58347))))

(assert (=> d!23911 (= res!45814 (isStrictlySorted!300 lt!42653))))

(assert (=> d!23911 (= (lemmaContainsTupThenGetReturnValue!59 lt!42653 (_1!1116 lt!42538) (_2!1116 lt!42538)) lt!43167)))

(declare-fun b!89658 () Bool)

(declare-fun res!45815 () Bool)

(assert (=> b!89658 (=> (not res!45815) (not e!58347))))

(assert (=> b!89658 (= res!45815 (containsKey!146 lt!42653 (_1!1116 lt!42538)))))

(declare-fun b!89659 () Bool)

(assert (=> b!89659 (= e!58347 (contains!761 lt!42653 (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538))))))

(assert (= (and d!23911 res!45814) b!89658))

(assert (= (and b!89658 res!45815) b!89659))

(assert (=> d!23911 m!95421))

(declare-fun m!96389 () Bool)

(assert (=> d!23911 m!96389))

(declare-fun m!96391 () Bool)

(assert (=> d!23911 m!96391))

(declare-fun m!96393 () Bool)

(assert (=> b!89658 m!96393))

(declare-fun m!96395 () Bool)

(assert (=> b!89659 m!96395))

(assert (=> d!23681 d!23911))

(declare-fun b!89660 () Bool)

(declare-fun e!58348 () List!1526)

(declare-fun call!8721 () List!1526)

(assert (=> b!89660 (= e!58348 call!8721)))

(declare-fun b!89661 () Bool)

(declare-fun e!58352 () Bool)

(declare-fun lt!43168 () List!1526)

(assert (=> b!89661 (= e!58352 (contains!761 lt!43168 (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538))))))

(declare-fun b!89662 () Bool)

(declare-fun e!58351 () List!1526)

(declare-fun call!8720 () List!1526)

(assert (=> b!89662 (= e!58351 call!8720)))

(declare-fun bm!8717 () Bool)

(declare-fun call!8722 () List!1526)

(assert (=> bm!8717 (= call!8721 call!8722)))

(declare-fun b!89663 () Bool)

(declare-fun c!14933 () Bool)

(assert (=> b!89663 (= c!14933 (and ((_ is Cons!1522) (toList!750 lt!42530)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42538))))))

(declare-fun e!58350 () List!1526)

(assert (=> b!89663 (= e!58350 e!58348)))

(declare-fun b!89664 () Bool)

(declare-fun e!58349 () List!1526)

(assert (=> b!89664 (= e!58349 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42530)) (_1!1116 lt!42538) (_2!1116 lt!42538)))))

(declare-fun bm!8719 () Bool)

(assert (=> bm!8719 (= call!8722 call!8720)))

(declare-fun b!89665 () Bool)

(declare-fun c!14935 () Bool)

(assert (=> b!89665 (= e!58349 (ite c!14935 (t!5284 (toList!750 lt!42530)) (ite c!14933 (Cons!1522 (h!2114 (toList!750 lt!42530)) (t!5284 (toList!750 lt!42530))) Nil!1523)))))

(declare-fun b!89666 () Bool)

(assert (=> b!89666 (= e!58350 call!8722)))

(declare-fun b!89667 () Bool)

(assert (=> b!89667 (= e!58351 e!58350)))

(assert (=> b!89667 (= c!14935 (and ((_ is Cons!1522) (toList!750 lt!42530)) (= (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42538))))))

(declare-fun c!14934 () Bool)

(declare-fun bm!8718 () Bool)

(assert (=> bm!8718 (= call!8720 ($colon$colon!74 e!58349 (ite c!14934 (h!2114 (toList!750 lt!42530)) (tuple2!2211 (_1!1116 lt!42538) (_2!1116 lt!42538)))))))

(declare-fun c!14932 () Bool)

(assert (=> bm!8718 (= c!14932 c!14934)))

(declare-fun d!23913 () Bool)

(assert (=> d!23913 e!58352))

(declare-fun res!45816 () Bool)

(assert (=> d!23913 (=> (not res!45816) (not e!58352))))

(assert (=> d!23913 (= res!45816 (isStrictlySorted!300 lt!43168))))

(assert (=> d!23913 (= lt!43168 e!58351)))

(assert (=> d!23913 (= c!14934 (and ((_ is Cons!1522) (toList!750 lt!42530)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42530))) (_1!1116 lt!42538))))))

(assert (=> d!23913 (isStrictlySorted!300 (toList!750 lt!42530))))

(assert (=> d!23913 (= (insertStrictlySorted!62 (toList!750 lt!42530) (_1!1116 lt!42538) (_2!1116 lt!42538)) lt!43168)))

(declare-fun b!89668 () Bool)

(declare-fun res!45817 () Bool)

(assert (=> b!89668 (=> (not res!45817) (not e!58352))))

(assert (=> b!89668 (= res!45817 (containsKey!146 lt!43168 (_1!1116 lt!42538)))))

(declare-fun b!89669 () Bool)

(assert (=> b!89669 (= e!58348 call!8721)))

(assert (= (and d!23913 c!14934) b!89662))

(assert (= (and d!23913 (not c!14934)) b!89667))

(assert (= (and b!89667 c!14935) b!89666))

(assert (= (and b!89667 (not c!14935)) b!89663))

(assert (= (and b!89663 c!14933) b!89660))

(assert (= (and b!89663 (not c!14933)) b!89669))

(assert (= (or b!89660 b!89669) bm!8717))

(assert (= (or b!89666 bm!8717) bm!8719))

(assert (= (or b!89662 bm!8719) bm!8718))

(assert (= (and bm!8718 c!14932) b!89664))

(assert (= (and bm!8718 (not c!14932)) b!89665))

(assert (= (and d!23913 res!45816) b!89668))

(assert (= (and b!89668 res!45817) b!89661))

(declare-fun m!96397 () Bool)

(assert (=> b!89661 m!96397))

(declare-fun m!96399 () Bool)

(assert (=> b!89668 m!96399))

(declare-fun m!96401 () Bool)

(assert (=> bm!8718 m!96401))

(declare-fun m!96403 () Bool)

(assert (=> b!89664 m!96403))

(declare-fun m!96405 () Bool)

(assert (=> d!23913 m!96405))

(assert (=> d!23913 m!96123))

(assert (=> d!23681 d!23913))

(declare-fun d!23915 () Bool)

(assert (=> d!23915 (isDefined!95 (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun lt!43171 () Unit!2636)

(declare-fun choose!534 (List!1526 (_ BitVec 64)) Unit!2636)

(assert (=> d!23915 (= lt!43171 (choose!534 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!58355 () Bool)

(assert (=> d!23915 e!58355))

(declare-fun res!45820 () Bool)

(assert (=> d!23915 (=> (not res!45820) (not e!58355))))

(assert (=> d!23915 (= res!45820 (isStrictlySorted!300 (toList!750 lt!42531)))))

(assert (=> d!23915 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) lt!43171)))

(declare-fun b!89672 () Bool)

(assert (=> b!89672 (= e!58355 (containsKey!146 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23915 res!45820) b!89672))

(assert (=> d!23915 m!95201))

(assert (=> d!23915 m!95479))

(assert (=> d!23915 m!95479))

(assert (=> d!23915 m!95481))

(assert (=> d!23915 m!95201))

(declare-fun m!96407 () Bool)

(assert (=> d!23915 m!96407))

(declare-fun m!96409 () Bool)

(assert (=> d!23915 m!96409))

(assert (=> b!89672 m!95201))

(assert (=> b!89672 m!95475))

(assert (=> b!88999 d!23915))

(declare-fun d!23917 () Bool)

(declare-fun isEmpty!343 (Option!148) Bool)

(assert (=> d!23917 (= (isDefined!95 (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))) (not (isEmpty!343 (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))))

(declare-fun bs!3771 () Bool)

(assert (= bs!3771 d!23917))

(assert (=> bs!3771 m!95479))

(declare-fun m!96411 () Bool)

(assert (=> bs!3771 m!96411))

(assert (=> b!88999 d!23917))

(declare-fun b!89673 () Bool)

(declare-fun e!58356 () Option!148)

(assert (=> b!89673 (= e!58356 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42531)))))))

(declare-fun d!23919 () Bool)

(declare-fun c!14936 () Bool)

(assert (=> d!23919 (= c!14936 (and ((_ is Cons!1522) (toList!750 lt!42531)) (= (_1!1116 (h!2114 (toList!750 lt!42531))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23919 (= (getValueByKey!142 (toList!750 lt!42531) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) e!58356)))

(declare-fun b!89676 () Bool)

(declare-fun e!58357 () Option!148)

(assert (=> b!89676 (= e!58357 None!146)))

(declare-fun b!89675 () Bool)

(assert (=> b!89675 (= e!58357 (getValueByKey!142 (t!5284 (toList!750 lt!42531)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89674 () Bool)

(assert (=> b!89674 (= e!58356 e!58357)))

(declare-fun c!14937 () Bool)

(assert (=> b!89674 (= c!14937 (and ((_ is Cons!1522) (toList!750 lt!42531)) (not (= (_1!1116 (h!2114 (toList!750 lt!42531))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))))

(assert (= (and d!23919 c!14936) b!89673))

(assert (= (and d!23919 (not c!14936)) b!89674))

(assert (= (and b!89674 c!14937) b!89675))

(assert (= (and b!89674 (not c!14937)) b!89676))

(assert (=> b!89675 m!95201))

(declare-fun m!96413 () Bool)

(assert (=> b!89675 m!96413))

(assert (=> b!88999 d!23919))

(assert (=> b!88940 d!23903))

(declare-fun d!23921 () Bool)

(declare-fun e!58359 () Bool)

(assert (=> d!23921 e!58359))

(declare-fun res!45821 () Bool)

(assert (=> d!23921 (=> res!45821 e!58359)))

(declare-fun lt!43172 () Bool)

(assert (=> d!23921 (= res!45821 (not lt!43172))))

(declare-fun lt!43175 () Bool)

(assert (=> d!23921 (= lt!43172 lt!43175)))

(declare-fun lt!43174 () Unit!2636)

(declare-fun e!58358 () Unit!2636)

(assert (=> d!23921 (= lt!43174 e!58358)))

(declare-fun c!14938 () Bool)

(assert (=> d!23921 (= c!14938 lt!43175)))

(assert (=> d!23921 (= lt!43175 (containsKey!146 (toList!750 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635))) lt!42630))))

(assert (=> d!23921 (= (contains!760 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635)) lt!42630) lt!43172)))

(declare-fun b!89677 () Bool)

(declare-fun lt!43173 () Unit!2636)

(assert (=> b!89677 (= e!58358 lt!43173)))

(assert (=> b!89677 (= lt!43173 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635))) lt!42630))))

(assert (=> b!89677 (isDefined!95 (getValueByKey!142 (toList!750 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635))) lt!42630))))

(declare-fun b!89678 () Bool)

(declare-fun Unit!2664 () Unit!2636)

(assert (=> b!89678 (= e!58358 Unit!2664)))

(declare-fun b!89679 () Bool)

(assert (=> b!89679 (= e!58359 (isDefined!95 (getValueByKey!142 (toList!750 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635))) lt!42630)))))

(assert (= (and d!23921 c!14938) b!89677))

(assert (= (and d!23921 (not c!14938)) b!89678))

(assert (= (and d!23921 (not res!45821)) b!89679))

(declare-fun m!96415 () Bool)

(assert (=> d!23921 m!96415))

(declare-fun m!96417 () Bool)

(assert (=> b!89677 m!96417))

(declare-fun m!96419 () Bool)

(assert (=> b!89677 m!96419))

(assert (=> b!89677 m!96419))

(declare-fun m!96421 () Bool)

(assert (=> b!89677 m!96421))

(assert (=> b!89679 m!96419))

(assert (=> b!89679 m!96419))

(assert (=> b!89679 m!96421))

(assert (=> b!88940 d!23921))

(declare-fun d!23923 () Bool)

(declare-fun e!58360 () Bool)

(assert (=> d!23923 e!58360))

(declare-fun res!45822 () Bool)

(assert (=> d!23923 (=> (not res!45822) (not e!58360))))

(declare-fun lt!43177 () ListLongMap!1469)

(assert (=> d!23923 (= res!45822 (contains!760 lt!43177 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!43179 () List!1526)

(assert (=> d!23923 (= lt!43177 (ListLongMap!1470 lt!43179))))

(declare-fun lt!43178 () Unit!2636)

(declare-fun lt!43176 () Unit!2636)

(assert (=> d!23923 (= lt!43178 lt!43176)))

(assert (=> d!23923 (= (getValueByKey!142 lt!43179 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23923 (= lt!43176 (lemmaContainsTupThenGetReturnValue!59 lt!43179 (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23923 (= lt!43179 (insertStrictlySorted!62 (toList!750 call!8553) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23923 (= (+!113 call!8553 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!43177)))

(declare-fun b!89680 () Bool)

(declare-fun res!45823 () Bool)

(assert (=> b!89680 (=> (not res!45823) (not e!58360))))

(assert (=> b!89680 (= res!45823 (= (getValueByKey!142 (toList!750 lt!43177) (_1!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!147 (_2!1116 (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!89681 () Bool)

(assert (=> b!89681 (= e!58360 (contains!761 (toList!750 lt!43177) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1208 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23923 res!45822) b!89680))

(assert (= (and b!89680 res!45823) b!89681))

(declare-fun m!96423 () Bool)

(assert (=> d!23923 m!96423))

(declare-fun m!96425 () Bool)

(assert (=> d!23923 m!96425))

(declare-fun m!96427 () Bool)

(assert (=> d!23923 m!96427))

(declare-fun m!96429 () Bool)

(assert (=> d!23923 m!96429))

(declare-fun m!96431 () Bool)

(assert (=> b!89680 m!96431))

(declare-fun m!96433 () Bool)

(assert (=> b!89681 m!96433))

(assert (=> b!88940 d!23923))

(declare-fun d!23925 () Bool)

(assert (=> d!23925 (not (contains!760 (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635)) lt!42630))))

(declare-fun lt!43182 () Unit!2636)

(declare-fun choose!535 (ListLongMap!1469 (_ BitVec 64) V!3043 (_ BitVec 64)) Unit!2636)

(assert (=> d!23925 (= lt!43182 (choose!535 lt!42632 lt!42631 lt!42635 lt!42630))))

(declare-fun e!58363 () Bool)

(assert (=> d!23925 e!58363))

(declare-fun res!45826 () Bool)

(assert (=> d!23925 (=> (not res!45826) (not e!58363))))

(assert (=> d!23925 (= res!45826 (not (contains!760 lt!42632 lt!42630)))))

(assert (=> d!23925 (= (addStillNotContains!33 lt!42632 lt!42631 lt!42635 lt!42630) lt!43182)))

(declare-fun b!89685 () Bool)

(assert (=> b!89685 (= e!58363 (not (= lt!42631 lt!42630)))))

(assert (= (and d!23925 res!45826) b!89685))

(assert (=> d!23925 m!95347))

(assert (=> d!23925 m!95347))

(assert (=> d!23925 m!95357))

(declare-fun m!96435 () Bool)

(assert (=> d!23925 m!96435))

(declare-fun m!96437 () Bool)

(assert (=> d!23925 m!96437))

(assert (=> b!88940 d!23925))

(declare-fun d!23927 () Bool)

(declare-fun e!58364 () Bool)

(assert (=> d!23927 e!58364))

(declare-fun res!45827 () Bool)

(assert (=> d!23927 (=> (not res!45827) (not e!58364))))

(declare-fun lt!43184 () ListLongMap!1469)

(assert (=> d!23927 (= res!45827 (contains!760 lt!43184 (_1!1116 (tuple2!2211 lt!42631 lt!42635))))))

(declare-fun lt!43186 () List!1526)

(assert (=> d!23927 (= lt!43184 (ListLongMap!1470 lt!43186))))

(declare-fun lt!43185 () Unit!2636)

(declare-fun lt!43183 () Unit!2636)

(assert (=> d!23927 (= lt!43185 lt!43183)))

(assert (=> d!23927 (= (getValueByKey!142 lt!43186 (_1!1116 (tuple2!2211 lt!42631 lt!42635))) (Some!147 (_2!1116 (tuple2!2211 lt!42631 lt!42635))))))

(assert (=> d!23927 (= lt!43183 (lemmaContainsTupThenGetReturnValue!59 lt!43186 (_1!1116 (tuple2!2211 lt!42631 lt!42635)) (_2!1116 (tuple2!2211 lt!42631 lt!42635))))))

(assert (=> d!23927 (= lt!43186 (insertStrictlySorted!62 (toList!750 lt!42632) (_1!1116 (tuple2!2211 lt!42631 lt!42635)) (_2!1116 (tuple2!2211 lt!42631 lt!42635))))))

(assert (=> d!23927 (= (+!113 lt!42632 (tuple2!2211 lt!42631 lt!42635)) lt!43184)))

(declare-fun b!89686 () Bool)

(declare-fun res!45828 () Bool)

(assert (=> b!89686 (=> (not res!45828) (not e!58364))))

(assert (=> b!89686 (= res!45828 (= (getValueByKey!142 (toList!750 lt!43184) (_1!1116 (tuple2!2211 lt!42631 lt!42635))) (Some!147 (_2!1116 (tuple2!2211 lt!42631 lt!42635)))))))

(declare-fun b!89687 () Bool)

(assert (=> b!89687 (= e!58364 (contains!761 (toList!750 lt!43184) (tuple2!2211 lt!42631 lt!42635)))))

(assert (= (and d!23927 res!45827) b!89686))

(assert (= (and b!89686 res!45828) b!89687))

(declare-fun m!96439 () Bool)

(assert (=> d!23927 m!96439))

(declare-fun m!96441 () Bool)

(assert (=> d!23927 m!96441))

(declare-fun m!96443 () Bool)

(assert (=> d!23927 m!96443))

(declare-fun m!96445 () Bool)

(assert (=> d!23927 m!96445))

(declare-fun m!96447 () Bool)

(assert (=> b!89686 m!96447))

(declare-fun m!96449 () Bool)

(assert (=> b!89687 m!96449))

(assert (=> b!88940 d!23927))

(declare-fun d!23929 () Bool)

(declare-fun res!45829 () Bool)

(declare-fun e!58365 () Bool)

(assert (=> d!23929 (=> (not res!45829) (not e!58365))))

(assert (=> d!23929 (= res!45829 (simpleValid!60 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23929 (= (valid!329 (v!2674 (underlying!295 thiss!992))) e!58365)))

(declare-fun b!89688 () Bool)

(declare-fun res!45830 () Bool)

(assert (=> b!89688 (=> (not res!45830) (not e!58365))))

(assert (=> b!89688 (= res!45830 (= (arrayCountValidKeys!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))) (_size!433 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89689 () Bool)

(declare-fun res!45831 () Bool)

(assert (=> b!89689 (=> (not res!45831) (not e!58365))))

(assert (=> b!89689 (= res!45831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89690 () Bool)

(assert (=> b!89690 (= e!58365 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) #b00000000000000000000000000000000 Nil!1524))))

(assert (= (and d!23929 res!45829) b!89688))

(assert (= (and b!89688 res!45830) b!89689))

(assert (= (and b!89689 res!45831) b!89690))

(declare-fun m!96451 () Bool)

(assert (=> d!23929 m!96451))

(declare-fun m!96453 () Bool)

(assert (=> b!89688 m!96453))

(assert (=> b!89689 m!95195))

(assert (=> b!89690 m!95199))

(assert (=> d!23705 d!23929))

(declare-fun d!23931 () Bool)

(assert (=> d!23931 (= (apply!84 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1211 (getValueByKey!142 (toList!750 lt!42811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3772 () Bool)

(assert (= bs!3772 d!23931))

(assert (=> bs!3772 m!96231))

(assert (=> bs!3772 m!96231))

(declare-fun m!96455 () Bool)

(assert (=> bs!3772 m!96455))

(assert (=> b!89177 d!23931))

(declare-fun b!89691 () Bool)

(declare-fun e!58369 () Bool)

(declare-fun e!58368 () Bool)

(assert (=> b!89691 (= e!58369 e!58368)))

(declare-fun c!14939 () Bool)

(assert (=> b!89691 (= c!14939 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!8723 () Bool)

(declare-fun bm!8720 () Bool)

(assert (=> bm!8720 (= call!8723 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14939 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!14735 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) Nil!1524) Nil!1524)) (ite c!14735 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) Nil!1524) Nil!1524))))))

(declare-fun b!89692 () Bool)

(declare-fun e!58366 () Bool)

(assert (=> b!89692 (= e!58366 e!58369)))

(declare-fun res!45832 () Bool)

(assert (=> b!89692 (=> (not res!45832) (not e!58369))))

(declare-fun e!58367 () Bool)

(assert (=> b!89692 (= res!45832 (not e!58367))))

(declare-fun res!45833 () Bool)

(assert (=> b!89692 (=> (not res!45833) (not e!58367))))

(assert (=> b!89692 (= res!45833 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!23933 () Bool)

(declare-fun res!45834 () Bool)

(assert (=> d!23933 (=> res!45834 e!58366)))

(assert (=> d!23933 (= res!45834 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23933 (= (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14735 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) Nil!1524) Nil!1524)) e!58366)))

(declare-fun b!89693 () Bool)

(assert (=> b!89693 (= e!58368 call!8723)))

(declare-fun b!89694 () Bool)

(assert (=> b!89694 (= e!58368 call!8723)))

(declare-fun b!89695 () Bool)

(assert (=> b!89695 (= e!58367 (contains!762 (ite c!14735 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) Nil!1524) Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!23933 (not res!45834)) b!89692))

(assert (= (and b!89692 res!45833) b!89695))

(assert (= (and b!89692 res!45832) b!89691))

(assert (= (and b!89691 c!14939) b!89693))

(assert (= (and b!89691 (not c!14939)) b!89694))

(assert (= (or b!89693 b!89694) bm!8720))

(assert (=> b!89691 m!96131))

(assert (=> b!89691 m!96131))

(assert (=> b!89691 m!96133))

(assert (=> bm!8720 m!96131))

(declare-fun m!96457 () Bool)

(assert (=> bm!8720 m!96457))

(assert (=> b!89692 m!96131))

(assert (=> b!89692 m!96131))

(assert (=> b!89692 m!96133))

(assert (=> b!89695 m!96131))

(assert (=> b!89695 m!96131))

(declare-fun m!96459 () Bool)

(assert (=> b!89695 m!96459))

(assert (=> bm!8553 d!23933))

(declare-fun d!23935 () Bool)

(assert (=> d!23935 (= (get!1209 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355) (dynLambda!344 (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2673 (select (arr!1932 (_values!2355 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!88991 d!23935))

(declare-fun d!23937 () Bool)

(declare-fun e!58372 () Bool)

(assert (=> d!23937 e!58372))

(declare-fun res!45837 () Bool)

(assert (=> d!23937 (=> (not res!45837) (not e!58372))))

(assert (=> d!23937 (= res!45837 (and (bvsge (index!3120 lt!42750) #b00000000000000000000000000000000) (bvslt (index!3120 lt!42750) (size!2177 (_keys!4050 newMap!16)))))))

(declare-fun lt!43189 () Unit!2636)

(declare-fun choose!536 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) Int) Unit!2636)

(assert (=> d!23937 (= lt!43189 (choose!536 (_keys!4050 newMap!16) lt!42734 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (defaultEntry!2372 newMap!16)))))

(assert (=> d!23937 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23937 (= (lemmaValidKeyInArrayIsInListMap!94 (_keys!4050 newMap!16) lt!42734 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (defaultEntry!2372 newMap!16)) lt!43189)))

(declare-fun b!89698 () Bool)

(assert (=> b!89698 (= e!58372 (contains!760 (getCurrentListMap!443 (_keys!4050 newMap!16) lt!42734 (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750))))))

(assert (= (and d!23937 res!45837) b!89698))

(declare-fun m!96461 () Bool)

(assert (=> d!23937 m!96461))

(assert (=> d!23937 m!95621))

(declare-fun m!96463 () Bool)

(assert (=> b!89698 m!96463))

(assert (=> b!89698 m!95527))

(assert (=> b!89698 m!96463))

(assert (=> b!89698 m!95527))

(declare-fun m!96465 () Bool)

(assert (=> b!89698 m!96465))

(assert (=> b!89099 d!23937))

(declare-fun d!23939 () Bool)

(declare-fun e!58375 () Bool)

(assert (=> d!23939 e!58375))

(declare-fun res!45840 () Bool)

(assert (=> d!23939 (=> (not res!45840) (not e!58375))))

(assert (=> d!23939 (= res!45840 (and (bvsge (index!3120 lt!42750) #b00000000000000000000000000000000) (bvslt (index!3120 lt!42750) (size!2178 (_values!2355 newMap!16)))))))

(declare-fun lt!43192 () Unit!2636)

(declare-fun choose!537 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 32) (_ BitVec 64) V!3043 Int) Unit!2636)

(assert (=> d!23939 (= lt!43192 (choose!537 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (defaultEntry!2372 newMap!16)))))

(assert (=> d!23939 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23939 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (index!3120 lt!42750) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545 (defaultEntry!2372 newMap!16)) lt!43192)))

(declare-fun b!89701 () Bool)

(assert (=> b!89701 (= e!58375 (= (+!113 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)) (getCurrentListMap!443 (_keys!4050 newMap!16) (array!4060 (store (arr!1932 (_values!2355 newMap!16)) (index!3120 lt!42750) (ValueCellFull!930 lt!42545)) (size!2178 (_values!2355 newMap!16))) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16))))))

(assert (= (and d!23939 res!45840) b!89701))

(assert (=> d!23939 m!95201))

(declare-fun m!96467 () Bool)

(assert (=> d!23939 m!96467))

(assert (=> d!23939 m!95621))

(assert (=> b!89701 m!95507))

(assert (=> b!89701 m!95507))

(assert (=> b!89701 m!96055))

(assert (=> b!89701 m!95485))

(declare-fun m!96469 () Bool)

(assert (=> b!89701 m!96469))

(assert (=> b!89099 d!23939))

(declare-fun d!23941 () Bool)

(declare-fun e!58377 () Bool)

(assert (=> d!23941 e!58377))

(declare-fun res!45841 () Bool)

(assert (=> d!23941 (=> res!45841 e!58377)))

(declare-fun lt!43193 () Bool)

(assert (=> d!23941 (= res!45841 (not lt!43193))))

(declare-fun lt!43196 () Bool)

(assert (=> d!23941 (= lt!43193 lt!43196)))

(declare-fun lt!43195 () Unit!2636)

(declare-fun e!58376 () Unit!2636)

(assert (=> d!23941 (= lt!43195 e!58376)))

(declare-fun c!14940 () Bool)

(assert (=> d!23941 (= c!14940 lt!43196)))

(assert (=> d!23941 (= lt!43196 (containsKey!146 (toList!750 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23941 (= (contains!760 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) lt!43193)))

(declare-fun b!89702 () Bool)

(declare-fun lt!43194 () Unit!2636)

(assert (=> b!89702 (= e!58376 lt!43194)))

(assert (=> b!89702 (= lt!43194 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!89702 (isDefined!95 (getValueByKey!142 (toList!750 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89703 () Bool)

(declare-fun Unit!2665 () Unit!2636)

(assert (=> b!89703 (= e!58376 Unit!2665)))

(declare-fun b!89704 () Bool)

(assert (=> b!89704 (= e!58377 (isDefined!95 (getValueByKey!142 (toList!750 (getCurrentListMap!443 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2372 newMap!16))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23941 c!14940) b!89702))

(assert (= (and d!23941 (not c!14940)) b!89703))

(assert (= (and d!23941 (not res!45841)) b!89704))

(assert (=> d!23941 m!95201))

(declare-fun m!96471 () Bool)

(assert (=> d!23941 m!96471))

(assert (=> b!89702 m!95201))

(declare-fun m!96473 () Bool)

(assert (=> b!89702 m!96473))

(assert (=> b!89702 m!95201))

(declare-fun m!96475 () Bool)

(assert (=> b!89702 m!96475))

(assert (=> b!89702 m!96475))

(declare-fun m!96477 () Bool)

(assert (=> b!89702 m!96477))

(assert (=> b!89704 m!95201))

(assert (=> b!89704 m!96475))

(assert (=> b!89704 m!96475))

(assert (=> b!89704 m!96477))

(assert (=> b!89099 d!23941))

(assert (=> b!89099 d!23777))

(assert (=> b!89001 d!23917))

(assert (=> b!89001 d!23919))

(declare-fun d!23943 () Bool)

(declare-fun e!58378 () Bool)

(assert (=> d!23943 e!58378))

(declare-fun res!45842 () Bool)

(assert (=> d!23943 (=> (not res!45842) (not e!58378))))

(declare-fun lt!43198 () ListLongMap!1469)

(assert (=> d!23943 (= res!45842 (contains!760 lt!43198 (_1!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(declare-fun lt!43200 () List!1526)

(assert (=> d!23943 (= lt!43198 (ListLongMap!1470 lt!43200))))

(declare-fun lt!43199 () Unit!2636)

(declare-fun lt!43197 () Unit!2636)

(assert (=> d!23943 (= lt!43199 lt!43197)))

(assert (=> d!23943 (= (getValueByKey!142 lt!43200 (_1!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))) (Some!147 (_2!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(assert (=> d!23943 (= lt!43197 (lemmaContainsTupThenGetReturnValue!59 lt!43200 (_1!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (_2!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(assert (=> d!23943 (= lt!43200 (insertStrictlySorted!62 (toList!750 e!58025) (_1!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) (_2!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))))))

(assert (=> d!23943 (= (+!113 e!58025 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))) lt!43198)))

(declare-fun b!89705 () Bool)

(declare-fun res!45843 () Bool)

(assert (=> b!89705 (=> (not res!45843) (not e!58378))))

(assert (=> b!89705 (= res!45843 (= (getValueByKey!142 (toList!750 lt!43198) (_1!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545)))) (Some!147 (_2!1116 (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))))

(declare-fun b!89706 () Bool)

(assert (=> b!89706 (= e!58378 (contains!761 (toList!750 lt!43198) (ite c!14779 (ite c!14770 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42545) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42545)) (tuple2!2211 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) lt!42545))))))

(assert (= (and d!23943 res!45842) b!89705))

(assert (= (and b!89705 res!45843) b!89706))

(declare-fun m!96479 () Bool)

(assert (=> d!23943 m!96479))

(declare-fun m!96481 () Bool)

(assert (=> d!23943 m!96481))

(declare-fun m!96483 () Bool)

(assert (=> d!23943 m!96483))

(declare-fun m!96485 () Bool)

(assert (=> d!23943 m!96485))

(declare-fun m!96487 () Bool)

(assert (=> b!89705 m!96487))

(declare-fun m!96489 () Bool)

(assert (=> b!89706 m!96489))

(assert (=> bm!8617 d!23943))

(assert (=> b!88942 d!23793))

(declare-fun b!89707 () Bool)

(declare-fun e!58379 () Option!148)

(assert (=> b!89707 (= e!58379 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42647)))))))

(declare-fun d!23945 () Bool)

(declare-fun c!14941 () Bool)

(assert (=> d!23945 (= c!14941 (and ((_ is Cons!1522) (toList!750 lt!42647)) (= (_1!1116 (h!2114 (toList!750 lt!42647))) (_1!1116 lt!42538))))))

(assert (=> d!23945 (= (getValueByKey!142 (toList!750 lt!42647) (_1!1116 lt!42538)) e!58379)))

(declare-fun b!89710 () Bool)

(declare-fun e!58380 () Option!148)

(assert (=> b!89710 (= e!58380 None!146)))

(declare-fun b!89709 () Bool)

(assert (=> b!89709 (= e!58380 (getValueByKey!142 (t!5284 (toList!750 lt!42647)) (_1!1116 lt!42538)))))

(declare-fun b!89708 () Bool)

(assert (=> b!89708 (= e!58379 e!58380)))

(declare-fun c!14942 () Bool)

(assert (=> b!89708 (= c!14942 (and ((_ is Cons!1522) (toList!750 lt!42647)) (not (= (_1!1116 (h!2114 (toList!750 lt!42647))) (_1!1116 lt!42538)))))))

(assert (= (and d!23945 c!14941) b!89707))

(assert (= (and d!23945 (not c!14941)) b!89708))

(assert (= (and b!89708 c!14942) b!89709))

(assert (= (and b!89708 (not c!14942)) b!89710))

(declare-fun m!96491 () Bool)

(assert (=> b!89709 m!96491))

(assert (=> b!88955 d!23945))

(declare-fun d!23947 () Bool)

(declare-fun lt!43201 () Bool)

(assert (=> d!23947 (= lt!43201 (select (content!94 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!58381 () Bool)

(assert (=> d!23947 (= lt!43201 e!58381)))

(declare-fun res!45844 () Bool)

(assert (=> d!23947 (=> (not res!45844) (not e!58381))))

(assert (=> d!23947 (= res!45844 ((_ is Cons!1523) Nil!1524))))

(assert (=> d!23947 (= (contains!762 Nil!1524 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) lt!43201)))

(declare-fun b!89711 () Bool)

(declare-fun e!58382 () Bool)

(assert (=> b!89711 (= e!58381 e!58382)))

(declare-fun res!45845 () Bool)

(assert (=> b!89711 (=> res!45845 e!58382)))

(assert (=> b!89711 (= res!45845 (= (h!2115 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89712 () Bool)

(assert (=> b!89712 (= e!58382 (contains!762 (t!5285 Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23947 res!45844) b!89711))

(assert (= (and b!89711 (not res!45845)) b!89712))

(assert (=> d!23947 m!96243))

(assert (=> d!23947 m!95201))

(declare-fun m!96493 () Bool)

(assert (=> d!23947 m!96493))

(assert (=> b!89712 m!95201))

(declare-fun m!96495 () Bool)

(assert (=> b!89712 m!96495))

(assert (=> b!89219 d!23947))

(declare-fun b!89723 () Bool)

(declare-fun res!45855 () Bool)

(declare-fun e!58385 () Bool)

(assert (=> b!89723 (=> (not res!45855) (not e!58385))))

(declare-fun size!2181 (LongMapFixedSize!768) (_ BitVec 32))

(assert (=> b!89723 (= res!45855 (= (size!2181 newMap!16) (bvadd (_size!433 newMap!16) (bvsdiv (bvadd (extraKeys!2205 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!23949 () Bool)

(declare-fun res!45854 () Bool)

(assert (=> d!23949 (=> (not res!45854) (not e!58385))))

(assert (=> d!23949 (= res!45854 (validMask!0 (mask!6416 newMap!16)))))

(assert (=> d!23949 (= (simpleValid!60 newMap!16) e!58385)))

(declare-fun b!89722 () Bool)

(declare-fun res!45856 () Bool)

(assert (=> b!89722 (=> (not res!45856) (not e!58385))))

(assert (=> b!89722 (= res!45856 (bvsge (size!2181 newMap!16) (_size!433 newMap!16)))))

(declare-fun b!89724 () Bool)

(assert (=> b!89724 (= e!58385 (and (bvsge (extraKeys!2205 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2205 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!433 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!89721 () Bool)

(declare-fun res!45857 () Bool)

(assert (=> b!89721 (=> (not res!45857) (not e!58385))))

(assert (=> b!89721 (= res!45857 (and (= (size!2178 (_values!2355 newMap!16)) (bvadd (mask!6416 newMap!16) #b00000000000000000000000000000001)) (= (size!2177 (_keys!4050 newMap!16)) (size!2178 (_values!2355 newMap!16))) (bvsge (_size!433 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!433 newMap!16) (bvadd (mask!6416 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!23949 res!45854) b!89721))

(assert (= (and b!89721 res!45857) b!89722))

(assert (= (and b!89722 res!45856) b!89723))

(assert (= (and b!89723 res!45855) b!89724))

(declare-fun m!96497 () Bool)

(assert (=> b!89723 m!96497))

(assert (=> d!23949 m!95621))

(assert (=> b!89722 m!96497))

(assert (=> d!23691 d!23949))

(declare-fun b!89725 () Bool)

(declare-fun e!58386 () Bool)

(declare-fun e!58387 () Bool)

(assert (=> b!89725 (= e!58386 e!58387)))

(declare-fun c!14943 () Bool)

(assert (=> b!89725 (= c!14943 (validKeyInArray!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89726 () Bool)

(declare-fun e!58388 () Bool)

(declare-fun call!8724 () Bool)

(assert (=> b!89726 (= e!58388 call!8724)))

(declare-fun bm!8721 () Bool)

(assert (=> bm!8721 (= call!8724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun b!89727 () Bool)

(assert (=> b!89727 (= e!58387 e!58388)))

(declare-fun lt!43202 () (_ BitVec 64))

(assert (=> b!89727 (= lt!43202 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43203 () Unit!2636)

(assert (=> b!89727 (= lt!43203 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4050 newMap!16) lt!43202 #b00000000000000000000000000000000))))

(assert (=> b!89727 (arrayContainsKey!0 (_keys!4050 newMap!16) lt!43202 #b00000000000000000000000000000000)))

(declare-fun lt!43204 () Unit!2636)

(assert (=> b!89727 (= lt!43204 lt!43203)))

(declare-fun res!45858 () Bool)

(assert (=> b!89727 (= res!45858 (= (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000) (_keys!4050 newMap!16) (mask!6416 newMap!16)) (Found!245 #b00000000000000000000000000000000)))))

(assert (=> b!89727 (=> (not res!45858) (not e!58388))))

(declare-fun b!89728 () Bool)

(assert (=> b!89728 (= e!58387 call!8724)))

(declare-fun d!23951 () Bool)

(declare-fun res!45859 () Bool)

(assert (=> d!23951 (=> res!45859 e!58386)))

(assert (=> d!23951 (= res!45859 (bvsge #b00000000000000000000000000000000 (size!2177 (_keys!4050 newMap!16))))))

(assert (=> d!23951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 newMap!16) (mask!6416 newMap!16)) e!58386)))

(assert (= (and d!23951 (not res!45859)) b!89725))

(assert (= (and b!89725 c!14943) b!89727))

(assert (= (and b!89725 (not c!14943)) b!89728))

(assert (= (and b!89727 res!45858) b!89726))

(assert (= (or b!89726 b!89728) bm!8721))

(assert (=> b!89725 m!95789))

(assert (=> b!89725 m!95789))

(assert (=> b!89725 m!95791))

(declare-fun m!96499 () Bool)

(assert (=> bm!8721 m!96499))

(assert (=> b!89727 m!95789))

(declare-fun m!96501 () Bool)

(assert (=> b!89727 m!96501))

(declare-fun m!96503 () Bool)

(assert (=> b!89727 m!96503))

(assert (=> b!89727 m!95789))

(declare-fun m!96505 () Bool)

(assert (=> b!89727 m!96505))

(assert (=> b!88985 d!23951))

(declare-fun b!89729 () Bool)

(declare-fun e!58389 () Option!148)

(assert (=> b!89729 (= e!58389 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42651)))))))

(declare-fun d!23953 () Bool)

(declare-fun c!14944 () Bool)

(assert (=> d!23953 (= c!14944 (and ((_ is Cons!1522) (toList!750 lt!42651)) (= (_1!1116 (h!2114 (toList!750 lt!42651))) (_1!1116 lt!42538))))))

(assert (=> d!23953 (= (getValueByKey!142 (toList!750 lt!42651) (_1!1116 lt!42538)) e!58389)))

(declare-fun b!89732 () Bool)

(declare-fun e!58390 () Option!148)

(assert (=> b!89732 (= e!58390 None!146)))

(declare-fun b!89731 () Bool)

(assert (=> b!89731 (= e!58390 (getValueByKey!142 (t!5284 (toList!750 lt!42651)) (_1!1116 lt!42538)))))

(declare-fun b!89730 () Bool)

(assert (=> b!89730 (= e!58389 e!58390)))

(declare-fun c!14945 () Bool)

(assert (=> b!89730 (= c!14945 (and ((_ is Cons!1522) (toList!750 lt!42651)) (not (= (_1!1116 (h!2114 (toList!750 lt!42651))) (_1!1116 lt!42538)))))))

(assert (= (and d!23953 c!14944) b!89729))

(assert (= (and d!23953 (not c!14944)) b!89730))

(assert (= (and b!89730 c!14945) b!89731))

(assert (= (and b!89730 (not c!14945)) b!89732))

(declare-fun m!96507 () Bool)

(assert (=> b!89731 m!96507))

(assert (=> b!88957 d!23953))

(declare-fun d!23955 () Bool)

(declare-fun e!58393 () Bool)

(assert (=> d!23955 e!58393))

(declare-fun res!45864 () Bool)

(assert (=> d!23955 (=> (not res!45864) (not e!58393))))

(declare-fun lt!43210 () SeekEntryResult!245)

(assert (=> d!23955 (= res!45864 ((_ is Found!245) lt!43210))))

(assert (=> d!23955 (= lt!43210 (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (_keys!4050 newMap!16) (mask!6416 newMap!16)))))

(declare-fun lt!43209 () Unit!2636)

(declare-fun choose!538 (array!4057 array!4059 (_ BitVec 32) (_ BitVec 32) V!3043 V!3043 (_ BitVec 64) Int) Unit!2636)

(assert (=> d!23955 (= lt!43209 (choose!538 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)))))

(assert (=> d!23955 (validMask!0 (mask!6416 newMap!16))))

(assert (=> d!23955 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4050 newMap!16) (_values!2355 newMap!16) (mask!6416 newMap!16) (extraKeys!2205 newMap!16) (zeroValue!2261 newMap!16) (minValue!2261 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (defaultEntry!2372 newMap!16)) lt!43209)))

(declare-fun b!89737 () Bool)

(declare-fun res!45865 () Bool)

(assert (=> b!89737 (=> (not res!45865) (not e!58393))))

(assert (=> b!89737 (= res!45865 (inRange!0 (index!3120 lt!43210) (mask!6416 newMap!16)))))

(declare-fun b!89738 () Bool)

(assert (=> b!89738 (= e!58393 (= (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!43210)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!89738 (and (bvsge (index!3120 lt!43210) #b00000000000000000000000000000000) (bvslt (index!3120 lt!43210) (size!2177 (_keys!4050 newMap!16))))))

(assert (= (and d!23955 res!45864) b!89737))

(assert (= (and b!89737 res!45865) b!89738))

(assert (=> d!23955 m!95201))

(assert (=> d!23955 m!95497))

(assert (=> d!23955 m!95201))

(declare-fun m!96509 () Bool)

(assert (=> d!23955 m!96509))

(assert (=> d!23955 m!95621))

(declare-fun m!96511 () Bool)

(assert (=> b!89737 m!96511))

(declare-fun m!96513 () Bool)

(assert (=> b!89738 m!96513))

(assert (=> bm!8615 d!23955))

(declare-fun d!23957 () Bool)

(declare-fun e!58395 () Bool)

(assert (=> d!23957 e!58395))

(declare-fun res!45866 () Bool)

(assert (=> d!23957 (=> res!45866 e!58395)))

(declare-fun lt!43211 () Bool)

(assert (=> d!23957 (= res!45866 (not lt!43211))))

(declare-fun lt!43214 () Bool)

(assert (=> d!23957 (= lt!43211 lt!43214)))

(declare-fun lt!43213 () Unit!2636)

(declare-fun e!58394 () Unit!2636)

(assert (=> d!23957 (= lt!43213 e!58394)))

(declare-fun c!14946 () Bool)

(assert (=> d!23957 (= c!14946 lt!43214)))

(assert (=> d!23957 (= lt!43214 (containsKey!146 (toList!750 call!8609) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23957 (= (contains!760 call!8609 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)) lt!43211)))

(declare-fun b!89739 () Bool)

(declare-fun lt!43212 () Unit!2636)

(assert (=> b!89739 (= e!58394 lt!43212)))

(assert (=> b!89739 (= lt!43212 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 call!8609) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!89739 (isDefined!95 (getValueByKey!142 (toList!750 call!8609) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!89740 () Bool)

(declare-fun Unit!2666 () Unit!2636)

(assert (=> b!89740 (= e!58394 Unit!2666)))

(declare-fun b!89741 () Bool)

(assert (=> b!89741 (= e!58395 (isDefined!95 (getValueByKey!142 (toList!750 call!8609) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23957 c!14946) b!89739))

(assert (= (and d!23957 (not c!14946)) b!89740))

(assert (= (and d!23957 (not res!45866)) b!89741))

(assert (=> d!23957 m!95201))

(declare-fun m!96515 () Bool)

(assert (=> d!23957 m!96515))

(assert (=> b!89739 m!95201))

(declare-fun m!96517 () Bool)

(assert (=> b!89739 m!96517))

(assert (=> b!89739 m!95201))

(declare-fun m!96519 () Bool)

(assert (=> b!89739 m!96519))

(assert (=> b!89739 m!96519))

(declare-fun m!96521 () Bool)

(assert (=> b!89739 m!96521))

(assert (=> b!89741 m!95201))

(assert (=> b!89741 m!96519))

(assert (=> b!89741 m!96519))

(assert (=> b!89741 m!96521))

(assert (=> b!89121 d!23957))

(declare-fun b!89742 () Bool)

(declare-fun e!58396 () Option!148)

(assert (=> b!89742 (= e!58396 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42655)))))))

(declare-fun d!23959 () Bool)

(declare-fun c!14947 () Bool)

(assert (=> d!23959 (= c!14947 (and ((_ is Cons!1522) (toList!750 lt!42655)) (= (_1!1116 (h!2114 (toList!750 lt!42655))) (_1!1116 lt!42540))))))

(assert (=> d!23959 (= (getValueByKey!142 (toList!750 lt!42655) (_1!1116 lt!42540)) e!58396)))

(declare-fun b!89745 () Bool)

(declare-fun e!58397 () Option!148)

(assert (=> b!89745 (= e!58397 None!146)))

(declare-fun b!89744 () Bool)

(assert (=> b!89744 (= e!58397 (getValueByKey!142 (t!5284 (toList!750 lt!42655)) (_1!1116 lt!42540)))))

(declare-fun b!89743 () Bool)

(assert (=> b!89743 (= e!58396 e!58397)))

(declare-fun c!14948 () Bool)

(assert (=> b!89743 (= c!14948 (and ((_ is Cons!1522) (toList!750 lt!42655)) (not (= (_1!1116 (h!2114 (toList!750 lt!42655))) (_1!1116 lt!42540)))))))

(assert (= (and d!23959 c!14947) b!89742))

(assert (= (and d!23959 (not c!14947)) b!89743))

(assert (= (and b!89743 c!14948) b!89744))

(assert (= (and b!89743 (not c!14948)) b!89745))

(declare-fun m!96523 () Bool)

(assert (=> b!89744 m!96523))

(assert (=> b!88959 d!23959))

(declare-fun d!23961 () Bool)

(declare-fun res!45867 () Bool)

(declare-fun e!58398 () Bool)

(assert (=> d!23961 (=> res!45867 e!58398)))

(assert (=> d!23961 (= res!45867 (= (select (arr!1931 (_keys!4050 newMap!16)) #b00000000000000000000000000000000) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23961 (= (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000) e!58398)))

(declare-fun b!89746 () Bool)

(declare-fun e!58399 () Bool)

(assert (=> b!89746 (= e!58398 e!58399)))

(declare-fun res!45868 () Bool)

(assert (=> b!89746 (=> (not res!45868) (not e!58399))))

(assert (=> b!89746 (= res!45868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2177 (_keys!4050 newMap!16))))))

(declare-fun b!89747 () Bool)

(assert (=> b!89747 (= e!58399 (arrayContainsKey!0 (_keys!4050 newMap!16) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23961 (not res!45867)) b!89746))

(assert (= (and b!89746 res!45868) b!89747))

(assert (=> d!23961 m!95789))

(assert (=> b!89747 m!95201))

(declare-fun m!96525 () Bool)

(assert (=> b!89747 m!96525))

(assert (=> bm!8621 d!23961))

(declare-fun d!23963 () Bool)

(declare-fun res!45869 () Bool)

(declare-fun e!58400 () Bool)

(assert (=> d!23963 (=> (not res!45869) (not e!58400))))

(assert (=> d!23963 (= res!45869 (simpleValid!60 (_2!1117 lt!42749)))))

(assert (=> d!23963 (= (valid!329 (_2!1117 lt!42749)) e!58400)))

(declare-fun b!89748 () Bool)

(declare-fun res!45870 () Bool)

(assert (=> b!89748 (=> (not res!45870) (not e!58400))))

(assert (=> b!89748 (= res!45870 (= (arrayCountValidKeys!0 (_keys!4050 (_2!1117 lt!42749)) #b00000000000000000000000000000000 (size!2177 (_keys!4050 (_2!1117 lt!42749)))) (_size!433 (_2!1117 lt!42749))))))

(declare-fun b!89749 () Bool)

(declare-fun res!45871 () Bool)

(assert (=> b!89749 (=> (not res!45871) (not e!58400))))

(assert (=> b!89749 (= res!45871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4050 (_2!1117 lt!42749)) (mask!6416 (_2!1117 lt!42749))))))

(declare-fun b!89750 () Bool)

(assert (=> b!89750 (= e!58400 (arrayNoDuplicates!0 (_keys!4050 (_2!1117 lt!42749)) #b00000000000000000000000000000000 Nil!1524))))

(assert (= (and d!23963 res!45869) b!89748))

(assert (= (and b!89748 res!45870) b!89749))

(assert (= (and b!89749 res!45871) b!89750))

(declare-fun m!96527 () Bool)

(assert (=> d!23963 m!96527))

(declare-fun m!96529 () Bool)

(assert (=> b!89748 m!96529))

(declare-fun m!96531 () Bool)

(assert (=> b!89749 m!96531))

(declare-fun m!96533 () Bool)

(assert (=> b!89750 m!96533))

(assert (=> d!23697 d!23963))

(assert (=> d!23697 d!23691))

(declare-fun b!89751 () Bool)

(declare-fun e!58404 () Bool)

(declare-fun e!58403 () Bool)

(assert (=> b!89751 (= e!58404 e!58403)))

(declare-fun c!14949 () Bool)

(assert (=> b!89751 (= c!14949 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun call!8725 () Bool)

(declare-fun bm!8722 () Bool)

(assert (=> bm!8722 (= call!8725 (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14949 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14808 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524) Nil!1524)) (ite c!14808 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524) Nil!1524))))))

(declare-fun b!89752 () Bool)

(declare-fun e!58401 () Bool)

(assert (=> b!89752 (= e!58401 e!58404)))

(declare-fun res!45872 () Bool)

(assert (=> b!89752 (=> (not res!45872) (not e!58404))))

(declare-fun e!58402 () Bool)

(assert (=> b!89752 (= res!45872 (not e!58402))))

(declare-fun res!45873 () Bool)

(assert (=> b!89752 (=> (not res!45873) (not e!58402))))

(assert (=> b!89752 (= res!45873 (validKeyInArray!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!23965 () Bool)

(declare-fun res!45874 () Bool)

(assert (=> d!23965 (=> res!45874 e!58401)))

(assert (=> d!23965 (= res!45874 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(assert (=> d!23965 (= (arrayNoDuplicates!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14808 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524) Nil!1524)) e!58401)))

(declare-fun b!89753 () Bool)

(assert (=> b!89753 (= e!58403 call!8725)))

(declare-fun b!89754 () Bool)

(assert (=> b!89754 (= e!58403 call!8725)))

(declare-fun b!89755 () Bool)

(assert (=> b!89755 (= e!58402 (contains!762 (ite c!14808 (Cons!1523 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) Nil!1524) Nil!1524) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!23965 (not res!45874)) b!89752))

(assert (= (and b!89752 res!45873) b!89755))

(assert (= (and b!89752 res!45872) b!89751))

(assert (= (and b!89751 c!14949) b!89753))

(assert (= (and b!89751 (not c!14949)) b!89754))

(assert (= (or b!89753 b!89754) bm!8722))

(declare-fun m!96535 () Bool)

(assert (=> b!89751 m!96535))

(assert (=> b!89751 m!96535))

(declare-fun m!96537 () Bool)

(assert (=> b!89751 m!96537))

(assert (=> bm!8722 m!96535))

(declare-fun m!96539 () Bool)

(assert (=> bm!8722 m!96539))

(assert (=> b!89752 m!96535))

(assert (=> b!89752 m!96535))

(assert (=> b!89752 m!96537))

(assert (=> b!89755 m!96535))

(assert (=> b!89755 m!96535))

(declare-fun m!96541 () Bool)

(assert (=> b!89755 m!96541))

(assert (=> bm!8650 d!23965))

(declare-fun d!23967 () Bool)

(assert (=> d!23967 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000)))

(declare-fun lt!43217 () Unit!2636)

(declare-fun choose!13 (array!4057 (_ BitVec 64) (_ BitVec 32)) Unit!2636)

(assert (=> d!23967 (= lt!43217 (choose!13 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000))))

(assert (=> d!23967 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23967 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000) lt!43217)))

(declare-fun bs!3773 () Bool)

(assert (= bs!3773 d!23967))

(assert (=> bs!3773 m!95589))

(declare-fun m!96543 () Bool)

(assert (=> bs!3773 m!96543))

(assert (=> b!89201 d!23967))

(declare-fun d!23969 () Bool)

(declare-fun res!45875 () Bool)

(declare-fun e!58405 () Bool)

(assert (=> d!23969 (=> res!45875 e!58405)))

(assert (=> d!23969 (= res!45875 (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) lt!42827))))

(assert (=> d!23969 (= (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 #b00000000000000000000000000000000) e!58405)))

(declare-fun b!89756 () Bool)

(declare-fun e!58406 () Bool)

(assert (=> b!89756 (= e!58405 e!58406)))

(declare-fun res!45876 () Bool)

(assert (=> b!89756 (=> (not res!45876) (not e!58406))))

(assert (=> b!89756 (= res!45876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))))

(declare-fun b!89757 () Bool)

(assert (=> b!89757 (= e!58406 (arrayContainsKey!0 (_keys!4050 (v!2674 (underlying!295 thiss!992))) lt!42827 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23969 (not res!45875)) b!89756))

(assert (= (and b!89756 res!45876) b!89757))

(assert (=> d!23969 m!95455))

(declare-fun m!96545 () Bool)

(assert (=> b!89757 m!96545))

(assert (=> b!89201 d!23969))

(declare-fun b!89758 () Bool)

(declare-fun e!58407 () SeekEntryResult!245)

(assert (=> b!89758 (= e!58407 Undefined!245)))

(declare-fun b!89759 () Bool)

(declare-fun e!58408 () SeekEntryResult!245)

(assert (=> b!89759 (= e!58407 e!58408)))

(declare-fun lt!43220 () (_ BitVec 64))

(declare-fun lt!43218 () SeekEntryResult!245)

(assert (=> b!89759 (= lt!43220 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (index!3121 lt!43218)))))

(declare-fun c!14951 () Bool)

(assert (=> b!89759 (= c!14951 (= lt!43220 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89760 () Bool)

(declare-fun e!58409 () SeekEntryResult!245)

(assert (=> b!89760 (= e!58409 (seekKeyOrZeroReturnVacant!0 (x!12231 lt!43218) (index!3121 lt!43218) (index!3121 lt!43218) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))))))

(declare-fun b!89761 () Bool)

(assert (=> b!89761 (= e!58409 (MissingZero!245 (index!3121 lt!43218)))))

(declare-fun b!89762 () Bool)

(declare-fun c!14952 () Bool)

(assert (=> b!89762 (= c!14952 (= lt!43220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89762 (= e!58408 e!58409)))

(declare-fun d!23971 () Bool)

(declare-fun lt!43219 () SeekEntryResult!245)

(assert (=> d!23971 (and (or ((_ is Undefined!245) lt!43219) (not ((_ is Found!245) lt!43219)) (and (bvsge (index!3120 lt!43219) #b00000000000000000000000000000000) (bvslt (index!3120 lt!43219) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))) (or ((_ is Undefined!245) lt!43219) ((_ is Found!245) lt!43219) (not ((_ is MissingZero!245) lt!43219)) (and (bvsge (index!3119 lt!43219) #b00000000000000000000000000000000) (bvslt (index!3119 lt!43219) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))) (or ((_ is Undefined!245) lt!43219) ((_ is Found!245) lt!43219) ((_ is MissingZero!245) lt!43219) (not ((_ is MissingVacant!245) lt!43219)) (and (bvsge (index!3122 lt!43219) #b00000000000000000000000000000000) (bvslt (index!3122 lt!43219) (size!2177 (_keys!4050 (v!2674 (underlying!295 thiss!992))))))) (or ((_ is Undefined!245) lt!43219) (ite ((_ is Found!245) lt!43219) (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (index!3120 lt!43219)) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!245) lt!43219) (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (index!3119 lt!43219)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!245) lt!43219) (= (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) (index!3122 lt!43219)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23971 (= lt!43219 e!58407)))

(declare-fun c!14950 () Bool)

(assert (=> d!23971 (= c!14950 (and ((_ is Intermediate!245) lt!43218) (undefined!1057 lt!43218)))))

(assert (=> d!23971 (= lt!43218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (mask!6416 (v!2674 (underlying!295 thiss!992)))) (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))))))

(assert (=> d!23971 (validMask!0 (mask!6416 (v!2674 (underlying!295 thiss!992))))))

(assert (=> d!23971 (= (seekEntryOrOpen!0 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4050 (v!2674 (underlying!295 thiss!992))) (mask!6416 (v!2674 (underlying!295 thiss!992)))) lt!43219)))

(declare-fun b!89763 () Bool)

(assert (=> b!89763 (= e!58408 (Found!245 (index!3121 lt!43218)))))

(assert (= (and d!23971 c!14950) b!89758))

(assert (= (and d!23971 (not c!14950)) b!89759))

(assert (= (and b!89759 c!14951) b!89763))

(assert (= (and b!89759 (not c!14951)) b!89762))

(assert (= (and b!89762 c!14952) b!89761))

(assert (= (and b!89762 (not c!14952)) b!89760))

(declare-fun m!96547 () Bool)

(assert (=> b!89759 m!96547))

(assert (=> b!89760 m!95455))

(declare-fun m!96549 () Bool)

(assert (=> b!89760 m!96549))

(declare-fun m!96551 () Bool)

(assert (=> d!23971 m!96551))

(assert (=> d!23971 m!95455))

(declare-fun m!96553 () Bool)

(assert (=> d!23971 m!96553))

(assert (=> d!23971 m!95229))

(declare-fun m!96555 () Bool)

(assert (=> d!23971 m!96555))

(declare-fun m!96557 () Bool)

(assert (=> d!23971 m!96557))

(assert (=> d!23971 m!95455))

(assert (=> d!23971 m!96551))

(declare-fun m!96559 () Bool)

(assert (=> d!23971 m!96559))

(assert (=> b!89201 d!23971))

(declare-fun d!23973 () Bool)

(declare-fun e!58411 () Bool)

(assert (=> d!23973 e!58411))

(declare-fun res!45877 () Bool)

(assert (=> d!23973 (=> res!45877 e!58411)))

(declare-fun lt!43221 () Bool)

(assert (=> d!23973 (= res!45877 (not lt!43221))))

(declare-fun lt!43224 () Bool)

(assert (=> d!23973 (= lt!43221 lt!43224)))

(declare-fun lt!43223 () Unit!2636)

(declare-fun e!58410 () Unit!2636)

(assert (=> d!23973 (= lt!43223 e!58410)))

(declare-fun c!14953 () Bool)

(assert (=> d!23973 (= c!14953 lt!43224)))

(assert (=> d!23973 (= lt!43224 (containsKey!146 (toList!750 lt!42811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23973 (= (contains!760 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000) lt!43221)))

(declare-fun b!89764 () Bool)

(declare-fun lt!43222 () Unit!2636)

(assert (=> b!89764 (= e!58410 lt!43222)))

(assert (=> b!89764 (= lt!43222 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89764 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89765 () Bool)

(declare-fun Unit!2667 () Unit!2636)

(assert (=> b!89765 (= e!58410 Unit!2667)))

(declare-fun b!89766 () Bool)

(assert (=> b!89766 (= e!58411 (isDefined!95 (getValueByKey!142 (toList!750 lt!42811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23973 c!14953) b!89764))

(assert (= (and d!23973 (not c!14953)) b!89765))

(assert (= (and d!23973 (not res!45877)) b!89766))

(declare-fun m!96561 () Bool)

(assert (=> d!23973 m!96561))

(declare-fun m!96563 () Bool)

(assert (=> b!89764 m!96563))

(assert (=> b!89764 m!96175))

(assert (=> b!89764 m!96175))

(declare-fun m!96565 () Bool)

(assert (=> b!89764 m!96565))

(assert (=> b!89766 m!96175))

(assert (=> b!89766 m!96175))

(assert (=> b!89766 m!96565))

(assert (=> bm!8640 d!23973))

(declare-fun d!23975 () Bool)

(declare-fun e!58413 () Bool)

(assert (=> d!23975 e!58413))

(declare-fun res!45878 () Bool)

(assert (=> d!23975 (=> res!45878 e!58413)))

(declare-fun lt!43225 () Bool)

(assert (=> d!23975 (= res!45878 (not lt!43225))))

(declare-fun lt!43228 () Bool)

(assert (=> d!23975 (= lt!43225 lt!43228)))

(declare-fun lt!43227 () Unit!2636)

(declare-fun e!58412 () Unit!2636)

(assert (=> d!23975 (= lt!43227 e!58412)))

(declare-fun c!14954 () Bool)

(assert (=> d!23975 (= c!14954 lt!43228)))

(assert (=> d!23975 (= lt!43228 (containsKey!146 (toList!750 lt!42655) (_1!1116 lt!42540)))))

(assert (=> d!23975 (= (contains!760 lt!42655 (_1!1116 lt!42540)) lt!43225)))

(declare-fun b!89767 () Bool)

(declare-fun lt!43226 () Unit!2636)

(assert (=> b!89767 (= e!58412 lt!43226)))

(assert (=> b!89767 (= lt!43226 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 lt!42655) (_1!1116 lt!42540)))))

(assert (=> b!89767 (isDefined!95 (getValueByKey!142 (toList!750 lt!42655) (_1!1116 lt!42540)))))

(declare-fun b!89768 () Bool)

(declare-fun Unit!2668 () Unit!2636)

(assert (=> b!89768 (= e!58412 Unit!2668)))

(declare-fun b!89769 () Bool)

(assert (=> b!89769 (= e!58413 (isDefined!95 (getValueByKey!142 (toList!750 lt!42655) (_1!1116 lt!42540))))))

(assert (= (and d!23975 c!14954) b!89767))

(assert (= (and d!23975 (not c!14954)) b!89768))

(assert (= (and d!23975 (not res!45878)) b!89769))

(declare-fun m!96567 () Bool)

(assert (=> d!23975 m!96567))

(declare-fun m!96569 () Bool)

(assert (=> b!89767 m!96569))

(assert (=> b!89767 m!95439))

(assert (=> b!89767 m!95439))

(declare-fun m!96571 () Bool)

(assert (=> b!89767 m!96571))

(assert (=> b!89769 m!95439))

(assert (=> b!89769 m!95439))

(assert (=> b!89769 m!96571))

(assert (=> d!23683 d!23975))

(declare-fun b!89770 () Bool)

(declare-fun e!58414 () Option!148)

(assert (=> b!89770 (= e!58414 (Some!147 (_2!1116 (h!2114 lt!42657))))))

(declare-fun d!23977 () Bool)

(declare-fun c!14955 () Bool)

(assert (=> d!23977 (= c!14955 (and ((_ is Cons!1522) lt!42657) (= (_1!1116 (h!2114 lt!42657)) (_1!1116 lt!42540))))))

(assert (=> d!23977 (= (getValueByKey!142 lt!42657 (_1!1116 lt!42540)) e!58414)))

(declare-fun b!89773 () Bool)

(declare-fun e!58415 () Option!148)

(assert (=> b!89773 (= e!58415 None!146)))

(declare-fun b!89772 () Bool)

(assert (=> b!89772 (= e!58415 (getValueByKey!142 (t!5284 lt!42657) (_1!1116 lt!42540)))))

(declare-fun b!89771 () Bool)

(assert (=> b!89771 (= e!58414 e!58415)))

(declare-fun c!14956 () Bool)

(assert (=> b!89771 (= c!14956 (and ((_ is Cons!1522) lt!42657) (not (= (_1!1116 (h!2114 lt!42657)) (_1!1116 lt!42540)))))))

(assert (= (and d!23977 c!14955) b!89770))

(assert (= (and d!23977 (not c!14955)) b!89771))

(assert (= (and b!89771 c!14956) b!89772))

(assert (= (and b!89771 (not c!14956)) b!89773))

(declare-fun m!96573 () Bool)

(assert (=> b!89772 m!96573))

(assert (=> d!23683 d!23977))

(declare-fun d!23979 () Bool)

(assert (=> d!23979 (= (getValueByKey!142 lt!42657 (_1!1116 lt!42540)) (Some!147 (_2!1116 lt!42540)))))

(declare-fun lt!43229 () Unit!2636)

(assert (=> d!23979 (= lt!43229 (choose!531 lt!42657 (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(declare-fun e!58416 () Bool)

(assert (=> d!23979 e!58416))

(declare-fun res!45879 () Bool)

(assert (=> d!23979 (=> (not res!45879) (not e!58416))))

(assert (=> d!23979 (= res!45879 (isStrictlySorted!300 lt!42657))))

(assert (=> d!23979 (= (lemmaContainsTupThenGetReturnValue!59 lt!42657 (_1!1116 lt!42540) (_2!1116 lt!42540)) lt!43229)))

(declare-fun b!89774 () Bool)

(declare-fun res!45880 () Bool)

(assert (=> b!89774 (=> (not res!45880) (not e!58416))))

(assert (=> b!89774 (= res!45880 (containsKey!146 lt!42657 (_1!1116 lt!42540)))))

(declare-fun b!89775 () Bool)

(assert (=> b!89775 (= e!58416 (contains!761 lt!42657 (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540))))))

(assert (= (and d!23979 res!45879) b!89774))

(assert (= (and b!89774 res!45880) b!89775))

(assert (=> d!23979 m!95433))

(declare-fun m!96575 () Bool)

(assert (=> d!23979 m!96575))

(declare-fun m!96577 () Bool)

(assert (=> d!23979 m!96577))

(declare-fun m!96579 () Bool)

(assert (=> b!89774 m!96579))

(declare-fun m!96581 () Bool)

(assert (=> b!89775 m!96581))

(assert (=> d!23683 d!23979))

(declare-fun b!89776 () Bool)

(declare-fun e!58417 () List!1526)

(declare-fun call!8727 () List!1526)

(assert (=> b!89776 (= e!58417 call!8727)))

(declare-fun b!89777 () Bool)

(declare-fun e!58421 () Bool)

(declare-fun lt!43230 () List!1526)

(assert (=> b!89777 (= e!58421 (contains!761 lt!43230 (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540))))))

(declare-fun b!89778 () Bool)

(declare-fun e!58420 () List!1526)

(declare-fun call!8726 () List!1526)

(assert (=> b!89778 (= e!58420 call!8726)))

(declare-fun bm!8723 () Bool)

(declare-fun call!8728 () List!1526)

(assert (=> bm!8723 (= call!8727 call!8728)))

(declare-fun b!89779 () Bool)

(declare-fun c!14958 () Bool)

(assert (=> b!89779 (= c!14958 (and ((_ is Cons!1522) (toList!750 lt!42535)) (bvsgt (_1!1116 (h!2114 (toList!750 lt!42535))) (_1!1116 lt!42540))))))

(declare-fun e!58419 () List!1526)

(assert (=> b!89779 (= e!58419 e!58417)))

(declare-fun b!89780 () Bool)

(declare-fun e!58418 () List!1526)

(assert (=> b!89780 (= e!58418 (insertStrictlySorted!62 (t!5284 (toList!750 lt!42535)) (_1!1116 lt!42540) (_2!1116 lt!42540)))))

(declare-fun bm!8725 () Bool)

(assert (=> bm!8725 (= call!8728 call!8726)))

(declare-fun b!89781 () Bool)

(declare-fun c!14960 () Bool)

(assert (=> b!89781 (= e!58418 (ite c!14960 (t!5284 (toList!750 lt!42535)) (ite c!14958 (Cons!1522 (h!2114 (toList!750 lt!42535)) (t!5284 (toList!750 lt!42535))) Nil!1523)))))

(declare-fun b!89782 () Bool)

(assert (=> b!89782 (= e!58419 call!8728)))

(declare-fun b!89783 () Bool)

(assert (=> b!89783 (= e!58420 e!58419)))

(assert (=> b!89783 (= c!14960 (and ((_ is Cons!1522) (toList!750 lt!42535)) (= (_1!1116 (h!2114 (toList!750 lt!42535))) (_1!1116 lt!42540))))))

(declare-fun bm!8724 () Bool)

(declare-fun c!14959 () Bool)

(assert (=> bm!8724 (= call!8726 ($colon$colon!74 e!58418 (ite c!14959 (h!2114 (toList!750 lt!42535)) (tuple2!2211 (_1!1116 lt!42540) (_2!1116 lt!42540)))))))

(declare-fun c!14957 () Bool)

(assert (=> bm!8724 (= c!14957 c!14959)))

(declare-fun d!23981 () Bool)

(assert (=> d!23981 e!58421))

(declare-fun res!45881 () Bool)

(assert (=> d!23981 (=> (not res!45881) (not e!58421))))

(assert (=> d!23981 (= res!45881 (isStrictlySorted!300 lt!43230))))

(assert (=> d!23981 (= lt!43230 e!58420)))

(assert (=> d!23981 (= c!14959 (and ((_ is Cons!1522) (toList!750 lt!42535)) (bvslt (_1!1116 (h!2114 (toList!750 lt!42535))) (_1!1116 lt!42540))))))

(assert (=> d!23981 (isStrictlySorted!300 (toList!750 lt!42535))))

(assert (=> d!23981 (= (insertStrictlySorted!62 (toList!750 lt!42535) (_1!1116 lt!42540) (_2!1116 lt!42540)) lt!43230)))

(declare-fun b!89784 () Bool)

(declare-fun res!45882 () Bool)

(assert (=> b!89784 (=> (not res!45882) (not e!58421))))

(assert (=> b!89784 (= res!45882 (containsKey!146 lt!43230 (_1!1116 lt!42540)))))

(declare-fun b!89785 () Bool)

(assert (=> b!89785 (= e!58417 call!8727)))

(assert (= (and d!23981 c!14959) b!89778))

(assert (= (and d!23981 (not c!14959)) b!89783))

(assert (= (and b!89783 c!14960) b!89782))

(assert (= (and b!89783 (not c!14960)) b!89779))

(assert (= (and b!89779 c!14958) b!89776))

(assert (= (and b!89779 (not c!14958)) b!89785))

(assert (= (or b!89776 b!89785) bm!8723))

(assert (= (or b!89782 bm!8723) bm!8725))

(assert (= (or b!89778 bm!8725) bm!8724))

(assert (= (and bm!8724 c!14957) b!89780))

(assert (= (and bm!8724 (not c!14957)) b!89781))

(assert (= (and d!23981 res!45881) b!89784))

(assert (= (and b!89784 res!45882) b!89777))

(declare-fun m!96583 () Bool)

(assert (=> b!89777 m!96583))

(declare-fun m!96585 () Bool)

(assert (=> b!89784 m!96585))

(declare-fun m!96587 () Bool)

(assert (=> bm!8724 m!96587))

(declare-fun m!96589 () Bool)

(assert (=> b!89780 m!96589))

(declare-fun m!96591 () Bool)

(assert (=> d!23981 m!96591))

(declare-fun m!96593 () Bool)

(assert (=> d!23981 m!96593))

(assert (=> d!23683 d!23981))

(declare-fun d!23983 () Bool)

(declare-fun e!58423 () Bool)

(assert (=> d!23983 e!58423))

(declare-fun res!45883 () Bool)

(assert (=> d!23983 (=> res!45883 e!58423)))

(declare-fun lt!43231 () Bool)

(assert (=> d!23983 (= res!45883 (not lt!43231))))

(declare-fun lt!43234 () Bool)

(assert (=> d!23983 (= lt!43231 lt!43234)))

(declare-fun lt!43233 () Unit!2636)

(declare-fun e!58422 () Unit!2636)

(assert (=> d!23983 (= lt!43233 e!58422)))

(declare-fun c!14961 () Bool)

(assert (=> d!23983 (= c!14961 lt!43234)))

(assert (=> d!23983 (= lt!43234 (containsKey!146 (toList!750 e!58024) (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750)))))))

(assert (=> d!23983 (= (contains!760 e!58024 (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750)))) lt!43231)))

(declare-fun b!89786 () Bool)

(declare-fun lt!43232 () Unit!2636)

(assert (=> b!89786 (= e!58422 lt!43232)))

(assert (=> b!89786 (= lt!43232 (lemmaContainsKeyImpliesGetValueByKeyDefined!94 (toList!750 e!58024) (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750)))))))

(assert (=> b!89786 (isDefined!95 (getValueByKey!142 (toList!750 e!58024) (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750)))))))

(declare-fun b!89787 () Bool)

(declare-fun Unit!2669 () Unit!2636)

(assert (=> b!89787 (= e!58422 Unit!2669)))

(declare-fun b!89788 () Bool)

(assert (=> b!89788 (= e!58423 (isDefined!95 (getValueByKey!142 (toList!750 e!58024) (ite c!14775 (select (arr!1931 (_keys!4050 (v!2674 (underlying!295 thiss!992)))) from!355) (select (arr!1931 (_keys!4050 newMap!16)) (index!3120 lt!42750))))))))

(assert (= (and d!23983 c!14961) b!89786))

(assert (= (and d!23983 (not c!14961)) b!89787))

(assert (= (and d!23983 (not res!45883)) b!89788))

(declare-fun m!96595 () Bool)

(assert (=> d!23983 m!96595))

(declare-fun m!96597 () Bool)

(assert (=> b!89786 m!96597))

(declare-fun m!96599 () Bool)

(assert (=> b!89786 m!96599))

(assert (=> b!89786 m!96599))

(declare-fun m!96601 () Bool)

(assert (=> b!89786 m!96601))

(assert (=> b!89788 m!96599))

(assert (=> b!89788 m!96599))

(assert (=> b!89788 m!96601))

(assert (=> bm!8614 d!23983))

(declare-fun d!23985 () Bool)

(declare-fun e!58424 () Bool)

(assert (=> d!23985 e!58424))

(declare-fun res!45884 () Bool)

(assert (=> d!23985 (=> (not res!45884) (not e!58424))))

(declare-fun lt!43236 () ListLongMap!1469)

(assert (=> d!23985 (= res!45884 (contains!760 lt!43236 (_1!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(declare-fun lt!43238 () List!1526)

(assert (=> d!23985 (= lt!43236 (ListLongMap!1470 lt!43238))))

(declare-fun lt!43237 () Unit!2636)

(declare-fun lt!43235 () Unit!2636)

(assert (=> d!23985 (= lt!43237 lt!43235)))

(assert (=> d!23985 (= (getValueByKey!142 lt!43238 (_1!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))) (Some!147 (_2!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(assert (=> d!23985 (= lt!43235 (lemmaContainsTupThenGetReturnValue!59 lt!43238 (_1!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (_2!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(assert (=> d!23985 (= lt!43238 (insertStrictlySorted!62 (toList!750 (ite c!14798 call!8646 (ite c!14800 call!8644 call!8645))) (_1!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) (_2!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))))))

(assert (=> d!23985 (= (+!113 (ite c!14798 call!8646 (ite c!14800 call!8644 call!8645)) (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))) lt!43236)))

(declare-fun b!89789 () Bool)

(declare-fun res!45885 () Bool)

(assert (=> b!89789 (=> (not res!45885) (not e!58424))))

(assert (=> b!89789 (= res!45885 (= (getValueByKey!142 (toList!750 lt!43236) (_1!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992))))))) (Some!147 (_2!1116 (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))))

(declare-fun b!89790 () Bool)

(assert (=> b!89790 (= e!58424 (contains!761 (toList!750 lt!43236) (ite (or c!14798 c!14800) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2261 (v!2674 (underlying!295 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2261 (v!2674 (underlying!295 thiss!992)))))))))

(assert (= (and d!23985 res!45884) b!89789))

(assert (= (and b!89789 res!45885) b!89790))

(declare-fun m!96603 () Bool)

(assert (=> d!23985 m!96603))

(declare-fun m!96605 () Bool)

(assert (=> d!23985 m!96605))

(declare-fun m!96607 () Bool)

(assert (=> d!23985 m!96607))

(declare-fun m!96609 () Bool)

(assert (=> d!23985 m!96609))

(declare-fun m!96611 () Bool)

(assert (=> b!89789 m!96611))

(declare-fun m!96613 () Bool)

(assert (=> b!89790 m!96613))

(assert (=> bm!8641 d!23985))

(assert (=> bm!8604 d!23699))

(declare-fun b!89791 () Bool)

(declare-fun e!58425 () Option!148)

(assert (=> b!89791 (= e!58425 (Some!147 (_2!1116 (h!2114 (toList!750 lt!42643)))))))

(declare-fun d!23987 () Bool)

(declare-fun c!14962 () Bool)

(assert (=> d!23987 (= c!14962 (and ((_ is Cons!1522) (toList!750 lt!42643)) (= (_1!1116 (h!2114 (toList!750 lt!42643))) (_1!1116 lt!42541))))))

(assert (=> d!23987 (= (getValueByKey!142 (toList!750 lt!42643) (_1!1116 lt!42541)) e!58425)))

(declare-fun b!89794 () Bool)

(declare-fun e!58426 () Option!148)

(assert (=> b!89794 (= e!58426 None!146)))

(declare-fun b!89793 () Bool)

(assert (=> b!89793 (= e!58426 (getValueByKey!142 (t!5284 (toList!750 lt!42643)) (_1!1116 lt!42541)))))

(declare-fun b!89792 () Bool)

(assert (=> b!89792 (= e!58425 e!58426)))

(declare-fun c!14963 () Bool)

(assert (=> b!89792 (= c!14963 (and ((_ is Cons!1522) (toList!750 lt!42643)) (not (= (_1!1116 (h!2114 (toList!750 lt!42643))) (_1!1116 lt!42541)))))))

(assert (= (and d!23987 c!14962) b!89791))

(assert (= (and d!23987 (not c!14962)) b!89792))

(assert (= (and b!89792 c!14963) b!89793))

(assert (= (and b!89792 (not c!14963)) b!89794))

(declare-fun m!96615 () Bool)

(assert (=> b!89793 m!96615))

(assert (=> b!88953 d!23987))

(declare-fun mapNonEmpty!3461 () Bool)

(declare-fun mapRes!3461 () Bool)

(declare-fun tp!9041 () Bool)

(declare-fun e!58428 () Bool)

(assert (=> mapNonEmpty!3461 (= mapRes!3461 (and tp!9041 e!58428))))

(declare-fun mapKey!3461 () (_ BitVec 32))

(declare-fun mapValue!3461 () ValueCell!930)

(declare-fun mapRest!3461 () (Array (_ BitVec 32) ValueCell!930))

(assert (=> mapNonEmpty!3461 (= mapRest!3460 (store mapRest!3461 mapKey!3461 mapValue!3461))))

(declare-fun b!89796 () Bool)

(declare-fun e!58427 () Bool)

(assert (=> b!89796 (= e!58427 tp_is_empty!2547)))

(declare-fun mapIsEmpty!3461 () Bool)

(assert (=> mapIsEmpty!3461 mapRes!3461))

(declare-fun b!89795 () Bool)

(assert (=> b!89795 (= e!58428 tp_is_empty!2547)))

(declare-fun condMapEmpty!3461 () Bool)

(declare-fun mapDefault!3461 () ValueCell!930)

(assert (=> mapNonEmpty!3460 (= condMapEmpty!3461 (= mapRest!3460 ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3461)))))

(assert (=> mapNonEmpty!3460 (= tp!9040 (and e!58427 mapRes!3461))))

(assert (= (and mapNonEmpty!3460 condMapEmpty!3461) mapIsEmpty!3461))

(assert (= (and mapNonEmpty!3460 (not condMapEmpty!3461)) mapNonEmpty!3461))

(assert (= (and mapNonEmpty!3461 ((_ is ValueCellFull!930) mapValue!3461)) b!89795))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!930) mapDefault!3461)) b!89796))

(declare-fun m!96617 () Bool)

(assert (=> mapNonEmpty!3461 m!96617))

(declare-fun mapNonEmpty!3462 () Bool)

(declare-fun mapRes!3462 () Bool)

(declare-fun tp!9042 () Bool)

(declare-fun e!58430 () Bool)

(assert (=> mapNonEmpty!3462 (= mapRes!3462 (and tp!9042 e!58430))))

(declare-fun mapValue!3462 () ValueCell!930)

(declare-fun mapRest!3462 () (Array (_ BitVec 32) ValueCell!930))

(declare-fun mapKey!3462 () (_ BitVec 32))

(assert (=> mapNonEmpty!3462 (= mapRest!3459 (store mapRest!3462 mapKey!3462 mapValue!3462))))

(declare-fun b!89798 () Bool)

(declare-fun e!58429 () Bool)

(assert (=> b!89798 (= e!58429 tp_is_empty!2547)))

(declare-fun mapIsEmpty!3462 () Bool)

(assert (=> mapIsEmpty!3462 mapRes!3462))

(declare-fun b!89797 () Bool)

(assert (=> b!89797 (= e!58430 tp_is_empty!2547)))

(declare-fun condMapEmpty!3462 () Bool)

(declare-fun mapDefault!3462 () ValueCell!930)

(assert (=> mapNonEmpty!3459 (= condMapEmpty!3462 (= mapRest!3459 ((as const (Array (_ BitVec 32) ValueCell!930)) mapDefault!3462)))))

(assert (=> mapNonEmpty!3459 (= tp!9039 (and e!58429 mapRes!3462))))

(assert (= (and mapNonEmpty!3459 condMapEmpty!3462) mapIsEmpty!3462))

(assert (= (and mapNonEmpty!3459 (not condMapEmpty!3462)) mapNonEmpty!3462))

(assert (= (and mapNonEmpty!3462 ((_ is ValueCellFull!930) mapValue!3462)) b!89797))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!930) mapDefault!3462)) b!89798))

(declare-fun m!96619 () Bool)

(assert (=> mapNonEmpty!3462 m!96619))

(declare-fun b_lambda!3963 () Bool)

(assert (= b_lambda!3957 (or (and b!88832 b_free!2261 (= (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) (defaultEntry!2372 newMap!16))) (and b!88818 b_free!2263) b_lambda!3963)))

(declare-fun b_lambda!3965 () Bool)

(assert (= b_lambda!3955 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3965)))

(declare-fun b_lambda!3967 () Bool)

(assert (= b_lambda!3953 (or (and b!88832 b_free!2261) (and b!88818 b_free!2263 (= (defaultEntry!2372 newMap!16) (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))))) b_lambda!3967)))

(declare-fun b_lambda!3969 () Bool)

(assert (= b_lambda!3961 (or (and b!88832 b_free!2261 (= (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) (defaultEntry!2372 newMap!16))) (and b!88818 b_free!2263) b_lambda!3969)))

(declare-fun b_lambda!3971 () Bool)

(assert (= b_lambda!3959 (or (and b!88832 b_free!2261 (= (defaultEntry!2372 (v!2674 (underlying!295 thiss!992))) (defaultEntry!2372 newMap!16))) (and b!88818 b_free!2263) b_lambda!3971)))

(check-sat (not b!89392) (not b!89757) (not b!89395) (not b!89731) (not b!89722) (not b!89772) (not d!23787) (not d!23963) (not d!23839) (not d!23927) (not b!89614) (not b!89300) (not b!89656) (not d!23891) (not d!23745) (not b!89737) (not b!89328) (not b!89691) (not b!89636) (not d!23853) (not b!89672) (not b!89690) (not b!89379) (not b!89277) (not b!89566) (not b!89585) (not b!89333) (not b!89559) (not d!23803) (not b!89405) (not b!89498) (not b!89689) (not b!89601) (not d!23811) (not d!23789) (not b!89635) (not b!89349) (not b!89598) (not b!89532) (not b_lambda!3965) (not d!23777) (not b!89702) (not d!23751) (not d!23967) (not b_lambda!3947) (not d!23985) (not d!23809) (not d!23729) (not bm!8659) (not b!89376) (not b!89750) (not b!89316) (not b!89313) (not b!89515) (not b!89688) (not d!23795) (not b!89244) (not b!89278) (not b!89705) (not d!23767) (not b!89513) (not b!89353) (not d!23851) (not b!89320) (not b!89419) (not b!89401) (not b!89314) (not b!89564) (not b!89407) (not b!89790) (not bm!8666) (not b_lambda!3951) (not b!89641) (not b!89675) (not d!23743) (not b!89725) (not b!89727) (not d!23907) (not b!89596) (not bm!8721) b_and!5389 (not d!23925) (not b!89789) (not d!23923) (not d!23887) (not b!89371) (not b!89661) (not bm!8712) (not b!89324) (not bm!8658) (not b!89282) (not b!89784) (not b!89508) (not d!23973) (not b!89339) (not b!89451) (not d!23771) (not b!89706) (not d!23835) (not b_lambda!3939) (not b!89569) (not d!23883) (not d!23897) (not b!89701) (not b!89375) (not b!89587) (not d!23749) (not d!23913) (not b!89622) (not b!89617) (not bm!8684) (not bm!8665) (not b!89410) (not b!89518) (not b!89572) (not b!89541) (not b!89626) (not b!89749) (not b_lambda!3969) (not d!23873) (not b!89502) (not b!89764) (not b!89461) (not d!23957) (not d!23791) (not b!89633) (not bm!8655) (not d!23757) (not d!23801) (not b!89323) (not b!89739) (not b!89651) (not d!23947) (not b!89659) (not d!23979) (not b!89284) (not bm!8670) (not d!23955) (not d!23859) (not d!23755) (not b!89658) (not b!89449) (not b!89286) (not b!89680) (not b!89698) (not b!89549) (not d!23861) (not bm!8702) (not d!23971) (not b!89345) (not d!23779) (not b!89452) (not d!23901) (not mapNonEmpty!3461) (not d!23937) (not b!89704) (not b!89571) (not bm!8694) (not b!89681) (not b!89526) (not bm!8722) (not b!89611) (not b!89786) (not b!89744) (not d!23763) (not b!89325) (not b!89788) (not d!23863) (not d!23847) (not bm!8660) (not b!89712) (not d!23929) (not b!89520) (not b!89359) (not d!23975) (not b!89568) (not d!23725) (not b!89780) (not b!89602) (not b!89619) (not b_next!2263) (not d!23931) (not b!89747) (not b!89686) (not d!23785) (not b!89603) (not b!89565) (not b!89402) (not b!89346) (not b!89567) (not b!89538) (not b!89775) (not d!23769) (not d!23829) (not b!89793) (not b!89553) (not d!23921) (not b!89751) (not b_lambda!3949) (not b!89327) (not b!89360) (not b!89341) (not b!89338) (not b_next!2261) (not bm!8663) (not b!89403) (not d!23881) (not d!23837) (not b!89322) (not b!89281) (not b!89398) (not bm!8709) (not b!89397) (not b!89563) (not d!23905) (not d!23911) (not b!89420) (not d!23865) (not b!89709) (not d!23761) (not d!23727) (not b!89723) (not b!89400) (not b!89530) (not d!23869) (not d!23845) (not mapNonEmpty!3462) (not b!89679) (not b!89574) (not d!23815) (not d!23939) (not b!89368) (not d!23759) (not d!23805) (not b!89695) (not b!89616) (not d!23765) (not b!89543) (not b!89523) (not d!23813) (not bm!8656) (not b!89355) (not b!89330) (not d!23799) (not b!89279) (not d!23895) (not bm!8705) (not b!89595) (not b!89289) (not b!89356) (not bm!8667) (not d!23819) (not b!89458) (not b!89645) (not b!89649) (not b_lambda!3971) (not b!89687) (not b!89648) (not b!89496) (not b!89319) (not b_lambda!3967) (not bm!8698) (not b!89455) (not bm!8704) (not b!89650) (not d!23747) (not b!89363) (not b!89638) (not b!89664) (not b!89318) (not b!89767) (not b_lambda!3963) (not b!89307) (not b!89609) (not b!89692) (not b!89344) (not b!89521) (not d!23917) (not bm!8706) (not d!23949) (not d!23867) (not b!89668) (not bm!8682) (not b!89741) (not d!23915) (not b!89628) (not d!23775) (not b!89766) (not b!89534) (not bm!8693) b_and!5387 (not b!89769) (not b!89369) (not d!23871) (not bm!8720) (not d!23899) (not b!89283) (not b!89544) (not b!89546) (not b!89760) (not bm!8718) (not b!89653) (not d!23879) (not b!89583) (not b!89408) (not b!89396) (not d!23941) (not d!23753) (not b!89606) (not b!89752) (not bm!8674) (not b!89352) (not b!89774) (not b!89630) (not d!23741) (not d!23781) (not bm!8700) (not d!23831) (not d!23855) (not d!23943) (not bm!8715) (not d!23733) (not b!89399) (not d!23731) (not bm!8657) (not d!23821) (not b!89374) (not b!89777) (not b!89499) (not b!89590) (not b!89442) (not d!23807) (not b!89505) (not b!89580) (not b!89677) (not b!89445) (not b!89561) (not d!23983) (not b!89748) (not d!23981) (not b!89536) (not b!89413) (not bm!8695) (not bm!8724) (not b!89358) (not d!23827) tp_is_empty!2547 (not b!89755) (not d!23889) (not b!89562))
(check-sat b_and!5387 b_and!5389 (not b_next!2261) (not b_next!2263))
