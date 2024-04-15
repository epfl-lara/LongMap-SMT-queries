; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87840 () Bool)

(assert start!87840)

(declare-fun b!1015026 () Bool)

(assert (=> b!1015026 true))

(assert (=> b!1015026 true))

(declare-fun bs!29335 () Bool)

(declare-fun b!1015030 () Bool)

(assert (= bs!29335 (and b!1015030 b!1015026)))

(declare-fun lambda!833 () Int)

(declare-fun lambda!832 () Int)

(assert (=> bs!29335 (= lambda!833 lambda!832)))

(assert (=> b!1015030 true))

(assert (=> b!1015030 true))

(declare-datatypes ((Unit!33109 0))(
  ( (Unit!33110) )
))
(declare-fun e!570995 () Unit!33109)

(declare-fun lt!448813 () Unit!33109)

(assert (=> b!1015026 (= e!570995 lt!448813)))

(declare-datatypes ((List!21489 0))(
  ( (Nil!21486) (Cons!21485 (h!22683 (_ BitVec 64)) (t!30481 List!21489)) )
))
(declare-fun lt!448812 () List!21489)

(declare-datatypes ((B!1454 0))(
  ( (B!1455 (val!11811 Int)) )
))
(declare-fun value!115 () B!1454)

(declare-datatypes ((tuple2!15248 0))(
  ( (tuple2!15249 (_1!7635 (_ BitVec 64)) (_2!7635 B!1454)) )
))
(declare-datatypes ((List!21490 0))(
  ( (Nil!21487) (Cons!21486 (h!22684 tuple2!15248) (t!30482 List!21490)) )
))
(declare-fun l!412 () List!21490)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!48 (List!21490 List!21489 B!1454 tuple2!15248) Unit!33109)

(assert (=> b!1015026 (= lt!448813 (lemmaForallGetValueByKeySameWithASmallerHead!48 (t!30482 l!412) lt!448812 value!115 (h!22684 l!412)))))

(declare-fun forall!254 (List!21489 Int) Bool)

(assert (=> b!1015026 (forall!254 lt!448812 lambda!832)))

(declare-fun res!680947 () Bool)

(declare-fun e!570993 () Bool)

(assert (=> start!87840 (=> (not res!680947) (not e!570993))))

(declare-fun isStrictlySorted!581 (List!21490) Bool)

(assert (=> start!87840 (= res!680947 (isStrictlySorted!581 l!412))))

(assert (=> start!87840 e!570993))

(declare-fun e!570994 () Bool)

(assert (=> start!87840 e!570994))

(declare-fun tp_is_empty!23521 () Bool)

(assert (=> start!87840 tp_is_empty!23521))

(declare-fun b!1015027 () Bool)

(declare-fun res!680948 () Bool)

(assert (=> b!1015027 (=> (not res!680948) (not e!570993))))

(get-info :version)

(assert (=> b!1015027 (= res!680948 (and (not (= (_2!7635 (h!22684 l!412)) value!115)) ((_ is Cons!21486) l!412)))))

(declare-fun b!1015028 () Bool)

(declare-fun Unit!33111 () Unit!33109)

(assert (=> b!1015028 (= e!570995 Unit!33111)))

(declare-fun b!1015029 () Bool)

(declare-fun tp!70593 () Bool)

(assert (=> b!1015029 (= e!570994 (and tp_is_empty!23521 tp!70593))))

(assert (=> b!1015030 (= e!570993 (not (forall!254 lt!448812 lambda!833)))))

(declare-fun lt!448811 () Unit!33109)

(assert (=> b!1015030 (= lt!448811 e!570995)))

(declare-fun c!102817 () Bool)

(declare-fun isEmpty!857 (List!21489) Bool)

(assert (=> b!1015030 (= c!102817 (not (isEmpty!857 lt!448812)))))

(declare-fun getKeysOf!58 (List!21490 B!1454) List!21489)

(assert (=> b!1015030 (= lt!448812 (getKeysOf!58 (t!30482 l!412) value!115))))

(assert (= (and start!87840 res!680947) b!1015027))

(assert (= (and b!1015027 res!680948) b!1015030))

(assert (= (and b!1015030 c!102817) b!1015026))

(assert (= (and b!1015030 (not c!102817)) b!1015028))

(assert (= (and start!87840 ((_ is Cons!21486) l!412)) b!1015029))

