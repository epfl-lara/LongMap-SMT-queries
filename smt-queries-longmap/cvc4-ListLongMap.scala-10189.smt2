; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120064 () Bool)

(assert start!120064)

(declare-fun res!936738 () Bool)

(declare-fun e!791347 () Bool)

(assert (=> start!120064 (=> (not res!936738) (not e!791347))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120064 (= res!936738 (validMask!0 mask!2840))))

(assert (=> start!120064 e!791347))

(assert (=> start!120064 true))

(declare-datatypes ((array!95593 0))(
  ( (array!95594 (arr!46150 (Array (_ BitVec 32) (_ BitVec 64))) (size!46700 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95593)

(declare-fun array_inv!35178 (array!95593) Bool)

(assert (=> start!120064 (array_inv!35178 a!2901)))

(declare-fun b!1397824 () Bool)

(declare-fun res!936744 () Bool)

(assert (=> b!1397824 (=> (not res!936744) (not e!791347))))

(declare-datatypes ((List!32669 0))(
  ( (Nil!32666) (Cons!32665 (h!33907 (_ BitVec 64)) (t!47363 List!32669)) )
))
(declare-fun arrayNoDuplicates!0 (array!95593 (_ BitVec 32) List!32669) Bool)

(assert (=> b!1397824 (= res!936744 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32666))))

(declare-fun e!791344 () Bool)

(declare-fun b!1397825 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10467 0))(
  ( (MissingZero!10467 (index!44239 (_ BitVec 32))) (Found!10467 (index!44240 (_ BitVec 32))) (Intermediate!10467 (undefined!11279 Bool) (index!44241 (_ BitVec 32)) (x!125889 (_ BitVec 32))) (Undefined!10467) (MissingVacant!10467 (index!44242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95593 (_ BitVec 32)) SeekEntryResult!10467)

(assert (=> b!1397825 (= e!791344 (= (seekEntryOrOpen!0 (select (arr!46150 a!2901) j!112) a!2901 mask!2840) (Found!10467 j!112)))))

(declare-fun b!1397826 () Bool)

(declare-fun e!791348 () Bool)

(assert (=> b!1397826 (= e!791348 true)))

(declare-fun lt!614502 () (_ BitVec 32))

(declare-fun lt!614507 () SeekEntryResult!10467)

(declare-fun lt!614508 () array!95593)

(declare-fun lt!614504 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95593 (_ BitVec 32)) SeekEntryResult!10467)

(assert (=> b!1397826 (= lt!614507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614502 lt!614504 lt!614508 mask!2840))))

(declare-fun b!1397827 () Bool)

(declare-fun res!936741 () Bool)

(assert (=> b!1397827 (=> (not res!936741) (not e!791347))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397827 (= res!936741 (and (= (size!46700 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46700 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46700 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397828 () Bool)

(declare-fun res!936742 () Bool)

(assert (=> b!1397828 (=> (not res!936742) (not e!791347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397828 (= res!936742 (validKeyInArray!0 (select (arr!46150 a!2901) j!112)))))

(declare-fun b!1397829 () Bool)

(declare-fun e!791346 () Bool)

(assert (=> b!1397829 (= e!791347 (not e!791346))))

(declare-fun res!936739 () Bool)

(assert (=> b!1397829 (=> res!936739 e!791346)))

(declare-fun lt!614503 () SeekEntryResult!10467)

(assert (=> b!1397829 (= res!936739 (or (not (is-Intermediate!10467 lt!614503)) (undefined!11279 lt!614503)))))

(assert (=> b!1397829 e!791344))

(declare-fun res!936737 () Bool)

(assert (=> b!1397829 (=> (not res!936737) (not e!791344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95593 (_ BitVec 32)) Bool)

(assert (=> b!1397829 (= res!936737 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46938 0))(
  ( (Unit!46939) )
))
(declare-fun lt!614505 () Unit!46938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46938)

(assert (=> b!1397829 (= lt!614505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397829 (= lt!614503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614502 (select (arr!46150 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397829 (= lt!614502 (toIndex!0 (select (arr!46150 a!2901) j!112) mask!2840))))

(declare-fun b!1397830 () Bool)

(assert (=> b!1397830 (= e!791346 e!791348)))

(declare-fun res!936740 () Bool)

(assert (=> b!1397830 (=> res!936740 e!791348)))

(declare-fun lt!614506 () SeekEntryResult!10467)

(assert (=> b!1397830 (= res!936740 (or (= lt!614503 lt!614506) (not (is-Intermediate!10467 lt!614506)) (bvslt (x!125889 lt!614503) #b00000000000000000000000000000000) (bvsgt (x!125889 lt!614503) #b01111111111111111111111111111110) (bvslt lt!614502 #b00000000000000000000000000000000) (bvsge lt!614502 (size!46700 a!2901)) (bvslt (index!44241 lt!614503) #b00000000000000000000000000000000) (bvsge (index!44241 lt!614503) (size!46700 a!2901)) (not (= lt!614503 (Intermediate!10467 false (index!44241 lt!614503) (x!125889 lt!614503)))) (not (= lt!614506 (Intermediate!10467 (undefined!11279 lt!614506) (index!44241 lt!614506) (x!125889 lt!614506))))))))

(assert (=> b!1397830 (= lt!614506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614504 mask!2840) lt!614504 lt!614508 mask!2840))))

(assert (=> b!1397830 (= lt!614504 (select (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397830 (= lt!614508 (array!95594 (store (arr!46150 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46700 a!2901)))))

(declare-fun b!1397831 () Bool)

(declare-fun res!936745 () Bool)

(assert (=> b!1397831 (=> (not res!936745) (not e!791347))))

(assert (=> b!1397831 (= res!936745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397832 () Bool)

(declare-fun res!936743 () Bool)

(assert (=> b!1397832 (=> (not res!936743) (not e!791347))))

(assert (=> b!1397832 (= res!936743 (validKeyInArray!0 (select (arr!46150 a!2901) i!1037)))))

(assert (= (and start!120064 res!936738) b!1397827))

(assert (= (and b!1397827 res!936741) b!1397832))

(assert (= (and b!1397832 res!936743) b!1397828))

(assert (= (and b!1397828 res!936742) b!1397831))

(assert (= (and b!1397831 res!936745) b!1397824))

(assert (= (and b!1397824 res!936744) b!1397829))

(assert (= (and b!1397829 res!936737) b!1397825))

(assert (= (and b!1397829 (not res!936739)) b!1397830))

(assert (= (and b!1397830 (not res!936740)) b!1397826))

(declare-fun m!1284723 () Bool)

(assert (=> b!1397831 m!1284723))

(declare-fun m!1284725 () Bool)

(assert (=> b!1397828 m!1284725))

(assert (=> b!1397828 m!1284725))

(declare-fun m!1284727 () Bool)

(assert (=> b!1397828 m!1284727))

(declare-fun m!1284729 () Bool)

(assert (=> b!1397830 m!1284729))

(assert (=> b!1397830 m!1284729))

(declare-fun m!1284731 () Bool)

(assert (=> b!1397830 m!1284731))

(declare-fun m!1284733 () Bool)

(assert (=> b!1397830 m!1284733))

(declare-fun m!1284735 () Bool)

(assert (=> b!1397830 m!1284735))

(declare-fun m!1284737 () Bool)

(assert (=> b!1397826 m!1284737))

(assert (=> b!1397825 m!1284725))

(assert (=> b!1397825 m!1284725))

(declare-fun m!1284739 () Bool)

(assert (=> b!1397825 m!1284739))

(declare-fun m!1284741 () Bool)

(assert (=> b!1397832 m!1284741))

(assert (=> b!1397832 m!1284741))

(declare-fun m!1284743 () Bool)

(assert (=> b!1397832 m!1284743))

(declare-fun m!1284745 () Bool)

(assert (=> b!1397824 m!1284745))

(assert (=> b!1397829 m!1284725))

(declare-fun m!1284747 () Bool)

(assert (=> b!1397829 m!1284747))

(assert (=> b!1397829 m!1284725))

(assert (=> b!1397829 m!1284725))

(declare-fun m!1284749 () Bool)

(assert (=> b!1397829 m!1284749))

(declare-fun m!1284751 () Bool)

(assert (=> b!1397829 m!1284751))

(declare-fun m!1284753 () Bool)

(assert (=> b!1397829 m!1284753))

(declare-fun m!1284755 () Bool)

(assert (=> start!120064 m!1284755))

(declare-fun m!1284757 () Bool)

(assert (=> start!120064 m!1284757))

(push 1)

