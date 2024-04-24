; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125556 () Bool)

(assert start!125556)

(declare-fun b!1464355 () Bool)

(declare-fun res!992667 () Bool)

(declare-fun e!823233 () Bool)

(assert (=> b!1464355 (=> (not res!992667) (not e!823233))))

(declare-fun e!823229 () Bool)

(assert (=> b!1464355 (= res!992667 e!823229)))

(declare-fun c!135372 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464355 (= c!135372 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!992663 () Bool)

(declare-fun e!823228 () Bool)

(assert (=> start!125556 (=> (not res!992663) (not e!823228))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125556 (= res!992663 (validMask!0 mask!2687))))

(assert (=> start!125556 e!823228))

(assert (=> start!125556 true))

(declare-datatypes ((array!98842 0))(
  ( (array!98843 (arr!47704 (Array (_ BitVec 32) (_ BitVec 64))) (size!48255 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98842)

(declare-fun array_inv!36985 (array!98842) Bool)

(assert (=> start!125556 (array_inv!36985 a!2862)))

(declare-fun b!1464356 () Bool)

(declare-fun res!992658 () Bool)

(assert (=> b!1464356 (=> (not res!992658) (not e!823228))))

(declare-datatypes ((List!34192 0))(
  ( (Nil!34189) (Cons!34188 (h!35552 (_ BitVec 64)) (t!48878 List!34192)) )
))
(declare-fun arrayNoDuplicates!0 (array!98842 (_ BitVec 32) List!34192) Bool)

(assert (=> b!1464356 (= res!992658 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34189))))

(declare-fun b!1464357 () Bool)

(declare-fun res!992662 () Bool)

(assert (=> b!1464357 (=> (not res!992662) (not e!823228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98842 (_ BitVec 32)) Bool)

(assert (=> b!1464357 (= res!992662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641158 () array!98842)

(declare-fun lt!641157 () (_ BitVec 64))

(declare-fun b!1464358 () Bool)

(declare-datatypes ((SeekEntryResult!11853 0))(
  ( (MissingZero!11853 (index!49804 (_ BitVec 32))) (Found!11853 (index!49805 (_ BitVec 32))) (Intermediate!11853 (undefined!12665 Bool) (index!49806 (_ BitVec 32)) (x!131583 (_ BitVec 32))) (Undefined!11853) (MissingVacant!11853 (index!49807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11853)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11853)

(assert (=> b!1464358 (= e!823229 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641157 lt!641158 mask!2687) (seekEntryOrOpen!0 lt!641157 lt!641158 mask!2687)))))

(declare-fun b!1464359 () Bool)

(declare-fun res!992656 () Bool)

(declare-fun e!823224 () Bool)

(assert (=> b!1464359 (=> (not res!992656) (not e!823224))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464359 (= res!992656 (= (seekEntryOrOpen!0 (select (arr!47704 a!2862) j!93) a!2862 mask!2687) (Found!11853 j!93)))))

(declare-fun b!1464360 () Bool)

(declare-fun res!992665 () Bool)

(assert (=> b!1464360 (=> (not res!992665) (not e!823228))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464360 (= res!992665 (and (= (size!48255 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48255 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48255 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!641155 () SeekEntryResult!11853)

(declare-fun b!1464361 () Bool)

(declare-fun lt!641153 () (_ BitVec 32))

(declare-fun e!823232 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98842 (_ BitVec 32)) SeekEntryResult!11853)

(assert (=> b!1464361 (= e!823232 (not (= lt!641155 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641153 lt!641157 lt!641158 mask!2687))))))

(declare-fun b!1464362 () Bool)

(declare-fun e!823227 () Bool)

(assert (=> b!1464362 (= e!823228 e!823227)))

(declare-fun res!992666 () Bool)

(assert (=> b!1464362 (=> (not res!992666) (not e!823227))))

(assert (=> b!1464362 (= res!992666 (= (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464362 (= lt!641158 (array!98843 (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48255 a!2862)))))

(declare-fun b!1464363 () Bool)

(declare-fun res!992653 () Bool)

(assert (=> b!1464363 (=> (not res!992653) (not e!823233))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464363 (= res!992653 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464364 () Bool)

(declare-fun res!992655 () Bool)

(declare-fun e!823230 () Bool)

(assert (=> b!1464364 (=> res!992655 e!823230)))

(declare-fun lt!641152 () SeekEntryResult!11853)

(assert (=> b!1464364 (= res!992655 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641153 (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641152)))))

(declare-fun b!1464365 () Bool)

(declare-fun e!823225 () Bool)

(assert (=> b!1464365 (= e!823233 (not e!823225))))

(declare-fun res!992657 () Bool)

(assert (=> b!1464365 (=> res!992657 e!823225)))

(assert (=> b!1464365 (= res!992657 (or (and (= (select (arr!47704 a!2862) index!646) (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47704 a!2862) index!646) (select (arr!47704 a!2862) j!93))) (= (select (arr!47704 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464365 e!823224))

(declare-fun res!992669 () Bool)

(assert (=> b!1464365 (=> (not res!992669) (not e!823224))))

(assert (=> b!1464365 (= res!992669 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49235 0))(
  ( (Unit!49236) )
))
(declare-fun lt!641154 () Unit!49235)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49235)

(assert (=> b!1464365 (= lt!641154 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464366 () Bool)

(assert (=> b!1464366 (= e!823229 (= lt!641155 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641157 lt!641158 mask!2687)))))

(declare-fun b!1464367 () Bool)

(declare-fun res!992668 () Bool)

(assert (=> b!1464367 (=> (not res!992668) (not e!823228))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1464367 (= res!992668 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48255 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48255 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48255 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464368 () Bool)

(assert (=> b!1464368 (= e!823232 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641153 intermediateAfterIndex!19 lt!641157 lt!641158 mask!2687) (seekEntryOrOpen!0 lt!641157 lt!641158 mask!2687))))))

(declare-fun b!1464369 () Bool)

(declare-fun res!992654 () Bool)

(declare-fun e!823226 () Bool)

(assert (=> b!1464369 (=> (not res!992654) (not e!823226))))

(assert (=> b!1464369 (= res!992654 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641152))))

(declare-fun b!1464370 () Bool)

(assert (=> b!1464370 (= e!823224 (or (= (select (arr!47704 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47704 a!2862) intermediateBeforeIndex!19) (select (arr!47704 a!2862) j!93))))))

(declare-fun b!1464371 () Bool)

(declare-fun res!992659 () Bool)

(assert (=> b!1464371 (=> (not res!992659) (not e!823228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464371 (= res!992659 (validKeyInArray!0 (select (arr!47704 a!2862) j!93)))))

(declare-fun b!1464372 () Bool)

(assert (=> b!1464372 (= e!823226 e!823233)))

(declare-fun res!992664 () Bool)

(assert (=> b!1464372 (=> (not res!992664) (not e!823233))))

(assert (=> b!1464372 (= res!992664 (= lt!641155 (Intermediate!11853 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464372 (= lt!641155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641157 mask!2687) lt!641157 lt!641158 mask!2687))))

(assert (=> b!1464372 (= lt!641157 (select (store (arr!47704 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464373 () Bool)

(assert (=> b!1464373 (= e!823225 e!823230)))

(declare-fun res!992652 () Bool)

(assert (=> b!1464373 (=> res!992652 e!823230)))

(assert (=> b!1464373 (= res!992652 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641153 #b00000000000000000000000000000000) (bvsge lt!641153 (size!48255 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464373 (= lt!641153 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1464374 () Bool)

(assert (=> b!1464374 (= e!823230 true)))

(declare-fun lt!641156 () Bool)

(assert (=> b!1464374 (= lt!641156 e!823232)))

(declare-fun c!135373 () Bool)

(assert (=> b!1464374 (= c!135373 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464375 () Bool)

(declare-fun res!992661 () Bool)

(assert (=> b!1464375 (=> (not res!992661) (not e!823228))))

(assert (=> b!1464375 (= res!992661 (validKeyInArray!0 (select (arr!47704 a!2862) i!1006)))))

(declare-fun b!1464376 () Bool)

(assert (=> b!1464376 (= e!823227 e!823226)))

(declare-fun res!992660 () Bool)

(assert (=> b!1464376 (=> (not res!992660) (not e!823226))))

(assert (=> b!1464376 (= res!992660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47704 a!2862) j!93) mask!2687) (select (arr!47704 a!2862) j!93) a!2862 mask!2687) lt!641152))))

(assert (=> b!1464376 (= lt!641152 (Intermediate!11853 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125556 res!992663) b!1464360))

(assert (= (and b!1464360 res!992665) b!1464375))

(assert (= (and b!1464375 res!992661) b!1464371))

(assert (= (and b!1464371 res!992659) b!1464357))

(assert (= (and b!1464357 res!992662) b!1464356))

(assert (= (and b!1464356 res!992658) b!1464367))

(assert (= (and b!1464367 res!992668) b!1464362))

(assert (= (and b!1464362 res!992666) b!1464376))

(assert (= (and b!1464376 res!992660) b!1464369))

(assert (= (and b!1464369 res!992654) b!1464372))

(assert (= (and b!1464372 res!992664) b!1464355))

(assert (= (and b!1464355 c!135372) b!1464366))

(assert (= (and b!1464355 (not c!135372)) b!1464358))

(assert (= (and b!1464355 res!992667) b!1464363))

(assert (= (and b!1464363 res!992653) b!1464365))

(assert (= (and b!1464365 res!992669) b!1464359))

(assert (= (and b!1464359 res!992656) b!1464370))

(assert (= (and b!1464365 (not res!992657)) b!1464373))

(assert (= (and b!1464373 (not res!992652)) b!1464364))

(assert (= (and b!1464364 (not res!992655)) b!1464374))

(assert (= (and b!1464374 c!135373) b!1464361))

(assert (= (and b!1464374 (not c!135373)) b!1464368))

(declare-fun m!1351765 () Bool)

(assert (=> b!1464362 m!1351765))

(declare-fun m!1351767 () Bool)

(assert (=> b!1464362 m!1351767))

(declare-fun m!1351769 () Bool)

(assert (=> start!125556 m!1351769))

(declare-fun m!1351771 () Bool)

(assert (=> start!125556 m!1351771))

(declare-fun m!1351773 () Bool)

(assert (=> b!1464369 m!1351773))

(assert (=> b!1464369 m!1351773))

(declare-fun m!1351775 () Bool)

(assert (=> b!1464369 m!1351775))

(declare-fun m!1351777 () Bool)

(assert (=> b!1464373 m!1351777))

(assert (=> b!1464376 m!1351773))

(assert (=> b!1464376 m!1351773))

(declare-fun m!1351779 () Bool)

(assert (=> b!1464376 m!1351779))

(assert (=> b!1464376 m!1351779))

(assert (=> b!1464376 m!1351773))

(declare-fun m!1351781 () Bool)

(assert (=> b!1464376 m!1351781))

(declare-fun m!1351783 () Bool)

(assert (=> b!1464356 m!1351783))

(declare-fun m!1351785 () Bool)

(assert (=> b!1464358 m!1351785))

(declare-fun m!1351787 () Bool)

(assert (=> b!1464358 m!1351787))

(declare-fun m!1351789 () Bool)

(assert (=> b!1464357 m!1351789))

(declare-fun m!1351791 () Bool)

(assert (=> b!1464375 m!1351791))

(assert (=> b!1464375 m!1351791))

(declare-fun m!1351793 () Bool)

(assert (=> b!1464375 m!1351793))

(declare-fun m!1351795 () Bool)

(assert (=> b!1464372 m!1351795))

(assert (=> b!1464372 m!1351795))

(declare-fun m!1351797 () Bool)

(assert (=> b!1464372 m!1351797))

(assert (=> b!1464372 m!1351765))

(declare-fun m!1351799 () Bool)

(assert (=> b!1464372 m!1351799))

(declare-fun m!1351801 () Bool)

(assert (=> b!1464370 m!1351801))

(assert (=> b!1464370 m!1351773))

(declare-fun m!1351803 () Bool)

(assert (=> b!1464365 m!1351803))

(assert (=> b!1464365 m!1351765))

(declare-fun m!1351805 () Bool)

(assert (=> b!1464365 m!1351805))

(declare-fun m!1351807 () Bool)

(assert (=> b!1464365 m!1351807))

(declare-fun m!1351809 () Bool)

(assert (=> b!1464365 m!1351809))

(assert (=> b!1464365 m!1351773))

(declare-fun m!1351811 () Bool)

(assert (=> b!1464361 m!1351811))

(declare-fun m!1351813 () Bool)

(assert (=> b!1464368 m!1351813))

(assert (=> b!1464368 m!1351787))

(assert (=> b!1464364 m!1351773))

(assert (=> b!1464364 m!1351773))

(declare-fun m!1351815 () Bool)

(assert (=> b!1464364 m!1351815))

(declare-fun m!1351817 () Bool)

(assert (=> b!1464366 m!1351817))

(assert (=> b!1464371 m!1351773))

(assert (=> b!1464371 m!1351773))

(declare-fun m!1351819 () Bool)

(assert (=> b!1464371 m!1351819))

(assert (=> b!1464359 m!1351773))

(assert (=> b!1464359 m!1351773))

(declare-fun m!1351821 () Bool)

(assert (=> b!1464359 m!1351821))

(check-sat (not b!1464356) (not b!1464368) (not b!1464361) (not b!1464364) (not b!1464357) (not b!1464373) (not b!1464359) (not b!1464369) (not b!1464375) (not b!1464358) (not b!1464372) (not b!1464365) (not b!1464376) (not b!1464371) (not start!125556) (not b!1464366))
(check-sat)
