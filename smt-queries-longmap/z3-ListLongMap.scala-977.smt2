; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21124 () Bool)

(assert start!21124)

(declare-fun b_free!5611 () Bool)

(declare-fun b_next!5611 () Bool)

(assert (=> start!21124 (= b_free!5611 (not b_next!5611))))

(declare-fun tp!19898 () Bool)

(declare-fun b_and!12427 () Bool)

(assert (=> start!21124 (= tp!19898 b_and!12427)))

(declare-fun b!212436 () Bool)

(declare-fun e!138207 () Bool)

(declare-fun e!138206 () Bool)

(declare-fun mapRes!9302 () Bool)

(assert (=> b!212436 (= e!138207 (and e!138206 mapRes!9302))))

(declare-fun condMapEmpty!9302 () Bool)

(declare-datatypes ((V!6945 0))(
  ( (V!6946 (val!2781 Int)) )
))
(declare-datatypes ((ValueCell!2393 0))(
  ( (ValueCellFull!2393 (v!4777 V!6945)) (EmptyCell!2393) )
))
(declare-datatypes ((array!10137 0))(
  ( (array!10138 (arr!4810 (Array (_ BitVec 32) ValueCell!2393)) (size!5136 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10137)

(declare-fun mapDefault!9302 () ValueCell!2393)

(assert (=> b!212436 (= condMapEmpty!9302 (= (arr!4810 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2393)) mapDefault!9302)))))

(declare-fun b!212437 () Bool)

(declare-fun tp_is_empty!5473 () Bool)

(assert (=> b!212437 (= e!138206 tp_is_empty!5473)))

(declare-fun b!212438 () Bool)

(declare-fun res!103864 () Bool)

(declare-fun e!138210 () Bool)

(assert (=> b!212438 (=> (not res!103864) (not e!138210))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212438 (= res!103864 (validKeyInArray!0 k0!843))))

(declare-fun res!103871 () Bool)

(assert (=> start!21124 (=> (not res!103871) (not e!138210))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21124 (= res!103871 (validMask!0 mask!1149))))

(assert (=> start!21124 e!138210))

(declare-fun array_inv!3159 (array!10137) Bool)

(assert (=> start!21124 (and (array_inv!3159 _values!649) e!138207)))

(assert (=> start!21124 true))

(assert (=> start!21124 tp_is_empty!5473))

(declare-datatypes ((array!10139 0))(
  ( (array!10140 (arr!4811 (Array (_ BitVec 32) (_ BitVec 64))) (size!5137 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10139)

(declare-fun array_inv!3160 (array!10139) Bool)

(assert (=> start!21124 (array_inv!3160 _keys!825)))

(assert (=> start!21124 tp!19898))

(declare-fun b!212439 () Bool)

(declare-fun res!103867 () Bool)

(assert (=> b!212439 (=> (not res!103867) (not e!138210))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212439 (= res!103867 (and (= (size!5136 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5137 _keys!825) (size!5136 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212440 () Bool)

(declare-fun res!103869 () Bool)

(assert (=> b!212440 (=> (not res!103869) (not e!138210))))

(declare-datatypes ((List!3085 0))(
  ( (Nil!3082) (Cons!3081 (h!3723 (_ BitVec 64)) (t!8023 List!3085)) )
))
(declare-fun arrayNoDuplicates!0 (array!10139 (_ BitVec 32) List!3085) Bool)

(assert (=> b!212440 (= res!103869 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3082))))

(declare-fun b!212441 () Bool)

(declare-fun res!103870 () Bool)

(assert (=> b!212441 (=> (not res!103870) (not e!138210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10139 (_ BitVec 32)) Bool)

(assert (=> b!212441 (= res!103870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212442 () Bool)

(declare-fun res!103865 () Bool)

(assert (=> b!212442 (=> (not res!103865) (not e!138210))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212442 (= res!103865 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5137 _keys!825))))))

(declare-datatypes ((tuple2!4176 0))(
  ( (tuple2!4177 (_1!2099 (_ BitVec 64)) (_2!2099 V!6945)) )
))
(declare-datatypes ((List!3086 0))(
  ( (Nil!3083) (Cons!3082 (h!3724 tuple2!4176) (t!8024 List!3086)) )
))
(declare-datatypes ((ListLongMap!3079 0))(
  ( (ListLongMap!3080 (toList!1555 List!3086)) )
))
(declare-fun lt!109429 () ListLongMap!3079)

(declare-fun b!212443 () Bool)

(declare-fun e!138204 () Bool)

(declare-fun lt!109433 () ListLongMap!3079)

(declare-fun lt!109431 () tuple2!4176)

(declare-fun +!579 (ListLongMap!3079 tuple2!4176) ListLongMap!3079)

(assert (=> b!212443 (= e!138204 (= lt!109433 (+!579 lt!109429 lt!109431)))))

(declare-fun b!212444 () Bool)

(declare-fun e!138205 () Bool)

(assert (=> b!212444 (= e!138205 tp_is_empty!5473)))

(declare-fun mapNonEmpty!9302 () Bool)

(declare-fun tp!19897 () Bool)

(assert (=> mapNonEmpty!9302 (= mapRes!9302 (and tp!19897 e!138205))))

(declare-fun mapRest!9302 () (Array (_ BitVec 32) ValueCell!2393))

(declare-fun mapKey!9302 () (_ BitVec 32))

(declare-fun mapValue!9302 () ValueCell!2393)

(assert (=> mapNonEmpty!9302 (= (arr!4810 _values!649) (store mapRest!9302 mapKey!9302 mapValue!9302))))

(declare-fun b!212445 () Bool)

(declare-fun res!103866 () Bool)

(assert (=> b!212445 (=> (not res!103866) (not e!138210))))

(assert (=> b!212445 (= res!103866 (= (select (arr!4811 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9302 () Bool)

(assert (=> mapIsEmpty!9302 mapRes!9302))

(declare-fun lt!109430 () ListLongMap!3079)

(declare-fun lt!109436 () ListLongMap!3079)

(declare-fun b!212446 () Bool)

(declare-fun e!138208 () Bool)

(assert (=> b!212446 (= e!138208 (= lt!109430 (+!579 lt!109436 lt!109431)))))

(assert (=> b!212446 e!138204))

(declare-fun res!103863 () Bool)

(assert (=> b!212446 (=> (not res!103863) (not e!138204))))

(declare-fun lt!109434 () ListLongMap!3079)

(assert (=> b!212446 (= res!103863 (= lt!109433 (+!579 lt!109434 lt!109431)))))

(declare-fun minValue!615 () V!6945)

(assert (=> b!212446 (= lt!109431 (tuple2!4177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212447 () Bool)

(assert (=> b!212447 (= e!138210 (not e!138208))))

(declare-fun res!103868 () Bool)

(assert (=> b!212447 (=> res!103868 e!138208)))

(assert (=> b!212447 (= res!103868 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6945)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1066 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) Int) ListLongMap!3079)

(assert (=> b!212447 (= lt!109430 (getCurrentListMap!1066 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109435 () array!10137)

(assert (=> b!212447 (= lt!109433 (getCurrentListMap!1066 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212447 (and (= lt!109434 lt!109429) (= lt!109429 lt!109434))))

(declare-fun v!520 () V!6945)

(assert (=> b!212447 (= lt!109429 (+!579 lt!109436 (tuple2!4177 k0!843 v!520)))))

(declare-datatypes ((Unit!6408 0))(
  ( (Unit!6409) )
))
(declare-fun lt!109432 () Unit!6408)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!227 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) (_ BitVec 64) V!6945 (_ BitVec 32) Int) Unit!6408)

(assert (=> b!212447 (= lt!109432 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!227 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!503 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) Int) ListLongMap!3079)

(assert (=> b!212447 (= lt!109434 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212447 (= lt!109435 (array!10138 (store (arr!4810 _values!649) i!601 (ValueCellFull!2393 v!520)) (size!5136 _values!649)))))

(assert (=> b!212447 (= lt!109436 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!21124 res!103871) b!212439))

(assert (= (and b!212439 res!103867) b!212441))

(assert (= (and b!212441 res!103870) b!212440))

(assert (= (and b!212440 res!103869) b!212442))

(assert (= (and b!212442 res!103865) b!212438))

(assert (= (and b!212438 res!103864) b!212445))

(assert (= (and b!212445 res!103866) b!212447))

(assert (= (and b!212447 (not res!103868)) b!212446))

(assert (= (and b!212446 res!103863) b!212443))

(assert (= (and b!212436 condMapEmpty!9302) mapIsEmpty!9302))

(assert (= (and b!212436 (not condMapEmpty!9302)) mapNonEmpty!9302))

(get-info :version)

(assert (= (and mapNonEmpty!9302 ((_ is ValueCellFull!2393) mapValue!9302)) b!212444))

(assert (= (and b!212436 ((_ is ValueCellFull!2393) mapDefault!9302)) b!212437))

(assert (= start!21124 b!212436))

(declare-fun m!239769 () Bool)

(assert (=> start!21124 m!239769))

(declare-fun m!239771 () Bool)

(assert (=> start!21124 m!239771))

(declare-fun m!239773 () Bool)

(assert (=> start!21124 m!239773))

(declare-fun m!239775 () Bool)

(assert (=> b!212440 m!239775))

(declare-fun m!239777 () Bool)

(assert (=> b!212447 m!239777))

(declare-fun m!239779 () Bool)

(assert (=> b!212447 m!239779))

(declare-fun m!239781 () Bool)

(assert (=> b!212447 m!239781))

(declare-fun m!239783 () Bool)

(assert (=> b!212447 m!239783))

(declare-fun m!239785 () Bool)

(assert (=> b!212447 m!239785))

(declare-fun m!239787 () Bool)

(assert (=> b!212447 m!239787))

(declare-fun m!239789 () Bool)

(assert (=> b!212447 m!239789))

(declare-fun m!239791 () Bool)

(assert (=> b!212445 m!239791))

(declare-fun m!239793 () Bool)

(assert (=> b!212446 m!239793))

(declare-fun m!239795 () Bool)

(assert (=> b!212446 m!239795))

(declare-fun m!239797 () Bool)

(assert (=> b!212438 m!239797))

(declare-fun m!239799 () Bool)

(assert (=> b!212443 m!239799))

(declare-fun m!239801 () Bool)

(assert (=> mapNonEmpty!9302 m!239801))

(declare-fun m!239803 () Bool)

(assert (=> b!212441 m!239803))

(check-sat (not b!212446) (not b!212443) (not b!212438) (not b!212440) tp_is_empty!5473 (not b!212447) (not mapNonEmpty!9302) (not b!212441) b_and!12427 (not start!21124) (not b_next!5611))
(check-sat b_and!12427 (not b_next!5611))
(get-model)

(declare-fun b!212544 () Bool)

(declare-fun e!138272 () Bool)

(assert (=> b!212544 (= e!138272 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212544 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212545 () Bool)

(declare-fun e!138270 () ListLongMap!3079)

(declare-fun e!138267 () ListLongMap!3079)

(assert (=> b!212545 (= e!138270 e!138267)))

(declare-fun c!35810 () Bool)

(assert (=> b!212545 (= c!35810 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20104 () Bool)

(declare-fun call!20107 () ListLongMap!3079)

(assert (=> bm!20104 (= call!20107 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun lt!109502 () ListLongMap!3079)

(declare-fun b!212546 () Bool)

(declare-fun e!138271 () Bool)

(assert (=> b!212546 (= e!138271 (= lt!109502 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212547 () Bool)

(assert (=> b!212547 (= e!138267 call!20107)))

(declare-fun b!212549 () Bool)

(declare-fun e!138273 () Bool)

(assert (=> b!212549 (= e!138273 e!138271)))

(declare-fun c!35811 () Bool)

(assert (=> b!212549 (= c!35811 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212550 () Bool)

(declare-fun e!138268 () Bool)

(assert (=> b!212550 (= e!138273 e!138268)))

(assert (=> b!212550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun res!103934 () Bool)

(declare-fun contains!1391 (ListLongMap!3079 (_ BitVec 64)) Bool)

(assert (=> b!212550 (= res!103934 (contains!1391 lt!109502 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212550 (=> (not res!103934) (not e!138268))))

(declare-fun b!212551 () Bool)

(declare-fun lt!109505 () Unit!6408)

(declare-fun lt!109501 () Unit!6408)

(assert (=> b!212551 (= lt!109505 lt!109501)))

(declare-fun lt!109504 () V!6945)

(declare-fun lt!109503 () (_ BitVec 64))

(declare-fun lt!109499 () ListLongMap!3079)

(declare-fun lt!109500 () (_ BitVec 64))

(assert (=> b!212551 (not (contains!1391 (+!579 lt!109499 (tuple2!4177 lt!109500 lt!109504)) lt!109503))))

(declare-fun addStillNotContains!107 (ListLongMap!3079 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6408)

(assert (=> b!212551 (= lt!109501 (addStillNotContains!107 lt!109499 lt!109500 lt!109504 lt!109503))))

(assert (=> b!212551 (= lt!109503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2571 (ValueCell!2393 V!6945) V!6945)

(declare-fun dynLambda!531 (Int (_ BitVec 64)) V!6945)

(assert (=> b!212551 (= lt!109504 (get!2571 (select (arr!4810 _values!649) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212551 (= lt!109500 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212551 (= lt!109499 call!20107)))

(assert (=> b!212551 (= e!138267 (+!579 call!20107 (tuple2!4177 (select (arr!4811 _keys!825) #b00000000000000000000000000000000) (get!2571 (select (arr!4810 _values!649) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212552 () Bool)

(assert (=> b!212552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> b!212552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5136 _values!649)))))

(declare-fun apply!197 (ListLongMap!3079 (_ BitVec 64)) V!6945)

(assert (=> b!212552 (= e!138268 (= (apply!197 lt!109502 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4810 _values!649) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212553 () Bool)

(declare-fun isEmpty!502 (ListLongMap!3079) Bool)

(assert (=> b!212553 (= e!138271 (isEmpty!502 lt!109502))))

(declare-fun b!212548 () Bool)

(declare-fun res!103937 () Bool)

(declare-fun e!138269 () Bool)

(assert (=> b!212548 (=> (not res!103937) (not e!138269))))

(assert (=> b!212548 (= res!103937 (not (contains!1391 lt!109502 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57989 () Bool)

(assert (=> d!57989 e!138269))

(declare-fun res!103935 () Bool)

(assert (=> d!57989 (=> (not res!103935) (not e!138269))))

(assert (=> d!57989 (= res!103935 (not (contains!1391 lt!109502 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57989 (= lt!109502 e!138270)))

(declare-fun c!35813 () Bool)

(assert (=> d!57989 (= c!35813 (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!57989 (validMask!0 mask!1149)))

(assert (=> d!57989 (= (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109502)))

(declare-fun b!212554 () Bool)

(assert (=> b!212554 (= e!138269 e!138273)))

(declare-fun c!35812 () Bool)

(assert (=> b!212554 (= c!35812 e!138272)))

(declare-fun res!103936 () Bool)

(assert (=> b!212554 (=> (not res!103936) (not e!138272))))

(assert (=> b!212554 (= res!103936 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212555 () Bool)

(assert (=> b!212555 (= e!138270 (ListLongMap!3080 Nil!3083))))

(assert (= (and d!57989 c!35813) b!212555))

(assert (= (and d!57989 (not c!35813)) b!212545))

(assert (= (and b!212545 c!35810) b!212551))

(assert (= (and b!212545 (not c!35810)) b!212547))

(assert (= (or b!212551 b!212547) bm!20104))

(assert (= (and d!57989 res!103935) b!212548))

(assert (= (and b!212548 res!103937) b!212554))

(assert (= (and b!212554 res!103936) b!212544))

(assert (= (and b!212554 c!35812) b!212550))

(assert (= (and b!212554 (not c!35812)) b!212549))

(assert (= (and b!212550 res!103934) b!212552))

(assert (= (and b!212549 c!35811) b!212546))

(assert (= (and b!212549 (not c!35811)) b!212553))

(declare-fun b_lambda!7713 () Bool)

(assert (=> (not b_lambda!7713) (not b!212551)))

(declare-fun t!8028 () Bool)

(declare-fun tb!2899 () Bool)

(assert (=> (and start!21124 (= defaultEntry!657 defaultEntry!657) t!8028) tb!2899))

(declare-fun result!5001 () Bool)

(assert (=> tb!2899 (= result!5001 tp_is_empty!5473)))

(assert (=> b!212551 t!8028))

(declare-fun b_and!12433 () Bool)

(assert (= b_and!12427 (and (=> t!8028 result!5001) b_and!12433)))

(declare-fun b_lambda!7715 () Bool)

(assert (=> (not b_lambda!7715) (not b!212552)))

(assert (=> b!212552 t!8028))

(declare-fun b_and!12435 () Bool)

(assert (= b_and!12433 (and (=> t!8028 result!5001) b_and!12435)))

(declare-fun m!239877 () Bool)

(assert (=> b!212544 m!239877))

(assert (=> b!212544 m!239877))

(declare-fun m!239879 () Bool)

(assert (=> b!212544 m!239879))

(declare-fun m!239881 () Bool)

(assert (=> b!212548 m!239881))

(assert (=> b!212545 m!239877))

(assert (=> b!212545 m!239877))

(assert (=> b!212545 m!239879))

(declare-fun m!239883 () Bool)

(assert (=> b!212553 m!239883))

(declare-fun m!239885 () Bool)

(assert (=> b!212551 m!239885))

(declare-fun m!239887 () Bool)

(assert (=> b!212551 m!239887))

(declare-fun m!239889 () Bool)

(assert (=> b!212551 m!239889))

(declare-fun m!239891 () Bool)

(assert (=> b!212551 m!239891))

(declare-fun m!239893 () Bool)

(assert (=> b!212551 m!239893))

(assert (=> b!212551 m!239885))

(assert (=> b!212551 m!239887))

(assert (=> b!212551 m!239877))

(assert (=> b!212551 m!239893))

(declare-fun m!239895 () Bool)

(assert (=> b!212551 m!239895))

(declare-fun m!239897 () Bool)

(assert (=> b!212551 m!239897))

(declare-fun m!239899 () Bool)

(assert (=> b!212546 m!239899))

(assert (=> bm!20104 m!239899))

(declare-fun m!239901 () Bool)

(assert (=> d!57989 m!239901))

(assert (=> d!57989 m!239769))

(assert (=> b!212550 m!239877))

(assert (=> b!212550 m!239877))

(declare-fun m!239903 () Bool)

(assert (=> b!212550 m!239903))

(assert (=> b!212552 m!239885))

(assert (=> b!212552 m!239887))

(assert (=> b!212552 m!239889))

(assert (=> b!212552 m!239885))

(assert (=> b!212552 m!239887))

(assert (=> b!212552 m!239877))

(declare-fun m!239905 () Bool)

(assert (=> b!212552 m!239905))

(assert (=> b!212552 m!239877))

(assert (=> b!212447 d!57989))

(declare-fun b!212600 () Bool)

(declare-fun res!103956 () Bool)

(declare-fun e!138307 () Bool)

(assert (=> b!212600 (=> (not res!103956) (not e!138307))))

(declare-fun e!138303 () Bool)

(assert (=> b!212600 (= res!103956 e!138303)))

(declare-fun res!103963 () Bool)

(assert (=> b!212600 (=> res!103963 e!138303)))

(declare-fun e!138304 () Bool)

(assert (=> b!212600 (= res!103963 (not e!138304))))

(declare-fun res!103961 () Bool)

(assert (=> b!212600 (=> (not res!103961) (not e!138304))))

(assert (=> b!212600 (= res!103961 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun bm!20119 () Bool)

(declare-fun call!20128 () ListLongMap!3079)

(declare-fun call!20127 () ListLongMap!3079)

(assert (=> bm!20119 (= call!20128 call!20127)))

(declare-fun b!212601 () Bool)

(declare-fun e!138300 () Bool)

(declare-fun lt!109568 () ListLongMap!3079)

(assert (=> b!212601 (= e!138300 (= (apply!197 lt!109568 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20120 () Bool)

(declare-fun call!20125 () ListLongMap!3079)

(declare-fun call!20124 () ListLongMap!3079)

(assert (=> bm!20120 (= call!20125 call!20124)))

(declare-fun bm!20121 () Bool)

(declare-fun call!20126 () ListLongMap!3079)

(declare-fun c!35831 () Bool)

(declare-fun c!35828 () Bool)

(assert (=> bm!20121 (= call!20124 (+!579 (ite c!35828 call!20127 (ite c!35831 call!20128 call!20126)) (ite (or c!35828 c!35831) (tuple2!4177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212602 () Bool)

(assert (=> b!212602 (= e!138304 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!138310 () Bool)

(declare-fun b!212603 () Bool)

(assert (=> b!212603 (= e!138310 (= (apply!197 lt!109568 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4810 lt!109435) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5136 lt!109435)))))

(assert (=> b!212603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212604 () Bool)

(declare-fun e!138306 () Bool)

(declare-fun e!138309 () Bool)

(assert (=> b!212604 (= e!138306 e!138309)))

(declare-fun res!103958 () Bool)

(declare-fun call!20123 () Bool)

(assert (=> b!212604 (= res!103958 call!20123)))

(assert (=> b!212604 (=> (not res!103958) (not e!138309))))

(declare-fun bm!20122 () Bool)

(assert (=> bm!20122 (= call!20126 call!20128)))

(declare-fun b!212605 () Bool)

(assert (=> b!212605 (= e!138306 (not call!20123))))

(declare-fun b!212606 () Bool)

(assert (=> b!212606 (= e!138303 e!138310)))

(declare-fun res!103960 () Bool)

(assert (=> b!212606 (=> (not res!103960) (not e!138310))))

(assert (=> b!212606 (= res!103960 (contains!1391 lt!109568 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212607 () Bool)

(declare-fun e!138308 () Bool)

(assert (=> b!212607 (= e!138308 e!138300)))

(declare-fun res!103964 () Bool)

(declare-fun call!20122 () Bool)

(assert (=> b!212607 (= res!103964 call!20122)))

(assert (=> b!212607 (=> (not res!103964) (not e!138300))))

(declare-fun bm!20123 () Bool)

(assert (=> bm!20123 (= call!20127 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212608 () Bool)

(declare-fun e!138302 () Unit!6408)

(declare-fun Unit!6412 () Unit!6408)

(assert (=> b!212608 (= e!138302 Unit!6412)))

(declare-fun b!212609 () Bool)

(declare-fun e!138301 () ListLongMap!3079)

(assert (=> b!212609 (= e!138301 (+!579 call!20124 (tuple2!4177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20124 () Bool)

(assert (=> bm!20124 (= call!20123 (contains!1391 lt!109568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20125 () Bool)

(assert (=> bm!20125 (= call!20122 (contains!1391 lt!109568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212610 () Bool)

(declare-fun e!138305 () ListLongMap!3079)

(assert (=> b!212610 (= e!138305 call!20125)))

(declare-fun b!212611 () Bool)

(assert (=> b!212611 (= e!138307 e!138306)))

(declare-fun c!35826 () Bool)

(assert (=> b!212611 (= c!35826 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212612 () Bool)

(declare-fun lt!109561 () Unit!6408)

(assert (=> b!212612 (= e!138302 lt!109561)))

(declare-fun lt!109559 () ListLongMap!3079)

(assert (=> b!212612 (= lt!109559 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109560 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109564 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109564 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109566 () Unit!6408)

(declare-fun addStillContains!173 (ListLongMap!3079 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6408)

(assert (=> b!212612 (= lt!109566 (addStillContains!173 lt!109559 lt!109560 zeroValue!615 lt!109564))))

(assert (=> b!212612 (contains!1391 (+!579 lt!109559 (tuple2!4177 lt!109560 zeroValue!615)) lt!109564)))

(declare-fun lt!109550 () Unit!6408)

(assert (=> b!212612 (= lt!109550 lt!109566)))

(declare-fun lt!109563 () ListLongMap!3079)

(assert (=> b!212612 (= lt!109563 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109553 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109553 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109558 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109558 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109569 () Unit!6408)

(declare-fun addApplyDifferent!173 (ListLongMap!3079 (_ BitVec 64) V!6945 (_ BitVec 64)) Unit!6408)

(assert (=> b!212612 (= lt!109569 (addApplyDifferent!173 lt!109563 lt!109553 minValue!615 lt!109558))))

(assert (=> b!212612 (= (apply!197 (+!579 lt!109563 (tuple2!4177 lt!109553 minValue!615)) lt!109558) (apply!197 lt!109563 lt!109558))))

(declare-fun lt!109570 () Unit!6408)

(assert (=> b!212612 (= lt!109570 lt!109569)))

(declare-fun lt!109567 () ListLongMap!3079)

(assert (=> b!212612 (= lt!109567 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109562 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109565 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109565 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109552 () Unit!6408)

(assert (=> b!212612 (= lt!109552 (addApplyDifferent!173 lt!109567 lt!109562 zeroValue!615 lt!109565))))

(assert (=> b!212612 (= (apply!197 (+!579 lt!109567 (tuple2!4177 lt!109562 zeroValue!615)) lt!109565) (apply!197 lt!109567 lt!109565))))

(declare-fun lt!109571 () Unit!6408)

(assert (=> b!212612 (= lt!109571 lt!109552)))

(declare-fun lt!109556 () ListLongMap!3079)

(assert (=> b!212612 (= lt!109556 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109554 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109554 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109557 () (_ BitVec 64))

(assert (=> b!212612 (= lt!109557 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212612 (= lt!109561 (addApplyDifferent!173 lt!109556 lt!109554 minValue!615 lt!109557))))

(assert (=> b!212612 (= (apply!197 (+!579 lt!109556 (tuple2!4177 lt!109554 minValue!615)) lt!109557) (apply!197 lt!109556 lt!109557))))

(declare-fun b!212613 () Bool)

(declare-fun res!103959 () Bool)

(assert (=> b!212613 (=> (not res!103959) (not e!138307))))

(assert (=> b!212613 (= res!103959 e!138308)))

(declare-fun c!35830 () Bool)

(assert (=> b!212613 (= c!35830 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212614 () Bool)

(declare-fun e!138312 () ListLongMap!3079)

(assert (=> b!212614 (= e!138312 call!20126)))

(declare-fun b!212615 () Bool)

(assert (=> b!212615 (= e!138312 call!20125)))

(declare-fun b!212616 () Bool)

(assert (=> b!212616 (= e!138308 (not call!20122))))

(declare-fun b!212617 () Bool)

(declare-fun c!35829 () Bool)

(assert (=> b!212617 (= c!35829 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212617 (= e!138305 e!138312)))

(declare-fun b!212618 () Bool)

(assert (=> b!212618 (= e!138309 (= (apply!197 lt!109568 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun d!57991 () Bool)

(assert (=> d!57991 e!138307))

(declare-fun res!103957 () Bool)

(assert (=> d!57991 (=> (not res!103957) (not e!138307))))

(assert (=> d!57991 (= res!103957 (or (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))))

(declare-fun lt!109555 () ListLongMap!3079)

(assert (=> d!57991 (= lt!109568 lt!109555)))

(declare-fun lt!109551 () Unit!6408)

(assert (=> d!57991 (= lt!109551 e!138302)))

(declare-fun c!35827 () Bool)

(declare-fun e!138311 () Bool)

(assert (=> d!57991 (= c!35827 e!138311)))

(declare-fun res!103962 () Bool)

(assert (=> d!57991 (=> (not res!103962) (not e!138311))))

(assert (=> d!57991 (= res!103962 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!57991 (= lt!109555 e!138301)))

(assert (=> d!57991 (= c!35828 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57991 (validMask!0 mask!1149)))

(assert (=> d!57991 (= (getCurrentListMap!1066 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109568)))

(declare-fun b!212619 () Bool)

(assert (=> b!212619 (= e!138301 e!138305)))

(assert (=> b!212619 (= c!35831 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212620 () Bool)

(assert (=> b!212620 (= e!138311 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57991 c!35828) b!212609))

(assert (= (and d!57991 (not c!35828)) b!212619))

(assert (= (and b!212619 c!35831) b!212610))

(assert (= (and b!212619 (not c!35831)) b!212617))

(assert (= (and b!212617 c!35829) b!212615))

(assert (= (and b!212617 (not c!35829)) b!212614))

(assert (= (or b!212615 b!212614) bm!20122))

(assert (= (or b!212610 bm!20122) bm!20119))

(assert (= (or b!212610 b!212615) bm!20120))

(assert (= (or b!212609 bm!20119) bm!20123))

(assert (= (or b!212609 bm!20120) bm!20121))

(assert (= (and d!57991 res!103962) b!212620))

(assert (= (and d!57991 c!35827) b!212612))

(assert (= (and d!57991 (not c!35827)) b!212608))

(assert (= (and d!57991 res!103957) b!212600))

(assert (= (and b!212600 res!103961) b!212602))

(assert (= (and b!212600 (not res!103963)) b!212606))

(assert (= (and b!212606 res!103960) b!212603))

(assert (= (and b!212600 res!103956) b!212613))

(assert (= (and b!212613 c!35830) b!212607))

(assert (= (and b!212613 (not c!35830)) b!212616))

(assert (= (and b!212607 res!103964) b!212601))

(assert (= (or b!212607 b!212616) bm!20125))

(assert (= (and b!212613 res!103959) b!212611))

(assert (= (and b!212611 c!35826) b!212604))

(assert (= (and b!212611 (not c!35826)) b!212605))

(assert (= (and b!212604 res!103958) b!212618))

(assert (= (or b!212604 b!212605) bm!20124))

(declare-fun b_lambda!7717 () Bool)

(assert (=> (not b_lambda!7717) (not b!212603)))

(assert (=> b!212603 t!8028))

(declare-fun b_and!12437 () Bool)

(assert (= b_and!12435 (and (=> t!8028 result!5001) b_and!12437)))

(assert (=> b!212606 m!239877))

(assert (=> b!212606 m!239877))

(declare-fun m!239907 () Bool)

(assert (=> b!212606 m!239907))

(declare-fun m!239909 () Bool)

(assert (=> bm!20125 m!239909))

(assert (=> d!57991 m!239769))

(declare-fun m!239911 () Bool)

(assert (=> b!212618 m!239911))

(declare-fun m!239913 () Bool)

(assert (=> b!212612 m!239913))

(declare-fun m!239915 () Bool)

(assert (=> b!212612 m!239915))

(declare-fun m!239917 () Bool)

(assert (=> b!212612 m!239917))

(declare-fun m!239919 () Bool)

(assert (=> b!212612 m!239919))

(declare-fun m!239921 () Bool)

(assert (=> b!212612 m!239921))

(declare-fun m!239923 () Bool)

(assert (=> b!212612 m!239923))

(declare-fun m!239925 () Bool)

(assert (=> b!212612 m!239925))

(assert (=> b!212612 m!239781))

(assert (=> b!212612 m!239923))

(assert (=> b!212612 m!239913))

(declare-fun m!239927 () Bool)

(assert (=> b!212612 m!239927))

(declare-fun m!239929 () Bool)

(assert (=> b!212612 m!239929))

(assert (=> b!212612 m!239917))

(declare-fun m!239931 () Bool)

(assert (=> b!212612 m!239931))

(declare-fun m!239933 () Bool)

(assert (=> b!212612 m!239933))

(declare-fun m!239935 () Bool)

(assert (=> b!212612 m!239935))

(declare-fun m!239937 () Bool)

(assert (=> b!212612 m!239937))

(declare-fun m!239939 () Bool)

(assert (=> b!212612 m!239939))

(declare-fun m!239941 () Bool)

(assert (=> b!212612 m!239941))

(assert (=> b!212612 m!239931))

(assert (=> b!212612 m!239877))

(assert (=> bm!20123 m!239781))

(assert (=> b!212620 m!239877))

(assert (=> b!212620 m!239877))

(assert (=> b!212620 m!239879))

(declare-fun m!239943 () Bool)

(assert (=> b!212603 m!239943))

(assert (=> b!212603 m!239877))

(declare-fun m!239945 () Bool)

(assert (=> b!212603 m!239945))

(assert (=> b!212603 m!239943))

(assert (=> b!212603 m!239887))

(declare-fun m!239947 () Bool)

(assert (=> b!212603 m!239947))

(assert (=> b!212603 m!239877))

(assert (=> b!212603 m!239887))

(declare-fun m!239949 () Bool)

(assert (=> bm!20124 m!239949))

(declare-fun m!239951 () Bool)

(assert (=> bm!20121 m!239951))

(declare-fun m!239953 () Bool)

(assert (=> b!212609 m!239953))

(declare-fun m!239955 () Bool)

(assert (=> b!212601 m!239955))

(assert (=> b!212602 m!239877))

(assert (=> b!212602 m!239877))

(assert (=> b!212602 m!239879))

(assert (=> b!212447 d!57991))

(declare-fun d!57993 () Bool)

(declare-fun e!138315 () Bool)

(assert (=> d!57993 e!138315))

(declare-fun res!103969 () Bool)

(assert (=> d!57993 (=> (not res!103969) (not e!138315))))

(declare-fun lt!109583 () ListLongMap!3079)

(assert (=> d!57993 (= res!103969 (contains!1391 lt!109583 (_1!2099 (tuple2!4177 k0!843 v!520))))))

(declare-fun lt!109580 () List!3086)

(assert (=> d!57993 (= lt!109583 (ListLongMap!3080 lt!109580))))

(declare-fun lt!109582 () Unit!6408)

(declare-fun lt!109581 () Unit!6408)

(assert (=> d!57993 (= lt!109582 lt!109581)))

(declare-datatypes ((Option!259 0))(
  ( (Some!258 (v!4783 V!6945)) (None!257) )
))
(declare-fun getValueByKey!253 (List!3086 (_ BitVec 64)) Option!259)

(assert (=> d!57993 (= (getValueByKey!253 lt!109580 (_1!2099 (tuple2!4177 k0!843 v!520))) (Some!258 (_2!2099 (tuple2!4177 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!143 (List!3086 (_ BitVec 64) V!6945) Unit!6408)

(assert (=> d!57993 (= lt!109581 (lemmaContainsTupThenGetReturnValue!143 lt!109580 (_1!2099 (tuple2!4177 k0!843 v!520)) (_2!2099 (tuple2!4177 k0!843 v!520))))))

(declare-fun insertStrictlySorted!146 (List!3086 (_ BitVec 64) V!6945) List!3086)

(assert (=> d!57993 (= lt!109580 (insertStrictlySorted!146 (toList!1555 lt!109436) (_1!2099 (tuple2!4177 k0!843 v!520)) (_2!2099 (tuple2!4177 k0!843 v!520))))))

(assert (=> d!57993 (= (+!579 lt!109436 (tuple2!4177 k0!843 v!520)) lt!109583)))

(declare-fun b!212625 () Bool)

(declare-fun res!103970 () Bool)

(assert (=> b!212625 (=> (not res!103970) (not e!138315))))

(assert (=> b!212625 (= res!103970 (= (getValueByKey!253 (toList!1555 lt!109583) (_1!2099 (tuple2!4177 k0!843 v!520))) (Some!258 (_2!2099 (tuple2!4177 k0!843 v!520)))))))

(declare-fun b!212626 () Bool)

(declare-fun contains!1392 (List!3086 tuple2!4176) Bool)

(assert (=> b!212626 (= e!138315 (contains!1392 (toList!1555 lt!109583) (tuple2!4177 k0!843 v!520)))))

(assert (= (and d!57993 res!103969) b!212625))

(assert (= (and b!212625 res!103970) b!212626))

(declare-fun m!239957 () Bool)

(assert (=> d!57993 m!239957))

(declare-fun m!239959 () Bool)

(assert (=> d!57993 m!239959))

(declare-fun m!239961 () Bool)

(assert (=> d!57993 m!239961))

(declare-fun m!239963 () Bool)

(assert (=> d!57993 m!239963))

(declare-fun m!239965 () Bool)

(assert (=> b!212625 m!239965))

(declare-fun m!239967 () Bool)

(assert (=> b!212626 m!239967))

(assert (=> b!212447 d!57993))

(declare-fun bm!20130 () Bool)

(declare-fun call!20133 () ListLongMap!3079)

(assert (=> bm!20130 (= call!20133 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212633 () Bool)

(declare-fun e!138321 () Bool)

(declare-fun call!20134 () ListLongMap!3079)

(assert (=> b!212633 (= e!138321 (= call!20134 call!20133))))

(declare-fun bm!20131 () Bool)

(assert (=> bm!20131 (= call!20134 (getCurrentListMapNoExtraKeys!503 _keys!825 (array!10138 (store (arr!4810 _values!649) i!601 (ValueCellFull!2393 v!520)) (size!5136 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!57995 () Bool)

(declare-fun e!138320 () Bool)

(assert (=> d!57995 e!138320))

(declare-fun res!103973 () Bool)

(assert (=> d!57995 (=> (not res!103973) (not e!138320))))

(assert (=> d!57995 (= res!103973 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5136 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5136 _values!649))))))))

(declare-fun lt!109586 () Unit!6408)

(declare-fun choose!1088 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6945 V!6945 (_ BitVec 32) (_ BitVec 64) V!6945 (_ BitVec 32) Int) Unit!6408)

(assert (=> d!57995 (= lt!109586 (choose!1088 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!57995 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!227 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!109586)))

(declare-fun b!212634 () Bool)

(assert (=> b!212634 (= e!138321 (= call!20134 (+!579 call!20133 (tuple2!4177 k0!843 v!520))))))

(declare-fun b!212635 () Bool)

(assert (=> b!212635 (= e!138320 e!138321)))

(declare-fun c!35834 () Bool)

(assert (=> b!212635 (= c!35834 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!57995 res!103973) b!212635))

(assert (= (and b!212635 c!35834) b!212634))

(assert (= (and b!212635 (not c!35834)) b!212633))

(assert (= (or b!212634 b!212633) bm!20131))

(assert (= (or b!212634 b!212633) bm!20130))

(assert (=> bm!20130 m!239789))

(assert (=> bm!20131 m!239783))

(declare-fun m!239969 () Bool)

(assert (=> bm!20131 m!239969))

(declare-fun m!239971 () Bool)

(assert (=> d!57995 m!239971))

(declare-fun m!239973 () Bool)

(assert (=> b!212634 m!239973))

(assert (=> b!212447 d!57995))

(declare-fun b!212636 () Bool)

(declare-fun res!103974 () Bool)

(declare-fun e!138329 () Bool)

(assert (=> b!212636 (=> (not res!103974) (not e!138329))))

(declare-fun e!138325 () Bool)

(assert (=> b!212636 (= res!103974 e!138325)))

(declare-fun res!103981 () Bool)

(assert (=> b!212636 (=> res!103981 e!138325)))

(declare-fun e!138326 () Bool)

(assert (=> b!212636 (= res!103981 (not e!138326))))

(declare-fun res!103979 () Bool)

(assert (=> b!212636 (=> (not res!103979) (not e!138326))))

(assert (=> b!212636 (= res!103979 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun bm!20132 () Bool)

(declare-fun call!20141 () ListLongMap!3079)

(declare-fun call!20140 () ListLongMap!3079)

(assert (=> bm!20132 (= call!20141 call!20140)))

(declare-fun b!212637 () Bool)

(declare-fun e!138322 () Bool)

(declare-fun lt!109605 () ListLongMap!3079)

(assert (=> b!212637 (= e!138322 (= (apply!197 lt!109605 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20133 () Bool)

(declare-fun call!20138 () ListLongMap!3079)

(declare-fun call!20137 () ListLongMap!3079)

(assert (=> bm!20133 (= call!20138 call!20137)))

(declare-fun bm!20134 () Bool)

(declare-fun c!35837 () Bool)

(declare-fun call!20139 () ListLongMap!3079)

(declare-fun c!35840 () Bool)

(assert (=> bm!20134 (= call!20137 (+!579 (ite c!35837 call!20140 (ite c!35840 call!20141 call!20139)) (ite (or c!35837 c!35840) (tuple2!4177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212638 () Bool)

(assert (=> b!212638 (= e!138326 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!138332 () Bool)

(declare-fun b!212639 () Bool)

(assert (=> b!212639 (= e!138332 (= (apply!197 lt!109605 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4810 _values!649) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5136 _values!649)))))

(assert (=> b!212639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212640 () Bool)

(declare-fun e!138328 () Bool)

(declare-fun e!138331 () Bool)

(assert (=> b!212640 (= e!138328 e!138331)))

(declare-fun res!103976 () Bool)

(declare-fun call!20136 () Bool)

(assert (=> b!212640 (= res!103976 call!20136)))

(assert (=> b!212640 (=> (not res!103976) (not e!138331))))

(declare-fun bm!20135 () Bool)

(assert (=> bm!20135 (= call!20139 call!20141)))

(declare-fun b!212641 () Bool)

(assert (=> b!212641 (= e!138328 (not call!20136))))

(declare-fun b!212642 () Bool)

(assert (=> b!212642 (= e!138325 e!138332)))

(declare-fun res!103978 () Bool)

(assert (=> b!212642 (=> (not res!103978) (not e!138332))))

(assert (=> b!212642 (= res!103978 (contains!1391 lt!109605 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212643 () Bool)

(declare-fun e!138330 () Bool)

(assert (=> b!212643 (= e!138330 e!138322)))

(declare-fun res!103982 () Bool)

(declare-fun call!20135 () Bool)

(assert (=> b!212643 (= res!103982 call!20135)))

(assert (=> b!212643 (=> (not res!103982) (not e!138322))))

(declare-fun bm!20136 () Bool)

(assert (=> bm!20136 (= call!20140 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212644 () Bool)

(declare-fun e!138324 () Unit!6408)

(declare-fun Unit!6413 () Unit!6408)

(assert (=> b!212644 (= e!138324 Unit!6413)))

(declare-fun b!212645 () Bool)

(declare-fun e!138323 () ListLongMap!3079)

(assert (=> b!212645 (= e!138323 (+!579 call!20137 (tuple2!4177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20137 () Bool)

(assert (=> bm!20137 (= call!20136 (contains!1391 lt!109605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20138 () Bool)

(assert (=> bm!20138 (= call!20135 (contains!1391 lt!109605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!212646 () Bool)

(declare-fun e!138327 () ListLongMap!3079)

(assert (=> b!212646 (= e!138327 call!20138)))

(declare-fun b!212647 () Bool)

(assert (=> b!212647 (= e!138329 e!138328)))

(declare-fun c!35835 () Bool)

(assert (=> b!212647 (= c!35835 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212648 () Bool)

(declare-fun lt!109598 () Unit!6408)

(assert (=> b!212648 (= e!138324 lt!109598)))

(declare-fun lt!109596 () ListLongMap!3079)

(assert (=> b!212648 (= lt!109596 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109597 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109597 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109601 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109601 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109603 () Unit!6408)

(assert (=> b!212648 (= lt!109603 (addStillContains!173 lt!109596 lt!109597 zeroValue!615 lt!109601))))

(assert (=> b!212648 (contains!1391 (+!579 lt!109596 (tuple2!4177 lt!109597 zeroValue!615)) lt!109601)))

(declare-fun lt!109587 () Unit!6408)

(assert (=> b!212648 (= lt!109587 lt!109603)))

(declare-fun lt!109600 () ListLongMap!3079)

(assert (=> b!212648 (= lt!109600 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109590 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109590 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109595 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109595 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109606 () Unit!6408)

(assert (=> b!212648 (= lt!109606 (addApplyDifferent!173 lt!109600 lt!109590 minValue!615 lt!109595))))

(assert (=> b!212648 (= (apply!197 (+!579 lt!109600 (tuple2!4177 lt!109590 minValue!615)) lt!109595) (apply!197 lt!109600 lt!109595))))

(declare-fun lt!109607 () Unit!6408)

(assert (=> b!212648 (= lt!109607 lt!109606)))

(declare-fun lt!109604 () ListLongMap!3079)

(assert (=> b!212648 (= lt!109604 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109599 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109602 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109602 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109589 () Unit!6408)

(assert (=> b!212648 (= lt!109589 (addApplyDifferent!173 lt!109604 lt!109599 zeroValue!615 lt!109602))))

(assert (=> b!212648 (= (apply!197 (+!579 lt!109604 (tuple2!4177 lt!109599 zeroValue!615)) lt!109602) (apply!197 lt!109604 lt!109602))))

(declare-fun lt!109608 () Unit!6408)

(assert (=> b!212648 (= lt!109608 lt!109589)))

(declare-fun lt!109593 () ListLongMap!3079)

(assert (=> b!212648 (= lt!109593 (getCurrentListMapNoExtraKeys!503 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109591 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109594 () (_ BitVec 64))

(assert (=> b!212648 (= lt!109594 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212648 (= lt!109598 (addApplyDifferent!173 lt!109593 lt!109591 minValue!615 lt!109594))))

(assert (=> b!212648 (= (apply!197 (+!579 lt!109593 (tuple2!4177 lt!109591 minValue!615)) lt!109594) (apply!197 lt!109593 lt!109594))))

(declare-fun b!212649 () Bool)

(declare-fun res!103977 () Bool)

(assert (=> b!212649 (=> (not res!103977) (not e!138329))))

(assert (=> b!212649 (= res!103977 e!138330)))

(declare-fun c!35839 () Bool)

(assert (=> b!212649 (= c!35839 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!212650 () Bool)

(declare-fun e!138334 () ListLongMap!3079)

(assert (=> b!212650 (= e!138334 call!20139)))

(declare-fun b!212651 () Bool)

(assert (=> b!212651 (= e!138334 call!20138)))

(declare-fun b!212652 () Bool)

(assert (=> b!212652 (= e!138330 (not call!20135))))

(declare-fun b!212653 () Bool)

(declare-fun c!35838 () Bool)

(assert (=> b!212653 (= c!35838 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!212653 (= e!138327 e!138334)))

(declare-fun b!212654 () Bool)

(assert (=> b!212654 (= e!138331 (= (apply!197 lt!109605 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun d!57997 () Bool)

(assert (=> d!57997 e!138329))

(declare-fun res!103975 () Bool)

(assert (=> d!57997 (=> (not res!103975) (not e!138329))))

(assert (=> d!57997 (= res!103975 (or (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))))

(declare-fun lt!109592 () ListLongMap!3079)

(assert (=> d!57997 (= lt!109605 lt!109592)))

(declare-fun lt!109588 () Unit!6408)

(assert (=> d!57997 (= lt!109588 e!138324)))

(declare-fun c!35836 () Bool)

(declare-fun e!138333 () Bool)

(assert (=> d!57997 (= c!35836 e!138333)))

(declare-fun res!103980 () Bool)

(assert (=> d!57997 (=> (not res!103980) (not e!138333))))

(assert (=> d!57997 (= res!103980 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!57997 (= lt!109592 e!138323)))

(assert (=> d!57997 (= c!35837 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57997 (validMask!0 mask!1149)))

(assert (=> d!57997 (= (getCurrentListMap!1066 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109605)))

(declare-fun b!212655 () Bool)

(assert (=> b!212655 (= e!138323 e!138327)))

(assert (=> b!212655 (= c!35840 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!212656 () Bool)

(assert (=> b!212656 (= e!138333 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57997 c!35837) b!212645))

(assert (= (and d!57997 (not c!35837)) b!212655))

(assert (= (and b!212655 c!35840) b!212646))

(assert (= (and b!212655 (not c!35840)) b!212653))

(assert (= (and b!212653 c!35838) b!212651))

(assert (= (and b!212653 (not c!35838)) b!212650))

(assert (= (or b!212651 b!212650) bm!20135))

(assert (= (or b!212646 bm!20135) bm!20132))

(assert (= (or b!212646 b!212651) bm!20133))

(assert (= (or b!212645 bm!20132) bm!20136))

(assert (= (or b!212645 bm!20133) bm!20134))

(assert (= (and d!57997 res!103980) b!212656))

(assert (= (and d!57997 c!35836) b!212648))

(assert (= (and d!57997 (not c!35836)) b!212644))

(assert (= (and d!57997 res!103975) b!212636))

(assert (= (and b!212636 res!103979) b!212638))

(assert (= (and b!212636 (not res!103981)) b!212642))

(assert (= (and b!212642 res!103978) b!212639))

(assert (= (and b!212636 res!103974) b!212649))

(assert (= (and b!212649 c!35839) b!212643))

(assert (= (and b!212649 (not c!35839)) b!212652))

(assert (= (and b!212643 res!103982) b!212637))

(assert (= (or b!212643 b!212652) bm!20138))

(assert (= (and b!212649 res!103977) b!212647))

(assert (= (and b!212647 c!35835) b!212640))

(assert (= (and b!212647 (not c!35835)) b!212641))

(assert (= (and b!212640 res!103976) b!212654))

(assert (= (or b!212640 b!212641) bm!20137))

(declare-fun b_lambda!7719 () Bool)

(assert (=> (not b_lambda!7719) (not b!212639)))

(assert (=> b!212639 t!8028))

(declare-fun b_and!12439 () Bool)

(assert (= b_and!12437 (and (=> t!8028 result!5001) b_and!12439)))

(assert (=> b!212642 m!239877))

(assert (=> b!212642 m!239877))

(declare-fun m!239975 () Bool)

(assert (=> b!212642 m!239975))

(declare-fun m!239977 () Bool)

(assert (=> bm!20138 m!239977))

(assert (=> d!57997 m!239769))

(declare-fun m!239979 () Bool)

(assert (=> b!212654 m!239979))

(declare-fun m!239981 () Bool)

(assert (=> b!212648 m!239981))

(declare-fun m!239983 () Bool)

(assert (=> b!212648 m!239983))

(declare-fun m!239985 () Bool)

(assert (=> b!212648 m!239985))

(declare-fun m!239987 () Bool)

(assert (=> b!212648 m!239987))

(declare-fun m!239989 () Bool)

(assert (=> b!212648 m!239989))

(declare-fun m!239991 () Bool)

(assert (=> b!212648 m!239991))

(declare-fun m!239993 () Bool)

(assert (=> b!212648 m!239993))

(assert (=> b!212648 m!239789))

(assert (=> b!212648 m!239991))

(assert (=> b!212648 m!239981))

(declare-fun m!239995 () Bool)

(assert (=> b!212648 m!239995))

(declare-fun m!239997 () Bool)

(assert (=> b!212648 m!239997))

(assert (=> b!212648 m!239985))

(declare-fun m!239999 () Bool)

(assert (=> b!212648 m!239999))

(declare-fun m!240001 () Bool)

(assert (=> b!212648 m!240001))

(declare-fun m!240003 () Bool)

(assert (=> b!212648 m!240003))

(declare-fun m!240005 () Bool)

(assert (=> b!212648 m!240005))

(declare-fun m!240007 () Bool)

(assert (=> b!212648 m!240007))

(declare-fun m!240009 () Bool)

(assert (=> b!212648 m!240009))

(assert (=> b!212648 m!239999))

(assert (=> b!212648 m!239877))

(assert (=> bm!20136 m!239789))

(assert (=> b!212656 m!239877))

(assert (=> b!212656 m!239877))

(assert (=> b!212656 m!239879))

(assert (=> b!212639 m!239885))

(assert (=> b!212639 m!239877))

(declare-fun m!240011 () Bool)

(assert (=> b!212639 m!240011))

(assert (=> b!212639 m!239885))

(assert (=> b!212639 m!239887))

(assert (=> b!212639 m!239889))

(assert (=> b!212639 m!239877))

(assert (=> b!212639 m!239887))

(declare-fun m!240013 () Bool)

(assert (=> bm!20137 m!240013))

(declare-fun m!240015 () Bool)

(assert (=> bm!20134 m!240015))

(declare-fun m!240017 () Bool)

(assert (=> b!212645 m!240017))

(declare-fun m!240019 () Bool)

(assert (=> b!212637 m!240019))

(assert (=> b!212638 m!239877))

(assert (=> b!212638 m!239877))

(assert (=> b!212638 m!239879))

(assert (=> b!212447 d!57997))

(declare-fun b!212657 () Bool)

(declare-fun e!138340 () Bool)

(assert (=> b!212657 (= e!138340 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212657 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!212658 () Bool)

(declare-fun e!138338 () ListLongMap!3079)

(declare-fun e!138335 () ListLongMap!3079)

(assert (=> b!212658 (= e!138338 e!138335)))

(declare-fun c!35841 () Bool)

(assert (=> b!212658 (= c!35841 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun call!20142 () ListLongMap!3079)

(declare-fun bm!20139 () Bool)

(assert (=> bm!20139 (= call!20142 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun e!138339 () Bool)

(declare-fun b!212659 () Bool)

(declare-fun lt!109612 () ListLongMap!3079)

(assert (=> b!212659 (= e!138339 (= lt!109612 (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!212660 () Bool)

(assert (=> b!212660 (= e!138335 call!20142)))

(declare-fun b!212662 () Bool)

(declare-fun e!138341 () Bool)

(assert (=> b!212662 (= e!138341 e!138339)))

(declare-fun c!35842 () Bool)

(assert (=> b!212662 (= c!35842 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212663 () Bool)

(declare-fun e!138336 () Bool)

(assert (=> b!212663 (= e!138341 e!138336)))

(assert (=> b!212663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun res!103983 () Bool)

(assert (=> b!212663 (= res!103983 (contains!1391 lt!109612 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!212663 (=> (not res!103983) (not e!138336))))

(declare-fun b!212664 () Bool)

(declare-fun lt!109615 () Unit!6408)

(declare-fun lt!109611 () Unit!6408)

(assert (=> b!212664 (= lt!109615 lt!109611)))

(declare-fun lt!109610 () (_ BitVec 64))

(declare-fun lt!109614 () V!6945)

(declare-fun lt!109613 () (_ BitVec 64))

(declare-fun lt!109609 () ListLongMap!3079)

(assert (=> b!212664 (not (contains!1391 (+!579 lt!109609 (tuple2!4177 lt!109610 lt!109614)) lt!109613))))

(assert (=> b!212664 (= lt!109611 (addStillNotContains!107 lt!109609 lt!109610 lt!109614 lt!109613))))

(assert (=> b!212664 (= lt!109613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!212664 (= lt!109614 (get!2571 (select (arr!4810 lt!109435) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212664 (= lt!109610 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!212664 (= lt!109609 call!20142)))

(assert (=> b!212664 (= e!138335 (+!579 call!20142 (tuple2!4177 (select (arr!4811 _keys!825) #b00000000000000000000000000000000) (get!2571 (select (arr!4810 lt!109435) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!212665 () Bool)

(assert (=> b!212665 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> b!212665 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5136 lt!109435)))))

(assert (=> b!212665 (= e!138336 (= (apply!197 lt!109612 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)) (get!2571 (select (arr!4810 lt!109435) #b00000000000000000000000000000000) (dynLambda!531 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!212666 () Bool)

(assert (=> b!212666 (= e!138339 (isEmpty!502 lt!109612))))

(declare-fun b!212661 () Bool)

(declare-fun res!103986 () Bool)

(declare-fun e!138337 () Bool)

(assert (=> b!212661 (=> (not res!103986) (not e!138337))))

(assert (=> b!212661 (= res!103986 (not (contains!1391 lt!109612 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57999 () Bool)

(assert (=> d!57999 e!138337))

(declare-fun res!103984 () Bool)

(assert (=> d!57999 (=> (not res!103984) (not e!138337))))

(assert (=> d!57999 (= res!103984 (not (contains!1391 lt!109612 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57999 (= lt!109612 e!138338)))

(declare-fun c!35844 () Bool)

(assert (=> d!57999 (= c!35844 (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!57999 (validMask!0 mask!1149)))

(assert (=> d!57999 (= (getCurrentListMapNoExtraKeys!503 _keys!825 lt!109435 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!109612)))

(declare-fun b!212667 () Bool)

(assert (=> b!212667 (= e!138337 e!138341)))

(declare-fun c!35843 () Bool)

(assert (=> b!212667 (= c!35843 e!138340)))

(declare-fun res!103985 () Bool)

(assert (=> b!212667 (=> (not res!103985) (not e!138340))))

(assert (=> b!212667 (= res!103985 (bvslt #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(declare-fun b!212668 () Bool)

(assert (=> b!212668 (= e!138338 (ListLongMap!3080 Nil!3083))))

(assert (= (and d!57999 c!35844) b!212668))

(assert (= (and d!57999 (not c!35844)) b!212658))

(assert (= (and b!212658 c!35841) b!212664))

(assert (= (and b!212658 (not c!35841)) b!212660))

(assert (= (or b!212664 b!212660) bm!20139))

(assert (= (and d!57999 res!103984) b!212661))

(assert (= (and b!212661 res!103986) b!212667))

(assert (= (and b!212667 res!103985) b!212657))

(assert (= (and b!212667 c!35843) b!212663))

(assert (= (and b!212667 (not c!35843)) b!212662))

(assert (= (and b!212663 res!103983) b!212665))

(assert (= (and b!212662 c!35842) b!212659))

(assert (= (and b!212662 (not c!35842)) b!212666))

(declare-fun b_lambda!7721 () Bool)

(assert (=> (not b_lambda!7721) (not b!212664)))

(assert (=> b!212664 t!8028))

(declare-fun b_and!12441 () Bool)

(assert (= b_and!12439 (and (=> t!8028 result!5001) b_and!12441)))

(declare-fun b_lambda!7723 () Bool)

(assert (=> (not b_lambda!7723) (not b!212665)))

(assert (=> b!212665 t!8028))

(declare-fun b_and!12443 () Bool)

(assert (= b_and!12441 (and (=> t!8028 result!5001) b_and!12443)))

(assert (=> b!212657 m!239877))

(assert (=> b!212657 m!239877))

(assert (=> b!212657 m!239879))

(declare-fun m!240021 () Bool)

(assert (=> b!212661 m!240021))

(assert (=> b!212658 m!239877))

(assert (=> b!212658 m!239877))

(assert (=> b!212658 m!239879))

(declare-fun m!240023 () Bool)

(assert (=> b!212666 m!240023))

(assert (=> b!212664 m!239943))

(assert (=> b!212664 m!239887))

(assert (=> b!212664 m!239947))

(declare-fun m!240025 () Bool)

(assert (=> b!212664 m!240025))

(declare-fun m!240027 () Bool)

(assert (=> b!212664 m!240027))

(assert (=> b!212664 m!239943))

(assert (=> b!212664 m!239887))

(assert (=> b!212664 m!239877))

(assert (=> b!212664 m!240027))

(declare-fun m!240029 () Bool)

(assert (=> b!212664 m!240029))

(declare-fun m!240031 () Bool)

(assert (=> b!212664 m!240031))

(declare-fun m!240033 () Bool)

(assert (=> b!212659 m!240033))

(assert (=> bm!20139 m!240033))

(declare-fun m!240035 () Bool)

(assert (=> d!57999 m!240035))

(assert (=> d!57999 m!239769))

(assert (=> b!212663 m!239877))

(assert (=> b!212663 m!239877))

(declare-fun m!240037 () Bool)

(assert (=> b!212663 m!240037))

(assert (=> b!212665 m!239943))

(assert (=> b!212665 m!239887))

(assert (=> b!212665 m!239947))

(assert (=> b!212665 m!239943))

(assert (=> b!212665 m!239887))

(assert (=> b!212665 m!239877))

(declare-fun m!240039 () Bool)

(assert (=> b!212665 m!240039))

(assert (=> b!212665 m!239877))

(assert (=> b!212447 d!57999))

(declare-fun d!58001 () Bool)

(declare-fun e!138342 () Bool)

(assert (=> d!58001 e!138342))

(declare-fun res!103987 () Bool)

(assert (=> d!58001 (=> (not res!103987) (not e!138342))))

(declare-fun lt!109619 () ListLongMap!3079)

(assert (=> d!58001 (= res!103987 (contains!1391 lt!109619 (_1!2099 lt!109431)))))

(declare-fun lt!109616 () List!3086)

(assert (=> d!58001 (= lt!109619 (ListLongMap!3080 lt!109616))))

(declare-fun lt!109618 () Unit!6408)

(declare-fun lt!109617 () Unit!6408)

(assert (=> d!58001 (= lt!109618 lt!109617)))

(assert (=> d!58001 (= (getValueByKey!253 lt!109616 (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431)))))

(assert (=> d!58001 (= lt!109617 (lemmaContainsTupThenGetReturnValue!143 lt!109616 (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58001 (= lt!109616 (insertStrictlySorted!146 (toList!1555 lt!109436) (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58001 (= (+!579 lt!109436 lt!109431) lt!109619)))

(declare-fun b!212669 () Bool)

(declare-fun res!103988 () Bool)

(assert (=> b!212669 (=> (not res!103988) (not e!138342))))

(assert (=> b!212669 (= res!103988 (= (getValueByKey!253 (toList!1555 lt!109619) (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431))))))

(declare-fun b!212670 () Bool)

(assert (=> b!212670 (= e!138342 (contains!1392 (toList!1555 lt!109619) lt!109431))))

(assert (= (and d!58001 res!103987) b!212669))

(assert (= (and b!212669 res!103988) b!212670))

(declare-fun m!240041 () Bool)

(assert (=> d!58001 m!240041))

(declare-fun m!240043 () Bool)

(assert (=> d!58001 m!240043))

(declare-fun m!240045 () Bool)

(assert (=> d!58001 m!240045))

(declare-fun m!240047 () Bool)

(assert (=> d!58001 m!240047))

(declare-fun m!240049 () Bool)

(assert (=> b!212669 m!240049))

(declare-fun m!240051 () Bool)

(assert (=> b!212670 m!240051))

(assert (=> b!212446 d!58001))

(declare-fun d!58003 () Bool)

(declare-fun e!138343 () Bool)

(assert (=> d!58003 e!138343))

(declare-fun res!103989 () Bool)

(assert (=> d!58003 (=> (not res!103989) (not e!138343))))

(declare-fun lt!109623 () ListLongMap!3079)

(assert (=> d!58003 (= res!103989 (contains!1391 lt!109623 (_1!2099 lt!109431)))))

(declare-fun lt!109620 () List!3086)

(assert (=> d!58003 (= lt!109623 (ListLongMap!3080 lt!109620))))

(declare-fun lt!109622 () Unit!6408)

(declare-fun lt!109621 () Unit!6408)

(assert (=> d!58003 (= lt!109622 lt!109621)))

(assert (=> d!58003 (= (getValueByKey!253 lt!109620 (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431)))))

(assert (=> d!58003 (= lt!109621 (lemmaContainsTupThenGetReturnValue!143 lt!109620 (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58003 (= lt!109620 (insertStrictlySorted!146 (toList!1555 lt!109434) (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58003 (= (+!579 lt!109434 lt!109431) lt!109623)))

(declare-fun b!212671 () Bool)

(declare-fun res!103990 () Bool)

(assert (=> b!212671 (=> (not res!103990) (not e!138343))))

(assert (=> b!212671 (= res!103990 (= (getValueByKey!253 (toList!1555 lt!109623) (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431))))))

(declare-fun b!212672 () Bool)

(assert (=> b!212672 (= e!138343 (contains!1392 (toList!1555 lt!109623) lt!109431))))

(assert (= (and d!58003 res!103989) b!212671))

(assert (= (and b!212671 res!103990) b!212672))

(declare-fun m!240053 () Bool)

(assert (=> d!58003 m!240053))

(declare-fun m!240055 () Bool)

(assert (=> d!58003 m!240055))

(declare-fun m!240057 () Bool)

(assert (=> d!58003 m!240057))

(declare-fun m!240059 () Bool)

(assert (=> d!58003 m!240059))

(declare-fun m!240061 () Bool)

(assert (=> b!212671 m!240061))

(declare-fun m!240063 () Bool)

(assert (=> b!212672 m!240063))

(assert (=> b!212446 d!58003))

(declare-fun d!58005 () Bool)

(assert (=> d!58005 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21124 d!58005))

(declare-fun d!58007 () Bool)

(assert (=> d!58007 (= (array_inv!3159 _values!649) (bvsge (size!5136 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21124 d!58007))

(declare-fun d!58009 () Bool)

(assert (=> d!58009 (= (array_inv!3160 _keys!825) (bvsge (size!5137 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21124 d!58009))

(declare-fun d!58011 () Bool)

(assert (=> d!58011 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!212438 d!58011))

(declare-fun d!58013 () Bool)

(declare-fun e!138344 () Bool)

(assert (=> d!58013 e!138344))

(declare-fun res!103991 () Bool)

(assert (=> d!58013 (=> (not res!103991) (not e!138344))))

(declare-fun lt!109627 () ListLongMap!3079)

(assert (=> d!58013 (= res!103991 (contains!1391 lt!109627 (_1!2099 lt!109431)))))

(declare-fun lt!109624 () List!3086)

(assert (=> d!58013 (= lt!109627 (ListLongMap!3080 lt!109624))))

(declare-fun lt!109626 () Unit!6408)

(declare-fun lt!109625 () Unit!6408)

(assert (=> d!58013 (= lt!109626 lt!109625)))

(assert (=> d!58013 (= (getValueByKey!253 lt!109624 (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431)))))

(assert (=> d!58013 (= lt!109625 (lemmaContainsTupThenGetReturnValue!143 lt!109624 (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58013 (= lt!109624 (insertStrictlySorted!146 (toList!1555 lt!109429) (_1!2099 lt!109431) (_2!2099 lt!109431)))))

(assert (=> d!58013 (= (+!579 lt!109429 lt!109431) lt!109627)))

(declare-fun b!212673 () Bool)

(declare-fun res!103992 () Bool)

(assert (=> b!212673 (=> (not res!103992) (not e!138344))))

(assert (=> b!212673 (= res!103992 (= (getValueByKey!253 (toList!1555 lt!109627) (_1!2099 lt!109431)) (Some!258 (_2!2099 lt!109431))))))

(declare-fun b!212674 () Bool)

(assert (=> b!212674 (= e!138344 (contains!1392 (toList!1555 lt!109627) lt!109431))))

(assert (= (and d!58013 res!103991) b!212673))

(assert (= (and b!212673 res!103992) b!212674))

(declare-fun m!240065 () Bool)

(assert (=> d!58013 m!240065))

(declare-fun m!240067 () Bool)

(assert (=> d!58013 m!240067))

(declare-fun m!240069 () Bool)

(assert (=> d!58013 m!240069))

(declare-fun m!240071 () Bool)

(assert (=> d!58013 m!240071))

(declare-fun m!240073 () Bool)

(assert (=> b!212673 m!240073))

(declare-fun m!240075 () Bool)

(assert (=> b!212674 m!240075))

(assert (=> b!212443 d!58013))

(declare-fun b!212683 () Bool)

(declare-fun e!138352 () Bool)

(declare-fun e!138353 () Bool)

(assert (=> b!212683 (= e!138352 e!138353)))

(declare-fun lt!109635 () (_ BitVec 64))

(assert (=> b!212683 (= lt!109635 (select (arr!4811 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!109636 () Unit!6408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10139 (_ BitVec 64) (_ BitVec 32)) Unit!6408)

(assert (=> b!212683 (= lt!109636 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!109635 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!212683 (arrayContainsKey!0 _keys!825 lt!109635 #b00000000000000000000000000000000)))

(declare-fun lt!109634 () Unit!6408)

(assert (=> b!212683 (= lt!109634 lt!109636)))

(declare-fun res!103998 () Bool)

(declare-datatypes ((SeekEntryResult!713 0))(
  ( (MissingZero!713 (index!5022 (_ BitVec 32))) (Found!713 (index!5023 (_ BitVec 32))) (Intermediate!713 (undefined!1525 Bool) (index!5024 (_ BitVec 32)) (x!22190 (_ BitVec 32))) (Undefined!713) (MissingVacant!713 (index!5025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10139 (_ BitVec 32)) SeekEntryResult!713)

(assert (=> b!212683 (= res!103998 (= (seekEntryOrOpen!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!713 #b00000000000000000000000000000000)))))

(assert (=> b!212683 (=> (not res!103998) (not e!138353))))

(declare-fun bm!20142 () Bool)

(declare-fun call!20145 () Bool)

(assert (=> bm!20142 (= call!20145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!58015 () Bool)

(declare-fun res!103997 () Bool)

(declare-fun e!138351 () Bool)

(assert (=> d!58015 (=> res!103997 e!138351)))

(assert (=> d!58015 (= res!103997 (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!58015 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138351)))

(declare-fun b!212684 () Bool)

(assert (=> b!212684 (= e!138352 call!20145)))

(declare-fun b!212685 () Bool)

(assert (=> b!212685 (= e!138351 e!138352)))

(declare-fun c!35847 () Bool)

(assert (=> b!212685 (= c!35847 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212686 () Bool)

(assert (=> b!212686 (= e!138353 call!20145)))

(assert (= (and d!58015 (not res!103997)) b!212685))

(assert (= (and b!212685 c!35847) b!212683))

(assert (= (and b!212685 (not c!35847)) b!212684))

(assert (= (and b!212683 res!103998) b!212686))

(assert (= (or b!212686 b!212684) bm!20142))

(assert (=> b!212683 m!239877))

(declare-fun m!240077 () Bool)

(assert (=> b!212683 m!240077))

(declare-fun m!240079 () Bool)

(assert (=> b!212683 m!240079))

(assert (=> b!212683 m!239877))

(declare-fun m!240081 () Bool)

(assert (=> b!212683 m!240081))

(declare-fun m!240083 () Bool)

(assert (=> bm!20142 m!240083))

(assert (=> b!212685 m!239877))

(assert (=> b!212685 m!239877))

(assert (=> b!212685 m!239879))

(assert (=> b!212441 d!58015))

(declare-fun b!212697 () Bool)

(declare-fun e!138363 () Bool)

(declare-fun e!138362 () Bool)

(assert (=> b!212697 (= e!138363 e!138362)))

(declare-fun c!35850 () Bool)

(assert (=> b!212697 (= c!35850 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20145 () Bool)

(declare-fun call!20148 () Bool)

(assert (=> bm!20145 (= call!20148 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35850 (Cons!3081 (select (arr!4811 _keys!825) #b00000000000000000000000000000000) Nil!3082) Nil!3082)))))

(declare-fun b!212698 () Bool)

(assert (=> b!212698 (= e!138362 call!20148)))

(declare-fun b!212699 () Bool)

(declare-fun e!138364 () Bool)

(declare-fun contains!1393 (List!3085 (_ BitVec 64)) Bool)

(assert (=> b!212699 (= e!138364 (contains!1393 Nil!3082 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!212701 () Bool)

(assert (=> b!212701 (= e!138362 call!20148)))

(declare-fun d!58017 () Bool)

(declare-fun res!104006 () Bool)

(declare-fun e!138365 () Bool)

(assert (=> d!58017 (=> res!104006 e!138365)))

(assert (=> d!58017 (= res!104006 (bvsge #b00000000000000000000000000000000 (size!5137 _keys!825)))))

(assert (=> d!58017 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3082) e!138365)))

(declare-fun b!212700 () Bool)

(assert (=> b!212700 (= e!138365 e!138363)))

(declare-fun res!104007 () Bool)

(assert (=> b!212700 (=> (not res!104007) (not e!138363))))

(assert (=> b!212700 (= res!104007 (not e!138364))))

(declare-fun res!104005 () Bool)

(assert (=> b!212700 (=> (not res!104005) (not e!138364))))

(assert (=> b!212700 (= res!104005 (validKeyInArray!0 (select (arr!4811 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58017 (not res!104006)) b!212700))

(assert (= (and b!212700 res!104005) b!212699))

(assert (= (and b!212700 res!104007) b!212697))

(assert (= (and b!212697 c!35850) b!212701))

(assert (= (and b!212697 (not c!35850)) b!212698))

(assert (= (or b!212701 b!212698) bm!20145))

(assert (=> b!212697 m!239877))

(assert (=> b!212697 m!239877))

(assert (=> b!212697 m!239879))

(assert (=> bm!20145 m!239877))

(declare-fun m!240085 () Bool)

(assert (=> bm!20145 m!240085))

(assert (=> b!212699 m!239877))

(assert (=> b!212699 m!239877))

(declare-fun m!240087 () Bool)

(assert (=> b!212699 m!240087))

(assert (=> b!212700 m!239877))

(assert (=> b!212700 m!239877))

(assert (=> b!212700 m!239879))

(assert (=> b!212440 d!58017))

(declare-fun b!212709 () Bool)

(declare-fun e!138371 () Bool)

(assert (=> b!212709 (= e!138371 tp_is_empty!5473)))

(declare-fun b!212708 () Bool)

(declare-fun e!138370 () Bool)

(assert (=> b!212708 (= e!138370 tp_is_empty!5473)))

(declare-fun mapNonEmpty!9311 () Bool)

(declare-fun mapRes!9311 () Bool)

(declare-fun tp!19913 () Bool)

(assert (=> mapNonEmpty!9311 (= mapRes!9311 (and tp!19913 e!138370))))

(declare-fun mapKey!9311 () (_ BitVec 32))

(declare-fun mapRest!9311 () (Array (_ BitVec 32) ValueCell!2393))

(declare-fun mapValue!9311 () ValueCell!2393)

(assert (=> mapNonEmpty!9311 (= mapRest!9302 (store mapRest!9311 mapKey!9311 mapValue!9311))))

(declare-fun mapIsEmpty!9311 () Bool)

(assert (=> mapIsEmpty!9311 mapRes!9311))

(declare-fun condMapEmpty!9311 () Bool)

(declare-fun mapDefault!9311 () ValueCell!2393)

(assert (=> mapNonEmpty!9302 (= condMapEmpty!9311 (= mapRest!9302 ((as const (Array (_ BitVec 32) ValueCell!2393)) mapDefault!9311)))))

(assert (=> mapNonEmpty!9302 (= tp!19897 (and e!138371 mapRes!9311))))

(assert (= (and mapNonEmpty!9302 condMapEmpty!9311) mapIsEmpty!9311))

(assert (= (and mapNonEmpty!9302 (not condMapEmpty!9311)) mapNonEmpty!9311))

(assert (= (and mapNonEmpty!9311 ((_ is ValueCellFull!2393) mapValue!9311)) b!212708))

(assert (= (and mapNonEmpty!9302 ((_ is ValueCellFull!2393) mapDefault!9311)) b!212709))

(declare-fun m!240089 () Bool)

(assert (=> mapNonEmpty!9311 m!240089))

(declare-fun b_lambda!7725 () Bool)

(assert (= b_lambda!7721 (or (and start!21124 b_free!5611) b_lambda!7725)))

(declare-fun b_lambda!7727 () Bool)

(assert (= b_lambda!7713 (or (and start!21124 b_free!5611) b_lambda!7727)))

(declare-fun b_lambda!7729 () Bool)

(assert (= b_lambda!7719 (or (and start!21124 b_free!5611) b_lambda!7729)))

(declare-fun b_lambda!7731 () Bool)

(assert (= b_lambda!7723 (or (and start!21124 b_free!5611) b_lambda!7731)))

(declare-fun b_lambda!7733 () Bool)

(assert (= b_lambda!7715 (or (and start!21124 b_free!5611) b_lambda!7733)))

(declare-fun b_lambda!7735 () Bool)

(assert (= b_lambda!7717 (or (and start!21124 b_free!5611) b_lambda!7735)))

(check-sat (not d!57989) (not bm!20124) (not b!212683) (not b!212626) (not b!212666) (not b!212672) (not b!212638) (not d!58001) (not b!212665) (not bm!20134) (not b!212659) (not b!212602) (not bm!20123) (not b!212603) (not b!212685) (not b!212612) (not b!212639) (not d!57993) (not mapNonEmpty!9311) (not b!212544) (not b!212656) (not bm!20142) (not b_lambda!7735) (not b_lambda!7727) (not b!212671) (not bm!20145) (not b_lambda!7733) (not b!212663) (not b!212658) (not b!212625) (not bm!20125) (not b!212548) (not d!58013) (not b!212654) (not b!212618) (not bm!20104) (not d!57997) (not bm!20137) (not b!212609) (not b!212634) (not b!212670) (not bm!20121) (not b_next!5611) (not b_lambda!7731) (not bm!20130) (not b!212645) (not d!57991) (not bm!20139) (not b!212669) (not b!212546) (not d!58003) (not b!212551) (not b!212642) (not b!212664) (not b!212550) (not d!57995) (not b!212620) tp_is_empty!5473 (not b!212648) (not b!212637) (not bm!20131) (not b!212700) (not b!212674) (not b!212699) b_and!12443 (not b_lambda!7729) (not b!212552) (not b!212545) (not b!212606) (not b!212553) (not b!212661) (not b!212697) (not bm!20136) (not b!212601) (not b_lambda!7725) (not b!212673) (not bm!20138) (not d!57999) (not b!212657))
(check-sat b_and!12443 (not b_next!5611))
