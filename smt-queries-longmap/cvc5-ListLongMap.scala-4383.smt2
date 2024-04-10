; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60326 () Bool)

(assert start!60326)

(declare-fun b!677643 () Bool)

(declare-fun e!386256 () Bool)

(declare-fun e!386257 () Bool)

(assert (=> b!677643 (= e!386256 e!386257)))

(declare-fun res!444084 () Bool)

(assert (=> b!677643 (=> (not res!444084) (not e!386257))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677643 (= res!444084 (bvsle from!3004 i!1382))))

(declare-fun b!677644 () Bool)

(declare-fun e!386259 () Bool)

(declare-datatypes ((List!12920 0))(
  ( (Nil!12917) (Cons!12916 (h!13961 (_ BitVec 64)) (t!19148 List!12920)) )
))
(declare-fun acc!681 () List!12920)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3497 (List!12920 (_ BitVec 64)) Bool)

(assert (=> b!677644 (= e!386259 (not (contains!3497 acc!681 k!2843)))))

(declare-fun b!677645 () Bool)

(assert (=> b!677645 (= e!386257 (not (contains!3497 acc!681 k!2843)))))

(declare-fun b!677646 () Bool)

(declare-fun res!444078 () Bool)

(declare-fun e!386255 () Bool)

(assert (=> b!677646 (=> (not res!444078) (not e!386255))))

