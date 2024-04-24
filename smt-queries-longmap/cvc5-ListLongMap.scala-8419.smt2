; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102694 () Bool)

(assert start!102694)

(declare-fun res!821287 () Bool)

(declare-fun e!699839 () Bool)

(assert (=> start!102694 (=> (not res!821287) (not e!699839))))

(declare-datatypes ((array!79521 0))(
  ( (array!79522 (arr!38368 (Array (_ BitVec 32) (_ BitVec 64))) (size!38905 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79521)

(assert (=> start!102694 (= res!821287 (bvslt (size!38905 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102694 e!699839))

(declare-fun array_inv!29306 (array!79521) Bool)

(assert (=> start!102694 (array_inv!29306 a!3806)))

(assert (=> start!102694 true))

(declare-fun b!1233700 () Bool)

(assert (=> b!1233700 (= e!699839 (not true))))

(declare-fun e!699838 () Bool)

(assert (=> b!1233700 e!699838))

(declare-fun res!821286 () Bool)

(assert (=> b!1233700 (=> (not res!821286) (not e!699838))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27154 0))(
  ( (Nil!27151) (Cons!27150 (h!28368 (_ BitVec 64)) (t!40609 List!27154)) )
))
(declare-fun arrayNoDuplicates!0 (array!79521 (_ BitVec 32) List!27154) Bool)

(assert (=> b!1233700 (= res!821286 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27151))))

(declare-datatypes ((Unit!40791 0))(
  ( (Unit!40792) )
))
(declare-fun lt!559998 () Unit!40791)

(declare-fun acc!823 () List!27154)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79521 List!27154 List!27154 (_ BitVec 32)) Unit!40791)

(assert (=> b!1233700 (= lt!559998 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27151 from!3184))))

(assert (=> b!1233700 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27150 (select (arr!38368 a!3806) from!3184) acc!823))))

(declare-fun b!1233701 () Bool)

(assert (=> b!1233701 (= e!699838 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27150 (select (arr!38368 a!3806) from!3184) Nil!27151)))))

(declare-fun b!1233702 () Bool)

(declare-fun res!821290 () Bool)

(assert (=> b!1233702 (=> (not res!821290) (not e!699839))))

(assert (=> b!1233702 (= res!821290 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38905 a!3806)) (bvslt from!3184 (size!38905 a!3806))))))

(declare-fun b!1233703 () Bool)

(declare-fun res!821291 () Bool)

(assert (=> b!1233703 (=> (not res!821291) (not e!699839))))

(declare-fun contains!7225 (List!27154 (_ BitVec 64)) Bool)

(assert (=> b!1233703 (= res!821291 (not (contains!7225 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233704 () Bool)

(declare-fun res!821288 () Bool)

(assert (=> b!1233704 (=> (not res!821288) (not e!699839))))

(assert (=> b!1233704 (= res!821288 (not (contains!7225 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233705 () Bool)

(declare-fun res!821293 () Bool)

(assert (=> b!1233705 (=> (not res!821293) (not e!699839))))

(declare-fun noDuplicate!1806 (List!27154) Bool)

(assert (=> b!1233705 (= res!821293 (noDuplicate!1806 acc!823))))

(declare-fun b!1233706 () Bool)

(declare-fun res!821289 () Bool)

(assert (=> b!1233706 (=> (not res!821289) (not e!699839))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233706 (= res!821289 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233707 () Bool)

(declare-fun res!821285 () Bool)

(assert (=> b!1233707 (=> (not res!821285) (not e!699839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233707 (= res!821285 (validKeyInArray!0 k!2913))))

(declare-fun b!1233708 () Bool)

(declare-fun res!821292 () Bool)

(assert (=> b!1233708 (=> (not res!821292) (not e!699839))))

(assert (=> b!1233708 (= res!821292 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233709 () Bool)

(declare-fun res!821294 () Bool)

(assert (=> b!1233709 (=> (not res!821294) (not e!699839))))

(assert (=> b!1233709 (= res!821294 (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)))))

(assert (= (and start!102694 res!821287) b!1233707))

(assert (= (and b!1233707 res!821285) b!1233702))

(assert (= (and b!1233702 res!821290) b!1233705))

(assert (= (and b!1233705 res!821293) b!1233703))

(assert (= (and b!1233703 res!821291) b!1233704))

(assert (= (and b!1233704 res!821288) b!1233706))

(assert (= (and b!1233706 res!821289) b!1233708))

(assert (= (and b!1233708 res!821292) b!1233709))

(assert (= (and b!1233709 res!821294) b!1233700))

(assert (= (and b!1233700 res!821286) b!1233701))

(declare-fun m!1138027 () Bool)

(assert (=> b!1233706 m!1138027))

(declare-fun m!1138029 () Bool)

(assert (=> b!1233700 m!1138029))

(declare-fun m!1138031 () Bool)

(assert (=> b!1233700 m!1138031))

(declare-fun m!1138033 () Bool)

(assert (=> b!1233700 m!1138033))

(declare-fun m!1138035 () Bool)

(assert (=> b!1233700 m!1138035))

(assert (=> b!1233701 m!1138033))

(declare-fun m!1138037 () Bool)

(assert (=> b!1233701 m!1138037))

(declare-fun m!1138039 () Bool)

(assert (=> b!1233708 m!1138039))

(declare-fun m!1138041 () Bool)

(assert (=> b!1233707 m!1138041))

(assert (=> b!1233709 m!1138033))

(assert (=> b!1233709 m!1138033))

(declare-fun m!1138043 () Bool)

(assert (=> b!1233709 m!1138043))

(declare-fun m!1138045 () Bool)

(assert (=> start!102694 m!1138045))

(declare-fun m!1138047 () Bool)

(assert (=> b!1233705 m!1138047))

(declare-fun m!1138049 () Bool)

(assert (=> b!1233703 m!1138049))

(declare-fun m!1138051 () Bool)

(assert (=> b!1233704 m!1138051))

(push 1)

(assert (not b!1233701))

(assert (not start!102694))

(assert (not b!1233706))

(assert (not b!1233705))

(assert (not b!1233704))

(assert (not b!1233700))

(assert (not b!1233707))

(assert (not b!1233709))

(assert (not b!1233703))

(assert (not b!1233708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

