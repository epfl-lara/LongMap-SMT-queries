; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60258 () Bool)

(assert start!60258)

(declare-fun b!675574 () Bool)

(declare-fun res!442011 () Bool)

(declare-fun e!385441 () Bool)

(assert (=> b!675574 (=> (not res!442011) (not e!385441))))

(declare-datatypes ((List!12886 0))(
  ( (Nil!12883) (Cons!12882 (h!13927 (_ BitVec 64)) (t!19114 List!12886)) )
))
(declare-fun acc!681 () List!12886)

(declare-fun contains!3463 (List!12886 (_ BitVec 64)) Bool)

(assert (=> b!675574 (= res!442011 (not (contains!3463 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675575 () Bool)

(declare-fun res!442013 () Bool)

(assert (=> b!675575 (=> (not res!442013) (not e!385441))))

(declare-datatypes ((array!39305 0))(
  ( (array!39306 (arr!18845 (Array (_ BitVec 32) (_ BitVec 64))) (size!19209 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39305)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39305 (_ BitVec 32) List!12886) Bool)

(assert (=> b!675575 (= res!442013 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675576 () Bool)

(declare-fun res!442003 () Bool)

(assert (=> b!675576 (=> (not res!442003) (not e!385441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675576 (= res!442003 (not (validKeyInArray!0 (select (arr!18845 a!3626) from!3004))))))

(declare-fun b!675578 () Bool)

(declare-fun res!442019 () Bool)

(assert (=> b!675578 (=> (not res!442019) (not e!385441))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675578 (= res!442019 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675579 () Bool)

(declare-fun res!442000 () Bool)

(assert (=> b!675579 (=> (not res!442000) (not e!385441))))

(assert (=> b!675579 (= res!442000 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675580 () Bool)

(declare-fun res!442004 () Bool)

(assert (=> b!675580 (=> (not res!442004) (not e!385441))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675580 (= res!442004 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19209 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675581 () Bool)

(declare-fun res!442017 () Bool)

(assert (=> b!675581 (=> (not res!442017) (not e!385441))))

(declare-fun e!385444 () Bool)

(assert (=> b!675581 (= res!442017 e!385444)))

(declare-fun res!442005 () Bool)

(assert (=> b!675581 (=> res!442005 e!385444)))

(declare-fun e!385443 () Bool)

(assert (=> b!675581 (= res!442005 e!385443)))

(declare-fun res!442009 () Bool)

(assert (=> b!675581 (=> (not res!442009) (not e!385443))))

(assert (=> b!675581 (= res!442009 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675582 () Bool)

(declare-fun res!442006 () Bool)

(assert (=> b!675582 (=> (not res!442006) (not e!385441))))

(assert (=> b!675582 (= res!442006 (not (contains!3463 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675583 () Bool)

(declare-fun e!385446 () Bool)

(assert (=> b!675583 (= e!385444 e!385446)))

(declare-fun res!442018 () Bool)

(assert (=> b!675583 (=> (not res!442018) (not e!385446))))

(assert (=> b!675583 (= res!442018 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675584 () Bool)

(declare-fun res!442014 () Bool)

(assert (=> b!675584 (=> (not res!442014) (not e!385441))))

(assert (=> b!675584 (= res!442014 (validKeyInArray!0 k!2843))))

(declare-fun res!442016 () Bool)

(assert (=> start!60258 (=> (not res!442016) (not e!385441))))

(assert (=> start!60258 (= res!442016 (and (bvslt (size!19209 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19209 a!3626))))))

(assert (=> start!60258 e!385441))

(assert (=> start!60258 true))

(declare-fun array_inv!14641 (array!39305) Bool)

(assert (=> start!60258 (array_inv!14641 a!3626)))

(declare-fun b!675577 () Bool)

(declare-fun e!385440 () Bool)

(assert (=> b!675577 (= e!385440 (not (contains!3463 acc!681 k!2843)))))

(declare-fun b!675585 () Bool)

(declare-fun res!442010 () Bool)

(assert (=> b!675585 (=> (not res!442010) (not e!385441))))

(assert (=> b!675585 (= res!442010 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19209 a!3626))))))

(declare-fun b!675586 () Bool)

(declare-fun res!442012 () Bool)

(assert (=> b!675586 (=> (not res!442012) (not e!385441))))

(declare-fun e!385442 () Bool)

(assert (=> b!675586 (= res!442012 e!385442)))

(declare-fun res!442008 () Bool)

(assert (=> b!675586 (=> res!442008 e!385442)))

(declare-fun e!385439 () Bool)

(assert (=> b!675586 (= res!442008 e!385439)))

(declare-fun res!442002 () Bool)

(assert (=> b!675586 (=> (not res!442002) (not e!385439))))

(assert (=> b!675586 (= res!442002 (bvsgt from!3004 i!1382))))

(declare-fun b!675587 () Bool)

(declare-fun res!442001 () Bool)

(assert (=> b!675587 (=> (not res!442001) (not e!385441))))

(declare-fun noDuplicate!710 (List!12886) Bool)

(assert (=> b!675587 (= res!442001 (noDuplicate!710 acc!681))))

(declare-fun b!675588 () Bool)

(assert (=> b!675588 (= e!385446 (not (contains!3463 acc!681 k!2843)))))

(declare-fun b!675589 () Bool)

(declare-fun res!442007 () Bool)

(assert (=> b!675589 (=> (not res!442007) (not e!385441))))

(assert (=> b!675589 (= res!442007 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12883))))

(declare-fun b!675590 () Bool)

(assert (=> b!675590 (= e!385443 (contains!3463 acc!681 k!2843))))

(declare-fun b!675591 () Bool)

(assert (=> b!675591 (= e!385442 e!385440)))

(declare-fun res!442015 () Bool)

(assert (=> b!675591 (=> (not res!442015) (not e!385440))))

(assert (=> b!675591 (= res!442015 (bvsle from!3004 i!1382))))

(declare-fun b!675592 () Bool)

(assert (=> b!675592 (= e!385441 false)))

(declare-fun lt!312733 () Bool)

(assert (=> b!675592 (= lt!312733 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675593 () Bool)

(assert (=> b!675593 (= e!385439 (contains!3463 acc!681 k!2843))))

(assert (= (and start!60258 res!442016) b!675587))

(assert (= (and b!675587 res!442001) b!675574))

(assert (= (and b!675574 res!442011) b!675582))

(assert (= (and b!675582 res!442006) b!675586))

(assert (= (and b!675586 res!442002) b!675593))

(assert (= (and b!675586 (not res!442008)) b!675591))

(assert (= (and b!675591 res!442015) b!675577))

(assert (= (and b!675586 res!442012) b!675589))

(assert (= (and b!675589 res!442007) b!675575))

(assert (= (and b!675575 res!442013) b!675585))

(assert (= (and b!675585 res!442010) b!675584))

(assert (= (and b!675584 res!442014) b!675578))

(assert (= (and b!675578 res!442019) b!675580))

(assert (= (and b!675580 res!442004) b!675576))

(assert (= (and b!675576 res!442003) b!675579))

(assert (= (and b!675579 res!442000) b!675581))

(assert (= (and b!675581 res!442009) b!675590))

(assert (= (and b!675581 (not res!442005)) b!675583))

(assert (= (and b!675583 res!442018) b!675588))

(assert (= (and b!675581 res!442017) b!675592))

(declare-fun m!642947 () Bool)

(assert (=> b!675582 m!642947))

(declare-fun m!642949 () Bool)

(assert (=> b!675577 m!642949))

(assert (=> b!675593 m!642949))

(declare-fun m!642951 () Bool)

(assert (=> b!675574 m!642951))

(assert (=> b!675590 m!642949))

(declare-fun m!642953 () Bool)

(assert (=> b!675592 m!642953))

(declare-fun m!642955 () Bool)

(assert (=> start!60258 m!642955))

(assert (=> b!675588 m!642949))

(declare-fun m!642957 () Bool)

(assert (=> b!675575 m!642957))

(declare-fun m!642959 () Bool)

(assert (=> b!675576 m!642959))

(assert (=> b!675576 m!642959))

(declare-fun m!642961 () Bool)

(assert (=> b!675576 m!642961))

(declare-fun m!642963 () Bool)

(assert (=> b!675589 m!642963))

(declare-fun m!642965 () Bool)

(assert (=> b!675587 m!642965))

(declare-fun m!642967 () Bool)

(assert (=> b!675584 m!642967))

(declare-fun m!642969 () Bool)

(assert (=> b!675578 m!642969))

(push 1)

(assert (not b!675584))

(assert (not b!675574))

(assert (not b!675590))

(assert (not b!675576))

(assert (not b!675587))

(assert (not b!675582))

(assert (not b!675575))

(assert (not b!675593))

(assert (not b!675592))

(assert (not b!675588))

(assert (not b!675577))

(assert (not b!675589))

(assert (not b!675578))

(assert (not start!60258))

(check-sat)

(pop 1)

(push 1)

