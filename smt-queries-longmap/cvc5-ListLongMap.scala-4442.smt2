; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61746 () Bool)

(assert start!61746)

(declare-fun b!690690 () Bool)

(declare-fun res!455235 () Bool)

(declare-fun e!393173 () Bool)

(assert (=> b!690690 (=> (not res!455235) (not e!393173))))

(declare-datatypes ((array!39778 0))(
  ( (array!39779 (arr!19057 (Array (_ BitVec 32) (_ BitVec 64))) (size!19439 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39778)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690690 (= res!455235 (validKeyInArray!0 (select (arr!19057 a!3626) from!3004)))))

(declare-fun b!690691 () Bool)

(declare-fun res!455244 () Bool)

(assert (=> b!690691 (=> (not res!455244) (not e!393173))))

(declare-fun e!393176 () Bool)

(assert (=> b!690691 (= res!455244 e!393176)))

(declare-fun res!455240 () Bool)

(assert (=> b!690691 (=> res!455240 e!393176)))

(declare-fun e!393172 () Bool)

(assert (=> b!690691 (= res!455240 e!393172)))

(declare-fun res!455234 () Bool)

(assert (=> b!690691 (=> (not res!455234) (not e!393172))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690691 (= res!455234 (bvsgt from!3004 i!1382))))

(declare-fun b!690693 () Bool)

(declare-datatypes ((List!13137 0))(
  ( (Nil!13134) (Cons!13133 (h!14178 (_ BitVec 64)) (t!19395 List!13137)) )
))
(declare-fun acc!681 () List!13137)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3659 (List!13137 (_ BitVec 64)) Bool)

(assert (=> b!690693 (= e!393172 (contains!3659 acc!681 k!2843))))

(declare-fun b!690694 () Bool)

(declare-fun res!455242 () Bool)

(assert (=> b!690694 (=> (not res!455242) (not e!393173))))

(assert (=> b!690694 (= res!455242 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19439 a!3626))))))

(declare-fun b!690695 () Bool)

(declare-fun res!455243 () Bool)

(assert (=> b!690695 (=> (not res!455243) (not e!393173))))

(assert (=> b!690695 (= res!455243 (not (contains!3659 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690696 () Bool)

(assert (=> b!690696 (= e!393173 (not true))))

(declare-fun arrayContainsKey!0 (array!39778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690696 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690697 () Bool)

(declare-fun res!455238 () Bool)

(assert (=> b!690697 (=> (not res!455238) (not e!393173))))

(declare-fun arrayNoDuplicates!0 (array!39778 (_ BitVec 32) List!13137) Bool)

(assert (=> b!690697 (= res!455238 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690698 () Bool)

(declare-fun e!393174 () Bool)

(assert (=> b!690698 (= e!393174 (not (contains!3659 acc!681 k!2843)))))

(declare-fun b!690699 () Bool)

(declare-fun res!455231 () Bool)

(assert (=> b!690699 (=> (not res!455231) (not e!393173))))

(assert (=> b!690699 (= res!455231 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13134))))

(declare-fun b!690700 () Bool)

(declare-fun res!455232 () Bool)

(assert (=> b!690700 (=> (not res!455232) (not e!393173))))

(assert (=> b!690700 (= res!455232 (validKeyInArray!0 k!2843))))

(declare-fun b!690701 () Bool)

(declare-fun res!455237 () Bool)

(assert (=> b!690701 (=> (not res!455237) (not e!393173))))

(assert (=> b!690701 (= res!455237 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19439 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690702 () Bool)

(declare-fun res!455245 () Bool)

(assert (=> b!690702 (=> (not res!455245) (not e!393173))))

(assert (=> b!690702 (= res!455245 (not (contains!3659 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690703 () Bool)

(assert (=> b!690703 (= e!393176 e!393174)))

(declare-fun res!455241 () Bool)

(assert (=> b!690703 (=> (not res!455241) (not e!393174))))

(assert (=> b!690703 (= res!455241 (bvsle from!3004 i!1382))))

(declare-fun res!455239 () Bool)

(assert (=> start!61746 (=> (not res!455239) (not e!393173))))

(assert (=> start!61746 (= res!455239 (and (bvslt (size!19439 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19439 a!3626))))))

(assert (=> start!61746 e!393173))

(assert (=> start!61746 true))

(declare-fun array_inv!14940 (array!39778) Bool)

(assert (=> start!61746 (array_inv!14940 a!3626)))

(declare-fun b!690692 () Bool)

(declare-fun res!455230 () Bool)

(assert (=> b!690692 (=> (not res!455230) (not e!393173))))

(assert (=> b!690692 (= res!455230 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690704 () Bool)

(declare-fun res!455236 () Bool)

(assert (=> b!690704 (=> (not res!455236) (not e!393173))))

(declare-fun noDuplicate!928 (List!13137) Bool)

(assert (=> b!690704 (= res!455236 (noDuplicate!928 acc!681))))

(declare-fun b!690705 () Bool)

(declare-fun res!455233 () Bool)

(assert (=> b!690705 (=> (not res!455233) (not e!393173))))

(assert (=> b!690705 (= res!455233 (= (select (arr!19057 a!3626) from!3004) k!2843))))

(assert (= (and start!61746 res!455239) b!690704))

(assert (= (and b!690704 res!455236) b!690695))

(assert (= (and b!690695 res!455243) b!690702))

(assert (= (and b!690702 res!455245) b!690691))

(assert (= (and b!690691 res!455234) b!690693))

(assert (= (and b!690691 (not res!455240)) b!690703))

(assert (= (and b!690703 res!455241) b!690698))

(assert (= (and b!690691 res!455244) b!690699))

(assert (= (and b!690699 res!455231) b!690697))

(assert (= (and b!690697 res!455238) b!690694))

(assert (= (and b!690694 res!455242) b!690700))

(assert (= (and b!690700 res!455232) b!690692))

(assert (= (and b!690692 res!455230) b!690701))

(assert (= (and b!690701 res!455237) b!690690))

(assert (= (and b!690690 res!455235) b!690705))

(assert (= (and b!690705 res!455233) b!690696))

(declare-fun m!653451 () Bool)

(assert (=> b!690698 m!653451))

(declare-fun m!653453 () Bool)

(assert (=> b!690695 m!653453))

(declare-fun m!653455 () Bool)

(assert (=> b!690700 m!653455))

(declare-fun m!653457 () Bool)

(assert (=> b!690692 m!653457))

(declare-fun m!653459 () Bool)

(assert (=> b!690696 m!653459))

(declare-fun m!653461 () Bool)

(assert (=> start!61746 m!653461))

(declare-fun m!653463 () Bool)

(assert (=> b!690704 m!653463))

(declare-fun m!653465 () Bool)

(assert (=> b!690705 m!653465))

(declare-fun m!653467 () Bool)

(assert (=> b!690699 m!653467))

(assert (=> b!690690 m!653465))

(assert (=> b!690690 m!653465))

(declare-fun m!653469 () Bool)

(assert (=> b!690690 m!653469))

(assert (=> b!690693 m!653451))

(declare-fun m!653471 () Bool)

(assert (=> b!690702 m!653471))

(declare-fun m!653473 () Bool)

(assert (=> b!690697 m!653473))

(push 1)

(assert (not b!690693))

(assert (not b!690699))

(assert (not b!690697))

(assert (not b!690696))

(assert (not b!690704))

(assert (not b!690698))

(assert (not start!61746))

(assert (not b!690702))

(assert (not b!690690))

(assert (not b!690695))

(assert (not b!690692))

(assert (not b!690700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

