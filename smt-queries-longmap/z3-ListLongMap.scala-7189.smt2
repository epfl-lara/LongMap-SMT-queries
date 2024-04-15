; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92134 () Bool)

(assert start!92134)

(declare-fun res!697111 () Bool)

(declare-fun e!594218 () Bool)

(assert (=> start!92134 (=> (not res!697111) (not e!594218))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65927 0))(
  ( (array!65928 (arr!31707 (Array (_ BitVec 32) (_ BitVec 64))) (size!32245 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65927)

(assert (=> start!92134 (= res!697111 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32245 a!3488)) (bvslt (size!32245 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32245 a!3488))))))

(assert (=> start!92134 e!594218))

(assert (=> start!92134 true))

(declare-fun array_inv!24490 (array!65927) Bool)

(assert (=> start!92134 (array_inv!24490 a!3488)))

(declare-fun b!1047865 () Bool)

(declare-datatypes ((List!22078 0))(
  ( (Nil!22075) (Cons!22074 (h!23283 (_ BitVec 64)) (t!31376 List!22078)) )
))
(declare-fun noDuplicate!1498 (List!22078) Bool)

(assert (=> b!1047865 (= e!594218 (not (noDuplicate!1498 Nil!22075)))))

(assert (= (and start!92134 res!697111) b!1047865))

(declare-fun m!968437 () Bool)

(assert (=> start!92134 m!968437))

(declare-fun m!968439 () Bool)

(assert (=> b!1047865 m!968439))

(check-sat (not b!1047865) (not start!92134))
(check-sat)
(get-model)

(declare-fun d!127453 () Bool)

(declare-fun res!697122 () Bool)

(declare-fun e!594236 () Bool)

(assert (=> d!127453 (=> res!697122 e!594236)))

(get-info :version)

(assert (=> d!127453 (= res!697122 ((_ is Nil!22075) Nil!22075))))

(assert (=> d!127453 (= (noDuplicate!1498 Nil!22075) e!594236)))

(declare-fun b!1047876 () Bool)

(declare-fun e!594237 () Bool)

(assert (=> b!1047876 (= e!594236 e!594237)))

(declare-fun res!697123 () Bool)

(assert (=> b!1047876 (=> (not res!697123) (not e!594237))))

(declare-fun contains!6072 (List!22078 (_ BitVec 64)) Bool)

(assert (=> b!1047876 (= res!697123 (not (contains!6072 (t!31376 Nil!22075) (h!23283 Nil!22075))))))

(declare-fun b!1047877 () Bool)

(assert (=> b!1047877 (= e!594237 (noDuplicate!1498 (t!31376 Nil!22075)))))

(assert (= (and d!127453 (not res!697122)) b!1047876))

(assert (= (and b!1047876 res!697123) b!1047877))

(declare-fun m!968449 () Bool)

(assert (=> b!1047876 m!968449))

(declare-fun m!968451 () Bool)

(assert (=> b!1047877 m!968451))

(assert (=> b!1047865 d!127453))

(declare-fun d!127457 () Bool)

(assert (=> d!127457 (= (array_inv!24490 a!3488) (bvsge (size!32245 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92134 d!127457))

(check-sat (not b!1047877) (not b!1047876))
(check-sat)
