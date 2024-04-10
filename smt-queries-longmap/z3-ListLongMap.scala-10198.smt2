; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120116 () Bool)

(assert start!120116)

(declare-fun b!1398535 () Bool)

(declare-fun res!937456 () Bool)

(declare-fun e!791745 () Bool)

(assert (=> b!1398535 (=> (not res!937456) (not e!791745))))

(declare-datatypes ((array!95645 0))(
  ( (array!95646 (arr!46176 (Array (_ BitVec 32) (_ BitVec 64))) (size!46726 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95645)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398535 (= res!937456 (validKeyInArray!0 (select (arr!46176 a!2901) i!1037)))))

(declare-fun b!1398536 () Bool)

(declare-fun res!937454 () Bool)

(assert (=> b!1398536 (=> (not res!937454) (not e!791745))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95645 (_ BitVec 32)) Bool)

(assert (=> b!1398536 (= res!937454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398537 () Bool)

(declare-fun e!791746 () Bool)

(assert (=> b!1398537 (= e!791746 true)))

(declare-datatypes ((SeekEntryResult!10493 0))(
  ( (MissingZero!10493 (index!44343 (_ BitVec 32))) (Found!10493 (index!44344 (_ BitVec 32))) (Intermediate!10493 (undefined!11305 Bool) (index!44345 (_ BitVec 32)) (x!125987 (_ BitVec 32))) (Undefined!10493) (MissingVacant!10493 (index!44346 (_ BitVec 32))) )
))
(declare-fun lt!614991 () SeekEntryResult!10493)

(declare-fun lt!614989 () SeekEntryResult!10493)

(assert (=> b!1398537 (and (not (undefined!11305 lt!614991)) (= (index!44345 lt!614991) i!1037) (bvslt (x!125987 lt!614991) (x!125987 lt!614989)) (= (select (store (arr!46176 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44345 lt!614991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46990 0))(
  ( (Unit!46991) )
))
(declare-fun lt!614990 () Unit!46990)

(declare-fun lt!614992 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46990)

(assert (=> b!1398537 (= lt!614990 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614992 (x!125987 lt!614989) (index!44345 lt!614989) (x!125987 lt!614991) (index!44345 lt!614991) (undefined!11305 lt!614991) mask!2840))))

(declare-fun b!1398538 () Bool)

(declare-fun res!937449 () Bool)

(assert (=> b!1398538 (=> (not res!937449) (not e!791745))))

(assert (=> b!1398538 (= res!937449 (and (= (size!46726 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46726 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46726 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398539 () Bool)

(declare-fun res!937452 () Bool)

(assert (=> b!1398539 (=> (not res!937452) (not e!791745))))

(assert (=> b!1398539 (= res!937452 (validKeyInArray!0 (select (arr!46176 a!2901) j!112)))))

(declare-fun b!1398541 () Bool)

(declare-fun e!791747 () Bool)

(assert (=> b!1398541 (= e!791745 (not e!791747))))

(declare-fun res!937453 () Bool)

(assert (=> b!1398541 (=> res!937453 e!791747)))

(get-info :version)

(assert (=> b!1398541 (= res!937453 (or (not ((_ is Intermediate!10493) lt!614989)) (undefined!11305 lt!614989)))))

(declare-fun e!791744 () Bool)

(assert (=> b!1398541 e!791744))

(declare-fun res!937448 () Bool)

(assert (=> b!1398541 (=> (not res!937448) (not e!791744))))

(assert (=> b!1398541 (= res!937448 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614994 () Unit!46990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46990)

(assert (=> b!1398541 (= lt!614994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95645 (_ BitVec 32)) SeekEntryResult!10493)

(assert (=> b!1398541 (= lt!614989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614992 (select (arr!46176 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398541 (= lt!614992 (toIndex!0 (select (arr!46176 a!2901) j!112) mask!2840))))

(declare-fun b!1398542 () Bool)

(assert (=> b!1398542 (= e!791747 e!791746)))

(declare-fun res!937450 () Bool)

(assert (=> b!1398542 (=> res!937450 e!791746)))

(assert (=> b!1398542 (= res!937450 (or (= lt!614989 lt!614991) (not ((_ is Intermediate!10493) lt!614991))))))

(declare-fun lt!614993 () (_ BitVec 64))

(assert (=> b!1398542 (= lt!614991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614993 mask!2840) lt!614993 (array!95646 (store (arr!46176 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46726 a!2901)) mask!2840))))

(assert (=> b!1398542 (= lt!614993 (select (store (arr!46176 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398543 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95645 (_ BitVec 32)) SeekEntryResult!10493)

(assert (=> b!1398543 (= e!791744 (= (seekEntryOrOpen!0 (select (arr!46176 a!2901) j!112) a!2901 mask!2840) (Found!10493 j!112)))))

(declare-fun b!1398540 () Bool)

(declare-fun res!937451 () Bool)

(assert (=> b!1398540 (=> (not res!937451) (not e!791745))))

(declare-datatypes ((List!32695 0))(
  ( (Nil!32692) (Cons!32691 (h!33933 (_ BitVec 64)) (t!47389 List!32695)) )
))
(declare-fun arrayNoDuplicates!0 (array!95645 (_ BitVec 32) List!32695) Bool)

(assert (=> b!1398540 (= res!937451 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32692))))

(declare-fun res!937455 () Bool)

(assert (=> start!120116 (=> (not res!937455) (not e!791745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120116 (= res!937455 (validMask!0 mask!2840))))

(assert (=> start!120116 e!791745))

(assert (=> start!120116 true))

(declare-fun array_inv!35204 (array!95645) Bool)

(assert (=> start!120116 (array_inv!35204 a!2901)))

(assert (= (and start!120116 res!937455) b!1398538))

(assert (= (and b!1398538 res!937449) b!1398535))

(assert (= (and b!1398535 res!937456) b!1398539))

(assert (= (and b!1398539 res!937452) b!1398536))

(assert (= (and b!1398536 res!937454) b!1398540))

(assert (= (and b!1398540 res!937451) b!1398541))

(assert (= (and b!1398541 res!937448) b!1398543))

(assert (= (and b!1398541 (not res!937453)) b!1398542))

(assert (= (and b!1398542 (not res!937450)) b!1398537))

(declare-fun m!1285703 () Bool)

(assert (=> b!1398543 m!1285703))

(assert (=> b!1398543 m!1285703))

(declare-fun m!1285705 () Bool)

(assert (=> b!1398543 m!1285705))

(assert (=> b!1398541 m!1285703))

(declare-fun m!1285707 () Bool)

(assert (=> b!1398541 m!1285707))

(assert (=> b!1398541 m!1285703))

(assert (=> b!1398541 m!1285703))

(declare-fun m!1285709 () Bool)

(assert (=> b!1398541 m!1285709))

(declare-fun m!1285711 () Bool)

(assert (=> b!1398541 m!1285711))

(declare-fun m!1285713 () Bool)

(assert (=> b!1398541 m!1285713))

(declare-fun m!1285715 () Bool)

(assert (=> b!1398537 m!1285715))

(declare-fun m!1285717 () Bool)

(assert (=> b!1398537 m!1285717))

(declare-fun m!1285719 () Bool)

(assert (=> b!1398537 m!1285719))

(declare-fun m!1285721 () Bool)

(assert (=> b!1398540 m!1285721))

(declare-fun m!1285723 () Bool)

(assert (=> b!1398535 m!1285723))

(assert (=> b!1398535 m!1285723))

(declare-fun m!1285725 () Bool)

(assert (=> b!1398535 m!1285725))

(declare-fun m!1285727 () Bool)

(assert (=> b!1398542 m!1285727))

(assert (=> b!1398542 m!1285715))

(assert (=> b!1398542 m!1285727))

(declare-fun m!1285729 () Bool)

(assert (=> b!1398542 m!1285729))

(declare-fun m!1285731 () Bool)

(assert (=> b!1398542 m!1285731))

(declare-fun m!1285733 () Bool)

(assert (=> b!1398536 m!1285733))

(assert (=> b!1398539 m!1285703))

(assert (=> b!1398539 m!1285703))

(declare-fun m!1285735 () Bool)

(assert (=> b!1398539 m!1285735))

(declare-fun m!1285737 () Bool)

(assert (=> start!120116 m!1285737))

(declare-fun m!1285739 () Bool)

(assert (=> start!120116 m!1285739))

(check-sat (not b!1398542) (not b!1398539) (not b!1398537) (not b!1398536) (not b!1398540) (not b!1398543) (not b!1398535) (not start!120116) (not b!1398541))
(check-sat)
