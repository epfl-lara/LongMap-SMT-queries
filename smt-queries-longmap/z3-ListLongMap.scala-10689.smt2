; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125550 () Bool)

(assert start!125550)

(declare-fun b!1464157 () Bool)

(declare-fun res!992492 () Bool)

(declare-fun e!823137 () Bool)

(assert (=> b!1464157 (=> (not res!992492) (not e!823137))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98836 0))(
  ( (array!98837 (arr!47701 (Array (_ BitVec 32) (_ BitVec 64))) (size!48252 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98836)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11850 0))(
  ( (MissingZero!11850 (index!49792 (_ BitVec 32))) (Found!11850 (index!49793 (_ BitVec 32))) (Intermediate!11850 (undefined!12662 Bool) (index!49794 (_ BitVec 32)) (x!131572 (_ BitVec 32))) (Undefined!11850) (MissingVacant!11850 (index!49795 (_ BitVec 32))) )
))
(declare-fun lt!641094 () SeekEntryResult!11850)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11850)

(assert (=> b!1464157 (= res!992492 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641094))))

(declare-fun b!1464158 () Bool)

(declare-fun e!823142 () Bool)

(declare-fun e!823141 () Bool)

(assert (=> b!1464158 (= e!823142 e!823141)))

(declare-fun res!992495 () Bool)

(assert (=> b!1464158 (=> res!992495 e!823141)))

(declare-fun lt!641091 () (_ BitVec 32))

