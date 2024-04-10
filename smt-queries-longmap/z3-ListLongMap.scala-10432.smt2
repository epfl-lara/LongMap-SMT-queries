; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122756 () Bool)

(assert start!122756)

(declare-fun b!1422783 () Bool)

(declare-fun res!958221 () Bool)

(declare-fun e!804293 () Bool)

(assert (=> b!1422783 (=> (not res!958221) (not e!804293))))

(declare-datatypes ((array!97121 0))(
  ( (array!97122 (arr!46878 (Array (_ BitVec 32) (_ BitVec 64))) (size!47428 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97121)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97121 (_ BitVec 32)) Bool)

(assert (=> b!1422783 (= res!958221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422784 () Bool)

(declare-fun e!804294 () Bool)

(assert (=> b!1422784 (= e!804294 true)))

(declare-fun lt!626829 () array!97121)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626832 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11163 0))(
  ( (MissingZero!11163 (index!47044 (_ BitVec 32))) (Found!11163 (index!47045 (_ BitVec 32))) (Intermediate!11163 (undefined!11975 Bool) (index!47046 (_ BitVec 32)) (x!128685 (_ BitVec 32))) (Undefined!11163) (MissingVacant!11163 (index!47047 (_ BitVec 32))) )
))
(declare-fun lt!626826 () SeekEntryResult!11163)

(declare-fun lt!626831 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97121 (_ BitVec 32)) SeekEntryResult!11163)

(assert (=> b!1422784 (= lt!626826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626831 lt!626832 lt!626829 mask!2608))))

(declare-fun res!958222 () Bool)

(assert (=> start!122756 (=> (not res!958222) (not e!804293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122756 (= res!958222 (validMask!0 mask!2608))))

(assert (=> start!122756 e!804293))

(assert (=> start!122756 true))

(declare-fun array_inv!35906 (array!97121) Bool)

(assert (=> start!122756 (array_inv!35906 a!2831)))

(declare-fun b!1422785 () Bool)

(declare-fun res!958226 () Bool)

(assert (=> b!1422785 (=> (not res!958226) (not e!804293))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422785 (= res!958226 (validKeyInArray!0 (select (arr!46878 a!2831) j!81)))))

(declare-fun b!1422786 () Bool)

(declare-fun res!958223 () Bool)

(declare-fun e!804295 () Bool)

(assert (=> b!1422786 (=> (not res!958223) (not e!804295))))

(declare-fun lt!626827 () SeekEntryResult!11163)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422786 (= res!958223 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46878 a!2831) j!81) a!2831 mask!2608) lt!626827))))

(declare-fun b!1422787 () Bool)

(declare-fun res!958216 () Bool)

(assert (=> b!1422787 (=> (not res!958216) (not e!804293))))

(declare-datatypes ((List!33388 0))(
  ( (Nil!33385) (Cons!33384 (h!34686 (_ BitVec 64)) (t!48082 List!33388)) )
))
(declare-fun arrayNoDuplicates!0 (array!97121 (_ BitVec 32) List!33388) Bool)

(assert (=> b!1422787 (= res!958216 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33385))))

(declare-fun b!1422788 () Bool)

(declare-fun res!958231 () Bool)

(assert (=> b!1422788 (=> (not res!958231) (not e!804293))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1422788 (= res!958231 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47428 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47428 a!2831))))))

(declare-fun b!1422789 () Bool)

(declare-fun e!804290 () Bool)

(assert (=> b!1422789 (= e!804295 (not e!804290))))

(declare-fun res!958217 () Bool)

