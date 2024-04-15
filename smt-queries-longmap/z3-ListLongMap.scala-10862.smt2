; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127298 () Bool)

(assert start!127298)

(declare-fun b!1496150 () Bool)

(declare-fun e!837968 () Bool)

(declare-fun e!837963 () Bool)

(assert (=> b!1496150 (= e!837968 e!837963)))

(declare-fun res!1017685 () Bool)

(assert (=> b!1496150 (=> (not res!1017685) (not e!837963))))

(declare-datatypes ((SeekEntryResult!12407 0))(
  ( (MissingZero!12407 (index!52020 (_ BitVec 32))) (Found!12407 (index!52021 (_ BitVec 32))) (Intermediate!12407 (undefined!13219 Bool) (index!52022 (_ BitVec 32)) (x!133644 (_ BitVec 32))) (Undefined!12407) (MissingVacant!12407 (index!52023 (_ BitVec 32))) )
))
(declare-fun lt!651826 () SeekEntryResult!12407)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496150 (= res!1017685 (= lt!651826 (Intermediate!12407 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99754 0))(
  ( (array!99755 (arr!48142 (Array (_ BitVec 32) (_ BitVec 64))) (size!48694 (_ BitVec 32))) )
))
(declare-fun lt!651829 () array!99754)

(declare-fun lt!651827 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99754 (_ BitVec 32)) SeekEntryResult!12407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496150 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651827 mask!2687) lt!651827 lt!651829 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99754)

