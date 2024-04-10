; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7108 () Bool)

(assert start!7108)

(declare-fun b!45546 () Bool)

(declare-fun res!26717 () Bool)

(declare-fun e!28994 () Bool)

(assert (=> b!45546 (=> (not res!26717) (not e!28994))))

(declare-datatypes ((B!830 0))(
  ( (B!831 (val!1002 Int)) )
))
(declare-datatypes ((tuple2!1652 0))(
  ( (tuple2!1653 (_1!837 (_ BitVec 64)) (_2!837 B!830)) )
))
(declare-datatypes ((List!1220 0))(
  ( (Nil!1217) (Cons!1216 (h!1796 tuple2!1652) (t!4245 List!1220)) )
))
(declare-fun l!812 () List!1220)

(assert (=> b!45546 (= res!26717 (is-Cons!1216 l!812))))

(declare-fun res!26716 () Bool)

(assert (=> start!7108 (=> (not res!26716) (not e!28994))))

(declare-fun isStrictlySorted!217 (List!1220) Bool)

(assert (=> start!7108 (= res!26716 (isStrictlySorted!217 l!812))))

(assert (=> start!7108 e!28994))

(declare-fun e!28993 () Bool)

(assert (=> start!7108 e!28993))

(assert (=> start!7108 true))

(declare-fun b!45549 () Bool)

(declare-fun tp_is_empty!1927 () Bool)

(declare-fun tp!5984 () Bool)

(assert (=> b!45549 (= e!28993 (and tp_is_empty!1927 tp!5984))))

(declare-fun b!45548 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!27 (List!1220 (_ BitVec 64)) List!1220)

(assert (=> b!45548 (= e!28994 (not (isStrictlySorted!217 (removeStrictlySorted!27 l!812 key1!43))))))

(declare-fun key2!27 () (_ BitVec 64))

(assert (=> b!45548 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key1!43) key2!27) (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1303 0))(
  ( (Unit!1304) )
))
(declare-fun lt!20173 () Unit!1303)

(declare-fun lemmaRemoveStrictlySortedCommutative!7 (List!1220 (_ BitVec 64) (_ BitVec 64)) Unit!1303)

(assert (=> b!45548 (= lt!20173 (lemmaRemoveStrictlySortedCommutative!7 (t!4245 l!812) key1!43 key2!27))))

(declare-fun b!45547 () Bool)

(declare-fun res!26718 () Bool)

(assert (=> b!45547 (=> (not res!26718) (not e!28994))))

(assert (=> b!45547 (= res!26718 (isStrictlySorted!217 (t!4245 l!812)))))

(assert (= (and start!7108 res!26716) b!45546))

(assert (= (and b!45546 res!26717) b!45547))

(assert (= (and b!45547 res!26718) b!45548))

(assert (= (and start!7108 (is-Cons!1216 l!812)) b!45549))

(declare-fun m!40089 () Bool)

(assert (=> start!7108 m!40089))

(declare-fun m!40091 () Bool)

(assert (=> b!45548 m!40091))

(declare-fun m!40093 () Bool)

(assert (=> b!45548 m!40093))

(declare-fun m!40095 () Bool)

(assert (=> b!45548 m!40095))

(assert (=> b!45548 m!40091))

(declare-fun m!40097 () Bool)

(assert (=> b!45548 m!40097))

(declare-fun m!40099 () Bool)

(assert (=> b!45548 m!40099))

(declare-fun m!40101 () Bool)

(assert (=> b!45548 m!40101))

(assert (=> b!45548 m!40097))

(assert (=> b!45548 m!40095))

(declare-fun m!40103 () Bool)

(assert (=> b!45548 m!40103))

(declare-fun m!40105 () Bool)

(assert (=> b!45547 m!40105))

(push 1)

(assert (not b!45549))

(assert (not b!45548))

(assert (not b!45547))

(assert tp_is_empty!1927)

