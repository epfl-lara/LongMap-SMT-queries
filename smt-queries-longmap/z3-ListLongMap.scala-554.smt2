; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14884 () Bool)

(assert start!14884)

(declare-fun b!143013 () Bool)

(declare-fun b_free!3037 () Bool)

(declare-fun b_next!3037 () Bool)

(assert (=> b!143013 (= b_free!3037 (not b_next!3037))))

(declare-fun tp!11594 () Bool)

(declare-fun b_and!8917 () Bool)

(assert (=> b!143013 (= tp!11594 b_and!8917)))

(declare-fun b!143006 () Bool)

(declare-fun b_free!3039 () Bool)

(declare-fun b_next!3039 () Bool)

(assert (=> b!143006 (= b_free!3039 (not b_next!3039))))

(declare-fun tp!11591 () Bool)

(declare-fun b_and!8919 () Bool)

(assert (=> b!143006 (= tp!11591 b_and!8919)))

(declare-fun b!142999 () Bool)

(declare-fun res!68147 () Bool)

(declare-fun e!93190 () Bool)

(assert (=> b!142999 (=> (not res!68147) (not e!93190))))

(declare-datatypes ((V!3561 0))(
  ( (V!3562 (val!1512 Int)) )
))
(declare-datatypes ((array!4893 0))(
  ( (array!4894 (arr!2312 (Array (_ BitVec 32) (_ BitVec 64))) (size!2585 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1124 0))(
  ( (ValueCellFull!1124 (v!3295 V!3561)) (EmptyCell!1124) )
))
(declare-datatypes ((array!4895 0))(
  ( (array!4896 (arr!2313 (Array (_ BitVec 32) ValueCell!1124)) (size!2586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1156 0))(
  ( (LongMapFixedSize!1157 (defaultEntry!2962 Int) (mask!7314 (_ BitVec 32)) (extraKeys!2713 (_ BitVec 32)) (zeroValue!2810 V!3561) (minValue!2810 V!3561) (_size!627 (_ BitVec 32)) (_keys!4725 array!4893) (_values!2945 array!4895) (_vacant!627 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1156)

(declare-datatypes ((Cell!942 0))(
  ( (Cell!943 (v!3296 LongMapFixedSize!1156)) )
))
(declare-datatypes ((LongMap!942 0))(
  ( (LongMap!943 (underlying!482 Cell!942)) )
))
(declare-fun thiss!992 () LongMap!942)

(assert (=> b!142999 (= res!68147 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7314 newMap!16)) (_size!627 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143000 () Bool)

(declare-fun e!93191 () Bool)

(declare-fun e!93184 () Bool)

(declare-fun mapRes!4856 () Bool)

(assert (=> b!143000 (= e!93191 (and e!93184 mapRes!4856))))

(declare-fun condMapEmpty!4856 () Bool)

(declare-fun mapDefault!4855 () ValueCell!1124)

(assert (=> b!143000 (= condMapEmpty!4856 (= (arr!2313 (_values!2945 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4855)))))

(declare-fun mapNonEmpty!4855 () Bool)

(declare-fun tp!11592 () Bool)

(declare-fun e!93180 () Bool)

(assert (=> mapNonEmpty!4855 (= mapRes!4856 (and tp!11592 e!93180))))

(declare-fun mapValue!4855 () ValueCell!1124)

(declare-fun mapKey!4856 () (_ BitVec 32))

(declare-fun mapRest!4855 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4855 (= (arr!2313 (_values!2945 newMap!16)) (store mapRest!4855 mapKey!4856 mapValue!4855))))

(declare-fun b!143001 () Bool)

(declare-fun res!68148 () Bool)

(assert (=> b!143001 (=> (not res!68148) (not e!93190))))

(declare-fun valid!571 (LongMapFixedSize!1156) Bool)

(assert (=> b!143001 (= res!68148 (valid!571 newMap!16))))

(declare-fun b!143002 () Bool)

(declare-fun e!93177 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1724 0))(
  ( (Nil!1721) (Cons!1720 (h!2328 (_ BitVec 64)) (t!6325 List!1724)) )
))
(declare-fun noDuplicate!48 (List!1724) Bool)

(assert (=> b!143002 (= e!93177 (noDuplicate!48 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)))))

(declare-fun b!143003 () Bool)

(declare-fun e!93181 () Bool)

(declare-fun e!93176 () Bool)

(assert (=> b!143003 (= e!93181 e!93176)))

(declare-fun b!143004 () Bool)

(declare-fun tp_is_empty!2935 () Bool)

(assert (=> b!143004 (= e!93180 tp_is_empty!2935)))

(declare-fun mapIsEmpty!4855 () Bool)

(assert (=> mapIsEmpty!4855 mapRes!4856))

(declare-fun e!93188 () Bool)

(declare-fun array_inv!1443 (array!4893) Bool)

(declare-fun array_inv!1444 (array!4895) Bool)

(assert (=> b!143006 (= e!93188 (and tp!11591 tp_is_empty!2935 (array_inv!1443 (_keys!4725 newMap!16)) (array_inv!1444 (_values!2945 newMap!16)) e!93191))))

(declare-fun b!143007 () Bool)

(declare-fun e!93178 () Bool)

(declare-fun e!93189 () Bool)

(assert (=> b!143007 (= e!93178 e!93189)))

(declare-fun res!68145 () Bool)

(assert (=> b!143007 (=> (not res!68145) (not e!93189))))

(declare-datatypes ((tuple2!2630 0))(
  ( (tuple2!2631 (_1!1326 (_ BitVec 64)) (_2!1326 V!3561)) )
))
(declare-datatypes ((List!1725 0))(
  ( (Nil!1722) (Cons!1721 (h!2329 tuple2!2630) (t!6326 List!1725)) )
))
(declare-datatypes ((ListLongMap!1689 0))(
  ( (ListLongMap!1690 (toList!860 List!1725)) )
))
(declare-fun lt!74898 () ListLongMap!1689)

(declare-fun contains!908 (ListLongMap!1689 (_ BitVec 64)) Bool)

(assert (=> b!143007 (= res!68145 (contains!908 lt!74898 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2632 0))(
  ( (tuple2!2633 (_1!1327 Bool) (_2!1327 LongMapFixedSize!1156)) )
))
(declare-fun lt!74902 () tuple2!2632)

(declare-fun update!211 (LongMapFixedSize!1156 (_ BitVec 64) V!3561) tuple2!2632)

(declare-fun get!1538 (ValueCell!1124 V!3561) V!3561)

(declare-fun dynLambda!441 (Int (_ BitVec 64)) V!3561)

(assert (=> b!143007 (= lt!74902 (update!211 newMap!16 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143008 () Bool)

(assert (=> b!143008 (= e!93184 tp_is_empty!2935)))

(declare-fun b!143009 () Bool)

(assert (=> b!143009 (= e!93190 e!93178)))

(declare-fun res!68149 () Bool)

(assert (=> b!143009 (=> (not res!68149) (not e!93178))))

(declare-fun lt!74901 () ListLongMap!1689)

(assert (=> b!143009 (= res!68149 (and (= lt!74901 lt!74898) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1433 (LongMapFixedSize!1156) ListLongMap!1689)

(assert (=> b!143009 (= lt!74898 (map!1433 newMap!16))))

(declare-fun getCurrentListMap!533 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) ListLongMap!1689)

(assert (=> b!143009 (= lt!74901 (getCurrentListMap!533 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143010 () Bool)

(assert (=> b!143010 (= e!93189 (not e!93177))))

(declare-fun res!68146 () Bool)

(assert (=> b!143010 (=> res!68146 e!93177)))

(assert (=> b!143010 (= res!68146 (or (bvsge (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun arrayNoDuplicates!0 (array!4893 (_ BitVec 32) List!1724) Bool)

(assert (=> b!143010 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) from!355 Nil!1721)))

(declare-datatypes ((Unit!4532 0))(
  ( (Unit!4533) )
))
(declare-fun lt!74900 () Unit!4532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4893 (_ BitVec 32) (_ BitVec 32)) Unit!4532)

(assert (=> b!143010 (= lt!74900 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143010 (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!74899 () Unit!4532)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!142 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4532)

(assert (=> b!143010 (= lt!74899 (lemmaListMapContainsThenArrayContainsFrom!142 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143011 () Bool)

(declare-fun e!93182 () Bool)

(assert (=> b!143011 (= e!93182 tp_is_empty!2935)))

(declare-fun b!143012 () Bool)

(declare-fun e!93186 () Bool)

(assert (=> b!143012 (= e!93186 e!93181)))

(declare-fun mapIsEmpty!4856 () Bool)

(declare-fun mapRes!4855 () Bool)

(assert (=> mapIsEmpty!4856 mapRes!4855))

(declare-fun e!93185 () Bool)

(assert (=> b!143013 (= e!93176 (and tp!11594 tp_is_empty!2935 (array_inv!1443 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (array_inv!1444 (_values!2945 (v!3296 (underlying!482 thiss!992)))) e!93185))))

(declare-fun b!143014 () Bool)

(assert (=> b!143014 (= e!93185 (and e!93182 mapRes!4855))))

(declare-fun condMapEmpty!4855 () Bool)

(declare-fun mapDefault!4856 () ValueCell!1124)

(assert (=> b!143014 (= condMapEmpty!4855 (= (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4856)))))

(declare-fun mapNonEmpty!4856 () Bool)

(declare-fun tp!11593 () Bool)

(declare-fun e!93179 () Bool)

(assert (=> mapNonEmpty!4856 (= mapRes!4855 (and tp!11593 e!93179))))

(declare-fun mapKey!4855 () (_ BitVec 32))

(declare-fun mapRest!4856 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapValue!4856 () ValueCell!1124)

(assert (=> mapNonEmpty!4856 (= (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (store mapRest!4856 mapKey!4855 mapValue!4856))))

(declare-fun b!143015 () Bool)

(declare-fun res!68150 () Bool)

(assert (=> b!143015 (=> (not res!68150) (not e!93190))))

(assert (=> b!143015 (= res!68150 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun b!143005 () Bool)

(assert (=> b!143005 (= e!93179 tp_is_empty!2935)))

(declare-fun res!68151 () Bool)

(assert (=> start!14884 (=> (not res!68151) (not e!93190))))

(declare-fun valid!572 (LongMap!942) Bool)

(assert (=> start!14884 (= res!68151 (valid!572 thiss!992))))

(assert (=> start!14884 e!93190))

(assert (=> start!14884 e!93186))

(assert (=> start!14884 true))

(assert (=> start!14884 e!93188))

(assert (= (and start!14884 res!68151) b!143015))

(assert (= (and b!143015 res!68150) b!143001))

(assert (= (and b!143001 res!68148) b!142999))

(assert (= (and b!142999 res!68147) b!143009))

(assert (= (and b!143009 res!68149) b!143007))

(assert (= (and b!143007 res!68145) b!143010))

(assert (= (and b!143010 (not res!68146)) b!143002))

(assert (= (and b!143014 condMapEmpty!4855) mapIsEmpty!4856))

(assert (= (and b!143014 (not condMapEmpty!4855)) mapNonEmpty!4856))

(get-info :version)

(assert (= (and mapNonEmpty!4856 ((_ is ValueCellFull!1124) mapValue!4856)) b!143005))

(assert (= (and b!143014 ((_ is ValueCellFull!1124) mapDefault!4856)) b!143011))

(assert (= b!143013 b!143014))

(assert (= b!143003 b!143013))

(assert (= b!143012 b!143003))

(assert (= start!14884 b!143012))

(assert (= (and b!143000 condMapEmpty!4856) mapIsEmpty!4855))

(assert (= (and b!143000 (not condMapEmpty!4856)) mapNonEmpty!4855))

(assert (= (and mapNonEmpty!4855 ((_ is ValueCellFull!1124) mapValue!4855)) b!143004))

(assert (= (and b!143000 ((_ is ValueCellFull!1124) mapDefault!4855)) b!143008))

(assert (= b!143006 b!143000))

(assert (= start!14884 b!143006))

(declare-fun b_lambda!6437 () Bool)

(assert (=> (not b_lambda!6437) (not b!143007)))

(declare-fun t!6322 () Bool)

(declare-fun tb!2561 () Bool)

(assert (=> (and b!143013 (= (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) t!6322) tb!2561))

(declare-fun result!4199 () Bool)

(assert (=> tb!2561 (= result!4199 tp_is_empty!2935)))

(assert (=> b!143007 t!6322))

(declare-fun b_and!8921 () Bool)

(assert (= b_and!8917 (and (=> t!6322 result!4199) b_and!8921)))

(declare-fun t!6324 () Bool)

(declare-fun tb!2563 () Bool)

(assert (=> (and b!143006 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) t!6324) tb!2563))

(declare-fun result!4203 () Bool)

(assert (= result!4203 result!4199))

(assert (=> b!143007 t!6324))

(declare-fun b_and!8923 () Bool)

(assert (= b_and!8919 (and (=> t!6324 result!4203) b_and!8923)))

(declare-fun m!172677 () Bool)

(assert (=> b!143009 m!172677))

(declare-fun m!172679 () Bool)

(assert (=> b!143009 m!172679))

(declare-fun m!172681 () Bool)

(assert (=> b!143009 m!172681))

(declare-fun m!172683 () Bool)

(assert (=> b!143006 m!172683))

(declare-fun m!172685 () Bool)

(assert (=> b!143006 m!172685))

(declare-fun m!172687 () Bool)

(assert (=> start!14884 m!172687))

(declare-fun m!172689 () Bool)

(assert (=> mapNonEmpty!4856 m!172689))

(declare-fun m!172691 () Bool)

(assert (=> b!143013 m!172691))

(declare-fun m!172693 () Bool)

(assert (=> b!143013 m!172693))

(declare-fun m!172695 () Bool)

(assert (=> b!143001 m!172695))

(declare-fun m!172697 () Bool)

(assert (=> b!143010 m!172697))

(declare-fun m!172699 () Bool)

(assert (=> b!143010 m!172699))

(assert (=> b!143010 m!172677))

(declare-fun m!172701 () Bool)

(assert (=> b!143010 m!172701))

(assert (=> b!143010 m!172677))

(assert (=> b!143010 m!172677))

(declare-fun m!172703 () Bool)

(assert (=> b!143010 m!172703))

(assert (=> b!143002 m!172677))

(declare-fun m!172705 () Bool)

(assert (=> b!143002 m!172705))

(assert (=> b!143007 m!172677))

(declare-fun m!172707 () Bool)

(assert (=> b!143007 m!172707))

(declare-fun m!172709 () Bool)

(assert (=> b!143007 m!172709))

(declare-fun m!172711 () Bool)

(assert (=> b!143007 m!172711))

(declare-fun m!172713 () Bool)

(assert (=> b!143007 m!172713))

(assert (=> b!143007 m!172677))

(assert (=> b!143007 m!172711))

(assert (=> b!143007 m!172677))

(assert (=> b!143007 m!172713))

(declare-fun m!172715 () Bool)

(assert (=> b!143007 m!172715))

(assert (=> b!143007 m!172709))

(declare-fun m!172717 () Bool)

(assert (=> mapNonEmpty!4855 m!172717))

(check-sat (not b_next!3039) (not mapNonEmpty!4855) (not b!143009) b_and!8923 (not mapNonEmpty!4856) tp_is_empty!2935 (not b!143006) (not b!143007) (not b!143002) (not b_next!3037) (not b!143013) (not b!143010) (not b!143001) (not b_lambda!6437) b_and!8921 (not start!14884))
(check-sat b_and!8921 b_and!8923 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun b_lambda!6443 () Bool)

(assert (= b_lambda!6437 (or (and b!143013 b_free!3037) (and b!143006 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))))) b_lambda!6443)))

(check-sat (not b_next!3039) (not mapNonEmpty!4855) (not b!143009) b_and!8923 (not mapNonEmpty!4856) tp_is_empty!2935 (not b!143001) (not b!143006) (not b!143007) (not b_lambda!6443) (not b!143002) (not b_next!3037) (not b!143013) (not b!143010) b_and!8921 (not start!14884))
(check-sat b_and!8921 b_and!8923 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun d!45773 () Bool)

(assert (=> d!45773 (= (map!1433 newMap!16) (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun bs!6070 () Bool)

(assert (= bs!6070 d!45773))

(declare-fun m!172803 () Bool)

(assert (=> bs!6070 m!172803))

(assert (=> b!143009 d!45773))

(declare-fun b!143166 () Bool)

(declare-fun res!68212 () Bool)

(declare-fun e!93322 () Bool)

(assert (=> b!143166 (=> (not res!68212) (not e!93322))))

(declare-fun e!93315 () Bool)

(assert (=> b!143166 (= res!68212 e!93315)))

(declare-fun res!68220 () Bool)

(assert (=> b!143166 (=> res!68220 e!93315)))

(declare-fun e!93318 () Bool)

(assert (=> b!143166 (= res!68220 (not e!93318))))

(declare-fun res!68217 () Bool)

(assert (=> b!143166 (=> (not res!68217) (not e!93318))))

(assert (=> b!143166 (= res!68217 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143167 () Bool)

(declare-fun e!93316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!143167 (= e!93316 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143168 () Bool)

(declare-fun e!93314 () ListLongMap!1689)

(declare-fun call!15804 () ListLongMap!1689)

(assert (=> b!143168 (= e!93314 call!15804)))

(declare-fun bm!15799 () Bool)

(declare-fun call!15806 () ListLongMap!1689)

(declare-fun getCurrentListMapNoExtraKeys!141 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) ListLongMap!1689)

(assert (=> bm!15799 (= call!15806 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143169 () Bool)

(declare-fun e!93320 () ListLongMap!1689)

(assert (=> b!143169 (= e!93320 call!15804)))

(declare-fun b!143170 () Bool)

(declare-fun e!93325 () Bool)

(declare-fun lt!74977 () ListLongMap!1689)

(declare-fun apply!121 (ListLongMap!1689 (_ BitVec 64)) V!3561)

(assert (=> b!143170 (= e!93325 (= (apply!121 lt!74977 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143171 () Bool)

(assert (=> b!143171 (= e!93318 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143172 () Bool)

(declare-fun e!93319 () Unit!4532)

(declare-fun Unit!4536 () Unit!4532)

(assert (=> b!143172 (= e!93319 Unit!4536)))

(declare-fun b!143173 () Bool)

(declare-fun e!93321 () Bool)

(assert (=> b!143173 (= e!93322 e!93321)))

(declare-fun c!27077 () Bool)

(assert (=> b!143173 (= c!27077 (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143174 () Bool)

(declare-fun e!93323 () Bool)

(assert (=> b!143174 (= e!93323 (= (apply!121 lt!74977 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143175 () Bool)

(declare-fun e!93326 () Bool)

(assert (=> b!143175 (= e!93315 e!93326)))

(declare-fun res!68213 () Bool)

(assert (=> b!143175 (=> (not res!68213) (not e!93326))))

(assert (=> b!143175 (= res!68213 (contains!908 lt!74977 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143175 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143176 () Bool)

(declare-fun res!68215 () Bool)

(assert (=> b!143176 (=> (not res!68215) (not e!93322))))

(declare-fun e!93317 () Bool)

(assert (=> b!143176 (= res!68215 e!93317)))

(declare-fun c!27080 () Bool)

(assert (=> b!143176 (= c!27080 (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143177 () Bool)

(declare-fun call!15808 () Bool)

(assert (=> b!143177 (= e!93321 (not call!15808))))

(declare-fun bm!15800 () Bool)

(declare-fun call!15807 () ListLongMap!1689)

(assert (=> bm!15800 (= call!15804 call!15807)))

(declare-fun b!143178 () Bool)

(assert (=> b!143178 (= e!93321 e!93323)))

(declare-fun res!68216 () Bool)

(assert (=> b!143178 (= res!68216 call!15808)))

(assert (=> b!143178 (=> (not res!68216) (not e!93323))))

(declare-fun b!143179 () Bool)

(declare-fun c!27079 () Bool)

(assert (=> b!143179 (= c!27079 (and (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143179 (= e!93320 e!93314)))

(declare-fun bm!15801 () Bool)

(declare-fun call!15805 () ListLongMap!1689)

(declare-fun c!27078 () Bool)

(declare-fun call!15803 () ListLongMap!1689)

(declare-fun c!27076 () Bool)

(declare-fun +!174 (ListLongMap!1689 tuple2!2630) ListLongMap!1689)

(assert (=> bm!15801 (= call!15807 (+!174 (ite c!27078 call!15806 (ite c!27076 call!15803 call!15805)) (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun b!143180 () Bool)

(assert (=> b!143180 (= e!93326 (= (apply!121 lt!74977 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143180 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2586 (_values!2945 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> b!143180 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun d!45775 () Bool)

(assert (=> d!45775 e!93322))

(declare-fun res!68219 () Bool)

(assert (=> d!45775 (=> (not res!68219) (not e!93322))))

(assert (=> d!45775 (= res!68219 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun lt!74982 () ListLongMap!1689)

(assert (=> d!45775 (= lt!74977 lt!74982)))

(declare-fun lt!74996 () Unit!4532)

(assert (=> d!45775 (= lt!74996 e!93319)))

(declare-fun c!27081 () Bool)

(assert (=> d!45775 (= c!27081 e!93316)))

(declare-fun res!68218 () Bool)

(assert (=> d!45775 (=> (not res!68218) (not e!93316))))

(assert (=> d!45775 (= res!68218 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun e!93324 () ListLongMap!1689)

(assert (=> d!45775 (= lt!74982 e!93324)))

(assert (=> d!45775 (= c!27078 (and (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45775 (validMask!0 (mask!7314 (v!3296 (underlying!482 thiss!992))))))

(assert (=> d!45775 (= (getCurrentListMap!533 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) lt!74977)))

(declare-fun b!143181 () Bool)

(assert (=> b!143181 (= e!93317 e!93325)))

(declare-fun res!68214 () Bool)

(declare-fun call!15802 () Bool)

(assert (=> b!143181 (= res!68214 call!15802)))

(assert (=> b!143181 (=> (not res!68214) (not e!93325))))

(declare-fun bm!15802 () Bool)

(assert (=> bm!15802 (= call!15803 call!15806)))

(declare-fun b!143182 () Bool)

(assert (=> b!143182 (= e!93317 (not call!15802))))

(declare-fun bm!15803 () Bool)

(assert (=> bm!15803 (= call!15802 (contains!908 lt!74977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143183 () Bool)

(assert (=> b!143183 (= e!93324 (+!174 call!15807 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143184 () Bool)

(assert (=> b!143184 (= e!93324 e!93320)))

(assert (=> b!143184 (= c!27076 (and (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143185 () Bool)

(assert (=> b!143185 (= e!93314 call!15805)))

(declare-fun bm!15804 () Bool)

(assert (=> bm!15804 (= call!15805 call!15803)))

(declare-fun bm!15805 () Bool)

(assert (=> bm!15805 (= call!15808 (contains!908 lt!74977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143186 () Bool)

(declare-fun lt!74989 () Unit!4532)

(assert (=> b!143186 (= e!93319 lt!74989)))

(declare-fun lt!74995 () ListLongMap!1689)

(assert (=> b!143186 (= lt!74995 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun lt!74991 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74987 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74987 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74988 () Unit!4532)

(declare-fun addStillContains!97 (ListLongMap!1689 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4532)

(assert (=> b!143186 (= lt!74988 (addStillContains!97 lt!74995 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74987))))

(assert (=> b!143186 (contains!908 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74987)))

(declare-fun lt!74994 () Unit!4532)

(assert (=> b!143186 (= lt!74994 lt!74988)))

(declare-fun lt!74983 () ListLongMap!1689)

(assert (=> b!143186 (= lt!74983 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun lt!74981 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74978 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74978 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74992 () Unit!4532)

(declare-fun addApplyDifferent!97 (ListLongMap!1689 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4532)

(assert (=> b!143186 (= lt!74992 (addApplyDifferent!97 lt!74983 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74978))))

(assert (=> b!143186 (= (apply!121 (+!174 lt!74983 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74978) (apply!121 lt!74983 lt!74978))))

(declare-fun lt!74984 () Unit!4532)

(assert (=> b!143186 (= lt!74984 lt!74992)))

(declare-fun lt!74979 () ListLongMap!1689)

(assert (=> b!143186 (= lt!74979 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun lt!74998 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74998 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74985 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74985 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!74993 () Unit!4532)

(assert (=> b!143186 (= lt!74993 (addApplyDifferent!97 lt!74979 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74985))))

(assert (=> b!143186 (= (apply!121 (+!174 lt!74979 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74985) (apply!121 lt!74979 lt!74985))))

(declare-fun lt!74986 () Unit!4532)

(assert (=> b!143186 (= lt!74986 lt!74993)))

(declare-fun lt!74990 () ListLongMap!1689)

(assert (=> b!143186 (= lt!74990 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun lt!74997 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74980 () (_ BitVec 64))

(assert (=> b!143186 (= lt!74980 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!143186 (= lt!74989 (addApplyDifferent!97 lt!74990 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74980))))

(assert (=> b!143186 (= (apply!121 (+!174 lt!74990 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74980) (apply!121 lt!74990 lt!74980))))

(assert (= (and d!45775 c!27078) b!143183))

(assert (= (and d!45775 (not c!27078)) b!143184))

(assert (= (and b!143184 c!27076) b!143169))

(assert (= (and b!143184 (not c!27076)) b!143179))

(assert (= (and b!143179 c!27079) b!143168))

(assert (= (and b!143179 (not c!27079)) b!143185))

(assert (= (or b!143168 b!143185) bm!15804))

(assert (= (or b!143169 bm!15804) bm!15802))

(assert (= (or b!143169 b!143168) bm!15800))

(assert (= (or b!143183 bm!15802) bm!15799))

(assert (= (or b!143183 bm!15800) bm!15801))

(assert (= (and d!45775 res!68218) b!143167))

(assert (= (and d!45775 c!27081) b!143186))

(assert (= (and d!45775 (not c!27081)) b!143172))

(assert (= (and d!45775 res!68219) b!143166))

(assert (= (and b!143166 res!68217) b!143171))

(assert (= (and b!143166 (not res!68220)) b!143175))

(assert (= (and b!143175 res!68213) b!143180))

(assert (= (and b!143166 res!68212) b!143176))

(assert (= (and b!143176 c!27080) b!143181))

(assert (= (and b!143176 (not c!27080)) b!143182))

(assert (= (and b!143181 res!68214) b!143170))

(assert (= (or b!143181 b!143182) bm!15803))

(assert (= (and b!143176 res!68215) b!143173))

(assert (= (and b!143173 c!27077) b!143178))

(assert (= (and b!143173 (not c!27077)) b!143177))

(assert (= (and b!143178 res!68216) b!143174))

(assert (= (or b!143178 b!143177) bm!15805))

(declare-fun b_lambda!6445 () Bool)

(assert (=> (not b_lambda!6445) (not b!143180)))

(assert (=> b!143180 t!6322))

(declare-fun b_and!8941 () Bool)

(assert (= b_and!8921 (and (=> t!6322 result!4199) b_and!8941)))

(assert (=> b!143180 t!6324))

(declare-fun b_and!8943 () Bool)

(assert (= b_and!8923 (and (=> t!6324 result!4203) b_and!8943)))

(declare-fun m!172805 () Bool)

(assert (=> d!45775 m!172805))

(declare-fun m!172807 () Bool)

(assert (=> bm!15805 m!172807))

(declare-fun m!172809 () Bool)

(assert (=> b!143170 m!172809))

(declare-fun m!172811 () Bool)

(assert (=> bm!15803 m!172811))

(declare-fun m!172813 () Bool)

(assert (=> b!143183 m!172813))

(declare-fun m!172815 () Bool)

(assert (=> b!143175 m!172815))

(assert (=> b!143175 m!172815))

(declare-fun m!172817 () Bool)

(assert (=> b!143175 m!172817))

(declare-fun m!172819 () Bool)

(assert (=> b!143180 m!172819))

(assert (=> b!143180 m!172819))

(assert (=> b!143180 m!172711))

(declare-fun m!172821 () Bool)

(assert (=> b!143180 m!172821))

(assert (=> b!143180 m!172815))

(declare-fun m!172823 () Bool)

(assert (=> b!143180 m!172823))

(assert (=> b!143180 m!172815))

(assert (=> b!143180 m!172711))

(declare-fun m!172825 () Bool)

(assert (=> b!143186 m!172825))

(declare-fun m!172827 () Bool)

(assert (=> b!143186 m!172827))

(declare-fun m!172829 () Bool)

(assert (=> b!143186 m!172829))

(declare-fun m!172831 () Bool)

(assert (=> b!143186 m!172831))

(declare-fun m!172833 () Bool)

(assert (=> b!143186 m!172833))

(assert (=> b!143186 m!172825))

(declare-fun m!172835 () Bool)

(assert (=> b!143186 m!172835))

(declare-fun m!172837 () Bool)

(assert (=> b!143186 m!172837))

(declare-fun m!172839 () Bool)

(assert (=> b!143186 m!172839))

(declare-fun m!172841 () Bool)

(assert (=> b!143186 m!172841))

(declare-fun m!172843 () Bool)

(assert (=> b!143186 m!172843))

(declare-fun m!172845 () Bool)

(assert (=> b!143186 m!172845))

(assert (=> b!143186 m!172839))

(declare-fun m!172847 () Bool)

(assert (=> b!143186 m!172847))

(declare-fun m!172849 () Bool)

(assert (=> b!143186 m!172849))

(assert (=> b!143186 m!172815))

(declare-fun m!172851 () Bool)

(assert (=> b!143186 m!172851))

(assert (=> b!143186 m!172827))

(declare-fun m!172853 () Bool)

(assert (=> b!143186 m!172853))

(assert (=> b!143186 m!172849))

(declare-fun m!172855 () Bool)

(assert (=> b!143186 m!172855))

(assert (=> b!143167 m!172815))

(assert (=> b!143167 m!172815))

(declare-fun m!172857 () Bool)

(assert (=> b!143167 m!172857))

(declare-fun m!172859 () Bool)

(assert (=> bm!15801 m!172859))

(assert (=> b!143171 m!172815))

(assert (=> b!143171 m!172815))

(assert (=> b!143171 m!172857))

(declare-fun m!172861 () Bool)

(assert (=> b!143174 m!172861))

(assert (=> bm!15799 m!172841))

(assert (=> b!143009 d!45775))

(declare-fun b!143197 () Bool)

(declare-fun e!93336 () Bool)

(declare-fun e!93337 () Bool)

(assert (=> b!143197 (= e!93336 e!93337)))

(declare-fun res!68227 () Bool)

(assert (=> b!143197 (=> (not res!68227) (not e!93337))))

(declare-fun e!93338 () Bool)

(assert (=> b!143197 (= res!68227 (not e!93338))))

(declare-fun res!68228 () Bool)

(assert (=> b!143197 (=> (not res!68228) (not e!93338))))

(assert (=> b!143197 (= res!68228 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun bm!15808 () Bool)

(declare-fun c!27084 () Bool)

(declare-fun call!15811 () Bool)

(assert (=> bm!15808 (= call!15811 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27084 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721) Nil!1721)))))

(declare-fun b!143198 () Bool)

(declare-fun contains!911 (List!1724 (_ BitVec 64)) Bool)

(assert (=> b!143198 (= e!93338 (contains!911 Nil!1721 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143199 () Bool)

(declare-fun e!93335 () Bool)

(assert (=> b!143199 (= e!93335 call!15811)))

(declare-fun b!143200 () Bool)

(assert (=> b!143200 (= e!93337 e!93335)))

(assert (=> b!143200 (= c!27084 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun d!45777 () Bool)

(declare-fun res!68229 () Bool)

(assert (=> d!45777 (=> res!68229 e!93336)))

(assert (=> d!45777 (= res!68229 (bvsge from!355 (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> d!45777 (= (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) from!355 Nil!1721) e!93336)))

(declare-fun b!143201 () Bool)

(assert (=> b!143201 (= e!93335 call!15811)))

(assert (= (and d!45777 (not res!68229)) b!143197))

(assert (= (and b!143197 res!68228) b!143198))

(assert (= (and b!143197 res!68227) b!143200))

(assert (= (and b!143200 c!27084) b!143201))

(assert (= (and b!143200 (not c!27084)) b!143199))

(assert (= (or b!143201 b!143199) bm!15808))

(assert (=> b!143197 m!172677))

(assert (=> b!143197 m!172677))

(declare-fun m!172863 () Bool)

(assert (=> b!143197 m!172863))

(assert (=> bm!15808 m!172677))

(declare-fun m!172865 () Bool)

(assert (=> bm!15808 m!172865))

(assert (=> b!143198 m!172677))

(assert (=> b!143198 m!172677))

(declare-fun m!172867 () Bool)

(assert (=> b!143198 m!172867))

(assert (=> b!143200 m!172677))

(assert (=> b!143200 m!172677))

(assert (=> b!143200 m!172863))

(assert (=> b!143010 d!45777))

(declare-fun d!45779 () Bool)

(assert (=> d!45779 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) from!355 Nil!1721)))

(declare-fun lt!75001 () Unit!4532)

(declare-fun choose!39 (array!4893 (_ BitVec 32) (_ BitVec 32)) Unit!4532)

(assert (=> d!45779 (= lt!75001 (choose!39 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45779 (bvslt (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45779 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75001)))

(declare-fun bs!6071 () Bool)

(assert (= bs!6071 d!45779))

(assert (=> bs!6071 m!172699))

(declare-fun m!172869 () Bool)

(assert (=> bs!6071 m!172869))

(assert (=> b!143010 d!45779))

(declare-fun d!45781 () Bool)

(declare-fun res!68234 () Bool)

(declare-fun e!93343 () Bool)

(assert (=> d!45781 (=> res!68234 e!93343)))

(assert (=> d!45781 (= res!68234 (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45781 (= (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93343)))

(declare-fun b!143206 () Bool)

(declare-fun e!93344 () Bool)

(assert (=> b!143206 (= e!93343 e!93344)))

(declare-fun res!68235 () Bool)

(assert (=> b!143206 (=> (not res!68235) (not e!93344))))

(assert (=> b!143206 (= res!68235 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143207 () Bool)

(assert (=> b!143207 (= e!93344 (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45781 (not res!68234)) b!143206))

(assert (= (and b!143206 res!68235) b!143207))

(assert (=> d!45781 m!172815))

(assert (=> b!143207 m!172677))

(declare-fun m!172871 () Bool)

(assert (=> b!143207 m!172871))

(assert (=> b!143010 d!45781))

(declare-fun d!45783 () Bool)

(declare-fun e!93347 () Bool)

(assert (=> d!45783 e!93347))

(declare-fun c!27087 () Bool)

(assert (=> d!45783 (= c!27087 (and (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75004 () Unit!4532)

(declare-fun choose!876 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4532)

(assert (=> d!45783 (= lt!75004 (choose!876 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(assert (=> d!45783 (validMask!0 (mask!7314 (v!3296 (underlying!482 thiss!992))))))

(assert (=> d!45783 (= (lemmaListMapContainsThenArrayContainsFrom!142 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) lt!75004)))

(declare-fun b!143212 () Bool)

(assert (=> b!143212 (= e!93347 (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143213 () Bool)

(assert (=> b!143213 (= e!93347 (ite (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45783 c!27087) b!143212))

(assert (= (and d!45783 (not c!27087)) b!143213))

(assert (=> d!45783 m!172677))

(declare-fun m!172873 () Bool)

(assert (=> d!45783 m!172873))

(assert (=> d!45783 m!172805))

(assert (=> b!143212 m!172677))

(assert (=> b!143212 m!172703))

(assert (=> b!143010 d!45783))

(declare-fun d!45785 () Bool)

(declare-fun res!68242 () Bool)

(declare-fun e!93350 () Bool)

(assert (=> d!45785 (=> (not res!68242) (not e!93350))))

(declare-fun simpleValid!97 (LongMapFixedSize!1156) Bool)

(assert (=> d!45785 (= res!68242 (simpleValid!97 newMap!16))))

(assert (=> d!45785 (= (valid!571 newMap!16) e!93350)))

(declare-fun b!143220 () Bool)

(declare-fun res!68243 () Bool)

(assert (=> b!143220 (=> (not res!68243) (not e!93350))))

(declare-fun arrayCountValidKeys!0 (array!4893 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!143220 (= res!68243 (= (arrayCountValidKeys!0 (_keys!4725 newMap!16) #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (_size!627 newMap!16)))))

(declare-fun b!143221 () Bool)

(declare-fun res!68244 () Bool)

(assert (=> b!143221 (=> (not res!68244) (not e!93350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4893 (_ BitVec 32)) Bool)

(assert (=> b!143221 (= res!68244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun b!143222 () Bool)

(assert (=> b!143222 (= e!93350 (arrayNoDuplicates!0 (_keys!4725 newMap!16) #b00000000000000000000000000000000 Nil!1721))))

(assert (= (and d!45785 res!68242) b!143220))

(assert (= (and b!143220 res!68243) b!143221))

(assert (= (and b!143221 res!68244) b!143222))

(declare-fun m!172875 () Bool)

(assert (=> d!45785 m!172875))

(declare-fun m!172877 () Bool)

(assert (=> b!143220 m!172877))

(declare-fun m!172879 () Bool)

(assert (=> b!143221 m!172879))

(declare-fun m!172881 () Bool)

(assert (=> b!143222 m!172881))

(assert (=> b!143001 d!45785))

(declare-fun d!45787 () Bool)

(assert (=> d!45787 (= (array_inv!1443 (_keys!4725 newMap!16)) (bvsge (size!2585 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143006 d!45787))

(declare-fun d!45789 () Bool)

(assert (=> d!45789 (= (array_inv!1444 (_values!2945 newMap!16)) (bvsge (size!2586 (_values!2945 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143006 d!45789))

(declare-fun d!45791 () Bool)

(assert (=> d!45791 (= (valid!572 thiss!992) (valid!571 (v!3296 (underlying!482 thiss!992))))))

(declare-fun bs!6072 () Bool)

(assert (= bs!6072 d!45791))

(declare-fun m!172883 () Bool)

(assert (=> bs!6072 m!172883))

(assert (=> start!14884 d!45791))

(declare-fun d!45793 () Bool)

(declare-fun res!68249 () Bool)

(declare-fun e!93355 () Bool)

(assert (=> d!45793 (=> res!68249 e!93355)))

(assert (=> d!45793 (= res!68249 ((_ is Nil!1721) (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)))))

(assert (=> d!45793 (= (noDuplicate!48 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)) e!93355)))

(declare-fun b!143227 () Bool)

(declare-fun e!93356 () Bool)

(assert (=> b!143227 (= e!93355 e!93356)))

(declare-fun res!68250 () Bool)

(assert (=> b!143227 (=> (not res!68250) (not e!93356))))

(assert (=> b!143227 (= res!68250 (not (contains!911 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)) (h!2328 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)))))))

(declare-fun b!143228 () Bool)

(assert (=> b!143228 (= e!93356 (noDuplicate!48 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(assert (= (and d!45793 (not res!68249)) b!143227))

(assert (= (and b!143227 res!68250) b!143228))

(declare-fun m!172885 () Bool)

(assert (=> b!143227 m!172885))

(declare-fun m!172887 () Bool)

(assert (=> b!143228 m!172887))

(assert (=> b!143002 d!45793))

(declare-fun d!45795 () Bool)

(declare-fun e!93362 () Bool)

(assert (=> d!45795 e!93362))

(declare-fun res!68253 () Bool)

(assert (=> d!45795 (=> res!68253 e!93362)))

(declare-fun lt!75014 () Bool)

(assert (=> d!45795 (= res!68253 (not lt!75014))))

(declare-fun lt!75013 () Bool)

(assert (=> d!45795 (= lt!75014 lt!75013)))

(declare-fun lt!75015 () Unit!4532)

(declare-fun e!93361 () Unit!4532)

(assert (=> d!45795 (= lt!75015 e!93361)))

(declare-fun c!27090 () Bool)

(assert (=> d!45795 (= c!27090 lt!75013)))

(declare-fun containsKey!181 (List!1725 (_ BitVec 64)) Bool)

(assert (=> d!45795 (= lt!75013 (containsKey!181 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45795 (= (contains!908 lt!74898 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) lt!75014)))

(declare-fun b!143235 () Bool)

(declare-fun lt!75016 () Unit!4532)

(assert (=> b!143235 (= e!93361 lt!75016)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!129 (List!1725 (_ BitVec 64)) Unit!4532)

(assert (=> b!143235 (= lt!75016 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-datatypes ((Option!184 0))(
  ( (Some!183 (v!3302 V!3561)) (None!182) )
))
(declare-fun isDefined!130 (Option!184) Bool)

(declare-fun getValueByKey!178 (List!1725 (_ BitVec 64)) Option!184)

(assert (=> b!143235 (isDefined!130 (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143236 () Bool)

(declare-fun Unit!4537 () Unit!4532)

(assert (=> b!143236 (= e!93361 Unit!4537)))

(declare-fun b!143237 () Bool)

(assert (=> b!143237 (= e!93362 (isDefined!130 (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!45795 c!27090) b!143235))

(assert (= (and d!45795 (not c!27090)) b!143236))

(assert (= (and d!45795 (not res!68253)) b!143237))

(assert (=> d!45795 m!172677))

(declare-fun m!172889 () Bool)

(assert (=> d!45795 m!172889))

(assert (=> b!143235 m!172677))

(declare-fun m!172891 () Bool)

(assert (=> b!143235 m!172891))

(assert (=> b!143235 m!172677))

(declare-fun m!172893 () Bool)

(assert (=> b!143235 m!172893))

(assert (=> b!143235 m!172893))

(declare-fun m!172895 () Bool)

(assert (=> b!143235 m!172895))

(assert (=> b!143237 m!172677))

(assert (=> b!143237 m!172893))

(assert (=> b!143237 m!172893))

(assert (=> b!143237 m!172895))

(assert (=> b!143007 d!45795))

(declare-fun bm!15857 () Bool)

(declare-fun call!15860 () ListLongMap!1689)

(declare-fun lt!75076 () tuple2!2632)

(assert (=> bm!15857 (= call!15860 (map!1433 (_2!1327 lt!75076)))))

(declare-fun b!143318 () Bool)

(declare-fun c!27120 () Bool)

(declare-datatypes ((SeekEntryResult!274 0))(
  ( (MissingZero!274 (index!3260 (_ BitVec 32))) (Found!274 (index!3261 (_ BitVec 32))) (Intermediate!274 (undefined!1086 Bool) (index!3262 (_ BitVec 32)) (x!16328 (_ BitVec 32))) (Undefined!274) (MissingVacant!274 (index!3263 (_ BitVec 32))) )
))
(declare-fun lt!75072 () SeekEntryResult!274)

(assert (=> b!143318 (= c!27120 ((_ is MissingVacant!274) lt!75072))))

(declare-fun e!93409 () tuple2!2632)

(declare-fun e!93417 () tuple2!2632)

(assert (=> b!143318 (= e!93409 e!93417)))

(declare-fun bm!15858 () Bool)

(declare-fun c!27122 () Bool)

(declare-fun c!27118 () Bool)

(assert (=> bm!15858 (= c!27122 c!27118)))

(declare-fun call!15871 () Bool)

(declare-fun e!93410 () ListLongMap!1689)

(assert (=> bm!15858 (= call!15871 (contains!908 e!93410 (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072)))))))

(declare-fun bm!15859 () Bool)

(declare-fun call!15880 () ListLongMap!1689)

(assert (=> bm!15859 (= call!15880 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143319 () Bool)

(declare-fun e!93411 () Bool)

(declare-fun e!93408 () Bool)

(assert (=> b!143319 (= e!93411 e!93408)))

(declare-fun res!68290 () Bool)

(declare-fun call!15869 () Bool)

(assert (=> b!143319 (= res!68290 call!15869)))

(assert (=> b!143319 (=> (not res!68290) (not e!93408))))

(declare-fun b!143320 () Bool)

(declare-fun res!68291 () Bool)

(declare-fun call!15866 () Bool)

(assert (=> b!143320 (= res!68291 call!15866)))

(declare-fun e!93418 () Bool)

(assert (=> b!143320 (=> (not res!68291) (not e!93418))))

(declare-fun b!143321 () Bool)

(declare-fun e!93419 () Bool)

(declare-fun e!93407 () Bool)

(assert (=> b!143321 (= e!93419 e!93407)))

(declare-fun res!68288 () Bool)

(assert (=> b!143321 (= res!68288 (contains!908 call!15860 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143321 (=> (not res!68288) (not e!93407))))

(declare-fun b!143322 () Bool)

(declare-fun call!15878 () Bool)

(assert (=> b!143322 (= e!93408 (not call!15878))))

(declare-fun b!143323 () Bool)

(declare-fun c!27119 () Bool)

(declare-fun lt!75073 () SeekEntryResult!274)

(assert (=> b!143323 (= c!27119 ((_ is MissingVacant!274) lt!75073))))

(declare-fun e!93412 () Bool)

(assert (=> b!143323 (= e!93412 e!93411)))

(declare-fun b!143324 () Bool)

(declare-fun lt!75091 () tuple2!2632)

(declare-fun call!15883 () tuple2!2632)

(assert (=> b!143324 (= lt!75091 call!15883)))

(declare-fun e!93422 () tuple2!2632)

(assert (=> b!143324 (= e!93422 (tuple2!2633 (_1!1327 lt!75091) (_2!1327 lt!75091)))))

(declare-fun b!143325 () Bool)

(declare-fun lt!75081 () Unit!4532)

(declare-fun lt!75078 () Unit!4532)

(assert (=> b!143325 (= lt!75081 lt!75078)))

(declare-fun call!15882 () ListLongMap!1689)

(declare-fun call!15872 () ListLongMap!1689)

(assert (=> b!143325 (= call!15882 call!15872)))

(declare-fun lt!75079 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!66 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4532)

(assert (=> b!143325 (= lt!75078 (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75079 (zeroValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143325 (= lt!75079 (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!93405 () tuple2!2632)

(assert (=> b!143325 (= e!93405 (tuple2!2633 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7314 newMap!16) (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (_size!627 newMap!16) (_keys!4725 newMap!16) (_values!2945 newMap!16) (_vacant!627 newMap!16))))))

(declare-fun b!143326 () Bool)

(declare-fun e!93406 () Bool)

(declare-fun e!93414 () Bool)

(assert (=> b!143326 (= e!93406 e!93414)))

(declare-fun res!68295 () Bool)

(declare-fun call!15864 () Bool)

(assert (=> b!143326 (= res!68295 call!15864)))

(assert (=> b!143326 (=> (not res!68295) (not e!93414))))

(declare-fun bm!15860 () Bool)

(declare-fun call!15876 () ListLongMap!1689)

(declare-fun call!15863 () ListLongMap!1689)

(assert (=> bm!15860 (= call!15876 call!15863)))

(declare-fun bm!15861 () Bool)

(declare-fun call!15879 () Bool)

(declare-fun call!15875 () Bool)

(assert (=> bm!15861 (= call!15879 call!15875)))

(declare-fun bm!15862 () Bool)

(assert (=> bm!15862 (= call!15869 call!15866)))

(declare-fun b!143327 () Bool)

(declare-fun e!93425 () Unit!4532)

(declare-fun Unit!4538 () Unit!4532)

(assert (=> b!143327 (= e!93425 Unit!4538)))

(declare-fun lt!75071 () Unit!4532)

(declare-fun call!15862 () Unit!4532)

(assert (=> b!143327 (= lt!75071 call!15862)))

(declare-fun call!15877 () SeekEntryResult!274)

(assert (=> b!143327 (= lt!75073 call!15877)))

(declare-fun c!27123 () Bool)

(assert (=> b!143327 (= c!27123 ((_ is MissingZero!274) lt!75073))))

(assert (=> b!143327 e!93412))

(declare-fun lt!75074 () Unit!4532)

(assert (=> b!143327 (= lt!75074 lt!75071)))

(assert (=> b!143327 false))

(declare-fun b!143328 () Bool)

(declare-fun lt!75096 () tuple2!2632)

(assert (=> b!143328 (= e!93417 (tuple2!2633 (_1!1327 lt!75096) (_2!1327 lt!75096)))))

(assert (=> b!143328 (= lt!75096 call!15883)))

(declare-fun d!45797 () Bool)

(declare-fun e!93424 () Bool)

(assert (=> d!45797 e!93424))

(declare-fun res!68286 () Bool)

(assert (=> d!45797 (=> (not res!68286) (not e!93424))))

(assert (=> d!45797 (= res!68286 (valid!571 (_2!1327 lt!75076)))))

(declare-fun e!93413 () tuple2!2632)

(assert (=> d!45797 (= lt!75076 e!93413)))

(declare-fun c!27129 () Bool)

(assert (=> d!45797 (= c!27129 (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvneg (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(assert (=> d!45797 (valid!571 newMap!16)))

(assert (=> d!45797 (= (update!211 newMap!16 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!75076)))

(declare-fun b!143329 () Bool)

(declare-fun c!27126 () Bool)

(declare-fun lt!75077 () SeekEntryResult!274)

(assert (=> b!143329 (= c!27126 ((_ is MissingVacant!274) lt!75077))))

(declare-fun e!93423 () Bool)

(assert (=> b!143329 (= e!93423 e!93406)))

(declare-fun bm!15863 () Bool)

(assert (=> bm!15863 (= call!15878 call!15875)))

(declare-fun b!143330 () Bool)

(assert (=> b!143330 (= e!93413 e!93405)))

(declare-fun c!27117 () Bool)

(assert (=> b!143330 (= c!27117 (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143331 () Bool)

(declare-fun res!68284 () Bool)

(declare-fun e!93420 () Bool)

(assert (=> b!143331 (=> (not res!68284) (not e!93420))))

(assert (=> b!143331 (= res!68284 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3260 lt!75073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143332 () Bool)

(declare-fun lt!75084 () Unit!4532)

(declare-fun lt!75093 () Unit!4532)

(assert (=> b!143332 (= lt!75084 lt!75093)))

(assert (=> b!143332 (= call!15882 call!15872)))

(declare-fun lt!75088 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4532)

(assert (=> b!143332 (= lt!75093 (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75088 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143332 (= lt!75088 (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!143332 (= e!93405 (tuple2!2633 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7314 newMap!16) (bvor (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) (zeroValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!627 newMap!16) (_keys!4725 newMap!16) (_values!2945 newMap!16) (_vacant!627 newMap!16))))))

(declare-fun bm!15864 () Bool)

(declare-fun call!15870 () SeekEntryResult!274)

(declare-fun call!15865 () SeekEntryResult!274)

(assert (=> bm!15864 (= call!15870 call!15865)))

(declare-fun b!143333 () Bool)

(declare-fun lt!75080 () Unit!4532)

(declare-fun lt!75089 () Unit!4532)

(assert (=> b!143333 (= lt!75080 lt!75089)))

(assert (=> b!143333 call!15871))

(declare-fun lt!75095 () array!4895)

(declare-fun lemmaValidKeyInArrayIsInListMap!126 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) Unit!4532)

(assert (=> b!143333 (= lt!75089 (lemmaValidKeyInArrayIsInListMap!126 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143333 (= lt!75095 (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))))))

(declare-fun lt!75097 () Unit!4532)

(declare-fun lt!75083 () Unit!4532)

(assert (=> b!143333 (= lt!75097 lt!75083)))

(declare-fun call!15861 () ListLongMap!1689)

(assert (=> b!143333 (= call!15861 call!15876)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4532)

(assert (=> b!143333 (= lt!75083 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75092 () Unit!4532)

(assert (=> b!143333 (= lt!75092 e!93425)))

(declare-fun c!27124 () Bool)

(assert (=> b!143333 (= c!27124 (contains!908 call!15880 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143333 (= e!93422 (tuple2!2633 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (_size!627 newMap!16) (_keys!4725 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))) (_vacant!627 newMap!16))))))

(declare-fun b!143334 () Bool)

(assert (=> b!143334 (= e!93411 ((_ is Undefined!274) lt!75073))))

(declare-fun b!143335 () Bool)

(declare-fun e!93415 () Unit!4532)

(declare-fun Unit!4539 () Unit!4532)

(assert (=> b!143335 (= e!93415 Unit!4539)))

(declare-fun lt!75094 () Unit!4532)

(declare-fun call!15874 () Unit!4532)

(assert (=> b!143335 (= lt!75094 call!15874)))

(declare-fun lt!75086 () SeekEntryResult!274)

(assert (=> b!143335 (= lt!75086 call!15870)))

(declare-fun res!68282 () Bool)

(assert (=> b!143335 (= res!68282 ((_ is Found!274) lt!75086))))

(declare-fun e!93421 () Bool)

(assert (=> b!143335 (=> (not res!68282) (not e!93421))))

(assert (=> b!143335 e!93421))

(declare-fun lt!75075 () Unit!4532)

(assert (=> b!143335 (= lt!75075 lt!75094)))

(assert (=> b!143335 false))

(declare-fun call!15867 () ListLongMap!1689)

(declare-fun bm!15865 () Bool)

(assert (=> bm!15865 (= call!15861 (+!174 (ite c!27129 call!15867 call!15880) (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15866 () Bool)

(declare-fun call!15873 () ListLongMap!1689)

(assert (=> bm!15866 (= call!15873 (map!1433 newMap!16))))

(declare-fun bm!15867 () Bool)

(assert (=> bm!15867 (= call!15867 call!15880)))

(declare-fun bm!15868 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4532)

(assert (=> bm!15868 (= call!15862 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(declare-fun bm!15869 () Bool)

(assert (=> bm!15869 (= call!15875 (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!143336 () Bool)

(assert (=> b!143336 (= e!93406 ((_ is Undefined!274) lt!75077))))

(declare-fun b!143337 () Bool)

(declare-fun res!68289 () Bool)

(declare-fun e!93416 () Bool)

(assert (=> b!143337 (=> (not res!68289) (not e!93416))))

(assert (=> b!143337 (= res!68289 call!15864)))

(assert (=> b!143337 (= e!93423 e!93416)))

(declare-fun b!143338 () Bool)

(declare-fun lt!75085 () Unit!4532)

(assert (=> b!143338 (= e!93425 lt!75085)))

(assert (=> b!143338 (= lt!75085 call!15874)))

(declare-fun lt!75082 () SeekEntryResult!274)

(assert (=> b!143338 (= lt!75082 call!15877)))

(declare-fun res!68294 () Bool)

(assert (=> b!143338 (= res!68294 ((_ is Found!274) lt!75082))))

(assert (=> b!143338 (=> (not res!68294) (not e!93418))))

(assert (=> b!143338 e!93418))

(declare-fun b!143339 () Bool)

(assert (=> b!143339 (= e!93407 (= call!15860 (+!174 call!15873 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143340 () Bool)

(declare-fun res!68285 () Bool)

(assert (=> b!143340 (=> (not res!68285) (not e!93420))))

(assert (=> b!143340 (= res!68285 call!15869)))

(assert (=> b!143340 (= e!93412 e!93420)))

(declare-fun b!143341 () Bool)

(declare-fun res!68292 () Bool)

(assert (=> b!143341 (= res!68292 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3263 lt!75073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143341 (=> (not res!68292) (not e!93408))))

(declare-fun bm!15870 () Bool)

(assert (=> bm!15870 (= call!15863 (getCurrentListMap!533 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143342 () Bool)

(assert (=> b!143342 (= e!93419 (= call!15860 call!15873))))

(declare-fun b!143343 () Bool)

(declare-fun lt!75087 () Unit!4532)

(assert (=> b!143343 (= e!93415 lt!75087)))

(assert (=> b!143343 (= lt!75087 call!15862)))

(assert (=> b!143343 (= lt!75077 call!15870)))

(declare-fun c!27128 () Bool)

(assert (=> b!143343 (= c!27128 ((_ is MissingZero!274) lt!75077))))

(assert (=> b!143343 e!93423))

(declare-fun bm!15871 () Bool)

(declare-fun call!15881 () Bool)

(assert (=> bm!15871 (= call!15866 call!15881)))

(declare-fun b!143344 () Bool)

(declare-fun res!68293 () Bool)

(declare-fun call!15868 () Bool)

(assert (=> b!143344 (= res!68293 call!15868)))

(assert (=> b!143344 (=> (not res!68293) (not e!93421))))

(declare-fun b!143345 () Bool)

(assert (=> b!143345 (= e!93418 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75082)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143346 () Bool)

(assert (=> b!143346 (= e!93417 e!93422)))

(declare-fun c!27127 () Bool)

(assert (=> b!143346 (= c!27127 ((_ is MissingZero!274) lt!75072))))

(declare-fun c!27125 () Bool)

(declare-fun bm!15872 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15872 (= call!15881 (inRange!0 (ite c!27118 (ite c!27125 (index!3261 lt!75086) (ite c!27128 (index!3260 lt!75077) (index!3263 lt!75077))) (ite c!27124 (index!3261 lt!75082) (ite c!27123 (index!3260 lt!75073) (index!3263 lt!75073)))) (mask!7314 newMap!16)))))

(declare-fun b!143347 () Bool)

(assert (=> b!143347 (= e!93410 call!15876)))

(declare-fun bm!15873 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4893 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> bm!15873 (= call!15865 (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun b!143348 () Bool)

(declare-fun res!68283 () Bool)

(assert (=> b!143348 (=> (not res!68283) (not e!93416))))

(assert (=> b!143348 (= res!68283 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3260 lt!75077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143349 () Bool)

(assert (=> b!143349 (= e!93416 (not call!15879))))

(declare-fun b!143350 () Bool)

(declare-fun res!68287 () Bool)

(assert (=> b!143350 (= res!68287 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3263 lt!75077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143350 (=> (not res!68287) (not e!93414))))

(declare-fun b!143351 () Bool)

(assert (=> b!143351 (= e!93413 e!93409)))

(assert (=> b!143351 (= lt!75072 (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(assert (=> b!143351 (= c!27118 ((_ is Undefined!274) lt!75072))))

(declare-fun bm!15874 () Bool)

(assert (=> bm!15874 (= call!15868 call!15881)))

(declare-fun bm!15875 () Bool)

(assert (=> bm!15875 (= call!15872 call!15863)))

(declare-fun b!143352 () Bool)

(assert (=> b!143352 (= e!93424 e!93419)))

(declare-fun c!27121 () Bool)

(assert (=> b!143352 (= c!27121 (_1!1327 lt!75076))))

(declare-fun bm!15876 () Bool)

(assert (=> bm!15876 (= call!15882 call!15861)))

(declare-fun bm!15877 () Bool)

(assert (=> bm!15877 (= call!15864 call!15868)))

(declare-fun b!143353 () Bool)

(assert (=> b!143353 (= e!93420 (not call!15878))))

(declare-fun b!143354 () Bool)

(assert (=> b!143354 (= e!93410 (getCurrentListMap!533 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143355 () Bool)

(declare-fun lt!75090 () Unit!4532)

(assert (=> b!143355 (= lt!75090 e!93415)))

(assert (=> b!143355 (= c!27125 call!15871)))

(assert (=> b!143355 (= e!93409 (tuple2!2633 false newMap!16))))

(declare-fun bm!15878 () Bool)

(declare-fun updateHelperNewKey!66 (LongMapFixedSize!1156 (_ BitVec 64) V!3561 (_ BitVec 32)) tuple2!2632)

(assert (=> bm!15878 (= call!15883 (updateHelperNewKey!66 newMap!16 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072))))))

(declare-fun b!143356 () Bool)

(assert (=> b!143356 (= e!93414 (not call!15879))))

(declare-fun bm!15879 () Bool)

(assert (=> bm!15879 (= call!15877 call!15865)))

(declare-fun bm!15880 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4532)

(assert (=> bm!15880 (= call!15874 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(declare-fun b!143357 () Bool)

(assert (=> b!143357 (= e!93421 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75086)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!45797 c!27129) b!143330))

(assert (= (and d!45797 (not c!27129)) b!143351))

(assert (= (and b!143330 c!27117) b!143325))

(assert (= (and b!143330 (not c!27117)) b!143332))

(assert (= (or b!143325 b!143332) bm!15875))

(assert (= (or b!143325 b!143332) bm!15867))

(assert (= (or b!143325 b!143332) bm!15876))

(assert (= (and b!143351 c!27118) b!143355))

(assert (= (and b!143351 (not c!27118)) b!143318))

(assert (= (and b!143355 c!27125) b!143335))

(assert (= (and b!143355 (not c!27125)) b!143343))

(assert (= (and b!143335 res!68282) b!143344))

(assert (= (and b!143344 res!68293) b!143357))

(assert (= (and b!143343 c!27128) b!143337))

(assert (= (and b!143343 (not c!27128)) b!143329))

(assert (= (and b!143337 res!68289) b!143348))

(assert (= (and b!143348 res!68283) b!143349))

(assert (= (and b!143329 c!27126) b!143326))

(assert (= (and b!143329 (not c!27126)) b!143336))

(assert (= (and b!143326 res!68295) b!143350))

(assert (= (and b!143350 res!68287) b!143356))

(assert (= (or b!143337 b!143326) bm!15877))

(assert (= (or b!143349 b!143356) bm!15861))

(assert (= (or b!143344 bm!15877) bm!15874))

(assert (= (or b!143335 b!143343) bm!15864))

(assert (= (and b!143318 c!27120) b!143328))

(assert (= (and b!143318 (not c!27120)) b!143346))

(assert (= (and b!143346 c!27127) b!143324))

(assert (= (and b!143346 (not c!27127)) b!143333))

(assert (= (and b!143333 c!27124) b!143338))

(assert (= (and b!143333 (not c!27124)) b!143327))

(assert (= (and b!143338 res!68294) b!143320))

(assert (= (and b!143320 res!68291) b!143345))

(assert (= (and b!143327 c!27123) b!143340))

(assert (= (and b!143327 (not c!27123)) b!143323))

(assert (= (and b!143340 res!68285) b!143331))

(assert (= (and b!143331 res!68284) b!143353))

(assert (= (and b!143323 c!27119) b!143319))

(assert (= (and b!143323 (not c!27119)) b!143334))

(assert (= (and b!143319 res!68290) b!143341))

(assert (= (and b!143341 res!68292) b!143322))

(assert (= (or b!143340 b!143319) bm!15862))

(assert (= (or b!143353 b!143322) bm!15863))

(assert (= (or b!143320 bm!15862) bm!15871))

(assert (= (or b!143338 b!143327) bm!15879))

(assert (= (or b!143328 b!143324) bm!15878))

(assert (= (or bm!15861 bm!15863) bm!15869))

(assert (= (or b!143355 b!143333) bm!15860))

(assert (= (or bm!15864 bm!15879) bm!15873))

(assert (= (or b!143343 b!143327) bm!15868))

(assert (= (or b!143335 b!143338) bm!15880))

(assert (= (or bm!15874 bm!15871) bm!15872))

(assert (= (or b!143355 b!143333) bm!15858))

(assert (= (and bm!15858 c!27122) b!143347))

(assert (= (and bm!15858 (not c!27122)) b!143354))

(assert (= (or bm!15875 bm!15860) bm!15870))

(assert (= (or bm!15867 b!143333) bm!15859))

(assert (= (or bm!15876 b!143333) bm!15865))

(assert (= (and d!45797 res!68286) b!143352))

(assert (= (and b!143352 c!27121) b!143321))

(assert (= (and b!143352 (not c!27121)) b!143342))

(assert (= (and b!143321 res!68288) b!143339))

(assert (= (or b!143321 b!143339 b!143342) bm!15857))

(assert (= (or b!143339 b!143342) bm!15866))

(declare-fun m!172897 () Bool)

(assert (=> b!143331 m!172897))

(declare-fun m!172899 () Bool)

(assert (=> bm!15872 m!172899))

(assert (=> bm!15880 m!172677))

(declare-fun m!172901 () Bool)

(assert (=> bm!15880 m!172901))

(assert (=> bm!15859 m!172803))

(assert (=> bm!15868 m!172677))

(declare-fun m!172903 () Bool)

(assert (=> bm!15868 m!172903))

(declare-fun m!172905 () Bool)

(assert (=> bm!15858 m!172905))

(declare-fun m!172907 () Bool)

(assert (=> bm!15858 m!172907))

(assert (=> b!143325 m!172713))

(declare-fun m!172909 () Bool)

(assert (=> b!143325 m!172909))

(declare-fun m!172911 () Bool)

(assert (=> bm!15865 m!172911))

(declare-fun m!172913 () Bool)

(assert (=> b!143333 m!172913))

(declare-fun m!172915 () Bool)

(assert (=> b!143333 m!172915))

(assert (=> b!143333 m!172677))

(assert (=> b!143333 m!172713))

(declare-fun m!172917 () Bool)

(assert (=> b!143333 m!172917))

(assert (=> b!143333 m!172677))

(declare-fun m!172919 () Bool)

(assert (=> b!143333 m!172919))

(declare-fun m!172921 () Bool)

(assert (=> b!143348 m!172921))

(assert (=> bm!15873 m!172677))

(declare-fun m!172923 () Bool)

(assert (=> bm!15873 m!172923))

(assert (=> b!143321 m!172677))

(declare-fun m!172925 () Bool)

(assert (=> b!143321 m!172925))

(declare-fun m!172927 () Bool)

(assert (=> b!143357 m!172927))

(assert (=> b!143351 m!172677))

(assert (=> b!143351 m!172923))

(assert (=> bm!15878 m!172677))

(assert (=> bm!15878 m!172713))

(declare-fun m!172929 () Bool)

(assert (=> bm!15878 m!172929))

(declare-fun m!172931 () Bool)

(assert (=> d!45797 m!172931))

(assert (=> d!45797 m!172695))

(assert (=> bm!15869 m!172677))

(declare-fun m!172933 () Bool)

(assert (=> bm!15869 m!172933))

(declare-fun m!172935 () Bool)

(assert (=> b!143354 m!172935))

(declare-fun m!172937 () Bool)

(assert (=> bm!15857 m!172937))

(assert (=> bm!15870 m!172915))

(declare-fun m!172939 () Bool)

(assert (=> bm!15870 m!172939))

(declare-fun m!172941 () Bool)

(assert (=> b!143341 m!172941))

(assert (=> b!143332 m!172713))

(declare-fun m!172943 () Bool)

(assert (=> b!143332 m!172943))

(assert (=> bm!15866 m!172679))

(declare-fun m!172945 () Bool)

(assert (=> b!143350 m!172945))

(declare-fun m!172947 () Bool)

(assert (=> b!143339 m!172947))

(declare-fun m!172949 () Bool)

(assert (=> b!143345 m!172949))

(assert (=> b!143007 d!45797))

(declare-fun d!45799 () Bool)

(declare-fun c!27132 () Bool)

(assert (=> d!45799 (= c!27132 ((_ is ValueCellFull!1124) (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!93428 () V!3561)

(assert (=> d!45799 (= (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93428)))

(declare-fun b!143362 () Bool)

(declare-fun get!1541 (ValueCell!1124 V!3561) V!3561)

(assert (=> b!143362 (= e!93428 (get!1541 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143363 () Bool)

(declare-fun get!1542 (ValueCell!1124 V!3561) V!3561)

(assert (=> b!143363 (= e!93428 (get!1542 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45799 c!27132) b!143362))

(assert (= (and d!45799 (not c!27132)) b!143363))

(assert (=> b!143362 m!172709))

(assert (=> b!143362 m!172711))

(declare-fun m!172951 () Bool)

(assert (=> b!143362 m!172951))

(assert (=> b!143363 m!172709))

(assert (=> b!143363 m!172711))

(declare-fun m!172953 () Bool)

(assert (=> b!143363 m!172953))

(assert (=> b!143007 d!45799))

(declare-fun d!45801 () Bool)

(assert (=> d!45801 (= (array_inv!1443 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvsge (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143013 d!45801))

(declare-fun d!45803 () Bool)

(assert (=> d!45803 (= (array_inv!1444 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvsge (size!2586 (_values!2945 (v!3296 (underlying!482 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143013 d!45803))

(declare-fun condMapEmpty!4871 () Bool)

(declare-fun mapDefault!4871 () ValueCell!1124)

(assert (=> mapNonEmpty!4855 (= condMapEmpty!4871 (= mapRest!4855 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4871)))))

(declare-fun e!93433 () Bool)

(declare-fun mapRes!4871 () Bool)

(assert (=> mapNonEmpty!4855 (= tp!11592 (and e!93433 mapRes!4871))))

(declare-fun mapIsEmpty!4871 () Bool)

(assert (=> mapIsEmpty!4871 mapRes!4871))

(declare-fun b!143371 () Bool)

(assert (=> b!143371 (= e!93433 tp_is_empty!2935)))

(declare-fun b!143370 () Bool)

(declare-fun e!93434 () Bool)

(assert (=> b!143370 (= e!93434 tp_is_empty!2935)))

(declare-fun mapNonEmpty!4871 () Bool)

(declare-fun tp!11621 () Bool)

(assert (=> mapNonEmpty!4871 (= mapRes!4871 (and tp!11621 e!93434))))

(declare-fun mapValue!4871 () ValueCell!1124)

(declare-fun mapRest!4871 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapKey!4871 () (_ BitVec 32))

(assert (=> mapNonEmpty!4871 (= mapRest!4855 (store mapRest!4871 mapKey!4871 mapValue!4871))))

(assert (= (and mapNonEmpty!4855 condMapEmpty!4871) mapIsEmpty!4871))

(assert (= (and mapNonEmpty!4855 (not condMapEmpty!4871)) mapNonEmpty!4871))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1124) mapValue!4871)) b!143370))

(assert (= (and mapNonEmpty!4855 ((_ is ValueCellFull!1124) mapDefault!4871)) b!143371))

(declare-fun m!172955 () Bool)

(assert (=> mapNonEmpty!4871 m!172955))

(declare-fun condMapEmpty!4872 () Bool)

(declare-fun mapDefault!4872 () ValueCell!1124)

(assert (=> mapNonEmpty!4856 (= condMapEmpty!4872 (= mapRest!4856 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4872)))))

(declare-fun e!93435 () Bool)

(declare-fun mapRes!4872 () Bool)

(assert (=> mapNonEmpty!4856 (= tp!11593 (and e!93435 mapRes!4872))))

(declare-fun mapIsEmpty!4872 () Bool)

(assert (=> mapIsEmpty!4872 mapRes!4872))

(declare-fun b!143373 () Bool)

(assert (=> b!143373 (= e!93435 tp_is_empty!2935)))

(declare-fun b!143372 () Bool)

(declare-fun e!93436 () Bool)

(assert (=> b!143372 (= e!93436 tp_is_empty!2935)))

(declare-fun mapNonEmpty!4872 () Bool)

(declare-fun tp!11622 () Bool)

(assert (=> mapNonEmpty!4872 (= mapRes!4872 (and tp!11622 e!93436))))

(declare-fun mapRest!4872 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapKey!4872 () (_ BitVec 32))

(declare-fun mapValue!4872 () ValueCell!1124)

(assert (=> mapNonEmpty!4872 (= mapRest!4856 (store mapRest!4872 mapKey!4872 mapValue!4872))))

(assert (= (and mapNonEmpty!4856 condMapEmpty!4872) mapIsEmpty!4872))

(assert (= (and mapNonEmpty!4856 (not condMapEmpty!4872)) mapNonEmpty!4872))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1124) mapValue!4872)) b!143372))

(assert (= (and mapNonEmpty!4856 ((_ is ValueCellFull!1124) mapDefault!4872)) b!143373))

(declare-fun m!172957 () Bool)

(assert (=> mapNonEmpty!4872 m!172957))

(declare-fun b_lambda!6447 () Bool)

(assert (= b_lambda!6445 (or (and b!143013 b_free!3037) (and b!143006 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))))) b_lambda!6447)))

(check-sat (not bm!15808) (not b!143175) (not bm!15869) (not b!143207) (not b!143174) (not b!143167) (not bm!15868) (not d!45795) (not b!143221) (not b!143212) (not b!143197) (not b!143186) (not b_next!3037) b_and!8943 (not d!45785) (not b!143235) (not b_next!3039) (not b!143351) (not b!143325) (not b!143354) (not d!45783) (not b!143220) (not bm!15880) (not b!143180) (not bm!15870) (not bm!15805) (not bm!15801) b_and!8941 (not bm!15866) (not b!143363) (not mapNonEmpty!4872) (not b!143222) (not b!143362) (not bm!15858) (not b!143170) tp_is_empty!2935 (not bm!15803) (not b!143332) (not b!143171) (not b!143198) (not bm!15799) (not b!143228) (not b!143227) (not d!45779) (not b!143200) (not b!143339) (not b_lambda!6447) (not bm!15859) (not b!143237) (not bm!15873) (not mapNonEmpty!4871) (not d!45791) (not b!143321) (not d!45797) (not b!143183) (not b!143333) (not d!45775) (not bm!15865) (not d!45773) (not b_lambda!6443) (not bm!15857) (not bm!15878) (not bm!15872))
(check-sat b_and!8941 b_and!8943 (not b_next!3037) (not b_next!3039))
(get-model)

(declare-fun d!45805 () Bool)

(assert (=> d!45805 (= (get!1542 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143363 d!45805))

(declare-fun d!45807 () Bool)

(declare-fun e!93439 () Bool)

(assert (=> d!45807 e!93439))

(declare-fun c!27135 () Bool)

(assert (=> d!45807 (= c!27135 (and (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!45807 true))

(declare-fun _$29!168 () Unit!4532)

(assert (=> d!45807 (= (choose!876 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) _$29!168)))

(declare-fun b!143378 () Bool)

(assert (=> b!143378 (= e!93439 (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143379 () Bool)

(assert (=> b!143379 (= e!93439 (ite (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45807 c!27135) b!143378))

(assert (= (and d!45807 (not c!27135)) b!143379))

(assert (=> b!143378 m!172677))

(assert (=> b!143378 m!172703))

(assert (=> d!45783 d!45807))

(declare-fun d!45809 () Bool)

(assert (=> d!45809 (= (validMask!0 (mask!7314 (v!3296 (underlying!482 thiss!992)))) (and (or (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000001111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000011111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000001111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000011111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000001111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000011111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000001111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000011111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000000111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000001111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000011111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000000111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000001111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000011111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000000111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000001111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000011111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000000111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000001111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000011111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00000111111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00001111111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00011111111111111111111111111111) (= (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7314 (v!3296 (underlying!482 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45783 d!45809))

(declare-fun d!45811 () Bool)

(declare-fun res!68296 () Bool)

(declare-fun e!93440 () Bool)

(assert (=> d!45811 (=> res!68296 e!93440)))

(assert (=> d!45811 (= res!68296 (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45811 (= (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!93440)))

(declare-fun b!143380 () Bool)

(declare-fun e!93441 () Bool)

(assert (=> b!143380 (= e!93440 e!93441)))

(declare-fun res!68297 () Bool)

(assert (=> b!143380 (=> (not res!68297) (not e!93441))))

(assert (=> b!143380 (= res!68297 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143381 () Bool)

(assert (=> b!143381 (= e!93441 (arrayContainsKey!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!45811 (not res!68296)) b!143380))

(assert (= (and b!143380 res!68297) b!143381))

(declare-fun m!172959 () Bool)

(assert (=> d!45811 m!172959))

(assert (=> b!143381 m!172677))

(declare-fun m!172961 () Bool)

(assert (=> b!143381 m!172961))

(assert (=> b!143207 d!45811))

(declare-fun d!45813 () Bool)

(declare-fun res!68298 () Bool)

(declare-fun e!93442 () Bool)

(assert (=> d!45813 (=> res!68298 e!93442)))

(assert (=> d!45813 (= res!68298 ((_ is Nil!1721) (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(assert (=> d!45813 (= (noDuplicate!48 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) e!93442)))

(declare-fun b!143382 () Bool)

(declare-fun e!93443 () Bool)

(assert (=> b!143382 (= e!93442 e!93443)))

(declare-fun res!68299 () Bool)

(assert (=> b!143382 (=> (not res!68299) (not e!93443))))

(assert (=> b!143382 (= res!68299 (not (contains!911 (t!6325 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) (h!2328 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))))

(declare-fun b!143383 () Bool)

(assert (=> b!143383 (= e!93443 (noDuplicate!48 (t!6325 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)))))))

(assert (= (and d!45813 (not res!68298)) b!143382))

(assert (= (and b!143382 res!68299) b!143383))

(declare-fun m!172963 () Bool)

(assert (=> b!143382 m!172963))

(declare-fun m!172965 () Bool)

(assert (=> b!143383 m!172965))

(assert (=> b!143228 d!45813))

(declare-fun d!45815 () Bool)

(declare-fun get!1543 (Option!184) V!3561)

(assert (=> d!45815 (= (apply!121 lt!74977 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1543 (getValueByKey!178 (toList!860 lt!74977) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6073 () Bool)

(assert (= bs!6073 d!45815))

(assert (=> bs!6073 m!172815))

(declare-fun m!172967 () Bool)

(assert (=> bs!6073 m!172967))

(assert (=> bs!6073 m!172967))

(declare-fun m!172969 () Bool)

(assert (=> bs!6073 m!172969))

(assert (=> b!143180 d!45815))

(declare-fun d!45817 () Bool)

(declare-fun c!27136 () Bool)

(assert (=> d!45817 (= c!27136 ((_ is ValueCellFull!1124) (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!93444 () V!3561)

(assert (=> d!45817 (= (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93444)))

(declare-fun b!143384 () Bool)

(assert (=> b!143384 (= e!93444 (get!1541 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143385 () Bool)

(assert (=> b!143385 (= e!93444 (get!1542 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45817 c!27136) b!143384))

(assert (= (and d!45817 (not c!27136)) b!143385))

(assert (=> b!143384 m!172819))

(assert (=> b!143384 m!172711))

(declare-fun m!172971 () Bool)

(assert (=> b!143384 m!172971))

(assert (=> b!143385 m!172819))

(assert (=> b!143385 m!172711))

(declare-fun m!172973 () Bool)

(assert (=> b!143385 m!172973))

(assert (=> b!143180 d!45817))

(declare-fun d!45819 () Bool)

(declare-fun res!68300 () Bool)

(declare-fun e!93445 () Bool)

(assert (=> d!45819 (=> res!68300 e!93445)))

(assert (=> d!45819 (= res!68300 (= (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45819 (= (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000) e!93445)))

(declare-fun b!143386 () Bool)

(declare-fun e!93446 () Bool)

(assert (=> b!143386 (= e!93445 e!93446)))

(declare-fun res!68301 () Bool)

(assert (=> b!143386 (=> (not res!68301) (not e!93446))))

(assert (=> b!143386 (= res!68301 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143387 () Bool)

(assert (=> b!143387 (= e!93446 (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!45819 (not res!68300)) b!143386))

(assert (= (and b!143386 res!68301) b!143387))

(declare-fun m!172975 () Bool)

(assert (=> d!45819 m!172975))

(assert (=> b!143387 m!172677))

(declare-fun m!172977 () Bool)

(assert (=> b!143387 m!172977))

(assert (=> bm!15869 d!45819))

(declare-fun b!143388 () Bool)

(declare-fun e!93448 () Bool)

(declare-fun e!93449 () Bool)

(assert (=> b!143388 (= e!93448 e!93449)))

(declare-fun res!68302 () Bool)

(assert (=> b!143388 (=> (not res!68302) (not e!93449))))

(declare-fun e!93450 () Bool)

(assert (=> b!143388 (= res!68302 (not e!93450))))

(declare-fun res!68303 () Bool)

(assert (=> b!143388 (=> (not res!68303) (not e!93450))))

(assert (=> b!143388 (= res!68303 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun c!27137 () Bool)

(declare-fun bm!15881 () Bool)

(declare-fun call!15884 () Bool)

(assert (=> bm!15881 (= call!15884 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27137 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27084 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721) Nil!1721)) (ite c!27084 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721) Nil!1721))))))

(declare-fun b!143389 () Bool)

(assert (=> b!143389 (= e!93450 (contains!911 (ite c!27084 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721) Nil!1721) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!143390 () Bool)

(declare-fun e!93447 () Bool)

(assert (=> b!143390 (= e!93447 call!15884)))

(declare-fun b!143391 () Bool)

(assert (=> b!143391 (= e!93449 e!93447)))

(assert (=> b!143391 (= c!27137 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!45821 () Bool)

(declare-fun res!68304 () Bool)

(assert (=> d!45821 (=> res!68304 e!93448)))

(assert (=> d!45821 (= res!68304 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> d!45821 (= (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27084 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721) Nil!1721)) e!93448)))

(declare-fun b!143392 () Bool)

(assert (=> b!143392 (= e!93447 call!15884)))

(assert (= (and d!45821 (not res!68304)) b!143388))

(assert (= (and b!143388 res!68303) b!143389))

(assert (= (and b!143388 res!68302) b!143391))

(assert (= (and b!143391 c!27137) b!143392))

(assert (= (and b!143391 (not c!27137)) b!143390))

(assert (= (or b!143392 b!143390) bm!15881))

(declare-fun m!172979 () Bool)

(assert (=> b!143388 m!172979))

(assert (=> b!143388 m!172979))

(declare-fun m!172981 () Bool)

(assert (=> b!143388 m!172981))

(assert (=> bm!15881 m!172979))

(declare-fun m!172983 () Bool)

(assert (=> bm!15881 m!172983))

(assert (=> b!143389 m!172979))

(assert (=> b!143389 m!172979))

(declare-fun m!172985 () Bool)

(assert (=> b!143389 m!172985))

(assert (=> b!143391 m!172979))

(assert (=> b!143391 m!172979))

(assert (=> b!143391 m!172981))

(assert (=> bm!15808 d!45821))

(declare-fun d!45823 () Bool)

(declare-fun e!93453 () Bool)

(assert (=> d!45823 e!93453))

(declare-fun res!68310 () Bool)

(assert (=> d!45823 (=> (not res!68310) (not e!93453))))

(declare-fun lt!75107 () ListLongMap!1689)

(assert (=> d!45823 (= res!68310 (contains!908 lt!75107 (_1!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75106 () List!1725)

(assert (=> d!45823 (= lt!75107 (ListLongMap!1690 lt!75106))))

(declare-fun lt!75109 () Unit!4532)

(declare-fun lt!75108 () Unit!4532)

(assert (=> d!45823 (= lt!75109 lt!75108)))

(assert (=> d!45823 (= (getValueByKey!178 lt!75106 (_1!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!183 (_2!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!92 (List!1725 (_ BitVec 64) V!3561) Unit!4532)

(assert (=> d!45823 (= lt!75108 (lemmaContainsTupThenGetReturnValue!92 lt!75106 (_1!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!95 (List!1725 (_ BitVec 64) V!3561) List!1725)

(assert (=> d!45823 (= lt!75106 (insertStrictlySorted!95 (toList!860 (ite c!27129 call!15867 call!15880)) (_1!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45823 (= (+!174 (ite c!27129 call!15867 call!15880) (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75107)))

(declare-fun b!143397 () Bool)

(declare-fun res!68309 () Bool)

(assert (=> b!143397 (=> (not res!68309) (not e!93453))))

(assert (=> b!143397 (= res!68309 (= (getValueByKey!178 (toList!860 lt!75107) (_1!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!183 (_2!1326 (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!143398 () Bool)

(declare-fun contains!912 (List!1725 tuple2!2630) Bool)

(assert (=> b!143398 (= e!93453 (contains!912 (toList!860 lt!75107) (ite c!27129 (ite c!27117 (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!45823 res!68310) b!143397))

(assert (= (and b!143397 res!68309) b!143398))

(declare-fun m!172987 () Bool)

(assert (=> d!45823 m!172987))

(declare-fun m!172989 () Bool)

(assert (=> d!45823 m!172989))

(declare-fun m!172991 () Bool)

(assert (=> d!45823 m!172991))

(declare-fun m!172993 () Bool)

(assert (=> d!45823 m!172993))

(declare-fun m!172995 () Bool)

(assert (=> b!143397 m!172995))

(declare-fun m!172997 () Bool)

(assert (=> b!143398 m!172997))

(assert (=> bm!15865 d!45823))

(declare-fun b!143399 () Bool)

(declare-fun res!68311 () Bool)

(declare-fun e!93462 () Bool)

(assert (=> b!143399 (=> (not res!68311) (not e!93462))))

(declare-fun e!93455 () Bool)

(assert (=> b!143399 (= res!68311 e!93455)))

(declare-fun res!68319 () Bool)

(assert (=> b!143399 (=> res!68319 e!93455)))

(declare-fun e!93458 () Bool)

(assert (=> b!143399 (= res!68319 (not e!93458))))

(declare-fun res!68316 () Bool)

(assert (=> b!143399 (=> (not res!68316) (not e!93458))))

(assert (=> b!143399 (= res!68316 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143400 () Bool)

(declare-fun e!93456 () Bool)

(assert (=> b!143400 (= e!93456 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143401 () Bool)

(declare-fun e!93454 () ListLongMap!1689)

(declare-fun call!15887 () ListLongMap!1689)

(assert (=> b!143401 (= e!93454 call!15887)))

(declare-fun bm!15882 () Bool)

(declare-fun call!15889 () ListLongMap!1689)

(assert (=> bm!15882 (= call!15889 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143402 () Bool)

(declare-fun e!93460 () ListLongMap!1689)

(assert (=> b!143402 (= e!93460 call!15887)))

(declare-fun b!143403 () Bool)

(declare-fun e!93465 () Bool)

(declare-fun lt!75110 () ListLongMap!1689)

(assert (=> b!143403 (= e!93465 (= (apply!121 lt!75110 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 newMap!16)))))

(declare-fun b!143404 () Bool)

(assert (=> b!143404 (= e!93458 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143405 () Bool)

(declare-fun e!93459 () Unit!4532)

(declare-fun Unit!4540 () Unit!4532)

(assert (=> b!143405 (= e!93459 Unit!4540)))

(declare-fun b!143406 () Bool)

(declare-fun e!93461 () Bool)

(assert (=> b!143406 (= e!93462 e!93461)))

(declare-fun c!27139 () Bool)

(assert (=> b!143406 (= c!27139 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143407 () Bool)

(declare-fun e!93463 () Bool)

(assert (=> b!143407 (= e!93463 (= (apply!121 lt!75110 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 newMap!16)))))

(declare-fun b!143408 () Bool)

(declare-fun e!93466 () Bool)

(assert (=> b!143408 (= e!93455 e!93466)))

(declare-fun res!68312 () Bool)

(assert (=> b!143408 (=> (not res!68312) (not e!93466))))

(assert (=> b!143408 (= res!68312 (contains!908 lt!75110 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143408 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143409 () Bool)

(declare-fun res!68314 () Bool)

(assert (=> b!143409 (=> (not res!68314) (not e!93462))))

(declare-fun e!93457 () Bool)

(assert (=> b!143409 (= res!68314 e!93457)))

(declare-fun c!27142 () Bool)

(assert (=> b!143409 (= c!27142 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143410 () Bool)

(declare-fun call!15891 () Bool)

(assert (=> b!143410 (= e!93461 (not call!15891))))

(declare-fun bm!15883 () Bool)

(declare-fun call!15890 () ListLongMap!1689)

(assert (=> bm!15883 (= call!15887 call!15890)))

(declare-fun b!143411 () Bool)

(assert (=> b!143411 (= e!93461 e!93463)))

(declare-fun res!68315 () Bool)

(assert (=> b!143411 (= res!68315 call!15891)))

(assert (=> b!143411 (=> (not res!68315) (not e!93463))))

(declare-fun b!143412 () Bool)

(declare-fun c!27141 () Bool)

(assert (=> b!143412 (= c!27141 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143412 (= e!93460 e!93454)))

(declare-fun call!15888 () ListLongMap!1689)

(declare-fun c!27140 () Bool)

(declare-fun bm!15884 () Bool)

(declare-fun c!27138 () Bool)

(declare-fun call!15886 () ListLongMap!1689)

(assert (=> bm!15884 (= call!15890 (+!174 (ite c!27140 call!15889 (ite c!27138 call!15886 call!15888)) (ite (or c!27140 c!27138) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16)))))))

(declare-fun b!143413 () Bool)

(assert (=> b!143413 (= e!93466 (= (apply!121 lt!75110 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2313 (_values!2945 newMap!16)) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2586 (_values!2945 newMap!16))))))

(assert (=> b!143413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun d!45825 () Bool)

(assert (=> d!45825 e!93462))

(declare-fun res!68318 () Bool)

(assert (=> d!45825 (=> (not res!68318) (not e!93462))))

(assert (=> d!45825 (= res!68318 (or (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))))

(declare-fun lt!75115 () ListLongMap!1689)

(assert (=> d!45825 (= lt!75110 lt!75115)))

(declare-fun lt!75129 () Unit!4532)

(assert (=> d!45825 (= lt!75129 e!93459)))

(declare-fun c!27143 () Bool)

(assert (=> d!45825 (= c!27143 e!93456)))

(declare-fun res!68317 () Bool)

(assert (=> d!45825 (=> (not res!68317) (not e!93456))))

(assert (=> d!45825 (= res!68317 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun e!93464 () ListLongMap!1689)

(assert (=> d!45825 (= lt!75115 e!93464)))

(assert (=> d!45825 (= c!27140 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45825 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45825 (= (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75110)))

(declare-fun b!143414 () Bool)

(assert (=> b!143414 (= e!93457 e!93465)))

(declare-fun res!68313 () Bool)

(declare-fun call!15885 () Bool)

(assert (=> b!143414 (= res!68313 call!15885)))

(assert (=> b!143414 (=> (not res!68313) (not e!93465))))

(declare-fun bm!15885 () Bool)

(assert (=> bm!15885 (= call!15886 call!15889)))

(declare-fun b!143415 () Bool)

(assert (=> b!143415 (= e!93457 (not call!15885))))

(declare-fun bm!15886 () Bool)

(assert (=> bm!15886 (= call!15885 (contains!908 lt!75110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143416 () Bool)

(assert (=> b!143416 (= e!93464 (+!174 call!15890 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16))))))

(declare-fun b!143417 () Bool)

(assert (=> b!143417 (= e!93464 e!93460)))

(assert (=> b!143417 (= c!27138 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143418 () Bool)

(assert (=> b!143418 (= e!93454 call!15888)))

(declare-fun bm!15887 () Bool)

(assert (=> bm!15887 (= call!15888 call!15886)))

(declare-fun bm!15888 () Bool)

(assert (=> bm!15888 (= call!15891 (contains!908 lt!75110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143419 () Bool)

(declare-fun lt!75122 () Unit!4532)

(assert (=> b!143419 (= e!93459 lt!75122)))

(declare-fun lt!75128 () ListLongMap!1689)

(assert (=> b!143419 (= lt!75128 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75124 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75120 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75120 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75121 () Unit!4532)

(assert (=> b!143419 (= lt!75121 (addStillContains!97 lt!75128 lt!75124 (zeroValue!2810 newMap!16) lt!75120))))

(assert (=> b!143419 (contains!908 (+!174 lt!75128 (tuple2!2631 lt!75124 (zeroValue!2810 newMap!16))) lt!75120)))

(declare-fun lt!75127 () Unit!4532)

(assert (=> b!143419 (= lt!75127 lt!75121)))

(declare-fun lt!75116 () ListLongMap!1689)

(assert (=> b!143419 (= lt!75116 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75114 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75111 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75111 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75125 () Unit!4532)

(assert (=> b!143419 (= lt!75125 (addApplyDifferent!97 lt!75116 lt!75114 (minValue!2810 newMap!16) lt!75111))))

(assert (=> b!143419 (= (apply!121 (+!174 lt!75116 (tuple2!2631 lt!75114 (minValue!2810 newMap!16))) lt!75111) (apply!121 lt!75116 lt!75111))))

(declare-fun lt!75117 () Unit!4532)

(assert (=> b!143419 (= lt!75117 lt!75125)))

(declare-fun lt!75112 () ListLongMap!1689)

(assert (=> b!143419 (= lt!75112 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75131 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75131 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75118 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75118 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75126 () Unit!4532)

(assert (=> b!143419 (= lt!75126 (addApplyDifferent!97 lt!75112 lt!75131 (zeroValue!2810 newMap!16) lt!75118))))

(assert (=> b!143419 (= (apply!121 (+!174 lt!75112 (tuple2!2631 lt!75131 (zeroValue!2810 newMap!16))) lt!75118) (apply!121 lt!75112 lt!75118))))

(declare-fun lt!75119 () Unit!4532)

(assert (=> b!143419 (= lt!75119 lt!75126)))

(declare-fun lt!75123 () ListLongMap!1689)

(assert (=> b!143419 (= lt!75123 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75130 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75130 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75113 () (_ BitVec 64))

(assert (=> b!143419 (= lt!75113 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143419 (= lt!75122 (addApplyDifferent!97 lt!75123 lt!75130 (minValue!2810 newMap!16) lt!75113))))

(assert (=> b!143419 (= (apply!121 (+!174 lt!75123 (tuple2!2631 lt!75130 (minValue!2810 newMap!16))) lt!75113) (apply!121 lt!75123 lt!75113))))

(assert (= (and d!45825 c!27140) b!143416))

(assert (= (and d!45825 (not c!27140)) b!143417))

(assert (= (and b!143417 c!27138) b!143402))

(assert (= (and b!143417 (not c!27138)) b!143412))

(assert (= (and b!143412 c!27141) b!143401))

(assert (= (and b!143412 (not c!27141)) b!143418))

(assert (= (or b!143401 b!143418) bm!15887))

(assert (= (or b!143402 bm!15887) bm!15885))

(assert (= (or b!143402 b!143401) bm!15883))

(assert (= (or b!143416 bm!15885) bm!15882))

(assert (= (or b!143416 bm!15883) bm!15884))

(assert (= (and d!45825 res!68317) b!143400))

(assert (= (and d!45825 c!27143) b!143419))

(assert (= (and d!45825 (not c!27143)) b!143405))

(assert (= (and d!45825 res!68318) b!143399))

(assert (= (and b!143399 res!68316) b!143404))

(assert (= (and b!143399 (not res!68319)) b!143408))

(assert (= (and b!143408 res!68312) b!143413))

(assert (= (and b!143399 res!68311) b!143409))

(assert (= (and b!143409 c!27142) b!143414))

(assert (= (and b!143409 (not c!27142)) b!143415))

(assert (= (and b!143414 res!68313) b!143403))

(assert (= (or b!143414 b!143415) bm!15886))

(assert (= (and b!143409 res!68314) b!143406))

(assert (= (and b!143406 c!27139) b!143411))

(assert (= (and b!143406 (not c!27139)) b!143410))

(assert (= (and b!143411 res!68315) b!143407))

(assert (= (or b!143411 b!143410) bm!15888))

(declare-fun b_lambda!6449 () Bool)

(assert (=> (not b_lambda!6449) (not b!143413)))

(declare-fun t!6340 () Bool)

(declare-fun tb!2573 () Bool)

(assert (=> (and b!143013 (= (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) (defaultEntry!2962 newMap!16)) t!6340) tb!2573))

(declare-fun result!4219 () Bool)

(assert (=> tb!2573 (= result!4219 tp_is_empty!2935)))

(assert (=> b!143413 t!6340))

(declare-fun b_and!8945 () Bool)

(assert (= b_and!8941 (and (=> t!6340 result!4219) b_and!8945)))

(declare-fun t!6342 () Bool)

(declare-fun tb!2575 () Bool)

(assert (=> (and b!143006 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 newMap!16)) t!6342) tb!2575))

(declare-fun result!4221 () Bool)

(assert (= result!4221 result!4219))

(assert (=> b!143413 t!6342))

(declare-fun b_and!8947 () Bool)

(assert (= b_and!8943 (and (=> t!6342 result!4221) b_and!8947)))

(declare-fun m!172999 () Bool)

(assert (=> d!45825 m!172999))

(declare-fun m!173001 () Bool)

(assert (=> bm!15888 m!173001))

(declare-fun m!173003 () Bool)

(assert (=> b!143403 m!173003))

(declare-fun m!173005 () Bool)

(assert (=> bm!15886 m!173005))

(declare-fun m!173007 () Bool)

(assert (=> b!143416 m!173007))

(assert (=> b!143408 m!172975))

(assert (=> b!143408 m!172975))

(declare-fun m!173009 () Bool)

(assert (=> b!143408 m!173009))

(declare-fun m!173011 () Bool)

(assert (=> b!143413 m!173011))

(assert (=> b!143413 m!173011))

(declare-fun m!173013 () Bool)

(assert (=> b!143413 m!173013))

(declare-fun m!173015 () Bool)

(assert (=> b!143413 m!173015))

(assert (=> b!143413 m!172975))

(declare-fun m!173017 () Bool)

(assert (=> b!143413 m!173017))

(assert (=> b!143413 m!172975))

(assert (=> b!143413 m!173013))

(declare-fun m!173019 () Bool)

(assert (=> b!143419 m!173019))

(declare-fun m!173021 () Bool)

(assert (=> b!143419 m!173021))

(declare-fun m!173023 () Bool)

(assert (=> b!143419 m!173023))

(declare-fun m!173025 () Bool)

(assert (=> b!143419 m!173025))

(declare-fun m!173027 () Bool)

(assert (=> b!143419 m!173027))

(assert (=> b!143419 m!173019))

(declare-fun m!173029 () Bool)

(assert (=> b!143419 m!173029))

(declare-fun m!173031 () Bool)

(assert (=> b!143419 m!173031))

(declare-fun m!173033 () Bool)

(assert (=> b!143419 m!173033))

(declare-fun m!173035 () Bool)

(assert (=> b!143419 m!173035))

(declare-fun m!173037 () Bool)

(assert (=> b!143419 m!173037))

(declare-fun m!173039 () Bool)

(assert (=> b!143419 m!173039))

(assert (=> b!143419 m!173033))

(declare-fun m!173041 () Bool)

(assert (=> b!143419 m!173041))

(declare-fun m!173043 () Bool)

(assert (=> b!143419 m!173043))

(assert (=> b!143419 m!172975))

(declare-fun m!173045 () Bool)

(assert (=> b!143419 m!173045))

(assert (=> b!143419 m!173021))

(declare-fun m!173047 () Bool)

(assert (=> b!143419 m!173047))

(assert (=> b!143419 m!173043))

(declare-fun m!173049 () Bool)

(assert (=> b!143419 m!173049))

(assert (=> b!143400 m!172975))

(assert (=> b!143400 m!172975))

(declare-fun m!173051 () Bool)

(assert (=> b!143400 m!173051))

(declare-fun m!173053 () Bool)

(assert (=> bm!15884 m!173053))

(assert (=> b!143404 m!172975))

(assert (=> b!143404 m!172975))

(assert (=> b!143404 m!173051))

(declare-fun m!173055 () Bool)

(assert (=> b!143407 m!173055))

(assert (=> bm!15882 m!173035))

(assert (=> bm!15859 d!45825))

(declare-fun b!143428 () Bool)

(declare-fun e!93472 () (_ BitVec 32))

(declare-fun call!15894 () (_ BitVec 32))

(assert (=> b!143428 (= e!93472 (bvadd #b00000000000000000000000000000001 call!15894))))

(declare-fun b!143429 () Bool)

(assert (=> b!143429 (= e!93472 call!15894)))

(declare-fun d!45827 () Bool)

(declare-fun lt!75134 () (_ BitVec 32))

(assert (=> d!45827 (and (bvsge lt!75134 #b00000000000000000000000000000000) (bvsle lt!75134 (bvsub (size!2585 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!93471 () (_ BitVec 32))

(assert (=> d!45827 (= lt!75134 e!93471)))

(declare-fun c!27148 () Bool)

(assert (=> d!45827 (= c!27148 (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(assert (=> d!45827 (and (bvsle #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2585 (_keys!4725 newMap!16)) (size!2585 (_keys!4725 newMap!16))))))

(assert (=> d!45827 (= (arrayCountValidKeys!0 (_keys!4725 newMap!16) #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) lt!75134)))

(declare-fun b!143430 () Bool)

(assert (=> b!143430 (= e!93471 #b00000000000000000000000000000000)))

(declare-fun b!143431 () Bool)

(assert (=> b!143431 (= e!93471 e!93472)))

(declare-fun c!27149 () Bool)

(assert (=> b!143431 (= c!27149 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15891 () Bool)

(assert (=> bm!15891 (= call!15894 (arrayCountValidKeys!0 (_keys!4725 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2585 (_keys!4725 newMap!16))))))

(assert (= (and d!45827 c!27148) b!143430))

(assert (= (and d!45827 (not c!27148)) b!143431))

(assert (= (and b!143431 c!27149) b!143428))

(assert (= (and b!143431 (not c!27149)) b!143429))

(assert (= (or b!143428 b!143429) bm!15891))

(assert (=> b!143431 m!172975))

(assert (=> b!143431 m!172975))

(assert (=> b!143431 m!173051))

(declare-fun m!173057 () Bool)

(assert (=> bm!15891 m!173057))

(assert (=> b!143220 d!45827))

(declare-fun d!45829 () Bool)

(assert (=> d!45829 (= (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (and (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143197 d!45829))

(declare-fun d!45831 () Bool)

(declare-fun e!93474 () Bool)

(assert (=> d!45831 e!93474))

(declare-fun res!68320 () Bool)

(assert (=> d!45831 (=> res!68320 e!93474)))

(declare-fun lt!75136 () Bool)

(assert (=> d!45831 (= res!68320 (not lt!75136))))

(declare-fun lt!75135 () Bool)

(assert (=> d!45831 (= lt!75136 lt!75135)))

(declare-fun lt!75137 () Unit!4532)

(declare-fun e!93473 () Unit!4532)

(assert (=> d!45831 (= lt!75137 e!93473)))

(declare-fun c!27150 () Bool)

(assert (=> d!45831 (= c!27150 lt!75135)))

(assert (=> d!45831 (= lt!75135 (containsKey!181 (toList!860 lt!74977) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!45831 (= (contains!908 lt!74977 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75136)))

(declare-fun b!143432 () Bool)

(declare-fun lt!75138 () Unit!4532)

(assert (=> b!143432 (= e!93473 lt!75138)))

(assert (=> b!143432 (= lt!75138 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 lt!74977) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143432 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143433 () Bool)

(declare-fun Unit!4541 () Unit!4532)

(assert (=> b!143433 (= e!93473 Unit!4541)))

(declare-fun b!143434 () Bool)

(assert (=> b!143434 (= e!93474 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!45831 c!27150) b!143432))

(assert (= (and d!45831 (not c!27150)) b!143433))

(assert (= (and d!45831 (not res!68320)) b!143434))

(assert (=> d!45831 m!172815))

(declare-fun m!173059 () Bool)

(assert (=> d!45831 m!173059))

(assert (=> b!143432 m!172815))

(declare-fun m!173061 () Bool)

(assert (=> b!143432 m!173061))

(assert (=> b!143432 m!172815))

(assert (=> b!143432 m!172967))

(assert (=> b!143432 m!172967))

(declare-fun m!173063 () Bool)

(assert (=> b!143432 m!173063))

(assert (=> b!143434 m!172815))

(assert (=> b!143434 m!172967))

(assert (=> b!143434 m!172967))

(assert (=> b!143434 m!173063))

(assert (=> b!143175 d!45831))

(assert (=> d!45773 d!45825))

(declare-fun b!143469 () Bool)

(declare-fun e!93493 () Bool)

(declare-fun call!15905 () Bool)

(assert (=> b!143469 (= e!93493 (not call!15905))))

(declare-fun d!45833 () Bool)

(declare-fun e!93497 () Bool)

(assert (=> d!45833 e!93497))

(declare-fun res!68345 () Bool)

(assert (=> d!45833 (=> (not res!68345) (not e!93497))))

(declare-fun lt!75212 () tuple2!2632)

(assert (=> d!45833 (= res!68345 (_1!1327 lt!75212))))

(assert (=> d!45833 (= lt!75212 (tuple2!2633 true (LongMapFixedSize!1157 (defaultEntry!2962 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (bvadd (_size!627 newMap!16) #b00000000000000000000000000000001) (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))) (_vacant!627 newMap!16))))))

(declare-fun lt!75225 () Unit!4532)

(declare-fun lt!75211 () Unit!4532)

(assert (=> d!45833 (= lt!75225 lt!75211)))

(declare-fun lt!75208 () array!4893)

(declare-fun lt!75207 () array!4895)

(assert (=> d!45833 (contains!908 (getCurrentListMap!533 lt!75208 lt!75207 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072))))))

(assert (=> d!45833 (= lt!75211 (lemmaValidKeyInArrayIsInListMap!126 lt!75208 lt!75207 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45833 (= lt!75207 (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))))))

(assert (=> d!45833 (= lt!75208 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun lt!75226 () Unit!4532)

(declare-fun lt!75210 () Unit!4532)

(assert (=> d!45833 (= lt!75226 lt!75210)))

(declare-fun lt!75220 () array!4893)

(assert (=> d!45833 (= (arrayCountValidKeys!0 lt!75220 (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (bvadd (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4893 (_ BitVec 32)) Unit!4532)

(assert (=> d!45833 (= lt!75210 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75220 (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072))))))

(assert (=> d!45833 (= lt!75220 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun lt!75209 () Unit!4532)

(declare-fun lt!75227 () Unit!4532)

(assert (=> d!45833 (= lt!75209 lt!75227)))

(declare-fun lt!75223 () array!4893)

(assert (=> d!45833 (arrayContainsKey!0 lt!75223 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4893 (_ BitVec 64) (_ BitVec 32)) Unit!4532)

(assert (=> d!45833 (= lt!75227 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75223 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072))))))

(assert (=> d!45833 (= lt!75223 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun lt!75204 () Unit!4532)

(declare-fun lt!75199 () Unit!4532)

(assert (=> d!45833 (= lt!75204 lt!75199)))

(assert (=> d!45833 (= (+!174 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!533 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!46 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4532)

(assert (=> d!45833 (= lt!75199 (lemmaAddValidKeyToArrayThenAddPairToListMap!46 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75222 () Unit!4532)

(declare-fun lt!75205 () Unit!4532)

(assert (=> d!45833 (= lt!75222 lt!75205)))

(assert (=> d!45833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))) (mask!7314 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4893 (_ BitVec 32) (_ BitVec 32)) Unit!4532)

(assert (=> d!45833 (= lt!75205 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (mask!7314 newMap!16)))))

(declare-fun lt!75228 () Unit!4532)

(declare-fun lt!75201 () Unit!4532)

(assert (=> d!45833 (= lt!75228 lt!75201)))

(assert (=> d!45833 (= (arrayCountValidKeys!0 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))) #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4725 newMap!16) #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4893 (_ BitVec 32) (_ BitVec 64)) Unit!4532)

(assert (=> d!45833 (= lt!75201 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4725 newMap!16) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun lt!75218 () Unit!4532)

(declare-fun lt!75214 () Unit!4532)

(assert (=> d!45833 (= lt!75218 lt!75214)))

(declare-fun lt!75203 () List!1724)

(declare-fun lt!75217 () (_ BitVec 32))

(assert (=> d!45833 (arrayNoDuplicates!0 (array!4894 (store (arr!2312 (_keys!4725 newMap!16)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (size!2585 (_keys!4725 newMap!16))) lt!75217 lt!75203)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4893 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1724) Unit!4532)

(assert (=> d!45833 (= lt!75214 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072)) lt!75217 lt!75203))))

(assert (=> d!45833 (= lt!75203 Nil!1721)))

(assert (=> d!45833 (= lt!75217 #b00000000000000000000000000000000)))

(declare-fun lt!75202 () Unit!4532)

(declare-fun e!93494 () Unit!4532)

(assert (=> d!45833 (= lt!75202 e!93494)))

(declare-fun c!27161 () Bool)

(assert (=> d!45833 (= c!27161 (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75213 () Unit!4532)

(declare-fun e!93495 () Unit!4532)

(assert (=> d!45833 (= lt!75213 e!93495)))

(declare-fun c!27162 () Bool)

(assert (=> d!45833 (= c!27162 (contains!908 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45833 (valid!571 newMap!16)))

(assert (=> d!45833 (= (updateHelperNewKey!66 newMap!16 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27120 (index!3263 lt!75072) (index!3260 lt!75072))) lt!75212)))

(declare-fun bm!15900 () Bool)

(assert (=> bm!15900 (= call!15905 (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!143470 () Bool)

(declare-fun e!93498 () Bool)

(assert (=> b!143470 (= e!93498 e!93493)))

(declare-fun res!68344 () Bool)

(declare-fun call!15906 () Bool)

(assert (=> b!143470 (= res!68344 call!15906)))

(assert (=> b!143470 (=> (not res!68344) (not e!93493))))

(declare-fun b!143471 () Bool)

(declare-fun res!68343 () Bool)

(declare-fun lt!75200 () SeekEntryResult!274)

(assert (=> b!143471 (= res!68343 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3263 lt!75200)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143471 (=> (not res!68343) (not e!93493))))

(declare-fun call!15904 () SeekEntryResult!274)

(declare-fun bm!15901 () Bool)

(assert (=> bm!15901 (= call!15904 (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun b!143472 () Bool)

(declare-fun res!68339 () Bool)

(declare-fun e!93492 () Bool)

(assert (=> b!143472 (=> (not res!68339) (not e!93492))))

(assert (=> b!143472 (= res!68339 call!15906)))

(declare-fun e!93496 () Bool)

(assert (=> b!143472 (= e!93496 e!93492)))

(declare-fun b!143473 () Bool)

(declare-fun res!68340 () Bool)

(assert (=> b!143473 (=> (not res!68340) (not e!93497))))

(assert (=> b!143473 (= res!68340 (valid!571 (_2!1327 lt!75212)))))

(declare-fun b!143474 () Bool)

(declare-fun res!68341 () Bool)

(assert (=> b!143474 (=> (not res!68341) (not e!93492))))

(assert (=> b!143474 (= res!68341 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3260 lt!75200)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143475 () Bool)

(assert (=> b!143475 (= e!93497 (= (map!1433 (_2!1327 lt!75212)) (+!174 (map!1433 newMap!16) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143476 () Bool)

(declare-fun c!27159 () Bool)

(assert (=> b!143476 (= c!27159 ((_ is MissingVacant!274) lt!75200))))

(assert (=> b!143476 (= e!93496 e!93498)))

(declare-fun b!143477 () Bool)

(declare-fun Unit!4542 () Unit!4532)

(assert (=> b!143477 (= e!93494 Unit!4542)))

(declare-fun b!143478 () Bool)

(declare-fun res!68347 () Bool)

(declare-fun call!15903 () Bool)

(assert (=> b!143478 (= res!68347 call!15903)))

(declare-fun e!93491 () Bool)

(assert (=> b!143478 (=> (not res!68347) (not e!93491))))

(declare-fun b!143479 () Bool)

(declare-fun Unit!4543 () Unit!4532)

(assert (=> b!143479 (= e!93494 Unit!4543)))

(declare-fun lt!75216 () Unit!4532)

(declare-fun lemmaArrayContainsKeyThenInListMap!46 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) (_ BitVec 32) Int) Unit!4532)

(assert (=> b!143479 (= lt!75216 (lemmaArrayContainsKeyThenInListMap!46 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(assert (=> b!143479 (contains!908 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))

(declare-fun lt!75221 () Unit!4532)

(assert (=> b!143479 (= lt!75221 lt!75216)))

(assert (=> b!143479 false))

(declare-fun bm!15902 () Bool)

(assert (=> bm!15902 (= call!15906 call!15903)))

(declare-fun b!143480 () Bool)

(assert (=> b!143480 (= e!93498 ((_ is Undefined!274) lt!75200))))

(declare-fun b!143481 () Bool)

(declare-fun res!68346 () Bool)

(assert (=> b!143481 (=> (not res!68346) (not e!93497))))

(assert (=> b!143481 (= res!68346 (contains!908 (map!1433 (_2!1327 lt!75212)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun lt!75219 () SeekEntryResult!274)

(declare-fun b!143482 () Bool)

(assert (=> b!143482 (= e!93491 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75219)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143483 () Bool)

(assert (=> b!143483 (= e!93492 (not call!15905))))

(declare-fun b!143484 () Bool)

(declare-fun lt!75206 () Unit!4532)

(assert (=> b!143484 (= e!93495 lt!75206)))

(assert (=> b!143484 (= lt!75206 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143484 (= lt!75200 call!15904)))

(declare-fun c!27160 () Bool)

(assert (=> b!143484 (= c!27160 ((_ is MissingZero!274) lt!75200))))

(assert (=> b!143484 e!93496))

(declare-fun bm!15903 () Bool)

(assert (=> bm!15903 (= call!15903 (inRange!0 (ite c!27162 (index!3261 lt!75219) (ite c!27160 (index!3260 lt!75200) (index!3263 lt!75200))) (mask!7314 newMap!16)))))

(declare-fun b!143485 () Bool)

(declare-fun Unit!4544 () Unit!4532)

(assert (=> b!143485 (= e!93495 Unit!4544)))

(declare-fun lt!75215 () Unit!4532)

(assert (=> b!143485 (= lt!75215 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> b!143485 (= lt!75219 call!15904)))

(declare-fun res!68342 () Bool)

(assert (=> b!143485 (= res!68342 ((_ is Found!274) lt!75219))))

(assert (=> b!143485 (=> (not res!68342) (not e!93491))))

(assert (=> b!143485 e!93491))

(declare-fun lt!75224 () Unit!4532)

(assert (=> b!143485 (= lt!75224 lt!75215)))

(assert (=> b!143485 false))

(assert (= (and d!45833 c!27162) b!143485))

(assert (= (and d!45833 (not c!27162)) b!143484))

(assert (= (and b!143485 res!68342) b!143478))

(assert (= (and b!143478 res!68347) b!143482))

(assert (= (and b!143484 c!27160) b!143472))

(assert (= (and b!143484 (not c!27160)) b!143476))

(assert (= (and b!143472 res!68339) b!143474))

(assert (= (and b!143474 res!68341) b!143483))

(assert (= (and b!143476 c!27159) b!143470))

(assert (= (and b!143476 (not c!27159)) b!143480))

(assert (= (and b!143470 res!68344) b!143471))

(assert (= (and b!143471 res!68343) b!143469))

(assert (= (or b!143472 b!143470) bm!15902))

(assert (= (or b!143483 b!143469) bm!15900))

(assert (= (or b!143478 bm!15902) bm!15903))

(assert (= (or b!143485 b!143484) bm!15901))

(assert (= (and d!45833 c!27161) b!143479))

(assert (= (and d!45833 (not c!27161)) b!143477))

(assert (= (and d!45833 res!68345) b!143473))

(assert (= (and b!143473 res!68340) b!143481))

(assert (= (and b!143481 res!68346) b!143475))

(declare-fun m!173065 () Bool)

(assert (=> b!143471 m!173065))

(assert (=> bm!15901 m!172677))

(assert (=> bm!15901 m!172923))

(assert (=> b!143485 m!172677))

(assert (=> b!143485 m!172901))

(declare-fun m!173067 () Bool)

(assert (=> b!143473 m!173067))

(declare-fun m!173069 () Bool)

(assert (=> b!143481 m!173069))

(assert (=> b!143481 m!173069))

(assert (=> b!143481 m!172677))

(declare-fun m!173071 () Bool)

(assert (=> b!143481 m!173071))

(declare-fun m!173073 () Bool)

(assert (=> b!143474 m!173073))

(assert (=> bm!15900 m!172677))

(assert (=> bm!15900 m!172933))

(assert (=> b!143479 m!172677))

(declare-fun m!173075 () Bool)

(assert (=> b!143479 m!173075))

(assert (=> b!143479 m!172803))

(assert (=> b!143479 m!172803))

(assert (=> b!143479 m!172677))

(declare-fun m!173077 () Bool)

(assert (=> b!143479 m!173077))

(assert (=> b!143475 m!173069))

(assert (=> b!143475 m!172679))

(assert (=> b!143475 m!172679))

(declare-fun m!173079 () Bool)

(assert (=> b!143475 m!173079))

(assert (=> d!45833 m!172677))

(assert (=> d!45833 m!172713))

(declare-fun m!173081 () Bool)

(assert (=> d!45833 m!173081))

(declare-fun m!173083 () Bool)

(assert (=> d!45833 m!173083))

(assert (=> d!45833 m!172677))

(declare-fun m!173085 () Bool)

(assert (=> d!45833 m!173085))

(assert (=> d!45833 m!172677))

(assert (=> d!45833 m!172933))

(declare-fun m!173087 () Bool)

(assert (=> d!45833 m!173087))

(declare-fun m!173089 () Bool)

(assert (=> d!45833 m!173089))

(declare-fun m!173091 () Bool)

(assert (=> d!45833 m!173091))

(declare-fun m!173093 () Bool)

(assert (=> d!45833 m!173093))

(assert (=> d!45833 m!172677))

(declare-fun m!173095 () Bool)

(assert (=> d!45833 m!173095))

(assert (=> d!45833 m!172677))

(declare-fun m!173097 () Bool)

(assert (=> d!45833 m!173097))

(assert (=> d!45833 m!172677))

(declare-fun m!173099 () Bool)

(assert (=> d!45833 m!173099))

(declare-fun m!173101 () Bool)

(assert (=> d!45833 m!173101))

(declare-fun m!173103 () Bool)

(assert (=> d!45833 m!173103))

(assert (=> d!45833 m!172695))

(assert (=> d!45833 m!172877))

(assert (=> d!45833 m!173089))

(assert (=> d!45833 m!172803))

(declare-fun m!173105 () Bool)

(assert (=> d!45833 m!173105))

(declare-fun m!173107 () Bool)

(assert (=> d!45833 m!173107))

(assert (=> d!45833 m!172803))

(declare-fun m!173109 () Bool)

(assert (=> d!45833 m!173109))

(assert (=> d!45833 m!172677))

(declare-fun m!173111 () Bool)

(assert (=> d!45833 m!173111))

(assert (=> d!45833 m!173087))

(declare-fun m!173113 () Bool)

(assert (=> d!45833 m!173113))

(declare-fun m!173115 () Bool)

(assert (=> d!45833 m!173115))

(assert (=> d!45833 m!172803))

(assert (=> d!45833 m!172677))

(assert (=> d!45833 m!173077))

(declare-fun m!173117 () Bool)

(assert (=> d!45833 m!173117))

(declare-fun m!173119 () Bool)

(assert (=> bm!15903 m!173119))

(declare-fun m!173121 () Bool)

(assert (=> b!143482 m!173121))

(assert (=> b!143484 m!172677))

(assert (=> b!143484 m!172903))

(assert (=> bm!15878 d!45833))

(declare-fun d!45835 () Bool)

(assert (=> d!45835 (= (map!1433 (_2!1327 lt!75076)) (getCurrentListMap!533 (_keys!4725 (_2!1327 lt!75076)) (_values!2945 (_2!1327 lt!75076)) (mask!7314 (_2!1327 lt!75076)) (extraKeys!2713 (_2!1327 lt!75076)) (zeroValue!2810 (_2!1327 lt!75076)) (minValue!2810 (_2!1327 lt!75076)) #b00000000000000000000000000000000 (defaultEntry!2962 (_2!1327 lt!75076))))))

(declare-fun bs!6074 () Bool)

(assert (= bs!6074 d!45835))

(declare-fun m!173123 () Bool)

(assert (=> bs!6074 m!173123))

(assert (=> bm!15857 d!45835))

(declare-fun d!45837 () Bool)

(assert (=> d!45837 (= (+!174 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) lt!75088 (zeroValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75231 () Unit!4532)

(declare-fun choose!877 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4532)

(assert (=> d!45837 (= lt!75231 (choose!877 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75088 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45837 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45837 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75088 (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)) lt!75231)))

(declare-fun bs!6075 () Bool)

(assert (= bs!6075 d!45837))

(assert (=> bs!6075 m!172803))

(declare-fun m!173125 () Bool)

(assert (=> bs!6075 m!173125))

(assert (=> bs!6075 m!172999))

(assert (=> bs!6075 m!172713))

(declare-fun m!173127 () Bool)

(assert (=> bs!6075 m!173127))

(assert (=> bs!6075 m!172713))

(declare-fun m!173129 () Bool)

(assert (=> bs!6075 m!173129))

(assert (=> bs!6075 m!172803))

(assert (=> b!143332 d!45837))

(declare-fun d!45839 () Bool)

(assert (=> d!45839 (= (apply!121 (+!174 lt!74990 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74980) (get!1543 (getValueByKey!178 (toList!860 (+!174 lt!74990 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74980)))))

(declare-fun bs!6076 () Bool)

(assert (= bs!6076 d!45839))

(declare-fun m!173131 () Bool)

(assert (=> bs!6076 m!173131))

(assert (=> bs!6076 m!173131))

(declare-fun m!173133 () Bool)

(assert (=> bs!6076 m!173133))

(assert (=> b!143186 d!45839))

(declare-fun b!143510 () Bool)

(declare-fun e!93513 () Bool)

(assert (=> b!143510 (= e!93513 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143510 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!143512 () Bool)

(declare-fun e!93518 () Bool)

(declare-fun e!93519 () Bool)

(assert (=> b!143512 (= e!93518 e!93519)))

(declare-fun c!27171 () Bool)

(assert (=> b!143512 (= c!27171 e!93513)))

(declare-fun res!68358 () Bool)

(assert (=> b!143512 (=> (not res!68358) (not e!93513))))

(assert (=> b!143512 (= res!68358 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143513 () Bool)

(declare-fun e!93517 () ListLongMap!1689)

(assert (=> b!143513 (= e!93517 (ListLongMap!1690 Nil!1722))))

(declare-fun b!143514 () Bool)

(declare-fun e!93516 () Bool)

(assert (=> b!143514 (= e!93519 e!93516)))

(assert (=> b!143514 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun lt!75252 () ListLongMap!1689)

(declare-fun res!68357 () Bool)

(assert (=> b!143514 (= res!68357 (contains!908 lt!75252 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143514 (=> (not res!68357) (not e!93516))))

(declare-fun b!143515 () Bool)

(assert (=> b!143515 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> b!143515 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2586 (_values!2945 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> b!143515 (= e!93516 (= (apply!121 lt!75252 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143516 () Bool)

(declare-fun e!93515 () ListLongMap!1689)

(declare-fun call!15909 () ListLongMap!1689)

(assert (=> b!143516 (= e!93515 call!15909)))

(declare-fun b!143517 () Bool)

(declare-fun e!93514 () Bool)

(declare-fun isEmpty!426 (ListLongMap!1689) Bool)

(assert (=> b!143517 (= e!93514 (isEmpty!426 lt!75252))))

(declare-fun bm!15906 () Bool)

(assert (=> bm!15906 (= call!15909 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143518 () Bool)

(declare-fun lt!75246 () Unit!4532)

(declare-fun lt!75247 () Unit!4532)

(assert (=> b!143518 (= lt!75246 lt!75247)))

(declare-fun lt!75251 () (_ BitVec 64))

(declare-fun lt!75248 () ListLongMap!1689)

(declare-fun lt!75249 () V!3561)

(declare-fun lt!75250 () (_ BitVec 64))

(assert (=> b!143518 (not (contains!908 (+!174 lt!75248 (tuple2!2631 lt!75251 lt!75249)) lt!75250))))

(declare-fun addStillNotContains!67 (ListLongMap!1689 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4532)

(assert (=> b!143518 (= lt!75247 (addStillNotContains!67 lt!75248 lt!75251 lt!75249 lt!75250))))

(assert (=> b!143518 (= lt!75250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!143518 (= lt!75249 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143518 (= lt!75251 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!143518 (= lt!75248 call!15909)))

(assert (=> b!143518 (= e!93515 (+!174 call!15909 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!143519 () Bool)

(assert (=> b!143519 (= e!93514 (= lt!75252 (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun d!45841 () Bool)

(assert (=> d!45841 e!93518))

(declare-fun res!68356 () Bool)

(assert (=> d!45841 (=> (not res!68356) (not e!93518))))

(assert (=> d!45841 (= res!68356 (not (contains!908 lt!75252 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45841 (= lt!75252 e!93517)))

(declare-fun c!27172 () Bool)

(assert (=> d!45841 (= c!27172 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(assert (=> d!45841 (validMask!0 (mask!7314 (v!3296 (underlying!482 thiss!992))))))

(assert (=> d!45841 (= (getCurrentListMapNoExtraKeys!141 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (_values!2945 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992))) (extraKeys!2713 (v!3296 (underlying!482 thiss!992))) (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) (minValue!2810 (v!3296 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992)))) lt!75252)))

(declare-fun b!143511 () Bool)

(assert (=> b!143511 (= e!93517 e!93515)))

(declare-fun c!27173 () Bool)

(assert (=> b!143511 (= c!27173 (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143520 () Bool)

(assert (=> b!143520 (= e!93519 e!93514)))

(declare-fun c!27174 () Bool)

(assert (=> b!143520 (= c!27174 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))))))

(declare-fun b!143521 () Bool)

(declare-fun res!68359 () Bool)

(assert (=> b!143521 (=> (not res!68359) (not e!93518))))

(assert (=> b!143521 (= res!68359 (not (contains!908 lt!75252 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45841 c!27172) b!143513))

(assert (= (and d!45841 (not c!27172)) b!143511))

(assert (= (and b!143511 c!27173) b!143518))

(assert (= (and b!143511 (not c!27173)) b!143516))

(assert (= (or b!143518 b!143516) bm!15906))

(assert (= (and d!45841 res!68356) b!143521))

(assert (= (and b!143521 res!68359) b!143512))

(assert (= (and b!143512 res!68358) b!143510))

(assert (= (and b!143512 c!27171) b!143514))

(assert (= (and b!143512 (not c!27171)) b!143520))

(assert (= (and b!143514 res!68357) b!143515))

(assert (= (and b!143520 c!27174) b!143519))

(assert (= (and b!143520 (not c!27174)) b!143517))

(declare-fun b_lambda!6451 () Bool)

(assert (=> (not b_lambda!6451) (not b!143515)))

(assert (=> b!143515 t!6322))

(declare-fun b_and!8949 () Bool)

(assert (= b_and!8945 (and (=> t!6322 result!4199) b_and!8949)))

(assert (=> b!143515 t!6324))

(declare-fun b_and!8951 () Bool)

(assert (= b_and!8947 (and (=> t!6324 result!4203) b_and!8951)))

(declare-fun b_lambda!6453 () Bool)

(assert (=> (not b_lambda!6453) (not b!143518)))

(assert (=> b!143518 t!6322))

(declare-fun b_and!8953 () Bool)

(assert (= b_and!8949 (and (=> t!6322 result!4199) b_and!8953)))

(assert (=> b!143518 t!6324))

(declare-fun b_and!8955 () Bool)

(assert (= b_and!8951 (and (=> t!6324 result!4203) b_and!8955)))

(declare-fun m!173135 () Bool)

(assert (=> b!143519 m!173135))

(assert (=> b!143514 m!172815))

(assert (=> b!143514 m!172815))

(declare-fun m!173137 () Bool)

(assert (=> b!143514 m!173137))

(assert (=> bm!15906 m!173135))

(declare-fun m!173139 () Bool)

(assert (=> b!143517 m!173139))

(assert (=> b!143511 m!172815))

(assert (=> b!143511 m!172815))

(assert (=> b!143511 m!172857))

(declare-fun m!173141 () Bool)

(assert (=> d!45841 m!173141))

(assert (=> d!45841 m!172805))

(assert (=> b!143518 m!172815))

(assert (=> b!143518 m!172819))

(declare-fun m!173143 () Bool)

(assert (=> b!143518 m!173143))

(declare-fun m!173145 () Bool)

(assert (=> b!143518 m!173145))

(declare-fun m!173147 () Bool)

(assert (=> b!143518 m!173147))

(assert (=> b!143518 m!173143))

(assert (=> b!143518 m!172819))

(assert (=> b!143518 m!172711))

(assert (=> b!143518 m!172821))

(declare-fun m!173149 () Bool)

(assert (=> b!143518 m!173149))

(assert (=> b!143518 m!172711))

(assert (=> b!143515 m!172815))

(assert (=> b!143515 m!172819))

(assert (=> b!143515 m!172711))

(assert (=> b!143515 m!172821))

(assert (=> b!143515 m!172815))

(declare-fun m!173151 () Bool)

(assert (=> b!143515 m!173151))

(assert (=> b!143515 m!172819))

(assert (=> b!143515 m!172711))

(assert (=> b!143510 m!172815))

(assert (=> b!143510 m!172815))

(assert (=> b!143510 m!172857))

(declare-fun m!173153 () Bool)

(assert (=> b!143521 m!173153))

(assert (=> b!143186 d!45841))

(declare-fun d!45843 () Bool)

(declare-fun e!93520 () Bool)

(assert (=> d!45843 e!93520))

(declare-fun res!68361 () Bool)

(assert (=> d!45843 (=> (not res!68361) (not e!93520))))

(declare-fun lt!75254 () ListLongMap!1689)

(assert (=> d!45843 (= res!68361 (contains!908 lt!75254 (_1!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun lt!75253 () List!1725)

(assert (=> d!45843 (= lt!75254 (ListLongMap!1690 lt!75253))))

(declare-fun lt!75256 () Unit!4532)

(declare-fun lt!75255 () Unit!4532)

(assert (=> d!45843 (= lt!75256 lt!75255)))

(assert (=> d!45843 (= (getValueByKey!178 lt!75253 (_1!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45843 (= lt!75255 (lemmaContainsTupThenGetReturnValue!92 lt!75253 (_1!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45843 (= lt!75253 (insertStrictlySorted!95 (toList!860 lt!74995) (_1!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45843 (= (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!75254)))

(declare-fun b!143522 () Bool)

(declare-fun res!68360 () Bool)

(assert (=> b!143522 (=> (not res!68360) (not e!93520))))

(assert (=> b!143522 (= res!68360 (= (getValueByKey!178 (toList!860 lt!75254) (_1!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun b!143523 () Bool)

(assert (=> b!143523 (= e!93520 (contains!912 (toList!860 lt!75254) (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(assert (= (and d!45843 res!68361) b!143522))

(assert (= (and b!143522 res!68360) b!143523))

(declare-fun m!173155 () Bool)

(assert (=> d!45843 m!173155))

(declare-fun m!173157 () Bool)

(assert (=> d!45843 m!173157))

(declare-fun m!173159 () Bool)

(assert (=> d!45843 m!173159))

(declare-fun m!173161 () Bool)

(assert (=> d!45843 m!173161))

(declare-fun m!173163 () Bool)

(assert (=> b!143522 m!173163))

(declare-fun m!173165 () Bool)

(assert (=> b!143523 m!173165))

(assert (=> b!143186 d!45843))

(declare-fun d!45845 () Bool)

(assert (=> d!45845 (= (apply!121 (+!174 lt!74983 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74978) (apply!121 lt!74983 lt!74978))))

(declare-fun lt!75259 () Unit!4532)

(declare-fun choose!878 (ListLongMap!1689 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4532)

(assert (=> d!45845 (= lt!75259 (choose!878 lt!74983 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74978))))

(declare-fun e!93523 () Bool)

(assert (=> d!45845 e!93523))

(declare-fun res!68364 () Bool)

(assert (=> d!45845 (=> (not res!68364) (not e!93523))))

(assert (=> d!45845 (= res!68364 (contains!908 lt!74983 lt!74978))))

(assert (=> d!45845 (= (addApplyDifferent!97 lt!74983 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74978) lt!75259)))

(declare-fun b!143527 () Bool)

(assert (=> b!143527 (= e!93523 (not (= lt!74978 lt!74981)))))

(assert (= (and d!45845 res!68364) b!143527))

(declare-fun m!173167 () Bool)

(assert (=> d!45845 m!173167))

(assert (=> d!45845 m!172849))

(declare-fun m!173169 () Bool)

(assert (=> d!45845 m!173169))

(assert (=> d!45845 m!172851))

(assert (=> d!45845 m!172849))

(assert (=> d!45845 m!172855))

(assert (=> b!143186 d!45845))

(declare-fun d!45847 () Bool)

(declare-fun e!93524 () Bool)

(assert (=> d!45847 e!93524))

(declare-fun res!68366 () Bool)

(assert (=> d!45847 (=> (not res!68366) (not e!93524))))

(declare-fun lt!75261 () ListLongMap!1689)

(assert (=> d!45847 (= res!68366 (contains!908 lt!75261 (_1!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun lt!75260 () List!1725)

(assert (=> d!45847 (= lt!75261 (ListLongMap!1690 lt!75260))))

(declare-fun lt!75263 () Unit!4532)

(declare-fun lt!75262 () Unit!4532)

(assert (=> d!45847 (= lt!75263 lt!75262)))

(assert (=> d!45847 (= (getValueByKey!178 lt!75260 (_1!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45847 (= lt!75262 (lemmaContainsTupThenGetReturnValue!92 lt!75260 (_1!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45847 (= lt!75260 (insertStrictlySorted!95 (toList!860 lt!74979) (_1!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45847 (= (+!174 lt!74979 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!75261)))

(declare-fun b!143528 () Bool)

(declare-fun res!68365 () Bool)

(assert (=> b!143528 (=> (not res!68365) (not e!93524))))

(assert (=> b!143528 (= res!68365 (= (getValueByKey!178 (toList!860 lt!75261) (_1!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun b!143529 () Bool)

(assert (=> b!143529 (= e!93524 (contains!912 (toList!860 lt!75261) (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(assert (= (and d!45847 res!68366) b!143528))

(assert (= (and b!143528 res!68365) b!143529))

(declare-fun m!173171 () Bool)

(assert (=> d!45847 m!173171))

(declare-fun m!173173 () Bool)

(assert (=> d!45847 m!173173))

(declare-fun m!173175 () Bool)

(assert (=> d!45847 m!173175))

(declare-fun m!173177 () Bool)

(assert (=> d!45847 m!173177))

(declare-fun m!173179 () Bool)

(assert (=> b!143528 m!173179))

(declare-fun m!173181 () Bool)

(assert (=> b!143529 m!173181))

(assert (=> b!143186 d!45847))

(declare-fun d!45849 () Bool)

(assert (=> d!45849 (= (apply!121 (+!174 lt!74983 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74978) (get!1543 (getValueByKey!178 (toList!860 (+!174 lt!74983 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74978)))))

(declare-fun bs!6077 () Bool)

(assert (= bs!6077 d!45849))

(declare-fun m!173183 () Bool)

(assert (=> bs!6077 m!173183))

(assert (=> bs!6077 m!173183))

(declare-fun m!173185 () Bool)

(assert (=> bs!6077 m!173185))

(assert (=> b!143186 d!45849))

(declare-fun d!45851 () Bool)

(declare-fun e!93525 () Bool)

(assert (=> d!45851 e!93525))

(declare-fun res!68368 () Bool)

(assert (=> d!45851 (=> (not res!68368) (not e!93525))))

(declare-fun lt!75265 () ListLongMap!1689)

(assert (=> d!45851 (= res!68368 (contains!908 lt!75265 (_1!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun lt!75264 () List!1725)

(assert (=> d!45851 (= lt!75265 (ListLongMap!1690 lt!75264))))

(declare-fun lt!75267 () Unit!4532)

(declare-fun lt!75266 () Unit!4532)

(assert (=> d!45851 (= lt!75267 lt!75266)))

(assert (=> d!45851 (= (getValueByKey!178 lt!75264 (_1!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45851 (= lt!75266 (lemmaContainsTupThenGetReturnValue!92 lt!75264 (_1!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45851 (= lt!75264 (insertStrictlySorted!95 (toList!860 lt!74983) (_1!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45851 (= (+!174 lt!74983 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!75265)))

(declare-fun b!143530 () Bool)

(declare-fun res!68367 () Bool)

(assert (=> b!143530 (=> (not res!68367) (not e!93525))))

(assert (=> b!143530 (= res!68367 (= (getValueByKey!178 (toList!860 lt!75265) (_1!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun b!143531 () Bool)

(assert (=> b!143531 (= e!93525 (contains!912 (toList!860 lt!75265) (tuple2!2631 lt!74981 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(assert (= (and d!45851 res!68368) b!143530))

(assert (= (and b!143530 res!68367) b!143531))

(declare-fun m!173187 () Bool)

(assert (=> d!45851 m!173187))

(declare-fun m!173189 () Bool)

(assert (=> d!45851 m!173189))

(declare-fun m!173191 () Bool)

(assert (=> d!45851 m!173191))

(declare-fun m!173193 () Bool)

(assert (=> d!45851 m!173193))

(declare-fun m!173195 () Bool)

(assert (=> b!143530 m!173195))

(declare-fun m!173197 () Bool)

(assert (=> b!143531 m!173197))

(assert (=> b!143186 d!45851))

(declare-fun d!45853 () Bool)

(declare-fun e!93526 () Bool)

(assert (=> d!45853 e!93526))

(declare-fun res!68370 () Bool)

(assert (=> d!45853 (=> (not res!68370) (not e!93526))))

(declare-fun lt!75269 () ListLongMap!1689)

(assert (=> d!45853 (= res!68370 (contains!908 lt!75269 (_1!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun lt!75268 () List!1725)

(assert (=> d!45853 (= lt!75269 (ListLongMap!1690 lt!75268))))

(declare-fun lt!75271 () Unit!4532)

(declare-fun lt!75270 () Unit!4532)

(assert (=> d!45853 (= lt!75271 lt!75270)))

(assert (=> d!45853 (= (getValueByKey!178 lt!75268 (_1!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45853 (= lt!75270 (lemmaContainsTupThenGetReturnValue!92 lt!75268 (_1!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45853 (= lt!75268 (insertStrictlySorted!95 (toList!860 lt!74990) (_1!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45853 (= (+!174 lt!74990 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!75269)))

(declare-fun b!143532 () Bool)

(declare-fun res!68369 () Bool)

(assert (=> b!143532 (=> (not res!68369) (not e!93526))))

(assert (=> b!143532 (= res!68369 (= (getValueByKey!178 (toList!860 lt!75269) (_1!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun b!143533 () Bool)

(assert (=> b!143533 (= e!93526 (contains!912 (toList!860 lt!75269) (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(assert (= (and d!45853 res!68370) b!143532))

(assert (= (and b!143532 res!68369) b!143533))

(declare-fun m!173199 () Bool)

(assert (=> d!45853 m!173199))

(declare-fun m!173201 () Bool)

(assert (=> d!45853 m!173201))

(declare-fun m!173203 () Bool)

(assert (=> d!45853 m!173203))

(declare-fun m!173205 () Bool)

(assert (=> d!45853 m!173205))

(declare-fun m!173207 () Bool)

(assert (=> b!143532 m!173207))

(declare-fun m!173209 () Bool)

(assert (=> b!143533 m!173209))

(assert (=> b!143186 d!45853))

(declare-fun d!45855 () Bool)

(declare-fun e!93528 () Bool)

(assert (=> d!45855 e!93528))

(declare-fun res!68371 () Bool)

(assert (=> d!45855 (=> res!68371 e!93528)))

(declare-fun lt!75273 () Bool)

(assert (=> d!45855 (= res!68371 (not lt!75273))))

(declare-fun lt!75272 () Bool)

(assert (=> d!45855 (= lt!75273 lt!75272)))

(declare-fun lt!75274 () Unit!4532)

(declare-fun e!93527 () Unit!4532)

(assert (=> d!45855 (= lt!75274 e!93527)))

(declare-fun c!27175 () Bool)

(assert (=> d!45855 (= c!27175 lt!75272)))

(assert (=> d!45855 (= lt!75272 (containsKey!181 (toList!860 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74987))))

(assert (=> d!45855 (= (contains!908 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74987) lt!75273)))

(declare-fun b!143534 () Bool)

(declare-fun lt!75275 () Unit!4532)

(assert (=> b!143534 (= e!93527 lt!75275)))

(assert (=> b!143534 (= lt!75275 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74987))))

(assert (=> b!143534 (isDefined!130 (getValueByKey!178 (toList!860 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74987))))

(declare-fun b!143535 () Bool)

(declare-fun Unit!4545 () Unit!4532)

(assert (=> b!143535 (= e!93527 Unit!4545)))

(declare-fun b!143536 () Bool)

(assert (=> b!143536 (= e!93528 (isDefined!130 (getValueByKey!178 (toList!860 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74987)))))

(assert (= (and d!45855 c!27175) b!143534))

(assert (= (and d!45855 (not c!27175)) b!143535))

(assert (= (and d!45855 (not res!68371)) b!143536))

(declare-fun m!173211 () Bool)

(assert (=> d!45855 m!173211))

(declare-fun m!173213 () Bool)

(assert (=> b!143534 m!173213))

(declare-fun m!173215 () Bool)

(assert (=> b!143534 m!173215))

(assert (=> b!143534 m!173215))

(declare-fun m!173217 () Bool)

(assert (=> b!143534 m!173217))

(assert (=> b!143536 m!173215))

(assert (=> b!143536 m!173215))

(assert (=> b!143536 m!173217))

(assert (=> b!143186 d!45855))

(declare-fun d!45857 () Bool)

(assert (=> d!45857 (= (apply!121 (+!174 lt!74979 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74985) (get!1543 (getValueByKey!178 (toList!860 (+!174 lt!74979 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!74985)))))

(declare-fun bs!6078 () Bool)

(assert (= bs!6078 d!45857))

(declare-fun m!173219 () Bool)

(assert (=> bs!6078 m!173219))

(assert (=> bs!6078 m!173219))

(declare-fun m!173221 () Bool)

(assert (=> bs!6078 m!173221))

(assert (=> b!143186 d!45857))

(declare-fun d!45859 () Bool)

(assert (=> d!45859 (= (apply!121 (+!174 lt!74979 (tuple2!2631 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74985) (apply!121 lt!74979 lt!74985))))

(declare-fun lt!75276 () Unit!4532)

(assert (=> d!45859 (= lt!75276 (choose!878 lt!74979 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74985))))

(declare-fun e!93529 () Bool)

(assert (=> d!45859 e!93529))

(declare-fun res!68372 () Bool)

(assert (=> d!45859 (=> (not res!68372) (not e!93529))))

(assert (=> d!45859 (= res!68372 (contains!908 lt!74979 lt!74985))))

(assert (=> d!45859 (= (addApplyDifferent!97 lt!74979 lt!74998 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74985) lt!75276)))

(declare-fun b!143537 () Bool)

(assert (=> b!143537 (= e!93529 (not (= lt!74985 lt!74998)))))

(assert (= (and d!45859 res!68372) b!143537))

(declare-fun m!173223 () Bool)

(assert (=> d!45859 m!173223))

(assert (=> d!45859 m!172839))

(declare-fun m!173225 () Bool)

(assert (=> d!45859 m!173225))

(assert (=> d!45859 m!172853))

(assert (=> d!45859 m!172839))

(assert (=> d!45859 m!172847))

(assert (=> b!143186 d!45859))

(declare-fun d!45861 () Bool)

(assert (=> d!45861 (= (apply!121 lt!74979 lt!74985) (get!1543 (getValueByKey!178 (toList!860 lt!74979) lt!74985)))))

(declare-fun bs!6079 () Bool)

(assert (= bs!6079 d!45861))

(declare-fun m!173227 () Bool)

(assert (=> bs!6079 m!173227))

(assert (=> bs!6079 m!173227))

(declare-fun m!173229 () Bool)

(assert (=> bs!6079 m!173229))

(assert (=> b!143186 d!45861))

(declare-fun d!45863 () Bool)

(assert (=> d!45863 (contains!908 (+!174 lt!74995 (tuple2!2631 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74987)))

(declare-fun lt!75279 () Unit!4532)

(declare-fun choose!879 (ListLongMap!1689 (_ BitVec 64) V!3561 (_ BitVec 64)) Unit!4532)

(assert (=> d!45863 (= lt!75279 (choose!879 lt!74995 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74987))))

(assert (=> d!45863 (contains!908 lt!74995 lt!74987)))

(assert (=> d!45863 (= (addStillContains!97 lt!74995 lt!74991 (zeroValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74987) lt!75279)))

(declare-fun bs!6080 () Bool)

(assert (= bs!6080 d!45863))

(assert (=> bs!6080 m!172827))

(assert (=> bs!6080 m!172827))

(assert (=> bs!6080 m!172829))

(declare-fun m!173231 () Bool)

(assert (=> bs!6080 m!173231))

(declare-fun m!173233 () Bool)

(assert (=> bs!6080 m!173233))

(assert (=> b!143186 d!45863))

(declare-fun d!45865 () Bool)

(assert (=> d!45865 (= (apply!121 lt!74983 lt!74978) (get!1543 (getValueByKey!178 (toList!860 lt!74983) lt!74978)))))

(declare-fun bs!6081 () Bool)

(assert (= bs!6081 d!45865))

(declare-fun m!173235 () Bool)

(assert (=> bs!6081 m!173235))

(assert (=> bs!6081 m!173235))

(declare-fun m!173237 () Bool)

(assert (=> bs!6081 m!173237))

(assert (=> b!143186 d!45865))

(declare-fun d!45867 () Bool)

(assert (=> d!45867 (= (apply!121 lt!74990 lt!74980) (get!1543 (getValueByKey!178 (toList!860 lt!74990) lt!74980)))))

(declare-fun bs!6082 () Bool)

(assert (= bs!6082 d!45867))

(declare-fun m!173239 () Bool)

(assert (=> bs!6082 m!173239))

(assert (=> bs!6082 m!173239))

(declare-fun m!173241 () Bool)

(assert (=> bs!6082 m!173241))

(assert (=> b!143186 d!45867))

(declare-fun d!45869 () Bool)

(assert (=> d!45869 (= (apply!121 (+!174 lt!74990 (tuple2!2631 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!74980) (apply!121 lt!74990 lt!74980))))

(declare-fun lt!75280 () Unit!4532)

(assert (=> d!45869 (= lt!75280 (choose!878 lt!74990 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74980))))

(declare-fun e!93530 () Bool)

(assert (=> d!45869 e!93530))

(declare-fun res!68373 () Bool)

(assert (=> d!45869 (=> (not res!68373) (not e!93530))))

(assert (=> d!45869 (= res!68373 (contains!908 lt!74990 lt!74980))))

(assert (=> d!45869 (= (addApplyDifferent!97 lt!74990 lt!74997 (minValue!2810 (v!3296 (underlying!482 thiss!992))) lt!74980) lt!75280)))

(declare-fun b!143539 () Bool)

(assert (=> b!143539 (= e!93530 (not (= lt!74980 lt!74997)))))

(assert (= (and d!45869 res!68373) b!143539))

(declare-fun m!173243 () Bool)

(assert (=> d!45869 m!173243))

(assert (=> d!45869 m!172825))

(declare-fun m!173245 () Bool)

(assert (=> d!45869 m!173245))

(assert (=> d!45869 m!172831))

(assert (=> d!45869 m!172825))

(assert (=> d!45869 m!172835))

(assert (=> b!143186 d!45869))

(declare-fun d!45871 () Bool)

(assert (=> d!45871 (= (validKeyInArray!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143171 d!45871))

(assert (=> b!143212 d!45781))

(declare-fun d!45873 () Bool)

(declare-fun e!93531 () Bool)

(assert (=> d!45873 e!93531))

(declare-fun res!68375 () Bool)

(assert (=> d!45873 (=> (not res!68375) (not e!93531))))

(declare-fun lt!75282 () ListLongMap!1689)

(assert (=> d!45873 (= res!68375 (contains!908 lt!75282 (_1!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75281 () List!1725)

(assert (=> d!45873 (= lt!75282 (ListLongMap!1690 lt!75281))))

(declare-fun lt!75284 () Unit!4532)

(declare-fun lt!75283 () Unit!4532)

(assert (=> d!45873 (= lt!75284 lt!75283)))

(assert (=> d!45873 (= (getValueByKey!178 lt!75281 (_1!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!183 (_2!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45873 (= lt!75283 (lemmaContainsTupThenGetReturnValue!92 lt!75281 (_1!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45873 (= lt!75281 (insertStrictlySorted!95 (toList!860 call!15873) (_1!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45873 (= (+!174 call!15873 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75282)))

(declare-fun b!143540 () Bool)

(declare-fun res!68374 () Bool)

(assert (=> b!143540 (=> (not res!68374) (not e!93531))))

(assert (=> b!143540 (= res!68374 (= (getValueByKey!178 (toList!860 lt!75282) (_1!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!183 (_2!1326 (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!143541 () Bool)

(assert (=> b!143541 (= e!93531 (contains!912 (toList!860 lt!75282) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!45873 res!68375) b!143540))

(assert (= (and b!143540 res!68374) b!143541))

(declare-fun m!173247 () Bool)

(assert (=> d!45873 m!173247))

(declare-fun m!173249 () Bool)

(assert (=> d!45873 m!173249))

(declare-fun m!173251 () Bool)

(assert (=> d!45873 m!173251))

(declare-fun m!173253 () Bool)

(assert (=> d!45873 m!173253))

(declare-fun m!173255 () Bool)

(assert (=> b!143540 m!173255))

(declare-fun m!173257 () Bool)

(assert (=> b!143541 m!173257))

(assert (=> b!143339 d!45873))

(declare-fun d!45875 () Bool)

(declare-fun e!93533 () Bool)

(assert (=> d!45875 e!93533))

(declare-fun res!68376 () Bool)

(assert (=> d!45875 (=> res!68376 e!93533)))

(declare-fun lt!75286 () Bool)

(assert (=> d!45875 (= res!68376 (not lt!75286))))

(declare-fun lt!75285 () Bool)

(assert (=> d!45875 (= lt!75286 lt!75285)))

(declare-fun lt!75287 () Unit!4532)

(declare-fun e!93532 () Unit!4532)

(assert (=> d!45875 (= lt!75287 e!93532)))

(declare-fun c!27176 () Bool)

(assert (=> d!45875 (= c!27176 lt!75285)))

(assert (=> d!45875 (= lt!75285 (containsKey!181 (toList!860 lt!74977) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45875 (= (contains!908 lt!74977 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75286)))

(declare-fun b!143542 () Bool)

(declare-fun lt!75288 () Unit!4532)

(assert (=> b!143542 (= e!93532 lt!75288)))

(assert (=> b!143542 (= lt!75288 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 lt!74977) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143542 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143543 () Bool)

(declare-fun Unit!4546 () Unit!4532)

(assert (=> b!143543 (= e!93532 Unit!4546)))

(declare-fun b!143544 () Bool)

(assert (=> b!143544 (= e!93533 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45875 c!27176) b!143542))

(assert (= (and d!45875 (not c!27176)) b!143543))

(assert (= (and d!45875 (not res!68376)) b!143544))

(declare-fun m!173259 () Bool)

(assert (=> d!45875 m!173259))

(declare-fun m!173261 () Bool)

(assert (=> b!143542 m!173261))

(declare-fun m!173263 () Bool)

(assert (=> b!143542 m!173263))

(assert (=> b!143542 m!173263))

(declare-fun m!173265 () Bool)

(assert (=> b!143542 m!173265))

(assert (=> b!143544 m!173263))

(assert (=> b!143544 m!173263))

(assert (=> b!143544 m!173265))

(assert (=> bm!15803 d!45875))

(declare-fun d!45877 () Bool)

(declare-fun res!68381 () Bool)

(declare-fun e!93538 () Bool)

(assert (=> d!45877 (=> res!68381 e!93538)))

(assert (=> d!45877 (= res!68381 (and ((_ is Cons!1721) (toList!860 lt!74898)) (= (_1!1326 (h!2329 (toList!860 lt!74898))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(assert (=> d!45877 (= (containsKey!181 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) e!93538)))

(declare-fun b!143549 () Bool)

(declare-fun e!93539 () Bool)

(assert (=> b!143549 (= e!93538 e!93539)))

(declare-fun res!68382 () Bool)

(assert (=> b!143549 (=> (not res!68382) (not e!93539))))

(assert (=> b!143549 (= res!68382 (and (or (not ((_ is Cons!1721) (toList!860 lt!74898))) (bvsle (_1!1326 (h!2329 (toList!860 lt!74898))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))) ((_ is Cons!1721) (toList!860 lt!74898)) (bvslt (_1!1326 (h!2329 (toList!860 lt!74898))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(declare-fun b!143550 () Bool)

(assert (=> b!143550 (= e!93539 (containsKey!181 (t!6326 (toList!860 lt!74898)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!45877 (not res!68381)) b!143549))

(assert (= (and b!143549 res!68382) b!143550))

(assert (=> b!143550 m!172677))

(declare-fun m!173267 () Bool)

(assert (=> b!143550 m!173267))

(assert (=> d!45795 d!45877))

(declare-fun b!143551 () Bool)

(declare-fun res!68383 () Bool)

(declare-fun e!93548 () Bool)

(assert (=> b!143551 (=> (not res!68383) (not e!93548))))

(declare-fun e!93541 () Bool)

(assert (=> b!143551 (= res!68383 e!93541)))

(declare-fun res!68391 () Bool)

(assert (=> b!143551 (=> res!68391 e!93541)))

(declare-fun e!93544 () Bool)

(assert (=> b!143551 (= res!68391 (not e!93544))))

(declare-fun res!68388 () Bool)

(assert (=> b!143551 (=> (not res!68388) (not e!93544))))

(assert (=> b!143551 (= res!68388 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143552 () Bool)

(declare-fun e!93542 () Bool)

(assert (=> b!143552 (= e!93542 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143553 () Bool)

(declare-fun e!93540 () ListLongMap!1689)

(declare-fun call!15912 () ListLongMap!1689)

(assert (=> b!143553 (= e!93540 call!15912)))

(declare-fun bm!15907 () Bool)

(declare-fun call!15914 () ListLongMap!1689)

(assert (=> bm!15907 (= call!15914 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143554 () Bool)

(declare-fun e!93546 () ListLongMap!1689)

(assert (=> b!143554 (= e!93546 call!15912)))

(declare-fun b!143555 () Bool)

(declare-fun e!93551 () Bool)

(declare-fun lt!75289 () ListLongMap!1689)

(assert (=> b!143555 (= e!93551 (= (apply!121 lt!75289 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2810 newMap!16)))))

(declare-fun b!143556 () Bool)

(assert (=> b!143556 (= e!93544 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143557 () Bool)

(declare-fun e!93545 () Unit!4532)

(declare-fun Unit!4547 () Unit!4532)

(assert (=> b!143557 (= e!93545 Unit!4547)))

(declare-fun b!143558 () Bool)

(declare-fun e!93547 () Bool)

(assert (=> b!143558 (= e!93548 e!93547)))

(declare-fun c!27178 () Bool)

(assert (=> b!143558 (= c!27178 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143559 () Bool)

(declare-fun e!93549 () Bool)

(assert (=> b!143559 (= e!93549 (= (apply!121 lt!75289 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2810 newMap!16)))))

(declare-fun b!143560 () Bool)

(declare-fun e!93552 () Bool)

(assert (=> b!143560 (= e!93541 e!93552)))

(declare-fun res!68384 () Bool)

(assert (=> b!143560 (=> (not res!68384) (not e!93552))))

(assert (=> b!143560 (= res!68384 (contains!908 lt!75289 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143561 () Bool)

(declare-fun res!68386 () Bool)

(assert (=> b!143561 (=> (not res!68386) (not e!93548))))

(declare-fun e!93543 () Bool)

(assert (=> b!143561 (= res!68386 e!93543)))

(declare-fun c!27181 () Bool)

(assert (=> b!143561 (= c!27181 (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143562 () Bool)

(declare-fun call!15916 () Bool)

(assert (=> b!143562 (= e!93547 (not call!15916))))

(declare-fun bm!15908 () Bool)

(declare-fun call!15915 () ListLongMap!1689)

(assert (=> bm!15908 (= call!15912 call!15915)))

(declare-fun b!143563 () Bool)

(assert (=> b!143563 (= e!93547 e!93549)))

(declare-fun res!68387 () Bool)

(assert (=> b!143563 (= res!68387 call!15916)))

(assert (=> b!143563 (=> (not res!68387) (not e!93549))))

(declare-fun b!143564 () Bool)

(declare-fun c!27180 () Bool)

(assert (=> b!143564 (= c!27180 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143564 (= e!93546 e!93540)))

(declare-fun call!15913 () ListLongMap!1689)

(declare-fun call!15911 () ListLongMap!1689)

(declare-fun bm!15909 () Bool)

(declare-fun c!27177 () Bool)

(declare-fun c!27179 () Bool)

(assert (=> bm!15909 (= call!15915 (+!174 (ite c!27179 call!15914 (ite c!27177 call!15911 call!15913)) (ite (or c!27179 c!27177) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 newMap!16)) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16)))))))

(declare-fun b!143565 () Bool)

(assert (=> b!143565 (= e!93552 (= (apply!121 lt!75289 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2313 lt!75095) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2586 lt!75095)))))

(assert (=> b!143565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun d!45879 () Bool)

(assert (=> d!45879 e!93548))

(declare-fun res!68390 () Bool)

(assert (=> d!45879 (=> (not res!68390) (not e!93548))))

(assert (=> d!45879 (= res!68390 (or (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))))

(declare-fun lt!75294 () ListLongMap!1689)

(assert (=> d!45879 (= lt!75289 lt!75294)))

(declare-fun lt!75308 () Unit!4532)

(assert (=> d!45879 (= lt!75308 e!93545)))

(declare-fun c!27182 () Bool)

(assert (=> d!45879 (= c!27182 e!93542)))

(declare-fun res!68389 () Bool)

(assert (=> d!45879 (=> (not res!68389) (not e!93542))))

(assert (=> d!45879 (= res!68389 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun e!93550 () ListLongMap!1689)

(assert (=> d!45879 (= lt!75294 e!93550)))

(assert (=> d!45879 (= c!27179 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45879 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45879 (= (getCurrentListMap!533 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75289)))

(declare-fun b!143566 () Bool)

(assert (=> b!143566 (= e!93543 e!93551)))

(declare-fun res!68385 () Bool)

(declare-fun call!15910 () Bool)

(assert (=> b!143566 (= res!68385 call!15910)))

(assert (=> b!143566 (=> (not res!68385) (not e!93551))))

(declare-fun bm!15910 () Bool)

(assert (=> bm!15910 (= call!15911 call!15914)))

(declare-fun b!143567 () Bool)

(assert (=> b!143567 (= e!93543 (not call!15910))))

(declare-fun bm!15911 () Bool)

(assert (=> bm!15911 (= call!15910 (contains!908 lt!75289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143568 () Bool)

(assert (=> b!143568 (= e!93550 (+!174 call!15915 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 newMap!16))))))

(declare-fun b!143569 () Bool)

(assert (=> b!143569 (= e!93550 e!93546)))

(assert (=> b!143569 (= c!27177 (and (not (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2713 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143570 () Bool)

(assert (=> b!143570 (= e!93540 call!15913)))

(declare-fun bm!15912 () Bool)

(assert (=> bm!15912 (= call!15913 call!15911)))

(declare-fun bm!15913 () Bool)

(assert (=> bm!15913 (= call!15916 (contains!908 lt!75289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143571 () Bool)

(declare-fun lt!75301 () Unit!4532)

(assert (=> b!143571 (= e!93545 lt!75301)))

(declare-fun lt!75307 () ListLongMap!1689)

(assert (=> b!143571 (= lt!75307 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75303 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75299 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75299 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75300 () Unit!4532)

(assert (=> b!143571 (= lt!75300 (addStillContains!97 lt!75307 lt!75303 (zeroValue!2810 newMap!16) lt!75299))))

(assert (=> b!143571 (contains!908 (+!174 lt!75307 (tuple2!2631 lt!75303 (zeroValue!2810 newMap!16))) lt!75299)))

(declare-fun lt!75306 () Unit!4532)

(assert (=> b!143571 (= lt!75306 lt!75300)))

(declare-fun lt!75295 () ListLongMap!1689)

(assert (=> b!143571 (= lt!75295 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75293 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75293 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75290 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75290 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75304 () Unit!4532)

(assert (=> b!143571 (= lt!75304 (addApplyDifferent!97 lt!75295 lt!75293 (minValue!2810 newMap!16) lt!75290))))

(assert (=> b!143571 (= (apply!121 (+!174 lt!75295 (tuple2!2631 lt!75293 (minValue!2810 newMap!16))) lt!75290) (apply!121 lt!75295 lt!75290))))

(declare-fun lt!75296 () Unit!4532)

(assert (=> b!143571 (= lt!75296 lt!75304)))

(declare-fun lt!75291 () ListLongMap!1689)

(assert (=> b!143571 (= lt!75291 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75310 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75297 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75297 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75305 () Unit!4532)

(assert (=> b!143571 (= lt!75305 (addApplyDifferent!97 lt!75291 lt!75310 (zeroValue!2810 newMap!16) lt!75297))))

(assert (=> b!143571 (= (apply!121 (+!174 lt!75291 (tuple2!2631 lt!75310 (zeroValue!2810 newMap!16))) lt!75297) (apply!121 lt!75291 lt!75297))))

(declare-fun lt!75298 () Unit!4532)

(assert (=> b!143571 (= lt!75298 lt!75305)))

(declare-fun lt!75302 () ListLongMap!1689)

(assert (=> b!143571 (= lt!75302 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75309 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75309 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75292 () (_ BitVec 64))

(assert (=> b!143571 (= lt!75292 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143571 (= lt!75301 (addApplyDifferent!97 lt!75302 lt!75309 (minValue!2810 newMap!16) lt!75292))))

(assert (=> b!143571 (= (apply!121 (+!174 lt!75302 (tuple2!2631 lt!75309 (minValue!2810 newMap!16))) lt!75292) (apply!121 lt!75302 lt!75292))))

(assert (= (and d!45879 c!27179) b!143568))

(assert (= (and d!45879 (not c!27179)) b!143569))

(assert (= (and b!143569 c!27177) b!143554))

(assert (= (and b!143569 (not c!27177)) b!143564))

(assert (= (and b!143564 c!27180) b!143553))

(assert (= (and b!143564 (not c!27180)) b!143570))

(assert (= (or b!143553 b!143570) bm!15912))

(assert (= (or b!143554 bm!15912) bm!15910))

(assert (= (or b!143554 b!143553) bm!15908))

(assert (= (or b!143568 bm!15910) bm!15907))

(assert (= (or b!143568 bm!15908) bm!15909))

(assert (= (and d!45879 res!68389) b!143552))

(assert (= (and d!45879 c!27182) b!143571))

(assert (= (and d!45879 (not c!27182)) b!143557))

(assert (= (and d!45879 res!68390) b!143551))

(assert (= (and b!143551 res!68388) b!143556))

(assert (= (and b!143551 (not res!68391)) b!143560))

(assert (= (and b!143560 res!68384) b!143565))

(assert (= (and b!143551 res!68383) b!143561))

(assert (= (and b!143561 c!27181) b!143566))

(assert (= (and b!143561 (not c!27181)) b!143567))

(assert (= (and b!143566 res!68385) b!143555))

(assert (= (or b!143566 b!143567) bm!15911))

(assert (= (and b!143561 res!68386) b!143558))

(assert (= (and b!143558 c!27178) b!143563))

(assert (= (and b!143558 (not c!27178)) b!143562))

(assert (= (and b!143563 res!68387) b!143559))

(assert (= (or b!143563 b!143562) bm!15913))

(declare-fun b_lambda!6455 () Bool)

(assert (=> (not b_lambda!6455) (not b!143565)))

(assert (=> b!143565 t!6340))

(declare-fun b_and!8957 () Bool)

(assert (= b_and!8953 (and (=> t!6340 result!4219) b_and!8957)))

(assert (=> b!143565 t!6342))

(declare-fun b_and!8959 () Bool)

(assert (= b_and!8955 (and (=> t!6342 result!4221) b_and!8959)))

(assert (=> d!45879 m!172999))

(declare-fun m!173269 () Bool)

(assert (=> bm!15913 m!173269))

(declare-fun m!173271 () Bool)

(assert (=> b!143555 m!173271))

(declare-fun m!173273 () Bool)

(assert (=> bm!15911 m!173273))

(declare-fun m!173275 () Bool)

(assert (=> b!143568 m!173275))

(assert (=> b!143560 m!172975))

(assert (=> b!143560 m!172975))

(declare-fun m!173277 () Bool)

(assert (=> b!143560 m!173277))

(declare-fun m!173279 () Bool)

(assert (=> b!143565 m!173279))

(assert (=> b!143565 m!173279))

(assert (=> b!143565 m!173013))

(declare-fun m!173281 () Bool)

(assert (=> b!143565 m!173281))

(assert (=> b!143565 m!172975))

(declare-fun m!173283 () Bool)

(assert (=> b!143565 m!173283))

(assert (=> b!143565 m!172975))

(assert (=> b!143565 m!173013))

(declare-fun m!173285 () Bool)

(assert (=> b!143571 m!173285))

(declare-fun m!173287 () Bool)

(assert (=> b!143571 m!173287))

(declare-fun m!173289 () Bool)

(assert (=> b!143571 m!173289))

(declare-fun m!173291 () Bool)

(assert (=> b!143571 m!173291))

(declare-fun m!173293 () Bool)

(assert (=> b!143571 m!173293))

(assert (=> b!143571 m!173285))

(declare-fun m!173295 () Bool)

(assert (=> b!143571 m!173295))

(declare-fun m!173297 () Bool)

(assert (=> b!143571 m!173297))

(declare-fun m!173299 () Bool)

(assert (=> b!143571 m!173299))

(declare-fun m!173301 () Bool)

(assert (=> b!143571 m!173301))

(declare-fun m!173303 () Bool)

(assert (=> b!143571 m!173303))

(declare-fun m!173305 () Bool)

(assert (=> b!143571 m!173305))

(assert (=> b!143571 m!173299))

(declare-fun m!173307 () Bool)

(assert (=> b!143571 m!173307))

(declare-fun m!173309 () Bool)

(assert (=> b!143571 m!173309))

(assert (=> b!143571 m!172975))

(declare-fun m!173311 () Bool)

(assert (=> b!143571 m!173311))

(assert (=> b!143571 m!173287))

(declare-fun m!173313 () Bool)

(assert (=> b!143571 m!173313))

(assert (=> b!143571 m!173309))

(declare-fun m!173315 () Bool)

(assert (=> b!143571 m!173315))

(assert (=> b!143552 m!172975))

(assert (=> b!143552 m!172975))

(assert (=> b!143552 m!173051))

(declare-fun m!173317 () Bool)

(assert (=> bm!15909 m!173317))

(assert (=> b!143556 m!172975))

(assert (=> b!143556 m!172975))

(assert (=> b!143556 m!173051))

(declare-fun m!173319 () Bool)

(assert (=> b!143559 m!173319))

(assert (=> bm!15907 m!173301))

(assert (=> b!143354 d!45879))

(assert (=> d!45779 d!45777))

(declare-fun d!45881 () Bool)

(assert (=> d!45881 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) from!355 Nil!1721)))

(assert (=> d!45881 true))

(declare-fun _$71!168 () Unit!4532)

(assert (=> d!45881 (= (choose!39 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!168)))

(declare-fun bs!6083 () Bool)

(assert (= bs!6083 d!45881))

(assert (=> bs!6083 m!172699))

(assert (=> d!45779 d!45881))

(declare-fun b!143588 () Bool)

(declare-fun e!93561 () Bool)

(declare-fun e!93564 () Bool)

(assert (=> b!143588 (= e!93561 e!93564)))

(declare-fun res!68403 () Bool)

(declare-fun call!15922 () Bool)

(assert (=> b!143588 (= res!68403 call!15922)))

(assert (=> b!143588 (=> (not res!68403) (not e!93564))))

(declare-fun bm!15918 () Bool)

(declare-fun lt!75315 () SeekEntryResult!274)

(declare-fun c!27187 () Bool)

(assert (=> bm!15918 (= call!15922 (inRange!0 (ite c!27187 (index!3260 lt!75315) (index!3263 lt!75315)) (mask!7314 newMap!16)))))

(declare-fun b!143589 () Bool)

(declare-fun call!15921 () Bool)

(assert (=> b!143589 (= e!93564 (not call!15921))))

(declare-fun b!143590 () Bool)

(declare-fun res!68402 () Bool)

(declare-fun e!93562 () Bool)

(assert (=> b!143590 (=> (not res!68402) (not e!93562))))

(assert (=> b!143590 (= res!68402 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3263 lt!75315)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143590 (and (bvsge (index!3263 lt!75315) #b00000000000000000000000000000000) (bvslt (index!3263 lt!75315) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143591 () Bool)

(declare-fun e!93563 () Bool)

(assert (=> b!143591 (= e!93563 ((_ is Undefined!274) lt!75315))))

(declare-fun b!143592 () Bool)

(declare-fun res!68401 () Bool)

(assert (=> b!143592 (=> (not res!68401) (not e!93562))))

(assert (=> b!143592 (= res!68401 call!15922)))

(assert (=> b!143592 (= e!93563 e!93562)))

(declare-fun d!45883 () Bool)

(assert (=> d!45883 e!93561))

(assert (=> d!45883 (= c!27187 ((_ is MissingZero!274) lt!75315))))

(assert (=> d!45883 (= lt!75315 (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun lt!75316 () Unit!4532)

(declare-fun choose!880 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4532)

(assert (=> d!45883 (= lt!75316 (choose!880 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45883 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45883 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)) lt!75316)))

(declare-fun b!143593 () Bool)

(assert (=> b!143593 (= e!93561 e!93563)))

(declare-fun c!27188 () Bool)

(assert (=> b!143593 (= c!27188 ((_ is MissingVacant!274) lt!75315))))

(declare-fun b!143594 () Bool)

(assert (=> b!143594 (= e!93562 (not call!15921))))

(declare-fun bm!15919 () Bool)

(assert (=> bm!15919 (= call!15921 (arrayContainsKey!0 (_keys!4725 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!143595 () Bool)

(assert (=> b!143595 (and (bvsge (index!3260 lt!75315) #b00000000000000000000000000000000) (bvslt (index!3260 lt!75315) (size!2585 (_keys!4725 newMap!16))))))

(declare-fun res!68400 () Bool)

(assert (=> b!143595 (= res!68400 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3260 lt!75315)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143595 (=> (not res!68400) (not e!93564))))

(assert (= (and d!45883 c!27187) b!143588))

(assert (= (and d!45883 (not c!27187)) b!143593))

(assert (= (and b!143588 res!68403) b!143595))

(assert (= (and b!143595 res!68400) b!143589))

(assert (= (and b!143593 c!27188) b!143592))

(assert (= (and b!143593 (not c!27188)) b!143591))

(assert (= (and b!143592 res!68401) b!143590))

(assert (= (and b!143590 res!68402) b!143594))

(assert (= (or b!143588 b!143592) bm!15918))

(assert (= (or b!143589 b!143594) bm!15919))

(assert (=> d!45883 m!172677))

(assert (=> d!45883 m!172923))

(assert (=> d!45883 m!172677))

(declare-fun m!173321 () Bool)

(assert (=> d!45883 m!173321))

(assert (=> d!45883 m!172999))

(declare-fun m!173323 () Bool)

(assert (=> b!143595 m!173323))

(declare-fun m!173325 () Bool)

(assert (=> bm!15918 m!173325))

(declare-fun m!173327 () Bool)

(assert (=> b!143590 m!173327))

(assert (=> bm!15919 m!172677))

(assert (=> bm!15919 m!172933))

(assert (=> bm!15868 d!45883))

(declare-fun b!143608 () Bool)

(declare-fun c!27197 () Bool)

(declare-fun lt!75323 () (_ BitVec 64))

(assert (=> b!143608 (= c!27197 (= lt!75323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93572 () SeekEntryResult!274)

(declare-fun e!93573 () SeekEntryResult!274)

(assert (=> b!143608 (= e!93572 e!93573)))

(declare-fun b!143609 () Bool)

(declare-fun lt!75325 () SeekEntryResult!274)

(assert (=> b!143609 (= e!93572 (Found!274 (index!3262 lt!75325)))))

(declare-fun b!143610 () Bool)

(assert (=> b!143610 (= e!93573 (MissingZero!274 (index!3262 lt!75325)))))

(declare-fun b!143611 () Bool)

(declare-fun e!93571 () SeekEntryResult!274)

(assert (=> b!143611 (= e!93571 Undefined!274)))

(declare-fun b!143612 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4893 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> b!143612 (= e!93573 (seekKeyOrZeroReturnVacant!0 (x!16328 lt!75325) (index!3262 lt!75325) (index!3262 lt!75325) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun lt!75324 () SeekEntryResult!274)

(declare-fun d!45885 () Bool)

(assert (=> d!45885 (and (or ((_ is Undefined!274) lt!75324) (not ((_ is Found!274) lt!75324)) (and (bvsge (index!3261 lt!75324) #b00000000000000000000000000000000) (bvslt (index!3261 lt!75324) (size!2585 (_keys!4725 newMap!16))))) (or ((_ is Undefined!274) lt!75324) ((_ is Found!274) lt!75324) (not ((_ is MissingZero!274) lt!75324)) (and (bvsge (index!3260 lt!75324) #b00000000000000000000000000000000) (bvslt (index!3260 lt!75324) (size!2585 (_keys!4725 newMap!16))))) (or ((_ is Undefined!274) lt!75324) ((_ is Found!274) lt!75324) ((_ is MissingZero!274) lt!75324) (not ((_ is MissingVacant!274) lt!75324)) (and (bvsge (index!3263 lt!75324) #b00000000000000000000000000000000) (bvslt (index!3263 lt!75324) (size!2585 (_keys!4725 newMap!16))))) (or ((_ is Undefined!274) lt!75324) (ite ((_ is Found!274) lt!75324) (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75324)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) (ite ((_ is MissingZero!274) lt!75324) (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3260 lt!75324)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!274) lt!75324) (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3263 lt!75324)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45885 (= lt!75324 e!93571)))

(declare-fun c!27196 () Bool)

(assert (=> d!45885 (= c!27196 (and ((_ is Intermediate!274) lt!75325) (undefined!1086 lt!75325)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4893 (_ BitVec 32)) SeekEntryResult!274)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!45885 (= lt!75325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (mask!7314 newMap!16)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(assert (=> d!45885 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45885 (= (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)) lt!75324)))

(declare-fun b!143613 () Bool)

(assert (=> b!143613 (= e!93571 e!93572)))

(assert (=> b!143613 (= lt!75323 (select (arr!2312 (_keys!4725 newMap!16)) (index!3262 lt!75325)))))

(declare-fun c!27195 () Bool)

(assert (=> b!143613 (= c!27195 (= lt!75323 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!45885 c!27196) b!143611))

(assert (= (and d!45885 (not c!27196)) b!143613))

(assert (= (and b!143613 c!27195) b!143609))

(assert (= (and b!143613 (not c!27195)) b!143608))

(assert (= (and b!143608 c!27197) b!143610))

(assert (= (and b!143608 (not c!27197)) b!143612))

(assert (=> b!143612 m!172677))

(declare-fun m!173329 () Bool)

(assert (=> b!143612 m!173329))

(declare-fun m!173331 () Bool)

(assert (=> d!45885 m!173331))

(declare-fun m!173333 () Bool)

(assert (=> d!45885 m!173333))

(assert (=> d!45885 m!172677))

(declare-fun m!173335 () Bool)

(assert (=> d!45885 m!173335))

(assert (=> d!45885 m!172677))

(assert (=> d!45885 m!173333))

(declare-fun m!173337 () Bool)

(assert (=> d!45885 m!173337))

(assert (=> d!45885 m!172999))

(declare-fun m!173339 () Bool)

(assert (=> d!45885 m!173339))

(declare-fun m!173341 () Bool)

(assert (=> b!143613 m!173341))

(assert (=> b!143351 d!45885))

(declare-fun d!45887 () Bool)

(declare-fun isEmpty!427 (Option!184) Bool)

(assert (=> d!45887 (= (isDefined!130 (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))) (not (isEmpty!427 (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))))

(declare-fun bs!6084 () Bool)

(assert (= bs!6084 d!45887))

(assert (=> bs!6084 m!172893))

(declare-fun m!173343 () Bool)

(assert (=> bs!6084 m!173343))

(assert (=> b!143237 d!45887))

(declare-fun b!143624 () Bool)

(declare-fun e!93579 () Option!184)

(assert (=> b!143624 (= e!93579 (getValueByKey!178 (t!6326 (toList!860 lt!74898)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143625 () Bool)

(assert (=> b!143625 (= e!93579 None!182)))

(declare-fun d!45889 () Bool)

(declare-fun c!27202 () Bool)

(assert (=> d!45889 (= c!27202 (and ((_ is Cons!1721) (toList!860 lt!74898)) (= (_1!1326 (h!2329 (toList!860 lt!74898))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(declare-fun e!93578 () Option!184)

(assert (=> d!45889 (= (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) e!93578)))

(declare-fun b!143622 () Bool)

(assert (=> b!143622 (= e!93578 (Some!183 (_2!1326 (h!2329 (toList!860 lt!74898)))))))

(declare-fun b!143623 () Bool)

(assert (=> b!143623 (= e!93578 e!93579)))

(declare-fun c!27203 () Bool)

(assert (=> b!143623 (= c!27203 (and ((_ is Cons!1721) (toList!860 lt!74898)) (not (= (_1!1326 (h!2329 (toList!860 lt!74898))) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))))

(assert (= (and d!45889 c!27202) b!143622))

(assert (= (and d!45889 (not c!27202)) b!143623))

(assert (= (and b!143623 c!27203) b!143624))

(assert (= (and b!143623 (not c!27203)) b!143625))

(assert (=> b!143624 m!172677))

(declare-fun m!173345 () Bool)

(assert (=> b!143624 m!173345))

(assert (=> b!143237 d!45889))

(declare-fun d!45891 () Bool)

(assert (=> d!45891 (= (get!1541 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3295 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143362 d!45891))

(declare-fun d!45893 () Bool)

(declare-fun e!93581 () Bool)

(assert (=> d!45893 e!93581))

(declare-fun res!68404 () Bool)

(assert (=> d!45893 (=> res!68404 e!93581)))

(declare-fun lt!75327 () Bool)

(assert (=> d!45893 (= res!68404 (not lt!75327))))

(declare-fun lt!75326 () Bool)

(assert (=> d!45893 (= lt!75327 lt!75326)))

(declare-fun lt!75328 () Unit!4532)

(declare-fun e!93580 () Unit!4532)

(assert (=> d!45893 (= lt!75328 e!93580)))

(declare-fun c!27204 () Bool)

(assert (=> d!45893 (= c!27204 lt!75326)))

(assert (=> d!45893 (= lt!75326 (containsKey!181 (toList!860 call!15860) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45893 (= (contains!908 call!15860 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) lt!75327)))

(declare-fun b!143626 () Bool)

(declare-fun lt!75329 () Unit!4532)

(assert (=> b!143626 (= e!93580 lt!75329)))

(assert (=> b!143626 (= lt!75329 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 call!15860) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143626 (isDefined!130 (getValueByKey!178 (toList!860 call!15860) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143627 () Bool)

(declare-fun Unit!4548 () Unit!4532)

(assert (=> b!143627 (= e!93580 Unit!4548)))

(declare-fun b!143628 () Bool)

(assert (=> b!143628 (= e!93581 (isDefined!130 (getValueByKey!178 (toList!860 call!15860) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!45893 c!27204) b!143626))

(assert (= (and d!45893 (not c!27204)) b!143627))

(assert (= (and d!45893 (not res!68404)) b!143628))

(assert (=> d!45893 m!172677))

(declare-fun m!173347 () Bool)

(assert (=> d!45893 m!173347))

(assert (=> b!143626 m!172677))

(declare-fun m!173349 () Bool)

(assert (=> b!143626 m!173349))

(assert (=> b!143626 m!172677))

(declare-fun m!173351 () Bool)

(assert (=> b!143626 m!173351))

(assert (=> b!143626 m!173351))

(declare-fun m!173353 () Bool)

(assert (=> b!143626 m!173353))

(assert (=> b!143628 m!172677))

(assert (=> b!143628 m!173351))

(assert (=> b!143628 m!173351))

(assert (=> b!143628 m!173353))

(assert (=> b!143321 d!45893))

(assert (=> bm!15866 d!45773))

(declare-fun d!45895 () Bool)

(declare-fun lt!75332 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!140 (List!1724) (InoxSet (_ BitVec 64)))

(assert (=> d!45895 (= lt!75332 (select (content!140 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) (h!2328 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(declare-fun e!93586 () Bool)

(assert (=> d!45895 (= lt!75332 e!93586)))

(declare-fun res!68409 () Bool)

(assert (=> d!45895 (=> (not res!68409) (not e!93586))))

(assert (=> d!45895 (= res!68409 ((_ is Cons!1720) (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(assert (=> d!45895 (= (contains!911 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721)) (h!2328 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) lt!75332)))

(declare-fun b!143633 () Bool)

(declare-fun e!93587 () Bool)

(assert (=> b!143633 (= e!93586 e!93587)))

(declare-fun res!68410 () Bool)

(assert (=> b!143633 (=> res!68410 e!93587)))

(assert (=> b!143633 (= res!68410 (= (h!2328 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) (h!2328 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(declare-fun b!143634 () Bool)

(assert (=> b!143634 (= e!93587 (contains!911 (t!6325 (t!6325 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))) (h!2328 (Cons!1720 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) Nil!1721))))))

(assert (= (and d!45895 res!68409) b!143633))

(assert (= (and b!143633 (not res!68410)) b!143634))

(declare-fun m!173355 () Bool)

(assert (=> d!45895 m!173355))

(declare-fun m!173357 () Bool)

(assert (=> d!45895 m!173357))

(declare-fun m!173359 () Bool)

(assert (=> b!143634 m!173359))

(assert (=> b!143227 d!45895))

(declare-fun d!45897 () Bool)

(declare-fun e!93588 () Bool)

(assert (=> d!45897 e!93588))

(declare-fun res!68412 () Bool)

(assert (=> d!45897 (=> (not res!68412) (not e!93588))))

(declare-fun lt!75334 () ListLongMap!1689)

(assert (=> d!45897 (= res!68412 (contains!908 lt!75334 (_1!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun lt!75333 () List!1725)

(assert (=> d!45897 (= lt!75334 (ListLongMap!1690 lt!75333))))

(declare-fun lt!75336 () Unit!4532)

(declare-fun lt!75335 () Unit!4532)

(assert (=> d!45897 (= lt!75336 lt!75335)))

(assert (=> d!45897 (= (getValueByKey!178 lt!75333 (_1!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))) (Some!183 (_2!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(assert (=> d!45897 (= lt!75335 (lemmaContainsTupThenGetReturnValue!92 lt!75333 (_1!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (_2!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(assert (=> d!45897 (= lt!75333 (insertStrictlySorted!95 (toList!860 (ite c!27078 call!15806 (ite c!27076 call!15803 call!15805))) (_1!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (_2!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(assert (=> d!45897 (= (+!174 (ite c!27078 call!15806 (ite c!27076 call!15803 call!15805)) (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) lt!75334)))

(declare-fun b!143635 () Bool)

(declare-fun res!68411 () Bool)

(assert (=> b!143635 (=> (not res!68411) (not e!93588))))

(assert (=> b!143635 (= res!68411 (= (getValueByKey!178 (toList!860 lt!75334) (_1!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))) (Some!183 (_2!1326 (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))))

(declare-fun b!143636 () Bool)

(assert (=> b!143636 (= e!93588 (contains!912 (toList!860 lt!75334) (ite (or c!27078 c!27076) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2810 (v!3296 (underlying!482 thiss!992)))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (= (and d!45897 res!68412) b!143635))

(assert (= (and b!143635 res!68411) b!143636))

(declare-fun m!173361 () Bool)

(assert (=> d!45897 m!173361))

(declare-fun m!173363 () Bool)

(assert (=> d!45897 m!173363))

(declare-fun m!173365 () Bool)

(assert (=> d!45897 m!173365))

(declare-fun m!173367 () Bool)

(assert (=> d!45897 m!173367))

(declare-fun m!173369 () Bool)

(assert (=> b!143635 m!173369))

(declare-fun m!173371 () Bool)

(assert (=> b!143636 m!173371))

(assert (=> bm!15801 d!45897))

(declare-fun d!45899 () Bool)

(assert (=> d!45899 (= (+!174 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) lt!75079 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75339 () Unit!4532)

(declare-fun choose!881 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 V!3561 Int) Unit!4532)

(assert (=> d!45899 (= lt!75339 (choose!881 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75079 (zeroValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45899 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45899 (= (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) lt!75079 (zeroValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2810 newMap!16) (defaultEntry!2962 newMap!16)) lt!75339)))

(declare-fun bs!6085 () Bool)

(assert (= bs!6085 d!45899))

(assert (=> bs!6085 m!172713))

(declare-fun m!173373 () Bool)

(assert (=> bs!6085 m!173373))

(assert (=> bs!6085 m!172803))

(assert (=> bs!6085 m!172803))

(declare-fun m!173375 () Bool)

(assert (=> bs!6085 m!173375))

(assert (=> bs!6085 m!172713))

(declare-fun m!173377 () Bool)

(assert (=> bs!6085 m!173377))

(assert (=> bs!6085 m!172999))

(assert (=> b!143325 d!45899))

(assert (=> d!45775 d!45809))

(declare-fun d!45901 () Bool)

(declare-fun e!93590 () Bool)

(assert (=> d!45901 e!93590))

(declare-fun res!68413 () Bool)

(assert (=> d!45901 (=> res!68413 e!93590)))

(declare-fun lt!75341 () Bool)

(assert (=> d!45901 (= res!68413 (not lt!75341))))

(declare-fun lt!75340 () Bool)

(assert (=> d!45901 (= lt!75341 lt!75340)))

(declare-fun lt!75342 () Unit!4532)

(declare-fun e!93589 () Unit!4532)

(assert (=> d!45901 (= lt!75342 e!93589)))

(declare-fun c!27205 () Bool)

(assert (=> d!45901 (= c!27205 lt!75340)))

(assert (=> d!45901 (= lt!75340 (containsKey!181 (toList!860 e!93410) (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072)))))))

(assert (=> d!45901 (= (contains!908 e!93410 (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072)))) lt!75341)))

(declare-fun b!143637 () Bool)

(declare-fun lt!75343 () Unit!4532)

(assert (=> b!143637 (= e!93589 lt!75343)))

(assert (=> b!143637 (= lt!75343 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 e!93410) (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072)))))))

(assert (=> b!143637 (isDefined!130 (getValueByKey!178 (toList!860 e!93410) (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072)))))))

(declare-fun b!143638 () Bool)

(declare-fun Unit!4549 () Unit!4532)

(assert (=> b!143638 (= e!93589 Unit!4549)))

(declare-fun b!143639 () Bool)

(assert (=> b!143639 (= e!93590 (isDefined!130 (getValueByKey!178 (toList!860 e!93410) (ite c!27118 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072))))))))

(assert (= (and d!45901 c!27205) b!143637))

(assert (= (and d!45901 (not c!27205)) b!143638))

(assert (= (and d!45901 (not res!68413)) b!143639))

(declare-fun m!173379 () Bool)

(assert (=> d!45901 m!173379))

(declare-fun m!173381 () Bool)

(assert (=> b!143637 m!173381))

(declare-fun m!173383 () Bool)

(assert (=> b!143637 m!173383))

(assert (=> b!143637 m!173383))

(declare-fun m!173385 () Bool)

(assert (=> b!143637 m!173385))

(assert (=> b!143639 m!173383))

(assert (=> b!143639 m!173383))

(assert (=> b!143639 m!173385))

(assert (=> bm!15858 d!45901))

(assert (=> b!143200 d!45829))

(declare-fun d!45903 () Bool)

(declare-fun e!93593 () Bool)

(assert (=> d!45903 e!93593))

(declare-fun res!68416 () Bool)

(assert (=> d!45903 (=> (not res!68416) (not e!93593))))

(assert (=> d!45903 (= res!68416 (and (bvsge (index!3261 lt!75072) #b00000000000000000000000000000000) (bvslt (index!3261 lt!75072) (size!2585 (_keys!4725 newMap!16)))))))

(declare-fun lt!75346 () Unit!4532)

(declare-fun choose!882 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) Int) Unit!4532)

(assert (=> d!45903 (= lt!75346 (choose!882 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45903 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45903 (= (lemmaValidKeyInArrayIsInListMap!126 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (defaultEntry!2962 newMap!16)) lt!75346)))

(declare-fun b!143642 () Bool)

(assert (=> b!143642 (= e!93593 (contains!908 (getCurrentListMap!533 (_keys!4725 newMap!16) lt!75095 (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75072))))))

(assert (= (and d!45903 res!68416) b!143642))

(declare-fun m!173387 () Bool)

(assert (=> d!45903 m!173387))

(assert (=> d!45903 m!172999))

(assert (=> b!143642 m!172935))

(assert (=> b!143642 m!172905))

(assert (=> b!143642 m!172935))

(assert (=> b!143642 m!172905))

(declare-fun m!173389 () Bool)

(assert (=> b!143642 m!173389))

(assert (=> b!143333 d!45903))

(declare-fun d!45905 () Bool)

(declare-fun e!93596 () Bool)

(assert (=> d!45905 e!93596))

(declare-fun res!68419 () Bool)

(assert (=> d!45905 (=> (not res!68419) (not e!93596))))

(assert (=> d!45905 (= res!68419 (and (bvsge (index!3261 lt!75072) #b00000000000000000000000000000000) (bvslt (index!3261 lt!75072) (size!2586 (_values!2945 newMap!16)))))))

(declare-fun lt!75349 () Unit!4532)

(declare-fun choose!883 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 32) (_ BitVec 64) V!3561 Int) Unit!4532)

(assert (=> d!45905 (= lt!75349 (choose!883 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45905 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45905 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (index!3261 lt!75072) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2962 newMap!16)) lt!75349)))

(declare-fun b!143645 () Bool)

(assert (=> b!143645 (= e!93596 (= (+!174 (getCurrentListMap!533 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) (tuple2!2631 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!533 (_keys!4725 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16))))))

(assert (= (and d!45905 res!68419) b!143645))

(assert (=> d!45905 m!172677))

(assert (=> d!45905 m!172713))

(declare-fun m!173391 () Bool)

(assert (=> d!45905 m!173391))

(assert (=> d!45905 m!172999))

(assert (=> b!143645 m!172803))

(assert (=> b!143645 m!172803))

(assert (=> b!143645 m!173109))

(assert (=> b!143645 m!172915))

(declare-fun m!173393 () Bool)

(assert (=> b!143645 m!173393))

(assert (=> b!143333 d!45905))

(declare-fun d!45907 () Bool)

(declare-fun e!93598 () Bool)

(assert (=> d!45907 e!93598))

(declare-fun res!68420 () Bool)

(assert (=> d!45907 (=> res!68420 e!93598)))

(declare-fun lt!75351 () Bool)

(assert (=> d!45907 (= res!68420 (not lt!75351))))

(declare-fun lt!75350 () Bool)

(assert (=> d!45907 (= lt!75351 lt!75350)))

(declare-fun lt!75352 () Unit!4532)

(declare-fun e!93597 () Unit!4532)

(assert (=> d!45907 (= lt!75352 e!93597)))

(declare-fun c!27206 () Bool)

(assert (=> d!45907 (= c!27206 lt!75350)))

(assert (=> d!45907 (= lt!75350 (containsKey!181 (toList!860 call!15880) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45907 (= (contains!908 call!15880 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) lt!75351)))

(declare-fun b!143646 () Bool)

(declare-fun lt!75353 () Unit!4532)

(assert (=> b!143646 (= e!93597 lt!75353)))

(assert (=> b!143646 (= lt!75353 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 call!15880) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143646 (isDefined!130 (getValueByKey!178 (toList!860 call!15880) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143647 () Bool)

(declare-fun Unit!4550 () Unit!4532)

(assert (=> b!143647 (= e!93597 Unit!4550)))

(declare-fun b!143648 () Bool)

(assert (=> b!143648 (= e!93598 (isDefined!130 (getValueByKey!178 (toList!860 call!15880) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!45907 c!27206) b!143646))

(assert (= (and d!45907 (not c!27206)) b!143647))

(assert (= (and d!45907 (not res!68420)) b!143648))

(assert (=> d!45907 m!172677))

(declare-fun m!173395 () Bool)

(assert (=> d!45907 m!173395))

(assert (=> b!143646 m!172677))

(declare-fun m!173397 () Bool)

(assert (=> b!143646 m!173397))

(assert (=> b!143646 m!172677))

(declare-fun m!173399 () Bool)

(assert (=> b!143646 m!173399))

(assert (=> b!143646 m!173399))

(declare-fun m!173401 () Bool)

(assert (=> b!143646 m!173401))

(assert (=> b!143648 m!172677))

(assert (=> b!143648 m!173399))

(assert (=> b!143648 m!173399))

(assert (=> b!143648 m!173401))

(assert (=> b!143333 d!45907))

(declare-fun d!45909 () Bool)

(assert (=> d!45909 (= (inRange!0 (ite c!27118 (ite c!27125 (index!3261 lt!75086) (ite c!27128 (index!3260 lt!75077) (index!3263 lt!75077))) (ite c!27124 (index!3261 lt!75082) (ite c!27123 (index!3260 lt!75073) (index!3263 lt!75073)))) (mask!7314 newMap!16)) (and (bvsge (ite c!27118 (ite c!27125 (index!3261 lt!75086) (ite c!27128 (index!3260 lt!75077) (index!3263 lt!75077))) (ite c!27124 (index!3261 lt!75082) (ite c!27123 (index!3260 lt!75073) (index!3263 lt!75073)))) #b00000000000000000000000000000000) (bvslt (ite c!27118 (ite c!27125 (index!3261 lt!75086) (ite c!27128 (index!3260 lt!75077) (index!3263 lt!75077))) (ite c!27124 (index!3261 lt!75082) (ite c!27123 (index!3260 lt!75073) (index!3263 lt!75073)))) (bvadd (mask!7314 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15872 d!45909))

(declare-fun b!143649 () Bool)

(declare-fun e!93600 () Bool)

(declare-fun e!93601 () Bool)

(assert (=> b!143649 (= e!93600 e!93601)))

(declare-fun res!68421 () Bool)

(assert (=> b!143649 (=> (not res!68421) (not e!93601))))

(declare-fun e!93602 () Bool)

(assert (=> b!143649 (= res!68421 (not e!93602))))

(declare-fun res!68422 () Bool)

(assert (=> b!143649 (=> (not res!68422) (not e!93602))))

(assert (=> b!143649 (= res!68422 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15920 () Bool)

(declare-fun call!15923 () Bool)

(declare-fun c!27207 () Bool)

(assert (=> bm!15920 (= call!15923 (arrayNoDuplicates!0 (_keys!4725 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27207 (Cons!1720 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000) Nil!1721) Nil!1721)))))

(declare-fun b!143650 () Bool)

(assert (=> b!143650 (= e!93602 (contains!911 Nil!1721 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143651 () Bool)

(declare-fun e!93599 () Bool)

(assert (=> b!143651 (= e!93599 call!15923)))

(declare-fun b!143652 () Bool)

(assert (=> b!143652 (= e!93601 e!93599)))

(assert (=> b!143652 (= c!27207 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!45911 () Bool)

(declare-fun res!68423 () Bool)

(assert (=> d!45911 (=> res!68423 e!93600)))

(assert (=> d!45911 (= res!68423 (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(assert (=> d!45911 (= (arrayNoDuplicates!0 (_keys!4725 newMap!16) #b00000000000000000000000000000000 Nil!1721) e!93600)))

(declare-fun b!143653 () Bool)

(assert (=> b!143653 (= e!93599 call!15923)))

(assert (= (and d!45911 (not res!68423)) b!143649))

(assert (= (and b!143649 res!68422) b!143650))

(assert (= (and b!143649 res!68421) b!143652))

(assert (= (and b!143652 c!27207) b!143653))

(assert (= (and b!143652 (not c!27207)) b!143651))

(assert (= (or b!143653 b!143651) bm!15920))

(assert (=> b!143649 m!172975))

(assert (=> b!143649 m!172975))

(assert (=> b!143649 m!173051))

(assert (=> bm!15920 m!172975))

(declare-fun m!173403 () Bool)

(assert (=> bm!15920 m!173403))

(assert (=> b!143650 m!172975))

(assert (=> b!143650 m!172975))

(declare-fun m!173405 () Bool)

(assert (=> b!143650 m!173405))

(assert (=> b!143652 m!172975))

(assert (=> b!143652 m!172975))

(assert (=> b!143652 m!173051))

(assert (=> b!143222 d!45911))

(declare-fun d!45913 () Bool)

(assert (=> d!45913 (isDefined!130 (getValueByKey!178 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun lt!75356 () Unit!4532)

(declare-fun choose!884 (List!1725 (_ BitVec 64)) Unit!4532)

(assert (=> d!45913 (= lt!75356 (choose!884 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!93605 () Bool)

(assert (=> d!45913 e!93605))

(declare-fun res!68426 () Bool)

(assert (=> d!45913 (=> (not res!68426) (not e!93605))))

(declare-fun isStrictlySorted!313 (List!1725) Bool)

(assert (=> d!45913 (= res!68426 (isStrictlySorted!313 (toList!860 lt!74898)))))

(assert (=> d!45913 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) lt!75356)))

(declare-fun b!143656 () Bool)

(assert (=> b!143656 (= e!93605 (containsKey!181 (toList!860 lt!74898) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!45913 res!68426) b!143656))

(assert (=> d!45913 m!172677))

(assert (=> d!45913 m!172893))

(assert (=> d!45913 m!172893))

(assert (=> d!45913 m!172895))

(assert (=> d!45913 m!172677))

(declare-fun m!173407 () Bool)

(assert (=> d!45913 m!173407))

(declare-fun m!173409 () Bool)

(assert (=> d!45913 m!173409))

(assert (=> b!143656 m!172677))

(assert (=> b!143656 m!172889))

(assert (=> b!143235 d!45913))

(assert (=> b!143235 d!45887))

(assert (=> b!143235 d!45889))

(declare-fun d!45915 () Bool)

(declare-fun lt!75357 () Bool)

(assert (=> d!45915 (= lt!75357 (select (content!140 Nil!1721) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!93606 () Bool)

(assert (=> d!45915 (= lt!75357 e!93606)))

(declare-fun res!68427 () Bool)

(assert (=> d!45915 (=> (not res!68427) (not e!93606))))

(assert (=> d!45915 (= res!68427 ((_ is Cons!1720) Nil!1721))))

(assert (=> d!45915 (= (contains!911 Nil!1721 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)) lt!75357)))

(declare-fun b!143657 () Bool)

(declare-fun e!93607 () Bool)

(assert (=> b!143657 (= e!93606 e!93607)))

(declare-fun res!68428 () Bool)

(assert (=> b!143657 (=> res!68428 e!93607)))

(assert (=> b!143657 (= res!68428 (= (h!2328 Nil!1721) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!143658 () Bool)

(assert (=> b!143658 (= e!93607 (contains!911 (t!6325 Nil!1721) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!45915 res!68427) b!143657))

(assert (= (and b!143657 (not res!68428)) b!143658))

(declare-fun m!173411 () Bool)

(assert (=> d!45915 m!173411))

(assert (=> d!45915 m!172677))

(declare-fun m!173413 () Bool)

(assert (=> d!45915 m!173413))

(assert (=> b!143658 m!172677))

(declare-fun m!173415 () Bool)

(assert (=> b!143658 m!173415))

(assert (=> b!143198 d!45915))

(assert (=> bm!15873 d!45885))

(declare-fun b!143667 () Bool)

(declare-fun res!68437 () Bool)

(declare-fun e!93610 () Bool)

(assert (=> b!143667 (=> (not res!68437) (not e!93610))))

(assert (=> b!143667 (= res!68437 (and (= (size!2586 (_values!2945 newMap!16)) (bvadd (mask!7314 newMap!16) #b00000000000000000000000000000001)) (= (size!2585 (_keys!4725 newMap!16)) (size!2586 (_values!2945 newMap!16))) (bvsge (_size!627 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!627 newMap!16) (bvadd (mask!7314 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!143670 () Bool)

(assert (=> b!143670 (= e!93610 (and (bvsge (extraKeys!2713 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2713 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!627 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!45917 () Bool)

(declare-fun res!68438 () Bool)

(assert (=> d!45917 (=> (not res!68438) (not e!93610))))

(assert (=> d!45917 (= res!68438 (validMask!0 (mask!7314 newMap!16)))))

(assert (=> d!45917 (= (simpleValid!97 newMap!16) e!93610)))

(declare-fun b!143668 () Bool)

(declare-fun res!68439 () Bool)

(assert (=> b!143668 (=> (not res!68439) (not e!93610))))

(declare-fun size!2591 (LongMapFixedSize!1156) (_ BitVec 32))

(assert (=> b!143668 (= res!68439 (bvsge (size!2591 newMap!16) (_size!627 newMap!16)))))

(declare-fun b!143669 () Bool)

(declare-fun res!68440 () Bool)

(assert (=> b!143669 (=> (not res!68440) (not e!93610))))

(assert (=> b!143669 (= res!68440 (= (size!2591 newMap!16) (bvadd (_size!627 newMap!16) (bvsdiv (bvadd (extraKeys!2713 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!45917 res!68438) b!143667))

(assert (= (and b!143667 res!68437) b!143668))

(assert (= (and b!143668 res!68439) b!143669))

(assert (= (and b!143669 res!68440) b!143670))

(assert (=> d!45917 m!172999))

(declare-fun m!173417 () Bool)

(assert (=> b!143668 m!173417))

(assert (=> b!143669 m!173417))

(assert (=> d!45785 d!45917))

(declare-fun d!45919 () Bool)

(declare-fun res!68441 () Bool)

(declare-fun e!93611 () Bool)

(assert (=> d!45919 (=> (not res!68441) (not e!93611))))

(assert (=> d!45919 (= res!68441 (simpleValid!97 (v!3296 (underlying!482 thiss!992))))))

(assert (=> d!45919 (= (valid!571 (v!3296 (underlying!482 thiss!992))) e!93611)))

(declare-fun b!143671 () Bool)

(declare-fun res!68442 () Bool)

(assert (=> b!143671 (=> (not res!68442) (not e!93611))))

(assert (=> b!143671 (= res!68442 (= (arrayCountValidKeys!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 (size!2585 (_keys!4725 (v!3296 (underlying!482 thiss!992))))) (_size!627 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143672 () Bool)

(declare-fun res!68443 () Bool)

(assert (=> b!143672 (=> (not res!68443) (not e!93611))))

(assert (=> b!143672 (= res!68443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4725 (v!3296 (underlying!482 thiss!992))) (mask!7314 (v!3296 (underlying!482 thiss!992)))))))

(declare-fun b!143673 () Bool)

(assert (=> b!143673 (= e!93611 (arrayNoDuplicates!0 (_keys!4725 (v!3296 (underlying!482 thiss!992))) #b00000000000000000000000000000000 Nil!1721))))

(assert (= (and d!45919 res!68441) b!143671))

(assert (= (and b!143671 res!68442) b!143672))

(assert (= (and b!143672 res!68443) b!143673))

(declare-fun m!173419 () Bool)

(assert (=> d!45919 m!173419))

(declare-fun m!173421 () Bool)

(assert (=> b!143671 m!173421))

(declare-fun m!173423 () Bool)

(assert (=> b!143672 m!173423))

(declare-fun m!173425 () Bool)

(assert (=> b!143673 m!173425))

(assert (=> d!45791 d!45919))

(declare-fun d!45921 () Bool)

(assert (=> d!45921 (= (apply!121 lt!74977 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1543 (getValueByKey!178 (toList!860 lt!74977) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6086 () Bool)

(assert (= bs!6086 d!45921))

(declare-fun m!173427 () Bool)

(assert (=> bs!6086 m!173427))

(assert (=> bs!6086 m!173427))

(declare-fun m!173429 () Bool)

(assert (=> bs!6086 m!173429))

(assert (=> b!143174 d!45921))

(declare-fun b!143682 () Bool)

(declare-fun e!93619 () Bool)

(declare-fun call!15926 () Bool)

(assert (=> b!143682 (= e!93619 call!15926)))

(declare-fun d!45923 () Bool)

(declare-fun res!68449 () Bool)

(declare-fun e!93620 () Bool)

(assert (=> d!45923 (=> res!68449 e!93620)))

(assert (=> d!45923 (= res!68449 (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(assert (=> d!45923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4725 newMap!16) (mask!7314 newMap!16)) e!93620)))

(declare-fun bm!15923 () Bool)

(assert (=> bm!15923 (= call!15926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun b!143683 () Bool)

(declare-fun e!93618 () Bool)

(assert (=> b!143683 (= e!93620 e!93618)))

(declare-fun c!27210 () Bool)

(assert (=> b!143683 (= c!27210 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143684 () Bool)

(assert (=> b!143684 (= e!93618 call!15926)))

(declare-fun b!143685 () Bool)

(assert (=> b!143685 (= e!93618 e!93619)))

(declare-fun lt!75364 () (_ BitVec 64))

(assert (=> b!143685 (= lt!75364 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75365 () Unit!4532)

(assert (=> b!143685 (= lt!75365 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4725 newMap!16) lt!75364 #b00000000000000000000000000000000))))

(assert (=> b!143685 (arrayContainsKey!0 (_keys!4725 newMap!16) lt!75364 #b00000000000000000000000000000000)))

(declare-fun lt!75366 () Unit!4532)

(assert (=> b!143685 (= lt!75366 lt!75365)))

(declare-fun res!68448 () Bool)

(assert (=> b!143685 (= res!68448 (= (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000) (_keys!4725 newMap!16) (mask!7314 newMap!16)) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!143685 (=> (not res!68448) (not e!93619))))

(assert (= (and d!45923 (not res!68449)) b!143683))

(assert (= (and b!143683 c!27210) b!143685))

(assert (= (and b!143683 (not c!27210)) b!143684))

(assert (= (and b!143685 res!68448) b!143682))

(assert (= (or b!143682 b!143684) bm!15923))

(declare-fun m!173431 () Bool)

(assert (=> bm!15923 m!173431))

(assert (=> b!143683 m!172975))

(assert (=> b!143683 m!172975))

(assert (=> b!143683 m!173051))

(assert (=> b!143685 m!172975))

(declare-fun m!173433 () Bool)

(assert (=> b!143685 m!173433))

(declare-fun m!173435 () Bool)

(assert (=> b!143685 m!173435))

(assert (=> b!143685 m!172975))

(declare-fun m!173437 () Bool)

(assert (=> b!143685 m!173437))

(assert (=> b!143221 d!45923))

(declare-fun d!45925 () Bool)

(declare-fun res!68450 () Bool)

(declare-fun e!93621 () Bool)

(assert (=> d!45925 (=> (not res!68450) (not e!93621))))

(assert (=> d!45925 (= res!68450 (simpleValid!97 (_2!1327 lt!75076)))))

(assert (=> d!45925 (= (valid!571 (_2!1327 lt!75076)) e!93621)))

(declare-fun b!143686 () Bool)

(declare-fun res!68451 () Bool)

(assert (=> b!143686 (=> (not res!68451) (not e!93621))))

(assert (=> b!143686 (= res!68451 (= (arrayCountValidKeys!0 (_keys!4725 (_2!1327 lt!75076)) #b00000000000000000000000000000000 (size!2585 (_keys!4725 (_2!1327 lt!75076)))) (_size!627 (_2!1327 lt!75076))))))

(declare-fun b!143687 () Bool)

(declare-fun res!68452 () Bool)

(assert (=> b!143687 (=> (not res!68452) (not e!93621))))

(assert (=> b!143687 (= res!68452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4725 (_2!1327 lt!75076)) (mask!7314 (_2!1327 lt!75076))))))

(declare-fun b!143688 () Bool)

(assert (=> b!143688 (= e!93621 (arrayNoDuplicates!0 (_keys!4725 (_2!1327 lt!75076)) #b00000000000000000000000000000000 Nil!1721))))

(assert (= (and d!45925 res!68450) b!143686))

(assert (= (and b!143686 res!68451) b!143687))

(assert (= (and b!143687 res!68452) b!143688))

(declare-fun m!173439 () Bool)

(assert (=> d!45925 m!173439))

(declare-fun m!173441 () Bool)

(assert (=> b!143686 m!173441))

(declare-fun m!173443 () Bool)

(assert (=> b!143687 m!173443))

(declare-fun m!173445 () Bool)

(assert (=> b!143688 m!173445))

(assert (=> d!45797 d!45925))

(assert (=> d!45797 d!45785))

(declare-fun d!45927 () Bool)

(assert (=> d!45927 (= (apply!121 lt!74977 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1543 (getValueByKey!178 (toList!860 lt!74977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6087 () Bool)

(assert (= bs!6087 d!45927))

(assert (=> bs!6087 m!173263))

(assert (=> bs!6087 m!173263))

(declare-fun m!173447 () Bool)

(assert (=> bs!6087 m!173447))

(assert (=> b!143170 d!45927))

(declare-fun d!45929 () Bool)

(declare-fun e!93624 () Bool)

(assert (=> d!45929 e!93624))

(declare-fun res!68458 () Bool)

(assert (=> d!45929 (=> (not res!68458) (not e!93624))))

(declare-fun lt!75371 () SeekEntryResult!274)

(assert (=> d!45929 (= res!68458 ((_ is Found!274) lt!75371))))

(assert (=> d!45929 (= lt!75371 (seekEntryOrOpen!0 (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (_keys!4725 newMap!16) (mask!7314 newMap!16)))))

(declare-fun lt!75372 () Unit!4532)

(declare-fun choose!885 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3561 V!3561 (_ BitVec 64) Int) Unit!4532)

(assert (=> d!45929 (= lt!75372 (choose!885 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)))))

(assert (=> d!45929 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45929 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4725 newMap!16) (_values!2945 newMap!16) (mask!7314 newMap!16) (extraKeys!2713 newMap!16) (zeroValue!2810 newMap!16) (minValue!2810 newMap!16) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355) (defaultEntry!2962 newMap!16)) lt!75372)))

(declare-fun b!143693 () Bool)

(declare-fun res!68457 () Bool)

(assert (=> b!143693 (=> (not res!68457) (not e!93624))))

(assert (=> b!143693 (= res!68457 (inRange!0 (index!3261 lt!75371) (mask!7314 newMap!16)))))

(declare-fun b!143694 () Bool)

(assert (=> b!143694 (= e!93624 (= (select (arr!2312 (_keys!4725 newMap!16)) (index!3261 lt!75371)) (select (arr!2312 (_keys!4725 (v!3296 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!143694 (and (bvsge (index!3261 lt!75371) #b00000000000000000000000000000000) (bvslt (index!3261 lt!75371) (size!2585 (_keys!4725 newMap!16))))))

(assert (= (and d!45929 res!68458) b!143693))

(assert (= (and b!143693 res!68457) b!143694))

(assert (=> d!45929 m!172677))

(assert (=> d!45929 m!172923))

(assert (=> d!45929 m!172677))

(declare-fun m!173449 () Bool)

(assert (=> d!45929 m!173449))

(assert (=> d!45929 m!172999))

(declare-fun m!173451 () Bool)

(assert (=> b!143693 m!173451))

(declare-fun m!173453 () Bool)

(assert (=> b!143694 m!173453))

(assert (=> bm!15880 d!45929))

(assert (=> bm!15799 d!45841))

(declare-fun d!45931 () Bool)

(declare-fun e!93626 () Bool)

(assert (=> d!45931 e!93626))

(declare-fun res!68459 () Bool)

(assert (=> d!45931 (=> res!68459 e!93626)))

(declare-fun lt!75374 () Bool)

(assert (=> d!45931 (= res!68459 (not lt!75374))))

(declare-fun lt!75373 () Bool)

(assert (=> d!45931 (= lt!75374 lt!75373)))

(declare-fun lt!75375 () Unit!4532)

(declare-fun e!93625 () Unit!4532)

(assert (=> d!45931 (= lt!75375 e!93625)))

(declare-fun c!27211 () Bool)

(assert (=> d!45931 (= c!27211 lt!75373)))

(assert (=> d!45931 (= lt!75373 (containsKey!181 (toList!860 lt!74977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45931 (= (contains!908 lt!74977 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75374)))

(declare-fun b!143695 () Bool)

(declare-fun lt!75376 () Unit!4532)

(assert (=> b!143695 (= e!93625 lt!75376)))

(assert (=> b!143695 (= lt!75376 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!860 lt!74977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143695 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143696 () Bool)

(declare-fun Unit!4551 () Unit!4532)

(assert (=> b!143696 (= e!93625 Unit!4551)))

(declare-fun b!143697 () Bool)

(assert (=> b!143697 (= e!93626 (isDefined!130 (getValueByKey!178 (toList!860 lt!74977) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45931 c!27211) b!143695))

(assert (= (and d!45931 (not c!27211)) b!143696))

(assert (= (and d!45931 (not res!68459)) b!143697))

(declare-fun m!173455 () Bool)

(assert (=> d!45931 m!173455))

(declare-fun m!173457 () Bool)

(assert (=> b!143695 m!173457))

(assert (=> b!143695 m!173427))

(assert (=> b!143695 m!173427))

(declare-fun m!173459 () Bool)

(assert (=> b!143695 m!173459))

(assert (=> b!143697 m!173427))

(assert (=> b!143697 m!173427))

(assert (=> b!143697 m!173459))

(assert (=> bm!15805 d!45931))

(declare-fun b!143698 () Bool)

(declare-fun res!68460 () Bool)

(declare-fun e!93635 () Bool)

(assert (=> b!143698 (=> (not res!68460) (not e!93635))))

(declare-fun e!93628 () Bool)

(assert (=> b!143698 (= res!68460 e!93628)))

(declare-fun res!68468 () Bool)

(assert (=> b!143698 (=> res!68468 e!93628)))

(declare-fun e!93631 () Bool)

(assert (=> b!143698 (= res!68468 (not e!93631))))

(declare-fun res!68465 () Bool)

(assert (=> b!143698 (=> (not res!68465) (not e!93631))))

(assert (=> b!143698 (= res!68465 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143699 () Bool)

(declare-fun e!93629 () Bool)

(assert (=> b!143699 (= e!93629 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143700 () Bool)

(declare-fun e!93627 () ListLongMap!1689)

(declare-fun call!15929 () ListLongMap!1689)

(assert (=> b!143700 (= e!93627 call!15929)))

(declare-fun bm!15924 () Bool)

(declare-fun call!15931 () ListLongMap!1689)

(assert (=> bm!15924 (= call!15931 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun b!143701 () Bool)

(declare-fun e!93633 () ListLongMap!1689)

(assert (=> b!143701 (= e!93633 call!15929)))

(declare-fun lt!75377 () ListLongMap!1689)

(declare-fun e!93638 () Bool)

(declare-fun b!143702 () Bool)

(assert (=> b!143702 (= e!93638 (= (apply!121 lt!75377 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16))))))

(declare-fun b!143703 () Bool)

(assert (=> b!143703 (= e!93631 (validKeyInArray!0 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143704 () Bool)

(declare-fun e!93632 () Unit!4532)

(declare-fun Unit!4552 () Unit!4532)

(assert (=> b!143704 (= e!93632 Unit!4552)))

(declare-fun b!143705 () Bool)

(declare-fun e!93634 () Bool)

(assert (=> b!143705 (= e!93635 e!93634)))

(declare-fun c!27213 () Bool)

(assert (=> b!143705 (= c!27213 (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143706 () Bool)

(declare-fun e!93636 () Bool)

(assert (=> b!143706 (= e!93636 (= (apply!121 lt!75377 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16))))))

(declare-fun b!143707 () Bool)

(declare-fun e!93639 () Bool)

(assert (=> b!143707 (= e!93628 e!93639)))

(declare-fun res!68461 () Bool)

(assert (=> b!143707 (=> (not res!68461) (not e!93639))))

(assert (=> b!143707 (= res!68461 (contains!908 lt!75377 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143707 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun b!143708 () Bool)

(declare-fun res!68463 () Bool)

(assert (=> b!143708 (=> (not res!68463) (not e!93635))))

(declare-fun e!93630 () Bool)

(assert (=> b!143708 (= res!68463 e!93630)))

(declare-fun c!27216 () Bool)

(assert (=> b!143708 (= c!27216 (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!143709 () Bool)

(declare-fun call!15933 () Bool)

(assert (=> b!143709 (= e!93634 (not call!15933))))

(declare-fun bm!15925 () Bool)

(declare-fun call!15932 () ListLongMap!1689)

(assert (=> bm!15925 (= call!15929 call!15932)))

(declare-fun b!143710 () Bool)

(assert (=> b!143710 (= e!93634 e!93636)))

(declare-fun res!68464 () Bool)

(assert (=> b!143710 (= res!68464 call!15933)))

(assert (=> b!143710 (=> (not res!68464) (not e!93636))))

(declare-fun c!27215 () Bool)

(declare-fun b!143711 () Bool)

(assert (=> b!143711 (= c!27215 (and (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143711 (= e!93633 e!93627)))

(declare-fun c!27212 () Bool)

(declare-fun call!15928 () ListLongMap!1689)

(declare-fun bm!15926 () Bool)

(declare-fun c!27214 () Bool)

(declare-fun call!15930 () ListLongMap!1689)

(assert (=> bm!15926 (= call!15932 (+!174 (ite c!27214 call!15931 (ite c!27212 call!15928 call!15930)) (ite (or c!27214 c!27212) (tuple2!2631 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16))) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16))))))))

(declare-fun b!143712 () Bool)

(assert (=> b!143712 (= e!93639 (= (apply!121 lt!75377 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2313 (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2962 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2586 (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))))))))

(assert (=> b!143712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun d!45933 () Bool)

(assert (=> d!45933 e!93635))

(declare-fun res!68467 () Bool)

(assert (=> d!45933 (=> (not res!68467) (not e!93635))))

(assert (=> d!45933 (= res!68467 (or (bvsge #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))))

(declare-fun lt!75382 () ListLongMap!1689)

(assert (=> d!45933 (= lt!75377 lt!75382)))

(declare-fun lt!75396 () Unit!4532)

(assert (=> d!45933 (= lt!75396 e!93632)))

(declare-fun c!27217 () Bool)

(assert (=> d!45933 (= c!27217 e!93629)))

(declare-fun res!68466 () Bool)

(assert (=> d!45933 (=> (not res!68466) (not e!93629))))

(assert (=> d!45933 (= res!68466 (bvslt #b00000000000000000000000000000000 (size!2585 (_keys!4725 newMap!16))))))

(declare-fun e!93637 () ListLongMap!1689)

(assert (=> d!45933 (= lt!75382 e!93637)))

(assert (=> d!45933 (= c!27214 (and (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45933 (validMask!0 (mask!7314 newMap!16))))

(assert (=> d!45933 (= (getCurrentListMap!533 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)) lt!75377)))

(declare-fun b!143713 () Bool)

(assert (=> b!143713 (= e!93630 e!93638)))

(declare-fun res!68462 () Bool)

(declare-fun call!15927 () Bool)

(assert (=> b!143713 (= res!68462 call!15927)))

(assert (=> b!143713 (=> (not res!68462) (not e!93638))))

(declare-fun bm!15927 () Bool)

(assert (=> bm!15927 (= call!15928 call!15931)))

(declare-fun b!143714 () Bool)

(assert (=> b!143714 (= e!93630 (not call!15927))))

(declare-fun bm!15928 () Bool)

(assert (=> bm!15928 (= call!15927 (contains!908 lt!75377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143715 () Bool)

(assert (=> b!143715 (= e!93637 (+!174 call!15932 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))))))

(declare-fun b!143716 () Bool)

(assert (=> b!143716 (= e!93637 e!93633)))

(assert (=> b!143716 (= c!27212 (and (not (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143717 () Bool)

(assert (=> b!143717 (= e!93627 call!15930)))

(declare-fun bm!15929 () Bool)

(assert (=> bm!15929 (= call!15930 call!15928)))

(declare-fun bm!15930 () Bool)

(assert (=> bm!15930 (= call!15933 (contains!908 lt!75377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143718 () Bool)

(declare-fun lt!75389 () Unit!4532)

(assert (=> b!143718 (= e!93632 lt!75389)))

(declare-fun lt!75395 () ListLongMap!1689)

(assert (=> b!143718 (= lt!75395 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75391 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75387 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75387 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75388 () Unit!4532)

(assert (=> b!143718 (= lt!75388 (addStillContains!97 lt!75395 lt!75391 (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) lt!75387))))

(assert (=> b!143718 (contains!908 (+!174 lt!75395 (tuple2!2631 lt!75391 (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)))) lt!75387)))

(declare-fun lt!75394 () Unit!4532)

(assert (=> b!143718 (= lt!75394 lt!75388)))

(declare-fun lt!75383 () ListLongMap!1689)

(assert (=> b!143718 (= lt!75383 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75381 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75378 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75378 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75392 () Unit!4532)

(assert (=> b!143718 (= lt!75392 (addApplyDifferent!97 lt!75383 lt!75381 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) lt!75378))))

(assert (=> b!143718 (= (apply!121 (+!174 lt!75383 (tuple2!2631 lt!75381 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))) lt!75378) (apply!121 lt!75383 lt!75378))))

(declare-fun lt!75384 () Unit!4532)

(assert (=> b!143718 (= lt!75384 lt!75392)))

(declare-fun lt!75379 () ListLongMap!1689)

(assert (=> b!143718 (= lt!75379 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75398 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75385 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75385 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75393 () Unit!4532)

(assert (=> b!143718 (= lt!75393 (addApplyDifferent!97 lt!75379 lt!75398 (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) lt!75385))))

(assert (=> b!143718 (= (apply!121 (+!174 lt!75379 (tuple2!2631 lt!75398 (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)))) lt!75385) (apply!121 lt!75379 lt!75385))))

(declare-fun lt!75386 () Unit!4532)

(assert (=> b!143718 (= lt!75386 lt!75393)))

(declare-fun lt!75390 () ListLongMap!1689)

(assert (=> b!143718 (= lt!75390 (getCurrentListMapNoExtraKeys!141 (_keys!4725 newMap!16) (ite (or c!27129 c!27118) (_values!2945 newMap!16) (array!4896 (store (arr!2313 (_values!2945 newMap!16)) (index!3261 lt!75072) (ValueCellFull!1124 (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2586 (_values!2945 newMap!16)))) (mask!7314 newMap!16) (ite c!27129 (ite c!27117 lt!75079 lt!75088) (extraKeys!2713 newMap!16)) (ite (and c!27129 c!27117) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2810 newMap!16)) (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2962 newMap!16)))))

(declare-fun lt!75397 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75397 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75380 () (_ BitVec 64))

(assert (=> b!143718 (= lt!75380 (select (arr!2312 (_keys!4725 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143718 (= lt!75389 (addApplyDifferent!97 lt!75390 lt!75397 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)) lt!75380))))

(assert (=> b!143718 (= (apply!121 (+!174 lt!75390 (tuple2!2631 lt!75397 (ite c!27129 (ite c!27117 (minValue!2810 newMap!16) (get!1538 (select (arr!2313 (_values!2945 (v!3296 (underlying!482 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2810 newMap!16)))) lt!75380) (apply!121 lt!75390 lt!75380))))

(assert (= (and d!45933 c!27214) b!143715))

(assert (= (and d!45933 (not c!27214)) b!143716))

(assert (= (and b!143716 c!27212) b!143701))

(assert (= (and b!143716 (not c!27212)) b!143711))

(assert (= (and b!143711 c!27215) b!143700))

(assert (= (and b!143711 (not c!27215)) b!143717))

(assert (= (or b!143700 b!143717) bm!15929))

(assert (= (or b!143701 bm!15929) bm!15927))

(assert (= (or b!143701 b!143700) bm!15925))

(assert (= (or b!143715 bm!15927) bm!15924))

(assert (= (or b!143715 bm!15925) bm!15926))

(assert (= (and d!45933 res!68466) b!143699))

(assert (= (and d!45933 c!27217) b!143718))

(assert (= (and d!45933 (not c!27217)) b!143704))

(assert (= (and d!45933 res!68467) b!143698))

(assert (= (and b!143698 res!68465) b!143703))

(assert (= (and b!143698 (not res!68468)) b!143707))

(assert (= (and b!143707 res!68461) b!143712))

(assert (= (and b!143698 res!68460) b!143708))

(assert (= (and b!143708 c!27216) b!143713))

(assert (= (and b!143708 (not c!27216)) b!143714))

(assert (= (and b!143713 res!68462) b!143702))

(assert (= (or b!143713 b!143714) bm!15928))

(assert (= (and b!143708 res!68463) b!143705))

(assert (= (and b!143705 c!27213) b!143710))

(assert (= (and b!143705 (not c!27213)) b!143709))

(assert (= (and b!143710 res!68464) b!143706))

(assert (= (or b!143710 b!143709) bm!15930))

(declare-fun b_lambda!6457 () Bool)

(assert (=> (not b_lambda!6457) (not b!143712)))

(assert (=> b!143712 t!6340))

(declare-fun b_and!8961 () Bool)

(assert (= b_and!8957 (and (=> t!6340 result!4219) b_and!8961)))

(assert (=> b!143712 t!6342))

(declare-fun b_and!8963 () Bool)

(assert (= b_and!8959 (and (=> t!6342 result!4221) b_and!8963)))

(assert (=> d!45933 m!172999))

(declare-fun m!173461 () Bool)

(assert (=> bm!15930 m!173461))

(declare-fun m!173463 () Bool)

(assert (=> b!143702 m!173463))

(declare-fun m!173465 () Bool)

(assert (=> bm!15928 m!173465))

(declare-fun m!173467 () Bool)

(assert (=> b!143715 m!173467))

(assert (=> b!143707 m!172975))

(assert (=> b!143707 m!172975))

(declare-fun m!173469 () Bool)

(assert (=> b!143707 m!173469))

(declare-fun m!173471 () Bool)

(assert (=> b!143712 m!173471))

(assert (=> b!143712 m!173471))

(assert (=> b!143712 m!173013))

(declare-fun m!173473 () Bool)

(assert (=> b!143712 m!173473))

(assert (=> b!143712 m!172975))

(declare-fun m!173475 () Bool)

(assert (=> b!143712 m!173475))

(assert (=> b!143712 m!172975))

(assert (=> b!143712 m!173013))

(declare-fun m!173477 () Bool)

(assert (=> b!143718 m!173477))

(declare-fun m!173479 () Bool)

(assert (=> b!143718 m!173479))

(declare-fun m!173481 () Bool)

(assert (=> b!143718 m!173481))

(declare-fun m!173483 () Bool)

(assert (=> b!143718 m!173483))

(declare-fun m!173485 () Bool)

(assert (=> b!143718 m!173485))

(assert (=> b!143718 m!173477))

(declare-fun m!173487 () Bool)

(assert (=> b!143718 m!173487))

(declare-fun m!173489 () Bool)

(assert (=> b!143718 m!173489))

(declare-fun m!173491 () Bool)

(assert (=> b!143718 m!173491))

(declare-fun m!173493 () Bool)

(assert (=> b!143718 m!173493))

(declare-fun m!173495 () Bool)

(assert (=> b!143718 m!173495))

(declare-fun m!173497 () Bool)

(assert (=> b!143718 m!173497))

(assert (=> b!143718 m!173491))

(declare-fun m!173499 () Bool)

(assert (=> b!143718 m!173499))

(declare-fun m!173501 () Bool)

(assert (=> b!143718 m!173501))

(assert (=> b!143718 m!172975))

(declare-fun m!173503 () Bool)

(assert (=> b!143718 m!173503))

(assert (=> b!143718 m!173479))

(declare-fun m!173505 () Bool)

(assert (=> b!143718 m!173505))

(assert (=> b!143718 m!173501))

(declare-fun m!173507 () Bool)

(assert (=> b!143718 m!173507))

(assert (=> b!143699 m!172975))

(assert (=> b!143699 m!172975))

(assert (=> b!143699 m!173051))

(declare-fun m!173509 () Bool)

(assert (=> bm!15926 m!173509))

(assert (=> b!143703 m!172975))

(assert (=> b!143703 m!172975))

(assert (=> b!143703 m!173051))

(declare-fun m!173511 () Bool)

(assert (=> b!143706 m!173511))

(assert (=> bm!15924 m!173493))

(assert (=> bm!15870 d!45933))

(declare-fun d!45935 () Bool)

(declare-fun e!93640 () Bool)

(assert (=> d!45935 e!93640))

(declare-fun res!68470 () Bool)

(assert (=> d!45935 (=> (not res!68470) (not e!93640))))

(declare-fun lt!75400 () ListLongMap!1689)

(assert (=> d!45935 (= res!68470 (contains!908 lt!75400 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(declare-fun lt!75399 () List!1725)

(assert (=> d!45935 (= lt!75400 (ListLongMap!1690 lt!75399))))

(declare-fun lt!75402 () Unit!4532)

(declare-fun lt!75401 () Unit!4532)

(assert (=> d!45935 (= lt!75402 lt!75401)))

(assert (=> d!45935 (= (getValueByKey!178 lt!75399 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45935 (= lt!75401 (lemmaContainsTupThenGetReturnValue!92 lt!75399 (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45935 (= lt!75399 (insertStrictlySorted!95 (toList!860 call!15807) (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))))))

(assert (=> d!45935 (= (+!174 call!15807 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))) lt!75400)))

(declare-fun b!143719 () Bool)

(declare-fun res!68469 () Bool)

(assert (=> b!143719 (=> (not res!68469) (not e!93640))))

(assert (=> b!143719 (= res!68469 (= (getValueByKey!178 (toList!860 lt!75400) (_1!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992)))))) (Some!183 (_2!1326 (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))))

(declare-fun b!143720 () Bool)

(assert (=> b!143720 (= e!93640 (contains!912 (toList!860 lt!75400) (tuple2!2631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2810 (v!3296 (underlying!482 thiss!992))))))))

(assert (= (and d!45935 res!68470) b!143719))

(assert (= (and b!143719 res!68469) b!143720))

(declare-fun m!173513 () Bool)

(assert (=> d!45935 m!173513))

(declare-fun m!173515 () Bool)

(assert (=> d!45935 m!173515))

(declare-fun m!173517 () Bool)

(assert (=> d!45935 m!173517))

(declare-fun m!173519 () Bool)

(assert (=> d!45935 m!173519))

(declare-fun m!173521 () Bool)

(assert (=> b!143719 m!173521))

(declare-fun m!173523 () Bool)

(assert (=> b!143720 m!173523))

(assert (=> b!143183 d!45935))

(assert (=> b!143167 d!45871))

(declare-fun condMapEmpty!4873 () Bool)

(declare-fun mapDefault!4873 () ValueCell!1124)

(assert (=> mapNonEmpty!4871 (= condMapEmpty!4873 (= mapRest!4871 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4873)))))

(declare-fun e!93641 () Bool)

(declare-fun mapRes!4873 () Bool)

(assert (=> mapNonEmpty!4871 (= tp!11621 (and e!93641 mapRes!4873))))

(declare-fun mapIsEmpty!4873 () Bool)

(assert (=> mapIsEmpty!4873 mapRes!4873))

(declare-fun b!143722 () Bool)

(assert (=> b!143722 (= e!93641 tp_is_empty!2935)))

(declare-fun b!143721 () Bool)

(declare-fun e!93642 () Bool)

(assert (=> b!143721 (= e!93642 tp_is_empty!2935)))

(declare-fun mapNonEmpty!4873 () Bool)

(declare-fun tp!11623 () Bool)

(assert (=> mapNonEmpty!4873 (= mapRes!4873 (and tp!11623 e!93642))))

(declare-fun mapRest!4873 () (Array (_ BitVec 32) ValueCell!1124))

(declare-fun mapValue!4873 () ValueCell!1124)

(declare-fun mapKey!4873 () (_ BitVec 32))

(assert (=> mapNonEmpty!4873 (= mapRest!4871 (store mapRest!4873 mapKey!4873 mapValue!4873))))

(assert (= (and mapNonEmpty!4871 condMapEmpty!4873) mapIsEmpty!4873))

(assert (= (and mapNonEmpty!4871 (not condMapEmpty!4873)) mapNonEmpty!4873))

(assert (= (and mapNonEmpty!4873 ((_ is ValueCellFull!1124) mapValue!4873)) b!143721))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1124) mapDefault!4873)) b!143722))

(declare-fun m!173525 () Bool)

(assert (=> mapNonEmpty!4873 m!173525))

(declare-fun condMapEmpty!4874 () Bool)

(declare-fun mapDefault!4874 () ValueCell!1124)

(assert (=> mapNonEmpty!4872 (= condMapEmpty!4874 (= mapRest!4872 ((as const (Array (_ BitVec 32) ValueCell!1124)) mapDefault!4874)))))

(declare-fun e!93643 () Bool)

(declare-fun mapRes!4874 () Bool)

(assert (=> mapNonEmpty!4872 (= tp!11622 (and e!93643 mapRes!4874))))

(declare-fun mapIsEmpty!4874 () Bool)

(assert (=> mapIsEmpty!4874 mapRes!4874))

(declare-fun b!143724 () Bool)

(assert (=> b!143724 (= e!93643 tp_is_empty!2935)))

(declare-fun b!143723 () Bool)

(declare-fun e!93644 () Bool)

(assert (=> b!143723 (= e!93644 tp_is_empty!2935)))

(declare-fun mapNonEmpty!4874 () Bool)

(declare-fun tp!11624 () Bool)

(assert (=> mapNonEmpty!4874 (= mapRes!4874 (and tp!11624 e!93644))))

(declare-fun mapValue!4874 () ValueCell!1124)

(declare-fun mapKey!4874 () (_ BitVec 32))

(declare-fun mapRest!4874 () (Array (_ BitVec 32) ValueCell!1124))

(assert (=> mapNonEmpty!4874 (= mapRest!4872 (store mapRest!4874 mapKey!4874 mapValue!4874))))

(assert (= (and mapNonEmpty!4872 condMapEmpty!4874) mapIsEmpty!4874))

(assert (= (and mapNonEmpty!4872 (not condMapEmpty!4874)) mapNonEmpty!4874))

(assert (= (and mapNonEmpty!4874 ((_ is ValueCellFull!1124) mapValue!4874)) b!143723))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1124) mapDefault!4874)) b!143724))

(declare-fun m!173527 () Bool)

(assert (=> mapNonEmpty!4874 m!173527))

(declare-fun b_lambda!6459 () Bool)

(assert (= b_lambda!6455 (or (and b!143013 b_free!3037 (= (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143006 b_free!3039) b_lambda!6459)))

(declare-fun b_lambda!6461 () Bool)

(assert (= b_lambda!6451 (or (and b!143013 b_free!3037) (and b!143006 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))))) b_lambda!6461)))

(declare-fun b_lambda!6463 () Bool)

(assert (= b_lambda!6449 (or (and b!143013 b_free!3037 (= (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143006 b_free!3039) b_lambda!6463)))

(declare-fun b_lambda!6465 () Bool)

(assert (= b_lambda!6457 (or (and b!143013 b_free!3037 (= (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))) (defaultEntry!2962 newMap!16))) (and b!143006 b_free!3039) b_lambda!6465)))

(declare-fun b_lambda!6467 () Bool)

(assert (= b_lambda!6453 (or (and b!143013 b_free!3037) (and b!143006 b_free!3039 (= (defaultEntry!2962 newMap!16) (defaultEntry!2962 (v!3296 (underlying!482 thiss!992))))) b_lambda!6467)))

(check-sat (not b!143648) (not d!45933) (not b!143552) (not b!143407) (not b!143473) (not b!143419) (not b!143529) (not b!143671) (not d!45903) (not d!45831) (not b!143650) (not bm!15891) (not b!143642) (not d!45845) (not b_next!3037) (not d!45823) (not b!143541) (not b!143475) (not d!45815) (not d!45837) (not b!143384) (not b!143707) (not b_next!3039) (not d!45841) (not b!143693) (not b!143703) (not b!143536) (not d!45843) (not bm!15918) (not b!143532) (not b!143408) (not b_lambda!6467) (not b!143431) (not b!143635) (not b!143383) (not b!143388) (not d!45849) (not b!143518) (not d!45879) (not b!143626) (not bm!15907) (not b!143645) (not b!143387) (not d!45853) (not d!45851) (not bm!15928) (not b!143515) (not b!143432) (not d!45839) (not b!143699) (not b!143612) (not d!45915) (not b!143404) (not b!143669) (not d!45925) (not b!143381) (not bm!15911) (not b!143523) (not d!45885) (not b!143719) (not d!45917) (not b!143624) (not bm!15926) (not bm!15881) (not b!143481) (not b!143658) (not b!143533) (not b!143672) (not b!143528) (not d!45833) (not bm!15884) (not b!143568) (not d!45859) tp_is_empty!2935 (not bm!15888) (not d!45901) (not bm!15923) (not bm!15903) (not d!45927) (not d!45893) (not d!45887) (not b!143479) (not d!45869) (not b_lambda!6463) (not d!45835) (not b!143416) (not b!143378) (not d!45825) (not bm!15909) (not b!143571) (not b!143382) (not bm!15886) (not b!143389) (not b!143687) (not d!45931) (not b!143695) (not d!45873) (not b!143686) (not b_lambda!6459) (not d!45899) (not d!45881) (not b!143637) (not d!45905) (not d!45867) (not bm!15924) (not b!143522) (not b!143514) (not b!143718) (not b!143400) (not d!45897) (not b!143673) (not bm!15906) (not b!143542) (not b!143484) (not bm!15900) (not b!143697) (not d!45883) (not b_lambda!6465) (not bm!15920) (not b!143559) b_and!8963 (not d!45847) (not b!143540) (not d!45857) (not b!143656) (not d!45935) (not mapNonEmpty!4874) (not bm!15882) (not b!143556) (not b!143639) (not d!45919) (not b!143706) (not b_lambda!6447) (not b!143565) b_and!8961 (not b!143434) (not b!143510) (not d!45855) (not b!143688) (not bm!15913) (not b!143628) (not b!143485) (not b!143712) (not b!143720) (not b!143636) (not b!143560) (not d!45863) (not b!143646) (not d!45865) (not b_lambda!6461) (not d!45875) (not b!143544) (not bm!15901) (not b!143555) (not b!143519) (not b!143683) (not b!143668) (not d!45929) (not b!143702) (not d!45913) (not b!143550) (not b!143530) (not b!143649) (not d!45861) (not b!143403) (not b!143534) (not b!143413) (not b!143517) (not b!143511) (not b!143634) (not b_lambda!6443) (not b!143398) (not b!143397) (not d!45907) (not b!143652) (not b!143531) (not d!45921) (not b!143685) (not b!143715) (not b!143385) (not b!143391) (not b!143521) (not bm!15930) (not mapNonEmpty!4873) (not d!45895) (not bm!15919))
(check-sat b_and!8961 b_and!8963 (not b_next!3037) (not b_next!3039))
