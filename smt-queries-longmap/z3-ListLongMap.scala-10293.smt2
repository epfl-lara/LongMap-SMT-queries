; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121076 () Bool)

(assert start!121076)

(declare-datatypes ((array!96183 0))(
  ( (array!96184 (arr!46435 (Array (_ BitVec 32) (_ BitVec 64))) (size!46987 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96183)

(declare-fun e!796740 () Bool)

(declare-datatypes ((SeekEntryResult!10772 0))(
  ( (MissingZero!10772 (index!45465 (_ BitVec 32))) (Found!10772 (index!45466 (_ BitVec 32))) (Intermediate!10772 (undefined!11584 Bool) (index!45467 (_ BitVec 32)) (x!127074 (_ BitVec 32))) (Undefined!10772) (MissingVacant!10772 (index!45468 (_ BitVec 32))) )
))
(declare-fun lt!619740 () SeekEntryResult!10772)

(declare-fun lt!619742 () (_ BitVec 32))

(declare-fun b!1407673 () Bool)

(assert (=> b!1407673 (= e!796740 (or (bvslt (x!127074 lt!619740) #b00000000000000000000000000000000) (bvsgt (x!127074 lt!619740) #b01111111111111111111111111111110) (bvslt lt!619742 #b00000000000000000000000000000000) (bvsge lt!619742 (size!46987 a!2901)) (bvslt (index!45467 lt!619740) #b00000000000000000000000000000000) (bvsge (index!45467 lt!619740) (size!46987 a!2901)) (= lt!619740 (Intermediate!10772 false (index!45467 lt!619740) (x!127074 lt!619740)))))))

(declare-fun b!1407674 () Bool)

(declare-fun e!796741 () Bool)

(assert (=> b!1407674 (= e!796741 (not e!796740))))

(declare-fun res!945452 () Bool)

(assert (=> b!1407674 (=> res!945452 e!796740)))

(get-info :version)

(assert (=> b!1407674 (= res!945452 (or (not ((_ is Intermediate!10772) lt!619740)) (undefined!11584 lt!619740)))))

(declare-fun e!796739 () Bool)

(assert (=> b!1407674 e!796739))

(declare-fun res!945454 () Bool)

(assert (=> b!1407674 (=> (not res!945454) (not e!796739))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96183 (_ BitVec 32)) Bool)

(assert (=> b!1407674 (= res!945454 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47361 0))(
  ( (Unit!47362) )
))
(declare-fun lt!619741 () Unit!47361)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47361)

(assert (=> b!1407674 (= lt!619741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10772)

(assert (=> b!1407674 (= lt!619740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619742 (select (arr!46435 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407674 (= lt!619742 (toIndex!0 (select (arr!46435 a!2901) j!112) mask!2840))))

(declare-fun b!1407675 () Bool)

(declare-fun res!945446 () Bool)

(assert (=> b!1407675 (=> (not res!945446) (not e!796741))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407675 (= res!945446 (validKeyInArray!0 (select (arr!46435 a!2901) i!1037)))))

(declare-fun res!945449 () Bool)

(assert (=> start!121076 (=> (not res!945449) (not e!796741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121076 (= res!945449 (validMask!0 mask!2840))))

(assert (=> start!121076 e!796741))

(assert (=> start!121076 true))

(declare-fun array_inv!35668 (array!96183) Bool)

(assert (=> start!121076 (array_inv!35668 a!2901)))

(declare-fun b!1407676 () Bool)

(declare-fun res!945453 () Bool)

(assert (=> b!1407676 (=> (not res!945453) (not e!796741))))

(assert (=> b!1407676 (= res!945453 (and (= (size!46987 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46987 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46987 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407677 () Bool)

(declare-fun res!945447 () Bool)

(assert (=> b!1407677 (=> (not res!945447) (not e!796741))))

(assert (=> b!1407677 (= res!945447 (validKeyInArray!0 (select (arr!46435 a!2901) j!112)))))

(declare-fun b!1407678 () Bool)

(declare-fun res!945450 () Bool)

(assert (=> b!1407678 (=> (not res!945450) (not e!796741))))

(declare-datatypes ((List!33032 0))(
  ( (Nil!33029) (Cons!33028 (h!34291 (_ BitVec 64)) (t!47718 List!33032)) )
))
(declare-fun arrayNoDuplicates!0 (array!96183 (_ BitVec 32) List!33032) Bool)

(assert (=> b!1407678 (= res!945450 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33029))))

(declare-fun b!1407679 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10772)

(assert (=> b!1407679 (= e!796739 (= (seekEntryOrOpen!0 (select (arr!46435 a!2901) j!112) a!2901 mask!2840) (Found!10772 j!112)))))

(declare-fun b!1407680 () Bool)

(declare-fun res!945448 () Bool)

(assert (=> b!1407680 (=> res!945448 e!796740)))

(assert (=> b!1407680 (= res!945448 (not (= lt!619740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96184 (store (arr!46435 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46987 a!2901)) mask!2840))))))

(declare-fun b!1407681 () Bool)

(declare-fun res!945451 () Bool)

(assert (=> b!1407681 (=> (not res!945451) (not e!796741))))

(assert (=> b!1407681 (= res!945451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121076 res!945449) b!1407676))

(assert (= (and b!1407676 res!945453) b!1407675))

(assert (= (and b!1407675 res!945446) b!1407677))

(assert (= (and b!1407677 res!945447) b!1407681))

(assert (= (and b!1407681 res!945451) b!1407678))

(assert (= (and b!1407678 res!945450) b!1407674))

(assert (= (and b!1407674 res!945454) b!1407679))

(assert (= (and b!1407674 (not res!945452)) b!1407680))

(assert (= (and b!1407680 (not res!945448)) b!1407673))

(declare-fun m!1296247 () Bool)

(assert (=> start!121076 m!1296247))

(declare-fun m!1296249 () Bool)

(assert (=> start!121076 m!1296249))

(declare-fun m!1296251 () Bool)

(assert (=> b!1407674 m!1296251))

(declare-fun m!1296253 () Bool)

(assert (=> b!1407674 m!1296253))

(assert (=> b!1407674 m!1296251))

(declare-fun m!1296255 () Bool)

(assert (=> b!1407674 m!1296255))

(assert (=> b!1407674 m!1296251))

(declare-fun m!1296257 () Bool)

(assert (=> b!1407674 m!1296257))

(declare-fun m!1296259 () Bool)

(assert (=> b!1407674 m!1296259))

(assert (=> b!1407679 m!1296251))

(assert (=> b!1407679 m!1296251))

(declare-fun m!1296261 () Bool)

(assert (=> b!1407679 m!1296261))

(assert (=> b!1407677 m!1296251))

(assert (=> b!1407677 m!1296251))

(declare-fun m!1296263 () Bool)

(assert (=> b!1407677 m!1296263))

(declare-fun m!1296265 () Bool)

(assert (=> b!1407675 m!1296265))

(assert (=> b!1407675 m!1296265))

(declare-fun m!1296267 () Bool)

(assert (=> b!1407675 m!1296267))

(declare-fun m!1296269 () Bool)

(assert (=> b!1407680 m!1296269))

(declare-fun m!1296271 () Bool)

(assert (=> b!1407680 m!1296271))

(assert (=> b!1407680 m!1296271))

(declare-fun m!1296273 () Bool)

(assert (=> b!1407680 m!1296273))

(assert (=> b!1407680 m!1296273))

(assert (=> b!1407680 m!1296271))

(declare-fun m!1296275 () Bool)

(assert (=> b!1407680 m!1296275))

(declare-fun m!1296277 () Bool)

(assert (=> b!1407681 m!1296277))

(declare-fun m!1296279 () Bool)

(assert (=> b!1407678 m!1296279))

(check-sat (not b!1407681) (not b!1407674) (not b!1407680) (not b!1407678) (not start!121076) (not b!1407677) (not b!1407679) (not b!1407675))
(check-sat)
