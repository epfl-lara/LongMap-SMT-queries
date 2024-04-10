; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114968 () Bool)

(assert start!114968)

(declare-fun b!1362672 () Bool)

(declare-fun res!906628 () Bool)

(declare-fun e!772947 () Bool)

(assert (=> b!1362672 (=> (not res!906628) (not e!772947))))

(declare-datatypes ((List!31797 0))(
  ( (Nil!31794) (Cons!31793 (h!33002 (_ BitVec 64)) (t!46485 List!31797)) )
))
(declare-fun acc!759 () List!31797)

(declare-fun noDuplicate!2363 (List!31797) Bool)

(assert (=> b!1362672 (= res!906628 (noDuplicate!2363 acc!759))))

(declare-fun b!1362673 () Bool)

(declare-fun res!906624 () Bool)

(assert (=> b!1362673 (=> (not res!906624) (not e!772947))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92646 0))(
  ( (array!92647 (arr!44756 (Array (_ BitVec 32) (_ BitVec 64))) (size!45306 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92646)

(assert (=> b!1362673 (= res!906624 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45306 a!3742)))))

(declare-fun b!1362674 () Bool)

(declare-fun res!906620 () Bool)

(assert (=> b!1362674 (=> (not res!906620) (not e!772947))))

(declare-fun arrayNoDuplicates!0 (array!92646 (_ BitVec 32) List!31797) Bool)

(assert (=> b!1362674 (= res!906620 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31794))))

(declare-fun b!1362675 () Bool)

(declare-fun res!906623 () Bool)

(assert (=> b!1362675 (=> (not res!906623) (not e!772947))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362675 (= res!906623 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45306 a!3742))))))

(declare-fun b!1362676 () Bool)

(declare-fun res!906621 () Bool)

(assert (=> b!1362676 (=> (not res!906621) (not e!772947))))

(declare-fun contains!9506 (List!31797 (_ BitVec 64)) Bool)

(assert (=> b!1362676 (= res!906621 (not (contains!9506 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362677 () Bool)

(declare-fun res!906625 () Bool)

(assert (=> b!1362677 (=> (not res!906625) (not e!772947))))

(assert (=> b!1362677 (= res!906625 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362678 () Bool)

(declare-datatypes ((Unit!44928 0))(
  ( (Unit!44929) )
))
(declare-fun e!772946 () Unit!44928)

(declare-fun lt!600551 () Unit!44928)

(assert (=> b!1362678 (= e!772946 lt!600551)))

(declare-fun lt!600553 () Unit!44928)

(declare-fun lemmaListSubSeqRefl!0 (List!31797) Unit!44928)

(assert (=> b!1362678 (= lt!600553 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!908 (List!31797 List!31797) Bool)

(assert (=> b!1362678 (subseq!908 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92646 List!31797 List!31797 (_ BitVec 32)) Unit!44928)

(declare-fun $colon$colon!911 (List!31797 (_ BitVec 64)) List!31797)

(assert (=> b!1362678 (= lt!600551 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!911 acc!759 (select (arr!44756 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362678 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!906626 () Bool)

(assert (=> start!114968 (=> (not res!906626) (not e!772947))))

(assert (=> start!114968 (= res!906626 (and (bvslt (size!45306 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45306 a!3742))))))

(assert (=> start!114968 e!772947))

(assert (=> start!114968 true))

(declare-fun array_inv!33784 (array!92646) Bool)

(assert (=> start!114968 (array_inv!33784 a!3742)))

(declare-fun b!1362679 () Bool)

(declare-fun res!906627 () Bool)

(assert (=> b!1362679 (=> (not res!906627) (not e!772947))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362679 (= res!906627 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362680 () Bool)

(declare-fun Unit!44930 () Unit!44928)

(assert (=> b!1362680 (= e!772946 Unit!44930)))

(declare-fun b!1362681 () Bool)

(declare-fun res!906622 () Bool)

(assert (=> b!1362681 (=> (not res!906622) (not e!772947))))

(assert (=> b!1362681 (= res!906622 (not (contains!9506 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362682 () Bool)

(declare-fun lt!600552 () Bool)

(assert (=> b!1362682 (= e!772947 (and (not (= from!3120 i!1404)) (not lt!600552) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600550 () Unit!44928)

(assert (=> b!1362682 (= lt!600550 e!772946)))

(declare-fun c!127466 () Bool)

(assert (=> b!1362682 (= c!127466 lt!600552)))

(assert (=> b!1362682 (= lt!600552 (validKeyInArray!0 (select (arr!44756 a!3742) from!3120)))))

(assert (= (and start!114968 res!906626) b!1362672))

(assert (= (and b!1362672 res!906628) b!1362681))

(assert (= (and b!1362681 res!906622) b!1362676))

(assert (= (and b!1362676 res!906621) b!1362674))

(assert (= (and b!1362674 res!906620) b!1362677))

(assert (= (and b!1362677 res!906625) b!1362675))

(assert (= (and b!1362675 res!906623) b!1362679))

(assert (= (and b!1362679 res!906627) b!1362673))

(assert (= (and b!1362673 res!906624) b!1362682))

(assert (= (and b!1362682 c!127466) b!1362678))

(assert (= (and b!1362682 (not c!127466)) b!1362680))

(declare-fun m!1247611 () Bool)

(assert (=> b!1362679 m!1247611))

(declare-fun m!1247613 () Bool)

(assert (=> b!1362682 m!1247613))

(assert (=> b!1362682 m!1247613))

(declare-fun m!1247615 () Bool)

(assert (=> b!1362682 m!1247615))

(declare-fun m!1247617 () Bool)

(assert (=> b!1362672 m!1247617))

(declare-fun m!1247619 () Bool)

(assert (=> b!1362676 m!1247619))

(declare-fun m!1247621 () Bool)

(assert (=> b!1362674 m!1247621))

(declare-fun m!1247623 () Bool)

(assert (=> start!114968 m!1247623))

(declare-fun m!1247625 () Bool)

(assert (=> b!1362677 m!1247625))

(declare-fun m!1247627 () Bool)

(assert (=> b!1362678 m!1247627))

(assert (=> b!1362678 m!1247613))

(declare-fun m!1247629 () Bool)

(assert (=> b!1362678 m!1247629))

(declare-fun m!1247631 () Bool)

(assert (=> b!1362678 m!1247631))

(declare-fun m!1247633 () Bool)

(assert (=> b!1362678 m!1247633))

(assert (=> b!1362678 m!1247613))

(assert (=> b!1362678 m!1247629))

(declare-fun m!1247635 () Bool)

(assert (=> b!1362678 m!1247635))

(declare-fun m!1247637 () Bool)

(assert (=> b!1362681 m!1247637))

(push 1)

