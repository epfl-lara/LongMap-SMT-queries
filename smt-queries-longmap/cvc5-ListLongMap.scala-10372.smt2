; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122100 () Bool)

(assert start!122100)

(declare-fun res!952760 () Bool)

(declare-fun e!801910 () Bool)

(assert (=> start!122100 (=> (not res!952760) (not e!801910))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122100 (= res!952760 (validMask!0 mask!2840))))

(assert (=> start!122100 e!801910))

(assert (=> start!122100 true))

(declare-datatypes ((array!96735 0))(
  ( (array!96736 (arr!46697 (Array (_ BitVec 32) (_ BitVec 64))) (size!47247 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96735)

(declare-fun array_inv!35725 (array!96735) Bool)

(assert (=> start!122100 (array_inv!35725 a!2901)))

(declare-fun e!801908 () Bool)

(declare-fun b!1416878 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11008 0))(
  ( (MissingZero!11008 (index!46424 (_ BitVec 32))) (Found!11008 (index!46425 (_ BitVec 32))) (Intermediate!11008 (undefined!11820 Bool) (index!46426 (_ BitVec 32)) (x!128029 (_ BitVec 32))) (Undefined!11008) (MissingVacant!11008 (index!46427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96735 (_ BitVec 32)) SeekEntryResult!11008)

(assert (=> b!1416878 (= e!801908 (= (seekEntryOrOpen!0 (select (arr!46697 a!2901) j!112) a!2901 mask!2840) (Found!11008 j!112)))))

(declare-fun b!1416879 () Bool)

(declare-fun e!801909 () Bool)

(assert (=> b!1416879 (= e!801910 (not e!801909))))

(declare-fun res!952758 () Bool)

(assert (=> b!1416879 (=> res!952758 e!801909)))

(declare-fun lt!625150 () SeekEntryResult!11008)

(assert (=> b!1416879 (= res!952758 (or (not (is-Intermediate!11008 lt!625150)) (undefined!11820 lt!625150)))))

(assert (=> b!1416879 e!801908))

(declare-fun res!952759 () Bool)

(assert (=> b!1416879 (=> (not res!952759) (not e!801908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96735 (_ BitVec 32)) Bool)

(assert (=> b!1416879 (= res!952759 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47990 0))(
  ( (Unit!47991) )
))
(declare-fun lt!625152 () Unit!47990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47990)

(assert (=> b!1416879 (= lt!625152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96735 (_ BitVec 32)) SeekEntryResult!11008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416879 (= lt!625150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46697 a!2901) j!112) mask!2840) (select (arr!46697 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416880 () Bool)

(declare-fun res!952761 () Bool)

(assert (=> b!1416880 (=> (not res!952761) (not e!801910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416880 (= res!952761 (validKeyInArray!0 (select (arr!46697 a!2901) j!112)))))

(declare-fun b!1416881 () Bool)

(declare-fun res!952755 () Bool)

(assert (=> b!1416881 (=> (not res!952755) (not e!801910))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416881 (= res!952755 (and (= (size!47247 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47247 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47247 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416882 () Bool)

(declare-fun res!952757 () Bool)

(assert (=> b!1416882 (=> (not res!952757) (not e!801910))))

(assert (=> b!1416882 (= res!952757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416883 () Bool)

(assert (=> b!1416883 (= e!801909 true)))

(declare-fun lt!625151 () SeekEntryResult!11008)

(assert (=> b!1416883 (= lt!625151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96736 (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47247 a!2901)) mask!2840))))

(declare-fun b!1416884 () Bool)

(declare-fun res!952756 () Bool)

(assert (=> b!1416884 (=> (not res!952756) (not e!801910))))

(assert (=> b!1416884 (= res!952756 (validKeyInArray!0 (select (arr!46697 a!2901) i!1037)))))

(declare-fun b!1416885 () Bool)

(declare-fun res!952762 () Bool)

(assert (=> b!1416885 (=> (not res!952762) (not e!801910))))

(declare-datatypes ((List!33216 0))(
  ( (Nil!33213) (Cons!33212 (h!34502 (_ BitVec 64)) (t!47910 List!33216)) )
))
(declare-fun arrayNoDuplicates!0 (array!96735 (_ BitVec 32) List!33216) Bool)

(assert (=> b!1416885 (= res!952762 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33213))))

(assert (= (and start!122100 res!952760) b!1416881))

(assert (= (and b!1416881 res!952755) b!1416884))

(assert (= (and b!1416884 res!952756) b!1416880))

(assert (= (and b!1416880 res!952761) b!1416882))

(assert (= (and b!1416882 res!952757) b!1416885))

(assert (= (and b!1416885 res!952762) b!1416879))

(assert (= (and b!1416879 res!952759) b!1416878))

(assert (= (and b!1416879 (not res!952758)) b!1416883))

(declare-fun m!1307577 () Bool)

(assert (=> start!122100 m!1307577))

(declare-fun m!1307579 () Bool)

(assert (=> start!122100 m!1307579))

(declare-fun m!1307581 () Bool)

(assert (=> b!1416885 m!1307581))

(declare-fun m!1307583 () Bool)

(assert (=> b!1416879 m!1307583))

(declare-fun m!1307585 () Bool)

(assert (=> b!1416879 m!1307585))

(assert (=> b!1416879 m!1307583))

(declare-fun m!1307587 () Bool)

(assert (=> b!1416879 m!1307587))

(assert (=> b!1416879 m!1307585))

(assert (=> b!1416879 m!1307583))

(declare-fun m!1307589 () Bool)

(assert (=> b!1416879 m!1307589))

(declare-fun m!1307591 () Bool)

(assert (=> b!1416879 m!1307591))

(declare-fun m!1307593 () Bool)

(assert (=> b!1416884 m!1307593))

(assert (=> b!1416884 m!1307593))

(declare-fun m!1307595 () Bool)

(assert (=> b!1416884 m!1307595))

(declare-fun m!1307597 () Bool)

(assert (=> b!1416882 m!1307597))

(assert (=> b!1416878 m!1307583))

(assert (=> b!1416878 m!1307583))

(declare-fun m!1307599 () Bool)

(assert (=> b!1416878 m!1307599))

(declare-fun m!1307601 () Bool)

(assert (=> b!1416883 m!1307601))

(declare-fun m!1307603 () Bool)

(assert (=> b!1416883 m!1307603))

(assert (=> b!1416883 m!1307603))

(declare-fun m!1307605 () Bool)

(assert (=> b!1416883 m!1307605))

(assert (=> b!1416883 m!1307605))

(assert (=> b!1416883 m!1307603))

(declare-fun m!1307607 () Bool)

(assert (=> b!1416883 m!1307607))

(assert (=> b!1416880 m!1307583))

(assert (=> b!1416880 m!1307583))

(declare-fun m!1307609 () Bool)

(assert (=> b!1416880 m!1307609))

(push 1)

(assert (not b!1416878))

(assert (not start!122100))

(assert (not b!1416882))

(assert (not b!1416885))

(assert (not b!1416884))

(assert (not b!1416880))

(assert (not b!1416879))

(assert (not b!1416883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