(declare-fun m!936769 () Bool)

(assert (=> b!1015026 m!936769))

(declare-fun m!936771 () Bool)

(assert (=> b!1015026 m!936771))

(declare-fun m!936773 () Bool)

(assert (=> start!87840 m!936773))

(declare-fun m!936775 () Bool)

(assert (=> b!1015030 m!936775))

(declare-fun m!936777 () Bool)

(assert (=> b!1015030 m!936777))

(declare-fun m!936779 () Bool)

(assert (=> b!1015030 m!936779))

(check-sat (not b!1015026) (not start!87840) (not b!1015029) (not b!1015030) tp_is_empty!23521)
(check-sat)
(get-model)

(declare-fun d!120769 () Bool)

(declare-fun res!680965 () Bool)

(declare-fun e!571018 () Bool)

(assert (=> d!120769 (=> res!680965 e!571018)))

(assert (=> d!120769 (= res!680965 ((_ is Nil!21486) lt!448812))))

(assert (=> d!120769 (= (forall!254 lt!448812 lambda!833) e!571018)))

(declare-fun b!1015077 () Bool)

(declare-fun e!571019 () Bool)

(assert (=> b!1015077 (= e!571018 e!571019)))

(declare-fun res!680966 () Bool)

(assert (=> b!1015077 (=> (not res!680966) (not e!571019))))

(declare-fun dynLambda!1888 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015077 (= res!680966 (dynLambda!1888 lambda!833 (h!22683 lt!448812)))))

(declare-fun b!1015078 () Bool)

(assert (=> b!1015078 (= e!571019 (forall!254 (t!30481 lt!448812) lambda!833))))

(assert (= (and d!120769 (not res!680965)) b!1015077))

(assert (= (and b!1015077 res!680966) b!1015078))

(declare-fun b_lambda!15373 () Bool)

(assert (=> (not b_lambda!15373) (not b!1015077)))

(declare-fun m!936805 () Bool)

(assert (=> b!1015077 m!936805))

(declare-fun m!936807 () Bool)

(assert (=> b!1015078 m!936807))

(assert (=> b!1015030 d!120769))

(declare-fun d!120775 () Bool)

(assert (=> d!120775 (= (isEmpty!857 lt!448812) ((_ is Nil!21486) lt!448812))))

(assert (=> b!1015030 d!120775))

(declare-fun bs!29343 () Bool)

(declare-fun b!1015142 () Bool)

(assert (= bs!29343 (and b!1015142 b!1015026)))

(declare-fun lt!448885 () List!21490)

(declare-fun lambda!864 () Int)

(declare-fun lt!448894 () tuple2!15248)

(assert (=> bs!29343 (= (= (Cons!21486 lt!448894 lt!448885) l!412) (= lambda!864 lambda!832))))

(declare-fun bs!29344 () Bool)

(assert (= bs!29344 (and b!1015142 b!1015030)))

(assert (=> bs!29344 (= (= (Cons!21486 lt!448894 lt!448885) l!412) (= lambda!864 lambda!833))))

(assert (=> b!1015142 true))

(assert (=> b!1015142 true))

(assert (=> b!1015142 true))

(declare-fun bs!29345 () Bool)

(declare-fun b!1015144 () Bool)

(assert (= bs!29345 (and b!1015144 b!1015026)))

(declare-fun lambda!865 () Int)

(declare-fun lt!448887 () List!21490)

(declare-fun lt!448890 () tuple2!15248)

(assert (=> bs!29345 (= (= (Cons!21486 lt!448890 lt!448887) l!412) (= lambda!865 lambda!832))))

(declare-fun bs!29346 () Bool)

(assert (= bs!29346 (and b!1015144 b!1015030)))

(assert (=> bs!29346 (= (= (Cons!21486 lt!448890 lt!448887) l!412) (= lambda!865 lambda!833))))

(declare-fun bs!29347 () Bool)

(assert (= bs!29347 (and b!1015144 b!1015142)))

(assert (=> bs!29347 (= (= (Cons!21486 lt!448890 lt!448887) (Cons!21486 lt!448894 lt!448885)) (= lambda!865 lambda!864))))

(assert (=> b!1015144 true))

(assert (=> b!1015144 true))

(assert (=> b!1015144 true))

(declare-fun bs!29350 () Bool)

(declare-fun d!120777 () Bool)

