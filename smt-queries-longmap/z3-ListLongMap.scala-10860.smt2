; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127548 () Bool)

(assert start!127548)

(declare-fun b!1497369 () Bool)

(declare-fun e!838813 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497369 (= e!838813 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-datatypes ((array!99907 0))(
  ( (array!99908 (arr!48214 (Array (_ BitVec 32) (_ BitVec 64))) (size!48765 (_ BitVec 32))) )
))
(declare-fun lt!652463 () array!99907)

(declare-fun lt!652466 () (_ BitVec 64))

(declare-fun lt!652467 () (_ BitVec 32))

(declare-fun e!838809 () Bool)

(declare-fun b!1497370 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12351 0))(
  ( (MissingZero!12351 (index!51796 (_ BitVec 32))) (Found!12351 (index!51797 (_ BitVec 32))) (Intermediate!12351 (undefined!13163 Bool) (index!51798 (_ BitVec 32)) (x!133600 (_ BitVec 32))) (Undefined!12351) (MissingVacant!12351 (index!51799 (_ BitVec 32))) )
))
(declare-fun lt!652465 () SeekEntryResult!12351)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99907 (_ BitVec 32)) SeekEntryResult!12351)

(assert (=> b!1497370 (= e!838809 (not (= lt!652465 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 lt!652466 lt!652463 mask!2687))))))

(declare-fun b!1497371 () Bool)

(declare-fun res!1017984 () Bool)

(declare-fun e!838811 () Bool)

(assert (=> b!1497371 (=> (not res!1017984) (not e!838811))))

(declare-fun a!2862 () array!99907)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497371 (= res!1017984 (validKeyInArray!0 (select (arr!48214 a!2862) i!1006)))))

(declare-fun b!1497372 () Bool)

(declare-fun res!1017972 () Bool)

