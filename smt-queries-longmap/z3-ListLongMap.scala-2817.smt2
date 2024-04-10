; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40814 () Bool)

(assert start!40814)

(declare-fun b_free!10803 () Bool)

(declare-fun b_next!10803 () Bool)

(assert (=> start!40814 (= b_free!10803 (not b_next!10803))))

(declare-fun tp!38232 () Bool)

(declare-fun b_and!18893 () Bool)

(assert (=> start!40814 (= tp!38232 b_and!18893)))

(declare-fun e!265199 () Bool)

(declare-fun b!453061 () Bool)

(declare-datatypes ((V!17293 0))(
  ( (V!17294 (val!6115 Int)) )
))
(declare-datatypes ((tuple2!8056 0))(
  ( (tuple2!8057 (_1!4039 (_ BitVec 64)) (_2!4039 V!17293)) )
))
(declare-datatypes ((List!8113 0))(
  ( (Nil!8110) (Cons!8109 (h!8965 tuple2!8056) (t!13939 List!8113)) )
))
(declare-datatypes ((ListLongMap!6969 0))(
  ( (ListLongMap!6970 (toList!3500 List!8113)) )
))
(declare-fun call!30022 () ListLongMap!6969)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!30023 () ListLongMap!6969)

(declare-fun v!412 () V!17293)

(declare-fun +!1576 (ListLongMap!6969 tuple2!8056) ListLongMap!6969)

(assert (=> b!453061 (= e!265199 (= call!30023 (+!1576 call!30022 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453063 () Bool)

(declare-fun res!269930 () Bool)

(declare-fun e!265201 () Bool)

(assert (=> b!453063 (=> (not res!269930) (not e!265201))))

(declare-datatypes ((array!28089 0))(
  ( (array!28090 (arr!13489 (Array (_ BitVec 32) (_ BitVec 64))) (size!13841 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28089)

(declare-datatypes ((List!8114 0))(
  ( (Nil!8111) (Cons!8110 (h!8966 (_ BitVec 64)) (t!13940 List!8114)) )
))
(declare-fun arrayNoDuplicates!0 (array!28089 (_ BitVec 32) List!8114) Bool)

(assert (=> b!453063 (= res!269930 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8111))))

(declare-fun b!453064 () Bool)

(declare-fun res!269934 () Bool)

(assert (=> b!453064 (=> (not res!269934) (not e!265201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453064 (= res!269934 (validKeyInArray!0 k0!794))))

(declare-fun b!453065 () Bool)

(declare-fun e!265196 () Bool)

(declare-fun e!265202 () Bool)

(assert (=> b!453065 (= e!265196 e!265202)))

(declare-fun res!269927 () Bool)

(assert (=> b!453065 (=> (not res!269927) (not e!265202))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453065 (= res!269927 (= from!863 i!563))))

(declare-fun minValue!515 () V!17293)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!205586 () ListLongMap!6969)

(declare-datatypes ((ValueCell!5727 0))(
  ( (ValueCellFull!5727 (v!8374 V!17293)) (EmptyCell!5727) )
))
(declare-datatypes ((array!28091 0))(
  ( (array!28092 (arr!13490 (Array (_ BitVec 32) ValueCell!5727)) (size!13842 (_ BitVec 32))) )
))
(declare-fun lt!205593 () array!28091)

(declare-fun zeroValue!515 () V!17293)

(declare-fun lt!205595 () array!28089)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1683 (array!28089 array!28091 (_ BitVec 32) (_ BitVec 32) V!17293 V!17293 (_ BitVec 32) Int) ListLongMap!6969)

(assert (=> b!453065 (= lt!205586 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28091)

(assert (=> b!453065 (= lt!205593 (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)))))

(declare-fun lt!205592 () ListLongMap!6969)

(assert (=> b!453065 (= lt!205592 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun e!265197 () Bool)

(declare-fun b!453066 () Bool)

(assert (=> b!453066 (= e!265197 (= lt!205586 (+!1576 lt!205592 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205585 () ListLongMap!6969)

(declare-fun lt!205587 () V!17293)

(declare-fun lt!205594 () tuple2!8056)

(assert (=> b!453066 (= (+!1576 lt!205585 lt!205594) (+!1576 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) lt!205594))))

(declare-fun lt!205589 () V!17293)

(assert (=> b!453066 (= lt!205594 (tuple2!8057 k0!794 lt!205589))))

(declare-datatypes ((Unit!13248 0))(
  ( (Unit!13249) )
))
(declare-fun lt!205591 () Unit!13248)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!87 (ListLongMap!6969 (_ BitVec 64) V!17293 V!17293) Unit!13248)

(assert (=> b!453066 (= lt!205591 (addSameAsAddTwiceSameKeyDiffValues!87 lt!205585 k0!794 lt!205587 lt!205589))))

(declare-fun lt!205588 () V!17293)

(declare-fun get!6653 (ValueCell!5727 V!17293) V!17293)

(assert (=> b!453066 (= lt!205587 (get!6653 (select (arr!13490 _values!549) from!863) lt!205588))))

(assert (=> b!453066 (= lt!205586 (+!1576 lt!205585 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))

(assert (=> b!453066 (= lt!205589 (get!6653 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588))))

(declare-fun dynLambda!874 (Int (_ BitVec 64)) V!17293)

(assert (=> b!453066 (= lt!205588 (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453066 (= lt!205585 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453067 () Bool)

(declare-fun res!269931 () Bool)

(assert (=> b!453067 (=> (not res!269931) (not e!265201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28089 (_ BitVec 32)) Bool)

(assert (=> b!453067 (= res!269931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!30019 () Bool)

(declare-fun c!56153 () Bool)

(assert (=> bm!30019 (= call!30023 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453068 () Bool)

(declare-fun e!265194 () Bool)

(declare-fun tp_is_empty!12141 () Bool)

(assert (=> b!453068 (= e!265194 tp_is_empty!12141)))

(declare-fun res!269939 () Bool)

(assert (=> start!40814 (=> (not res!269939) (not e!265201))))

(assert (=> start!40814 (= res!269939 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13841 _keys!709))))))

(assert (=> start!40814 e!265201))

(assert (=> start!40814 tp_is_empty!12141))

(assert (=> start!40814 tp!38232))

(assert (=> start!40814 true))

(declare-fun e!265195 () Bool)

(declare-fun array_inv!9770 (array!28091) Bool)

(assert (=> start!40814 (and (array_inv!9770 _values!549) e!265195)))

(declare-fun array_inv!9771 (array!28089) Bool)

(assert (=> start!40814 (array_inv!9771 _keys!709)))

(declare-fun b!453062 () Bool)

(assert (=> b!453062 (= e!265202 (not e!265197))))

(declare-fun res!269937 () Bool)

(assert (=> b!453062 (=> res!269937 e!265197)))

(assert (=> b!453062 (= res!269937 (validKeyInArray!0 (select (arr!13489 _keys!709) from!863)))))

(assert (=> b!453062 e!265199))

(assert (=> b!453062 (= c!56153 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205590 () Unit!13248)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!736 (array!28089 array!28091 (_ BitVec 32) (_ BitVec 32) V!17293 V!17293 (_ BitVec 32) (_ BitVec 64) V!17293 (_ BitVec 32) Int) Unit!13248)

(assert (=> b!453062 (= lt!205590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453069 () Bool)

(declare-fun res!269936 () Bool)

(assert (=> b!453069 (=> (not res!269936) (not e!265201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453069 (= res!269936 (validMask!0 mask!1025))))

(declare-fun b!453070 () Bool)

(declare-fun res!269926 () Bool)

(assert (=> b!453070 (=> (not res!269926) (not e!265201))))

(assert (=> b!453070 (= res!269926 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13841 _keys!709))))))

(declare-fun b!453071 () Bool)

(declare-fun e!265198 () Bool)

(assert (=> b!453071 (= e!265198 tp_is_empty!12141)))

(declare-fun b!453072 () Bool)

(assert (=> b!453072 (= e!265201 e!265196)))

(declare-fun res!269928 () Bool)

(assert (=> b!453072 (=> (not res!269928) (not e!265196))))

(assert (=> b!453072 (= res!269928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205595 mask!1025))))

(assert (=> b!453072 (= lt!205595 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))

(declare-fun b!453073 () Bool)

(declare-fun res!269935 () Bool)

(assert (=> b!453073 (=> (not res!269935) (not e!265201))))

(declare-fun arrayContainsKey!0 (array!28089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453073 (= res!269935 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!453074 () Bool)

(declare-fun res!269932 () Bool)

(assert (=> b!453074 (=> (not res!269932) (not e!265201))))

(assert (=> b!453074 (= res!269932 (and (= (size!13842 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13841 _keys!709) (size!13842 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453075 () Bool)

(declare-fun res!269938 () Bool)

(assert (=> b!453075 (=> (not res!269938) (not e!265201))))

(assert (=> b!453075 (= res!269938 (or (= (select (arr!13489 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13489 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30020 () Bool)

(assert (=> bm!30020 (= call!30022 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19848 () Bool)

(declare-fun mapRes!19848 () Bool)

(assert (=> mapIsEmpty!19848 mapRes!19848))

(declare-fun b!453076 () Bool)

(assert (=> b!453076 (= e!265199 (= call!30022 call!30023))))

(declare-fun b!453077 () Bool)

(declare-fun res!269933 () Bool)

(assert (=> b!453077 (=> (not res!269933) (not e!265196))))

(assert (=> b!453077 (= res!269933 (bvsle from!863 i!563))))

(declare-fun b!453078 () Bool)

(declare-fun res!269929 () Bool)

(assert (=> b!453078 (=> (not res!269929) (not e!265196))))

(assert (=> b!453078 (= res!269929 (arrayNoDuplicates!0 lt!205595 #b00000000000000000000000000000000 Nil!8111))))

(declare-fun b!453079 () Bool)

(assert (=> b!453079 (= e!265195 (and e!265194 mapRes!19848))))

(declare-fun condMapEmpty!19848 () Bool)

(declare-fun mapDefault!19848 () ValueCell!5727)

(assert (=> b!453079 (= condMapEmpty!19848 (= (arr!13490 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5727)) mapDefault!19848)))))

(declare-fun mapNonEmpty!19848 () Bool)

(declare-fun tp!38231 () Bool)

(assert (=> mapNonEmpty!19848 (= mapRes!19848 (and tp!38231 e!265198))))

(declare-fun mapKey!19848 () (_ BitVec 32))

(declare-fun mapValue!19848 () ValueCell!5727)

(declare-fun mapRest!19848 () (Array (_ BitVec 32) ValueCell!5727))

(assert (=> mapNonEmpty!19848 (= (arr!13490 _values!549) (store mapRest!19848 mapKey!19848 mapValue!19848))))

(assert (= (and start!40814 res!269939) b!453069))

(assert (= (and b!453069 res!269936) b!453074))

(assert (= (and b!453074 res!269932) b!453067))

(assert (= (and b!453067 res!269931) b!453063))

(assert (= (and b!453063 res!269930) b!453070))

(assert (= (and b!453070 res!269926) b!453064))

(assert (= (and b!453064 res!269934) b!453075))

(assert (= (and b!453075 res!269938) b!453073))

(assert (= (and b!453073 res!269935) b!453072))

(assert (= (and b!453072 res!269928) b!453078))

(assert (= (and b!453078 res!269929) b!453077))

(assert (= (and b!453077 res!269933) b!453065))

(assert (= (and b!453065 res!269927) b!453062))

(assert (= (and b!453062 c!56153) b!453061))

(assert (= (and b!453062 (not c!56153)) b!453076))

(assert (= (or b!453061 b!453076) bm!30019))

(assert (= (or b!453061 b!453076) bm!30020))

(assert (= (and b!453062 (not res!269937)) b!453066))

(assert (= (and b!453079 condMapEmpty!19848) mapIsEmpty!19848))

(assert (= (and b!453079 (not condMapEmpty!19848)) mapNonEmpty!19848))

(get-info :version)

(assert (= (and mapNonEmpty!19848 ((_ is ValueCellFull!5727) mapValue!19848)) b!453071))

(assert (= (and b!453079 ((_ is ValueCellFull!5727) mapDefault!19848)) b!453068))

(assert (= start!40814 b!453079))

(declare-fun b_lambda!9581 () Bool)

(assert (=> (not b_lambda!9581) (not b!453066)))

(declare-fun t!13938 () Bool)

(declare-fun tb!3783 () Bool)

(assert (=> (and start!40814 (= defaultEntry!557 defaultEntry!557) t!13938) tb!3783))

(declare-fun result!7103 () Bool)

(assert (=> tb!3783 (= result!7103 tp_is_empty!12141)))

(assert (=> b!453066 t!13938))

(declare-fun b_and!18895 () Bool)

(assert (= b_and!18893 (and (=> t!13938 result!7103) b_and!18895)))

(declare-fun m!436855 () Bool)

(assert (=> b!453072 m!436855))

(declare-fun m!436857 () Bool)

(assert (=> b!453072 m!436857))

(declare-fun m!436859 () Bool)

(assert (=> b!453066 m!436859))

(declare-fun m!436861 () Bool)

(assert (=> b!453066 m!436861))

(declare-fun m!436863 () Bool)

(assert (=> b!453066 m!436863))

(declare-fun m!436865 () Bool)

(assert (=> b!453066 m!436865))

(declare-fun m!436867 () Bool)

(assert (=> b!453066 m!436867))

(declare-fun m!436869 () Bool)

(assert (=> b!453066 m!436869))

(declare-fun m!436871 () Bool)

(assert (=> b!453066 m!436871))

(declare-fun m!436873 () Bool)

(assert (=> b!453066 m!436873))

(assert (=> b!453066 m!436871))

(assert (=> b!453066 m!436861))

(declare-fun m!436875 () Bool)

(assert (=> b!453066 m!436875))

(declare-fun m!436877 () Bool)

(assert (=> b!453066 m!436877))

(declare-fun m!436879 () Bool)

(assert (=> b!453066 m!436879))

(declare-fun m!436881 () Bool)

(assert (=> b!453066 m!436881))

(assert (=> b!453066 m!436877))

(declare-fun m!436883 () Bool)

(assert (=> b!453066 m!436883))

(declare-fun m!436885 () Bool)

(assert (=> b!453066 m!436885))

(declare-fun m!436887 () Bool)

(assert (=> start!40814 m!436887))

(declare-fun m!436889 () Bool)

(assert (=> start!40814 m!436889))

(declare-fun m!436891 () Bool)

(assert (=> b!453069 m!436891))

(declare-fun m!436893 () Bool)

(assert (=> b!453062 m!436893))

(assert (=> b!453062 m!436893))

(declare-fun m!436895 () Bool)

(assert (=> b!453062 m!436895))

(declare-fun m!436897 () Bool)

(assert (=> b!453062 m!436897))

(declare-fun m!436899 () Bool)

(assert (=> b!453061 m!436899))

(declare-fun m!436901 () Bool)

(assert (=> b!453073 m!436901))

(declare-fun m!436903 () Bool)

(assert (=> b!453063 m!436903))

(declare-fun m!436905 () Bool)

(assert (=> bm!30020 m!436905))

(declare-fun m!436907 () Bool)

(assert (=> b!453065 m!436907))

(assert (=> b!453065 m!436869))

(declare-fun m!436909 () Bool)

(assert (=> b!453065 m!436909))

(declare-fun m!436911 () Bool)

(assert (=> mapNonEmpty!19848 m!436911))

(declare-fun m!436913 () Bool)

(assert (=> bm!30019 m!436913))

(declare-fun m!436915 () Bool)

(assert (=> b!453078 m!436915))

(declare-fun m!436917 () Bool)

(assert (=> b!453064 m!436917))

(declare-fun m!436919 () Bool)

(assert (=> b!453067 m!436919))

(declare-fun m!436921 () Bool)

(assert (=> b!453075 m!436921))

(check-sat (not b!453069) (not bm!30020) (not b!453072) tp_is_empty!12141 (not mapNonEmpty!19848) (not b!453078) (not b!453064) (not bm!30019) (not b!453062) (not b!453063) (not b!453066) (not start!40814) (not b!453065) b_and!18895 (not b_next!10803) (not b!453067) (not b!453073) (not b_lambda!9581) (not b!453061))
(check-sat b_and!18895 (not b_next!10803))
(get-model)

(declare-fun b_lambda!9585 () Bool)

(assert (= b_lambda!9581 (or (and start!40814 b_free!10803) b_lambda!9585)))

(check-sat (not b!453069) (not bm!30020) (not b!453072) tp_is_empty!12141 (not mapNonEmpty!19848) (not b!453078) (not b!453064) (not bm!30019) (not b!453062) (not b!453063) (not b!453066) (not start!40814) (not b!453065) b_and!18895 (not b_next!10803) (not b_lambda!9585) (not b!453067) (not b!453073) (not b!453061))
(check-sat b_and!18895 (not b_next!10803))
(get-model)

(declare-fun b!453151 () Bool)

(declare-fun e!265238 () Bool)

(declare-fun call!30032 () Bool)

(assert (=> b!453151 (= e!265238 call!30032)))

(declare-fun b!453152 () Bool)

(declare-fun e!265239 () Bool)

(assert (=> b!453152 (= e!265239 e!265238)))

(declare-fun c!56159 () Bool)

(assert (=> b!453152 (= c!56159 (validKeyInArray!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun d!74321 () Bool)

(declare-fun res!269990 () Bool)

(declare-fun e!265240 () Bool)

(assert (=> d!74321 (=> res!269990 e!265240)))

(assert (=> d!74321 (= res!269990 (bvsge #b00000000000000000000000000000000 (size!13841 lt!205595)))))

(assert (=> d!74321 (= (arrayNoDuplicates!0 lt!205595 #b00000000000000000000000000000000 Nil!8111) e!265240)))

(declare-fun b!453153 () Bool)

(declare-fun e!265241 () Bool)

(declare-fun contains!2497 (List!8114 (_ BitVec 64)) Bool)

(assert (=> b!453153 (= e!265241 (contains!2497 Nil!8111 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun b!453154 () Bool)

(assert (=> b!453154 (= e!265238 call!30032)))

(declare-fun bm!30029 () Bool)

(assert (=> bm!30029 (= call!30032 (arrayNoDuplicates!0 lt!205595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56159 (Cons!8110 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) Nil!8111) Nil!8111)))))

(declare-fun b!453155 () Bool)

(assert (=> b!453155 (= e!265240 e!265239)))

(declare-fun res!269989 () Bool)

(assert (=> b!453155 (=> (not res!269989) (not e!265239))))

(assert (=> b!453155 (= res!269989 (not e!265241))))

(declare-fun res!269988 () Bool)

(assert (=> b!453155 (=> (not res!269988) (not e!265241))))

(assert (=> b!453155 (= res!269988 (validKeyInArray!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(assert (= (and d!74321 (not res!269990)) b!453155))

(assert (= (and b!453155 res!269988) b!453153))

(assert (= (and b!453155 res!269989) b!453152))

(assert (= (and b!453152 c!56159) b!453154))

(assert (= (and b!453152 (not c!56159)) b!453151))

(assert (= (or b!453154 b!453151) bm!30029))

(declare-fun m!436991 () Bool)

(assert (=> b!453152 m!436991))

(assert (=> b!453152 m!436991))

(declare-fun m!436993 () Bool)

(assert (=> b!453152 m!436993))

(assert (=> b!453153 m!436991))

(assert (=> b!453153 m!436991))

(declare-fun m!436995 () Bool)

(assert (=> b!453153 m!436995))

(assert (=> bm!30029 m!436991))

(declare-fun m!436997 () Bool)

(assert (=> bm!30029 m!436997))

(assert (=> b!453155 m!436991))

(assert (=> b!453155 m!436991))

(assert (=> b!453155 m!436993))

(assert (=> b!453078 d!74321))

(declare-fun d!74323 () Bool)

(assert (=> d!74323 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!453069 d!74323))

(declare-fun d!74325 () Bool)

(declare-fun e!265244 () Bool)

(assert (=> d!74325 e!265244))

(declare-fun res!269996 () Bool)

(assert (=> d!74325 (=> (not res!269996) (not e!265244))))

(declare-fun lt!205640 () ListLongMap!6969)

(declare-fun contains!2498 (ListLongMap!6969 (_ BitVec 64)) Bool)

(assert (=> d!74325 (= res!269996 (contains!2498 lt!205640 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205638 () List!8113)

(assert (=> d!74325 (= lt!205640 (ListLongMap!6970 lt!205638))))

(declare-fun lt!205639 () Unit!13248)

(declare-fun lt!205637 () Unit!13248)

(assert (=> d!74325 (= lt!205639 lt!205637)))

(declare-datatypes ((Option!376 0))(
  ( (Some!375 (v!8379 V!17293)) (None!374) )
))
(declare-fun getValueByKey!370 (List!8113 (_ BitVec 64)) Option!376)

(assert (=> d!74325 (= (getValueByKey!370 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!192 (List!8113 (_ BitVec 64) V!17293) Unit!13248)

(assert (=> d!74325 (= lt!205637 (lemmaContainsTupThenGetReturnValue!192 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun insertStrictlySorted!195 (List!8113 (_ BitVec 64) V!17293) List!8113)

(assert (=> d!74325 (= lt!205638 (insertStrictlySorted!195 (toList!3500 call!30022) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74325 (= (+!1576 call!30022 (tuple2!8057 k0!794 v!412)) lt!205640)))

(declare-fun b!453160 () Bool)

(declare-fun res!269995 () Bool)

(assert (=> b!453160 (=> (not res!269995) (not e!265244))))

(assert (=> b!453160 (= res!269995 (= (getValueByKey!370 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun b!453161 () Bool)

(declare-fun contains!2499 (List!8113 tuple2!8056) Bool)

(assert (=> b!453161 (= e!265244 (contains!2499 (toList!3500 lt!205640) (tuple2!8057 k0!794 v!412)))))

(assert (= (and d!74325 res!269996) b!453160))

(assert (= (and b!453160 res!269995) b!453161))

(declare-fun m!436999 () Bool)

(assert (=> d!74325 m!436999))

(declare-fun m!437001 () Bool)

(assert (=> d!74325 m!437001))

(declare-fun m!437003 () Bool)

(assert (=> d!74325 m!437003))

(declare-fun m!437005 () Bool)

(assert (=> d!74325 m!437005))

(declare-fun m!437007 () Bool)

(assert (=> b!453160 m!437007))

(declare-fun m!437009 () Bool)

(assert (=> b!453161 m!437009))

(assert (=> b!453061 d!74325))

(declare-fun b!453186 () Bool)

(declare-fun lt!205661 () Unit!13248)

(declare-fun lt!205659 () Unit!13248)

(assert (=> b!453186 (= lt!205661 lt!205659)))

(declare-fun lt!205657 () (_ BitVec 64))

(declare-fun lt!205660 () (_ BitVec 64))

(declare-fun lt!205656 () V!17293)

(declare-fun lt!205658 () ListLongMap!6969)

(assert (=> b!453186 (not (contains!2498 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656)) lt!205660))))

(declare-fun addStillNotContains!146 (ListLongMap!6969 (_ BitVec 64) V!17293 (_ BitVec 64)) Unit!13248)

(assert (=> b!453186 (= lt!205659 (addStillNotContains!146 lt!205658 lt!205657 lt!205656 lt!205660))))

(assert (=> b!453186 (= lt!205660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453186 (= lt!205656 (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453186 (= lt!205657 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30035 () ListLongMap!6969)

(assert (=> b!453186 (= lt!205658 call!30035)))

(declare-fun e!265259 () ListLongMap!6969)

(assert (=> b!453186 (= e!265259 (+!1576 call!30035 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453187 () Bool)

(declare-fun e!265265 () ListLongMap!6969)

(assert (=> b!453187 (= e!265265 e!265259)))

(declare-fun c!56171 () Bool)

(assert (=> b!453187 (= c!56171 (validKeyInArray!0 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453188 () Bool)

(declare-fun e!265260 () Bool)

(declare-fun e!265262 () Bool)

(assert (=> b!453188 (= e!265260 e!265262)))

(declare-fun c!56168 () Bool)

(assert (=> b!453188 (= c!56168 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun b!453189 () Bool)

(declare-fun res!270007 () Bool)

(declare-fun e!265263 () Bool)

(assert (=> b!453189 (=> (not res!270007) (not e!265263))))

(declare-fun lt!205655 () ListLongMap!6969)

(assert (=> b!453189 (= res!270007 (not (contains!2498 lt!205655 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453190 () Bool)

(declare-fun isEmpty!559 (ListLongMap!6969) Bool)

(assert (=> b!453190 (= e!265262 (isEmpty!559 lt!205655))))

(declare-fun b!453191 () Bool)

(assert (=> b!453191 (= e!265259 call!30035)))

(declare-fun b!453192 () Bool)

(assert (=> b!453192 (= e!265263 e!265260)))

(declare-fun c!56169 () Bool)

(declare-fun e!265264 () Bool)

(assert (=> b!453192 (= c!56169 e!265264)))

(declare-fun res!270006 () Bool)

(assert (=> b!453192 (=> (not res!270006) (not e!265264))))

(assert (=> b!453192 (= res!270006 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun b!453193 () Bool)

(assert (=> b!453193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(assert (=> b!453193 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13842 (ite c!56153 lt!205593 _values!549))))))

(declare-fun e!265261 () Bool)

(declare-fun apply!313 (ListLongMap!6969 (_ BitVec 64)) V!17293)

(assert (=> b!453193 (= e!265261 (= (apply!313 lt!205655 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453194 () Bool)

(assert (=> b!453194 (= e!265260 e!265261)))

(assert (=> b!453194 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun res!270005 () Bool)

(assert (=> b!453194 (= res!270005 (contains!2498 lt!205655 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453194 (=> (not res!270005) (not e!265261))))

(declare-fun bm!30032 () Bool)

(assert (=> bm!30032 (= call!30035 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74327 () Bool)

(assert (=> d!74327 e!265263))

(declare-fun res!270008 () Bool)

(assert (=> d!74327 (=> (not res!270008) (not e!265263))))

(assert (=> d!74327 (= res!270008 (not (contains!2498 lt!205655 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74327 (= lt!205655 e!265265)))

(declare-fun c!56170 () Bool)

(assert (=> d!74327 (= c!56170 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(assert (=> d!74327 (validMask!0 mask!1025)))

(assert (=> d!74327 (= (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205655)))

(declare-fun b!453195 () Bool)

(assert (=> b!453195 (= e!265265 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453196 () Bool)

(assert (=> b!453196 (= e!265264 (validKeyInArray!0 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453196 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453197 () Bool)

(assert (=> b!453197 (= e!265262 (= lt!205655 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74327 c!56170) b!453195))

(assert (= (and d!74327 (not c!56170)) b!453187))

(assert (= (and b!453187 c!56171) b!453186))

(assert (= (and b!453187 (not c!56171)) b!453191))

(assert (= (or b!453186 b!453191) bm!30032))

(assert (= (and d!74327 res!270008) b!453189))

(assert (= (and b!453189 res!270007) b!453192))

(assert (= (and b!453192 res!270006) b!453196))

(assert (= (and b!453192 c!56169) b!453194))

(assert (= (and b!453192 (not c!56169)) b!453188))

(assert (= (and b!453194 res!270005) b!453193))

(assert (= (and b!453188 c!56168) b!453197))

(assert (= (and b!453188 (not c!56168)) b!453190))

(declare-fun b_lambda!9587 () Bool)

(assert (=> (not b_lambda!9587) (not b!453186)))

(assert (=> b!453186 t!13938))

(declare-fun b_and!18901 () Bool)

(assert (= b_and!18895 (and (=> t!13938 result!7103) b_and!18901)))

(declare-fun b_lambda!9589 () Bool)

(assert (=> (not b_lambda!9589) (not b!453193)))

(assert (=> b!453193 t!13938))

(declare-fun b_and!18903 () Bool)

(assert (= b_and!18901 (and (=> t!13938 result!7103) b_and!18903)))

(declare-fun m!437011 () Bool)

(assert (=> bm!30032 m!437011))

(declare-fun m!437013 () Bool)

(assert (=> b!453189 m!437013))

(assert (=> b!453197 m!437011))

(declare-fun m!437015 () Bool)

(assert (=> d!74327 m!437015))

(assert (=> d!74327 m!436891))

(declare-fun m!437017 () Bool)

(assert (=> b!453187 m!437017))

(assert (=> b!453187 m!437017))

(declare-fun m!437019 () Bool)

(assert (=> b!453187 m!437019))

(assert (=> b!453194 m!437017))

(assert (=> b!453194 m!437017))

(declare-fun m!437021 () Bool)

(assert (=> b!453194 m!437021))

(declare-fun m!437023 () Bool)

(assert (=> b!453190 m!437023))

(declare-fun m!437025 () Bool)

(assert (=> b!453186 m!437025))

(declare-fun m!437027 () Bool)

(assert (=> b!453186 m!437027))

(declare-fun m!437029 () Bool)

(assert (=> b!453186 m!437029))

(assert (=> b!453186 m!437025))

(declare-fun m!437031 () Bool)

(assert (=> b!453186 m!437031))

(assert (=> b!453186 m!437029))

(assert (=> b!453186 m!436867))

(declare-fun m!437033 () Bool)

(assert (=> b!453186 m!437033))

(assert (=> b!453186 m!436867))

(assert (=> b!453186 m!437017))

(declare-fun m!437035 () Bool)

(assert (=> b!453186 m!437035))

(assert (=> b!453196 m!437017))

(assert (=> b!453196 m!437017))

(assert (=> b!453196 m!437019))

(assert (=> b!453193 m!437017))

(assert (=> b!453193 m!437029))

(assert (=> b!453193 m!437029))

(assert (=> b!453193 m!436867))

(assert (=> b!453193 m!437033))

(assert (=> b!453193 m!437017))

(declare-fun m!437037 () Bool)

(assert (=> b!453193 m!437037))

(assert (=> b!453193 m!436867))

(assert (=> bm!30019 d!74327))

(declare-fun bm!30035 () Bool)

(declare-fun call!30038 () Bool)

(assert (=> bm!30035 (= call!30038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!453206 () Bool)

(declare-fun e!265272 () Bool)

(assert (=> b!453206 (= e!265272 call!30038)))

(declare-fun d!74329 () Bool)

(declare-fun res!270014 () Bool)

(declare-fun e!265274 () Bool)

(assert (=> d!74329 (=> res!270014 e!265274)))

(assert (=> d!74329 (= res!270014 (bvsge #b00000000000000000000000000000000 (size!13841 _keys!709)))))

(assert (=> d!74329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!265274)))

(declare-fun b!453207 () Bool)

(declare-fun e!265273 () Bool)

(assert (=> b!453207 (= e!265273 call!30038)))

(declare-fun b!453208 () Bool)

(assert (=> b!453208 (= e!265274 e!265272)))

(declare-fun c!56174 () Bool)

(assert (=> b!453208 (= c!56174 (validKeyInArray!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453209 () Bool)

(assert (=> b!453209 (= e!265272 e!265273)))

(declare-fun lt!205669 () (_ BitVec 64))

(assert (=> b!453209 (= lt!205669 (select (arr!13489 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!205668 () Unit!13248)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28089 (_ BitVec 64) (_ BitVec 32)) Unit!13248)

(assert (=> b!453209 (= lt!205668 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205669 #b00000000000000000000000000000000))))

(assert (=> b!453209 (arrayContainsKey!0 _keys!709 lt!205669 #b00000000000000000000000000000000)))

(declare-fun lt!205670 () Unit!13248)

(assert (=> b!453209 (= lt!205670 lt!205668)))

(declare-fun res!270013 () Bool)

(declare-datatypes ((SeekEntryResult!3532 0))(
  ( (MissingZero!3532 (index!16307 (_ BitVec 32))) (Found!3532 (index!16308 (_ BitVec 32))) (Intermediate!3532 (undefined!4344 Bool) (index!16309 (_ BitVec 32)) (x!42461 (_ BitVec 32))) (Undefined!3532) (MissingVacant!3532 (index!16310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28089 (_ BitVec 32)) SeekEntryResult!3532)

(assert (=> b!453209 (= res!270013 (= (seekEntryOrOpen!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3532 #b00000000000000000000000000000000)))))

(assert (=> b!453209 (=> (not res!270013) (not e!265273))))

(assert (= (and d!74329 (not res!270014)) b!453208))

(assert (= (and b!453208 c!56174) b!453209))

(assert (= (and b!453208 (not c!56174)) b!453206))

(assert (= (and b!453209 res!270013) b!453207))

(assert (= (or b!453207 b!453206) bm!30035))

(declare-fun m!437039 () Bool)

(assert (=> bm!30035 m!437039))

(declare-fun m!437041 () Bool)

(assert (=> b!453208 m!437041))

(assert (=> b!453208 m!437041))

(declare-fun m!437043 () Bool)

(assert (=> b!453208 m!437043))

(assert (=> b!453209 m!437041))

(declare-fun m!437045 () Bool)

(assert (=> b!453209 m!437045))

(declare-fun m!437047 () Bool)

(assert (=> b!453209 m!437047))

(assert (=> b!453209 m!437041))

(declare-fun m!437049 () Bool)

(assert (=> b!453209 m!437049))

(assert (=> b!453067 d!74329))

(declare-fun d!74331 () Bool)

(assert (=> d!74331 (= (array_inv!9770 _values!549) (bvsge (size!13842 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40814 d!74331))

(declare-fun d!74333 () Bool)

(assert (=> d!74333 (= (array_inv!9771 _keys!709) (bvsge (size!13841 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40814 d!74333))

(declare-fun b!453210 () Bool)

(declare-fun lt!205677 () Unit!13248)

(declare-fun lt!205675 () Unit!13248)

(assert (=> b!453210 (= lt!205677 lt!205675)))

(declare-fun lt!205673 () (_ BitVec 64))

(declare-fun lt!205676 () (_ BitVec 64))

(declare-fun lt!205674 () ListLongMap!6969)

(declare-fun lt!205672 () V!17293)

(assert (=> b!453210 (not (contains!2498 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672)) lt!205676))))

(assert (=> b!453210 (= lt!205675 (addStillNotContains!146 lt!205674 lt!205673 lt!205672 lt!205676))))

(assert (=> b!453210 (= lt!205676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453210 (= lt!205672 (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453210 (= lt!205673 (select (arr!13489 lt!205595) from!863))))

(declare-fun call!30039 () ListLongMap!6969)

(assert (=> b!453210 (= lt!205674 call!30039)))

(declare-fun e!265275 () ListLongMap!6969)

(assert (=> b!453210 (= e!265275 (+!1576 call!30039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453211 () Bool)

(declare-fun e!265281 () ListLongMap!6969)

(assert (=> b!453211 (= e!265281 e!265275)))

(declare-fun c!56178 () Bool)

(assert (=> b!453211 (= c!56178 (validKeyInArray!0 (select (arr!13489 lt!205595) from!863)))))

(declare-fun b!453212 () Bool)

(declare-fun e!265276 () Bool)

(declare-fun e!265278 () Bool)

(assert (=> b!453212 (= e!265276 e!265278)))

(declare-fun c!56175 () Bool)

(assert (=> b!453212 (= c!56175 (bvslt from!863 (size!13841 lt!205595)))))

(declare-fun b!453213 () Bool)

(declare-fun res!270017 () Bool)

(declare-fun e!265279 () Bool)

(assert (=> b!453213 (=> (not res!270017) (not e!265279))))

(declare-fun lt!205671 () ListLongMap!6969)

(assert (=> b!453213 (= res!270017 (not (contains!2498 lt!205671 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453214 () Bool)

(assert (=> b!453214 (= e!265278 (isEmpty!559 lt!205671))))

(declare-fun b!453215 () Bool)

(assert (=> b!453215 (= e!265275 call!30039)))

(declare-fun b!453216 () Bool)

(assert (=> b!453216 (= e!265279 e!265276)))

(declare-fun c!56176 () Bool)

(declare-fun e!265280 () Bool)

(assert (=> b!453216 (= c!56176 e!265280)))

(declare-fun res!270016 () Bool)

(assert (=> b!453216 (=> (not res!270016) (not e!265280))))

(assert (=> b!453216 (= res!270016 (bvslt from!863 (size!13841 lt!205595)))))

(declare-fun b!453217 () Bool)

(assert (=> b!453217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13841 lt!205595)))))

(assert (=> b!453217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13842 lt!205593)))))

(declare-fun e!265277 () Bool)

(assert (=> b!453217 (= e!265277 (= (apply!313 lt!205671 (select (arr!13489 lt!205595) from!863)) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453218 () Bool)

(assert (=> b!453218 (= e!265276 e!265277)))

(assert (=> b!453218 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13841 lt!205595)))))

(declare-fun res!270015 () Bool)

(assert (=> b!453218 (= res!270015 (contains!2498 lt!205671 (select (arr!13489 lt!205595) from!863)))))

(assert (=> b!453218 (=> (not res!270015) (not e!265277))))

(declare-fun bm!30036 () Bool)

(assert (=> bm!30036 (= call!30039 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74335 () Bool)

(assert (=> d!74335 e!265279))

(declare-fun res!270018 () Bool)

(assert (=> d!74335 (=> (not res!270018) (not e!265279))))

(assert (=> d!74335 (= res!270018 (not (contains!2498 lt!205671 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74335 (= lt!205671 e!265281)))

(declare-fun c!56177 () Bool)

(assert (=> d!74335 (= c!56177 (bvsge from!863 (size!13841 lt!205595)))))

(assert (=> d!74335 (validMask!0 mask!1025)))

(assert (=> d!74335 (= (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205671)))

(declare-fun b!453219 () Bool)

(assert (=> b!453219 (= e!265281 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453220 () Bool)

(assert (=> b!453220 (= e!265280 (validKeyInArray!0 (select (arr!13489 lt!205595) from!863)))))

(assert (=> b!453220 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453221 () Bool)

(assert (=> b!453221 (= e!265278 (= lt!205671 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74335 c!56177) b!453219))

(assert (= (and d!74335 (not c!56177)) b!453211))

(assert (= (and b!453211 c!56178) b!453210))

(assert (= (and b!453211 (not c!56178)) b!453215))

(assert (= (or b!453210 b!453215) bm!30036))

(assert (= (and d!74335 res!270018) b!453213))

(assert (= (and b!453213 res!270017) b!453216))

(assert (= (and b!453216 res!270016) b!453220))

(assert (= (and b!453216 c!56176) b!453218))

(assert (= (and b!453216 (not c!56176)) b!453212))

(assert (= (and b!453218 res!270015) b!453217))

(assert (= (and b!453212 c!56175) b!453221))

(assert (= (and b!453212 (not c!56175)) b!453214))

(declare-fun b_lambda!9591 () Bool)

(assert (=> (not b_lambda!9591) (not b!453210)))

(assert (=> b!453210 t!13938))

(declare-fun b_and!18905 () Bool)

(assert (= b_and!18903 (and (=> t!13938 result!7103) b_and!18905)))

(declare-fun b_lambda!9593 () Bool)

(assert (=> (not b_lambda!9593) (not b!453217)))

(assert (=> b!453217 t!13938))

(declare-fun b_and!18907 () Bool)

(assert (= b_and!18905 (and (=> t!13938 result!7103) b_and!18907)))

(declare-fun m!437051 () Bool)

(assert (=> bm!30036 m!437051))

(declare-fun m!437053 () Bool)

(assert (=> b!453213 m!437053))

(assert (=> b!453221 m!437051))

(declare-fun m!437055 () Bool)

(assert (=> d!74335 m!437055))

(assert (=> d!74335 m!436891))

(assert (=> b!453211 m!436885))

(assert (=> b!453211 m!436885))

(declare-fun m!437057 () Bool)

(assert (=> b!453211 m!437057))

(assert (=> b!453218 m!436885))

(assert (=> b!453218 m!436885))

(declare-fun m!437059 () Bool)

(assert (=> b!453218 m!437059))

(declare-fun m!437061 () Bool)

(assert (=> b!453214 m!437061))

(declare-fun m!437063 () Bool)

(assert (=> b!453210 m!437063))

(declare-fun m!437065 () Bool)

(assert (=> b!453210 m!437065))

(declare-fun m!437067 () Bool)

(assert (=> b!453210 m!437067))

(assert (=> b!453210 m!437063))

(declare-fun m!437069 () Bool)

(assert (=> b!453210 m!437069))

(assert (=> b!453210 m!437067))

(assert (=> b!453210 m!436867))

(declare-fun m!437071 () Bool)

(assert (=> b!453210 m!437071))

(assert (=> b!453210 m!436867))

(assert (=> b!453210 m!436885))

(declare-fun m!437073 () Bool)

(assert (=> b!453210 m!437073))

(assert (=> b!453220 m!436885))

(assert (=> b!453220 m!436885))

(assert (=> b!453220 m!437057))

(assert (=> b!453217 m!436885))

(assert (=> b!453217 m!437067))

(assert (=> b!453217 m!437067))

(assert (=> b!453217 m!436867))

(assert (=> b!453217 m!437071))

(assert (=> b!453217 m!436885))

(declare-fun m!437075 () Bool)

(assert (=> b!453217 m!437075))

(assert (=> b!453217 m!436867))

(assert (=> b!453065 d!74335))

(declare-fun b!453222 () Bool)

(declare-fun lt!205684 () Unit!13248)

(declare-fun lt!205682 () Unit!13248)

(assert (=> b!453222 (= lt!205684 lt!205682)))

(declare-fun lt!205679 () V!17293)

(declare-fun lt!205683 () (_ BitVec 64))

(declare-fun lt!205681 () ListLongMap!6969)

(declare-fun lt!205680 () (_ BitVec 64))

(assert (=> b!453222 (not (contains!2498 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679)) lt!205683))))

(assert (=> b!453222 (= lt!205682 (addStillNotContains!146 lt!205681 lt!205680 lt!205679 lt!205683))))

(assert (=> b!453222 (= lt!205683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453222 (= lt!205679 (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453222 (= lt!205680 (select (arr!13489 _keys!709) from!863))))

(declare-fun call!30040 () ListLongMap!6969)

(assert (=> b!453222 (= lt!205681 call!30040)))

(declare-fun e!265282 () ListLongMap!6969)

(assert (=> b!453222 (= e!265282 (+!1576 call!30040 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453223 () Bool)

(declare-fun e!265288 () ListLongMap!6969)

(assert (=> b!453223 (= e!265288 e!265282)))

(declare-fun c!56182 () Bool)

(assert (=> b!453223 (= c!56182 (validKeyInArray!0 (select (arr!13489 _keys!709) from!863)))))

(declare-fun b!453224 () Bool)

(declare-fun e!265283 () Bool)

(declare-fun e!265285 () Bool)

(assert (=> b!453224 (= e!265283 e!265285)))

(declare-fun c!56179 () Bool)

(assert (=> b!453224 (= c!56179 (bvslt from!863 (size!13841 _keys!709)))))

(declare-fun b!453225 () Bool)

(declare-fun res!270021 () Bool)

(declare-fun e!265286 () Bool)

(assert (=> b!453225 (=> (not res!270021) (not e!265286))))

(declare-fun lt!205678 () ListLongMap!6969)

(assert (=> b!453225 (= res!270021 (not (contains!2498 lt!205678 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453226 () Bool)

(assert (=> b!453226 (= e!265285 (isEmpty!559 lt!205678))))

(declare-fun b!453227 () Bool)

(assert (=> b!453227 (= e!265282 call!30040)))

(declare-fun b!453228 () Bool)

(assert (=> b!453228 (= e!265286 e!265283)))

(declare-fun c!56180 () Bool)

(declare-fun e!265287 () Bool)

(assert (=> b!453228 (= c!56180 e!265287)))

(declare-fun res!270020 () Bool)

(assert (=> b!453228 (=> (not res!270020) (not e!265287))))

(assert (=> b!453228 (= res!270020 (bvslt from!863 (size!13841 _keys!709)))))

(declare-fun b!453229 () Bool)

(assert (=> b!453229 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13841 _keys!709)))))

(assert (=> b!453229 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13842 _values!549)))))

(declare-fun e!265284 () Bool)

(assert (=> b!453229 (= e!265284 (= (apply!313 lt!205678 (select (arr!13489 _keys!709) from!863)) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453230 () Bool)

(assert (=> b!453230 (= e!265283 e!265284)))

(assert (=> b!453230 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13841 _keys!709)))))

(declare-fun res!270019 () Bool)

(assert (=> b!453230 (= res!270019 (contains!2498 lt!205678 (select (arr!13489 _keys!709) from!863)))))

(assert (=> b!453230 (=> (not res!270019) (not e!265284))))

(declare-fun bm!30037 () Bool)

(assert (=> bm!30037 (= call!30040 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74337 () Bool)

(assert (=> d!74337 e!265286))

(declare-fun res!270022 () Bool)

(assert (=> d!74337 (=> (not res!270022) (not e!265286))))

(assert (=> d!74337 (= res!270022 (not (contains!2498 lt!205678 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74337 (= lt!205678 e!265288)))

(declare-fun c!56181 () Bool)

(assert (=> d!74337 (= c!56181 (bvsge from!863 (size!13841 _keys!709)))))

(assert (=> d!74337 (validMask!0 mask!1025)))

(assert (=> d!74337 (= (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205678)))

(declare-fun b!453231 () Bool)

(assert (=> b!453231 (= e!265288 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453232 () Bool)

(assert (=> b!453232 (= e!265287 (validKeyInArray!0 (select (arr!13489 _keys!709) from!863)))))

(assert (=> b!453232 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453233 () Bool)

(assert (=> b!453233 (= e!265285 (= lt!205678 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74337 c!56181) b!453231))

(assert (= (and d!74337 (not c!56181)) b!453223))

(assert (= (and b!453223 c!56182) b!453222))

(assert (= (and b!453223 (not c!56182)) b!453227))

(assert (= (or b!453222 b!453227) bm!30037))

(assert (= (and d!74337 res!270022) b!453225))

(assert (= (and b!453225 res!270021) b!453228))

(assert (= (and b!453228 res!270020) b!453232))

(assert (= (and b!453228 c!56180) b!453230))

(assert (= (and b!453228 (not c!56180)) b!453224))

(assert (= (and b!453230 res!270019) b!453229))

(assert (= (and b!453224 c!56179) b!453233))

(assert (= (and b!453224 (not c!56179)) b!453226))

(declare-fun b_lambda!9595 () Bool)

(assert (=> (not b_lambda!9595) (not b!453222)))

(assert (=> b!453222 t!13938))

(declare-fun b_and!18909 () Bool)

(assert (= b_and!18907 (and (=> t!13938 result!7103) b_and!18909)))

(declare-fun b_lambda!9597 () Bool)

(assert (=> (not b_lambda!9597) (not b!453229)))

(assert (=> b!453229 t!13938))

(declare-fun b_and!18911 () Bool)

(assert (= b_and!18909 (and (=> t!13938 result!7103) b_and!18911)))

(declare-fun m!437077 () Bool)

(assert (=> bm!30037 m!437077))

(declare-fun m!437079 () Bool)

(assert (=> b!453225 m!437079))

(assert (=> b!453233 m!437077))

(declare-fun m!437081 () Bool)

(assert (=> d!74337 m!437081))

(assert (=> d!74337 m!436891))

(assert (=> b!453223 m!436893))

(assert (=> b!453223 m!436893))

(assert (=> b!453223 m!436895))

(assert (=> b!453230 m!436893))

(assert (=> b!453230 m!436893))

(declare-fun m!437083 () Bool)

(assert (=> b!453230 m!437083))

(declare-fun m!437085 () Bool)

(assert (=> b!453226 m!437085))

(declare-fun m!437087 () Bool)

(assert (=> b!453222 m!437087))

(declare-fun m!437089 () Bool)

(assert (=> b!453222 m!437089))

(assert (=> b!453222 m!436861))

(assert (=> b!453222 m!437087))

(declare-fun m!437091 () Bool)

(assert (=> b!453222 m!437091))

(assert (=> b!453222 m!436861))

(assert (=> b!453222 m!436867))

(declare-fun m!437093 () Bool)

(assert (=> b!453222 m!437093))

(assert (=> b!453222 m!436867))

(assert (=> b!453222 m!436893))

(declare-fun m!437095 () Bool)

(assert (=> b!453222 m!437095))

(assert (=> b!453232 m!436893))

(assert (=> b!453232 m!436893))

(assert (=> b!453232 m!436895))

(assert (=> b!453229 m!436893))

(assert (=> b!453229 m!436861))

(assert (=> b!453229 m!436861))

(assert (=> b!453229 m!436867))

(assert (=> b!453229 m!437093))

(assert (=> b!453229 m!436893))

(declare-fun m!437097 () Bool)

(assert (=> b!453229 m!437097))

(assert (=> b!453229 m!436867))

(assert (=> b!453065 d!74337))

(declare-fun b!453234 () Bool)

(declare-fun lt!205691 () Unit!13248)

(declare-fun lt!205689 () Unit!13248)

(assert (=> b!453234 (= lt!205691 lt!205689)))

(declare-fun lt!205686 () V!17293)

(declare-fun lt!205690 () (_ BitVec 64))

(declare-fun lt!205687 () (_ BitVec 64))

(declare-fun lt!205688 () ListLongMap!6969)

(assert (=> b!453234 (not (contains!2498 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686)) lt!205690))))

(assert (=> b!453234 (= lt!205689 (addStillNotContains!146 lt!205688 lt!205687 lt!205686 lt!205690))))

(assert (=> b!453234 (= lt!205690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453234 (= lt!205686 (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453234 (= lt!205687 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30041 () ListLongMap!6969)

(assert (=> b!453234 (= lt!205688 call!30041)))

(declare-fun e!265289 () ListLongMap!6969)

(assert (=> b!453234 (= e!265289 (+!1576 call!30041 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453235 () Bool)

(declare-fun e!265295 () ListLongMap!6969)

(assert (=> b!453235 (= e!265295 e!265289)))

(declare-fun c!56186 () Bool)

(assert (=> b!453235 (= c!56186 (validKeyInArray!0 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453236 () Bool)

(declare-fun e!265290 () Bool)

(declare-fun e!265292 () Bool)

(assert (=> b!453236 (= e!265290 e!265292)))

(declare-fun c!56183 () Bool)

(assert (=> b!453236 (= c!56183 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun b!453237 () Bool)

(declare-fun res!270025 () Bool)

(declare-fun e!265293 () Bool)

(assert (=> b!453237 (=> (not res!270025) (not e!265293))))

(declare-fun lt!205685 () ListLongMap!6969)

(assert (=> b!453237 (= res!270025 (not (contains!2498 lt!205685 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453238 () Bool)

(assert (=> b!453238 (= e!265292 (isEmpty!559 lt!205685))))

(declare-fun b!453239 () Bool)

(assert (=> b!453239 (= e!265289 call!30041)))

(declare-fun b!453240 () Bool)

(assert (=> b!453240 (= e!265293 e!265290)))

(declare-fun c!56184 () Bool)

(declare-fun e!265294 () Bool)

(assert (=> b!453240 (= c!56184 e!265294)))

(declare-fun res!270024 () Bool)

(assert (=> b!453240 (=> (not res!270024) (not e!265294))))

(assert (=> b!453240 (= res!270024 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun b!453241 () Bool)

(assert (=> b!453241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(assert (=> b!453241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13842 (ite c!56153 _values!549 lt!205593))))))

(declare-fun e!265291 () Bool)

(assert (=> b!453241 (= e!265291 (= (apply!313 lt!205685 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453242 () Bool)

(assert (=> b!453242 (= e!265290 e!265291)))

(assert (=> b!453242 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun res!270023 () Bool)

(assert (=> b!453242 (= res!270023 (contains!2498 lt!205685 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453242 (=> (not res!270023) (not e!265291))))

(declare-fun bm!30038 () Bool)

(assert (=> bm!30038 (= call!30041 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74339 () Bool)

(assert (=> d!74339 e!265293))

(declare-fun res!270026 () Bool)

(assert (=> d!74339 (=> (not res!270026) (not e!265293))))

(assert (=> d!74339 (= res!270026 (not (contains!2498 lt!205685 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74339 (= lt!205685 e!265295)))

(declare-fun c!56185 () Bool)

(assert (=> d!74339 (= c!56185 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(assert (=> d!74339 (validMask!0 mask!1025)))

(assert (=> d!74339 (= (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205685)))

(declare-fun b!453243 () Bool)

(assert (=> b!453243 (= e!265295 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453244 () Bool)

(assert (=> b!453244 (= e!265294 (validKeyInArray!0 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453244 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453245 () Bool)

(assert (=> b!453245 (= e!265292 (= lt!205685 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74339 c!56185) b!453243))

(assert (= (and d!74339 (not c!56185)) b!453235))

(assert (= (and b!453235 c!56186) b!453234))

(assert (= (and b!453235 (not c!56186)) b!453239))

(assert (= (or b!453234 b!453239) bm!30038))

(assert (= (and d!74339 res!270026) b!453237))

(assert (= (and b!453237 res!270025) b!453240))

(assert (= (and b!453240 res!270024) b!453244))

(assert (= (and b!453240 c!56184) b!453242))

(assert (= (and b!453240 (not c!56184)) b!453236))

(assert (= (and b!453242 res!270023) b!453241))

(assert (= (and b!453236 c!56183) b!453245))

(assert (= (and b!453236 (not c!56183)) b!453238))

(declare-fun b_lambda!9599 () Bool)

(assert (=> (not b_lambda!9599) (not b!453234)))

(assert (=> b!453234 t!13938))

(declare-fun b_and!18913 () Bool)

(assert (= b_and!18911 (and (=> t!13938 result!7103) b_and!18913)))

(declare-fun b_lambda!9601 () Bool)

(assert (=> (not b_lambda!9601) (not b!453241)))

(assert (=> b!453241 t!13938))

(declare-fun b_and!18915 () Bool)

(assert (= b_and!18913 (and (=> t!13938 result!7103) b_and!18915)))

(declare-fun m!437099 () Bool)

(assert (=> bm!30038 m!437099))

(declare-fun m!437101 () Bool)

(assert (=> b!453237 m!437101))

(assert (=> b!453245 m!437099))

(declare-fun m!437103 () Bool)

(assert (=> d!74339 m!437103))

(assert (=> d!74339 m!436891))

(declare-fun m!437105 () Bool)

(assert (=> b!453235 m!437105))

(assert (=> b!453235 m!437105))

(declare-fun m!437107 () Bool)

(assert (=> b!453235 m!437107))

(assert (=> b!453242 m!437105))

(assert (=> b!453242 m!437105))

(declare-fun m!437109 () Bool)

(assert (=> b!453242 m!437109))

(declare-fun m!437111 () Bool)

(assert (=> b!453238 m!437111))

(declare-fun m!437113 () Bool)

(assert (=> b!453234 m!437113))

(declare-fun m!437115 () Bool)

(assert (=> b!453234 m!437115))

(declare-fun m!437117 () Bool)

(assert (=> b!453234 m!437117))

(assert (=> b!453234 m!437113))

(declare-fun m!437119 () Bool)

(assert (=> b!453234 m!437119))

(assert (=> b!453234 m!437117))

(assert (=> b!453234 m!436867))

(declare-fun m!437121 () Bool)

(assert (=> b!453234 m!437121))

(assert (=> b!453234 m!436867))

(assert (=> b!453234 m!437105))

(declare-fun m!437123 () Bool)

(assert (=> b!453234 m!437123))

(assert (=> b!453244 m!437105))

(assert (=> b!453244 m!437105))

(assert (=> b!453244 m!437107))

(assert (=> b!453241 m!437105))

(assert (=> b!453241 m!437117))

(assert (=> b!453241 m!437117))

(assert (=> b!453241 m!436867))

(assert (=> b!453241 m!437121))

(assert (=> b!453241 m!437105))

(declare-fun m!437125 () Bool)

(assert (=> b!453241 m!437125))

(assert (=> b!453241 m!436867))

(assert (=> bm!30020 d!74339))

(declare-fun d!74341 () Bool)

(declare-fun c!56189 () Bool)

(assert (=> d!74341 (= c!56189 ((_ is ValueCellFull!5727) (select (arr!13490 _values!549) from!863)))))

(declare-fun e!265298 () V!17293)

(assert (=> d!74341 (= (get!6653 (select (arr!13490 _values!549) from!863) lt!205588) e!265298)))

(declare-fun b!453250 () Bool)

(declare-fun get!6654 (ValueCell!5727 V!17293) V!17293)

(assert (=> b!453250 (= e!265298 (get!6654 (select (arr!13490 _values!549) from!863) lt!205588))))

(declare-fun b!453251 () Bool)

(declare-fun get!6655 (ValueCell!5727 V!17293) V!17293)

(assert (=> b!453251 (= e!265298 (get!6655 (select (arr!13490 _values!549) from!863) lt!205588))))

(assert (= (and d!74341 c!56189) b!453250))

(assert (= (and d!74341 (not c!56189)) b!453251))

(assert (=> b!453250 m!436861))

(declare-fun m!437127 () Bool)

(assert (=> b!453250 m!437127))

(assert (=> b!453251 m!436861))

(declare-fun m!437129 () Bool)

(assert (=> b!453251 m!437129))

(assert (=> b!453066 d!74341))

(declare-fun d!74343 () Bool)

(declare-fun e!265299 () Bool)

(assert (=> d!74343 e!265299))

(declare-fun res!270028 () Bool)

(assert (=> d!74343 (=> (not res!270028) (not e!265299))))

(declare-fun lt!205695 () ListLongMap!6969)

(assert (=> d!74343 (= res!270028 (contains!2498 lt!205695 (_1!4039 lt!205594)))))

(declare-fun lt!205693 () List!8113)

(assert (=> d!74343 (= lt!205695 (ListLongMap!6970 lt!205693))))

(declare-fun lt!205694 () Unit!13248)

(declare-fun lt!205692 () Unit!13248)

(assert (=> d!74343 (= lt!205694 lt!205692)))

(assert (=> d!74343 (= (getValueByKey!370 lt!205693 (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594)))))

(assert (=> d!74343 (= lt!205692 (lemmaContainsTupThenGetReturnValue!192 lt!205693 (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(assert (=> d!74343 (= lt!205693 (insertStrictlySorted!195 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))) (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(assert (=> d!74343 (= (+!1576 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) lt!205594) lt!205695)))

(declare-fun b!453252 () Bool)

(declare-fun res!270027 () Bool)

(assert (=> b!453252 (=> (not res!270027) (not e!265299))))

(assert (=> b!453252 (= res!270027 (= (getValueByKey!370 (toList!3500 lt!205695) (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594))))))

(declare-fun b!453253 () Bool)

(assert (=> b!453253 (= e!265299 (contains!2499 (toList!3500 lt!205695) lt!205594))))

(assert (= (and d!74343 res!270028) b!453252))

(assert (= (and b!453252 res!270027) b!453253))

(declare-fun m!437131 () Bool)

(assert (=> d!74343 m!437131))

(declare-fun m!437133 () Bool)

(assert (=> d!74343 m!437133))

(declare-fun m!437135 () Bool)

(assert (=> d!74343 m!437135))

(declare-fun m!437137 () Bool)

(assert (=> d!74343 m!437137))

(declare-fun m!437139 () Bool)

(assert (=> b!453252 m!437139))

(declare-fun m!437141 () Bool)

(assert (=> b!453253 m!437141))

(assert (=> b!453066 d!74343))

(declare-fun d!74345 () Bool)

(assert (=> d!74345 (= (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205589)) (+!1576 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) (tuple2!8057 k0!794 lt!205589)))))

(declare-fun lt!205698 () Unit!13248)

(declare-fun choose!1327 (ListLongMap!6969 (_ BitVec 64) V!17293 V!17293) Unit!13248)

(assert (=> d!74345 (= lt!205698 (choose!1327 lt!205585 k0!794 lt!205587 lt!205589))))

(assert (=> d!74345 (= (addSameAsAddTwiceSameKeyDiffValues!87 lt!205585 k0!794 lt!205587 lt!205589) lt!205698)))

(declare-fun bs!14402 () Bool)

(assert (= bs!14402 d!74345))

(declare-fun m!437143 () Bool)

(assert (=> bs!14402 m!437143))

(assert (=> bs!14402 m!436871))

(assert (=> bs!14402 m!436871))

(declare-fun m!437145 () Bool)

(assert (=> bs!14402 m!437145))

(declare-fun m!437147 () Bool)

(assert (=> bs!14402 m!437147))

(assert (=> b!453066 d!74345))

(declare-fun b!453254 () Bool)

(declare-fun lt!205705 () Unit!13248)

(declare-fun lt!205703 () Unit!13248)

(assert (=> b!453254 (= lt!205705 lt!205703)))

(declare-fun lt!205701 () (_ BitVec 64))

(declare-fun lt!205700 () V!17293)

(declare-fun lt!205704 () (_ BitVec 64))

(declare-fun lt!205702 () ListLongMap!6969)

(assert (=> b!453254 (not (contains!2498 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700)) lt!205704))))

(assert (=> b!453254 (= lt!205703 (addStillNotContains!146 lt!205702 lt!205701 lt!205700 lt!205704))))

(assert (=> b!453254 (= lt!205704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453254 (= lt!205700 (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453254 (= lt!205701 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30042 () ListLongMap!6969)

(assert (=> b!453254 (= lt!205702 call!30042)))

(declare-fun e!265300 () ListLongMap!6969)

(assert (=> b!453254 (= e!265300 (+!1576 call!30042 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453255 () Bool)

(declare-fun e!265306 () ListLongMap!6969)

(assert (=> b!453255 (= e!265306 e!265300)))

(declare-fun c!56193 () Bool)

(assert (=> b!453255 (= c!56193 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453256 () Bool)

(declare-fun e!265301 () Bool)

(declare-fun e!265303 () Bool)

(assert (=> b!453256 (= e!265301 e!265303)))

(declare-fun c!56190 () Bool)

(assert (=> b!453256 (= c!56190 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 lt!205595)))))

(declare-fun b!453257 () Bool)

(declare-fun res!270031 () Bool)

(declare-fun e!265304 () Bool)

(assert (=> b!453257 (=> (not res!270031) (not e!265304))))

(declare-fun lt!205699 () ListLongMap!6969)

(assert (=> b!453257 (= res!270031 (not (contains!2498 lt!205699 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453258 () Bool)

(assert (=> b!453258 (= e!265303 (isEmpty!559 lt!205699))))

(declare-fun b!453259 () Bool)

(assert (=> b!453259 (= e!265300 call!30042)))

(declare-fun b!453260 () Bool)

(assert (=> b!453260 (= e!265304 e!265301)))

(declare-fun c!56191 () Bool)

(declare-fun e!265305 () Bool)

(assert (=> b!453260 (= c!56191 e!265305)))

(declare-fun res!270030 () Bool)

(assert (=> b!453260 (=> (not res!270030) (not e!265305))))

(assert (=> b!453260 (= res!270030 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 lt!205595)))))

(declare-fun b!453261 () Bool)

(assert (=> b!453261 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 lt!205595)))))

(assert (=> b!453261 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13842 lt!205593)))))

(declare-fun e!265302 () Bool)

(assert (=> b!453261 (= e!265302 (= (apply!313 lt!205699 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453262 () Bool)

(assert (=> b!453262 (= e!265301 e!265302)))

(assert (=> b!453262 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 lt!205595)))))

(declare-fun res!270029 () Bool)

(assert (=> b!453262 (= res!270029 (contains!2498 lt!205699 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453262 (=> (not res!270029) (not e!265302))))

(declare-fun bm!30039 () Bool)

(assert (=> bm!30039 (= call!30042 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74347 () Bool)

(assert (=> d!74347 e!265304))

(declare-fun res!270032 () Bool)

(assert (=> d!74347 (=> (not res!270032) (not e!265304))))

(assert (=> d!74347 (= res!270032 (not (contains!2498 lt!205699 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74347 (= lt!205699 e!265306)))

(declare-fun c!56192 () Bool)

(assert (=> d!74347 (= c!56192 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13841 lt!205595)))))

(assert (=> d!74347 (validMask!0 mask!1025)))

(assert (=> d!74347 (= (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205699)))

(declare-fun b!453263 () Bool)

(assert (=> b!453263 (= e!265306 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453264 () Bool)

(assert (=> b!453264 (= e!265305 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453264 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453265 () Bool)

(assert (=> b!453265 (= e!265303 (= lt!205699 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74347 c!56192) b!453263))

(assert (= (and d!74347 (not c!56192)) b!453255))

(assert (= (and b!453255 c!56193) b!453254))

(assert (= (and b!453255 (not c!56193)) b!453259))

(assert (= (or b!453254 b!453259) bm!30039))

(assert (= (and d!74347 res!270032) b!453257))

(assert (= (and b!453257 res!270031) b!453260))

(assert (= (and b!453260 res!270030) b!453264))

(assert (= (and b!453260 c!56191) b!453262))

(assert (= (and b!453260 (not c!56191)) b!453256))

(assert (= (and b!453262 res!270029) b!453261))

(assert (= (and b!453256 c!56190) b!453265))

(assert (= (and b!453256 (not c!56190)) b!453258))

(declare-fun b_lambda!9603 () Bool)

(assert (=> (not b_lambda!9603) (not b!453254)))

(assert (=> b!453254 t!13938))

(declare-fun b_and!18917 () Bool)

(assert (= b_and!18915 (and (=> t!13938 result!7103) b_and!18917)))

(declare-fun b_lambda!9605 () Bool)

(assert (=> (not b_lambda!9605) (not b!453261)))

(assert (=> b!453261 t!13938))

(declare-fun b_and!18919 () Bool)

(assert (= b_and!18917 (and (=> t!13938 result!7103) b_and!18919)))

(declare-fun m!437149 () Bool)

(assert (=> bm!30039 m!437149))

(declare-fun m!437151 () Bool)

(assert (=> b!453257 m!437151))

(assert (=> b!453265 m!437149))

(declare-fun m!437153 () Bool)

(assert (=> d!74347 m!437153))

(assert (=> d!74347 m!436891))

(declare-fun m!437155 () Bool)

(assert (=> b!453255 m!437155))

(assert (=> b!453255 m!437155))

(declare-fun m!437157 () Bool)

(assert (=> b!453255 m!437157))

(assert (=> b!453262 m!437155))

(assert (=> b!453262 m!437155))

(declare-fun m!437159 () Bool)

(assert (=> b!453262 m!437159))

(declare-fun m!437161 () Bool)

(assert (=> b!453258 m!437161))

(declare-fun m!437163 () Bool)

(assert (=> b!453254 m!437163))

(declare-fun m!437165 () Bool)

(assert (=> b!453254 m!437165))

(declare-fun m!437167 () Bool)

(assert (=> b!453254 m!437167))

(assert (=> b!453254 m!437163))

(declare-fun m!437169 () Bool)

(assert (=> b!453254 m!437169))

(assert (=> b!453254 m!437167))

(assert (=> b!453254 m!436867))

(declare-fun m!437171 () Bool)

(assert (=> b!453254 m!437171))

(assert (=> b!453254 m!436867))

(assert (=> b!453254 m!437155))

(declare-fun m!437173 () Bool)

(assert (=> b!453254 m!437173))

(assert (=> b!453264 m!437155))

(assert (=> b!453264 m!437155))

(assert (=> b!453264 m!437157))

(assert (=> b!453261 m!437155))

(assert (=> b!453261 m!437167))

(assert (=> b!453261 m!437167))

(assert (=> b!453261 m!436867))

(assert (=> b!453261 m!437171))

(assert (=> b!453261 m!437155))

(declare-fun m!437175 () Bool)

(assert (=> b!453261 m!437175))

(assert (=> b!453261 m!436867))

(assert (=> b!453066 d!74347))

(declare-fun d!74349 () Bool)

(declare-fun e!265307 () Bool)

(assert (=> d!74349 e!265307))

(declare-fun res!270034 () Bool)

(assert (=> d!74349 (=> (not res!270034) (not e!265307))))

(declare-fun lt!205709 () ListLongMap!6969)

(assert (=> d!74349 (= res!270034 (contains!2498 lt!205709 (_1!4039 lt!205594)))))

(declare-fun lt!205707 () List!8113)

(assert (=> d!74349 (= lt!205709 (ListLongMap!6970 lt!205707))))

(declare-fun lt!205708 () Unit!13248)

(declare-fun lt!205706 () Unit!13248)

(assert (=> d!74349 (= lt!205708 lt!205706)))

(assert (=> d!74349 (= (getValueByKey!370 lt!205707 (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594)))))

(assert (=> d!74349 (= lt!205706 (lemmaContainsTupThenGetReturnValue!192 lt!205707 (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(assert (=> d!74349 (= lt!205707 (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(assert (=> d!74349 (= (+!1576 lt!205585 lt!205594) lt!205709)))

(declare-fun b!453266 () Bool)

(declare-fun res!270033 () Bool)

(assert (=> b!453266 (=> (not res!270033) (not e!265307))))

(assert (=> b!453266 (= res!270033 (= (getValueByKey!370 (toList!3500 lt!205709) (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594))))))

(declare-fun b!453267 () Bool)

(assert (=> b!453267 (= e!265307 (contains!2499 (toList!3500 lt!205709) lt!205594))))

(assert (= (and d!74349 res!270034) b!453266))

(assert (= (and b!453266 res!270033) b!453267))

(declare-fun m!437177 () Bool)

(assert (=> d!74349 m!437177))

(declare-fun m!437179 () Bool)

(assert (=> d!74349 m!437179))

(declare-fun m!437181 () Bool)

(assert (=> d!74349 m!437181))

(declare-fun m!437183 () Bool)

(assert (=> d!74349 m!437183))

(declare-fun m!437185 () Bool)

(assert (=> b!453266 m!437185))

(declare-fun m!437187 () Bool)

(assert (=> b!453267 m!437187))

(assert (=> b!453066 d!74349))

(declare-fun d!74351 () Bool)

(declare-fun c!56194 () Bool)

(assert (=> d!74351 (= c!56194 ((_ is ValueCellFull!5727) (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863)))))

(declare-fun e!265308 () V!17293)

(assert (=> d!74351 (= (get!6653 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588) e!265308)))

(declare-fun b!453268 () Bool)

(assert (=> b!453268 (= e!265308 (get!6654 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588))))

(declare-fun b!453269 () Bool)

(assert (=> b!453269 (= e!265308 (get!6655 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588))))

(assert (= (and d!74351 c!56194) b!453268))

(assert (= (and d!74351 (not c!56194)) b!453269))

(assert (=> b!453268 m!436877))

(declare-fun m!437189 () Bool)

(assert (=> b!453268 m!437189))

(assert (=> b!453269 m!436877))

(declare-fun m!437191 () Bool)

(assert (=> b!453269 m!437191))

(assert (=> b!453066 d!74351))

(declare-fun d!74353 () Bool)

(declare-fun e!265309 () Bool)

(assert (=> d!74353 e!265309))

(declare-fun res!270036 () Bool)

(assert (=> d!74353 (=> (not res!270036) (not e!265309))))

(declare-fun lt!205713 () ListLongMap!6969)

(assert (=> d!74353 (= res!270036 (contains!2498 lt!205713 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun lt!205711 () List!8113)

(assert (=> d!74353 (= lt!205713 (ListLongMap!6970 lt!205711))))

(declare-fun lt!205712 () Unit!13248)

(declare-fun lt!205710 () Unit!13248)

(assert (=> d!74353 (= lt!205712 lt!205710)))

(assert (=> d!74353 (= (getValueByKey!370 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (=> d!74353 (= lt!205710 (lemmaContainsTupThenGetReturnValue!192 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (=> d!74353 (= lt!205711 (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (=> d!74353 (= (+!1576 lt!205585 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) lt!205713)))

(declare-fun b!453270 () Bool)

(declare-fun res!270035 () Bool)

(assert (=> b!453270 (=> (not res!270035) (not e!265309))))

(assert (=> b!453270 (= res!270035 (= (getValueByKey!370 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(declare-fun b!453271 () Bool)

(assert (=> b!453271 (= e!265309 (contains!2499 (toList!3500 lt!205713) (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))

(assert (= (and d!74353 res!270036) b!453270))

(assert (= (and b!453270 res!270035) b!453271))

(declare-fun m!437193 () Bool)

(assert (=> d!74353 m!437193))

(declare-fun m!437195 () Bool)

(assert (=> d!74353 m!437195))

(declare-fun m!437197 () Bool)

(assert (=> d!74353 m!437197))

(declare-fun m!437199 () Bool)

(assert (=> d!74353 m!437199))

(declare-fun m!437201 () Bool)

(assert (=> b!453270 m!437201))

(declare-fun m!437203 () Bool)

(assert (=> b!453271 m!437203))

(assert (=> b!453066 d!74353))

(declare-fun d!74355 () Bool)

(declare-fun e!265310 () Bool)

(assert (=> d!74355 e!265310))

(declare-fun res!270038 () Bool)

(assert (=> d!74355 (=> (not res!270038) (not e!265310))))

(declare-fun lt!205717 () ListLongMap!6969)

(assert (=> d!74355 (= res!270038 (contains!2498 lt!205717 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205715 () List!8113)

(assert (=> d!74355 (= lt!205717 (ListLongMap!6970 lt!205715))))

(declare-fun lt!205716 () Unit!13248)

(declare-fun lt!205714 () Unit!13248)

(assert (=> d!74355 (= lt!205716 lt!205714)))

(assert (=> d!74355 (= (getValueByKey!370 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74355 (= lt!205714 (lemmaContainsTupThenGetReturnValue!192 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74355 (= lt!205715 (insertStrictlySorted!195 (toList!3500 lt!205592) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74355 (= (+!1576 lt!205592 (tuple2!8057 k0!794 v!412)) lt!205717)))

(declare-fun b!453272 () Bool)

(declare-fun res!270037 () Bool)

(assert (=> b!453272 (=> (not res!270037) (not e!265310))))

(assert (=> b!453272 (= res!270037 (= (getValueByKey!370 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun b!453273 () Bool)

(assert (=> b!453273 (= e!265310 (contains!2499 (toList!3500 lt!205717) (tuple2!8057 k0!794 v!412)))))

(assert (= (and d!74355 res!270038) b!453272))

(assert (= (and b!453272 res!270037) b!453273))

(declare-fun m!437205 () Bool)

(assert (=> d!74355 m!437205))

(declare-fun m!437207 () Bool)

(assert (=> d!74355 m!437207))

(declare-fun m!437209 () Bool)

(assert (=> d!74355 m!437209))

(declare-fun m!437211 () Bool)

(assert (=> d!74355 m!437211))

(declare-fun m!437213 () Bool)

(assert (=> b!453272 m!437213))

(declare-fun m!437215 () Bool)

(assert (=> b!453273 m!437215))

(assert (=> b!453066 d!74355))

(declare-fun d!74357 () Bool)

(declare-fun e!265311 () Bool)

(assert (=> d!74357 e!265311))

(declare-fun res!270040 () Bool)

(assert (=> d!74357 (=> (not res!270040) (not e!265311))))

(declare-fun lt!205721 () ListLongMap!6969)

(assert (=> d!74357 (= res!270040 (contains!2498 lt!205721 (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun lt!205719 () List!8113)

(assert (=> d!74357 (= lt!205721 (ListLongMap!6970 lt!205719))))

(declare-fun lt!205720 () Unit!13248)

(declare-fun lt!205718 () Unit!13248)

(assert (=> d!74357 (= lt!205720 lt!205718)))

(assert (=> d!74357 (= (getValueByKey!370 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> d!74357 (= lt!205718 (lemmaContainsTupThenGetReturnValue!192 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> d!74357 (= lt!205719 (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> d!74357 (= (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) lt!205721)))

(declare-fun b!453274 () Bool)

(declare-fun res!270039 () Bool)

(assert (=> b!453274 (=> (not res!270039) (not e!265311))))

(assert (=> b!453274 (= res!270039 (= (getValueByKey!370 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205587)))))))

(declare-fun b!453275 () Bool)

(assert (=> b!453275 (= e!265311 (contains!2499 (toList!3500 lt!205721) (tuple2!8057 k0!794 lt!205587)))))

(assert (= (and d!74357 res!270040) b!453274))

(assert (= (and b!453274 res!270039) b!453275))

(declare-fun m!437217 () Bool)

(assert (=> d!74357 m!437217))

(declare-fun m!437219 () Bool)

(assert (=> d!74357 m!437219))

(declare-fun m!437221 () Bool)

(assert (=> d!74357 m!437221))

(declare-fun m!437223 () Bool)

(assert (=> d!74357 m!437223))

(declare-fun m!437225 () Bool)

(assert (=> b!453274 m!437225))

(declare-fun m!437227 () Bool)

(assert (=> b!453275 m!437227))

(assert (=> b!453066 d!74357))

(declare-fun bm!30040 () Bool)

(declare-fun call!30043 () Bool)

(assert (=> bm!30040 (= call!30043 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205595 mask!1025))))

(declare-fun b!453276 () Bool)

(declare-fun e!265312 () Bool)

(assert (=> b!453276 (= e!265312 call!30043)))

(declare-fun d!74359 () Bool)

(declare-fun res!270042 () Bool)

(declare-fun e!265314 () Bool)

(assert (=> d!74359 (=> res!270042 e!265314)))

(assert (=> d!74359 (= res!270042 (bvsge #b00000000000000000000000000000000 (size!13841 lt!205595)))))

(assert (=> d!74359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205595 mask!1025) e!265314)))

(declare-fun b!453277 () Bool)

(declare-fun e!265313 () Bool)

(assert (=> b!453277 (= e!265313 call!30043)))

(declare-fun b!453278 () Bool)

(assert (=> b!453278 (= e!265314 e!265312)))

(declare-fun c!56195 () Bool)

(assert (=> b!453278 (= c!56195 (validKeyInArray!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun b!453279 () Bool)

(assert (=> b!453279 (= e!265312 e!265313)))

(declare-fun lt!205723 () (_ BitVec 64))

(assert (=> b!453279 (= lt!205723 (select (arr!13489 lt!205595) #b00000000000000000000000000000000))))

(declare-fun lt!205722 () Unit!13248)

(assert (=> b!453279 (= lt!205722 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205595 lt!205723 #b00000000000000000000000000000000))))

(assert (=> b!453279 (arrayContainsKey!0 lt!205595 lt!205723 #b00000000000000000000000000000000)))

(declare-fun lt!205724 () Unit!13248)

(assert (=> b!453279 (= lt!205724 lt!205722)))

(declare-fun res!270041 () Bool)

(assert (=> b!453279 (= res!270041 (= (seekEntryOrOpen!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) lt!205595 mask!1025) (Found!3532 #b00000000000000000000000000000000)))))

(assert (=> b!453279 (=> (not res!270041) (not e!265313))))

(assert (= (and d!74359 (not res!270042)) b!453278))

(assert (= (and b!453278 c!56195) b!453279))

(assert (= (and b!453278 (not c!56195)) b!453276))

(assert (= (and b!453279 res!270041) b!453277))

(assert (= (or b!453277 b!453276) bm!30040))

(declare-fun m!437229 () Bool)

(assert (=> bm!30040 m!437229))

(assert (=> b!453278 m!436991))

(assert (=> b!453278 m!436991))

(assert (=> b!453278 m!436993))

(assert (=> b!453279 m!436991))

(declare-fun m!437231 () Bool)

(assert (=> b!453279 m!437231))

(declare-fun m!437233 () Bool)

(assert (=> b!453279 m!437233))

(assert (=> b!453279 m!436991))

(declare-fun m!437235 () Bool)

(assert (=> b!453279 m!437235))

(assert (=> b!453072 d!74359))

(declare-fun d!74361 () Bool)

(assert (=> d!74361 (= (validKeyInArray!0 (select (arr!13489 _keys!709) from!863)) (and (not (= (select (arr!13489 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453062 d!74361))

(declare-fun d!74363 () Bool)

(declare-fun e!265319 () Bool)

(assert (=> d!74363 e!265319))

(declare-fun res!270045 () Bool)

(assert (=> d!74363 (=> (not res!270045) (not e!265319))))

(assert (=> d!74363 (= res!270045 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13841 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13842 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13841 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13842 _values!549))))))))

(declare-fun lt!205727 () Unit!13248)

(declare-fun choose!1328 (array!28089 array!28091 (_ BitVec 32) (_ BitVec 32) V!17293 V!17293 (_ BitVec 32) (_ BitVec 64) V!17293 (_ BitVec 32) Int) Unit!13248)

(assert (=> d!74363 (= lt!205727 (choose!1328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74363 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(assert (=> d!74363 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205727)))

(declare-fun call!30049 () ListLongMap!6969)

(declare-fun bm!30045 () Bool)

(assert (=> bm!30045 (= call!30049 (getCurrentListMapNoExtraKeys!1683 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)) (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!265320 () Bool)

(declare-fun b!453286 () Bool)

(declare-fun call!30048 () ListLongMap!6969)

(assert (=> b!453286 (= e!265320 (= call!30049 (+!1576 call!30048 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453287 () Bool)

(assert (=> b!453287 (= e!265319 e!265320)))

(declare-fun c!56198 () Bool)

(assert (=> b!453287 (= c!56198 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!453288 () Bool)

(assert (=> b!453288 (= e!265320 (= call!30049 call!30048))))

(declare-fun bm!30046 () Bool)

(assert (=> bm!30046 (= call!30048 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74363 res!270045) b!453287))

(assert (= (and b!453287 c!56198) b!453286))

(assert (= (and b!453287 (not c!56198)) b!453288))

(assert (= (or b!453286 b!453288) bm!30046))

(assert (= (or b!453286 b!453288) bm!30045))

(declare-fun m!437237 () Bool)

(assert (=> d!74363 m!437237))

(assert (=> bm!30045 m!436857))

(assert (=> bm!30045 m!436869))

(declare-fun m!437239 () Bool)

(assert (=> bm!30045 m!437239))

(declare-fun m!437241 () Bool)

(assert (=> b!453286 m!437241))

(declare-fun m!437243 () Bool)

(assert (=> bm!30046 m!437243))

(assert (=> b!453062 d!74363))

(declare-fun d!74365 () Bool)

(assert (=> d!74365 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453064 d!74365))

(declare-fun b!453289 () Bool)

(declare-fun e!265321 () Bool)

(declare-fun call!30050 () Bool)

(assert (=> b!453289 (= e!265321 call!30050)))

(declare-fun b!453290 () Bool)

(declare-fun e!265322 () Bool)

(assert (=> b!453290 (= e!265322 e!265321)))

(declare-fun c!56199 () Bool)

(assert (=> b!453290 (= c!56199 (validKeyInArray!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74367 () Bool)

(declare-fun res!270048 () Bool)

(declare-fun e!265323 () Bool)

(assert (=> d!74367 (=> res!270048 e!265323)))

(assert (=> d!74367 (= res!270048 (bvsge #b00000000000000000000000000000000 (size!13841 _keys!709)))))

(assert (=> d!74367 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8111) e!265323)))

(declare-fun b!453291 () Bool)

(declare-fun e!265324 () Bool)

(assert (=> b!453291 (= e!265324 (contains!2497 Nil!8111 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453292 () Bool)

(assert (=> b!453292 (= e!265321 call!30050)))

(declare-fun bm!30047 () Bool)

(assert (=> bm!30047 (= call!30050 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56199 (Cons!8110 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) Nil!8111) Nil!8111)))))

(declare-fun b!453293 () Bool)

(assert (=> b!453293 (= e!265323 e!265322)))

(declare-fun res!270047 () Bool)

(assert (=> b!453293 (=> (not res!270047) (not e!265322))))

(assert (=> b!453293 (= res!270047 (not e!265324))))

(declare-fun res!270046 () Bool)

(assert (=> b!453293 (=> (not res!270046) (not e!265324))))

(assert (=> b!453293 (= res!270046 (validKeyInArray!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74367 (not res!270048)) b!453293))

(assert (= (and b!453293 res!270046) b!453291))

(assert (= (and b!453293 res!270047) b!453290))

(assert (= (and b!453290 c!56199) b!453292))

(assert (= (and b!453290 (not c!56199)) b!453289))

(assert (= (or b!453292 b!453289) bm!30047))

(assert (=> b!453290 m!437041))

(assert (=> b!453290 m!437041))

(assert (=> b!453290 m!437043))

(assert (=> b!453291 m!437041))

(assert (=> b!453291 m!437041))

(declare-fun m!437245 () Bool)

(assert (=> b!453291 m!437245))

(assert (=> bm!30047 m!437041))

(declare-fun m!437247 () Bool)

(assert (=> bm!30047 m!437247))

(assert (=> b!453293 m!437041))

(assert (=> b!453293 m!437041))

(assert (=> b!453293 m!437043))

(assert (=> b!453063 d!74367))

(declare-fun d!74369 () Bool)

(declare-fun res!270053 () Bool)

(declare-fun e!265329 () Bool)

(assert (=> d!74369 (=> res!270053 e!265329)))

(assert (=> d!74369 (= res!270053 (= (select (arr!13489 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74369 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!265329)))

(declare-fun b!453298 () Bool)

(declare-fun e!265330 () Bool)

(assert (=> b!453298 (= e!265329 e!265330)))

(declare-fun res!270054 () Bool)

(assert (=> b!453298 (=> (not res!270054) (not e!265330))))

(assert (=> b!453298 (= res!270054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun b!453299 () Bool)

(assert (=> b!453299 (= e!265330 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74369 (not res!270053)) b!453298))

(assert (= (and b!453298 res!270054) b!453299))

(assert (=> d!74369 m!437041))

(declare-fun m!437249 () Bool)

(assert (=> b!453299 m!437249))

(assert (=> b!453073 d!74369))

(declare-fun b!453306 () Bool)

(declare-fun e!265335 () Bool)

(assert (=> b!453306 (= e!265335 tp_is_empty!12141)))

(declare-fun mapNonEmpty!19854 () Bool)

(declare-fun mapRes!19854 () Bool)

(declare-fun tp!38241 () Bool)

(assert (=> mapNonEmpty!19854 (= mapRes!19854 (and tp!38241 e!265335))))

(declare-fun mapRest!19854 () (Array (_ BitVec 32) ValueCell!5727))

(declare-fun mapValue!19854 () ValueCell!5727)

(declare-fun mapKey!19854 () (_ BitVec 32))

(assert (=> mapNonEmpty!19854 (= mapRest!19848 (store mapRest!19854 mapKey!19854 mapValue!19854))))

(declare-fun mapIsEmpty!19854 () Bool)

(assert (=> mapIsEmpty!19854 mapRes!19854))

(declare-fun b!453307 () Bool)

(declare-fun e!265336 () Bool)

(assert (=> b!453307 (= e!265336 tp_is_empty!12141)))

(declare-fun condMapEmpty!19854 () Bool)

(declare-fun mapDefault!19854 () ValueCell!5727)

(assert (=> mapNonEmpty!19848 (= condMapEmpty!19854 (= mapRest!19848 ((as const (Array (_ BitVec 32) ValueCell!5727)) mapDefault!19854)))))

(assert (=> mapNonEmpty!19848 (= tp!38231 (and e!265336 mapRes!19854))))

(assert (= (and mapNonEmpty!19848 condMapEmpty!19854) mapIsEmpty!19854))

(assert (= (and mapNonEmpty!19848 (not condMapEmpty!19854)) mapNonEmpty!19854))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5727) mapValue!19854)) b!453306))

(assert (= (and mapNonEmpty!19848 ((_ is ValueCellFull!5727) mapDefault!19854)) b!453307))

(declare-fun m!437251 () Bool)

(assert (=> mapNonEmpty!19854 m!437251))

(declare-fun b_lambda!9607 () Bool)

(assert (= b_lambda!9603 (or (and start!40814 b_free!10803) b_lambda!9607)))

(declare-fun b_lambda!9609 () Bool)

(assert (= b_lambda!9597 (or (and start!40814 b_free!10803) b_lambda!9609)))

(declare-fun b_lambda!9611 () Bool)

(assert (= b_lambda!9601 (or (and start!40814 b_free!10803) b_lambda!9611)))

(declare-fun b_lambda!9613 () Bool)

(assert (= b_lambda!9591 (or (and start!40814 b_free!10803) b_lambda!9613)))

(declare-fun b_lambda!9615 () Bool)

(assert (= b_lambda!9589 (or (and start!40814 b_free!10803) b_lambda!9615)))

(declare-fun b_lambda!9617 () Bool)

(assert (= b_lambda!9593 (or (and start!40814 b_free!10803) b_lambda!9617)))

(declare-fun b_lambda!9619 () Bool)

(assert (= b_lambda!9599 (or (and start!40814 b_free!10803) b_lambda!9619)))

(declare-fun b_lambda!9621 () Bool)

(assert (= b_lambda!9587 (or (and start!40814 b_free!10803) b_lambda!9621)))

(declare-fun b_lambda!9623 () Bool)

(assert (= b_lambda!9595 (or (and start!40814 b_free!10803) b_lambda!9623)))

(declare-fun b_lambda!9625 () Bool)

(assert (= b_lambda!9605 (or (and start!40814 b_free!10803) b_lambda!9625)))

(check-sat (not d!74357) (not bm!30038) (not b!453262) (not b!453220) (not b!453222) (not b!453209) (not bm!30045) (not b!453291) (not b!453218) (not bm!30047) (not d!74347) (not b!453233) (not b_lambda!9615) (not mapNonEmpty!19854) (not b!453252) (not b!453286) (not b_lambda!9617) (not b!453155) (not b_lambda!9607) (not b!453235) (not b!453237) (not bm!30040) (not b!453153) (not d!74349) (not b!453253) (not b!453272) (not d!74353) (not b_lambda!9613) (not b!453186) (not b!453230) (not d!74345) (not b!453241) (not bm!30029) (not b!453275) (not d!74343) (not b!453273) (not b!453251) (not b!453242) (not b!453160) (not b!453214) (not b!453265) (not b!453196) (not b!453267) (not b!453232) (not b_lambda!9621) (not bm!30037) (not d!74363) (not b!453211) (not b!453221) tp_is_empty!12141 (not b!453226) (not b!453244) (not bm!30032) (not b!453264) (not b_lambda!9625) (not b!453271) (not b!453274) (not d!74337) (not b!453225) (not b!453208) (not bm!30046) (not b!453194) (not b_lambda!9611) (not b!453254) (not b!453270) (not b!453293) (not b!453152) (not bm!30035) b_and!18919 (not b!453255) (not b!453299) (not b!453187) (not d!74339) (not b!453229) (not bm!30036) (not b!453238) (not b!453279) (not b!453266) (not b!453257) (not b!453245) (not b!453261) (not b!453193) (not b!453213) (not d!74327) (not b!453190) (not b!453161) (not b_next!10803) (not b_lambda!9585) (not bm!30039) (not b!453290) (not b!453234) (not b!453269) (not b!453223) (not b_lambda!9609) (not b!453197) (not d!74355) (not b!453217) (not d!74335) (not b!453250) (not b!453210) (not b!453278) (not d!74325) (not b_lambda!9623) (not b!453268) (not b!453189) (not b_lambda!9619) (not b!453258))
(check-sat b_and!18919 (not b_next!10803))
(get-model)

(declare-fun d!74371 () Bool)

(declare-fun e!265337 () Bool)

(assert (=> d!74371 e!265337))

(declare-fun res!270056 () Bool)

(assert (=> d!74371 (=> (not res!270056) (not e!265337))))

(declare-fun lt!205731 () ListLongMap!6969)

(assert (=> d!74371 (= res!270056 (contains!2498 lt!205731 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205729 () List!8113)

(assert (=> d!74371 (= lt!205731 (ListLongMap!6970 lt!205729))))

(declare-fun lt!205730 () Unit!13248)

(declare-fun lt!205728 () Unit!13248)

(assert (=> d!74371 (= lt!205730 lt!205728)))

(assert (=> d!74371 (= (getValueByKey!370 lt!205729 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74371 (= lt!205728 (lemmaContainsTupThenGetReturnValue!192 lt!205729 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74371 (= lt!205729 (insertStrictlySorted!195 (toList!3500 call!30041) (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74371 (= (+!1576 call!30041 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205731)))

(declare-fun b!453308 () Bool)

(declare-fun res!270055 () Bool)

(assert (=> b!453308 (=> (not res!270055) (not e!265337))))

(assert (=> b!453308 (= res!270055 (= (getValueByKey!370 (toList!3500 lt!205731) (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453309 () Bool)

(assert (=> b!453309 (= e!265337 (contains!2499 (toList!3500 lt!205731) (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74371 res!270056) b!453308))

(assert (= (and b!453308 res!270055) b!453309))

(declare-fun m!437253 () Bool)

(assert (=> d!74371 m!437253))

(declare-fun m!437255 () Bool)

(assert (=> d!74371 m!437255))

(declare-fun m!437257 () Bool)

(assert (=> d!74371 m!437257))

(declare-fun m!437259 () Bool)

(assert (=> d!74371 m!437259))

(declare-fun m!437261 () Bool)

(assert (=> b!453308 m!437261))

(declare-fun m!437263 () Bool)

(assert (=> b!453309 m!437263))

(assert (=> b!453234 d!74371))

(declare-fun d!74373 () Bool)

(declare-fun e!265343 () Bool)

(assert (=> d!74373 e!265343))

(declare-fun res!270059 () Bool)

(assert (=> d!74373 (=> res!270059 e!265343)))

(declare-fun lt!205741 () Bool)

(assert (=> d!74373 (= res!270059 (not lt!205741))))

(declare-fun lt!205742 () Bool)

(assert (=> d!74373 (= lt!205741 lt!205742)))

(declare-fun lt!205740 () Unit!13248)

(declare-fun e!265342 () Unit!13248)

(assert (=> d!74373 (= lt!205740 e!265342)))

(declare-fun c!56202 () Bool)

(assert (=> d!74373 (= c!56202 lt!205742)))

(declare-fun containsKey!347 (List!8113 (_ BitVec 64)) Bool)

(assert (=> d!74373 (= lt!205742 (containsKey!347 (toList!3500 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686))) lt!205690))))

(assert (=> d!74373 (= (contains!2498 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686)) lt!205690) lt!205741)))

(declare-fun b!453316 () Bool)

(declare-fun lt!205743 () Unit!13248)

(assert (=> b!453316 (= e!265342 lt!205743)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!295 (List!8113 (_ BitVec 64)) Unit!13248)

(assert (=> b!453316 (= lt!205743 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686))) lt!205690))))

(declare-fun isDefined!296 (Option!376) Bool)

(assert (=> b!453316 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686))) lt!205690))))

(declare-fun b!453317 () Bool)

(declare-fun Unit!13250 () Unit!13248)

(assert (=> b!453317 (= e!265342 Unit!13250)))

(declare-fun b!453318 () Bool)

(assert (=> b!453318 (= e!265343 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686))) lt!205690)))))

(assert (= (and d!74373 c!56202) b!453316))

(assert (= (and d!74373 (not c!56202)) b!453317))

(assert (= (and d!74373 (not res!270059)) b!453318))

(declare-fun m!437265 () Bool)

(assert (=> d!74373 m!437265))

(declare-fun m!437267 () Bool)

(assert (=> b!453316 m!437267))

(declare-fun m!437269 () Bool)

(assert (=> b!453316 m!437269))

(assert (=> b!453316 m!437269))

(declare-fun m!437271 () Bool)

(assert (=> b!453316 m!437271))

(assert (=> b!453318 m!437269))

(assert (=> b!453318 m!437269))

(assert (=> b!453318 m!437271))

(assert (=> b!453234 d!74373))

(declare-fun d!74375 () Bool)

(assert (=> d!74375 (not (contains!2498 (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686)) lt!205690))))

(declare-fun lt!205746 () Unit!13248)

(declare-fun choose!1329 (ListLongMap!6969 (_ BitVec 64) V!17293 (_ BitVec 64)) Unit!13248)

(assert (=> d!74375 (= lt!205746 (choose!1329 lt!205688 lt!205687 lt!205686 lt!205690))))

(declare-fun e!265346 () Bool)

(assert (=> d!74375 e!265346))

(declare-fun res!270062 () Bool)

(assert (=> d!74375 (=> (not res!270062) (not e!265346))))

(assert (=> d!74375 (= res!270062 (not (contains!2498 lt!205688 lt!205690)))))

(assert (=> d!74375 (= (addStillNotContains!146 lt!205688 lt!205687 lt!205686 lt!205690) lt!205746)))

(declare-fun b!453322 () Bool)

(assert (=> b!453322 (= e!265346 (not (= lt!205687 lt!205690)))))

(assert (= (and d!74375 res!270062) b!453322))

(assert (=> d!74375 m!437113))

(assert (=> d!74375 m!437113))

(assert (=> d!74375 m!437115))

(declare-fun m!437273 () Bool)

(assert (=> d!74375 m!437273))

(declare-fun m!437275 () Bool)

(assert (=> d!74375 m!437275))

(assert (=> b!453234 d!74375))

(declare-fun c!56203 () Bool)

(declare-fun d!74377 () Bool)

(assert (=> d!74377 (= c!56203 ((_ is ValueCellFull!5727) (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265347 () V!17293)

(assert (=> d!74377 (= (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265347)))

(declare-fun b!453323 () Bool)

(assert (=> b!453323 (= e!265347 (get!6654 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453324 () Bool)

(assert (=> b!453324 (= e!265347 (get!6655 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74377 c!56203) b!453323))

(assert (= (and d!74377 (not c!56203)) b!453324))

(assert (=> b!453323 m!437117))

(assert (=> b!453323 m!436867))

(declare-fun m!437277 () Bool)

(assert (=> b!453323 m!437277))

(assert (=> b!453324 m!437117))

(assert (=> b!453324 m!436867))

(declare-fun m!437279 () Bool)

(assert (=> b!453324 m!437279))

(assert (=> b!453234 d!74377))

(declare-fun d!74379 () Bool)

(declare-fun e!265348 () Bool)

(assert (=> d!74379 e!265348))

(declare-fun res!270064 () Bool)

(assert (=> d!74379 (=> (not res!270064) (not e!265348))))

(declare-fun lt!205750 () ListLongMap!6969)

(assert (=> d!74379 (= res!270064 (contains!2498 lt!205750 (_1!4039 (tuple2!8057 lt!205687 lt!205686))))))

(declare-fun lt!205748 () List!8113)

(assert (=> d!74379 (= lt!205750 (ListLongMap!6970 lt!205748))))

(declare-fun lt!205749 () Unit!13248)

(declare-fun lt!205747 () Unit!13248)

(assert (=> d!74379 (= lt!205749 lt!205747)))

(assert (=> d!74379 (= (getValueByKey!370 lt!205748 (_1!4039 (tuple2!8057 lt!205687 lt!205686))) (Some!375 (_2!4039 (tuple2!8057 lt!205687 lt!205686))))))

(assert (=> d!74379 (= lt!205747 (lemmaContainsTupThenGetReturnValue!192 lt!205748 (_1!4039 (tuple2!8057 lt!205687 lt!205686)) (_2!4039 (tuple2!8057 lt!205687 lt!205686))))))

(assert (=> d!74379 (= lt!205748 (insertStrictlySorted!195 (toList!3500 lt!205688) (_1!4039 (tuple2!8057 lt!205687 lt!205686)) (_2!4039 (tuple2!8057 lt!205687 lt!205686))))))

(assert (=> d!74379 (= (+!1576 lt!205688 (tuple2!8057 lt!205687 lt!205686)) lt!205750)))

(declare-fun b!453325 () Bool)

(declare-fun res!270063 () Bool)

(assert (=> b!453325 (=> (not res!270063) (not e!265348))))

(assert (=> b!453325 (= res!270063 (= (getValueByKey!370 (toList!3500 lt!205750) (_1!4039 (tuple2!8057 lt!205687 lt!205686))) (Some!375 (_2!4039 (tuple2!8057 lt!205687 lt!205686)))))))

(declare-fun b!453326 () Bool)

(assert (=> b!453326 (= e!265348 (contains!2499 (toList!3500 lt!205750) (tuple2!8057 lt!205687 lt!205686)))))

(assert (= (and d!74379 res!270064) b!453325))

(assert (= (and b!453325 res!270063) b!453326))

(declare-fun m!437281 () Bool)

(assert (=> d!74379 m!437281))

(declare-fun m!437283 () Bool)

(assert (=> d!74379 m!437283))

(declare-fun m!437285 () Bool)

(assert (=> d!74379 m!437285))

(declare-fun m!437287 () Bool)

(assert (=> d!74379 m!437287))

(declare-fun m!437289 () Bool)

(assert (=> b!453325 m!437289))

(declare-fun m!437291 () Bool)

(assert (=> b!453326 m!437291))

(assert (=> b!453234 d!74379))

(declare-fun b!453327 () Bool)

(declare-fun lt!205757 () Unit!13248)

(declare-fun lt!205755 () Unit!13248)

(assert (=> b!453327 (= lt!205757 lt!205755)))

(declare-fun lt!205754 () ListLongMap!6969)

(declare-fun lt!205752 () V!17293)

(declare-fun lt!205753 () (_ BitVec 64))

(declare-fun lt!205756 () (_ BitVec 64))

(assert (=> b!453327 (not (contains!2498 (+!1576 lt!205754 (tuple2!8057 lt!205753 lt!205752)) lt!205756))))

(assert (=> b!453327 (= lt!205755 (addStillNotContains!146 lt!205754 lt!205753 lt!205752 lt!205756))))

(assert (=> b!453327 (= lt!205756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453327 (= lt!205752 (get!6653 (select (arr!13490 lt!205593) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453327 (= lt!205753 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30051 () ListLongMap!6969)

(assert (=> b!453327 (= lt!205754 call!30051)))

(declare-fun e!265349 () ListLongMap!6969)

(assert (=> b!453327 (= e!265349 (+!1576 call!30051 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001)) (get!6653 (select (arr!13490 lt!205593) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453328 () Bool)

(declare-fun e!265355 () ListLongMap!6969)

(assert (=> b!453328 (= e!265355 e!265349)))

(declare-fun c!56207 () Bool)

(assert (=> b!453328 (= c!56207 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453329 () Bool)

(declare-fun e!265350 () Bool)

(declare-fun e!265352 () Bool)

(assert (=> b!453329 (= e!265350 e!265352)))

(declare-fun c!56204 () Bool)

(assert (=> b!453329 (= c!56204 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun b!453330 () Bool)

(declare-fun res!270067 () Bool)

(declare-fun e!265353 () Bool)

(assert (=> b!453330 (=> (not res!270067) (not e!265353))))

(declare-fun lt!205751 () ListLongMap!6969)

(assert (=> b!453330 (= res!270067 (not (contains!2498 lt!205751 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453331 () Bool)

(assert (=> b!453331 (= e!265352 (isEmpty!559 lt!205751))))

(declare-fun b!453332 () Bool)

(assert (=> b!453332 (= e!265349 call!30051)))

(declare-fun b!453333 () Bool)

(assert (=> b!453333 (= e!265353 e!265350)))

(declare-fun c!56205 () Bool)

(declare-fun e!265354 () Bool)

(assert (=> b!453333 (= c!56205 e!265354)))

(declare-fun res!270066 () Bool)

(assert (=> b!453333 (=> (not res!270066) (not e!265354))))

(assert (=> b!453333 (= res!270066 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun b!453334 () Bool)

(assert (=> b!453334 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> b!453334 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13842 lt!205593)))))

(declare-fun e!265351 () Bool)

(assert (=> b!453334 (= e!265351 (= (apply!313 lt!205751 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001))) (get!6653 (select (arr!13490 lt!205593) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453335 () Bool)

(assert (=> b!453335 (= e!265350 e!265351)))

(assert (=> b!453335 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun res!270065 () Bool)

(assert (=> b!453335 (= res!270065 (contains!2498 lt!205751 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453335 (=> (not res!270065) (not e!265351))))

(declare-fun bm!30048 () Bool)

(assert (=> bm!30048 (= call!30051 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74381 () Bool)

(assert (=> d!74381 e!265353))

(declare-fun res!270068 () Bool)

(assert (=> d!74381 (=> (not res!270068) (not e!265353))))

(assert (=> d!74381 (= res!270068 (not (contains!2498 lt!205751 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74381 (= lt!205751 e!265355)))

(declare-fun c!56206 () Bool)

(assert (=> d!74381 (= c!56206 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> d!74381 (validMask!0 mask!1025)))

(assert (=> d!74381 (= (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205751)))

(declare-fun b!453336 () Bool)

(assert (=> b!453336 (= e!265355 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453337 () Bool)

(assert (=> b!453337 (= e!265354 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453337 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453338 () Bool)

(assert (=> b!453338 (= e!265352 (= lt!205751 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74381 c!56206) b!453336))

(assert (= (and d!74381 (not c!56206)) b!453328))

(assert (= (and b!453328 c!56207) b!453327))

(assert (= (and b!453328 (not c!56207)) b!453332))

(assert (= (or b!453327 b!453332) bm!30048))

(assert (= (and d!74381 res!270068) b!453330))

(assert (= (and b!453330 res!270067) b!453333))

(assert (= (and b!453333 res!270066) b!453337))

(assert (= (and b!453333 c!56205) b!453335))

(assert (= (and b!453333 (not c!56205)) b!453329))

(assert (= (and b!453335 res!270065) b!453334))

(assert (= (and b!453329 c!56204) b!453338))

(assert (= (and b!453329 (not c!56204)) b!453331))

(declare-fun b_lambda!9627 () Bool)

(assert (=> (not b_lambda!9627) (not b!453327)))

(assert (=> b!453327 t!13938))

(declare-fun b_and!18921 () Bool)

(assert (= b_and!18919 (and (=> t!13938 result!7103) b_and!18921)))

(declare-fun b_lambda!9629 () Bool)

(assert (=> (not b_lambda!9629) (not b!453334)))

(assert (=> b!453334 t!13938))

(declare-fun b_and!18923 () Bool)

(assert (= b_and!18921 (and (=> t!13938 result!7103) b_and!18923)))

(declare-fun m!437293 () Bool)

(assert (=> bm!30048 m!437293))

(declare-fun m!437295 () Bool)

(assert (=> b!453330 m!437295))

(assert (=> b!453338 m!437293))

(declare-fun m!437297 () Bool)

(assert (=> d!74381 m!437297))

(assert (=> d!74381 m!436891))

(declare-fun m!437299 () Bool)

(assert (=> b!453328 m!437299))

(assert (=> b!453328 m!437299))

(declare-fun m!437301 () Bool)

(assert (=> b!453328 m!437301))

(assert (=> b!453335 m!437299))

(assert (=> b!453335 m!437299))

(declare-fun m!437303 () Bool)

(assert (=> b!453335 m!437303))

(declare-fun m!437305 () Bool)

(assert (=> b!453331 m!437305))

(declare-fun m!437307 () Bool)

(assert (=> b!453327 m!437307))

(declare-fun m!437309 () Bool)

(assert (=> b!453327 m!437309))

(declare-fun m!437311 () Bool)

(assert (=> b!453327 m!437311))

(assert (=> b!453327 m!437307))

(declare-fun m!437313 () Bool)

(assert (=> b!453327 m!437313))

(assert (=> b!453327 m!437311))

(assert (=> b!453327 m!436867))

(declare-fun m!437315 () Bool)

(assert (=> b!453327 m!437315))

(assert (=> b!453327 m!436867))

(assert (=> b!453327 m!437299))

(declare-fun m!437317 () Bool)

(assert (=> b!453327 m!437317))

(assert (=> b!453337 m!437299))

(assert (=> b!453337 m!437299))

(assert (=> b!453337 m!437301))

(assert (=> b!453334 m!437299))

(assert (=> b!453334 m!437311))

(assert (=> b!453334 m!437311))

(assert (=> b!453334 m!436867))

(assert (=> b!453334 m!437315))

(assert (=> b!453334 m!437299))

(declare-fun m!437319 () Bool)

(assert (=> b!453334 m!437319))

(assert (=> b!453334 m!436867))

(assert (=> b!453221 d!74381))

(declare-fun d!74383 () Bool)

(assert (=> d!74383 (= (get!6654 (select (arr!13490 _values!549) from!863) lt!205588) (v!8374 (select (arr!13490 _values!549) from!863)))))

(assert (=> b!453250 d!74383))

(declare-fun d!74385 () Bool)

(assert (=> d!74385 (= (validKeyInArray!0 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453196 d!74385))

(declare-fun d!74387 () Bool)

(assert (=> d!74387 (= (get!6655 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588) lt!205588)))

(assert (=> b!453269 d!74387))

(declare-fun bm!30049 () Bool)

(declare-fun call!30052 () Bool)

(assert (=> bm!30049 (= call!30052 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!205595 mask!1025))))

(declare-fun b!453339 () Bool)

(declare-fun e!265356 () Bool)

(assert (=> b!453339 (= e!265356 call!30052)))

(declare-fun d!74389 () Bool)

(declare-fun res!270070 () Bool)

(declare-fun e!265358 () Bool)

(assert (=> d!74389 (=> res!270070 e!265358)))

(assert (=> d!74389 (= res!270070 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> d!74389 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205595 mask!1025) e!265358)))

(declare-fun b!453340 () Bool)

(declare-fun e!265357 () Bool)

(assert (=> b!453340 (= e!265357 call!30052)))

(declare-fun b!453341 () Bool)

(assert (=> b!453341 (= e!265358 e!265356)))

(declare-fun c!56208 () Bool)

(assert (=> b!453341 (= c!56208 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453342 () Bool)

(assert (=> b!453342 (= e!265356 e!265357)))

(declare-fun lt!205759 () (_ BitVec 64))

(assert (=> b!453342 (= lt!205759 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205758 () Unit!13248)

(assert (=> b!453342 (= lt!205758 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205595 lt!205759 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453342 (arrayContainsKey!0 lt!205595 lt!205759 #b00000000000000000000000000000000)))

(declare-fun lt!205760 () Unit!13248)

(assert (=> b!453342 (= lt!205760 lt!205758)))

(declare-fun res!270069 () Bool)

(assert (=> b!453342 (= res!270069 (= (seekEntryOrOpen!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!205595 mask!1025) (Found!3532 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453342 (=> (not res!270069) (not e!265357))))

(assert (= (and d!74389 (not res!270070)) b!453341))

(assert (= (and b!453341 c!56208) b!453342))

(assert (= (and b!453341 (not c!56208)) b!453339))

(assert (= (and b!453342 res!270069) b!453340))

(assert (= (or b!453340 b!453339) bm!30049))

(declare-fun m!437321 () Bool)

(assert (=> bm!30049 m!437321))

(declare-fun m!437323 () Bool)

(assert (=> b!453341 m!437323))

(assert (=> b!453341 m!437323))

(declare-fun m!437325 () Bool)

(assert (=> b!453341 m!437325))

(assert (=> b!453342 m!437323))

(declare-fun m!437327 () Bool)

(assert (=> b!453342 m!437327))

(declare-fun m!437329 () Bool)

(assert (=> b!453342 m!437329))

(assert (=> b!453342 m!437323))

(declare-fun m!437331 () Bool)

(assert (=> b!453342 m!437331))

(assert (=> bm!30040 d!74389))

(declare-fun lt!205763 () Bool)

(declare-fun d!74391 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!203 (List!8113) (InoxSet tuple2!8056))

(assert (=> d!74391 (= lt!205763 (select (content!203 (toList!3500 lt!205721)) (tuple2!8057 k0!794 lt!205587)))))

(declare-fun e!265364 () Bool)

(assert (=> d!74391 (= lt!205763 e!265364)))

(declare-fun res!270075 () Bool)

(assert (=> d!74391 (=> (not res!270075) (not e!265364))))

(assert (=> d!74391 (= res!270075 ((_ is Cons!8109) (toList!3500 lt!205721)))))

(assert (=> d!74391 (= (contains!2499 (toList!3500 lt!205721) (tuple2!8057 k0!794 lt!205587)) lt!205763)))

(declare-fun b!453347 () Bool)

(declare-fun e!265363 () Bool)

(assert (=> b!453347 (= e!265364 e!265363)))

(declare-fun res!270076 () Bool)

(assert (=> b!453347 (=> res!270076 e!265363)))

(assert (=> b!453347 (= res!270076 (= (h!8965 (toList!3500 lt!205721)) (tuple2!8057 k0!794 lt!205587)))))

(declare-fun b!453348 () Bool)

(assert (=> b!453348 (= e!265363 (contains!2499 (t!13939 (toList!3500 lt!205721)) (tuple2!8057 k0!794 lt!205587)))))

(assert (= (and d!74391 res!270075) b!453347))

(assert (= (and b!453347 (not res!270076)) b!453348))

(declare-fun m!437333 () Bool)

(assert (=> d!74391 m!437333))

(declare-fun m!437335 () Bool)

(assert (=> d!74391 m!437335))

(declare-fun m!437337 () Bool)

(assert (=> b!453348 m!437337))

(assert (=> b!453275 d!74391))

(declare-fun b!453349 () Bool)

(declare-fun lt!205770 () Unit!13248)

(declare-fun lt!205768 () Unit!13248)

(assert (=> b!453349 (= lt!205770 lt!205768)))

(declare-fun lt!205767 () ListLongMap!6969)

(declare-fun lt!205769 () (_ BitVec 64))

(declare-fun lt!205765 () V!17293)

(declare-fun lt!205766 () (_ BitVec 64))

(assert (=> b!453349 (not (contains!2498 (+!1576 lt!205767 (tuple2!8057 lt!205766 lt!205765)) lt!205769))))

(assert (=> b!453349 (= lt!205768 (addStillNotContains!146 lt!205767 lt!205766 lt!205765 lt!205769))))

(assert (=> b!453349 (= lt!205769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453349 (= lt!205765 (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453349 (= lt!205766 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30053 () ListLongMap!6969)

(assert (=> b!453349 (= lt!205767 call!30053)))

(declare-fun e!265365 () ListLongMap!6969)

(assert (=> b!453349 (= e!265365 (+!1576 call!30053 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453350 () Bool)

(declare-fun e!265371 () ListLongMap!6969)

(assert (=> b!453350 (= e!265371 e!265365)))

(declare-fun c!56212 () Bool)

(assert (=> b!453350 (= c!56212 (validKeyInArray!0 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453351 () Bool)

(declare-fun e!265366 () Bool)

(declare-fun e!265368 () Bool)

(assert (=> b!453351 (= e!265366 e!265368)))

(declare-fun c!56209 () Bool)

(assert (=> b!453351 (= c!56209 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun b!453352 () Bool)

(declare-fun res!270079 () Bool)

(declare-fun e!265369 () Bool)

(assert (=> b!453352 (=> (not res!270079) (not e!265369))))

(declare-fun lt!205764 () ListLongMap!6969)

(assert (=> b!453352 (= res!270079 (not (contains!2498 lt!205764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453353 () Bool)

(assert (=> b!453353 (= e!265368 (isEmpty!559 lt!205764))))

(declare-fun b!453354 () Bool)

(assert (=> b!453354 (= e!265365 call!30053)))

(declare-fun b!453355 () Bool)

(assert (=> b!453355 (= e!265369 e!265366)))

(declare-fun c!56210 () Bool)

(declare-fun e!265370 () Bool)

(assert (=> b!453355 (= c!56210 e!265370)))

(declare-fun res!270078 () Bool)

(assert (=> b!453355 (=> (not res!270078) (not e!265370))))

(assert (=> b!453355 (= res!270078 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun b!453356 () Bool)

(assert (=> b!453356 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(assert (=> b!453356 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13842 (ite c!56153 lt!205593 _values!549))))))

(declare-fun e!265367 () Bool)

(assert (=> b!453356 (= e!265367 (= (apply!313 lt!205764 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453357 () Bool)

(assert (=> b!453357 (= e!265366 e!265367)))

(assert (=> b!453357 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(declare-fun res!270077 () Bool)

(assert (=> b!453357 (= res!270077 (contains!2498 lt!205764 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453357 (=> (not res!270077) (not e!265367))))

(declare-fun bm!30050 () Bool)

(assert (=> bm!30050 (= call!30053 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74393 () Bool)

(assert (=> d!74393 e!265369))

(declare-fun res!270080 () Bool)

(assert (=> d!74393 (=> (not res!270080) (not e!265369))))

(assert (=> d!74393 (= res!270080 (not (contains!2498 lt!205764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74393 (= lt!205764 e!265371)))

(declare-fun c!56211 () Bool)

(assert (=> d!74393 (= c!56211 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 lt!205595 _keys!709))))))

(assert (=> d!74393 (validMask!0 mask!1025)))

(assert (=> d!74393 (= (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205764)))

(declare-fun b!453358 () Bool)

(assert (=> b!453358 (= e!265371 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453359 () Bool)

(assert (=> b!453359 (= e!265370 (validKeyInArray!0 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453359 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453360 () Bool)

(assert (=> b!453360 (= e!265368 (= lt!205764 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 lt!205595 _keys!709) (ite c!56153 lt!205593 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74393 c!56211) b!453358))

(assert (= (and d!74393 (not c!56211)) b!453350))

(assert (= (and b!453350 c!56212) b!453349))

(assert (= (and b!453350 (not c!56212)) b!453354))

(assert (= (or b!453349 b!453354) bm!30050))

(assert (= (and d!74393 res!270080) b!453352))

(assert (= (and b!453352 res!270079) b!453355))

(assert (= (and b!453355 res!270078) b!453359))

(assert (= (and b!453355 c!56210) b!453357))

(assert (= (and b!453355 (not c!56210)) b!453351))

(assert (= (and b!453357 res!270077) b!453356))

(assert (= (and b!453351 c!56209) b!453360))

(assert (= (and b!453351 (not c!56209)) b!453353))

(declare-fun b_lambda!9631 () Bool)

(assert (=> (not b_lambda!9631) (not b!453349)))

(assert (=> b!453349 t!13938))

(declare-fun b_and!18925 () Bool)

(assert (= b_and!18923 (and (=> t!13938 result!7103) b_and!18925)))

(declare-fun b_lambda!9633 () Bool)

(assert (=> (not b_lambda!9633) (not b!453356)))

(assert (=> b!453356 t!13938))

(declare-fun b_and!18927 () Bool)

(assert (= b_and!18925 (and (=> t!13938 result!7103) b_and!18927)))

(declare-fun m!437339 () Bool)

(assert (=> bm!30050 m!437339))

(declare-fun m!437341 () Bool)

(assert (=> b!453352 m!437341))

(assert (=> b!453360 m!437339))

(declare-fun m!437343 () Bool)

(assert (=> d!74393 m!437343))

(assert (=> d!74393 m!436891))

(declare-fun m!437345 () Bool)

(assert (=> b!453350 m!437345))

(assert (=> b!453350 m!437345))

(declare-fun m!437347 () Bool)

(assert (=> b!453350 m!437347))

(assert (=> b!453357 m!437345))

(assert (=> b!453357 m!437345))

(declare-fun m!437349 () Bool)

(assert (=> b!453357 m!437349))

(declare-fun m!437351 () Bool)

(assert (=> b!453353 m!437351))

(declare-fun m!437353 () Bool)

(assert (=> b!453349 m!437353))

(declare-fun m!437355 () Bool)

(assert (=> b!453349 m!437355))

(declare-fun m!437357 () Bool)

(assert (=> b!453349 m!437357))

(assert (=> b!453349 m!437353))

(declare-fun m!437359 () Bool)

(assert (=> b!453349 m!437359))

(assert (=> b!453349 m!437357))

(assert (=> b!453349 m!436867))

(declare-fun m!437361 () Bool)

(assert (=> b!453349 m!437361))

(assert (=> b!453349 m!436867))

(assert (=> b!453349 m!437345))

(declare-fun m!437363 () Bool)

(assert (=> b!453349 m!437363))

(assert (=> b!453359 m!437345))

(assert (=> b!453359 m!437345))

(assert (=> b!453359 m!437347))

(assert (=> b!453356 m!437345))

(assert (=> b!453356 m!437357))

(assert (=> b!453356 m!437357))

(assert (=> b!453356 m!436867))

(assert (=> b!453356 m!437361))

(assert (=> b!453356 m!437345))

(declare-fun m!437365 () Bool)

(assert (=> b!453356 m!437365))

(assert (=> b!453356 m!436867))

(assert (=> bm!30032 d!74393))

(declare-fun call!30059 () ListLongMap!6969)

(declare-fun bm!30055 () Bool)

(assert (=> bm!30055 (= call!30059 (getCurrentListMapNoExtraKeys!1683 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)) (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453366 () Bool)

(declare-fun e!265374 () Bool)

(declare-fun call!30058 () ListLongMap!6969)

(assert (=> b!453366 (= e!265374 (= call!30059 call!30058))))

(declare-fun d!74395 () Bool)

(assert (=> d!74395 e!265374))

(declare-fun c!56215 () Bool)

(assert (=> d!74395 (= c!56215 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (=> d!74395 true))

(declare-fun _$4!58 () Unit!13248)

(assert (=> d!74395 (= (choose!1328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) _$4!58)))

(declare-fun b!453365 () Bool)

(assert (=> b!453365 (= e!265374 (= call!30059 (+!1576 call!30058 (tuple2!8057 k0!794 v!412))))))

(declare-fun bm!30056 () Bool)

(assert (=> bm!30056 (= call!30058 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74395 c!56215) b!453365))

(assert (= (and d!74395 (not c!56215)) b!453366))

(assert (= (or b!453365 b!453366) bm!30055))

(assert (= (or b!453365 b!453366) bm!30056))

(assert (=> bm!30055 m!436857))

(assert (=> bm!30055 m!436869))

(assert (=> bm!30055 m!437239))

(declare-fun m!437367 () Bool)

(assert (=> b!453365 m!437367))

(assert (=> bm!30056 m!437243))

(assert (=> d!74363 d!74395))

(declare-fun b!453367 () Bool)

(declare-fun lt!205777 () Unit!13248)

(declare-fun lt!205775 () Unit!13248)

(assert (=> b!453367 (= lt!205777 lt!205775)))

(declare-fun lt!205774 () ListLongMap!6969)

(declare-fun lt!205776 () (_ BitVec 64))

(declare-fun lt!205772 () V!17293)

(declare-fun lt!205773 () (_ BitVec 64))

(assert (=> b!453367 (not (contains!2498 (+!1576 lt!205774 (tuple2!8057 lt!205773 lt!205772)) lt!205776))))

(assert (=> b!453367 (= lt!205775 (addStillNotContains!146 lt!205774 lt!205773 lt!205772 lt!205776))))

(assert (=> b!453367 (= lt!205776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453367 (= lt!205772 (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453367 (= lt!205773 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30060 () ListLongMap!6969)

(assert (=> b!453367 (= lt!205774 call!30060)))

(declare-fun e!265375 () ListLongMap!6969)

(assert (=> b!453367 (= e!265375 (+!1576 call!30060 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453368 () Bool)

(declare-fun e!265381 () ListLongMap!6969)

(assert (=> b!453368 (= e!265381 e!265375)))

(declare-fun c!56219 () Bool)

(assert (=> b!453368 (= c!56219 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453369 () Bool)

(declare-fun e!265376 () Bool)

(declare-fun e!265378 () Bool)

(assert (=> b!453369 (= e!265376 e!265378)))

(declare-fun c!56216 () Bool)

(assert (=> b!453369 (= c!56216 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun b!453370 () Bool)

(declare-fun res!270083 () Bool)

(declare-fun e!265379 () Bool)

(assert (=> b!453370 (=> (not res!270083) (not e!265379))))

(declare-fun lt!205771 () ListLongMap!6969)

(assert (=> b!453370 (= res!270083 (not (contains!2498 lt!205771 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453371 () Bool)

(assert (=> b!453371 (= e!265378 (isEmpty!559 lt!205771))))

(declare-fun b!453372 () Bool)

(assert (=> b!453372 (= e!265375 call!30060)))

(declare-fun b!453373 () Bool)

(assert (=> b!453373 (= e!265379 e!265376)))

(declare-fun c!56217 () Bool)

(declare-fun e!265380 () Bool)

(assert (=> b!453373 (= c!56217 e!265380)))

(declare-fun res!270082 () Bool)

(assert (=> b!453373 (=> (not res!270082) (not e!265380))))

(assert (=> b!453373 (= res!270082 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun b!453374 () Bool)

(assert (=> b!453374 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> b!453374 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13842 lt!205593)))))

(declare-fun e!265377 () Bool)

(assert (=> b!453374 (= e!265377 (= (apply!313 lt!205771 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453375 () Bool)

(assert (=> b!453375 (= e!265376 e!265377)))

(assert (=> b!453375 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun res!270081 () Bool)

(assert (=> b!453375 (= res!270081 (contains!2498 lt!205771 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453375 (=> (not res!270081) (not e!265377))))

(declare-fun bm!30057 () Bool)

(assert (=> bm!30057 (= call!30060 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74397 () Bool)

(assert (=> d!74397 e!265379))

(declare-fun res!270084 () Bool)

(assert (=> d!74397 (=> (not res!270084) (not e!265379))))

(assert (=> d!74397 (= res!270084 (not (contains!2498 lt!205771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74397 (= lt!205771 e!265381)))

(declare-fun c!56218 () Bool)

(assert (=> d!74397 (= c!56218 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> d!74397 (validMask!0 mask!1025)))

(assert (=> d!74397 (= (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205771)))

(declare-fun b!453376 () Bool)

(assert (=> b!453376 (= e!265381 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453377 () Bool)

(assert (=> b!453377 (= e!265380 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453377 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453378 () Bool)

(assert (=> b!453378 (= e!265378 (= lt!205771 (getCurrentListMapNoExtraKeys!1683 lt!205595 lt!205593 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74397 c!56218) b!453376))

(assert (= (and d!74397 (not c!56218)) b!453368))

(assert (= (and b!453368 c!56219) b!453367))

(assert (= (and b!453368 (not c!56219)) b!453372))

(assert (= (or b!453367 b!453372) bm!30057))

(assert (= (and d!74397 res!270084) b!453370))

(assert (= (and b!453370 res!270083) b!453373))

(assert (= (and b!453373 res!270082) b!453377))

(assert (= (and b!453373 c!56217) b!453375))

(assert (= (and b!453373 (not c!56217)) b!453369))

(assert (= (and b!453375 res!270081) b!453374))

(assert (= (and b!453369 c!56216) b!453378))

(assert (= (and b!453369 (not c!56216)) b!453371))

(declare-fun b_lambda!9635 () Bool)

(assert (=> (not b_lambda!9635) (not b!453367)))

(assert (=> b!453367 t!13938))

(declare-fun b_and!18929 () Bool)

(assert (= b_and!18927 (and (=> t!13938 result!7103) b_and!18929)))

(declare-fun b_lambda!9637 () Bool)

(assert (=> (not b_lambda!9637) (not b!453374)))

(assert (=> b!453374 t!13938))

(declare-fun b_and!18931 () Bool)

(assert (= b_and!18929 (and (=> t!13938 result!7103) b_and!18931)))

(declare-fun m!437369 () Bool)

(assert (=> bm!30057 m!437369))

(declare-fun m!437371 () Bool)

(assert (=> b!453370 m!437371))

(assert (=> b!453378 m!437369))

(declare-fun m!437373 () Bool)

(assert (=> d!74397 m!437373))

(assert (=> d!74397 m!436891))

(declare-fun m!437375 () Bool)

(assert (=> b!453368 m!437375))

(assert (=> b!453368 m!437375))

(declare-fun m!437377 () Bool)

(assert (=> b!453368 m!437377))

(assert (=> b!453375 m!437375))

(assert (=> b!453375 m!437375))

(declare-fun m!437379 () Bool)

(assert (=> b!453375 m!437379))

(declare-fun m!437381 () Bool)

(assert (=> b!453371 m!437381))

(declare-fun m!437383 () Bool)

(assert (=> b!453367 m!437383))

(declare-fun m!437385 () Bool)

(assert (=> b!453367 m!437385))

(declare-fun m!437387 () Bool)

(assert (=> b!453367 m!437387))

(assert (=> b!453367 m!437383))

(declare-fun m!437389 () Bool)

(assert (=> b!453367 m!437389))

(assert (=> b!453367 m!437387))

(assert (=> b!453367 m!436867))

(declare-fun m!437391 () Bool)

(assert (=> b!453367 m!437391))

(assert (=> b!453367 m!436867))

(assert (=> b!453367 m!437375))

(declare-fun m!437393 () Bool)

(assert (=> b!453367 m!437393))

(assert (=> b!453377 m!437375))

(assert (=> b!453377 m!437375))

(assert (=> b!453377 m!437377))

(assert (=> b!453374 m!437375))

(assert (=> b!453374 m!437387))

(assert (=> b!453374 m!437387))

(assert (=> b!453374 m!436867))

(assert (=> b!453374 m!437391))

(assert (=> b!453374 m!437375))

(declare-fun m!437395 () Bool)

(assert (=> b!453374 m!437395))

(assert (=> b!453374 m!436867))

(assert (=> b!453265 d!74397))

(declare-fun d!74399 () Bool)

(declare-fun e!265383 () Bool)

(assert (=> d!74399 e!265383))

(declare-fun res!270085 () Bool)

(assert (=> d!74399 (=> res!270085 e!265383)))

(declare-fun lt!205779 () Bool)

(assert (=> d!74399 (= res!270085 (not lt!205779))))

(declare-fun lt!205780 () Bool)

(assert (=> d!74399 (= lt!205779 lt!205780)))

(declare-fun lt!205778 () Unit!13248)

(declare-fun e!265382 () Unit!13248)

(assert (=> d!74399 (= lt!205778 e!265382)))

(declare-fun c!56220 () Bool)

(assert (=> d!74399 (= c!56220 lt!205780)))

(assert (=> d!74399 (= lt!205780 (containsKey!347 (toList!3500 lt!205678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74399 (= (contains!2498 lt!205678 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205779)))

(declare-fun b!453379 () Bool)

(declare-fun lt!205781 () Unit!13248)

(assert (=> b!453379 (= e!265382 lt!205781)))

(assert (=> b!453379 (= lt!205781 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453379 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453380 () Bool)

(declare-fun Unit!13251 () Unit!13248)

(assert (=> b!453380 (= e!265382 Unit!13251)))

(declare-fun b!453381 () Bool)

(assert (=> b!453381 (= e!265383 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74399 c!56220) b!453379))

(assert (= (and d!74399 (not c!56220)) b!453380))

(assert (= (and d!74399 (not res!270085)) b!453381))

(declare-fun m!437397 () Bool)

(assert (=> d!74399 m!437397))

(declare-fun m!437399 () Bool)

(assert (=> b!453379 m!437399))

(declare-fun m!437401 () Bool)

(assert (=> b!453379 m!437401))

(assert (=> b!453379 m!437401))

(declare-fun m!437403 () Bool)

(assert (=> b!453379 m!437403))

(assert (=> b!453381 m!437401))

(assert (=> b!453381 m!437401))

(assert (=> b!453381 m!437403))

(assert (=> b!453225 d!74399))

(declare-fun d!74401 () Bool)

(assert (=> d!74401 (arrayContainsKey!0 lt!205595 lt!205723 #b00000000000000000000000000000000)))

(declare-fun lt!205784 () Unit!13248)

(declare-fun choose!13 (array!28089 (_ BitVec 64) (_ BitVec 32)) Unit!13248)

(assert (=> d!74401 (= lt!205784 (choose!13 lt!205595 lt!205723 #b00000000000000000000000000000000))))

(assert (=> d!74401 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74401 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205595 lt!205723 #b00000000000000000000000000000000) lt!205784)))

(declare-fun bs!14403 () Bool)

(assert (= bs!14403 d!74401))

(assert (=> bs!14403 m!437233))

(declare-fun m!437405 () Bool)

(assert (=> bs!14403 m!437405))

(assert (=> b!453279 d!74401))

(declare-fun d!74403 () Bool)

(declare-fun res!270086 () Bool)

(declare-fun e!265384 () Bool)

(assert (=> d!74403 (=> res!270086 e!265384)))

(assert (=> d!74403 (= res!270086 (= (select (arr!13489 lt!205595) #b00000000000000000000000000000000) lt!205723))))

(assert (=> d!74403 (= (arrayContainsKey!0 lt!205595 lt!205723 #b00000000000000000000000000000000) e!265384)))

(declare-fun b!453382 () Bool)

(declare-fun e!265385 () Bool)

(assert (=> b!453382 (= e!265384 e!265385)))

(declare-fun res!270087 () Bool)

(assert (=> b!453382 (=> (not res!270087) (not e!265385))))

(assert (=> b!453382 (= res!270087 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(declare-fun b!453383 () Bool)

(assert (=> b!453383 (= e!265385 (arrayContainsKey!0 lt!205595 lt!205723 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74403 (not res!270086)) b!453382))

(assert (= (and b!453382 res!270087) b!453383))

(assert (=> d!74403 m!436991))

(declare-fun m!437407 () Bool)

(assert (=> b!453383 m!437407))

(assert (=> b!453279 d!74403))

(declare-fun b!453396 () Bool)

(declare-fun e!265394 () SeekEntryResult!3532)

(declare-fun lt!205791 () SeekEntryResult!3532)

(assert (=> b!453396 (= e!265394 (Found!3532 (index!16309 lt!205791)))))

(declare-fun b!453397 () Bool)

(declare-fun e!265392 () SeekEntryResult!3532)

(assert (=> b!453397 (= e!265392 Undefined!3532)))

(declare-fun d!74405 () Bool)

(declare-fun lt!205793 () SeekEntryResult!3532)

(assert (=> d!74405 (and (or ((_ is Undefined!3532) lt!205793) (not ((_ is Found!3532) lt!205793)) (and (bvsge (index!16308 lt!205793) #b00000000000000000000000000000000) (bvslt (index!16308 lt!205793) (size!13841 lt!205595)))) (or ((_ is Undefined!3532) lt!205793) ((_ is Found!3532) lt!205793) (not ((_ is MissingZero!3532) lt!205793)) (and (bvsge (index!16307 lt!205793) #b00000000000000000000000000000000) (bvslt (index!16307 lt!205793) (size!13841 lt!205595)))) (or ((_ is Undefined!3532) lt!205793) ((_ is Found!3532) lt!205793) ((_ is MissingZero!3532) lt!205793) (not ((_ is MissingVacant!3532) lt!205793)) (and (bvsge (index!16310 lt!205793) #b00000000000000000000000000000000) (bvslt (index!16310 lt!205793) (size!13841 lt!205595)))) (or ((_ is Undefined!3532) lt!205793) (ite ((_ is Found!3532) lt!205793) (= (select (arr!13489 lt!205595) (index!16308 lt!205793)) (select (arr!13489 lt!205595) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3532) lt!205793) (= (select (arr!13489 lt!205595) (index!16307 lt!205793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3532) lt!205793) (= (select (arr!13489 lt!205595) (index!16310 lt!205793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74405 (= lt!205793 e!265392)))

(declare-fun c!56227 () Bool)

(assert (=> d!74405 (= c!56227 (and ((_ is Intermediate!3532) lt!205791) (undefined!4344 lt!205791)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28089 (_ BitVec 32)) SeekEntryResult!3532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!74405 (= lt!205791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) mask!1025) (select (arr!13489 lt!205595) #b00000000000000000000000000000000) lt!205595 mask!1025))))

(assert (=> d!74405 (validMask!0 mask!1025)))

(assert (=> d!74405 (= (seekEntryOrOpen!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) lt!205595 mask!1025) lt!205793)))

(declare-fun b!453398 () Bool)

(assert (=> b!453398 (= e!265392 e!265394)))

(declare-fun lt!205792 () (_ BitVec 64))

(assert (=> b!453398 (= lt!205792 (select (arr!13489 lt!205595) (index!16309 lt!205791)))))

(declare-fun c!56229 () Bool)

(assert (=> b!453398 (= c!56229 (= lt!205792 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun b!453399 () Bool)

(declare-fun e!265393 () SeekEntryResult!3532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28089 (_ BitVec 32)) SeekEntryResult!3532)

(assert (=> b!453399 (= e!265393 (seekKeyOrZeroReturnVacant!0 (x!42461 lt!205791) (index!16309 lt!205791) (index!16309 lt!205791) (select (arr!13489 lt!205595) #b00000000000000000000000000000000) lt!205595 mask!1025))))

(declare-fun b!453400 () Bool)

(declare-fun c!56228 () Bool)

(assert (=> b!453400 (= c!56228 (= lt!205792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453400 (= e!265394 e!265393)))

(declare-fun b!453401 () Bool)

(assert (=> b!453401 (= e!265393 (MissingZero!3532 (index!16309 lt!205791)))))

(assert (= (and d!74405 c!56227) b!453397))

(assert (= (and d!74405 (not c!56227)) b!453398))

(assert (= (and b!453398 c!56229) b!453396))

(assert (= (and b!453398 (not c!56229)) b!453400))

(assert (= (and b!453400 c!56228) b!453401))

(assert (= (and b!453400 (not c!56228)) b!453399))

(assert (=> d!74405 m!436991))

(declare-fun m!437409 () Bool)

(assert (=> d!74405 m!437409))

(declare-fun m!437411 () Bool)

(assert (=> d!74405 m!437411))

(assert (=> d!74405 m!436891))

(assert (=> d!74405 m!437409))

(assert (=> d!74405 m!436991))

(declare-fun m!437413 () Bool)

(assert (=> d!74405 m!437413))

(declare-fun m!437415 () Bool)

(assert (=> d!74405 m!437415))

(declare-fun m!437417 () Bool)

(assert (=> d!74405 m!437417))

(declare-fun m!437419 () Bool)

(assert (=> b!453398 m!437419))

(assert (=> b!453399 m!436991))

(declare-fun m!437421 () Bool)

(assert (=> b!453399 m!437421))

(assert (=> b!453279 d!74405))

(declare-fun d!74407 () Bool)

(declare-fun e!265396 () Bool)

(assert (=> d!74407 e!265396))

(declare-fun res!270088 () Bool)

(assert (=> d!74407 (=> res!270088 e!265396)))

(declare-fun lt!205795 () Bool)

(assert (=> d!74407 (= res!270088 (not lt!205795))))

(declare-fun lt!205796 () Bool)

(assert (=> d!74407 (= lt!205795 lt!205796)))

(declare-fun lt!205794 () Unit!13248)

(declare-fun e!265395 () Unit!13248)

(assert (=> d!74407 (= lt!205794 e!265395)))

(declare-fun c!56230 () Bool)

(assert (=> d!74407 (= c!56230 lt!205796)))

(assert (=> d!74407 (= lt!205796 (containsKey!347 (toList!3500 lt!205699) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74407 (= (contains!2498 lt!205699 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205795)))

(declare-fun b!453402 () Bool)

(declare-fun lt!205797 () Unit!13248)

(assert (=> b!453402 (= e!265395 lt!205797)))

(assert (=> b!453402 (= lt!205797 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205699) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453402 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453403 () Bool)

(declare-fun Unit!13252 () Unit!13248)

(assert (=> b!453403 (= e!265395 Unit!13252)))

(declare-fun b!453404 () Bool)

(assert (=> b!453404 (= e!265396 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74407 c!56230) b!453402))

(assert (= (and d!74407 (not c!56230)) b!453403))

(assert (= (and d!74407 (not res!270088)) b!453404))

(declare-fun m!437423 () Bool)

(assert (=> d!74407 m!437423))

(declare-fun m!437425 () Bool)

(assert (=> b!453402 m!437425))

(declare-fun m!437427 () Bool)

(assert (=> b!453402 m!437427))

(assert (=> b!453402 m!437427))

(declare-fun m!437429 () Bool)

(assert (=> b!453402 m!437429))

(assert (=> b!453404 m!437427))

(assert (=> b!453404 m!437427))

(assert (=> b!453404 m!437429))

(assert (=> d!74347 d!74407))

(assert (=> d!74347 d!74323))

(declare-fun d!74409 () Bool)

(declare-fun e!265398 () Bool)

(assert (=> d!74409 e!265398))

(declare-fun res!270089 () Bool)

(assert (=> d!74409 (=> res!270089 e!265398)))

(declare-fun lt!205799 () Bool)

(assert (=> d!74409 (= res!270089 (not lt!205799))))

(declare-fun lt!205800 () Bool)

(assert (=> d!74409 (= lt!205799 lt!205800)))

(declare-fun lt!205798 () Unit!13248)

(declare-fun e!265397 () Unit!13248)

(assert (=> d!74409 (= lt!205798 e!265397)))

(declare-fun c!56231 () Bool)

(assert (=> d!74409 (= c!56231 lt!205800)))

(assert (=> d!74409 (= lt!205800 (containsKey!347 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (=> d!74409 (= (contains!2498 lt!205713 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) lt!205799)))

(declare-fun b!453405 () Bool)

(declare-fun lt!205801 () Unit!13248)

(assert (=> b!453405 (= e!265397 lt!205801)))

(assert (=> b!453405 (= lt!205801 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (=> b!453405 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun b!453406 () Bool)

(declare-fun Unit!13253 () Unit!13248)

(assert (=> b!453406 (= e!265397 Unit!13253)))

(declare-fun b!453407 () Bool)

(assert (=> b!453407 (= e!265398 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (= (and d!74409 c!56231) b!453405))

(assert (= (and d!74409 (not c!56231)) b!453406))

(assert (= (and d!74409 (not res!270089)) b!453407))

(declare-fun m!437431 () Bool)

(assert (=> d!74409 m!437431))

(declare-fun m!437433 () Bool)

(assert (=> b!453405 m!437433))

(assert (=> b!453405 m!437201))

(assert (=> b!453405 m!437201))

(declare-fun m!437435 () Bool)

(assert (=> b!453405 m!437435))

(assert (=> b!453407 m!437201))

(assert (=> b!453407 m!437201))

(assert (=> b!453407 m!437435))

(assert (=> d!74353 d!74409))

(declare-fun b!453417 () Bool)

(declare-fun e!265403 () Option!376)

(declare-fun e!265404 () Option!376)

(assert (=> b!453417 (= e!265403 e!265404)))

(declare-fun c!56237 () Bool)

(assert (=> b!453417 (= c!56237 (and ((_ is Cons!8109) lt!205711) (not (= (_1!4039 (h!8965 lt!205711)) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))))

(declare-fun b!453416 () Bool)

(assert (=> b!453416 (= e!265403 (Some!375 (_2!4039 (h!8965 lt!205711))))))

(declare-fun c!56236 () Bool)

(declare-fun d!74411 () Bool)

(assert (=> d!74411 (= c!56236 (and ((_ is Cons!8109) lt!205711) (= (_1!4039 (h!8965 lt!205711)) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (=> d!74411 (= (getValueByKey!370 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) e!265403)))

(declare-fun b!453419 () Bool)

(assert (=> b!453419 (= e!265404 None!374)))

(declare-fun b!453418 () Bool)

(assert (=> b!453418 (= e!265404 (getValueByKey!370 (t!13939 lt!205711) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (= (and d!74411 c!56236) b!453416))

(assert (= (and d!74411 (not c!56236)) b!453417))

(assert (= (and b!453417 c!56237) b!453418))

(assert (= (and b!453417 (not c!56237)) b!453419))

(declare-fun m!437437 () Bool)

(assert (=> b!453418 m!437437))

(assert (=> d!74353 d!74411))

(declare-fun d!74413 () Bool)

(assert (=> d!74413 (= (getValueByKey!370 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun lt!205804 () Unit!13248)

(declare-fun choose!1330 (List!8113 (_ BitVec 64) V!17293) Unit!13248)

(assert (=> d!74413 (= lt!205804 (choose!1330 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun e!265407 () Bool)

(assert (=> d!74413 e!265407))

(declare-fun res!270094 () Bool)

(assert (=> d!74413 (=> (not res!270094) (not e!265407))))

(declare-fun isStrictlySorted!378 (List!8113) Bool)

(assert (=> d!74413 (= res!270094 (isStrictlySorted!378 lt!205711))))

(assert (=> d!74413 (= (lemmaContainsTupThenGetReturnValue!192 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) lt!205804)))

(declare-fun b!453424 () Bool)

(declare-fun res!270095 () Bool)

(assert (=> b!453424 (=> (not res!270095) (not e!265407))))

(assert (=> b!453424 (= res!270095 (containsKey!347 lt!205711 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun b!453425 () Bool)

(assert (=> b!453425 (= e!265407 (contains!2499 lt!205711 (tuple2!8057 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (= (and d!74413 res!270094) b!453424))

(assert (= (and b!453424 res!270095) b!453425))

(assert (=> d!74413 m!437195))

(declare-fun m!437439 () Bool)

(assert (=> d!74413 m!437439))

(declare-fun m!437441 () Bool)

(assert (=> d!74413 m!437441))

(declare-fun m!437443 () Bool)

(assert (=> b!453424 m!437443))

(declare-fun m!437445 () Bool)

(assert (=> b!453425 m!437445))

(assert (=> d!74353 d!74413))

(declare-fun c!56246 () Bool)

(declare-fun b!453446 () Bool)

(declare-fun e!265419 () List!8113)

(declare-fun c!56247 () Bool)

(assert (=> b!453446 (= e!265419 (ite c!56246 (t!13939 (toList!3500 lt!205585)) (ite c!56247 (Cons!8109 (h!8965 (toList!3500 lt!205585)) (t!13939 (toList!3500 lt!205585))) Nil!8110)))))

(declare-fun b!453447 () Bool)

(declare-fun e!265421 () List!8113)

(declare-fun e!265420 () List!8113)

(assert (=> b!453447 (= e!265421 e!265420)))

(assert (=> b!453447 (= c!56246 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (= (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(declare-fun b!453448 () Bool)

(declare-fun e!265418 () List!8113)

(declare-fun call!30067 () List!8113)

(assert (=> b!453448 (= e!265418 call!30067)))

(declare-fun d!74415 () Bool)

(declare-fun e!265422 () Bool)

(assert (=> d!74415 e!265422))

(declare-fun res!270100 () Bool)

(assert (=> d!74415 (=> (not res!270100) (not e!265422))))

(declare-fun lt!205807 () List!8113)

(assert (=> d!74415 (= res!270100 (isStrictlySorted!378 lt!205807))))

(assert (=> d!74415 (= lt!205807 e!265421)))

(declare-fun c!56248 () Bool)

(assert (=> d!74415 (= c!56248 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvslt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (=> d!74415 (isStrictlySorted!378 (toList!3500 lt!205585))))

(assert (=> d!74415 (= (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) lt!205807)))

(declare-fun b!453449 () Bool)

(declare-fun call!30068 () List!8113)

(assert (=> b!453449 (= e!265420 call!30068)))

(declare-fun b!453450 () Bool)

(declare-fun res!270101 () Bool)

(assert (=> b!453450 (=> (not res!270101) (not e!265422))))

(assert (=> b!453450 (= res!270101 (containsKey!347 lt!205807 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun b!453451 () Bool)

(assert (=> b!453451 (= e!265419 (insertStrictlySorted!195 (t!13939 (toList!3500 lt!205585)) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(declare-fun b!453452 () Bool)

(assert (=> b!453452 (= e!265418 call!30067)))

(declare-fun b!453453 () Bool)

(declare-fun call!30069 () List!8113)

(assert (=> b!453453 (= e!265421 call!30069)))

(declare-fun b!453454 () Bool)

(assert (=> b!453454 (= e!265422 (contains!2499 lt!205807 (tuple2!8057 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(declare-fun bm!30064 () Bool)

(assert (=> bm!30064 (= call!30068 call!30069)))

(declare-fun bm!30065 () Bool)

(declare-fun $colon$colon!109 (List!8113 tuple2!8056) List!8113)

(assert (=> bm!30065 (= call!30069 ($colon$colon!109 e!265419 (ite c!56248 (h!8965 (toList!3500 lt!205585)) (tuple2!8057 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))))

(declare-fun c!56249 () Bool)

(assert (=> bm!30065 (= c!56249 c!56248)))

(declare-fun bm!30066 () Bool)

(assert (=> bm!30066 (= call!30067 call!30068)))

(declare-fun b!453455 () Bool)

(assert (=> b!453455 (= c!56247 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvsgt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (=> b!453455 (= e!265420 e!265418)))

(assert (= (and d!74415 c!56248) b!453453))

(assert (= (and d!74415 (not c!56248)) b!453447))

(assert (= (and b!453447 c!56246) b!453449))

(assert (= (and b!453447 (not c!56246)) b!453455))

(assert (= (and b!453455 c!56247) b!453448))

(assert (= (and b!453455 (not c!56247)) b!453452))

(assert (= (or b!453448 b!453452) bm!30066))

(assert (= (or b!453449 bm!30066) bm!30064))

(assert (= (or b!453453 bm!30064) bm!30065))

(assert (= (and bm!30065 c!56249) b!453451))

(assert (= (and bm!30065 (not c!56249)) b!453446))

(assert (= (and d!74415 res!270100) b!453450))

(assert (= (and b!453450 res!270101) b!453454))

(declare-fun m!437447 () Bool)

(assert (=> bm!30065 m!437447))

(declare-fun m!437449 () Bool)

(assert (=> b!453451 m!437449))

(declare-fun m!437451 () Bool)

(assert (=> b!453450 m!437451))

(declare-fun m!437453 () Bool)

(assert (=> b!453454 m!437453))

(declare-fun m!437455 () Bool)

(assert (=> d!74415 m!437455))

(declare-fun m!437457 () Bool)

(assert (=> d!74415 m!437457))

(assert (=> d!74353 d!74415))

(declare-fun d!74417 () Bool)

(declare-fun e!265424 () Bool)

(assert (=> d!74417 e!265424))

(declare-fun res!270102 () Bool)

(assert (=> d!74417 (=> res!270102 e!265424)))

(declare-fun lt!205809 () Bool)

(assert (=> d!74417 (= res!270102 (not lt!205809))))

(declare-fun lt!205810 () Bool)

(assert (=> d!74417 (= lt!205809 lt!205810)))

(declare-fun lt!205808 () Unit!13248)

(declare-fun e!265423 () Unit!13248)

(assert (=> d!74417 (= lt!205808 e!265423)))

(declare-fun c!56250 () Bool)

(assert (=> d!74417 (= c!56250 lt!205810)))

(assert (=> d!74417 (= lt!205810 (containsKey!347 (toList!3500 lt!205671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74417 (= (contains!2498 lt!205671 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205809)))

(declare-fun b!453456 () Bool)

(declare-fun lt!205811 () Unit!13248)

(assert (=> b!453456 (= e!265423 lt!205811)))

(assert (=> b!453456 (= lt!205811 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453456 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453457 () Bool)

(declare-fun Unit!13254 () Unit!13248)

(assert (=> b!453457 (= e!265423 Unit!13254)))

(declare-fun b!453458 () Bool)

(assert (=> b!453458 (= e!265424 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74417 c!56250) b!453456))

(assert (= (and d!74417 (not c!56250)) b!453457))

(assert (= (and d!74417 (not res!270102)) b!453458))

(declare-fun m!437459 () Bool)

(assert (=> d!74417 m!437459))

(declare-fun m!437461 () Bool)

(assert (=> b!453456 m!437461))

(declare-fun m!437463 () Bool)

(assert (=> b!453456 m!437463))

(assert (=> b!453456 m!437463))

(declare-fun m!437465 () Bool)

(assert (=> b!453456 m!437465))

(assert (=> b!453458 m!437463))

(assert (=> b!453458 m!437463))

(assert (=> b!453458 m!437465))

(assert (=> d!74335 d!74417))

(assert (=> d!74335 d!74323))

(assert (=> b!453232 d!74361))

(declare-fun b!453460 () Bool)

(declare-fun e!265425 () Option!376)

(declare-fun e!265426 () Option!376)

(assert (=> b!453460 (= e!265425 e!265426)))

(declare-fun c!56252 () Bool)

(assert (=> b!453460 (= c!56252 (and ((_ is Cons!8109) (toList!3500 lt!205709)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205709))) (_1!4039 lt!205594)))))))

(declare-fun b!453459 () Bool)

(assert (=> b!453459 (= e!265425 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205709)))))))

(declare-fun d!74419 () Bool)

(declare-fun c!56251 () Bool)

(assert (=> d!74419 (= c!56251 (and ((_ is Cons!8109) (toList!3500 lt!205709)) (= (_1!4039 (h!8965 (toList!3500 lt!205709))) (_1!4039 lt!205594))))))

(assert (=> d!74419 (= (getValueByKey!370 (toList!3500 lt!205709) (_1!4039 lt!205594)) e!265425)))

(declare-fun b!453462 () Bool)

(assert (=> b!453462 (= e!265426 None!374)))

(declare-fun b!453461 () Bool)

(assert (=> b!453461 (= e!265426 (getValueByKey!370 (t!13939 (toList!3500 lt!205709)) (_1!4039 lt!205594)))))

(assert (= (and d!74419 c!56251) b!453459))

(assert (= (and d!74419 (not c!56251)) b!453460))

(assert (= (and b!453460 c!56252) b!453461))

(assert (= (and b!453460 (not c!56252)) b!453462))

(declare-fun m!437467 () Bool)

(assert (=> b!453461 m!437467))

(assert (=> b!453266 d!74419))

(declare-fun d!74421 () Bool)

(declare-fun get!6656 (Option!376) V!17293)

(assert (=> d!74421 (= (apply!313 lt!205678 (select (arr!13489 _keys!709) from!863)) (get!6656 (getValueByKey!370 (toList!3500 lt!205678) (select (arr!13489 _keys!709) from!863))))))

(declare-fun bs!14404 () Bool)

(assert (= bs!14404 d!74421))

(assert (=> bs!14404 m!436893))

(declare-fun m!437469 () Bool)

(assert (=> bs!14404 m!437469))

(assert (=> bs!14404 m!437469))

(declare-fun m!437471 () Bool)

(assert (=> bs!14404 m!437471))

(assert (=> b!453229 d!74421))

(declare-fun d!74423 () Bool)

(declare-fun c!56253 () Bool)

(assert (=> d!74423 (= c!56253 ((_ is ValueCellFull!5727) (select (arr!13490 _values!549) from!863)))))

(declare-fun e!265427 () V!17293)

(assert (=> d!74423 (= (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265427)))

(declare-fun b!453463 () Bool)

(assert (=> b!453463 (= e!265427 (get!6654 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453464 () Bool)

(assert (=> b!453464 (= e!265427 (get!6655 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74423 c!56253) b!453463))

(assert (= (and d!74423 (not c!56253)) b!453464))

(assert (=> b!453463 m!436861))

(assert (=> b!453463 m!436867))

(declare-fun m!437473 () Bool)

(assert (=> b!453463 m!437473))

(assert (=> b!453464 m!436861))

(assert (=> b!453464 m!436867))

(declare-fun m!437475 () Bool)

(assert (=> b!453464 m!437475))

(assert (=> b!453229 d!74423))

(declare-fun d!74425 () Bool)

(assert (=> d!74425 (= (validKeyInArray!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)) (and (not (= (select (arr!13489 _keys!709) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 _keys!709) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453208 d!74425))

(declare-fun d!74427 () Bool)

(declare-fun res!270103 () Bool)

(declare-fun e!265428 () Bool)

(assert (=> d!74427 (=> res!270103 e!265428)))

(assert (=> d!74427 (= res!270103 (= (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!794))))

(assert (=> d!74427 (= (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!265428)))

(declare-fun b!453465 () Bool)

(declare-fun e!265429 () Bool)

(assert (=> b!453465 (= e!265428 e!265429)))

(declare-fun res!270104 () Bool)

(assert (=> b!453465 (=> (not res!270104) (not e!265429))))

(assert (=> b!453465 (= res!270104 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun b!453466 () Bool)

(assert (=> b!453466 (= e!265429 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!74427 (not res!270103)) b!453465))

(assert (= (and b!453465 res!270104) b!453466))

(declare-fun m!437477 () Bool)

(assert (=> d!74427 m!437477))

(declare-fun m!437479 () Bool)

(assert (=> b!453466 m!437479))

(assert (=> b!453299 d!74427))

(declare-fun b!453467 () Bool)

(declare-fun lt!205818 () Unit!13248)

(declare-fun lt!205816 () Unit!13248)

(assert (=> b!453467 (= lt!205818 lt!205816)))

(declare-fun lt!205815 () ListLongMap!6969)

(declare-fun lt!205814 () (_ BitVec 64))

(declare-fun lt!205817 () (_ BitVec 64))

(declare-fun lt!205813 () V!17293)

(assert (=> b!453467 (not (contains!2498 (+!1576 lt!205815 (tuple2!8057 lt!205814 lt!205813)) lt!205817))))

(assert (=> b!453467 (= lt!205816 (addStillNotContains!146 lt!205815 lt!205814 lt!205813 lt!205817))))

(assert (=> b!453467 (= lt!205817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453467 (= lt!205813 (get!6653 (select (arr!13490 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453467 (= lt!205814 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30070 () ListLongMap!6969)

(assert (=> b!453467 (= lt!205815 call!30070)))

(declare-fun e!265430 () ListLongMap!6969)

(assert (=> b!453467 (= e!265430 (+!1576 call!30070 (tuple2!8057 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)) (get!6653 (select (arr!13490 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453468 () Bool)

(declare-fun e!265436 () ListLongMap!6969)

(assert (=> b!453468 (= e!265436 e!265430)))

(declare-fun c!56257 () Bool)

(assert (=> b!453468 (= c!56257 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453469 () Bool)

(declare-fun e!265431 () Bool)

(declare-fun e!265433 () Bool)

(assert (=> b!453469 (= e!265431 e!265433)))

(declare-fun c!56254 () Bool)

(assert (=> b!453469 (= c!56254 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun b!453470 () Bool)

(declare-fun res!270107 () Bool)

(declare-fun e!265434 () Bool)

(assert (=> b!453470 (=> (not res!270107) (not e!265434))))

(declare-fun lt!205812 () ListLongMap!6969)

(assert (=> b!453470 (= res!270107 (not (contains!2498 lt!205812 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453471 () Bool)

(assert (=> b!453471 (= e!265433 (isEmpty!559 lt!205812))))

(declare-fun b!453472 () Bool)

(assert (=> b!453472 (= e!265430 call!30070)))

(declare-fun b!453473 () Bool)

(assert (=> b!453473 (= e!265434 e!265431)))

(declare-fun c!56255 () Bool)

(declare-fun e!265435 () Bool)

(assert (=> b!453473 (= c!56255 e!265435)))

(declare-fun res!270106 () Bool)

(assert (=> b!453473 (=> (not res!270106) (not e!265435))))

(assert (=> b!453473 (= res!270106 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun b!453474 () Bool)

(assert (=> b!453474 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(assert (=> b!453474 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13842 _values!549)))))

(declare-fun e!265432 () Bool)

(assert (=> b!453474 (= e!265432 (= (apply!313 lt!205812 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))) (get!6653 (select (arr!13490 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453475 () Bool)

(assert (=> b!453475 (= e!265431 e!265432)))

(assert (=> b!453475 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun res!270105 () Bool)

(assert (=> b!453475 (= res!270105 (contains!2498 lt!205812 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453475 (=> (not res!270105) (not e!265432))))

(declare-fun bm!30067 () Bool)

(assert (=> bm!30067 (= call!30070 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74429 () Bool)

(assert (=> d!74429 e!265434))

(declare-fun res!270108 () Bool)

(assert (=> d!74429 (=> (not res!270108) (not e!265434))))

(assert (=> d!74429 (= res!270108 (not (contains!2498 lt!205812 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74429 (= lt!205812 e!265436)))

(declare-fun c!56256 () Bool)

(assert (=> d!74429 (= c!56256 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(assert (=> d!74429 (validMask!0 mask!1025)))

(assert (=> d!74429 (= (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205812)))

(declare-fun b!453476 () Bool)

(assert (=> b!453476 (= e!265436 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453477 () Bool)

(assert (=> b!453477 (= e!265435 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453477 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453478 () Bool)

(assert (=> b!453478 (= e!265433 (= lt!205812 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74429 c!56256) b!453476))

(assert (= (and d!74429 (not c!56256)) b!453468))

(assert (= (and b!453468 c!56257) b!453467))

(assert (= (and b!453468 (not c!56257)) b!453472))

(assert (= (or b!453467 b!453472) bm!30067))

(assert (= (and d!74429 res!270108) b!453470))

(assert (= (and b!453470 res!270107) b!453473))

(assert (= (and b!453473 res!270106) b!453477))

(assert (= (and b!453473 c!56255) b!453475))

(assert (= (and b!453473 (not c!56255)) b!453469))

(assert (= (and b!453475 res!270105) b!453474))

(assert (= (and b!453469 c!56254) b!453478))

(assert (= (and b!453469 (not c!56254)) b!453471))

(declare-fun b_lambda!9639 () Bool)

(assert (=> (not b_lambda!9639) (not b!453467)))

(assert (=> b!453467 t!13938))

(declare-fun b_and!18933 () Bool)

(assert (= b_and!18931 (and (=> t!13938 result!7103) b_and!18933)))

(declare-fun b_lambda!9641 () Bool)

(assert (=> (not b_lambda!9641) (not b!453474)))

(assert (=> b!453474 t!13938))

(declare-fun b_and!18935 () Bool)

(assert (= b_and!18933 (and (=> t!13938 result!7103) b_and!18935)))

(declare-fun m!437481 () Bool)

(assert (=> bm!30067 m!437481))

(declare-fun m!437483 () Bool)

(assert (=> b!453470 m!437483))

(assert (=> b!453478 m!437481))

(declare-fun m!437485 () Bool)

(assert (=> d!74429 m!437485))

(assert (=> d!74429 m!436891))

(declare-fun m!437487 () Bool)

(assert (=> b!453468 m!437487))

(assert (=> b!453468 m!437487))

(declare-fun m!437489 () Bool)

(assert (=> b!453468 m!437489))

(assert (=> b!453475 m!437487))

(assert (=> b!453475 m!437487))

(declare-fun m!437491 () Bool)

(assert (=> b!453475 m!437491))

(declare-fun m!437493 () Bool)

(assert (=> b!453471 m!437493))

(declare-fun m!437495 () Bool)

(assert (=> b!453467 m!437495))

(declare-fun m!437497 () Bool)

(assert (=> b!453467 m!437497))

(declare-fun m!437499 () Bool)

(assert (=> b!453467 m!437499))

(assert (=> b!453467 m!437495))

(declare-fun m!437501 () Bool)

(assert (=> b!453467 m!437501))

(assert (=> b!453467 m!437499))

(assert (=> b!453467 m!436867))

(declare-fun m!437503 () Bool)

(assert (=> b!453467 m!437503))

(assert (=> b!453467 m!436867))

(assert (=> b!453467 m!437487))

(declare-fun m!437505 () Bool)

(assert (=> b!453467 m!437505))

(assert (=> b!453477 m!437487))

(assert (=> b!453477 m!437487))

(assert (=> b!453477 m!437489))

(assert (=> b!453474 m!437487))

(assert (=> b!453474 m!437499))

(assert (=> b!453474 m!437499))

(assert (=> b!453474 m!436867))

(assert (=> b!453474 m!437503))

(assert (=> b!453474 m!437487))

(declare-fun m!437507 () Bool)

(assert (=> b!453474 m!437507))

(assert (=> b!453474 m!436867))

(assert (=> bm!30037 d!74429))

(declare-fun d!74431 () Bool)

(declare-fun isEmpty!560 (List!8113) Bool)

(assert (=> d!74431 (= (isEmpty!559 lt!205685) (isEmpty!560 (toList!3500 lt!205685)))))

(declare-fun bs!14405 () Bool)

(assert (= bs!14405 d!74431))

(declare-fun m!437509 () Bool)

(assert (=> bs!14405 m!437509))

(assert (=> b!453238 d!74431))

(declare-fun d!74433 () Bool)

(declare-fun lt!205821 () Bool)

(declare-fun content!204 (List!8114) (InoxSet (_ BitVec 64)))

(assert (=> d!74433 (= lt!205821 (select (content!204 Nil!8111) (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun e!265441 () Bool)

(assert (=> d!74433 (= lt!205821 e!265441)))

(declare-fun res!270114 () Bool)

(assert (=> d!74433 (=> (not res!270114) (not e!265441))))

(assert (=> d!74433 (= res!270114 ((_ is Cons!8110) Nil!8111))))

(assert (=> d!74433 (= (contains!2497 Nil!8111 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)) lt!205821)))

(declare-fun b!453483 () Bool)

(declare-fun e!265442 () Bool)

(assert (=> b!453483 (= e!265441 e!265442)))

(declare-fun res!270113 () Bool)

(assert (=> b!453483 (=> res!270113 e!265442)))

(assert (=> b!453483 (= res!270113 (= (h!8966 Nil!8111) (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(declare-fun b!453484 () Bool)

(assert (=> b!453484 (= e!265442 (contains!2497 (t!13940 Nil!8111) (select (arr!13489 lt!205595) #b00000000000000000000000000000000)))))

(assert (= (and d!74433 res!270114) b!453483))

(assert (= (and b!453483 (not res!270113)) b!453484))

(declare-fun m!437511 () Bool)

(assert (=> d!74433 m!437511))

(assert (=> d!74433 m!436991))

(declare-fun m!437513 () Bool)

(assert (=> d!74433 m!437513))

(assert (=> b!453484 m!436991))

(declare-fun m!437515 () Bool)

(assert (=> b!453484 m!437515))

(assert (=> b!453153 d!74433))

(declare-fun d!74435 () Bool)

(declare-fun c!56258 () Bool)

(assert (=> d!74435 (= c!56258 ((_ is ValueCellFull!5727) (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265443 () V!17293)

(assert (=> d!74435 (= (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265443)))

(declare-fun b!453485 () Bool)

(assert (=> b!453485 (= e!265443 (get!6654 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453486 () Bool)

(assert (=> b!453486 (= e!265443 (get!6655 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74435 c!56258) b!453485))

(assert (= (and d!74435 (not c!56258)) b!453486))

(assert (=> b!453485 m!437029))

(assert (=> b!453485 m!436867))

(declare-fun m!437517 () Bool)

(assert (=> b!453485 m!437517))

(assert (=> b!453486 m!437029))

(assert (=> b!453486 m!436867))

(declare-fun m!437519 () Bool)

(assert (=> b!453486 m!437519))

(assert (=> b!453186 d!74435))

(declare-fun d!74437 () Bool)

(declare-fun e!265444 () Bool)

(assert (=> d!74437 e!265444))

(declare-fun res!270116 () Bool)

(assert (=> d!74437 (=> (not res!270116) (not e!265444))))

(declare-fun lt!205825 () ListLongMap!6969)

(assert (=> d!74437 (= res!270116 (contains!2498 lt!205825 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205823 () List!8113)

(assert (=> d!74437 (= lt!205825 (ListLongMap!6970 lt!205823))))

(declare-fun lt!205824 () Unit!13248)

(declare-fun lt!205822 () Unit!13248)

(assert (=> d!74437 (= lt!205824 lt!205822)))

(assert (=> d!74437 (= (getValueByKey!370 lt!205823 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74437 (= lt!205822 (lemmaContainsTupThenGetReturnValue!192 lt!205823 (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74437 (= lt!205823 (insertStrictlySorted!195 (toList!3500 call!30035) (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74437 (= (+!1576 call!30035 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205825)))

(declare-fun b!453487 () Bool)

(declare-fun res!270115 () Bool)

(assert (=> b!453487 (=> (not res!270115) (not e!265444))))

(assert (=> b!453487 (= res!270115 (= (getValueByKey!370 (toList!3500 lt!205825) (_1!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453488 () Bool)

(assert (=> b!453488 (= e!265444 (contains!2499 (toList!3500 lt!205825) (tuple2!8057 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (ite c!56153 lt!205593 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74437 res!270116) b!453487))

(assert (= (and b!453487 res!270115) b!453488))

(declare-fun m!437521 () Bool)

(assert (=> d!74437 m!437521))

(declare-fun m!437523 () Bool)

(assert (=> d!74437 m!437523))

(declare-fun m!437525 () Bool)

(assert (=> d!74437 m!437525))

(declare-fun m!437527 () Bool)

(assert (=> d!74437 m!437527))

(declare-fun m!437529 () Bool)

(assert (=> b!453487 m!437529))

(declare-fun m!437531 () Bool)

(assert (=> b!453488 m!437531))

(assert (=> b!453186 d!74437))

(declare-fun d!74439 () Bool)

(assert (=> d!74439 (not (contains!2498 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656)) lt!205660))))

(declare-fun lt!205826 () Unit!13248)

(assert (=> d!74439 (= lt!205826 (choose!1329 lt!205658 lt!205657 lt!205656 lt!205660))))

(declare-fun e!265445 () Bool)

(assert (=> d!74439 e!265445))

(declare-fun res!270117 () Bool)

(assert (=> d!74439 (=> (not res!270117) (not e!265445))))

(assert (=> d!74439 (= res!270117 (not (contains!2498 lt!205658 lt!205660)))))

(assert (=> d!74439 (= (addStillNotContains!146 lt!205658 lt!205657 lt!205656 lt!205660) lt!205826)))

(declare-fun b!453489 () Bool)

(assert (=> b!453489 (= e!265445 (not (= lt!205657 lt!205660)))))

(assert (= (and d!74439 res!270117) b!453489))

(assert (=> d!74439 m!437025))

(assert (=> d!74439 m!437025))

(assert (=> d!74439 m!437027))

(declare-fun m!437533 () Bool)

(assert (=> d!74439 m!437533))

(declare-fun m!437535 () Bool)

(assert (=> d!74439 m!437535))

(assert (=> b!453186 d!74439))

(declare-fun d!74441 () Bool)

(declare-fun e!265446 () Bool)

(assert (=> d!74441 e!265446))

(declare-fun res!270119 () Bool)

(assert (=> d!74441 (=> (not res!270119) (not e!265446))))

(declare-fun lt!205830 () ListLongMap!6969)

(assert (=> d!74441 (= res!270119 (contains!2498 lt!205830 (_1!4039 (tuple2!8057 lt!205657 lt!205656))))))

(declare-fun lt!205828 () List!8113)

(assert (=> d!74441 (= lt!205830 (ListLongMap!6970 lt!205828))))

(declare-fun lt!205829 () Unit!13248)

(declare-fun lt!205827 () Unit!13248)

(assert (=> d!74441 (= lt!205829 lt!205827)))

(assert (=> d!74441 (= (getValueByKey!370 lt!205828 (_1!4039 (tuple2!8057 lt!205657 lt!205656))) (Some!375 (_2!4039 (tuple2!8057 lt!205657 lt!205656))))))

(assert (=> d!74441 (= lt!205827 (lemmaContainsTupThenGetReturnValue!192 lt!205828 (_1!4039 (tuple2!8057 lt!205657 lt!205656)) (_2!4039 (tuple2!8057 lt!205657 lt!205656))))))

(assert (=> d!74441 (= lt!205828 (insertStrictlySorted!195 (toList!3500 lt!205658) (_1!4039 (tuple2!8057 lt!205657 lt!205656)) (_2!4039 (tuple2!8057 lt!205657 lt!205656))))))

(assert (=> d!74441 (= (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656)) lt!205830)))

(declare-fun b!453490 () Bool)

(declare-fun res!270118 () Bool)

(assert (=> b!453490 (=> (not res!270118) (not e!265446))))

(assert (=> b!453490 (= res!270118 (= (getValueByKey!370 (toList!3500 lt!205830) (_1!4039 (tuple2!8057 lt!205657 lt!205656))) (Some!375 (_2!4039 (tuple2!8057 lt!205657 lt!205656)))))))

(declare-fun b!453491 () Bool)

(assert (=> b!453491 (= e!265446 (contains!2499 (toList!3500 lt!205830) (tuple2!8057 lt!205657 lt!205656)))))

(assert (= (and d!74441 res!270119) b!453490))

(assert (= (and b!453490 res!270118) b!453491))

(declare-fun m!437537 () Bool)

(assert (=> d!74441 m!437537))

(declare-fun m!437539 () Bool)

(assert (=> d!74441 m!437539))

(declare-fun m!437541 () Bool)

(assert (=> d!74441 m!437541))

(declare-fun m!437543 () Bool)

(assert (=> d!74441 m!437543))

(declare-fun m!437545 () Bool)

(assert (=> b!453490 m!437545))

(declare-fun m!437547 () Bool)

(assert (=> b!453491 m!437547))

(assert (=> b!453186 d!74441))

(declare-fun d!74443 () Bool)

(declare-fun e!265448 () Bool)

(assert (=> d!74443 e!265448))

(declare-fun res!270120 () Bool)

(assert (=> d!74443 (=> res!270120 e!265448)))

(declare-fun lt!205832 () Bool)

(assert (=> d!74443 (= res!270120 (not lt!205832))))

(declare-fun lt!205833 () Bool)

(assert (=> d!74443 (= lt!205832 lt!205833)))

(declare-fun lt!205831 () Unit!13248)

(declare-fun e!265447 () Unit!13248)

(assert (=> d!74443 (= lt!205831 e!265447)))

(declare-fun c!56259 () Bool)

(assert (=> d!74443 (= c!56259 lt!205833)))

(assert (=> d!74443 (= lt!205833 (containsKey!347 (toList!3500 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656))) lt!205660))))

(assert (=> d!74443 (= (contains!2498 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656)) lt!205660) lt!205832)))

(declare-fun b!453492 () Bool)

(declare-fun lt!205834 () Unit!13248)

(assert (=> b!453492 (= e!265447 lt!205834)))

(assert (=> b!453492 (= lt!205834 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656))) lt!205660))))

(assert (=> b!453492 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656))) lt!205660))))

(declare-fun b!453493 () Bool)

(declare-fun Unit!13255 () Unit!13248)

(assert (=> b!453493 (= e!265447 Unit!13255)))

(declare-fun b!453494 () Bool)

(assert (=> b!453494 (= e!265448 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205658 (tuple2!8057 lt!205657 lt!205656))) lt!205660)))))

(assert (= (and d!74443 c!56259) b!453492))

(assert (= (and d!74443 (not c!56259)) b!453493))

(assert (= (and d!74443 (not res!270120)) b!453494))

(declare-fun m!437549 () Bool)

(assert (=> d!74443 m!437549))

(declare-fun m!437551 () Bool)

(assert (=> b!453492 m!437551))

(declare-fun m!437553 () Bool)

(assert (=> b!453492 m!437553))

(assert (=> b!453492 m!437553))

(declare-fun m!437555 () Bool)

(assert (=> b!453492 m!437555))

(assert (=> b!453494 m!437553))

(assert (=> b!453494 m!437553))

(assert (=> b!453494 m!437555))

(assert (=> b!453186 d!74443))

(declare-fun d!74445 () Bool)

(declare-fun e!265450 () Bool)

(assert (=> d!74445 e!265450))

(declare-fun res!270121 () Bool)

(assert (=> d!74445 (=> res!270121 e!265450)))

(declare-fun lt!205836 () Bool)

(assert (=> d!74445 (= res!270121 (not lt!205836))))

(declare-fun lt!205837 () Bool)

(assert (=> d!74445 (= lt!205836 lt!205837)))

(declare-fun lt!205835 () Unit!13248)

(declare-fun e!265449 () Unit!13248)

(assert (=> d!74445 (= lt!205835 e!265449)))

(declare-fun c!56260 () Bool)

(assert (=> d!74445 (= c!56260 lt!205837)))

(assert (=> d!74445 (= lt!205837 (containsKey!347 (toList!3500 lt!205699) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74445 (= (contains!2498 lt!205699 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205836)))

(declare-fun b!453495 () Bool)

(declare-fun lt!205838 () Unit!13248)

(assert (=> b!453495 (= e!265449 lt!205838)))

(assert (=> b!453495 (= lt!205838 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205699) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453495 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453496 () Bool)

(declare-fun Unit!13256 () Unit!13248)

(assert (=> b!453496 (= e!265449 Unit!13256)))

(declare-fun b!453497 () Bool)

(assert (=> b!453497 (= e!265450 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74445 c!56260) b!453495))

(assert (= (and d!74445 (not c!56260)) b!453496))

(assert (= (and d!74445 (not res!270121)) b!453497))

(declare-fun m!437557 () Bool)

(assert (=> d!74445 m!437557))

(declare-fun m!437559 () Bool)

(assert (=> b!453495 m!437559))

(declare-fun m!437561 () Bool)

(assert (=> b!453495 m!437561))

(assert (=> b!453495 m!437561))

(declare-fun m!437563 () Bool)

(assert (=> b!453495 m!437563))

(assert (=> b!453497 m!437561))

(assert (=> b!453497 m!437561))

(assert (=> b!453497 m!437563))

(assert (=> b!453257 d!74445))

(declare-fun b!453498 () Bool)

(declare-fun lt!205845 () Unit!13248)

(declare-fun lt!205843 () Unit!13248)

(assert (=> b!453498 (= lt!205845 lt!205843)))

(declare-fun lt!205842 () ListLongMap!6969)

(declare-fun lt!205844 () (_ BitVec 64))

(declare-fun lt!205841 () (_ BitVec 64))

(declare-fun lt!205840 () V!17293)

(assert (=> b!453498 (not (contains!2498 (+!1576 lt!205842 (tuple2!8057 lt!205841 lt!205840)) lt!205844))))

(assert (=> b!453498 (= lt!205843 (addStillNotContains!146 lt!205842 lt!205841 lt!205840 lt!205844))))

(assert (=> b!453498 (= lt!205844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453498 (= lt!205840 (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453498 (= lt!205841 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30071 () ListLongMap!6969)

(assert (=> b!453498 (= lt!205842 call!30071)))

(declare-fun e!265451 () ListLongMap!6969)

(assert (=> b!453498 (= e!265451 (+!1576 call!30071 (tuple2!8057 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453499 () Bool)

(declare-fun e!265457 () ListLongMap!6969)

(assert (=> b!453499 (= e!265457 e!265451)))

(declare-fun c!56264 () Bool)

(assert (=> b!453499 (= c!56264 (validKeyInArray!0 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453500 () Bool)

(declare-fun e!265452 () Bool)

(declare-fun e!265454 () Bool)

(assert (=> b!453500 (= e!265452 e!265454)))

(declare-fun c!56261 () Bool)

(assert (=> b!453500 (= c!56261 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun b!453501 () Bool)

(declare-fun res!270124 () Bool)

(declare-fun e!265455 () Bool)

(assert (=> b!453501 (=> (not res!270124) (not e!265455))))

(declare-fun lt!205839 () ListLongMap!6969)

(assert (=> b!453501 (= res!270124 (not (contains!2498 lt!205839 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453502 () Bool)

(assert (=> b!453502 (= e!265454 (isEmpty!559 lt!205839))))

(declare-fun b!453503 () Bool)

(assert (=> b!453503 (= e!265451 call!30071)))

(declare-fun b!453504 () Bool)

(assert (=> b!453504 (= e!265455 e!265452)))

(declare-fun c!56262 () Bool)

(declare-fun e!265456 () Bool)

(assert (=> b!453504 (= c!56262 e!265456)))

(declare-fun res!270123 () Bool)

(assert (=> b!453504 (=> (not res!270123) (not e!265456))))

(assert (=> b!453504 (= res!270123 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun b!453505 () Bool)

(assert (=> b!453505 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(assert (=> b!453505 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13842 (ite c!56153 _values!549 lt!205593))))))

(declare-fun e!265453 () Bool)

(assert (=> b!453505 (= e!265453 (= (apply!313 lt!205839 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6653 (select (arr!13490 (ite c!56153 _values!549 lt!205593)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453506 () Bool)

(assert (=> b!453506 (= e!265452 e!265453)))

(assert (=> b!453506 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(declare-fun res!270122 () Bool)

(assert (=> b!453506 (= res!270122 (contains!2498 lt!205839 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453506 (=> (not res!270122) (not e!265453))))

(declare-fun bm!30068 () Bool)

(assert (=> bm!30068 (= call!30071 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74447 () Bool)

(assert (=> d!74447 e!265455))

(declare-fun res!270125 () Bool)

(assert (=> d!74447 (=> (not res!270125) (not e!265455))))

(assert (=> d!74447 (= res!270125 (not (contains!2498 lt!205839 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74447 (= lt!205839 e!265457)))

(declare-fun c!56263 () Bool)

(assert (=> d!74447 (= c!56263 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13841 (ite c!56153 _keys!709 lt!205595))))))

(assert (=> d!74447 (validMask!0 mask!1025)))

(assert (=> d!74447 (= (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205839)))

(declare-fun b!453507 () Bool)

(assert (=> b!453507 (= e!265457 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453508 () Bool)

(assert (=> b!453508 (= e!265456 (validKeyInArray!0 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453508 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453509 () Bool)

(assert (=> b!453509 (= e!265454 (= lt!205839 (getCurrentListMapNoExtraKeys!1683 (ite c!56153 _keys!709 lt!205595) (ite c!56153 _values!549 lt!205593) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74447 c!56263) b!453507))

(assert (= (and d!74447 (not c!56263)) b!453499))

(assert (= (and b!453499 c!56264) b!453498))

(assert (= (and b!453499 (not c!56264)) b!453503))

(assert (= (or b!453498 b!453503) bm!30068))

(assert (= (and d!74447 res!270125) b!453501))

(assert (= (and b!453501 res!270124) b!453504))

(assert (= (and b!453504 res!270123) b!453508))

(assert (= (and b!453504 c!56262) b!453506))

(assert (= (and b!453504 (not c!56262)) b!453500))

(assert (= (and b!453506 res!270122) b!453505))

(assert (= (and b!453500 c!56261) b!453509))

(assert (= (and b!453500 (not c!56261)) b!453502))

(declare-fun b_lambda!9643 () Bool)

(assert (=> (not b_lambda!9643) (not b!453498)))

(assert (=> b!453498 t!13938))

(declare-fun b_and!18937 () Bool)

(assert (= b_and!18935 (and (=> t!13938 result!7103) b_and!18937)))

(declare-fun b_lambda!9645 () Bool)

(assert (=> (not b_lambda!9645) (not b!453505)))

(assert (=> b!453505 t!13938))

(declare-fun b_and!18939 () Bool)

(assert (= b_and!18937 (and (=> t!13938 result!7103) b_and!18939)))

(declare-fun m!437565 () Bool)

(assert (=> bm!30068 m!437565))

(declare-fun m!437567 () Bool)

(assert (=> b!453501 m!437567))

(assert (=> b!453509 m!437565))

(declare-fun m!437569 () Bool)

(assert (=> d!74447 m!437569))

(assert (=> d!74447 m!436891))

(declare-fun m!437571 () Bool)

(assert (=> b!453499 m!437571))

(assert (=> b!453499 m!437571))

(declare-fun m!437573 () Bool)

(assert (=> b!453499 m!437573))

(assert (=> b!453506 m!437571))

(assert (=> b!453506 m!437571))

(declare-fun m!437575 () Bool)

(assert (=> b!453506 m!437575))

(declare-fun m!437577 () Bool)

(assert (=> b!453502 m!437577))

(declare-fun m!437579 () Bool)

(assert (=> b!453498 m!437579))

(declare-fun m!437581 () Bool)

(assert (=> b!453498 m!437581))

(declare-fun m!437583 () Bool)

(assert (=> b!453498 m!437583))

(assert (=> b!453498 m!437579))

(declare-fun m!437585 () Bool)

(assert (=> b!453498 m!437585))

(assert (=> b!453498 m!437583))

(assert (=> b!453498 m!436867))

(declare-fun m!437587 () Bool)

(assert (=> b!453498 m!437587))

(assert (=> b!453498 m!436867))

(assert (=> b!453498 m!437571))

(declare-fun m!437589 () Bool)

(assert (=> b!453498 m!437589))

(assert (=> b!453508 m!437571))

(assert (=> b!453508 m!437571))

(assert (=> b!453508 m!437573))

(assert (=> b!453505 m!437571))

(assert (=> b!453505 m!437583))

(assert (=> b!453505 m!437583))

(assert (=> b!453505 m!436867))

(assert (=> b!453505 m!437587))

(assert (=> b!453505 m!437571))

(declare-fun m!437591 () Bool)

(assert (=> b!453505 m!437591))

(assert (=> b!453505 m!436867))

(assert (=> b!453245 d!74447))

(declare-fun d!74449 () Bool)

(declare-fun e!265459 () Bool)

(assert (=> d!74449 e!265459))

(declare-fun res!270126 () Bool)

(assert (=> d!74449 (=> res!270126 e!265459)))

(declare-fun lt!205847 () Bool)

(assert (=> d!74449 (= res!270126 (not lt!205847))))

(declare-fun lt!205848 () Bool)

(assert (=> d!74449 (= lt!205847 lt!205848)))

(declare-fun lt!205846 () Unit!13248)

(declare-fun e!265458 () Unit!13248)

(assert (=> d!74449 (= lt!205846 e!265458)))

(declare-fun c!56265 () Bool)

(assert (=> d!74449 (= c!56265 lt!205848)))

(assert (=> d!74449 (= lt!205848 (containsKey!347 (toList!3500 lt!205671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74449 (= (contains!2498 lt!205671 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205847)))

(declare-fun b!453510 () Bool)

(declare-fun lt!205849 () Unit!13248)

(assert (=> b!453510 (= e!265458 lt!205849)))

(assert (=> b!453510 (= lt!205849 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453510 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453511 () Bool)

(declare-fun Unit!13257 () Unit!13248)

(assert (=> b!453511 (= e!265458 Unit!13257)))

(declare-fun b!453512 () Bool)

(assert (=> b!453512 (= e!265459 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74449 c!56265) b!453510))

(assert (= (and d!74449 (not c!56265)) b!453511))

(assert (= (and d!74449 (not res!270126)) b!453512))

(declare-fun m!437593 () Bool)

(assert (=> d!74449 m!437593))

(declare-fun m!437595 () Bool)

(assert (=> b!453510 m!437595))

(declare-fun m!437597 () Bool)

(assert (=> b!453510 m!437597))

(assert (=> b!453510 m!437597))

(declare-fun m!437599 () Bool)

(assert (=> b!453510 m!437599))

(assert (=> b!453512 m!437597))

(assert (=> b!453512 m!437597))

(assert (=> b!453512 m!437599))

(assert (=> b!453213 d!74449))

(declare-fun d!74451 () Bool)

(declare-fun e!265460 () Bool)

(assert (=> d!74451 e!265460))

(declare-fun res!270128 () Bool)

(assert (=> d!74451 (=> (not res!270128) (not e!265460))))

(declare-fun lt!205853 () ListLongMap!6969)

(assert (=> d!74451 (= res!270128 (contains!2498 lt!205853 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205851 () List!8113)

(assert (=> d!74451 (= lt!205853 (ListLongMap!6970 lt!205851))))

(declare-fun lt!205852 () Unit!13248)

(declare-fun lt!205850 () Unit!13248)

(assert (=> d!74451 (= lt!205852 lt!205850)))

(assert (=> d!74451 (= (getValueByKey!370 lt!205851 (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74451 (= lt!205850 (lemmaContainsTupThenGetReturnValue!192 lt!205851 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74451 (= lt!205851 (insertStrictlySorted!195 (toList!3500 call!30048) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74451 (= (+!1576 call!30048 (tuple2!8057 k0!794 v!412)) lt!205853)))

(declare-fun b!453513 () Bool)

(declare-fun res!270127 () Bool)

(assert (=> b!453513 (=> (not res!270127) (not e!265460))))

(assert (=> b!453513 (= res!270127 (= (getValueByKey!370 (toList!3500 lt!205853) (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun b!453514 () Bool)

(assert (=> b!453514 (= e!265460 (contains!2499 (toList!3500 lt!205853) (tuple2!8057 k0!794 v!412)))))

(assert (= (and d!74451 res!270128) b!453513))

(assert (= (and b!453513 res!270127) b!453514))

(declare-fun m!437601 () Bool)

(assert (=> d!74451 m!437601))

(declare-fun m!437603 () Bool)

(assert (=> d!74451 m!437603))

(declare-fun m!437605 () Bool)

(assert (=> d!74451 m!437605))

(declare-fun m!437607 () Bool)

(assert (=> d!74451 m!437607))

(declare-fun m!437609 () Bool)

(assert (=> b!453513 m!437609))

(declare-fun m!437611 () Bool)

(assert (=> b!453514 m!437611))

(assert (=> b!453286 d!74451))

(declare-fun d!74453 () Bool)

(declare-fun e!265462 () Bool)

(assert (=> d!74453 e!265462))

(declare-fun res!270129 () Bool)

(assert (=> d!74453 (=> res!270129 e!265462)))

(declare-fun lt!205855 () Bool)

(assert (=> d!74453 (= res!270129 (not lt!205855))))

(declare-fun lt!205856 () Bool)

(assert (=> d!74453 (= lt!205855 lt!205856)))

(declare-fun lt!205854 () Unit!13248)

(declare-fun e!265461 () Unit!13248)

(assert (=> d!74453 (= lt!205854 e!265461)))

(declare-fun c!56266 () Bool)

(assert (=> d!74453 (= c!56266 lt!205856)))

(assert (=> d!74453 (= lt!205856 (containsKey!347 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74453 (= (contains!2498 lt!205717 (_1!4039 (tuple2!8057 k0!794 v!412))) lt!205855)))

(declare-fun b!453515 () Bool)

(declare-fun lt!205857 () Unit!13248)

(assert (=> b!453515 (= e!265461 lt!205857)))

(assert (=> b!453515 (= lt!205857 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> b!453515 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453516 () Bool)

(declare-fun Unit!13258 () Unit!13248)

(assert (=> b!453516 (= e!265461 Unit!13258)))

(declare-fun b!453517 () Bool)

(assert (=> b!453517 (= e!265462 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (= (and d!74453 c!56266) b!453515))

(assert (= (and d!74453 (not c!56266)) b!453516))

(assert (= (and d!74453 (not res!270129)) b!453517))

(declare-fun m!437613 () Bool)

(assert (=> d!74453 m!437613))

(declare-fun m!437615 () Bool)

(assert (=> b!453515 m!437615))

(assert (=> b!453515 m!437213))

(assert (=> b!453515 m!437213))

(declare-fun m!437617 () Bool)

(assert (=> b!453515 m!437617))

(assert (=> b!453517 m!437213))

(assert (=> b!453517 m!437213))

(assert (=> b!453517 m!437617))

(assert (=> d!74355 d!74453))

(declare-fun b!453519 () Bool)

(declare-fun e!265463 () Option!376)

(declare-fun e!265464 () Option!376)

(assert (=> b!453519 (= e!265463 e!265464)))

(declare-fun c!56268 () Bool)

(assert (=> b!453519 (= c!56268 (and ((_ is Cons!8109) lt!205715) (not (= (_1!4039 (h!8965 lt!205715)) (_1!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun b!453518 () Bool)

(assert (=> b!453518 (= e!265463 (Some!375 (_2!4039 (h!8965 lt!205715))))))

(declare-fun d!74455 () Bool)

(declare-fun c!56267 () Bool)

(assert (=> d!74455 (= c!56267 (and ((_ is Cons!8109) lt!205715) (= (_1!4039 (h!8965 lt!205715)) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74455 (= (getValueByKey!370 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412))) e!265463)))

(declare-fun b!453521 () Bool)

(assert (=> b!453521 (= e!265464 None!374)))

(declare-fun b!453520 () Bool)

(assert (=> b!453520 (= e!265464 (getValueByKey!370 (t!13939 lt!205715) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (= (and d!74455 c!56267) b!453518))

(assert (= (and d!74455 (not c!56267)) b!453519))

(assert (= (and b!453519 c!56268) b!453520))

(assert (= (and b!453519 (not c!56268)) b!453521))

(declare-fun m!437619 () Bool)

(assert (=> b!453520 m!437619))

(assert (=> d!74355 d!74455))

(declare-fun d!74457 () Bool)

(assert (=> d!74457 (= (getValueByKey!370 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205858 () Unit!13248)

(assert (=> d!74457 (= lt!205858 (choose!1330 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun e!265465 () Bool)

(assert (=> d!74457 e!265465))

(declare-fun res!270130 () Bool)

(assert (=> d!74457 (=> (not res!270130) (not e!265465))))

(assert (=> d!74457 (= res!270130 (isStrictlySorted!378 lt!205715))))

(assert (=> d!74457 (= (lemmaContainsTupThenGetReturnValue!192 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))) lt!205858)))

(declare-fun b!453522 () Bool)

(declare-fun res!270131 () Bool)

(assert (=> b!453522 (=> (not res!270131) (not e!265465))))

(assert (=> b!453522 (= res!270131 (containsKey!347 lt!205715 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453523 () Bool)

(assert (=> b!453523 (= e!265465 (contains!2499 lt!205715 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (= (and d!74457 res!270130) b!453522))

(assert (= (and b!453522 res!270131) b!453523))

(assert (=> d!74457 m!437207))

(declare-fun m!437621 () Bool)

(assert (=> d!74457 m!437621))

(declare-fun m!437623 () Bool)

(assert (=> d!74457 m!437623))

(declare-fun m!437625 () Bool)

(assert (=> b!453522 m!437625))

(declare-fun m!437627 () Bool)

(assert (=> b!453523 m!437627))

(assert (=> d!74355 d!74457))

(declare-fun c!56269 () Bool)

(declare-fun e!265467 () List!8113)

(declare-fun c!56270 () Bool)

(declare-fun b!453524 () Bool)

(assert (=> b!453524 (= e!265467 (ite c!56269 (t!13939 (toList!3500 lt!205592)) (ite c!56270 (Cons!8109 (h!8965 (toList!3500 lt!205592)) (t!13939 (toList!3500 lt!205592))) Nil!8110)))))

(declare-fun b!453525 () Bool)

(declare-fun e!265469 () List!8113)

(declare-fun e!265468 () List!8113)

(assert (=> b!453525 (= e!265469 e!265468)))

(assert (=> b!453525 (= c!56269 (and ((_ is Cons!8109) (toList!3500 lt!205592)) (= (_1!4039 (h!8965 (toList!3500 lt!205592))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun b!453526 () Bool)

(declare-fun e!265466 () List!8113)

(declare-fun call!30072 () List!8113)

(assert (=> b!453526 (= e!265466 call!30072)))

(declare-fun d!74459 () Bool)

(declare-fun e!265470 () Bool)

(assert (=> d!74459 e!265470))

(declare-fun res!270132 () Bool)

(assert (=> d!74459 (=> (not res!270132) (not e!265470))))

(declare-fun lt!205859 () List!8113)

(assert (=> d!74459 (= res!270132 (isStrictlySorted!378 lt!205859))))

(assert (=> d!74459 (= lt!205859 e!265469)))

(declare-fun c!56271 () Bool)

(assert (=> d!74459 (= c!56271 (and ((_ is Cons!8109) (toList!3500 lt!205592)) (bvslt (_1!4039 (h!8965 (toList!3500 lt!205592))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74459 (isStrictlySorted!378 (toList!3500 lt!205592))))

(assert (=> d!74459 (= (insertStrictlySorted!195 (toList!3500 lt!205592) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))) lt!205859)))

(declare-fun b!453527 () Bool)

(declare-fun call!30073 () List!8113)

(assert (=> b!453527 (= e!265468 call!30073)))

(declare-fun b!453528 () Bool)

(declare-fun res!270133 () Bool)

(assert (=> b!453528 (=> (not res!270133) (not e!265470))))

(assert (=> b!453528 (= res!270133 (containsKey!347 lt!205859 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453529 () Bool)

(assert (=> b!453529 (= e!265467 (insertStrictlySorted!195 (t!13939 (toList!3500 lt!205592)) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453530 () Bool)

(assert (=> b!453530 (= e!265466 call!30072)))

(declare-fun b!453531 () Bool)

(declare-fun call!30074 () List!8113)

(assert (=> b!453531 (= e!265469 call!30074)))

(declare-fun b!453532 () Bool)

(assert (=> b!453532 (= e!265470 (contains!2499 lt!205859 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun bm!30069 () Bool)

(assert (=> bm!30069 (= call!30073 call!30074)))

(declare-fun bm!30070 () Bool)

(assert (=> bm!30070 (= call!30074 ($colon$colon!109 e!265467 (ite c!56271 (h!8965 (toList!3500 lt!205592)) (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun c!56272 () Bool)

(assert (=> bm!30070 (= c!56272 c!56271)))

(declare-fun bm!30071 () Bool)

(assert (=> bm!30071 (= call!30072 call!30073)))

(declare-fun b!453533 () Bool)

(assert (=> b!453533 (= c!56270 (and ((_ is Cons!8109) (toList!3500 lt!205592)) (bvsgt (_1!4039 (h!8965 (toList!3500 lt!205592))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> b!453533 (= e!265468 e!265466)))

(assert (= (and d!74459 c!56271) b!453531))

(assert (= (and d!74459 (not c!56271)) b!453525))

(assert (= (and b!453525 c!56269) b!453527))

(assert (= (and b!453525 (not c!56269)) b!453533))

(assert (= (and b!453533 c!56270) b!453526))

(assert (= (and b!453533 (not c!56270)) b!453530))

(assert (= (or b!453526 b!453530) bm!30071))

(assert (= (or b!453527 bm!30071) bm!30069))

(assert (= (or b!453531 bm!30069) bm!30070))

(assert (= (and bm!30070 c!56272) b!453529))

(assert (= (and bm!30070 (not c!56272)) b!453524))

(assert (= (and d!74459 res!270132) b!453528))

(assert (= (and b!453528 res!270133) b!453532))

(declare-fun m!437629 () Bool)

(assert (=> bm!30070 m!437629))

(declare-fun m!437631 () Bool)

(assert (=> b!453529 m!437631))

(declare-fun m!437633 () Bool)

(assert (=> b!453528 m!437633))

(declare-fun m!437635 () Bool)

(assert (=> b!453532 m!437635))

(declare-fun m!437637 () Bool)

(assert (=> d!74459 m!437637))

(declare-fun m!437639 () Bool)

(assert (=> d!74459 m!437639))

(assert (=> d!74355 d!74459))

(declare-fun d!74461 () Bool)

(declare-fun e!265472 () Bool)

(assert (=> d!74461 e!265472))

(declare-fun res!270134 () Bool)

(assert (=> d!74461 (=> res!270134 e!265472)))

(declare-fun lt!205861 () Bool)

(assert (=> d!74461 (= res!270134 (not lt!205861))))

(declare-fun lt!205862 () Bool)

(assert (=> d!74461 (= lt!205861 lt!205862)))

(declare-fun lt!205860 () Unit!13248)

(declare-fun e!265471 () Unit!13248)

(assert (=> d!74461 (= lt!205860 e!265471)))

(declare-fun c!56273 () Bool)

(assert (=> d!74461 (= c!56273 lt!205862)))

(assert (=> d!74461 (= lt!205862 (containsKey!347 (toList!3500 lt!205685) (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74461 (= (contains!2498 lt!205685 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205861)))

(declare-fun b!453534 () Bool)

(declare-fun lt!205863 () Unit!13248)

(assert (=> b!453534 (= e!265471 lt!205863)))

(assert (=> b!453534 (= lt!205863 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205685) (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453534 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453535 () Bool)

(declare-fun Unit!13259 () Unit!13248)

(assert (=> b!453535 (= e!265471 Unit!13259)))

(declare-fun b!453536 () Bool)

(assert (=> b!453536 (= e!265472 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74461 c!56273) b!453534))

(assert (= (and d!74461 (not c!56273)) b!453535))

(assert (= (and d!74461 (not res!270134)) b!453536))

(assert (=> d!74461 m!437105))

(declare-fun m!437641 () Bool)

(assert (=> d!74461 m!437641))

(assert (=> b!453534 m!437105))

(declare-fun m!437643 () Bool)

(assert (=> b!453534 m!437643))

(assert (=> b!453534 m!437105))

(declare-fun m!437645 () Bool)

(assert (=> b!453534 m!437645))

(assert (=> b!453534 m!437645))

(declare-fun m!437647 () Bool)

(assert (=> b!453534 m!437647))

(assert (=> b!453536 m!437105))

(assert (=> b!453536 m!437645))

(assert (=> b!453536 m!437645))

(assert (=> b!453536 m!437647))

(assert (=> b!453242 d!74461))

(declare-fun d!74463 () Bool)

(assert (=> d!74463 (= (validKeyInArray!0 (select (arr!13489 lt!205595) from!863)) (and (not (= (select (arr!13489 lt!205595) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 lt!205595) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453211 d!74463))

(declare-fun d!74465 () Bool)

(declare-fun e!265474 () Bool)

(assert (=> d!74465 e!265474))

(declare-fun res!270135 () Bool)

(assert (=> d!74465 (=> res!270135 e!265474)))

(declare-fun lt!205865 () Bool)

(assert (=> d!74465 (= res!270135 (not lt!205865))))

(declare-fun lt!205866 () Bool)

(assert (=> d!74465 (= lt!205865 lt!205866)))

(declare-fun lt!205864 () Unit!13248)

(declare-fun e!265473 () Unit!13248)

(assert (=> d!74465 (= lt!205864 e!265473)))

(declare-fun c!56274 () Bool)

(assert (=> d!74465 (= c!56274 lt!205866)))

(assert (=> d!74465 (= lt!205866 (containsKey!347 (toList!3500 lt!205655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74465 (= (contains!2498 lt!205655 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205865)))

(declare-fun b!453537 () Bool)

(declare-fun lt!205867 () Unit!13248)

(assert (=> b!453537 (= e!265473 lt!205867)))

(assert (=> b!453537 (= lt!205867 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453537 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453538 () Bool)

(declare-fun Unit!13260 () Unit!13248)

(assert (=> b!453538 (= e!265473 Unit!13260)))

(declare-fun b!453539 () Bool)

(assert (=> b!453539 (= e!265474 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74465 c!56274) b!453537))

(assert (= (and d!74465 (not c!56274)) b!453538))

(assert (= (and d!74465 (not res!270135)) b!453539))

(declare-fun m!437649 () Bool)

(assert (=> d!74465 m!437649))

(declare-fun m!437651 () Bool)

(assert (=> b!453537 m!437651))

(declare-fun m!437653 () Bool)

(assert (=> b!453537 m!437653))

(assert (=> b!453537 m!437653))

(declare-fun m!437655 () Bool)

(assert (=> b!453537 m!437655))

(assert (=> b!453539 m!437653))

(assert (=> b!453539 m!437653))

(assert (=> b!453539 m!437655))

(assert (=> d!74327 d!74465))

(assert (=> d!74327 d!74323))

(declare-fun d!74467 () Bool)

(declare-fun e!265476 () Bool)

(assert (=> d!74467 e!265476))

(declare-fun res!270136 () Bool)

(assert (=> d!74467 (=> res!270136 e!265476)))

(declare-fun lt!205869 () Bool)

(assert (=> d!74467 (= res!270136 (not lt!205869))))

(declare-fun lt!205870 () Bool)

(assert (=> d!74467 (= lt!205869 lt!205870)))

(declare-fun lt!205868 () Unit!13248)

(declare-fun e!265475 () Unit!13248)

(assert (=> d!74467 (= lt!205868 e!265475)))

(declare-fun c!56275 () Bool)

(assert (=> d!74467 (= c!56275 lt!205870)))

(assert (=> d!74467 (= lt!205870 (containsKey!347 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> d!74467 (= (contains!2498 lt!205721 (_1!4039 (tuple2!8057 k0!794 lt!205587))) lt!205869)))

(declare-fun b!453540 () Bool)

(declare-fun lt!205871 () Unit!13248)

(assert (=> b!453540 (= e!265475 lt!205871)))

(assert (=> b!453540 (= lt!205871 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> b!453540 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun b!453541 () Bool)

(declare-fun Unit!13261 () Unit!13248)

(assert (=> b!453541 (= e!265475 Unit!13261)))

(declare-fun b!453542 () Bool)

(assert (=> b!453542 (= e!265476 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (= (and d!74467 c!56275) b!453540))

(assert (= (and d!74467 (not c!56275)) b!453541))

(assert (= (and d!74467 (not res!270136)) b!453542))

(declare-fun m!437657 () Bool)

(assert (=> d!74467 m!437657))

(declare-fun m!437659 () Bool)

(assert (=> b!453540 m!437659))

(assert (=> b!453540 m!437225))

(assert (=> b!453540 m!437225))

(declare-fun m!437661 () Bool)

(assert (=> b!453540 m!437661))

(assert (=> b!453542 m!437225))

(assert (=> b!453542 m!437225))

(assert (=> b!453542 m!437661))

(assert (=> d!74357 d!74467))

(declare-fun b!453544 () Bool)

(declare-fun e!265477 () Option!376)

(declare-fun e!265478 () Option!376)

(assert (=> b!453544 (= e!265477 e!265478)))

(declare-fun c!56277 () Bool)

(assert (=> b!453544 (= c!56277 (and ((_ is Cons!8109) lt!205719) (not (= (_1!4039 (h!8965 lt!205719)) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))))

(declare-fun b!453543 () Bool)

(assert (=> b!453543 (= e!265477 (Some!375 (_2!4039 (h!8965 lt!205719))))))

(declare-fun d!74469 () Bool)

(declare-fun c!56276 () Bool)

(assert (=> d!74469 (= c!56276 (and ((_ is Cons!8109) lt!205719) (= (_1!4039 (h!8965 lt!205719)) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (=> d!74469 (= (getValueByKey!370 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587))) e!265477)))

(declare-fun b!453546 () Bool)

(assert (=> b!453546 (= e!265478 None!374)))

(declare-fun b!453545 () Bool)

(assert (=> b!453545 (= e!265478 (getValueByKey!370 (t!13939 lt!205719) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (= (and d!74469 c!56276) b!453543))

(assert (= (and d!74469 (not c!56276)) b!453544))

(assert (= (and b!453544 c!56277) b!453545))

(assert (= (and b!453544 (not c!56277)) b!453546))

(declare-fun m!437663 () Bool)

(assert (=> b!453545 m!437663))

(assert (=> d!74357 d!74469))

(declare-fun d!74471 () Bool)

(assert (=> d!74471 (= (getValueByKey!370 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun lt!205872 () Unit!13248)

(assert (=> d!74471 (= lt!205872 (choose!1330 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun e!265479 () Bool)

(assert (=> d!74471 e!265479))

(declare-fun res!270137 () Bool)

(assert (=> d!74471 (=> (not res!270137) (not e!265479))))

(assert (=> d!74471 (= res!270137 (isStrictlySorted!378 lt!205719))))

(assert (=> d!74471 (= (lemmaContainsTupThenGetReturnValue!192 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))) lt!205872)))

(declare-fun b!453547 () Bool)

(declare-fun res!270138 () Bool)

(assert (=> b!453547 (=> (not res!270138) (not e!265479))))

(assert (=> b!453547 (= res!270138 (containsKey!347 lt!205719 (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun b!453548 () Bool)

(assert (=> b!453548 (= e!265479 (contains!2499 lt!205719 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (= (and d!74471 res!270137) b!453547))

(assert (= (and b!453547 res!270138) b!453548))

(assert (=> d!74471 m!437219))

(declare-fun m!437665 () Bool)

(assert (=> d!74471 m!437665))

(declare-fun m!437667 () Bool)

(assert (=> d!74471 m!437667))

(declare-fun m!437669 () Bool)

(assert (=> b!453547 m!437669))

(declare-fun m!437671 () Bool)

(assert (=> b!453548 m!437671))

(assert (=> d!74357 d!74471))

(declare-fun b!453549 () Bool)

(declare-fun c!56279 () Bool)

(declare-fun e!265481 () List!8113)

(declare-fun c!56278 () Bool)

(assert (=> b!453549 (= e!265481 (ite c!56278 (t!13939 (toList!3500 lt!205585)) (ite c!56279 (Cons!8109 (h!8965 (toList!3500 lt!205585)) (t!13939 (toList!3500 lt!205585))) Nil!8110)))))

(declare-fun b!453550 () Bool)

(declare-fun e!265483 () List!8113)

(declare-fun e!265482 () List!8113)

(assert (=> b!453550 (= e!265483 e!265482)))

(assert (=> b!453550 (= c!56278 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (= (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(declare-fun b!453551 () Bool)

(declare-fun e!265480 () List!8113)

(declare-fun call!30075 () List!8113)

(assert (=> b!453551 (= e!265480 call!30075)))

(declare-fun d!74473 () Bool)

(declare-fun e!265484 () Bool)

(assert (=> d!74473 e!265484))

(declare-fun res!270139 () Bool)

(assert (=> d!74473 (=> (not res!270139) (not e!265484))))

(declare-fun lt!205873 () List!8113)

(assert (=> d!74473 (= res!270139 (isStrictlySorted!378 lt!205873))))

(assert (=> d!74473 (= lt!205873 e!265483)))

(declare-fun c!56280 () Bool)

(assert (=> d!74473 (= c!56280 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvslt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (=> d!74473 (isStrictlySorted!378 (toList!3500 lt!205585))))

(assert (=> d!74473 (= (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))) lt!205873)))

(declare-fun b!453552 () Bool)

(declare-fun call!30076 () List!8113)

(assert (=> b!453552 (= e!265482 call!30076)))

(declare-fun b!453553 () Bool)

(declare-fun res!270140 () Bool)

(assert (=> b!453553 (=> (not res!270140) (not e!265484))))

(assert (=> b!453553 (= res!270140 (containsKey!347 lt!205873 (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun b!453554 () Bool)

(assert (=> b!453554 (= e!265481 (insertStrictlySorted!195 (t!13939 (toList!3500 lt!205585)) (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))))))

(declare-fun b!453555 () Bool)

(assert (=> b!453555 (= e!265480 call!30075)))

(declare-fun b!453556 () Bool)

(declare-fun call!30077 () List!8113)

(assert (=> b!453556 (= e!265483 call!30077)))

(declare-fun b!453557 () Bool)

(assert (=> b!453557 (= e!265484 (contains!2499 lt!205873 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587)))))))

(declare-fun bm!30072 () Bool)

(assert (=> bm!30072 (= call!30076 call!30077)))

(declare-fun bm!30073 () Bool)

(assert (=> bm!30073 (= call!30077 ($colon$colon!109 e!265481 (ite c!56280 (h!8965 (toList!3500 lt!205585)) (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 lt!205587)) (_2!4039 (tuple2!8057 k0!794 lt!205587))))))))

(declare-fun c!56281 () Bool)

(assert (=> bm!30073 (= c!56281 c!56280)))

(declare-fun bm!30074 () Bool)

(assert (=> bm!30074 (= call!30075 call!30076)))

(declare-fun b!453558 () Bool)

(assert (=> b!453558 (= c!56279 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvsgt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (=> b!453558 (= e!265482 e!265480)))

(assert (= (and d!74473 c!56280) b!453556))

(assert (= (and d!74473 (not c!56280)) b!453550))

(assert (= (and b!453550 c!56278) b!453552))

(assert (= (and b!453550 (not c!56278)) b!453558))

(assert (= (and b!453558 c!56279) b!453551))

(assert (= (and b!453558 (not c!56279)) b!453555))

(assert (= (or b!453551 b!453555) bm!30074))

(assert (= (or b!453552 bm!30074) bm!30072))

(assert (= (or b!453556 bm!30072) bm!30073))

(assert (= (and bm!30073 c!56281) b!453554))

(assert (= (and bm!30073 (not c!56281)) b!453549))

(assert (= (and d!74473 res!270139) b!453553))

(assert (= (and b!453553 res!270140) b!453557))

(declare-fun m!437673 () Bool)

(assert (=> bm!30073 m!437673))

(declare-fun m!437675 () Bool)

(assert (=> b!453554 m!437675))

(declare-fun m!437677 () Bool)

(assert (=> b!453553 m!437677))

(declare-fun m!437679 () Bool)

(assert (=> b!453557 m!437679))

(declare-fun m!437681 () Bool)

(assert (=> d!74473 m!437681))

(assert (=> d!74473 m!437457))

(assert (=> d!74357 d!74473))

(declare-fun d!74475 () Bool)

(assert (=> d!74475 (= (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453255 d!74475))

(declare-fun b!453560 () Bool)

(declare-fun e!265485 () Option!376)

(declare-fun e!265486 () Option!376)

(assert (=> b!453560 (= e!265485 e!265486)))

(declare-fun c!56283 () Bool)

(assert (=> b!453560 (= c!56283 (and ((_ is Cons!8109) (toList!3500 lt!205640)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205640))) (_1!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun b!453559 () Bool)

(assert (=> b!453559 (= e!265485 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205640)))))))

(declare-fun d!74477 () Bool)

(declare-fun c!56282 () Bool)

(assert (=> d!74477 (= c!56282 (and ((_ is Cons!8109) (toList!3500 lt!205640)) (= (_1!4039 (h!8965 (toList!3500 lt!205640))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74477 (= (getValueByKey!370 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412))) e!265485)))

(declare-fun b!453562 () Bool)

(assert (=> b!453562 (= e!265486 None!374)))

(declare-fun b!453561 () Bool)

(assert (=> b!453561 (= e!265486 (getValueByKey!370 (t!13939 (toList!3500 lt!205640)) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (= (and d!74477 c!56282) b!453559))

(assert (= (and d!74477 (not c!56282)) b!453560))

(assert (= (and b!453560 c!56283) b!453561))

(assert (= (and b!453560 (not c!56283)) b!453562))

(declare-fun m!437683 () Bool)

(assert (=> b!453561 m!437683))

(assert (=> b!453160 d!74477))

(declare-fun b!453564 () Bool)

(declare-fun e!265487 () Option!376)

(declare-fun e!265488 () Option!376)

(assert (=> b!453564 (= e!265487 e!265488)))

(declare-fun c!56285 () Bool)

(assert (=> b!453564 (= c!56285 (and ((_ is Cons!8109) (toList!3500 lt!205717)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205717))) (_1!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun b!453563 () Bool)

(assert (=> b!453563 (= e!265487 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205717)))))))

(declare-fun c!56284 () Bool)

(declare-fun d!74479 () Bool)

(assert (=> d!74479 (= c!56284 (and ((_ is Cons!8109) (toList!3500 lt!205717)) (= (_1!4039 (h!8965 (toList!3500 lt!205717))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74479 (= (getValueByKey!370 (toList!3500 lt!205717) (_1!4039 (tuple2!8057 k0!794 v!412))) e!265487)))

(declare-fun b!453566 () Bool)

(assert (=> b!453566 (= e!265488 None!374)))

(declare-fun b!453565 () Bool)

(assert (=> b!453565 (= e!265488 (getValueByKey!370 (t!13939 (toList!3500 lt!205717)) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (= (and d!74479 c!56284) b!453563))

(assert (= (and d!74479 (not c!56284)) b!453564))

(assert (= (and b!453564 c!56285) b!453565))

(assert (= (and b!453564 (not c!56285)) b!453566))

(declare-fun m!437685 () Bool)

(assert (=> b!453565 m!437685))

(assert (=> b!453272 d!74479))

(declare-fun b!453567 () Bool)

(declare-fun e!265489 () Bool)

(declare-fun call!30078 () Bool)

(assert (=> b!453567 (= e!265489 call!30078)))

(declare-fun b!453568 () Bool)

(declare-fun e!265490 () Bool)

(assert (=> b!453568 (= e!265490 e!265489)))

(declare-fun c!56286 () Bool)

(assert (=> b!453568 (= c!56286 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!74481 () Bool)

(declare-fun res!270143 () Bool)

(declare-fun e!265491 () Bool)

(assert (=> d!74481 (=> res!270143 e!265491)))

(assert (=> d!74481 (= res!270143 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(assert (=> d!74481 (= (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56199 (Cons!8110 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) Nil!8111) Nil!8111)) e!265491)))

(declare-fun b!453569 () Bool)

(declare-fun e!265492 () Bool)

(assert (=> b!453569 (= e!265492 (contains!2497 (ite c!56199 (Cons!8110 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) Nil!8111) Nil!8111) (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453570 () Bool)

(assert (=> b!453570 (= e!265489 call!30078)))

(declare-fun bm!30075 () Bool)

(assert (=> bm!30075 (= call!30078 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56286 (Cons!8110 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56199 (Cons!8110 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) Nil!8111) Nil!8111)) (ite c!56199 (Cons!8110 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) Nil!8111) Nil!8111))))))

(declare-fun b!453571 () Bool)

(assert (=> b!453571 (= e!265491 e!265490)))

(declare-fun res!270142 () Bool)

(assert (=> b!453571 (=> (not res!270142) (not e!265490))))

(assert (=> b!453571 (= res!270142 (not e!265492))))

(declare-fun res!270141 () Bool)

(assert (=> b!453571 (=> (not res!270141) (not e!265492))))

(assert (=> b!453571 (= res!270141 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!74481 (not res!270143)) b!453571))

(assert (= (and b!453571 res!270141) b!453569))

(assert (= (and b!453571 res!270142) b!453568))

(assert (= (and b!453568 c!56286) b!453570))

(assert (= (and b!453568 (not c!56286)) b!453567))

(assert (= (or b!453570 b!453567) bm!30075))

(assert (=> b!453568 m!437477))

(assert (=> b!453568 m!437477))

(declare-fun m!437687 () Bool)

(assert (=> b!453568 m!437687))

(assert (=> b!453569 m!437477))

(assert (=> b!453569 m!437477))

(declare-fun m!437689 () Bool)

(assert (=> b!453569 m!437689))

(assert (=> bm!30075 m!437477))

(declare-fun m!437691 () Bool)

(assert (=> bm!30075 m!437691))

(assert (=> b!453571 m!437477))

(assert (=> b!453571 m!437477))

(assert (=> b!453571 m!437687))

(assert (=> bm!30047 d!74481))

(declare-fun d!74483 () Bool)

(assert (=> d!74483 (= (apply!313 lt!205699 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (getValueByKey!370 (toList!3500 lt!205699) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14406 () Bool)

(assert (= bs!14406 d!74483))

(assert (=> bs!14406 m!437155))

(declare-fun m!437693 () Bool)

(assert (=> bs!14406 m!437693))

(assert (=> bs!14406 m!437693))

(declare-fun m!437695 () Bool)

(assert (=> bs!14406 m!437695))

(assert (=> b!453261 d!74483))

(declare-fun d!74485 () Bool)

(declare-fun c!56287 () Bool)

(assert (=> d!74485 (= c!56287 ((_ is ValueCellFull!5727) (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265493 () V!17293)

(assert (=> d!74485 (= (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265493)))

(declare-fun b!453572 () Bool)

(assert (=> b!453572 (= e!265493 (get!6654 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453573 () Bool)

(assert (=> b!453573 (= e!265493 (get!6655 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74485 c!56287) b!453572))

(assert (= (and d!74485 (not c!56287)) b!453573))

(assert (=> b!453572 m!437167))

(assert (=> b!453572 m!436867))

(declare-fun m!437697 () Bool)

(assert (=> b!453572 m!437697))

(assert (=> b!453573 m!437167))

(assert (=> b!453573 m!436867))

(declare-fun m!437699 () Bool)

(assert (=> b!453573 m!437699))

(assert (=> b!453261 d!74485))

(declare-fun d!74487 () Bool)

(declare-fun lt!205874 () Bool)

(assert (=> d!74487 (= lt!205874 (select (content!203 (toList!3500 lt!205695)) lt!205594))))

(declare-fun e!265495 () Bool)

(assert (=> d!74487 (= lt!205874 e!265495)))

(declare-fun res!270144 () Bool)

(assert (=> d!74487 (=> (not res!270144) (not e!265495))))

(assert (=> d!74487 (= res!270144 ((_ is Cons!8109) (toList!3500 lt!205695)))))

(assert (=> d!74487 (= (contains!2499 (toList!3500 lt!205695) lt!205594) lt!205874)))

(declare-fun b!453574 () Bool)

(declare-fun e!265494 () Bool)

(assert (=> b!453574 (= e!265495 e!265494)))

(declare-fun res!270145 () Bool)

(assert (=> b!453574 (=> res!270145 e!265494)))

(assert (=> b!453574 (= res!270145 (= (h!8965 (toList!3500 lt!205695)) lt!205594))))

(declare-fun b!453575 () Bool)

(assert (=> b!453575 (= e!265494 (contains!2499 (t!13939 (toList!3500 lt!205695)) lt!205594))))

(assert (= (and d!74487 res!270144) b!453574))

(assert (= (and b!453574 (not res!270145)) b!453575))

(declare-fun m!437701 () Bool)

(assert (=> d!74487 m!437701))

(declare-fun m!437703 () Bool)

(assert (=> d!74487 m!437703))

(declare-fun m!437705 () Bool)

(assert (=> b!453575 m!437705))

(assert (=> b!453253 d!74487))

(declare-fun d!74489 () Bool)

(assert (=> d!74489 (= (apply!313 lt!205671 (select (arr!13489 lt!205595) from!863)) (get!6656 (getValueByKey!370 (toList!3500 lt!205671) (select (arr!13489 lt!205595) from!863))))))

(declare-fun bs!14407 () Bool)

(assert (= bs!14407 d!74489))

(assert (=> bs!14407 m!436885))

(declare-fun m!437707 () Bool)

(assert (=> bs!14407 m!437707))

(assert (=> bs!14407 m!437707))

(declare-fun m!437709 () Bool)

(assert (=> bs!14407 m!437709))

(assert (=> b!453217 d!74489))

(declare-fun d!74491 () Bool)

(declare-fun c!56288 () Bool)

(assert (=> d!74491 (= c!56288 ((_ is ValueCellFull!5727) (select (arr!13490 lt!205593) from!863)))))

(declare-fun e!265496 () V!17293)

(assert (=> d!74491 (= (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265496)))

(declare-fun b!453576 () Bool)

(assert (=> b!453576 (= e!265496 (get!6654 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453577 () Bool)

(assert (=> b!453577 (= e!265496 (get!6655 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74491 c!56288) b!453576))

(assert (= (and d!74491 (not c!56288)) b!453577))

(assert (=> b!453576 m!437067))

(assert (=> b!453576 m!436867))

(declare-fun m!437711 () Bool)

(assert (=> b!453576 m!437711))

(assert (=> b!453577 m!437067))

(assert (=> b!453577 m!436867))

(declare-fun m!437713 () Bool)

(assert (=> b!453577 m!437713))

(assert (=> b!453217 d!74491))

(assert (=> bm!30036 d!74381))

(declare-fun d!74493 () Bool)

(declare-fun e!265497 () Bool)

(assert (=> d!74493 e!265497))

(declare-fun res!270147 () Bool)

(assert (=> d!74493 (=> (not res!270147) (not e!265497))))

(declare-fun lt!205878 () ListLongMap!6969)

(assert (=> d!74493 (= res!270147 (contains!2498 lt!205878 (_1!4039 (tuple2!8057 lt!205680 lt!205679))))))

(declare-fun lt!205876 () List!8113)

(assert (=> d!74493 (= lt!205878 (ListLongMap!6970 lt!205876))))

(declare-fun lt!205877 () Unit!13248)

(declare-fun lt!205875 () Unit!13248)

(assert (=> d!74493 (= lt!205877 lt!205875)))

(assert (=> d!74493 (= (getValueByKey!370 lt!205876 (_1!4039 (tuple2!8057 lt!205680 lt!205679))) (Some!375 (_2!4039 (tuple2!8057 lt!205680 lt!205679))))))

(assert (=> d!74493 (= lt!205875 (lemmaContainsTupThenGetReturnValue!192 lt!205876 (_1!4039 (tuple2!8057 lt!205680 lt!205679)) (_2!4039 (tuple2!8057 lt!205680 lt!205679))))))

(assert (=> d!74493 (= lt!205876 (insertStrictlySorted!195 (toList!3500 lt!205681) (_1!4039 (tuple2!8057 lt!205680 lt!205679)) (_2!4039 (tuple2!8057 lt!205680 lt!205679))))))

(assert (=> d!74493 (= (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679)) lt!205878)))

(declare-fun b!453578 () Bool)

(declare-fun res!270146 () Bool)

(assert (=> b!453578 (=> (not res!270146) (not e!265497))))

(assert (=> b!453578 (= res!270146 (= (getValueByKey!370 (toList!3500 lt!205878) (_1!4039 (tuple2!8057 lt!205680 lt!205679))) (Some!375 (_2!4039 (tuple2!8057 lt!205680 lt!205679)))))))

(declare-fun b!453579 () Bool)

(assert (=> b!453579 (= e!265497 (contains!2499 (toList!3500 lt!205878) (tuple2!8057 lt!205680 lt!205679)))))

(assert (= (and d!74493 res!270147) b!453578))

(assert (= (and b!453578 res!270146) b!453579))

(declare-fun m!437715 () Bool)

(assert (=> d!74493 m!437715))

(declare-fun m!437717 () Bool)

(assert (=> d!74493 m!437717))

(declare-fun m!437719 () Bool)

(assert (=> d!74493 m!437719))

(declare-fun m!437721 () Bool)

(assert (=> d!74493 m!437721))

(declare-fun m!437723 () Bool)

(assert (=> b!453578 m!437723))

(declare-fun m!437725 () Bool)

(assert (=> b!453579 m!437725))

(assert (=> b!453222 d!74493))

(declare-fun d!74495 () Bool)

(declare-fun e!265499 () Bool)

(assert (=> d!74495 e!265499))

(declare-fun res!270148 () Bool)

(assert (=> d!74495 (=> res!270148 e!265499)))

(declare-fun lt!205880 () Bool)

(assert (=> d!74495 (= res!270148 (not lt!205880))))

(declare-fun lt!205881 () Bool)

(assert (=> d!74495 (= lt!205880 lt!205881)))

(declare-fun lt!205879 () Unit!13248)

(declare-fun e!265498 () Unit!13248)

(assert (=> d!74495 (= lt!205879 e!265498)))

(declare-fun c!56289 () Bool)

(assert (=> d!74495 (= c!56289 lt!205881)))

(assert (=> d!74495 (= lt!205881 (containsKey!347 (toList!3500 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679))) lt!205683))))

(assert (=> d!74495 (= (contains!2498 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679)) lt!205683) lt!205880)))

(declare-fun b!453580 () Bool)

(declare-fun lt!205882 () Unit!13248)

(assert (=> b!453580 (= e!265498 lt!205882)))

(assert (=> b!453580 (= lt!205882 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679))) lt!205683))))

(assert (=> b!453580 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679))) lt!205683))))

(declare-fun b!453581 () Bool)

(declare-fun Unit!13262 () Unit!13248)

(assert (=> b!453581 (= e!265498 Unit!13262)))

(declare-fun b!453582 () Bool)

(assert (=> b!453582 (= e!265499 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679))) lt!205683)))))

(assert (= (and d!74495 c!56289) b!453580))

(assert (= (and d!74495 (not c!56289)) b!453581))

(assert (= (and d!74495 (not res!270148)) b!453582))

(declare-fun m!437727 () Bool)

(assert (=> d!74495 m!437727))

(declare-fun m!437729 () Bool)

(assert (=> b!453580 m!437729))

(declare-fun m!437731 () Bool)

(assert (=> b!453580 m!437731))

(assert (=> b!453580 m!437731))

(declare-fun m!437733 () Bool)

(assert (=> b!453580 m!437733))

(assert (=> b!453582 m!437731))

(assert (=> b!453582 m!437731))

(assert (=> b!453582 m!437733))

(assert (=> b!453222 d!74495))

(declare-fun d!74497 () Bool)

(assert (=> d!74497 (not (contains!2498 (+!1576 lt!205681 (tuple2!8057 lt!205680 lt!205679)) lt!205683))))

(declare-fun lt!205883 () Unit!13248)

(assert (=> d!74497 (= lt!205883 (choose!1329 lt!205681 lt!205680 lt!205679 lt!205683))))

(declare-fun e!265500 () Bool)

(assert (=> d!74497 e!265500))

(declare-fun res!270149 () Bool)

(assert (=> d!74497 (=> (not res!270149) (not e!265500))))

(assert (=> d!74497 (= res!270149 (not (contains!2498 lt!205681 lt!205683)))))

(assert (=> d!74497 (= (addStillNotContains!146 lt!205681 lt!205680 lt!205679 lt!205683) lt!205883)))

(declare-fun b!453583 () Bool)

(assert (=> b!453583 (= e!265500 (not (= lt!205680 lt!205683)))))

(assert (= (and d!74497 res!270149) b!453583))

(assert (=> d!74497 m!437087))

(assert (=> d!74497 m!437087))

(assert (=> d!74497 m!437089))

(declare-fun m!437735 () Bool)

(assert (=> d!74497 m!437735))

(declare-fun m!437737 () Bool)

(assert (=> d!74497 m!437737))

(assert (=> b!453222 d!74497))

(assert (=> b!453222 d!74423))

(declare-fun d!74499 () Bool)

(declare-fun e!265501 () Bool)

(assert (=> d!74499 e!265501))

(declare-fun res!270151 () Bool)

(assert (=> d!74499 (=> (not res!270151) (not e!265501))))

(declare-fun lt!205887 () ListLongMap!6969)

(assert (=> d!74499 (= res!270151 (contains!2498 lt!205887 (_1!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205885 () List!8113)

(assert (=> d!74499 (= lt!205887 (ListLongMap!6970 lt!205885))))

(declare-fun lt!205886 () Unit!13248)

(declare-fun lt!205884 () Unit!13248)

(assert (=> d!74499 (= lt!205886 lt!205884)))

(assert (=> d!74499 (= (getValueByKey!370 lt!205885 (_1!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74499 (= lt!205884 (lemmaContainsTupThenGetReturnValue!192 lt!205885 (_1!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74499 (= lt!205885 (insertStrictlySorted!195 (toList!3500 call!30040) (_1!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74499 (= (+!1576 call!30040 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205887)))

(declare-fun b!453584 () Bool)

(declare-fun res!270150 () Bool)

(assert (=> b!453584 (=> (not res!270150) (not e!265501))))

(assert (=> b!453584 (= res!270150 (= (getValueByKey!370 (toList!3500 lt!205887) (_1!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453585 () Bool)

(assert (=> b!453585 (= e!265501 (contains!2499 (toList!3500 lt!205887) (tuple2!8057 (select (arr!13489 _keys!709) from!863) (get!6653 (select (arr!13490 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74499 res!270151) b!453584))

(assert (= (and b!453584 res!270150) b!453585))

(declare-fun m!437739 () Bool)

(assert (=> d!74499 m!437739))

(declare-fun m!437741 () Bool)

(assert (=> d!74499 m!437741))

(declare-fun m!437743 () Bool)

(assert (=> d!74499 m!437743))

(declare-fun m!437745 () Bool)

(assert (=> d!74499 m!437745))

(declare-fun m!437747 () Bool)

(assert (=> b!453584 m!437747))

(declare-fun m!437749 () Bool)

(assert (=> b!453585 m!437749))

(assert (=> b!453222 d!74499))

(declare-fun b!453587 () Bool)

(declare-fun e!265502 () Option!376)

(declare-fun e!265503 () Option!376)

(assert (=> b!453587 (= e!265502 e!265503)))

(declare-fun c!56291 () Bool)

(assert (=> b!453587 (= c!56291 (and ((_ is Cons!8109) (toList!3500 lt!205721)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205721))) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))))

(declare-fun b!453586 () Bool)

(assert (=> b!453586 (= e!265502 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205721)))))))

(declare-fun c!56290 () Bool)

(declare-fun d!74501 () Bool)

(assert (=> d!74501 (= c!56290 (and ((_ is Cons!8109) (toList!3500 lt!205721)) (= (_1!4039 (h!8965 (toList!3500 lt!205721))) (_1!4039 (tuple2!8057 k0!794 lt!205587)))))))

(assert (=> d!74501 (= (getValueByKey!370 (toList!3500 lt!205721) (_1!4039 (tuple2!8057 k0!794 lt!205587))) e!265502)))

(declare-fun b!453589 () Bool)

(assert (=> b!453589 (= e!265503 None!374)))

(declare-fun b!453588 () Bool)

(assert (=> b!453588 (= e!265503 (getValueByKey!370 (t!13939 (toList!3500 lt!205721)) (_1!4039 (tuple2!8057 k0!794 lt!205587))))))

(assert (= (and d!74501 c!56290) b!453586))

(assert (= (and d!74501 (not c!56290)) b!453587))

(assert (= (and b!453587 c!56291) b!453588))

(assert (= (and b!453587 (not c!56291)) b!453589))

(declare-fun m!437751 () Bool)

(assert (=> b!453588 m!437751))

(assert (=> b!453274 d!74501))

(assert (=> bm!30039 d!74397))

(declare-fun b!453590 () Bool)

(declare-fun e!265504 () Bool)

(declare-fun call!30079 () Bool)

(assert (=> b!453590 (= e!265504 call!30079)))

(declare-fun b!453591 () Bool)

(declare-fun e!265505 () Bool)

(assert (=> b!453591 (= e!265505 e!265504)))

(declare-fun c!56292 () Bool)

(assert (=> b!453591 (= c!56292 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!74503 () Bool)

(declare-fun res!270154 () Bool)

(declare-fun e!265506 () Bool)

(assert (=> d!74503 (=> res!270154 e!265506)))

(assert (=> d!74503 (= res!270154 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 lt!205595)))))

(assert (=> d!74503 (= (arrayNoDuplicates!0 lt!205595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56159 (Cons!8110 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) Nil!8111) Nil!8111)) e!265506)))

(declare-fun b!453592 () Bool)

(declare-fun e!265507 () Bool)

(assert (=> b!453592 (= e!265507 (contains!2497 (ite c!56159 (Cons!8110 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) Nil!8111) Nil!8111) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453593 () Bool)

(assert (=> b!453593 (= e!265504 call!30079)))

(declare-fun bm!30076 () Bool)

(assert (=> bm!30076 (= call!30079 (arrayNoDuplicates!0 lt!205595 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56292 (Cons!8110 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56159 (Cons!8110 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) Nil!8111) Nil!8111)) (ite c!56159 (Cons!8110 (select (arr!13489 lt!205595) #b00000000000000000000000000000000) Nil!8111) Nil!8111))))))

(declare-fun b!453594 () Bool)

(assert (=> b!453594 (= e!265506 e!265505)))

(declare-fun res!270153 () Bool)

(assert (=> b!453594 (=> (not res!270153) (not e!265505))))

(assert (=> b!453594 (= res!270153 (not e!265507))))

(declare-fun res!270152 () Bool)

(assert (=> b!453594 (=> (not res!270152) (not e!265507))))

(assert (=> b!453594 (= res!270152 (validKeyInArray!0 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!74503 (not res!270154)) b!453594))

(assert (= (and b!453594 res!270152) b!453592))

(assert (= (and b!453594 res!270153) b!453591))

(assert (= (and b!453591 c!56292) b!453593))

(assert (= (and b!453591 (not c!56292)) b!453590))

(assert (= (or b!453593 b!453590) bm!30076))

(assert (=> b!453591 m!437323))

(assert (=> b!453591 m!437323))

(assert (=> b!453591 m!437325))

(assert (=> b!453592 m!437323))

(assert (=> b!453592 m!437323))

(declare-fun m!437753 () Bool)

(assert (=> b!453592 m!437753))

(assert (=> bm!30076 m!437323))

(declare-fun m!437755 () Bool)

(assert (=> bm!30076 m!437755))

(assert (=> b!453594 m!437323))

(assert (=> b!453594 m!437323))

(assert (=> b!453594 m!437325))

(assert (=> bm!30029 d!74503))

(declare-fun d!74505 () Bool)

(declare-fun lt!205888 () Bool)

(assert (=> d!74505 (= lt!205888 (select (content!204 Nil!8111) (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun e!265508 () Bool)

(assert (=> d!74505 (= lt!205888 e!265508)))

(declare-fun res!270156 () Bool)

(assert (=> d!74505 (=> (not res!270156) (not e!265508))))

(assert (=> d!74505 (= res!270156 ((_ is Cons!8110) Nil!8111))))

(assert (=> d!74505 (= (contains!2497 Nil!8111 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)) lt!205888)))

(declare-fun b!453595 () Bool)

(declare-fun e!265509 () Bool)

(assert (=> b!453595 (= e!265508 e!265509)))

(declare-fun res!270155 () Bool)

(assert (=> b!453595 (=> res!270155 e!265509)))

(assert (=> b!453595 (= res!270155 (= (h!8966 Nil!8111) (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453596 () Bool)

(assert (=> b!453596 (= e!265509 (contains!2497 (t!13940 Nil!8111) (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74505 res!270156) b!453595))

(assert (= (and b!453595 (not res!270155)) b!453596))

(assert (=> d!74505 m!437511))

(assert (=> d!74505 m!437041))

(declare-fun m!437757 () Bool)

(assert (=> d!74505 m!437757))

(assert (=> b!453596 m!437041))

(declare-fun m!437759 () Bool)

(assert (=> b!453596 m!437759))

(assert (=> b!453291 d!74505))

(declare-fun b!453598 () Bool)

(declare-fun e!265510 () Option!376)

(declare-fun e!265511 () Option!376)

(assert (=> b!453598 (= e!265510 e!265511)))

(declare-fun c!56294 () Bool)

(assert (=> b!453598 (= c!56294 (and ((_ is Cons!8109) (toList!3500 lt!205713)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205713))) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))))

(declare-fun b!453597 () Bool)

(assert (=> b!453597 (= e!265510 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205713)))))))

(declare-fun d!74507 () Bool)

(declare-fun c!56293 () Bool)

(assert (=> d!74507 (= c!56293 (and ((_ is Cons!8109) (toList!3500 lt!205713)) (= (_1!4039 (h!8965 (toList!3500 lt!205713))) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))))

(assert (=> d!74507 (= (getValueByKey!370 (toList!3500 lt!205713) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))) e!265510)))

(declare-fun b!453600 () Bool)

(assert (=> b!453600 (= e!265511 None!374)))

(declare-fun b!453599 () Bool)

(assert (=> b!453599 (= e!265511 (getValueByKey!370 (t!13939 (toList!3500 lt!205713)) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589))))))

(assert (= (and d!74507 c!56293) b!453597))

(assert (= (and d!74507 (not c!56293)) b!453598))

(assert (= (and b!453598 c!56294) b!453599))

(assert (= (and b!453598 (not c!56294)) b!453600))

(declare-fun m!437761 () Bool)

(assert (=> b!453599 m!437761))

(assert (=> b!453270 d!74507))

(declare-fun d!74509 () Bool)

(assert (=> d!74509 (= (isEmpty!559 lt!205655) (isEmpty!560 (toList!3500 lt!205655)))))

(declare-fun bs!14408 () Bool)

(assert (= bs!14408 d!74509))

(declare-fun m!437763 () Bool)

(assert (=> bs!14408 m!437763))

(assert (=> b!453190 d!74509))

(declare-fun d!74511 () Bool)

(assert (=> d!74511 (= (isEmpty!559 lt!205678) (isEmpty!560 (toList!3500 lt!205678)))))

(declare-fun bs!14409 () Bool)

(assert (= bs!14409 d!74511))

(declare-fun m!437765 () Bool)

(assert (=> bs!14409 m!437765))

(assert (=> b!453226 d!74511))

(declare-fun bm!30077 () Bool)

(declare-fun call!30080 () Bool)

(assert (=> bm!30077 (= call!30080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!453601 () Bool)

(declare-fun e!265512 () Bool)

(assert (=> b!453601 (= e!265512 call!30080)))

(declare-fun d!74513 () Bool)

(declare-fun res!270158 () Bool)

(declare-fun e!265514 () Bool)

(assert (=> d!74513 (=> res!270158 e!265514)))

(assert (=> d!74513 (= res!270158 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(assert (=> d!74513 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025) e!265514)))

(declare-fun b!453602 () Bool)

(declare-fun e!265513 () Bool)

(assert (=> b!453602 (= e!265513 call!30080)))

(declare-fun b!453603 () Bool)

(assert (=> b!453603 (= e!265514 e!265512)))

(declare-fun c!56295 () Bool)

(assert (=> b!453603 (= c!56295 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453604 () Bool)

(assert (=> b!453604 (= e!265512 e!265513)))

(declare-fun lt!205890 () (_ BitVec 64))

(assert (=> b!453604 (= lt!205890 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205889 () Unit!13248)

(assert (=> b!453604 (= lt!205889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205890 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453604 (arrayContainsKey!0 _keys!709 lt!205890 #b00000000000000000000000000000000)))

(declare-fun lt!205891 () Unit!13248)

(assert (=> b!453604 (= lt!205891 lt!205889)))

(declare-fun res!270157 () Bool)

(assert (=> b!453604 (= res!270157 (= (seekEntryOrOpen!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!709 mask!1025) (Found!3532 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453604 (=> (not res!270157) (not e!265513))))

(assert (= (and d!74513 (not res!270158)) b!453603))

(assert (= (and b!453603 c!56295) b!453604))

(assert (= (and b!453603 (not c!56295)) b!453601))

(assert (= (and b!453604 res!270157) b!453602))

(assert (= (or b!453602 b!453601) bm!30077))

(declare-fun m!437767 () Bool)

(assert (=> bm!30077 m!437767))

(assert (=> b!453603 m!437477))

(assert (=> b!453603 m!437477))

(assert (=> b!453603 m!437687))

(assert (=> b!453604 m!437477))

(declare-fun m!437769 () Bool)

(assert (=> b!453604 m!437769))

(declare-fun m!437771 () Bool)

(assert (=> b!453604 m!437771))

(assert (=> b!453604 m!437477))

(declare-fun m!437773 () Bool)

(assert (=> b!453604 m!437773))

(assert (=> bm!30035 d!74513))

(declare-fun d!74515 () Bool)

(assert (=> d!74515 (= (validKeyInArray!0 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453235 d!74515))

(assert (=> b!453197 d!74393))

(declare-fun d!74517 () Bool)

(assert (=> d!74517 (= (get!6655 (select (arr!13490 _values!549) from!863) lt!205588) lt!205588)))

(assert (=> b!453251 d!74517))

(declare-fun d!74519 () Bool)

(declare-fun e!265516 () Bool)

(assert (=> d!74519 e!265516))

(declare-fun res!270159 () Bool)

(assert (=> d!74519 (=> res!270159 e!265516)))

(declare-fun lt!205893 () Bool)

(assert (=> d!74519 (= res!270159 (not lt!205893))))

(declare-fun lt!205894 () Bool)

(assert (=> d!74519 (= lt!205893 lt!205894)))

(declare-fun lt!205892 () Unit!13248)

(declare-fun e!265515 () Unit!13248)

(assert (=> d!74519 (= lt!205892 e!265515)))

(declare-fun c!56296 () Bool)

(assert (=> d!74519 (= c!56296 lt!205894)))

(assert (=> d!74519 (= lt!205894 (containsKey!347 (toList!3500 lt!205685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74519 (= (contains!2498 lt!205685 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205893)))

(declare-fun b!453605 () Bool)

(declare-fun lt!205895 () Unit!13248)

(assert (=> b!453605 (= e!265515 lt!205895)))

(assert (=> b!453605 (= lt!205895 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453605 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453606 () Bool)

(declare-fun Unit!13263 () Unit!13248)

(assert (=> b!453606 (= e!265515 Unit!13263)))

(declare-fun b!453607 () Bool)

(assert (=> b!453607 (= e!265516 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74519 c!56296) b!453605))

(assert (= (and d!74519 (not c!56296)) b!453606))

(assert (= (and d!74519 (not res!270159)) b!453607))

(declare-fun m!437775 () Bool)

(assert (=> d!74519 m!437775))

(declare-fun m!437777 () Bool)

(assert (=> b!453605 m!437777))

(declare-fun m!437779 () Bool)

(assert (=> b!453605 m!437779))

(assert (=> b!453605 m!437779))

(declare-fun m!437781 () Bool)

(assert (=> b!453605 m!437781))

(assert (=> b!453607 m!437779))

(assert (=> b!453607 m!437779))

(assert (=> b!453607 m!437781))

(assert (=> d!74339 d!74519))

(assert (=> d!74339 d!74323))

(declare-fun d!74521 () Bool)

(declare-fun e!265518 () Bool)

(assert (=> d!74521 e!265518))

(declare-fun res!270160 () Bool)

(assert (=> d!74521 (=> res!270160 e!265518)))

(declare-fun lt!205897 () Bool)

(assert (=> d!74521 (= res!270160 (not lt!205897))))

(declare-fun lt!205898 () Bool)

(assert (=> d!74521 (= lt!205897 lt!205898)))

(declare-fun lt!205896 () Unit!13248)

(declare-fun e!265517 () Unit!13248)

(assert (=> d!74521 (= lt!205896 e!265517)))

(declare-fun c!56297 () Bool)

(assert (=> d!74521 (= c!56297 lt!205898)))

(assert (=> d!74521 (= lt!205898 (containsKey!347 (toList!3500 lt!205655) (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74521 (= (contains!2498 lt!205655 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205897)))

(declare-fun b!453608 () Bool)

(declare-fun lt!205899 () Unit!13248)

(assert (=> b!453608 (= e!265517 lt!205899)))

(assert (=> b!453608 (= lt!205899 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205655) (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453608 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453609 () Bool)

(declare-fun Unit!13264 () Unit!13248)

(assert (=> b!453609 (= e!265517 Unit!13264)))

(declare-fun b!453610 () Bool)

(assert (=> b!453610 (= e!265518 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74521 c!56297) b!453608))

(assert (= (and d!74521 (not c!56297)) b!453609))

(assert (= (and d!74521 (not res!270160)) b!453610))

(assert (=> d!74521 m!437017))

(declare-fun m!437783 () Bool)

(assert (=> d!74521 m!437783))

(assert (=> b!453608 m!437017))

(declare-fun m!437785 () Bool)

(assert (=> b!453608 m!437785))

(assert (=> b!453608 m!437017))

(declare-fun m!437787 () Bool)

(assert (=> b!453608 m!437787))

(assert (=> b!453608 m!437787))

(declare-fun m!437789 () Bool)

(assert (=> b!453608 m!437789))

(assert (=> b!453610 m!437017))

(assert (=> b!453610 m!437787))

(assert (=> b!453610 m!437787))

(assert (=> b!453610 m!437789))

(assert (=> b!453194 d!74521))

(assert (=> b!453264 d!74475))

(declare-fun d!74523 () Bool)

(assert (=> d!74523 (= (get!6654 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863) lt!205588) (v!8374 (select (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) from!863)))))

(assert (=> b!453268 d!74523))

(assert (=> b!453220 d!74463))

(declare-fun d!74525 () Bool)

(assert (=> d!74525 (= (apply!313 lt!205685 (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (getValueByKey!370 (toList!3500 lt!205685) (select (arr!13489 (ite c!56153 _keys!709 lt!205595)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14410 () Bool)

(assert (= bs!14410 d!74525))

(assert (=> bs!14410 m!437105))

(assert (=> bs!14410 m!437645))

(assert (=> bs!14410 m!437645))

(declare-fun m!437791 () Bool)

(assert (=> bs!14410 m!437791))

(assert (=> b!453241 d!74525))

(assert (=> b!453241 d!74377))

(declare-fun b!453611 () Bool)

(declare-fun lt!205906 () Unit!13248)

(declare-fun lt!205904 () Unit!13248)

(assert (=> b!453611 (= lt!205906 lt!205904)))

(declare-fun lt!205903 () ListLongMap!6969)

(declare-fun lt!205905 () (_ BitVec 64))

(declare-fun lt!205902 () (_ BitVec 64))

(declare-fun lt!205901 () V!17293)

(assert (=> b!453611 (not (contains!2498 (+!1576 lt!205903 (tuple2!8057 lt!205902 lt!205901)) lt!205905))))

(assert (=> b!453611 (= lt!205904 (addStillNotContains!146 lt!205903 lt!205902 lt!205901 lt!205905))))

(assert (=> b!453611 (= lt!205905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453611 (= lt!205901 (get!6653 (select (arr!13490 (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453611 (= lt!205902 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30081 () ListLongMap!6969)

(assert (=> b!453611 (= lt!205903 call!30081)))

(declare-fun e!265519 () ListLongMap!6969)

(assert (=> b!453611 (= e!265519 (+!1576 call!30081 (tuple2!8057 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453612 () Bool)

(declare-fun e!265525 () ListLongMap!6969)

(assert (=> b!453612 (= e!265525 e!265519)))

(declare-fun c!56301 () Bool)

(assert (=> b!453612 (= c!56301 (validKeyInArray!0 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453613 () Bool)

(declare-fun e!265520 () Bool)

(declare-fun e!265522 () Bool)

(assert (=> b!453613 (= e!265520 e!265522)))

(declare-fun c!56298 () Bool)

(assert (=> b!453613 (= c!56298 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))))

(declare-fun b!453614 () Bool)

(declare-fun res!270163 () Bool)

(declare-fun e!265523 () Bool)

(assert (=> b!453614 (=> (not res!270163) (not e!265523))))

(declare-fun lt!205900 () ListLongMap!6969)

(assert (=> b!453614 (= res!270163 (not (contains!2498 lt!205900 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453615 () Bool)

(assert (=> b!453615 (= e!265522 (isEmpty!559 lt!205900))))

(declare-fun b!453616 () Bool)

(assert (=> b!453616 (= e!265519 call!30081)))

(declare-fun b!453617 () Bool)

(assert (=> b!453617 (= e!265523 e!265520)))

(declare-fun c!56299 () Bool)

(declare-fun e!265524 () Bool)

(assert (=> b!453617 (= c!56299 e!265524)))

(declare-fun res!270162 () Bool)

(assert (=> b!453617 (=> (not res!270162) (not e!265524))))

(assert (=> b!453617 (= res!270162 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))))

(declare-fun b!453618 () Bool)

(assert (=> b!453618 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))))

(assert (=> b!453618 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13842 (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)))))))

(declare-fun e!265521 () Bool)

(assert (=> b!453618 (= e!265521 (= (apply!313 lt!205900 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))) (get!6653 (select (arr!13490 (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453619 () Bool)

(assert (=> b!453619 (= e!265520 e!265521)))

(assert (=> b!453619 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))))

(declare-fun res!270161 () Bool)

(assert (=> b!453619 (= res!270161 (contains!2498 lt!205900 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453619 (=> (not res!270161) (not e!265521))))

(declare-fun bm!30078 () Bool)

(assert (=> bm!30078 (= call!30081 (getCurrentListMapNoExtraKeys!1683 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)) (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74527 () Bool)

(assert (=> d!74527 e!265523))

(declare-fun res!270164 () Bool)

(assert (=> d!74527 (=> (not res!270164) (not e!265523))))

(assert (=> d!74527 (= res!270164 (not (contains!2498 lt!205900 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74527 (= lt!205900 e!265525)))

(declare-fun c!56300 () Bool)

(assert (=> d!74527 (= c!56300 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13841 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)))))))

(assert (=> d!74527 (validMask!0 mask!1025)))

(assert (=> d!74527 (= (getCurrentListMapNoExtraKeys!1683 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)) (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205900)))

(declare-fun b!453620 () Bool)

(assert (=> b!453620 (= e!265525 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453621 () Bool)

(assert (=> b!453621 (= e!265524 (validKeyInArray!0 (select (arr!13489 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453621 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453622 () Bool)

(assert (=> b!453622 (= e!265522 (= lt!205900 (getCurrentListMapNoExtraKeys!1683 (array!28090 (store (arr!13489 _keys!709) i!563 k0!794) (size!13841 _keys!709)) (array!28092 (store (arr!13490 _values!549) i!563 (ValueCellFull!5727 v!412)) (size!13842 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74527 c!56300) b!453620))

(assert (= (and d!74527 (not c!56300)) b!453612))

(assert (= (and b!453612 c!56301) b!453611))

(assert (= (and b!453612 (not c!56301)) b!453616))

(assert (= (or b!453611 b!453616) bm!30078))

(assert (= (and d!74527 res!270164) b!453614))

(assert (= (and b!453614 res!270163) b!453617))

(assert (= (and b!453617 res!270162) b!453621))

(assert (= (and b!453617 c!56299) b!453619))

(assert (= (and b!453617 (not c!56299)) b!453613))

(assert (= (and b!453619 res!270161) b!453618))

(assert (= (and b!453613 c!56298) b!453622))

(assert (= (and b!453613 (not c!56298)) b!453615))

(declare-fun b_lambda!9647 () Bool)

(assert (=> (not b_lambda!9647) (not b!453611)))

(assert (=> b!453611 t!13938))

(declare-fun b_and!18941 () Bool)

(assert (= b_and!18939 (and (=> t!13938 result!7103) b_and!18941)))

(declare-fun b_lambda!9649 () Bool)

(assert (=> (not b_lambda!9649) (not b!453618)))

(assert (=> b!453618 t!13938))

(declare-fun b_and!18943 () Bool)

(assert (= b_and!18941 (and (=> t!13938 result!7103) b_and!18943)))

(declare-fun m!437793 () Bool)

(assert (=> bm!30078 m!437793))

(declare-fun m!437795 () Bool)

(assert (=> b!453614 m!437795))

(assert (=> b!453622 m!437793))

(declare-fun m!437797 () Bool)

(assert (=> d!74527 m!437797))

(assert (=> d!74527 m!436891))

(declare-fun m!437799 () Bool)

(assert (=> b!453612 m!437799))

(assert (=> b!453612 m!437799))

(declare-fun m!437801 () Bool)

(assert (=> b!453612 m!437801))

(assert (=> b!453619 m!437799))

(assert (=> b!453619 m!437799))

(declare-fun m!437803 () Bool)

(assert (=> b!453619 m!437803))

(declare-fun m!437805 () Bool)

(assert (=> b!453615 m!437805))

(declare-fun m!437807 () Bool)

(assert (=> b!453611 m!437807))

(declare-fun m!437809 () Bool)

(assert (=> b!453611 m!437809))

(declare-fun m!437811 () Bool)

(assert (=> b!453611 m!437811))

(assert (=> b!453611 m!437807))

(declare-fun m!437813 () Bool)

(assert (=> b!453611 m!437813))

(assert (=> b!453611 m!437811))

(assert (=> b!453611 m!436867))

(declare-fun m!437815 () Bool)

(assert (=> b!453611 m!437815))

(assert (=> b!453611 m!436867))

(assert (=> b!453611 m!437799))

(declare-fun m!437817 () Bool)

(assert (=> b!453611 m!437817))

(assert (=> b!453621 m!437799))

(assert (=> b!453621 m!437799))

(assert (=> b!453621 m!437801))

(assert (=> b!453618 m!437799))

(assert (=> b!453618 m!437811))

(assert (=> b!453618 m!437811))

(assert (=> b!453618 m!436867))

(assert (=> b!453618 m!437815))

(assert (=> b!453618 m!437799))

(declare-fun m!437819 () Bool)

(assert (=> b!453618 m!437819))

(assert (=> b!453618 m!436867))

(assert (=> bm!30045 d!74527))

(declare-fun d!74529 () Bool)

(declare-fun e!265527 () Bool)

(assert (=> d!74529 e!265527))

(declare-fun res!270165 () Bool)

(assert (=> d!74529 (=> res!270165 e!265527)))

(declare-fun lt!205908 () Bool)

(assert (=> d!74529 (= res!270165 (not lt!205908))))

(declare-fun lt!205909 () Bool)

(assert (=> d!74529 (= lt!205908 lt!205909)))

(declare-fun lt!205907 () Unit!13248)

(declare-fun e!265526 () Unit!13248)

(assert (=> d!74529 (= lt!205907 e!265526)))

(declare-fun c!56302 () Bool)

(assert (=> d!74529 (= c!56302 lt!205909)))

(assert (=> d!74529 (= lt!205909 (containsKey!347 (toList!3500 lt!205685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74529 (= (contains!2498 lt!205685 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205908)))

(declare-fun b!453623 () Bool)

(declare-fun lt!205910 () Unit!13248)

(assert (=> b!453623 (= e!265526 lt!205910)))

(assert (=> b!453623 (= lt!205910 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453623 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453624 () Bool)

(declare-fun Unit!13265 () Unit!13248)

(assert (=> b!453624 (= e!265526 Unit!13265)))

(declare-fun b!453625 () Bool)

(assert (=> b!453625 (= e!265527 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74529 c!56302) b!453623))

(assert (= (and d!74529 (not c!56302)) b!453624))

(assert (= (and d!74529 (not res!270165)) b!453625))

(declare-fun m!437821 () Bool)

(assert (=> d!74529 m!437821))

(declare-fun m!437823 () Bool)

(assert (=> b!453623 m!437823))

(declare-fun m!437825 () Bool)

(assert (=> b!453623 m!437825))

(assert (=> b!453623 m!437825))

(declare-fun m!437827 () Bool)

(assert (=> b!453623 m!437827))

(assert (=> b!453625 m!437825))

(assert (=> b!453625 m!437825))

(assert (=> b!453625 m!437827))

(assert (=> b!453237 d!74529))

(declare-fun d!74531 () Bool)

(assert (=> d!74531 (= (validKeyInArray!0 (select (arr!13489 lt!205595) #b00000000000000000000000000000000)) (and (not (= (select (arr!13489 lt!205595) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13489 lt!205595) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453278 d!74531))

(declare-fun d!74533 () Bool)

(declare-fun lt!205911 () Bool)

(assert (=> d!74533 (= lt!205911 (select (content!203 (toList!3500 lt!205709)) lt!205594))))

(declare-fun e!265529 () Bool)

(assert (=> d!74533 (= lt!205911 e!265529)))

(declare-fun res!270166 () Bool)

(assert (=> d!74533 (=> (not res!270166) (not e!265529))))

(assert (=> d!74533 (= res!270166 ((_ is Cons!8109) (toList!3500 lt!205709)))))

(assert (=> d!74533 (= (contains!2499 (toList!3500 lt!205709) lt!205594) lt!205911)))

(declare-fun b!453626 () Bool)

(declare-fun e!265528 () Bool)

(assert (=> b!453626 (= e!265529 e!265528)))

(declare-fun res!270167 () Bool)

(assert (=> b!453626 (=> res!270167 e!265528)))

(assert (=> b!453626 (= res!270167 (= (h!8965 (toList!3500 lt!205709)) lt!205594))))

(declare-fun b!453627 () Bool)

(assert (=> b!453627 (= e!265528 (contains!2499 (t!13939 (toList!3500 lt!205709)) lt!205594))))

(assert (= (and d!74533 res!270166) b!453626))

(assert (= (and b!453626 (not res!270167)) b!453627))

(declare-fun m!437829 () Bool)

(assert (=> d!74533 m!437829))

(declare-fun m!437831 () Bool)

(assert (=> d!74533 m!437831))

(declare-fun m!437833 () Bool)

(assert (=> b!453627 m!437833))

(assert (=> b!453267 d!74533))

(declare-fun d!74535 () Bool)

(declare-fun e!265531 () Bool)

(assert (=> d!74535 e!265531))

(declare-fun res!270168 () Bool)

(assert (=> d!74535 (=> res!270168 e!265531)))

(declare-fun lt!205913 () Bool)

(assert (=> d!74535 (= res!270168 (not lt!205913))))

(declare-fun lt!205914 () Bool)

(assert (=> d!74535 (= lt!205913 lt!205914)))

(declare-fun lt!205912 () Unit!13248)

(declare-fun e!265530 () Unit!13248)

(assert (=> d!74535 (= lt!205912 e!265530)))

(declare-fun c!56303 () Bool)

(assert (=> d!74535 (= c!56303 lt!205914)))

(assert (=> d!74535 (= lt!205914 (containsKey!347 (toList!3500 lt!205678) (select (arr!13489 _keys!709) from!863)))))

(assert (=> d!74535 (= (contains!2498 lt!205678 (select (arr!13489 _keys!709) from!863)) lt!205913)))

(declare-fun b!453628 () Bool)

(declare-fun lt!205915 () Unit!13248)

(assert (=> b!453628 (= e!265530 lt!205915)))

(assert (=> b!453628 (= lt!205915 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205678) (select (arr!13489 _keys!709) from!863)))))

(assert (=> b!453628 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) (select (arr!13489 _keys!709) from!863)))))

(declare-fun b!453629 () Bool)

(declare-fun Unit!13266 () Unit!13248)

(assert (=> b!453629 (= e!265530 Unit!13266)))

(declare-fun b!453630 () Bool)

(assert (=> b!453630 (= e!265531 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) (select (arr!13489 _keys!709) from!863))))))

(assert (= (and d!74535 c!56303) b!453628))

(assert (= (and d!74535 (not c!56303)) b!453629))

(assert (= (and d!74535 (not res!270168)) b!453630))

(assert (=> d!74535 m!436893))

(declare-fun m!437835 () Bool)

(assert (=> d!74535 m!437835))

(assert (=> b!453628 m!436893))

(declare-fun m!437837 () Bool)

(assert (=> b!453628 m!437837))

(assert (=> b!453628 m!436893))

(assert (=> b!453628 m!437469))

(assert (=> b!453628 m!437469))

(declare-fun m!437839 () Bool)

(assert (=> b!453628 m!437839))

(assert (=> b!453630 m!436893))

(assert (=> b!453630 m!437469))

(assert (=> b!453630 m!437469))

(assert (=> b!453630 m!437839))

(assert (=> b!453230 d!74535))

(declare-fun d!74537 () Bool)

(assert (=> d!74537 (arrayContainsKey!0 _keys!709 lt!205669 #b00000000000000000000000000000000)))

(declare-fun lt!205916 () Unit!13248)

(assert (=> d!74537 (= lt!205916 (choose!13 _keys!709 lt!205669 #b00000000000000000000000000000000))))

(assert (=> d!74537 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74537 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205669 #b00000000000000000000000000000000) lt!205916)))

(declare-fun bs!14411 () Bool)

(assert (= bs!14411 d!74537))

(assert (=> bs!14411 m!437047))

(declare-fun m!437841 () Bool)

(assert (=> bs!14411 m!437841))

(assert (=> b!453209 d!74537))

(declare-fun d!74539 () Bool)

(declare-fun res!270169 () Bool)

(declare-fun e!265532 () Bool)

(assert (=> d!74539 (=> res!270169 e!265532)))

(assert (=> d!74539 (= res!270169 (= (select (arr!13489 _keys!709) #b00000000000000000000000000000000) lt!205669))))

(assert (=> d!74539 (= (arrayContainsKey!0 _keys!709 lt!205669 #b00000000000000000000000000000000) e!265532)))

(declare-fun b!453631 () Bool)

(declare-fun e!265533 () Bool)

(assert (=> b!453631 (= e!265532 e!265533)))

(declare-fun res!270170 () Bool)

(assert (=> b!453631 (=> (not res!270170) (not e!265533))))

(assert (=> b!453631 (= res!270170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13841 _keys!709)))))

(declare-fun b!453632 () Bool)

(assert (=> b!453632 (= e!265533 (arrayContainsKey!0 _keys!709 lt!205669 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74539 (not res!270169)) b!453631))

(assert (= (and b!453631 res!270170) b!453632))

(assert (=> d!74539 m!437041))

(declare-fun m!437843 () Bool)

(assert (=> b!453632 m!437843))

(assert (=> b!453209 d!74539))

(declare-fun b!453633 () Bool)

(declare-fun e!265536 () SeekEntryResult!3532)

(declare-fun lt!205917 () SeekEntryResult!3532)

(assert (=> b!453633 (= e!265536 (Found!3532 (index!16309 lt!205917)))))

(declare-fun b!453634 () Bool)

(declare-fun e!265534 () SeekEntryResult!3532)

(assert (=> b!453634 (= e!265534 Undefined!3532)))

(declare-fun d!74541 () Bool)

(declare-fun lt!205919 () SeekEntryResult!3532)

(assert (=> d!74541 (and (or ((_ is Undefined!3532) lt!205919) (not ((_ is Found!3532) lt!205919)) (and (bvsge (index!16308 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16308 lt!205919) (size!13841 _keys!709)))) (or ((_ is Undefined!3532) lt!205919) ((_ is Found!3532) lt!205919) (not ((_ is MissingZero!3532) lt!205919)) (and (bvsge (index!16307 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16307 lt!205919) (size!13841 _keys!709)))) (or ((_ is Undefined!3532) lt!205919) ((_ is Found!3532) lt!205919) ((_ is MissingZero!3532) lt!205919) (not ((_ is MissingVacant!3532) lt!205919)) (and (bvsge (index!16310 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16310 lt!205919) (size!13841 _keys!709)))) (or ((_ is Undefined!3532) lt!205919) (ite ((_ is Found!3532) lt!205919) (= (select (arr!13489 _keys!709) (index!16308 lt!205919)) (select (arr!13489 _keys!709) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3532) lt!205919) (= (select (arr!13489 _keys!709) (index!16307 lt!205919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3532) lt!205919) (= (select (arr!13489 _keys!709) (index!16310 lt!205919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74541 (= lt!205919 e!265534)))

(declare-fun c!56304 () Bool)

(assert (=> d!74541 (= c!56304 (and ((_ is Intermediate!3532) lt!205917) (undefined!4344 lt!205917)))))

(assert (=> d!74541 (= lt!205917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) mask!1025) (select (arr!13489 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(assert (=> d!74541 (validMask!0 mask!1025)))

(assert (=> d!74541 (= (seekEntryOrOpen!0 (select (arr!13489 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) lt!205919)))

(declare-fun b!453635 () Bool)

(assert (=> b!453635 (= e!265534 e!265536)))

(declare-fun lt!205918 () (_ BitVec 64))

(assert (=> b!453635 (= lt!205918 (select (arr!13489 _keys!709) (index!16309 lt!205917)))))

(declare-fun c!56306 () Bool)

(assert (=> b!453635 (= c!56306 (= lt!205918 (select (arr!13489 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun e!265535 () SeekEntryResult!3532)

(declare-fun b!453636 () Bool)

(assert (=> b!453636 (= e!265535 (seekKeyOrZeroReturnVacant!0 (x!42461 lt!205917) (index!16309 lt!205917) (index!16309 lt!205917) (select (arr!13489 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(declare-fun b!453637 () Bool)

(declare-fun c!56305 () Bool)

(assert (=> b!453637 (= c!56305 (= lt!205918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453637 (= e!265536 e!265535)))

(declare-fun b!453638 () Bool)

(assert (=> b!453638 (= e!265535 (MissingZero!3532 (index!16309 lt!205917)))))

(assert (= (and d!74541 c!56304) b!453634))

(assert (= (and d!74541 (not c!56304)) b!453635))

(assert (= (and b!453635 c!56306) b!453633))

(assert (= (and b!453635 (not c!56306)) b!453637))

(assert (= (and b!453637 c!56305) b!453638))

(assert (= (and b!453637 (not c!56305)) b!453636))

(assert (=> d!74541 m!437041))

(declare-fun m!437845 () Bool)

(assert (=> d!74541 m!437845))

(declare-fun m!437847 () Bool)

(assert (=> d!74541 m!437847))

(assert (=> d!74541 m!436891))

(assert (=> d!74541 m!437845))

(assert (=> d!74541 m!437041))

(declare-fun m!437849 () Bool)

(assert (=> d!74541 m!437849))

(declare-fun m!437851 () Bool)

(assert (=> d!74541 m!437851))

(declare-fun m!437853 () Bool)

(assert (=> d!74541 m!437853))

(declare-fun m!437855 () Bool)

(assert (=> b!453635 m!437855))

(assert (=> b!453636 m!437041))

(declare-fun m!437857 () Bool)

(assert (=> b!453636 m!437857))

(assert (=> b!453209 d!74541))

(assert (=> b!453244 d!74515))

(assert (=> b!453187 d!74385))

(declare-fun b!453639 () Bool)

(declare-fun lt!205926 () Unit!13248)

(declare-fun lt!205924 () Unit!13248)

(assert (=> b!453639 (= lt!205926 lt!205924)))

(declare-fun lt!205925 () (_ BitVec 64))

(declare-fun lt!205921 () V!17293)

(declare-fun lt!205923 () ListLongMap!6969)

(declare-fun lt!205922 () (_ BitVec 64))

(assert (=> b!453639 (not (contains!2498 (+!1576 lt!205923 (tuple2!8057 lt!205922 lt!205921)) lt!205925))))

(assert (=> b!453639 (= lt!205924 (addStillNotContains!146 lt!205923 lt!205922 lt!205921 lt!205925))))

(assert (=> b!453639 (= lt!205925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453639 (= lt!205921 (get!6653 (select (arr!13490 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453639 (= lt!205922 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30082 () ListLongMap!6969)

(assert (=> b!453639 (= lt!205923 call!30082)))

(declare-fun e!265537 () ListLongMap!6969)

(assert (=> b!453639 (= e!265537 (+!1576 call!30082 (tuple2!8057 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453640 () Bool)

(declare-fun e!265543 () ListLongMap!6969)

(assert (=> b!453640 (= e!265543 e!265537)))

(declare-fun c!56310 () Bool)

(assert (=> b!453640 (= c!56310 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453641 () Bool)

(declare-fun e!265538 () Bool)

(declare-fun e!265540 () Bool)

(assert (=> b!453641 (= e!265538 e!265540)))

(declare-fun c!56307 () Bool)

(assert (=> b!453641 (= c!56307 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(declare-fun b!453642 () Bool)

(declare-fun res!270173 () Bool)

(declare-fun e!265541 () Bool)

(assert (=> b!453642 (=> (not res!270173) (not e!265541))))

(declare-fun lt!205920 () ListLongMap!6969)

(assert (=> b!453642 (= res!270173 (not (contains!2498 lt!205920 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453643 () Bool)

(assert (=> b!453643 (= e!265540 (isEmpty!559 lt!205920))))

(declare-fun b!453644 () Bool)

(assert (=> b!453644 (= e!265537 call!30082)))

(declare-fun b!453645 () Bool)

(assert (=> b!453645 (= e!265541 e!265538)))

(declare-fun c!56308 () Bool)

(declare-fun e!265542 () Bool)

(assert (=> b!453645 (= c!56308 e!265542)))

(declare-fun res!270172 () Bool)

(assert (=> b!453645 (=> (not res!270172) (not e!265542))))

(assert (=> b!453645 (= res!270172 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(declare-fun b!453646 () Bool)

(assert (=> b!453646 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(assert (=> b!453646 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13842 _values!549)))))

(declare-fun e!265539 () Bool)

(assert (=> b!453646 (= e!265539 (= (apply!313 lt!205920 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6653 (select (arr!13490 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453647 () Bool)

(assert (=> b!453647 (= e!265538 e!265539)))

(assert (=> b!453647 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(declare-fun res!270171 () Bool)

(assert (=> b!453647 (= res!270171 (contains!2498 lt!205920 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453647 (=> (not res!270171) (not e!265539))))

(declare-fun bm!30079 () Bool)

(assert (=> bm!30079 (= call!30082 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun d!74543 () Bool)

(assert (=> d!74543 e!265541))

(declare-fun res!270174 () Bool)

(assert (=> d!74543 (=> (not res!270174) (not e!265541))))

(assert (=> d!74543 (= res!270174 (not (contains!2498 lt!205920 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74543 (= lt!205920 e!265543)))

(declare-fun c!56309 () Bool)

(assert (=> d!74543 (= c!56309 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13841 _keys!709)))))

(assert (=> d!74543 (validMask!0 mask!1025)))

(assert (=> d!74543 (= (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205920)))

(declare-fun b!453648 () Bool)

(assert (=> b!453648 (= e!265543 (ListLongMap!6970 Nil!8110))))

(declare-fun b!453649 () Bool)

(assert (=> b!453649 (= e!265542 (validKeyInArray!0 (select (arr!13489 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453649 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453650 () Bool)

(assert (=> b!453650 (= e!265540 (= lt!205920 (getCurrentListMapNoExtraKeys!1683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74543 c!56309) b!453648))

(assert (= (and d!74543 (not c!56309)) b!453640))

(assert (= (and b!453640 c!56310) b!453639))

(assert (= (and b!453640 (not c!56310)) b!453644))

(assert (= (or b!453639 b!453644) bm!30079))

(assert (= (and d!74543 res!270174) b!453642))

(assert (= (and b!453642 res!270173) b!453645))

(assert (= (and b!453645 res!270172) b!453649))

(assert (= (and b!453645 c!56308) b!453647))

(assert (= (and b!453645 (not c!56308)) b!453641))

(assert (= (and b!453647 res!270171) b!453646))

(assert (= (and b!453641 c!56307) b!453650))

(assert (= (and b!453641 (not c!56307)) b!453643))

(declare-fun b_lambda!9651 () Bool)

(assert (=> (not b_lambda!9651) (not b!453639)))

(assert (=> b!453639 t!13938))

(declare-fun b_and!18945 () Bool)

(assert (= b_and!18943 (and (=> t!13938 result!7103) b_and!18945)))

(declare-fun b_lambda!9653 () Bool)

(assert (=> (not b_lambda!9653) (not b!453646)))

(assert (=> b!453646 t!13938))

(declare-fun b_and!18947 () Bool)

(assert (= b_and!18945 (and (=> t!13938 result!7103) b_and!18947)))

(declare-fun m!437859 () Bool)

(assert (=> bm!30079 m!437859))

(declare-fun m!437861 () Bool)

(assert (=> b!453642 m!437861))

(assert (=> b!453650 m!437859))

(declare-fun m!437863 () Bool)

(assert (=> d!74543 m!437863))

(assert (=> d!74543 m!436891))

(declare-fun m!437865 () Bool)

(assert (=> b!453640 m!437865))

(assert (=> b!453640 m!437865))

(declare-fun m!437867 () Bool)

(assert (=> b!453640 m!437867))

(assert (=> b!453647 m!437865))

(assert (=> b!453647 m!437865))

(declare-fun m!437869 () Bool)

(assert (=> b!453647 m!437869))

(declare-fun m!437871 () Bool)

(assert (=> b!453643 m!437871))

(declare-fun m!437873 () Bool)

(assert (=> b!453639 m!437873))

(declare-fun m!437875 () Bool)

(assert (=> b!453639 m!437875))

(declare-fun m!437877 () Bool)

(assert (=> b!453639 m!437877))

(assert (=> b!453639 m!437873))

(declare-fun m!437879 () Bool)

(assert (=> b!453639 m!437879))

(assert (=> b!453639 m!437877))

(assert (=> b!453639 m!436867))

(declare-fun m!437881 () Bool)

(assert (=> b!453639 m!437881))

(assert (=> b!453639 m!436867))

(assert (=> b!453639 m!437865))

(declare-fun m!437883 () Bool)

(assert (=> b!453639 m!437883))

(assert (=> b!453649 m!437865))

(assert (=> b!453649 m!437865))

(assert (=> b!453649 m!437867))

(assert (=> b!453646 m!437865))

(assert (=> b!453646 m!437877))

(assert (=> b!453646 m!437877))

(assert (=> b!453646 m!436867))

(assert (=> b!453646 m!437881))

(assert (=> b!453646 m!437865))

(declare-fun m!437885 () Bool)

(assert (=> b!453646 m!437885))

(assert (=> b!453646 m!436867))

(assert (=> bm!30046 d!74543))

(assert (=> b!453290 d!74425))

(declare-fun d!74545 () Bool)

(assert (=> d!74545 (= (isEmpty!559 lt!205699) (isEmpty!560 (toList!3500 lt!205699)))))

(declare-fun bs!14412 () Bool)

(assert (= bs!14412 d!74545))

(declare-fun m!437887 () Bool)

(assert (=> bs!14412 m!437887))

(assert (=> b!453258 d!74545))

(declare-fun d!74547 () Bool)

(declare-fun e!265545 () Bool)

(assert (=> d!74547 e!265545))

(declare-fun res!270175 () Bool)

(assert (=> d!74547 (=> res!270175 e!265545)))

(declare-fun lt!205928 () Bool)

(assert (=> d!74547 (= res!270175 (not lt!205928))))

(declare-fun lt!205929 () Bool)

(assert (=> d!74547 (= lt!205928 lt!205929)))

(declare-fun lt!205927 () Unit!13248)

(declare-fun e!265544 () Unit!13248)

(assert (=> d!74547 (= lt!205927 e!265544)))

(declare-fun c!56311 () Bool)

(assert (=> d!74547 (= c!56311 lt!205929)))

(assert (=> d!74547 (= lt!205929 (containsKey!347 (toList!3500 lt!205695) (_1!4039 lt!205594)))))

(assert (=> d!74547 (= (contains!2498 lt!205695 (_1!4039 lt!205594)) lt!205928)))

(declare-fun b!453651 () Bool)

(declare-fun lt!205930 () Unit!13248)

(assert (=> b!453651 (= e!265544 lt!205930)))

(assert (=> b!453651 (= lt!205930 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205695) (_1!4039 lt!205594)))))

(assert (=> b!453651 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205695) (_1!4039 lt!205594)))))

(declare-fun b!453652 () Bool)

(declare-fun Unit!13267 () Unit!13248)

(assert (=> b!453652 (= e!265544 Unit!13267)))

(declare-fun b!453653 () Bool)

(assert (=> b!453653 (= e!265545 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205695) (_1!4039 lt!205594))))))

(assert (= (and d!74547 c!56311) b!453651))

(assert (= (and d!74547 (not c!56311)) b!453652))

(assert (= (and d!74547 (not res!270175)) b!453653))

(declare-fun m!437889 () Bool)

(assert (=> d!74547 m!437889))

(declare-fun m!437891 () Bool)

(assert (=> b!453651 m!437891))

(assert (=> b!453651 m!437139))

(assert (=> b!453651 m!437139))

(declare-fun m!437893 () Bool)

(assert (=> b!453651 m!437893))

(assert (=> b!453653 m!437139))

(assert (=> b!453653 m!437139))

(assert (=> b!453653 m!437893))

(assert (=> d!74343 d!74547))

(declare-fun b!453655 () Bool)

(declare-fun e!265546 () Option!376)

(declare-fun e!265547 () Option!376)

(assert (=> b!453655 (= e!265546 e!265547)))

(declare-fun c!56313 () Bool)

(assert (=> b!453655 (= c!56313 (and ((_ is Cons!8109) lt!205693) (not (= (_1!4039 (h!8965 lt!205693)) (_1!4039 lt!205594)))))))

(declare-fun b!453654 () Bool)

(assert (=> b!453654 (= e!265546 (Some!375 (_2!4039 (h!8965 lt!205693))))))

(declare-fun d!74549 () Bool)

(declare-fun c!56312 () Bool)

(assert (=> d!74549 (= c!56312 (and ((_ is Cons!8109) lt!205693) (= (_1!4039 (h!8965 lt!205693)) (_1!4039 lt!205594))))))

(assert (=> d!74549 (= (getValueByKey!370 lt!205693 (_1!4039 lt!205594)) e!265546)))

(declare-fun b!453657 () Bool)

(assert (=> b!453657 (= e!265547 None!374)))

(declare-fun b!453656 () Bool)

(assert (=> b!453656 (= e!265547 (getValueByKey!370 (t!13939 lt!205693) (_1!4039 lt!205594)))))

(assert (= (and d!74549 c!56312) b!453654))

(assert (= (and d!74549 (not c!56312)) b!453655))

(assert (= (and b!453655 c!56313) b!453656))

(assert (= (and b!453655 (not c!56313)) b!453657))

(declare-fun m!437895 () Bool)

(assert (=> b!453656 m!437895))

(assert (=> d!74343 d!74549))

(declare-fun d!74551 () Bool)

(assert (=> d!74551 (= (getValueByKey!370 lt!205693 (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594)))))

(declare-fun lt!205931 () Unit!13248)

(assert (=> d!74551 (= lt!205931 (choose!1330 lt!205693 (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(declare-fun e!265548 () Bool)

(assert (=> d!74551 e!265548))

(declare-fun res!270176 () Bool)

(assert (=> d!74551 (=> (not res!270176) (not e!265548))))

(assert (=> d!74551 (= res!270176 (isStrictlySorted!378 lt!205693))))

(assert (=> d!74551 (= (lemmaContainsTupThenGetReturnValue!192 lt!205693 (_1!4039 lt!205594) (_2!4039 lt!205594)) lt!205931)))

(declare-fun b!453658 () Bool)

(declare-fun res!270177 () Bool)

(assert (=> b!453658 (=> (not res!270177) (not e!265548))))

(assert (=> b!453658 (= res!270177 (containsKey!347 lt!205693 (_1!4039 lt!205594)))))

(declare-fun b!453659 () Bool)

(assert (=> b!453659 (= e!265548 (contains!2499 lt!205693 (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594))))))

(assert (= (and d!74551 res!270176) b!453658))

(assert (= (and b!453658 res!270177) b!453659))

(assert (=> d!74551 m!437133))

(declare-fun m!437897 () Bool)

(assert (=> d!74551 m!437897))

(declare-fun m!437899 () Bool)

(assert (=> d!74551 m!437899))

(declare-fun m!437901 () Bool)

(assert (=> b!453658 m!437901))

(declare-fun m!437903 () Bool)

(assert (=> b!453659 m!437903))

(assert (=> d!74343 d!74551))

(declare-fun b!453660 () Bool)

(declare-fun c!56314 () Bool)

(declare-fun c!56315 () Bool)

(declare-fun e!265550 () List!8113)

(assert (=> b!453660 (= e!265550 (ite c!56314 (t!13939 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (ite c!56315 (Cons!8109 (h!8965 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (t!13939 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))))) Nil!8110)))))

(declare-fun b!453661 () Bool)

(declare-fun e!265552 () List!8113)

(declare-fun e!265551 () List!8113)

(assert (=> b!453661 (= e!265552 e!265551)))

(assert (=> b!453661 (= c!56314 (and ((_ is Cons!8109) (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (= (_1!4039 (h!8965 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))))) (_1!4039 lt!205594))))))

(declare-fun b!453662 () Bool)

(declare-fun e!265549 () List!8113)

(declare-fun call!30083 () List!8113)

(assert (=> b!453662 (= e!265549 call!30083)))

(declare-fun d!74553 () Bool)

(declare-fun e!265553 () Bool)

(assert (=> d!74553 e!265553))

(declare-fun res!270178 () Bool)

(assert (=> d!74553 (=> (not res!270178) (not e!265553))))

(declare-fun lt!205932 () List!8113)

(assert (=> d!74553 (= res!270178 (isStrictlySorted!378 lt!205932))))

(assert (=> d!74553 (= lt!205932 e!265552)))

(declare-fun c!56316 () Bool)

(assert (=> d!74553 (= c!56316 (and ((_ is Cons!8109) (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (bvslt (_1!4039 (h!8965 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))))) (_1!4039 lt!205594))))))

(assert (=> d!74553 (isStrictlySorted!378 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))))))

(assert (=> d!74553 (= (insertStrictlySorted!195 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))) (_1!4039 lt!205594) (_2!4039 lt!205594)) lt!205932)))

(declare-fun b!453663 () Bool)

(declare-fun call!30084 () List!8113)

(assert (=> b!453663 (= e!265551 call!30084)))

(declare-fun b!453664 () Bool)

(declare-fun res!270179 () Bool)

(assert (=> b!453664 (=> (not res!270179) (not e!265553))))

(assert (=> b!453664 (= res!270179 (containsKey!347 lt!205932 (_1!4039 lt!205594)))))

(declare-fun b!453665 () Bool)

(assert (=> b!453665 (= e!265550 (insertStrictlySorted!195 (t!13939 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(declare-fun b!453666 () Bool)

(assert (=> b!453666 (= e!265549 call!30083)))

(declare-fun b!453667 () Bool)

(declare-fun call!30085 () List!8113)

(assert (=> b!453667 (= e!265552 call!30085)))

(declare-fun b!453668 () Bool)

(assert (=> b!453668 (= e!265553 (contains!2499 lt!205932 (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594))))))

(declare-fun bm!30080 () Bool)

(assert (=> bm!30080 (= call!30084 call!30085)))

(declare-fun bm!30081 () Bool)

(assert (=> bm!30081 (= call!30085 ($colon$colon!109 e!265550 (ite c!56316 (h!8965 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594)))))))

(declare-fun c!56317 () Bool)

(assert (=> bm!30081 (= c!56317 c!56316)))

(declare-fun bm!30082 () Bool)

(assert (=> bm!30082 (= call!30083 call!30084)))

(declare-fun b!453669 () Bool)

(assert (=> b!453669 (= c!56315 (and ((_ is Cons!8109) (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)))) (bvsgt (_1!4039 (h!8965 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))))) (_1!4039 lt!205594))))))

(assert (=> b!453669 (= e!265551 e!265549)))

(assert (= (and d!74553 c!56316) b!453667))

(assert (= (and d!74553 (not c!56316)) b!453661))

(assert (= (and b!453661 c!56314) b!453663))

(assert (= (and b!453661 (not c!56314)) b!453669))

(assert (= (and b!453669 c!56315) b!453662))

(assert (= (and b!453669 (not c!56315)) b!453666))

(assert (= (or b!453662 b!453666) bm!30082))

(assert (= (or b!453663 bm!30082) bm!30080))

(assert (= (or b!453667 bm!30080) bm!30081))

(assert (= (and bm!30081 c!56317) b!453665))

(assert (= (and bm!30081 (not c!56317)) b!453660))

(assert (= (and d!74553 res!270178) b!453664))

(assert (= (and b!453664 res!270179) b!453668))

(declare-fun m!437905 () Bool)

(assert (=> bm!30081 m!437905))

(declare-fun m!437907 () Bool)

(assert (=> b!453665 m!437907))

(declare-fun m!437909 () Bool)

(assert (=> b!453664 m!437909))

(declare-fun m!437911 () Bool)

(assert (=> b!453668 m!437911))

(declare-fun m!437913 () Bool)

(assert (=> d!74553 m!437913))

(declare-fun m!437915 () Bool)

(assert (=> d!74553 m!437915))

(assert (=> d!74343 d!74553))

(assert (=> b!453233 d!74429))

(declare-fun d!74555 () Bool)

(declare-fun e!265555 () Bool)

(assert (=> d!74555 e!265555))

(declare-fun res!270180 () Bool)

(assert (=> d!74555 (=> res!270180 e!265555)))

(declare-fun lt!205934 () Bool)

(assert (=> d!74555 (= res!270180 (not lt!205934))))

(declare-fun lt!205935 () Bool)

(assert (=> d!74555 (= lt!205934 lt!205935)))

(declare-fun lt!205933 () Unit!13248)

(declare-fun e!265554 () Unit!13248)

(assert (=> d!74555 (= lt!205933 e!265554)))

(declare-fun c!56318 () Bool)

(assert (=> d!74555 (= c!56318 lt!205935)))

(assert (=> d!74555 (= lt!205935 (containsKey!347 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> d!74555 (= (contains!2498 lt!205640 (_1!4039 (tuple2!8057 k0!794 v!412))) lt!205934)))

(declare-fun b!453670 () Bool)

(declare-fun lt!205936 () Unit!13248)

(assert (=> b!453670 (= e!265554 lt!205936)))

(assert (=> b!453670 (= lt!205936 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (=> b!453670 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453671 () Bool)

(declare-fun Unit!13268 () Unit!13248)

(assert (=> b!453671 (= e!265554 Unit!13268)))

(declare-fun b!453672 () Bool)

(assert (=> b!453672 (= e!265555 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205640) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (= (and d!74555 c!56318) b!453670))

(assert (= (and d!74555 (not c!56318)) b!453671))

(assert (= (and d!74555 (not res!270180)) b!453672))

(declare-fun m!437917 () Bool)

(assert (=> d!74555 m!437917))

(declare-fun m!437919 () Bool)

(assert (=> b!453670 m!437919))

(assert (=> b!453670 m!437007))

(assert (=> b!453670 m!437007))

(declare-fun m!437921 () Bool)

(assert (=> b!453670 m!437921))

(assert (=> b!453672 m!437007))

(assert (=> b!453672 m!437007))

(assert (=> b!453672 m!437921))

(assert (=> d!74325 d!74555))

(declare-fun b!453674 () Bool)

(declare-fun e!265556 () Option!376)

(declare-fun e!265557 () Option!376)

(assert (=> b!453674 (= e!265556 e!265557)))

(declare-fun c!56320 () Bool)

(assert (=> b!453674 (= c!56320 (and ((_ is Cons!8109) lt!205638) (not (= (_1!4039 (h!8965 lt!205638)) (_1!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun b!453673 () Bool)

(assert (=> b!453673 (= e!265556 (Some!375 (_2!4039 (h!8965 lt!205638))))))

(declare-fun c!56319 () Bool)

(declare-fun d!74557 () Bool)

(assert (=> d!74557 (= c!56319 (and ((_ is Cons!8109) lt!205638) (= (_1!4039 (h!8965 lt!205638)) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74557 (= (getValueByKey!370 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412))) e!265556)))

(declare-fun b!453676 () Bool)

(assert (=> b!453676 (= e!265557 None!374)))

(declare-fun b!453675 () Bool)

(assert (=> b!453675 (= e!265557 (getValueByKey!370 (t!13939 lt!205638) (_1!4039 (tuple2!8057 k0!794 v!412))))))

(assert (= (and d!74557 c!56319) b!453673))

(assert (= (and d!74557 (not c!56319)) b!453674))

(assert (= (and b!453674 c!56320) b!453675))

(assert (= (and b!453674 (not c!56320)) b!453676))

(declare-fun m!437923 () Bool)

(assert (=> b!453675 m!437923))

(assert (=> d!74325 d!74557))

(declare-fun d!74559 () Bool)

(assert (=> d!74559 (= (getValueByKey!370 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412))) (Some!375 (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun lt!205937 () Unit!13248)

(assert (=> d!74559 (= lt!205937 (choose!1330 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun e!265558 () Bool)

(assert (=> d!74559 e!265558))

(declare-fun res!270181 () Bool)

(assert (=> d!74559 (=> (not res!270181) (not e!265558))))

(assert (=> d!74559 (= res!270181 (isStrictlySorted!378 lt!205638))))

(assert (=> d!74559 (= (lemmaContainsTupThenGetReturnValue!192 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))) lt!205937)))

(declare-fun b!453677 () Bool)

(declare-fun res!270182 () Bool)

(assert (=> b!453677 (=> (not res!270182) (not e!265558))))

(assert (=> b!453677 (= res!270182 (containsKey!347 lt!205638 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453678 () Bool)

(assert (=> b!453678 (= e!265558 (contains!2499 lt!205638 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (= (and d!74559 res!270181) b!453677))

(assert (= (and b!453677 res!270182) b!453678))

(assert (=> d!74559 m!437001))

(declare-fun m!437925 () Bool)

(assert (=> d!74559 m!437925))

(declare-fun m!437927 () Bool)

(assert (=> d!74559 m!437927))

(declare-fun m!437929 () Bool)

(assert (=> b!453677 m!437929))

(declare-fun m!437931 () Bool)

(assert (=> b!453678 m!437931))

(assert (=> d!74325 d!74559))

(declare-fun b!453679 () Bool)

(declare-fun c!56321 () Bool)

(declare-fun e!265560 () List!8113)

(declare-fun c!56322 () Bool)

(assert (=> b!453679 (= e!265560 (ite c!56321 (t!13939 (toList!3500 call!30022)) (ite c!56322 (Cons!8109 (h!8965 (toList!3500 call!30022)) (t!13939 (toList!3500 call!30022))) Nil!8110)))))

(declare-fun b!453680 () Bool)

(declare-fun e!265562 () List!8113)

(declare-fun e!265561 () List!8113)

(assert (=> b!453680 (= e!265562 e!265561)))

(assert (=> b!453680 (= c!56321 (and ((_ is Cons!8109) (toList!3500 call!30022)) (= (_1!4039 (h!8965 (toList!3500 call!30022))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun b!453681 () Bool)

(declare-fun e!265559 () List!8113)

(declare-fun call!30086 () List!8113)

(assert (=> b!453681 (= e!265559 call!30086)))

(declare-fun d!74561 () Bool)

(declare-fun e!265563 () Bool)

(assert (=> d!74561 e!265563))

(declare-fun res!270183 () Bool)

(assert (=> d!74561 (=> (not res!270183) (not e!265563))))

(declare-fun lt!205938 () List!8113)

(assert (=> d!74561 (= res!270183 (isStrictlySorted!378 lt!205938))))

(assert (=> d!74561 (= lt!205938 e!265562)))

(declare-fun c!56323 () Bool)

(assert (=> d!74561 (= c!56323 (and ((_ is Cons!8109) (toList!3500 call!30022)) (bvslt (_1!4039 (h!8965 (toList!3500 call!30022))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> d!74561 (isStrictlySorted!378 (toList!3500 call!30022))))

(assert (=> d!74561 (= (insertStrictlySorted!195 (toList!3500 call!30022) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))) lt!205938)))

(declare-fun b!453682 () Bool)

(declare-fun call!30087 () List!8113)

(assert (=> b!453682 (= e!265561 call!30087)))

(declare-fun b!453683 () Bool)

(declare-fun res!270184 () Bool)

(assert (=> b!453683 (=> (not res!270184) (not e!265563))))

(assert (=> b!453683 (= res!270184 (containsKey!347 lt!205938 (_1!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453684 () Bool)

(assert (=> b!453684 (= e!265560 (insertStrictlySorted!195 (t!13939 (toList!3500 call!30022)) (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))

(declare-fun b!453685 () Bool)

(assert (=> b!453685 (= e!265559 call!30086)))

(declare-fun b!453686 () Bool)

(declare-fun call!30088 () List!8113)

(assert (=> b!453686 (= e!265562 call!30088)))

(declare-fun b!453687 () Bool)

(assert (=> b!453687 (= e!265563 (contains!2499 lt!205938 (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412)))))))

(declare-fun bm!30083 () Bool)

(assert (=> bm!30083 (= call!30087 call!30088)))

(declare-fun bm!30084 () Bool)

(assert (=> bm!30084 (= call!30088 ($colon$colon!109 e!265560 (ite c!56323 (h!8965 (toList!3500 call!30022)) (tuple2!8057 (_1!4039 (tuple2!8057 k0!794 v!412)) (_2!4039 (tuple2!8057 k0!794 v!412))))))))

(declare-fun c!56324 () Bool)

(assert (=> bm!30084 (= c!56324 c!56323)))

(declare-fun bm!30085 () Bool)

(assert (=> bm!30085 (= call!30086 call!30087)))

(declare-fun b!453688 () Bool)

(assert (=> b!453688 (= c!56322 (and ((_ is Cons!8109) (toList!3500 call!30022)) (bvsgt (_1!4039 (h!8965 (toList!3500 call!30022))) (_1!4039 (tuple2!8057 k0!794 v!412)))))))

(assert (=> b!453688 (= e!265561 e!265559)))

(assert (= (and d!74561 c!56323) b!453686))

(assert (= (and d!74561 (not c!56323)) b!453680))

(assert (= (and b!453680 c!56321) b!453682))

(assert (= (and b!453680 (not c!56321)) b!453688))

(assert (= (and b!453688 c!56322) b!453681))

(assert (= (and b!453688 (not c!56322)) b!453685))

(assert (= (or b!453681 b!453685) bm!30085))

(assert (= (or b!453682 bm!30085) bm!30083))

(assert (= (or b!453686 bm!30083) bm!30084))

(assert (= (and bm!30084 c!56324) b!453684))

(assert (= (and bm!30084 (not c!56324)) b!453679))

(assert (= (and d!74561 res!270183) b!453683))

(assert (= (and b!453683 res!270184) b!453687))

(declare-fun m!437933 () Bool)

(assert (=> bm!30084 m!437933))

(declare-fun m!437935 () Bool)

(assert (=> b!453684 m!437935))

(declare-fun m!437937 () Bool)

(assert (=> b!453683 m!437937))

(declare-fun m!437939 () Bool)

(assert (=> b!453687 m!437939))

(declare-fun m!437941 () Bool)

(assert (=> d!74561 m!437941))

(declare-fun m!437943 () Bool)

(assert (=> d!74561 m!437943))

(assert (=> d!74325 d!74561))

(declare-fun d!74563 () Bool)

(declare-fun e!265565 () Bool)

(assert (=> d!74563 e!265565))

(declare-fun res!270185 () Bool)

(assert (=> d!74563 (=> res!270185 e!265565)))

(declare-fun lt!205940 () Bool)

(assert (=> d!74563 (= res!270185 (not lt!205940))))

(declare-fun lt!205941 () Bool)

(assert (=> d!74563 (= lt!205940 lt!205941)))

(declare-fun lt!205939 () Unit!13248)

(declare-fun e!265564 () Unit!13248)

(assert (=> d!74563 (= lt!205939 e!265564)))

(declare-fun c!56325 () Bool)

(assert (=> d!74563 (= c!56325 lt!205941)))

(assert (=> d!74563 (= lt!205941 (containsKey!347 (toList!3500 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700))) lt!205704))))

(assert (=> d!74563 (= (contains!2498 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700)) lt!205704) lt!205940)))

(declare-fun b!453689 () Bool)

(declare-fun lt!205942 () Unit!13248)

(assert (=> b!453689 (= e!265564 lt!205942)))

(assert (=> b!453689 (= lt!205942 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700))) lt!205704))))

(assert (=> b!453689 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700))) lt!205704))))

(declare-fun b!453690 () Bool)

(declare-fun Unit!13269 () Unit!13248)

(assert (=> b!453690 (= e!265564 Unit!13269)))

(declare-fun b!453691 () Bool)

(assert (=> b!453691 (= e!265565 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700))) lt!205704)))))

(assert (= (and d!74563 c!56325) b!453689))

(assert (= (and d!74563 (not c!56325)) b!453690))

(assert (= (and d!74563 (not res!270185)) b!453691))

(declare-fun m!437945 () Bool)

(assert (=> d!74563 m!437945))

(declare-fun m!437947 () Bool)

(assert (=> b!453689 m!437947))

(declare-fun m!437949 () Bool)

(assert (=> b!453689 m!437949))

(assert (=> b!453689 m!437949))

(declare-fun m!437951 () Bool)

(assert (=> b!453689 m!437951))

(assert (=> b!453691 m!437949))

(assert (=> b!453691 m!437949))

(assert (=> b!453691 m!437951))

(assert (=> b!453254 d!74563))

(declare-fun d!74565 () Bool)

(declare-fun e!265566 () Bool)

(assert (=> d!74565 e!265566))

(declare-fun res!270187 () Bool)

(assert (=> d!74565 (=> (not res!270187) (not e!265566))))

(declare-fun lt!205946 () ListLongMap!6969)

(assert (=> d!74565 (= res!270187 (contains!2498 lt!205946 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205944 () List!8113)

(assert (=> d!74565 (= lt!205946 (ListLongMap!6970 lt!205944))))

(declare-fun lt!205945 () Unit!13248)

(declare-fun lt!205943 () Unit!13248)

(assert (=> d!74565 (= lt!205945 lt!205943)))

(assert (=> d!74565 (= (getValueByKey!370 lt!205944 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74565 (= lt!205943 (lemmaContainsTupThenGetReturnValue!192 lt!205944 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74565 (= lt!205944 (insertStrictlySorted!195 (toList!3500 call!30042) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74565 (= (+!1576 call!30042 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205946)))

(declare-fun b!453692 () Bool)

(declare-fun res!270186 () Bool)

(assert (=> b!453692 (=> (not res!270186) (not e!265566))))

(assert (=> b!453692 (= res!270186 (= (getValueByKey!370 (toList!3500 lt!205946) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453693 () Bool)

(assert (=> b!453693 (= e!265566 (contains!2499 (toList!3500 lt!205946) (tuple2!8057 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)) (get!6653 (select (arr!13490 lt!205593) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74565 res!270187) b!453692))

(assert (= (and b!453692 res!270186) b!453693))

(declare-fun m!437953 () Bool)

(assert (=> d!74565 m!437953))

(declare-fun m!437955 () Bool)

(assert (=> d!74565 m!437955))

(declare-fun m!437957 () Bool)

(assert (=> d!74565 m!437957))

(declare-fun m!437959 () Bool)

(assert (=> d!74565 m!437959))

(declare-fun m!437961 () Bool)

(assert (=> b!453692 m!437961))

(declare-fun m!437963 () Bool)

(assert (=> b!453693 m!437963))

(assert (=> b!453254 d!74565))

(declare-fun d!74567 () Bool)

(assert (=> d!74567 (not (contains!2498 (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700)) lt!205704))))

(declare-fun lt!205947 () Unit!13248)

(assert (=> d!74567 (= lt!205947 (choose!1329 lt!205702 lt!205701 lt!205700 lt!205704))))

(declare-fun e!265567 () Bool)

(assert (=> d!74567 e!265567))

(declare-fun res!270188 () Bool)

(assert (=> d!74567 (=> (not res!270188) (not e!265567))))

(assert (=> d!74567 (= res!270188 (not (contains!2498 lt!205702 lt!205704)))))

(assert (=> d!74567 (= (addStillNotContains!146 lt!205702 lt!205701 lt!205700 lt!205704) lt!205947)))

(declare-fun b!453694 () Bool)

(assert (=> b!453694 (= e!265567 (not (= lt!205701 lt!205704)))))

(assert (= (and d!74567 res!270188) b!453694))

(assert (=> d!74567 m!437163))

(assert (=> d!74567 m!437163))

(assert (=> d!74567 m!437165))

(declare-fun m!437965 () Bool)

(assert (=> d!74567 m!437965))

(declare-fun m!437967 () Bool)

(assert (=> d!74567 m!437967))

(assert (=> b!453254 d!74567))

(declare-fun d!74569 () Bool)

(declare-fun e!265568 () Bool)

(assert (=> d!74569 e!265568))

(declare-fun res!270190 () Bool)

(assert (=> d!74569 (=> (not res!270190) (not e!265568))))

(declare-fun lt!205951 () ListLongMap!6969)

(assert (=> d!74569 (= res!270190 (contains!2498 lt!205951 (_1!4039 (tuple2!8057 lt!205701 lt!205700))))))

(declare-fun lt!205949 () List!8113)

(assert (=> d!74569 (= lt!205951 (ListLongMap!6970 lt!205949))))

(declare-fun lt!205950 () Unit!13248)

(declare-fun lt!205948 () Unit!13248)

(assert (=> d!74569 (= lt!205950 lt!205948)))

(assert (=> d!74569 (= (getValueByKey!370 lt!205949 (_1!4039 (tuple2!8057 lt!205701 lt!205700))) (Some!375 (_2!4039 (tuple2!8057 lt!205701 lt!205700))))))

(assert (=> d!74569 (= lt!205948 (lemmaContainsTupThenGetReturnValue!192 lt!205949 (_1!4039 (tuple2!8057 lt!205701 lt!205700)) (_2!4039 (tuple2!8057 lt!205701 lt!205700))))))

(assert (=> d!74569 (= lt!205949 (insertStrictlySorted!195 (toList!3500 lt!205702) (_1!4039 (tuple2!8057 lt!205701 lt!205700)) (_2!4039 (tuple2!8057 lt!205701 lt!205700))))))

(assert (=> d!74569 (= (+!1576 lt!205702 (tuple2!8057 lt!205701 lt!205700)) lt!205951)))

(declare-fun b!453695 () Bool)

(declare-fun res!270189 () Bool)

(assert (=> b!453695 (=> (not res!270189) (not e!265568))))

(assert (=> b!453695 (= res!270189 (= (getValueByKey!370 (toList!3500 lt!205951) (_1!4039 (tuple2!8057 lt!205701 lt!205700))) (Some!375 (_2!4039 (tuple2!8057 lt!205701 lt!205700)))))))

(declare-fun b!453696 () Bool)

(assert (=> b!453696 (= e!265568 (contains!2499 (toList!3500 lt!205951) (tuple2!8057 lt!205701 lt!205700)))))

(assert (= (and d!74569 res!270190) b!453695))

(assert (= (and b!453695 res!270189) b!453696))

(declare-fun m!437969 () Bool)

(assert (=> d!74569 m!437969))

(declare-fun m!437971 () Bool)

(assert (=> d!74569 m!437971))

(declare-fun m!437973 () Bool)

(assert (=> d!74569 m!437973))

(declare-fun m!437975 () Bool)

(assert (=> d!74569 m!437975))

(declare-fun m!437977 () Bool)

(assert (=> b!453695 m!437977))

(declare-fun m!437979 () Bool)

(assert (=> b!453696 m!437979))

(assert (=> b!453254 d!74569))

(assert (=> b!453254 d!74485))

(assert (=> bm!30038 d!74447))

(declare-fun d!74571 () Bool)

(declare-fun e!265569 () Bool)

(assert (=> d!74571 e!265569))

(declare-fun res!270192 () Bool)

(assert (=> d!74571 (=> (not res!270192) (not e!265569))))

(declare-fun lt!205955 () ListLongMap!6969)

(assert (=> d!74571 (= res!270192 (contains!2498 lt!205955 (_1!4039 (tuple2!8057 k0!794 lt!205589))))))

(declare-fun lt!205953 () List!8113)

(assert (=> d!74571 (= lt!205955 (ListLongMap!6970 lt!205953))))

(declare-fun lt!205954 () Unit!13248)

(declare-fun lt!205952 () Unit!13248)

(assert (=> d!74571 (= lt!205954 lt!205952)))

(assert (=> d!74571 (= (getValueByKey!370 lt!205953 (_1!4039 (tuple2!8057 k0!794 lt!205589))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74571 (= lt!205952 (lemmaContainsTupThenGetReturnValue!192 lt!205953 (_1!4039 (tuple2!8057 k0!794 lt!205589)) (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74571 (= lt!205953 (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 (tuple2!8057 k0!794 lt!205589)) (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74571 (= (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205589)) lt!205955)))

(declare-fun b!453697 () Bool)

(declare-fun res!270191 () Bool)

(assert (=> b!453697 (=> (not res!270191) (not e!265569))))

(assert (=> b!453697 (= res!270191 (= (getValueByKey!370 (toList!3500 lt!205955) (_1!4039 (tuple2!8057 k0!794 lt!205589))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205589)))))))

(declare-fun b!453698 () Bool)

(assert (=> b!453698 (= e!265569 (contains!2499 (toList!3500 lt!205955) (tuple2!8057 k0!794 lt!205589)))))

(assert (= (and d!74571 res!270192) b!453697))

(assert (= (and b!453697 res!270191) b!453698))

(declare-fun m!437981 () Bool)

(assert (=> d!74571 m!437981))

(declare-fun m!437983 () Bool)

(assert (=> d!74571 m!437983))

(declare-fun m!437985 () Bool)

(assert (=> d!74571 m!437985))

(declare-fun m!437987 () Bool)

(assert (=> d!74571 m!437987))

(declare-fun m!437989 () Bool)

(assert (=> b!453697 m!437989))

(declare-fun m!437991 () Bool)

(assert (=> b!453698 m!437991))

(assert (=> d!74345 d!74571))

(declare-fun d!74573 () Bool)

(declare-fun e!265570 () Bool)

(assert (=> d!74573 e!265570))

(declare-fun res!270194 () Bool)

(assert (=> d!74573 (=> (not res!270194) (not e!265570))))

(declare-fun lt!205959 () ListLongMap!6969)

(assert (=> d!74573 (= res!270194 (contains!2498 lt!205959 (_1!4039 (tuple2!8057 k0!794 lt!205589))))))

(declare-fun lt!205957 () List!8113)

(assert (=> d!74573 (= lt!205959 (ListLongMap!6970 lt!205957))))

(declare-fun lt!205958 () Unit!13248)

(declare-fun lt!205956 () Unit!13248)

(assert (=> d!74573 (= lt!205958 lt!205956)))

(assert (=> d!74573 (= (getValueByKey!370 lt!205957 (_1!4039 (tuple2!8057 k0!794 lt!205589))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74573 (= lt!205956 (lemmaContainsTupThenGetReturnValue!192 lt!205957 (_1!4039 (tuple2!8057 k0!794 lt!205589)) (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74573 (= lt!205957 (insertStrictlySorted!195 (toList!3500 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587))) (_1!4039 (tuple2!8057 k0!794 lt!205589)) (_2!4039 (tuple2!8057 k0!794 lt!205589))))))

(assert (=> d!74573 (= (+!1576 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) (tuple2!8057 k0!794 lt!205589)) lt!205959)))

(declare-fun b!453699 () Bool)

(declare-fun res!270193 () Bool)

(assert (=> b!453699 (=> (not res!270193) (not e!265570))))

(assert (=> b!453699 (= res!270193 (= (getValueByKey!370 (toList!3500 lt!205959) (_1!4039 (tuple2!8057 k0!794 lt!205589))) (Some!375 (_2!4039 (tuple2!8057 k0!794 lt!205589)))))))

(declare-fun b!453700 () Bool)

(assert (=> b!453700 (= e!265570 (contains!2499 (toList!3500 lt!205959) (tuple2!8057 k0!794 lt!205589)))))

(assert (= (and d!74573 res!270194) b!453699))

(assert (= (and b!453699 res!270193) b!453700))

(declare-fun m!437993 () Bool)

(assert (=> d!74573 m!437993))

(declare-fun m!437995 () Bool)

(assert (=> d!74573 m!437995))

(declare-fun m!437997 () Bool)

(assert (=> d!74573 m!437997))

(declare-fun m!437999 () Bool)

(assert (=> d!74573 m!437999))

(declare-fun m!438001 () Bool)

(assert (=> b!453699 m!438001))

(declare-fun m!438003 () Bool)

(assert (=> b!453700 m!438003))

(assert (=> d!74345 d!74573))

(assert (=> d!74345 d!74357))

(declare-fun d!74575 () Bool)

(assert (=> d!74575 (= (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205589)) (+!1576 (+!1576 lt!205585 (tuple2!8057 k0!794 lt!205587)) (tuple2!8057 k0!794 lt!205589)))))

(assert (=> d!74575 true))

(declare-fun _$24!42 () Unit!13248)

(assert (=> d!74575 (= (choose!1327 lt!205585 k0!794 lt!205587 lt!205589) _$24!42)))

(declare-fun bs!14413 () Bool)

(assert (= bs!14413 d!74575))

(assert (=> bs!14413 m!437143))

(assert (=> bs!14413 m!436871))

(assert (=> bs!14413 m!436871))

(assert (=> bs!14413 m!437145))

(assert (=> d!74345 d!74575))

(assert (=> b!453152 d!74531))

(assert (=> b!453210 d!74491))

(declare-fun d!74577 () Bool)

(assert (=> d!74577 (not (contains!2498 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672)) lt!205676))))

(declare-fun lt!205960 () Unit!13248)

(assert (=> d!74577 (= lt!205960 (choose!1329 lt!205674 lt!205673 lt!205672 lt!205676))))

(declare-fun e!265571 () Bool)

(assert (=> d!74577 e!265571))

(declare-fun res!270195 () Bool)

(assert (=> d!74577 (=> (not res!270195) (not e!265571))))

(assert (=> d!74577 (= res!270195 (not (contains!2498 lt!205674 lt!205676)))))

(assert (=> d!74577 (= (addStillNotContains!146 lt!205674 lt!205673 lt!205672 lt!205676) lt!205960)))

(declare-fun b!453701 () Bool)

(assert (=> b!453701 (= e!265571 (not (= lt!205673 lt!205676)))))

(assert (= (and d!74577 res!270195) b!453701))

(assert (=> d!74577 m!437063))

(assert (=> d!74577 m!437063))

(assert (=> d!74577 m!437065))

(declare-fun m!438005 () Bool)

(assert (=> d!74577 m!438005))

(declare-fun m!438007 () Bool)

(assert (=> d!74577 m!438007))

(assert (=> b!453210 d!74577))

(declare-fun d!74579 () Bool)

(declare-fun e!265572 () Bool)

(assert (=> d!74579 e!265572))

(declare-fun res!270197 () Bool)

(assert (=> d!74579 (=> (not res!270197) (not e!265572))))

(declare-fun lt!205964 () ListLongMap!6969)

(assert (=> d!74579 (= res!270197 (contains!2498 lt!205964 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205962 () List!8113)

(assert (=> d!74579 (= lt!205964 (ListLongMap!6970 lt!205962))))

(declare-fun lt!205963 () Unit!13248)

(declare-fun lt!205961 () Unit!13248)

(assert (=> d!74579 (= lt!205963 lt!205961)))

(assert (=> d!74579 (= (getValueByKey!370 lt!205962 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= lt!205961 (lemmaContainsTupThenGetReturnValue!192 lt!205962 (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= lt!205962 (insertStrictlySorted!195 (toList!3500 call!30039) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74579 (= (+!1576 call!30039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205964)))

(declare-fun b!453702 () Bool)

(declare-fun res!270196 () Bool)

(assert (=> b!453702 (=> (not res!270196) (not e!265572))))

(assert (=> b!453702 (= res!270196 (= (getValueByKey!370 (toList!3500 lt!205964) (_1!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!375 (_2!4039 (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453703 () Bool)

(assert (=> b!453703 (= e!265572 (contains!2499 (toList!3500 lt!205964) (tuple2!8057 (select (arr!13489 lt!205595) from!863) (get!6653 (select (arr!13490 lt!205593) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74579 res!270197) b!453702))

(assert (= (and b!453702 res!270196) b!453703))

(declare-fun m!438009 () Bool)

(assert (=> d!74579 m!438009))

(declare-fun m!438011 () Bool)

(assert (=> d!74579 m!438011))

(declare-fun m!438013 () Bool)

(assert (=> d!74579 m!438013))

(declare-fun m!438015 () Bool)

(assert (=> d!74579 m!438015))

(declare-fun m!438017 () Bool)

(assert (=> b!453702 m!438017))

(declare-fun m!438019 () Bool)

(assert (=> b!453703 m!438019))

(assert (=> b!453210 d!74579))

(declare-fun d!74581 () Bool)

(declare-fun e!265574 () Bool)

(assert (=> d!74581 e!265574))

(declare-fun res!270198 () Bool)

(assert (=> d!74581 (=> res!270198 e!265574)))

(declare-fun lt!205966 () Bool)

(assert (=> d!74581 (= res!270198 (not lt!205966))))

(declare-fun lt!205967 () Bool)

(assert (=> d!74581 (= lt!205966 lt!205967)))

(declare-fun lt!205965 () Unit!13248)

(declare-fun e!265573 () Unit!13248)

(assert (=> d!74581 (= lt!205965 e!265573)))

(declare-fun c!56326 () Bool)

(assert (=> d!74581 (= c!56326 lt!205967)))

(assert (=> d!74581 (= lt!205967 (containsKey!347 (toList!3500 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672))) lt!205676))))

(assert (=> d!74581 (= (contains!2498 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672)) lt!205676) lt!205966)))

(declare-fun b!453704 () Bool)

(declare-fun lt!205968 () Unit!13248)

(assert (=> b!453704 (= e!265573 lt!205968)))

(assert (=> b!453704 (= lt!205968 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672))) lt!205676))))

(assert (=> b!453704 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672))) lt!205676))))

(declare-fun b!453705 () Bool)

(declare-fun Unit!13270 () Unit!13248)

(assert (=> b!453705 (= e!265573 Unit!13270)))

(declare-fun b!453706 () Bool)

(assert (=> b!453706 (= e!265574 (isDefined!296 (getValueByKey!370 (toList!3500 (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672))) lt!205676)))))

(assert (= (and d!74581 c!56326) b!453704))

(assert (= (and d!74581 (not c!56326)) b!453705))

(assert (= (and d!74581 (not res!270198)) b!453706))

(declare-fun m!438021 () Bool)

(assert (=> d!74581 m!438021))

(declare-fun m!438023 () Bool)

(assert (=> b!453704 m!438023))

(declare-fun m!438025 () Bool)

(assert (=> b!453704 m!438025))

(assert (=> b!453704 m!438025))

(declare-fun m!438027 () Bool)

(assert (=> b!453704 m!438027))

(assert (=> b!453706 m!438025))

(assert (=> b!453706 m!438025))

(assert (=> b!453706 m!438027))

(assert (=> b!453210 d!74581))

(declare-fun d!74583 () Bool)

(declare-fun e!265575 () Bool)

(assert (=> d!74583 e!265575))

(declare-fun res!270200 () Bool)

(assert (=> d!74583 (=> (not res!270200) (not e!265575))))

(declare-fun lt!205972 () ListLongMap!6969)

(assert (=> d!74583 (= res!270200 (contains!2498 lt!205972 (_1!4039 (tuple2!8057 lt!205673 lt!205672))))))

(declare-fun lt!205970 () List!8113)

(assert (=> d!74583 (= lt!205972 (ListLongMap!6970 lt!205970))))

(declare-fun lt!205971 () Unit!13248)

(declare-fun lt!205969 () Unit!13248)

(assert (=> d!74583 (= lt!205971 lt!205969)))

(assert (=> d!74583 (= (getValueByKey!370 lt!205970 (_1!4039 (tuple2!8057 lt!205673 lt!205672))) (Some!375 (_2!4039 (tuple2!8057 lt!205673 lt!205672))))))

(assert (=> d!74583 (= lt!205969 (lemmaContainsTupThenGetReturnValue!192 lt!205970 (_1!4039 (tuple2!8057 lt!205673 lt!205672)) (_2!4039 (tuple2!8057 lt!205673 lt!205672))))))

(assert (=> d!74583 (= lt!205970 (insertStrictlySorted!195 (toList!3500 lt!205674) (_1!4039 (tuple2!8057 lt!205673 lt!205672)) (_2!4039 (tuple2!8057 lt!205673 lt!205672))))))

(assert (=> d!74583 (= (+!1576 lt!205674 (tuple2!8057 lt!205673 lt!205672)) lt!205972)))

(declare-fun b!453707 () Bool)

(declare-fun res!270199 () Bool)

(assert (=> b!453707 (=> (not res!270199) (not e!265575))))

(assert (=> b!453707 (= res!270199 (= (getValueByKey!370 (toList!3500 lt!205972) (_1!4039 (tuple2!8057 lt!205673 lt!205672))) (Some!375 (_2!4039 (tuple2!8057 lt!205673 lt!205672)))))))

(declare-fun b!453708 () Bool)

(assert (=> b!453708 (= e!265575 (contains!2499 (toList!3500 lt!205972) (tuple2!8057 lt!205673 lt!205672)))))

(assert (= (and d!74583 res!270200) b!453707))

(assert (= (and b!453707 res!270199) b!453708))

(declare-fun m!438029 () Bool)

(assert (=> d!74583 m!438029))

(declare-fun m!438031 () Bool)

(assert (=> d!74583 m!438031))

(declare-fun m!438033 () Bool)

(assert (=> d!74583 m!438033))

(declare-fun m!438035 () Bool)

(assert (=> d!74583 m!438035))

(declare-fun m!438037 () Bool)

(assert (=> b!453707 m!438037))

(declare-fun m!438039 () Bool)

(assert (=> b!453708 m!438039))

(assert (=> b!453210 d!74583))

(declare-fun d!74585 () Bool)

(declare-fun e!265577 () Bool)

(assert (=> d!74585 e!265577))

(declare-fun res!270201 () Bool)

(assert (=> d!74585 (=> res!270201 e!265577)))

(declare-fun lt!205974 () Bool)

(assert (=> d!74585 (= res!270201 (not lt!205974))))

(declare-fun lt!205975 () Bool)

(assert (=> d!74585 (= lt!205974 lt!205975)))

(declare-fun lt!205973 () Unit!13248)

(declare-fun e!265576 () Unit!13248)

(assert (=> d!74585 (= lt!205973 e!265576)))

(declare-fun c!56327 () Bool)

(assert (=> d!74585 (= c!56327 lt!205975)))

(assert (=> d!74585 (= lt!205975 (containsKey!347 (toList!3500 lt!205709) (_1!4039 lt!205594)))))

(assert (=> d!74585 (= (contains!2498 lt!205709 (_1!4039 lt!205594)) lt!205974)))

(declare-fun b!453709 () Bool)

(declare-fun lt!205976 () Unit!13248)

(assert (=> b!453709 (= e!265576 lt!205976)))

(assert (=> b!453709 (= lt!205976 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205709) (_1!4039 lt!205594)))))

(assert (=> b!453709 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205709) (_1!4039 lt!205594)))))

(declare-fun b!453710 () Bool)

(declare-fun Unit!13271 () Unit!13248)

(assert (=> b!453710 (= e!265576 Unit!13271)))

(declare-fun b!453711 () Bool)

(assert (=> b!453711 (= e!265577 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205709) (_1!4039 lt!205594))))))

(assert (= (and d!74585 c!56327) b!453709))

(assert (= (and d!74585 (not c!56327)) b!453710))

(assert (= (and d!74585 (not res!270201)) b!453711))

(declare-fun m!438041 () Bool)

(assert (=> d!74585 m!438041))

(declare-fun m!438043 () Bool)

(assert (=> b!453709 m!438043))

(assert (=> b!453709 m!437185))

(assert (=> b!453709 m!437185))

(declare-fun m!438045 () Bool)

(assert (=> b!453709 m!438045))

(assert (=> b!453711 m!437185))

(assert (=> b!453711 m!437185))

(assert (=> b!453711 m!438045))

(assert (=> d!74349 d!74585))

(declare-fun b!453713 () Bool)

(declare-fun e!265578 () Option!376)

(declare-fun e!265579 () Option!376)

(assert (=> b!453713 (= e!265578 e!265579)))

(declare-fun c!56329 () Bool)

(assert (=> b!453713 (= c!56329 (and ((_ is Cons!8109) lt!205707) (not (= (_1!4039 (h!8965 lt!205707)) (_1!4039 lt!205594)))))))

(declare-fun b!453712 () Bool)

(assert (=> b!453712 (= e!265578 (Some!375 (_2!4039 (h!8965 lt!205707))))))

(declare-fun d!74587 () Bool)

(declare-fun c!56328 () Bool)

(assert (=> d!74587 (= c!56328 (and ((_ is Cons!8109) lt!205707) (= (_1!4039 (h!8965 lt!205707)) (_1!4039 lt!205594))))))

(assert (=> d!74587 (= (getValueByKey!370 lt!205707 (_1!4039 lt!205594)) e!265578)))

(declare-fun b!453715 () Bool)

(assert (=> b!453715 (= e!265579 None!374)))

(declare-fun b!453714 () Bool)

(assert (=> b!453714 (= e!265579 (getValueByKey!370 (t!13939 lt!205707) (_1!4039 lt!205594)))))

(assert (= (and d!74587 c!56328) b!453712))

(assert (= (and d!74587 (not c!56328)) b!453713))

(assert (= (and b!453713 c!56329) b!453714))

(assert (= (and b!453713 (not c!56329)) b!453715))

(declare-fun m!438047 () Bool)

(assert (=> b!453714 m!438047))

(assert (=> d!74349 d!74587))

(declare-fun d!74589 () Bool)

(assert (=> d!74589 (= (getValueByKey!370 lt!205707 (_1!4039 lt!205594)) (Some!375 (_2!4039 lt!205594)))))

(declare-fun lt!205977 () Unit!13248)

(assert (=> d!74589 (= lt!205977 (choose!1330 lt!205707 (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(declare-fun e!265580 () Bool)

(assert (=> d!74589 e!265580))

(declare-fun res!270202 () Bool)

(assert (=> d!74589 (=> (not res!270202) (not e!265580))))

(assert (=> d!74589 (= res!270202 (isStrictlySorted!378 lt!205707))))

(assert (=> d!74589 (= (lemmaContainsTupThenGetReturnValue!192 lt!205707 (_1!4039 lt!205594) (_2!4039 lt!205594)) lt!205977)))

(declare-fun b!453716 () Bool)

(declare-fun res!270203 () Bool)

(assert (=> b!453716 (=> (not res!270203) (not e!265580))))

(assert (=> b!453716 (= res!270203 (containsKey!347 lt!205707 (_1!4039 lt!205594)))))

(declare-fun b!453717 () Bool)

(assert (=> b!453717 (= e!265580 (contains!2499 lt!205707 (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594))))))

(assert (= (and d!74589 res!270202) b!453716))

(assert (= (and b!453716 res!270203) b!453717))

(assert (=> d!74589 m!437179))

(declare-fun m!438049 () Bool)

(assert (=> d!74589 m!438049))

(declare-fun m!438051 () Bool)

(assert (=> d!74589 m!438051))

(declare-fun m!438053 () Bool)

(assert (=> b!453716 m!438053))

(declare-fun m!438055 () Bool)

(assert (=> b!453717 m!438055))

(assert (=> d!74349 d!74589))

(declare-fun e!265582 () List!8113)

(declare-fun b!453718 () Bool)

(declare-fun c!56330 () Bool)

(declare-fun c!56331 () Bool)

(assert (=> b!453718 (= e!265582 (ite c!56330 (t!13939 (toList!3500 lt!205585)) (ite c!56331 (Cons!8109 (h!8965 (toList!3500 lt!205585)) (t!13939 (toList!3500 lt!205585))) Nil!8110)))))

(declare-fun b!453719 () Bool)

(declare-fun e!265584 () List!8113)

(declare-fun e!265583 () List!8113)

(assert (=> b!453719 (= e!265584 e!265583)))

(assert (=> b!453719 (= c!56330 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (= (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 lt!205594))))))

(declare-fun b!453720 () Bool)

(declare-fun e!265581 () List!8113)

(declare-fun call!30089 () List!8113)

(assert (=> b!453720 (= e!265581 call!30089)))

(declare-fun d!74591 () Bool)

(declare-fun e!265585 () Bool)

(assert (=> d!74591 e!265585))

(declare-fun res!270204 () Bool)

(assert (=> d!74591 (=> (not res!270204) (not e!265585))))

(declare-fun lt!205978 () List!8113)

(assert (=> d!74591 (= res!270204 (isStrictlySorted!378 lt!205978))))

(assert (=> d!74591 (= lt!205978 e!265584)))

(declare-fun c!56332 () Bool)

(assert (=> d!74591 (= c!56332 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvslt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 lt!205594))))))

(assert (=> d!74591 (isStrictlySorted!378 (toList!3500 lt!205585))))

(assert (=> d!74591 (= (insertStrictlySorted!195 (toList!3500 lt!205585) (_1!4039 lt!205594) (_2!4039 lt!205594)) lt!205978)))

(declare-fun b!453721 () Bool)

(declare-fun call!30090 () List!8113)

(assert (=> b!453721 (= e!265583 call!30090)))

(declare-fun b!453722 () Bool)

(declare-fun res!270205 () Bool)

(assert (=> b!453722 (=> (not res!270205) (not e!265585))))

(assert (=> b!453722 (= res!270205 (containsKey!347 lt!205978 (_1!4039 lt!205594)))))

(declare-fun b!453723 () Bool)

(assert (=> b!453723 (= e!265582 (insertStrictlySorted!195 (t!13939 (toList!3500 lt!205585)) (_1!4039 lt!205594) (_2!4039 lt!205594)))))

(declare-fun b!453724 () Bool)

(assert (=> b!453724 (= e!265581 call!30089)))

(declare-fun b!453725 () Bool)

(declare-fun call!30091 () List!8113)

(assert (=> b!453725 (= e!265584 call!30091)))

(declare-fun b!453726 () Bool)

(assert (=> b!453726 (= e!265585 (contains!2499 lt!205978 (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594))))))

(declare-fun bm!30086 () Bool)

(assert (=> bm!30086 (= call!30090 call!30091)))

(declare-fun bm!30087 () Bool)

(assert (=> bm!30087 (= call!30091 ($colon$colon!109 e!265582 (ite c!56332 (h!8965 (toList!3500 lt!205585)) (tuple2!8057 (_1!4039 lt!205594) (_2!4039 lt!205594)))))))

(declare-fun c!56333 () Bool)

(assert (=> bm!30087 (= c!56333 c!56332)))

(declare-fun bm!30088 () Bool)

(assert (=> bm!30088 (= call!30089 call!30090)))

(declare-fun b!453727 () Bool)

(assert (=> b!453727 (= c!56331 (and ((_ is Cons!8109) (toList!3500 lt!205585)) (bvsgt (_1!4039 (h!8965 (toList!3500 lt!205585))) (_1!4039 lt!205594))))))

(assert (=> b!453727 (= e!265583 e!265581)))

(assert (= (and d!74591 c!56332) b!453725))

(assert (= (and d!74591 (not c!56332)) b!453719))

(assert (= (and b!453719 c!56330) b!453721))

(assert (= (and b!453719 (not c!56330)) b!453727))

(assert (= (and b!453727 c!56331) b!453720))

(assert (= (and b!453727 (not c!56331)) b!453724))

(assert (= (or b!453720 b!453724) bm!30088))

(assert (= (or b!453721 bm!30088) bm!30086))

(assert (= (or b!453725 bm!30086) bm!30087))

(assert (= (and bm!30087 c!56333) b!453723))

(assert (= (and bm!30087 (not c!56333)) b!453718))

(assert (= (and d!74591 res!270204) b!453722))

(assert (= (and b!453722 res!270205) b!453726))

(declare-fun m!438057 () Bool)

(assert (=> bm!30087 m!438057))

(declare-fun m!438059 () Bool)

(assert (=> b!453723 m!438059))

(declare-fun m!438061 () Bool)

(assert (=> b!453722 m!438061))

(declare-fun m!438063 () Bool)

(assert (=> b!453726 m!438063))

(declare-fun m!438065 () Bool)

(assert (=> d!74591 m!438065))

(assert (=> d!74591 m!437457))

(assert (=> d!74349 d!74591))

(declare-fun b!453729 () Bool)

(declare-fun e!265586 () Option!376)

(declare-fun e!265587 () Option!376)

(assert (=> b!453729 (= e!265586 e!265587)))

(declare-fun c!56335 () Bool)

(assert (=> b!453729 (= c!56335 (and ((_ is Cons!8109) (toList!3500 lt!205695)) (not (= (_1!4039 (h!8965 (toList!3500 lt!205695))) (_1!4039 lt!205594)))))))

(declare-fun b!453728 () Bool)

(assert (=> b!453728 (= e!265586 (Some!375 (_2!4039 (h!8965 (toList!3500 lt!205695)))))))

(declare-fun d!74593 () Bool)

(declare-fun c!56334 () Bool)

(assert (=> d!74593 (= c!56334 (and ((_ is Cons!8109) (toList!3500 lt!205695)) (= (_1!4039 (h!8965 (toList!3500 lt!205695))) (_1!4039 lt!205594))))))

(assert (=> d!74593 (= (getValueByKey!370 (toList!3500 lt!205695) (_1!4039 lt!205594)) e!265586)))

(declare-fun b!453731 () Bool)

(assert (=> b!453731 (= e!265587 None!374)))

(declare-fun b!453730 () Bool)

(assert (=> b!453730 (= e!265587 (getValueByKey!370 (t!13939 (toList!3500 lt!205695)) (_1!4039 lt!205594)))))

(assert (= (and d!74593 c!56334) b!453728))

(assert (= (and d!74593 (not c!56334)) b!453729))

(assert (= (and b!453729 c!56335) b!453730))

(assert (= (and b!453729 (not c!56335)) b!453731))

(declare-fun m!438067 () Bool)

(assert (=> b!453730 m!438067))

(assert (=> b!453252 d!74593))

(assert (=> b!453293 d!74425))

(declare-fun d!74595 () Bool)

(declare-fun e!265589 () Bool)

(assert (=> d!74595 e!265589))

(declare-fun res!270206 () Bool)

(assert (=> d!74595 (=> res!270206 e!265589)))

(declare-fun lt!205980 () Bool)

(assert (=> d!74595 (= res!270206 (not lt!205980))))

(declare-fun lt!205981 () Bool)

(assert (=> d!74595 (= lt!205980 lt!205981)))

(declare-fun lt!205979 () Unit!13248)

(declare-fun e!265588 () Unit!13248)

(assert (=> d!74595 (= lt!205979 e!265588)))

(declare-fun c!56336 () Bool)

(assert (=> d!74595 (= c!56336 lt!205981)))

(assert (=> d!74595 (= lt!205981 (containsKey!347 (toList!3500 lt!205699) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74595 (= (contains!2498 lt!205699 (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))) lt!205980)))

(declare-fun b!453732 () Bool)

(declare-fun lt!205982 () Unit!13248)

(assert (=> b!453732 (= e!265588 lt!205982)))

(assert (=> b!453732 (= lt!205982 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205699) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453732 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453733 () Bool)

(declare-fun Unit!13272 () Unit!13248)

(assert (=> b!453733 (= e!265588 Unit!13272)))

(declare-fun b!453734 () Bool)

(assert (=> b!453734 (= e!265589 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205699) (select (arr!13489 lt!205595) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74595 c!56336) b!453732))

(assert (= (and d!74595 (not c!56336)) b!453733))

(assert (= (and d!74595 (not res!270206)) b!453734))

(assert (=> d!74595 m!437155))

(declare-fun m!438069 () Bool)

(assert (=> d!74595 m!438069))

(assert (=> b!453732 m!437155))

(declare-fun m!438071 () Bool)

(assert (=> b!453732 m!438071))

(assert (=> b!453732 m!437155))

(assert (=> b!453732 m!437693))

(assert (=> b!453732 m!437693))

(declare-fun m!438073 () Bool)

(assert (=> b!453732 m!438073))

(assert (=> b!453734 m!437155))

(assert (=> b!453734 m!437693))

(assert (=> b!453734 m!437693))

(assert (=> b!453734 m!438073))

(assert (=> b!453262 d!74595))

(assert (=> b!453223 d!74361))

(declare-fun d!74597 () Bool)

(declare-fun lt!205983 () Bool)

(assert (=> d!74597 (= lt!205983 (select (content!203 (toList!3500 lt!205717)) (tuple2!8057 k0!794 v!412)))))

(declare-fun e!265591 () Bool)

(assert (=> d!74597 (= lt!205983 e!265591)))

(declare-fun res!270207 () Bool)

(assert (=> d!74597 (=> (not res!270207) (not e!265591))))

(assert (=> d!74597 (= res!270207 ((_ is Cons!8109) (toList!3500 lt!205717)))))

(assert (=> d!74597 (= (contains!2499 (toList!3500 lt!205717) (tuple2!8057 k0!794 v!412)) lt!205983)))

(declare-fun b!453735 () Bool)

(declare-fun e!265590 () Bool)

(assert (=> b!453735 (= e!265591 e!265590)))

(declare-fun res!270208 () Bool)

(assert (=> b!453735 (=> res!270208 e!265590)))

(assert (=> b!453735 (= res!270208 (= (h!8965 (toList!3500 lt!205717)) (tuple2!8057 k0!794 v!412)))))

(declare-fun b!453736 () Bool)

(assert (=> b!453736 (= e!265590 (contains!2499 (t!13939 (toList!3500 lt!205717)) (tuple2!8057 k0!794 v!412)))))

(assert (= (and d!74597 res!270207) b!453735))

(assert (= (and b!453735 (not res!270208)) b!453736))

(declare-fun m!438075 () Bool)

(assert (=> d!74597 m!438075))

(declare-fun m!438077 () Bool)

(assert (=> d!74597 m!438077))

(declare-fun m!438079 () Bool)

(assert (=> b!453736 m!438079))

(assert (=> b!453273 d!74597))

(declare-fun d!74599 () Bool)

(declare-fun e!265593 () Bool)

(assert (=> d!74599 e!265593))

(declare-fun res!270209 () Bool)

(assert (=> d!74599 (=> res!270209 e!265593)))

(declare-fun lt!205985 () Bool)

(assert (=> d!74599 (= res!270209 (not lt!205985))))

(declare-fun lt!205986 () Bool)

(assert (=> d!74599 (= lt!205985 lt!205986)))

(declare-fun lt!205984 () Unit!13248)

(declare-fun e!265592 () Unit!13248)

(assert (=> d!74599 (= lt!205984 e!265592)))

(declare-fun c!56337 () Bool)

(assert (=> d!74599 (= c!56337 lt!205986)))

(assert (=> d!74599 (= lt!205986 (containsKey!347 (toList!3500 lt!205671) (select (arr!13489 lt!205595) from!863)))))

(assert (=> d!74599 (= (contains!2498 lt!205671 (select (arr!13489 lt!205595) from!863)) lt!205985)))

(declare-fun b!453737 () Bool)

(declare-fun lt!205987 () Unit!13248)

(assert (=> b!453737 (= e!265592 lt!205987)))

(assert (=> b!453737 (= lt!205987 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205671) (select (arr!13489 lt!205595) from!863)))))

(assert (=> b!453737 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) (select (arr!13489 lt!205595) from!863)))))

(declare-fun b!453738 () Bool)

(declare-fun Unit!13273 () Unit!13248)

(assert (=> b!453738 (= e!265592 Unit!13273)))

(declare-fun b!453739 () Bool)

(assert (=> b!453739 (= e!265593 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205671) (select (arr!13489 lt!205595) from!863))))))

(assert (= (and d!74599 c!56337) b!453737))

(assert (= (and d!74599 (not c!56337)) b!453738))

(assert (= (and d!74599 (not res!270209)) b!453739))

(assert (=> d!74599 m!436885))

(declare-fun m!438081 () Bool)

(assert (=> d!74599 m!438081))

(assert (=> b!453737 m!436885))

(declare-fun m!438083 () Bool)

(assert (=> b!453737 m!438083))

(assert (=> b!453737 m!436885))

(assert (=> b!453737 m!437707))

(assert (=> b!453737 m!437707))

(declare-fun m!438085 () Bool)

(assert (=> b!453737 m!438085))

(assert (=> b!453739 m!436885))

(assert (=> b!453739 m!437707))

(assert (=> b!453739 m!437707))

(assert (=> b!453739 m!438085))

(assert (=> b!453218 d!74599))

(declare-fun d!74601 () Bool)

(assert (=> d!74601 (= (apply!313 lt!205655 (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (getValueByKey!370 (toList!3500 lt!205655) (select (arr!13489 (ite c!56153 lt!205595 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14414 () Bool)

(assert (= bs!14414 d!74601))

(assert (=> bs!14414 m!437017))

(assert (=> bs!14414 m!437787))

(assert (=> bs!14414 m!437787))

(declare-fun m!438087 () Bool)

(assert (=> bs!14414 m!438087))

(assert (=> b!453193 d!74601))

(assert (=> b!453193 d!74435))

(declare-fun lt!205988 () Bool)

(declare-fun d!74603 () Bool)

(assert (=> d!74603 (= lt!205988 (select (content!203 (toList!3500 lt!205640)) (tuple2!8057 k0!794 v!412)))))

(declare-fun e!265595 () Bool)

(assert (=> d!74603 (= lt!205988 e!265595)))

(declare-fun res!270210 () Bool)

(assert (=> d!74603 (=> (not res!270210) (not e!265595))))

(assert (=> d!74603 (= res!270210 ((_ is Cons!8109) (toList!3500 lt!205640)))))

(assert (=> d!74603 (= (contains!2499 (toList!3500 lt!205640) (tuple2!8057 k0!794 v!412)) lt!205988)))

(declare-fun b!453740 () Bool)

(declare-fun e!265594 () Bool)

(assert (=> b!453740 (= e!265595 e!265594)))

(declare-fun res!270211 () Bool)

(assert (=> b!453740 (=> res!270211 e!265594)))

(assert (=> b!453740 (= res!270211 (= (h!8965 (toList!3500 lt!205640)) (tuple2!8057 k0!794 v!412)))))

(declare-fun b!453741 () Bool)

(assert (=> b!453741 (= e!265594 (contains!2499 (t!13939 (toList!3500 lt!205640)) (tuple2!8057 k0!794 v!412)))))

(assert (= (and d!74603 res!270210) b!453740))

(assert (= (and b!453740 (not res!270211)) b!453741))

(declare-fun m!438089 () Bool)

(assert (=> d!74603 m!438089))

(declare-fun m!438091 () Bool)

(assert (=> d!74603 m!438091))

(declare-fun m!438093 () Bool)

(assert (=> b!453741 m!438093))

(assert (=> b!453161 d!74603))

(assert (=> b!453155 d!74531))

(declare-fun d!74605 () Bool)

(assert (=> d!74605 (= (isEmpty!559 lt!205671) (isEmpty!560 (toList!3500 lt!205671)))))

(declare-fun bs!14415 () Bool)

(assert (= bs!14415 d!74605))

(declare-fun m!438095 () Bool)

(assert (=> bs!14415 m!438095))

(assert (=> b!453214 d!74605))

(declare-fun d!74607 () Bool)

(declare-fun e!265597 () Bool)

(assert (=> d!74607 e!265597))

(declare-fun res!270212 () Bool)

(assert (=> d!74607 (=> res!270212 e!265597)))

(declare-fun lt!205990 () Bool)

(assert (=> d!74607 (= res!270212 (not lt!205990))))

(declare-fun lt!205991 () Bool)

(assert (=> d!74607 (= lt!205990 lt!205991)))

(declare-fun lt!205989 () Unit!13248)

(declare-fun e!265596 () Unit!13248)

(assert (=> d!74607 (= lt!205989 e!265596)))

(declare-fun c!56338 () Bool)

(assert (=> d!74607 (= c!56338 lt!205991)))

(assert (=> d!74607 (= lt!205991 (containsKey!347 (toList!3500 lt!205655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74607 (= (contains!2498 lt!205655 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205990)))

(declare-fun b!453742 () Bool)

(declare-fun lt!205992 () Unit!13248)

(assert (=> b!453742 (= e!265596 lt!205992)))

(assert (=> b!453742 (= lt!205992 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453742 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453743 () Bool)

(declare-fun Unit!13274 () Unit!13248)

(assert (=> b!453743 (= e!265596 Unit!13274)))

(declare-fun b!453744 () Bool)

(assert (=> b!453744 (= e!265597 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74607 c!56338) b!453742))

(assert (= (and d!74607 (not c!56338)) b!453743))

(assert (= (and d!74607 (not res!270212)) b!453744))

(declare-fun m!438097 () Bool)

(assert (=> d!74607 m!438097))

(declare-fun m!438099 () Bool)

(assert (=> b!453742 m!438099))

(declare-fun m!438101 () Bool)

(assert (=> b!453742 m!438101))

(assert (=> b!453742 m!438101))

(declare-fun m!438103 () Bool)

(assert (=> b!453742 m!438103))

(assert (=> b!453744 m!438101))

(assert (=> b!453744 m!438101))

(assert (=> b!453744 m!438103))

(assert (=> b!453189 d!74607))

(declare-fun d!74609 () Bool)

(declare-fun e!265599 () Bool)

(assert (=> d!74609 e!265599))

(declare-fun res!270213 () Bool)

(assert (=> d!74609 (=> res!270213 e!265599)))

(declare-fun lt!205994 () Bool)

(assert (=> d!74609 (= res!270213 (not lt!205994))))

(declare-fun lt!205995 () Bool)

(assert (=> d!74609 (= lt!205994 lt!205995)))

(declare-fun lt!205993 () Unit!13248)

(declare-fun e!265598 () Unit!13248)

(assert (=> d!74609 (= lt!205993 e!265598)))

(declare-fun c!56339 () Bool)

(assert (=> d!74609 (= c!56339 lt!205995)))

(assert (=> d!74609 (= lt!205995 (containsKey!347 (toList!3500 lt!205678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74609 (= (contains!2498 lt!205678 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205994)))

(declare-fun b!453745 () Bool)

(declare-fun lt!205996 () Unit!13248)

(assert (=> b!453745 (= e!265598 lt!205996)))

(assert (=> b!453745 (= lt!205996 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3500 lt!205678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453745 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453746 () Bool)

(declare-fun Unit!13275 () Unit!13248)

(assert (=> b!453746 (= e!265598 Unit!13275)))

(declare-fun b!453747 () Bool)

(assert (=> b!453747 (= e!265599 (isDefined!296 (getValueByKey!370 (toList!3500 lt!205678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74609 c!56339) b!453745))

(assert (= (and d!74609 (not c!56339)) b!453746))

(assert (= (and d!74609 (not res!270213)) b!453747))

(declare-fun m!438105 () Bool)

(assert (=> d!74609 m!438105))

(declare-fun m!438107 () Bool)

(assert (=> b!453745 m!438107))

(declare-fun m!438109 () Bool)

(assert (=> b!453745 m!438109))

(assert (=> b!453745 m!438109))

(declare-fun m!438111 () Bool)

(assert (=> b!453745 m!438111))

(assert (=> b!453747 m!438109))

(assert (=> b!453747 m!438109))

(assert (=> b!453747 m!438111))

(assert (=> d!74337 d!74609))

(assert (=> d!74337 d!74323))

(declare-fun d!74611 () Bool)

(declare-fun lt!205997 () Bool)

(assert (=> d!74611 (= lt!205997 (select (content!203 (toList!3500 lt!205713)) (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))

(declare-fun e!265601 () Bool)

(assert (=> d!74611 (= lt!205997 e!265601)))

(declare-fun res!270214 () Bool)

(assert (=> d!74611 (=> (not res!270214) (not e!265601))))

(assert (=> d!74611 (= res!270214 ((_ is Cons!8109) (toList!3500 lt!205713)))))

(assert (=> d!74611 (= (contains!2499 (toList!3500 lt!205713) (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)) lt!205997)))

(declare-fun b!453748 () Bool)

(declare-fun e!265600 () Bool)

(assert (=> b!453748 (= e!265601 e!265600)))

(declare-fun res!270215 () Bool)

(assert (=> b!453748 (=> res!270215 e!265600)))

(assert (=> b!453748 (= res!270215 (= (h!8965 (toList!3500 lt!205713)) (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))

(declare-fun b!453749 () Bool)

(assert (=> b!453749 (= e!265600 (contains!2499 (t!13939 (toList!3500 lt!205713)) (tuple2!8057 (select (arr!13489 lt!205595) from!863) lt!205589)))))

(assert (= (and d!74611 res!270214) b!453748))

(assert (= (and b!453748 (not res!270215)) b!453749))

(declare-fun m!438113 () Bool)

(assert (=> d!74611 m!438113))

(declare-fun m!438115 () Bool)

(assert (=> d!74611 m!438115))

(declare-fun m!438117 () Bool)

(assert (=> b!453749 m!438117))

(assert (=> b!453271 d!74611))

(declare-fun b!453750 () Bool)

(declare-fun e!265602 () Bool)

(assert (=> b!453750 (= e!265602 tp_is_empty!12141)))

(declare-fun mapNonEmpty!19855 () Bool)

(declare-fun mapRes!19855 () Bool)

(declare-fun tp!38242 () Bool)

(assert (=> mapNonEmpty!19855 (= mapRes!19855 (and tp!38242 e!265602))))

(declare-fun mapValue!19855 () ValueCell!5727)

(declare-fun mapRest!19855 () (Array (_ BitVec 32) ValueCell!5727))

(declare-fun mapKey!19855 () (_ BitVec 32))

(assert (=> mapNonEmpty!19855 (= mapRest!19854 (store mapRest!19855 mapKey!19855 mapValue!19855))))

(declare-fun mapIsEmpty!19855 () Bool)

(assert (=> mapIsEmpty!19855 mapRes!19855))

(declare-fun b!453751 () Bool)

(declare-fun e!265603 () Bool)

(assert (=> b!453751 (= e!265603 tp_is_empty!12141)))

(declare-fun condMapEmpty!19855 () Bool)

(declare-fun mapDefault!19855 () ValueCell!5727)

(assert (=> mapNonEmpty!19854 (= condMapEmpty!19855 (= mapRest!19854 ((as const (Array (_ BitVec 32) ValueCell!5727)) mapDefault!19855)))))

(assert (=> mapNonEmpty!19854 (= tp!38241 (and e!265603 mapRes!19855))))

(assert (= (and mapNonEmpty!19854 condMapEmpty!19855) mapIsEmpty!19855))

(assert (= (and mapNonEmpty!19854 (not condMapEmpty!19855)) mapNonEmpty!19855))

(assert (= (and mapNonEmpty!19855 ((_ is ValueCellFull!5727) mapValue!19855)) b!453750))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5727) mapDefault!19855)) b!453751))

(declare-fun m!438119 () Bool)

(assert (=> mapNonEmpty!19855 m!438119))

(declare-fun b_lambda!9655 () Bool)

(assert (= b_lambda!9641 (or (and start!40814 b_free!10803) b_lambda!9655)))

(declare-fun b_lambda!9657 () Bool)

(assert (= b_lambda!9627 (or (and start!40814 b_free!10803) b_lambda!9657)))

(declare-fun b_lambda!9659 () Bool)

(assert (= b_lambda!9633 (or (and start!40814 b_free!10803) b_lambda!9659)))

(declare-fun b_lambda!9661 () Bool)

(assert (= b_lambda!9629 (or (and start!40814 b_free!10803) b_lambda!9661)))

(declare-fun b_lambda!9663 () Bool)

(assert (= b_lambda!9635 (or (and start!40814 b_free!10803) b_lambda!9663)))

(declare-fun b_lambda!9665 () Bool)

(assert (= b_lambda!9653 (or (and start!40814 b_free!10803) b_lambda!9665)))

(declare-fun b_lambda!9667 () Bool)

(assert (= b_lambda!9631 (or (and start!40814 b_free!10803) b_lambda!9667)))

(declare-fun b_lambda!9669 () Bool)

(assert (= b_lambda!9639 (or (and start!40814 b_free!10803) b_lambda!9669)))

(declare-fun b_lambda!9671 () Bool)

(assert (= b_lambda!9649 (or (and start!40814 b_free!10803) b_lambda!9671)))

(declare-fun b_lambda!9673 () Bool)

(assert (= b_lambda!9651 (or (and start!40814 b_free!10803) b_lambda!9673)))

(declare-fun b_lambda!9675 () Bool)

(assert (= b_lambda!9645 (or (and start!40814 b_free!10803) b_lambda!9675)))

(declare-fun b_lambda!9677 () Bool)

(assert (= b_lambda!9637 (or (and start!40814 b_free!10803) b_lambda!9677)))

(declare-fun b_lambda!9679 () Bool)

(assert (= b_lambda!9647 (or (and start!40814 b_free!10803) b_lambda!9679)))

(declare-fun b_lambda!9681 () Bool)

(assert (= b_lambda!9643 (or (and start!40814 b_free!10803) b_lambda!9681)))

(check-sat (not d!74579) (not d!74599) (not b!453659) (not d!74431) (not b!453741) (not b!453579) (not d!74583) (not b!453522) (not d!74467) (not b!453653) (not d!74545) (not b!453675) (not b_lambda!9681) (not b!453561) (not d!74609) (not b!453359) (not b!453326) (not b!453554) (not d!74471) (not b!453646) (not d!74605) (not b_lambda!9663) (not d!74449) (not b!453683) (not b!453545) (not bm!30067) (not b!453334) (not b!453475) (not d!74405) (not b!453513) (not b!453665) (not b!453607) (not d!74457) (not b!453709) (not b!453542) (not b!453650) (not b!453734) (not b!453580) (not d!74521) (not b_lambda!9615) (not b!453464) (not b!453488) (not b!453677) (not b_lambda!9617) (not d!74487) (not d!74397) (not b!453405) (not d!74465) (not b!453630) (not b!453608) (not b!453506) (not b!453501) (not d!74445) (not b!453698) (not d!74433) (not b_lambda!9607) (not b!453318) (not d!74415) (not d!74519) (not bm!30084) (not b!453491) (not b!453684) (not d!74483) (not d!74607) (not b!453553) (not b!453568) (not b!453588) (not b!453670) (not b!453691) (not b_lambda!9677) (not b!453623) (not b!453747) (not b!453656) (not d!74597) (not b!453471) (not d!74589) (not b!453377) (not b!453337) (not b!453325) (not b!453585) (not b_lambda!9657) (not b!453592) (not b!453490) (not b!453730) (not d!74373) (not b!453599) (not d!74567) (not d!74585) (not b_lambda!9613) (not b!453658) (not d!74591) (not b!453381) (not b!453510) (not d!74595) (not b!453353) (not b!453341) (not bm!30065) (not b!453614) (not b!453404) (not b!453672) (not b!453512) (not d!74407) (not d!74459) (not b!453523) (not b!453697) (not b!453402) (not d!74473) (not b!453716) b_and!18947 (not b!453744) (not b!453537) (not b!453342) (not b!453647) (not bm!30049) (not b_lambda!9669) (not b!453517) (not b!453539) (not b!453371) (not b!453573) (not d!74489) (not b!453584) (not b_lambda!9621) (not d!74533) (not d!74371) (not d!74437) (not b!453499) (not d!74571) (not b!453594) (not b_lambda!9679) tp_is_empty!12141 (not d!74563) (not bm!30068) (not b!453407) (not b!453468) (not b!453383) (not b!453399) (not b!453547) (not d!74581) (not b!453723) (not b!453642) (not b!453458) (not d!74417) (not b!453726) (not b!453331) (not b!453603) (not b!453619) (not b!453627) (not b!453717) (not d!74391) (not b!453640) (not bm!30076) (not b!453707) (not b!453316) (not b!453702) (not d!74429) (not b!453375) (not bm!30079) (not b!453615) (not bm!30050) (not d!74541) (not b!453378) (not b!453335) (not b!453714) (not bm!30075) (not b!453722) (not d!74559) (not d!74573) (not bm!30070) (not b!453418) (not b!453454) (not b!453636) (not b!453494) (not d!74569) (not d!74505) (not bm!30055) (not b!453596) (not b!453651) (not b!453478) (not b_lambda!9625) (not d!74461) (not d!74529) (not d!74447) (not d!74543) (not b!453736) (not d!74525) (not d!74421) (not d!74499) (not b!453497) (not bm!30057) (not b!453424) (not b_lambda!9661) (not b!453374) (not b!453470) (not d!74575) (not d!74399) (not b!453708) (not d!74565) (not b!453360) (not d!74555) (not b!453704) (not b!453308) (not b!453591) (not b!453370) (not b_lambda!9667) (not bm!30077) (not b_lambda!9611) (not b!453309) (not b!453621) (not b!453505) (not b!453515) (not b!453451) (not d!74603) (not b!453477) (not b!453632) (not b!453357) (not b!453487) (not b!453643) (not bm!30087) (not b!453700) (not b!453578) (not b!453536) (not b!453742) (not b!453678) (not b_lambda!9673) (not b!453349) (not d!74561) (not d!74535) (not b!453639) (not b!453745) (not b!453456) (not b!453338) (not d!74611) (not mapNonEmpty!19855) (not b!453540) (not bm!30073) (not b!453622) (not d!74601) (not b!453611) (not b!453618) (not b!453367) (not b!453699) (not b!453732) (not d!74441) (not b!453571) (not bm!30056) (not d!74553) (not b!453328) (not d!74409) (not b!453492) (not b!453548) (not d!74577) (not d!74393) (not b!453565) (not b!453575) (not b!453352) (not b!453379) (not b!453466) (not d!74453) (not b!453323) (not b!453463) (not d!74551) (not b!453498) (not b!453350) (not b!453324) (not b!453508) (not b!453509) (not b!453495) (not b_lambda!9675) (not b!453711) (not d!74413) (not b!453572) (not d!74401) (not d!74379) (not b_lambda!9671) (not b!453557) (not b!453425) (not b_lambda!9585) (not b!453368) (not b_next!10803) (not d!74451) (not b!453664) (not b_lambda!9665) (not b!453529) (not b!453706) (not d!74493) (not b!453467) (not bm!30078) (not d!74509) (not b!453356) (not b!453576) (not b!453749) (not b!453532) (not b!453450) (not d!74443) (not b!453528) (not b_lambda!9609) (not b!453461) (not b!453703) (not d!74547) (not b!453689) (not b!453687) (not d!74527) (not b!453668) (not d!74495) (not b!453520) (not b!453695) (not b!453484) (not b!453327) (not b_lambda!9623) (not d!74375) (not b!453569) (not d!74497) (not b!453610) (not b!453604) (not b!453737) (not b!453534) (not b!453486) (not b_lambda!9619) (not b!453330) (not d!74381) (not b_lambda!9659) (not b!453612) (not b!453474) (not b!453649) (not b!453577) (not b!453502) (not b!453348) (not b!453739) (not d!74511) (not bm!30048) (not bm!30081) (not b_lambda!9655) (not b!453625) (not b!453628) (not b!453692) (not b!453485) (not d!74439) (not b!453693) (not b!453365) (not b!453582) (not d!74537) (not b!453696) (not b!453605) (not b!453514))
(check-sat b_and!18947 (not b_next!10803))