(assert (=> b!1496150 (= lt!651827 (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496151 () Bool)

(declare-fun e!837969 () Bool)

(declare-fun e!837970 () Bool)

(assert (=> b!1496151 (= e!837969 e!837970)))

(declare-fun res!1017680 () Bool)

(assert (=> b!1496151 (=> res!1017680 e!837970)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!651830 () (_ BitVec 32))

(assert (=> b!1496151 (= res!1017680 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651830 #b00000000000000000000000000000000) (bvsge lt!651830 (size!48694 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496151 (= lt!651830 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496152 () Bool)

(declare-fun e!837964 () Bool)

(assert (=> b!1496152 (= e!837964 e!837968)))

(declare-fun res!1017686 () Bool)

(assert (=> b!1496152 (=> (not res!1017686) (not e!837968))))

(declare-fun lt!651828 () SeekEntryResult!12407)

(assert (=> b!1496152 (= res!1017686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48142 a!2862) j!93) mask!2687) (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!651828))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496152 (= lt!651828 (Intermediate!12407 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496153 () Bool)

(declare-fun res!1017678 () Bool)

(declare-fun e!837971 () Bool)

(assert (=> b!1496153 (=> (not res!1017678) (not e!837971))))

(assert (=> b!1496153 (= res!1017678 (and (= (size!48694 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48694 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48694 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496154 () Bool)

(declare-fun res!1017681 () Bool)

(assert (=> b!1496154 (=> (not res!1017681) (not e!837971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99754 (_ BitVec 32)) Bool)

(assert (=> b!1496154 (= res!1017681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496155 () Bool)

(declare-fun res!1017693 () Bool)

(declare-fun e!837962 () Bool)

(assert (=> b!1496155 (=> (not res!1017693) (not e!837962))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99754 (_ BitVec 32)) SeekEntryResult!12407)

(assert (=> b!1496155 (= res!1017693 (= (seekEntryOrOpen!0 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) (Found!12407 j!93)))))

(declare-fun b!1496156 () Bool)

(declare-fun e!837966 () Bool)

(assert (=> b!1496156 (= e!837966 (not (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651830 lt!651827 lt!651829 mask!2687))))))

(declare-fun b!1496157 () Bool)

(assert (=> b!1496157 (= e!837963 (not e!837969))))

(declare-fun res!1017694 () Bool)

(assert (=> b!1496157 (=> res!1017694 e!837969)))

(assert (=> b!1496157 (= res!1017694 (or (and (= (select (arr!48142 a!2862) index!646) (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48142 a!2862) index!646) (select (arr!48142 a!2862) j!93))) (= (select (arr!48142 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496157 e!837962))

(declare-fun res!1017679 () Bool)

(assert (=> b!1496157 (=> (not res!1017679) (not e!837962))))

(assert (=> b!1496157 (= res!1017679 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49995 0))(
  ( (Unit!49996) )
))
(declare-fun lt!651825 () Unit!49995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49995)

(assert (=> b!1496157 (= lt!651825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496158 () Bool)

(declare-fun res!1017683 () Bool)

(assert (=> b!1496158 (=> res!1017683 e!837970)))

(assert (=> b!1496158 (= res!1017683 e!837966)))

(declare-fun c!138775 () Bool)

(assert (=> b!1496158 (= c!138775 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496159 () Bool)

(declare-fun e!837967 () Bool)

(assert (=> b!1496159 (= e!837967 (= lt!651826 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651827 lt!651829 mask!2687)))))

(declare-fun b!1496161 () Bool)

(declare-fun res!1017677 () Bool)

(assert (=> b!1496161 (=> (not res!1017677) (not e!837968))))

(assert (=> b!1496161 (= res!1017677 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!651828))))

(declare-fun b!1496162 () Bool)

(declare-fun res!1017687 () Bool)

(assert (=> b!1496162 (=> (not res!1017687) (not e!837971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496162 (= res!1017687 (validKeyInArray!0 (select (arr!48142 a!2862) i!1006)))))

(declare-fun b!1496163 () Bool)

(assert (=> b!1496163 (= e!837971 e!837964)))

(declare-fun res!1017682 () Bool)

(assert (=> b!1496163 (=> (not res!1017682) (not e!837964))))

(assert (=> b!1496163 (= res!1017682 (= (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496163 (= lt!651829 (array!99755 (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48694 a!2862)))))

(declare-fun b!1496164 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99754 (_ BitVec 32)) SeekEntryResult!12407)

(assert (=> b!1496164 (= e!837967 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651827 lt!651829 mask!2687) (seekEntryOrOpen!0 lt!651827 lt!651829 mask!2687)))))

(declare-fun b!1496165 () Bool)

(assert (=> b!1496165 (= e!837962 (or (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) (select (arr!48142 a!2862) j!93))))))

(declare-fun b!1496166 () Bool)

(assert (=> b!1496166 (= e!837970 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun res!1017688 () Bool)

(assert (=> start!127298 (=> (not res!1017688) (not e!837971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127298 (= res!1017688 (validMask!0 mask!2687))))

(assert (=> start!127298 e!837971))

(assert (=> start!127298 true))

(declare-fun array_inv!37375 (array!99754) Bool)

(assert (=> start!127298 (array_inv!37375 a!2862)))

(declare-fun b!1496160 () Bool)

(declare-fun res!1017684 () Bool)

(assert (=> b!1496160 (=> (not res!1017684) (not e!837971))))

(assert (=> b!1496160 (= res!1017684 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48694 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48694 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48694 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496167 () Bool)

(declare-fun res!1017676 () Bool)

(assert (=> b!1496167 (=> (not res!1017676) (not e!837963))))

(assert (=> b!1496167 (= res!1017676 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496168 () Bool)

(assert (=> b!1496168 (= e!837966 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651830 intermediateAfterIndex!19 lt!651827 lt!651829 mask!2687) (seekEntryOrOpen!0 lt!651827 lt!651829 mask!2687))))))

(declare-fun b!1496169 () Bool)

(declare-fun res!1017690 () Bool)

(assert (=> b!1496169 (=> (not res!1017690) (not e!837963))))

(assert (=> b!1496169 (= res!1017690 e!837967)))

(declare-fun c!138774 () Bool)

(assert (=> b!1496169 (= c!138774 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496170 () Bool)

(declare-fun res!1017692 () Bool)

(assert (=> b!1496170 (=> res!1017692 e!837970)))

(assert (=> b!1496170 (= res!1017692 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651830 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!651828)))))

(declare-fun b!1496171 () Bool)

(declare-fun res!1017691 () Bool)

(assert (=> b!1496171 (=> (not res!1017691) (not e!837971))))

(assert (=> b!1496171 (= res!1017691 (validKeyInArray!0 (select (arr!48142 a!2862) j!93)))))

(declare-fun b!1496172 () Bool)

(declare-fun res!1017689 () Bool)

(assert (=> b!1496172 (=> (not res!1017689) (not e!837971))))

(declare-datatypes ((List!34721 0))(
  ( (Nil!34718) (Cons!34717 (h!36115 (_ BitVec 64)) (t!49407 List!34721)) )
))
(declare-fun arrayNoDuplicates!0 (array!99754 (_ BitVec 32) List!34721) Bool)

(assert (=> b!1496172 (= res!1017689 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34718))))

(assert (= (and start!127298 res!1017688) b!1496153))

(assert (= (and b!1496153 res!1017678) b!1496162))

(assert (= (and b!1496162 res!1017687) b!1496171))

(assert (= (and b!1496171 res!1017691) b!1496154))

(assert (= (and b!1496154 res!1017681) b!1496172))

(assert (= (and b!1496172 res!1017689) b!1496160))

(assert (= (and b!1496160 res!1017684) b!1496163))

(assert (= (and b!1496163 res!1017682) b!1496152))

(assert (= (and b!1496152 res!1017686) b!1496161))

(assert (= (and b!1496161 res!1017677) b!1496150))

(assert (= (and b!1496150 res!1017685) b!1496169))

(assert (= (and b!1496169 c!138774) b!1496159))

(assert (= (and b!1496169 (not c!138774)) b!1496164))

(assert (= (and b!1496169 res!1017690) b!1496167))

(assert (= (and b!1496167 res!1017676) b!1496157))

(assert (= (and b!1496157 res!1017679) b!1496155))

(assert (= (and b!1496155 res!1017693) b!1496165))

(assert (= (and b!1496157 (not res!1017694)) b!1496151))

(assert (= (and b!1496151 (not res!1017680)) b!1496170))

(assert (= (and b!1496170 (not res!1017692)) b!1496158))

(assert (= (and b!1496158 c!138775) b!1496156))

(assert (= (and b!1496158 (not c!138775)) b!1496168))

(assert (= (and b!1496158 (not res!1017683)) b!1496166))

(declare-fun m!1378791 () Bool)

(assert (=> b!1496154 m!1378791))

(declare-fun m!1378793 () Bool)

(assert (=> b!1496168 m!1378793))

(declare-fun m!1378795 () Bool)

(assert (=> b!1496168 m!1378795))

(declare-fun m!1378797 () Bool)

(assert (=> b!1496150 m!1378797))

(assert (=> b!1496150 m!1378797))

(declare-fun m!1378799 () Bool)

(assert (=> b!1496150 m!1378799))

(declare-fun m!1378801 () Bool)

(assert (=> b!1496150 m!1378801))

(declare-fun m!1378803 () Bool)

(assert (=> b!1496150 m!1378803))

(declare-fun m!1378805 () Bool)

(assert (=> b!1496164 m!1378805))

(assert (=> b!1496164 m!1378795))

(declare-fun m!1378807 () Bool)

(assert (=> b!1496162 m!1378807))

(assert (=> b!1496162 m!1378807))

(declare-fun m!1378809 () Bool)

(assert (=> b!1496162 m!1378809))

(declare-fun m!1378811 () Bool)

(assert (=> b!1496161 m!1378811))

(assert (=> b!1496161 m!1378811))

(declare-fun m!1378813 () Bool)

(assert (=> b!1496161 m!1378813))

(declare-fun m!1378815 () Bool)

(assert (=> b!1496156 m!1378815))

(assert (=> b!1496171 m!1378811))

(assert (=> b!1496171 m!1378811))

(declare-fun m!1378817 () Bool)

(assert (=> b!1496171 m!1378817))

(declare-fun m!1378819 () Bool)

(assert (=> b!1496151 m!1378819))

(assert (=> b!1496152 m!1378811))

(assert (=> b!1496152 m!1378811))

(declare-fun m!1378821 () Bool)

(assert (=> b!1496152 m!1378821))

(assert (=> b!1496152 m!1378821))

(assert (=> b!1496152 m!1378811))

(declare-fun m!1378823 () Bool)

(assert (=> b!1496152 m!1378823))

(declare-fun m!1378825 () Bool)

(assert (=> b!1496157 m!1378825))

(assert (=> b!1496157 m!1378801))

(declare-fun m!1378827 () Bool)

(assert (=> b!1496157 m!1378827))

(declare-fun m!1378829 () Bool)

(assert (=> b!1496157 m!1378829))

(declare-fun m!1378831 () Bool)

(assert (=> b!1496157 m!1378831))

(assert (=> b!1496157 m!1378811))

(assert (=> b!1496170 m!1378811))

(assert (=> b!1496170 m!1378811))

(declare-fun m!1378833 () Bool)

(assert (=> b!1496170 m!1378833))

(assert (=> b!1496163 m!1378801))

(declare-fun m!1378835 () Bool)

(assert (=> b!1496163 m!1378835))

(assert (=> b!1496155 m!1378811))

(assert (=> b!1496155 m!1378811))

(declare-fun m!1378837 () Bool)

(assert (=> b!1496155 m!1378837))

(declare-fun m!1378839 () Bool)

(assert (=> start!127298 m!1378839))

(declare-fun m!1378841 () Bool)

(assert (=> start!127298 m!1378841))

(declare-fun m!1378843 () Bool)

(assert (=> b!1496172 m!1378843))

(declare-fun m!1378845 () Bool)

(assert (=> b!1496165 m!1378845))

(assert (=> b!1496165 m!1378811))

(declare-fun m!1378847 () Bool)

(assert (=> b!1496159 m!1378847))

(check-sat (not b!1496156) (not b!1496168) (not b!1496171) (not b!1496161) (not b!1496159) (not b!1496155) (not b!1496157) (not b!1496172) (not b!1496151) (not b!1496170) (not b!1496154) (not b!1496162) (not b!1496152) (not b!1496150) (not b!1496164) (not start!127298))
(check-sat)
