; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125308 () Bool)

(assert start!125308)

(declare-fun b!1464432 () Bool)

(declare-fun res!993589 () Bool)

(declare-fun e!822951 () Bool)

(assert (=> b!1464432 (=> (not res!993589) (not e!822951))))

(declare-fun e!822945 () Bool)

(assert (=> b!1464432 (= res!993589 e!822945)))

(declare-fun c!134938 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464432 (= c!134938 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464433 () Bool)

(declare-fun res!993598 () Bool)

(assert (=> b!1464433 (=> (not res!993598) (not e!822951))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464433 (= res!993598 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((SeekEntryResult!11933 0))(
  ( (MissingZero!11933 (index!50124 (_ BitVec 32))) (Found!11933 (index!50125 (_ BitVec 32))) (Intermediate!11933 (undefined!12745 Bool) (index!50126 (_ BitVec 32)) (x!131705 (_ BitVec 32))) (Undefined!11933) (MissingVacant!11933 (index!50127 (_ BitVec 32))) )
))
(declare-fun lt!640917 () SeekEntryResult!11933)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640915 () (_ BitVec 64))

(declare-fun b!1464434 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98734 0))(
  ( (array!98735 (arr!47656 (Array (_ BitVec 32) (_ BitVec 64))) (size!48208 (_ BitVec 32))) )
))
(declare-fun lt!640914 () array!98734)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11933)

(assert (=> b!1464434 (= e!822945 (= lt!640917 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640915 lt!640914 mask!2687)))))

(declare-fun b!1464435 () Bool)

(declare-fun e!822946 () Bool)

(declare-fun e!822952 () Bool)

(assert (=> b!1464435 (= e!822946 e!822952)))

(declare-fun res!993597 () Bool)

(assert (=> b!1464435 (=> (not res!993597) (not e!822952))))

(declare-fun a!2862 () array!98734)

(assert (=> b!1464435 (= res!993597 (= (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464435 (= lt!640914 (array!98735 (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48208 a!2862)))))

(declare-fun b!1464436 () Bool)

(declare-fun res!993594 () Bool)

(declare-fun e!822948 () Bool)

(assert (=> b!1464436 (=> res!993594 e!822948)))

(declare-fun lt!640913 () SeekEntryResult!11933)

(declare-fun lt!640912 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464436 (= res!993594 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640912 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640913)))))

(declare-fun b!1464437 () Bool)

(assert (=> b!1464437 (= e!822948 true)))

(declare-fun lt!640911 () Bool)

(declare-fun e!822950 () Bool)

(assert (=> b!1464437 (= lt!640911 e!822950)))

(declare-fun c!134937 () Bool)

