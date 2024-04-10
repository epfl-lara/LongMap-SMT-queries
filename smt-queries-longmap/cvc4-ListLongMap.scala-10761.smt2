; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125888 () Bool)

(assert start!125888)

(declare-fun b!1473673 () Bool)

(declare-fun res!1000964 () Bool)

(declare-fun e!826945 () Bool)

(assert (=> b!1473673 (=> (not res!1000964) (not e!826945))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99165 0))(
  ( (array!99166 (arr!47866 (Array (_ BitVec 32) (_ BitVec 64))) (size!48416 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99165)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12106 0))(
  ( (MissingZero!12106 (index!50816 (_ BitVec 32))) (Found!12106 (index!50817 (_ BitVec 32))) (Intermediate!12106 (undefined!12918 Bool) (index!50818 (_ BitVec 32)) (x!132398 (_ BitVec 32))) (Undefined!12106) (MissingVacant!12106 (index!50819 (_ BitVec 32))) )
))
(declare-fun lt!644009 () SeekEntryResult!12106)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99165 (_ BitVec 32)) SeekEntryResult!12106)

(assert (=> b!1473673 (= res!1000964 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644009))))

(declare-fun b!1473674 () Bool)

(declare-fun res!1000973 () Bool)

(declare-fun e!826942 () Bool)

