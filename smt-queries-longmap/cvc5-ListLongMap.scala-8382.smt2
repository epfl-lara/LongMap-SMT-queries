; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101966 () Bool)

(assert start!101966)

(declare-fun b!1227528 () Bool)

(declare-fun res!816191 () Bool)

(declare-fun e!696962 () Bool)

(assert (=> b!1227528 (=> (not res!816191) (not e!696962))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227528 (= res!816191 (validKeyInArray!0 k!2913))))

(declare-fun b!1227529 () Bool)

(declare-fun res!816192 () Bool)

(assert (=> b!1227529 (=> (not res!816192) (not e!696962))))

(declare-datatypes ((array!79166 0))(
  ( (array!79167 (arr!38206 (Array (_ BitVec 32) (_ BitVec 64))) (size!38744 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79166)

(declare-datatypes ((List!27080 0))(
  ( (Nil!27077) (Cons!27076 (h!28285 (_ BitVec 64)) (t!40534 List!27080)) )
))
(declare-fun acc!823 () List!27080)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79166 (_ BitVec 32) List!27080) Bool)

(assert (=> b!1227529 (= res!816192 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227530 () Bool)

(declare-fun e!696960 () Bool)

(assert (=> b!1227530 (= e!696962 (not e!696960))))

(declare-fun res!816200 () Bool)

(assert (=> b!1227530 (=> res!816200 e!696960)))

(assert (=> b!1227530 (= res!816200 (bvsgt from!3184 (size!38744 a!3806)))))

(assert (=> b!1227530 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27076 (select (arr!38206 a!3806) from!3184) acc!823))))

(declare-fun b!1227532 () Bool)

(declare-fun res!816199 () Bool)

(assert (=> b!1227532 (=> (not res!816199) (not e!696962))))

(assert (=> b!1227532 (= res!816199 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38744 a!3806)) (bvslt from!3184 (size!38744 a!3806))))))

(declare-fun b!1227533 () Bool)

(declare-fun res!816193 () Bool)

(assert (=> b!1227533 (=> (not res!816193) (not e!696962))))

(declare-fun noDuplicate!1695 (List!27080) Bool)

(assert (=> b!1227533 (= res!816193 (noDuplicate!1695 acc!823))))

(declare-fun b!1227534 () Bool)

(declare-fun res!816188 () Bool)

(assert (=> b!1227534 (=> (not res!816188) (not e!696962))))

(declare-fun arrayContainsKey!0 (array!79166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227534 (= res!816188 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227535 () Bool)

(assert (=> b!1227535 (= e!696960 true)))

(declare-datatypes ((Unit!40503 0))(
  ( (Unit!40504) )
))
(declare-fun lt!558749 () Unit!40503)

(declare-fun noDuplicateSubseq!37 (List!27080 List!27080) Unit!40503)

(assert (=> b!1227535 (= lt!558749 (noDuplicateSubseq!37 Nil!27077 acc!823))))

(declare-fun b!1227536 () Bool)

(declare-fun res!816196 () Bool)

(assert (=> b!1227536 (=> (not res!816196) (not e!696962))))

(assert (=> b!1227536 (= res!816196 (validKeyInArray!0 (select (arr!38206 a!3806) from!3184)))))

(declare-fun b!1227537 () Bool)

(declare-fun res!816189 () Bool)

(assert (=> b!1227537 (=> (not res!816189) (not e!696962))))

(declare-fun contains!7052 (List!27080 (_ BitVec 64)) Bool)

(assert (=> b!1227537 (= res!816189 (not (contains!7052 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227531 () Bool)

(declare-fun res!816190 () Bool)

(assert (=> b!1227531 (=> res!816190 e!696960)))

(assert (=> b!1227531 (= res!816190 (contains!7052 Nil!27077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!816195 () Bool)

(assert (=> start!101966 (=> (not res!816195) (not e!696962))))

(assert (=> start!101966 (= res!816195 (bvslt (size!38744 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101966 e!696962))

(declare-fun array_inv!29189 (array!79166) Bool)

(assert (=> start!101966 (array_inv!29189 a!3806)))

(assert (=> start!101966 true))

(declare-fun b!1227538 () Bool)

(declare-fun res!816194 () Bool)

(assert (=> b!1227538 (=> (not res!816194) (not e!696962))))

(assert (=> b!1227538 (= res!816194 (not (contains!7052 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227539 () Bool)

(declare-fun res!816197 () Bool)

(assert (=> b!1227539 (=> res!816197 e!696960)))

(assert (=> b!1227539 (= res!816197 (contains!7052 Nil!27077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227540 () Bool)

(declare-fun res!816198 () Bool)

(assert (=> b!1227540 (=> res!816198 e!696960)))

(declare-fun subseq!484 (List!27080 List!27080) Bool)

(assert (=> b!1227540 (= res!816198 (not (subseq!484 Nil!27077 acc!823)))))

(assert (= (and start!101966 res!816195) b!1227528))

(assert (= (and b!1227528 res!816191) b!1227532))

(assert (= (and b!1227532 res!816199) b!1227533))

(assert (= (and b!1227533 res!816193) b!1227538))

(assert (= (and b!1227538 res!816194) b!1227537))

(assert (= (and b!1227537 res!816189) b!1227534))

(assert (= (and b!1227534 res!816188) b!1227529))

(assert (= (and b!1227529 res!816192) b!1227536))

(assert (= (and b!1227536 res!816196) b!1227530))

(assert (= (and b!1227530 (not res!816200)) b!1227539))

(assert (= (and b!1227539 (not res!816197)) b!1227531))

(assert (= (and b!1227531 (not res!816190)) b!1227540))

(assert (= (and b!1227540 (not res!816198)) b!1227535))

(declare-fun m!1131803 () Bool)

(assert (=> b!1227529 m!1131803))

(declare-fun m!1131805 () Bool)

(assert (=> b!1227539 m!1131805))

(declare-fun m!1131807 () Bool)

(assert (=> b!1227528 m!1131807))

(declare-fun m!1131809 () Bool)

(assert (=> b!1227537 m!1131809))

(declare-fun m!1131811 () Bool)

(assert (=> b!1227530 m!1131811))

(declare-fun m!1131813 () Bool)

(assert (=> b!1227530 m!1131813))

(declare-fun m!1131815 () Bool)

(assert (=> b!1227540 m!1131815))

(declare-fun m!1131817 () Bool)

(assert (=> b!1227535 m!1131817))

(declare-fun m!1131819 () Bool)

(assert (=> b!1227538 m!1131819))

(declare-fun m!1131821 () Bool)

(assert (=> b!1227533 m!1131821))

(declare-fun m!1131823 () Bool)

(assert (=> b!1227534 m!1131823))

(assert (=> b!1227536 m!1131811))

(assert (=> b!1227536 m!1131811))

(declare-fun m!1131825 () Bool)

(assert (=> b!1227536 m!1131825))

(declare-fun m!1131827 () Bool)

(assert (=> b!1227531 m!1131827))

(declare-fun m!1131829 () Bool)

(assert (=> start!101966 m!1131829))

(push 1)

(assert (not b!1227539))

(assert (not b!1227530))

(assert (not b!1227540))

(assert (not b!1227529))

(assert (not b!1227538))

(assert (not b!1227537))

(assert (not b!1227535))

(assert (not b!1227528))

(assert (not start!101966))

(assert (not b!1227536))

(assert (not b!1227533))

(assert (not b!1227531))

(assert (not b!1227534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