(assert (= bs!29350 (and d!120777 b!1015026)))

(declare-fun lambda!867 () Int)

(assert (=> bs!29350 (= (= (t!30482 l!412) l!412) (= lambda!867 lambda!832))))

(declare-fun bs!29351 () Bool)

(assert (= bs!29351 (and d!120777 b!1015030)))

(assert (=> bs!29351 (= (= (t!30482 l!412) l!412) (= lambda!867 lambda!833))))

(declare-fun bs!29352 () Bool)

(assert (= bs!29352 (and d!120777 b!1015142)))

(assert (=> bs!29352 (= (= (t!30482 l!412) (Cons!21486 lt!448894 lt!448885)) (= lambda!867 lambda!864))))

(declare-fun bs!29353 () Bool)

(assert (= bs!29353 (and d!120777 b!1015144)))

(assert (=> bs!29353 (= (= (t!30482 l!412) (Cons!21486 lt!448890 lt!448887)) (= lambda!867 lambda!865))))

(assert (=> d!120777 true))

(assert (=> d!120777 true))

(declare-fun call!42916 () Bool)

(assert (=> b!1015142 call!42916))

(declare-fun lt!448886 () Unit!33109)

(declare-fun call!42918 () Unit!33109)

(assert (=> b!1015142 (= lt!448886 call!42918)))

(assert (=> b!1015142 (= lt!448894 (h!22684 (t!30482 l!412)))))

(declare-fun lt!448891 () List!21489)

(declare-fun call!42915 () List!21489)

(assert (=> b!1015142 (= lt!448891 call!42915)))

(assert (=> b!1015142 (= lt!448885 (t!30482 (t!30482 l!412)))))

(declare-fun e!571059 () Unit!33109)

(assert (=> b!1015142 (= e!571059 lt!448886)))

(declare-fun lt!448888 () List!21489)

(assert (=> d!120777 (forall!254 lt!448888 lambda!867)))

(declare-fun e!571060 () List!21489)

(assert (=> d!120777 (= lt!448888 e!571060)))

(declare-fun c!102842 () Bool)

(assert (=> d!120777 (= c!102842 (and ((_ is Cons!21486) (t!30482 l!412)) (= (_2!7635 (h!22684 (t!30482 l!412))) value!115)))))

(assert (=> d!120777 (isStrictlySorted!581 (t!30482 l!412))))

(assert (=> d!120777 (= (getKeysOf!58 (t!30482 l!412) value!115) lt!448888)))

(declare-fun b!1015143 () Bool)

(declare-fun e!571062 () List!21489)

(assert (=> b!1015143 (= e!571062 Nil!21486)))

(declare-fun lt!448892 () List!21489)

(declare-fun bm!42912 () Bool)

(assert (=> bm!42912 (= call!42916 (forall!254 (ite c!102842 lt!448891 lt!448892) (ite c!102842 lambda!864 lambda!865)))))

(declare-fun e!571061 () Unit!33109)

(declare-fun lt!448893 () Unit!33109)

(assert (=> b!1015144 (= e!571061 lt!448893)))

(assert (=> b!1015144 (= lt!448887 (t!30482 (t!30482 l!412)))))

(assert (=> b!1015144 (= lt!448892 call!42915)))

(assert (=> b!1015144 (= lt!448890 (h!22684 (t!30482 l!412)))))

(assert (=> b!1015144 (= lt!448893 call!42918)))

(assert (=> b!1015144 call!42916))

(declare-fun b!1015145 () Bool)

(assert (=> b!1015145 (= e!571060 (Cons!21485 (_1!7635 (h!22684 (t!30482 l!412))) call!42915))))

(declare-fun c!102843 () Bool)

(declare-fun call!42917 () Bool)

(assert (=> b!1015145 (= c!102843 (not call!42917))))

(declare-fun lt!448884 () Unit!33109)

(assert (=> b!1015145 (= lt!448884 e!571059)))

(declare-fun b!1015146 () Bool)

(declare-fun lt!448883 () Unit!33109)

(assert (=> b!1015146 (= lt!448883 e!571061)))

(declare-fun c!102841 () Bool)

(assert (=> b!1015146 (= c!102841 (not call!42917))))

(declare-fun lt!448889 () List!21489)

(assert (=> b!1015146 (= lt!448889 call!42915)))

(assert (=> b!1015146 (= e!571062 call!42915)))

