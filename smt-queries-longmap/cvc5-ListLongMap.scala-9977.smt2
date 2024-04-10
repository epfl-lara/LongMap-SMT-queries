; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117798 () Bool)

(assert start!117798)

(declare-fun res!922876 () Bool)

(declare-fun e!782948 () Bool)

(assert (=> start!117798 (=> (not res!922876) (not e!782948))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117798 (= res!922876 (validMask!0 mask!3034))))

(assert (=> start!117798 e!782948))

(assert (=> start!117798 true))

(declare-datatypes ((array!94250 0))(
  ( (array!94251 (arr!45512 (Array (_ BitVec 32) (_ BitVec 64))) (size!46062 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94250)

(declare-fun array_inv!34540 (array!94250) Bool)

(assert (=> start!117798 (array_inv!34540 a!2971)))

(declare-fun b!1381246 () Bool)

(declare-fun res!922874 () Bool)

(assert (=> b!1381246 (=> (not res!922874) (not e!782948))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381246 (= res!922874 (and (= (size!46062 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46062 a!2971))))))

(declare-fun b!1381247 () Bool)

(declare-fun res!922875 () Bool)

(assert (=> b!1381247 (=> (not res!922875) (not e!782948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381247 (= res!922875 (validKeyInArray!0 (select (arr!45512 a!2971) i!1094)))))

(declare-fun b!1381248 () Bool)

(assert (=> b!1381248 (= e!782948 (and (bvsle #b00000000000000000000000000000000 (size!46062 a!2971)) (bvsge (size!46062 a!2971) #b01111111111111111111111111111111)))))

(assert (= (and start!117798 res!922876) b!1381246))

(assert (= (and b!1381246 res!922874) b!1381247))

(assert (= (and b!1381247 res!922875) b!1381248))

(declare-fun m!1266453 () Bool)

(assert (=> start!117798 m!1266453))

(declare-fun m!1266455 () Bool)

(assert (=> start!117798 m!1266455))

(declare-fun m!1266457 () Bool)

(assert (=> b!1381247 m!1266457))

(assert (=> b!1381247 m!1266457))

(declare-fun m!1266459 () Bool)

(assert (=> b!1381247 m!1266459))

(push 1)

(assert (not start!117798))

(assert (not b!1381247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149031 () Bool)

(assert (=> d!149031 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117798 d!149031))

(declare-fun d!149037 () Bool)

(assert (=> d!149037 (= (array_inv!34540 a!2971) (bvsge (size!46062 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117798 d!149037))

(declare-fun d!149039 () Bool)

(assert (=> d!149039 (= (validKeyInArray!0 (select (arr!45512 a!2971) i!1094)) (and (not (= (select (arr!45512 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45512 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381247 d!149039))

(push 1)

(check-sat)

