; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117824 () Bool)

(assert start!117824)

(declare-fun b!1381302 () Bool)

(declare-fun e!782977 () Bool)

(declare-datatypes ((List!32051 0))(
  ( (Nil!32048) (Cons!32047 (h!33256 (_ BitVec 64)) (t!46745 List!32051)) )
))
(declare-fun noDuplicate!2590 (List!32051) Bool)

(assert (=> b!1381302 (= e!782977 (not (noDuplicate!2590 Nil!32048)))))

(declare-fun b!1381300 () Bool)

(declare-fun res!922929 () Bool)

(assert (=> b!1381300 (=> (not res!922929) (not e!782977))))

(declare-datatypes ((array!94263 0))(
  ( (array!94264 (arr!45517 (Array (_ BitVec 32) (_ BitVec 64))) (size!46067 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94263)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381300 (= res!922929 (validKeyInArray!0 (select (arr!45517 a!2971) i!1094)))))

(declare-fun b!1381299 () Bool)

(declare-fun res!922927 () Bool)

(assert (=> b!1381299 (=> (not res!922927) (not e!782977))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1381299 (= res!922927 (and (= (size!46067 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46067 a!2971))))))

(declare-fun b!1381301 () Bool)

(declare-fun res!922928 () Bool)

(assert (=> b!1381301 (=> (not res!922928) (not e!782977))))

(assert (=> b!1381301 (= res!922928 (and (bvsle #b00000000000000000000000000000000 (size!46067 a!2971)) (bvslt (size!46067 a!2971) #b01111111111111111111111111111111)))))

(declare-fun res!922930 () Bool)

(assert (=> start!117824 (=> (not res!922930) (not e!782977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117824 (= res!922930 (validMask!0 mask!3034))))

(assert (=> start!117824 e!782977))

(assert (=> start!117824 true))

(declare-fun array_inv!34545 (array!94263) Bool)

(assert (=> start!117824 (array_inv!34545 a!2971)))

(assert (= (and start!117824 res!922930) b!1381299))

(assert (= (and b!1381299 res!922927) b!1381300))

(assert (= (and b!1381300 res!922929) b!1381301))

(assert (= (and b!1381301 res!922928) b!1381302))

(declare-fun m!1266497 () Bool)

(assert (=> b!1381302 m!1266497))

(declare-fun m!1266499 () Bool)

(assert (=> b!1381300 m!1266499))

(assert (=> b!1381300 m!1266499))

(declare-fun m!1266501 () Bool)

(assert (=> b!1381300 m!1266501))

(declare-fun m!1266503 () Bool)

(assert (=> start!117824 m!1266503))

(declare-fun m!1266505 () Bool)

(assert (=> start!117824 m!1266505))

(push 1)

(assert (not b!1381302))

(assert (not start!117824))

(assert (not b!1381300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149051 () Bool)

(declare-fun res!922945 () Bool)

(declare-fun e!782993 () Bool)

(assert (=> d!149051 (=> res!922945 e!782993)))

(assert (=> d!149051 (= res!922945 (is-Nil!32048 Nil!32048))))

(assert (=> d!149051 (= (noDuplicate!2590 Nil!32048) e!782993)))

(declare-fun b!1381315 () Bool)

(declare-fun e!782994 () Bool)

(assert (=> b!1381315 (= e!782993 e!782994)))

(declare-fun res!922946 () Bool)

(assert (=> b!1381315 (=> (not res!922946) (not e!782994))))

(declare-fun contains!9732 (List!32051 (_ BitVec 64)) Bool)

(assert (=> b!1381315 (= res!922946 (not (contains!9732 (t!46745 Nil!32048) (h!33256 Nil!32048))))))

(declare-fun b!1381316 () Bool)

(assert (=> b!1381316 (= e!782994 (noDuplicate!2590 (t!46745 Nil!32048)))))

(assert (= (and d!149051 (not res!922945)) b!1381315))

(assert (= (and b!1381315 res!922946) b!1381316))

(declare-fun m!1266511 () Bool)

(assert (=> b!1381315 m!1266511))

(declare-fun m!1266513 () Bool)

(assert (=> b!1381316 m!1266513))

(assert (=> b!1381302 d!149051))

(declare-fun d!149055 () Bool)

(assert (=> d!149055 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117824 d!149055))

(declare-fun d!149063 () Bool)

(assert (=> d!149063 (= (array_inv!34545 a!2971) (bvsge (size!46067 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117824 d!149063))

(declare-fun d!149065 () Bool)

(assert (=> d!149065 (= (validKeyInArray!0 (select (arr!45517 a!2971) i!1094)) (and (not (= (select (arr!45517 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45517 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

