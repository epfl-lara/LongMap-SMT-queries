; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107352 () Bool)

(assert start!107352)

(declare-fun b_free!27657 () Bool)

(declare-fun b_next!27657 () Bool)

(assert (=> start!107352 (= b_free!27657 (not b_next!27657))))

(declare-fun tp!97480 () Bool)

(declare-fun b_and!45705 () Bool)

(assert (=> start!107352 (= tp!97480 b_and!45705)))

(declare-fun b!1272220 () Bool)

(declare-fun e!725605 () Bool)

(declare-fun e!725606 () Bool)

(declare-fun mapRes!51124 () Bool)

(assert (=> b!1272220 (= e!725605 (and e!725606 mapRes!51124))))

(declare-fun condMapEmpty!51124 () Bool)

(declare-datatypes ((V!49229 0))(
  ( (V!49230 (val!16588 Int)) )
))
(declare-datatypes ((ValueCell!15660 0))(
  ( (ValueCellFull!15660 (v!19225 V!49229)) (EmptyCell!15660) )
))
(declare-datatypes ((array!83304 0))(
  ( (array!83305 (arr!40188 (Array (_ BitVec 32) ValueCell!15660)) (size!40724 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83304)

(declare-fun mapDefault!51124 () ValueCell!15660)

(assert (=> b!1272220 (= condMapEmpty!51124 (= (arr!40188 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15660)) mapDefault!51124)))))

(declare-fun b!1272221 () Bool)

(declare-fun res!846310 () Bool)

(declare-fun e!725607 () Bool)

(assert (=> b!1272221 (=> (not res!846310) (not e!725607))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!83306 0))(
  ( (array!83307 (arr!40189 (Array (_ BitVec 32) (_ BitVec 64))) (size!40725 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83306)

(assert (=> b!1272221 (= res!846310 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40725 _keys!1364)) (bvsge from!1698 (size!40725 _keys!1364))))))

(declare-fun res!846312 () Bool)

(assert (=> start!107352 (=> (not res!846312) (not e!725607))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107352 (= res!846312 (validMask!0 mask!1730))))

(assert (=> start!107352 e!725607))

(declare-fun array_inv!30571 (array!83304) Bool)

(assert (=> start!107352 (and (array_inv!30571 _values!1134) e!725605)))

(assert (=> start!107352 true))

(declare-fun array_inv!30572 (array!83306) Bool)

(assert (=> start!107352 (array_inv!30572 _keys!1364)))

(declare-fun tp_is_empty!33027 () Bool)

(assert (=> start!107352 tp_is_empty!33027))

(assert (=> start!107352 tp!97480))

(declare-fun b!1272222 () Bool)

(declare-fun res!846313 () Bool)

(assert (=> b!1272222 (=> (not res!846313) (not e!725607))))

(declare-datatypes ((List!28555 0))(
  ( (Nil!28552) (Cons!28551 (h!29760 (_ BitVec 64)) (t!42086 List!28555)) )
))
(declare-fun arrayNoDuplicates!0 (array!83306 (_ BitVec 32) List!28555) Bool)

(assert (=> b!1272222 (= res!846313 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28552))))

(declare-fun mapIsEmpty!51124 () Bool)

(assert (=> mapIsEmpty!51124 mapRes!51124))

(declare-fun b!1272223 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!49229)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!49229)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49229)

(declare-fun zeroValueBefore!52 () V!49229)

