; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125384 () Bool)

(assert start!125384)

(declare-fun b!1466145 () Bool)

(declare-fun res!994919 () Bool)

(declare-fun e!823737 () Bool)

(assert (=> b!1466145 (=> res!994919 e!823737)))

(declare-fun e!823742 () Bool)

(assert (=> b!1466145 (= res!994919 e!823742)))

(declare-fun c!135131 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466145 (= c!135131 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466146 () Bool)

(declare-fun res!994909 () Bool)

(assert (=> b!1466146 (=> res!994909 e!823737)))

(declare-fun lt!641649 () (_ BitVec 32))

(declare-datatypes ((array!98832 0))(
  ( (array!98833 (arr!47704 (Array (_ BitVec 32) (_ BitVec 64))) (size!48254 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98832)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11956 0))(
  ( (MissingZero!11956 (index!50216 (_ BitVec 32))) (Found!11956 (index!50217 (_ BitVec 32))) (Intermediate!11956 (undefined!12768 Bool) (index!50218 (_ BitVec 32)) (x!131789 (_ BitVec 32))) (Undefined!11956) (MissingVacant!11956 (index!50219 (_ BitVec 32))) )
))
(declare-fun lt!641646 () SeekEntryResult!11956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98832 (_ BitVec 32)) SeekEntryResult!11956)

(assert (=> b!1466146 (= res!994909 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641649 (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641646)))))

(declare-fun res!994916 () Bool)

(declare-fun e!823734 () Bool)

(assert (=> start!125384 (=> (not res!994916) (not e!823734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125384 (= res!994916 (validMask!0 mask!2687))))

(assert (=> start!125384 e!823734))

(assert (=> start!125384 true))

(declare-fun array_inv!36732 (array!98832) Bool)

(assert (=> start!125384 (array_inv!36732 a!2862)))

(declare-fun e!823736 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!641648 () array!98832)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1466147 () Bool)

(declare-fun lt!641650 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98832 (_ BitVec 32)) SeekEntryResult!11956)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98832 (_ BitVec 32)) SeekEntryResult!11956)

(assert (=> b!1466147 (= e!823736 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641650 lt!641648 mask!2687) (seekEntryOrOpen!0 lt!641650 lt!641648 mask!2687)))))

(declare-fun b!1466148 () Bool)

(declare-fun res!994920 () Bool)

(declare-fun e!823739 () Bool)

