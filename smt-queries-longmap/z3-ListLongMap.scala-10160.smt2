; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119726 () Bool)

(assert start!119726)

(declare-fun b!1394710 () Bool)

(declare-fun e!789624 () Bool)

(assert (=> b!1394710 (= e!789624 true)))

(declare-datatypes ((SeekEntryResult!10379 0))(
  ( (MissingZero!10379 (index!43887 (_ BitVec 32))) (Found!10379 (index!43888 (_ BitVec 32))) (Intermediate!10379 (undefined!11191 Bool) (index!43889 (_ BitVec 32)) (x!125551 (_ BitVec 32))) (Undefined!10379) (MissingVacant!10379 (index!43890 (_ BitVec 32))) )
))
(declare-fun lt!612686 () SeekEntryResult!10379)

(declare-datatypes ((array!95408 0))(
  ( (array!95409 (arr!46062 (Array (_ BitVec 32) (_ BitVec 64))) (size!46612 (_ BitVec 32))) )
))
(declare-fun lt!612683 () array!95408)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612685 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95408 (_ BitVec 32)) SeekEntryResult!10379)

(assert (=> b!1394710 (= lt!612686 (seekEntryOrOpen!0 lt!612685 lt!612683 mask!2840))))

(declare-fun a!2901 () array!95408)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612681 () SeekEntryResult!10379)

(declare-datatypes ((Unit!46762 0))(
  ( (Unit!46763) )
))
(declare-fun lt!612687 () Unit!46762)

(declare-fun lt!612684 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46762)

(assert (=> b!1394710 (= lt!612687 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612684 (x!125551 lt!612681) (index!43889 lt!612681) mask!2840))))

(declare-fun b!1394711 () Bool)

(declare-fun res!934123 () Bool)

(declare-fun e!789625 () Bool)

(assert (=> b!1394711 (=> (not res!934123) (not e!789625))))

(declare-datatypes ((List!32581 0))(
  ( (Nil!32578) (Cons!32577 (h!33810 (_ BitVec 64)) (t!47275 List!32581)) )
))
(declare-fun arrayNoDuplicates!0 (array!95408 (_ BitVec 32) List!32581) Bool)

(assert (=> b!1394711 (= res!934123 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32578))))

(declare-fun b!1394712 () Bool)

(declare-fun res!934120 () Bool)

