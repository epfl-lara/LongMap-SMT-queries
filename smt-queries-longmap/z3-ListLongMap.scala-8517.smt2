; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103900 () Bool)

(assert start!103900)

(declare-fun b!1243588 () Bool)

(declare-fun res!829372 () Bool)

(declare-fun e!704974 () Bool)

(assert (=> b!1243588 (=> (not res!829372) (not e!704974))))

(declare-datatypes ((array!79992 0))(
  ( (array!79993 (arr!38589 (Array (_ BitVec 32) (_ BitVec 64))) (size!39125 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79992)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27392 0))(
  ( (Nil!27389) (Cons!27388 (h!28597 (_ BitVec 64)) (t!40861 List!27392)) )
))
(declare-fun arrayNoDuplicates!0 (array!79992 (_ BitVec 32) List!27392) Bool)

(assert (=> b!1243588 (= res!829372 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27389))))

(declare-fun b!1243589 () Bool)

(declare-fun res!829369 () Bool)

(declare-fun e!704975 () Bool)

(assert (=> b!1243589 (=> (not res!829369) (not e!704975))))

(declare-fun lt!562428 () List!27392)

(declare-fun contains!7413 (List!27392 (_ BitVec 64)) Bool)

(assert (=> b!1243589 (= res!829369 (not (contains!7413 lt!562428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243590 () Bool)

(declare-fun res!829371 () Bool)

(assert (=> b!1243590 (=> (not res!829371) (not e!704975))))

(declare-fun noDuplicate!1991 (List!27392) Bool)

(assert (=> b!1243590 (= res!829371 (noDuplicate!1991 lt!562428))))

(declare-fun b!1243591 () Bool)

(declare-fun res!829367 () Bool)

(assert (=> b!1243591 (=> (not res!829367) (not e!704975))))

(assert (=> b!1243591 (= res!829367 (not (contains!7413 lt!562428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243592 () Bool)

(declare-fun res!829375 () Bool)

(assert (=> b!1243592 (=> (not res!829375) (not e!704974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243592 (= res!829375 (validKeyInArray!0 (select (arr!38589 a!3892) from!3270)))))

(declare-fun b!1243593 () Bool)

(declare-fun res!829365 () Bool)

(assert (=> b!1243593 (=> (not res!829365) (not e!704975))))

(declare-fun subseq!639 (List!27392 List!27392) Bool)

(assert (=> b!1243593 (= res!829365 (subseq!639 Nil!27389 lt!562428))))

(declare-fun b!1243594 () Bool)

(declare-fun res!829373 () Bool)

(assert (=> b!1243594 (=> (not res!829373) (not e!704975))))

(assert (=> b!1243594 (= res!829373 (not (contains!7413 Nil!27389 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243595 () Bool)

(assert (=> b!1243595 (= e!704975 false)))

(declare-fun lt!562429 () Bool)

(assert (=> b!1243595 (= lt!562429 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562428))))

(declare-datatypes ((Unit!41287 0))(
  ( (Unit!41288) )
))
(declare-fun lt!562430 () Unit!41287)

(declare-fun noDuplicateSubseq!93 (List!27392 List!27392) Unit!41287)

(assert (=> b!1243595 (= lt!562430 (noDuplicateSubseq!93 Nil!27389 lt!562428))))

(declare-fun b!1243596 () Bool)

(declare-fun res!829366 () Bool)

(assert (=> b!1243596 (=> (not res!829366) (not e!704974))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243596 (= res!829366 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39125 a!3892)) (not (= newFrom!287 (size!39125 a!3892)))))))

(declare-fun res!829374 () Bool)

(assert (=> start!103900 (=> (not res!829374) (not e!704974))))

(assert (=> start!103900 (= res!829374 (and (bvslt (size!39125 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39125 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39125 a!3892))))))

(assert (=> start!103900 e!704974))

(declare-fun array_inv!29437 (array!79992) Bool)

(assert (=> start!103900 (array_inv!29437 a!3892)))

(assert (=> start!103900 true))

(declare-fun b!1243597 () Bool)

(declare-fun res!829370 () Bool)

(assert (=> b!1243597 (=> (not res!829370) (not e!704975))))

(assert (=> b!1243597 (= res!829370 (not (contains!7413 Nil!27389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243598 () Bool)

(assert (=> b!1243598 (= e!704974 e!704975)))

(declare-fun res!829368 () Bool)

(assert (=> b!1243598 (=> (not res!829368) (not e!704975))))

(assert (=> b!1243598 (= res!829368 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243598 (= lt!562428 (Cons!27388 (select (arr!38589 a!3892) from!3270) Nil!27389))))

(assert (= (and start!103900 res!829374) b!1243588))

(assert (= (and b!1243588 res!829372) b!1243596))

(assert (= (and b!1243596 res!829366) b!1243592))

(assert (= (and b!1243592 res!829375) b!1243598))

(assert (= (and b!1243598 res!829368) b!1243590))

(assert (= (and b!1243590 res!829371) b!1243589))

(assert (= (and b!1243589 res!829369) b!1243591))

(assert (= (and b!1243591 res!829367) b!1243597))

(assert (= (and b!1243597 res!829370) b!1243594))

(assert (= (and b!1243594 res!829373) b!1243593))

(assert (= (and b!1243593 res!829365) b!1243595))

(declare-fun m!1146107 () Bool)

(assert (=> b!1243591 m!1146107))

(declare-fun m!1146109 () Bool)

(assert (=> b!1243588 m!1146109))

(declare-fun m!1146111 () Bool)

(assert (=> b!1243592 m!1146111))

(assert (=> b!1243592 m!1146111))

(declare-fun m!1146113 () Bool)

(assert (=> b!1243592 m!1146113))

(declare-fun m!1146115 () Bool)

(assert (=> b!1243597 m!1146115))

(declare-fun m!1146117 () Bool)

(assert (=> b!1243594 m!1146117))

(declare-fun m!1146119 () Bool)

(assert (=> b!1243589 m!1146119))

(declare-fun m!1146121 () Bool)

(assert (=> b!1243590 m!1146121))

(declare-fun m!1146123 () Bool)

(assert (=> b!1243593 m!1146123))

(declare-fun m!1146125 () Bool)

(assert (=> start!103900 m!1146125))

(assert (=> b!1243598 m!1146111))

(declare-fun m!1146127 () Bool)

(assert (=> b!1243595 m!1146127))

(declare-fun m!1146129 () Bool)

(assert (=> b!1243595 m!1146129))

(check-sat (not b!1243590) (not b!1243594) (not b!1243591) (not start!103900) (not b!1243595) (not b!1243597) (not b!1243589) (not b!1243592) (not b!1243588) (not b!1243593))
(check-sat)
