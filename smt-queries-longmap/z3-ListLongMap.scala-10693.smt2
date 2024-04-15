; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125266 () Bool)

(assert start!125266)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640476 () (_ BitVec 32))

(declare-datatypes ((array!98692 0))(
  ( (array!98693 (arr!47635 (Array (_ BitVec 32) (_ BitVec 64))) (size!48187 (_ BitVec 32))) )
))
(declare-fun lt!640474 () array!98692)

(declare-datatypes ((SeekEntryResult!11912 0))(
  ( (MissingZero!11912 (index!50040 (_ BitVec 32))) (Found!11912 (index!50041 (_ BitVec 32))) (Intermediate!11912 (undefined!12724 Bool) (index!50042 (_ BitVec 32)) (x!131628 (_ BitVec 32))) (Undefined!11912) (MissingVacant!11912 (index!50043 (_ BitVec 32))) )
))
(declare-fun lt!640470 () SeekEntryResult!11912)

(declare-fun b!1463046 () Bool)

(declare-fun e!822316 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640473 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11912)

(assert (=> b!1463046 (= e!822316 (not (= lt!640470 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640476 lt!640473 lt!640474 mask!2687))))))

(declare-fun b!1463047 () Bool)

(declare-fun res!992460 () Bool)

(declare-fun e!822320 () Bool)

