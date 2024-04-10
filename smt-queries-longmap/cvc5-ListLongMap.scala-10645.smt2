; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125008 () Bool)

(assert start!125008)

(declare-fun b!1453908 () Bool)

(declare-fun e!818288 () Bool)

(declare-fun e!818286 () Bool)

(assert (=> b!1453908 (= e!818288 (not e!818286))))

(declare-fun res!984853 () Bool)

(assert (=> b!1453908 (=> res!984853 e!818286)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98456 0))(
  ( (array!98457 (arr!47516 (Array (_ BitVec 32) (_ BitVec 64))) (size!48066 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98456)

(assert (=> b!1453908 (= res!984853 (or (and (= (select (arr!47516 a!2862) index!646) (select (store (arr!47516 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47516 a!2862) index!646) (select (arr!47516 a!2862) j!93))) (= (select (arr!47516 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818282 () Bool)

(assert (=> b!1453908 e!818282))

(declare-fun res!984858 () Bool)

(assert (=> b!1453908 (=> (not res!984858) (not e!818282))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98456 (_ BitVec 32)) Bool)

(assert (=> b!1453908 (= res!984858 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49032 0))(
  ( (Unit!49033) )
))
(declare-fun lt!637400 () Unit!49032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49032)

(assert (=> b!1453908 (= lt!637400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453909 () Bool)

(declare-fun res!984851 () Bool)

(declare-fun e!818289 () Bool)

(assert (=> b!1453909 (=> (not res!984851) (not e!818289))))

(assert (=> b!1453909 (= res!984851 (and (= (size!48066 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48066 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48066 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453910 () Bool)

(declare-fun lt!637394 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11768 0))(
  ( (MissingZero!11768 (index!49464 (_ BitVec 32))) (Found!11768 (index!49465 (_ BitVec 32))) (Intermediate!11768 (undefined!12580 Bool) (index!49466 (_ BitVec 32)) (x!131105 (_ BitVec 32))) (Undefined!11768) (MissingVacant!11768 (index!49467 (_ BitVec 32))) )
))
(declare-fun lt!637398 () SeekEntryResult!11768)

(declare-fun e!818285 () Bool)

(declare-fun lt!637401 () array!98456)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98456 (_ BitVec 32)) SeekEntryResult!11768)

(assert (=> b!1453910 (= e!818285 (= lt!637398 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637394 lt!637401 mask!2687)))))

(declare-fun b!1453911 () Bool)

(declare-fun res!984865 () Bool)

(assert (=> b!1453911 (=> (not res!984865) (not e!818289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453911 (= res!984865 (validKeyInArray!0 (select (arr!47516 a!2862) i!1006)))))

(declare-fun b!1453912 () Bool)

(declare-fun res!984856 () Bool)

(assert (=> b!1453912 (=> (not res!984856) (not e!818288))))

(assert (=> b!1453912 (= res!984856 e!818285)))

(declare-fun c!134040 () Bool)

(assert (=> b!1453912 (= c!134040 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453913 () Bool)

(declare-fun res!984867 () Bool)

(declare-fun e!818284 () Bool)

(assert (=> b!1453913 (=> res!984867 e!818284)))

(declare-fun lt!637396 () (_ BitVec 32))

(declare-fun lt!637399 () SeekEntryResult!11768)

(assert (=> b!1453913 (= res!984867 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637396 (select (arr!47516 a!2862) j!93) a!2862 mask!2687) lt!637399)))))

(declare-fun b!1453914 () Bool)

(declare-fun res!984863 () Bool)

(assert (=> b!1453914 (=> (not res!984863) (not e!818289))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453914 (= res!984863 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48066 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48066 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48066 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453915 () Bool)

(declare-fun res!984855 () Bool)

(assert (=> b!1453915 (=> (not res!984855) (not e!818282))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98456 (_ BitVec 32)) SeekEntryResult!11768)

(assert (=> b!1453915 (= res!984855 (= (seekEntryOrOpen!0 (select (arr!47516 a!2862) j!93) a!2862 mask!2687) (Found!11768 j!93)))))

(declare-fun b!1453916 () Bool)

(declare-fun e!818291 () Bool)

(assert (=> b!1453916 (= e!818289 e!818291)))

(declare-fun res!984857 () Bool)

(assert (=> b!1453916 (=> (not res!984857) (not e!818291))))

(assert (=> b!1453916 (= res!984857 (= (select (store (arr!47516 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453916 (= lt!637401 (array!98457 (store (arr!47516 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48066 a!2862)))))

(declare-fun b!1453917 () Bool)

(declare-fun e!818287 () Bool)

(assert (=> b!1453917 (= e!818287 e!818288)))

(declare-fun res!984866 () Bool)

(assert (=> b!1453917 (=> (not res!984866) (not e!818288))))

(assert (=> b!1453917 (= res!984866 (= lt!637398 (Intermediate!11768 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453917 (= lt!637398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637394 mask!2687) lt!637394 lt!637401 mask!2687))))

(assert (=> b!1453917 (= lt!637394 (select (store (arr!47516 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453918 () Bool)

(assert (=> b!1453918 (= e!818284 true)))

(declare-fun lt!637395 () Bool)

(declare-fun e!818290 () Bool)

(assert (=> b!1453918 (= lt!637395 e!818290)))

(declare-fun c!134039 () Bool)

(assert (=> b!1453918 (= c!134039 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453919 () Bool)

(declare-fun res!984852 () Bool)

(assert (=> b!1453919 (=> (not res!984852) (not e!818288))))

(assert (=> b!1453919 (= res!984852 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!984854 () Bool)

(assert (=> start!125008 (=> (not res!984854) (not e!818289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125008 (= res!984854 (validMask!0 mask!2687))))

(assert (=> start!125008 e!818289))

(assert (=> start!125008 true))

(declare-fun array_inv!36544 (array!98456) Bool)

(assert (=> start!125008 (array_inv!36544 a!2862)))

(declare-fun b!1453920 () Bool)

(assert (=> b!1453920 (= e!818290 (not (= lt!637398 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637396 lt!637394 lt!637401 mask!2687))))))

(declare-fun b!1453921 () Bool)

(declare-fun res!984862 () Bool)

(assert (=> b!1453921 (=> (not res!984862) (not e!818289))))

(assert (=> b!1453921 (= res!984862 (validKeyInArray!0 (select (arr!47516 a!2862) j!93)))))

(declare-fun b!1453922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98456 (_ BitVec 32)) SeekEntryResult!11768)

(assert (=> b!1453922 (= e!818285 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637394 lt!637401 mask!2687) (seekEntryOrOpen!0 lt!637394 lt!637401 mask!2687)))))

(declare-fun lt!637397 () SeekEntryResult!11768)

(declare-fun b!1453923 () Bool)

(assert (=> b!1453923 (= e!818290 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637396 intermediateAfterIndex!19 lt!637394 lt!637401 mask!2687) lt!637397)))))

(declare-fun b!1453924 () Bool)

(assert (=> b!1453924 (= e!818291 e!818287)))

(declare-fun res!984860 () Bool)

(assert (=> b!1453924 (=> (not res!984860) (not e!818287))))

(assert (=> b!1453924 (= res!984860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47516 a!2862) j!93) mask!2687) (select (arr!47516 a!2862) j!93) a!2862 mask!2687) lt!637399))))

(assert (=> b!1453924 (= lt!637399 (Intermediate!11768 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453925 () Bool)

(assert (=> b!1453925 (= e!818286 e!818284)))

(declare-fun res!984861 () Bool)

(assert (=> b!1453925 (=> res!984861 e!818284)))

(assert (=> b!1453925 (= res!984861 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637396 #b00000000000000000000000000000000) (bvsge lt!637396 (size!48066 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453925 (= lt!637396 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453925 (= lt!637397 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637394 lt!637401 mask!2687))))

(assert (=> b!1453925 (= lt!637397 (seekEntryOrOpen!0 lt!637394 lt!637401 mask!2687))))

(declare-fun b!1453926 () Bool)

(declare-fun res!984859 () Bool)

(assert (=> b!1453926 (=> (not res!984859) (not e!818287))))

(assert (=> b!1453926 (= res!984859 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47516 a!2862) j!93) a!2862 mask!2687) lt!637399))))

(declare-fun b!1453927 () Bool)

(declare-fun res!984864 () Bool)

(assert (=> b!1453927 (=> (not res!984864) (not e!818289))))

(assert (=> b!1453927 (= res!984864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453928 () Bool)

(assert (=> b!1453928 (= e!818282 (and (or (= (select (arr!47516 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47516 a!2862) intermediateBeforeIndex!19) (select (arr!47516 a!2862) j!93))) (let ((bdg!53017 (select (store (arr!47516 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47516 a!2862) index!646) bdg!53017) (= (select (arr!47516 a!2862) index!646) (select (arr!47516 a!2862) j!93))) (= (select (arr!47516 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53017 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453929 () Bool)

(declare-fun res!984868 () Bool)

(assert (=> b!1453929 (=> (not res!984868) (not e!818289))))

(declare-datatypes ((List!34017 0))(
  ( (Nil!34014) (Cons!34013 (h!35363 (_ BitVec 64)) (t!48711 List!34017)) )
))
(declare-fun arrayNoDuplicates!0 (array!98456 (_ BitVec 32) List!34017) Bool)

(assert (=> b!1453929 (= res!984868 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34014))))

(assert (= (and start!125008 res!984854) b!1453909))

(assert (= (and b!1453909 res!984851) b!1453911))

(assert (= (and b!1453911 res!984865) b!1453921))

(assert (= (and b!1453921 res!984862) b!1453927))

(assert (= (and b!1453927 res!984864) b!1453929))

(assert (= (and b!1453929 res!984868) b!1453914))

(assert (= (and b!1453914 res!984863) b!1453916))

(assert (= (and b!1453916 res!984857) b!1453924))

(assert (= (and b!1453924 res!984860) b!1453926))

(assert (= (and b!1453926 res!984859) b!1453917))

(assert (= (and b!1453917 res!984866) b!1453912))

(assert (= (and b!1453912 c!134040) b!1453910))

(assert (= (and b!1453912 (not c!134040)) b!1453922))

(assert (= (and b!1453912 res!984856) b!1453919))

(assert (= (and b!1453919 res!984852) b!1453908))

(assert (= (and b!1453908 res!984858) b!1453915))

(assert (= (and b!1453915 res!984855) b!1453928))

(assert (= (and b!1453908 (not res!984853)) b!1453925))

(assert (= (and b!1453925 (not res!984861)) b!1453913))

(assert (= (and b!1453913 (not res!984867)) b!1453918))

(assert (= (and b!1453918 c!134039) b!1453920))

(assert (= (and b!1453918 (not c!134039)) b!1453923))

(declare-fun m!1342315 () Bool)

(assert (=> b!1453924 m!1342315))

(assert (=> b!1453924 m!1342315))

(declare-fun m!1342317 () Bool)

(assert (=> b!1453924 m!1342317))

(assert (=> b!1453924 m!1342317))

(assert (=> b!1453924 m!1342315))

(declare-fun m!1342319 () Bool)

(assert (=> b!1453924 m!1342319))

(declare-fun m!1342321 () Bool)

(assert (=> b!1453929 m!1342321))

(assert (=> b!1453926 m!1342315))

(assert (=> b!1453926 m!1342315))

(declare-fun m!1342323 () Bool)

(assert (=> b!1453926 m!1342323))

(declare-fun m!1342325 () Bool)

(assert (=> b!1453925 m!1342325))

(declare-fun m!1342327 () Bool)

(assert (=> b!1453925 m!1342327))

(declare-fun m!1342329 () Bool)

(assert (=> b!1453925 m!1342329))

(declare-fun m!1342331 () Bool)

(assert (=> b!1453911 m!1342331))

(assert (=> b!1453911 m!1342331))

(declare-fun m!1342333 () Bool)

(assert (=> b!1453911 m!1342333))

(declare-fun m!1342335 () Bool)

(assert (=> b!1453920 m!1342335))

(assert (=> b!1453922 m!1342327))

(assert (=> b!1453922 m!1342329))

(declare-fun m!1342337 () Bool)

(assert (=> b!1453908 m!1342337))

(declare-fun m!1342339 () Bool)

(assert (=> b!1453908 m!1342339))

(declare-fun m!1342341 () Bool)

(assert (=> b!1453908 m!1342341))

(declare-fun m!1342343 () Bool)

(assert (=> b!1453908 m!1342343))

(declare-fun m!1342345 () Bool)

(assert (=> b!1453908 m!1342345))

(assert (=> b!1453908 m!1342315))

(assert (=> b!1453915 m!1342315))

(assert (=> b!1453915 m!1342315))

(declare-fun m!1342347 () Bool)

(assert (=> b!1453915 m!1342347))

(assert (=> b!1453921 m!1342315))

(assert (=> b!1453921 m!1342315))

(declare-fun m!1342349 () Bool)

(assert (=> b!1453921 m!1342349))

(assert (=> b!1453913 m!1342315))

(assert (=> b!1453913 m!1342315))

(declare-fun m!1342351 () Bool)

(assert (=> b!1453913 m!1342351))

(declare-fun m!1342353 () Bool)

(assert (=> b!1453927 m!1342353))

(declare-fun m!1342355 () Bool)

(assert (=> start!125008 m!1342355))

(declare-fun m!1342357 () Bool)

(assert (=> start!125008 m!1342357))

(declare-fun m!1342359 () Bool)

(assert (=> b!1453917 m!1342359))

(assert (=> b!1453917 m!1342359))

(declare-fun m!1342361 () Bool)

(assert (=> b!1453917 m!1342361))

(assert (=> b!1453917 m!1342339))

(declare-fun m!1342363 () Bool)

(assert (=> b!1453917 m!1342363))

(assert (=> b!1453928 m!1342339))

(declare-fun m!1342365 () Bool)

(assert (=> b!1453928 m!1342365))

(assert (=> b!1453928 m!1342341))

(assert (=> b!1453928 m!1342343))

(assert (=> b!1453928 m!1342315))

(assert (=> b!1453916 m!1342339))

(declare-fun m!1342367 () Bool)

(assert (=> b!1453916 m!1342367))

(declare-fun m!1342369 () Bool)

(assert (=> b!1453923 m!1342369))

(declare-fun m!1342371 () Bool)

(assert (=> b!1453910 m!1342371))

(push 1)