(assert (=> b!677646 (= res!444078 (not (contains!3497 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677647 () Bool)

(declare-fun res!444086 () Bool)

(assert (=> b!677647 (=> (not res!444086) (not e!386255))))

(declare-datatypes ((array!39373 0))(
  ( (array!39374 (arr!18879 (Array (_ BitVec 32) (_ BitVec 64))) (size!19243 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39373)

(declare-fun arrayNoDuplicates!0 (array!39373 (_ BitVec 32) List!12920) Bool)

(assert (=> b!677647 (= res!444086 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677648 () Bool)

(declare-fun res!444074 () Bool)

(assert (=> b!677648 (=> (not res!444074) (not e!386255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677648 (= res!444074 (validKeyInArray!0 k!2843))))

(declare-fun b!677649 () Bool)

(assert (=> b!677649 (= e!386255 (not true))))

(assert (=> b!677649 (arrayNoDuplicates!0 (array!39374 (store (arr!18879 a!3626) i!1382 k!2843) (size!19243 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23778 0))(
  ( (Unit!23779) )
))
(declare-fun lt!312835 () Unit!23778)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12920) Unit!23778)

(assert (=> b!677649 (= lt!312835 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677650 () Bool)

(declare-fun res!444075 () Bool)

(assert (=> b!677650 (=> (not res!444075) (not e!386255))))

(assert (=> b!677650 (= res!444075 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!444072 () Bool)

(assert (=> start!60326 (=> (not res!444072) (not e!386255))))

(assert (=> start!60326 (= res!444072 (and (bvslt (size!19243 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19243 a!3626))))))

(assert (=> start!60326 e!386255))

(assert (=> start!60326 true))

(declare-fun array_inv!14675 (array!39373) Bool)

(assert (=> start!60326 (array_inv!14675 a!3626)))

(declare-fun b!677651 () Bool)

(declare-fun res!444081 () Bool)

(assert (=> b!677651 (=> (not res!444081) (not e!386255))))

(assert (=> b!677651 (= res!444081 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12917))))

(declare-fun b!677652 () Bool)

(declare-fun res!444085 () Bool)

(assert (=> b!677652 (=> (not res!444085) (not e!386255))))

(declare-fun noDuplicate!744 (List!12920) Bool)

(assert (=> b!677652 (= res!444085 (noDuplicate!744 acc!681))))

(declare-fun b!677653 () Bool)

(declare-fun res!444080 () Bool)

(assert (=> b!677653 (=> (not res!444080) (not e!386255))))

(assert (=> b!677653 (= res!444080 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19243 a!3626))))))

(declare-fun b!677654 () Bool)

(declare-fun res!444088 () Bool)

(assert (=> b!677654 (=> (not res!444088) (not e!386255))))

(assert (=> b!677654 (= res!444088 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19243 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677655 () Bool)

(declare-fun e!386258 () Bool)

(assert (=> b!677655 (= e!386258 e!386259)))

(declare-fun res!444087 () Bool)

(assert (=> b!677655 (=> (not res!444087) (not e!386259))))

(assert (=> b!677655 (= res!444087 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677656 () Bool)

(declare-fun res!444083 () Bool)

(assert (=> b!677656 (=> (not res!444083) (not e!386255))))

(assert (=> b!677656 (= res!444083 e!386258)))

(declare-fun res!444069 () Bool)

(assert (=> b!677656 (=> res!444069 e!386258)))

(declare-fun e!386262 () Bool)

(assert (=> b!677656 (= res!444069 e!386262)))

(declare-fun res!444073 () Bool)

(assert (=> b!677656 (=> (not res!444073) (not e!386262))))

(assert (=> b!677656 (= res!444073 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677657 () Bool)

(declare-fun res!444082 () Bool)

(assert (=> b!677657 (=> (not res!444082) (not e!386255))))

(assert (=> b!677657 (= res!444082 (not (contains!3497 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677658 () Bool)

(declare-fun res!444089 () Bool)

(assert (=> b!677658 (=> (not res!444089) (not e!386255))))

(assert (=> b!677658 (= res!444089 e!386256)))

(declare-fun res!444071 () Bool)

(assert (=> b!677658 (=> res!444071 e!386256)))

(declare-fun e!386260 () Bool)

(assert (=> b!677658 (= res!444071 e!386260)))

(declare-fun res!444079 () Bool)

(assert (=> b!677658 (=> (not res!444079) (not e!386260))))

(assert (=> b!677658 (= res!444079 (bvsgt from!3004 i!1382))))

(declare-fun b!677659 () Bool)

(declare-fun res!444070 () Bool)

(assert (=> b!677659 (=> (not res!444070) (not e!386255))))

(declare-fun arrayContainsKey!0 (array!39373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677659 (= res!444070 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677660 () Bool)

(assert (=> b!677660 (= e!386262 (contains!3497 acc!681 k!2843))))

(declare-fun b!677661 () Bool)

(declare-fun res!444077 () Bool)

(assert (=> b!677661 (=> (not res!444077) (not e!386255))))

(assert (=> b!677661 (= res!444077 (not (validKeyInArray!0 (select (arr!18879 a!3626) from!3004))))))

(declare-fun b!677662 () Bool)

(declare-fun res!444076 () Bool)

(assert (=> b!677662 (=> (not res!444076) (not e!386255))))

(assert (=> b!677662 (= res!444076 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677663 () Bool)

(assert (=> b!677663 (= e!386260 (contains!3497 acc!681 k!2843))))

(assert (= (and start!60326 res!444072) b!677652))

(assert (= (and b!677652 res!444085) b!677657))

(assert (= (and b!677657 res!444082) b!677646))

(assert (= (and b!677646 res!444078) b!677658))

(assert (= (and b!677658 res!444079) b!677663))

(assert (= (and b!677658 (not res!444071)) b!677643))

(assert (= (and b!677643 res!444084) b!677645))

(assert (= (and b!677658 res!444089) b!677651))

(assert (= (and b!677651 res!444081) b!677650))

(assert (= (and b!677650 res!444075) b!677653))

(assert (= (and b!677653 res!444080) b!677648))

(assert (= (and b!677648 res!444074) b!677659))

(assert (= (and b!677659 res!444070) b!677654))

(assert (= (and b!677654 res!444088) b!677661))

(assert (= (and b!677661 res!444077) b!677662))

(assert (= (and b!677662 res!444076) b!677656))

(assert (= (and b!677656 res!444073) b!677660))

(assert (= (and b!677656 (not res!444069)) b!677655))

(assert (= (and b!677655 res!444087) b!677644))

(assert (= (and b!677656 res!444083) b!677647))

(assert (= (and b!677647 res!444086) b!677649))

(declare-fun m!643817 () Bool)

(assert (=> b!677644 m!643817))

(declare-fun m!643819 () Bool)

(assert (=> b!677652 m!643819))

(declare-fun m!643821 () Bool)

(assert (=> b!677647 m!643821))

(assert (=> b!677660 m!643817))

(declare-fun m!643823 () Bool)

(assert (=> b!677648 m!643823))

(assert (=> b!677645 m!643817))

(declare-fun m!643825 () Bool)

(assert (=> start!60326 m!643825))

(declare-fun m!643827 () Bool)

(assert (=> b!677651 m!643827))

(assert (=> b!677663 m!643817))

(declare-fun m!643829 () Bool)

(assert (=> b!677661 m!643829))

(assert (=> b!677661 m!643829))

(declare-fun m!643831 () Bool)

(assert (=> b!677661 m!643831))

(declare-fun m!643833 () Bool)

(assert (=> b!677657 m!643833))

(declare-fun m!643835 () Bool)

(assert (=> b!677649 m!643835))

(declare-fun m!643837 () Bool)

(assert (=> b!677649 m!643837))

(declare-fun m!643839 () Bool)

(assert (=> b!677649 m!643839))

(declare-fun m!643841 () Bool)

(assert (=> b!677650 m!643841))

(declare-fun m!643843 () Bool)

(assert (=> b!677659 m!643843))

(declare-fun m!643845 () Bool)

(assert (=> b!677646 m!643845))

(push 1)

(assert (not b!677646))

(assert (not b!677648))

(assert (not b!677647))

(assert (not b!677659))

(assert (not b!677651))

(assert (not b!677644))

(assert (not b!677660))

(assert (not b!677652))

(assert (not b!677645))

(assert (not b!677649))

(assert (not b!677650))

(assert (not start!60326))

(assert (not b!677661))

(assert (not b!677663))

(assert (not b!677657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

