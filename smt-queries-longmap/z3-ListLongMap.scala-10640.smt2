; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124980 () Bool)

(assert start!124980)

(declare-fun b!1453046 () Bool)

(declare-fun res!984107 () Bool)

(declare-fun e!817899 () Bool)

(assert (=> b!1453046 (=> (not res!984107) (not e!817899))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98428 0))(
  ( (array!98429 (arr!47502 (Array (_ BitVec 32) (_ BitVec 64))) (size!48052 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98428)

(assert (=> b!1453046 (= res!984107 (and (= (size!48052 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48052 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48052 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453047 () Bool)

(declare-fun e!817897 () Bool)

(declare-fun e!817901 () Bool)

(assert (=> b!1453047 (= e!817897 e!817901)))

(declare-fun res!984097 () Bool)

(assert (=> b!1453047 (=> (not res!984097) (not e!817901))))

(declare-datatypes ((SeekEntryResult!11754 0))(
  ( (MissingZero!11754 (index!49408 (_ BitVec 32))) (Found!11754 (index!49409 (_ BitVec 32))) (Intermediate!11754 (undefined!12566 Bool) (index!49410 (_ BitVec 32)) (x!131051 (_ BitVec 32))) (Undefined!11754) (MissingVacant!11754 (index!49411 (_ BitVec 32))) )
))
(declare-fun lt!637124 () SeekEntryResult!11754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453047 (= res!984097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47502 a!2862) j!93) mask!2687) (select (arr!47502 a!2862) j!93) a!2862 mask!2687) lt!637124))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453047 (= lt!637124 (Intermediate!11754 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453048 () Bool)

(declare-fun res!984109 () Bool)

(declare-fun e!817895 () Bool)

(assert (=> b!1453048 (=> (not res!984109) (not e!817895))))

(assert (=> b!1453048 (= res!984109 (or (= (select (arr!47502 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47502 a!2862) intermediateBeforeIndex!19) (select (arr!47502 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637123 () array!98428)

(declare-fun lt!637122 () (_ BitVec 64))

(declare-fun e!817900 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1453049 () Bool)

(declare-fun lt!637121 () SeekEntryResult!11754)

(assert (=> b!1453049 (= e!817900 (= lt!637121 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637122 lt!637123 mask!2687)))))

(declare-fun b!1453050 () Bool)

(declare-fun res!984106 () Bool)

(assert (=> b!1453050 (=> (not res!984106) (not e!817901))))

(assert (=> b!1453050 (= res!984106 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47502 a!2862) j!93) a!2862 mask!2687) lt!637124))))

(declare-fun b!1453051 () Bool)

(declare-fun res!984102 () Bool)

(declare-fun e!817894 () Bool)

(assert (=> b!1453051 (=> (not res!984102) (not e!817894))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453051 (= res!984102 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453052 () Bool)

(declare-fun res!984101 () Bool)

(assert (=> b!1453052 (=> (not res!984101) (not e!817899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98428 (_ BitVec 32)) Bool)

(assert (=> b!1453052 (= res!984101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453053 () Bool)

(declare-fun res!984099 () Bool)

(assert (=> b!1453053 (=> (not res!984099) (not e!817894))))

(assert (=> b!1453053 (= res!984099 e!817900)))

(declare-fun c!133986 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453053 (= c!133986 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453054 () Bool)

(declare-fun res!984096 () Bool)

(assert (=> b!1453054 (=> (not res!984096) (not e!817895))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11754)

(assert (=> b!1453054 (= res!984096 (= (seekEntryOrOpen!0 (select (arr!47502 a!2862) j!93) a!2862 mask!2687) (Found!11754 j!93)))))

(declare-fun b!1453055 () Bool)

(declare-fun e!817898 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11754)

(assert (=> b!1453055 (= e!817898 (= (seekEntryOrOpen!0 lt!637122 lt!637123 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637122 lt!637123 mask!2687)))))

(declare-fun b!1453056 () Bool)

(assert (=> b!1453056 (= e!817899 e!817897)))

(declare-fun res!984095 () Bool)

(assert (=> b!1453056 (=> (not res!984095) (not e!817897))))

(assert (=> b!1453056 (= res!984095 (= (select (store (arr!47502 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453056 (= lt!637123 (array!98429 (store (arr!47502 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48052 a!2862)))))

(declare-fun b!1453057 () Bool)

(declare-fun res!984103 () Bool)

(assert (=> b!1453057 (=> (not res!984103) (not e!817899))))

(declare-datatypes ((List!34003 0))(
  ( (Nil!34000) (Cons!33999 (h!35349 (_ BitVec 64)) (t!48697 List!34003)) )
))
(declare-fun arrayNoDuplicates!0 (array!98428 (_ BitVec 32) List!34003) Bool)

(assert (=> b!1453057 (= res!984103 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34000))))

(declare-fun res!984105 () Bool)

(assert (=> start!124980 (=> (not res!984105) (not e!817899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124980 (= res!984105 (validMask!0 mask!2687))))

(assert (=> start!124980 e!817899))

(assert (=> start!124980 true))

(declare-fun array_inv!36530 (array!98428) Bool)

(assert (=> start!124980 (array_inv!36530 a!2862)))

(declare-fun b!1453058 () Bool)

(declare-fun res!984100 () Bool)

(assert (=> b!1453058 (=> (not res!984100) (not e!817899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453058 (= res!984100 (validKeyInArray!0 (select (arr!47502 a!2862) i!1006)))))

(declare-fun b!1453059 () Bool)

(assert (=> b!1453059 (= e!817901 e!817894)))

(declare-fun res!984108 () Bool)

(assert (=> b!1453059 (=> (not res!984108) (not e!817894))))

(assert (=> b!1453059 (= res!984108 (= lt!637121 (Intermediate!11754 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453059 (= lt!637121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637122 mask!2687) lt!637122 lt!637123 mask!2687))))

(assert (=> b!1453059 (= lt!637122 (select (store (arr!47502 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453060 () Bool)

(declare-fun e!817893 () Bool)

(assert (=> b!1453060 (= e!817895 e!817893)))

(declare-fun res!984111 () Bool)

(assert (=> b!1453060 (=> res!984111 e!817893)))

(declare-fun lt!637125 () (_ BitVec 64))

(assert (=> b!1453060 (= res!984111 (or (and (= (select (arr!47502 a!2862) index!646) lt!637125) (= (select (arr!47502 a!2862) index!646) (select (arr!47502 a!2862) j!93))) (= (select (arr!47502 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453060 (= lt!637125 (select (store (arr!47502 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453061 () Bool)

(assert (=> b!1453061 (= e!817900 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637122 lt!637123 mask!2687) (seekEntryOrOpen!0 lt!637122 lt!637123 mask!2687)))))

(declare-fun b!1453062 () Bool)

(declare-fun res!984112 () Bool)

(assert (=> b!1453062 (=> (not res!984112) (not e!817899))))

(assert (=> b!1453062 (= res!984112 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48052 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48052 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48052 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453063 () Bool)

(assert (=> b!1453063 (= e!817894 (not true))))

(assert (=> b!1453063 e!817895))

(declare-fun res!984104 () Bool)

(assert (=> b!1453063 (=> (not res!984104) (not e!817895))))

(assert (=> b!1453063 (= res!984104 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49004 0))(
  ( (Unit!49005) )
))
(declare-fun lt!637120 () Unit!49004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49004)

(assert (=> b!1453063 (= lt!637120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453064 () Bool)

(assert (=> b!1453064 (= e!817893 e!817898)))

(declare-fun res!984098 () Bool)

(assert (=> b!1453064 (=> (not res!984098) (not e!817898))))

(assert (=> b!1453064 (= res!984098 (and (= index!646 intermediateAfterIndex!19) (= lt!637125 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453065 () Bool)

(declare-fun res!984110 () Bool)

(assert (=> b!1453065 (=> (not res!984110) (not e!817899))))

(assert (=> b!1453065 (= res!984110 (validKeyInArray!0 (select (arr!47502 a!2862) j!93)))))

(assert (= (and start!124980 res!984105) b!1453046))

(assert (= (and b!1453046 res!984107) b!1453058))

(assert (= (and b!1453058 res!984100) b!1453065))

(assert (= (and b!1453065 res!984110) b!1453052))

(assert (= (and b!1453052 res!984101) b!1453057))

(assert (= (and b!1453057 res!984103) b!1453062))

(assert (= (and b!1453062 res!984112) b!1453056))

(assert (= (and b!1453056 res!984095) b!1453047))

(assert (= (and b!1453047 res!984097) b!1453050))

(assert (= (and b!1453050 res!984106) b!1453059))

(assert (= (and b!1453059 res!984108) b!1453053))

(assert (= (and b!1453053 c!133986) b!1453049))

(assert (= (and b!1453053 (not c!133986)) b!1453061))

(assert (= (and b!1453053 res!984099) b!1453051))

(assert (= (and b!1453051 res!984102) b!1453063))

(assert (= (and b!1453063 res!984104) b!1453054))

(assert (= (and b!1453054 res!984096) b!1453048))

(assert (= (and b!1453048 res!984109) b!1453060))

(assert (= (and b!1453060 (not res!984111)) b!1453064))

(assert (= (and b!1453064 res!984098) b!1453055))

(declare-fun m!1341591 () Bool)

(assert (=> b!1453050 m!1341591))

(assert (=> b!1453050 m!1341591))

(declare-fun m!1341593 () Bool)

(assert (=> b!1453050 m!1341593))

(assert (=> b!1453065 m!1341591))

(assert (=> b!1453065 m!1341591))

(declare-fun m!1341595 () Bool)

(assert (=> b!1453065 m!1341595))

(declare-fun m!1341597 () Bool)

(assert (=> b!1453060 m!1341597))

(assert (=> b!1453060 m!1341591))

(declare-fun m!1341599 () Bool)

(assert (=> b!1453060 m!1341599))

(declare-fun m!1341601 () Bool)

(assert (=> b!1453060 m!1341601))

(declare-fun m!1341603 () Bool)

(assert (=> b!1453058 m!1341603))

(assert (=> b!1453058 m!1341603))

(declare-fun m!1341605 () Bool)

(assert (=> b!1453058 m!1341605))

(assert (=> b!1453054 m!1341591))

(assert (=> b!1453054 m!1341591))

(declare-fun m!1341607 () Bool)

(assert (=> b!1453054 m!1341607))

(declare-fun m!1341609 () Bool)

(assert (=> b!1453049 m!1341609))

(declare-fun m!1341611 () Bool)

(assert (=> b!1453061 m!1341611))

(declare-fun m!1341613 () Bool)

(assert (=> b!1453061 m!1341613))

(assert (=> b!1453055 m!1341613))

(assert (=> b!1453055 m!1341611))

(declare-fun m!1341615 () Bool)

(assert (=> b!1453063 m!1341615))

(declare-fun m!1341617 () Bool)

(assert (=> b!1453063 m!1341617))

(assert (=> b!1453047 m!1341591))

(assert (=> b!1453047 m!1341591))

(declare-fun m!1341619 () Bool)

(assert (=> b!1453047 m!1341619))

(assert (=> b!1453047 m!1341619))

(assert (=> b!1453047 m!1341591))

(declare-fun m!1341621 () Bool)

(assert (=> b!1453047 m!1341621))

(declare-fun m!1341623 () Bool)

(assert (=> b!1453057 m!1341623))

(declare-fun m!1341625 () Bool)

(assert (=> b!1453048 m!1341625))

(assert (=> b!1453048 m!1341591))

(declare-fun m!1341627 () Bool)

(assert (=> start!124980 m!1341627))

(declare-fun m!1341629 () Bool)

(assert (=> start!124980 m!1341629))

(declare-fun m!1341631 () Bool)

(assert (=> b!1453059 m!1341631))

(assert (=> b!1453059 m!1341631))

(declare-fun m!1341633 () Bool)

(assert (=> b!1453059 m!1341633))

(assert (=> b!1453059 m!1341599))

(declare-fun m!1341635 () Bool)

(assert (=> b!1453059 m!1341635))

(assert (=> b!1453056 m!1341599))

(declare-fun m!1341637 () Bool)

(assert (=> b!1453056 m!1341637))

(declare-fun m!1341639 () Bool)

(assert (=> b!1453052 m!1341639))

(check-sat (not start!124980) (not b!1453063) (not b!1453055) (not b!1453057) (not b!1453052) (not b!1453065) (not b!1453058) (not b!1453047) (not b!1453050) (not b!1453061) (not b!1453054) (not b!1453049) (not b!1453059))
(check-sat)
