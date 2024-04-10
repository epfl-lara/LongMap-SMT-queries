; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77298 () Bool)

(assert start!77298)

(declare-fun b!901725 () Bool)

(declare-fun b_free!16083 () Bool)

(declare-fun b_next!16083 () Bool)

(assert (=> b!901725 (= b_free!16083 (not b_next!16083))))

(declare-fun tp!56352 () Bool)

(declare-fun b_and!26427 () Bool)

(assert (=> b!901725 (= tp!56352 b_and!26427)))

(declare-fun e!504869 () Bool)

(declare-datatypes ((array!52880 0))(
  ( (array!52881 (arr!25407 (Array (_ BitVec 32) (_ BitVec 64))) (size!25866 (_ BitVec 32))) )
))
(declare-datatypes ((V!29513 0))(
  ( (V!29514 (val!9256 Int)) )
))
(declare-datatypes ((ValueCell!8724 0))(
  ( (ValueCellFull!8724 (v!11757 V!29513)) (EmptyCell!8724) )
))
(declare-datatypes ((array!52882 0))(
  ( (array!52883 (arr!25408 (Array (_ BitVec 32) ValueCell!8724)) (size!25867 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4464 0))(
  ( (LongMapFixedSize!4465 (defaultEntry!5475 Int) (mask!26290 (_ BitVec 32)) (extraKeys!5205 (_ BitVec 32)) (zeroValue!5309 V!29513) (minValue!5309 V!29513) (_size!2287 (_ BitVec 32)) (_keys!10290 array!52880) (_values!5496 array!52882) (_vacant!2287 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4464)

(declare-datatypes ((SeekEntryResult!8953 0))(
  ( (MissingZero!8953 (index!38183 (_ BitVec 32))) (Found!8953 (index!38184 (_ BitVec 32))) (Intermediate!8953 (undefined!9765 Bool) (index!38185 (_ BitVec 32)) (x!76830 (_ BitVec 32))) (Undefined!8953) (MissingVacant!8953 (index!38186 (_ BitVec 32))) )
))
(declare-fun lt!407581 () SeekEntryResult!8953)

(declare-fun b!901712 () Bool)

(declare-fun call!40177 () V!29513)

(declare-fun get!13370 (ValueCell!8724 V!29513) V!29513)

(declare-fun dynLambda!1315 (Int (_ BitVec 64)) V!29513)

(assert (=> b!901712 (= e!504869 (= call!40177 (get!13370 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!901713 () Bool)

(declare-fun e!504859 () Bool)

(declare-fun e!504861 () Bool)

(assert (=> b!901713 (= e!504859 e!504861)))

(declare-fun res!608734 () Bool)

(assert (=> b!901713 (= res!608734 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901713 (=> (not res!608734) (not e!504861))))

(declare-fun b!901714 () Bool)

(declare-fun e!504865 () Bool)

(assert (=> b!901714 (= e!504865 (= call!40177 (minValue!5309 thiss!1181)))))

(declare-fun b!901715 () Bool)

(declare-fun e!504864 () Bool)

(declare-fun e!504871 () Bool)

(declare-fun mapRes!29305 () Bool)

(assert (=> b!901715 (= e!504864 (and e!504871 mapRes!29305))))

(declare-fun condMapEmpty!29305 () Bool)

(declare-fun mapDefault!29305 () ValueCell!8724)

(assert (=> b!901715 (= condMapEmpty!29305 (= (arr!25408 (_values!5496 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8724)) mapDefault!29305)))))

(declare-fun bm!40173 () Bool)

(declare-fun call!40176 () V!29513)

(assert (=> bm!40173 (= call!40177 call!40176)))

(declare-fun b!901716 () Bool)

(declare-fun e!504860 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901716 (= e!504860 (inRange!0 (index!38184 lt!407581) (mask!26290 thiss!1181)))))

(declare-fun b!901717 () Bool)

(declare-fun e!504868 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lt!407579 () V!29513)

(declare-datatypes ((Option!472 0))(
  ( (Some!471 (v!11758 V!29513)) (None!470) )
))
(declare-fun get!13371 (Option!472) V!29513)

(declare-datatypes ((tuple2!12076 0))(
  ( (tuple2!12077 (_1!6049 (_ BitVec 64)) (_2!6049 V!29513)) )
))
(declare-datatypes ((List!17877 0))(
  ( (Nil!17874) (Cons!17873 (h!19019 tuple2!12076) (t!25250 List!17877)) )
))
(declare-fun getValueByKey!466 (List!17877 (_ BitVec 64)) Option!472)

(declare-datatypes ((ListLongMap!10773 0))(
  ( (ListLongMap!10774 (toList!5402 List!17877)) )
))
(declare-fun map!12298 (LongMapFixedSize!4464) ListLongMap!10773)

(assert (=> b!901717 (= e!504868 (= lt!407579 (get!13371 (getValueByKey!466 (toList!5402 (map!12298 thiss!1181)) key!785))))))

(declare-fun b!901718 () Bool)

(declare-fun tp_is_empty!18411 () Bool)

(assert (=> b!901718 (= e!504871 tp_is_empty!18411)))

(declare-fun b!901719 () Bool)

(assert (=> b!901719 (= e!504859 e!504869)))

(declare-fun c!95531 () Bool)

(assert (=> b!901719 (= c!95531 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40174 () Bool)

(declare-fun lt!407583 () ListLongMap!10773)

(declare-fun apply!421 (ListLongMap!10773 (_ BitVec 64)) V!29513)

(assert (=> bm!40174 (= call!40176 (apply!421 lt!407583 key!785))))

(declare-fun b!901711 () Bool)

(declare-fun res!608732 () Bool)

(assert (=> b!901711 (=> (not res!608732) (not e!504865))))

(assert (=> b!901711 (= res!608732 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901711 (= e!504869 e!504865)))

(declare-fun res!608736 () Bool)

(declare-fun e!504867 () Bool)

(assert (=> start!77298 (=> (not res!608736) (not e!504867))))

(declare-fun valid!1714 (LongMapFixedSize!4464) Bool)

(assert (=> start!77298 (= res!608736 (valid!1714 thiss!1181))))

(assert (=> start!77298 e!504867))

(declare-fun e!504870 () Bool)

(assert (=> start!77298 e!504870))

(assert (=> start!77298 true))

(declare-fun b!901720 () Bool)

(declare-fun e!504862 () Bool)

(assert (=> b!901720 (= e!504862 tp_is_empty!18411)))

(declare-fun b!901721 () Bool)

(assert (=> b!901721 (= e!504868 (= lt!407579 (dynLambda!1315 (defaultEntry!5475 thiss!1181) key!785)))))

(declare-fun mapNonEmpty!29305 () Bool)

(declare-fun tp!56351 () Bool)

(assert (=> mapNonEmpty!29305 (= mapRes!29305 (and tp!56351 e!504862))))

(declare-fun mapKey!29305 () (_ BitVec 32))

(declare-fun mapRest!29305 () (Array (_ BitVec 32) ValueCell!8724))

(declare-fun mapValue!29305 () ValueCell!8724)

(assert (=> mapNonEmpty!29305 (= (arr!25408 (_values!5496 thiss!1181)) (store mapRest!29305 mapKey!29305 mapValue!29305))))

(declare-fun b!901722 () Bool)

(declare-fun e!504866 () Bool)

(assert (=> b!901722 (= e!504867 (not e!504866))))

(declare-fun res!608731 () Bool)

(assert (=> b!901722 (=> res!608731 e!504866)))

(get-info :version)

(assert (=> b!901722 (= res!608731 (not ((_ is Found!8953) lt!407581)))))

(assert (=> b!901722 e!504860))

(declare-fun res!608735 () Bool)

(assert (=> b!901722 (=> res!608735 e!504860)))

(assert (=> b!901722 (= res!608735 (not ((_ is Found!8953) lt!407581)))))

(declare-datatypes ((Unit!30622 0))(
  ( (Unit!30623) )
))
(declare-fun lt!407584 () Unit!30622)

(declare-fun lemmaSeekEntryGivesInRangeIndex!112 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 64)) Unit!30622)

(assert (=> b!901722 (= lt!407584 (lemmaSeekEntryGivesInRangeIndex!112 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52880 (_ BitVec 32)) SeekEntryResult!8953)

(assert (=> b!901722 (= lt!407581 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun b!901723 () Bool)

(assert (=> b!901723 (= e!504866 e!504868)))

(declare-fun c!95530 () Bool)

(declare-fun contains!4442 (LongMapFixedSize!4464 (_ BitVec 64)) Bool)

(assert (=> b!901723 (= c!95530 (contains!4442 thiss!1181 key!785))))

(assert (=> b!901723 (= lt!407579 (get!13370 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!901723 e!504859))

(declare-fun c!95529 () Bool)

(assert (=> b!901723 (= c!95529 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407582 () Unit!30622)

(declare-fun lemmaKeyInListMapThenSameValueInArray!13 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 64) (_ BitVec 32) Int) Unit!30622)

(assert (=> b!901723 (= lt!407582 (lemmaKeyInListMapThenSameValueInArray!13 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785 (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)))))

(declare-fun contains!4443 (ListLongMap!10773 (_ BitVec 64)) Bool)

(assert (=> b!901723 (contains!4443 lt!407583 (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581)))))

(declare-fun getCurrentListMap!2672 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 32) Int) ListLongMap!10773)

(assert (=> b!901723 (= lt!407583 (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun lt!407585 () Unit!30622)

(declare-fun lemmaValidKeyInArrayIsInListMap!261 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 32) Int) Unit!30622)

(assert (=> b!901723 (= lt!407585 (lemmaValidKeyInArrayIsInListMap!261 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901723 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407580 () Unit!30622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52880 (_ BitVec 64) (_ BitVec 32)) Unit!30622)

(assert (=> b!901723 (= lt!407580 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) key!785 (index!38184 lt!407581)))))

(declare-fun b!901724 () Bool)

(declare-fun res!608733 () Bool)

(assert (=> b!901724 (=> (not res!608733) (not e!504867))))

(assert (=> b!901724 (= res!608733 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29305 () Bool)

(assert (=> mapIsEmpty!29305 mapRes!29305))

(declare-fun array_inv!19924 (array!52880) Bool)

(declare-fun array_inv!19925 (array!52882) Bool)

(assert (=> b!901725 (= e!504870 (and tp!56352 tp_is_empty!18411 (array_inv!19924 (_keys!10290 thiss!1181)) (array_inv!19925 (_values!5496 thiss!1181)) e!504864))))

(declare-fun b!901726 () Bool)

(assert (=> b!901726 (= e!504861 (= call!40176 (zeroValue!5309 thiss!1181)))))

(assert (= (and start!77298 res!608736) b!901724))

(assert (= (and b!901724 res!608733) b!901722))

(assert (= (and b!901722 (not res!608735)) b!901716))

(assert (= (and b!901722 (not res!608731)) b!901723))

(assert (= (and b!901723 c!95529) b!901713))

(assert (= (and b!901723 (not c!95529)) b!901719))

(assert (= (and b!901713 res!608734) b!901726))

(assert (= (and b!901719 c!95531) b!901711))

(assert (= (and b!901719 (not c!95531)) b!901712))

(assert (= (and b!901711 res!608732) b!901714))

(assert (= (or b!901714 b!901712) bm!40173))

(assert (= (or b!901726 bm!40173) bm!40174))

(assert (= (and b!901723 c!95530) b!901717))

(assert (= (and b!901723 (not c!95530)) b!901721))

(assert (= (and b!901715 condMapEmpty!29305) mapIsEmpty!29305))

(assert (= (and b!901715 (not condMapEmpty!29305)) mapNonEmpty!29305))

(assert (= (and mapNonEmpty!29305 ((_ is ValueCellFull!8724) mapValue!29305)) b!901720))

(assert (= (and b!901715 ((_ is ValueCellFull!8724) mapDefault!29305)) b!901718))

(assert (= b!901725 b!901715))

(assert (= start!77298 b!901725))

(declare-fun b_lambda!13053 () Bool)

(assert (=> (not b_lambda!13053) (not b!901712)))

(declare-fun t!25247 () Bool)

(declare-fun tb!5221 () Bool)

(assert (=> (and b!901725 (= (defaultEntry!5475 thiss!1181) (defaultEntry!5475 thiss!1181)) t!25247) tb!5221))

(declare-fun result!10225 () Bool)

(assert (=> tb!5221 (= result!10225 tp_is_empty!18411)))

(assert (=> b!901712 t!25247))

(declare-fun b_and!26429 () Bool)

(assert (= b_and!26427 (and (=> t!25247 result!10225) b_and!26429)))

(declare-fun b_lambda!13055 () Bool)

(assert (=> (not b_lambda!13055) (not b!901721)))

(declare-fun t!25249 () Bool)

(declare-fun tb!5223 () Bool)

(assert (=> (and b!901725 (= (defaultEntry!5475 thiss!1181) (defaultEntry!5475 thiss!1181)) t!25249) tb!5223))

(declare-fun result!10229 () Bool)

(assert (=> tb!5223 (= result!10229 tp_is_empty!18411)))

(assert (=> b!901721 t!25249))

(declare-fun b_and!26431 () Bool)

(assert (= b_and!26429 (and (=> t!25249 result!10229) b_and!26431)))

(declare-fun b_lambda!13057 () Bool)

(assert (=> (not b_lambda!13057) (not b!901723)))

(assert (=> b!901723 t!25247))

(declare-fun b_and!26433 () Bool)

(assert (= b_and!26431 (and (=> t!25247 result!10225) b_and!26433)))

(declare-fun m!837915 () Bool)

(assert (=> b!901725 m!837915))

(declare-fun m!837917 () Bool)

(assert (=> b!901725 m!837917))

(declare-fun m!837919 () Bool)

(assert (=> bm!40174 m!837919))

(declare-fun m!837921 () Bool)

(assert (=> mapNonEmpty!29305 m!837921))

(declare-fun m!837923 () Bool)

(assert (=> b!901716 m!837923))

(declare-fun m!837925 () Bool)

(assert (=> b!901717 m!837925))

(declare-fun m!837927 () Bool)

(assert (=> b!901717 m!837927))

(assert (=> b!901717 m!837927))

(declare-fun m!837929 () Bool)

(assert (=> b!901717 m!837929))

(declare-fun m!837931 () Bool)

(assert (=> b!901722 m!837931))

(declare-fun m!837933 () Bool)

(assert (=> b!901722 m!837933))

(declare-fun m!837935 () Bool)

(assert (=> b!901723 m!837935))

(declare-fun m!837937 () Bool)

(assert (=> b!901723 m!837937))

(declare-fun m!837939 () Bool)

(assert (=> b!901723 m!837939))

(declare-fun m!837941 () Bool)

(assert (=> b!901723 m!837941))

(declare-fun m!837943 () Bool)

(assert (=> b!901723 m!837943))

(declare-fun m!837945 () Bool)

(assert (=> b!901723 m!837945))

(declare-fun m!837947 () Bool)

(assert (=> b!901723 m!837947))

(declare-fun m!837949 () Bool)

(assert (=> b!901723 m!837949))

(assert (=> b!901723 m!837939))

(assert (=> b!901723 m!837935))

(declare-fun m!837951 () Bool)

(assert (=> b!901723 m!837951))

(declare-fun m!837953 () Bool)

(assert (=> b!901723 m!837953))

(declare-fun m!837955 () Bool)

(assert (=> b!901723 m!837955))

(assert (=> b!901723 m!837953))

(declare-fun m!837957 () Bool)

(assert (=> start!77298 m!837957))

(declare-fun m!837959 () Bool)

(assert (=> b!901721 m!837959))

(assert (=> b!901712 m!837939))

(assert (=> b!901712 m!837935))

(assert (=> b!901712 m!837939))

(assert (=> b!901712 m!837935))

(assert (=> b!901712 m!837951))

(check-sat (not mapNonEmpty!29305) (not start!77298) tp_is_empty!18411 (not b!901712) (not b_next!16083) (not b!901717) (not b!901723) (not bm!40174) (not b_lambda!13053) (not b!901725) (not b!901722) (not b_lambda!13057) (not b!901716) (not b_lambda!13055) b_and!26433)
(check-sat b_and!26433 (not b_next!16083))
(get-model)

(declare-fun b_lambda!13065 () Bool)

(assert (= b_lambda!13053 (or (and b!901725 b_free!16083) b_lambda!13065)))

(declare-fun b_lambda!13067 () Bool)

(assert (= b_lambda!13057 (or (and b!901725 b_free!16083) b_lambda!13067)))

(declare-fun b_lambda!13069 () Bool)

(assert (= b_lambda!13055 (or (and b!901725 b_free!16083) b_lambda!13069)))

(check-sat (not mapNonEmpty!29305) (not start!77298) tp_is_empty!18411 (not b_lambda!13067) (not b!901712) (not b_lambda!13065) (not b!901716) (not b_lambda!13069) (not b_next!16083) b_and!26433 (not b!901717) (not b!901723) (not bm!40174) (not b!901725) (not b!901722))
(check-sat b_and!26433 (not b_next!16083))
(get-model)

(declare-fun d!111859 () Bool)

(assert (=> d!111859 (= (array_inv!19924 (_keys!10290 thiss!1181)) (bvsge (size!25866 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901725 d!111859))

(declare-fun d!111861 () Bool)

(assert (=> d!111861 (= (array_inv!19925 (_values!5496 thiss!1181)) (bvsge (size!25867 (_values!5496 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901725 d!111861))

(declare-fun d!111863 () Bool)

(assert (=> d!111863 (= (get!13371 (getValueByKey!466 (toList!5402 (map!12298 thiss!1181)) key!785)) (v!11758 (getValueByKey!466 (toList!5402 (map!12298 thiss!1181)) key!785)))))

(assert (=> b!901717 d!111863))

(declare-fun d!111865 () Bool)

(declare-fun c!95545 () Bool)

(assert (=> d!111865 (= c!95545 (and ((_ is Cons!17873) (toList!5402 (map!12298 thiss!1181))) (= (_1!6049 (h!19019 (toList!5402 (map!12298 thiss!1181)))) key!785)))))

(declare-fun e!504915 () Option!472)

(assert (=> d!111865 (= (getValueByKey!466 (toList!5402 (map!12298 thiss!1181)) key!785) e!504915)))

(declare-fun b!901790 () Bool)

(declare-fun e!504916 () Option!472)

(assert (=> b!901790 (= e!504916 None!470)))

(declare-fun b!901788 () Bool)

(assert (=> b!901788 (= e!504915 e!504916)))

(declare-fun c!95546 () Bool)

(assert (=> b!901788 (= c!95546 (and ((_ is Cons!17873) (toList!5402 (map!12298 thiss!1181))) (not (= (_1!6049 (h!19019 (toList!5402 (map!12298 thiss!1181)))) key!785))))))

(declare-fun b!901787 () Bool)

(assert (=> b!901787 (= e!504915 (Some!471 (_2!6049 (h!19019 (toList!5402 (map!12298 thiss!1181))))))))

(declare-fun b!901789 () Bool)

(assert (=> b!901789 (= e!504916 (getValueByKey!466 (t!25250 (toList!5402 (map!12298 thiss!1181))) key!785))))

(assert (= (and d!111865 c!95545) b!901787))

(assert (= (and d!111865 (not c!95545)) b!901788))

(assert (= (and b!901788 c!95546) b!901789))

(assert (= (and b!901788 (not c!95546)) b!901790))

(declare-fun m!838007 () Bool)

(assert (=> b!901789 m!838007))

(assert (=> b!901717 d!111865))

(declare-fun d!111867 () Bool)

(assert (=> d!111867 (= (map!12298 thiss!1181) (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun bs!25310 () Bool)

(assert (= bs!25310 d!111867))

(assert (=> bs!25310 m!837949))

(assert (=> b!901717 d!111867))

(declare-fun d!111869 () Bool)

(assert (=> d!111869 (= (inRange!0 (index!38184 lt!407581) (mask!26290 thiss!1181)) (and (bvsge (index!38184 lt!407581) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407581) (bvadd (mask!26290 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901716 d!111869))

(declare-fun d!111871 () Bool)

(declare-fun c!95549 () Bool)

(assert (=> d!111871 (= c!95549 ((_ is ValueCellFull!8724) (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581))))))

(declare-fun e!504919 () V!29513)

(assert (=> d!111871 (= (get!13370 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504919)))

(declare-fun b!901795 () Bool)

(declare-fun get!13373 (ValueCell!8724 V!29513) V!29513)

(assert (=> b!901795 (= e!504919 (get!13373 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901796 () Bool)

(declare-fun get!13374 (ValueCell!8724 V!29513) V!29513)

(assert (=> b!901796 (= e!504919 (get!13374 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111871 c!95549) b!901795))

(assert (= (and d!111871 (not c!95549)) b!901796))

(assert (=> b!901795 m!837939))

(assert (=> b!901795 m!837935))

(declare-fun m!838009 () Bool)

(assert (=> b!901795 m!838009))

(assert (=> b!901796 m!837939))

(assert (=> b!901796 m!837935))

(declare-fun m!838011 () Bool)

(assert (=> b!901796 m!838011))

(assert (=> b!901712 d!111871))

(declare-fun d!111873 () Bool)

(declare-fun res!608761 () Bool)

(declare-fun e!504922 () Bool)

(assert (=> d!111873 (=> (not res!608761) (not e!504922))))

(declare-fun simpleValid!334 (LongMapFixedSize!4464) Bool)

(assert (=> d!111873 (= res!608761 (simpleValid!334 thiss!1181))))

(assert (=> d!111873 (= (valid!1714 thiss!1181) e!504922)))

(declare-fun b!901803 () Bool)

(declare-fun res!608762 () Bool)

(assert (=> b!901803 (=> (not res!608762) (not e!504922))))

(declare-fun arrayCountValidKeys!0 (array!52880 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901803 (= res!608762 (= (arrayCountValidKeys!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))) (_size!2287 thiss!1181)))))

(declare-fun b!901804 () Bool)

(declare-fun res!608763 () Bool)

(assert (=> b!901804 (=> (not res!608763) (not e!504922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52880 (_ BitVec 32)) Bool)

(assert (=> b!901804 (= res!608763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun b!901805 () Bool)

(declare-datatypes ((List!17879 0))(
  ( (Nil!17876) (Cons!17875 (h!19021 (_ BitVec 64)) (t!25256 List!17879)) )
))
(declare-fun arrayNoDuplicates!0 (array!52880 (_ BitVec 32) List!17879) Bool)

(assert (=> b!901805 (= e!504922 (arrayNoDuplicates!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 Nil!17876))))

(assert (= (and d!111873 res!608761) b!901803))

(assert (= (and b!901803 res!608762) b!901804))

(assert (= (and b!901804 res!608763) b!901805))

(declare-fun m!838013 () Bool)

(assert (=> d!111873 m!838013))

(declare-fun m!838015 () Bool)

(assert (=> b!901803 m!838015))

(declare-fun m!838017 () Bool)

(assert (=> b!901804 m!838017))

(declare-fun m!838019 () Bool)

(assert (=> b!901805 m!838019))

(assert (=> start!77298 d!111873))

(declare-fun d!111875 () Bool)

(assert (=> d!111875 (= (apply!421 lt!407583 key!785) (get!13371 (getValueByKey!466 (toList!5402 lt!407583) key!785)))))

(declare-fun bs!25311 () Bool)

(assert (= bs!25311 d!111875))

(declare-fun m!838021 () Bool)

(assert (=> bs!25311 m!838021))

(assert (=> bs!25311 m!838021))

(declare-fun m!838023 () Bool)

(assert (=> bs!25311 m!838023))

(assert (=> bm!40174 d!111875))

(declare-fun d!111877 () Bool)

(assert (=> d!111877 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407609 () Unit!30622)

(declare-fun choose!13 (array!52880 (_ BitVec 64) (_ BitVec 32)) Unit!30622)

(assert (=> d!111877 (= lt!407609 (choose!13 (_keys!10290 thiss!1181) key!785 (index!38184 lt!407581)))))

(assert (=> d!111877 (bvsge (index!38184 lt!407581) #b00000000000000000000000000000000)))

(assert (=> d!111877 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) key!785 (index!38184 lt!407581)) lt!407609)))

(declare-fun bs!25312 () Bool)

(assert (= bs!25312 d!111877))

(assert (=> bs!25312 m!837943))

(declare-fun m!838025 () Bool)

(assert (=> bs!25312 m!838025))

(assert (=> b!901723 d!111877))

(declare-fun d!111879 () Bool)

(declare-fun e!504925 () Bool)

(assert (=> d!111879 e!504925))

(declare-fun res!608766 () Bool)

(assert (=> d!111879 (=> (not res!608766) (not e!504925))))

(assert (=> d!111879 (= res!608766 (and (bvsge (index!38184 lt!407581) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407581) (size!25866 (_keys!10290 thiss!1181)))))))

(declare-fun lt!407612 () Unit!30622)

(declare-fun choose!1523 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 32) Int) Unit!30622)

(assert (=> d!111879 (= lt!407612 (choose!1523 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111879 (validMask!0 (mask!26290 thiss!1181))))

(assert (=> d!111879 (= (lemmaValidKeyInArrayIsInListMap!261 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)) lt!407612)))

(declare-fun b!901808 () Bool)

(assert (=> b!901808 (= e!504925 (contains!4443 (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)) (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581))))))

(assert (= (and d!111879 res!608766) b!901808))

(declare-fun m!838027 () Bool)

(assert (=> d!111879 m!838027))

(declare-fun m!838029 () Bool)

(assert (=> d!111879 m!838029))

(assert (=> b!901808 m!837949))

(assert (=> b!901808 m!837953))

(assert (=> b!901808 m!837949))

(assert (=> b!901808 m!837953))

(declare-fun m!838031 () Bool)

(assert (=> b!901808 m!838031))

(assert (=> b!901723 d!111879))

(declare-fun bm!40195 () Bool)

(declare-fun call!40200 () ListLongMap!10773)

(declare-fun call!40204 () ListLongMap!10773)

(assert (=> bm!40195 (= call!40200 call!40204)))

(declare-fun b!901851 () Bool)

(declare-fun e!504962 () ListLongMap!10773)

(declare-fun call!40199 () ListLongMap!10773)

(assert (=> b!901851 (= e!504962 call!40199)))

(declare-fun bm!40196 () Bool)

(declare-fun call!40202 () ListLongMap!10773)

(assert (=> bm!40196 (= call!40204 call!40202)))

(declare-fun b!901852 () Bool)

(declare-fun e!504961 () Bool)

(declare-fun lt!407661 () ListLongMap!10773)

(assert (=> b!901852 (= e!504961 (= (apply!421 lt!407661 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)) (get!13370 (select (arr!25408 (_values!5496 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901852 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25867 (_values!5496 thiss!1181))))))

(assert (=> b!901852 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))))))

(declare-fun bm!40197 () Bool)

(declare-fun c!95565 () Bool)

(declare-fun call!40201 () ListLongMap!10773)

(declare-fun c!95567 () Bool)

(declare-fun +!2601 (ListLongMap!10773 tuple2!12076) ListLongMap!10773)

(assert (=> bm!40197 (= call!40201 (+!2601 (ite c!95567 call!40202 (ite c!95565 call!40204 call!40200)) (ite (or c!95567 c!95565) (tuple2!12077 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5309 thiss!1181)) (tuple2!12077 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5309 thiss!1181)))))))

(declare-fun b!901853 () Bool)

(declare-fun res!608793 () Bool)

(declare-fun e!504955 () Bool)

(assert (=> b!901853 (=> (not res!608793) (not e!504955))))

(declare-fun e!504957 () Bool)

(assert (=> b!901853 (= res!608793 e!504957)))

(declare-fun c!95566 () Bool)

(assert (=> b!901853 (= c!95566 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901854 () Bool)

(declare-fun e!504960 () Bool)

(assert (=> b!901854 (= e!504960 (= (apply!421 lt!407661 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5309 thiss!1181)))))

(declare-fun b!901855 () Bool)

(declare-fun e!504959 () Unit!30622)

(declare-fun Unit!30626 () Unit!30622)

(assert (=> b!901855 (= e!504959 Unit!30626)))

(declare-fun b!901856 () Bool)

(declare-fun call!40203 () Bool)

(assert (=> b!901856 (= e!504957 (not call!40203))))

(declare-fun b!901857 () Bool)

(assert (=> b!901857 (= e!504957 e!504960)))

(declare-fun res!608788 () Bool)

(assert (=> b!901857 (= res!608788 call!40203)))

(assert (=> b!901857 (=> (not res!608788) (not e!504960))))

(declare-fun b!901858 () Bool)

(declare-fun e!504964 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901858 (= e!504964 (validKeyInArray!0 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40198 () Bool)

(declare-fun call!40198 () Bool)

(assert (=> bm!40198 (= call!40198 (contains!4443 lt!407661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901859 () Bool)

(declare-fun res!608790 () Bool)

(assert (=> b!901859 (=> (not res!608790) (not e!504955))))

(declare-fun e!504952 () Bool)

(assert (=> b!901859 (= res!608790 e!504952)))

(declare-fun res!608785 () Bool)

(assert (=> b!901859 (=> res!608785 e!504952)))

(declare-fun e!504954 () Bool)

(assert (=> b!901859 (= res!608785 (not e!504954))))

(declare-fun res!608792 () Bool)

(assert (=> b!901859 (=> (not res!608792) (not e!504954))))

(assert (=> b!901859 (= res!608792 (bvslt #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))))))

(declare-fun b!901860 () Bool)

(assert (=> b!901860 (= e!504954 (validKeyInArray!0 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901861 () Bool)

(declare-fun e!504956 () ListLongMap!10773)

(assert (=> b!901861 (= e!504956 e!504962)))

(assert (=> b!901861 (= c!95565 (and (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901862 () Bool)

(assert (=> b!901862 (= e!504956 (+!2601 call!40201 (tuple2!12077 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5309 thiss!1181))))))

(declare-fun b!901863 () Bool)

(declare-fun lt!407668 () Unit!30622)

(assert (=> b!901863 (= e!504959 lt!407668)))

(declare-fun lt!407673 () ListLongMap!10773)

(declare-fun getCurrentListMapNoExtraKeys!3288 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 32) Int) ListLongMap!10773)

(assert (=> b!901863 (= lt!407673 (getCurrentListMapNoExtraKeys!3288 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun lt!407672 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407660 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407660 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407662 () Unit!30622)

(declare-fun addStillContains!342 (ListLongMap!10773 (_ BitVec 64) V!29513 (_ BitVec 64)) Unit!30622)

(assert (=> b!901863 (= lt!407662 (addStillContains!342 lt!407673 lt!407672 (zeroValue!5309 thiss!1181) lt!407660))))

(assert (=> b!901863 (contains!4443 (+!2601 lt!407673 (tuple2!12077 lt!407672 (zeroValue!5309 thiss!1181))) lt!407660)))

(declare-fun lt!407659 () Unit!30622)

(assert (=> b!901863 (= lt!407659 lt!407662)))

(declare-fun lt!407676 () ListLongMap!10773)

(assert (=> b!901863 (= lt!407676 (getCurrentListMapNoExtraKeys!3288 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun lt!407671 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407670 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407670 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407666 () Unit!30622)

(declare-fun addApplyDifferent!342 (ListLongMap!10773 (_ BitVec 64) V!29513 (_ BitVec 64)) Unit!30622)

(assert (=> b!901863 (= lt!407666 (addApplyDifferent!342 lt!407676 lt!407671 (minValue!5309 thiss!1181) lt!407670))))

(assert (=> b!901863 (= (apply!421 (+!2601 lt!407676 (tuple2!12077 lt!407671 (minValue!5309 thiss!1181))) lt!407670) (apply!421 lt!407676 lt!407670))))

(declare-fun lt!407678 () Unit!30622)

(assert (=> b!901863 (= lt!407678 lt!407666)))

(declare-fun lt!407663 () ListLongMap!10773)

(assert (=> b!901863 (= lt!407663 (getCurrentListMapNoExtraKeys!3288 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun lt!407665 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407664 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407664 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407677 () Unit!30622)

(assert (=> b!901863 (= lt!407677 (addApplyDifferent!342 lt!407663 lt!407665 (zeroValue!5309 thiss!1181) lt!407664))))

(assert (=> b!901863 (= (apply!421 (+!2601 lt!407663 (tuple2!12077 lt!407665 (zeroValue!5309 thiss!1181))) lt!407664) (apply!421 lt!407663 lt!407664))))

(declare-fun lt!407657 () Unit!30622)

(assert (=> b!901863 (= lt!407657 lt!407677)))

(declare-fun lt!407658 () ListLongMap!10773)

(assert (=> b!901863 (= lt!407658 (getCurrentListMapNoExtraKeys!3288 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun lt!407667 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407674 () (_ BitVec 64))

(assert (=> b!901863 (= lt!407674 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901863 (= lt!407668 (addApplyDifferent!342 lt!407658 lt!407667 (minValue!5309 thiss!1181) lt!407674))))

(assert (=> b!901863 (= (apply!421 (+!2601 lt!407658 (tuple2!12077 lt!407667 (minValue!5309 thiss!1181))) lt!407674) (apply!421 lt!407658 lt!407674))))

(declare-fun b!901864 () Bool)

(declare-fun e!504953 () Bool)

(assert (=> b!901864 (= e!504955 e!504953)))

(declare-fun c!95562 () Bool)

(assert (=> b!901864 (= c!95562 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901865 () Bool)

(declare-fun e!504958 () ListLongMap!10773)

(assert (=> b!901865 (= e!504958 call!40200)))

(declare-fun b!901866 () Bool)

(declare-fun e!504963 () Bool)

(assert (=> b!901866 (= e!504963 (= (apply!421 lt!407661 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5309 thiss!1181)))))

(declare-fun d!111881 () Bool)

(assert (=> d!111881 e!504955))

(declare-fun res!608791 () Bool)

(assert (=> d!111881 (=> (not res!608791) (not e!504955))))

(assert (=> d!111881 (= res!608791 (or (bvsge #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))))))))

(declare-fun lt!407669 () ListLongMap!10773)

(assert (=> d!111881 (= lt!407661 lt!407669)))

(declare-fun lt!407675 () Unit!30622)

(assert (=> d!111881 (= lt!407675 e!504959)))

(declare-fun c!95563 () Bool)

(assert (=> d!111881 (= c!95563 e!504964)))

(declare-fun res!608789 () Bool)

(assert (=> d!111881 (=> (not res!608789) (not e!504964))))

(assert (=> d!111881 (= res!608789 (bvslt #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))))))

(assert (=> d!111881 (= lt!407669 e!504956)))

(assert (=> d!111881 (= c!95567 (and (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111881 (validMask!0 (mask!26290 thiss!1181))))

(assert (=> d!111881 (= (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)) lt!407661)))

(declare-fun b!901867 () Bool)

(declare-fun c!95564 () Bool)

(assert (=> b!901867 (= c!95564 (and (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901867 (= e!504962 e!504958)))

(declare-fun bm!40199 () Bool)

(assert (=> bm!40199 (= call!40203 (contains!4443 lt!407661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901868 () Bool)

(assert (=> b!901868 (= e!504952 e!504961)))

(declare-fun res!608787 () Bool)

(assert (=> b!901868 (=> (not res!608787) (not e!504961))))

(assert (=> b!901868 (= res!608787 (contains!4443 lt!407661 (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25866 (_keys!10290 thiss!1181))))))

(declare-fun bm!40200 () Bool)

(assert (=> bm!40200 (= call!40202 (getCurrentListMapNoExtraKeys!3288 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun b!901869 () Bool)

(assert (=> b!901869 (= e!504953 (not call!40198))))

(declare-fun bm!40201 () Bool)

(assert (=> bm!40201 (= call!40199 call!40201)))

(declare-fun b!901870 () Bool)

(assert (=> b!901870 (= e!504953 e!504963)))

(declare-fun res!608786 () Bool)

(assert (=> b!901870 (= res!608786 call!40198)))

(assert (=> b!901870 (=> (not res!608786) (not e!504963))))

(declare-fun b!901871 () Bool)

(assert (=> b!901871 (= e!504958 call!40199)))

(assert (= (and d!111881 c!95567) b!901862))

(assert (= (and d!111881 (not c!95567)) b!901861))

(assert (= (and b!901861 c!95565) b!901851))

(assert (= (and b!901861 (not c!95565)) b!901867))

(assert (= (and b!901867 c!95564) b!901871))

(assert (= (and b!901867 (not c!95564)) b!901865))

(assert (= (or b!901871 b!901865) bm!40195))

(assert (= (or b!901851 bm!40195) bm!40196))

(assert (= (or b!901851 b!901871) bm!40201))

(assert (= (or b!901862 bm!40196) bm!40200))

(assert (= (or b!901862 bm!40201) bm!40197))

(assert (= (and d!111881 res!608789) b!901858))

(assert (= (and d!111881 c!95563) b!901863))

(assert (= (and d!111881 (not c!95563)) b!901855))

(assert (= (and d!111881 res!608791) b!901859))

(assert (= (and b!901859 res!608792) b!901860))

(assert (= (and b!901859 (not res!608785)) b!901868))

(assert (= (and b!901868 res!608787) b!901852))

(assert (= (and b!901859 res!608790) b!901853))

(assert (= (and b!901853 c!95566) b!901857))

(assert (= (and b!901853 (not c!95566)) b!901856))

(assert (= (and b!901857 res!608788) b!901854))

(assert (= (or b!901857 b!901856) bm!40199))

(assert (= (and b!901853 res!608793) b!901864))

(assert (= (and b!901864 c!95562) b!901870))

(assert (= (and b!901864 (not c!95562)) b!901869))

(assert (= (and b!901870 res!608786) b!901866))

(assert (= (or b!901870 b!901869) bm!40198))

(declare-fun b_lambda!13071 () Bool)

(assert (=> (not b_lambda!13071) (not b!901852)))

(assert (=> b!901852 t!25247))

(declare-fun b_and!26443 () Bool)

(assert (= b_and!26433 (and (=> t!25247 result!10225) b_and!26443)))

(declare-fun m!838033 () Bool)

(assert (=> bm!40200 m!838033))

(declare-fun m!838035 () Bool)

(assert (=> b!901854 m!838035))

(declare-fun m!838037 () Bool)

(assert (=> b!901868 m!838037))

(assert (=> b!901868 m!838037))

(declare-fun m!838039 () Bool)

(assert (=> b!901868 m!838039))

(assert (=> d!111881 m!838029))

(declare-fun m!838041 () Bool)

(assert (=> bm!40199 m!838041))

(declare-fun m!838043 () Bool)

(assert (=> bm!40198 m!838043))

(declare-fun m!838045 () Bool)

(assert (=> b!901852 m!838045))

(assert (=> b!901852 m!837935))

(declare-fun m!838047 () Bool)

(assert (=> b!901852 m!838047))

(assert (=> b!901852 m!838037))

(declare-fun m!838049 () Bool)

(assert (=> b!901852 m!838049))

(assert (=> b!901852 m!838045))

(assert (=> b!901852 m!837935))

(assert (=> b!901852 m!838037))

(declare-fun m!838051 () Bool)

(assert (=> bm!40197 m!838051))

(declare-fun m!838053 () Bool)

(assert (=> b!901866 m!838053))

(declare-fun m!838055 () Bool)

(assert (=> b!901862 m!838055))

(assert (=> b!901860 m!838037))

(assert (=> b!901860 m!838037))

(declare-fun m!838057 () Bool)

(assert (=> b!901860 m!838057))

(assert (=> b!901858 m!838037))

(assert (=> b!901858 m!838037))

(assert (=> b!901858 m!838057))

(declare-fun m!838059 () Bool)

(assert (=> b!901863 m!838059))

(declare-fun m!838061 () Bool)

(assert (=> b!901863 m!838061))

(declare-fun m!838063 () Bool)

(assert (=> b!901863 m!838063))

(declare-fun m!838065 () Bool)

(assert (=> b!901863 m!838065))

(declare-fun m!838067 () Bool)

(assert (=> b!901863 m!838067))

(declare-fun m!838069 () Bool)

(assert (=> b!901863 m!838069))

(assert (=> b!901863 m!838059))

(declare-fun m!838071 () Bool)

(assert (=> b!901863 m!838071))

(declare-fun m!838073 () Bool)

(assert (=> b!901863 m!838073))

(declare-fun m!838075 () Bool)

(assert (=> b!901863 m!838075))

(assert (=> b!901863 m!838069))

(declare-fun m!838077 () Bool)

(assert (=> b!901863 m!838077))

(declare-fun m!838079 () Bool)

(assert (=> b!901863 m!838079))

(assert (=> b!901863 m!838037))

(declare-fun m!838081 () Bool)

(assert (=> b!901863 m!838081))

(declare-fun m!838083 () Bool)

(assert (=> b!901863 m!838083))

(declare-fun m!838085 () Bool)

(assert (=> b!901863 m!838085))

(assert (=> b!901863 m!838079))

(declare-fun m!838087 () Bool)

(assert (=> b!901863 m!838087))

(assert (=> b!901863 m!838065))

(assert (=> b!901863 m!838033))

(assert (=> b!901723 d!111881))

(declare-fun b!901892 () Bool)

(assert (=> b!901892 false))

(declare-fun lt!407709 () Unit!30622)

(declare-fun lt!407723 () Unit!30622)

(assert (=> b!901892 (= lt!407709 lt!407723)))

(declare-fun lt!407718 () SeekEntryResult!8953)

(declare-fun lt!407721 () (_ BitVec 32))

(assert (=> b!901892 (and ((_ is Found!8953) lt!407718) (= (index!38184 lt!407718) lt!407721))))

(assert (=> b!901892 (= lt!407718 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52880 (_ BitVec 32)) Unit!30622)

(assert (=> b!901892 (= lt!407723 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!407721 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun lt!407713 () Unit!30622)

(declare-fun lt!407716 () Unit!30622)

(assert (=> b!901892 (= lt!407713 lt!407716)))

(assert (=> b!901892 (arrayForallSeekEntryOrOpenFound!0 lt!407721 (_keys!10290 thiss!1181) (mask!26290 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30622)

(assert (=> b!901892 (= lt!407716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10290 thiss!1181) (mask!26290 thiss!1181) #b00000000000000000000000000000000 lt!407721))))

(declare-fun arrayScanForKey!0 (array!52880 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901892 (= lt!407721 (arrayScanForKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!407714 () Unit!30622)

(declare-fun lt!407717 () Unit!30622)

(assert (=> b!901892 (= lt!407714 lt!407717)))

(declare-fun e!504977 () Bool)

(assert (=> b!901892 e!504977))

(declare-fun c!95582 () Bool)

(assert (=> b!901892 (= c!95582 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!165 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 64) Int) Unit!30622)

(assert (=> b!901892 (= lt!407717 (lemmaKeyInListMapIsInArray!165 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785 (defaultEntry!5475 thiss!1181)))))

(declare-fun e!504976 () Unit!30622)

(declare-fun Unit!30627 () Unit!30622)

(assert (=> b!901892 (= e!504976 Unit!30627)))

(declare-fun b!901893 () Bool)

(declare-fun Unit!30628 () Unit!30622)

(assert (=> b!901893 (= e!504976 Unit!30628)))

(declare-fun b!901894 () Bool)

(declare-fun e!504978 () Bool)

(assert (=> b!901894 (= e!504978 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901895 () Bool)

(assert (=> b!901895 (= e!504977 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!40208 () Bool)

(declare-fun call!40212 () Bool)

(assert (=> bm!40208 (= call!40212 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!901896 () Bool)

(declare-fun e!504975 () Bool)

(assert (=> b!901896 (= e!504975 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!111883 () Bool)

(declare-fun lt!407715 () Bool)

(assert (=> d!111883 (= lt!407715 (contains!4443 (map!12298 thiss!1181) key!785))))

(assert (=> d!111883 (= lt!407715 e!504975)))

(declare-fun c!95581 () Bool)

(assert (=> d!111883 (= c!95581 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111883 (valid!1714 thiss!1181)))

(assert (=> d!111883 (= (contains!4442 thiss!1181 key!785) lt!407715)))

(declare-fun bm!40209 () Bool)

(declare-fun call!40211 () ListLongMap!10773)

(assert (=> bm!40209 (= call!40211 (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun b!901897 () Bool)

(declare-fun e!504979 () Bool)

(assert (=> b!901897 (= e!504979 true)))

(declare-fun lt!407712 () Unit!30622)

(declare-fun lt!407722 () SeekEntryResult!8953)

(assert (=> b!901897 (= lt!407712 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) key!785 (index!38184 lt!407722)))))

(assert (=> b!901897 call!40212))

(declare-fun lt!407710 () Unit!30622)

(assert (=> b!901897 (= lt!407710 lt!407712)))

(declare-fun lt!407720 () Unit!30622)

(assert (=> b!901897 (= lt!407720 (lemmaValidKeyInArrayIsInListMap!261 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) (index!38184 lt!407722) (defaultEntry!5475 thiss!1181)))))

(declare-fun call!40213 () Bool)

(assert (=> b!901897 call!40213))

(declare-fun lt!407711 () Unit!30622)

(assert (=> b!901897 (= lt!407711 lt!407720)))

(declare-fun b!901898 () Bool)

(assert (=> b!901898 (= e!504975 e!504978)))

(declare-fun c!95578 () Bool)

(assert (=> b!901898 (= c!95578 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901899 () Bool)

(assert (=> b!901899 (= e!504979 false)))

(declare-fun c!95579 () Bool)

(assert (=> b!901899 (= c!95579 call!40213)))

(declare-fun lt!407719 () Unit!30622)

(assert (=> b!901899 (= lt!407719 e!504976)))

(declare-fun b!901900 () Bool)

(declare-fun c!95580 () Bool)

(assert (=> b!901900 (= c!95580 ((_ is Found!8953) lt!407722))))

(assert (=> b!901900 (= lt!407722 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(assert (=> b!901900 (= e!504978 e!504979)))

(declare-fun bm!40210 () Bool)

(assert (=> bm!40210 (= call!40213 (contains!4443 call!40211 (ite c!95580 (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407722)) key!785)))))

(declare-fun b!901901 () Bool)

(assert (=> b!901901 (= e!504977 call!40212)))

(assert (= (and d!111883 c!95581) b!901896))

(assert (= (and d!111883 (not c!95581)) b!901898))

(assert (= (and b!901898 c!95578) b!901894))

(assert (= (and b!901898 (not c!95578)) b!901900))

(assert (= (and b!901900 c!95580) b!901897))

(assert (= (and b!901900 (not c!95580)) b!901899))

(assert (= (and b!901899 c!95579) b!901892))

(assert (= (and b!901899 (not c!95579)) b!901893))

(assert (= (and b!901892 c!95582) b!901901))

(assert (= (and b!901892 (not c!95582)) b!901895))

(assert (= (or b!901897 b!901901) bm!40208))

(assert (= (or b!901897 b!901899) bm!40209))

(assert (= (or b!901897 b!901899) bm!40210))

(assert (=> b!901900 m!837933))

(declare-fun m!838089 () Bool)

(assert (=> bm!40210 m!838089))

(declare-fun m!838091 () Bool)

(assert (=> bm!40210 m!838091))

(assert (=> d!111883 m!837925))

(assert (=> d!111883 m!837925))

(declare-fun m!838093 () Bool)

(assert (=> d!111883 m!838093))

(assert (=> d!111883 m!837957))

(assert (=> bm!40209 m!837949))

(declare-fun m!838095 () Bool)

(assert (=> b!901897 m!838095))

(declare-fun m!838097 () Bool)

(assert (=> b!901897 m!838097))

(declare-fun m!838099 () Bool)

(assert (=> b!901892 m!838099))

(assert (=> b!901892 m!837933))

(declare-fun m!838101 () Bool)

(assert (=> b!901892 m!838101))

(declare-fun m!838103 () Bool)

(assert (=> b!901892 m!838103))

(declare-fun m!838105 () Bool)

(assert (=> b!901892 m!838105))

(declare-fun m!838107 () Bool)

(assert (=> b!901892 m!838107))

(assert (=> bm!40208 m!837943))

(assert (=> b!901723 d!111883))

(declare-fun d!111885 () Bool)

(declare-fun res!608798 () Bool)

(declare-fun e!504984 () Bool)

(assert (=> d!111885 (=> res!608798 e!504984)))

(assert (=> d!111885 (= res!608798 (= (select (arr!25407 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111885 (= (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000) e!504984)))

(declare-fun b!901906 () Bool)

(declare-fun e!504985 () Bool)

(assert (=> b!901906 (= e!504984 e!504985)))

(declare-fun res!608799 () Bool)

(assert (=> b!901906 (=> (not res!608799) (not e!504985))))

(assert (=> b!901906 (= res!608799 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25866 (_keys!10290 thiss!1181))))))

(declare-fun b!901907 () Bool)

(assert (=> b!901907 (= e!504985 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111885 (not res!608798)) b!901906))

(assert (= (and b!901906 res!608799) b!901907))

(assert (=> d!111885 m!838037))

(declare-fun m!838109 () Bool)

(assert (=> b!901907 m!838109))

(assert (=> b!901723 d!111885))

(declare-fun d!111887 () Bool)

(declare-fun e!504991 () Bool)

(assert (=> d!111887 e!504991))

(declare-fun res!608802 () Bool)

(assert (=> d!111887 (=> res!608802 e!504991)))

(declare-fun lt!407733 () Bool)

(assert (=> d!111887 (= res!608802 (not lt!407733))))

(declare-fun lt!407734 () Bool)

(assert (=> d!111887 (= lt!407733 lt!407734)))

(declare-fun lt!407735 () Unit!30622)

(declare-fun e!504990 () Unit!30622)

(assert (=> d!111887 (= lt!407735 e!504990)))

(declare-fun c!95585 () Bool)

(assert (=> d!111887 (= c!95585 lt!407734)))

(declare-fun containsKey!435 (List!17877 (_ BitVec 64)) Bool)

(assert (=> d!111887 (= lt!407734 (containsKey!435 (toList!5402 lt!407583) (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581))))))

(assert (=> d!111887 (= (contains!4443 lt!407583 (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581))) lt!407733)))

(declare-fun b!901914 () Bool)

(declare-fun lt!407732 () Unit!30622)

(assert (=> b!901914 (= e!504990 lt!407732)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!331 (List!17877 (_ BitVec 64)) Unit!30622)

(assert (=> b!901914 (= lt!407732 (lemmaContainsKeyImpliesGetValueByKeyDefined!331 (toList!5402 lt!407583) (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581))))))

(declare-fun isDefined!340 (Option!472) Bool)

(assert (=> b!901914 (isDefined!340 (getValueByKey!466 (toList!5402 lt!407583) (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581))))))

(declare-fun b!901915 () Bool)

(declare-fun Unit!30629 () Unit!30622)

(assert (=> b!901915 (= e!504990 Unit!30629)))

(declare-fun b!901916 () Bool)

(assert (=> b!901916 (= e!504991 (isDefined!340 (getValueByKey!466 (toList!5402 lt!407583) (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407581)))))))

(assert (= (and d!111887 c!95585) b!901914))

(assert (= (and d!111887 (not c!95585)) b!901915))

(assert (= (and d!111887 (not res!608802)) b!901916))

(assert (=> d!111887 m!837953))

(declare-fun m!838111 () Bool)

(assert (=> d!111887 m!838111))

(assert (=> b!901914 m!837953))

(declare-fun m!838113 () Bool)

(assert (=> b!901914 m!838113))

(assert (=> b!901914 m!837953))

(declare-fun m!838115 () Bool)

(assert (=> b!901914 m!838115))

(assert (=> b!901914 m!838115))

(declare-fun m!838117 () Bool)

(assert (=> b!901914 m!838117))

(assert (=> b!901916 m!837953))

(assert (=> b!901916 m!838115))

(assert (=> b!901916 m!838115))

(assert (=> b!901916 m!838117))

(assert (=> b!901723 d!111887))

(assert (=> b!901723 d!111871))

(declare-fun bm!40219 () Bool)

(declare-fun call!40224 () ListLongMap!10773)

(declare-fun call!40223 () ListLongMap!10773)

(assert (=> bm!40219 (= call!40224 call!40223)))

(declare-fun call!40225 () V!29513)

(declare-fun bm!40220 () Bool)

(declare-fun c!95591 () Bool)

(assert (=> bm!40220 (= call!40225 (apply!421 (ite c!95591 call!40223 call!40224) key!785))))

(declare-fun b!901931 () Bool)

(declare-fun e!505002 () Bool)

(assert (=> b!901931 (= e!505002 (= call!40225 (zeroValue!5309 thiss!1181)))))

(declare-fun bm!40221 () Bool)

(assert (=> bm!40221 (= call!40223 (getCurrentListMap!2672 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5475 thiss!1181)))))

(declare-fun d!111889 () Bool)

(declare-fun e!505005 () Bool)

(assert (=> d!111889 e!505005))

(assert (=> d!111889 (= c!95591 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407738 () Unit!30622)

(declare-fun choose!1524 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 64) (_ BitVec 32) Int) Unit!30622)

(assert (=> d!111889 (= lt!407738 (choose!1524 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785 (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)))))

(assert (=> d!111889 (validMask!0 (mask!26290 thiss!1181))))

(assert (=> d!111889 (= (lemmaKeyInListMapThenSameValueInArray!13 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785 (index!38184 lt!407581) (defaultEntry!5475 thiss!1181)) lt!407738)))

(declare-fun b!901932 () Bool)

(declare-fun res!608809 () Bool)

(declare-fun e!505003 () Bool)

(assert (=> b!901932 (=> (not res!608809) (not e!505003))))

(assert (=> b!901932 (= res!608809 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!505004 () Bool)

(assert (=> b!901932 (= e!505004 e!505003)))

(declare-fun b!901933 () Bool)

(declare-fun call!40222 () V!29513)

(assert (=> b!901933 (= e!505003 (= call!40222 (minValue!5309 thiss!1181)))))

(declare-fun bm!40222 () Bool)

(assert (=> bm!40222 (= call!40222 call!40225)))

(declare-fun b!901934 () Bool)

(declare-fun res!608811 () Bool)

(declare-fun e!505006 () Bool)

(assert (=> b!901934 (=> (not res!608811) (not e!505006))))

(assert (=> b!901934 (= res!608811 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!901934 (= e!505004 e!505006)))

(declare-fun b!901935 () Bool)

(assert (=> b!901935 (= e!505005 e!505004)))

(declare-fun c!95590 () Bool)

(assert (=> b!901935 (= c!95590 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901936 () Bool)

(assert (=> b!901936 (= e!505005 e!505002)))

(declare-fun res!608810 () Bool)

(assert (=> b!901936 (= res!608810 (not (= (bvand (extraKeys!5205 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901936 (=> (not res!608810) (not e!505002))))

(declare-fun b!901937 () Bool)

(assert (=> b!901937 (= e!505006 (= call!40222 (get!13370 (select (arr!25408 (_values!5496 thiss!1181)) (index!38184 lt!407581)) (dynLambda!1315 (defaultEntry!5475 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901937 (and (bvsge (index!38184 lt!407581) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407581) (size!25867 (_values!5496 thiss!1181))))))

(assert (= (and d!111889 c!95591) b!901936))

(assert (= (and d!111889 (not c!95591)) b!901935))

(assert (= (and b!901936 res!608810) b!901931))

(assert (= (and b!901935 c!95590) b!901932))

(assert (= (and b!901935 (not c!95590)) b!901934))

(assert (= (and b!901932 res!608809) b!901933))

(assert (= (and b!901934 res!608811) b!901937))

(assert (= (or b!901933 b!901937) bm!40219))

(assert (= (or b!901933 b!901937) bm!40222))

(assert (= (or b!901931 bm!40219) bm!40221))

(assert (= (or b!901931 bm!40222) bm!40220))

(declare-fun b_lambda!13073 () Bool)

(assert (=> (not b_lambda!13073) (not b!901937)))

(assert (=> b!901937 t!25247))

(declare-fun b_and!26445 () Bool)

(assert (= b_and!26443 (and (=> t!25247 result!10225) b_and!26445)))

(assert (=> b!901937 m!837939))

(assert (=> b!901937 m!837935))

(assert (=> b!901937 m!837939))

(assert (=> b!901937 m!837935))

(assert (=> b!901937 m!837951))

(declare-fun m!838119 () Bool)

(assert (=> d!111889 m!838119))

(assert (=> d!111889 m!838029))

(assert (=> b!901934 m!837943))

(declare-fun m!838121 () Bool)

(assert (=> bm!40220 m!838121))

(assert (=> bm!40221 m!837949))

(assert (=> b!901723 d!111889))

(declare-fun d!111891 () Bool)

(declare-fun e!505009 () Bool)

(assert (=> d!111891 e!505009))

(declare-fun res!608814 () Bool)

(assert (=> d!111891 (=> res!608814 e!505009)))

(declare-fun lt!407744 () SeekEntryResult!8953)

(assert (=> d!111891 (= res!608814 (not ((_ is Found!8953) lt!407744)))))

(assert (=> d!111891 (= lt!407744 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun lt!407743 () Unit!30622)

(declare-fun choose!1525 (array!52880 array!52882 (_ BitVec 32) (_ BitVec 32) V!29513 V!29513 (_ BitVec 64)) Unit!30622)

(assert (=> d!111891 (= lt!407743 (choose!1525 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785))))

(assert (=> d!111891 (validMask!0 (mask!26290 thiss!1181))))

(assert (=> d!111891 (= (lemmaSeekEntryGivesInRangeIndex!112 (_keys!10290 thiss!1181) (_values!5496 thiss!1181) (mask!26290 thiss!1181) (extraKeys!5205 thiss!1181) (zeroValue!5309 thiss!1181) (minValue!5309 thiss!1181) key!785) lt!407743)))

(declare-fun b!901940 () Bool)

(assert (=> b!901940 (= e!505009 (inRange!0 (index!38184 lt!407744) (mask!26290 thiss!1181)))))

(assert (= (and d!111891 (not res!608814)) b!901940))

(assert (=> d!111891 m!837933))

(declare-fun m!838123 () Bool)

(assert (=> d!111891 m!838123))

(assert (=> d!111891 m!838029))

(declare-fun m!838125 () Bool)

(assert (=> b!901940 m!838125))

(assert (=> b!901722 d!111891))

(declare-fun b!901953 () Bool)

(declare-fun e!505018 () SeekEntryResult!8953)

(declare-fun lt!407753 () SeekEntryResult!8953)

(assert (=> b!901953 (= e!505018 (ite ((_ is MissingVacant!8953) lt!407753) (MissingZero!8953 (index!38186 lt!407753)) lt!407753))))

(declare-fun lt!407755 () SeekEntryResult!8953)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52880 (_ BitVec 32)) SeekEntryResult!8953)

(assert (=> b!901953 (= lt!407753 (seekKeyOrZeroReturnVacant!0 (x!76830 lt!407755) (index!38185 lt!407755) (index!38185 lt!407755) key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(declare-fun d!111893 () Bool)

(declare-fun lt!407754 () SeekEntryResult!8953)

(assert (=> d!111893 (and (or ((_ is MissingVacant!8953) lt!407754) (not ((_ is Found!8953) lt!407754)) (and (bvsge (index!38184 lt!407754) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407754) (size!25866 (_keys!10290 thiss!1181))))) (not ((_ is MissingVacant!8953) lt!407754)) (or (not ((_ is Found!8953) lt!407754)) (= (select (arr!25407 (_keys!10290 thiss!1181)) (index!38184 lt!407754)) key!785)))))

(declare-fun e!505017 () SeekEntryResult!8953)

(assert (=> d!111893 (= lt!407754 e!505017)))

(declare-fun c!95598 () Bool)

(assert (=> d!111893 (= c!95598 (and ((_ is Intermediate!8953) lt!407755) (undefined!9765 lt!407755)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52880 (_ BitVec 32)) SeekEntryResult!8953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111893 (= lt!407755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26290 thiss!1181)) key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)))))

(assert (=> d!111893 (validMask!0 (mask!26290 thiss!1181))))

(assert (=> d!111893 (= (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26290 thiss!1181)) lt!407754)))

(declare-fun b!901954 () Bool)

(declare-fun e!505016 () SeekEntryResult!8953)

(assert (=> b!901954 (= e!505016 (Found!8953 (index!38185 lt!407755)))))

(declare-fun b!901955 () Bool)

(declare-fun c!95599 () Bool)

(declare-fun lt!407756 () (_ BitVec 64))

(assert (=> b!901955 (= c!95599 (= lt!407756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901955 (= e!505016 e!505018)))

(declare-fun b!901956 () Bool)

(assert (=> b!901956 (= e!505018 (MissingZero!8953 (index!38185 lt!407755)))))

(declare-fun b!901957 () Bool)

(assert (=> b!901957 (= e!505017 e!505016)))

(assert (=> b!901957 (= lt!407756 (select (arr!25407 (_keys!10290 thiss!1181)) (index!38185 lt!407755)))))

(declare-fun c!95600 () Bool)

(assert (=> b!901957 (= c!95600 (= lt!407756 key!785))))

(declare-fun b!901958 () Bool)

(assert (=> b!901958 (= e!505017 Undefined!8953)))

(assert (= (and d!111893 c!95598) b!901958))

(assert (= (and d!111893 (not c!95598)) b!901957))

(assert (= (and b!901957 c!95600) b!901954))

(assert (= (and b!901957 (not c!95600)) b!901955))

(assert (= (and b!901955 c!95599) b!901956))

(assert (= (and b!901955 (not c!95599)) b!901953))

(declare-fun m!838127 () Bool)

(assert (=> b!901953 m!838127))

(declare-fun m!838129 () Bool)

(assert (=> d!111893 m!838129))

(declare-fun m!838131 () Bool)

(assert (=> d!111893 m!838131))

(assert (=> d!111893 m!838131))

(declare-fun m!838133 () Bool)

(assert (=> d!111893 m!838133))

(assert (=> d!111893 m!838029))

(declare-fun m!838135 () Bool)

(assert (=> b!901957 m!838135))

(assert (=> b!901722 d!111893))

(declare-fun condMapEmpty!29311 () Bool)

(declare-fun mapDefault!29311 () ValueCell!8724)

(assert (=> mapNonEmpty!29305 (= condMapEmpty!29311 (= mapRest!29305 ((as const (Array (_ BitVec 32) ValueCell!8724)) mapDefault!29311)))))

(declare-fun e!505023 () Bool)

(declare-fun mapRes!29311 () Bool)

(assert (=> mapNonEmpty!29305 (= tp!56351 (and e!505023 mapRes!29311))))

(declare-fun b!901966 () Bool)

(assert (=> b!901966 (= e!505023 tp_is_empty!18411)))

(declare-fun b!901965 () Bool)

(declare-fun e!505024 () Bool)

(assert (=> b!901965 (= e!505024 tp_is_empty!18411)))

(declare-fun mapIsEmpty!29311 () Bool)

(assert (=> mapIsEmpty!29311 mapRes!29311))

(declare-fun mapNonEmpty!29311 () Bool)

(declare-fun tp!56361 () Bool)

(assert (=> mapNonEmpty!29311 (= mapRes!29311 (and tp!56361 e!505024))))

(declare-fun mapValue!29311 () ValueCell!8724)

(declare-fun mapRest!29311 () (Array (_ BitVec 32) ValueCell!8724))

(declare-fun mapKey!29311 () (_ BitVec 32))

(assert (=> mapNonEmpty!29311 (= mapRest!29305 (store mapRest!29311 mapKey!29311 mapValue!29311))))

(assert (= (and mapNonEmpty!29305 condMapEmpty!29311) mapIsEmpty!29311))

(assert (= (and mapNonEmpty!29305 (not condMapEmpty!29311)) mapNonEmpty!29311))

(assert (= (and mapNonEmpty!29311 ((_ is ValueCellFull!8724) mapValue!29311)) b!901965))

(assert (= (and mapNonEmpty!29305 ((_ is ValueCellFull!8724) mapDefault!29311)) b!901966))

(declare-fun m!838137 () Bool)

(assert (=> mapNonEmpty!29311 m!838137))

(declare-fun b_lambda!13075 () Bool)

(assert (= b_lambda!13073 (or (and b!901725 b_free!16083) b_lambda!13075)))

(declare-fun b_lambda!13077 () Bool)

(assert (= b_lambda!13071 (or (and b!901725 b_free!16083) b_lambda!13077)))

(check-sat (not b!901940) (not b!901892) (not bm!40220) (not bm!40198) (not d!111879) (not b_lambda!13069) (not bm!40200) (not bm!40208) (not mapNonEmpty!29311) (not d!111867) (not d!111877) (not b!901860) (not b_lambda!13077) (not b!901854) tp_is_empty!18411 (not bm!40209) (not b!901858) (not bm!40210) (not b_lambda!13075) (not b!901852) (not b_lambda!13067) b_and!26445 (not b!901914) (not b!901805) (not d!111887) (not b!901804) (not b_lambda!13065) (not b!901916) (not d!111883) (not b!901808) (not d!111891) (not b!901796) (not bm!40199) (not b!901897) (not b!901789) (not b!901900) (not bm!40221) (not b!901953) (not b!901866) (not b!901803) (not b_next!16083) (not b!901937) (not b!901862) (not b!901795) (not bm!40197) (not b!901863) (not d!111881) (not b!901868) (not d!111873) (not d!111875) (not d!111889) (not d!111893) (not b!901934) (not b!901907))
(check-sat b_and!26445 (not b_next!16083))
