; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120018 () Bool)

(assert start!120018)

(declare-fun b!1397203 () Bool)

(declare-fun res!936118 () Bool)

(declare-fun e!791001 () Bool)

(assert (=> b!1397203 (=> (not res!936118) (not e!791001))))

(declare-datatypes ((array!95547 0))(
  ( (array!95548 (arr!46127 (Array (_ BitVec 32) (_ BitVec 64))) (size!46677 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95547)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397203 (= res!936118 (validKeyInArray!0 (select (arr!46127 a!2901) i!1037)))))

(declare-fun res!936121 () Bool)

(assert (=> start!120018 (=> (not res!936121) (not e!791001))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120018 (= res!936121 (validMask!0 mask!2840))))

(assert (=> start!120018 e!791001))

(assert (=> start!120018 true))

(declare-fun array_inv!35155 (array!95547) Bool)

(assert (=> start!120018 (array_inv!35155 a!2901)))

(declare-fun b!1397204 () Bool)

(declare-fun e!791003 () Bool)

(assert (=> b!1397204 (= e!791001 (not e!791003))))

(declare-fun res!936120 () Bool)

(assert (=> b!1397204 (=> res!936120 e!791003)))

(declare-datatypes ((SeekEntryResult!10444 0))(
  ( (MissingZero!10444 (index!44147 (_ BitVec 32))) (Found!10444 (index!44148 (_ BitVec 32))) (Intermediate!10444 (undefined!11256 Bool) (index!44149 (_ BitVec 32)) (x!125810 (_ BitVec 32))) (Undefined!10444) (MissingVacant!10444 (index!44150 (_ BitVec 32))) )
))
(declare-fun lt!614022 () SeekEntryResult!10444)

(assert (=> b!1397204 (= res!936120 (or (not (is-Intermediate!10444 lt!614022)) (undefined!11256 lt!614022)))))

(declare-fun e!791000 () Bool)

(assert (=> b!1397204 e!791000))

(declare-fun res!936122 () Bool)

(assert (=> b!1397204 (=> (not res!936122) (not e!791000))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95547 (_ BitVec 32)) Bool)

(assert (=> b!1397204 (= res!936122 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46892 0))(
  ( (Unit!46893) )
))
(declare-fun lt!614019 () Unit!46892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46892)

(assert (=> b!1397204 (= lt!614019 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614020 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95547 (_ BitVec 32)) SeekEntryResult!10444)

(assert (=> b!1397204 (= lt!614022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614020 (select (arr!46127 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397204 (= lt!614020 (toIndex!0 (select (arr!46127 a!2901) j!112) mask!2840))))

(declare-fun b!1397205 () Bool)

(declare-fun res!936116 () Bool)

(assert (=> b!1397205 (=> (not res!936116) (not e!791001))))

(declare-datatypes ((List!32646 0))(
  ( (Nil!32643) (Cons!32642 (h!33884 (_ BitVec 64)) (t!47340 List!32646)) )
))
(declare-fun arrayNoDuplicates!0 (array!95547 (_ BitVec 32) List!32646) Bool)

(assert (=> b!1397205 (= res!936116 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32643))))

(declare-fun b!1397206 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95547 (_ BitVec 32)) SeekEntryResult!10444)

(assert (=> b!1397206 (= e!791000 (= (seekEntryOrOpen!0 (select (arr!46127 a!2901) j!112) a!2901 mask!2840) (Found!10444 j!112)))))

(declare-fun b!1397207 () Bool)

(declare-fun res!936117 () Bool)

(assert (=> b!1397207 (=> (not res!936117) (not e!791001))))

(assert (=> b!1397207 (= res!936117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397208 () Bool)

(declare-fun e!790999 () Bool)

(assert (=> b!1397208 (= e!791003 e!790999)))

(declare-fun res!936123 () Bool)

(assert (=> b!1397208 (=> res!936123 e!790999)))

(declare-fun lt!614023 () SeekEntryResult!10444)

(assert (=> b!1397208 (= res!936123 (or (= lt!614022 lt!614023) (not (is-Intermediate!10444 lt!614023)) (bvslt (x!125810 lt!614022) #b00000000000000000000000000000000) (bvsgt (x!125810 lt!614022) #b01111111111111111111111111111110) (bvslt lt!614020 #b00000000000000000000000000000000) (bvsge lt!614020 (size!46677 a!2901)) (bvslt (index!44149 lt!614022) #b00000000000000000000000000000000) (bvsge (index!44149 lt!614022) (size!46677 a!2901)) (not (= lt!614022 (Intermediate!10444 false (index!44149 lt!614022) (x!125810 lt!614022)))) (not (= lt!614023 (Intermediate!10444 (undefined!11256 lt!614023) (index!44149 lt!614023) (x!125810 lt!614023))))))))

(declare-fun lt!614024 () (_ BitVec 64))

(declare-fun lt!614025 () array!95547)

(assert (=> b!1397208 (= lt!614023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614024 mask!2840) lt!614024 lt!614025 mask!2840))))

(assert (=> b!1397208 (= lt!614024 (select (store (arr!46127 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397208 (= lt!614025 (array!95548 (store (arr!46127 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46677 a!2901)))))

(declare-fun b!1397209 () Bool)

(declare-fun res!936124 () Bool)

(assert (=> b!1397209 (=> (not res!936124) (not e!791001))))

(assert (=> b!1397209 (= res!936124 (and (= (size!46677 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46677 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46677 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397210 () Bool)

(declare-fun res!936119 () Bool)

(assert (=> b!1397210 (=> (not res!936119) (not e!791001))))

(assert (=> b!1397210 (= res!936119 (validKeyInArray!0 (select (arr!46127 a!2901) j!112)))))

(declare-fun b!1397211 () Bool)

(assert (=> b!1397211 (= e!790999 true)))

(declare-fun lt!614021 () SeekEntryResult!10444)

(assert (=> b!1397211 (= lt!614021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614020 lt!614024 lt!614025 mask!2840))))

(assert (= (and start!120018 res!936121) b!1397209))

(assert (= (and b!1397209 res!936124) b!1397203))

(assert (= (and b!1397203 res!936118) b!1397210))

(assert (= (and b!1397210 res!936119) b!1397207))

(assert (= (and b!1397207 res!936117) b!1397205))

(assert (= (and b!1397205 res!936116) b!1397204))

(assert (= (and b!1397204 res!936122) b!1397206))

(assert (= (and b!1397204 (not res!936120)) b!1397208))

(assert (= (and b!1397208 (not res!936123)) b!1397211))

(declare-fun m!1283895 () Bool)

(assert (=> b!1397203 m!1283895))

(assert (=> b!1397203 m!1283895))

(declare-fun m!1283897 () Bool)

(assert (=> b!1397203 m!1283897))

(declare-fun m!1283899 () Bool)

(assert (=> b!1397204 m!1283899))

(declare-fun m!1283901 () Bool)

(assert (=> b!1397204 m!1283901))

(assert (=> b!1397204 m!1283899))

(declare-fun m!1283903 () Bool)

(assert (=> b!1397204 m!1283903))

(assert (=> b!1397204 m!1283899))

(declare-fun m!1283905 () Bool)

(assert (=> b!1397204 m!1283905))

(declare-fun m!1283907 () Bool)

(assert (=> b!1397204 m!1283907))

(assert (=> b!1397210 m!1283899))

(assert (=> b!1397210 m!1283899))

(declare-fun m!1283909 () Bool)

(assert (=> b!1397210 m!1283909))

(declare-fun m!1283911 () Bool)

(assert (=> start!120018 m!1283911))

(declare-fun m!1283913 () Bool)

(assert (=> start!120018 m!1283913))

(declare-fun m!1283915 () Bool)

(assert (=> b!1397211 m!1283915))

(declare-fun m!1283917 () Bool)

(assert (=> b!1397205 m!1283917))

(declare-fun m!1283919 () Bool)

(assert (=> b!1397208 m!1283919))

(assert (=> b!1397208 m!1283919))

(declare-fun m!1283921 () Bool)

(assert (=> b!1397208 m!1283921))

(declare-fun m!1283923 () Bool)

(assert (=> b!1397208 m!1283923))

(declare-fun m!1283925 () Bool)

(assert (=> b!1397208 m!1283925))

(assert (=> b!1397206 m!1283899))

(assert (=> b!1397206 m!1283899))

(declare-fun m!1283927 () Bool)

(assert (=> b!1397206 m!1283927))

(declare-fun m!1283929 () Bool)

(assert (=> b!1397207 m!1283929))

(push 1)

