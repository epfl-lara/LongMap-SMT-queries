; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125854 () Bool)

(assert start!125854)

(declare-fun b!1473370 () Bool)

(declare-fun e!826780 () Bool)

(assert (=> b!1473370 (= e!826780 true)))

(declare-datatypes ((SeekEntryResult!12104 0))(
  ( (MissingZero!12104 (index!50808 (_ BitVec 32))) (Found!12104 (index!50809 (_ BitVec 32))) (Intermediate!12104 (undefined!12916 Bool) (index!50810 (_ BitVec 32)) (x!132391 (_ BitVec 32))) (Undefined!12104) (MissingVacant!12104 (index!50811 (_ BitVec 32))) )
))
(declare-fun lt!643737 () SeekEntryResult!12104)

(declare-fun lt!643740 () (_ BitVec 64))

(declare-datatypes ((array!99109 0))(
  ( (array!99110 (arr!47839 (Array (_ BitVec 32) (_ BitVec 64))) (size!48391 (_ BitVec 32))) )
))
(declare-fun lt!643739 () array!99109)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99109 (_ BitVec 32)) SeekEntryResult!12104)

(assert (=> b!1473370 (= lt!643737 (seekEntryOrOpen!0 lt!643740 lt!643739 mask!2687))))

(declare-fun b!1473371 () Bool)

(declare-fun e!826776 () Bool)

(assert (=> b!1473371 (= e!826776 (not e!826780))))

(declare-fun res!1000803 () Bool)

(assert (=> b!1473371 (=> res!1000803 e!826780)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99109)

(assert (=> b!1473371 (= res!1000803 (or (not (= (select (arr!47839 a!2862) index!646) (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47839 a!2862) index!646) (select (arr!47839 a!2862) j!93)))))))

(declare-fun e!826777 () Bool)

(assert (=> b!1473371 e!826777))

(declare-fun res!1000790 () Bool)

(assert (=> b!1473371 (=> (not res!1000790) (not e!826777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99109 (_ BitVec 32)) Bool)

(assert (=> b!1473371 (= res!1000790 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49389 0))(
  ( (Unit!49390) )
))
(declare-fun lt!643735 () Unit!49389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49389)

(assert (=> b!1473371 (= lt!643735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473372 () Bool)

(declare-fun res!1000792 () Bool)

(assert (=> b!1473372 (=> (not res!1000792) (not e!826776))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473372 (= res!1000792 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!826781 () Bool)

(declare-fun b!1473373 () Bool)

(declare-fun lt!643738 () SeekEntryResult!12104)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99109 (_ BitVec 32)) SeekEntryResult!12104)

(assert (=> b!1473373 (= e!826781 (= lt!643738 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643740 lt!643739 mask!2687)))))

(declare-fun b!1473374 () Bool)

(declare-fun res!1000789 () Bool)

(assert (=> b!1473374 (=> (not res!1000789) (not e!826777))))

(assert (=> b!1473374 (= res!1000789 (= (seekEntryOrOpen!0 (select (arr!47839 a!2862) j!93) a!2862 mask!2687) (Found!12104 j!93)))))

(declare-fun b!1473375 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99109 (_ BitVec 32)) SeekEntryResult!12104)

(assert (=> b!1473375 (= e!826781 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643740 lt!643739 mask!2687) (seekEntryOrOpen!0 lt!643740 lt!643739 mask!2687)))))

(declare-fun b!1473376 () Bool)

(declare-fun res!1000798 () Bool)

(assert (=> b!1473376 (=> (not res!1000798) (not e!826776))))

(assert (=> b!1473376 (= res!1000798 e!826781)))