(declare-fun bm!42913 () Bool)

(assert (=> bm!42913 (= call!42918 (lemmaForallGetValueByKeySameWithASmallerHead!48 (ite c!102842 lt!448885 lt!448887) (ite c!102842 lt!448891 lt!448892) value!115 (ite c!102842 lt!448894 lt!448890)))))

(declare-fun b!1015147 () Bool)

(declare-fun Unit!33118 () Unit!33109)

(assert (=> b!1015147 (= e!571059 Unit!33118)))

(declare-fun b!1015148 () Bool)

(declare-fun Unit!33119 () Unit!33109)

(assert (=> b!1015148 (= e!571061 Unit!33119)))

(declare-fun bm!42914 () Bool)

(assert (=> bm!42914 (= call!42917 (isEmpty!857 call!42915))))

(declare-fun bm!42915 () Bool)

(assert (=> bm!42915 (= call!42915 (getKeysOf!58 (t!30482 (t!30482 l!412)) value!115))))

(declare-fun b!1015149 () Bool)

(assert (=> b!1015149 (= e!571060 e!571062)))

(declare-fun c!102840 () Bool)

(assert (=> b!1015149 (= c!102840 (and ((_ is Cons!21486) (t!30482 l!412)) (not (= (_2!7635 (h!22684 (t!30482 l!412))) value!115))))))

(assert (= (and d!120777 c!102842) b!1015145))

(assert (= (and d!120777 (not c!102842)) b!1015149))

(assert (= (and b!1015145 c!102843) b!1015142))

(assert (= (and b!1015145 (not c!102843)) b!1015147))

(assert (= (and b!1015149 c!102840) b!1015146))

(assert (= (and b!1015149 (not c!102840)) b!1015143))

(assert (= (and b!1015146 c!102841) b!1015144))

(assert (= (and b!1015146 (not c!102841)) b!1015148))

(assert (= (or b!1015142 b!1015144) bm!42913))

(assert (= (or b!1015142 b!1015144) bm!42912))

(assert (= (or b!1015145 b!1015142 b!1015144 b!1015146) bm!42915))

(assert (= (or b!1015145 b!1015146) bm!42914))

(declare-fun m!936833 () Bool)

(assert (=> bm!42914 m!936833))

(declare-fun m!936835 () Bool)

(assert (=> bm!42913 m!936835))

(declare-fun m!936837 () Bool)

(assert (=> bm!42912 m!936837))

(declare-fun m!936839 () Bool)

(assert (=> bm!42915 m!936839))

(declare-fun m!936841 () Bool)

(assert (=> d!120777 m!936841))

(declare-fun m!936843 () Bool)

(assert (=> d!120777 m!936843))

(assert (=> b!1015030 d!120777))

(declare-fun bs!29361 () Bool)

(declare-fun b!1015175 () Bool)

(assert (= bs!29361 (and b!1015175 b!1015026)))

(declare-fun lambda!874 () Int)

(assert (=> bs!29361 (= (= (t!30482 l!412) l!412) (= lambda!874 lambda!832))))

(declare-fun bs!29362 () Bool)

(assert (= bs!29362 (and b!1015175 b!1015144)))

(assert (=> bs!29362 (= (= (t!30482 l!412) (Cons!21486 lt!448890 lt!448887)) (= lambda!874 lambda!865))))

(declare-fun bs!29363 () Bool)

(assert (= bs!29363 (and b!1015175 d!120777)))

(assert (=> bs!29363 (= lambda!874 lambda!867)))

(declare-fun bs!29364 () Bool)

(assert (= bs!29364 (and b!1015175 b!1015030)))

(assert (=> bs!29364 (= (= (t!30482 l!412) l!412) (= lambda!874 lambda!833))))

(declare-fun bs!29365 () Bool)

(assert (= bs!29365 (and b!1015175 b!1015142)))

(assert (=> bs!29365 (= (= (t!30482 l!412) (Cons!21486 lt!448894 lt!448885)) (= lambda!874 lambda!864))))

(assert (=> b!1015175 true))

(assert (=> b!1015175 true))

(declare-fun bs!29366 () Bool)

(declare-fun d!120793 () Bool)

(assert (= bs!29366 (and d!120793 b!1015026)))

(declare-fun lambda!877 () Int)

(assert (=> bs!29366 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) l!412) (= lambda!877 lambda!832))))

