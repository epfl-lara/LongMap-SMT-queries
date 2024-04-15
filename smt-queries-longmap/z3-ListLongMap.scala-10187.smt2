; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120044 () Bool)

(assert start!120044)

(declare-fun res!936494 () Bool)

(declare-fun e!791188 () Bool)

(assert (=> start!120044 (=> (not res!936494) (not e!791188))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120044 (= res!936494 (validMask!0 mask!2840))))

(assert (=> start!120044 e!791188))

(assert (=> start!120044 true))

(declare-datatypes ((array!95526 0))(
  ( (array!95527 (arr!46117 (Array (_ BitVec 32) (_ BitVec 64))) (size!46669 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95526)

(declare-fun array_inv!35350 (array!95526) Bool)

(assert (=> start!120044 (array_inv!35350 a!2901)))

(declare-fun b!1397527 () Bool)

(declare-fun res!936493 () Bool)

(assert (=> b!1397527 (=> (not res!936493) (not e!791188))))

(declare-datatypes ((List!32714 0))(
  ( (Nil!32711) (Cons!32710 (h!33952 (_ BitVec 64)) (t!47400 List!32714)) )
))
(declare-fun arrayNoDuplicates!0 (array!95526 (_ BitVec 32) List!32714) Bool)

(assert (=> b!1397527 (= res!936493 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32711))))

(declare-fun b!1397528 () Bool)

(declare-fun res!936496 () Bool)

(assert (=> b!1397528 (=> (not res!936496) (not e!791188))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397528 (= res!936496 (and (= (size!46669 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46669 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46669 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397529 () Bool)

(declare-fun e!791186 () Bool)

(assert (=> b!1397529 (= e!791188 (not e!791186))))

(declare-fun res!936499 () Bool)

(assert (=> b!1397529 (=> res!936499 e!791186)))

(declare-datatypes ((SeekEntryResult!10460 0))(
  ( (MissingZero!10460 (index!44211 (_ BitVec 32))) (Found!10460 (index!44212 (_ BitVec 32))) (Intermediate!10460 (undefined!11272 Bool) (index!44213 (_ BitVec 32)) (x!125863 (_ BitVec 32))) (Undefined!10460) (MissingVacant!10460 (index!44214 (_ BitVec 32))) )
))
(declare-fun lt!614149 () SeekEntryResult!10460)

(get-info :version)

(assert (=> b!1397529 (= res!936499 (or (not ((_ is Intermediate!10460) lt!614149)) (undefined!11272 lt!614149)))))

(declare-fun e!791187 () Bool)

(assert (=> b!1397529 e!791187))

(declare-fun res!936497 () Bool)

(assert (=> b!1397529 (=> (not res!936497) (not e!791187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95526 (_ BitVec 32)) Bool)

(assert (=> b!1397529 (= res!936497 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46767 0))(
  ( (Unit!46768) )
))
(declare-fun lt!614150 () Unit!46767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46767)

(assert (=> b!1397529 (= lt!614150 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95526 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1397529 (= lt!614149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614147 (select (arr!46117 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397529 (= lt!614147 (toIndex!0 (select (arr!46117 a!2901) j!112) mask!2840))))

(declare-fun b!1397530 () Bool)

(declare-fun res!936498 () Bool)

(assert (=> b!1397530 (=> (not res!936498) (not e!791188))))

(assert (=> b!1397530 (= res!936498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397531 () Bool)

(declare-fun res!936495 () Bool)

(assert (=> b!1397531 (=> (not res!936495) (not e!791188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397531 (= res!936495 (validKeyInArray!0 (select (arr!46117 a!2901) i!1037)))))

(declare-fun b!1397532 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95526 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1397532 (= e!791187 (= (seekEntryOrOpen!0 (select (arr!46117 a!2901) j!112) a!2901 mask!2840) (Found!10460 j!112)))))

(declare-fun b!1397533 () Bool)

(declare-fun res!936492 () Bool)

(assert (=> b!1397533 (=> (not res!936492) (not e!791188))))

(assert (=> b!1397533 (= res!936492 (validKeyInArray!0 (select (arr!46117 a!2901) j!112)))))

(declare-fun b!1397534 () Bool)

(declare-fun e!791185 () Bool)

(assert (=> b!1397534 (= e!791186 e!791185)))

(declare-fun res!936491 () Bool)

(assert (=> b!1397534 (=> res!936491 e!791185)))

(declare-fun lt!614146 () SeekEntryResult!10460)

(assert (=> b!1397534 (= res!936491 (or (= lt!614149 lt!614146) (not ((_ is Intermediate!10460) lt!614146)) (bvslt (x!125863 lt!614149) #b00000000000000000000000000000000) (bvsgt (x!125863 lt!614149) #b01111111111111111111111111111110) (bvslt lt!614147 #b00000000000000000000000000000000) (bvsge lt!614147 (size!46669 a!2901)) (bvslt (index!44213 lt!614149) #b00000000000000000000000000000000) (bvsge (index!44213 lt!614149) (size!46669 a!2901)) (not (= lt!614149 (Intermediate!10460 false (index!44213 lt!614149) (x!125863 lt!614149)))) (not (= lt!614146 (Intermediate!10460 (undefined!11272 lt!614146) (index!44213 lt!614146) (x!125863 lt!614146))))))))

(declare-fun lt!614148 () array!95526)

(declare-fun lt!614145 () (_ BitVec 64))

(assert (=> b!1397534 (= lt!614146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614145 mask!2840) lt!614145 lt!614148 mask!2840))))

(assert (=> b!1397534 (= lt!614145 (select (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397534 (= lt!614148 (array!95527 (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46669 a!2901)))))

(declare-fun b!1397535 () Bool)

(assert (=> b!1397535 (= e!791185 true)))

(declare-fun lt!614144 () SeekEntryResult!10460)

(assert (=> b!1397535 (= lt!614144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614147 lt!614145 lt!614148 mask!2840))))

(assert (= (and start!120044 res!936494) b!1397528))

(assert (= (and b!1397528 res!936496) b!1397531))

(assert (= (and b!1397531 res!936495) b!1397533))

(assert (= (and b!1397533 res!936492) b!1397530))

(assert (= (and b!1397530 res!936498) b!1397527))

(assert (= (and b!1397527 res!936493) b!1397529))

(assert (= (and b!1397529 res!936497) b!1397532))

(assert (= (and b!1397529 (not res!936499)) b!1397534))

(assert (= (and b!1397534 (not res!936491)) b!1397535))

(declare-fun m!1283899 () Bool)

(assert (=> b!1397527 m!1283899))

(declare-fun m!1283901 () Bool)

(assert (=> b!1397535 m!1283901))

(declare-fun m!1283903 () Bool)

(assert (=> b!1397529 m!1283903))

(declare-fun m!1283905 () Bool)

(assert (=> b!1397529 m!1283905))

(assert (=> b!1397529 m!1283903))

(assert (=> b!1397529 m!1283903))

(declare-fun m!1283907 () Bool)

(assert (=> b!1397529 m!1283907))

(declare-fun m!1283909 () Bool)

(assert (=> b!1397529 m!1283909))

(declare-fun m!1283911 () Bool)

(assert (=> b!1397529 m!1283911))

(assert (=> b!1397532 m!1283903))

(assert (=> b!1397532 m!1283903))

(declare-fun m!1283913 () Bool)

(assert (=> b!1397532 m!1283913))

(declare-fun m!1283915 () Bool)

(assert (=> b!1397531 m!1283915))

(assert (=> b!1397531 m!1283915))

(declare-fun m!1283917 () Bool)

(assert (=> b!1397531 m!1283917))

(assert (=> b!1397533 m!1283903))

(assert (=> b!1397533 m!1283903))

(declare-fun m!1283919 () Bool)

(assert (=> b!1397533 m!1283919))

(declare-fun m!1283921 () Bool)

(assert (=> b!1397530 m!1283921))

(declare-fun m!1283923 () Bool)

(assert (=> b!1397534 m!1283923))

(assert (=> b!1397534 m!1283923))

(declare-fun m!1283925 () Bool)

(assert (=> b!1397534 m!1283925))

(declare-fun m!1283927 () Bool)

(assert (=> b!1397534 m!1283927))

(declare-fun m!1283929 () Bool)

(assert (=> b!1397534 m!1283929))

(declare-fun m!1283931 () Bool)

(assert (=> start!120044 m!1283931))

(declare-fun m!1283933 () Bool)

(assert (=> start!120044 m!1283933))

(check-sat (not b!1397533) (not start!120044) (not b!1397535) (not b!1397534) (not b!1397529) (not b!1397531) (not b!1397532) (not b!1397527) (not b!1397530))
(check-sat)