(assert (=> b!1473674 (=> (not res!1000973) (not e!826942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473674 (= res!1000973 (validKeyInArray!0 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1473675 () Bool)

(declare-fun res!1000965 () Bool)

(declare-fun e!826943 () Bool)

(assert (=> b!1473675 (=> (not res!1000965) (not e!826943))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99165 (_ BitVec 32)) SeekEntryResult!12106)

(assert (=> b!1473675 (= res!1000965 (= (seekEntryOrOpen!0 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) (Found!12106 j!93)))))

(declare-fun b!1473676 () Bool)

(declare-fun e!826940 () Bool)

(assert (=> b!1473676 (= e!826940 e!826945)))

(declare-fun res!1000977 () Bool)

(assert (=> b!1473676 (=> (not res!1000977) (not e!826945))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473676 (= res!1000977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644009))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473676 (= lt!644009 (Intermediate!12106 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473677 () Bool)

(declare-fun res!1000968 () Bool)

(assert (=> b!1473677 (=> (not res!1000968) (not e!826942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99165 (_ BitVec 32)) Bool)

(assert (=> b!1473677 (= res!1000968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473678 () Bool)

(declare-fun e!826939 () Bool)

(assert (=> b!1473678 (= e!826939 true)))

(declare-fun lt!644008 () (_ BitVec 64))

(declare-fun lt!644005 () array!99165)

(declare-fun lt!644010 () SeekEntryResult!12106)

(assert (=> b!1473678 (= lt!644010 (seekEntryOrOpen!0 lt!644008 lt!644005 mask!2687))))

(declare-fun b!1473679 () Bool)

(declare-fun e!826941 () Bool)

(declare-fun lt!644006 () SeekEntryResult!12106)

(assert (=> b!1473679 (= e!826941 (= lt!644006 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644008 lt!644005 mask!2687)))))

(declare-fun b!1473680 () Bool)

(assert (=> b!1473680 (= e!826943 (or (= (select (arr!47866 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47866 a!2862) intermediateBeforeIndex!19) (select (arr!47866 a!2862) j!93))))))

(declare-fun b!1473681 () Bool)

(declare-fun e!826946 () Bool)

(assert (=> b!1473681 (= e!826946 (not e!826939))))

(declare-fun res!1000974 () Bool)

(assert (=> b!1473681 (=> res!1000974 e!826939)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473681 (= res!1000974 (or (not (= (select (arr!47866 a!2862) index!646) (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47866 a!2862) index!646) (select (arr!47866 a!2862) j!93)))))))

(assert (=> b!1473681 e!826943))

(declare-fun res!1000967 () Bool)

(assert (=> b!1473681 (=> (not res!1000967) (not e!826943))))

(assert (=> b!1473681 (= res!1000967 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49552 0))(
  ( (Unit!49553) )
))
(declare-fun lt!644007 () Unit!49552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49552)

(assert (=> b!1473681 (= lt!644007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473682 () Bool)

(declare-fun res!1000963 () Bool)

(assert (=> b!1473682 (=> (not res!1000963) (not e!826942))))

(declare-datatypes ((List!34367 0))(
  ( (Nil!34364) (Cons!34363 (h!35722 (_ BitVec 64)) (t!49061 List!34367)) )
))
(declare-fun arrayNoDuplicates!0 (array!99165 (_ BitVec 32) List!34367) Bool)

(assert (=> b!1473682 (= res!1000963 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34364))))

(declare-fun b!1473684 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99165 (_ BitVec 32)) SeekEntryResult!12106)

(assert (=> b!1473684 (= e!826941 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644008 lt!644005 mask!2687) (seekEntryOrOpen!0 lt!644008 lt!644005 mask!2687)))))

(declare-fun b!1473685 () Bool)

(declare-fun res!1000966 () Bool)

(assert (=> b!1473685 (=> (not res!1000966) (not e!826946))))

(assert (=> b!1473685 (= res!1000966 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473686 () Bool)

(assert (=> b!1473686 (= e!826942 e!826940)))

(declare-fun res!1000975 () Bool)

(assert (=> b!1473686 (=> (not res!1000975) (not e!826940))))

(assert (=> b!1473686 (= res!1000975 (= (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473686 (= lt!644005 (array!99166 (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48416 a!2862)))))

(declare-fun b!1473687 () Bool)

(declare-fun res!1000972 () Bool)

(assert (=> b!1473687 (=> (not res!1000972) (not e!826942))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473687 (= res!1000972 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48416 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48416 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48416 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473688 () Bool)

(assert (=> b!1473688 (= e!826945 e!826946)))

(declare-fun res!1000971 () Bool)

(assert (=> b!1473688 (=> (not res!1000971) (not e!826946))))

(assert (=> b!1473688 (= res!1000971 (= lt!644006 (Intermediate!12106 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473688 (= lt!644006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644008 mask!2687) lt!644008 lt!644005 mask!2687))))

(assert (=> b!1473688 (= lt!644008 (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473689 () Bool)

(declare-fun res!1000978 () Bool)

(assert (=> b!1473689 (=> (not res!1000978) (not e!826942))))

(assert (=> b!1473689 (= res!1000978 (and (= (size!48416 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48416 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48416 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473690 () Bool)

(declare-fun res!1000969 () Bool)

(assert (=> b!1473690 (=> (not res!1000969) (not e!826942))))

(assert (=> b!1473690 (= res!1000969 (validKeyInArray!0 (select (arr!47866 a!2862) i!1006)))))

(declare-fun b!1473683 () Bool)

(declare-fun res!1000976 () Bool)

(assert (=> b!1473683 (=> (not res!1000976) (not e!826946))))

(assert (=> b!1473683 (= res!1000976 e!826941)))

(declare-fun c!135870 () Bool)

(assert (=> b!1473683 (= c!135870 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1000970 () Bool)

(assert (=> start!125888 (=> (not res!1000970) (not e!826942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125888 (= res!1000970 (validMask!0 mask!2687))))

(assert (=> start!125888 e!826942))

(assert (=> start!125888 true))

(declare-fun array_inv!36894 (array!99165) Bool)

(assert (=> start!125888 (array_inv!36894 a!2862)))

(assert (= (and start!125888 res!1000970) b!1473689))

(assert (= (and b!1473689 res!1000978) b!1473690))

(assert (= (and b!1473690 res!1000969) b!1473674))

(assert (= (and b!1473674 res!1000973) b!1473677))

(assert (= (and b!1473677 res!1000968) b!1473682))

(assert (= (and b!1473682 res!1000963) b!1473687))

(assert (= (and b!1473687 res!1000972) b!1473686))

(assert (= (and b!1473686 res!1000975) b!1473676))

(assert (= (and b!1473676 res!1000977) b!1473673))

(assert (= (and b!1473673 res!1000964) b!1473688))

(assert (= (and b!1473688 res!1000971) b!1473683))

(assert (= (and b!1473683 c!135870) b!1473679))

(assert (= (and b!1473683 (not c!135870)) b!1473684))

(assert (= (and b!1473683 res!1000976) b!1473685))

(assert (= (and b!1473685 res!1000966) b!1473681))

(assert (= (and b!1473681 res!1000967) b!1473675))

(assert (= (and b!1473675 res!1000965) b!1473680))

(assert (= (and b!1473681 (not res!1000974)) b!1473678))

(declare-fun m!1360181 () Bool)

(assert (=> b!1473688 m!1360181))

(assert (=> b!1473688 m!1360181))

(declare-fun m!1360183 () Bool)

(assert (=> b!1473688 m!1360183))

(declare-fun m!1360185 () Bool)

(assert (=> b!1473688 m!1360185))

(declare-fun m!1360187 () Bool)

(assert (=> b!1473688 m!1360187))

(declare-fun m!1360189 () Bool)

(assert (=> b!1473677 m!1360189))

(declare-fun m!1360191 () Bool)

(assert (=> b!1473684 m!1360191))

(declare-fun m!1360193 () Bool)

(assert (=> b!1473684 m!1360193))

(declare-fun m!1360195 () Bool)

(assert (=> b!1473690 m!1360195))

(assert (=> b!1473690 m!1360195))

(declare-fun m!1360197 () Bool)

(assert (=> b!1473690 m!1360197))

(declare-fun m!1360199 () Bool)

(assert (=> b!1473682 m!1360199))

(declare-fun m!1360201 () Bool)

(assert (=> b!1473681 m!1360201))

(assert (=> b!1473681 m!1360185))

(declare-fun m!1360203 () Bool)

(assert (=> b!1473681 m!1360203))

(declare-fun m!1360205 () Bool)

(assert (=> b!1473681 m!1360205))

(declare-fun m!1360207 () Bool)

(assert (=> b!1473681 m!1360207))

(declare-fun m!1360209 () Bool)

(assert (=> b!1473681 m!1360209))

(assert (=> b!1473686 m!1360185))

(declare-fun m!1360211 () Bool)

(assert (=> b!1473686 m!1360211))

(assert (=> b!1473673 m!1360209))

(assert (=> b!1473673 m!1360209))

(declare-fun m!1360213 () Bool)

(assert (=> b!1473673 m!1360213))

(declare-fun m!1360215 () Bool)

(assert (=> b!1473680 m!1360215))

(assert (=> b!1473680 m!1360209))

(assert (=> b!1473676 m!1360209))

(assert (=> b!1473676 m!1360209))

(declare-fun m!1360217 () Bool)

(assert (=> b!1473676 m!1360217))

(assert (=> b!1473676 m!1360217))

(assert (=> b!1473676 m!1360209))

(declare-fun m!1360219 () Bool)

(assert (=> b!1473676 m!1360219))

(declare-fun m!1360221 () Bool)

(assert (=> start!125888 m!1360221))

(declare-fun m!1360223 () Bool)

(assert (=> start!125888 m!1360223))

(assert (=> b!1473674 m!1360209))

(assert (=> b!1473674 m!1360209))

(declare-fun m!1360225 () Bool)

(assert (=> b!1473674 m!1360225))

(assert (=> b!1473678 m!1360193))

(assert (=> b!1473675 m!1360209))

(assert (=> b!1473675 m!1360209))

(declare-fun m!1360227 () Bool)

(assert (=> b!1473675 m!1360227))

(declare-fun m!1360229 () Bool)

(assert (=> b!1473679 m!1360229))

(push 1)

