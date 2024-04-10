; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120814 () Bool)

(assert start!120814)

(declare-fun res!943930 () Bool)

(declare-fun e!795679 () Bool)

(assert (=> start!120814 (=> (not res!943930) (not e!795679))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120814 (= res!943930 (validMask!0 mask!2840))))

(assert (=> start!120814 e!795679))

(assert (=> start!120814 true))

(declare-datatypes ((array!96121 0))(
  ( (array!96122 (arr!46408 (Array (_ BitVec 32) (_ BitVec 64))) (size!46958 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96121)

(declare-fun array_inv!35436 (array!96121) Bool)

(assert (=> start!120814 (array_inv!35436 a!2901)))

(declare-fun b!1405712 () Bool)

(declare-fun res!943935 () Bool)

(assert (=> b!1405712 (=> (not res!943935) (not e!795679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96121 (_ BitVec 32)) Bool)

(assert (=> b!1405712 (= res!943935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405713 () Bool)

(declare-fun e!795680 () Bool)

(assert (=> b!1405713 (= e!795680 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!619112 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405713 (= lt!619112 (toIndex!0 (select (store (arr!46408 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405714 () Bool)

(declare-fun res!943931 () Bool)

(assert (=> b!1405714 (=> (not res!943931) (not e!795679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405714 (= res!943931 (validKeyInArray!0 (select (arr!46408 a!2901) j!112)))))

(declare-fun b!1405715 () Bool)

(declare-fun e!795678 () Bool)

(declare-datatypes ((SeekEntryResult!10719 0))(
  ( (MissingZero!10719 (index!45253 (_ BitVec 32))) (Found!10719 (index!45254 (_ BitVec 32))) (Intermediate!10719 (undefined!11531 Bool) (index!45255 (_ BitVec 32)) (x!126862 (_ BitVec 32))) (Undefined!10719) (MissingVacant!10719 (index!45256 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96121 (_ BitVec 32)) SeekEntryResult!10719)

(assert (=> b!1405715 (= e!795678 (= (seekEntryOrOpen!0 (select (arr!46408 a!2901) j!112) a!2901 mask!2840) (Found!10719 j!112)))))

(declare-fun b!1405716 () Bool)

(declare-fun res!943934 () Bool)

(assert (=> b!1405716 (=> (not res!943934) (not e!795679))))

(assert (=> b!1405716 (= res!943934 (validKeyInArray!0 (select (arr!46408 a!2901) i!1037)))))

(declare-fun b!1405717 () Bool)

(declare-fun res!943933 () Bool)

(assert (=> b!1405717 (=> (not res!943933) (not e!795679))))

(declare-datatypes ((List!32927 0))(
  ( (Nil!32924) (Cons!32923 (h!34177 (_ BitVec 64)) (t!47621 List!32927)) )
))
(declare-fun arrayNoDuplicates!0 (array!96121 (_ BitVec 32) List!32927) Bool)

(assert (=> b!1405717 (= res!943933 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32924))))

(declare-fun b!1405718 () Bool)

(assert (=> b!1405718 (= e!795679 (not e!795680))))

(declare-fun res!943936 () Bool)

(assert (=> b!1405718 (=> res!943936 e!795680)))

(declare-fun lt!619111 () SeekEntryResult!10719)

(assert (=> b!1405718 (= res!943936 (or (not (is-Intermediate!10719 lt!619111)) (undefined!11531 lt!619111)))))

(assert (=> b!1405718 e!795678))

(declare-fun res!943929 () Bool)

(assert (=> b!1405718 (=> (not res!943929) (not e!795678))))

(assert (=> b!1405718 (= res!943929 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47412 0))(
  ( (Unit!47413) )
))
(declare-fun lt!619113 () Unit!47412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47412)

(assert (=> b!1405718 (= lt!619113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96121 (_ BitVec 32)) SeekEntryResult!10719)

(assert (=> b!1405718 (= lt!619111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46408 a!2901) j!112) mask!2840) (select (arr!46408 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405719 () Bool)

(declare-fun res!943932 () Bool)

(assert (=> b!1405719 (=> (not res!943932) (not e!795679))))

(assert (=> b!1405719 (= res!943932 (and (= (size!46958 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46958 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46958 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120814 res!943930) b!1405719))

(assert (= (and b!1405719 res!943932) b!1405716))

(assert (= (and b!1405716 res!943934) b!1405714))

(assert (= (and b!1405714 res!943931) b!1405712))

(assert (= (and b!1405712 res!943935) b!1405717))

(assert (= (and b!1405717 res!943933) b!1405718))

(assert (= (and b!1405718 res!943929) b!1405715))

(assert (= (and b!1405718 (not res!943936)) b!1405713))

(declare-fun m!1294561 () Bool)

(assert (=> b!1405717 m!1294561))

(declare-fun m!1294563 () Bool)

(assert (=> b!1405712 m!1294563))

(declare-fun m!1294565 () Bool)

(assert (=> b!1405714 m!1294565))

(assert (=> b!1405714 m!1294565))

(declare-fun m!1294567 () Bool)

(assert (=> b!1405714 m!1294567))

(declare-fun m!1294569 () Bool)

(assert (=> b!1405713 m!1294569))

(declare-fun m!1294571 () Bool)

(assert (=> b!1405713 m!1294571))

(assert (=> b!1405713 m!1294571))

(declare-fun m!1294573 () Bool)

(assert (=> b!1405713 m!1294573))

(declare-fun m!1294575 () Bool)

(assert (=> start!120814 m!1294575))

(declare-fun m!1294577 () Bool)

(assert (=> start!120814 m!1294577))

(declare-fun m!1294579 () Bool)

(assert (=> b!1405716 m!1294579))

(assert (=> b!1405716 m!1294579))

(declare-fun m!1294581 () Bool)

(assert (=> b!1405716 m!1294581))

(assert (=> b!1405718 m!1294565))

(declare-fun m!1294583 () Bool)

(assert (=> b!1405718 m!1294583))

(assert (=> b!1405718 m!1294565))

(declare-fun m!1294585 () Bool)

(assert (=> b!1405718 m!1294585))

(assert (=> b!1405718 m!1294583))

(assert (=> b!1405718 m!1294565))

(declare-fun m!1294587 () Bool)

(assert (=> b!1405718 m!1294587))

(declare-fun m!1294589 () Bool)

(assert (=> b!1405718 m!1294589))

(assert (=> b!1405715 m!1294565))

(assert (=> b!1405715 m!1294565))

(declare-fun m!1294591 () Bool)

(assert (=> b!1405715 m!1294591))

(push 1)

(assert (not b!1405712))

(assert (not start!120814))

(assert (not b!1405718))

(assert (not b!1405716))

(assert (not b!1405717))

(assert (not b!1405713))

(assert (not b!1405714))

(assert (not b!1405715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