(assert (=> b!1463047 (=> (not res!992460) (not e!822320))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98692)

(assert (=> b!1463047 (= res!992460 (and (= (size!48187 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48187 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48187 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!992452 () Bool)

(assert (=> start!125266 (=> (not res!992452) (not e!822320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125266 (= res!992452 (validMask!0 mask!2687))))

(assert (=> start!125266 e!822320))

(assert (=> start!125266 true))

(declare-fun array_inv!36868 (array!98692) Bool)

(assert (=> start!125266 (array_inv!36868 a!2862)))

(declare-fun b!1463048 () Bool)

(declare-fun res!992455 () Bool)

(assert (=> b!1463048 (=> (not res!992455) (not e!822320))))

(declare-datatypes ((List!34214 0))(
  ( (Nil!34211) (Cons!34210 (h!35560 (_ BitVec 64)) (t!48900 List!34214)) )
))
(declare-fun arrayNoDuplicates!0 (array!98692 (_ BitVec 32) List!34214) Bool)

(assert (=> b!1463048 (= res!992455 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34211))))

(declare-fun b!1463049 () Bool)

(declare-fun e!822317 () Bool)

(declare-fun e!822323 () Bool)

(assert (=> b!1463049 (= e!822317 e!822323)))

(declare-fun res!992467 () Bool)

(assert (=> b!1463049 (=> res!992467 e!822323)))

(assert (=> b!1463049 (= res!992467 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640476 #b00000000000000000000000000000000) (bvsge lt!640476 (size!48187 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463049 (= lt!640476 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463050 () Bool)

(declare-fun res!992458 () Bool)

(declare-fun e!822322 () Bool)

(assert (=> b!1463050 (=> (not res!992458) (not e!822322))))

(declare-fun e!822318 () Bool)

(assert (=> b!1463050 (= res!992458 e!822318)))

(declare-fun c!134811 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463050 (= c!134811 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463051 () Bool)

(assert (=> b!1463051 (= e!822323 true)))

(declare-fun lt!640475 () Bool)

(assert (=> b!1463051 (= lt!640475 e!822316)))

(declare-fun c!134812 () Bool)

(assert (=> b!1463051 (= c!134812 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463052 () Bool)

(assert (=> b!1463052 (= e!822318 (= lt!640470 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640473 lt!640474 mask!2687)))))

(declare-fun b!1463053 () Bool)

(declare-fun res!992457 () Bool)

(assert (=> b!1463053 (=> res!992457 e!822323)))

(declare-fun lt!640472 () SeekEntryResult!11912)

(assert (=> b!1463053 (= res!992457 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640476 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640472)))))

(declare-fun b!1463054 () Bool)

(declare-fun e!822324 () Bool)

(assert (=> b!1463054 (= e!822324 e!822322)))

(declare-fun res!992462 () Bool)

(assert (=> b!1463054 (=> (not res!992462) (not e!822322))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463054 (= res!992462 (= lt!640470 (Intermediate!11912 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463054 (= lt!640470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640473 mask!2687) lt!640473 lt!640474 mask!2687))))

(assert (=> b!1463054 (= lt!640473 (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1463055 () Bool)

(declare-fun e!822319 () Bool)

(assert (=> b!1463055 (= e!822319 (or (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) (select (arr!47635 a!2862) j!93))))))

(declare-fun b!1463056 () Bool)

(declare-fun res!992456 () Bool)

(assert (=> b!1463056 (=> (not res!992456) (not e!822320))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463056 (= res!992456 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48187 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48187 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48187 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11912)

(assert (=> b!1463057 (= e!822316 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640476 intermediateAfterIndex!19 lt!640473 lt!640474 mask!2687) (seekEntryOrOpen!0 lt!640473 lt!640474 mask!2687))))))

(declare-fun b!1463058 () Bool)

(assert (=> b!1463058 (= e!822318 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640473 lt!640474 mask!2687) (seekEntryOrOpen!0 lt!640473 lt!640474 mask!2687)))))

(declare-fun b!1463059 () Bool)

(assert (=> b!1463059 (= e!822322 (not e!822317))))

(declare-fun res!992461 () Bool)

(assert (=> b!1463059 (=> res!992461 e!822317)))

(assert (=> b!1463059 (= res!992461 (or (and (= (select (arr!47635 a!2862) index!646) (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47635 a!2862) index!646) (select (arr!47635 a!2862) j!93))) (= (select (arr!47635 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463059 e!822319))

(declare-fun res!992451 () Bool)

(assert (=> b!1463059 (=> (not res!992451) (not e!822319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98692 (_ BitVec 32)) Bool)

(assert (=> b!1463059 (= res!992451 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49161 0))(
  ( (Unit!49162) )
))
(declare-fun lt!640471 () Unit!49161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49161)

(assert (=> b!1463059 (= lt!640471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463060 () Bool)

(declare-fun res!992464 () Bool)

(assert (=> b!1463060 (=> (not res!992464) (not e!822322))))

(assert (=> b!1463060 (= res!992464 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463061 () Bool)

(declare-fun res!992465 () Bool)

(assert (=> b!1463061 (=> (not res!992465) (not e!822324))))

(assert (=> b!1463061 (= res!992465 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640472))))

(declare-fun b!1463062 () Bool)

(declare-fun res!992454 () Bool)

(assert (=> b!1463062 (=> (not res!992454) (not e!822320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463062 (= res!992454 (validKeyInArray!0 (select (arr!47635 a!2862) j!93)))))

(declare-fun b!1463063 () Bool)

(declare-fun res!992459 () Bool)

(assert (=> b!1463063 (=> (not res!992459) (not e!822320))))

(assert (=> b!1463063 (= res!992459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463064 () Bool)

(declare-fun res!992453 () Bool)

(assert (=> b!1463064 (=> (not res!992453) (not e!822319))))

(assert (=> b!1463064 (= res!992453 (= (seekEntryOrOpen!0 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) (Found!11912 j!93)))))

(declare-fun b!1463065 () Bool)

(declare-fun res!992466 () Bool)

(assert (=> b!1463065 (=> (not res!992466) (not e!822320))))

(assert (=> b!1463065 (= res!992466 (validKeyInArray!0 (select (arr!47635 a!2862) i!1006)))))

(declare-fun b!1463066 () Bool)

(declare-fun e!822315 () Bool)

(assert (=> b!1463066 (= e!822320 e!822315)))

(declare-fun res!992450 () Bool)

(assert (=> b!1463066 (=> (not res!992450) (not e!822315))))

(assert (=> b!1463066 (= res!992450 (= (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463066 (= lt!640474 (array!98693 (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48187 a!2862)))))

(declare-fun b!1463067 () Bool)

(assert (=> b!1463067 (= e!822315 e!822324)))

(declare-fun res!992463 () Bool)

(assert (=> b!1463067 (=> (not res!992463) (not e!822324))))

(assert (=> b!1463067 (= res!992463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47635 a!2862) j!93) mask!2687) (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640472))))

(assert (=> b!1463067 (= lt!640472 (Intermediate!11912 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125266 res!992452) b!1463047))

(assert (= (and b!1463047 res!992460) b!1463065))

(assert (= (and b!1463065 res!992466) b!1463062))

(assert (= (and b!1463062 res!992454) b!1463063))

(assert (= (and b!1463063 res!992459) b!1463048))

(assert (= (and b!1463048 res!992455) b!1463056))

(assert (= (and b!1463056 res!992456) b!1463066))

(assert (= (and b!1463066 res!992450) b!1463067))

(assert (= (and b!1463067 res!992463) b!1463061))

(assert (= (and b!1463061 res!992465) b!1463054))

(assert (= (and b!1463054 res!992462) b!1463050))

(assert (= (and b!1463050 c!134811) b!1463052))

(assert (= (and b!1463050 (not c!134811)) b!1463058))

(assert (= (and b!1463050 res!992458) b!1463060))

(assert (= (and b!1463060 res!992464) b!1463059))

(assert (= (and b!1463059 res!992451) b!1463064))

(assert (= (and b!1463064 res!992453) b!1463055))

(assert (= (and b!1463059 (not res!992461)) b!1463049))

(assert (= (and b!1463049 (not res!992467)) b!1463053))

(assert (= (and b!1463053 (not res!992457)) b!1463051))

(assert (= (and b!1463051 c!134812) b!1463046))

(assert (= (and b!1463051 (not c!134812)) b!1463057))

(declare-fun m!1349925 () Bool)

(assert (=> b!1463057 m!1349925))

(declare-fun m!1349927 () Bool)

(assert (=> b!1463057 m!1349927))

(declare-fun m!1349929 () Bool)

(assert (=> b!1463048 m!1349929))

(declare-fun m!1349931 () Bool)

(assert (=> b!1463046 m!1349931))

(declare-fun m!1349933 () Bool)

(assert (=> b!1463055 m!1349933))

(declare-fun m!1349935 () Bool)

(assert (=> b!1463055 m!1349935))

(assert (=> b!1463064 m!1349935))

(assert (=> b!1463064 m!1349935))

(declare-fun m!1349937 () Bool)

(assert (=> b!1463064 m!1349937))

(declare-fun m!1349939 () Bool)

(assert (=> b!1463059 m!1349939))

(declare-fun m!1349941 () Bool)

(assert (=> b!1463059 m!1349941))

(declare-fun m!1349943 () Bool)

(assert (=> b!1463059 m!1349943))

(declare-fun m!1349945 () Bool)

(assert (=> b!1463059 m!1349945))

(declare-fun m!1349947 () Bool)

(assert (=> b!1463059 m!1349947))

(assert (=> b!1463059 m!1349935))

(assert (=> b!1463062 m!1349935))

(assert (=> b!1463062 m!1349935))

(declare-fun m!1349949 () Bool)

(assert (=> b!1463062 m!1349949))

(declare-fun m!1349951 () Bool)

(assert (=> b!1463063 m!1349951))

(declare-fun m!1349953 () Bool)

(assert (=> b!1463054 m!1349953))

(assert (=> b!1463054 m!1349953))

(declare-fun m!1349955 () Bool)

(assert (=> b!1463054 m!1349955))

(assert (=> b!1463054 m!1349941))

(declare-fun m!1349957 () Bool)

(assert (=> b!1463054 m!1349957))

(assert (=> b!1463061 m!1349935))

(assert (=> b!1463061 m!1349935))

(declare-fun m!1349959 () Bool)

(assert (=> b!1463061 m!1349959))

(assert (=> b!1463067 m!1349935))

(assert (=> b!1463067 m!1349935))

(declare-fun m!1349961 () Bool)

(assert (=> b!1463067 m!1349961))

(assert (=> b!1463067 m!1349961))

(assert (=> b!1463067 m!1349935))

(declare-fun m!1349963 () Bool)

(assert (=> b!1463067 m!1349963))

(assert (=> b!1463066 m!1349941))

(declare-fun m!1349965 () Bool)

(assert (=> b!1463066 m!1349965))

(declare-fun m!1349967 () Bool)

(assert (=> b!1463065 m!1349967))

(assert (=> b!1463065 m!1349967))

(declare-fun m!1349969 () Bool)

(assert (=> b!1463065 m!1349969))

(assert (=> b!1463053 m!1349935))

(assert (=> b!1463053 m!1349935))

(declare-fun m!1349971 () Bool)

(assert (=> b!1463053 m!1349971))

(declare-fun m!1349973 () Bool)

(assert (=> start!125266 m!1349973))

(declare-fun m!1349975 () Bool)

(assert (=> start!125266 m!1349975))

(declare-fun m!1349977 () Bool)

(assert (=> b!1463049 m!1349977))

(declare-fun m!1349979 () Bool)

(assert (=> b!1463052 m!1349979))

(declare-fun m!1349981 () Bool)

(assert (=> b!1463058 m!1349981))

(assert (=> b!1463058 m!1349927))

(check-sat (not b!1463059) (not b!1463048) (not b!1463064) (not start!125266) (not b!1463052) (not b!1463053) (not b!1463057) (not b!1463063) (not b!1463058) (not b!1463049) (not b!1463061) (not b!1463067) (not b!1463046) (not b!1463065) (not b!1463062) (not b!1463054))
(check-sat)