(declare-fun bs!29367 () Bool)

(assert (= bs!29367 (and d!120793 b!1015144)))

(assert (=> bs!29367 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) (Cons!21486 lt!448890 lt!448887)) (= lambda!877 lambda!865))))

(declare-fun bs!29368 () Bool)

(assert (= bs!29368 (and d!120793 d!120777)))

(assert (=> bs!29368 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) (t!30482 l!412)) (= lambda!877 lambda!867))))

(declare-fun bs!29369 () Bool)

(assert (= bs!29369 (and d!120793 b!1015030)))

(assert (=> bs!29369 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) l!412) (= lambda!877 lambda!833))))

(declare-fun bs!29370 () Bool)

(assert (= bs!29370 (and d!120793 b!1015142)))

(assert (=> bs!29370 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) (Cons!21486 lt!448894 lt!448885)) (= lambda!877 lambda!864))))

(declare-fun bs!29371 () Bool)

(assert (= bs!29371 (and d!120793 b!1015175)))

(assert (=> bs!29371 (= (= (Cons!21486 (h!22684 l!412) (t!30482 l!412)) (t!30482 l!412)) (= lambda!877 lambda!874))))

(assert (=> d!120793 true))

(assert (=> d!120793 true))

(assert (=> d!120793 true))

(assert (=> d!120793 (forall!254 lt!448812 lambda!877)))

(declare-fun lt!448909 () Unit!33109)

(declare-fun choose!1648 (List!21490 List!21489 B!1454 tuple2!15248) Unit!33109)

(assert (=> d!120793 (= lt!448909 (choose!1648 (t!30482 l!412) lt!448812 value!115 (h!22684 l!412)))))

(declare-fun e!571075 () Bool)

(assert (=> d!120793 e!571075))

(declare-fun res!681009 () Bool)

(assert (=> d!120793 (=> (not res!681009) (not e!571075))))

(assert (=> d!120793 (= res!681009 (isStrictlySorted!581 (t!30482 l!412)))))

(assert (=> d!120793 (= (lemmaForallGetValueByKeySameWithASmallerHead!48 (t!30482 l!412) lt!448812 value!115 (h!22684 l!412)) lt!448909)))

(declare-fun b!1015174 () Bool)

(declare-fun res!681010 () Bool)

(assert (=> b!1015174 (=> (not res!681010) (not e!571075))))

(declare-fun isEmpty!861 (List!21490) Bool)

(assert (=> b!1015174 (= res!681010 (not (isEmpty!861 (t!30482 l!412))))))

(declare-fun res!681008 () Bool)

(assert (=> b!1015175 (=> (not res!681008) (not e!571075))))

(assert (=> b!1015175 (= res!681008 (forall!254 lt!448812 lambda!874))))

(declare-fun b!1015176 () Bool)

(declare-fun head!947 (List!21490) tuple2!15248)

(assert (=> b!1015176 (= e!571075 (bvslt (_1!7635 (h!22684 l!412)) (_1!7635 (head!947 (t!30482 l!412)))))))

(assert (= (and d!120793 res!681009) b!1015174))

(assert (= (and b!1015174 res!681010) b!1015175))

(assert (= (and b!1015175 res!681008) b!1015176))

(declare-fun m!936857 () Bool)

(assert (=> d!120793 m!936857))

(declare-fun m!936859 () Bool)

(assert (=> d!120793 m!936859))

(assert (=> d!120793 m!936843))

(declare-fun m!936861 () Bool)

(assert (=> b!1015174 m!936861))

(declare-fun m!936863 () Bool)

(assert (=> b!1015175 m!936863))

(declare-fun m!936865 () Bool)

(assert (=> b!1015176 m!936865))

(assert (=> b!1015026 d!120793))

(declare-fun d!120799 () Bool)

(declare-fun res!681017 () Bool)

(declare-fun e!571078 () Bool)

(assert (=> d!120799 (=> res!681017 e!571078)))

(assert (=> d!120799 (= res!681017 ((_ is Nil!21486) lt!448812))))

(assert (=> d!120799 (= (forall!254 lt!448812 lambda!832) e!571078)))

(declare-fun b!1015183 () Bool)

(declare-fun e!571079 () Bool)

(assert (=> b!1015183 (= e!571078 e!571079)))

(declare-fun res!681018 () Bool)