(assert (not start!7108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8877 () Bool)

(declare-fun res!26745 () Bool)

(declare-fun e!29015 () Bool)

(assert (=> d!8877 (=> res!26745 e!29015)))

(assert (=> d!8877 (= res!26745 (or (is-Nil!1217 l!812) (is-Nil!1217 (t!4245 l!812))))))

(assert (=> d!8877 (= (isStrictlySorted!217 l!812) e!29015)))

(declare-fun b!45580 () Bool)

(declare-fun e!29016 () Bool)

(assert (=> b!45580 (= e!29015 e!29016)))

(declare-fun res!26746 () Bool)

(assert (=> b!45580 (=> (not res!26746) (not e!29016))))

(assert (=> b!45580 (= res!26746 (bvslt (_1!837 (h!1796 l!812)) (_1!837 (h!1796 (t!4245 l!812)))))))

(declare-fun b!45581 () Bool)

(assert (=> b!45581 (= e!29016 (isStrictlySorted!217 (t!4245 l!812)))))

(assert (= (and d!8877 (not res!26745)) b!45580))

(assert (= (and b!45580 res!26746) b!45581))

(assert (=> b!45581 m!40105))

(assert (=> start!7108 d!8877))

(declare-fun b!45631 () Bool)

(declare-fun e!29046 () Bool)

(declare-fun lt!20192 () List!1220)

(declare-fun containsKey!79 (List!1220 (_ BitVec 64)) Bool)

(assert (=> b!45631 (= e!29046 (not (containsKey!79 lt!20192 key1!43)))))

(declare-fun b!45632 () Bool)

(declare-fun e!29048 () List!1220)

(declare-fun $colon$colon!33 (List!1220 tuple2!1652) List!1220)

(assert (=> b!45632 (= e!29048 ($colon$colon!33 (removeStrictlySorted!27 (t!4245 l!812) key1!43) (h!1796 l!812)))))

(declare-fun b!45634 () Bool)

(assert (=> b!45634 (= e!29048 Nil!1217)))

(declare-fun b!45635 () Bool)

(declare-fun e!29047 () List!1220)

(assert (=> b!45635 (= e!29047 (t!4245 l!812))))

(declare-fun d!8883 () Bool)

(assert (=> d!8883 e!29046))

(declare-fun res!26758 () Bool)

(assert (=> d!8883 (=> (not res!26758) (not e!29046))))

(assert (=> d!8883 (= res!26758 (isStrictlySorted!217 lt!20192))))

(assert (=> d!8883 (= lt!20192 e!29047)))

(declare-fun c!6143 () Bool)

(assert (=> d!8883 (= c!6143 (and (is-Cons!1216 l!812) (= (_1!837 (h!1796 l!812)) key1!43)))))

(assert (=> d!8883 (isStrictlySorted!217 l!812)))

(assert (=> d!8883 (= (removeStrictlySorted!27 l!812 key1!43) lt!20192)))

(declare-fun b!45633 () Bool)

(assert (=> b!45633 (= e!29047 e!29048)))

(declare-fun c!6142 () Bool)

(assert (=> b!45633 (= c!6142 (and (is-Cons!1216 l!812) (not (= (_1!837 (h!1796 l!812)) key1!43))))))

(assert (= (and d!8883 c!6143) b!45635))

(assert (= (and d!8883 (not c!6143)) b!45633))

(assert (= (and b!45633 c!6142) b!45632))

(assert (= (and b!45633 (not c!6142)) b!45634))

(assert (= (and d!8883 res!26758) b!45631))

(declare-fun m!40165 () Bool)

(assert (=> b!45631 m!40165))

(assert (=> b!45632 m!40091))

(assert (=> b!45632 m!40091))

(declare-fun m!40167 () Bool)

(assert (=> b!45632 m!40167))

(declare-fun m!40169 () Bool)

(assert (=> d!8883 m!40169))

(assert (=> d!8883 m!40089))

(assert (=> b!45548 d!8883))

(declare-fun b!45646 () Bool)

(declare-fun e!29055 () Bool)

(declare-fun lt!20195 () List!1220)

(assert (=> b!45646 (= e!29055 (not (containsKey!79 lt!20195 key2!27)))))

(declare-fun b!45647 () Bool)

(declare-fun e!29057 () List!1220)

(assert (=> b!45647 (= e!29057 ($colon$colon!33 (removeStrictlySorted!27 (t!4245 (t!4245 l!812)) key2!27) (h!1796 (t!4245 l!812))))))

(declare-fun b!45649 () Bool)

(assert (=> b!45649 (= e!29057 Nil!1217)))

(declare-fun b!45650 () Bool)

(declare-fun e!29056 () List!1220)

(assert (=> b!45650 (= e!29056 (t!4245 (t!4245 l!812)))))

(declare-fun d!8895 () Bool)

(assert (=> d!8895 e!29055))

(declare-fun res!26761 () Bool)

(assert (=> d!8895 (=> (not res!26761) (not e!29055))))

(assert (=> d!8895 (= res!26761 (isStrictlySorted!217 lt!20195))))

(assert (=> d!8895 (= lt!20195 e!29056)))

(declare-fun c!6149 () Bool)

(assert (=> d!8895 (= c!6149 (and (is-Cons!1216 (t!4245 l!812)) (= (_1!837 (h!1796 (t!4245 l!812))) key2!27)))))

(assert (=> d!8895 (isStrictlySorted!217 (t!4245 l!812))))

(assert (=> d!8895 (= (removeStrictlySorted!27 (t!4245 l!812) key2!27) lt!20195)))

(declare-fun b!45648 () Bool)

(assert (=> b!45648 (= e!29056 e!29057)))

(declare-fun c!6148 () Bool)

(assert (=> b!45648 (= c!6148 (and (is-Cons!1216 (t!4245 l!812)) (not (= (_1!837 (h!1796 (t!4245 l!812))) key2!27))))))

(assert (= (and d!8895 c!6149) b!45650))

(assert (= (and d!8895 (not c!6149)) b!45648))

(assert (= (and b!45648 c!6148) b!45647))

(assert (= (and b!45648 (not c!6148)) b!45649))

(assert (= (and d!8895 res!26761) b!45646))

(declare-fun m!40189 () Bool)

(assert (=> b!45646 m!40189))

(declare-fun m!40191 () Bool)

(assert (=> b!45647 m!40191))

(assert (=> b!45647 m!40191))

(declare-fun m!40193 () Bool)

(assert (=> b!45647 m!40193))

(declare-fun m!40195 () Bool)

(assert (=> d!8895 m!40195))

(assert (=> d!8895 m!40105))

(assert (=> b!45548 d!8895))

(declare-fun d!8901 () Bool)

(assert (=> d!8901 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key1!43) key2!27) (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key2!27) key1!43))))

