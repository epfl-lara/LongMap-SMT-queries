; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8298 () Bool)

(assert start!8298)

(declare-fun b!53865 () Bool)

(declare-fun b_free!1753 () Bool)

(declare-fun b_next!1753 () Bool)

(assert (=> b!53865 (= b_free!1753 (not b_next!1753))))

(declare-fun tp!7359 () Bool)

(declare-fun b_and!3049 () Bool)

(assert (=> b!53865 (= tp!7359 b_and!3049)))

(declare-fun b!53859 () Bool)

(declare-fun b_free!1755 () Bool)

(declare-fun b_next!1755 () Bool)

(assert (=> b!53859 (= b_free!1755 (not b_next!1755))))

(declare-fun tp!7362 () Bool)

(declare-fun b_and!3051 () Bool)

(assert (=> b!53859 (= tp!7362 b_and!3051)))

(declare-fun mapIsEmpty!2549 () Bool)

(declare-fun mapRes!2549 () Bool)

(assert (=> mapIsEmpty!2549 mapRes!2549))

(declare-fun tp_is_empty!2293 () Bool)

(declare-datatypes ((V!2705 0))(
  ( (V!2706 (val!1191 Int)) )
))
(declare-datatypes ((array!3489 0))(
  ( (array!3490 (arr!1666 (Array (_ BitVec 32) (_ BitVec 64))) (size!1896 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!803 0))(
  ( (ValueCellFull!803 (v!2267 V!2705)) (EmptyCell!803) )
))
(declare-datatypes ((array!3491 0))(
  ( (array!3492 (arr!1667 (Array (_ BitVec 32) ValueCell!803)) (size!1897 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!514 0))(
  ( (LongMapFixedSize!515 (defaultEntry!1971 Int) (mask!5811 (_ BitVec 32)) (extraKeys!1862 (_ BitVec 32)) (zeroValue!1889 V!2705) (minValue!1889 V!2705) (_size!306 (_ BitVec 32)) (_keys!3590 array!3489) (_values!1954 array!3491) (_vacant!306 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!514)

(declare-fun e!35164 () Bool)

(declare-fun e!35152 () Bool)

(declare-fun array_inv!1025 (array!3489) Bool)

(declare-fun array_inv!1026 (array!3491) Bool)

(assert (=> b!53859 (= e!35152 (and tp!7362 tp_is_empty!2293 (array_inv!1025 (_keys!3590 newMap!16)) (array_inv!1026 (_values!1954 newMap!16)) e!35164))))

(declare-fun b!53860 () Bool)

(declare-fun res!30525 () Bool)

(declare-fun e!35156 () Bool)

(assert (=> b!53860 (=> (not res!30525) (not e!35156))))

(declare-datatypes ((Cell!332 0))(
  ( (Cell!333 (v!2268 LongMapFixedSize!514)) )
))
(declare-datatypes ((LongMap!332 0))(
  ( (LongMap!333 (underlying!177 Cell!332)) )
))
(declare-fun thiss!992 () LongMap!332)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3489 (_ BitVec 32)) Bool)

(assert (=> b!53860 (= res!30525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3590 (v!2268 (underlying!177 thiss!992))) (mask!5811 (v!2268 (underlying!177 thiss!992)))))))

(declare-fun b!53861 () Bool)

(declare-fun res!30528 () Bool)

(assert (=> b!53861 (=> (not res!30528) (not e!35156))))

(declare-datatypes ((List!1370 0))(
  ( (Nil!1367) (Cons!1366 (h!1946 (_ BitVec 64)) (t!4491 List!1370)) )
))
(declare-fun arrayNoDuplicates!0 (array!3489 (_ BitVec 32) List!1370) Bool)

(assert (=> b!53861 (= res!30528 (arrayNoDuplicates!0 (_keys!3590 (v!2268 (underlying!177 thiss!992))) #b00000000000000000000000000000000 Nil!1367))))

(declare-fun mapNonEmpty!2549 () Bool)

(declare-fun tp!7361 () Bool)

(declare-fun e!35150 () Bool)

(assert (=> mapNonEmpty!2549 (= mapRes!2549 (and tp!7361 e!35150))))

(declare-fun mapValue!2550 () ValueCell!803)

(declare-fun mapRest!2549 () (Array (_ BitVec 32) ValueCell!803))

(declare-fun mapKey!2549 () (_ BitVec 32))

(assert (=> mapNonEmpty!2549 (= (arr!1667 (_values!1954 (v!2268 (underlying!177 thiss!992)))) (store mapRest!2549 mapKey!2549 mapValue!2550))))

(declare-fun b!53862 () Bool)

(declare-fun e!35154 () Bool)

(declare-fun mapRes!2550 () Bool)

(assert (=> b!53862 (= e!35164 (and e!35154 mapRes!2550))))

(declare-fun condMapEmpty!2549 () Bool)

(declare-fun mapDefault!2550 () ValueCell!803)

(assert (=> b!53862 (= condMapEmpty!2549 (= (arr!1667 (_values!1954 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!803)) mapDefault!2550)))))

(declare-fun b!53863 () Bool)

(declare-fun res!30531 () Bool)

(declare-fun e!35161 () Bool)

(assert (=> b!53863 (=> (not res!30531) (not e!35161))))

(assert (=> b!53863 (= res!30531 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5811 newMap!16)) (_size!306 (v!2268 (underlying!177 thiss!992)))))))

(declare-fun b!53864 () Bool)

(assert (=> b!53864 (= e!35156 false)))

(declare-fun lt!21542 () Bool)

(declare-datatypes ((tuple2!1916 0))(
  ( (tuple2!1917 (_1!969 (_ BitVec 64)) (_2!969 V!2705)) )
))
(declare-datatypes ((List!1371 0))(
  ( (Nil!1368) (Cons!1367 (h!1947 tuple2!1916) (t!4492 List!1371)) )
))
(declare-datatypes ((ListLongMap!1293 0))(
  ( (ListLongMap!1294 (toList!662 List!1371)) )
))
(declare-fun lt!21540 () ListLongMap!1293)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!637 (ListLongMap!1293 (_ BitVec 64)) Bool)

(assert (=> b!53864 (= lt!21542 (contains!637 lt!21540 (select (arr!1666 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) from!355)))))

(declare-fun e!35162 () Bool)

(declare-fun e!35151 () Bool)

(assert (=> b!53865 (= e!35162 (and tp!7359 tp_is_empty!2293 (array_inv!1025 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) (array_inv!1026 (_values!1954 (v!2268 (underlying!177 thiss!992)))) e!35151))))

(declare-fun b!53866 () Bool)

(declare-fun e!35163 () Bool)

(assert (=> b!53866 (= e!35151 (and e!35163 mapRes!2549))))

(declare-fun condMapEmpty!2550 () Bool)

(declare-fun mapDefault!2549 () ValueCell!803)

(assert (=> b!53866 (= condMapEmpty!2550 (= (arr!1667 (_values!1954 (v!2268 (underlying!177 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!803)) mapDefault!2549)))))

(declare-fun b!53867 () Bool)

(declare-fun e!35153 () Bool)

(assert (=> b!53867 (= e!35153 e!35156)))

(declare-fun res!30533 () Bool)

(assert (=> b!53867 (=> (not res!30533) (not e!35156))))

(declare-fun lt!21539 () ListLongMap!1293)

(assert (=> b!53867 (= res!30533 (contains!637 lt!21539 (select (arr!1666 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1918 0))(
  ( (tuple2!1919 (_1!970 Bool) (_2!970 LongMapFixedSize!514)) )
))
(declare-fun lt!21541 () tuple2!1918)

(declare-fun update!56 (LongMapFixedSize!514 (_ BitVec 64) V!2705) tuple2!1918)

(declare-fun get!1006 (ValueCell!803 V!2705) V!2705)

(declare-fun dynLambda!280 (Int (_ BitVec 64)) V!2705)

(assert (=> b!53867 (= lt!21541 (update!56 newMap!16 (select (arr!1666 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) from!355) (get!1006 (select (arr!1667 (_values!1954 (v!2268 (underlying!177 thiss!992)))) from!355) (dynLambda!280 (defaultEntry!1971 (v!2268 (underlying!177 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!2550 () Bool)

(declare-fun tp!7360 () Bool)

(declare-fun e!35157 () Bool)

(assert (=> mapNonEmpty!2550 (= mapRes!2550 (and tp!7360 e!35157))))

(declare-fun mapRest!2550 () (Array (_ BitVec 32) ValueCell!803))

(declare-fun mapKey!2550 () (_ BitVec 32))

(declare-fun mapValue!2549 () ValueCell!803)

(assert (=> mapNonEmpty!2550 (= (arr!1667 (_values!1954 newMap!16)) (store mapRest!2550 mapKey!2550 mapValue!2549))))

(declare-fun b!53868 () Bool)

(declare-fun res!30534 () Bool)

(assert (=> b!53868 (=> (not res!30534) (not e!35156))))

(assert (=> b!53868 (= res!30534 (and (= (size!1897 (_values!1954 (v!2268 (underlying!177 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5811 (v!2268 (underlying!177 thiss!992))))) (= (size!1896 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) (size!1897 (_values!1954 (v!2268 (underlying!177 thiss!992))))) (bvsge (mask!5811 (v!2268 (underlying!177 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1862 (v!2268 (underlying!177 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1862 (v!2268 (underlying!177 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53869 () Bool)

(assert (=> b!53869 (= e!35150 tp_is_empty!2293)))

(declare-fun b!53870 () Bool)

(assert (=> b!53870 (= e!35163 tp_is_empty!2293)))

(declare-fun b!53871 () Bool)

(declare-fun e!35158 () Bool)

(assert (=> b!53871 (= e!35158 e!35162)))

(declare-fun b!53872 () Bool)

(declare-fun res!30529 () Bool)

(assert (=> b!53872 (=> (not res!30529) (not e!35161))))

(declare-fun valid!197 (LongMapFixedSize!514) Bool)

(assert (=> b!53872 (= res!30529 (valid!197 newMap!16))))

(declare-fun b!53873 () Bool)

(declare-fun e!35159 () Bool)

(assert (=> b!53873 (= e!35159 e!35158)))

(declare-fun b!53874 () Bool)

(declare-fun res!30527 () Bool)

(assert (=> b!53874 (=> (not res!30527) (not e!35156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53874 (= res!30527 (validMask!0 (mask!5811 (v!2268 (underlying!177 thiss!992)))))))

(declare-fun b!53875 () Bool)

(assert (=> b!53875 (= e!35157 tp_is_empty!2293)))

(declare-fun b!53876 () Bool)

(declare-fun res!30532 () Bool)

(assert (=> b!53876 (=> (not res!30532) (not e!35156))))

(assert (=> b!53876 (= res!30532 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1896 (_keys!3590 (v!2268 (underlying!177 thiss!992)))))))))

(declare-fun mapIsEmpty!2550 () Bool)

(assert (=> mapIsEmpty!2550 mapRes!2550))

(declare-fun res!30530 () Bool)

(assert (=> start!8298 (=> (not res!30530) (not e!35161))))

(declare-fun valid!198 (LongMap!332) Bool)

(assert (=> start!8298 (= res!30530 (valid!198 thiss!992))))

(assert (=> start!8298 e!35161))

(assert (=> start!8298 e!35159))

(assert (=> start!8298 true))

(assert (=> start!8298 e!35152))

(declare-fun b!53877 () Bool)

(assert (=> b!53877 (= e!35154 tp_is_empty!2293)))

(declare-fun b!53878 () Bool)

(declare-fun res!30524 () Bool)

(assert (=> b!53878 (=> (not res!30524) (not e!35161))))

(assert (=> b!53878 (= res!30524 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1896 (_keys!3590 (v!2268 (underlying!177 thiss!992)))))))))

(declare-fun b!53879 () Bool)

(assert (=> b!53879 (= e!35161 e!35153)))

(declare-fun res!30526 () Bool)

(assert (=> b!53879 (=> (not res!30526) (not e!35153))))

(assert (=> b!53879 (= res!30526 (and (= lt!21540 lt!21539) (not (= (select (arr!1666 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1666 (_keys!3590 (v!2268 (underlying!177 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1045 (LongMapFixedSize!514) ListLongMap!1293)

(assert (=> b!53879 (= lt!21539 (map!1045 newMap!16))))

(declare-fun getCurrentListMap!365 (array!3489 array!3491 (_ BitVec 32) (_ BitVec 32) V!2705 V!2705 (_ BitVec 32) Int) ListLongMap!1293)

(assert (=> b!53879 (= lt!21540 (getCurrentListMap!365 (_keys!3590 (v!2268 (underlying!177 thiss!992))) (_values!1954 (v!2268 (underlying!177 thiss!992))) (mask!5811 (v!2268 (underlying!177 thiss!992))) (extraKeys!1862 (v!2268 (underlying!177 thiss!992))) (zeroValue!1889 (v!2268 (underlying!177 thiss!992))) (minValue!1889 (v!2268 (underlying!177 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1971 (v!2268 (underlying!177 thiss!992)))))))

(assert (= (and start!8298 res!30530) b!53878))

(assert (= (and b!53878 res!30524) b!53872))

(assert (= (and b!53872 res!30529) b!53863))

(assert (= (and b!53863 res!30531) b!53879))

(assert (= (and b!53879 res!30526) b!53867))

(assert (= (and b!53867 res!30533) b!53874))

(assert (= (and b!53874 res!30527) b!53868))

(assert (= (and b!53868 res!30534) b!53860))

(assert (= (and b!53860 res!30525) b!53861))

(assert (= (and b!53861 res!30528) b!53876))

(assert (= (and b!53876 res!30532) b!53864))

(assert (= (and b!53866 condMapEmpty!2550) mapIsEmpty!2549))

(assert (= (and b!53866 (not condMapEmpty!2550)) mapNonEmpty!2549))

(get-info :version)

(assert (= (and mapNonEmpty!2549 ((_ is ValueCellFull!803) mapValue!2550)) b!53869))

(assert (= (and b!53866 ((_ is ValueCellFull!803) mapDefault!2549)) b!53870))

(assert (= b!53865 b!53866))

(assert (= b!53871 b!53865))

(assert (= b!53873 b!53871))

(assert (= start!8298 b!53873))

(assert (= (and b!53862 condMapEmpty!2549) mapIsEmpty!2550))

(assert (= (and b!53862 (not condMapEmpty!2549)) mapNonEmpty!2550))

(assert (= (and mapNonEmpty!2550 ((_ is ValueCellFull!803) mapValue!2549)) b!53875))

(assert (= (and b!53862 ((_ is ValueCellFull!803) mapDefault!2550)) b!53877))

(assert (= b!53859 b!53862))

(assert (= start!8298 b!53859))

(declare-fun b_lambda!2391 () Bool)

(assert (=> (not b_lambda!2391) (not b!53867)))

(declare-fun t!4488 () Bool)

(declare-fun tb!1097 () Bool)

(assert (=> (and b!53865 (= (defaultEntry!1971 (v!2268 (underlying!177 thiss!992))) (defaultEntry!1971 (v!2268 (underlying!177 thiss!992)))) t!4488) tb!1097))

(declare-fun result!2043 () Bool)

(assert (=> tb!1097 (= result!2043 tp_is_empty!2293)))

(assert (=> b!53867 t!4488))

(declare-fun b_and!3053 () Bool)

(assert (= b_and!3049 (and (=> t!4488 result!2043) b_and!3053)))

(declare-fun tb!1099 () Bool)

(declare-fun t!4490 () Bool)

(assert (=> (and b!53859 (= (defaultEntry!1971 newMap!16) (defaultEntry!1971 (v!2268 (underlying!177 thiss!992)))) t!4490) tb!1099))

(declare-fun result!2047 () Bool)

(assert (= result!2047 result!2043))

(assert (=> b!53867 t!4490))

(declare-fun b_and!3055 () Bool)

(assert (= b_and!3051 (and (=> t!4490 result!2047) b_and!3055)))

(declare-fun m!45643 () Bool)

(assert (=> b!53864 m!45643))

(assert (=> b!53864 m!45643))

(declare-fun m!45645 () Bool)

(assert (=> b!53864 m!45645))

(declare-fun m!45647 () Bool)

(assert (=> b!53874 m!45647))

(declare-fun m!45649 () Bool)

(assert (=> b!53859 m!45649))

(declare-fun m!45651 () Bool)

(assert (=> b!53859 m!45651))

(declare-fun m!45653 () Bool)

(assert (=> b!53867 m!45653))

(declare-fun m!45655 () Bool)

(assert (=> b!53867 m!45655))

(declare-fun m!45657 () Bool)

(assert (=> b!53867 m!45657))

(assert (=> b!53867 m!45643))

(declare-fun m!45659 () Bool)

(assert (=> b!53867 m!45659))

(assert (=> b!53867 m!45643))

(assert (=> b!53867 m!45655))

(assert (=> b!53867 m!45643))

(assert (=> b!53867 m!45657))

(declare-fun m!45661 () Bool)

(assert (=> b!53867 m!45661))

(assert (=> b!53867 m!45653))

(declare-fun m!45663 () Bool)

(assert (=> mapNonEmpty!2550 m!45663))

(declare-fun m!45665 () Bool)

(assert (=> b!53872 m!45665))

(declare-fun m!45667 () Bool)

(assert (=> b!53861 m!45667))

(declare-fun m!45669 () Bool)

(assert (=> b!53865 m!45669))

(declare-fun m!45671 () Bool)

(assert (=> b!53865 m!45671))

(declare-fun m!45673 () Bool)

(assert (=> mapNonEmpty!2549 m!45673))

(declare-fun m!45675 () Bool)

(assert (=> start!8298 m!45675))

(assert (=> b!53879 m!45643))

(declare-fun m!45677 () Bool)

(assert (=> b!53879 m!45677))

(declare-fun m!45679 () Bool)

(assert (=> b!53879 m!45679))

(declare-fun m!45681 () Bool)

(assert (=> b!53860 m!45681))

(check-sat b_and!3053 (not b!53872) tp_is_empty!2293 (not start!8298) (not b!53860) (not b_next!1753) (not b!53861) (not b_lambda!2391) (not b!53867) (not b!53859) b_and!3055 (not b!53864) (not mapNonEmpty!2550) (not mapNonEmpty!2549) (not b!53879) (not b!53865) (not b!53874) (not b_next!1755))
(check-sat b_and!3053 b_and!3055 (not b_next!1753) (not b_next!1755))
