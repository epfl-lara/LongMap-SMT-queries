; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126174 () Bool)

(assert start!126174)

(declare-fun b!1475597 () Bool)

(declare-fun res!1001780 () Bool)

(declare-fun e!828103 () Bool)

(assert (=> b!1475597 (=> (not res!1001780) (not e!828103))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99289 0))(
  ( (array!99290 (arr!47923 (Array (_ BitVec 32) (_ BitVec 64))) (size!48474 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99289)

(assert (=> b!1475597 (= res!1001780 (and (= (size!48474 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48474 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48474 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475598 () Bool)

(declare-fun res!1001767 () Bool)

(assert (=> b!1475598 (=> (not res!1001767) (not e!828103))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475598 (= res!1001767 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48474 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48474 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48474 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475599 () Bool)

(declare-fun res!1001768 () Bool)

(assert (=> b!1475599 (=> (not res!1001768) (not e!828103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475599 (= res!1001768 (validKeyInArray!0 (select (arr!47923 a!2862) j!93)))))

(declare-fun b!1475600 () Bool)

(declare-fun e!828101 () Bool)

(assert (=> b!1475600 (= e!828101 (or (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) (select (arr!47923 a!2862) j!93))))))

(declare-fun b!1475601 () Bool)

(declare-fun e!828099 () Bool)

(declare-fun lt!644719 () (_ BitVec 64))

(declare-fun lt!644716 () array!99289)

(declare-datatypes ((SeekEntryResult!12060 0))(
  ( (MissingZero!12060 (index!50632 (_ BitVec 32))) (Found!12060 (index!50633 (_ BitVec 32))) (Intermediate!12060 (undefined!12872 Bool) (index!50634 (_ BitVec 32)) (x!132401 (_ BitVec 32))) (Undefined!12060) (MissingVacant!12060 (index!50635 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99289 (_ BitVec 32)) SeekEntryResult!12060)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99289 (_ BitVec 32)) SeekEntryResult!12060)

(assert (=> b!1475601 (= e!828099 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644719 lt!644716 mask!2687) (seekEntryOrOpen!0 lt!644719 lt!644716 mask!2687)))))

(declare-fun b!1475602 () Bool)

(declare-fun lt!644714 () SeekEntryResult!12060)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99289 (_ BitVec 32)) SeekEntryResult!12060)

(assert (=> b!1475602 (= e!828099 (= lt!644714 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644719 lt!644716 mask!2687)))))

(declare-fun b!1475603 () Bool)

(declare-fun e!828104 () Bool)

(declare-fun e!828105 () Bool)

(assert (=> b!1475603 (= e!828104 (not e!828105))))

(declare-fun res!1001772 () Bool)

(assert (=> b!1475603 (=> res!1001772 e!828105)))

(assert (=> b!1475603 (= res!1001772 (or (not (= (select (arr!47923 a!2862) index!646) (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47923 a!2862) index!646) (select (arr!47923 a!2862) j!93)))))))

(assert (=> b!1475603 e!828101))

(declare-fun res!1001779 () Bool)

(assert (=> b!1475603 (=> (not res!1001779) (not e!828101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99289 (_ BitVec 32)) Bool)

(assert (=> b!1475603 (= res!1001779 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49493 0))(
  ( (Unit!49494) )
))
(declare-fun lt!644715 () Unit!49493)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49493)

(assert (=> b!1475603 (= lt!644715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475604 () Bool)

(declare-fun e!828100 () Bool)

(assert (=> b!1475604 (= e!828103 e!828100)))

(declare-fun res!1001778 () Bool)

(assert (=> b!1475604 (=> (not res!1001778) (not e!828100))))

(assert (=> b!1475604 (= res!1001778 (= (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475604 (= lt!644716 (array!99290 (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48474 a!2862)))))

(declare-fun b!1475605 () Bool)

(declare-fun res!1001771 () Bool)

(declare-fun e!828102 () Bool)

(assert (=> b!1475605 (=> (not res!1001771) (not e!828102))))

(declare-fun lt!644717 () SeekEntryResult!12060)

(assert (=> b!1475605 (= res!1001771 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!644717))))

(declare-fun b!1475606 () Bool)

(assert (=> b!1475606 (= e!828102 e!828104)))

(declare-fun res!1001765 () Bool)

(assert (=> b!1475606 (=> (not res!1001765) (not e!828104))))

(assert (=> b!1475606 (= res!1001765 (= lt!644714 (Intermediate!12060 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475606 (= lt!644714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644719 mask!2687) lt!644719 lt!644716 mask!2687))))

(assert (=> b!1475606 (= lt!644719 (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1001766 () Bool)

(assert (=> start!126174 (=> (not res!1001766) (not e!828103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126174 (= res!1001766 (validMask!0 mask!2687))))

(assert (=> start!126174 e!828103))

(assert (=> start!126174 true))

(declare-fun array_inv!37204 (array!99289) Bool)

(assert (=> start!126174 (array_inv!37204 a!2862)))

(declare-fun b!1475607 () Bool)

(assert (=> b!1475607 (= e!828100 e!828102)))

(declare-fun res!1001773 () Bool)

(assert (=> b!1475607 (=> (not res!1001773) (not e!828102))))

(assert (=> b!1475607 (= res!1001773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47923 a!2862) j!93) mask!2687) (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!644717))))

(assert (=> b!1475607 (= lt!644717 (Intermediate!12060 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475608 () Bool)

(declare-fun res!1001770 () Bool)

(assert (=> b!1475608 (=> (not res!1001770) (not e!828104))))

(assert (=> b!1475608 (= res!1001770 e!828099)))

(declare-fun c!136441 () Bool)

(assert (=> b!1475608 (= c!136441 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475609 () Bool)

(declare-fun res!1001776 () Bool)

(assert (=> b!1475609 (=> (not res!1001776) (not e!828104))))

(assert (=> b!1475609 (= res!1001776 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475610 () Bool)

(assert (=> b!1475610 (= e!828105 true)))

(declare-fun lt!644718 () SeekEntryResult!12060)

(assert (=> b!1475610 (= lt!644718 (seekEntryOrOpen!0 lt!644719 lt!644716 mask!2687))))

(declare-fun b!1475611 () Bool)

(declare-fun res!1001769 () Bool)

(assert (=> b!1475611 (=> (not res!1001769) (not e!828103))))

(assert (=> b!1475611 (= res!1001769 (validKeyInArray!0 (select (arr!47923 a!2862) i!1006)))))

(declare-fun b!1475612 () Bool)

(declare-fun res!1001774 () Bool)

(assert (=> b!1475612 (=> (not res!1001774) (not e!828103))))

(declare-datatypes ((List!34411 0))(
  ( (Nil!34408) (Cons!34407 (h!35780 (_ BitVec 64)) (t!49097 List!34411)) )
))
(declare-fun arrayNoDuplicates!0 (array!99289 (_ BitVec 32) List!34411) Bool)

(assert (=> b!1475612 (= res!1001774 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34408))))

(declare-fun b!1475613 () Bool)

(declare-fun res!1001777 () Bool)

(assert (=> b!1475613 (=> (not res!1001777) (not e!828103))))

(assert (=> b!1475613 (= res!1001777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475614 () Bool)

(declare-fun res!1001775 () Bool)

(assert (=> b!1475614 (=> (not res!1001775) (not e!828101))))

(assert (=> b!1475614 (= res!1001775 (= (seekEntryOrOpen!0 (select (arr!47923 a!2862) j!93) a!2862 mask!2687) (Found!12060 j!93)))))

(assert (= (and start!126174 res!1001766) b!1475597))

(assert (= (and b!1475597 res!1001780) b!1475611))

(assert (= (and b!1475611 res!1001769) b!1475599))

(assert (= (and b!1475599 res!1001768) b!1475613))

(assert (= (and b!1475613 res!1001777) b!1475612))

(assert (= (and b!1475612 res!1001774) b!1475598))

(assert (= (and b!1475598 res!1001767) b!1475604))

(assert (= (and b!1475604 res!1001778) b!1475607))

(assert (= (and b!1475607 res!1001773) b!1475605))

(assert (= (and b!1475605 res!1001771) b!1475606))

(assert (= (and b!1475606 res!1001765) b!1475608))

(assert (= (and b!1475608 c!136441) b!1475602))

(assert (= (and b!1475608 (not c!136441)) b!1475601))

(assert (= (and b!1475608 res!1001770) b!1475609))

(assert (= (and b!1475609 res!1001776) b!1475603))

(assert (= (and b!1475603 res!1001779) b!1475614))

(assert (= (and b!1475614 res!1001775) b!1475600))

(assert (= (and b!1475603 (not res!1001772)) b!1475610))

(declare-fun m!1362067 () Bool)

(assert (=> b!1475605 m!1362067))

(assert (=> b!1475605 m!1362067))

(declare-fun m!1362069 () Bool)

(assert (=> b!1475605 m!1362069))

(declare-fun m!1362071 () Bool)

(assert (=> b!1475603 m!1362071))

(declare-fun m!1362073 () Bool)

(assert (=> b!1475603 m!1362073))

(declare-fun m!1362075 () Bool)

(assert (=> b!1475603 m!1362075))

(declare-fun m!1362077 () Bool)

(assert (=> b!1475603 m!1362077))

(declare-fun m!1362079 () Bool)

(assert (=> b!1475603 m!1362079))

(assert (=> b!1475603 m!1362067))

(declare-fun m!1362081 () Bool)

(assert (=> start!126174 m!1362081))

(declare-fun m!1362083 () Bool)

(assert (=> start!126174 m!1362083))

(declare-fun m!1362085 () Bool)

(assert (=> b!1475611 m!1362085))

(assert (=> b!1475611 m!1362085))

(declare-fun m!1362087 () Bool)

(assert (=> b!1475611 m!1362087))

(assert (=> b!1475614 m!1362067))

(assert (=> b!1475614 m!1362067))

(declare-fun m!1362089 () Bool)

(assert (=> b!1475614 m!1362089))

(declare-fun m!1362091 () Bool)

(assert (=> b!1475606 m!1362091))

(assert (=> b!1475606 m!1362091))

(declare-fun m!1362093 () Bool)

(assert (=> b!1475606 m!1362093))

(assert (=> b!1475606 m!1362073))

(declare-fun m!1362095 () Bool)

(assert (=> b!1475606 m!1362095))

(assert (=> b!1475607 m!1362067))

(assert (=> b!1475607 m!1362067))

(declare-fun m!1362097 () Bool)

(assert (=> b!1475607 m!1362097))

(assert (=> b!1475607 m!1362097))

(assert (=> b!1475607 m!1362067))

(declare-fun m!1362099 () Bool)

(assert (=> b!1475607 m!1362099))

(declare-fun m!1362101 () Bool)

(assert (=> b!1475612 m!1362101))

(declare-fun m!1362103 () Bool)

(assert (=> b!1475610 m!1362103))

(declare-fun m!1362105 () Bool)

(assert (=> b!1475613 m!1362105))

(declare-fun m!1362107 () Bool)

(assert (=> b!1475602 m!1362107))

(assert (=> b!1475604 m!1362073))

(declare-fun m!1362109 () Bool)

(assert (=> b!1475604 m!1362109))

(assert (=> b!1475599 m!1362067))

(assert (=> b!1475599 m!1362067))

(declare-fun m!1362111 () Bool)

(assert (=> b!1475599 m!1362111))

(declare-fun m!1362113 () Bool)

(assert (=> b!1475601 m!1362113))

(assert (=> b!1475601 m!1362103))

(declare-fun m!1362115 () Bool)

(assert (=> b!1475600 m!1362115))

(assert (=> b!1475600 m!1362067))

(check-sat (not b!1475607) (not b!1475612) (not b!1475601) (not b!1475606) (not b!1475599) (not b!1475614) (not b!1475611) (not b!1475613) (not start!126174) (not b!1475602) (not b!1475603) (not b!1475605) (not b!1475610))
(check-sat)