(assert (=> b!1464158 (= res!992495 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641091 #b00000000000000000000000000000000) (bvsge lt!641091 (size!48252 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464158 (= lt!641091 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1464159 () Bool)

(declare-fun e!823143 () Bool)

(declare-fun e!823136 () Bool)

(assert (=> b!1464159 (= e!823143 e!823136)))

(declare-fun res!992493 () Bool)

(assert (=> b!1464159 (=> (not res!992493) (not e!823136))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464159 (= res!992493 (= (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641095 () array!98836)

(assert (=> b!1464159 (= lt!641095 (array!98837 (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48252 a!2862)))))

(declare-fun b!1464160 () Bool)

(declare-fun res!992498 () Bool)

(assert (=> b!1464160 (=> (not res!992498) (not e!823143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98836 (_ BitVec 32)) Bool)

(assert (=> b!1464160 (= res!992498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!641089 () (_ BitVec 64))

(declare-fun e!823135 () Bool)

(declare-fun b!1464161 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11850)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11850)

(assert (=> b!1464161 (= e!823135 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641091 intermediateAfterIndex!19 lt!641089 lt!641095 mask!2687) (seekEntryOrOpen!0 lt!641089 lt!641095 mask!2687))))))

(declare-fun b!1464162 () Bool)

(assert (=> b!1464162 (= e!823136 e!823137)))

(declare-fun res!992503 () Bool)

(assert (=> b!1464162 (=> (not res!992503) (not e!823137))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464162 (= res!992503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47701 a!2862) j!93) mask!2687) (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641094))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464162 (= lt!641094 (Intermediate!11850 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464163 () Bool)

(declare-fun res!992502 () Bool)

(assert (=> b!1464163 (=> (not res!992502) (not e!823143))))

(assert (=> b!1464163 (= res!992502 (and (= (size!48252 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48252 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48252 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464164 () Bool)

(declare-fun e!823139 () Bool)

(assert (=> b!1464164 (= e!823139 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641089 lt!641095 mask!2687) (seekEntryOrOpen!0 lt!641089 lt!641095 mask!2687)))))

(declare-fun b!1464165 () Bool)

(declare-fun e!823138 () Bool)

(assert (=> b!1464165 (= e!823138 (not e!823142))))

(declare-fun res!992507 () Bool)

(assert (=> b!1464165 (=> res!992507 e!823142)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464165 (= res!992507 (or (and (= (select (arr!47701 a!2862) index!646) (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47701 a!2862) index!646) (select (arr!47701 a!2862) j!93))) (= (select (arr!47701 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823134 () Bool)

(assert (=> b!1464165 e!823134))

(declare-fun res!992496 () Bool)

(assert (=> b!1464165 (=> (not res!992496) (not e!823134))))

(assert (=> b!1464165 (= res!992496 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49229 0))(
  ( (Unit!49230) )
))
(declare-fun lt!641090 () Unit!49229)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49229)

(assert (=> b!1464165 (= lt!641090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!992506 () Bool)

(assert (=> start!125550 (=> (not res!992506) (not e!823143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125550 (= res!992506 (validMask!0 mask!2687))))

(assert (=> start!125550 e!823143))

(assert (=> start!125550 true))

(declare-fun array_inv!36982 (array!98836) Bool)

(assert (=> start!125550 (array_inv!36982 a!2862)))

(declare-fun b!1464166 () Bool)

(declare-fun res!992500 () Bool)

(assert (=> b!1464166 (=> (not res!992500) (not e!823143))))

(assert (=> b!1464166 (= res!992500 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48252 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48252 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48252 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464167 () Bool)

(declare-fun lt!641092 () SeekEntryResult!11850)

(assert (=> b!1464167 (= e!823139 (= lt!641092 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641089 lt!641095 mask!2687)))))

(declare-fun b!1464168 () Bool)

(assert (=> b!1464168 (= e!823135 (not (= lt!641092 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641091 lt!641089 lt!641095 mask!2687))))))

(declare-fun b!1464169 () Bool)

(assert (=> b!1464169 (= e!823137 e!823138)))

(declare-fun res!992490 () Bool)

(assert (=> b!1464169 (=> (not res!992490) (not e!823138))))

(assert (=> b!1464169 (= res!992490 (= lt!641092 (Intermediate!11850 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464169 (= lt!641092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641089 mask!2687) lt!641089 lt!641095 mask!2687))))

(assert (=> b!1464169 (= lt!641089 (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464170 () Bool)

(assert (=> b!1464170 (= e!823141 true)))

(declare-fun lt!641093 () Bool)

(assert (=> b!1464170 (= lt!641093 e!823135)))

(declare-fun c!135354 () Bool)

(assert (=> b!1464170 (= c!135354 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464171 () Bool)

(declare-fun res!992497 () Bool)

(assert (=> b!1464171 (=> (not res!992497) (not e!823138))))

(assert (=> b!1464171 (= res!992497 e!823139)))

(declare-fun c!135355 () Bool)

(assert (=> b!1464171 (= c!135355 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464172 () Bool)

(declare-fun res!992491 () Bool)

(assert (=> b!1464172 (=> (not res!992491) (not e!823143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464172 (= res!992491 (validKeyInArray!0 (select (arr!47701 a!2862) j!93)))))

(declare-fun b!1464173 () Bool)

(declare-fun res!992494 () Bool)

(assert (=> b!1464173 (=> (not res!992494) (not e!823143))))

(declare-datatypes ((List!34189 0))(
  ( (Nil!34186) (Cons!34185 (h!35549 (_ BitVec 64)) (t!48875 List!34189)) )
))
(declare-fun arrayNoDuplicates!0 (array!98836 (_ BitVec 32) List!34189) Bool)

(assert (=> b!1464173 (= res!992494 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34186))))

(declare-fun b!1464174 () Bool)

(declare-fun res!992505 () Bool)

(assert (=> b!1464174 (=> (not res!992505) (not e!823143))))

(assert (=> b!1464174 (= res!992505 (validKeyInArray!0 (select (arr!47701 a!2862) i!1006)))))

(declare-fun b!1464175 () Bool)

(declare-fun res!992504 () Bool)

(assert (=> b!1464175 (=> (not res!992504) (not e!823138))))

(assert (=> b!1464175 (= res!992504 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464176 () Bool)

(declare-fun res!992501 () Bool)

(assert (=> b!1464176 (=> (not res!992501) (not e!823134))))

(assert (=> b!1464176 (= res!992501 (= (seekEntryOrOpen!0 (select (arr!47701 a!2862) j!93) a!2862 mask!2687) (Found!11850 j!93)))))

(declare-fun b!1464177 () Bool)

(assert (=> b!1464177 (= e!823134 (or (= (select (arr!47701 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47701 a!2862) intermediateBeforeIndex!19) (select (arr!47701 a!2862) j!93))))))

(declare-fun b!1464178 () Bool)

(declare-fun res!992499 () Bool)

(assert (=> b!1464178 (=> res!992499 e!823141)))

(assert (=> b!1464178 (= res!992499 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641091 (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641094)))))

(assert (= (and start!125550 res!992506) b!1464163))

(assert (= (and b!1464163 res!992502) b!1464174))

(assert (= (and b!1464174 res!992505) b!1464172))

(assert (= (and b!1464172 res!992491) b!1464160))

(assert (= (and b!1464160 res!992498) b!1464173))

(assert (= (and b!1464173 res!992494) b!1464166))

(assert (= (and b!1464166 res!992500) b!1464159))

(assert (= (and b!1464159 res!992493) b!1464162))

(assert (= (and b!1464162 res!992503) b!1464157))

(assert (= (and b!1464157 res!992492) b!1464169))

(assert (= (and b!1464169 res!992490) b!1464171))

(assert (= (and b!1464171 c!135355) b!1464167))

(assert (= (and b!1464171 (not c!135355)) b!1464164))

(assert (= (and b!1464171 res!992497) b!1464175))

(assert (= (and b!1464175 res!992504) b!1464165))

(assert (= (and b!1464165 res!992496) b!1464176))

(assert (= (and b!1464176 res!992501) b!1464177))

(assert (= (and b!1464165 (not res!992507)) b!1464158))

(assert (= (and b!1464158 (not res!992495)) b!1464178))

(assert (= (and b!1464178 (not res!992499)) b!1464170))

(assert (= (and b!1464170 c!135354) b!1464168))

(assert (= (and b!1464170 (not c!135354)) b!1464161))

(declare-fun m!1351591 () Bool)

(assert (=> b!1464172 m!1351591))

(assert (=> b!1464172 m!1351591))

(declare-fun m!1351593 () Bool)

(assert (=> b!1464172 m!1351593))

(declare-fun m!1351595 () Bool)

(assert (=> b!1464160 m!1351595))

(declare-fun m!1351597 () Bool)

(assert (=> b!1464159 m!1351597))

(declare-fun m!1351599 () Bool)

(assert (=> b!1464159 m!1351599))

(declare-fun m!1351601 () Bool)

(assert (=> b!1464174 m!1351601))

(assert (=> b!1464174 m!1351601))

(declare-fun m!1351603 () Bool)

(assert (=> b!1464174 m!1351603))

(declare-fun m!1351605 () Bool)

(assert (=> b!1464161 m!1351605))

(declare-fun m!1351607 () Bool)

(assert (=> b!1464161 m!1351607))

(declare-fun m!1351609 () Bool)

(assert (=> b!1464164 m!1351609))

(assert (=> b!1464164 m!1351607))

(declare-fun m!1351611 () Bool)

(assert (=> b!1464167 m!1351611))

(assert (=> b!1464157 m!1351591))

(assert (=> b!1464157 m!1351591))

(declare-fun m!1351613 () Bool)

(assert (=> b!1464157 m!1351613))

(declare-fun m!1351615 () Bool)

(assert (=> b!1464169 m!1351615))

(assert (=> b!1464169 m!1351615))

(declare-fun m!1351617 () Bool)

(assert (=> b!1464169 m!1351617))

(assert (=> b!1464169 m!1351597))

(declare-fun m!1351619 () Bool)

(assert (=> b!1464169 m!1351619))

(declare-fun m!1351621 () Bool)

(assert (=> b!1464177 m!1351621))

(assert (=> b!1464177 m!1351591))

(declare-fun m!1351623 () Bool)

(assert (=> b!1464168 m!1351623))

(assert (=> b!1464176 m!1351591))

(assert (=> b!1464176 m!1351591))

(declare-fun m!1351625 () Bool)

(assert (=> b!1464176 m!1351625))

(declare-fun m!1351627 () Bool)

(assert (=> b!1464158 m!1351627))

(declare-fun m!1351629 () Bool)

(assert (=> start!125550 m!1351629))

(declare-fun m!1351631 () Bool)

(assert (=> start!125550 m!1351631))

(assert (=> b!1464178 m!1351591))

(assert (=> b!1464178 m!1351591))

(declare-fun m!1351633 () Bool)

(assert (=> b!1464178 m!1351633))

(assert (=> b!1464162 m!1351591))

(assert (=> b!1464162 m!1351591))

(declare-fun m!1351635 () Bool)

(assert (=> b!1464162 m!1351635))

(assert (=> b!1464162 m!1351635))

(assert (=> b!1464162 m!1351591))

(declare-fun m!1351637 () Bool)

(assert (=> b!1464162 m!1351637))

(declare-fun m!1351639 () Bool)

(assert (=> b!1464173 m!1351639))

(declare-fun m!1351641 () Bool)

(assert (=> b!1464165 m!1351641))

(assert (=> b!1464165 m!1351597))

(declare-fun m!1351643 () Bool)

(assert (=> b!1464165 m!1351643))

(declare-fun m!1351645 () Bool)

(assert (=> b!1464165 m!1351645))

(declare-fun m!1351647 () Bool)

(assert (=> b!1464165 m!1351647))

(assert (=> b!1464165 m!1351591))

(check-sat (not b!1464178) (not b!1464174) (not b!1464172) (not b!1464158) (not b!1464168) (not b!1464161) (not b!1464176) (not b!1464165) (not b!1464167) (not b!1464173) (not b!1464160) (not start!125550) (not b!1464169) (not b!1464162) (not b!1464164) (not b!1464157))
(check-sat)
