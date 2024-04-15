; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114146 () Bool)

(assert start!114146)

(declare-fun b!1355764 () Bool)

(declare-fun res!900669 () Bool)

(declare-fun e!769844 () Bool)

(assert (=> b!1355764 (=> (not res!900669) (not e!769844))))

(declare-datatypes ((List!31706 0))(
  ( (Nil!31703) (Cons!31702 (h!32911 (_ BitVec 64)) (t!46356 List!31706)) )
))
(declare-fun acc!759 () List!31706)

(declare-datatypes ((array!92277 0))(
  ( (array!92278 (arr!44587 (Array (_ BitVec 32) (_ BitVec 64))) (size!45139 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92277)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92277 (_ BitVec 32) List!31706) Bool)

(assert (=> b!1355764 (= res!900669 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355765 () Bool)

(declare-fun e!769845 () Bool)

(assert (=> b!1355765 (= e!769845 false)))

(declare-fun lt!598608 () Bool)

(assert (=> b!1355765 (= lt!598608 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355766 () Bool)

(declare-fun res!900674 () Bool)

(assert (=> b!1355766 (=> (not res!900674) (not e!769844))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355766 (= res!900674 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355767 () Bool)

(declare-fun res!900671 () Bool)

(assert (=> b!1355767 (=> (not res!900671) (not e!769844))))

(declare-fun contains!9326 (List!31706 (_ BitVec 64)) Bool)

(assert (=> b!1355767 (= res!900671 (not (contains!9326 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355768 () Bool)

(declare-fun res!900673 () Bool)

(assert (=> b!1355768 (=> (not res!900673) (not e!769844))))

(assert (=> b!1355768 (= res!900673 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45139 a!3742)))))

(declare-fun b!1355770 () Bool)

(assert (=> b!1355770 (= e!769844 e!769845)))

(declare-fun res!900665 () Bool)

(assert (=> b!1355770 (=> (not res!900665) (not e!769845))))

(declare-fun lt!598610 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355770 (= res!900665 (and (not (= from!3120 i!1404)) (not lt!598610) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44418 0))(
  ( (Unit!44419) )
))
(declare-fun lt!598612 () Unit!44418)

(declare-fun e!769843 () Unit!44418)

(assert (=> b!1355770 (= lt!598612 e!769843)))

(declare-fun c!126992 () Bool)

(assert (=> b!1355770 (= c!126992 lt!598610)))

(assert (=> b!1355770 (= lt!598610 (validKeyInArray!0 (select (arr!44587 a!3742) from!3120)))))

(declare-fun b!1355771 () Bool)

(declare-fun res!900666 () Bool)

(assert (=> b!1355771 (=> (not res!900666) (not e!769844))))

(declare-fun noDuplicate!2241 (List!31706) Bool)

(assert (=> b!1355771 (= res!900666 (noDuplicate!2241 acc!759))))

(declare-fun b!1355772 () Bool)

(declare-fun lt!598611 () Unit!44418)

(assert (=> b!1355772 (= e!769843 lt!598611)))

(declare-fun lt!598609 () Unit!44418)

(declare-fun lemmaListSubSeqRefl!0 (List!31706) Unit!44418)

(assert (=> b!1355772 (= lt!598609 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!782 (List!31706 List!31706) Bool)

(assert (=> b!1355772 (subseq!782 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92277 List!31706 List!31706 (_ BitVec 32)) Unit!44418)

(declare-fun $colon$colon!799 (List!31706 (_ BitVec 64)) List!31706)

(assert (=> b!1355772 (= lt!598611 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!799 acc!759 (select (arr!44587 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355772 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355773 () Bool)

(declare-fun Unit!44420 () Unit!44418)

(assert (=> b!1355773 (= e!769843 Unit!44420)))

(declare-fun b!1355774 () Bool)

(declare-fun res!900668 () Bool)

(assert (=> b!1355774 (=> (not res!900668) (not e!769844))))

(assert (=> b!1355774 (= res!900668 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45139 a!3742))))))

(declare-fun b!1355775 () Bool)

(declare-fun res!900672 () Bool)

(assert (=> b!1355775 (=> (not res!900672) (not e!769844))))

(assert (=> b!1355775 (= res!900672 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31703))))

(declare-fun res!900667 () Bool)

(assert (=> start!114146 (=> (not res!900667) (not e!769844))))

(assert (=> start!114146 (= res!900667 (and (bvslt (size!45139 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45139 a!3742))))))

(assert (=> start!114146 e!769844))

(assert (=> start!114146 true))

(declare-fun array_inv!33820 (array!92277) Bool)

(assert (=> start!114146 (array_inv!33820 a!3742)))

(declare-fun b!1355769 () Bool)

(declare-fun res!900670 () Bool)

(assert (=> b!1355769 (=> (not res!900670) (not e!769844))))

(assert (=> b!1355769 (= res!900670 (not (contains!9326 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114146 res!900667) b!1355771))

(assert (= (and b!1355771 res!900666) b!1355767))

(assert (= (and b!1355767 res!900671) b!1355769))

(assert (= (and b!1355769 res!900670) b!1355775))

(assert (= (and b!1355775 res!900672) b!1355764))

(assert (= (and b!1355764 res!900669) b!1355774))

(assert (= (and b!1355774 res!900668) b!1355766))

(assert (= (and b!1355766 res!900674) b!1355768))

(assert (= (and b!1355768 res!900673) b!1355770))

(assert (= (and b!1355770 c!126992) b!1355772))

(assert (= (and b!1355770 (not c!126992)) b!1355773))

(assert (= (and b!1355770 res!900665) b!1355765))

(declare-fun m!1241413 () Bool)

(assert (=> b!1355770 m!1241413))

(assert (=> b!1355770 m!1241413))

(declare-fun m!1241415 () Bool)

(assert (=> b!1355770 m!1241415))

(declare-fun m!1241417 () Bool)

(assert (=> start!114146 m!1241417))

(declare-fun m!1241419 () Bool)

(assert (=> b!1355775 m!1241419))

(declare-fun m!1241421 () Bool)

(assert (=> b!1355772 m!1241421))

(assert (=> b!1355772 m!1241413))

(declare-fun m!1241423 () Bool)

(assert (=> b!1355772 m!1241423))

(declare-fun m!1241425 () Bool)

(assert (=> b!1355772 m!1241425))

(declare-fun m!1241427 () Bool)

(assert (=> b!1355772 m!1241427))

(assert (=> b!1355772 m!1241413))

(assert (=> b!1355772 m!1241423))

(declare-fun m!1241429 () Bool)

(assert (=> b!1355772 m!1241429))

(declare-fun m!1241431 () Bool)

(assert (=> b!1355771 m!1241431))

(declare-fun m!1241433 () Bool)

(assert (=> b!1355766 m!1241433))

(declare-fun m!1241435 () Bool)

(assert (=> b!1355767 m!1241435))

(declare-fun m!1241437 () Bool)

(assert (=> b!1355764 m!1241437))

(assert (=> b!1355765 m!1241427))

(declare-fun m!1241439 () Bool)

(assert (=> b!1355769 m!1241439))

(check-sat (not start!114146) (not b!1355772) (not b!1355764) (not b!1355769) (not b!1355767) (not b!1355775) (not b!1355766) (not b!1355770) (not b!1355771) (not b!1355765))
(check-sat)