(declare-fun lt!20205 () Unit!1303)

(declare-fun choose!272 (List!1220 (_ BitVec 64) (_ BitVec 64)) Unit!1303)

(assert (=> d!8901 (= lt!20205 (choose!272 (t!4245 l!812) key1!43 key2!27))))

(assert (=> d!8901 (isStrictlySorted!217 (t!4245 l!812))))

(assert (=> d!8901 (= (lemmaRemoveStrictlySortedCommutative!7 (t!4245 l!812) key1!43 key2!27) lt!20205)))

(declare-fun bs!2148 () Bool)

(assert (= bs!2148 d!8901))

(assert (=> bs!2148 m!40091))

(assert (=> bs!2148 m!40097))

(assert (=> bs!2148 m!40099))

(declare-fun m!40241 () Bool)

(assert (=> bs!2148 m!40241))

(assert (=> bs!2148 m!40091))

(assert (=> bs!2148 m!40093))

(assert (=> bs!2148 m!40097))

(assert (=> bs!2148 m!40105))

(assert (=> b!45548 d!8901))

(declare-fun b!45690 () Bool)

(declare-fun e!29085 () Bool)

(declare-fun lt!20207 () List!1220)

(assert (=> b!45690 (= e!29085 (not (containsKey!79 lt!20207 key2!27)))))

