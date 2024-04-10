; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125238 () Bool)

(assert start!125238)

(declare-fun b!1461327 () Bool)

(declare-fun res!990970 () Bool)

(declare-fun e!821569 () Bool)

(assert (=> b!1461327 (=> (not res!990970) (not e!821569))))

(declare-datatypes ((array!98686 0))(
  ( (array!98687 (arr!47631 (Array (_ BitVec 32) (_ BitVec 64))) (size!48181 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98686)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461327 (= res!990970 (validKeyInArray!0 (select (arr!47631 a!2862) j!93)))))

(declare-fun b!1461328 () Bool)

(declare-fun res!990974 () Bool)

(declare-fun e!821562 () Bool)

(assert (=> b!1461328 (=> res!990974 e!821562)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11883 0))(
  ( (MissingZero!11883 (index!49924 (_ BitVec 32))) (Found!11883 (index!49925 (_ BitVec 32))) (Intermediate!11883 (undefined!12695 Bool) (index!49926 (_ BitVec 32)) (x!131524 (_ BitVec 32))) (Undefined!11883) (MissingVacant!11883 (index!49927 (_ BitVec 32))) )
))
(declare-fun lt!640096 () SeekEntryResult!11883)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640097 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11883)

(assert (=> b!1461328 (= res!990974 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 (select (arr!47631 a!2862) j!93) a!2862 mask!2687) lt!640096)))))

(declare-fun b!1461330 () Bool)

(declare-fun res!990968 () Bool)

