; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60428 () Bool)

(assert start!60428)

(declare-fun b!679039 () Bool)

(declare-fun res!445424 () Bool)

(declare-fun e!386901 () Bool)

(assert (=> b!679039 (=> (not res!445424) (not e!386901))))

(declare-datatypes ((List!12953 0))(
  ( (Nil!12950) (Cons!12949 (h!13994 (_ BitVec 64)) (t!19181 List!12953)) )
))
(declare-fun acc!681 () List!12953)

(declare-fun noDuplicate!777 (List!12953) Bool)

(assert (=> b!679039 (= res!445424 (noDuplicate!777 acc!681))))

(declare-fun b!679040 () Bool)

(declare-fun res!445429 () Bool)

(assert (=> b!679040 (=> (not res!445429) (not e!386901))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39442 0))(
  ( (array!39443 (arr!18912 (Array (_ BitVec 32) (_ BitVec 64))) (size!19276 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39442)

(assert (=> b!679040 (= res!445429 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19276 a!3626))))))

(declare-fun b!679041 () Bool)

(declare-fun res!445428 () Bool)

(assert (=> b!679041 (=> (not res!445428) (not e!386901))))

(declare-fun contains!3530 (List!12953 (_ BitVec 64)) Bool)

(assert (=> b!679041 (= res!445428 (not (contains!3530 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679042 () Bool)

(declare-fun res!445431 () Bool)

(assert (=> b!679042 (=> (not res!445431) (not e!386901))))

(declare-fun e!386904 () Bool)

(assert (=> b!679042 (= res!445431 e!386904)))

(declare-fun res!445425 () Bool)

(assert (=> b!679042 (=> res!445425 e!386904)))

(declare-fun e!386903 () Bool)

(assert (=> b!679042 (= res!445425 e!386903)))

(declare-fun res!445436 () Bool)

(assert (=> b!679042 (=> (not res!445436) (not e!386903))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!679042 (= res!445436 (bvsgt from!3004 i!1382))))

(declare-fun b!679043 () Bool)

(declare-fun res!445435 () Bool)

(assert (=> b!679043 (=> (not res!445435) (not e!386901))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679043 (= res!445435 (validKeyInArray!0 k!2843))))

(declare-fun b!679044 () Bool)

(declare-fun res!445432 () Bool)

(assert (=> b!679044 (=> (not res!445432) (not e!386901))))

(assert (=> b!679044 (= res!445432 (not (contains!3530 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679045 () Bool)

(declare-fun res!445427 () Bool)

(assert (=> b!679045 (=> (not res!445427) (not e!386901))))

(assert (=> b!679045 (= res!445427 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19276 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679047 () Bool)

(assert (=> b!679047 (= e!386903 (contains!3530 acc!681 k!2843))))

(declare-fun b!679048 () Bool)

(assert (=> b!679048 (= e!386901 (not true))))

(declare-fun arrayContainsKey!0 (array!39442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679048 (arrayContainsKey!0 (array!39443 (store (arr!18912 a!3626) i!1382 k!2843) (size!19276 a!3626)) k!2843 from!3004)))

(declare-fun b!679049 () Bool)

(declare-fun res!445434 () Bool)

(assert (=> b!679049 (=> (not res!445434) (not e!386901))))

(declare-fun arrayNoDuplicates!0 (array!39442 (_ BitVec 32) List!12953) Bool)

(assert (=> b!679049 (= res!445434 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12950))))

(declare-fun b!679050 () Bool)

(declare-fun res!445423 () Bool)

(assert (=> b!679050 (=> (not res!445423) (not e!386901))))

(assert (=> b!679050 (= res!445423 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679051 () Bool)

(declare-fun e!386900 () Bool)

(assert (=> b!679051 (= e!386900 (not (contains!3530 acc!681 k!2843)))))

(declare-fun b!679052 () Bool)

(declare-fun res!445426 () Bool)

(assert (=> b!679052 (=> (not res!445426) (not e!386901))))

(assert (=> b!679052 (= res!445426 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!445430 () Bool)

(assert (=> start!60428 (=> (not res!445430) (not e!386901))))

(assert (=> start!60428 (= res!445430 (and (bvslt (size!19276 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19276 a!3626))))))

(assert (=> start!60428 e!386901))

(assert (=> start!60428 true))

(declare-fun array_inv!14708 (array!39442) Bool)

(assert (=> start!60428 (array_inv!14708 a!3626)))

(declare-fun b!679046 () Bool)

(assert (=> b!679046 (= e!386904 e!386900)))

(declare-fun res!445433 () Bool)

(assert (=> b!679046 (=> (not res!445433) (not e!386900))))

(assert (=> b!679046 (= res!445433 (bvsle from!3004 i!1382))))

(assert (= (and start!60428 res!445430) b!679039))

(assert (= (and b!679039 res!445424) b!679044))

(assert (= (and b!679044 res!445432) b!679041))

(assert (= (and b!679041 res!445428) b!679042))

(assert (= (and b!679042 res!445436) b!679047))

(assert (= (and b!679042 (not res!445425)) b!679046))

(assert (= (and b!679046 res!445433) b!679051))

(assert (= (and b!679042 res!445431) b!679049))

(assert (= (and b!679049 res!445434) b!679050))

(assert (= (and b!679050 res!445423) b!679040))

(assert (= (and b!679040 res!445429) b!679043))

(assert (= (and b!679043 res!445435) b!679052))

(assert (= (and b!679052 res!445426) b!679045))

(assert (= (and b!679045 res!445427) b!679048))

(declare-fun m!644579 () Bool)

(assert (=> b!679048 m!644579))

(declare-fun m!644581 () Bool)

(assert (=> b!679048 m!644581))

(declare-fun m!644583 () Bool)

(assert (=> b!679051 m!644583))

(assert (=> b!679047 m!644583))

(declare-fun m!644585 () Bool)

(assert (=> b!679049 m!644585))

(declare-fun m!644587 () Bool)

(assert (=> b!679039 m!644587))

(declare-fun m!644589 () Bool)

(assert (=> start!60428 m!644589))

(declare-fun m!644591 () Bool)

(assert (=> b!679041 m!644591))

(declare-fun m!644593 () Bool)

(assert (=> b!679050 m!644593))

(declare-fun m!644595 () Bool)

(assert (=> b!679044 m!644595))

(declare-fun m!644597 () Bool)

(assert (=> b!679052 m!644597))

(declare-fun m!644599 () Bool)

(assert (=> b!679043 m!644599))

(push 1)

(assert (not b!679049))

(assert (not b!679048))

(assert (not b!679039))

(assert (not b!679043))

(assert (not b!679044))

(assert (not b!679041))

(assert (not b!679051))

(assert (not start!60428))

(assert (not b!679052))

(assert (not b!679047))

(assert (not b!679050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