(declare-fun b!45691 () Bool)

(declare-fun e!29087 () List!1220)

(assert (=> b!45691 (= e!29087 ($colon$colon!33 (removeStrictlySorted!27 (t!4245 (removeStrictlySorted!27 (t!4245 l!812) key1!43)) key2!27) (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key1!43))))))

(declare-fun b!45693 () Bool)

(assert (=> b!45693 (= e!29087 Nil!1217)))

(declare-fun b!45694 () Bool)

(declare-fun e!29086 () List!1220)

(assert (=> b!45694 (= e!29086 (t!4245 (removeStrictlySorted!27 (t!4245 l!812) key1!43)))))

(declare-fun d!8917 () Bool)

(assert (=> d!8917 e!29085))

(declare-fun res!26777 () Bool)

(assert (=> d!8917 (=> (not res!26777) (not e!29085))))

(assert (=> d!8917 (= res!26777 (isStrictlySorted!217 lt!20207))))

(assert (=> d!8917 (= lt!20207 e!29086)))

(declare-fun c!6161 () Bool)

(assert (=> d!8917 (= c!6161 (and (is-Cons!1216 (removeStrictlySorted!27 (t!4245 l!812) key1!43)) (= (_1!837 (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key1!43))) key2!27)))))

(assert (=> d!8917 (isStrictlySorted!217 (removeStrictlySorted!27 (t!4245 l!812) key1!43))))

(assert (=> d!8917 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key1!43) key2!27) lt!20207)))

(declare-fun b!45692 () Bool)

(assert (=> b!45692 (= e!29086 e!29087)))

(declare-fun c!6160 () Bool)

(assert (=> b!45692 (= c!6160 (and (is-Cons!1216 (removeStrictlySorted!27 (t!4245 l!812) key1!43)) (not (= (_1!837 (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key1!43))) key2!27))))))

(assert (= (and d!8917 c!6161) b!45694))

(assert (= (and d!8917 (not c!6161)) b!45692))

(assert (= (and b!45692 c!6160) b!45691))

(assert (= (and b!45692 (not c!6160)) b!45693))

(assert (= (and d!8917 res!26777) b!45690))

(declare-fun m!40251 () Bool)

(assert (=> b!45690 m!40251))

(declare-fun m!40253 () Bool)

(assert (=> b!45691 m!40253))

(assert (=> b!45691 m!40253))

(declare-fun m!40255 () Bool)

(assert (=> b!45691 m!40255))

(declare-fun m!40257 () Bool)

(assert (=> d!8917 m!40257))

(assert (=> d!8917 m!40091))

(declare-fun m!40259 () Bool)

(assert (=> d!8917 m!40259))

(assert (=> b!45548 d!8917))

(declare-fun b!45698 () Bool)

(declare-fun e!29091 () Bool)

(declare-fun lt!20208 () List!1220)

(assert (=> b!45698 (= e!29091 (not (containsKey!79 lt!20208 key1!43)))))

(declare-fun b!45699 () Bool)

(declare-fun e!29093 () List!1220)

(assert (=> b!45699 (= e!29093 ($colon$colon!33 (removeStrictlySorted!27 (t!4245 (removeStrictlySorted!27 (t!4245 l!812) key2!27)) key1!43) (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key2!27))))))

(declare-fun b!45701 () Bool)

(assert (=> b!45701 (= e!29093 Nil!1217)))

(declare-fun b!45702 () Bool)

(declare-fun e!29092 () List!1220)

(assert (=> b!45702 (= e!29092 (t!4245 (removeStrictlySorted!27 (t!4245 l!812) key2!27)))))

(declare-fun d!8921 () Bool)

(assert (=> d!8921 e!29091))

(declare-fun res!26780 () Bool)

(assert (=> d!8921 (=> (not res!26780) (not e!29091))))

(assert (=> d!8921 (= res!26780 (isStrictlySorted!217 lt!20208))))

