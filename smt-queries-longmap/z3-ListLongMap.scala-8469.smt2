; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103354 () Bool)

(assert start!103354)

(declare-fun b!1239425 () Bool)

(declare-fun res!826364 () Bool)

(declare-fun e!702605 () Bool)

(assert (=> b!1239425 (=> res!826364 e!702605)))

(declare-datatypes ((List!27302 0))(
  ( (Nil!27299) (Cons!27298 (h!28516 (_ BitVec 64)) (t!40757 List!27302)) )
))
(declare-fun lt!561680 () List!27302)

(declare-fun noDuplicate!1954 (List!27302) Bool)

(assert (=> b!1239425 (= res!826364 (not (noDuplicate!1954 lt!561680)))))

(declare-fun b!1239426 () Bool)

(declare-fun res!826363 () Bool)

(declare-fun e!702603 () Bool)

(assert (=> b!1239426 (=> (not res!826363) (not e!702603))))

(declare-fun acc!846 () List!27302)

(declare-fun contains!7373 (List!27302 (_ BitVec 64)) Bool)

(assert (=> b!1239426 (= res!826363 (not (contains!7373 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239427 () Bool)

(declare-fun res!826358 () Bool)

(assert (=> b!1239427 (=> (not res!826358) (not e!702603))))

(assert (=> b!1239427 (= res!826358 (noDuplicate!1954 acc!846))))

(declare-fun b!1239428 () Bool)

(declare-fun res!826366 () Bool)

(assert (=> b!1239428 (=> res!826366 e!702605)))

(assert (=> b!1239428 (= res!826366 (contains!7373 lt!561680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239429 () Bool)

(declare-fun res!826365 () Bool)

(assert (=> b!1239429 (=> (not res!826365) (not e!702603))))

(declare-datatypes ((array!79838 0))(
  ( (array!79839 (arr!38516 (Array (_ BitVec 32) (_ BitVec 64))) (size!39053 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79838)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79838 (_ BitVec 32) List!27302) Bool)

(assert (=> b!1239429 (= res!826365 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239430 () Bool)

(declare-fun res!826362 () Bool)

(assert (=> b!1239430 (=> (not res!826362) (not e!702603))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239430 (= res!826362 (contains!7373 acc!846 k0!2925))))

(declare-fun b!1239431 () Bool)

(declare-fun res!826368 () Bool)

(assert (=> b!1239431 (=> (not res!826368) (not e!702603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239431 (= res!826368 (validKeyInArray!0 (select (arr!38516 a!3835) from!3213)))))

(declare-fun b!1239432 () Bool)

(declare-fun res!826367 () Bool)

(assert (=> b!1239432 (=> (not res!826367) (not e!702603))))

(assert (=> b!1239432 (= res!826367 (not (contains!7373 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239433 () Bool)

(assert (=> b!1239433 (= e!702603 (not e!702605))))

(declare-fun res!826361 () Bool)

(assert (=> b!1239433 (=> res!826361 e!702605)))

(assert (=> b!1239433 (= res!826361 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!593 (List!27302 List!27302) Bool)

(assert (=> b!1239433 (subseq!593 acc!846 lt!561680)))

(declare-datatypes ((Unit!41065 0))(
  ( (Unit!41066) )
))
(declare-fun lt!561683 () Unit!41065)

(declare-fun subseqTail!80 (List!27302 List!27302) Unit!41065)

(assert (=> b!1239433 (= lt!561683 (subseqTail!80 lt!561680 lt!561680))))

(assert (=> b!1239433 (subseq!593 lt!561680 lt!561680)))

(declare-fun lt!561681 () Unit!41065)

(declare-fun lemmaListSubSeqRefl!0 (List!27302) Unit!41065)

(assert (=> b!1239433 (= lt!561681 (lemmaListSubSeqRefl!0 lt!561680))))

(assert (=> b!1239433 (= lt!561680 (Cons!27298 (select (arr!38516 a!3835) from!3213) acc!846))))

(declare-fun res!826359 () Bool)

(assert (=> start!103354 (=> (not res!826359) (not e!702603))))

(assert (=> start!103354 (= res!826359 (and (bvslt (size!39053 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39053 a!3835))))))

(assert (=> start!103354 e!702603))

(declare-fun array_inv!29454 (array!79838) Bool)

(assert (=> start!103354 (array_inv!29454 a!3835)))

(assert (=> start!103354 true))

(declare-fun b!1239434 () Bool)

(declare-fun res!826360 () Bool)

(assert (=> b!1239434 (=> (not res!826360) (not e!702603))))

(assert (=> b!1239434 (= res!826360 (not (= from!3213 (bvsub (size!39053 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239435 () Bool)

(assert (=> b!1239435 (= e!702605 true)))

(declare-fun lt!561682 () Bool)

(assert (=> b!1239435 (= lt!561682 (contains!7373 lt!561680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103354 res!826359) b!1239427))

(assert (= (and b!1239427 res!826358) b!1239432))

(assert (= (and b!1239432 res!826367) b!1239426))

(assert (= (and b!1239426 res!826363) b!1239429))

(assert (= (and b!1239429 res!826365) b!1239430))

(assert (= (and b!1239430 res!826362) b!1239434))

(assert (= (and b!1239434 res!826360) b!1239431))

(assert (= (and b!1239431 res!826368) b!1239433))

(assert (= (and b!1239433 (not res!826361)) b!1239425))

(assert (= (and b!1239425 (not res!826364)) b!1239428))

(assert (= (and b!1239428 (not res!826366)) b!1239435))

(declare-fun m!1143323 () Bool)

(assert (=> b!1239430 m!1143323))

(declare-fun m!1143325 () Bool)

(assert (=> start!103354 m!1143325))

(declare-fun m!1143327 () Bool)

(assert (=> b!1239433 m!1143327))

(declare-fun m!1143329 () Bool)

(assert (=> b!1239433 m!1143329))

(declare-fun m!1143331 () Bool)

(assert (=> b!1239433 m!1143331))

(declare-fun m!1143333 () Bool)

(assert (=> b!1239433 m!1143333))

(declare-fun m!1143335 () Bool)

(assert (=> b!1239433 m!1143335))

(declare-fun m!1143337 () Bool)

(assert (=> b!1239429 m!1143337))

(declare-fun m!1143339 () Bool)

(assert (=> b!1239426 m!1143339))

(declare-fun m!1143341 () Bool)

(assert (=> b!1239425 m!1143341))

(assert (=> b!1239431 m!1143333))

(assert (=> b!1239431 m!1143333))

(declare-fun m!1143343 () Bool)

(assert (=> b!1239431 m!1143343))

(declare-fun m!1143345 () Bool)

(assert (=> b!1239432 m!1143345))

(declare-fun m!1143347 () Bool)

(assert (=> b!1239435 m!1143347))

(declare-fun m!1143349 () Bool)

(assert (=> b!1239427 m!1143349))

(declare-fun m!1143351 () Bool)

(assert (=> b!1239428 m!1143351))

(check-sat (not b!1239435) (not b!1239430) (not b!1239428) (not b!1239433) (not start!103354) (not b!1239432) (not b!1239427) (not b!1239431) (not b!1239429) (not b!1239425) (not b!1239426))
(check-sat)
