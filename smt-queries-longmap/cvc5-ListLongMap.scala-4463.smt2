; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62118 () Bool)

(assert start!62118)

(declare-fun b!695338 () Bool)

(declare-fun res!459449 () Bool)

(declare-fun e!395446 () Bool)

(assert (=> b!695338 (=> (not res!459449) (not e!395446))))

(declare-fun e!395449 () Bool)

(assert (=> b!695338 (= res!459449 e!395449)))

(declare-fun res!459450 () Bool)

(assert (=> b!695338 (=> res!459450 e!395449)))

(declare-fun e!395448 () Bool)

(assert (=> b!695338 (= res!459450 e!395448)))

(declare-fun res!459454 () Bool)

(assert (=> b!695338 (=> (not res!459454) (not e!395448))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695338 (= res!459454 (bvsgt from!3004 i!1382))))

(declare-fun b!695339 () Bool)

(assert (=> b!695339 (= e!395446 false)))

(declare-fun lt!316812 () Bool)

(declare-datatypes ((array!39919 0))(
  ( (array!39920 (arr!19120 (Array (_ BitVec 32) (_ BitVec 64))) (size!19502 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39919)

(declare-datatypes ((List!13200 0))(
  ( (Nil!13197) (Cons!13196 (h!14241 (_ BitVec 64)) (t!19473 List!13200)) )
))
(declare-fun acc!681 () List!13200)

(declare-fun arrayNoDuplicates!0 (array!39919 (_ BitVec 32) List!13200) Bool)

(assert (=> b!695339 (= lt!316812 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695340 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3722 (List!13200 (_ BitVec 64)) Bool)

(assert (=> b!695340 (= e!395448 (contains!3722 acc!681 k!2843))))

(declare-fun b!695341 () Bool)

(declare-fun e!395450 () Bool)

(assert (=> b!695341 (= e!395450 (not (contains!3722 acc!681 k!2843)))))

(declare-fun b!695342 () Bool)

(declare-fun res!459446 () Bool)

(assert (=> b!695342 (=> (not res!459446) (not e!395446))))

(assert (=> b!695342 (= res!459446 (not (contains!3722 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695343 () Bool)

(declare-fun res!459451 () Bool)

(assert (=> b!695343 (=> (not res!459451) (not e!395446))))

(assert (=> b!695343 (= res!459451 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13197))))

(declare-fun b!695344 () Bool)

(declare-fun res!459448 () Bool)

(assert (=> b!695344 (=> (not res!459448) (not e!395446))))

(declare-fun noDuplicate!991 (List!13200) Bool)

(assert (=> b!695344 (= res!459448 (noDuplicate!991 acc!681))))

(declare-fun b!695345 () Bool)

(declare-fun res!459452 () Bool)

(assert (=> b!695345 (=> (not res!459452) (not e!395446))))

(assert (=> b!695345 (= res!459452 (not (contains!3722 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695346 () Bool)

(assert (=> b!695346 (= e!395449 e!395450)))

(declare-fun res!459447 () Bool)

(assert (=> b!695346 (=> (not res!459447) (not e!395450))))

(assert (=> b!695346 (= res!459447 (bvsle from!3004 i!1382))))

(declare-fun res!459453 () Bool)

(assert (=> start!62118 (=> (not res!459453) (not e!395446))))

(assert (=> start!62118 (= res!459453 (and (bvslt (size!19502 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19502 a!3626))))))

(assert (=> start!62118 e!395446))

(assert (=> start!62118 true))

(declare-fun array_inv!15003 (array!39919) Bool)

(assert (=> start!62118 (array_inv!15003 a!3626)))

(assert (= (and start!62118 res!459453) b!695344))

(assert (= (and b!695344 res!459448) b!695342))

(assert (= (and b!695342 res!459446) b!695345))

(assert (= (and b!695345 res!459452) b!695338))

(assert (= (and b!695338 res!459454) b!695340))

(assert (= (and b!695338 (not res!459450)) b!695346))

(assert (= (and b!695346 res!459447) b!695341))

(assert (= (and b!695338 res!459449) b!695343))

(assert (= (and b!695343 res!459451) b!695339))

(declare-fun m!656263 () Bool)

(assert (=> b!695341 m!656263))

(declare-fun m!656265 () Bool)

(assert (=> b!695345 m!656265))

(declare-fun m!656267 () Bool)

(assert (=> b!695343 m!656267))

(assert (=> b!695340 m!656263))

(declare-fun m!656269 () Bool)

(assert (=> b!695339 m!656269))

(declare-fun m!656271 () Bool)

(assert (=> b!695344 m!656271))

(declare-fun m!656273 () Bool)

(assert (=> start!62118 m!656273))

(declare-fun m!656275 () Bool)

(assert (=> b!695342 m!656275))

(push 1)

(assert (not b!695344))

(assert (not b!695345))

(assert (not start!62118))

(assert (not b!695339))

(assert (not b!695341))

(assert (not b!695343))

(assert (not b!695340))

(assert (not b!695342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

