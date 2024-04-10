; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120356 () Bool)

(assert start!120356)

(declare-fun b!1400882 () Bool)

(declare-fun res!939393 () Bool)

(declare-fun e!793180 () Bool)

(assert (=> b!1400882 (=> (not res!939393) (not e!793180))))

(declare-datatypes ((array!95765 0))(
  ( (array!95766 (arr!46233 (Array (_ BitVec 32) (_ BitVec 64))) (size!46783 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95765)

(declare-datatypes ((List!32752 0))(
  ( (Nil!32749) (Cons!32748 (h!33996 (_ BitVec 64)) (t!47446 List!32752)) )
))
(declare-fun arrayNoDuplicates!0 (array!95765 (_ BitVec 32) List!32752) Bool)

(assert (=> b!1400882 (= res!939393 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32749))))

(declare-fun b!1400883 () Bool)

(declare-fun res!939397 () Bool)

(assert (=> b!1400883 (=> (not res!939397) (not e!793180))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400883 (= res!939397 (validKeyInArray!0 (select (arr!46233 a!2901) i!1037)))))

(declare-fun b!1400884 () Bool)

(declare-fun e!793179 () Bool)

(assert (=> b!1400884 (= e!793179 true)))

(declare-fun lt!616526 () array!95765)

(declare-datatypes ((SeekEntryResult!10550 0))(
  ( (MissingZero!10550 (index!44577 (_ BitVec 32))) (Found!10550 (index!44578 (_ BitVec 32))) (Intermediate!10550 (undefined!11362 Bool) (index!44579 (_ BitVec 32)) (x!126217 (_ BitVec 32))) (Undefined!10550) (MissingVacant!10550 (index!44580 (_ BitVec 32))) )
))
(declare-fun lt!616533 () SeekEntryResult!10550)

(declare-fun lt!616532 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616529 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95765 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1400884 (= lt!616533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616529 lt!616532 lt!616526 mask!2840))))

(declare-fun res!939399 () Bool)

(assert (=> start!120356 (=> (not res!939399) (not e!793180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120356 (= res!939399 (validMask!0 mask!2840))))

(assert (=> start!120356 e!793180))

(assert (=> start!120356 true))

(declare-fun array_inv!35261 (array!95765) Bool)

(assert (=> start!120356 (array_inv!35261 a!2901)))

(declare-fun b!1400885 () Bool)

(declare-fun e!793181 () Bool)

(assert (=> b!1400885 (= e!793180 (not e!793181))))

(declare-fun res!939398 () Bool)

(assert (=> b!1400885 (=> res!939398 e!793181)))

(declare-fun lt!616531 () SeekEntryResult!10550)

(get-info :version)

(assert (=> b!1400885 (= res!939398 (or (not ((_ is Intermediate!10550) lt!616531)) (undefined!11362 lt!616531)))))

(declare-fun e!793183 () Bool)

(assert (=> b!1400885 e!793183))

(declare-fun res!939400 () Bool)

(assert (=> b!1400885 (=> (not res!939400) (not e!793183))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95765 (_ BitVec 32)) Bool)

(assert (=> b!1400885 (= res!939400 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47104 0))(
  ( (Unit!47105) )
))
(declare-fun lt!616530 () Unit!47104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47104)

(assert (=> b!1400885 (= lt!616530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400885 (= lt!616531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616529 (select (arr!46233 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400885 (= lt!616529 (toIndex!0 (select (arr!46233 a!2901) j!112) mask!2840))))

(declare-fun b!1400886 () Bool)

(declare-fun lt!616527 () SeekEntryResult!10550)

(declare-fun e!793178 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95765 (_ BitVec 32)) SeekEntryResult!10550)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95765 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1400886 (= e!793178 (= (seekEntryOrOpen!0 lt!616532 lt!616526 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126217 lt!616527) (index!44579 lt!616527) (index!44579 lt!616527) (select (arr!46233 a!2901) j!112) lt!616526 mask!2840)))))

(declare-fun b!1400887 () Bool)

(declare-fun res!939402 () Bool)

(assert (=> b!1400887 (=> (not res!939402) (not e!793180))))

(assert (=> b!1400887 (= res!939402 (and (= (size!46783 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46783 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46783 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400888 () Bool)

(declare-fun e!793184 () Bool)

(assert (=> b!1400888 (= e!793184 e!793179)))

(declare-fun res!939403 () Bool)

(assert (=> b!1400888 (=> res!939403 e!793179)))

(assert (=> b!1400888 (= res!939403 (or (bvslt (x!126217 lt!616531) #b00000000000000000000000000000000) (bvsgt (x!126217 lt!616531) #b01111111111111111111111111111110) (bvslt (x!126217 lt!616527) #b00000000000000000000000000000000) (bvsgt (x!126217 lt!616527) #b01111111111111111111111111111110) (bvslt lt!616529 #b00000000000000000000000000000000) (bvsge lt!616529 (size!46783 a!2901)) (bvslt (index!44579 lt!616531) #b00000000000000000000000000000000) (bvsge (index!44579 lt!616531) (size!46783 a!2901)) (bvslt (index!44579 lt!616527) #b00000000000000000000000000000000) (bvsge (index!44579 lt!616527) (size!46783 a!2901)) (not (= lt!616531 (Intermediate!10550 false (index!44579 lt!616531) (x!126217 lt!616531)))) (not (= lt!616527 (Intermediate!10550 false (index!44579 lt!616527) (x!126217 lt!616527))))))))

(assert (=> b!1400888 e!793178))

(declare-fun res!939401 () Bool)

(assert (=> b!1400888 (=> (not res!939401) (not e!793178))))

(assert (=> b!1400888 (= res!939401 (and (not (undefined!11362 lt!616527)) (= (index!44579 lt!616527) i!1037) (bvslt (x!126217 lt!616527) (x!126217 lt!616531)) (= (select (store (arr!46233 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44579 lt!616527)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616528 () Unit!47104)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47104)

(assert (=> b!1400888 (= lt!616528 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616529 (x!126217 lt!616531) (index!44579 lt!616531) (x!126217 lt!616527) (index!44579 lt!616527) (undefined!11362 lt!616527) mask!2840))))

(declare-fun b!1400889 () Bool)

(assert (=> b!1400889 (= e!793183 (= (seekEntryOrOpen!0 (select (arr!46233 a!2901) j!112) a!2901 mask!2840) (Found!10550 j!112)))))

(declare-fun b!1400890 () Bool)

(assert (=> b!1400890 (= e!793181 e!793184)))

(declare-fun res!939396 () Bool)

(assert (=> b!1400890 (=> res!939396 e!793184)))

(assert (=> b!1400890 (= res!939396 (or (= lt!616531 lt!616527) (not ((_ is Intermediate!10550) lt!616527))))))

(assert (=> b!1400890 (= lt!616527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616532 mask!2840) lt!616532 lt!616526 mask!2840))))

(assert (=> b!1400890 (= lt!616532 (select (store (arr!46233 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400890 (= lt!616526 (array!95766 (store (arr!46233 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46783 a!2901)))))

(declare-fun b!1400891 () Bool)

(declare-fun res!939395 () Bool)

(assert (=> b!1400891 (=> (not res!939395) (not e!793180))))

(assert (=> b!1400891 (= res!939395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400892 () Bool)

(declare-fun res!939394 () Bool)

(assert (=> b!1400892 (=> (not res!939394) (not e!793180))))

(assert (=> b!1400892 (= res!939394 (validKeyInArray!0 (select (arr!46233 a!2901) j!112)))))

(assert (= (and start!120356 res!939399) b!1400887))

(assert (= (and b!1400887 res!939402) b!1400883))

(assert (= (and b!1400883 res!939397) b!1400892))

(assert (= (and b!1400892 res!939394) b!1400891))

(assert (= (and b!1400891 res!939395) b!1400882))

(assert (= (and b!1400882 res!939393) b!1400885))

(assert (= (and b!1400885 res!939400) b!1400889))

(assert (= (and b!1400885 (not res!939398)) b!1400890))

(assert (= (and b!1400890 (not res!939396)) b!1400888))

(assert (= (and b!1400888 res!939401) b!1400886))

(assert (= (and b!1400888 (not res!939403)) b!1400884))

(declare-fun m!1288481 () Bool)

(assert (=> start!120356 m!1288481))

(declare-fun m!1288483 () Bool)

(assert (=> start!120356 m!1288483))

(declare-fun m!1288485 () Bool)

(assert (=> b!1400891 m!1288485))

(declare-fun m!1288487 () Bool)

(assert (=> b!1400892 m!1288487))

(assert (=> b!1400892 m!1288487))

(declare-fun m!1288489 () Bool)

(assert (=> b!1400892 m!1288489))

(assert (=> b!1400889 m!1288487))

(assert (=> b!1400889 m!1288487))

(declare-fun m!1288491 () Bool)

(assert (=> b!1400889 m!1288491))

(declare-fun m!1288493 () Bool)

(assert (=> b!1400882 m!1288493))

(declare-fun m!1288495 () Bool)

(assert (=> b!1400884 m!1288495))

(assert (=> b!1400885 m!1288487))

(declare-fun m!1288497 () Bool)

(assert (=> b!1400885 m!1288497))

(assert (=> b!1400885 m!1288487))

(assert (=> b!1400885 m!1288487))

(declare-fun m!1288499 () Bool)

(assert (=> b!1400885 m!1288499))

(declare-fun m!1288501 () Bool)

(assert (=> b!1400885 m!1288501))

(declare-fun m!1288503 () Bool)

(assert (=> b!1400885 m!1288503))

(declare-fun m!1288505 () Bool)

(assert (=> b!1400883 m!1288505))

(assert (=> b!1400883 m!1288505))

(declare-fun m!1288507 () Bool)

(assert (=> b!1400883 m!1288507))

(declare-fun m!1288509 () Bool)

(assert (=> b!1400890 m!1288509))

(assert (=> b!1400890 m!1288509))

(declare-fun m!1288511 () Bool)

(assert (=> b!1400890 m!1288511))

(declare-fun m!1288513 () Bool)

(assert (=> b!1400890 m!1288513))

(declare-fun m!1288515 () Bool)

(assert (=> b!1400890 m!1288515))

(declare-fun m!1288517 () Bool)

(assert (=> b!1400886 m!1288517))

(assert (=> b!1400886 m!1288487))

(assert (=> b!1400886 m!1288487))

(declare-fun m!1288519 () Bool)

(assert (=> b!1400886 m!1288519))

(assert (=> b!1400888 m!1288513))

(declare-fun m!1288521 () Bool)

(assert (=> b!1400888 m!1288521))

(declare-fun m!1288523 () Bool)

(assert (=> b!1400888 m!1288523))

(check-sat (not start!120356) (not b!1400892) (not b!1400890) (not b!1400889) (not b!1400882) (not b!1400891) (not b!1400888) (not b!1400884) (not b!1400883) (not b!1400886) (not b!1400885))
(check-sat)
