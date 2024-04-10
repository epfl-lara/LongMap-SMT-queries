; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119186 () Bool)

(assert start!119186)

(declare-fun b!1390329 () Bool)

(declare-fun res!930491 () Bool)

(declare-fun e!787371 () Bool)

(assert (=> b!1390329 (=> (not res!930491) (not e!787371))))

(declare-datatypes ((array!95123 0))(
  ( (array!95124 (arr!45927 (Array (_ BitVec 32) (_ BitVec 64))) (size!46477 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95123)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95123 (_ BitVec 32)) Bool)

(assert (=> b!1390329 (= res!930491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390330 () Bool)

(declare-fun res!930490 () Bool)

(assert (=> b!1390330 (=> (not res!930490) (not e!787371))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390330 (= res!930490 (validKeyInArray!0 (select (arr!45927 a!2901) i!1037)))))

(declare-fun b!1390331 () Bool)

(declare-fun res!930493 () Bool)

(assert (=> b!1390331 (=> (not res!930493) (not e!787371))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390331 (= res!930493 (validKeyInArray!0 (select (arr!45927 a!2901) j!112)))))

(declare-fun b!1390332 () Bool)

(assert (=> b!1390332 (= e!787371 (not true))))

(declare-fun e!787373 () Bool)

(assert (=> b!1390332 e!787373))

(declare-fun res!930494 () Bool)

(assert (=> b!1390332 (=> (not res!930494) (not e!787373))))

(assert (=> b!1390332 (= res!930494 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46492 0))(
  ( (Unit!46493) )
))
(declare-fun lt!610793 () Unit!46492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46492)

(assert (=> b!1390332 (= lt!610793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10244 0))(
  ( (MissingZero!10244 (index!43347 (_ BitVec 32))) (Found!10244 (index!43348 (_ BitVec 32))) (Intermediate!10244 (undefined!11056 Bool) (index!43349 (_ BitVec 32)) (x!125026 (_ BitVec 32))) (Undefined!10244) (MissingVacant!10244 (index!43350 (_ BitVec 32))) )
))
(declare-fun lt!610794 () SeekEntryResult!10244)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95123 (_ BitVec 32)) SeekEntryResult!10244)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390332 (= lt!610794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45927 a!2901) j!112) mask!2840) (select (arr!45927 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390334 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95123 (_ BitVec 32)) SeekEntryResult!10244)

(assert (=> b!1390334 (= e!787373 (= (seekEntryOrOpen!0 (select (arr!45927 a!2901) j!112) a!2901 mask!2840) (Found!10244 j!112)))))

(declare-fun b!1390335 () Bool)

(declare-fun res!930495 () Bool)

(assert (=> b!1390335 (=> (not res!930495) (not e!787371))))

(assert (=> b!1390335 (= res!930495 (and (= (size!46477 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46477 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46477 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390333 () Bool)

(declare-fun res!930496 () Bool)

(assert (=> b!1390333 (=> (not res!930496) (not e!787371))))

(declare-datatypes ((List!32446 0))(
  ( (Nil!32443) (Cons!32442 (h!33660 (_ BitVec 64)) (t!47140 List!32446)) )
))
(declare-fun arrayNoDuplicates!0 (array!95123 (_ BitVec 32) List!32446) Bool)

(assert (=> b!1390333 (= res!930496 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32443))))

(declare-fun res!930492 () Bool)

(assert (=> start!119186 (=> (not res!930492) (not e!787371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119186 (= res!930492 (validMask!0 mask!2840))))

(assert (=> start!119186 e!787371))

(assert (=> start!119186 true))

(declare-fun array_inv!34955 (array!95123) Bool)

(assert (=> start!119186 (array_inv!34955 a!2901)))

(assert (= (and start!119186 res!930492) b!1390335))

(assert (= (and b!1390335 res!930495) b!1390330))

(assert (= (and b!1390330 res!930490) b!1390331))

(assert (= (and b!1390331 res!930493) b!1390329))

(assert (= (and b!1390329 res!930491) b!1390333))

(assert (= (and b!1390333 res!930496) b!1390332))

(assert (= (and b!1390332 res!930494) b!1390334))

(declare-fun m!1276151 () Bool)

(assert (=> b!1390334 m!1276151))

(assert (=> b!1390334 m!1276151))

(declare-fun m!1276153 () Bool)

(assert (=> b!1390334 m!1276153))

(assert (=> b!1390332 m!1276151))

(declare-fun m!1276155 () Bool)

(assert (=> b!1390332 m!1276155))

(assert (=> b!1390332 m!1276151))

(declare-fun m!1276157 () Bool)

(assert (=> b!1390332 m!1276157))

(assert (=> b!1390332 m!1276155))

(assert (=> b!1390332 m!1276151))

(declare-fun m!1276159 () Bool)

(assert (=> b!1390332 m!1276159))

(declare-fun m!1276161 () Bool)

(assert (=> b!1390332 m!1276161))

(declare-fun m!1276163 () Bool)

(assert (=> b!1390329 m!1276163))

(declare-fun m!1276165 () Bool)

(assert (=> start!119186 m!1276165))

(declare-fun m!1276167 () Bool)

(assert (=> start!119186 m!1276167))

(assert (=> b!1390331 m!1276151))

(assert (=> b!1390331 m!1276151))

(declare-fun m!1276169 () Bool)

(assert (=> b!1390331 m!1276169))

(declare-fun m!1276171 () Bool)

(assert (=> b!1390333 m!1276171))

(declare-fun m!1276173 () Bool)

(assert (=> b!1390330 m!1276173))

(assert (=> b!1390330 m!1276173))

(declare-fun m!1276175 () Bool)

(assert (=> b!1390330 m!1276175))

(check-sat (not b!1390334) (not b!1390329) (not b!1390333) (not b!1390332) (not b!1390330) (not b!1390331) (not start!119186))
