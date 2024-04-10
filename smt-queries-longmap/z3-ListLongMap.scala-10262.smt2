; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120626 () Bool)

(assert start!120626)

(declare-fun res!942936 () Bool)

(declare-fun e!795035 () Bool)

(assert (=> start!120626 (=> (not res!942936) (not e!795035))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120626 (= res!942936 (validMask!0 mask!2840))))

(assert (=> start!120626 e!795035))

(assert (=> start!120626 true))

(declare-datatypes ((array!96035 0))(
  ( (array!96036 (arr!46368 (Array (_ BitVec 32) (_ BitVec 64))) (size!46918 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96035)

(declare-fun array_inv!35396 (array!96035) Bool)

(assert (=> start!120626 (array_inv!35396 a!2901)))

(declare-fun b!1404421 () Bool)

(declare-fun res!942933 () Bool)

(assert (=> b!1404421 (=> (not res!942933) (not e!795035))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404421 (= res!942933 (validKeyInArray!0 (select (arr!46368 a!2901) j!112)))))

(declare-fun b!1404422 () Bool)

(declare-fun res!942935 () Bool)

(assert (=> b!1404422 (=> (not res!942935) (not e!795035))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404422 (= res!942935 (and (= (size!46918 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46918 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46918 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404423 () Bool)

(declare-fun res!942932 () Bool)

(assert (=> b!1404423 (=> (not res!942932) (not e!795035))))

(declare-datatypes ((List!32887 0))(
  ( (Nil!32884) (Cons!32883 (h!34131 (_ BitVec 64)) (t!47581 List!32887)) )
))
(declare-fun arrayNoDuplicates!0 (array!96035 (_ BitVec 32) List!32887) Bool)

(assert (=> b!1404423 (= res!942932 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32884))))

(declare-fun b!1404424 () Bool)

(assert (=> b!1404424 (= e!795035 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96035 (_ BitVec 32)) Bool)

(assert (=> b!1404424 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47332 0))(
  ( (Unit!47333) )
))
(declare-fun lt!618647 () Unit!47332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47332)

(assert (=> b!1404424 (= lt!618647 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10679 0))(
  ( (MissingZero!10679 (index!45093 (_ BitVec 32))) (Found!10679 (index!45094 (_ BitVec 32))) (Intermediate!10679 (undefined!11491 Bool) (index!45095 (_ BitVec 32)) (x!126706 (_ BitVec 32))) (Undefined!10679) (MissingVacant!10679 (index!45096 (_ BitVec 32))) )
))
(declare-fun lt!618648 () SeekEntryResult!10679)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96035 (_ BitVec 32)) SeekEntryResult!10679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404424 (= lt!618648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46368 a!2901) j!112) mask!2840) (select (arr!46368 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404425 () Bool)

(declare-fun res!942934 () Bool)

(assert (=> b!1404425 (=> (not res!942934) (not e!795035))))

(assert (=> b!1404425 (= res!942934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404426 () Bool)

(declare-fun res!942937 () Bool)

(assert (=> b!1404426 (=> (not res!942937) (not e!795035))))

(assert (=> b!1404426 (= res!942937 (validKeyInArray!0 (select (arr!46368 a!2901) i!1037)))))

(assert (= (and start!120626 res!942936) b!1404422))

(assert (= (and b!1404422 res!942935) b!1404426))

(assert (= (and b!1404426 res!942937) b!1404421))

(assert (= (and b!1404421 res!942933) b!1404425))

(assert (= (and b!1404425 res!942934) b!1404423))

(assert (= (and b!1404423 res!942932) b!1404424))

(declare-fun m!1293261 () Bool)

(assert (=> b!1404426 m!1293261))

(assert (=> b!1404426 m!1293261))

(declare-fun m!1293263 () Bool)

(assert (=> b!1404426 m!1293263))

(declare-fun m!1293265 () Bool)

(assert (=> b!1404421 m!1293265))

(assert (=> b!1404421 m!1293265))

(declare-fun m!1293267 () Bool)

(assert (=> b!1404421 m!1293267))

(declare-fun m!1293269 () Bool)

(assert (=> b!1404423 m!1293269))

(declare-fun m!1293271 () Bool)

(assert (=> b!1404425 m!1293271))

(declare-fun m!1293273 () Bool)

(assert (=> start!120626 m!1293273))

(declare-fun m!1293275 () Bool)

(assert (=> start!120626 m!1293275))

(assert (=> b!1404424 m!1293265))

(declare-fun m!1293277 () Bool)

(assert (=> b!1404424 m!1293277))

(assert (=> b!1404424 m!1293265))

(declare-fun m!1293279 () Bool)

(assert (=> b!1404424 m!1293279))

(assert (=> b!1404424 m!1293277))

(assert (=> b!1404424 m!1293265))

(declare-fun m!1293281 () Bool)

(assert (=> b!1404424 m!1293281))

(declare-fun m!1293283 () Bool)

(assert (=> b!1404424 m!1293283))

(check-sat (not b!1404425) (not b!1404424) (not b!1404426) (not b!1404421) (not start!120626) (not b!1404423))