(assert (=> b!1461330 (=> (not res!990968) (not e!821569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98686 (_ BitVec 32)) Bool)

(assert (=> b!1461330 (= res!990968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461331 () Bool)

(assert (=> b!1461331 (= e!821562 true)))

(declare-fun lt!640101 () Bool)

(declare-fun e!821568 () Bool)

(assert (=> b!1461331 (= lt!640101 e!821568)))

(declare-fun c!134694 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461331 (= c!134694 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461332 () Bool)

(declare-fun res!990977 () Bool)

(declare-fun e!821570 () Bool)

(assert (=> b!1461332 (=> (not res!990977) (not e!821570))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461332 (= res!990977 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!821563 () Bool)

(declare-fun lt!640095 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640100 () array!98686)

(declare-fun lt!640099 () SeekEntryResult!11883)

(declare-fun b!1461333 () Bool)

(assert (=> b!1461333 (= e!821563 (= lt!640099 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640095 lt!640100 mask!2687)))))

(declare-fun b!1461334 () Bool)

(declare-fun e!821565 () Bool)

(assert (=> b!1461334 (= e!821570 (not e!821565))))

(declare-fun res!990964 () Bool)

(assert (=> b!1461334 (=> res!990964 e!821565)))

(assert (=> b!1461334 (= res!990964 (or (and (= (select (arr!47631 a!2862) index!646) (select (store (arr!47631 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47631 a!2862) index!646) (select (arr!47631 a!2862) j!93))) (= (select (arr!47631 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821566 () Bool)

(assert (=> b!1461334 e!821566))

(declare-fun res!990967 () Bool)

(assert (=> b!1461334 (=> (not res!990967) (not e!821566))))

(assert (=> b!1461334 (= res!990967 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49262 0))(
  ( (Unit!49263) )
))
(declare-fun lt!640098 () Unit!49262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49262)

(assert (=> b!1461334 (= lt!640098 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461335 () Bool)

(declare-fun res!990978 () Bool)

(assert (=> b!1461335 (=> (not res!990978) (not e!821569))))

(assert (=> b!1461335 (= res!990978 (and (= (size!48181 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48181 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48181 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461336 () Bool)

(declare-fun e!821561 () Bool)

(assert (=> b!1461336 (= e!821569 e!821561)))

(declare-fun res!990971 () Bool)

(assert (=> b!1461336 (=> (not res!990971) (not e!821561))))

(assert (=> b!1461336 (= res!990971 (= (select (store (arr!47631 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461336 (= lt!640100 (array!98687 (store (arr!47631 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48181 a!2862)))))

(declare-fun b!1461337 () Bool)

(declare-fun res!990966 () Bool)

(assert (=> b!1461337 (=> (not res!990966) (not e!821569))))

(assert (=> b!1461337 (= res!990966 (validKeyInArray!0 (select (arr!47631 a!2862) i!1006)))))

(declare-fun b!1461338 () Bool)

(declare-fun res!990963 () Bool)

(declare-fun e!821564 () Bool)

(assert (=> b!1461338 (=> (not res!990963) (not e!821564))))

(assert (=> b!1461338 (= res!990963 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47631 a!2862) j!93) a!2862 mask!2687) lt!640096))))

(declare-fun b!1461339 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11883)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98686 (_ BitVec 32)) SeekEntryResult!11883)

(assert (=> b!1461339 (= e!821568 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 intermediateAfterIndex!19 lt!640095 lt!640100 mask!2687) (seekEntryOrOpen!0 lt!640095 lt!640100 mask!2687))))))

(declare-fun res!990962 () Bool)

(assert (=> start!125238 (=> (not res!990962) (not e!821569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125238 (= res!990962 (validMask!0 mask!2687))))

(assert (=> start!125238 e!821569))

(assert (=> start!125238 true))

(declare-fun array_inv!36659 (array!98686) Bool)

(assert (=> start!125238 (array_inv!36659 a!2862)))

(declare-fun b!1461329 () Bool)

(assert (=> b!1461329 (= e!821564 e!821570)))

(declare-fun res!990969 () Bool)

(assert (=> b!1461329 (=> (not res!990969) (not e!821570))))

(assert (=> b!1461329 (= res!990969 (= lt!640099 (Intermediate!11883 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461329 (= lt!640099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640095 mask!2687) lt!640095 lt!640100 mask!2687))))

(assert (=> b!1461329 (= lt!640095 (select (store (arr!47631 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461340 () Bool)

(declare-fun res!990972 () Bool)

(assert (=> b!1461340 (=> (not res!990972) (not e!821566))))

(assert (=> b!1461340 (= res!990972 (= (seekEntryOrOpen!0 (select (arr!47631 a!2862) j!93) a!2862 mask!2687) (Found!11883 j!93)))))

(declare-fun b!1461341 () Bool)

(assert (=> b!1461341 (= e!821568 (not (= lt!640099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640097 lt!640095 lt!640100 mask!2687))))))

(declare-fun b!1461342 () Bool)

(declare-fun res!990979 () Bool)

(assert (=> b!1461342 (=> (not res!990979) (not e!821569))))

(declare-datatypes ((List!34132 0))(
  ( (Nil!34129) (Cons!34128 (h!35478 (_ BitVec 64)) (t!48826 List!34132)) )
))
(declare-fun arrayNoDuplicates!0 (array!98686 (_ BitVec 32) List!34132) Bool)

(assert (=> b!1461342 (= res!990979 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34129))))

(declare-fun b!1461343 () Bool)

(declare-fun res!990973 () Bool)

(assert (=> b!1461343 (=> (not res!990973) (not e!821569))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461343 (= res!990973 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48181 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48181 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48181 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461344 () Bool)

(declare-fun res!990976 () Bool)

(assert (=> b!1461344 (=> (not res!990976) (not e!821570))))

(assert (=> b!1461344 (= res!990976 e!821563)))

(declare-fun c!134693 () Bool)

(assert (=> b!1461344 (= c!134693 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461345 () Bool)

(assert (=> b!1461345 (= e!821563 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640095 lt!640100 mask!2687) (seekEntryOrOpen!0 lt!640095 lt!640100 mask!2687)))))

(declare-fun b!1461346 () Bool)

(assert (=> b!1461346 (= e!821565 e!821562)))

(declare-fun res!990975 () Bool)

(assert (=> b!1461346 (=> res!990975 e!821562)))

(assert (=> b!1461346 (= res!990975 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640097 #b00000000000000000000000000000000) (bvsge lt!640097 (size!48181 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461346 (= lt!640097 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461347 () Bool)

(assert (=> b!1461347 (= e!821561 e!821564)))

(declare-fun res!990965 () Bool)

(assert (=> b!1461347 (=> (not res!990965) (not e!821564))))

(assert (=> b!1461347 (= res!990965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47631 a!2862) j!93) mask!2687) (select (arr!47631 a!2862) j!93) a!2862 mask!2687) lt!640096))))

(assert (=> b!1461347 (= lt!640096 (Intermediate!11883 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461348 () Bool)

(assert (=> b!1461348 (= e!821566 (or (= (select (arr!47631 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47631 a!2862) intermediateBeforeIndex!19) (select (arr!47631 a!2862) j!93))))))

(assert (= (and start!125238 res!990962) b!1461335))

(assert (= (and b!1461335 res!990978) b!1461337))

(assert (= (and b!1461337 res!990966) b!1461327))

(assert (= (and b!1461327 res!990970) b!1461330))

(assert (= (and b!1461330 res!990968) b!1461342))

(assert (= (and b!1461342 res!990979) b!1461343))

(assert (= (and b!1461343 res!990973) b!1461336))

(assert (= (and b!1461336 res!990971) b!1461347))

(assert (= (and b!1461347 res!990965) b!1461338))

(assert (= (and b!1461338 res!990963) b!1461329))

(assert (= (and b!1461329 res!990969) b!1461344))

(assert (= (and b!1461344 c!134693) b!1461333))

(assert (= (and b!1461344 (not c!134693)) b!1461345))

(assert (= (and b!1461344 res!990976) b!1461332))

(assert (= (and b!1461332 res!990977) b!1461334))

(assert (= (and b!1461334 res!990967) b!1461340))

(assert (= (and b!1461340 res!990972) b!1461348))

(assert (= (and b!1461334 (not res!990964)) b!1461346))

(assert (= (and b!1461346 (not res!990975)) b!1461328))

(assert (= (and b!1461328 (not res!990974)) b!1461331))

(assert (= (and b!1461331 c!134694) b!1461341))

(assert (= (and b!1461331 (not c!134694)) b!1461339))

(declare-fun m!1348919 () Bool)

(assert (=> b!1461345 m!1348919))

(declare-fun m!1348921 () Bool)

(assert (=> b!1461345 m!1348921))

(declare-fun m!1348923 () Bool)

(assert (=> b!1461341 m!1348923))

(declare-fun m!1348925 () Bool)

(assert (=> b!1461347 m!1348925))

(assert (=> b!1461347 m!1348925))

(declare-fun m!1348927 () Bool)

(assert (=> b!1461347 m!1348927))

(assert (=> b!1461347 m!1348927))

(assert (=> b!1461347 m!1348925))

(declare-fun m!1348929 () Bool)

(assert (=> b!1461347 m!1348929))

(declare-fun m!1348931 () Bool)

(assert (=> b!1461346 m!1348931))

(assert (=> b!1461327 m!1348925))

(assert (=> b!1461327 m!1348925))

(declare-fun m!1348933 () Bool)

(assert (=> b!1461327 m!1348933))

(declare-fun m!1348935 () Bool)

(assert (=> b!1461339 m!1348935))

(assert (=> b!1461339 m!1348921))

(declare-fun m!1348937 () Bool)

(assert (=> b!1461337 m!1348937))

(assert (=> b!1461337 m!1348937))

(declare-fun m!1348939 () Bool)

(assert (=> b!1461337 m!1348939))

(declare-fun m!1348941 () Bool)

(assert (=> b!1461348 m!1348941))

(assert (=> b!1461348 m!1348925))

(declare-fun m!1348943 () Bool)

(assert (=> b!1461330 m!1348943))

(assert (=> b!1461328 m!1348925))

(assert (=> b!1461328 m!1348925))

(declare-fun m!1348945 () Bool)

(assert (=> b!1461328 m!1348945))

(declare-fun m!1348947 () Bool)

(assert (=> b!1461334 m!1348947))

(declare-fun m!1348949 () Bool)

(assert (=> b!1461334 m!1348949))

(declare-fun m!1348951 () Bool)

(assert (=> b!1461334 m!1348951))

(declare-fun m!1348953 () Bool)

(assert (=> b!1461334 m!1348953))

(declare-fun m!1348955 () Bool)

(assert (=> b!1461334 m!1348955))

(assert (=> b!1461334 m!1348925))

(assert (=> b!1461336 m!1348949))

(declare-fun m!1348957 () Bool)

(assert (=> b!1461336 m!1348957))

(declare-fun m!1348959 () Bool)

(assert (=> b!1461329 m!1348959))

(assert (=> b!1461329 m!1348959))

(declare-fun m!1348961 () Bool)

(assert (=> b!1461329 m!1348961))

(assert (=> b!1461329 m!1348949))

(declare-fun m!1348963 () Bool)

(assert (=> b!1461329 m!1348963))

(declare-fun m!1348965 () Bool)

(assert (=> b!1461342 m!1348965))

(assert (=> b!1461338 m!1348925))

(assert (=> b!1461338 m!1348925))

(declare-fun m!1348967 () Bool)

(assert (=> b!1461338 m!1348967))

(assert (=> b!1461340 m!1348925))

(assert (=> b!1461340 m!1348925))

(declare-fun m!1348969 () Bool)

(assert (=> b!1461340 m!1348969))

(declare-fun m!1348971 () Bool)

(assert (=> start!125238 m!1348971))

(declare-fun m!1348973 () Bool)

(assert (=> start!125238 m!1348973))

(declare-fun m!1348975 () Bool)

(assert (=> b!1461333 m!1348975))

(check-sat (not b!1461334) (not b!1461340) (not b!1461338) (not b!1461328) (not b!1461345) (not start!125238) (not b!1461333) (not b!1461329) (not b!1461341) (not b!1461346) (not b!1461330) (not b!1461342) (not b!1461347) (not b!1461339) (not b!1461327) (not b!1461337))
(check-sat)
