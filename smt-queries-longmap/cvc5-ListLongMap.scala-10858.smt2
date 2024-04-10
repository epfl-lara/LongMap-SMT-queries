; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127192 () Bool)

(assert start!127192)

(declare-fun b!1494831 () Bool)

(declare-fun res!1016932 () Bool)

(declare-fun e!837312 () Bool)

(assert (=> b!1494831 (=> (not res!1016932) (not e!837312))))

(declare-fun e!837316 () Bool)

(assert (=> b!1494831 (= res!1016932 e!837316)))

(declare-fun c!138489 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494831 (= c!138489 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494832 () Bool)

(declare-fun res!1016919 () Bool)

(declare-fun e!837313 () Bool)

(assert (=> b!1494832 (=> (not res!1016919) (not e!837313))))

(declare-datatypes ((SeekEntryResult!12395 0))(
  ( (MissingZero!12395 (index!51972 (_ BitVec 32))) (Found!12395 (index!51973 (_ BitVec 32))) (Intermediate!12395 (undefined!13207 Bool) (index!51974 (_ BitVec 32)) (x!133583 (_ BitVec 32))) (Undefined!12395) (MissingVacant!12395 (index!51975 (_ BitVec 32))) )
))
(declare-fun lt!651525 () SeekEntryResult!12395)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99776 0))(
  ( (array!99777 (arr!48155 (Array (_ BitVec 32) (_ BitVec 64))) (size!48705 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99776)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99776 (_ BitVec 32)) SeekEntryResult!12395)

(assert (=> b!1494832 (= res!1016919 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48155 a!2862) j!93) a!2862 mask!2687) lt!651525))))

(declare-fun b!1494833 () Bool)

(declare-fun res!1016925 () Bool)

(declare-fun e!837311 () Bool)