(assert (=> b!1497372 (=> (not res!1017972) (not e!838811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99907 (_ BitVec 32)) Bool)

(assert (=> b!1497372 (= res!1017972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497373 () Bool)

(declare-fun res!1017974 () Bool)

(declare-fun e!838816 () Bool)

(assert (=> b!1497373 (=> (not res!1017974) (not e!838816))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99907 (_ BitVec 32)) SeekEntryResult!12351)

(assert (=> b!1497373 (= res!1017974 (= (seekEntryOrOpen!0 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) (Found!12351 j!93)))))

(declare-fun b!1497375 () Bool)

(declare-fun e!838818 () Bool)

(declare-fun e!838817 () Bool)

(assert (=> b!1497375 (= e!838818 e!838817)))

(declare-fun res!1017987 () Bool)

(assert (=> b!1497375 (=> (not res!1017987) (not e!838817))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1497375 (= res!1017987 (= lt!652465 (Intermediate!12351 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497375 (= lt!652465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652466 mask!2687) lt!652466 lt!652463 mask!2687))))

(assert (=> b!1497375 (= lt!652466 (select (store (arr!48214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497376 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99907 (_ BitVec 32)) SeekEntryResult!12351)

(assert (=> b!1497376 (= e!838809 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687) (seekEntryOrOpen!0 lt!652466 lt!652463 mask!2687))))))

(declare-fun b!1497377 () Bool)

(declare-fun res!1017975 () Bool)

(assert (=> b!1497377 (=> (not res!1017975) (not e!838817))))

(declare-fun e!838814 () Bool)

(assert (=> b!1497377 (= res!1017975 e!838814)))

(declare-fun c!139243 () Bool)

(assert (=> b!1497377 (= c!139243 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1497378 () Bool)

(assert (=> b!1497378 (= e!838816 (or (= (select (arr!48214 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48214 a!2862) intermediateBeforeIndex!19) (select (arr!48214 a!2862) j!93))))))

(declare-fun b!1497379 () Bool)

(declare-fun res!1017976 () Bool)

(assert (=> b!1497379 (=> (not res!1017976) (not e!838818))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!652468 () SeekEntryResult!12351)

(assert (=> b!1497379 (= res!1017976 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652468))))

(declare-fun b!1497380 () Bool)

(declare-fun res!1017988 () Bool)

(assert (=> b!1497380 (=> (not res!1017988) (not e!838811))))

(assert (=> b!1497380 (= res!1017988 (validKeyInArray!0 (select (arr!48214 a!2862) j!93)))))

(declare-fun b!1497381 () Bool)

(declare-fun res!1017986 () Bool)

(assert (=> b!1497381 (=> res!1017986 e!838813)))

(assert (=> b!1497381 (= res!1017986 e!838809)))

(declare-fun c!139242 () Bool)

(assert (=> b!1497381 (= c!139242 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497382 () Bool)

(declare-fun e!838810 () Bool)

(assert (=> b!1497382 (= e!838810 e!838813)))

(declare-fun res!1017979 () Bool)

(assert (=> b!1497382 (=> res!1017979 e!838813)))

(assert (=> b!1497382 (= res!1017979 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652467 #b00000000000000000000000000000000) (bvsge lt!652467 (size!48765 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497382 (= lt!652467 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1497383 () Bool)

(declare-fun res!1017977 () Bool)

(assert (=> b!1497383 (=> res!1017977 e!838813)))

(assert (=> b!1497383 (= res!1017977 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652468)))))

(declare-fun b!1497384 () Bool)

(declare-fun res!1017980 () Bool)

(assert (=> b!1497384 (=> (not res!1017980) (not e!838811))))

(assert (=> b!1497384 (= res!1017980 (and (= (size!48765 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48765 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48765 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497385 () Bool)

(declare-fun res!1017981 () Bool)

(assert (=> b!1497385 (=> (not res!1017981) (not e!838811))))

(declare-datatypes ((List!34702 0))(
  ( (Nil!34699) (Cons!34698 (h!36107 (_ BitVec 64)) (t!49388 List!34702)) )
))
(declare-fun arrayNoDuplicates!0 (array!99907 (_ BitVec 32) List!34702) Bool)

(assert (=> b!1497385 (= res!1017981 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34699))))

(declare-fun b!1497386 () Bool)

(assert (=> b!1497386 (= e!838814 (= lt!652465 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652466 lt!652463 mask!2687)))))

(declare-fun b!1497387 () Bool)

(declare-fun res!1017971 () Bool)

(assert (=> b!1497387 (=> (not res!1017971) (not e!838817))))

(assert (=> b!1497387 (= res!1017971 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1497388 () Bool)

(assert (=> b!1497388 (= e!838817 (not e!838810))))

(declare-fun res!1017989 () Bool)

(assert (=> b!1497388 (=> res!1017989 e!838810)))

(assert (=> b!1497388 (= res!1017989 (or (and (= (select (arr!48214 a!2862) index!646) (select (store (arr!48214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48214 a!2862) index!646) (select (arr!48214 a!2862) j!93))) (= (select (arr!48214 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497388 e!838816))

(declare-fun res!1017982 () Bool)

(assert (=> b!1497388 (=> (not res!1017982) (not e!838816))))

(assert (=> b!1497388 (= res!1017982 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50075 0))(
  ( (Unit!50076) )
))
(declare-fun lt!652464 () Unit!50075)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50075)

(assert (=> b!1497388 (= lt!652464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1017978 () Bool)

(assert (=> start!127548 (=> (not res!1017978) (not e!838811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127548 (= res!1017978 (validMask!0 mask!2687))))

(assert (=> start!127548 e!838811))

(assert (=> start!127548 true))

(declare-fun array_inv!37495 (array!99907) Bool)

(assert (=> start!127548 (array_inv!37495 a!2862)))

(declare-fun b!1497374 () Bool)

(declare-fun res!1017973 () Bool)

(assert (=> b!1497374 (=> (not res!1017973) (not e!838811))))

(assert (=> b!1497374 (= res!1017973 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48765 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48765 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48765 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497389 () Bool)

(declare-fun e!838812 () Bool)

(assert (=> b!1497389 (= e!838812 e!838818)))

(declare-fun res!1017985 () Bool)

(assert (=> b!1497389 (=> (not res!1017985) (not e!838818))))

(assert (=> b!1497389 (= res!1017985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652468))))

(assert (=> b!1497389 (= lt!652468 (Intermediate!12351 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497390 () Bool)

(assert (=> b!1497390 (= e!838814 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687) (seekEntryOrOpen!0 lt!652466 lt!652463 mask!2687)))))

(declare-fun b!1497391 () Bool)

(assert (=> b!1497391 (= e!838811 e!838812)))

(declare-fun res!1017983 () Bool)

(assert (=> b!1497391 (=> (not res!1017983) (not e!838812))))

(assert (=> b!1497391 (= res!1017983 (= (select (store (arr!48214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497391 (= lt!652463 (array!99908 (store (arr!48214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48765 a!2862)))))

(assert (= (and start!127548 res!1017978) b!1497384))

(assert (= (and b!1497384 res!1017980) b!1497371))

(assert (= (and b!1497371 res!1017984) b!1497380))

(assert (= (and b!1497380 res!1017988) b!1497372))

(assert (= (and b!1497372 res!1017972) b!1497385))

(assert (= (and b!1497385 res!1017981) b!1497374))

(assert (= (and b!1497374 res!1017973) b!1497391))

(assert (= (and b!1497391 res!1017983) b!1497389))

(assert (= (and b!1497389 res!1017985) b!1497379))

(assert (= (and b!1497379 res!1017976) b!1497375))

(assert (= (and b!1497375 res!1017987) b!1497377))

(assert (= (and b!1497377 c!139243) b!1497386))

(assert (= (and b!1497377 (not c!139243)) b!1497390))

(assert (= (and b!1497377 res!1017975) b!1497387))

(assert (= (and b!1497387 res!1017971) b!1497388))

(assert (= (and b!1497388 res!1017982) b!1497373))

(assert (= (and b!1497373 res!1017974) b!1497378))

(assert (= (and b!1497388 (not res!1017989)) b!1497382))

(assert (= (and b!1497382 (not res!1017979)) b!1497383))

(assert (= (and b!1497383 (not res!1017977)) b!1497381))

(assert (= (and b!1497381 c!139242) b!1497370))

(assert (= (and b!1497381 (not c!139242)) b!1497376))

(assert (= (and b!1497381 (not res!1017986)) b!1497369))

(declare-fun m!1380781 () Bool)

(assert (=> b!1497370 m!1380781))

(declare-fun m!1380783 () Bool)

(assert (=> b!1497390 m!1380783))

(declare-fun m!1380785 () Bool)

(assert (=> b!1497390 m!1380785))

(declare-fun m!1380787 () Bool)

(assert (=> b!1497380 m!1380787))

(assert (=> b!1497380 m!1380787))

(declare-fun m!1380789 () Bool)

(assert (=> b!1497380 m!1380789))

(assert (=> b!1497383 m!1380787))

(assert (=> b!1497383 m!1380787))

(declare-fun m!1380791 () Bool)

(assert (=> b!1497383 m!1380791))

(declare-fun m!1380793 () Bool)

(assert (=> b!1497378 m!1380793))

(assert (=> b!1497378 m!1380787))

(assert (=> b!1497379 m!1380787))

(assert (=> b!1497379 m!1380787))

(declare-fun m!1380795 () Bool)

(assert (=> b!1497379 m!1380795))

(declare-fun m!1380797 () Bool)

(assert (=> start!127548 m!1380797))

(declare-fun m!1380799 () Bool)

(assert (=> start!127548 m!1380799))

(declare-fun m!1380801 () Bool)

(assert (=> b!1497376 m!1380801))

(assert (=> b!1497376 m!1380785))

(declare-fun m!1380803 () Bool)

(assert (=> b!1497388 m!1380803))

(declare-fun m!1380805 () Bool)

(assert (=> b!1497388 m!1380805))

(declare-fun m!1380807 () Bool)

(assert (=> b!1497388 m!1380807))

(declare-fun m!1380809 () Bool)

(assert (=> b!1497388 m!1380809))

(declare-fun m!1380811 () Bool)

(assert (=> b!1497388 m!1380811))

(assert (=> b!1497388 m!1380787))

(declare-fun m!1380813 () Bool)

(assert (=> b!1497385 m!1380813))

(declare-fun m!1380815 () Bool)

(assert (=> b!1497386 m!1380815))

(assert (=> b!1497391 m!1380805))

(declare-fun m!1380817 () Bool)

(assert (=> b!1497391 m!1380817))

(declare-fun m!1380819 () Bool)

(assert (=> b!1497371 m!1380819))

(assert (=> b!1497371 m!1380819))

(declare-fun m!1380821 () Bool)

(assert (=> b!1497371 m!1380821))

(declare-fun m!1380823 () Bool)

(assert (=> b!1497382 m!1380823))

(declare-fun m!1380825 () Bool)

(assert (=> b!1497372 m!1380825))

(declare-fun m!1380827 () Bool)

(assert (=> b!1497375 m!1380827))

(assert (=> b!1497375 m!1380827))

(declare-fun m!1380829 () Bool)

(assert (=> b!1497375 m!1380829))

(assert (=> b!1497375 m!1380805))

(declare-fun m!1380831 () Bool)

(assert (=> b!1497375 m!1380831))

(assert (=> b!1497389 m!1380787))

(assert (=> b!1497389 m!1380787))

(declare-fun m!1380833 () Bool)

(assert (=> b!1497389 m!1380833))

(assert (=> b!1497389 m!1380833))

(assert (=> b!1497389 m!1380787))

(declare-fun m!1380835 () Bool)

(assert (=> b!1497389 m!1380835))

(assert (=> b!1497373 m!1380787))

(assert (=> b!1497373 m!1380787))

(declare-fun m!1380837 () Bool)

(assert (=> b!1497373 m!1380837))

(check-sat (not b!1497385) (not b!1497388) (not b!1497373) (not b!1497390) (not b!1497372) (not b!1497380) (not b!1497376) (not b!1497371) (not b!1497383) (not b!1497389) (not b!1497370) (not start!127548) (not b!1497382) (not b!1497375) (not b!1497386) (not b!1497379))
(check-sat)
(get-model)

(declare-fun b!1497548 () Bool)

(declare-fun e!838893 () SeekEntryResult!12351)

(assert (=> b!1497548 (= e!838893 (Intermediate!12351 true lt!652467 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1497549 () Bool)

(declare-fun e!838891 () SeekEntryResult!12351)

(assert (=> b!1497549 (= e!838893 e!838891)))

(declare-fun c!139264 () Bool)

(declare-fun lt!652510 () (_ BitVec 64))

(assert (=> b!1497549 (= c!139264 (or (= lt!652510 lt!652466) (= (bvadd lt!652510 lt!652510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497550 () Bool)

(declare-fun e!838892 () Bool)

(declare-fun lt!652509 () SeekEntryResult!12351)

(assert (=> b!1497550 (= e!838892 (bvsge (x!133600 lt!652509) #b01111111111111111111111111111110))))

(declare-fun b!1497551 () Bool)

(declare-fun e!838889 () Bool)

(assert (=> b!1497551 (= e!838892 e!838889)))

(declare-fun res!1018112 () Bool)

(get-info :version)

(assert (=> b!1497551 (= res!1018112 (and ((_ is Intermediate!12351) lt!652509) (not (undefined!13163 lt!652509)) (bvslt (x!133600 lt!652509) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652509) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652509) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1497551 (=> (not res!1018112) (not e!838889))))

(declare-fun d!157789 () Bool)

(assert (=> d!157789 e!838892))

(declare-fun c!139262 () Bool)

(assert (=> d!157789 (= c!139262 (and ((_ is Intermediate!12351) lt!652509) (undefined!13163 lt!652509)))))

(assert (=> d!157789 (= lt!652509 e!838893)))

(declare-fun c!139263 () Bool)

(assert (=> d!157789 (= c!139263 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157789 (= lt!652510 (select (arr!48214 lt!652463) lt!652467))))

(assert (=> d!157789 (validMask!0 mask!2687)))

(assert (=> d!157789 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 lt!652466 lt!652463 mask!2687) lt!652509)))

(declare-fun b!1497552 () Bool)

(assert (=> b!1497552 (= e!838891 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652467 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497553 () Bool)

(assert (=> b!1497553 (and (bvsge (index!51798 lt!652509) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652509) (size!48765 lt!652463)))))

(declare-fun e!838890 () Bool)

(assert (=> b!1497553 (= e!838890 (= (select (arr!48214 lt!652463) (index!51798 lt!652509)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497554 () Bool)

(assert (=> b!1497554 (and (bvsge (index!51798 lt!652509) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652509) (size!48765 lt!652463)))))

(declare-fun res!1018110 () Bool)

(assert (=> b!1497554 (= res!1018110 (= (select (arr!48214 lt!652463) (index!51798 lt!652509)) lt!652466))))

(assert (=> b!1497554 (=> res!1018110 e!838890)))

(assert (=> b!1497554 (= e!838889 e!838890)))

(declare-fun b!1497555 () Bool)

(assert (=> b!1497555 (= e!838891 (Intermediate!12351 false lt!652467 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1497556 () Bool)

(assert (=> b!1497556 (and (bvsge (index!51798 lt!652509) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652509) (size!48765 lt!652463)))))

(declare-fun res!1018111 () Bool)

(assert (=> b!1497556 (= res!1018111 (= (select (arr!48214 lt!652463) (index!51798 lt!652509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497556 (=> res!1018111 e!838890)))

(assert (= (and d!157789 c!139263) b!1497548))

(assert (= (and d!157789 (not c!139263)) b!1497549))

(assert (= (and b!1497549 c!139264) b!1497555))

(assert (= (and b!1497549 (not c!139264)) b!1497552))

(assert (= (and d!157789 c!139262) b!1497550))

(assert (= (and d!157789 (not c!139262)) b!1497551))

(assert (= (and b!1497551 res!1018112) b!1497554))

(assert (= (and b!1497554 (not res!1018110)) b!1497556))

(assert (= (and b!1497556 (not res!1018111)) b!1497553))

(declare-fun m!1380955 () Bool)

(assert (=> b!1497552 m!1380955))

(assert (=> b!1497552 m!1380955))

(declare-fun m!1380957 () Bool)

(assert (=> b!1497552 m!1380957))

(declare-fun m!1380959 () Bool)

(assert (=> b!1497556 m!1380959))

(assert (=> b!1497554 m!1380959))

(assert (=> b!1497553 m!1380959))

(declare-fun m!1380961 () Bool)

(assert (=> d!157789 m!1380961))

(assert (=> d!157789 m!1380797))

(assert (=> b!1497370 d!157789))

(declare-fun d!157791 () Bool)

(assert (=> d!157791 (= (validKeyInArray!0 (select (arr!48214 a!2862) j!93)) (and (not (= (select (arr!48214 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48214 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497380 d!157791))

(declare-fun d!157793 () Bool)

(declare-fun lt!652513 () (_ BitVec 32))

(assert (=> d!157793 (and (bvsge lt!652513 #b00000000000000000000000000000000) (bvslt lt!652513 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157793 (= lt!652513 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157793 (validMask!0 mask!2687)))

(assert (=> d!157793 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!652513)))

(declare-fun bs!42925 () Bool)

(assert (= bs!42925 d!157793))

(declare-fun m!1380963 () Bool)

(assert (=> bs!42925 m!1380963))

(assert (=> bs!42925 m!1380797))

(assert (=> b!1497382 d!157793))

(declare-fun d!157795 () Bool)

(assert (=> d!157795 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127548 d!157795))

(declare-fun d!157797 () Bool)

(assert (=> d!157797 (= (array_inv!37495 a!2862) (bvsge (size!48765 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127548 d!157797))

(declare-fun d!157799 () Bool)

(assert (=> d!157799 (= (validKeyInArray!0 (select (arr!48214 a!2862) i!1006)) (and (not (= (select (arr!48214 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48214 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497371 d!157799))

(declare-fun b!1497565 () Bool)

(declare-fun e!838902 () Bool)

(declare-fun call!68115 () Bool)

(assert (=> b!1497565 (= e!838902 call!68115)))

(declare-fun b!1497566 () Bool)

(declare-fun e!838900 () Bool)

(declare-fun e!838901 () Bool)

(assert (=> b!1497566 (= e!838900 e!838901)))

(declare-fun c!139267 () Bool)

(assert (=> b!1497566 (= c!139267 (validKeyInArray!0 (select (arr!48214 a!2862) j!93)))))

(declare-fun bm!68112 () Bool)

(assert (=> bm!68112 (= call!68115 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1497567 () Bool)

(assert (=> b!1497567 (= e!838901 e!838902)))

(declare-fun lt!652520 () (_ BitVec 64))

(assert (=> b!1497567 (= lt!652520 (select (arr!48214 a!2862) j!93))))

(declare-fun lt!652522 () Unit!50075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99907 (_ BitVec 64) (_ BitVec 32)) Unit!50075)

(assert (=> b!1497567 (= lt!652522 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652520 j!93))))

(declare-fun arrayContainsKey!0 (array!99907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497567 (arrayContainsKey!0 a!2862 lt!652520 #b00000000000000000000000000000000)))

(declare-fun lt!652521 () Unit!50075)

(assert (=> b!1497567 (= lt!652521 lt!652522)))

(declare-fun res!1018117 () Bool)

(assert (=> b!1497567 (= res!1018117 (= (seekEntryOrOpen!0 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) (Found!12351 j!93)))))

(assert (=> b!1497567 (=> (not res!1018117) (not e!838902))))

(declare-fun b!1497568 () Bool)

(assert (=> b!1497568 (= e!838901 call!68115)))

(declare-fun d!157801 () Bool)

(declare-fun res!1018118 () Bool)

(assert (=> d!157801 (=> res!1018118 e!838900)))

(assert (=> d!157801 (= res!1018118 (bvsge j!93 (size!48765 a!2862)))))

(assert (=> d!157801 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!838900)))

(assert (= (and d!157801 (not res!1018118)) b!1497566))

(assert (= (and b!1497566 c!139267) b!1497567))

(assert (= (and b!1497566 (not c!139267)) b!1497568))

(assert (= (and b!1497567 res!1018117) b!1497565))

(assert (= (or b!1497565 b!1497568) bm!68112))

(assert (=> b!1497566 m!1380787))

(assert (=> b!1497566 m!1380787))

(assert (=> b!1497566 m!1380789))

(declare-fun m!1380965 () Bool)

(assert (=> bm!68112 m!1380965))

(assert (=> b!1497567 m!1380787))

(declare-fun m!1380967 () Bool)

(assert (=> b!1497567 m!1380967))

(declare-fun m!1380969 () Bool)

(assert (=> b!1497567 m!1380969))

(assert (=> b!1497567 m!1380787))

(assert (=> b!1497567 m!1380837))

(assert (=> b!1497388 d!157801))

(declare-fun d!157803 () Bool)

(assert (=> d!157803 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652525 () Unit!50075)

(declare-fun choose!38 (array!99907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50075)

(assert (=> d!157803 (= lt!652525 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157803 (validMask!0 mask!2687)))

(assert (=> d!157803 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!652525)))

(declare-fun bs!42926 () Bool)

(assert (= bs!42926 d!157803))

(assert (=> bs!42926 m!1380811))

(declare-fun m!1380971 () Bool)

(assert (=> bs!42926 m!1380971))

(assert (=> bs!42926 m!1380797))

(assert (=> b!1497388 d!157803))

(declare-fun b!1497582 () Bool)

(declare-fun e!838911 () SeekEntryResult!12351)

(declare-fun e!838910 () SeekEntryResult!12351)

(assert (=> b!1497582 (= e!838911 e!838910)))

(declare-fun c!139274 () Bool)

(declare-fun lt!652530 () (_ BitVec 64))

(assert (=> b!1497582 (= c!139274 (= lt!652530 lt!652466))))

(declare-fun b!1497583 () Bool)

(declare-fun c!139275 () Bool)

(assert (=> b!1497583 (= c!139275 (= lt!652530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838909 () SeekEntryResult!12351)

(assert (=> b!1497583 (= e!838910 e!838909)))

(declare-fun b!1497584 () Bool)

(assert (=> b!1497584 (= e!838909 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497581 () Bool)

(assert (=> b!1497581 (= e!838910 (Found!12351 index!646))))

(declare-fun lt!652531 () SeekEntryResult!12351)

(declare-fun d!157805 () Bool)

(assert (=> d!157805 (and (or ((_ is Undefined!12351) lt!652531) (not ((_ is Found!12351) lt!652531)) (and (bvsge (index!51797 lt!652531) #b00000000000000000000000000000000) (bvslt (index!51797 lt!652531) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652531) ((_ is Found!12351) lt!652531) (not ((_ is MissingVacant!12351) lt!652531)) (not (= (index!51799 lt!652531) intermediateAfterIndex!19)) (and (bvsge (index!51799 lt!652531) #b00000000000000000000000000000000) (bvslt (index!51799 lt!652531) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652531) (ite ((_ is Found!12351) lt!652531) (= (select (arr!48214 lt!652463) (index!51797 lt!652531)) lt!652466) (and ((_ is MissingVacant!12351) lt!652531) (= (index!51799 lt!652531) intermediateAfterIndex!19) (= (select (arr!48214 lt!652463) (index!51799 lt!652531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157805 (= lt!652531 e!838911)))

(declare-fun c!139276 () Bool)

(assert (=> d!157805 (= c!139276 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157805 (= lt!652530 (select (arr!48214 lt!652463) index!646))))

(assert (=> d!157805 (validMask!0 mask!2687)))

(assert (=> d!157805 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687) lt!652531)))

(declare-fun b!1497585 () Bool)

(assert (=> b!1497585 (= e!838909 (MissingVacant!12351 intermediateAfterIndex!19))))

(declare-fun b!1497586 () Bool)

(assert (=> b!1497586 (= e!838911 Undefined!12351)))

(assert (= (and d!157805 c!139276) b!1497586))

(assert (= (and d!157805 (not c!139276)) b!1497582))

(assert (= (and b!1497582 c!139274) b!1497581))

(assert (= (and b!1497582 (not c!139274)) b!1497583))

(assert (= (and b!1497583 c!139275) b!1497585))

(assert (= (and b!1497583 (not c!139275)) b!1497584))

(declare-fun m!1380973 () Bool)

(assert (=> b!1497584 m!1380973))

(assert (=> b!1497584 m!1380973))

(declare-fun m!1380975 () Bool)

(assert (=> b!1497584 m!1380975))

(declare-fun m!1380977 () Bool)

(assert (=> d!157805 m!1380977))

(declare-fun m!1380979 () Bool)

(assert (=> d!157805 m!1380979))

(declare-fun m!1380981 () Bool)

(assert (=> d!157805 m!1380981))

(assert (=> d!157805 m!1380797))

(assert (=> b!1497390 d!157805))

(declare-fun b!1497599 () Bool)

(declare-fun e!838920 () SeekEntryResult!12351)

(assert (=> b!1497599 (= e!838920 Undefined!12351)))

(declare-fun b!1497600 () Bool)

(declare-fun c!139285 () Bool)

(declare-fun lt!652538 () (_ BitVec 64))

(assert (=> b!1497600 (= c!139285 (= lt!652538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838918 () SeekEntryResult!12351)

(declare-fun e!838919 () SeekEntryResult!12351)

(assert (=> b!1497600 (= e!838918 e!838919)))

(declare-fun d!157807 () Bool)

(declare-fun lt!652540 () SeekEntryResult!12351)

(assert (=> d!157807 (and (or ((_ is Undefined!12351) lt!652540) (not ((_ is Found!12351) lt!652540)) (and (bvsge (index!51797 lt!652540) #b00000000000000000000000000000000) (bvslt (index!51797 lt!652540) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652540) ((_ is Found!12351) lt!652540) (not ((_ is MissingZero!12351) lt!652540)) (and (bvsge (index!51796 lt!652540) #b00000000000000000000000000000000) (bvslt (index!51796 lt!652540) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652540) ((_ is Found!12351) lt!652540) ((_ is MissingZero!12351) lt!652540) (not ((_ is MissingVacant!12351) lt!652540)) (and (bvsge (index!51799 lt!652540) #b00000000000000000000000000000000) (bvslt (index!51799 lt!652540) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652540) (ite ((_ is Found!12351) lt!652540) (= (select (arr!48214 lt!652463) (index!51797 lt!652540)) lt!652466) (ite ((_ is MissingZero!12351) lt!652540) (= (select (arr!48214 lt!652463) (index!51796 lt!652540)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12351) lt!652540) (= (select (arr!48214 lt!652463) (index!51799 lt!652540)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157807 (= lt!652540 e!838920)))

(declare-fun c!139283 () Bool)

(declare-fun lt!652539 () SeekEntryResult!12351)

(assert (=> d!157807 (= c!139283 (and ((_ is Intermediate!12351) lt!652539) (undefined!13163 lt!652539)))))

(assert (=> d!157807 (= lt!652539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652466 mask!2687) lt!652466 lt!652463 mask!2687))))

(assert (=> d!157807 (validMask!0 mask!2687)))

(assert (=> d!157807 (= (seekEntryOrOpen!0 lt!652466 lt!652463 mask!2687) lt!652540)))

(declare-fun b!1497601 () Bool)

(assert (=> b!1497601 (= e!838918 (Found!12351 (index!51798 lt!652539)))))

(declare-fun b!1497602 () Bool)

(assert (=> b!1497602 (= e!838920 e!838918)))

(assert (=> b!1497602 (= lt!652538 (select (arr!48214 lt!652463) (index!51798 lt!652539)))))

(declare-fun c!139284 () Bool)

(assert (=> b!1497602 (= c!139284 (= lt!652538 lt!652466))))

(declare-fun b!1497603 () Bool)

(assert (=> b!1497603 (= e!838919 (seekKeyOrZeroReturnVacant!0 (x!133600 lt!652539) (index!51798 lt!652539) (index!51798 lt!652539) lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497604 () Bool)

(assert (=> b!1497604 (= e!838919 (MissingZero!12351 (index!51798 lt!652539)))))

(assert (= (and d!157807 c!139283) b!1497599))

(assert (= (and d!157807 (not c!139283)) b!1497602))

(assert (= (and b!1497602 c!139284) b!1497601))

(assert (= (and b!1497602 (not c!139284)) b!1497600))

(assert (= (and b!1497600 c!139285) b!1497604))

(assert (= (and b!1497600 (not c!139285)) b!1497603))

(assert (=> d!157807 m!1380827))

(declare-fun m!1380983 () Bool)

(assert (=> d!157807 m!1380983))

(assert (=> d!157807 m!1380797))

(declare-fun m!1380985 () Bool)

(assert (=> d!157807 m!1380985))

(declare-fun m!1380987 () Bool)

(assert (=> d!157807 m!1380987))

(assert (=> d!157807 m!1380827))

(assert (=> d!157807 m!1380829))

(declare-fun m!1380989 () Bool)

(assert (=> b!1497602 m!1380989))

(declare-fun m!1380991 () Bool)

(assert (=> b!1497603 m!1380991))

(assert (=> b!1497390 d!157807))

(declare-fun b!1497605 () Bool)

(declare-fun e!838925 () SeekEntryResult!12351)

(assert (=> b!1497605 (= e!838925 (Intermediate!12351 true index!646 x!665))))

(declare-fun b!1497606 () Bool)

(declare-fun e!838923 () SeekEntryResult!12351)

(assert (=> b!1497606 (= e!838925 e!838923)))

(declare-fun lt!652542 () (_ BitVec 64))

(declare-fun c!139288 () Bool)

(assert (=> b!1497606 (= c!139288 (or (= lt!652542 (select (arr!48214 a!2862) j!93)) (= (bvadd lt!652542 lt!652542) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497607 () Bool)

(declare-fun e!838924 () Bool)

(declare-fun lt!652541 () SeekEntryResult!12351)

(assert (=> b!1497607 (= e!838924 (bvsge (x!133600 lt!652541) #b01111111111111111111111111111110))))

(declare-fun b!1497608 () Bool)

(declare-fun e!838921 () Bool)

(assert (=> b!1497608 (= e!838924 e!838921)))

(declare-fun res!1018121 () Bool)

(assert (=> b!1497608 (= res!1018121 (and ((_ is Intermediate!12351) lt!652541) (not (undefined!13163 lt!652541)) (bvslt (x!133600 lt!652541) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652541) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652541) x!665)))))

(assert (=> b!1497608 (=> (not res!1018121) (not e!838921))))

(declare-fun d!157809 () Bool)

(assert (=> d!157809 e!838924))

(declare-fun c!139286 () Bool)

(assert (=> d!157809 (= c!139286 (and ((_ is Intermediate!12351) lt!652541) (undefined!13163 lt!652541)))))

(assert (=> d!157809 (= lt!652541 e!838925)))

(declare-fun c!139287 () Bool)

(assert (=> d!157809 (= c!139287 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157809 (= lt!652542 (select (arr!48214 a!2862) index!646))))

(assert (=> d!157809 (validMask!0 mask!2687)))

(assert (=> d!157809 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652541)))

(declare-fun b!1497609 () Bool)

(assert (=> b!1497609 (= e!838923 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497610 () Bool)

(assert (=> b!1497610 (and (bvsge (index!51798 lt!652541) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652541) (size!48765 a!2862)))))

(declare-fun e!838922 () Bool)

(assert (=> b!1497610 (= e!838922 (= (select (arr!48214 a!2862) (index!51798 lt!652541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497611 () Bool)

(assert (=> b!1497611 (and (bvsge (index!51798 lt!652541) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652541) (size!48765 a!2862)))))

(declare-fun res!1018119 () Bool)

(assert (=> b!1497611 (= res!1018119 (= (select (arr!48214 a!2862) (index!51798 lt!652541)) (select (arr!48214 a!2862) j!93)))))

(assert (=> b!1497611 (=> res!1018119 e!838922)))

(assert (=> b!1497611 (= e!838921 e!838922)))

(declare-fun b!1497612 () Bool)

(assert (=> b!1497612 (= e!838923 (Intermediate!12351 false index!646 x!665))))

(declare-fun b!1497613 () Bool)

(assert (=> b!1497613 (and (bvsge (index!51798 lt!652541) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652541) (size!48765 a!2862)))))

(declare-fun res!1018120 () Bool)

(assert (=> b!1497613 (= res!1018120 (= (select (arr!48214 a!2862) (index!51798 lt!652541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497613 (=> res!1018120 e!838922)))

(assert (= (and d!157809 c!139287) b!1497605))

(assert (= (and d!157809 (not c!139287)) b!1497606))

(assert (= (and b!1497606 c!139288) b!1497612))

(assert (= (and b!1497606 (not c!139288)) b!1497609))

(assert (= (and d!157809 c!139286) b!1497607))

(assert (= (and d!157809 (not c!139286)) b!1497608))

(assert (= (and b!1497608 res!1018121) b!1497611))

(assert (= (and b!1497611 (not res!1018119)) b!1497613))

(assert (= (and b!1497613 (not res!1018120)) b!1497610))

(assert (=> b!1497609 m!1380973))

(assert (=> b!1497609 m!1380973))

(assert (=> b!1497609 m!1380787))

(declare-fun m!1380993 () Bool)

(assert (=> b!1497609 m!1380993))

(declare-fun m!1380995 () Bool)

(assert (=> b!1497613 m!1380995))

(assert (=> b!1497611 m!1380995))

(assert (=> b!1497610 m!1380995))

(assert (=> d!157809 m!1380809))

(assert (=> d!157809 m!1380797))

(assert (=> b!1497379 d!157809))

(declare-fun b!1497614 () Bool)

(declare-fun e!838930 () SeekEntryResult!12351)

(assert (=> b!1497614 (= e!838930 (Intermediate!12351 true (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497615 () Bool)

(declare-fun e!838928 () SeekEntryResult!12351)

(assert (=> b!1497615 (= e!838930 e!838928)))

(declare-fun lt!652544 () (_ BitVec 64))

(declare-fun c!139291 () Bool)

(assert (=> b!1497615 (= c!139291 (or (= lt!652544 (select (arr!48214 a!2862) j!93)) (= (bvadd lt!652544 lt!652544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497616 () Bool)

(declare-fun e!838929 () Bool)

(declare-fun lt!652543 () SeekEntryResult!12351)

(assert (=> b!1497616 (= e!838929 (bvsge (x!133600 lt!652543) #b01111111111111111111111111111110))))

(declare-fun b!1497617 () Bool)

(declare-fun e!838926 () Bool)

(assert (=> b!1497617 (= e!838929 e!838926)))

(declare-fun res!1018124 () Bool)

(assert (=> b!1497617 (= res!1018124 (and ((_ is Intermediate!12351) lt!652543) (not (undefined!13163 lt!652543)) (bvslt (x!133600 lt!652543) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652543) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652543) #b00000000000000000000000000000000)))))

(assert (=> b!1497617 (=> (not res!1018124) (not e!838926))))

(declare-fun d!157811 () Bool)

(assert (=> d!157811 e!838929))

(declare-fun c!139289 () Bool)

(assert (=> d!157811 (= c!139289 (and ((_ is Intermediate!12351) lt!652543) (undefined!13163 lt!652543)))))

(assert (=> d!157811 (= lt!652543 e!838930)))

(declare-fun c!139290 () Bool)

(assert (=> d!157811 (= c!139290 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157811 (= lt!652544 (select (arr!48214 a!2862) (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687)))))

(assert (=> d!157811 (validMask!0 mask!2687)))

(assert (=> d!157811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652543)))

(declare-fun b!1497618 () Bool)

(assert (=> b!1497618 (= e!838928 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497619 () Bool)

(assert (=> b!1497619 (and (bvsge (index!51798 lt!652543) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652543) (size!48765 a!2862)))))

(declare-fun e!838927 () Bool)

(assert (=> b!1497619 (= e!838927 (= (select (arr!48214 a!2862) (index!51798 lt!652543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497620 () Bool)

(assert (=> b!1497620 (and (bvsge (index!51798 lt!652543) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652543) (size!48765 a!2862)))))

(declare-fun res!1018122 () Bool)

(assert (=> b!1497620 (= res!1018122 (= (select (arr!48214 a!2862) (index!51798 lt!652543)) (select (arr!48214 a!2862) j!93)))))

(assert (=> b!1497620 (=> res!1018122 e!838927)))

(assert (=> b!1497620 (= e!838926 e!838927)))

(declare-fun b!1497621 () Bool)

(assert (=> b!1497621 (= e!838928 (Intermediate!12351 false (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497622 () Bool)

(assert (=> b!1497622 (and (bvsge (index!51798 lt!652543) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652543) (size!48765 a!2862)))))

(declare-fun res!1018123 () Bool)

(assert (=> b!1497622 (= res!1018123 (= (select (arr!48214 a!2862) (index!51798 lt!652543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497622 (=> res!1018123 e!838927)))

(assert (= (and d!157811 c!139290) b!1497614))

(assert (= (and d!157811 (not c!139290)) b!1497615))

(assert (= (and b!1497615 c!139291) b!1497621))

(assert (= (and b!1497615 (not c!139291)) b!1497618))

(assert (= (and d!157811 c!139289) b!1497616))

(assert (= (and d!157811 (not c!139289)) b!1497617))

(assert (= (and b!1497617 res!1018124) b!1497620))

(assert (= (and b!1497620 (not res!1018122)) b!1497622))

(assert (= (and b!1497622 (not res!1018123)) b!1497619))

(assert (=> b!1497618 m!1380833))

(declare-fun m!1380997 () Bool)

(assert (=> b!1497618 m!1380997))

(assert (=> b!1497618 m!1380997))

(assert (=> b!1497618 m!1380787))

(declare-fun m!1380999 () Bool)

(assert (=> b!1497618 m!1380999))

(declare-fun m!1381001 () Bool)

(assert (=> b!1497622 m!1381001))

(assert (=> b!1497620 m!1381001))

(assert (=> b!1497619 m!1381001))

(assert (=> d!157811 m!1380833))

(declare-fun m!1381003 () Bool)

(assert (=> d!157811 m!1381003))

(assert (=> d!157811 m!1380797))

(assert (=> b!1497389 d!157811))

(declare-fun d!157813 () Bool)

(declare-fun lt!652550 () (_ BitVec 32))

(declare-fun lt!652549 () (_ BitVec 32))

(assert (=> d!157813 (= lt!652550 (bvmul (bvxor lt!652549 (bvlshr lt!652549 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157813 (= lt!652549 ((_ extract 31 0) (bvand (bvxor (select (arr!48214 a!2862) j!93) (bvlshr (select (arr!48214 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157813 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1018125 (let ((h!36110 ((_ extract 31 0) (bvand (bvxor (select (arr!48214 a!2862) j!93) (bvlshr (select (arr!48214 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133606 (bvmul (bvxor h!36110 (bvlshr h!36110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133606 (bvlshr x!133606 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1018125 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1018125 #b00000000000000000000000000000000))))))

(assert (=> d!157813 (= (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) (bvand (bvxor lt!652550 (bvlshr lt!652550 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1497389 d!157813))

(declare-fun b!1497623 () Bool)

(declare-fun e!838935 () SeekEntryResult!12351)

(assert (=> b!1497623 (= e!838935 (Intermediate!12351 true index!646 x!665))))

(declare-fun b!1497624 () Bool)

(declare-fun e!838933 () SeekEntryResult!12351)

(assert (=> b!1497624 (= e!838935 e!838933)))

(declare-fun c!139294 () Bool)

(declare-fun lt!652552 () (_ BitVec 64))

(assert (=> b!1497624 (= c!139294 (or (= lt!652552 lt!652466) (= (bvadd lt!652552 lt!652552) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497625 () Bool)

(declare-fun e!838934 () Bool)

(declare-fun lt!652551 () SeekEntryResult!12351)

(assert (=> b!1497625 (= e!838934 (bvsge (x!133600 lt!652551) #b01111111111111111111111111111110))))

(declare-fun b!1497626 () Bool)

(declare-fun e!838931 () Bool)

(assert (=> b!1497626 (= e!838934 e!838931)))

(declare-fun res!1018128 () Bool)

(assert (=> b!1497626 (= res!1018128 (and ((_ is Intermediate!12351) lt!652551) (not (undefined!13163 lt!652551)) (bvslt (x!133600 lt!652551) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652551) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652551) x!665)))))

(assert (=> b!1497626 (=> (not res!1018128) (not e!838931))))

(declare-fun d!157817 () Bool)

(assert (=> d!157817 e!838934))

(declare-fun c!139292 () Bool)

(assert (=> d!157817 (= c!139292 (and ((_ is Intermediate!12351) lt!652551) (undefined!13163 lt!652551)))))

(assert (=> d!157817 (= lt!652551 e!838935)))

(declare-fun c!139293 () Bool)

(assert (=> d!157817 (= c!139293 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157817 (= lt!652552 (select (arr!48214 lt!652463) index!646))))

(assert (=> d!157817 (validMask!0 mask!2687)))

(assert (=> d!157817 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652466 lt!652463 mask!2687) lt!652551)))

(declare-fun b!1497627 () Bool)

(assert (=> b!1497627 (= e!838933 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497628 () Bool)

(assert (=> b!1497628 (and (bvsge (index!51798 lt!652551) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652551) (size!48765 lt!652463)))))

(declare-fun e!838932 () Bool)

(assert (=> b!1497628 (= e!838932 (= (select (arr!48214 lt!652463) (index!51798 lt!652551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497629 () Bool)

(assert (=> b!1497629 (and (bvsge (index!51798 lt!652551) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652551) (size!48765 lt!652463)))))

(declare-fun res!1018126 () Bool)

(assert (=> b!1497629 (= res!1018126 (= (select (arr!48214 lt!652463) (index!51798 lt!652551)) lt!652466))))

(assert (=> b!1497629 (=> res!1018126 e!838932)))

(assert (=> b!1497629 (= e!838931 e!838932)))

(declare-fun b!1497630 () Bool)

(assert (=> b!1497630 (= e!838933 (Intermediate!12351 false index!646 x!665))))

(declare-fun b!1497631 () Bool)

(assert (=> b!1497631 (and (bvsge (index!51798 lt!652551) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652551) (size!48765 lt!652463)))))

(declare-fun res!1018127 () Bool)

(assert (=> b!1497631 (= res!1018127 (= (select (arr!48214 lt!652463) (index!51798 lt!652551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497631 (=> res!1018127 e!838932)))

(assert (= (and d!157817 c!139293) b!1497623))

(assert (= (and d!157817 (not c!139293)) b!1497624))

(assert (= (and b!1497624 c!139294) b!1497630))

(assert (= (and b!1497624 (not c!139294)) b!1497627))

(assert (= (and d!157817 c!139292) b!1497625))

(assert (= (and d!157817 (not c!139292)) b!1497626))

(assert (= (and b!1497626 res!1018128) b!1497629))

(assert (= (and b!1497629 (not res!1018126)) b!1497631))

(assert (= (and b!1497631 (not res!1018127)) b!1497628))

(assert (=> b!1497627 m!1380973))

(assert (=> b!1497627 m!1380973))

(declare-fun m!1381005 () Bool)

(assert (=> b!1497627 m!1381005))

(declare-fun m!1381007 () Bool)

(assert (=> b!1497631 m!1381007))

(assert (=> b!1497629 m!1381007))

(assert (=> b!1497628 m!1381007))

(assert (=> d!157817 m!1380981))

(assert (=> d!157817 m!1380797))

(assert (=> b!1497386 d!157817))

(declare-fun b!1497632 () Bool)

(declare-fun e!838940 () SeekEntryResult!12351)

(assert (=> b!1497632 (= e!838940 (Intermediate!12351 true (toIndex!0 lt!652466 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497633 () Bool)

(declare-fun e!838938 () SeekEntryResult!12351)

(assert (=> b!1497633 (= e!838940 e!838938)))

(declare-fun c!139297 () Bool)

(declare-fun lt!652554 () (_ BitVec 64))

(assert (=> b!1497633 (= c!139297 (or (= lt!652554 lt!652466) (= (bvadd lt!652554 lt!652554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497634 () Bool)

(declare-fun e!838939 () Bool)

(declare-fun lt!652553 () SeekEntryResult!12351)

(assert (=> b!1497634 (= e!838939 (bvsge (x!133600 lt!652553) #b01111111111111111111111111111110))))

(declare-fun b!1497635 () Bool)

(declare-fun e!838936 () Bool)

(assert (=> b!1497635 (= e!838939 e!838936)))

(declare-fun res!1018131 () Bool)

(assert (=> b!1497635 (= res!1018131 (and ((_ is Intermediate!12351) lt!652553) (not (undefined!13163 lt!652553)) (bvslt (x!133600 lt!652553) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652553) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652553) #b00000000000000000000000000000000)))))

(assert (=> b!1497635 (=> (not res!1018131) (not e!838936))))

(declare-fun d!157819 () Bool)

(assert (=> d!157819 e!838939))

(declare-fun c!139295 () Bool)

(assert (=> d!157819 (= c!139295 (and ((_ is Intermediate!12351) lt!652553) (undefined!13163 lt!652553)))))

(assert (=> d!157819 (= lt!652553 e!838940)))

(declare-fun c!139296 () Bool)

(assert (=> d!157819 (= c!139296 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157819 (= lt!652554 (select (arr!48214 lt!652463) (toIndex!0 lt!652466 mask!2687)))))

(assert (=> d!157819 (validMask!0 mask!2687)))

(assert (=> d!157819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652466 mask!2687) lt!652466 lt!652463 mask!2687) lt!652553)))

(declare-fun b!1497636 () Bool)

(assert (=> b!1497636 (= e!838938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!652466 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497637 () Bool)

(assert (=> b!1497637 (and (bvsge (index!51798 lt!652553) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652553) (size!48765 lt!652463)))))

(declare-fun e!838937 () Bool)

(assert (=> b!1497637 (= e!838937 (= (select (arr!48214 lt!652463) (index!51798 lt!652553)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497638 () Bool)

(assert (=> b!1497638 (and (bvsge (index!51798 lt!652553) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652553) (size!48765 lt!652463)))))

(declare-fun res!1018129 () Bool)

(assert (=> b!1497638 (= res!1018129 (= (select (arr!48214 lt!652463) (index!51798 lt!652553)) lt!652466))))

(assert (=> b!1497638 (=> res!1018129 e!838937)))

(assert (=> b!1497638 (= e!838936 e!838937)))

(declare-fun b!1497639 () Bool)

(assert (=> b!1497639 (= e!838938 (Intermediate!12351 false (toIndex!0 lt!652466 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1497640 () Bool)

(assert (=> b!1497640 (and (bvsge (index!51798 lt!652553) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652553) (size!48765 lt!652463)))))

(declare-fun res!1018130 () Bool)

(assert (=> b!1497640 (= res!1018130 (= (select (arr!48214 lt!652463) (index!51798 lt!652553)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497640 (=> res!1018130 e!838937)))

(assert (= (and d!157819 c!139296) b!1497632))

(assert (= (and d!157819 (not c!139296)) b!1497633))

(assert (= (and b!1497633 c!139297) b!1497639))

(assert (= (and b!1497633 (not c!139297)) b!1497636))

(assert (= (and d!157819 c!139295) b!1497634))

(assert (= (and d!157819 (not c!139295)) b!1497635))

(assert (= (and b!1497635 res!1018131) b!1497638))

(assert (= (and b!1497638 (not res!1018129)) b!1497640))

(assert (= (and b!1497640 (not res!1018130)) b!1497637))

(assert (=> b!1497636 m!1380827))

(declare-fun m!1381009 () Bool)

(assert (=> b!1497636 m!1381009))

(assert (=> b!1497636 m!1381009))

(declare-fun m!1381011 () Bool)

(assert (=> b!1497636 m!1381011))

(declare-fun m!1381013 () Bool)

(assert (=> b!1497640 m!1381013))

(assert (=> b!1497638 m!1381013))

(assert (=> b!1497637 m!1381013))

(assert (=> d!157819 m!1380827))

(declare-fun m!1381015 () Bool)

(assert (=> d!157819 m!1381015))

(assert (=> d!157819 m!1380797))

(assert (=> b!1497375 d!157819))

(declare-fun d!157821 () Bool)

(declare-fun lt!652556 () (_ BitVec 32))

(declare-fun lt!652555 () (_ BitVec 32))

(assert (=> d!157821 (= lt!652556 (bvmul (bvxor lt!652555 (bvlshr lt!652555 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157821 (= lt!652555 ((_ extract 31 0) (bvand (bvxor lt!652466 (bvlshr lt!652466 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157821 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1018125 (let ((h!36110 ((_ extract 31 0) (bvand (bvxor lt!652466 (bvlshr lt!652466 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133606 (bvmul (bvxor h!36110 (bvlshr h!36110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133606 (bvlshr x!133606 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1018125 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1018125 #b00000000000000000000000000000000))))))

(assert (=> d!157821 (= (toIndex!0 lt!652466 mask!2687) (bvand (bvxor lt!652556 (bvlshr lt!652556 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1497375 d!157821))

(declare-fun b!1497651 () Bool)

(declare-fun e!838949 () Bool)

(declare-fun contains!9983 (List!34702 (_ BitVec 64)) Bool)

(assert (=> b!1497651 (= e!838949 (contains!9983 Nil!34699 (select (arr!48214 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1497652 () Bool)

(declare-fun e!838951 () Bool)

(declare-fun e!838950 () Bool)

(assert (=> b!1497652 (= e!838951 e!838950)))

(declare-fun c!139300 () Bool)

(assert (=> b!1497652 (= c!139300 (validKeyInArray!0 (select (arr!48214 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157823 () Bool)

(declare-fun res!1018140 () Bool)

(declare-fun e!838952 () Bool)

(assert (=> d!157823 (=> res!1018140 e!838952)))

(assert (=> d!157823 (= res!1018140 (bvsge #b00000000000000000000000000000000 (size!48765 a!2862)))))

(assert (=> d!157823 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34699) e!838952)))

(declare-fun b!1497653 () Bool)

(declare-fun call!68118 () Bool)

(assert (=> b!1497653 (= e!838950 call!68118)))

(declare-fun bm!68115 () Bool)

(assert (=> bm!68115 (= call!68118 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139300 (Cons!34698 (select (arr!48214 a!2862) #b00000000000000000000000000000000) Nil!34699) Nil!34699)))))

(declare-fun b!1497654 () Bool)

(assert (=> b!1497654 (= e!838952 e!838951)))

(declare-fun res!1018138 () Bool)

(assert (=> b!1497654 (=> (not res!1018138) (not e!838951))))

(assert (=> b!1497654 (= res!1018138 (not e!838949))))

(declare-fun res!1018139 () Bool)

(assert (=> b!1497654 (=> (not res!1018139) (not e!838949))))

(assert (=> b!1497654 (= res!1018139 (validKeyInArray!0 (select (arr!48214 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1497655 () Bool)

(assert (=> b!1497655 (= e!838950 call!68118)))

(assert (= (and d!157823 (not res!1018140)) b!1497654))

(assert (= (and b!1497654 res!1018139) b!1497651))

(assert (= (and b!1497654 res!1018138) b!1497652))

(assert (= (and b!1497652 c!139300) b!1497655))

(assert (= (and b!1497652 (not c!139300)) b!1497653))

(assert (= (or b!1497655 b!1497653) bm!68115))

(declare-fun m!1381017 () Bool)

(assert (=> b!1497651 m!1381017))

(assert (=> b!1497651 m!1381017))

(declare-fun m!1381019 () Bool)

(assert (=> b!1497651 m!1381019))

(assert (=> b!1497652 m!1381017))

(assert (=> b!1497652 m!1381017))

(declare-fun m!1381021 () Bool)

(assert (=> b!1497652 m!1381021))

(assert (=> bm!68115 m!1381017))

(declare-fun m!1381023 () Bool)

(assert (=> bm!68115 m!1381023))

(assert (=> b!1497654 m!1381017))

(assert (=> b!1497654 m!1381017))

(assert (=> b!1497654 m!1381021))

(assert (=> b!1497385 d!157823))

(declare-fun b!1497669 () Bool)

(declare-fun e!838961 () SeekEntryResult!12351)

(declare-fun e!838960 () SeekEntryResult!12351)

(assert (=> b!1497669 (= e!838961 e!838960)))

(declare-fun c!139307 () Bool)

(declare-fun lt!652561 () (_ BitVec 64))

(assert (=> b!1497669 (= c!139307 (= lt!652561 lt!652466))))

(declare-fun b!1497670 () Bool)

(declare-fun c!139308 () Bool)

(assert (=> b!1497670 (= c!139308 (= lt!652561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838959 () SeekEntryResult!12351)

(assert (=> b!1497670 (= e!838960 e!838959)))

(declare-fun b!1497671 () Bool)

(assert (=> b!1497671 (= e!838959 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652467 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687))))

(declare-fun b!1497668 () Bool)

(assert (=> b!1497668 (= e!838960 (Found!12351 lt!652467))))

(declare-fun lt!652562 () SeekEntryResult!12351)

(declare-fun d!157825 () Bool)

(assert (=> d!157825 (and (or ((_ is Undefined!12351) lt!652562) (not ((_ is Found!12351) lt!652562)) (and (bvsge (index!51797 lt!652562) #b00000000000000000000000000000000) (bvslt (index!51797 lt!652562) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652562) ((_ is Found!12351) lt!652562) (not ((_ is MissingVacant!12351) lt!652562)) (not (= (index!51799 lt!652562) intermediateAfterIndex!19)) (and (bvsge (index!51799 lt!652562) #b00000000000000000000000000000000) (bvslt (index!51799 lt!652562) (size!48765 lt!652463)))) (or ((_ is Undefined!12351) lt!652562) (ite ((_ is Found!12351) lt!652562) (= (select (arr!48214 lt!652463) (index!51797 lt!652562)) lt!652466) (and ((_ is MissingVacant!12351) lt!652562) (= (index!51799 lt!652562) intermediateAfterIndex!19) (= (select (arr!48214 lt!652463) (index!51799 lt!652562)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157825 (= lt!652562 e!838961)))

(declare-fun c!139309 () Bool)

(assert (=> d!157825 (= c!139309 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157825 (= lt!652561 (select (arr!48214 lt!652463) lt!652467))))

(assert (=> d!157825 (validMask!0 mask!2687)))

(assert (=> d!157825 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 intermediateAfterIndex!19 lt!652466 lt!652463 mask!2687) lt!652562)))

(declare-fun b!1497672 () Bool)

(assert (=> b!1497672 (= e!838959 (MissingVacant!12351 intermediateAfterIndex!19))))

(declare-fun b!1497673 () Bool)

(assert (=> b!1497673 (= e!838961 Undefined!12351)))

(assert (= (and d!157825 c!139309) b!1497673))

(assert (= (and d!157825 (not c!139309)) b!1497669))

(assert (= (and b!1497669 c!139307) b!1497668))

(assert (= (and b!1497669 (not c!139307)) b!1497670))

(assert (= (and b!1497670 c!139308) b!1497672))

(assert (= (and b!1497670 (not c!139308)) b!1497671))

(assert (=> b!1497671 m!1380955))

(assert (=> b!1497671 m!1380955))

(declare-fun m!1381025 () Bool)

(assert (=> b!1497671 m!1381025))

(declare-fun m!1381027 () Bool)

(assert (=> d!157825 m!1381027))

(declare-fun m!1381029 () Bool)

(assert (=> d!157825 m!1381029))

(assert (=> d!157825 m!1380961))

(assert (=> d!157825 m!1380797))

(assert (=> b!1497376 d!157825))

(assert (=> b!1497376 d!157807))

(declare-fun b!1497674 () Bool)

(declare-fun e!838966 () SeekEntryResult!12351)

(assert (=> b!1497674 (= e!838966 (Intermediate!12351 true lt!652467 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1497675 () Bool)

(declare-fun e!838964 () SeekEntryResult!12351)

(assert (=> b!1497675 (= e!838966 e!838964)))

(declare-fun c!139312 () Bool)

(declare-fun lt!652564 () (_ BitVec 64))

(assert (=> b!1497675 (= c!139312 (or (= lt!652564 (select (arr!48214 a!2862) j!93)) (= (bvadd lt!652564 lt!652564) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1497676 () Bool)

(declare-fun e!838965 () Bool)

(declare-fun lt!652563 () SeekEntryResult!12351)

(assert (=> b!1497676 (= e!838965 (bvsge (x!133600 lt!652563) #b01111111111111111111111111111110))))

(declare-fun b!1497677 () Bool)

(declare-fun e!838962 () Bool)

(assert (=> b!1497677 (= e!838965 e!838962)))

(declare-fun res!1018143 () Bool)

(assert (=> b!1497677 (= res!1018143 (and ((_ is Intermediate!12351) lt!652563) (not (undefined!13163 lt!652563)) (bvslt (x!133600 lt!652563) #b01111111111111111111111111111110) (bvsge (x!133600 lt!652563) #b00000000000000000000000000000000) (bvsge (x!133600 lt!652563) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1497677 (=> (not res!1018143) (not e!838962))))

(declare-fun d!157827 () Bool)

(assert (=> d!157827 e!838965))

(declare-fun c!139310 () Bool)

(assert (=> d!157827 (= c!139310 (and ((_ is Intermediate!12351) lt!652563) (undefined!13163 lt!652563)))))

(assert (=> d!157827 (= lt!652563 e!838966)))

(declare-fun c!139311 () Bool)

(assert (=> d!157827 (= c!139311 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157827 (= lt!652564 (select (arr!48214 a!2862) lt!652467))))

(assert (=> d!157827 (validMask!0 mask!2687)))

(assert (=> d!157827 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652467 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652563)))

(declare-fun b!1497678 () Bool)

(assert (=> b!1497678 (= e!838964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!652467 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497679 () Bool)

(assert (=> b!1497679 (and (bvsge (index!51798 lt!652563) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652563) (size!48765 a!2862)))))

(declare-fun e!838963 () Bool)

(assert (=> b!1497679 (= e!838963 (= (select (arr!48214 a!2862) (index!51798 lt!652563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497680 () Bool)

(assert (=> b!1497680 (and (bvsge (index!51798 lt!652563) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652563) (size!48765 a!2862)))))

(declare-fun res!1018141 () Bool)

(assert (=> b!1497680 (= res!1018141 (= (select (arr!48214 a!2862) (index!51798 lt!652563)) (select (arr!48214 a!2862) j!93)))))

(assert (=> b!1497680 (=> res!1018141 e!838963)))

(assert (=> b!1497680 (= e!838962 e!838963)))

(declare-fun b!1497681 () Bool)

(assert (=> b!1497681 (= e!838964 (Intermediate!12351 false lt!652467 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1497682 () Bool)

(assert (=> b!1497682 (and (bvsge (index!51798 lt!652563) #b00000000000000000000000000000000) (bvslt (index!51798 lt!652563) (size!48765 a!2862)))))

(declare-fun res!1018142 () Bool)

(assert (=> b!1497682 (= res!1018142 (= (select (arr!48214 a!2862) (index!51798 lt!652563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497682 (=> res!1018142 e!838963)))

(assert (= (and d!157827 c!139311) b!1497674))

(assert (= (and d!157827 (not c!139311)) b!1497675))

(assert (= (and b!1497675 c!139312) b!1497681))

(assert (= (and b!1497675 (not c!139312)) b!1497678))

(assert (= (and d!157827 c!139310) b!1497676))

(assert (= (and d!157827 (not c!139310)) b!1497677))

(assert (= (and b!1497677 res!1018143) b!1497680))

(assert (= (and b!1497680 (not res!1018141)) b!1497682))

(assert (= (and b!1497682 (not res!1018142)) b!1497679))

(assert (=> b!1497678 m!1380955))

(assert (=> b!1497678 m!1380955))

(assert (=> b!1497678 m!1380787))

(declare-fun m!1381031 () Bool)

(assert (=> b!1497678 m!1381031))

(declare-fun m!1381033 () Bool)

(assert (=> b!1497682 m!1381033))

(assert (=> b!1497680 m!1381033))

(assert (=> b!1497679 m!1381033))

(declare-fun m!1381035 () Bool)

(assert (=> d!157827 m!1381035))

(assert (=> d!157827 m!1380797))

(assert (=> b!1497383 d!157827))

(declare-fun b!1497683 () Bool)

(declare-fun e!838969 () Bool)

(declare-fun call!68119 () Bool)

(assert (=> b!1497683 (= e!838969 call!68119)))

(declare-fun b!1497684 () Bool)

(declare-fun e!838967 () Bool)

(declare-fun e!838968 () Bool)

(assert (=> b!1497684 (= e!838967 e!838968)))

(declare-fun c!139313 () Bool)

(assert (=> b!1497684 (= c!139313 (validKeyInArray!0 (select (arr!48214 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68116 () Bool)

(assert (=> bm!68116 (= call!68119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1497685 () Bool)

(assert (=> b!1497685 (= e!838968 e!838969)))

(declare-fun lt!652565 () (_ BitVec 64))

(assert (=> b!1497685 (= lt!652565 (select (arr!48214 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!652567 () Unit!50075)

(assert (=> b!1497685 (= lt!652567 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652565 #b00000000000000000000000000000000))))

(assert (=> b!1497685 (arrayContainsKey!0 a!2862 lt!652565 #b00000000000000000000000000000000)))

(declare-fun lt!652566 () Unit!50075)

(assert (=> b!1497685 (= lt!652566 lt!652567)))

(declare-fun res!1018144 () Bool)

(assert (=> b!1497685 (= res!1018144 (= (seekEntryOrOpen!0 (select (arr!48214 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12351 #b00000000000000000000000000000000)))))

(assert (=> b!1497685 (=> (not res!1018144) (not e!838969))))

(declare-fun b!1497686 () Bool)

(assert (=> b!1497686 (= e!838968 call!68119)))

(declare-fun d!157829 () Bool)

(declare-fun res!1018145 () Bool)

(assert (=> d!157829 (=> res!1018145 e!838967)))

(assert (=> d!157829 (= res!1018145 (bvsge #b00000000000000000000000000000000 (size!48765 a!2862)))))

(assert (=> d!157829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!838967)))

(assert (= (and d!157829 (not res!1018145)) b!1497684))

(assert (= (and b!1497684 c!139313) b!1497685))

(assert (= (and b!1497684 (not c!139313)) b!1497686))

(assert (= (and b!1497685 res!1018144) b!1497683))

(assert (= (or b!1497683 b!1497686) bm!68116))

(assert (=> b!1497684 m!1381017))

(assert (=> b!1497684 m!1381017))

(assert (=> b!1497684 m!1381021))

(declare-fun m!1381037 () Bool)

(assert (=> bm!68116 m!1381037))

(assert (=> b!1497685 m!1381017))

(declare-fun m!1381039 () Bool)

(assert (=> b!1497685 m!1381039))

(declare-fun m!1381041 () Bool)

(assert (=> b!1497685 m!1381041))

(assert (=> b!1497685 m!1381017))

(declare-fun m!1381043 () Bool)

(assert (=> b!1497685 m!1381043))

(assert (=> b!1497372 d!157829))

(declare-fun b!1497687 () Bool)

(declare-fun e!838972 () SeekEntryResult!12351)

(assert (=> b!1497687 (= e!838972 Undefined!12351)))

(declare-fun b!1497688 () Bool)

(declare-fun c!139316 () Bool)

(declare-fun lt!652568 () (_ BitVec 64))

(assert (=> b!1497688 (= c!139316 (= lt!652568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838970 () SeekEntryResult!12351)

(declare-fun e!838971 () SeekEntryResult!12351)

(assert (=> b!1497688 (= e!838970 e!838971)))

(declare-fun d!157831 () Bool)

(declare-fun lt!652570 () SeekEntryResult!12351)

(assert (=> d!157831 (and (or ((_ is Undefined!12351) lt!652570) (not ((_ is Found!12351) lt!652570)) (and (bvsge (index!51797 lt!652570) #b00000000000000000000000000000000) (bvslt (index!51797 lt!652570) (size!48765 a!2862)))) (or ((_ is Undefined!12351) lt!652570) ((_ is Found!12351) lt!652570) (not ((_ is MissingZero!12351) lt!652570)) (and (bvsge (index!51796 lt!652570) #b00000000000000000000000000000000) (bvslt (index!51796 lt!652570) (size!48765 a!2862)))) (or ((_ is Undefined!12351) lt!652570) ((_ is Found!12351) lt!652570) ((_ is MissingZero!12351) lt!652570) (not ((_ is MissingVacant!12351) lt!652570)) (and (bvsge (index!51799 lt!652570) #b00000000000000000000000000000000) (bvslt (index!51799 lt!652570) (size!48765 a!2862)))) (or ((_ is Undefined!12351) lt!652570) (ite ((_ is Found!12351) lt!652570) (= (select (arr!48214 a!2862) (index!51797 lt!652570)) (select (arr!48214 a!2862) j!93)) (ite ((_ is MissingZero!12351) lt!652570) (= (select (arr!48214 a!2862) (index!51796 lt!652570)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12351) lt!652570) (= (select (arr!48214 a!2862) (index!51799 lt!652570)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157831 (= lt!652570 e!838972)))

(declare-fun c!139314 () Bool)

(declare-fun lt!652569 () SeekEntryResult!12351)

(assert (=> d!157831 (= c!139314 (and ((_ is Intermediate!12351) lt!652569) (undefined!13163 lt!652569)))))

(assert (=> d!157831 (= lt!652569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48214 a!2862) j!93) mask!2687) (select (arr!48214 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157831 (validMask!0 mask!2687)))

(assert (=> d!157831 (= (seekEntryOrOpen!0 (select (arr!48214 a!2862) j!93) a!2862 mask!2687) lt!652570)))

(declare-fun b!1497689 () Bool)

(assert (=> b!1497689 (= e!838970 (Found!12351 (index!51798 lt!652569)))))

(declare-fun b!1497690 () Bool)

(assert (=> b!1497690 (= e!838972 e!838970)))

(assert (=> b!1497690 (= lt!652568 (select (arr!48214 a!2862) (index!51798 lt!652569)))))

(declare-fun c!139315 () Bool)

(assert (=> b!1497690 (= c!139315 (= lt!652568 (select (arr!48214 a!2862) j!93)))))

(declare-fun b!1497691 () Bool)

(assert (=> b!1497691 (= e!838971 (seekKeyOrZeroReturnVacant!0 (x!133600 lt!652569) (index!51798 lt!652569) (index!51798 lt!652569) (select (arr!48214 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1497692 () Bool)

(assert (=> b!1497692 (= e!838971 (MissingZero!12351 (index!51798 lt!652569)))))

(assert (= (and d!157831 c!139314) b!1497687))

(assert (= (and d!157831 (not c!139314)) b!1497690))

(assert (= (and b!1497690 c!139315) b!1497689))

(assert (= (and b!1497690 (not c!139315)) b!1497688))

(assert (= (and b!1497688 c!139316) b!1497692))

(assert (= (and b!1497688 (not c!139316)) b!1497691))

(assert (=> d!157831 m!1380787))

(assert (=> d!157831 m!1380833))

(declare-fun m!1381045 () Bool)

(assert (=> d!157831 m!1381045))

(assert (=> d!157831 m!1380797))

(declare-fun m!1381047 () Bool)

(assert (=> d!157831 m!1381047))

(declare-fun m!1381049 () Bool)

(assert (=> d!157831 m!1381049))

(assert (=> d!157831 m!1380833))

(assert (=> d!157831 m!1380787))

(assert (=> d!157831 m!1380835))

(declare-fun m!1381051 () Bool)

(assert (=> b!1497690 m!1381051))

(assert (=> b!1497691 m!1380787))

(declare-fun m!1381053 () Bool)

(assert (=> b!1497691 m!1381053))

(assert (=> b!1497373 d!157831))

(check-sat (not b!1497584) (not d!157803) (not d!157825) (not d!157789) (not b!1497566) (not b!1497567) (not b!1497627) (not b!1497678) (not b!1497684) (not b!1497609) (not b!1497691) (not b!1497652) (not b!1497603) (not d!157805) (not b!1497685) (not b!1497618) (not d!157811) (not b!1497651) (not d!157793) (not b!1497636) (not d!157819) (not d!157807) (not b!1497654) (not d!157831) (not d!157827) (not bm!68116) (not b!1497552) (not d!157817) (not b!1497671) (not d!157809) (not bm!68112) (not bm!68115))
(check-sat)