(assert (=> b!1464437 (= c!134937 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1464438 () Bool)

(declare-fun e!822953 () Bool)

(assert (=> b!1464438 (= e!822953 (or (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) (select (arr!47656 a!2862) j!93))))))

(declare-fun b!1464439 () Bool)

(declare-fun e!822947 () Bool)

(assert (=> b!1464439 (= e!822947 e!822948)))

(declare-fun res!993593 () Bool)

(assert (=> b!1464439 (=> res!993593 e!822948)))

(assert (=> b!1464439 (= res!993593 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640912 #b00000000000000000000000000000000) (bvsge lt!640912 (size!48208 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464439 (= lt!640912 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464440 () Bool)

(declare-fun res!993584 () Bool)

(assert (=> b!1464440 (=> (not res!993584) (not e!822953))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11933)

(assert (=> b!1464440 (= res!993584 (= (seekEntryOrOpen!0 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) (Found!11933 j!93)))))

(declare-fun b!1464441 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98734 (_ BitVec 32)) SeekEntryResult!11933)

(assert (=> b!1464441 (= e!822945 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640915 lt!640914 mask!2687) (seekEntryOrOpen!0 lt!640915 lt!640914 mask!2687)))))

(declare-fun b!1464442 () Bool)

(declare-fun res!993590 () Bool)

(assert (=> b!1464442 (=> (not res!993590) (not e!822946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98734 (_ BitVec 32)) Bool)

(assert (=> b!1464442 (= res!993590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464443 () Bool)

(declare-fun e!822954 () Bool)

(assert (=> b!1464443 (= e!822952 e!822954)))

(declare-fun res!993588 () Bool)

(assert (=> b!1464443 (=> (not res!993588) (not e!822954))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464443 (= res!993588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47656 a!2862) j!93) mask!2687) (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640913))))

(assert (=> b!1464443 (= lt!640913 (Intermediate!11933 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464444 () Bool)

(assert (=> b!1464444 (= e!822954 e!822951)))

(declare-fun res!993599 () Bool)

(assert (=> b!1464444 (=> (not res!993599) (not e!822951))))

(assert (=> b!1464444 (= res!993599 (= lt!640917 (Intermediate!11933 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464444 (= lt!640917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640915 mask!2687) lt!640915 lt!640914 mask!2687))))

(assert (=> b!1464444 (= lt!640915 (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464446 () Bool)

(declare-fun res!993587 () Bool)

(assert (=> b!1464446 (=> (not res!993587) (not e!822946))))

(declare-datatypes ((List!34235 0))(
  ( (Nil!34232) (Cons!34231 (h!35581 (_ BitVec 64)) (t!48921 List!34235)) )
))
(declare-fun arrayNoDuplicates!0 (array!98734 (_ BitVec 32) List!34235) Bool)

(assert (=> b!1464446 (= res!993587 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34232))))

(declare-fun b!1464447 () Bool)

(assert (=> b!1464447 (= e!822950 (not (= lt!640917 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640912 lt!640915 lt!640914 mask!2687))))))

(declare-fun b!1464448 () Bool)

(assert (=> b!1464448 (= e!822950 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640912 intermediateAfterIndex!19 lt!640915 lt!640914 mask!2687) (seekEntryOrOpen!0 lt!640915 lt!640914 mask!2687))))))

(declare-fun b!1464449 () Bool)

(declare-fun res!993585 () Bool)

(assert (=> b!1464449 (=> (not res!993585) (not e!822946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464449 (= res!993585 (validKeyInArray!0 (select (arr!47656 a!2862) i!1006)))))

(declare-fun b!1464450 () Bool)

(declare-fun res!993596 () Bool)

(assert (=> b!1464450 (=> (not res!993596) (not e!822954))))

(assert (=> b!1464450 (= res!993596 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640913))))

(declare-fun b!1464451 () Bool)

(declare-fun res!993600 () Bool)

(assert (=> b!1464451 (=> (not res!993600) (not e!822946))))

(assert (=> b!1464451 (= res!993600 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48208 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48208 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48208 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464452 () Bool)

(assert (=> b!1464452 (= e!822951 (not e!822947))))

(declare-fun res!993591 () Bool)

(assert (=> b!1464452 (=> res!993591 e!822947)))

(assert (=> b!1464452 (= res!993591 (or (and (= (select (arr!47656 a!2862) index!646) (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47656 a!2862) index!646) (select (arr!47656 a!2862) j!93))) (= (select (arr!47656 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464452 e!822953))

(declare-fun res!993601 () Bool)

(assert (=> b!1464452 (=> (not res!993601) (not e!822953))))

(assert (=> b!1464452 (= res!993601 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49203 0))(
  ( (Unit!49204) )
))
(declare-fun lt!640916 () Unit!49203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49203)

(assert (=> b!1464452 (= lt!640916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464453 () Bool)

(declare-fun res!993592 () Bool)

(assert (=> b!1464453 (=> (not res!993592) (not e!822946))))

(assert (=> b!1464453 (= res!993592 (validKeyInArray!0 (select (arr!47656 a!2862) j!93)))))

(declare-fun res!993595 () Bool)

(assert (=> start!125308 (=> (not res!993595) (not e!822946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125308 (= res!993595 (validMask!0 mask!2687))))

(assert (=> start!125308 e!822946))

(assert (=> start!125308 true))

(declare-fun array_inv!36889 (array!98734) Bool)

(assert (=> start!125308 (array_inv!36889 a!2862)))

(declare-fun b!1464445 () Bool)

(declare-fun res!993586 () Bool)

(assert (=> b!1464445 (=> (not res!993586) (not e!822946))))

(assert (=> b!1464445 (= res!993586 (and (= (size!48208 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48208 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48208 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125308 res!993595) b!1464445))

(assert (= (and b!1464445 res!993586) b!1464449))

(assert (= (and b!1464449 res!993585) b!1464453))

(assert (= (and b!1464453 res!993592) b!1464442))

(assert (= (and b!1464442 res!993590) b!1464446))

(assert (= (and b!1464446 res!993587) b!1464451))

(assert (= (and b!1464451 res!993600) b!1464435))

(assert (= (and b!1464435 res!993597) b!1464443))

(assert (= (and b!1464443 res!993588) b!1464450))

(assert (= (and b!1464450 res!993596) b!1464444))

(assert (= (and b!1464444 res!993599) b!1464432))

(assert (= (and b!1464432 c!134938) b!1464434))

(assert (= (and b!1464432 (not c!134938)) b!1464441))

(assert (= (and b!1464432 res!993589) b!1464433))

(assert (= (and b!1464433 res!993598) b!1464452))

(assert (= (and b!1464452 res!993601) b!1464440))

(assert (= (and b!1464440 res!993584) b!1464438))

(assert (= (and b!1464452 (not res!993591)) b!1464439))

(assert (= (and b!1464439 (not res!993593)) b!1464436))

(assert (= (and b!1464436 (not res!993594)) b!1464437))

(assert (= (and b!1464437 c!134937) b!1464447))

(assert (= (and b!1464437 (not c!134937)) b!1464448))

(declare-fun m!1351143 () Bool)

(assert (=> b!1464450 m!1351143))

(assert (=> b!1464450 m!1351143))

(declare-fun m!1351145 () Bool)

(assert (=> b!1464450 m!1351145))

(declare-fun m!1351147 () Bool)

(assert (=> b!1464452 m!1351147))

(declare-fun m!1351149 () Bool)

(assert (=> b!1464452 m!1351149))

(declare-fun m!1351151 () Bool)

(assert (=> b!1464452 m!1351151))

(declare-fun m!1351153 () Bool)

(assert (=> b!1464452 m!1351153))

(declare-fun m!1351155 () Bool)

(assert (=> b!1464452 m!1351155))

(assert (=> b!1464452 m!1351143))

(declare-fun m!1351157 () Bool)

(assert (=> b!1464434 m!1351157))

(declare-fun m!1351159 () Bool)

(assert (=> start!125308 m!1351159))

(declare-fun m!1351161 () Bool)

(assert (=> start!125308 m!1351161))

(declare-fun m!1351163 () Bool)

(assert (=> b!1464449 m!1351163))

(assert (=> b!1464449 m!1351163))

(declare-fun m!1351165 () Bool)

(assert (=> b!1464449 m!1351165))

(declare-fun m!1351167 () Bool)

(assert (=> b!1464441 m!1351167))

(declare-fun m!1351169 () Bool)

(assert (=> b!1464441 m!1351169))

(assert (=> b!1464443 m!1351143))

(assert (=> b!1464443 m!1351143))

(declare-fun m!1351171 () Bool)

(assert (=> b!1464443 m!1351171))

(assert (=> b!1464443 m!1351171))

(assert (=> b!1464443 m!1351143))

(declare-fun m!1351173 () Bool)

(assert (=> b!1464443 m!1351173))

(assert (=> b!1464436 m!1351143))

(assert (=> b!1464436 m!1351143))

(declare-fun m!1351175 () Bool)

(assert (=> b!1464436 m!1351175))

(assert (=> b!1464440 m!1351143))

(assert (=> b!1464440 m!1351143))

(declare-fun m!1351177 () Bool)

(assert (=> b!1464440 m!1351177))

(declare-fun m!1351179 () Bool)

(assert (=> b!1464442 m!1351179))

(declare-fun m!1351181 () Bool)

(assert (=> b!1464446 m!1351181))

(declare-fun m!1351183 () Bool)

(assert (=> b!1464438 m!1351183))

(assert (=> b!1464438 m!1351143))

(declare-fun m!1351185 () Bool)

(assert (=> b!1464448 m!1351185))

(assert (=> b!1464448 m!1351169))

(declare-fun m!1351187 () Bool)

(assert (=> b!1464447 m!1351187))

(assert (=> b!1464435 m!1351149))

(declare-fun m!1351189 () Bool)

(assert (=> b!1464435 m!1351189))

(declare-fun m!1351191 () Bool)

(assert (=> b!1464444 m!1351191))

(assert (=> b!1464444 m!1351191))

(declare-fun m!1351193 () Bool)

(assert (=> b!1464444 m!1351193))

(assert (=> b!1464444 m!1351149))

(declare-fun m!1351195 () Bool)

(assert (=> b!1464444 m!1351195))

(assert (=> b!1464453 m!1351143))

(assert (=> b!1464453 m!1351143))

(declare-fun m!1351197 () Bool)

(assert (=> b!1464453 m!1351197))

(declare-fun m!1351199 () Bool)

(assert (=> b!1464439 m!1351199))

(check-sat (not b!1464447) (not b!1464436) (not b!1464452) (not b!1464450) (not b!1464434) (not b!1464449) (not b!1464446) (not b!1464443) (not b!1464448) (not b!1464442) (not b!1464441) (not b!1464440) (not b!1464444) (not b!1464453) (not b!1464439) (not start!125308))
(check-sat)
