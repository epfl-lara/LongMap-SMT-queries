; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122766 () Bool)

(assert start!122766)

(declare-fun b!1423023 () Bool)

(declare-fun res!958460 () Bool)

(declare-fun e!804397 () Bool)

(assert (=> b!1423023 (=> (not res!958460) (not e!804397))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97131 0))(
  ( (array!97132 (arr!46883 (Array (_ BitVec 32) (_ BitVec 64))) (size!47433 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97131)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423023 (= res!958460 (and (= (size!47433 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47433 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47433 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423024 () Bool)

(declare-fun e!804400 () Bool)

(declare-fun e!804399 () Bool)

(assert (=> b!1423024 (= e!804400 e!804399)))

(declare-fun res!958465 () Bool)

(assert (=> b!1423024 (=> (not res!958465) (not e!804399))))

(declare-fun lt!626931 () array!97131)

(declare-fun lt!626935 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11168 0))(
  ( (MissingZero!11168 (index!47064 (_ BitVec 32))) (Found!11168 (index!47065 (_ BitVec 32))) (Intermediate!11168 (undefined!11980 Bool) (index!47066 (_ BitVec 32)) (x!128706 (_ BitVec 32))) (Undefined!11168) (MissingVacant!11168 (index!47067 (_ BitVec 32))) )
))
(declare-fun lt!626932 () SeekEntryResult!11168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97131 (_ BitVec 32)) SeekEntryResult!11168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423024 (= res!958465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626935 mask!2608) lt!626935 lt!626931 mask!2608) lt!626932))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423024 (= lt!626932 (Intermediate!11168 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423024 (= lt!626935 (select (store (arr!46883 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423024 (= lt!626931 (array!97132 (store (arr!46883 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47433 a!2831)))))

(declare-fun b!1423025 () Bool)

(declare-fun res!958457 () Bool)

(assert (=> b!1423025 (=> (not res!958457) (not e!804397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423025 (= res!958457 (validKeyInArray!0 (select (arr!46883 a!2831) j!81)))))

(declare-fun b!1423026 () Bool)

(declare-fun res!958462 () Bool)

(assert (=> b!1423026 (=> (not res!958462) (not e!804399))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423026 (= res!958462 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626935 lt!626931 mask!2608) lt!626932))))

(declare-fun b!1423027 () Bool)

(declare-fun res!958471 () Bool)

(assert (=> b!1423027 (=> (not res!958471) (not e!804397))))

(assert (=> b!1423027 (= res!958471 (validKeyInArray!0 (select (arr!46883 a!2831) i!982)))))

(declare-fun b!1423029 () Bool)

(declare-fun e!804398 () Bool)

(assert (=> b!1423029 (= e!804399 (not e!804398))))

(declare-fun res!958468 () Bool)

(assert (=> b!1423029 (=> res!958468 e!804398)))

(assert (=> b!1423029 (= res!958468 (or (= (select (arr!46883 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46883 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46883 a!2831) index!585) (select (arr!46883 a!2831) j!81)) (= (select (store (arr!46883 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804401 () Bool)

(assert (=> b!1423029 e!804401))

(declare-fun res!958459 () Bool)

(assert (=> b!1423029 (=> (not res!958459) (not e!804401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97131 (_ BitVec 32)) Bool)

(assert (=> b!1423029 (= res!958459 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48172 0))(
  ( (Unit!48173) )
))
(declare-fun lt!626934 () Unit!48172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48172)

(assert (=> b!1423029 (= lt!626934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423030 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97131 (_ BitVec 32)) SeekEntryResult!11168)

(assert (=> b!1423030 (= e!804401 (= (seekEntryOrOpen!0 (select (arr!46883 a!2831) j!81) a!2831 mask!2608) (Found!11168 j!81)))))

(declare-fun b!1423031 () Bool)

(declare-fun res!958466 () Bool)

(assert (=> b!1423031 (=> (not res!958466) (not e!804397))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423031 (= res!958466 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47433 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47433 a!2831))))))

(declare-fun b!1423032 () Bool)

(declare-fun e!804395 () Bool)

(assert (=> b!1423032 (= e!804398 e!804395)))

(declare-fun res!958469 () Bool)

(assert (=> b!1423032 (=> res!958469 e!804395)))

(declare-fun lt!626936 () (_ BitVec 32))

(assert (=> b!1423032 (= res!958469 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626936 #b00000000000000000000000000000000) (bvsge lt!626936 (size!47433 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423032 (= lt!626936 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423033 () Bool)

(assert (=> b!1423033 (= e!804395 true)))

(declare-fun lt!626937 () SeekEntryResult!11168)

(assert (=> b!1423033 (= lt!626937 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626936 lt!626935 lt!626931 mask!2608))))

(declare-fun b!1423034 () Bool)

(declare-fun res!958464 () Bool)

(assert (=> b!1423034 (=> (not res!958464) (not e!804397))))

(assert (=> b!1423034 (= res!958464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423035 () Bool)

(declare-fun res!958463 () Bool)

(assert (=> b!1423035 (=> res!958463 e!804395)))

(declare-fun lt!626933 () SeekEntryResult!11168)

(assert (=> b!1423035 (= res!958463 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626936 (select (arr!46883 a!2831) j!81) a!2831 mask!2608) lt!626933)))))

(declare-fun b!1423036 () Bool)

(declare-fun res!958461 () Bool)

(assert (=> b!1423036 (=> (not res!958461) (not e!804399))))

(assert (=> b!1423036 (= res!958461 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46883 a!2831) j!81) a!2831 mask!2608) lt!626933))))

(declare-fun res!958470 () Bool)

(assert (=> start!122766 (=> (not res!958470) (not e!804397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122766 (= res!958470 (validMask!0 mask!2608))))

(assert (=> start!122766 e!804397))

(assert (=> start!122766 true))

(declare-fun array_inv!35911 (array!97131) Bool)

(assert (=> start!122766 (array_inv!35911 a!2831)))

(declare-fun b!1423028 () Bool)

(declare-fun res!958467 () Bool)

(assert (=> b!1423028 (=> (not res!958467) (not e!804399))))

(assert (=> b!1423028 (= res!958467 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423037 () Bool)

(assert (=> b!1423037 (= e!804397 e!804400)))

(declare-fun res!958458 () Bool)

(assert (=> b!1423037 (=> (not res!958458) (not e!804400))))

(assert (=> b!1423037 (= res!958458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46883 a!2831) j!81) mask!2608) (select (arr!46883 a!2831) j!81) a!2831 mask!2608) lt!626933))))

(assert (=> b!1423037 (= lt!626933 (Intermediate!11168 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423038 () Bool)

(declare-fun res!958456 () Bool)

(assert (=> b!1423038 (=> (not res!958456) (not e!804397))))

(declare-datatypes ((List!33393 0))(
  ( (Nil!33390) (Cons!33389 (h!34691 (_ BitVec 64)) (t!48087 List!33393)) )
))
(declare-fun arrayNoDuplicates!0 (array!97131 (_ BitVec 32) List!33393) Bool)

(assert (=> b!1423038 (= res!958456 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33390))))

(assert (= (and start!122766 res!958470) b!1423023))

(assert (= (and b!1423023 res!958460) b!1423027))

(assert (= (and b!1423027 res!958471) b!1423025))

(assert (= (and b!1423025 res!958457) b!1423034))

(assert (= (and b!1423034 res!958464) b!1423038))

(assert (= (and b!1423038 res!958456) b!1423031))

(assert (= (and b!1423031 res!958466) b!1423037))

(assert (= (and b!1423037 res!958458) b!1423024))

(assert (= (and b!1423024 res!958465) b!1423036))

(assert (= (and b!1423036 res!958461) b!1423026))

(assert (= (and b!1423026 res!958462) b!1423028))

(assert (= (and b!1423028 res!958467) b!1423029))

(assert (= (and b!1423029 res!958459) b!1423030))

(assert (= (and b!1423029 (not res!958468)) b!1423032))

(assert (= (and b!1423032 (not res!958469)) b!1423035))

(assert (= (and b!1423035 (not res!958463)) b!1423033))

(declare-fun m!1313571 () Bool)

(assert (=> b!1423035 m!1313571))

(assert (=> b!1423035 m!1313571))

(declare-fun m!1313573 () Bool)

(assert (=> b!1423035 m!1313573))

(declare-fun m!1313575 () Bool)

(assert (=> b!1423027 m!1313575))

(assert (=> b!1423027 m!1313575))

(declare-fun m!1313577 () Bool)

(assert (=> b!1423027 m!1313577))

(assert (=> b!1423037 m!1313571))

(assert (=> b!1423037 m!1313571))

(declare-fun m!1313579 () Bool)

(assert (=> b!1423037 m!1313579))

(assert (=> b!1423037 m!1313579))

(assert (=> b!1423037 m!1313571))

(declare-fun m!1313581 () Bool)

(assert (=> b!1423037 m!1313581))

(declare-fun m!1313583 () Bool)

(assert (=> b!1423032 m!1313583))

(declare-fun m!1313585 () Bool)

(assert (=> b!1423033 m!1313585))

(declare-fun m!1313587 () Bool)

(assert (=> b!1423029 m!1313587))

(declare-fun m!1313589 () Bool)

(assert (=> b!1423029 m!1313589))

(declare-fun m!1313591 () Bool)

(assert (=> b!1423029 m!1313591))

(declare-fun m!1313593 () Bool)

(assert (=> b!1423029 m!1313593))

(assert (=> b!1423029 m!1313571))

(declare-fun m!1313595 () Bool)

(assert (=> b!1423029 m!1313595))

(declare-fun m!1313597 () Bool)

(assert (=> b!1423024 m!1313597))

(assert (=> b!1423024 m!1313597))

(declare-fun m!1313599 () Bool)

(assert (=> b!1423024 m!1313599))

(assert (=> b!1423024 m!1313587))

(declare-fun m!1313601 () Bool)

(assert (=> b!1423024 m!1313601))

(declare-fun m!1313603 () Bool)

(assert (=> b!1423026 m!1313603))

(declare-fun m!1313605 () Bool)

(assert (=> start!122766 m!1313605))

(declare-fun m!1313607 () Bool)

(assert (=> start!122766 m!1313607))

(assert (=> b!1423030 m!1313571))

(assert (=> b!1423030 m!1313571))

(declare-fun m!1313609 () Bool)

(assert (=> b!1423030 m!1313609))

(declare-fun m!1313611 () Bool)

(assert (=> b!1423034 m!1313611))

(declare-fun m!1313613 () Bool)

(assert (=> b!1423038 m!1313613))

(assert (=> b!1423025 m!1313571))

(assert (=> b!1423025 m!1313571))

(declare-fun m!1313615 () Bool)

(assert (=> b!1423025 m!1313615))

(assert (=> b!1423036 m!1313571))

(assert (=> b!1423036 m!1313571))

(declare-fun m!1313617 () Bool)

(assert (=> b!1423036 m!1313617))

(push 1)

