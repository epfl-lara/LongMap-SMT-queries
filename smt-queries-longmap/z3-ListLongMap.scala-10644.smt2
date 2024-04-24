; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125220 () Bool)

(assert start!125220)

(declare-fun b!1455037 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98563 0))(
  ( (array!98564 (arr!47566 (Array (_ BitVec 32) (_ BitVec 64))) (size!48117 (_ BitVec 32))) )
))
(declare-fun lt!637800 () array!98563)

(declare-fun e!819033 () Bool)

(declare-fun lt!637802 () (_ BitVec 32))

(declare-fun lt!637807 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11715 0))(
  ( (MissingZero!11715 (index!49252 (_ BitVec 32))) (Found!11715 (index!49253 (_ BitVec 32))) (Intermediate!11715 (undefined!12527 Bool) (index!49254 (_ BitVec 32)) (x!131068 (_ BitVec 32))) (Undefined!11715) (MissingVacant!11715 (index!49255 (_ BitVec 32))) )
))
(declare-fun lt!637803 () SeekEntryResult!11715)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98563 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1455037 (= e!819033 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637802 intermediateAfterIndex!19 lt!637807 lt!637800 mask!2687) lt!637803)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!819038 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1455038 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98563)

(assert (=> b!1455038 (= e!819038 (and (or (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) (select (arr!47566 a!2862) j!93))) (let ((bdg!53000 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47566 a!2862) index!646) bdg!53000) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53000 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455039 () Bool)

(declare-fun e!819035 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98563 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1455039 (= e!819035 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637807 lt!637800 mask!2687) (seekEntryOrOpen!0 lt!637807 lt!637800 mask!2687)))))

(declare-fun b!1455040 () Bool)

(declare-fun res!985206 () Bool)

(declare-fun e!819036 () Bool)

(assert (=> b!1455040 (=> (not res!985206) (not e!819036))))

(declare-fun lt!637805 () SeekEntryResult!11715)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98563 (_ BitVec 32)) SeekEntryResult!11715)

(assert (=> b!1455040 (= res!985206 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!637805))))

(declare-fun b!1455041 () Bool)

(declare-fun res!985203 () Bool)

(declare-fun e!819032 () Bool)

