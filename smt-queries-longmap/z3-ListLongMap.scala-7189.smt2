; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92138 () Bool)

(assert start!92138)

(declare-fun res!697181 () Bool)

(declare-fun e!594315 () Bool)

(assert (=> start!92138 (=> (not res!697181) (not e!594315))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65990 0))(
  ( (array!65991 (arr!31739 (Array (_ BitVec 32) (_ BitVec 64))) (size!32275 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65990)

(assert (=> start!92138 (= res!697181 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32275 a!3488)) (bvslt (size!32275 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32275 a!3488))))))

(assert (=> start!92138 e!594315))

(assert (=> start!92138 true))

(declare-fun array_inv!24519 (array!65990) Bool)

(assert (=> start!92138 (array_inv!24519 a!3488)))

(declare-fun b!1048019 () Bool)

(declare-datatypes ((List!22051 0))(
  ( (Nil!22048) (Cons!22047 (h!23256 (_ BitVec 64)) (t!31358 List!22051)) )
))
(declare-fun noDuplicate!1486 (List!22051) Bool)

(assert (=> b!1048019 (= e!594315 (not (noDuplicate!1486 Nil!22048)))))

(assert (= (and start!92138 res!697181) b!1048019))

(declare-fun m!969061 () Bool)

(assert (=> start!92138 m!969061))

(declare-fun m!969063 () Bool)

(assert (=> b!1048019 m!969063))

(check-sat (not b!1048019) (not start!92138))
(check-sat)
(get-model)

(declare-fun d!127603 () Bool)

(declare-fun res!697189 () Bool)

(declare-fun e!594327 () Bool)

(assert (=> d!127603 (=> res!697189 e!594327)))

(get-info :version)

(assert (=> d!127603 (= res!697189 ((_ is Nil!22048) Nil!22048))))

(assert (=> d!127603 (= (noDuplicate!1486 Nil!22048) e!594327)))

(declare-fun b!1048027 () Bool)

(declare-fun e!594328 () Bool)

(assert (=> b!1048027 (= e!594327 e!594328)))

(declare-fun res!697190 () Bool)

(assert (=> b!1048027 (=> (not res!697190) (not e!594328))))

(declare-fun contains!6099 (List!22051 (_ BitVec 64)) Bool)

(assert (=> b!1048027 (= res!697190 (not (contains!6099 (t!31358 Nil!22048) (h!23256 Nil!22048))))))

(declare-fun b!1048028 () Bool)

(assert (=> b!1048028 (= e!594328 (noDuplicate!1486 (t!31358 Nil!22048)))))

(assert (= (and d!127603 (not res!697189)) b!1048027))

(assert (= (and b!1048027 res!697190) b!1048028))

(declare-fun m!969069 () Bool)

(assert (=> b!1048027 m!969069))

(declare-fun m!969071 () Bool)

(assert (=> b!1048028 m!969071))

(assert (=> b!1048019 d!127603))

(declare-fun d!127605 () Bool)

(assert (=> d!127605 (= (array_inv!24519 a!3488) (bvsge (size!32275 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92138 d!127605))

(check-sat (not b!1048027) (not b!1048028))
(check-sat)
