; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100312 () Bool)

(assert start!100312)

(declare-fun b_free!25705 () Bool)

(declare-fun b_next!25705 () Bool)

(assert (=> start!100312 (= b_free!25705 (not b_next!25705))))

(declare-fun tp!90062 () Bool)

(declare-fun b_and!42255 () Bool)

(assert (=> start!100312 (= tp!90062 b_and!42255)))

(declare-fun b!1197089 () Bool)

(declare-fun res!796692 () Bool)

(declare-fun e!680064 () Bool)

(assert (=> b!1197089 (=> (not res!796692) (not e!680064))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197089 (= res!796692 (validKeyInArray!0 k0!934))))

(declare-fun b!1197090 () Bool)

(declare-fun res!796694 () Bool)

(assert (=> b!1197090 (=> (not res!796694) (not e!680064))))

(declare-datatypes ((array!77478 0))(
  ( (array!77479 (arr!37386 (Array (_ BitVec 32) (_ BitVec 64))) (size!37924 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77478)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77478 (_ BitVec 32)) Bool)

(assert (=> b!1197090 (= res!796694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197091 () Bool)

(declare-fun res!796698 () Bool)

(assert (=> b!1197091 (=> (not res!796698) (not e!680064))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45641 0))(
  ( (V!45642 (val!15249 Int)) )
))
(declare-datatypes ((ValueCell!14483 0))(
  ( (ValueCellFull!14483 (v!17886 V!45641)) (EmptyCell!14483) )
))
(declare-datatypes ((array!77480 0))(
  ( (array!77481 (arr!37387 (Array (_ BitVec 32) ValueCell!14483)) (size!37925 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77480)

(assert (=> b!1197091 (= res!796698 (and (= (size!37925 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37924 _keys!1208) (size!37925 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197092 () Bool)

(declare-fun e!680060 () Bool)

(declare-fun tp_is_empty!30385 () Bool)

(assert (=> b!1197092 (= e!680060 tp_is_empty!30385)))

(declare-fun res!796691 () Bool)

(assert (=> start!100312 (=> (not res!796691) (not e!680064))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100312 (= res!796691 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37924 _keys!1208))))))

(assert (=> start!100312 e!680064))

(assert (=> start!100312 tp_is_empty!30385))

(declare-fun array_inv!28616 (array!77478) Bool)

(assert (=> start!100312 (array_inv!28616 _keys!1208)))

(assert (=> start!100312 true))

(assert (=> start!100312 tp!90062))

(declare-fun e!680061 () Bool)

(declare-fun array_inv!28617 (array!77480) Bool)

(assert (=> start!100312 (and (array_inv!28617 _values!996) e!680061)))

(declare-fun b!1197093 () Bool)

(declare-fun res!796693 () Bool)

(assert (=> b!1197093 (=> (not res!796693) (not e!680064))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197093 (= res!796693 (= (select (arr!37386 _keys!1208) i!673) k0!934))))

(declare-fun b!1197094 () Bool)

(declare-fun res!796689 () Bool)

(declare-fun e!680065 () Bool)

(assert (=> b!1197094 (=> (not res!796689) (not e!680065))))

(declare-fun lt!543027 () array!77478)

(declare-datatypes ((List!26396 0))(
  ( (Nil!26393) (Cons!26392 (h!27601 (_ BitVec 64)) (t!39084 List!26396)) )
))
(declare-fun arrayNoDuplicates!0 (array!77478 (_ BitVec 32) List!26396) Bool)

(assert (=> b!1197094 (= res!796689 (arrayNoDuplicates!0 lt!543027 #b00000000000000000000000000000000 Nil!26393))))

(declare-fun b!1197095 () Bool)

(declare-fun e!680058 () Bool)

(assert (=> b!1197095 (= e!680058 tp_is_empty!30385)))

(declare-fun zeroValue!944 () V!45641)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57210 () Bool)

(declare-fun minValue!944 () V!45641)

(declare-datatypes ((tuple2!19618 0))(
  ( (tuple2!19619 (_1!9820 (_ BitVec 64)) (_2!9820 V!45641)) )
))
(declare-datatypes ((List!26397 0))(
  ( (Nil!26394) (Cons!26393 (h!27602 tuple2!19618) (t!39085 List!26397)) )
))
(declare-datatypes ((ListLongMap!17587 0))(
  ( (ListLongMap!17588 (toList!8809 List!26397)) )
))
(declare-fun call!57213 () ListLongMap!17587)

(declare-fun getCurrentListMapNoExtraKeys!5259 (array!77478 array!77480 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) Int) ListLongMap!17587)

(declare-fun dynLambda!3143 (Int (_ BitVec 64)) V!45641)

(assert (=> bm!57210 (= call!57213 (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197096 () Bool)

(declare-fun res!796690 () Bool)

(assert (=> b!1197096 (=> (not res!796690) (not e!680064))))

(assert (=> b!1197096 (= res!796690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37924 _keys!1208))))))

(declare-fun b!1197097 () Bool)

(declare-fun e!680062 () Bool)

(declare-fun call!57214 () ListLongMap!17587)

(assert (=> b!1197097 (= e!680062 (= call!57213 call!57214))))

(declare-fun b!1197098 () Bool)

(declare-fun res!796696 () Bool)

(assert (=> b!1197098 (=> (not res!796696) (not e!680064))))

(assert (=> b!1197098 (= res!796696 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26393))))

(declare-fun b!1197099 () Bool)

(declare-fun e!680063 () Bool)

(assert (=> b!1197099 (= e!680065 (not e!680063))))

(declare-fun res!796697 () Bool)

(assert (=> b!1197099 (=> res!796697 e!680063)))

(assert (=> b!1197099 (= res!796697 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197099 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39565 0))(
  ( (Unit!39566) )
))
(declare-fun lt!543025 () Unit!39565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77478 (_ BitVec 64) (_ BitVec 32)) Unit!39565)

(assert (=> b!1197099 (= lt!543025 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197100 () Bool)

(assert (=> b!1197100 (= e!680064 e!680065)))

(declare-fun res!796699 () Bool)

(assert (=> b!1197100 (=> (not res!796699) (not e!680065))))

(assert (=> b!1197100 (= res!796699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543027 mask!1564))))

(assert (=> b!1197100 (= lt!543027 (array!77479 (store (arr!37386 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37924 _keys!1208)))))

(declare-fun b!1197101 () Bool)

(declare-fun mapRes!47414 () Bool)

(assert (=> b!1197101 (= e!680061 (and e!680060 mapRes!47414))))

(declare-fun condMapEmpty!47414 () Bool)

(declare-fun mapDefault!47414 () ValueCell!14483)

(assert (=> b!1197101 (= condMapEmpty!47414 (= (arr!37387 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14483)) mapDefault!47414)))))

(declare-fun b!1197102 () Bool)

(declare-fun res!796695 () Bool)

(assert (=> b!1197102 (=> (not res!796695) (not e!680064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197102 (= res!796695 (validMask!0 mask!1564))))

(declare-fun b!1197103 () Bool)

(declare-fun -!1746 (ListLongMap!17587 (_ BitVec 64)) ListLongMap!17587)

(assert (=> b!1197103 (= e!680062 (= call!57213 (-!1746 call!57214 k0!934)))))

(declare-fun mapIsEmpty!47414 () Bool)

(assert (=> mapIsEmpty!47414 mapRes!47414))

(declare-fun bm!57211 () Bool)

(assert (=> bm!57211 (= call!57214 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47414 () Bool)

(declare-fun tp!90063 () Bool)

(assert (=> mapNonEmpty!47414 (= mapRes!47414 (and tp!90063 e!680058))))

(declare-fun mapRest!47414 () (Array (_ BitVec 32) ValueCell!14483))

(declare-fun mapKey!47414 () (_ BitVec 32))

(declare-fun mapValue!47414 () ValueCell!14483)

(assert (=> mapNonEmpty!47414 (= (arr!37387 _values!996) (store mapRest!47414 mapKey!47414 mapValue!47414))))

(declare-fun b!1197104 () Bool)

(assert (=> b!1197104 (= e!680063 (= (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(assert (=> b!1197104 e!680062))

(declare-fun c!117346 () Bool)

(assert (=> b!1197104 (= c!117346 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!543026 () Unit!39565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 (array!77478 array!77480 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39565)

(assert (=> b!1197104 (= lt!543026 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100312 res!796691) b!1197102))

(assert (= (and b!1197102 res!796695) b!1197091))

(assert (= (and b!1197091 res!796698) b!1197090))

(assert (= (and b!1197090 res!796694) b!1197098))

(assert (= (and b!1197098 res!796696) b!1197096))

(assert (= (and b!1197096 res!796690) b!1197089))

(assert (= (and b!1197089 res!796692) b!1197093))

(assert (= (and b!1197093 res!796693) b!1197100))

(assert (= (and b!1197100 res!796699) b!1197094))

(assert (= (and b!1197094 res!796689) b!1197099))

(assert (= (and b!1197099 (not res!796697)) b!1197104))

(assert (= (and b!1197104 c!117346) b!1197103))

(assert (= (and b!1197104 (not c!117346)) b!1197097))

(assert (= (or b!1197103 b!1197097) bm!57210))

(assert (= (or b!1197103 b!1197097) bm!57211))

(assert (= (and b!1197101 condMapEmpty!47414) mapIsEmpty!47414))

(assert (= (and b!1197101 (not condMapEmpty!47414)) mapNonEmpty!47414))

(get-info :version)

(assert (= (and mapNonEmpty!47414 ((_ is ValueCellFull!14483) mapValue!47414)) b!1197095))

(assert (= (and b!1197101 ((_ is ValueCellFull!14483) mapDefault!47414)) b!1197092))

(assert (= start!100312 b!1197101))

(declare-fun b_lambda!20831 () Bool)

(assert (=> (not b_lambda!20831) (not bm!57210)))

(declare-fun t!39083 () Bool)

(declare-fun tb!10509 () Bool)

(assert (=> (and start!100312 (= defaultEntry!1004 defaultEntry!1004) t!39083) tb!10509))

(declare-fun result!21599 () Bool)

(assert (=> tb!10509 (= result!21599 tp_is_empty!30385)))

(assert (=> bm!57210 t!39083))

(declare-fun b_and!42257 () Bool)

(assert (= b_and!42255 (and (=> t!39083 result!21599) b_and!42257)))

(declare-fun b_lambda!20833 () Bool)

(assert (=> (not b_lambda!20833) (not b!1197104)))

(assert (=> b!1197104 t!39083))

(declare-fun b_and!42259 () Bool)

(assert (= b_and!42257 (and (=> t!39083 result!21599) b_and!42259)))

(declare-fun m!1103633 () Bool)

(assert (=> b!1197098 m!1103633))

(declare-fun m!1103635 () Bool)

(assert (=> bm!57210 m!1103635))

(declare-fun m!1103637 () Bool)

(assert (=> bm!57210 m!1103637))

(declare-fun m!1103639 () Bool)

(assert (=> bm!57210 m!1103639))

(declare-fun m!1103641 () Bool)

(assert (=> b!1197100 m!1103641))

(declare-fun m!1103643 () Bool)

(assert (=> b!1197100 m!1103643))

(declare-fun m!1103645 () Bool)

(assert (=> b!1197089 m!1103645))

(declare-fun m!1103647 () Bool)

(assert (=> b!1197094 m!1103647))

(declare-fun m!1103649 () Bool)

(assert (=> b!1197093 m!1103649))

(declare-fun m!1103651 () Bool)

(assert (=> b!1197103 m!1103651))

(declare-fun m!1103653 () Bool)

(assert (=> mapNonEmpty!47414 m!1103653))

(declare-fun m!1103655 () Bool)

(assert (=> b!1197099 m!1103655))

(declare-fun m!1103657 () Bool)

(assert (=> b!1197099 m!1103657))

(declare-fun m!1103659 () Bool)

(assert (=> b!1197102 m!1103659))

(declare-fun m!1103661 () Bool)

(assert (=> start!100312 m!1103661))

(declare-fun m!1103663 () Bool)

(assert (=> start!100312 m!1103663))

(assert (=> b!1197104 m!1103635))

(assert (=> b!1197104 m!1103637))

(declare-fun m!1103665 () Bool)

(assert (=> b!1197104 m!1103665))

(declare-fun m!1103667 () Bool)

(assert (=> b!1197104 m!1103667))

(declare-fun m!1103669 () Bool)

(assert (=> b!1197104 m!1103669))

(declare-fun m!1103671 () Bool)

(assert (=> bm!57211 m!1103671))

(declare-fun m!1103673 () Bool)

(assert (=> b!1197090 m!1103673))

(check-sat b_and!42259 (not mapNonEmpty!47414) (not b!1197094) (not b!1197104) (not b!1197099) (not b_lambda!20831) (not b_lambda!20833) (not bm!57210) (not start!100312) (not b_next!25705) (not b!1197103) (not b!1197102) (not b!1197089) (not b!1197090) (not b!1197100) (not b!1197098) tp_is_empty!30385 (not bm!57211))
(check-sat b_and!42259 (not b_next!25705))
(get-model)

(declare-fun b_lambda!20843 () Bool)

(assert (= b_lambda!20831 (or (and start!100312 b_free!25705) b_lambda!20843)))

(declare-fun b_lambda!20845 () Bool)

(assert (= b_lambda!20833 (or (and start!100312 b_free!25705) b_lambda!20845)))

(check-sat b_and!42259 (not mapNonEmpty!47414) (not b!1197094) (not b!1197104) (not bm!57210) (not start!100312) (not b_next!25705) (not b!1197103) (not b!1197102) (not b_lambda!20843) (not b!1197099) (not b!1197089) (not b!1197090) (not b_lambda!20845) (not b!1197100) (not b!1197098) tp_is_empty!30385 (not bm!57211))
(check-sat b_and!42259 (not b_next!25705))
(get-model)

(declare-fun b!1197217 () Bool)

(declare-fun e!680123 () Bool)

(declare-fun contains!6844 (List!26396 (_ BitVec 64)) Bool)

(assert (=> b!1197217 (= e!680123 (contains!6844 Nil!26393 (select (arr!37386 lt!543027) #b00000000000000000000000000000000)))))

(declare-fun bm!57226 () Bool)

(declare-fun call!57229 () Bool)

(declare-fun c!117355 () Bool)

(assert (=> bm!57226 (= call!57229 (arrayNoDuplicates!0 lt!543027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117355 (Cons!26392 (select (arr!37386 lt!543027) #b00000000000000000000000000000000) Nil!26393) Nil!26393)))))

(declare-fun d!132203 () Bool)

(declare-fun res!796773 () Bool)

(declare-fun e!680124 () Bool)

(assert (=> d!132203 (=> res!796773 e!680124)))

(assert (=> d!132203 (= res!796773 (bvsge #b00000000000000000000000000000000 (size!37924 lt!543027)))))

(assert (=> d!132203 (= (arrayNoDuplicates!0 lt!543027 #b00000000000000000000000000000000 Nil!26393) e!680124)))

(declare-fun b!1197218 () Bool)

(declare-fun e!680125 () Bool)

(declare-fun e!680122 () Bool)

(assert (=> b!1197218 (= e!680125 e!680122)))

(assert (=> b!1197218 (= c!117355 (validKeyInArray!0 (select (arr!37386 lt!543027) #b00000000000000000000000000000000)))))

(declare-fun b!1197219 () Bool)

(assert (=> b!1197219 (= e!680122 call!57229)))

(declare-fun b!1197220 () Bool)

(assert (=> b!1197220 (= e!680122 call!57229)))

(declare-fun b!1197221 () Bool)

(assert (=> b!1197221 (= e!680124 e!680125)))

(declare-fun res!796774 () Bool)

(assert (=> b!1197221 (=> (not res!796774) (not e!680125))))

(assert (=> b!1197221 (= res!796774 (not e!680123))))

(declare-fun res!796772 () Bool)

(assert (=> b!1197221 (=> (not res!796772) (not e!680123))))

(assert (=> b!1197221 (= res!796772 (validKeyInArray!0 (select (arr!37386 lt!543027) #b00000000000000000000000000000000)))))

(assert (= (and d!132203 (not res!796773)) b!1197221))

(assert (= (and b!1197221 res!796772) b!1197217))

(assert (= (and b!1197221 res!796774) b!1197218))

(assert (= (and b!1197218 c!117355) b!1197220))

(assert (= (and b!1197218 (not c!117355)) b!1197219))

(assert (= (or b!1197220 b!1197219) bm!57226))

(declare-fun m!1103759 () Bool)

(assert (=> b!1197217 m!1103759))

(assert (=> b!1197217 m!1103759))

(declare-fun m!1103761 () Bool)

(assert (=> b!1197217 m!1103761))

(assert (=> bm!57226 m!1103759))

(declare-fun m!1103763 () Bool)

(assert (=> bm!57226 m!1103763))

(assert (=> b!1197218 m!1103759))

(assert (=> b!1197218 m!1103759))

(declare-fun m!1103765 () Bool)

(assert (=> b!1197218 m!1103765))

(assert (=> b!1197221 m!1103759))

(assert (=> b!1197221 m!1103759))

(assert (=> b!1197221 m!1103765))

(assert (=> b!1197094 d!132203))

(declare-fun b!1197246 () Bool)

(declare-fun e!680145 () Bool)

(declare-fun lt!543064 () ListLongMap!17587)

(declare-fun isEmpty!983 (ListLongMap!17587) Bool)

(assert (=> b!1197246 (= e!680145 (isEmpty!983 lt!543064))))

(declare-fun b!1197247 () Bool)

(declare-fun e!680144 () Bool)

(assert (=> b!1197247 (= e!680144 (validKeyInArray!0 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197247 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1197248 () Bool)

(declare-fun e!680141 () ListLongMap!17587)

(assert (=> b!1197248 (= e!680141 (ListLongMap!17588 Nil!26394))))

(declare-fun b!1197249 () Bool)

(declare-fun e!680146 () Bool)

(declare-fun e!680142 () Bool)

(assert (=> b!1197249 (= e!680146 e!680142)))

(declare-fun c!117366 () Bool)

(assert (=> b!1197249 (= c!117366 e!680144)))

(declare-fun res!796786 () Bool)

(assert (=> b!1197249 (=> (not res!796786) (not e!680144))))

(assert (=> b!1197249 (= res!796786 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(declare-fun b!1197250 () Bool)

(declare-fun res!796784 () Bool)

(assert (=> b!1197250 (=> (not res!796784) (not e!680146))))

(declare-fun contains!6845 (ListLongMap!17587 (_ BitVec 64)) Bool)

(assert (=> b!1197250 (= res!796784 (not (contains!6845 lt!543064 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197251 () Bool)

(assert (=> b!1197251 (= e!680142 e!680145)))

(declare-fun c!117365 () Bool)

(assert (=> b!1197251 (= c!117365 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(declare-fun b!1197252 () Bool)

(declare-fun e!680140 () ListLongMap!17587)

(declare-fun call!57232 () ListLongMap!17587)

(assert (=> b!1197252 (= e!680140 call!57232)))

(declare-fun b!1197253 () Bool)

(assert (=> b!1197253 (= e!680145 (= lt!543064 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57229 () Bool)

(assert (=> bm!57229 (= call!57232 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1197254 () Bool)

(declare-fun e!680143 () Bool)

(assert (=> b!1197254 (= e!680142 e!680143)))

(assert (=> b!1197254 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(declare-fun res!796783 () Bool)

(assert (=> b!1197254 (= res!796783 (contains!6845 lt!543064 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197254 (=> (not res!796783) (not e!680143))))

(declare-fun d!132205 () Bool)

(assert (=> d!132205 e!680146))

(declare-fun res!796785 () Bool)

(assert (=> d!132205 (=> (not res!796785) (not e!680146))))

(assert (=> d!132205 (= res!796785 (not (contains!6845 lt!543064 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132205 (= lt!543064 e!680141)))

(declare-fun c!117364 () Bool)

(assert (=> d!132205 (= c!117364 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(assert (=> d!132205 (validMask!0 mask!1564)))

(assert (=> d!132205 (= (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543064)))

(declare-fun b!1197255 () Bool)

(assert (=> b!1197255 (= e!680141 e!680140)))

(declare-fun c!117367 () Bool)

(assert (=> b!1197255 (= c!117367 (validKeyInArray!0 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1197256 () Bool)

(assert (=> b!1197256 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(assert (=> b!1197256 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37925 _values!996)))))

(declare-fun apply!951 (ListLongMap!17587 (_ BitVec 64)) V!45641)

(declare-fun get!19103 (ValueCell!14483 V!45641) V!45641)

(assert (=> b!1197256 (= e!680143 (= (apply!951 lt!543064 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19103 (select (arr!37387 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197257 () Bool)

(declare-fun lt!543063 () Unit!39565)

(declare-fun lt!543061 () Unit!39565)

(assert (=> b!1197257 (= lt!543063 lt!543061)))

(declare-fun lt!543065 () (_ BitVec 64))

(declare-fun lt!543066 () V!45641)

(declare-fun lt!543062 () ListLongMap!17587)

(declare-fun lt!543060 () (_ BitVec 64))

(declare-fun +!3996 (ListLongMap!17587 tuple2!19618) ListLongMap!17587)

(assert (=> b!1197257 (not (contains!6845 (+!3996 lt!543062 (tuple2!19619 lt!543060 lt!543066)) lt!543065))))

(declare-fun addStillNotContains!287 (ListLongMap!17587 (_ BitVec 64) V!45641 (_ BitVec 64)) Unit!39565)

(assert (=> b!1197257 (= lt!543061 (addStillNotContains!287 lt!543062 lt!543060 lt!543066 lt!543065))))

(assert (=> b!1197257 (= lt!543065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197257 (= lt!543066 (get!19103 (select (arr!37387 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197257 (= lt!543060 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1197257 (= lt!543062 call!57232)))

(assert (=> b!1197257 (= e!680140 (+!3996 call!57232 (tuple2!19619 (select (arr!37386 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19103 (select (arr!37387 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132205 c!117364) b!1197248))

(assert (= (and d!132205 (not c!117364)) b!1197255))

(assert (= (and b!1197255 c!117367) b!1197257))

(assert (= (and b!1197255 (not c!117367)) b!1197252))

(assert (= (or b!1197257 b!1197252) bm!57229))

(assert (= (and d!132205 res!796785) b!1197250))

(assert (= (and b!1197250 res!796784) b!1197249))

(assert (= (and b!1197249 res!796786) b!1197247))

(assert (= (and b!1197249 c!117366) b!1197254))

(assert (= (and b!1197249 (not c!117366)) b!1197251))

(assert (= (and b!1197254 res!796783) b!1197256))

(assert (= (and b!1197251 c!117365) b!1197253))

(assert (= (and b!1197251 (not c!117365)) b!1197246))

(declare-fun b_lambda!20847 () Bool)

(assert (=> (not b_lambda!20847) (not b!1197256)))

(assert (=> b!1197256 t!39083))

(declare-fun b_and!42273 () Bool)

(assert (= b_and!42259 (and (=> t!39083 result!21599) b_and!42273)))

(declare-fun b_lambda!20849 () Bool)

(assert (=> (not b_lambda!20849) (not b!1197257)))

(assert (=> b!1197257 t!39083))

(declare-fun b_and!42275 () Bool)

(assert (= b_and!42273 (and (=> t!39083 result!21599) b_and!42275)))

(declare-fun m!1103767 () Bool)

(assert (=> b!1197247 m!1103767))

(assert (=> b!1197247 m!1103767))

(declare-fun m!1103769 () Bool)

(assert (=> b!1197247 m!1103769))

(declare-fun m!1103771 () Bool)

(assert (=> b!1197253 m!1103771))

(assert (=> b!1197255 m!1103767))

(assert (=> b!1197255 m!1103767))

(assert (=> b!1197255 m!1103769))

(assert (=> bm!57229 m!1103771))

(declare-fun m!1103773 () Bool)

(assert (=> b!1197246 m!1103773))

(declare-fun m!1103775 () Bool)

(assert (=> d!132205 m!1103775))

(assert (=> d!132205 m!1103659))

(declare-fun m!1103777 () Bool)

(assert (=> b!1197250 m!1103777))

(declare-fun m!1103779 () Bool)

(assert (=> b!1197257 m!1103779))

(declare-fun m!1103781 () Bool)

(assert (=> b!1197257 m!1103781))

(declare-fun m!1103783 () Bool)

(assert (=> b!1197257 m!1103783))

(declare-fun m!1103785 () Bool)

(assert (=> b!1197257 m!1103785))

(assert (=> b!1197257 m!1103767))

(assert (=> b!1197257 m!1103785))

(assert (=> b!1197257 m!1103635))

(declare-fun m!1103787 () Bool)

(assert (=> b!1197257 m!1103787))

(assert (=> b!1197257 m!1103779))

(assert (=> b!1197257 m!1103635))

(declare-fun m!1103789 () Bool)

(assert (=> b!1197257 m!1103789))

(assert (=> b!1197256 m!1103767))

(assert (=> b!1197256 m!1103785))

(assert (=> b!1197256 m!1103635))

(assert (=> b!1197256 m!1103787))

(assert (=> b!1197256 m!1103635))

(assert (=> b!1197256 m!1103767))

(declare-fun m!1103791 () Bool)

(assert (=> b!1197256 m!1103791))

(assert (=> b!1197256 m!1103785))

(assert (=> b!1197254 m!1103767))

(assert (=> b!1197254 m!1103767))

(declare-fun m!1103793 () Bool)

(assert (=> b!1197254 m!1103793))

(assert (=> bm!57211 d!132205))

(declare-fun d!132207 () Bool)

(assert (=> d!132207 (= (array_inv!28616 _keys!1208) (bvsge (size!37924 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100312 d!132207))

(declare-fun d!132209 () Bool)

(assert (=> d!132209 (= (array_inv!28617 _values!996) (bvsge (size!37925 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100312 d!132209))

(declare-fun b!1197258 () Bool)

(declare-fun e!680152 () Bool)

(declare-fun lt!543071 () ListLongMap!17587)

(assert (=> b!1197258 (= e!680152 (isEmpty!983 lt!543071))))

(declare-fun b!1197259 () Bool)

(declare-fun e!680151 () Bool)

(assert (=> b!1197259 (= e!680151 (validKeyInArray!0 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197259 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1197260 () Bool)

(declare-fun e!680148 () ListLongMap!17587)

(assert (=> b!1197260 (= e!680148 (ListLongMap!17588 Nil!26394))))

(declare-fun b!1197261 () Bool)

(declare-fun e!680153 () Bool)

(declare-fun e!680149 () Bool)

(assert (=> b!1197261 (= e!680153 e!680149)))

(declare-fun c!117370 () Bool)

(assert (=> b!1197261 (= c!117370 e!680151)))

(declare-fun res!796790 () Bool)

(assert (=> b!1197261 (=> (not res!796790) (not e!680151))))

(assert (=> b!1197261 (= res!796790 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 lt!543027)))))

(declare-fun b!1197262 () Bool)

(declare-fun res!796788 () Bool)

(assert (=> b!1197262 (=> (not res!796788) (not e!680153))))

(assert (=> b!1197262 (= res!796788 (not (contains!6845 lt!543071 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197263 () Bool)

(assert (=> b!1197263 (= e!680149 e!680152)))

(declare-fun c!117369 () Bool)

(assert (=> b!1197263 (= c!117369 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 lt!543027)))))

(declare-fun b!1197264 () Bool)

(declare-fun e!680147 () ListLongMap!17587)

(declare-fun call!57233 () ListLongMap!17587)

(assert (=> b!1197264 (= e!680147 call!57233)))

(declare-fun b!1197265 () Bool)

(assert (=> b!1197265 (= e!680152 (= lt!543071 (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57230 () Bool)

(assert (=> bm!57230 (= call!57233 (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1197266 () Bool)

(declare-fun e!680150 () Bool)

(assert (=> b!1197266 (= e!680149 e!680150)))

(assert (=> b!1197266 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 lt!543027)))))

(declare-fun res!796787 () Bool)

(assert (=> b!1197266 (= res!796787 (contains!6845 lt!543071 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197266 (=> (not res!796787) (not e!680150))))

(declare-fun d!132211 () Bool)

(assert (=> d!132211 e!680153))

(declare-fun res!796789 () Bool)

(assert (=> d!132211 (=> (not res!796789) (not e!680153))))

(assert (=> d!132211 (= res!796789 (not (contains!6845 lt!543071 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132211 (= lt!543071 e!680148)))

(declare-fun c!117368 () Bool)

(assert (=> d!132211 (= c!117368 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 lt!543027)))))

(assert (=> d!132211 (validMask!0 mask!1564)))

(assert (=> d!132211 (= (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543071)))

(declare-fun b!1197267 () Bool)

(assert (=> b!1197267 (= e!680148 e!680147)))

(declare-fun c!117371 () Bool)

(assert (=> b!1197267 (= c!117371 (validKeyInArray!0 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1197268 () Bool)

(assert (=> b!1197268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 lt!543027)))))

(assert (=> b!1197268 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37925 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)))))))

(assert (=> b!1197268 (= e!680150 (= (apply!951 lt!543071 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197269 () Bool)

(declare-fun lt!543070 () Unit!39565)

(declare-fun lt!543068 () Unit!39565)

(assert (=> b!1197269 (= lt!543070 lt!543068)))

(declare-fun lt!543073 () V!45641)

(declare-fun lt!543069 () ListLongMap!17587)

(declare-fun lt!543072 () (_ BitVec 64))

(declare-fun lt!543067 () (_ BitVec 64))

(assert (=> b!1197269 (not (contains!6845 (+!3996 lt!543069 (tuple2!19619 lt!543067 lt!543073)) lt!543072))))

(assert (=> b!1197269 (= lt!543068 (addStillNotContains!287 lt!543069 lt!543067 lt!543073 lt!543072))))

(assert (=> b!1197269 (= lt!543072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197269 (= lt!543073 (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197269 (= lt!543067 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1197269 (= lt!543069 call!57233)))

(assert (=> b!1197269 (= e!680147 (+!3996 call!57233 (tuple2!19619 (select (arr!37386 lt!543027) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132211 c!117368) b!1197260))

(assert (= (and d!132211 (not c!117368)) b!1197267))

(assert (= (and b!1197267 c!117371) b!1197269))

(assert (= (and b!1197267 (not c!117371)) b!1197264))

(assert (= (or b!1197269 b!1197264) bm!57230))

(assert (= (and d!132211 res!796789) b!1197262))

(assert (= (and b!1197262 res!796788) b!1197261))

(assert (= (and b!1197261 res!796790) b!1197259))

(assert (= (and b!1197261 c!117370) b!1197266))

(assert (= (and b!1197261 (not c!117370)) b!1197263))

(assert (= (and b!1197266 res!796787) b!1197268))

(assert (= (and b!1197263 c!117369) b!1197265))

(assert (= (and b!1197263 (not c!117369)) b!1197258))

(declare-fun b_lambda!20851 () Bool)

(assert (=> (not b_lambda!20851) (not b!1197268)))

(assert (=> b!1197268 t!39083))

(declare-fun b_and!42277 () Bool)

(assert (= b_and!42275 (and (=> t!39083 result!21599) b_and!42277)))

(declare-fun b_lambda!20853 () Bool)

(assert (=> (not b_lambda!20853) (not b!1197269)))

(assert (=> b!1197269 t!39083))

(declare-fun b_and!42279 () Bool)

(assert (= b_and!42277 (and (=> t!39083 result!21599) b_and!42279)))

(declare-fun m!1103795 () Bool)

(assert (=> b!1197259 m!1103795))

(assert (=> b!1197259 m!1103795))

(declare-fun m!1103797 () Bool)

(assert (=> b!1197259 m!1103797))

(declare-fun m!1103799 () Bool)

(assert (=> b!1197265 m!1103799))

(assert (=> b!1197267 m!1103795))

(assert (=> b!1197267 m!1103795))

(assert (=> b!1197267 m!1103797))

(assert (=> bm!57230 m!1103799))

(declare-fun m!1103801 () Bool)

(assert (=> b!1197258 m!1103801))

(declare-fun m!1103803 () Bool)

(assert (=> d!132211 m!1103803))

(assert (=> d!132211 m!1103659))

(declare-fun m!1103805 () Bool)

(assert (=> b!1197262 m!1103805))

(declare-fun m!1103807 () Bool)

(assert (=> b!1197269 m!1103807))

(declare-fun m!1103809 () Bool)

(assert (=> b!1197269 m!1103809))

(declare-fun m!1103811 () Bool)

(assert (=> b!1197269 m!1103811))

(declare-fun m!1103813 () Bool)

(assert (=> b!1197269 m!1103813))

(assert (=> b!1197269 m!1103795))

(assert (=> b!1197269 m!1103813))

(assert (=> b!1197269 m!1103635))

(declare-fun m!1103815 () Bool)

(assert (=> b!1197269 m!1103815))

(assert (=> b!1197269 m!1103807))

(assert (=> b!1197269 m!1103635))

(declare-fun m!1103817 () Bool)

(assert (=> b!1197269 m!1103817))

(assert (=> b!1197268 m!1103795))

(assert (=> b!1197268 m!1103813))

(assert (=> b!1197268 m!1103635))

(assert (=> b!1197268 m!1103815))

(assert (=> b!1197268 m!1103635))

(assert (=> b!1197268 m!1103795))

(declare-fun m!1103819 () Bool)

(assert (=> b!1197268 m!1103819))

(assert (=> b!1197268 m!1103813))

(assert (=> b!1197266 m!1103795))

(assert (=> b!1197266 m!1103795))

(declare-fun m!1103821 () Bool)

(assert (=> b!1197266 m!1103821))

(assert (=> bm!57210 d!132211))

(declare-fun d!132213 () Bool)

(assert (=> d!132213 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1197102 d!132213))

(declare-fun d!132215 () Bool)

(declare-fun lt!543076 () ListLongMap!17587)

(assert (=> d!132215 (not (contains!6845 lt!543076 k0!934))))

(declare-fun removeStrictlySorted!92 (List!26397 (_ BitVec 64)) List!26397)

(assert (=> d!132215 (= lt!543076 (ListLongMap!17588 (removeStrictlySorted!92 (toList!8809 call!57214) k0!934)))))

(assert (=> d!132215 (= (-!1746 call!57214 k0!934) lt!543076)))

(declare-fun bs!33918 () Bool)

(assert (= bs!33918 d!132215))

(declare-fun m!1103823 () Bool)

(assert (=> bs!33918 m!1103823))

(declare-fun m!1103825 () Bool)

(assert (=> bs!33918 m!1103825))

(assert (=> b!1197103 d!132215))

(declare-fun d!132217 () Bool)

(assert (=> d!132217 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1197089 d!132217))

(declare-fun d!132219 () Bool)

(declare-fun res!796795 () Bool)

(declare-fun e!680158 () Bool)

(assert (=> d!132219 (=> res!796795 e!680158)))

(assert (=> d!132219 (= res!796795 (= (select (arr!37386 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132219 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!680158)))

(declare-fun b!1197274 () Bool)

(declare-fun e!680159 () Bool)

(assert (=> b!1197274 (= e!680158 e!680159)))

(declare-fun res!796796 () Bool)

(assert (=> b!1197274 (=> (not res!796796) (not e!680159))))

(assert (=> b!1197274 (= res!796796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37924 _keys!1208)))))

(declare-fun b!1197275 () Bool)

(assert (=> b!1197275 (= e!680159 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132219 (not res!796795)) b!1197274))

(assert (= (and b!1197274 res!796796) b!1197275))

(declare-fun m!1103827 () Bool)

(assert (=> d!132219 m!1103827))

(declare-fun m!1103829 () Bool)

(assert (=> b!1197275 m!1103829))

(assert (=> b!1197099 d!132219))

(declare-fun d!132221 () Bool)

(assert (=> d!132221 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543079 () Unit!39565)

(declare-fun choose!13 (array!77478 (_ BitVec 64) (_ BitVec 32)) Unit!39565)

(assert (=> d!132221 (= lt!543079 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132221 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132221 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543079)))

(declare-fun bs!33919 () Bool)

(assert (= bs!33919 d!132221))

(assert (=> bs!33919 m!1103655))

(declare-fun m!1103831 () Bool)

(assert (=> bs!33919 m!1103831))

(assert (=> b!1197099 d!132221))

(declare-fun bm!57233 () Bool)

(declare-fun call!57236 () Bool)

(assert (=> bm!57233 (= call!57236 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543027 mask!1564))))

(declare-fun b!1197285 () Bool)

(declare-fun e!680166 () Bool)

(assert (=> b!1197285 (= e!680166 call!57236)))

(declare-fun d!132223 () Bool)

(declare-fun res!796801 () Bool)

(declare-fun e!680168 () Bool)

(assert (=> d!132223 (=> res!796801 e!680168)))

(assert (=> d!132223 (= res!796801 (bvsge #b00000000000000000000000000000000 (size!37924 lt!543027)))))

(assert (=> d!132223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543027 mask!1564) e!680168)))

(declare-fun b!1197284 () Bool)

(declare-fun e!680167 () Bool)

(assert (=> b!1197284 (= e!680167 call!57236)))

(declare-fun b!1197286 () Bool)

(assert (=> b!1197286 (= e!680168 e!680167)))

(declare-fun c!117374 () Bool)

(assert (=> b!1197286 (= c!117374 (validKeyInArray!0 (select (arr!37386 lt!543027) #b00000000000000000000000000000000)))))

(declare-fun b!1197287 () Bool)

(assert (=> b!1197287 (= e!680167 e!680166)))

(declare-fun lt!543088 () (_ BitVec 64))

(assert (=> b!1197287 (= lt!543088 (select (arr!37386 lt!543027) #b00000000000000000000000000000000))))

(declare-fun lt!543086 () Unit!39565)

(assert (=> b!1197287 (= lt!543086 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543027 lt!543088 #b00000000000000000000000000000000))))

(assert (=> b!1197287 (arrayContainsKey!0 lt!543027 lt!543088 #b00000000000000000000000000000000)))

(declare-fun lt!543087 () Unit!39565)

(assert (=> b!1197287 (= lt!543087 lt!543086)))

(declare-fun res!796802 () Bool)

(declare-datatypes ((SeekEntryResult!9930 0))(
  ( (MissingZero!9930 (index!42091 (_ BitVec 32))) (Found!9930 (index!42092 (_ BitVec 32))) (Intermediate!9930 (undefined!10742 Bool) (index!42093 (_ BitVec 32)) (x!105866 (_ BitVec 32))) (Undefined!9930) (MissingVacant!9930 (index!42094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77478 (_ BitVec 32)) SeekEntryResult!9930)

(assert (=> b!1197287 (= res!796802 (= (seekEntryOrOpen!0 (select (arr!37386 lt!543027) #b00000000000000000000000000000000) lt!543027 mask!1564) (Found!9930 #b00000000000000000000000000000000)))))

(assert (=> b!1197287 (=> (not res!796802) (not e!680166))))

(assert (= (and d!132223 (not res!796801)) b!1197286))

(assert (= (and b!1197286 c!117374) b!1197287))

(assert (= (and b!1197286 (not c!117374)) b!1197284))

(assert (= (and b!1197287 res!796802) b!1197285))

(assert (= (or b!1197285 b!1197284) bm!57233))

(declare-fun m!1103833 () Bool)

(assert (=> bm!57233 m!1103833))

(assert (=> b!1197286 m!1103759))

(assert (=> b!1197286 m!1103759))

(assert (=> b!1197286 m!1103765))

(assert (=> b!1197287 m!1103759))

(declare-fun m!1103835 () Bool)

(assert (=> b!1197287 m!1103835))

(declare-fun m!1103837 () Bool)

(assert (=> b!1197287 m!1103837))

(assert (=> b!1197287 m!1103759))

(declare-fun m!1103839 () Bool)

(assert (=> b!1197287 m!1103839))

(assert (=> b!1197100 d!132223))

(declare-fun bm!57234 () Bool)

(declare-fun call!57237 () Bool)

(assert (=> bm!57234 (= call!57237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1197289 () Bool)

(declare-fun e!680169 () Bool)

(assert (=> b!1197289 (= e!680169 call!57237)))

(declare-fun d!132225 () Bool)

(declare-fun res!796803 () Bool)

(declare-fun e!680171 () Bool)

(assert (=> d!132225 (=> res!796803 e!680171)))

(assert (=> d!132225 (= res!796803 (bvsge #b00000000000000000000000000000000 (size!37924 _keys!1208)))))

(assert (=> d!132225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!680171)))

(declare-fun b!1197288 () Bool)

(declare-fun e!680170 () Bool)

(assert (=> b!1197288 (= e!680170 call!57237)))

(declare-fun b!1197290 () Bool)

(assert (=> b!1197290 (= e!680171 e!680170)))

(declare-fun c!117375 () Bool)

(assert (=> b!1197290 (= c!117375 (validKeyInArray!0 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197291 () Bool)

(assert (=> b!1197291 (= e!680170 e!680169)))

(declare-fun lt!543091 () (_ BitVec 64))

(assert (=> b!1197291 (= lt!543091 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543089 () Unit!39565)

(assert (=> b!1197291 (= lt!543089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543091 #b00000000000000000000000000000000))))

(assert (=> b!1197291 (arrayContainsKey!0 _keys!1208 lt!543091 #b00000000000000000000000000000000)))

(declare-fun lt!543090 () Unit!39565)

(assert (=> b!1197291 (= lt!543090 lt!543089)))

(declare-fun res!796804 () Bool)

(assert (=> b!1197291 (= res!796804 (= (seekEntryOrOpen!0 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9930 #b00000000000000000000000000000000)))))

(assert (=> b!1197291 (=> (not res!796804) (not e!680169))))

(assert (= (and d!132225 (not res!796803)) b!1197290))

(assert (= (and b!1197290 c!117375) b!1197291))

(assert (= (and b!1197290 (not c!117375)) b!1197288))

(assert (= (and b!1197291 res!796804) b!1197289))

(assert (= (or b!1197289 b!1197288) bm!57234))

(declare-fun m!1103841 () Bool)

(assert (=> bm!57234 m!1103841))

(assert (=> b!1197290 m!1103827))

(assert (=> b!1197290 m!1103827))

(declare-fun m!1103843 () Bool)

(assert (=> b!1197290 m!1103843))

(assert (=> b!1197291 m!1103827))

(declare-fun m!1103845 () Bool)

(assert (=> b!1197291 m!1103845))

(declare-fun m!1103847 () Bool)

(assert (=> b!1197291 m!1103847))

(assert (=> b!1197291 m!1103827))

(declare-fun m!1103849 () Bool)

(assert (=> b!1197291 m!1103849))

(assert (=> b!1197090 d!132225))

(declare-fun b!1197292 () Bool)

(declare-fun e!680177 () Bool)

(declare-fun lt!543096 () ListLongMap!17587)

(assert (=> b!1197292 (= e!680177 (isEmpty!983 lt!543096))))

(declare-fun b!1197293 () Bool)

(declare-fun e!680176 () Bool)

(assert (=> b!1197293 (= e!680176 (validKeyInArray!0 (select (arr!37386 lt!543027) from!1455)))))

(assert (=> b!1197293 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1197294 () Bool)

(declare-fun e!680173 () ListLongMap!17587)

(assert (=> b!1197294 (= e!680173 (ListLongMap!17588 Nil!26394))))

(declare-fun b!1197295 () Bool)

(declare-fun e!680178 () Bool)

(declare-fun e!680174 () Bool)

(assert (=> b!1197295 (= e!680178 e!680174)))

(declare-fun c!117378 () Bool)

(assert (=> b!1197295 (= c!117378 e!680176)))

(declare-fun res!796808 () Bool)

(assert (=> b!1197295 (=> (not res!796808) (not e!680176))))

(assert (=> b!1197295 (= res!796808 (bvslt from!1455 (size!37924 lt!543027)))))

(declare-fun b!1197296 () Bool)

(declare-fun res!796806 () Bool)

(assert (=> b!1197296 (=> (not res!796806) (not e!680178))))

(assert (=> b!1197296 (= res!796806 (not (contains!6845 lt!543096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197297 () Bool)

(assert (=> b!1197297 (= e!680174 e!680177)))

(declare-fun c!117377 () Bool)

(assert (=> b!1197297 (= c!117377 (bvslt from!1455 (size!37924 lt!543027)))))

(declare-fun b!1197298 () Bool)

(declare-fun e!680172 () ListLongMap!17587)

(declare-fun call!57238 () ListLongMap!17587)

(assert (=> b!1197298 (= e!680172 call!57238)))

(declare-fun b!1197299 () Bool)

(assert (=> b!1197299 (= e!680177 (= lt!543096 (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57235 () Bool)

(assert (=> bm!57235 (= call!57238 (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1197300 () Bool)

(declare-fun e!680175 () Bool)

(assert (=> b!1197300 (= e!680174 e!680175)))

(assert (=> b!1197300 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37924 lt!543027)))))

(declare-fun res!796805 () Bool)

(assert (=> b!1197300 (= res!796805 (contains!6845 lt!543096 (select (arr!37386 lt!543027) from!1455)))))

(assert (=> b!1197300 (=> (not res!796805) (not e!680175))))

(declare-fun d!132227 () Bool)

(assert (=> d!132227 e!680178))

(declare-fun res!796807 () Bool)

(assert (=> d!132227 (=> (not res!796807) (not e!680178))))

(assert (=> d!132227 (= res!796807 (not (contains!6845 lt!543096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132227 (= lt!543096 e!680173)))

(declare-fun c!117376 () Bool)

(assert (=> d!132227 (= c!117376 (bvsge from!1455 (size!37924 lt!543027)))))

(assert (=> d!132227 (validMask!0 mask!1564)))

(assert (=> d!132227 (= (getCurrentListMapNoExtraKeys!5259 lt!543027 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543096)))

(declare-fun b!1197301 () Bool)

(assert (=> b!1197301 (= e!680173 e!680172)))

(declare-fun c!117379 () Bool)

(assert (=> b!1197301 (= c!117379 (validKeyInArray!0 (select (arr!37386 lt!543027) from!1455)))))

(declare-fun b!1197302 () Bool)

(assert (=> b!1197302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37924 lt!543027)))))

(assert (=> b!1197302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37925 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)))))))

(assert (=> b!1197302 (= e!680175 (= (apply!951 lt!543096 (select (arr!37386 lt!543027) from!1455)) (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197303 () Bool)

(declare-fun lt!543095 () Unit!39565)

(declare-fun lt!543093 () Unit!39565)

(assert (=> b!1197303 (= lt!543095 lt!543093)))

(declare-fun lt!543098 () V!45641)

(declare-fun lt!543094 () ListLongMap!17587)

(declare-fun lt!543097 () (_ BitVec 64))

(declare-fun lt!543092 () (_ BitVec 64))

(assert (=> b!1197303 (not (contains!6845 (+!3996 lt!543094 (tuple2!19619 lt!543092 lt!543098)) lt!543097))))

(assert (=> b!1197303 (= lt!543093 (addStillNotContains!287 lt!543094 lt!543092 lt!543098 lt!543097))))

(assert (=> b!1197303 (= lt!543097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197303 (= lt!543098 (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197303 (= lt!543092 (select (arr!37386 lt!543027) from!1455))))

(assert (=> b!1197303 (= lt!543094 call!57238)))

(assert (=> b!1197303 (= e!680172 (+!3996 call!57238 (tuple2!19619 (select (arr!37386 lt!543027) from!1455) (get!19103 (select (arr!37387 (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996))) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132227 c!117376) b!1197294))

(assert (= (and d!132227 (not c!117376)) b!1197301))

(assert (= (and b!1197301 c!117379) b!1197303))

(assert (= (and b!1197301 (not c!117379)) b!1197298))

(assert (= (or b!1197303 b!1197298) bm!57235))

(assert (= (and d!132227 res!796807) b!1197296))

(assert (= (and b!1197296 res!796806) b!1197295))

(assert (= (and b!1197295 res!796808) b!1197293))

(assert (= (and b!1197295 c!117378) b!1197300))

(assert (= (and b!1197295 (not c!117378)) b!1197297))

(assert (= (and b!1197300 res!796805) b!1197302))

(assert (= (and b!1197297 c!117377) b!1197299))

(assert (= (and b!1197297 (not c!117377)) b!1197292))

(declare-fun b_lambda!20855 () Bool)

(assert (=> (not b_lambda!20855) (not b!1197302)))

(assert (=> b!1197302 t!39083))

(declare-fun b_and!42281 () Bool)

(assert (= b_and!42279 (and (=> t!39083 result!21599) b_and!42281)))

(declare-fun b_lambda!20857 () Bool)

(assert (=> (not b_lambda!20857) (not b!1197303)))

(assert (=> b!1197303 t!39083))

(declare-fun b_and!42283 () Bool)

(assert (= b_and!42281 (and (=> t!39083 result!21599) b_and!42283)))

(declare-fun m!1103851 () Bool)

(assert (=> b!1197293 m!1103851))

(assert (=> b!1197293 m!1103851))

(declare-fun m!1103853 () Bool)

(assert (=> b!1197293 m!1103853))

(declare-fun m!1103855 () Bool)

(assert (=> b!1197299 m!1103855))

(assert (=> b!1197301 m!1103851))

(assert (=> b!1197301 m!1103851))

(assert (=> b!1197301 m!1103853))

(assert (=> bm!57235 m!1103855))

(declare-fun m!1103857 () Bool)

(assert (=> b!1197292 m!1103857))

(declare-fun m!1103859 () Bool)

(assert (=> d!132227 m!1103859))

(assert (=> d!132227 m!1103659))

(declare-fun m!1103861 () Bool)

(assert (=> b!1197296 m!1103861))

(declare-fun m!1103863 () Bool)

(assert (=> b!1197303 m!1103863))

(declare-fun m!1103865 () Bool)

(assert (=> b!1197303 m!1103865))

(declare-fun m!1103867 () Bool)

(assert (=> b!1197303 m!1103867))

(declare-fun m!1103869 () Bool)

(assert (=> b!1197303 m!1103869))

(assert (=> b!1197303 m!1103851))

(assert (=> b!1197303 m!1103869))

(assert (=> b!1197303 m!1103635))

(declare-fun m!1103871 () Bool)

(assert (=> b!1197303 m!1103871))

(assert (=> b!1197303 m!1103863))

(assert (=> b!1197303 m!1103635))

(declare-fun m!1103873 () Bool)

(assert (=> b!1197303 m!1103873))

(assert (=> b!1197302 m!1103851))

(assert (=> b!1197302 m!1103869))

(assert (=> b!1197302 m!1103635))

(assert (=> b!1197302 m!1103871))

(assert (=> b!1197302 m!1103635))

(assert (=> b!1197302 m!1103851))

(declare-fun m!1103875 () Bool)

(assert (=> b!1197302 m!1103875))

(assert (=> b!1197302 m!1103869))

(assert (=> b!1197300 m!1103851))

(assert (=> b!1197300 m!1103851))

(declare-fun m!1103877 () Bool)

(assert (=> b!1197300 m!1103877))

(assert (=> b!1197104 d!132227))

(declare-fun b!1197304 () Bool)

(declare-fun e!680184 () Bool)

(declare-fun lt!543103 () ListLongMap!17587)

(assert (=> b!1197304 (= e!680184 (isEmpty!983 lt!543103))))

(declare-fun b!1197305 () Bool)

(declare-fun e!680183 () Bool)

(assert (=> b!1197305 (= e!680183 (validKeyInArray!0 (select (arr!37386 _keys!1208) from!1455)))))

(assert (=> b!1197305 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1197306 () Bool)

(declare-fun e!680180 () ListLongMap!17587)

(assert (=> b!1197306 (= e!680180 (ListLongMap!17588 Nil!26394))))

(declare-fun b!1197307 () Bool)

(declare-fun e!680185 () Bool)

(declare-fun e!680181 () Bool)

(assert (=> b!1197307 (= e!680185 e!680181)))

(declare-fun c!117382 () Bool)

(assert (=> b!1197307 (= c!117382 e!680183)))

(declare-fun res!796812 () Bool)

(assert (=> b!1197307 (=> (not res!796812) (not e!680183))))

(assert (=> b!1197307 (= res!796812 (bvslt from!1455 (size!37924 _keys!1208)))))

(declare-fun b!1197308 () Bool)

(declare-fun res!796810 () Bool)

(assert (=> b!1197308 (=> (not res!796810) (not e!680185))))

(assert (=> b!1197308 (= res!796810 (not (contains!6845 lt!543103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197309 () Bool)

(assert (=> b!1197309 (= e!680181 e!680184)))

(declare-fun c!117381 () Bool)

(assert (=> b!1197309 (= c!117381 (bvslt from!1455 (size!37924 _keys!1208)))))

(declare-fun b!1197310 () Bool)

(declare-fun e!680179 () ListLongMap!17587)

(declare-fun call!57239 () ListLongMap!17587)

(assert (=> b!1197310 (= e!680179 call!57239)))

(declare-fun b!1197311 () Bool)

(assert (=> b!1197311 (= e!680184 (= lt!543103 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57236 () Bool)

(assert (=> bm!57236 (= call!57239 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1197312 () Bool)

(declare-fun e!680182 () Bool)

(assert (=> b!1197312 (= e!680181 e!680182)))

(assert (=> b!1197312 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37924 _keys!1208)))))

(declare-fun res!796809 () Bool)

(assert (=> b!1197312 (= res!796809 (contains!6845 lt!543103 (select (arr!37386 _keys!1208) from!1455)))))

(assert (=> b!1197312 (=> (not res!796809) (not e!680182))))

(declare-fun d!132229 () Bool)

(assert (=> d!132229 e!680185))

(declare-fun res!796811 () Bool)

(assert (=> d!132229 (=> (not res!796811) (not e!680185))))

(assert (=> d!132229 (= res!796811 (not (contains!6845 lt!543103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132229 (= lt!543103 e!680180)))

(declare-fun c!117380 () Bool)

(assert (=> d!132229 (= c!117380 (bvsge from!1455 (size!37924 _keys!1208)))))

(assert (=> d!132229 (validMask!0 mask!1564)))

(assert (=> d!132229 (= (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543103)))

(declare-fun b!1197313 () Bool)

(assert (=> b!1197313 (= e!680180 e!680179)))

(declare-fun c!117383 () Bool)

(assert (=> b!1197313 (= c!117383 (validKeyInArray!0 (select (arr!37386 _keys!1208) from!1455)))))

(declare-fun b!1197314 () Bool)

(assert (=> b!1197314 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37924 _keys!1208)))))

(assert (=> b!1197314 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37925 _values!996)))))

(assert (=> b!1197314 (= e!680182 (= (apply!951 lt!543103 (select (arr!37386 _keys!1208) from!1455)) (get!19103 (select (arr!37387 _values!996) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197315 () Bool)

(declare-fun lt!543102 () Unit!39565)

(declare-fun lt!543100 () Unit!39565)

(assert (=> b!1197315 (= lt!543102 lt!543100)))

(declare-fun lt!543101 () ListLongMap!17587)

(declare-fun lt!543099 () (_ BitVec 64))

(declare-fun lt!543105 () V!45641)

(declare-fun lt!543104 () (_ BitVec 64))

(assert (=> b!1197315 (not (contains!6845 (+!3996 lt!543101 (tuple2!19619 lt!543099 lt!543105)) lt!543104))))

(assert (=> b!1197315 (= lt!543100 (addStillNotContains!287 lt!543101 lt!543099 lt!543105 lt!543104))))

(assert (=> b!1197315 (= lt!543104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197315 (= lt!543105 (get!19103 (select (arr!37387 _values!996) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197315 (= lt!543099 (select (arr!37386 _keys!1208) from!1455))))

(assert (=> b!1197315 (= lt!543101 call!57239)))

(assert (=> b!1197315 (= e!680179 (+!3996 call!57239 (tuple2!19619 (select (arr!37386 _keys!1208) from!1455) (get!19103 (select (arr!37387 _values!996) from!1455) (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132229 c!117380) b!1197306))

(assert (= (and d!132229 (not c!117380)) b!1197313))

(assert (= (and b!1197313 c!117383) b!1197315))

(assert (= (and b!1197313 (not c!117383)) b!1197310))

(assert (= (or b!1197315 b!1197310) bm!57236))

(assert (= (and d!132229 res!796811) b!1197308))

(assert (= (and b!1197308 res!796810) b!1197307))

(assert (= (and b!1197307 res!796812) b!1197305))

(assert (= (and b!1197307 c!117382) b!1197312))

(assert (= (and b!1197307 (not c!117382)) b!1197309))

(assert (= (and b!1197312 res!796809) b!1197314))

(assert (= (and b!1197309 c!117381) b!1197311))

(assert (= (and b!1197309 (not c!117381)) b!1197304))

(declare-fun b_lambda!20859 () Bool)

(assert (=> (not b_lambda!20859) (not b!1197314)))

(assert (=> b!1197314 t!39083))

(declare-fun b_and!42285 () Bool)

(assert (= b_and!42283 (and (=> t!39083 result!21599) b_and!42285)))

(declare-fun b_lambda!20861 () Bool)

(assert (=> (not b_lambda!20861) (not b!1197315)))

(assert (=> b!1197315 t!39083))

(declare-fun b_and!42287 () Bool)

(assert (= b_and!42285 (and (=> t!39083 result!21599) b_and!42287)))

(declare-fun m!1103879 () Bool)

(assert (=> b!1197305 m!1103879))

(assert (=> b!1197305 m!1103879))

(declare-fun m!1103881 () Bool)

(assert (=> b!1197305 m!1103881))

(declare-fun m!1103883 () Bool)

(assert (=> b!1197311 m!1103883))

(assert (=> b!1197313 m!1103879))

(assert (=> b!1197313 m!1103879))

(assert (=> b!1197313 m!1103881))

(assert (=> bm!57236 m!1103883))

(declare-fun m!1103885 () Bool)

(assert (=> b!1197304 m!1103885))

(declare-fun m!1103887 () Bool)

(assert (=> d!132229 m!1103887))

(assert (=> d!132229 m!1103659))

(declare-fun m!1103889 () Bool)

(assert (=> b!1197308 m!1103889))

(declare-fun m!1103891 () Bool)

(assert (=> b!1197315 m!1103891))

(declare-fun m!1103893 () Bool)

(assert (=> b!1197315 m!1103893))

(declare-fun m!1103895 () Bool)

(assert (=> b!1197315 m!1103895))

(declare-fun m!1103897 () Bool)

(assert (=> b!1197315 m!1103897))

(assert (=> b!1197315 m!1103879))

(assert (=> b!1197315 m!1103897))

(assert (=> b!1197315 m!1103635))

(declare-fun m!1103899 () Bool)

(assert (=> b!1197315 m!1103899))

(assert (=> b!1197315 m!1103891))

(assert (=> b!1197315 m!1103635))

(declare-fun m!1103901 () Bool)

(assert (=> b!1197315 m!1103901))

(assert (=> b!1197314 m!1103879))

(assert (=> b!1197314 m!1103897))

(assert (=> b!1197314 m!1103635))

(assert (=> b!1197314 m!1103899))

(assert (=> b!1197314 m!1103635))

(assert (=> b!1197314 m!1103879))

(declare-fun m!1103903 () Bool)

(assert (=> b!1197314 m!1103903))

(assert (=> b!1197314 m!1103897))

(assert (=> b!1197312 m!1103879))

(assert (=> b!1197312 m!1103879))

(declare-fun m!1103905 () Bool)

(assert (=> b!1197312 m!1103905))

(assert (=> b!1197104 d!132229))

(declare-fun bm!57241 () Bool)

(declare-fun call!57244 () ListLongMap!17587)

(assert (=> bm!57241 (= call!57244 (getCurrentListMapNoExtraKeys!5259 (array!77479 (store (arr!37386 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37924 _keys!1208)) (array!77481 (store (arr!37387 _values!996) i!673 (ValueCellFull!14483 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37925 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57245 () ListLongMap!17587)

(declare-fun bm!57242 () Bool)

(assert (=> bm!57242 (= call!57245 (getCurrentListMapNoExtraKeys!5259 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197322 () Bool)

(declare-fun e!680190 () Bool)

(declare-fun e!680191 () Bool)

(assert (=> b!1197322 (= e!680190 e!680191)))

(declare-fun c!117386 () Bool)

(assert (=> b!1197322 (= c!117386 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!132231 () Bool)

(assert (=> d!132231 e!680190))

(declare-fun res!796815 () Bool)

(assert (=> d!132231 (=> (not res!796815) (not e!680190))))

(assert (=> d!132231 (= res!796815 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37924 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37924 _keys!1208))))))))

(declare-fun lt!543108 () Unit!39565)

(declare-fun choose!1792 (array!77478 array!77480 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39565)

(assert (=> d!132231 (= lt!543108 (choose!1792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132231 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37924 _keys!1208)))))

(assert (=> d!132231 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543108)))

(declare-fun b!1197323 () Bool)

(assert (=> b!1197323 (= e!680191 (= call!57244 call!57245))))

(assert (=> b!1197323 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37925 _values!996)))))

(declare-fun b!1197324 () Bool)

(assert (=> b!1197324 (= e!680191 (= call!57244 (-!1746 call!57245 k0!934)))))

(assert (=> b!1197324 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37925 _values!996)))))

(assert (= (and d!132231 res!796815) b!1197322))

(assert (= (and b!1197322 c!117386) b!1197324))

(assert (= (and b!1197322 (not c!117386)) b!1197323))

(assert (= (or b!1197324 b!1197323) bm!57242))

(assert (= (or b!1197324 b!1197323) bm!57241))

(declare-fun b_lambda!20863 () Bool)

(assert (=> (not b_lambda!20863) (not bm!57241)))

(assert (=> bm!57241 t!39083))

(declare-fun b_and!42289 () Bool)

(assert (= b_and!42287 (and (=> t!39083 result!21599) b_and!42289)))

(assert (=> bm!57241 m!1103643))

(assert (=> bm!57241 m!1103635))

(assert (=> bm!57241 m!1103637))

(declare-fun m!1103907 () Bool)

(assert (=> bm!57241 m!1103907))

(assert (=> bm!57242 m!1103671))

(declare-fun m!1103909 () Bool)

(assert (=> d!132231 m!1103909))

(declare-fun m!1103911 () Bool)

(assert (=> b!1197324 m!1103911))

(assert (=> b!1197104 d!132231))

(declare-fun b!1197325 () Bool)

(declare-fun e!680193 () Bool)

(assert (=> b!1197325 (= e!680193 (contains!6844 Nil!26393 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57243 () Bool)

(declare-fun call!57246 () Bool)

(declare-fun c!117387 () Bool)

(assert (=> bm!57243 (= call!57246 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117387 (Cons!26392 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000) Nil!26393) Nil!26393)))))

(declare-fun d!132233 () Bool)

(declare-fun res!796817 () Bool)

(declare-fun e!680194 () Bool)

(assert (=> d!132233 (=> res!796817 e!680194)))

(assert (=> d!132233 (= res!796817 (bvsge #b00000000000000000000000000000000 (size!37924 _keys!1208)))))

(assert (=> d!132233 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26393) e!680194)))

(declare-fun b!1197326 () Bool)

(declare-fun e!680195 () Bool)

(declare-fun e!680192 () Bool)

(assert (=> b!1197326 (= e!680195 e!680192)))

(assert (=> b!1197326 (= c!117387 (validKeyInArray!0 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197327 () Bool)

(assert (=> b!1197327 (= e!680192 call!57246)))

(declare-fun b!1197328 () Bool)

(assert (=> b!1197328 (= e!680192 call!57246)))

(declare-fun b!1197329 () Bool)

(assert (=> b!1197329 (= e!680194 e!680195)))

(declare-fun res!796818 () Bool)

(assert (=> b!1197329 (=> (not res!796818) (not e!680195))))

(assert (=> b!1197329 (= res!796818 (not e!680193))))

(declare-fun res!796816 () Bool)

(assert (=> b!1197329 (=> (not res!796816) (not e!680193))))

(assert (=> b!1197329 (= res!796816 (validKeyInArray!0 (select (arr!37386 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132233 (not res!796817)) b!1197329))

(assert (= (and b!1197329 res!796816) b!1197325))

(assert (= (and b!1197329 res!796818) b!1197326))

(assert (= (and b!1197326 c!117387) b!1197328))

(assert (= (and b!1197326 (not c!117387)) b!1197327))

(assert (= (or b!1197328 b!1197327) bm!57243))

(assert (=> b!1197325 m!1103827))

(assert (=> b!1197325 m!1103827))

(declare-fun m!1103913 () Bool)

(assert (=> b!1197325 m!1103913))

(assert (=> bm!57243 m!1103827))

(declare-fun m!1103915 () Bool)

(assert (=> bm!57243 m!1103915))

(assert (=> b!1197326 m!1103827))

(assert (=> b!1197326 m!1103827))

(assert (=> b!1197326 m!1103843))

(assert (=> b!1197329 m!1103827))

(assert (=> b!1197329 m!1103827))

(assert (=> b!1197329 m!1103843))

(assert (=> b!1197098 d!132233))

(declare-fun condMapEmpty!47423 () Bool)

(declare-fun mapDefault!47423 () ValueCell!14483)

(assert (=> mapNonEmpty!47414 (= condMapEmpty!47423 (= mapRest!47414 ((as const (Array (_ BitVec 32) ValueCell!14483)) mapDefault!47423)))))

(declare-fun e!680200 () Bool)

(declare-fun mapRes!47423 () Bool)

(assert (=> mapNonEmpty!47414 (= tp!90063 (and e!680200 mapRes!47423))))

(declare-fun mapIsEmpty!47423 () Bool)

(assert (=> mapIsEmpty!47423 mapRes!47423))

(declare-fun b!1197337 () Bool)

(assert (=> b!1197337 (= e!680200 tp_is_empty!30385)))

(declare-fun mapNonEmpty!47423 () Bool)

(declare-fun tp!90078 () Bool)

(declare-fun e!680201 () Bool)

(assert (=> mapNonEmpty!47423 (= mapRes!47423 (and tp!90078 e!680201))))

(declare-fun mapValue!47423 () ValueCell!14483)

(declare-fun mapKey!47423 () (_ BitVec 32))

(declare-fun mapRest!47423 () (Array (_ BitVec 32) ValueCell!14483))

(assert (=> mapNonEmpty!47423 (= mapRest!47414 (store mapRest!47423 mapKey!47423 mapValue!47423))))

(declare-fun b!1197336 () Bool)

(assert (=> b!1197336 (= e!680201 tp_is_empty!30385)))

(assert (= (and mapNonEmpty!47414 condMapEmpty!47423) mapIsEmpty!47423))

(assert (= (and mapNonEmpty!47414 (not condMapEmpty!47423)) mapNonEmpty!47423))

(assert (= (and mapNonEmpty!47423 ((_ is ValueCellFull!14483) mapValue!47423)) b!1197336))

(assert (= (and mapNonEmpty!47414 ((_ is ValueCellFull!14483) mapDefault!47423)) b!1197337))

(declare-fun m!1103917 () Bool)

(assert (=> mapNonEmpty!47423 m!1103917))

(declare-fun b_lambda!20865 () Bool)

(assert (= b_lambda!20859 (or (and start!100312 b_free!25705) b_lambda!20865)))

(declare-fun b_lambda!20867 () Bool)

(assert (= b_lambda!20851 (or (and start!100312 b_free!25705) b_lambda!20867)))

(declare-fun b_lambda!20869 () Bool)

(assert (= b_lambda!20849 (or (and start!100312 b_free!25705) b_lambda!20869)))

(declare-fun b_lambda!20871 () Bool)

(assert (= b_lambda!20861 (or (and start!100312 b_free!25705) b_lambda!20871)))

(declare-fun b_lambda!20873 () Bool)

(assert (= b_lambda!20863 (or (and start!100312 b_free!25705) b_lambda!20873)))

(declare-fun b_lambda!20875 () Bool)

(assert (= b_lambda!20847 (or (and start!100312 b_free!25705) b_lambda!20875)))

(declare-fun b_lambda!20877 () Bool)

(assert (= b_lambda!20857 (or (and start!100312 b_free!25705) b_lambda!20877)))

(declare-fun b_lambda!20879 () Bool)

(assert (= b_lambda!20855 (or (and start!100312 b_free!25705) b_lambda!20879)))

(declare-fun b_lambda!20881 () Bool)

(assert (= b_lambda!20853 (or (and start!100312 b_free!25705) b_lambda!20881)))

(check-sat (not b!1197268) (not b!1197292) (not b_lambda!20867) (not d!132205) (not bm!57242) (not b!1197303) (not b!1197300) (not b!1197265) (not b!1197325) (not b!1197221) (not b!1197250) (not b!1197290) (not b!1197286) (not b!1197218) (not b!1197299) (not d!132231) (not d!132229) (not b!1197287) (not d!132211) (not bm!57233) (not mapNonEmpty!47423) (not b!1197262) (not b!1197266) (not b_lambda!20843) (not b!1197257) (not bm!57226) (not b_lambda!20873) (not d!132215) (not bm!57234) (not b!1197312) (not b!1197267) (not b!1197304) (not b!1197256) (not b!1197315) (not b!1197296) (not b_lambda!20869) (not b!1197246) (not b!1197329) (not b_lambda!20845) (not bm!57229) (not b!1197293) (not b!1197291) (not b!1197275) (not b!1197302) (not b!1197253) (not b!1197308) (not b!1197254) (not b_lambda!20881) (not b_lambda!20877) tp_is_empty!30385 (not bm!57230) (not bm!57241) (not b_lambda!20871) (not b!1197313) (not b!1197217) (not b_lambda!20865) (not b!1197247) (not b_lambda!20879) b_and!42289 (not d!132221) (not b!1197324) (not d!132227) (not b!1197311) (not b!1197258) (not b!1197255) (not bm!57236) (not b!1197269) (not b!1197259) (not bm!57235) (not bm!57243) (not b!1197314) (not b!1197305) (not b_next!25705) (not b!1197326) (not b_lambda!20875) (not b!1197301))
(check-sat b_and!42289 (not b_next!25705))