(declare-fun c!135808 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473376 (= c!135808 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473377 () Bool)

(declare-fun res!1000797 () Bool)

(declare-fun e!826778 () Bool)

(assert (=> b!1473377 (=> (not res!1000797) (not e!826778))))

(assert (=> b!1473377 (= res!1000797 (and (= (size!48391 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48391 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48391 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1000796 () Bool)

(assert (=> start!125854 (=> (not res!1000796) (not e!826778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125854 (= res!1000796 (validMask!0 mask!2687))))

(assert (=> start!125854 e!826778))

(assert (=> start!125854 true))

(declare-fun array_inv!37072 (array!99109) Bool)

(assert (=> start!125854 (array_inv!37072 a!2862)))

(declare-fun b!1473378 () Bool)

(declare-fun e!826782 () Bool)

(assert (=> b!1473378 (= e!826778 e!826782)))

(declare-fun res!1000799 () Bool)

(assert (=> b!1473378 (=> (not res!1000799) (not e!826782))))

(assert (=> b!1473378 (= res!1000799 (= (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473378 (= lt!643739 (array!99110 (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48391 a!2862)))))

(declare-fun b!1473379 () Bool)

(declare-fun e!826779 () Bool)

(assert (=> b!1473379 (= e!826782 e!826779)))

(declare-fun res!1000795 () Bool)

(assert (=> b!1473379 (=> (not res!1000795) (not e!826779))))

(declare-fun lt!643736 () SeekEntryResult!12104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473379 (= res!1000795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47839 a!2862) j!93) mask!2687) (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643736))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1473379 (= lt!643736 (Intermediate!12104 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473380 () Bool)

(declare-fun res!1000794 () Bool)

(assert (=> b!1473380 (=> (not res!1000794) (not e!826778))))

(assert (=> b!1473380 (= res!1000794 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48391 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48391 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48391 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473381 () Bool)

(declare-fun res!1000793 () Bool)

(assert (=> b!1473381 (=> (not res!1000793) (not e!826778))))

(assert (=> b!1473381 (= res!1000793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473382 () Bool)

(declare-fun res!1000800 () Bool)

(assert (=> b!1473382 (=> (not res!1000800) (not e!826778))))

(declare-datatypes ((List!34418 0))(
  ( (Nil!34415) (Cons!34414 (h!35773 (_ BitVec 64)) (t!49104 List!34418)) )
))
(declare-fun arrayNoDuplicates!0 (array!99109 (_ BitVec 32) List!34418) Bool)

(assert (=> b!1473382 (= res!1000800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34415))))

(declare-fun b!1473383 () Bool)

(declare-fun res!1000801 () Bool)

(assert (=> b!1473383 (=> (not res!1000801) (not e!826779))))

(assert (=> b!1473383 (= res!1000801 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643736))))

(declare-fun b!1473384 () Bool)

(assert (=> b!1473384 (= e!826777 (or (= (select (arr!47839 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47839 a!2862) intermediateBeforeIndex!19) (select (arr!47839 a!2862) j!93))))))

(declare-fun b!1473385 () Bool)

(assert (=> b!1473385 (= e!826779 e!826776)))

(declare-fun res!1000791 () Bool)

(assert (=> b!1473385 (=> (not res!1000791) (not e!826776))))

(assert (=> b!1473385 (= res!1000791 (= lt!643738 (Intermediate!12104 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473385 (= lt!643738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643740 mask!2687) lt!643740 lt!643739 mask!2687))))

(assert (=> b!1473385 (= lt!643740 (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473386 () Bool)

(declare-fun res!1000804 () Bool)

(assert (=> b!1473386 (=> (not res!1000804) (not e!826778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473386 (= res!1000804 (validKeyInArray!0 (select (arr!47839 a!2862) i!1006)))))

(declare-fun b!1473387 () Bool)

(declare-fun res!1000802 () Bool)

(assert (=> b!1473387 (=> (not res!1000802) (not e!826778))))

(assert (=> b!1473387 (= res!1000802 (validKeyInArray!0 (select (arr!47839 a!2862) j!93)))))

(assert (= (and start!125854 res!1000796) b!1473377))

(assert (= (and b!1473377 res!1000797) b!1473386))

(assert (= (and b!1473386 res!1000804) b!1473387))

(assert (= (and b!1473387 res!1000802) b!1473381))

(assert (= (and b!1473381 res!1000793) b!1473382))

(assert (= (and b!1473382 res!1000800) b!1473380))

(assert (= (and b!1473380 res!1000794) b!1473378))

(assert (= (and b!1473378 res!1000799) b!1473379))

(assert (= (and b!1473379 res!1000795) b!1473383))

(assert (= (and b!1473383 res!1000801) b!1473385))

(assert (= (and b!1473385 res!1000791) b!1473376))

(assert (= (and b!1473376 c!135808) b!1473373))

(assert (= (and b!1473376 (not c!135808)) b!1473375))

(assert (= (and b!1473376 res!1000798) b!1473372))

(assert (= (and b!1473372 res!1000792) b!1473371))

(assert (= (and b!1473371 res!1000790) b!1473374))

(assert (= (and b!1473374 res!1000789) b!1473384))

(assert (= (and b!1473371 (not res!1000803)) b!1473370))

(declare-fun m!1359405 () Bool)

(assert (=> b!1473373 m!1359405))

(declare-fun m!1359407 () Bool)

(assert (=> b!1473381 m!1359407))

(declare-fun m!1359409 () Bool)

(assert (=> b!1473387 m!1359409))

(assert (=> b!1473387 m!1359409))

(declare-fun m!1359411 () Bool)

(assert (=> b!1473387 m!1359411))

(declare-fun m!1359413 () Bool)

(assert (=> b!1473375 m!1359413))

(declare-fun m!1359415 () Bool)

(assert (=> b!1473375 m!1359415))

(declare-fun m!1359417 () Bool)

(assert (=> start!125854 m!1359417))

(declare-fun m!1359419 () Bool)

(assert (=> start!125854 m!1359419))

(declare-fun m!1359421 () Bool)

(assert (=> b!1473378 m!1359421))

(declare-fun m!1359423 () Bool)

(assert (=> b!1473378 m!1359423))

(declare-fun m!1359425 () Bool)

(assert (=> b!1473382 m!1359425))

(assert (=> b!1473370 m!1359415))

(assert (=> b!1473374 m!1359409))

(assert (=> b!1473374 m!1359409))

(declare-fun m!1359427 () Bool)

(assert (=> b!1473374 m!1359427))

(assert (=> b!1473379 m!1359409))

(assert (=> b!1473379 m!1359409))

(declare-fun m!1359429 () Bool)

(assert (=> b!1473379 m!1359429))

(assert (=> b!1473379 m!1359429))

(assert (=> b!1473379 m!1359409))

(declare-fun m!1359431 () Bool)

(assert (=> b!1473379 m!1359431))

(declare-fun m!1359433 () Bool)

(assert (=> b!1473384 m!1359433))

(assert (=> b!1473384 m!1359409))

(declare-fun m!1359435 () Bool)

(assert (=> b!1473386 m!1359435))

(assert (=> b!1473386 m!1359435))

(declare-fun m!1359437 () Bool)

(assert (=> b!1473386 m!1359437))

(declare-fun m!1359439 () Bool)

(assert (=> b!1473385 m!1359439))

(assert (=> b!1473385 m!1359439))

(declare-fun m!1359441 () Bool)

(assert (=> b!1473385 m!1359441))

(assert (=> b!1473385 m!1359421))

(declare-fun m!1359443 () Bool)

(assert (=> b!1473385 m!1359443))

(declare-fun m!1359445 () Bool)

(assert (=> b!1473371 m!1359445))

(assert (=> b!1473371 m!1359421))

(declare-fun m!1359447 () Bool)

(assert (=> b!1473371 m!1359447))

(declare-fun m!1359449 () Bool)

(assert (=> b!1473371 m!1359449))

(declare-fun m!1359451 () Bool)

(assert (=> b!1473371 m!1359451))

(assert (=> b!1473371 m!1359409))

(assert (=> b!1473383 m!1359409))

(assert (=> b!1473383 m!1359409))

(declare-fun m!1359453 () Bool)

(assert (=> b!1473383 m!1359453))

(check-sat (not b!1473383) (not b!1473382) (not b!1473370) (not b!1473381) (not b!1473379) (not b!1473386) (not b!1473371) (not b!1473385) (not b!1473375) (not b!1473373) (not b!1473374) (not start!125854) (not b!1473387))
(check-sat)
