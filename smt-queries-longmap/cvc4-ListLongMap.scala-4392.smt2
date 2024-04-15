; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60406 () Bool)

(assert start!60406)

(declare-fun b!678533 () Bool)

(declare-fun res!445084 () Bool)

(declare-fun e!386639 () Bool)

(assert (=> b!678533 (=> (not res!445084) (not e!386639))))

(declare-fun e!386637 () Bool)

(assert (=> b!678533 (= res!445084 e!386637)))

(declare-fun res!445085 () Bool)

(assert (=> b!678533 (=> res!445085 e!386637)))

(declare-fun e!386638 () Bool)

(assert (=> b!678533 (= res!445085 e!386638)))

(declare-fun res!445087 () Bool)

(assert (=> b!678533 (=> (not res!445087) (not e!386638))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678533 (= res!445087 (bvsgt from!3004 i!1382))))

(declare-fun b!678534 () Bool)

(declare-fun res!445080 () Bool)

(assert (=> b!678534 (=> (not res!445080) (not e!386639))))

(declare-datatypes ((List!12986 0))(
  ( (Nil!12983) (Cons!12982 (h!14027 (_ BitVec 64)) (t!19205 List!12986)) )
))
(declare-fun acc!681 () List!12986)

(declare-fun contains!3508 (List!12986 (_ BitVec 64)) Bool)

(assert (=> b!678534 (= res!445080 (not (contains!3508 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!445088 () Bool)

(assert (=> start!60406 (=> (not res!445088) (not e!386639))))

(declare-datatypes ((array!39431 0))(
  ( (array!39432 (arr!18906 (Array (_ BitVec 32) (_ BitVec 64))) (size!19271 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39431)

(assert (=> start!60406 (= res!445088 (and (bvslt (size!19271 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19271 a!3626))))))

(assert (=> start!60406 e!386639))

(assert (=> start!60406 true))

(declare-fun array_inv!14789 (array!39431) Bool)

(assert (=> start!60406 (array_inv!14789 a!3626)))

(declare-fun b!678535 () Bool)

(declare-fun res!445090 () Bool)

(assert (=> b!678535 (=> (not res!445090) (not e!386639))))

(declare-fun arrayNoDuplicates!0 (array!39431 (_ BitVec 32) List!12986) Bool)

(assert (=> b!678535 (= res!445090 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678536 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678536 (= e!386638 (contains!3508 acc!681 k!2843))))

(declare-fun b!678537 () Bool)

(declare-fun res!445079 () Bool)

(assert (=> b!678537 (=> (not res!445079) (not e!386639))))

(assert (=> b!678537 (= res!445079 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19271 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678538 () Bool)

(declare-fun res!445082 () Bool)

(assert (=> b!678538 (=> (not res!445082) (not e!386639))))

(assert (=> b!678538 (= res!445082 (not (contains!3508 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678539 () Bool)

(assert (=> b!678539 (= e!386639 (not true))))

(declare-fun arrayContainsKey!0 (array!39431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678539 (arrayContainsKey!0 (array!39432 (store (arr!18906 a!3626) i!1382 k!2843) (size!19271 a!3626)) k!2843 from!3004)))

(declare-fun b!678540 () Bool)

(declare-fun e!386636 () Bool)

(assert (=> b!678540 (= e!386637 e!386636)))

(declare-fun res!445078 () Bool)

(assert (=> b!678540 (=> (not res!445078) (not e!386636))))

(assert (=> b!678540 (= res!445078 (bvsle from!3004 i!1382))))

(declare-fun b!678541 () Bool)

(declare-fun res!445089 () Bool)

(assert (=> b!678541 (=> (not res!445089) (not e!386639))))

(assert (=> b!678541 (= res!445089 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19271 a!3626))))))

(declare-fun b!678542 () Bool)

(declare-fun res!445081 () Bool)

(assert (=> b!678542 (=> (not res!445081) (not e!386639))))

(assert (=> b!678542 (= res!445081 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12983))))

(declare-fun b!678543 () Bool)

(declare-fun res!445086 () Bool)

(assert (=> b!678543 (=> (not res!445086) (not e!386639))))

(assert (=> b!678543 (= res!445086 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678544 () Bool)

(declare-fun res!445083 () Bool)

(assert (=> b!678544 (=> (not res!445083) (not e!386639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678544 (= res!445083 (validKeyInArray!0 k!2843))))

(declare-fun b!678545 () Bool)

(assert (=> b!678545 (= e!386636 (not (contains!3508 acc!681 k!2843)))))

(declare-fun b!678546 () Bool)

(declare-fun res!445077 () Bool)

(assert (=> b!678546 (=> (not res!445077) (not e!386639))))

(declare-fun noDuplicate!777 (List!12986) Bool)

(assert (=> b!678546 (= res!445077 (noDuplicate!777 acc!681))))

(assert (= (and start!60406 res!445088) b!678546))

(assert (= (and b!678546 res!445077) b!678538))

(assert (= (and b!678538 res!445082) b!678534))

(assert (= (and b!678534 res!445080) b!678533))

(assert (= (and b!678533 res!445087) b!678536))

(assert (= (and b!678533 (not res!445085)) b!678540))

(assert (= (and b!678540 res!445078) b!678545))

(assert (= (and b!678533 res!445084) b!678542))

(assert (= (and b!678542 res!445081) b!678535))

(assert (= (and b!678535 res!445090) b!678541))

(assert (= (and b!678541 res!445089) b!678544))

(assert (= (and b!678544 res!445083) b!678543))

(assert (= (and b!678543 res!445086) b!678537))

(assert (= (and b!678537 res!445079) b!678539))

(declare-fun m!643687 () Bool)

(assert (=> b!678536 m!643687))

(declare-fun m!643689 () Bool)

(assert (=> b!678542 m!643689))

(declare-fun m!643691 () Bool)

(assert (=> start!60406 m!643691))

(declare-fun m!643693 () Bool)

(assert (=> b!678543 m!643693))

(declare-fun m!643695 () Bool)

(assert (=> b!678546 m!643695))

(declare-fun m!643697 () Bool)

(assert (=> b!678538 m!643697))

(assert (=> b!678545 m!643687))

(declare-fun m!643699 () Bool)

(assert (=> b!678539 m!643699))

(declare-fun m!643701 () Bool)

(assert (=> b!678539 m!643701))

(declare-fun m!643703 () Bool)

(assert (=> b!678535 m!643703))

(declare-fun m!643705 () Bool)

(assert (=> b!678534 m!643705))

(declare-fun m!643707 () Bool)

(assert (=> b!678544 m!643707))

(push 1)

(assert (not b!678545))

(assert (not b!678534))

(assert (not b!678535))

(assert (not b!678544))

(assert (not b!678536))

(assert (not start!60406))

(assert (not b!678543))

(assert (not b!678542))

(assert (not b!678539))

(assert (not b!678538))

(assert (not b!678546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

