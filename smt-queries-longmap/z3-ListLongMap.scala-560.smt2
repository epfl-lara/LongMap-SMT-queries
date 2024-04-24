; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15206 () Bool)

(assert start!15206)

(declare-fun b!146175 () Bool)

(declare-fun b_free!3109 () Bool)

(declare-fun b_next!3109 () Bool)

(assert (=> b!146175 (= b_free!3109 (not b_next!3109))))

(declare-fun tp!11829 () Bool)

(declare-fun b_and!9137 () Bool)

(assert (=> b!146175 (= tp!11829 b_and!9137)))

(declare-fun b!146158 () Bool)

(declare-fun b_free!3111 () Bool)

(declare-fun b_next!3111 () Bool)

(assert (=> b!146158 (= b_free!3111 (not b_next!3111))))

(declare-fun tp!11832 () Bool)

(declare-fun b_and!9139 () Bool)

(assert (=> b!146158 (= tp!11832 b_and!9139)))

(declare-fun e!95316 () Bool)

(declare-datatypes ((V!3609 0))(
  ( (V!3610 (val!1530 Int)) )
))
(declare-datatypes ((array!4973 0))(
  ( (array!4974 (arr!2348 (Array (_ BitVec 32) (_ BitVec 64))) (size!2624 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1142 0))(
  ( (ValueCellFull!1142 (v!3352 V!3609)) (EmptyCell!1142) )
))
(declare-datatypes ((array!4975 0))(
  ( (array!4976 (arr!2349 (Array (_ BitVec 32) ValueCell!1142)) (size!2625 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1192 0))(
  ( (LongMapFixedSize!1193 (defaultEntry!3012 Int) (mask!7388 (_ BitVec 32)) (extraKeys!2757 (_ BitVec 32)) (zeroValue!2857 V!3609) (minValue!2857 V!3609) (_size!645 (_ BitVec 32)) (_keys!4781 array!4973) (_values!2995 array!4975) (_vacant!645 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1192)

(declare-fun tp_is_empty!2971 () Bool)

(declare-fun e!95318 () Bool)

(declare-fun array_inv!1471 (array!4973) Bool)

(declare-fun array_inv!1472 (array!4975) Bool)

(assert (=> b!146158 (= e!95318 (and tp!11832 tp_is_empty!2971 (array_inv!1471 (_keys!4781 newMap!16)) (array_inv!1472 (_values!2995 newMap!16)) e!95316))))

(declare-fun mapIsEmpty!4985 () Bool)

(declare-fun mapRes!4985 () Bool)

(assert (=> mapIsEmpty!4985 mapRes!4985))

(declare-fun b!146159 () Bool)

(declare-fun e!95326 () Bool)

(declare-fun e!95330 () Bool)

(assert (=> b!146159 (= e!95326 e!95330)))

(declare-fun mapNonEmpty!4985 () Bool)

(declare-fun mapRes!4986 () Bool)

(declare-fun tp!11830 () Bool)

(declare-fun e!95319 () Bool)

(assert (=> mapNonEmpty!4985 (= mapRes!4986 (and tp!11830 e!95319))))

(declare-fun mapKey!4985 () (_ BitVec 32))

(declare-fun mapValue!4986 () ValueCell!1142)

(declare-datatypes ((Cell!978 0))(
  ( (Cell!979 (v!3353 LongMapFixedSize!1192)) )
))
(declare-datatypes ((LongMap!978 0))(
  ( (LongMap!979 (underlying!500 Cell!978)) )
))
(declare-fun thiss!992 () LongMap!978)

(declare-fun mapRest!4986 () (Array (_ BitVec 32) ValueCell!1142))

(assert (=> mapNonEmpty!4985 (= (arr!2349 (_values!2995 (v!3353 (underlying!500 thiss!992)))) (store mapRest!4986 mapKey!4985 mapValue!4986))))

(declare-fun mapIsEmpty!4986 () Bool)

(assert (=> mapIsEmpty!4986 mapRes!4986))

(declare-fun b!146160 () Bool)

(assert (=> b!146160 (= e!95319 tp_is_empty!2971)))

(declare-fun b!146161 () Bool)

(declare-fun e!95314 () Bool)

(declare-fun e!95322 () Bool)

(assert (=> b!146161 (= e!95314 e!95322)))

(declare-fun res!69559 () Bool)

(assert (=> b!146161 (=> (not res!69559) (not e!95322))))

(declare-datatypes ((tuple2!2682 0))(
  ( (tuple2!2683 (_1!1352 Bool) (_2!1352 LongMapFixedSize!1192)) )
))
(declare-fun lt!76840 () tuple2!2682)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146161 (= res!69559 (and (_1!1352 lt!76840) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4613 0))(
  ( (Unit!4614) )
))
(declare-fun lt!76837 () Unit!4613)

(declare-fun e!95320 () Unit!4613)

(assert (=> b!146161 (= lt!76837 e!95320)))

(declare-datatypes ((tuple2!2684 0))(
  ( (tuple2!2685 (_1!1353 (_ BitVec 64)) (_2!1353 V!3609)) )
))
(declare-datatypes ((List!1754 0))(
  ( (Nil!1751) (Cons!1750 (h!2358 tuple2!2684) (t!6439 List!1754)) )
))
(declare-datatypes ((ListLongMap!1715 0))(
  ( (ListLongMap!1716 (toList!873 List!1754)) )
))
(declare-fun lt!76839 () ListLongMap!1715)

(declare-fun c!27621 () Bool)

(declare-fun contains!931 (ListLongMap!1715 (_ BitVec 64)) Bool)

(assert (=> b!146161 (= c!27621 (contains!931 lt!76839 (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355)))))

(declare-fun lt!76844 () V!3609)

(declare-fun update!224 (LongMapFixedSize!1192 (_ BitVec 64) V!3609) tuple2!2682)

(assert (=> b!146161 (= lt!76840 (update!224 newMap!16 (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76844))))

(declare-fun b!146162 () Bool)

(declare-fun e!95325 () Bool)

(assert (=> b!146162 (= e!95325 tp_is_empty!2971)))

(declare-fun b!146164 () Bool)

(declare-fun res!69558 () Bool)

(declare-fun e!95321 () Bool)

(assert (=> b!146164 (=> (not res!69558) (not e!95321))))

(declare-fun valid!596 (LongMapFixedSize!1192) Bool)

(assert (=> b!146164 (= res!69558 (valid!596 newMap!16))))

(declare-fun mapNonEmpty!4986 () Bool)

(declare-fun tp!11831 () Bool)

(declare-fun e!95324 () Bool)

(assert (=> mapNonEmpty!4986 (= mapRes!4985 (and tp!11831 e!95324))))

(declare-fun mapRest!4985 () (Array (_ BitVec 32) ValueCell!1142))

(declare-fun mapValue!4985 () ValueCell!1142)

(declare-fun mapKey!4986 () (_ BitVec 32))

(assert (=> mapNonEmpty!4986 (= (arr!2349 (_values!2995 newMap!16)) (store mapRest!4985 mapKey!4986 mapValue!4985))))

(declare-fun b!146165 () Bool)

(declare-fun e!95328 () Bool)

(assert (=> b!146165 (= e!95330 e!95328)))

(declare-fun b!146166 () Bool)

(declare-fun Unit!4615 () Unit!4613)

(assert (=> b!146166 (= e!95320 Unit!4615)))

(declare-fun b!146167 () Bool)

(declare-fun Unit!4616 () Unit!4613)

(assert (=> b!146167 (= e!95320 Unit!4616)))

(declare-fun lt!76842 () Unit!4613)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!153 (array!4973 array!4975 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 64) (_ BitVec 32) Int) Unit!4613)

(assert (=> b!146167 (= lt!76842 (lemmaListMapContainsThenArrayContainsFrom!153 (_keys!4781 (v!3353 (underlying!500 thiss!992))) (_values!2995 (v!3353 (underlying!500 thiss!992))) (mask!7388 (v!3353 (underlying!500 thiss!992))) (extraKeys!2757 (v!3353 (underlying!500 thiss!992))) (zeroValue!2857 (v!3353 (underlying!500 thiss!992))) (minValue!2857 (v!3353 (underlying!500 thiss!992))) (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146167 (arrayContainsKey!0 (_keys!4781 (v!3353 (underlying!500 thiss!992))) (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76834 () Unit!4613)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4973 (_ BitVec 32) (_ BitVec 32)) Unit!4613)

(assert (=> b!146167 (= lt!76834 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4781 (v!3353 (underlying!500 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1755 0))(
  ( (Nil!1752) (Cons!1751 (h!2359 (_ BitVec 64)) (t!6440 List!1755)) )
))
(declare-fun arrayNoDuplicates!0 (array!4973 (_ BitVec 32) List!1755) Bool)

(assert (=> b!146167 (arrayNoDuplicates!0 (_keys!4781 (v!3353 (underlying!500 thiss!992))) from!355 Nil!1752)))

(declare-fun lt!76838 () Unit!4613)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4973 (_ BitVec 32) (_ BitVec 64) List!1755) Unit!4613)

(assert (=> b!146167 (= lt!76838 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4781 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) (Cons!1751 (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) Nil!1752)))))

(assert (=> b!146167 false))

(declare-fun b!146168 () Bool)

(assert (=> b!146168 (= e!95322 (not true))))

(declare-fun lt!76841 () ListLongMap!1715)

(declare-fun lt!76836 () tuple2!2684)

(declare-fun lt!76843 () tuple2!2684)

(declare-fun +!178 (ListLongMap!1715 tuple2!2684) ListLongMap!1715)

(assert (=> b!146168 (= (+!178 (+!178 lt!76841 lt!76836) lt!76843) (+!178 (+!178 lt!76841 lt!76843) lt!76836))))

(assert (=> b!146168 (= lt!76843 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2857 (v!3353 (underlying!500 thiss!992)))))))

(assert (=> b!146168 (= lt!76836 (tuple2!2685 (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76844))))

(declare-fun lt!76845 () Unit!4613)

(declare-fun addCommutativeForDiffKeys!72 (ListLongMap!1715 (_ BitVec 64) V!3609 (_ BitVec 64) V!3609) Unit!4613)

(assert (=> b!146168 (= lt!76845 (addCommutativeForDiffKeys!72 lt!76841 (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) lt!76844 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2857 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!146 (array!4973 array!4975 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 32) Int) ListLongMap!1715)

(assert (=> b!146168 (= lt!76841 (getCurrentListMapNoExtraKeys!146 (_keys!4781 (v!3353 (underlying!500 thiss!992))) (_values!2995 (v!3353 (underlying!500 thiss!992))) (mask!7388 (v!3353 (underlying!500 thiss!992))) (extraKeys!2757 (v!3353 (underlying!500 thiss!992))) (zeroValue!2857 (v!3353 (underlying!500 thiss!992))) (minValue!2857 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun b!146169 () Bool)

(declare-fun e!95317 () Bool)

(assert (=> b!146169 (= e!95321 e!95317)))

(declare-fun res!69556 () Bool)

(assert (=> b!146169 (=> (not res!69556) (not e!95317))))

(declare-fun lt!76835 () ListLongMap!1715)

(assert (=> b!146169 (= res!69556 (= lt!76835 lt!76839))))

(declare-fun map!1456 (LongMapFixedSize!1192) ListLongMap!1715)

(assert (=> b!146169 (= lt!76839 (map!1456 newMap!16))))

(declare-fun getCurrentListMap!544 (array!4973 array!4975 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 32) Int) ListLongMap!1715)

(assert (=> b!146169 (= lt!76835 (getCurrentListMap!544 (_keys!4781 (v!3353 (underlying!500 thiss!992))) (_values!2995 (v!3353 (underlying!500 thiss!992))) (mask!7388 (v!3353 (underlying!500 thiss!992))) (extraKeys!2757 (v!3353 (underlying!500 thiss!992))) (zeroValue!2857 (v!3353 (underlying!500 thiss!992))) (minValue!2857 (v!3353 (underlying!500 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3353 (underlying!500 thiss!992)))))))

(declare-fun b!146170 () Bool)

(declare-fun e!95323 () Bool)

(assert (=> b!146170 (= e!95316 (and e!95323 mapRes!4985))))

(declare-fun condMapEmpty!4986 () Bool)

(declare-fun mapDefault!4985 () ValueCell!1142)

(assert (=> b!146170 (= condMapEmpty!4986 (= (arr!2349 (_values!2995 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1142)) mapDefault!4985)))))

(declare-fun b!146163 () Bool)

(assert (=> b!146163 (= e!95323 tp_is_empty!2971)))

(declare-fun res!69562 () Bool)

(assert (=> start!15206 (=> (not res!69562) (not e!95321))))

(declare-fun valid!597 (LongMap!978) Bool)

(assert (=> start!15206 (= res!69562 (valid!597 thiss!992))))

(assert (=> start!15206 e!95321))

(assert (=> start!15206 e!95326))

(assert (=> start!15206 true))

(assert (=> start!15206 e!95318))

(declare-fun b!146171 () Bool)

(declare-fun res!69561 () Bool)

(assert (=> b!146171 (=> (not res!69561) (not e!95321))))

(assert (=> b!146171 (= res!69561 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2624 (_keys!4781 (v!3353 (underlying!500 thiss!992)))))))))

(declare-fun b!146172 () Bool)

(declare-fun e!95315 () Bool)

(assert (=> b!146172 (= e!95315 (and e!95325 mapRes!4986))))

(declare-fun condMapEmpty!4985 () Bool)

(declare-fun mapDefault!4986 () ValueCell!1142)

(assert (=> b!146172 (= condMapEmpty!4985 (= (arr!2349 (_values!2995 (v!3353 (underlying!500 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1142)) mapDefault!4986)))))

(declare-fun b!146173 () Bool)

(assert (=> b!146173 (= e!95317 e!95314)))

(declare-fun res!69557 () Bool)

(assert (=> b!146173 (=> (not res!69557) (not e!95314))))

(assert (=> b!146173 (= res!69557 (and (not (= (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2348 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1574 (ValueCell!1142 V!3609) V!3609)

(declare-fun dynLambda!454 (Int (_ BitVec 64)) V!3609)

(assert (=> b!146173 (= lt!76844 (get!1574 (select (arr!2349 (_values!2995 (v!3353 (underlying!500 thiss!992)))) from!355) (dynLambda!454 (defaultEntry!3012 (v!3353 (underlying!500 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146174 () Bool)

(declare-fun res!69560 () Bool)

(assert (=> b!146174 (=> (not res!69560) (not e!95321))))

(assert (=> b!146174 (= res!69560 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7388 newMap!16)) (_size!645 (v!3353 (underlying!500 thiss!992)))))))

(assert (=> b!146175 (= e!95328 (and tp!11829 tp_is_empty!2971 (array_inv!1471 (_keys!4781 (v!3353 (underlying!500 thiss!992)))) (array_inv!1472 (_values!2995 (v!3353 (underlying!500 thiss!992)))) e!95315))))

(declare-fun b!146176 () Bool)

(assert (=> b!146176 (= e!95324 tp_is_empty!2971)))

(assert (= (and start!15206 res!69562) b!146171))

(assert (= (and b!146171 res!69561) b!146164))

(assert (= (and b!146164 res!69558) b!146174))

(assert (= (and b!146174 res!69560) b!146169))

(assert (= (and b!146169 res!69556) b!146173))

(assert (= (and b!146173 res!69557) b!146161))

(assert (= (and b!146161 c!27621) b!146167))

(assert (= (and b!146161 (not c!27621)) b!146166))

(assert (= (and b!146161 res!69559) b!146168))

(assert (= (and b!146172 condMapEmpty!4985) mapIsEmpty!4986))

(assert (= (and b!146172 (not condMapEmpty!4985)) mapNonEmpty!4985))

(get-info :version)

(assert (= (and mapNonEmpty!4985 ((_ is ValueCellFull!1142) mapValue!4986)) b!146160))

(assert (= (and b!146172 ((_ is ValueCellFull!1142) mapDefault!4986)) b!146162))

(assert (= b!146175 b!146172))

(assert (= b!146165 b!146175))

(assert (= b!146159 b!146165))

(assert (= start!15206 b!146159))

(assert (= (and b!146170 condMapEmpty!4986) mapIsEmpty!4985))

(assert (= (and b!146170 (not condMapEmpty!4986)) mapNonEmpty!4986))

(assert (= (and mapNonEmpty!4986 ((_ is ValueCellFull!1142) mapValue!4985)) b!146176))

(assert (= (and b!146170 ((_ is ValueCellFull!1142) mapDefault!4985)) b!146163))

(assert (= b!146158 b!146170))

(assert (= start!15206 b!146158))

(declare-fun b_lambda!6557 () Bool)

(assert (=> (not b_lambda!6557) (not b!146173)))

(declare-fun t!6436 () Bool)

(declare-fun tb!2645 () Bool)

(assert (=> (and b!146175 (= (defaultEntry!3012 (v!3353 (underlying!500 thiss!992))) (defaultEntry!3012 (v!3353 (underlying!500 thiss!992)))) t!6436) tb!2645))

(declare-fun result!4327 () Bool)

(assert (=> tb!2645 (= result!4327 tp_is_empty!2971)))

(assert (=> b!146173 t!6436))

(declare-fun b_and!9141 () Bool)

(assert (= b_and!9137 (and (=> t!6436 result!4327) b_and!9141)))

(declare-fun tb!2647 () Bool)

(declare-fun t!6438 () Bool)

(assert (=> (and b!146158 (= (defaultEntry!3012 newMap!16) (defaultEntry!3012 (v!3353 (underlying!500 thiss!992)))) t!6438) tb!2647))

(declare-fun result!4331 () Bool)

(assert (= result!4331 result!4327))

(assert (=> b!146173 t!6438))

(declare-fun b_and!9143 () Bool)

(assert (= b_and!9139 (and (=> t!6438 result!4331) b_and!9143)))

(declare-fun m!175911 () Bool)

(assert (=> start!15206 m!175911))

(declare-fun m!175913 () Bool)

(assert (=> b!146169 m!175913))

(declare-fun m!175915 () Bool)

(assert (=> b!146169 m!175915))

(declare-fun m!175917 () Bool)

(assert (=> mapNonEmpty!4985 m!175917))

(declare-fun m!175919 () Bool)

(assert (=> b!146175 m!175919))

(declare-fun m!175921 () Bool)

(assert (=> b!146175 m!175921))

(declare-fun m!175923 () Bool)

(assert (=> b!146167 m!175923))

(declare-fun m!175925 () Bool)

(assert (=> b!146167 m!175925))

(declare-fun m!175927 () Bool)

(assert (=> b!146167 m!175927))

(declare-fun m!175929 () Bool)

(assert (=> b!146167 m!175929))

(assert (=> b!146167 m!175927))

(assert (=> b!146167 m!175927))

(declare-fun m!175931 () Bool)

(assert (=> b!146167 m!175931))

(assert (=> b!146167 m!175927))

(declare-fun m!175933 () Bool)

(assert (=> b!146167 m!175933))

(declare-fun m!175935 () Bool)

(assert (=> b!146158 m!175935))

(declare-fun m!175937 () Bool)

(assert (=> b!146158 m!175937))

(declare-fun m!175939 () Bool)

(assert (=> b!146168 m!175939))

(assert (=> b!146168 m!175927))

(declare-fun m!175941 () Bool)

(assert (=> b!146168 m!175941))

(declare-fun m!175943 () Bool)

(assert (=> b!146168 m!175943))

(assert (=> b!146168 m!175939))

(declare-fun m!175945 () Bool)

(assert (=> b!146168 m!175945))

(declare-fun m!175947 () Bool)

(assert (=> b!146168 m!175947))

(assert (=> b!146168 m!175941))

(assert (=> b!146168 m!175927))

(declare-fun m!175949 () Bool)

(assert (=> b!146168 m!175949))

(assert (=> b!146173 m!175927))

(declare-fun m!175951 () Bool)

(assert (=> b!146173 m!175951))

(declare-fun m!175953 () Bool)

(assert (=> b!146173 m!175953))

(assert (=> b!146173 m!175951))

(assert (=> b!146173 m!175953))

(declare-fun m!175955 () Bool)

(assert (=> b!146173 m!175955))

(declare-fun m!175957 () Bool)

(assert (=> mapNonEmpty!4986 m!175957))

(assert (=> b!146161 m!175927))

(assert (=> b!146161 m!175927))

(declare-fun m!175959 () Bool)

(assert (=> b!146161 m!175959))

(assert (=> b!146161 m!175927))

(declare-fun m!175961 () Bool)

(assert (=> b!146161 m!175961))

(declare-fun m!175963 () Bool)

(assert (=> b!146164 m!175963))

(check-sat (not b!146173) (not b_lambda!6557) (not b!146158) (not b_next!3109) (not b!146161) (not b!146169) b_and!9143 (not b!146175) tp_is_empty!2971 b_and!9141 (not b_next!3111) (not start!15206) (not b!146164) (not b!146168) (not mapNonEmpty!4985) (not mapNonEmpty!4986) (not b!146167))
(check-sat b_and!9141 b_and!9143 (not b_next!3109) (not b_next!3111))