(assert (=> d!8921 (= lt!20208 e!29092)))

(declare-fun c!6163 () Bool)

(assert (=> d!8921 (= c!6163 (and (is-Cons!1216 (removeStrictlySorted!27 (t!4245 l!812) key2!27)) (= (_1!837 (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key2!27))) key1!43)))))

(assert (=> d!8921 (isStrictlySorted!217 (removeStrictlySorted!27 (t!4245 l!812) key2!27))))

(assert (=> d!8921 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4245 l!812) key2!27) key1!43) lt!20208)))

(declare-fun b!45700 () Bool)

(assert (=> b!45700 (= e!29092 e!29093)))

(declare-fun c!6162 () Bool)

(assert (=> b!45700 (= c!6162 (and (is-Cons!1216 (removeStrictlySorted!27 (t!4245 l!812) key2!27)) (not (= (_1!837 (h!1796 (removeStrictlySorted!27 (t!4245 l!812) key2!27))) key1!43))))))

(assert (= (and d!8921 c!6163) b!45702))

(assert (= (and d!8921 (not c!6163)) b!45700))

(assert (= (and b!45700 c!6162) b!45699))

(assert (= (and b!45700 (not c!6162)) b!45701))

(assert (= (and d!8921 res!26780) b!45698))

(declare-fun m!40263 () Bool)

(assert (=> b!45698 m!40263))

(declare-fun m!40265 () Bool)

(assert (=> b!45699 m!40265))

(assert (=> b!45699 m!40265))

(declare-fun m!40269 () Bool)

(assert (=> b!45699 m!40269))

(declare-fun m!40271 () Bool)

(assert (=> d!8921 m!40271))

(assert (=> d!8921 m!40097))

(declare-fun m!40273 () Bool)

(assert (=> d!8921 m!40273))

(assert (=> b!45548 d!8921))

(declare-fun b!45709 () Bool)

(declare-fun e!29098 () Bool)

(declare-fun lt!20209 () List!1220)

(assert (=> b!45709 (= e!29098 (not (containsKey!79 lt!20209 key1!43)))))

(declare-fun b!45710 () Bool)

(declare-fun e!29100 () List!1220)

(assert (=> b!45710 (= e!29100 ($colon$colon!33 (removeStrictlySorted!27 (t!4245 (t!4245 l!812)) key1!43) (h!1796 (t!4245 l!812))))))

(declare-fun b!45712 () Bool)

(assert (=> b!45712 (= e!29100 Nil!1217)))

(declare-fun b!45713 () Bool)

(declare-fun e!29099 () List!1220)

(assert (=> b!45713 (= e!29099 (t!4245 (t!4245 l!812)))))

(declare-fun d!8925 () Bool)

(assert (=> d!8925 e!29098))

(declare-fun res!26783 () Bool)

(assert (=> d!8925 (=> (not res!26783) (not e!29098))))

(assert (=> d!8925 (= res!26783 (isStrictlySorted!217 lt!20209))))

(assert (=> d!8925 (= lt!20209 e!29099)))

(declare-fun c!6165 () Bool)

(assert (=> d!8925 (= c!6165 (and (is-Cons!1216 (t!4245 l!812)) (= (_1!837 (h!1796 (t!4245 l!812))) key1!43)))))

(assert (=> d!8925 (isStrictlySorted!217 (t!4245 l!812))))

(assert (=> d!8925 (= (removeStrictlySorted!27 (t!4245 l!812) key1!43) lt!20209)))

(declare-fun b!45711 () Bool)

(assert (=> b!45711 (= e!29099 e!29100)))

(declare-fun c!6164 () Bool)

(assert (=> b!45711 (= c!6164 (and (is-Cons!1216 (t!4245 l!812)) (not (= (_1!837 (h!1796 (t!4245 l!812))) key1!43))))))

(assert (= (and d!8925 c!6165) b!45713))

(assert (= (and d!8925 (not c!6165)) b!45711))

