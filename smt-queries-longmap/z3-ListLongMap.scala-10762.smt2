; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126168 () Bool)

(assert start!126168)

(declare-fun b!1475435 () Bool)

(declare-fun res!1001622 () Bool)

(declare-fun e!828026 () Bool)

(assert (=> b!1475435 (=> (not res!1001622) (not e!828026))))

(declare-datatypes ((array!99283 0))(
  ( (array!99284 (arr!47920 (Array (_ BitVec 32) (_ BitVec 64))) (size!48471 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99283)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99283 (_ BitVec 32)) Bool)

(assert (=> b!1475435 (= res!1001622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475436 () Bool)

(declare-fun res!1001633 () Bool)

(assert (=> b!1475436 (=> (not res!1001633) (not e!828026))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475436 (= res!1001633 (validKeyInArray!0 (select (arr!47920 a!2862) i!1006)))))

(declare-fun b!1475437 () Bool)

(declare-fun res!1001627 () Bool)

(assert (=> b!1475437 (=> (not res!1001627) (not e!828026))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1475437 (= res!1001627 (and (= (size!48471 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48471 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48471 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475438 () Bool)

(declare-fun e!828030 () Bool)

(declare-fun e!828031 () Bool)

(assert (=> b!1475438 (= e!828030 (not e!828031))))

(declare-fun res!1001629 () Bool)

(assert (=> b!1475438 (=> res!1001629 e!828031)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1475438 (= res!1001629 (or (not (= (select (arr!47920 a!2862) index!646) (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47920 a!2862) index!646) (select (arr!47920 a!2862) j!93)))))))

(declare-fun e!828029 () Bool)

(assert (=> b!1475438 e!828029))

(declare-fun res!1001623 () Bool)

(assert (=> b!1475438 (=> (not res!1001623) (not e!828029))))

(assert (=> b!1475438 (= res!1001623 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49487 0))(
  ( (Unit!49488) )
))
(declare-fun lt!644665 () Unit!49487)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49487)

(assert (=> b!1475438 (= lt!644665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1001634 () Bool)

(assert (=> start!126168 (=> (not res!1001634) (not e!828026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126168 (= res!1001634 (validMask!0 mask!2687))))

(assert (=> start!126168 e!828026))

(assert (=> start!126168 true))

(declare-fun array_inv!37201 (array!99283) Bool)

(assert (=> start!126168 (array_inv!37201 a!2862)))

(declare-fun b!1475439 () Bool)

(assert (=> b!1475439 (= e!828031 true)))

(declare-fun lt!644660 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12057 0))(
  ( (MissingZero!12057 (index!50620 (_ BitVec 32))) (Found!12057 (index!50621 (_ BitVec 32))) (Intermediate!12057 (undefined!12869 Bool) (index!50622 (_ BitVec 32)) (x!132390 (_ BitVec 32))) (Undefined!12057) (MissingVacant!12057 (index!50623 (_ BitVec 32))) )
))
(declare-fun lt!644663 () SeekEntryResult!12057)

(declare-fun lt!644664 () array!99283)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99283 (_ BitVec 32)) SeekEntryResult!12057)

(assert (=> b!1475439 (= lt!644663 (seekEntryOrOpen!0 lt!644660 lt!644664 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1475440 () Bool)

(assert (=> b!1475440 (= e!828029 (or (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) (select (arr!47920 a!2862) j!93))))))

(declare-fun b!1475441 () Bool)

(declare-fun res!1001631 () Bool)

(assert (=> b!1475441 (=> (not res!1001631) (not e!828030))))

(declare-fun e!828028 () Bool)

(assert (=> b!1475441 (= res!1001631 e!828028)))

(declare-fun c!136432 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475441 (= c!136432 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475442 () Bool)

(declare-fun res!1001625 () Bool)

(assert (=> b!1475442 (=> (not res!1001625) (not e!828026))))

(declare-datatypes ((List!34408 0))(
  ( (Nil!34405) (Cons!34404 (h!35777 (_ BitVec 64)) (t!49094 List!34408)) )
))
(declare-fun arrayNoDuplicates!0 (array!99283 (_ BitVec 32) List!34408) Bool)

(assert (=> b!1475442 (= res!1001625 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34405))))

(declare-fun b!1475443 () Bool)

(declare-fun e!828027 () Bool)

(declare-fun e!828033 () Bool)

(assert (=> b!1475443 (= e!828027 e!828033)))

(declare-fun res!1001632 () Bool)

(assert (=> b!1475443 (=> (not res!1001632) (not e!828033))))

(declare-fun lt!644662 () SeekEntryResult!12057)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99283 (_ BitVec 32)) SeekEntryResult!12057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475443 (= res!1001632 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47920 a!2862) j!93) mask!2687) (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!644662))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475443 (= lt!644662 (Intermediate!12057 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475444 () Bool)

(assert (=> b!1475444 (= e!828033 e!828030)))

(declare-fun res!1001624 () Bool)

(assert (=> b!1475444 (=> (not res!1001624) (not e!828030))))

(declare-fun lt!644661 () SeekEntryResult!12057)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475444 (= res!1001624 (= lt!644661 (Intermediate!12057 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475444 (= lt!644661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644660 mask!2687) lt!644660 lt!644664 mask!2687))))

(assert (=> b!1475444 (= lt!644660 (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475445 () Bool)

(assert (=> b!1475445 (= e!828028 (= lt!644661 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644660 lt!644664 mask!2687)))))

(declare-fun b!1475446 () Bool)

(declare-fun res!1001636 () Bool)

(assert (=> b!1475446 (=> (not res!1001636) (not e!828026))))

(assert (=> b!1475446 (= res!1001636 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48471 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48471 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48471 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475447 () Bool)

(declare-fun res!1001630 () Bool)

(assert (=> b!1475447 (=> (not res!1001630) (not e!828026))))

(assert (=> b!1475447 (= res!1001630 (validKeyInArray!0 (select (arr!47920 a!2862) j!93)))))

(declare-fun b!1475448 () Bool)

(assert (=> b!1475448 (= e!828026 e!828027)))

(declare-fun res!1001628 () Bool)

(assert (=> b!1475448 (=> (not res!1001628) (not e!828027))))

(assert (=> b!1475448 (= res!1001628 (= (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475448 (= lt!644664 (array!99284 (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48471 a!2862)))))

(declare-fun b!1475449 () Bool)

(declare-fun res!1001621 () Bool)

(assert (=> b!1475449 (=> (not res!1001621) (not e!828030))))

(assert (=> b!1475449 (= res!1001621 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475450 () Bool)

(declare-fun res!1001626 () Bool)

(assert (=> b!1475450 (=> (not res!1001626) (not e!828033))))

(assert (=> b!1475450 (= res!1001626 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!644662))))

(declare-fun b!1475451 () Bool)

(declare-fun res!1001635 () Bool)

(assert (=> b!1475451 (=> (not res!1001635) (not e!828029))))

(assert (=> b!1475451 (= res!1001635 (= (seekEntryOrOpen!0 (select (arr!47920 a!2862) j!93) a!2862 mask!2687) (Found!12057 j!93)))))

(declare-fun b!1475452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99283 (_ BitVec 32)) SeekEntryResult!12057)

(assert (=> b!1475452 (= e!828028 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644660 lt!644664 mask!2687) (seekEntryOrOpen!0 lt!644660 lt!644664 mask!2687)))))

(assert (= (and start!126168 res!1001634) b!1475437))

(assert (= (and b!1475437 res!1001627) b!1475436))

(assert (= (and b!1475436 res!1001633) b!1475447))

(assert (= (and b!1475447 res!1001630) b!1475435))

(assert (= (and b!1475435 res!1001622) b!1475442))

(assert (= (and b!1475442 res!1001625) b!1475446))

(assert (= (and b!1475446 res!1001636) b!1475448))

(assert (= (and b!1475448 res!1001628) b!1475443))

(assert (= (and b!1475443 res!1001632) b!1475450))

(assert (= (and b!1475450 res!1001626) b!1475444))

(assert (= (and b!1475444 res!1001624) b!1475441))

(assert (= (and b!1475441 c!136432) b!1475445))

(assert (= (and b!1475441 (not c!136432)) b!1475452))

(assert (= (and b!1475441 res!1001631) b!1475449))

(assert (= (and b!1475449 res!1001621) b!1475438))

(assert (= (and b!1475438 res!1001623) b!1475451))

(assert (= (and b!1475451 res!1001635) b!1475440))

(assert (= (and b!1475438 (not res!1001629)) b!1475439))

(declare-fun m!1361917 () Bool)

(assert (=> b!1475439 m!1361917))

(declare-fun m!1361919 () Bool)

(assert (=> b!1475436 m!1361919))

(assert (=> b!1475436 m!1361919))

(declare-fun m!1361921 () Bool)

(assert (=> b!1475436 m!1361921))

(declare-fun m!1361923 () Bool)

(assert (=> b!1475444 m!1361923))

(assert (=> b!1475444 m!1361923))

(declare-fun m!1361925 () Bool)

(assert (=> b!1475444 m!1361925))

(declare-fun m!1361927 () Bool)

(assert (=> b!1475444 m!1361927))

(declare-fun m!1361929 () Bool)

(assert (=> b!1475444 m!1361929))

(declare-fun m!1361931 () Bool)

(assert (=> b!1475438 m!1361931))

(assert (=> b!1475438 m!1361927))

(declare-fun m!1361933 () Bool)

(assert (=> b!1475438 m!1361933))

(declare-fun m!1361935 () Bool)

(assert (=> b!1475438 m!1361935))

(declare-fun m!1361937 () Bool)

(assert (=> b!1475438 m!1361937))

(declare-fun m!1361939 () Bool)

(assert (=> b!1475438 m!1361939))

(declare-fun m!1361941 () Bool)

(assert (=> b!1475440 m!1361941))

(assert (=> b!1475440 m!1361939))

(declare-fun m!1361943 () Bool)

(assert (=> b!1475442 m!1361943))

(assert (=> b!1475448 m!1361927))

(declare-fun m!1361945 () Bool)

(assert (=> b!1475448 m!1361945))

(assert (=> b!1475443 m!1361939))

(assert (=> b!1475443 m!1361939))

(declare-fun m!1361947 () Bool)

(assert (=> b!1475443 m!1361947))

(assert (=> b!1475443 m!1361947))

(assert (=> b!1475443 m!1361939))

(declare-fun m!1361949 () Bool)

(assert (=> b!1475443 m!1361949))

(declare-fun m!1361951 () Bool)

(assert (=> start!126168 m!1361951))

(declare-fun m!1361953 () Bool)

(assert (=> start!126168 m!1361953))

(declare-fun m!1361955 () Bool)

(assert (=> b!1475445 m!1361955))

(declare-fun m!1361957 () Bool)

(assert (=> b!1475452 m!1361957))

(assert (=> b!1475452 m!1361917))

(assert (=> b!1475447 m!1361939))

(assert (=> b!1475447 m!1361939))

(declare-fun m!1361959 () Bool)

(assert (=> b!1475447 m!1361959))

(assert (=> b!1475451 m!1361939))

(assert (=> b!1475451 m!1361939))

(declare-fun m!1361961 () Bool)

(assert (=> b!1475451 m!1361961))

(assert (=> b!1475450 m!1361939))

(assert (=> b!1475450 m!1361939))

(declare-fun m!1361963 () Bool)

(assert (=> b!1475450 m!1361963))

(declare-fun m!1361965 () Bool)

(assert (=> b!1475435 m!1361965))

(check-sat (not b!1475442) (not start!126168) (not b!1475451) (not b!1475438) (not b!1475439) (not b!1475436) (not b!1475443) (not b!1475447) (not b!1475435) (not b!1475445) (not b!1475450) (not b!1475452) (not b!1475444))
(check-sat)