(declare-datatypes ((tuple2!21372 0))(
  ( (tuple2!21373 (_1!10697 (_ BitVec 64)) (_2!10697 V!49229)) )
))
(declare-datatypes ((List!28556 0))(
  ( (Nil!28553) (Cons!28552 (h!29761 tuple2!21372) (t!42087 List!28556)) )
))
(declare-datatypes ((ListLongMap!19101 0))(
  ( (ListLongMap!19102 (toList!9566 List!28556)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5898 (array!83306 array!83304 (_ BitVec 32) (_ BitVec 32) V!49229 V!49229 (_ BitVec 32) Int) ListLongMap!19101)

(assert (=> b!1272223 (= e!725607 (not (= (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(declare-fun b!1272224 () Bool)

(declare-fun e!725603 () Bool)

(assert (=> b!1272224 (= e!725603 tp_is_empty!33027)))

(declare-fun b!1272225 () Bool)

(declare-fun res!846314 () Bool)

(assert (=> b!1272225 (=> (not res!846314) (not e!725607))))

(assert (=> b!1272225 (= res!846314 (and (= (size!40724 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40725 _keys!1364) (size!40724 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51124 () Bool)

(declare-fun tp!97479 () Bool)

(assert (=> mapNonEmpty!51124 (= mapRes!51124 (and tp!97479 e!725603))))

(declare-fun mapValue!51124 () ValueCell!15660)

(declare-fun mapKey!51124 () (_ BitVec 32))

(declare-fun mapRest!51124 () (Array (_ BitVec 32) ValueCell!15660))

(assert (=> mapNonEmpty!51124 (= (arr!40188 _values!1134) (store mapRest!51124 mapKey!51124 mapValue!51124))))

(declare-fun b!1272226 () Bool)

(assert (=> b!1272226 (= e!725606 tp_is_empty!33027)))

(declare-fun b!1272227 () Bool)

(declare-fun res!846311 () Bool)

(assert (=> b!1272227 (=> (not res!846311) (not e!725607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83306 (_ BitVec 32)) Bool)

(assert (=> b!1272227 (= res!846311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107352 res!846312) b!1272225))

(assert (= (and b!1272225 res!846314) b!1272227))

(assert (= (and b!1272227 res!846311) b!1272222))

(assert (= (and b!1272222 res!846313) b!1272221))

(assert (= (and b!1272221 res!846310) b!1272223))

(assert (= (and b!1272220 condMapEmpty!51124) mapIsEmpty!51124))

(assert (= (and b!1272220 (not condMapEmpty!51124)) mapNonEmpty!51124))

(get-info :version)

(assert (= (and mapNonEmpty!51124 ((_ is ValueCellFull!15660) mapValue!51124)) b!1272224))

(assert (= (and b!1272220 ((_ is ValueCellFull!15660) mapDefault!51124)) b!1272226))

(assert (= start!107352 b!1272220))

(declare-fun m!1169959 () Bool)

(assert (=> mapNonEmpty!51124 m!1169959))

(declare-fun m!1169961 () Bool)

(assert (=> b!1272223 m!1169961))

(declare-fun m!1169963 () Bool)

(assert (=> b!1272223 m!1169963))

(declare-fun m!1169965 () Bool)

(assert (=> b!1272227 m!1169965))

(declare-fun m!1169967 () Bool)

(assert (=> b!1272222 m!1169967))

(declare-fun m!1169969 () Bool)

(assert (=> start!107352 m!1169969))

(declare-fun m!1169971 () Bool)

(assert (=> start!107352 m!1169971))

(declare-fun m!1169973 () Bool)

(assert (=> start!107352 m!1169973))

(check-sat (not mapNonEmpty!51124) (not start!107352) b_and!45705 (not b!1272223) tp_is_empty!33027 (not b_next!27657) (not b!1272227) (not b!1272222))
(check-sat b_and!45705 (not b_next!27657))
(get-model)

(declare-fun d!139829 () Bool)

(assert (=> d!139829 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107352 d!139829))

(declare-fun d!139831 () Bool)

(assert (=> d!139831 (= (array_inv!30571 _values!1134) (bvsge (size!40724 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107352 d!139831))

(declare-fun d!139833 () Bool)

(assert (=> d!139833 (= (array_inv!30572 _keys!1364) (bvsge (size!40725 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107352 d!139833))

(declare-fun bm!62527 () Bool)

(declare-fun call!62530 () Bool)

(declare-fun c!123665 () Bool)

(assert (=> bm!62527 (= call!62530 (arrayNoDuplicates!0 _keys!1364 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123665 (Cons!28551 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000) Nil!28552) Nil!28552)))))

(declare-fun b!1272262 () Bool)

(declare-fun e!725633 () Bool)

(declare-fun contains!7666 (List!28555 (_ BitVec 64)) Bool)

(assert (=> b!1272262 (= e!725633 (contains!7666 Nil!28552 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272263 () Bool)

(declare-fun e!725634 () Bool)

(assert (=> b!1272263 (= e!725634 call!62530)))

(declare-fun b!1272264 () Bool)

(assert (=> b!1272264 (= e!725634 call!62530)))

(declare-fun d!139835 () Bool)

(declare-fun res!846336 () Bool)

(declare-fun e!725632 () Bool)

(assert (=> d!139835 (=> res!846336 e!725632)))

(assert (=> d!139835 (= res!846336 (bvsge #b00000000000000000000000000000000 (size!40725 _keys!1364)))))

(assert (=> d!139835 (= (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28552) e!725632)))

(declare-fun b!1272265 () Bool)

(declare-fun e!725631 () Bool)

(assert (=> b!1272265 (= e!725631 e!725634)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272265 (= c!123665 (validKeyInArray!0 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1272266 () Bool)

(assert (=> b!1272266 (= e!725632 e!725631)))

(declare-fun res!846338 () Bool)

(assert (=> b!1272266 (=> (not res!846338) (not e!725631))))

(assert (=> b!1272266 (= res!846338 (not e!725633))))

(declare-fun res!846337 () Bool)

(assert (=> b!1272266 (=> (not res!846337) (not e!725633))))

(assert (=> b!1272266 (= res!846337 (validKeyInArray!0 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!139835 (not res!846336)) b!1272266))

(assert (= (and b!1272266 res!846337) b!1272262))

(assert (= (and b!1272266 res!846338) b!1272265))

(assert (= (and b!1272265 c!123665) b!1272263))

(assert (= (and b!1272265 (not c!123665)) b!1272264))

(assert (= (or b!1272263 b!1272264) bm!62527))

(declare-fun m!1169991 () Bool)

(assert (=> bm!62527 m!1169991))

(declare-fun m!1169993 () Bool)

(assert (=> bm!62527 m!1169993))

(assert (=> b!1272262 m!1169991))

(assert (=> b!1272262 m!1169991))

(declare-fun m!1169995 () Bool)

(assert (=> b!1272262 m!1169995))

(assert (=> b!1272265 m!1169991))

(assert (=> b!1272265 m!1169991))

(declare-fun m!1169997 () Bool)

(assert (=> b!1272265 m!1169997))

(assert (=> b!1272266 m!1169991))

(assert (=> b!1272266 m!1169991))

(assert (=> b!1272266 m!1169997))

(assert (=> b!1272222 d!139835))

(declare-fun b!1272291 () Bool)

(declare-fun e!725651 () Bool)

(declare-fun e!725649 () Bool)

(assert (=> b!1272291 (= e!725651 e!725649)))

(declare-fun c!123674 () Bool)

(assert (=> b!1272291 (= c!123674 (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun b!1272292 () Bool)

(declare-fun e!725654 () ListLongMap!19101)

(assert (=> b!1272292 (= e!725654 (ListLongMap!19102 Nil!28553))))

(declare-fun b!1272293 () Bool)

(declare-fun e!725650 () ListLongMap!19101)

(assert (=> b!1272293 (= e!725654 e!725650)))

(declare-fun c!123675 () Bool)

(assert (=> b!1272293 (= c!123675 (validKeyInArray!0 (select (arr!40189 _keys!1364) from!1698)))))

(declare-fun lt!575028 () ListLongMap!19101)

(declare-fun b!1272294 () Bool)

(assert (=> b!1272294 (= e!725649 (= lt!575028 (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272295 () Bool)

(declare-fun res!846348 () Bool)

(declare-fun e!725652 () Bool)

(assert (=> b!1272295 (=> (not res!846348) (not e!725652))))

(declare-fun contains!7667 (ListLongMap!19101 (_ BitVec 64)) Bool)

(assert (=> b!1272295 (= res!846348 (not (contains!7667 lt!575028 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272296 () Bool)

(declare-fun call!62533 () ListLongMap!19101)

(assert (=> b!1272296 (= e!725650 call!62533)))

(declare-fun b!1272297 () Bool)

(assert (=> b!1272297 (= e!725652 e!725651)))

(declare-fun c!123677 () Bool)

(declare-fun e!725655 () Bool)

(assert (=> b!1272297 (= c!123677 e!725655)))

(declare-fun res!846349 () Bool)

(assert (=> b!1272297 (=> (not res!846349) (not e!725655))))

(assert (=> b!1272297 (= res!846349 (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun bm!62530 () Bool)

(assert (=> bm!62530 (= call!62533 (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272298 () Bool)

(declare-datatypes ((Unit!42316 0))(
  ( (Unit!42317) )
))
(declare-fun lt!575024 () Unit!42316)

(declare-fun lt!575026 () Unit!42316)

(assert (=> b!1272298 (= lt!575024 lt!575026)))

(declare-fun lt!575025 () (_ BitVec 64))

(declare-fun lt!575023 () V!49229)

(declare-fun lt!575027 () (_ BitVec 64))

(declare-fun lt!575022 () ListLongMap!19101)

(declare-fun +!4269 (ListLongMap!19101 tuple2!21372) ListLongMap!19101)

(assert (=> b!1272298 (not (contains!7667 (+!4269 lt!575022 (tuple2!21373 lt!575027 lt!575023)) lt!575025))))

(declare-fun addStillNotContains!334 (ListLongMap!19101 (_ BitVec 64) V!49229 (_ BitVec 64)) Unit!42316)

(assert (=> b!1272298 (= lt!575026 (addStillNotContains!334 lt!575022 lt!575027 lt!575023 lt!575025))))

(assert (=> b!1272298 (= lt!575025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20507 (ValueCell!15660 V!49229) V!49229)

(declare-fun dynLambda!3404 (Int (_ BitVec 64)) V!49229)

(assert (=> b!1272298 (= lt!575023 (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272298 (= lt!575027 (select (arr!40189 _keys!1364) from!1698))))

(assert (=> b!1272298 (= lt!575022 call!62533)))

(assert (=> b!1272298 (= e!725650 (+!4269 call!62533 (tuple2!21373 (select (arr!40189 _keys!1364) from!1698) (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272299 () Bool)

(declare-fun e!725653 () Bool)

(assert (=> b!1272299 (= e!725651 e!725653)))

(assert (=> b!1272299 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun res!846350 () Bool)

(assert (=> b!1272299 (= res!846350 (contains!7667 lt!575028 (select (arr!40189 _keys!1364) from!1698)))))

(assert (=> b!1272299 (=> (not res!846350) (not e!725653))))

(declare-fun b!1272300 () Bool)

(assert (=> b!1272300 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40725 _keys!1364)))))

(assert (=> b!1272300 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40724 _values!1134)))))

(declare-fun apply!1006 (ListLongMap!19101 (_ BitVec 64)) V!49229)

(assert (=> b!1272300 (= e!725653 (= (apply!1006 lt!575028 (select (arr!40189 _keys!1364) from!1698)) (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272301 () Bool)

(assert (=> b!1272301 (= e!725655 (validKeyInArray!0 (select (arr!40189 _keys!1364) from!1698)))))

(assert (=> b!1272301 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun d!139837 () Bool)

(assert (=> d!139837 e!725652))

(declare-fun res!846347 () Bool)

(assert (=> d!139837 (=> (not res!846347) (not e!725652))))

(assert (=> d!139837 (= res!846347 (not (contains!7667 lt!575028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139837 (= lt!575028 e!725654)))

(declare-fun c!123676 () Bool)

(assert (=> d!139837 (= c!123676 (bvsge from!1698 (size!40725 _keys!1364)))))

(assert (=> d!139837 (validMask!0 mask!1730)))

(assert (=> d!139837 (= (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) lt!575028)))

(declare-fun b!1272302 () Bool)

(declare-fun isEmpty!1048 (ListLongMap!19101) Bool)

(assert (=> b!1272302 (= e!725649 (isEmpty!1048 lt!575028))))

(assert (= (and d!139837 c!123676) b!1272292))

(assert (= (and d!139837 (not c!123676)) b!1272293))

(assert (= (and b!1272293 c!123675) b!1272298))

(assert (= (and b!1272293 (not c!123675)) b!1272296))

(assert (= (or b!1272298 b!1272296) bm!62530))

(assert (= (and d!139837 res!846347) b!1272295))

(assert (= (and b!1272295 res!846348) b!1272297))

(assert (= (and b!1272297 res!846349) b!1272301))

(assert (= (and b!1272297 c!123677) b!1272299))

(assert (= (and b!1272297 (not c!123677)) b!1272291))

(assert (= (and b!1272299 res!846350) b!1272300))

(assert (= (and b!1272291 c!123674) b!1272294))

(assert (= (and b!1272291 (not c!123674)) b!1272302))

(declare-fun b_lambda!23071 () Bool)

(assert (=> (not b_lambda!23071) (not b!1272298)))

(declare-fun t!42090 () Bool)

(declare-fun tb!11339 () Bool)

(assert (=> (and start!107352 (= defaultEntry!1142 defaultEntry!1142) t!42090) tb!11339))

(declare-fun result!23555 () Bool)

(assert (=> tb!11339 (= result!23555 tp_is_empty!33027)))

(assert (=> b!1272298 t!42090))

(declare-fun b_and!45709 () Bool)

(assert (= b_and!45705 (and (=> t!42090 result!23555) b_and!45709)))

(declare-fun b_lambda!23073 () Bool)

(assert (=> (not b_lambda!23073) (not b!1272300)))

(assert (=> b!1272300 t!42090))

(declare-fun b_and!45711 () Bool)

(assert (= b_and!45709 (and (=> t!42090 result!23555) b_and!45711)))

(declare-fun m!1169999 () Bool)

(assert (=> d!139837 m!1169999))

(assert (=> d!139837 m!1169969))

(declare-fun m!1170001 () Bool)

(assert (=> b!1272301 m!1170001))

(assert (=> b!1272301 m!1170001))

(declare-fun m!1170003 () Bool)

(assert (=> b!1272301 m!1170003))

(declare-fun m!1170005 () Bool)

(assert (=> b!1272294 m!1170005))

(assert (=> b!1272293 m!1170001))

(assert (=> b!1272293 m!1170001))

(assert (=> b!1272293 m!1170003))

(declare-fun m!1170007 () Bool)

(assert (=> b!1272295 m!1170007))

(assert (=> bm!62530 m!1170005))

(declare-fun m!1170009 () Bool)

(assert (=> b!1272302 m!1170009))

(assert (=> b!1272300 m!1170001))

(declare-fun m!1170011 () Bool)

(assert (=> b!1272300 m!1170011))

(declare-fun m!1170013 () Bool)

(assert (=> b!1272300 m!1170013))

(assert (=> b!1272300 m!1170001))

(declare-fun m!1170015 () Bool)

(assert (=> b!1272300 m!1170015))

(assert (=> b!1272300 m!1170013))

(declare-fun m!1170017 () Bool)

(assert (=> b!1272300 m!1170017))

(assert (=> b!1272300 m!1170015))

(declare-fun m!1170019 () Bool)

(assert (=> b!1272298 m!1170019))

(assert (=> b!1272298 m!1170013))

(declare-fun m!1170021 () Bool)

(assert (=> b!1272298 m!1170021))

(assert (=> b!1272298 m!1170001))

(assert (=> b!1272298 m!1170019))

(declare-fun m!1170023 () Bool)

(assert (=> b!1272298 m!1170023))

(assert (=> b!1272298 m!1170015))

(assert (=> b!1272298 m!1170013))

(assert (=> b!1272298 m!1170017))

(declare-fun m!1170025 () Bool)

(assert (=> b!1272298 m!1170025))

(assert (=> b!1272298 m!1170015))

(assert (=> b!1272299 m!1170001))

(assert (=> b!1272299 m!1170001))

(declare-fun m!1170027 () Bool)

(assert (=> b!1272299 m!1170027))

(assert (=> b!1272223 d!139837))

(declare-fun b!1272305 () Bool)

(declare-fun e!725658 () Bool)

(declare-fun e!725656 () Bool)

(assert (=> b!1272305 (= e!725658 e!725656)))

(declare-fun c!123678 () Bool)

(assert (=> b!1272305 (= c!123678 (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun b!1272306 () Bool)

(declare-fun e!725661 () ListLongMap!19101)

(assert (=> b!1272306 (= e!725661 (ListLongMap!19102 Nil!28553))))

(declare-fun b!1272307 () Bool)

(declare-fun e!725657 () ListLongMap!19101)

(assert (=> b!1272307 (= e!725661 e!725657)))

(declare-fun c!123679 () Bool)

(assert (=> b!1272307 (= c!123679 (validKeyInArray!0 (select (arr!40189 _keys!1364) from!1698)))))

(declare-fun b!1272308 () Bool)

(declare-fun lt!575035 () ListLongMap!19101)

(assert (=> b!1272308 (= e!725656 (= lt!575035 (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142)))))

(declare-fun b!1272309 () Bool)

(declare-fun res!846352 () Bool)

(declare-fun e!725659 () Bool)

(assert (=> b!1272309 (=> (not res!846352) (not e!725659))))

(assert (=> b!1272309 (= res!846352 (not (contains!7667 lt!575035 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1272310 () Bool)

(declare-fun call!62534 () ListLongMap!19101)

(assert (=> b!1272310 (= e!725657 call!62534)))

(declare-fun b!1272311 () Bool)

(assert (=> b!1272311 (= e!725659 e!725658)))

(declare-fun c!123681 () Bool)

(declare-fun e!725662 () Bool)

(assert (=> b!1272311 (= c!123681 e!725662)))

(declare-fun res!846353 () Bool)

(assert (=> b!1272311 (=> (not res!846353) (not e!725662))))

(assert (=> b!1272311 (= res!846353 (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun bm!62531 () Bool)

(assert (=> bm!62531 (= call!62534 (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd from!1698 #b00000000000000000000000000000001) defaultEntry!1142))))

(declare-fun b!1272312 () Bool)

(declare-fun lt!575031 () Unit!42316)

(declare-fun lt!575033 () Unit!42316)

(assert (=> b!1272312 (= lt!575031 lt!575033)))

(declare-fun lt!575029 () ListLongMap!19101)

(declare-fun lt!575034 () (_ BitVec 64))

(declare-fun lt!575030 () V!49229)

(declare-fun lt!575032 () (_ BitVec 64))

(assert (=> b!1272312 (not (contains!7667 (+!4269 lt!575029 (tuple2!21373 lt!575034 lt!575030)) lt!575032))))

(assert (=> b!1272312 (= lt!575033 (addStillNotContains!334 lt!575029 lt!575034 lt!575030 lt!575032))))

(assert (=> b!1272312 (= lt!575032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1272312 (= lt!575030 (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1272312 (= lt!575034 (select (arr!40189 _keys!1364) from!1698))))

(assert (=> b!1272312 (= lt!575029 call!62534)))

(assert (=> b!1272312 (= e!725657 (+!4269 call!62534 (tuple2!21373 (select (arr!40189 _keys!1364) from!1698) (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1272313 () Bool)

(declare-fun e!725660 () Bool)

(assert (=> b!1272313 (= e!725658 e!725660)))

(assert (=> b!1272313 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40725 _keys!1364)))))

(declare-fun res!846354 () Bool)

(assert (=> b!1272313 (= res!846354 (contains!7667 lt!575035 (select (arr!40189 _keys!1364) from!1698)))))

(assert (=> b!1272313 (=> (not res!846354) (not e!725660))))

(declare-fun b!1272314 () Bool)

(assert (=> b!1272314 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40725 _keys!1364)))))

(assert (=> b!1272314 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvslt from!1698 (size!40724 _values!1134)))))

(assert (=> b!1272314 (= e!725660 (= (apply!1006 lt!575035 (select (arr!40189 _keys!1364) from!1698)) (get!20507 (select (arr!40188 _values!1134) from!1698) (dynLambda!3404 defaultEntry!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1272315 () Bool)

(assert (=> b!1272315 (= e!725662 (validKeyInArray!0 (select (arr!40189 _keys!1364) from!1698)))))

(assert (=> b!1272315 (bvsge from!1698 #b00000000000000000000000000000000)))

(declare-fun d!139839 () Bool)

(assert (=> d!139839 e!725659))

(declare-fun res!846351 () Bool)

(assert (=> d!139839 (=> (not res!846351) (not e!725659))))

(assert (=> d!139839 (= res!846351 (not (contains!7667 lt!575035 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139839 (= lt!575035 e!725661)))

(declare-fun c!123680 () Bool)

(assert (=> d!139839 (= c!123680 (bvsge from!1698 (size!40725 _keys!1364)))))

(assert (=> d!139839 (validMask!0 mask!1730)))

(assert (=> d!139839 (= (getCurrentListMapNoExtraKeys!5898 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142) lt!575035)))

(declare-fun b!1272316 () Bool)

(assert (=> b!1272316 (= e!725656 (isEmpty!1048 lt!575035))))

(assert (= (and d!139839 c!123680) b!1272306))

(assert (= (and d!139839 (not c!123680)) b!1272307))

(assert (= (and b!1272307 c!123679) b!1272312))

(assert (= (and b!1272307 (not c!123679)) b!1272310))

(assert (= (or b!1272312 b!1272310) bm!62531))

(assert (= (and d!139839 res!846351) b!1272309))

(assert (= (and b!1272309 res!846352) b!1272311))

(assert (= (and b!1272311 res!846353) b!1272315))

(assert (= (and b!1272311 c!123681) b!1272313))

(assert (= (and b!1272311 (not c!123681)) b!1272305))

(assert (= (and b!1272313 res!846354) b!1272314))

(assert (= (and b!1272305 c!123678) b!1272308))

(assert (= (and b!1272305 (not c!123678)) b!1272316))

(declare-fun b_lambda!23075 () Bool)

(assert (=> (not b_lambda!23075) (not b!1272312)))

(assert (=> b!1272312 t!42090))

(declare-fun b_and!45713 () Bool)

(assert (= b_and!45711 (and (=> t!42090 result!23555) b_and!45713)))

(declare-fun b_lambda!23077 () Bool)

(assert (=> (not b_lambda!23077) (not b!1272314)))

(assert (=> b!1272314 t!42090))

(declare-fun b_and!45715 () Bool)

(assert (= b_and!45713 (and (=> t!42090 result!23555) b_and!45715)))

(declare-fun m!1170029 () Bool)

(assert (=> d!139839 m!1170029))

(assert (=> d!139839 m!1169969))

(assert (=> b!1272315 m!1170001))

(assert (=> b!1272315 m!1170001))

(assert (=> b!1272315 m!1170003))

(declare-fun m!1170031 () Bool)

(assert (=> b!1272308 m!1170031))

(assert (=> b!1272307 m!1170001))

(assert (=> b!1272307 m!1170001))

(assert (=> b!1272307 m!1170003))

(declare-fun m!1170033 () Bool)

(assert (=> b!1272309 m!1170033))

(assert (=> bm!62531 m!1170031))

(declare-fun m!1170035 () Bool)

(assert (=> b!1272316 m!1170035))

(assert (=> b!1272314 m!1170001))

(declare-fun m!1170037 () Bool)

(assert (=> b!1272314 m!1170037))

(assert (=> b!1272314 m!1170013))

(assert (=> b!1272314 m!1170001))

(assert (=> b!1272314 m!1170015))

(assert (=> b!1272314 m!1170013))

(assert (=> b!1272314 m!1170017))

(assert (=> b!1272314 m!1170015))

(declare-fun m!1170039 () Bool)

(assert (=> b!1272312 m!1170039))

(assert (=> b!1272312 m!1170013))

(declare-fun m!1170041 () Bool)

(assert (=> b!1272312 m!1170041))

(assert (=> b!1272312 m!1170001))

(assert (=> b!1272312 m!1170039))

(declare-fun m!1170043 () Bool)

(assert (=> b!1272312 m!1170043))

(assert (=> b!1272312 m!1170015))

(assert (=> b!1272312 m!1170013))

(assert (=> b!1272312 m!1170017))

(declare-fun m!1170045 () Bool)

(assert (=> b!1272312 m!1170045))

(assert (=> b!1272312 m!1170015))

(assert (=> b!1272313 m!1170001))

(assert (=> b!1272313 m!1170001))

(declare-fun m!1170047 () Bool)

(assert (=> b!1272313 m!1170047))

(assert (=> b!1272223 d!139839))

(declare-fun bm!62534 () Bool)

(declare-fun call!62537 () Bool)

(assert (=> bm!62534 (= call!62537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1272325 () Bool)

(declare-fun e!725669 () Bool)

(assert (=> b!1272325 (= e!725669 call!62537)))

(declare-fun b!1272326 () Bool)

(declare-fun e!725670 () Bool)

(assert (=> b!1272326 (= e!725670 e!725669)))

(declare-fun lt!575043 () (_ BitVec 64))

(assert (=> b!1272326 (= lt!575043 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000))))

(declare-fun lt!575044 () Unit!42316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83306 (_ BitVec 64) (_ BitVec 32)) Unit!42316)

(assert (=> b!1272326 (= lt!575044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!575043 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272326 (arrayContainsKey!0 _keys!1364 lt!575043 #b00000000000000000000000000000000)))

(declare-fun lt!575042 () Unit!42316)

(assert (=> b!1272326 (= lt!575042 lt!575044)))

(declare-fun res!846360 () Bool)

(declare-datatypes ((SeekEntryResult!9988 0))(
  ( (MissingZero!9988 (index!42323 (_ BitVec 32))) (Found!9988 (index!42324 (_ BitVec 32))) (Intermediate!9988 (undefined!10800 Bool) (index!42325 (_ BitVec 32)) (x!112387 (_ BitVec 32))) (Undefined!9988) (MissingVacant!9988 (index!42326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83306 (_ BitVec 32)) SeekEntryResult!9988)

(assert (=> b!1272326 (= res!846360 (= (seekEntryOrOpen!0 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9988 #b00000000000000000000000000000000)))))

(assert (=> b!1272326 (=> (not res!846360) (not e!725669))))

(declare-fun b!1272327 () Bool)

(declare-fun e!725671 () Bool)

(assert (=> b!1272327 (= e!725671 e!725670)))

(declare-fun c!123684 () Bool)

(assert (=> b!1272327 (= c!123684 (validKeyInArray!0 (select (arr!40189 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun d!139841 () Bool)

(declare-fun res!846359 () Bool)

(assert (=> d!139841 (=> res!846359 e!725671)))

(assert (=> d!139841 (= res!846359 (bvsge #b00000000000000000000000000000000 (size!40725 _keys!1364)))))

(assert (=> d!139841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!725671)))

(declare-fun b!1272328 () Bool)

(assert (=> b!1272328 (= e!725670 call!62537)))

(assert (= (and d!139841 (not res!846359)) b!1272327))

(assert (= (and b!1272327 c!123684) b!1272326))

(assert (= (and b!1272327 (not c!123684)) b!1272328))

(assert (= (and b!1272326 res!846360) b!1272325))

(assert (= (or b!1272325 b!1272328) bm!62534))

(declare-fun m!1170049 () Bool)

(assert (=> bm!62534 m!1170049))

(assert (=> b!1272326 m!1169991))

(declare-fun m!1170051 () Bool)

(assert (=> b!1272326 m!1170051))

(declare-fun m!1170053 () Bool)

(assert (=> b!1272326 m!1170053))

(assert (=> b!1272326 m!1169991))

(declare-fun m!1170055 () Bool)

(assert (=> b!1272326 m!1170055))

(assert (=> b!1272327 m!1169991))

(assert (=> b!1272327 m!1169991))

(assert (=> b!1272327 m!1169997))

(assert (=> b!1272227 d!139841))

(declare-fun b!1272335 () Bool)

(declare-fun e!725677 () Bool)

(assert (=> b!1272335 (= e!725677 tp_is_empty!33027)))

(declare-fun mapNonEmpty!51130 () Bool)

(declare-fun mapRes!51130 () Bool)

(declare-fun tp!97489 () Bool)

(assert (=> mapNonEmpty!51130 (= mapRes!51130 (and tp!97489 e!725677))))

(declare-fun mapRest!51130 () (Array (_ BitVec 32) ValueCell!15660))

(declare-fun mapKey!51130 () (_ BitVec 32))

(declare-fun mapValue!51130 () ValueCell!15660)

(assert (=> mapNonEmpty!51130 (= mapRest!51124 (store mapRest!51130 mapKey!51130 mapValue!51130))))

(declare-fun condMapEmpty!51130 () Bool)

(declare-fun mapDefault!51130 () ValueCell!15660)

(assert (=> mapNonEmpty!51124 (= condMapEmpty!51130 (= mapRest!51124 ((as const (Array (_ BitVec 32) ValueCell!15660)) mapDefault!51130)))))

(declare-fun e!725676 () Bool)

(assert (=> mapNonEmpty!51124 (= tp!97479 (and e!725676 mapRes!51130))))

(declare-fun b!1272336 () Bool)

(assert (=> b!1272336 (= e!725676 tp_is_empty!33027)))

(declare-fun mapIsEmpty!51130 () Bool)

(assert (=> mapIsEmpty!51130 mapRes!51130))

(assert (= (and mapNonEmpty!51124 condMapEmpty!51130) mapIsEmpty!51130))

(assert (= (and mapNonEmpty!51124 (not condMapEmpty!51130)) mapNonEmpty!51130))

(assert (= (and mapNonEmpty!51130 ((_ is ValueCellFull!15660) mapValue!51130)) b!1272335))

(assert (= (and mapNonEmpty!51124 ((_ is ValueCellFull!15660) mapDefault!51130)) b!1272336))

(declare-fun m!1170057 () Bool)

(assert (=> mapNonEmpty!51130 m!1170057))

(declare-fun b_lambda!23079 () Bool)

(assert (= b_lambda!23071 (or (and start!107352 b_free!27657) b_lambda!23079)))

(declare-fun b_lambda!23081 () Bool)

(assert (= b_lambda!23075 (or (and start!107352 b_free!27657) b_lambda!23081)))

(declare-fun b_lambda!23083 () Bool)

(assert (= b_lambda!23077 (or (and start!107352 b_free!27657) b_lambda!23083)))

(declare-fun b_lambda!23085 () Bool)

(assert (= b_lambda!23073 (or (and start!107352 b_free!27657) b_lambda!23085)))

(check-sat (not b!1272298) (not bm!62527) (not b!1272293) (not b!1272326) (not b!1272307) (not b!1272327) (not b!1272301) (not b!1272302) (not b!1272312) (not bm!62530) (not b_next!27657) (not b!1272314) (not b_lambda!23079) (not b_lambda!23081) (not b!1272300) (not d!139837) (not b!1272265) (not bm!62534) (not b!1272294) (not b!1272309) (not b!1272299) (not b!1272315) (not b!1272308) (not d!139839) (not b!1272316) (not b_lambda!23083) (not b!1272262) tp_is_empty!33027 (not mapNonEmpty!51130) (not b!1272295) (not bm!62531) (not b_lambda!23085) b_and!45715 (not b!1272313) (not b!1272266))
(check-sat b_and!45715 (not b_next!27657))