(assert (= (and b!45711 c!6164) b!45710))

(assert (= (and b!45711 (not c!6164)) b!45712))

(assert (= (and d!8925 res!26783) b!45709))

(declare-fun m!40275 () Bool)

(assert (=> b!45709 m!40275))

(declare-fun m!40277 () Bool)

(assert (=> b!45710 m!40277))

(assert (=> b!45710 m!40277))

(declare-fun m!40279 () Bool)

(assert (=> b!45710 m!40279))

(declare-fun m!40281 () Bool)

(assert (=> d!8925 m!40281))

(assert (=> d!8925 m!40105))

(assert (=> b!45548 d!8925))

(declare-fun d!8927 () Bool)

(declare-fun res!26784 () Bool)

(declare-fun e!29101 () Bool)

(assert (=> d!8927 (=> res!26784 e!29101)))

(assert (=> d!8927 (= res!26784 (or (is-Nil!1217 (removeStrictlySorted!27 l!812 key1!43)) (is-Nil!1217 (t!4245 (removeStrictlySorted!27 l!812 key1!43)))))))

(assert (=> d!8927 (= (isStrictlySorted!217 (removeStrictlySorted!27 l!812 key1!43)) e!29101)))

(declare-fun b!45714 () Bool)

(declare-fun e!29102 () Bool)

(assert (=> b!45714 (= e!29101 e!29102)))

(declare-fun res!26785 () Bool)

(assert (=> b!45714 (=> (not res!26785) (not e!29102))))

(assert (=> b!45714 (= res!26785 (bvslt (_1!837 (h!1796 (removeStrictlySorted!27 l!812 key1!43))) (_1!837 (h!1796 (t!4245 (removeStrictlySorted!27 l!812 key1!43))))))))

(declare-fun b!45715 () Bool)

(assert (=> b!45715 (= e!29102 (isStrictlySorted!217 (t!4245 (removeStrictlySorted!27 l!812 key1!43))))))

(assert (= (and d!8927 (not res!26784)) b!45714))

(assert (= (and b!45714 res!26785) b!45715))

(declare-fun m!40283 () Bool)

(assert (=> b!45715 m!40283))

(assert (=> b!45548 d!8927))

(declare-fun d!8929 () Bool)

(declare-fun res!26786 () Bool)

(declare-fun e!29104 () Bool)

(assert (=> d!8929 (=> res!26786 e!29104)))

(assert (=> d!8929 (= res!26786 (or (is-Nil!1217 (t!4245 l!812)) (is-Nil!1217 (t!4245 (t!4245 l!812)))))))

(assert (=> d!8929 (= (isStrictlySorted!217 (t!4245 l!812)) e!29104)))

(declare-fun b!45717 () Bool)

(declare-fun e!29105 () Bool)

(assert (=> b!45717 (= e!29104 e!29105)))

(declare-fun res!26787 () Bool)

(assert (=> b!45717 (=> (not res!26787) (not e!29105))))

(assert (=> b!45717 (= res!26787 (bvslt (_1!837 (h!1796 (t!4245 l!812))) (_1!837 (h!1796 (t!4245 (t!4245 l!812))))))))

(declare-fun b!45718 () Bool)

(assert (=> b!45718 (= e!29105 (isStrictlySorted!217 (t!4245 (t!4245 l!812))))))

(assert (= (and d!8929 (not res!26786)) b!45717))

(assert (= (and b!45717 res!26787) b!45718))

(declare-fun m!40285 () Bool)

(assert (=> b!45718 m!40285))

(assert (=> b!45547 d!8929))

(declare-fun b!45723 () Bool)

(declare-fun e!29108 () Bool)

(declare-fun tp!5999 () Bool)

(assert (=> b!45723 (= e!29108 (and tp_is_empty!1927 tp!5999))))

(assert (=> b!45549 (= tp!5984 e!29108)))

(assert (= (and b!45549 (is-Cons!1216 (t!4245 l!812))) b!45723))

(push 1)

