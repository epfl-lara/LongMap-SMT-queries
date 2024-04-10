; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126504 () Bool)

(assert start!126504)

(declare-fun res!1008535 () Bool)

(declare-fun e!831909 () Bool)

(assert (=> start!126504 (=> (not res!1008535) (not e!831909))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126504 (= res!1008535 (validMask!0 mask!2687))))

(assert (=> start!126504 e!831909))

(assert (=> start!126504 true))

(declare-datatypes ((array!99466 0))(
  ( (array!99467 (arr!48009 (Array (_ BitVec 32) (_ BitVec 64))) (size!48559 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99466)

(declare-fun array_inv!37037 (array!99466) Bool)

(assert (=> start!126504 (array_inv!37037 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647505 () array!99466)

(declare-datatypes ((SeekEntryResult!12249 0))(
  ( (MissingZero!12249 (index!51388 (_ BitVec 32))) (Found!12249 (index!51389 (_ BitVec 32))) (Intermediate!12249 (undefined!13061 Bool) (index!51390 (_ BitVec 32)) (x!132973 (_ BitVec 32))) (Undefined!12249) (MissingVacant!12249 (index!51391 (_ BitVec 32))) )
))
(declare-fun lt!647507 () SeekEntryResult!12249)

(declare-fun lt!647502 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!831914 () Bool)

(declare-fun b!1483666 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12249)

(assert (=> b!1483666 (= e!831914 (= lt!647507 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647502 lt!647505 mask!2687)))))

(declare-fun b!1483667 () Bool)

(declare-fun res!1008518 () Bool)

(assert (=> b!1483667 (=> (not res!1008518) (not e!831909))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483667 (= res!1008518 (validKeyInArray!0 (select (arr!48009 a!2862) i!1006)))))

(declare-fun b!1483668 () Bool)

(declare-fun res!1008527 () Bool)

(declare-fun e!831915 () Bool)

(assert (=> b!1483668 (=> (not res!1008527) (not e!831915))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483668 (= res!1008527 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483669 () Bool)

(declare-fun res!1008522 () Bool)

(declare-fun e!831912 () Bool)

(assert (=> b!1483669 (=> (not res!1008522) (not e!831912))))

(declare-fun lt!647508 () SeekEntryResult!12249)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483669 (= res!1008522 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48009 a!2862) j!93) a!2862 mask!2687) lt!647508))))

(declare-fun b!1483670 () Bool)

(declare-fun e!831916 () Bool)

(assert (=> b!1483670 (= e!831909 e!831916)))

(declare-fun res!1008533 () Bool)

(assert (=> b!1483670 (=> (not res!1008533) (not e!831916))))

(assert (=> b!1483670 (= res!1008533 (= (select (store (arr!48009 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483670 (= lt!647505 (array!99467 (store (arr!48009 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48559 a!2862)))))

(declare-fun b!1483671 () Bool)

(declare-fun res!1008523 () Bool)

(assert (=> b!1483671 (=> (not res!1008523) (not e!831909))))

(declare-datatypes ((List!34510 0))(
  ( (Nil!34507) (Cons!34506 (h!35880 (_ BitVec 64)) (t!49204 List!34510)) )
))
(declare-fun arrayNoDuplicates!0 (array!99466 (_ BitVec 32) List!34510) Bool)

(assert (=> b!1483671 (= res!1008523 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34507))))

(declare-fun b!1483672 () Bool)

(declare-fun res!1008534 () Bool)

(assert (=> b!1483672 (=> (not res!1008534) (not e!831909))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483672 (= res!1008534 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48559 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48559 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48559 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483673 () Bool)

(declare-fun res!1008521 () Bool)

(assert (=> b!1483673 (=> (not res!1008521) (not e!831909))))

(assert (=> b!1483673 (= res!1008521 (and (= (size!48559 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48559 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48559 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483674 () Bool)

(declare-fun e!831911 () Bool)

(assert (=> b!1483674 (= e!831911 true)))

(declare-fun lt!647503 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483674 (= lt!647503 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483675 () Bool)

(declare-fun e!831917 () Bool)

(declare-fun e!831908 () Bool)

(assert (=> b!1483675 (= e!831917 e!831908)))

(declare-fun res!1008524 () Bool)

(assert (=> b!1483675 (=> res!1008524 e!831908)))

(declare-fun lt!647506 () (_ BitVec 64))

(assert (=> b!1483675 (= res!1008524 (or (and (= (select (arr!48009 a!2862) index!646) lt!647506) (= (select (arr!48009 a!2862) index!646) (select (arr!48009 a!2862) j!93))) (= (select (arr!48009 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483675 (= lt!647506 (select (store (arr!48009 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483676 () Bool)

(declare-fun res!1008529 () Bool)

(assert (=> b!1483676 (=> (not res!1008529) (not e!831917))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12249)

(assert (=> b!1483676 (= res!1008529 (= (seekEntryOrOpen!0 (select (arr!48009 a!2862) j!93) a!2862 mask!2687) (Found!12249 j!93)))))

(declare-fun b!1483677 () Bool)

(assert (=> b!1483677 (= e!831916 e!831912)))

(declare-fun res!1008519 () Bool)

(assert (=> b!1483677 (=> (not res!1008519) (not e!831912))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483677 (= res!1008519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48009 a!2862) j!93) mask!2687) (select (arr!48009 a!2862) j!93) a!2862 mask!2687) lt!647508))))

(assert (=> b!1483677 (= lt!647508 (Intermediate!12249 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483678 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12249)

(assert (=> b!1483678 (= e!831914 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647502 lt!647505 mask!2687) (seekEntryOrOpen!0 lt!647502 lt!647505 mask!2687)))))

(declare-fun b!1483679 () Bool)

(declare-fun res!1008528 () Bool)

(assert (=> b!1483679 (=> (not res!1008528) (not e!831915))))

(assert (=> b!1483679 (= res!1008528 e!831914)))

(declare-fun c!137097 () Bool)

(assert (=> b!1483679 (= c!137097 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483680 () Bool)

(declare-fun res!1008520 () Bool)

(assert (=> b!1483680 (=> (not res!1008520) (not e!831909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99466 (_ BitVec 32)) Bool)

(assert (=> b!1483680 (= res!1008520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483681 () Bool)

(assert (=> b!1483681 (= e!831915 (not e!831911))))

(declare-fun res!1008517 () Bool)

(assert (=> b!1483681 (=> res!1008517 e!831911)))

(assert (=> b!1483681 (= res!1008517 (or (and (= (select (arr!48009 a!2862) index!646) (select (store (arr!48009 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48009 a!2862) index!646) (select (arr!48009 a!2862) j!93))) (= (select (arr!48009 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483681 e!831917))

(declare-fun res!1008525 () Bool)

(assert (=> b!1483681 (=> (not res!1008525) (not e!831917))))

(assert (=> b!1483681 (= res!1008525 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49838 0))(
  ( (Unit!49839) )
))
(declare-fun lt!647504 () Unit!49838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49838)

(assert (=> b!1483681 (= lt!647504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483682 () Bool)

(declare-fun res!1008530 () Bool)

(assert (=> b!1483682 (=> (not res!1008530) (not e!831909))))

(assert (=> b!1483682 (= res!1008530 (validKeyInArray!0 (select (arr!48009 a!2862) j!93)))))

(declare-fun b!1483683 () Bool)

(declare-fun e!831913 () Bool)

(assert (=> b!1483683 (= e!831908 e!831913)))

(declare-fun res!1008532 () Bool)

(assert (=> b!1483683 (=> (not res!1008532) (not e!831913))))

(assert (=> b!1483683 (= res!1008532 (and (= index!646 intermediateAfterIndex!19) (= lt!647506 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483684 () Bool)

(assert (=> b!1483684 (= e!831913 (= (seekEntryOrOpen!0 lt!647502 lt!647505 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647502 lt!647505 mask!2687)))))

(declare-fun b!1483685 () Bool)

(declare-fun res!1008531 () Bool)

(assert (=> b!1483685 (=> (not res!1008531) (not e!831917))))

(assert (=> b!1483685 (= res!1008531 (or (= (select (arr!48009 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48009 a!2862) intermediateBeforeIndex!19) (select (arr!48009 a!2862) j!93))))))

(declare-fun b!1483686 () Bool)

(assert (=> b!1483686 (= e!831912 e!831915)))

(declare-fun res!1008526 () Bool)

(assert (=> b!1483686 (=> (not res!1008526) (not e!831915))))

(assert (=> b!1483686 (= res!1008526 (= lt!647507 (Intermediate!12249 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483686 (= lt!647507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647502 mask!2687) lt!647502 lt!647505 mask!2687))))

(assert (=> b!1483686 (= lt!647502 (select (store (arr!48009 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126504 res!1008535) b!1483673))

(assert (= (and b!1483673 res!1008521) b!1483667))

(assert (= (and b!1483667 res!1008518) b!1483682))

(assert (= (and b!1483682 res!1008530) b!1483680))

(assert (= (and b!1483680 res!1008520) b!1483671))

(assert (= (and b!1483671 res!1008523) b!1483672))

(assert (= (and b!1483672 res!1008534) b!1483670))

(assert (= (and b!1483670 res!1008533) b!1483677))

(assert (= (and b!1483677 res!1008519) b!1483669))

(assert (= (and b!1483669 res!1008522) b!1483686))

(assert (= (and b!1483686 res!1008526) b!1483679))

(assert (= (and b!1483679 c!137097) b!1483666))

(assert (= (and b!1483679 (not c!137097)) b!1483678))

(assert (= (and b!1483679 res!1008528) b!1483668))

(assert (= (and b!1483668 res!1008527) b!1483681))

(assert (= (and b!1483681 res!1008525) b!1483676))

(assert (= (and b!1483676 res!1008529) b!1483685))

(assert (= (and b!1483685 res!1008531) b!1483675))

(assert (= (and b!1483675 (not res!1008524)) b!1483683))

(assert (= (and b!1483683 res!1008532) b!1483684))

(assert (= (and b!1483681 (not res!1008517)) b!1483674))

(declare-fun m!1369109 () Bool)

(assert (=> b!1483674 m!1369109))

(declare-fun m!1369111 () Bool)

(assert (=> b!1483680 m!1369111))

(declare-fun m!1369113 () Bool)

(assert (=> b!1483670 m!1369113))

(declare-fun m!1369115 () Bool)

(assert (=> b!1483670 m!1369115))

(declare-fun m!1369117 () Bool)

(assert (=> b!1483682 m!1369117))

(assert (=> b!1483682 m!1369117))

(declare-fun m!1369119 () Bool)

(assert (=> b!1483682 m!1369119))

(declare-fun m!1369121 () Bool)

(assert (=> b!1483684 m!1369121))

(declare-fun m!1369123 () Bool)

(assert (=> b!1483684 m!1369123))

(declare-fun m!1369125 () Bool)

(assert (=> b!1483681 m!1369125))

(assert (=> b!1483681 m!1369113))

(declare-fun m!1369127 () Bool)

(assert (=> b!1483681 m!1369127))

(declare-fun m!1369129 () Bool)

(assert (=> b!1483681 m!1369129))

(declare-fun m!1369131 () Bool)

(assert (=> b!1483681 m!1369131))

(assert (=> b!1483681 m!1369117))

(declare-fun m!1369133 () Bool)

(assert (=> b!1483686 m!1369133))

(assert (=> b!1483686 m!1369133))

(declare-fun m!1369135 () Bool)

(assert (=> b!1483686 m!1369135))

(assert (=> b!1483686 m!1369113))

(declare-fun m!1369137 () Bool)

(assert (=> b!1483686 m!1369137))

(assert (=> b!1483676 m!1369117))

(assert (=> b!1483676 m!1369117))

(declare-fun m!1369139 () Bool)

(assert (=> b!1483676 m!1369139))

(assert (=> b!1483675 m!1369129))

(assert (=> b!1483675 m!1369117))

(assert (=> b!1483675 m!1369113))

(assert (=> b!1483675 m!1369127))

(assert (=> b!1483678 m!1369123))

(assert (=> b!1483678 m!1369121))

(declare-fun m!1369141 () Bool)

(assert (=> start!126504 m!1369141))

(declare-fun m!1369143 () Bool)

(assert (=> start!126504 m!1369143))

(assert (=> b!1483669 m!1369117))

(assert (=> b!1483669 m!1369117))

(declare-fun m!1369145 () Bool)

(assert (=> b!1483669 m!1369145))

(declare-fun m!1369147 () Bool)

(assert (=> b!1483667 m!1369147))

(assert (=> b!1483667 m!1369147))

(declare-fun m!1369149 () Bool)

(assert (=> b!1483667 m!1369149))

(declare-fun m!1369151 () Bool)

(assert (=> b!1483671 m!1369151))

(assert (=> b!1483677 m!1369117))

(assert (=> b!1483677 m!1369117))

(declare-fun m!1369153 () Bool)

(assert (=> b!1483677 m!1369153))

(assert (=> b!1483677 m!1369153))

(assert (=> b!1483677 m!1369117))

(declare-fun m!1369155 () Bool)

(assert (=> b!1483677 m!1369155))

(declare-fun m!1369157 () Bool)

(assert (=> b!1483666 m!1369157))

(declare-fun m!1369159 () Bool)

(assert (=> b!1483685 m!1369159))

(assert (=> b!1483685 m!1369117))

(check-sat (not b!1483681) (not b!1483678) (not b!1483686) (not b!1483669) (not start!126504) (not b!1483674) (not b!1483684) (not b!1483682) (not b!1483666) (not b!1483677) (not b!1483676) (not b!1483680) (not b!1483671) (not b!1483667))
(check-sat)
