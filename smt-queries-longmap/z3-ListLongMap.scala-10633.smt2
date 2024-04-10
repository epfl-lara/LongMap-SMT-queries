; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124938 () Bool)

(assert start!124938)

(declare-fun b!1451951 () Bool)

(declare-fun res!983127 () Bool)

(declare-fun e!817436 () Bool)

(assert (=> b!1451951 (=> (not res!983127) (not e!817436))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98386 0))(
  ( (array!98387 (arr!47481 (Array (_ BitVec 32) (_ BitVec 64))) (size!48031 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98386)

(assert (=> b!1451951 (= res!983127 (and (= (size!48031 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48031 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48031 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817438 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1451952 () Bool)

(assert (=> b!1451952 (= e!817438 (not (or (and (= (select (arr!47481 a!2862) index!646) (select (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47481 a!2862) index!646) (select (arr!47481 a!2862) j!93))) (= (select (arr!47481 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817434 () Bool)

(assert (=> b!1451952 e!817434))

(declare-fun res!983134 () Bool)

(assert (=> b!1451952 (=> (not res!983134) (not e!817434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98386 (_ BitVec 32)) Bool)

(assert (=> b!1451952 (= res!983134 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48962 0))(
  ( (Unit!48963) )
))
(declare-fun lt!636801 () Unit!48962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48962)

(assert (=> b!1451952 (= lt!636801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451953 () Bool)

(declare-fun res!983132 () Bool)

(assert (=> b!1451953 (=> (not res!983132) (not e!817436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451953 (= res!983132 (validKeyInArray!0 (select (arr!47481 a!2862) i!1006)))))

(declare-datatypes ((SeekEntryResult!11733 0))(
  ( (MissingZero!11733 (index!49324 (_ BitVec 32))) (Found!11733 (index!49325 (_ BitVec 32))) (Intermediate!11733 (undefined!12545 Bool) (index!49326 (_ BitVec 32)) (x!130974 (_ BitVec 32))) (Undefined!11733) (MissingVacant!11733 (index!49327 (_ BitVec 32))) )
))
(declare-fun lt!636800 () SeekEntryResult!11733)

(declare-fun lt!636804 () array!98386)

(declare-fun b!1451954 () Bool)

(declare-fun e!817437 () Bool)

(declare-fun lt!636802 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11733)

(assert (=> b!1451954 (= e!817437 (= lt!636800 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636802 lt!636804 mask!2687)))))

(declare-fun res!983128 () Bool)

(assert (=> start!124938 (=> (not res!983128) (not e!817436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124938 (= res!983128 (validMask!0 mask!2687))))

(assert (=> start!124938 e!817436))

(assert (=> start!124938 true))

(declare-fun array_inv!36509 (array!98386) Bool)

(assert (=> start!124938 (array_inv!36509 a!2862)))

(declare-fun b!1451955 () Bool)

(declare-fun res!983129 () Bool)

(assert (=> b!1451955 (=> (not res!983129) (not e!817438))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451955 (= res!983129 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451956 () Bool)

(declare-fun e!817439 () Bool)

(assert (=> b!1451956 (= e!817436 e!817439)))

(declare-fun res!983133 () Bool)

(assert (=> b!1451956 (=> (not res!983133) (not e!817439))))

(assert (=> b!1451956 (= res!983133 (= (select (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451956 (= lt!636804 (array!98387 (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48031 a!2862)))))

(declare-fun b!1451957 () Bool)

(declare-fun res!983130 () Bool)

(assert (=> b!1451957 (=> (not res!983130) (not e!817436))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451957 (= res!983130 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48031 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48031 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48031 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451958 () Bool)

(assert (=> b!1451958 (= e!817434 (and (or (= (select (arr!47481 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47481 a!2862) intermediateBeforeIndex!19) (select (arr!47481 a!2862) j!93))) (or (and (= (select (arr!47481 a!2862) index!646) (select (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47481 a!2862) index!646) (select (arr!47481 a!2862) j!93))) (= (select (arr!47481 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451959 () Bool)

(declare-fun e!817433 () Bool)

(assert (=> b!1451959 (= e!817439 e!817433)))

(declare-fun res!983131 () Bool)

(assert (=> b!1451959 (=> (not res!983131) (not e!817433))))

(declare-fun lt!636803 () SeekEntryResult!11733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451959 (= res!983131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47481 a!2862) j!93) mask!2687) (select (arr!47481 a!2862) j!93) a!2862 mask!2687) lt!636803))))

(assert (=> b!1451959 (= lt!636803 (Intermediate!11733 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451960 () Bool)

(declare-fun res!983136 () Bool)

(assert (=> b!1451960 (=> (not res!983136) (not e!817433))))

(assert (=> b!1451960 (= res!983136 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47481 a!2862) j!93) a!2862 mask!2687) lt!636803))))

(declare-fun b!1451961 () Bool)

(declare-fun res!983137 () Bool)

(assert (=> b!1451961 (=> (not res!983137) (not e!817436))))

(assert (=> b!1451961 (= res!983137 (validKeyInArray!0 (select (arr!47481 a!2862) j!93)))))

(declare-fun b!1451962 () Bool)

(declare-fun res!983139 () Bool)

(assert (=> b!1451962 (=> (not res!983139) (not e!817438))))

(assert (=> b!1451962 (= res!983139 e!817437)))

(declare-fun c!133923 () Bool)

(assert (=> b!1451962 (= c!133923 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451963 () Bool)

(declare-fun res!983140 () Bool)

(assert (=> b!1451963 (=> (not res!983140) (not e!817436))))

(declare-datatypes ((List!33982 0))(
  ( (Nil!33979) (Cons!33978 (h!35328 (_ BitVec 64)) (t!48676 List!33982)) )
))
(declare-fun arrayNoDuplicates!0 (array!98386 (_ BitVec 32) List!33982) Bool)

(assert (=> b!1451963 (= res!983140 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33979))))

(declare-fun b!1451964 () Bool)

(declare-fun res!983126 () Bool)

(assert (=> b!1451964 (=> (not res!983126) (not e!817434))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11733)

(assert (=> b!1451964 (= res!983126 (= (seekEntryOrOpen!0 (select (arr!47481 a!2862) j!93) a!2862 mask!2687) (Found!11733 j!93)))))

(declare-fun b!1451965 () Bool)

(assert (=> b!1451965 (= e!817433 e!817438)))

(declare-fun res!983138 () Bool)

(assert (=> b!1451965 (=> (not res!983138) (not e!817438))))

(assert (=> b!1451965 (= res!983138 (= lt!636800 (Intermediate!11733 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451965 (= lt!636800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636802 mask!2687) lt!636802 lt!636804 mask!2687))))

(assert (=> b!1451965 (= lt!636802 (select (store (arr!47481 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451966 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11733)

(assert (=> b!1451966 (= e!817437 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636802 lt!636804 mask!2687) (seekEntryOrOpen!0 lt!636802 lt!636804 mask!2687)))))

(declare-fun b!1451967 () Bool)

(declare-fun res!983135 () Bool)

(assert (=> b!1451967 (=> (not res!983135) (not e!817436))))

(assert (=> b!1451967 (= res!983135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124938 res!983128) b!1451951))

(assert (= (and b!1451951 res!983127) b!1451953))

(assert (= (and b!1451953 res!983132) b!1451961))

(assert (= (and b!1451961 res!983137) b!1451967))

(assert (= (and b!1451967 res!983135) b!1451963))

(assert (= (and b!1451963 res!983140) b!1451957))

(assert (= (and b!1451957 res!983130) b!1451956))

(assert (= (and b!1451956 res!983133) b!1451959))

(assert (= (and b!1451959 res!983131) b!1451960))

(assert (= (and b!1451960 res!983136) b!1451965))

(assert (= (and b!1451965 res!983138) b!1451962))

(assert (= (and b!1451962 c!133923) b!1451954))

(assert (= (and b!1451962 (not c!133923)) b!1451966))

(assert (= (and b!1451962 res!983139) b!1451955))

(assert (= (and b!1451955 res!983129) b!1451952))

(assert (= (and b!1451952 res!983134) b!1451964))

(assert (= (and b!1451964 res!983126) b!1451958))

(declare-fun m!1340535 () Bool)

(assert (=> b!1451967 m!1340535))

(declare-fun m!1340537 () Bool)

(assert (=> b!1451954 m!1340537))

(declare-fun m!1340539 () Bool)

(assert (=> b!1451960 m!1340539))

(assert (=> b!1451960 m!1340539))

(declare-fun m!1340541 () Bool)

(assert (=> b!1451960 m!1340541))

(declare-fun m!1340543 () Bool)

(assert (=> b!1451963 m!1340543))

(declare-fun m!1340545 () Bool)

(assert (=> b!1451958 m!1340545))

(declare-fun m!1340547 () Bool)

(assert (=> b!1451958 m!1340547))

(declare-fun m!1340549 () Bool)

(assert (=> b!1451958 m!1340549))

(declare-fun m!1340551 () Bool)

(assert (=> b!1451958 m!1340551))

(assert (=> b!1451958 m!1340539))

(assert (=> b!1451961 m!1340539))

(assert (=> b!1451961 m!1340539))

(declare-fun m!1340553 () Bool)

(assert (=> b!1451961 m!1340553))

(assert (=> b!1451956 m!1340545))

(declare-fun m!1340555 () Bool)

(assert (=> b!1451956 m!1340555))

(declare-fun m!1340557 () Bool)

(assert (=> b!1451952 m!1340557))

(assert (=> b!1451952 m!1340545))

(assert (=> b!1451952 m!1340549))

(assert (=> b!1451952 m!1340551))

(declare-fun m!1340559 () Bool)

(assert (=> b!1451952 m!1340559))

(assert (=> b!1451952 m!1340539))

(declare-fun m!1340561 () Bool)

(assert (=> start!124938 m!1340561))

(declare-fun m!1340563 () Bool)

(assert (=> start!124938 m!1340563))

(assert (=> b!1451964 m!1340539))

(assert (=> b!1451964 m!1340539))

(declare-fun m!1340565 () Bool)

(assert (=> b!1451964 m!1340565))

(assert (=> b!1451959 m!1340539))

(assert (=> b!1451959 m!1340539))

(declare-fun m!1340567 () Bool)

(assert (=> b!1451959 m!1340567))

(assert (=> b!1451959 m!1340567))

(assert (=> b!1451959 m!1340539))

(declare-fun m!1340569 () Bool)

(assert (=> b!1451959 m!1340569))

(declare-fun m!1340571 () Bool)

(assert (=> b!1451966 m!1340571))

(declare-fun m!1340573 () Bool)

(assert (=> b!1451966 m!1340573))

(declare-fun m!1340575 () Bool)

(assert (=> b!1451953 m!1340575))

(assert (=> b!1451953 m!1340575))

(declare-fun m!1340577 () Bool)

(assert (=> b!1451953 m!1340577))

(declare-fun m!1340579 () Bool)

(assert (=> b!1451965 m!1340579))

(assert (=> b!1451965 m!1340579))

(declare-fun m!1340581 () Bool)

(assert (=> b!1451965 m!1340581))

(assert (=> b!1451965 m!1340545))

(declare-fun m!1340583 () Bool)

(assert (=> b!1451965 m!1340583))

(check-sat (not b!1451960) (not b!1451959) (not b!1451963) (not b!1451961) (not b!1451953) (not b!1451964) (not b!1451965) (not b!1451954) (not start!124938) (not b!1451967) (not b!1451952) (not b!1451966))
(check-sat)
