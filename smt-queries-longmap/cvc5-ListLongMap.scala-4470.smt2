; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62196 () Bool)

(assert start!62196)

(declare-fun b!696513 () Bool)

(declare-fun res!460595 () Bool)

(declare-fun e!396016 () Bool)

(assert (=> b!696513 (=> (not res!460595) (not e!396016))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39964 0))(
  ( (array!39965 (arr!19141 (Array (_ BitVec 32) (_ BitVec 64))) (size!19523 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39964)

(assert (=> b!696513 (= res!460595 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19523 a!3626))))))

(declare-fun b!696514 () Bool)

(declare-fun res!460606 () Bool)

(assert (=> b!696514 (=> (not res!460606) (not e!396016))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696514 (= res!460606 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696515 () Bool)

(declare-fun e!396012 () Bool)

(declare-datatypes ((List!13221 0))(
  ( (Nil!13218) (Cons!13217 (h!14262 (_ BitVec 64)) (t!19494 List!13221)) )
))
(declare-fun acc!681 () List!13221)

(declare-fun contains!3743 (List!13221 (_ BitVec 64)) Bool)

(assert (=> b!696515 (= e!396012 (not (contains!3743 acc!681 k!2843)))))

(declare-fun b!696516 () Bool)

(declare-fun res!460600 () Bool)

(assert (=> b!696516 (=> (not res!460600) (not e!396016))))

(declare-fun arrayNoDuplicates!0 (array!39964 (_ BitVec 32) List!13221) Bool)

(assert (=> b!696516 (= res!460600 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13218))))

(declare-fun b!696517 () Bool)

(declare-fun res!460591 () Bool)

(assert (=> b!696517 (=> (not res!460591) (not e!396016))))

(assert (=> b!696517 (= res!460591 (not (contains!3743 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696518 () Bool)

(declare-fun e!396013 () Bool)

(assert (=> b!696518 (= e!396013 e!396012)))

(declare-fun res!460603 () Bool)

(assert (=> b!696518 (=> (not res!460603) (not e!396012))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696518 (= res!460603 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!460593 () Bool)

(assert (=> start!62196 (=> (not res!460593) (not e!396016))))

(assert (=> start!62196 (= res!460593 (and (bvslt (size!19523 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19523 a!3626))))))

(assert (=> start!62196 e!396016))

(assert (=> start!62196 true))

(declare-fun array_inv!15024 (array!39964) Bool)

(assert (=> start!62196 (array_inv!15024 a!3626)))

(declare-fun b!696512 () Bool)

(declare-fun res!460592 () Bool)

(assert (=> b!696512 (=> (not res!460592) (not e!396016))))

(declare-fun noDuplicate!1012 (List!13221) Bool)

(assert (=> b!696512 (= res!460592 (noDuplicate!1012 acc!681))))

(declare-fun b!696519 () Bool)

(declare-fun res!460599 () Bool)

(assert (=> b!696519 (=> (not res!460599) (not e!396016))))

(assert (=> b!696519 (= res!460599 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696520 () Bool)

(assert (=> b!696520 (= e!396016 false)))

(declare-fun lt!316872 () Bool)

(assert (=> b!696520 (= lt!316872 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696521 () Bool)

(declare-fun res!460596 () Bool)

(assert (=> b!696521 (=> (not res!460596) (not e!396016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696521 (= res!460596 (not (validKeyInArray!0 (select (arr!19141 a!3626) from!3004))))))

(declare-fun b!696522 () Bool)

(declare-fun e!396017 () Bool)

(declare-fun e!396010 () Bool)

(assert (=> b!696522 (= e!396017 e!396010)))

(declare-fun res!460608 () Bool)

(assert (=> b!696522 (=> (not res!460608) (not e!396010))))

(assert (=> b!696522 (= res!460608 (bvsle from!3004 i!1382))))

(declare-fun b!696523 () Bool)

(declare-fun res!460594 () Bool)

(assert (=> b!696523 (=> (not res!460594) (not e!396016))))

(assert (=> b!696523 (= res!460594 (not (contains!3743 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696524 () Bool)

(declare-fun res!460607 () Bool)

(assert (=> b!696524 (=> (not res!460607) (not e!396016))))

(assert (=> b!696524 (= res!460607 e!396013)))

(declare-fun res!460609 () Bool)

(assert (=> b!696524 (=> res!460609 e!396013)))

(declare-fun e!396015 () Bool)

(assert (=> b!696524 (= res!460609 e!396015)))

(declare-fun res!460605 () Bool)

(assert (=> b!696524 (=> (not res!460605) (not e!396015))))

(assert (=> b!696524 (= res!460605 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696525 () Bool)

(declare-fun res!460602 () Bool)

(assert (=> b!696525 (=> (not res!460602) (not e!396016))))

(assert (=> b!696525 (= res!460602 e!396017)))

(declare-fun res!460601 () Bool)

(assert (=> b!696525 (=> res!460601 e!396017)))

(declare-fun e!396011 () Bool)

(assert (=> b!696525 (= res!460601 e!396011)))

(declare-fun res!460597 () Bool)

(assert (=> b!696525 (=> (not res!460597) (not e!396011))))

(assert (=> b!696525 (= res!460597 (bvsgt from!3004 i!1382))))

(declare-fun b!696526 () Bool)

(declare-fun res!460590 () Bool)

(assert (=> b!696526 (=> (not res!460590) (not e!396016))))

(assert (=> b!696526 (= res!460590 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696527 () Bool)

(assert (=> b!696527 (= e!396010 (not (contains!3743 acc!681 k!2843)))))

(declare-fun b!696528 () Bool)

(declare-fun res!460604 () Bool)

(assert (=> b!696528 (=> (not res!460604) (not e!396016))))

(assert (=> b!696528 (= res!460604 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19523 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696529 () Bool)

(declare-fun res!460598 () Bool)

(assert (=> b!696529 (=> (not res!460598) (not e!396016))))

(assert (=> b!696529 (= res!460598 (validKeyInArray!0 k!2843))))

(declare-fun b!696530 () Bool)

(assert (=> b!696530 (= e!396015 (contains!3743 acc!681 k!2843))))

(declare-fun b!696531 () Bool)

(assert (=> b!696531 (= e!396011 (contains!3743 acc!681 k!2843))))

(assert (= (and start!62196 res!460593) b!696512))

(assert (= (and b!696512 res!460592) b!696523))

(assert (= (and b!696523 res!460594) b!696517))

(assert (= (and b!696517 res!460591) b!696525))

(assert (= (and b!696525 res!460597) b!696531))

(assert (= (and b!696525 (not res!460601)) b!696522))

(assert (= (and b!696522 res!460608) b!696527))

(assert (= (and b!696525 res!460602) b!696516))

(assert (= (and b!696516 res!460600) b!696519))

(assert (= (and b!696519 res!460599) b!696513))

(assert (= (and b!696513 res!460595) b!696529))

(assert (= (and b!696529 res!460598) b!696514))

(assert (= (and b!696514 res!460606) b!696528))

(assert (= (and b!696528 res!460604) b!696521))

(assert (= (and b!696521 res!460596) b!696526))

(assert (= (and b!696526 res!460590) b!696524))

(assert (= (and b!696524 res!460605) b!696530))

(assert (= (and b!696524 (not res!460609)) b!696518))

(assert (= (and b!696518 res!460603) b!696515))

(assert (= (and b!696524 res!460607) b!696520))

(declare-fun m!656805 () Bool)

(assert (=> b!696516 m!656805))

(declare-fun m!656807 () Bool)

(assert (=> b!696523 m!656807))

(declare-fun m!656809 () Bool)

(assert (=> b!696521 m!656809))

(assert (=> b!696521 m!656809))

(declare-fun m!656811 () Bool)

(assert (=> b!696521 m!656811))

(declare-fun m!656813 () Bool)

(assert (=> b!696527 m!656813))

(assert (=> b!696531 m!656813))

(declare-fun m!656815 () Bool)

(assert (=> b!696517 m!656815))

(declare-fun m!656817 () Bool)

(assert (=> b!696529 m!656817))

(assert (=> b!696515 m!656813))

(declare-fun m!656819 () Bool)

(assert (=> b!696519 m!656819))

(declare-fun m!656821 () Bool)

(assert (=> b!696514 m!656821))

(declare-fun m!656823 () Bool)

(assert (=> start!62196 m!656823))

(assert (=> b!696530 m!656813))

(declare-fun m!656825 () Bool)

(assert (=> b!696512 m!656825))

(declare-fun m!656827 () Bool)

(assert (=> b!696520 m!656827))

(push 1)

(assert (not b!696527))

(assert (not b!696512))

(assert (not b!696521))

(assert (not b!696531))

(assert (not b!696517))

(assert (not b!696519))

(assert (not b!696529))

(assert (not start!62196))

(assert (not b!696530))

(assert (not b!696516))

(assert (not b!696515))

(assert (not b!696520))

(assert (not b!696523))

(assert (not b!696514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

