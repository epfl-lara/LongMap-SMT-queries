; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117850 () Bool)

(assert start!117850)

(declare-fun res!922962 () Bool)

(declare-fun e!783004 () Bool)

(assert (=> start!117850 (=> (not res!922962) (not e!783004))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117850 (= res!922962 (validMask!0 mask!3034))))

(assert (=> start!117850 e!783004))

(assert (=> start!117850 true))

(declare-datatypes ((array!94268 0))(
  ( (array!94269 (arr!45518 (Array (_ BitVec 32) (_ BitVec 64))) (size!46068 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94268)

(declare-fun array_inv!34546 (array!94268) Bool)

(assert (=> start!117850 (array_inv!34546 a!2971)))

(declare-fun b!1381333 () Bool)

(declare-fun e!783003 () Bool)

(assert (=> b!1381333 (= e!783004 e!783003)))

(declare-fun res!922966 () Bool)

(assert (=> b!1381333 (=> res!922966 e!783003)))

(declare-datatypes ((List!32052 0))(
  ( (Nil!32049) (Cons!32048 (h!33257 (_ BitVec 64)) (t!46746 List!32052)) )
))
(declare-fun contains!9733 (List!32052 (_ BitVec 64)) Bool)

(assert (=> b!1381333 (= res!922966 (contains!9733 Nil!32049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381334 () Bool)

(declare-fun res!922964 () Bool)

(assert (=> b!1381334 (=> (not res!922964) (not e!783004))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381334 (= res!922964 (and (= (size!46068 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46068 a!2971))))))

(declare-fun b!1381335 () Bool)

(declare-fun res!922963 () Bool)

(assert (=> b!1381335 (=> (not res!922963) (not e!783004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381335 (= res!922963 (validKeyInArray!0 (select (arr!45518 a!2971) i!1094)))))

(declare-fun b!1381336 () Bool)

(assert (=> b!1381336 (= e!783003 (contains!9733 Nil!32049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381337 () Bool)

(declare-fun res!922965 () Bool)

(assert (=> b!1381337 (=> (not res!922965) (not e!783004))))

(declare-fun noDuplicate!2591 (List!32052) Bool)

(assert (=> b!1381337 (= res!922965 (noDuplicate!2591 Nil!32049))))

(declare-fun b!1381338 () Bool)

(declare-fun res!922961 () Bool)

(assert (=> b!1381338 (=> (not res!922961) (not e!783004))))

(assert (=> b!1381338 (= res!922961 (and (bvsle #b00000000000000000000000000000000 (size!46068 a!2971)) (bvslt (size!46068 a!2971) #b01111111111111111111111111111111)))))

(assert (= (and start!117850 res!922962) b!1381334))

(assert (= (and b!1381334 res!922964) b!1381335))

(assert (= (and b!1381335 res!922963) b!1381338))

(assert (= (and b!1381338 res!922961) b!1381337))

(assert (= (and b!1381337 res!922965) b!1381333))

(assert (= (and b!1381333 (not res!922966)) b!1381336))

(declare-fun m!1266519 () Bool)

(assert (=> b!1381336 m!1266519))

(declare-fun m!1266521 () Bool)

(assert (=> b!1381333 m!1266521))

(declare-fun m!1266523 () Bool)

(assert (=> b!1381337 m!1266523))

(declare-fun m!1266525 () Bool)

(assert (=> start!117850 m!1266525))

(declare-fun m!1266527 () Bool)

(assert (=> start!117850 m!1266527))

(declare-fun m!1266529 () Bool)

(assert (=> b!1381335 m!1266529))

(assert (=> b!1381335 m!1266529))

(declare-fun m!1266531 () Bool)

(assert (=> b!1381335 m!1266531))

(push 1)

(assert (not b!1381335))

(assert (not b!1381333))

(assert (not start!117850))

(assert (not b!1381336))

(assert (not b!1381337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149079 () Bool)

(declare-fun lt!608191 () Bool)

(declare-fun content!757 (List!32052) (Set (_ BitVec 64)))

(assert (=> d!149079 (= lt!608191 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!757 Nil!32049)))))

