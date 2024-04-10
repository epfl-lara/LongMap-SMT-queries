; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87494 () Bool)

(assert start!87494)

(declare-fun res!680324 () Bool)

(declare-fun e!569971 () Bool)

(assert (=> start!87494 (=> (not res!680324) (not e!569971))))

(declare-datatypes ((B!1396 0))(
  ( (B!1397 (val!11782 Int)) )
))
(declare-datatypes ((tuple2!15110 0))(
  ( (tuple2!15111 (_1!7566 (_ BitVec 64)) (_2!7566 B!1396)) )
))
(declare-datatypes ((List!21401 0))(
  ( (Nil!21398) (Cons!21397 (h!22595 tuple2!15110) (t!30402 List!21401)) )
))
(declare-fun l!412 () List!21401)

(declare-fun isStrictlySorted!556 (List!21401) Bool)

(assert (=> start!87494 (= res!680324 (isStrictlySorted!556 l!412))))

(assert (=> start!87494 e!569971))

(declare-fun e!569970 () Bool)

(assert (=> start!87494 e!569970))

(declare-fun tp_is_empty!23463 () Bool)

(assert (=> start!87494 tp_is_empty!23463))

(declare-fun b!1013214 () Bool)

(declare-fun res!680325 () Bool)

(assert (=> b!1013214 (=> (not res!680325) (not e!569971))))

(declare-fun value!115 () B!1396)

(get-info :version)

(assert (=> b!1013214 (= res!680325 (and ((_ is Cons!21397) l!412) (= (_2!7566 (h!22595 l!412)) value!115)))))

(declare-fun b!1013215 () Bool)

(declare-fun ListPrimitiveSize!101 (List!21401) Int)

(assert (=> b!1013215 (= e!569971 (>= (ListPrimitiveSize!101 (t!30402 l!412)) (ListPrimitiveSize!101 l!412)))))

(declare-fun b!1013216 () Bool)

(declare-fun tp!70412 () Bool)

(assert (=> b!1013216 (= e!569970 (and tp_is_empty!23463 tp!70412))))

(assert (= (and start!87494 res!680324) b!1013214))

(assert (= (and b!1013214 res!680325) b!1013215))

(assert (= (and start!87494 ((_ is Cons!21397) l!412)) b!1013216))

(declare-fun m!936333 () Bool)

(assert (=> start!87494 m!936333))

(declare-fun m!936335 () Bool)

(assert (=> b!1013215 m!936335))

(declare-fun m!936337 () Bool)

(assert (=> b!1013215 m!936337))

(check-sat (not b!1013215) (not start!87494) (not b!1013216) tp_is_empty!23463)
(check-sat)
(get-model)

(declare-fun d!120409 () Bool)

(declare-fun lt!447891 () Int)

(assert (=> d!120409 (>= lt!447891 0)))

(declare-fun e!569986 () Int)

(assert (=> d!120409 (= lt!447891 e!569986)))

(declare-fun c!102420 () Bool)

(assert (=> d!120409 (= c!102420 ((_ is Nil!21398) (t!30402 l!412)))))

(assert (=> d!120409 (= (ListPrimitiveSize!101 (t!30402 l!412)) lt!447891)))

(declare-fun b!1013242 () Bool)

(assert (=> b!1013242 (= e!569986 0)))

(declare-fun b!1013243 () Bool)

(assert (=> b!1013243 (= e!569986 (+ 1 (ListPrimitiveSize!101 (t!30402 (t!30402 l!412)))))))

(assert (= (and d!120409 c!102420) b!1013242))

(assert (= (and d!120409 (not c!102420)) b!1013243))

(declare-fun m!936347 () Bool)

(assert (=> b!1013243 m!936347))

(assert (=> b!1013215 d!120409))

(declare-fun d!120417 () Bool)

(declare-fun lt!447893 () Int)

(assert (=> d!120417 (>= lt!447893 0)))

(declare-fun e!569990 () Int)

(assert (=> d!120417 (= lt!447893 e!569990)))

(declare-fun c!102422 () Bool)

(assert (=> d!120417 (= c!102422 ((_ is Nil!21398) l!412))))

(assert (=> d!120417 (= (ListPrimitiveSize!101 l!412) lt!447893)))

(declare-fun b!1013248 () Bool)

(assert (=> b!1013248 (= e!569990 0)))

(declare-fun b!1013249 () Bool)

(assert (=> b!1013249 (= e!569990 (+ 1 (ListPrimitiveSize!101 (t!30402 l!412))))))

(assert (= (and d!120417 c!102422) b!1013248))

(assert (= (and d!120417 (not c!102422)) b!1013249))

(assert (=> b!1013249 m!936335))

(assert (=> b!1013215 d!120417))

(declare-fun d!120421 () Bool)

(declare-fun res!680348 () Bool)

(declare-fun e!570009 () Bool)

(assert (=> d!120421 (=> res!680348 e!570009)))

(assert (=> d!120421 (= res!680348 (or ((_ is Nil!21398) l!412) ((_ is Nil!21398) (t!30402 l!412))))))

(assert (=> d!120421 (= (isStrictlySorted!556 l!412) e!570009)))

(declare-fun b!1013271 () Bool)

(declare-fun e!570010 () Bool)

(assert (=> b!1013271 (= e!570009 e!570010)))

(declare-fun res!680349 () Bool)

(assert (=> b!1013271 (=> (not res!680349) (not e!570010))))

(assert (=> b!1013271 (= res!680349 (bvslt (_1!7566 (h!22595 l!412)) (_1!7566 (h!22595 (t!30402 l!412)))))))

(declare-fun b!1013272 () Bool)

(assert (=> b!1013272 (= e!570010 (isStrictlySorted!556 (t!30402 l!412)))))

(assert (= (and d!120421 (not res!680348)) b!1013271))

(assert (= (and b!1013271 res!680349) b!1013272))

(declare-fun m!936355 () Bool)

(assert (=> b!1013272 m!936355))

(assert (=> start!87494 d!120421))

(declare-fun b!1013282 () Bool)

(declare-fun e!570016 () Bool)

(declare-fun tp!70424 () Bool)

(assert (=> b!1013282 (= e!570016 (and tp_is_empty!23463 tp!70424))))

(assert (=> b!1013216 (= tp!70412 e!570016)))

(assert (= (and b!1013216 ((_ is Cons!21397) (t!30402 l!412))) b!1013282))

(check-sat tp_is_empty!23463 (not b!1013272) (not b!1013243) (not b!1013249) (not b!1013282))
(check-sat)
