; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8298 () Bool)

(assert start!8298)

(declare-fun b!53868 () Bool)

(declare-fun b_free!1753 () Bool)

(declare-fun b_next!1753 () Bool)

(assert (=> b!53868 (= b_free!1753 (not b_next!1753))))

(declare-fun tp!7359 () Bool)

(declare-fun b_and!3045 () Bool)

(assert (=> b!53868 (= tp!7359 b_and!3045)))

(declare-fun b!53878 () Bool)

(declare-fun b_free!1755 () Bool)

(declare-fun b_next!1755 () Bool)

(assert (=> b!53878 (= b_free!1755 (not b_next!1755))))

(declare-fun tp!7361 () Bool)

(declare-fun b_and!3047 () Bool)

(assert (=> b!53878 (= tp!7361 b_and!3047)))

(declare-fun tp_is_empty!2293 () Bool)

(declare-datatypes ((V!2705 0))(
  ( (V!2706 (val!1191 Int)) )
))
(declare-datatypes ((array!3495 0))(
  ( (array!3496 (arr!1670 (Array (_ BitVec 32) (_ BitVec 64))) (size!1899 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!803 0))(
  ( (ValueCellFull!803 (v!2271 V!2705)) (EmptyCell!803) )
))
(declare-datatypes ((array!3497 0))(
  ( (array!3498 (arr!1671 (Array (_ BitVec 32) ValueCell!803)) (size!1900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!514 0))(
  ( (LongMapFixedSize!515 (defaultEntry!1971 Int) (mask!5812 (_ BitVec 32)) (extraKeys!1862 (_ BitVec 32)) (zeroValue!1889 V!2705) (minValue!1889 V!2705) (_size!306 (_ BitVec 32)) (_keys!3591 array!3495) (_values!1954 array!3497) (_vacant!306 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!334 0))(
  ( (Cell!335 (v!2272 LongMapFixedSize!514)) )
))
(declare-datatypes ((LongMap!334 0))(
  ( (LongMap!335 (underlying!178 Cell!334)) )
))
(declare-fun thiss!992 () LongMap!334)

(declare-fun e!35162 () Bool)

(declare-fun e!35167 () Bool)

(declare-fun array_inv!1021 (array!3495) Bool)

(declare-fun array_inv!1022 (array!3497) Bool)

(assert (=> b!53868 (= e!35167 (and tp!7359 tp_is_empty!2293 (array_inv!1021 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) (array_inv!1022 (_values!1954 (v!2272 (underlying!178 thiss!992)))) e!35162))))

(declare-fun b!53869 () Bool)

(declare-fun e!35158 () Bool)

(declare-fun mapRes!2549 () Bool)

(assert (=> b!53869 (= e!35162 (and e!35158 mapRes!2549))))

(declare-fun condMapEmpty!2550 () Bool)

(declare-fun mapDefault!2550 () ValueCell!803)

(assert (=> b!53869 (= condMapEmpty!2550 (= (arr!1671 (_values!1954 (v!2272 (underlying!178 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!803)) mapDefault!2550)))))

(declare-fun b!53870 () Bool)

(declare-fun e!35168 () Bool)

(assert (=> b!53870 (= e!35168 tp_is_empty!2293)))

(declare-fun b!53871 () Bool)

(declare-fun res!30520 () Bool)

(declare-fun e!35161 () Bool)

(assert (=> b!53871 (=> (not res!30520) (not e!35161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3495 (_ BitVec 32)) Bool)

(assert (=> b!53871 (= res!30520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3591 (v!2272 (underlying!178 thiss!992))) (mask!5812 (v!2272 (underlying!178 thiss!992)))))))

(declare-fun b!53872 () Bool)

(declare-fun e!35156 () Bool)

(declare-fun e!35163 () Bool)

(assert (=> b!53872 (= e!35156 e!35163)))

(declare-fun b!53873 () Bool)

(declare-fun res!30519 () Bool)

(assert (=> b!53873 (=> (not res!30519) (not e!35161))))

(declare-datatypes ((List!1351 0))(
  ( (Nil!1348) (Cons!1347 (h!1927 (_ BitVec 64)) (t!4473 List!1351)) )
))
(declare-fun arrayNoDuplicates!0 (array!3495 (_ BitVec 32) List!1351) Bool)

(assert (=> b!53873 (= res!30519 (arrayNoDuplicates!0 (_keys!3591 (v!2272 (underlying!178 thiss!992))) #b00000000000000000000000000000000 Nil!1348))))

(declare-fun b!53874 () Bool)

(assert (=> b!53874 (= e!35158 tp_is_empty!2293)))

(declare-fun b!53875 () Bool)

(declare-fun res!30529 () Bool)

(assert (=> b!53875 (=> (not res!30529) (not e!35161))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53875 (= res!30529 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1899 (_keys!3591 (v!2272 (underlying!178 thiss!992)))))))))

(declare-fun b!53876 () Bool)

(declare-fun e!35159 () Bool)

(assert (=> b!53876 (= e!35159 e!35161)))

(declare-fun res!30526 () Bool)

(assert (=> b!53876 (=> (not res!30526) (not e!35161))))

(declare-datatypes ((tuple2!1890 0))(
  ( (tuple2!1891 (_1!956 (_ BitVec 64)) (_2!956 V!2705)) )
))
(declare-datatypes ((List!1352 0))(
  ( (Nil!1349) (Cons!1348 (h!1928 tuple2!1890) (t!4474 List!1352)) )
))
(declare-datatypes ((ListLongMap!1273 0))(
  ( (ListLongMap!1274 (toList!652 List!1352)) )
))
(declare-fun lt!21515 () ListLongMap!1273)

(declare-fun contains!630 (ListLongMap!1273 (_ BitVec 64)) Bool)

(assert (=> b!53876 (= res!30526 (contains!630 lt!21515 (select (arr!1670 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!514)

(declare-datatypes ((tuple2!1892 0))(
  ( (tuple2!1893 (_1!957 Bool) (_2!957 LongMapFixedSize!514)) )
))
(declare-fun lt!21513 () tuple2!1892)

(declare-fun update!59 (LongMapFixedSize!514 (_ BitVec 64) V!2705) tuple2!1892)

(declare-fun get!1006 (ValueCell!803 V!2705) V!2705)

(declare-fun dynLambda!277 (Int (_ BitVec 64)) V!2705)

(assert (=> b!53876 (= lt!21513 (update!59 newMap!16 (select (arr!1670 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) from!355) (get!1006 (select (arr!1671 (_values!1954 (v!2272 (underlying!178 thiss!992)))) from!355) (dynLambda!277 (defaultEntry!1971 (v!2272 (underlying!178 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53877 () Bool)

(declare-fun res!30528 () Bool)

(declare-fun e!35157 () Bool)

(assert (=> b!53877 (=> (not res!30528) (not e!35157))))

(assert (=> b!53877 (= res!30528 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5812 newMap!16)) (_size!306 (v!2272 (underlying!178 thiss!992)))))))

(declare-fun e!35170 () Bool)

(declare-fun e!35166 () Bool)

(assert (=> b!53878 (= e!35170 (and tp!7361 tp_is_empty!2293 (array_inv!1021 (_keys!3591 newMap!16)) (array_inv!1022 (_values!1954 newMap!16)) e!35166))))

(declare-fun mapNonEmpty!2550 () Bool)

(declare-fun tp!7360 () Bool)

(declare-fun e!35169 () Bool)

(assert (=> mapNonEmpty!2550 (= mapRes!2549 (and tp!7360 e!35169))))

(declare-fun mapValue!2550 () ValueCell!803)

(declare-fun mapKey!2550 () (_ BitVec 32))

(declare-fun mapRest!2550 () (Array (_ BitVec 32) ValueCell!803))

(assert (=> mapNonEmpty!2550 (= (arr!1671 (_values!1954 (v!2272 (underlying!178 thiss!992)))) (store mapRest!2550 mapKey!2550 mapValue!2550))))

(declare-fun b!53879 () Bool)

(assert (=> b!53879 (= e!35163 e!35167)))

(declare-fun b!53880 () Bool)

(declare-fun res!30521 () Bool)

(assert (=> b!53880 (=> (not res!30521) (not e!35157))))

(declare-fun valid!202 (LongMapFixedSize!514) Bool)

(assert (=> b!53880 (= res!30521 (valid!202 newMap!16))))

(declare-fun b!53881 () Bool)

(assert (=> b!53881 (= e!35169 tp_is_empty!2293)))

(declare-fun mapIsEmpty!2549 () Bool)

(assert (=> mapIsEmpty!2549 mapRes!2549))

(declare-fun b!53882 () Bool)

(assert (=> b!53882 (= e!35161 false)))

(declare-fun lt!21514 () ListLongMap!1273)

(declare-fun lt!21512 () Bool)

(assert (=> b!53882 (= lt!21512 (contains!630 lt!21514 (select (arr!1670 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) from!355)))))

(declare-fun b!53883 () Bool)

(declare-fun res!30522 () Bool)

(assert (=> b!53883 (=> (not res!30522) (not e!35161))))

(assert (=> b!53883 (= res!30522 (and (= (size!1900 (_values!1954 (v!2272 (underlying!178 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5812 (v!2272 (underlying!178 thiss!992))))) (= (size!1899 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) (size!1900 (_values!1954 (v!2272 (underlying!178 thiss!992))))) (bvsge (mask!5812 (v!2272 (underlying!178 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1862 (v!2272 (underlying!178 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1862 (v!2272 (underlying!178 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun res!30525 () Bool)

(assert (=> start!8298 (=> (not res!30525) (not e!35157))))

(declare-fun valid!203 (LongMap!334) Bool)

(assert (=> start!8298 (= res!30525 (valid!203 thiss!992))))

(assert (=> start!8298 e!35157))

(assert (=> start!8298 e!35156))

(assert (=> start!8298 true))

(assert (=> start!8298 e!35170))

(declare-fun mapNonEmpty!2549 () Bool)

(declare-fun mapRes!2550 () Bool)

(declare-fun tp!7362 () Bool)

(assert (=> mapNonEmpty!2549 (= mapRes!2550 (and tp!7362 e!35168))))

(declare-fun mapValue!2549 () ValueCell!803)

(declare-fun mapKey!2549 () (_ BitVec 32))

(declare-fun mapRest!2549 () (Array (_ BitVec 32) ValueCell!803))

(assert (=> mapNonEmpty!2549 (= (arr!1671 (_values!1954 newMap!16)) (store mapRest!2549 mapKey!2549 mapValue!2549))))

(declare-fun mapIsEmpty!2550 () Bool)

(assert (=> mapIsEmpty!2550 mapRes!2550))

(declare-fun b!53884 () Bool)

(assert (=> b!53884 (= e!35157 e!35159)))

(declare-fun res!30527 () Bool)

(assert (=> b!53884 (=> (not res!30527) (not e!35159))))

(assert (=> b!53884 (= res!30527 (and (= lt!21514 lt!21515) (not (= (select (arr!1670 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1670 (_keys!3591 (v!2272 (underlying!178 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1042 (LongMapFixedSize!514) ListLongMap!1273)

(assert (=> b!53884 (= lt!21515 (map!1042 newMap!16))))

(declare-fun getCurrentListMap!356 (array!3495 array!3497 (_ BitVec 32) (_ BitVec 32) V!2705 V!2705 (_ BitVec 32) Int) ListLongMap!1273)

(assert (=> b!53884 (= lt!21514 (getCurrentListMap!356 (_keys!3591 (v!2272 (underlying!178 thiss!992))) (_values!1954 (v!2272 (underlying!178 thiss!992))) (mask!5812 (v!2272 (underlying!178 thiss!992))) (extraKeys!1862 (v!2272 (underlying!178 thiss!992))) (zeroValue!1889 (v!2272 (underlying!178 thiss!992))) (minValue!1889 (v!2272 (underlying!178 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1971 (v!2272 (underlying!178 thiss!992)))))))

(declare-fun b!53885 () Bool)

(declare-fun e!35165 () Bool)

(assert (=> b!53885 (= e!35165 tp_is_empty!2293)))

(declare-fun b!53886 () Bool)

(declare-fun res!30523 () Bool)

(assert (=> b!53886 (=> (not res!30523) (not e!35161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53886 (= res!30523 (validMask!0 (mask!5812 (v!2272 (underlying!178 thiss!992)))))))

(declare-fun b!53887 () Bool)

(assert (=> b!53887 (= e!35166 (and e!35165 mapRes!2550))))

(declare-fun condMapEmpty!2549 () Bool)

(declare-fun mapDefault!2549 () ValueCell!803)

(assert (=> b!53887 (= condMapEmpty!2549 (= (arr!1671 (_values!1954 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!803)) mapDefault!2549)))))

(declare-fun b!53888 () Bool)

(declare-fun res!30524 () Bool)

(assert (=> b!53888 (=> (not res!30524) (not e!35157))))

(assert (=> b!53888 (= res!30524 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1899 (_keys!3591 (v!2272 (underlying!178 thiss!992)))))))))

(assert (= (and start!8298 res!30525) b!53888))

(assert (= (and b!53888 res!30524) b!53880))

(assert (= (and b!53880 res!30521) b!53877))

(assert (= (and b!53877 res!30528) b!53884))

(assert (= (and b!53884 res!30527) b!53876))

(assert (= (and b!53876 res!30526) b!53886))

(assert (= (and b!53886 res!30523) b!53883))

(assert (= (and b!53883 res!30522) b!53871))

(assert (= (and b!53871 res!30520) b!53873))

(assert (= (and b!53873 res!30519) b!53875))

(assert (= (and b!53875 res!30529) b!53882))

(assert (= (and b!53869 condMapEmpty!2550) mapIsEmpty!2549))

(assert (= (and b!53869 (not condMapEmpty!2550)) mapNonEmpty!2550))

(get-info :version)

(assert (= (and mapNonEmpty!2550 ((_ is ValueCellFull!803) mapValue!2550)) b!53881))

(assert (= (and b!53869 ((_ is ValueCellFull!803) mapDefault!2550)) b!53874))

(assert (= b!53868 b!53869))

(assert (= b!53879 b!53868))

(assert (= b!53872 b!53879))

(assert (= start!8298 b!53872))

(assert (= (and b!53887 condMapEmpty!2549) mapIsEmpty!2550))

(assert (= (and b!53887 (not condMapEmpty!2549)) mapNonEmpty!2549))

(assert (= (and mapNonEmpty!2549 ((_ is ValueCellFull!803) mapValue!2549)) b!53870))

(assert (= (and b!53887 ((_ is ValueCellFull!803) mapDefault!2549)) b!53885))

(assert (= b!53878 b!53887))

(assert (= start!8298 b!53878))

(declare-fun b_lambda!2387 () Bool)

(assert (=> (not b_lambda!2387) (not b!53876)))

(declare-fun t!4470 () Bool)

(declare-fun tb!1097 () Bool)

(assert (=> (and b!53868 (= (defaultEntry!1971 (v!2272 (underlying!178 thiss!992))) (defaultEntry!1971 (v!2272 (underlying!178 thiss!992)))) t!4470) tb!1097))

(declare-fun result!2043 () Bool)

(assert (=> tb!1097 (= result!2043 tp_is_empty!2293)))

(assert (=> b!53876 t!4470))

(declare-fun b_and!3049 () Bool)

(assert (= b_and!3045 (and (=> t!4470 result!2043) b_and!3049)))

(declare-fun tb!1099 () Bool)

(declare-fun t!4472 () Bool)

(assert (=> (and b!53878 (= (defaultEntry!1971 newMap!16) (defaultEntry!1971 (v!2272 (underlying!178 thiss!992)))) t!4472) tb!1099))

(declare-fun result!2047 () Bool)

(assert (= result!2047 result!2043))

(assert (=> b!53876 t!4472))

(declare-fun b_and!3051 () Bool)

(assert (= b_and!3047 (and (=> t!4472 result!2047) b_and!3051)))

(declare-fun m!45601 () Bool)

(assert (=> b!53884 m!45601))

(declare-fun m!45603 () Bool)

(assert (=> b!53884 m!45603))

(declare-fun m!45605 () Bool)

(assert (=> b!53884 m!45605))

(declare-fun m!45607 () Bool)

(assert (=> b!53868 m!45607))

(declare-fun m!45609 () Bool)

(assert (=> b!53868 m!45609))

(declare-fun m!45611 () Bool)

(assert (=> start!8298 m!45611))

(declare-fun m!45613 () Bool)

(assert (=> b!53886 m!45613))

(declare-fun m!45615 () Bool)

(assert (=> b!53873 m!45615))

(declare-fun m!45617 () Bool)

(assert (=> b!53871 m!45617))

(declare-fun m!45619 () Bool)

(assert (=> b!53876 m!45619))

(declare-fun m!45621 () Bool)

(assert (=> b!53876 m!45621))

(declare-fun m!45623 () Bool)

(assert (=> b!53876 m!45623))

(assert (=> b!53876 m!45601))

(assert (=> b!53876 m!45621))

(assert (=> b!53876 m!45601))

(declare-fun m!45625 () Bool)

(assert (=> b!53876 m!45625))

(assert (=> b!53876 m!45601))

(assert (=> b!53876 m!45623))

(declare-fun m!45627 () Bool)

(assert (=> b!53876 m!45627))

(assert (=> b!53876 m!45619))

(assert (=> b!53882 m!45601))

(assert (=> b!53882 m!45601))

(declare-fun m!45629 () Bool)

(assert (=> b!53882 m!45629))

(declare-fun m!45631 () Bool)

(assert (=> b!53878 m!45631))

(declare-fun m!45633 () Bool)

(assert (=> b!53878 m!45633))

(declare-fun m!45635 () Bool)

(assert (=> mapNonEmpty!2550 m!45635))

(declare-fun m!45637 () Bool)

(assert (=> mapNonEmpty!2549 m!45637))

(declare-fun m!45639 () Bool)

(assert (=> b!53880 m!45639))

(check-sat (not start!8298) (not b!53884) (not b!53873) (not b_next!1753) (not b!53880) (not b!53868) tp_is_empty!2293 b_and!3049 (not b!53886) (not b!53878) (not b!53876) (not b_next!1755) (not mapNonEmpty!2550) (not b!53871) (not b!53882) (not b_lambda!2387) b_and!3051 (not mapNonEmpty!2549))
(check-sat b_and!3049 b_and!3051 (not b_next!1753) (not b_next!1755))
