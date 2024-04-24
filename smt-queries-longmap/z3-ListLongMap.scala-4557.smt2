; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63574 () Bool)

(assert start!63574)

(declare-fun b!715775 () Bool)

(declare-fun res!478626 () Bool)

(declare-fun e!402044 () Bool)

(assert (=> b!715775 (=> (not res!478626) (not e!402044))))

(declare-datatypes ((List!13344 0))(
  ( (Nil!13341) (Cons!13340 (h!14388 (_ BitVec 64)) (t!19651 List!13344)) )
))
(declare-fun newAcc!49 () List!13344)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3996 (List!13344 (_ BitVec 64)) Bool)

(assert (=> b!715775 (= res!478626 (contains!3996 newAcc!49 k0!2824))))

(declare-fun b!715776 () Bool)

(declare-fun res!478634 () Bool)

(assert (=> b!715776 (=> (not res!478634) (not e!402044))))

(declare-fun noDuplicate!1270 (List!13344) Bool)

(assert (=> b!715776 (= res!478634 (noDuplicate!1270 newAcc!49))))

(declare-fun b!715777 () Bool)

(declare-fun res!478630 () Bool)

(assert (=> b!715777 (=> (not res!478630) (not e!402044))))

(declare-fun acc!652 () List!13344)

(assert (=> b!715777 (= res!478630 (not (contains!3996 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715778 () Bool)

(declare-fun res!478628 () Bool)

(assert (=> b!715778 (=> (not res!478628) (not e!402044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715778 (= res!478628 (validKeyInArray!0 k0!2824))))

(declare-fun b!715779 () Bool)

(declare-fun res!478637 () Bool)

(assert (=> b!715779 (=> (not res!478637) (not e!402044))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40524 0))(
  ( (array!40525 (arr!19396 (Array (_ BitVec 32) (_ BitVec 64))) (size!19811 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40524)

(assert (=> b!715779 (= res!478637 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19811 a!3591)))))

(declare-fun b!715780 () Bool)

(declare-fun res!478636 () Bool)

(assert (=> b!715780 (=> (not res!478636) (not e!402044))))

(assert (=> b!715780 (= res!478636 (not (validKeyInArray!0 (select (arr!19396 a!3591) from!2969))))))

(declare-fun b!715781 () Bool)

(declare-fun res!478635 () Bool)

(assert (=> b!715781 (=> (not res!478635) (not e!402044))))

(declare-fun arrayContainsKey!0 (array!40524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715781 (= res!478635 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!478623 () Bool)

(assert (=> start!63574 (=> (not res!478623) (not e!402044))))

(assert (=> start!63574 (= res!478623 (and (bvslt (size!19811 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19811 a!3591))))))

(assert (=> start!63574 e!402044))

(assert (=> start!63574 true))

(declare-fun array_inv!15255 (array!40524) Bool)

(assert (=> start!63574 (array_inv!15255 a!3591)))

(declare-fun b!715782 () Bool)

(declare-fun res!478629 () Bool)

(assert (=> b!715782 (=> (not res!478629) (not e!402044))))

(declare-fun arrayNoDuplicates!0 (array!40524 (_ BitVec 32) List!13344) Bool)

(assert (=> b!715782 (= res!478629 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715783 () Bool)

(declare-fun res!478625 () Bool)

(assert (=> b!715783 (=> (not res!478625) (not e!402044))))

(assert (=> b!715783 (= res!478625 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715784 () Bool)

(declare-fun res!478632 () Bool)

(assert (=> b!715784 (=> (not res!478632) (not e!402044))))

(assert (=> b!715784 (= res!478632 (noDuplicate!1270 acc!652))))

(declare-fun b!715785 () Bool)

(declare-fun res!478627 () Bool)

(assert (=> b!715785 (=> (not res!478627) (not e!402044))))

(assert (=> b!715785 (= res!478627 (not (contains!3996 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715786 () Bool)

(declare-fun res!478638 () Bool)

(assert (=> b!715786 (=> (not res!478638) (not e!402044))))

(assert (=> b!715786 (= res!478638 (not (contains!3996 acc!652 k0!2824)))))

(declare-fun b!715787 () Bool)

(declare-fun res!478631 () Bool)

(assert (=> b!715787 (=> (not res!478631) (not e!402044))))

(declare-fun -!428 (List!13344 (_ BitVec 64)) List!13344)

(assert (=> b!715787 (= res!478631 (= (-!428 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715788 () Bool)

(assert (=> b!715788 (= e!402044 false)))

(declare-fun lt!318960 () Bool)

(assert (=> b!715788 (= lt!318960 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715789 () Bool)

(declare-fun res!478633 () Bool)

(assert (=> b!715789 (=> (not res!478633) (not e!402044))))

(assert (=> b!715789 (= res!478633 (not (contains!3996 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715790 () Bool)

(declare-fun res!478639 () Bool)

(assert (=> b!715790 (=> (not res!478639) (not e!402044))))

(assert (=> b!715790 (= res!478639 (not (contains!3996 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715791 () Bool)

(declare-fun res!478622 () Bool)

(assert (=> b!715791 (=> (not res!478622) (not e!402044))))

(assert (=> b!715791 (= res!478622 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715792 () Bool)

(declare-fun res!478624 () Bool)

(assert (=> b!715792 (=> (not res!478624) (not e!402044))))

(declare-fun subseq!464 (List!13344 List!13344) Bool)

(assert (=> b!715792 (= res!478624 (subseq!464 acc!652 newAcc!49))))

(assert (= (and start!63574 res!478623) b!715784))

(assert (= (and b!715784 res!478632) b!715776))

(assert (= (and b!715776 res!478634) b!715777))

(assert (= (and b!715777 res!478630) b!715789))

(assert (= (and b!715789 res!478633) b!715781))

(assert (= (and b!715781 res!478635) b!715786))

(assert (= (and b!715786 res!478638) b!715778))

(assert (= (and b!715778 res!478628) b!715782))

(assert (= (and b!715782 res!478629) b!715792))

(assert (= (and b!715792 res!478624) b!715775))

(assert (= (and b!715775 res!478626) b!715787))

(assert (= (and b!715787 res!478631) b!715790))

(assert (= (and b!715790 res!478639) b!715785))

(assert (= (and b!715785 res!478627) b!715779))

(assert (= (and b!715779 res!478637) b!715780))

(assert (= (and b!715780 res!478636) b!715783))

(assert (= (and b!715783 res!478625) b!715791))

(assert (= (and b!715791 res!478622) b!715788))

(declare-fun m!672489 () Bool)

(assert (=> b!715778 m!672489))

(declare-fun m!672491 () Bool)

(assert (=> b!715785 m!672491))

(declare-fun m!672493 () Bool)

(assert (=> b!715782 m!672493))

(declare-fun m!672495 () Bool)

(assert (=> b!715788 m!672495))

(declare-fun m!672497 () Bool)

(assert (=> b!715775 m!672497))

(declare-fun m!672499 () Bool)

(assert (=> b!715787 m!672499))

(declare-fun m!672501 () Bool)

(assert (=> b!715790 m!672501))

(declare-fun m!672503 () Bool)

(assert (=> b!715789 m!672503))

(declare-fun m!672505 () Bool)

(assert (=> b!715792 m!672505))

(declare-fun m!672507 () Bool)

(assert (=> b!715791 m!672507))

(declare-fun m!672509 () Bool)

(assert (=> b!715781 m!672509))

(declare-fun m!672511 () Bool)

(assert (=> b!715786 m!672511))

(declare-fun m!672513 () Bool)

(assert (=> b!715780 m!672513))

(assert (=> b!715780 m!672513))

(declare-fun m!672515 () Bool)

(assert (=> b!715780 m!672515))

(declare-fun m!672517 () Bool)

(assert (=> b!715777 m!672517))

(declare-fun m!672519 () Bool)

(assert (=> start!63574 m!672519))

(declare-fun m!672521 () Bool)

(assert (=> b!715784 m!672521))

(declare-fun m!672523 () Bool)

(assert (=> b!715776 m!672523))

(check-sat (not b!715789) (not b!715787) (not b!715791) (not b!715776) (not b!715785) (not b!715775) (not b!715781) (not b!715782) (not b!715786) (not b!715788) (not b!715784) (not b!715780) (not b!715777) (not b!715778) (not b!715792) (not start!63574) (not b!715790))
(check-sat)