(assert (=> b!1455041 (=> (not res!985203) (not e!819032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455041 (= res!985203 (validKeyInArray!0 (select (arr!47566 a!2862) j!93)))))

(declare-fun b!1455042 () Bool)

(declare-fun e!819037 () Bool)

(assert (=> b!1455042 (= e!819037 e!819036)))

(declare-fun res!985196 () Bool)

(assert (=> b!1455042 (=> (not res!985196) (not e!819036))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455042 (= res!985196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47566 a!2862) j!93) mask!2687) (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!637805))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455042 (= lt!637805 (Intermediate!11715 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455043 () Bool)

(declare-fun res!985207 () Bool)

(declare-fun e!819030 () Bool)

(assert (=> b!1455043 (=> (not res!985207) (not e!819030))))

(assert (=> b!1455043 (= res!985207 e!819035)))

(declare-fun c!134442 () Bool)

(assert (=> b!1455043 (= c!134442 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!985202 () Bool)

(assert (=> start!125220 (=> (not res!985202) (not e!819032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125220 (= res!985202 (validMask!0 mask!2687))))

(assert (=> start!125220 e!819032))

(assert (=> start!125220 true))

(declare-fun array_inv!36847 (array!98563) Bool)

(assert (=> start!125220 (array_inv!36847 a!2862)))

(declare-fun b!1455044 () Bool)

(declare-fun res!985200 () Bool)

(assert (=> b!1455044 (=> (not res!985200) (not e!819032))))

(assert (=> b!1455044 (= res!985200 (validKeyInArray!0 (select (arr!47566 a!2862) i!1006)))))

(declare-fun b!1455045 () Bool)

(declare-fun res!985191 () Bool)

(declare-fun e!819034 () Bool)

(assert (=> b!1455045 (=> res!985191 e!819034)))

(assert (=> b!1455045 (= res!985191 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637802 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!637805)))))

(declare-fun b!1455046 () Bool)

(assert (=> b!1455046 (= e!819036 e!819030)))

(declare-fun res!985208 () Bool)

(assert (=> b!1455046 (=> (not res!985208) (not e!819030))))

(declare-fun lt!637806 () SeekEntryResult!11715)

(assert (=> b!1455046 (= res!985208 (= lt!637806 (Intermediate!11715 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455046 (= lt!637806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637807 mask!2687) lt!637807 lt!637800 mask!2687))))

(assert (=> b!1455046 (= lt!637807 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455047 () Bool)

(declare-fun res!985198 () Bool)

(assert (=> b!1455047 (=> (not res!985198) (not e!819030))))

(assert (=> b!1455047 (= res!985198 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455048 () Bool)

(declare-fun res!985192 () Bool)

(assert (=> b!1455048 (=> (not res!985192) (not e!819032))))

(assert (=> b!1455048 (= res!985192 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48117 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48117 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48117 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455049 () Bool)

(assert (=> b!1455049 (= e!819034 true)))

(declare-fun lt!637801 () Bool)

(assert (=> b!1455049 (= lt!637801 e!819033)))

(declare-fun c!134443 () Bool)

(assert (=> b!1455049 (= c!134443 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455050 () Bool)

(declare-fun res!985205 () Bool)

(assert (=> b!1455050 (=> (not res!985205) (not e!819032))))

(declare-datatypes ((List!34054 0))(
  ( (Nil!34051) (Cons!34050 (h!35411 (_ BitVec 64)) (t!48740 List!34054)) )
))
(declare-fun arrayNoDuplicates!0 (array!98563 (_ BitVec 32) List!34054) Bool)

(assert (=> b!1455050 (= res!985205 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34051))))

(declare-fun b!1455051 () Bool)

(declare-fun e!819031 () Bool)

(assert (=> b!1455051 (= e!819030 (not e!819031))))

(declare-fun res!985201 () Bool)

(assert (=> b!1455051 (=> res!985201 e!819031)))

(assert (=> b!1455051 (= res!985201 (or (and (= (select (arr!47566 a!2862) index!646) (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455051 e!819038))

(declare-fun res!985197 () Bool)

(assert (=> b!1455051 (=> (not res!985197) (not e!819038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98563 (_ BitVec 32)) Bool)

(assert (=> b!1455051 (= res!985197 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48959 0))(
  ( (Unit!48960) )
))
(declare-fun lt!637804 () Unit!48959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48959)

(assert (=> b!1455051 (= lt!637804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455052 () Bool)

(assert (=> b!1455052 (= e!819033 (not (= lt!637806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637802 lt!637807 lt!637800 mask!2687))))))

(declare-fun b!1455053 () Bool)

(assert (=> b!1455053 (= e!819032 e!819037)))

(declare-fun res!985193 () Bool)

(assert (=> b!1455053 (=> (not res!985193) (not e!819037))))

(assert (=> b!1455053 (= res!985193 (= (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455053 (= lt!637800 (array!98564 (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48117 a!2862)))))

(declare-fun b!1455054 () Bool)

(assert (=> b!1455054 (= e!819031 e!819034)))

(declare-fun res!985194 () Bool)

(assert (=> b!1455054 (=> res!985194 e!819034)))

(assert (=> b!1455054 (= res!985194 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637802 #b00000000000000000000000000000000) (bvsge lt!637802 (size!48117 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455054 (= lt!637802 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1455054 (= lt!637803 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637807 lt!637800 mask!2687))))

(assert (=> b!1455054 (= lt!637803 (seekEntryOrOpen!0 lt!637807 lt!637800 mask!2687))))

(declare-fun b!1455055 () Bool)

(declare-fun res!985195 () Bool)

(assert (=> b!1455055 (=> (not res!985195) (not e!819032))))

(assert (=> b!1455055 (= res!985195 (and (= (size!48117 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48117 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48117 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455056 () Bool)

(declare-fun res!985204 () Bool)

(assert (=> b!1455056 (=> (not res!985204) (not e!819038))))

(assert (=> b!1455056 (= res!985204 (= (seekEntryOrOpen!0 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) (Found!11715 j!93)))))

(declare-fun b!1455057 () Bool)

(assert (=> b!1455057 (= e!819035 (= lt!637806 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637807 lt!637800 mask!2687)))))

(declare-fun b!1455058 () Bool)

(declare-fun res!985199 () Bool)

(assert (=> b!1455058 (=> (not res!985199) (not e!819032))))

(assert (=> b!1455058 (= res!985199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125220 res!985202) b!1455055))

(assert (= (and b!1455055 res!985195) b!1455044))

(assert (= (and b!1455044 res!985200) b!1455041))

(assert (= (and b!1455041 res!985203) b!1455058))

(assert (= (and b!1455058 res!985199) b!1455050))

(assert (= (and b!1455050 res!985205) b!1455048))

(assert (= (and b!1455048 res!985192) b!1455053))

(assert (= (and b!1455053 res!985193) b!1455042))

(assert (= (and b!1455042 res!985196) b!1455040))

(assert (= (and b!1455040 res!985206) b!1455046))

(assert (= (and b!1455046 res!985208) b!1455043))

(assert (= (and b!1455043 c!134442) b!1455057))

(assert (= (and b!1455043 (not c!134442)) b!1455039))

(assert (= (and b!1455043 res!985207) b!1455047))

(assert (= (and b!1455047 res!985198) b!1455051))

(assert (= (and b!1455051 res!985197) b!1455056))

(assert (= (and b!1455056 res!985204) b!1455038))

(assert (= (and b!1455051 (not res!985201)) b!1455054))

(assert (= (and b!1455054 (not res!985194)) b!1455045))

(assert (= (and b!1455045 (not res!985191)) b!1455049))

(assert (= (and b!1455049 c!134443) b!1455052))

(assert (= (and b!1455049 (not c!134443)) b!1455037))

(declare-fun m!1343581 () Bool)

(assert (=> b!1455058 m!1343581))

(declare-fun m!1343583 () Bool)

(assert (=> b!1455050 m!1343583))

(declare-fun m!1343585 () Bool)

(assert (=> b!1455044 m!1343585))

(assert (=> b!1455044 m!1343585))

(declare-fun m!1343587 () Bool)

(assert (=> b!1455044 m!1343587))

(declare-fun m!1343589 () Bool)

(assert (=> b!1455040 m!1343589))

(assert (=> b!1455040 m!1343589))

(declare-fun m!1343591 () Bool)

(assert (=> b!1455040 m!1343591))

(declare-fun m!1343593 () Bool)

(assert (=> b!1455038 m!1343593))

(declare-fun m!1343595 () Bool)

(assert (=> b!1455038 m!1343595))

(declare-fun m!1343597 () Bool)

(assert (=> b!1455038 m!1343597))

(declare-fun m!1343599 () Bool)

(assert (=> b!1455038 m!1343599))

(assert (=> b!1455038 m!1343589))

(declare-fun m!1343601 () Bool)

(assert (=> b!1455039 m!1343601))

(declare-fun m!1343603 () Bool)

(assert (=> b!1455039 m!1343603))

(assert (=> b!1455053 m!1343593))

(declare-fun m!1343605 () Bool)

(assert (=> b!1455053 m!1343605))

(assert (=> b!1455045 m!1343589))

(assert (=> b!1455045 m!1343589))

(declare-fun m!1343607 () Bool)

(assert (=> b!1455045 m!1343607))

(assert (=> b!1455041 m!1343589))

(assert (=> b!1455041 m!1343589))

(declare-fun m!1343609 () Bool)

(assert (=> b!1455041 m!1343609))

(assert (=> b!1455056 m!1343589))

(assert (=> b!1455056 m!1343589))

(declare-fun m!1343611 () Bool)

(assert (=> b!1455056 m!1343611))

(assert (=> b!1455042 m!1343589))

(assert (=> b!1455042 m!1343589))

(declare-fun m!1343613 () Bool)

(assert (=> b!1455042 m!1343613))

(assert (=> b!1455042 m!1343613))

(assert (=> b!1455042 m!1343589))

(declare-fun m!1343615 () Bool)

(assert (=> b!1455042 m!1343615))

(declare-fun m!1343617 () Bool)

(assert (=> start!125220 m!1343617))

(declare-fun m!1343619 () Bool)

(assert (=> start!125220 m!1343619))

(declare-fun m!1343621 () Bool)

(assert (=> b!1455052 m!1343621))

(declare-fun m!1343623 () Bool)

(assert (=> b!1455057 m!1343623))

(declare-fun m!1343625 () Bool)

(assert (=> b!1455046 m!1343625))

(assert (=> b!1455046 m!1343625))

(declare-fun m!1343627 () Bool)

(assert (=> b!1455046 m!1343627))

(assert (=> b!1455046 m!1343593))

(declare-fun m!1343629 () Bool)

(assert (=> b!1455046 m!1343629))

(declare-fun m!1343631 () Bool)

(assert (=> b!1455051 m!1343631))

(assert (=> b!1455051 m!1343593))

(assert (=> b!1455051 m!1343597))

(assert (=> b!1455051 m!1343599))

(declare-fun m!1343633 () Bool)

(assert (=> b!1455051 m!1343633))

(assert (=> b!1455051 m!1343589))

(declare-fun m!1343635 () Bool)

(assert (=> b!1455037 m!1343635))

(declare-fun m!1343637 () Bool)

(assert (=> b!1455054 m!1343637))

(assert (=> b!1455054 m!1343601))

(assert (=> b!1455054 m!1343603))

(check-sat (not b!1455054) (not b!1455042) (not b!1455044) (not b!1455040) (not b!1455046) (not start!125220) (not b!1455037) (not b!1455051) (not b!1455039) (not b!1455056) (not b!1455058) (not b!1455041) (not b!1455050) (not b!1455045) (not b!1455052) (not b!1455057))
(check-sat)
