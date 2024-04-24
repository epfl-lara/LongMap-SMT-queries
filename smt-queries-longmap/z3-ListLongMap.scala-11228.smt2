; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131418 () Bool)

(assert start!131418)

(declare-fun b!1539370 () Bool)

(declare-fun e!856920 () Bool)

(declare-fun e!856918 () Bool)

(assert (=> b!1539370 (= e!856920 e!856918)))

(declare-fun res!1054887 () Bool)

(assert (=> b!1539370 (=> (not res!1054887) (not e!856918))))

(declare-datatypes ((SeekEntryResult!13345 0))(
  ( (MissingZero!13345 (index!55775 (_ BitVec 32))) (Found!13345 (index!55776 (_ BitVec 32))) (Intermediate!13345 (undefined!14157 Bool) (index!55777 (_ BitVec 32)) (x!137717 (_ BitVec 32))) (Undefined!13345) (MissingVacant!13345 (index!55778 (_ BitVec 32))) )
))
(declare-fun lt!665445 () SeekEntryResult!13345)

(declare-fun lt!665442 () SeekEntryResult!13345)

(assert (=> b!1539370 (= res!1054887 (= lt!665445 lt!665442))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102220 0))(
  ( (array!102221 (arr!49318 (Array (_ BitVec 32) (_ BitVec 64))) (size!49869 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102220)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!665443 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102220 (_ BitVec 32)) SeekEntryResult!13345)

(assert (=> b!1539370 (= lt!665445 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665443 vacantIndex!5 (select (arr!49318 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539371 () Bool)

(declare-fun e!856921 () Bool)

(declare-fun e!856919 () Bool)

(assert (=> b!1539371 (= e!856921 e!856919)))

(declare-fun res!1054883 () Bool)

(assert (=> b!1539371 (=> (not res!1054883) (not e!856919))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539371 (= res!1054883 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49318 a!2792) j!64) a!2792 mask!2480) lt!665442))))

(assert (=> b!1539371 (= lt!665442 (Found!13345 j!64))))

(declare-fun b!1539372 () Bool)

(assert (=> b!1539372 (= e!856919 e!856920)))

(declare-fun res!1054885 () Bool)

(assert (=> b!1539372 (=> (not res!1054885) (not e!856920))))

(assert (=> b!1539372 (= res!1054885 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665443 #b00000000000000000000000000000000) (bvslt lt!665443 (size!49869 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539372 (= lt!665443 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun res!1054889 () Bool)

(assert (=> start!131418 (=> (not res!1054889) (not e!856921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131418 (= res!1054889 (validMask!0 mask!2480))))

(assert (=> start!131418 e!856921))

(assert (=> start!131418 true))

(declare-fun array_inv!38599 (array!102220) Bool)

(assert (=> start!131418 (array_inv!38599 a!2792)))

(declare-fun b!1539373 () Bool)

(declare-fun res!1054884 () Bool)

(assert (=> b!1539373 (=> (not res!1054884) (not e!856921))))

(assert (=> b!1539373 (= res!1054884 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49869 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49869 a!2792)) (= (select (arr!49318 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539374 () Bool)

(declare-fun res!1054881 () Bool)

(assert (=> b!1539374 (=> (not res!1054881) (not e!856921))))

(declare-datatypes ((List!35779 0))(
  ( (Nil!35776) (Cons!35775 (h!37238 (_ BitVec 64)) (t!50465 List!35779)) )
))
(declare-fun arrayNoDuplicates!0 (array!102220 (_ BitVec 32) List!35779) Bool)

(assert (=> b!1539374 (= res!1054881 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35776))))

(declare-fun b!1539375 () Bool)

(declare-fun res!1054886 () Bool)

(assert (=> b!1539375 (=> (not res!1054886) (not e!856921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539375 (= res!1054886 (validKeyInArray!0 (select (arr!49318 a!2792) j!64)))))

(declare-fun b!1539376 () Bool)

(declare-fun res!1054880 () Bool)

(assert (=> b!1539376 (=> (not res!1054880) (not e!856921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102220 (_ BitVec 32)) Bool)

(assert (=> b!1539376 (= res!1054880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539377 () Bool)

(declare-fun res!1054890 () Bool)

(assert (=> b!1539377 (=> (not res!1054890) (not e!856921))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539377 (= res!1054890 (and (= (size!49869 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49869 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49869 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539378 () Bool)

(declare-fun res!1054888 () Bool)

(assert (=> b!1539378 (=> (not res!1054888) (not e!856921))))

(assert (=> b!1539378 (= res!1054888 (validKeyInArray!0 (select (arr!49318 a!2792) i!951)))))

(declare-fun b!1539379 () Bool)

(declare-fun res!1054882 () Bool)

(assert (=> b!1539379 (=> (not res!1054882) (not e!856919))))

(assert (=> b!1539379 (= res!1054882 (not (= (select (arr!49318 a!2792) index!463) (select (arr!49318 a!2792) j!64))))))

(declare-fun b!1539380 () Bool)

(assert (=> b!1539380 (= e!856918 (not true))))

(assert (=> b!1539380 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665443 vacantIndex!5 (select (store (arr!49318 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102221 (store (arr!49318 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49869 a!2792)) mask!2480) lt!665445)))

(declare-datatypes ((Unit!51299 0))(
  ( (Unit!51300) )
))
(declare-fun lt!665444 () Unit!51299)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51299)

(assert (=> b!1539380 (= lt!665444 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665443 vacantIndex!5 mask!2480))))

(assert (= (and start!131418 res!1054889) b!1539377))

(assert (= (and b!1539377 res!1054890) b!1539378))

(assert (= (and b!1539378 res!1054888) b!1539375))

(assert (= (and b!1539375 res!1054886) b!1539376))

(assert (= (and b!1539376 res!1054880) b!1539374))

(assert (= (and b!1539374 res!1054881) b!1539373))

(assert (= (and b!1539373 res!1054884) b!1539371))

(assert (= (and b!1539371 res!1054883) b!1539379))

(assert (= (and b!1539379 res!1054882) b!1539372))

(assert (= (and b!1539372 res!1054885) b!1539370))

(assert (= (and b!1539370 res!1054887) b!1539380))

(declare-fun m!1421659 () Bool)

(assert (=> b!1539371 m!1421659))

(assert (=> b!1539371 m!1421659))

(declare-fun m!1421661 () Bool)

(assert (=> b!1539371 m!1421661))

(declare-fun m!1421663 () Bool)

(assert (=> b!1539374 m!1421663))

(declare-fun m!1421665 () Bool)

(assert (=> b!1539379 m!1421665))

(assert (=> b!1539379 m!1421659))

(assert (=> b!1539370 m!1421659))

(assert (=> b!1539370 m!1421659))

(declare-fun m!1421667 () Bool)

(assert (=> b!1539370 m!1421667))

(assert (=> b!1539375 m!1421659))

(assert (=> b!1539375 m!1421659))

(declare-fun m!1421669 () Bool)

(assert (=> b!1539375 m!1421669))

(declare-fun m!1421671 () Bool)

(assert (=> b!1539378 m!1421671))

(assert (=> b!1539378 m!1421671))

(declare-fun m!1421673 () Bool)

(assert (=> b!1539378 m!1421673))

(declare-fun m!1421675 () Bool)

(assert (=> b!1539376 m!1421675))

(declare-fun m!1421677 () Bool)

(assert (=> start!131418 m!1421677))

(declare-fun m!1421679 () Bool)

(assert (=> start!131418 m!1421679))

(declare-fun m!1421681 () Bool)

(assert (=> b!1539373 m!1421681))

(declare-fun m!1421683 () Bool)

(assert (=> b!1539372 m!1421683))

(declare-fun m!1421685 () Bool)

(assert (=> b!1539380 m!1421685))

(declare-fun m!1421687 () Bool)

(assert (=> b!1539380 m!1421687))

(assert (=> b!1539380 m!1421687))

(declare-fun m!1421689 () Bool)

(assert (=> b!1539380 m!1421689))

(declare-fun m!1421691 () Bool)

(assert (=> b!1539380 m!1421691))

(check-sat (not b!1539370) (not b!1539376) (not b!1539374) (not b!1539375) (not start!131418) (not b!1539380) (not b!1539372) (not b!1539378) (not b!1539371))
(check-sat)
