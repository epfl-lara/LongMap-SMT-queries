; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126648 () Bool)

(assert start!126648)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1482969 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!831869 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99505 0))(
  ( (array!99506 (arr!48025 (Array (_ BitVec 32) (_ BitVec 64))) (size!48576 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99505)

(assert (=> b!1482969 (= e!831869 (and (or (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) (select (arr!48025 a!2862) j!93))) (or (and (= (select (arr!48025 a!2862) index!646) (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48025 a!2862) index!646) (select (arr!48025 a!2862) j!93))) (= (select (arr!48025 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1482970 () Bool)

(declare-fun e!831870 () Bool)

(declare-fun e!831867 () Bool)

(assert (=> b!1482970 (= e!831870 e!831867)))

(declare-fun res!1007219 () Bool)

(assert (=> b!1482970 (=> (not res!1007219) (not e!831867))))

(assert (=> b!1482970 (= res!1007219 (= (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647361 () array!99505)

(assert (=> b!1482970 (= lt!647361 (array!99506 (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48576 a!2862)))))

(declare-fun b!1482971 () Bool)

(declare-fun res!1007230 () Bool)

(declare-fun e!831866 () Bool)

(assert (=> b!1482971 (=> (not res!1007230) (not e!831866))))

(declare-fun e!831868 () Bool)

(assert (=> b!1482971 (= res!1007230 e!831868)))

(declare-fun c!137407 () Bool)

(assert (=> b!1482971 (= c!137407 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482972 () Bool)

(declare-fun res!1007218 () Bool)

(assert (=> b!1482972 (=> (not res!1007218) (not e!831870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482972 (= res!1007218 (validKeyInArray!0 (select (arr!48025 a!2862) i!1006)))))

(declare-fun b!1482973 () Bool)

(declare-fun res!1007217 () Bool)

(assert (=> b!1482973 (=> (not res!1007217) (not e!831870))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99505 (_ BitVec 32)) Bool)

(assert (=> b!1482973 (= res!1007217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1007223 () Bool)

(assert (=> start!126648 (=> (not res!1007223) (not e!831870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126648 (= res!1007223 (validMask!0 mask!2687))))

(assert (=> start!126648 e!831870))

(assert (=> start!126648 true))

(declare-fun array_inv!37306 (array!99505) Bool)

(assert (=> start!126648 (array_inv!37306 a!2862)))

(declare-fun b!1482974 () Bool)

(declare-fun res!1007225 () Bool)

(assert (=> b!1482974 (=> (not res!1007225) (not e!831870))))

(declare-datatypes ((List!34513 0))(
  ( (Nil!34510) (Cons!34509 (h!35894 (_ BitVec 64)) (t!49199 List!34513)) )
))
(declare-fun arrayNoDuplicates!0 (array!99505 (_ BitVec 32) List!34513) Bool)

(assert (=> b!1482974 (= res!1007225 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34510))))

(declare-fun b!1482975 () Bool)

(declare-fun res!1007228 () Bool)

(assert (=> b!1482975 (=> (not res!1007228) (not e!831870))))

(assert (=> b!1482975 (= res!1007228 (and (= (size!48576 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48576 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48576 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482976 () Bool)

(declare-fun res!1007226 () Bool)

(assert (=> b!1482976 (=> (not res!1007226) (not e!831870))))

(assert (=> b!1482976 (= res!1007226 (validKeyInArray!0 (select (arr!48025 a!2862) j!93)))))

(declare-fun b!1482977 () Bool)

(declare-fun e!831865 () Bool)

(assert (=> b!1482977 (= e!831867 e!831865)))

(declare-fun res!1007222 () Bool)

(assert (=> b!1482977 (=> (not res!1007222) (not e!831865))))

(declare-datatypes ((SeekEntryResult!12162 0))(
  ( (MissingZero!12162 (index!51040 (_ BitVec 32))) (Found!12162 (index!51041 (_ BitVec 32))) (Intermediate!12162 (undefined!12974 Bool) (index!51042 (_ BitVec 32)) (x!132814 (_ BitVec 32))) (Undefined!12162) (MissingVacant!12162 (index!51043 (_ BitVec 32))) )
))
(declare-fun lt!647362 () SeekEntryResult!12162)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482977 (= res!1007222 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48025 a!2862) j!93) mask!2687) (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!647362))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482977 (= lt!647362 (Intermediate!12162 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482978 () Bool)

(declare-fun res!1007224 () Bool)

(assert (=> b!1482978 (=> (not res!1007224) (not e!831869))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12162)

(assert (=> b!1482978 (= res!1007224 (= (seekEntryOrOpen!0 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) (Found!12162 j!93)))))

(declare-fun b!1482979 () Bool)

(declare-fun lt!647363 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99505 (_ BitVec 32)) SeekEntryResult!12162)

(assert (=> b!1482979 (= e!831868 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647363 lt!647361 mask!2687) (seekEntryOrOpen!0 lt!647363 lt!647361 mask!2687)))))

(declare-fun b!1482980 () Bool)

(assert (=> b!1482980 (= e!831865 e!831866)))

(declare-fun res!1007229 () Bool)

(assert (=> b!1482980 (=> (not res!1007229) (not e!831866))))

(declare-fun lt!647365 () SeekEntryResult!12162)

(assert (=> b!1482980 (= res!1007229 (= lt!647365 (Intermediate!12162 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482980 (= lt!647365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647363 mask!2687) lt!647363 lt!647361 mask!2687))))

(assert (=> b!1482980 (= lt!647363 (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482981 () Bool)

(declare-fun res!1007227 () Bool)

(assert (=> b!1482981 (=> (not res!1007227) (not e!831870))))

(assert (=> b!1482981 (= res!1007227 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48576 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48576 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48576 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482982 () Bool)

(assert (=> b!1482982 (= e!831868 (= lt!647365 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647363 lt!647361 mask!2687)))))

(declare-fun b!1482983 () Bool)

(assert (=> b!1482983 (= e!831866 (not true))))

(assert (=> b!1482983 e!831869))

(declare-fun res!1007221 () Bool)

(assert (=> b!1482983 (=> (not res!1007221) (not e!831869))))

(assert (=> b!1482983 (= res!1007221 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49697 0))(
  ( (Unit!49698) )
))
(declare-fun lt!647364 () Unit!49697)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49697)

(assert (=> b!1482983 (= lt!647364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482984 () Bool)

(declare-fun res!1007220 () Bool)

(assert (=> b!1482984 (=> (not res!1007220) (not e!831865))))

(assert (=> b!1482984 (= res!1007220 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!647362))))

(declare-fun b!1482985 () Bool)

(declare-fun res!1007231 () Bool)

(assert (=> b!1482985 (=> (not res!1007231) (not e!831866))))

(assert (=> b!1482985 (= res!1007231 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126648 res!1007223) b!1482975))

(assert (= (and b!1482975 res!1007228) b!1482972))

(assert (= (and b!1482972 res!1007218) b!1482976))

(assert (= (and b!1482976 res!1007226) b!1482973))

(assert (= (and b!1482973 res!1007217) b!1482974))

(assert (= (and b!1482974 res!1007225) b!1482981))

(assert (= (and b!1482981 res!1007227) b!1482970))

(assert (= (and b!1482970 res!1007219) b!1482977))

(assert (= (and b!1482977 res!1007222) b!1482984))

(assert (= (and b!1482984 res!1007220) b!1482980))

(assert (= (and b!1482980 res!1007229) b!1482971))

(assert (= (and b!1482971 c!137407) b!1482982))

(assert (= (and b!1482971 (not c!137407)) b!1482979))

(assert (= (and b!1482971 res!1007230) b!1482985))

(assert (= (and b!1482985 res!1007231) b!1482983))

(assert (= (and b!1482983 res!1007221) b!1482978))

(assert (= (and b!1482978 res!1007224) b!1482969))

(declare-fun m!1368691 () Bool)

(assert (=> start!126648 m!1368691))

(declare-fun m!1368693 () Bool)

(assert (=> start!126648 m!1368693))

(declare-fun m!1368695 () Bool)

(assert (=> b!1482974 m!1368695))

(declare-fun m!1368697 () Bool)

(assert (=> b!1482982 m!1368697))

(declare-fun m!1368699 () Bool)

(assert (=> b!1482978 m!1368699))

(assert (=> b!1482978 m!1368699))

(declare-fun m!1368701 () Bool)

(assert (=> b!1482978 m!1368701))

(declare-fun m!1368703 () Bool)

(assert (=> b!1482980 m!1368703))

(assert (=> b!1482980 m!1368703))

(declare-fun m!1368705 () Bool)

(assert (=> b!1482980 m!1368705))

(declare-fun m!1368707 () Bool)

(assert (=> b!1482980 m!1368707))

(declare-fun m!1368709 () Bool)

(assert (=> b!1482980 m!1368709))

(assert (=> b!1482977 m!1368699))

(assert (=> b!1482977 m!1368699))

(declare-fun m!1368711 () Bool)

(assert (=> b!1482977 m!1368711))

(assert (=> b!1482977 m!1368711))

(assert (=> b!1482977 m!1368699))

(declare-fun m!1368713 () Bool)

(assert (=> b!1482977 m!1368713))

(declare-fun m!1368715 () Bool)

(assert (=> b!1482973 m!1368715))

(assert (=> b!1482970 m!1368707))

(declare-fun m!1368717 () Bool)

(assert (=> b!1482970 m!1368717))

(declare-fun m!1368719 () Bool)

(assert (=> b!1482972 m!1368719))

(assert (=> b!1482972 m!1368719))

(declare-fun m!1368721 () Bool)

(assert (=> b!1482972 m!1368721))

(assert (=> b!1482976 m!1368699))

(assert (=> b!1482976 m!1368699))

(declare-fun m!1368723 () Bool)

(assert (=> b!1482976 m!1368723))

(assert (=> b!1482969 m!1368707))

(declare-fun m!1368725 () Bool)

(assert (=> b!1482969 m!1368725))

(declare-fun m!1368727 () Bool)

(assert (=> b!1482969 m!1368727))

(declare-fun m!1368729 () Bool)

(assert (=> b!1482969 m!1368729))

(assert (=> b!1482969 m!1368699))

(assert (=> b!1482984 m!1368699))

(assert (=> b!1482984 m!1368699))

(declare-fun m!1368731 () Bool)

(assert (=> b!1482984 m!1368731))

(declare-fun m!1368733 () Bool)

(assert (=> b!1482983 m!1368733))

(declare-fun m!1368735 () Bool)

(assert (=> b!1482983 m!1368735))

(declare-fun m!1368737 () Bool)

(assert (=> b!1482979 m!1368737))

(declare-fun m!1368739 () Bool)

(assert (=> b!1482979 m!1368739))

(check-sat (not b!1482977) (not b!1482984) (not start!126648) (not b!1482979) (not b!1482983) (not b!1482972) (not b!1482974) (not b!1482976) (not b!1482973) (not b!1482982) (not b!1482980) (not b!1482978))
(check-sat)
