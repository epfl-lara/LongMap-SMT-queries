; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125902 () Bool)

(assert start!125902)

(declare-fun b!1474051 () Bool)

(declare-fun e!827107 () Bool)

(declare-fun e!827108 () Bool)

(assert (=> b!1474051 (= e!827107 e!827108)))

(declare-fun res!1001300 () Bool)

(assert (=> b!1474051 (=> (not res!1001300) (not e!827108))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12113 0))(
  ( (MissingZero!12113 (index!50844 (_ BitVec 32))) (Found!12113 (index!50845 (_ BitVec 32))) (Intermediate!12113 (undefined!12925 Bool) (index!50846 (_ BitVec 32)) (x!132429 (_ BitVec 32))) (Undefined!12113) (MissingVacant!12113 (index!50847 (_ BitVec 32))) )
))
(declare-fun lt!644131 () SeekEntryResult!12113)

(assert (=> b!1474051 (= res!1001300 (= lt!644131 (Intermediate!12113 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644135 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99179 0))(
  ( (array!99180 (arr!47873 (Array (_ BitVec 32) (_ BitVec 64))) (size!48423 (_ BitVec 32))) )
))
(declare-fun lt!644132 () array!99179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99179 (_ BitVec 32)) SeekEntryResult!12113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474051 (= lt!644131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644135 mask!2687) lt!644135 lt!644132 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99179)

(assert (=> b!1474051 (= lt!644135 (select (store (arr!47873 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474052 () Bool)

(declare-fun res!1001305 () Bool)

(assert (=> b!1474052 (=> (not res!1001305) (not e!827107))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644133 () SeekEntryResult!12113)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474052 (= res!1001305 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47873 a!2862) j!93) a!2862 mask!2687) lt!644133))))

(declare-fun b!1474053 () Bool)

(declare-fun e!827111 () Bool)

(assert (=> b!1474053 (= e!827111 e!827107)))

(declare-fun res!1001311 () Bool)

(assert (=> b!1474053 (=> (not res!1001311) (not e!827107))))

(assert (=> b!1474053 (= res!1001311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47873 a!2862) j!93) mask!2687) (select (arr!47873 a!2862) j!93) a!2862 mask!2687) lt!644133))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474053 (= lt!644133 (Intermediate!12113 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474054 () Bool)

(declare-fun res!1001307 () Bool)

(declare-fun e!827109 () Bool)

(assert (=> b!1474054 (=> (not res!1001307) (not e!827109))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99179 (_ BitVec 32)) SeekEntryResult!12113)

(assert (=> b!1474054 (= res!1001307 (= (seekEntryOrOpen!0 (select (arr!47873 a!2862) j!93) a!2862 mask!2687) (Found!12113 j!93)))))

(declare-fun b!1474055 () Bool)

(declare-fun res!1001314 () Bool)

(declare-fun e!827112 () Bool)

(assert (=> b!1474055 (=> (not res!1001314) (not e!827112))))

(assert (=> b!1474055 (= res!1001314 (and (= (size!48423 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48423 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48423 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474056 () Bool)

(declare-fun res!1001299 () Bool)

(assert (=> b!1474056 (=> (not res!1001299) (not e!827112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474056 (= res!1001299 (validKeyInArray!0 (select (arr!47873 a!2862) j!93)))))

(declare-fun b!1474057 () Bool)

(declare-fun res!1001310 () Bool)

(assert (=> b!1474057 (=> (not res!1001310) (not e!827112))))

(declare-datatypes ((List!34374 0))(
  ( (Nil!34371) (Cons!34370 (h!35729 (_ BitVec 64)) (t!49068 List!34374)) )
))
(declare-fun arrayNoDuplicates!0 (array!99179 (_ BitVec 32) List!34374) Bool)

(assert (=> b!1474057 (= res!1001310 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34371))))

(declare-fun b!1474058 () Bool)

(assert (=> b!1474058 (= e!827112 e!827111)))

(declare-fun res!1001303 () Bool)

(assert (=> b!1474058 (=> (not res!1001303) (not e!827111))))

(assert (=> b!1474058 (= res!1001303 (= (select (store (arr!47873 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474058 (= lt!644132 (array!99180 (store (arr!47873 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48423 a!2862)))))

(declare-fun e!827113 () Bool)

(declare-fun b!1474059 () Bool)

(assert (=> b!1474059 (= e!827113 (= lt!644131 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644135 lt!644132 mask!2687)))))

(declare-fun b!1474060 () Bool)

(declare-fun e!827110 () Bool)

(assert (=> b!1474060 (= e!827110 true)))

(declare-fun lt!644136 () SeekEntryResult!12113)

(assert (=> b!1474060 (= lt!644136 (seekEntryOrOpen!0 lt!644135 lt!644132 mask!2687))))

(declare-fun b!1474061 () Bool)

(declare-fun res!1001301 () Bool)

(assert (=> b!1474061 (=> (not res!1001301) (not e!827108))))

(assert (=> b!1474061 (= res!1001301 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474062 () Bool)

(declare-fun res!1001308 () Bool)

(assert (=> b!1474062 (=> (not res!1001308) (not e!827112))))

(assert (=> b!1474062 (= res!1001308 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48423 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48423 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48423 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474063 () Bool)

(declare-fun res!1001313 () Bool)

(assert (=> b!1474063 (=> (not res!1001313) (not e!827112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99179 (_ BitVec 32)) Bool)

(assert (=> b!1474063 (= res!1001313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474064 () Bool)

(assert (=> b!1474064 (= e!827108 (not e!827110))))

(declare-fun res!1001306 () Bool)

(assert (=> b!1474064 (=> res!1001306 e!827110)))

(assert (=> b!1474064 (= res!1001306 (or (not (= (select (arr!47873 a!2862) index!646) (select (store (arr!47873 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47873 a!2862) index!646) (select (arr!47873 a!2862) j!93)))))))

(assert (=> b!1474064 e!827109))

(declare-fun res!1001309 () Bool)

(assert (=> b!1474064 (=> (not res!1001309) (not e!827109))))

(assert (=> b!1474064 (= res!1001309 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49566 0))(
  ( (Unit!49567) )
))
(declare-fun lt!644134 () Unit!49566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49566)

(assert (=> b!1474064 (= lt!644134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474065 () Bool)

(assert (=> b!1474065 (= e!827109 (or (= (select (arr!47873 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47873 a!2862) intermediateBeforeIndex!19) (select (arr!47873 a!2862) j!93))))))

(declare-fun b!1474066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99179 (_ BitVec 32)) SeekEntryResult!12113)

(assert (=> b!1474066 (= e!827113 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644135 lt!644132 mask!2687) (seekEntryOrOpen!0 lt!644135 lt!644132 mask!2687)))))

(declare-fun b!1474067 () Bool)

(declare-fun res!1001312 () Bool)

(assert (=> b!1474067 (=> (not res!1001312) (not e!827112))))

(assert (=> b!1474067 (= res!1001312 (validKeyInArray!0 (select (arr!47873 a!2862) i!1006)))))

(declare-fun res!1001304 () Bool)

(assert (=> start!125902 (=> (not res!1001304) (not e!827112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125902 (= res!1001304 (validMask!0 mask!2687))))

(assert (=> start!125902 e!827112))

(assert (=> start!125902 true))

(declare-fun array_inv!36901 (array!99179) Bool)

(assert (=> start!125902 (array_inv!36901 a!2862)))

(declare-fun b!1474068 () Bool)

(declare-fun res!1001302 () Bool)

(assert (=> b!1474068 (=> (not res!1001302) (not e!827108))))

(assert (=> b!1474068 (= res!1001302 e!827113)))

(declare-fun c!135891 () Bool)

(assert (=> b!1474068 (= c!135891 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125902 res!1001304) b!1474055))

(assert (= (and b!1474055 res!1001314) b!1474067))

(assert (= (and b!1474067 res!1001312) b!1474056))

(assert (= (and b!1474056 res!1001299) b!1474063))

(assert (= (and b!1474063 res!1001313) b!1474057))

(assert (= (and b!1474057 res!1001310) b!1474062))

(assert (= (and b!1474062 res!1001308) b!1474058))

(assert (= (and b!1474058 res!1001303) b!1474053))

(assert (= (and b!1474053 res!1001311) b!1474052))

(assert (= (and b!1474052 res!1001305) b!1474051))

(assert (= (and b!1474051 res!1001300) b!1474068))

(assert (= (and b!1474068 c!135891) b!1474059))

(assert (= (and b!1474068 (not c!135891)) b!1474066))

(assert (= (and b!1474068 res!1001302) b!1474061))

(assert (= (and b!1474061 res!1001301) b!1474064))

(assert (= (and b!1474064 res!1001309) b!1474054))

(assert (= (and b!1474054 res!1001307) b!1474065))

(assert (= (and b!1474064 (not res!1001306)) b!1474060))

(declare-fun m!1360531 () Bool)

(assert (=> b!1474067 m!1360531))

(assert (=> b!1474067 m!1360531))

(declare-fun m!1360533 () Bool)

(assert (=> b!1474067 m!1360533))

(declare-fun m!1360535 () Bool)

(assert (=> b!1474065 m!1360535))

(declare-fun m!1360537 () Bool)

(assert (=> b!1474065 m!1360537))

(declare-fun m!1360539 () Bool)

(assert (=> start!125902 m!1360539))

(declare-fun m!1360541 () Bool)

(assert (=> start!125902 m!1360541))

(declare-fun m!1360543 () Bool)

(assert (=> b!1474063 m!1360543))

(declare-fun m!1360545 () Bool)

(assert (=> b!1474059 m!1360545))

(assert (=> b!1474053 m!1360537))

(assert (=> b!1474053 m!1360537))

(declare-fun m!1360547 () Bool)

(assert (=> b!1474053 m!1360547))

(assert (=> b!1474053 m!1360547))

(assert (=> b!1474053 m!1360537))

(declare-fun m!1360549 () Bool)

(assert (=> b!1474053 m!1360549))

(declare-fun m!1360551 () Bool)

(assert (=> b!1474064 m!1360551))

(declare-fun m!1360553 () Bool)

(assert (=> b!1474064 m!1360553))

(declare-fun m!1360555 () Bool)

(assert (=> b!1474064 m!1360555))

(declare-fun m!1360557 () Bool)

(assert (=> b!1474064 m!1360557))

(declare-fun m!1360559 () Bool)

(assert (=> b!1474064 m!1360559))

(assert (=> b!1474064 m!1360537))

(assert (=> b!1474054 m!1360537))

(assert (=> b!1474054 m!1360537))

(declare-fun m!1360561 () Bool)

(assert (=> b!1474054 m!1360561))

(assert (=> b!1474058 m!1360553))

(declare-fun m!1360563 () Bool)

(assert (=> b!1474058 m!1360563))

(declare-fun m!1360565 () Bool)

(assert (=> b!1474066 m!1360565))

(declare-fun m!1360567 () Bool)

(assert (=> b!1474066 m!1360567))

(declare-fun m!1360569 () Bool)

(assert (=> b!1474051 m!1360569))

(assert (=> b!1474051 m!1360569))

(declare-fun m!1360571 () Bool)

(assert (=> b!1474051 m!1360571))

(assert (=> b!1474051 m!1360553))

(declare-fun m!1360573 () Bool)

(assert (=> b!1474051 m!1360573))

(declare-fun m!1360575 () Bool)

(assert (=> b!1474057 m!1360575))

(assert (=> b!1474052 m!1360537))

(assert (=> b!1474052 m!1360537))

(declare-fun m!1360577 () Bool)

(assert (=> b!1474052 m!1360577))

(assert (=> b!1474056 m!1360537))

(assert (=> b!1474056 m!1360537))

(declare-fun m!1360579 () Bool)

(assert (=> b!1474056 m!1360579))

(assert (=> b!1474060 m!1360567))

(push 1)

