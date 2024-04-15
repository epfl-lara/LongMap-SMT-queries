; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123632 () Bool)

(assert start!123632)

(declare-fun b!1433342 () Bool)

(declare-fun e!809020 () Bool)

(declare-fun e!809021 () Bool)

(assert (=> b!1433342 (= e!809020 (not e!809021))))

(declare-fun res!967113 () Bool)

(assert (=> b!1433342 (=> res!967113 e!809021)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97512 0))(
  ( (array!97513 (arr!47062 (Array (_ BitVec 32) (_ BitVec 64))) (size!47614 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97512)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433342 (= res!967113 (or (= (select (arr!47062 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47062 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47062 a!2831) index!585) (select (arr!47062 a!2831) j!81)) (= (select (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809022 () Bool)

(assert (=> b!1433342 e!809022))

(declare-fun res!967119 () Bool)

(assert (=> b!1433342 (=> (not res!967119) (not e!809022))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97512 (_ BitVec 32)) Bool)

(assert (=> b!1433342 (= res!967119 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48321 0))(
  ( (Unit!48322) )
))
(declare-fun lt!630838 () Unit!48321)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48321)

(assert (=> b!1433342 (= lt!630838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433343 () Bool)

(declare-fun e!809023 () Bool)

(declare-fun e!809024 () Bool)

(assert (=> b!1433343 (= e!809023 e!809024)))

(declare-fun res!967118 () Bool)

(assert (=> b!1433343 (=> (not res!967118) (not e!809024))))

(declare-datatypes ((SeekEntryResult!11368 0))(
  ( (MissingZero!11368 (index!47864 (_ BitVec 32))) (Found!11368 (index!47865 (_ BitVec 32))) (Intermediate!11368 (undefined!12180 Bool) (index!47866 (_ BitVec 32)) (x!129502 (_ BitVec 32))) (Undefined!11368) (MissingVacant!11368 (index!47867 (_ BitVec 32))) )
))
(declare-fun lt!630835 () SeekEntryResult!11368)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97512 (_ BitVec 32)) SeekEntryResult!11368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433343 (= res!967118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630835))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433343 (= lt!630835 (Intermediate!11368 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433344 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97512 (_ BitVec 32)) SeekEntryResult!11368)

(assert (=> b!1433344 (= e!809022 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) (Found!11368 j!81)))))

(declare-fun b!1433345 () Bool)

(assert (=> b!1433345 (= e!809024 e!809020)))

(declare-fun res!967116 () Bool)

(assert (=> b!1433345 (=> (not res!967116) (not e!809020))))

(declare-fun lt!630836 () (_ BitVec 64))

(declare-fun lt!630840 () array!97512)

(declare-fun lt!630839 () SeekEntryResult!11368)

(assert (=> b!1433345 (= res!967116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630836 mask!2608) lt!630836 lt!630840 mask!2608) lt!630839))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433345 (= lt!630839 (Intermediate!11368 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433345 (= lt!630836 (select (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433345 (= lt!630840 (array!97513 (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47614 a!2831)))))

(declare-fun b!1433346 () Bool)

(declare-fun res!967117 () Bool)

(assert (=> b!1433346 (=> (not res!967117) (not e!809023))))

(assert (=> b!1433346 (= res!967117 (and (= (size!47614 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47614 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47614 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433347 () Bool)

(declare-fun res!967122 () Bool)

(assert (=> b!1433347 (=> (not res!967122) (not e!809020))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433347 (= res!967122 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630835))))

(declare-fun b!1433348 () Bool)

(declare-fun res!967112 () Bool)

(assert (=> b!1433348 (=> (not res!967112) (not e!809023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433348 (= res!967112 (validKeyInArray!0 (select (arr!47062 a!2831) i!982)))))

(declare-fun b!1433349 () Bool)

(declare-fun res!967120 () Bool)

(assert (=> b!1433349 (=> (not res!967120) (not e!809023))))

(assert (=> b!1433349 (= res!967120 (validKeyInArray!0 (select (arr!47062 a!2831) j!81)))))

(declare-fun b!1433350 () Bool)

(declare-fun res!967110 () Bool)

(assert (=> b!1433350 (=> (not res!967110) (not e!809023))))

(assert (=> b!1433350 (= res!967110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433351 () Bool)

(declare-fun res!967111 () Bool)

(assert (=> b!1433351 (=> (not res!967111) (not e!809023))))

(assert (=> b!1433351 (= res!967111 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47614 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47614 a!2831))))))

(declare-fun lt!630837 () (_ BitVec 32))

(declare-fun b!1433352 () Bool)

(assert (=> b!1433352 (= e!809021 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (and (bvsge lt!630837 #b00000000000000000000000000000000) (bvslt lt!630837 (size!47614 a!2831)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433352 (= lt!630837 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433353 () Bool)

(declare-fun res!967115 () Bool)

(assert (=> b!1433353 (=> (not res!967115) (not e!809020))))

(assert (=> b!1433353 (= res!967115 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433354 () Bool)

(declare-fun res!967123 () Bool)

(assert (=> b!1433354 (=> (not res!967123) (not e!809020))))

(assert (=> b!1433354 (= res!967123 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630836 lt!630840 mask!2608) lt!630839))))

(declare-fun res!967121 () Bool)

(assert (=> start!123632 (=> (not res!967121) (not e!809023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123632 (= res!967121 (validMask!0 mask!2608))))

(assert (=> start!123632 e!809023))

(assert (=> start!123632 true))

(declare-fun array_inv!36295 (array!97512) Bool)

(assert (=> start!123632 (array_inv!36295 a!2831)))

(declare-fun b!1433355 () Bool)

(declare-fun res!967114 () Bool)

(assert (=> b!1433355 (=> (not res!967114) (not e!809023))))

(declare-datatypes ((List!33650 0))(
  ( (Nil!33647) (Cons!33646 (h!34972 (_ BitVec 64)) (t!48336 List!33650)) )
))
(declare-fun arrayNoDuplicates!0 (array!97512 (_ BitVec 32) List!33650) Bool)

(assert (=> b!1433355 (= res!967114 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33647))))

(assert (= (and start!123632 res!967121) b!1433346))

(assert (= (and b!1433346 res!967117) b!1433348))

(assert (= (and b!1433348 res!967112) b!1433349))

(assert (= (and b!1433349 res!967120) b!1433350))

(assert (= (and b!1433350 res!967110) b!1433355))

(assert (= (and b!1433355 res!967114) b!1433351))

(assert (= (and b!1433351 res!967111) b!1433343))

(assert (= (and b!1433343 res!967118) b!1433345))

(assert (= (and b!1433345 res!967116) b!1433347))

(assert (= (and b!1433347 res!967122) b!1433354))

(assert (= (and b!1433354 res!967123) b!1433353))

(assert (= (and b!1433353 res!967115) b!1433342))

(assert (= (and b!1433342 res!967119) b!1433344))

(assert (= (and b!1433342 (not res!967113)) b!1433352))

(declare-fun m!1322579 () Bool)

(assert (=> b!1433344 m!1322579))

(assert (=> b!1433344 m!1322579))

(declare-fun m!1322581 () Bool)

(assert (=> b!1433344 m!1322581))

(declare-fun m!1322583 () Bool)

(assert (=> b!1433342 m!1322583))

(declare-fun m!1322585 () Bool)

(assert (=> b!1433342 m!1322585))

(declare-fun m!1322587 () Bool)

(assert (=> b!1433342 m!1322587))

(declare-fun m!1322589 () Bool)

(assert (=> b!1433342 m!1322589))

(assert (=> b!1433342 m!1322579))

(declare-fun m!1322591 () Bool)

(assert (=> b!1433342 m!1322591))

(assert (=> b!1433347 m!1322579))

(assert (=> b!1433347 m!1322579))

(declare-fun m!1322593 () Bool)

(assert (=> b!1433347 m!1322593))

(declare-fun m!1322595 () Bool)

(assert (=> b!1433354 m!1322595))

(assert (=> b!1433343 m!1322579))

(assert (=> b!1433343 m!1322579))

(declare-fun m!1322597 () Bool)

(assert (=> b!1433343 m!1322597))

(assert (=> b!1433343 m!1322597))

(assert (=> b!1433343 m!1322579))

(declare-fun m!1322599 () Bool)

(assert (=> b!1433343 m!1322599))

(declare-fun m!1322601 () Bool)

(assert (=> b!1433350 m!1322601))

(declare-fun m!1322603 () Bool)

(assert (=> b!1433352 m!1322603))

(declare-fun m!1322605 () Bool)

(assert (=> start!123632 m!1322605))

(declare-fun m!1322607 () Bool)

(assert (=> start!123632 m!1322607))

(declare-fun m!1322609 () Bool)

(assert (=> b!1433348 m!1322609))

(assert (=> b!1433348 m!1322609))

(declare-fun m!1322611 () Bool)

(assert (=> b!1433348 m!1322611))

(declare-fun m!1322613 () Bool)

(assert (=> b!1433345 m!1322613))

(assert (=> b!1433345 m!1322613))

(declare-fun m!1322615 () Bool)

(assert (=> b!1433345 m!1322615))

(assert (=> b!1433345 m!1322583))

(declare-fun m!1322617 () Bool)

(assert (=> b!1433345 m!1322617))

(declare-fun m!1322619 () Bool)

(assert (=> b!1433355 m!1322619))

(assert (=> b!1433349 m!1322579))

(assert (=> b!1433349 m!1322579))

(declare-fun m!1322621 () Bool)

(assert (=> b!1433349 m!1322621))

(check-sat (not b!1433348) (not b!1433343) (not b!1433349) (not b!1433347) (not b!1433352) (not b!1433355) (not start!123632) (not b!1433345) (not b!1433344) (not b!1433350) (not b!1433342) (not b!1433354))
(check-sat)
(get-model)

(declare-fun b!1433459 () Bool)

(declare-fun e!809076 () SeekEntryResult!11368)

(assert (=> b!1433459 (= e!809076 (Intermediate!11368 false index!585 x!605))))

(declare-fun b!1433460 () Bool)

(declare-fun lt!630882 () SeekEntryResult!11368)

(assert (=> b!1433460 (and (bvsge (index!47866 lt!630882) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630882) (size!47614 a!2831)))))

(declare-fun res!967216 () Bool)

(assert (=> b!1433460 (= res!967216 (= (select (arr!47062 a!2831) (index!47866 lt!630882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809075 () Bool)

(assert (=> b!1433460 (=> res!967216 e!809075)))

(declare-fun b!1433461 () Bool)

(assert (=> b!1433461 (and (bvsge (index!47866 lt!630882) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630882) (size!47614 a!2831)))))

(declare-fun res!967214 () Bool)

(assert (=> b!1433461 (= res!967214 (= (select (arr!47062 a!2831) (index!47866 lt!630882)) (select (arr!47062 a!2831) j!81)))))

(assert (=> b!1433461 (=> res!967214 e!809075)))

(declare-fun e!809072 () Bool)

(assert (=> b!1433461 (= e!809072 e!809075)))

(declare-fun b!1433462 () Bool)

(assert (=> b!1433462 (= e!809076 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433463 () Bool)

(assert (=> b!1433463 (and (bvsge (index!47866 lt!630882) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630882) (size!47614 a!2831)))))

(assert (=> b!1433463 (= e!809075 (= (select (arr!47062 a!2831) (index!47866 lt!630882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433464 () Bool)

(declare-fun e!809074 () Bool)

(assert (=> b!1433464 (= e!809074 e!809072)))

(declare-fun res!967215 () Bool)

(get-info :version)

(assert (=> b!1433464 (= res!967215 (and ((_ is Intermediate!11368) lt!630882) (not (undefined!12180 lt!630882)) (bvslt (x!129502 lt!630882) #b01111111111111111111111111111110) (bvsge (x!129502 lt!630882) #b00000000000000000000000000000000) (bvsge (x!129502 lt!630882) x!605)))))

(assert (=> b!1433464 (=> (not res!967215) (not e!809072))))

(declare-fun b!1433465 () Bool)

(declare-fun e!809073 () SeekEntryResult!11368)

(assert (=> b!1433465 (= e!809073 (Intermediate!11368 true index!585 x!605))))

(declare-fun b!1433466 () Bool)

(assert (=> b!1433466 (= e!809073 e!809076)))

(declare-fun c!132625 () Bool)

(declare-fun lt!630881 () (_ BitVec 64))

(assert (=> b!1433466 (= c!132625 (or (= lt!630881 (select (arr!47062 a!2831) j!81)) (= (bvadd lt!630881 lt!630881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153919 () Bool)

(assert (=> d!153919 e!809074))

(declare-fun c!132623 () Bool)

(assert (=> d!153919 (= c!132623 (and ((_ is Intermediate!11368) lt!630882) (undefined!12180 lt!630882)))))

(assert (=> d!153919 (= lt!630882 e!809073)))

(declare-fun c!132624 () Bool)

(assert (=> d!153919 (= c!132624 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153919 (= lt!630881 (select (arr!47062 a!2831) index!585))))

(assert (=> d!153919 (validMask!0 mask!2608)))

(assert (=> d!153919 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630882)))

(declare-fun b!1433458 () Bool)

(assert (=> b!1433458 (= e!809074 (bvsge (x!129502 lt!630882) #b01111111111111111111111111111110))))

(assert (= (and d!153919 c!132624) b!1433465))

(assert (= (and d!153919 (not c!132624)) b!1433466))

(assert (= (and b!1433466 c!132625) b!1433459))

(assert (= (and b!1433466 (not c!132625)) b!1433462))

(assert (= (and d!153919 c!132623) b!1433458))

(assert (= (and d!153919 (not c!132623)) b!1433464))

(assert (= (and b!1433464 res!967215) b!1433461))

(assert (= (and b!1433461 (not res!967214)) b!1433460))

(assert (= (and b!1433460 (not res!967216)) b!1433463))

(declare-fun m!1322711 () Bool)

(assert (=> b!1433461 m!1322711))

(assert (=> d!153919 m!1322587))

(assert (=> d!153919 m!1322605))

(assert (=> b!1433460 m!1322711))

(assert (=> b!1433463 m!1322711))

(assert (=> b!1433462 m!1322603))

(assert (=> b!1433462 m!1322603))

(assert (=> b!1433462 m!1322579))

(declare-fun m!1322713 () Bool)

(assert (=> b!1433462 m!1322713))

(assert (=> b!1433347 d!153919))

(declare-fun b!1433468 () Bool)

(declare-fun e!809081 () SeekEntryResult!11368)

(assert (=> b!1433468 (= e!809081 (Intermediate!11368 false (toIndex!0 lt!630836 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433469 () Bool)

(declare-fun lt!630884 () SeekEntryResult!11368)

(assert (=> b!1433469 (and (bvsge (index!47866 lt!630884) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630884) (size!47614 lt!630840)))))

(declare-fun res!967219 () Bool)

(assert (=> b!1433469 (= res!967219 (= (select (arr!47062 lt!630840) (index!47866 lt!630884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809080 () Bool)

(assert (=> b!1433469 (=> res!967219 e!809080)))

(declare-fun b!1433470 () Bool)

(assert (=> b!1433470 (and (bvsge (index!47866 lt!630884) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630884) (size!47614 lt!630840)))))

(declare-fun res!967217 () Bool)

(assert (=> b!1433470 (= res!967217 (= (select (arr!47062 lt!630840) (index!47866 lt!630884)) lt!630836))))

(assert (=> b!1433470 (=> res!967217 e!809080)))

(declare-fun e!809077 () Bool)

(assert (=> b!1433470 (= e!809077 e!809080)))

(declare-fun b!1433471 () Bool)

(assert (=> b!1433471 (= e!809081 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!630836 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630836 lt!630840 mask!2608))))

(declare-fun b!1433472 () Bool)

(assert (=> b!1433472 (and (bvsge (index!47866 lt!630884) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630884) (size!47614 lt!630840)))))

(assert (=> b!1433472 (= e!809080 (= (select (arr!47062 lt!630840) (index!47866 lt!630884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433473 () Bool)

(declare-fun e!809079 () Bool)

(assert (=> b!1433473 (= e!809079 e!809077)))

(declare-fun res!967218 () Bool)

(assert (=> b!1433473 (= res!967218 (and ((_ is Intermediate!11368) lt!630884) (not (undefined!12180 lt!630884)) (bvslt (x!129502 lt!630884) #b01111111111111111111111111111110) (bvsge (x!129502 lt!630884) #b00000000000000000000000000000000) (bvsge (x!129502 lt!630884) #b00000000000000000000000000000000)))))

(assert (=> b!1433473 (=> (not res!967218) (not e!809077))))

(declare-fun b!1433474 () Bool)

(declare-fun e!809078 () SeekEntryResult!11368)

(assert (=> b!1433474 (= e!809078 (Intermediate!11368 true (toIndex!0 lt!630836 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433475 () Bool)

(assert (=> b!1433475 (= e!809078 e!809081)))

(declare-fun c!132628 () Bool)

(declare-fun lt!630883 () (_ BitVec 64))

(assert (=> b!1433475 (= c!132628 (or (= lt!630883 lt!630836) (= (bvadd lt!630883 lt!630883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153923 () Bool)

(assert (=> d!153923 e!809079))

(declare-fun c!132626 () Bool)

(assert (=> d!153923 (= c!132626 (and ((_ is Intermediate!11368) lt!630884) (undefined!12180 lt!630884)))))

(assert (=> d!153923 (= lt!630884 e!809078)))

(declare-fun c!132627 () Bool)

(assert (=> d!153923 (= c!132627 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153923 (= lt!630883 (select (arr!47062 lt!630840) (toIndex!0 lt!630836 mask!2608)))))

(assert (=> d!153923 (validMask!0 mask!2608)))

(assert (=> d!153923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630836 mask!2608) lt!630836 lt!630840 mask!2608) lt!630884)))

(declare-fun b!1433467 () Bool)

(assert (=> b!1433467 (= e!809079 (bvsge (x!129502 lt!630884) #b01111111111111111111111111111110))))

(assert (= (and d!153923 c!132627) b!1433474))

(assert (= (and d!153923 (not c!132627)) b!1433475))

(assert (= (and b!1433475 c!132628) b!1433468))

(assert (= (and b!1433475 (not c!132628)) b!1433471))

(assert (= (and d!153923 c!132626) b!1433467))

(assert (= (and d!153923 (not c!132626)) b!1433473))

(assert (= (and b!1433473 res!967218) b!1433470))

(assert (= (and b!1433470 (not res!967217)) b!1433469))

(assert (= (and b!1433469 (not res!967219)) b!1433472))

(declare-fun m!1322715 () Bool)

(assert (=> b!1433470 m!1322715))

(assert (=> d!153923 m!1322613))

(declare-fun m!1322717 () Bool)

(assert (=> d!153923 m!1322717))

(assert (=> d!153923 m!1322605))

(assert (=> b!1433469 m!1322715))

(assert (=> b!1433472 m!1322715))

(assert (=> b!1433471 m!1322613))

(declare-fun m!1322719 () Bool)

(assert (=> b!1433471 m!1322719))

(assert (=> b!1433471 m!1322719))

(declare-fun m!1322721 () Bool)

(assert (=> b!1433471 m!1322721))

(assert (=> b!1433345 d!153923))

(declare-fun d!153925 () Bool)

(declare-fun lt!630893 () (_ BitVec 32))

(declare-fun lt!630892 () (_ BitVec 32))

(assert (=> d!153925 (= lt!630893 (bvmul (bvxor lt!630892 (bvlshr lt!630892 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153925 (= lt!630892 ((_ extract 31 0) (bvand (bvxor lt!630836 (bvlshr lt!630836 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153925 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967220 (let ((h!34975 ((_ extract 31 0) (bvand (bvxor lt!630836 (bvlshr lt!630836 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129507 (bvmul (bvxor h!34975 (bvlshr h!34975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129507 (bvlshr x!129507 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967220 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967220 #b00000000000000000000000000000000))))))

(assert (=> d!153925 (= (toIndex!0 lt!630836 mask!2608) (bvand (bvxor lt!630893 (bvlshr lt!630893 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433345 d!153925))

(declare-fun d!153929 () Bool)

(assert (=> d!153929 (= (validKeyInArray!0 (select (arr!47062 a!2831) j!81)) (and (not (= (select (arr!47062 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47062 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433349 d!153929))

(declare-fun d!153931 () Bool)

(declare-fun res!967225 () Bool)

(declare-fun e!809093 () Bool)

(assert (=> d!153931 (=> res!967225 e!809093)))

(assert (=> d!153931 (= res!967225 (bvsge #b00000000000000000000000000000000 (size!47614 a!2831)))))

(assert (=> d!153931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809093)))

(declare-fun bm!67475 () Bool)

(declare-fun call!67478 () Bool)

(assert (=> bm!67475 (= call!67478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433492 () Bool)

(declare-fun e!809094 () Bool)

(declare-fun e!809092 () Bool)

(assert (=> b!1433492 (= e!809094 e!809092)))

(declare-fun lt!630904 () (_ BitVec 64))

(assert (=> b!1433492 (= lt!630904 (select (arr!47062 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!630905 () Unit!48321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97512 (_ BitVec 64) (_ BitVec 32)) Unit!48321)

(assert (=> b!1433492 (= lt!630905 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630904 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433492 (arrayContainsKey!0 a!2831 lt!630904 #b00000000000000000000000000000000)))

(declare-fun lt!630906 () Unit!48321)

(assert (=> b!1433492 (= lt!630906 lt!630905)))

(declare-fun res!967226 () Bool)

(assert (=> b!1433492 (= res!967226 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11368 #b00000000000000000000000000000000)))))

(assert (=> b!1433492 (=> (not res!967226) (not e!809092))))

(declare-fun b!1433493 () Bool)

(assert (=> b!1433493 (= e!809094 call!67478)))

(declare-fun b!1433494 () Bool)

(assert (=> b!1433494 (= e!809093 e!809094)))

(declare-fun c!132635 () Bool)

(assert (=> b!1433494 (= c!132635 (validKeyInArray!0 (select (arr!47062 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433495 () Bool)

(assert (=> b!1433495 (= e!809092 call!67478)))

(assert (= (and d!153931 (not res!967225)) b!1433494))

(assert (= (and b!1433494 c!132635) b!1433492))

(assert (= (and b!1433494 (not c!132635)) b!1433493))

(assert (= (and b!1433492 res!967226) b!1433495))

(assert (= (or b!1433495 b!1433493) bm!67475))

(declare-fun m!1322725 () Bool)

(assert (=> bm!67475 m!1322725))

(declare-fun m!1322727 () Bool)

(assert (=> b!1433492 m!1322727))

(declare-fun m!1322729 () Bool)

(assert (=> b!1433492 m!1322729))

(declare-fun m!1322731 () Bool)

(assert (=> b!1433492 m!1322731))

(assert (=> b!1433492 m!1322727))

(declare-fun m!1322733 () Bool)

(assert (=> b!1433492 m!1322733))

(assert (=> b!1433494 m!1322727))

(assert (=> b!1433494 m!1322727))

(declare-fun m!1322735 () Bool)

(assert (=> b!1433494 m!1322735))

(assert (=> b!1433350 d!153931))

(declare-fun d!153933 () Bool)

(assert (=> d!153933 (= (validKeyInArray!0 (select (arr!47062 a!2831) i!982)) (and (not (= (select (arr!47062 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47062 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433348 d!153933))

(declare-fun d!153935 () Bool)

(declare-fun lt!630909 () (_ BitVec 32))

(assert (=> d!153935 (and (bvsge lt!630909 #b00000000000000000000000000000000) (bvslt lt!630909 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153935 (= lt!630909 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153935 (validMask!0 mask!2608)))

(assert (=> d!153935 (= (nextIndex!0 index!585 x!605 mask!2608) lt!630909)))

(declare-fun bs!41711 () Bool)

(assert (= bs!41711 d!153935))

(declare-fun m!1322737 () Bool)

(assert (=> bs!41711 m!1322737))

(assert (=> bs!41711 m!1322605))

(assert (=> b!1433352 d!153935))

(declare-fun d!153939 () Bool)

(declare-fun res!967233 () Bool)

(declare-fun e!809102 () Bool)

(assert (=> d!153939 (=> res!967233 e!809102)))

(assert (=> d!153939 (= res!967233 (bvsge j!81 (size!47614 a!2831)))))

(assert (=> d!153939 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809102)))

(declare-fun bm!67476 () Bool)

(declare-fun call!67479 () Bool)

(assert (=> bm!67476 (= call!67479 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1433506 () Bool)

(declare-fun e!809103 () Bool)

(declare-fun e!809101 () Bool)

(assert (=> b!1433506 (= e!809103 e!809101)))

(declare-fun lt!630910 () (_ BitVec 64))

(assert (=> b!1433506 (= lt!630910 (select (arr!47062 a!2831) j!81))))

(declare-fun lt!630911 () Unit!48321)

(assert (=> b!1433506 (= lt!630911 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!630910 j!81))))

(assert (=> b!1433506 (arrayContainsKey!0 a!2831 lt!630910 #b00000000000000000000000000000000)))

(declare-fun lt!630912 () Unit!48321)

(assert (=> b!1433506 (= lt!630912 lt!630911)))

(declare-fun res!967234 () Bool)

(assert (=> b!1433506 (= res!967234 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) (Found!11368 j!81)))))

(assert (=> b!1433506 (=> (not res!967234) (not e!809101))))

(declare-fun b!1433507 () Bool)

(assert (=> b!1433507 (= e!809103 call!67479)))

(declare-fun b!1433508 () Bool)

(assert (=> b!1433508 (= e!809102 e!809103)))

(declare-fun c!132638 () Bool)

(assert (=> b!1433508 (= c!132638 (validKeyInArray!0 (select (arr!47062 a!2831) j!81)))))

(declare-fun b!1433509 () Bool)

(assert (=> b!1433509 (= e!809101 call!67479)))

(assert (= (and d!153939 (not res!967233)) b!1433508))

(assert (= (and b!1433508 c!132638) b!1433506))

(assert (= (and b!1433508 (not c!132638)) b!1433507))

(assert (= (and b!1433506 res!967234) b!1433509))

(assert (= (or b!1433509 b!1433507) bm!67476))

(declare-fun m!1322739 () Bool)

(assert (=> bm!67476 m!1322739))

(assert (=> b!1433506 m!1322579))

(declare-fun m!1322741 () Bool)

(assert (=> b!1433506 m!1322741))

(declare-fun m!1322743 () Bool)

(assert (=> b!1433506 m!1322743))

(assert (=> b!1433506 m!1322579))

(assert (=> b!1433506 m!1322581))

(assert (=> b!1433508 m!1322579))

(assert (=> b!1433508 m!1322579))

(assert (=> b!1433508 m!1322621))

(assert (=> b!1433342 d!153939))

(declare-fun d!153941 () Bool)

(assert (=> d!153941 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!630920 () Unit!48321)

(declare-fun choose!38 (array!97512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48321)

(assert (=> d!153941 (= lt!630920 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153941 (validMask!0 mask!2608)))

(assert (=> d!153941 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!630920)))

(declare-fun bs!41713 () Bool)

(assert (= bs!41713 d!153941))

(assert (=> bs!41713 m!1322589))

(declare-fun m!1322755 () Bool)

(assert (=> bs!41713 m!1322755))

(assert (=> bs!41713 m!1322605))

(assert (=> b!1433342 d!153941))

(declare-fun d!153949 () Bool)

(assert (=> d!153949 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123632 d!153949))

(declare-fun d!153957 () Bool)

(assert (=> d!153957 (= (array_inv!36295 a!2831) (bvsge (size!47614 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123632 d!153957))

(declare-fun b!1433597 () Bool)

(declare-fun e!809153 () SeekEntryResult!11368)

(assert (=> b!1433597 (= e!809153 Undefined!11368)))

(declare-fun e!809154 () SeekEntryResult!11368)

(declare-fun lt!630966 () SeekEntryResult!11368)

(declare-fun b!1433598 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97512 (_ BitVec 32)) SeekEntryResult!11368)

(assert (=> b!1433598 (= e!809154 (seekKeyOrZeroReturnVacant!0 (x!129502 lt!630966) (index!47866 lt!630966) (index!47866 lt!630966) (select (arr!47062 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433599 () Bool)

(declare-fun c!132672 () Bool)

(declare-fun lt!630964 () (_ BitVec 64))

(assert (=> b!1433599 (= c!132672 (= lt!630964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809155 () SeekEntryResult!11368)

(assert (=> b!1433599 (= e!809155 e!809154)))

(declare-fun b!1433600 () Bool)

(assert (=> b!1433600 (= e!809155 (Found!11368 (index!47866 lt!630966)))))

(declare-fun b!1433601 () Bool)

(assert (=> b!1433601 (= e!809153 e!809155)))

(assert (=> b!1433601 (= lt!630964 (select (arr!47062 a!2831) (index!47866 lt!630966)))))

(declare-fun c!132674 () Bool)

(assert (=> b!1433601 (= c!132674 (= lt!630964 (select (arr!47062 a!2831) j!81)))))

(declare-fun b!1433602 () Bool)

(assert (=> b!1433602 (= e!809154 (MissingZero!11368 (index!47866 lt!630966)))))

(declare-fun d!153959 () Bool)

(declare-fun lt!630965 () SeekEntryResult!11368)

(assert (=> d!153959 (and (or ((_ is Undefined!11368) lt!630965) (not ((_ is Found!11368) lt!630965)) (and (bvsge (index!47865 lt!630965) #b00000000000000000000000000000000) (bvslt (index!47865 lt!630965) (size!47614 a!2831)))) (or ((_ is Undefined!11368) lt!630965) ((_ is Found!11368) lt!630965) (not ((_ is MissingZero!11368) lt!630965)) (and (bvsge (index!47864 lt!630965) #b00000000000000000000000000000000) (bvslt (index!47864 lt!630965) (size!47614 a!2831)))) (or ((_ is Undefined!11368) lt!630965) ((_ is Found!11368) lt!630965) ((_ is MissingZero!11368) lt!630965) (not ((_ is MissingVacant!11368) lt!630965)) (and (bvsge (index!47867 lt!630965) #b00000000000000000000000000000000) (bvslt (index!47867 lt!630965) (size!47614 a!2831)))) (or ((_ is Undefined!11368) lt!630965) (ite ((_ is Found!11368) lt!630965) (= (select (arr!47062 a!2831) (index!47865 lt!630965)) (select (arr!47062 a!2831) j!81)) (ite ((_ is MissingZero!11368) lt!630965) (= (select (arr!47062 a!2831) (index!47864 lt!630965)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11368) lt!630965) (= (select (arr!47062 a!2831) (index!47867 lt!630965)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153959 (= lt!630965 e!809153)))

(declare-fun c!132673 () Bool)

(assert (=> d!153959 (= c!132673 (and ((_ is Intermediate!11368) lt!630966) (undefined!12180 lt!630966)))))

(assert (=> d!153959 (= lt!630966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153959 (validMask!0 mask!2608)))

(assert (=> d!153959 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630965)))

(assert (= (and d!153959 c!132673) b!1433597))

(assert (= (and d!153959 (not c!132673)) b!1433601))

(assert (= (and b!1433601 c!132674) b!1433600))

(assert (= (and b!1433601 (not c!132674)) b!1433599))

(assert (= (and b!1433599 c!132672) b!1433602))

(assert (= (and b!1433599 (not c!132672)) b!1433598))

(assert (=> b!1433598 m!1322579))

(declare-fun m!1322787 () Bool)

(assert (=> b!1433598 m!1322787))

(declare-fun m!1322789 () Bool)

(assert (=> b!1433601 m!1322789))

(declare-fun m!1322791 () Bool)

(assert (=> d!153959 m!1322791))

(declare-fun m!1322793 () Bool)

(assert (=> d!153959 m!1322793))

(declare-fun m!1322795 () Bool)

(assert (=> d!153959 m!1322795))

(assert (=> d!153959 m!1322579))

(assert (=> d!153959 m!1322597))

(assert (=> d!153959 m!1322605))

(assert (=> d!153959 m!1322597))

(assert (=> d!153959 m!1322579))

(assert (=> d!153959 m!1322599))

(assert (=> b!1433344 d!153959))

(declare-fun b!1433634 () Bool)

(declare-fun e!809180 () Bool)

(declare-fun contains!9830 (List!33650 (_ BitVec 64)) Bool)

(assert (=> b!1433634 (= e!809180 (contains!9830 Nil!33647 (select (arr!47062 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153973 () Bool)

(declare-fun res!967275 () Bool)

(declare-fun e!809181 () Bool)

(assert (=> d!153973 (=> res!967275 e!809181)))

(assert (=> d!153973 (= res!967275 (bvsge #b00000000000000000000000000000000 (size!47614 a!2831)))))

(assert (=> d!153973 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33647) e!809181)))

(declare-fun bm!67485 () Bool)

(declare-fun call!67488 () Bool)

(declare-fun c!132683 () Bool)

(assert (=> bm!67485 (= call!67488 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132683 (Cons!33646 (select (arr!47062 a!2831) #b00000000000000000000000000000000) Nil!33647) Nil!33647)))))

(declare-fun b!1433635 () Bool)

(declare-fun e!809178 () Bool)

(assert (=> b!1433635 (= e!809178 call!67488)))

(declare-fun b!1433636 () Bool)

(declare-fun e!809179 () Bool)

(assert (=> b!1433636 (= e!809181 e!809179)))

(declare-fun res!967274 () Bool)

(assert (=> b!1433636 (=> (not res!967274) (not e!809179))))

(assert (=> b!1433636 (= res!967274 (not e!809180))))

(declare-fun res!967273 () Bool)

(assert (=> b!1433636 (=> (not res!967273) (not e!809180))))

(assert (=> b!1433636 (= res!967273 (validKeyInArray!0 (select (arr!47062 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433637 () Bool)

(assert (=> b!1433637 (= e!809179 e!809178)))

(assert (=> b!1433637 (= c!132683 (validKeyInArray!0 (select (arr!47062 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433638 () Bool)

(assert (=> b!1433638 (= e!809178 call!67488)))

(assert (= (and d!153973 (not res!967275)) b!1433636))

(assert (= (and b!1433636 res!967273) b!1433634))

(assert (= (and b!1433636 res!967274) b!1433637))

(assert (= (and b!1433637 c!132683) b!1433635))

(assert (= (and b!1433637 (not c!132683)) b!1433638))

(assert (= (or b!1433635 b!1433638) bm!67485))

(assert (=> b!1433634 m!1322727))

(assert (=> b!1433634 m!1322727))

(declare-fun m!1322813 () Bool)

(assert (=> b!1433634 m!1322813))

(assert (=> bm!67485 m!1322727))

(declare-fun m!1322821 () Bool)

(assert (=> bm!67485 m!1322821))

(assert (=> b!1433636 m!1322727))

(assert (=> b!1433636 m!1322727))

(assert (=> b!1433636 m!1322735))

(assert (=> b!1433637 m!1322727))

(assert (=> b!1433637 m!1322727))

(assert (=> b!1433637 m!1322735))

(assert (=> b!1433355 d!153973))

(declare-fun b!1433644 () Bool)

(declare-fun e!809189 () SeekEntryResult!11368)

(assert (=> b!1433644 (= e!809189 (Intermediate!11368 false index!585 x!605))))

(declare-fun b!1433645 () Bool)

(declare-fun lt!630988 () SeekEntryResult!11368)

(assert (=> b!1433645 (and (bvsge (index!47866 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630988) (size!47614 lt!630840)))))

(declare-fun res!967280 () Bool)

(assert (=> b!1433645 (= res!967280 (= (select (arr!47062 lt!630840) (index!47866 lt!630988)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809188 () Bool)

(assert (=> b!1433645 (=> res!967280 e!809188)))

(declare-fun b!1433646 () Bool)

(assert (=> b!1433646 (and (bvsge (index!47866 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630988) (size!47614 lt!630840)))))

(declare-fun res!967278 () Bool)

(assert (=> b!1433646 (= res!967278 (= (select (arr!47062 lt!630840) (index!47866 lt!630988)) lt!630836))))

(assert (=> b!1433646 (=> res!967278 e!809188)))

(declare-fun e!809185 () Bool)

(assert (=> b!1433646 (= e!809185 e!809188)))

(declare-fun b!1433647 () Bool)

(assert (=> b!1433647 (= e!809189 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!630836 lt!630840 mask!2608))))

(declare-fun b!1433648 () Bool)

(assert (=> b!1433648 (and (bvsge (index!47866 lt!630988) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630988) (size!47614 lt!630840)))))

(assert (=> b!1433648 (= e!809188 (= (select (arr!47062 lt!630840) (index!47866 lt!630988)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433649 () Bool)

(declare-fun e!809187 () Bool)

(assert (=> b!1433649 (= e!809187 e!809185)))

(declare-fun res!967279 () Bool)

(assert (=> b!1433649 (= res!967279 (and ((_ is Intermediate!11368) lt!630988) (not (undefined!12180 lt!630988)) (bvslt (x!129502 lt!630988) #b01111111111111111111111111111110) (bvsge (x!129502 lt!630988) #b00000000000000000000000000000000) (bvsge (x!129502 lt!630988) x!605)))))

(assert (=> b!1433649 (=> (not res!967279) (not e!809185))))

(declare-fun b!1433650 () Bool)

(declare-fun e!809186 () SeekEntryResult!11368)

(assert (=> b!1433650 (= e!809186 (Intermediate!11368 true index!585 x!605))))

(declare-fun b!1433651 () Bool)

(assert (=> b!1433651 (= e!809186 e!809189)))

(declare-fun c!132687 () Bool)

(declare-fun lt!630987 () (_ BitVec 64))

(assert (=> b!1433651 (= c!132687 (or (= lt!630987 lt!630836) (= (bvadd lt!630987 lt!630987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153983 () Bool)

(assert (=> d!153983 e!809187))

(declare-fun c!132685 () Bool)

(assert (=> d!153983 (= c!132685 (and ((_ is Intermediate!11368) lt!630988) (undefined!12180 lt!630988)))))

(assert (=> d!153983 (= lt!630988 e!809186)))

(declare-fun c!132686 () Bool)

(assert (=> d!153983 (= c!132686 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153983 (= lt!630987 (select (arr!47062 lt!630840) index!585))))

(assert (=> d!153983 (validMask!0 mask!2608)))

(assert (=> d!153983 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630836 lt!630840 mask!2608) lt!630988)))

(declare-fun b!1433643 () Bool)

(assert (=> b!1433643 (= e!809187 (bvsge (x!129502 lt!630988) #b01111111111111111111111111111110))))

(assert (= (and d!153983 c!132686) b!1433650))

(assert (= (and d!153983 (not c!132686)) b!1433651))

(assert (= (and b!1433651 c!132687) b!1433644))

(assert (= (and b!1433651 (not c!132687)) b!1433647))

(assert (= (and d!153983 c!132685) b!1433643))

(assert (= (and d!153983 (not c!132685)) b!1433649))

(assert (= (and b!1433649 res!967279) b!1433646))

(assert (= (and b!1433646 (not res!967278)) b!1433645))

(assert (= (and b!1433645 (not res!967280)) b!1433648))

(declare-fun m!1322827 () Bool)

(assert (=> b!1433646 m!1322827))

(declare-fun m!1322829 () Bool)

(assert (=> d!153983 m!1322829))

(assert (=> d!153983 m!1322605))

(assert (=> b!1433645 m!1322827))

(assert (=> b!1433648 m!1322827))

(assert (=> b!1433647 m!1322603))

(assert (=> b!1433647 m!1322603))

(declare-fun m!1322831 () Bool)

(assert (=> b!1433647 m!1322831))

(assert (=> b!1433354 d!153983))

(declare-fun e!809194 () SeekEntryResult!11368)

(declare-fun b!1433653 () Bool)

(assert (=> b!1433653 (= e!809194 (Intermediate!11368 false (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433654 () Bool)

(declare-fun lt!630992 () SeekEntryResult!11368)

(assert (=> b!1433654 (and (bvsge (index!47866 lt!630992) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630992) (size!47614 a!2831)))))

(declare-fun res!967283 () Bool)

(assert (=> b!1433654 (= res!967283 (= (select (arr!47062 a!2831) (index!47866 lt!630992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809193 () Bool)

(assert (=> b!1433654 (=> res!967283 e!809193)))

(declare-fun b!1433655 () Bool)

(assert (=> b!1433655 (and (bvsge (index!47866 lt!630992) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630992) (size!47614 a!2831)))))

(declare-fun res!967281 () Bool)

(assert (=> b!1433655 (= res!967281 (= (select (arr!47062 a!2831) (index!47866 lt!630992)) (select (arr!47062 a!2831) j!81)))))

(assert (=> b!1433655 (=> res!967281 e!809193)))

(declare-fun e!809190 () Bool)

(assert (=> b!1433655 (= e!809190 e!809193)))

(declare-fun b!1433656 () Bool)

(assert (=> b!1433656 (= e!809194 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433657 () Bool)

(assert (=> b!1433657 (and (bvsge (index!47866 lt!630992) #b00000000000000000000000000000000) (bvslt (index!47866 lt!630992) (size!47614 a!2831)))))

(assert (=> b!1433657 (= e!809193 (= (select (arr!47062 a!2831) (index!47866 lt!630992)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433658 () Bool)

(declare-fun e!809192 () Bool)

(assert (=> b!1433658 (= e!809192 e!809190)))

(declare-fun res!967282 () Bool)

(assert (=> b!1433658 (= res!967282 (and ((_ is Intermediate!11368) lt!630992) (not (undefined!12180 lt!630992)) (bvslt (x!129502 lt!630992) #b01111111111111111111111111111110) (bvsge (x!129502 lt!630992) #b00000000000000000000000000000000) (bvsge (x!129502 lt!630992) #b00000000000000000000000000000000)))))

(assert (=> b!1433658 (=> (not res!967282) (not e!809190))))

(declare-fun b!1433659 () Bool)

(declare-fun e!809191 () SeekEntryResult!11368)

(assert (=> b!1433659 (= e!809191 (Intermediate!11368 true (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433660 () Bool)

(assert (=> b!1433660 (= e!809191 e!809194)))

(declare-fun lt!630991 () (_ BitVec 64))

(declare-fun c!132690 () Bool)

(assert (=> b!1433660 (= c!132690 (or (= lt!630991 (select (arr!47062 a!2831) j!81)) (= (bvadd lt!630991 lt!630991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153987 () Bool)

(assert (=> d!153987 e!809192))

(declare-fun c!132688 () Bool)

(assert (=> d!153987 (= c!132688 (and ((_ is Intermediate!11368) lt!630992) (undefined!12180 lt!630992)))))

(assert (=> d!153987 (= lt!630992 e!809191)))

(declare-fun c!132689 () Bool)

(assert (=> d!153987 (= c!132689 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153987 (= lt!630991 (select (arr!47062 a!2831) (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608)))))

(assert (=> d!153987 (validMask!0 mask!2608)))

(assert (=> d!153987 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630992)))

(declare-fun b!1433652 () Bool)

(assert (=> b!1433652 (= e!809192 (bvsge (x!129502 lt!630992) #b01111111111111111111111111111110))))

(assert (= (and d!153987 c!132689) b!1433659))

(assert (= (and d!153987 (not c!132689)) b!1433660))

(assert (= (and b!1433660 c!132690) b!1433653))

(assert (= (and b!1433660 (not c!132690)) b!1433656))

(assert (= (and d!153987 c!132688) b!1433652))

(assert (= (and d!153987 (not c!132688)) b!1433658))

(assert (= (and b!1433658 res!967282) b!1433655))

(assert (= (and b!1433655 (not res!967281)) b!1433654))

(assert (= (and b!1433654 (not res!967283)) b!1433657))

(declare-fun m!1322835 () Bool)

(assert (=> b!1433655 m!1322835))

(assert (=> d!153987 m!1322597))

(declare-fun m!1322837 () Bool)

(assert (=> d!153987 m!1322837))

(assert (=> d!153987 m!1322605))

(assert (=> b!1433654 m!1322835))

(assert (=> b!1433657 m!1322835))

(assert (=> b!1433656 m!1322597))

(declare-fun m!1322839 () Bool)

(assert (=> b!1433656 m!1322839))

(assert (=> b!1433656 m!1322839))

(assert (=> b!1433656 m!1322579))

(declare-fun m!1322841 () Bool)

(assert (=> b!1433656 m!1322841))

(assert (=> b!1433343 d!153987))

(declare-fun d!153991 () Bool)

(declare-fun lt!630995 () (_ BitVec 32))

(declare-fun lt!630994 () (_ BitVec 32))

(assert (=> d!153991 (= lt!630995 (bvmul (bvxor lt!630994 (bvlshr lt!630994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153991 (= lt!630994 ((_ extract 31 0) (bvand (bvxor (select (arr!47062 a!2831) j!81) (bvlshr (select (arr!47062 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153991 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967220 (let ((h!34975 ((_ extract 31 0) (bvand (bvxor (select (arr!47062 a!2831) j!81) (bvlshr (select (arr!47062 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129507 (bvmul (bvxor h!34975 (bvlshr h!34975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129507 (bvlshr x!129507 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967220 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967220 #b00000000000000000000000000000000))))))

(assert (=> d!153991 (= (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (bvand (bvxor lt!630995 (bvlshr lt!630995 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433343 d!153991))

(check-sat (not b!1433637) (not d!153941) (not b!1433598) (not b!1433634) (not b!1433494) (not bm!67475) (not b!1433492) (not b!1433471) (not d!153923) (not d!153919) (not bm!67485) (not d!153987) (not b!1433508) (not d!153959) (not d!153935) (not d!153983) (not b!1433636) (not b!1433506) (not b!1433462) (not b!1433656) (not bm!67476) (not b!1433647))
(check-sat)
