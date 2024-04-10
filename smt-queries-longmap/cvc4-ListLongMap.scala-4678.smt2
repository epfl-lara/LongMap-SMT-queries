; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65132 () Bool)

(assert start!65132)

(declare-datatypes ((array!41305 0))(
  ( (array!41306 (arr!19766 (Array (_ BitVec 32) (_ BitVec 64))) (size!20187 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41305)

(declare-datatypes ((SeekEntryResult!7366 0))(
  ( (MissingZero!7366 (index!31832 (_ BitVec 32))) (Found!7366 (index!31833 (_ BitVec 32))) (Intermediate!7366 (undefined!8178 Bool) (index!31834 (_ BitVec 32)) (x!62836 (_ BitVec 32))) (Undefined!7366) (MissingVacant!7366 (index!31835 (_ BitVec 32))) )
))
(declare-fun lt!326081 () SeekEntryResult!7366)

(declare-fun lt!326080 () (_ BitVec 32))

(declare-fun e!411523 () Bool)

(declare-fun b!735532 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735532 (= e!411523 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326080 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326081)))))

(declare-fun b!735533 () Bool)

(declare-fun e!411525 () Bool)

(assert (=> b!735533 (= e!411525 true)))

(declare-fun lt!326070 () (_ BitVec 64))

(declare-fun lt!326068 () array!41305)

(declare-fun lt!326071 () SeekEntryResult!7366)

(assert (=> b!735533 (= lt!326071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326080 lt!326070 lt!326068 mask!3328))))

(declare-fun b!735534 () Bool)

(declare-fun res!494257 () Bool)

(declare-fun e!411520 () Bool)

(assert (=> b!735534 (=> (not res!494257) (not e!411520))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735534 (= res!494257 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!735535 () Bool)

(declare-fun lt!326077 () SeekEntryResult!7366)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735535 (= e!411523 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326080 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326077)))))

(declare-fun b!735536 () Bool)

(declare-fun res!494259 () Bool)

(declare-fun e!411522 () Bool)

(assert (=> b!735536 (=> (not res!494259) (not e!411522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41305 (_ BitVec 32)) Bool)

(assert (=> b!735536 (= res!494259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735537 () Bool)

(declare-fun e!411528 () Bool)

(declare-fun e!411530 () Bool)

(assert (=> b!735537 (= e!411528 e!411530)))

(declare-fun res!494258 () Bool)

(assert (=> b!735537 (=> (not res!494258) (not e!411530))))

(declare-fun lt!326076 () SeekEntryResult!7366)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!735537 (= res!494258 (= (seekEntryOrOpen!0 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326076))))

(assert (=> b!735537 (= lt!326076 (Found!7366 j!159))))

(declare-fun b!735538 () Bool)

(declare-fun res!494256 () Bool)

(declare-fun e!411521 () Bool)

(assert (=> b!735538 (=> (not res!494256) (not e!411521))))

(declare-fun e!411519 () Bool)

(assert (=> b!735538 (= res!494256 e!411519)))

(declare-fun c!81023 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735538 (= c!81023 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735539 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!735539 (= e!411519 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326081))))

(declare-fun b!735540 () Bool)

(assert (=> b!735540 (= e!411530 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326076))))

(declare-fun b!735541 () Bool)

(assert (=> b!735541 (= e!411519 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) (Found!7366 j!159)))))

(declare-fun b!735542 () Bool)

(assert (=> b!735542 (= e!411520 e!411522)))

(declare-fun res!494252 () Bool)

(assert (=> b!735542 (=> (not res!494252) (not e!411522))))

(declare-fun lt!326079 () SeekEntryResult!7366)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735542 (= res!494252 (or (= lt!326079 (MissingZero!7366 i!1173)) (= lt!326079 (MissingVacant!7366 i!1173))))))

