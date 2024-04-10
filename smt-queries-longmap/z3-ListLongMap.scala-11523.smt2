; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134176 () Bool)

(assert start!134176)

(declare-fun res!1071343 () Bool)

(declare-fun e!873875 () Bool)

(assert (=> start!134176 (=> (not res!1071343) (not e!873875))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104708 0))(
  ( (array!104709 (arr!50537 (Array (_ BitVec 32) (_ BitVec 64))) (size!51087 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104708)

(assert (=> start!134176 (= res!1071343 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51087 a!3481)) (bvslt (size!51087 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134176 e!873875))

(assert (=> start!134176 true))

(declare-fun array_inv!39264 (array!104708) Bool)

(assert (=> start!134176 (array_inv!39264 a!3481)))

(declare-fun b!1567653 () Bool)

(declare-fun e!873878 () Bool)

(declare-fun lt!673027 () Bool)

(assert (=> b!1567653 (= e!873878 (and (not lt!673027) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1567654 () Bool)

(declare-fun res!1071339 () Bool)

(assert (=> b!1567654 (=> (not res!1071339) (not e!873875))))

(declare-datatypes ((List!36669 0))(
  ( (Nil!36666) (Cons!36665 (h!38112 (_ BitVec 64)) (t!51577 List!36669)) )
))
(declare-fun acc!619 () List!36669)

(declare-fun noDuplicate!2643 (List!36669) Bool)

(assert (=> b!1567654 (= res!1071339 (noDuplicate!2643 acc!619))))

(declare-fun b!1567655 () Bool)

(assert (=> b!1567655 (= e!873875 e!873878)))

(declare-fun res!1071342 () Bool)

(assert (=> b!1567655 (=> (not res!1071342) (not e!873878))))

(declare-fun e!873876 () Bool)

(assert (=> b!1567655 (= res!1071342 e!873876)))

(declare-fun res!1071344 () Bool)

(assert (=> b!1567655 (=> res!1071344 e!873876)))

(assert (=> b!1567655 (= res!1071344 lt!673027)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567655 (= lt!673027 (not (validKeyInArray!0 (select (arr!50537 a!3481) from!2856))))))

(declare-fun b!1567656 () Bool)

(declare-fun res!1071345 () Bool)

(assert (=> b!1567656 (=> (not res!1071345) (not e!873875))))

(declare-fun contains!10371 (List!36669 (_ BitVec 64)) Bool)

(assert (=> b!1567656 (= res!1071345 (not (contains!10371 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567657 () Bool)

(declare-fun res!1071340 () Bool)

(assert (=> b!1567657 (=> (not res!1071340) (not e!873875))))

(assert (=> b!1567657 (= res!1071340 (bvslt from!2856 (size!51087 a!3481)))))

(declare-fun b!1567658 () Bool)

(declare-fun res!1071341 () Bool)

(assert (=> b!1567658 (=> (not res!1071341) (not e!873875))))

(assert (=> b!1567658 (= res!1071341 (not (contains!10371 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567659 () Bool)

(assert (=> b!1567659 (= e!873876 (not (contains!10371 acc!619 (select (arr!50537 a!3481) from!2856))))))

(assert (= (and start!134176 res!1071343) b!1567654))

(assert (= (and b!1567654 res!1071339) b!1567658))

(assert (= (and b!1567658 res!1071341) b!1567656))

(assert (= (and b!1567656 res!1071345) b!1567657))

(assert (= (and b!1567657 res!1071340) b!1567655))

(assert (= (and b!1567655 (not res!1071344)) b!1567659))

(assert (= (and b!1567655 res!1071342) b!1567653))

(declare-fun m!1442451 () Bool)

(assert (=> b!1567654 m!1442451))

(declare-fun m!1442453 () Bool)

(assert (=> start!134176 m!1442453))

(declare-fun m!1442455 () Bool)

(assert (=> b!1567658 m!1442455))

(declare-fun m!1442457 () Bool)

(assert (=> b!1567656 m!1442457))

(declare-fun m!1442459 () Bool)

(assert (=> b!1567655 m!1442459))

(assert (=> b!1567655 m!1442459))

(declare-fun m!1442461 () Bool)

(assert (=> b!1567655 m!1442461))

(assert (=> b!1567659 m!1442459))

(assert (=> b!1567659 m!1442459))

(declare-fun m!1442463 () Bool)

(assert (=> b!1567659 m!1442463))

(check-sat (not b!1567658) (not b!1567659) (not b!1567656) (not start!134176) (not b!1567654) (not b!1567655))
(check-sat)