(assert (=> b!1494833 (=> (not res!1016925) (not e!837311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494833 (= res!1016925 (validKeyInArray!0 (select (arr!48155 a!2862) j!93)))))

(declare-fun b!1494834 () Bool)

(declare-fun e!837317 () Bool)

(declare-fun e!837315 () Bool)

(assert (=> b!1494834 (= e!837317 e!837315)))

(declare-fun res!1016926 () Bool)

(assert (=> b!1494834 (=> res!1016926 e!837315)))

(declare-fun lt!651529 () (_ BitVec 32))

(assert (=> b!1494834 (= res!1016926 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651529 #b00000000000000000000000000000000) (bvsge lt!651529 (size!48705 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494834 (= lt!651529 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1016917 () Bool)

(assert (=> start!127192 (=> (not res!1016917) (not e!837311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127192 (= res!1016917 (validMask!0 mask!2687))))

(assert (=> start!127192 e!837311))

(assert (=> start!127192 true))

(declare-fun array_inv!37183 (array!99776) Bool)

(assert (=> start!127192 (array_inv!37183 a!2862)))

(declare-fun b!1494835 () Bool)

(declare-fun e!837309 () Bool)

(assert (=> b!1494835 (= e!837309 e!837313)))

(declare-fun res!1016930 () Bool)

(assert (=> b!1494835 (=> (not res!1016930) (not e!837313))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494835 (= res!1016930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48155 a!2862) j!93) mask!2687) (select (arr!48155 a!2862) j!93) a!2862 mask!2687) lt!651525))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494835 (= lt!651525 (Intermediate!12395 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!651526 () (_ BitVec 64))

(declare-fun lt!651528 () SeekEntryResult!12395)

(declare-fun b!1494836 () Bool)

(declare-fun lt!651530 () array!99776)

(assert (=> b!1494836 (= e!837316 (= lt!651528 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651526 lt!651530 mask!2687)))))

(declare-fun b!1494837 () Bool)

(declare-fun res!1016931 () Bool)

(assert (=> b!1494837 (=> (not res!1016931) (not e!837311))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494837 (= res!1016931 (and (= (size!48705 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48705 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48705 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494838 () Bool)

(declare-fun res!1016921 () Bool)

(assert (=> b!1494838 (=> (not res!1016921) (not e!837311))))

(declare-datatypes ((List!34656 0))(
  ( (Nil!34653) (Cons!34652 (h!36044 (_ BitVec 64)) (t!49350 List!34656)) )
))
(declare-fun arrayNoDuplicates!0 (array!99776 (_ BitVec 32) List!34656) Bool)

(assert (=> b!1494838 (= res!1016921 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34653))))

(declare-fun b!1494839 () Bool)

(assert (=> b!1494839 (= e!837312 (not e!837317))))

(declare-fun res!1016920 () Bool)

(assert (=> b!1494839 (=> res!1016920 e!837317)))

(assert (=> b!1494839 (= res!1016920 (or (and (= (select (arr!48155 a!2862) index!646) (select (store (arr!48155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48155 a!2862) index!646) (select (arr!48155 a!2862) j!93))) (= (select (arr!48155 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!837314 () Bool)

(assert (=> b!1494839 e!837314))

(declare-fun res!1016928 () Bool)

(assert (=> b!1494839 (=> (not res!1016928) (not e!837314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99776 (_ BitVec 32)) Bool)

(assert (=> b!1494839 (= res!1016928 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50130 0))(
  ( (Unit!50131) )
))
(declare-fun lt!651527 () Unit!50130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50130)

(assert (=> b!1494839 (= lt!651527 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494840 () Bool)

(declare-fun res!1016927 () Bool)

(assert (=> b!1494840 (=> (not res!1016927) (not e!837311))))

(assert (=> b!1494840 (= res!1016927 (validKeyInArray!0 (select (arr!48155 a!2862) i!1006)))))

(declare-fun b!1494841 () Bool)

(assert (=> b!1494841 (= e!837311 e!837309)))

(declare-fun res!1016918 () Bool)

(assert (=> b!1494841 (=> (not res!1016918) (not e!837309))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1494841 (= res!1016918 (= (select (store (arr!48155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494841 (= lt!651530 (array!99777 (store (arr!48155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48705 a!2862)))))

(declare-fun b!1494842 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99776 (_ BitVec 32)) SeekEntryResult!12395)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99776 (_ BitVec 32)) SeekEntryResult!12395)

(assert (=> b!1494842 (= e!837316 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651526 lt!651530 mask!2687) (seekEntryOrOpen!0 lt!651526 lt!651530 mask!2687)))))

(declare-fun b!1494843 () Bool)

(assert (=> b!1494843 (= e!837315 true)))

(declare-fun lt!651531 () SeekEntryResult!12395)

(assert (=> b!1494843 (= lt!651531 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651529 (select (arr!48155 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494844 () Bool)

(assert (=> b!1494844 (= e!837314 (or (= (select (arr!48155 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48155 a!2862) intermediateBeforeIndex!19) (select (arr!48155 a!2862) j!93))))))

(declare-fun b!1494845 () Bool)

(declare-fun res!1016922 () Bool)

(assert (=> b!1494845 (=> (not res!1016922) (not e!837312))))

(assert (=> b!1494845 (= res!1016922 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494846 () Bool)

(declare-fun res!1016924 () Bool)

(assert (=> b!1494846 (=> (not res!1016924) (not e!837311))))

(assert (=> b!1494846 (= res!1016924 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48705 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48705 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48705 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494847 () Bool)

(assert (=> b!1494847 (= e!837313 e!837312)))

(declare-fun res!1016929 () Bool)

(assert (=> b!1494847 (=> (not res!1016929) (not e!837312))))

(assert (=> b!1494847 (= res!1016929 (= lt!651528 (Intermediate!12395 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1494847 (= lt!651528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651526 mask!2687) lt!651526 lt!651530 mask!2687))))

(assert (=> b!1494847 (= lt!651526 (select (store (arr!48155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494848 () Bool)

(declare-fun res!1016923 () Bool)

(assert (=> b!1494848 (=> (not res!1016923) (not e!837314))))

(assert (=> b!1494848 (= res!1016923 (= (seekEntryOrOpen!0 (select (arr!48155 a!2862) j!93) a!2862 mask!2687) (Found!12395 j!93)))))

(declare-fun b!1494849 () Bool)

(declare-fun res!1016916 () Bool)

(assert (=> b!1494849 (=> (not res!1016916) (not e!837311))))

(assert (=> b!1494849 (= res!1016916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127192 res!1016917) b!1494837))

(assert (= (and b!1494837 res!1016931) b!1494840))

(assert (= (and b!1494840 res!1016927) b!1494833))

(assert (= (and b!1494833 res!1016925) b!1494849))

(assert (= (and b!1494849 res!1016916) b!1494838))

(assert (= (and b!1494838 res!1016921) b!1494846))

(assert (= (and b!1494846 res!1016924) b!1494841))

(assert (= (and b!1494841 res!1016918) b!1494835))

(assert (= (and b!1494835 res!1016930) b!1494832))

(assert (= (and b!1494832 res!1016919) b!1494847))

(assert (= (and b!1494847 res!1016929) b!1494831))

(assert (= (and b!1494831 c!138489) b!1494836))

(assert (= (and b!1494831 (not c!138489)) b!1494842))

(assert (= (and b!1494831 res!1016932) b!1494845))

(assert (= (and b!1494845 res!1016922) b!1494839))

(assert (= (and b!1494839 res!1016928) b!1494848))

(assert (= (and b!1494848 res!1016923) b!1494844))

(assert (= (and b!1494839 (not res!1016920)) b!1494834))

(assert (= (and b!1494834 (not res!1016926)) b!1494843))

(declare-fun m!1378423 () Bool)

(assert (=> b!1494841 m!1378423))

(declare-fun m!1378425 () Bool)

(assert (=> b!1494841 m!1378425))

(declare-fun m!1378427 () Bool)

(assert (=> b!1494832 m!1378427))

(assert (=> b!1494832 m!1378427))

(declare-fun m!1378429 () Bool)

(assert (=> b!1494832 m!1378429))

(declare-fun m!1378431 () Bool)

(assert (=> start!127192 m!1378431))

(declare-fun m!1378433 () Bool)

(assert (=> start!127192 m!1378433))

(declare-fun m!1378435 () Bool)

(assert (=> b!1494838 m!1378435))

(assert (=> b!1494843 m!1378427))

(assert (=> b!1494843 m!1378427))

(declare-fun m!1378437 () Bool)

(assert (=> b!1494843 m!1378437))

(declare-fun m!1378439 () Bool)

(assert (=> b!1494844 m!1378439))

(assert (=> b!1494844 m!1378427))

(declare-fun m!1378441 () Bool)

(assert (=> b!1494836 m!1378441))

(assert (=> b!1494835 m!1378427))

(assert (=> b!1494835 m!1378427))

(declare-fun m!1378443 () Bool)

(assert (=> b!1494835 m!1378443))

(assert (=> b!1494835 m!1378443))

(assert (=> b!1494835 m!1378427))

(declare-fun m!1378445 () Bool)

(assert (=> b!1494835 m!1378445))

(assert (=> b!1494848 m!1378427))

(assert (=> b!1494848 m!1378427))

(declare-fun m!1378447 () Bool)

(assert (=> b!1494848 m!1378447))

(declare-fun m!1378449 () Bool)

(assert (=> b!1494847 m!1378449))

(assert (=> b!1494847 m!1378449))

(declare-fun m!1378451 () Bool)

(assert (=> b!1494847 m!1378451))

(assert (=> b!1494847 m!1378423))

(declare-fun m!1378453 () Bool)

(assert (=> b!1494847 m!1378453))

(declare-fun m!1378455 () Bool)

(assert (=> b!1494849 m!1378455))

(declare-fun m!1378457 () Bool)

(assert (=> b!1494842 m!1378457))

(declare-fun m!1378459 () Bool)

(assert (=> b!1494842 m!1378459))

(declare-fun m!1378461 () Bool)

(assert (=> b!1494839 m!1378461))

(assert (=> b!1494839 m!1378423))

(declare-fun m!1378463 () Bool)

(assert (=> b!1494839 m!1378463))

(declare-fun m!1378465 () Bool)

(assert (=> b!1494839 m!1378465))

(declare-fun m!1378467 () Bool)

(assert (=> b!1494839 m!1378467))

(assert (=> b!1494839 m!1378427))

(declare-fun m!1378469 () Bool)

(assert (=> b!1494840 m!1378469))

(assert (=> b!1494840 m!1378469))

(declare-fun m!1378471 () Bool)

(assert (=> b!1494840 m!1378471))

(declare-fun m!1378473 () Bool)

(assert (=> b!1494834 m!1378473))

(assert (=> b!1494833 m!1378427))

(assert (=> b!1494833 m!1378427))

(declare-fun m!1378475 () Bool)

(assert (=> b!1494833 m!1378475))

(push 1)

