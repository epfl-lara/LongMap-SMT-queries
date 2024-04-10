; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84456 () Bool)

(assert start!84456)

(declare-fun b_free!20007 () Bool)

(declare-fun b_next!20007 () Bool)

(assert (=> start!84456 (= b_free!20007 (not b_next!20007))))

(declare-fun tp!69801 () Bool)

(declare-fun b_and!32081 () Bool)

(assert (=> start!84456 (= tp!69801 b_and!32081)))

(declare-fun b!987840 () Bool)

(declare-fun res!660850 () Bool)

(declare-fun e!557020 () Bool)

(assert (=> b!987840 (=> (not res!660850) (not e!557020))))

(declare-datatypes ((array!62405 0))(
  ( (array!62406 (arr!30058 (Array (_ BitVec 32) (_ BitVec 64))) (size!30537 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62405)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987840 (= res!660850 (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun b!987841 () Bool)

(declare-fun e!557016 () Bool)

(declare-fun tp_is_empty!23223 () Bool)

(assert (=> b!987841 (= e!557016 tp_is_empty!23223)))

(declare-fun b!987842 () Bool)

(declare-fun e!557015 () Bool)

(assert (=> b!987842 (= e!557015 tp_is_empty!23223)))

(declare-fun b!987843 () Bool)

(declare-fun e!557018 () Bool)

(declare-fun mapRes!36869 () Bool)

(assert (=> b!987843 (= e!557018 (and e!557016 mapRes!36869))))

(declare-fun condMapEmpty!36869 () Bool)

(declare-datatypes ((V!35947 0))(
  ( (V!35948 (val!11662 Int)) )
))
(declare-datatypes ((ValueCell!11130 0))(
  ( (ValueCellFull!11130 (v!14226 V!35947)) (EmptyCell!11130) )
))
(declare-datatypes ((array!62407 0))(
  ( (array!62408 (arr!30059 (Array (_ BitVec 32) ValueCell!11130)) (size!30538 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62407)

(declare-fun mapDefault!36869 () ValueCell!11130)

(assert (=> b!987843 (= condMapEmpty!36869 (= (arr!30059 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11130)) mapDefault!36869)))))

(declare-fun mapIsEmpty!36869 () Bool)

(assert (=> mapIsEmpty!36869 mapRes!36869))

(declare-fun b!987844 () Bool)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35947)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14858 0))(
  ( (tuple2!14859 (_1!7440 (_ BitVec 64)) (_2!7440 V!35947)) )
))
(declare-fun lt!438074 () tuple2!14858)

(declare-fun e!557017 () Bool)

(declare-fun zeroValue!1220 () V!35947)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((List!20789 0))(
  ( (Nil!20786) (Cons!20785 (h!21947 tuple2!14858) (t!29724 List!20789)) )
))
(declare-datatypes ((ListLongMap!13555 0))(
  ( (ListLongMap!13556 (toList!6793 List!20789)) )
))
(declare-fun getCurrentListMap!3860 (array!62405 array!62407 (_ BitVec 32) (_ BitVec 32) V!35947 V!35947 (_ BitVec 32) Int) ListLongMap!13555)

(declare-fun +!3078 (ListLongMap!13555 tuple2!14858) ListLongMap!13555)

(assert (=> b!987844 (= e!557017 (= (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3078 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438074)))))

(declare-fun lt!438069 () ListLongMap!13555)

(declare-fun lt!438066 () ListLongMap!13555)

(declare-fun lt!438068 () tuple2!14858)

(assert (=> b!987844 (= lt!438066 (+!3078 (+!3078 lt!438069 lt!438074) lt!438068))))

(declare-fun lt!438070 () V!35947)

(declare-datatypes ((Unit!32789 0))(
  ( (Unit!32790) )
))
(declare-fun lt!438071 () Unit!32789)

(declare-fun addCommutativeForDiffKeys!702 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64) V!35947) Unit!32789)

(assert (=> b!987844 (= lt!438071 (addCommutativeForDiffKeys!702 lt!438069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070))))

(declare-fun b!987845 () Bool)

(declare-fun res!660843 () Bool)

(assert (=> b!987845 (=> (not res!660843) (not e!557020))))

(assert (=> b!987845 (= res!660843 (and (= (size!30538 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30537 _keys!1544) (size!30538 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!660847 () Bool)

(assert (=> start!84456 (=> (not res!660847) (not e!557020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84456 (= res!660847 (validMask!0 mask!1948))))

(assert (=> start!84456 e!557020))

(assert (=> start!84456 true))

(assert (=> start!84456 tp_is_empty!23223))

(declare-fun array_inv!23227 (array!62407) Bool)

(assert (=> start!84456 (and (array_inv!23227 _values!1278) e!557018)))

(assert (=> start!84456 tp!69801))

(declare-fun array_inv!23228 (array!62405) Bool)

(assert (=> start!84456 (array_inv!23228 _keys!1544)))

(declare-fun b!987846 () Bool)

(declare-fun res!660844 () Bool)

(assert (=> b!987846 (=> (not res!660844) (not e!557020))))

(declare-datatypes ((List!20790 0))(
  ( (Nil!20787) (Cons!20786 (h!21948 (_ BitVec 64)) (t!29725 List!20790)) )
))
(declare-fun arrayNoDuplicates!0 (array!62405 (_ BitVec 32) List!20790) Bool)

(assert (=> b!987846 (= res!660844 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20787))))

(declare-fun b!987847 () Bool)

(declare-fun res!660848 () Bool)

(assert (=> b!987847 (=> (not res!660848) (not e!557020))))

(assert (=> b!987847 (= res!660848 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987848 () Bool)

(declare-fun res!660846 () Bool)

(assert (=> b!987848 (=> (not res!660846) (not e!557020))))

(assert (=> b!987848 (= res!660846 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544))))))

(declare-fun mapNonEmpty!36869 () Bool)

(declare-fun tp!69802 () Bool)

(assert (=> mapNonEmpty!36869 (= mapRes!36869 (and tp!69802 e!557015))))

(declare-fun mapKey!36869 () (_ BitVec 32))

(declare-fun mapRest!36869 () (Array (_ BitVec 32) ValueCell!11130))

(declare-fun mapValue!36869 () ValueCell!11130)

(assert (=> mapNonEmpty!36869 (= (arr!30059 _values!1278) (store mapRest!36869 mapKey!36869 mapValue!36869))))

(declare-fun b!987849 () Bool)

(declare-fun res!660849 () Bool)

(assert (=> b!987849 (=> (not res!660849) (not e!557020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62405 (_ BitVec 32)) Bool)

(assert (=> b!987849 (= res!660849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987850 () Bool)

(assert (=> b!987850 (= e!557020 (not e!557017))))

(declare-fun res!660845 () Bool)

(assert (=> b!987850 (=> res!660845 e!557017)))

(assert (=> b!987850 (= res!660845 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun lt!438067 () tuple2!14858)

(declare-fun lt!438072 () ListLongMap!13555)

(assert (=> b!987850 (= (+!3078 lt!438072 lt!438074) (+!3078 lt!438066 lt!438067))))

(declare-fun lt!438075 () ListLongMap!13555)

(assert (=> b!987850 (= lt!438066 (+!3078 lt!438075 lt!438074))))

(assert (=> b!987850 (= lt!438074 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))

(assert (=> b!987850 (= lt!438072 (+!3078 lt!438075 lt!438067))))

(assert (=> b!987850 (= lt!438067 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!438073 () Unit!32789)

(assert (=> b!987850 (= lt!438073 (addCommutativeForDiffKeys!702 lt!438075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070))))

(declare-fun get!15598 (ValueCell!11130 V!35947) V!35947)

(declare-fun dynLambda!1861 (Int (_ BitVec 64)) V!35947)

(assert (=> b!987850 (= lt!438070 (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987850 (= lt!438075 (+!3078 lt!438069 lt!438068))))

(assert (=> b!987850 (= lt!438068 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3484 (array!62405 array!62407 (_ BitVec 32) (_ BitVec 32) V!35947 V!35947 (_ BitVec 32) Int) ListLongMap!13555)

(assert (=> b!987850 (= lt!438069 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84456 res!660847) b!987845))

(assert (= (and b!987845 res!660843) b!987849))

(assert (= (and b!987849 res!660849) b!987846))

(assert (= (and b!987846 res!660844) b!987848))

(assert (= (and b!987848 res!660846) b!987840))

(assert (= (and b!987840 res!660850) b!987847))

(assert (= (and b!987847 res!660848) b!987850))

(assert (= (and b!987850 (not res!660845)) b!987844))

(assert (= (and b!987843 condMapEmpty!36869) mapIsEmpty!36869))

(assert (= (and b!987843 (not condMapEmpty!36869)) mapNonEmpty!36869))

(get-info :version)

(assert (= (and mapNonEmpty!36869 ((_ is ValueCellFull!11130) mapValue!36869)) b!987842))

(assert (= (and b!987843 ((_ is ValueCellFull!11130) mapDefault!36869)) b!987841))

(assert (= start!84456 b!987843))

(declare-fun b_lambda!15039 () Bool)

(assert (=> (not b_lambda!15039) (not b!987850)))

(declare-fun t!29723 () Bool)

(declare-fun tb!6785 () Bool)

(assert (=> (and start!84456 (= defaultEntry!1281 defaultEntry!1281) t!29723) tb!6785))

(declare-fun result!13563 () Bool)

(assert (=> tb!6785 (= result!13563 tp_is_empty!23223)))

(assert (=> b!987850 t!29723))

(declare-fun b_and!32083 () Bool)

(assert (= b_and!32081 (and (=> t!29723 result!13563) b_and!32083)))

(declare-fun m!914539 () Bool)

(assert (=> start!84456 m!914539))

(declare-fun m!914541 () Bool)

(assert (=> start!84456 m!914541))

(declare-fun m!914543 () Bool)

(assert (=> start!84456 m!914543))

(declare-fun m!914545 () Bool)

(assert (=> b!987844 m!914545))

(declare-fun m!914547 () Bool)

(assert (=> b!987844 m!914547))

(declare-fun m!914549 () Bool)

(assert (=> b!987844 m!914549))

(declare-fun m!914551 () Bool)

(assert (=> b!987844 m!914551))

(assert (=> b!987844 m!914545))

(declare-fun m!914553 () Bool)

(assert (=> b!987844 m!914553))

(assert (=> b!987844 m!914551))

(declare-fun m!914555 () Bool)

(assert (=> b!987844 m!914555))

(assert (=> b!987844 m!914547))

(declare-fun m!914557 () Bool)

(assert (=> b!987844 m!914557))

(declare-fun m!914559 () Bool)

(assert (=> b!987846 m!914559))

(declare-fun m!914561 () Bool)

(assert (=> b!987849 m!914561))

(declare-fun m!914563 () Bool)

(assert (=> mapNonEmpty!36869 m!914563))

(assert (=> b!987850 m!914545))

(declare-fun m!914565 () Bool)

(assert (=> b!987850 m!914565))

(declare-fun m!914567 () Bool)

(assert (=> b!987850 m!914567))

(declare-fun m!914569 () Bool)

(assert (=> b!987850 m!914569))

(declare-fun m!914571 () Bool)

(assert (=> b!987850 m!914571))

(declare-fun m!914573 () Bool)

(assert (=> b!987850 m!914573))

(declare-fun m!914575 () Bool)

(assert (=> b!987850 m!914575))

(declare-fun m!914577 () Bool)

(assert (=> b!987850 m!914577))

(assert (=> b!987850 m!914545))

(declare-fun m!914579 () Bool)

(assert (=> b!987850 m!914579))

(declare-fun m!914581 () Bool)

(assert (=> b!987850 m!914581))

(assert (=> b!987850 m!914565))

(assert (=> b!987850 m!914581))

(declare-fun m!914583 () Bool)

(assert (=> b!987850 m!914583))

(assert (=> b!987840 m!914545))

(assert (=> b!987840 m!914545))

(declare-fun m!914585 () Bool)

(assert (=> b!987840 m!914585))

(check-sat (not start!84456) tp_is_empty!23223 (not b!987850) (not b_lambda!15039) (not b_next!20007) (not mapNonEmpty!36869) (not b!987844) b_and!32083 (not b!987849) (not b!987846) (not b!987840))
(check-sat b_and!32083 (not b_next!20007))
(get-model)

(declare-fun b_lambda!15043 () Bool)

(assert (= b_lambda!15039 (or (and start!84456 b_free!20007) b_lambda!15043)))

(check-sat tp_is_empty!23223 (not b!987850) (not b_next!20007) (not mapNonEmpty!36869) (not b!987844) b_and!32083 (not b_lambda!15043) (not start!84456) (not b!987849) (not b!987846) (not b!987840))
(check-sat b_and!32083 (not b_next!20007))
(get-model)

(declare-fun d!116959 () Bool)

(assert (=> d!116959 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84456 d!116959))

(declare-fun d!116961 () Bool)

(assert (=> d!116961 (= (array_inv!23227 _values!1278) (bvsge (size!30538 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84456 d!116961))

(declare-fun d!116963 () Bool)

(assert (=> d!116963 (= (array_inv!23228 _keys!1544) (bvsge (size!30537 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84456 d!116963))

(declare-fun d!116965 () Bool)

(assert (=> d!116965 (= (+!3078 (+!3078 lt!438069 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (+!3078 (+!3078 lt!438069 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!438108 () Unit!32789)

(declare-fun choose!1605 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64) V!35947) Unit!32789)

(assert (=> d!116965 (= lt!438108 (choose!1605 lt!438069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070))))

(assert (=> d!116965 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> d!116965 (= (addCommutativeForDiffKeys!702 lt!438069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070) lt!438108)))

(declare-fun bs!28031 () Bool)

(assert (= bs!28031 d!116965))

(declare-fun m!914635 () Bool)

(assert (=> bs!28031 m!914635))

(assert (=> bs!28031 m!914635))

(declare-fun m!914637 () Bool)

(assert (=> bs!28031 m!914637))

(declare-fun m!914639 () Bool)

(assert (=> bs!28031 m!914639))

(assert (=> bs!28031 m!914545))

(declare-fun m!914641 () Bool)

(assert (=> bs!28031 m!914641))

(assert (=> bs!28031 m!914639))

(declare-fun m!914643 () Bool)

(assert (=> bs!28031 m!914643))

(assert (=> b!987844 d!116965))

(declare-fun d!116967 () Bool)

(declare-fun e!557041 () Bool)

(assert (=> d!116967 e!557041))

(declare-fun res!660880 () Bool)

(assert (=> d!116967 (=> (not res!660880) (not e!557041))))

(declare-fun lt!438120 () ListLongMap!13555)

(declare-fun contains!5713 (ListLongMap!13555 (_ BitVec 64)) Bool)

(assert (=> d!116967 (= res!660880 (contains!5713 lt!438120 (_1!7440 lt!438074)))))

(declare-fun lt!438117 () List!20789)

(assert (=> d!116967 (= lt!438120 (ListLongMap!13556 lt!438117))))

(declare-fun lt!438118 () Unit!32789)

(declare-fun lt!438119 () Unit!32789)

(assert (=> d!116967 (= lt!438118 lt!438119)))

(declare-datatypes ((Option!518 0))(
  ( (Some!517 (v!14228 V!35947)) (None!516) )
))
(declare-fun getValueByKey!512 (List!20789 (_ BitVec 64)) Option!518)

(assert (=> d!116967 (= (getValueByKey!512 lt!438117 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(declare-fun lemmaContainsTupThenGetReturnValue!271 (List!20789 (_ BitVec 64) V!35947) Unit!32789)

(assert (=> d!116967 (= lt!438119 (lemmaContainsTupThenGetReturnValue!271 lt!438117 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun insertStrictlySorted!328 (List!20789 (_ BitVec 64) V!35947) List!20789)

(assert (=> d!116967 (= lt!438117 (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116967 (= (+!3078 lt!438069 lt!438074) lt!438120)))

(declare-fun b!987892 () Bool)

(declare-fun res!660879 () Bool)

(assert (=> b!987892 (=> (not res!660879) (not e!557041))))

(assert (=> b!987892 (= res!660879 (= (getValueByKey!512 (toList!6793 lt!438120) (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074))))))

(declare-fun b!987893 () Bool)

(declare-fun contains!5714 (List!20789 tuple2!14858) Bool)

(assert (=> b!987893 (= e!557041 (contains!5714 (toList!6793 lt!438120) lt!438074))))

(assert (= (and d!116967 res!660880) b!987892))

(assert (= (and b!987892 res!660879) b!987893))

(declare-fun m!914645 () Bool)

(assert (=> d!116967 m!914645))

(declare-fun m!914647 () Bool)

(assert (=> d!116967 m!914647))

(declare-fun m!914649 () Bool)

(assert (=> d!116967 m!914649))

(declare-fun m!914651 () Bool)

(assert (=> d!116967 m!914651))

(declare-fun m!914653 () Bool)

(assert (=> b!987892 m!914653))

(declare-fun m!914655 () Bool)

(assert (=> b!987893 m!914655))

(assert (=> b!987844 d!116967))

(declare-fun b!987936 () Bool)

(declare-fun e!557071 () Bool)

(declare-fun e!557080 () Bool)

(assert (=> b!987936 (= e!557071 e!557080)))

(declare-fun c!100078 () Bool)

(assert (=> b!987936 (= c!100078 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987937 () Bool)

(declare-fun e!557069 () Bool)

(declare-fun lt!438180 () ListLongMap!13555)

(declare-fun apply!893 (ListLongMap!13555 (_ BitVec 64)) V!35947)

(assert (=> b!987937 (= e!557069 (= (apply!893 lt!438180 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!987938 () Bool)

(declare-fun e!557070 () ListLongMap!13555)

(declare-fun e!557072 () ListLongMap!13555)

(assert (=> b!987938 (= e!557070 e!557072)))

(declare-fun c!100074 () Bool)

(assert (=> b!987938 (= c!100074 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987939 () Bool)

(declare-fun call!41826 () ListLongMap!13555)

(assert (=> b!987939 (= e!557072 call!41826)))

(declare-fun b!987940 () Bool)

(declare-fun e!557068 () Bool)

(declare-fun call!41829 () Bool)

(assert (=> b!987940 (= e!557068 (not call!41829))))

(declare-fun b!987941 () Bool)

(declare-fun e!557077 () Bool)

(assert (=> b!987941 (= e!557077 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987942 () Bool)

(declare-fun e!557076 () Bool)

(assert (=> b!987942 (= e!557076 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987943 () Bool)

(declare-fun e!557079 () Unit!32789)

(declare-fun lt!438185 () Unit!32789)

(assert (=> b!987943 (= e!557079 lt!438185)))

(declare-fun lt!438168 () ListLongMap!13555)

(assert (=> b!987943 (= lt!438168 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438186 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438171 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438171 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438179 () Unit!32789)

(declare-fun addStillContains!614 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> b!987943 (= lt!438179 (addStillContains!614 lt!438168 lt!438186 zeroValue!1220 lt!438171))))

(assert (=> b!987943 (contains!5713 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220)) lt!438171)))

(declare-fun lt!438174 () Unit!32789)

(assert (=> b!987943 (= lt!438174 lt!438179)))

(declare-fun lt!438181 () ListLongMap!13555)

(assert (=> b!987943 (= lt!438181 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438175 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438175 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438166 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438166 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438167 () Unit!32789)

(declare-fun addApplyDifferent!474 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> b!987943 (= lt!438167 (addApplyDifferent!474 lt!438181 lt!438175 minValue!1220 lt!438166))))

(assert (=> b!987943 (= (apply!893 (+!3078 lt!438181 (tuple2!14859 lt!438175 minValue!1220)) lt!438166) (apply!893 lt!438181 lt!438166))))

(declare-fun lt!438165 () Unit!32789)

(assert (=> b!987943 (= lt!438165 lt!438167)))

(declare-fun lt!438176 () ListLongMap!13555)

(assert (=> b!987943 (= lt!438176 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438173 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438183 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438183 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438177 () Unit!32789)

(assert (=> b!987943 (= lt!438177 (addApplyDifferent!474 lt!438176 lt!438173 zeroValue!1220 lt!438183))))

(assert (=> b!987943 (= (apply!893 (+!3078 lt!438176 (tuple2!14859 lt!438173 zeroValue!1220)) lt!438183) (apply!893 lt!438176 lt!438183))))

(declare-fun lt!438182 () Unit!32789)

(assert (=> b!987943 (= lt!438182 lt!438177)))

(declare-fun lt!438178 () ListLongMap!13555)

(assert (=> b!987943 (= lt!438178 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438184 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438169 () (_ BitVec 64))

(assert (=> b!987943 (= lt!438169 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!987943 (= lt!438185 (addApplyDifferent!474 lt!438178 lt!438184 minValue!1220 lt!438169))))

(assert (=> b!987943 (= (apply!893 (+!3078 lt!438178 (tuple2!14859 lt!438184 minValue!1220)) lt!438169) (apply!893 lt!438178 lt!438169))))

(declare-fun b!987944 () Bool)

(declare-fun e!557073 () ListLongMap!13555)

(assert (=> b!987944 (= e!557073 call!41826)))

(declare-fun b!987945 () Bool)

(declare-fun call!41831 () ListLongMap!13555)

(assert (=> b!987945 (= e!557073 call!41831)))

(declare-fun e!557078 () Bool)

(declare-fun b!987946 () Bool)

(assert (=> b!987946 (= e!557078 (= (apply!893 lt!438180 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30538 _values!1278)))))

(assert (=> b!987946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun bm!41823 () Bool)

(declare-fun call!41832 () ListLongMap!13555)

(assert (=> bm!41823 (= call!41831 call!41832)))

(declare-fun b!987947 () Bool)

(declare-fun e!557075 () Bool)

(assert (=> b!987947 (= e!557068 e!557075)))

(declare-fun res!660900 () Bool)

(assert (=> b!987947 (= res!660900 call!41829)))

(assert (=> b!987947 (=> (not res!660900) (not e!557075))))

(declare-fun b!987948 () Bool)

(declare-fun c!100076 () Bool)

(assert (=> b!987948 (= c!100076 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!987948 (= e!557072 e!557073)))

(declare-fun b!987949 () Bool)

(declare-fun Unit!32791 () Unit!32789)

(assert (=> b!987949 (= e!557079 Unit!32791)))

(declare-fun b!987950 () Bool)

(declare-fun call!41827 () Bool)

(assert (=> b!987950 (= e!557080 (not call!41827))))

(declare-fun b!987951 () Bool)

(assert (=> b!987951 (= e!557080 e!557069)))

(declare-fun res!660907 () Bool)

(assert (=> b!987951 (= res!660907 call!41827)))

(assert (=> b!987951 (=> (not res!660907) (not e!557069))))

(declare-fun bm!41825 () Bool)

(declare-fun call!41828 () ListLongMap!13555)

(assert (=> bm!41825 (= call!41828 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun bm!41826 () Bool)

(assert (=> bm!41826 (= call!41827 (contains!5713 lt!438180 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987952 () Bool)

(declare-fun e!557074 () Bool)

(assert (=> b!987952 (= e!557074 e!557078)))

(declare-fun res!660903 () Bool)

(assert (=> b!987952 (=> (not res!660903) (not e!557078))))

(assert (=> b!987952 (= res!660903 (contains!5713 lt!438180 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987952 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun b!987953 () Bool)

(declare-fun res!660899 () Bool)

(assert (=> b!987953 (=> (not res!660899) (not e!557071))))

(assert (=> b!987953 (= res!660899 e!557068)))

(declare-fun c!100077 () Bool)

(assert (=> b!987953 (= c!100077 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41827 () Bool)

(declare-fun call!41830 () ListLongMap!13555)

(assert (=> bm!41827 (= call!41826 call!41830)))

(declare-fun b!987954 () Bool)

(declare-fun res!660901 () Bool)

(assert (=> b!987954 (=> (not res!660901) (not e!557071))))

(assert (=> b!987954 (= res!660901 e!557074)))

(declare-fun res!660905 () Bool)

(assert (=> b!987954 (=> res!660905 e!557074)))

(assert (=> b!987954 (= res!660905 (not e!557077))))

(declare-fun res!660902 () Bool)

(assert (=> b!987954 (=> (not res!660902) (not e!557077))))

(assert (=> b!987954 (= res!660902 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun c!100075 () Bool)

(declare-fun bm!41828 () Bool)

(assert (=> bm!41828 (= call!41830 (+!3078 (ite c!100075 call!41828 (ite c!100074 call!41832 call!41831)) (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!987955 () Bool)

(assert (=> b!987955 (= e!557070 (+!3078 call!41830 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41829 () Bool)

(assert (=> bm!41829 (= call!41829 (contains!5713 lt!438180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987956 () Bool)

(assert (=> b!987956 (= e!557075 (= (apply!893 lt!438180 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun d!116969 () Bool)

(assert (=> d!116969 e!557071))

(declare-fun res!660904 () Bool)

(assert (=> d!116969 (=> (not res!660904) (not e!557071))))

(assert (=> d!116969 (= res!660904 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))))

(declare-fun lt!438172 () ListLongMap!13555)

(assert (=> d!116969 (= lt!438180 lt!438172)))

(declare-fun lt!438170 () Unit!32789)

(assert (=> d!116969 (= lt!438170 e!557079)))

(declare-fun c!100079 () Bool)

(assert (=> d!116969 (= c!100079 e!557076)))

(declare-fun res!660906 () Bool)

(assert (=> d!116969 (=> (not res!660906) (not e!557076))))

(assert (=> d!116969 (= res!660906 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(assert (=> d!116969 (= lt!438172 e!557070)))

(assert (=> d!116969 (= c!100075 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116969 (validMask!0 mask!1948)))

(assert (=> d!116969 (= (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438180)))

(declare-fun bm!41824 () Bool)

(assert (=> bm!41824 (= call!41832 call!41828)))

(assert (= (and d!116969 c!100075) b!987955))

(assert (= (and d!116969 (not c!100075)) b!987938))

(assert (= (and b!987938 c!100074) b!987939))

(assert (= (and b!987938 (not c!100074)) b!987948))

(assert (= (and b!987948 c!100076) b!987944))

(assert (= (and b!987948 (not c!100076)) b!987945))

(assert (= (or b!987944 b!987945) bm!41823))

(assert (= (or b!987939 bm!41823) bm!41824))

(assert (= (or b!987939 b!987944) bm!41827))

(assert (= (or b!987955 bm!41824) bm!41825))

(assert (= (or b!987955 bm!41827) bm!41828))

(assert (= (and d!116969 res!660906) b!987942))

(assert (= (and d!116969 c!100079) b!987943))

(assert (= (and d!116969 (not c!100079)) b!987949))

(assert (= (and d!116969 res!660904) b!987954))

(assert (= (and b!987954 res!660902) b!987941))

(assert (= (and b!987954 (not res!660905)) b!987952))

(assert (= (and b!987952 res!660903) b!987946))

(assert (= (and b!987954 res!660901) b!987953))

(assert (= (and b!987953 c!100077) b!987947))

(assert (= (and b!987953 (not c!100077)) b!987940))

(assert (= (and b!987947 res!660900) b!987956))

(assert (= (or b!987947 b!987940) bm!41829))

(assert (= (and b!987953 res!660899) b!987936))

(assert (= (and b!987936 c!100078) b!987951))

(assert (= (and b!987936 (not c!100078)) b!987950))

(assert (= (and b!987951 res!660907) b!987937))

(assert (= (or b!987951 b!987950) bm!41826))

(declare-fun b_lambda!15045 () Bool)

(assert (=> (not b_lambda!15045) (not b!987946)))

(assert (=> b!987946 t!29723))

(declare-fun b_and!32089 () Bool)

(assert (= b_and!32083 (and (=> t!29723 result!13563) b_and!32089)))

(declare-fun m!914657 () Bool)

(assert (=> b!987937 m!914657))

(declare-fun m!914659 () Bool)

(assert (=> b!987941 m!914659))

(assert (=> b!987941 m!914659))

(declare-fun m!914661 () Bool)

(assert (=> b!987941 m!914661))

(assert (=> b!987952 m!914659))

(assert (=> b!987952 m!914659))

(declare-fun m!914663 () Bool)

(assert (=> b!987952 m!914663))

(declare-fun m!914665 () Bool)

(assert (=> bm!41828 m!914665))

(assert (=> b!987942 m!914659))

(assert (=> b!987942 m!914659))

(assert (=> b!987942 m!914661))

(declare-fun m!914667 () Bool)

(assert (=> b!987956 m!914667))

(assert (=> d!116969 m!914539))

(assert (=> b!987943 m!914577))

(declare-fun m!914669 () Bool)

(assert (=> b!987943 m!914669))

(declare-fun m!914671 () Bool)

(assert (=> b!987943 m!914671))

(declare-fun m!914673 () Bool)

(assert (=> b!987943 m!914673))

(declare-fun m!914675 () Bool)

(assert (=> b!987943 m!914675))

(declare-fun m!914677 () Bool)

(assert (=> b!987943 m!914677))

(declare-fun m!914679 () Bool)

(assert (=> b!987943 m!914679))

(declare-fun m!914681 () Bool)

(assert (=> b!987943 m!914681))

(assert (=> b!987943 m!914675))

(declare-fun m!914683 () Bool)

(assert (=> b!987943 m!914683))

(declare-fun m!914685 () Bool)

(assert (=> b!987943 m!914685))

(assert (=> b!987943 m!914685))

(declare-fun m!914687 () Bool)

(assert (=> b!987943 m!914687))

(assert (=> b!987943 m!914659))

(declare-fun m!914689 () Bool)

(assert (=> b!987943 m!914689))

(declare-fun m!914691 () Bool)

(assert (=> b!987943 m!914691))

(assert (=> b!987943 m!914669))

(declare-fun m!914693 () Bool)

(assert (=> b!987943 m!914693))

(declare-fun m!914695 () Bool)

(assert (=> b!987943 m!914695))

(declare-fun m!914697 () Bool)

(assert (=> b!987943 m!914697))

(assert (=> b!987943 m!914679))

(declare-fun m!914699 () Bool)

(assert (=> b!987955 m!914699))

(assert (=> b!987946 m!914581))

(declare-fun m!914701 () Bool)

(assert (=> b!987946 m!914701))

(assert (=> b!987946 m!914659))

(assert (=> b!987946 m!914659))

(declare-fun m!914703 () Bool)

(assert (=> b!987946 m!914703))

(assert (=> b!987946 m!914701))

(assert (=> b!987946 m!914581))

(declare-fun m!914705 () Bool)

(assert (=> b!987946 m!914705))

(assert (=> bm!41825 m!914577))

(declare-fun m!914707 () Bool)

(assert (=> bm!41829 m!914707))

(declare-fun m!914709 () Bool)

(assert (=> bm!41826 m!914709))

(assert (=> b!987844 d!116969))

(declare-fun d!116971 () Bool)

(declare-fun e!557081 () Bool)

(assert (=> d!116971 e!557081))

(declare-fun res!660909 () Bool)

(assert (=> d!116971 (=> (not res!660909) (not e!557081))))

(declare-fun lt!438190 () ListLongMap!13555)

(assert (=> d!116971 (= res!660909 (contains!5713 lt!438190 (_1!7440 lt!438068)))))

(declare-fun lt!438187 () List!20789)

(assert (=> d!116971 (= lt!438190 (ListLongMap!13556 lt!438187))))

(declare-fun lt!438188 () Unit!32789)

(declare-fun lt!438189 () Unit!32789)

(assert (=> d!116971 (= lt!438188 lt!438189)))

(assert (=> d!116971 (= (getValueByKey!512 lt!438187 (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068)))))

(assert (=> d!116971 (= lt!438189 (lemmaContainsTupThenGetReturnValue!271 lt!438187 (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(assert (=> d!116971 (= lt!438187 (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438069 lt!438074)) (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(assert (=> d!116971 (= (+!3078 (+!3078 lt!438069 lt!438074) lt!438068) lt!438190)))

(declare-fun b!987957 () Bool)

(declare-fun res!660908 () Bool)

(assert (=> b!987957 (=> (not res!660908) (not e!557081))))

(assert (=> b!987957 (= res!660908 (= (getValueByKey!512 (toList!6793 lt!438190) (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068))))))

(declare-fun b!987958 () Bool)

(assert (=> b!987958 (= e!557081 (contains!5714 (toList!6793 lt!438190) lt!438068))))

(assert (= (and d!116971 res!660909) b!987957))

(assert (= (and b!987957 res!660908) b!987958))

(declare-fun m!914711 () Bool)

(assert (=> d!116971 m!914711))

(declare-fun m!914713 () Bool)

(assert (=> d!116971 m!914713))

(declare-fun m!914715 () Bool)

(assert (=> d!116971 m!914715))

(declare-fun m!914717 () Bool)

(assert (=> d!116971 m!914717))

(declare-fun m!914719 () Bool)

(assert (=> b!987957 m!914719))

(declare-fun m!914721 () Bool)

(assert (=> b!987958 m!914721))

(assert (=> b!987844 d!116971))

(declare-fun d!116973 () Bool)

(declare-fun e!557082 () Bool)

(assert (=> d!116973 e!557082))

(declare-fun res!660911 () Bool)

(assert (=> d!116973 (=> (not res!660911) (not e!557082))))

(declare-fun lt!438194 () ListLongMap!13555)

(assert (=> d!116973 (= res!660911 (contains!5713 lt!438194 (_1!7440 lt!438074)))))

(declare-fun lt!438191 () List!20789)

(assert (=> d!116973 (= lt!438194 (ListLongMap!13556 lt!438191))))

(declare-fun lt!438192 () Unit!32789)

(declare-fun lt!438193 () Unit!32789)

(assert (=> d!116973 (= lt!438192 lt!438193)))

(assert (=> d!116973 (= (getValueByKey!512 lt!438191 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(assert (=> d!116973 (= lt!438193 (lemmaContainsTupThenGetReturnValue!271 lt!438191 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116973 (= lt!438191 (insertStrictlySorted!328 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116973 (= (+!3078 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438074) lt!438194)))

(declare-fun b!987959 () Bool)

(declare-fun res!660910 () Bool)

(assert (=> b!987959 (=> (not res!660910) (not e!557082))))

(assert (=> b!987959 (= res!660910 (= (getValueByKey!512 (toList!6793 lt!438194) (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074))))))

(declare-fun b!987960 () Bool)

(assert (=> b!987960 (= e!557082 (contains!5714 (toList!6793 lt!438194) lt!438074))))

(assert (= (and d!116973 res!660911) b!987959))

(assert (= (and b!987959 res!660910) b!987960))

(declare-fun m!914723 () Bool)

(assert (=> d!116973 m!914723))

(declare-fun m!914725 () Bool)

(assert (=> d!116973 m!914725))

(declare-fun m!914727 () Bool)

(assert (=> d!116973 m!914727))

(declare-fun m!914729 () Bool)

(assert (=> d!116973 m!914729))

(declare-fun m!914731 () Bool)

(assert (=> b!987959 m!914731))

(declare-fun m!914733 () Bool)

(assert (=> b!987960 m!914733))

(assert (=> b!987844 d!116973))

(declare-fun b!987961 () Bool)

(declare-fun e!557086 () Bool)

(declare-fun e!557095 () Bool)

(assert (=> b!987961 (= e!557086 e!557095)))

(declare-fun c!100084 () Bool)

(assert (=> b!987961 (= c!100084 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987962 () Bool)

(declare-fun e!557084 () Bool)

(declare-fun lt!438210 () ListLongMap!13555)

(assert (=> b!987962 (= e!557084 (= (apply!893 lt!438210 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!987963 () Bool)

(declare-fun e!557085 () ListLongMap!13555)

(declare-fun e!557087 () ListLongMap!13555)

(assert (=> b!987963 (= e!557085 e!557087)))

(declare-fun c!100080 () Bool)

(assert (=> b!987963 (= c!100080 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987964 () Bool)

(declare-fun call!41833 () ListLongMap!13555)

(assert (=> b!987964 (= e!557087 call!41833)))

(declare-fun b!987965 () Bool)

(declare-fun e!557083 () Bool)

(declare-fun call!41836 () Bool)

(assert (=> b!987965 (= e!557083 (not call!41836))))

(declare-fun b!987966 () Bool)

(declare-fun e!557092 () Bool)

(assert (=> b!987966 (= e!557092 (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun b!987967 () Bool)

(declare-fun e!557091 () Bool)

(assert (=> b!987967 (= e!557091 (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun b!987968 () Bool)

(declare-fun e!557094 () Unit!32789)

(declare-fun lt!438215 () Unit!32789)

(assert (=> b!987968 (= e!557094 lt!438215)))

(declare-fun lt!438198 () ListLongMap!13555)

(assert (=> b!987968 (= lt!438198 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438216 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438201 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438201 (select (arr!30058 _keys!1544) from!1932))))

(declare-fun lt!438209 () Unit!32789)

(assert (=> b!987968 (= lt!438209 (addStillContains!614 lt!438198 lt!438216 zeroValue!1220 lt!438201))))

(assert (=> b!987968 (contains!5713 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220)) lt!438201)))

(declare-fun lt!438204 () Unit!32789)

(assert (=> b!987968 (= lt!438204 lt!438209)))

(declare-fun lt!438211 () ListLongMap!13555)

(assert (=> b!987968 (= lt!438211 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438205 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438196 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438196 (select (arr!30058 _keys!1544) from!1932))))

(declare-fun lt!438197 () Unit!32789)

(assert (=> b!987968 (= lt!438197 (addApplyDifferent!474 lt!438211 lt!438205 minValue!1220 lt!438196))))

(assert (=> b!987968 (= (apply!893 (+!3078 lt!438211 (tuple2!14859 lt!438205 minValue!1220)) lt!438196) (apply!893 lt!438211 lt!438196))))

(declare-fun lt!438195 () Unit!32789)

(assert (=> b!987968 (= lt!438195 lt!438197)))

(declare-fun lt!438206 () ListLongMap!13555)

(assert (=> b!987968 (= lt!438206 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438203 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438213 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438213 (select (arr!30058 _keys!1544) from!1932))))

(declare-fun lt!438207 () Unit!32789)

(assert (=> b!987968 (= lt!438207 (addApplyDifferent!474 lt!438206 lt!438203 zeroValue!1220 lt!438213))))

(assert (=> b!987968 (= (apply!893 (+!3078 lt!438206 (tuple2!14859 lt!438203 zeroValue!1220)) lt!438213) (apply!893 lt!438206 lt!438213))))

(declare-fun lt!438212 () Unit!32789)

(assert (=> b!987968 (= lt!438212 lt!438207)))

(declare-fun lt!438208 () ListLongMap!13555)

(assert (=> b!987968 (= lt!438208 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438214 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438214 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438199 () (_ BitVec 64))

(assert (=> b!987968 (= lt!438199 (select (arr!30058 _keys!1544) from!1932))))

(assert (=> b!987968 (= lt!438215 (addApplyDifferent!474 lt!438208 lt!438214 minValue!1220 lt!438199))))

(assert (=> b!987968 (= (apply!893 (+!3078 lt!438208 (tuple2!14859 lt!438214 minValue!1220)) lt!438199) (apply!893 lt!438208 lt!438199))))

(declare-fun b!987969 () Bool)

(declare-fun e!557088 () ListLongMap!13555)

(assert (=> b!987969 (= e!557088 call!41833)))

(declare-fun b!987970 () Bool)

(declare-fun call!41838 () ListLongMap!13555)

(assert (=> b!987970 (= e!557088 call!41838)))

(declare-fun b!987971 () Bool)

(declare-fun e!557093 () Bool)

(assert (=> b!987971 (= e!557093 (= (apply!893 lt!438210 (select (arr!30058 _keys!1544) from!1932)) (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987971 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30538 _values!1278)))))

(assert (=> b!987971 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun bm!41830 () Bool)

(declare-fun call!41839 () ListLongMap!13555)

(assert (=> bm!41830 (= call!41838 call!41839)))

(declare-fun b!987972 () Bool)

(declare-fun e!557090 () Bool)

(assert (=> b!987972 (= e!557083 e!557090)))

(declare-fun res!660913 () Bool)

(assert (=> b!987972 (= res!660913 call!41836)))

(assert (=> b!987972 (=> (not res!660913) (not e!557090))))

(declare-fun b!987973 () Bool)

(declare-fun c!100082 () Bool)

(assert (=> b!987973 (= c!100082 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!987973 (= e!557087 e!557088)))

(declare-fun b!987974 () Bool)

(declare-fun Unit!32792 () Unit!32789)

(assert (=> b!987974 (= e!557094 Unit!32792)))

(declare-fun b!987975 () Bool)

(declare-fun call!41834 () Bool)

(assert (=> b!987975 (= e!557095 (not call!41834))))

(declare-fun b!987976 () Bool)

(assert (=> b!987976 (= e!557095 e!557084)))

(declare-fun res!660920 () Bool)

(assert (=> b!987976 (= res!660920 call!41834)))

(assert (=> b!987976 (=> (not res!660920) (not e!557084))))

(declare-fun bm!41832 () Bool)

(declare-fun call!41835 () ListLongMap!13555)

(assert (=> bm!41832 (= call!41835 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!41833 () Bool)

(assert (=> bm!41833 (= call!41834 (contains!5713 lt!438210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987977 () Bool)

(declare-fun e!557089 () Bool)

(assert (=> b!987977 (= e!557089 e!557093)))

(declare-fun res!660916 () Bool)

(assert (=> b!987977 (=> (not res!660916) (not e!557093))))

(assert (=> b!987977 (= res!660916 (contains!5713 lt!438210 (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> b!987977 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun b!987978 () Bool)

(declare-fun res!660912 () Bool)

(assert (=> b!987978 (=> (not res!660912) (not e!557086))))

(assert (=> b!987978 (= res!660912 e!557083)))

(declare-fun c!100083 () Bool)

(assert (=> b!987978 (= c!100083 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41834 () Bool)

(declare-fun call!41837 () ListLongMap!13555)

(assert (=> bm!41834 (= call!41833 call!41837)))

(declare-fun b!987979 () Bool)

(declare-fun res!660914 () Bool)

(assert (=> b!987979 (=> (not res!660914) (not e!557086))))

(assert (=> b!987979 (= res!660914 e!557089)))

(declare-fun res!660918 () Bool)

(assert (=> b!987979 (=> res!660918 e!557089)))

(assert (=> b!987979 (= res!660918 (not e!557092))))

(declare-fun res!660915 () Bool)

(assert (=> b!987979 (=> (not res!660915) (not e!557092))))

(assert (=> b!987979 (= res!660915 (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun c!100081 () Bool)

(declare-fun bm!41835 () Bool)

(assert (=> bm!41835 (= call!41837 (+!3078 (ite c!100081 call!41835 (ite c!100080 call!41839 call!41838)) (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!987980 () Bool)

(assert (=> b!987980 (= e!557085 (+!3078 call!41837 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41836 () Bool)

(assert (=> bm!41836 (= call!41836 (contains!5713 lt!438210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987981 () Bool)

(assert (=> b!987981 (= e!557090 (= (apply!893 lt!438210 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun d!116975 () Bool)

(assert (=> d!116975 e!557086))

(declare-fun res!660917 () Bool)

(assert (=> d!116975 (=> (not res!660917) (not e!557086))))

(assert (=> d!116975 (= res!660917 (or (bvsge from!1932 (size!30537 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544)))))))

(declare-fun lt!438202 () ListLongMap!13555)

(assert (=> d!116975 (= lt!438210 lt!438202)))

(declare-fun lt!438200 () Unit!32789)

(assert (=> d!116975 (= lt!438200 e!557094)))

(declare-fun c!100085 () Bool)

(assert (=> d!116975 (= c!100085 e!557091)))

(declare-fun res!660919 () Bool)

(assert (=> d!116975 (=> (not res!660919) (not e!557091))))

(assert (=> d!116975 (= res!660919 (bvslt from!1932 (size!30537 _keys!1544)))))

(assert (=> d!116975 (= lt!438202 e!557085)))

(assert (=> d!116975 (= c!100081 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116975 (validMask!0 mask!1948)))

(assert (=> d!116975 (= (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438210)))

(declare-fun bm!41831 () Bool)

(assert (=> bm!41831 (= call!41839 call!41835)))

(assert (= (and d!116975 c!100081) b!987980))

(assert (= (and d!116975 (not c!100081)) b!987963))

(assert (= (and b!987963 c!100080) b!987964))

(assert (= (and b!987963 (not c!100080)) b!987973))

(assert (= (and b!987973 c!100082) b!987969))

(assert (= (and b!987973 (not c!100082)) b!987970))

(assert (= (or b!987969 b!987970) bm!41830))

(assert (= (or b!987964 bm!41830) bm!41831))

(assert (= (or b!987964 b!987969) bm!41834))

(assert (= (or b!987980 bm!41831) bm!41832))

(assert (= (or b!987980 bm!41834) bm!41835))

(assert (= (and d!116975 res!660919) b!987967))

(assert (= (and d!116975 c!100085) b!987968))

(assert (= (and d!116975 (not c!100085)) b!987974))

(assert (= (and d!116975 res!660917) b!987979))

(assert (= (and b!987979 res!660915) b!987966))

(assert (= (and b!987979 (not res!660918)) b!987977))

(assert (= (and b!987977 res!660916) b!987971))

(assert (= (and b!987979 res!660914) b!987978))

(assert (= (and b!987978 c!100083) b!987972))

(assert (= (and b!987978 (not c!100083)) b!987965))

(assert (= (and b!987972 res!660913) b!987981))

(assert (= (or b!987972 b!987965) bm!41836))

(assert (= (and b!987978 res!660912) b!987961))

(assert (= (and b!987961 c!100084) b!987976))

(assert (= (and b!987961 (not c!100084)) b!987975))

(assert (= (and b!987976 res!660920) b!987962))

(assert (= (or b!987976 b!987975) bm!41833))

(declare-fun b_lambda!15047 () Bool)

(assert (=> (not b_lambda!15047) (not b!987971)))

(assert (=> b!987971 t!29723))

(declare-fun b_and!32091 () Bool)

(assert (= b_and!32089 (and (=> t!29723 result!13563) b_and!32091)))

(declare-fun m!914735 () Bool)

(assert (=> b!987962 m!914735))

(assert (=> b!987966 m!914545))

(assert (=> b!987966 m!914545))

(assert (=> b!987966 m!914585))

(assert (=> b!987977 m!914545))

(assert (=> b!987977 m!914545))

(declare-fun m!914737 () Bool)

(assert (=> b!987977 m!914737))

(declare-fun m!914739 () Bool)

(assert (=> bm!41835 m!914739))

(assert (=> b!987967 m!914545))

(assert (=> b!987967 m!914545))

(assert (=> b!987967 m!914585))

(declare-fun m!914741 () Bool)

(assert (=> b!987981 m!914741))

(assert (=> d!116975 m!914539))

(declare-fun m!914743 () Bool)

(assert (=> b!987968 m!914743))

(declare-fun m!914745 () Bool)

(assert (=> b!987968 m!914745))

(declare-fun m!914747 () Bool)

(assert (=> b!987968 m!914747))

(declare-fun m!914749 () Bool)

(assert (=> b!987968 m!914749))

(declare-fun m!914751 () Bool)

(assert (=> b!987968 m!914751))

(declare-fun m!914753 () Bool)

(assert (=> b!987968 m!914753))

(declare-fun m!914755 () Bool)

(assert (=> b!987968 m!914755))

(declare-fun m!914757 () Bool)

(assert (=> b!987968 m!914757))

(assert (=> b!987968 m!914751))

(declare-fun m!914759 () Bool)

(assert (=> b!987968 m!914759))

(declare-fun m!914761 () Bool)

(assert (=> b!987968 m!914761))

(assert (=> b!987968 m!914761))

(declare-fun m!914763 () Bool)

(assert (=> b!987968 m!914763))

(assert (=> b!987968 m!914545))

(declare-fun m!914765 () Bool)

(assert (=> b!987968 m!914765))

(declare-fun m!914767 () Bool)

(assert (=> b!987968 m!914767))

(assert (=> b!987968 m!914745))

(declare-fun m!914769 () Bool)

(assert (=> b!987968 m!914769))

(declare-fun m!914771 () Bool)

(assert (=> b!987968 m!914771))

(declare-fun m!914773 () Bool)

(assert (=> b!987968 m!914773))

(assert (=> b!987968 m!914755))

(declare-fun m!914775 () Bool)

(assert (=> b!987980 m!914775))

(assert (=> b!987971 m!914581))

(assert (=> b!987971 m!914565))

(assert (=> b!987971 m!914545))

(assert (=> b!987971 m!914545))

(declare-fun m!914777 () Bool)

(assert (=> b!987971 m!914777))

(assert (=> b!987971 m!914565))

(assert (=> b!987971 m!914581))

(assert (=> b!987971 m!914583))

(assert (=> bm!41832 m!914743))

(declare-fun m!914779 () Bool)

(assert (=> bm!41836 m!914779))

(declare-fun m!914781 () Bool)

(assert (=> bm!41833 m!914781))

(assert (=> b!987844 d!116975))

(declare-fun b!987990 () Bool)

(declare-fun e!557103 () Bool)

(declare-fun e!557102 () Bool)

(assert (=> b!987990 (= e!557103 e!557102)))

(declare-fun c!100088 () Bool)

(assert (=> b!987990 (= c!100088 (validKeyInArray!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987991 () Bool)

(declare-fun e!557104 () Bool)

(assert (=> b!987991 (= e!557102 e!557104)))

(declare-fun lt!438224 () (_ BitVec 64))

(assert (=> b!987991 (= lt!438224 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438223 () Unit!32789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62405 (_ BitVec 64) (_ BitVec 32)) Unit!32789)

(assert (=> b!987991 (= lt!438223 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438224 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!987991 (arrayContainsKey!0 _keys!1544 lt!438224 #b00000000000000000000000000000000)))

(declare-fun lt!438225 () Unit!32789)

(assert (=> b!987991 (= lt!438225 lt!438223)))

(declare-fun res!660926 () Bool)

(declare-datatypes ((SeekEntryResult!9208 0))(
  ( (MissingZero!9208 (index!39203 (_ BitVec 32))) (Found!9208 (index!39204 (_ BitVec 32))) (Intermediate!9208 (undefined!10020 Bool) (index!39205 (_ BitVec 32)) (x!85998 (_ BitVec 32))) (Undefined!9208) (MissingVacant!9208 (index!39206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62405 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!987991 (= res!660926 (= (seekEntryOrOpen!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9208 #b00000000000000000000000000000000)))))

(assert (=> b!987991 (=> (not res!660926) (not e!557104))))

(declare-fun b!987992 () Bool)

(declare-fun call!41842 () Bool)

(assert (=> b!987992 (= e!557102 call!41842)))

(declare-fun d!116977 () Bool)

(declare-fun res!660925 () Bool)

(assert (=> d!116977 (=> res!660925 e!557103)))

(assert (=> d!116977 (= res!660925 (bvsge #b00000000000000000000000000000000 (size!30537 _keys!1544)))))

(assert (=> d!116977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557103)))

(declare-fun b!987993 () Bool)

(assert (=> b!987993 (= e!557104 call!41842)))

(declare-fun bm!41839 () Bool)

(assert (=> bm!41839 (= call!41842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116977 (not res!660925)) b!987990))

(assert (= (and b!987990 c!100088) b!987991))

(assert (= (and b!987990 (not c!100088)) b!987992))

(assert (= (and b!987991 res!660926) b!987993))

(assert (= (or b!987993 b!987992) bm!41839))

(declare-fun m!914783 () Bool)

(assert (=> b!987990 m!914783))

(assert (=> b!987990 m!914783))

(declare-fun m!914785 () Bool)

(assert (=> b!987990 m!914785))

(assert (=> b!987991 m!914783))

(declare-fun m!914787 () Bool)

(assert (=> b!987991 m!914787))

(declare-fun m!914789 () Bool)

(assert (=> b!987991 m!914789))

(assert (=> b!987991 m!914783))

(declare-fun m!914791 () Bool)

(assert (=> b!987991 m!914791))

(declare-fun m!914793 () Bool)

(assert (=> bm!41839 m!914793))

(assert (=> b!987849 d!116977))

(declare-fun d!116979 () Bool)

(assert (=> d!116979 (= (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)) (and (not (= (select (arr!30058 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30058 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987840 d!116979))

(declare-fun b!988004 () Bool)

(declare-fun e!557113 () Bool)

(declare-fun call!41845 () Bool)

(assert (=> b!988004 (= e!557113 call!41845)))

(declare-fun b!988005 () Bool)

(declare-fun e!557114 () Bool)

(declare-fun e!557115 () Bool)

(assert (=> b!988005 (= e!557114 e!557115)))

(declare-fun res!660934 () Bool)

(assert (=> b!988005 (=> (not res!660934) (not e!557115))))

(declare-fun e!557116 () Bool)

(assert (=> b!988005 (= res!660934 (not e!557116))))

(declare-fun res!660935 () Bool)

(assert (=> b!988005 (=> (not res!660935) (not e!557116))))

(assert (=> b!988005 (= res!660935 (validKeyInArray!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116981 () Bool)

(declare-fun res!660933 () Bool)

(assert (=> d!116981 (=> res!660933 e!557114)))

(assert (=> d!116981 (= res!660933 (bvsge #b00000000000000000000000000000000 (size!30537 _keys!1544)))))

(assert (=> d!116981 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20787) e!557114)))

(declare-fun bm!41842 () Bool)

(declare-fun c!100091 () Bool)

(assert (=> bm!41842 (= call!41845 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100091 (Cons!20786 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) Nil!20787) Nil!20787)))))

(declare-fun b!988006 () Bool)

(assert (=> b!988006 (= e!557115 e!557113)))

(assert (=> b!988006 (= c!100091 (validKeyInArray!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988007 () Bool)

(declare-fun contains!5715 (List!20790 (_ BitVec 64)) Bool)

(assert (=> b!988007 (= e!557116 (contains!5715 Nil!20787 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988008 () Bool)

(assert (=> b!988008 (= e!557113 call!41845)))

(assert (= (and d!116981 (not res!660933)) b!988005))

(assert (= (and b!988005 res!660935) b!988007))

(assert (= (and b!988005 res!660934) b!988006))

(assert (= (and b!988006 c!100091) b!988004))

(assert (= (and b!988006 (not c!100091)) b!988008))

(assert (= (or b!988004 b!988008) bm!41842))

(assert (=> b!988005 m!914783))

(assert (=> b!988005 m!914783))

(assert (=> b!988005 m!914785))

(assert (=> bm!41842 m!914783))

(declare-fun m!914795 () Bool)

(assert (=> bm!41842 m!914795))

(assert (=> b!988006 m!914783))

(assert (=> b!988006 m!914783))

(assert (=> b!988006 m!914785))

(assert (=> b!988007 m!914783))

(assert (=> b!988007 m!914783))

(declare-fun m!914797 () Bool)

(assert (=> b!988007 m!914797))

(assert (=> b!987846 d!116981))

(declare-fun d!116983 () Bool)

(declare-fun e!557117 () Bool)

(assert (=> d!116983 e!557117))

(declare-fun res!660937 () Bool)

(assert (=> d!116983 (=> (not res!660937) (not e!557117))))

(declare-fun lt!438229 () ListLongMap!13555)

(assert (=> d!116983 (= res!660937 (contains!5713 lt!438229 (_1!7440 lt!438067)))))

(declare-fun lt!438226 () List!20789)

(assert (=> d!116983 (= lt!438229 (ListLongMap!13556 lt!438226))))

(declare-fun lt!438227 () Unit!32789)

(declare-fun lt!438228 () Unit!32789)

(assert (=> d!116983 (= lt!438227 lt!438228)))

(assert (=> d!116983 (= (getValueByKey!512 lt!438226 (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067)))))

(assert (=> d!116983 (= lt!438228 (lemmaContainsTupThenGetReturnValue!271 lt!438226 (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(assert (=> d!116983 (= lt!438226 (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(assert (=> d!116983 (= (+!3078 lt!438075 lt!438067) lt!438229)))

(declare-fun b!988009 () Bool)

(declare-fun res!660936 () Bool)

(assert (=> b!988009 (=> (not res!660936) (not e!557117))))

(assert (=> b!988009 (= res!660936 (= (getValueByKey!512 (toList!6793 lt!438229) (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067))))))

(declare-fun b!988010 () Bool)

(assert (=> b!988010 (= e!557117 (contains!5714 (toList!6793 lt!438229) lt!438067))))

(assert (= (and d!116983 res!660937) b!988009))

(assert (= (and b!988009 res!660936) b!988010))

(declare-fun m!914799 () Bool)

(assert (=> d!116983 m!914799))

(declare-fun m!914801 () Bool)

(assert (=> d!116983 m!914801))

(declare-fun m!914803 () Bool)

(assert (=> d!116983 m!914803))

(declare-fun m!914805 () Bool)

(assert (=> d!116983 m!914805))

(declare-fun m!914807 () Bool)

(assert (=> b!988009 m!914807))

(declare-fun m!914809 () Bool)

(assert (=> b!988010 m!914809))

(assert (=> b!987850 d!116983))

(declare-fun d!116985 () Bool)

(assert (=> d!116985 (= (+!3078 (+!3078 lt!438075 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (+!3078 (+!3078 lt!438075 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!438230 () Unit!32789)

(assert (=> d!116985 (= lt!438230 (choose!1605 lt!438075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070))))

(assert (=> d!116985 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> d!116985 (= (addCommutativeForDiffKeys!702 lt!438075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070) lt!438230)))

(declare-fun bs!28032 () Bool)

(assert (= bs!28032 d!116985))

(declare-fun m!914811 () Bool)

(assert (=> bs!28032 m!914811))

(assert (=> bs!28032 m!914811))

(declare-fun m!914813 () Bool)

(assert (=> bs!28032 m!914813))

(declare-fun m!914815 () Bool)

(assert (=> bs!28032 m!914815))

(assert (=> bs!28032 m!914545))

(declare-fun m!914817 () Bool)

(assert (=> bs!28032 m!914817))

(assert (=> bs!28032 m!914815))

(declare-fun m!914819 () Bool)

(assert (=> bs!28032 m!914819))

(assert (=> b!987850 d!116985))

(declare-fun b!988035 () Bool)

(declare-fun e!557132 () Bool)

(declare-fun lt!438250 () ListLongMap!13555)

(declare-fun isEmpty!720 (ListLongMap!13555) Bool)

(assert (=> b!988035 (= e!557132 (isEmpty!720 lt!438250))))

(declare-fun d!116987 () Bool)

(declare-fun e!557137 () Bool)

(assert (=> d!116987 e!557137))

(declare-fun res!660948 () Bool)

(assert (=> d!116987 (=> (not res!660948) (not e!557137))))

(assert (=> d!116987 (= res!660948 (not (contains!5713 lt!438250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557138 () ListLongMap!13555)

(assert (=> d!116987 (= lt!438250 e!557138)))

(declare-fun c!100103 () Bool)

(assert (=> d!116987 (= c!100103 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(assert (=> d!116987 (validMask!0 mask!1948)))

(assert (=> d!116987 (= (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438250)))

(declare-fun b!988036 () Bool)

(declare-fun e!557134 () Bool)

(assert (=> b!988036 (= e!557137 e!557134)))

(declare-fun c!100100 () Bool)

(declare-fun e!557135 () Bool)

(assert (=> b!988036 (= c!100100 e!557135)))

(declare-fun res!660946 () Bool)

(assert (=> b!988036 (=> (not res!660946) (not e!557135))))

(assert (=> b!988036 (= res!660946 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun b!988037 () Bool)

(assert (=> b!988037 (= e!557138 (ListLongMap!13556 Nil!20786))))

(declare-fun b!988038 () Bool)

(declare-fun e!557136 () ListLongMap!13555)

(declare-fun call!41848 () ListLongMap!13555)

(assert (=> b!988038 (= e!557136 call!41848)))

(declare-fun b!988039 () Bool)

(assert (=> b!988039 (= e!557138 e!557136)))

(declare-fun c!100101 () Bool)

(assert (=> b!988039 (= c!100101 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988040 () Bool)

(declare-fun res!660947 () Bool)

(assert (=> b!988040 (=> (not res!660947) (not e!557137))))

(assert (=> b!988040 (= res!660947 (not (contains!5713 lt!438250 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988041 () Bool)

(assert (=> b!988041 (= e!557135 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988041 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!988042 () Bool)

(assert (=> b!988042 (= e!557134 e!557132)))

(declare-fun c!100102 () Bool)

(assert (=> b!988042 (= c!100102 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun b!988043 () Bool)

(declare-fun lt!438247 () Unit!32789)

(declare-fun lt!438246 () Unit!32789)

(assert (=> b!988043 (= lt!438247 lt!438246)))

(declare-fun lt!438245 () (_ BitVec 64))

(declare-fun lt!438248 () V!35947)

(declare-fun lt!438249 () (_ BitVec 64))

(declare-fun lt!438251 () ListLongMap!13555)

(assert (=> b!988043 (not (contains!5713 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248)) lt!438245))))

(declare-fun addStillNotContains!232 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> b!988043 (= lt!438246 (addStillNotContains!232 lt!438251 lt!438249 lt!438248 lt!438245))))

(assert (=> b!988043 (= lt!438245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988043 (= lt!438248 (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988043 (= lt!438249 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988043 (= lt!438251 call!41848)))

(assert (=> b!988043 (= e!557136 (+!3078 call!41848 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988044 () Bool)

(declare-fun e!557133 () Bool)

(assert (=> b!988044 (= e!557134 e!557133)))

(assert (=> b!988044 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(declare-fun res!660949 () Bool)

(assert (=> b!988044 (= res!660949 (contains!5713 lt!438250 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988044 (=> (not res!660949) (not e!557133))))

(declare-fun b!988045 () Bool)

(assert (=> b!988045 (= e!557132 (= lt!438250 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41845 () Bool)

(assert (=> bm!41845 (= call!41848 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988046 () Bool)

(assert (=> b!988046 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _keys!1544)))))

(assert (=> b!988046 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30538 _values!1278)))))

(assert (=> b!988046 (= e!557133 (= (apply!893 lt!438250 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!116987 c!100103) b!988037))

(assert (= (and d!116987 (not c!100103)) b!988039))

(assert (= (and b!988039 c!100101) b!988043))

(assert (= (and b!988039 (not c!100101)) b!988038))

(assert (= (or b!988043 b!988038) bm!41845))

(assert (= (and d!116987 res!660948) b!988040))

(assert (= (and b!988040 res!660947) b!988036))

(assert (= (and b!988036 res!660946) b!988041))

(assert (= (and b!988036 c!100100) b!988044))

(assert (= (and b!988036 (not c!100100)) b!988042))

(assert (= (and b!988044 res!660949) b!988046))

(assert (= (and b!988042 c!100102) b!988045))

(assert (= (and b!988042 (not c!100102)) b!988035))

(declare-fun b_lambda!15049 () Bool)

(assert (=> (not b_lambda!15049) (not b!988043)))

(assert (=> b!988043 t!29723))

(declare-fun b_and!32093 () Bool)

(assert (= b_and!32091 (and (=> t!29723 result!13563) b_and!32093)))

(declare-fun b_lambda!15051 () Bool)

(assert (=> (not b_lambda!15051) (not b!988046)))

(assert (=> b!988046 t!29723))

(declare-fun b_and!32095 () Bool)

(assert (= b_and!32093 (and (=> t!29723 result!13563) b_and!32095)))

(declare-fun m!914821 () Bool)

(assert (=> bm!41845 m!914821))

(assert (=> b!988039 m!914659))

(assert (=> b!988039 m!914659))

(assert (=> b!988039 m!914661))

(declare-fun m!914823 () Bool)

(assert (=> d!116987 m!914823))

(assert (=> d!116987 m!914539))

(assert (=> b!988046 m!914701))

(assert (=> b!988046 m!914581))

(assert (=> b!988046 m!914705))

(assert (=> b!988046 m!914659))

(assert (=> b!988046 m!914701))

(assert (=> b!988046 m!914581))

(assert (=> b!988046 m!914659))

(declare-fun m!914825 () Bool)

(assert (=> b!988046 m!914825))

(assert (=> b!988045 m!914821))

(assert (=> b!988044 m!914659))

(assert (=> b!988044 m!914659))

(declare-fun m!914827 () Bool)

(assert (=> b!988044 m!914827))

(declare-fun m!914829 () Bool)

(assert (=> b!988043 m!914829))

(assert (=> b!988043 m!914701))

(assert (=> b!988043 m!914581))

(assert (=> b!988043 m!914705))

(declare-fun m!914831 () Bool)

(assert (=> b!988043 m!914831))

(declare-fun m!914833 () Bool)

(assert (=> b!988043 m!914833))

(declare-fun m!914835 () Bool)

(assert (=> b!988043 m!914835))

(assert (=> b!988043 m!914659))

(assert (=> b!988043 m!914701))

(assert (=> b!988043 m!914581))

(assert (=> b!988043 m!914831))

(declare-fun m!914837 () Bool)

(assert (=> b!988035 m!914837))

(declare-fun m!914839 () Bool)

(assert (=> b!988040 m!914839))

(assert (=> b!988041 m!914659))

(assert (=> b!988041 m!914659))

(assert (=> b!988041 m!914661))

(assert (=> b!987850 d!116987))

(declare-fun d!116989 () Bool)

(declare-fun e!557139 () Bool)

(assert (=> d!116989 e!557139))

(declare-fun res!660951 () Bool)

(assert (=> d!116989 (=> (not res!660951) (not e!557139))))

(declare-fun lt!438255 () ListLongMap!13555)

(assert (=> d!116989 (= res!660951 (contains!5713 lt!438255 (_1!7440 lt!438067)))))

(declare-fun lt!438252 () List!20789)

(assert (=> d!116989 (= lt!438255 (ListLongMap!13556 lt!438252))))

(declare-fun lt!438253 () Unit!32789)

(declare-fun lt!438254 () Unit!32789)

(assert (=> d!116989 (= lt!438253 lt!438254)))

(assert (=> d!116989 (= (getValueByKey!512 lt!438252 (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067)))))

(assert (=> d!116989 (= lt!438254 (lemmaContainsTupThenGetReturnValue!271 lt!438252 (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(assert (=> d!116989 (= lt!438252 (insertStrictlySorted!328 (toList!6793 lt!438066) (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(assert (=> d!116989 (= (+!3078 lt!438066 lt!438067) lt!438255)))

(declare-fun b!988047 () Bool)

(declare-fun res!660950 () Bool)

(assert (=> b!988047 (=> (not res!660950) (not e!557139))))

(assert (=> b!988047 (= res!660950 (= (getValueByKey!512 (toList!6793 lt!438255) (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067))))))

(declare-fun b!988048 () Bool)

(assert (=> b!988048 (= e!557139 (contains!5714 (toList!6793 lt!438255) lt!438067))))

(assert (= (and d!116989 res!660951) b!988047))

(assert (= (and b!988047 res!660950) b!988048))

(declare-fun m!914841 () Bool)

(assert (=> d!116989 m!914841))

(declare-fun m!914843 () Bool)

(assert (=> d!116989 m!914843))

(declare-fun m!914845 () Bool)

(assert (=> d!116989 m!914845))

(declare-fun m!914847 () Bool)

(assert (=> d!116989 m!914847))

(declare-fun m!914849 () Bool)

(assert (=> b!988047 m!914849))

(declare-fun m!914851 () Bool)

(assert (=> b!988048 m!914851))

(assert (=> b!987850 d!116989))

(declare-fun d!116991 () Bool)

(declare-fun e!557140 () Bool)

(assert (=> d!116991 e!557140))

(declare-fun res!660953 () Bool)

(assert (=> d!116991 (=> (not res!660953) (not e!557140))))

(declare-fun lt!438259 () ListLongMap!13555)

(assert (=> d!116991 (= res!660953 (contains!5713 lt!438259 (_1!7440 lt!438074)))))

(declare-fun lt!438256 () List!20789)

(assert (=> d!116991 (= lt!438259 (ListLongMap!13556 lt!438256))))

(declare-fun lt!438257 () Unit!32789)

(declare-fun lt!438258 () Unit!32789)

(assert (=> d!116991 (= lt!438257 lt!438258)))

(assert (=> d!116991 (= (getValueByKey!512 lt!438256 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(assert (=> d!116991 (= lt!438258 (lemmaContainsTupThenGetReturnValue!271 lt!438256 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116991 (= lt!438256 (insertStrictlySorted!328 (toList!6793 lt!438072) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116991 (= (+!3078 lt!438072 lt!438074) lt!438259)))

(declare-fun b!988049 () Bool)

(declare-fun res!660952 () Bool)

(assert (=> b!988049 (=> (not res!660952) (not e!557140))))

(assert (=> b!988049 (= res!660952 (= (getValueByKey!512 (toList!6793 lt!438259) (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074))))))

(declare-fun b!988050 () Bool)

(assert (=> b!988050 (= e!557140 (contains!5714 (toList!6793 lt!438259) lt!438074))))

(assert (= (and d!116991 res!660953) b!988049))

(assert (= (and b!988049 res!660952) b!988050))

(declare-fun m!914853 () Bool)

(assert (=> d!116991 m!914853))

(declare-fun m!914855 () Bool)

(assert (=> d!116991 m!914855))

(declare-fun m!914857 () Bool)

(assert (=> d!116991 m!914857))

(declare-fun m!914859 () Bool)

(assert (=> d!116991 m!914859))

(declare-fun m!914861 () Bool)

(assert (=> b!988049 m!914861))

(declare-fun m!914863 () Bool)

(assert (=> b!988050 m!914863))

(assert (=> b!987850 d!116991))

(declare-fun d!116993 () Bool)

(declare-fun e!557141 () Bool)

(assert (=> d!116993 e!557141))

(declare-fun res!660955 () Bool)

(assert (=> d!116993 (=> (not res!660955) (not e!557141))))

(declare-fun lt!438263 () ListLongMap!13555)

(assert (=> d!116993 (= res!660955 (contains!5713 lt!438263 (_1!7440 lt!438068)))))

(declare-fun lt!438260 () List!20789)

(assert (=> d!116993 (= lt!438263 (ListLongMap!13556 lt!438260))))

(declare-fun lt!438261 () Unit!32789)

(declare-fun lt!438262 () Unit!32789)

(assert (=> d!116993 (= lt!438261 lt!438262)))

(assert (=> d!116993 (= (getValueByKey!512 lt!438260 (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068)))))

(assert (=> d!116993 (= lt!438262 (lemmaContainsTupThenGetReturnValue!271 lt!438260 (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(assert (=> d!116993 (= lt!438260 (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(assert (=> d!116993 (= (+!3078 lt!438069 lt!438068) lt!438263)))

(declare-fun b!988051 () Bool)

(declare-fun res!660954 () Bool)

(assert (=> b!988051 (=> (not res!660954) (not e!557141))))

(assert (=> b!988051 (= res!660954 (= (getValueByKey!512 (toList!6793 lt!438263) (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068))))))

(declare-fun b!988052 () Bool)

(assert (=> b!988052 (= e!557141 (contains!5714 (toList!6793 lt!438263) lt!438068))))

(assert (= (and d!116993 res!660955) b!988051))

(assert (= (and b!988051 res!660954) b!988052))

(declare-fun m!914865 () Bool)

(assert (=> d!116993 m!914865))

(declare-fun m!914867 () Bool)

(assert (=> d!116993 m!914867))

(declare-fun m!914869 () Bool)

(assert (=> d!116993 m!914869))

(declare-fun m!914871 () Bool)

(assert (=> d!116993 m!914871))

(declare-fun m!914873 () Bool)

(assert (=> b!988051 m!914873))

(declare-fun m!914875 () Bool)

(assert (=> b!988052 m!914875))

(assert (=> b!987850 d!116993))

(declare-fun d!116995 () Bool)

(declare-fun c!100106 () Bool)

(assert (=> d!116995 (= c!100106 ((_ is ValueCellFull!11130) (select (arr!30059 _values!1278) from!1932)))))

(declare-fun e!557144 () V!35947)

(assert (=> d!116995 (= (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557144)))

(declare-fun b!988057 () Bool)

(declare-fun get!15599 (ValueCell!11130 V!35947) V!35947)

(assert (=> b!988057 (= e!557144 (get!15599 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988058 () Bool)

(declare-fun get!15600 (ValueCell!11130 V!35947) V!35947)

(assert (=> b!988058 (= e!557144 (get!15600 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116995 c!100106) b!988057))

(assert (= (and d!116995 (not c!100106)) b!988058))

(assert (=> b!988057 m!914565))

(assert (=> b!988057 m!914581))

(declare-fun m!914877 () Bool)

(assert (=> b!988057 m!914877))

(assert (=> b!988058 m!914565))

(assert (=> b!988058 m!914581))

(declare-fun m!914879 () Bool)

(assert (=> b!988058 m!914879))

(assert (=> b!987850 d!116995))

(declare-fun d!116997 () Bool)

(declare-fun e!557145 () Bool)

(assert (=> d!116997 e!557145))

(declare-fun res!660957 () Bool)

(assert (=> d!116997 (=> (not res!660957) (not e!557145))))

(declare-fun lt!438267 () ListLongMap!13555)

(assert (=> d!116997 (= res!660957 (contains!5713 lt!438267 (_1!7440 lt!438074)))))

(declare-fun lt!438264 () List!20789)

(assert (=> d!116997 (= lt!438267 (ListLongMap!13556 lt!438264))))

(declare-fun lt!438265 () Unit!32789)

(declare-fun lt!438266 () Unit!32789)

(assert (=> d!116997 (= lt!438265 lt!438266)))

(assert (=> d!116997 (= (getValueByKey!512 lt!438264 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(assert (=> d!116997 (= lt!438266 (lemmaContainsTupThenGetReturnValue!271 lt!438264 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116997 (= lt!438264 (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(assert (=> d!116997 (= (+!3078 lt!438075 lt!438074) lt!438267)))

(declare-fun b!988059 () Bool)

(declare-fun res!660956 () Bool)

(assert (=> b!988059 (=> (not res!660956) (not e!557145))))

(assert (=> b!988059 (= res!660956 (= (getValueByKey!512 (toList!6793 lt!438267) (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074))))))

(declare-fun b!988060 () Bool)

(assert (=> b!988060 (= e!557145 (contains!5714 (toList!6793 lt!438267) lt!438074))))

(assert (= (and d!116997 res!660957) b!988059))

(assert (= (and b!988059 res!660956) b!988060))

(declare-fun m!914881 () Bool)

(assert (=> d!116997 m!914881))

(declare-fun m!914883 () Bool)

(assert (=> d!116997 m!914883))

(declare-fun m!914885 () Bool)

(assert (=> d!116997 m!914885))

(declare-fun m!914887 () Bool)

(assert (=> d!116997 m!914887))

(declare-fun m!914889 () Bool)

(assert (=> b!988059 m!914889))

(declare-fun m!914891 () Bool)

(assert (=> b!988060 m!914891))

(assert (=> b!987850 d!116997))

(declare-fun b!988067 () Bool)

(declare-fun e!557151 () Bool)

(assert (=> b!988067 (= e!557151 tp_is_empty!23223)))

(declare-fun condMapEmpty!36875 () Bool)

(declare-fun mapDefault!36875 () ValueCell!11130)

(assert (=> mapNonEmpty!36869 (= condMapEmpty!36875 (= mapRest!36869 ((as const (Array (_ BitVec 32) ValueCell!11130)) mapDefault!36875)))))

(declare-fun e!557150 () Bool)

(declare-fun mapRes!36875 () Bool)

(assert (=> mapNonEmpty!36869 (= tp!69802 (and e!557150 mapRes!36875))))

(declare-fun mapIsEmpty!36875 () Bool)

(assert (=> mapIsEmpty!36875 mapRes!36875))

(declare-fun mapNonEmpty!36875 () Bool)

(declare-fun tp!69811 () Bool)

(assert (=> mapNonEmpty!36875 (= mapRes!36875 (and tp!69811 e!557151))))

(declare-fun mapValue!36875 () ValueCell!11130)

(declare-fun mapKey!36875 () (_ BitVec 32))

(declare-fun mapRest!36875 () (Array (_ BitVec 32) ValueCell!11130))

(assert (=> mapNonEmpty!36875 (= mapRest!36869 (store mapRest!36875 mapKey!36875 mapValue!36875))))

(declare-fun b!988068 () Bool)

(assert (=> b!988068 (= e!557150 tp_is_empty!23223)))

(assert (= (and mapNonEmpty!36869 condMapEmpty!36875) mapIsEmpty!36875))

(assert (= (and mapNonEmpty!36869 (not condMapEmpty!36875)) mapNonEmpty!36875))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11130) mapValue!36875)) b!988067))

(assert (= (and mapNonEmpty!36869 ((_ is ValueCellFull!11130) mapDefault!36875)) b!988068))

(declare-fun m!914893 () Bool)

(assert (=> mapNonEmpty!36875 m!914893))

(declare-fun b_lambda!15053 () Bool)

(assert (= b_lambda!15051 (or (and start!84456 b_free!20007) b_lambda!15053)))

(declare-fun b_lambda!15055 () Bool)

(assert (= b_lambda!15045 (or (and start!84456 b_free!20007) b_lambda!15055)))

(declare-fun b_lambda!15057 () Bool)

(assert (= b_lambda!15049 (or (and start!84456 b_free!20007) b_lambda!15057)))

(declare-fun b_lambda!15059 () Bool)

(assert (= b_lambda!15047 (or (and start!84456 b_free!20007) b_lambda!15059)))

(check-sat tp_is_empty!23223 (not d!116991) (not b!987967) (not b!987990) (not b!988040) (not b!988051) (not d!116975) (not b!987946) (not b!987942) (not b_lambda!15053) (not b!987943) (not b_lambda!15059) (not b!987937) (not bm!41836) (not b!988047) (not b!987893) (not b!987957) (not b_lambda!15043) (not b!988009) (not mapNonEmpty!36875) (not b!988039) (not b!988052) (not bm!41829) (not b!987968) (not b!988059) (not b!987958) (not b!988006) (not b!988057) (not b!987977) (not b!987962) (not d!116997) (not b!987955) (not b!988045) (not bm!41825) (not d!116967) (not bm!41845) (not b!988049) (not b!988010) (not bm!41828) (not b!987980) (not d!116987) (not b!988043) (not b_lambda!15055) (not b!987956) (not d!116985) (not bm!41833) (not bm!41826) (not d!116973) (not d!116983) (not b!987991) (not b!987941) (not b!987952) (not b!988041) (not d!116993) (not bm!41839) (not b_next!20007) (not b!987971) (not d!116989) (not b!988046) (not b!988005) (not bm!41842) (not b!988007) (not d!116965) (not b!988060) (not b!987966) (not b!988050) (not d!116969) (not b!987892) (not b_lambda!15057) (not bm!41832) b_and!32095 (not b!987960) (not b!987959) (not b!987981) (not b!988044) (not d!116971) (not b!988048) (not b!988035) (not b!988058) (not bm!41835))
(check-sat b_and!32095 (not b_next!20007))
(get-model)

(declare-fun b!988077 () Bool)

(declare-fun e!557156 () Option!518)

(assert (=> b!988077 (= e!557156 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438190)))))))

(declare-fun b!988079 () Bool)

(declare-fun e!557157 () Option!518)

(assert (=> b!988079 (= e!557157 (getValueByKey!512 (t!29724 (toList!6793 lt!438190)) (_1!7440 lt!438068)))))

(declare-fun b!988080 () Bool)

(assert (=> b!988080 (= e!557157 None!516)))

(declare-fun b!988078 () Bool)

(assert (=> b!988078 (= e!557156 e!557157)))

(declare-fun c!100112 () Bool)

(assert (=> b!988078 (= c!100112 (and ((_ is Cons!20785) (toList!6793 lt!438190)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438190))) (_1!7440 lt!438068)))))))

(declare-fun d!116999 () Bool)

(declare-fun c!100111 () Bool)

(assert (=> d!116999 (= c!100111 (and ((_ is Cons!20785) (toList!6793 lt!438190)) (= (_1!7440 (h!21947 (toList!6793 lt!438190))) (_1!7440 lt!438068))))))

(assert (=> d!116999 (= (getValueByKey!512 (toList!6793 lt!438190) (_1!7440 lt!438068)) e!557156)))

(assert (= (and d!116999 c!100111) b!988077))

(assert (= (and d!116999 (not c!100111)) b!988078))

(assert (= (and b!988078 c!100112) b!988079))

(assert (= (and b!988078 (not c!100112)) b!988080))

(declare-fun m!914895 () Bool)

(assert (=> b!988079 m!914895))

(assert (=> b!987957 d!116999))

(declare-fun b!988081 () Bool)

(declare-fun e!557158 () Option!518)

(assert (=> b!988081 (= e!557158 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438194)))))))

(declare-fun b!988083 () Bool)

(declare-fun e!557159 () Option!518)

(assert (=> b!988083 (= e!557159 (getValueByKey!512 (t!29724 (toList!6793 lt!438194)) (_1!7440 lt!438074)))))

(declare-fun b!988084 () Bool)

(assert (=> b!988084 (= e!557159 None!516)))

(declare-fun b!988082 () Bool)

(assert (=> b!988082 (= e!557158 e!557159)))

(declare-fun c!100114 () Bool)

(assert (=> b!988082 (= c!100114 (and ((_ is Cons!20785) (toList!6793 lt!438194)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438194))) (_1!7440 lt!438074)))))))

(declare-fun d!117001 () Bool)

(declare-fun c!100113 () Bool)

(assert (=> d!117001 (= c!100113 (and ((_ is Cons!20785) (toList!6793 lt!438194)) (= (_1!7440 (h!21947 (toList!6793 lt!438194))) (_1!7440 lt!438074))))))

(assert (=> d!117001 (= (getValueByKey!512 (toList!6793 lt!438194) (_1!7440 lt!438074)) e!557158)))

(assert (= (and d!117001 c!100113) b!988081))

(assert (= (and d!117001 (not c!100113)) b!988082))

(assert (= (and b!988082 c!100114) b!988083))

(assert (= (and b!988082 (not c!100114)) b!988084))

(declare-fun m!914897 () Bool)

(assert (=> b!988083 m!914897))

(assert (=> b!987959 d!117001))

(declare-fun d!117003 () Bool)

(declare-fun e!557165 () Bool)

(assert (=> d!117003 e!557165))

(declare-fun res!660960 () Bool)

(assert (=> d!117003 (=> res!660960 e!557165)))

(declare-fun lt!438277 () Bool)

(assert (=> d!117003 (= res!660960 (not lt!438277))))

(declare-fun lt!438276 () Bool)

(assert (=> d!117003 (= lt!438277 lt!438276)))

(declare-fun lt!438278 () Unit!32789)

(declare-fun e!557164 () Unit!32789)

(assert (=> d!117003 (= lt!438278 e!557164)))

(declare-fun c!100117 () Bool)

(assert (=> d!117003 (= c!100117 lt!438276)))

(declare-fun containsKey!477 (List!20789 (_ BitVec 64)) Bool)

(assert (=> d!117003 (= lt!438276 (containsKey!477 (toList!6793 lt!438267) (_1!7440 lt!438074)))))

(assert (=> d!117003 (= (contains!5713 lt!438267 (_1!7440 lt!438074)) lt!438277)))

(declare-fun b!988091 () Bool)

(declare-fun lt!438279 () Unit!32789)

(assert (=> b!988091 (= e!557164 lt!438279)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!373 (List!20789 (_ BitVec 64)) Unit!32789)

(assert (=> b!988091 (= lt!438279 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438267) (_1!7440 lt!438074)))))

(declare-fun isDefined!382 (Option!518) Bool)

(assert (=> b!988091 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438267) (_1!7440 lt!438074)))))

(declare-fun b!988092 () Bool)

(declare-fun Unit!32793 () Unit!32789)

(assert (=> b!988092 (= e!557164 Unit!32793)))

(declare-fun b!988093 () Bool)

(assert (=> b!988093 (= e!557165 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438267) (_1!7440 lt!438074))))))

(assert (= (and d!117003 c!100117) b!988091))

(assert (= (and d!117003 (not c!100117)) b!988092))

(assert (= (and d!117003 (not res!660960)) b!988093))

(declare-fun m!914899 () Bool)

(assert (=> d!117003 m!914899))

(declare-fun m!914901 () Bool)

(assert (=> b!988091 m!914901))

(assert (=> b!988091 m!914889))

(assert (=> b!988091 m!914889))

(declare-fun m!914903 () Bool)

(assert (=> b!988091 m!914903))

(assert (=> b!988093 m!914889))

(assert (=> b!988093 m!914889))

(assert (=> b!988093 m!914903))

(assert (=> d!116997 d!117003))

(declare-fun b!988094 () Bool)

(declare-fun e!557166 () Option!518)

(assert (=> b!988094 (= e!557166 (Some!517 (_2!7440 (h!21947 lt!438264))))))

(declare-fun b!988096 () Bool)

(declare-fun e!557167 () Option!518)

(assert (=> b!988096 (= e!557167 (getValueByKey!512 (t!29724 lt!438264) (_1!7440 lt!438074)))))

(declare-fun b!988097 () Bool)

(assert (=> b!988097 (= e!557167 None!516)))

(declare-fun b!988095 () Bool)

(assert (=> b!988095 (= e!557166 e!557167)))

(declare-fun c!100119 () Bool)

(assert (=> b!988095 (= c!100119 (and ((_ is Cons!20785) lt!438264) (not (= (_1!7440 (h!21947 lt!438264)) (_1!7440 lt!438074)))))))

(declare-fun d!117005 () Bool)

(declare-fun c!100118 () Bool)

(assert (=> d!117005 (= c!100118 (and ((_ is Cons!20785) lt!438264) (= (_1!7440 (h!21947 lt!438264)) (_1!7440 lt!438074))))))

(assert (=> d!117005 (= (getValueByKey!512 lt!438264 (_1!7440 lt!438074)) e!557166)))

(assert (= (and d!117005 c!100118) b!988094))

(assert (= (and d!117005 (not c!100118)) b!988095))

(assert (= (and b!988095 c!100119) b!988096))

(assert (= (and b!988095 (not c!100119)) b!988097))

(declare-fun m!914905 () Bool)

(assert (=> b!988096 m!914905))

(assert (=> d!116997 d!117005))

(declare-fun d!117007 () Bool)

(assert (=> d!117007 (= (getValueByKey!512 lt!438264 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(declare-fun lt!438282 () Unit!32789)

(declare-fun choose!1606 (List!20789 (_ BitVec 64) V!35947) Unit!32789)

(assert (=> d!117007 (= lt!438282 (choose!1606 lt!438264 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun e!557170 () Bool)

(assert (=> d!117007 e!557170))

(declare-fun res!660965 () Bool)

(assert (=> d!117007 (=> (not res!660965) (not e!557170))))

(declare-fun isStrictlySorted!515 (List!20789) Bool)

(assert (=> d!117007 (= res!660965 (isStrictlySorted!515 lt!438264))))

(assert (=> d!117007 (= (lemmaContainsTupThenGetReturnValue!271 lt!438264 (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438282)))

(declare-fun b!988102 () Bool)

(declare-fun res!660966 () Bool)

(assert (=> b!988102 (=> (not res!660966) (not e!557170))))

(assert (=> b!988102 (= res!660966 (containsKey!477 lt!438264 (_1!7440 lt!438074)))))

(declare-fun b!988103 () Bool)

(assert (=> b!988103 (= e!557170 (contains!5714 lt!438264 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(assert (= (and d!117007 res!660965) b!988102))

(assert (= (and b!988102 res!660966) b!988103))

(assert (=> d!117007 m!914883))

(declare-fun m!914907 () Bool)

(assert (=> d!117007 m!914907))

(declare-fun m!914909 () Bool)

(assert (=> d!117007 m!914909))

(declare-fun m!914911 () Bool)

(assert (=> b!988102 m!914911))

(declare-fun m!914913 () Bool)

(assert (=> b!988103 m!914913))

(assert (=> d!116997 d!117007))

(declare-fun bm!41852 () Bool)

(declare-fun call!41856 () List!20789)

(declare-fun call!41857 () List!20789)

(assert (=> bm!41852 (= call!41856 call!41857)))

(declare-fun b!988124 () Bool)

(declare-fun e!557184 () Bool)

(declare-fun lt!438285 () List!20789)

(assert (=> b!988124 (= e!557184 (contains!5714 lt!438285 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(declare-fun b!988125 () Bool)

(declare-fun e!557182 () List!20789)

(declare-fun call!41855 () List!20789)

(assert (=> b!988125 (= e!557182 call!41855)))

(declare-fun b!988127 () Bool)

(declare-fun c!100128 () Bool)

(assert (=> b!988127 (= c!100128 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438074))))))

(declare-fun e!557183 () List!20789)

(declare-fun e!557185 () List!20789)

(assert (=> b!988127 (= e!557183 e!557185)))

(declare-fun bm!41853 () Bool)

(assert (=> bm!41853 (= call!41857 call!41855)))

(declare-fun b!988128 () Bool)

(assert (=> b!988128 (= e!557182 e!557183)))

(declare-fun c!100131 () Bool)

(assert (=> b!988128 (= c!100131 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (= (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438074))))))

(declare-fun b!988129 () Bool)

(declare-fun e!557181 () List!20789)

(assert (=> b!988129 (= e!557181 (ite c!100131 (t!29724 (toList!6793 lt!438075)) (ite c!100128 (Cons!20785 (h!21947 (toList!6793 lt!438075)) (t!29724 (toList!6793 lt!438075))) Nil!20786)))))

(declare-fun b!988130 () Bool)

(assert (=> b!988130 (= e!557185 call!41856)))

(declare-fun b!988131 () Bool)

(assert (=> b!988131 (= e!557183 call!41857)))

(declare-fun bm!41854 () Bool)

(declare-fun c!100129 () Bool)

(declare-fun $colon$colon!554 (List!20789 tuple2!14858) List!20789)

(assert (=> bm!41854 (= call!41855 ($colon$colon!554 e!557181 (ite c!100129 (h!21947 (toList!6793 lt!438075)) (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074)))))))

(declare-fun c!100130 () Bool)

(assert (=> bm!41854 (= c!100130 c!100129)))

(declare-fun b!988126 () Bool)

(assert (=> b!988126 (= e!557181 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438075)) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun d!117009 () Bool)

(assert (=> d!117009 e!557184))

(declare-fun res!660971 () Bool)

(assert (=> d!117009 (=> (not res!660971) (not e!557184))))

(assert (=> d!117009 (= res!660971 (isStrictlySorted!515 lt!438285))))

(assert (=> d!117009 (= lt!438285 e!557182)))

(assert (=> d!117009 (= c!100129 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438074))))))

(assert (=> d!117009 (isStrictlySorted!515 (toList!6793 lt!438075))))

(assert (=> d!117009 (= (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438285)))

(declare-fun b!988132 () Bool)

(declare-fun res!660972 () Bool)

(assert (=> b!988132 (=> (not res!660972) (not e!557184))))

(assert (=> b!988132 (= res!660972 (containsKey!477 lt!438285 (_1!7440 lt!438074)))))

(declare-fun b!988133 () Bool)

(assert (=> b!988133 (= e!557185 call!41856)))

(assert (= (and d!117009 c!100129) b!988125))

(assert (= (and d!117009 (not c!100129)) b!988128))

(assert (= (and b!988128 c!100131) b!988131))

(assert (= (and b!988128 (not c!100131)) b!988127))

(assert (= (and b!988127 c!100128) b!988133))

(assert (= (and b!988127 (not c!100128)) b!988130))

(assert (= (or b!988133 b!988130) bm!41852))

(assert (= (or b!988131 bm!41852) bm!41853))

(assert (= (or b!988125 bm!41853) bm!41854))

(assert (= (and bm!41854 c!100130) b!988126))

(assert (= (and bm!41854 (not c!100130)) b!988129))

(assert (= (and d!117009 res!660971) b!988132))

(assert (= (and b!988132 res!660972) b!988124))

(declare-fun m!914915 () Bool)

(assert (=> d!117009 m!914915))

(declare-fun m!914917 () Bool)

(assert (=> d!117009 m!914917))

(declare-fun m!914919 () Bool)

(assert (=> b!988124 m!914919))

(declare-fun m!914921 () Bool)

(assert (=> b!988132 m!914921))

(declare-fun m!914923 () Bool)

(assert (=> bm!41854 m!914923))

(declare-fun m!914925 () Bool)

(assert (=> b!988126 m!914925))

(assert (=> d!116997 d!117009))

(declare-fun d!117011 () Bool)

(declare-fun e!557187 () Bool)

(assert (=> d!117011 e!557187))

(declare-fun res!660973 () Bool)

(assert (=> d!117011 (=> res!660973 e!557187)))

(declare-fun lt!438287 () Bool)

(assert (=> d!117011 (= res!660973 (not lt!438287))))

(declare-fun lt!438286 () Bool)

(assert (=> d!117011 (= lt!438287 lt!438286)))

(declare-fun lt!438288 () Unit!32789)

(declare-fun e!557186 () Unit!32789)

(assert (=> d!117011 (= lt!438288 e!557186)))

(declare-fun c!100132 () Bool)

(assert (=> d!117011 (= c!100132 lt!438286)))

(assert (=> d!117011 (= lt!438286 (containsKey!477 (toList!6793 lt!438250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117011 (= (contains!5713 lt!438250 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438287)))

(declare-fun b!988134 () Bool)

(declare-fun lt!438289 () Unit!32789)

(assert (=> b!988134 (= e!557186 lt!438289)))

(assert (=> b!988134 (= lt!438289 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988134 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988135 () Bool)

(declare-fun Unit!32794 () Unit!32789)

(assert (=> b!988135 (= e!557186 Unit!32794)))

(declare-fun b!988136 () Bool)

(assert (=> b!988136 (= e!557187 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117011 c!100132) b!988134))

(assert (= (and d!117011 (not c!100132)) b!988135))

(assert (= (and d!117011 (not res!660973)) b!988136))

(declare-fun m!914927 () Bool)

(assert (=> d!117011 m!914927))

(declare-fun m!914929 () Bool)

(assert (=> b!988134 m!914929))

(declare-fun m!914931 () Bool)

(assert (=> b!988134 m!914931))

(assert (=> b!988134 m!914931))

(declare-fun m!914933 () Bool)

(assert (=> b!988134 m!914933))

(assert (=> b!988136 m!914931))

(assert (=> b!988136 m!914931))

(assert (=> b!988136 m!914933))

(assert (=> b!988040 d!117011))

(declare-fun d!117013 () Bool)

(declare-fun e!557189 () Bool)

(assert (=> d!117013 e!557189))

(declare-fun res!660974 () Bool)

(assert (=> d!117013 (=> res!660974 e!557189)))

(declare-fun lt!438291 () Bool)

(assert (=> d!117013 (= res!660974 (not lt!438291))))

(declare-fun lt!438290 () Bool)

(assert (=> d!117013 (= lt!438291 lt!438290)))

(declare-fun lt!438292 () Unit!32789)

(declare-fun e!557188 () Unit!32789)

(assert (=> d!117013 (= lt!438292 e!557188)))

(declare-fun c!100133 () Bool)

(assert (=> d!117013 (= c!100133 lt!438290)))

(assert (=> d!117013 (= lt!438290 (containsKey!477 (toList!6793 lt!438229) (_1!7440 lt!438067)))))

(assert (=> d!117013 (= (contains!5713 lt!438229 (_1!7440 lt!438067)) lt!438291)))

(declare-fun b!988137 () Bool)

(declare-fun lt!438293 () Unit!32789)

(assert (=> b!988137 (= e!557188 lt!438293)))

(assert (=> b!988137 (= lt!438293 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438229) (_1!7440 lt!438067)))))

(assert (=> b!988137 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438229) (_1!7440 lt!438067)))))

(declare-fun b!988138 () Bool)

(declare-fun Unit!32795 () Unit!32789)

(assert (=> b!988138 (= e!557188 Unit!32795)))

(declare-fun b!988139 () Bool)

(assert (=> b!988139 (= e!557189 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438229) (_1!7440 lt!438067))))))

(assert (= (and d!117013 c!100133) b!988137))

(assert (= (and d!117013 (not c!100133)) b!988138))

(assert (= (and d!117013 (not res!660974)) b!988139))

(declare-fun m!914935 () Bool)

(assert (=> d!117013 m!914935))

(declare-fun m!914937 () Bool)

(assert (=> b!988137 m!914937))

(assert (=> b!988137 m!914807))

(assert (=> b!988137 m!914807))

(declare-fun m!914939 () Bool)

(assert (=> b!988137 m!914939))

(assert (=> b!988139 m!914807))

(assert (=> b!988139 m!914807))

(assert (=> b!988139 m!914939))

(assert (=> d!116983 d!117013))

(declare-fun b!988140 () Bool)

(declare-fun e!557190 () Option!518)

(assert (=> b!988140 (= e!557190 (Some!517 (_2!7440 (h!21947 lt!438226))))))

(declare-fun b!988142 () Bool)

(declare-fun e!557191 () Option!518)

(assert (=> b!988142 (= e!557191 (getValueByKey!512 (t!29724 lt!438226) (_1!7440 lt!438067)))))

(declare-fun b!988143 () Bool)

(assert (=> b!988143 (= e!557191 None!516)))

(declare-fun b!988141 () Bool)

(assert (=> b!988141 (= e!557190 e!557191)))

(declare-fun c!100135 () Bool)

(assert (=> b!988141 (= c!100135 (and ((_ is Cons!20785) lt!438226) (not (= (_1!7440 (h!21947 lt!438226)) (_1!7440 lt!438067)))))))

(declare-fun d!117015 () Bool)

(declare-fun c!100134 () Bool)

(assert (=> d!117015 (= c!100134 (and ((_ is Cons!20785) lt!438226) (= (_1!7440 (h!21947 lt!438226)) (_1!7440 lt!438067))))))

(assert (=> d!117015 (= (getValueByKey!512 lt!438226 (_1!7440 lt!438067)) e!557190)))

(assert (= (and d!117015 c!100134) b!988140))

(assert (= (and d!117015 (not c!100134)) b!988141))

(assert (= (and b!988141 c!100135) b!988142))

(assert (= (and b!988141 (not c!100135)) b!988143))

(declare-fun m!914941 () Bool)

(assert (=> b!988142 m!914941))

(assert (=> d!116983 d!117015))

(declare-fun d!117017 () Bool)

(assert (=> d!117017 (= (getValueByKey!512 lt!438226 (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067)))))

(declare-fun lt!438294 () Unit!32789)

(assert (=> d!117017 (= lt!438294 (choose!1606 lt!438226 (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(declare-fun e!557192 () Bool)

(assert (=> d!117017 e!557192))

(declare-fun res!660975 () Bool)

(assert (=> d!117017 (=> (not res!660975) (not e!557192))))

(assert (=> d!117017 (= res!660975 (isStrictlySorted!515 lt!438226))))

(assert (=> d!117017 (= (lemmaContainsTupThenGetReturnValue!271 lt!438226 (_1!7440 lt!438067) (_2!7440 lt!438067)) lt!438294)))

(declare-fun b!988144 () Bool)

(declare-fun res!660976 () Bool)

(assert (=> b!988144 (=> (not res!660976) (not e!557192))))

(assert (=> b!988144 (= res!660976 (containsKey!477 lt!438226 (_1!7440 lt!438067)))))

(declare-fun b!988145 () Bool)

(assert (=> b!988145 (= e!557192 (contains!5714 lt!438226 (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067))))))

(assert (= (and d!117017 res!660975) b!988144))

(assert (= (and b!988144 res!660976) b!988145))

(assert (=> d!117017 m!914801))

(declare-fun m!914943 () Bool)

(assert (=> d!117017 m!914943))

(declare-fun m!914945 () Bool)

(assert (=> d!117017 m!914945))

(declare-fun m!914947 () Bool)

(assert (=> b!988144 m!914947))

(declare-fun m!914949 () Bool)

(assert (=> b!988145 m!914949))

(assert (=> d!116983 d!117017))

(declare-fun bm!41855 () Bool)

(declare-fun call!41859 () List!20789)

(declare-fun call!41860 () List!20789)

(assert (=> bm!41855 (= call!41859 call!41860)))

(declare-fun b!988146 () Bool)

(declare-fun e!557196 () Bool)

(declare-fun lt!438295 () List!20789)

(assert (=> b!988146 (= e!557196 (contains!5714 lt!438295 (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067))))))

(declare-fun b!988147 () Bool)

(declare-fun e!557194 () List!20789)

(declare-fun call!41858 () List!20789)

(assert (=> b!988147 (= e!557194 call!41858)))

(declare-fun b!988149 () Bool)

(declare-fun c!100136 () Bool)

(assert (=> b!988149 (= c!100136 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438067))))))

(declare-fun e!557195 () List!20789)

(declare-fun e!557197 () List!20789)

(assert (=> b!988149 (= e!557195 e!557197)))

(declare-fun bm!41856 () Bool)

(assert (=> bm!41856 (= call!41860 call!41858)))

(declare-fun b!988150 () Bool)

(assert (=> b!988150 (= e!557194 e!557195)))

(declare-fun c!100139 () Bool)

(assert (=> b!988150 (= c!100139 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (= (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438067))))))

(declare-fun e!557193 () List!20789)

(declare-fun b!988151 () Bool)

(assert (=> b!988151 (= e!557193 (ite c!100139 (t!29724 (toList!6793 lt!438075)) (ite c!100136 (Cons!20785 (h!21947 (toList!6793 lt!438075)) (t!29724 (toList!6793 lt!438075))) Nil!20786)))))

(declare-fun b!988152 () Bool)

(assert (=> b!988152 (= e!557197 call!41859)))

(declare-fun b!988153 () Bool)

(assert (=> b!988153 (= e!557195 call!41860)))

(declare-fun bm!41857 () Bool)

(declare-fun c!100137 () Bool)

(assert (=> bm!41857 (= call!41858 ($colon$colon!554 e!557193 (ite c!100137 (h!21947 (toList!6793 lt!438075)) (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067)))))))

(declare-fun c!100138 () Bool)

(assert (=> bm!41857 (= c!100138 c!100137)))

(declare-fun b!988148 () Bool)

(assert (=> b!988148 (= e!557193 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438075)) (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(declare-fun d!117019 () Bool)

(assert (=> d!117019 e!557196))

(declare-fun res!660977 () Bool)

(assert (=> d!117019 (=> (not res!660977) (not e!557196))))

(assert (=> d!117019 (= res!660977 (isStrictlySorted!515 lt!438295))))

(assert (=> d!117019 (= lt!438295 e!557194)))

(assert (=> d!117019 (= c!100137 (and ((_ is Cons!20785) (toList!6793 lt!438075)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438075))) (_1!7440 lt!438067))))))

(assert (=> d!117019 (isStrictlySorted!515 (toList!6793 lt!438075))))

(assert (=> d!117019 (= (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 lt!438067) (_2!7440 lt!438067)) lt!438295)))

(declare-fun b!988154 () Bool)

(declare-fun res!660978 () Bool)

(assert (=> b!988154 (=> (not res!660978) (not e!557196))))

(assert (=> b!988154 (= res!660978 (containsKey!477 lt!438295 (_1!7440 lt!438067)))))

(declare-fun b!988155 () Bool)

(assert (=> b!988155 (= e!557197 call!41859)))

(assert (= (and d!117019 c!100137) b!988147))

(assert (= (and d!117019 (not c!100137)) b!988150))

(assert (= (and b!988150 c!100139) b!988153))

(assert (= (and b!988150 (not c!100139)) b!988149))

(assert (= (and b!988149 c!100136) b!988155))

(assert (= (and b!988149 (not c!100136)) b!988152))

(assert (= (or b!988155 b!988152) bm!41855))

(assert (= (or b!988153 bm!41855) bm!41856))

(assert (= (or b!988147 bm!41856) bm!41857))

(assert (= (and bm!41857 c!100138) b!988148))

(assert (= (and bm!41857 (not c!100138)) b!988151))

(assert (= (and d!117019 res!660977) b!988154))

(assert (= (and b!988154 res!660978) b!988146))

(declare-fun m!914951 () Bool)

(assert (=> d!117019 m!914951))

(assert (=> d!117019 m!914917))

(declare-fun m!914953 () Bool)

(assert (=> b!988146 m!914953))

(declare-fun m!914955 () Bool)

(assert (=> b!988154 m!914955))

(declare-fun m!914957 () Bool)

(assert (=> bm!41857 m!914957))

(declare-fun m!914959 () Bool)

(assert (=> b!988148 m!914959))

(assert (=> d!116983 d!117019))

(declare-fun d!117021 () Bool)

(assert (=> d!117021 (= (validKeyInArray!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988005 d!117021))

(declare-fun b!988156 () Bool)

(declare-fun e!557198 () Option!518)

(assert (=> b!988156 (= e!557198 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438120)))))))

(declare-fun b!988158 () Bool)

(declare-fun e!557199 () Option!518)

(assert (=> b!988158 (= e!557199 (getValueByKey!512 (t!29724 (toList!6793 lt!438120)) (_1!7440 lt!438074)))))

(declare-fun b!988159 () Bool)

(assert (=> b!988159 (= e!557199 None!516)))

(declare-fun b!988157 () Bool)

(assert (=> b!988157 (= e!557198 e!557199)))

(declare-fun c!100141 () Bool)

(assert (=> b!988157 (= c!100141 (and ((_ is Cons!20785) (toList!6793 lt!438120)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438120))) (_1!7440 lt!438074)))))))

(declare-fun d!117023 () Bool)

(declare-fun c!100140 () Bool)

(assert (=> d!117023 (= c!100140 (and ((_ is Cons!20785) (toList!6793 lt!438120)) (= (_1!7440 (h!21947 (toList!6793 lt!438120))) (_1!7440 lt!438074))))))

(assert (=> d!117023 (= (getValueByKey!512 (toList!6793 lt!438120) (_1!7440 lt!438074)) e!557198)))

(assert (= (and d!117023 c!100140) b!988156))

(assert (= (and d!117023 (not c!100140)) b!988157))

(assert (= (and b!988157 c!100141) b!988158))

(assert (= (and b!988157 (not c!100141)) b!988159))

(declare-fun m!914961 () Bool)

(assert (=> b!988158 m!914961))

(assert (=> b!987892 d!117023))

(declare-fun d!117025 () Bool)

(declare-fun e!557201 () Bool)

(assert (=> d!117025 e!557201))

(declare-fun res!660979 () Bool)

(assert (=> d!117025 (=> res!660979 e!557201)))

(declare-fun lt!438297 () Bool)

(assert (=> d!117025 (= res!660979 (not lt!438297))))

(declare-fun lt!438296 () Bool)

(assert (=> d!117025 (= lt!438297 lt!438296)))

(declare-fun lt!438298 () Unit!32789)

(declare-fun e!557200 () Unit!32789)

(assert (=> d!117025 (= lt!438298 e!557200)))

(declare-fun c!100142 () Bool)

(assert (=> d!117025 (= c!100142 lt!438296)))

(assert (=> d!117025 (= lt!438296 (containsKey!477 (toList!6793 lt!438194) (_1!7440 lt!438074)))))

(assert (=> d!117025 (= (contains!5713 lt!438194 (_1!7440 lt!438074)) lt!438297)))

(declare-fun b!988160 () Bool)

(declare-fun lt!438299 () Unit!32789)

(assert (=> b!988160 (= e!557200 lt!438299)))

(assert (=> b!988160 (= lt!438299 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438194) (_1!7440 lt!438074)))))

(assert (=> b!988160 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438194) (_1!7440 lt!438074)))))

(declare-fun b!988161 () Bool)

(declare-fun Unit!32796 () Unit!32789)

(assert (=> b!988161 (= e!557200 Unit!32796)))

(declare-fun b!988162 () Bool)

(assert (=> b!988162 (= e!557201 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438194) (_1!7440 lt!438074))))))

(assert (= (and d!117025 c!100142) b!988160))

(assert (= (and d!117025 (not c!100142)) b!988161))

(assert (= (and d!117025 (not res!660979)) b!988162))

(declare-fun m!914963 () Bool)

(assert (=> d!117025 m!914963))

(declare-fun m!914965 () Bool)

(assert (=> b!988160 m!914965))

(assert (=> b!988160 m!914731))

(assert (=> b!988160 m!914731))

(declare-fun m!914967 () Bool)

(assert (=> b!988160 m!914967))

(assert (=> b!988162 m!914731))

(assert (=> b!988162 m!914731))

(assert (=> b!988162 m!914967))

(assert (=> d!116973 d!117025))

(declare-fun b!988163 () Bool)

(declare-fun e!557202 () Option!518)

(assert (=> b!988163 (= e!557202 (Some!517 (_2!7440 (h!21947 lt!438191))))))

(declare-fun b!988165 () Bool)

(declare-fun e!557203 () Option!518)

(assert (=> b!988165 (= e!557203 (getValueByKey!512 (t!29724 lt!438191) (_1!7440 lt!438074)))))

(declare-fun b!988166 () Bool)

(assert (=> b!988166 (= e!557203 None!516)))

(declare-fun b!988164 () Bool)

(assert (=> b!988164 (= e!557202 e!557203)))

(declare-fun c!100144 () Bool)

(assert (=> b!988164 (= c!100144 (and ((_ is Cons!20785) lt!438191) (not (= (_1!7440 (h!21947 lt!438191)) (_1!7440 lt!438074)))))))

(declare-fun d!117027 () Bool)

(declare-fun c!100143 () Bool)

(assert (=> d!117027 (= c!100143 (and ((_ is Cons!20785) lt!438191) (= (_1!7440 (h!21947 lt!438191)) (_1!7440 lt!438074))))))

(assert (=> d!117027 (= (getValueByKey!512 lt!438191 (_1!7440 lt!438074)) e!557202)))

(assert (= (and d!117027 c!100143) b!988163))

(assert (= (and d!117027 (not c!100143)) b!988164))

(assert (= (and b!988164 c!100144) b!988165))

(assert (= (and b!988164 (not c!100144)) b!988166))

(declare-fun m!914969 () Bool)

(assert (=> b!988165 m!914969))

(assert (=> d!116973 d!117027))

(declare-fun d!117029 () Bool)

(assert (=> d!117029 (= (getValueByKey!512 lt!438191 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(declare-fun lt!438300 () Unit!32789)

(assert (=> d!117029 (= lt!438300 (choose!1606 lt!438191 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun e!557204 () Bool)

(assert (=> d!117029 e!557204))

(declare-fun res!660980 () Bool)

(assert (=> d!117029 (=> (not res!660980) (not e!557204))))

(assert (=> d!117029 (= res!660980 (isStrictlySorted!515 lt!438191))))

(assert (=> d!117029 (= (lemmaContainsTupThenGetReturnValue!271 lt!438191 (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438300)))

(declare-fun b!988167 () Bool)

(declare-fun res!660981 () Bool)

(assert (=> b!988167 (=> (not res!660981) (not e!557204))))

(assert (=> b!988167 (= res!660981 (containsKey!477 lt!438191 (_1!7440 lt!438074)))))

(declare-fun b!988168 () Bool)

(assert (=> b!988168 (= e!557204 (contains!5714 lt!438191 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(assert (= (and d!117029 res!660980) b!988167))

(assert (= (and b!988167 res!660981) b!988168))

(assert (=> d!117029 m!914725))

(declare-fun m!914971 () Bool)

(assert (=> d!117029 m!914971))

(declare-fun m!914973 () Bool)

(assert (=> d!117029 m!914973))

(declare-fun m!914975 () Bool)

(assert (=> b!988167 m!914975))

(declare-fun m!914977 () Bool)

(assert (=> b!988168 m!914977))

(assert (=> d!116973 d!117029))

(declare-fun bm!41858 () Bool)

(declare-fun call!41862 () List!20789)

(declare-fun call!41863 () List!20789)

(assert (=> bm!41858 (= call!41862 call!41863)))

(declare-fun b!988169 () Bool)

(declare-fun e!557208 () Bool)

(declare-fun lt!438301 () List!20789)

(assert (=> b!988169 (= e!557208 (contains!5714 lt!438301 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(declare-fun b!988170 () Bool)

(declare-fun e!557206 () List!20789)

(declare-fun call!41861 () List!20789)

(assert (=> b!988170 (= e!557206 call!41861)))

(declare-fun b!988172 () Bool)

(declare-fun c!100145 () Bool)

(assert (=> b!988172 (= c!100145 (and ((_ is Cons!20785) (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7440 (h!21947 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7440 lt!438074))))))

(declare-fun e!557207 () List!20789)

(declare-fun e!557209 () List!20789)

(assert (=> b!988172 (= e!557207 e!557209)))

(declare-fun bm!41859 () Bool)

(assert (=> bm!41859 (= call!41863 call!41861)))

(declare-fun b!988173 () Bool)

(assert (=> b!988173 (= e!557206 e!557207)))

(declare-fun c!100148 () Bool)

(assert (=> b!988173 (= c!100148 (and ((_ is Cons!20785) (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7440 (h!21947 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7440 lt!438074))))))

(declare-fun b!988174 () Bool)

(declare-fun e!557205 () List!20789)

(assert (=> b!988174 (= e!557205 (ite c!100148 (t!29724 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100145 (Cons!20785 (h!21947 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29724 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20786)))))

(declare-fun b!988175 () Bool)

(assert (=> b!988175 (= e!557209 call!41862)))

(declare-fun b!988176 () Bool)

(assert (=> b!988176 (= e!557207 call!41863)))

(declare-fun c!100146 () Bool)

(declare-fun bm!41860 () Bool)

(assert (=> bm!41860 (= call!41861 ($colon$colon!554 e!557205 (ite c!100146 (h!21947 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074)))))))

(declare-fun c!100147 () Bool)

(assert (=> bm!41860 (= c!100147 c!100146)))

(declare-fun b!988171 () Bool)

(assert (=> b!988171 (= e!557205 (insertStrictlySorted!328 (t!29724 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun d!117031 () Bool)

(assert (=> d!117031 e!557208))

(declare-fun res!660982 () Bool)

(assert (=> d!117031 (=> (not res!660982) (not e!557208))))

(assert (=> d!117031 (= res!660982 (isStrictlySorted!515 lt!438301))))

(assert (=> d!117031 (= lt!438301 e!557206)))

(assert (=> d!117031 (= c!100146 (and ((_ is Cons!20785) (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7440 (h!21947 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7440 lt!438074))))))

(assert (=> d!117031 (isStrictlySorted!515 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117031 (= (insertStrictlySorted!328 (toList!6793 (getCurrentListMap!3860 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438301)))

(declare-fun b!988177 () Bool)

(declare-fun res!660983 () Bool)

(assert (=> b!988177 (=> (not res!660983) (not e!557208))))

(assert (=> b!988177 (= res!660983 (containsKey!477 lt!438301 (_1!7440 lt!438074)))))

(declare-fun b!988178 () Bool)

(assert (=> b!988178 (= e!557209 call!41862)))

(assert (= (and d!117031 c!100146) b!988170))

(assert (= (and d!117031 (not c!100146)) b!988173))

(assert (= (and b!988173 c!100148) b!988176))

(assert (= (and b!988173 (not c!100148)) b!988172))

(assert (= (and b!988172 c!100145) b!988178))

(assert (= (and b!988172 (not c!100145)) b!988175))

(assert (= (or b!988178 b!988175) bm!41858))

(assert (= (or b!988176 bm!41858) bm!41859))

(assert (= (or b!988170 bm!41859) bm!41860))

(assert (= (and bm!41860 c!100147) b!988171))

(assert (= (and bm!41860 (not c!100147)) b!988174))

(assert (= (and d!117031 res!660982) b!988177))

(assert (= (and b!988177 res!660983) b!988169))

(declare-fun m!914979 () Bool)

(assert (=> d!117031 m!914979))

(declare-fun m!914981 () Bool)

(assert (=> d!117031 m!914981))

(declare-fun m!914983 () Bool)

(assert (=> b!988169 m!914983))

(declare-fun m!914985 () Bool)

(assert (=> b!988177 m!914985))

(declare-fun m!914987 () Bool)

(assert (=> bm!41860 m!914987))

(declare-fun m!914989 () Bool)

(assert (=> b!988171 m!914989))

(assert (=> d!116973 d!117031))

(declare-fun d!117033 () Bool)

(declare-fun e!557211 () Bool)

(assert (=> d!117033 e!557211))

(declare-fun res!660984 () Bool)

(assert (=> d!117033 (=> res!660984 e!557211)))

(declare-fun lt!438303 () Bool)

(assert (=> d!117033 (= res!660984 (not lt!438303))))

(declare-fun lt!438302 () Bool)

(assert (=> d!117033 (= lt!438303 lt!438302)))

(declare-fun lt!438304 () Unit!32789)

(declare-fun e!557210 () Unit!32789)

(assert (=> d!117033 (= lt!438304 e!557210)))

(declare-fun c!100149 () Bool)

(assert (=> d!117033 (= c!100149 lt!438302)))

(assert (=> d!117033 (= lt!438302 (containsKey!477 (toList!6793 lt!438210) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117033 (= (contains!5713 lt!438210 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438303)))

(declare-fun b!988179 () Bool)

(declare-fun lt!438305 () Unit!32789)

(assert (=> b!988179 (= e!557210 lt!438305)))

(assert (=> b!988179 (= lt!438305 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438210) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988179 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988180 () Bool)

(declare-fun Unit!32797 () Unit!32789)

(assert (=> b!988180 (= e!557210 Unit!32797)))

(declare-fun b!988181 () Bool)

(assert (=> b!988181 (= e!557211 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117033 c!100149) b!988179))

(assert (= (and d!117033 (not c!100149)) b!988180))

(assert (= (and d!117033 (not res!660984)) b!988181))

(declare-fun m!914991 () Bool)

(assert (=> d!117033 m!914991))

(declare-fun m!914993 () Bool)

(assert (=> b!988179 m!914993))

(declare-fun m!914995 () Bool)

(assert (=> b!988179 m!914995))

(assert (=> b!988179 m!914995))

(declare-fun m!914997 () Bool)

(assert (=> b!988179 m!914997))

(assert (=> b!988181 m!914995))

(assert (=> b!988181 m!914995))

(assert (=> b!988181 m!914997))

(assert (=> bm!41836 d!117033))

(assert (=> b!987966 d!116979))

(declare-fun d!117035 () Bool)

(declare-fun e!557213 () Bool)

(assert (=> d!117035 e!557213))

(declare-fun res!660985 () Bool)

(assert (=> d!117035 (=> res!660985 e!557213)))

(declare-fun lt!438307 () Bool)

(assert (=> d!117035 (= res!660985 (not lt!438307))))

(declare-fun lt!438306 () Bool)

(assert (=> d!117035 (= lt!438307 lt!438306)))

(declare-fun lt!438308 () Unit!32789)

(declare-fun e!557212 () Unit!32789)

(assert (=> d!117035 (= lt!438308 e!557212)))

(declare-fun c!100150 () Bool)

(assert (=> d!117035 (= c!100150 lt!438306)))

(assert (=> d!117035 (= lt!438306 (containsKey!477 (toList!6793 lt!438180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117035 (= (contains!5713 lt!438180 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438307)))

(declare-fun b!988182 () Bool)

(declare-fun lt!438309 () Unit!32789)

(assert (=> b!988182 (= e!557212 lt!438309)))

(assert (=> b!988182 (= lt!438309 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988182 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988183 () Bool)

(declare-fun Unit!32798 () Unit!32789)

(assert (=> b!988183 (= e!557212 Unit!32798)))

(declare-fun b!988184 () Bool)

(assert (=> b!988184 (= e!557213 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117035 c!100150) b!988182))

(assert (= (and d!117035 (not c!100150)) b!988183))

(assert (= (and d!117035 (not res!660985)) b!988184))

(declare-fun m!914999 () Bool)

(assert (=> d!117035 m!914999))

(declare-fun m!915001 () Bool)

(assert (=> b!988182 m!915001))

(declare-fun m!915003 () Bool)

(assert (=> b!988182 m!915003))

(assert (=> b!988182 m!915003))

(declare-fun m!915005 () Bool)

(assert (=> b!988182 m!915005))

(assert (=> b!988184 m!915003))

(assert (=> b!988184 m!915003))

(assert (=> b!988184 m!915005))

(assert (=> bm!41829 d!117035))

(assert (=> b!988006 d!117021))

(assert (=> d!116975 d!116959))

(declare-fun d!117037 () Bool)

(assert (=> d!117037 (= (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987941 d!117037))

(declare-fun d!117039 () Bool)

(assert (=> d!117039 (= (apply!893 (+!3078 lt!438208 (tuple2!14859 lt!438214 minValue!1220)) lt!438199) (apply!893 lt!438208 lt!438199))))

(declare-fun lt!438312 () Unit!32789)

(declare-fun choose!1607 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> d!117039 (= lt!438312 (choose!1607 lt!438208 lt!438214 minValue!1220 lt!438199))))

(declare-fun e!557216 () Bool)

(assert (=> d!117039 e!557216))

(declare-fun res!660988 () Bool)

(assert (=> d!117039 (=> (not res!660988) (not e!557216))))

(assert (=> d!117039 (= res!660988 (contains!5713 lt!438208 lt!438199))))

(assert (=> d!117039 (= (addApplyDifferent!474 lt!438208 lt!438214 minValue!1220 lt!438199) lt!438312)))

(declare-fun b!988188 () Bool)

(assert (=> b!988188 (= e!557216 (not (= lt!438199 lt!438214)))))

(assert (= (and d!117039 res!660988) b!988188))

(assert (=> d!117039 m!914759))

(declare-fun m!915007 () Bool)

(assert (=> d!117039 m!915007))

(assert (=> d!117039 m!914751))

(assert (=> d!117039 m!914751))

(assert (=> d!117039 m!914753))

(declare-fun m!915009 () Bool)

(assert (=> d!117039 m!915009))

(assert (=> b!987968 d!117039))

(declare-fun d!117041 () Bool)

(declare-fun get!15601 (Option!518) V!35947)

(assert (=> d!117041 (= (apply!893 lt!438208 lt!438199) (get!15601 (getValueByKey!512 (toList!6793 lt!438208) lt!438199)))))

(declare-fun bs!28033 () Bool)

(assert (= bs!28033 d!117041))

(declare-fun m!915011 () Bool)

(assert (=> bs!28033 m!915011))

(assert (=> bs!28033 m!915011))

(declare-fun m!915013 () Bool)

(assert (=> bs!28033 m!915013))

(assert (=> b!987968 d!117041))

(declare-fun d!117043 () Bool)

(declare-fun e!557218 () Bool)

(assert (=> d!117043 e!557218))

(declare-fun res!660989 () Bool)

(assert (=> d!117043 (=> res!660989 e!557218)))

(declare-fun lt!438314 () Bool)

(assert (=> d!117043 (= res!660989 (not lt!438314))))

(declare-fun lt!438313 () Bool)

(assert (=> d!117043 (= lt!438314 lt!438313)))

(declare-fun lt!438315 () Unit!32789)

(declare-fun e!557217 () Unit!32789)

(assert (=> d!117043 (= lt!438315 e!557217)))

(declare-fun c!100151 () Bool)

(assert (=> d!117043 (= c!100151 lt!438313)))

(assert (=> d!117043 (= lt!438313 (containsKey!477 (toList!6793 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220))) lt!438201))))

(assert (=> d!117043 (= (contains!5713 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220)) lt!438201) lt!438314)))

(declare-fun b!988189 () Bool)

(declare-fun lt!438316 () Unit!32789)

(assert (=> b!988189 (= e!557217 lt!438316)))

(assert (=> b!988189 (= lt!438316 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220))) lt!438201))))

(assert (=> b!988189 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220))) lt!438201))))

(declare-fun b!988190 () Bool)

(declare-fun Unit!32799 () Unit!32789)

(assert (=> b!988190 (= e!557217 Unit!32799)))

(declare-fun b!988191 () Bool)

(assert (=> b!988191 (= e!557218 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220))) lt!438201)))))

(assert (= (and d!117043 c!100151) b!988189))

(assert (= (and d!117043 (not c!100151)) b!988190))

(assert (= (and d!117043 (not res!660989)) b!988191))

(declare-fun m!915015 () Bool)

(assert (=> d!117043 m!915015))

(declare-fun m!915017 () Bool)

(assert (=> b!988189 m!915017))

(declare-fun m!915019 () Bool)

(assert (=> b!988189 m!915019))

(assert (=> b!988189 m!915019))

(declare-fun m!915021 () Bool)

(assert (=> b!988189 m!915021))

(assert (=> b!988191 m!915019))

(assert (=> b!988191 m!915019))

(assert (=> b!988191 m!915021))

(assert (=> b!987968 d!117043))

(declare-fun d!117045 () Bool)

(assert (=> d!117045 (= (apply!893 (+!3078 lt!438211 (tuple2!14859 lt!438205 minValue!1220)) lt!438196) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438211 (tuple2!14859 lt!438205 minValue!1220))) lt!438196)))))

(declare-fun bs!28034 () Bool)

(assert (= bs!28034 d!117045))

(declare-fun m!915023 () Bool)

(assert (=> bs!28034 m!915023))

(assert (=> bs!28034 m!915023))

(declare-fun m!915025 () Bool)

(assert (=> bs!28034 m!915025))

(assert (=> b!987968 d!117045))

(declare-fun d!117047 () Bool)

(assert (=> d!117047 (= (apply!893 (+!3078 lt!438206 (tuple2!14859 lt!438203 zeroValue!1220)) lt!438213) (apply!893 lt!438206 lt!438213))))

(declare-fun lt!438317 () Unit!32789)

(assert (=> d!117047 (= lt!438317 (choose!1607 lt!438206 lt!438203 zeroValue!1220 lt!438213))))

(declare-fun e!557219 () Bool)

(assert (=> d!117047 e!557219))

(declare-fun res!660990 () Bool)

(assert (=> d!117047 (=> (not res!660990) (not e!557219))))

(assert (=> d!117047 (= res!660990 (contains!5713 lt!438206 lt!438213))))

(assert (=> d!117047 (= (addApplyDifferent!474 lt!438206 lt!438203 zeroValue!1220 lt!438213) lt!438317)))

(declare-fun b!988192 () Bool)

(assert (=> b!988192 (= e!557219 (not (= lt!438213 lt!438203)))))

(assert (= (and d!117047 res!660990) b!988192))

(assert (=> d!117047 m!914749))

(declare-fun m!915027 () Bool)

(assert (=> d!117047 m!915027))

(assert (=> d!117047 m!914745))

(assert (=> d!117047 m!914745))

(assert (=> d!117047 m!914769))

(declare-fun m!915029 () Bool)

(assert (=> d!117047 m!915029))

(assert (=> b!987968 d!117047))

(declare-fun d!117049 () Bool)

(assert (=> d!117049 (= (apply!893 (+!3078 lt!438206 (tuple2!14859 lt!438203 zeroValue!1220)) lt!438213) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438206 (tuple2!14859 lt!438203 zeroValue!1220))) lt!438213)))))

(declare-fun bs!28035 () Bool)

(assert (= bs!28035 d!117049))

(declare-fun m!915031 () Bool)

(assert (=> bs!28035 m!915031))

(assert (=> bs!28035 m!915031))

(declare-fun m!915033 () Bool)

(assert (=> bs!28035 m!915033))

(assert (=> b!987968 d!117049))

(declare-fun d!117051 () Bool)

(assert (=> d!117051 (= (apply!893 (+!3078 lt!438211 (tuple2!14859 lt!438205 minValue!1220)) lt!438196) (apply!893 lt!438211 lt!438196))))

(declare-fun lt!438318 () Unit!32789)

(assert (=> d!117051 (= lt!438318 (choose!1607 lt!438211 lt!438205 minValue!1220 lt!438196))))

(declare-fun e!557220 () Bool)

(assert (=> d!117051 e!557220))

(declare-fun res!660991 () Bool)

(assert (=> d!117051 (=> (not res!660991) (not e!557220))))

(assert (=> d!117051 (= res!660991 (contains!5713 lt!438211 lt!438196))))

(assert (=> d!117051 (= (addApplyDifferent!474 lt!438211 lt!438205 minValue!1220 lt!438196) lt!438318)))

(declare-fun b!988193 () Bool)

(assert (=> b!988193 (= e!557220 (not (= lt!438196 lt!438205)))))

(assert (= (and d!117051 res!660991) b!988193))

(assert (=> d!117051 m!914771))

(declare-fun m!915035 () Bool)

(assert (=> d!117051 m!915035))

(assert (=> d!117051 m!914755))

(assert (=> d!117051 m!914755))

(assert (=> d!117051 m!914757))

(declare-fun m!915037 () Bool)

(assert (=> d!117051 m!915037))

(assert (=> b!987968 d!117051))

(declare-fun d!117053 () Bool)

(assert (=> d!117053 (= (apply!893 lt!438206 lt!438213) (get!15601 (getValueByKey!512 (toList!6793 lt!438206) lt!438213)))))

(declare-fun bs!28036 () Bool)

(assert (= bs!28036 d!117053))

(declare-fun m!915039 () Bool)

(assert (=> bs!28036 m!915039))

(assert (=> bs!28036 m!915039))

(declare-fun m!915041 () Bool)

(assert (=> bs!28036 m!915041))

(assert (=> b!987968 d!117053))

(declare-fun d!117055 () Bool)

(declare-fun e!557221 () Bool)

(assert (=> d!117055 e!557221))

(declare-fun res!660993 () Bool)

(assert (=> d!117055 (=> (not res!660993) (not e!557221))))

(declare-fun lt!438322 () ListLongMap!13555)

(assert (=> d!117055 (= res!660993 (contains!5713 lt!438322 (_1!7440 (tuple2!14859 lt!438214 minValue!1220))))))

(declare-fun lt!438319 () List!20789)

(assert (=> d!117055 (= lt!438322 (ListLongMap!13556 lt!438319))))

(declare-fun lt!438320 () Unit!32789)

(declare-fun lt!438321 () Unit!32789)

(assert (=> d!117055 (= lt!438320 lt!438321)))

(assert (=> d!117055 (= (getValueByKey!512 lt!438319 (_1!7440 (tuple2!14859 lt!438214 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438214 minValue!1220))))))

(assert (=> d!117055 (= lt!438321 (lemmaContainsTupThenGetReturnValue!271 lt!438319 (_1!7440 (tuple2!14859 lt!438214 minValue!1220)) (_2!7440 (tuple2!14859 lt!438214 minValue!1220))))))

(assert (=> d!117055 (= lt!438319 (insertStrictlySorted!328 (toList!6793 lt!438208) (_1!7440 (tuple2!14859 lt!438214 minValue!1220)) (_2!7440 (tuple2!14859 lt!438214 minValue!1220))))))

(assert (=> d!117055 (= (+!3078 lt!438208 (tuple2!14859 lt!438214 minValue!1220)) lt!438322)))

(declare-fun b!988194 () Bool)

(declare-fun res!660992 () Bool)

(assert (=> b!988194 (=> (not res!660992) (not e!557221))))

(assert (=> b!988194 (= res!660992 (= (getValueByKey!512 (toList!6793 lt!438322) (_1!7440 (tuple2!14859 lt!438214 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438214 minValue!1220)))))))

(declare-fun b!988195 () Bool)

(assert (=> b!988195 (= e!557221 (contains!5714 (toList!6793 lt!438322) (tuple2!14859 lt!438214 minValue!1220)))))

(assert (= (and d!117055 res!660993) b!988194))

(assert (= (and b!988194 res!660992) b!988195))

(declare-fun m!915043 () Bool)

(assert (=> d!117055 m!915043))

(declare-fun m!915045 () Bool)

(assert (=> d!117055 m!915045))

(declare-fun m!915047 () Bool)

(assert (=> d!117055 m!915047))

(declare-fun m!915049 () Bool)

(assert (=> d!117055 m!915049))

(declare-fun m!915051 () Bool)

(assert (=> b!988194 m!915051))

(declare-fun m!915053 () Bool)

(assert (=> b!988195 m!915053))

(assert (=> b!987968 d!117055))

(declare-fun d!117057 () Bool)

(assert (=> d!117057 (= (apply!893 lt!438211 lt!438196) (get!15601 (getValueByKey!512 (toList!6793 lt!438211) lt!438196)))))

(declare-fun bs!28037 () Bool)

(assert (= bs!28037 d!117057))

(declare-fun m!915055 () Bool)

(assert (=> bs!28037 m!915055))

(assert (=> bs!28037 m!915055))

(declare-fun m!915057 () Bool)

(assert (=> bs!28037 m!915057))

(assert (=> b!987968 d!117057))

(declare-fun b!988196 () Bool)

(declare-fun e!557222 () Bool)

(declare-fun lt!438328 () ListLongMap!13555)

(assert (=> b!988196 (= e!557222 (isEmpty!720 lt!438328))))

(declare-fun d!117059 () Bool)

(declare-fun e!557227 () Bool)

(assert (=> d!117059 e!557227))

(declare-fun res!660996 () Bool)

(assert (=> d!117059 (=> (not res!660996) (not e!557227))))

(assert (=> d!117059 (= res!660996 (not (contains!5713 lt!438328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557228 () ListLongMap!13555)

(assert (=> d!117059 (= lt!438328 e!557228)))

(declare-fun c!100155 () Bool)

(assert (=> d!117059 (= c!100155 (bvsge from!1932 (size!30537 _keys!1544)))))

(assert (=> d!117059 (validMask!0 mask!1948)))

(assert (=> d!117059 (= (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438328)))

(declare-fun b!988197 () Bool)

(declare-fun e!557224 () Bool)

(assert (=> b!988197 (= e!557227 e!557224)))

(declare-fun c!100152 () Bool)

(declare-fun e!557225 () Bool)

(assert (=> b!988197 (= c!100152 e!557225)))

(declare-fun res!660994 () Bool)

(assert (=> b!988197 (=> (not res!660994) (not e!557225))))

(assert (=> b!988197 (= res!660994 (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun b!988198 () Bool)

(assert (=> b!988198 (= e!557228 (ListLongMap!13556 Nil!20786))))

(declare-fun b!988199 () Bool)

(declare-fun e!557226 () ListLongMap!13555)

(declare-fun call!41864 () ListLongMap!13555)

(assert (=> b!988199 (= e!557226 call!41864)))

(declare-fun b!988200 () Bool)

(assert (=> b!988200 (= e!557228 e!557226)))

(declare-fun c!100153 () Bool)

(assert (=> b!988200 (= c!100153 (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun b!988201 () Bool)

(declare-fun res!660995 () Bool)

(assert (=> b!988201 (=> (not res!660995) (not e!557227))))

(assert (=> b!988201 (= res!660995 (not (contains!5713 lt!438328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988202 () Bool)

(assert (=> b!988202 (= e!557225 (validKeyInArray!0 (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> b!988202 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!988203 () Bool)

(assert (=> b!988203 (= e!557224 e!557222)))

(declare-fun c!100154 () Bool)

(assert (=> b!988203 (= c!100154 (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun b!988204 () Bool)

(declare-fun lt!438325 () Unit!32789)

(declare-fun lt!438324 () Unit!32789)

(assert (=> b!988204 (= lt!438325 lt!438324)))

(declare-fun lt!438326 () V!35947)

(declare-fun lt!438329 () ListLongMap!13555)

(declare-fun lt!438327 () (_ BitVec 64))

(declare-fun lt!438323 () (_ BitVec 64))

(assert (=> b!988204 (not (contains!5713 (+!3078 lt!438329 (tuple2!14859 lt!438327 lt!438326)) lt!438323))))

(assert (=> b!988204 (= lt!438324 (addStillNotContains!232 lt!438329 lt!438327 lt!438326 lt!438323))))

(assert (=> b!988204 (= lt!438323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988204 (= lt!438326 (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988204 (= lt!438327 (select (arr!30058 _keys!1544) from!1932))))

(assert (=> b!988204 (= lt!438329 call!41864)))

(assert (=> b!988204 (= e!557226 (+!3078 call!41864 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988205 () Bool)

(declare-fun e!557223 () Bool)

(assert (=> b!988205 (= e!557224 e!557223)))

(assert (=> b!988205 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544)))))

(declare-fun res!660997 () Bool)

(assert (=> b!988205 (= res!660997 (contains!5713 lt!438328 (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> b!988205 (=> (not res!660997) (not e!557223))))

(declare-fun b!988206 () Bool)

(assert (=> b!988206 (= e!557222 (= lt!438328 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41861 () Bool)

(assert (=> bm!41861 (= call!41864 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988207 () Bool)

(assert (=> b!988207 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30537 _keys!1544)))))

(assert (=> b!988207 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30538 _values!1278)))))

(assert (=> b!988207 (= e!557223 (= (apply!893 lt!438328 (select (arr!30058 _keys!1544) from!1932)) (get!15598 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!117059 c!100155) b!988198))

(assert (= (and d!117059 (not c!100155)) b!988200))

(assert (= (and b!988200 c!100153) b!988204))

(assert (= (and b!988200 (not c!100153)) b!988199))

(assert (= (or b!988204 b!988199) bm!41861))

(assert (= (and d!117059 res!660996) b!988201))

(assert (= (and b!988201 res!660995) b!988197))

(assert (= (and b!988197 res!660994) b!988202))

(assert (= (and b!988197 c!100152) b!988205))

(assert (= (and b!988197 (not c!100152)) b!988203))

(assert (= (and b!988205 res!660997) b!988207))

(assert (= (and b!988203 c!100154) b!988206))

(assert (= (and b!988203 (not c!100154)) b!988196))

(declare-fun b_lambda!15061 () Bool)

(assert (=> (not b_lambda!15061) (not b!988204)))

(assert (=> b!988204 t!29723))

(declare-fun b_and!32097 () Bool)

(assert (= b_and!32095 (and (=> t!29723 result!13563) b_and!32097)))

(declare-fun b_lambda!15063 () Bool)

(assert (=> (not b_lambda!15063) (not b!988207)))

(assert (=> b!988207 t!29723))

(declare-fun b_and!32099 () Bool)

(assert (= b_and!32097 (and (=> t!29723 result!13563) b_and!32099)))

(declare-fun m!915059 () Bool)

(assert (=> bm!41861 m!915059))

(assert (=> b!988200 m!914545))

(assert (=> b!988200 m!914545))

(assert (=> b!988200 m!914585))

(declare-fun m!915061 () Bool)

(assert (=> d!117059 m!915061))

(assert (=> d!117059 m!914539))

(assert (=> b!988207 m!914565))

(assert (=> b!988207 m!914581))

(assert (=> b!988207 m!914583))

(assert (=> b!988207 m!914545))

(assert (=> b!988207 m!914565))

(assert (=> b!988207 m!914581))

(assert (=> b!988207 m!914545))

(declare-fun m!915063 () Bool)

(assert (=> b!988207 m!915063))

(assert (=> b!988206 m!915059))

(assert (=> b!988205 m!914545))

(assert (=> b!988205 m!914545))

(declare-fun m!915065 () Bool)

(assert (=> b!988205 m!915065))

(declare-fun m!915067 () Bool)

(assert (=> b!988204 m!915067))

(assert (=> b!988204 m!914565))

(assert (=> b!988204 m!914581))

(assert (=> b!988204 m!914583))

(declare-fun m!915069 () Bool)

(assert (=> b!988204 m!915069))

(declare-fun m!915071 () Bool)

(assert (=> b!988204 m!915071))

(declare-fun m!915073 () Bool)

(assert (=> b!988204 m!915073))

(assert (=> b!988204 m!914545))

(assert (=> b!988204 m!914565))

(assert (=> b!988204 m!914581))

(assert (=> b!988204 m!915069))

(declare-fun m!915075 () Bool)

(assert (=> b!988196 m!915075))

(declare-fun m!915077 () Bool)

(assert (=> b!988201 m!915077))

(assert (=> b!988202 m!914545))

(assert (=> b!988202 m!914545))

(assert (=> b!988202 m!914585))

(assert (=> b!987968 d!117059))

(declare-fun d!117061 () Bool)

(assert (=> d!117061 (contains!5713 (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220)) lt!438201)))

(declare-fun lt!438332 () Unit!32789)

(declare-fun choose!1608 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> d!117061 (= lt!438332 (choose!1608 lt!438198 lt!438216 zeroValue!1220 lt!438201))))

(assert (=> d!117061 (contains!5713 lt!438198 lt!438201)))

(assert (=> d!117061 (= (addStillContains!614 lt!438198 lt!438216 zeroValue!1220 lt!438201) lt!438332)))

(declare-fun bs!28038 () Bool)

(assert (= bs!28038 d!117061))

(assert (=> bs!28038 m!914761))

(assert (=> bs!28038 m!914761))

(assert (=> bs!28038 m!914763))

(declare-fun m!915079 () Bool)

(assert (=> bs!28038 m!915079))

(declare-fun m!915081 () Bool)

(assert (=> bs!28038 m!915081))

(assert (=> b!987968 d!117061))

(declare-fun d!117063 () Bool)

(declare-fun e!557229 () Bool)

(assert (=> d!117063 e!557229))

(declare-fun res!660999 () Bool)

(assert (=> d!117063 (=> (not res!660999) (not e!557229))))

(declare-fun lt!438336 () ListLongMap!13555)

(assert (=> d!117063 (= res!660999 (contains!5713 lt!438336 (_1!7440 (tuple2!14859 lt!438203 zeroValue!1220))))))

(declare-fun lt!438333 () List!20789)

(assert (=> d!117063 (= lt!438336 (ListLongMap!13556 lt!438333))))

(declare-fun lt!438334 () Unit!32789)

(declare-fun lt!438335 () Unit!32789)

(assert (=> d!117063 (= lt!438334 lt!438335)))

(assert (=> d!117063 (= (getValueByKey!512 lt!438333 (_1!7440 (tuple2!14859 lt!438203 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438203 zeroValue!1220))))))

(assert (=> d!117063 (= lt!438335 (lemmaContainsTupThenGetReturnValue!271 lt!438333 (_1!7440 (tuple2!14859 lt!438203 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438203 zeroValue!1220))))))

(assert (=> d!117063 (= lt!438333 (insertStrictlySorted!328 (toList!6793 lt!438206) (_1!7440 (tuple2!14859 lt!438203 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438203 zeroValue!1220))))))

(assert (=> d!117063 (= (+!3078 lt!438206 (tuple2!14859 lt!438203 zeroValue!1220)) lt!438336)))

(declare-fun b!988209 () Bool)

(declare-fun res!660998 () Bool)

(assert (=> b!988209 (=> (not res!660998) (not e!557229))))

(assert (=> b!988209 (= res!660998 (= (getValueByKey!512 (toList!6793 lt!438336) (_1!7440 (tuple2!14859 lt!438203 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438203 zeroValue!1220)))))))

(declare-fun b!988210 () Bool)

(assert (=> b!988210 (= e!557229 (contains!5714 (toList!6793 lt!438336) (tuple2!14859 lt!438203 zeroValue!1220)))))

(assert (= (and d!117063 res!660999) b!988209))

(assert (= (and b!988209 res!660998) b!988210))

(declare-fun m!915083 () Bool)

(assert (=> d!117063 m!915083))

(declare-fun m!915085 () Bool)

(assert (=> d!117063 m!915085))

(declare-fun m!915087 () Bool)

(assert (=> d!117063 m!915087))

(declare-fun m!915089 () Bool)

(assert (=> d!117063 m!915089))

(declare-fun m!915091 () Bool)

(assert (=> b!988209 m!915091))

(declare-fun m!915093 () Bool)

(assert (=> b!988210 m!915093))

(assert (=> b!987968 d!117063))

(declare-fun d!117065 () Bool)

(assert (=> d!117065 (= (apply!893 (+!3078 lt!438208 (tuple2!14859 lt!438214 minValue!1220)) lt!438199) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438208 (tuple2!14859 lt!438214 minValue!1220))) lt!438199)))))

(declare-fun bs!28039 () Bool)

(assert (= bs!28039 d!117065))

(declare-fun m!915095 () Bool)

(assert (=> bs!28039 m!915095))

(assert (=> bs!28039 m!915095))

(declare-fun m!915097 () Bool)

(assert (=> bs!28039 m!915097))

(assert (=> b!987968 d!117065))

(declare-fun d!117067 () Bool)

(declare-fun e!557230 () Bool)

(assert (=> d!117067 e!557230))

(declare-fun res!661001 () Bool)

(assert (=> d!117067 (=> (not res!661001) (not e!557230))))

(declare-fun lt!438340 () ListLongMap!13555)

(assert (=> d!117067 (= res!661001 (contains!5713 lt!438340 (_1!7440 (tuple2!14859 lt!438216 zeroValue!1220))))))

(declare-fun lt!438337 () List!20789)

(assert (=> d!117067 (= lt!438340 (ListLongMap!13556 lt!438337))))

(declare-fun lt!438338 () Unit!32789)

(declare-fun lt!438339 () Unit!32789)

(assert (=> d!117067 (= lt!438338 lt!438339)))

(assert (=> d!117067 (= (getValueByKey!512 lt!438337 (_1!7440 (tuple2!14859 lt!438216 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438216 zeroValue!1220))))))

(assert (=> d!117067 (= lt!438339 (lemmaContainsTupThenGetReturnValue!271 lt!438337 (_1!7440 (tuple2!14859 lt!438216 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438216 zeroValue!1220))))))

(assert (=> d!117067 (= lt!438337 (insertStrictlySorted!328 (toList!6793 lt!438198) (_1!7440 (tuple2!14859 lt!438216 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438216 zeroValue!1220))))))

(assert (=> d!117067 (= (+!3078 lt!438198 (tuple2!14859 lt!438216 zeroValue!1220)) lt!438340)))

(declare-fun b!988211 () Bool)

(declare-fun res!661000 () Bool)

(assert (=> b!988211 (=> (not res!661000) (not e!557230))))

(assert (=> b!988211 (= res!661000 (= (getValueByKey!512 (toList!6793 lt!438340) (_1!7440 (tuple2!14859 lt!438216 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438216 zeroValue!1220)))))))

(declare-fun b!988212 () Bool)

(assert (=> b!988212 (= e!557230 (contains!5714 (toList!6793 lt!438340) (tuple2!14859 lt!438216 zeroValue!1220)))))

(assert (= (and d!117067 res!661001) b!988211))

(assert (= (and b!988211 res!661000) b!988212))

(declare-fun m!915099 () Bool)

(assert (=> d!117067 m!915099))

(declare-fun m!915101 () Bool)

(assert (=> d!117067 m!915101))

(declare-fun m!915103 () Bool)

(assert (=> d!117067 m!915103))

(declare-fun m!915105 () Bool)

(assert (=> d!117067 m!915105))

(declare-fun m!915107 () Bool)

(assert (=> b!988211 m!915107))

(declare-fun m!915109 () Bool)

(assert (=> b!988212 m!915109))

(assert (=> b!987968 d!117067))

(declare-fun d!117069 () Bool)

(declare-fun e!557231 () Bool)

(assert (=> d!117069 e!557231))

(declare-fun res!661003 () Bool)

(assert (=> d!117069 (=> (not res!661003) (not e!557231))))

(declare-fun lt!438344 () ListLongMap!13555)

(assert (=> d!117069 (= res!661003 (contains!5713 lt!438344 (_1!7440 (tuple2!14859 lt!438205 minValue!1220))))))

(declare-fun lt!438341 () List!20789)

(assert (=> d!117069 (= lt!438344 (ListLongMap!13556 lt!438341))))

(declare-fun lt!438342 () Unit!32789)

(declare-fun lt!438343 () Unit!32789)

(assert (=> d!117069 (= lt!438342 lt!438343)))

(assert (=> d!117069 (= (getValueByKey!512 lt!438341 (_1!7440 (tuple2!14859 lt!438205 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438205 minValue!1220))))))

(assert (=> d!117069 (= lt!438343 (lemmaContainsTupThenGetReturnValue!271 lt!438341 (_1!7440 (tuple2!14859 lt!438205 minValue!1220)) (_2!7440 (tuple2!14859 lt!438205 minValue!1220))))))

(assert (=> d!117069 (= lt!438341 (insertStrictlySorted!328 (toList!6793 lt!438211) (_1!7440 (tuple2!14859 lt!438205 minValue!1220)) (_2!7440 (tuple2!14859 lt!438205 minValue!1220))))))

(assert (=> d!117069 (= (+!3078 lt!438211 (tuple2!14859 lt!438205 minValue!1220)) lt!438344)))

(declare-fun b!988213 () Bool)

(declare-fun res!661002 () Bool)

(assert (=> b!988213 (=> (not res!661002) (not e!557231))))

(assert (=> b!988213 (= res!661002 (= (getValueByKey!512 (toList!6793 lt!438344) (_1!7440 (tuple2!14859 lt!438205 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438205 minValue!1220)))))))

(declare-fun b!988214 () Bool)

(assert (=> b!988214 (= e!557231 (contains!5714 (toList!6793 lt!438344) (tuple2!14859 lt!438205 minValue!1220)))))

(assert (= (and d!117069 res!661003) b!988213))

(assert (= (and b!988213 res!661002) b!988214))

(declare-fun m!915111 () Bool)

(assert (=> d!117069 m!915111))

(declare-fun m!915113 () Bool)

(assert (=> d!117069 m!915113))

(declare-fun m!915115 () Bool)

(assert (=> d!117069 m!915115))

(declare-fun m!915117 () Bool)

(assert (=> d!117069 m!915117))

(declare-fun m!915119 () Bool)

(assert (=> b!988213 m!915119))

(declare-fun m!915121 () Bool)

(assert (=> b!988214 m!915121))

(assert (=> b!987968 d!117069))

(declare-fun d!117071 () Bool)

(assert (=> d!117071 (= (get!15600 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988058 d!117071))

(declare-fun d!117073 () Bool)

(assert (=> d!117073 (= (apply!893 (+!3078 lt!438178 (tuple2!14859 lt!438184 minValue!1220)) lt!438169) (apply!893 lt!438178 lt!438169))))

(declare-fun lt!438345 () Unit!32789)

(assert (=> d!117073 (= lt!438345 (choose!1607 lt!438178 lt!438184 minValue!1220 lt!438169))))

(declare-fun e!557232 () Bool)

(assert (=> d!117073 e!557232))

(declare-fun res!661004 () Bool)

(assert (=> d!117073 (=> (not res!661004) (not e!557232))))

(assert (=> d!117073 (= res!661004 (contains!5713 lt!438178 lt!438169))))

(assert (=> d!117073 (= (addApplyDifferent!474 lt!438178 lt!438184 minValue!1220 lt!438169) lt!438345)))

(declare-fun b!988215 () Bool)

(assert (=> b!988215 (= e!557232 (not (= lt!438169 lt!438184)))))

(assert (= (and d!117073 res!661004) b!988215))

(assert (=> d!117073 m!914683))

(declare-fun m!915123 () Bool)

(assert (=> d!117073 m!915123))

(assert (=> d!117073 m!914675))

(assert (=> d!117073 m!914675))

(assert (=> d!117073 m!914677))

(declare-fun m!915125 () Bool)

(assert (=> d!117073 m!915125))

(assert (=> b!987943 d!117073))

(declare-fun d!117075 () Bool)

(assert (=> d!117075 (= (apply!893 (+!3078 lt!438176 (tuple2!14859 lt!438173 zeroValue!1220)) lt!438183) (apply!893 lt!438176 lt!438183))))

(declare-fun lt!438346 () Unit!32789)

(assert (=> d!117075 (= lt!438346 (choose!1607 lt!438176 lt!438173 zeroValue!1220 lt!438183))))

(declare-fun e!557233 () Bool)

(assert (=> d!117075 e!557233))

(declare-fun res!661005 () Bool)

(assert (=> d!117075 (=> (not res!661005) (not e!557233))))

(assert (=> d!117075 (= res!661005 (contains!5713 lt!438176 lt!438183))))

(assert (=> d!117075 (= (addApplyDifferent!474 lt!438176 lt!438173 zeroValue!1220 lt!438183) lt!438346)))

(declare-fun b!988216 () Bool)

(assert (=> b!988216 (= e!557233 (not (= lt!438183 lt!438173)))))

(assert (= (and d!117075 res!661005) b!988216))

(assert (=> d!117075 m!914673))

(declare-fun m!915127 () Bool)

(assert (=> d!117075 m!915127))

(assert (=> d!117075 m!914669))

(assert (=> d!117075 m!914669))

(assert (=> d!117075 m!914693))

(declare-fun m!915129 () Bool)

(assert (=> d!117075 m!915129))

(assert (=> b!987943 d!117075))

(assert (=> b!987943 d!116987))

(declare-fun d!117077 () Bool)

(assert (=> d!117077 (= (apply!893 (+!3078 lt!438178 (tuple2!14859 lt!438184 minValue!1220)) lt!438169) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438178 (tuple2!14859 lt!438184 minValue!1220))) lt!438169)))))

(declare-fun bs!28040 () Bool)

(assert (= bs!28040 d!117077))

(declare-fun m!915131 () Bool)

(assert (=> bs!28040 m!915131))

(assert (=> bs!28040 m!915131))

(declare-fun m!915133 () Bool)

(assert (=> bs!28040 m!915133))

(assert (=> b!987943 d!117077))

(declare-fun d!117079 () Bool)

(assert (=> d!117079 (= (apply!893 (+!3078 lt!438181 (tuple2!14859 lt!438175 minValue!1220)) lt!438166) (apply!893 lt!438181 lt!438166))))

(declare-fun lt!438347 () Unit!32789)

(assert (=> d!117079 (= lt!438347 (choose!1607 lt!438181 lt!438175 minValue!1220 lt!438166))))

(declare-fun e!557234 () Bool)

(assert (=> d!117079 e!557234))

(declare-fun res!661006 () Bool)

(assert (=> d!117079 (=> (not res!661006) (not e!557234))))

(assert (=> d!117079 (= res!661006 (contains!5713 lt!438181 lt!438166))))

(assert (=> d!117079 (= (addApplyDifferent!474 lt!438181 lt!438175 minValue!1220 lt!438166) lt!438347)))

(declare-fun b!988217 () Bool)

(assert (=> b!988217 (= e!557234 (not (= lt!438166 lt!438175)))))

(assert (= (and d!117079 res!661006) b!988217))

(assert (=> d!117079 m!914695))

(declare-fun m!915135 () Bool)

(assert (=> d!117079 m!915135))

(assert (=> d!117079 m!914679))

(assert (=> d!117079 m!914679))

(assert (=> d!117079 m!914681))

(declare-fun m!915137 () Bool)

(assert (=> d!117079 m!915137))

(assert (=> b!987943 d!117079))

(declare-fun d!117081 () Bool)

(assert (=> d!117081 (contains!5713 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220)) lt!438171)))

(declare-fun lt!438348 () Unit!32789)

(assert (=> d!117081 (= lt!438348 (choose!1608 lt!438168 lt!438186 zeroValue!1220 lt!438171))))

(assert (=> d!117081 (contains!5713 lt!438168 lt!438171)))

(assert (=> d!117081 (= (addStillContains!614 lt!438168 lt!438186 zeroValue!1220 lt!438171) lt!438348)))

(declare-fun bs!28041 () Bool)

(assert (= bs!28041 d!117081))

(assert (=> bs!28041 m!914685))

(assert (=> bs!28041 m!914685))

(assert (=> bs!28041 m!914687))

(declare-fun m!915139 () Bool)

(assert (=> bs!28041 m!915139))

(declare-fun m!915141 () Bool)

(assert (=> bs!28041 m!915141))

(assert (=> b!987943 d!117081))

(declare-fun d!117083 () Bool)

(declare-fun e!557235 () Bool)

(assert (=> d!117083 e!557235))

(declare-fun res!661008 () Bool)

(assert (=> d!117083 (=> (not res!661008) (not e!557235))))

(declare-fun lt!438352 () ListLongMap!13555)

(assert (=> d!117083 (= res!661008 (contains!5713 lt!438352 (_1!7440 (tuple2!14859 lt!438184 minValue!1220))))))

(declare-fun lt!438349 () List!20789)

(assert (=> d!117083 (= lt!438352 (ListLongMap!13556 lt!438349))))

(declare-fun lt!438350 () Unit!32789)

(declare-fun lt!438351 () Unit!32789)

(assert (=> d!117083 (= lt!438350 lt!438351)))

(assert (=> d!117083 (= (getValueByKey!512 lt!438349 (_1!7440 (tuple2!14859 lt!438184 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438184 minValue!1220))))))

(assert (=> d!117083 (= lt!438351 (lemmaContainsTupThenGetReturnValue!271 lt!438349 (_1!7440 (tuple2!14859 lt!438184 minValue!1220)) (_2!7440 (tuple2!14859 lt!438184 minValue!1220))))))

(assert (=> d!117083 (= lt!438349 (insertStrictlySorted!328 (toList!6793 lt!438178) (_1!7440 (tuple2!14859 lt!438184 minValue!1220)) (_2!7440 (tuple2!14859 lt!438184 minValue!1220))))))

(assert (=> d!117083 (= (+!3078 lt!438178 (tuple2!14859 lt!438184 minValue!1220)) lt!438352)))

(declare-fun b!988218 () Bool)

(declare-fun res!661007 () Bool)

(assert (=> b!988218 (=> (not res!661007) (not e!557235))))

(assert (=> b!988218 (= res!661007 (= (getValueByKey!512 (toList!6793 lt!438352) (_1!7440 (tuple2!14859 lt!438184 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438184 minValue!1220)))))))

(declare-fun b!988219 () Bool)

(assert (=> b!988219 (= e!557235 (contains!5714 (toList!6793 lt!438352) (tuple2!14859 lt!438184 minValue!1220)))))

(assert (= (and d!117083 res!661008) b!988218))

(assert (= (and b!988218 res!661007) b!988219))

(declare-fun m!915143 () Bool)

(assert (=> d!117083 m!915143))

(declare-fun m!915145 () Bool)

(assert (=> d!117083 m!915145))

(declare-fun m!915147 () Bool)

(assert (=> d!117083 m!915147))

(declare-fun m!915149 () Bool)

(assert (=> d!117083 m!915149))

(declare-fun m!915151 () Bool)

(assert (=> b!988218 m!915151))

(declare-fun m!915153 () Bool)

(assert (=> b!988219 m!915153))

(assert (=> b!987943 d!117083))

(declare-fun d!117085 () Bool)

(assert (=> d!117085 (= (apply!893 lt!438176 lt!438183) (get!15601 (getValueByKey!512 (toList!6793 lt!438176) lt!438183)))))

(declare-fun bs!28042 () Bool)

(assert (= bs!28042 d!117085))

(declare-fun m!915155 () Bool)

(assert (=> bs!28042 m!915155))

(assert (=> bs!28042 m!915155))

(declare-fun m!915157 () Bool)

(assert (=> bs!28042 m!915157))

(assert (=> b!987943 d!117085))

(declare-fun d!117087 () Bool)

(declare-fun e!557237 () Bool)

(assert (=> d!117087 e!557237))

(declare-fun res!661009 () Bool)

(assert (=> d!117087 (=> res!661009 e!557237)))

(declare-fun lt!438354 () Bool)

(assert (=> d!117087 (= res!661009 (not lt!438354))))

(declare-fun lt!438353 () Bool)

(assert (=> d!117087 (= lt!438354 lt!438353)))

(declare-fun lt!438355 () Unit!32789)

(declare-fun e!557236 () Unit!32789)

(assert (=> d!117087 (= lt!438355 e!557236)))

(declare-fun c!100156 () Bool)

(assert (=> d!117087 (= c!100156 lt!438353)))

(assert (=> d!117087 (= lt!438353 (containsKey!477 (toList!6793 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220))) lt!438171))))

(assert (=> d!117087 (= (contains!5713 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220)) lt!438171) lt!438354)))

(declare-fun b!988220 () Bool)

(declare-fun lt!438356 () Unit!32789)

(assert (=> b!988220 (= e!557236 lt!438356)))

(assert (=> b!988220 (= lt!438356 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220))) lt!438171))))

(assert (=> b!988220 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220))) lt!438171))))

(declare-fun b!988221 () Bool)

(declare-fun Unit!32800 () Unit!32789)

(assert (=> b!988221 (= e!557236 Unit!32800)))

(declare-fun b!988222 () Bool)

(assert (=> b!988222 (= e!557237 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220))) lt!438171)))))

(assert (= (and d!117087 c!100156) b!988220))

(assert (= (and d!117087 (not c!100156)) b!988221))

(assert (= (and d!117087 (not res!661009)) b!988222))

(declare-fun m!915159 () Bool)

(assert (=> d!117087 m!915159))

(declare-fun m!915161 () Bool)

(assert (=> b!988220 m!915161))

(declare-fun m!915163 () Bool)

(assert (=> b!988220 m!915163))

(assert (=> b!988220 m!915163))

(declare-fun m!915165 () Bool)

(assert (=> b!988220 m!915165))

(assert (=> b!988222 m!915163))

(assert (=> b!988222 m!915163))

(assert (=> b!988222 m!915165))

(assert (=> b!987943 d!117087))

(declare-fun d!117089 () Bool)

(assert (=> d!117089 (= (apply!893 lt!438181 lt!438166) (get!15601 (getValueByKey!512 (toList!6793 lt!438181) lt!438166)))))

(declare-fun bs!28043 () Bool)

(assert (= bs!28043 d!117089))

(declare-fun m!915167 () Bool)

(assert (=> bs!28043 m!915167))

(assert (=> bs!28043 m!915167))

(declare-fun m!915169 () Bool)

(assert (=> bs!28043 m!915169))

(assert (=> b!987943 d!117089))

(declare-fun d!117091 () Bool)

(assert (=> d!117091 (= (apply!893 (+!3078 lt!438176 (tuple2!14859 lt!438173 zeroValue!1220)) lt!438183) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438176 (tuple2!14859 lt!438173 zeroValue!1220))) lt!438183)))))

(declare-fun bs!28044 () Bool)

(assert (= bs!28044 d!117091))

(declare-fun m!915171 () Bool)

(assert (=> bs!28044 m!915171))

(assert (=> bs!28044 m!915171))

(declare-fun m!915173 () Bool)

(assert (=> bs!28044 m!915173))

(assert (=> b!987943 d!117091))

(declare-fun d!117093 () Bool)

(declare-fun e!557238 () Bool)

(assert (=> d!117093 e!557238))

(declare-fun res!661011 () Bool)

(assert (=> d!117093 (=> (not res!661011) (not e!557238))))

(declare-fun lt!438360 () ListLongMap!13555)

(assert (=> d!117093 (= res!661011 (contains!5713 lt!438360 (_1!7440 (tuple2!14859 lt!438173 zeroValue!1220))))))

(declare-fun lt!438357 () List!20789)

(assert (=> d!117093 (= lt!438360 (ListLongMap!13556 lt!438357))))

(declare-fun lt!438358 () Unit!32789)

(declare-fun lt!438359 () Unit!32789)

(assert (=> d!117093 (= lt!438358 lt!438359)))

(assert (=> d!117093 (= (getValueByKey!512 lt!438357 (_1!7440 (tuple2!14859 lt!438173 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438173 zeroValue!1220))))))

(assert (=> d!117093 (= lt!438359 (lemmaContainsTupThenGetReturnValue!271 lt!438357 (_1!7440 (tuple2!14859 lt!438173 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438173 zeroValue!1220))))))

(assert (=> d!117093 (= lt!438357 (insertStrictlySorted!328 (toList!6793 lt!438176) (_1!7440 (tuple2!14859 lt!438173 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438173 zeroValue!1220))))))

(assert (=> d!117093 (= (+!3078 lt!438176 (tuple2!14859 lt!438173 zeroValue!1220)) lt!438360)))

(declare-fun b!988223 () Bool)

(declare-fun res!661010 () Bool)

(assert (=> b!988223 (=> (not res!661010) (not e!557238))))

(assert (=> b!988223 (= res!661010 (= (getValueByKey!512 (toList!6793 lt!438360) (_1!7440 (tuple2!14859 lt!438173 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438173 zeroValue!1220)))))))

(declare-fun b!988224 () Bool)

(assert (=> b!988224 (= e!557238 (contains!5714 (toList!6793 lt!438360) (tuple2!14859 lt!438173 zeroValue!1220)))))

(assert (= (and d!117093 res!661011) b!988223))

(assert (= (and b!988223 res!661010) b!988224))

(declare-fun m!915175 () Bool)

(assert (=> d!117093 m!915175))

(declare-fun m!915177 () Bool)

(assert (=> d!117093 m!915177))

(declare-fun m!915179 () Bool)

(assert (=> d!117093 m!915179))

(declare-fun m!915181 () Bool)

(assert (=> d!117093 m!915181))

(declare-fun m!915183 () Bool)

(assert (=> b!988223 m!915183))

(declare-fun m!915185 () Bool)

(assert (=> b!988224 m!915185))

(assert (=> b!987943 d!117093))

(declare-fun d!117095 () Bool)

(declare-fun e!557239 () Bool)

(assert (=> d!117095 e!557239))

(declare-fun res!661013 () Bool)

(assert (=> d!117095 (=> (not res!661013) (not e!557239))))

(declare-fun lt!438364 () ListLongMap!13555)

(assert (=> d!117095 (= res!661013 (contains!5713 lt!438364 (_1!7440 (tuple2!14859 lt!438175 minValue!1220))))))

(declare-fun lt!438361 () List!20789)

(assert (=> d!117095 (= lt!438364 (ListLongMap!13556 lt!438361))))

(declare-fun lt!438362 () Unit!32789)

(declare-fun lt!438363 () Unit!32789)

(assert (=> d!117095 (= lt!438362 lt!438363)))

(assert (=> d!117095 (= (getValueByKey!512 lt!438361 (_1!7440 (tuple2!14859 lt!438175 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438175 minValue!1220))))))

(assert (=> d!117095 (= lt!438363 (lemmaContainsTupThenGetReturnValue!271 lt!438361 (_1!7440 (tuple2!14859 lt!438175 minValue!1220)) (_2!7440 (tuple2!14859 lt!438175 minValue!1220))))))

(assert (=> d!117095 (= lt!438361 (insertStrictlySorted!328 (toList!6793 lt!438181) (_1!7440 (tuple2!14859 lt!438175 minValue!1220)) (_2!7440 (tuple2!14859 lt!438175 minValue!1220))))))

(assert (=> d!117095 (= (+!3078 lt!438181 (tuple2!14859 lt!438175 minValue!1220)) lt!438364)))

(declare-fun b!988225 () Bool)

(declare-fun res!661012 () Bool)

(assert (=> b!988225 (=> (not res!661012) (not e!557239))))

(assert (=> b!988225 (= res!661012 (= (getValueByKey!512 (toList!6793 lt!438364) (_1!7440 (tuple2!14859 lt!438175 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438175 minValue!1220)))))))

(declare-fun b!988226 () Bool)

(assert (=> b!988226 (= e!557239 (contains!5714 (toList!6793 lt!438364) (tuple2!14859 lt!438175 minValue!1220)))))

(assert (= (and d!117095 res!661013) b!988225))

(assert (= (and b!988225 res!661012) b!988226))

(declare-fun m!915187 () Bool)

(assert (=> d!117095 m!915187))

(declare-fun m!915189 () Bool)

(assert (=> d!117095 m!915189))

(declare-fun m!915191 () Bool)

(assert (=> d!117095 m!915191))

(declare-fun m!915193 () Bool)

(assert (=> d!117095 m!915193))

(declare-fun m!915195 () Bool)

(assert (=> b!988225 m!915195))

(declare-fun m!915197 () Bool)

(assert (=> b!988226 m!915197))

(assert (=> b!987943 d!117095))

(declare-fun d!117097 () Bool)

(declare-fun e!557240 () Bool)

(assert (=> d!117097 e!557240))

(declare-fun res!661015 () Bool)

(assert (=> d!117097 (=> (not res!661015) (not e!557240))))

(declare-fun lt!438368 () ListLongMap!13555)

(assert (=> d!117097 (= res!661015 (contains!5713 lt!438368 (_1!7440 (tuple2!14859 lt!438186 zeroValue!1220))))))

(declare-fun lt!438365 () List!20789)

(assert (=> d!117097 (= lt!438368 (ListLongMap!13556 lt!438365))))

(declare-fun lt!438366 () Unit!32789)

(declare-fun lt!438367 () Unit!32789)

(assert (=> d!117097 (= lt!438366 lt!438367)))

(assert (=> d!117097 (= (getValueByKey!512 lt!438365 (_1!7440 (tuple2!14859 lt!438186 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438186 zeroValue!1220))))))

(assert (=> d!117097 (= lt!438367 (lemmaContainsTupThenGetReturnValue!271 lt!438365 (_1!7440 (tuple2!14859 lt!438186 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438186 zeroValue!1220))))))

(assert (=> d!117097 (= lt!438365 (insertStrictlySorted!328 (toList!6793 lt!438168) (_1!7440 (tuple2!14859 lt!438186 zeroValue!1220)) (_2!7440 (tuple2!14859 lt!438186 zeroValue!1220))))))

(assert (=> d!117097 (= (+!3078 lt!438168 (tuple2!14859 lt!438186 zeroValue!1220)) lt!438368)))

(declare-fun b!988227 () Bool)

(declare-fun res!661014 () Bool)

(assert (=> b!988227 (=> (not res!661014) (not e!557240))))

(assert (=> b!988227 (= res!661014 (= (getValueByKey!512 (toList!6793 lt!438368) (_1!7440 (tuple2!14859 lt!438186 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 lt!438186 zeroValue!1220)))))))

(declare-fun b!988228 () Bool)

(assert (=> b!988228 (= e!557240 (contains!5714 (toList!6793 lt!438368) (tuple2!14859 lt!438186 zeroValue!1220)))))

(assert (= (and d!117097 res!661015) b!988227))

(assert (= (and b!988227 res!661014) b!988228))

(declare-fun m!915199 () Bool)

(assert (=> d!117097 m!915199))

(declare-fun m!915201 () Bool)

(assert (=> d!117097 m!915201))

(declare-fun m!915203 () Bool)

(assert (=> d!117097 m!915203))

(declare-fun m!915205 () Bool)

(assert (=> d!117097 m!915205))

(declare-fun m!915207 () Bool)

(assert (=> b!988227 m!915207))

(declare-fun m!915209 () Bool)

(assert (=> b!988228 m!915209))

(assert (=> b!987943 d!117097))

(declare-fun d!117099 () Bool)

(assert (=> d!117099 (= (apply!893 lt!438178 lt!438169) (get!15601 (getValueByKey!512 (toList!6793 lt!438178) lt!438169)))))

(declare-fun bs!28045 () Bool)

(assert (= bs!28045 d!117099))

(declare-fun m!915211 () Bool)

(assert (=> bs!28045 m!915211))

(assert (=> bs!28045 m!915211))

(declare-fun m!915213 () Bool)

(assert (=> bs!28045 m!915213))

(assert (=> b!987943 d!117099))

(declare-fun d!117101 () Bool)

(assert (=> d!117101 (= (apply!893 (+!3078 lt!438181 (tuple2!14859 lt!438175 minValue!1220)) lt!438166) (get!15601 (getValueByKey!512 (toList!6793 (+!3078 lt!438181 (tuple2!14859 lt!438175 minValue!1220))) lt!438166)))))

(declare-fun bs!28046 () Bool)

(assert (= bs!28046 d!117101))

(declare-fun m!915215 () Bool)

(assert (=> bs!28046 m!915215))

(assert (=> bs!28046 m!915215))

(declare-fun m!915217 () Bool)

(assert (=> bs!28046 m!915217))

(assert (=> b!987943 d!117101))

(declare-fun d!117103 () Bool)

(declare-fun e!557242 () Bool)

(assert (=> d!117103 e!557242))

(declare-fun res!661016 () Bool)

(assert (=> d!117103 (=> res!661016 e!557242)))

(declare-fun lt!438370 () Bool)

(assert (=> d!117103 (= res!661016 (not lt!438370))))

(declare-fun lt!438369 () Bool)

(assert (=> d!117103 (= lt!438370 lt!438369)))

(declare-fun lt!438371 () Unit!32789)

(declare-fun e!557241 () Unit!32789)

(assert (=> d!117103 (= lt!438371 e!557241)))

(declare-fun c!100157 () Bool)

(assert (=> d!117103 (= c!100157 lt!438369)))

(assert (=> d!117103 (= lt!438369 (containsKey!477 (toList!6793 lt!438180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117103 (= (contains!5713 lt!438180 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438370)))

(declare-fun b!988229 () Bool)

(declare-fun lt!438372 () Unit!32789)

(assert (=> b!988229 (= e!557241 lt!438372)))

(assert (=> b!988229 (= lt!438372 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988229 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988230 () Bool)

(declare-fun Unit!32801 () Unit!32789)

(assert (=> b!988230 (= e!557241 Unit!32801)))

(declare-fun b!988231 () Bool)

(assert (=> b!988231 (= e!557242 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117103 c!100157) b!988229))

(assert (= (and d!117103 (not c!100157)) b!988230))

(assert (= (and d!117103 (not res!661016)) b!988231))

(declare-fun m!915219 () Bool)

(assert (=> d!117103 m!915219))

(declare-fun m!915221 () Bool)

(assert (=> b!988229 m!915221))

(declare-fun m!915223 () Bool)

(assert (=> b!988229 m!915223))

(assert (=> b!988229 m!915223))

(declare-fun m!915225 () Bool)

(assert (=> b!988229 m!915225))

(assert (=> b!988231 m!915223))

(assert (=> b!988231 m!915223))

(assert (=> b!988231 m!915225))

(assert (=> bm!41826 d!117103))

(declare-fun d!117105 () Bool)

(declare-fun lt!438375 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!418 (List!20789) (InoxSet tuple2!14858))

(assert (=> d!117105 (= lt!438375 (select (content!418 (toList!6793 lt!438263)) lt!438068))))

(declare-fun e!557247 () Bool)

(assert (=> d!117105 (= lt!438375 e!557247)))

(declare-fun res!661022 () Bool)

(assert (=> d!117105 (=> (not res!661022) (not e!557247))))

(assert (=> d!117105 (= res!661022 ((_ is Cons!20785) (toList!6793 lt!438263)))))

(assert (=> d!117105 (= (contains!5714 (toList!6793 lt!438263) lt!438068) lt!438375)))

(declare-fun b!988236 () Bool)

(declare-fun e!557248 () Bool)

(assert (=> b!988236 (= e!557247 e!557248)))

(declare-fun res!661021 () Bool)

(assert (=> b!988236 (=> res!661021 e!557248)))

(assert (=> b!988236 (= res!661021 (= (h!21947 (toList!6793 lt!438263)) lt!438068))))

(declare-fun b!988237 () Bool)

(assert (=> b!988237 (= e!557248 (contains!5714 (t!29724 (toList!6793 lt!438263)) lt!438068))))

(assert (= (and d!117105 res!661022) b!988236))

(assert (= (and b!988236 (not res!661021)) b!988237))

(declare-fun m!915227 () Bool)

(assert (=> d!117105 m!915227))

(declare-fun m!915229 () Bool)

(assert (=> d!117105 m!915229))

(declare-fun m!915231 () Bool)

(assert (=> b!988237 m!915231))

(assert (=> b!988052 d!117105))

(declare-fun d!117107 () Bool)

(assert (=> d!117107 (arrayContainsKey!0 _keys!1544 lt!438224 #b00000000000000000000000000000000)))

(declare-fun lt!438378 () Unit!32789)

(declare-fun choose!13 (array!62405 (_ BitVec 64) (_ BitVec 32)) Unit!32789)

(assert (=> d!117107 (= lt!438378 (choose!13 _keys!1544 lt!438224 #b00000000000000000000000000000000))))

(assert (=> d!117107 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117107 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438224 #b00000000000000000000000000000000) lt!438378)))

(declare-fun bs!28047 () Bool)

(assert (= bs!28047 d!117107))

(assert (=> bs!28047 m!914789))

(declare-fun m!915233 () Bool)

(assert (=> bs!28047 m!915233))

(assert (=> b!987991 d!117107))

(declare-fun d!117109 () Bool)

(declare-fun res!661027 () Bool)

(declare-fun e!557253 () Bool)

(assert (=> d!117109 (=> res!661027 e!557253)))

(assert (=> d!117109 (= res!661027 (= (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) lt!438224))))

(assert (=> d!117109 (= (arrayContainsKey!0 _keys!1544 lt!438224 #b00000000000000000000000000000000) e!557253)))

(declare-fun b!988242 () Bool)

(declare-fun e!557254 () Bool)

(assert (=> b!988242 (= e!557253 e!557254)))

(declare-fun res!661028 () Bool)

(assert (=> b!988242 (=> (not res!661028) (not e!557254))))

(assert (=> b!988242 (= res!661028 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(declare-fun b!988243 () Bool)

(assert (=> b!988243 (= e!557254 (arrayContainsKey!0 _keys!1544 lt!438224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117109 (not res!661027)) b!988242))

(assert (= (and b!988242 res!661028) b!988243))

(assert (=> d!117109 m!914783))

(declare-fun m!915235 () Bool)

(assert (=> b!988243 m!915235))

(assert (=> b!987991 d!117109))

(declare-fun b!988256 () Bool)

(declare-fun c!100166 () Bool)

(declare-fun lt!438387 () (_ BitVec 64))

(assert (=> b!988256 (= c!100166 (= lt!438387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!557261 () SeekEntryResult!9208)

(declare-fun e!557263 () SeekEntryResult!9208)

(assert (=> b!988256 (= e!557261 e!557263)))

(declare-fun b!988257 () Bool)

(declare-fun lt!438386 () SeekEntryResult!9208)

(assert (=> b!988257 (= e!557263 (MissingZero!9208 (index!39205 lt!438386)))))

(declare-fun b!988258 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62405 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!988258 (= e!557263 (seekKeyOrZeroReturnVacant!0 (x!85998 lt!438386) (index!39205 lt!438386) (index!39205 lt!438386) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!988259 () Bool)

(declare-fun e!557262 () SeekEntryResult!9208)

(assert (=> b!988259 (= e!557262 Undefined!9208)))

(declare-fun d!117111 () Bool)

(declare-fun lt!438385 () SeekEntryResult!9208)

(assert (=> d!117111 (and (or ((_ is Undefined!9208) lt!438385) (not ((_ is Found!9208) lt!438385)) (and (bvsge (index!39204 lt!438385) #b00000000000000000000000000000000) (bvslt (index!39204 lt!438385) (size!30537 _keys!1544)))) (or ((_ is Undefined!9208) lt!438385) ((_ is Found!9208) lt!438385) (not ((_ is MissingZero!9208) lt!438385)) (and (bvsge (index!39203 lt!438385) #b00000000000000000000000000000000) (bvslt (index!39203 lt!438385) (size!30537 _keys!1544)))) (or ((_ is Undefined!9208) lt!438385) ((_ is Found!9208) lt!438385) ((_ is MissingZero!9208) lt!438385) (not ((_ is MissingVacant!9208) lt!438385)) (and (bvsge (index!39206 lt!438385) #b00000000000000000000000000000000) (bvslt (index!39206 lt!438385) (size!30537 _keys!1544)))) (or ((_ is Undefined!9208) lt!438385) (ite ((_ is Found!9208) lt!438385) (= (select (arr!30058 _keys!1544) (index!39204 lt!438385)) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9208) lt!438385) (= (select (arr!30058 _keys!1544) (index!39203 lt!438385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9208) lt!438385) (= (select (arr!30058 _keys!1544) (index!39206 lt!438385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117111 (= lt!438385 e!557262)))

(declare-fun c!100164 () Bool)

(assert (=> d!117111 (= c!100164 (and ((_ is Intermediate!9208) lt!438386) (undefined!10020 lt!438386)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62405 (_ BitVec 32)) SeekEntryResult!9208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117111 (= lt!438386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117111 (validMask!0 mask!1948)))

(assert (=> d!117111 (= (seekEntryOrOpen!0 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!438385)))

(declare-fun b!988260 () Bool)

(assert (=> b!988260 (= e!557262 e!557261)))

(assert (=> b!988260 (= lt!438387 (select (arr!30058 _keys!1544) (index!39205 lt!438386)))))

(declare-fun c!100165 () Bool)

(assert (=> b!988260 (= c!100165 (= lt!438387 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988261 () Bool)

(assert (=> b!988261 (= e!557261 (Found!9208 (index!39205 lt!438386)))))

(assert (= (and d!117111 c!100164) b!988259))

(assert (= (and d!117111 (not c!100164)) b!988260))

(assert (= (and b!988260 c!100165) b!988261))

(assert (= (and b!988260 (not c!100165)) b!988256))

(assert (= (and b!988256 c!100166) b!988257))

(assert (= (and b!988256 (not c!100166)) b!988258))

(assert (=> b!988258 m!914783))

(declare-fun m!915237 () Bool)

(assert (=> b!988258 m!915237))

(assert (=> d!117111 m!914783))

(declare-fun m!915239 () Bool)

(assert (=> d!117111 m!915239))

(assert (=> d!117111 m!915239))

(assert (=> d!117111 m!914783))

(declare-fun m!915241 () Bool)

(assert (=> d!117111 m!915241))

(declare-fun m!915243 () Bool)

(assert (=> d!117111 m!915243))

(declare-fun m!915245 () Bool)

(assert (=> d!117111 m!915245))

(declare-fun m!915247 () Bool)

(assert (=> d!117111 m!915247))

(assert (=> d!117111 m!914539))

(declare-fun m!915249 () Bool)

(assert (=> b!988260 m!915249))

(assert (=> b!987991 d!117111))

(declare-fun b!988262 () Bool)

(declare-fun e!557264 () Option!518)

(assert (=> b!988262 (= e!557264 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438267)))))))

(declare-fun b!988264 () Bool)

(declare-fun e!557265 () Option!518)

(assert (=> b!988264 (= e!557265 (getValueByKey!512 (t!29724 (toList!6793 lt!438267)) (_1!7440 lt!438074)))))

(declare-fun b!988265 () Bool)

(assert (=> b!988265 (= e!557265 None!516)))

(declare-fun b!988263 () Bool)

(assert (=> b!988263 (= e!557264 e!557265)))

(declare-fun c!100168 () Bool)

(assert (=> b!988263 (= c!100168 (and ((_ is Cons!20785) (toList!6793 lt!438267)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438267))) (_1!7440 lt!438074)))))))

(declare-fun d!117113 () Bool)

(declare-fun c!100167 () Bool)

(assert (=> d!117113 (= c!100167 (and ((_ is Cons!20785) (toList!6793 lt!438267)) (= (_1!7440 (h!21947 (toList!6793 lt!438267))) (_1!7440 lt!438074))))))

(assert (=> d!117113 (= (getValueByKey!512 (toList!6793 lt!438267) (_1!7440 lt!438074)) e!557264)))

(assert (= (and d!117113 c!100167) b!988262))

(assert (= (and d!117113 (not c!100167)) b!988263))

(assert (= (and b!988263 c!100168) b!988264))

(assert (= (and b!988263 (not c!100168)) b!988265))

(declare-fun m!915251 () Bool)

(assert (=> b!988264 m!915251))

(assert (=> b!988059 d!117113))

(declare-fun b!988266 () Bool)

(declare-fun e!557266 () Option!518)

(assert (=> b!988266 (= e!557266 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438229)))))))

(declare-fun b!988268 () Bool)

(declare-fun e!557267 () Option!518)

(assert (=> b!988268 (= e!557267 (getValueByKey!512 (t!29724 (toList!6793 lt!438229)) (_1!7440 lt!438067)))))

(declare-fun b!988269 () Bool)

(assert (=> b!988269 (= e!557267 None!516)))

(declare-fun b!988267 () Bool)

(assert (=> b!988267 (= e!557266 e!557267)))

(declare-fun c!100170 () Bool)

(assert (=> b!988267 (= c!100170 (and ((_ is Cons!20785) (toList!6793 lt!438229)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438229))) (_1!7440 lt!438067)))))))

(declare-fun d!117115 () Bool)

(declare-fun c!100169 () Bool)

(assert (=> d!117115 (= c!100169 (and ((_ is Cons!20785) (toList!6793 lt!438229)) (= (_1!7440 (h!21947 (toList!6793 lt!438229))) (_1!7440 lt!438067))))))

(assert (=> d!117115 (= (getValueByKey!512 (toList!6793 lt!438229) (_1!7440 lt!438067)) e!557266)))

(assert (= (and d!117115 c!100169) b!988266))

(assert (= (and d!117115 (not c!100169)) b!988267))

(assert (= (and b!988267 c!100170) b!988268))

(assert (= (and b!988267 (not c!100170)) b!988269))

(declare-fun m!915253 () Bool)

(assert (=> b!988268 m!915253))

(assert (=> b!988009 d!117115))

(declare-fun d!117117 () Bool)

(declare-fun e!557268 () Bool)

(assert (=> d!117117 e!557268))

(declare-fun res!661030 () Bool)

(assert (=> d!117117 (=> (not res!661030) (not e!557268))))

(declare-fun lt!438391 () ListLongMap!13555)

(assert (=> d!117117 (= res!661030 (contains!5713 lt!438391 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438388 () List!20789)

(assert (=> d!117117 (= lt!438391 (ListLongMap!13556 lt!438388))))

(declare-fun lt!438389 () Unit!32789)

(declare-fun lt!438390 () Unit!32789)

(assert (=> d!117117 (= lt!438389 lt!438390)))

(assert (=> d!117117 (= (getValueByKey!512 lt!438388 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117117 (= lt!438390 (lemmaContainsTupThenGetReturnValue!271 lt!438388 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117117 (= lt!438388 (insertStrictlySorted!328 (toList!6793 call!41837) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117117 (= (+!3078 call!41837 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438391)))

(declare-fun b!988270 () Bool)

(declare-fun res!661029 () Bool)

(assert (=> b!988270 (=> (not res!661029) (not e!557268))))

(assert (=> b!988270 (= res!661029 (= (getValueByKey!512 (toList!6793 lt!438391) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!988271 () Bool)

(assert (=> b!988271 (= e!557268 (contains!5714 (toList!6793 lt!438391) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117117 res!661030) b!988270))

(assert (= (and b!988270 res!661029) b!988271))

(declare-fun m!915255 () Bool)

(assert (=> d!117117 m!915255))

(declare-fun m!915257 () Bool)

(assert (=> d!117117 m!915257))

(declare-fun m!915259 () Bool)

(assert (=> d!117117 m!915259))

(declare-fun m!915261 () Bool)

(assert (=> d!117117 m!915261))

(declare-fun m!915263 () Bool)

(assert (=> b!988270 m!915263))

(declare-fun m!915265 () Bool)

(assert (=> b!988271 m!915265))

(assert (=> b!987980 d!117117))

(declare-fun d!117119 () Bool)

(declare-fun e!557269 () Bool)

(assert (=> d!117119 e!557269))

(declare-fun res!661032 () Bool)

(assert (=> d!117119 (=> (not res!661032) (not e!557269))))

(declare-fun lt!438395 () ListLongMap!13555)

(assert (=> d!117119 (= res!661032 (contains!5713 lt!438395 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438392 () List!20789)

(assert (=> d!117119 (= lt!438395 (ListLongMap!13556 lt!438392))))

(declare-fun lt!438393 () Unit!32789)

(declare-fun lt!438394 () Unit!32789)

(assert (=> d!117119 (= lt!438393 lt!438394)))

(assert (=> d!117119 (= (getValueByKey!512 lt!438392 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117119 (= lt!438394 (lemmaContainsTupThenGetReturnValue!271 lt!438392 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117119 (= lt!438392 (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438069 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117119 (= (+!3078 (+!3078 lt!438069 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438395)))

(declare-fun b!988272 () Bool)

(declare-fun res!661031 () Bool)

(assert (=> b!988272 (=> (not res!661031) (not e!557269))))

(assert (=> b!988272 (= res!661031 (= (getValueByKey!512 (toList!6793 lt!438395) (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!988273 () Bool)

(assert (=> b!988273 (= e!557269 (contains!5714 (toList!6793 lt!438395) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117119 res!661032) b!988272))

(assert (= (and b!988272 res!661031) b!988273))

(declare-fun m!915267 () Bool)

(assert (=> d!117119 m!915267))

(declare-fun m!915269 () Bool)

(assert (=> d!117119 m!915269))

(declare-fun m!915271 () Bool)

(assert (=> d!117119 m!915271))

(declare-fun m!915273 () Bool)

(assert (=> d!117119 m!915273))

(declare-fun m!915275 () Bool)

(assert (=> b!988272 m!915275))

(declare-fun m!915277 () Bool)

(assert (=> b!988273 m!915277))

(assert (=> d!116965 d!117119))

(declare-fun d!117121 () Bool)

(declare-fun e!557270 () Bool)

(assert (=> d!117121 e!557270))

(declare-fun res!661034 () Bool)

(assert (=> d!117121 (=> (not res!661034) (not e!557270))))

(declare-fun lt!438399 () ListLongMap!13555)

(assert (=> d!117121 (= res!661034 (contains!5713 lt!438399 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(declare-fun lt!438396 () List!20789)

(assert (=> d!117121 (= lt!438399 (ListLongMap!13556 lt!438396))))

(declare-fun lt!438397 () Unit!32789)

(declare-fun lt!438398 () Unit!32789)

(assert (=> d!117121 (= lt!438397 lt!438398)))

(assert (=> d!117121 (= (getValueByKey!512 lt!438396 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117121 (= lt!438398 (lemmaContainsTupThenGetReturnValue!271 lt!438396 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117121 (= lt!438396 (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438069 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117121 (= (+!3078 (+!3078 lt!438069 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) lt!438399)))

(declare-fun b!988274 () Bool)

(declare-fun res!661033 () Bool)

(assert (=> b!988274 (=> (not res!661033) (not e!557270))))

(assert (=> b!988274 (= res!661033 (= (getValueByKey!512 (toList!6793 lt!438399) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))))

(declare-fun b!988275 () Bool)

(assert (=> b!988275 (= e!557270 (contains!5714 (toList!6793 lt!438399) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))

(assert (= (and d!117121 res!661034) b!988274))

(assert (= (and b!988274 res!661033) b!988275))

(declare-fun m!915279 () Bool)

(assert (=> d!117121 m!915279))

(declare-fun m!915281 () Bool)

(assert (=> d!117121 m!915281))

(declare-fun m!915283 () Bool)

(assert (=> d!117121 m!915283))

(declare-fun m!915285 () Bool)

(assert (=> d!117121 m!915285))

(declare-fun m!915287 () Bool)

(assert (=> b!988274 m!915287))

(declare-fun m!915289 () Bool)

(assert (=> b!988275 m!915289))

(assert (=> d!116965 d!117121))

(declare-fun d!117123 () Bool)

(assert (=> d!117123 (= (+!3078 (+!3078 lt!438069 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (+!3078 (+!3078 lt!438069 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!117123 true))

(declare-fun _$28!184 () Unit!32789)

(assert (=> d!117123 (= (choose!1605 lt!438069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070) _$28!184)))

(declare-fun bs!28048 () Bool)

(assert (= bs!28048 d!117123))

(assert (=> bs!28048 m!914639))

(assert (=> bs!28048 m!914639))

(assert (=> bs!28048 m!914643))

(assert (=> bs!28048 m!914635))

(assert (=> bs!28048 m!914635))

(assert (=> bs!28048 m!914637))

(assert (=> d!116965 d!117123))

(declare-fun d!117125 () Bool)

(declare-fun e!557271 () Bool)

(assert (=> d!117125 e!557271))

(declare-fun res!661036 () Bool)

(assert (=> d!117125 (=> (not res!661036) (not e!557271))))

(declare-fun lt!438403 () ListLongMap!13555)

(assert (=> d!117125 (= res!661036 (contains!5713 lt!438403 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438400 () List!20789)

(assert (=> d!117125 (= lt!438403 (ListLongMap!13556 lt!438400))))

(declare-fun lt!438401 () Unit!32789)

(declare-fun lt!438402 () Unit!32789)

(assert (=> d!117125 (= lt!438401 lt!438402)))

(assert (=> d!117125 (= (getValueByKey!512 lt!438400 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117125 (= lt!438402 (lemmaContainsTupThenGetReturnValue!271 lt!438400 (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117125 (= lt!438400 (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117125 (= (+!3078 lt!438069 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438403)))

(declare-fun b!988276 () Bool)

(declare-fun res!661035 () Bool)

(assert (=> b!988276 (=> (not res!661035) (not e!557271))))

(assert (=> b!988276 (= res!661035 (= (getValueByKey!512 (toList!6793 lt!438403) (_1!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!988277 () Bool)

(assert (=> b!988277 (= e!557271 (contains!5714 (toList!6793 lt!438403) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117125 res!661036) b!988276))

(assert (= (and b!988276 res!661035) b!988277))

(declare-fun m!915291 () Bool)

(assert (=> d!117125 m!915291))

(declare-fun m!915293 () Bool)

(assert (=> d!117125 m!915293))

(declare-fun m!915295 () Bool)

(assert (=> d!117125 m!915295))

(declare-fun m!915297 () Bool)

(assert (=> d!117125 m!915297))

(declare-fun m!915299 () Bool)

(assert (=> b!988276 m!915299))

(declare-fun m!915301 () Bool)

(assert (=> b!988277 m!915301))

(assert (=> d!116965 d!117125))

(declare-fun d!117127 () Bool)

(declare-fun e!557272 () Bool)

(assert (=> d!117127 e!557272))

(declare-fun res!661038 () Bool)

(assert (=> d!117127 (=> (not res!661038) (not e!557272))))

(declare-fun lt!438407 () ListLongMap!13555)

(assert (=> d!117127 (= res!661038 (contains!5713 lt!438407 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(declare-fun lt!438404 () List!20789)

(assert (=> d!117127 (= lt!438407 (ListLongMap!13556 lt!438404))))

(declare-fun lt!438405 () Unit!32789)

(declare-fun lt!438406 () Unit!32789)

(assert (=> d!117127 (= lt!438405 lt!438406)))

(assert (=> d!117127 (= (getValueByKey!512 lt!438404 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117127 (= lt!438406 (lemmaContainsTupThenGetReturnValue!271 lt!438404 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117127 (= lt!438404 (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117127 (= (+!3078 lt!438069 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) lt!438407)))

(declare-fun b!988278 () Bool)

(declare-fun res!661037 () Bool)

(assert (=> b!988278 (=> (not res!661037) (not e!557272))))

(assert (=> b!988278 (= res!661037 (= (getValueByKey!512 (toList!6793 lt!438407) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))))

(declare-fun b!988279 () Bool)

(assert (=> b!988279 (= e!557272 (contains!5714 (toList!6793 lt!438407) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))

(assert (= (and d!117127 res!661038) b!988278))

(assert (= (and b!988278 res!661037) b!988279))

(declare-fun m!915303 () Bool)

(assert (=> d!117127 m!915303))

(declare-fun m!915305 () Bool)

(assert (=> d!117127 m!915305))

(declare-fun m!915307 () Bool)

(assert (=> d!117127 m!915307))

(declare-fun m!915309 () Bool)

(assert (=> d!117127 m!915309))

(declare-fun m!915311 () Bool)

(assert (=> b!988278 m!915311))

(declare-fun m!915313 () Bool)

(assert (=> b!988279 m!915313))

(assert (=> d!116965 d!117127))

(declare-fun d!117129 () Bool)

(assert (=> d!117129 (= (+!3078 (+!3078 lt!438075 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (+!3078 (+!3078 lt!438075 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!117129 true))

(declare-fun _$28!185 () Unit!32789)

(assert (=> d!117129 (= (choose!1605 lt!438075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30058 _keys!1544) from!1932) lt!438070) _$28!185)))

(declare-fun bs!28049 () Bool)

(assert (= bs!28049 d!117129))

(assert (=> bs!28049 m!914815))

(assert (=> bs!28049 m!914815))

(assert (=> bs!28049 m!914819))

(assert (=> bs!28049 m!914811))

(assert (=> bs!28049 m!914811))

(assert (=> bs!28049 m!914813))

(assert (=> d!116985 d!117129))

(declare-fun d!117131 () Bool)

(declare-fun e!557273 () Bool)

(assert (=> d!117131 e!557273))

(declare-fun res!661040 () Bool)

(assert (=> d!117131 (=> (not res!661040) (not e!557273))))

(declare-fun lt!438411 () ListLongMap!13555)

(assert (=> d!117131 (= res!661040 (contains!5713 lt!438411 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438408 () List!20789)

(assert (=> d!117131 (= lt!438411 (ListLongMap!13556 lt!438408))))

(declare-fun lt!438409 () Unit!32789)

(declare-fun lt!438410 () Unit!32789)

(assert (=> d!117131 (= lt!438409 lt!438410)))

(assert (=> d!117131 (= (getValueByKey!512 lt!438408 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117131 (= lt!438410 (lemmaContainsTupThenGetReturnValue!271 lt!438408 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117131 (= lt!438408 (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438075 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117131 (= (+!3078 (+!3078 lt!438075 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438411)))

(declare-fun b!988280 () Bool)

(declare-fun res!661039 () Bool)

(assert (=> b!988280 (=> (not res!661039) (not e!557273))))

(assert (=> b!988280 (= res!661039 (= (getValueByKey!512 (toList!6793 lt!438411) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!988281 () Bool)

(assert (=> b!988281 (= e!557273 (contains!5714 (toList!6793 lt!438411) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117131 res!661040) b!988280))

(assert (= (and b!988280 res!661039) b!988281))

(declare-fun m!915315 () Bool)

(assert (=> d!117131 m!915315))

(declare-fun m!915317 () Bool)

(assert (=> d!117131 m!915317))

(declare-fun m!915319 () Bool)

(assert (=> d!117131 m!915319))

(declare-fun m!915321 () Bool)

(assert (=> d!117131 m!915321))

(declare-fun m!915323 () Bool)

(assert (=> b!988280 m!915323))

(declare-fun m!915325 () Bool)

(assert (=> b!988281 m!915325))

(assert (=> d!116985 d!117131))

(declare-fun d!117133 () Bool)

(declare-fun e!557274 () Bool)

(assert (=> d!117133 e!557274))

(declare-fun res!661042 () Bool)

(assert (=> d!117133 (=> (not res!661042) (not e!557274))))

(declare-fun lt!438415 () ListLongMap!13555)

(assert (=> d!117133 (= res!661042 (contains!5713 lt!438415 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(declare-fun lt!438412 () List!20789)

(assert (=> d!117133 (= lt!438415 (ListLongMap!13556 lt!438412))))

(declare-fun lt!438413 () Unit!32789)

(declare-fun lt!438414 () Unit!32789)

(assert (=> d!117133 (= lt!438413 lt!438414)))

(assert (=> d!117133 (= (getValueByKey!512 lt!438412 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117133 (= lt!438414 (lemmaContainsTupThenGetReturnValue!271 lt!438412 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117133 (= lt!438412 (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117133 (= (+!3078 lt!438075 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) lt!438415)))

(declare-fun b!988282 () Bool)

(declare-fun res!661041 () Bool)

(assert (=> b!988282 (=> (not res!661041) (not e!557274))))

(assert (=> b!988282 (= res!661041 (= (getValueByKey!512 (toList!6793 lt!438415) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))))

(declare-fun b!988283 () Bool)

(assert (=> b!988283 (= e!557274 (contains!5714 (toList!6793 lt!438415) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))

(assert (= (and d!117133 res!661042) b!988282))

(assert (= (and b!988282 res!661041) b!988283))

(declare-fun m!915327 () Bool)

(assert (=> d!117133 m!915327))

(declare-fun m!915329 () Bool)

(assert (=> d!117133 m!915329))

(declare-fun m!915331 () Bool)

(assert (=> d!117133 m!915331))

(declare-fun m!915333 () Bool)

(assert (=> d!117133 m!915333))

(declare-fun m!915335 () Bool)

(assert (=> b!988282 m!915335))

(declare-fun m!915337 () Bool)

(assert (=> b!988283 m!915337))

(assert (=> d!116985 d!117133))

(declare-fun d!117135 () Bool)

(declare-fun e!557275 () Bool)

(assert (=> d!117135 e!557275))

(declare-fun res!661044 () Bool)

(assert (=> d!117135 (=> (not res!661044) (not e!557275))))

(declare-fun lt!438419 () ListLongMap!13555)

(assert (=> d!117135 (= res!661044 (contains!5713 lt!438419 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438416 () List!20789)

(assert (=> d!117135 (= lt!438419 (ListLongMap!13556 lt!438416))))

(declare-fun lt!438417 () Unit!32789)

(declare-fun lt!438418 () Unit!32789)

(assert (=> d!117135 (= lt!438417 lt!438418)))

(assert (=> d!117135 (= (getValueByKey!512 lt!438416 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117135 (= lt!438418 (lemmaContainsTupThenGetReturnValue!271 lt!438416 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117135 (= lt!438416 (insertStrictlySorted!328 (toList!6793 lt!438075) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117135 (= (+!3078 lt!438075 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438419)))

(declare-fun b!988284 () Bool)

(declare-fun res!661043 () Bool)

(assert (=> b!988284 (=> (not res!661043) (not e!557275))))

(assert (=> b!988284 (= res!661043 (= (getValueByKey!512 (toList!6793 lt!438419) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!988285 () Bool)

(assert (=> b!988285 (= e!557275 (contains!5714 (toList!6793 lt!438419) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117135 res!661044) b!988284))

(assert (= (and b!988284 res!661043) b!988285))

(declare-fun m!915339 () Bool)

(assert (=> d!117135 m!915339))

(declare-fun m!915341 () Bool)

(assert (=> d!117135 m!915341))

(declare-fun m!915343 () Bool)

(assert (=> d!117135 m!915343))

(declare-fun m!915345 () Bool)

(assert (=> d!117135 m!915345))

(declare-fun m!915347 () Bool)

(assert (=> b!988284 m!915347))

(declare-fun m!915349 () Bool)

(assert (=> b!988285 m!915349))

(assert (=> d!116985 d!117135))

(declare-fun d!117137 () Bool)

(declare-fun e!557276 () Bool)

(assert (=> d!117137 e!557276))

(declare-fun res!661046 () Bool)

(assert (=> d!117137 (=> (not res!661046) (not e!557276))))

(declare-fun lt!438423 () ListLongMap!13555)

(assert (=> d!117137 (= res!661046 (contains!5713 lt!438423 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(declare-fun lt!438420 () List!20789)

(assert (=> d!117137 (= lt!438423 (ListLongMap!13556 lt!438420))))

(declare-fun lt!438421 () Unit!32789)

(declare-fun lt!438422 () Unit!32789)

(assert (=> d!117137 (= lt!438421 lt!438422)))

(assert (=> d!117137 (= (getValueByKey!512 lt!438420 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117137 (= lt!438422 (lemmaContainsTupThenGetReturnValue!271 lt!438420 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117137 (= lt!438420 (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438075 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))))))

(assert (=> d!117137 (= (+!3078 (+!3078 lt!438075 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)) lt!438423)))

(declare-fun b!988286 () Bool)

(declare-fun res!661045 () Bool)

(assert (=> b!988286 (=> (not res!661045) (not e!557276))))

(assert (=> b!988286 (= res!661045 (= (getValueByKey!512 (toList!6793 lt!438423) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))))

(declare-fun b!988287 () Bool)

(assert (=> b!988287 (= e!557276 (contains!5714 (toList!6793 lt!438423) (tuple2!14859 (select (arr!30058 _keys!1544) from!1932) lt!438070)))))

(assert (= (and d!117137 res!661046) b!988286))

(assert (= (and b!988286 res!661045) b!988287))

(declare-fun m!915351 () Bool)

(assert (=> d!117137 m!915351))

(declare-fun m!915353 () Bool)

(assert (=> d!117137 m!915353))

(declare-fun m!915355 () Bool)

(assert (=> d!117137 m!915355))

(declare-fun m!915357 () Bool)

(assert (=> d!117137 m!915357))

(declare-fun m!915359 () Bool)

(assert (=> b!988286 m!915359))

(declare-fun m!915361 () Bool)

(assert (=> b!988287 m!915361))

(assert (=> d!116985 d!117137))

(declare-fun d!117139 () Bool)

(declare-fun e!557278 () Bool)

(assert (=> d!117139 e!557278))

(declare-fun res!661047 () Bool)

(assert (=> d!117139 (=> res!661047 e!557278)))

(declare-fun lt!438425 () Bool)

(assert (=> d!117139 (= res!661047 (not lt!438425))))

(declare-fun lt!438424 () Bool)

(assert (=> d!117139 (= lt!438425 lt!438424)))

(declare-fun lt!438426 () Unit!32789)

(declare-fun e!557277 () Unit!32789)

(assert (=> d!117139 (= lt!438426 e!557277)))

(declare-fun c!100171 () Bool)

(assert (=> d!117139 (= c!100171 lt!438424)))

(assert (=> d!117139 (= lt!438424 (containsKey!477 (toList!6793 lt!438120) (_1!7440 lt!438074)))))

(assert (=> d!117139 (= (contains!5713 lt!438120 (_1!7440 lt!438074)) lt!438425)))

(declare-fun b!988288 () Bool)

(declare-fun lt!438427 () Unit!32789)

(assert (=> b!988288 (= e!557277 lt!438427)))

(assert (=> b!988288 (= lt!438427 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438120) (_1!7440 lt!438074)))))

(assert (=> b!988288 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438120) (_1!7440 lt!438074)))))

(declare-fun b!988289 () Bool)

(declare-fun Unit!32802 () Unit!32789)

(assert (=> b!988289 (= e!557277 Unit!32802)))

(declare-fun b!988290 () Bool)

(assert (=> b!988290 (= e!557278 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438120) (_1!7440 lt!438074))))))

(assert (= (and d!117139 c!100171) b!988288))

(assert (= (and d!117139 (not c!100171)) b!988289))

(assert (= (and d!117139 (not res!661047)) b!988290))

(declare-fun m!915363 () Bool)

(assert (=> d!117139 m!915363))

(declare-fun m!915365 () Bool)

(assert (=> b!988288 m!915365))

(assert (=> b!988288 m!914653))

(assert (=> b!988288 m!914653))

(declare-fun m!915367 () Bool)

(assert (=> b!988288 m!915367))

(assert (=> b!988290 m!914653))

(assert (=> b!988290 m!914653))

(assert (=> b!988290 m!915367))

(assert (=> d!116967 d!117139))

(declare-fun b!988291 () Bool)

(declare-fun e!557279 () Option!518)

(assert (=> b!988291 (= e!557279 (Some!517 (_2!7440 (h!21947 lt!438117))))))

(declare-fun b!988293 () Bool)

(declare-fun e!557280 () Option!518)

(assert (=> b!988293 (= e!557280 (getValueByKey!512 (t!29724 lt!438117) (_1!7440 lt!438074)))))

(declare-fun b!988294 () Bool)

(assert (=> b!988294 (= e!557280 None!516)))

(declare-fun b!988292 () Bool)

(assert (=> b!988292 (= e!557279 e!557280)))

(declare-fun c!100173 () Bool)

(assert (=> b!988292 (= c!100173 (and ((_ is Cons!20785) lt!438117) (not (= (_1!7440 (h!21947 lt!438117)) (_1!7440 lt!438074)))))))

(declare-fun d!117141 () Bool)

(declare-fun c!100172 () Bool)

(assert (=> d!117141 (= c!100172 (and ((_ is Cons!20785) lt!438117) (= (_1!7440 (h!21947 lt!438117)) (_1!7440 lt!438074))))))

(assert (=> d!117141 (= (getValueByKey!512 lt!438117 (_1!7440 lt!438074)) e!557279)))

(assert (= (and d!117141 c!100172) b!988291))

(assert (= (and d!117141 (not c!100172)) b!988292))

(assert (= (and b!988292 c!100173) b!988293))

(assert (= (and b!988292 (not c!100173)) b!988294))

(declare-fun m!915369 () Bool)

(assert (=> b!988293 m!915369))

(assert (=> d!116967 d!117141))

(declare-fun d!117143 () Bool)

(assert (=> d!117143 (= (getValueByKey!512 lt!438117 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(declare-fun lt!438428 () Unit!32789)

(assert (=> d!117143 (= lt!438428 (choose!1606 lt!438117 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun e!557281 () Bool)

(assert (=> d!117143 e!557281))

(declare-fun res!661048 () Bool)

(assert (=> d!117143 (=> (not res!661048) (not e!557281))))

(assert (=> d!117143 (= res!661048 (isStrictlySorted!515 lt!438117))))

(assert (=> d!117143 (= (lemmaContainsTupThenGetReturnValue!271 lt!438117 (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438428)))

(declare-fun b!988295 () Bool)

(declare-fun res!661049 () Bool)

(assert (=> b!988295 (=> (not res!661049) (not e!557281))))

(assert (=> b!988295 (= res!661049 (containsKey!477 lt!438117 (_1!7440 lt!438074)))))

(declare-fun b!988296 () Bool)

(assert (=> b!988296 (= e!557281 (contains!5714 lt!438117 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(assert (= (and d!117143 res!661048) b!988295))

(assert (= (and b!988295 res!661049) b!988296))

(assert (=> d!117143 m!914647))

(declare-fun m!915371 () Bool)

(assert (=> d!117143 m!915371))

(declare-fun m!915373 () Bool)

(assert (=> d!117143 m!915373))

(declare-fun m!915375 () Bool)

(assert (=> b!988295 m!915375))

(declare-fun m!915377 () Bool)

(assert (=> b!988296 m!915377))

(assert (=> d!116967 d!117143))

(declare-fun bm!41862 () Bool)

(declare-fun call!41866 () List!20789)

(declare-fun call!41867 () List!20789)

(assert (=> bm!41862 (= call!41866 call!41867)))

(declare-fun b!988297 () Bool)

(declare-fun e!557285 () Bool)

(declare-fun lt!438429 () List!20789)

(assert (=> b!988297 (= e!557285 (contains!5714 lt!438429 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(declare-fun b!988298 () Bool)

(declare-fun e!557283 () List!20789)

(declare-fun call!41865 () List!20789)

(assert (=> b!988298 (= e!557283 call!41865)))

(declare-fun b!988300 () Bool)

(declare-fun c!100174 () Bool)

(assert (=> b!988300 (= c!100174 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438074))))))

(declare-fun e!557284 () List!20789)

(declare-fun e!557286 () List!20789)

(assert (=> b!988300 (= e!557284 e!557286)))

(declare-fun bm!41863 () Bool)

(assert (=> bm!41863 (= call!41867 call!41865)))

(declare-fun b!988301 () Bool)

(assert (=> b!988301 (= e!557283 e!557284)))

(declare-fun c!100177 () Bool)

(assert (=> b!988301 (= c!100177 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (= (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438074))))))

(declare-fun b!988302 () Bool)

(declare-fun e!557282 () List!20789)

(assert (=> b!988302 (= e!557282 (ite c!100177 (t!29724 (toList!6793 lt!438069)) (ite c!100174 (Cons!20785 (h!21947 (toList!6793 lt!438069)) (t!29724 (toList!6793 lt!438069))) Nil!20786)))))

(declare-fun b!988303 () Bool)

(assert (=> b!988303 (= e!557286 call!41866)))

(declare-fun b!988304 () Bool)

(assert (=> b!988304 (= e!557284 call!41867)))

(declare-fun c!100175 () Bool)

(declare-fun bm!41864 () Bool)

(assert (=> bm!41864 (= call!41865 ($colon$colon!554 e!557282 (ite c!100175 (h!21947 (toList!6793 lt!438069)) (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074)))))))

(declare-fun c!100176 () Bool)

(assert (=> bm!41864 (= c!100176 c!100175)))

(declare-fun b!988299 () Bool)

(assert (=> b!988299 (= e!557282 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438069)) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun d!117145 () Bool)

(assert (=> d!117145 e!557285))

(declare-fun res!661050 () Bool)

(assert (=> d!117145 (=> (not res!661050) (not e!557285))))

(assert (=> d!117145 (= res!661050 (isStrictlySorted!515 lt!438429))))

(assert (=> d!117145 (= lt!438429 e!557283)))

(assert (=> d!117145 (= c!100175 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438074))))))

(assert (=> d!117145 (isStrictlySorted!515 (toList!6793 lt!438069))))

(assert (=> d!117145 (= (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438429)))

(declare-fun b!988305 () Bool)

(declare-fun res!661051 () Bool)

(assert (=> b!988305 (=> (not res!661051) (not e!557285))))

(assert (=> b!988305 (= res!661051 (containsKey!477 lt!438429 (_1!7440 lt!438074)))))

(declare-fun b!988306 () Bool)

(assert (=> b!988306 (= e!557286 call!41866)))

(assert (= (and d!117145 c!100175) b!988298))

(assert (= (and d!117145 (not c!100175)) b!988301))

(assert (= (and b!988301 c!100177) b!988304))

(assert (= (and b!988301 (not c!100177)) b!988300))

(assert (= (and b!988300 c!100174) b!988306))

(assert (= (and b!988300 (not c!100174)) b!988303))

(assert (= (or b!988306 b!988303) bm!41862))

(assert (= (or b!988304 bm!41862) bm!41863))

(assert (= (or b!988298 bm!41863) bm!41864))

(assert (= (and bm!41864 c!100176) b!988299))

(assert (= (and bm!41864 (not c!100176)) b!988302))

(assert (= (and d!117145 res!661050) b!988305))

(assert (= (and b!988305 res!661051) b!988297))

(declare-fun m!915379 () Bool)

(assert (=> d!117145 m!915379))

(declare-fun m!915381 () Bool)

(assert (=> d!117145 m!915381))

(declare-fun m!915383 () Bool)

(assert (=> b!988297 m!915383))

(declare-fun m!915385 () Bool)

(assert (=> b!988305 m!915385))

(declare-fun m!915387 () Bool)

(assert (=> bm!41864 m!915387))

(declare-fun m!915389 () Bool)

(assert (=> b!988299 m!915389))

(assert (=> d!116967 d!117145))

(declare-fun d!117147 () Bool)

(declare-fun lt!438430 () Bool)

(assert (=> d!117147 (= lt!438430 (select (content!418 (toList!6793 lt!438255)) lt!438067))))

(declare-fun e!557287 () Bool)

(assert (=> d!117147 (= lt!438430 e!557287)))

(declare-fun res!661053 () Bool)

(assert (=> d!117147 (=> (not res!661053) (not e!557287))))

(assert (=> d!117147 (= res!661053 ((_ is Cons!20785) (toList!6793 lt!438255)))))

(assert (=> d!117147 (= (contains!5714 (toList!6793 lt!438255) lt!438067) lt!438430)))

(declare-fun b!988307 () Bool)

(declare-fun e!557288 () Bool)

(assert (=> b!988307 (= e!557287 e!557288)))

(declare-fun res!661052 () Bool)

(assert (=> b!988307 (=> res!661052 e!557288)))

(assert (=> b!988307 (= res!661052 (= (h!21947 (toList!6793 lt!438255)) lt!438067))))

(declare-fun b!988308 () Bool)

(assert (=> b!988308 (= e!557288 (contains!5714 (t!29724 (toList!6793 lt!438255)) lt!438067))))

(assert (= (and d!117147 res!661053) b!988307))

(assert (= (and b!988307 (not res!661052)) b!988308))

(declare-fun m!915391 () Bool)

(assert (=> d!117147 m!915391))

(declare-fun m!915393 () Bool)

(assert (=> d!117147 m!915393))

(declare-fun m!915395 () Bool)

(assert (=> b!988308 m!915395))

(assert (=> b!988048 d!117147))

(declare-fun d!117149 () Bool)

(declare-fun e!557290 () Bool)

(assert (=> d!117149 e!557290))

(declare-fun res!661054 () Bool)

(assert (=> d!117149 (=> res!661054 e!557290)))

(declare-fun lt!438432 () Bool)

(assert (=> d!117149 (= res!661054 (not lt!438432))))

(declare-fun lt!438431 () Bool)

(assert (=> d!117149 (= lt!438432 lt!438431)))

(declare-fun lt!438433 () Unit!32789)

(declare-fun e!557289 () Unit!32789)

(assert (=> d!117149 (= lt!438433 e!557289)))

(declare-fun c!100178 () Bool)

(assert (=> d!117149 (= c!100178 lt!438431)))

(assert (=> d!117149 (= lt!438431 (containsKey!477 (toList!6793 lt!438250) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117149 (= (contains!5713 lt!438250 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438432)))

(declare-fun b!988309 () Bool)

(declare-fun lt!438434 () Unit!32789)

(assert (=> b!988309 (= e!557289 lt!438434)))

(assert (=> b!988309 (= lt!438434 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438250) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988309 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988310 () Bool)

(declare-fun Unit!32803 () Unit!32789)

(assert (=> b!988310 (= e!557289 Unit!32803)))

(declare-fun b!988311 () Bool)

(assert (=> b!988311 (= e!557290 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117149 c!100178) b!988309))

(assert (= (and d!117149 (not c!100178)) b!988310))

(assert (= (and d!117149 (not res!661054)) b!988311))

(assert (=> d!117149 m!914659))

(declare-fun m!915397 () Bool)

(assert (=> d!117149 m!915397))

(assert (=> b!988309 m!914659))

(declare-fun m!915399 () Bool)

(assert (=> b!988309 m!915399))

(assert (=> b!988309 m!914659))

(declare-fun m!915401 () Bool)

(assert (=> b!988309 m!915401))

(assert (=> b!988309 m!915401))

(declare-fun m!915403 () Bool)

(assert (=> b!988309 m!915403))

(assert (=> b!988311 m!914659))

(assert (=> b!988311 m!915401))

(assert (=> b!988311 m!915401))

(assert (=> b!988311 m!915403))

(assert (=> b!988044 d!117149))

(declare-fun d!117151 () Bool)

(declare-fun lt!438435 () Bool)

(assert (=> d!117151 (= lt!438435 (select (content!418 (toList!6793 lt!438259)) lt!438074))))

(declare-fun e!557291 () Bool)

(assert (=> d!117151 (= lt!438435 e!557291)))

(declare-fun res!661056 () Bool)

(assert (=> d!117151 (=> (not res!661056) (not e!557291))))

(assert (=> d!117151 (= res!661056 ((_ is Cons!20785) (toList!6793 lt!438259)))))

(assert (=> d!117151 (= (contains!5714 (toList!6793 lt!438259) lt!438074) lt!438435)))

(declare-fun b!988312 () Bool)

(declare-fun e!557292 () Bool)

(assert (=> b!988312 (= e!557291 e!557292)))

(declare-fun res!661055 () Bool)

(assert (=> b!988312 (=> res!661055 e!557292)))

(assert (=> b!988312 (= res!661055 (= (h!21947 (toList!6793 lt!438259)) lt!438074))))

(declare-fun b!988313 () Bool)

(assert (=> b!988313 (= e!557292 (contains!5714 (t!29724 (toList!6793 lt!438259)) lt!438074))))

(assert (= (and d!117151 res!661056) b!988312))

(assert (= (and b!988312 (not res!661055)) b!988313))

(declare-fun m!915405 () Bool)

(assert (=> d!117151 m!915405))

(declare-fun m!915407 () Bool)

(assert (=> d!117151 m!915407))

(declare-fun m!915409 () Bool)

(assert (=> b!988313 m!915409))

(assert (=> b!988050 d!117151))

(declare-fun d!117153 () Bool)

(declare-fun e!557294 () Bool)

(assert (=> d!117153 e!557294))

(declare-fun res!661057 () Bool)

(assert (=> d!117153 (=> res!661057 e!557294)))

(declare-fun lt!438437 () Bool)

(assert (=> d!117153 (= res!661057 (not lt!438437))))

(declare-fun lt!438436 () Bool)

(assert (=> d!117153 (= lt!438437 lt!438436)))

(declare-fun lt!438438 () Unit!32789)

(declare-fun e!557293 () Unit!32789)

(assert (=> d!117153 (= lt!438438 e!557293)))

(declare-fun c!100179 () Bool)

(assert (=> d!117153 (= c!100179 lt!438436)))

(assert (=> d!117153 (= lt!438436 (containsKey!477 (toList!6793 lt!438210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117153 (= (contains!5713 lt!438210 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438437)))

(declare-fun b!988314 () Bool)

(declare-fun lt!438439 () Unit!32789)

(assert (=> b!988314 (= e!557293 lt!438439)))

(assert (=> b!988314 (= lt!438439 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988314 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988315 () Bool)

(declare-fun Unit!32804 () Unit!32789)

(assert (=> b!988315 (= e!557293 Unit!32804)))

(declare-fun b!988316 () Bool)

(assert (=> b!988316 (= e!557294 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117153 c!100179) b!988314))

(assert (= (and d!117153 (not c!100179)) b!988315))

(assert (= (and d!117153 (not res!661057)) b!988316))

(declare-fun m!915411 () Bool)

(assert (=> d!117153 m!915411))

(declare-fun m!915413 () Bool)

(assert (=> b!988314 m!915413))

(declare-fun m!915415 () Bool)

(assert (=> b!988314 m!915415))

(assert (=> b!988314 m!915415))

(declare-fun m!915417 () Bool)

(assert (=> b!988314 m!915417))

(assert (=> b!988316 m!915415))

(assert (=> b!988316 m!915415))

(assert (=> b!988316 m!915417))

(assert (=> bm!41833 d!117153))

(declare-fun b!988317 () Bool)

(declare-fun e!557295 () Bool)

(declare-fun lt!438445 () ListLongMap!13555)

(assert (=> b!988317 (= e!557295 (isEmpty!720 lt!438445))))

(declare-fun d!117155 () Bool)

(declare-fun e!557300 () Bool)

(assert (=> d!117155 e!557300))

(declare-fun res!661060 () Bool)

(assert (=> d!117155 (=> (not res!661060) (not e!557300))))

(assert (=> d!117155 (= res!661060 (not (contains!5713 lt!438445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557301 () ListLongMap!13555)

(assert (=> d!117155 (= lt!438445 e!557301)))

(declare-fun c!100183 () Bool)

(assert (=> d!117155 (= c!100183 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(assert (=> d!117155 (validMask!0 mask!1948)))

(assert (=> d!117155 (= (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!438445)))

(declare-fun b!988318 () Bool)

(declare-fun e!557297 () Bool)

(assert (=> b!988318 (= e!557300 e!557297)))

(declare-fun c!100180 () Bool)

(declare-fun e!557298 () Bool)

(assert (=> b!988318 (= c!100180 e!557298)))

(declare-fun res!661058 () Bool)

(assert (=> b!988318 (=> (not res!661058) (not e!557298))))

(assert (=> b!988318 (= res!661058 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(declare-fun b!988319 () Bool)

(assert (=> b!988319 (= e!557301 (ListLongMap!13556 Nil!20786))))

(declare-fun b!988320 () Bool)

(declare-fun e!557299 () ListLongMap!13555)

(declare-fun call!41868 () ListLongMap!13555)

(assert (=> b!988320 (= e!557299 call!41868)))

(declare-fun b!988321 () Bool)

(assert (=> b!988321 (= e!557301 e!557299)))

(declare-fun c!100181 () Bool)

(assert (=> b!988321 (= c!100181 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!988322 () Bool)

(declare-fun res!661059 () Bool)

(assert (=> b!988322 (=> (not res!661059) (not e!557300))))

(assert (=> b!988322 (= res!661059 (not (contains!5713 lt!438445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988323 () Bool)

(assert (=> b!988323 (= e!557298 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!988323 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!988324 () Bool)

(assert (=> b!988324 (= e!557297 e!557295)))

(declare-fun c!100182 () Bool)

(assert (=> b!988324 (= c!100182 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(declare-fun b!988325 () Bool)

(declare-fun lt!438442 () Unit!32789)

(declare-fun lt!438441 () Unit!32789)

(assert (=> b!988325 (= lt!438442 lt!438441)))

(declare-fun lt!438444 () (_ BitVec 64))

(declare-fun lt!438443 () V!35947)

(declare-fun lt!438440 () (_ BitVec 64))

(declare-fun lt!438446 () ListLongMap!13555)

(assert (=> b!988325 (not (contains!5713 (+!3078 lt!438446 (tuple2!14859 lt!438444 lt!438443)) lt!438440))))

(assert (=> b!988325 (= lt!438441 (addStillNotContains!232 lt!438446 lt!438444 lt!438443 lt!438440))))

(assert (=> b!988325 (= lt!438440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988325 (= lt!438443 (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988325 (= lt!438444 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!988325 (= lt!438446 call!41868)))

(assert (=> b!988325 (= e!557299 (+!3078 call!41868 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988326 () Bool)

(declare-fun e!557296 () Bool)

(assert (=> b!988326 (= e!557297 e!557296)))

(assert (=> b!988326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(declare-fun res!661061 () Bool)

(assert (=> b!988326 (= res!661061 (contains!5713 lt!438445 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!988326 (=> (not res!661061) (not e!557296))))

(declare-fun b!988327 () Bool)

(assert (=> b!988327 (= e!557295 (= lt!438445 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41865 () Bool)

(assert (=> bm!41865 (= call!41868 (getCurrentListMapNoExtraKeys!3484 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988328 () Bool)

(assert (=> b!988328 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(assert (=> b!988328 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30538 _values!1278)))))

(assert (=> b!988328 (= e!557296 (= (apply!893 lt!438445 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!117155 c!100183) b!988319))

(assert (= (and d!117155 (not c!100183)) b!988321))

(assert (= (and b!988321 c!100181) b!988325))

(assert (= (and b!988321 (not c!100181)) b!988320))

(assert (= (or b!988325 b!988320) bm!41865))

(assert (= (and d!117155 res!661060) b!988322))

(assert (= (and b!988322 res!661059) b!988318))

(assert (= (and b!988318 res!661058) b!988323))

(assert (= (and b!988318 c!100180) b!988326))

(assert (= (and b!988318 (not c!100180)) b!988324))

(assert (= (and b!988326 res!661061) b!988328))

(assert (= (and b!988324 c!100182) b!988327))

(assert (= (and b!988324 (not c!100182)) b!988317))

(declare-fun b_lambda!15065 () Bool)

(assert (=> (not b_lambda!15065) (not b!988325)))

(assert (=> b!988325 t!29723))

(declare-fun b_and!32101 () Bool)

(assert (= b_and!32099 (and (=> t!29723 result!13563) b_and!32101)))

(declare-fun b_lambda!15067 () Bool)

(assert (=> (not b_lambda!15067) (not b!988328)))

(assert (=> b!988328 t!29723))

(declare-fun b_and!32103 () Bool)

(assert (= b_and!32101 (and (=> t!29723 result!13563) b_and!32103)))

(declare-fun m!915419 () Bool)

(assert (=> bm!41865 m!915419))

(declare-fun m!915421 () Bool)

(assert (=> b!988321 m!915421))

(assert (=> b!988321 m!915421))

(declare-fun m!915423 () Bool)

(assert (=> b!988321 m!915423))

(declare-fun m!915425 () Bool)

(assert (=> d!117155 m!915425))

(assert (=> d!117155 m!914539))

(declare-fun m!915427 () Bool)

(assert (=> b!988328 m!915427))

(assert (=> b!988328 m!914581))

(declare-fun m!915429 () Bool)

(assert (=> b!988328 m!915429))

(assert (=> b!988328 m!915421))

(assert (=> b!988328 m!915427))

(assert (=> b!988328 m!914581))

(assert (=> b!988328 m!915421))

(declare-fun m!915431 () Bool)

(assert (=> b!988328 m!915431))

(assert (=> b!988327 m!915419))

(assert (=> b!988326 m!915421))

(assert (=> b!988326 m!915421))

(declare-fun m!915433 () Bool)

(assert (=> b!988326 m!915433))

(declare-fun m!915435 () Bool)

(assert (=> b!988325 m!915435))

(assert (=> b!988325 m!915427))

(assert (=> b!988325 m!914581))

(assert (=> b!988325 m!915429))

(declare-fun m!915437 () Bool)

(assert (=> b!988325 m!915437))

(declare-fun m!915439 () Bool)

(assert (=> b!988325 m!915439))

(declare-fun m!915441 () Bool)

(assert (=> b!988325 m!915441))

(assert (=> b!988325 m!915421))

(assert (=> b!988325 m!915427))

(assert (=> b!988325 m!914581))

(assert (=> b!988325 m!915437))

(declare-fun m!915443 () Bool)

(assert (=> b!988317 m!915443))

(declare-fun m!915445 () Bool)

(assert (=> b!988322 m!915445))

(assert (=> b!988323 m!915421))

(assert (=> b!988323 m!915421))

(assert (=> b!988323 m!915423))

(assert (=> bm!41845 d!117155))

(declare-fun d!117157 () Bool)

(declare-fun e!557303 () Bool)

(assert (=> d!117157 e!557303))

(declare-fun res!661062 () Bool)

(assert (=> d!117157 (=> res!661062 e!557303)))

(declare-fun lt!438448 () Bool)

(assert (=> d!117157 (= res!661062 (not lt!438448))))

(declare-fun lt!438447 () Bool)

(assert (=> d!117157 (= lt!438448 lt!438447)))

(declare-fun lt!438449 () Unit!32789)

(declare-fun e!557302 () Unit!32789)

(assert (=> d!117157 (= lt!438449 e!557302)))

(declare-fun c!100184 () Bool)

(assert (=> d!117157 (= c!100184 lt!438447)))

(assert (=> d!117157 (= lt!438447 (containsKey!477 (toList!6793 lt!438259) (_1!7440 lt!438074)))))

(assert (=> d!117157 (= (contains!5713 lt!438259 (_1!7440 lt!438074)) lt!438448)))

(declare-fun b!988329 () Bool)

(declare-fun lt!438450 () Unit!32789)

(assert (=> b!988329 (= e!557302 lt!438450)))

(assert (=> b!988329 (= lt!438450 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438259) (_1!7440 lt!438074)))))

(assert (=> b!988329 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438259) (_1!7440 lt!438074)))))

(declare-fun b!988330 () Bool)

(declare-fun Unit!32805 () Unit!32789)

(assert (=> b!988330 (= e!557302 Unit!32805)))

(declare-fun b!988331 () Bool)

(assert (=> b!988331 (= e!557303 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438259) (_1!7440 lt!438074))))))

(assert (= (and d!117157 c!100184) b!988329))

(assert (= (and d!117157 (not c!100184)) b!988330))

(assert (= (and d!117157 (not res!661062)) b!988331))

(declare-fun m!915447 () Bool)

(assert (=> d!117157 m!915447))

(declare-fun m!915449 () Bool)

(assert (=> b!988329 m!915449))

(assert (=> b!988329 m!914861))

(assert (=> b!988329 m!914861))

(declare-fun m!915451 () Bool)

(assert (=> b!988329 m!915451))

(assert (=> b!988331 m!914861))

(assert (=> b!988331 m!914861))

(assert (=> b!988331 m!915451))

(assert (=> d!116991 d!117157))

(declare-fun b!988332 () Bool)

(declare-fun e!557304 () Option!518)

(assert (=> b!988332 (= e!557304 (Some!517 (_2!7440 (h!21947 lt!438256))))))

(declare-fun b!988334 () Bool)

(declare-fun e!557305 () Option!518)

(assert (=> b!988334 (= e!557305 (getValueByKey!512 (t!29724 lt!438256) (_1!7440 lt!438074)))))

(declare-fun b!988335 () Bool)

(assert (=> b!988335 (= e!557305 None!516)))

(declare-fun b!988333 () Bool)

(assert (=> b!988333 (= e!557304 e!557305)))

(declare-fun c!100186 () Bool)

(assert (=> b!988333 (= c!100186 (and ((_ is Cons!20785) lt!438256) (not (= (_1!7440 (h!21947 lt!438256)) (_1!7440 lt!438074)))))))

(declare-fun d!117159 () Bool)

(declare-fun c!100185 () Bool)

(assert (=> d!117159 (= c!100185 (and ((_ is Cons!20785) lt!438256) (= (_1!7440 (h!21947 lt!438256)) (_1!7440 lt!438074))))))

(assert (=> d!117159 (= (getValueByKey!512 lt!438256 (_1!7440 lt!438074)) e!557304)))

(assert (= (and d!117159 c!100185) b!988332))

(assert (= (and d!117159 (not c!100185)) b!988333))

(assert (= (and b!988333 c!100186) b!988334))

(assert (= (and b!988333 (not c!100186)) b!988335))

(declare-fun m!915453 () Bool)

(assert (=> b!988334 m!915453))

(assert (=> d!116991 d!117159))

(declare-fun d!117161 () Bool)

(assert (=> d!117161 (= (getValueByKey!512 lt!438256 (_1!7440 lt!438074)) (Some!517 (_2!7440 lt!438074)))))

(declare-fun lt!438451 () Unit!32789)

(assert (=> d!117161 (= lt!438451 (choose!1606 lt!438256 (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun e!557306 () Bool)

(assert (=> d!117161 e!557306))

(declare-fun res!661063 () Bool)

(assert (=> d!117161 (=> (not res!661063) (not e!557306))))

(assert (=> d!117161 (= res!661063 (isStrictlySorted!515 lt!438256))))

(assert (=> d!117161 (= (lemmaContainsTupThenGetReturnValue!271 lt!438256 (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438451)))

(declare-fun b!988336 () Bool)

(declare-fun res!661064 () Bool)

(assert (=> b!988336 (=> (not res!661064) (not e!557306))))

(assert (=> b!988336 (= res!661064 (containsKey!477 lt!438256 (_1!7440 lt!438074)))))

(declare-fun b!988337 () Bool)

(assert (=> b!988337 (= e!557306 (contains!5714 lt!438256 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(assert (= (and d!117161 res!661063) b!988336))

(assert (= (and b!988336 res!661064) b!988337))

(assert (=> d!117161 m!914855))

(declare-fun m!915455 () Bool)

(assert (=> d!117161 m!915455))

(declare-fun m!915457 () Bool)

(assert (=> d!117161 m!915457))

(declare-fun m!915459 () Bool)

(assert (=> b!988336 m!915459))

(declare-fun m!915461 () Bool)

(assert (=> b!988337 m!915461))

(assert (=> d!116991 d!117161))

(declare-fun bm!41866 () Bool)

(declare-fun call!41870 () List!20789)

(declare-fun call!41871 () List!20789)

(assert (=> bm!41866 (= call!41870 call!41871)))

(declare-fun b!988338 () Bool)

(declare-fun e!557310 () Bool)

(declare-fun lt!438452 () List!20789)

(assert (=> b!988338 (= e!557310 (contains!5714 lt!438452 (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074))))))

(declare-fun b!988339 () Bool)

(declare-fun e!557308 () List!20789)

(declare-fun call!41869 () List!20789)

(assert (=> b!988339 (= e!557308 call!41869)))

(declare-fun b!988341 () Bool)

(declare-fun c!100187 () Bool)

(assert (=> b!988341 (= c!100187 (and ((_ is Cons!20785) (toList!6793 lt!438072)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438072))) (_1!7440 lt!438074))))))

(declare-fun e!557309 () List!20789)

(declare-fun e!557311 () List!20789)

(assert (=> b!988341 (= e!557309 e!557311)))

(declare-fun bm!41867 () Bool)

(assert (=> bm!41867 (= call!41871 call!41869)))

(declare-fun b!988342 () Bool)

(assert (=> b!988342 (= e!557308 e!557309)))

(declare-fun c!100190 () Bool)

(assert (=> b!988342 (= c!100190 (and ((_ is Cons!20785) (toList!6793 lt!438072)) (= (_1!7440 (h!21947 (toList!6793 lt!438072))) (_1!7440 lt!438074))))))

(declare-fun b!988343 () Bool)

(declare-fun e!557307 () List!20789)

(assert (=> b!988343 (= e!557307 (ite c!100190 (t!29724 (toList!6793 lt!438072)) (ite c!100187 (Cons!20785 (h!21947 (toList!6793 lt!438072)) (t!29724 (toList!6793 lt!438072))) Nil!20786)))))

(declare-fun b!988344 () Bool)

(assert (=> b!988344 (= e!557311 call!41870)))

(declare-fun b!988345 () Bool)

(assert (=> b!988345 (= e!557309 call!41871)))

(declare-fun bm!41868 () Bool)

(declare-fun c!100188 () Bool)

(assert (=> bm!41868 (= call!41869 ($colon$colon!554 e!557307 (ite c!100188 (h!21947 (toList!6793 lt!438072)) (tuple2!14859 (_1!7440 lt!438074) (_2!7440 lt!438074)))))))

(declare-fun c!100189 () Bool)

(assert (=> bm!41868 (= c!100189 c!100188)))

(declare-fun b!988340 () Bool)

(assert (=> b!988340 (= e!557307 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438072)) (_1!7440 lt!438074) (_2!7440 lt!438074)))))

(declare-fun d!117163 () Bool)

(assert (=> d!117163 e!557310))

(declare-fun res!661065 () Bool)

(assert (=> d!117163 (=> (not res!661065) (not e!557310))))

(assert (=> d!117163 (= res!661065 (isStrictlySorted!515 lt!438452))))

(assert (=> d!117163 (= lt!438452 e!557308)))

(assert (=> d!117163 (= c!100188 (and ((_ is Cons!20785) (toList!6793 lt!438072)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438072))) (_1!7440 lt!438074))))))

(assert (=> d!117163 (isStrictlySorted!515 (toList!6793 lt!438072))))

(assert (=> d!117163 (= (insertStrictlySorted!328 (toList!6793 lt!438072) (_1!7440 lt!438074) (_2!7440 lt!438074)) lt!438452)))

(declare-fun b!988346 () Bool)

(declare-fun res!661066 () Bool)

(assert (=> b!988346 (=> (not res!661066) (not e!557310))))

(assert (=> b!988346 (= res!661066 (containsKey!477 lt!438452 (_1!7440 lt!438074)))))

(declare-fun b!988347 () Bool)

(assert (=> b!988347 (= e!557311 call!41870)))

(assert (= (and d!117163 c!100188) b!988339))

(assert (= (and d!117163 (not c!100188)) b!988342))

(assert (= (and b!988342 c!100190) b!988345))

(assert (= (and b!988342 (not c!100190)) b!988341))

(assert (= (and b!988341 c!100187) b!988347))

(assert (= (and b!988341 (not c!100187)) b!988344))

(assert (= (or b!988347 b!988344) bm!41866))

(assert (= (or b!988345 bm!41866) bm!41867))

(assert (= (or b!988339 bm!41867) bm!41868))

(assert (= (and bm!41868 c!100189) b!988340))

(assert (= (and bm!41868 (not c!100189)) b!988343))

(assert (= (and d!117163 res!661065) b!988346))

(assert (= (and b!988346 res!661066) b!988338))

(declare-fun m!915463 () Bool)

(assert (=> d!117163 m!915463))

(declare-fun m!915465 () Bool)

(assert (=> d!117163 m!915465))

(declare-fun m!915467 () Bool)

(assert (=> b!988338 m!915467))

(declare-fun m!915469 () Bool)

(assert (=> b!988346 m!915469))

(declare-fun m!915471 () Bool)

(assert (=> bm!41868 m!915471))

(declare-fun m!915473 () Bool)

(assert (=> b!988340 m!915473))

(assert (=> d!116991 d!117163))

(declare-fun d!117165 () Bool)

(assert (=> d!117165 (= (apply!893 lt!438210 (select (arr!30058 _keys!1544) from!1932)) (get!15601 (getValueByKey!512 (toList!6793 lt!438210) (select (arr!30058 _keys!1544) from!1932))))))

(declare-fun bs!28050 () Bool)

(assert (= bs!28050 d!117165))

(assert (=> bs!28050 m!914545))

(declare-fun m!915475 () Bool)

(assert (=> bs!28050 m!915475))

(assert (=> bs!28050 m!915475))

(declare-fun m!915477 () Bool)

(assert (=> bs!28050 m!915477))

(assert (=> b!987971 d!117165))

(assert (=> b!987971 d!116995))

(declare-fun d!117167 () Bool)

(assert (=> d!117167 (= (apply!893 lt!438180 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15601 (getValueByKey!512 (toList!6793 lt!438180) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28051 () Bool)

(assert (= bs!28051 d!117167))

(assert (=> bs!28051 m!914659))

(declare-fun m!915479 () Bool)

(assert (=> bs!28051 m!915479))

(assert (=> bs!28051 m!915479))

(declare-fun m!915481 () Bool)

(assert (=> bs!28051 m!915481))

(assert (=> b!987946 d!117167))

(declare-fun d!117169 () Bool)

(declare-fun c!100191 () Bool)

(assert (=> d!117169 (= c!100191 ((_ is ValueCellFull!11130) (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!557312 () V!35947)

(assert (=> d!117169 (= (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557312)))

(declare-fun b!988348 () Bool)

(assert (=> b!988348 (= e!557312 (get!15599 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988349 () Bool)

(assert (=> b!988349 (= e!557312 (get!15600 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117169 c!100191) b!988348))

(assert (= (and d!117169 (not c!100191)) b!988349))

(assert (=> b!988348 m!914701))

(assert (=> b!988348 m!914581))

(declare-fun m!915483 () Bool)

(assert (=> b!988348 m!915483))

(assert (=> b!988349 m!914701))

(assert (=> b!988349 m!914581))

(declare-fun m!915485 () Bool)

(assert (=> b!988349 m!915485))

(assert (=> b!987946 d!117169))

(declare-fun d!117171 () Bool)

(declare-fun e!557314 () Bool)

(assert (=> d!117171 e!557314))

(declare-fun res!661067 () Bool)

(assert (=> d!117171 (=> res!661067 e!557314)))

(declare-fun lt!438454 () Bool)

(assert (=> d!117171 (= res!661067 (not lt!438454))))

(declare-fun lt!438453 () Bool)

(assert (=> d!117171 (= lt!438454 lt!438453)))

(declare-fun lt!438455 () Unit!32789)

(declare-fun e!557313 () Unit!32789)

(assert (=> d!117171 (= lt!438455 e!557313)))

(declare-fun c!100192 () Bool)

(assert (=> d!117171 (= c!100192 lt!438453)))

(assert (=> d!117171 (= lt!438453 (containsKey!477 (toList!6793 lt!438263) (_1!7440 lt!438068)))))

(assert (=> d!117171 (= (contains!5713 lt!438263 (_1!7440 lt!438068)) lt!438454)))

(declare-fun b!988350 () Bool)

(declare-fun lt!438456 () Unit!32789)

(assert (=> b!988350 (= e!557313 lt!438456)))

(assert (=> b!988350 (= lt!438456 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438263) (_1!7440 lt!438068)))))

(assert (=> b!988350 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438263) (_1!7440 lt!438068)))))

(declare-fun b!988351 () Bool)

(declare-fun Unit!32806 () Unit!32789)

(assert (=> b!988351 (= e!557313 Unit!32806)))

(declare-fun b!988352 () Bool)

(assert (=> b!988352 (= e!557314 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438263) (_1!7440 lt!438068))))))

(assert (= (and d!117171 c!100192) b!988350))

(assert (= (and d!117171 (not c!100192)) b!988351))

(assert (= (and d!117171 (not res!661067)) b!988352))

(declare-fun m!915487 () Bool)

(assert (=> d!117171 m!915487))

(declare-fun m!915489 () Bool)

(assert (=> b!988350 m!915489))

(assert (=> b!988350 m!914873))

(assert (=> b!988350 m!914873))

(declare-fun m!915491 () Bool)

(assert (=> b!988350 m!915491))

(assert (=> b!988352 m!914873))

(assert (=> b!988352 m!914873))

(assert (=> b!988352 m!915491))

(assert (=> d!116993 d!117171))

(declare-fun b!988353 () Bool)

(declare-fun e!557315 () Option!518)

(assert (=> b!988353 (= e!557315 (Some!517 (_2!7440 (h!21947 lt!438260))))))

(declare-fun b!988355 () Bool)

(declare-fun e!557316 () Option!518)

(assert (=> b!988355 (= e!557316 (getValueByKey!512 (t!29724 lt!438260) (_1!7440 lt!438068)))))

(declare-fun b!988356 () Bool)

(assert (=> b!988356 (= e!557316 None!516)))

(declare-fun b!988354 () Bool)

(assert (=> b!988354 (= e!557315 e!557316)))

(declare-fun c!100194 () Bool)

(assert (=> b!988354 (= c!100194 (and ((_ is Cons!20785) lt!438260) (not (= (_1!7440 (h!21947 lt!438260)) (_1!7440 lt!438068)))))))

(declare-fun d!117173 () Bool)

(declare-fun c!100193 () Bool)

(assert (=> d!117173 (= c!100193 (and ((_ is Cons!20785) lt!438260) (= (_1!7440 (h!21947 lt!438260)) (_1!7440 lt!438068))))))

(assert (=> d!117173 (= (getValueByKey!512 lt!438260 (_1!7440 lt!438068)) e!557315)))

(assert (= (and d!117173 c!100193) b!988353))

(assert (= (and d!117173 (not c!100193)) b!988354))

(assert (= (and b!988354 c!100194) b!988355))

(assert (= (and b!988354 (not c!100194)) b!988356))

(declare-fun m!915493 () Bool)

(assert (=> b!988355 m!915493))

(assert (=> d!116993 d!117173))

(declare-fun d!117175 () Bool)

(assert (=> d!117175 (= (getValueByKey!512 lt!438260 (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068)))))

(declare-fun lt!438457 () Unit!32789)

(assert (=> d!117175 (= lt!438457 (choose!1606 lt!438260 (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(declare-fun e!557317 () Bool)

(assert (=> d!117175 e!557317))

(declare-fun res!661068 () Bool)

(assert (=> d!117175 (=> (not res!661068) (not e!557317))))

(assert (=> d!117175 (= res!661068 (isStrictlySorted!515 lt!438260))))

(assert (=> d!117175 (= (lemmaContainsTupThenGetReturnValue!271 lt!438260 (_1!7440 lt!438068) (_2!7440 lt!438068)) lt!438457)))

(declare-fun b!988357 () Bool)

(declare-fun res!661069 () Bool)

(assert (=> b!988357 (=> (not res!661069) (not e!557317))))

(assert (=> b!988357 (= res!661069 (containsKey!477 lt!438260 (_1!7440 lt!438068)))))

(declare-fun b!988358 () Bool)

(assert (=> b!988358 (= e!557317 (contains!5714 lt!438260 (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068))))))

(assert (= (and d!117175 res!661068) b!988357))

(assert (= (and b!988357 res!661069) b!988358))

(assert (=> d!117175 m!914867))

(declare-fun m!915495 () Bool)

(assert (=> d!117175 m!915495))

(declare-fun m!915497 () Bool)

(assert (=> d!117175 m!915497))

(declare-fun m!915499 () Bool)

(assert (=> b!988357 m!915499))

(declare-fun m!915501 () Bool)

(assert (=> b!988358 m!915501))

(assert (=> d!116993 d!117175))

(declare-fun bm!41869 () Bool)

(declare-fun call!41873 () List!20789)

(declare-fun call!41874 () List!20789)

(assert (=> bm!41869 (= call!41873 call!41874)))

(declare-fun b!988359 () Bool)

(declare-fun e!557321 () Bool)

(declare-fun lt!438458 () List!20789)

(assert (=> b!988359 (= e!557321 (contains!5714 lt!438458 (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068))))))

(declare-fun b!988360 () Bool)

(declare-fun e!557319 () List!20789)

(declare-fun call!41872 () List!20789)

(assert (=> b!988360 (= e!557319 call!41872)))

(declare-fun b!988362 () Bool)

(declare-fun c!100195 () Bool)

(assert (=> b!988362 (= c!100195 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438068))))))

(declare-fun e!557320 () List!20789)

(declare-fun e!557322 () List!20789)

(assert (=> b!988362 (= e!557320 e!557322)))

(declare-fun bm!41870 () Bool)

(assert (=> bm!41870 (= call!41874 call!41872)))

(declare-fun b!988363 () Bool)

(assert (=> b!988363 (= e!557319 e!557320)))

(declare-fun c!100198 () Bool)

(assert (=> b!988363 (= c!100198 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (= (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438068))))))

(declare-fun e!557318 () List!20789)

(declare-fun b!988364 () Bool)

(assert (=> b!988364 (= e!557318 (ite c!100198 (t!29724 (toList!6793 lt!438069)) (ite c!100195 (Cons!20785 (h!21947 (toList!6793 lt!438069)) (t!29724 (toList!6793 lt!438069))) Nil!20786)))))

(declare-fun b!988365 () Bool)

(assert (=> b!988365 (= e!557322 call!41873)))

(declare-fun b!988366 () Bool)

(assert (=> b!988366 (= e!557320 call!41874)))

(declare-fun bm!41871 () Bool)

(declare-fun c!100196 () Bool)

(assert (=> bm!41871 (= call!41872 ($colon$colon!554 e!557318 (ite c!100196 (h!21947 (toList!6793 lt!438069)) (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068)))))))

(declare-fun c!100197 () Bool)

(assert (=> bm!41871 (= c!100197 c!100196)))

(declare-fun b!988361 () Bool)

(assert (=> b!988361 (= e!557318 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438069)) (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(declare-fun d!117177 () Bool)

(assert (=> d!117177 e!557321))

(declare-fun res!661070 () Bool)

(assert (=> d!117177 (=> (not res!661070) (not e!557321))))

(assert (=> d!117177 (= res!661070 (isStrictlySorted!515 lt!438458))))

(assert (=> d!117177 (= lt!438458 e!557319)))

(assert (=> d!117177 (= c!100196 (and ((_ is Cons!20785) (toList!6793 lt!438069)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438069))) (_1!7440 lt!438068))))))

(assert (=> d!117177 (isStrictlySorted!515 (toList!6793 lt!438069))))

(assert (=> d!117177 (= (insertStrictlySorted!328 (toList!6793 lt!438069) (_1!7440 lt!438068) (_2!7440 lt!438068)) lt!438458)))

(declare-fun b!988367 () Bool)

(declare-fun res!661071 () Bool)

(assert (=> b!988367 (=> (not res!661071) (not e!557321))))

(assert (=> b!988367 (= res!661071 (containsKey!477 lt!438458 (_1!7440 lt!438068)))))

(declare-fun b!988368 () Bool)

(assert (=> b!988368 (= e!557322 call!41873)))

(assert (= (and d!117177 c!100196) b!988360))

(assert (= (and d!117177 (not c!100196)) b!988363))

(assert (= (and b!988363 c!100198) b!988366))

(assert (= (and b!988363 (not c!100198)) b!988362))

(assert (= (and b!988362 c!100195) b!988368))

(assert (= (and b!988362 (not c!100195)) b!988365))

(assert (= (or b!988368 b!988365) bm!41869))

(assert (= (or b!988366 bm!41869) bm!41870))

(assert (= (or b!988360 bm!41870) bm!41871))

(assert (= (and bm!41871 c!100197) b!988361))

(assert (= (and bm!41871 (not c!100197)) b!988364))

(assert (= (and d!117177 res!661070) b!988367))

(assert (= (and b!988367 res!661071) b!988359))

(declare-fun m!915503 () Bool)

(assert (=> d!117177 m!915503))

(assert (=> d!117177 m!915381))

(declare-fun m!915505 () Bool)

(assert (=> b!988359 m!915505))

(declare-fun m!915507 () Bool)

(assert (=> b!988367 m!915507))

(declare-fun m!915509 () Bool)

(assert (=> bm!41871 m!915509))

(declare-fun m!915511 () Bool)

(assert (=> b!988361 m!915511))

(assert (=> d!116993 d!117177))

(declare-fun d!117179 () Bool)

(declare-fun lt!438459 () Bool)

(assert (=> d!117179 (= lt!438459 (select (content!418 (toList!6793 lt!438190)) lt!438068))))

(declare-fun e!557323 () Bool)

(assert (=> d!117179 (= lt!438459 e!557323)))

(declare-fun res!661073 () Bool)

(assert (=> d!117179 (=> (not res!661073) (not e!557323))))

(assert (=> d!117179 (= res!661073 ((_ is Cons!20785) (toList!6793 lt!438190)))))

(assert (=> d!117179 (= (contains!5714 (toList!6793 lt!438190) lt!438068) lt!438459)))

(declare-fun b!988369 () Bool)

(declare-fun e!557324 () Bool)

(assert (=> b!988369 (= e!557323 e!557324)))

(declare-fun res!661072 () Bool)

(assert (=> b!988369 (=> res!661072 e!557324)))

(assert (=> b!988369 (= res!661072 (= (h!21947 (toList!6793 lt!438190)) lt!438068))))

(declare-fun b!988370 () Bool)

(assert (=> b!988370 (= e!557324 (contains!5714 (t!29724 (toList!6793 lt!438190)) lt!438068))))

(assert (= (and d!117179 res!661073) b!988369))

(assert (= (and b!988369 (not res!661072)) b!988370))

(declare-fun m!915513 () Bool)

(assert (=> d!117179 m!915513))

(declare-fun m!915515 () Bool)

(assert (=> d!117179 m!915515))

(declare-fun m!915517 () Bool)

(assert (=> b!988370 m!915517))

(assert (=> b!987958 d!117179))

(assert (=> b!988039 d!117037))

(declare-fun d!117181 () Bool)

(declare-fun lt!438460 () Bool)

(assert (=> d!117181 (= lt!438460 (select (content!418 (toList!6793 lt!438194)) lt!438074))))

(declare-fun e!557325 () Bool)

(assert (=> d!117181 (= lt!438460 e!557325)))

(declare-fun res!661075 () Bool)

(assert (=> d!117181 (=> (not res!661075) (not e!557325))))

(assert (=> d!117181 (= res!661075 ((_ is Cons!20785) (toList!6793 lt!438194)))))

(assert (=> d!117181 (= (contains!5714 (toList!6793 lt!438194) lt!438074) lt!438460)))

(declare-fun b!988371 () Bool)

(declare-fun e!557326 () Bool)

(assert (=> b!988371 (= e!557325 e!557326)))

(declare-fun res!661074 () Bool)

(assert (=> b!988371 (=> res!661074 e!557326)))

(assert (=> b!988371 (= res!661074 (= (h!21947 (toList!6793 lt!438194)) lt!438074))))

(declare-fun b!988372 () Bool)

(assert (=> b!988372 (= e!557326 (contains!5714 (t!29724 (toList!6793 lt!438194)) lt!438074))))

(assert (= (and d!117181 res!661075) b!988371))

(assert (= (and b!988371 (not res!661074)) b!988372))

(declare-fun m!915519 () Bool)

(assert (=> d!117181 m!915519))

(declare-fun m!915521 () Bool)

(assert (=> d!117181 m!915521))

(declare-fun m!915523 () Bool)

(assert (=> b!988372 m!915523))

(assert (=> b!987960 d!117181))

(declare-fun d!117183 () Bool)

(declare-fun lt!438461 () Bool)

(assert (=> d!117183 (= lt!438461 (select (content!418 (toList!6793 lt!438120)) lt!438074))))

(declare-fun e!557327 () Bool)

(assert (=> d!117183 (= lt!438461 e!557327)))

(declare-fun res!661077 () Bool)

(assert (=> d!117183 (=> (not res!661077) (not e!557327))))

(assert (=> d!117183 (= res!661077 ((_ is Cons!20785) (toList!6793 lt!438120)))))

(assert (=> d!117183 (= (contains!5714 (toList!6793 lt!438120) lt!438074) lt!438461)))

(declare-fun b!988373 () Bool)

(declare-fun e!557328 () Bool)

(assert (=> b!988373 (= e!557327 e!557328)))

(declare-fun res!661076 () Bool)

(assert (=> b!988373 (=> res!661076 e!557328)))

(assert (=> b!988373 (= res!661076 (= (h!21947 (toList!6793 lt!438120)) lt!438074))))

(declare-fun b!988374 () Bool)

(assert (=> b!988374 (= e!557328 (contains!5714 (t!29724 (toList!6793 lt!438120)) lt!438074))))

(assert (= (and d!117183 res!661077) b!988373))

(assert (= (and b!988373 (not res!661076)) b!988374))

(declare-fun m!915525 () Bool)

(assert (=> d!117183 m!915525))

(declare-fun m!915527 () Bool)

(assert (=> d!117183 m!915527))

(declare-fun m!915529 () Bool)

(assert (=> b!988374 m!915529))

(assert (=> b!987893 d!117183))

(declare-fun d!117185 () Bool)

(declare-fun e!557329 () Bool)

(assert (=> d!117185 e!557329))

(declare-fun res!661079 () Bool)

(assert (=> d!117185 (=> (not res!661079) (not e!557329))))

(declare-fun lt!438465 () ListLongMap!13555)

(assert (=> d!117185 (= res!661079 (contains!5713 lt!438465 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438462 () List!20789)

(assert (=> d!117185 (= lt!438465 (ListLongMap!13556 lt!438462))))

(declare-fun lt!438463 () Unit!32789)

(declare-fun lt!438464 () Unit!32789)

(assert (=> d!117185 (= lt!438463 lt!438464)))

(assert (=> d!117185 (= (getValueByKey!512 lt!438462 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117185 (= lt!438464 (lemmaContainsTupThenGetReturnValue!271 lt!438462 (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117185 (= lt!438462 (insertStrictlySorted!328 (toList!6793 call!41830) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117185 (= (+!3078 call!41830 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438465)))

(declare-fun b!988375 () Bool)

(declare-fun res!661078 () Bool)

(assert (=> b!988375 (=> (not res!661078) (not e!557329))))

(assert (=> b!988375 (= res!661078 (= (getValueByKey!512 (toList!6793 lt!438465) (_1!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7440 (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!988376 () Bool)

(assert (=> b!988376 (= e!557329 (contains!5714 (toList!6793 lt!438465) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117185 res!661079) b!988375))

(assert (= (and b!988375 res!661078) b!988376))

(declare-fun m!915531 () Bool)

(assert (=> d!117185 m!915531))

(declare-fun m!915533 () Bool)

(assert (=> d!117185 m!915533))

(declare-fun m!915535 () Bool)

(assert (=> d!117185 m!915535))

(declare-fun m!915537 () Bool)

(assert (=> d!117185 m!915537))

(declare-fun m!915539 () Bool)

(assert (=> b!988375 m!915539))

(declare-fun m!915541 () Bool)

(assert (=> b!988376 m!915541))

(assert (=> b!987955 d!117185))

(declare-fun b!988377 () Bool)

(declare-fun e!557330 () Bool)

(declare-fun call!41875 () Bool)

(assert (=> b!988377 (= e!557330 call!41875)))

(declare-fun b!988378 () Bool)

(declare-fun e!557331 () Bool)

(declare-fun e!557332 () Bool)

(assert (=> b!988378 (= e!557331 e!557332)))

(declare-fun res!661081 () Bool)

(assert (=> b!988378 (=> (not res!661081) (not e!557332))))

(declare-fun e!557333 () Bool)

(assert (=> b!988378 (= res!661081 (not e!557333))))

(declare-fun res!661082 () Bool)

(assert (=> b!988378 (=> (not res!661082) (not e!557333))))

(assert (=> b!988378 (= res!661082 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117187 () Bool)

(declare-fun res!661080 () Bool)

(assert (=> d!117187 (=> res!661080 e!557331)))

(assert (=> d!117187 (= res!661080 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(assert (=> d!117187 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100091 (Cons!20786 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) Nil!20787) Nil!20787)) e!557331)))

(declare-fun c!100199 () Bool)

(declare-fun bm!41872 () Bool)

(assert (=> bm!41872 (= call!41875 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100199 (Cons!20786 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100091 (Cons!20786 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) Nil!20787) Nil!20787)) (ite c!100091 (Cons!20786 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) Nil!20787) Nil!20787))))))

(declare-fun b!988379 () Bool)

(assert (=> b!988379 (= e!557332 e!557330)))

(assert (=> b!988379 (= c!100199 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!988380 () Bool)

(assert (=> b!988380 (= e!557333 (contains!5715 (ite c!100091 (Cons!20786 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000) Nil!20787) Nil!20787) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!988381 () Bool)

(assert (=> b!988381 (= e!557330 call!41875)))

(assert (= (and d!117187 (not res!661080)) b!988378))

(assert (= (and b!988378 res!661082) b!988380))

(assert (= (and b!988378 res!661081) b!988379))

(assert (= (and b!988379 c!100199) b!988377))

(assert (= (and b!988379 (not c!100199)) b!988381))

(assert (= (or b!988377 b!988381) bm!41872))

(declare-fun m!915543 () Bool)

(assert (=> b!988378 m!915543))

(assert (=> b!988378 m!915543))

(declare-fun m!915545 () Bool)

(assert (=> b!988378 m!915545))

(assert (=> bm!41872 m!915543))

(declare-fun m!915547 () Bool)

(assert (=> bm!41872 m!915547))

(assert (=> b!988379 m!915543))

(assert (=> b!988379 m!915543))

(assert (=> b!988379 m!915545))

(assert (=> b!988380 m!915543))

(assert (=> b!988380 m!915543))

(declare-fun m!915549 () Bool)

(assert (=> b!988380 m!915549))

(assert (=> bm!41842 d!117187))

(declare-fun d!117189 () Bool)

(assert (=> d!117189 (= (apply!893 lt!438210 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15601 (getValueByKey!512 (toList!6793 lt!438210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28052 () Bool)

(assert (= bs!28052 d!117189))

(assert (=> bs!28052 m!914995))

(assert (=> bs!28052 m!914995))

(declare-fun m!915551 () Bool)

(assert (=> bs!28052 m!915551))

(assert (=> b!987981 d!117189))

(assert (=> b!987967 d!116979))

(declare-fun d!117191 () Bool)

(assert (=> d!117191 (= (get!15599 (select (arr!30059 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14226 (select (arr!30059 _values!1278) from!1932)))))

(assert (=> b!988057 d!117191))

(declare-fun d!117193 () Bool)

(assert (=> d!117193 (= (apply!893 lt!438180 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15601 (getValueByKey!512 (toList!6793 lt!438180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28053 () Bool)

(assert (= bs!28053 d!117193))

(assert (=> bs!28053 m!915003))

(assert (=> bs!28053 m!915003))

(declare-fun m!915553 () Bool)

(assert (=> bs!28053 m!915553))

(assert (=> b!987956 d!117193))

(declare-fun d!117195 () Bool)

(declare-fun lt!438468 () Bool)

(declare-fun content!419 (List!20790) (InoxSet (_ BitVec 64)))

(assert (=> d!117195 (= lt!438468 (select (content!419 Nil!20787) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!557338 () Bool)

(assert (=> d!117195 (= lt!438468 e!557338)))

(declare-fun res!661087 () Bool)

(assert (=> d!117195 (=> (not res!661087) (not e!557338))))

(assert (=> d!117195 (= res!661087 ((_ is Cons!20786) Nil!20787))))

(assert (=> d!117195 (= (contains!5715 Nil!20787 (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)) lt!438468)))

(declare-fun b!988386 () Bool)

(declare-fun e!557339 () Bool)

(assert (=> b!988386 (= e!557338 e!557339)))

(declare-fun res!661088 () Bool)

(assert (=> b!988386 (=> res!661088 e!557339)))

(assert (=> b!988386 (= res!661088 (= (h!21948 Nil!20787) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988387 () Bool)

(assert (=> b!988387 (= e!557339 (contains!5715 (t!29725 Nil!20787) (select (arr!30058 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117195 res!661087) b!988386))

(assert (= (and b!988386 (not res!661088)) b!988387))

(declare-fun m!915555 () Bool)

(assert (=> d!117195 m!915555))

(assert (=> d!117195 m!914783))

(declare-fun m!915557 () Bool)

(assert (=> d!117195 m!915557))

(assert (=> b!988387 m!914783))

(declare-fun m!915559 () Bool)

(assert (=> b!988387 m!915559))

(assert (=> b!988007 d!117195))

(assert (=> b!987942 d!117037))

(declare-fun d!117197 () Bool)

(declare-fun e!557341 () Bool)

(assert (=> d!117197 e!557341))

(declare-fun res!661089 () Bool)

(assert (=> d!117197 (=> res!661089 e!557341)))

(declare-fun lt!438470 () Bool)

(assert (=> d!117197 (= res!661089 (not lt!438470))))

(declare-fun lt!438469 () Bool)

(assert (=> d!117197 (= lt!438470 lt!438469)))

(declare-fun lt!438471 () Unit!32789)

(declare-fun e!557340 () Unit!32789)

(assert (=> d!117197 (= lt!438471 e!557340)))

(declare-fun c!100200 () Bool)

(assert (=> d!117197 (= c!100200 lt!438469)))

(assert (=> d!117197 (= lt!438469 (containsKey!477 (toList!6793 lt!438255) (_1!7440 lt!438067)))))

(assert (=> d!117197 (= (contains!5713 lt!438255 (_1!7440 lt!438067)) lt!438470)))

(declare-fun b!988388 () Bool)

(declare-fun lt!438472 () Unit!32789)

(assert (=> b!988388 (= e!557340 lt!438472)))

(assert (=> b!988388 (= lt!438472 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438255) (_1!7440 lt!438067)))))

(assert (=> b!988388 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438255) (_1!7440 lt!438067)))))

(declare-fun b!988389 () Bool)

(declare-fun Unit!32807 () Unit!32789)

(assert (=> b!988389 (= e!557340 Unit!32807)))

(declare-fun b!988390 () Bool)

(assert (=> b!988390 (= e!557341 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438255) (_1!7440 lt!438067))))))

(assert (= (and d!117197 c!100200) b!988388))

(assert (= (and d!117197 (not c!100200)) b!988389))

(assert (= (and d!117197 (not res!661089)) b!988390))

(declare-fun m!915561 () Bool)

(assert (=> d!117197 m!915561))

(declare-fun m!915563 () Bool)

(assert (=> b!988388 m!915563))

(assert (=> b!988388 m!914849))

(assert (=> b!988388 m!914849))

(declare-fun m!915565 () Bool)

(assert (=> b!988388 m!915565))

(assert (=> b!988390 m!914849))

(assert (=> b!988390 m!914849))

(assert (=> b!988390 m!915565))

(assert (=> d!116989 d!117197))

(declare-fun b!988391 () Bool)

(declare-fun e!557342 () Option!518)

(assert (=> b!988391 (= e!557342 (Some!517 (_2!7440 (h!21947 lt!438252))))))

(declare-fun b!988393 () Bool)

(declare-fun e!557343 () Option!518)

(assert (=> b!988393 (= e!557343 (getValueByKey!512 (t!29724 lt!438252) (_1!7440 lt!438067)))))

(declare-fun b!988394 () Bool)

(assert (=> b!988394 (= e!557343 None!516)))

(declare-fun b!988392 () Bool)

(assert (=> b!988392 (= e!557342 e!557343)))

(declare-fun c!100202 () Bool)

(assert (=> b!988392 (= c!100202 (and ((_ is Cons!20785) lt!438252) (not (= (_1!7440 (h!21947 lt!438252)) (_1!7440 lt!438067)))))))

(declare-fun d!117199 () Bool)

(declare-fun c!100201 () Bool)

(assert (=> d!117199 (= c!100201 (and ((_ is Cons!20785) lt!438252) (= (_1!7440 (h!21947 lt!438252)) (_1!7440 lt!438067))))))

(assert (=> d!117199 (= (getValueByKey!512 lt!438252 (_1!7440 lt!438067)) e!557342)))

(assert (= (and d!117199 c!100201) b!988391))

(assert (= (and d!117199 (not c!100201)) b!988392))

(assert (= (and b!988392 c!100202) b!988393))

(assert (= (and b!988392 (not c!100202)) b!988394))

(declare-fun m!915567 () Bool)

(assert (=> b!988393 m!915567))

(assert (=> d!116989 d!117199))

(declare-fun d!117201 () Bool)

(assert (=> d!117201 (= (getValueByKey!512 lt!438252 (_1!7440 lt!438067)) (Some!517 (_2!7440 lt!438067)))))

(declare-fun lt!438473 () Unit!32789)

(assert (=> d!117201 (= lt!438473 (choose!1606 lt!438252 (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(declare-fun e!557344 () Bool)

(assert (=> d!117201 e!557344))

(declare-fun res!661090 () Bool)

(assert (=> d!117201 (=> (not res!661090) (not e!557344))))

(assert (=> d!117201 (= res!661090 (isStrictlySorted!515 lt!438252))))

(assert (=> d!117201 (= (lemmaContainsTupThenGetReturnValue!271 lt!438252 (_1!7440 lt!438067) (_2!7440 lt!438067)) lt!438473)))

(declare-fun b!988395 () Bool)

(declare-fun res!661091 () Bool)

(assert (=> b!988395 (=> (not res!661091) (not e!557344))))

(assert (=> b!988395 (= res!661091 (containsKey!477 lt!438252 (_1!7440 lt!438067)))))

(declare-fun b!988396 () Bool)

(assert (=> b!988396 (= e!557344 (contains!5714 lt!438252 (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067))))))

(assert (= (and d!117201 res!661090) b!988395))

(assert (= (and b!988395 res!661091) b!988396))

(assert (=> d!117201 m!914843))

(declare-fun m!915569 () Bool)

(assert (=> d!117201 m!915569))

(declare-fun m!915571 () Bool)

(assert (=> d!117201 m!915571))

(declare-fun m!915573 () Bool)

(assert (=> b!988395 m!915573))

(declare-fun m!915575 () Bool)

(assert (=> b!988396 m!915575))

(assert (=> d!116989 d!117201))

(declare-fun bm!41873 () Bool)

(declare-fun call!41877 () List!20789)

(declare-fun call!41878 () List!20789)

(assert (=> bm!41873 (= call!41877 call!41878)))

(declare-fun b!988397 () Bool)

(declare-fun e!557348 () Bool)

(declare-fun lt!438474 () List!20789)

(assert (=> b!988397 (= e!557348 (contains!5714 lt!438474 (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067))))))

(declare-fun b!988398 () Bool)

(declare-fun e!557346 () List!20789)

(declare-fun call!41876 () List!20789)

(assert (=> b!988398 (= e!557346 call!41876)))

(declare-fun b!988400 () Bool)

(declare-fun c!100203 () Bool)

(assert (=> b!988400 (= c!100203 (and ((_ is Cons!20785) (toList!6793 lt!438066)) (bvsgt (_1!7440 (h!21947 (toList!6793 lt!438066))) (_1!7440 lt!438067))))))

(declare-fun e!557347 () List!20789)

(declare-fun e!557349 () List!20789)

(assert (=> b!988400 (= e!557347 e!557349)))

(declare-fun bm!41874 () Bool)

(assert (=> bm!41874 (= call!41878 call!41876)))

(declare-fun b!988401 () Bool)

(assert (=> b!988401 (= e!557346 e!557347)))

(declare-fun c!100206 () Bool)

(assert (=> b!988401 (= c!100206 (and ((_ is Cons!20785) (toList!6793 lt!438066)) (= (_1!7440 (h!21947 (toList!6793 lt!438066))) (_1!7440 lt!438067))))))

(declare-fun e!557345 () List!20789)

(declare-fun b!988402 () Bool)

(assert (=> b!988402 (= e!557345 (ite c!100206 (t!29724 (toList!6793 lt!438066)) (ite c!100203 (Cons!20785 (h!21947 (toList!6793 lt!438066)) (t!29724 (toList!6793 lt!438066))) Nil!20786)))))

(declare-fun b!988403 () Bool)

(assert (=> b!988403 (= e!557349 call!41877)))

(declare-fun b!988404 () Bool)

(assert (=> b!988404 (= e!557347 call!41878)))

(declare-fun c!100204 () Bool)

(declare-fun bm!41875 () Bool)

(assert (=> bm!41875 (= call!41876 ($colon$colon!554 e!557345 (ite c!100204 (h!21947 (toList!6793 lt!438066)) (tuple2!14859 (_1!7440 lt!438067) (_2!7440 lt!438067)))))))

(declare-fun c!100205 () Bool)

(assert (=> bm!41875 (= c!100205 c!100204)))

(declare-fun b!988399 () Bool)

(assert (=> b!988399 (= e!557345 (insertStrictlySorted!328 (t!29724 (toList!6793 lt!438066)) (_1!7440 lt!438067) (_2!7440 lt!438067)))))

(declare-fun d!117203 () Bool)

(assert (=> d!117203 e!557348))

(declare-fun res!661092 () Bool)

(assert (=> d!117203 (=> (not res!661092) (not e!557348))))

(assert (=> d!117203 (= res!661092 (isStrictlySorted!515 lt!438474))))

(assert (=> d!117203 (= lt!438474 e!557346)))

(assert (=> d!117203 (= c!100204 (and ((_ is Cons!20785) (toList!6793 lt!438066)) (bvslt (_1!7440 (h!21947 (toList!6793 lt!438066))) (_1!7440 lt!438067))))))

(assert (=> d!117203 (isStrictlySorted!515 (toList!6793 lt!438066))))

(assert (=> d!117203 (= (insertStrictlySorted!328 (toList!6793 lt!438066) (_1!7440 lt!438067) (_2!7440 lt!438067)) lt!438474)))

(declare-fun b!988405 () Bool)

(declare-fun res!661093 () Bool)

(assert (=> b!988405 (=> (not res!661093) (not e!557348))))

(assert (=> b!988405 (= res!661093 (containsKey!477 lt!438474 (_1!7440 lt!438067)))))

(declare-fun b!988406 () Bool)

(assert (=> b!988406 (= e!557349 call!41877)))

(assert (= (and d!117203 c!100204) b!988398))

(assert (= (and d!117203 (not c!100204)) b!988401))

(assert (= (and b!988401 c!100206) b!988404))

(assert (= (and b!988401 (not c!100206)) b!988400))

(assert (= (and b!988400 c!100203) b!988406))

(assert (= (and b!988400 (not c!100203)) b!988403))

(assert (= (or b!988406 b!988403) bm!41873))

(assert (= (or b!988404 bm!41873) bm!41874))

(assert (= (or b!988398 bm!41874) bm!41875))

(assert (= (and bm!41875 c!100205) b!988399))

(assert (= (and bm!41875 (not c!100205)) b!988402))

(assert (= (and d!117203 res!661092) b!988405))

(assert (= (and b!988405 res!661093) b!988397))

(declare-fun m!915577 () Bool)

(assert (=> d!117203 m!915577))

(declare-fun m!915579 () Bool)

(assert (=> d!117203 m!915579))

(declare-fun m!915581 () Bool)

(assert (=> b!988397 m!915581))

(declare-fun m!915583 () Bool)

(assert (=> b!988405 m!915583))

(declare-fun m!915585 () Bool)

(assert (=> bm!41875 m!915585))

(declare-fun m!915587 () Bool)

(assert (=> b!988399 m!915587))

(assert (=> d!116989 d!117203))

(declare-fun d!117205 () Bool)

(declare-fun e!557351 () Bool)

(assert (=> d!117205 e!557351))

(declare-fun res!661094 () Bool)

(assert (=> d!117205 (=> res!661094 e!557351)))

(declare-fun lt!438476 () Bool)

(assert (=> d!117205 (= res!661094 (not lt!438476))))

(declare-fun lt!438475 () Bool)

(assert (=> d!117205 (= lt!438476 lt!438475)))

(declare-fun lt!438477 () Unit!32789)

(declare-fun e!557350 () Unit!32789)

(assert (=> d!117205 (= lt!438477 e!557350)))

(declare-fun c!100207 () Bool)

(assert (=> d!117205 (= c!100207 lt!438475)))

(assert (=> d!117205 (= lt!438475 (containsKey!477 (toList!6793 lt!438250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117205 (= (contains!5713 lt!438250 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438476)))

(declare-fun b!988407 () Bool)

(declare-fun lt!438478 () Unit!32789)

(assert (=> b!988407 (= e!557350 lt!438478)))

(assert (=> b!988407 (= lt!438478 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988407 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988408 () Bool)

(declare-fun Unit!32808 () Unit!32789)

(assert (=> b!988408 (= e!557350 Unit!32808)))

(declare-fun b!988409 () Bool)

(assert (=> b!988409 (= e!557351 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117205 c!100207) b!988407))

(assert (= (and d!117205 (not c!100207)) b!988408))

(assert (= (and d!117205 (not res!661094)) b!988409))

(declare-fun m!915589 () Bool)

(assert (=> d!117205 m!915589))

(declare-fun m!915591 () Bool)

(assert (=> b!988407 m!915591))

(declare-fun m!915593 () Bool)

(assert (=> b!988407 m!915593))

(assert (=> b!988407 m!915593))

(declare-fun m!915595 () Bool)

(assert (=> b!988407 m!915595))

(assert (=> b!988409 m!915593))

(assert (=> b!988409 m!915593))

(assert (=> b!988409 m!915595))

(assert (=> d!116987 d!117205))

(assert (=> d!116987 d!116959))

(declare-fun d!117207 () Bool)

(declare-fun isEmpty!721 (List!20789) Bool)

(assert (=> d!117207 (= (isEmpty!720 lt!438250) (isEmpty!721 (toList!6793 lt!438250)))))

(declare-fun bs!28054 () Bool)

(assert (= bs!28054 d!117207))

(declare-fun m!915597 () Bool)

(assert (=> bs!28054 m!915597))

(assert (=> b!988035 d!117207))

(declare-fun d!117209 () Bool)

(declare-fun e!557353 () Bool)

(assert (=> d!117209 e!557353))

(declare-fun res!661095 () Bool)

(assert (=> d!117209 (=> res!661095 e!557353)))

(declare-fun lt!438480 () Bool)

(assert (=> d!117209 (= res!661095 (not lt!438480))))

(declare-fun lt!438479 () Bool)

(assert (=> d!117209 (= lt!438480 lt!438479)))

(declare-fun lt!438481 () Unit!32789)

(declare-fun e!557352 () Unit!32789)

(assert (=> d!117209 (= lt!438481 e!557352)))

(declare-fun c!100208 () Bool)

(assert (=> d!117209 (= c!100208 lt!438479)))

(assert (=> d!117209 (= lt!438479 (containsKey!477 (toList!6793 lt!438210) (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> d!117209 (= (contains!5713 lt!438210 (select (arr!30058 _keys!1544) from!1932)) lt!438480)))

(declare-fun b!988410 () Bool)

(declare-fun lt!438482 () Unit!32789)

(assert (=> b!988410 (= e!557352 lt!438482)))

(assert (=> b!988410 (= lt!438482 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438210) (select (arr!30058 _keys!1544) from!1932)))))

(assert (=> b!988410 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) (select (arr!30058 _keys!1544) from!1932)))))

(declare-fun b!988411 () Bool)

(declare-fun Unit!32809 () Unit!32789)

(assert (=> b!988411 (= e!557352 Unit!32809)))

(declare-fun b!988412 () Bool)

(assert (=> b!988412 (= e!557353 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438210) (select (arr!30058 _keys!1544) from!1932))))))

(assert (= (and d!117209 c!100208) b!988410))

(assert (= (and d!117209 (not c!100208)) b!988411))

(assert (= (and d!117209 (not res!661095)) b!988412))

(assert (=> d!117209 m!914545))

(declare-fun m!915599 () Bool)

(assert (=> d!117209 m!915599))

(assert (=> b!988410 m!914545))

(declare-fun m!915601 () Bool)

(assert (=> b!988410 m!915601))

(assert (=> b!988410 m!914545))

(assert (=> b!988410 m!915475))

(assert (=> b!988410 m!915475))

(declare-fun m!915603 () Bool)

(assert (=> b!988410 m!915603))

(assert (=> b!988412 m!914545))

(assert (=> b!988412 m!915475))

(assert (=> b!988412 m!915475))

(assert (=> b!988412 m!915603))

(assert (=> b!987977 d!117209))

(assert (=> b!987990 d!117021))

(declare-fun d!117211 () Bool)

(assert (=> d!117211 (= (apply!893 lt!438250 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15601 (getValueByKey!512 (toList!6793 lt!438250) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28055 () Bool)

(assert (= bs!28055 d!117211))

(assert (=> bs!28055 m!914659))

(assert (=> bs!28055 m!915401))

(assert (=> bs!28055 m!915401))

(declare-fun m!915605 () Bool)

(assert (=> bs!28055 m!915605))

(assert (=> b!988046 d!117211))

(assert (=> b!988046 d!117169))

(declare-fun d!117213 () Bool)

(declare-fun e!557355 () Bool)

(assert (=> d!117213 e!557355))

(declare-fun res!661096 () Bool)

(assert (=> d!117213 (=> res!661096 e!557355)))

(declare-fun lt!438484 () Bool)

(assert (=> d!117213 (= res!661096 (not lt!438484))))

(declare-fun lt!438483 () Bool)

(assert (=> d!117213 (= lt!438484 lt!438483)))

(declare-fun lt!438485 () Unit!32789)

(declare-fun e!557354 () Unit!32789)

(assert (=> d!117213 (= lt!438485 e!557354)))

(declare-fun c!100209 () Bool)

(assert (=> d!117213 (= c!100209 lt!438483)))

(assert (=> d!117213 (= lt!438483 (containsKey!477 (toList!6793 lt!438180) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117213 (= (contains!5713 lt!438180 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438484)))

(declare-fun b!988413 () Bool)

(declare-fun lt!438486 () Unit!32789)

(assert (=> b!988413 (= e!557354 lt!438486)))

(assert (=> b!988413 (= lt!438486 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438180) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988413 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988414 () Bool)

(declare-fun Unit!32810 () Unit!32789)

(assert (=> b!988414 (= e!557354 Unit!32810)))

(declare-fun b!988415 () Bool)

(assert (=> b!988415 (= e!557355 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438180) (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117213 c!100209) b!988413))

(assert (= (and d!117213 (not c!100209)) b!988414))

(assert (= (and d!117213 (not res!661096)) b!988415))

(assert (=> d!117213 m!914659))

(declare-fun m!915607 () Bool)

(assert (=> d!117213 m!915607))

(assert (=> b!988413 m!914659))

(declare-fun m!915609 () Bool)

(assert (=> b!988413 m!915609))

(assert (=> b!988413 m!914659))

(assert (=> b!988413 m!915479))

(assert (=> b!988413 m!915479))

(declare-fun m!915611 () Bool)

(assert (=> b!988413 m!915611))

(assert (=> b!988415 m!914659))

(assert (=> b!988415 m!915479))

(assert (=> b!988415 m!915479))

(assert (=> b!988415 m!915611))

(assert (=> b!987952 d!117213))

(declare-fun d!117215 () Bool)

(assert (=> d!117215 (= (apply!893 lt!438210 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15601 (getValueByKey!512 (toList!6793 lt!438210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28056 () Bool)

(assert (= bs!28056 d!117215))

(assert (=> bs!28056 m!915415))

(assert (=> bs!28056 m!915415))

(declare-fun m!915613 () Bool)

(assert (=> bs!28056 m!915613))

(assert (=> b!987962 d!117215))

(declare-fun d!117217 () Bool)

(declare-fun lt!438487 () Bool)

(assert (=> d!117217 (= lt!438487 (select (content!418 (toList!6793 lt!438267)) lt!438074))))

(declare-fun e!557356 () Bool)

(assert (=> d!117217 (= lt!438487 e!557356)))

(declare-fun res!661098 () Bool)

(assert (=> d!117217 (=> (not res!661098) (not e!557356))))

(assert (=> d!117217 (= res!661098 ((_ is Cons!20785) (toList!6793 lt!438267)))))

(assert (=> d!117217 (= (contains!5714 (toList!6793 lt!438267) lt!438074) lt!438487)))

(declare-fun b!988416 () Bool)

(declare-fun e!557357 () Bool)

(assert (=> b!988416 (= e!557356 e!557357)))

(declare-fun res!661097 () Bool)

(assert (=> b!988416 (=> res!661097 e!557357)))

(assert (=> b!988416 (= res!661097 (= (h!21947 (toList!6793 lt!438267)) lt!438074))))

(declare-fun b!988417 () Bool)

(assert (=> b!988417 (= e!557357 (contains!5714 (t!29724 (toList!6793 lt!438267)) lt!438074))))

(assert (= (and d!117217 res!661098) b!988416))

(assert (= (and b!988416 (not res!661097)) b!988417))

(declare-fun m!915615 () Bool)

(assert (=> d!117217 m!915615))

(declare-fun m!915617 () Bool)

(assert (=> d!117217 m!915617))

(declare-fun m!915619 () Bool)

(assert (=> b!988417 m!915619))

(assert (=> b!988060 d!117217))

(declare-fun d!117219 () Bool)

(declare-fun lt!438488 () Bool)

(assert (=> d!117219 (= lt!438488 (select (content!418 (toList!6793 lt!438229)) lt!438067))))

(declare-fun e!557358 () Bool)

(assert (=> d!117219 (= lt!438488 e!557358)))

(declare-fun res!661100 () Bool)

(assert (=> d!117219 (=> (not res!661100) (not e!557358))))

(assert (=> d!117219 (= res!661100 ((_ is Cons!20785) (toList!6793 lt!438229)))))

(assert (=> d!117219 (= (contains!5714 (toList!6793 lt!438229) lt!438067) lt!438488)))

(declare-fun b!988418 () Bool)

(declare-fun e!557359 () Bool)

(assert (=> b!988418 (= e!557358 e!557359)))

(declare-fun res!661099 () Bool)

(assert (=> b!988418 (=> res!661099 e!557359)))

(assert (=> b!988418 (= res!661099 (= (h!21947 (toList!6793 lt!438229)) lt!438067))))

(declare-fun b!988419 () Bool)

(assert (=> b!988419 (= e!557359 (contains!5714 (t!29724 (toList!6793 lt!438229)) lt!438067))))

(assert (= (and d!117219 res!661100) b!988418))

(assert (= (and b!988418 (not res!661099)) b!988419))

(declare-fun m!915621 () Bool)

(assert (=> d!117219 m!915621))

(declare-fun m!915623 () Bool)

(assert (=> d!117219 m!915623))

(declare-fun m!915625 () Bool)

(assert (=> b!988419 m!915625))

(assert (=> b!988010 d!117219))

(declare-fun d!117221 () Bool)

(assert (=> d!117221 (= (apply!893 lt!438180 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15601 (getValueByKey!512 (toList!6793 lt!438180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28057 () Bool)

(assert (= bs!28057 d!117221))

(assert (=> bs!28057 m!915223))

(assert (=> bs!28057 m!915223))

(declare-fun m!915627 () Bool)

(assert (=> bs!28057 m!915627))

(assert (=> b!987937 d!117221))

(declare-fun d!117223 () Bool)

(declare-fun e!557360 () Bool)

(assert (=> d!117223 e!557360))

(declare-fun res!661102 () Bool)

(assert (=> d!117223 (=> (not res!661102) (not e!557360))))

(declare-fun lt!438492 () ListLongMap!13555)

(assert (=> d!117223 (= res!661102 (contains!5713 lt!438492 (_1!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438489 () List!20789)

(assert (=> d!117223 (= lt!438492 (ListLongMap!13556 lt!438489))))

(declare-fun lt!438490 () Unit!32789)

(declare-fun lt!438491 () Unit!32789)

(assert (=> d!117223 (= lt!438490 lt!438491)))

(assert (=> d!117223 (= (getValueByKey!512 lt!438489 (_1!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117223 (= lt!438491 (lemmaContainsTupThenGetReturnValue!271 lt!438489 (_1!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117223 (= lt!438489 (insertStrictlySorted!328 (toList!6793 (ite c!100081 call!41835 (ite c!100080 call!41839 call!41838))) (_1!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117223 (= (+!3078 (ite c!100081 call!41835 (ite c!100080 call!41839 call!41838)) (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438492)))

(declare-fun b!988420 () Bool)

(declare-fun res!661101 () Bool)

(assert (=> b!988420 (=> (not res!661101) (not e!557360))))

(assert (=> b!988420 (= res!661101 (= (getValueByKey!512 (toList!6793 lt!438492) (_1!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7440 (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!988421 () Bool)

(assert (=> b!988421 (= e!557360 (contains!5714 (toList!6793 lt!438492) (ite (or c!100081 c!100080) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117223 res!661102) b!988420))

(assert (= (and b!988420 res!661101) b!988421))

(declare-fun m!915629 () Bool)

(assert (=> d!117223 m!915629))

(declare-fun m!915631 () Bool)

(assert (=> d!117223 m!915631))

(declare-fun m!915633 () Bool)

(assert (=> d!117223 m!915633))

(declare-fun m!915635 () Bool)

(assert (=> d!117223 m!915635))

(declare-fun m!915637 () Bool)

(assert (=> b!988420 m!915637))

(declare-fun m!915639 () Bool)

(assert (=> b!988421 m!915639))

(assert (=> bm!41835 d!117223))

(declare-fun d!117225 () Bool)

(declare-fun e!557362 () Bool)

(assert (=> d!117225 e!557362))

(declare-fun res!661103 () Bool)

(assert (=> d!117225 (=> res!661103 e!557362)))

(declare-fun lt!438494 () Bool)

(assert (=> d!117225 (= res!661103 (not lt!438494))))

(declare-fun lt!438493 () Bool)

(assert (=> d!117225 (= lt!438494 lt!438493)))

(declare-fun lt!438495 () Unit!32789)

(declare-fun e!557361 () Unit!32789)

(assert (=> d!117225 (= lt!438495 e!557361)))

(declare-fun c!100210 () Bool)

(assert (=> d!117225 (= c!100210 lt!438493)))

(assert (=> d!117225 (= lt!438493 (containsKey!477 (toList!6793 lt!438190) (_1!7440 lt!438068)))))

(assert (=> d!117225 (= (contains!5713 lt!438190 (_1!7440 lt!438068)) lt!438494)))

(declare-fun b!988422 () Bool)

(declare-fun lt!438496 () Unit!32789)

(assert (=> b!988422 (= e!557361 lt!438496)))

(assert (=> b!988422 (= lt!438496 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 lt!438190) (_1!7440 lt!438068)))))

(assert (=> b!988422 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438190) (_1!7440 lt!438068)))))

(declare-fun b!988423 () Bool)

(declare-fun Unit!32811 () Unit!32789)

(assert (=> b!988423 (= e!557361 Unit!32811)))

(declare-fun b!988424 () Bool)

(assert (=> b!988424 (= e!557362 (isDefined!382 (getValueByKey!512 (toList!6793 lt!438190) (_1!7440 lt!438068))))))

(assert (= (and d!117225 c!100210) b!988422))

(assert (= (and d!117225 (not c!100210)) b!988423))

(assert (= (and d!117225 (not res!661103)) b!988424))

(declare-fun m!915641 () Bool)

(assert (=> d!117225 m!915641))

(declare-fun m!915643 () Bool)

(assert (=> b!988422 m!915643))

(assert (=> b!988422 m!914719))

(assert (=> b!988422 m!914719))

(declare-fun m!915645 () Bool)

(assert (=> b!988422 m!915645))

(assert (=> b!988424 m!914719))

(assert (=> b!988424 m!914719))

(assert (=> b!988424 m!915645))

(assert (=> d!116971 d!117225))

(declare-fun b!988425 () Bool)

(declare-fun e!557363 () Option!518)

(assert (=> b!988425 (= e!557363 (Some!517 (_2!7440 (h!21947 lt!438187))))))

(declare-fun b!988427 () Bool)

(declare-fun e!557364 () Option!518)

(assert (=> b!988427 (= e!557364 (getValueByKey!512 (t!29724 lt!438187) (_1!7440 lt!438068)))))

(declare-fun b!988428 () Bool)

(assert (=> b!988428 (= e!557364 None!516)))

(declare-fun b!988426 () Bool)

(assert (=> b!988426 (= e!557363 e!557364)))

(declare-fun c!100212 () Bool)

(assert (=> b!988426 (= c!100212 (and ((_ is Cons!20785) lt!438187) (not (= (_1!7440 (h!21947 lt!438187)) (_1!7440 lt!438068)))))))

(declare-fun d!117227 () Bool)

(declare-fun c!100211 () Bool)

(assert (=> d!117227 (= c!100211 (and ((_ is Cons!20785) lt!438187) (= (_1!7440 (h!21947 lt!438187)) (_1!7440 lt!438068))))))

(assert (=> d!117227 (= (getValueByKey!512 lt!438187 (_1!7440 lt!438068)) e!557363)))

(assert (= (and d!117227 c!100211) b!988425))

(assert (= (and d!117227 (not c!100211)) b!988426))

(assert (= (and b!988426 c!100212) b!988427))

(assert (= (and b!988426 (not c!100212)) b!988428))

(declare-fun m!915647 () Bool)

(assert (=> b!988427 m!915647))

(assert (=> d!116971 d!117227))

(declare-fun d!117229 () Bool)

(assert (=> d!117229 (= (getValueByKey!512 lt!438187 (_1!7440 lt!438068)) (Some!517 (_2!7440 lt!438068)))))

(declare-fun lt!438497 () Unit!32789)

(assert (=> d!117229 (= lt!438497 (choose!1606 lt!438187 (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(declare-fun e!557365 () Bool)

(assert (=> d!117229 e!557365))

(declare-fun res!661104 () Bool)

(assert (=> d!117229 (=> (not res!661104) (not e!557365))))

(assert (=> d!117229 (= res!661104 (isStrictlySorted!515 lt!438187))))

(assert (=> d!117229 (= (lemmaContainsTupThenGetReturnValue!271 lt!438187 (_1!7440 lt!438068) (_2!7440 lt!438068)) lt!438497)))

(declare-fun b!988429 () Bool)

(declare-fun res!661105 () Bool)

(assert (=> b!988429 (=> (not res!661105) (not e!557365))))

(assert (=> b!988429 (= res!661105 (containsKey!477 lt!438187 (_1!7440 lt!438068)))))

(declare-fun b!988430 () Bool)

(assert (=> b!988430 (= e!557365 (contains!5714 lt!438187 (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068))))))

(assert (= (and d!117229 res!661104) b!988429))

(assert (= (and b!988429 res!661105) b!988430))

(assert (=> d!117229 m!914713))

(declare-fun m!915649 () Bool)

(assert (=> d!117229 m!915649))

(declare-fun m!915651 () Bool)

(assert (=> d!117229 m!915651))

(declare-fun m!915653 () Bool)

(assert (=> b!988429 m!915653))

(declare-fun m!915655 () Bool)

(assert (=> b!988430 m!915655))

(assert (=> d!116971 d!117229))

(declare-fun bm!41876 () Bool)

(declare-fun call!41880 () List!20789)

(declare-fun call!41881 () List!20789)

(assert (=> bm!41876 (= call!41880 call!41881)))

(declare-fun b!988431 () Bool)

(declare-fun e!557369 () Bool)

(declare-fun lt!438498 () List!20789)

(assert (=> b!988431 (= e!557369 (contains!5714 lt!438498 (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068))))))

(declare-fun b!988432 () Bool)

(declare-fun e!557367 () List!20789)

(declare-fun call!41879 () List!20789)

(assert (=> b!988432 (= e!557367 call!41879)))

(declare-fun b!988434 () Bool)

(declare-fun c!100213 () Bool)

(assert (=> b!988434 (= c!100213 (and ((_ is Cons!20785) (toList!6793 (+!3078 lt!438069 lt!438074))) (bvsgt (_1!7440 (h!21947 (toList!6793 (+!3078 lt!438069 lt!438074)))) (_1!7440 lt!438068))))))

(declare-fun e!557368 () List!20789)

(declare-fun e!557370 () List!20789)

(assert (=> b!988434 (= e!557368 e!557370)))

(declare-fun bm!41877 () Bool)

(assert (=> bm!41877 (= call!41881 call!41879)))

(declare-fun b!988435 () Bool)

(assert (=> b!988435 (= e!557367 e!557368)))

(declare-fun c!100216 () Bool)

(assert (=> b!988435 (= c!100216 (and ((_ is Cons!20785) (toList!6793 (+!3078 lt!438069 lt!438074))) (= (_1!7440 (h!21947 (toList!6793 (+!3078 lt!438069 lt!438074)))) (_1!7440 lt!438068))))))

(declare-fun e!557366 () List!20789)

(declare-fun b!988436 () Bool)

(assert (=> b!988436 (= e!557366 (ite c!100216 (t!29724 (toList!6793 (+!3078 lt!438069 lt!438074))) (ite c!100213 (Cons!20785 (h!21947 (toList!6793 (+!3078 lt!438069 lt!438074))) (t!29724 (toList!6793 (+!3078 lt!438069 lt!438074)))) Nil!20786)))))

(declare-fun b!988437 () Bool)

(assert (=> b!988437 (= e!557370 call!41880)))

(declare-fun b!988438 () Bool)

(assert (=> b!988438 (= e!557368 call!41881)))

(declare-fun c!100214 () Bool)

(declare-fun bm!41878 () Bool)

(assert (=> bm!41878 (= call!41879 ($colon$colon!554 e!557366 (ite c!100214 (h!21947 (toList!6793 (+!3078 lt!438069 lt!438074))) (tuple2!14859 (_1!7440 lt!438068) (_2!7440 lt!438068)))))))

(declare-fun c!100215 () Bool)

(assert (=> bm!41878 (= c!100215 c!100214)))

(declare-fun b!988433 () Bool)

(assert (=> b!988433 (= e!557366 (insertStrictlySorted!328 (t!29724 (toList!6793 (+!3078 lt!438069 lt!438074))) (_1!7440 lt!438068) (_2!7440 lt!438068)))))

(declare-fun d!117231 () Bool)

(assert (=> d!117231 e!557369))

(declare-fun res!661106 () Bool)

(assert (=> d!117231 (=> (not res!661106) (not e!557369))))

(assert (=> d!117231 (= res!661106 (isStrictlySorted!515 lt!438498))))

(assert (=> d!117231 (= lt!438498 e!557367)))

(assert (=> d!117231 (= c!100214 (and ((_ is Cons!20785) (toList!6793 (+!3078 lt!438069 lt!438074))) (bvslt (_1!7440 (h!21947 (toList!6793 (+!3078 lt!438069 lt!438074)))) (_1!7440 lt!438068))))))

(assert (=> d!117231 (isStrictlySorted!515 (toList!6793 (+!3078 lt!438069 lt!438074)))))

(assert (=> d!117231 (= (insertStrictlySorted!328 (toList!6793 (+!3078 lt!438069 lt!438074)) (_1!7440 lt!438068) (_2!7440 lt!438068)) lt!438498)))

(declare-fun b!988439 () Bool)

(declare-fun res!661107 () Bool)

(assert (=> b!988439 (=> (not res!661107) (not e!557369))))

(assert (=> b!988439 (= res!661107 (containsKey!477 lt!438498 (_1!7440 lt!438068)))))

(declare-fun b!988440 () Bool)

(assert (=> b!988440 (= e!557370 call!41880)))

(assert (= (and d!117231 c!100214) b!988432))

(assert (= (and d!117231 (not c!100214)) b!988435))

(assert (= (and b!988435 c!100216) b!988438))

(assert (= (and b!988435 (not c!100216)) b!988434))

(assert (= (and b!988434 c!100213) b!988440))

(assert (= (and b!988434 (not c!100213)) b!988437))

(assert (= (or b!988440 b!988437) bm!41876))

(assert (= (or b!988438 bm!41876) bm!41877))

(assert (= (or b!988432 bm!41877) bm!41878))

(assert (= (and bm!41878 c!100215) b!988433))

(assert (= (and bm!41878 (not c!100215)) b!988436))

(assert (= (and d!117231 res!661106) b!988439))

(assert (= (and b!988439 res!661107) b!988431))

(declare-fun m!915657 () Bool)

(assert (=> d!117231 m!915657))

(declare-fun m!915659 () Bool)

(assert (=> d!117231 m!915659))

(declare-fun m!915661 () Bool)

(assert (=> b!988431 m!915661))

(declare-fun m!915663 () Bool)

(assert (=> b!988439 m!915663))

(declare-fun m!915665 () Bool)

(assert (=> bm!41878 m!915665))

(declare-fun m!915667 () Bool)

(assert (=> b!988433 m!915667))

(assert (=> d!116971 d!117231))

(declare-fun b!988441 () Bool)

(declare-fun e!557372 () Bool)

(declare-fun e!557371 () Bool)

(assert (=> b!988441 (= e!557372 e!557371)))

(declare-fun c!100217 () Bool)

(assert (=> b!988441 (= c!100217 (validKeyInArray!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!988442 () Bool)

(declare-fun e!557373 () Bool)

(assert (=> b!988442 (= e!557371 e!557373)))

(declare-fun lt!438500 () (_ BitVec 64))

(assert (=> b!988442 (= lt!438500 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!438499 () Unit!32789)

(assert (=> b!988442 (= lt!438499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!988442 (arrayContainsKey!0 _keys!1544 lt!438500 #b00000000000000000000000000000000)))

(declare-fun lt!438501 () Unit!32789)

(assert (=> b!988442 (= lt!438501 lt!438499)))

(declare-fun res!661109 () Bool)

(assert (=> b!988442 (= res!661109 (= (seekEntryOrOpen!0 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!988442 (=> (not res!661109) (not e!557373))))

(declare-fun b!988443 () Bool)

(declare-fun call!41882 () Bool)

(assert (=> b!988443 (= e!557371 call!41882)))

(declare-fun d!117233 () Bool)

(declare-fun res!661108 () Bool)

(assert (=> d!117233 (=> res!661108 e!557372)))

(assert (=> d!117233 (= res!661108 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30537 _keys!1544)))))

(assert (=> d!117233 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!557372)))

(declare-fun b!988444 () Bool)

(assert (=> b!988444 (= e!557373 call!41882)))

(declare-fun bm!41879 () Bool)

(assert (=> bm!41879 (= call!41882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!117233 (not res!661108)) b!988441))

(assert (= (and b!988441 c!100217) b!988442))

(assert (= (and b!988441 (not c!100217)) b!988443))

(assert (= (and b!988442 res!661109) b!988444))

(assert (= (or b!988444 b!988443) bm!41879))

(assert (=> b!988441 m!915543))

(assert (=> b!988441 m!915543))

(assert (=> b!988441 m!915545))

(assert (=> b!988442 m!915543))

(declare-fun m!915669 () Bool)

(assert (=> b!988442 m!915669))

(declare-fun m!915671 () Bool)

(assert (=> b!988442 m!915671))

(assert (=> b!988442 m!915543))

(declare-fun m!915673 () Bool)

(assert (=> b!988442 m!915673))

(declare-fun m!915675 () Bool)

(assert (=> bm!41879 m!915675))

(assert (=> bm!41839 d!117233))

(declare-fun d!117235 () Bool)

(declare-fun e!557374 () Bool)

(assert (=> d!117235 e!557374))

(declare-fun res!661111 () Bool)

(assert (=> d!117235 (=> (not res!661111) (not e!557374))))

(declare-fun lt!438505 () ListLongMap!13555)

(assert (=> d!117235 (= res!661111 (contains!5713 lt!438505 (_1!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438502 () List!20789)

(assert (=> d!117235 (= lt!438505 (ListLongMap!13556 lt!438502))))

(declare-fun lt!438503 () Unit!32789)

(declare-fun lt!438504 () Unit!32789)

(assert (=> d!117235 (= lt!438503 lt!438504)))

(assert (=> d!117235 (= (getValueByKey!512 lt!438502 (_1!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117235 (= lt!438504 (lemmaContainsTupThenGetReturnValue!271 lt!438502 (_1!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117235 (= lt!438502 (insertStrictlySorted!328 (toList!6793 (ite c!100075 call!41828 (ite c!100074 call!41832 call!41831))) (_1!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117235 (= (+!3078 (ite c!100075 call!41828 (ite c!100074 call!41832 call!41831)) (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438505)))

(declare-fun b!988445 () Bool)

(declare-fun res!661110 () Bool)

(assert (=> b!988445 (=> (not res!661110) (not e!557374))))

(assert (=> b!988445 (= res!661110 (= (getValueByKey!512 (toList!6793 lt!438505) (_1!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7440 (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!988446 () Bool)

(assert (=> b!988446 (= e!557374 (contains!5714 (toList!6793 lt!438505) (ite (or c!100075 c!100074) (tuple2!14859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117235 res!661111) b!988445))

(assert (= (and b!988445 res!661110) b!988446))

(declare-fun m!915677 () Bool)

(assert (=> d!117235 m!915677))

(declare-fun m!915679 () Bool)

(assert (=> d!117235 m!915679))

(declare-fun m!915681 () Bool)

(assert (=> d!117235 m!915681))

(declare-fun m!915683 () Bool)

(assert (=> d!117235 m!915683))

(declare-fun m!915685 () Bool)

(assert (=> b!988445 m!915685))

(declare-fun m!915687 () Bool)

(assert (=> b!988446 m!915687))

(assert (=> bm!41828 d!117235))

(assert (=> b!988041 d!117037))

(declare-fun b!988447 () Bool)

(declare-fun e!557375 () Option!518)

(assert (=> b!988447 (= e!557375 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438255)))))))

(declare-fun b!988449 () Bool)

(declare-fun e!557376 () Option!518)

(assert (=> b!988449 (= e!557376 (getValueByKey!512 (t!29724 (toList!6793 lt!438255)) (_1!7440 lt!438067)))))

(declare-fun b!988450 () Bool)

(assert (=> b!988450 (= e!557376 None!516)))

(declare-fun b!988448 () Bool)

(assert (=> b!988448 (= e!557375 e!557376)))

(declare-fun c!100219 () Bool)

(assert (=> b!988448 (= c!100219 (and ((_ is Cons!20785) (toList!6793 lt!438255)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438255))) (_1!7440 lt!438067)))))))

(declare-fun d!117237 () Bool)

(declare-fun c!100218 () Bool)

(assert (=> d!117237 (= c!100218 (and ((_ is Cons!20785) (toList!6793 lt!438255)) (= (_1!7440 (h!21947 (toList!6793 lt!438255))) (_1!7440 lt!438067))))))

(assert (=> d!117237 (= (getValueByKey!512 (toList!6793 lt!438255) (_1!7440 lt!438067)) e!557375)))

(assert (= (and d!117237 c!100218) b!988447))

(assert (= (and d!117237 (not c!100218)) b!988448))

(assert (= (and b!988448 c!100219) b!988449))

(assert (= (and b!988448 (not c!100219)) b!988450))

(declare-fun m!915689 () Bool)

(assert (=> b!988449 m!915689))

(assert (=> b!988047 d!117237))

(declare-fun d!117239 () Bool)

(assert (=> d!117239 (not (contains!5713 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248)) lt!438245))))

(declare-fun lt!438508 () Unit!32789)

(declare-fun choose!1609 (ListLongMap!13555 (_ BitVec 64) V!35947 (_ BitVec 64)) Unit!32789)

(assert (=> d!117239 (= lt!438508 (choose!1609 lt!438251 lt!438249 lt!438248 lt!438245))))

(declare-fun e!557379 () Bool)

(assert (=> d!117239 e!557379))

(declare-fun res!661114 () Bool)

(assert (=> d!117239 (=> (not res!661114) (not e!557379))))

(assert (=> d!117239 (= res!661114 (not (contains!5713 lt!438251 lt!438245)))))

(assert (=> d!117239 (= (addStillNotContains!232 lt!438251 lt!438249 lt!438248 lt!438245) lt!438508)))

(declare-fun b!988454 () Bool)

(assert (=> b!988454 (= e!557379 (not (= lt!438249 lt!438245)))))

(assert (= (and d!117239 res!661114) b!988454))

(assert (=> d!117239 m!914831))

(assert (=> d!117239 m!914831))

(assert (=> d!117239 m!914833))

(declare-fun m!915691 () Bool)

(assert (=> d!117239 m!915691))

(declare-fun m!915693 () Bool)

(assert (=> d!117239 m!915693))

(assert (=> b!988043 d!117239))

(declare-fun d!117241 () Bool)

(declare-fun e!557380 () Bool)

(assert (=> d!117241 e!557380))

(declare-fun res!661116 () Bool)

(assert (=> d!117241 (=> (not res!661116) (not e!557380))))

(declare-fun lt!438512 () ListLongMap!13555)

(assert (=> d!117241 (= res!661116 (contains!5713 lt!438512 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!438509 () List!20789)

(assert (=> d!117241 (= lt!438512 (ListLongMap!13556 lt!438509))))

(declare-fun lt!438510 () Unit!32789)

(declare-fun lt!438511 () Unit!32789)

(assert (=> d!117241 (= lt!438510 lt!438511)))

(assert (=> d!117241 (= (getValueByKey!512 lt!438509 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117241 (= lt!438511 (lemmaContainsTupThenGetReturnValue!271 lt!438509 (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117241 (= lt!438509 (insertStrictlySorted!328 (toList!6793 call!41848) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117241 (= (+!3078 call!41848 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!438512)))

(declare-fun b!988455 () Bool)

(declare-fun res!661115 () Bool)

(assert (=> b!988455 (=> (not res!661115) (not e!557380))))

(assert (=> b!988455 (= res!661115 (= (getValueByKey!512 (toList!6793 lt!438512) (_1!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!517 (_2!7440 (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!988456 () Bool)

(assert (=> b!988456 (= e!557380 (contains!5714 (toList!6793 lt!438512) (tuple2!14859 (select (arr!30058 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15598 (select (arr!30059 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117241 res!661116) b!988455))

(assert (= (and b!988455 res!661115) b!988456))

(declare-fun m!915695 () Bool)

(assert (=> d!117241 m!915695))

(declare-fun m!915697 () Bool)

(assert (=> d!117241 m!915697))

(declare-fun m!915699 () Bool)

(assert (=> d!117241 m!915699))

(declare-fun m!915701 () Bool)

(assert (=> d!117241 m!915701))

(declare-fun m!915703 () Bool)

(assert (=> b!988455 m!915703))

(declare-fun m!915705 () Bool)

(assert (=> b!988456 m!915705))

(assert (=> b!988043 d!117241))

(assert (=> b!988043 d!117169))

(declare-fun d!117243 () Bool)

(declare-fun e!557381 () Bool)

(assert (=> d!117243 e!557381))

(declare-fun res!661118 () Bool)

(assert (=> d!117243 (=> (not res!661118) (not e!557381))))

(declare-fun lt!438516 () ListLongMap!13555)

(assert (=> d!117243 (= res!661118 (contains!5713 lt!438516 (_1!7440 (tuple2!14859 lt!438249 lt!438248))))))

(declare-fun lt!438513 () List!20789)

(assert (=> d!117243 (= lt!438516 (ListLongMap!13556 lt!438513))))

(declare-fun lt!438514 () Unit!32789)

(declare-fun lt!438515 () Unit!32789)

(assert (=> d!117243 (= lt!438514 lt!438515)))

(assert (=> d!117243 (= (getValueByKey!512 lt!438513 (_1!7440 (tuple2!14859 lt!438249 lt!438248))) (Some!517 (_2!7440 (tuple2!14859 lt!438249 lt!438248))))))

(assert (=> d!117243 (= lt!438515 (lemmaContainsTupThenGetReturnValue!271 lt!438513 (_1!7440 (tuple2!14859 lt!438249 lt!438248)) (_2!7440 (tuple2!14859 lt!438249 lt!438248))))))

(assert (=> d!117243 (= lt!438513 (insertStrictlySorted!328 (toList!6793 lt!438251) (_1!7440 (tuple2!14859 lt!438249 lt!438248)) (_2!7440 (tuple2!14859 lt!438249 lt!438248))))))

(assert (=> d!117243 (= (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248)) lt!438516)))

(declare-fun b!988457 () Bool)

(declare-fun res!661117 () Bool)

(assert (=> b!988457 (=> (not res!661117) (not e!557381))))

(assert (=> b!988457 (= res!661117 (= (getValueByKey!512 (toList!6793 lt!438516) (_1!7440 (tuple2!14859 lt!438249 lt!438248))) (Some!517 (_2!7440 (tuple2!14859 lt!438249 lt!438248)))))))

(declare-fun b!988458 () Bool)

(assert (=> b!988458 (= e!557381 (contains!5714 (toList!6793 lt!438516) (tuple2!14859 lt!438249 lt!438248)))))

(assert (= (and d!117243 res!661118) b!988457))

(assert (= (and b!988457 res!661117) b!988458))

(declare-fun m!915707 () Bool)

(assert (=> d!117243 m!915707))

(declare-fun m!915709 () Bool)

(assert (=> d!117243 m!915709))

(declare-fun m!915711 () Bool)

(assert (=> d!117243 m!915711))

(declare-fun m!915713 () Bool)

(assert (=> d!117243 m!915713))

(declare-fun m!915715 () Bool)

(assert (=> b!988457 m!915715))

(declare-fun m!915717 () Bool)

(assert (=> b!988458 m!915717))

(assert (=> b!988043 d!117243))

(declare-fun d!117245 () Bool)

(declare-fun e!557383 () Bool)

(assert (=> d!117245 e!557383))

(declare-fun res!661119 () Bool)

(assert (=> d!117245 (=> res!661119 e!557383)))

(declare-fun lt!438518 () Bool)

(assert (=> d!117245 (= res!661119 (not lt!438518))))

(declare-fun lt!438517 () Bool)

(assert (=> d!117245 (= lt!438518 lt!438517)))

(declare-fun lt!438519 () Unit!32789)

(declare-fun e!557382 () Unit!32789)

(assert (=> d!117245 (= lt!438519 e!557382)))

(declare-fun c!100220 () Bool)

(assert (=> d!117245 (= c!100220 lt!438517)))

(assert (=> d!117245 (= lt!438517 (containsKey!477 (toList!6793 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248))) lt!438245))))

(assert (=> d!117245 (= (contains!5713 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248)) lt!438245) lt!438518)))

(declare-fun b!988459 () Bool)

(declare-fun lt!438520 () Unit!32789)

(assert (=> b!988459 (= e!557382 lt!438520)))

(assert (=> b!988459 (= lt!438520 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6793 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248))) lt!438245))))

(assert (=> b!988459 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248))) lt!438245))))

(declare-fun b!988460 () Bool)

(declare-fun Unit!32812 () Unit!32789)

(assert (=> b!988460 (= e!557382 Unit!32812)))

(declare-fun b!988461 () Bool)

(assert (=> b!988461 (= e!557383 (isDefined!382 (getValueByKey!512 (toList!6793 (+!3078 lt!438251 (tuple2!14859 lt!438249 lt!438248))) lt!438245)))))

(assert (= (and d!117245 c!100220) b!988459))

(assert (= (and d!117245 (not c!100220)) b!988460))

(assert (= (and d!117245 (not res!661119)) b!988461))

(declare-fun m!915719 () Bool)

(assert (=> d!117245 m!915719))

(declare-fun m!915721 () Bool)

(assert (=> b!988459 m!915721))

(declare-fun m!915723 () Bool)

(assert (=> b!988459 m!915723))

(assert (=> b!988459 m!915723))

(declare-fun m!915725 () Bool)

(assert (=> b!988459 m!915725))

(assert (=> b!988461 m!915723))

(assert (=> b!988461 m!915723))

(assert (=> b!988461 m!915725))

(assert (=> b!988043 d!117245))

(declare-fun b!988462 () Bool)

(declare-fun e!557384 () Option!518)

(assert (=> b!988462 (= e!557384 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438259)))))))

(declare-fun b!988464 () Bool)

(declare-fun e!557385 () Option!518)

(assert (=> b!988464 (= e!557385 (getValueByKey!512 (t!29724 (toList!6793 lt!438259)) (_1!7440 lt!438074)))))

(declare-fun b!988465 () Bool)

(assert (=> b!988465 (= e!557385 None!516)))

(declare-fun b!988463 () Bool)

(assert (=> b!988463 (= e!557384 e!557385)))

(declare-fun c!100222 () Bool)

(assert (=> b!988463 (= c!100222 (and ((_ is Cons!20785) (toList!6793 lt!438259)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438259))) (_1!7440 lt!438074)))))))

(declare-fun d!117247 () Bool)

(declare-fun c!100221 () Bool)

(assert (=> d!117247 (= c!100221 (and ((_ is Cons!20785) (toList!6793 lt!438259)) (= (_1!7440 (h!21947 (toList!6793 lt!438259))) (_1!7440 lt!438074))))))

(assert (=> d!117247 (= (getValueByKey!512 (toList!6793 lt!438259) (_1!7440 lt!438074)) e!557384)))

(assert (= (and d!117247 c!100221) b!988462))

(assert (= (and d!117247 (not c!100221)) b!988463))

(assert (= (and b!988463 c!100222) b!988464))

(assert (= (and b!988463 (not c!100222)) b!988465))

(declare-fun m!915727 () Bool)

(assert (=> b!988464 m!915727))

(assert (=> b!988049 d!117247))

(assert (=> bm!41832 d!117059))

(assert (=> d!116969 d!116959))

(assert (=> b!988045 d!117155))

(assert (=> bm!41825 d!116987))

(declare-fun b!988466 () Bool)

(declare-fun e!557386 () Option!518)

(assert (=> b!988466 (= e!557386 (Some!517 (_2!7440 (h!21947 (toList!6793 lt!438263)))))))

(declare-fun b!988468 () Bool)

(declare-fun e!557387 () Option!518)

(assert (=> b!988468 (= e!557387 (getValueByKey!512 (t!29724 (toList!6793 lt!438263)) (_1!7440 lt!438068)))))

(declare-fun b!988469 () Bool)

(assert (=> b!988469 (= e!557387 None!516)))

(declare-fun b!988467 () Bool)

(assert (=> b!988467 (= e!557386 e!557387)))

(declare-fun c!100224 () Bool)

(assert (=> b!988467 (= c!100224 (and ((_ is Cons!20785) (toList!6793 lt!438263)) (not (= (_1!7440 (h!21947 (toList!6793 lt!438263))) (_1!7440 lt!438068)))))))

(declare-fun d!117249 () Bool)

(declare-fun c!100223 () Bool)

(assert (=> d!117249 (= c!100223 (and ((_ is Cons!20785) (toList!6793 lt!438263)) (= (_1!7440 (h!21947 (toList!6793 lt!438263))) (_1!7440 lt!438068))))))

(assert (=> d!117249 (= (getValueByKey!512 (toList!6793 lt!438263) (_1!7440 lt!438068)) e!557386)))

(assert (= (and d!117249 c!100223) b!988466))

(assert (= (and d!117249 (not c!100223)) b!988467))

(assert (= (and b!988467 c!100224) b!988468))

(assert (= (and b!988467 (not c!100224)) b!988469))

(declare-fun m!915729 () Bool)

(assert (=> b!988468 m!915729))

(assert (=> b!988051 d!117249))

(declare-fun b!988470 () Bool)

(declare-fun e!557389 () Bool)

(assert (=> b!988470 (= e!557389 tp_is_empty!23223)))

(declare-fun condMapEmpty!36876 () Bool)

(declare-fun mapDefault!36876 () ValueCell!11130)

(assert (=> mapNonEmpty!36875 (= condMapEmpty!36876 (= mapRest!36875 ((as const (Array (_ BitVec 32) ValueCell!11130)) mapDefault!36876)))))

(declare-fun e!557388 () Bool)

(declare-fun mapRes!36876 () Bool)

(assert (=> mapNonEmpty!36875 (= tp!69811 (and e!557388 mapRes!36876))))

(declare-fun mapIsEmpty!36876 () Bool)

(assert (=> mapIsEmpty!36876 mapRes!36876))

(declare-fun mapNonEmpty!36876 () Bool)

(declare-fun tp!69812 () Bool)

(assert (=> mapNonEmpty!36876 (= mapRes!36876 (and tp!69812 e!557389))))

(declare-fun mapKey!36876 () (_ BitVec 32))

(declare-fun mapRest!36876 () (Array (_ BitVec 32) ValueCell!11130))

(declare-fun mapValue!36876 () ValueCell!11130)

(assert (=> mapNonEmpty!36876 (= mapRest!36875 (store mapRest!36876 mapKey!36876 mapValue!36876))))

(declare-fun b!988471 () Bool)

(assert (=> b!988471 (= e!557388 tp_is_empty!23223)))

(assert (= (and mapNonEmpty!36875 condMapEmpty!36876) mapIsEmpty!36876))

(assert (= (and mapNonEmpty!36875 (not condMapEmpty!36876)) mapNonEmpty!36876))

(assert (= (and mapNonEmpty!36876 ((_ is ValueCellFull!11130) mapValue!36876)) b!988470))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11130) mapDefault!36876)) b!988471))

(declare-fun m!915731 () Bool)

(assert (=> mapNonEmpty!36876 m!915731))

(declare-fun b_lambda!15069 () Bool)

(assert (= b_lambda!15065 (or (and start!84456 b_free!20007) b_lambda!15069)))

(declare-fun b_lambda!15071 () Bool)

(assert (= b_lambda!15067 (or (and start!84456 b_free!20007) b_lambda!15071)))

(declare-fun b_lambda!15073 () Bool)

(assert (= b_lambda!15063 (or (and start!84456 b_free!20007) b_lambda!15073)))

(declare-fun b_lambda!15075 () Bool)

(assert (= b_lambda!15061 (or (and start!84456 b_free!20007) b_lambda!15075)))

(check-sat (not b!988258) (not b_lambda!15053) (not b!988410) (not bm!41878) (not b!988427) (not bm!41860) (not bm!41879) (not d!117143) (not b!988305) (not mapNonEmpty!36876) (not b!988375) (not b!988281) (not d!117243) (not b!988083) (not b!988134) (not bm!41871) (not b_lambda!15059) (not b!988464) (not d!117031) (not b!988181) (not b!988213) (not b!988387) (not d!117135) (not b!988458) (not d!117047) (not b!988287) (not d!117223) (not d!117181) (not b!988395) (not b!988421) (not b!988079) (not d!117131) (not bm!41872) (not b!988096) (not d!117033) (not b!988348) (not b!988367) (not b_lambda!15043) (not b!988168) (not b!988336) (not b!988136) (not b!988379) (not d!117003) (not b!988184) (not d!117045) (not b!988228) (not d!117039) (not b!988162) (not d!117119) (not d!117177) (not b!988322) (not bm!41861) (not d!117133) (not d!117077) (not b!988325) (not b!988231) (not b!988194) (not b!988209) (not b!988338) (not bm!41875) (not d!117165) (not d!117097) (not b!988328) (not b!988349) (not b!988409) (not d!117063) (not b!988393) (not b!988417) (not b!988396) (not b!988358) (not b!988433) tp_is_empty!23223 (not d!117137) (not b!988441) (not b!988142) (not b!988412) (not b!988139) (not b!988295) (not b!988374) (not b!988456) (not b!988376) (not b!988370) (not d!117123) (not b!988329) (not b!988212) (not d!117245) (not b!988340) (not b!988169) (not b!988419) (not b!988222) (not d!117149) (not d!117065) (not d!117125) (not b!988355) (not b!988424) (not b!988223) (not d!117099) (not b!988148) (not d!117011) (not b!988126) (not d!117185) (not b!988372) (not b!988459) (not b!988132) (not b!988268) (not d!117089) (not b!988442) (not b!988276) (not d!117157) (not d!117183) (not b!988154) (not d!117215) (not d!117153) (not d!117079) (not b!988205) (not d!117163) (not d!117121) (not b!988226) (not d!117025) (not d!117055) (not b!988397) (not b!988283) (not d!117017) (not d!117059) (not d!117061) (not b!988420) (not d!117049) (not b!988214) (not b!988430) (not b!988297) (not b!988158) (not d!117155) (not b!988102) (not d!117043) (not b!988407) (not b!988468) (not d!117211) (not b!988160) (not d!117221) (not b!988146) (not b!988378) (not d!117093) (not b!988290) (not b!988346) (not d!117007) (not b!988431) (not b!988288) (not bm!41868) (not d!117075) (not d!117229) (not d!117219) (not b_lambda!15055) (not b!988327) (not d!117201) (not b!988279) (not d!117073) (not b!988422) (not b!988461) (not b!988314) (not b!988380) (not d!117145) (not b!988271) (not b!988277) (not d!117069) b_and!32103 (not b!988219) (not d!117235) (not d!117193) (not b!988326) (not b!988264) (not b!988237) (not b!988171) (not d!117103) (not b!988091) (not d!117151) (not b!988229) (not bm!41864) (not b!988352) (not bm!41865) (not b!988278) (not b!988201) (not b!988455) (not b!988225) (not d!117239) (not b!988331) (not d!117209) (not bm!41854) (not b!988350) (not b!988388) (not d!117203) (not d!117107) (not b!988202) (not d!117085) (not b!988446) (not b!988334) (not b!988191) (not b!988207) (not bm!41857) (not d!117035) (not d!117101) (not d!117197) (not b_next!20007) (not d!117213) (not b!988218) (not b!988280) (not b!988165) (not d!117207) (not b!988293) (not d!117091) (not b!988445) (not b!988182) (not d!117057) (not b!988299) (not b!988093) (not b!988439) (not b!988285) (not b!988177) (not b!988179) (not b!988429) (not b!988286) (not b!988311) (not d!117013) (not b!988195) (not d!117041) (not d!117241) (not b!988296) (not d!117095) (not d!117231) (not b!988200) (not b!988224) (not d!117083) (not b!988206) (not b!988390) (not b!988204) (not b!988449) (not b!988243) (not b!988323) (not d!117067) (not b!988220) (not d!117175) (not b!988405) (not b!988103) (not b!988415) (not b!988189) (not b!988227) (not b_lambda!15057) (not b!988359) (not b!988457) (not b!988313) (not b_lambda!15075) (not b!988137) (not b!988357) (not b!988144) (not d!117051) (not b_lambda!15071) (not b!988317) (not b!988167) (not b!988413) (not b!988361) (not d!117009) (not d!117111) (not b!988275) (not b!988309) (not b!988210) (not d!117217) (not d!117117) (not d!117053) (not b!988274) (not b!988272) (not b_lambda!15073) (not d!117189) (not b!988211) (not b!988145) (not d!117225) (not b!988124) (not d!117127) (not d!117205) (not d!117139) (not b_lambda!15069) (not d!117167) (not d!117195) (not b!988273) (not d!117087) (not b!988282) (not d!117179) (not b!988399) (not d!117029) (not b!988284) (not b!988337) (not d!117129) (not d!117105) (not d!117147) (not d!117019) (not d!117081) (not b!988270) (not b!988196) (not d!117171) (not b!988308) (not b!988321) (not b!988316) (not d!117161))
(check-sat b_and!32103 (not b_next!20007))