(assert (=> b!1394712 (=> (not res!934120) (not e!789625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95408 (_ BitVec 32)) Bool)

(assert (=> b!1394712 (= res!934120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394713 () Bool)

(declare-fun res!934121 () Bool)

(assert (=> b!1394713 (=> res!934121 e!789624)))

(assert (=> b!1394713 (= res!934121 (or (bvslt (x!125551 lt!612681) #b00000000000000000000000000000000) (bvsgt (x!125551 lt!612681) #b01111111111111111111111111111110) (bvslt lt!612684 #b00000000000000000000000000000000) (bvsge lt!612684 (size!46612 a!2901)) (bvslt (index!43889 lt!612681) #b00000000000000000000000000000000) (bvsge (index!43889 lt!612681) (size!46612 a!2901)) (not (= lt!612681 (Intermediate!10379 false (index!43889 lt!612681) (x!125551 lt!612681))))))))

(declare-fun b!1394714 () Bool)

(declare-fun e!789626 () Bool)

(assert (=> b!1394714 (= e!789626 e!789624)))

(declare-fun res!934118 () Bool)

(assert (=> b!1394714 (=> res!934118 e!789624)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95408 (_ BitVec 32)) SeekEntryResult!10379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394714 (= res!934118 (not (= lt!612681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612685 mask!2840) lt!612685 lt!612683 mask!2840))))))

(assert (=> b!1394714 (= lt!612685 (select (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394714 (= lt!612683 (array!95409 (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46612 a!2901)))))

(declare-fun b!1394715 () Bool)

(declare-fun res!934126 () Bool)

(assert (=> b!1394715 (=> (not res!934126) (not e!789625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394715 (= res!934126 (validKeyInArray!0 (select (arr!46062 a!2901) j!112)))))

(declare-fun res!934125 () Bool)

(assert (=> start!119726 (=> (not res!934125) (not e!789625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119726 (= res!934125 (validMask!0 mask!2840))))

(assert (=> start!119726 e!789625))

(assert (=> start!119726 true))

(declare-fun array_inv!35090 (array!95408) Bool)

(assert (=> start!119726 (array_inv!35090 a!2901)))

(declare-fun b!1394716 () Bool)

(declare-fun res!934122 () Bool)

(assert (=> b!1394716 (=> (not res!934122) (not e!789625))))

(assert (=> b!1394716 (= res!934122 (validKeyInArray!0 (select (arr!46062 a!2901) i!1037)))))

(declare-fun b!1394717 () Bool)

(assert (=> b!1394717 (= e!789625 (not e!789626))))

(declare-fun res!934119 () Bool)

(assert (=> b!1394717 (=> res!934119 e!789626)))

(get-info :version)

(assert (=> b!1394717 (= res!934119 (or (not ((_ is Intermediate!10379) lt!612681)) (undefined!11191 lt!612681)))))

(assert (=> b!1394717 (= lt!612686 (Found!10379 j!112))))

(assert (=> b!1394717 (= lt!612686 (seekEntryOrOpen!0 (select (arr!46062 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394717 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612682 () Unit!46762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46762)

(assert (=> b!1394717 (= lt!612682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394717 (= lt!612681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612684 (select (arr!46062 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394717 (= lt!612684 (toIndex!0 (select (arr!46062 a!2901) j!112) mask!2840))))

(declare-fun b!1394718 () Bool)

(declare-fun res!934124 () Bool)

(assert (=> b!1394718 (=> (not res!934124) (not e!789625))))

(assert (=> b!1394718 (= res!934124 (and (= (size!46612 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46612 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46612 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119726 res!934125) b!1394718))

(assert (= (and b!1394718 res!934124) b!1394716))

(assert (= (and b!1394716 res!934122) b!1394715))

(assert (= (and b!1394715 res!934126) b!1394712))

(assert (= (and b!1394712 res!934120) b!1394711))

(assert (= (and b!1394711 res!934123) b!1394717))

(assert (= (and b!1394717 (not res!934119)) b!1394714))

(assert (= (and b!1394714 (not res!934118)) b!1394713))

(assert (= (and b!1394713 (not res!934121)) b!1394710))

(declare-fun m!1281143 () Bool)

(assert (=> b!1394710 m!1281143))

(declare-fun m!1281145 () Bool)

(assert (=> b!1394710 m!1281145))

(declare-fun m!1281147 () Bool)

(assert (=> b!1394711 m!1281147))

(declare-fun m!1281149 () Bool)

(assert (=> b!1394714 m!1281149))

(assert (=> b!1394714 m!1281149))

(declare-fun m!1281151 () Bool)

(assert (=> b!1394714 m!1281151))

(declare-fun m!1281153 () Bool)

(assert (=> b!1394714 m!1281153))

(declare-fun m!1281155 () Bool)

(assert (=> b!1394714 m!1281155))

(declare-fun m!1281157 () Bool)

(assert (=> start!119726 m!1281157))

(declare-fun m!1281159 () Bool)

(assert (=> start!119726 m!1281159))

(declare-fun m!1281161 () Bool)

(assert (=> b!1394715 m!1281161))

(assert (=> b!1394715 m!1281161))

(declare-fun m!1281163 () Bool)

(assert (=> b!1394715 m!1281163))

(declare-fun m!1281165 () Bool)

(assert (=> b!1394716 m!1281165))

(assert (=> b!1394716 m!1281165))

(declare-fun m!1281167 () Bool)

(assert (=> b!1394716 m!1281167))

(assert (=> b!1394717 m!1281161))

(declare-fun m!1281169 () Bool)

(assert (=> b!1394717 m!1281169))

(assert (=> b!1394717 m!1281161))

(assert (=> b!1394717 m!1281161))

(declare-fun m!1281171 () Bool)

(assert (=> b!1394717 m!1281171))

(declare-fun m!1281173 () Bool)

(assert (=> b!1394717 m!1281173))

(declare-fun m!1281175 () Bool)

(assert (=> b!1394717 m!1281175))

(assert (=> b!1394717 m!1281161))

(declare-fun m!1281177 () Bool)

(assert (=> b!1394717 m!1281177))

(declare-fun m!1281179 () Bool)

(assert (=> b!1394712 m!1281179))

(check-sat (not b!1394712) (not b!1394714) (not b!1394716) (not b!1394715) (not b!1394711) (not start!119726) (not b!1394717) (not b!1394710))
(check-sat)
