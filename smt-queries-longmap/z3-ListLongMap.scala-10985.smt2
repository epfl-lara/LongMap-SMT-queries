; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128702 () Bool)

(assert start!128702)

(declare-fun b!1508274 () Bool)

(declare-fun res!1028286 () Bool)

(declare-fun e!842648 () Bool)

(assert (=> b!1508274 (=> (not res!1028286) (not e!842648))))

(declare-datatypes ((array!100597 0))(
  ( (array!100598 (arr!48537 (Array (_ BitVec 32) (_ BitVec 64))) (size!49087 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100597)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100597 (_ BitVec 32)) Bool)

(assert (=> b!1508274 (= res!1028286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508275 () Bool)

(declare-fun e!842650 () Bool)

(assert (=> b!1508275 (= e!842648 e!842650)))

(declare-fun res!1028284 () Bool)

(assert (=> b!1508275 (=> (not res!1028284) (not e!842650))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12708 0))(
  ( (MissingZero!12708 (index!53227 (_ BitVec 32))) (Found!12708 (index!53228 (_ BitVec 32))) (Intermediate!12708 (undefined!13520 Bool) (index!53229 (_ BitVec 32)) (x!134988 (_ BitVec 32))) (Undefined!12708) (MissingVacant!12708 (index!53230 (_ BitVec 32))) )
))
(declare-fun lt!654595 () SeekEntryResult!12708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100597 (_ BitVec 32)) SeekEntryResult!12708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508275 (= res!1028284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48537 a!2804) j!70) mask!2512) (select (arr!48537 a!2804) j!70) a!2804 mask!2512) lt!654595))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508275 (= lt!654595 (Intermediate!12708 false resIndex!21 resX!21))))

(declare-fun b!1508276 () Bool)

(declare-fun res!1028282 () Bool)

(assert (=> b!1508276 (=> (not res!1028282) (not e!842648))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508276 (= res!1028282 (validKeyInArray!0 (select (arr!48537 a!2804) i!961)))))

(declare-fun b!1508277 () Bool)

(declare-fun res!1028283 () Bool)

(assert (=> b!1508277 (=> (not res!1028283) (not e!842648))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508277 (= res!1028283 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49087 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49087 a!2804))))))

(declare-fun b!1508279 () Bool)

(declare-fun res!1028288 () Bool)

(assert (=> b!1508279 (=> (not res!1028288) (not e!842648))))

(declare-datatypes ((List!35020 0))(
  ( (Nil!35017) (Cons!35016 (h!36425 (_ BitVec 64)) (t!49714 List!35020)) )
))
(declare-fun arrayNoDuplicates!0 (array!100597 (_ BitVec 32) List!35020) Bool)

(assert (=> b!1508279 (= res!1028288 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35017))))

(declare-fun b!1508280 () Bool)

(declare-fun res!1028285 () Bool)

(assert (=> b!1508280 (=> (not res!1028285) (not e!842648))))

(assert (=> b!1508280 (= res!1028285 (and (= (size!49087 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49087 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49087 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508281 () Bool)

(declare-fun res!1028287 () Bool)

(assert (=> b!1508281 (=> (not res!1028287) (not e!842648))))

(assert (=> b!1508281 (= res!1028287 (validKeyInArray!0 (select (arr!48537 a!2804) j!70)))))

(declare-fun b!1508282 () Bool)

(declare-fun res!1028289 () Bool)

(assert (=> b!1508282 (=> (not res!1028289) (not e!842650))))

(assert (=> b!1508282 (= res!1028289 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48537 a!2804) j!70) a!2804 mask!2512) lt!654595))))

(declare-fun res!1028290 () Bool)

(assert (=> start!128702 (=> (not res!1028290) (not e!842648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128702 (= res!1028290 (validMask!0 mask!2512))))

(assert (=> start!128702 e!842648))

(assert (=> start!128702 true))

(declare-fun array_inv!37565 (array!100597) Bool)

(assert (=> start!128702 (array_inv!37565 a!2804)))

(declare-fun b!1508278 () Bool)

(assert (=> b!1508278 (= e!842650 false)))

(declare-fun lt!654594 () (_ BitVec 32))

(assert (=> b!1508278 (= lt!654594 (toIndex!0 (select (store (arr!48537 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(assert (= (and start!128702 res!1028290) b!1508280))

(assert (= (and b!1508280 res!1028285) b!1508276))

(assert (= (and b!1508276 res!1028282) b!1508281))

(assert (= (and b!1508281 res!1028287) b!1508274))

(assert (= (and b!1508274 res!1028286) b!1508279))

(assert (= (and b!1508279 res!1028288) b!1508277))

(assert (= (and b!1508277 res!1028283) b!1508275))

(assert (= (and b!1508275 res!1028284) b!1508282))

(assert (= (and b!1508282 res!1028289) b!1508278))

(declare-fun m!1390775 () Bool)

(assert (=> b!1508275 m!1390775))

(assert (=> b!1508275 m!1390775))

(declare-fun m!1390777 () Bool)

(assert (=> b!1508275 m!1390777))

(assert (=> b!1508275 m!1390777))

(assert (=> b!1508275 m!1390775))

(declare-fun m!1390779 () Bool)

(assert (=> b!1508275 m!1390779))

(declare-fun m!1390781 () Bool)

(assert (=> start!128702 m!1390781))

(declare-fun m!1390783 () Bool)

(assert (=> start!128702 m!1390783))

(assert (=> b!1508282 m!1390775))

(assert (=> b!1508282 m!1390775))

(declare-fun m!1390785 () Bool)

(assert (=> b!1508282 m!1390785))

(declare-fun m!1390787 () Bool)

(assert (=> b!1508274 m!1390787))

(declare-fun m!1390789 () Bool)

(assert (=> b!1508278 m!1390789))

(declare-fun m!1390791 () Bool)

(assert (=> b!1508278 m!1390791))

(assert (=> b!1508278 m!1390791))

(declare-fun m!1390793 () Bool)

(assert (=> b!1508278 m!1390793))

(declare-fun m!1390795 () Bool)

(assert (=> b!1508276 m!1390795))

(assert (=> b!1508276 m!1390795))

(declare-fun m!1390797 () Bool)

(assert (=> b!1508276 m!1390797))

(assert (=> b!1508281 m!1390775))

(assert (=> b!1508281 m!1390775))

(declare-fun m!1390799 () Bool)

(assert (=> b!1508281 m!1390799))

(declare-fun m!1390801 () Bool)

(assert (=> b!1508279 m!1390801))

(check-sat (not b!1508276) (not start!128702) (not b!1508282) (not b!1508279) (not b!1508281) (not b!1508275) (not b!1508278) (not b!1508274))
(check-sat)
