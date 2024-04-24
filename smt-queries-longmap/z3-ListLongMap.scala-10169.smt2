; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120074 () Bool)

(assert start!120074)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95576 0))(
  ( (array!95577 (arr!46141 (Array (_ BitVec 32) (_ BitVec 64))) (size!46692 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95576)

(declare-fun b!1397046 () Bool)

(declare-fun e!791011 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10361 0))(
  ( (MissingZero!10361 (index!43815 (_ BitVec 32))) (Found!10361 (index!43816 (_ BitVec 32))) (Intermediate!10361 (undefined!11173 Bool) (index!43817 (_ BitVec 32)) (x!125636 (_ BitVec 32))) (Undefined!10361) (MissingVacant!10361 (index!43818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95576 (_ BitVec 32)) SeekEntryResult!10361)

(assert (=> b!1397046 (= e!791011 (= (seekEntryOrOpen!0 (select (arr!46141 a!2901) j!112) a!2901 mask!2840) (Found!10361 j!112)))))

(declare-fun b!1397047 () Bool)

(declare-fun res!935446 () Bool)

(declare-fun e!791014 () Bool)

(assert (=> b!1397047 (=> (not res!935446) (not e!791014))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397047 (= res!935446 (and (= (size!46692 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46692 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46692 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!935449 () Bool)

(assert (=> start!120074 (=> (not res!935449) (not e!791014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120074 (= res!935449 (validMask!0 mask!2840))))

(assert (=> start!120074 e!791014))

(assert (=> start!120074 true))

(declare-fun array_inv!35422 (array!95576) Bool)

(assert (=> start!120074 (array_inv!35422 a!2901)))

(declare-fun b!1397048 () Bool)

(declare-fun res!935440 () Bool)

(assert (=> b!1397048 (=> (not res!935440) (not e!791014))))

(declare-datatypes ((List!32647 0))(
  ( (Nil!32644) (Cons!32643 (h!33890 (_ BitVec 64)) (t!47333 List!32647)) )
))
(declare-fun arrayNoDuplicates!0 (array!95576 (_ BitVec 32) List!32647) Bool)

(assert (=> b!1397048 (= res!935440 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32644))))

(declare-fun b!1397049 () Bool)

(declare-fun e!791015 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397049 (= e!791015 (validKeyInArray!0 (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1397050 () Bool)

(declare-fun e!791013 () Bool)

(assert (=> b!1397050 (= e!791014 (not e!791013))))

(declare-fun res!935447 () Bool)

(assert (=> b!1397050 (=> res!935447 e!791013)))

(declare-fun lt!613578 () SeekEntryResult!10361)

(get-info :version)

(assert (=> b!1397050 (= res!935447 (or (not ((_ is Intermediate!10361) lt!613578)) (undefined!11173 lt!613578)))))

(assert (=> b!1397050 e!791011))

(declare-fun res!935441 () Bool)

(assert (=> b!1397050 (=> (not res!935441) (not e!791011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95576 (_ BitVec 32)) Bool)

(assert (=> b!1397050 (= res!935441 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46753 0))(
  ( (Unit!46754) )
))
(declare-fun lt!613579 () Unit!46753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46753)

(assert (=> b!1397050 (= lt!613579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95576 (_ BitVec 32)) SeekEntryResult!10361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397050 (= lt!613578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46141 a!2901) j!112) mask!2840) (select (arr!46141 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1397051 () Bool)

(assert (=> b!1397051 (= e!791013 e!791015)))

(declare-fun res!935448 () Bool)

(assert (=> b!1397051 (=> res!935448 e!791015)))

(declare-fun lt!613580 () (_ BitVec 32))

(assert (=> b!1397051 (= res!935448 (= lt!613578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613580 (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95577 (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46692 a!2901)) mask!2840)))))

(assert (=> b!1397051 (= lt!613580 (toIndex!0 (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1397052 () Bool)

(declare-fun res!935444 () Bool)

(assert (=> b!1397052 (=> (not res!935444) (not e!791014))))

(assert (=> b!1397052 (= res!935444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397053 () Bool)

(declare-fun res!935442 () Bool)

(assert (=> b!1397053 (=> (not res!935442) (not e!791014))))

(assert (=> b!1397053 (= res!935442 (validKeyInArray!0 (select (arr!46141 a!2901) j!112)))))

(declare-fun b!1397054 () Bool)

(declare-fun res!935443 () Bool)

(assert (=> b!1397054 (=> (not res!935443) (not e!791014))))

(assert (=> b!1397054 (= res!935443 (validKeyInArray!0 (select (arr!46141 a!2901) i!1037)))))

(declare-fun b!1397055 () Bool)

(declare-fun res!935445 () Bool)

(assert (=> b!1397055 (=> res!935445 e!791015)))

(assert (=> b!1397055 (= res!935445 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!613580 #b00000000000000000000000000000000) (bvsge lt!613580 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (= (and start!120074 res!935449) b!1397047))

(assert (= (and b!1397047 res!935446) b!1397054))

(assert (= (and b!1397054 res!935443) b!1397053))

(assert (= (and b!1397053 res!935442) b!1397052))

(assert (= (and b!1397052 res!935444) b!1397048))

(assert (= (and b!1397048 res!935440) b!1397050))

(assert (= (and b!1397050 res!935441) b!1397046))

(assert (= (and b!1397050 (not res!935447)) b!1397051))

(assert (= (and b!1397051 (not res!935448)) b!1397055))

(assert (= (and b!1397055 (not res!935445)) b!1397049))

(declare-fun m!1283725 () Bool)

(assert (=> b!1397049 m!1283725))

(declare-fun m!1283727 () Bool)

(assert (=> b!1397049 m!1283727))

(assert (=> b!1397049 m!1283727))

(declare-fun m!1283729 () Bool)

(assert (=> b!1397049 m!1283729))

(declare-fun m!1283731 () Bool)

(assert (=> b!1397046 m!1283731))

(assert (=> b!1397046 m!1283731))

(declare-fun m!1283733 () Bool)

(assert (=> b!1397046 m!1283733))

(declare-fun m!1283735 () Bool)

(assert (=> start!120074 m!1283735))

(declare-fun m!1283737 () Bool)

(assert (=> start!120074 m!1283737))

(declare-fun m!1283739 () Bool)

(assert (=> b!1397052 m!1283739))

(declare-fun m!1283741 () Bool)

(assert (=> b!1397054 m!1283741))

(assert (=> b!1397054 m!1283741))

(declare-fun m!1283743 () Bool)

(assert (=> b!1397054 m!1283743))

(declare-fun m!1283745 () Bool)

(assert (=> b!1397048 m!1283745))

(assert (=> b!1397053 m!1283731))

(assert (=> b!1397053 m!1283731))

(declare-fun m!1283747 () Bool)

(assert (=> b!1397053 m!1283747))

(assert (=> b!1397051 m!1283725))

(assert (=> b!1397051 m!1283727))

(assert (=> b!1397051 m!1283727))

(declare-fun m!1283749 () Bool)

(assert (=> b!1397051 m!1283749))

(assert (=> b!1397051 m!1283727))

(declare-fun m!1283751 () Bool)

(assert (=> b!1397051 m!1283751))

(assert (=> b!1397050 m!1283731))

(declare-fun m!1283753 () Bool)

(assert (=> b!1397050 m!1283753))

(assert (=> b!1397050 m!1283731))

(declare-fun m!1283755 () Bool)

(assert (=> b!1397050 m!1283755))

(assert (=> b!1397050 m!1283753))

(assert (=> b!1397050 m!1283731))

(declare-fun m!1283757 () Bool)

(assert (=> b!1397050 m!1283757))

(declare-fun m!1283759 () Bool)

(assert (=> b!1397050 m!1283759))

(check-sat (not start!120074) (not b!1397053) (not b!1397048) (not b!1397054) (not b!1397051) (not b!1397050) (not b!1397049) (not b!1397046) (not b!1397052))
(check-sat)
