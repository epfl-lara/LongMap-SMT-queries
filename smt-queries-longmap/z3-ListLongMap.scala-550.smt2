; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14588 () Bool)

(assert start!14588)

(declare-fun b!137999 () Bool)

(declare-fun b_free!2993 () Bool)

(declare-fun b_next!2993 () Bool)

(assert (=> b!137999 (= b_free!2993 (not b_next!2993))))

(declare-fun tp!11441 () Bool)

(declare-fun b_and!8595 () Bool)

(assert (=> b!137999 (= tp!11441 b_and!8595)))

(declare-fun b!137992 () Bool)

(declare-fun b_free!2995 () Bool)

(declare-fun b_next!2995 () Bool)

(assert (=> b!137992 (= b_free!2995 (not b_next!2995))))

(declare-fun tp!11442 () Bool)

(declare-fun b_and!8597 () Bool)

(assert (=> b!137992 (= tp!11442 b_and!8597)))

(declare-fun b!137991 () Bool)

(declare-fun e!89965 () Bool)

(declare-fun tp_is_empty!2913 () Bool)

(assert (=> b!137991 (= e!89965 tp_is_empty!2913)))

(declare-datatypes ((V!3531 0))(
  ( (V!3532 (val!1501 Int)) )
))
(declare-datatypes ((array!4857 0))(
  ( (array!4858 (arr!2297 (Array (_ BitVec 32) (_ BitVec 64))) (size!2568 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1113 0))(
  ( (ValueCellFull!1113 (v!3254 V!3531)) (EmptyCell!1113) )
))
(declare-datatypes ((array!4859 0))(
  ( (array!4860 (arr!2298 (Array (_ BitVec 32) ValueCell!1113)) (size!2569 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1134 0))(
  ( (LongMapFixedSize!1135 (defaultEntry!2919 Int) (mask!7249 (_ BitVec 32)) (extraKeys!2676 (_ BitVec 32)) (zeroValue!2770 V!3531) (minValue!2770 V!3531) (_size!616 (_ BitVec 32)) (_keys!4676 array!4857) (_values!2902 array!4859) (_vacant!616 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1134)

(declare-fun e!89975 () Bool)

(declare-fun e!89967 () Bool)

(declare-fun array_inv!1445 (array!4857) Bool)

(declare-fun array_inv!1446 (array!4859) Bool)

(assert (=> b!137992 (= e!89975 (and tp!11442 tp_is_empty!2913 (array_inv!1445 (_keys!4676 newMap!16)) (array_inv!1446 (_values!2902 newMap!16)) e!89967))))

(declare-fun b!137993 () Bool)

(declare-fun e!89970 () Bool)

(assert (=> b!137993 (= e!89970 tp_is_empty!2913)))

(declare-fun mapNonEmpty!4769 () Bool)

(declare-fun mapRes!4770 () Bool)

(declare-fun tp!11439 () Bool)

(assert (=> mapNonEmpty!4769 (= mapRes!4770 (and tp!11439 e!89965))))

(declare-fun mapKey!4770 () (_ BitVec 32))

(declare-fun mapRest!4769 () (Array (_ BitVec 32) ValueCell!1113))

(declare-fun mapValue!4770 () ValueCell!1113)

(assert (=> mapNonEmpty!4769 (= (arr!2298 (_values!2902 newMap!16)) (store mapRest!4769 mapKey!4770 mapValue!4770))))

(declare-fun b!137994 () Bool)

(declare-fun e!89972 () Bool)

(assert (=> b!137994 (= e!89967 (and e!89972 mapRes!4770))))

(declare-fun condMapEmpty!4770 () Bool)

(declare-fun mapDefault!4770 () ValueCell!1113)

(assert (=> b!137994 (= condMapEmpty!4770 (= (arr!2298 (_values!2902 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4770)))))

(declare-fun mapIsEmpty!4769 () Bool)

(assert (=> mapIsEmpty!4769 mapRes!4770))

(declare-fun b!137995 () Bool)

(declare-fun res!66101 () Bool)

(declare-fun e!89964 () Bool)

(assert (=> b!137995 (=> (not res!66101) (not e!89964))))

(declare-datatypes ((Cell!922 0))(
  ( (Cell!923 (v!3255 LongMapFixedSize!1134)) )
))
(declare-datatypes ((LongMap!922 0))(
  ( (LongMap!923 (underlying!472 Cell!922)) )
))
(declare-fun thiss!992 () LongMap!922)

(assert (=> b!137995 (= res!66101 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7249 newMap!16)) (_size!616 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun res!66107 () Bool)

(assert (=> start!14588 (=> (not res!66107) (not e!89964))))

(declare-fun valid!547 (LongMap!922) Bool)

(assert (=> start!14588 (= res!66107 (valid!547 thiss!992))))

(assert (=> start!14588 e!89964))

(declare-fun e!89962 () Bool)

(assert (=> start!14588 e!89962))

(assert (=> start!14588 true))

(assert (=> start!14588 e!89975))

(declare-fun b!137990 () Bool)

(declare-fun res!66106 () Bool)

(assert (=> b!137990 (=> (not res!66106) (not e!89964))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137990 (= res!66106 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun mapNonEmpty!4770 () Bool)

(declare-fun mapRes!4769 () Bool)

(declare-fun tp!11440 () Bool)

(assert (=> mapNonEmpty!4770 (= mapRes!4769 (and tp!11440 e!89970))))

(declare-fun mapValue!4769 () ValueCell!1113)

(declare-fun mapKey!4769 () (_ BitVec 32))

(declare-fun mapRest!4770 () (Array (_ BitVec 32) ValueCell!1113))

(assert (=> mapNonEmpty!4770 (= (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (store mapRest!4770 mapKey!4769 mapValue!4769))))

(declare-fun b!137996 () Bool)

(declare-fun e!89968 () Bool)

(assert (=> b!137996 (= e!89968 tp_is_empty!2913)))

(declare-fun mapIsEmpty!4770 () Bool)

(assert (=> mapIsEmpty!4770 mapRes!4769))

(declare-fun b!137997 () Bool)

(declare-fun e!89976 () Bool)

(assert (=> b!137997 (= e!89962 e!89976)))

(declare-fun b!137998 () Bool)

(declare-fun res!66102 () Bool)

(assert (=> b!137998 (=> (not res!66102) (not e!89964))))

(declare-fun valid!548 (LongMapFixedSize!1134) Bool)

(assert (=> b!137998 (= res!66102 (valid!548 newMap!16))))

(declare-fun e!89974 () Bool)

(declare-fun e!89977 () Bool)

(assert (=> b!137999 (= e!89977 (and tp!11441 tp_is_empty!2913 (array_inv!1445 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (array_inv!1446 (_values!2902 (v!3255 (underlying!472 thiss!992)))) e!89974))))

(declare-fun b!138000 () Bool)

(assert (=> b!138000 (= e!89972 tp_is_empty!2913)))

(declare-fun b!138001 () Bool)

(assert (=> b!138001 (= e!89974 (and e!89968 mapRes!4769))))

(declare-fun condMapEmpty!4769 () Bool)

(declare-fun mapDefault!4769 () ValueCell!1113)

(assert (=> b!138001 (= condMapEmpty!4769 (= (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4769)))))

(declare-fun b!138002 () Bool)

(declare-fun e!89971 () Bool)

(assert (=> b!138002 (= e!89964 e!89971)))

(declare-fun res!66104 () Bool)

(assert (=> b!138002 (=> (not res!66104) (not e!89971))))

(declare-datatypes ((tuple2!2680 0))(
  ( (tuple2!2681 (_1!1351 (_ BitVec 64)) (_2!1351 V!3531)) )
))
(declare-datatypes ((List!1735 0))(
  ( (Nil!1732) (Cons!1731 (h!2338 tuple2!2680) (t!6279 List!1735)) )
))
(declare-datatypes ((ListLongMap!1735 0))(
  ( (ListLongMap!1736 (toList!883 List!1735)) )
))
(declare-fun lt!72061 () ListLongMap!1735)

(declare-fun lt!72063 () ListLongMap!1735)

(assert (=> b!138002 (= res!66104 (and (= lt!72061 lt!72063) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1432 (LongMapFixedSize!1134) ListLongMap!1735)

(assert (=> b!138002 (= lt!72063 (map!1432 newMap!16))))

(declare-fun getCurrentListMap!557 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) Int) ListLongMap!1735)

(assert (=> b!138002 (= lt!72061 (getCurrentListMap!557 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138003 () Bool)

(assert (=> b!138003 (= e!89976 e!89977)))

(declare-fun b!138004 () Bool)

(declare-fun e!89973 () Bool)

(declare-datatypes ((List!1736 0))(
  ( (Nil!1733) (Cons!1732 (h!2339 (_ BitVec 64)) (t!6280 List!1736)) )
))
(declare-fun arrayNoDuplicates!0 (array!4857 (_ BitVec 32) List!1736) Bool)

(assert (=> b!138004 (= e!89973 (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000000 Nil!1733))))

(declare-fun b!138005 () Bool)

(declare-fun e!89963 () Bool)

(assert (=> b!138005 (= e!89971 e!89963)))

(declare-fun res!66105 () Bool)

(assert (=> b!138005 (=> (not res!66105) (not e!89963))))

(declare-fun contains!916 (ListLongMap!1735 (_ BitVec 64)) Bool)

(assert (=> b!138005 (= res!66105 (contains!916 lt!72063 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2682 0))(
  ( (tuple2!2683 (_1!1352 Bool) (_2!1352 LongMapFixedSize!1134)) )
))
(declare-fun lt!72062 () tuple2!2682)

(declare-fun update!207 (LongMapFixedSize!1134 (_ BitVec 64) V!3531) tuple2!2682)

(declare-fun get!1513 (ValueCell!1113 V!3531) V!3531)

(declare-fun dynLambda!438 (Int (_ BitVec 64)) V!3531)

(assert (=> b!138005 (= lt!72062 (update!207 newMap!16 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138006 () Bool)

(assert (=> b!138006 (= e!89963 (not e!89973))))

(declare-fun res!66103 () Bool)

(assert (=> b!138006 (=> res!66103 e!89973)))

(assert (=> b!138006 (= res!66103 (or (bvsge (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))) (bvsgt from!355 (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!4857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138006 (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4344 0))(
  ( (Unit!4345) )
))
(declare-fun lt!72064 () Unit!4344)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!135 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) (_ BitVec 32) Int) Unit!4344)

(assert (=> b!138006 (= lt!72064 (lemmaListMapContainsThenArrayContainsFrom!135 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(assert (= (and start!14588 res!66107) b!137990))

(assert (= (and b!137990 res!66106) b!137998))

(assert (= (and b!137998 res!66102) b!137995))

(assert (= (and b!137995 res!66101) b!138002))

(assert (= (and b!138002 res!66104) b!138005))

(assert (= (and b!138005 res!66105) b!138006))

(assert (= (and b!138006 (not res!66103)) b!138004))

(assert (= (and b!138001 condMapEmpty!4769) mapIsEmpty!4770))

(assert (= (and b!138001 (not condMapEmpty!4769)) mapNonEmpty!4770))

(get-info :version)

(assert (= (and mapNonEmpty!4770 ((_ is ValueCellFull!1113) mapValue!4769)) b!137993))

(assert (= (and b!138001 ((_ is ValueCellFull!1113) mapDefault!4769)) b!137996))

(assert (= b!137999 b!138001))

(assert (= b!138003 b!137999))

(assert (= b!137997 b!138003))

(assert (= start!14588 b!137997))

(assert (= (and b!137994 condMapEmpty!4770) mapIsEmpty!4769))

(assert (= (and b!137994 (not condMapEmpty!4770)) mapNonEmpty!4769))

(assert (= (and mapNonEmpty!4769 ((_ is ValueCellFull!1113) mapValue!4770)) b!137991))

(assert (= (and b!137994 ((_ is ValueCellFull!1113) mapDefault!4770)) b!138000))

(assert (= b!137992 b!137994))

(assert (= start!14588 b!137992))

(declare-fun b_lambda!6177 () Bool)

(assert (=> (not b_lambda!6177) (not b!138005)))

(declare-fun t!6276 () Bool)

(declare-fun tb!2505 () Bool)

(assert (=> (and b!137999 (= (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) t!6276) tb!2505))

(declare-fun result!4115 () Bool)

(assert (=> tb!2505 (= result!4115 tp_is_empty!2913)))

(assert (=> b!138005 t!6276))

(declare-fun b_and!8599 () Bool)

(assert (= b_and!8595 (and (=> t!6276 result!4115) b_and!8599)))

(declare-fun tb!2507 () Bool)

(declare-fun t!6278 () Bool)

(assert (=> (and b!137992 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) t!6278) tb!2507))

(declare-fun result!4119 () Bool)

(assert (= result!4119 result!4115))

(assert (=> b!138005 t!6278))

(declare-fun b_and!8601 () Bool)

(assert (= b_and!8597 (and (=> t!6278 result!4119) b_and!8601)))

(declare-fun m!164791 () Bool)

(assert (=> b!137998 m!164791))

(declare-fun m!164793 () Bool)

(assert (=> start!14588 m!164793))

(declare-fun m!164795 () Bool)

(assert (=> b!138002 m!164795))

(declare-fun m!164797 () Bool)

(assert (=> b!138002 m!164797))

(declare-fun m!164799 () Bool)

(assert (=> b!138002 m!164799))

(declare-fun m!164801 () Bool)

(assert (=> b!137992 m!164801))

(declare-fun m!164803 () Bool)

(assert (=> b!137992 m!164803))

(declare-fun m!164805 () Bool)

(assert (=> b!137999 m!164805))

(declare-fun m!164807 () Bool)

(assert (=> b!137999 m!164807))

(declare-fun m!164809 () Bool)

(assert (=> b!138004 m!164809))

(declare-fun m!164811 () Bool)

(assert (=> b!138005 m!164811))

(declare-fun m!164813 () Bool)

(assert (=> b!138005 m!164813))

(declare-fun m!164815 () Bool)

(assert (=> b!138005 m!164815))

(assert (=> b!138005 m!164795))

(declare-fun m!164817 () Bool)

(assert (=> b!138005 m!164817))

(assert (=> b!138005 m!164795))

(assert (=> b!138005 m!164813))

(assert (=> b!138005 m!164795))

(assert (=> b!138005 m!164815))

(declare-fun m!164819 () Bool)

(assert (=> b!138005 m!164819))

(assert (=> b!138005 m!164811))

(declare-fun m!164821 () Bool)

(assert (=> mapNonEmpty!4769 m!164821))

(assert (=> b!138006 m!164795))

(assert (=> b!138006 m!164795))

(declare-fun m!164823 () Bool)

(assert (=> b!138006 m!164823))

(assert (=> b!138006 m!164795))

(declare-fun m!164825 () Bool)

(assert (=> b!138006 m!164825))

(declare-fun m!164827 () Bool)

(assert (=> mapNonEmpty!4770 m!164827))

(check-sat (not b!138002) (not b!137998) (not mapNonEmpty!4769) (not b!138004) (not b_lambda!6177) (not start!14588) (not mapNonEmpty!4770) b_and!8601 (not b_next!2993) (not b!138006) (not b!137999) (not b!137992) (not b!138005) (not b_next!2995) b_and!8599 tp_is_empty!2913)
(check-sat b_and!8599 b_and!8601 (not b_next!2993) (not b_next!2995))
(get-model)

(declare-fun b_lambda!6181 () Bool)

(assert (= b_lambda!6177 (or (and b!137999 b_free!2993) (and b!137992 b_free!2995 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))))) b_lambda!6181)))

(check-sat (not b_lambda!6181) (not b!138002) (not b!137998) (not mapNonEmpty!4769) (not b!138004) (not start!14588) (not mapNonEmpty!4770) b_and!8601 (not b_next!2993) (not b!138006) (not b!137999) (not b!137992) (not b!138005) (not b_next!2995) b_and!8599 tp_is_empty!2913)
(check-sat b_and!8599 b_and!8601 (not b_next!2993) (not b_next!2995))
(get-model)

(declare-fun d!43085 () Bool)

(assert (=> d!43085 (= (array_inv!1445 (_keys!4676 newMap!16)) (bvsge (size!2568 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!137992 d!43085))

(declare-fun d!43087 () Bool)

(assert (=> d!43087 (= (array_inv!1446 (_values!2902 newMap!16)) (bvsge (size!2569 (_values!2902 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!137992 d!43087))

(declare-fun b!138072 () Bool)

(declare-fun e!90036 () Bool)

(declare-fun contains!917 (List!1736 (_ BitVec 64)) Bool)

(assert (=> b!138072 (= e!90036 (contains!917 Nil!1733 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!15144 () Bool)

(declare-fun call!15147 () Bool)

(declare-fun c!25786 () Bool)

(assert (=> bm!15144 (= call!15147 (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25786 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) Nil!1733) Nil!1733)))))

(declare-fun b!138073 () Bool)

(declare-fun e!90037 () Bool)

(declare-fun e!90035 () Bool)

(assert (=> b!138073 (= e!90037 e!90035)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!138073 (= c!25786 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138074 () Bool)

(assert (=> b!138074 (= e!90035 call!15147)))

(declare-fun b!138076 () Bool)

(assert (=> b!138076 (= e!90035 call!15147)))

(declare-fun d!43089 () Bool)

(declare-fun res!66135 () Bool)

(declare-fun e!90034 () Bool)

(assert (=> d!43089 (=> res!66135 e!90034)))

(assert (=> d!43089 (= res!66135 (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> d!43089 (= (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000000 Nil!1733) e!90034)))

(declare-fun b!138075 () Bool)

(assert (=> b!138075 (= e!90034 e!90037)))

(declare-fun res!66137 () Bool)

(assert (=> b!138075 (=> (not res!66137) (not e!90037))))

(assert (=> b!138075 (= res!66137 (not e!90036))))

(declare-fun res!66136 () Bool)

(assert (=> b!138075 (=> (not res!66136) (not e!90036))))

(assert (=> b!138075 (= res!66136 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!43089 (not res!66135)) b!138075))

(assert (= (and b!138075 res!66136) b!138072))

(assert (= (and b!138075 res!66137) b!138073))

(assert (= (and b!138073 c!25786) b!138076))

(assert (= (and b!138073 (not c!25786)) b!138074))

(assert (= (or b!138076 b!138074) bm!15144))

(declare-fun m!164867 () Bool)

(assert (=> b!138072 m!164867))

(assert (=> b!138072 m!164867))

(declare-fun m!164869 () Bool)

(assert (=> b!138072 m!164869))

(assert (=> bm!15144 m!164867))

(declare-fun m!164871 () Bool)

(assert (=> bm!15144 m!164871))

(assert (=> b!138073 m!164867))

(assert (=> b!138073 m!164867))

(declare-fun m!164873 () Bool)

(assert (=> b!138073 m!164873))

(assert (=> b!138075 m!164867))

(assert (=> b!138075 m!164867))

(assert (=> b!138075 m!164873))

(assert (=> b!138004 d!43089))

(declare-fun d!43091 () Bool)

(assert (=> d!43091 (= (valid!547 thiss!992) (valid!548 (v!3255 (underlying!472 thiss!992))))))

(declare-fun bs!5786 () Bool)

(assert (= bs!5786 d!43091))

(declare-fun m!164875 () Bool)

(assert (=> bs!5786 m!164875))

(assert (=> start!14588 d!43091))

(declare-fun d!43093 () Bool)

(assert (=> d!43093 (= (array_inv!1445 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvsge (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!137999 d!43093))

(declare-fun d!43095 () Bool)

(assert (=> d!43095 (= (array_inv!1446 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvsge (size!2569 (_values!2902 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!137999 d!43095))

(declare-fun d!43097 () Bool)

(declare-fun res!66144 () Bool)

(declare-fun e!90040 () Bool)

(assert (=> d!43097 (=> (not res!66144) (not e!90040))))

(declare-fun simpleValid!94 (LongMapFixedSize!1134) Bool)

(assert (=> d!43097 (= res!66144 (simpleValid!94 newMap!16))))

(assert (=> d!43097 (= (valid!548 newMap!16) e!90040)))

(declare-fun b!138083 () Bool)

(declare-fun res!66145 () Bool)

(assert (=> b!138083 (=> (not res!66145) (not e!90040))))

(declare-fun arrayCountValidKeys!0 (array!4857 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!138083 (= res!66145 (= (arrayCountValidKeys!0 (_keys!4676 newMap!16) #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (_size!616 newMap!16)))))

(declare-fun b!138084 () Bool)

(declare-fun res!66146 () Bool)

(assert (=> b!138084 (=> (not res!66146) (not e!90040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4857 (_ BitVec 32)) Bool)

(assert (=> b!138084 (= res!66146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun b!138085 () Bool)

(assert (=> b!138085 (= e!90040 (arrayNoDuplicates!0 (_keys!4676 newMap!16) #b00000000000000000000000000000000 Nil!1733))))

(assert (= (and d!43097 res!66144) b!138083))

(assert (= (and b!138083 res!66145) b!138084))

(assert (= (and b!138084 res!66146) b!138085))

(declare-fun m!164877 () Bool)

(assert (=> d!43097 m!164877))

(declare-fun m!164879 () Bool)

(assert (=> b!138083 m!164879))

(declare-fun m!164881 () Bool)

(assert (=> b!138084 m!164881))

(declare-fun m!164883 () Bool)

(assert (=> b!138085 m!164883))

(assert (=> b!137998 d!43097))

(declare-fun d!43099 () Bool)

(assert (=> d!43099 (= (map!1432 newMap!16) (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun bs!5787 () Bool)

(assert (= bs!5787 d!43099))

(declare-fun m!164885 () Bool)

(assert (=> bs!5787 m!164885))

(assert (=> b!138002 d!43099))

(declare-fun b!138128 () Bool)

(declare-fun e!90075 () Bool)

(declare-fun call!15168 () Bool)

(assert (=> b!138128 (= e!90075 (not call!15168))))

(declare-fun b!138129 () Bool)

(declare-fun e!90074 () Bool)

(declare-fun lt!72135 () ListLongMap!1735)

(declare-fun apply!118 (ListLongMap!1735 (_ BitVec 64)) V!3531)

(assert (=> b!138129 (= e!90074 (= (apply!118 lt!72135 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138130 () Bool)

(declare-fun e!90067 () ListLongMap!1735)

(declare-fun e!90069 () ListLongMap!1735)

(assert (=> b!138130 (= e!90067 e!90069)))

(declare-fun c!25800 () Bool)

(assert (=> b!138130 (= c!25800 (and (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15159 () Bool)

(declare-fun call!15162 () ListLongMap!1735)

(declare-fun call!15167 () ListLongMap!1735)

(assert (=> bm!15159 (= call!15162 call!15167)))

(declare-fun b!138131 () Bool)

(declare-fun e!90070 () Bool)

(assert (=> b!138131 (= e!90070 e!90074)))

(declare-fun res!66165 () Bool)

(declare-fun call!15163 () Bool)

(assert (=> b!138131 (= res!66165 call!15163)))

(assert (=> b!138131 (=> (not res!66165) (not e!90074))))

(declare-fun bm!15160 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!143 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) Int) ListLongMap!1735)

(assert (=> bm!15160 (= call!15167 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138132 () Bool)

(declare-fun e!90073 () Unit!4344)

(declare-fun Unit!4346 () Unit!4344)

(assert (=> b!138132 (= e!90073 Unit!4346)))

(declare-fun b!138133 () Bool)

(declare-fun e!90076 () Bool)

(assert (=> b!138133 (= e!90076 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!43101 () Bool)

(declare-fun e!90078 () Bool)

(assert (=> d!43101 e!90078))

(declare-fun res!66168 () Bool)

(assert (=> d!43101 (=> (not res!66168) (not e!90078))))

(assert (=> d!43101 (= res!66168 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun lt!72140 () ListLongMap!1735)

(assert (=> d!43101 (= lt!72135 lt!72140)))

(declare-fun lt!72126 () Unit!4344)

(assert (=> d!43101 (= lt!72126 e!90073)))

(declare-fun c!25804 () Bool)

(assert (=> d!43101 (= c!25804 e!90076)))

(declare-fun res!66167 () Bool)

(assert (=> d!43101 (=> (not res!66167) (not e!90076))))

(assert (=> d!43101 (= res!66167 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> d!43101 (= lt!72140 e!90067)))

(declare-fun c!25801 () Bool)

(assert (=> d!43101 (= c!25801 (and (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43101 (validMask!0 (mask!7249 (v!3255 (underlying!472 thiss!992))))))

(assert (=> d!43101 (= (getCurrentListMap!557 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) lt!72135)))

(declare-fun b!138134 () Bool)

(declare-fun call!15164 () ListLongMap!1735)

(assert (=> b!138134 (= e!90069 call!15164)))

(declare-fun b!138135 () Bool)

(declare-fun e!90079 () Bool)

(declare-fun e!90072 () Bool)

(assert (=> b!138135 (= e!90079 e!90072)))

(declare-fun res!66172 () Bool)

(assert (=> b!138135 (=> (not res!66172) (not e!90072))))

(assert (=> b!138135 (= res!66172 (contains!916 lt!72135 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138135 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun bm!15161 () Bool)

(assert (=> bm!15161 (= call!15168 (contains!916 lt!72135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138136 () Bool)

(assert (=> b!138136 (= e!90070 (not call!15163))))

(declare-fun b!138137 () Bool)

(declare-fun res!66170 () Bool)

(assert (=> b!138137 (=> (not res!66170) (not e!90078))))

(assert (=> b!138137 (= res!66170 e!90079)))

(declare-fun res!66171 () Bool)

(assert (=> b!138137 (=> res!66171 e!90079)))

(declare-fun e!90077 () Bool)

(assert (=> b!138137 (= res!66171 (not e!90077))))

(declare-fun res!66166 () Bool)

(assert (=> b!138137 (=> (not res!66166) (not e!90077))))

(assert (=> b!138137 (= res!66166 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138138 () Bool)

(declare-fun e!90068 () ListLongMap!1735)

(assert (=> b!138138 (= e!90068 call!15164)))

(declare-fun b!138139 () Bool)

(assert (=> b!138139 (= e!90078 e!90075)))

(declare-fun c!25802 () Bool)

(assert (=> b!138139 (= c!25802 (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138140 () Bool)

(declare-fun res!66169 () Bool)

(assert (=> b!138140 (=> (not res!66169) (not e!90078))))

(assert (=> b!138140 (= res!66169 e!90070)))

(declare-fun c!25799 () Bool)

(assert (=> b!138140 (= c!25799 (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138141 () Bool)

(declare-fun lt!72133 () Unit!4344)

(assert (=> b!138141 (= e!90073 lt!72133)))

(declare-fun lt!72127 () ListLongMap!1735)

(assert (=> b!138141 (= lt!72127 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun lt!72132 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72123 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72123 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72131 () Unit!4344)

(declare-fun addStillContains!94 (ListLongMap!1735 (_ BitVec 64) V!3531 (_ BitVec 64)) Unit!4344)

(assert (=> b!138141 (= lt!72131 (addStillContains!94 lt!72127 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72123))))

(declare-fun +!177 (ListLongMap!1735 tuple2!2680) ListLongMap!1735)

(assert (=> b!138141 (contains!916 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72123)))

(declare-fun lt!72124 () Unit!4344)

(assert (=> b!138141 (= lt!72124 lt!72131)))

(declare-fun lt!72136 () ListLongMap!1735)

(assert (=> b!138141 (= lt!72136 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun lt!72134 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72134 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72141 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72141 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72130 () Unit!4344)

(declare-fun addApplyDifferent!94 (ListLongMap!1735 (_ BitVec 64) V!3531 (_ BitVec 64)) Unit!4344)

(assert (=> b!138141 (= lt!72130 (addApplyDifferent!94 lt!72136 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72141))))

(assert (=> b!138141 (= (apply!118 (+!177 lt!72136 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72141) (apply!118 lt!72136 lt!72141))))

(declare-fun lt!72142 () Unit!4344)

(assert (=> b!138141 (= lt!72142 lt!72130)))

(declare-fun lt!72138 () ListLongMap!1735)

(assert (=> b!138141 (= lt!72138 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun lt!72128 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72125 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72125 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72122 () Unit!4344)

(assert (=> b!138141 (= lt!72122 (addApplyDifferent!94 lt!72138 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72125))))

(assert (=> b!138141 (= (apply!118 (+!177 lt!72138 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72125) (apply!118 lt!72138 lt!72125))))

(declare-fun lt!72129 () Unit!4344)

(assert (=> b!138141 (= lt!72129 lt!72122)))

(declare-fun lt!72137 () ListLongMap!1735)

(assert (=> b!138141 (= lt!72137 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun lt!72139 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72121 () (_ BitVec 64))

(assert (=> b!138141 (= lt!72121 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138141 (= lt!72133 (addApplyDifferent!94 lt!72137 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72121))))

(assert (=> b!138141 (= (apply!118 (+!177 lt!72137 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72121) (apply!118 lt!72137 lt!72121))))

(declare-fun bm!15162 () Bool)

(assert (=> bm!15162 (= call!15163 (contains!916 lt!72135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138142 () Bool)

(declare-fun call!15166 () ListLongMap!1735)

(assert (=> b!138142 (= e!90068 call!15166)))

(declare-fun call!15165 () ListLongMap!1735)

(declare-fun bm!15163 () Bool)

(assert (=> bm!15163 (= call!15165 (+!177 (ite c!25801 call!15167 (ite c!25800 call!15162 call!15166)) (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun b!138143 () Bool)

(declare-fun e!90071 () Bool)

(assert (=> b!138143 (= e!90071 (= (apply!118 lt!72135 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138144 () Bool)

(assert (=> b!138144 (= e!90075 e!90071)))

(declare-fun res!66173 () Bool)

(assert (=> b!138144 (= res!66173 call!15168)))

(assert (=> b!138144 (=> (not res!66173) (not e!90071))))

(declare-fun b!138145 () Bool)

(assert (=> b!138145 (= e!90072 (= (apply!118 lt!72135 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2569 (_values!2902 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> b!138145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138146 () Bool)

(assert (=> b!138146 (= e!90067 (+!177 call!15165 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138147 () Bool)

(declare-fun c!25803 () Bool)

(assert (=> b!138147 (= c!25803 (and (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138147 (= e!90069 e!90068)))

(declare-fun b!138148 () Bool)

(assert (=> b!138148 (= e!90077 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!15164 () Bool)

(assert (=> bm!15164 (= call!15166 call!15162)))

(declare-fun bm!15165 () Bool)

(assert (=> bm!15165 (= call!15164 call!15165)))

(assert (= (and d!43101 c!25801) b!138146))

(assert (= (and d!43101 (not c!25801)) b!138130))

(assert (= (and b!138130 c!25800) b!138134))

(assert (= (and b!138130 (not c!25800)) b!138147))

(assert (= (and b!138147 c!25803) b!138138))

(assert (= (and b!138147 (not c!25803)) b!138142))

(assert (= (or b!138138 b!138142) bm!15164))

(assert (= (or b!138134 bm!15164) bm!15159))

(assert (= (or b!138134 b!138138) bm!15165))

(assert (= (or b!138146 bm!15159) bm!15160))

(assert (= (or b!138146 bm!15165) bm!15163))

(assert (= (and d!43101 res!66167) b!138133))

(assert (= (and d!43101 c!25804) b!138141))

(assert (= (and d!43101 (not c!25804)) b!138132))

(assert (= (and d!43101 res!66168) b!138137))

(assert (= (and b!138137 res!66166) b!138148))

(assert (= (and b!138137 (not res!66171)) b!138135))

(assert (= (and b!138135 res!66172) b!138145))

(assert (= (and b!138137 res!66170) b!138140))

(assert (= (and b!138140 c!25799) b!138131))

(assert (= (and b!138140 (not c!25799)) b!138136))

(assert (= (and b!138131 res!66165) b!138129))

(assert (= (or b!138131 b!138136) bm!15162))

(assert (= (and b!138140 res!66169) b!138139))

(assert (= (and b!138139 c!25802) b!138144))

(assert (= (and b!138139 (not c!25802)) b!138128))

(assert (= (and b!138144 res!66173) b!138143))

(assert (= (or b!138144 b!138128) bm!15161))

(declare-fun b_lambda!6183 () Bool)

(assert (=> (not b_lambda!6183) (not b!138145)))

(assert (=> b!138145 t!6276))

(declare-fun b_and!8611 () Bool)

(assert (= b_and!8599 (and (=> t!6276 result!4115) b_and!8611)))

(assert (=> b!138145 t!6278))

(declare-fun b_and!8613 () Bool)

(assert (= b_and!8601 (and (=> t!6278 result!4119) b_and!8613)))

(declare-fun m!164887 () Bool)

(assert (=> b!138146 m!164887))

(declare-fun m!164889 () Bool)

(assert (=> bm!15163 m!164889))

(declare-fun m!164891 () Bool)

(assert (=> b!138141 m!164891))

(declare-fun m!164893 () Bool)

(assert (=> b!138141 m!164893))

(declare-fun m!164895 () Bool)

(assert (=> b!138141 m!164895))

(assert (=> b!138141 m!164895))

(declare-fun m!164897 () Bool)

(assert (=> b!138141 m!164897))

(declare-fun m!164899 () Bool)

(assert (=> b!138141 m!164899))

(declare-fun m!164901 () Bool)

(assert (=> b!138141 m!164901))

(assert (=> b!138141 m!164893))

(declare-fun m!164903 () Bool)

(assert (=> b!138141 m!164903))

(declare-fun m!164905 () Bool)

(assert (=> b!138141 m!164905))

(declare-fun m!164907 () Bool)

(assert (=> b!138141 m!164907))

(declare-fun m!164909 () Bool)

(assert (=> b!138141 m!164909))

(declare-fun m!164911 () Bool)

(assert (=> b!138141 m!164911))

(assert (=> b!138141 m!164901))

(declare-fun m!164913 () Bool)

(assert (=> b!138141 m!164913))

(assert (=> b!138141 m!164891))

(declare-fun m!164915 () Bool)

(assert (=> b!138141 m!164915))

(declare-fun m!164917 () Bool)

(assert (=> b!138141 m!164917))

(declare-fun m!164919 () Bool)

(assert (=> b!138141 m!164919))

(declare-fun m!164921 () Bool)

(assert (=> b!138141 m!164921))

(declare-fun m!164923 () Bool)

(assert (=> b!138141 m!164923))

(assert (=> b!138148 m!164907))

(assert (=> b!138148 m!164907))

(declare-fun m!164925 () Bool)

(assert (=> b!138148 m!164925))

(declare-fun m!164927 () Bool)

(assert (=> bm!15162 m!164927))

(assert (=> bm!15160 m!164905))

(declare-fun m!164929 () Bool)

(assert (=> b!138129 m!164929))

(assert (=> b!138133 m!164907))

(assert (=> b!138133 m!164907))

(assert (=> b!138133 m!164925))

(assert (=> b!138135 m!164907))

(assert (=> b!138135 m!164907))

(declare-fun m!164931 () Bool)

(assert (=> b!138135 m!164931))

(declare-fun m!164933 () Bool)

(assert (=> b!138145 m!164933))

(assert (=> b!138145 m!164813))

(declare-fun m!164935 () Bool)

(assert (=> b!138145 m!164935))

(assert (=> b!138145 m!164813))

(assert (=> b!138145 m!164907))

(declare-fun m!164937 () Bool)

(assert (=> b!138145 m!164937))

(assert (=> b!138145 m!164907))

(assert (=> b!138145 m!164933))

(declare-fun m!164939 () Bool)

(assert (=> b!138143 m!164939))

(declare-fun m!164941 () Bool)

(assert (=> bm!15161 m!164941))

(declare-fun m!164943 () Bool)

(assert (=> d!43101 m!164943))

(assert (=> b!138002 d!43101))

(declare-fun d!43103 () Bool)

(declare-fun e!90085 () Bool)

(assert (=> d!43103 e!90085))

(declare-fun res!66176 () Bool)

(assert (=> d!43103 (=> res!66176 e!90085)))

(declare-fun lt!72151 () Bool)

(assert (=> d!43103 (= res!66176 (not lt!72151))))

(declare-fun lt!72153 () Bool)

(assert (=> d!43103 (= lt!72151 lt!72153)))

(declare-fun lt!72154 () Unit!4344)

(declare-fun e!90084 () Unit!4344)

(assert (=> d!43103 (= lt!72154 e!90084)))

(declare-fun c!25807 () Bool)

(assert (=> d!43103 (= c!25807 lt!72153)))

(declare-fun containsKey!178 (List!1735 (_ BitVec 64)) Bool)

(assert (=> d!43103 (= lt!72153 (containsKey!178 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43103 (= (contains!916 lt!72063 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) lt!72151)))

(declare-fun b!138155 () Bool)

(declare-fun lt!72152 () Unit!4344)

(assert (=> b!138155 (= e!90084 lt!72152)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!126 (List!1735 (_ BitVec 64)) Unit!4344)

(assert (=> b!138155 (= lt!72152 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-datatypes ((Option!180 0))(
  ( (Some!179 (v!3259 V!3531)) (None!178) )
))
(declare-fun isDefined!127 (Option!180) Bool)

(declare-fun getValueByKey!174 (List!1735 (_ BitVec 64)) Option!180)

(assert (=> b!138155 (isDefined!127 (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138156 () Bool)

(declare-fun Unit!4347 () Unit!4344)

(assert (=> b!138156 (= e!90084 Unit!4347)))

(declare-fun b!138157 () Bool)

(assert (=> b!138157 (= e!90085 (isDefined!127 (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(assert (= (and d!43103 c!25807) b!138155))

(assert (= (and d!43103 (not c!25807)) b!138156))

(assert (= (and d!43103 (not res!66176)) b!138157))

(assert (=> d!43103 m!164795))

(declare-fun m!164945 () Bool)

(assert (=> d!43103 m!164945))

(assert (=> b!138155 m!164795))

(declare-fun m!164947 () Bool)

(assert (=> b!138155 m!164947))

(assert (=> b!138155 m!164795))

(declare-fun m!164949 () Bool)

(assert (=> b!138155 m!164949))

(assert (=> b!138155 m!164949))

(declare-fun m!164951 () Bool)

(assert (=> b!138155 m!164951))

(assert (=> b!138157 m!164795))

(assert (=> b!138157 m!164949))

(assert (=> b!138157 m!164949))

(assert (=> b!138157 m!164951))

(assert (=> b!138005 d!43103))

(declare-fun bm!15214 () Bool)

(declare-fun call!15233 () Bool)

(declare-fun call!15230 () Bool)

(assert (=> bm!15214 (= call!15233 call!15230)))

(declare-fun call!15227 () Unit!4344)

(declare-fun bm!15215 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) Int) Unit!4344)

(assert (=> bm!15215 (= call!15227 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(declare-fun b!138238 () Bool)

(declare-fun e!90139 () tuple2!2682)

(declare-fun e!90131 () tuple2!2682)

(assert (=> b!138238 (= e!90139 e!90131)))

(declare-fun c!25845 () Bool)

(assert (=> b!138238 (= c!25845 (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138239 () Bool)

(declare-fun e!90146 () Bool)

(assert (=> b!138239 (= e!90146 (not call!15233))))

(declare-datatypes ((SeekEntryResult!277 0))(
  ( (MissingZero!277 (index!3270 (_ BitVec 32))) (Found!277 (index!3271 (_ BitVec 32))) (Intermediate!277 (undefined!1089 Bool) (index!3272 (_ BitVec 32)) (x!15991 (_ BitVec 32))) (Undefined!277) (MissingVacant!277 (index!3273 (_ BitVec 32))) )
))
(declare-fun lt!72216 () SeekEntryResult!277)

(declare-fun e!90138 () Bool)

(declare-fun b!138240 () Bool)

(assert (=> b!138240 (= e!90138 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72216)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun bm!15216 () Bool)

(assert (=> bm!15216 (= call!15230 (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15217 () Bool)

(declare-fun call!15221 () Bool)

(declare-fun call!15225 () Bool)

(assert (=> bm!15217 (= call!15221 call!15225)))

(declare-fun b!138241 () Bool)

(declare-fun e!90147 () tuple2!2682)

(assert (=> b!138241 (= e!90139 e!90147)))

(declare-fun lt!72229 () SeekEntryResult!277)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4857 (_ BitVec 32)) SeekEntryResult!277)

(assert (=> b!138241 (= lt!72229 (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun c!25839 () Bool)

(assert (=> b!138241 (= c!25839 ((_ is Undefined!277) lt!72229))))

(declare-fun bm!15218 () Bool)

(declare-fun c!25835 () Bool)

(assert (=> bm!15218 (= c!25835 c!25839)))

(declare-fun e!90140 () ListLongMap!1735)

(declare-fun call!15226 () Bool)

(assert (=> bm!15218 (= call!15226 (contains!916 e!90140 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun bm!15219 () Bool)

(declare-fun call!15234 () ListLongMap!1735)

(assert (=> bm!15219 (= call!15234 (map!1432 newMap!16))))

(declare-fun b!138242 () Bool)

(declare-fun e!90132 () Unit!4344)

(declare-fun lt!72234 () Unit!4344)

(assert (=> b!138242 (= e!90132 lt!72234)))

(declare-fun call!15229 () Unit!4344)

(assert (=> b!138242 (= lt!72234 call!15229)))

(declare-fun lt!72215 () SeekEntryResult!277)

(declare-fun call!15220 () SeekEntryResult!277)

(assert (=> b!138242 (= lt!72215 call!15220)))

(declare-fun c!25846 () Bool)

(assert (=> b!138242 (= c!25846 ((_ is MissingZero!277) lt!72215))))

(declare-fun e!90134 () Bool)

(assert (=> b!138242 e!90134))

(declare-fun b!138243 () Bool)

(declare-fun e!90143 () Bool)

(declare-fun call!15217 () ListLongMap!1735)

(assert (=> b!138243 (= e!90143 (= call!15217 (+!177 call!15234 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15220 () Bool)

(declare-fun call!15232 () ListLongMap!1735)

(assert (=> bm!15220 (= call!15232 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun call!15231 () ListLongMap!1735)

(declare-fun lt!72209 () (_ BitVec 32))

(declare-fun lt!72231 () array!4859)

(declare-fun c!25834 () Bool)

(declare-fun lt!72212 () (_ BitVec 32))

(declare-fun bm!15221 () Bool)

(assert (=> bm!15221 (= call!15231 (getCurrentListMap!557 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun bm!15222 () Bool)

(declare-fun call!15218 () SeekEntryResult!277)

(declare-fun call!15224 () SeekEntryResult!277)

(assert (=> bm!15222 (= call!15218 call!15224)))

(declare-fun call!15223 () ListLongMap!1735)

(declare-fun call!15239 () ListLongMap!1735)

(declare-fun bm!15223 () Bool)

(assert (=> bm!15223 (= call!15223 (+!177 (ite c!25834 call!15239 call!15232) (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!25837 () Bool)

(declare-fun bm!15224 () Bool)

(declare-fun call!15240 () tuple2!2682)

(declare-fun updateHelperNewKey!63 (LongMapFixedSize!1134 (_ BitVec 64) V!3531 (_ BitVec 32)) tuple2!2682)

(assert (=> bm!15224 (= call!15240 (updateHelperNewKey!63 newMap!16 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229))))))

(declare-fun b!138244 () Bool)

(declare-fun e!90145 () Bool)

(declare-fun lt!72230 () SeekEntryResult!277)

(assert (=> b!138244 (= e!90145 ((_ is Undefined!277) lt!72230))))

(declare-fun c!25836 () Bool)

(declare-fun bm!15225 () Bool)

(declare-fun c!25841 () Bool)

(declare-fun c!25840 () Bool)

(declare-fun lt!72218 () SeekEntryResult!277)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15225 (= call!15225 (inRange!0 (ite c!25839 (ite c!25836 (index!3271 lt!72216) (ite c!25846 (index!3270 lt!72215) (index!3273 lt!72215))) (ite c!25841 (index!3271 lt!72218) (ite c!25840 (index!3270 lt!72230) (index!3273 lt!72230)))) (mask!7249 newMap!16)))))

(declare-fun bm!15226 () Bool)

(declare-fun call!15237 () Bool)

(declare-fun call!15219 () Bool)

(assert (=> bm!15226 (= call!15237 call!15219)))

(declare-fun bm!15227 () Bool)

(declare-fun call!15222 () Bool)

(assert (=> bm!15227 (= call!15222 call!15230)))

(declare-fun bm!15228 () Bool)

(assert (=> bm!15228 (= call!15220 call!15224)))

(declare-fun bm!15229 () Bool)

(declare-fun call!15228 () ListLongMap!1735)

(assert (=> bm!15229 (= call!15228 call!15231)))

(declare-fun b!138245 () Bool)

(declare-fun c!25842 () Bool)

(assert (=> b!138245 (= c!25842 ((_ is MissingVacant!277) lt!72230))))

(declare-fun e!90135 () Bool)

(assert (=> b!138245 (= e!90135 e!90145)))

(declare-fun b!138246 () Bool)

(declare-fun e!90148 () Unit!4344)

(declare-fun lt!72225 () Unit!4344)

(assert (=> b!138246 (= e!90148 lt!72225)))

(assert (=> b!138246 (= lt!72225 call!15227)))

(assert (=> b!138246 (= lt!72218 call!15218)))

(declare-fun res!66207 () Bool)

(assert (=> b!138246 (= res!66207 ((_ is Found!277) lt!72218))))

(declare-fun e!90141 () Bool)

(assert (=> b!138246 (=> (not res!66207) (not e!90141))))

(assert (=> b!138246 e!90141))

(declare-fun b!138247 () Bool)

(assert (=> b!138247 (= c!25837 ((_ is MissingVacant!277) lt!72229))))

(declare-fun e!90142 () tuple2!2682)

(assert (=> b!138247 (= e!90147 e!90142)))

(declare-fun b!138248 () Bool)

(declare-fun lt!72228 () Unit!4344)

(declare-fun lt!72220 () Unit!4344)

(assert (=> b!138248 (= lt!72228 lt!72220)))

(declare-fun call!15236 () ListLongMap!1735)

(declare-fun call!15235 () ListLongMap!1735)

(assert (=> b!138248 (= call!15236 call!15235)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 V!3531 Int) Unit!4344)

(assert (=> b!138248 (= lt!72220 (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72212 (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)))))

(assert (=> b!138248 (= lt!72212 (bvor (extraKeys!2676 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!138248 (= e!90131 (tuple2!2683 true (LongMapFixedSize!1135 (defaultEntry!2919 newMap!16) (mask!7249 newMap!16) (bvor (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) (zeroValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!616 newMap!16) (_keys!4676 newMap!16) (_values!2902 newMap!16) (_vacant!616 newMap!16))))))

(declare-fun b!138249 () Bool)

(declare-fun Unit!4348 () Unit!4344)

(assert (=> b!138249 (= e!90132 Unit!4348)))

(declare-fun lt!72210 () Unit!4344)

(assert (=> b!138249 (= lt!72210 call!15227)))

(assert (=> b!138249 (= lt!72216 call!15220)))

(declare-fun res!66213 () Bool)

(assert (=> b!138249 (= res!66213 ((_ is Found!277) lt!72216))))

(assert (=> b!138249 (=> (not res!66213) (not e!90138))))

(assert (=> b!138249 e!90138))

(declare-fun lt!72221 () Unit!4344)

(assert (=> b!138249 (= lt!72221 lt!72210)))

(assert (=> b!138249 false))

(declare-fun b!138250 () Bool)

(declare-fun res!66212 () Bool)

(assert (=> b!138250 (= res!66212 call!15221)))

(assert (=> b!138250 (=> (not res!66212) (not e!90138))))

(declare-fun bm!15230 () Bool)

(assert (=> bm!15230 (= call!15236 call!15223)))

(declare-fun b!138251 () Bool)

(declare-fun e!90130 () Bool)

(assert (=> b!138251 (= e!90130 (= call!15217 call!15234))))

(declare-fun b!138252 () Bool)

(declare-fun res!66209 () Bool)

(assert (=> b!138252 (= res!66209 call!15219)))

(assert (=> b!138252 (=> (not res!66209) (not e!90141))))

(declare-fun b!138253 () Bool)

(declare-fun lt!72232 () tuple2!2682)

(assert (=> b!138253 (= lt!72232 call!15240)))

(declare-fun e!90128 () tuple2!2682)

(assert (=> b!138253 (= e!90128 (tuple2!2683 (_1!1352 lt!72232) (_2!1352 lt!72232)))))

(declare-fun b!138254 () Bool)

(assert (=> b!138254 (= e!90130 e!90143)))

(declare-fun res!66215 () Bool)

(assert (=> b!138254 (= res!66215 (contains!916 call!15217 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> b!138254 (=> (not res!66215) (not e!90143))))

(declare-fun b!138255 () Bool)

(declare-fun lt!72222 () Unit!4344)

(declare-fun lt!72213 () Unit!4344)

(assert (=> b!138255 (= lt!72222 lt!72213)))

(assert (=> b!138255 (contains!916 call!15228 (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!124 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) Int) Unit!4344)

(assert (=> b!138255 (= lt!72213 (lemmaValidKeyInArrayIsInListMap!124 (_keys!4676 newMap!16) lt!72231 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (defaultEntry!2919 newMap!16)))))

(assert (=> b!138255 (= lt!72231 (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))))))

(declare-fun lt!72226 () Unit!4344)

(declare-fun lt!72219 () Unit!4344)

(assert (=> b!138255 (= lt!72226 lt!72219)))

(assert (=> b!138255 (= call!15223 (getCurrentListMap!557 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) (_ BitVec 64) V!3531 Int) Unit!4344)

(assert (=> b!138255 (= lt!72219 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72224 () Unit!4344)

(assert (=> b!138255 (= lt!72224 e!90148)))

(assert (=> b!138255 (= c!25841 call!15226)))

(assert (=> b!138255 (= e!90128 (tuple2!2683 true (LongMapFixedSize!1135 (defaultEntry!2919 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (_size!616 newMap!16) (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (_vacant!616 newMap!16))))))

(declare-fun b!138256 () Bool)

(declare-fun e!90137 () Bool)

(assert (=> b!138256 (= e!90137 ((_ is Undefined!277) lt!72215))))

(declare-fun b!138257 () Bool)

(declare-fun c!25844 () Bool)

(assert (=> b!138257 (= c!25844 ((_ is MissingVacant!277) lt!72215))))

(assert (=> b!138257 (= e!90134 e!90137)))

(declare-fun b!138258 () Bool)

(declare-fun e!90144 () Bool)

(assert (=> b!138258 (= e!90144 (not call!15222))))

(declare-fun b!138259 () Bool)

(declare-fun e!90133 () Bool)

(assert (=> b!138259 (= e!90145 e!90133)))

(declare-fun res!66210 () Bool)

(assert (=> b!138259 (= res!66210 call!15237)))

(assert (=> b!138259 (=> (not res!66210) (not e!90133))))

(declare-fun b!138260 () Bool)

(declare-fun Unit!4349 () Unit!4344)

(assert (=> b!138260 (= e!90148 Unit!4349)))

(declare-fun lt!72211 () Unit!4344)

(assert (=> b!138260 (= lt!72211 call!15229)))

(assert (=> b!138260 (= lt!72230 call!15218)))

(assert (=> b!138260 (= c!25840 ((_ is MissingZero!277) lt!72230))))

(assert (=> b!138260 e!90135))

(declare-fun lt!72217 () Unit!4344)

(assert (=> b!138260 (= lt!72217 lt!72211)))

(assert (=> b!138260 false))

(declare-fun b!138261 () Bool)

(declare-fun e!90136 () Bool)

(assert (=> b!138261 (= e!90137 e!90136)))

(declare-fun res!66208 () Bool)

(declare-fun call!15238 () Bool)

(assert (=> b!138261 (= res!66208 call!15238)))

(assert (=> b!138261 (=> (not res!66208) (not e!90136))))

(declare-fun bm!15231 () Bool)

(assert (=> bm!15231 (= call!15219 call!15225)))

(declare-fun b!138262 () Bool)

(assert (=> b!138262 (= e!90140 call!15232)))

(declare-fun b!138263 () Bool)

(declare-fun res!66216 () Bool)

(assert (=> b!138263 (=> (not res!66216) (not e!90144))))

(assert (=> b!138263 (= res!66216 call!15237)))

(assert (=> b!138263 (= e!90135 e!90144)))

(declare-fun b!138264 () Bool)

(declare-fun lt!72223 () Unit!4344)

(assert (=> b!138264 (= lt!72223 e!90132)))

(assert (=> b!138264 (= c!25836 call!15226)))

(assert (=> b!138264 (= e!90147 (tuple2!2683 false newMap!16))))

(declare-fun b!138265 () Bool)

(declare-fun lt!72235 () Unit!4344)

(declare-fun lt!72233 () Unit!4344)

(assert (=> b!138265 (= lt!72235 lt!72233)))

(assert (=> b!138265 (= call!15236 call!15235)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!63 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 V!3531 Int) Unit!4344)

(assert (=> b!138265 (= lt!72233 (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72209 (zeroValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2770 newMap!16) (defaultEntry!2919 newMap!16)))))

(assert (=> b!138265 (= lt!72209 (bvor (extraKeys!2676 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!138265 (= e!90131 (tuple2!2683 true (LongMapFixedSize!1135 (defaultEntry!2919 newMap!16) (mask!7249 newMap!16) (bvor (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2770 newMap!16) (_size!616 newMap!16) (_keys!4676 newMap!16) (_values!2902 newMap!16) (_vacant!616 newMap!16))))))

(declare-fun b!138266 () Bool)

(declare-fun e!90129 () Bool)

(assert (=> b!138266 (= e!90129 e!90130)))

(declare-fun c!25838 () Bool)

(declare-fun lt!72227 () tuple2!2682)

(assert (=> b!138266 (= c!25838 (_1!1352 lt!72227))))

(declare-fun b!138267 () Bool)

(declare-fun res!66205 () Bool)

(assert (=> b!138267 (= res!66205 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3273 lt!72215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138267 (=> (not res!66205) (not e!90136))))

(declare-fun bm!15232 () Bool)

(assert (=> bm!15232 (= call!15235 call!15231)))

(declare-fun bm!15233 () Bool)

(assert (=> bm!15233 (= call!15217 (map!1432 (_2!1352 lt!72227)))))

(declare-fun bm!15234 () Bool)

(assert (=> bm!15234 (= call!15224 (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun b!138268 () Bool)

(declare-fun res!66206 () Bool)

(assert (=> b!138268 (=> (not res!66206) (not e!90146))))

(assert (=> b!138268 (= res!66206 call!15238)))

(assert (=> b!138268 (= e!90134 e!90146)))

(declare-fun b!138269 () Bool)

(declare-fun lt!72214 () tuple2!2682)

(assert (=> b!138269 (= e!90142 (tuple2!2683 (_1!1352 lt!72214) (_2!1352 lt!72214)))))

(assert (=> b!138269 (= lt!72214 call!15240)))

(declare-fun b!138270 () Bool)

(assert (=> b!138270 (= e!90142 e!90128)))

(declare-fun c!25843 () Bool)

(assert (=> b!138270 (= c!25843 ((_ is MissingZero!277) lt!72229))))

(declare-fun b!138271 () Bool)

(assert (=> b!138271 (= e!90136 (not call!15233))))

(declare-fun bm!15235 () Bool)

(assert (=> bm!15235 (= call!15238 call!15221)))

(declare-fun b!138272 () Bool)

(assert (=> b!138272 (= e!90141 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72218)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138273 () Bool)

(assert (=> b!138273 (= e!90133 (not call!15222))))

(declare-fun bm!15236 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) Int) Unit!4344)

(assert (=> bm!15236 (= call!15229 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(declare-fun b!138274 () Bool)

(assert (=> b!138274 (= e!90140 call!15228)))

(declare-fun d!43105 () Bool)

(assert (=> d!43105 e!90129))

(declare-fun res!66214 () Bool)

(assert (=> d!43105 (=> (not res!66214) (not e!90129))))

(assert (=> d!43105 (= res!66214 (valid!548 (_2!1352 lt!72227)))))

(assert (=> d!43105 (= lt!72227 e!90139)))

(assert (=> d!43105 (= c!25834 (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvneg (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(assert (=> d!43105 (valid!548 newMap!16)))

(assert (=> d!43105 (= (update!207 newMap!16 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72227)))

(declare-fun bm!15237 () Bool)

(assert (=> bm!15237 (= call!15239 call!15232)))

(declare-fun b!138275 () Bool)

(declare-fun res!66211 () Bool)

(assert (=> b!138275 (=> (not res!66211) (not e!90144))))

(assert (=> b!138275 (= res!66211 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3270 lt!72230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138276 () Bool)

(declare-fun res!66217 () Bool)

(assert (=> b!138276 (=> (not res!66217) (not e!90146))))

(assert (=> b!138276 (= res!66217 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3270 lt!72215)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138277 () Bool)

(declare-fun res!66218 () Bool)

(assert (=> b!138277 (= res!66218 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3273 lt!72230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138277 (=> (not res!66218) (not e!90133))))

(assert (= (and d!43105 c!25834) b!138238))

(assert (= (and d!43105 (not c!25834)) b!138241))

(assert (= (and b!138238 c!25845) b!138265))

(assert (= (and b!138238 (not c!25845)) b!138248))

(assert (= (or b!138265 b!138248) bm!15232))

(assert (= (or b!138265 b!138248) bm!15237))

(assert (= (or b!138265 b!138248) bm!15230))

(assert (= (and b!138241 c!25839) b!138264))

(assert (= (and b!138241 (not c!25839)) b!138247))

(assert (= (and b!138264 c!25836) b!138249))

(assert (= (and b!138264 (not c!25836)) b!138242))

(assert (= (and b!138249 res!66213) b!138250))

(assert (= (and b!138250 res!66212) b!138240))

(assert (= (and b!138242 c!25846) b!138268))

(assert (= (and b!138242 (not c!25846)) b!138257))

(assert (= (and b!138268 res!66206) b!138276))

(assert (= (and b!138276 res!66217) b!138239))

(assert (= (and b!138257 c!25844) b!138261))

(assert (= (and b!138257 (not c!25844)) b!138256))

(assert (= (and b!138261 res!66208) b!138267))

(assert (= (and b!138267 res!66205) b!138271))

(assert (= (or b!138268 b!138261) bm!15235))

(assert (= (or b!138239 b!138271) bm!15214))

(assert (= (or b!138250 bm!15235) bm!15217))

(assert (= (or b!138249 b!138242) bm!15228))

(assert (= (and b!138247 c!25837) b!138269))

(assert (= (and b!138247 (not c!25837)) b!138270))

(assert (= (and b!138270 c!25843) b!138253))

(assert (= (and b!138270 (not c!25843)) b!138255))

(assert (= (and b!138255 c!25841) b!138246))

(assert (= (and b!138255 (not c!25841)) b!138260))

(assert (= (and b!138246 res!66207) b!138252))

(assert (= (and b!138252 res!66209) b!138272))

(assert (= (and b!138260 c!25840) b!138263))

(assert (= (and b!138260 (not c!25840)) b!138245))

(assert (= (and b!138263 res!66216) b!138275))

(assert (= (and b!138275 res!66211) b!138258))

(assert (= (and b!138245 c!25842) b!138259))

(assert (= (and b!138245 (not c!25842)) b!138244))

(assert (= (and b!138259 res!66210) b!138277))

(assert (= (and b!138277 res!66218) b!138273))

(assert (= (or b!138263 b!138259) bm!15226))

(assert (= (or b!138258 b!138273) bm!15227))

(assert (= (or b!138252 bm!15226) bm!15231))

(assert (= (or b!138246 b!138260) bm!15222))

(assert (= (or b!138269 b!138253) bm!15224))

(assert (= (or bm!15217 bm!15231) bm!15225))

(assert (= (or b!138264 b!138255) bm!15229))

(assert (= (or bm!15214 bm!15227) bm!15216))

(assert (= (or b!138249 b!138246) bm!15215))

(assert (= (or b!138242 b!138260) bm!15236))

(assert (= (or bm!15228 bm!15222) bm!15234))

(assert (= (or b!138264 b!138255) bm!15218))

(assert (= (and bm!15218 c!25835) b!138274))

(assert (= (and bm!15218 (not c!25835)) b!138262))

(assert (= (or bm!15232 bm!15229) bm!15221))

(assert (= (or bm!15237 b!138255 b!138262) bm!15220))

(assert (= (or bm!15230 b!138255) bm!15223))

(assert (= (and d!43105 res!66214) b!138266))

(assert (= (and b!138266 c!25838) b!138254))

(assert (= (and b!138266 (not c!25838)) b!138251))

(assert (= (and b!138254 res!66215) b!138243))

(assert (= (or b!138254 b!138243 b!138251) bm!15233))

(assert (= (or b!138243 b!138251) bm!15219))

(declare-fun m!164953 () Bool)

(assert (=> d!43105 m!164953))

(assert (=> d!43105 m!164791))

(declare-fun m!164955 () Bool)

(assert (=> bm!15221 m!164955))

(assert (=> bm!15224 m!164795))

(assert (=> bm!15224 m!164815))

(declare-fun m!164957 () Bool)

(assert (=> bm!15224 m!164957))

(assert (=> bm!15218 m!164795))

(declare-fun m!164959 () Bool)

(assert (=> bm!15218 m!164959))

(assert (=> b!138241 m!164795))

(declare-fun m!164961 () Bool)

(assert (=> b!138241 m!164961))

(declare-fun m!164963 () Bool)

(assert (=> bm!15225 m!164963))

(declare-fun m!164965 () Bool)

(assert (=> b!138240 m!164965))

(assert (=> b!138265 m!164815))

(declare-fun m!164967 () Bool)

(assert (=> b!138265 m!164967))

(declare-fun m!164969 () Bool)

(assert (=> b!138277 m!164969))

(declare-fun m!164971 () Bool)

(assert (=> b!138243 m!164971))

(assert (=> bm!15219 m!164797))

(assert (=> bm!15216 m!164795))

(declare-fun m!164973 () Bool)

(assert (=> bm!15216 m!164973))

(assert (=> bm!15220 m!164885))

(declare-fun m!164975 () Bool)

(assert (=> b!138255 m!164975))

(declare-fun m!164977 () Bool)

(assert (=> b!138255 m!164977))

(declare-fun m!164979 () Bool)

(assert (=> b!138255 m!164979))

(assert (=> b!138255 m!164795))

(assert (=> b!138255 m!164815))

(declare-fun m!164981 () Bool)

(assert (=> b!138255 m!164981))

(declare-fun m!164983 () Bool)

(assert (=> b!138255 m!164983))

(assert (=> b!138255 m!164983))

(declare-fun m!164985 () Bool)

(assert (=> b!138255 m!164985))

(declare-fun m!164987 () Bool)

(assert (=> b!138275 m!164987))

(assert (=> b!138254 m!164795))

(declare-fun m!164989 () Bool)

(assert (=> b!138254 m!164989))

(declare-fun m!164991 () Bool)

(assert (=> b!138267 m!164991))

(declare-fun m!164993 () Bool)

(assert (=> b!138276 m!164993))

(declare-fun m!164995 () Bool)

(assert (=> bm!15233 m!164995))

(declare-fun m!164997 () Bool)

(assert (=> b!138272 m!164997))

(assert (=> bm!15215 m!164795))

(declare-fun m!164999 () Bool)

(assert (=> bm!15215 m!164999))

(assert (=> b!138248 m!164815))

(declare-fun m!165001 () Bool)

(assert (=> b!138248 m!165001))

(assert (=> bm!15234 m!164795))

(assert (=> bm!15234 m!164961))

(declare-fun m!165003 () Bool)

(assert (=> bm!15223 m!165003))

(assert (=> bm!15236 m!164795))

(declare-fun m!165005 () Bool)

(assert (=> bm!15236 m!165005))

(assert (=> b!138005 d!43105))

(declare-fun d!43107 () Bool)

(declare-fun c!25849 () Bool)

(assert (=> d!43107 (= c!25849 ((_ is ValueCellFull!1113) (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun e!90151 () V!3531)

(assert (=> d!43107 (= (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90151)))

(declare-fun b!138282 () Bool)

(declare-fun get!1514 (ValueCell!1113 V!3531) V!3531)

(assert (=> b!138282 (= e!90151 (get!1514 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138283 () Bool)

(declare-fun get!1515 (ValueCell!1113 V!3531) V!3531)

(assert (=> b!138283 (= e!90151 (get!1515 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43107 c!25849) b!138282))

(assert (= (and d!43107 (not c!25849)) b!138283))

(assert (=> b!138282 m!164811))

(assert (=> b!138282 m!164813))

(declare-fun m!165007 () Bool)

(assert (=> b!138282 m!165007))

(assert (=> b!138283 m!164811))

(assert (=> b!138283 m!164813))

(declare-fun m!165009 () Bool)

(assert (=> b!138283 m!165009))

(assert (=> b!138005 d!43107))

(declare-fun d!43109 () Bool)

(declare-fun res!66223 () Bool)

(declare-fun e!90156 () Bool)

(assert (=> d!43109 (=> res!66223 e!90156)))

(assert (=> d!43109 (= res!66223 (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43109 (= (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90156)))

(declare-fun b!138288 () Bool)

(declare-fun e!90157 () Bool)

(assert (=> b!138288 (= e!90156 e!90157)))

(declare-fun res!66224 () Bool)

(assert (=> b!138288 (=> (not res!66224) (not e!90157))))

(assert (=> b!138288 (= res!66224 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138289 () Bool)

(assert (=> b!138289 (= e!90157 (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43109 (not res!66223)) b!138288))

(assert (= (and b!138288 res!66224) b!138289))

(assert (=> d!43109 m!164907))

(assert (=> b!138289 m!164795))

(declare-fun m!165011 () Bool)

(assert (=> b!138289 m!165011))

(assert (=> b!138006 d!43109))

(declare-fun d!43111 () Bool)

(declare-fun e!90160 () Bool)

(assert (=> d!43111 e!90160))

(declare-fun c!25852 () Bool)

(assert (=> d!43111 (= c!25852 (and (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72238 () Unit!4344)

(declare-fun choose!844 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) (_ BitVec 32) Int) Unit!4344)

(assert (=> d!43111 (= lt!72238 (choose!844 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(assert (=> d!43111 (validMask!0 (mask!7249 (v!3255 (underlying!472 thiss!992))))))

(assert (=> d!43111 (= (lemmaListMapContainsThenArrayContainsFrom!135 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) lt!72238)))

(declare-fun b!138294 () Bool)

(assert (=> b!138294 (= e!90160 (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138295 () Bool)

(assert (=> b!138295 (= e!90160 (ite (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43111 c!25852) b!138294))

(assert (= (and d!43111 (not c!25852)) b!138295))

(assert (=> d!43111 m!164795))

(declare-fun m!165013 () Bool)

(assert (=> d!43111 m!165013))

(assert (=> d!43111 m!164943))

(assert (=> b!138294 m!164795))

(assert (=> b!138294 m!164823))

(assert (=> b!138006 d!43111))

(declare-fun b!138303 () Bool)

(declare-fun e!90165 () Bool)

(assert (=> b!138303 (= e!90165 tp_is_empty!2913)))

(declare-fun b!138302 () Bool)

(declare-fun e!90166 () Bool)

(assert (=> b!138302 (= e!90166 tp_is_empty!2913)))

(declare-fun mapNonEmpty!4779 () Bool)

(declare-fun mapRes!4779 () Bool)

(declare-fun tp!11457 () Bool)

(assert (=> mapNonEmpty!4779 (= mapRes!4779 (and tp!11457 e!90166))))

(declare-fun mapRest!4779 () (Array (_ BitVec 32) ValueCell!1113))

(declare-fun mapValue!4779 () ValueCell!1113)

(declare-fun mapKey!4779 () (_ BitVec 32))

(assert (=> mapNonEmpty!4779 (= mapRest!4770 (store mapRest!4779 mapKey!4779 mapValue!4779))))

(declare-fun mapIsEmpty!4779 () Bool)

(assert (=> mapIsEmpty!4779 mapRes!4779))

(declare-fun condMapEmpty!4779 () Bool)

(declare-fun mapDefault!4779 () ValueCell!1113)

(assert (=> mapNonEmpty!4770 (= condMapEmpty!4779 (= mapRest!4770 ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4779)))))

(assert (=> mapNonEmpty!4770 (= tp!11440 (and e!90165 mapRes!4779))))

(assert (= (and mapNonEmpty!4770 condMapEmpty!4779) mapIsEmpty!4779))

(assert (= (and mapNonEmpty!4770 (not condMapEmpty!4779)) mapNonEmpty!4779))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1113) mapValue!4779)) b!138302))

(assert (= (and mapNonEmpty!4770 ((_ is ValueCellFull!1113) mapDefault!4779)) b!138303))

(declare-fun m!165015 () Bool)

(assert (=> mapNonEmpty!4779 m!165015))

(declare-fun b!138305 () Bool)

(declare-fun e!90167 () Bool)

(assert (=> b!138305 (= e!90167 tp_is_empty!2913)))

(declare-fun b!138304 () Bool)

(declare-fun e!90168 () Bool)

(assert (=> b!138304 (= e!90168 tp_is_empty!2913)))

(declare-fun mapNonEmpty!4780 () Bool)

(declare-fun mapRes!4780 () Bool)

(declare-fun tp!11458 () Bool)

(assert (=> mapNonEmpty!4780 (= mapRes!4780 (and tp!11458 e!90168))))

(declare-fun mapRest!4780 () (Array (_ BitVec 32) ValueCell!1113))

(declare-fun mapKey!4780 () (_ BitVec 32))

(declare-fun mapValue!4780 () ValueCell!1113)

(assert (=> mapNonEmpty!4780 (= mapRest!4769 (store mapRest!4780 mapKey!4780 mapValue!4780))))

(declare-fun mapIsEmpty!4780 () Bool)

(assert (=> mapIsEmpty!4780 mapRes!4780))

(declare-fun condMapEmpty!4780 () Bool)

(declare-fun mapDefault!4780 () ValueCell!1113)

(assert (=> mapNonEmpty!4769 (= condMapEmpty!4780 (= mapRest!4769 ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4780)))))

(assert (=> mapNonEmpty!4769 (= tp!11439 (and e!90167 mapRes!4780))))

(assert (= (and mapNonEmpty!4769 condMapEmpty!4780) mapIsEmpty!4780))

(assert (= (and mapNonEmpty!4769 (not condMapEmpty!4780)) mapNonEmpty!4780))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1113) mapValue!4780)) b!138304))

(assert (= (and mapNonEmpty!4769 ((_ is ValueCellFull!1113) mapDefault!4780)) b!138305))

(declare-fun m!165017 () Bool)

(assert (=> mapNonEmpty!4780 m!165017))

(declare-fun b_lambda!6185 () Bool)

(assert (= b_lambda!6183 (or (and b!137999 b_free!2993) (and b!137992 b_free!2995 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))))) b_lambda!6185)))

(check-sat (not b!138129) (not b!138135) (not b!138155) (not b!138146) (not b_next!2995) (not b!138243) (not b!138145) (not bm!15218) (not bm!15236) (not bm!15225) (not b!138073) (not d!43103) (not b!138084) (not bm!15233) (not bm!15219) (not b_lambda!6185) (not b!138072) (not bm!15220) (not b!138133) (not b!138075) (not b!138143) (not b_next!2993) (not b!138085) b_and!8613 (not b_lambda!6181) (not bm!15163) (not bm!15234) (not d!43099) (not bm!15161) (not bm!15216) (not b!138083) (not b!138241) (not b!138248) (not b!138282) (not bm!15144) (not bm!15160) (not b!138141) (not d!43101) (not bm!15224) (not bm!15223) (not b!138289) (not b!138294) (not bm!15221) (not mapNonEmpty!4779) (not bm!15162) (not b!138265) (not b!138254) (not b!138255) (not mapNonEmpty!4780) tp_is_empty!2913 (not d!43097) (not d!43091) (not b!138148) (not bm!15215) (not d!43105) (not b!138283) (not d!43111) b_and!8611 (not b!138157))
(check-sat b_and!8611 b_and!8613 (not b_next!2993) (not b_next!2995))
(get-model)

(declare-fun d!43113 () Bool)

(assert (=> d!43113 (= (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138075 d!43113))

(declare-fun d!43115 () Bool)

(declare-fun e!90171 () Bool)

(assert (=> d!43115 e!90171))

(declare-fun res!66229 () Bool)

(assert (=> d!43115 (=> (not res!66229) (not e!90171))))

(declare-fun lt!72243 () SeekEntryResult!277)

(assert (=> d!43115 (= res!66229 ((_ is Found!277) lt!72243))))

(assert (=> d!43115 (= lt!72243 (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun lt!72244 () Unit!4344)

(declare-fun choose!845 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) Int) Unit!4344)

(assert (=> d!43115 (= lt!72244 (choose!845 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43115 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43115 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)) lt!72244)))

(declare-fun b!138310 () Bool)

(declare-fun res!66230 () Bool)

(assert (=> b!138310 (=> (not res!66230) (not e!90171))))

(assert (=> b!138310 (= res!66230 (inRange!0 (index!3271 lt!72243) (mask!7249 newMap!16)))))

(declare-fun b!138311 () Bool)

(assert (=> b!138311 (= e!90171 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72243)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> b!138311 (and (bvsge (index!3271 lt!72243) #b00000000000000000000000000000000) (bvslt (index!3271 lt!72243) (size!2568 (_keys!4676 newMap!16))))))

(assert (= (and d!43115 res!66229) b!138310))

(assert (= (and b!138310 res!66230) b!138311))

(assert (=> d!43115 m!164795))

(assert (=> d!43115 m!164961))

(assert (=> d!43115 m!164795))

(declare-fun m!165019 () Bool)

(assert (=> d!43115 m!165019))

(declare-fun m!165021 () Bool)

(assert (=> d!43115 m!165021))

(declare-fun m!165023 () Bool)

(assert (=> b!138310 m!165023))

(declare-fun m!165025 () Bool)

(assert (=> b!138311 m!165025))

(assert (=> bm!15215 d!43115))

(declare-fun d!43117 () Bool)

(assert (=> d!43117 (= (validMask!0 (mask!7249 (v!3255 (underlying!472 thiss!992)))) (and (or (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000001111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000011111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000001111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000011111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000001111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000011111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000001111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000011111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000000111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000001111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000011111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000000111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000001111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000011111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000000111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000001111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000011111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000000111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000001111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000011111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00000111111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00001111111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00011111111111111111111111111111) (= (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7249 (v!3255 (underlying!472 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!43101 d!43117))

(declare-fun d!43119 () Bool)

(assert (=> d!43119 (= (apply!118 (+!177 lt!72137 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72121) (apply!118 lt!72137 lt!72121))))

(declare-fun lt!72247 () Unit!4344)

(declare-fun choose!846 (ListLongMap!1735 (_ BitVec 64) V!3531 (_ BitVec 64)) Unit!4344)

(assert (=> d!43119 (= lt!72247 (choose!846 lt!72137 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72121))))

(declare-fun e!90174 () Bool)

(assert (=> d!43119 e!90174))

(declare-fun res!66233 () Bool)

(assert (=> d!43119 (=> (not res!66233) (not e!90174))))

(assert (=> d!43119 (= res!66233 (contains!916 lt!72137 lt!72121))))

(assert (=> d!43119 (= (addApplyDifferent!94 lt!72137 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72121) lt!72247)))

(declare-fun b!138315 () Bool)

(assert (=> b!138315 (= e!90174 (not (= lt!72121 lt!72139)))))

(assert (= (and d!43119 res!66233) b!138315))

(assert (=> d!43119 m!164921))

(assert (=> d!43119 m!164891))

(declare-fun m!165027 () Bool)

(assert (=> d!43119 m!165027))

(declare-fun m!165029 () Bool)

(assert (=> d!43119 m!165029))

(assert (=> d!43119 m!164891))

(assert (=> d!43119 m!164915))

(assert (=> b!138141 d!43119))

(declare-fun d!43121 () Bool)

(declare-fun get!1516 (Option!180) V!3531)

(assert (=> d!43121 (= (apply!118 lt!72136 lt!72141) (get!1516 (getValueByKey!174 (toList!883 lt!72136) lt!72141)))))

(declare-fun bs!5788 () Bool)

(assert (= bs!5788 d!43121))

(declare-fun m!165031 () Bool)

(assert (=> bs!5788 m!165031))

(assert (=> bs!5788 m!165031))

(declare-fun m!165033 () Bool)

(assert (=> bs!5788 m!165033))

(assert (=> b!138141 d!43121))

(declare-fun d!43123 () Bool)

(assert (=> d!43123 (= (apply!118 (+!177 lt!72138 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72125) (get!1516 (getValueByKey!174 (toList!883 (+!177 lt!72138 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72125)))))

(declare-fun bs!5789 () Bool)

(assert (= bs!5789 d!43123))

(declare-fun m!165035 () Bool)

(assert (=> bs!5789 m!165035))

(assert (=> bs!5789 m!165035))

(declare-fun m!165037 () Bool)

(assert (=> bs!5789 m!165037))

(assert (=> b!138141 d!43123))

(declare-fun d!43125 () Bool)

(assert (=> d!43125 (= (apply!118 (+!177 lt!72137 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72121) (get!1516 (getValueByKey!174 (toList!883 (+!177 lt!72137 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72121)))))

(declare-fun bs!5790 () Bool)

(assert (= bs!5790 d!43125))

(declare-fun m!165039 () Bool)

(assert (=> bs!5790 m!165039))

(assert (=> bs!5790 m!165039))

(declare-fun m!165041 () Bool)

(assert (=> bs!5790 m!165041))

(assert (=> b!138141 d!43125))

(declare-fun bm!15240 () Bool)

(declare-fun call!15243 () ListLongMap!1735)

(assert (=> bm!15240 (= call!15243 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138340 () Bool)

(declare-fun e!90190 () Bool)

(declare-fun e!90195 () Bool)

(assert (=> b!138340 (= e!90190 e!90195)))

(declare-fun c!25861 () Bool)

(declare-fun e!90193 () Bool)

(assert (=> b!138340 (= c!25861 e!90193)))

(declare-fun res!66242 () Bool)

(assert (=> b!138340 (=> (not res!66242) (not e!90193))))

(assert (=> b!138340 (= res!66242 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138341 () Bool)

(declare-fun lt!72264 () Unit!4344)

(declare-fun lt!72267 () Unit!4344)

(assert (=> b!138341 (= lt!72264 lt!72267)))

(declare-fun lt!72268 () (_ BitVec 64))

(declare-fun lt!72262 () V!3531)

(declare-fun lt!72263 () (_ BitVec 64))

(declare-fun lt!72266 () ListLongMap!1735)

(assert (=> b!138341 (not (contains!916 (+!177 lt!72266 (tuple2!2681 lt!72268 lt!72262)) lt!72263))))

(declare-fun addStillNotContains!63 (ListLongMap!1735 (_ BitVec 64) V!3531 (_ BitVec 64)) Unit!4344)

(assert (=> b!138341 (= lt!72267 (addStillNotContains!63 lt!72266 lt!72268 lt!72262 lt!72263))))

(assert (=> b!138341 (= lt!72263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!138341 (= lt!72262 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138341 (= lt!72268 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!138341 (= lt!72266 call!15243)))

(declare-fun e!90191 () ListLongMap!1735)

(assert (=> b!138341 (= e!90191 (+!177 call!15243 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!138342 () Bool)

(assert (=> b!138342 (= e!90191 call!15243)))

(declare-fun b!138343 () Bool)

(assert (=> b!138343 (= e!90193 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138343 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!138344 () Bool)

(declare-fun e!90192 () Bool)

(declare-fun lt!72265 () ListLongMap!1735)

(assert (=> b!138344 (= e!90192 (= lt!72265 (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun d!43127 () Bool)

(assert (=> d!43127 e!90190))

(declare-fun res!66243 () Bool)

(assert (=> d!43127 (=> (not res!66243) (not e!90190))))

(assert (=> d!43127 (= res!66243 (not (contains!916 lt!72265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!90194 () ListLongMap!1735)

(assert (=> d!43127 (= lt!72265 e!90194)))

(declare-fun c!25864 () Bool)

(assert (=> d!43127 (= c!25864 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> d!43127 (validMask!0 (mask!7249 (v!3255 (underlying!472 thiss!992))))))

(assert (=> d!43127 (= (getCurrentListMapNoExtraKeys!143 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) lt!72265)))

(declare-fun b!138345 () Bool)

(assert (=> b!138345 (= e!90195 e!90192)))

(declare-fun c!25862 () Bool)

(assert (=> b!138345 (= c!25862 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138346 () Bool)

(assert (=> b!138346 (= e!90194 (ListLongMap!1736 Nil!1732))))

(declare-fun b!138347 () Bool)

(declare-fun isEmpty!415 (ListLongMap!1735) Bool)

(assert (=> b!138347 (= e!90192 (isEmpty!415 lt!72265))))

(declare-fun b!138348 () Bool)

(assert (=> b!138348 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> b!138348 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2569 (_values!2902 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun e!90189 () Bool)

(assert (=> b!138348 (= e!90189 (= (apply!118 lt!72265 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138349 () Bool)

(assert (=> b!138349 (= e!90194 e!90191)))

(declare-fun c!25863 () Bool)

(assert (=> b!138349 (= c!25863 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138350 () Bool)

(assert (=> b!138350 (= e!90195 e!90189)))

(assert (=> b!138350 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun res!66244 () Bool)

(assert (=> b!138350 (= res!66244 (contains!916 lt!72265 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138350 (=> (not res!66244) (not e!90189))))

(declare-fun b!138351 () Bool)

(declare-fun res!66245 () Bool)

(assert (=> b!138351 (=> (not res!66245) (not e!90190))))

(assert (=> b!138351 (= res!66245 (not (contains!916 lt!72265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43127 c!25864) b!138346))

(assert (= (and d!43127 (not c!25864)) b!138349))

(assert (= (and b!138349 c!25863) b!138341))

(assert (= (and b!138349 (not c!25863)) b!138342))

(assert (= (or b!138341 b!138342) bm!15240))

(assert (= (and d!43127 res!66243) b!138351))

(assert (= (and b!138351 res!66245) b!138340))

(assert (= (and b!138340 res!66242) b!138343))

(assert (= (and b!138340 c!25861) b!138350))

(assert (= (and b!138340 (not c!25861)) b!138345))

(assert (= (and b!138350 res!66244) b!138348))

(assert (= (and b!138345 c!25862) b!138344))

(assert (= (and b!138345 (not c!25862)) b!138347))

(declare-fun b_lambda!6187 () Bool)

(assert (=> (not b_lambda!6187) (not b!138341)))

(assert (=> b!138341 t!6276))

(declare-fun b_and!8615 () Bool)

(assert (= b_and!8611 (and (=> t!6276 result!4115) b_and!8615)))

(assert (=> b!138341 t!6278))

(declare-fun b_and!8617 () Bool)

(assert (= b_and!8613 (and (=> t!6278 result!4119) b_and!8617)))

(declare-fun b_lambda!6189 () Bool)

(assert (=> (not b_lambda!6189) (not b!138348)))

(assert (=> b!138348 t!6276))

(declare-fun b_and!8619 () Bool)

(assert (= b_and!8615 (and (=> t!6276 result!4115) b_and!8619)))

(assert (=> b!138348 t!6278))

(declare-fun b_and!8621 () Bool)

(assert (= b_and!8617 (and (=> t!6278 result!4119) b_and!8621)))

(declare-fun m!165043 () Bool)

(assert (=> b!138344 m!165043))

(assert (=> b!138343 m!164907))

(assert (=> b!138343 m!164907))

(assert (=> b!138343 m!164925))

(declare-fun m!165045 () Bool)

(assert (=> b!138351 m!165045))

(assert (=> b!138348 m!164907))

(declare-fun m!165047 () Bool)

(assert (=> b!138348 m!165047))

(assert (=> b!138348 m!164933))

(assert (=> b!138348 m!164813))

(assert (=> b!138348 m!164935))

(assert (=> b!138348 m!164907))

(assert (=> b!138348 m!164933))

(assert (=> b!138348 m!164813))

(declare-fun m!165049 () Bool)

(assert (=> b!138341 m!165049))

(assert (=> b!138341 m!164933))

(assert (=> b!138341 m!164813))

(assert (=> b!138341 m!164935))

(declare-fun m!165051 () Bool)

(assert (=> b!138341 m!165051))

(declare-fun m!165053 () Bool)

(assert (=> b!138341 m!165053))

(assert (=> b!138341 m!164907))

(assert (=> b!138341 m!164933))

(assert (=> b!138341 m!164813))

(declare-fun m!165055 () Bool)

(assert (=> b!138341 m!165055))

(assert (=> b!138341 m!165051))

(assert (=> b!138350 m!164907))

(assert (=> b!138350 m!164907))

(declare-fun m!165057 () Bool)

(assert (=> b!138350 m!165057))

(declare-fun m!165059 () Bool)

(assert (=> b!138347 m!165059))

(declare-fun m!165061 () Bool)

(assert (=> d!43127 m!165061))

(assert (=> d!43127 m!164943))

(assert (=> bm!15240 m!165043))

(assert (=> b!138349 m!164907))

(assert (=> b!138349 m!164907))

(assert (=> b!138349 m!164925))

(assert (=> b!138141 d!43127))

(declare-fun d!43129 () Bool)

(declare-fun e!90198 () Bool)

(assert (=> d!43129 e!90198))

(declare-fun res!66250 () Bool)

(assert (=> d!43129 (=> (not res!66250) (not e!90198))))

(declare-fun lt!72278 () ListLongMap!1735)

(assert (=> d!43129 (= res!66250 (contains!916 lt!72278 (_1!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lt!72280 () List!1735)

(assert (=> d!43129 (= lt!72278 (ListLongMap!1736 lt!72280))))

(declare-fun lt!72279 () Unit!4344)

(declare-fun lt!72277 () Unit!4344)

(assert (=> d!43129 (= lt!72279 lt!72277)))

(assert (=> d!43129 (= (getValueByKey!174 lt!72280 (_1!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!89 (List!1735 (_ BitVec 64) V!3531) Unit!4344)

(assert (=> d!43129 (= lt!72277 (lemmaContainsTupThenGetReturnValue!89 lt!72280 (_1!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun insertStrictlySorted!92 (List!1735 (_ BitVec 64) V!3531) List!1735)

(assert (=> d!43129 (= lt!72280 (insertStrictlySorted!92 (toList!883 lt!72136) (_1!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43129 (= (+!177 lt!72136 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72278)))

(declare-fun b!138356 () Bool)

(declare-fun res!66251 () Bool)

(assert (=> b!138356 (=> (not res!66251) (not e!90198))))

(assert (=> b!138356 (= res!66251 (= (getValueByKey!174 (toList!883 lt!72278) (_1!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun b!138357 () Bool)

(declare-fun contains!918 (List!1735 tuple2!2680) Bool)

(assert (=> b!138357 (= e!90198 (contains!918 (toList!883 lt!72278) (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(assert (= (and d!43129 res!66250) b!138356))

(assert (= (and b!138356 res!66251) b!138357))

(declare-fun m!165063 () Bool)

(assert (=> d!43129 m!165063))

(declare-fun m!165065 () Bool)

(assert (=> d!43129 m!165065))

(declare-fun m!165067 () Bool)

(assert (=> d!43129 m!165067))

(declare-fun m!165069 () Bool)

(assert (=> d!43129 m!165069))

(declare-fun m!165071 () Bool)

(assert (=> b!138356 m!165071))

(declare-fun m!165073 () Bool)

(assert (=> b!138357 m!165073))

(assert (=> b!138141 d!43129))

(declare-fun d!43131 () Bool)

(assert (=> d!43131 (= (apply!118 (+!177 lt!72136 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72141) (get!1516 (getValueByKey!174 (toList!883 (+!177 lt!72136 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72141)))))

(declare-fun bs!5791 () Bool)

(assert (= bs!5791 d!43131))

(declare-fun m!165075 () Bool)

(assert (=> bs!5791 m!165075))

(assert (=> bs!5791 m!165075))

(declare-fun m!165077 () Bool)

(assert (=> bs!5791 m!165077))

(assert (=> b!138141 d!43131))

(declare-fun d!43133 () Bool)

(assert (=> d!43133 (contains!916 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72123)))

(declare-fun lt!72283 () Unit!4344)

(declare-fun choose!847 (ListLongMap!1735 (_ BitVec 64) V!3531 (_ BitVec 64)) Unit!4344)

(assert (=> d!43133 (= lt!72283 (choose!847 lt!72127 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72123))))

(assert (=> d!43133 (contains!916 lt!72127 lt!72123)))

(assert (=> d!43133 (= (addStillContains!94 lt!72127 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72123) lt!72283)))

(declare-fun bs!5792 () Bool)

(assert (= bs!5792 d!43133))

(assert (=> bs!5792 m!164895))

(assert (=> bs!5792 m!164895))

(assert (=> bs!5792 m!164897))

(declare-fun m!165079 () Bool)

(assert (=> bs!5792 m!165079))

(declare-fun m!165081 () Bool)

(assert (=> bs!5792 m!165081))

(assert (=> b!138141 d!43133))

(declare-fun d!43135 () Bool)

(assert (=> d!43135 (= (apply!118 lt!72137 lt!72121) (get!1516 (getValueByKey!174 (toList!883 lt!72137) lt!72121)))))

(declare-fun bs!5793 () Bool)

(assert (= bs!5793 d!43135))

(declare-fun m!165083 () Bool)

(assert (=> bs!5793 m!165083))

(assert (=> bs!5793 m!165083))

(declare-fun m!165085 () Bool)

(assert (=> bs!5793 m!165085))

(assert (=> b!138141 d!43135))

(declare-fun d!43137 () Bool)

(declare-fun e!90200 () Bool)

(assert (=> d!43137 e!90200))

(declare-fun res!66252 () Bool)

(assert (=> d!43137 (=> res!66252 e!90200)))

(declare-fun lt!72284 () Bool)

(assert (=> d!43137 (= res!66252 (not lt!72284))))

(declare-fun lt!72286 () Bool)

(assert (=> d!43137 (= lt!72284 lt!72286)))

(declare-fun lt!72287 () Unit!4344)

(declare-fun e!90199 () Unit!4344)

(assert (=> d!43137 (= lt!72287 e!90199)))

(declare-fun c!25865 () Bool)

(assert (=> d!43137 (= c!25865 lt!72286)))

(assert (=> d!43137 (= lt!72286 (containsKey!178 (toList!883 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72123))))

(assert (=> d!43137 (= (contains!916 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72123) lt!72284)))

(declare-fun b!138359 () Bool)

(declare-fun lt!72285 () Unit!4344)

(assert (=> b!138359 (= e!90199 lt!72285)))

(assert (=> b!138359 (= lt!72285 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72123))))

(assert (=> b!138359 (isDefined!127 (getValueByKey!174 (toList!883 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72123))))

(declare-fun b!138360 () Bool)

(declare-fun Unit!4350 () Unit!4344)

(assert (=> b!138360 (= e!90199 Unit!4350)))

(declare-fun b!138361 () Bool)

(assert (=> b!138361 (= e!90200 (isDefined!127 (getValueByKey!174 (toList!883 (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72123)))))

(assert (= (and d!43137 c!25865) b!138359))

(assert (= (and d!43137 (not c!25865)) b!138360))

(assert (= (and d!43137 (not res!66252)) b!138361))

(declare-fun m!165087 () Bool)

(assert (=> d!43137 m!165087))

(declare-fun m!165089 () Bool)

(assert (=> b!138359 m!165089))

(declare-fun m!165091 () Bool)

(assert (=> b!138359 m!165091))

(assert (=> b!138359 m!165091))

(declare-fun m!165093 () Bool)

(assert (=> b!138359 m!165093))

(assert (=> b!138361 m!165091))

(assert (=> b!138361 m!165091))

(assert (=> b!138361 m!165093))

(assert (=> b!138141 d!43137))

(declare-fun d!43139 () Bool)

(declare-fun e!90201 () Bool)

(assert (=> d!43139 e!90201))

(declare-fun res!66253 () Bool)

(assert (=> d!43139 (=> (not res!66253) (not e!90201))))

(declare-fun lt!72289 () ListLongMap!1735)

(assert (=> d!43139 (= res!66253 (contains!916 lt!72289 (_1!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lt!72291 () List!1735)

(assert (=> d!43139 (= lt!72289 (ListLongMap!1736 lt!72291))))

(declare-fun lt!72290 () Unit!4344)

(declare-fun lt!72288 () Unit!4344)

(assert (=> d!43139 (= lt!72290 lt!72288)))

(assert (=> d!43139 (= (getValueByKey!174 lt!72291 (_1!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43139 (= lt!72288 (lemmaContainsTupThenGetReturnValue!89 lt!72291 (_1!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43139 (= lt!72291 (insertStrictlySorted!92 (toList!883 lt!72137) (_1!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43139 (= (+!177 lt!72137 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72289)))

(declare-fun b!138362 () Bool)

(declare-fun res!66254 () Bool)

(assert (=> b!138362 (=> (not res!66254) (not e!90201))))

(assert (=> b!138362 (= res!66254 (= (getValueByKey!174 (toList!883 lt!72289) (_1!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun b!138363 () Bool)

(assert (=> b!138363 (= e!90201 (contains!918 (toList!883 lt!72289) (tuple2!2681 lt!72139 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(assert (= (and d!43139 res!66253) b!138362))

(assert (= (and b!138362 res!66254) b!138363))

(declare-fun m!165095 () Bool)

(assert (=> d!43139 m!165095))

(declare-fun m!165097 () Bool)

(assert (=> d!43139 m!165097))

(declare-fun m!165099 () Bool)

(assert (=> d!43139 m!165099))

(declare-fun m!165101 () Bool)

(assert (=> d!43139 m!165101))

(declare-fun m!165103 () Bool)

(assert (=> b!138362 m!165103))

(declare-fun m!165105 () Bool)

(assert (=> b!138363 m!165105))

(assert (=> b!138141 d!43139))

(declare-fun d!43141 () Bool)

(assert (=> d!43141 (= (apply!118 (+!177 lt!72136 (tuple2!2681 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72141) (apply!118 lt!72136 lt!72141))))

(declare-fun lt!72292 () Unit!4344)

(assert (=> d!43141 (= lt!72292 (choose!846 lt!72136 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72141))))

(declare-fun e!90202 () Bool)

(assert (=> d!43141 e!90202))

(declare-fun res!66255 () Bool)

(assert (=> d!43141 (=> (not res!66255) (not e!90202))))

(assert (=> d!43141 (= res!66255 (contains!916 lt!72136 lt!72141))))

(assert (=> d!43141 (= (addApplyDifferent!94 lt!72136 lt!72134 (minValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72141) lt!72292)))

(declare-fun b!138364 () Bool)

(assert (=> b!138364 (= e!90202 (not (= lt!72141 lt!72134)))))

(assert (= (and d!43141 res!66255) b!138364))

(assert (=> d!43141 m!164909))

(assert (=> d!43141 m!164901))

(declare-fun m!165107 () Bool)

(assert (=> d!43141 m!165107))

(declare-fun m!165109 () Bool)

(assert (=> d!43141 m!165109))

(assert (=> d!43141 m!164901))

(assert (=> d!43141 m!164913))

(assert (=> b!138141 d!43141))

(declare-fun d!43143 () Bool)

(declare-fun e!90203 () Bool)

(assert (=> d!43143 e!90203))

(declare-fun res!66256 () Bool)

(assert (=> d!43143 (=> (not res!66256) (not e!90203))))

(declare-fun lt!72294 () ListLongMap!1735)

(assert (=> d!43143 (= res!66256 (contains!916 lt!72294 (_1!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lt!72296 () List!1735)

(assert (=> d!43143 (= lt!72294 (ListLongMap!1736 lt!72296))))

(declare-fun lt!72295 () Unit!4344)

(declare-fun lt!72293 () Unit!4344)

(assert (=> d!43143 (= lt!72295 lt!72293)))

(assert (=> d!43143 (= (getValueByKey!174 lt!72296 (_1!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43143 (= lt!72293 (lemmaContainsTupThenGetReturnValue!89 lt!72296 (_1!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43143 (= lt!72296 (insertStrictlySorted!92 (toList!883 lt!72127) (_1!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43143 (= (+!177 lt!72127 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72294)))

(declare-fun b!138365 () Bool)

(declare-fun res!66257 () Bool)

(assert (=> b!138365 (=> (not res!66257) (not e!90203))))

(assert (=> b!138365 (= res!66257 (= (getValueByKey!174 (toList!883 lt!72294) (_1!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun b!138366 () Bool)

(assert (=> b!138366 (= e!90203 (contains!918 (toList!883 lt!72294) (tuple2!2681 lt!72132 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(assert (= (and d!43143 res!66256) b!138365))

(assert (= (and b!138365 res!66257) b!138366))

(declare-fun m!165111 () Bool)

(assert (=> d!43143 m!165111))

(declare-fun m!165113 () Bool)

(assert (=> d!43143 m!165113))

(declare-fun m!165115 () Bool)

(assert (=> d!43143 m!165115))

(declare-fun m!165117 () Bool)

(assert (=> d!43143 m!165117))

(declare-fun m!165119 () Bool)

(assert (=> b!138365 m!165119))

(declare-fun m!165121 () Bool)

(assert (=> b!138366 m!165121))

(assert (=> b!138141 d!43143))

(declare-fun d!43145 () Bool)

(assert (=> d!43145 (= (apply!118 lt!72138 lt!72125) (get!1516 (getValueByKey!174 (toList!883 lt!72138) lt!72125)))))

(declare-fun bs!5794 () Bool)

(assert (= bs!5794 d!43145))

(declare-fun m!165123 () Bool)

(assert (=> bs!5794 m!165123))

(assert (=> bs!5794 m!165123))

(declare-fun m!165125 () Bool)

(assert (=> bs!5794 m!165125))

(assert (=> b!138141 d!43145))

(declare-fun d!43147 () Bool)

(assert (=> d!43147 (= (apply!118 (+!177 lt!72138 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72125) (apply!118 lt!72138 lt!72125))))

(declare-fun lt!72297 () Unit!4344)

(assert (=> d!43147 (= lt!72297 (choose!846 lt!72138 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72125))))

(declare-fun e!90204 () Bool)

(assert (=> d!43147 e!90204))

(declare-fun res!66258 () Bool)

(assert (=> d!43147 (=> (not res!66258) (not e!90204))))

(assert (=> d!43147 (= res!66258 (contains!916 lt!72138 lt!72125))))

(assert (=> d!43147 (= (addApplyDifferent!94 lt!72138 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) lt!72125) lt!72297)))

(declare-fun b!138367 () Bool)

(assert (=> b!138367 (= e!90204 (not (= lt!72125 lt!72128)))))

(assert (= (and d!43147 res!66258) b!138367))

(assert (=> d!43147 m!164917))

(assert (=> d!43147 m!164893))

(declare-fun m!165127 () Bool)

(assert (=> d!43147 m!165127))

(declare-fun m!165129 () Bool)

(assert (=> d!43147 m!165129))

(assert (=> d!43147 m!164893))

(assert (=> d!43147 m!164903))

(assert (=> b!138141 d!43147))

(declare-fun d!43149 () Bool)

(declare-fun e!90205 () Bool)

(assert (=> d!43149 e!90205))

(declare-fun res!66259 () Bool)

(assert (=> d!43149 (=> (not res!66259) (not e!90205))))

(declare-fun lt!72299 () ListLongMap!1735)

(assert (=> d!43149 (= res!66259 (contains!916 lt!72299 (_1!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lt!72301 () List!1735)

(assert (=> d!43149 (= lt!72299 (ListLongMap!1736 lt!72301))))

(declare-fun lt!72300 () Unit!4344)

(declare-fun lt!72298 () Unit!4344)

(assert (=> d!43149 (= lt!72300 lt!72298)))

(assert (=> d!43149 (= (getValueByKey!174 lt!72301 (_1!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43149 (= lt!72298 (lemmaContainsTupThenGetReturnValue!89 lt!72301 (_1!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43149 (= lt!72301 (insertStrictlySorted!92 (toList!883 lt!72138) (_1!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43149 (= (+!177 lt!72138 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72299)))

(declare-fun b!138368 () Bool)

(declare-fun res!66260 () Bool)

(assert (=> b!138368 (=> (not res!66260) (not e!90205))))

(assert (=> b!138368 (= res!66260 (= (getValueByKey!174 (toList!883 lt!72299) (_1!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun b!138369 () Bool)

(assert (=> b!138369 (= e!90205 (contains!918 (toList!883 lt!72299) (tuple2!2681 lt!72128 (zeroValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(assert (= (and d!43149 res!66259) b!138368))

(assert (= (and b!138368 res!66260) b!138369))

(declare-fun m!165131 () Bool)

(assert (=> d!43149 m!165131))

(declare-fun m!165133 () Bool)

(assert (=> d!43149 m!165133))

(declare-fun m!165135 () Bool)

(assert (=> d!43149 m!165135))

(declare-fun m!165137 () Bool)

(assert (=> d!43149 m!165137))

(declare-fun m!165139 () Bool)

(assert (=> b!138368 m!165139))

(declare-fun m!165141 () Bool)

(assert (=> b!138369 m!165141))

(assert (=> b!138141 d!43149))

(declare-fun d!43151 () Bool)

(assert (=> d!43151 (= (apply!118 lt!72135 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1516 (getValueByKey!174 (toList!883 lt!72135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5795 () Bool)

(assert (= bs!5795 d!43151))

(declare-fun m!165143 () Bool)

(assert (=> bs!5795 m!165143))

(assert (=> bs!5795 m!165143))

(declare-fun m!165145 () Bool)

(assert (=> bs!5795 m!165145))

(assert (=> b!138143 d!43151))

(declare-fun bm!15243 () Bool)

(declare-fun call!15246 () Bool)

(assert (=> bm!15243 (= call!15246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun d!43153 () Bool)

(declare-fun res!66265 () Bool)

(declare-fun e!90213 () Bool)

(assert (=> d!43153 (=> res!66265 e!90213)))

(assert (=> d!43153 (= res!66265 (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4676 newMap!16) (mask!7249 newMap!16)) e!90213)))

(declare-fun b!138378 () Bool)

(declare-fun e!90214 () Bool)

(assert (=> b!138378 (= e!90213 e!90214)))

(declare-fun c!25868 () Bool)

(assert (=> b!138378 (= c!25868 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138379 () Bool)

(declare-fun e!90212 () Bool)

(assert (=> b!138379 (= e!90214 e!90212)))

(declare-fun lt!72310 () (_ BitVec 64))

(assert (=> b!138379 (= lt!72310 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72309 () Unit!4344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4857 (_ BitVec 64) (_ BitVec 32)) Unit!4344)

(assert (=> b!138379 (= lt!72309 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4676 newMap!16) lt!72310 #b00000000000000000000000000000000))))

(assert (=> b!138379 (arrayContainsKey!0 (_keys!4676 newMap!16) lt!72310 #b00000000000000000000000000000000)))

(declare-fun lt!72308 () Unit!4344)

(assert (=> b!138379 (= lt!72308 lt!72309)))

(declare-fun res!66266 () Bool)

(assert (=> b!138379 (= res!66266 (= (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000) (_keys!4676 newMap!16) (mask!7249 newMap!16)) (Found!277 #b00000000000000000000000000000000)))))

(assert (=> b!138379 (=> (not res!66266) (not e!90212))))

(declare-fun b!138380 () Bool)

(assert (=> b!138380 (= e!90214 call!15246)))

(declare-fun b!138381 () Bool)

(assert (=> b!138381 (= e!90212 call!15246)))

(assert (= (and d!43153 (not res!66265)) b!138378))

(assert (= (and b!138378 c!25868) b!138379))

(assert (= (and b!138378 (not c!25868)) b!138380))

(assert (= (and b!138379 res!66266) b!138381))

(assert (= (or b!138381 b!138380) bm!15243))

(declare-fun m!165147 () Bool)

(assert (=> bm!15243 m!165147))

(declare-fun m!165149 () Bool)

(assert (=> b!138378 m!165149))

(assert (=> b!138378 m!165149))

(declare-fun m!165151 () Bool)

(assert (=> b!138378 m!165151))

(assert (=> b!138379 m!165149))

(declare-fun m!165153 () Bool)

(assert (=> b!138379 m!165153))

(declare-fun m!165155 () Bool)

(assert (=> b!138379 m!165155))

(assert (=> b!138379 m!165149))

(declare-fun m!165157 () Bool)

(assert (=> b!138379 m!165157))

(assert (=> b!138084 d!43153))

(declare-fun d!43155 () Bool)

(declare-fun res!66276 () Bool)

(declare-fun e!90217 () Bool)

(assert (=> d!43155 (=> (not res!66276) (not e!90217))))

(assert (=> d!43155 (= res!66276 (validMask!0 (mask!7249 newMap!16)))))

(assert (=> d!43155 (= (simpleValid!94 newMap!16) e!90217)))

(declare-fun b!138392 () Bool)

(declare-fun res!66277 () Bool)

(assert (=> b!138392 (=> (not res!66277) (not e!90217))))

(declare-fun size!2572 (LongMapFixedSize!1134) (_ BitVec 32))

(assert (=> b!138392 (= res!66277 (= (size!2572 newMap!16) (bvadd (_size!616 newMap!16) (bvsdiv (bvadd (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!138390 () Bool)

(declare-fun res!66275 () Bool)

(assert (=> b!138390 (=> (not res!66275) (not e!90217))))

(assert (=> b!138390 (= res!66275 (and (= (size!2569 (_values!2902 newMap!16)) (bvadd (mask!7249 newMap!16) #b00000000000000000000000000000001)) (= (size!2568 (_keys!4676 newMap!16)) (size!2569 (_values!2902 newMap!16))) (bvsge (_size!616 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!616 newMap!16) (bvadd (mask!7249 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!138393 () Bool)

(assert (=> b!138393 (= e!90217 (and (bvsge (extraKeys!2676 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2676 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!616 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!138391 () Bool)

(declare-fun res!66278 () Bool)

(assert (=> b!138391 (=> (not res!66278) (not e!90217))))

(assert (=> b!138391 (= res!66278 (bvsge (size!2572 newMap!16) (_size!616 newMap!16)))))

(assert (= (and d!43155 res!66276) b!138390))

(assert (= (and b!138390 res!66275) b!138391))

(assert (= (and b!138391 res!66278) b!138392))

(assert (= (and b!138392 res!66277) b!138393))

(assert (=> d!43155 m!165021))

(declare-fun m!165159 () Bool)

(assert (=> b!138392 m!165159))

(assert (=> b!138391 m!165159))

(assert (=> d!43097 d!43155))

(declare-fun d!43157 () Bool)

(assert (=> d!43157 (= (+!177 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) lt!72209 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72313 () Unit!4344)

(declare-fun choose!848 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 V!3531 Int) Unit!4344)

(assert (=> d!43157 (= lt!72313 (choose!848 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72209 (zeroValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2770 newMap!16) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43157 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43157 (= (lemmaChangeZeroKeyThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72209 (zeroValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2770 newMap!16) (defaultEntry!2919 newMap!16)) lt!72313)))

(declare-fun bs!5796 () Bool)

(assert (= bs!5796 d!43157))

(assert (=> bs!5796 m!165021))

(assert (=> bs!5796 m!164815))

(declare-fun m!165161 () Bool)

(assert (=> bs!5796 m!165161))

(assert (=> bs!5796 m!164885))

(assert (=> bs!5796 m!164885))

(declare-fun m!165163 () Bool)

(assert (=> bs!5796 m!165163))

(assert (=> bs!5796 m!164815))

(declare-fun m!165165 () Bool)

(assert (=> bs!5796 m!165165))

(assert (=> b!138265 d!43157))

(declare-fun d!43159 () Bool)

(declare-fun res!66279 () Bool)

(declare-fun e!90218 () Bool)

(assert (=> d!43159 (=> (not res!66279) (not e!90218))))

(assert (=> d!43159 (= res!66279 (simpleValid!94 (_2!1352 lt!72227)))))

(assert (=> d!43159 (= (valid!548 (_2!1352 lt!72227)) e!90218)))

(declare-fun b!138394 () Bool)

(declare-fun res!66280 () Bool)

(assert (=> b!138394 (=> (not res!66280) (not e!90218))))

(assert (=> b!138394 (= res!66280 (= (arrayCountValidKeys!0 (_keys!4676 (_2!1352 lt!72227)) #b00000000000000000000000000000000 (size!2568 (_keys!4676 (_2!1352 lt!72227)))) (_size!616 (_2!1352 lt!72227))))))

(declare-fun b!138395 () Bool)

(declare-fun res!66281 () Bool)

(assert (=> b!138395 (=> (not res!66281) (not e!90218))))

(assert (=> b!138395 (= res!66281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4676 (_2!1352 lt!72227)) (mask!7249 (_2!1352 lt!72227))))))

(declare-fun b!138396 () Bool)

(assert (=> b!138396 (= e!90218 (arrayNoDuplicates!0 (_keys!4676 (_2!1352 lt!72227)) #b00000000000000000000000000000000 Nil!1733))))

(assert (= (and d!43159 res!66279) b!138394))

(assert (= (and b!138394 res!66280) b!138395))

(assert (= (and b!138395 res!66281) b!138396))

(declare-fun m!165167 () Bool)

(assert (=> d!43159 m!165167))

(declare-fun m!165169 () Bool)

(assert (=> b!138394 m!165169))

(declare-fun m!165171 () Bool)

(assert (=> b!138395 m!165171))

(declare-fun m!165173 () Bool)

(assert (=> b!138396 m!165173))

(assert (=> d!43105 d!43159))

(assert (=> d!43105 d!43097))

(declare-fun b!138413 () Bool)

(declare-fun e!90229 () Bool)

(declare-fun call!15251 () Bool)

(assert (=> b!138413 (= e!90229 (not call!15251))))

(declare-fun b!138414 () Bool)

(declare-fun res!66290 () Bool)

(assert (=> b!138414 (=> (not res!66290) (not e!90229))))

(declare-fun lt!72319 () SeekEntryResult!277)

(assert (=> b!138414 (= res!66290 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3273 lt!72319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138414 (and (bvsge (index!3273 lt!72319) #b00000000000000000000000000000000) (bvslt (index!3273 lt!72319) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138415 () Bool)

(declare-fun e!90230 () Bool)

(assert (=> b!138415 (= e!90230 (not call!15251))))

(declare-fun b!138416 () Bool)

(assert (=> b!138416 (and (bvsge (index!3270 lt!72319) #b00000000000000000000000000000000) (bvslt (index!3270 lt!72319) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun res!66291 () Bool)

(assert (=> b!138416 (= res!66291 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3270 lt!72319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138416 (=> (not res!66291) (not e!90230))))

(declare-fun b!138417 () Bool)

(declare-fun e!90227 () Bool)

(assert (=> b!138417 (= e!90227 ((_ is Undefined!277) lt!72319))))

(declare-fun call!15252 () Bool)

(declare-fun bm!15249 () Bool)

(declare-fun c!25874 () Bool)

(assert (=> bm!15249 (= call!15252 (inRange!0 (ite c!25874 (index!3270 lt!72319) (index!3273 lt!72319)) (mask!7249 newMap!16)))))

(declare-fun b!138418 () Bool)

(declare-fun e!90228 () Bool)

(assert (=> b!138418 (= e!90228 e!90227)))

(declare-fun c!25873 () Bool)

(assert (=> b!138418 (= c!25873 ((_ is MissingVacant!277) lt!72319))))

(declare-fun b!138419 () Bool)

(assert (=> b!138419 (= e!90228 e!90230)))

(declare-fun res!66293 () Bool)

(assert (=> b!138419 (= res!66293 call!15252)))

(assert (=> b!138419 (=> (not res!66293) (not e!90230))))

(declare-fun b!138420 () Bool)

(declare-fun res!66292 () Bool)

(assert (=> b!138420 (=> (not res!66292) (not e!90229))))

(assert (=> b!138420 (= res!66292 call!15252)))

(assert (=> b!138420 (= e!90227 e!90229)))

(declare-fun d!43161 () Bool)

(assert (=> d!43161 e!90228))

(assert (=> d!43161 (= c!25874 ((_ is MissingZero!277) lt!72319))))

(assert (=> d!43161 (= lt!72319 (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun lt!72318 () Unit!4344)

(declare-fun choose!849 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) Int) Unit!4344)

(assert (=> d!43161 (= lt!72318 (choose!849 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43161 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43161 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)) lt!72318)))

(declare-fun bm!15248 () Bool)

(assert (=> bm!15248 (= call!15251 (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!43161 c!25874) b!138419))

(assert (= (and d!43161 (not c!25874)) b!138418))

(assert (= (and b!138419 res!66293) b!138416))

(assert (= (and b!138416 res!66291) b!138415))

(assert (= (and b!138418 c!25873) b!138420))

(assert (= (and b!138418 (not c!25873)) b!138417))

(assert (= (and b!138420 res!66292) b!138414))

(assert (= (and b!138414 res!66290) b!138413))

(assert (= (or b!138419 b!138420) bm!15249))

(assert (= (or b!138415 b!138413) bm!15248))

(declare-fun m!165175 () Bool)

(assert (=> bm!15249 m!165175))

(declare-fun m!165177 () Bool)

(assert (=> b!138416 m!165177))

(declare-fun m!165179 () Bool)

(assert (=> b!138414 m!165179))

(assert (=> d!43161 m!164795))

(assert (=> d!43161 m!164961))

(assert (=> d!43161 m!164795))

(declare-fun m!165181 () Bool)

(assert (=> d!43161 m!165181))

(assert (=> d!43161 m!165021))

(assert (=> bm!15248 m!164795))

(assert (=> bm!15248 m!164973))

(assert (=> bm!15236 d!43161))

(declare-fun b!138455 () Bool)

(declare-fun res!66320 () Bool)

(declare-fun call!15261 () Bool)

(assert (=> b!138455 (= res!66320 call!15261)))

(declare-fun e!90252 () Bool)

(assert (=> b!138455 (=> (not res!66320) (not e!90252))))

(declare-fun b!138456 () Bool)

(declare-fun res!66318 () Bool)

(declare-fun lt!72402 () SeekEntryResult!277)

(assert (=> b!138456 (= res!66318 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3273 lt!72402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90250 () Bool)

(assert (=> b!138456 (=> (not res!66318) (not e!90250))))

(declare-fun b!138457 () Bool)

(declare-fun res!66315 () Bool)

(declare-fun e!90254 () Bool)

(assert (=> b!138457 (=> (not res!66315) (not e!90254))))

(assert (=> b!138457 (= res!66315 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3270 lt!72402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138458 () Bool)

(declare-fun e!90248 () Bool)

(assert (=> b!138458 (= e!90248 ((_ is Undefined!277) lt!72402))))

(declare-fun bm!15258 () Bool)

(declare-fun c!25883 () Bool)

(declare-fun lt!72394 () SeekEntryResult!277)

(declare-fun c!25885 () Bool)

(assert (=> bm!15258 (= call!15261 (inRange!0 (ite c!25883 (index!3271 lt!72394) (ite c!25885 (index!3270 lt!72402) (index!3273 lt!72402))) (mask!7249 newMap!16)))))

(declare-fun b!138459 () Bool)

(assert (=> b!138459 (= e!90252 (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72394)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138460 () Bool)

(declare-fun e!90249 () Unit!4344)

(declare-fun Unit!4351 () Unit!4344)

(assert (=> b!138460 (= e!90249 Unit!4351)))

(declare-fun lt!72398 () Unit!4344)

(assert (=> b!138460 (= lt!72398 (lemmaInListMapThenSeekEntryOrOpenFindsIt!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(declare-fun call!15262 () SeekEntryResult!277)

(assert (=> b!138460 (= lt!72394 call!15262)))

(declare-fun res!66314 () Bool)

(assert (=> b!138460 (= res!66314 ((_ is Found!277) lt!72394))))

(assert (=> b!138460 (=> (not res!66314) (not e!90252))))

(assert (=> b!138460 e!90252))

(declare-fun lt!72403 () Unit!4344)

(assert (=> b!138460 (= lt!72403 lt!72398)))

(assert (=> b!138460 false))

(declare-fun b!138462 () Bool)

(declare-fun call!15263 () Bool)

(assert (=> b!138462 (= e!90250 (not call!15263))))

(declare-fun b!138463 () Bool)

(declare-fun res!66317 () Bool)

(assert (=> b!138463 (=> (not res!66317) (not e!90254))))

(declare-fun call!15264 () Bool)

(assert (=> b!138463 (= res!66317 call!15264)))

(declare-fun e!90251 () Bool)

(assert (=> b!138463 (= e!90251 e!90254)))

(declare-fun b!138464 () Bool)

(declare-fun e!90247 () Unit!4344)

(declare-fun Unit!4352 () Unit!4344)

(assert (=> b!138464 (= e!90247 Unit!4352)))

(declare-fun lt!72383 () Unit!4344)

(declare-fun lemmaArrayContainsKeyThenInListMap!44 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 64) (_ BitVec 32) Int) Unit!4344)

(assert (=> b!138464 (= lt!72383 (lemmaArrayContainsKeyThenInListMap!44 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(assert (=> b!138464 (contains!916 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))

(declare-fun lt!72404 () Unit!4344)

(assert (=> b!138464 (= lt!72404 lt!72383)))

(assert (=> b!138464 false))

(declare-fun bm!15259 () Bool)

(assert (=> bm!15259 (= call!15264 call!15261)))

(declare-fun b!138465 () Bool)

(declare-fun Unit!4353 () Unit!4344)

(assert (=> b!138465 (= e!90247 Unit!4353)))

(declare-fun e!90253 () Bool)

(declare-fun lt!72409 () tuple2!2682)

(declare-fun b!138466 () Bool)

(assert (=> b!138466 (= e!90253 (= (map!1432 (_2!1352 lt!72409)) (+!177 (map!1432 newMap!16) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!138467 () Bool)

(declare-fun lt!72392 () Unit!4344)

(assert (=> b!138467 (= e!90249 lt!72392)))

(assert (=> b!138467 (= lt!72392 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (defaultEntry!2919 newMap!16)))))

(assert (=> b!138467 (= lt!72402 call!15262)))

(assert (=> b!138467 (= c!25885 ((_ is MissingZero!277) lt!72402))))

(assert (=> b!138467 e!90251))

(declare-fun bm!15260 () Bool)

(assert (=> bm!15260 (= call!15263 (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138468 () Bool)

(assert (=> b!138468 (= e!90248 e!90250)))

(declare-fun res!66319 () Bool)

(assert (=> b!138468 (= res!66319 call!15264)))

(assert (=> b!138468 (=> (not res!66319) (not e!90250))))

(declare-fun b!138469 () Bool)

(declare-fun c!25886 () Bool)

(assert (=> b!138469 (= c!25886 ((_ is MissingVacant!277) lt!72402))))

(assert (=> b!138469 (= e!90251 e!90248)))

(declare-fun bm!15261 () Bool)

(assert (=> bm!15261 (= call!15262 (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun d!43163 () Bool)

(assert (=> d!43163 e!90253))

(declare-fun res!66316 () Bool)

(assert (=> d!43163 (=> (not res!66316) (not e!90253))))

(assert (=> d!43163 (= res!66316 (_1!1352 lt!72409))))

(assert (=> d!43163 (= lt!72409 (tuple2!2683 true (LongMapFixedSize!1135 (defaultEntry!2919 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (bvadd (_size!616 newMap!16) #b00000000000000000000000000000001) (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (_vacant!616 newMap!16))))))

(declare-fun lt!72387 () Unit!4344)

(declare-fun lt!72389 () Unit!4344)

(assert (=> d!43163 (= lt!72387 lt!72389)))

(declare-fun lt!72399 () array!4859)

(declare-fun lt!72408 () array!4857)

(assert (=> d!43163 (contains!916 (getCurrentListMap!557 lt!72408 lt!72399 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (select (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229))))))

(assert (=> d!43163 (= lt!72389 (lemmaValidKeyInArrayIsInListMap!124 lt!72408 lt!72399 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43163 (= lt!72399 (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))))))

(assert (=> d!43163 (= lt!72408 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun lt!72382 () Unit!4344)

(declare-fun lt!72385 () Unit!4344)

(assert (=> d!43163 (= lt!72382 lt!72385)))

(declare-fun lt!72393 () array!4857)

(assert (=> d!43163 (= (arrayCountValidKeys!0 lt!72393 (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (bvadd (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4857 (_ BitVec 32)) Unit!4344)

(assert (=> d!43163 (= lt!72385 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!72393 (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229))))))

(assert (=> d!43163 (= lt!72393 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun lt!72388 () Unit!4344)

(declare-fun lt!72381 () Unit!4344)

(assert (=> d!43163 (= lt!72388 lt!72381)))

(declare-fun lt!72390 () array!4857)

(assert (=> d!43163 (arrayContainsKey!0 lt!72390 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!43163 (= lt!72381 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!72390 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229))))))

(assert (=> d!43163 (= lt!72390 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun lt!72400 () Unit!4344)

(declare-fun lt!72407 () Unit!4344)

(assert (=> d!43163 (= lt!72400 lt!72407)))

(assert (=> d!43163 (= (+!177 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!557 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!44 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) (_ BitVec 64) V!3531 Int) Unit!4344)

(assert (=> d!43163 (= lt!72407 (lemmaAddValidKeyToArrayThenAddPairToListMap!44 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72401 () Unit!4344)

(declare-fun lt!72397 () Unit!4344)

(assert (=> d!43163 (= lt!72401 lt!72397)))

(assert (=> d!43163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))) (mask!7249 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4857 (_ BitVec 32) (_ BitVec 32)) Unit!4344)

(assert (=> d!43163 (= lt!72397 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (mask!7249 newMap!16)))))

(declare-fun lt!72380 () Unit!4344)

(declare-fun lt!72406 () Unit!4344)

(assert (=> d!43163 (= lt!72380 lt!72406)))

(assert (=> d!43163 (= (arrayCountValidKeys!0 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))) #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4676 newMap!16) #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4857 (_ BitVec 32) (_ BitVec 64)) Unit!4344)

(assert (=> d!43163 (= lt!72406 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4676 newMap!16) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun lt!72396 () Unit!4344)

(declare-fun lt!72391 () Unit!4344)

(assert (=> d!43163 (= lt!72396 lt!72391)))

(declare-fun lt!72386 () List!1736)

(declare-fun lt!72405 () (_ BitVec 32))

(assert (=> d!43163 (arrayNoDuplicates!0 (array!4858 (store (arr!2297 (_keys!4676 newMap!16)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (size!2568 (_keys!4676 newMap!16))) lt!72405 lt!72386)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4857 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1736) Unit!4344)

(assert (=> d!43163 (= lt!72391 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229)) lt!72405 lt!72386))))

(assert (=> d!43163 (= lt!72386 Nil!1733)))

(assert (=> d!43163 (= lt!72405 #b00000000000000000000000000000000)))

(declare-fun lt!72384 () Unit!4344)

(assert (=> d!43163 (= lt!72384 e!90247)))

(declare-fun c!25884 () Bool)

(assert (=> d!43163 (= c!25884 (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!72395 () Unit!4344)

(assert (=> d!43163 (= lt!72395 e!90249)))

(assert (=> d!43163 (= c!25883 (contains!916 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43163 (valid!548 newMap!16)))

(assert (=> d!43163 (= (updateHelperNewKey!63 newMap!16 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25837 (index!3273 lt!72229) (index!3270 lt!72229))) lt!72409)))

(declare-fun b!138461 () Bool)

(declare-fun res!66313 () Bool)

(assert (=> b!138461 (=> (not res!66313) (not e!90253))))

(assert (=> b!138461 (= res!66313 (valid!548 (_2!1352 lt!72409)))))

(declare-fun b!138470 () Bool)

(assert (=> b!138470 (= e!90254 (not call!15263))))

(declare-fun b!138471 () Bool)

(declare-fun res!66312 () Bool)

(assert (=> b!138471 (=> (not res!66312) (not e!90253))))

(assert (=> b!138471 (= res!66312 (contains!916 (map!1432 (_2!1352 lt!72409)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (= (and d!43163 c!25883) b!138460))

(assert (= (and d!43163 (not c!25883)) b!138467))

(assert (= (and b!138460 res!66314) b!138455))

(assert (= (and b!138455 res!66320) b!138459))

(assert (= (and b!138467 c!25885) b!138463))

(assert (= (and b!138467 (not c!25885)) b!138469))

(assert (= (and b!138463 res!66317) b!138457))

(assert (= (and b!138457 res!66315) b!138470))

(assert (= (and b!138469 c!25886) b!138468))

(assert (= (and b!138469 (not c!25886)) b!138458))

(assert (= (and b!138468 res!66319) b!138456))

(assert (= (and b!138456 res!66318) b!138462))

(assert (= (or b!138463 b!138468) bm!15259))

(assert (= (or b!138470 b!138462) bm!15260))

(assert (= (or b!138455 bm!15259) bm!15258))

(assert (= (or b!138460 b!138467) bm!15261))

(assert (= (and d!43163 c!25884) b!138464))

(assert (= (and d!43163 (not c!25884)) b!138465))

(assert (= (and d!43163 res!66316) b!138461))

(assert (= (and b!138461 res!66313) b!138471))

(assert (= (and b!138471 res!66312) b!138466))

(declare-fun m!165183 () Bool)

(assert (=> b!138461 m!165183))

(declare-fun m!165185 () Bool)

(assert (=> b!138459 m!165185))

(assert (=> bm!15261 m!164795))

(assert (=> bm!15261 m!164961))

(declare-fun m!165187 () Bool)

(assert (=> b!138456 m!165187))

(declare-fun m!165189 () Bool)

(assert (=> b!138457 m!165189))

(assert (=> b!138467 m!164795))

(assert (=> b!138467 m!165005))

(assert (=> b!138464 m!164795))

(declare-fun m!165191 () Bool)

(assert (=> b!138464 m!165191))

(assert (=> b!138464 m!164885))

(assert (=> b!138464 m!164885))

(assert (=> b!138464 m!164795))

(declare-fun m!165193 () Bool)

(assert (=> b!138464 m!165193))

(declare-fun m!165195 () Bool)

(assert (=> b!138466 m!165195))

(assert (=> b!138466 m!164797))

(assert (=> b!138466 m!164797))

(declare-fun m!165197 () Bool)

(assert (=> b!138466 m!165197))

(declare-fun m!165199 () Bool)

(assert (=> bm!15258 m!165199))

(assert (=> bm!15260 m!164795))

(assert (=> bm!15260 m!164973))

(declare-fun m!165201 () Bool)

(assert (=> d!43163 m!165201))

(assert (=> d!43163 m!164791))

(declare-fun m!165203 () Bool)

(assert (=> d!43163 m!165203))

(declare-fun m!165205 () Bool)

(assert (=> d!43163 m!165205))

(assert (=> d!43163 m!164879))

(declare-fun m!165207 () Bool)

(assert (=> d!43163 m!165207))

(assert (=> d!43163 m!164885))

(assert (=> d!43163 m!164795))

(assert (=> d!43163 m!165193))

(declare-fun m!165209 () Bool)

(assert (=> d!43163 m!165209))

(assert (=> d!43163 m!164795))

(assert (=> d!43163 m!164815))

(declare-fun m!165211 () Bool)

(assert (=> d!43163 m!165211))

(declare-fun m!165213 () Bool)

(assert (=> d!43163 m!165213))

(assert (=> d!43163 m!164885))

(assert (=> d!43163 m!164795))

(declare-fun m!165215 () Bool)

(assert (=> d!43163 m!165215))

(declare-fun m!165217 () Bool)

(assert (=> d!43163 m!165217))

(declare-fun m!165219 () Bool)

(assert (=> d!43163 m!165219))

(assert (=> d!43163 m!164795))

(declare-fun m!165221 () Bool)

(assert (=> d!43163 m!165221))

(assert (=> d!43163 m!164795))

(declare-fun m!165223 () Bool)

(assert (=> d!43163 m!165223))

(assert (=> d!43163 m!164795))

(declare-fun m!165225 () Bool)

(assert (=> d!43163 m!165225))

(assert (=> d!43163 m!164795))

(assert (=> d!43163 m!164973))

(assert (=> d!43163 m!165213))

(assert (=> d!43163 m!165217))

(declare-fun m!165227 () Bool)

(assert (=> d!43163 m!165227))

(declare-fun m!165229 () Bool)

(assert (=> d!43163 m!165229))

(declare-fun m!165231 () Bool)

(assert (=> d!43163 m!165231))

(assert (=> d!43163 m!164795))

(declare-fun m!165233 () Bool)

(assert (=> d!43163 m!165233))

(assert (=> d!43163 m!164885))

(declare-fun m!165235 () Bool)

(assert (=> d!43163 m!165235))

(declare-fun m!165237 () Bool)

(assert (=> d!43163 m!165237))

(assert (=> b!138471 m!165195))

(assert (=> b!138471 m!165195))

(assert (=> b!138471 m!164795))

(declare-fun m!165239 () Bool)

(assert (=> b!138471 m!165239))

(assert (=> b!138460 m!164795))

(assert (=> b!138460 m!164999))

(assert (=> bm!15224 d!43163))

(assert (=> b!138073 d!43113))

(declare-fun d!43165 () Bool)

(assert (=> d!43165 (= (inRange!0 (ite c!25839 (ite c!25836 (index!3271 lt!72216) (ite c!25846 (index!3270 lt!72215) (index!3273 lt!72215))) (ite c!25841 (index!3271 lt!72218) (ite c!25840 (index!3270 lt!72230) (index!3273 lt!72230)))) (mask!7249 newMap!16)) (and (bvsge (ite c!25839 (ite c!25836 (index!3271 lt!72216) (ite c!25846 (index!3270 lt!72215) (index!3273 lt!72215))) (ite c!25841 (index!3271 lt!72218) (ite c!25840 (index!3270 lt!72230) (index!3273 lt!72230)))) #b00000000000000000000000000000000) (bvslt (ite c!25839 (ite c!25836 (index!3271 lt!72216) (ite c!25846 (index!3270 lt!72215) (index!3273 lt!72215))) (ite c!25841 (index!3271 lt!72218) (ite c!25840 (index!3270 lt!72230) (index!3273 lt!72230)))) (bvadd (mask!7249 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15225 d!43165))

(declare-fun d!43167 () Bool)

(declare-fun lt!72412 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!136 (List!1736) (InoxSet (_ BitVec 64)))

(assert (=> d!43167 (= lt!72412 (select (content!136 Nil!1733) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!90260 () Bool)

(assert (=> d!43167 (= lt!72412 e!90260)))

(declare-fun res!66325 () Bool)

(assert (=> d!43167 (=> (not res!66325) (not e!90260))))

(assert (=> d!43167 (= res!66325 ((_ is Cons!1732) Nil!1733))))

(assert (=> d!43167 (= (contains!917 Nil!1733 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)) lt!72412)))

(declare-fun b!138476 () Bool)

(declare-fun e!90259 () Bool)

(assert (=> b!138476 (= e!90260 e!90259)))

(declare-fun res!66326 () Bool)

(assert (=> b!138476 (=> res!66326 e!90259)))

(assert (=> b!138476 (= res!66326 (= (h!2339 Nil!1733) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!138477 () Bool)

(assert (=> b!138477 (= e!90259 (contains!917 (t!6280 Nil!1733) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!43167 res!66325) b!138476))

(assert (= (and b!138476 (not res!66326)) b!138477))

(declare-fun m!165241 () Bool)

(assert (=> d!43167 m!165241))

(assert (=> d!43167 m!164867))

(declare-fun m!165243 () Bool)

(assert (=> d!43167 m!165243))

(assert (=> b!138477 m!164867))

(declare-fun m!165245 () Bool)

(assert (=> b!138477 m!165245))

(assert (=> b!138072 d!43167))

(declare-fun d!43169 () Bool)

(declare-fun res!66327 () Bool)

(declare-fun e!90261 () Bool)

(assert (=> d!43169 (=> (not res!66327) (not e!90261))))

(assert (=> d!43169 (= res!66327 (simpleValid!94 (v!3255 (underlying!472 thiss!992))))))

(assert (=> d!43169 (= (valid!548 (v!3255 (underlying!472 thiss!992))) e!90261)))

(declare-fun b!138478 () Bool)

(declare-fun res!66328 () Bool)

(assert (=> b!138478 (=> (not res!66328) (not e!90261))))

(assert (=> b!138478 (= res!66328 (= (arrayCountValidKeys!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000000 (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))) (_size!616 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138479 () Bool)

(declare-fun res!66329 () Bool)

(assert (=> b!138479 (=> (not res!66329) (not e!90261))))

(assert (=> b!138479 (= res!66329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992)))))))

(declare-fun b!138480 () Bool)

(assert (=> b!138480 (= e!90261 (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000000 Nil!1733))))

(assert (= (and d!43169 res!66327) b!138478))

(assert (= (and b!138478 res!66328) b!138479))

(assert (= (and b!138479 res!66329) b!138480))

(declare-fun m!165247 () Bool)

(assert (=> d!43169 m!165247))

(declare-fun m!165249 () Bool)

(assert (=> b!138478 m!165249))

(declare-fun m!165251 () Bool)

(assert (=> b!138479 m!165251))

(assert (=> b!138480 m!164809))

(assert (=> d!43091 d!43169))

(declare-fun d!43171 () Bool)

(declare-fun e!90263 () Bool)

(assert (=> d!43171 e!90263))

(declare-fun res!66330 () Bool)

(assert (=> d!43171 (=> res!66330 e!90263)))

(declare-fun lt!72413 () Bool)

(assert (=> d!43171 (= res!66330 (not lt!72413))))

(declare-fun lt!72415 () Bool)

(assert (=> d!43171 (= lt!72413 lt!72415)))

(declare-fun lt!72416 () Unit!4344)

(declare-fun e!90262 () Unit!4344)

(assert (=> d!43171 (= lt!72416 e!90262)))

(declare-fun c!25887 () Bool)

(assert (=> d!43171 (= c!25887 lt!72415)))

(assert (=> d!43171 (= lt!72415 (containsKey!178 (toList!883 call!15217) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43171 (= (contains!916 call!15217 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) lt!72413)))

(declare-fun b!138481 () Bool)

(declare-fun lt!72414 () Unit!4344)

(assert (=> b!138481 (= e!90262 lt!72414)))

(assert (=> b!138481 (= lt!72414 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 call!15217) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> b!138481 (isDefined!127 (getValueByKey!174 (toList!883 call!15217) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138482 () Bool)

(declare-fun Unit!4354 () Unit!4344)

(assert (=> b!138482 (= e!90262 Unit!4354)))

(declare-fun b!138483 () Bool)

(assert (=> b!138483 (= e!90263 (isDefined!127 (getValueByKey!174 (toList!883 call!15217) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(assert (= (and d!43171 c!25887) b!138481))

(assert (= (and d!43171 (not c!25887)) b!138482))

(assert (= (and d!43171 (not res!66330)) b!138483))

(assert (=> d!43171 m!164795))

(declare-fun m!165253 () Bool)

(assert (=> d!43171 m!165253))

(assert (=> b!138481 m!164795))

(declare-fun m!165255 () Bool)

(assert (=> b!138481 m!165255))

(assert (=> b!138481 m!164795))

(declare-fun m!165257 () Bool)

(assert (=> b!138481 m!165257))

(assert (=> b!138481 m!165257))

(declare-fun m!165259 () Bool)

(assert (=> b!138481 m!165259))

(assert (=> b!138483 m!164795))

(assert (=> b!138483 m!165257))

(assert (=> b!138483 m!165257))

(assert (=> b!138483 m!165259))

(assert (=> b!138254 d!43171))

(declare-fun b!138484 () Bool)

(declare-fun e!90272 () Bool)

(declare-fun call!15271 () Bool)

(assert (=> b!138484 (= e!90272 (not call!15271))))

(declare-fun b!138485 () Bool)

(declare-fun e!90271 () Bool)

(declare-fun lt!72431 () ListLongMap!1735)

(assert (=> b!138485 (= e!90271 (= (apply!118 lt!72431 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2770 newMap!16)))))

(declare-fun b!138486 () Bool)

(declare-fun e!90264 () ListLongMap!1735)

(declare-fun e!90266 () ListLongMap!1735)

(assert (=> b!138486 (= e!90264 e!90266)))

(declare-fun c!25889 () Bool)

(assert (=> b!138486 (= c!25889 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15262 () Bool)

(declare-fun call!15265 () ListLongMap!1735)

(declare-fun call!15270 () ListLongMap!1735)

(assert (=> bm!15262 (= call!15265 call!15270)))

(declare-fun b!138487 () Bool)

(declare-fun e!90267 () Bool)

(assert (=> b!138487 (= e!90267 e!90271)))

(declare-fun res!66331 () Bool)

(declare-fun call!15266 () Bool)

(assert (=> b!138487 (= res!66331 call!15266)))

(assert (=> b!138487 (=> (not res!66331) (not e!90271))))

(declare-fun bm!15263 () Bool)

(assert (=> bm!15263 (= call!15270 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun b!138488 () Bool)

(declare-fun e!90270 () Unit!4344)

(declare-fun Unit!4355 () Unit!4344)

(assert (=> b!138488 (= e!90270 Unit!4355)))

(declare-fun b!138489 () Bool)

(declare-fun e!90273 () Bool)

(assert (=> b!138489 (= e!90273 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!43173 () Bool)

(declare-fun e!90275 () Bool)

(assert (=> d!43173 e!90275))

(declare-fun res!66334 () Bool)

(assert (=> d!43173 (=> (not res!66334) (not e!90275))))

(assert (=> d!43173 (= res!66334 (or (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))))

(declare-fun lt!72436 () ListLongMap!1735)

(assert (=> d!43173 (= lt!72431 lt!72436)))

(declare-fun lt!72422 () Unit!4344)

(assert (=> d!43173 (= lt!72422 e!90270)))

(declare-fun c!25893 () Bool)

(assert (=> d!43173 (= c!25893 e!90273)))

(declare-fun res!66333 () Bool)

(assert (=> d!43173 (=> (not res!66333) (not e!90273))))

(assert (=> d!43173 (= res!66333 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43173 (= lt!72436 e!90264)))

(declare-fun c!25890 () Bool)

(assert (=> d!43173 (= c!25890 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43173 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43173 (= (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) lt!72431)))

(declare-fun b!138490 () Bool)

(declare-fun call!15267 () ListLongMap!1735)

(assert (=> b!138490 (= e!90266 call!15267)))

(declare-fun b!138491 () Bool)

(declare-fun e!90276 () Bool)

(declare-fun e!90269 () Bool)

(assert (=> b!138491 (= e!90276 e!90269)))

(declare-fun res!66338 () Bool)

(assert (=> b!138491 (=> (not res!66338) (not e!90269))))

(assert (=> b!138491 (= res!66338 (contains!916 lt!72431 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun bm!15264 () Bool)

(assert (=> bm!15264 (= call!15271 (contains!916 lt!72431 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138492 () Bool)

(assert (=> b!138492 (= e!90267 (not call!15266))))

(declare-fun b!138493 () Bool)

(declare-fun res!66336 () Bool)

(assert (=> b!138493 (=> (not res!66336) (not e!90275))))

(assert (=> b!138493 (= res!66336 e!90276)))

(declare-fun res!66337 () Bool)

(assert (=> b!138493 (=> res!66337 e!90276)))

(declare-fun e!90274 () Bool)

(assert (=> b!138493 (= res!66337 (not e!90274))))

(declare-fun res!66332 () Bool)

(assert (=> b!138493 (=> (not res!66332) (not e!90274))))

(assert (=> b!138493 (= res!66332 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138494 () Bool)

(declare-fun e!90265 () ListLongMap!1735)

(assert (=> b!138494 (= e!90265 call!15267)))

(declare-fun b!138495 () Bool)

(assert (=> b!138495 (= e!90275 e!90272)))

(declare-fun c!25891 () Bool)

(assert (=> b!138495 (= c!25891 (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138496 () Bool)

(declare-fun res!66335 () Bool)

(assert (=> b!138496 (=> (not res!66335) (not e!90275))))

(assert (=> b!138496 (= res!66335 e!90267)))

(declare-fun c!25888 () Bool)

(assert (=> b!138496 (= c!25888 (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138497 () Bool)

(declare-fun lt!72429 () Unit!4344)

(assert (=> b!138497 (= e!90270 lt!72429)))

(declare-fun lt!72423 () ListLongMap!1735)

(assert (=> b!138497 (= lt!72423 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72428 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72419 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72419 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72427 () Unit!4344)

(assert (=> b!138497 (= lt!72427 (addStillContains!94 lt!72423 lt!72428 (zeroValue!2770 newMap!16) lt!72419))))

(assert (=> b!138497 (contains!916 (+!177 lt!72423 (tuple2!2681 lt!72428 (zeroValue!2770 newMap!16))) lt!72419)))

(declare-fun lt!72420 () Unit!4344)

(assert (=> b!138497 (= lt!72420 lt!72427)))

(declare-fun lt!72432 () ListLongMap!1735)

(assert (=> b!138497 (= lt!72432 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72430 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72437 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72437 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72426 () Unit!4344)

(assert (=> b!138497 (= lt!72426 (addApplyDifferent!94 lt!72432 lt!72430 (minValue!2770 newMap!16) lt!72437))))

(assert (=> b!138497 (= (apply!118 (+!177 lt!72432 (tuple2!2681 lt!72430 (minValue!2770 newMap!16))) lt!72437) (apply!118 lt!72432 lt!72437))))

(declare-fun lt!72438 () Unit!4344)

(assert (=> b!138497 (= lt!72438 lt!72426)))

(declare-fun lt!72434 () ListLongMap!1735)

(assert (=> b!138497 (= lt!72434 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72424 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72421 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72421 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72418 () Unit!4344)

(assert (=> b!138497 (= lt!72418 (addApplyDifferent!94 lt!72434 lt!72424 (zeroValue!2770 newMap!16) lt!72421))))

(assert (=> b!138497 (= (apply!118 (+!177 lt!72434 (tuple2!2681 lt!72424 (zeroValue!2770 newMap!16))) lt!72421) (apply!118 lt!72434 lt!72421))))

(declare-fun lt!72425 () Unit!4344)

(assert (=> b!138497 (= lt!72425 lt!72418)))

(declare-fun lt!72433 () ListLongMap!1735)

(assert (=> b!138497 (= lt!72433 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72435 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72435 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72417 () (_ BitVec 64))

(assert (=> b!138497 (= lt!72417 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138497 (= lt!72429 (addApplyDifferent!94 lt!72433 lt!72435 (minValue!2770 newMap!16) lt!72417))))

(assert (=> b!138497 (= (apply!118 (+!177 lt!72433 (tuple2!2681 lt!72435 (minValue!2770 newMap!16))) lt!72417) (apply!118 lt!72433 lt!72417))))

(declare-fun bm!15265 () Bool)

(assert (=> bm!15265 (= call!15266 (contains!916 lt!72431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138498 () Bool)

(declare-fun call!15269 () ListLongMap!1735)

(assert (=> b!138498 (= e!90265 call!15269)))

(declare-fun call!15268 () ListLongMap!1735)

(declare-fun bm!15266 () Bool)

(assert (=> bm!15266 (= call!15268 (+!177 (ite c!25890 call!15270 (ite c!25889 call!15265 call!15269)) (ite (or c!25890 c!25889) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 newMap!16)) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 newMap!16)))))))

(declare-fun b!138499 () Bool)

(declare-fun e!90268 () Bool)

(assert (=> b!138499 (= e!90268 (= (apply!118 lt!72431 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2770 newMap!16)))))

(declare-fun b!138500 () Bool)

(assert (=> b!138500 (= e!90272 e!90268)))

(declare-fun res!66339 () Bool)

(assert (=> b!138500 (= res!66339 call!15271)))

(assert (=> b!138500 (=> (not res!66339) (not e!90268))))

(declare-fun b!138501 () Bool)

(assert (=> b!138501 (= e!90269 (= (apply!118 lt!72431 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)) (get!1513 (select (arr!2298 (_values!2902 newMap!16)) #b00000000000000000000000000000000) (dynLambda!438 (defaultEntry!2919 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2569 (_values!2902 newMap!16))))))

(assert (=> b!138501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138502 () Bool)

(assert (=> b!138502 (= e!90264 (+!177 call!15268 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 newMap!16))))))

(declare-fun b!138503 () Bool)

(declare-fun c!25892 () Bool)

(assert (=> b!138503 (= c!25892 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138503 (= e!90266 e!90265)))

(declare-fun b!138504 () Bool)

(assert (=> b!138504 (= e!90274 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15267 () Bool)

(assert (=> bm!15267 (= call!15269 call!15265)))

(declare-fun bm!15268 () Bool)

(assert (=> bm!15268 (= call!15267 call!15268)))

(assert (= (and d!43173 c!25890) b!138502))

(assert (= (and d!43173 (not c!25890)) b!138486))

(assert (= (and b!138486 c!25889) b!138490))

(assert (= (and b!138486 (not c!25889)) b!138503))

(assert (= (and b!138503 c!25892) b!138494))

(assert (= (and b!138503 (not c!25892)) b!138498))

(assert (= (or b!138494 b!138498) bm!15267))

(assert (= (or b!138490 bm!15267) bm!15262))

(assert (= (or b!138490 b!138494) bm!15268))

(assert (= (or b!138502 bm!15262) bm!15263))

(assert (= (or b!138502 bm!15268) bm!15266))

(assert (= (and d!43173 res!66333) b!138489))

(assert (= (and d!43173 c!25893) b!138497))

(assert (= (and d!43173 (not c!25893)) b!138488))

(assert (= (and d!43173 res!66334) b!138493))

(assert (= (and b!138493 res!66332) b!138504))

(assert (= (and b!138493 (not res!66337)) b!138491))

(assert (= (and b!138491 res!66338) b!138501))

(assert (= (and b!138493 res!66336) b!138496))

(assert (= (and b!138496 c!25888) b!138487))

(assert (= (and b!138496 (not c!25888)) b!138492))

(assert (= (and b!138487 res!66331) b!138485))

(assert (= (or b!138487 b!138492) bm!15265))

(assert (= (and b!138496 res!66335) b!138495))

(assert (= (and b!138495 c!25891) b!138500))

(assert (= (and b!138495 (not c!25891)) b!138484))

(assert (= (and b!138500 res!66339) b!138499))

(assert (= (or b!138500 b!138484) bm!15264))

(declare-fun b_lambda!6191 () Bool)

(assert (=> (not b_lambda!6191) (not b!138501)))

(declare-fun tb!2513 () Bool)

(declare-fun t!6288 () Bool)

(assert (=> (and b!137999 (= (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) (defaultEntry!2919 newMap!16)) t!6288) tb!2513))

(declare-fun result!4129 () Bool)

(assert (=> tb!2513 (= result!4129 tp_is_empty!2913)))

(assert (=> b!138501 t!6288))

(declare-fun b_and!8623 () Bool)

(assert (= b_and!8619 (and (=> t!6288 result!4129) b_and!8623)))

(declare-fun t!6290 () Bool)

(declare-fun tb!2515 () Bool)

(assert (=> (and b!137992 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 newMap!16)) t!6290) tb!2515))

(declare-fun result!4131 () Bool)

(assert (= result!4131 result!4129))

(assert (=> b!138501 t!6290))

(declare-fun b_and!8625 () Bool)

(assert (= b_and!8621 (and (=> t!6290 result!4131) b_and!8625)))

(declare-fun m!165261 () Bool)

(assert (=> b!138502 m!165261))

(declare-fun m!165263 () Bool)

(assert (=> bm!15266 m!165263))

(declare-fun m!165265 () Bool)

(assert (=> b!138497 m!165265))

(declare-fun m!165267 () Bool)

(assert (=> b!138497 m!165267))

(declare-fun m!165269 () Bool)

(assert (=> b!138497 m!165269))

(assert (=> b!138497 m!165269))

(declare-fun m!165271 () Bool)

(assert (=> b!138497 m!165271))

(declare-fun m!165273 () Bool)

(assert (=> b!138497 m!165273))

(declare-fun m!165275 () Bool)

(assert (=> b!138497 m!165275))

(assert (=> b!138497 m!165267))

(declare-fun m!165277 () Bool)

(assert (=> b!138497 m!165277))

(declare-fun m!165279 () Bool)

(assert (=> b!138497 m!165279))

(assert (=> b!138497 m!165149))

(declare-fun m!165281 () Bool)

(assert (=> b!138497 m!165281))

(declare-fun m!165283 () Bool)

(assert (=> b!138497 m!165283))

(assert (=> b!138497 m!165275))

(declare-fun m!165285 () Bool)

(assert (=> b!138497 m!165285))

(assert (=> b!138497 m!165265))

(declare-fun m!165287 () Bool)

(assert (=> b!138497 m!165287))

(declare-fun m!165289 () Bool)

(assert (=> b!138497 m!165289))

(declare-fun m!165291 () Bool)

(assert (=> b!138497 m!165291))

(declare-fun m!165293 () Bool)

(assert (=> b!138497 m!165293))

(declare-fun m!165295 () Bool)

(assert (=> b!138497 m!165295))

(assert (=> b!138504 m!165149))

(assert (=> b!138504 m!165149))

(assert (=> b!138504 m!165151))

(declare-fun m!165297 () Bool)

(assert (=> bm!15265 m!165297))

(assert (=> bm!15263 m!165279))

(declare-fun m!165299 () Bool)

(assert (=> b!138485 m!165299))

(assert (=> b!138489 m!165149))

(assert (=> b!138489 m!165149))

(assert (=> b!138489 m!165151))

(assert (=> b!138491 m!165149))

(assert (=> b!138491 m!165149))

(declare-fun m!165301 () Bool)

(assert (=> b!138491 m!165301))

(declare-fun m!165303 () Bool)

(assert (=> b!138501 m!165303))

(declare-fun m!165305 () Bool)

(assert (=> b!138501 m!165305))

(declare-fun m!165307 () Bool)

(assert (=> b!138501 m!165307))

(assert (=> b!138501 m!165305))

(assert (=> b!138501 m!165149))

(declare-fun m!165309 () Bool)

(assert (=> b!138501 m!165309))

(assert (=> b!138501 m!165149))

(assert (=> b!138501 m!165303))

(declare-fun m!165311 () Bool)

(assert (=> b!138499 m!165311))

(declare-fun m!165313 () Bool)

(assert (=> bm!15264 m!165313))

(assert (=> d!43173 m!165021))

(assert (=> bm!15220 d!43173))

(assert (=> d!43099 d!43173))

(declare-fun d!43175 () Bool)

(declare-fun e!90278 () Bool)

(assert (=> d!43175 e!90278))

(declare-fun res!66340 () Bool)

(assert (=> d!43175 (=> res!66340 e!90278)))

(declare-fun lt!72439 () Bool)

(assert (=> d!43175 (= res!66340 (not lt!72439))))

(declare-fun lt!72441 () Bool)

(assert (=> d!43175 (= lt!72439 lt!72441)))

(declare-fun lt!72442 () Unit!4344)

(declare-fun e!90277 () Unit!4344)

(assert (=> d!43175 (= lt!72442 e!90277)))

(declare-fun c!25894 () Bool)

(assert (=> d!43175 (= c!25894 lt!72441)))

(assert (=> d!43175 (= lt!72441 (containsKey!178 (toList!883 lt!72135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43175 (= (contains!916 lt!72135 #b1000000000000000000000000000000000000000000000000000000000000000) lt!72439)))

(declare-fun b!138505 () Bool)

(declare-fun lt!72440 () Unit!4344)

(assert (=> b!138505 (= e!90277 lt!72440)))

(assert (=> b!138505 (= lt!72440 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 lt!72135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138505 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138506 () Bool)

(declare-fun Unit!4356 () Unit!4344)

(assert (=> b!138506 (= e!90277 Unit!4356)))

(declare-fun b!138507 () Bool)

(assert (=> b!138507 (= e!90278 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43175 c!25894) b!138505))

(assert (= (and d!43175 (not c!25894)) b!138506))

(assert (= (and d!43175 (not res!66340)) b!138507))

(declare-fun m!165315 () Bool)

(assert (=> d!43175 m!165315))

(declare-fun m!165317 () Bool)

(assert (=> b!138505 m!165317))

(assert (=> b!138505 m!165143))

(assert (=> b!138505 m!165143))

(declare-fun m!165319 () Bool)

(assert (=> b!138505 m!165319))

(assert (=> b!138507 m!165143))

(assert (=> b!138507 m!165143))

(assert (=> b!138507 m!165319))

(assert (=> bm!15161 d!43175))

(declare-fun d!43177 () Bool)

(assert (=> d!43177 (= (get!1514 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3254 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> b!138282 d!43177))

(declare-fun d!43179 () Bool)

(declare-fun e!90279 () Bool)

(assert (=> d!43179 e!90279))

(declare-fun res!66341 () Bool)

(assert (=> d!43179 (=> (not res!66341) (not e!90279))))

(declare-fun lt!72444 () ListLongMap!1735)

(assert (=> d!43179 (= res!66341 (contains!916 lt!72444 (_1!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(declare-fun lt!72446 () List!1735)

(assert (=> d!43179 (= lt!72444 (ListLongMap!1736 lt!72446))))

(declare-fun lt!72445 () Unit!4344)

(declare-fun lt!72443 () Unit!4344)

(assert (=> d!43179 (= lt!72445 lt!72443)))

(assert (=> d!43179 (= (getValueByKey!174 lt!72446 (_1!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43179 (= lt!72443 (lemmaContainsTupThenGetReturnValue!89 lt!72446 (_1!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43179 (= lt!72446 (insertStrictlySorted!92 (toList!883 call!15165) (_1!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) (_2!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (=> d!43179 (= (+!177 call!15165 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))) lt!72444)))

(declare-fun b!138508 () Bool)

(declare-fun res!66342 () Bool)

(assert (=> b!138508 (=> (not res!66342) (not e!90279))))

(assert (=> b!138508 (= res!66342 (= (getValueByKey!174 (toList!883 lt!72444) (_1!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (Some!179 (_2!1351 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun b!138509 () Bool)

(assert (=> b!138509 (= e!90279 (contains!918 (toList!883 lt!72444) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))

(assert (= (and d!43179 res!66341) b!138508))

(assert (= (and b!138508 res!66342) b!138509))

(declare-fun m!165321 () Bool)

(assert (=> d!43179 m!165321))

(declare-fun m!165323 () Bool)

(assert (=> d!43179 m!165323))

(declare-fun m!165325 () Bool)

(assert (=> d!43179 m!165325))

(declare-fun m!165327 () Bool)

(assert (=> d!43179 m!165327))

(declare-fun m!165329 () Bool)

(assert (=> b!138508 m!165329))

(declare-fun m!165331 () Bool)

(assert (=> b!138509 m!165331))

(assert (=> b!138146 d!43179))

(declare-fun d!43181 () Bool)

(declare-fun isEmpty!416 (Option!180) Bool)

(assert (=> d!43181 (= (isDefined!127 (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))) (not (isEmpty!416 (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))))

(declare-fun bs!5797 () Bool)

(assert (= bs!5797 d!43181))

(assert (=> bs!5797 m!164949))

(declare-fun m!165333 () Bool)

(assert (=> bs!5797 m!165333))

(assert (=> b!138157 d!43181))

(declare-fun d!43183 () Bool)

(declare-fun c!25899 () Bool)

(assert (=> d!43183 (= c!25899 (and ((_ is Cons!1731) (toList!883 lt!72063)) (= (_1!1351 (h!2338 (toList!883 lt!72063))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(declare-fun e!90284 () Option!180)

(assert (=> d!43183 (= (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) e!90284)))

(declare-fun b!138518 () Bool)

(assert (=> b!138518 (= e!90284 (Some!179 (_2!1351 (h!2338 (toList!883 lt!72063)))))))

(declare-fun b!138520 () Bool)

(declare-fun e!90285 () Option!180)

(assert (=> b!138520 (= e!90285 (getValueByKey!174 (t!6279 (toList!883 lt!72063)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138521 () Bool)

(assert (=> b!138521 (= e!90285 None!178)))

(declare-fun b!138519 () Bool)

(assert (=> b!138519 (= e!90284 e!90285)))

(declare-fun c!25900 () Bool)

(assert (=> b!138519 (= c!25900 (and ((_ is Cons!1731) (toList!883 lt!72063)) (not (= (_1!1351 (h!2338 (toList!883 lt!72063))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))))

(assert (= (and d!43183 c!25899) b!138518))

(assert (= (and d!43183 (not c!25899)) b!138519))

(assert (= (and b!138519 c!25900) b!138520))

(assert (= (and b!138519 (not c!25900)) b!138521))

(assert (=> b!138520 m!164795))

(declare-fun m!165335 () Bool)

(assert (=> b!138520 m!165335))

(assert (=> b!138157 d!43183))

(declare-fun b!138522 () Bool)

(declare-fun e!90288 () Bool)

(assert (=> b!138522 (= e!90288 (contains!917 Nil!1733 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15269 () Bool)

(declare-fun call!15272 () Bool)

(declare-fun c!25901 () Bool)

(assert (=> bm!15269 (= call!15272 (arrayNoDuplicates!0 (_keys!4676 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25901 (Cons!1732 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000) Nil!1733) Nil!1733)))))

(declare-fun b!138523 () Bool)

(declare-fun e!90289 () Bool)

(declare-fun e!90287 () Bool)

(assert (=> b!138523 (= e!90289 e!90287)))

(assert (=> b!138523 (= c!25901 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138524 () Bool)

(assert (=> b!138524 (= e!90287 call!15272)))

(declare-fun b!138526 () Bool)

(assert (=> b!138526 (= e!90287 call!15272)))

(declare-fun d!43185 () Bool)

(declare-fun res!66343 () Bool)

(declare-fun e!90286 () Bool)

(assert (=> d!43185 (=> res!66343 e!90286)))

(assert (=> d!43185 (= res!66343 (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43185 (= (arrayNoDuplicates!0 (_keys!4676 newMap!16) #b00000000000000000000000000000000 Nil!1733) e!90286)))

(declare-fun b!138525 () Bool)

(assert (=> b!138525 (= e!90286 e!90289)))

(declare-fun res!66345 () Bool)

(assert (=> b!138525 (=> (not res!66345) (not e!90289))))

(assert (=> b!138525 (= res!66345 (not e!90288))))

(declare-fun res!66344 () Bool)

(assert (=> b!138525 (=> (not res!66344) (not e!90288))))

(assert (=> b!138525 (= res!66344 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!43185 (not res!66343)) b!138525))

(assert (= (and b!138525 res!66344) b!138522))

(assert (= (and b!138525 res!66345) b!138523))

(assert (= (and b!138523 c!25901) b!138526))

(assert (= (and b!138523 (not c!25901)) b!138524))

(assert (= (or b!138526 b!138524) bm!15269))

(assert (=> b!138522 m!165149))

(assert (=> b!138522 m!165149))

(declare-fun m!165337 () Bool)

(assert (=> b!138522 m!165337))

(assert (=> bm!15269 m!165149))

(declare-fun m!165339 () Bool)

(assert (=> bm!15269 m!165339))

(assert (=> b!138523 m!165149))

(assert (=> b!138523 m!165149))

(assert (=> b!138523 m!165151))

(assert (=> b!138525 m!165149))

(assert (=> b!138525 m!165149))

(assert (=> b!138525 m!165151))

(assert (=> b!138085 d!43185))

(declare-fun d!43187 () Bool)

(assert (=> d!43187 (isDefined!127 (getValueByKey!174 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun lt!72449 () Unit!4344)

(declare-fun choose!850 (List!1735 (_ BitVec 64)) Unit!4344)

(assert (=> d!43187 (= lt!72449 (choose!850 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun e!90292 () Bool)

(assert (=> d!43187 e!90292))

(declare-fun res!66348 () Bool)

(assert (=> d!43187 (=> (not res!66348) (not e!90292))))

(declare-fun isStrictlySorted!324 (List!1735) Bool)

(assert (=> d!43187 (= res!66348 (isStrictlySorted!324 (toList!883 lt!72063)))))

(assert (=> d!43187 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) lt!72449)))

(declare-fun b!138529 () Bool)

(assert (=> b!138529 (= e!90292 (containsKey!178 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (= (and d!43187 res!66348) b!138529))

(assert (=> d!43187 m!164795))

(assert (=> d!43187 m!164949))

(assert (=> d!43187 m!164949))

(assert (=> d!43187 m!164951))

(assert (=> d!43187 m!164795))

(declare-fun m!165341 () Bool)

(assert (=> d!43187 m!165341))

(declare-fun m!165343 () Bool)

(assert (=> d!43187 m!165343))

(assert (=> b!138529 m!164795))

(assert (=> b!138529 m!164945))

(assert (=> b!138155 d!43187))

(assert (=> b!138155 d!43181))

(assert (=> b!138155 d!43183))

(declare-fun d!43189 () Bool)

(assert (=> d!43189 (= (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138148 d!43189))

(declare-fun lt!72456 () SeekEntryResult!277)

(declare-fun d!43191 () Bool)

(assert (=> d!43191 (and (or ((_ is Undefined!277) lt!72456) (not ((_ is Found!277) lt!72456)) (and (bvsge (index!3271 lt!72456) #b00000000000000000000000000000000) (bvslt (index!3271 lt!72456) (size!2568 (_keys!4676 newMap!16))))) (or ((_ is Undefined!277) lt!72456) ((_ is Found!277) lt!72456) (not ((_ is MissingZero!277) lt!72456)) (and (bvsge (index!3270 lt!72456) #b00000000000000000000000000000000) (bvslt (index!3270 lt!72456) (size!2568 (_keys!4676 newMap!16))))) (or ((_ is Undefined!277) lt!72456) ((_ is Found!277) lt!72456) ((_ is MissingZero!277) lt!72456) (not ((_ is MissingVacant!277) lt!72456)) (and (bvsge (index!3273 lt!72456) #b00000000000000000000000000000000) (bvslt (index!3273 lt!72456) (size!2568 (_keys!4676 newMap!16))))) (or ((_ is Undefined!277) lt!72456) (ite ((_ is Found!277) lt!72456) (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72456)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) (ite ((_ is MissingZero!277) lt!72456) (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3270 lt!72456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!277) lt!72456) (= (select (arr!2297 (_keys!4676 newMap!16)) (index!3273 lt!72456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!90301 () SeekEntryResult!277)

(assert (=> d!43191 (= lt!72456 e!90301)))

(declare-fun c!25909 () Bool)

(declare-fun lt!72458 () SeekEntryResult!277)

(assert (=> d!43191 (= c!25909 (and ((_ is Intermediate!277) lt!72458) (undefined!1089 lt!72458)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4857 (_ BitVec 32)) SeekEntryResult!277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!43191 (= lt!72458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (mask!7249 newMap!16)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(assert (=> d!43191 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43191 (= (seekEntryOrOpen!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)) lt!72456)))

(declare-fun b!138542 () Bool)

(declare-fun e!90300 () SeekEntryResult!277)

(assert (=> b!138542 (= e!90300 (Found!277 (index!3272 lt!72458)))))

(declare-fun b!138543 () Bool)

(declare-fun e!90299 () SeekEntryResult!277)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4857 (_ BitVec 32)) SeekEntryResult!277)

(assert (=> b!138543 (= e!90299 (seekKeyOrZeroReturnVacant!0 (x!15991 lt!72458) (index!3272 lt!72458) (index!3272 lt!72458) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (_keys!4676 newMap!16) (mask!7249 newMap!16)))))

(declare-fun b!138544 () Bool)

(assert (=> b!138544 (= e!90301 e!90300)))

(declare-fun lt!72457 () (_ BitVec 64))

(assert (=> b!138544 (= lt!72457 (select (arr!2297 (_keys!4676 newMap!16)) (index!3272 lt!72458)))))

(declare-fun c!25908 () Bool)

(assert (=> b!138544 (= c!25908 (= lt!72457 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138545 () Bool)

(declare-fun c!25910 () Bool)

(assert (=> b!138545 (= c!25910 (= lt!72457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138545 (= e!90300 e!90299)))

(declare-fun b!138546 () Bool)

(assert (=> b!138546 (= e!90299 (MissingZero!277 (index!3272 lt!72458)))))

(declare-fun b!138547 () Bool)

(assert (=> b!138547 (= e!90301 Undefined!277)))

(assert (= (and d!43191 c!25909) b!138547))

(assert (= (and d!43191 (not c!25909)) b!138544))

(assert (= (and b!138544 c!25908) b!138542))

(assert (= (and b!138544 (not c!25908)) b!138545))

(assert (= (and b!138545 c!25910) b!138546))

(assert (= (and b!138545 (not c!25910)) b!138543))

(declare-fun m!165345 () Bool)

(assert (=> d!43191 m!165345))

(declare-fun m!165347 () Bool)

(assert (=> d!43191 m!165347))

(assert (=> d!43191 m!165021))

(assert (=> d!43191 m!164795))

(declare-fun m!165349 () Bool)

(assert (=> d!43191 m!165349))

(declare-fun m!165351 () Bool)

(assert (=> d!43191 m!165351))

(assert (=> d!43191 m!165349))

(assert (=> d!43191 m!164795))

(declare-fun m!165353 () Bool)

(assert (=> d!43191 m!165353))

(assert (=> b!138543 m!164795))

(declare-fun m!165355 () Bool)

(assert (=> b!138543 m!165355))

(declare-fun m!165357 () Bool)

(assert (=> b!138544 m!165357))

(assert (=> bm!15234 d!43191))

(declare-fun d!43193 () Bool)

(declare-fun e!90303 () Bool)

(assert (=> d!43193 e!90303))

(declare-fun res!66349 () Bool)

(assert (=> d!43193 (=> res!66349 e!90303)))

(declare-fun lt!72459 () Bool)

(assert (=> d!43193 (= res!66349 (not lt!72459))))

(declare-fun lt!72461 () Bool)

(assert (=> d!43193 (= lt!72459 lt!72461)))

(declare-fun lt!72462 () Unit!4344)

(declare-fun e!90302 () Unit!4344)

(assert (=> d!43193 (= lt!72462 e!90302)))

(declare-fun c!25911 () Bool)

(assert (=> d!43193 (= c!25911 lt!72461)))

(assert (=> d!43193 (= lt!72461 (containsKey!178 (toList!883 e!90140) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43193 (= (contains!916 e!90140 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) lt!72459)))

(declare-fun b!138548 () Bool)

(declare-fun lt!72460 () Unit!4344)

(assert (=> b!138548 (= e!90302 lt!72460)))

(assert (=> b!138548 (= lt!72460 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 e!90140) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> b!138548 (isDefined!127 (getValueByKey!174 (toList!883 e!90140) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(declare-fun b!138549 () Bool)

(declare-fun Unit!4357 () Unit!4344)

(assert (=> b!138549 (= e!90302 Unit!4357)))

(declare-fun b!138550 () Bool)

(assert (=> b!138550 (= e!90303 (isDefined!127 (getValueByKey!174 (toList!883 e!90140) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(assert (= (and d!43193 c!25911) b!138548))

(assert (= (and d!43193 (not c!25911)) b!138549))

(assert (= (and d!43193 (not res!66349)) b!138550))

(assert (=> d!43193 m!164795))

(declare-fun m!165359 () Bool)

(assert (=> d!43193 m!165359))

(assert (=> b!138548 m!164795))

(declare-fun m!165361 () Bool)

(assert (=> b!138548 m!165361))

(assert (=> b!138548 m!164795))

(declare-fun m!165363 () Bool)

(assert (=> b!138548 m!165363))

(assert (=> b!138548 m!165363))

(declare-fun m!165365 () Bool)

(assert (=> b!138548 m!165365))

(assert (=> b!138550 m!164795))

(assert (=> b!138550 m!165363))

(assert (=> b!138550 m!165363))

(assert (=> b!138550 m!165365))

(assert (=> bm!15218 d!43193))

(declare-fun d!43195 () Bool)

(declare-fun e!90305 () Bool)

(assert (=> d!43195 e!90305))

(declare-fun res!66350 () Bool)

(assert (=> d!43195 (=> res!66350 e!90305)))

(declare-fun lt!72463 () Bool)

(assert (=> d!43195 (= res!66350 (not lt!72463))))

(declare-fun lt!72465 () Bool)

(assert (=> d!43195 (= lt!72463 lt!72465)))

(declare-fun lt!72466 () Unit!4344)

(declare-fun e!90304 () Unit!4344)

(assert (=> d!43195 (= lt!72466 e!90304)))

(declare-fun c!25912 () Bool)

(assert (=> d!43195 (= c!25912 lt!72465)))

(assert (=> d!43195 (= lt!72465 (containsKey!178 (toList!883 lt!72135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43195 (= (contains!916 lt!72135 #b0000000000000000000000000000000000000000000000000000000000000000) lt!72463)))

(declare-fun b!138551 () Bool)

(declare-fun lt!72464 () Unit!4344)

(assert (=> b!138551 (= e!90304 lt!72464)))

(assert (=> b!138551 (= lt!72464 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 lt!72135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138551 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138552 () Bool)

(declare-fun Unit!4358 () Unit!4344)

(assert (=> b!138552 (= e!90304 Unit!4358)))

(declare-fun b!138553 () Bool)

(assert (=> b!138553 (= e!90305 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43195 c!25912) b!138551))

(assert (= (and d!43195 (not c!25912)) b!138552))

(assert (= (and d!43195 (not res!66350)) b!138553))

(declare-fun m!165367 () Bool)

(assert (=> d!43195 m!165367))

(declare-fun m!165369 () Bool)

(assert (=> b!138551 m!165369))

(declare-fun m!165371 () Bool)

(assert (=> b!138551 m!165371))

(assert (=> b!138551 m!165371))

(declare-fun m!165373 () Bool)

(assert (=> b!138551 m!165373))

(assert (=> b!138553 m!165371))

(assert (=> b!138553 m!165371))

(assert (=> b!138553 m!165373))

(assert (=> bm!15162 d!43195))

(assert (=> b!138294 d!43109))

(declare-fun d!43197 () Bool)

(declare-fun lt!72469 () (_ BitVec 32))

(assert (=> d!43197 (and (bvsge lt!72469 #b00000000000000000000000000000000) (bvsle lt!72469 (bvsub (size!2568 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!90310 () (_ BitVec 32))

(assert (=> d!43197 (= lt!72469 e!90310)))

(declare-fun c!25917 () Bool)

(assert (=> d!43197 (= c!25917 (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43197 (and (bvsle #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2568 (_keys!4676 newMap!16)) (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43197 (= (arrayCountValidKeys!0 (_keys!4676 newMap!16) #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) lt!72469)))

(declare-fun b!138562 () Bool)

(assert (=> b!138562 (= e!90310 #b00000000000000000000000000000000)))

(declare-fun bm!15272 () Bool)

(declare-fun call!15275 () (_ BitVec 32))

(assert (=> bm!15272 (= call!15275 (arrayCountValidKeys!0 (_keys!4676 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138563 () Bool)

(declare-fun e!90311 () (_ BitVec 32))

(assert (=> b!138563 (= e!90311 call!15275)))

(declare-fun b!138564 () Bool)

(assert (=> b!138564 (= e!90310 e!90311)))

(declare-fun c!25918 () Bool)

(assert (=> b!138564 (= c!25918 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!138565 () Bool)

(assert (=> b!138565 (= e!90311 (bvadd #b00000000000000000000000000000001 call!15275))))

(assert (= (and d!43197 c!25917) b!138562))

(assert (= (and d!43197 (not c!25917)) b!138564))

(assert (= (and b!138564 c!25918) b!138565))

(assert (= (and b!138564 (not c!25918)) b!138563))

(assert (= (or b!138565 b!138563) bm!15272))

(declare-fun m!165375 () Bool)

(assert (=> bm!15272 m!165375))

(assert (=> b!138564 m!165149))

(assert (=> b!138564 m!165149))

(assert (=> b!138564 m!165151))

(assert (=> b!138083 d!43197))

(declare-fun d!43199 () Bool)

(declare-fun e!90312 () Bool)

(assert (=> d!43199 e!90312))

(declare-fun res!66351 () Bool)

(assert (=> d!43199 (=> (not res!66351) (not e!90312))))

(declare-fun lt!72471 () ListLongMap!1735)

(assert (=> d!43199 (= res!66351 (contains!916 lt!72471 (_1!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(declare-fun lt!72473 () List!1735)

(assert (=> d!43199 (= lt!72471 (ListLongMap!1736 lt!72473))))

(declare-fun lt!72472 () Unit!4344)

(declare-fun lt!72470 () Unit!4344)

(assert (=> d!43199 (= lt!72472 lt!72470)))

(assert (=> d!43199 (= (getValueByKey!174 lt!72473 (_1!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))) (Some!179 (_2!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(assert (=> d!43199 (= lt!72470 (lemmaContainsTupThenGetReturnValue!89 lt!72473 (_1!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (_2!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(assert (=> d!43199 (= lt!72473 (insertStrictlySorted!92 (toList!883 (ite c!25801 call!15167 (ite c!25800 call!15162 call!15166))) (_1!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) (_2!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))))))

(assert (=> d!43199 (= (+!177 (ite c!25801 call!15167 (ite c!25800 call!15162 call!15166)) (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))) lt!72471)))

(declare-fun b!138566 () Bool)

(declare-fun res!66352 () Bool)

(assert (=> b!138566 (=> (not res!66352) (not e!90312))))

(assert (=> b!138566 (= res!66352 (= (getValueByKey!174 (toList!883 lt!72471) (_1!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992))))))) (Some!179 (_2!1351 (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))))

(declare-fun b!138567 () Bool)

(assert (=> b!138567 (= e!90312 (contains!918 (toList!883 lt!72471) (ite (or c!25801 c!25800) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 (v!3255 (underlying!472 thiss!992)))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 (v!3255 (underlying!472 thiss!992)))))))))

(assert (= (and d!43199 res!66351) b!138566))

(assert (= (and b!138566 res!66352) b!138567))

(declare-fun m!165377 () Bool)

(assert (=> d!43199 m!165377))

(declare-fun m!165379 () Bool)

(assert (=> d!43199 m!165379))

(declare-fun m!165381 () Bool)

(assert (=> d!43199 m!165381))

(declare-fun m!165383 () Bool)

(assert (=> d!43199 m!165383))

(declare-fun m!165385 () Bool)

(assert (=> b!138566 m!165385))

(declare-fun m!165387 () Bool)

(assert (=> b!138567 m!165387))

(assert (=> bm!15163 d!43199))

(declare-fun b!138568 () Bool)

(declare-fun e!90315 () Bool)

(assert (=> b!138568 (= e!90315 (contains!917 (ite c!25786 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) Nil!1733) Nil!1733) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!15276 () Bool)

(declare-fun bm!15273 () Bool)

(declare-fun c!25919 () Bool)

(assert (=> bm!15273 (= call!15276 (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!25919 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!25786 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) Nil!1733) Nil!1733)) (ite c!25786 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) Nil!1733) Nil!1733))))))

(declare-fun b!138569 () Bool)

(declare-fun e!90316 () Bool)

(declare-fun e!90314 () Bool)

(assert (=> b!138569 (= e!90316 e!90314)))

(assert (=> b!138569 (= c!25919 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!138570 () Bool)

(assert (=> b!138570 (= e!90314 call!15276)))

(declare-fun b!138572 () Bool)

(assert (=> b!138572 (= e!90314 call!15276)))

(declare-fun d!43201 () Bool)

(declare-fun res!66353 () Bool)

(declare-fun e!90313 () Bool)

(assert (=> d!43201 (=> res!66353 e!90313)))

(assert (=> d!43201 (= res!66353 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(assert (=> d!43201 (= (arrayNoDuplicates!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25786 (Cons!1732 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) #b00000000000000000000000000000000) Nil!1733) Nil!1733)) e!90313)))

(declare-fun b!138571 () Bool)

(assert (=> b!138571 (= e!90313 e!90316)))

(declare-fun res!66355 () Bool)

(assert (=> b!138571 (=> (not res!66355) (not e!90316))))

(assert (=> b!138571 (= res!66355 (not e!90315))))

(declare-fun res!66354 () Bool)

(assert (=> b!138571 (=> (not res!66354) (not e!90315))))

(assert (=> b!138571 (= res!66354 (validKeyInArray!0 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!43201 (not res!66353)) b!138571))

(assert (= (and b!138571 res!66354) b!138568))

(assert (= (and b!138571 res!66355) b!138569))

(assert (= (and b!138569 c!25919) b!138572))

(assert (= (and b!138569 (not c!25919)) b!138570))

(assert (= (or b!138572 b!138570) bm!15273))

(declare-fun m!165389 () Bool)

(assert (=> b!138568 m!165389))

(assert (=> b!138568 m!165389))

(declare-fun m!165391 () Bool)

(assert (=> b!138568 m!165391))

(assert (=> bm!15273 m!165389))

(declare-fun m!165393 () Bool)

(assert (=> bm!15273 m!165393))

(assert (=> b!138569 m!165389))

(assert (=> b!138569 m!165389))

(declare-fun m!165395 () Bool)

(assert (=> b!138569 m!165395))

(assert (=> b!138571 m!165389))

(assert (=> b!138571 m!165389))

(assert (=> b!138571 m!165395))

(assert (=> bm!15144 d!43201))

(declare-fun d!43203 () Bool)

(declare-fun e!90319 () Bool)

(assert (=> d!43203 e!90319))

(declare-fun c!25922 () Bool)

(assert (=> d!43203 (= c!25922 (and (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!43203 true))

(declare-fun _$29!162 () Unit!4344)

(assert (=> d!43203 (= (choose!844 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (_values!2902 (v!3255 (underlying!472 thiss!992))) (mask!7249 (v!3255 (underlying!472 thiss!992))) (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) (zeroValue!2770 (v!3255 (underlying!472 thiss!992))) (minValue!2770 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992)))) _$29!162)))

(declare-fun b!138577 () Bool)

(assert (=> b!138577 (= e!90319 (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138578 () Bool)

(assert (=> b!138578 (= e!90319 (ite (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2676 (v!3255 (underlying!472 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43203 c!25922) b!138577))

(assert (= (and d!43203 (not c!25922)) b!138578))

(assert (=> b!138577 m!164795))

(assert (=> b!138577 m!164823))

(assert (=> d!43111 d!43203))

(assert (=> d!43111 d!43117))

(assert (=> b!138133 d!43189))

(assert (=> bm!15160 d!43127))

(declare-fun d!43205 () Bool)

(declare-fun e!90320 () Bool)

(assert (=> d!43205 e!90320))

(declare-fun res!66356 () Bool)

(assert (=> d!43205 (=> (not res!66356) (not e!90320))))

(declare-fun lt!72475 () ListLongMap!1735)

(assert (=> d!43205 (= res!66356 (contains!916 lt!72475 (_1!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!72477 () List!1735)

(assert (=> d!43205 (= lt!72475 (ListLongMap!1736 lt!72477))))

(declare-fun lt!72476 () Unit!4344)

(declare-fun lt!72474 () Unit!4344)

(assert (=> d!43205 (= lt!72476 lt!72474)))

(assert (=> d!43205 (= (getValueByKey!174 lt!72477 (_1!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!179 (_2!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43205 (= lt!72474 (lemmaContainsTupThenGetReturnValue!89 lt!72477 (_1!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43205 (= lt!72477 (insertStrictlySorted!92 (toList!883 call!15234) (_1!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43205 (= (+!177 call!15234 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!72475)))

(declare-fun b!138579 () Bool)

(declare-fun res!66357 () Bool)

(assert (=> b!138579 (=> (not res!66357) (not e!90320))))

(assert (=> b!138579 (= res!66357 (= (getValueByKey!174 (toList!883 lt!72475) (_1!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!179 (_2!1351 (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!138580 () Bool)

(assert (=> b!138580 (= e!90320 (contains!918 (toList!883 lt!72475) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!43205 res!66356) b!138579))

(assert (= (and b!138579 res!66357) b!138580))

(declare-fun m!165397 () Bool)

(assert (=> d!43205 m!165397))

(declare-fun m!165399 () Bool)

(assert (=> d!43205 m!165399))

(declare-fun m!165401 () Bool)

(assert (=> d!43205 m!165401))

(declare-fun m!165403 () Bool)

(assert (=> d!43205 m!165403))

(declare-fun m!165405 () Bool)

(assert (=> b!138579 m!165405))

(declare-fun m!165407 () Bool)

(assert (=> b!138580 m!165407))

(assert (=> b!138243 d!43205))

(declare-fun d!43207 () Bool)

(declare-fun e!90322 () Bool)

(assert (=> d!43207 e!90322))

(declare-fun res!66358 () Bool)

(assert (=> d!43207 (=> res!66358 e!90322)))

(declare-fun lt!72478 () Bool)

(assert (=> d!43207 (= res!66358 (not lt!72478))))

(declare-fun lt!72480 () Bool)

(assert (=> d!43207 (= lt!72478 lt!72480)))

(declare-fun lt!72481 () Unit!4344)

(declare-fun e!90321 () Unit!4344)

(assert (=> d!43207 (= lt!72481 e!90321)))

(declare-fun c!25923 () Bool)

(assert (=> d!43207 (= c!25923 lt!72480)))

(assert (=> d!43207 (= lt!72480 (containsKey!178 (toList!883 lt!72135) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!43207 (= (contains!916 lt!72135 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!72478)))

(declare-fun b!138581 () Bool)

(declare-fun lt!72479 () Unit!4344)

(assert (=> b!138581 (= e!90321 lt!72479)))

(assert (=> b!138581 (= lt!72479 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 lt!72135) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!138581 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!138582 () Bool)

(declare-fun Unit!4359 () Unit!4344)

(assert (=> b!138582 (= e!90321 Unit!4359)))

(declare-fun b!138583 () Bool)

(assert (=> b!138583 (= e!90322 (isDefined!127 (getValueByKey!174 (toList!883 lt!72135) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!43207 c!25923) b!138581))

(assert (= (and d!43207 (not c!25923)) b!138582))

(assert (= (and d!43207 (not res!66358)) b!138583))

(assert (=> d!43207 m!164907))

(declare-fun m!165409 () Bool)

(assert (=> d!43207 m!165409))

(assert (=> b!138581 m!164907))

(declare-fun m!165411 () Bool)

(assert (=> b!138581 m!165411))

(assert (=> b!138581 m!164907))

(declare-fun m!165413 () Bool)

(assert (=> b!138581 m!165413))

(assert (=> b!138581 m!165413))

(declare-fun m!165415 () Bool)

(assert (=> b!138581 m!165415))

(assert (=> b!138583 m!164907))

(assert (=> b!138583 m!165413))

(assert (=> b!138583 m!165413))

(assert (=> b!138583 m!165415))

(assert (=> b!138135 d!43207))

(declare-fun d!43209 () Bool)

(declare-fun res!66359 () Bool)

(declare-fun e!90323 () Bool)

(assert (=> d!43209 (=> res!66359 e!90323)))

(assert (=> d!43209 (= res!66359 (= (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43209 (= (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!90323)))

(declare-fun b!138584 () Bool)

(declare-fun e!90324 () Bool)

(assert (=> b!138584 (= e!90323 e!90324)))

(declare-fun res!66360 () Bool)

(assert (=> b!138584 (=> (not res!66360) (not e!90324))))

(assert (=> b!138584 (= res!66360 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2568 (_keys!4676 (v!3255 (underlying!472 thiss!992))))))))

(declare-fun b!138585 () Bool)

(assert (=> b!138585 (= e!90324 (arrayContainsKey!0 (_keys!4676 (v!3255 (underlying!472 thiss!992))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!43209 (not res!66359)) b!138584))

(assert (= (and b!138584 res!66360) b!138585))

(declare-fun m!165417 () Bool)

(assert (=> d!43209 m!165417))

(assert (=> b!138585 m!164795))

(declare-fun m!165419 () Bool)

(assert (=> b!138585 m!165419))

(assert (=> b!138289 d!43209))

(declare-fun d!43211 () Bool)

(declare-fun e!90325 () Bool)

(assert (=> d!43211 e!90325))

(declare-fun res!66361 () Bool)

(assert (=> d!43211 (=> (not res!66361) (not e!90325))))

(declare-fun lt!72483 () ListLongMap!1735)

(assert (=> d!43211 (= res!66361 (contains!916 lt!72483 (_1!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!72485 () List!1735)

(assert (=> d!43211 (= lt!72483 (ListLongMap!1736 lt!72485))))

(declare-fun lt!72484 () Unit!4344)

(declare-fun lt!72482 () Unit!4344)

(assert (=> d!43211 (= lt!72484 lt!72482)))

(assert (=> d!43211 (= (getValueByKey!174 lt!72485 (_1!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!179 (_2!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43211 (= lt!72482 (lemmaContainsTupThenGetReturnValue!89 lt!72485 (_1!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43211 (= lt!72485 (insertStrictlySorted!92 (toList!883 (ite c!25834 call!15239 call!15232)) (_1!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43211 (= (+!177 (ite c!25834 call!15239 call!15232) (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!72483)))

(declare-fun b!138586 () Bool)

(declare-fun res!66362 () Bool)

(assert (=> b!138586 (=> (not res!66362) (not e!90325))))

(assert (=> b!138586 (= res!66362 (= (getValueByKey!174 (toList!883 lt!72483) (_1!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!179 (_2!1351 (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!138587 () Bool)

(assert (=> b!138587 (= e!90325 (contains!918 (toList!883 lt!72483) (ite c!25834 (ite c!25845 (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!43211 res!66361) b!138586))

(assert (= (and b!138586 res!66362) b!138587))

(declare-fun m!165421 () Bool)

(assert (=> d!43211 m!165421))

(declare-fun m!165423 () Bool)

(assert (=> d!43211 m!165423))

(declare-fun m!165425 () Bool)

(assert (=> d!43211 m!165425))

(declare-fun m!165427 () Bool)

(assert (=> d!43211 m!165427))

(declare-fun m!165429 () Bool)

(assert (=> b!138586 m!165429))

(declare-fun m!165431 () Bool)

(assert (=> b!138587 m!165431))

(assert (=> bm!15223 d!43211))

(declare-fun d!43213 () Bool)

(declare-fun e!90327 () Bool)

(assert (=> d!43213 e!90327))

(declare-fun res!66363 () Bool)

(assert (=> d!43213 (=> res!66363 e!90327)))

(declare-fun lt!72486 () Bool)

(assert (=> d!43213 (= res!66363 (not lt!72486))))

(declare-fun lt!72488 () Bool)

(assert (=> d!43213 (= lt!72486 lt!72488)))

(declare-fun lt!72489 () Unit!4344)

(declare-fun e!90326 () Unit!4344)

(assert (=> d!43213 (= lt!72489 e!90326)))

(declare-fun c!25924 () Bool)

(assert (=> d!43213 (= c!25924 lt!72488)))

(assert (=> d!43213 (= lt!72488 (containsKey!178 (toList!883 call!15228) (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229))))))

(assert (=> d!43213 (= (contains!916 call!15228 (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229))) lt!72486)))

(declare-fun b!138588 () Bool)

(declare-fun lt!72487 () Unit!4344)

(assert (=> b!138588 (= e!90326 lt!72487)))

(assert (=> b!138588 (= lt!72487 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!883 call!15228) (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229))))))

(assert (=> b!138588 (isDefined!127 (getValueByKey!174 (toList!883 call!15228) (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229))))))

(declare-fun b!138589 () Bool)

(declare-fun Unit!4360 () Unit!4344)

(assert (=> b!138589 (= e!90326 Unit!4360)))

(declare-fun b!138590 () Bool)

(assert (=> b!138590 (= e!90327 (isDefined!127 (getValueByKey!174 (toList!883 call!15228) (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229)))))))

(assert (= (and d!43213 c!25924) b!138588))

(assert (= (and d!43213 (not c!25924)) b!138589))

(assert (= (and d!43213 (not res!66363)) b!138590))

(assert (=> d!43213 m!164983))

(declare-fun m!165433 () Bool)

(assert (=> d!43213 m!165433))

(assert (=> b!138588 m!164983))

(declare-fun m!165435 () Bool)

(assert (=> b!138588 m!165435))

(assert (=> b!138588 m!164983))

(declare-fun m!165437 () Bool)

(assert (=> b!138588 m!165437))

(assert (=> b!138588 m!165437))

(declare-fun m!165439 () Bool)

(assert (=> b!138588 m!165439))

(assert (=> b!138590 m!164983))

(assert (=> b!138590 m!165437))

(assert (=> b!138590 m!165437))

(assert (=> b!138590 m!165439))

(assert (=> b!138255 d!43213))

(declare-fun d!43215 () Bool)

(declare-fun e!90330 () Bool)

(assert (=> d!43215 e!90330))

(declare-fun res!66366 () Bool)

(assert (=> d!43215 (=> (not res!66366) (not e!90330))))

(assert (=> d!43215 (= res!66366 (and (bvsge (index!3271 lt!72229) #b00000000000000000000000000000000) (bvslt (index!3271 lt!72229) (size!2568 (_keys!4676 newMap!16)))))))

(declare-fun lt!72492 () Unit!4344)

(declare-fun choose!851 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) Int) Unit!4344)

(assert (=> d!43215 (= lt!72492 (choose!851 (_keys!4676 newMap!16) lt!72231 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43215 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43215 (= (lemmaValidKeyInArrayIsInListMap!124 (_keys!4676 newMap!16) lt!72231 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (defaultEntry!2919 newMap!16)) lt!72492)))

(declare-fun b!138593 () Bool)

(assert (=> b!138593 (= e!90330 (contains!916 (getCurrentListMap!557 (_keys!4676 newMap!16) lt!72231 (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (select (arr!2297 (_keys!4676 newMap!16)) (index!3271 lt!72229))))))

(assert (= (and d!43215 res!66366) b!138593))

(declare-fun m!165441 () Bool)

(assert (=> d!43215 m!165441))

(assert (=> d!43215 m!165021))

(declare-fun m!165443 () Bool)

(assert (=> b!138593 m!165443))

(assert (=> b!138593 m!164983))

(assert (=> b!138593 m!165443))

(assert (=> b!138593 m!164983))

(declare-fun m!165445 () Bool)

(assert (=> b!138593 m!165445))

(assert (=> b!138255 d!43215))

(declare-fun b!138594 () Bool)

(declare-fun e!90339 () Bool)

(declare-fun call!15283 () Bool)

(assert (=> b!138594 (= e!90339 (not call!15283))))

(declare-fun b!138595 () Bool)

(declare-fun e!90338 () Bool)

(declare-fun lt!72507 () ListLongMap!1735)

(assert (=> b!138595 (= e!90338 (= (apply!118 lt!72507 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2770 newMap!16)))))

(declare-fun b!138596 () Bool)

(declare-fun e!90331 () ListLongMap!1735)

(declare-fun e!90333 () ListLongMap!1735)

(assert (=> b!138596 (= e!90331 e!90333)))

(declare-fun c!25926 () Bool)

(assert (=> b!138596 (= c!25926 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15274 () Bool)

(declare-fun call!15277 () ListLongMap!1735)

(declare-fun call!15282 () ListLongMap!1735)

(assert (=> bm!15274 (= call!15277 call!15282)))

(declare-fun b!138597 () Bool)

(declare-fun e!90334 () Bool)

(assert (=> b!138597 (= e!90334 e!90338)))

(declare-fun res!66367 () Bool)

(declare-fun call!15278 () Bool)

(assert (=> b!138597 (= res!66367 call!15278)))

(assert (=> b!138597 (=> (not res!66367) (not e!90338))))

(declare-fun bm!15275 () Bool)

(assert (=> bm!15275 (= call!15282 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun b!138598 () Bool)

(declare-fun e!90337 () Unit!4344)

(declare-fun Unit!4361 () Unit!4344)

(assert (=> b!138598 (= e!90337 Unit!4361)))

(declare-fun b!138599 () Bool)

(declare-fun e!90340 () Bool)

(assert (=> b!138599 (= e!90340 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!43217 () Bool)

(declare-fun e!90342 () Bool)

(assert (=> d!43217 e!90342))

(declare-fun res!66370 () Bool)

(assert (=> d!43217 (=> (not res!66370) (not e!90342))))

(assert (=> d!43217 (= res!66370 (or (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))))

(declare-fun lt!72512 () ListLongMap!1735)

(assert (=> d!43217 (= lt!72507 lt!72512)))

(declare-fun lt!72498 () Unit!4344)

(assert (=> d!43217 (= lt!72498 e!90337)))

(declare-fun c!25930 () Bool)

(assert (=> d!43217 (= c!25930 e!90340)))

(declare-fun res!66369 () Bool)

(assert (=> d!43217 (=> (not res!66369) (not e!90340))))

(assert (=> d!43217 (= res!66369 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43217 (= lt!72512 e!90331)))

(declare-fun c!25927 () Bool)

(assert (=> d!43217 (= c!25927 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43217 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43217 (= (getCurrentListMap!557 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) lt!72507)))

(declare-fun b!138600 () Bool)

(declare-fun call!15279 () ListLongMap!1735)

(assert (=> b!138600 (= e!90333 call!15279)))

(declare-fun b!138601 () Bool)

(declare-fun e!90343 () Bool)

(declare-fun e!90336 () Bool)

(assert (=> b!138601 (= e!90343 e!90336)))

(declare-fun res!66374 () Bool)

(assert (=> b!138601 (=> (not res!66374) (not e!90336))))

(assert (=> b!138601 (= res!66374 (contains!916 lt!72507 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138601 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun bm!15276 () Bool)

(assert (=> bm!15276 (= call!15283 (contains!916 lt!72507 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138602 () Bool)

(assert (=> b!138602 (= e!90334 (not call!15278))))

(declare-fun b!138603 () Bool)

(declare-fun res!66372 () Bool)

(assert (=> b!138603 (=> (not res!66372) (not e!90342))))

(assert (=> b!138603 (= res!66372 e!90343)))

(declare-fun res!66373 () Bool)

(assert (=> b!138603 (=> res!66373 e!90343)))

(declare-fun e!90341 () Bool)

(assert (=> b!138603 (= res!66373 (not e!90341))))

(declare-fun res!66368 () Bool)

(assert (=> b!138603 (=> (not res!66368) (not e!90341))))

(assert (=> b!138603 (= res!66368 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138604 () Bool)

(declare-fun e!90332 () ListLongMap!1735)

(assert (=> b!138604 (= e!90332 call!15279)))

(declare-fun b!138605 () Bool)

(assert (=> b!138605 (= e!90342 e!90339)))

(declare-fun c!25928 () Bool)

(assert (=> b!138605 (= c!25928 (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138606 () Bool)

(declare-fun res!66371 () Bool)

(assert (=> b!138606 (=> (not res!66371) (not e!90342))))

(assert (=> b!138606 (= res!66371 e!90334)))

(declare-fun c!25925 () Bool)

(assert (=> b!138606 (= c!25925 (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138607 () Bool)

(declare-fun lt!72505 () Unit!4344)

(assert (=> b!138607 (= e!90337 lt!72505)))

(declare-fun lt!72499 () ListLongMap!1735)

(assert (=> b!138607 (= lt!72499 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72504 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72495 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72495 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72503 () Unit!4344)

(assert (=> b!138607 (= lt!72503 (addStillContains!94 lt!72499 lt!72504 (zeroValue!2770 newMap!16) lt!72495))))

(assert (=> b!138607 (contains!916 (+!177 lt!72499 (tuple2!2681 lt!72504 (zeroValue!2770 newMap!16))) lt!72495)))

(declare-fun lt!72496 () Unit!4344)

(assert (=> b!138607 (= lt!72496 lt!72503)))

(declare-fun lt!72508 () ListLongMap!1735)

(assert (=> b!138607 (= lt!72508 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72506 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72513 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72513 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72502 () Unit!4344)

(assert (=> b!138607 (= lt!72502 (addApplyDifferent!94 lt!72508 lt!72506 (minValue!2770 newMap!16) lt!72513))))

(assert (=> b!138607 (= (apply!118 (+!177 lt!72508 (tuple2!2681 lt!72506 (minValue!2770 newMap!16))) lt!72513) (apply!118 lt!72508 lt!72513))))

(declare-fun lt!72514 () Unit!4344)

(assert (=> b!138607 (= lt!72514 lt!72502)))

(declare-fun lt!72510 () ListLongMap!1735)

(assert (=> b!138607 (= lt!72510 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72500 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72497 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72497 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72494 () Unit!4344)

(assert (=> b!138607 (= lt!72494 (addApplyDifferent!94 lt!72510 lt!72500 (zeroValue!2770 newMap!16) lt!72497))))

(assert (=> b!138607 (= (apply!118 (+!177 lt!72510 (tuple2!2681 lt!72500 (zeroValue!2770 newMap!16))) lt!72497) (apply!118 lt!72510 lt!72497))))

(declare-fun lt!72501 () Unit!4344)

(assert (=> b!138607 (= lt!72501 lt!72494)))

(declare-fun lt!72509 () ListLongMap!1735)

(assert (=> b!138607 (= lt!72509 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72511 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72493 () (_ BitVec 64))

(assert (=> b!138607 (= lt!72493 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138607 (= lt!72505 (addApplyDifferent!94 lt!72509 lt!72511 (minValue!2770 newMap!16) lt!72493))))

(assert (=> b!138607 (= (apply!118 (+!177 lt!72509 (tuple2!2681 lt!72511 (minValue!2770 newMap!16))) lt!72493) (apply!118 lt!72509 lt!72493))))

(declare-fun bm!15277 () Bool)

(assert (=> bm!15277 (= call!15278 (contains!916 lt!72507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138608 () Bool)

(declare-fun call!15281 () ListLongMap!1735)

(assert (=> b!138608 (= e!90332 call!15281)))

(declare-fun bm!15278 () Bool)

(declare-fun call!15280 () ListLongMap!1735)

(assert (=> bm!15278 (= call!15280 (+!177 (ite c!25927 call!15282 (ite c!25926 call!15277 call!15281)) (ite (or c!25927 c!25926) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2770 newMap!16)) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 newMap!16)))))))

(declare-fun b!138609 () Bool)

(declare-fun e!90335 () Bool)

(assert (=> b!138609 (= e!90335 (= (apply!118 lt!72507 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2770 newMap!16)))))

(declare-fun b!138610 () Bool)

(assert (=> b!138610 (= e!90339 e!90335)))

(declare-fun res!66375 () Bool)

(assert (=> b!138610 (= res!66375 call!15283)))

(assert (=> b!138610 (=> (not res!66375) (not e!90335))))

(declare-fun b!138611 () Bool)

(assert (=> b!138611 (= e!90336 (= (apply!118 lt!72507 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)) (get!1513 (select (arr!2298 (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!438 (defaultEntry!2919 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2569 (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))))))))

(assert (=> b!138611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138612 () Bool)

(assert (=> b!138612 (= e!90331 (+!177 call!15280 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2770 newMap!16))))))

(declare-fun b!138613 () Bool)

(declare-fun c!25929 () Bool)

(assert (=> b!138613 (= c!25929 (and (not (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2676 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138613 (= e!90333 e!90332)))

(declare-fun b!138614 () Bool)

(assert (=> b!138614 (= e!90341 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15279 () Bool)

(assert (=> bm!15279 (= call!15281 call!15277)))

(declare-fun bm!15280 () Bool)

(assert (=> bm!15280 (= call!15279 call!15280)))

(assert (= (and d!43217 c!25927) b!138612))

(assert (= (and d!43217 (not c!25927)) b!138596))

(assert (= (and b!138596 c!25926) b!138600))

(assert (= (and b!138596 (not c!25926)) b!138613))

(assert (= (and b!138613 c!25929) b!138604))

(assert (= (and b!138613 (not c!25929)) b!138608))

(assert (= (or b!138604 b!138608) bm!15279))

(assert (= (or b!138600 bm!15279) bm!15274))

(assert (= (or b!138600 b!138604) bm!15280))

(assert (= (or b!138612 bm!15274) bm!15275))

(assert (= (or b!138612 bm!15280) bm!15278))

(assert (= (and d!43217 res!66369) b!138599))

(assert (= (and d!43217 c!25930) b!138607))

(assert (= (and d!43217 (not c!25930)) b!138598))

(assert (= (and d!43217 res!66370) b!138603))

(assert (= (and b!138603 res!66368) b!138614))

(assert (= (and b!138603 (not res!66373)) b!138601))

(assert (= (and b!138601 res!66374) b!138611))

(assert (= (and b!138603 res!66372) b!138606))

(assert (= (and b!138606 c!25925) b!138597))

(assert (= (and b!138606 (not c!25925)) b!138602))

(assert (= (and b!138597 res!66367) b!138595))

(assert (= (or b!138597 b!138602) bm!15277))

(assert (= (and b!138606 res!66371) b!138605))

(assert (= (and b!138605 c!25928) b!138610))

(assert (= (and b!138605 (not c!25928)) b!138594))

(assert (= (and b!138610 res!66375) b!138609))

(assert (= (or b!138610 b!138594) bm!15276))

(declare-fun b_lambda!6193 () Bool)

(assert (=> (not b_lambda!6193) (not b!138611)))

(assert (=> b!138611 t!6288))

(declare-fun b_and!8627 () Bool)

(assert (= b_and!8623 (and (=> t!6288 result!4129) b_and!8627)))

(assert (=> b!138611 t!6290))

(declare-fun b_and!8629 () Bool)

(assert (= b_and!8625 (and (=> t!6290 result!4131) b_and!8629)))

(declare-fun m!165447 () Bool)

(assert (=> b!138612 m!165447))

(declare-fun m!165449 () Bool)

(assert (=> bm!15278 m!165449))

(declare-fun m!165451 () Bool)

(assert (=> b!138607 m!165451))

(declare-fun m!165453 () Bool)

(assert (=> b!138607 m!165453))

(declare-fun m!165455 () Bool)

(assert (=> b!138607 m!165455))

(assert (=> b!138607 m!165455))

(declare-fun m!165457 () Bool)

(assert (=> b!138607 m!165457))

(declare-fun m!165459 () Bool)

(assert (=> b!138607 m!165459))

(declare-fun m!165461 () Bool)

(assert (=> b!138607 m!165461))

(assert (=> b!138607 m!165453))

(declare-fun m!165463 () Bool)

(assert (=> b!138607 m!165463))

(declare-fun m!165465 () Bool)

(assert (=> b!138607 m!165465))

(assert (=> b!138607 m!165149))

(declare-fun m!165467 () Bool)

(assert (=> b!138607 m!165467))

(declare-fun m!165469 () Bool)

(assert (=> b!138607 m!165469))

(assert (=> b!138607 m!165461))

(declare-fun m!165471 () Bool)

(assert (=> b!138607 m!165471))

(assert (=> b!138607 m!165451))

(declare-fun m!165473 () Bool)

(assert (=> b!138607 m!165473))

(declare-fun m!165475 () Bool)

(assert (=> b!138607 m!165475))

(declare-fun m!165477 () Bool)

(assert (=> b!138607 m!165477))

(declare-fun m!165479 () Bool)

(assert (=> b!138607 m!165479))

(declare-fun m!165481 () Bool)

(assert (=> b!138607 m!165481))

(assert (=> b!138614 m!165149))

(assert (=> b!138614 m!165149))

(assert (=> b!138614 m!165151))

(declare-fun m!165483 () Bool)

(assert (=> bm!15277 m!165483))

(assert (=> bm!15275 m!165465))

(declare-fun m!165485 () Bool)

(assert (=> b!138595 m!165485))

(assert (=> b!138599 m!165149))

(assert (=> b!138599 m!165149))

(assert (=> b!138599 m!165151))

(assert (=> b!138601 m!165149))

(assert (=> b!138601 m!165149))

(declare-fun m!165487 () Bool)

(assert (=> b!138601 m!165487))

(declare-fun m!165489 () Bool)

(assert (=> b!138611 m!165489))

(assert (=> b!138611 m!165305))

(declare-fun m!165491 () Bool)

(assert (=> b!138611 m!165491))

(assert (=> b!138611 m!165305))

(assert (=> b!138611 m!165149))

(declare-fun m!165493 () Bool)

(assert (=> b!138611 m!165493))

(assert (=> b!138611 m!165149))

(assert (=> b!138611 m!165489))

(declare-fun m!165495 () Bool)

(assert (=> b!138609 m!165495))

(declare-fun m!165497 () Bool)

(assert (=> bm!15276 m!165497))

(assert (=> d!43217 m!165021))

(assert (=> b!138255 d!43217))

(declare-fun d!43219 () Bool)

(declare-fun e!90346 () Bool)

(assert (=> d!43219 e!90346))

(declare-fun res!66378 () Bool)

(assert (=> d!43219 (=> (not res!66378) (not e!90346))))

(assert (=> d!43219 (= res!66378 (and (bvsge (index!3271 lt!72229) #b00000000000000000000000000000000) (bvslt (index!3271 lt!72229) (size!2569 (_values!2902 newMap!16)))))))

(declare-fun lt!72517 () Unit!4344)

(declare-fun choose!852 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 (_ BitVec 32) (_ BitVec 64) V!3531 Int) Unit!4344)

(assert (=> d!43219 (= lt!72517 (choose!852 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43219 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43219 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (index!3271 lt!72229) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)) lt!72517)))

(declare-fun b!138617 () Bool)

(assert (=> b!138617 (= e!90346 (= (+!177 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (tuple2!2681 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!557 (_keys!4676 newMap!16) (array!4860 (store (arr!2298 (_values!2902 newMap!16)) (index!3271 lt!72229) (ValueCellFull!1113 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2569 (_values!2902 newMap!16))) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16))))))

(assert (= (and d!43219 res!66378) b!138617))

(assert (=> d!43219 m!164795))

(assert (=> d!43219 m!164815))

(declare-fun m!165499 () Bool)

(assert (=> d!43219 m!165499))

(assert (=> d!43219 m!165021))

(assert (=> b!138617 m!164885))

(assert (=> b!138617 m!164885))

(assert (=> b!138617 m!165235))

(assert (=> b!138617 m!164977))

(assert (=> b!138617 m!164975))

(assert (=> b!138255 d!43219))

(declare-fun d!43221 () Bool)

(declare-fun res!66383 () Bool)

(declare-fun e!90351 () Bool)

(assert (=> d!43221 (=> res!66383 e!90351)))

(assert (=> d!43221 (= res!66383 (and ((_ is Cons!1731) (toList!883 lt!72063)) (= (_1!1351 (h!2338 (toList!883 lt!72063))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(assert (=> d!43221 (= (containsKey!178 (toList!883 lt!72063) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)) e!90351)))

(declare-fun b!138622 () Bool)

(declare-fun e!90352 () Bool)

(assert (=> b!138622 (= e!90351 e!90352)))

(declare-fun res!66384 () Bool)

(assert (=> b!138622 (=> (not res!66384) (not e!90352))))

(assert (=> b!138622 (= res!66384 (and (or (not ((_ is Cons!1731) (toList!883 lt!72063))) (bvsle (_1!1351 (h!2338 (toList!883 lt!72063))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))) ((_ is Cons!1731) (toList!883 lt!72063)) (bvslt (_1!1351 (h!2338 (toList!883 lt!72063))) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355))))))

(declare-fun b!138623 () Bool)

(assert (=> b!138623 (= e!90352 (containsKey!178 (t!6279 (toList!883 lt!72063)) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (= (and d!43221 (not res!66383)) b!138622))

(assert (= (and b!138622 res!66384) b!138623))

(assert (=> b!138623 m!164795))

(declare-fun m!165501 () Bool)

(assert (=> b!138623 m!165501))

(assert (=> d!43103 d!43221))

(declare-fun b!138624 () Bool)

(declare-fun e!90361 () Bool)

(declare-fun call!15290 () Bool)

(assert (=> b!138624 (= e!90361 (not call!15290))))

(declare-fun b!138625 () Bool)

(declare-fun lt!72532 () ListLongMap!1735)

(declare-fun e!90360 () Bool)

(assert (=> b!138625 (= e!90360 (= (apply!118 lt!72532 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16))))))

(declare-fun b!138626 () Bool)

(declare-fun e!90353 () ListLongMap!1735)

(declare-fun e!90355 () ListLongMap!1735)

(assert (=> b!138626 (= e!90353 e!90355)))

(declare-fun c!25932 () Bool)

(assert (=> b!138626 (= c!25932 (and (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15281 () Bool)

(declare-fun call!15284 () ListLongMap!1735)

(declare-fun call!15289 () ListLongMap!1735)

(assert (=> bm!15281 (= call!15284 call!15289)))

(declare-fun b!138627 () Bool)

(declare-fun e!90356 () Bool)

(assert (=> b!138627 (= e!90356 e!90360)))

(declare-fun res!66385 () Bool)

(declare-fun call!15285 () Bool)

(assert (=> b!138627 (= res!66385 call!15285)))

(assert (=> b!138627 (=> (not res!66385) (not e!90360))))

(declare-fun bm!15282 () Bool)

(assert (=> bm!15282 (= call!15289 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun b!138628 () Bool)

(declare-fun e!90359 () Unit!4344)

(declare-fun Unit!4362 () Unit!4344)

(assert (=> b!138628 (= e!90359 Unit!4362)))

(declare-fun b!138629 () Bool)

(declare-fun e!90362 () Bool)

(assert (=> b!138629 (= e!90362 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!43223 () Bool)

(declare-fun e!90364 () Bool)

(assert (=> d!43223 e!90364))

(declare-fun res!66388 () Bool)

(assert (=> d!43223 (=> (not res!66388) (not e!90364))))

(assert (=> d!43223 (= res!66388 (or (bvsge #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))))

(declare-fun lt!72537 () ListLongMap!1735)

(assert (=> d!43223 (= lt!72532 lt!72537)))

(declare-fun lt!72523 () Unit!4344)

(assert (=> d!43223 (= lt!72523 e!90359)))

(declare-fun c!25936 () Bool)

(assert (=> d!43223 (= c!25936 e!90362)))

(declare-fun res!66387 () Bool)

(assert (=> d!43223 (=> (not res!66387) (not e!90362))))

(assert (=> d!43223 (= res!66387 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(assert (=> d!43223 (= lt!72537 e!90353)))

(declare-fun c!25933 () Bool)

(assert (=> d!43223 (= c!25933 (and (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43223 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43223 (= (getCurrentListMap!557 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) lt!72532)))

(declare-fun b!138630 () Bool)

(declare-fun call!15286 () ListLongMap!1735)

(assert (=> b!138630 (= e!90355 call!15286)))

(declare-fun b!138631 () Bool)

(declare-fun e!90365 () Bool)

(declare-fun e!90358 () Bool)

(assert (=> b!138631 (= e!90365 e!90358)))

(declare-fun res!66392 () Bool)

(assert (=> b!138631 (=> (not res!66392) (not e!90358))))

(assert (=> b!138631 (= res!66392 (contains!916 lt!72532 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!138631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun bm!15283 () Bool)

(assert (=> bm!15283 (= call!15290 (contains!916 lt!72532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138632 () Bool)

(assert (=> b!138632 (= e!90356 (not call!15285))))

(declare-fun b!138633 () Bool)

(declare-fun res!66390 () Bool)

(assert (=> b!138633 (=> (not res!66390) (not e!90364))))

(assert (=> b!138633 (= res!66390 e!90365)))

(declare-fun res!66391 () Bool)

(assert (=> b!138633 (=> res!66391 e!90365)))

(declare-fun e!90363 () Bool)

(assert (=> b!138633 (= res!66391 (not e!90363))))

(declare-fun res!66386 () Bool)

(assert (=> b!138633 (=> (not res!66386) (not e!90363))))

(assert (=> b!138633 (= res!66386 (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138634 () Bool)

(declare-fun e!90354 () ListLongMap!1735)

(assert (=> b!138634 (= e!90354 call!15286)))

(declare-fun b!138635 () Bool)

(assert (=> b!138635 (= e!90364 e!90361)))

(declare-fun c!25934 () Bool)

(assert (=> b!138635 (= c!25934 (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!138636 () Bool)

(declare-fun res!66389 () Bool)

(assert (=> b!138636 (=> (not res!66389) (not e!90364))))

(assert (=> b!138636 (= res!66389 e!90356)))

(declare-fun c!25931 () Bool)

(assert (=> b!138636 (= c!25931 (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!138637 () Bool)

(declare-fun lt!72530 () Unit!4344)

(assert (=> b!138637 (= e!90359 lt!72530)))

(declare-fun lt!72524 () ListLongMap!1735)

(assert (=> b!138637 (= lt!72524 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72529 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72520 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72520 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72528 () Unit!4344)

(assert (=> b!138637 (= lt!72528 (addStillContains!94 lt!72524 lt!72529 (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) lt!72520))))

(assert (=> b!138637 (contains!916 (+!177 lt!72524 (tuple2!2681 lt!72529 (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)))) lt!72520)))

(declare-fun lt!72521 () Unit!4344)

(assert (=> b!138637 (= lt!72521 lt!72528)))

(declare-fun lt!72533 () ListLongMap!1735)

(assert (=> b!138637 (= lt!72533 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72531 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72538 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72538 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72527 () Unit!4344)

(assert (=> b!138637 (= lt!72527 (addApplyDifferent!94 lt!72533 lt!72531 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) lt!72538))))

(assert (=> b!138637 (= (apply!118 (+!177 lt!72533 (tuple2!2681 lt!72531 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)))) lt!72538) (apply!118 lt!72533 lt!72538))))

(declare-fun lt!72539 () Unit!4344)

(assert (=> b!138637 (= lt!72539 lt!72527)))

(declare-fun lt!72535 () ListLongMap!1735)

(assert (=> b!138637 (= lt!72535 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72525 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72522 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72522 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!72519 () Unit!4344)

(assert (=> b!138637 (= lt!72519 (addApplyDifferent!94 lt!72535 lt!72525 (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) lt!72522))))

(assert (=> b!138637 (= (apply!118 (+!177 lt!72535 (tuple2!2681 lt!72525 (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)))) lt!72522) (apply!118 lt!72535 lt!72522))))

(declare-fun lt!72526 () Unit!4344)

(assert (=> b!138637 (= lt!72526 lt!72519)))

(declare-fun lt!72534 () ListLongMap!1735)

(assert (=> b!138637 (= lt!72534 (getCurrentListMapNoExtraKeys!143 (_keys!4676 newMap!16) (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231) (mask!7249 newMap!16) (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16)) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72536 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72518 () (_ BitVec 64))

(assert (=> b!138637 (= lt!72518 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138637 (= lt!72530 (addApplyDifferent!94 lt!72534 lt!72536 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)) lt!72518))))

(assert (=> b!138637 (= (apply!118 (+!177 lt!72534 (tuple2!2681 lt!72536 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)))) lt!72518) (apply!118 lt!72534 lt!72518))))

(declare-fun bm!15284 () Bool)

(assert (=> bm!15284 (= call!15285 (contains!916 lt!72532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138638 () Bool)

(declare-fun call!15288 () ListLongMap!1735)

(assert (=> b!138638 (= e!90354 call!15288)))

(declare-fun bm!15285 () Bool)

(declare-fun call!15287 () ListLongMap!1735)

(assert (=> bm!15285 (= call!15287 (+!177 (ite c!25933 call!15289 (ite c!25932 call!15284 call!15288)) (ite (or c!25933 c!25932) (tuple2!2681 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25834 c!25845) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2770 newMap!16))) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16))))))))

(declare-fun b!138639 () Bool)

(declare-fun e!90357 () Bool)

(assert (=> b!138639 (= e!90357 (= (apply!118 lt!72532 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16))))))

(declare-fun b!138640 () Bool)

(assert (=> b!138640 (= e!90361 e!90357)))

(declare-fun res!66393 () Bool)

(assert (=> b!138640 (= res!66393 call!15290)))

(assert (=> b!138640 (=> (not res!66393) (not e!90357))))

(declare-fun b!138641 () Bool)

(assert (=> b!138641 (= e!90358 (= (apply!118 lt!72532 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)) (get!1513 (select (arr!2298 (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231)) #b00000000000000000000000000000000) (dynLambda!438 (defaultEntry!2919 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!138641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2569 (ite (or c!25834 c!25839) (_values!2902 newMap!16) lt!72231))))))

(assert (=> b!138641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138642 () Bool)

(assert (=> b!138642 (= e!90353 (+!177 call!15287 (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25834 (ite c!25845 (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2770 newMap!16)))))))

(declare-fun b!138643 () Bool)

(declare-fun c!25935 () Bool)

(assert (=> b!138643 (= c!25935 (and (not (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!25834 (ite c!25845 lt!72209 lt!72212) (extraKeys!2676 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!138643 (= e!90355 e!90354)))

(declare-fun b!138644 () Bool)

(assert (=> b!138644 (= e!90363 (validKeyInArray!0 (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15286 () Bool)

(assert (=> bm!15286 (= call!15288 call!15284)))

(declare-fun bm!15287 () Bool)

(assert (=> bm!15287 (= call!15286 call!15287)))

(assert (= (and d!43223 c!25933) b!138642))

(assert (= (and d!43223 (not c!25933)) b!138626))

(assert (= (and b!138626 c!25932) b!138630))

(assert (= (and b!138626 (not c!25932)) b!138643))

(assert (= (and b!138643 c!25935) b!138634))

(assert (= (and b!138643 (not c!25935)) b!138638))

(assert (= (or b!138634 b!138638) bm!15286))

(assert (= (or b!138630 bm!15286) bm!15281))

(assert (= (or b!138630 b!138634) bm!15287))

(assert (= (or b!138642 bm!15281) bm!15282))

(assert (= (or b!138642 bm!15287) bm!15285))

(assert (= (and d!43223 res!66387) b!138629))

(assert (= (and d!43223 c!25936) b!138637))

(assert (= (and d!43223 (not c!25936)) b!138628))

(assert (= (and d!43223 res!66388) b!138633))

(assert (= (and b!138633 res!66386) b!138644))

(assert (= (and b!138633 (not res!66391)) b!138631))

(assert (= (and b!138631 res!66392) b!138641))

(assert (= (and b!138633 res!66390) b!138636))

(assert (= (and b!138636 c!25931) b!138627))

(assert (= (and b!138636 (not c!25931)) b!138632))

(assert (= (and b!138627 res!66385) b!138625))

(assert (= (or b!138627 b!138632) bm!15284))

(assert (= (and b!138636 res!66389) b!138635))

(assert (= (and b!138635 c!25934) b!138640))

(assert (= (and b!138635 (not c!25934)) b!138624))

(assert (= (and b!138640 res!66393) b!138639))

(assert (= (or b!138640 b!138624) bm!15283))

(declare-fun b_lambda!6195 () Bool)

(assert (=> (not b_lambda!6195) (not b!138641)))

(assert (=> b!138641 t!6288))

(declare-fun b_and!8631 () Bool)

(assert (= b_and!8627 (and (=> t!6288 result!4129) b_and!8631)))

(assert (=> b!138641 t!6290))

(declare-fun b_and!8633 () Bool)

(assert (= b_and!8629 (and (=> t!6290 result!4131) b_and!8633)))

(declare-fun m!165503 () Bool)

(assert (=> b!138642 m!165503))

(declare-fun m!165505 () Bool)

(assert (=> bm!15285 m!165505))

(declare-fun m!165507 () Bool)

(assert (=> b!138637 m!165507))

(declare-fun m!165509 () Bool)

(assert (=> b!138637 m!165509))

(declare-fun m!165511 () Bool)

(assert (=> b!138637 m!165511))

(assert (=> b!138637 m!165511))

(declare-fun m!165513 () Bool)

(assert (=> b!138637 m!165513))

(declare-fun m!165515 () Bool)

(assert (=> b!138637 m!165515))

(declare-fun m!165517 () Bool)

(assert (=> b!138637 m!165517))

(assert (=> b!138637 m!165509))

(declare-fun m!165519 () Bool)

(assert (=> b!138637 m!165519))

(declare-fun m!165521 () Bool)

(assert (=> b!138637 m!165521))

(assert (=> b!138637 m!165149))

(declare-fun m!165523 () Bool)

(assert (=> b!138637 m!165523))

(declare-fun m!165525 () Bool)

(assert (=> b!138637 m!165525))

(assert (=> b!138637 m!165517))

(declare-fun m!165527 () Bool)

(assert (=> b!138637 m!165527))

(assert (=> b!138637 m!165507))

(declare-fun m!165529 () Bool)

(assert (=> b!138637 m!165529))

(declare-fun m!165531 () Bool)

(assert (=> b!138637 m!165531))

(declare-fun m!165533 () Bool)

(assert (=> b!138637 m!165533))

(declare-fun m!165535 () Bool)

(assert (=> b!138637 m!165535))

(declare-fun m!165537 () Bool)

(assert (=> b!138637 m!165537))

(assert (=> b!138644 m!165149))

(assert (=> b!138644 m!165149))

(assert (=> b!138644 m!165151))

(declare-fun m!165539 () Bool)

(assert (=> bm!15284 m!165539))

(assert (=> bm!15282 m!165521))

(declare-fun m!165541 () Bool)

(assert (=> b!138625 m!165541))

(assert (=> b!138629 m!165149))

(assert (=> b!138629 m!165149))

(assert (=> b!138629 m!165151))

(assert (=> b!138631 m!165149))

(assert (=> b!138631 m!165149))

(declare-fun m!165543 () Bool)

(assert (=> b!138631 m!165543))

(declare-fun m!165545 () Bool)

(assert (=> b!138641 m!165545))

(assert (=> b!138641 m!165305))

(declare-fun m!165547 () Bool)

(assert (=> b!138641 m!165547))

(assert (=> b!138641 m!165305))

(assert (=> b!138641 m!165149))

(declare-fun m!165549 () Bool)

(assert (=> b!138641 m!165549))

(assert (=> b!138641 m!165149))

(assert (=> b!138641 m!165545))

(declare-fun m!165551 () Bool)

(assert (=> b!138639 m!165551))

(declare-fun m!165553 () Bool)

(assert (=> bm!15283 m!165553))

(assert (=> d!43223 m!165021))

(assert (=> bm!15221 d!43223))

(declare-fun d!43225 () Bool)

(assert (=> d!43225 (= (apply!118 lt!72135 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1516 (getValueByKey!174 (toList!883 lt!72135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5798 () Bool)

(assert (= bs!5798 d!43225))

(assert (=> bs!5798 m!165371))

(assert (=> bs!5798 m!165371))

(declare-fun m!165555 () Bool)

(assert (=> bs!5798 m!165555))

(assert (=> b!138129 d!43225))

(declare-fun d!43227 () Bool)

(assert (=> d!43227 (= (map!1432 (_2!1352 lt!72227)) (getCurrentListMap!557 (_keys!4676 (_2!1352 lt!72227)) (_values!2902 (_2!1352 lt!72227)) (mask!7249 (_2!1352 lt!72227)) (extraKeys!2676 (_2!1352 lt!72227)) (zeroValue!2770 (_2!1352 lt!72227)) (minValue!2770 (_2!1352 lt!72227)) #b00000000000000000000000000000000 (defaultEntry!2919 (_2!1352 lt!72227))))))

(declare-fun bs!5799 () Bool)

(assert (= bs!5799 d!43227))

(declare-fun m!165557 () Bool)

(assert (=> bs!5799 m!165557))

(assert (=> bm!15233 d!43227))

(declare-fun d!43229 () Bool)

(assert (=> d!43229 (= (get!1515 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138283 d!43229))

(assert (=> b!138241 d!43191))

(declare-fun d!43231 () Bool)

(assert (=> d!43231 (= (+!177 (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)) (tuple2!2681 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!557 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) lt!72212 (zeroValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2919 newMap!16)))))

(declare-fun lt!72542 () Unit!4344)

(declare-fun choose!853 (array!4857 array!4859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3531 V!3531 V!3531 Int) Unit!4344)

(assert (=> d!43231 (= lt!72542 (choose!853 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72212 (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)))))

(assert (=> d!43231 (validMask!0 (mask!7249 newMap!16))))

(assert (=> d!43231 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!63 (_keys!4676 newMap!16) (_values!2902 newMap!16) (mask!7249 newMap!16) (extraKeys!2676 newMap!16) lt!72212 (zeroValue!2770 newMap!16) (minValue!2770 newMap!16) (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) from!355) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2919 newMap!16)) lt!72542)))

(declare-fun bs!5800 () Bool)

(assert (= bs!5800 d!43231))

(assert (=> bs!5800 m!164885))

(declare-fun m!165559 () Bool)

(assert (=> bs!5800 m!165559))

(assert (=> bs!5800 m!164815))

(declare-fun m!165561 () Bool)

(assert (=> bs!5800 m!165561))

(assert (=> bs!5800 m!164815))

(declare-fun m!165563 () Bool)

(assert (=> bs!5800 m!165563))

(assert (=> bs!5800 m!165021))

(assert (=> bs!5800 m!164885))

(assert (=> b!138248 d!43231))

(declare-fun d!43233 () Bool)

(declare-fun res!66394 () Bool)

(declare-fun e!90366 () Bool)

(assert (=> d!43233 (=> res!66394 e!90366)))

(assert (=> d!43233 (= res!66394 (= (select (arr!2297 (_keys!4676 newMap!16)) #b00000000000000000000000000000000) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355)))))

(assert (=> d!43233 (= (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) #b00000000000000000000000000000000) e!90366)))

(declare-fun b!138645 () Bool)

(declare-fun e!90367 () Bool)

(assert (=> b!138645 (= e!90366 e!90367)))

(declare-fun res!66395 () Bool)

(assert (=> b!138645 (=> (not res!66395) (not e!90367))))

(assert (=> b!138645 (= res!66395 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2568 (_keys!4676 newMap!16))))))

(declare-fun b!138646 () Bool)

(assert (=> b!138646 (= e!90367 (arrayContainsKey!0 (_keys!4676 newMap!16) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!43233 (not res!66394)) b!138645))

(assert (= (and b!138645 res!66395) b!138646))

(assert (=> d!43233 m!165149))

(assert (=> b!138646 m!164795))

(declare-fun m!165565 () Bool)

(assert (=> b!138646 m!165565))

(assert (=> bm!15216 d!43233))

(declare-fun d!43235 () Bool)

(assert (=> d!43235 (= (apply!118 lt!72135 (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1516 (getValueByKey!174 (toList!883 lt!72135) (select (arr!2297 (_keys!4676 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5801 () Bool)

(assert (= bs!5801 d!43235))

(assert (=> bs!5801 m!164907))

(assert (=> bs!5801 m!165413))

(assert (=> bs!5801 m!165413))

(declare-fun m!165567 () Bool)

(assert (=> bs!5801 m!165567))

(assert (=> b!138145 d!43235))

(declare-fun d!43237 () Bool)

(declare-fun c!25937 () Bool)

(assert (=> d!43237 (= c!25937 ((_ is ValueCellFull!1113) (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!90368 () V!3531)

(assert (=> d!43237 (= (get!1513 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90368)))

(declare-fun b!138647 () Bool)

(assert (=> b!138647 (= e!90368 (get!1514 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138648 () Bool)

(assert (=> b!138648 (= e!90368 (get!1515 (select (arr!2298 (_values!2902 (v!3255 (underlying!472 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!438 (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43237 c!25937) b!138647))

(assert (= (and d!43237 (not c!25937)) b!138648))

(assert (=> b!138647 m!164933))

(assert (=> b!138647 m!164813))

(declare-fun m!165569 () Bool)

(assert (=> b!138647 m!165569))

(assert (=> b!138648 m!164933))

(assert (=> b!138648 m!164813))

(declare-fun m!165571 () Bool)

(assert (=> b!138648 m!165571))

(assert (=> b!138145 d!43237))

(assert (=> bm!15219 d!43099))

(declare-fun b!138650 () Bool)

(declare-fun e!90369 () Bool)

(assert (=> b!138650 (= e!90369 tp_is_empty!2913)))

(declare-fun b!138649 () Bool)

(declare-fun e!90370 () Bool)

(assert (=> b!138649 (= e!90370 tp_is_empty!2913)))

(declare-fun mapNonEmpty!4781 () Bool)

(declare-fun mapRes!4781 () Bool)

(declare-fun tp!11459 () Bool)

(assert (=> mapNonEmpty!4781 (= mapRes!4781 (and tp!11459 e!90370))))

(declare-fun mapValue!4781 () ValueCell!1113)

(declare-fun mapRest!4781 () (Array (_ BitVec 32) ValueCell!1113))

(declare-fun mapKey!4781 () (_ BitVec 32))

(assert (=> mapNonEmpty!4781 (= mapRest!4780 (store mapRest!4781 mapKey!4781 mapValue!4781))))

(declare-fun mapIsEmpty!4781 () Bool)

(assert (=> mapIsEmpty!4781 mapRes!4781))

(declare-fun condMapEmpty!4781 () Bool)

(declare-fun mapDefault!4781 () ValueCell!1113)

(assert (=> mapNonEmpty!4780 (= condMapEmpty!4781 (= mapRest!4780 ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4781)))))

(assert (=> mapNonEmpty!4780 (= tp!11458 (and e!90369 mapRes!4781))))

(assert (= (and mapNonEmpty!4780 condMapEmpty!4781) mapIsEmpty!4781))

(assert (= (and mapNonEmpty!4780 (not condMapEmpty!4781)) mapNonEmpty!4781))

(assert (= (and mapNonEmpty!4781 ((_ is ValueCellFull!1113) mapValue!4781)) b!138649))

(assert (= (and mapNonEmpty!4780 ((_ is ValueCellFull!1113) mapDefault!4781)) b!138650))

(declare-fun m!165573 () Bool)

(assert (=> mapNonEmpty!4781 m!165573))

(declare-fun b!138652 () Bool)

(declare-fun e!90371 () Bool)

(assert (=> b!138652 (= e!90371 tp_is_empty!2913)))

(declare-fun b!138651 () Bool)

(declare-fun e!90372 () Bool)

(assert (=> b!138651 (= e!90372 tp_is_empty!2913)))

(declare-fun mapNonEmpty!4782 () Bool)

(declare-fun mapRes!4782 () Bool)

(declare-fun tp!11460 () Bool)

(assert (=> mapNonEmpty!4782 (= mapRes!4782 (and tp!11460 e!90372))))

(declare-fun mapRest!4782 () (Array (_ BitVec 32) ValueCell!1113))

(declare-fun mapValue!4782 () ValueCell!1113)

(declare-fun mapKey!4782 () (_ BitVec 32))

(assert (=> mapNonEmpty!4782 (= mapRest!4779 (store mapRest!4782 mapKey!4782 mapValue!4782))))

(declare-fun mapIsEmpty!4782 () Bool)

(assert (=> mapIsEmpty!4782 mapRes!4782))

(declare-fun condMapEmpty!4782 () Bool)

(declare-fun mapDefault!4782 () ValueCell!1113)

(assert (=> mapNonEmpty!4779 (= condMapEmpty!4782 (= mapRest!4779 ((as const (Array (_ BitVec 32) ValueCell!1113)) mapDefault!4782)))))

(assert (=> mapNonEmpty!4779 (= tp!11457 (and e!90371 mapRes!4782))))

(assert (= (and mapNonEmpty!4779 condMapEmpty!4782) mapIsEmpty!4782))

(assert (= (and mapNonEmpty!4779 (not condMapEmpty!4782)) mapNonEmpty!4782))

(assert (= (and mapNonEmpty!4782 ((_ is ValueCellFull!1113) mapValue!4782)) b!138651))

(assert (= (and mapNonEmpty!4779 ((_ is ValueCellFull!1113) mapDefault!4782)) b!138652))

(declare-fun m!165575 () Bool)

(assert (=> mapNonEmpty!4782 m!165575))

(declare-fun b_lambda!6197 () Bool)

(assert (= b_lambda!6187 (or (and b!137999 b_free!2993) (and b!137992 b_free!2995 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))))) b_lambda!6197)))

(declare-fun b_lambda!6199 () Bool)

(assert (= b_lambda!6191 (or (and b!137999 b_free!2993 (= (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) (defaultEntry!2919 newMap!16))) (and b!137992 b_free!2995) b_lambda!6199)))

(declare-fun b_lambda!6201 () Bool)

(assert (= b_lambda!6189 (or (and b!137999 b_free!2993) (and b!137992 b_free!2995 (= (defaultEntry!2919 newMap!16) (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))))) b_lambda!6201)))

(declare-fun b_lambda!6203 () Bool)

(assert (= b_lambda!6195 (or (and b!137999 b_free!2993 (= (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) (defaultEntry!2919 newMap!16))) (and b!137992 b_free!2995) b_lambda!6203)))

(declare-fun b_lambda!6205 () Bool)

(assert (= b_lambda!6193 (or (and b!137999 b_free!2993 (= (defaultEntry!2919 (v!3255 (underlying!472 thiss!992))) (defaultEntry!2919 newMap!16))) (and b!137992 b_free!2995) b_lambda!6205)))

(check-sat (not d!43135) (not b!138394) (not bm!15283) (not b!138485) (not b!138580) (not b!138478) (not b!138363) (not b!138351) b_and!8631 (not b_lambda!6185) (not b!138501) (not b!138567) (not b!138477) (not b!138529) (not b_lambda!6199) (not d!43175) (not b_next!2993) (not d!43169) (not b!138499) (not b!138644) (not d!43147) (not b!138646) (not b!138614) (not b!138586) (not b_lambda!6181) (not b!138471) (not b!138568) (not d!43223) (not bm!15276) (not b!138497) (not b!138647) (not b!138579) (not d!43137) (not bm!15258) (not b!138583) (not b!138525) (not b!138641) (not b!138505) (not b!138489) (not d!43143) (not d!43133) (not b!138396) (not b!138609) (not b!138361) (not d!43115) (not d!43187) (not b!138585) (not b!138637) (not b!138607) (not bm!15282) (not d!43173) (not b!138629) (not bm!15265) (not d!43217) (not b!138522) (not mapNonEmpty!4782) (not b!138611) (not b!138369) (not b!138625) (not d!43231) (not b!138349) (not b!138642) (not b!138623) (not b!138523) (not d!43157) (not b!138502) (not b!138391) (not d!43127) (not d!43129) (not b!138480) (not bm!15269) (not bm!15264) (not b!138551) (not d!43191) (not d!43145) (not b!138479) (not bm!15285) (not b!138347) (not d!43181) (not b_lambda!6197) (not d!43179) (not d!43131) (not d!43235) (not b!138362) (not d!43195) (not b!138648) (not b!138553) (not d!43211) (not d!43155) (not b!138507) (not b!138348) (not b_lambda!6201) (not b!138357) (not d!43219) (not d!43141) (not b!138491) (not b_next!2995) (not b!138564) (not bm!15260) (not d!43151) (not bm!15266) tp_is_empty!2913 (not b!138581) (not b!138460) (not bm!15284) (not d!43167) (not b!138508) (not b!138365) (not d!43205) (not bm!15273) (not bm!15249) (not d!43199) (not d!43139) (not b_lambda!6203) (not b!138587) (not d!43215) (not b!138520) (not b!138631) (not b!138483) (not bm!15275) (not b!138590) (not b!138639) (not b!138368) (not b!138343) (not b!138466) (not d!43193) (not b!138310) b_and!8633 (not b!138548) (not bm!15278) (not bm!15263) (not d!43207) (not b!138467) (not b!138543) (not b_lambda!6205) (not d!43227) (not d!43161) (not b!138356) (not bm!15243) (not b!138550) (not d!43163) (not b!138341) (not d!43149) (not b!138481) (not b!138595) (not bm!15240) (not b!138588) (not bm!15261) (not b!138571) (not b!138612) (not b!138504) (not b!138359) (not b!138392) (not d!43121) (not b!138378) (not b!138577) (not d!43171) (not bm!15277) (not d!43159) (not d!43123) (not mapNonEmpty!4781) (not b!138599) (not b!138509) (not b!138379) (not bm!15248) (not d!43125) (not b!138344) (not b!138569) (not b!138350) (not b!138464) (not b!138366) (not d!43119) (not d!43213) (not bm!15272) (not b!138566) (not b!138593) (not b!138601) (not b!138617) (not b!138461) (not d!43225) (not b!138395))
(check-sat b_and!8631 b_and!8633 (not b_next!2993) (not b_next!2995))
