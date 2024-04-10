; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14972 () Bool)

(assert start!14972)

(declare-fun b!143836 () Bool)

(declare-fun b_free!3053 () Bool)

(declare-fun b_next!3053 () Bool)

(assert (=> b!143836 (= b_free!3053 (not b_next!3053))))

(declare-fun tp!11646 () Bool)

(declare-fun b_and!8967 () Bool)

(assert (=> b!143836 (= tp!11646 b_and!8967)))

(declare-fun b!143822 () Bool)

(declare-fun b_free!3055 () Bool)

(declare-fun b_next!3055 () Bool)

(assert (=> b!143822 (= b_free!3055 (not b_next!3055))))

(declare-fun tp!11645 () Bool)

(declare-fun b_and!8969 () Bool)

(assert (=> b!143822 (= tp!11645 b_and!8969)))

(declare-fun tp_is_empty!2943 () Bool)

(declare-datatypes ((V!3571 0))(
  ( (V!3572 (val!1516 Int)) )
))
(declare-datatypes ((array!4925 0))(
  ( (array!4926 (arr!2327 (Array (_ BitVec 32) (_ BitVec 64))) (size!2601 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1128 0))(
  ( (ValueCellFull!1128 (v!3307 V!3571)) (EmptyCell!1128) )
))
(declare-datatypes ((array!4927 0))(
  ( (array!4928 (arr!2328 (Array (_ BitVec 32) ValueCell!1128)) (size!2602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1164 0))(
  ( (LongMapFixedSize!1165 (defaultEntry!2976 Int) (mask!7334 (_ BitVec 32)) (extraKeys!2725 (_ BitVec 32)) (zeroValue!2823 V!3571) (minValue!2823 V!3571) (_size!631 (_ BitVec 32)) (_keys!4741 array!4925) (_values!2959 array!4927) (_vacant!631 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1164)

(declare-fun e!93744 () Bool)

(declare-fun e!93746 () Bool)

(declare-fun array_inv!1463 (array!4925) Bool)

(declare-fun array_inv!1464 (array!4927) Bool)

(assert (=> b!143822 (= e!93744 (and tp!11645 tp_is_empty!2943 (array_inv!1463 (_keys!4741 newMap!16)) (array_inv!1464 (_values!2959 newMap!16)) e!93746))))

(declare-fun b!143823 () Bool)

(declare-fun e!93736 () Bool)

(assert (=> b!143823 (= e!93736 tp_is_empty!2943)))

(declare-fun b!143824 () Bool)

(declare-fun res!68518 () Bool)

(declare-fun e!93739 () Bool)

(assert (=> b!143824 (=> res!68518 e!93739)))

(declare-datatypes ((List!1752 0))(
  ( (Nil!1749) (Cons!1748 (h!2356 (_ BitVec 64)) (t!6381 List!1752)) )
))
(declare-fun lt!75425 () List!1752)

(declare-fun noDuplicate!52 (List!1752) Bool)

(assert (=> b!143824 (= res!68518 (not (noDuplicate!52 lt!75425)))))

(declare-fun mapNonEmpty!4885 () Bool)

(declare-fun mapRes!4885 () Bool)

(declare-fun tp!11647 () Bool)

(assert (=> mapNonEmpty!4885 (= mapRes!4885 (and tp!11647 e!93736))))

(declare-fun mapRest!4885 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapValue!4886 () ValueCell!1128)

(declare-fun mapKey!4886 () (_ BitVec 32))

(assert (=> mapNonEmpty!4885 (= (arr!2328 (_values!2959 newMap!16)) (store mapRest!4885 mapKey!4886 mapValue!4886))))

(declare-fun b!143825 () Bool)

(declare-fun res!68526 () Bool)

(declare-fun e!93747 () Bool)

(assert (=> b!143825 (=> (not res!68526) (not e!93747))))

(declare-datatypes ((Cell!948 0))(
  ( (Cell!949 (v!3308 LongMapFixedSize!1164)) )
))
(declare-datatypes ((LongMap!948 0))(
  ( (LongMap!949 (underlying!485 Cell!948)) )
))
(declare-fun thiss!992 () LongMap!948)

(assert (=> b!143825 (= res!68526 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7334 newMap!16)) (_size!631 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun mapNonEmpty!4886 () Bool)

(declare-fun mapRes!4886 () Bool)

(declare-fun tp!11648 () Bool)

(declare-fun e!93743 () Bool)

(assert (=> mapNonEmpty!4886 (= mapRes!4886 (and tp!11648 e!93743))))

(declare-fun mapValue!4885 () ValueCell!1128)

(declare-fun mapRest!4886 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapKey!4885 () (_ BitVec 32))

(assert (=> mapNonEmpty!4886 (= (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (store mapRest!4886 mapKey!4885 mapValue!4885))))

(declare-fun b!143827 () Bool)

(assert (=> b!143827 (= e!93743 tp_is_empty!2943)))

(declare-fun b!143828 () Bool)

(declare-fun e!93738 () Bool)

(declare-fun e!93741 () Bool)

(assert (=> b!143828 (= e!93738 e!93741)))

(declare-fun res!68525 () Bool)

(assert (=> b!143828 (=> (not res!68525) (not e!93741))))

(declare-datatypes ((tuple2!2710 0))(
  ( (tuple2!2711 (_1!1366 (_ BitVec 64)) (_2!1366 V!3571)) )
))
(declare-datatypes ((List!1753 0))(
  ( (Nil!1750) (Cons!1749 (h!2357 tuple2!2710) (t!6382 List!1753)) )
))
(declare-datatypes ((ListLongMap!1751 0))(
  ( (ListLongMap!1752 (toList!891 List!1753)) )
))
(declare-fun lt!75428 () ListLongMap!1751)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!930 (ListLongMap!1751 (_ BitVec 64)) Bool)

(assert (=> b!143828 (= res!68525 (contains!930 lt!75428 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2712 0))(
  ( (tuple2!2713 (_1!1367 Bool) (_2!1367 LongMapFixedSize!1164)) )
))
(declare-fun lt!75429 () tuple2!2712)

(declare-fun update!214 (LongMapFixedSize!1164 (_ BitVec 64) V!3571) tuple2!2712)

(declare-fun get!1541 (ValueCell!1128 V!3571) V!3571)

(declare-fun dynLambda!445 (Int (_ BitVec 64)) V!3571)

(assert (=> b!143828 (= lt!75429 (update!214 newMap!16 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143829 () Bool)

(assert (=> b!143829 (= e!93747 e!93738)))

(declare-fun res!68520 () Bool)

(assert (=> b!143829 (=> (not res!68520) (not e!93738))))

(declare-fun lt!75427 () ListLongMap!1751)

(assert (=> b!143829 (= res!68520 (and (= lt!75427 lt!75428) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1448 (LongMapFixedSize!1164) ListLongMap!1751)

(assert (=> b!143829 (= lt!75428 (map!1448 newMap!16))))

(declare-fun getCurrentListMap!563 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) Int) ListLongMap!1751)

(assert (=> b!143829 (= lt!75427 (getCurrentListMap!563 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun mapIsEmpty!4885 () Bool)

(assert (=> mapIsEmpty!4885 mapRes!4885))

(declare-fun b!143830 () Bool)

(declare-fun e!93745 () Bool)

(declare-fun e!93740 () Bool)

(assert (=> b!143830 (= e!93745 e!93740)))

(declare-fun b!143831 () Bool)

(declare-fun e!93734 () Bool)

(assert (=> b!143831 (= e!93739 e!93734)))

(declare-fun res!68523 () Bool)

(assert (=> b!143831 (=> (not res!68523) (not e!93734))))

(declare-fun contains!931 (List!1752 (_ BitVec 64)) Bool)

(assert (=> b!143831 (= res!68523 (not (contains!931 lt!75425 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143832 () Bool)

(assert (=> b!143832 (= e!93741 (not e!93739))))

(declare-fun res!68522 () Bool)

(assert (=> b!143832 (=> res!68522 e!93739)))

(assert (=> b!143832 (= res!68522 (or (bvsge (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> b!143832 (= lt!75425 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749))))

(declare-fun arrayNoDuplicates!0 (array!4925 (_ BitVec 32) List!1752) Bool)

(assert (=> b!143832 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1749)))

(declare-datatypes ((Unit!4557 0))(
  ( (Unit!4558) )
))
(declare-fun lt!75430 () Unit!4557)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4925 (_ BitVec 32) (_ BitVec 32)) Unit!4557)

(assert (=> b!143832 (= lt!75430 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143832 (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75426 () Unit!4557)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!143 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) (_ BitVec 32) Int) Unit!4557)

(assert (=> b!143832 (= lt!75426 (lemmaListMapContainsThenArrayContainsFrom!143 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143833 () Bool)

(declare-fun e!93748 () Bool)

(assert (=> b!143833 (= e!93740 e!93748)))

(declare-fun b!143834 () Bool)

(declare-fun res!68524 () Bool)

(assert (=> b!143834 (=> (not res!68524) (not e!93747))))

(assert (=> b!143834 (= res!68524 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun b!143835 () Bool)

(declare-fun e!93735 () Bool)

(declare-fun e!93750 () Bool)

(assert (=> b!143835 (= e!93735 (and e!93750 mapRes!4886))))

(declare-fun condMapEmpty!4885 () Bool)

(declare-fun mapDefault!4885 () ValueCell!1128)

(assert (=> b!143835 (= condMapEmpty!4885 (= (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4885)))))

(declare-fun res!68521 () Bool)

(assert (=> start!14972 (=> (not res!68521) (not e!93747))))

(declare-fun valid!562 (LongMap!948) Bool)

(assert (=> start!14972 (= res!68521 (valid!562 thiss!992))))

(assert (=> start!14972 e!93747))

(assert (=> start!14972 e!93745))

(assert (=> start!14972 true))

(assert (=> start!14972 e!93744))

(declare-fun b!143826 () Bool)

(declare-fun e!93742 () Bool)

(assert (=> b!143826 (= e!93742 tp_is_empty!2943)))

(assert (=> b!143836 (= e!93748 (and tp!11646 tp_is_empty!2943 (array_inv!1463 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (array_inv!1464 (_values!2959 (v!3308 (underlying!485 thiss!992)))) e!93735))))

(declare-fun b!143837 () Bool)

(assert (=> b!143837 (= e!93750 tp_is_empty!2943)))

(declare-fun b!143838 () Bool)

(assert (=> b!143838 (= e!93746 (and e!93742 mapRes!4885))))

(declare-fun condMapEmpty!4886 () Bool)

(declare-fun mapDefault!4886 () ValueCell!1128)

(assert (=> b!143838 (= condMapEmpty!4886 (= (arr!2328 (_values!2959 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4886)))))

(declare-fun b!143839 () Bool)

(assert (=> b!143839 (= e!93734 (not (contains!931 lt!75425 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143840 () Bool)

(declare-fun res!68519 () Bool)

(assert (=> b!143840 (=> (not res!68519) (not e!93747))))

(declare-fun valid!563 (LongMapFixedSize!1164) Bool)

(assert (=> b!143840 (= res!68519 (valid!563 newMap!16))))

(declare-fun mapIsEmpty!4886 () Bool)

(assert (=> mapIsEmpty!4886 mapRes!4886))

(assert (= (and start!14972 res!68521) b!143834))

(assert (= (and b!143834 res!68524) b!143840))

(assert (= (and b!143840 res!68519) b!143825))

(assert (= (and b!143825 res!68526) b!143829))

(assert (= (and b!143829 res!68520) b!143828))

(assert (= (and b!143828 res!68525) b!143832))

(assert (= (and b!143832 (not res!68522)) b!143824))

(assert (= (and b!143824 (not res!68518)) b!143831))

(assert (= (and b!143831 res!68523) b!143839))

(assert (= (and b!143835 condMapEmpty!4885) mapIsEmpty!4886))

(assert (= (and b!143835 (not condMapEmpty!4885)) mapNonEmpty!4886))

(get-info :version)

(assert (= (and mapNonEmpty!4886 ((_ is ValueCellFull!1128) mapValue!4885)) b!143827))

(assert (= (and b!143835 ((_ is ValueCellFull!1128) mapDefault!4885)) b!143837))

(assert (= b!143836 b!143835))

(assert (= b!143833 b!143836))

(assert (= b!143830 b!143833))

(assert (= start!14972 b!143830))

(assert (= (and b!143838 condMapEmpty!4886) mapIsEmpty!4885))

(assert (= (and b!143838 (not condMapEmpty!4886)) mapNonEmpty!4885))

(assert (= (and mapNonEmpty!4885 ((_ is ValueCellFull!1128) mapValue!4886)) b!143823))

(assert (= (and b!143838 ((_ is ValueCellFull!1128) mapDefault!4886)) b!143826))

(assert (= b!143822 b!143838))

(assert (= start!14972 b!143822))

(declare-fun b_lambda!6457 () Bool)

(assert (=> (not b_lambda!6457) (not b!143828)))

(declare-fun t!6378 () Bool)

(declare-fun tb!2589 () Bool)

(assert (=> (and b!143836 (= (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) t!6378) tb!2589))

(declare-fun result!4237 () Bool)

(assert (=> tb!2589 (= result!4237 tp_is_empty!2943)))

(assert (=> b!143828 t!6378))

(declare-fun b_and!8971 () Bool)

(assert (= b_and!8967 (and (=> t!6378 result!4237) b_and!8971)))

(declare-fun t!6380 () Bool)

(declare-fun tb!2591 () Bool)

(assert (=> (and b!143822 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) t!6380) tb!2591))

(declare-fun result!4241 () Bool)

(assert (= result!4241 result!4237))

(assert (=> b!143828 t!6380))

(declare-fun b_and!8973 () Bool)

(assert (= b_and!8969 (and (=> t!6380 result!4241) b_and!8973)))

(declare-fun m!173579 () Bool)

(assert (=> mapNonEmpty!4885 m!173579))

(declare-fun m!173581 () Bool)

(assert (=> b!143824 m!173581))

(declare-fun m!173583 () Bool)

(assert (=> b!143829 m!173583))

(declare-fun m!173585 () Bool)

(assert (=> b!143829 m!173585))

(declare-fun m!173587 () Bool)

(assert (=> b!143829 m!173587))

(declare-fun m!173589 () Bool)

(assert (=> b!143832 m!173589))

(declare-fun m!173591 () Bool)

(assert (=> b!143832 m!173591))

(assert (=> b!143832 m!173583))

(declare-fun m!173593 () Bool)

(assert (=> b!143832 m!173593))

(assert (=> b!143832 m!173583))

(assert (=> b!143832 m!173583))

(declare-fun m!173595 () Bool)

(assert (=> b!143832 m!173595))

(declare-fun m!173597 () Bool)

(assert (=> start!14972 m!173597))

(declare-fun m!173599 () Bool)

(assert (=> mapNonEmpty!4886 m!173599))

(declare-fun m!173601 () Bool)

(assert (=> b!143822 m!173601))

(declare-fun m!173603 () Bool)

(assert (=> b!143822 m!173603))

(declare-fun m!173605 () Bool)

(assert (=> b!143836 m!173605))

(declare-fun m!173607 () Bool)

(assert (=> b!143836 m!173607))

(declare-fun m!173609 () Bool)

(assert (=> b!143839 m!173609))

(declare-fun m!173611 () Bool)

(assert (=> b!143828 m!173611))

(declare-fun m!173613 () Bool)

(assert (=> b!143828 m!173613))

(declare-fun m!173615 () Bool)

(assert (=> b!143828 m!173615))

(assert (=> b!143828 m!173583))

(assert (=> b!143828 m!173613))

(assert (=> b!143828 m!173583))

(assert (=> b!143828 m!173615))

(declare-fun m!173617 () Bool)

(assert (=> b!143828 m!173617))

(assert (=> b!143828 m!173583))

(declare-fun m!173619 () Bool)

(assert (=> b!143828 m!173619))

(assert (=> b!143828 m!173611))

(declare-fun m!173621 () Bool)

(assert (=> b!143840 m!173621))

(declare-fun m!173623 () Bool)

(assert (=> b!143831 m!173623))

(check-sat (not b!143824) (not b!143829) b_and!8973 b_and!8971 (not start!14972) (not mapNonEmpty!4885) (not b!143822) tp_is_empty!2943 (not b!143831) (not b!143840) (not b!143832) (not b!143839) (not b_next!3053) (not b_next!3055) (not b!143828) (not b_lambda!6457) (not mapNonEmpty!4886) (not b!143836))
(check-sat b_and!8971 b_and!8973 (not b_next!3053) (not b_next!3055))
(get-model)

(declare-fun b_lambda!6461 () Bool)

(assert (= b_lambda!6457 (or (and b!143836 b_free!3053) (and b!143822 b_free!3055 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))))) b_lambda!6461)))

(check-sat (not b!143829) b_and!8973 b_and!8971 (not start!14972) (not mapNonEmpty!4885) (not b!143822) (not b!143828) tp_is_empty!2943 (not b!143831) (not b!143824) (not b_lambda!6461) (not b!143840) (not b!143832) (not b!143839) (not b_next!3053) (not b_next!3055) (not mapNonEmpty!4886) (not b!143836))
(check-sat b_and!8971 b_and!8973 (not b_next!3053) (not b_next!3055))
(get-model)

(declare-fun d!45917 () Bool)

(assert (=> d!45917 (= (map!1448 newMap!16) (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun bs!6083 () Bool)

(assert (= bs!6083 d!45917))

(declare-fun m!173671 () Bool)

(assert (=> bs!6083 m!173671))

(assert (=> b!143829 d!45917))

(declare-fun b!143944 () Bool)

(declare-fun e!93836 () Bool)

(declare-fun lt!75504 () ListLongMap!1751)

(declare-fun apply!122 (ListLongMap!1751 (_ BitVec 64)) V!3571)

(assert (=> b!143944 (= e!93836 (= (apply!122 lt!75504 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143945 () Bool)

(declare-fun e!93835 () Bool)

(assert (=> b!143945 (= e!93835 (= (apply!122 lt!75504 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143945 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2602 (_values!2959 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> b!143945 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!143946 () Bool)

(declare-fun c!27231 () Bool)

(assert (=> b!143946 (= c!27231 (and (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!93838 () ListLongMap!1751)

(declare-fun e!93840 () ListLongMap!1751)

(assert (=> b!143946 (= e!93838 e!93840)))

(declare-fun bm!15958 () Bool)

(declare-fun call!15961 () Bool)

(assert (=> bm!15958 (= call!15961 (contains!930 lt!75504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143947 () Bool)

(declare-fun e!93831 () Bool)

(assert (=> b!143947 (= e!93831 (= (apply!122 lt!75504 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143948 () Bool)

(declare-fun e!93830 () Bool)

(assert (=> b!143948 (= e!93830 e!93836)))

(declare-fun res!68579 () Bool)

(assert (=> b!143948 (= res!68579 call!15961)))

(assert (=> b!143948 (=> (not res!68579) (not e!93836))))

(declare-fun b!143949 () Bool)

(declare-fun call!15966 () ListLongMap!1751)

(assert (=> b!143949 (= e!93838 call!15966)))

(declare-fun b!143950 () Bool)

(declare-fun res!68574 () Bool)

(declare-fun e!93833 () Bool)

(assert (=> b!143950 (=> (not res!68574) (not e!93833))))

(declare-fun e!93832 () Bool)

(assert (=> b!143950 (= res!68574 e!93832)))

(declare-fun c!27229 () Bool)

(assert (=> b!143950 (= c!27229 (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143951 () Bool)

(declare-fun call!15963 () Bool)

(assert (=> b!143951 (= e!93832 (not call!15963))))

(declare-fun b!143952 () Bool)

(assert (=> b!143952 (= e!93840 call!15966)))

(declare-fun b!143953 () Bool)

(declare-fun e!93828 () ListLongMap!1751)

(declare-fun call!15967 () ListLongMap!1751)

(declare-fun +!181 (ListLongMap!1751 tuple2!2710) ListLongMap!1751)

(assert (=> b!143953 (= e!93828 (+!181 call!15967 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun d!45919 () Bool)

(assert (=> d!45919 e!93833))

(declare-fun res!68578 () Bool)

(assert (=> d!45919 (=> (not res!68578) (not e!93833))))

(assert (=> d!45919 (= res!68578 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun lt!75514 () ListLongMap!1751)

(assert (=> d!45919 (= lt!75504 lt!75514)))

(declare-fun lt!75507 () Unit!4557)

(declare-fun e!93837 () Unit!4557)

(assert (=> d!45919 (= lt!75507 e!93837)))

(declare-fun c!27233 () Bool)

(declare-fun e!93839 () Bool)

(assert (=> d!45919 (= c!27233 e!93839)))

(declare-fun res!68572 () Bool)

(assert (=> d!45919 (=> (not res!68572) (not e!93839))))

(assert (=> d!45919 (= res!68572 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!45919 (= lt!75514 e!93828)))

(declare-fun c!27230 () Bool)

(assert (=> d!45919 (= c!27230 (and (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45919 (validMask!0 (mask!7334 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!45919 (= (getCurrentListMap!563 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) lt!75504)))

(declare-fun b!143954 () Bool)

(assert (=> b!143954 (= e!93832 e!93831)))

(declare-fun res!68580 () Bool)

(assert (=> b!143954 (= res!68580 call!15963)))

(assert (=> b!143954 (=> (not res!68580) (not e!93831))))

(declare-fun b!143955 () Bool)

(assert (=> b!143955 (= e!93833 e!93830)))

(declare-fun c!27232 () Bool)

(assert (=> b!143955 (= c!27232 (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143956 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!143956 (= e!93839 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun call!15965 () ListLongMap!1751)

(declare-fun c!27234 () Bool)

(declare-fun bm!15959 () Bool)

(declare-fun call!15962 () ListLongMap!1751)

(declare-fun call!15964 () ListLongMap!1751)

(assert (=> bm!15959 (= call!15967 (+!181 (ite c!27230 call!15962 (ite c!27234 call!15964 call!15965)) (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun b!143957 () Bool)

(assert (=> b!143957 (= e!93830 (not call!15961))))

(declare-fun bm!15960 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!147 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) Int) ListLongMap!1751)

(assert (=> bm!15960 (= call!15962 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143958 () Bool)

(declare-fun res!68577 () Bool)

(assert (=> b!143958 (=> (not res!68577) (not e!93833))))

(declare-fun e!93829 () Bool)

(assert (=> b!143958 (= res!68577 e!93829)))

(declare-fun res!68575 () Bool)

(assert (=> b!143958 (=> res!68575 e!93829)))

(declare-fun e!93834 () Bool)

(assert (=> b!143958 (= res!68575 (not e!93834))))

(declare-fun res!68573 () Bool)

(assert (=> b!143958 (=> (not res!68573) (not e!93834))))

(assert (=> b!143958 (= res!68573 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!143959 () Bool)

(declare-fun Unit!4561 () Unit!4557)

(assert (=> b!143959 (= e!93837 Unit!4561)))

(declare-fun b!143960 () Bool)

(assert (=> b!143960 (= e!93828 e!93838)))

(assert (=> b!143960 (= c!27234 (and (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143961 () Bool)

(assert (=> b!143961 (= e!93829 e!93835)))

(declare-fun res!68576 () Bool)

(assert (=> b!143961 (=> (not res!68576) (not e!93835))))

(assert (=> b!143961 (= res!68576 (contains!930 lt!75504 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143961 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun bm!15961 () Bool)

(assert (=> bm!15961 (= call!15964 call!15962)))

(declare-fun bm!15962 () Bool)

(assert (=> bm!15962 (= call!15966 call!15967)))

(declare-fun b!143962 () Bool)

(assert (=> b!143962 (= e!93834 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143963 () Bool)

(assert (=> b!143963 (= e!93840 call!15965)))

(declare-fun b!143964 () Bool)

(declare-fun lt!75496 () Unit!4557)

(assert (=> b!143964 (= e!93837 lt!75496)))

(declare-fun lt!75497 () ListLongMap!1751)

(assert (=> b!143964 (= lt!75497 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75512 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75493 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75493 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75511 () Unit!4557)

(declare-fun addStillContains!98 (ListLongMap!1751 (_ BitVec 64) V!3571 (_ BitVec 64)) Unit!4557)

(assert (=> b!143964 (= lt!75511 (addStillContains!98 lt!75497 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75493))))

(assert (=> b!143964 (contains!930 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75493)))

(declare-fun lt!75503 () Unit!4557)

(assert (=> b!143964 (= lt!75503 lt!75511)))

(declare-fun lt!75508 () ListLongMap!1751)

(assert (=> b!143964 (= lt!75508 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75509 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75509 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75510 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75510 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75501 () Unit!4557)

(declare-fun addApplyDifferent!98 (ListLongMap!1751 (_ BitVec 64) V!3571 (_ BitVec 64)) Unit!4557)

(assert (=> b!143964 (= lt!75501 (addApplyDifferent!98 lt!75508 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75510))))

(assert (=> b!143964 (= (apply!122 (+!181 lt!75508 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75510) (apply!122 lt!75508 lt!75510))))

(declare-fun lt!75499 () Unit!4557)

(assert (=> b!143964 (= lt!75499 lt!75501)))

(declare-fun lt!75505 () ListLongMap!1751)

(assert (=> b!143964 (= lt!75505 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75494 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75502 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75502 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75506 () Unit!4557)

(assert (=> b!143964 (= lt!75506 (addApplyDifferent!98 lt!75505 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75502))))

(assert (=> b!143964 (= (apply!122 (+!181 lt!75505 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75502) (apply!122 lt!75505 lt!75502))))

(declare-fun lt!75513 () Unit!4557)

(assert (=> b!143964 (= lt!75513 lt!75506)))

(declare-fun lt!75500 () ListLongMap!1751)

(assert (=> b!143964 (= lt!75500 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75498 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75495 () (_ BitVec 64))

(assert (=> b!143964 (= lt!75495 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!143964 (= lt!75496 (addApplyDifferent!98 lt!75500 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75495))))

(assert (=> b!143964 (= (apply!122 (+!181 lt!75500 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75495) (apply!122 lt!75500 lt!75495))))

(declare-fun bm!15963 () Bool)

(assert (=> bm!15963 (= call!15965 call!15964)))

(declare-fun bm!15964 () Bool)

(assert (=> bm!15964 (= call!15963 (contains!930 lt!75504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45919 c!27230) b!143953))

(assert (= (and d!45919 (not c!27230)) b!143960))

(assert (= (and b!143960 c!27234) b!143949))

(assert (= (and b!143960 (not c!27234)) b!143946))

(assert (= (and b!143946 c!27231) b!143952))

(assert (= (and b!143946 (not c!27231)) b!143963))

(assert (= (or b!143952 b!143963) bm!15963))

(assert (= (or b!143949 bm!15963) bm!15961))

(assert (= (or b!143949 b!143952) bm!15962))

(assert (= (or b!143953 bm!15961) bm!15960))

(assert (= (or b!143953 bm!15962) bm!15959))

(assert (= (and d!45919 res!68572) b!143956))

(assert (= (and d!45919 c!27233) b!143964))

(assert (= (and d!45919 (not c!27233)) b!143959))

(assert (= (and d!45919 res!68578) b!143958))

(assert (= (and b!143958 res!68573) b!143962))

(assert (= (and b!143958 (not res!68575)) b!143961))

(assert (= (and b!143961 res!68576) b!143945))

(assert (= (and b!143958 res!68577) b!143950))

(assert (= (and b!143950 c!27229) b!143954))

(assert (= (and b!143950 (not c!27229)) b!143951))

(assert (= (and b!143954 res!68580) b!143947))

(assert (= (or b!143954 b!143951) bm!15964))

(assert (= (and b!143950 res!68574) b!143955))

(assert (= (and b!143955 c!27232) b!143948))

(assert (= (and b!143955 (not c!27232)) b!143957))

(assert (= (and b!143948 res!68579) b!143944))

(assert (= (or b!143948 b!143957) bm!15958))

(declare-fun b_lambda!6463 () Bool)

(assert (=> (not b_lambda!6463) (not b!143945)))

(assert (=> b!143945 t!6378))

(declare-fun b_and!8983 () Bool)

(assert (= b_and!8971 (and (=> t!6378 result!4237) b_and!8983)))

(assert (=> b!143945 t!6380))

(declare-fun b_and!8985 () Bool)

(assert (= b_and!8973 (and (=> t!6380 result!4241) b_and!8985)))

(declare-fun m!173673 () Bool)

(assert (=> bm!15958 m!173673))

(declare-fun m!173675 () Bool)

(assert (=> b!143956 m!173675))

(assert (=> b!143956 m!173675))

(declare-fun m!173677 () Bool)

(assert (=> b!143956 m!173677))

(assert (=> b!143961 m!173675))

(assert (=> b!143961 m!173675))

(declare-fun m!173679 () Bool)

(assert (=> b!143961 m!173679))

(declare-fun m!173681 () Bool)

(assert (=> b!143945 m!173681))

(assert (=> b!143945 m!173613))

(declare-fun m!173683 () Bool)

(assert (=> b!143945 m!173683))

(assert (=> b!143945 m!173613))

(assert (=> b!143945 m!173675))

(assert (=> b!143945 m!173681))

(assert (=> b!143945 m!173675))

(declare-fun m!173685 () Bool)

(assert (=> b!143945 m!173685))

(assert (=> b!143962 m!173675))

(assert (=> b!143962 m!173675))

(assert (=> b!143962 m!173677))

(declare-fun m!173687 () Bool)

(assert (=> b!143944 m!173687))

(declare-fun m!173689 () Bool)

(assert (=> b!143953 m!173689))

(declare-fun m!173691 () Bool)

(assert (=> bm!15960 m!173691))

(declare-fun m!173693 () Bool)

(assert (=> b!143947 m!173693))

(declare-fun m!173695 () Bool)

(assert (=> d!45919 m!173695))

(declare-fun m!173697 () Bool)

(assert (=> b!143964 m!173697))

(declare-fun m!173699 () Bool)

(assert (=> b!143964 m!173699))

(declare-fun m!173701 () Bool)

(assert (=> b!143964 m!173701))

(declare-fun m!173703 () Bool)

(assert (=> b!143964 m!173703))

(declare-fun m!173705 () Bool)

(assert (=> b!143964 m!173705))

(declare-fun m!173707 () Bool)

(assert (=> b!143964 m!173707))

(declare-fun m!173709 () Bool)

(assert (=> b!143964 m!173709))

(assert (=> b!143964 m!173707))

(declare-fun m!173711 () Bool)

(assert (=> b!143964 m!173711))

(assert (=> b!143964 m!173699))

(declare-fun m!173713 () Bool)

(assert (=> b!143964 m!173713))

(assert (=> b!143964 m!173703))

(declare-fun m!173715 () Bool)

(assert (=> b!143964 m!173715))

(declare-fun m!173717 () Bool)

(assert (=> b!143964 m!173717))

(assert (=> b!143964 m!173675))

(declare-fun m!173719 () Bool)

(assert (=> b!143964 m!173719))

(declare-fun m!173721 () Bool)

(assert (=> b!143964 m!173721))

(declare-fun m!173723 () Bool)

(assert (=> b!143964 m!173723))

(assert (=> b!143964 m!173691))

(assert (=> b!143964 m!173713))

(declare-fun m!173725 () Bool)

(assert (=> b!143964 m!173725))

(declare-fun m!173727 () Bool)

(assert (=> bm!15964 m!173727))

(declare-fun m!173729 () Bool)

(assert (=> bm!15959 m!173729))

(assert (=> b!143829 d!45919))

(declare-fun d!45921 () Bool)

(declare-fun lt!75517 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!140 (List!1752) (InoxSet (_ BitVec 64)))

(assert (=> d!45921 (= lt!75517 (select (content!140 lt!75425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93846 () Bool)

(assert (=> d!45921 (= lt!75517 e!93846)))

(declare-fun res!68586 () Bool)

(assert (=> d!45921 (=> (not res!68586) (not e!93846))))

(assert (=> d!45921 (= res!68586 ((_ is Cons!1748) lt!75425))))

(assert (=> d!45921 (= (contains!931 lt!75425 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75517)))

(declare-fun b!143969 () Bool)

(declare-fun e!93845 () Bool)

(assert (=> b!143969 (= e!93846 e!93845)))

(declare-fun res!68585 () Bool)

(assert (=> b!143969 (=> res!68585 e!93845)))

(assert (=> b!143969 (= res!68585 (= (h!2356 lt!75425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143970 () Bool)

(assert (=> b!143970 (= e!93845 (contains!931 (t!6381 lt!75425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45921 res!68586) b!143969))

(assert (= (and b!143969 (not res!68585)) b!143970))

(declare-fun m!173731 () Bool)

(assert (=> d!45921 m!173731))

(declare-fun m!173733 () Bool)

(assert (=> d!45921 m!173733))

(declare-fun m!173735 () Bool)

(assert (=> b!143970 m!173735))

(assert (=> b!143839 d!45921))

(declare-fun d!45923 () Bool)

(assert (=> d!45923 (= (valid!562 thiss!992) (valid!563 (v!3308 (underlying!485 thiss!992))))))

(declare-fun bs!6084 () Bool)

(assert (= bs!6084 d!45923))

(declare-fun m!173737 () Bool)

(assert (=> bs!6084 m!173737))

(assert (=> start!14972 d!45923))

(declare-fun d!45925 () Bool)

(declare-fun res!68591 () Bool)

(declare-fun e!93851 () Bool)

(assert (=> d!45925 (=> res!68591 e!93851)))

(assert (=> d!45925 (= res!68591 ((_ is Nil!1749) lt!75425))))

(assert (=> d!45925 (= (noDuplicate!52 lt!75425) e!93851)))

(declare-fun b!143975 () Bool)

(declare-fun e!93852 () Bool)

(assert (=> b!143975 (= e!93851 e!93852)))

(declare-fun res!68592 () Bool)

(assert (=> b!143975 (=> (not res!68592) (not e!93852))))

(assert (=> b!143975 (= res!68592 (not (contains!931 (t!6381 lt!75425) (h!2356 lt!75425))))))

(declare-fun b!143976 () Bool)

(assert (=> b!143976 (= e!93852 (noDuplicate!52 (t!6381 lt!75425)))))

(assert (= (and d!45925 (not res!68591)) b!143975))

(assert (= (and b!143975 res!68592) b!143976))

(declare-fun m!173739 () Bool)

(assert (=> b!143975 m!173739))

(declare-fun m!173741 () Bool)

(assert (=> b!143976 m!173741))

(assert (=> b!143824 d!45925))

(declare-fun b!143987 () Bool)

(declare-fun e!93864 () Bool)

(declare-fun e!93863 () Bool)

(assert (=> b!143987 (= e!93864 e!93863)))

(declare-fun c!27237 () Bool)

(assert (=> b!143987 (= c!27237 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!143988 () Bool)

(declare-fun e!93862 () Bool)

(assert (=> b!143988 (= e!93862 (contains!931 Nil!1749 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun bm!15967 () Bool)

(declare-fun call!15970 () Bool)

(assert (=> bm!15967 (= call!15970 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27237 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749) Nil!1749)))))

(declare-fun d!45927 () Bool)

(declare-fun res!68601 () Bool)

(declare-fun e!93861 () Bool)

(assert (=> d!45927 (=> res!68601 e!93861)))

(assert (=> d!45927 (= res!68601 (bvsge from!355 (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!45927 (= (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1749) e!93861)))

(declare-fun b!143989 () Bool)

(assert (=> b!143989 (= e!93863 call!15970)))

(declare-fun b!143990 () Bool)

(assert (=> b!143990 (= e!93861 e!93864)))

(declare-fun res!68599 () Bool)

(assert (=> b!143990 (=> (not res!68599) (not e!93864))))

(assert (=> b!143990 (= res!68599 (not e!93862))))

(declare-fun res!68600 () Bool)

(assert (=> b!143990 (=> (not res!68600) (not e!93862))))

(assert (=> b!143990 (= res!68600 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!143991 () Bool)

(assert (=> b!143991 (= e!93863 call!15970)))

(assert (= (and d!45927 (not res!68601)) b!143990))

(assert (= (and b!143990 res!68600) b!143988))

(assert (= (and b!143990 res!68599) b!143987))

(assert (= (and b!143987 c!27237) b!143991))

(assert (= (and b!143987 (not c!27237)) b!143989))

(assert (= (or b!143991 b!143989) bm!15967))

(assert (=> b!143987 m!173583))

(assert (=> b!143987 m!173583))

(declare-fun m!173743 () Bool)

(assert (=> b!143987 m!173743))

(assert (=> b!143988 m!173583))

(assert (=> b!143988 m!173583))

(declare-fun m!173745 () Bool)

(assert (=> b!143988 m!173745))

(assert (=> bm!15967 m!173583))

(declare-fun m!173747 () Bool)

(assert (=> bm!15967 m!173747))

(assert (=> b!143990 m!173583))

(assert (=> b!143990 m!173583))

(assert (=> b!143990 m!173743))

(assert (=> b!143832 d!45927))

(declare-fun d!45929 () Bool)

(assert (=> d!45929 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1749)))

(declare-fun lt!75520 () Unit!4557)

(declare-fun choose!39 (array!4925 (_ BitVec 32) (_ BitVec 32)) Unit!4557)

(assert (=> d!45929 (= lt!75520 (choose!39 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45929 (bvslt (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45929 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75520)))

(declare-fun bs!6085 () Bool)

(assert (= bs!6085 d!45929))

(assert (=> bs!6085 m!173591))

(declare-fun m!173749 () Bool)

(assert (=> bs!6085 m!173749))

(assert (=> b!143832 d!45929))

(declare-fun d!45931 () Bool)

(declare-fun res!68606 () Bool)

(declare-fun e!93869 () Bool)

(assert (=> d!45931 (=> res!68606 e!93869)))

(assert (=> d!45931 (= res!68606 (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45931 (= (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93869)))

(declare-fun b!143996 () Bool)

(declare-fun e!93870 () Bool)

(assert (=> b!143996 (= e!93869 e!93870)))

(declare-fun res!68607 () Bool)

(assert (=> b!143996 (=> (not res!68607) (not e!93870))))

(assert (=> b!143996 (= res!68607 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!143997 () Bool)

(assert (=> b!143997 (= e!93870 (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45931 (not res!68606)) b!143996))

(assert (= (and b!143996 res!68607) b!143997))

(assert (=> d!45931 m!173675))

(assert (=> b!143997 m!173583))

(declare-fun m!173751 () Bool)

(assert (=> b!143997 m!173751))

(assert (=> b!143832 d!45931))

(declare-fun d!45933 () Bool)

(declare-fun e!93873 () Bool)

(assert (=> d!45933 e!93873))

(declare-fun c!27240 () Bool)

(assert (=> d!45933 (= c!27240 (and (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75523 () Unit!4557)

(declare-fun choose!879 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) (_ BitVec 32) Int) Unit!4557)

(assert (=> d!45933 (= lt!75523 (choose!879 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(assert (=> d!45933 (validMask!0 (mask!7334 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!45933 (= (lemmaListMapContainsThenArrayContainsFrom!143 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) lt!75523)))

(declare-fun b!144002 () Bool)

(assert (=> b!144002 (= e!93873 (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144003 () Bool)

(assert (=> b!144003 (= e!93873 (ite (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45933 c!27240) b!144002))

(assert (= (and d!45933 (not c!27240)) b!144003))

(assert (=> d!45933 m!173583))

(declare-fun m!173753 () Bool)

(assert (=> d!45933 m!173753))

(assert (=> d!45933 m!173695))

(assert (=> b!144002 m!173583))

(assert (=> b!144002 m!173595))

(assert (=> b!143832 d!45933))

(declare-fun d!45935 () Bool)

(declare-fun e!93879 () Bool)

(assert (=> d!45935 e!93879))

(declare-fun res!68610 () Bool)

(assert (=> d!45935 (=> res!68610 e!93879)))

(declare-fun lt!75534 () Bool)

(assert (=> d!45935 (= res!68610 (not lt!75534))))

(declare-fun lt!75533 () Bool)

(assert (=> d!45935 (= lt!75534 lt!75533)))

(declare-fun lt!75532 () Unit!4557)

(declare-fun e!93878 () Unit!4557)

(assert (=> d!45935 (= lt!75532 e!93878)))

(declare-fun c!27243 () Bool)

(assert (=> d!45935 (= c!27243 lt!75533)))

(declare-fun containsKey!182 (List!1753 (_ BitVec 64)) Bool)

(assert (=> d!45935 (= lt!75533 (containsKey!182 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45935 (= (contains!930 lt!75428 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75534)))

(declare-fun b!144010 () Bool)

(declare-fun lt!75535 () Unit!4557)

(assert (=> b!144010 (= e!93878 lt!75535)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!130 (List!1753 (_ BitVec 64)) Unit!4557)

(assert (=> b!144010 (= lt!75535 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((Option!184 0))(
  ( (Some!183 (v!3313 V!3571)) (None!182) )
))
(declare-fun isDefined!131 (Option!184) Bool)

(declare-fun getValueByKey!178 (List!1753 (_ BitVec 64)) Option!184)

(assert (=> b!144010 (isDefined!131 (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144011 () Bool)

(declare-fun Unit!4562 () Unit!4557)

(assert (=> b!144011 (= e!93878 Unit!4562)))

(declare-fun b!144012 () Bool)

(assert (=> b!144012 (= e!93879 (isDefined!131 (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!45935 c!27243) b!144010))

(assert (= (and d!45935 (not c!27243)) b!144011))

(assert (= (and d!45935 (not res!68610)) b!144012))

(assert (=> d!45935 m!173583))

(declare-fun m!173755 () Bool)

(assert (=> d!45935 m!173755))

(assert (=> b!144010 m!173583))

(declare-fun m!173757 () Bool)

(assert (=> b!144010 m!173757))

(assert (=> b!144010 m!173583))

(declare-fun m!173759 () Bool)

(assert (=> b!144010 m!173759))

(assert (=> b!144010 m!173759))

(declare-fun m!173761 () Bool)

(assert (=> b!144010 m!173761))

(assert (=> b!144012 m!173583))

(assert (=> b!144012 m!173759))

(assert (=> b!144012 m!173759))

(assert (=> b!144012 m!173761))

(assert (=> b!143828 d!45935))

(declare-fun bm!16016 () Bool)

(declare-fun call!16038 () ListLongMap!1751)

(assert (=> bm!16016 (= call!16038 (map!1448 newMap!16))))

(declare-fun b!144097 () Bool)

(declare-fun lt!75598 () Unit!4557)

(declare-fun lt!75603 () Unit!4557)

(assert (=> b!144097 (= lt!75598 lt!75603)))

(declare-fun call!16033 () ListLongMap!1751)

(declare-datatypes ((SeekEntryResult!281 0))(
  ( (MissingZero!281 (index!3289 (_ BitVec 32))) (Found!281 (index!3290 (_ BitVec 32))) (Intermediate!281 (undefined!1093 Bool) (index!3291 (_ BitVec 32)) (x!16424 (_ BitVec 32))) (Undefined!281) (MissingVacant!281 (index!3292 (_ BitVec 32))) )
))
(declare-fun lt!75604 () SeekEntryResult!281)

(assert (=> b!144097 (contains!930 call!16033 (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604)))))

(declare-fun lt!75601 () array!4927)

(declare-fun lemmaValidKeyInArrayIsInListMap!128 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) Int) Unit!4557)

(assert (=> b!144097 (= lt!75603 (lemmaValidKeyInArrayIsInListMap!128 (_keys!4741 newMap!16) lt!75601 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (defaultEntry!2976 newMap!16)))))

(assert (=> b!144097 (= lt!75601 (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))))))

(declare-fun lt!75599 () Unit!4557)

(declare-fun lt!75602 () Unit!4557)

(assert (=> b!144097 (= lt!75599 lt!75602)))

(declare-fun call!16029 () ListLongMap!1751)

(declare-fun call!16037 () ListLongMap!1751)

(assert (=> b!144097 (= call!16029 call!16037)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) (_ BitVec 64) V!3571 Int) Unit!4557)

(assert (=> b!144097 (= lt!75602 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75592 () Unit!4557)

(declare-fun e!93925 () Unit!4557)

(assert (=> b!144097 (= lt!75592 e!93925)))

(declare-fun c!27276 () Bool)

(declare-fun call!16040 () Bool)

(assert (=> b!144097 (= c!27276 call!16040)))

(declare-fun e!93930 () tuple2!2712)

(assert (=> b!144097 (= e!93930 (tuple2!2713 true (LongMapFixedSize!1165 (defaultEntry!2976 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (_size!631 newMap!16) (_keys!4741 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))) (_vacant!631 newMap!16))))))

(declare-fun call!16031 () Unit!4557)

(declare-fun bm!16017 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) Int) Unit!4557)

(assert (=> bm!16017 (= call!16031 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(declare-fun b!144098 () Bool)

(declare-fun e!93928 () tuple2!2712)

(declare-fun lt!75596 () tuple2!2712)

(assert (=> b!144098 (= e!93928 (tuple2!2713 (_1!1367 lt!75596) (_2!1367 lt!75596)))))

(declare-fun call!16041 () tuple2!2712)

(assert (=> b!144098 (= lt!75596 call!16041)))

(declare-fun bm!16018 () Bool)

(declare-fun call!16020 () ListLongMap!1751)

(declare-fun call!16042 () ListLongMap!1751)

(assert (=> bm!16018 (= call!16020 call!16042)))

(declare-fun b!144099 () Bool)

(declare-fun e!93933 () Unit!4557)

(declare-fun Unit!4563 () Unit!4557)

(assert (=> b!144099 (= e!93933 Unit!4563)))

(declare-fun lt!75609 () Unit!4557)

(assert (=> b!144099 (= lt!75609 call!16031)))

(declare-fun lt!75594 () SeekEntryResult!281)

(declare-fun call!16039 () SeekEntryResult!281)

(assert (=> b!144099 (= lt!75594 call!16039)))

(declare-fun res!68641 () Bool)

(assert (=> b!144099 (= res!68641 ((_ is Found!281) lt!75594))))

(declare-fun e!93943 () Bool)

(assert (=> b!144099 (=> (not res!68641) (not e!93943))))

(assert (=> b!144099 e!93943))

(declare-fun lt!75606 () Unit!4557)

(assert (=> b!144099 (= lt!75606 lt!75609)))

(assert (=> b!144099 false))

(declare-fun call!16022 () ListLongMap!1751)

(declare-fun b!144100 () Bool)

(declare-fun c!27279 () Bool)

(declare-fun e!93942 () ListLongMap!1751)

(assert (=> b!144100 (= e!93942 (ite c!27279 call!16022 call!16020))))

(declare-fun bm!16019 () Bool)

(assert (=> bm!16019 (= call!16022 call!16037)))

(declare-fun bm!16020 () Bool)

(declare-fun call!16024 () Bool)

(declare-fun call!16030 () Bool)

(assert (=> bm!16020 (= call!16024 call!16030)))

(declare-fun b!144101 () Bool)

(declare-fun lt!75591 () Unit!4557)

(assert (=> b!144101 (= e!93933 lt!75591)))

(declare-fun call!16032 () Unit!4557)

(assert (=> b!144101 (= lt!75591 call!16032)))

(declare-fun lt!75611 () SeekEntryResult!281)

(assert (=> b!144101 (= lt!75611 call!16039)))

(declare-fun c!27283 () Bool)

(assert (=> b!144101 (= c!27283 ((_ is MissingZero!281) lt!75611))))

(declare-fun e!93944 () Bool)

(assert (=> b!144101 e!93944))

(declare-fun b!144102 () Bool)

(declare-fun e!93934 () Bool)

(declare-fun lt!75610 () SeekEntryResult!281)

(assert (=> b!144102 (= e!93934 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75610)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun bm!16021 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) Int) Unit!4557)

(assert (=> bm!16021 (= call!16032 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(declare-fun bm!16022 () Bool)

(declare-fun call!16025 () SeekEntryResult!281)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4925 (_ BitVec 32)) SeekEntryResult!281)

(assert (=> bm!16022 (= call!16025 (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun c!27275 () Bool)

(declare-fun bm!16023 () Bool)

(declare-fun call!16019 () Bool)

(declare-fun c!27273 () Bool)

(declare-fun c!27285 () Bool)

(declare-fun lt!75608 () SeekEntryResult!281)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16023 (= call!16019 (inRange!0 (ite c!27273 (ite c!27285 (index!3290 lt!75594) (ite c!27283 (index!3289 lt!75611) (index!3292 lt!75611))) (ite c!27276 (index!3290 lt!75610) (ite c!27275 (index!3289 lt!75608) (index!3292 lt!75608)))) (mask!7334 newMap!16)))))

(declare-fun b!144103 () Bool)

(declare-fun e!93945 () Bool)

(declare-fun e!93924 () Bool)

(assert (=> b!144103 (= e!93945 e!93924)))

(declare-fun res!68640 () Bool)

(declare-fun call!16023 () Bool)

(assert (=> b!144103 (= res!68640 call!16023)))

(assert (=> b!144103 (=> (not res!68640) (not e!93924))))

(declare-fun b!144104 () Bool)

(declare-fun c!27282 () Bool)

(assert (=> b!144104 (= c!27282 ((_ is MissingVacant!281) lt!75608))))

(declare-fun e!93926 () Bool)

(assert (=> b!144104 (= e!93926 e!93945)))

(declare-fun b!144105 () Bool)

(declare-fun e!93939 () ListLongMap!1751)

(assert (=> b!144105 (= e!93939 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144106 () Bool)

(declare-fun c!27278 () Bool)

(assert (=> b!144106 (= c!27278 ((_ is MissingVacant!281) lt!75604))))

(declare-fun e!93938 () tuple2!2712)

(assert (=> b!144106 (= e!93938 e!93928)))

(declare-fun b!144107 () Bool)

(declare-fun lt!75597 () Unit!4557)

(declare-fun lt!75600 () Unit!4557)

(assert (=> b!144107 (= lt!75597 lt!75600)))

(declare-fun call!16021 () ListLongMap!1751)

(assert (=> b!144107 (= call!16021 call!16022)))

(declare-fun lt!75605 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 V!3571 Int) Unit!4557)

(assert (=> b!144107 (= lt!75600 (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75605 (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)))))

(assert (=> b!144107 (= lt!75605 (bvor (extraKeys!2725 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!93932 () tuple2!2712)

(assert (=> b!144107 (= e!93932 (tuple2!2713 true (LongMapFixedSize!1165 (defaultEntry!2976 newMap!16) (mask!7334 newMap!16) (bvor (extraKeys!2725 newMap!16) #b00000000000000000000000000000010) (zeroValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!631 newMap!16) (_keys!4741 newMap!16) (_values!2959 newMap!16) (_vacant!631 newMap!16))))))

(declare-fun b!144108 () Bool)

(declare-fun e!93940 () Bool)

(declare-fun e!93931 () Bool)

(assert (=> b!144108 (= e!93940 e!93931)))

(declare-fun c!27284 () Bool)

(declare-fun lt!75590 () tuple2!2712)

(assert (=> b!144108 (= c!27284 (_1!1367 lt!75590))))

(declare-fun b!144109 () Bool)

(assert (=> b!144109 (= e!93945 ((_ is Undefined!281) lt!75608))))

(declare-fun b!144110 () Bool)

(declare-fun res!68645 () Bool)

(declare-fun call!16027 () Bool)

(assert (=> b!144110 (= res!68645 call!16027)))

(assert (=> b!144110 (=> (not res!68645) (not e!93943))))

(declare-fun bm!16024 () Bool)

(declare-fun call!16026 () Bool)

(assert (=> bm!16024 (= call!16026 call!16030)))

(declare-fun b!144111 () Bool)

(declare-fun e!93941 () Bool)

(declare-fun e!93936 () Bool)

(assert (=> b!144111 (= e!93941 e!93936)))

(declare-fun res!68646 () Bool)

(declare-fun call!16035 () Bool)

(assert (=> b!144111 (= res!68646 call!16035)))

(assert (=> b!144111 (=> (not res!68646) (not e!93936))))

(declare-fun b!144112 () Bool)

(declare-fun res!68639 () Bool)

(declare-fun e!93929 () Bool)

(assert (=> b!144112 (=> (not res!68639) (not e!93929))))

(assert (=> b!144112 (= res!68639 call!16023)))

(assert (=> b!144112 (= e!93926 e!93929)))

(declare-fun bm!16025 () Bool)

(declare-fun c!27272 () Bool)

(assert (=> bm!16025 (= call!16029 (+!181 e!93942 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27274 () Bool)

(assert (=> bm!16025 (= c!27274 c!27272)))

(declare-fun bm!16026 () Bool)

(declare-fun call!16034 () Bool)

(assert (=> bm!16026 (= call!16023 call!16034)))

(declare-fun b!144113 () Bool)

(assert (=> b!144113 (= e!93939 call!16033)))

(declare-fun b!144114 () Bool)

(assert (=> b!144114 (= e!93943 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75594)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144115 () Bool)

(declare-fun res!68642 () Bool)

(assert (=> b!144115 (=> (not res!68642) (not e!93929))))

(assert (=> b!144115 (= res!68642 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3289 lt!75608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144116 () Bool)

(assert (=> b!144116 (= e!93941 ((_ is Undefined!281) lt!75611))))

(declare-fun b!144117 () Bool)

(assert (=> b!144117 (= e!93928 e!93930)))

(declare-fun c!27280 () Bool)

(assert (=> b!144117 (= c!27280 ((_ is MissingZero!281) lt!75604))))

(declare-fun b!144118 () Bool)

(declare-fun e!93935 () Bool)

(assert (=> b!144118 (= e!93931 e!93935)))

(declare-fun res!68650 () Bool)

(declare-fun call!16036 () ListLongMap!1751)

(assert (=> b!144118 (= res!68650 (contains!930 call!16036 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144118 (=> (not res!68650) (not e!93935))))

(declare-fun bm!16027 () Bool)

(assert (=> bm!16027 (= call!16030 (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144119 () Bool)

(declare-fun e!93937 () tuple2!2712)

(assert (=> b!144119 (= e!93937 e!93932)))

(assert (=> b!144119 (= c!27279 (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144120 () Bool)

(declare-fun res!68649 () Bool)

(declare-fun e!93927 () Bool)

(assert (=> b!144120 (=> (not res!68649) (not e!93927))))

(assert (=> b!144120 (= res!68649 call!16035)))

(assert (=> b!144120 (= e!93944 e!93927)))

(declare-fun lt!75595 () (_ BitVec 32))

(declare-fun bm!16028 () Bool)

(assert (=> bm!16028 (= call!16042 (getCurrentListMap!563 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144121 () Bool)

(declare-fun Unit!4564 () Unit!4557)

(assert (=> b!144121 (= e!93925 Unit!4564)))

(declare-fun lt!75613 () Unit!4557)

(assert (=> b!144121 (= lt!75613 call!16032)))

(declare-fun call!16028 () SeekEntryResult!281)

(assert (=> b!144121 (= lt!75608 call!16028)))

(assert (=> b!144121 (= c!27275 ((_ is MissingZero!281) lt!75608))))

(assert (=> b!144121 e!93926))

(declare-fun lt!75616 () Unit!4557)

(assert (=> b!144121 (= lt!75616 lt!75613)))

(assert (=> b!144121 false))

(declare-fun b!144122 () Bool)

(assert (=> b!144122 (= e!93924 (not call!16024))))

(declare-fun b!144123 () Bool)

(declare-fun lt!75607 () Unit!4557)

(declare-fun lt!75614 () Unit!4557)

(assert (=> b!144123 (= lt!75607 lt!75614)))

(assert (=> b!144123 (= call!16021 call!16020)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!67 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 V!3571 Int) Unit!4557)

(assert (=> b!144123 (= lt!75614 (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75595 (zeroValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2823 newMap!16) (defaultEntry!2976 newMap!16)))))

(assert (=> b!144123 (= lt!75595 (bvor (extraKeys!2725 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!144123 (= e!93932 (tuple2!2713 true (LongMapFixedSize!1165 (defaultEntry!2976 newMap!16) (mask!7334 newMap!16) (bvor (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2823 newMap!16) (_size!631 newMap!16) (_keys!4741 newMap!16) (_values!2959 newMap!16) (_vacant!631 newMap!16))))))

(declare-fun bm!16029 () Bool)

(assert (=> bm!16029 (= call!16021 call!16029)))

(declare-fun b!144124 () Bool)

(declare-fun res!68643 () Bool)

(assert (=> b!144124 (= res!68643 call!16034)))

(assert (=> b!144124 (=> (not res!68643) (not e!93934))))

(declare-fun b!144125 () Bool)

(declare-fun res!68648 () Bool)

(assert (=> b!144125 (= res!68648 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3292 lt!75608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144125 (=> (not res!68648) (not e!93924))))

(declare-fun b!144126 () Bool)

(assert (=> b!144126 (= e!93936 (not call!16026))))

(declare-fun b!144127 () Bool)

(assert (=> b!144127 (= e!93929 (not call!16024))))

(declare-fun b!144128 () Bool)

(assert (=> b!144128 (= e!93942 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144129 () Bool)

(declare-fun lt!75593 () Unit!4557)

(assert (=> b!144129 (= lt!75593 e!93933)))

(assert (=> b!144129 (= c!27285 call!16040)))

(assert (=> b!144129 (= e!93938 (tuple2!2713 false newMap!16))))

(declare-fun bm!16030 () Bool)

(assert (=> bm!16030 (= call!16035 call!16027)))

(declare-fun bm!16031 () Bool)

(assert (=> bm!16031 (= call!16039 call!16025)))

(declare-fun b!144130 () Bool)

(declare-fun lt!75612 () Unit!4557)

(assert (=> b!144130 (= e!93925 lt!75612)))

(assert (=> b!144130 (= lt!75612 call!16031)))

(assert (=> b!144130 (= lt!75610 call!16028)))

(declare-fun res!68651 () Bool)

(assert (=> b!144130 (= res!68651 ((_ is Found!281) lt!75610))))

(assert (=> b!144130 (=> (not res!68651) (not e!93934))))

(assert (=> b!144130 e!93934))

(declare-fun b!144131 () Bool)

(assert (=> b!144131 (= e!93927 (not call!16026))))

(declare-fun bm!16032 () Bool)

(assert (=> bm!16032 (= call!16034 call!16019)))

(declare-fun b!144132 () Bool)

(declare-fun res!68652 () Bool)

(assert (=> b!144132 (=> (not res!68652) (not e!93927))))

(assert (=> b!144132 (= res!68652 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3289 lt!75611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16033 () Bool)

(assert (=> bm!16033 (= call!16027 call!16019)))

(declare-fun d!45937 () Bool)

(assert (=> d!45937 e!93940))

(declare-fun res!68647 () Bool)

(assert (=> d!45937 (=> (not res!68647) (not e!93940))))

(assert (=> d!45937 (= res!68647 (valid!563 (_2!1367 lt!75590)))))

(assert (=> d!45937 (= lt!75590 e!93937)))

(assert (=> d!45937 (= c!27272 (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvneg (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!45937 (valid!563 newMap!16)))

(assert (=> d!45937 (= (update!214 newMap!16 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!75590)))

(declare-fun bm!16034 () Bool)

(declare-fun updateHelperNewKey!67 (LongMapFixedSize!1164 (_ BitVec 64) V!3571 (_ BitVec 32)) tuple2!2712)

(assert (=> bm!16034 (= call!16041 (updateHelperNewKey!67 newMap!16 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604))))))

(declare-fun bm!16035 () Bool)

(declare-fun c!27281 () Bool)

(assert (=> bm!16035 (= c!27281 c!27273)))

(assert (=> bm!16035 (= call!16040 (contains!930 e!93939 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144133 () Bool)

(declare-fun c!27277 () Bool)

(assert (=> b!144133 (= c!27277 ((_ is MissingVacant!281) lt!75611))))

(assert (=> b!144133 (= e!93944 e!93941)))

(declare-fun b!144134 () Bool)

(declare-fun res!68644 () Bool)

(assert (=> b!144134 (= res!68644 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3292 lt!75611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144134 (=> (not res!68644) (not e!93936))))

(declare-fun bm!16036 () Bool)

(assert (=> bm!16036 (= call!16036 (map!1448 (_2!1367 lt!75590)))))

(declare-fun bm!16037 () Bool)

(assert (=> bm!16037 (= call!16037 (getCurrentListMap!563 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144135 () Bool)

(assert (=> b!144135 (= e!93931 (= call!16036 call!16038))))

(declare-fun b!144136 () Bool)

(assert (=> b!144136 (= e!93935 (= call!16036 (+!181 call!16038 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16038 () Bool)

(assert (=> bm!16038 (= call!16028 call!16025)))

(declare-fun bm!16039 () Bool)

(assert (=> bm!16039 (= call!16033 call!16042)))

(declare-fun b!144137 () Bool)

(assert (=> b!144137 (= e!93937 e!93938)))

(assert (=> b!144137 (= lt!75604 (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(assert (=> b!144137 (= c!27273 ((_ is Undefined!281) lt!75604))))

(declare-fun b!144138 () Bool)

(declare-fun lt!75615 () tuple2!2712)

(assert (=> b!144138 (= lt!75615 call!16041)))

(assert (=> b!144138 (= e!93930 (tuple2!2713 (_1!1367 lt!75615) (_2!1367 lt!75615)))))

(assert (= (and d!45937 c!27272) b!144119))

(assert (= (and d!45937 (not c!27272)) b!144137))

(assert (= (and b!144119 c!27279) b!144123))

(assert (= (and b!144119 (not c!27279)) b!144107))

(assert (= (or b!144123 b!144107) bm!16018))

(assert (= (or b!144123 b!144107) bm!16019))

(assert (= (or b!144123 b!144107) bm!16029))

(assert (= (and b!144137 c!27273) b!144129))

(assert (= (and b!144137 (not c!27273)) b!144106))

(assert (= (and b!144129 c!27285) b!144099))

(assert (= (and b!144129 (not c!27285)) b!144101))

(assert (= (and b!144099 res!68641) b!144110))

(assert (= (and b!144110 res!68645) b!144114))

(assert (= (and b!144101 c!27283) b!144120))

(assert (= (and b!144101 (not c!27283)) b!144133))

(assert (= (and b!144120 res!68649) b!144132))

(assert (= (and b!144132 res!68652) b!144131))

(assert (= (and b!144133 c!27277) b!144111))

(assert (= (and b!144133 (not c!27277)) b!144116))

(assert (= (and b!144111 res!68646) b!144134))

(assert (= (and b!144134 res!68644) b!144126))

(assert (= (or b!144120 b!144111) bm!16030))

(assert (= (or b!144131 b!144126) bm!16024))

(assert (= (or b!144110 bm!16030) bm!16033))

(assert (= (or b!144099 b!144101) bm!16031))

(assert (= (and b!144106 c!27278) b!144098))

(assert (= (and b!144106 (not c!27278)) b!144117))

(assert (= (and b!144117 c!27280) b!144138))

(assert (= (and b!144117 (not c!27280)) b!144097))

(assert (= (and b!144097 c!27276) b!144130))

(assert (= (and b!144097 (not c!27276)) b!144121))

(assert (= (and b!144130 res!68651) b!144124))

(assert (= (and b!144124 res!68643) b!144102))

(assert (= (and b!144121 c!27275) b!144112))

(assert (= (and b!144121 (not c!27275)) b!144104))

(assert (= (and b!144112 res!68639) b!144115))

(assert (= (and b!144115 res!68642) b!144127))

(assert (= (and b!144104 c!27282) b!144103))

(assert (= (and b!144104 (not c!27282)) b!144109))

(assert (= (and b!144103 res!68640) b!144125))

(assert (= (and b!144125 res!68648) b!144122))

(assert (= (or b!144112 b!144103) bm!16026))

(assert (= (or b!144127 b!144122) bm!16020))

(assert (= (or b!144124 bm!16026) bm!16032))

(assert (= (or b!144130 b!144121) bm!16038))

(assert (= (or b!144098 b!144138) bm!16034))

(assert (= (or bm!16031 bm!16038) bm!16022))

(assert (= (or bm!16024 bm!16020) bm!16027))

(assert (= (or b!144101 b!144121) bm!16021))

(assert (= (or b!144099 b!144130) bm!16017))

(assert (= (or b!144129 b!144097) bm!16039))

(assert (= (or bm!16033 bm!16032) bm!16023))

(assert (= (or b!144129 b!144097) bm!16035))

(assert (= (and bm!16035 c!27281) b!144113))

(assert (= (and bm!16035 (not c!27281)) b!144105))

(assert (= (or bm!16018 bm!16039) bm!16028))

(assert (= (or bm!16019 b!144097) bm!16037))

(assert (= (or bm!16029 b!144097) bm!16025))

(assert (= (and bm!16025 c!27274) b!144100))

(assert (= (and bm!16025 (not c!27274)) b!144128))

(assert (= (and d!45937 res!68647) b!144108))

(assert (= (and b!144108 c!27284) b!144118))

(assert (= (and b!144108 (not c!27284)) b!144135))

(assert (= (and b!144118 res!68650) b!144136))

(assert (= (or b!144136 b!144135) bm!16016))

(assert (= (or b!144118 b!144136 b!144135) bm!16036))

(declare-fun m!173763 () Bool)

(assert (=> d!45937 m!173763))

(assert (=> d!45937 m!173621))

(declare-fun m!173765 () Bool)

(assert (=> bm!16037 m!173765))

(declare-fun m!173767 () Bool)

(assert (=> bm!16037 m!173767))

(declare-fun m!173769 () Bool)

(assert (=> bm!16025 m!173769))

(declare-fun m!173771 () Bool)

(assert (=> bm!16028 m!173771))

(assert (=> bm!16027 m!173583))

(declare-fun m!173773 () Bool)

(assert (=> bm!16027 m!173773))

(assert (=> bm!16035 m!173583))

(declare-fun m!173775 () Bool)

(assert (=> bm!16035 m!173775))

(assert (=> bm!16034 m!173583))

(assert (=> bm!16034 m!173615))

(declare-fun m!173777 () Bool)

(assert (=> bm!16034 m!173777))

(declare-fun m!173779 () Bool)

(assert (=> b!144125 m!173779))

(declare-fun m!173781 () Bool)

(assert (=> bm!16023 m!173781))

(declare-fun m!173783 () Bool)

(assert (=> b!144114 m!173783))

(declare-fun m!173785 () Bool)

(assert (=> b!144136 m!173785))

(assert (=> b!144128 m!173671))

(assert (=> bm!16016 m!173585))

(assert (=> bm!16017 m!173583))

(declare-fun m!173787 () Bool)

(assert (=> bm!16017 m!173787))

(declare-fun m!173789 () Bool)

(assert (=> b!144132 m!173789))

(declare-fun m!173791 () Bool)

(assert (=> b!144134 m!173791))

(declare-fun m!173793 () Bool)

(assert (=> bm!16036 m!173793))

(assert (=> b!144107 m!173615))

(declare-fun m!173795 () Bool)

(assert (=> b!144107 m!173795))

(assert (=> b!144118 m!173583))

(declare-fun m!173797 () Bool)

(assert (=> b!144118 m!173797))

(assert (=> bm!16022 m!173583))

(declare-fun m!173799 () Bool)

(assert (=> bm!16022 m!173799))

(declare-fun m!173801 () Bool)

(assert (=> b!144102 m!173801))

(assert (=> b!144137 m!173583))

(assert (=> b!144137 m!173799))

(assert (=> b!144123 m!173615))

(declare-fun m!173803 () Bool)

(assert (=> b!144123 m!173803))

(assert (=> bm!16021 m!173583))

(declare-fun m!173805 () Bool)

(assert (=> bm!16021 m!173805))

(assert (=> b!144105 m!173671))

(declare-fun m!173807 () Bool)

(assert (=> b!144115 m!173807))

(assert (=> b!144097 m!173765))

(declare-fun m!173809 () Bool)

(assert (=> b!144097 m!173809))

(declare-fun m!173811 () Bool)

(assert (=> b!144097 m!173811))

(assert (=> b!144097 m!173809))

(assert (=> b!144097 m!173583))

(assert (=> b!144097 m!173615))

(declare-fun m!173813 () Bool)

(assert (=> b!144097 m!173813))

(declare-fun m!173815 () Bool)

(assert (=> b!144097 m!173815))

(assert (=> b!143828 d!45937))

(declare-fun d!45939 () Bool)

(declare-fun c!27288 () Bool)

(assert (=> d!45939 (= c!27288 ((_ is ValueCellFull!1128) (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!93948 () V!3571)

(assert (=> d!45939 (= (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93948)))

(declare-fun b!144143 () Bool)

(declare-fun get!1543 (ValueCell!1128 V!3571) V!3571)

(assert (=> b!144143 (= e!93948 (get!1543 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144144 () Bool)

(declare-fun get!1544 (ValueCell!1128 V!3571) V!3571)

(assert (=> b!144144 (= e!93948 (get!1544 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45939 c!27288) b!144143))

(assert (= (and d!45939 (not c!27288)) b!144144))

(assert (=> b!144143 m!173611))

(assert (=> b!144143 m!173613))

(declare-fun m!173817 () Bool)

(assert (=> b!144143 m!173817))

(assert (=> b!144144 m!173611))

(assert (=> b!144144 m!173613))

(declare-fun m!173819 () Bool)

(assert (=> b!144144 m!173819))

(assert (=> b!143828 d!45939))

(declare-fun d!45941 () Bool)

(assert (=> d!45941 (= (array_inv!1463 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvsge (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143836 d!45941))

(declare-fun d!45943 () Bool)

(assert (=> d!45943 (= (array_inv!1464 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvsge (size!2602 (_values!2959 (v!3308 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143836 d!45943))

(declare-fun d!45945 () Bool)

(declare-fun lt!75617 () Bool)

(assert (=> d!45945 (= lt!75617 (select (content!140 lt!75425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93950 () Bool)

(assert (=> d!45945 (= lt!75617 e!93950)))

(declare-fun res!68654 () Bool)

(assert (=> d!45945 (=> (not res!68654) (not e!93950))))

(assert (=> d!45945 (= res!68654 ((_ is Cons!1748) lt!75425))))

(assert (=> d!45945 (= (contains!931 lt!75425 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75617)))

(declare-fun b!144145 () Bool)

(declare-fun e!93949 () Bool)

(assert (=> b!144145 (= e!93950 e!93949)))

(declare-fun res!68653 () Bool)

(assert (=> b!144145 (=> res!68653 e!93949)))

(assert (=> b!144145 (= res!68653 (= (h!2356 lt!75425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144146 () Bool)

(assert (=> b!144146 (= e!93949 (contains!931 (t!6381 lt!75425) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45945 res!68654) b!144145))

(assert (= (and b!144145 (not res!68653)) b!144146))

(assert (=> d!45945 m!173731))

(declare-fun m!173821 () Bool)

(assert (=> d!45945 m!173821))

(declare-fun m!173823 () Bool)

(assert (=> b!144146 m!173823))

(assert (=> b!143831 d!45945))

(declare-fun d!45947 () Bool)

(declare-fun res!68661 () Bool)

(declare-fun e!93953 () Bool)

(assert (=> d!45947 (=> (not res!68661) (not e!93953))))

(declare-fun simpleValid!98 (LongMapFixedSize!1164) Bool)

(assert (=> d!45947 (= res!68661 (simpleValid!98 newMap!16))))

(assert (=> d!45947 (= (valid!563 newMap!16) e!93953)))

(declare-fun b!144153 () Bool)

(declare-fun res!68662 () Bool)

(assert (=> b!144153 (=> (not res!68662) (not e!93953))))

(declare-fun arrayCountValidKeys!0 (array!4925 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144153 (= res!68662 (= (arrayCountValidKeys!0 (_keys!4741 newMap!16) #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (_size!631 newMap!16)))))

(declare-fun b!144154 () Bool)

(declare-fun res!68663 () Bool)

(assert (=> b!144154 (=> (not res!68663) (not e!93953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4925 (_ BitVec 32)) Bool)

(assert (=> b!144154 (= res!68663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun b!144155 () Bool)

(assert (=> b!144155 (= e!93953 (arrayNoDuplicates!0 (_keys!4741 newMap!16) #b00000000000000000000000000000000 Nil!1749))))

(assert (= (and d!45947 res!68661) b!144153))

(assert (= (and b!144153 res!68662) b!144154))

(assert (= (and b!144154 res!68663) b!144155))

(declare-fun m!173825 () Bool)

(assert (=> d!45947 m!173825))

(declare-fun m!173827 () Bool)

(assert (=> b!144153 m!173827))

(declare-fun m!173829 () Bool)

(assert (=> b!144154 m!173829))

(declare-fun m!173831 () Bool)

(assert (=> b!144155 m!173831))

(assert (=> b!143840 d!45947))

(declare-fun d!45949 () Bool)

(assert (=> d!45949 (= (array_inv!1463 (_keys!4741 newMap!16)) (bvsge (size!2601 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143822 d!45949))

(declare-fun d!45951 () Bool)

(assert (=> d!45951 (= (array_inv!1464 (_values!2959 newMap!16)) (bvsge (size!2602 (_values!2959 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143822 d!45951))

(declare-fun condMapEmpty!4895 () Bool)

(declare-fun mapDefault!4895 () ValueCell!1128)

(assert (=> mapNonEmpty!4885 (= condMapEmpty!4895 (= mapRest!4885 ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4895)))))

(declare-fun e!93959 () Bool)

(declare-fun mapRes!4895 () Bool)

(assert (=> mapNonEmpty!4885 (= tp!11647 (and e!93959 mapRes!4895))))

(declare-fun b!144162 () Bool)

(declare-fun e!93958 () Bool)

(assert (=> b!144162 (= e!93958 tp_is_empty!2943)))

(declare-fun mapNonEmpty!4895 () Bool)

(declare-fun tp!11663 () Bool)

(assert (=> mapNonEmpty!4895 (= mapRes!4895 (and tp!11663 e!93958))))

(declare-fun mapRest!4895 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapValue!4895 () ValueCell!1128)

(declare-fun mapKey!4895 () (_ BitVec 32))

(assert (=> mapNonEmpty!4895 (= mapRest!4885 (store mapRest!4895 mapKey!4895 mapValue!4895))))

(declare-fun mapIsEmpty!4895 () Bool)

(assert (=> mapIsEmpty!4895 mapRes!4895))

(declare-fun b!144163 () Bool)

(assert (=> b!144163 (= e!93959 tp_is_empty!2943)))

(assert (= (and mapNonEmpty!4885 condMapEmpty!4895) mapIsEmpty!4895))

(assert (= (and mapNonEmpty!4885 (not condMapEmpty!4895)) mapNonEmpty!4895))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1128) mapValue!4895)) b!144162))

(assert (= (and mapNonEmpty!4885 ((_ is ValueCellFull!1128) mapDefault!4895)) b!144163))

(declare-fun m!173833 () Bool)

(assert (=> mapNonEmpty!4895 m!173833))

(declare-fun condMapEmpty!4896 () Bool)

(declare-fun mapDefault!4896 () ValueCell!1128)

(assert (=> mapNonEmpty!4886 (= condMapEmpty!4896 (= mapRest!4886 ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4896)))))

(declare-fun e!93961 () Bool)

(declare-fun mapRes!4896 () Bool)

(assert (=> mapNonEmpty!4886 (= tp!11648 (and e!93961 mapRes!4896))))

(declare-fun b!144164 () Bool)

(declare-fun e!93960 () Bool)

(assert (=> b!144164 (= e!93960 tp_is_empty!2943)))

(declare-fun mapNonEmpty!4896 () Bool)

(declare-fun tp!11664 () Bool)

(assert (=> mapNonEmpty!4896 (= mapRes!4896 (and tp!11664 e!93960))))

(declare-fun mapKey!4896 () (_ BitVec 32))

(declare-fun mapRest!4896 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapValue!4896 () ValueCell!1128)

(assert (=> mapNonEmpty!4896 (= mapRest!4886 (store mapRest!4896 mapKey!4896 mapValue!4896))))

(declare-fun mapIsEmpty!4896 () Bool)

(assert (=> mapIsEmpty!4896 mapRes!4896))

(declare-fun b!144165 () Bool)

(assert (=> b!144165 (= e!93961 tp_is_empty!2943)))

(assert (= (and mapNonEmpty!4886 condMapEmpty!4896) mapIsEmpty!4896))

(assert (= (and mapNonEmpty!4886 (not condMapEmpty!4896)) mapNonEmpty!4896))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1128) mapValue!4896)) b!144164))

(assert (= (and mapNonEmpty!4886 ((_ is ValueCellFull!1128) mapDefault!4896)) b!144165))

(declare-fun m!173835 () Bool)

(assert (=> mapNonEmpty!4896 m!173835))

(declare-fun b_lambda!6465 () Bool)

(assert (= b_lambda!6463 (or (and b!143836 b_free!3053) (and b!143822 b_free!3055 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))))) b_lambda!6465)))

(check-sat (not bm!16035) (not d!45935) (not b!143975) (not b!144012) (not bm!15959) (not bm!16023) (not d!45947) (not d!45945) (not bm!16028) (not b!143944) (not b!143956) (not b_lambda!6461) (not b!144137) (not bm!16034) (not b!144155) (not b!144002) (not b_next!3053) (not b_next!3055) (not d!45917) (not b!143988) (not b!144144) (not b!144128) (not b!143970) (not b!143990) (not d!45937) (not d!45933) (not bm!16025) b_and!8985 (not b!144153) (not b!144097) (not d!45923) (not d!45921) (not b!144136) (not b!144146) (not b!143945) (not b!144107) b_and!8983 tp_is_empty!2943 (not b!143987) (not bm!16016) (not bm!16037) (not b!144118) (not d!45929) (not bm!15964) (not b!143976) (not bm!16027) (not bm!15958) (not b!143964) (not b_lambda!6465) (not b!143997) (not mapNonEmpty!4896) (not bm!16017) (not b!144123) (not b!143962) (not bm!16022) (not mapNonEmpty!4895) (not bm!16036) (not b!143953) (not b!144105) (not b!144154) (not d!45919) (not bm!15967) (not b!143947) (not b!144010) (not b!144143) (not bm!15960) (not b!143961) (not bm!16021))
(check-sat b_and!8983 b_and!8985 (not b_next!3053) (not b_next!3055))
(get-model)

(declare-fun d!45953 () Bool)

(declare-fun e!93963 () Bool)

(assert (=> d!45953 e!93963))

(declare-fun res!68664 () Bool)

(assert (=> d!45953 (=> res!68664 e!93963)))

(declare-fun lt!75620 () Bool)

(assert (=> d!45953 (= res!68664 (not lt!75620))))

(declare-fun lt!75619 () Bool)

(assert (=> d!45953 (= lt!75620 lt!75619)))

(declare-fun lt!75618 () Unit!4557)

(declare-fun e!93962 () Unit!4557)

(assert (=> d!45953 (= lt!75618 e!93962)))

(declare-fun c!27289 () Bool)

(assert (=> d!45953 (= c!27289 lt!75619)))

(assert (=> d!45953 (= lt!75619 (containsKey!182 (toList!891 call!16033) (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604))))))

(assert (=> d!45953 (= (contains!930 call!16033 (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604))) lt!75620)))

(declare-fun b!144166 () Bool)

(declare-fun lt!75621 () Unit!4557)

(assert (=> b!144166 (= e!93962 lt!75621)))

(assert (=> b!144166 (= lt!75621 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 call!16033) (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604))))))

(assert (=> b!144166 (isDefined!131 (getValueByKey!178 (toList!891 call!16033) (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604))))))

(declare-fun b!144167 () Bool)

(declare-fun Unit!4565 () Unit!4557)

(assert (=> b!144167 (= e!93962 Unit!4565)))

(declare-fun b!144168 () Bool)

(assert (=> b!144168 (= e!93963 (isDefined!131 (getValueByKey!178 (toList!891 call!16033) (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604)))))))

(assert (= (and d!45953 c!27289) b!144166))

(assert (= (and d!45953 (not c!27289)) b!144167))

(assert (= (and d!45953 (not res!68664)) b!144168))

(assert (=> d!45953 m!173809))

(declare-fun m!173837 () Bool)

(assert (=> d!45953 m!173837))

(assert (=> b!144166 m!173809))

(declare-fun m!173839 () Bool)

(assert (=> b!144166 m!173839))

(assert (=> b!144166 m!173809))

(declare-fun m!173841 () Bool)

(assert (=> b!144166 m!173841))

(assert (=> b!144166 m!173841))

(declare-fun m!173843 () Bool)

(assert (=> b!144166 m!173843))

(assert (=> b!144168 m!173809))

(assert (=> b!144168 m!173841))

(assert (=> b!144168 m!173841))

(assert (=> b!144168 m!173843))

(assert (=> b!144097 d!45953))

(declare-fun d!45955 () Bool)

(declare-fun e!93966 () Bool)

(assert (=> d!45955 e!93966))

(declare-fun res!68667 () Bool)

(assert (=> d!45955 (=> (not res!68667) (not e!93966))))

(assert (=> d!45955 (= res!68667 (and (bvsge (index!3290 lt!75604) #b00000000000000000000000000000000) (bvslt (index!3290 lt!75604) (size!2601 (_keys!4741 newMap!16)))))))

(declare-fun lt!75624 () Unit!4557)

(declare-fun choose!880 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) Int) Unit!4557)

(assert (=> d!45955 (= lt!75624 (choose!880 (_keys!4741 newMap!16) lt!75601 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (defaultEntry!2976 newMap!16)))))

(assert (=> d!45955 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45955 (= (lemmaValidKeyInArrayIsInListMap!128 (_keys!4741 newMap!16) lt!75601 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (defaultEntry!2976 newMap!16)) lt!75624)))

(declare-fun b!144171 () Bool)

(assert (=> b!144171 (= e!93966 (contains!930 (getCurrentListMap!563 (_keys!4741 newMap!16) lt!75601 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75604))))))

(assert (= (and d!45955 res!68667) b!144171))

(declare-fun m!173845 () Bool)

(assert (=> d!45955 m!173845))

(declare-fun m!173847 () Bool)

(assert (=> d!45955 m!173847))

(declare-fun m!173849 () Bool)

(assert (=> b!144171 m!173849))

(assert (=> b!144171 m!173809))

(assert (=> b!144171 m!173849))

(assert (=> b!144171 m!173809))

(declare-fun m!173851 () Bool)

(assert (=> b!144171 m!173851))

(assert (=> b!144097 d!45955))

(declare-fun d!45957 () Bool)

(declare-fun e!93969 () Bool)

(assert (=> d!45957 e!93969))

(declare-fun res!68670 () Bool)

(assert (=> d!45957 (=> (not res!68670) (not e!93969))))

(assert (=> d!45957 (= res!68670 (and (bvsge (index!3290 lt!75604) #b00000000000000000000000000000000) (bvslt (index!3290 lt!75604) (size!2602 (_values!2959 newMap!16)))))))

(declare-fun lt!75627 () Unit!4557)

(declare-fun choose!881 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) (_ BitVec 64) V!3571 Int) Unit!4557)

(assert (=> d!45957 (= lt!75627 (choose!881 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)))))

(assert (=> d!45957 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45957 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (index!3290 lt!75604) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)) lt!75627)))

(declare-fun b!144174 () Bool)

(assert (=> b!144174 (= e!93969 (= (+!181 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!563 (_keys!4741 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16))))))

(assert (= (and d!45957 res!68670) b!144174))

(assert (=> d!45957 m!173583))

(assert (=> d!45957 m!173615))

(declare-fun m!173853 () Bool)

(assert (=> d!45957 m!173853))

(assert (=> d!45957 m!173847))

(assert (=> b!144174 m!173671))

(assert (=> b!144174 m!173671))

(declare-fun m!173855 () Bool)

(assert (=> b!144174 m!173855))

(assert (=> b!144174 m!173765))

(declare-fun m!173857 () Bool)

(assert (=> b!144174 m!173857))

(assert (=> b!144097 d!45957))

(declare-fun d!45959 () Bool)

(declare-fun e!93972 () Bool)

(assert (=> d!45959 e!93972))

(declare-fun res!68676 () Bool)

(assert (=> d!45959 (=> (not res!68676) (not e!93972))))

(declare-fun lt!75636 () ListLongMap!1751)

(assert (=> d!45959 (= res!68676 (contains!930 lt!75636 (_1!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75637 () List!1753)

(assert (=> d!45959 (= lt!75636 (ListLongMap!1752 lt!75637))))

(declare-fun lt!75639 () Unit!4557)

(declare-fun lt!75638 () Unit!4557)

(assert (=> d!45959 (= lt!75639 lt!75638)))

(assert (=> d!45959 (= (getValueByKey!178 lt!75637 (_1!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!92 (List!1753 (_ BitVec 64) V!3571) Unit!4557)

(assert (=> d!45959 (= lt!75638 (lemmaContainsTupThenGetReturnValue!92 lt!75637 (_1!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun insertStrictlySorted!95 (List!1753 (_ BitVec 64) V!3571) List!1753)

(assert (=> d!45959 (= lt!75637 (insertStrictlySorted!95 (toList!891 call!15967) (_1!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!45959 (= (+!181 call!15967 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75636)))

(declare-fun b!144179 () Bool)

(declare-fun res!68675 () Bool)

(assert (=> b!144179 (=> (not res!68675) (not e!93972))))

(assert (=> b!144179 (= res!68675 (= (getValueByKey!178 (toList!891 lt!75636) (_1!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144180 () Bool)

(declare-fun contains!934 (List!1753 tuple2!2710) Bool)

(assert (=> b!144180 (= e!93972 (contains!934 (toList!891 lt!75636) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!45959 res!68676) b!144179))

(assert (= (and b!144179 res!68675) b!144180))

(declare-fun m!173859 () Bool)

(assert (=> d!45959 m!173859))

(declare-fun m!173861 () Bool)

(assert (=> d!45959 m!173861))

(declare-fun m!173863 () Bool)

(assert (=> d!45959 m!173863))

(declare-fun m!173865 () Bool)

(assert (=> d!45959 m!173865))

(declare-fun m!173867 () Bool)

(assert (=> b!144179 m!173867))

(declare-fun m!173869 () Bool)

(assert (=> b!144180 m!173869))

(assert (=> b!143953 d!45959))

(declare-fun b!144181 () Bool)

(declare-fun e!93981 () Bool)

(declare-fun lt!75651 () ListLongMap!1751)

(assert (=> b!144181 (= e!93981 (= (apply!122 lt!75651 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2823 newMap!16)))))

(declare-fun b!144182 () Bool)

(declare-fun e!93980 () Bool)

(assert (=> b!144182 (= e!93980 (= (apply!122 lt!75651 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)) (get!1541 (select (arr!2328 (_values!2959 newMap!16)) #b00000000000000000000000000000000) (dynLambda!445 (defaultEntry!2976 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2602 (_values!2959 newMap!16))))))

(assert (=> b!144182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144183 () Bool)

(declare-fun c!27292 () Bool)

(assert (=> b!144183 (= c!27292 (and (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!93983 () ListLongMap!1751)

(declare-fun e!93985 () ListLongMap!1751)

(assert (=> b!144183 (= e!93983 e!93985)))

(declare-fun bm!16040 () Bool)

(declare-fun call!16043 () Bool)

(assert (=> bm!16040 (= call!16043 (contains!930 lt!75651 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144184 () Bool)

(declare-fun e!93976 () Bool)

(assert (=> b!144184 (= e!93976 (= (apply!122 lt!75651 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2823 newMap!16)))))

(declare-fun b!144185 () Bool)

(declare-fun e!93975 () Bool)

(assert (=> b!144185 (= e!93975 e!93981)))

(declare-fun res!68684 () Bool)

(assert (=> b!144185 (= res!68684 call!16043)))

(assert (=> b!144185 (=> (not res!68684) (not e!93981))))

(declare-fun b!144186 () Bool)

(declare-fun call!16048 () ListLongMap!1751)

(assert (=> b!144186 (= e!93983 call!16048)))

(declare-fun b!144187 () Bool)

(declare-fun res!68679 () Bool)

(declare-fun e!93978 () Bool)

(assert (=> b!144187 (=> (not res!68679) (not e!93978))))

(declare-fun e!93977 () Bool)

(assert (=> b!144187 (= res!68679 e!93977)))

(declare-fun c!27290 () Bool)

(assert (=> b!144187 (= c!27290 (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144188 () Bool)

(declare-fun call!16045 () Bool)

(assert (=> b!144188 (= e!93977 (not call!16045))))

(declare-fun b!144189 () Bool)

(assert (=> b!144189 (= e!93985 call!16048)))

(declare-fun b!144190 () Bool)

(declare-fun e!93973 () ListLongMap!1751)

(declare-fun call!16049 () ListLongMap!1751)

(assert (=> b!144190 (= e!93973 (+!181 call!16049 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 newMap!16))))))

(declare-fun d!45961 () Bool)

(assert (=> d!45961 e!93978))

(declare-fun res!68683 () Bool)

(assert (=> d!45961 (=> (not res!68683) (not e!93978))))

(assert (=> d!45961 (= res!68683 (or (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))))

(declare-fun lt!75661 () ListLongMap!1751)

(assert (=> d!45961 (= lt!75651 lt!75661)))

(declare-fun lt!75654 () Unit!4557)

(declare-fun e!93982 () Unit!4557)

(assert (=> d!45961 (= lt!75654 e!93982)))

(declare-fun c!27294 () Bool)

(declare-fun e!93984 () Bool)

(assert (=> d!45961 (= c!27294 e!93984)))

(declare-fun res!68677 () Bool)

(assert (=> d!45961 (=> (not res!68677) (not e!93984))))

(assert (=> d!45961 (= res!68677 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45961 (= lt!75661 e!93973)))

(declare-fun c!27291 () Bool)

(assert (=> d!45961 (= c!27291 (and (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45961 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45961 (= (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) lt!75651)))

(declare-fun b!144191 () Bool)

(assert (=> b!144191 (= e!93977 e!93976)))

(declare-fun res!68685 () Bool)

(assert (=> b!144191 (= res!68685 call!16045)))

(assert (=> b!144191 (=> (not res!68685) (not e!93976))))

(declare-fun b!144192 () Bool)

(assert (=> b!144192 (= e!93978 e!93975)))

(declare-fun c!27293 () Bool)

(assert (=> b!144192 (= c!27293 (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144193 () Bool)

(assert (=> b!144193 (= e!93984 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!27295 () Bool)

(declare-fun call!16044 () ListLongMap!1751)

(declare-fun call!16047 () ListLongMap!1751)

(declare-fun bm!16041 () Bool)

(declare-fun call!16046 () ListLongMap!1751)

(assert (=> bm!16041 (= call!16049 (+!181 (ite c!27291 call!16044 (ite c!27295 call!16046 call!16047)) (ite (or c!27291 c!27295) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 newMap!16)) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 newMap!16)))))))

(declare-fun b!144194 () Bool)

(assert (=> b!144194 (= e!93975 (not call!16043))))

(declare-fun bm!16042 () Bool)

(assert (=> bm!16042 (= call!16044 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144195 () Bool)

(declare-fun res!68682 () Bool)

(assert (=> b!144195 (=> (not res!68682) (not e!93978))))

(declare-fun e!93974 () Bool)

(assert (=> b!144195 (= res!68682 e!93974)))

(declare-fun res!68680 () Bool)

(assert (=> b!144195 (=> res!68680 e!93974)))

(declare-fun e!93979 () Bool)

(assert (=> b!144195 (= res!68680 (not e!93979))))

(declare-fun res!68678 () Bool)

(assert (=> b!144195 (=> (not res!68678) (not e!93979))))

(assert (=> b!144195 (= res!68678 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144196 () Bool)

(declare-fun Unit!4566 () Unit!4557)

(assert (=> b!144196 (= e!93982 Unit!4566)))

(declare-fun b!144197 () Bool)

(assert (=> b!144197 (= e!93973 e!93983)))

(assert (=> b!144197 (= c!27295 (and (not (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2725 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144198 () Bool)

(assert (=> b!144198 (= e!93974 e!93980)))

(declare-fun res!68681 () Bool)

(assert (=> b!144198 (=> (not res!68681) (not e!93980))))

(assert (=> b!144198 (= res!68681 (contains!930 lt!75651 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun bm!16043 () Bool)

(assert (=> bm!16043 (= call!16046 call!16044)))

(declare-fun bm!16044 () Bool)

(assert (=> bm!16044 (= call!16048 call!16049)))

(declare-fun b!144199 () Bool)

(assert (=> b!144199 (= e!93979 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144200 () Bool)

(assert (=> b!144200 (= e!93985 call!16047)))

(declare-fun b!144201 () Bool)

(declare-fun lt!75643 () Unit!4557)

(assert (=> b!144201 (= e!93982 lt!75643)))

(declare-fun lt!75644 () ListLongMap!1751)

(assert (=> b!144201 (= lt!75644 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75659 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75640 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75640 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75658 () Unit!4557)

(assert (=> b!144201 (= lt!75658 (addStillContains!98 lt!75644 lt!75659 (zeroValue!2823 newMap!16) lt!75640))))

(assert (=> b!144201 (contains!930 (+!181 lt!75644 (tuple2!2711 lt!75659 (zeroValue!2823 newMap!16))) lt!75640)))

(declare-fun lt!75650 () Unit!4557)

(assert (=> b!144201 (= lt!75650 lt!75658)))

(declare-fun lt!75655 () ListLongMap!1751)

(assert (=> b!144201 (= lt!75655 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75656 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75657 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75657 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75648 () Unit!4557)

(assert (=> b!144201 (= lt!75648 (addApplyDifferent!98 lt!75655 lt!75656 (minValue!2823 newMap!16) lt!75657))))

(assert (=> b!144201 (= (apply!122 (+!181 lt!75655 (tuple2!2711 lt!75656 (minValue!2823 newMap!16))) lt!75657) (apply!122 lt!75655 lt!75657))))

(declare-fun lt!75646 () Unit!4557)

(assert (=> b!144201 (= lt!75646 lt!75648)))

(declare-fun lt!75652 () ListLongMap!1751)

(assert (=> b!144201 (= lt!75652 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75641 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75649 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75649 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75653 () Unit!4557)

(assert (=> b!144201 (= lt!75653 (addApplyDifferent!98 lt!75652 lt!75641 (zeroValue!2823 newMap!16) lt!75649))))

(assert (=> b!144201 (= (apply!122 (+!181 lt!75652 (tuple2!2711 lt!75641 (zeroValue!2823 newMap!16))) lt!75649) (apply!122 lt!75652 lt!75649))))

(declare-fun lt!75660 () Unit!4557)

(assert (=> b!144201 (= lt!75660 lt!75653)))

(declare-fun lt!75647 () ListLongMap!1751)

(assert (=> b!144201 (= lt!75647 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75645 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75645 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75642 () (_ BitVec 64))

(assert (=> b!144201 (= lt!75642 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144201 (= lt!75643 (addApplyDifferent!98 lt!75647 lt!75645 (minValue!2823 newMap!16) lt!75642))))

(assert (=> b!144201 (= (apply!122 (+!181 lt!75647 (tuple2!2711 lt!75645 (minValue!2823 newMap!16))) lt!75642) (apply!122 lt!75647 lt!75642))))

(declare-fun bm!16045 () Bool)

(assert (=> bm!16045 (= call!16047 call!16046)))

(declare-fun bm!16046 () Bool)

(assert (=> bm!16046 (= call!16045 (contains!930 lt!75651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45961 c!27291) b!144190))

(assert (= (and d!45961 (not c!27291)) b!144197))

(assert (= (and b!144197 c!27295) b!144186))

(assert (= (and b!144197 (not c!27295)) b!144183))

(assert (= (and b!144183 c!27292) b!144189))

(assert (= (and b!144183 (not c!27292)) b!144200))

(assert (= (or b!144189 b!144200) bm!16045))

(assert (= (or b!144186 bm!16045) bm!16043))

(assert (= (or b!144186 b!144189) bm!16044))

(assert (= (or b!144190 bm!16043) bm!16042))

(assert (= (or b!144190 bm!16044) bm!16041))

(assert (= (and d!45961 res!68677) b!144193))

(assert (= (and d!45961 c!27294) b!144201))

(assert (= (and d!45961 (not c!27294)) b!144196))

(assert (= (and d!45961 res!68683) b!144195))

(assert (= (and b!144195 res!68678) b!144199))

(assert (= (and b!144195 (not res!68680)) b!144198))

(assert (= (and b!144198 res!68681) b!144182))

(assert (= (and b!144195 res!68682) b!144187))

(assert (= (and b!144187 c!27290) b!144191))

(assert (= (and b!144187 (not c!27290)) b!144188))

(assert (= (and b!144191 res!68685) b!144184))

(assert (= (or b!144191 b!144188) bm!16046))

(assert (= (and b!144187 res!68679) b!144192))

(assert (= (and b!144192 c!27293) b!144185))

(assert (= (and b!144192 (not c!27293)) b!144194))

(assert (= (and b!144185 res!68684) b!144181))

(assert (= (or b!144185 b!144194) bm!16040))

(declare-fun b_lambda!6467 () Bool)

(assert (=> (not b_lambda!6467) (not b!144182)))

(declare-fun t!6390 () Bool)

(declare-fun tb!2597 () Bool)

(assert (=> (and b!143836 (= (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2976 newMap!16)) t!6390) tb!2597))

(declare-fun result!4251 () Bool)

(assert (=> tb!2597 (= result!4251 tp_is_empty!2943)))

(assert (=> b!144182 t!6390))

(declare-fun b_and!8987 () Bool)

(assert (= b_and!8983 (and (=> t!6390 result!4251) b_and!8987)))

(declare-fun t!6392 () Bool)

(declare-fun tb!2599 () Bool)

(assert (=> (and b!143822 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 newMap!16)) t!6392) tb!2599))

(declare-fun result!4253 () Bool)

(assert (= result!4253 result!4251))

(assert (=> b!144182 t!6392))

(declare-fun b_and!8989 () Bool)

(assert (= b_and!8985 (and (=> t!6392 result!4253) b_and!8989)))

(declare-fun m!173871 () Bool)

(assert (=> bm!16040 m!173871))

(declare-fun m!173873 () Bool)

(assert (=> b!144193 m!173873))

(assert (=> b!144193 m!173873))

(declare-fun m!173875 () Bool)

(assert (=> b!144193 m!173875))

(assert (=> b!144198 m!173873))

(assert (=> b!144198 m!173873))

(declare-fun m!173877 () Bool)

(assert (=> b!144198 m!173877))

(declare-fun m!173879 () Bool)

(assert (=> b!144182 m!173879))

(declare-fun m!173881 () Bool)

(assert (=> b!144182 m!173881))

(declare-fun m!173883 () Bool)

(assert (=> b!144182 m!173883))

(assert (=> b!144182 m!173881))

(assert (=> b!144182 m!173873))

(assert (=> b!144182 m!173879))

(assert (=> b!144182 m!173873))

(declare-fun m!173885 () Bool)

(assert (=> b!144182 m!173885))

(assert (=> b!144199 m!173873))

(assert (=> b!144199 m!173873))

(assert (=> b!144199 m!173875))

(declare-fun m!173887 () Bool)

(assert (=> b!144181 m!173887))

(declare-fun m!173889 () Bool)

(assert (=> b!144190 m!173889))

(declare-fun m!173891 () Bool)

(assert (=> bm!16042 m!173891))

(declare-fun m!173893 () Bool)

(assert (=> b!144184 m!173893))

(assert (=> d!45961 m!173847))

(declare-fun m!173895 () Bool)

(assert (=> b!144201 m!173895))

(declare-fun m!173897 () Bool)

(assert (=> b!144201 m!173897))

(declare-fun m!173899 () Bool)

(assert (=> b!144201 m!173899))

(declare-fun m!173901 () Bool)

(assert (=> b!144201 m!173901))

(declare-fun m!173903 () Bool)

(assert (=> b!144201 m!173903))

(declare-fun m!173905 () Bool)

(assert (=> b!144201 m!173905))

(declare-fun m!173907 () Bool)

(assert (=> b!144201 m!173907))

(assert (=> b!144201 m!173905))

(declare-fun m!173909 () Bool)

(assert (=> b!144201 m!173909))

(assert (=> b!144201 m!173897))

(declare-fun m!173911 () Bool)

(assert (=> b!144201 m!173911))

(assert (=> b!144201 m!173901))

(declare-fun m!173913 () Bool)

(assert (=> b!144201 m!173913))

(declare-fun m!173915 () Bool)

(assert (=> b!144201 m!173915))

(assert (=> b!144201 m!173873))

(declare-fun m!173917 () Bool)

(assert (=> b!144201 m!173917))

(declare-fun m!173919 () Bool)

(assert (=> b!144201 m!173919))

(declare-fun m!173921 () Bool)

(assert (=> b!144201 m!173921))

(assert (=> b!144201 m!173891))

(assert (=> b!144201 m!173911))

(declare-fun m!173923 () Bool)

(assert (=> b!144201 m!173923))

(declare-fun m!173925 () Bool)

(assert (=> bm!16046 m!173925))

(declare-fun m!173927 () Bool)

(assert (=> bm!16041 m!173927))

(assert (=> d!45917 d!45961))

(declare-fun d!45963 () Bool)

(declare-fun res!68690 () Bool)

(declare-fun e!93990 () Bool)

(assert (=> d!45963 (=> res!68690 e!93990)))

(assert (=> d!45963 (= res!68690 (and ((_ is Cons!1749) (toList!891 lt!75428)) (= (_1!1366 (h!2357 (toList!891 lt!75428))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!45963 (= (containsKey!182 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) e!93990)))

(declare-fun b!144206 () Bool)

(declare-fun e!93991 () Bool)

(assert (=> b!144206 (= e!93990 e!93991)))

(declare-fun res!68691 () Bool)

(assert (=> b!144206 (=> (not res!68691) (not e!93991))))

(assert (=> b!144206 (= res!68691 (and (or (not ((_ is Cons!1749) (toList!891 lt!75428))) (bvsle (_1!1366 (h!2357 (toList!891 lt!75428))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))) ((_ is Cons!1749) (toList!891 lt!75428)) (bvslt (_1!1366 (h!2357 (toList!891 lt!75428))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(declare-fun b!144207 () Bool)

(assert (=> b!144207 (= e!93991 (containsKey!182 (t!6382 (toList!891 lt!75428)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!45963 (not res!68690)) b!144206))

(assert (= (and b!144206 res!68691) b!144207))

(assert (=> b!144207 m!173583))

(declare-fun m!173929 () Bool)

(assert (=> b!144207 m!173929))

(assert (=> d!45935 d!45963))

(assert (=> b!144128 d!45961))

(declare-fun d!45965 () Bool)

(declare-fun lt!75662 () Bool)

(assert (=> d!45965 (= lt!75662 (select (content!140 Nil!1749) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!93993 () Bool)

(assert (=> d!45965 (= lt!75662 e!93993)))

(declare-fun res!68693 () Bool)

(assert (=> d!45965 (=> (not res!68693) (not e!93993))))

(assert (=> d!45965 (= res!68693 ((_ is Cons!1748) Nil!1749))))

(assert (=> d!45965 (= (contains!931 Nil!1749 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75662)))

(declare-fun b!144208 () Bool)

(declare-fun e!93992 () Bool)

(assert (=> b!144208 (= e!93993 e!93992)))

(declare-fun res!68692 () Bool)

(assert (=> b!144208 (=> res!68692 e!93992)))

(assert (=> b!144208 (= res!68692 (= (h!2356 Nil!1749) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144209 () Bool)

(assert (=> b!144209 (= e!93992 (contains!931 (t!6381 Nil!1749) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!45965 res!68693) b!144208))

(assert (= (and b!144208 (not res!68692)) b!144209))

(declare-fun m!173931 () Bool)

(assert (=> d!45965 m!173931))

(assert (=> d!45965 m!173583))

(declare-fun m!173933 () Bool)

(assert (=> d!45965 m!173933))

(assert (=> b!144209 m!173583))

(declare-fun m!173935 () Bool)

(assert (=> b!144209 m!173935))

(assert (=> b!143988 d!45965))

(declare-fun d!45967 () Bool)

(declare-fun e!93994 () Bool)

(assert (=> d!45967 e!93994))

(declare-fun res!68695 () Bool)

(assert (=> d!45967 (=> (not res!68695) (not e!93994))))

(declare-fun lt!75663 () ListLongMap!1751)

(assert (=> d!45967 (= res!68695 (contains!930 lt!75663 (_1!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun lt!75664 () List!1753)

(assert (=> d!45967 (= lt!75663 (ListLongMap!1752 lt!75664))))

(declare-fun lt!75666 () Unit!4557)

(declare-fun lt!75665 () Unit!4557)

(assert (=> d!45967 (= lt!75666 lt!75665)))

(assert (=> d!45967 (= (getValueByKey!178 lt!75664 (_1!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))) (Some!183 (_2!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!45967 (= lt!75665 (lemmaContainsTupThenGetReturnValue!92 lt!75664 (_1!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (_2!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!45967 (= lt!75664 (insertStrictlySorted!95 (toList!891 (ite c!27230 call!15962 (ite c!27234 call!15964 call!15965))) (_1!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (_2!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!45967 (= (+!181 (ite c!27230 call!15962 (ite c!27234 call!15964 call!15965)) (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75663)))

(declare-fun b!144210 () Bool)

(declare-fun res!68694 () Bool)

(assert (=> b!144210 (=> (not res!68694) (not e!93994))))

(assert (=> b!144210 (= res!68694 (= (getValueByKey!178 (toList!891 lt!75663) (_1!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))) (Some!183 (_2!1366 (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))))

(declare-fun b!144211 () Bool)

(assert (=> b!144211 (= e!93994 (contains!934 (toList!891 lt!75663) (ite (or c!27230 c!27234) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (= (and d!45967 res!68695) b!144210))

(assert (= (and b!144210 res!68694) b!144211))

(declare-fun m!173937 () Bool)

(assert (=> d!45967 m!173937))

(declare-fun m!173939 () Bool)

(assert (=> d!45967 m!173939))

(declare-fun m!173941 () Bool)

(assert (=> d!45967 m!173941))

(declare-fun m!173943 () Bool)

(assert (=> d!45967 m!173943))

(declare-fun m!173945 () Bool)

(assert (=> b!144210 m!173945))

(declare-fun m!173947 () Bool)

(assert (=> b!144211 m!173947))

(assert (=> bm!15959 d!45967))

(declare-fun d!45969 () Bool)

(declare-fun res!68696 () Bool)

(declare-fun e!93995 () Bool)

(assert (=> d!45969 (=> res!68696 e!93995)))

(assert (=> d!45969 (= res!68696 ((_ is Nil!1749) (t!6381 lt!75425)))))

(assert (=> d!45969 (= (noDuplicate!52 (t!6381 lt!75425)) e!93995)))

(declare-fun b!144212 () Bool)

(declare-fun e!93996 () Bool)

(assert (=> b!144212 (= e!93995 e!93996)))

(declare-fun res!68697 () Bool)

(assert (=> b!144212 (=> (not res!68697) (not e!93996))))

(assert (=> b!144212 (= res!68697 (not (contains!931 (t!6381 (t!6381 lt!75425)) (h!2356 (t!6381 lt!75425)))))))

(declare-fun b!144213 () Bool)

(assert (=> b!144213 (= e!93996 (noDuplicate!52 (t!6381 (t!6381 lt!75425))))))

(assert (= (and d!45969 (not res!68696)) b!144212))

(assert (= (and b!144212 res!68697) b!144213))

(declare-fun m!173949 () Bool)

(assert (=> b!144212 m!173949))

(declare-fun m!173951 () Bool)

(assert (=> b!144213 m!173951))

(assert (=> b!143976 d!45969))

(declare-fun d!45971 () Bool)

(declare-fun e!93998 () Bool)

(assert (=> d!45971 e!93998))

(declare-fun res!68698 () Bool)

(assert (=> d!45971 (=> res!68698 e!93998)))

(declare-fun lt!75669 () Bool)

(assert (=> d!45971 (= res!68698 (not lt!75669))))

(declare-fun lt!75668 () Bool)

(assert (=> d!45971 (= lt!75669 lt!75668)))

(declare-fun lt!75667 () Unit!4557)

(declare-fun e!93997 () Unit!4557)

(assert (=> d!45971 (= lt!75667 e!93997)))

(declare-fun c!27296 () Bool)

(assert (=> d!45971 (= c!27296 lt!75668)))

(assert (=> d!45971 (= lt!75668 (containsKey!182 (toList!891 lt!75504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45971 (= (contains!930 lt!75504 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75669)))

(declare-fun b!144214 () Bool)

(declare-fun lt!75670 () Unit!4557)

(assert (=> b!144214 (= e!93997 lt!75670)))

(assert (=> b!144214 (= lt!75670 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 lt!75504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144214 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144215 () Bool)

(declare-fun Unit!4567 () Unit!4557)

(assert (=> b!144215 (= e!93997 Unit!4567)))

(declare-fun b!144216 () Bool)

(assert (=> b!144216 (= e!93998 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45971 c!27296) b!144214))

(assert (= (and d!45971 (not c!27296)) b!144215))

(assert (= (and d!45971 (not res!68698)) b!144216))

(declare-fun m!173953 () Bool)

(assert (=> d!45971 m!173953))

(declare-fun m!173955 () Bool)

(assert (=> b!144214 m!173955))

(declare-fun m!173957 () Bool)

(assert (=> b!144214 m!173957))

(assert (=> b!144214 m!173957))

(declare-fun m!173959 () Bool)

(assert (=> b!144214 m!173959))

(assert (=> b!144216 m!173957))

(assert (=> b!144216 m!173957))

(assert (=> b!144216 m!173959))

(assert (=> bm!15964 d!45971))

(declare-fun d!45973 () Bool)

(assert (=> d!45973 (= (+!181 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) lt!75595 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75673 () Unit!4557)

(declare-fun choose!882 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 V!3571 Int) Unit!4557)

(assert (=> d!45973 (= lt!75673 (choose!882 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75595 (zeroValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2823 newMap!16) (defaultEntry!2976 newMap!16)))))

(assert (=> d!45973 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45973 (= (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75595 (zeroValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2823 newMap!16) (defaultEntry!2976 newMap!16)) lt!75673)))

(declare-fun bs!6086 () Bool)

(assert (= bs!6086 d!45973))

(assert (=> bs!6086 m!173615))

(declare-fun m!173961 () Bool)

(assert (=> bs!6086 m!173961))

(assert (=> bs!6086 m!173847))

(assert (=> bs!6086 m!173671))

(declare-fun m!173963 () Bool)

(assert (=> bs!6086 m!173963))

(assert (=> bs!6086 m!173615))

(declare-fun m!173965 () Bool)

(assert (=> bs!6086 m!173965))

(assert (=> bs!6086 m!173671))

(assert (=> b!144123 d!45973))

(declare-fun d!45975 () Bool)

(assert (=> d!45975 (= (+!181 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) lt!75605 (zeroValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75676 () Unit!4557)

(declare-fun choose!883 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 V!3571 Int) Unit!4557)

(assert (=> d!45975 (= lt!75676 (choose!883 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75605 (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)))))

(assert (=> d!45975 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45975 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) lt!75605 (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)) lt!75676)))

(declare-fun bs!6087 () Bool)

(assert (= bs!6087 d!45975))

(assert (=> bs!6087 m!173615))

(declare-fun m!173967 () Bool)

(assert (=> bs!6087 m!173967))

(assert (=> bs!6087 m!173671))

(declare-fun m!173969 () Bool)

(assert (=> bs!6087 m!173969))

(assert (=> bs!6087 m!173847))

(assert (=> bs!6087 m!173615))

(declare-fun m!173971 () Bool)

(assert (=> bs!6087 m!173971))

(assert (=> bs!6087 m!173671))

(assert (=> b!144107 d!45975))

(declare-fun bm!16049 () Bool)

(declare-fun call!16052 () (_ BitVec 32))

(assert (=> bm!16049 (= call!16052 (arrayCountValidKeys!0 (_keys!4741 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144225 () Bool)

(declare-fun e!94004 () (_ BitVec 32))

(declare-fun e!94003 () (_ BitVec 32))

(assert (=> b!144225 (= e!94004 e!94003)))

(declare-fun c!27302 () Bool)

(assert (=> b!144225 (= c!27302 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!45977 () Bool)

(declare-fun lt!75679 () (_ BitVec 32))

(assert (=> d!45977 (and (bvsge lt!75679 #b00000000000000000000000000000000) (bvsle lt!75679 (bvsub (size!2601 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!45977 (= lt!75679 e!94004)))

(declare-fun c!27301 () Bool)

(assert (=> d!45977 (= c!27301 (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45977 (and (bvsle #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2601 (_keys!4741 newMap!16)) (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45977 (= (arrayCountValidKeys!0 (_keys!4741 newMap!16) #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) lt!75679)))

(declare-fun b!144226 () Bool)

(assert (=> b!144226 (= e!94003 (bvadd #b00000000000000000000000000000001 call!16052))))

(declare-fun b!144227 () Bool)

(assert (=> b!144227 (= e!94003 call!16052)))

(declare-fun b!144228 () Bool)

(assert (=> b!144228 (= e!94004 #b00000000000000000000000000000000)))

(assert (= (and d!45977 c!27301) b!144228))

(assert (= (and d!45977 (not c!27301)) b!144225))

(assert (= (and b!144225 c!27302) b!144226))

(assert (= (and b!144225 (not c!27302)) b!144227))

(assert (= (or b!144226 b!144227) bm!16049))

(declare-fun m!173973 () Bool)

(assert (=> bm!16049 m!173973))

(assert (=> b!144225 m!173873))

(assert (=> b!144225 m!173873))

(assert (=> b!144225 m!173875))

(assert (=> b!144153 d!45977))

(declare-fun b!144229 () Bool)

(declare-fun e!94008 () Bool)

(declare-fun e!94007 () Bool)

(assert (=> b!144229 (= e!94008 e!94007)))

(declare-fun c!27303 () Bool)

(assert (=> b!144229 (= c!27303 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144230 () Bool)

(declare-fun e!94006 () Bool)

(assert (=> b!144230 (= e!94006 (contains!931 Nil!1749 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16050 () Bool)

(declare-fun call!16053 () Bool)

(assert (=> bm!16050 (= call!16053 (arrayNoDuplicates!0 (_keys!4741 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27303 (Cons!1748 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000) Nil!1749) Nil!1749)))))

(declare-fun d!45979 () Bool)

(declare-fun res!68701 () Bool)

(declare-fun e!94005 () Bool)

(assert (=> d!45979 (=> res!68701 e!94005)))

(assert (=> d!45979 (= res!68701 (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45979 (= (arrayNoDuplicates!0 (_keys!4741 newMap!16) #b00000000000000000000000000000000 Nil!1749) e!94005)))

(declare-fun b!144231 () Bool)

(assert (=> b!144231 (= e!94007 call!16053)))

(declare-fun b!144232 () Bool)

(assert (=> b!144232 (= e!94005 e!94008)))

(declare-fun res!68699 () Bool)

(assert (=> b!144232 (=> (not res!68699) (not e!94008))))

(assert (=> b!144232 (= res!68699 (not e!94006))))

(declare-fun res!68700 () Bool)

(assert (=> b!144232 (=> (not res!68700) (not e!94006))))

(assert (=> b!144232 (= res!68700 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144233 () Bool)

(assert (=> b!144233 (= e!94007 call!16053)))

(assert (= (and d!45979 (not res!68701)) b!144232))

(assert (= (and b!144232 res!68700) b!144230))

(assert (= (and b!144232 res!68699) b!144229))

(assert (= (and b!144229 c!27303) b!144233))

(assert (= (and b!144229 (not c!27303)) b!144231))

(assert (= (or b!144233 b!144231) bm!16050))

(assert (=> b!144229 m!173873))

(assert (=> b!144229 m!173873))

(assert (=> b!144229 m!173875))

(assert (=> b!144230 m!173873))

(assert (=> b!144230 m!173873))

(declare-fun m!173975 () Bool)

(assert (=> b!144230 m!173975))

(assert (=> bm!16050 m!173873))

(declare-fun m!173977 () Bool)

(assert (=> bm!16050 m!173977))

(assert (=> b!144232 m!173873))

(assert (=> b!144232 m!173873))

(assert (=> b!144232 m!173875))

(assert (=> b!144155 d!45979))

(declare-fun b!144247 () Bool)

(declare-fun e!94017 () SeekEntryResult!281)

(declare-fun lt!75687 () SeekEntryResult!281)

(assert (=> b!144247 (= e!94017 (Found!281 (index!3291 lt!75687)))))

(declare-fun b!144248 () Bool)

(declare-fun c!27312 () Bool)

(declare-fun lt!75686 () (_ BitVec 64))

(assert (=> b!144248 (= c!27312 (= lt!75686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94016 () SeekEntryResult!281)

(assert (=> b!144248 (= e!94017 e!94016)))

(declare-fun b!144249 () Bool)

(assert (=> b!144249 (= e!94016 (MissingZero!281 (index!3291 lt!75687)))))

(declare-fun d!45981 () Bool)

(declare-fun lt!75688 () SeekEntryResult!281)

(assert (=> d!45981 (and (or ((_ is Undefined!281) lt!75688) (not ((_ is Found!281) lt!75688)) (and (bvsge (index!3290 lt!75688) #b00000000000000000000000000000000) (bvslt (index!3290 lt!75688) (size!2601 (_keys!4741 newMap!16))))) (or ((_ is Undefined!281) lt!75688) ((_ is Found!281) lt!75688) (not ((_ is MissingZero!281) lt!75688)) (and (bvsge (index!3289 lt!75688) #b00000000000000000000000000000000) (bvslt (index!3289 lt!75688) (size!2601 (_keys!4741 newMap!16))))) (or ((_ is Undefined!281) lt!75688) ((_ is Found!281) lt!75688) ((_ is MissingZero!281) lt!75688) (not ((_ is MissingVacant!281) lt!75688)) (and (bvsge (index!3292 lt!75688) #b00000000000000000000000000000000) (bvslt (index!3292 lt!75688) (size!2601 (_keys!4741 newMap!16))))) (or ((_ is Undefined!281) lt!75688) (ite ((_ is Found!281) lt!75688) (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75688)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (ite ((_ is MissingZero!281) lt!75688) (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3289 lt!75688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!281) lt!75688) (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3292 lt!75688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!94015 () SeekEntryResult!281)

(assert (=> d!45981 (= lt!75688 e!94015)))

(declare-fun c!27311 () Bool)

(assert (=> d!45981 (= c!27311 (and ((_ is Intermediate!281) lt!75687) (undefined!1093 lt!75687)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4925 (_ BitVec 32)) SeekEntryResult!281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!45981 (= lt!75687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (mask!7334 newMap!16)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(assert (=> d!45981 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45981 (= (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)) lt!75688)))

(declare-fun b!144246 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4925 (_ BitVec 32)) SeekEntryResult!281)

(assert (=> b!144246 (= e!94016 (seekKeyOrZeroReturnVacant!0 (x!16424 lt!75687) (index!3291 lt!75687) (index!3291 lt!75687) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun b!144250 () Bool)

(assert (=> b!144250 (= e!94015 Undefined!281)))

(declare-fun b!144251 () Bool)

(assert (=> b!144251 (= e!94015 e!94017)))

(assert (=> b!144251 (= lt!75686 (select (arr!2327 (_keys!4741 newMap!16)) (index!3291 lt!75687)))))

(declare-fun c!27310 () Bool)

(assert (=> b!144251 (= c!27310 (= lt!75686 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!45981 c!27311) b!144250))

(assert (= (and d!45981 (not c!27311)) b!144251))

(assert (= (and b!144251 c!27310) b!144247))

(assert (= (and b!144251 (not c!27310)) b!144248))

(assert (= (and b!144248 c!27312) b!144249))

(assert (= (and b!144248 (not c!27312)) b!144246))

(assert (=> d!45981 m!173583))

(declare-fun m!173979 () Bool)

(assert (=> d!45981 m!173979))

(assert (=> d!45981 m!173847))

(declare-fun m!173981 () Bool)

(assert (=> d!45981 m!173981))

(assert (=> d!45981 m!173979))

(assert (=> d!45981 m!173583))

(declare-fun m!173983 () Bool)

(assert (=> d!45981 m!173983))

(declare-fun m!173985 () Bool)

(assert (=> d!45981 m!173985))

(declare-fun m!173987 () Bool)

(assert (=> d!45981 m!173987))

(assert (=> b!144246 m!173583))

(declare-fun m!173989 () Bool)

(assert (=> b!144246 m!173989))

(declare-fun m!173991 () Bool)

(assert (=> b!144251 m!173991))

(assert (=> b!144137 d!45981))

(declare-fun d!45983 () Bool)

(declare-fun e!94019 () Bool)

(assert (=> d!45983 e!94019))

(declare-fun res!68702 () Bool)

(assert (=> d!45983 (=> res!68702 e!94019)))

(declare-fun lt!75691 () Bool)

(assert (=> d!45983 (= res!68702 (not lt!75691))))

(declare-fun lt!75690 () Bool)

(assert (=> d!45983 (= lt!75691 lt!75690)))

(declare-fun lt!75689 () Unit!4557)

(declare-fun e!94018 () Unit!4557)

(assert (=> d!45983 (= lt!75689 e!94018)))

(declare-fun c!27313 () Bool)

(assert (=> d!45983 (= c!27313 lt!75690)))

(assert (=> d!45983 (= lt!75690 (containsKey!182 (toList!891 e!93939) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45983 (= (contains!930 e!93939 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75691)))

(declare-fun b!144252 () Bool)

(declare-fun lt!75692 () Unit!4557)

(assert (=> b!144252 (= e!94018 lt!75692)))

(assert (=> b!144252 (= lt!75692 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 e!93939) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144252 (isDefined!131 (getValueByKey!178 (toList!891 e!93939) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144253 () Bool)

(declare-fun Unit!4568 () Unit!4557)

(assert (=> b!144253 (= e!94018 Unit!4568)))

(declare-fun b!144254 () Bool)

(assert (=> b!144254 (= e!94019 (isDefined!131 (getValueByKey!178 (toList!891 e!93939) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!45983 c!27313) b!144252))

(assert (= (and d!45983 (not c!27313)) b!144253))

(assert (= (and d!45983 (not res!68702)) b!144254))

(assert (=> d!45983 m!173583))

(declare-fun m!173993 () Bool)

(assert (=> d!45983 m!173993))

(assert (=> b!144252 m!173583))

(declare-fun m!173995 () Bool)

(assert (=> b!144252 m!173995))

(assert (=> b!144252 m!173583))

(declare-fun m!173997 () Bool)

(assert (=> b!144252 m!173997))

(assert (=> b!144252 m!173997))

(declare-fun m!173999 () Bool)

(assert (=> b!144252 m!173999))

(assert (=> b!144254 m!173583))

(assert (=> b!144254 m!173997))

(assert (=> b!144254 m!173997))

(assert (=> b!144254 m!173999))

(assert (=> bm!16035 d!45983))

(declare-fun d!45985 () Bool)

(declare-fun get!1545 (Option!184) V!3571)

(assert (=> d!45985 (= (apply!122 lt!75504 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1545 (getValueByKey!178 (toList!891 lt!75504) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6088 () Bool)

(assert (= bs!6088 d!45985))

(assert (=> bs!6088 m!173675))

(declare-fun m!174001 () Bool)

(assert (=> bs!6088 m!174001))

(assert (=> bs!6088 m!174001))

(declare-fun m!174003 () Bool)

(assert (=> bs!6088 m!174003))

(assert (=> b!143945 d!45985))

(declare-fun d!45987 () Bool)

(declare-fun c!27314 () Bool)

(assert (=> d!45987 (= c!27314 ((_ is ValueCellFull!1128) (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94020 () V!3571)

(assert (=> d!45987 (= (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94020)))

(declare-fun b!144255 () Bool)

(assert (=> b!144255 (= e!94020 (get!1543 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144256 () Bool)

(assert (=> b!144256 (= e!94020 (get!1544 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45987 c!27314) b!144255))

(assert (= (and d!45987 (not c!27314)) b!144256))

(assert (=> b!144255 m!173681))

(assert (=> b!144255 m!173613))

(declare-fun m!174005 () Bool)

(assert (=> b!144255 m!174005))

(assert (=> b!144256 m!173681))

(assert (=> b!144256 m!173613))

(declare-fun m!174007 () Bool)

(assert (=> b!144256 m!174007))

(assert (=> b!143945 d!45987))

(declare-fun d!45989 () Bool)

(assert (=> d!45989 (= (inRange!0 (ite c!27273 (ite c!27285 (index!3290 lt!75594) (ite c!27283 (index!3289 lt!75611) (index!3292 lt!75611))) (ite c!27276 (index!3290 lt!75610) (ite c!27275 (index!3289 lt!75608) (index!3292 lt!75608)))) (mask!7334 newMap!16)) (and (bvsge (ite c!27273 (ite c!27285 (index!3290 lt!75594) (ite c!27283 (index!3289 lt!75611) (index!3292 lt!75611))) (ite c!27276 (index!3290 lt!75610) (ite c!27275 (index!3289 lt!75608) (index!3292 lt!75608)))) #b00000000000000000000000000000000) (bvslt (ite c!27273 (ite c!27285 (index!3290 lt!75594) (ite c!27283 (index!3289 lt!75611) (index!3292 lt!75611))) (ite c!27276 (index!3290 lt!75610) (ite c!27275 (index!3289 lt!75608) (index!3292 lt!75608)))) (bvadd (mask!7334 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16023 d!45989))

(declare-fun d!45991 () Bool)

(declare-fun e!94023 () Bool)

(assert (=> d!45991 e!94023))

(declare-fun c!27317 () Bool)

(assert (=> d!45991 (= c!27317 (and (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!45991 true))

(declare-fun _$29!171 () Unit!4557)

(assert (=> d!45991 (= (choose!879 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) _$29!171)))

(declare-fun b!144261 () Bool)

(assert (=> b!144261 (= e!94023 (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144262 () Bool)

(assert (=> b!144262 (= e!94023 (ite (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45991 c!27317) b!144261))

(assert (= (and d!45991 (not c!27317)) b!144262))

(assert (=> b!144261 m!173583))

(assert (=> b!144261 m!173595))

(assert (=> d!45933 d!45991))

(declare-fun d!45993 () Bool)

(assert (=> d!45993 (= (validMask!0 (mask!7334 (v!3308 (underlying!485 thiss!992)))) (and (or (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000001111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000011111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000001111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000011111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000001111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000011111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000001111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000011111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000000111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000001111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000011111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000000111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000001111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000011111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000000111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000001111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000011111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000000111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000001111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000011111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00000111111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00001111111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00011111111111111111111111111111) (= (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7334 (v!3308 (underlying!485 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45933 d!45993))

(declare-fun d!45995 () Bool)

(declare-fun e!94025 () Bool)

(assert (=> d!45995 e!94025))

(declare-fun res!68703 () Bool)

(assert (=> d!45995 (=> res!68703 e!94025)))

(declare-fun lt!75695 () Bool)

(assert (=> d!45995 (= res!68703 (not lt!75695))))

(declare-fun lt!75694 () Bool)

(assert (=> d!45995 (= lt!75695 lt!75694)))

(declare-fun lt!75693 () Unit!4557)

(declare-fun e!94024 () Unit!4557)

(assert (=> d!45995 (= lt!75693 e!94024)))

(declare-fun c!27318 () Bool)

(assert (=> d!45995 (= c!27318 lt!75694)))

(assert (=> d!45995 (= lt!75694 (containsKey!182 (toList!891 lt!75504) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45995 (= (contains!930 lt!75504 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75695)))

(declare-fun b!144263 () Bool)

(declare-fun lt!75696 () Unit!4557)

(assert (=> b!144263 (= e!94024 lt!75696)))

(assert (=> b!144263 (= lt!75696 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 lt!75504) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144263 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144264 () Bool)

(declare-fun Unit!4569 () Unit!4557)

(assert (=> b!144264 (= e!94024 Unit!4569)))

(declare-fun b!144265 () Bool)

(assert (=> b!144265 (= e!94025 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45995 c!27318) b!144263))

(assert (= (and d!45995 (not c!27318)) b!144264))

(assert (= (and d!45995 (not res!68703)) b!144265))

(declare-fun m!174009 () Bool)

(assert (=> d!45995 m!174009))

(declare-fun m!174011 () Bool)

(assert (=> b!144263 m!174011))

(declare-fun m!174013 () Bool)

(assert (=> b!144263 m!174013))

(assert (=> b!144263 m!174013))

(declare-fun m!174015 () Bool)

(assert (=> b!144263 m!174015))

(assert (=> b!144265 m!174013))

(assert (=> b!144265 m!174013))

(assert (=> b!144265 m!174015))

(assert (=> bm!15958 d!45995))

(declare-fun b!144266 () Bool)

(declare-fun e!94034 () Bool)

(declare-fun lt!75708 () ListLongMap!1751)

(assert (=> b!144266 (= e!94034 (= (apply!122 lt!75708 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2823 newMap!16)))))

(declare-fun b!144267 () Bool)

(declare-fun e!94033 () Bool)

(assert (=> b!144267 (= e!94033 (= (apply!122 lt!75708 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)) (get!1541 (select (arr!2328 (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601)) #b00000000000000000000000000000000) (dynLambda!445 (defaultEntry!2976 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2602 (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601))))))

(assert (=> b!144267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144268 () Bool)

(declare-fun c!27321 () Bool)

(assert (=> b!144268 (= c!27321 (and (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94036 () ListLongMap!1751)

(declare-fun e!94038 () ListLongMap!1751)

(assert (=> b!144268 (= e!94036 e!94038)))

(declare-fun bm!16051 () Bool)

(declare-fun call!16054 () Bool)

(assert (=> bm!16051 (= call!16054 (contains!930 lt!75708 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144269 () Bool)

(declare-fun e!94029 () Bool)

(assert (=> b!144269 (= e!94029 (= (apply!122 lt!75708 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16))))))

(declare-fun b!144270 () Bool)

(declare-fun e!94028 () Bool)

(assert (=> b!144270 (= e!94028 e!94034)))

(declare-fun res!68711 () Bool)

(assert (=> b!144270 (= res!68711 call!16054)))

(assert (=> b!144270 (=> (not res!68711) (not e!94034))))

(declare-fun b!144271 () Bool)

(declare-fun call!16059 () ListLongMap!1751)

(assert (=> b!144271 (= e!94036 call!16059)))

(declare-fun b!144272 () Bool)

(declare-fun res!68706 () Bool)

(declare-fun e!94031 () Bool)

(assert (=> b!144272 (=> (not res!68706) (not e!94031))))

(declare-fun e!94030 () Bool)

(assert (=> b!144272 (= res!68706 e!94030)))

(declare-fun c!27319 () Bool)

(assert (=> b!144272 (= c!27319 (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144273 () Bool)

(declare-fun call!16056 () Bool)

(assert (=> b!144273 (= e!94030 (not call!16056))))

(declare-fun b!144274 () Bool)

(assert (=> b!144274 (= e!94038 call!16059)))

(declare-fun b!144275 () Bool)

(declare-fun e!94026 () ListLongMap!1751)

(declare-fun call!16060 () ListLongMap!1751)

(assert (=> b!144275 (= e!94026 (+!181 call!16060 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 newMap!16))))))

(declare-fun d!45997 () Bool)

(assert (=> d!45997 e!94031))

(declare-fun res!68710 () Bool)

(assert (=> d!45997 (=> (not res!68710) (not e!94031))))

(assert (=> d!45997 (= res!68710 (or (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))))

(declare-fun lt!75718 () ListLongMap!1751)

(assert (=> d!45997 (= lt!75708 lt!75718)))

(declare-fun lt!75711 () Unit!4557)

(declare-fun e!94035 () Unit!4557)

(assert (=> d!45997 (= lt!75711 e!94035)))

(declare-fun c!27323 () Bool)

(declare-fun e!94037 () Bool)

(assert (=> d!45997 (= c!27323 e!94037)))

(declare-fun res!68704 () Bool)

(assert (=> d!45997 (=> (not res!68704) (not e!94037))))

(assert (=> d!45997 (= res!68704 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45997 (= lt!75718 e!94026)))

(declare-fun c!27320 () Bool)

(assert (=> d!45997 (= c!27320 (and (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45997 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45997 (= (getCurrentListMap!563 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) lt!75708)))

(declare-fun b!144276 () Bool)

(assert (=> b!144276 (= e!94030 e!94029)))

(declare-fun res!68712 () Bool)

(assert (=> b!144276 (= res!68712 call!16056)))

(assert (=> b!144276 (=> (not res!68712) (not e!94029))))

(declare-fun b!144277 () Bool)

(assert (=> b!144277 (= e!94031 e!94028)))

(declare-fun c!27322 () Bool)

(assert (=> b!144277 (= c!27322 (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144278 () Bool)

(assert (=> b!144278 (= e!94037 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun call!16055 () ListLongMap!1751)

(declare-fun c!27324 () Bool)

(declare-fun bm!16052 () Bool)

(declare-fun call!16058 () ListLongMap!1751)

(declare-fun call!16057 () ListLongMap!1751)

(assert (=> bm!16052 (= call!16060 (+!181 (ite c!27320 call!16055 (ite c!27324 call!16057 call!16058)) (ite (or c!27320 c!27324) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2823 newMap!16)))))))

(declare-fun b!144279 () Bool)

(assert (=> b!144279 (= e!94028 (not call!16054))))

(declare-fun bm!16053 () Bool)

(assert (=> bm!16053 (= call!16055 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144280 () Bool)

(declare-fun res!68709 () Bool)

(assert (=> b!144280 (=> (not res!68709) (not e!94031))))

(declare-fun e!94027 () Bool)

(assert (=> b!144280 (= res!68709 e!94027)))

(declare-fun res!68707 () Bool)

(assert (=> b!144280 (=> res!68707 e!94027)))

(declare-fun e!94032 () Bool)

(assert (=> b!144280 (= res!68707 (not e!94032))))

(declare-fun res!68705 () Bool)

(assert (=> b!144280 (=> (not res!68705) (not e!94032))))

(assert (=> b!144280 (= res!68705 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144281 () Bool)

(declare-fun Unit!4570 () Unit!4557)

(assert (=> b!144281 (= e!94035 Unit!4570)))

(declare-fun b!144282 () Bool)

(assert (=> b!144282 (= e!94026 e!94036)))

(assert (=> b!144282 (= c!27324 (and (not (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144283 () Bool)

(assert (=> b!144283 (= e!94027 e!94033)))

(declare-fun res!68708 () Bool)

(assert (=> b!144283 (=> (not res!68708) (not e!94033))))

(assert (=> b!144283 (= res!68708 (contains!930 lt!75708 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun bm!16054 () Bool)

(assert (=> bm!16054 (= call!16057 call!16055)))

(declare-fun bm!16055 () Bool)

(assert (=> bm!16055 (= call!16059 call!16060)))

(declare-fun b!144284 () Bool)

(assert (=> b!144284 (= e!94032 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144285 () Bool)

(assert (=> b!144285 (= e!94038 call!16058)))

(declare-fun b!144286 () Bool)

(declare-fun lt!75700 () Unit!4557)

(assert (=> b!144286 (= e!94035 lt!75700)))

(declare-fun lt!75701 () ListLongMap!1751)

(assert (=> b!144286 (= lt!75701 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75716 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75697 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75697 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75715 () Unit!4557)

(assert (=> b!144286 (= lt!75715 (addStillContains!98 lt!75701 lt!75716 (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) lt!75697))))

(assert (=> b!144286 (contains!930 (+!181 lt!75701 (tuple2!2711 lt!75716 (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)))) lt!75697)))

(declare-fun lt!75707 () Unit!4557)

(assert (=> b!144286 (= lt!75707 lt!75715)))

(declare-fun lt!75712 () ListLongMap!1751)

(assert (=> b!144286 (= lt!75712 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75713 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75714 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75714 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75705 () Unit!4557)

(assert (=> b!144286 (= lt!75705 (addApplyDifferent!98 lt!75712 lt!75713 (minValue!2823 newMap!16) lt!75714))))

(assert (=> b!144286 (= (apply!122 (+!181 lt!75712 (tuple2!2711 lt!75713 (minValue!2823 newMap!16))) lt!75714) (apply!122 lt!75712 lt!75714))))

(declare-fun lt!75703 () Unit!4557)

(assert (=> b!144286 (= lt!75703 lt!75705)))

(declare-fun lt!75709 () ListLongMap!1751)

(assert (=> b!144286 (= lt!75709 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75698 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75698 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75706 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75706 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75710 () Unit!4557)

(assert (=> b!144286 (= lt!75710 (addApplyDifferent!98 lt!75709 lt!75698 (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) lt!75706))))

(assert (=> b!144286 (= (apply!122 (+!181 lt!75709 (tuple2!2711 lt!75698 (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)))) lt!75706) (apply!122 lt!75709 lt!75706))))

(declare-fun lt!75717 () Unit!4557)

(assert (=> b!144286 (= lt!75717 lt!75710)))

(declare-fun lt!75704 () ListLongMap!1751)

(assert (=> b!144286 (= lt!75704 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite (or c!27272 c!27273) (_values!2959 newMap!16) lt!75601) (mask!7334 newMap!16) (ite (and c!27272 c!27279) lt!75595 (extraKeys!2725 newMap!16)) (ite (and c!27272 c!27279) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2823 newMap!16)) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75702 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75702 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75699 () (_ BitVec 64))

(assert (=> b!144286 (= lt!75699 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144286 (= lt!75700 (addApplyDifferent!98 lt!75704 lt!75702 (minValue!2823 newMap!16) lt!75699))))

(assert (=> b!144286 (= (apply!122 (+!181 lt!75704 (tuple2!2711 lt!75702 (minValue!2823 newMap!16))) lt!75699) (apply!122 lt!75704 lt!75699))))

(declare-fun bm!16056 () Bool)

(assert (=> bm!16056 (= call!16058 call!16057)))

(declare-fun bm!16057 () Bool)

(assert (=> bm!16057 (= call!16056 (contains!930 lt!75708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45997 c!27320) b!144275))

(assert (= (and d!45997 (not c!27320)) b!144282))

(assert (= (and b!144282 c!27324) b!144271))

(assert (= (and b!144282 (not c!27324)) b!144268))

(assert (= (and b!144268 c!27321) b!144274))

(assert (= (and b!144268 (not c!27321)) b!144285))

(assert (= (or b!144274 b!144285) bm!16056))

(assert (= (or b!144271 bm!16056) bm!16054))

(assert (= (or b!144271 b!144274) bm!16055))

(assert (= (or b!144275 bm!16054) bm!16053))

(assert (= (or b!144275 bm!16055) bm!16052))

(assert (= (and d!45997 res!68704) b!144278))

(assert (= (and d!45997 c!27323) b!144286))

(assert (= (and d!45997 (not c!27323)) b!144281))

(assert (= (and d!45997 res!68710) b!144280))

(assert (= (and b!144280 res!68705) b!144284))

(assert (= (and b!144280 (not res!68707)) b!144283))

(assert (= (and b!144283 res!68708) b!144267))

(assert (= (and b!144280 res!68709) b!144272))

(assert (= (and b!144272 c!27319) b!144276))

(assert (= (and b!144272 (not c!27319)) b!144273))

(assert (= (and b!144276 res!68712) b!144269))

(assert (= (or b!144276 b!144273) bm!16057))

(assert (= (and b!144272 res!68706) b!144277))

(assert (= (and b!144277 c!27322) b!144270))

(assert (= (and b!144277 (not c!27322)) b!144279))

(assert (= (and b!144270 res!68711) b!144266))

(assert (= (or b!144270 b!144279) bm!16051))

(declare-fun b_lambda!6469 () Bool)

(assert (=> (not b_lambda!6469) (not b!144267)))

(assert (=> b!144267 t!6390))

(declare-fun b_and!8991 () Bool)

(assert (= b_and!8987 (and (=> t!6390 result!4251) b_and!8991)))

(assert (=> b!144267 t!6392))

(declare-fun b_and!8993 () Bool)

(assert (= b_and!8989 (and (=> t!6392 result!4253) b_and!8993)))

(declare-fun m!174017 () Bool)

(assert (=> bm!16051 m!174017))

(assert (=> b!144278 m!173873))

(assert (=> b!144278 m!173873))

(assert (=> b!144278 m!173875))

(assert (=> b!144283 m!173873))

(assert (=> b!144283 m!173873))

(declare-fun m!174019 () Bool)

(assert (=> b!144283 m!174019))

(declare-fun m!174021 () Bool)

(assert (=> b!144267 m!174021))

(assert (=> b!144267 m!173881))

(declare-fun m!174023 () Bool)

(assert (=> b!144267 m!174023))

(assert (=> b!144267 m!173881))

(assert (=> b!144267 m!173873))

(assert (=> b!144267 m!174021))

(assert (=> b!144267 m!173873))

(declare-fun m!174025 () Bool)

(assert (=> b!144267 m!174025))

(assert (=> b!144284 m!173873))

(assert (=> b!144284 m!173873))

(assert (=> b!144284 m!173875))

(declare-fun m!174027 () Bool)

(assert (=> b!144266 m!174027))

(declare-fun m!174029 () Bool)

(assert (=> b!144275 m!174029))

(declare-fun m!174031 () Bool)

(assert (=> bm!16053 m!174031))

(declare-fun m!174033 () Bool)

(assert (=> b!144269 m!174033))

(assert (=> d!45997 m!173847))

(declare-fun m!174035 () Bool)

(assert (=> b!144286 m!174035))

(declare-fun m!174037 () Bool)

(assert (=> b!144286 m!174037))

(declare-fun m!174039 () Bool)

(assert (=> b!144286 m!174039))

(declare-fun m!174041 () Bool)

(assert (=> b!144286 m!174041))

(declare-fun m!174043 () Bool)

(assert (=> b!144286 m!174043))

(declare-fun m!174045 () Bool)

(assert (=> b!144286 m!174045))

(declare-fun m!174047 () Bool)

(assert (=> b!144286 m!174047))

(assert (=> b!144286 m!174045))

(declare-fun m!174049 () Bool)

(assert (=> b!144286 m!174049))

(assert (=> b!144286 m!174037))

(declare-fun m!174051 () Bool)

(assert (=> b!144286 m!174051))

(assert (=> b!144286 m!174041))

(declare-fun m!174053 () Bool)

(assert (=> b!144286 m!174053))

(declare-fun m!174055 () Bool)

(assert (=> b!144286 m!174055))

(assert (=> b!144286 m!173873))

(declare-fun m!174057 () Bool)

(assert (=> b!144286 m!174057))

(declare-fun m!174059 () Bool)

(assert (=> b!144286 m!174059))

(declare-fun m!174061 () Bool)

(assert (=> b!144286 m!174061))

(assert (=> b!144286 m!174031))

(assert (=> b!144286 m!174051))

(declare-fun m!174063 () Bool)

(assert (=> b!144286 m!174063))

(declare-fun m!174065 () Bool)

(assert (=> bm!16057 m!174065))

(declare-fun m!174067 () Bool)

(assert (=> bm!16052 m!174067))

(assert (=> bm!16028 d!45997))

(declare-fun lt!75730 () ListLongMap!1751)

(declare-fun b!144287 () Bool)

(declare-fun e!94047 () Bool)

(assert (=> b!144287 (= e!94047 (= (apply!122 lt!75730 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16))))))

(declare-fun b!144288 () Bool)

(declare-fun e!94046 () Bool)

(assert (=> b!144288 (= e!94046 (= (apply!122 lt!75730 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)) (get!1541 (select (arr!2328 (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!445 (defaultEntry!2976 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2602 (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))))))))

(assert (=> b!144288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun c!27327 () Bool)

(declare-fun b!144289 () Bool)

(assert (=> b!144289 (= c!27327 (and (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94049 () ListLongMap!1751)

(declare-fun e!94051 () ListLongMap!1751)

(assert (=> b!144289 (= e!94049 e!94051)))

(declare-fun bm!16058 () Bool)

(declare-fun call!16061 () Bool)

(assert (=> bm!16058 (= call!16061 (contains!930 lt!75730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144290 () Bool)

(declare-fun e!94042 () Bool)

(assert (=> b!144290 (= e!94042 (= (apply!122 lt!75730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2823 newMap!16)))))

(declare-fun b!144291 () Bool)

(declare-fun e!94041 () Bool)

(assert (=> b!144291 (= e!94041 e!94047)))

(declare-fun res!68720 () Bool)

(assert (=> b!144291 (= res!68720 call!16061)))

(assert (=> b!144291 (=> (not res!68720) (not e!94047))))

(declare-fun b!144292 () Bool)

(declare-fun call!16066 () ListLongMap!1751)

(assert (=> b!144292 (= e!94049 call!16066)))

(declare-fun b!144293 () Bool)

(declare-fun res!68715 () Bool)

(declare-fun e!94044 () Bool)

(assert (=> b!144293 (=> (not res!68715) (not e!94044))))

(declare-fun e!94043 () Bool)

(assert (=> b!144293 (= res!68715 e!94043)))

(declare-fun c!27325 () Bool)

(assert (=> b!144293 (= c!27325 (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144294 () Bool)

(declare-fun call!16063 () Bool)

(assert (=> b!144294 (= e!94043 (not call!16063))))

(declare-fun b!144295 () Bool)

(assert (=> b!144295 (= e!94051 call!16066)))

(declare-fun call!16067 () ListLongMap!1751)

(declare-fun b!144296 () Bool)

(declare-fun e!94039 () ListLongMap!1751)

(assert (=> b!144296 (= e!94039 (+!181 call!16067 (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)))))))

(declare-fun d!45999 () Bool)

(assert (=> d!45999 e!94044))

(declare-fun res!68719 () Bool)

(assert (=> d!45999 (=> (not res!68719) (not e!94044))))

(assert (=> d!45999 (= res!68719 (or (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))))

(declare-fun lt!75740 () ListLongMap!1751)

(assert (=> d!45999 (= lt!75730 lt!75740)))

(declare-fun lt!75733 () Unit!4557)

(declare-fun e!94048 () Unit!4557)

(assert (=> d!45999 (= lt!75733 e!94048)))

(declare-fun c!27329 () Bool)

(declare-fun e!94050 () Bool)

(assert (=> d!45999 (= c!27329 e!94050)))

(declare-fun res!68713 () Bool)

(assert (=> d!45999 (=> (not res!68713) (not e!94050))))

(assert (=> d!45999 (= res!68713 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!45999 (= lt!75740 e!94039)))

(declare-fun c!27326 () Bool)

(assert (=> d!45999 (= c!27326 (and (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45999 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!45999 (= (getCurrentListMap!563 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) lt!75730)))

(declare-fun b!144297 () Bool)

(assert (=> b!144297 (= e!94043 e!94042)))

(declare-fun res!68721 () Bool)

(assert (=> b!144297 (= res!68721 call!16063)))

(assert (=> b!144297 (=> (not res!68721) (not e!94042))))

(declare-fun b!144298 () Bool)

(assert (=> b!144298 (= e!94044 e!94041)))

(declare-fun c!27328 () Bool)

(assert (=> b!144298 (= c!27328 (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144299 () Bool)

(assert (=> b!144299 (= e!94050 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun call!16062 () ListLongMap!1751)

(declare-fun bm!16059 () Bool)

(declare-fun call!16065 () ListLongMap!1751)

(declare-fun c!27330 () Bool)

(declare-fun call!16064 () ListLongMap!1751)

(assert (=> bm!16059 (= call!16067 (+!181 (ite c!27326 call!16062 (ite c!27330 call!16064 call!16065)) (ite (or c!27326 c!27330) (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2823 newMap!16)) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16))))))))

(declare-fun b!144300 () Bool)

(assert (=> b!144300 (= e!94041 (not call!16061))))

(declare-fun bm!16060 () Bool)

(assert (=> bm!16060 (= call!16062 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun b!144301 () Bool)

(declare-fun res!68718 () Bool)

(assert (=> b!144301 (=> (not res!68718) (not e!94044))))

(declare-fun e!94040 () Bool)

(assert (=> b!144301 (= res!68718 e!94040)))

(declare-fun res!68716 () Bool)

(assert (=> b!144301 (=> res!68716 e!94040)))

(declare-fun e!94045 () Bool)

(assert (=> b!144301 (= res!68716 (not e!94045))))

(declare-fun res!68714 () Bool)

(assert (=> b!144301 (=> (not res!68714) (not e!94045))))

(assert (=> b!144301 (= res!68714 (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144302 () Bool)

(declare-fun Unit!4571 () Unit!4557)

(assert (=> b!144302 (= e!94048 Unit!4571)))

(declare-fun b!144303 () Bool)

(assert (=> b!144303 (= e!94039 e!94049)))

(assert (=> b!144303 (= c!27330 (and (not (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144304 () Bool)

(assert (=> b!144304 (= e!94040 e!94046)))

(declare-fun res!68717 () Bool)

(assert (=> b!144304 (=> (not res!68717) (not e!94046))))

(assert (=> b!144304 (= res!68717 (contains!930 lt!75730 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(declare-fun bm!16061 () Bool)

(assert (=> bm!16061 (= call!16064 call!16062)))

(declare-fun bm!16062 () Bool)

(assert (=> bm!16062 (= call!16066 call!16067)))

(declare-fun b!144305 () Bool)

(assert (=> b!144305 (= e!94045 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144306 () Bool)

(assert (=> b!144306 (= e!94051 call!16065)))

(declare-fun b!144307 () Bool)

(declare-fun lt!75722 () Unit!4557)

(assert (=> b!144307 (= e!94048 lt!75722)))

(declare-fun lt!75723 () ListLongMap!1751)

(assert (=> b!144307 (= lt!75723 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75738 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75719 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75719 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75737 () Unit!4557)

(assert (=> b!144307 (= lt!75737 (addStillContains!98 lt!75723 lt!75738 (zeroValue!2823 newMap!16) lt!75719))))

(assert (=> b!144307 (contains!930 (+!181 lt!75723 (tuple2!2711 lt!75738 (zeroValue!2823 newMap!16))) lt!75719)))

(declare-fun lt!75729 () Unit!4557)

(assert (=> b!144307 (= lt!75729 lt!75737)))

(declare-fun lt!75734 () ListLongMap!1751)

(assert (=> b!144307 (= lt!75734 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75735 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75736 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75736 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75727 () Unit!4557)

(assert (=> b!144307 (= lt!75727 (addApplyDifferent!98 lt!75734 lt!75735 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) lt!75736))))

(assert (=> b!144307 (= (apply!122 (+!181 lt!75734 (tuple2!2711 lt!75735 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)))) lt!75736) (apply!122 lt!75734 lt!75736))))

(declare-fun lt!75725 () Unit!4557)

(assert (=> b!144307 (= lt!75725 lt!75727)))

(declare-fun lt!75731 () ListLongMap!1751)

(assert (=> b!144307 (= lt!75731 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75720 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75728 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75728 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75732 () Unit!4557)

(assert (=> b!144307 (= lt!75732 (addApplyDifferent!98 lt!75731 lt!75720 (zeroValue!2823 newMap!16) lt!75728))))

(assert (=> b!144307 (= (apply!122 (+!181 lt!75731 (tuple2!2711 lt!75720 (zeroValue!2823 newMap!16))) lt!75728) (apply!122 lt!75731 lt!75728))))

(declare-fun lt!75739 () Unit!4557)

(assert (=> b!144307 (= lt!75739 lt!75732)))

(declare-fun lt!75726 () ListLongMap!1751)

(assert (=> b!144307 (= lt!75726 (getCurrentListMapNoExtraKeys!147 (_keys!4741 newMap!16) (ite c!27272 (_values!2959 newMap!16) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (index!3290 lt!75604) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16)))) (mask!7334 newMap!16) (ite c!27272 (ite c!27279 (extraKeys!2725 newMap!16) lt!75605) (extraKeys!2725 newMap!16)) (zeroValue!2823 newMap!16) (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75724 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75724 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75721 () (_ BitVec 64))

(assert (=> b!144307 (= lt!75721 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144307 (= lt!75722 (addApplyDifferent!98 lt!75726 lt!75724 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)) lt!75721))))

(assert (=> b!144307 (= (apply!122 (+!181 lt!75726 (tuple2!2711 lt!75724 (ite c!27272 (ite c!27279 (minValue!2823 newMap!16) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2823 newMap!16)))) lt!75721) (apply!122 lt!75726 lt!75721))))

(declare-fun bm!16063 () Bool)

(assert (=> bm!16063 (= call!16065 call!16064)))

(declare-fun bm!16064 () Bool)

(assert (=> bm!16064 (= call!16063 (contains!930 lt!75730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45999 c!27326) b!144296))

(assert (= (and d!45999 (not c!27326)) b!144303))

(assert (= (and b!144303 c!27330) b!144292))

(assert (= (and b!144303 (not c!27330)) b!144289))

(assert (= (and b!144289 c!27327) b!144295))

(assert (= (and b!144289 (not c!27327)) b!144306))

(assert (= (or b!144295 b!144306) bm!16063))

(assert (= (or b!144292 bm!16063) bm!16061))

(assert (= (or b!144292 b!144295) bm!16062))

(assert (= (or b!144296 bm!16061) bm!16060))

(assert (= (or b!144296 bm!16062) bm!16059))

(assert (= (and d!45999 res!68713) b!144299))

(assert (= (and d!45999 c!27329) b!144307))

(assert (= (and d!45999 (not c!27329)) b!144302))

(assert (= (and d!45999 res!68719) b!144301))

(assert (= (and b!144301 res!68714) b!144305))

(assert (= (and b!144301 (not res!68716)) b!144304))

(assert (= (and b!144304 res!68717) b!144288))

(assert (= (and b!144301 res!68718) b!144293))

(assert (= (and b!144293 c!27325) b!144297))

(assert (= (and b!144293 (not c!27325)) b!144294))

(assert (= (and b!144297 res!68721) b!144290))

(assert (= (or b!144297 b!144294) bm!16064))

(assert (= (and b!144293 res!68715) b!144298))

(assert (= (and b!144298 c!27328) b!144291))

(assert (= (and b!144298 (not c!27328)) b!144300))

(assert (= (and b!144291 res!68720) b!144287))

(assert (= (or b!144291 b!144300) bm!16058))

(declare-fun b_lambda!6471 () Bool)

(assert (=> (not b_lambda!6471) (not b!144288)))

(assert (=> b!144288 t!6390))

(declare-fun b_and!8995 () Bool)

(assert (= b_and!8991 (and (=> t!6390 result!4251) b_and!8995)))

(assert (=> b!144288 t!6392))

(declare-fun b_and!8997 () Bool)

(assert (= b_and!8993 (and (=> t!6392 result!4253) b_and!8997)))

(declare-fun m!174069 () Bool)

(assert (=> bm!16058 m!174069))

(assert (=> b!144299 m!173873))

(assert (=> b!144299 m!173873))

(assert (=> b!144299 m!173875))

(assert (=> b!144304 m!173873))

(assert (=> b!144304 m!173873))

(declare-fun m!174071 () Bool)

(assert (=> b!144304 m!174071))

(declare-fun m!174073 () Bool)

(assert (=> b!144288 m!174073))

(assert (=> b!144288 m!173881))

(declare-fun m!174075 () Bool)

(assert (=> b!144288 m!174075))

(assert (=> b!144288 m!173881))

(assert (=> b!144288 m!173873))

(assert (=> b!144288 m!174073))

(assert (=> b!144288 m!173873))

(declare-fun m!174077 () Bool)

(assert (=> b!144288 m!174077))

(assert (=> b!144305 m!173873))

(assert (=> b!144305 m!173873))

(assert (=> b!144305 m!173875))

(declare-fun m!174079 () Bool)

(assert (=> b!144287 m!174079))

(declare-fun m!174081 () Bool)

(assert (=> b!144296 m!174081))

(declare-fun m!174083 () Bool)

(assert (=> bm!16060 m!174083))

(declare-fun m!174085 () Bool)

(assert (=> b!144290 m!174085))

(assert (=> d!45999 m!173847))

(declare-fun m!174087 () Bool)

(assert (=> b!144307 m!174087))

(declare-fun m!174089 () Bool)

(assert (=> b!144307 m!174089))

(declare-fun m!174091 () Bool)

(assert (=> b!144307 m!174091))

(declare-fun m!174093 () Bool)

(assert (=> b!144307 m!174093))

(declare-fun m!174095 () Bool)

(assert (=> b!144307 m!174095))

(declare-fun m!174097 () Bool)

(assert (=> b!144307 m!174097))

(declare-fun m!174099 () Bool)

(assert (=> b!144307 m!174099))

(assert (=> b!144307 m!174097))

(declare-fun m!174101 () Bool)

(assert (=> b!144307 m!174101))

(assert (=> b!144307 m!174089))

(declare-fun m!174103 () Bool)

(assert (=> b!144307 m!174103))

(assert (=> b!144307 m!174093))

(declare-fun m!174105 () Bool)

(assert (=> b!144307 m!174105))

(declare-fun m!174107 () Bool)

(assert (=> b!144307 m!174107))

(assert (=> b!144307 m!173873))

(declare-fun m!174109 () Bool)

(assert (=> b!144307 m!174109))

(declare-fun m!174111 () Bool)

(assert (=> b!144307 m!174111))

(declare-fun m!174113 () Bool)

(assert (=> b!144307 m!174113))

(assert (=> b!144307 m!174083))

(assert (=> b!144307 m!174103))

(declare-fun m!174115 () Bool)

(assert (=> b!144307 m!174115))

(declare-fun m!174117 () Bool)

(assert (=> bm!16064 m!174117))

(declare-fun m!174119 () Bool)

(assert (=> bm!16059 m!174119))

(assert (=> bm!16037 d!45999))

(declare-fun d!46001 () Bool)

(assert (=> d!46001 (isDefined!131 (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!75743 () Unit!4557)

(declare-fun choose!884 (List!1753 (_ BitVec 64)) Unit!4557)

(assert (=> d!46001 (= lt!75743 (choose!884 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94054 () Bool)

(assert (=> d!46001 e!94054))

(declare-fun res!68724 () Bool)

(assert (=> d!46001 (=> (not res!68724) (not e!94054))))

(declare-fun isStrictlySorted!327 (List!1753) Bool)

(assert (=> d!46001 (= res!68724 (isStrictlySorted!327 (toList!891 lt!75428)))))

(assert (=> d!46001 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75743)))

(declare-fun b!144310 () Bool)

(assert (=> b!144310 (= e!94054 (containsKey!182 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46001 res!68724) b!144310))

(assert (=> d!46001 m!173583))

(assert (=> d!46001 m!173759))

(assert (=> d!46001 m!173759))

(assert (=> d!46001 m!173761))

(assert (=> d!46001 m!173583))

(declare-fun m!174121 () Bool)

(assert (=> d!46001 m!174121))

(declare-fun m!174123 () Bool)

(assert (=> d!46001 m!174123))

(assert (=> b!144310 m!173583))

(assert (=> b!144310 m!173755))

(assert (=> b!144010 d!46001))

(declare-fun d!46003 () Bool)

(declare-fun isEmpty!422 (Option!184) Bool)

(assert (=> d!46003 (= (isDefined!131 (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))) (not (isEmpty!422 (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))))

(declare-fun bs!6089 () Bool)

(assert (= bs!6089 d!46003))

(assert (=> bs!6089 m!173759))

(declare-fun m!174125 () Bool)

(assert (=> bs!6089 m!174125))

(assert (=> b!144010 d!46003))

(declare-fun d!46005 () Bool)

(declare-fun c!27335 () Bool)

(assert (=> d!46005 (= c!27335 (and ((_ is Cons!1749) (toList!891 lt!75428)) (= (_1!1366 (h!2357 (toList!891 lt!75428))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(declare-fun e!94059 () Option!184)

(assert (=> d!46005 (= (getValueByKey!178 (toList!891 lt!75428) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) e!94059)))

(declare-fun b!144322 () Bool)

(declare-fun e!94060 () Option!184)

(assert (=> b!144322 (= e!94060 None!182)))

(declare-fun b!144320 () Bool)

(assert (=> b!144320 (= e!94059 e!94060)))

(declare-fun c!27336 () Bool)

(assert (=> b!144320 (= c!27336 (and ((_ is Cons!1749) (toList!891 lt!75428)) (not (= (_1!1366 (h!2357 (toList!891 lt!75428))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))))

(declare-fun b!144321 () Bool)

(assert (=> b!144321 (= e!94060 (getValueByKey!178 (t!6382 (toList!891 lt!75428)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144319 () Bool)

(assert (=> b!144319 (= e!94059 (Some!183 (_2!1366 (h!2357 (toList!891 lt!75428)))))))

(assert (= (and d!46005 c!27335) b!144319))

(assert (= (and d!46005 (not c!27335)) b!144320))

(assert (= (and b!144320 c!27336) b!144321))

(assert (= (and b!144320 (not c!27336)) b!144322))

(assert (=> b!144321 m!173583))

(declare-fun m!174127 () Bool)

(assert (=> b!144321 m!174127))

(assert (=> b!144010 d!46005))

(declare-fun b!144331 () Bool)

(declare-fun res!68733 () Bool)

(declare-fun e!94063 () Bool)

(assert (=> b!144331 (=> (not res!68733) (not e!94063))))

(assert (=> b!144331 (= res!68733 (and (= (size!2602 (_values!2959 newMap!16)) (bvadd (mask!7334 newMap!16) #b00000000000000000000000000000001)) (= (size!2601 (_keys!4741 newMap!16)) (size!2602 (_values!2959 newMap!16))) (bvsge (_size!631 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!631 newMap!16) (bvadd (mask!7334 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!144334 () Bool)

(assert (=> b!144334 (= e!94063 (and (bvsge (extraKeys!2725 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2725 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!631 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!46007 () Bool)

(declare-fun res!68734 () Bool)

(assert (=> d!46007 (=> (not res!68734) (not e!94063))))

(assert (=> d!46007 (= res!68734 (validMask!0 (mask!7334 newMap!16)))))

(assert (=> d!46007 (= (simpleValid!98 newMap!16) e!94063)))

(declare-fun b!144333 () Bool)

(declare-fun res!68735 () Bool)

(assert (=> b!144333 (=> (not res!68735) (not e!94063))))

(declare-fun size!2605 (LongMapFixedSize!1164) (_ BitVec 32))

(assert (=> b!144333 (= res!68735 (= (size!2605 newMap!16) (bvadd (_size!631 newMap!16) (bvsdiv (bvadd (extraKeys!2725 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!144332 () Bool)

(declare-fun res!68736 () Bool)

(assert (=> b!144332 (=> (not res!68736) (not e!94063))))

(assert (=> b!144332 (= res!68736 (bvsge (size!2605 newMap!16) (_size!631 newMap!16)))))

(assert (= (and d!46007 res!68734) b!144331))

(assert (= (and b!144331 res!68733) b!144332))

(assert (= (and b!144332 res!68736) b!144333))

(assert (= (and b!144333 res!68735) b!144334))

(assert (=> d!46007 m!173847))

(declare-fun m!174129 () Bool)

(assert (=> b!144333 m!174129))

(assert (=> b!144332 m!174129))

(assert (=> d!45947 d!46007))

(declare-fun b!144359 () Bool)

(declare-fun lt!75758 () Unit!4557)

(declare-fun lt!75763 () Unit!4557)

(assert (=> b!144359 (= lt!75758 lt!75763)))

(declare-fun lt!75761 () V!3571)

(declare-fun lt!75762 () (_ BitVec 64))

(declare-fun lt!75759 () ListLongMap!1751)

(declare-fun lt!75764 () (_ BitVec 64))

(assert (=> b!144359 (not (contains!930 (+!181 lt!75759 (tuple2!2711 lt!75762 lt!75761)) lt!75764))))

(declare-fun addStillNotContains!66 (ListLongMap!1751 (_ BitVec 64) V!3571 (_ BitVec 64)) Unit!4557)

(assert (=> b!144359 (= lt!75763 (addStillNotContains!66 lt!75759 lt!75762 lt!75761 lt!75764))))

(assert (=> b!144359 (= lt!75764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!144359 (= lt!75761 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144359 (= lt!75762 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!16070 () ListLongMap!1751)

(assert (=> b!144359 (= lt!75759 call!16070)))

(declare-fun e!94081 () ListLongMap!1751)

(assert (=> b!144359 (= e!94081 (+!181 call!16070 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!144360 () Bool)

(declare-fun e!94084 () Bool)

(declare-fun e!94082 () Bool)

(assert (=> b!144360 (= e!94084 e!94082)))

(declare-fun c!27346 () Bool)

(declare-fun e!94083 () Bool)

(assert (=> b!144360 (= c!27346 e!94083)))

(declare-fun res!68746 () Bool)

(assert (=> b!144360 (=> (not res!68746) (not e!94083))))

(assert (=> b!144360 (= res!68746 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144361 () Bool)

(assert (=> b!144361 (= e!94083 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144361 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!144362 () Bool)

(assert (=> b!144362 (= e!94081 call!16070)))

(declare-fun b!144363 () Bool)

(assert (=> b!144363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> b!144363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2602 (_values!2959 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun lt!75760 () ListLongMap!1751)

(declare-fun e!94078 () Bool)

(assert (=> b!144363 (= e!94078 (= (apply!122 lt!75760 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144364 () Bool)

(assert (=> b!144364 (= e!94082 e!94078)))

(assert (=> b!144364 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun res!68747 () Bool)

(assert (=> b!144364 (= res!68747 (contains!930 lt!75760 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144364 (=> (not res!68747) (not e!94078))))

(declare-fun e!94079 () Bool)

(declare-fun b!144365 () Bool)

(assert (=> b!144365 (= e!94079 (= lt!75760 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144366 () Bool)

(declare-fun res!68745 () Bool)

(assert (=> b!144366 (=> (not res!68745) (not e!94084))))

(assert (=> b!144366 (= res!68745 (not (contains!930 lt!75760 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!46009 () Bool)

(assert (=> d!46009 e!94084))

(declare-fun res!68748 () Bool)

(assert (=> d!46009 (=> (not res!68748) (not e!94084))))

(assert (=> d!46009 (= res!68748 (not (contains!930 lt!75760 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!94080 () ListLongMap!1751)

(assert (=> d!46009 (= lt!75760 e!94080)))

(declare-fun c!27348 () Bool)

(assert (=> d!46009 (= c!27348 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!46009 (validMask!0 (mask!7334 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!46009 (= (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))) lt!75760)))

(declare-fun b!144367 () Bool)

(assert (=> b!144367 (= e!94080 e!94081)))

(declare-fun c!27345 () Bool)

(assert (=> b!144367 (= c!27345 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144368 () Bool)

(assert (=> b!144368 (= e!94082 e!94079)))

(declare-fun c!27347 () Bool)

(assert (=> b!144368 (= c!27347 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144369 () Bool)

(declare-fun isEmpty!423 (ListLongMap!1751) Bool)

(assert (=> b!144369 (= e!94079 (isEmpty!423 lt!75760))))

(declare-fun b!144370 () Bool)

(assert (=> b!144370 (= e!94080 (ListLongMap!1752 Nil!1750))))

(declare-fun bm!16067 () Bool)

(assert (=> bm!16067 (= call!16070 (getCurrentListMapNoExtraKeys!147 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (_values!2959 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992))) (extraKeys!2725 (v!3308 (underlying!485 thiss!992))) (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) (minValue!2823 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992)))))))

(assert (= (and d!46009 c!27348) b!144370))

(assert (= (and d!46009 (not c!27348)) b!144367))

(assert (= (and b!144367 c!27345) b!144359))

(assert (= (and b!144367 (not c!27345)) b!144362))

(assert (= (or b!144359 b!144362) bm!16067))

(assert (= (and d!46009 res!68748) b!144366))

(assert (= (and b!144366 res!68745) b!144360))

(assert (= (and b!144360 res!68746) b!144361))

(assert (= (and b!144360 c!27346) b!144364))

(assert (= (and b!144360 (not c!27346)) b!144368))

(assert (= (and b!144364 res!68747) b!144363))

(assert (= (and b!144368 c!27347) b!144365))

(assert (= (and b!144368 (not c!27347)) b!144369))

(declare-fun b_lambda!6473 () Bool)

(assert (=> (not b_lambda!6473) (not b!144359)))

(assert (=> b!144359 t!6378))

(declare-fun b_and!8999 () Bool)

(assert (= b_and!8995 (and (=> t!6378 result!4237) b_and!8999)))

(assert (=> b!144359 t!6380))

(declare-fun b_and!9001 () Bool)

(assert (= b_and!8997 (and (=> t!6380 result!4241) b_and!9001)))

(declare-fun b_lambda!6475 () Bool)

(assert (=> (not b_lambda!6475) (not b!144363)))

(assert (=> b!144363 t!6378))

(declare-fun b_and!9003 () Bool)

(assert (= b_and!8999 (and (=> t!6378 result!4237) b_and!9003)))

(assert (=> b!144363 t!6380))

(declare-fun b_and!9005 () Bool)

(assert (= b_and!9001 (and (=> t!6380 result!4241) b_and!9005)))

(declare-fun m!174131 () Bool)

(assert (=> bm!16067 m!174131))

(declare-fun m!174133 () Bool)

(assert (=> b!144359 m!174133))

(declare-fun m!174135 () Bool)

(assert (=> b!144359 m!174135))

(assert (=> b!144359 m!173681))

(assert (=> b!144359 m!174133))

(declare-fun m!174137 () Bool)

(assert (=> b!144359 m!174137))

(declare-fun m!174139 () Bool)

(assert (=> b!144359 m!174139))

(assert (=> b!144359 m!173675))

(assert (=> b!144359 m!173681))

(assert (=> b!144359 m!173613))

(assert (=> b!144359 m!173683))

(assert (=> b!144359 m!173613))

(declare-fun m!174141 () Bool)

(assert (=> b!144369 m!174141))

(assert (=> b!144361 m!173675))

(assert (=> b!144361 m!173675))

(assert (=> b!144361 m!173677))

(declare-fun m!174143 () Bool)

(assert (=> d!46009 m!174143))

(assert (=> d!46009 m!173695))

(assert (=> b!144367 m!173675))

(assert (=> b!144367 m!173675))

(assert (=> b!144367 m!173677))

(declare-fun m!174145 () Bool)

(assert (=> b!144366 m!174145))

(assert (=> b!144363 m!173681))

(assert (=> b!144363 m!173675))

(assert (=> b!144363 m!173675))

(declare-fun m!174147 () Bool)

(assert (=> b!144363 m!174147))

(assert (=> b!144363 m!173681))

(assert (=> b!144363 m!173613))

(assert (=> b!144363 m!173683))

(assert (=> b!144363 m!173613))

(assert (=> b!144364 m!173675))

(assert (=> b!144364 m!173675))

(declare-fun m!174149 () Bool)

(assert (=> b!144364 m!174149))

(assert (=> b!144365 m!174131))

(assert (=> bm!15960 d!46009))

(declare-fun d!46011 () Bool)

(assert (=> d!46011 (= (get!1544 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144144 d!46011))

(assert (=> d!45919 d!45993))

(declare-fun d!46013 () Bool)

(declare-fun res!68749 () Bool)

(declare-fun e!94085 () Bool)

(assert (=> d!46013 (=> res!68749 e!94085)))

(assert (=> d!46013 (= res!68749 (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46013 (= (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94085)))

(declare-fun b!144371 () Bool)

(declare-fun e!94086 () Bool)

(assert (=> b!144371 (= e!94085 e!94086)))

(declare-fun res!68750 () Bool)

(assert (=> b!144371 (=> (not res!68750) (not e!94086))))

(assert (=> b!144371 (= res!68750 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144372 () Bool)

(assert (=> b!144372 (= e!94086 (arrayContainsKey!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46013 (not res!68749)) b!144371))

(assert (= (and b!144371 res!68750) b!144372))

(declare-fun m!174151 () Bool)

(assert (=> d!46013 m!174151))

(assert (=> b!144372 m!173583))

(declare-fun m!174153 () Bool)

(assert (=> b!144372 m!174153))

(assert (=> b!143997 d!46013))

(declare-fun b!144389 () Bool)

(declare-fun e!94098 () Bool)

(declare-fun call!16076 () Bool)

(assert (=> b!144389 (= e!94098 (not call!16076))))

(declare-fun lt!75770 () SeekEntryResult!281)

(declare-fun call!16075 () Bool)

(declare-fun c!27353 () Bool)

(declare-fun bm!16072 () Bool)

(assert (=> bm!16072 (= call!16075 (inRange!0 (ite c!27353 (index!3289 lt!75770) (index!3292 lt!75770)) (mask!7334 newMap!16)))))

(declare-fun b!144390 () Bool)

(declare-fun e!94095 () Bool)

(declare-fun e!94096 () Bool)

(assert (=> b!144390 (= e!94095 e!94096)))

(declare-fun res!68762 () Bool)

(assert (=> b!144390 (= res!68762 call!16075)))

(assert (=> b!144390 (=> (not res!68762) (not e!94096))))

(declare-fun b!144391 () Bool)

(assert (=> b!144391 (= e!94096 (not call!16076))))

(declare-fun bm!16073 () Bool)

(assert (=> bm!16073 (= call!16076 (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144392 () Bool)

(declare-fun e!94097 () Bool)

(assert (=> b!144392 (= e!94097 ((_ is Undefined!281) lt!75770))))

(declare-fun b!144393 () Bool)

(declare-fun res!68759 () Bool)

(assert (=> b!144393 (=> (not res!68759) (not e!94098))))

(assert (=> b!144393 (= res!68759 call!16075)))

(assert (=> b!144393 (= e!94097 e!94098)))

(declare-fun b!144394 () Bool)

(assert (=> b!144394 (= e!94095 e!94097)))

(declare-fun c!27354 () Bool)

(assert (=> b!144394 (= c!27354 ((_ is MissingVacant!281) lt!75770))))

(declare-fun d!46015 () Bool)

(assert (=> d!46015 e!94095))

(assert (=> d!46015 (= c!27353 ((_ is MissingZero!281) lt!75770))))

(assert (=> d!46015 (= lt!75770 (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun lt!75769 () Unit!4557)

(declare-fun choose!885 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) Int) Unit!4557)

(assert (=> d!46015 (= lt!75769 (choose!885 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(assert (=> d!46015 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!46015 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)) lt!75769)))

(declare-fun b!144395 () Bool)

(assert (=> b!144395 (and (bvsge (index!3289 lt!75770) #b00000000000000000000000000000000) (bvslt (index!3289 lt!75770) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun res!68761 () Bool)

(assert (=> b!144395 (= res!68761 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3289 lt!75770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144395 (=> (not res!68761) (not e!94096))))

(declare-fun b!144396 () Bool)

(declare-fun res!68760 () Bool)

(assert (=> b!144396 (=> (not res!68760) (not e!94098))))

(assert (=> b!144396 (= res!68760 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3292 lt!75770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144396 (and (bvsge (index!3292 lt!75770) #b00000000000000000000000000000000) (bvslt (index!3292 lt!75770) (size!2601 (_keys!4741 newMap!16))))))

(assert (= (and d!46015 c!27353) b!144390))

(assert (= (and d!46015 (not c!27353)) b!144394))

(assert (= (and b!144390 res!68762) b!144395))

(assert (= (and b!144395 res!68761) b!144391))

(assert (= (and b!144394 c!27354) b!144393))

(assert (= (and b!144394 (not c!27354)) b!144392))

(assert (= (and b!144393 res!68759) b!144396))

(assert (= (and b!144396 res!68760) b!144389))

(assert (= (or b!144390 b!144393) bm!16072))

(assert (= (or b!144391 b!144389) bm!16073))

(declare-fun m!174155 () Bool)

(assert (=> b!144396 m!174155))

(declare-fun m!174157 () Bool)

(assert (=> bm!16072 m!174157))

(assert (=> d!46015 m!173583))

(assert (=> d!46015 m!173799))

(assert (=> d!46015 m!173583))

(declare-fun m!174159 () Bool)

(assert (=> d!46015 m!174159))

(assert (=> d!46015 m!173847))

(declare-fun m!174161 () Bool)

(assert (=> b!144395 m!174161))

(assert (=> bm!16073 m!173583))

(assert (=> bm!16073 m!173773))

(assert (=> bm!16021 d!46015))

(declare-fun d!46017 () Bool)

(declare-fun e!94100 () Bool)

(assert (=> d!46017 e!94100))

(declare-fun res!68763 () Bool)

(assert (=> d!46017 (=> res!68763 e!94100)))

(declare-fun lt!75773 () Bool)

(assert (=> d!46017 (= res!68763 (not lt!75773))))

(declare-fun lt!75772 () Bool)

(assert (=> d!46017 (= lt!75773 lt!75772)))

(declare-fun lt!75771 () Unit!4557)

(declare-fun e!94099 () Unit!4557)

(assert (=> d!46017 (= lt!75771 e!94099)))

(declare-fun c!27355 () Bool)

(assert (=> d!46017 (= c!27355 lt!75772)))

(assert (=> d!46017 (= lt!75772 (containsKey!182 (toList!891 lt!75504) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46017 (= (contains!930 lt!75504 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75773)))

(declare-fun b!144397 () Bool)

(declare-fun lt!75774 () Unit!4557)

(assert (=> b!144397 (= e!94099 lt!75774)))

(assert (=> b!144397 (= lt!75774 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 lt!75504) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144397 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144398 () Bool)

(declare-fun Unit!4572 () Unit!4557)

(assert (=> b!144398 (= e!94099 Unit!4572)))

(declare-fun b!144399 () Bool)

(assert (=> b!144399 (= e!94100 (isDefined!131 (getValueByKey!178 (toList!891 lt!75504) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46017 c!27355) b!144397))

(assert (= (and d!46017 (not c!27355)) b!144398))

(assert (= (and d!46017 (not res!68763)) b!144399))

(assert (=> d!46017 m!173675))

(declare-fun m!174163 () Bool)

(assert (=> d!46017 m!174163))

(assert (=> b!144397 m!173675))

(declare-fun m!174165 () Bool)

(assert (=> b!144397 m!174165))

(assert (=> b!144397 m!173675))

(assert (=> b!144397 m!174001))

(assert (=> b!144397 m!174001))

(declare-fun m!174167 () Bool)

(assert (=> b!144397 m!174167))

(assert (=> b!144399 m!173675))

(assert (=> b!144399 m!174001))

(assert (=> b!144399 m!174001))

(assert (=> b!144399 m!174167))

(assert (=> b!143961 d!46017))

(declare-fun d!46019 () Bool)

(declare-fun lt!75775 () Bool)

(assert (=> d!46019 (= lt!75775 (select (content!140 (t!6381 lt!75425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94102 () Bool)

(assert (=> d!46019 (= lt!75775 e!94102)))

(declare-fun res!68765 () Bool)

(assert (=> d!46019 (=> (not res!68765) (not e!94102))))

(assert (=> d!46019 (= res!68765 ((_ is Cons!1748) (t!6381 lt!75425)))))

(assert (=> d!46019 (= (contains!931 (t!6381 lt!75425) #b0000000000000000000000000000000000000000000000000000000000000000) lt!75775)))

(declare-fun b!144400 () Bool)

(declare-fun e!94101 () Bool)

(assert (=> b!144400 (= e!94102 e!94101)))

(declare-fun res!68764 () Bool)

(assert (=> b!144400 (=> res!68764 e!94101)))

(assert (=> b!144400 (= res!68764 (= (h!2356 (t!6381 lt!75425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144401 () Bool)

(assert (=> b!144401 (= e!94101 (contains!931 (t!6381 (t!6381 lt!75425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46019 res!68765) b!144400))

(assert (= (and b!144400 (not res!68764)) b!144401))

(declare-fun m!174169 () Bool)

(assert (=> d!46019 m!174169))

(declare-fun m!174171 () Bool)

(assert (=> d!46019 m!174171))

(declare-fun m!174173 () Bool)

(assert (=> b!144401 m!174173))

(assert (=> b!144146 d!46019))

(declare-fun d!46021 () Bool)

(declare-fun e!94104 () Bool)

(assert (=> d!46021 e!94104))

(declare-fun res!68766 () Bool)

(assert (=> d!46021 (=> res!68766 e!94104)))

(declare-fun lt!75778 () Bool)

(assert (=> d!46021 (= res!68766 (not lt!75778))))

(declare-fun lt!75777 () Bool)

(assert (=> d!46021 (= lt!75778 lt!75777)))

(declare-fun lt!75776 () Unit!4557)

(declare-fun e!94103 () Unit!4557)

(assert (=> d!46021 (= lt!75776 e!94103)))

(declare-fun c!27356 () Bool)

(assert (=> d!46021 (= c!27356 lt!75777)))

(assert (=> d!46021 (= lt!75777 (containsKey!182 (toList!891 call!16036) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46021 (= (contains!930 call!16036 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75778)))

(declare-fun b!144402 () Bool)

(declare-fun lt!75779 () Unit!4557)

(assert (=> b!144402 (= e!94103 lt!75779)))

(assert (=> b!144402 (= lt!75779 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 call!16036) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144402 (isDefined!131 (getValueByKey!178 (toList!891 call!16036) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144403 () Bool)

(declare-fun Unit!4573 () Unit!4557)

(assert (=> b!144403 (= e!94103 Unit!4573)))

(declare-fun b!144404 () Bool)

(assert (=> b!144404 (= e!94104 (isDefined!131 (getValueByKey!178 (toList!891 call!16036) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!46021 c!27356) b!144402))

(assert (= (and d!46021 (not c!27356)) b!144403))

(assert (= (and d!46021 (not res!68766)) b!144404))

(assert (=> d!46021 m!173583))

(declare-fun m!174175 () Bool)

(assert (=> d!46021 m!174175))

(assert (=> b!144402 m!173583))

(declare-fun m!174177 () Bool)

(assert (=> b!144402 m!174177))

(assert (=> b!144402 m!173583))

(declare-fun m!174179 () Bool)

(assert (=> b!144402 m!174179))

(assert (=> b!144402 m!174179))

(declare-fun m!174181 () Bool)

(assert (=> b!144402 m!174181))

(assert (=> b!144404 m!173583))

(assert (=> b!144404 m!174179))

(assert (=> b!144404 m!174179))

(assert (=> b!144404 m!174181))

(assert (=> b!144118 d!46021))

(declare-fun d!46023 () Bool)

(declare-fun e!94107 () Bool)

(assert (=> d!46023 e!94107))

(declare-fun res!68772 () Bool)

(assert (=> d!46023 (=> (not res!68772) (not e!94107))))

(declare-fun lt!75784 () SeekEntryResult!281)

(assert (=> d!46023 (= res!68772 ((_ is Found!281) lt!75784))))

(assert (=> d!46023 (= lt!75784 (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun lt!75785 () Unit!4557)

(declare-fun choose!886 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) Int) Unit!4557)

(assert (=> d!46023 (= lt!75785 (choose!886 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(assert (=> d!46023 (validMask!0 (mask!7334 newMap!16))))

(assert (=> d!46023 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)) lt!75785)))

(declare-fun b!144409 () Bool)

(declare-fun res!68771 () Bool)

(assert (=> b!144409 (=> (not res!68771) (not e!94107))))

(assert (=> b!144409 (= res!68771 (inRange!0 (index!3290 lt!75784) (mask!7334 newMap!16)))))

(declare-fun b!144410 () Bool)

(assert (=> b!144410 (= e!94107 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75784)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144410 (and (bvsge (index!3290 lt!75784) #b00000000000000000000000000000000) (bvslt (index!3290 lt!75784) (size!2601 (_keys!4741 newMap!16))))))

(assert (= (and d!46023 res!68772) b!144409))

(assert (= (and b!144409 res!68771) b!144410))

(assert (=> d!46023 m!173583))

(assert (=> d!46023 m!173799))

(assert (=> d!46023 m!173583))

(declare-fun m!174183 () Bool)

(assert (=> d!46023 m!174183))

(assert (=> d!46023 m!173847))

(declare-fun m!174185 () Bool)

(assert (=> b!144409 m!174185))

(declare-fun m!174187 () Bool)

(assert (=> b!144410 m!174187))

(assert (=> bm!16017 d!46023))

(declare-fun d!46025 () Bool)

(declare-fun lt!75786 () Bool)

(assert (=> d!46025 (= lt!75786 (select (content!140 (t!6381 lt!75425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94109 () Bool)

(assert (=> d!46025 (= lt!75786 e!94109)))

(declare-fun res!68774 () Bool)

(assert (=> d!46025 (=> (not res!68774) (not e!94109))))

(assert (=> d!46025 (= res!68774 ((_ is Cons!1748) (t!6381 lt!75425)))))

(assert (=> d!46025 (= (contains!931 (t!6381 lt!75425) #b1000000000000000000000000000000000000000000000000000000000000000) lt!75786)))

(declare-fun b!144411 () Bool)

(declare-fun e!94108 () Bool)

(assert (=> b!144411 (= e!94109 e!94108)))

(declare-fun res!68773 () Bool)

(assert (=> b!144411 (=> res!68773 e!94108)))

(assert (=> b!144411 (= res!68773 (= (h!2356 (t!6381 lt!75425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144412 () Bool)

(assert (=> b!144412 (= e!94108 (contains!931 (t!6381 (t!6381 lt!75425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46025 res!68774) b!144411))

(assert (= (and b!144411 (not res!68773)) b!144412))

(assert (=> d!46025 m!174169))

(declare-fun m!174189 () Bool)

(assert (=> d!46025 m!174189))

(declare-fun m!174191 () Bool)

(assert (=> b!144412 m!174191))

(assert (=> b!143970 d!46025))

(declare-fun d!46027 () Bool)

(assert (=> d!46027 (= (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143956 d!46027))

(declare-fun d!46029 () Bool)

(declare-fun c!27359 () Bool)

(assert (=> d!46029 (= c!27359 ((_ is Nil!1749) lt!75425))))

(declare-fun e!94112 () (InoxSet (_ BitVec 64)))

(assert (=> d!46029 (= (content!140 lt!75425) e!94112)))

(declare-fun b!144417 () Bool)

(assert (=> b!144417 (= e!94112 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!144418 () Bool)

(assert (=> b!144418 (= e!94112 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2356 lt!75425) true) (content!140 (t!6381 lt!75425))))))

(assert (= (and d!46029 c!27359) b!144417))

(assert (= (and d!46029 (not c!27359)) b!144418))

(declare-fun m!174193 () Bool)

(assert (=> b!144418 m!174193))

(assert (=> b!144418 m!174169))

(assert (=> d!45945 d!46029))

(declare-fun d!46031 () Bool)

(declare-fun e!94113 () Bool)

(assert (=> d!46031 e!94113))

(declare-fun res!68776 () Bool)

(assert (=> d!46031 (=> (not res!68776) (not e!94113))))

(declare-fun lt!75787 () ListLongMap!1751)

(assert (=> d!46031 (= res!68776 (contains!930 lt!75787 (_1!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75788 () List!1753)

(assert (=> d!46031 (= lt!75787 (ListLongMap!1752 lt!75788))))

(declare-fun lt!75790 () Unit!4557)

(declare-fun lt!75789 () Unit!4557)

(assert (=> d!46031 (= lt!75790 lt!75789)))

(assert (=> d!46031 (= (getValueByKey!178 lt!75788 (_1!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!183 (_2!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46031 (= lt!75789 (lemmaContainsTupThenGetReturnValue!92 lt!75788 (_1!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46031 (= lt!75788 (insertStrictlySorted!95 (toList!891 e!93942) (_1!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46031 (= (+!181 e!93942 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75787)))

(declare-fun b!144419 () Bool)

(declare-fun res!68775 () Bool)

(assert (=> b!144419 (=> (not res!68775) (not e!94113))))

(assert (=> b!144419 (= res!68775 (= (getValueByKey!178 (toList!891 lt!75787) (_1!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!183 (_2!1366 (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!144420 () Bool)

(assert (=> b!144420 (= e!94113 (contains!934 (toList!891 lt!75787) (ite c!27272 (ite c!27279 (tuple2!2711 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2711 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46031 res!68776) b!144419))

(assert (= (and b!144419 res!68775) b!144420))

(declare-fun m!174195 () Bool)

(assert (=> d!46031 m!174195))

(declare-fun m!174197 () Bool)

(assert (=> d!46031 m!174197))

(declare-fun m!174199 () Bool)

(assert (=> d!46031 m!174199))

(declare-fun m!174201 () Bool)

(assert (=> d!46031 m!174201))

(declare-fun m!174203 () Bool)

(assert (=> b!144419 m!174203))

(declare-fun m!174205 () Bool)

(assert (=> b!144420 m!174205))

(assert (=> bm!16025 d!46031))

(declare-fun d!46033 () Bool)

(assert (=> d!46033 (= (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (and (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143987 d!46033))

(assert (=> d!45929 d!45927))

(declare-fun d!46035 () Bool)

(assert (=> d!46035 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1749)))

(assert (=> d!46035 true))

(declare-fun _$71!171 () Unit!4557)

(assert (=> d!46035 (= (choose!39 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!171)))

(declare-fun bs!6090 () Bool)

(assert (= bs!6090 d!46035))

(assert (=> bs!6090 m!173591))

(assert (=> d!45929 d!46035))

(declare-fun d!46037 () Bool)

(declare-fun lt!75791 () Bool)

(assert (=> d!46037 (= lt!75791 (select (content!140 (t!6381 lt!75425)) (h!2356 lt!75425)))))

(declare-fun e!94115 () Bool)

(assert (=> d!46037 (= lt!75791 e!94115)))

(declare-fun res!68778 () Bool)

(assert (=> d!46037 (=> (not res!68778) (not e!94115))))

(assert (=> d!46037 (= res!68778 ((_ is Cons!1748) (t!6381 lt!75425)))))

(assert (=> d!46037 (= (contains!931 (t!6381 lt!75425) (h!2356 lt!75425)) lt!75791)))

(declare-fun b!144421 () Bool)

(declare-fun e!94114 () Bool)

(assert (=> b!144421 (= e!94115 e!94114)))

(declare-fun res!68777 () Bool)

(assert (=> b!144421 (=> res!68777 e!94114)))

(assert (=> b!144421 (= res!68777 (= (h!2356 (t!6381 lt!75425)) (h!2356 lt!75425)))))

(declare-fun b!144422 () Bool)

(assert (=> b!144422 (= e!94114 (contains!931 (t!6381 (t!6381 lt!75425)) (h!2356 lt!75425)))))

(assert (= (and d!46037 res!68778) b!144421))

(assert (= (and b!144421 (not res!68777)) b!144422))

(assert (=> d!46037 m!174169))

(declare-fun m!174207 () Bool)

(assert (=> d!46037 m!174207))

(declare-fun m!174209 () Bool)

(assert (=> b!144422 m!174209))

(assert (=> b!143975 d!46037))

(assert (=> b!144002 d!45931))

(declare-fun b!144431 () Bool)

(declare-fun e!94124 () Bool)

(declare-fun e!94123 () Bool)

(assert (=> b!144431 (= e!94124 e!94123)))

(declare-fun c!27362 () Bool)

(assert (=> b!144431 (= c!27362 (validKeyInArray!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144432 () Bool)

(declare-fun e!94122 () Bool)

(declare-fun call!16079 () Bool)

(assert (=> b!144432 (= e!94122 call!16079)))

(declare-fun b!144433 () Bool)

(assert (=> b!144433 (= e!94123 e!94122)))

(declare-fun lt!75800 () (_ BitVec 64))

(assert (=> b!144433 (= lt!75800 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75799 () Unit!4557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4925 (_ BitVec 64) (_ BitVec 32)) Unit!4557)

(assert (=> b!144433 (= lt!75799 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4741 newMap!16) lt!75800 #b00000000000000000000000000000000))))

(assert (=> b!144433 (arrayContainsKey!0 (_keys!4741 newMap!16) lt!75800 #b00000000000000000000000000000000)))

(declare-fun lt!75798 () Unit!4557)

(assert (=> b!144433 (= lt!75798 lt!75799)))

(declare-fun res!68783 () Bool)

(assert (=> b!144433 (= res!68783 (= (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000) (_keys!4741 newMap!16) (mask!7334 newMap!16)) (Found!281 #b00000000000000000000000000000000)))))

(assert (=> b!144433 (=> (not res!68783) (not e!94122))))

(declare-fun b!144434 () Bool)

(assert (=> b!144434 (= e!94123 call!16079)))

(declare-fun d!46039 () Bool)

(declare-fun res!68784 () Bool)

(assert (=> d!46039 (=> res!68784 e!94124)))

(assert (=> d!46039 (= res!68784 (bvsge #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))))))

(assert (=> d!46039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4741 newMap!16) (mask!7334 newMap!16)) e!94124)))

(declare-fun bm!16076 () Bool)

(assert (=> bm!16076 (= call!16079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(assert (= (and d!46039 (not res!68784)) b!144431))

(assert (= (and b!144431 c!27362) b!144433))

(assert (= (and b!144431 (not c!27362)) b!144434))

(assert (= (and b!144433 res!68783) b!144432))

(assert (= (or b!144432 b!144434) bm!16076))

(assert (=> b!144431 m!173873))

(assert (=> b!144431 m!173873))

(assert (=> b!144431 m!173875))

(assert (=> b!144433 m!173873))

(declare-fun m!174211 () Bool)

(assert (=> b!144433 m!174211))

(declare-fun m!174213 () Bool)

(assert (=> b!144433 m!174213))

(assert (=> b!144433 m!173873))

(declare-fun m!174215 () Bool)

(assert (=> b!144433 m!174215))

(declare-fun m!174217 () Bool)

(assert (=> bm!16076 m!174217))

(assert (=> b!144154 d!46039))

(declare-fun d!46041 () Bool)

(declare-fun e!94125 () Bool)

(assert (=> d!46041 e!94125))

(declare-fun res!68786 () Bool)

(assert (=> d!46041 (=> (not res!68786) (not e!94125))))

(declare-fun lt!75801 () ListLongMap!1751)

(assert (=> d!46041 (= res!68786 (contains!930 lt!75801 (_1!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75802 () List!1753)

(assert (=> d!46041 (= lt!75801 (ListLongMap!1752 lt!75802))))

(declare-fun lt!75804 () Unit!4557)

(declare-fun lt!75803 () Unit!4557)

(assert (=> d!46041 (= lt!75804 lt!75803)))

(assert (=> d!46041 (= (getValueByKey!178 lt!75802 (_1!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!183 (_2!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46041 (= lt!75803 (lemmaContainsTupThenGetReturnValue!92 lt!75802 (_1!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46041 (= lt!75802 (insertStrictlySorted!95 (toList!891 call!16038) (_1!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46041 (= (+!181 call!16038 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75801)))

(declare-fun b!144435 () Bool)

(declare-fun res!68785 () Bool)

(assert (=> b!144435 (=> (not res!68785) (not e!94125))))

(assert (=> b!144435 (= res!68785 (= (getValueByKey!178 (toList!891 lt!75801) (_1!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!183 (_2!1366 (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!144436 () Bool)

(assert (=> b!144436 (= e!94125 (contains!934 (toList!891 lt!75801) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!46041 res!68786) b!144435))

(assert (= (and b!144435 res!68785) b!144436))

(declare-fun m!174219 () Bool)

(assert (=> d!46041 m!174219))

(declare-fun m!174221 () Bool)

(assert (=> d!46041 m!174221))

(declare-fun m!174223 () Bool)

(assert (=> d!46041 m!174223))

(declare-fun m!174225 () Bool)

(assert (=> d!46041 m!174225))

(declare-fun m!174227 () Bool)

(assert (=> b!144435 m!174227))

(declare-fun m!174229 () Bool)

(assert (=> b!144436 m!174229))

(assert (=> b!144136 d!46041))

(assert (=> b!144012 d!46003))

(assert (=> b!144012 d!46005))

(assert (=> d!45921 d!46029))

(assert (=> bm!16016 d!45917))

(declare-fun d!46043 () Bool)

(assert (=> d!46043 (= (apply!122 lt!75504 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1545 (getValueByKey!178 (toList!891 lt!75504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6091 () Bool)

(assert (= bs!6091 d!46043))

(assert (=> bs!6091 m!174013))

(assert (=> bs!6091 m!174013))

(declare-fun m!174231 () Bool)

(assert (=> bs!6091 m!174231))

(assert (=> b!143944 d!46043))

(declare-fun d!46045 () Bool)

(declare-fun res!68787 () Bool)

(declare-fun e!94126 () Bool)

(assert (=> d!46045 (=> res!68787 e!94126)))

(assert (=> d!46045 (= res!68787 (= (select (arr!2327 (_keys!4741 newMap!16)) #b00000000000000000000000000000000) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46045 (= (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94126)))

(declare-fun b!144437 () Bool)

(declare-fun e!94127 () Bool)

(assert (=> b!144437 (= e!94126 e!94127)))

(declare-fun res!68788 () Bool)

(assert (=> b!144437 (=> (not res!68788) (not e!94127))))

(assert (=> b!144437 (= res!68788 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun b!144438 () Bool)

(assert (=> b!144438 (= e!94127 (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46045 (not res!68787)) b!144437))

(assert (= (and b!144437 res!68788) b!144438))

(assert (=> d!46045 m!173873))

(assert (=> b!144438 m!173583))

(declare-fun m!174233 () Bool)

(assert (=> b!144438 m!174233))

(assert (=> bm!16027 d!46045))

(assert (=> bm!16022 d!45981))

(assert (=> b!143962 d!46027))

(declare-fun d!46047 () Bool)

(assert (=> d!46047 (= (map!1448 (_2!1367 lt!75590)) (getCurrentListMap!563 (_keys!4741 (_2!1367 lt!75590)) (_values!2959 (_2!1367 lt!75590)) (mask!7334 (_2!1367 lt!75590)) (extraKeys!2725 (_2!1367 lt!75590)) (zeroValue!2823 (_2!1367 lt!75590)) (minValue!2823 (_2!1367 lt!75590)) #b00000000000000000000000000000000 (defaultEntry!2976 (_2!1367 lt!75590))))))

(declare-fun bs!6092 () Bool)

(assert (= bs!6092 d!46047))

(declare-fun m!174235 () Bool)

(assert (=> bs!6092 m!174235))

(assert (=> bm!16036 d!46047))

(declare-fun d!46049 () Bool)

(assert (=> d!46049 (= (apply!122 lt!75504 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1545 (getValueByKey!178 (toList!891 lt!75504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6093 () Bool)

(assert (= bs!6093 d!46049))

(assert (=> bs!6093 m!173957))

(assert (=> bs!6093 m!173957))

(declare-fun m!174237 () Bool)

(assert (=> bs!6093 m!174237))

(assert (=> b!143947 d!46049))

(declare-fun d!46051 () Bool)

(assert (=> d!46051 (= (apply!122 (+!181 lt!75508 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75510) (apply!122 lt!75508 lt!75510))))

(declare-fun lt!75807 () Unit!4557)

(declare-fun choose!887 (ListLongMap!1751 (_ BitVec 64) V!3571 (_ BitVec 64)) Unit!4557)

(assert (=> d!46051 (= lt!75807 (choose!887 lt!75508 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75510))))

(declare-fun e!94130 () Bool)

(assert (=> d!46051 e!94130))

(declare-fun res!68791 () Bool)

(assert (=> d!46051 (=> (not res!68791) (not e!94130))))

(assert (=> d!46051 (= res!68791 (contains!930 lt!75508 lt!75510))))

(assert (=> d!46051 (= (addApplyDifferent!98 lt!75508 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75510) lt!75807)))

(declare-fun b!144442 () Bool)

(assert (=> b!144442 (= e!94130 (not (= lt!75510 lt!75509)))))

(assert (= (and d!46051 res!68791) b!144442))

(assert (=> d!46051 m!173707))

(assert (=> d!46051 m!173711))

(assert (=> d!46051 m!173697))

(assert (=> d!46051 m!173707))

(declare-fun m!174239 () Bool)

(assert (=> d!46051 m!174239))

(declare-fun m!174241 () Bool)

(assert (=> d!46051 m!174241))

(assert (=> b!143964 d!46051))

(declare-fun d!46053 () Bool)

(assert (=> d!46053 (= (apply!122 (+!181 lt!75505 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75502) (get!1545 (getValueByKey!178 (toList!891 (+!181 lt!75505 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75502)))))

(declare-fun bs!6094 () Bool)

(assert (= bs!6094 d!46053))

(declare-fun m!174243 () Bool)

(assert (=> bs!6094 m!174243))

(assert (=> bs!6094 m!174243))

(declare-fun m!174245 () Bool)

(assert (=> bs!6094 m!174245))

(assert (=> b!143964 d!46053))

(assert (=> b!143964 d!46009))

(declare-fun d!46055 () Bool)

(assert (=> d!46055 (= (apply!122 lt!75508 lt!75510) (get!1545 (getValueByKey!178 (toList!891 lt!75508) lt!75510)))))

(declare-fun bs!6095 () Bool)

(assert (= bs!6095 d!46055))

(declare-fun m!174247 () Bool)

(assert (=> bs!6095 m!174247))

(assert (=> bs!6095 m!174247))

(declare-fun m!174249 () Bool)

(assert (=> bs!6095 m!174249))

(assert (=> b!143964 d!46055))

(declare-fun d!46057 () Bool)

(declare-fun e!94131 () Bool)

(assert (=> d!46057 e!94131))

(declare-fun res!68793 () Bool)

(assert (=> d!46057 (=> (not res!68793) (not e!94131))))

(declare-fun lt!75808 () ListLongMap!1751)

(assert (=> d!46057 (= res!68793 (contains!930 lt!75808 (_1!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75809 () List!1753)

(assert (=> d!46057 (= lt!75808 (ListLongMap!1752 lt!75809))))

(declare-fun lt!75811 () Unit!4557)

(declare-fun lt!75810 () Unit!4557)

(assert (=> d!46057 (= lt!75811 lt!75810)))

(assert (=> d!46057 (= (getValueByKey!178 lt!75809 (_1!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46057 (= lt!75810 (lemmaContainsTupThenGetReturnValue!92 lt!75809 (_1!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46057 (= lt!75809 (insertStrictlySorted!95 (toList!891 lt!75500) (_1!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46057 (= (+!181 lt!75500 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75808)))

(declare-fun b!144443 () Bool)

(declare-fun res!68792 () Bool)

(assert (=> b!144443 (=> (not res!68792) (not e!94131))))

(assert (=> b!144443 (= res!68792 (= (getValueByKey!178 (toList!891 lt!75808) (_1!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144444 () Bool)

(assert (=> b!144444 (= e!94131 (contains!934 (toList!891 lt!75808) (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46057 res!68793) b!144443))

(assert (= (and b!144443 res!68792) b!144444))

(declare-fun m!174251 () Bool)

(assert (=> d!46057 m!174251))

(declare-fun m!174253 () Bool)

(assert (=> d!46057 m!174253))

(declare-fun m!174255 () Bool)

(assert (=> d!46057 m!174255))

(declare-fun m!174257 () Bool)

(assert (=> d!46057 m!174257))

(declare-fun m!174259 () Bool)

(assert (=> b!144443 m!174259))

(declare-fun m!174261 () Bool)

(assert (=> b!144444 m!174261))

(assert (=> b!143964 d!46057))

(declare-fun d!46059 () Bool)

(declare-fun e!94132 () Bool)

(assert (=> d!46059 e!94132))

(declare-fun res!68795 () Bool)

(assert (=> d!46059 (=> (not res!68795) (not e!94132))))

(declare-fun lt!75812 () ListLongMap!1751)

(assert (=> d!46059 (= res!68795 (contains!930 lt!75812 (_1!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75813 () List!1753)

(assert (=> d!46059 (= lt!75812 (ListLongMap!1752 lt!75813))))

(declare-fun lt!75815 () Unit!4557)

(declare-fun lt!75814 () Unit!4557)

(assert (=> d!46059 (= lt!75815 lt!75814)))

(assert (=> d!46059 (= (getValueByKey!178 lt!75813 (_1!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46059 (= lt!75814 (lemmaContainsTupThenGetReturnValue!92 lt!75813 (_1!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46059 (= lt!75813 (insertStrictlySorted!95 (toList!891 lt!75505) (_1!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46059 (= (+!181 lt!75505 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75812)))

(declare-fun b!144445 () Bool)

(declare-fun res!68794 () Bool)

(assert (=> b!144445 (=> (not res!68794) (not e!94132))))

(assert (=> b!144445 (= res!68794 (= (getValueByKey!178 (toList!891 lt!75812) (_1!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144446 () Bool)

(assert (=> b!144446 (= e!94132 (contains!934 (toList!891 lt!75812) (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46059 res!68795) b!144445))

(assert (= (and b!144445 res!68794) b!144446))

(declare-fun m!174263 () Bool)

(assert (=> d!46059 m!174263))

(declare-fun m!174265 () Bool)

(assert (=> d!46059 m!174265))

(declare-fun m!174267 () Bool)

(assert (=> d!46059 m!174267))

(declare-fun m!174269 () Bool)

(assert (=> d!46059 m!174269))

(declare-fun m!174271 () Bool)

(assert (=> b!144445 m!174271))

(declare-fun m!174273 () Bool)

(assert (=> b!144446 m!174273))

(assert (=> b!143964 d!46059))

(declare-fun d!46061 () Bool)

(assert (=> d!46061 (= (apply!122 (+!181 lt!75500 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75495) (apply!122 lt!75500 lt!75495))))

(declare-fun lt!75816 () Unit!4557)

(assert (=> d!46061 (= lt!75816 (choose!887 lt!75500 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75495))))

(declare-fun e!94133 () Bool)

(assert (=> d!46061 e!94133))

(declare-fun res!68796 () Bool)

(assert (=> d!46061 (=> (not res!68796) (not e!94133))))

(assert (=> d!46061 (= res!68796 (contains!930 lt!75500 lt!75495))))

(assert (=> d!46061 (= (addApplyDifferent!98 lt!75500 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75495) lt!75816)))

(declare-fun b!144447 () Bool)

(assert (=> b!144447 (= e!94133 (not (= lt!75495 lt!75498)))))

(assert (= (and d!46061 res!68796) b!144447))

(assert (=> d!46061 m!173699))

(assert (=> d!46061 m!173701))

(assert (=> d!46061 m!173717))

(assert (=> d!46061 m!173699))

(declare-fun m!174275 () Bool)

(assert (=> d!46061 m!174275))

(declare-fun m!174277 () Bool)

(assert (=> d!46061 m!174277))

(assert (=> b!143964 d!46061))

(declare-fun d!46063 () Bool)

(declare-fun e!94135 () Bool)

(assert (=> d!46063 e!94135))

(declare-fun res!68797 () Bool)

(assert (=> d!46063 (=> res!68797 e!94135)))

(declare-fun lt!75819 () Bool)

(assert (=> d!46063 (= res!68797 (not lt!75819))))

(declare-fun lt!75818 () Bool)

(assert (=> d!46063 (= lt!75819 lt!75818)))

(declare-fun lt!75817 () Unit!4557)

(declare-fun e!94134 () Unit!4557)

(assert (=> d!46063 (= lt!75817 e!94134)))

(declare-fun c!27363 () Bool)

(assert (=> d!46063 (= c!27363 lt!75818)))

(assert (=> d!46063 (= lt!75818 (containsKey!182 (toList!891 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75493))))

(assert (=> d!46063 (= (contains!930 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75493) lt!75819)))

(declare-fun b!144448 () Bool)

(declare-fun lt!75820 () Unit!4557)

(assert (=> b!144448 (= e!94134 lt!75820)))

(assert (=> b!144448 (= lt!75820 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!891 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75493))))

(assert (=> b!144448 (isDefined!131 (getValueByKey!178 (toList!891 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75493))))

(declare-fun b!144449 () Bool)

(declare-fun Unit!4574 () Unit!4557)

(assert (=> b!144449 (= e!94134 Unit!4574)))

(declare-fun b!144450 () Bool)

(assert (=> b!144450 (= e!94135 (isDefined!131 (getValueByKey!178 (toList!891 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75493)))))

(assert (= (and d!46063 c!27363) b!144448))

(assert (= (and d!46063 (not c!27363)) b!144449))

(assert (= (and d!46063 (not res!68797)) b!144450))

(declare-fun m!174279 () Bool)

(assert (=> d!46063 m!174279))

(declare-fun m!174281 () Bool)

(assert (=> b!144448 m!174281))

(declare-fun m!174283 () Bool)

(assert (=> b!144448 m!174283))

(assert (=> b!144448 m!174283))

(declare-fun m!174285 () Bool)

(assert (=> b!144448 m!174285))

(assert (=> b!144450 m!174283))

(assert (=> b!144450 m!174283))

(assert (=> b!144450 m!174285))

(assert (=> b!143964 d!46063))

(declare-fun d!46065 () Bool)

(declare-fun e!94136 () Bool)

(assert (=> d!46065 e!94136))

(declare-fun res!68799 () Bool)

(assert (=> d!46065 (=> (not res!68799) (not e!94136))))

(declare-fun lt!75821 () ListLongMap!1751)

(assert (=> d!46065 (= res!68799 (contains!930 lt!75821 (_1!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75822 () List!1753)

(assert (=> d!46065 (= lt!75821 (ListLongMap!1752 lt!75822))))

(declare-fun lt!75824 () Unit!4557)

(declare-fun lt!75823 () Unit!4557)

(assert (=> d!46065 (= lt!75824 lt!75823)))

(assert (=> d!46065 (= (getValueByKey!178 lt!75822 (_1!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46065 (= lt!75823 (lemmaContainsTupThenGetReturnValue!92 lt!75822 (_1!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46065 (= lt!75822 (insertStrictlySorted!95 (toList!891 lt!75508) (_1!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46065 (= (+!181 lt!75508 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75821)))

(declare-fun b!144451 () Bool)

(declare-fun res!68798 () Bool)

(assert (=> b!144451 (=> (not res!68798) (not e!94136))))

(assert (=> b!144451 (= res!68798 (= (getValueByKey!178 (toList!891 lt!75821) (_1!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144452 () Bool)

(assert (=> b!144452 (= e!94136 (contains!934 (toList!891 lt!75821) (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46065 res!68799) b!144451))

(assert (= (and b!144451 res!68798) b!144452))

(declare-fun m!174287 () Bool)

(assert (=> d!46065 m!174287))

(declare-fun m!174289 () Bool)

(assert (=> d!46065 m!174289))

(declare-fun m!174291 () Bool)

(assert (=> d!46065 m!174291))

(declare-fun m!174293 () Bool)

(assert (=> d!46065 m!174293))

(declare-fun m!174295 () Bool)

(assert (=> b!144451 m!174295))

(declare-fun m!174297 () Bool)

(assert (=> b!144452 m!174297))

(assert (=> b!143964 d!46065))

(declare-fun d!46067 () Bool)

(assert (=> d!46067 (= (apply!122 (+!181 lt!75508 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75510) (get!1545 (getValueByKey!178 (toList!891 (+!181 lt!75508 (tuple2!2711 lt!75509 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75510)))))

(declare-fun bs!6096 () Bool)

(assert (= bs!6096 d!46067))

(declare-fun m!174299 () Bool)

(assert (=> bs!6096 m!174299))

(assert (=> bs!6096 m!174299))

(declare-fun m!174301 () Bool)

(assert (=> bs!6096 m!174301))

(assert (=> b!143964 d!46067))

(declare-fun d!46069 () Bool)

(assert (=> d!46069 (= (apply!122 lt!75505 lt!75502) (get!1545 (getValueByKey!178 (toList!891 lt!75505) lt!75502)))))

(declare-fun bs!6097 () Bool)

(assert (= bs!6097 d!46069))

(declare-fun m!174303 () Bool)

(assert (=> bs!6097 m!174303))

(assert (=> bs!6097 m!174303))

(declare-fun m!174305 () Bool)

(assert (=> bs!6097 m!174305))

(assert (=> b!143964 d!46069))

(declare-fun d!46071 () Bool)

(assert (=> d!46071 (contains!930 (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75493)))

(declare-fun lt!75827 () Unit!4557)

(declare-fun choose!888 (ListLongMap!1751 (_ BitVec 64) V!3571 (_ BitVec 64)) Unit!4557)

(assert (=> d!46071 (= lt!75827 (choose!888 lt!75497 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75493))))

(assert (=> d!46071 (contains!930 lt!75497 lt!75493)))

(assert (=> d!46071 (= (addStillContains!98 lt!75497 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75493) lt!75827)))

(declare-fun bs!6098 () Bool)

(assert (= bs!6098 d!46071))

(assert (=> bs!6098 m!173703))

(assert (=> bs!6098 m!173703))

(assert (=> bs!6098 m!173705))

(declare-fun m!174307 () Bool)

(assert (=> bs!6098 m!174307))

(declare-fun m!174309 () Bool)

(assert (=> bs!6098 m!174309))

(assert (=> b!143964 d!46071))

(declare-fun d!46073 () Bool)

(declare-fun e!94137 () Bool)

(assert (=> d!46073 e!94137))

(declare-fun res!68801 () Bool)

(assert (=> d!46073 (=> (not res!68801) (not e!94137))))

(declare-fun lt!75828 () ListLongMap!1751)

(assert (=> d!46073 (= res!68801 (contains!930 lt!75828 (_1!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75829 () List!1753)

(assert (=> d!46073 (= lt!75828 (ListLongMap!1752 lt!75829))))

(declare-fun lt!75831 () Unit!4557)

(declare-fun lt!75830 () Unit!4557)

(assert (=> d!46073 (= lt!75831 lt!75830)))

(assert (=> d!46073 (= (getValueByKey!178 lt!75829 (_1!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46073 (= lt!75830 (lemmaContainsTupThenGetReturnValue!92 lt!75829 (_1!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46073 (= lt!75829 (insertStrictlySorted!95 (toList!891 lt!75497) (_1!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) (_2!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46073 (= (+!181 lt!75497 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75828)))

(declare-fun b!144454 () Bool)

(declare-fun res!68800 () Bool)

(assert (=> b!144454 (=> (not res!68800) (not e!94137))))

(assert (=> b!144454 (= res!68800 (= (getValueByKey!178 (toList!891 lt!75828) (_1!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992)))))) (Some!183 (_2!1366 (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144455 () Bool)

(assert (=> b!144455 (= e!94137 (contains!934 (toList!891 lt!75828) (tuple2!2711 lt!75512 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46073 res!68801) b!144454))

(assert (= (and b!144454 res!68800) b!144455))

(declare-fun m!174311 () Bool)

(assert (=> d!46073 m!174311))

(declare-fun m!174313 () Bool)

(assert (=> d!46073 m!174313))

(declare-fun m!174315 () Bool)

(assert (=> d!46073 m!174315))

(declare-fun m!174317 () Bool)

(assert (=> d!46073 m!174317))

(declare-fun m!174319 () Bool)

(assert (=> b!144454 m!174319))

(declare-fun m!174321 () Bool)

(assert (=> b!144455 m!174321))

(assert (=> b!143964 d!46073))

(declare-fun d!46075 () Bool)

(assert (=> d!46075 (= (apply!122 (+!181 lt!75500 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75495) (get!1545 (getValueByKey!178 (toList!891 (+!181 lt!75500 (tuple2!2711 lt!75498 (minValue!2823 (v!3308 (underlying!485 thiss!992)))))) lt!75495)))))

(declare-fun bs!6099 () Bool)

(assert (= bs!6099 d!46075))

(declare-fun m!174323 () Bool)

(assert (=> bs!6099 m!174323))

(assert (=> bs!6099 m!174323))

(declare-fun m!174325 () Bool)

(assert (=> bs!6099 m!174325))

(assert (=> b!143964 d!46075))

(declare-fun d!46077 () Bool)

(assert (=> d!46077 (= (apply!122 lt!75500 lt!75495) (get!1545 (getValueByKey!178 (toList!891 lt!75500) lt!75495)))))

(declare-fun bs!6100 () Bool)

(assert (= bs!6100 d!46077))

(declare-fun m!174327 () Bool)

(assert (=> bs!6100 m!174327))

(assert (=> bs!6100 m!174327))

(declare-fun m!174329 () Bool)

(assert (=> bs!6100 m!174329))

(assert (=> b!143964 d!46077))

(declare-fun d!46079 () Bool)

(assert (=> d!46079 (= (apply!122 (+!181 lt!75505 (tuple2!2711 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))))) lt!75502) (apply!122 lt!75505 lt!75502))))

(declare-fun lt!75832 () Unit!4557)

(assert (=> d!46079 (= lt!75832 (choose!887 lt!75505 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75502))))

(declare-fun e!94138 () Bool)

(assert (=> d!46079 e!94138))

(declare-fun res!68802 () Bool)

(assert (=> d!46079 (=> (not res!68802) (not e!94138))))

(assert (=> d!46079 (= res!68802 (contains!930 lt!75505 lt!75502))))

(assert (=> d!46079 (= (addApplyDifferent!98 lt!75505 lt!75494 (zeroValue!2823 (v!3308 (underlying!485 thiss!992))) lt!75502) lt!75832)))

(declare-fun b!144456 () Bool)

(assert (=> b!144456 (= e!94138 (not (= lt!75502 lt!75494)))))

(assert (= (and d!46079 res!68802) b!144456))

(assert (=> d!46079 m!173713))

(assert (=> d!46079 m!173725))

(assert (=> d!46079 m!173721))

(assert (=> d!46079 m!173713))

(declare-fun m!174331 () Bool)

(assert (=> d!46079 m!174331))

(declare-fun m!174333 () Bool)

(assert (=> d!46079 m!174333))

(assert (=> b!143964 d!46079))

(assert (=> b!144105 d!45961))

(declare-fun b!144457 () Bool)

(declare-fun e!94142 () Bool)

(declare-fun e!94141 () Bool)

(assert (=> b!144457 (= e!94142 e!94141)))

(declare-fun c!27364 () Bool)

(assert (=> b!144457 (= c!27364 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun e!94140 () Bool)

(declare-fun b!144458 () Bool)

(assert (=> b!144458 (= e!94140 (contains!931 (ite c!27237 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749) Nil!1749) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!16077 () Bool)

(declare-fun call!16080 () Bool)

(assert (=> bm!16077 (= call!16080 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27364 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27237 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749) Nil!1749)) (ite c!27237 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749) Nil!1749))))))

(declare-fun d!46081 () Bool)

(declare-fun res!68805 () Bool)

(declare-fun e!94139 () Bool)

(assert (=> d!46081 (=> res!68805 e!94139)))

(assert (=> d!46081 (= res!68805 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!46081 (= (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27237 (Cons!1748 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1749) Nil!1749)) e!94139)))

(declare-fun b!144459 () Bool)

(assert (=> b!144459 (= e!94141 call!16080)))

(declare-fun b!144460 () Bool)

(assert (=> b!144460 (= e!94139 e!94142)))

(declare-fun res!68803 () Bool)

(assert (=> b!144460 (=> (not res!68803) (not e!94142))))

(assert (=> b!144460 (= res!68803 (not e!94140))))

(declare-fun res!68804 () Bool)

(assert (=> b!144460 (=> (not res!68804) (not e!94140))))

(assert (=> b!144460 (= res!68804 (validKeyInArray!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!144461 () Bool)

(assert (=> b!144461 (= e!94141 call!16080)))

(assert (= (and d!46081 (not res!68805)) b!144460))

(assert (= (and b!144460 res!68804) b!144458))

(assert (= (and b!144460 res!68803) b!144457))

(assert (= (and b!144457 c!27364) b!144461))

(assert (= (and b!144457 (not c!27364)) b!144459))

(assert (= (or b!144461 b!144459) bm!16077))

(declare-fun m!174335 () Bool)

(assert (=> b!144457 m!174335))

(assert (=> b!144457 m!174335))

(declare-fun m!174337 () Bool)

(assert (=> b!144457 m!174337))

(assert (=> b!144458 m!174335))

(assert (=> b!144458 m!174335))

(declare-fun m!174339 () Bool)

(assert (=> b!144458 m!174339))

(assert (=> bm!16077 m!174335))

(declare-fun m!174341 () Bool)

(assert (=> bm!16077 m!174341))

(assert (=> b!144460 m!174335))

(assert (=> b!144460 m!174335))

(assert (=> b!144460 m!174337))

(assert (=> bm!15967 d!46081))

(declare-fun d!46083 () Bool)

(declare-fun res!68806 () Bool)

(declare-fun e!94143 () Bool)

(assert (=> d!46083 (=> (not res!68806) (not e!94143))))

(assert (=> d!46083 (= res!68806 (simpleValid!98 (_2!1367 lt!75590)))))

(assert (=> d!46083 (= (valid!563 (_2!1367 lt!75590)) e!94143)))

(declare-fun b!144462 () Bool)

(declare-fun res!68807 () Bool)

(assert (=> b!144462 (=> (not res!68807) (not e!94143))))

(assert (=> b!144462 (= res!68807 (= (arrayCountValidKeys!0 (_keys!4741 (_2!1367 lt!75590)) #b00000000000000000000000000000000 (size!2601 (_keys!4741 (_2!1367 lt!75590)))) (_size!631 (_2!1367 lt!75590))))))

(declare-fun b!144463 () Bool)

(declare-fun res!68808 () Bool)

(assert (=> b!144463 (=> (not res!68808) (not e!94143))))

(assert (=> b!144463 (= res!68808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4741 (_2!1367 lt!75590)) (mask!7334 (_2!1367 lt!75590))))))

(declare-fun b!144464 () Bool)

(assert (=> b!144464 (= e!94143 (arrayNoDuplicates!0 (_keys!4741 (_2!1367 lt!75590)) #b00000000000000000000000000000000 Nil!1749))))

(assert (= (and d!46083 res!68806) b!144462))

(assert (= (and b!144462 res!68807) b!144463))

(assert (= (and b!144463 res!68808) b!144464))

(declare-fun m!174343 () Bool)

(assert (=> d!46083 m!174343))

(declare-fun m!174345 () Bool)

(assert (=> b!144462 m!174345))

(declare-fun m!174347 () Bool)

(assert (=> b!144463 m!174347))

(declare-fun m!174349 () Bool)

(assert (=> b!144464 m!174349))

(assert (=> d!45937 d!46083))

(assert (=> d!45937 d!45947))

(declare-fun d!46085 () Bool)

(assert (=> d!46085 (= (get!1543 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3307 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144143 d!46085))

(assert (=> b!143990 d!46033))

(declare-fun b!144499 () Bool)

(declare-fun res!68833 () Bool)

(declare-fun e!94163 () Bool)

(assert (=> b!144499 (=> (not res!68833) (not e!94163))))

(declare-fun lt!75919 () SeekEntryResult!281)

(assert (=> b!144499 (= res!68833 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3289 lt!75919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16086 () Bool)

(declare-fun call!16091 () Bool)

(assert (=> bm!16086 (= call!16091 (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144500 () Bool)

(declare-fun res!68835 () Bool)

(assert (=> b!144500 (= res!68835 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3292 lt!75919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94166 () Bool)

(assert (=> b!144500 (=> (not res!68835) (not e!94166))))

(declare-fun bm!16087 () Bool)

(declare-fun call!16092 () Bool)

(declare-fun call!16089 () Bool)

(assert (=> bm!16087 (= call!16092 call!16089)))

(declare-fun b!144501 () Bool)

(declare-fun res!68831 () Bool)

(declare-fun e!94164 () Bool)

(assert (=> b!144501 (=> (not res!68831) (not e!94164))))

(declare-fun lt!75922 () tuple2!2712)

(assert (=> b!144501 (= res!68831 (valid!563 (_2!1367 lt!75922)))))

(declare-fun c!27376 () Bool)

(declare-fun c!27374 () Bool)

(declare-fun bm!16088 () Bool)

(declare-fun lt!75899 () SeekEntryResult!281)

(assert (=> bm!16088 (= call!16089 (inRange!0 (ite c!27376 (index!3290 lt!75899) (ite c!27374 (index!3289 lt!75919) (index!3292 lt!75919))) (mask!7334 newMap!16)))))

(declare-fun b!144502 () Bool)

(declare-fun e!94162 () Bool)

(assert (=> b!144502 (= e!94162 e!94166)))

(declare-fun res!68829 () Bool)

(assert (=> b!144502 (= res!68829 call!16092)))

(assert (=> b!144502 (=> (not res!68829) (not e!94166))))

(declare-fun b!144503 () Bool)

(declare-fun res!68830 () Bool)

(assert (=> b!144503 (=> (not res!68830) (not e!94164))))

(assert (=> b!144503 (= res!68830 (contains!930 (map!1448 (_2!1367 lt!75922)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144505 () Bool)

(declare-fun e!94165 () Unit!4557)

(declare-fun lt!75893 () Unit!4557)

(assert (=> b!144505 (= e!94165 lt!75893)))

(assert (=> b!144505 (= lt!75893 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(declare-fun call!16090 () SeekEntryResult!281)

(assert (=> b!144505 (= lt!75919 call!16090)))

(assert (=> b!144505 (= c!27374 ((_ is MissingZero!281) lt!75919))))

(declare-fun e!94161 () Bool)

(assert (=> b!144505 e!94161))

(declare-fun b!144506 () Bool)

(declare-fun e!94167 () Unit!4557)

(declare-fun Unit!4575 () Unit!4557)

(assert (=> b!144506 (= e!94167 Unit!4575)))

(declare-fun b!144507 () Bool)

(declare-fun Unit!4576 () Unit!4557)

(assert (=> b!144507 (= e!94165 Unit!4576)))

(declare-fun lt!75895 () Unit!4557)

(assert (=> b!144507 (= lt!75895 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2976 newMap!16)))))

(assert (=> b!144507 (= lt!75899 call!16090)))

(declare-fun res!68827 () Bool)

(assert (=> b!144507 (= res!68827 ((_ is Found!281) lt!75899))))

(declare-fun e!94160 () Bool)

(assert (=> b!144507 (=> (not res!68827) (not e!94160))))

(assert (=> b!144507 e!94160))

(declare-fun lt!75915 () Unit!4557)

(assert (=> b!144507 (= lt!75915 lt!75895)))

(assert (=> b!144507 false))

(declare-fun b!144508 () Bool)

(declare-fun Unit!4577 () Unit!4557)

(assert (=> b!144508 (= e!94167 Unit!4577)))

(declare-fun lt!75905 () Unit!4557)

(declare-fun lemmaArrayContainsKeyThenInListMap!47 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 64) (_ BitVec 32) Int) Unit!4557)

(assert (=> b!144508 (= lt!75905 (lemmaArrayContainsKeyThenInListMap!47 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(assert (=> b!144508 (contains!930 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355))))

(declare-fun lt!75896 () Unit!4557)

(assert (=> b!144508 (= lt!75896 lt!75905)))

(assert (=> b!144508 false))

(declare-fun b!144509 () Bool)

(assert (=> b!144509 (= e!94162 ((_ is Undefined!281) lt!75919))))

(declare-fun bm!16089 () Bool)

(assert (=> bm!16089 (= call!16090 (seekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (mask!7334 newMap!16)))))

(declare-fun d!46087 () Bool)

(assert (=> d!46087 e!94164))

(declare-fun res!68832 () Bool)

(assert (=> d!46087 (=> (not res!68832) (not e!94164))))

(assert (=> d!46087 (= res!68832 (_1!1367 lt!75922))))

(assert (=> d!46087 (= lt!75922 (tuple2!2713 true (LongMapFixedSize!1165 (defaultEntry!2976 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (bvadd (_size!631 newMap!16) #b00000000000000000000000000000001) (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))) (_vacant!631 newMap!16))))))

(declare-fun lt!75910 () Unit!4557)

(declare-fun lt!75901 () Unit!4557)

(assert (=> d!46087 (= lt!75910 lt!75901)))

(declare-fun lt!75920 () array!4925)

(declare-fun lt!75898 () array!4927)

(assert (=> d!46087 (contains!930 (getCurrentListMap!563 lt!75920 lt!75898 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (select (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604))))))

(assert (=> d!46087 (= lt!75901 (lemmaValidKeyInArrayIsInListMap!128 lt!75920 lt!75898 (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (defaultEntry!2976 newMap!16)))))

(assert (=> d!46087 (= lt!75898 (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))))))

(assert (=> d!46087 (= lt!75920 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun lt!75921 () Unit!4557)

(declare-fun lt!75918 () Unit!4557)

(assert (=> d!46087 (= lt!75921 lt!75918)))

(declare-fun lt!75917 () array!4925)

(assert (=> d!46087 (= (arrayCountValidKeys!0 lt!75917 (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (bvadd (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4925 (_ BitVec 32)) Unit!4557)

(assert (=> d!46087 (= lt!75918 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75917 (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604))))))

(assert (=> d!46087 (= lt!75917 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun lt!75902 () Unit!4557)

(declare-fun lt!75909 () Unit!4557)

(assert (=> d!46087 (= lt!75902 lt!75909)))

(declare-fun lt!75908 () array!4925)

(assert (=> d!46087 (arrayContainsKey!0 lt!75908 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!46087 (= lt!75909 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75908 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604))))))

(assert (=> d!46087 (= lt!75908 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))))))

(declare-fun lt!75916 () Unit!4557)

(declare-fun lt!75906 () Unit!4557)

(assert (=> d!46087 (= lt!75916 lt!75906)))

(assert (=> d!46087 (= (+!181 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!563 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))) (array!4928 (store (arr!2328 (_values!2959 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (ValueCellFull!1128 (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2602 (_values!2959 newMap!16))) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!47 (array!4925 array!4927 (_ BitVec 32) (_ BitVec 32) V!3571 V!3571 (_ BitVec 32) (_ BitVec 64) V!3571 Int) Unit!4557)

(assert (=> d!46087 (= lt!75906 (lemmaAddValidKeyToArrayThenAddPairToListMap!47 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2976 newMap!16)))))

(declare-fun lt!75913 () Unit!4557)

(declare-fun lt!75914 () Unit!4557)

(assert (=> d!46087 (= lt!75913 lt!75914)))

(assert (=> d!46087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))) (mask!7334 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4925 (_ BitVec 32) (_ BitVec 32)) Unit!4557)

(assert (=> d!46087 (= lt!75914 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4741 newMap!16) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (mask!7334 newMap!16)))))

(declare-fun lt!75897 () Unit!4557)

(declare-fun lt!75907 () Unit!4557)

(assert (=> d!46087 (= lt!75897 lt!75907)))

(assert (=> d!46087 (= (arrayCountValidKeys!0 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))) #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4741 newMap!16) #b00000000000000000000000000000000 (size!2601 (_keys!4741 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4925 (_ BitVec 32) (_ BitVec 64)) Unit!4557)

(assert (=> d!46087 (= lt!75907 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4741 newMap!16) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!75911 () Unit!4557)

(declare-fun lt!75900 () Unit!4557)

(assert (=> d!46087 (= lt!75911 lt!75900)))

(declare-fun lt!75912 () (_ BitVec 32))

(declare-fun lt!75904 () List!1752)

(assert (=> d!46087 (arrayNoDuplicates!0 (array!4926 (store (arr!2327 (_keys!4741 newMap!16)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2601 (_keys!4741 newMap!16))) lt!75912 lt!75904)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4925 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1752) Unit!4557)

(assert (=> d!46087 (= lt!75900 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604)) lt!75912 lt!75904))))

(assert (=> d!46087 (= lt!75904 Nil!1749)))

(assert (=> d!46087 (= lt!75912 #b00000000000000000000000000000000)))

(declare-fun lt!75903 () Unit!4557)

(assert (=> d!46087 (= lt!75903 e!94167)))

(declare-fun c!27375 () Bool)

(assert (=> d!46087 (= c!27375 (arrayContainsKey!0 (_keys!4741 newMap!16) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75894 () Unit!4557)

(assert (=> d!46087 (= lt!75894 e!94165)))

(assert (=> d!46087 (= c!27376 (contains!930 (getCurrentListMap!563 (_keys!4741 newMap!16) (_values!2959 newMap!16) (mask!7334 newMap!16) (extraKeys!2725 newMap!16) (zeroValue!2823 newMap!16) (minValue!2823 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2976 newMap!16)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46087 (valid!563 newMap!16)))

(assert (=> d!46087 (= (updateHelperNewKey!67 newMap!16 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27278 (index!3292 lt!75604) (index!3289 lt!75604))) lt!75922)))

(declare-fun b!144504 () Bool)

(assert (=> b!144504 (= e!94164 (= (map!1448 (_2!1367 lt!75922)) (+!181 (map!1448 newMap!16) (tuple2!2711 (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1541 (select (arr!2328 (_values!2959 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144510 () Bool)

(declare-fun res!68828 () Bool)

(assert (=> b!144510 (= res!68828 call!16089)))

(assert (=> b!144510 (=> (not res!68828) (not e!94160))))

(declare-fun b!144511 () Bool)

(assert (=> b!144511 (= e!94163 (not call!16091))))

(declare-fun b!144512 () Bool)

(declare-fun res!68834 () Bool)

(assert (=> b!144512 (=> (not res!68834) (not e!94163))))

(assert (=> b!144512 (= res!68834 call!16092)))

(assert (=> b!144512 (= e!94161 e!94163)))

(declare-fun b!144513 () Bool)

(assert (=> b!144513 (= e!94160 (= (select (arr!2327 (_keys!4741 newMap!16)) (index!3290 lt!75899)) (select (arr!2327 (_keys!4741 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144514 () Bool)

(declare-fun c!27373 () Bool)

(assert (=> b!144514 (= c!27373 ((_ is MissingVacant!281) lt!75919))))

(assert (=> b!144514 (= e!94161 e!94162)))

(declare-fun b!144515 () Bool)

(assert (=> b!144515 (= e!94166 (not call!16091))))

(assert (= (and d!46087 c!27376) b!144507))

(assert (= (and d!46087 (not c!27376)) b!144505))

(assert (= (and b!144507 res!68827) b!144510))

(assert (= (and b!144510 res!68828) b!144513))

(assert (= (and b!144505 c!27374) b!144512))

(assert (= (and b!144505 (not c!27374)) b!144514))

(assert (= (and b!144512 res!68834) b!144499))

(assert (= (and b!144499 res!68833) b!144511))

(assert (= (and b!144514 c!27373) b!144502))

(assert (= (and b!144514 (not c!27373)) b!144509))

(assert (= (and b!144502 res!68829) b!144500))

(assert (= (and b!144500 res!68835) b!144515))

(assert (= (or b!144512 b!144502) bm!16087))

(assert (= (or b!144511 b!144515) bm!16086))

(assert (= (or b!144510 bm!16087) bm!16088))

(assert (= (or b!144507 b!144505) bm!16089))

(assert (= (and d!46087 c!27375) b!144508))

(assert (= (and d!46087 (not c!27375)) b!144506))

(assert (= (and d!46087 res!68832) b!144501))

(assert (= (and b!144501 res!68831) b!144503))

(assert (= (and b!144503 res!68830) b!144504))

(declare-fun m!174351 () Bool)

(assert (=> b!144499 m!174351))

(declare-fun m!174353 () Bool)

(assert (=> b!144503 m!174353))

(assert (=> b!144503 m!174353))

(assert (=> b!144503 m!173583))

(declare-fun m!174355 () Bool)

(assert (=> b!144503 m!174355))

(assert (=> b!144507 m!173583))

(assert (=> b!144507 m!173787))

(assert (=> bm!16089 m!173583))

(assert (=> bm!16089 m!173799))

(declare-fun m!174357 () Bool)

(assert (=> b!144500 m!174357))

(assert (=> b!144508 m!173583))

(declare-fun m!174359 () Bool)

(assert (=> b!144508 m!174359))

(assert (=> b!144508 m!173671))

(assert (=> b!144508 m!173671))

(assert (=> b!144508 m!173583))

(declare-fun m!174361 () Bool)

(assert (=> b!144508 m!174361))

(declare-fun m!174363 () Bool)

(assert (=> bm!16088 m!174363))

(declare-fun m!174365 () Bool)

(assert (=> b!144501 m!174365))

(assert (=> b!144504 m!174353))

(assert (=> b!144504 m!173585))

(assert (=> b!144504 m!173585))

(declare-fun m!174367 () Bool)

(assert (=> b!144504 m!174367))

(assert (=> d!46087 m!173583))

(declare-fun m!174369 () Bool)

(assert (=> d!46087 m!174369))

(assert (=> d!46087 m!173583))

(declare-fun m!174371 () Bool)

(assert (=> d!46087 m!174371))

(declare-fun m!174373 () Bool)

(assert (=> d!46087 m!174373))

(declare-fun m!174375 () Bool)

(assert (=> d!46087 m!174375))

(assert (=> d!46087 m!173583))

(declare-fun m!174377 () Bool)

(assert (=> d!46087 m!174377))

(declare-fun m!174379 () Bool)

(assert (=> d!46087 m!174379))

(declare-fun m!174381 () Bool)

(assert (=> d!46087 m!174381))

(declare-fun m!174383 () Bool)

(assert (=> d!46087 m!174383))

(declare-fun m!174385 () Bool)

(assert (=> d!46087 m!174385))

(assert (=> d!46087 m!173583))

(assert (=> d!46087 m!173773))

(declare-fun m!174387 () Bool)

(assert (=> d!46087 m!174387))

(declare-fun m!174389 () Bool)

(assert (=> d!46087 m!174389))

(assert (=> d!46087 m!173671))

(assert (=> d!46087 m!173583))

(assert (=> d!46087 m!174361))

(declare-fun m!174391 () Bool)

(assert (=> d!46087 m!174391))

(assert (=> d!46087 m!174383))

(declare-fun m!174393 () Bool)

(assert (=> d!46087 m!174393))

(declare-fun m!174395 () Bool)

(assert (=> d!46087 m!174395))

(declare-fun m!174397 () Bool)

(assert (=> d!46087 m!174397))

(assert (=> d!46087 m!173583))

(declare-fun m!174399 () Bool)

(assert (=> d!46087 m!174399))

(assert (=> d!46087 m!173583))

(declare-fun m!174401 () Bool)

(assert (=> d!46087 m!174401))

(assert (=> d!46087 m!173827))

(assert (=> d!46087 m!173621))

(assert (=> d!46087 m!173671))

(assert (=> d!46087 m!173855))

(assert (=> d!46087 m!174381))

(assert (=> d!46087 m!173671))

(assert (=> d!46087 m!173583))

(assert (=> d!46087 m!173615))

(declare-fun m!174403 () Bool)

(assert (=> d!46087 m!174403))

(declare-fun m!174405 () Bool)

(assert (=> b!144513 m!174405))

(assert (=> b!144505 m!173583))

(assert (=> b!144505 m!173805))

(assert (=> bm!16086 m!173583))

(assert (=> bm!16086 m!173773))

(assert (=> bm!16034 d!46087))

(declare-fun d!46089 () Bool)

(declare-fun res!68836 () Bool)

(declare-fun e!94168 () Bool)

(assert (=> d!46089 (=> (not res!68836) (not e!94168))))

(assert (=> d!46089 (= res!68836 (simpleValid!98 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!46089 (= (valid!563 (v!3308 (underlying!485 thiss!992))) e!94168)))

(declare-fun b!144516 () Bool)

(declare-fun res!68837 () Bool)

(assert (=> b!144516 (=> (not res!68837) (not e!94168))))

(assert (=> b!144516 (= res!68837 (= (arrayCountValidKeys!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 (size!2601 (_keys!4741 (v!3308 (underlying!485 thiss!992))))) (_size!631 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144517 () Bool)

(declare-fun res!68838 () Bool)

(assert (=> b!144517 (=> (not res!68838) (not e!94168))))

(assert (=> b!144517 (= res!68838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4741 (v!3308 (underlying!485 thiss!992))) (mask!7334 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144518 () Bool)

(assert (=> b!144518 (= e!94168 (arrayNoDuplicates!0 (_keys!4741 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 Nil!1749))))

(assert (= (and d!46089 res!68836) b!144516))

(assert (= (and b!144516 res!68837) b!144517))

(assert (= (and b!144517 res!68838) b!144518))

(declare-fun m!174407 () Bool)

(assert (=> d!46089 m!174407))

(declare-fun m!174409 () Bool)

(assert (=> b!144516 m!174409))

(declare-fun m!174411 () Bool)

(assert (=> b!144517 m!174411))

(declare-fun m!174413 () Bool)

(assert (=> b!144518 m!174413))

(assert (=> d!45923 d!46089))

(declare-fun condMapEmpty!4897 () Bool)

(declare-fun mapDefault!4897 () ValueCell!1128)

(assert (=> mapNonEmpty!4896 (= condMapEmpty!4897 (= mapRest!4896 ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4897)))))

(declare-fun e!94170 () Bool)

(declare-fun mapRes!4897 () Bool)

(assert (=> mapNonEmpty!4896 (= tp!11664 (and e!94170 mapRes!4897))))

(declare-fun b!144519 () Bool)

(declare-fun e!94169 () Bool)

(assert (=> b!144519 (= e!94169 tp_is_empty!2943)))

(declare-fun mapNonEmpty!4897 () Bool)

(declare-fun tp!11665 () Bool)

(assert (=> mapNonEmpty!4897 (= mapRes!4897 (and tp!11665 e!94169))))

(declare-fun mapValue!4897 () ValueCell!1128)

(declare-fun mapRest!4897 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapKey!4897 () (_ BitVec 32))

(assert (=> mapNonEmpty!4897 (= mapRest!4896 (store mapRest!4897 mapKey!4897 mapValue!4897))))

(declare-fun mapIsEmpty!4897 () Bool)

(assert (=> mapIsEmpty!4897 mapRes!4897))

(declare-fun b!144520 () Bool)

(assert (=> b!144520 (= e!94170 tp_is_empty!2943)))

(assert (= (and mapNonEmpty!4896 condMapEmpty!4897) mapIsEmpty!4897))

(assert (= (and mapNonEmpty!4896 (not condMapEmpty!4897)) mapNonEmpty!4897))

(assert (= (and mapNonEmpty!4897 ((_ is ValueCellFull!1128) mapValue!4897)) b!144519))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1128) mapDefault!4897)) b!144520))

(declare-fun m!174415 () Bool)

(assert (=> mapNonEmpty!4897 m!174415))

(declare-fun condMapEmpty!4898 () Bool)

(declare-fun mapDefault!4898 () ValueCell!1128)

(assert (=> mapNonEmpty!4895 (= condMapEmpty!4898 (= mapRest!4895 ((as const (Array (_ BitVec 32) ValueCell!1128)) mapDefault!4898)))))

(declare-fun e!94172 () Bool)

(declare-fun mapRes!4898 () Bool)

(assert (=> mapNonEmpty!4895 (= tp!11663 (and e!94172 mapRes!4898))))

(declare-fun b!144521 () Bool)

(declare-fun e!94171 () Bool)

(assert (=> b!144521 (= e!94171 tp_is_empty!2943)))

(declare-fun mapNonEmpty!4898 () Bool)

(declare-fun tp!11666 () Bool)

(assert (=> mapNonEmpty!4898 (= mapRes!4898 (and tp!11666 e!94171))))

(declare-fun mapKey!4898 () (_ BitVec 32))

(declare-fun mapRest!4898 () (Array (_ BitVec 32) ValueCell!1128))

(declare-fun mapValue!4898 () ValueCell!1128)

(assert (=> mapNonEmpty!4898 (= mapRest!4895 (store mapRest!4898 mapKey!4898 mapValue!4898))))

(declare-fun mapIsEmpty!4898 () Bool)

(assert (=> mapIsEmpty!4898 mapRes!4898))

(declare-fun b!144522 () Bool)

(assert (=> b!144522 (= e!94172 tp_is_empty!2943)))

(assert (= (and mapNonEmpty!4895 condMapEmpty!4898) mapIsEmpty!4898))

(assert (= (and mapNonEmpty!4895 (not condMapEmpty!4898)) mapNonEmpty!4898))

(assert (= (and mapNonEmpty!4898 ((_ is ValueCellFull!1128) mapValue!4898)) b!144521))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1128) mapDefault!4898)) b!144522))

(declare-fun m!174417 () Bool)

(assert (=> mapNonEmpty!4898 m!174417))

(declare-fun b_lambda!6477 () Bool)

(assert (= b_lambda!6473 (or (and b!143836 b_free!3053) (and b!143822 b_free!3055 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))))) b_lambda!6477)))

(declare-fun b_lambda!6479 () Bool)

(assert (= b_lambda!6467 (or (and b!143836 b_free!3053 (= (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2976 newMap!16))) (and b!143822 b_free!3055) b_lambda!6479)))

(declare-fun b_lambda!6481 () Bool)

(assert (= b_lambda!6471 (or (and b!143836 b_free!3053 (= (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2976 newMap!16))) (and b!143822 b_free!3055) b_lambda!6481)))

(declare-fun b_lambda!6483 () Bool)

(assert (= b_lambda!6469 (or (and b!143836 b_free!3053 (= (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2976 newMap!16))) (and b!143822 b_free!3055) b_lambda!6483)))

(declare-fun b_lambda!6485 () Bool)

(assert (= b_lambda!6475 (or (and b!143836 b_free!3053) (and b!143822 b_free!3055 (= (defaultEntry!2976 newMap!16) (defaultEntry!2976 (v!3308 (underlying!485 thiss!992))))) b_lambda!6485)))

(check-sat (not b!144305) (not b!144198) (not bm!16046) (not b_lambda!6461) (not b!144464) (not b!144359) (not d!46071) (not b!144457) (not b!144211) (not b_lambda!6481) (not b!144296) (not b!144225) (not d!46067) (not bm!16051) (not d!45997) (not b!144321) (not b!144399) (not b!144179) (not b!144261) (not b!144404) (not bm!16040) (not b!144288) (not d!45961) (not b!144304) (not mapNonEmpty!4898) (not b!144230) (not d!46047) (not b!144369) (not b!144256) (not d!46017) (not b!144420) (not b!144507) (not b_next!3055) (not d!46089) (not d!45973) (not d!46023) (not b!144518) (not b!144333) (not b_next!3053) (not b!144213) (not d!45971) (not b!144436) (not b!144460) (not d!46001) (not d!46077) (not bm!16088) (not b!144216) (not b!144366) (not b!144435) (not bm!16058) (not b!144201) (not bm!16072) (not bm!16067) (not b!144508) (not b!144209) (not b!144448) (not b!144364) (not b!144210) (not b!144267) (not b!144265) (not bm!16050) (not d!46083) (not b!144199) (not d!46087) (not b!144255) (not b!144332) (not d!46019) (not b!144463) (not d!46049) (not d!46035) (not b!144438) (not d!45955) (not b_lambda!6485) (not d!45975) (not b!144263) (not b!144284) (not b!144452) (not d!46061) (not d!45957) (not b!144419) (not bm!16049) b_and!9005 (not b!144367) (not d!45959) (not b!144275) (not d!46015) (not d!45967) (not b_lambda!6483) (not b!144214) (not b!144363) (not d!46069) (not b!144372) (not b!144307) (not d!45965) (not b_lambda!6477) (not bm!16086) (not bm!16077) (not b!144501) (not d!45999) (not b!144361) (not d!46009) (not d!46021) (not b!144401) b_and!9003 (not b!144299) (not bm!16053) (not b!144458) (not bm!16052) (not b!144287) (not b!144450) (not bm!16057) (not b_lambda!6479) (not b!144422) (not b!144246) (not b!144446) (not b!144180) (not b!144310) (not b!144193) (not d!46075) (not bm!16064) (not b!144168) tp_is_empty!2943 (not bm!16060) (not b!144397) (not b!144171) (not b!144402) (not b!144445) (not bm!16089) (not d!46057) (not b!144283) (not b!144412) (not b!144166) (not bm!16059) (not d!46053) (not b!144212) (not b!144269) (not b!144443) (not d!46073) (not b!144232) (not b!144503) (not b!144174) (not d!45983) (not d!46041) (not b!144290) (not b_lambda!6465) (not b!144451) (not mapNonEmpty!4897) (not d!46003) (not b!144181) (not b!144254) (not d!46051) (not b!144444) (not b!144182) (not d!46055) (not b!144517) (not b!144190) (not b!144504) (not d!45985) (not b!144431) (not d!46007) (not b!144278) (not d!46025) (not b!144454) (not d!46059) (not b!144252) (not d!45953) (not b!144409) (not d!46043) (not bm!16073) (not bm!16076) (not bm!16042) (not b!144365) (not b!144418) (not b!144229) (not b!144462) (not d!45995) (not b!144184) (not d!46079) (not b!144207) (not d!46065) (not d!46037) (not d!46031) (not b!144286) (not b!144455) (not d!45981) (not b!144433) (not b!144266) (not b!144505) (not bm!16041) (not d!46063) (not b!144516))
(check-sat b_and!9003 b_and!9005 (not b_next!3053) (not b_next!3055))
