; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126866 () Bool)

(assert start!126866)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650009 () (_ BitVec 64))

(declare-datatypes ((array!99637 0))(
  ( (array!99638 (arr!48091 (Array (_ BitVec 32) (_ BitVec 64))) (size!48643 (_ BitVec 32))) )
))
(declare-fun lt!650012 () array!99637)

(declare-fun b!1491175 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!835451 () Bool)

(declare-datatypes ((SeekEntryResult!12356 0))(
  ( (MissingZero!12356 (index!51816 (_ BitVec 32))) (Found!12356 (index!51817 (_ BitVec 32))) (Intermediate!12356 (undefined!13168 Bool) (index!51818 (_ BitVec 32)) (x!133397 (_ BitVec 32))) (Undefined!12356) (MissingVacant!12356 (index!51819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12356)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12356)

(assert (=> b!1491175 (= e!835451 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650009 lt!650012 mask!2687) (seekEntryOrOpen!0 lt!650009 lt!650012 mask!2687)))))

(declare-fun b!1491176 () Bool)

(declare-fun res!1014559 () Bool)

(declare-fun e!835447 () Bool)

(assert (=> b!1491176 (=> (not res!1014559) (not e!835447))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491176 (= res!1014559 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!650011 () SeekEntryResult!12356)

(declare-fun b!1491177 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12356)

(assert (=> b!1491177 (= e!835451 (= lt!650011 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650009 lt!650012 mask!2687)))))

(declare-fun b!1491178 () Bool)

(declare-fun res!1014562 () Bool)

(declare-fun e!835445 () Bool)

(assert (=> b!1491178 (=> (not res!1014562) (not e!835445))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99637)

(assert (=> b!1491178 (= res!1014562 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48643 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48643 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48643 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491179 () Bool)

(declare-fun e!835450 () Bool)

(assert (=> b!1491179 (= e!835445 e!835450)))

(declare-fun res!1014564 () Bool)

(assert (=> b!1491179 (=> (not res!1014564) (not e!835450))))

(assert (=> b!1491179 (= res!1014564 (= (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491179 (= lt!650012 (array!99638 (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48643 a!2862)))))

(declare-fun b!1491180 () Bool)

(declare-fun res!1014569 () Bool)

(declare-fun e!835449 () Bool)

(assert (=> b!1491180 (=> (not res!1014569) (not e!835449))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491180 (= res!1014569 (= (seekEntryOrOpen!0 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) (Found!12356 j!93)))))

(declare-fun b!1491182 () Bool)

(declare-fun res!1014561 () Bool)

(assert (=> b!1491182 (=> (not res!1014561) (not e!835445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99637 (_ BitVec 32)) Bool)

(assert (=> b!1491182 (= res!1014561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491183 () Bool)

(declare-fun e!835448 () Bool)

(assert (=> b!1491183 (= e!835448 true)))

(declare-fun lt!650010 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491183 (= lt!650010 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491184 () Bool)

(declare-fun res!1014563 () Bool)

(assert (=> b!1491184 (=> (not res!1014563) (not e!835447))))

(assert (=> b!1491184 (= res!1014563 e!835451)))

(declare-fun c!137839 () Bool)

(assert (=> b!1491184 (= c!137839 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491185 () Bool)

(assert (=> b!1491185 (= e!835447 (not e!835448))))

(declare-fun res!1014557 () Bool)

(assert (=> b!1491185 (=> res!1014557 e!835448)))

(assert (=> b!1491185 (= res!1014557 (or (and (= (select (arr!48091 a!2862) index!646) (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48091 a!2862) index!646) (select (arr!48091 a!2862) j!93))) (= (select (arr!48091 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491185 e!835449))

(declare-fun res!1014565 () Bool)

(assert (=> b!1491185 (=> (not res!1014565) (not e!835449))))

(assert (=> b!1491185 (= res!1014565 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49893 0))(
  ( (Unit!49894) )
))
(declare-fun lt!650008 () Unit!49893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49893)

(assert (=> b!1491185 (= lt!650008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491186 () Bool)

(declare-fun e!835444 () Bool)

(assert (=> b!1491186 (= e!835450 e!835444)))

(declare-fun res!1014558 () Bool)

(assert (=> b!1491186 (=> (not res!1014558) (not e!835444))))

(declare-fun lt!650007 () SeekEntryResult!12356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491186 (= res!1014558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48091 a!2862) j!93) mask!2687) (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!650007))))

(assert (=> b!1491186 (= lt!650007 (Intermediate!12356 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491187 () Bool)

(assert (=> b!1491187 (= e!835444 e!835447)))

(declare-fun res!1014566 () Bool)

(assert (=> b!1491187 (=> (not res!1014566) (not e!835447))))

(assert (=> b!1491187 (= res!1014566 (= lt!650011 (Intermediate!12356 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491187 (= lt!650011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650009 mask!2687) lt!650009 lt!650012 mask!2687))))

(assert (=> b!1491187 (= lt!650009 (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491188 () Bool)

(declare-fun res!1014567 () Bool)

(assert (=> b!1491188 (=> (not res!1014567) (not e!835445))))

(assert (=> b!1491188 (= res!1014567 (and (= (size!48643 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48643 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48643 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491189 () Bool)

(declare-fun res!1014560 () Bool)

(assert (=> b!1491189 (=> (not res!1014560) (not e!835445))))

(declare-datatypes ((List!34670 0))(
  ( (Nil!34667) (Cons!34666 (h!36049 (_ BitVec 64)) (t!49356 List!34670)) )
))
(declare-fun arrayNoDuplicates!0 (array!99637 (_ BitVec 32) List!34670) Bool)

(assert (=> b!1491189 (= res!1014560 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34667))))

(declare-fun b!1491190 () Bool)

(declare-fun res!1014556 () Bool)

(assert (=> b!1491190 (=> (not res!1014556) (not e!835445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491190 (= res!1014556 (validKeyInArray!0 (select (arr!48091 a!2862) i!1006)))))

(declare-fun b!1491191 () Bool)

(declare-fun res!1014568 () Bool)

(assert (=> b!1491191 (=> (not res!1014568) (not e!835444))))

(assert (=> b!1491191 (= res!1014568 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!650007))))

(declare-fun b!1491192 () Bool)

(assert (=> b!1491192 (= e!835449 (or (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) (select (arr!48091 a!2862) j!93))))))

(declare-fun res!1014570 () Bool)

(assert (=> start!126866 (=> (not res!1014570) (not e!835445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126866 (= res!1014570 (validMask!0 mask!2687))))

(assert (=> start!126866 e!835445))

(assert (=> start!126866 true))

(declare-fun array_inv!37324 (array!99637) Bool)

(assert (=> start!126866 (array_inv!37324 a!2862)))

(declare-fun b!1491181 () Bool)

(declare-fun res!1014571 () Bool)

(assert (=> b!1491181 (=> (not res!1014571) (not e!835445))))

(assert (=> b!1491181 (= res!1014571 (validKeyInArray!0 (select (arr!48091 a!2862) j!93)))))

(assert (= (and start!126866 res!1014570) b!1491188))

(assert (= (and b!1491188 res!1014567) b!1491190))

(assert (= (and b!1491190 res!1014556) b!1491181))

(assert (= (and b!1491181 res!1014571) b!1491182))

(assert (= (and b!1491182 res!1014561) b!1491189))

(assert (= (and b!1491189 res!1014560) b!1491178))

(assert (= (and b!1491178 res!1014562) b!1491179))

(assert (= (and b!1491179 res!1014564) b!1491186))

(assert (= (and b!1491186 res!1014558) b!1491191))

(assert (= (and b!1491191 res!1014568) b!1491187))

(assert (= (and b!1491187 res!1014566) b!1491184))

(assert (= (and b!1491184 c!137839) b!1491177))

(assert (= (and b!1491184 (not c!137839)) b!1491175))

(assert (= (and b!1491184 res!1014563) b!1491176))

(assert (= (and b!1491176 res!1014559) b!1491185))

(assert (= (and b!1491185 res!1014565) b!1491180))

(assert (= (and b!1491180 res!1014569) b!1491192))

(assert (= (and b!1491185 (not res!1014557)) b!1491183))

(declare-fun m!1374759 () Bool)

(assert (=> b!1491181 m!1374759))

(assert (=> b!1491181 m!1374759))

(declare-fun m!1374761 () Bool)

(assert (=> b!1491181 m!1374761))

(declare-fun m!1374763 () Bool)

(assert (=> b!1491182 m!1374763))

(assert (=> b!1491191 m!1374759))

(assert (=> b!1491191 m!1374759))

(declare-fun m!1374765 () Bool)

(assert (=> b!1491191 m!1374765))

(declare-fun m!1374767 () Bool)

(assert (=> b!1491190 m!1374767))

(assert (=> b!1491190 m!1374767))

(declare-fun m!1374769 () Bool)

(assert (=> b!1491190 m!1374769))

(declare-fun m!1374771 () Bool)

(assert (=> b!1491185 m!1374771))

(declare-fun m!1374773 () Bool)

(assert (=> b!1491185 m!1374773))

(declare-fun m!1374775 () Bool)

(assert (=> b!1491185 m!1374775))

(declare-fun m!1374777 () Bool)

(assert (=> b!1491185 m!1374777))

(declare-fun m!1374779 () Bool)

(assert (=> b!1491185 m!1374779))

(assert (=> b!1491185 m!1374759))

(declare-fun m!1374781 () Bool)

(assert (=> b!1491187 m!1374781))

(assert (=> b!1491187 m!1374781))

(declare-fun m!1374783 () Bool)

(assert (=> b!1491187 m!1374783))

(assert (=> b!1491187 m!1374773))

(declare-fun m!1374785 () Bool)

(assert (=> b!1491187 m!1374785))

(declare-fun m!1374787 () Bool)

(assert (=> b!1491189 m!1374787))

(assert (=> b!1491180 m!1374759))

(assert (=> b!1491180 m!1374759))

(declare-fun m!1374789 () Bool)

(assert (=> b!1491180 m!1374789))

(assert (=> b!1491179 m!1374773))

(declare-fun m!1374791 () Bool)

(assert (=> b!1491179 m!1374791))

(assert (=> b!1491186 m!1374759))

(assert (=> b!1491186 m!1374759))

(declare-fun m!1374793 () Bool)

(assert (=> b!1491186 m!1374793))

(assert (=> b!1491186 m!1374793))

(assert (=> b!1491186 m!1374759))

(declare-fun m!1374795 () Bool)

(assert (=> b!1491186 m!1374795))

(declare-fun m!1374797 () Bool)

(assert (=> b!1491175 m!1374797))

(declare-fun m!1374799 () Bool)

(assert (=> b!1491175 m!1374799))

(declare-fun m!1374801 () Bool)

(assert (=> b!1491192 m!1374801))

(assert (=> b!1491192 m!1374759))

(declare-fun m!1374803 () Bool)

(assert (=> start!126866 m!1374803))

(declare-fun m!1374805 () Bool)

(assert (=> start!126866 m!1374805))

(declare-fun m!1374807 () Bool)

(assert (=> b!1491177 m!1374807))

(declare-fun m!1374809 () Bool)

(assert (=> b!1491183 m!1374809))

(check-sat (not b!1491182) (not b!1491175) (not b!1491177) (not b!1491191) (not b!1491181) (not b!1491180) (not start!126866) (not b!1491186) (not b!1491190) (not b!1491189) (not b!1491183) (not b!1491187) (not b!1491185))
(check-sat)
