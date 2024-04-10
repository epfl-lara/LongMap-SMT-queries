; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126372 () Bool)

(assert start!126372)

(declare-fun b!1481312 () Bool)

(declare-fun e!830822 () Bool)

(assert (=> b!1481312 (= e!830822 (not true))))

(declare-fun e!830824 () Bool)

(assert (=> b!1481312 e!830824))

(declare-fun res!1006655 () Bool)

(assert (=> b!1481312 (=> (not res!1006655) (not e!830824))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99391 0))(
  ( (array!99392 (arr!47973 (Array (_ BitVec 32) (_ BitVec 64))) (size!48523 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99391)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99391 (_ BitVec 32)) Bool)

(assert (=> b!1481312 (= res!1006655 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49766 0))(
  ( (Unit!49767) )
))
(declare-fun lt!646739 () Unit!49766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49766)

(assert (=> b!1481312 (= lt!646739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481313 () Bool)

(declare-fun e!830828 () Bool)

(declare-fun e!830825 () Bool)

(assert (=> b!1481313 (= e!830828 e!830825)))

(declare-fun res!1006652 () Bool)

(assert (=> b!1481313 (=> (not res!1006652) (not e!830825))))

(declare-datatypes ((SeekEntryResult!12213 0))(
  ( (MissingZero!12213 (index!51244 (_ BitVec 32))) (Found!12213 (index!51245 (_ BitVec 32))) (Intermediate!12213 (undefined!13025 Bool) (index!51246 (_ BitVec 32)) (x!132832 (_ BitVec 32))) (Undefined!12213) (MissingVacant!12213 (index!51247 (_ BitVec 32))) )
))
(declare-fun lt!646743 () SeekEntryResult!12213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99391 (_ BitVec 32)) SeekEntryResult!12213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481313 (= res!1006652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47973 a!2862) j!93) mask!2687) (select (arr!47973 a!2862) j!93) a!2862 mask!2687) lt!646743))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481313 (= lt!646743 (Intermediate!12213 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481314 () Bool)

(declare-fun res!1006663 () Bool)

(declare-fun e!830823 () Bool)

(assert (=> b!1481314 (=> (not res!1006663) (not e!830823))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481314 (= res!1006663 (and (= (size!48523 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48523 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48523 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481315 () Bool)

(declare-fun res!1006664 () Bool)

(assert (=> b!1481315 (=> (not res!1006664) (not e!830824))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99391 (_ BitVec 32)) SeekEntryResult!12213)

(assert (=> b!1481315 (= res!1006664 (= (seekEntryOrOpen!0 (select (arr!47973 a!2862) j!93) a!2862 mask!2687) (Found!12213 j!93)))))

(declare-fun b!1481316 () Bool)

(declare-fun res!1006658 () Bool)

(assert (=> b!1481316 (=> (not res!1006658) (not e!830823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481316 (= res!1006658 (validKeyInArray!0 (select (arr!47973 a!2862) j!93)))))

(declare-fun b!1481317 () Bool)

(declare-fun res!1006666 () Bool)

(assert (=> b!1481317 (=> (not res!1006666) (not e!830823))))

(declare-datatypes ((List!34474 0))(
  ( (Nil!34471) (Cons!34470 (h!35841 (_ BitVec 64)) (t!49168 List!34474)) )
))
(declare-fun arrayNoDuplicates!0 (array!99391 (_ BitVec 32) List!34474) Bool)

(assert (=> b!1481317 (= res!1006666 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34471))))

(declare-fun b!1481318 () Bool)

(declare-fun res!1006665 () Bool)

(assert (=> b!1481318 (=> (not res!1006665) (not e!830823))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481318 (= res!1006665 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48523 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48523 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48523 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481319 () Bool)

(declare-fun res!1006660 () Bool)

(assert (=> b!1481319 (=> (not res!1006660) (not e!830823))))

(assert (=> b!1481319 (= res!1006660 (validKeyInArray!0 (select (arr!47973 a!2862) i!1006)))))

(declare-fun b!1481320 () Bool)

(assert (=> b!1481320 (= e!830823 e!830828)))

(declare-fun res!1006654 () Bool)

(assert (=> b!1481320 (=> (not res!1006654) (not e!830828))))

(assert (=> b!1481320 (= res!1006654 (= (select (store (arr!47973 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646740 () array!99391)

(assert (=> b!1481320 (= lt!646740 (array!99392 (store (arr!47973 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48523 a!2862)))))

(declare-fun b!1481321 () Bool)

(assert (=> b!1481321 (= e!830824 (and (or (= (select (arr!47973 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47973 a!2862) intermediateBeforeIndex!19) (select (arr!47973 a!2862) j!93))) (or (and (= (select (arr!47973 a!2862) index!646) (select (store (arr!47973 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47973 a!2862) index!646) (select (arr!47973 a!2862) j!93))) (= (select (arr!47973 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481322 () Bool)

(declare-fun res!1006659 () Bool)

(assert (=> b!1481322 (=> (not res!1006659) (not e!830822))))

(assert (=> b!1481322 (= res!1006659 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481323 () Bool)

(assert (=> b!1481323 (= e!830825 e!830822)))

(declare-fun res!1006657 () Bool)

(assert (=> b!1481323 (=> (not res!1006657) (not e!830822))))

(declare-fun lt!646741 () SeekEntryResult!12213)

(assert (=> b!1481323 (= res!1006657 (= lt!646741 (Intermediate!12213 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646742 () (_ BitVec 64))

(assert (=> b!1481323 (= lt!646741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646742 mask!2687) lt!646742 lt!646740 mask!2687))))

(assert (=> b!1481323 (= lt!646742 (select (store (arr!47973 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481324 () Bool)

(declare-fun e!830826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99391 (_ BitVec 32)) SeekEntryResult!12213)

(assert (=> b!1481324 (= e!830826 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646742 lt!646740 mask!2687) (seekEntryOrOpen!0 lt!646742 lt!646740 mask!2687)))))

(declare-fun res!1006662 () Bool)

(assert (=> start!126372 (=> (not res!1006662) (not e!830823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126372 (= res!1006662 (validMask!0 mask!2687))))

(assert (=> start!126372 e!830823))

(assert (=> start!126372 true))

(declare-fun array_inv!37001 (array!99391) Bool)

(assert (=> start!126372 (array_inv!37001 a!2862)))

(declare-fun b!1481325 () Bool)

(declare-fun res!1006653 () Bool)

(assert (=> b!1481325 (=> (not res!1006653) (not e!830822))))

(assert (=> b!1481325 (= res!1006653 e!830826)))

(declare-fun c!136851 () Bool)

(assert (=> b!1481325 (= c!136851 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481326 () Bool)

(declare-fun res!1006656 () Bool)

(assert (=> b!1481326 (=> (not res!1006656) (not e!830825))))

(assert (=> b!1481326 (= res!1006656 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47973 a!2862) j!93) a!2862 mask!2687) lt!646743))))

(declare-fun b!1481327 () Bool)

(assert (=> b!1481327 (= e!830826 (= lt!646741 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646742 lt!646740 mask!2687)))))

(declare-fun b!1481328 () Bool)

(declare-fun res!1006661 () Bool)

(assert (=> b!1481328 (=> (not res!1006661) (not e!830823))))

(assert (=> b!1481328 (= res!1006661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126372 res!1006662) b!1481314))

(assert (= (and b!1481314 res!1006663) b!1481319))

(assert (= (and b!1481319 res!1006660) b!1481316))

(assert (= (and b!1481316 res!1006658) b!1481328))

(assert (= (and b!1481328 res!1006661) b!1481317))

(assert (= (and b!1481317 res!1006666) b!1481318))

(assert (= (and b!1481318 res!1006665) b!1481320))

(assert (= (and b!1481320 res!1006654) b!1481313))

(assert (= (and b!1481313 res!1006652) b!1481326))

(assert (= (and b!1481326 res!1006656) b!1481323))

(assert (= (and b!1481323 res!1006657) b!1481325))

(assert (= (and b!1481325 c!136851) b!1481327))

(assert (= (and b!1481325 (not c!136851)) b!1481324))

(assert (= (and b!1481325 res!1006653) b!1481322))

(assert (= (and b!1481322 res!1006659) b!1481312))

(assert (= (and b!1481312 res!1006655) b!1481315))

(assert (= (and b!1481315 res!1006664) b!1481321))

(declare-fun m!1367055 () Bool)

(assert (=> b!1481326 m!1367055))

(assert (=> b!1481326 m!1367055))

(declare-fun m!1367057 () Bool)

(assert (=> b!1481326 m!1367057))

(declare-fun m!1367059 () Bool)

(assert (=> b!1481321 m!1367059))

(declare-fun m!1367061 () Bool)

(assert (=> b!1481321 m!1367061))

(declare-fun m!1367063 () Bool)

(assert (=> b!1481321 m!1367063))

(declare-fun m!1367065 () Bool)

(assert (=> b!1481321 m!1367065))

(assert (=> b!1481321 m!1367055))

(declare-fun m!1367067 () Bool)

(assert (=> start!126372 m!1367067))

(declare-fun m!1367069 () Bool)

(assert (=> start!126372 m!1367069))

(declare-fun m!1367071 () Bool)

(assert (=> b!1481327 m!1367071))

(declare-fun m!1367073 () Bool)

(assert (=> b!1481324 m!1367073))

(declare-fun m!1367075 () Bool)

(assert (=> b!1481324 m!1367075))

(declare-fun m!1367077 () Bool)

(assert (=> b!1481319 m!1367077))

(assert (=> b!1481319 m!1367077))

(declare-fun m!1367079 () Bool)

(assert (=> b!1481319 m!1367079))

(declare-fun m!1367081 () Bool)

(assert (=> b!1481312 m!1367081))

(declare-fun m!1367083 () Bool)

(assert (=> b!1481312 m!1367083))

(assert (=> b!1481316 m!1367055))

(assert (=> b!1481316 m!1367055))

(declare-fun m!1367085 () Bool)

(assert (=> b!1481316 m!1367085))

(declare-fun m!1367087 () Bool)

(assert (=> b!1481323 m!1367087))

(assert (=> b!1481323 m!1367087))

(declare-fun m!1367089 () Bool)

(assert (=> b!1481323 m!1367089))

(assert (=> b!1481323 m!1367059))

(declare-fun m!1367091 () Bool)

(assert (=> b!1481323 m!1367091))

(assert (=> b!1481320 m!1367059))

(declare-fun m!1367093 () Bool)

(assert (=> b!1481320 m!1367093))

(assert (=> b!1481315 m!1367055))

(assert (=> b!1481315 m!1367055))

(declare-fun m!1367095 () Bool)

(assert (=> b!1481315 m!1367095))

(declare-fun m!1367097 () Bool)

(assert (=> b!1481317 m!1367097))

(assert (=> b!1481313 m!1367055))

(assert (=> b!1481313 m!1367055))

(declare-fun m!1367099 () Bool)

(assert (=> b!1481313 m!1367099))

(assert (=> b!1481313 m!1367099))

(assert (=> b!1481313 m!1367055))

(declare-fun m!1367101 () Bool)

(assert (=> b!1481313 m!1367101))

(declare-fun m!1367103 () Bool)

(assert (=> b!1481328 m!1367103))

(check-sat (not b!1481319) (not b!1481323) (not b!1481316) (not start!126372) (not b!1481312) (not b!1481328) (not b!1481315) (not b!1481327) (not b!1481324) (not b!1481313) (not b!1481326) (not b!1481317))
(check-sat)