(assert (=> b!1422789 (=> res!958217 e!804290)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422789 (= res!958217 (or (= (select (arr!46878 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46878 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46878 a!2831) index!585) (select (arr!46878 a!2831) j!81)) (= (select (store (arr!46878 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804292 () Bool)

(assert (=> b!1422789 e!804292))

(declare-fun res!958219 () Bool)

(assert (=> b!1422789 (=> (not res!958219) (not e!804292))))

(assert (=> b!1422789 (= res!958219 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48162 0))(
  ( (Unit!48163) )
))
(declare-fun lt!626830 () Unit!48162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48162)

(assert (=> b!1422789 (= lt!626830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422790 () Bool)

(declare-fun e!804291 () Bool)

(assert (=> b!1422790 (= e!804293 e!804291)))

(declare-fun res!958220 () Bool)

(assert (=> b!1422790 (=> (not res!958220) (not e!804291))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422790 (= res!958220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46878 a!2831) j!81) mask!2608) (select (arr!46878 a!2831) j!81) a!2831 mask!2608) lt!626827))))

(assert (=> b!1422790 (= lt!626827 (Intermediate!11163 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422791 () Bool)

(assert (=> b!1422791 (= e!804291 e!804295)))

(declare-fun res!958218 () Bool)

(assert (=> b!1422791 (=> (not res!958218) (not e!804295))))

(declare-fun lt!626828 () SeekEntryResult!11163)

(assert (=> b!1422791 (= res!958218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626832 mask!2608) lt!626832 lt!626829 mask!2608) lt!626828))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422791 (= lt!626828 (Intermediate!11163 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422791 (= lt!626832 (select (store (arr!46878 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422791 (= lt!626829 (array!97122 (store (arr!46878 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47428 a!2831)))))

(declare-fun b!1422792 () Bool)

(declare-fun res!958224 () Bool)

(assert (=> b!1422792 (=> res!958224 e!804294)))

(assert (=> b!1422792 (= res!958224 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626831 (select (arr!46878 a!2831) j!81) a!2831 mask!2608) lt!626827)))))

(declare-fun b!1422793 () Bool)

(declare-fun res!958228 () Bool)

(assert (=> b!1422793 (=> (not res!958228) (not e!804295))))

(assert (=> b!1422793 (= res!958228 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422794 () Bool)

(declare-fun res!958227 () Bool)

(assert (=> b!1422794 (=> (not res!958227) (not e!804295))))

(assert (=> b!1422794 (= res!958227 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626832 lt!626829 mask!2608) lt!626828))))

(declare-fun b!1422795 () Bool)

(declare-fun res!958225 () Bool)

(assert (=> b!1422795 (=> (not res!958225) (not e!804293))))

(assert (=> b!1422795 (= res!958225 (and (= (size!47428 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47428 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47428 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422796 () Bool)

(assert (=> b!1422796 (= e!804290 e!804294)))

(declare-fun res!958229 () Bool)

(assert (=> b!1422796 (=> res!958229 e!804294)))

(assert (=> b!1422796 (= res!958229 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626831 #b00000000000000000000000000000000) (bvsge lt!626831 (size!47428 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422796 (= lt!626831 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422797 () Bool)

(declare-fun res!958230 () Bool)

(assert (=> b!1422797 (=> (not res!958230) (not e!804293))))

(assert (=> b!1422797 (= res!958230 (validKeyInArray!0 (select (arr!46878 a!2831) i!982)))))

(declare-fun b!1422798 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97121 (_ BitVec 32)) SeekEntryResult!11163)

(assert (=> b!1422798 (= e!804292 (= (seekEntryOrOpen!0 (select (arr!46878 a!2831) j!81) a!2831 mask!2608) (Found!11163 j!81)))))

(assert (= (and start!122756 res!958222) b!1422795))

(assert (= (and b!1422795 res!958225) b!1422797))

(assert (= (and b!1422797 res!958230) b!1422785))

(assert (= (and b!1422785 res!958226) b!1422783))

(assert (= (and b!1422783 res!958221) b!1422787))

(assert (= (and b!1422787 res!958216) b!1422788))

(assert (= (and b!1422788 res!958231) b!1422790))

(assert (= (and b!1422790 res!958220) b!1422791))

(assert (= (and b!1422791 res!958218) b!1422786))

(assert (= (and b!1422786 res!958223) b!1422794))

(assert (= (and b!1422794 res!958227) b!1422793))

(assert (= (and b!1422793 res!958228) b!1422789))

(assert (= (and b!1422789 res!958219) b!1422798))

(assert (= (and b!1422789 (not res!958217)) b!1422796))

(assert (= (and b!1422796 (not res!958229)) b!1422792))

(assert (= (and b!1422792 (not res!958224)) b!1422784))

(declare-fun m!1313331 () Bool)

(assert (=> b!1422791 m!1313331))

(assert (=> b!1422791 m!1313331))

(declare-fun m!1313333 () Bool)

(assert (=> b!1422791 m!1313333))

(declare-fun m!1313335 () Bool)

(assert (=> b!1422791 m!1313335))

(declare-fun m!1313337 () Bool)

(assert (=> b!1422791 m!1313337))

(declare-fun m!1313339 () Bool)

(assert (=> b!1422786 m!1313339))

(assert (=> b!1422786 m!1313339))

(declare-fun m!1313341 () Bool)

(assert (=> b!1422786 m!1313341))

(assert (=> b!1422790 m!1313339))

(assert (=> b!1422790 m!1313339))

(declare-fun m!1313343 () Bool)

(assert (=> b!1422790 m!1313343))

(assert (=> b!1422790 m!1313343))

(assert (=> b!1422790 m!1313339))

(declare-fun m!1313345 () Bool)

(assert (=> b!1422790 m!1313345))

(declare-fun m!1313347 () Bool)

(assert (=> b!1422787 m!1313347))

(declare-fun m!1313349 () Bool)

(assert (=> b!1422794 m!1313349))

(assert (=> b!1422792 m!1313339))

(assert (=> b!1422792 m!1313339))

(declare-fun m!1313351 () Bool)

(assert (=> b!1422792 m!1313351))

(declare-fun m!1313353 () Bool)

(assert (=> start!122756 m!1313353))

(declare-fun m!1313355 () Bool)

(assert (=> start!122756 m!1313355))

(declare-fun m!1313357 () Bool)

(assert (=> b!1422783 m!1313357))

(assert (=> b!1422798 m!1313339))

(assert (=> b!1422798 m!1313339))

(declare-fun m!1313359 () Bool)

(assert (=> b!1422798 m!1313359))

(assert (=> b!1422785 m!1313339))

(assert (=> b!1422785 m!1313339))

(declare-fun m!1313361 () Bool)

(assert (=> b!1422785 m!1313361))

(declare-fun m!1313363 () Bool)

(assert (=> b!1422797 m!1313363))

(assert (=> b!1422797 m!1313363))

(declare-fun m!1313365 () Bool)

(assert (=> b!1422797 m!1313365))

(declare-fun m!1313367 () Bool)

(assert (=> b!1422784 m!1313367))

(assert (=> b!1422789 m!1313335))

(declare-fun m!1313369 () Bool)

(assert (=> b!1422789 m!1313369))

(declare-fun m!1313371 () Bool)

(assert (=> b!1422789 m!1313371))

(declare-fun m!1313373 () Bool)

(assert (=> b!1422789 m!1313373))

(assert (=> b!1422789 m!1313339))

(declare-fun m!1313375 () Bool)

(assert (=> b!1422789 m!1313375))

(declare-fun m!1313377 () Bool)

(assert (=> b!1422796 m!1313377))

(check-sat (not b!1422787) (not b!1422796) (not b!1422794) (not b!1422785) (not b!1422784) (not b!1422798) (not b!1422789) (not b!1422786) (not b!1422791) (not b!1422783) (not b!1422797) (not start!122756) (not b!1422790) (not b!1422792))
(check-sat)
