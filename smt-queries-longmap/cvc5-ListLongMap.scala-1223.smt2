; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25842 () Bool)

(assert start!25842)

(declare-fun b!267454 () Bool)

(declare-fun e!172888 () Bool)

(declare-fun e!172887 () Bool)

(assert (=> b!267454 (= e!172888 e!172887)))

(declare-fun res!131754 () Bool)

(assert (=> b!267454 (=> res!131754 e!172887)))

(declare-datatypes ((List!3954 0))(
  ( (Nil!3951) (Cons!3950 (h!4617 (_ BitVec 64)) (t!9036 List!3954)) )
))
(declare-fun contains!1923 (List!3954 (_ BitVec 64)) Bool)

(assert (=> b!267454 (= res!131754 (contains!1923 Nil!3951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267455 () Bool)

(declare-fun res!131749 () Bool)

(assert (=> b!267455 (=> (not res!131749) (not e!172888))))

(declare-datatypes ((array!12987 0))(
  ( (array!12988 (arr!6146 (Array (_ BitVec 32) (_ BitVec 64))) (size!6498 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12987)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267455 (= res!131749 (and (= (size!6498 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6498 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6498 a!3325))))))

(declare-fun b!267456 () Bool)

(declare-fun res!131753 () Bool)

(assert (=> b!267456 (=> (not res!131753) (not e!172888))))

(assert (=> b!267456 (= res!131753 (and (bvsle #b00000000000000000000000000000000 (size!6498 a!3325)) (bvslt (size!6498 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267457 () Bool)

(declare-fun res!131751 () Bool)

(assert (=> b!267457 (=> (not res!131751) (not e!172888))))

(declare-fun noDuplicate!113 (List!3954) Bool)

(assert (=> b!267457 (= res!131751 (noDuplicate!113 Nil!3951))))

(declare-fun b!267458 () Bool)

(declare-fun res!131750 () Bool)

(assert (=> b!267458 (=> (not res!131750) (not e!172888))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267458 (= res!131750 (validKeyInArray!0 k!2581))))

(declare-fun res!131752 () Bool)

(assert (=> start!25842 (=> (not res!131752) (not e!172888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25842 (= res!131752 (validMask!0 mask!3868))))

(assert (=> start!25842 e!172888))

(declare-fun array_inv!4109 (array!12987) Bool)

(assert (=> start!25842 (array_inv!4109 a!3325)))

(assert (=> start!25842 true))

(declare-fun b!267453 () Bool)

(assert (=> b!267453 (= e!172887 (contains!1923 Nil!3951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!25842 res!131752) b!267455))

(assert (= (and b!267455 res!131749) b!267458))

(assert (= (and b!267458 res!131750) b!267456))

(assert (= (and b!267456 res!131753) b!267457))

(assert (= (and b!267457 res!131751) b!267454))

(assert (= (and b!267454 (not res!131754)) b!267453))

(declare-fun m!283815 () Bool)

(assert (=> b!267454 m!283815))

(declare-fun m!283817 () Bool)

(assert (=> b!267458 m!283817))

(declare-fun m!283819 () Bool)

(assert (=> b!267457 m!283819))

(declare-fun m!283821 () Bool)

(assert (=> start!25842 m!283821))

(declare-fun m!283823 () Bool)

(assert (=> start!25842 m!283823))

(declare-fun m!283825 () Bool)

(assert (=> b!267453 m!283825))

(push 1)

(assert (not start!25842))

(assert (not b!267457))

(assert (not b!267453))

(assert (not b!267458))

(assert (not b!267454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64355 () Bool)

(assert (=> d!64355 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25842 d!64355))

(declare-fun d!64365 () Bool)

(assert (=> d!64365 (= (array_inv!4109 a!3325) (bvsge (size!6498 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25842 d!64365))

(declare-fun d!64369 () Bool)

(declare-fun lt!134699 () Bool)

(declare-fun content!182 (List!3954) (Set (_ BitVec 64)))

(assert (=> d!64369 (= lt!134699 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!182 Nil!3951)))))

(declare-fun e!172939 () Bool)

(assert (=> d!64369 (= lt!134699 e!172939)))

(declare-fun res!131822 () Bool)

(assert (=> d!64369 (=> (not res!131822) (not e!172939))))

(assert (=> d!64369 (= res!131822 (is-Cons!3950 Nil!3951))))

(assert (=> d!64369 (= (contains!1923 Nil!3951 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134699)))

(declare-fun b!267525 () Bool)

(declare-fun e!172938 () Bool)

(assert (=> b!267525 (= e!172939 e!172938)))

(declare-fun res!131821 () Bool)

(assert (=> b!267525 (=> res!131821 e!172938)))

(assert (=> b!267525 (= res!131821 (= (h!4617 Nil!3951) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267526 () Bool)

(assert (=> b!267526 (= e!172938 (contains!1923 (t!9036 Nil!3951) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64369 res!131822) b!267525))

(assert (= (and b!267525 (not res!131821)) b!267526))

(declare-fun m!283875 () Bool)

(assert (=> d!64369 m!283875))

(declare-fun m!283877 () Bool)

(assert (=> d!64369 m!283877))

(declare-fun m!283879 () Bool)

(assert (=> b!267526 m!283879))

(assert (=> b!267454 d!64369))

(declare-fun d!64373 () Bool)

(declare-fun lt!134700 () Bool)

(assert (=> d!64373 (= lt!134700 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!182 Nil!3951)))))