(assert (=> b!735542 (= lt!326079 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!494262 () Bool)

(assert (=> start!65132 (=> (not res!494262) (not e!411520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65132 (= res!494262 (validMask!0 mask!3328))))

(assert (=> start!65132 e!411520))

(assert (=> start!65132 true))

(declare-fun array_inv!15562 (array!41305) Bool)

(assert (=> start!65132 (array_inv!15562 a!3186)))

(declare-fun b!735543 () Bool)

(declare-fun res!494263 () Bool)

(assert (=> b!735543 (=> (not res!494263) (not e!411520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735543 (= res!494263 (validKeyInArray!0 (select (arr!19766 a!3186) j!159)))))

(declare-fun b!735544 () Bool)

(assert (=> b!735544 (= e!411522 e!411521)))

(declare-fun res!494253 () Bool)

(assert (=> b!735544 (=> (not res!494253) (not e!411521))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735544 (= res!494253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19766 a!3186) j!159) mask!3328) (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326081))))

(assert (=> b!735544 (= lt!326081 (Intermediate!7366 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735545 () Bool)

(declare-fun e!411526 () Bool)

(declare-fun e!411524 () Bool)

(assert (=> b!735545 (= e!411526 (not e!411524))))

(declare-fun res!494261 () Bool)

(assert (=> b!735545 (=> res!494261 e!411524)))

(declare-fun lt!326075 () SeekEntryResult!7366)

(assert (=> b!735545 (= res!494261 (or (not (is-Intermediate!7366 lt!326075)) (bvsge x!1131 (x!62836 lt!326075))))))

(assert (=> b!735545 (= lt!326077 (Found!7366 j!159))))

(assert (=> b!735545 e!411528))

(declare-fun res!494249 () Bool)

(assert (=> b!735545 (=> (not res!494249) (not e!411528))))

(assert (=> b!735545 (= res!494249 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25060 0))(
  ( (Unit!25061) )
))
(declare-fun lt!326072 () Unit!25060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25060)

(assert (=> b!735545 (= lt!326072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735546 () Bool)

(declare-fun e!411529 () Unit!25060)

(declare-fun Unit!25062 () Unit!25060)

(assert (=> b!735546 (= e!411529 Unit!25062)))

(declare-fun lt!326078 () SeekEntryResult!7366)

(assert (=> b!735546 (= lt!326078 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735546 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326080 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326077)))

(declare-fun b!735547 () Bool)

(declare-fun res!494247 () Bool)

(assert (=> b!735547 (=> (not res!494247) (not e!411522))))

(declare-datatypes ((List!13768 0))(
  ( (Nil!13765) (Cons!13764 (h!14836 (_ BitVec 64)) (t!20083 List!13768)) )
))
(declare-fun arrayNoDuplicates!0 (array!41305 (_ BitVec 32) List!13768) Bool)

(assert (=> b!735547 (= res!494247 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13765))))

(declare-fun b!735548 () Bool)

(assert (=> b!735548 (= e!411524 e!411525)))

(declare-fun res!494264 () Bool)

(assert (=> b!735548 (=> res!494264 e!411525)))

(assert (=> b!735548 (= res!494264 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326080 #b00000000000000000000000000000000) (bvsge lt!326080 (size!20187 a!3186))))))

(declare-fun lt!326069 () Unit!25060)

(assert (=> b!735548 (= lt!326069 e!411529)))

(declare-fun c!81025 () Bool)

(declare-fun lt!326073 () Bool)

(assert (=> b!735548 (= c!81025 lt!326073)))

(assert (=> b!735548 (= lt!326073 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735548 (= lt!326080 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735549 () Bool)

(declare-fun res!494251 () Bool)

(assert (=> b!735549 (=> (not res!494251) (not e!411522))))

(assert (=> b!735549 (= res!494251 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20187 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20187 a!3186))))))

(declare-fun b!735550 () Bool)

(declare-fun Unit!25063 () Unit!25060)

(assert (=> b!735550 (= e!411529 Unit!25063)))

(assert (=> b!735550 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326080 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!326081)))

(declare-fun b!735551 () Bool)

(assert (=> b!735551 (= e!411521 e!411526)))

(declare-fun res!494248 () Bool)

(assert (=> b!735551 (=> (not res!494248) (not e!411526))))

(declare-fun lt!326074 () SeekEntryResult!7366)

(assert (=> b!735551 (= res!494248 (= lt!326074 lt!326075))))

(assert (=> b!735551 (= lt!326075 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326070 lt!326068 mask!3328))))

(assert (=> b!735551 (= lt!326074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326070 mask!3328) lt!326070 lt!326068 mask!3328))))

(assert (=> b!735551 (= lt!326070 (select (store (arr!19766 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735551 (= lt!326068 (array!41306 (store (arr!19766 a!3186) i!1173 k!2102) (size!20187 a!3186)))))

(declare-fun b!735552 () Bool)

(declare-fun res!494255 () Bool)

(assert (=> b!735552 (=> (not res!494255) (not e!411520))))

(assert (=> b!735552 (= res!494255 (validKeyInArray!0 k!2102))))

(declare-fun b!735553 () Bool)

(declare-fun res!494260 () Bool)

(assert (=> b!735553 (=> (not res!494260) (not e!411521))))

(assert (=> b!735553 (= res!494260 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19766 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735554 () Bool)

(declare-fun res!494254 () Bool)

(assert (=> b!735554 (=> (not res!494254) (not e!411520))))

(assert (=> b!735554 (= res!494254 (and (= (size!20187 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20187 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20187 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735555 () Bool)

(declare-fun res!494250 () Bool)

(assert (=> b!735555 (=> res!494250 e!411525)))

(assert (=> b!735555 (= res!494250 e!411523)))

(declare-fun c!81024 () Bool)

(assert (=> b!735555 (= c!81024 lt!326073)))

(assert (= (and start!65132 res!494262) b!735554))

(assert (= (and b!735554 res!494254) b!735543))

(assert (= (and b!735543 res!494263) b!735552))

(assert (= (and b!735552 res!494255) b!735534))

(assert (= (and b!735534 res!494257) b!735542))

(assert (= (and b!735542 res!494252) b!735536))

(assert (= (and b!735536 res!494259) b!735547))

(assert (= (and b!735547 res!494247) b!735549))

(assert (= (and b!735549 res!494251) b!735544))

(assert (= (and b!735544 res!494253) b!735553))

(assert (= (and b!735553 res!494260) b!735538))

(assert (= (and b!735538 c!81023) b!735539))

(assert (= (and b!735538 (not c!81023)) b!735541))

(assert (= (and b!735538 res!494256) b!735551))

(assert (= (and b!735551 res!494248) b!735545))

(assert (= (and b!735545 res!494249) b!735537))

(assert (= (and b!735537 res!494258) b!735540))

(assert (= (and b!735545 (not res!494261)) b!735548))

(assert (= (and b!735548 c!81025) b!735550))

(assert (= (and b!735548 (not c!81025)) b!735546))

(assert (= (and b!735548 (not res!494264)) b!735555))

(assert (= (and b!735555 c!81024) b!735532))

(assert (= (and b!735555 (not c!81024)) b!735535))

(assert (= (and b!735555 (not res!494250)) b!735533))

(declare-fun m!687889 () Bool)

(assert (=> b!735547 m!687889))

(declare-fun m!687891 () Bool)

(assert (=> b!735541 m!687891))

(assert (=> b!735541 m!687891))

(declare-fun m!687893 () Bool)

(assert (=> b!735541 m!687893))

(assert (=> b!735543 m!687891))

(assert (=> b!735543 m!687891))

(declare-fun m!687895 () Bool)

(assert (=> b!735543 m!687895))

(assert (=> b!735535 m!687891))

(assert (=> b!735535 m!687891))

(declare-fun m!687897 () Bool)

(assert (=> b!735535 m!687897))

(declare-fun m!687899 () Bool)

(assert (=> b!735545 m!687899))

(declare-fun m!687901 () Bool)

(assert (=> b!735545 m!687901))

(declare-fun m!687903 () Bool)

(assert (=> b!735536 m!687903))

(assert (=> b!735537 m!687891))

(assert (=> b!735537 m!687891))

(declare-fun m!687905 () Bool)

(assert (=> b!735537 m!687905))

(declare-fun m!687907 () Bool)

(assert (=> b!735542 m!687907))

(declare-fun m!687909 () Bool)

(assert (=> start!65132 m!687909))

(declare-fun m!687911 () Bool)

(assert (=> start!65132 m!687911))

(assert (=> b!735540 m!687891))

(assert (=> b!735540 m!687891))

(declare-fun m!687913 () Bool)

(assert (=> b!735540 m!687913))

(declare-fun m!687915 () Bool)

(assert (=> b!735533 m!687915))

(assert (=> b!735546 m!687891))

(assert (=> b!735546 m!687891))

(assert (=> b!735546 m!687893))

(assert (=> b!735546 m!687891))

(assert (=> b!735546 m!687897))

(declare-fun m!687917 () Bool)

(assert (=> b!735553 m!687917))

(declare-fun m!687919 () Bool)

(assert (=> b!735552 m!687919))

(assert (=> b!735544 m!687891))

(assert (=> b!735544 m!687891))

(declare-fun m!687921 () Bool)

(assert (=> b!735544 m!687921))

(assert (=> b!735544 m!687921))

(assert (=> b!735544 m!687891))

(declare-fun m!687923 () Bool)

(assert (=> b!735544 m!687923))

(assert (=> b!735532 m!687891))

(assert (=> b!735532 m!687891))

(declare-fun m!687925 () Bool)

(assert (=> b!735532 m!687925))

(assert (=> b!735539 m!687891))

(assert (=> b!735539 m!687891))

(declare-fun m!687927 () Bool)

(assert (=> b!735539 m!687927))

(declare-fun m!687929 () Bool)

(assert (=> b!735551 m!687929))

(assert (=> b!735551 m!687929))

(declare-fun m!687931 () Bool)

(assert (=> b!735551 m!687931))

(declare-fun m!687933 () Bool)

(assert (=> b!735551 m!687933))

(declare-fun m!687935 () Bool)

(assert (=> b!735551 m!687935))

(declare-fun m!687937 () Bool)

(assert (=> b!735551 m!687937))

(declare-fun m!687939 () Bool)

(assert (=> b!735548 m!687939))

(assert (=> b!735550 m!687891))

(assert (=> b!735550 m!687891))

(assert (=> b!735550 m!687925))

(declare-fun m!687941 () Bool)

(assert (=> b!735534 m!687941))

(push 1)

