; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114084 () Bool)

(assert start!114084)

(declare-fun b!1354578 () Bool)

(declare-fun res!899633 () Bool)

(declare-fun e!769477 () Bool)

(assert (=> b!1354578 (=> (not res!899633) (not e!769477))))

(declare-datatypes ((List!31622 0))(
  ( (Nil!31619) (Cons!31618 (h!32827 (_ BitVec 64)) (t!46280 List!31622)) )
))
(declare-fun lt!598305 () List!31622)

(declare-datatypes ((array!92266 0))(
  ( (array!92267 (arr!44581 (Array (_ BitVec 32) (_ BitVec 64))) (size!45131 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92266)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92266 (_ BitVec 32) List!31622) Bool)

(assert (=> b!1354578 (= res!899633 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598305))))

(declare-fun b!1354579 () Bool)

(declare-fun res!899638 () Bool)

(assert (=> b!1354579 (=> (not res!899638) (not e!769477))))

(declare-fun contains!9331 (List!31622 (_ BitVec 64)) Bool)

(assert (=> b!1354579 (= res!899638 (not (contains!9331 lt!598305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354580 () Bool)

(declare-fun res!899631 () Bool)

(declare-fun e!769478 () Bool)

(assert (=> b!1354580 (=> (not res!899631) (not e!769478))))

(assert (=> b!1354580 (= res!899631 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31619))))

(declare-fun b!1354581 () Bool)

(declare-fun res!899627 () Bool)

(assert (=> b!1354581 (=> (not res!899627) (not e!769478))))

(declare-fun acc!759 () List!31622)

(assert (=> b!1354581 (= res!899627 (not (contains!9331 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354582 () Bool)

(declare-fun res!899635 () Bool)

(assert (=> b!1354582 (=> (not res!899635) (not e!769478))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354582 (= res!899635 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45131 a!3742))))))

(declare-fun b!1354583 () Bool)

(declare-fun res!899625 () Bool)

(assert (=> b!1354583 (=> (not res!899625) (not e!769478))))

(assert (=> b!1354583 (= res!899625 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45131 a!3742)))))

(declare-fun b!1354584 () Bool)

(declare-fun e!769480 () Bool)

(assert (=> b!1354584 (= e!769480 e!769477)))

(declare-fun res!899637 () Bool)

(assert (=> b!1354584 (=> (not res!899637) (not e!769477))))

(assert (=> b!1354584 (= res!899637 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!766 (List!31622 (_ BitVec 64)) List!31622)

(assert (=> b!1354584 (= lt!598305 ($colon$colon!766 acc!759 (select (arr!44581 a!3742) from!3120)))))

(declare-fun res!899626 () Bool)

(assert (=> start!114084 (=> (not res!899626) (not e!769478))))

(assert (=> start!114084 (= res!899626 (and (bvslt (size!45131 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45131 a!3742))))))

(assert (=> start!114084 e!769478))

(assert (=> start!114084 true))

(declare-fun array_inv!33609 (array!92266) Bool)

(assert (=> start!114084 (array_inv!33609 a!3742)))

(declare-fun b!1354585 () Bool)

(assert (=> b!1354585 (= e!769477 (not (bvsle from!3120 (size!45131 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354585 (arrayNoDuplicates!0 (array!92267 (store (arr!44581 a!3742) i!1404 l!3587) (size!45131 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598305)))

(declare-datatypes ((Unit!44484 0))(
  ( (Unit!44485) )
))
(declare-fun lt!598304 () Unit!44484)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31622) Unit!44484)

(assert (=> b!1354585 (= lt!598304 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598305))))

(declare-fun b!1354586 () Bool)

(declare-fun e!769479 () Unit!44484)

(declare-fun lt!598302 () Unit!44484)

(assert (=> b!1354586 (= e!769479 lt!598302)))

(declare-fun lt!598303 () Unit!44484)

(declare-fun lemmaListSubSeqRefl!0 (List!31622) Unit!44484)

(assert (=> b!1354586 (= lt!598303 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!751 (List!31622 List!31622) Bool)

(assert (=> b!1354586 (subseq!751 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92266 List!31622 List!31622 (_ BitVec 32)) Unit!44484)

(assert (=> b!1354586 (= lt!598302 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!766 acc!759 (select (arr!44581 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354586 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354587 () Bool)

(declare-fun res!899629 () Bool)

(assert (=> b!1354587 (=> (not res!899629) (not e!769478))))

(assert (=> b!1354587 (= res!899629 (not (contains!9331 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354588 () Bool)

(declare-fun res!899630 () Bool)

(assert (=> b!1354588 (=> (not res!899630) (not e!769478))))

(declare-fun noDuplicate!2188 (List!31622) Bool)

(assert (=> b!1354588 (= res!899630 (noDuplicate!2188 acc!759))))

(declare-fun b!1354589 () Bool)

(declare-fun res!899624 () Bool)

(assert (=> b!1354589 (=> (not res!899624) (not e!769478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354589 (= res!899624 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354590 () Bool)

(declare-fun Unit!44486 () Unit!44484)

(assert (=> b!1354590 (= e!769479 Unit!44486)))

(declare-fun b!1354591 () Bool)

(assert (=> b!1354591 (= e!769478 e!769480)))

(declare-fun res!899632 () Bool)

(assert (=> b!1354591 (=> (not res!899632) (not e!769480))))

(declare-fun lt!598306 () Bool)

(assert (=> b!1354591 (= res!899632 (and (not (= from!3120 i!1404)) lt!598306))))

(declare-fun lt!598301 () Unit!44484)

(assert (=> b!1354591 (= lt!598301 e!769479)))

(declare-fun c!126917 () Bool)

(assert (=> b!1354591 (= c!126917 lt!598306)))

(assert (=> b!1354591 (= lt!598306 (validKeyInArray!0 (select (arr!44581 a!3742) from!3120)))))

(declare-fun b!1354592 () Bool)

(declare-fun res!899636 () Bool)

(assert (=> b!1354592 (=> (not res!899636) (not e!769477))))

(assert (=> b!1354592 (= res!899636 (not (contains!9331 lt!598305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354593 () Bool)

(declare-fun res!899628 () Bool)

(assert (=> b!1354593 (=> (not res!899628) (not e!769478))))

(assert (=> b!1354593 (= res!899628 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354594 () Bool)

(declare-fun res!899634 () Bool)

(assert (=> b!1354594 (=> (not res!899634) (not e!769477))))

(assert (=> b!1354594 (= res!899634 (noDuplicate!2188 lt!598305))))

(assert (= (and start!114084 res!899626) b!1354588))

(assert (= (and b!1354588 res!899630) b!1354581))

(assert (= (and b!1354581 res!899627) b!1354587))

(assert (= (and b!1354587 res!899629) b!1354580))

(assert (= (and b!1354580 res!899631) b!1354593))

(assert (= (and b!1354593 res!899628) b!1354582))

(assert (= (and b!1354582 res!899635) b!1354589))

(assert (= (and b!1354589 res!899624) b!1354583))

(assert (= (and b!1354583 res!899625) b!1354591))

(assert (= (and b!1354591 c!126917) b!1354586))

(assert (= (and b!1354591 (not c!126917)) b!1354590))

(assert (= (and b!1354591 res!899632) b!1354584))

(assert (= (and b!1354584 res!899637) b!1354594))

(assert (= (and b!1354594 res!899634) b!1354592))

(assert (= (and b!1354592 res!899636) b!1354579))

(assert (= (and b!1354579 res!899638) b!1354578))

(assert (= (and b!1354578 res!899633) b!1354585))

(declare-fun m!1240921 () Bool)

(assert (=> b!1354591 m!1240921))

(assert (=> b!1354591 m!1240921))

(declare-fun m!1240923 () Bool)

(assert (=> b!1354591 m!1240923))

(declare-fun m!1240925 () Bool)

(assert (=> b!1354580 m!1240925))

(declare-fun m!1240927 () Bool)

(assert (=> b!1354589 m!1240927))

(declare-fun m!1240929 () Bool)

(assert (=> start!114084 m!1240929))

(declare-fun m!1240931 () Bool)

(assert (=> b!1354587 m!1240931))

(declare-fun m!1240933 () Bool)

(assert (=> b!1354592 m!1240933))

(declare-fun m!1240935 () Bool)

(assert (=> b!1354578 m!1240935))

(assert (=> b!1354584 m!1240921))

(assert (=> b!1354584 m!1240921))

(declare-fun m!1240937 () Bool)

(assert (=> b!1354584 m!1240937))

(declare-fun m!1240939 () Bool)

(assert (=> b!1354585 m!1240939))

(declare-fun m!1240941 () Bool)

(assert (=> b!1354585 m!1240941))

(declare-fun m!1240943 () Bool)

(assert (=> b!1354585 m!1240943))

(declare-fun m!1240945 () Bool)

(assert (=> b!1354586 m!1240945))

(assert (=> b!1354586 m!1240921))

(assert (=> b!1354586 m!1240937))

(declare-fun m!1240947 () Bool)

(assert (=> b!1354586 m!1240947))

(declare-fun m!1240949 () Bool)

(assert (=> b!1354586 m!1240949))

(assert (=> b!1354586 m!1240921))

(assert (=> b!1354586 m!1240937))

(declare-fun m!1240951 () Bool)

(assert (=> b!1354586 m!1240951))

(declare-fun m!1240953 () Bool)

(assert (=> b!1354593 m!1240953))

(declare-fun m!1240955 () Bool)

(assert (=> b!1354588 m!1240955))

(declare-fun m!1240957 () Bool)

(assert (=> b!1354581 m!1240957))

(declare-fun m!1240959 () Bool)

(assert (=> b!1354594 m!1240959))

(declare-fun m!1240961 () Bool)

(assert (=> b!1354579 m!1240961))

(push 1)

(assert (not b!1354588))

(assert (not b!1354592))

(assert (not b!1354584))

(assert (not b!1354578))

(assert (not b!1354581))

(assert (not b!1354585))

(assert (not b!1354591))

(assert (not b!1354580))

(assert (not b!1354594))

(assert (not start!114084))

(assert (not b!1354593))

(assert (not b!1354587))

(assert (not b!1354579))

(assert (not b!1354589))

(assert (not b!1354586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

