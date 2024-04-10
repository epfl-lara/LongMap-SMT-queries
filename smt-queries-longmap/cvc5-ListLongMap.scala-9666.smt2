; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114134 () Bool)

(assert start!114134)

(declare-fun b!1355618 () Bool)

(declare-fun res!900519 () Bool)

(declare-fun e!769804 () Bool)

(assert (=> b!1355618 (=> (not res!900519) (not e!769804))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92316 0))(
  ( (array!92317 (arr!44606 (Array (_ BitVec 32) (_ BitVec 64))) (size!45156 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92316)

(assert (=> b!1355618 (= res!900519 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45156 a!3742)))))

(declare-fun b!1355619 () Bool)

(declare-fun res!900523 () Bool)

(assert (=> b!1355619 (=> (not res!900523) (not e!769804))))

(declare-datatypes ((List!31647 0))(
  ( (Nil!31644) (Cons!31643 (h!32852 (_ BitVec 64)) (t!46305 List!31647)) )
))
(declare-fun acc!759 () List!31647)

(declare-fun contains!9356 (List!31647 (_ BitVec 64)) Bool)

(assert (=> b!1355619 (= res!900523 (not (contains!9356 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900522 () Bool)

(assert (=> start!114134 (=> (not res!900522) (not e!769804))))

(assert (=> start!114134 (= res!900522 (and (bvslt (size!45156 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45156 a!3742))))))

(assert (=> start!114134 e!769804))

(assert (=> start!114134 true))

(declare-fun array_inv!33634 (array!92316) Bool)

(assert (=> start!114134 (array_inv!33634 a!3742)))

(declare-fun b!1355620 () Bool)

(declare-datatypes ((Unit!44559 0))(
  ( (Unit!44560) )
))
(declare-fun e!769805 () Unit!44559)

(declare-fun lt!598704 () Unit!44559)

(assert (=> b!1355620 (= e!769805 lt!598704)))

(declare-fun lt!598707 () Unit!44559)

(declare-fun lemmaListSubSeqRefl!0 (List!31647) Unit!44559)

(assert (=> b!1355620 (= lt!598707 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!776 (List!31647 List!31647) Bool)

(assert (=> b!1355620 (subseq!776 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92316 List!31647 List!31647 (_ BitVec 32)) Unit!44559)

(declare-fun $colon$colon!791 (List!31647 (_ BitVec 64)) List!31647)

(assert (=> b!1355620 (= lt!598704 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!791 acc!759 (select (arr!44606 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92316 (_ BitVec 32) List!31647) Bool)

(assert (=> b!1355620 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355621 () Bool)

(declare-fun res!900520 () Bool)

(assert (=> b!1355621 (=> (not res!900520) (not e!769804))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355621 (= res!900520 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355622 () Bool)

(declare-fun res!900515 () Bool)

(assert (=> b!1355622 (=> (not res!900515) (not e!769804))))

(assert (=> b!1355622 (= res!900515 (not (contains!9356 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355623 () Bool)

(declare-fun res!900521 () Bool)

(assert (=> b!1355623 (=> (not res!900521) (not e!769804))))

(declare-fun noDuplicate!2213 (List!31647) Bool)

(assert (=> b!1355623 (= res!900521 (noDuplicate!2213 acc!759))))

(declare-fun b!1355624 () Bool)

(declare-fun e!769807 () Bool)

(assert (=> b!1355624 (= e!769804 e!769807)))

(declare-fun res!900516 () Bool)

(assert (=> b!1355624 (=> (not res!900516) (not e!769807))))

(declare-fun lt!598706 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355624 (= res!900516 (and (not (= from!3120 i!1404)) (not lt!598706) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598705 () Unit!44559)

(assert (=> b!1355624 (= lt!598705 e!769805)))

(declare-fun c!126992 () Bool)

(assert (=> b!1355624 (= c!126992 lt!598706)))

(assert (=> b!1355624 (= lt!598706 (validKeyInArray!0 (select (arr!44606 a!3742) from!3120)))))

(declare-fun b!1355625 () Bool)

(declare-fun res!900514 () Bool)

(assert (=> b!1355625 (=> (not res!900514) (not e!769804))))

(assert (=> b!1355625 (= res!900514 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45156 a!3742))))))

(declare-fun b!1355626 () Bool)

(assert (=> b!1355626 (= e!769807 false)))

(declare-fun lt!598708 () Bool)

(assert (=> b!1355626 (= lt!598708 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355627 () Bool)

(declare-fun res!900518 () Bool)

(assert (=> b!1355627 (=> (not res!900518) (not e!769804))))

(assert (=> b!1355627 (= res!900518 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31644))))

(declare-fun b!1355628 () Bool)

(declare-fun res!900517 () Bool)

(assert (=> b!1355628 (=> (not res!900517) (not e!769804))))

(assert (=> b!1355628 (= res!900517 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355629 () Bool)

(declare-fun Unit!44561 () Unit!44559)

(assert (=> b!1355629 (= e!769805 Unit!44561)))

(assert (= (and start!114134 res!900522) b!1355623))

(assert (= (and b!1355623 res!900521) b!1355619))

(assert (= (and b!1355619 res!900523) b!1355622))

(assert (= (and b!1355622 res!900515) b!1355627))

(assert (= (and b!1355627 res!900518) b!1355628))

(assert (= (and b!1355628 res!900517) b!1355625))

(assert (= (and b!1355625 res!900514) b!1355621))

(assert (= (and b!1355621 res!900520) b!1355618))

(assert (= (and b!1355618 res!900519) b!1355624))

(assert (= (and b!1355624 c!126992) b!1355620))

(assert (= (and b!1355624 (not c!126992)) b!1355629))

(assert (= (and b!1355624 res!900516) b!1355626))

(declare-fun m!1241761 () Bool)

(assert (=> b!1355621 m!1241761))

(declare-fun m!1241763 () Bool)

(assert (=> b!1355619 m!1241763))

(declare-fun m!1241765 () Bool)

(assert (=> b!1355627 m!1241765))

(declare-fun m!1241767 () Bool)

(assert (=> b!1355620 m!1241767))

(declare-fun m!1241769 () Bool)

(assert (=> b!1355620 m!1241769))

(declare-fun m!1241771 () Bool)

(assert (=> b!1355620 m!1241771))

(declare-fun m!1241773 () Bool)

(assert (=> b!1355620 m!1241773))

(declare-fun m!1241775 () Bool)

(assert (=> b!1355620 m!1241775))

(assert (=> b!1355620 m!1241769))

(assert (=> b!1355620 m!1241771))

(declare-fun m!1241777 () Bool)

(assert (=> b!1355620 m!1241777))

(declare-fun m!1241779 () Bool)

(assert (=> b!1355623 m!1241779))

(declare-fun m!1241781 () Bool)

(assert (=> start!114134 m!1241781))

(assert (=> b!1355626 m!1241775))

(declare-fun m!1241783 () Bool)

(assert (=> b!1355628 m!1241783))

(assert (=> b!1355624 m!1241769))

(assert (=> b!1355624 m!1241769))

(declare-fun m!1241785 () Bool)

(assert (=> b!1355624 m!1241785))

(declare-fun m!1241787 () Bool)

(assert (=> b!1355622 m!1241787))

(push 1)

