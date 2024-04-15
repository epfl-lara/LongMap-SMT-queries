; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14100 () Bool)

(assert start!14100)

(declare-fun b!130843 () Bool)

(declare-fun b_free!2893 () Bool)

(declare-fun b_next!2893 () Bool)

(assert (=> b!130843 (= b_free!2893 (not b_next!2893))))

(declare-fun tp!11109 () Bool)

(declare-fun b_and!8085 () Bool)

(assert (=> b!130843 (= tp!11109 b_and!8085)))

(declare-fun b!130856 () Bool)

(declare-fun b_free!2895 () Bool)

(declare-fun b_next!2895 () Bool)

(assert (=> b!130856 (= b_free!2895 (not b_next!2895))))

(declare-fun tp!11110 () Bool)

(declare-fun b_and!8087 () Bool)

(assert (=> b!130856 (= tp!11110 b_and!8087)))

(declare-fun b!130841 () Bool)

(declare-fun e!85332 () Bool)

(declare-fun e!85341 () Bool)

(assert (=> b!130841 (= e!85332 e!85341)))

(declare-fun res!63036 () Bool)

(assert (=> b!130841 (=> (not res!63036) (not e!85341))))

(declare-datatypes ((V!3465 0))(
  ( (V!3466 (val!1476 Int)) )
))
(declare-datatypes ((array!4729 0))(
  ( (array!4730 (arr!2236 (Array (_ BitVec 32) (_ BitVec 64))) (size!2504 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1088 0))(
  ( (ValueCellFull!1088 (v!3168 V!3465)) (EmptyCell!1088) )
))
(declare-datatypes ((array!4731 0))(
  ( (array!4732 (arr!2237 (Array (_ BitVec 32) ValueCell!1088)) (size!2505 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1084 0))(
  ( (LongMapFixedSize!1085 (defaultEntry!2842 Int) (mask!7129 (_ BitVec 32)) (extraKeys!2611 (_ BitVec 32)) (zeroValue!2699 V!3465) (minValue!2699 V!3465) (_size!591 (_ BitVec 32)) (_keys!4586 array!4729) (_values!2825 array!4731) (_vacant!591 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!868 0))(
  ( (Cell!869 (v!3169 LongMapFixedSize!1084)) )
))
(declare-datatypes ((LongMap!868 0))(
  ( (LongMap!869 (underlying!445 Cell!868)) )
))
(declare-fun thiss!992 () LongMap!868)

(declare-datatypes ((tuple2!2574 0))(
  ( (tuple2!2575 (_1!1298 (_ BitVec 64)) (_2!1298 V!3465)) )
))
(declare-datatypes ((List!1704 0))(
  ( (Nil!1701) (Cons!1700 (h!2305 tuple2!2574) (t!6114 List!1704)) )
))
(declare-datatypes ((ListLongMap!1665 0))(
  ( (ListLongMap!1666 (toList!848 List!1704)) )
))
(declare-fun lt!68004 () ListLongMap!1665)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!880 (ListLongMap!1665 (_ BitVec 64)) Bool)

(assert (=> b!130841 (= res!63036 (contains!880 lt!68004 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1084)

(declare-datatypes ((tuple2!2576 0))(
  ( (tuple2!2577 (_1!1299 Bool) (_2!1299 LongMapFixedSize!1084)) )
))
(declare-fun lt!68002 () tuple2!2576)

(declare-fun update!190 (LongMapFixedSize!1084 (_ BitVec 64) V!3465) tuple2!2576)

(declare-fun get!1466 (ValueCell!1088 V!3465) V!3465)

(declare-fun dynLambda!416 (Int (_ BitVec 64)) V!3465)

(assert (=> b!130841 (= lt!68002 (update!190 newMap!16 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130842 () Bool)

(declare-fun res!63040 () Bool)

(declare-fun e!85330 () Bool)

(assert (=> b!130842 (=> (not res!63040) (not e!85330))))

(declare-fun valid!523 (LongMapFixedSize!1084) Bool)

(assert (=> b!130842 (= res!63040 (valid!523 newMap!16))))

(declare-fun mapIsEmpty!4589 () Bool)

(declare-fun mapRes!4589 () Bool)

(assert (=> mapIsEmpty!4589 mapRes!4589))

(declare-fun e!85344 () Bool)

(declare-fun tp_is_empty!2863 () Bool)

(declare-fun e!85342 () Bool)

(declare-fun array_inv!1421 (array!4729) Bool)

(declare-fun array_inv!1422 (array!4731) Bool)

(assert (=> b!130843 (= e!85344 (and tp!11109 tp_is_empty!2863 (array_inv!1421 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (array_inv!1422 (_values!2825 (v!3169 (underlying!445 thiss!992)))) e!85342))))

(declare-fun b!130844 () Bool)

(declare-fun e!85336 () Bool)

(assert (=> b!130844 (= e!85336 tp_is_empty!2863)))

(declare-fun b!130845 () Bool)

(assert (=> b!130845 (= e!85330 e!85332)))

(declare-fun res!63038 () Bool)

(assert (=> b!130845 (=> (not res!63038) (not e!85332))))

(declare-fun lt!68003 () ListLongMap!1665)

(assert (=> b!130845 (= res!63038 (and (= lt!68003 lt!68004) (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1384 (LongMapFixedSize!1084) ListLongMap!1665)

(assert (=> b!130845 (= lt!68004 (map!1384 newMap!16))))

(declare-fun getCurrentListMap!516 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) ListLongMap!1665)

(assert (=> b!130845 (= lt!68003 (getCurrentListMap!516 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!130846 () Bool)

(declare-fun res!63039 () Bool)

(assert (=> b!130846 (=> (not res!63039) (not e!85330))))

(assert (=> b!130846 (= res!63039 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7129 newMap!16)) (_size!591 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!130847 () Bool)

(declare-fun e!85331 () Bool)

(assert (=> b!130847 (= e!85331 tp_is_empty!2863)))

(declare-fun mapNonEmpty!4589 () Bool)

(declare-fun mapRes!4590 () Bool)

(declare-fun tp!11111 () Bool)

(assert (=> mapNonEmpty!4589 (= mapRes!4590 (and tp!11111 e!85336))))

(declare-fun mapRest!4589 () (Array (_ BitVec 32) ValueCell!1088))

(declare-fun mapKey!4590 () (_ BitVec 32))

(declare-fun mapValue!4589 () ValueCell!1088)

(assert (=> mapNonEmpty!4589 (= (arr!2237 (_values!2825 newMap!16)) (store mapRest!4589 mapKey!4590 mapValue!4589))))

(declare-fun b!130848 () Bool)

(declare-fun e!85334 () Bool)

(declare-fun e!85339 () Bool)

(assert (=> b!130848 (= e!85334 e!85339)))

(declare-fun b!130849 () Bool)

(declare-fun res!63035 () Bool)

(assert (=> b!130849 (=> (not res!63035) (not e!85341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!130849 (= res!63035 (validMask!0 (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun mapNonEmpty!4590 () Bool)

(declare-fun tp!11112 () Bool)

(declare-fun e!85338 () Bool)

(assert (=> mapNonEmpty!4590 (= mapRes!4589 (and tp!11112 e!85338))))

(declare-fun mapKey!4589 () (_ BitVec 32))

(declare-fun mapValue!4590 () ValueCell!1088)

(declare-fun mapRest!4590 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4590 (= (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (store mapRest!4590 mapKey!4589 mapValue!4590))))

(declare-fun b!130850 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4729 (_ BitVec 32)) Bool)

(assert (=> b!130850 (= e!85341 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!130851 () Bool)

(declare-fun e!85343 () Bool)

(assert (=> b!130851 (= e!85343 tp_is_empty!2863)))

(declare-fun b!130852 () Bool)

(assert (=> b!130852 (= e!85342 (and e!85343 mapRes!4589))))

(declare-fun condMapEmpty!4589 () Bool)

(declare-fun mapDefault!4590 () ValueCell!1088)

(assert (=> b!130852 (= condMapEmpty!4589 (= (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4590)))))

(declare-fun b!130854 () Bool)

(declare-fun res!63033 () Bool)

(assert (=> b!130854 (=> (not res!63033) (not e!85341))))

(assert (=> b!130854 (= res!63033 (and (= (size!2505 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7129 (v!3169 (underlying!445 thiss!992))))) (= (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (size!2505 (_values!2825 (v!3169 (underlying!445 thiss!992))))) (bvsge (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!130855 () Bool)

(assert (=> b!130855 (= e!85338 tp_is_empty!2863)))

(declare-fun e!85337 () Bool)

(declare-fun e!85333 () Bool)

(assert (=> b!130856 (= e!85337 (and tp!11110 tp_is_empty!2863 (array_inv!1421 (_keys!4586 newMap!16)) (array_inv!1422 (_values!2825 newMap!16)) e!85333))))

(declare-fun b!130857 () Bool)

(assert (=> b!130857 (= e!85339 e!85344)))

(declare-fun b!130858 () Bool)

(assert (=> b!130858 (= e!85333 (and e!85331 mapRes!4590))))

(declare-fun condMapEmpty!4590 () Bool)

(declare-fun mapDefault!4589 () ValueCell!1088)

(assert (=> b!130858 (= condMapEmpty!4590 (= (arr!2237 (_values!2825 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4589)))))

(declare-fun mapIsEmpty!4590 () Bool)

(assert (=> mapIsEmpty!4590 mapRes!4590))

(declare-fun res!63034 () Bool)

(assert (=> start!14100 (=> (not res!63034) (not e!85330))))

(declare-fun valid!524 (LongMap!868) Bool)

(assert (=> start!14100 (= res!63034 (valid!524 thiss!992))))

(assert (=> start!14100 e!85330))

(assert (=> start!14100 e!85334))

(assert (=> start!14100 true))

(assert (=> start!14100 e!85337))

(declare-fun b!130853 () Bool)

(declare-fun res!63037 () Bool)

(assert (=> b!130853 (=> (not res!63037) (not e!85330))))

(assert (=> b!130853 (= res!63037 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992)))))))))

(assert (= (and start!14100 res!63034) b!130853))

(assert (= (and b!130853 res!63037) b!130842))

(assert (= (and b!130842 res!63040) b!130846))

(assert (= (and b!130846 res!63039) b!130845))

(assert (= (and b!130845 res!63038) b!130841))

(assert (= (and b!130841 res!63036) b!130849))

(assert (= (and b!130849 res!63035) b!130854))

(assert (= (and b!130854 res!63033) b!130850))

(assert (= (and b!130852 condMapEmpty!4589) mapIsEmpty!4589))

(assert (= (and b!130852 (not condMapEmpty!4589)) mapNonEmpty!4590))

(get-info :version)

(assert (= (and mapNonEmpty!4590 ((_ is ValueCellFull!1088) mapValue!4590)) b!130855))

(assert (= (and b!130852 ((_ is ValueCellFull!1088) mapDefault!4590)) b!130851))

(assert (= b!130843 b!130852))

(assert (= b!130857 b!130843))

(assert (= b!130848 b!130857))

(assert (= start!14100 b!130848))

(assert (= (and b!130858 condMapEmpty!4590) mapIsEmpty!4590))

(assert (= (and b!130858 (not condMapEmpty!4590)) mapNonEmpty!4589))

(assert (= (and mapNonEmpty!4589 ((_ is ValueCellFull!1088) mapValue!4589)) b!130844))

(assert (= (and b!130858 ((_ is ValueCellFull!1088) mapDefault!4589)) b!130847))

(assert (= b!130856 b!130858))

(assert (= start!14100 b!130856))

(declare-fun b_lambda!5821 () Bool)

(assert (=> (not b_lambda!5821) (not b!130841)))

(declare-fun t!6111 () Bool)

(declare-fun tb!2373 () Bool)

(assert (=> (and b!130843 (= (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))) t!6111) tb!2373))

(declare-fun result!3925 () Bool)

(assert (=> tb!2373 (= result!3925 tp_is_empty!2863)))

(assert (=> b!130841 t!6111))

(declare-fun b_and!8089 () Bool)

(assert (= b_and!8085 (and (=> t!6111 result!3925) b_and!8089)))

(declare-fun tb!2375 () Bool)

(declare-fun t!6113 () Bool)

(assert (=> (and b!130856 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))) t!6113) tb!2375))

(declare-fun result!3929 () Bool)

(assert (= result!3929 result!3925))

(assert (=> b!130841 t!6113))

(declare-fun b_and!8091 () Bool)

(assert (= b_and!8087 (and (=> t!6113 result!3929) b_and!8091)))

(declare-fun m!154159 () Bool)

(assert (=> mapNonEmpty!4590 m!154159))

(declare-fun m!154161 () Bool)

(assert (=> b!130843 m!154161))

(declare-fun m!154163 () Bool)

(assert (=> b!130843 m!154163))

(declare-fun m!154165 () Bool)

(assert (=> b!130842 m!154165))

(declare-fun m!154167 () Bool)

(assert (=> b!130849 m!154167))

(declare-fun m!154169 () Bool)

(assert (=> mapNonEmpty!4589 m!154169))

(declare-fun m!154171 () Bool)

(assert (=> b!130845 m!154171))

(declare-fun m!154173 () Bool)

(assert (=> b!130845 m!154173))

(declare-fun m!154175 () Bool)

(assert (=> b!130845 m!154175))

(declare-fun m!154177 () Bool)

(assert (=> b!130856 m!154177))

(declare-fun m!154179 () Bool)

(assert (=> b!130856 m!154179))

(declare-fun m!154181 () Bool)

(assert (=> b!130850 m!154181))

(declare-fun m!154183 () Bool)

(assert (=> b!130841 m!154183))

(declare-fun m!154185 () Bool)

(assert (=> b!130841 m!154185))

(declare-fun m!154187 () Bool)

(assert (=> b!130841 m!154187))

(assert (=> b!130841 m!154171))

(declare-fun m!154189 () Bool)

(assert (=> b!130841 m!154189))

(assert (=> b!130841 m!154171))

(assert (=> b!130841 m!154185))

(assert (=> b!130841 m!154171))

(assert (=> b!130841 m!154187))

(declare-fun m!154191 () Bool)

(assert (=> b!130841 m!154191))

(assert (=> b!130841 m!154183))

(declare-fun m!154193 () Bool)

(assert (=> start!14100 m!154193))

(check-sat (not b!130849) (not b!130843) (not b!130842) (not b!130841) (not mapNonEmpty!4590) (not b_next!2895) (not b!130850) b_and!8091 tp_is_empty!2863 (not start!14100) b_and!8089 (not b_lambda!5821) (not mapNonEmpty!4589) (not b!130856) (not b!130845) (not b_next!2893))
(check-sat b_and!8089 b_and!8091 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun b_lambda!5827 () Bool)

(assert (= b_lambda!5821 (or (and b!130843 b_free!2893) (and b!130856 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))))) b_lambda!5827)))

(check-sat (not b!130849) (not b!130843) (not b!130842) (not mapNonEmpty!4590) (not b_next!2895) (not b!130850) b_and!8091 tp_is_empty!2863 (not start!14100) b_and!8089 (not mapNonEmpty!4589) (not b!130856) (not b!130845) (not b_next!2893) (not b!130841) (not b_lambda!5827))
(check-sat b_and!8089 b_and!8091 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun d!39953 () Bool)

(declare-fun e!85439 () Bool)

(assert (=> d!39953 e!85439))

(declare-fun res!63091 () Bool)

(assert (=> d!39953 (=> res!63091 e!85439)))

(declare-fun lt!68032 () Bool)

(assert (=> d!39953 (= res!63091 (not lt!68032))))

(declare-fun lt!68033 () Bool)

(assert (=> d!39953 (= lt!68032 lt!68033)))

(declare-datatypes ((Unit!4094 0))(
  ( (Unit!4095) )
))
(declare-fun lt!68034 () Unit!4094)

(declare-fun e!85440 () Unit!4094)

(assert (=> d!39953 (= lt!68034 e!85440)))

(declare-fun c!24186 () Bool)

(assert (=> d!39953 (= c!24186 lt!68033)))

(declare-fun containsKey!172 (List!1704 (_ BitVec 64)) Bool)

(assert (=> d!39953 (= lt!68033 (containsKey!172 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!39953 (= (contains!880 lt!68004 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) lt!68032)))

(declare-fun b!130979 () Bool)

(declare-fun lt!68031 () Unit!4094)

(assert (=> b!130979 (= e!85440 lt!68031)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!121 (List!1704 (_ BitVec 64)) Unit!4094)

(assert (=> b!130979 (= lt!68031 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-datatypes ((Option!174 0))(
  ( (Some!173 (v!3175 V!3465)) (None!172) )
))
(declare-fun isDefined!122 (Option!174) Bool)

(declare-fun getValueByKey!168 (List!1704 (_ BitVec 64)) Option!174)

(assert (=> b!130979 (isDefined!122 (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!130980 () Bool)

(declare-fun Unit!4096 () Unit!4094)

(assert (=> b!130980 (= e!85440 Unit!4096)))

(declare-fun b!130981 () Bool)

(assert (=> b!130981 (= e!85439 (isDefined!122 (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!39953 c!24186) b!130979))

(assert (= (and d!39953 (not c!24186)) b!130980))

(assert (= (and d!39953 (not res!63091)) b!130981))

(assert (=> d!39953 m!154171))

(declare-fun m!154267 () Bool)

(assert (=> d!39953 m!154267))

(assert (=> b!130979 m!154171))

(declare-fun m!154269 () Bool)

(assert (=> b!130979 m!154269))

(assert (=> b!130979 m!154171))

(declare-fun m!154271 () Bool)

(assert (=> b!130979 m!154271))

(assert (=> b!130979 m!154271))

(declare-fun m!154273 () Bool)

(assert (=> b!130979 m!154273))

(assert (=> b!130981 m!154171))

(assert (=> b!130981 m!154271))

(assert (=> b!130981 m!154271))

(assert (=> b!130981 m!154273))

(assert (=> b!130841 d!39953))

(declare-fun b!131066 () Bool)

(declare-fun e!85494 () tuple2!2576)

(declare-fun lt!68096 () tuple2!2576)

(assert (=> b!131066 (= e!85494 (tuple2!2577 (_1!1299 lt!68096) (_2!1299 lt!68096)))))

(declare-fun call!14299 () tuple2!2576)

(assert (=> b!131066 (= lt!68096 call!14299)))

(declare-fun b!131067 () Bool)

(declare-fun res!63121 () Bool)

(declare-fun call!14291 () Bool)

(assert (=> b!131067 (= res!63121 call!14291)))

(declare-fun e!85506 () Bool)

(assert (=> b!131067 (=> (not res!63121) (not e!85506))))

(declare-fun call!14297 () ListLongMap!1665)

(declare-fun b!131068 () Bool)

(declare-fun e!85489 () Bool)

(declare-fun call!14290 () ListLongMap!1665)

(declare-fun +!161 (ListLongMap!1665 tuple2!2574) ListLongMap!1665)

(assert (=> b!131068 (= e!85489 (= call!14290 (+!161 call!14297 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!131069 () Bool)

(declare-fun res!63123 () Bool)

(declare-fun e!85495 () Bool)

(assert (=> b!131069 (=> (not res!63123) (not e!85495))))

(declare-datatypes ((SeekEntryResult!276 0))(
  ( (MissingZero!276 (index!3262 (_ BitVec 32))) (Found!276 (index!3263 (_ BitVec 32))) (Intermediate!276 (undefined!1088 Bool) (index!3264 (_ BitVec 32)) (x!15414 (_ BitVec 32))) (Undefined!276) (MissingVacant!276 (index!3265 (_ BitVec 32))) )
))
(declare-fun lt!68095 () SeekEntryResult!276)

(assert (=> b!131069 (= res!63123 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3262 lt!68095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131070 () Bool)

(declare-fun e!85493 () tuple2!2576)

(declare-fun e!85499 () tuple2!2576)

(assert (=> b!131070 (= e!85493 e!85499)))

(declare-fun lt!68114 () SeekEntryResult!276)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4729 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> b!131070 (= lt!68114 (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun c!24216 () Bool)

(assert (=> b!131070 (= c!24216 ((_ is Undefined!276) lt!68114))))

(declare-fun b!131071 () Bool)

(declare-fun res!63129 () Bool)

(assert (=> b!131071 (= res!63129 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3265 lt!68095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85505 () Bool)

(assert (=> b!131071 (=> (not res!63129) (not e!85505))))

(declare-fun c!24223 () Bool)

(declare-fun bm!14280 () Bool)

(declare-fun updateHelperNewKey!59 (LongMapFixedSize!1084 (_ BitVec 64) V!3465 (_ BitVec 32)) tuple2!2576)

(assert (=> bm!14280 (= call!14299 (updateHelperNewKey!59 newMap!16 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114))))))

(declare-fun bm!14281 () Bool)

(declare-fun c!24219 () Bool)

(assert (=> bm!14281 (= c!24219 c!24216)))

(declare-fun call!14294 () Bool)

(declare-fun e!85503 () ListLongMap!1665)

(assert (=> bm!14281 (= call!14294 (contains!880 e!85503 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun bm!14282 () Bool)

(declare-fun call!14296 () Bool)

(declare-fun call!14286 () Bool)

(assert (=> bm!14282 (= call!14296 call!14286)))

(declare-fun b!131072 () Bool)

(declare-fun e!85500 () Bool)

(assert (=> b!131072 (= e!85500 (= call!14290 call!14297))))

(declare-fun bm!14283 () Bool)

(declare-fun call!14283 () Bool)

(assert (=> bm!14283 (= call!14283 call!14286)))

(declare-fun b!131073 () Bool)

(assert (=> b!131073 (= c!24223 ((_ is MissingVacant!276) lt!68114))))

(assert (=> b!131073 (= e!85499 e!85494)))

(declare-fun b!131074 () Bool)

(declare-fun e!85491 () Bool)

(assert (=> b!131074 (= e!85491 e!85500)))

(declare-fun c!24225 () Bool)

(declare-fun lt!68100 () tuple2!2576)

(assert (=> b!131074 (= c!24225 (_1!1299 lt!68100))))

(declare-fun c!24228 () Bool)

(declare-fun c!24222 () Bool)

(declare-fun call!14300 () ListLongMap!1665)

(declare-fun bm!14284 () Bool)

(declare-fun e!85498 () ListLongMap!1665)

(assert (=> bm!14284 (= call!14300 (+!161 e!85498 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24221 () Bool)

(assert (=> bm!14284 (= c!24221 c!24228)))

(declare-fun b!131075 () Bool)

(declare-fun call!14292 () ListLongMap!1665)

(assert (=> b!131075 (= e!85498 call!14292)))

(declare-fun b!131076 () Bool)

(declare-fun res!63133 () Bool)

(declare-fun lt!68091 () SeekEntryResult!276)

(assert (=> b!131076 (= res!63133 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3265 lt!68091)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85497 () Bool)

(assert (=> b!131076 (=> (not res!63133) (not e!85497))))

(declare-fun bm!14285 () Bool)

(declare-fun arrayContainsKey!0 (array!4729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14285 (= call!14286 (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131077 () Bool)

(assert (=> b!131077 (= e!85498 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131078 () Bool)

(assert (=> b!131078 (= e!85500 e!85489)))

(declare-fun res!63124 () Bool)

(assert (=> b!131078 (= res!63124 (contains!880 call!14290 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!131078 (=> (not res!63124) (not e!85489))))

(declare-fun b!131079 () Bool)

(declare-fun e!85485 () Bool)

(assert (=> b!131079 (= e!85485 e!85505)))

(declare-fun res!63126 () Bool)

(declare-fun call!14298 () Bool)

(assert (=> b!131079 (= res!63126 call!14298)))

(assert (=> b!131079 (=> (not res!63126) (not e!85505))))

(declare-fun b!131080 () Bool)

(assert (=> b!131080 (= e!85505 (not call!14283))))

(declare-fun bm!14286 () Bool)

(declare-fun call!14288 () Bool)

(assert (=> bm!14286 (= call!14291 call!14288)))

(declare-fun call!14302 () Unit!4094)

(declare-fun bm!14287 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4094)

(assert (=> bm!14287 (= call!14302 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(declare-fun b!131081 () Bool)

(assert (=> b!131081 (= e!85497 (not call!14296))))

(declare-fun call!14306 () Unit!4094)

(declare-fun bm!14288 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4094)

(assert (=> bm!14288 (= call!14306 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(declare-fun b!131082 () Bool)

(assert (=> b!131082 (= e!85485 ((_ is Undefined!276) lt!68095))))

(declare-fun bm!14289 () Bool)

(declare-fun call!14303 () ListLongMap!1665)

(assert (=> bm!14289 (= call!14303 call!14300)))

(declare-fun b!131083 () Bool)

(declare-fun e!85502 () Unit!4094)

(declare-fun lt!68092 () Unit!4094)

(assert (=> b!131083 (= e!85502 lt!68092)))

(assert (=> b!131083 (= lt!68092 call!14306)))

(declare-fun call!14293 () SeekEntryResult!276)

(assert (=> b!131083 (= lt!68091 call!14293)))

(declare-fun c!24220 () Bool)

(assert (=> b!131083 (= c!24220 ((_ is MissingZero!276) lt!68091))))

(declare-fun e!85488 () Bool)

(assert (=> b!131083 e!85488))

(declare-fun b!131084 () Bool)

(declare-fun res!63131 () Bool)

(declare-fun call!14305 () Bool)

(assert (=> b!131084 (= res!63131 call!14305)))

(declare-fun e!85501 () Bool)

(assert (=> b!131084 (=> (not res!63131) (not e!85501))))

(declare-fun bm!14290 () Bool)

(assert (=> bm!14290 (= call!14290 (map!1384 (_2!1299 lt!68100)))))

(declare-fun b!131085 () Bool)

(declare-fun e!85490 () Bool)

(assert (=> b!131085 (= e!85490 ((_ is Undefined!276) lt!68091))))

(declare-fun lt!68104 () SeekEntryResult!276)

(declare-fun b!131086 () Bool)

(assert (=> b!131086 (= e!85506 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68104)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun d!39955 () Bool)

(assert (=> d!39955 e!85491))

(declare-fun res!63128 () Bool)

(assert (=> d!39955 (=> (not res!63128) (not e!85491))))

(assert (=> d!39955 (= res!63128 (valid!523 (_2!1299 lt!68100)))))

(assert (=> d!39955 (= lt!68100 e!85493)))

(assert (=> d!39955 (= c!24228 (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (bvneg (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!39955 (valid!523 newMap!16)))

(assert (=> d!39955 (= (update!190 newMap!16 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68100)))

(declare-fun bm!14291 () Bool)

(declare-fun call!14284 () SeekEntryResult!276)

(declare-fun call!14301 () SeekEntryResult!276)

(assert (=> bm!14291 (= call!14284 call!14301)))

(declare-fun b!131087 () Bool)

(assert (=> b!131087 (= e!85495 (not call!14283))))

(declare-fun b!131088 () Bool)

(declare-fun res!63127 () Bool)

(declare-fun e!85496 () Bool)

(assert (=> b!131088 (=> (not res!63127) (not e!85496))))

(assert (=> b!131088 (= res!63127 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3262 lt!68091)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14292 () Bool)

(declare-fun call!14289 () ListLongMap!1665)

(declare-fun call!14304 () ListLongMap!1665)

(assert (=> bm!14292 (= call!14289 call!14304)))

(declare-fun b!131089 () Bool)

(declare-fun lt!68115 () Unit!4094)

(declare-fun lt!68103 () Unit!4094)

(assert (=> b!131089 (= lt!68115 lt!68103)))

(assert (=> b!131089 (= call!14303 call!14289)))

(declare-fun lt!68099 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!59 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4094)

(assert (=> b!131089 (= lt!68103 (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68099 (zeroValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131089 (= lt!68099 (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!85504 () tuple2!2576)

(assert (=> b!131089 (= e!85504 (tuple2!2577 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7129 newMap!16) (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (_size!591 newMap!16) (_keys!4586 newMap!16) (_values!2825 newMap!16) (_vacant!591 newMap!16))))))

(declare-fun b!131090 () Bool)

(declare-fun c!24227 () Bool)

(assert (=> b!131090 (= c!24227 ((_ is MissingVacant!276) lt!68095))))

(declare-fun e!85486 () Bool)

(assert (=> b!131090 (= e!85486 e!85485)))

(declare-fun bm!14293 () Bool)

(assert (=> bm!14293 (= call!14293 call!14301)))

(declare-fun bm!14294 () Bool)

(declare-fun call!14287 () ListLongMap!1665)

(assert (=> bm!14294 (= call!14287 (getCurrentListMap!516 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun c!24217 () Bool)

(declare-fun c!24215 () Bool)

(declare-fun bm!14295 () Bool)

(declare-fun lt!68094 () SeekEntryResult!276)

(declare-fun c!24224 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14295 (= call!14288 (inRange!0 (ite c!24216 (ite c!24217 (index!3263 lt!68094) (ite c!24220 (index!3262 lt!68091) (index!3265 lt!68091))) (ite c!24215 (index!3263 lt!68104) (ite c!24224 (index!3262 lt!68095) (index!3265 lt!68095)))) (mask!7129 newMap!16)))))

(declare-fun b!131091 () Bool)

(declare-fun e!85487 () Unit!4094)

(declare-fun Unit!4097 () Unit!4094)

(assert (=> b!131091 (= e!85487 Unit!4097)))

(declare-fun lt!68111 () Unit!4094)

(assert (=> b!131091 (= lt!68111 call!14306)))

(assert (=> b!131091 (= lt!68095 call!14284)))

(assert (=> b!131091 (= c!24224 ((_ is MissingZero!276) lt!68095))))

(assert (=> b!131091 e!85486))

(declare-fun lt!68089 () Unit!4094)

(assert (=> b!131091 (= lt!68089 lt!68111)))

(assert (=> b!131091 false))

(declare-fun b!131092 () Bool)

(declare-fun lt!68107 () Unit!4094)

(declare-fun lt!68108 () Unit!4094)

(assert (=> b!131092 (= lt!68107 lt!68108)))

(assert (=> b!131092 (= call!14303 call!14289)))

(declare-fun lt!68112 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4094)

(assert (=> b!131092 (= lt!68108 (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68112 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131092 (= lt!68112 (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!131092 (= e!85504 (tuple2!2577 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7129 newMap!16) (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) (zeroValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!591 newMap!16) (_keys!4586 newMap!16) (_values!2825 newMap!16) (_vacant!591 newMap!16))))))

(declare-fun b!131093 () Bool)

(assert (=> b!131093 (= e!85490 e!85497)))

(declare-fun res!63125 () Bool)

(declare-fun call!14295 () Bool)

(assert (=> b!131093 (= res!63125 call!14295)))

(assert (=> b!131093 (=> (not res!63125) (not e!85497))))

(declare-fun b!131094 () Bool)

(declare-fun res!63132 () Bool)

(assert (=> b!131094 (=> (not res!63132) (not e!85496))))

(assert (=> b!131094 (= res!63132 call!14295)))

(assert (=> b!131094 (= e!85488 e!85496)))

(declare-fun bm!14296 () Bool)

(assert (=> bm!14296 (= call!14295 call!14305)))

(declare-fun bm!14297 () Bool)

(assert (=> bm!14297 (= call!14297 (map!1384 newMap!16))))

(declare-fun b!131095 () Bool)

(assert (=> b!131095 (= e!85496 (not call!14296))))

(declare-fun b!131096 () Bool)

(declare-fun res!63130 () Bool)

(assert (=> b!131096 (=> (not res!63130) (not e!85495))))

(assert (=> b!131096 (= res!63130 call!14298)))

(assert (=> b!131096 (= e!85486 e!85495)))

(declare-fun b!131097 () Bool)

(assert (=> b!131097 (= e!85503 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14298 () Bool)

(declare-fun lt!68098 () array!4731)

(assert (=> bm!14298 (= call!14304 (getCurrentListMap!516 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14299 () Bool)

(assert (=> bm!14299 (= call!14305 call!14288)))

(declare-fun bm!14300 () Bool)

(declare-fun call!14285 () ListLongMap!1665)

(assert (=> bm!14300 (= call!14285 call!14287)))

(declare-fun b!131098 () Bool)

(declare-fun lt!68097 () Unit!4094)

(assert (=> b!131098 (= lt!68097 e!85502)))

(assert (=> b!131098 (= c!24217 call!14294)))

(assert (=> b!131098 (= e!85499 (tuple2!2577 false newMap!16))))

(declare-fun b!131099 () Bool)

(assert (=> b!131099 (= e!85503 call!14285)))

(declare-fun b!131100 () Bool)

(declare-fun lt!68102 () tuple2!2576)

(assert (=> b!131100 (= lt!68102 call!14299)))

(declare-fun e!85492 () tuple2!2576)

(assert (=> b!131100 (= e!85492 (tuple2!2577 (_1!1299 lt!68102) (_2!1299 lt!68102)))))

(declare-fun b!131101 () Bool)

(assert (=> b!131101 (= e!85494 e!85492)))

(declare-fun c!24226 () Bool)

(assert (=> b!131101 (= c!24226 ((_ is MissingZero!276) lt!68114))))

(declare-fun b!131102 () Bool)

(declare-fun Unit!4098 () Unit!4094)

(assert (=> b!131102 (= e!85502 Unit!4098)))

(declare-fun lt!68113 () Unit!4094)

(assert (=> b!131102 (= lt!68113 call!14302)))

(assert (=> b!131102 (= lt!68094 call!14293)))

(declare-fun res!63120 () Bool)

(assert (=> b!131102 (= res!63120 ((_ is Found!276) lt!68094))))

(assert (=> b!131102 (=> (not res!63120) (not e!85501))))

(assert (=> b!131102 e!85501))

(declare-fun lt!68106 () Unit!4094)

(assert (=> b!131102 (= lt!68106 lt!68113)))

(assert (=> b!131102 false))

(declare-fun b!131103 () Bool)

(assert (=> b!131103 (= e!85501 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68094)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131104 () Bool)

(assert (=> b!131104 (= e!85493 e!85504)))

(assert (=> b!131104 (= c!24222 (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131105 () Bool)

(declare-fun lt!68090 () Unit!4094)

(declare-fun lt!68101 () Unit!4094)

(assert (=> b!131105 (= lt!68090 lt!68101)))

(assert (=> b!131105 (contains!880 call!14304 (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!118 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) Unit!4094)

(assert (=> b!131105 (= lt!68101 (lemmaValidKeyInArrayIsInListMap!118 (_keys!4586 newMap!16) lt!68098 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131105 (= lt!68098 (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))))))

(declare-fun lt!68110 () Unit!4094)

(declare-fun lt!68109 () Unit!4094)

(assert (=> b!131105 (= lt!68110 lt!68109)))

(assert (=> b!131105 (= call!14300 call!14285)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4094)

(assert (=> b!131105 (= lt!68109 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68093 () Unit!4094)

(assert (=> b!131105 (= lt!68093 e!85487)))

(assert (=> b!131105 (= c!24215 call!14294)))

(assert (=> b!131105 (= e!85492 (tuple2!2577 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (_size!591 newMap!16) (_keys!4586 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))) (_vacant!591 newMap!16))))))

(declare-fun bm!14301 () Bool)

(assert (=> bm!14301 (= call!14292 call!14287)))

(declare-fun bm!14302 () Bool)

(assert (=> bm!14302 (= call!14298 call!14291)))

(declare-fun b!131106 () Bool)

(declare-fun c!24218 () Bool)

(assert (=> b!131106 (= c!24218 ((_ is MissingVacant!276) lt!68091))))

(assert (=> b!131106 (= e!85488 e!85490)))

(declare-fun bm!14303 () Bool)

(assert (=> bm!14303 (= call!14301 (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun b!131107 () Bool)

(declare-fun lt!68105 () Unit!4094)

(assert (=> b!131107 (= e!85487 lt!68105)))

(assert (=> b!131107 (= lt!68105 call!14302)))

(assert (=> b!131107 (= lt!68104 call!14284)))

(declare-fun res!63122 () Bool)

(assert (=> b!131107 (= res!63122 ((_ is Found!276) lt!68104))))

(assert (=> b!131107 (=> (not res!63122) (not e!85506))))

(assert (=> b!131107 e!85506))

(assert (= (and d!39955 c!24228) b!131104))

(assert (= (and d!39955 (not c!24228)) b!131070))

(assert (= (and b!131104 c!24222) b!131089))

(assert (= (and b!131104 (not c!24222)) b!131092))

(assert (= (or b!131089 b!131092) bm!14301))

(assert (= (or b!131089 b!131092) bm!14292))

(assert (= (or b!131089 b!131092) bm!14289))

(assert (= (and b!131070 c!24216) b!131098))

(assert (= (and b!131070 (not c!24216)) b!131073))

(assert (= (and b!131098 c!24217) b!131102))

(assert (= (and b!131098 (not c!24217)) b!131083))

(assert (= (and b!131102 res!63120) b!131084))

(assert (= (and b!131084 res!63131) b!131103))

(assert (= (and b!131083 c!24220) b!131094))

(assert (= (and b!131083 (not c!24220)) b!131106))

(assert (= (and b!131094 res!63132) b!131088))

(assert (= (and b!131088 res!63127) b!131095))

(assert (= (and b!131106 c!24218) b!131093))

(assert (= (and b!131106 (not c!24218)) b!131085))

(assert (= (and b!131093 res!63125) b!131076))

(assert (= (and b!131076 res!63133) b!131081))

(assert (= (or b!131094 b!131093) bm!14296))

(assert (= (or b!131095 b!131081) bm!14282))

(assert (= (or b!131084 bm!14296) bm!14299))

(assert (= (or b!131102 b!131083) bm!14293))

(assert (= (and b!131073 c!24223) b!131066))

(assert (= (and b!131073 (not c!24223)) b!131101))

(assert (= (and b!131101 c!24226) b!131100))

(assert (= (and b!131101 (not c!24226)) b!131105))

(assert (= (and b!131105 c!24215) b!131107))

(assert (= (and b!131105 (not c!24215)) b!131091))

(assert (= (and b!131107 res!63122) b!131067))

(assert (= (and b!131067 res!63121) b!131086))

(assert (= (and b!131091 c!24224) b!131096))

(assert (= (and b!131091 (not c!24224)) b!131090))

(assert (= (and b!131096 res!63130) b!131069))

(assert (= (and b!131069 res!63123) b!131087))

(assert (= (and b!131090 c!24227) b!131079))

(assert (= (and b!131090 (not c!24227)) b!131082))

(assert (= (and b!131079 res!63126) b!131071))

(assert (= (and b!131071 res!63129) b!131080))

(assert (= (or b!131096 b!131079) bm!14302))

(assert (= (or b!131087 b!131080) bm!14283))

(assert (= (or b!131067 bm!14302) bm!14286))

(assert (= (or b!131107 b!131091) bm!14291))

(assert (= (or b!131066 b!131100) bm!14280))

(assert (= (or bm!14282 bm!14283) bm!14285))

(assert (= (or b!131083 b!131091) bm!14288))

(assert (= (or bm!14293 bm!14291) bm!14303))

(assert (= (or b!131098 b!131105) bm!14300))

(assert (= (or bm!14299 bm!14286) bm!14295))

(assert (= (or b!131102 b!131107) bm!14287))

(assert (= (or b!131098 b!131105) bm!14281))

(assert (= (and bm!14281 c!24219) b!131099))

(assert (= (and bm!14281 (not c!24219)) b!131097))

(assert (= (or bm!14301 bm!14300) bm!14294))

(assert (= (or bm!14292 b!131105) bm!14298))

(assert (= (or bm!14289 b!131105) bm!14284))

(assert (= (and bm!14284 c!24221) b!131075))

(assert (= (and bm!14284 (not c!24221)) b!131077))

(assert (= (and d!39955 res!63128) b!131074))

(assert (= (and b!131074 c!24225) b!131078))

(assert (= (and b!131074 (not c!24225)) b!131072))

(assert (= (and b!131078 res!63124) b!131068))

(assert (= (or b!131068 b!131072) bm!14297))

(assert (= (or b!131078 b!131068 b!131072) bm!14290))

(assert (=> bm!14297 m!154173))

(declare-fun m!154275 () Bool)

(assert (=> b!131086 m!154275))

(declare-fun m!154277 () Bool)

(assert (=> bm!14290 m!154277))

(assert (=> b!131092 m!154187))

(declare-fun m!154279 () Bool)

(assert (=> b!131092 m!154279))

(declare-fun m!154281 () Bool)

(assert (=> b!131076 m!154281))

(declare-fun m!154283 () Bool)

(assert (=> b!131088 m!154283))

(assert (=> bm!14280 m!154171))

(assert (=> bm!14280 m!154187))

(declare-fun m!154285 () Bool)

(assert (=> bm!14280 m!154285))

(assert (=> bm!14303 m!154171))

(declare-fun m!154287 () Bool)

(assert (=> bm!14303 m!154287))

(declare-fun m!154289 () Bool)

(assert (=> bm!14295 m!154289))

(declare-fun m!154291 () Bool)

(assert (=> b!131097 m!154291))

(assert (=> b!131078 m!154171))

(declare-fun m!154293 () Bool)

(assert (=> b!131078 m!154293))

(declare-fun m!154295 () Bool)

(assert (=> b!131071 m!154295))

(declare-fun m!154297 () Bool)

(assert (=> bm!14284 m!154297))

(declare-fun m!154299 () Bool)

(assert (=> d!39955 m!154299))

(assert (=> d!39955 m!154165))

(declare-fun m!154301 () Bool)

(assert (=> bm!14298 m!154301))

(assert (=> bm!14281 m!154171))

(declare-fun m!154303 () Bool)

(assert (=> bm!14281 m!154303))

(assert (=> bm!14288 m!154171))

(declare-fun m!154305 () Bool)

(assert (=> bm!14288 m!154305))

(assert (=> bm!14285 m!154171))

(declare-fun m!154307 () Bool)

(assert (=> bm!14285 m!154307))

(declare-fun m!154309 () Bool)

(assert (=> b!131103 m!154309))

(assert (=> b!131089 m!154187))

(declare-fun m!154311 () Bool)

(assert (=> b!131089 m!154311))

(declare-fun m!154313 () Bool)

(assert (=> b!131105 m!154313))

(declare-fun m!154315 () Bool)

(assert (=> b!131105 m!154315))

(assert (=> b!131105 m!154313))

(declare-fun m!154317 () Bool)

(assert (=> b!131105 m!154317))

(assert (=> b!131105 m!154171))

(assert (=> b!131105 m!154187))

(declare-fun m!154319 () Bool)

(assert (=> b!131105 m!154319))

(declare-fun m!154321 () Bool)

(assert (=> b!131105 m!154321))

(assert (=> bm!14287 m!154171))

(declare-fun m!154323 () Bool)

(assert (=> bm!14287 m!154323))

(declare-fun m!154325 () Bool)

(assert (=> b!131068 m!154325))

(assert (=> bm!14294 m!154317))

(declare-fun m!154327 () Bool)

(assert (=> bm!14294 m!154327))

(assert (=> b!131070 m!154171))

(assert (=> b!131070 m!154287))

(assert (=> b!131077 m!154291))

(declare-fun m!154329 () Bool)

(assert (=> b!131069 m!154329))

(assert (=> b!130841 d!39955))

(declare-fun d!39957 () Bool)

(declare-fun c!24231 () Bool)

(assert (=> d!39957 (= c!24231 ((_ is ValueCellFull!1088) (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!85509 () V!3465)

(assert (=> d!39957 (= (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85509)))

(declare-fun b!131112 () Bool)

(declare-fun get!1467 (ValueCell!1088 V!3465) V!3465)

(assert (=> b!131112 (= e!85509 (get!1467 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131113 () Bool)

(declare-fun get!1468 (ValueCell!1088 V!3465) V!3465)

(assert (=> b!131113 (= e!85509 (get!1468 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39957 c!24231) b!131112))

(assert (= (and d!39957 (not c!24231)) b!131113))

(assert (=> b!131112 m!154183))

(assert (=> b!131112 m!154185))

(declare-fun m!154331 () Bool)

(assert (=> b!131112 m!154331))

(assert (=> b!131113 m!154183))

(assert (=> b!131113 m!154185))

(declare-fun m!154333 () Bool)

(assert (=> b!131113 m!154333))

(assert (=> b!130841 d!39957))

(declare-fun d!39959 () Bool)

(assert (=> d!39959 (= (map!1384 newMap!16) (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bs!5432 () Bool)

(assert (= bs!5432 d!39959))

(assert (=> bs!5432 m!154291))

(assert (=> b!130845 d!39959))

(declare-fun b!131156 () Bool)

(declare-fun e!85548 () ListLongMap!1665)

(declare-fun call!14321 () ListLongMap!1665)

(assert (=> b!131156 (= e!85548 (+!161 call!14321 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131157 () Bool)

(declare-fun e!85542 () Bool)

(declare-fun e!85546 () Bool)

(assert (=> b!131157 (= e!85542 e!85546)))

(declare-fun res!63156 () Bool)

(declare-fun call!14327 () Bool)

(assert (=> b!131157 (= res!63156 call!14327)))

(assert (=> b!131157 (=> (not res!63156) (not e!85546))))

(declare-fun b!131158 () Bool)

(declare-fun e!85540 () ListLongMap!1665)

(declare-fun call!14325 () ListLongMap!1665)

(assert (=> b!131158 (= e!85540 call!14325)))

(declare-fun b!131160 () Bool)

(declare-fun res!63158 () Bool)

(declare-fun e!85537 () Bool)

(assert (=> b!131160 (=> (not res!63158) (not e!85537))))

(assert (=> b!131160 (= res!63158 e!85542)))

(declare-fun c!24249 () Bool)

(assert (=> b!131160 (= c!24249 (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131161 () Bool)

(declare-fun lt!68165 () ListLongMap!1665)

(declare-fun apply!114 (ListLongMap!1665 (_ BitVec 64)) V!3465)

(assert (=> b!131161 (= e!85546 (= (apply!114 lt!68165 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131162 () Bool)

(assert (=> b!131162 (= e!85548 e!85540)))

(declare-fun c!24245 () Bool)

(assert (=> b!131162 (= c!24245 (and (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131163 () Bool)

(declare-fun c!24247 () Bool)

(assert (=> b!131163 (= c!24247 (and (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85539 () ListLongMap!1665)

(assert (=> b!131163 (= e!85540 e!85539)))

(declare-fun b!131164 () Bool)

(declare-fun e!85538 () Bool)

(declare-fun e!85541 () Bool)

(assert (=> b!131164 (= e!85538 e!85541)))

(declare-fun res!63153 () Bool)

(assert (=> b!131164 (=> (not res!63153) (not e!85541))))

(assert (=> b!131164 (= res!63153 (contains!880 lt!68165 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131164 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun bm!14318 () Bool)

(assert (=> bm!14318 (= call!14327 (contains!880 lt!68165 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131165 () Bool)

(declare-fun e!85543 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131165 (= e!85543 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131166 () Bool)

(declare-fun res!63160 () Bool)

(assert (=> b!131166 (=> (not res!63160) (not e!85537))))

(assert (=> b!131166 (= res!63160 e!85538)))

(declare-fun res!63152 () Bool)

(assert (=> b!131166 (=> res!63152 e!85538)))

(assert (=> b!131166 (= res!63152 (not e!85543))))

(declare-fun res!63157 () Bool)

(assert (=> b!131166 (=> (not res!63157) (not e!85543))))

(assert (=> b!131166 (= res!63157 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131167 () Bool)

(declare-fun call!14323 () ListLongMap!1665)

(assert (=> b!131167 (= e!85539 call!14323)))

(declare-fun b!131168 () Bool)

(declare-fun e!85544 () Bool)

(declare-fun e!85547 () Bool)

(assert (=> b!131168 (= e!85544 e!85547)))

(declare-fun res!63155 () Bool)

(declare-fun call!14322 () Bool)

(assert (=> b!131168 (= res!63155 call!14322)))

(assert (=> b!131168 (=> (not res!63155) (not e!85547))))

(declare-fun b!131169 () Bool)

(assert (=> b!131169 (= e!85542 (not call!14327))))

(declare-fun bm!14319 () Bool)

(assert (=> bm!14319 (= call!14325 call!14321)))

(declare-fun d!39961 () Bool)

(assert (=> d!39961 e!85537))

(declare-fun res!63154 () Bool)

(assert (=> d!39961 (=> (not res!63154) (not e!85537))))

(assert (=> d!39961 (= res!63154 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun lt!68169 () ListLongMap!1665)

(assert (=> d!39961 (= lt!68165 lt!68169)))

(declare-fun lt!68172 () Unit!4094)

(declare-fun e!85536 () Unit!4094)

(assert (=> d!39961 (= lt!68172 e!85536)))

(declare-fun c!24248 () Bool)

(declare-fun e!85545 () Bool)

(assert (=> d!39961 (= c!24248 e!85545)))

(declare-fun res!63159 () Bool)

(assert (=> d!39961 (=> (not res!63159) (not e!85545))))

(assert (=> d!39961 (= res!63159 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> d!39961 (= lt!68169 e!85548)))

(declare-fun c!24244 () Bool)

(assert (=> d!39961 (= c!24244 (and (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39961 (validMask!0 (mask!7129 (v!3169 (underlying!445 thiss!992))))))

(assert (=> d!39961 (= (getCurrentListMap!516 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))) lt!68165)))

(declare-fun b!131159 () Bool)

(assert (=> b!131159 (= e!85544 (not call!14322))))

(declare-fun bm!14320 () Bool)

(declare-fun call!14326 () ListLongMap!1665)

(declare-fun call!14324 () ListLongMap!1665)

(assert (=> bm!14320 (= call!14326 call!14324)))

(declare-fun b!131170 () Bool)

(assert (=> b!131170 (= e!85541 (= (apply!114 lt!68165 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131170 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2505 (_values!2825 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> b!131170 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun bm!14321 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!126 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) ListLongMap!1665)

(assert (=> bm!14321 (= call!14324 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun bm!14322 () Bool)

(assert (=> bm!14322 (= call!14323 call!14326)))

(declare-fun b!131171 () Bool)

(assert (=> b!131171 (= e!85539 call!14325)))

(declare-fun b!131172 () Bool)

(assert (=> b!131172 (= e!85545 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131173 () Bool)

(declare-fun Unit!4099 () Unit!4094)

(assert (=> b!131173 (= e!85536 Unit!4099)))

(declare-fun b!131174 () Bool)

(declare-fun lt!68161 () Unit!4094)

(assert (=> b!131174 (= e!85536 lt!68161)))

(declare-fun lt!68166 () ListLongMap!1665)

(assert (=> b!131174 (= lt!68166 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun lt!68160 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68164 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68164 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68163 () Unit!4094)

(declare-fun addStillContains!90 (ListLongMap!1665 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4094)

(assert (=> b!131174 (= lt!68163 (addStillContains!90 lt!68166 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68164))))

(assert (=> b!131174 (contains!880 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68164)))

(declare-fun lt!68181 () Unit!4094)

(assert (=> b!131174 (= lt!68181 lt!68163)))

(declare-fun lt!68175 () ListLongMap!1665)

(assert (=> b!131174 (= lt!68175 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun lt!68178 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68178 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68170 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68170 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68177 () Unit!4094)

(declare-fun addApplyDifferent!90 (ListLongMap!1665 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4094)

(assert (=> b!131174 (= lt!68177 (addApplyDifferent!90 lt!68175 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68170))))

(assert (=> b!131174 (= (apply!114 (+!161 lt!68175 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68170) (apply!114 lt!68175 lt!68170))))

(declare-fun lt!68173 () Unit!4094)

(assert (=> b!131174 (= lt!68173 lt!68177)))

(declare-fun lt!68168 () ListLongMap!1665)

(assert (=> b!131174 (= lt!68168 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun lt!68174 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68179 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68179 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68176 () Unit!4094)

(assert (=> b!131174 (= lt!68176 (addApplyDifferent!90 lt!68168 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68179))))

(assert (=> b!131174 (= (apply!114 (+!161 lt!68168 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68179) (apply!114 lt!68168 lt!68179))))

(declare-fun lt!68167 () Unit!4094)

(assert (=> b!131174 (= lt!68167 lt!68176)))

(declare-fun lt!68180 () ListLongMap!1665)

(assert (=> b!131174 (= lt!68180 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun lt!68171 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68162 () (_ BitVec 64))

(assert (=> b!131174 (= lt!68162 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131174 (= lt!68161 (addApplyDifferent!90 lt!68180 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68162))))

(assert (=> b!131174 (= (apply!114 (+!161 lt!68180 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68162) (apply!114 lt!68180 lt!68162))))

(declare-fun b!131175 () Bool)

(assert (=> b!131175 (= e!85547 (= (apply!114 lt!68165 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun bm!14323 () Bool)

(assert (=> bm!14323 (= call!14322 (contains!880 lt!68165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14324 () Bool)

(assert (=> bm!14324 (= call!14321 (+!161 (ite c!24244 call!14324 (ite c!24245 call!14326 call!14323)) (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun b!131176 () Bool)

(assert (=> b!131176 (= e!85537 e!85544)))

(declare-fun c!24246 () Bool)

(assert (=> b!131176 (= c!24246 (not (= (bvand (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39961 c!24244) b!131156))

(assert (= (and d!39961 (not c!24244)) b!131162))

(assert (= (and b!131162 c!24245) b!131158))

(assert (= (and b!131162 (not c!24245)) b!131163))

(assert (= (and b!131163 c!24247) b!131171))

(assert (= (and b!131163 (not c!24247)) b!131167))

(assert (= (or b!131171 b!131167) bm!14322))

(assert (= (or b!131158 bm!14322) bm!14320))

(assert (= (or b!131158 b!131171) bm!14319))

(assert (= (or b!131156 bm!14320) bm!14321))

(assert (= (or b!131156 bm!14319) bm!14324))

(assert (= (and d!39961 res!63159) b!131172))

(assert (= (and d!39961 c!24248) b!131174))

(assert (= (and d!39961 (not c!24248)) b!131173))

(assert (= (and d!39961 res!63154) b!131166))

(assert (= (and b!131166 res!63157) b!131165))

(assert (= (and b!131166 (not res!63152)) b!131164))

(assert (= (and b!131164 res!63153) b!131170))

(assert (= (and b!131166 res!63160) b!131160))

(assert (= (and b!131160 c!24249) b!131157))

(assert (= (and b!131160 (not c!24249)) b!131169))

(assert (= (and b!131157 res!63156) b!131161))

(assert (= (or b!131157 b!131169) bm!14318))

(assert (= (and b!131160 res!63158) b!131176))

(assert (= (and b!131176 c!24246) b!131168))

(assert (= (and b!131176 (not c!24246)) b!131159))

(assert (= (and b!131168 res!63155) b!131175))

(assert (= (or b!131168 b!131159) bm!14323))

(declare-fun b_lambda!5829 () Bool)

(assert (=> (not b_lambda!5829) (not b!131170)))

(assert (=> b!131170 t!6111))

(declare-fun b_and!8109 () Bool)

(assert (= b_and!8089 (and (=> t!6111 result!3925) b_and!8109)))

(assert (=> b!131170 t!6113))

(declare-fun b_and!8111 () Bool)

(assert (= b_and!8091 (and (=> t!6113 result!3929) b_and!8111)))

(declare-fun m!154335 () Bool)

(assert (=> b!131172 m!154335))

(assert (=> b!131172 m!154335))

(declare-fun m!154337 () Bool)

(assert (=> b!131172 m!154337))

(declare-fun m!154339 () Bool)

(assert (=> b!131174 m!154339))

(declare-fun m!154341 () Bool)

(assert (=> b!131174 m!154341))

(declare-fun m!154343 () Bool)

(assert (=> b!131174 m!154343))

(declare-fun m!154345 () Bool)

(assert (=> b!131174 m!154345))

(declare-fun m!154347 () Bool)

(assert (=> b!131174 m!154347))

(declare-fun m!154349 () Bool)

(assert (=> b!131174 m!154349))

(declare-fun m!154351 () Bool)

(assert (=> b!131174 m!154351))

(declare-fun m!154353 () Bool)

(assert (=> b!131174 m!154353))

(declare-fun m!154355 () Bool)

(assert (=> b!131174 m!154355))

(declare-fun m!154357 () Bool)

(assert (=> b!131174 m!154357))

(declare-fun m!154359 () Bool)

(assert (=> b!131174 m!154359))

(assert (=> b!131174 m!154345))

(declare-fun m!154361 () Bool)

(assert (=> b!131174 m!154361))

(declare-fun m!154363 () Bool)

(assert (=> b!131174 m!154363))

(assert (=> b!131174 m!154353))

(assert (=> b!131174 m!154335))

(declare-fun m!154365 () Bool)

(assert (=> b!131174 m!154365))

(declare-fun m!154367 () Bool)

(assert (=> b!131174 m!154367))

(assert (=> b!131174 m!154341))

(assert (=> b!131174 m!154349))

(declare-fun m!154369 () Bool)

(assert (=> b!131174 m!154369))

(assert (=> d!39961 m!154167))

(declare-fun m!154371 () Bool)

(assert (=> b!131161 m!154371))

(assert (=> b!131165 m!154335))

(assert (=> b!131165 m!154335))

(assert (=> b!131165 m!154337))

(declare-fun m!154373 () Bool)

(assert (=> bm!14318 m!154373))

(declare-fun m!154375 () Bool)

(assert (=> b!131170 m!154375))

(assert (=> b!131170 m!154185))

(declare-fun m!154377 () Bool)

(assert (=> b!131170 m!154377))

(assert (=> b!131170 m!154335))

(assert (=> b!131170 m!154185))

(assert (=> b!131170 m!154375))

(assert (=> b!131170 m!154335))

(declare-fun m!154379 () Bool)

(assert (=> b!131170 m!154379))

(declare-fun m!154381 () Bool)

(assert (=> bm!14323 m!154381))

(assert (=> bm!14321 m!154367))

(assert (=> b!131164 m!154335))

(assert (=> b!131164 m!154335))

(declare-fun m!154383 () Bool)

(assert (=> b!131164 m!154383))

(declare-fun m!154385 () Bool)

(assert (=> b!131156 m!154385))

(declare-fun m!154387 () Bool)

(assert (=> bm!14324 m!154387))

(declare-fun m!154389 () Bool)

(assert (=> b!131175 m!154389))

(assert (=> b!130845 d!39961))

(declare-fun d!39963 () Bool)

(assert (=> d!39963 (= (validMask!0 (mask!7129 (v!3169 (underlying!445 thiss!992)))) (and (or (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000001111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000011111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000001111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000011111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000001111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000011111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000001111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000011111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000000111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000001111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000011111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000000111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000001111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000011111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000000111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000001111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000011111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000000111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000001111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000011111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00000111111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00001111111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00011111111111111111111111111111) (= (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7129 (v!3169 (underlying!445 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!130849 d!39963))

(declare-fun d!39965 () Bool)

(assert (=> d!39965 (= (valid!524 thiss!992) (valid!523 (v!3169 (underlying!445 thiss!992))))))

(declare-fun bs!5433 () Bool)

(assert (= bs!5433 d!39965))

(declare-fun m!154391 () Bool)

(assert (=> bs!5433 m!154391))

(assert (=> start!14100 d!39965))

(declare-fun d!39967 () Bool)

(assert (=> d!39967 (= (array_inv!1421 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvsge (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130843 d!39967))

(declare-fun d!39969 () Bool)

(assert (=> d!39969 (= (array_inv!1422 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvsge (size!2505 (_values!2825 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130843 d!39969))

(declare-fun d!39971 () Bool)

(assert (=> d!39971 (= (array_inv!1421 (_keys!4586 newMap!16)) (bvsge (size!2504 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130856 d!39971))

(declare-fun d!39973 () Bool)

(assert (=> d!39973 (= (array_inv!1422 (_values!2825 newMap!16)) (bvsge (size!2505 (_values!2825 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130856 d!39973))

(declare-fun b!131185 () Bool)

(declare-fun e!85557 () Bool)

(declare-fun call!14330 () Bool)

(assert (=> b!131185 (= e!85557 call!14330)))

(declare-fun b!131186 () Bool)

(declare-fun e!85556 () Bool)

(assert (=> b!131186 (= e!85556 call!14330)))

(declare-fun bm!14327 () Bool)

(assert (=> bm!14327 (= call!14330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131187 () Bool)

(assert (=> b!131187 (= e!85556 e!85557)))

(declare-fun lt!68190 () (_ BitVec 64))

(assert (=> b!131187 (= lt!68190 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68188 () Unit!4094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4729 (_ BitVec 64) (_ BitVec 32)) Unit!4094)

(assert (=> b!131187 (= lt!68188 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000))))

(assert (=> b!131187 (arrayContainsKey!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000)))

(declare-fun lt!68189 () Unit!4094)

(assert (=> b!131187 (= lt!68189 lt!68188)))

(declare-fun res!63165 () Bool)

(assert (=> b!131187 (= res!63165 (= (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!131187 (=> (not res!63165) (not e!85557))))

(declare-fun b!131188 () Bool)

(declare-fun e!85555 () Bool)

(assert (=> b!131188 (= e!85555 e!85556)))

(declare-fun c!24252 () Bool)

(assert (=> b!131188 (= c!24252 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39975 () Bool)

(declare-fun res!63166 () Bool)

(assert (=> d!39975 (=> res!63166 e!85555)))

(assert (=> d!39975 (= res!63166 (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> d!39975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))) e!85555)))

(assert (= (and d!39975 (not res!63166)) b!131188))

(assert (= (and b!131188 c!24252) b!131187))

(assert (= (and b!131188 (not c!24252)) b!131186))

(assert (= (and b!131187 res!63165) b!131185))

(assert (= (or b!131185 b!131186) bm!14327))

(declare-fun m!154393 () Bool)

(assert (=> bm!14327 m!154393))

(declare-fun m!154395 () Bool)

(assert (=> b!131187 m!154395))

(declare-fun m!154397 () Bool)

(assert (=> b!131187 m!154397))

(declare-fun m!154399 () Bool)

(assert (=> b!131187 m!154399))

(assert (=> b!131187 m!154395))

(declare-fun m!154401 () Bool)

(assert (=> b!131187 m!154401))

(assert (=> b!131188 m!154395))

(assert (=> b!131188 m!154395))

(declare-fun m!154403 () Bool)

(assert (=> b!131188 m!154403))

(assert (=> b!130850 d!39975))

(declare-fun d!39977 () Bool)

(declare-fun res!63173 () Bool)

(declare-fun e!85560 () Bool)

(assert (=> d!39977 (=> (not res!63173) (not e!85560))))

(declare-fun simpleValid!90 (LongMapFixedSize!1084) Bool)

(assert (=> d!39977 (= res!63173 (simpleValid!90 newMap!16))))

(assert (=> d!39977 (= (valid!523 newMap!16) e!85560)))

(declare-fun b!131195 () Bool)

(declare-fun res!63174 () Bool)

(assert (=> b!131195 (=> (not res!63174) (not e!85560))))

(declare-fun arrayCountValidKeys!0 (array!4729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!131195 (= res!63174 (= (arrayCountValidKeys!0 (_keys!4586 newMap!16) #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (_size!591 newMap!16)))))

(declare-fun b!131196 () Bool)

(declare-fun res!63175 () Bool)

(assert (=> b!131196 (=> (not res!63175) (not e!85560))))

(assert (=> b!131196 (= res!63175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun b!131197 () Bool)

(declare-datatypes ((List!1705 0))(
  ( (Nil!1702) (Cons!1701 (h!2306 (_ BitVec 64)) (t!6123 List!1705)) )
))
(declare-fun arrayNoDuplicates!0 (array!4729 (_ BitVec 32) List!1705) Bool)

(assert (=> b!131197 (= e!85560 (arrayNoDuplicates!0 (_keys!4586 newMap!16) #b00000000000000000000000000000000 Nil!1702))))

(assert (= (and d!39977 res!63173) b!131195))

(assert (= (and b!131195 res!63174) b!131196))

(assert (= (and b!131196 res!63175) b!131197))

(declare-fun m!154405 () Bool)

(assert (=> d!39977 m!154405))

(declare-fun m!154407 () Bool)

(assert (=> b!131195 m!154407))

(declare-fun m!154409 () Bool)

(assert (=> b!131196 m!154409))

(declare-fun m!154411 () Bool)

(assert (=> b!131197 m!154411))

(assert (=> b!130842 d!39977))

(declare-fun mapNonEmpty!4605 () Bool)

(declare-fun mapRes!4605 () Bool)

(declare-fun tp!11139 () Bool)

(declare-fun e!85566 () Bool)

(assert (=> mapNonEmpty!4605 (= mapRes!4605 (and tp!11139 e!85566))))

(declare-fun mapRest!4605 () (Array (_ BitVec 32) ValueCell!1088))

(declare-fun mapValue!4605 () ValueCell!1088)

(declare-fun mapKey!4605 () (_ BitVec 32))

(assert (=> mapNonEmpty!4605 (= mapRest!4590 (store mapRest!4605 mapKey!4605 mapValue!4605))))

(declare-fun condMapEmpty!4605 () Bool)

(declare-fun mapDefault!4605 () ValueCell!1088)

(assert (=> mapNonEmpty!4590 (= condMapEmpty!4605 (= mapRest!4590 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4605)))))

(declare-fun e!85565 () Bool)

(assert (=> mapNonEmpty!4590 (= tp!11112 (and e!85565 mapRes!4605))))

(declare-fun mapIsEmpty!4605 () Bool)

(assert (=> mapIsEmpty!4605 mapRes!4605))

(declare-fun b!131205 () Bool)

(assert (=> b!131205 (= e!85565 tp_is_empty!2863)))

(declare-fun b!131204 () Bool)

(assert (=> b!131204 (= e!85566 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4590 condMapEmpty!4605) mapIsEmpty!4605))

(assert (= (and mapNonEmpty!4590 (not condMapEmpty!4605)) mapNonEmpty!4605))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1088) mapValue!4605)) b!131204))

(assert (= (and mapNonEmpty!4590 ((_ is ValueCellFull!1088) mapDefault!4605)) b!131205))

(declare-fun m!154413 () Bool)

(assert (=> mapNonEmpty!4605 m!154413))

(declare-fun mapNonEmpty!4606 () Bool)

(declare-fun mapRes!4606 () Bool)

(declare-fun tp!11140 () Bool)

(declare-fun e!85568 () Bool)

(assert (=> mapNonEmpty!4606 (= mapRes!4606 (and tp!11140 e!85568))))

(declare-fun mapRest!4606 () (Array (_ BitVec 32) ValueCell!1088))

(declare-fun mapValue!4606 () ValueCell!1088)

(declare-fun mapKey!4606 () (_ BitVec 32))

(assert (=> mapNonEmpty!4606 (= mapRest!4589 (store mapRest!4606 mapKey!4606 mapValue!4606))))

(declare-fun condMapEmpty!4606 () Bool)

(declare-fun mapDefault!4606 () ValueCell!1088)

(assert (=> mapNonEmpty!4589 (= condMapEmpty!4606 (= mapRest!4589 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4606)))))

(declare-fun e!85567 () Bool)

(assert (=> mapNonEmpty!4589 (= tp!11111 (and e!85567 mapRes!4606))))

(declare-fun mapIsEmpty!4606 () Bool)

(assert (=> mapIsEmpty!4606 mapRes!4606))

(declare-fun b!131207 () Bool)

(assert (=> b!131207 (= e!85567 tp_is_empty!2863)))

(declare-fun b!131206 () Bool)

(assert (=> b!131206 (= e!85568 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4589 condMapEmpty!4606) mapIsEmpty!4606))

(assert (= (and mapNonEmpty!4589 (not condMapEmpty!4606)) mapNonEmpty!4606))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1088) mapValue!4606)) b!131206))

(assert (= (and mapNonEmpty!4589 ((_ is ValueCellFull!1088) mapDefault!4606)) b!131207))

(declare-fun m!154415 () Bool)

(assert (=> mapNonEmpty!4606 m!154415))

(declare-fun b_lambda!5831 () Bool)

(assert (= b_lambda!5829 (or (and b!130843 b_free!2893) (and b!130856 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))))) b_lambda!5831)))

(check-sat (not b!131188) (not bm!14284) (not mapNonEmpty!4605) (not bm!14324) (not b!131105) (not d!39961) (not d!39953) (not b!131197) (not b!131164) (not b!131113) (not d!39955) (not bm!14287) (not b!131097) (not b_next!2893) (not bm!14323) (not b!131068) (not b!131175) (not bm!14327) (not b!131195) (not b!131165) (not bm!14285) (not mapNonEmpty!4606) (not b!131174) b_and!8111 (not bm!14294) (not b!131187) (not b!131172) (not b!131070) (not bm!14295) (not b_lambda!5827) (not b!131196) (not b!131078) (not b!130979) (not b_next!2895) (not bm!14281) b_and!8109 (not b_lambda!5831) (not d!39965) (not b!131089) tp_is_empty!2863 (not b!130981) (not bm!14318) (not bm!14321) (not b!131170) (not b!131112) (not bm!14288) (not b!131156) (not bm!14290) (not b!131077) (not b!131092) (not bm!14280) (not bm!14298) (not bm!14297) (not b!131161) (not d!39959) (not bm!14303) (not d!39977))
(check-sat b_and!8109 b_and!8111 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun b!131218 () Bool)

(declare-fun e!85579 () Bool)

(declare-fun e!85577 () Bool)

(assert (=> b!131218 (= e!85579 e!85577)))

(declare-fun res!63184 () Bool)

(assert (=> b!131218 (=> (not res!63184) (not e!85577))))

(declare-fun e!85578 () Bool)

(assert (=> b!131218 (= res!63184 (not e!85578))))

(declare-fun res!63183 () Bool)

(assert (=> b!131218 (=> (not res!63183) (not e!85578))))

(assert (=> b!131218 (= res!63183 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131219 () Bool)

(declare-fun e!85580 () Bool)

(declare-fun call!14333 () Bool)

(assert (=> b!131219 (= e!85580 call!14333)))

(declare-fun b!131220 () Bool)

(assert (=> b!131220 (= e!85577 e!85580)))

(declare-fun c!24255 () Bool)

(assert (=> b!131220 (= c!24255 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131221 () Bool)

(declare-fun contains!881 (List!1705 (_ BitVec 64)) Bool)

(assert (=> b!131221 (= e!85578 (contains!881 Nil!1702 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39979 () Bool)

(declare-fun res!63182 () Bool)

(assert (=> d!39979 (=> res!63182 e!85579)))

(assert (=> d!39979 (= res!63182 (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!39979 (= (arrayNoDuplicates!0 (_keys!4586 newMap!16) #b00000000000000000000000000000000 Nil!1702) e!85579)))

(declare-fun bm!14330 () Bool)

(assert (=> bm!14330 (= call!14333 (arrayNoDuplicates!0 (_keys!4586 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24255 (Cons!1701 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000) Nil!1702) Nil!1702)))))

(declare-fun b!131222 () Bool)

(assert (=> b!131222 (= e!85580 call!14333)))

(assert (= (and d!39979 (not res!63182)) b!131218))

(assert (= (and b!131218 res!63183) b!131221))

(assert (= (and b!131218 res!63184) b!131220))

(assert (= (and b!131220 c!24255) b!131219))

(assert (= (and b!131220 (not c!24255)) b!131222))

(assert (= (or b!131219 b!131222) bm!14330))

(declare-fun m!154417 () Bool)

(assert (=> b!131218 m!154417))

(assert (=> b!131218 m!154417))

(declare-fun m!154419 () Bool)

(assert (=> b!131218 m!154419))

(assert (=> b!131220 m!154417))

(assert (=> b!131220 m!154417))

(assert (=> b!131220 m!154419))

(assert (=> b!131221 m!154417))

(assert (=> b!131221 m!154417))

(declare-fun m!154421 () Bool)

(assert (=> b!131221 m!154421))

(assert (=> bm!14330 m!154417))

(declare-fun m!154423 () Bool)

(assert (=> bm!14330 m!154423))

(assert (=> b!131197 d!39979))

(declare-fun d!39981 () Bool)

(declare-fun e!85581 () Bool)

(assert (=> d!39981 e!85581))

(declare-fun res!63185 () Bool)

(assert (=> d!39981 (=> res!63185 e!85581)))

(declare-fun lt!68192 () Bool)

(assert (=> d!39981 (= res!63185 (not lt!68192))))

(declare-fun lt!68193 () Bool)

(assert (=> d!39981 (= lt!68192 lt!68193)))

(declare-fun lt!68194 () Unit!4094)

(declare-fun e!85582 () Unit!4094)

(assert (=> d!39981 (= lt!68194 e!85582)))

(declare-fun c!24256 () Bool)

(assert (=> d!39981 (= c!24256 lt!68193)))

(assert (=> d!39981 (= lt!68193 (containsKey!172 (toList!848 call!14290) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!39981 (= (contains!880 call!14290 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) lt!68192)))

(declare-fun b!131223 () Bool)

(declare-fun lt!68191 () Unit!4094)

(assert (=> b!131223 (= e!85582 lt!68191)))

(assert (=> b!131223 (= lt!68191 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 call!14290) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!131223 (isDefined!122 (getValueByKey!168 (toList!848 call!14290) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131224 () Bool)

(declare-fun Unit!4100 () Unit!4094)

(assert (=> b!131224 (= e!85582 Unit!4100)))

(declare-fun b!131225 () Bool)

(assert (=> b!131225 (= e!85581 (isDefined!122 (getValueByKey!168 (toList!848 call!14290) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!39981 c!24256) b!131223))

(assert (= (and d!39981 (not c!24256)) b!131224))

(assert (= (and d!39981 (not res!63185)) b!131225))

(assert (=> d!39981 m!154171))

(declare-fun m!154425 () Bool)

(assert (=> d!39981 m!154425))

(assert (=> b!131223 m!154171))

(declare-fun m!154427 () Bool)

(assert (=> b!131223 m!154427))

(assert (=> b!131223 m!154171))

(declare-fun m!154429 () Bool)

(assert (=> b!131223 m!154429))

(assert (=> b!131223 m!154429))

(declare-fun m!154431 () Bool)

(assert (=> b!131223 m!154431))

(assert (=> b!131225 m!154171))

(assert (=> b!131225 m!154429))

(assert (=> b!131225 m!154429))

(assert (=> b!131225 m!154431))

(assert (=> b!131078 d!39981))

(declare-fun d!39983 () Bool)

(declare-fun e!85583 () Bool)

(assert (=> d!39983 e!85583))

(declare-fun res!63186 () Bool)

(assert (=> d!39983 (=> res!63186 e!85583)))

(declare-fun lt!68196 () Bool)

(assert (=> d!39983 (= res!63186 (not lt!68196))))

(declare-fun lt!68197 () Bool)

(assert (=> d!39983 (= lt!68196 lt!68197)))

(declare-fun lt!68198 () Unit!4094)

(declare-fun e!85584 () Unit!4094)

(assert (=> d!39983 (= lt!68198 e!85584)))

(declare-fun c!24257 () Bool)

(assert (=> d!39983 (= c!24257 lt!68197)))

(assert (=> d!39983 (= lt!68197 (containsKey!172 (toList!848 call!14304) (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114))))))

(assert (=> d!39983 (= (contains!880 call!14304 (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114))) lt!68196)))

(declare-fun b!131226 () Bool)

(declare-fun lt!68195 () Unit!4094)

(assert (=> b!131226 (= e!85584 lt!68195)))

(assert (=> b!131226 (= lt!68195 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 call!14304) (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114))))))

(assert (=> b!131226 (isDefined!122 (getValueByKey!168 (toList!848 call!14304) (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114))))))

(declare-fun b!131227 () Bool)

(declare-fun Unit!4101 () Unit!4094)

(assert (=> b!131227 (= e!85584 Unit!4101)))

(declare-fun b!131228 () Bool)

(assert (=> b!131228 (= e!85583 (isDefined!122 (getValueByKey!168 (toList!848 call!14304) (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114)))))))

(assert (= (and d!39983 c!24257) b!131226))

(assert (= (and d!39983 (not c!24257)) b!131227))

(assert (= (and d!39983 (not res!63186)) b!131228))

(assert (=> d!39983 m!154313))

(declare-fun m!154433 () Bool)

(assert (=> d!39983 m!154433))

(assert (=> b!131226 m!154313))

(declare-fun m!154435 () Bool)

(assert (=> b!131226 m!154435))

(assert (=> b!131226 m!154313))

(declare-fun m!154437 () Bool)

(assert (=> b!131226 m!154437))

(assert (=> b!131226 m!154437))

(declare-fun m!154439 () Bool)

(assert (=> b!131226 m!154439))

(assert (=> b!131228 m!154313))

(assert (=> b!131228 m!154437))

(assert (=> b!131228 m!154437))

(assert (=> b!131228 m!154439))

(assert (=> b!131105 d!39983))

(declare-fun d!39985 () Bool)

(declare-fun e!85587 () Bool)

(assert (=> d!39985 e!85587))

(declare-fun res!63189 () Bool)

(assert (=> d!39985 (=> (not res!63189) (not e!85587))))

(assert (=> d!39985 (= res!63189 (and (bvsge (index!3263 lt!68114) #b00000000000000000000000000000000) (bvslt (index!3263 lt!68114) (size!2504 (_keys!4586 newMap!16)))))))

(declare-fun lt!68201 () Unit!4094)

(declare-fun choose!806 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) Unit!4094)

(assert (=> d!39985 (= lt!68201 (choose!806 (_keys!4586 newMap!16) lt!68098 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (defaultEntry!2842 newMap!16)))))

(assert (=> d!39985 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!39985 (= (lemmaValidKeyInArrayIsInListMap!118 (_keys!4586 newMap!16) lt!68098 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (defaultEntry!2842 newMap!16)) lt!68201)))

(declare-fun b!131231 () Bool)

(assert (=> b!131231 (= e!85587 (contains!880 (getCurrentListMap!516 (_keys!4586 newMap!16) lt!68098 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68114))))))

(assert (= (and d!39985 res!63189) b!131231))

(declare-fun m!154441 () Bool)

(assert (=> d!39985 m!154441))

(declare-fun m!154443 () Bool)

(assert (=> d!39985 m!154443))

(declare-fun m!154445 () Bool)

(assert (=> b!131231 m!154445))

(assert (=> b!131231 m!154313))

(assert (=> b!131231 m!154445))

(assert (=> b!131231 m!154313))

(declare-fun m!154447 () Bool)

(assert (=> b!131231 m!154447))

(assert (=> b!131105 d!39985))

(declare-fun d!39987 () Bool)

(declare-fun e!85590 () Bool)

(assert (=> d!39987 e!85590))

(declare-fun res!63192 () Bool)

(assert (=> d!39987 (=> (not res!63192) (not e!85590))))

(assert (=> d!39987 (= res!63192 (and (bvsge (index!3263 lt!68114) #b00000000000000000000000000000000) (bvslt (index!3263 lt!68114) (size!2505 (_values!2825 newMap!16)))))))

(declare-fun lt!68204 () Unit!4094)

(declare-fun choose!807 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4094)

(assert (=> d!39987 (= lt!68204 (choose!807 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!39987 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!39987 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3263 lt!68114) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)) lt!68204)))

(declare-fun b!131234 () Bool)

(assert (=> b!131234 (= e!85590 (= (+!161 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4586 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16))))))

(assert (= (and d!39987 res!63192) b!131234))

(assert (=> d!39987 m!154171))

(assert (=> d!39987 m!154187))

(declare-fun m!154449 () Bool)

(assert (=> d!39987 m!154449))

(assert (=> d!39987 m!154443))

(assert (=> b!131234 m!154291))

(assert (=> b!131234 m!154291))

(declare-fun m!154451 () Bool)

(assert (=> b!131234 m!154451))

(assert (=> b!131234 m!154317))

(declare-fun m!154453 () Bool)

(assert (=> b!131234 m!154453))

(assert (=> b!131105 d!39987))

(declare-fun b!131235 () Bool)

(declare-fun e!85603 () ListLongMap!1665)

(declare-fun call!14334 () ListLongMap!1665)

(assert (=> b!131235 (= e!85603 (+!161 call!14334 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16))))))

(declare-fun b!131236 () Bool)

(declare-fun e!85597 () Bool)

(declare-fun e!85601 () Bool)

(assert (=> b!131236 (= e!85597 e!85601)))

(declare-fun res!63197 () Bool)

(declare-fun call!14340 () Bool)

(assert (=> b!131236 (= res!63197 call!14340)))

(assert (=> b!131236 (=> (not res!63197) (not e!85601))))

(declare-fun b!131237 () Bool)

(declare-fun e!85595 () ListLongMap!1665)

(declare-fun call!14338 () ListLongMap!1665)

(assert (=> b!131237 (= e!85595 call!14338)))

(declare-fun b!131239 () Bool)

(declare-fun res!63199 () Bool)

(declare-fun e!85592 () Bool)

(assert (=> b!131239 (=> (not res!63199) (not e!85592))))

(assert (=> b!131239 (= res!63199 e!85597)))

(declare-fun c!24263 () Bool)

(assert (=> b!131239 (= c!24263 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131240 () Bool)

(declare-fun lt!68210 () ListLongMap!1665)

(assert (=> b!131240 (= e!85601 (= (apply!114 lt!68210 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 newMap!16)))))

(declare-fun b!131241 () Bool)

(assert (=> b!131241 (= e!85603 e!85595)))

(declare-fun c!24259 () Bool)

(assert (=> b!131241 (= c!24259 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131242 () Bool)

(declare-fun c!24261 () Bool)

(assert (=> b!131242 (= c!24261 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85594 () ListLongMap!1665)

(assert (=> b!131242 (= e!85595 e!85594)))

(declare-fun b!131243 () Bool)

(declare-fun e!85593 () Bool)

(declare-fun e!85596 () Bool)

(assert (=> b!131243 (= e!85593 e!85596)))

(declare-fun res!63194 () Bool)

(assert (=> b!131243 (=> (not res!63194) (not e!85596))))

(assert (=> b!131243 (= res!63194 (contains!880 lt!68210 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14331 () Bool)

(assert (=> bm!14331 (= call!14340 (contains!880 lt!68210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131244 () Bool)

(declare-fun e!85598 () Bool)

(assert (=> b!131244 (= e!85598 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131245 () Bool)

(declare-fun res!63201 () Bool)

(assert (=> b!131245 (=> (not res!63201) (not e!85592))))

(assert (=> b!131245 (= res!63201 e!85593)))

(declare-fun res!63193 () Bool)

(assert (=> b!131245 (=> res!63193 e!85593)))

(assert (=> b!131245 (= res!63193 (not e!85598))))

(declare-fun res!63198 () Bool)

(assert (=> b!131245 (=> (not res!63198) (not e!85598))))

(assert (=> b!131245 (= res!63198 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131246 () Bool)

(declare-fun call!14336 () ListLongMap!1665)

(assert (=> b!131246 (= e!85594 call!14336)))

(declare-fun b!131247 () Bool)

(declare-fun e!85599 () Bool)

(declare-fun e!85602 () Bool)

(assert (=> b!131247 (= e!85599 e!85602)))

(declare-fun res!63196 () Bool)

(declare-fun call!14335 () Bool)

(assert (=> b!131247 (= res!63196 call!14335)))

(assert (=> b!131247 (=> (not res!63196) (not e!85602))))

(declare-fun b!131248 () Bool)

(assert (=> b!131248 (= e!85597 (not call!14340))))

(declare-fun bm!14332 () Bool)

(assert (=> bm!14332 (= call!14338 call!14334)))

(declare-fun d!39989 () Bool)

(assert (=> d!39989 e!85592))

(declare-fun res!63195 () Bool)

(assert (=> d!39989 (=> (not res!63195) (not e!85592))))

(assert (=> d!39989 (= res!63195 (or (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))))

(declare-fun lt!68214 () ListLongMap!1665)

(assert (=> d!39989 (= lt!68210 lt!68214)))

(declare-fun lt!68217 () Unit!4094)

(declare-fun e!85591 () Unit!4094)

(assert (=> d!39989 (= lt!68217 e!85591)))

(declare-fun c!24262 () Bool)

(declare-fun e!85600 () Bool)

(assert (=> d!39989 (= c!24262 e!85600)))

(declare-fun res!63200 () Bool)

(assert (=> d!39989 (=> (not res!63200) (not e!85600))))

(assert (=> d!39989 (= res!63200 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!39989 (= lt!68214 e!85603)))

(declare-fun c!24258 () Bool)

(assert (=> d!39989 (= c!24258 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39989 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!39989 (= (getCurrentListMap!516 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68210)))

(declare-fun b!131238 () Bool)

(assert (=> b!131238 (= e!85599 (not call!14335))))

(declare-fun bm!14333 () Bool)

(declare-fun call!14339 () ListLongMap!1665)

(declare-fun call!14337 () ListLongMap!1665)

(assert (=> bm!14333 (= call!14339 call!14337)))

(declare-fun b!131249 () Bool)

(assert (=> b!131249 (= e!85596 (= (apply!114 lt!68210 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (select (arr!2237 (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2505 (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))))))))

(assert (=> b!131249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14334 () Bool)

(assert (=> bm!14334 (= call!14337 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14335 () Bool)

(assert (=> bm!14335 (= call!14336 call!14339)))

(declare-fun b!131250 () Bool)

(assert (=> b!131250 (= e!85594 call!14338)))

(declare-fun b!131251 () Bool)

(assert (=> b!131251 (= e!85600 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131252 () Bool)

(declare-fun Unit!4102 () Unit!4094)

(assert (=> b!131252 (= e!85591 Unit!4102)))

(declare-fun b!131253 () Bool)

(declare-fun lt!68206 () Unit!4094)

(assert (=> b!131253 (= e!85591 lt!68206)))

(declare-fun lt!68211 () ListLongMap!1665)

(assert (=> b!131253 (= lt!68211 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68205 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68205 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68209 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68209 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68208 () Unit!4094)

(assert (=> b!131253 (= lt!68208 (addStillContains!90 lt!68211 lt!68205 (zeroValue!2699 newMap!16) lt!68209))))

(assert (=> b!131253 (contains!880 (+!161 lt!68211 (tuple2!2575 lt!68205 (zeroValue!2699 newMap!16))) lt!68209)))

(declare-fun lt!68226 () Unit!4094)

(assert (=> b!131253 (= lt!68226 lt!68208)))

(declare-fun lt!68220 () ListLongMap!1665)

(assert (=> b!131253 (= lt!68220 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68223 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68223 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68215 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68215 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68222 () Unit!4094)

(assert (=> b!131253 (= lt!68222 (addApplyDifferent!90 lt!68220 lt!68223 (minValue!2699 newMap!16) lt!68215))))

(assert (=> b!131253 (= (apply!114 (+!161 lt!68220 (tuple2!2575 lt!68223 (minValue!2699 newMap!16))) lt!68215) (apply!114 lt!68220 lt!68215))))

(declare-fun lt!68218 () Unit!4094)

(assert (=> b!131253 (= lt!68218 lt!68222)))

(declare-fun lt!68213 () ListLongMap!1665)

(assert (=> b!131253 (= lt!68213 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68219 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68224 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68224 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68221 () Unit!4094)

(assert (=> b!131253 (= lt!68221 (addApplyDifferent!90 lt!68213 lt!68219 (zeroValue!2699 newMap!16) lt!68224))))

(assert (=> b!131253 (= (apply!114 (+!161 lt!68213 (tuple2!2575 lt!68219 (zeroValue!2699 newMap!16))) lt!68224) (apply!114 lt!68213 lt!68224))))

(declare-fun lt!68212 () Unit!4094)

(assert (=> b!131253 (= lt!68212 lt!68221)))

(declare-fun lt!68225 () ListLongMap!1665)

(assert (=> b!131253 (= lt!68225 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite (or c!24228 c!24216) (_values!2825 newMap!16) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (index!3263 lt!68114) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16)))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68216 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68207 () (_ BitVec 64))

(assert (=> b!131253 (= lt!68207 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131253 (= lt!68206 (addApplyDifferent!90 lt!68225 lt!68216 (minValue!2699 newMap!16) lt!68207))))

(assert (=> b!131253 (= (apply!114 (+!161 lt!68225 (tuple2!2575 lt!68216 (minValue!2699 newMap!16))) lt!68207) (apply!114 lt!68225 lt!68207))))

(declare-fun b!131254 () Bool)

(assert (=> b!131254 (= e!85602 (= (apply!114 lt!68210 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 newMap!16)))))

(declare-fun bm!14336 () Bool)

(assert (=> bm!14336 (= call!14335 (contains!880 lt!68210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14337 () Bool)

(assert (=> bm!14337 (= call!14334 (+!161 (ite c!24258 call!14337 (ite c!24259 call!14339 call!14336)) (ite (or c!24258 c!24259) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 newMap!16)) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16)))))))

(declare-fun b!131255 () Bool)

(assert (=> b!131255 (= e!85592 e!85599)))

(declare-fun c!24260 () Bool)

(assert (=> b!131255 (= c!24260 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!39989 c!24258) b!131235))

(assert (= (and d!39989 (not c!24258)) b!131241))

(assert (= (and b!131241 c!24259) b!131237))

(assert (= (and b!131241 (not c!24259)) b!131242))

(assert (= (and b!131242 c!24261) b!131250))

(assert (= (and b!131242 (not c!24261)) b!131246))

(assert (= (or b!131250 b!131246) bm!14335))

(assert (= (or b!131237 bm!14335) bm!14333))

(assert (= (or b!131237 b!131250) bm!14332))

(assert (= (or b!131235 bm!14333) bm!14334))

(assert (= (or b!131235 bm!14332) bm!14337))

(assert (= (and d!39989 res!63200) b!131251))

(assert (= (and d!39989 c!24262) b!131253))

(assert (= (and d!39989 (not c!24262)) b!131252))

(assert (= (and d!39989 res!63195) b!131245))

(assert (= (and b!131245 res!63198) b!131244))

(assert (= (and b!131245 (not res!63193)) b!131243))

(assert (= (and b!131243 res!63194) b!131249))

(assert (= (and b!131245 res!63201) b!131239))

(assert (= (and b!131239 c!24263) b!131236))

(assert (= (and b!131239 (not c!24263)) b!131248))

(assert (= (and b!131236 res!63197) b!131240))

(assert (= (or b!131236 b!131248) bm!14331))

(assert (= (and b!131239 res!63199) b!131255))

(assert (= (and b!131255 c!24260) b!131247))

(assert (= (and b!131255 (not c!24260)) b!131238))

(assert (= (and b!131247 res!63196) b!131254))

(assert (= (or b!131247 b!131238) bm!14336))

(declare-fun b_lambda!5833 () Bool)

(assert (=> (not b_lambda!5833) (not b!131249)))

(declare-fun tb!2385 () Bool)

(declare-fun t!6125 () Bool)

(assert (=> (and b!130843 (= (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) (defaultEntry!2842 newMap!16)) t!6125) tb!2385))

(declare-fun result!3945 () Bool)

(assert (=> tb!2385 (= result!3945 tp_is_empty!2863)))

(assert (=> b!131249 t!6125))

(declare-fun b_and!8113 () Bool)

(assert (= b_and!8109 (and (=> t!6125 result!3945) b_and!8113)))

(declare-fun t!6127 () Bool)

(declare-fun tb!2387 () Bool)

(assert (=> (and b!130856 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 newMap!16)) t!6127) tb!2387))

(declare-fun result!3947 () Bool)

(assert (= result!3947 result!3945))

(assert (=> b!131249 t!6127))

(declare-fun b_and!8115 () Bool)

(assert (= b_and!8111 (and (=> t!6127 result!3947) b_and!8115)))

(assert (=> b!131251 m!154417))

(assert (=> b!131251 m!154417))

(assert (=> b!131251 m!154419))

(declare-fun m!154455 () Bool)

(assert (=> b!131253 m!154455))

(declare-fun m!154457 () Bool)

(assert (=> b!131253 m!154457))

(declare-fun m!154459 () Bool)

(assert (=> b!131253 m!154459))

(declare-fun m!154461 () Bool)

(assert (=> b!131253 m!154461))

(declare-fun m!154463 () Bool)

(assert (=> b!131253 m!154463))

(declare-fun m!154465 () Bool)

(assert (=> b!131253 m!154465))

(declare-fun m!154467 () Bool)

(assert (=> b!131253 m!154467))

(declare-fun m!154469 () Bool)

(assert (=> b!131253 m!154469))

(declare-fun m!154471 () Bool)

(assert (=> b!131253 m!154471))

(declare-fun m!154473 () Bool)

(assert (=> b!131253 m!154473))

(declare-fun m!154475 () Bool)

(assert (=> b!131253 m!154475))

(assert (=> b!131253 m!154461))

(declare-fun m!154477 () Bool)

(assert (=> b!131253 m!154477))

(declare-fun m!154479 () Bool)

(assert (=> b!131253 m!154479))

(assert (=> b!131253 m!154469))

(assert (=> b!131253 m!154417))

(declare-fun m!154481 () Bool)

(assert (=> b!131253 m!154481))

(declare-fun m!154483 () Bool)

(assert (=> b!131253 m!154483))

(assert (=> b!131253 m!154457))

(assert (=> b!131253 m!154465))

(declare-fun m!154485 () Bool)

(assert (=> b!131253 m!154485))

(assert (=> d!39989 m!154443))

(declare-fun m!154487 () Bool)

(assert (=> b!131240 m!154487))

(assert (=> b!131244 m!154417))

(assert (=> b!131244 m!154417))

(assert (=> b!131244 m!154419))

(declare-fun m!154489 () Bool)

(assert (=> bm!14331 m!154489))

(declare-fun m!154491 () Bool)

(assert (=> b!131249 m!154491))

(declare-fun m!154493 () Bool)

(assert (=> b!131249 m!154493))

(declare-fun m!154495 () Bool)

(assert (=> b!131249 m!154495))

(assert (=> b!131249 m!154417))

(assert (=> b!131249 m!154493))

(assert (=> b!131249 m!154491))

(assert (=> b!131249 m!154417))

(declare-fun m!154497 () Bool)

(assert (=> b!131249 m!154497))

(declare-fun m!154499 () Bool)

(assert (=> bm!14336 m!154499))

(assert (=> bm!14334 m!154483))

(assert (=> b!131243 m!154417))

(assert (=> b!131243 m!154417))

(declare-fun m!154501 () Bool)

(assert (=> b!131243 m!154501))

(declare-fun m!154503 () Bool)

(assert (=> b!131235 m!154503))

(declare-fun m!154505 () Bool)

(assert (=> bm!14337 m!154505))

(declare-fun m!154507 () Bool)

(assert (=> b!131254 m!154507))

(assert (=> bm!14294 d!39989))

(declare-fun d!39991 () Bool)

(declare-fun lt!68229 () (_ BitVec 32))

(assert (=> d!39991 (and (bvsge lt!68229 #b00000000000000000000000000000000) (bvsle lt!68229 (bvsub (size!2504 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85609 () (_ BitVec 32))

(assert (=> d!39991 (= lt!68229 e!85609)))

(declare-fun c!24268 () Bool)

(assert (=> d!39991 (= c!24268 (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!39991 (and (bvsle #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2504 (_keys!4586 newMap!16)) (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!39991 (= (arrayCountValidKeys!0 (_keys!4586 newMap!16) #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) lt!68229)))

(declare-fun b!131264 () Bool)

(declare-fun e!85608 () (_ BitVec 32))

(declare-fun call!14343 () (_ BitVec 32))

(assert (=> b!131264 (= e!85608 call!14343)))

(declare-fun b!131265 () Bool)

(assert (=> b!131265 (= e!85609 e!85608)))

(declare-fun c!24269 () Bool)

(assert (=> b!131265 (= c!24269 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14340 () Bool)

(assert (=> bm!14340 (= call!14343 (arrayCountValidKeys!0 (_keys!4586 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131266 () Bool)

(assert (=> b!131266 (= e!85609 #b00000000000000000000000000000000)))

(declare-fun b!131267 () Bool)

(assert (=> b!131267 (= e!85608 (bvadd #b00000000000000000000000000000001 call!14343))))

(assert (= (and d!39991 c!24268) b!131266))

(assert (= (and d!39991 (not c!24268)) b!131265))

(assert (= (and b!131265 c!24269) b!131267))

(assert (= (and b!131265 (not c!24269)) b!131264))

(assert (= (or b!131267 b!131264) bm!14340))

(assert (=> b!131265 m!154417))

(assert (=> b!131265 m!154417))

(assert (=> b!131265 m!154419))

(declare-fun m!154509 () Bool)

(assert (=> bm!14340 m!154509))

(assert (=> b!131195 d!39991))

(declare-fun d!39993 () Bool)

(declare-fun res!63206 () Bool)

(declare-fun e!85614 () Bool)

(assert (=> d!39993 (=> res!63206 e!85614)))

(assert (=> d!39993 (= res!63206 (= (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!39993 (= (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000) e!85614)))

(declare-fun b!131272 () Bool)

(declare-fun e!85615 () Bool)

(assert (=> b!131272 (= e!85614 e!85615)))

(declare-fun res!63207 () Bool)

(assert (=> b!131272 (=> (not res!63207) (not e!85615))))

(assert (=> b!131272 (= res!63207 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131273 () Bool)

(assert (=> b!131273 (= e!85615 (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39993 (not res!63206)) b!131272))

(assert (= (and b!131272 res!63207) b!131273))

(assert (=> d!39993 m!154417))

(assert (=> b!131273 m!154171))

(declare-fun m!154511 () Bool)

(assert (=> b!131273 m!154511))

(assert (=> bm!14285 d!39993))

(declare-fun d!39995 () Bool)

(declare-fun e!85616 () Bool)

(assert (=> d!39995 e!85616))

(declare-fun res!63208 () Bool)

(assert (=> d!39995 (=> res!63208 e!85616)))

(declare-fun lt!68231 () Bool)

(assert (=> d!39995 (= res!63208 (not lt!68231))))

(declare-fun lt!68232 () Bool)

(assert (=> d!39995 (= lt!68231 lt!68232)))

(declare-fun lt!68233 () Unit!4094)

(declare-fun e!85617 () Unit!4094)

(assert (=> d!39995 (= lt!68233 e!85617)))

(declare-fun c!24270 () Bool)

(assert (=> d!39995 (= c!24270 lt!68232)))

(assert (=> d!39995 (= lt!68232 (containsKey!172 (toList!848 lt!68165) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39995 (= (contains!880 lt!68165 #b0000000000000000000000000000000000000000000000000000000000000000) lt!68231)))

(declare-fun b!131274 () Bool)

(declare-fun lt!68230 () Unit!4094)

(assert (=> b!131274 (= e!85617 lt!68230)))

(assert (=> b!131274 (= lt!68230 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 lt!68165) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131274 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131275 () Bool)

(declare-fun Unit!4103 () Unit!4094)

(assert (=> b!131275 (= e!85617 Unit!4103)))

(declare-fun b!131276 () Bool)

(assert (=> b!131276 (= e!85616 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39995 c!24270) b!131274))

(assert (= (and d!39995 (not c!24270)) b!131275))

(assert (= (and d!39995 (not res!63208)) b!131276))

(declare-fun m!154513 () Bool)

(assert (=> d!39995 m!154513))

(declare-fun m!154515 () Bool)

(assert (=> b!131274 m!154515))

(declare-fun m!154517 () Bool)

(assert (=> b!131274 m!154517))

(assert (=> b!131274 m!154517))

(declare-fun m!154519 () Bool)

(assert (=> b!131274 m!154519))

(assert (=> b!131276 m!154517))

(assert (=> b!131276 m!154517))

(assert (=> b!131276 m!154519))

(assert (=> bm!14318 d!39995))

(declare-fun d!39997 () Bool)

(declare-fun get!1469 (Option!174) V!3465)

(assert (=> d!39997 (= (apply!114 lt!68165 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1469 (getValueByKey!168 (toList!848 lt!68165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5434 () Bool)

(assert (= bs!5434 d!39997))

(assert (=> bs!5434 m!154517))

(assert (=> bs!5434 m!154517))

(declare-fun m!154521 () Bool)

(assert (=> bs!5434 m!154521))

(assert (=> b!131161 d!39997))

(declare-fun d!39999 () Bool)

(assert (=> d!39999 (= (get!1467 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3168 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!131112 d!39999))

(declare-fun d!40001 () Bool)

(declare-fun e!85620 () Bool)

(assert (=> d!40001 e!85620))

(declare-fun res!63214 () Bool)

(assert (=> d!40001 (=> (not res!63214) (not e!85620))))

(declare-fun lt!68245 () ListLongMap!1665)

(assert (=> d!40001 (= res!63214 (contains!880 lt!68245 (_1!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun lt!68242 () List!1704)

(assert (=> d!40001 (= lt!68245 (ListLongMap!1666 lt!68242))))

(declare-fun lt!68243 () Unit!4094)

(declare-fun lt!68244 () Unit!4094)

(assert (=> d!40001 (= lt!68243 lt!68244)))

(assert (=> d!40001 (= (getValueByKey!168 lt!68242 (_1!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))) (Some!173 (_2!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!86 (List!1704 (_ BitVec 64) V!3465) Unit!4094)

(assert (=> d!40001 (= lt!68244 (lemmaContainsTupThenGetReturnValue!86 lt!68242 (_1!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (_2!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun insertStrictlySorted!89 (List!1704 (_ BitVec 64) V!3465) List!1704)

(assert (=> d!40001 (= lt!68242 (insertStrictlySorted!89 (toList!848 (ite c!24244 call!14324 (ite c!24245 call!14326 call!14323))) (_1!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (_2!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(assert (=> d!40001 (= (+!161 (ite c!24244 call!14324 (ite c!24245 call!14326 call!14323)) (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68245)))

(declare-fun b!131281 () Bool)

(declare-fun res!63213 () Bool)

(assert (=> b!131281 (=> (not res!63213) (not e!85620))))

(assert (=> b!131281 (= res!63213 (= (getValueByKey!168 (toList!848 lt!68245) (_1!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))) (Some!173 (_2!1298 (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))))

(declare-fun b!131282 () Bool)

(declare-fun contains!882 (List!1704 tuple2!2574) Bool)

(assert (=> b!131282 (= e!85620 (contains!882 (toList!848 lt!68245) (ite (or c!24244 c!24245) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (= (and d!40001 res!63214) b!131281))

(assert (= (and b!131281 res!63213) b!131282))

(declare-fun m!154523 () Bool)

(assert (=> d!40001 m!154523))

(declare-fun m!154525 () Bool)

(assert (=> d!40001 m!154525))

(declare-fun m!154527 () Bool)

(assert (=> d!40001 m!154527))

(declare-fun m!154529 () Bool)

(assert (=> d!40001 m!154529))

(declare-fun m!154531 () Bool)

(assert (=> b!131281 m!154531))

(declare-fun m!154533 () Bool)

(assert (=> b!131282 m!154533))

(assert (=> bm!14324 d!40001))

(declare-fun d!40003 () Bool)

(declare-fun e!85621 () Bool)

(assert (=> d!40003 e!85621))

(declare-fun res!63216 () Bool)

(assert (=> d!40003 (=> (not res!63216) (not e!85621))))

(declare-fun lt!68249 () ListLongMap!1665)

(assert (=> d!40003 (= res!63216 (contains!880 lt!68249 (_1!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun lt!68246 () List!1704)

(assert (=> d!40003 (= lt!68249 (ListLongMap!1666 lt!68246))))

(declare-fun lt!68247 () Unit!4094)

(declare-fun lt!68248 () Unit!4094)

(assert (=> d!40003 (= lt!68247 lt!68248)))

(assert (=> d!40003 (= (getValueByKey!168 lt!68246 (_1!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40003 (= lt!68248 (lemmaContainsTupThenGetReturnValue!86 lt!68246 (_1!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40003 (= lt!68246 (insertStrictlySorted!89 (toList!848 lt!68168) (_1!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40003 (= (+!161 lt!68168 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68249)))

(declare-fun b!131283 () Bool)

(declare-fun res!63215 () Bool)

(assert (=> b!131283 (=> (not res!63215) (not e!85621))))

(assert (=> b!131283 (= res!63215 (= (getValueByKey!168 (toList!848 lt!68249) (_1!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun b!131284 () Bool)

(assert (=> b!131284 (= e!85621 (contains!882 (toList!848 lt!68249) (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(assert (= (and d!40003 res!63216) b!131283))

(assert (= (and b!131283 res!63215) b!131284))

(declare-fun m!154535 () Bool)

(assert (=> d!40003 m!154535))

(declare-fun m!154537 () Bool)

(assert (=> d!40003 m!154537))

(declare-fun m!154539 () Bool)

(assert (=> d!40003 m!154539))

(declare-fun m!154541 () Bool)

(assert (=> d!40003 m!154541))

(declare-fun m!154543 () Bool)

(assert (=> b!131283 m!154543))

(declare-fun m!154545 () Bool)

(assert (=> b!131284 m!154545))

(assert (=> b!131174 d!40003))

(declare-fun d!40005 () Bool)

(assert (=> d!40005 (= (apply!114 (+!161 lt!68175 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68170) (apply!114 lt!68175 lt!68170))))

(declare-fun lt!68252 () Unit!4094)

(declare-fun choose!808 (ListLongMap!1665 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4094)

(assert (=> d!40005 (= lt!68252 (choose!808 lt!68175 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68170))))

(declare-fun e!85624 () Bool)

(assert (=> d!40005 e!85624))

(declare-fun res!63219 () Bool)

(assert (=> d!40005 (=> (not res!63219) (not e!85624))))

(assert (=> d!40005 (= res!63219 (contains!880 lt!68175 lt!68170))))

(assert (=> d!40005 (= (addApplyDifferent!90 lt!68175 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68170) lt!68252)))

(declare-fun b!131288 () Bool)

(assert (=> b!131288 (= e!85624 (not (= lt!68170 lt!68178)))))

(assert (= (and d!40005 res!63219) b!131288))

(assert (=> d!40005 m!154361))

(assert (=> d!40005 m!154345))

(assert (=> d!40005 m!154347))

(declare-fun m!154547 () Bool)

(assert (=> d!40005 m!154547))

(declare-fun m!154549 () Bool)

(assert (=> d!40005 m!154549))

(assert (=> d!40005 m!154345))

(assert (=> b!131174 d!40005))

(declare-fun d!40007 () Bool)

(assert (=> d!40007 (= (apply!114 (+!161 lt!68175 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68170) (get!1469 (getValueByKey!168 (toList!848 (+!161 lt!68175 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68170)))))

(declare-fun bs!5435 () Bool)

(assert (= bs!5435 d!40007))

(declare-fun m!154551 () Bool)

(assert (=> bs!5435 m!154551))

(assert (=> bs!5435 m!154551))

(declare-fun m!154553 () Bool)

(assert (=> bs!5435 m!154553))

(assert (=> b!131174 d!40007))

(declare-fun d!40009 () Bool)

(assert (=> d!40009 (= (apply!114 (+!161 lt!68180 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68162) (get!1469 (getValueByKey!168 (toList!848 (+!161 lt!68180 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68162)))))

(declare-fun bs!5436 () Bool)

(assert (= bs!5436 d!40009))

(declare-fun m!154555 () Bool)

(assert (=> bs!5436 m!154555))

(assert (=> bs!5436 m!154555))

(declare-fun m!154557 () Bool)

(assert (=> bs!5436 m!154557))

(assert (=> b!131174 d!40009))

(declare-fun d!40011 () Bool)

(declare-fun e!85625 () Bool)

(assert (=> d!40011 e!85625))

(declare-fun res!63221 () Bool)

(assert (=> d!40011 (=> (not res!63221) (not e!85625))))

(declare-fun lt!68256 () ListLongMap!1665)

(assert (=> d!40011 (= res!63221 (contains!880 lt!68256 (_1!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun lt!68253 () List!1704)

(assert (=> d!40011 (= lt!68256 (ListLongMap!1666 lt!68253))))

(declare-fun lt!68254 () Unit!4094)

(declare-fun lt!68255 () Unit!4094)

(assert (=> d!40011 (= lt!68254 lt!68255)))

(assert (=> d!40011 (= (getValueByKey!168 lt!68253 (_1!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40011 (= lt!68255 (lemmaContainsTupThenGetReturnValue!86 lt!68253 (_1!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40011 (= lt!68253 (insertStrictlySorted!89 (toList!848 lt!68166) (_1!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40011 (= (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68256)))

(declare-fun b!131289 () Bool)

(declare-fun res!63220 () Bool)

(assert (=> b!131289 (=> (not res!63220) (not e!85625))))

(assert (=> b!131289 (= res!63220 (= (getValueByKey!168 (toList!848 lt!68256) (_1!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun b!131290 () Bool)

(assert (=> b!131290 (= e!85625 (contains!882 (toList!848 lt!68256) (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(assert (= (and d!40011 res!63221) b!131289))

(assert (= (and b!131289 res!63220) b!131290))

(declare-fun m!154559 () Bool)

(assert (=> d!40011 m!154559))

(declare-fun m!154561 () Bool)

(assert (=> d!40011 m!154561))

(declare-fun m!154563 () Bool)

(assert (=> d!40011 m!154563))

(declare-fun m!154565 () Bool)

(assert (=> d!40011 m!154565))

(declare-fun m!154567 () Bool)

(assert (=> b!131289 m!154567))

(declare-fun m!154569 () Bool)

(assert (=> b!131290 m!154569))

(assert (=> b!131174 d!40011))

(declare-fun d!40013 () Bool)

(assert (=> d!40013 (= (apply!114 lt!68168 lt!68179) (get!1469 (getValueByKey!168 (toList!848 lt!68168) lt!68179)))))

(declare-fun bs!5437 () Bool)

(assert (= bs!5437 d!40013))

(declare-fun m!154571 () Bool)

(assert (=> bs!5437 m!154571))

(assert (=> bs!5437 m!154571))

(declare-fun m!154573 () Bool)

(assert (=> bs!5437 m!154573))

(assert (=> b!131174 d!40013))

(declare-fun d!40015 () Bool)

(assert (=> d!40015 (contains!880 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68164)))

(declare-fun lt!68259 () Unit!4094)

(declare-fun choose!809 (ListLongMap!1665 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4094)

(assert (=> d!40015 (= lt!68259 (choose!809 lt!68166 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68164))))

(assert (=> d!40015 (contains!880 lt!68166 lt!68164)))

(assert (=> d!40015 (= (addStillContains!90 lt!68166 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68164) lt!68259)))

(declare-fun bs!5438 () Bool)

(assert (= bs!5438 d!40015))

(assert (=> bs!5438 m!154349))

(assert (=> bs!5438 m!154349))

(assert (=> bs!5438 m!154369))

(declare-fun m!154575 () Bool)

(assert (=> bs!5438 m!154575))

(declare-fun m!154577 () Bool)

(assert (=> bs!5438 m!154577))

(assert (=> b!131174 d!40015))

(declare-fun d!40017 () Bool)

(assert (=> d!40017 (= (apply!114 (+!161 lt!68168 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68179) (apply!114 lt!68168 lt!68179))))

(declare-fun lt!68260 () Unit!4094)

(assert (=> d!40017 (= lt!68260 (choose!808 lt!68168 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68179))))

(declare-fun e!85626 () Bool)

(assert (=> d!40017 e!85626))

(declare-fun res!63222 () Bool)

(assert (=> d!40017 (=> (not res!63222) (not e!85626))))

(assert (=> d!40017 (= res!63222 (contains!880 lt!68168 lt!68179))))

(assert (=> d!40017 (= (addApplyDifferent!90 lt!68168 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68179) lt!68260)))

(declare-fun b!131292 () Bool)

(assert (=> b!131292 (= e!85626 (not (= lt!68179 lt!68174)))))

(assert (= (and d!40017 res!63222) b!131292))

(assert (=> d!40017 m!154351))

(assert (=> d!40017 m!154341))

(assert (=> d!40017 m!154343))

(declare-fun m!154579 () Bool)

(assert (=> d!40017 m!154579))

(declare-fun m!154581 () Bool)

(assert (=> d!40017 m!154581))

(assert (=> d!40017 m!154341))

(assert (=> b!131174 d!40017))

(declare-fun d!40019 () Bool)

(assert (=> d!40019 (= (apply!114 (+!161 lt!68168 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68179) (get!1469 (getValueByKey!168 (toList!848 (+!161 lt!68168 (tuple2!2575 lt!68174 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68179)))))

(declare-fun bs!5439 () Bool)

(assert (= bs!5439 d!40019))

(declare-fun m!154583 () Bool)

(assert (=> bs!5439 m!154583))

(assert (=> bs!5439 m!154583))

(declare-fun m!154585 () Bool)

(assert (=> bs!5439 m!154585))

(assert (=> b!131174 d!40019))

(declare-fun d!40021 () Bool)

(assert (=> d!40021 (= (apply!114 lt!68175 lt!68170) (get!1469 (getValueByKey!168 (toList!848 lt!68175) lt!68170)))))

(declare-fun bs!5440 () Bool)

(assert (= bs!5440 d!40021))

(declare-fun m!154587 () Bool)

(assert (=> bs!5440 m!154587))

(assert (=> bs!5440 m!154587))

(declare-fun m!154589 () Bool)

(assert (=> bs!5440 m!154589))

(assert (=> b!131174 d!40021))

(declare-fun d!40023 () Bool)

(declare-fun e!85627 () Bool)

(assert (=> d!40023 e!85627))

(declare-fun res!63224 () Bool)

(assert (=> d!40023 (=> (not res!63224) (not e!85627))))

(declare-fun lt!68264 () ListLongMap!1665)

(assert (=> d!40023 (= res!63224 (contains!880 lt!68264 (_1!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun lt!68261 () List!1704)

(assert (=> d!40023 (= lt!68264 (ListLongMap!1666 lt!68261))))

(declare-fun lt!68262 () Unit!4094)

(declare-fun lt!68263 () Unit!4094)

(assert (=> d!40023 (= lt!68262 lt!68263)))

(assert (=> d!40023 (= (getValueByKey!168 lt!68261 (_1!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40023 (= lt!68263 (lemmaContainsTupThenGetReturnValue!86 lt!68261 (_1!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40023 (= lt!68261 (insertStrictlySorted!89 (toList!848 lt!68180) (_1!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40023 (= (+!161 lt!68180 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68264)))

(declare-fun b!131293 () Bool)

(declare-fun res!63223 () Bool)

(assert (=> b!131293 (=> (not res!63223) (not e!85627))))

(assert (=> b!131293 (= res!63223 (= (getValueByKey!168 (toList!848 lt!68264) (_1!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun b!131294 () Bool)

(assert (=> b!131294 (= e!85627 (contains!882 (toList!848 lt!68264) (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(assert (= (and d!40023 res!63224) b!131293))

(assert (= (and b!131293 res!63223) b!131294))

(declare-fun m!154591 () Bool)

(assert (=> d!40023 m!154591))

(declare-fun m!154593 () Bool)

(assert (=> d!40023 m!154593))

(declare-fun m!154595 () Bool)

(assert (=> d!40023 m!154595))

(declare-fun m!154597 () Bool)

(assert (=> d!40023 m!154597))

(declare-fun m!154599 () Bool)

(assert (=> b!131293 m!154599))

(declare-fun m!154601 () Bool)

(assert (=> b!131294 m!154601))

(assert (=> b!131174 d!40023))

(declare-fun d!40025 () Bool)

(declare-fun e!85628 () Bool)

(assert (=> d!40025 e!85628))

(declare-fun res!63225 () Bool)

(assert (=> d!40025 (=> res!63225 e!85628)))

(declare-fun lt!68266 () Bool)

(assert (=> d!40025 (= res!63225 (not lt!68266))))

(declare-fun lt!68267 () Bool)

(assert (=> d!40025 (= lt!68266 lt!68267)))

(declare-fun lt!68268 () Unit!4094)

(declare-fun e!85629 () Unit!4094)

(assert (=> d!40025 (= lt!68268 e!85629)))

(declare-fun c!24271 () Bool)

(assert (=> d!40025 (= c!24271 lt!68267)))

(assert (=> d!40025 (= lt!68267 (containsKey!172 (toList!848 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68164))))

(assert (=> d!40025 (= (contains!880 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68164) lt!68266)))

(declare-fun b!131295 () Bool)

(declare-fun lt!68265 () Unit!4094)

(assert (=> b!131295 (= e!85629 lt!68265)))

(assert (=> b!131295 (= lt!68265 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68164))))

(assert (=> b!131295 (isDefined!122 (getValueByKey!168 (toList!848 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68164))))

(declare-fun b!131296 () Bool)

(declare-fun Unit!4104 () Unit!4094)

(assert (=> b!131296 (= e!85629 Unit!4104)))

(declare-fun b!131297 () Bool)

(assert (=> b!131297 (= e!85628 (isDefined!122 (getValueByKey!168 (toList!848 (+!161 lt!68166 (tuple2!2575 lt!68160 (zeroValue!2699 (v!3169 (underlying!445 thiss!992)))))) lt!68164)))))

(assert (= (and d!40025 c!24271) b!131295))

(assert (= (and d!40025 (not c!24271)) b!131296))

(assert (= (and d!40025 (not res!63225)) b!131297))

(declare-fun m!154603 () Bool)

(assert (=> d!40025 m!154603))

(declare-fun m!154605 () Bool)

(assert (=> b!131295 m!154605))

(declare-fun m!154607 () Bool)

(assert (=> b!131295 m!154607))

(assert (=> b!131295 m!154607))

(declare-fun m!154609 () Bool)

(assert (=> b!131295 m!154609))

(assert (=> b!131297 m!154607))

(assert (=> b!131297 m!154607))

(assert (=> b!131297 m!154609))

(assert (=> b!131174 d!40025))

(declare-fun b!131322 () Bool)

(declare-fun e!85650 () Bool)

(declare-fun e!85646 () Bool)

(assert (=> b!131322 (= e!85650 e!85646)))

(declare-fun c!24283 () Bool)

(declare-fun e!85644 () Bool)

(assert (=> b!131322 (= c!24283 e!85644)))

(declare-fun res!63236 () Bool)

(assert (=> b!131322 (=> (not res!63236) (not e!85644))))

(assert (=> b!131322 (= res!63236 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131323 () Bool)

(declare-fun e!85648 () Bool)

(declare-fun lt!68286 () ListLongMap!1665)

(declare-fun isEmpty!409 (ListLongMap!1665) Bool)

(assert (=> b!131323 (= e!85648 (isEmpty!409 lt!68286))))

(declare-fun b!131324 () Bool)

(declare-fun res!63235 () Bool)

(assert (=> b!131324 (=> (not res!63235) (not e!85650))))

(assert (=> b!131324 (= res!63235 (not (contains!880 lt!68286 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131325 () Bool)

(assert (=> b!131325 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> b!131325 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2505 (_values!2825 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun e!85649 () Bool)

(assert (=> b!131325 (= e!85649 (= (apply!114 lt!68286 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!131326 () Bool)

(declare-fun e!85645 () ListLongMap!1665)

(assert (=> b!131326 (= e!85645 (ListLongMap!1666 Nil!1701))))

(declare-fun b!131327 () Bool)

(declare-fun lt!68287 () Unit!4094)

(declare-fun lt!68288 () Unit!4094)

(assert (=> b!131327 (= lt!68287 lt!68288)))

(declare-fun lt!68285 () (_ BitVec 64))

(declare-fun lt!68289 () V!3465)

(declare-fun lt!68284 () (_ BitVec 64))

(declare-fun lt!68283 () ListLongMap!1665)

(assert (=> b!131327 (not (contains!880 (+!161 lt!68283 (tuple2!2575 lt!68284 lt!68289)) lt!68285))))

(declare-fun addStillNotContains!60 (ListLongMap!1665 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4094)

(assert (=> b!131327 (= lt!68288 (addStillNotContains!60 lt!68283 lt!68284 lt!68289 lt!68285))))

(assert (=> b!131327 (= lt!68285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!131327 (= lt!68289 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131327 (= lt!68284 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!14346 () ListLongMap!1665)

(assert (=> b!131327 (= lt!68283 call!14346)))

(declare-fun e!85647 () ListLongMap!1665)

(assert (=> b!131327 (= e!85647 (+!161 call!14346 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!40027 () Bool)

(assert (=> d!40027 e!85650))

(declare-fun res!63234 () Bool)

(assert (=> d!40027 (=> (not res!63234) (not e!85650))))

(assert (=> d!40027 (= res!63234 (not (contains!880 lt!68286 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40027 (= lt!68286 e!85645)))

(declare-fun c!24282 () Bool)

(assert (=> d!40027 (= c!24282 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> d!40027 (validMask!0 (mask!7129 (v!3169 (underlying!445 thiss!992))))))

(assert (=> d!40027 (= (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))) lt!68286)))

(declare-fun bm!14343 () Bool)

(assert (=> bm!14343 (= call!14346 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131328 () Bool)

(assert (=> b!131328 (= e!85647 call!14346)))

(declare-fun b!131329 () Bool)

(assert (=> b!131329 (= e!85648 (= lt!68286 (getCurrentListMapNoExtraKeys!126 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (_values!2825 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992))) (extraKeys!2611 (v!3169 (underlying!445 thiss!992))) (zeroValue!2699 (v!3169 (underlying!445 thiss!992))) (minValue!2699 (v!3169 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131330 () Bool)

(assert (=> b!131330 (= e!85646 e!85649)))

(assert (=> b!131330 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun res!63237 () Bool)

(assert (=> b!131330 (= res!63237 (contains!880 lt!68286 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131330 (=> (not res!63237) (not e!85649))))

(declare-fun b!131331 () Bool)

(assert (=> b!131331 (= e!85644 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131331 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!131332 () Bool)

(assert (=> b!131332 (= e!85646 e!85648)))

(declare-fun c!24281 () Bool)

(assert (=> b!131332 (= c!24281 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131333 () Bool)

(assert (=> b!131333 (= e!85645 e!85647)))

(declare-fun c!24280 () Bool)

(assert (=> b!131333 (= c!24280 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!40027 c!24282) b!131326))

(assert (= (and d!40027 (not c!24282)) b!131333))

(assert (= (and b!131333 c!24280) b!131327))

(assert (= (and b!131333 (not c!24280)) b!131328))

(assert (= (or b!131327 b!131328) bm!14343))

(assert (= (and d!40027 res!63234) b!131324))

(assert (= (and b!131324 res!63235) b!131322))

(assert (= (and b!131322 res!63236) b!131331))

(assert (= (and b!131322 c!24283) b!131330))

(assert (= (and b!131322 (not c!24283)) b!131332))

(assert (= (and b!131330 res!63237) b!131325))

(assert (= (and b!131332 c!24281) b!131329))

(assert (= (and b!131332 (not c!24281)) b!131323))

(declare-fun b_lambda!5835 () Bool)

(assert (=> (not b_lambda!5835) (not b!131325)))

(assert (=> b!131325 t!6111))

(declare-fun b_and!8117 () Bool)

(assert (= b_and!8113 (and (=> t!6111 result!3925) b_and!8117)))

(assert (=> b!131325 t!6113))

(declare-fun b_and!8119 () Bool)

(assert (= b_and!8115 (and (=> t!6113 result!3929) b_and!8119)))

(declare-fun b_lambda!5837 () Bool)

(assert (=> (not b_lambda!5837) (not b!131327)))

(assert (=> b!131327 t!6111))

(declare-fun b_and!8121 () Bool)

(assert (= b_and!8117 (and (=> t!6111 result!3925) b_and!8121)))

(assert (=> b!131327 t!6113))

(declare-fun b_and!8123 () Bool)

(assert (= b_and!8119 (and (=> t!6113 result!3929) b_and!8123)))

(declare-fun m!154611 () Bool)

(assert (=> bm!14343 m!154611))

(declare-fun m!154613 () Bool)

(assert (=> b!131324 m!154613))

(declare-fun m!154615 () Bool)

(assert (=> b!131323 m!154615))

(assert (=> b!131333 m!154335))

(assert (=> b!131333 m!154335))

(assert (=> b!131333 m!154337))

(assert (=> b!131330 m!154335))

(assert (=> b!131330 m!154335))

(declare-fun m!154617 () Bool)

(assert (=> b!131330 m!154617))

(assert (=> b!131331 m!154335))

(assert (=> b!131331 m!154335))

(assert (=> b!131331 m!154337))

(assert (=> b!131329 m!154611))

(declare-fun m!154619 () Bool)

(assert (=> b!131327 m!154619))

(assert (=> b!131327 m!154619))

(declare-fun m!154621 () Bool)

(assert (=> b!131327 m!154621))

(assert (=> b!131327 m!154375))

(assert (=> b!131327 m!154335))

(declare-fun m!154623 () Bool)

(assert (=> b!131327 m!154623))

(assert (=> b!131327 m!154375))

(assert (=> b!131327 m!154185))

(assert (=> b!131327 m!154377))

(declare-fun m!154625 () Bool)

(assert (=> b!131327 m!154625))

(assert (=> b!131327 m!154185))

(declare-fun m!154627 () Bool)

(assert (=> d!40027 m!154627))

(assert (=> d!40027 m!154167))

(assert (=> b!131325 m!154185))

(assert (=> b!131325 m!154375))

(assert (=> b!131325 m!154375))

(assert (=> b!131325 m!154185))

(assert (=> b!131325 m!154377))

(assert (=> b!131325 m!154335))

(assert (=> b!131325 m!154335))

(declare-fun m!154629 () Bool)

(assert (=> b!131325 m!154629))

(assert (=> b!131174 d!40027))

(declare-fun d!40029 () Bool)

(assert (=> d!40029 (= (apply!114 (+!161 lt!68180 (tuple2!2575 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68162) (apply!114 lt!68180 lt!68162))))

(declare-fun lt!68290 () Unit!4094)

(assert (=> d!40029 (= lt!68290 (choose!808 lt!68180 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68162))))

(declare-fun e!85651 () Bool)

(assert (=> d!40029 e!85651))

(declare-fun res!63238 () Bool)

(assert (=> d!40029 (=> (not res!63238) (not e!85651))))

(assert (=> d!40029 (= res!63238 (contains!880 lt!68180 lt!68162))))

(assert (=> d!40029 (= (addApplyDifferent!90 lt!68180 lt!68171 (minValue!2699 (v!3169 (underlying!445 thiss!992))) lt!68162) lt!68290)))

(declare-fun b!131334 () Bool)

(assert (=> b!131334 (= e!85651 (not (= lt!68162 lt!68171)))))

(assert (= (and d!40029 res!63238) b!131334))

(assert (=> d!40029 m!154357))

(assert (=> d!40029 m!154353))

(assert (=> d!40029 m!154355))

(declare-fun m!154631 () Bool)

(assert (=> d!40029 m!154631))

(declare-fun m!154633 () Bool)

(assert (=> d!40029 m!154633))

(assert (=> d!40029 m!154353))

(assert (=> b!131174 d!40029))

(declare-fun d!40031 () Bool)

(assert (=> d!40031 (= (apply!114 lt!68180 lt!68162) (get!1469 (getValueByKey!168 (toList!848 lt!68180) lt!68162)))))

(declare-fun bs!5441 () Bool)

(assert (= bs!5441 d!40031))

(declare-fun m!154635 () Bool)

(assert (=> bs!5441 m!154635))

(assert (=> bs!5441 m!154635))

(declare-fun m!154637 () Bool)

(assert (=> bs!5441 m!154637))

(assert (=> b!131174 d!40031))

(declare-fun d!40033 () Bool)

(declare-fun e!85652 () Bool)

(assert (=> d!40033 e!85652))

(declare-fun res!63240 () Bool)

(assert (=> d!40033 (=> (not res!63240) (not e!85652))))

(declare-fun lt!68294 () ListLongMap!1665)

(assert (=> d!40033 (= res!63240 (contains!880 lt!68294 (_1!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun lt!68291 () List!1704)

(assert (=> d!40033 (= lt!68294 (ListLongMap!1666 lt!68291))))

(declare-fun lt!68292 () Unit!4094)

(declare-fun lt!68293 () Unit!4094)

(assert (=> d!40033 (= lt!68292 lt!68293)))

(assert (=> d!40033 (= (getValueByKey!168 lt!68291 (_1!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40033 (= lt!68293 (lemmaContainsTupThenGetReturnValue!86 lt!68291 (_1!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40033 (= lt!68291 (insertStrictlySorted!89 (toList!848 lt!68175) (_1!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40033 (= (+!161 lt!68175 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68294)))

(declare-fun b!131335 () Bool)

(declare-fun res!63239 () Bool)

(assert (=> b!131335 (=> (not res!63239) (not e!85652))))

(assert (=> b!131335 (= res!63239 (= (getValueByKey!168 (toList!848 lt!68294) (_1!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun b!131336 () Bool)

(assert (=> b!131336 (= e!85652 (contains!882 (toList!848 lt!68294) (tuple2!2575 lt!68178 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(assert (= (and d!40033 res!63240) b!131335))

(assert (= (and b!131335 res!63239) b!131336))

(declare-fun m!154639 () Bool)

(assert (=> d!40033 m!154639))

(declare-fun m!154641 () Bool)

(assert (=> d!40033 m!154641))

(declare-fun m!154643 () Bool)

(assert (=> d!40033 m!154643))

(declare-fun m!154645 () Bool)

(assert (=> d!40033 m!154645))

(declare-fun m!154647 () Bool)

(assert (=> b!131335 m!154647))

(declare-fun m!154649 () Bool)

(assert (=> b!131336 m!154649))

(assert (=> b!131174 d!40033))

(declare-fun d!40035 () Bool)

(declare-fun e!85653 () Bool)

(assert (=> d!40035 e!85653))

(declare-fun res!63241 () Bool)

(assert (=> d!40035 (=> res!63241 e!85653)))

(declare-fun lt!68296 () Bool)

(assert (=> d!40035 (= res!63241 (not lt!68296))))

(declare-fun lt!68297 () Bool)

(assert (=> d!40035 (= lt!68296 lt!68297)))

(declare-fun lt!68298 () Unit!4094)

(declare-fun e!85654 () Unit!4094)

(assert (=> d!40035 (= lt!68298 e!85654)))

(declare-fun c!24284 () Bool)

(assert (=> d!40035 (= c!24284 lt!68297)))

(assert (=> d!40035 (= lt!68297 (containsKey!172 (toList!848 e!85503) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!40035 (= (contains!880 e!85503 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) lt!68296)))

(declare-fun b!131337 () Bool)

(declare-fun lt!68295 () Unit!4094)

(assert (=> b!131337 (= e!85654 lt!68295)))

(assert (=> b!131337 (= lt!68295 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 e!85503) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!131337 (isDefined!122 (getValueByKey!168 (toList!848 e!85503) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131338 () Bool)

(declare-fun Unit!4105 () Unit!4094)

(assert (=> b!131338 (= e!85654 Unit!4105)))

(declare-fun b!131339 () Bool)

(assert (=> b!131339 (= e!85653 (isDefined!122 (getValueByKey!168 (toList!848 e!85503) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!40035 c!24284) b!131337))

(assert (= (and d!40035 (not c!24284)) b!131338))

(assert (= (and d!40035 (not res!63241)) b!131339))

(assert (=> d!40035 m!154171))

(declare-fun m!154651 () Bool)

(assert (=> d!40035 m!154651))

(assert (=> b!131337 m!154171))

(declare-fun m!154653 () Bool)

(assert (=> b!131337 m!154653))

(assert (=> b!131337 m!154171))

(declare-fun m!154655 () Bool)

(assert (=> b!131337 m!154655))

(assert (=> b!131337 m!154655))

(declare-fun m!154657 () Bool)

(assert (=> b!131337 m!154657))

(assert (=> b!131339 m!154171))

(assert (=> b!131339 m!154655))

(assert (=> b!131339 m!154655))

(assert (=> b!131339 m!154657))

(assert (=> bm!14281 d!40035))

(declare-fun b!131340 () Bool)

(declare-fun e!85667 () ListLongMap!1665)

(declare-fun call!14347 () ListLongMap!1665)

(assert (=> b!131340 (= e!85667 (+!161 call!14347 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16))))))

(declare-fun b!131341 () Bool)

(declare-fun e!85661 () Bool)

(declare-fun e!85665 () Bool)

(assert (=> b!131341 (= e!85661 e!85665)))

(declare-fun res!63246 () Bool)

(declare-fun call!14353 () Bool)

(assert (=> b!131341 (= res!63246 call!14353)))

(assert (=> b!131341 (=> (not res!63246) (not e!85665))))

(declare-fun b!131342 () Bool)

(declare-fun e!85659 () ListLongMap!1665)

(declare-fun call!14351 () ListLongMap!1665)

(assert (=> b!131342 (= e!85659 call!14351)))

(declare-fun b!131344 () Bool)

(declare-fun res!63248 () Bool)

(declare-fun e!85656 () Bool)

(assert (=> b!131344 (=> (not res!63248) (not e!85656))))

(assert (=> b!131344 (= res!63248 e!85661)))

(declare-fun c!24290 () Bool)

(assert (=> b!131344 (= c!24290 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131345 () Bool)

(declare-fun lt!68304 () ListLongMap!1665)

(assert (=> b!131345 (= e!85665 (= (apply!114 lt!68304 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 newMap!16)))))

(declare-fun b!131346 () Bool)

(assert (=> b!131346 (= e!85667 e!85659)))

(declare-fun c!24286 () Bool)

(assert (=> b!131346 (= c!24286 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131347 () Bool)

(declare-fun c!24288 () Bool)

(assert (=> b!131347 (= c!24288 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85658 () ListLongMap!1665)

(assert (=> b!131347 (= e!85659 e!85658)))

(declare-fun b!131348 () Bool)

(declare-fun e!85657 () Bool)

(declare-fun e!85660 () Bool)

(assert (=> b!131348 (= e!85657 e!85660)))

(declare-fun res!63243 () Bool)

(assert (=> b!131348 (=> (not res!63243) (not e!85660))))

(assert (=> b!131348 (= res!63243 (contains!880 lt!68304 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14344 () Bool)

(assert (=> bm!14344 (= call!14353 (contains!880 lt!68304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131349 () Bool)

(declare-fun e!85662 () Bool)

(assert (=> b!131349 (= e!85662 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131350 () Bool)

(declare-fun res!63250 () Bool)

(assert (=> b!131350 (=> (not res!63250) (not e!85656))))

(assert (=> b!131350 (= res!63250 e!85657)))

(declare-fun res!63242 () Bool)

(assert (=> b!131350 (=> res!63242 e!85657)))

(assert (=> b!131350 (= res!63242 (not e!85662))))

(declare-fun res!63247 () Bool)

(assert (=> b!131350 (=> (not res!63247) (not e!85662))))

(assert (=> b!131350 (= res!63247 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131351 () Bool)

(declare-fun call!14349 () ListLongMap!1665)

(assert (=> b!131351 (= e!85658 call!14349)))

(declare-fun b!131352 () Bool)

(declare-fun e!85663 () Bool)

(declare-fun e!85666 () Bool)

(assert (=> b!131352 (= e!85663 e!85666)))

(declare-fun res!63245 () Bool)

(declare-fun call!14348 () Bool)

(assert (=> b!131352 (= res!63245 call!14348)))

(assert (=> b!131352 (=> (not res!63245) (not e!85666))))

(declare-fun b!131353 () Bool)

(assert (=> b!131353 (= e!85661 (not call!14353))))

(declare-fun bm!14345 () Bool)

(assert (=> bm!14345 (= call!14351 call!14347)))

(declare-fun d!40037 () Bool)

(assert (=> d!40037 e!85656))

(declare-fun res!63244 () Bool)

(assert (=> d!40037 (=> (not res!63244) (not e!85656))))

(assert (=> d!40037 (= res!63244 (or (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))))

(declare-fun lt!68308 () ListLongMap!1665)

(assert (=> d!40037 (= lt!68304 lt!68308)))

(declare-fun lt!68311 () Unit!4094)

(declare-fun e!85655 () Unit!4094)

(assert (=> d!40037 (= lt!68311 e!85655)))

(declare-fun c!24289 () Bool)

(declare-fun e!85664 () Bool)

(assert (=> d!40037 (= c!24289 e!85664)))

(declare-fun res!63249 () Bool)

(assert (=> d!40037 (=> (not res!63249) (not e!85664))))

(assert (=> d!40037 (= res!63249 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!40037 (= lt!68308 e!85667)))

(declare-fun c!24285 () Bool)

(assert (=> d!40037 (= c!24285 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40037 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40037 (= (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68304)))

(declare-fun b!131343 () Bool)

(assert (=> b!131343 (= e!85663 (not call!14348))))

(declare-fun bm!14346 () Bool)

(declare-fun call!14352 () ListLongMap!1665)

(declare-fun call!14350 () ListLongMap!1665)

(assert (=> bm!14346 (= call!14352 call!14350)))

(declare-fun b!131354 () Bool)

(assert (=> b!131354 (= e!85660 (= (apply!114 lt!68304 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (select (arr!2237 (_values!2825 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131354 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2505 (_values!2825 newMap!16))))))

(assert (=> b!131354 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14347 () Bool)

(assert (=> bm!14347 (= call!14350 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14348 () Bool)

(assert (=> bm!14348 (= call!14349 call!14352)))

(declare-fun b!131355 () Bool)

(assert (=> b!131355 (= e!85658 call!14351)))

(declare-fun b!131356 () Bool)

(assert (=> b!131356 (= e!85664 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131357 () Bool)

(declare-fun Unit!4106 () Unit!4094)

(assert (=> b!131357 (= e!85655 Unit!4106)))

(declare-fun b!131358 () Bool)

(declare-fun lt!68300 () Unit!4094)

(assert (=> b!131358 (= e!85655 lt!68300)))

(declare-fun lt!68305 () ListLongMap!1665)

(assert (=> b!131358 (= lt!68305 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68299 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68303 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68303 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68302 () Unit!4094)

(assert (=> b!131358 (= lt!68302 (addStillContains!90 lt!68305 lt!68299 (zeroValue!2699 newMap!16) lt!68303))))

(assert (=> b!131358 (contains!880 (+!161 lt!68305 (tuple2!2575 lt!68299 (zeroValue!2699 newMap!16))) lt!68303)))

(declare-fun lt!68320 () Unit!4094)

(assert (=> b!131358 (= lt!68320 lt!68302)))

(declare-fun lt!68314 () ListLongMap!1665)

(assert (=> b!131358 (= lt!68314 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68317 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68317 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68309 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68309 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68316 () Unit!4094)

(assert (=> b!131358 (= lt!68316 (addApplyDifferent!90 lt!68314 lt!68317 (minValue!2699 newMap!16) lt!68309))))

(assert (=> b!131358 (= (apply!114 (+!161 lt!68314 (tuple2!2575 lt!68317 (minValue!2699 newMap!16))) lt!68309) (apply!114 lt!68314 lt!68309))))

(declare-fun lt!68312 () Unit!4094)

(assert (=> b!131358 (= lt!68312 lt!68316)))

(declare-fun lt!68307 () ListLongMap!1665)

(assert (=> b!131358 (= lt!68307 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68313 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68318 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68318 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68315 () Unit!4094)

(assert (=> b!131358 (= lt!68315 (addApplyDifferent!90 lt!68307 lt!68313 (zeroValue!2699 newMap!16) lt!68318))))

(assert (=> b!131358 (= (apply!114 (+!161 lt!68307 (tuple2!2575 lt!68313 (zeroValue!2699 newMap!16))) lt!68318) (apply!114 lt!68307 lt!68318))))

(declare-fun lt!68306 () Unit!4094)

(assert (=> b!131358 (= lt!68306 lt!68315)))

(declare-fun lt!68319 () ListLongMap!1665)

(assert (=> b!131358 (= lt!68319 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68310 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68310 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68301 () (_ BitVec 64))

(assert (=> b!131358 (= lt!68301 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131358 (= lt!68300 (addApplyDifferent!90 lt!68319 lt!68310 (minValue!2699 newMap!16) lt!68301))))

(assert (=> b!131358 (= (apply!114 (+!161 lt!68319 (tuple2!2575 lt!68310 (minValue!2699 newMap!16))) lt!68301) (apply!114 lt!68319 lt!68301))))

(declare-fun b!131359 () Bool)

(assert (=> b!131359 (= e!85666 (= (apply!114 lt!68304 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 newMap!16)))))

(declare-fun bm!14349 () Bool)

(assert (=> bm!14349 (= call!14348 (contains!880 lt!68304 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14350 () Bool)

(assert (=> bm!14350 (= call!14347 (+!161 (ite c!24285 call!14350 (ite c!24286 call!14352 call!14349)) (ite (or c!24285 c!24286) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 newMap!16)) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16)))))))

(declare-fun b!131360 () Bool)

(assert (=> b!131360 (= e!85656 e!85663)))

(declare-fun c!24287 () Bool)

(assert (=> b!131360 (= c!24287 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!40037 c!24285) b!131340))

(assert (= (and d!40037 (not c!24285)) b!131346))

(assert (= (and b!131346 c!24286) b!131342))

(assert (= (and b!131346 (not c!24286)) b!131347))

(assert (= (and b!131347 c!24288) b!131355))

(assert (= (and b!131347 (not c!24288)) b!131351))

(assert (= (or b!131355 b!131351) bm!14348))

(assert (= (or b!131342 bm!14348) bm!14346))

(assert (= (or b!131342 b!131355) bm!14345))

(assert (= (or b!131340 bm!14346) bm!14347))

(assert (= (or b!131340 bm!14345) bm!14350))

(assert (= (and d!40037 res!63249) b!131356))

(assert (= (and d!40037 c!24289) b!131358))

(assert (= (and d!40037 (not c!24289)) b!131357))

(assert (= (and d!40037 res!63244) b!131350))

(assert (= (and b!131350 res!63247) b!131349))

(assert (= (and b!131350 (not res!63242)) b!131348))

(assert (= (and b!131348 res!63243) b!131354))

(assert (= (and b!131350 res!63250) b!131344))

(assert (= (and b!131344 c!24290) b!131341))

(assert (= (and b!131344 (not c!24290)) b!131353))

(assert (= (and b!131341 res!63246) b!131345))

(assert (= (or b!131341 b!131353) bm!14344))

(assert (= (and b!131344 res!63248) b!131360))

(assert (= (and b!131360 c!24287) b!131352))

(assert (= (and b!131360 (not c!24287)) b!131343))

(assert (= (and b!131352 res!63245) b!131359))

(assert (= (or b!131352 b!131343) bm!14349))

(declare-fun b_lambda!5839 () Bool)

(assert (=> (not b_lambda!5839) (not b!131354)))

(assert (=> b!131354 t!6125))

(declare-fun b_and!8125 () Bool)

(assert (= b_and!8121 (and (=> t!6125 result!3945) b_and!8125)))

(assert (=> b!131354 t!6127))

(declare-fun b_and!8127 () Bool)

(assert (= b_and!8123 (and (=> t!6127 result!3947) b_and!8127)))

(assert (=> b!131356 m!154417))

(assert (=> b!131356 m!154417))

(assert (=> b!131356 m!154419))

(declare-fun m!154659 () Bool)

(assert (=> b!131358 m!154659))

(declare-fun m!154661 () Bool)

(assert (=> b!131358 m!154661))

(declare-fun m!154663 () Bool)

(assert (=> b!131358 m!154663))

(declare-fun m!154665 () Bool)

(assert (=> b!131358 m!154665))

(declare-fun m!154667 () Bool)

(assert (=> b!131358 m!154667))

(declare-fun m!154669 () Bool)

(assert (=> b!131358 m!154669))

(declare-fun m!154671 () Bool)

(assert (=> b!131358 m!154671))

(declare-fun m!154673 () Bool)

(assert (=> b!131358 m!154673))

(declare-fun m!154675 () Bool)

(assert (=> b!131358 m!154675))

(declare-fun m!154677 () Bool)

(assert (=> b!131358 m!154677))

(declare-fun m!154679 () Bool)

(assert (=> b!131358 m!154679))

(assert (=> b!131358 m!154665))

(declare-fun m!154681 () Bool)

(assert (=> b!131358 m!154681))

(declare-fun m!154683 () Bool)

(assert (=> b!131358 m!154683))

(assert (=> b!131358 m!154673))

(assert (=> b!131358 m!154417))

(declare-fun m!154685 () Bool)

(assert (=> b!131358 m!154685))

(declare-fun m!154687 () Bool)

(assert (=> b!131358 m!154687))

(assert (=> b!131358 m!154661))

(assert (=> b!131358 m!154669))

(declare-fun m!154689 () Bool)

(assert (=> b!131358 m!154689))

(assert (=> d!40037 m!154443))

(declare-fun m!154691 () Bool)

(assert (=> b!131345 m!154691))

(assert (=> b!131349 m!154417))

(assert (=> b!131349 m!154417))

(assert (=> b!131349 m!154419))

(declare-fun m!154693 () Bool)

(assert (=> bm!14344 m!154693))

(declare-fun m!154695 () Bool)

(assert (=> b!131354 m!154695))

(assert (=> b!131354 m!154493))

(declare-fun m!154697 () Bool)

(assert (=> b!131354 m!154697))

(assert (=> b!131354 m!154417))

(assert (=> b!131354 m!154493))

(assert (=> b!131354 m!154695))

(assert (=> b!131354 m!154417))

(declare-fun m!154699 () Bool)

(assert (=> b!131354 m!154699))

(declare-fun m!154701 () Bool)

(assert (=> bm!14349 m!154701))

(assert (=> bm!14347 m!154687))

(assert (=> b!131348 m!154417))

(assert (=> b!131348 m!154417))

(declare-fun m!154703 () Bool)

(assert (=> b!131348 m!154703))

(declare-fun m!154705 () Bool)

(assert (=> b!131340 m!154705))

(declare-fun m!154707 () Bool)

(assert (=> bm!14350 m!154707))

(declare-fun m!154709 () Bool)

(assert (=> b!131359 m!154709))

(assert (=> b!131097 d!40037))

(declare-fun d!40039 () Bool)

(assert (=> d!40039 (= (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131172 d!40039))

(declare-fun d!40041 () Bool)

(declare-fun e!85668 () Bool)

(assert (=> d!40041 e!85668))

(declare-fun res!63252 () Bool)

(assert (=> d!40041 (=> (not res!63252) (not e!85668))))

(declare-fun lt!68324 () ListLongMap!1665)

(assert (=> d!40041 (= res!63252 (contains!880 lt!68324 (_1!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(declare-fun lt!68321 () List!1704)

(assert (=> d!40041 (= lt!68324 (ListLongMap!1666 lt!68321))))

(declare-fun lt!68322 () Unit!4094)

(declare-fun lt!68323 () Unit!4094)

(assert (=> d!40041 (= lt!68322 lt!68323)))

(assert (=> d!40041 (= (getValueByKey!168 lt!68321 (_1!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40041 (= lt!68323 (lemmaContainsTupThenGetReturnValue!86 lt!68321 (_1!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40041 (= lt!68321 (insertStrictlySorted!89 (toList!848 call!14321) (_1!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) (_2!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))))))

(assert (=> d!40041 (= (+!161 call!14321 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))) lt!68324)))

(declare-fun b!131361 () Bool)

(declare-fun res!63251 () Bool)

(assert (=> b!131361 (=> (not res!63251) (not e!85668))))

(assert (=> b!131361 (= res!63251 (= (getValueByKey!168 (toList!848 lt!68324) (_1!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992)))))) (Some!173 (_2!1298 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))))

(declare-fun b!131362 () Bool)

(assert (=> b!131362 (= e!85668 (contains!882 (toList!848 lt!68324) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3169 (underlying!445 thiss!992))))))))

(assert (= (and d!40041 res!63252) b!131361))

(assert (= (and b!131361 res!63251) b!131362))

(declare-fun m!154711 () Bool)

(assert (=> d!40041 m!154711))

(declare-fun m!154713 () Bool)

(assert (=> d!40041 m!154713))

(declare-fun m!154715 () Bool)

(assert (=> d!40041 m!154715))

(declare-fun m!154717 () Bool)

(assert (=> d!40041 m!154717))

(declare-fun m!154719 () Bool)

(assert (=> b!131361 m!154719))

(declare-fun m!154721 () Bool)

(assert (=> b!131362 m!154721))

(assert (=> b!131156 d!40041))

(declare-fun b!131379 () Bool)

(declare-fun e!85679 () Bool)

(declare-fun call!14358 () Bool)

(assert (=> b!131379 (= e!85679 (not call!14358))))

(declare-fun b!131380 () Bool)

(declare-fun e!85680 () Bool)

(assert (=> b!131380 (= e!85680 e!85679)))

(declare-fun res!63263 () Bool)

(declare-fun call!14359 () Bool)

(assert (=> b!131380 (= res!63263 call!14359)))

(assert (=> b!131380 (=> (not res!63263) (not e!85679))))

(declare-fun b!131381 () Bool)

(declare-fun e!85678 () Bool)

(assert (=> b!131381 (= e!85678 (not call!14358))))

(declare-fun b!131382 () Bool)

(declare-fun lt!68329 () SeekEntryResult!276)

(assert (=> b!131382 (and (bvsge (index!3262 lt!68329) #b00000000000000000000000000000000) (bvslt (index!3262 lt!68329) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun res!63261 () Bool)

(assert (=> b!131382 (= res!63261 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3262 lt!68329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131382 (=> (not res!63261) (not e!85679))))

(declare-fun b!131383 () Bool)

(declare-fun e!85677 () Bool)

(assert (=> b!131383 (= e!85680 e!85677)))

(declare-fun c!24295 () Bool)

(assert (=> b!131383 (= c!24295 ((_ is MissingVacant!276) lt!68329))))

(declare-fun b!131384 () Bool)

(assert (=> b!131384 (= e!85677 ((_ is Undefined!276) lt!68329))))

(declare-fun bm!14355 () Bool)

(assert (=> bm!14355 (= call!14358 (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131385 () Bool)

(declare-fun res!63262 () Bool)

(assert (=> b!131385 (=> (not res!63262) (not e!85678))))

(assert (=> b!131385 (= res!63262 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3265 lt!68329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131385 (and (bvsge (index!3265 lt!68329) #b00000000000000000000000000000000) (bvslt (index!3265 lt!68329) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131386 () Bool)

(declare-fun res!63264 () Bool)

(assert (=> b!131386 (=> (not res!63264) (not e!85678))))

(assert (=> b!131386 (= res!63264 call!14359)))

(assert (=> b!131386 (= e!85677 e!85678)))

(declare-fun d!40043 () Bool)

(assert (=> d!40043 e!85680))

(declare-fun c!24296 () Bool)

(assert (=> d!40043 (= c!24296 ((_ is MissingZero!276) lt!68329))))

(assert (=> d!40043 (= lt!68329 (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun lt!68330 () Unit!4094)

(declare-fun choose!810 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4094)

(assert (=> d!40043 (= lt!68330 (choose!810 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40043 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40043 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)) lt!68330)))

(declare-fun bm!14356 () Bool)

(assert (=> bm!14356 (= call!14359 (inRange!0 (ite c!24296 (index!3262 lt!68329) (index!3265 lt!68329)) (mask!7129 newMap!16)))))

(assert (= (and d!40043 c!24296) b!131380))

(assert (= (and d!40043 (not c!24296)) b!131383))

(assert (= (and b!131380 res!63263) b!131382))

(assert (= (and b!131382 res!63261) b!131379))

(assert (= (and b!131383 c!24295) b!131386))

(assert (= (and b!131383 (not c!24295)) b!131384))

(assert (= (and b!131386 res!63264) b!131385))

(assert (= (and b!131385 res!63262) b!131381))

(assert (= (or b!131380 b!131386) bm!14356))

(assert (= (or b!131379 b!131381) bm!14355))

(assert (=> d!40043 m!154171))

(assert (=> d!40043 m!154287))

(assert (=> d!40043 m!154171))

(declare-fun m!154723 () Bool)

(assert (=> d!40043 m!154723))

(assert (=> d!40043 m!154443))

(declare-fun m!154725 () Bool)

(assert (=> bm!14356 m!154725))

(declare-fun m!154727 () Bool)

(assert (=> b!131382 m!154727))

(declare-fun m!154729 () Bool)

(assert (=> b!131385 m!154729))

(assert (=> bm!14355 m!154171))

(assert (=> bm!14355 m!154307))

(assert (=> bm!14288 d!40043))

(declare-fun d!40045 () Bool)

(declare-fun res!63269 () Bool)

(declare-fun e!85685 () Bool)

(assert (=> d!40045 (=> res!63269 e!85685)))

(assert (=> d!40045 (= res!63269 (and ((_ is Cons!1700) (toList!848 lt!68004)) (= (_1!1298 (h!2305 (toList!848 lt!68004))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!40045 (= (containsKey!172 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) e!85685)))

(declare-fun b!131391 () Bool)

(declare-fun e!85686 () Bool)

(assert (=> b!131391 (= e!85685 e!85686)))

(declare-fun res!63270 () Bool)

(assert (=> b!131391 (=> (not res!63270) (not e!85686))))

(assert (=> b!131391 (= res!63270 (and (or (not ((_ is Cons!1700) (toList!848 lt!68004))) (bvsle (_1!1298 (h!2305 (toList!848 lt!68004))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))) ((_ is Cons!1700) (toList!848 lt!68004)) (bvslt (_1!1298 (h!2305 (toList!848 lt!68004))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(declare-fun b!131392 () Bool)

(assert (=> b!131392 (= e!85686 (containsKey!172 (t!6114 (toList!848 lt!68004)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!40045 (not res!63269)) b!131391))

(assert (= (and b!131391 res!63270) b!131392))

(assert (=> b!131392 m!154171))

(declare-fun m!154731 () Bool)

(assert (=> b!131392 m!154731))

(assert (=> d!39953 d!40045))

(declare-fun d!40047 () Bool)

(assert (=> d!40047 (= (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131188 d!40047))

(declare-fun d!40049 () Bool)

(assert (=> d!40049 (= (apply!114 lt!68165 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1469 (getValueByKey!168 (toList!848 lt!68165) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5442 () Bool)

(assert (= bs!5442 d!40049))

(assert (=> bs!5442 m!154335))

(declare-fun m!154733 () Bool)

(assert (=> bs!5442 m!154733))

(assert (=> bs!5442 m!154733))

(declare-fun m!154735 () Bool)

(assert (=> bs!5442 m!154735))

(assert (=> b!131170 d!40049))

(declare-fun d!40051 () Bool)

(declare-fun c!24297 () Bool)

(assert (=> d!40051 (= c!24297 ((_ is ValueCellFull!1088) (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!85687 () V!3465)

(assert (=> d!40051 (= (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85687)))

(declare-fun b!131393 () Bool)

(assert (=> b!131393 (= e!85687 (get!1467 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131394 () Bool)

(assert (=> b!131394 (= e!85687 (get!1468 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40051 c!24297) b!131393))

(assert (= (and d!40051 (not c!24297)) b!131394))

(assert (=> b!131393 m!154375))

(assert (=> b!131393 m!154185))

(declare-fun m!154737 () Bool)

(assert (=> b!131393 m!154737))

(assert (=> b!131394 m!154375))

(assert (=> b!131394 m!154185))

(declare-fun m!154739 () Bool)

(assert (=> b!131394 m!154739))

(assert (=> b!131170 d!40051))

(declare-fun d!40053 () Bool)

(declare-fun e!85690 () Bool)

(assert (=> d!40053 e!85690))

(declare-fun res!63276 () Bool)

(assert (=> d!40053 (=> (not res!63276) (not e!85690))))

(declare-fun lt!68335 () SeekEntryResult!276)

(assert (=> d!40053 (= res!63276 ((_ is Found!276) lt!68335))))

(assert (=> d!40053 (= lt!68335 (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun lt!68336 () Unit!4094)

(declare-fun choose!811 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4094)

(assert (=> d!40053 (= lt!68336 (choose!811 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40053 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40053 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)) lt!68336)))

(declare-fun b!131399 () Bool)

(declare-fun res!63275 () Bool)

(assert (=> b!131399 (=> (not res!63275) (not e!85690))))

(assert (=> b!131399 (= res!63275 (inRange!0 (index!3263 lt!68335) (mask!7129 newMap!16)))))

(declare-fun b!131400 () Bool)

(assert (=> b!131400 (= e!85690 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68335)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!131400 (and (bvsge (index!3263 lt!68335) #b00000000000000000000000000000000) (bvslt (index!3263 lt!68335) (size!2504 (_keys!4586 newMap!16))))))

(assert (= (and d!40053 res!63276) b!131399))

(assert (= (and b!131399 res!63275) b!131400))

(assert (=> d!40053 m!154171))

(assert (=> d!40053 m!154287))

(assert (=> d!40053 m!154171))

(declare-fun m!154741 () Bool)

(assert (=> d!40053 m!154741))

(assert (=> d!40053 m!154443))

(declare-fun m!154743 () Bool)

(assert (=> b!131399 m!154743))

(declare-fun m!154745 () Bool)

(assert (=> b!131400 m!154745))

(assert (=> bm!14287 d!40053))

(declare-fun b!131413 () Bool)

(declare-fun e!85697 () SeekEntryResult!276)

(declare-fun lt!68344 () SeekEntryResult!276)

(assert (=> b!131413 (= e!85697 (Found!276 (index!3264 lt!68344)))))

(declare-fun b!131414 () Bool)

(declare-fun e!85699 () SeekEntryResult!276)

(assert (=> b!131414 (= e!85699 e!85697)))

(declare-fun lt!68343 () (_ BitVec 64))

(assert (=> b!131414 (= lt!68343 (select (arr!2236 (_keys!4586 newMap!16)) (index!3264 lt!68344)))))

(declare-fun c!24304 () Bool)

(assert (=> b!131414 (= c!24304 (= lt!68343 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131415 () Bool)

(declare-fun e!85698 () SeekEntryResult!276)

(assert (=> b!131415 (= e!85698 (MissingZero!276 (index!3264 lt!68344)))))

(declare-fun d!40055 () Bool)

(declare-fun lt!68345 () SeekEntryResult!276)

(assert (=> d!40055 (and (or ((_ is Undefined!276) lt!68345) (not ((_ is Found!276) lt!68345)) (and (bvsge (index!3263 lt!68345) #b00000000000000000000000000000000) (bvslt (index!3263 lt!68345) (size!2504 (_keys!4586 newMap!16))))) (or ((_ is Undefined!276) lt!68345) ((_ is Found!276) lt!68345) (not ((_ is MissingZero!276) lt!68345)) (and (bvsge (index!3262 lt!68345) #b00000000000000000000000000000000) (bvslt (index!3262 lt!68345) (size!2504 (_keys!4586 newMap!16))))) (or ((_ is Undefined!276) lt!68345) ((_ is Found!276) lt!68345) ((_ is MissingZero!276) lt!68345) (not ((_ is MissingVacant!276) lt!68345)) (and (bvsge (index!3265 lt!68345) #b00000000000000000000000000000000) (bvslt (index!3265 lt!68345) (size!2504 (_keys!4586 newMap!16))))) (or ((_ is Undefined!276) lt!68345) (ite ((_ is Found!276) lt!68345) (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68345)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (ite ((_ is MissingZero!276) lt!68345) (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3262 lt!68345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!276) lt!68345) (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3265 lt!68345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40055 (= lt!68345 e!85699)))

(declare-fun c!24306 () Bool)

(assert (=> d!40055 (= c!24306 (and ((_ is Intermediate!276) lt!68344) (undefined!1088 lt!68344)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4729 (_ BitVec 32)) SeekEntryResult!276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!40055 (= lt!68344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (mask!7129 newMap!16)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(assert (=> d!40055 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40055 (= (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)) lt!68345)))

(declare-fun b!131416 () Bool)

(assert (=> b!131416 (= e!85699 Undefined!276)))

(declare-fun b!131417 () Bool)

(declare-fun c!24305 () Bool)

(assert (=> b!131417 (= c!24305 (= lt!68343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131417 (= e!85697 e!85698)))

(declare-fun b!131418 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4729 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> b!131418 (= e!85698 (seekKeyOrZeroReturnVacant!0 (x!15414 lt!68344) (index!3264 lt!68344) (index!3264 lt!68344) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(assert (= (and d!40055 c!24306) b!131416))

(assert (= (and d!40055 (not c!24306)) b!131414))

(assert (= (and b!131414 c!24304) b!131413))

(assert (= (and b!131414 (not c!24304)) b!131417))

(assert (= (and b!131417 c!24305) b!131415))

(assert (= (and b!131417 (not c!24305)) b!131418))

(declare-fun m!154747 () Bool)

(assert (=> b!131414 m!154747))

(assert (=> d!40055 m!154443))

(declare-fun m!154749 () Bool)

(assert (=> d!40055 m!154749))

(declare-fun m!154751 () Bool)

(assert (=> d!40055 m!154751))

(assert (=> d!40055 m!154171))

(declare-fun m!154753 () Bool)

(assert (=> d!40055 m!154753))

(assert (=> d!40055 m!154171))

(assert (=> d!40055 m!154751))

(declare-fun m!154755 () Bool)

(assert (=> d!40055 m!154755))

(declare-fun m!154757 () Bool)

(assert (=> d!40055 m!154757))

(assert (=> b!131418 m!154171))

(declare-fun m!154759 () Bool)

(assert (=> b!131418 m!154759))

(assert (=> bm!14303 d!40055))

(declare-fun b!131419 () Bool)

(declare-fun e!85702 () Bool)

(declare-fun call!14360 () Bool)

(assert (=> b!131419 (= e!85702 call!14360)))

(declare-fun b!131420 () Bool)

(declare-fun e!85701 () Bool)

(assert (=> b!131420 (= e!85701 call!14360)))

(declare-fun bm!14357 () Bool)

(assert (=> bm!14357 (= call!14360 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131421 () Bool)

(assert (=> b!131421 (= e!85701 e!85702)))

(declare-fun lt!68348 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68348 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!68346 () Unit!4094)

(assert (=> b!131421 (= lt!68346 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!131421 (arrayContainsKey!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68348 #b00000000000000000000000000000000)))

(declare-fun lt!68347 () Unit!4094)

(assert (=> b!131421 (= lt!68347 lt!68346)))

(declare-fun res!63277 () Bool)

(assert (=> b!131421 (= res!63277 (= (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))) (Found!276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!131421 (=> (not res!63277) (not e!85702))))

(declare-fun b!131422 () Bool)

(declare-fun e!85700 () Bool)

(assert (=> b!131422 (= e!85700 e!85701)))

(declare-fun c!24307 () Bool)

(assert (=> b!131422 (= c!24307 (validKeyInArray!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!40057 () Bool)

(declare-fun res!63278 () Bool)

(assert (=> d!40057 (=> res!63278 e!85700)))

(assert (=> d!40057 (= res!63278 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(assert (=> d!40057 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))) e!85700)))

(assert (= (and d!40057 (not res!63278)) b!131422))

(assert (= (and b!131422 c!24307) b!131421))

(assert (= (and b!131422 (not c!24307)) b!131420))

(assert (= (and b!131421 res!63277) b!131419))

(assert (= (or b!131419 b!131420) bm!14357))

(declare-fun m!154761 () Bool)

(assert (=> bm!14357 m!154761))

(declare-fun m!154763 () Bool)

(assert (=> b!131421 m!154763))

(declare-fun m!154765 () Bool)

(assert (=> b!131421 m!154765))

(declare-fun m!154767 () Bool)

(assert (=> b!131421 m!154767))

(assert (=> b!131421 m!154763))

(declare-fun m!154769 () Bool)

(assert (=> b!131421 m!154769))

(assert (=> b!131422 m!154763))

(assert (=> b!131422 m!154763))

(declare-fun m!154771 () Bool)

(assert (=> b!131422 m!154771))

(assert (=> bm!14327 d!40057))

(declare-fun d!40059 () Bool)

(assert (=> d!40059 (= (inRange!0 (ite c!24216 (ite c!24217 (index!3263 lt!68094) (ite c!24220 (index!3262 lt!68091) (index!3265 lt!68091))) (ite c!24215 (index!3263 lt!68104) (ite c!24224 (index!3262 lt!68095) (index!3265 lt!68095)))) (mask!7129 newMap!16)) (and (bvsge (ite c!24216 (ite c!24217 (index!3263 lt!68094) (ite c!24220 (index!3262 lt!68091) (index!3265 lt!68091))) (ite c!24215 (index!3263 lt!68104) (ite c!24224 (index!3262 lt!68095) (index!3265 lt!68095)))) #b00000000000000000000000000000000) (bvslt (ite c!24216 (ite c!24217 (index!3263 lt!68094) (ite c!24220 (index!3262 lt!68091) (index!3265 lt!68091))) (ite c!24215 (index!3263 lt!68104) (ite c!24224 (index!3262 lt!68095) (index!3265 lt!68095)))) (bvadd (mask!7129 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14295 d!40059))

(declare-fun d!40061 () Bool)

(declare-fun isEmpty!410 (Option!174) Bool)

(assert (=> d!40061 (= (isDefined!122 (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))) (not (isEmpty!410 (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun bs!5443 () Bool)

(assert (= bs!5443 d!40061))

(assert (=> bs!5443 m!154271))

(declare-fun m!154773 () Bool)

(assert (=> bs!5443 m!154773))

(assert (=> b!130981 d!40061))

(declare-fun b!131433 () Bool)

(declare-fun e!85708 () Option!174)

(assert (=> b!131433 (= e!85708 (getValueByKey!168 (t!6114 (toList!848 lt!68004)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun d!40063 () Bool)

(declare-fun c!24312 () Bool)

(assert (=> d!40063 (= c!24312 (and ((_ is Cons!1700) (toList!848 lt!68004)) (= (_1!1298 (h!2305 (toList!848 lt!68004))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))))

(declare-fun e!85707 () Option!174)

(assert (=> d!40063 (= (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) e!85707)))

(declare-fun b!131432 () Bool)

(assert (=> b!131432 (= e!85707 e!85708)))

(declare-fun c!24313 () Bool)

(assert (=> b!131432 (= c!24313 (and ((_ is Cons!1700) (toList!848 lt!68004)) (not (= (_1!1298 (h!2305 (toList!848 lt!68004))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun b!131434 () Bool)

(assert (=> b!131434 (= e!85708 None!172)))

(declare-fun b!131431 () Bool)

(assert (=> b!131431 (= e!85707 (Some!173 (_2!1298 (h!2305 (toList!848 lt!68004)))))))

(assert (= (and d!40063 c!24312) b!131431))

(assert (= (and d!40063 (not c!24312)) b!131432))

(assert (= (and b!131432 c!24313) b!131433))

(assert (= (and b!131432 (not c!24313)) b!131434))

(assert (=> b!131433 m!154171))

(declare-fun m!154775 () Bool)

(assert (=> b!131433 m!154775))

(assert (=> b!130981 d!40063))

(declare-fun b!131435 () Bool)

(declare-fun e!85711 () Bool)

(declare-fun call!14361 () Bool)

(assert (=> b!131435 (= e!85711 call!14361)))

(declare-fun b!131436 () Bool)

(declare-fun e!85710 () Bool)

(assert (=> b!131436 (= e!85710 call!14361)))

(declare-fun bm!14358 () Bool)

(assert (=> bm!14358 (= call!14361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun b!131437 () Bool)

(assert (=> b!131437 (= e!85710 e!85711)))

(declare-fun lt!68351 () (_ BitVec 64))

(assert (=> b!131437 (= lt!68351 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68349 () Unit!4094)

(assert (=> b!131437 (= lt!68349 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4586 newMap!16) lt!68351 #b00000000000000000000000000000000))))

(assert (=> b!131437 (arrayContainsKey!0 (_keys!4586 newMap!16) lt!68351 #b00000000000000000000000000000000)))

(declare-fun lt!68350 () Unit!4094)

(assert (=> b!131437 (= lt!68350 lt!68349)))

(declare-fun res!63279 () Bool)

(assert (=> b!131437 (= res!63279 (= (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000) (_keys!4586 newMap!16) (mask!7129 newMap!16)) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!131437 (=> (not res!63279) (not e!85711))))

(declare-fun b!131438 () Bool)

(declare-fun e!85709 () Bool)

(assert (=> b!131438 (= e!85709 e!85710)))

(declare-fun c!24314 () Bool)

(assert (=> b!131438 (= c!24314 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40065 () Bool)

(declare-fun res!63280 () Bool)

(assert (=> d!40065 (=> res!63280 e!85709)))

(assert (=> d!40065 (= res!63280 (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!40065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 newMap!16) (mask!7129 newMap!16)) e!85709)))

(assert (= (and d!40065 (not res!63280)) b!131438))

(assert (= (and b!131438 c!24314) b!131437))

(assert (= (and b!131438 (not c!24314)) b!131436))

(assert (= (and b!131437 res!63279) b!131435))

(assert (= (or b!131435 b!131436) bm!14358))

(declare-fun m!154777 () Bool)

(assert (=> bm!14358 m!154777))

(assert (=> b!131437 m!154417))

(declare-fun m!154779 () Bool)

(assert (=> b!131437 m!154779))

(declare-fun m!154781 () Bool)

(assert (=> b!131437 m!154781))

(assert (=> b!131437 m!154417))

(declare-fun m!154783 () Bool)

(assert (=> b!131437 m!154783))

(assert (=> b!131438 m!154417))

(assert (=> b!131438 m!154417))

(assert (=> b!131438 m!154419))

(assert (=> b!131196 d!40065))

(assert (=> d!39959 d!40037))

(assert (=> b!131077 d!40037))

(declare-fun d!40067 () Bool)

(assert (=> d!40067 (isDefined!122 (getValueByKey!168 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!68354 () Unit!4094)

(declare-fun choose!812 (List!1704 (_ BitVec 64)) Unit!4094)

(assert (=> d!40067 (= lt!68354 (choose!812 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!85714 () Bool)

(assert (=> d!40067 e!85714))

(declare-fun res!63283 () Bool)

(assert (=> d!40067 (=> (not res!63283) (not e!85714))))

(declare-fun isStrictlySorted!315 (List!1704) Bool)

(assert (=> d!40067 (= res!63283 (isStrictlySorted!315 (toList!848 lt!68004)))))

(assert (=> d!40067 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) lt!68354)))

(declare-fun b!131441 () Bool)

(assert (=> b!131441 (= e!85714 (containsKey!172 (toList!848 lt!68004) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!40067 res!63283) b!131441))

(assert (=> d!40067 m!154171))

(assert (=> d!40067 m!154271))

(assert (=> d!40067 m!154271))

(assert (=> d!40067 m!154273))

(assert (=> d!40067 m!154171))

(declare-fun m!154785 () Bool)

(assert (=> d!40067 m!154785))

(declare-fun m!154787 () Bool)

(assert (=> d!40067 m!154787))

(assert (=> b!131441 m!154171))

(assert (=> b!131441 m!154267))

(assert (=> b!130979 d!40067))

(assert (=> b!130979 d!40061))

(assert (=> b!130979 d!40063))

(declare-fun b!131451 () Bool)

(declare-fun res!63295 () Bool)

(declare-fun e!85717 () Bool)

(assert (=> b!131451 (=> (not res!63295) (not e!85717))))

(declare-fun size!2510 (LongMapFixedSize!1084) (_ BitVec 32))

(assert (=> b!131451 (= res!63295 (bvsge (size!2510 newMap!16) (_size!591 newMap!16)))))

(declare-fun b!131450 () Bool)

(declare-fun res!63293 () Bool)

(assert (=> b!131450 (=> (not res!63293) (not e!85717))))

(assert (=> b!131450 (= res!63293 (and (= (size!2505 (_values!2825 newMap!16)) (bvadd (mask!7129 newMap!16) #b00000000000000000000000000000001)) (= (size!2504 (_keys!4586 newMap!16)) (size!2505 (_values!2825 newMap!16))) (bvsge (_size!591 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!591 newMap!16) (bvadd (mask!7129 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!40069 () Bool)

(declare-fun res!63292 () Bool)

(assert (=> d!40069 (=> (not res!63292) (not e!85717))))

(assert (=> d!40069 (= res!63292 (validMask!0 (mask!7129 newMap!16)))))

(assert (=> d!40069 (= (simpleValid!90 newMap!16) e!85717)))

(declare-fun b!131452 () Bool)

(declare-fun res!63294 () Bool)

(assert (=> b!131452 (=> (not res!63294) (not e!85717))))

(assert (=> b!131452 (= res!63294 (= (size!2510 newMap!16) (bvadd (_size!591 newMap!16) (bvsdiv (bvadd (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!131453 () Bool)

(assert (=> b!131453 (= e!85717 (and (bvsge (extraKeys!2611 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2611 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!591 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!40069 res!63292) b!131450))

(assert (= (and b!131450 res!63293) b!131451))

(assert (= (and b!131451 res!63295) b!131452))

(assert (= (and b!131452 res!63294) b!131453))

(declare-fun m!154789 () Bool)

(assert (=> b!131451 m!154789))

(assert (=> d!40069 m!154443))

(assert (=> b!131452 m!154789))

(assert (=> d!39977 d!40069))

(declare-fun d!40071 () Bool)

(declare-fun res!63296 () Bool)

(declare-fun e!85718 () Bool)

(assert (=> d!40071 (=> (not res!63296) (not e!85718))))

(assert (=> d!40071 (= res!63296 (simpleValid!90 (v!3169 (underlying!445 thiss!992))))))

(assert (=> d!40071 (= (valid!523 (v!3169 (underlying!445 thiss!992))) e!85718)))

(declare-fun b!131454 () Bool)

(declare-fun res!63297 () Bool)

(assert (=> b!131454 (=> (not res!63297) (not e!85718))))

(assert (=> b!131454 (= res!63297 (= (arrayCountValidKeys!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000000 (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))) (_size!591 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131455 () Bool)

(declare-fun res!63298 () Bool)

(assert (=> b!131455 (=> (not res!63298) (not e!85718))))

(assert (=> b!131455 (= res!63298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(declare-fun b!131456 () Bool)

(assert (=> b!131456 (= e!85718 (arrayNoDuplicates!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) #b00000000000000000000000000000000 Nil!1702))))

(assert (= (and d!40071 res!63296) b!131454))

(assert (= (and b!131454 res!63297) b!131455))

(assert (= (and b!131455 res!63298) b!131456))

(declare-fun m!154791 () Bool)

(assert (=> d!40071 m!154791))

(declare-fun m!154793 () Bool)

(assert (=> b!131454 m!154793))

(assert (=> b!131455 m!154181))

(declare-fun m!154795 () Bool)

(assert (=> b!131456 m!154795))

(assert (=> d!39965 d!40071))

(declare-fun d!40073 () Bool)

(assert (=> d!40073 (= (+!161 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) lt!68099 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68357 () Unit!4094)

(declare-fun choose!813 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4094)

(assert (=> d!40073 (= lt!68357 (choose!813 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68099 (zeroValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40073 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40073 (= (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68099 (zeroValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)) lt!68357)))

(declare-fun bs!5444 () Bool)

(assert (= bs!5444 d!40073))

(assert (=> bs!5444 m!154187))

(declare-fun m!154797 () Bool)

(assert (=> bs!5444 m!154797))

(assert (=> bs!5444 m!154187))

(declare-fun m!154799 () Bool)

(assert (=> bs!5444 m!154799))

(assert (=> bs!5444 m!154291))

(assert (=> bs!5444 m!154443))

(assert (=> bs!5444 m!154291))

(declare-fun m!154801 () Bool)

(assert (=> bs!5444 m!154801))

(assert (=> b!131089 d!40073))

(assert (=> b!131165 d!40039))

(declare-fun d!40075 () Bool)

(declare-fun e!85719 () Bool)

(assert (=> d!40075 e!85719))

(declare-fun res!63299 () Bool)

(assert (=> d!40075 (=> res!63299 e!85719)))

(declare-fun lt!68359 () Bool)

(assert (=> d!40075 (= res!63299 (not lt!68359))))

(declare-fun lt!68360 () Bool)

(assert (=> d!40075 (= lt!68359 lt!68360)))

(declare-fun lt!68361 () Unit!4094)

(declare-fun e!85720 () Unit!4094)

(assert (=> d!40075 (= lt!68361 e!85720)))

(declare-fun c!24315 () Bool)

(assert (=> d!40075 (= c!24315 lt!68360)))

(assert (=> d!40075 (= lt!68360 (containsKey!172 (toList!848 lt!68165) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!40075 (= (contains!880 lt!68165 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68359)))

(declare-fun b!131457 () Bool)

(declare-fun lt!68358 () Unit!4094)

(assert (=> b!131457 (= e!85720 lt!68358)))

(assert (=> b!131457 (= lt!68358 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 lt!68165) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131457 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131458 () Bool)

(declare-fun Unit!4107 () Unit!4094)

(assert (=> b!131458 (= e!85720 Unit!4107)))

(declare-fun b!131459 () Bool)

(assert (=> b!131459 (= e!85719 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!40075 c!24315) b!131457))

(assert (= (and d!40075 (not c!24315)) b!131458))

(assert (= (and d!40075 (not res!63299)) b!131459))

(assert (=> d!40075 m!154335))

(declare-fun m!154803 () Bool)

(assert (=> d!40075 m!154803))

(assert (=> b!131457 m!154335))

(declare-fun m!154805 () Bool)

(assert (=> b!131457 m!154805))

(assert (=> b!131457 m!154335))

(assert (=> b!131457 m!154733))

(assert (=> b!131457 m!154733))

(declare-fun m!154807 () Bool)

(assert (=> b!131457 m!154807))

(assert (=> b!131459 m!154335))

(assert (=> b!131459 m!154733))

(assert (=> b!131459 m!154733))

(assert (=> b!131459 m!154807))

(assert (=> b!131164 d!40075))

(declare-fun d!40077 () Bool)

(declare-fun e!85721 () Bool)

(assert (=> d!40077 e!85721))

(declare-fun res!63301 () Bool)

(assert (=> d!40077 (=> (not res!63301) (not e!85721))))

(declare-fun lt!68365 () ListLongMap!1665)

(assert (=> d!40077 (= res!63301 (contains!880 lt!68365 (_1!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!68362 () List!1704)

(assert (=> d!40077 (= lt!68365 (ListLongMap!1666 lt!68362))))

(declare-fun lt!68363 () Unit!4094)

(declare-fun lt!68364 () Unit!4094)

(assert (=> d!40077 (= lt!68363 lt!68364)))

(assert (=> d!40077 (= (getValueByKey!168 lt!68362 (_1!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40077 (= lt!68364 (lemmaContainsTupThenGetReturnValue!86 lt!68362 (_1!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40077 (= lt!68362 (insertStrictlySorted!89 (toList!848 e!85498) (_1!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40077 (= (+!161 e!85498 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!68365)))

(declare-fun b!131460 () Bool)

(declare-fun res!63300 () Bool)

(assert (=> b!131460 (=> (not res!63300) (not e!85721))))

(assert (=> b!131460 (= res!63300 (= (getValueByKey!168 (toList!848 lt!68365) (_1!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1298 (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!131461 () Bool)

(assert (=> b!131461 (= e!85721 (contains!882 (toList!848 lt!68365) (ite c!24228 (ite c!24222 (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!40077 res!63301) b!131460))

(assert (= (and b!131460 res!63300) b!131461))

(declare-fun m!154809 () Bool)

(assert (=> d!40077 m!154809))

(declare-fun m!154811 () Bool)

(assert (=> d!40077 m!154811))

(declare-fun m!154813 () Bool)

(assert (=> d!40077 m!154813))

(declare-fun m!154815 () Bool)

(assert (=> d!40077 m!154815))

(declare-fun m!154817 () Bool)

(assert (=> b!131460 m!154817))

(declare-fun m!154819 () Bool)

(assert (=> b!131461 m!154819))

(assert (=> bm!14284 d!40077))

(declare-fun d!40079 () Bool)

(assert (=> d!40079 (= (get!1468 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131113 d!40079))

(declare-fun d!40081 () Bool)

(declare-fun e!85722 () Bool)

(assert (=> d!40081 e!85722))

(declare-fun res!63302 () Bool)

(assert (=> d!40081 (=> res!63302 e!85722)))

(declare-fun lt!68367 () Bool)

(assert (=> d!40081 (= res!63302 (not lt!68367))))

(declare-fun lt!68368 () Bool)

(assert (=> d!40081 (= lt!68367 lt!68368)))

(declare-fun lt!68369 () Unit!4094)

(declare-fun e!85723 () Unit!4094)

(assert (=> d!40081 (= lt!68369 e!85723)))

(declare-fun c!24316 () Bool)

(assert (=> d!40081 (= c!24316 lt!68368)))

(assert (=> d!40081 (= lt!68368 (containsKey!172 (toList!848 lt!68165) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40081 (= (contains!880 lt!68165 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68367)))

(declare-fun b!131462 () Bool)

(declare-fun lt!68366 () Unit!4094)

(assert (=> b!131462 (= e!85723 lt!68366)))

(assert (=> b!131462 (= lt!68366 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!848 lt!68165) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131462 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131463 () Bool)

(declare-fun Unit!4108 () Unit!4094)

(assert (=> b!131463 (= e!85723 Unit!4108)))

(declare-fun b!131464 () Bool)

(assert (=> b!131464 (= e!85722 (isDefined!122 (getValueByKey!168 (toList!848 lt!68165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40081 c!24316) b!131462))

(assert (= (and d!40081 (not c!24316)) b!131463))

(assert (= (and d!40081 (not res!63302)) b!131464))

(declare-fun m!154821 () Bool)

(assert (=> d!40081 m!154821))

(declare-fun m!154823 () Bool)

(assert (=> b!131462 m!154823))

(declare-fun m!154825 () Bool)

(assert (=> b!131462 m!154825))

(assert (=> b!131462 m!154825))

(declare-fun m!154827 () Bool)

(assert (=> b!131462 m!154827))

(assert (=> b!131464 m!154825))

(assert (=> b!131464 m!154825))

(assert (=> b!131464 m!154827))

(assert (=> bm!14323 d!40081))

(declare-fun b!131465 () Bool)

(declare-fun e!85736 () ListLongMap!1665)

(declare-fun call!14362 () ListLongMap!1665)

(assert (=> b!131465 (= e!85736 (+!161 call!14362 (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))))))

(declare-fun b!131466 () Bool)

(declare-fun e!85730 () Bool)

(declare-fun e!85734 () Bool)

(assert (=> b!131466 (= e!85730 e!85734)))

(declare-fun res!63307 () Bool)

(declare-fun call!14368 () Bool)

(assert (=> b!131466 (= res!63307 call!14368)))

(assert (=> b!131466 (=> (not res!63307) (not e!85734))))

(declare-fun b!131467 () Bool)

(declare-fun e!85728 () ListLongMap!1665)

(declare-fun call!14366 () ListLongMap!1665)

(assert (=> b!131467 (= e!85728 call!14366)))

(declare-fun b!131469 () Bool)

(declare-fun res!63309 () Bool)

(declare-fun e!85725 () Bool)

(assert (=> b!131469 (=> (not res!63309) (not e!85725))))

(assert (=> b!131469 (= res!63309 e!85730)))

(declare-fun c!24322 () Bool)

(assert (=> b!131469 (= c!24322 (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131470 () Bool)

(declare-fun lt!68375 () ListLongMap!1665)

(assert (=> b!131470 (= e!85734 (= (apply!114 lt!68375 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16))))))

(declare-fun b!131471 () Bool)

(assert (=> b!131471 (= e!85736 e!85728)))

(declare-fun c!24318 () Bool)

(assert (=> b!131471 (= c!24318 (and (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!24320 () Bool)

(declare-fun b!131472 () Bool)

(assert (=> b!131472 (= c!24320 (and (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!85727 () ListLongMap!1665)

(assert (=> b!131472 (= e!85728 e!85727)))

(declare-fun b!131473 () Bool)

(declare-fun e!85726 () Bool)

(declare-fun e!85729 () Bool)

(assert (=> b!131473 (= e!85726 e!85729)))

(declare-fun res!63304 () Bool)

(assert (=> b!131473 (=> (not res!63304) (not e!85729))))

(assert (=> b!131473 (= res!63304 (contains!880 lt!68375 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14359 () Bool)

(assert (=> bm!14359 (= call!14368 (contains!880 lt!68375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131474 () Bool)

(declare-fun e!85731 () Bool)

(assert (=> b!131474 (= e!85731 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131475 () Bool)

(declare-fun res!63311 () Bool)

(assert (=> b!131475 (=> (not res!63311) (not e!85725))))

(assert (=> b!131475 (= res!63311 e!85726)))

(declare-fun res!63303 () Bool)

(assert (=> b!131475 (=> res!63303 e!85726)))

(assert (=> b!131475 (= res!63303 (not e!85731))))

(declare-fun res!63308 () Bool)

(assert (=> b!131475 (=> (not res!63308) (not e!85731))))

(assert (=> b!131475 (= res!63308 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun b!131476 () Bool)

(declare-fun call!14364 () ListLongMap!1665)

(assert (=> b!131476 (= e!85727 call!14364)))

(declare-fun b!131477 () Bool)

(declare-fun e!85732 () Bool)

(declare-fun e!85735 () Bool)

(assert (=> b!131477 (= e!85732 e!85735)))

(declare-fun res!63306 () Bool)

(declare-fun call!14363 () Bool)

(assert (=> b!131477 (= res!63306 call!14363)))

(assert (=> b!131477 (=> (not res!63306) (not e!85735))))

(declare-fun b!131478 () Bool)

(assert (=> b!131478 (= e!85730 (not call!14368))))

(declare-fun bm!14360 () Bool)

(assert (=> bm!14360 (= call!14366 call!14362)))

(declare-fun d!40083 () Bool)

(assert (=> d!40083 e!85725))

(declare-fun res!63305 () Bool)

(assert (=> d!40083 (=> (not res!63305) (not e!85725))))

(assert (=> d!40083 (= res!63305 (or (bvsge #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))))

(declare-fun lt!68379 () ListLongMap!1665)

(assert (=> d!40083 (= lt!68375 lt!68379)))

(declare-fun lt!68382 () Unit!4094)

(declare-fun e!85724 () Unit!4094)

(assert (=> d!40083 (= lt!68382 e!85724)))

(declare-fun c!24321 () Bool)

(declare-fun e!85733 () Bool)

(assert (=> d!40083 (= c!24321 e!85733)))

(declare-fun res!63310 () Bool)

(assert (=> d!40083 (=> (not res!63310) (not e!85733))))

(assert (=> d!40083 (= res!63310 (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(assert (=> d!40083 (= lt!68379 e!85736)))

(declare-fun c!24317 () Bool)

(assert (=> d!40083 (= c!24317 (and (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40083 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40083 (= (getCurrentListMap!516 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68375)))

(declare-fun b!131468 () Bool)

(assert (=> b!131468 (= e!85732 (not call!14363))))

(declare-fun bm!14361 () Bool)

(declare-fun call!14367 () ListLongMap!1665)

(declare-fun call!14365 () ListLongMap!1665)

(assert (=> bm!14361 (= call!14367 call!14365)))

(declare-fun b!131479 () Bool)

(assert (=> b!131479 (= e!85729 (= (apply!114 lt!68375 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (select (arr!2237 (ite c!24228 (_values!2825 newMap!16) lt!68098)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2505 (ite c!24228 (_values!2825 newMap!16) lt!68098))))))

(assert (=> b!131479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))))))

(declare-fun bm!14362 () Bool)

(assert (=> bm!14362 (= call!14365 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14363 () Bool)

(assert (=> bm!14363 (= call!14364 call!14367)))

(declare-fun b!131480 () Bool)

(assert (=> b!131480 (= e!85727 call!14366)))

(declare-fun b!131481 () Bool)

(assert (=> b!131481 (= e!85733 (validKeyInArray!0 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131482 () Bool)

(declare-fun Unit!4109 () Unit!4094)

(assert (=> b!131482 (= e!85724 Unit!4109)))

(declare-fun b!131483 () Bool)

(declare-fun lt!68371 () Unit!4094)

(assert (=> b!131483 (= e!85724 lt!68371)))

(declare-fun lt!68376 () ListLongMap!1665)

(assert (=> b!131483 (= lt!68376 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68370 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68374 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68374 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68373 () Unit!4094)

(assert (=> b!131483 (= lt!68373 (addStillContains!90 lt!68376 lt!68370 (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) lt!68374))))

(assert (=> b!131483 (contains!880 (+!161 lt!68376 (tuple2!2575 lt!68370 (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)))) lt!68374)))

(declare-fun lt!68391 () Unit!4094)

(assert (=> b!131483 (= lt!68391 lt!68373)))

(declare-fun lt!68385 () ListLongMap!1665)

(assert (=> b!131483 (= lt!68385 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68388 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68388 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68380 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68380 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68387 () Unit!4094)

(assert (=> b!131483 (= lt!68387 (addApplyDifferent!90 lt!68385 lt!68388 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) lt!68380))))

(assert (=> b!131483 (= (apply!114 (+!161 lt!68385 (tuple2!2575 lt!68388 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))) lt!68380) (apply!114 lt!68385 lt!68380))))

(declare-fun lt!68383 () Unit!4094)

(assert (=> b!131483 (= lt!68383 lt!68387)))

(declare-fun lt!68378 () ListLongMap!1665)

(assert (=> b!131483 (= lt!68378 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68384 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68389 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68389 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68386 () Unit!4094)

(assert (=> b!131483 (= lt!68386 (addApplyDifferent!90 lt!68378 lt!68384 (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) lt!68389))))

(assert (=> b!131483 (= (apply!114 (+!161 lt!68378 (tuple2!2575 lt!68384 (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)))) lt!68389) (apply!114 lt!68378 lt!68389))))

(declare-fun lt!68377 () Unit!4094)

(assert (=> b!131483 (= lt!68377 lt!68386)))

(declare-fun lt!68390 () ListLongMap!1665)

(assert (=> b!131483 (= lt!68390 (getCurrentListMapNoExtraKeys!126 (_keys!4586 newMap!16) (ite c!24228 (_values!2825 newMap!16) lt!68098) (mask!7129 newMap!16) (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68381 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68372 () (_ BitVec 64))

(assert (=> b!131483 (= lt!68372 (select (arr!2236 (_keys!4586 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131483 (= lt!68371 (addApplyDifferent!90 lt!68390 lt!68381 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) lt!68372))))

(assert (=> b!131483 (= (apply!114 (+!161 lt!68390 (tuple2!2575 lt!68381 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))) lt!68372) (apply!114 lt!68390 lt!68372))))

(declare-fun b!131484 () Bool)

(assert (=> b!131484 (= e!85735 (= (apply!114 lt!68375 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16))))))

(declare-fun bm!14364 () Bool)

(assert (=> bm!14364 (= call!14363 (contains!880 lt!68375 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14365 () Bool)

(assert (=> bm!14365 (= call!14362 (+!161 (ite c!24317 call!14365 (ite c!24318 call!14367 call!14364)) (ite (or c!24317 c!24318) (tuple2!2575 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24228 c!24222) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16))) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24228 (ite c!24222 (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16))))))))

(declare-fun b!131485 () Bool)

(assert (=> b!131485 (= e!85725 e!85732)))

(declare-fun c!24319 () Bool)

(assert (=> b!131485 (= c!24319 (not (= (bvand (ite c!24228 (ite c!24222 lt!68099 lt!68112) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!40083 c!24317) b!131465))

(assert (= (and d!40083 (not c!24317)) b!131471))

(assert (= (and b!131471 c!24318) b!131467))

(assert (= (and b!131471 (not c!24318)) b!131472))

(assert (= (and b!131472 c!24320) b!131480))

(assert (= (and b!131472 (not c!24320)) b!131476))

(assert (= (or b!131480 b!131476) bm!14363))

(assert (= (or b!131467 bm!14363) bm!14361))

(assert (= (or b!131467 b!131480) bm!14360))

(assert (= (or b!131465 bm!14361) bm!14362))

(assert (= (or b!131465 bm!14360) bm!14365))

(assert (= (and d!40083 res!63310) b!131481))

(assert (= (and d!40083 c!24321) b!131483))

(assert (= (and d!40083 (not c!24321)) b!131482))

(assert (= (and d!40083 res!63305) b!131475))

(assert (= (and b!131475 res!63308) b!131474))

(assert (= (and b!131475 (not res!63303)) b!131473))

(assert (= (and b!131473 res!63304) b!131479))

(assert (= (and b!131475 res!63311) b!131469))

(assert (= (and b!131469 c!24322) b!131466))

(assert (= (and b!131469 (not c!24322)) b!131478))

(assert (= (and b!131466 res!63307) b!131470))

(assert (= (or b!131466 b!131478) bm!14359))

(assert (= (and b!131469 res!63309) b!131485))

(assert (= (and b!131485 c!24319) b!131477))

(assert (= (and b!131485 (not c!24319)) b!131468))

(assert (= (and b!131477 res!63306) b!131484))

(assert (= (or b!131477 b!131468) bm!14364))

(declare-fun b_lambda!5841 () Bool)

(assert (=> (not b_lambda!5841) (not b!131479)))

(assert (=> b!131479 t!6125))

(declare-fun b_and!8129 () Bool)

(assert (= b_and!8125 (and (=> t!6125 result!3945) b_and!8129)))

(assert (=> b!131479 t!6127))

(declare-fun b_and!8131 () Bool)

(assert (= b_and!8127 (and (=> t!6127 result!3947) b_and!8131)))

(assert (=> b!131481 m!154417))

(assert (=> b!131481 m!154417))

(assert (=> b!131481 m!154419))

(declare-fun m!154829 () Bool)

(assert (=> b!131483 m!154829))

(declare-fun m!154831 () Bool)

(assert (=> b!131483 m!154831))

(declare-fun m!154833 () Bool)

(assert (=> b!131483 m!154833))

(declare-fun m!154835 () Bool)

(assert (=> b!131483 m!154835))

(declare-fun m!154837 () Bool)

(assert (=> b!131483 m!154837))

(declare-fun m!154839 () Bool)

(assert (=> b!131483 m!154839))

(declare-fun m!154841 () Bool)

(assert (=> b!131483 m!154841))

(declare-fun m!154843 () Bool)

(assert (=> b!131483 m!154843))

(declare-fun m!154845 () Bool)

(assert (=> b!131483 m!154845))

(declare-fun m!154847 () Bool)

(assert (=> b!131483 m!154847))

(declare-fun m!154849 () Bool)

(assert (=> b!131483 m!154849))

(assert (=> b!131483 m!154835))

(declare-fun m!154851 () Bool)

(assert (=> b!131483 m!154851))

(declare-fun m!154853 () Bool)

(assert (=> b!131483 m!154853))

(assert (=> b!131483 m!154843))

(assert (=> b!131483 m!154417))

(declare-fun m!154855 () Bool)

(assert (=> b!131483 m!154855))

(declare-fun m!154857 () Bool)

(assert (=> b!131483 m!154857))

(assert (=> b!131483 m!154831))

(assert (=> b!131483 m!154839))

(declare-fun m!154859 () Bool)

(assert (=> b!131483 m!154859))

(assert (=> d!40083 m!154443))

(declare-fun m!154861 () Bool)

(assert (=> b!131470 m!154861))

(assert (=> b!131474 m!154417))

(assert (=> b!131474 m!154417))

(assert (=> b!131474 m!154419))

(declare-fun m!154863 () Bool)

(assert (=> bm!14359 m!154863))

(declare-fun m!154865 () Bool)

(assert (=> b!131479 m!154865))

(assert (=> b!131479 m!154493))

(declare-fun m!154867 () Bool)

(assert (=> b!131479 m!154867))

(assert (=> b!131479 m!154417))

(assert (=> b!131479 m!154493))

(assert (=> b!131479 m!154865))

(assert (=> b!131479 m!154417))

(declare-fun m!154869 () Bool)

(assert (=> b!131479 m!154869))

(declare-fun m!154871 () Bool)

(assert (=> bm!14364 m!154871))

(assert (=> bm!14362 m!154857))

(assert (=> b!131473 m!154417))

(assert (=> b!131473 m!154417))

(declare-fun m!154873 () Bool)

(assert (=> b!131473 m!154873))

(declare-fun m!154875 () Bool)

(assert (=> b!131465 m!154875))

(declare-fun m!154877 () Bool)

(assert (=> bm!14365 m!154877))

(declare-fun m!154879 () Bool)

(assert (=> b!131484 m!154879))

(assert (=> bm!14298 d!40083))

(declare-fun d!40085 () Bool)

(assert (=> d!40085 (= (apply!114 lt!68165 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1469 (getValueByKey!168 (toList!848 lt!68165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5445 () Bool)

(assert (= bs!5445 d!40085))

(assert (=> bs!5445 m!154825))

(assert (=> bs!5445 m!154825))

(declare-fun m!154881 () Bool)

(assert (=> bs!5445 m!154881))

(assert (=> b!131175 d!40085))

(declare-fun d!40087 () Bool)

(assert (=> d!40087 (= (map!1384 (_2!1299 lt!68100)) (getCurrentListMap!516 (_keys!4586 (_2!1299 lt!68100)) (_values!2825 (_2!1299 lt!68100)) (mask!7129 (_2!1299 lt!68100)) (extraKeys!2611 (_2!1299 lt!68100)) (zeroValue!2699 (_2!1299 lt!68100)) (minValue!2699 (_2!1299 lt!68100)) #b00000000000000000000000000000000 (defaultEntry!2842 (_2!1299 lt!68100))))))

(declare-fun bs!5446 () Bool)

(assert (= bs!5446 d!40087))

(declare-fun m!154883 () Bool)

(assert (=> bs!5446 m!154883))

(assert (=> bm!14290 d!40087))

(declare-fun d!40089 () Bool)

(declare-fun res!63312 () Bool)

(declare-fun e!85737 () Bool)

(assert (=> d!40089 (=> (not res!63312) (not e!85737))))

(assert (=> d!40089 (= res!63312 (simpleValid!90 (_2!1299 lt!68100)))))

(assert (=> d!40089 (= (valid!523 (_2!1299 lt!68100)) e!85737)))

(declare-fun b!131486 () Bool)

(declare-fun res!63313 () Bool)

(assert (=> b!131486 (=> (not res!63313) (not e!85737))))

(assert (=> b!131486 (= res!63313 (= (arrayCountValidKeys!0 (_keys!4586 (_2!1299 lt!68100)) #b00000000000000000000000000000000 (size!2504 (_keys!4586 (_2!1299 lt!68100)))) (_size!591 (_2!1299 lt!68100))))))

(declare-fun b!131487 () Bool)

(declare-fun res!63314 () Bool)

(assert (=> b!131487 (=> (not res!63314) (not e!85737))))

(assert (=> b!131487 (= res!63314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4586 (_2!1299 lt!68100)) (mask!7129 (_2!1299 lt!68100))))))

(declare-fun b!131488 () Bool)

(assert (=> b!131488 (= e!85737 (arrayNoDuplicates!0 (_keys!4586 (_2!1299 lt!68100)) #b00000000000000000000000000000000 Nil!1702))))

(assert (= (and d!40089 res!63312) b!131486))

(assert (= (and b!131486 res!63313) b!131487))

(assert (= (and b!131487 res!63314) b!131488))

(declare-fun m!154885 () Bool)

(assert (=> d!40089 m!154885))

(declare-fun m!154887 () Bool)

(assert (=> b!131486 m!154887))

(declare-fun m!154889 () Bool)

(assert (=> b!131487 m!154889))

(declare-fun m!154891 () Bool)

(assert (=> b!131488 m!154891))

(assert (=> d!39955 d!40089))

(assert (=> d!39955 d!39977))

(declare-fun bm!14374 () Bool)

(declare-fun call!14380 () Bool)

(declare-fun call!14379 () Bool)

(assert (=> bm!14374 (= call!14380 call!14379)))

(declare-fun b!131523 () Bool)

(declare-fun res!63337 () Bool)

(declare-fun e!85754 () Bool)

(assert (=> b!131523 (=> (not res!63337) (not e!85754))))

(declare-fun lt!68462 () tuple2!2576)

(assert (=> b!131523 (= res!63337 (valid!523 (_2!1299 lt!68462)))))

(declare-fun b!131525 () Bool)

(declare-fun e!85760 () Bool)

(declare-fun call!14378 () Bool)

(assert (=> b!131525 (= e!85760 (not call!14378))))

(declare-fun b!131526 () Bool)

(declare-fun res!63334 () Bool)

(assert (=> b!131526 (= res!63334 call!14379)))

(declare-fun e!85757 () Bool)

(assert (=> b!131526 (=> (not res!63334) (not e!85757))))

(declare-fun b!131527 () Bool)

(declare-fun lt!68453 () SeekEntryResult!276)

(assert (=> b!131527 (= e!85757 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3263 lt!68453)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131528 () Bool)

(declare-fun e!85758 () Bool)

(assert (=> b!131528 (= e!85758 e!85760)))

(declare-fun res!63341 () Bool)

(assert (=> b!131528 (= res!63341 call!14380)))

(assert (=> b!131528 (=> (not res!63341) (not e!85760))))

(declare-fun lt!68461 () SeekEntryResult!276)

(declare-fun c!24332 () Bool)

(declare-fun c!24331 () Bool)

(declare-fun bm!14375 () Bool)

(assert (=> bm!14375 (= call!14379 (inRange!0 (ite c!24331 (index!3263 lt!68453) (ite c!24332 (index!3262 lt!68461) (index!3265 lt!68461))) (mask!7129 newMap!16)))))

(declare-fun call!14377 () SeekEntryResult!276)

(declare-fun bm!14376 () Bool)

(assert (=> bm!14376 (= call!14377 (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (mask!7129 newMap!16)))))

(declare-fun b!131529 () Bool)

(declare-fun e!85755 () Unit!4094)

(declare-fun Unit!4110 () Unit!4094)

(assert (=> b!131529 (= e!85755 Unit!4110)))

(declare-fun lt!68457 () Unit!4094)

(declare-fun lemmaArrayContainsKeyThenInListMap!40 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) (_ BitVec 32) Int) Unit!4094)

(assert (=> b!131529 (= lt!68457 (lemmaArrayContainsKeyThenInListMap!40 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(assert (=> b!131529 (contains!880 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355))))

(declare-fun lt!68466 () Unit!4094)

(assert (=> b!131529 (= lt!68466 lt!68457)))

(assert (=> b!131529 false))

(declare-fun b!131530 () Bool)

(declare-fun c!24334 () Bool)

(assert (=> b!131530 (= c!24334 ((_ is MissingVacant!276) lt!68461))))

(declare-fun e!85761 () Bool)

(assert (=> b!131530 (= e!85761 e!85758)))

(declare-fun b!131531 () Bool)

(declare-fun res!63336 () Bool)

(assert (=> b!131531 (=> (not res!63336) (not e!85754))))

(assert (=> b!131531 (= res!63336 (contains!880 (map!1384 (_2!1299 lt!68462)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!131532 () Bool)

(declare-fun Unit!4111 () Unit!4094)

(assert (=> b!131532 (= e!85755 Unit!4111)))

(declare-fun d!40091 () Bool)

(assert (=> d!40091 e!85754))

(declare-fun res!63333 () Bool)

(assert (=> d!40091 (=> (not res!63333) (not e!85754))))

(assert (=> d!40091 (= res!63333 (_1!1299 lt!68462))))

(assert (=> d!40091 (= lt!68462 (tuple2!2577 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (bvadd (_size!591 newMap!16) #b00000000000000000000000000000001) (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))) (_vacant!591 newMap!16))))))

(declare-fun lt!68472 () Unit!4094)

(declare-fun lt!68459 () Unit!4094)

(assert (=> d!40091 (= lt!68472 lt!68459)))

(declare-fun lt!68481 () array!4729)

(declare-fun lt!68458 () array!4731)

(assert (=> d!40091 (contains!880 (getCurrentListMap!516 lt!68481 lt!68458 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114))))))

(assert (=> d!40091 (= lt!68459 (lemmaValidKeyInArrayIsInListMap!118 lt!68481 lt!68458 (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40091 (= lt!68458 (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))))))

(assert (=> d!40091 (= lt!68481 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun lt!68460 () Unit!4094)

(declare-fun lt!68477 () Unit!4094)

(assert (=> d!40091 (= lt!68460 lt!68477)))

(declare-fun lt!68470 () array!4729)

(assert (=> d!40091 (= (arrayCountValidKeys!0 lt!68470 (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (bvadd (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4729 (_ BitVec 32)) Unit!4094)

(assert (=> d!40091 (= lt!68477 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68470 (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114))))))

(assert (=> d!40091 (= lt!68470 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun lt!68464 () Unit!4094)

(declare-fun lt!68469 () Unit!4094)

(assert (=> d!40091 (= lt!68464 lt!68469)))

(declare-fun lt!68454 () array!4729)

(assert (=> d!40091 (arrayContainsKey!0 lt!68454 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!40091 (= lt!68469 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68454 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114))))))

(assert (=> d!40091 (= lt!68454 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))))))

(declare-fun lt!68480 () Unit!4094)

(declare-fun lt!68468 () Unit!4094)

(assert (=> d!40091 (= lt!68480 lt!68468)))

(assert (=> d!40091 (= (+!161 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))) (array!4732 (store (arr!2237 (_values!2825 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (ValueCellFull!1088 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2505 (_values!2825 newMap!16))) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!40 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4094)

(assert (=> d!40091 (= lt!68468 (lemmaAddValidKeyToArrayThenAddPairToListMap!40 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68478 () Unit!4094)

(declare-fun lt!68456 () Unit!4094)

(assert (=> d!40091 (= lt!68478 lt!68456)))

(assert (=> d!40091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))) (mask!7129 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4729 (_ BitVec 32) (_ BitVec 32)) Unit!4094)

(assert (=> d!40091 (= lt!68456 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (_keys!4586 newMap!16) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (mask!7129 newMap!16)))))

(declare-fun lt!68473 () Unit!4094)

(declare-fun lt!68479 () Unit!4094)

(assert (=> d!40091 (= lt!68473 lt!68479)))

(assert (=> d!40091 (= (arrayCountValidKeys!0 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))) #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4586 newMap!16) #b00000000000000000000000000000000 (size!2504 (_keys!4586 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4729 (_ BitVec 32) (_ BitVec 64)) Unit!4094)

(assert (=> d!40091 (= lt!68479 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4586 newMap!16) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!68467 () Unit!4094)

(declare-fun lt!68471 () Unit!4094)

(assert (=> d!40091 (= lt!68467 lt!68471)))

(declare-fun lt!68452 () (_ BitVec 32))

(declare-fun lt!68455 () List!1705)

(assert (=> d!40091 (arrayNoDuplicates!0 (array!4730 (store (arr!2236 (_keys!4586 newMap!16)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)) (size!2504 (_keys!4586 newMap!16))) lt!68452 lt!68455)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1705) Unit!4094)

(assert (=> d!40091 (= lt!68471 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114)) lt!68452 lt!68455))))

(assert (=> d!40091 (= lt!68455 Nil!1702)))

(assert (=> d!40091 (= lt!68452 #b00000000000000000000000000000000)))

(declare-fun lt!68475 () Unit!4094)

(assert (=> d!40091 (= lt!68475 e!85755)))

(declare-fun c!24333 () Bool)

(assert (=> d!40091 (= c!24333 (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68463 () Unit!4094)

(declare-fun e!85756 () Unit!4094)

(assert (=> d!40091 (= lt!68463 e!85756)))

(assert (=> d!40091 (= c!24331 (contains!880 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!40091 (valid!523 newMap!16)))

(assert (=> d!40091 (= (updateHelperNewKey!59 newMap!16 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24223 (index!3265 lt!68114) (index!3262 lt!68114))) lt!68462)))

(declare-fun b!131524 () Bool)

(assert (=> b!131524 (= e!85758 ((_ is Undefined!276) lt!68461))))

(declare-fun b!131533 () Bool)

(declare-fun res!63340 () Bool)

(declare-fun e!85759 () Bool)

(assert (=> b!131533 (=> (not res!63340) (not e!85759))))

(assert (=> b!131533 (= res!63340 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3262 lt!68461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131534 () Bool)

(declare-fun res!63338 () Bool)

(assert (=> b!131534 (=> (not res!63338) (not e!85759))))

(assert (=> b!131534 (= res!63338 call!14380)))

(assert (=> b!131534 (= e!85761 e!85759)))

(declare-fun b!131535 () Bool)

(declare-fun Unit!4112 () Unit!4094)

(assert (=> b!131535 (= e!85756 Unit!4112)))

(declare-fun lt!68476 () Unit!4094)

(assert (=> b!131535 (= lt!68476 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131535 (= lt!68453 call!14377)))

(declare-fun res!63335 () Bool)

(assert (=> b!131535 (= res!63335 ((_ is Found!276) lt!68453))))

(assert (=> b!131535 (=> (not res!63335) (not e!85757))))

(assert (=> b!131535 e!85757))

(declare-fun lt!68474 () Unit!4094)

(assert (=> b!131535 (= lt!68474 lt!68476)))

(assert (=> b!131535 false))

(declare-fun b!131536 () Bool)

(declare-fun res!63339 () Bool)

(assert (=> b!131536 (= res!63339 (= (select (arr!2236 (_keys!4586 newMap!16)) (index!3265 lt!68461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131536 (=> (not res!63339) (not e!85760))))

(declare-fun bm!14377 () Bool)

(assert (=> bm!14377 (= call!14378 (arrayContainsKey!0 (_keys!4586 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131537 () Bool)

(declare-fun lt!68465 () Unit!4094)

(assert (=> b!131537 (= e!85756 lt!68465)))

(assert (=> b!131537 (= lt!68465 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131537 (= lt!68461 call!14377)))

(assert (=> b!131537 (= c!24332 ((_ is MissingZero!276) lt!68461))))

(assert (=> b!131537 e!85761))

(declare-fun b!131538 () Bool)

(assert (=> b!131538 (= e!85754 (= (map!1384 (_2!1299 lt!68462)) (+!161 (map!1384 newMap!16) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!131539 () Bool)

(assert (=> b!131539 (= e!85759 (not call!14378))))

(assert (= (and d!40091 c!24331) b!131535))

(assert (= (and d!40091 (not c!24331)) b!131537))

(assert (= (and b!131535 res!63335) b!131526))

(assert (= (and b!131526 res!63334) b!131527))

(assert (= (and b!131537 c!24332) b!131534))

(assert (= (and b!131537 (not c!24332)) b!131530))

(assert (= (and b!131534 res!63338) b!131533))

(assert (= (and b!131533 res!63340) b!131539))

(assert (= (and b!131530 c!24334) b!131528))

(assert (= (and b!131530 (not c!24334)) b!131524))

(assert (= (and b!131528 res!63341) b!131536))

(assert (= (and b!131536 res!63339) b!131525))

(assert (= (or b!131534 b!131528) bm!14374))

(assert (= (or b!131539 b!131525) bm!14377))

(assert (= (or b!131526 bm!14374) bm!14375))

(assert (= (or b!131535 b!131537) bm!14376))

(assert (= (and d!40091 c!24333) b!131529))

(assert (= (and d!40091 (not c!24333)) b!131532))

(assert (= (and d!40091 res!63333) b!131523))

(assert (= (and b!131523 res!63337) b!131531))

(assert (= (and b!131531 res!63336) b!131538))

(declare-fun m!154893 () Bool)

(assert (=> b!131533 m!154893))

(declare-fun m!154895 () Bool)

(assert (=> b!131527 m!154895))

(assert (=> d!40091 m!154171))

(declare-fun m!154897 () Bool)

(assert (=> d!40091 m!154897))

(assert (=> d!40091 m!154291))

(assert (=> d!40091 m!154451))

(assert (=> d!40091 m!154291))

(assert (=> d!40091 m!154171))

(declare-fun m!154899 () Bool)

(assert (=> d!40091 m!154899))

(assert (=> d!40091 m!154171))

(declare-fun m!154901 () Bool)

(assert (=> d!40091 m!154901))

(assert (=> d!40091 m!154171))

(assert (=> d!40091 m!154307))

(declare-fun m!154903 () Bool)

(assert (=> d!40091 m!154903))

(assert (=> d!40091 m!154165))

(assert (=> d!40091 m!154291))

(declare-fun m!154905 () Bool)

(assert (=> d!40091 m!154905))

(declare-fun m!154907 () Bool)

(assert (=> d!40091 m!154907))

(assert (=> d!40091 m!154171))

(assert (=> d!40091 m!154187))

(declare-fun m!154909 () Bool)

(assert (=> d!40091 m!154909))

(assert (=> d!40091 m!154407))

(declare-fun m!154911 () Bool)

(assert (=> d!40091 m!154911))

(declare-fun m!154913 () Bool)

(assert (=> d!40091 m!154913))

(assert (=> d!40091 m!154171))

(declare-fun m!154915 () Bool)

(assert (=> d!40091 m!154915))

(declare-fun m!154917 () Bool)

(assert (=> d!40091 m!154917))

(declare-fun m!154919 () Bool)

(assert (=> d!40091 m!154919))

(declare-fun m!154921 () Bool)

(assert (=> d!40091 m!154921))

(declare-fun m!154923 () Bool)

(assert (=> d!40091 m!154923))

(assert (=> d!40091 m!154913))

(declare-fun m!154925 () Bool)

(assert (=> d!40091 m!154925))

(assert (=> d!40091 m!154923))

(assert (=> d!40091 m!154171))

(declare-fun m!154927 () Bool)

(assert (=> d!40091 m!154927))

(assert (=> d!40091 m!154171))

(declare-fun m!154929 () Bool)

(assert (=> d!40091 m!154929))

(declare-fun m!154931 () Bool)

(assert (=> d!40091 m!154931))

(declare-fun m!154933 () Bool)

(assert (=> d!40091 m!154933))

(declare-fun m!154935 () Bool)

(assert (=> bm!14375 m!154935))

(assert (=> bm!14376 m!154171))

(assert (=> bm!14376 m!154287))

(assert (=> b!131537 m!154171))

(assert (=> b!131537 m!154305))

(assert (=> bm!14377 m!154171))

(assert (=> bm!14377 m!154307))

(declare-fun m!154937 () Bool)

(assert (=> b!131523 m!154937))

(declare-fun m!154939 () Bool)

(assert (=> b!131538 m!154939))

(assert (=> b!131538 m!154173))

(assert (=> b!131538 m!154173))

(declare-fun m!154941 () Bool)

(assert (=> b!131538 m!154941))

(declare-fun m!154943 () Bool)

(assert (=> b!131536 m!154943))

(assert (=> b!131531 m!154939))

(assert (=> b!131531 m!154939))

(assert (=> b!131531 m!154171))

(declare-fun m!154945 () Bool)

(assert (=> b!131531 m!154945))

(assert (=> b!131535 m!154171))

(assert (=> b!131535 m!154323))

(assert (=> b!131529 m!154171))

(declare-fun m!154947 () Bool)

(assert (=> b!131529 m!154947))

(assert (=> b!131529 m!154291))

(assert (=> b!131529 m!154291))

(assert (=> b!131529 m!154171))

(assert (=> b!131529 m!154899))

(assert (=> bm!14280 d!40091))

(assert (=> b!131070 d!40055))

(assert (=> bm!14297 d!39959))

(declare-fun d!40093 () Bool)

(declare-fun e!85762 () Bool)

(assert (=> d!40093 e!85762))

(declare-fun res!63343 () Bool)

(assert (=> d!40093 (=> (not res!63343) (not e!85762))))

(declare-fun lt!68485 () ListLongMap!1665)

(assert (=> d!40093 (= res!63343 (contains!880 lt!68485 (_1!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68482 () List!1704)

(assert (=> d!40093 (= lt!68485 (ListLongMap!1666 lt!68482))))

(declare-fun lt!68483 () Unit!4094)

(declare-fun lt!68484 () Unit!4094)

(assert (=> d!40093 (= lt!68483 lt!68484)))

(assert (=> d!40093 (= (getValueByKey!168 lt!68482 (_1!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40093 (= lt!68484 (lemmaContainsTupThenGetReturnValue!86 lt!68482 (_1!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40093 (= lt!68482 (insertStrictlySorted!89 (toList!848 call!14297) (_1!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40093 (= (+!161 call!14297 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!68485)))

(declare-fun b!131540 () Bool)

(declare-fun res!63342 () Bool)

(assert (=> b!131540 (=> (not res!63342) (not e!85762))))

(assert (=> b!131540 (= res!63342 (= (getValueByKey!168 (toList!848 lt!68485) (_1!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1298 (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!131541 () Bool)

(assert (=> b!131541 (= e!85762 (contains!882 (toList!848 lt!68485) (tuple2!2575 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) from!355) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40093 res!63343) b!131540))

(assert (= (and b!131540 res!63342) b!131541))

(declare-fun m!154949 () Bool)

(assert (=> d!40093 m!154949))

(declare-fun m!154951 () Bool)

(assert (=> d!40093 m!154951))

(declare-fun m!154953 () Bool)

(assert (=> d!40093 m!154953))

(declare-fun m!154955 () Bool)

(assert (=> d!40093 m!154955))

(declare-fun m!154957 () Bool)

(assert (=> b!131540 m!154957))

(declare-fun m!154959 () Bool)

(assert (=> b!131541 m!154959))

(assert (=> b!131068 d!40093))

(declare-fun d!40095 () Bool)

(assert (=> d!40095 (arrayContainsKey!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000)))

(declare-fun lt!68488 () Unit!4094)

(declare-fun choose!13 (array!4729 (_ BitVec 64) (_ BitVec 32)) Unit!4094)

(assert (=> d!40095 (= lt!68488 (choose!13 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000))))

(assert (=> d!40095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!40095 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000) lt!68488)))

(declare-fun bs!5447 () Bool)

(assert (= bs!5447 d!40095))

(assert (=> bs!5447 m!154399))

(declare-fun m!154961 () Bool)

(assert (=> bs!5447 m!154961))

(assert (=> b!131187 d!40095))

(declare-fun d!40097 () Bool)

(declare-fun res!63344 () Bool)

(declare-fun e!85763 () Bool)

(assert (=> d!40097 (=> res!63344 e!85763)))

(assert (=> d!40097 (= res!63344 (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) lt!68190))))

(assert (=> d!40097 (= (arrayContainsKey!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 #b00000000000000000000000000000000) e!85763)))

(declare-fun b!131542 () Bool)

(declare-fun e!85764 () Bool)

(assert (=> b!131542 (= e!85763 e!85764)))

(declare-fun res!63345 () Bool)

(assert (=> b!131542 (=> (not res!63345) (not e!85764))))

(assert (=> b!131542 (= res!63345 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))))

(declare-fun b!131543 () Bool)

(assert (=> b!131543 (= e!85764 (arrayContainsKey!0 (_keys!4586 (v!3169 (underlying!445 thiss!992))) lt!68190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40097 (not res!63344)) b!131542))

(assert (= (and b!131542 res!63345) b!131543))

(assert (=> d!40097 m!154395))

(declare-fun m!154963 () Bool)

(assert (=> b!131543 m!154963))

(assert (=> b!131187 d!40097))

(declare-fun b!131544 () Bool)

(declare-fun e!85765 () SeekEntryResult!276)

(declare-fun lt!68490 () SeekEntryResult!276)

(assert (=> b!131544 (= e!85765 (Found!276 (index!3264 lt!68490)))))

(declare-fun b!131545 () Bool)

(declare-fun e!85767 () SeekEntryResult!276)

(assert (=> b!131545 (= e!85767 e!85765)))

(declare-fun lt!68489 () (_ BitVec 64))

(assert (=> b!131545 (= lt!68489 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (index!3264 lt!68490)))))

(declare-fun c!24335 () Bool)

(assert (=> b!131545 (= c!24335 (= lt!68489 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131546 () Bool)

(declare-fun e!85766 () SeekEntryResult!276)

(assert (=> b!131546 (= e!85766 (MissingZero!276 (index!3264 lt!68490)))))

(declare-fun d!40099 () Bool)

(declare-fun lt!68491 () SeekEntryResult!276)

(assert (=> d!40099 (and (or ((_ is Undefined!276) lt!68491) (not ((_ is Found!276) lt!68491)) (and (bvsge (index!3263 lt!68491) #b00000000000000000000000000000000) (bvslt (index!3263 lt!68491) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))) (or ((_ is Undefined!276) lt!68491) ((_ is Found!276) lt!68491) (not ((_ is MissingZero!276) lt!68491)) (and (bvsge (index!3262 lt!68491) #b00000000000000000000000000000000) (bvslt (index!3262 lt!68491) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))) (or ((_ is Undefined!276) lt!68491) ((_ is Found!276) lt!68491) ((_ is MissingZero!276) lt!68491) (not ((_ is MissingVacant!276) lt!68491)) (and (bvsge (index!3265 lt!68491) #b00000000000000000000000000000000) (bvslt (index!3265 lt!68491) (size!2504 (_keys!4586 (v!3169 (underlying!445 thiss!992))))))) (or ((_ is Undefined!276) lt!68491) (ite ((_ is Found!276) lt!68491) (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (index!3263 lt!68491)) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!276) lt!68491) (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (index!3262 lt!68491)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!276) lt!68491) (= (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) (index!3265 lt!68491)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40099 (= lt!68491 e!85767)))

(declare-fun c!24337 () Bool)

(assert (=> d!40099 (= c!24337 (and ((_ is Intermediate!276) lt!68490) (undefined!1088 lt!68490)))))

(assert (=> d!40099 (= lt!68490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (mask!7129 (v!3169 (underlying!445 thiss!992)))) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(assert (=> d!40099 (validMask!0 (mask!7129 (v!3169 (underlying!445 thiss!992))))))

(assert (=> d!40099 (= (seekEntryOrOpen!0 (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))) lt!68491)))

(declare-fun b!131547 () Bool)

(assert (=> b!131547 (= e!85767 Undefined!276)))

(declare-fun b!131548 () Bool)

(declare-fun c!24336 () Bool)

(assert (=> b!131548 (= c!24336 (= lt!68489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131548 (= e!85765 e!85766)))

(declare-fun b!131549 () Bool)

(assert (=> b!131549 (= e!85766 (seekKeyOrZeroReturnVacant!0 (x!15414 lt!68490) (index!3264 lt!68490) (index!3264 lt!68490) (select (arr!2236 (_keys!4586 (v!3169 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (_keys!4586 (v!3169 (underlying!445 thiss!992))) (mask!7129 (v!3169 (underlying!445 thiss!992)))))))

(assert (= (and d!40099 c!24337) b!131547))

(assert (= (and d!40099 (not c!24337)) b!131545))

(assert (= (and b!131545 c!24335) b!131544))

(assert (= (and b!131545 (not c!24335)) b!131548))

(assert (= (and b!131548 c!24336) b!131546))

(assert (= (and b!131548 (not c!24336)) b!131549))

(declare-fun m!154965 () Bool)

(assert (=> b!131545 m!154965))

(assert (=> d!40099 m!154167))

(declare-fun m!154967 () Bool)

(assert (=> d!40099 m!154967))

(declare-fun m!154969 () Bool)

(assert (=> d!40099 m!154969))

(assert (=> d!40099 m!154395))

(declare-fun m!154971 () Bool)

(assert (=> d!40099 m!154971))

(assert (=> d!40099 m!154395))

(assert (=> d!40099 m!154969))

(declare-fun m!154973 () Bool)

(assert (=> d!40099 m!154973))

(declare-fun m!154975 () Bool)

(assert (=> d!40099 m!154975))

(assert (=> b!131549 m!154395))

(declare-fun m!154977 () Bool)

(assert (=> b!131549 m!154977))

(assert (=> b!131187 d!40099))

(assert (=> bm!14321 d!40027))

(assert (=> d!39961 d!39963))

(declare-fun d!40101 () Bool)

(assert (=> d!40101 (= (+!161 (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2575 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) lt!68112 (zeroValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68494 () Unit!4094)

(declare-fun choose!814 (array!4729 array!4731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4094)

(assert (=> d!40101 (= lt!68494 (choose!814 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68112 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40101 (validMask!0 (mask!7129 newMap!16))))

(assert (=> d!40101 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4586 newMap!16) (_values!2825 newMap!16) (mask!7129 newMap!16) (extraKeys!2611 newMap!16) lt!68112 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1466 (select (arr!2237 (_values!2825 (v!3169 (underlying!445 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)) lt!68494)))

(declare-fun bs!5448 () Bool)

(assert (= bs!5448 d!40101))

(assert (=> bs!5448 m!154187))

(declare-fun m!154979 () Bool)

(assert (=> bs!5448 m!154979))

(assert (=> bs!5448 m!154291))

(assert (=> bs!5448 m!154443))

(assert (=> bs!5448 m!154291))

(declare-fun m!154981 () Bool)

(assert (=> bs!5448 m!154981))

(assert (=> bs!5448 m!154187))

(declare-fun m!154983 () Bool)

(assert (=> bs!5448 m!154983))

(assert (=> b!131092 d!40101))

(declare-fun mapNonEmpty!4607 () Bool)

(declare-fun mapRes!4607 () Bool)

(declare-fun tp!11141 () Bool)

(declare-fun e!85769 () Bool)

(assert (=> mapNonEmpty!4607 (= mapRes!4607 (and tp!11141 e!85769))))

(declare-fun mapValue!4607 () ValueCell!1088)

(declare-fun mapKey!4607 () (_ BitVec 32))

(declare-fun mapRest!4607 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4607 (= mapRest!4605 (store mapRest!4607 mapKey!4607 mapValue!4607))))

(declare-fun condMapEmpty!4607 () Bool)

(declare-fun mapDefault!4607 () ValueCell!1088)

(assert (=> mapNonEmpty!4605 (= condMapEmpty!4607 (= mapRest!4605 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4607)))))

(declare-fun e!85768 () Bool)

(assert (=> mapNonEmpty!4605 (= tp!11139 (and e!85768 mapRes!4607))))

(declare-fun mapIsEmpty!4607 () Bool)

(assert (=> mapIsEmpty!4607 mapRes!4607))

(declare-fun b!131551 () Bool)

(assert (=> b!131551 (= e!85768 tp_is_empty!2863)))

(declare-fun b!131550 () Bool)

(assert (=> b!131550 (= e!85769 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4605 condMapEmpty!4607) mapIsEmpty!4607))

(assert (= (and mapNonEmpty!4605 (not condMapEmpty!4607)) mapNonEmpty!4607))

(assert (= (and mapNonEmpty!4607 ((_ is ValueCellFull!1088) mapValue!4607)) b!131550))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1088) mapDefault!4607)) b!131551))

(declare-fun m!154985 () Bool)

(assert (=> mapNonEmpty!4607 m!154985))

(declare-fun mapNonEmpty!4608 () Bool)

(declare-fun mapRes!4608 () Bool)

(declare-fun tp!11142 () Bool)

(declare-fun e!85771 () Bool)

(assert (=> mapNonEmpty!4608 (= mapRes!4608 (and tp!11142 e!85771))))

(declare-fun mapKey!4608 () (_ BitVec 32))

(declare-fun mapValue!4608 () ValueCell!1088)

(declare-fun mapRest!4608 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4608 (= mapRest!4606 (store mapRest!4608 mapKey!4608 mapValue!4608))))

(declare-fun condMapEmpty!4608 () Bool)

(declare-fun mapDefault!4608 () ValueCell!1088)

(assert (=> mapNonEmpty!4606 (= condMapEmpty!4608 (= mapRest!4606 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4608)))))

(declare-fun e!85770 () Bool)

(assert (=> mapNonEmpty!4606 (= tp!11140 (and e!85770 mapRes!4608))))

(declare-fun mapIsEmpty!4608 () Bool)

(assert (=> mapIsEmpty!4608 mapRes!4608))

(declare-fun b!131553 () Bool)

(assert (=> b!131553 (= e!85770 tp_is_empty!2863)))

(declare-fun b!131552 () Bool)

(assert (=> b!131552 (= e!85771 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4606 condMapEmpty!4608) mapIsEmpty!4608))

(assert (= (and mapNonEmpty!4606 (not condMapEmpty!4608)) mapNonEmpty!4608))

(assert (= (and mapNonEmpty!4608 ((_ is ValueCellFull!1088) mapValue!4608)) b!131552))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1088) mapDefault!4608)) b!131553))

(declare-fun m!154987 () Bool)

(assert (=> mapNonEmpty!4608 m!154987))

(declare-fun b_lambda!5843 () Bool)

(assert (= b_lambda!5841 (or (and b!130843 b_free!2893 (= (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130856 b_free!2895) b_lambda!5843)))

(declare-fun b_lambda!5845 () Bool)

(assert (= b_lambda!5835 (or (and b!130843 b_free!2893) (and b!130856 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))))) b_lambda!5845)))

(declare-fun b_lambda!5847 () Bool)

(assert (= b_lambda!5837 (or (and b!130843 b_free!2893) (and b!130856 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))))) b_lambda!5847)))

(declare-fun b_lambda!5849 () Bool)

(assert (= b_lambda!5839 (or (and b!130843 b_free!2893 (= (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130856 b_free!2895) b_lambda!5849)))

(declare-fun b_lambda!5851 () Bool)

(assert (= b_lambda!5833 (or (and b!130843 b_free!2893 (= (defaultEntry!2842 (v!3169 (underlying!445 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130856 b_free!2895) b_lambda!5851)))

(check-sat (not d!40043) (not b!131254) (not d!40091) (not d!40023) (not b_next!2893) (not b!131484) (not b!131251) (not bm!14336) (not b!131336) (not b!131335) (not d!40067) (not b!131487) (not d!40095) (not d!40053) (not b!131538) (not d!40009) (not b!131226) (not b!131540) (not d!39985) (not b!131354) (not b!131451) (not d!40077) (not b!131249) (not b!131460) (not b!131356) (not b!131297) (not b!131273) (not d!39997) (not bm!14356) (not b!131340) (not bm!14347) (not bm!14350) (not b!131422) (not b!131455) (not d!40011) (not d!40029) (not b!131265) (not b!131488) b_and!8129 (not b!131235) (not b!131433) (not b!131462) (not b!131543) (not b!131228) (not b_lambda!5849) (not bm!14365) (not b!131394) (not b!131349) (not mapNonEmpty!4608) (not b!131276) (not b!131421) (not bm!14349) (not d!40081) (not b!131362) (not d!40021) (not d!39989) (not b!131295) (not b!131464) (not b!131231) (not b_lambda!5827) (not b!131333) (not d!39995) (not d!40041) (not bm!14337) (not b!131529) (not b!131293) (not b!131359) (not d!40073) (not b!131541) (not b!131418) (not d!40019) (not b!131281) (not b!131240) (not b!131339) (not bm!14377) (not b!131454) (not d!40085) (not b!131253) (not b_next!2895) (not b_lambda!5831) (not b!131549) (not b!131392) (not b!131345) (not d!40033) (not b!131483) (not b!131284) (not d!40027) (not b!131324) (not bm!14375) (not d!39987) (not b!131457) (not d!40101) (not b!131289) (not d!40049) (not bm!14331) (not d!40007) (not b!131234) b_and!8131 (not b!131327) (not bm!14359) (not bm!14357) (not bm!14343) (not b!131361) (not d!40083) tp_is_empty!2863 (not d!40031) (not bm!14344) (not b!131486) (not b!131441) (not d!39983) (not b_lambda!5847) (not b!131481) (not b!131459) (not d!40025) (not d!40093) (not bm!14376) (not d!40099) (not d!40087) (not b!131282) (not b!131221) (not b!131274) (not b!131337) (not b!131437) (not b!131393) (not b!131323) (not d!40037) (not d!40005) (not b!131479) (not b!131218) (not d!40017) (not b!131331) (not bm!14362) (not bm!14330) (not b!131473) (not b!131438) (not b!131535) (not bm!14334) (not b!131283) (not bm!14358) (not b!131223) (not b!131294) (not d!40015) (not mapNonEmpty!4607) (not b_lambda!5843) (not b!131461) (not b!131348) (not b!131474) (not d!40003) (not d!40089) (not d!40035) (not b!131465) (not d!40013) (not bm!14340) (not bm!14364) (not b_lambda!5845) (not b!131220) (not b!131290) (not b_lambda!5851) (not b!131452) (not b!131358) (not b!131456) (not b!131399) (not b!131243) (not b!131537) (not b!131531) (not b!131470) (not b!131329) (not d!40075) (not d!40001) (not b!131330) (not d!39981) (not d!40069) (not d!40071) (not d!40055) (not b!131523) (not d!40061) (not b!131244) (not b!131225) (not b!131325) (not bm!14355))
(check-sat b_and!8129 b_and!8131 (not b_next!2893) (not b_next!2895))
