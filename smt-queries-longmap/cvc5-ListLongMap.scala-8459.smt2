; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102888 () Bool)

(assert start!102888)

(declare-fun b!1236554 () Bool)

(declare-fun res!824541 () Bool)

(declare-fun e!700874 () Bool)

(assert (=> b!1236554 (=> (not res!824541) (not e!700874))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79733 0))(
  ( (array!79734 (arr!38474 (Array (_ BitVec 32) (_ BitVec 64))) (size!39010 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79733)

(assert (=> b!1236554 (= res!824541 (not (= from!3213 (bvsub (size!39010 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236555 () Bool)

(declare-fun res!824538 () Bool)

(assert (=> b!1236555 (=> (not res!824538) (not e!700874))))

(declare-datatypes ((List!27247 0))(
  ( (Nil!27244) (Cons!27243 (h!28452 (_ BitVec 64)) (t!40710 List!27247)) )
))
(declare-fun acc!846 () List!27247)

(declare-fun contains!7309 (List!27247 (_ BitVec 64)) Bool)

(assert (=> b!1236555 (= res!824538 (not (contains!7309 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236556 () Bool)

(declare-fun res!824540 () Bool)

(assert (=> b!1236556 (=> (not res!824540) (not e!700874))))

(declare-fun noDuplicate!1906 (List!27247) Bool)

(assert (=> b!1236556 (= res!824540 (noDuplicate!1906 acc!846))))

(declare-fun b!1236557 () Bool)

(declare-fun res!824536 () Bool)

(assert (=> b!1236557 (=> (not res!824536) (not e!700874))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236557 (= res!824536 (contains!7309 acc!846 k!2925))))

(declare-fun b!1236558 () Bool)

(declare-fun res!824542 () Bool)

(assert (=> b!1236558 (=> (not res!824542) (not e!700874))))

(assert (=> b!1236558 (= res!824542 (not (contains!7309 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236559 () Bool)

(assert (=> b!1236559 (= e!700874 (not true))))

(declare-fun lt!560815 () List!27247)

(declare-fun subseq!563 (List!27247 List!27247) Bool)

(assert (=> b!1236559 (subseq!563 lt!560815 lt!560815)))

(declare-datatypes ((Unit!41012 0))(
  ( (Unit!41013) )
))
(declare-fun lt!560816 () Unit!41012)

(declare-fun lemmaListSubSeqRefl!0 (List!27247) Unit!41012)

(assert (=> b!1236559 (= lt!560816 (lemmaListSubSeqRefl!0 lt!560815))))

(assert (=> b!1236559 (= lt!560815 (Cons!27243 (select (arr!38474 a!3835) from!3213) acc!846))))

(declare-fun b!1236560 () Bool)

(declare-fun res!824539 () Bool)

(assert (=> b!1236560 (=> (not res!824539) (not e!700874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236560 (= res!824539 (validKeyInArray!0 (select (arr!38474 a!3835) from!3213)))))

(declare-fun b!1236553 () Bool)

(declare-fun res!824535 () Bool)

(assert (=> b!1236553 (=> (not res!824535) (not e!700874))))

(declare-fun arrayNoDuplicates!0 (array!79733 (_ BitVec 32) List!27247) Bool)

(assert (=> b!1236553 (= res!824535 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824537 () Bool)

(assert (=> start!102888 (=> (not res!824537) (not e!700874))))

(assert (=> start!102888 (= res!824537 (and (bvslt (size!39010 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39010 a!3835))))))

(assert (=> start!102888 e!700874))

(declare-fun array_inv!29322 (array!79733) Bool)

(assert (=> start!102888 (array_inv!29322 a!3835)))

(assert (=> start!102888 true))

(assert (= (and start!102888 res!824537) b!1236556))

(assert (= (and b!1236556 res!824540) b!1236558))

(assert (= (and b!1236558 res!824542) b!1236555))

(assert (= (and b!1236555 res!824538) b!1236553))

(assert (= (and b!1236553 res!824535) b!1236557))

(assert (= (and b!1236557 res!824536) b!1236554))

(assert (= (and b!1236554 res!824541) b!1236560))

(assert (= (and b!1236560 res!824539) b!1236559))

(declare-fun m!1140331 () Bool)

(assert (=> b!1236557 m!1140331))

(declare-fun m!1140333 () Bool)

(assert (=> b!1236553 m!1140333))

(declare-fun m!1140335 () Bool)

(assert (=> b!1236555 m!1140335))

(declare-fun m!1140337 () Bool)

(assert (=> b!1236559 m!1140337))

(declare-fun m!1140339 () Bool)

(assert (=> b!1236559 m!1140339))

(declare-fun m!1140341 () Bool)

(assert (=> b!1236559 m!1140341))

(declare-fun m!1140343 () Bool)

(assert (=> start!102888 m!1140343))

(declare-fun m!1140345 () Bool)

(assert (=> b!1236556 m!1140345))

(declare-fun m!1140347 () Bool)

(assert (=> b!1236558 m!1140347))

(assert (=> b!1236560 m!1140341))

(assert (=> b!1236560 m!1140341))

(declare-fun m!1140349 () Bool)

(assert (=> b!1236560 m!1140349))

(push 1)

(assert (not b!1236556))

(assert (not b!1236558))

(assert (not b!1236559))

(assert (not start!102888))

(assert (not b!1236560))

(assert (not b!1236557))

(assert (not b!1236555))

(assert (not b!1236553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

