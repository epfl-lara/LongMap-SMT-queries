; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92156 () Bool)

(assert start!92156)

(declare-fun res!697219 () Bool)

(declare-fun e!594356 () Bool)

(assert (=> start!92156 (=> (not res!697219) (not e!594356))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65999 0))(
  ( (array!66000 (arr!31742 (Array (_ BitVec 32) (_ BitVec 64))) (size!32278 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65999)

(assert (=> start!92156 (= res!697219 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32278 a!3488)) (bvslt (size!32278 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32278 a!3488))))))

(assert (=> start!92156 e!594356))

(assert (=> start!92156 true))

(declare-fun array_inv!24522 (array!65999) Bool)

(assert (=> start!92156 (array_inv!24522 a!3488)))

(declare-fun b!1048056 () Bool)

(declare-fun res!697218 () Bool)

(assert (=> b!1048056 (=> (not res!697218) (not e!594356))))

(declare-datatypes ((List!22054 0))(
  ( (Nil!22051) (Cons!22050 (h!23259 (_ BitVec 64)) (t!31361 List!22054)) )
))
(declare-fun noDuplicate!1489 (List!22054) Bool)

(assert (=> b!1048056 (= res!697218 (noDuplicate!1489 Nil!22051))))

(declare-fun b!1048057 () Bool)

(declare-fun e!594358 () Bool)

(assert (=> b!1048057 (= e!594356 e!594358)))

(declare-fun res!697220 () Bool)

(assert (=> b!1048057 (=> res!697220 e!594358)))

(declare-fun contains!6101 (List!22054 (_ BitVec 64)) Bool)

(assert (=> b!1048057 (= res!697220 (contains!6101 Nil!22051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048058 () Bool)

(assert (=> b!1048058 (= e!594358 (contains!6101 Nil!22051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92156 res!697219) b!1048056))

(assert (= (and b!1048056 res!697218) b!1048057))

(assert (= (and b!1048057 (not res!697220)) b!1048058))

(declare-fun m!969085 () Bool)

(assert (=> start!92156 m!969085))

(declare-fun m!969087 () Bool)

(assert (=> b!1048056 m!969087))

(declare-fun m!969089 () Bool)

(assert (=> b!1048057 m!969089))

(declare-fun m!969091 () Bool)

(assert (=> b!1048058 m!969091))

(check-sat (not b!1048058) (not b!1048057) (not start!92156) (not b!1048056))
(check-sat)
(get-model)

(declare-fun d!127617 () Bool)

(declare-fun lt!463101 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!526 (List!22054) (InoxSet (_ BitVec 64)))

(assert (=> d!127617 (= lt!463101 (select (content!526 Nil!22051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!594373 () Bool)

(assert (=> d!127617 (= lt!463101 e!594373)))

(declare-fun res!697235 () Bool)

(assert (=> d!127617 (=> (not res!697235) (not e!594373))))

(get-info :version)

(assert (=> d!127617 (= res!697235 ((_ is Cons!22050) Nil!22051))))

(assert (=> d!127617 (= (contains!6101 Nil!22051 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463101)))

(declare-fun b!1048072 () Bool)

(declare-fun e!594372 () Bool)

(assert (=> b!1048072 (= e!594373 e!594372)))

(declare-fun res!697234 () Bool)

(assert (=> b!1048072 (=> res!697234 e!594372)))

(assert (=> b!1048072 (= res!697234 (= (h!23259 Nil!22051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048073 () Bool)

(assert (=> b!1048073 (= e!594372 (contains!6101 (t!31361 Nil!22051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127617 res!697235) b!1048072))

(assert (= (and b!1048072 (not res!697234)) b!1048073))

(declare-fun m!969101 () Bool)

(assert (=> d!127617 m!969101))

(declare-fun m!969103 () Bool)

(assert (=> d!127617 m!969103))

(declare-fun m!969105 () Bool)

(assert (=> b!1048073 m!969105))

(assert (=> b!1048058 d!127617))

(declare-fun d!127619 () Bool)

(declare-fun lt!463102 () Bool)

(assert (=> d!127619 (= lt!463102 (select (content!526 Nil!22051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!594375 () Bool)

(assert (=> d!127619 (= lt!463102 e!594375)))

(declare-fun res!697237 () Bool)

(assert (=> d!127619 (=> (not res!697237) (not e!594375))))

(assert (=> d!127619 (= res!697237 ((_ is Cons!22050) Nil!22051))))

(assert (=> d!127619 (= (contains!6101 Nil!22051 #b0000000000000000000000000000000000000000000000000000000000000000) lt!463102)))

(declare-fun b!1048074 () Bool)

(declare-fun e!594374 () Bool)

(assert (=> b!1048074 (= e!594375 e!594374)))

(declare-fun res!697236 () Bool)

(assert (=> b!1048074 (=> res!697236 e!594374)))

(assert (=> b!1048074 (= res!697236 (= (h!23259 Nil!22051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048075 () Bool)

(assert (=> b!1048075 (= e!594374 (contains!6101 (t!31361 Nil!22051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127619 res!697237) b!1048074))

(assert (= (and b!1048074 (not res!697236)) b!1048075))

(assert (=> d!127619 m!969101))

(declare-fun m!969107 () Bool)

(assert (=> d!127619 m!969107))

(declare-fun m!969109 () Bool)

(assert (=> b!1048075 m!969109))

(assert (=> b!1048057 d!127619))

(declare-fun d!127623 () Bool)

(assert (=> d!127623 (= (array_inv!24522 a!3488) (bvsge (size!32278 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92156 d!127623))

(declare-fun d!127627 () Bool)

(declare-fun res!697246 () Bool)

(declare-fun e!594384 () Bool)

(assert (=> d!127627 (=> res!697246 e!594384)))

(assert (=> d!127627 (= res!697246 ((_ is Nil!22051) Nil!22051))))

(assert (=> d!127627 (= (noDuplicate!1489 Nil!22051) e!594384)))

(declare-fun b!1048084 () Bool)

(declare-fun e!594385 () Bool)

(assert (=> b!1048084 (= e!594384 e!594385)))

(declare-fun res!697247 () Bool)

(assert (=> b!1048084 (=> (not res!697247) (not e!594385))))

(assert (=> b!1048084 (= res!697247 (not (contains!6101 (t!31361 Nil!22051) (h!23259 Nil!22051))))))

(declare-fun b!1048085 () Bool)

(assert (=> b!1048085 (= e!594385 (noDuplicate!1489 (t!31361 Nil!22051)))))

(assert (= (and d!127627 (not res!697246)) b!1048084))

(assert (= (and b!1048084 res!697247) b!1048085))

(declare-fun m!969111 () Bool)

(assert (=> b!1048084 m!969111))

(declare-fun m!969113 () Bool)

(assert (=> b!1048085 m!969113))

(assert (=> b!1048056 d!127627))

(check-sat (not b!1048073) (not d!127617) (not b!1048084) (not b!1048075) (not d!127619) (not b!1048085))
(check-sat)
