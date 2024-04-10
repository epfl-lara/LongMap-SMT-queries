; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138214 () Bool)

(assert start!138214)

(declare-fun res!1082726 () Bool)

(declare-fun e!885093 () Bool)

(assert (=> start!138214 (=> (not res!1082726) (not e!885093))))

(declare-datatypes ((B!2980 0))(
  ( (B!2981 (val!19852 Int)) )
))
(declare-datatypes ((tuple2!25872 0))(
  ( (tuple2!25873 (_1!12947 (_ BitVec 64)) (_2!12947 B!2980)) )
))
(declare-datatypes ((List!36972 0))(
  ( (Nil!36969) (Cons!36968 (h!38511 tuple2!25872) (t!51890 List!36972)) )
))
(declare-fun l!556 () List!36972)

(declare-fun isStrictlySorted!1194 (List!36972) Bool)

(assert (=> start!138214 (= res!1082726 (isStrictlySorted!1194 l!556))))

(assert (=> start!138214 e!885093))

(declare-fun e!885092 () Bool)

(assert (=> start!138214 e!885092))

(assert (=> start!138214 true))

(declare-fun b!1585317 () Bool)

(declare-fun res!1082725 () Bool)

(assert (=> b!1585317 (=> (not res!1082725) (not e!885093))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585317 (= res!1082725 (and ((_ is Cons!36968) l!556) (bvslt (_1!12947 (h!38511 l!556)) newKey!21)))))

(declare-fun b!1585318 () Bool)

(declare-fun ListPrimitiveSize!227 (List!36972) Int)

(assert (=> b!1585318 (= e!885093 (>= (ListPrimitiveSize!227 (t!51890 l!556)) (ListPrimitiveSize!227 l!556)))))

(declare-fun b!1585319 () Bool)

(declare-fun tp_is_empty!39513 () Bool)

(declare-fun tp!115245 () Bool)

(assert (=> b!1585319 (= e!885092 (and tp_is_empty!39513 tp!115245))))

(assert (= (and start!138214 res!1082726) b!1585317))

(assert (= (and b!1585317 res!1082725) b!1585318))

(assert (= (and start!138214 ((_ is Cons!36968) l!556)) b!1585319))

(declare-fun m!1454205 () Bool)

(assert (=> start!138214 m!1454205))

(declare-fun m!1454207 () Bool)

(assert (=> b!1585318 m!1454207))

(declare-fun m!1454209 () Bool)

(assert (=> b!1585318 m!1454209))

(check-sat (not start!138214) (not b!1585318) (not b!1585319) tp_is_empty!39513)
(check-sat)
(get-model)

(declare-fun d!167651 () Bool)

(declare-fun res!1082737 () Bool)

(declare-fun e!885104 () Bool)

(assert (=> d!167651 (=> res!1082737 e!885104)))

(assert (=> d!167651 (= res!1082737 (or ((_ is Nil!36969) l!556) ((_ is Nil!36969) (t!51890 l!556))))))

(assert (=> d!167651 (= (isStrictlySorted!1194 l!556) e!885104)))

(declare-fun b!1585333 () Bool)

(declare-fun e!885105 () Bool)

(assert (=> b!1585333 (= e!885104 e!885105)))

(declare-fun res!1082738 () Bool)

(assert (=> b!1585333 (=> (not res!1082738) (not e!885105))))

(assert (=> b!1585333 (= res!1082738 (bvslt (_1!12947 (h!38511 l!556)) (_1!12947 (h!38511 (t!51890 l!556)))))))

(declare-fun b!1585334 () Bool)

(assert (=> b!1585334 (= e!885105 (isStrictlySorted!1194 (t!51890 l!556)))))

(assert (= (and d!167651 (not res!1082737)) b!1585333))

(assert (= (and b!1585333 res!1082738) b!1585334))

(declare-fun m!1454217 () Bool)

(assert (=> b!1585334 m!1454217))

(assert (=> start!138214 d!167651))

(declare-fun d!167653 () Bool)

(declare-fun lt!677361 () Int)

(assert (=> d!167653 (>= lt!677361 0)))

(declare-fun e!885112 () Int)

(assert (=> d!167653 (= lt!677361 e!885112)))

(declare-fun c!146967 () Bool)

(assert (=> d!167653 (= c!146967 ((_ is Nil!36969) (t!51890 l!556)))))

(assert (=> d!167653 (= (ListPrimitiveSize!227 (t!51890 l!556)) lt!677361)))

(declare-fun b!1585343 () Bool)

(assert (=> b!1585343 (= e!885112 0)))

(declare-fun b!1585344 () Bool)

(assert (=> b!1585344 (= e!885112 (+ 1 (ListPrimitiveSize!227 (t!51890 (t!51890 l!556)))))))

(assert (= (and d!167653 c!146967) b!1585343))

(assert (= (and d!167653 (not c!146967)) b!1585344))

(declare-fun m!1454219 () Bool)

(assert (=> b!1585344 m!1454219))

(assert (=> b!1585318 d!167653))

(declare-fun d!167657 () Bool)

(declare-fun lt!677362 () Int)

(assert (=> d!167657 (>= lt!677362 0)))

(declare-fun e!885113 () Int)

(assert (=> d!167657 (= lt!677362 e!885113)))

(declare-fun c!146968 () Bool)

(assert (=> d!167657 (= c!146968 ((_ is Nil!36969) l!556))))

(assert (=> d!167657 (= (ListPrimitiveSize!227 l!556) lt!677362)))

(declare-fun b!1585345 () Bool)

(assert (=> b!1585345 (= e!885113 0)))

(declare-fun b!1585346 () Bool)

(assert (=> b!1585346 (= e!885113 (+ 1 (ListPrimitiveSize!227 (t!51890 l!556))))))

(assert (= (and d!167657 c!146968) b!1585345))

(assert (= (and d!167657 (not c!146968)) b!1585346))

(assert (=> b!1585346 m!1454207))

(assert (=> b!1585318 d!167657))

(declare-fun b!1585353 () Bool)

(declare-fun e!885118 () Bool)

(declare-fun tp!115251 () Bool)

(assert (=> b!1585353 (= e!885118 (and tp_is_empty!39513 tp!115251))))

(assert (=> b!1585319 (= tp!115245 e!885118)))

(assert (= (and b!1585319 ((_ is Cons!36968) (t!51890 l!556))) b!1585353))

(check-sat (not b!1585344) (not b!1585334) (not b!1585353) (not b!1585346) tp_is_empty!39513)
(check-sat)