(assert (=> b!1015183 (=> (not res!681018) (not e!571079))))

(assert (=> b!1015183 (= res!681018 (dynLambda!1888 lambda!832 (h!22683 lt!448812)))))

(declare-fun b!1015184 () Bool)

(assert (=> b!1015184 (= e!571079 (forall!254 (t!30481 lt!448812) lambda!832))))

(assert (= (and d!120799 (not res!681017)) b!1015183))

(assert (= (and b!1015183 res!681018) b!1015184))

(declare-fun b_lambda!15381 () Bool)

(assert (=> (not b_lambda!15381) (not b!1015183)))

(declare-fun m!936867 () Bool)

(assert (=> b!1015183 m!936867))

(declare-fun m!936869 () Bool)

(assert (=> b!1015184 m!936869))

(assert (=> b!1015026 d!120799))

(declare-fun d!120801 () Bool)

(declare-fun res!681026 () Bool)

(declare-fun e!571089 () Bool)

(assert (=> d!120801 (=> res!681026 e!571089)))

(assert (=> d!120801 (= res!681026 (or ((_ is Nil!21487) l!412) ((_ is Nil!21487) (t!30482 l!412))))))

(assert (=> d!120801 (= (isStrictlySorted!581 l!412) e!571089)))

(declare-fun b!1015200 () Bool)

(declare-fun e!571090 () Bool)

(assert (=> b!1015200 (= e!571089 e!571090)))

(declare-fun res!681027 () Bool)

(assert (=> b!1015200 (=> (not res!681027) (not e!571090))))

(assert (=> b!1015200 (= res!681027 (bvslt (_1!7635 (h!22684 l!412)) (_1!7635 (h!22684 (t!30482 l!412)))))))

(declare-fun b!1015201 () Bool)

(assert (=> b!1015201 (= e!571090 (isStrictlySorted!581 (t!30482 l!412)))))

(assert (= (and d!120801 (not res!681026)) b!1015200))

(assert (= (and b!1015200 res!681027) b!1015201))

(assert (=> b!1015201 m!936843))

(assert (=> start!87840 d!120801))

(declare-fun b!1015214 () Bool)

(declare-fun e!571097 () Bool)

(declare-fun tp!70602 () Bool)

(assert (=> b!1015214 (= e!571097 (and tp_is_empty!23521 tp!70602))))

(assert (=> b!1015029 (= tp!70593 e!571097)))

(assert (= (and b!1015029 ((_ is Cons!21486) (t!30482 l!412))) b!1015214))

(declare-fun b_lambda!15383 () Bool)

(assert (= b_lambda!15381 (or b!1015026 b_lambda!15383)))

(declare-fun bs!29383 () Bool)

(declare-fun d!120803 () Bool)

(assert (= bs!29383 (and d!120803 b!1015026)))

(declare-datatypes ((Option!587 0))(
  ( (Some!586 (v!14434 B!1454)) (None!585) )
))
(declare-fun getValueByKey!536 (List!21490 (_ BitVec 64)) Option!587)

(assert (=> bs!29383 (= (dynLambda!1888 lambda!832 (h!22683 lt!448812)) (= (getValueByKey!536 l!412 (h!22683 lt!448812)) (Some!586 value!115)))))

(declare-fun m!936881 () Bool)

(assert (=> bs!29383 m!936881))

(assert (=> b!1015183 d!120803))

(declare-fun b_lambda!15385 () Bool)

(assert (= b_lambda!15373 (or b!1015030 b_lambda!15385)))

(declare-fun bs!29384 () Bool)

(declare-fun d!120807 () Bool)

(assert (= bs!29384 (and d!120807 b!1015030)))

(assert (=> bs!29384 (= (dynLambda!1888 lambda!833 (h!22683 lt!448812)) (= (getValueByKey!536 l!412 (h!22683 lt!448812)) (Some!586 value!115)))))

(assert (=> bs!29384 m!936881))

(assert (=> b!1015077 d!120807))

(check-sat (not b!1015201) (not bm!42914) (not b!1015175) (not bs!29383) (not b!1015078) (not b!1015184) (not bm!42915) (not b!1015176) (not bm!42913) tp_is_empty!23521 (not d!120793) (not bs!29384) (not d!120777) (not b_lambda!15385) (not b!1015174) (not bm!42912) (not b!1015214) (not b_lambda!15383))
(check-sat)