(assert (=> b!1466148 (=> (not res!994920) (not e!823739))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466148 (= res!994920 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466149 () Bool)

(declare-fun res!994908 () Bool)

(assert (=> b!1466149 (=> (not res!994908) (not e!823734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466149 (= res!994908 (validKeyInArray!0 (select (arr!47704 a!2862) j!93)))))

(declare-fun b!1466150 () Bool)

(declare-fun e!823735 () Bool)

(assert (=> b!1466150 (= e!823739 (not e!823735))))

(declare-fun res!994906 () Bool)

(assert (=> b!1466150 (=> res!994906 e!823735)))

(assert (=> b!1466150 (= res!994906 (or (and (= (select (arr!47704 a!2862) index!646) (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47704 a!2862) index!646) (select (arr!47704 a!2862) j!93))) (= (select (arr!47704 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641651 () SeekEntryResult!11956)

(assert (=> b!1466150 (and (= lt!641651 (Found!11956 j!93)) (or (= (select (arr!47704 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47704 a!2862) intermediateBeforeIndex!19) (select (arr!47704 a!2862) j!93))))))

(assert (=> b!1466150 (= lt!641651 (seekEntryOrOpen!0 (select (arr!47704 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98832 (_ BitVec 32)) Bool)

(assert (=> b!1466150 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49408 0))(
  ( (Unit!49409) )
))
(declare-fun lt!641645 () Unit!49408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49408)

(assert (=> b!1466150 (= lt!641645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466151 () Bool)

(declare-fun res!994904 () Bool)

(assert (=> b!1466151 (=> (not res!994904) (not e!823734))))

(assert (=> b!1466151 (= res!994904 (validKeyInArray!0 (select (arr!47704 a!2862) i!1006)))))

(declare-fun b!1466152 () Bool)

(declare-fun res!994921 () Bool)

(assert (=> b!1466152 (=> (not res!994921) (not e!823739))))

(assert (=> b!1466152 (= res!994921 e!823736)))

(declare-fun c!135132 () Bool)

(assert (=> b!1466152 (= c!135132 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466153 () Bool)

(declare-fun res!994918 () Bool)

(assert (=> b!1466153 (=> (not res!994918) (not e!823734))))

(assert (=> b!1466153 (= res!994918 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48254 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48254 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48254 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!641647 () SeekEntryResult!11956)

(declare-fun b!1466154 () Bool)

(assert (=> b!1466154 (= e!823742 (not (= lt!641647 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641649 lt!641650 lt!641648 mask!2687))))))

(declare-fun b!1466155 () Bool)

(declare-fun res!994917 () Bool)

(assert (=> b!1466155 (=> res!994917 e!823737)))

(assert (=> b!1466155 (= res!994917 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466156 () Bool)

(assert (=> b!1466156 (= e!823736 (= lt!641647 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641650 lt!641648 mask!2687)))))

(declare-fun b!1466157 () Bool)

(declare-fun e!823738 () Bool)

(assert (=> b!1466157 (= e!823738 e!823739)))

(declare-fun res!994914 () Bool)

(assert (=> b!1466157 (=> (not res!994914) (not e!823739))))

(assert (=> b!1466157 (= res!994914 (= lt!641647 (Intermediate!11956 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466157 (= lt!641647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641650 mask!2687) lt!641650 lt!641648 mask!2687))))

(assert (=> b!1466157 (= lt!641650 (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466158 () Bool)

(assert (=> b!1466158 (= e!823742 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641649 intermediateAfterIndex!19 lt!641650 lt!641648 mask!2687) (seekEntryOrOpen!0 lt!641650 lt!641648 mask!2687))))))

(declare-fun b!1466159 () Bool)

(declare-fun res!994912 () Bool)

(assert (=> b!1466159 (=> (not res!994912) (not e!823738))))

(assert (=> b!1466159 (= res!994912 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641646))))

(declare-fun b!1466160 () Bool)

(declare-fun res!994907 () Bool)

(assert (=> b!1466160 (=> (not res!994907) (not e!823734))))

(declare-datatypes ((List!34205 0))(
  ( (Nil!34202) (Cons!34201 (h!35551 (_ BitVec 64)) (t!48899 List!34205)) )
))
(declare-fun arrayNoDuplicates!0 (array!98832 (_ BitVec 32) List!34205) Bool)

(assert (=> b!1466160 (= res!994907 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34202))))

(declare-fun b!1466161 () Bool)

(declare-fun e!823740 () Bool)

(assert (=> b!1466161 (= e!823734 e!823740)))

(declare-fun res!994911 () Bool)

(assert (=> b!1466161 (=> (not res!994911) (not e!823740))))

(assert (=> b!1466161 (= res!994911 (= (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466161 (= lt!641648 (array!98833 (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48254 a!2862)))))

(declare-fun b!1466162 () Bool)

(declare-fun res!994905 () Bool)

(assert (=> b!1466162 (=> (not res!994905) (not e!823734))))

(assert (=> b!1466162 (= res!994905 (and (= (size!48254 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48254 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48254 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466163 () Bool)

(declare-fun res!994910 () Bool)

(assert (=> b!1466163 (=> (not res!994910) (not e!823734))))

(assert (=> b!1466163 (= res!994910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466164 () Bool)

(assert (=> b!1466164 (= e!823735 e!823737)))

(declare-fun res!994913 () Bool)

(assert (=> b!1466164 (=> res!994913 e!823737)))

(assert (=> b!1466164 (= res!994913 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641649 #b00000000000000000000000000000000) (bvsge lt!641649 (size!48254 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466164 (= lt!641649 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466165 () Bool)

(assert (=> b!1466165 (= e!823740 e!823738)))

(declare-fun res!994915 () Bool)

(assert (=> b!1466165 (=> (not res!994915) (not e!823738))))

(assert (=> b!1466165 (= res!994915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47704 a!2862) j!93) mask!2687) (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641646))))

(assert (=> b!1466165 (= lt!641646 (Intermediate!11956 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466166 () Bool)

(assert (=> b!1466166 (= e!823737 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1466166 (= lt!641651 (seekEntryOrOpen!0 lt!641650 lt!641648 mask!2687))))

(declare-fun lt!641652 () Unit!49408)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49408)

(assert (=> b!1466166 (= lt!641652 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641649 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(assert (= (and start!125384 res!994916) b!1466162))

(assert (= (and b!1466162 res!994905) b!1466151))

(assert (= (and b!1466151 res!994904) b!1466149))

(assert (= (and b!1466149 res!994908) b!1466163))

(assert (= (and b!1466163 res!994910) b!1466160))

(assert (= (and b!1466160 res!994907) b!1466153))

(assert (= (and b!1466153 res!994918) b!1466161))

(assert (= (and b!1466161 res!994911) b!1466165))

(assert (= (and b!1466165 res!994915) b!1466159))

(assert (= (and b!1466159 res!994912) b!1466157))

(assert (= (and b!1466157 res!994914) b!1466152))

(assert (= (and b!1466152 c!135132) b!1466156))

(assert (= (and b!1466152 (not c!135132)) b!1466147))

(assert (= (and b!1466152 res!994921) b!1466148))

(assert (= (and b!1466148 res!994920) b!1466150))

(assert (= (and b!1466150 (not res!994906)) b!1466164))

(assert (= (and b!1466164 (not res!994913)) b!1466146))

(assert (= (and b!1466146 (not res!994909)) b!1466145))

(assert (= (and b!1466145 c!135131) b!1466154))

(assert (= (and b!1466145 (not c!135131)) b!1466158))

(assert (= (and b!1466145 (not res!994919)) b!1466155))

(assert (= (and b!1466155 (not res!994917)) b!1466166))

(declare-fun m!1353163 () Bool)

(assert (=> b!1466165 m!1353163))

(assert (=> b!1466165 m!1353163))

(declare-fun m!1353165 () Bool)

(assert (=> b!1466165 m!1353165))

(assert (=> b!1466165 m!1353165))

(assert (=> b!1466165 m!1353163))

(declare-fun m!1353167 () Bool)

(assert (=> b!1466165 m!1353167))

(declare-fun m!1353169 () Bool)

(assert (=> b!1466163 m!1353169))

(declare-fun m!1353171 () Bool)

(assert (=> b!1466156 m!1353171))

(declare-fun m!1353173 () Bool)

(assert (=> b!1466164 m!1353173))

(declare-fun m!1353175 () Bool)

(assert (=> b!1466154 m!1353175))

(declare-fun m!1353177 () Bool)

(assert (=> b!1466150 m!1353177))

(declare-fun m!1353179 () Bool)

(assert (=> b!1466150 m!1353179))

(declare-fun m!1353181 () Bool)

(assert (=> b!1466150 m!1353181))

(declare-fun m!1353183 () Bool)

(assert (=> b!1466150 m!1353183))

(declare-fun m!1353185 () Bool)

(assert (=> b!1466150 m!1353185))

(assert (=> b!1466150 m!1353163))

(declare-fun m!1353187 () Bool)

(assert (=> b!1466150 m!1353187))

(declare-fun m!1353189 () Bool)

(assert (=> b!1466150 m!1353189))

(assert (=> b!1466150 m!1353163))

(declare-fun m!1353191 () Bool)

(assert (=> b!1466158 m!1353191))

(declare-fun m!1353193 () Bool)

(assert (=> b!1466158 m!1353193))

(declare-fun m!1353195 () Bool)

(assert (=> b!1466147 m!1353195))

(assert (=> b!1466147 m!1353193))

(declare-fun m!1353197 () Bool)

(assert (=> start!125384 m!1353197))

(declare-fun m!1353199 () Bool)

(assert (=> start!125384 m!1353199))

(assert (=> b!1466149 m!1353163))

(assert (=> b!1466149 m!1353163))

(declare-fun m!1353201 () Bool)

(assert (=> b!1466149 m!1353201))

(assert (=> b!1466159 m!1353163))

(assert (=> b!1466159 m!1353163))

(declare-fun m!1353203 () Bool)

(assert (=> b!1466159 m!1353203))

(declare-fun m!1353205 () Bool)

(assert (=> b!1466151 m!1353205))

(assert (=> b!1466151 m!1353205))

(declare-fun m!1353207 () Bool)

(assert (=> b!1466151 m!1353207))

(assert (=> b!1466161 m!1353179))

(declare-fun m!1353209 () Bool)

(assert (=> b!1466161 m!1353209))

(assert (=> b!1466166 m!1353193))

(declare-fun m!1353211 () Bool)

(assert (=> b!1466166 m!1353211))

(declare-fun m!1353213 () Bool)

(assert (=> b!1466157 m!1353213))

(assert (=> b!1466157 m!1353213))

(declare-fun m!1353215 () Bool)

(assert (=> b!1466157 m!1353215))

(assert (=> b!1466157 m!1353179))

(declare-fun m!1353217 () Bool)

(assert (=> b!1466157 m!1353217))

(assert (=> b!1466146 m!1353163))

(assert (=> b!1466146 m!1353163))

(declare-fun m!1353219 () Bool)

(assert (=> b!1466146 m!1353219))

(declare-fun m!1353221 () Bool)

(assert (=> b!1466160 m!1353221))

(push 1)

(assert (not start!125384))

(assert (not b!1466150))

(assert (not b!1466147))

(assert (not b!1466146))

(assert (not b!1466159))

