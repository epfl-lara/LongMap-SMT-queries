; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60242 () Bool)

(assert start!60242)

(declare-fun res!441524 () Bool)

(declare-fun e!385250 () Bool)

(assert (=> start!60242 (=> (not res!441524) (not e!385250))))

(declare-datatypes ((array!39289 0))(
  ( (array!39290 (arr!18837 (Array (_ BitVec 32) (_ BitVec 64))) (size!19201 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39289)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60242 (= res!441524 (and (bvslt (size!19201 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19201 a!3626))))))

(assert (=> start!60242 e!385250))

(assert (=> start!60242 true))

(declare-fun array_inv!14633 (array!39289) Bool)

(assert (=> start!60242 (array_inv!14633 a!3626)))

(declare-fun b!675094 () Bool)

(declare-fun e!385248 () Bool)

(declare-datatypes ((List!12878 0))(
  ( (Nil!12875) (Cons!12874 (h!13919 (_ BitVec 64)) (t!19106 List!12878)) )
))
(declare-fun acc!681 () List!12878)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3455 (List!12878 (_ BitVec 64)) Bool)

(assert (=> b!675094 (= e!385248 (contains!3455 acc!681 k!2843))))

(declare-fun b!675095 () Bool)

(declare-fun res!441523 () Bool)

(assert (=> b!675095 (=> (not res!441523) (not e!385250))))

(declare-fun arrayNoDuplicates!0 (array!39289 (_ BitVec 32) List!12878) Bool)

(assert (=> b!675095 (= res!441523 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675096 () Bool)

(declare-fun res!441535 () Bool)

(assert (=> b!675096 (=> (not res!441535) (not e!385250))))

(assert (=> b!675096 (= res!441535 (not (contains!3455 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675097 () Bool)

(declare-fun res!441529 () Bool)

(assert (=> b!675097 (=> (not res!441529) (not e!385250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675097 (= res!441529 (validKeyInArray!0 k!2843))))

(declare-fun b!675098 () Bool)

(declare-fun e!385247 () Bool)

(declare-fun e!385252 () Bool)

(assert (=> b!675098 (= e!385247 e!385252)))

(declare-fun res!441539 () Bool)

(assert (=> b!675098 (=> (not res!441539) (not e!385252))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675098 (= res!441539 (bvsle from!3004 i!1382))))

(declare-fun b!675099 () Bool)

(declare-fun res!441526 () Bool)

(assert (=> b!675099 (=> (not res!441526) (not e!385250))))

(assert (=> b!675099 (= res!441526 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19201 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675100 () Bool)

(assert (=> b!675100 (= e!385252 (not (contains!3455 acc!681 k!2843)))))

(declare-fun b!675101 () Bool)

(declare-fun res!441531 () Bool)

(assert (=> b!675101 (=> (not res!441531) (not e!385250))))

(assert (=> b!675101 (= res!441531 e!385247)))

(declare-fun res!441534 () Bool)

(assert (=> b!675101 (=> res!441534 e!385247)))

(assert (=> b!675101 (= res!441534 e!385248)))

(declare-fun res!441536 () Bool)

(assert (=> b!675101 (=> (not res!441536) (not e!385248))))

(assert (=> b!675101 (= res!441536 (bvsgt from!3004 i!1382))))

(declare-fun b!675102 () Bool)

(declare-fun res!441521 () Bool)

(assert (=> b!675102 (=> (not res!441521) (not e!385250))))

(declare-fun noDuplicate!702 (List!12878) Bool)

(assert (=> b!675102 (= res!441521 (noDuplicate!702 acc!681))))

(declare-fun b!675103 () Bool)

(declare-fun res!441522 () Bool)

(assert (=> b!675103 (=> (not res!441522) (not e!385250))))

(assert (=> b!675103 (= res!441522 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19201 a!3626))))))

(declare-fun b!675104 () Bool)

(declare-fun e!385254 () Bool)

(assert (=> b!675104 (= e!385254 (contains!3455 acc!681 k!2843))))

(declare-fun b!675105 () Bool)

(declare-fun res!441538 () Bool)

(assert (=> b!675105 (=> (not res!441538) (not e!385250))))

(assert (=> b!675105 (= res!441538 (not (contains!3455 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675106 () Bool)

(declare-fun e!385253 () Bool)

(assert (=> b!675106 (= e!385253 (not (contains!3455 acc!681 k!2843)))))

(declare-fun b!675107 () Bool)

(declare-fun res!441530 () Bool)

(assert (=> b!675107 (=> (not res!441530) (not e!385250))))

(assert (=> b!675107 (= res!441530 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675108 () Bool)

(declare-fun res!441537 () Bool)

(assert (=> b!675108 (=> (not res!441537) (not e!385250))))

(declare-fun arrayContainsKey!0 (array!39289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675108 (= res!441537 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675109 () Bool)

(declare-fun res!441527 () Bool)

(assert (=> b!675109 (=> (not res!441527) (not e!385250))))

(assert (=> b!675109 (= res!441527 (not (validKeyInArray!0 (select (arr!18837 a!3626) from!3004))))))

(declare-fun b!675110 () Bool)

(assert (=> b!675110 (= e!385250 false)))

(declare-fun lt!312709 () Bool)

(assert (=> b!675110 (= lt!312709 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675111 () Bool)

(declare-fun res!441533 () Bool)

(assert (=> b!675111 (=> (not res!441533) (not e!385250))))

(declare-fun e!385249 () Bool)

(assert (=> b!675111 (= res!441533 e!385249)))

(declare-fun res!441520 () Bool)

(assert (=> b!675111 (=> res!441520 e!385249)))

(assert (=> b!675111 (= res!441520 e!385254)))

(declare-fun res!441528 () Bool)

(assert (=> b!675111 (=> (not res!441528) (not e!385254))))

(assert (=> b!675111 (= res!441528 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675112 () Bool)

(assert (=> b!675112 (= e!385249 e!385253)))

(declare-fun res!441525 () Bool)

(assert (=> b!675112 (=> (not res!441525) (not e!385253))))

(assert (=> b!675112 (= res!441525 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675113 () Bool)

(declare-fun res!441532 () Bool)

(assert (=> b!675113 (=> (not res!441532) (not e!385250))))

(assert (=> b!675113 (= res!441532 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12875))))

(assert (= (and start!60242 res!441524) b!675102))

(assert (= (and b!675102 res!441521) b!675105))

(assert (= (and b!675105 res!441538) b!675096))

(assert (= (and b!675096 res!441535) b!675101))

(assert (= (and b!675101 res!441536) b!675094))

(assert (= (and b!675101 (not res!441534)) b!675098))

(assert (= (and b!675098 res!441539) b!675100))

(assert (= (and b!675101 res!441531) b!675113))

(assert (= (and b!675113 res!441532) b!675095))

(assert (= (and b!675095 res!441523) b!675103))

(assert (= (and b!675103 res!441522) b!675097))

(assert (= (and b!675097 res!441529) b!675108))

(assert (= (and b!675108 res!441537) b!675099))

(assert (= (and b!675099 res!441526) b!675109))

(assert (= (and b!675109 res!441527) b!675107))

(assert (= (and b!675107 res!441530) b!675111))

(assert (= (and b!675111 res!441528) b!675104))

(assert (= (and b!675111 (not res!441520)) b!675112))

(assert (= (and b!675112 res!441525) b!675106))

(assert (= (and b!675111 res!441533) b!675110))

(declare-fun m!642755 () Bool)

(assert (=> b!675096 m!642755))

(declare-fun m!642757 () Bool)

(assert (=> b!675110 m!642757))

(declare-fun m!642759 () Bool)

(assert (=> b!675108 m!642759))

(declare-fun m!642761 () Bool)

(assert (=> b!675100 m!642761))

(declare-fun m!642763 () Bool)

(assert (=> start!60242 m!642763))

(declare-fun m!642765 () Bool)

(assert (=> b!675095 m!642765))

(assert (=> b!675094 m!642761))

(declare-fun m!642767 () Bool)

(assert (=> b!675105 m!642767))

(assert (=> b!675106 m!642761))

(declare-fun m!642769 () Bool)

(assert (=> b!675109 m!642769))

(assert (=> b!675109 m!642769))

(declare-fun m!642771 () Bool)

(assert (=> b!675109 m!642771))

(assert (=> b!675104 m!642761))

(declare-fun m!642773 () Bool)

(assert (=> b!675102 m!642773))

(declare-fun m!642775 () Bool)

(assert (=> b!675097 m!642775))

(declare-fun m!642777 () Bool)

(assert (=> b!675113 m!642777))

(push 1)

(assert (not b!675113))

(assert (not b!675104))

(assert (not start!60242))

(assert (not b!675108))

(assert (not b!675096))

(assert (not b!675095))

(assert (not b!675110))

(assert (not b!675105))

(assert (not b!675102))

(assert (not b!675100))

(assert (not b!675109))

(assert (not b!675094))

(assert (not b!675097))

(assert (not b!675106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

