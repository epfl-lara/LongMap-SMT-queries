; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120632 () Bool)

(assert start!120632)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96041 0))(
  ( (array!96042 (arr!46371 (Array (_ BitVec 32) (_ BitVec 64))) (size!46921 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96041)

(declare-fun e!795052 () Bool)

(declare-fun b!1404475 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10682 0))(
  ( (MissingZero!10682 (index!45105 (_ BitVec 32))) (Found!10682 (index!45106 (_ BitVec 32))) (Intermediate!10682 (undefined!11494 Bool) (index!45107 (_ BitVec 32)) (x!126717 (_ BitVec 32))) (Undefined!10682) (MissingVacant!10682 (index!45108 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96041 (_ BitVec 32)) SeekEntryResult!10682)

(assert (=> b!1404475 (= e!795052 (not (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) j!112) a!2901 mask!2840) (Found!10682 j!112))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96041 (_ BitVec 32)) Bool)

(assert (=> b!1404475 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47338 0))(
  ( (Unit!47339) )
))
(declare-fun lt!618666 () Unit!47338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47338)

(assert (=> b!1404475 (= lt!618666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618665 () SeekEntryResult!10682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96041 (_ BitVec 32)) SeekEntryResult!10682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404475 (= lt!618665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404476 () Bool)

(declare-fun res!942987 () Bool)

(assert (=> b!1404476 (=> (not res!942987) (not e!795052))))

(assert (=> b!1404476 (= res!942987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942990 () Bool)

(assert (=> start!120632 (=> (not res!942990) (not e!795052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120632 (= res!942990 (validMask!0 mask!2840))))

(assert (=> start!120632 e!795052))

(assert (=> start!120632 true))

(declare-fun array_inv!35399 (array!96041) Bool)

(assert (=> start!120632 (array_inv!35399 a!2901)))

(declare-fun b!1404477 () Bool)

(declare-fun res!942991 () Bool)

(assert (=> b!1404477 (=> (not res!942991) (not e!795052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404477 (= res!942991 (validKeyInArray!0 (select (arr!46371 a!2901) j!112)))))

(declare-fun b!1404478 () Bool)

(declare-fun res!942986 () Bool)

(assert (=> b!1404478 (=> (not res!942986) (not e!795052))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404478 (= res!942986 (validKeyInArray!0 (select (arr!46371 a!2901) i!1037)))))

(declare-fun b!1404479 () Bool)

(declare-fun res!942988 () Bool)

(assert (=> b!1404479 (=> (not res!942988) (not e!795052))))

(declare-datatypes ((List!32890 0))(
  ( (Nil!32887) (Cons!32886 (h!34134 (_ BitVec 64)) (t!47584 List!32890)) )
))
(declare-fun arrayNoDuplicates!0 (array!96041 (_ BitVec 32) List!32890) Bool)

(assert (=> b!1404479 (= res!942988 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32887))))

(declare-fun b!1404480 () Bool)

(declare-fun res!942989 () Bool)

(assert (=> b!1404480 (=> (not res!942989) (not e!795052))))

(assert (=> b!1404480 (= res!942989 (and (= (size!46921 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46921 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46921 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120632 res!942990) b!1404480))

(assert (= (and b!1404480 res!942989) b!1404478))

(assert (= (and b!1404478 res!942986) b!1404477))

(assert (= (and b!1404477 res!942991) b!1404476))

(assert (= (and b!1404476 res!942987) b!1404479))

(assert (= (and b!1404479 res!942988) b!1404475))

(declare-fun m!1293335 () Bool)

(assert (=> b!1404475 m!1293335))

(declare-fun m!1293337 () Bool)

(assert (=> b!1404475 m!1293337))

(assert (=> b!1404475 m!1293335))

(declare-fun m!1293339 () Bool)

(assert (=> b!1404475 m!1293339))

(assert (=> b!1404475 m!1293335))

(declare-fun m!1293341 () Bool)

(assert (=> b!1404475 m!1293341))

(assert (=> b!1404475 m!1293337))

(assert (=> b!1404475 m!1293335))

(declare-fun m!1293343 () Bool)

(assert (=> b!1404475 m!1293343))

(declare-fun m!1293345 () Bool)

(assert (=> b!1404475 m!1293345))

(declare-fun m!1293347 () Bool)

(assert (=> b!1404479 m!1293347))

(declare-fun m!1293349 () Bool)

(assert (=> b!1404476 m!1293349))

(declare-fun m!1293351 () Bool)

(assert (=> b!1404478 m!1293351))

(assert (=> b!1404478 m!1293351))

(declare-fun m!1293353 () Bool)

(assert (=> b!1404478 m!1293353))

(assert (=> b!1404477 m!1293335))

(assert (=> b!1404477 m!1293335))

(declare-fun m!1293355 () Bool)

(assert (=> b!1404477 m!1293355))

(declare-fun m!1293357 () Bool)

(assert (=> start!120632 m!1293357))

(declare-fun m!1293359 () Bool)

(assert (=> start!120632 m!1293359))

(check-sat (not b!1404475) (not b!1404477) (not start!120632) (not b!1404478) (not b!1404479) (not b!1404476))
(check-sat)
(get-model)

(declare-fun d!151251 () Bool)

(assert (=> d!151251 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120632 d!151251))

(declare-fun d!151257 () Bool)

(assert (=> d!151257 (= (array_inv!35399 a!2901) (bvsge (size!46921 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120632 d!151257))

(declare-fun e!795111 () SeekEntryResult!10682)

(declare-fun b!1404574 () Bool)

(assert (=> b!1404574 (= e!795111 (Intermediate!10682 false (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404575 () Bool)

(declare-fun e!795114 () SeekEntryResult!10682)

(assert (=> b!1404575 (= e!795114 e!795111)))

(declare-fun lt!618700 () (_ BitVec 64))

(declare-fun c!130226 () Bool)

(assert (=> b!1404575 (= c!130226 (or (= lt!618700 (select (arr!46371 a!2901) j!112)) (= (bvadd lt!618700 lt!618700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404576 () Bool)

(declare-fun e!795113 () Bool)

(declare-fun lt!618699 () SeekEntryResult!10682)

(assert (=> b!1404576 (= e!795113 (bvsge (x!126717 lt!618699) #b01111111111111111111111111111110))))

(declare-fun d!151259 () Bool)

(assert (=> d!151259 e!795113))

(declare-fun c!130225 () Bool)

(get-info :version)

(assert (=> d!151259 (= c!130225 (and ((_ is Intermediate!10682) lt!618699) (undefined!11494 lt!618699)))))

(assert (=> d!151259 (= lt!618699 e!795114)))

(declare-fun c!130227 () Bool)

(assert (=> d!151259 (= c!130227 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151259 (= lt!618700 (select (arr!46371 a!2901) (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840)))))

(assert (=> d!151259 (validMask!0 mask!2840)))

(assert (=> d!151259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840) lt!618699)))

(declare-fun b!1404577 () Bool)

(declare-fun e!795110 () Bool)

(assert (=> b!1404577 (= e!795113 e!795110)))

(declare-fun res!943043 () Bool)

(assert (=> b!1404577 (= res!943043 (and ((_ is Intermediate!10682) lt!618699) (not (undefined!11494 lt!618699)) (bvslt (x!126717 lt!618699) #b01111111111111111111111111111110) (bvsge (x!126717 lt!618699) #b00000000000000000000000000000000) (bvsge (x!126717 lt!618699) #b00000000000000000000000000000000)))))

(assert (=> b!1404577 (=> (not res!943043) (not e!795110))))

(declare-fun b!1404578 () Bool)

(assert (=> b!1404578 (= e!795114 (Intermediate!10682 true (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404579 () Bool)

(assert (=> b!1404579 (and (bvsge (index!45107 lt!618699) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618699) (size!46921 a!2901)))))

(declare-fun res!943045 () Bool)

(assert (=> b!1404579 (= res!943045 (= (select (arr!46371 a!2901) (index!45107 lt!618699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795112 () Bool)

(assert (=> b!1404579 (=> res!943045 e!795112)))

(declare-fun b!1404580 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404580 (= e!795111 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404581 () Bool)

(assert (=> b!1404581 (and (bvsge (index!45107 lt!618699) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618699) (size!46921 a!2901)))))

(assert (=> b!1404581 (= e!795112 (= (select (arr!46371 a!2901) (index!45107 lt!618699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404582 () Bool)

(assert (=> b!1404582 (and (bvsge (index!45107 lt!618699) #b00000000000000000000000000000000) (bvslt (index!45107 lt!618699) (size!46921 a!2901)))))

(declare-fun res!943044 () Bool)

(assert (=> b!1404582 (= res!943044 (= (select (arr!46371 a!2901) (index!45107 lt!618699)) (select (arr!46371 a!2901) j!112)))))

(assert (=> b!1404582 (=> res!943044 e!795112)))

(assert (=> b!1404582 (= e!795110 e!795112)))

(assert (= (and d!151259 c!130227) b!1404578))

(assert (= (and d!151259 (not c!130227)) b!1404575))

(assert (= (and b!1404575 c!130226) b!1404574))

(assert (= (and b!1404575 (not c!130226)) b!1404580))

(assert (= (and d!151259 c!130225) b!1404576))

(assert (= (and d!151259 (not c!130225)) b!1404577))

(assert (= (and b!1404577 res!943043) b!1404582))

(assert (= (and b!1404582 (not res!943044)) b!1404579))

(assert (= (and b!1404579 (not res!943045)) b!1404581))

(assert (=> d!151259 m!1293337))

(declare-fun m!1293415 () Bool)

(assert (=> d!151259 m!1293415))

(assert (=> d!151259 m!1293357))

(declare-fun m!1293417 () Bool)

(assert (=> b!1404581 m!1293417))

(assert (=> b!1404582 m!1293417))

(assert (=> b!1404579 m!1293417))

(assert (=> b!1404580 m!1293337))

(declare-fun m!1293419 () Bool)

(assert (=> b!1404580 m!1293419))

(assert (=> b!1404580 m!1293419))

(assert (=> b!1404580 m!1293335))

(declare-fun m!1293423 () Bool)

(assert (=> b!1404580 m!1293423))

(assert (=> b!1404475 d!151259))

(declare-fun d!151269 () Bool)

(declare-fun lt!618721 () SeekEntryResult!10682)

(assert (=> d!151269 (and (or ((_ is Undefined!10682) lt!618721) (not ((_ is Found!10682) lt!618721)) (and (bvsge (index!45106 lt!618721) #b00000000000000000000000000000000) (bvslt (index!45106 lt!618721) (size!46921 a!2901)))) (or ((_ is Undefined!10682) lt!618721) ((_ is Found!10682) lt!618721) (not ((_ is MissingZero!10682) lt!618721)) (and (bvsge (index!45105 lt!618721) #b00000000000000000000000000000000) (bvslt (index!45105 lt!618721) (size!46921 a!2901)))) (or ((_ is Undefined!10682) lt!618721) ((_ is Found!10682) lt!618721) ((_ is MissingZero!10682) lt!618721) (not ((_ is MissingVacant!10682) lt!618721)) (and (bvsge (index!45108 lt!618721) #b00000000000000000000000000000000) (bvslt (index!45108 lt!618721) (size!46921 a!2901)))) (or ((_ is Undefined!10682) lt!618721) (ite ((_ is Found!10682) lt!618721) (= (select (arr!46371 a!2901) (index!45106 lt!618721)) (select (arr!46371 a!2901) j!112)) (ite ((_ is MissingZero!10682) lt!618721) (= (select (arr!46371 a!2901) (index!45105 lt!618721)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10682) lt!618721) (= (select (arr!46371 a!2901) (index!45108 lt!618721)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!795144 () SeekEntryResult!10682)

(assert (=> d!151269 (= lt!618721 e!795144)))

(declare-fun c!130250 () Bool)

(declare-fun lt!618719 () SeekEntryResult!10682)

(assert (=> d!151269 (= c!130250 (and ((_ is Intermediate!10682) lt!618719) (undefined!11494 lt!618719)))))

(assert (=> d!151269 (= lt!618719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151269 (validMask!0 mask!2840)))

(assert (=> d!151269 (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) j!112) a!2901 mask!2840) lt!618721)))

(declare-fun b!1404634 () Bool)

(assert (=> b!1404634 (= e!795144 Undefined!10682)))

(declare-fun b!1404635 () Bool)

(declare-fun e!795142 () SeekEntryResult!10682)

(assert (=> b!1404635 (= e!795142 (Found!10682 (index!45107 lt!618719)))))

(declare-fun e!795143 () SeekEntryResult!10682)

(declare-fun b!1404636 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96041 (_ BitVec 32)) SeekEntryResult!10682)

(assert (=> b!1404636 (= e!795143 (seekKeyOrZeroReturnVacant!0 (x!126717 lt!618719) (index!45107 lt!618719) (index!45107 lt!618719) (select (arr!46371 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404637 () Bool)

(declare-fun c!130249 () Bool)

(declare-fun lt!618720 () (_ BitVec 64))

(assert (=> b!1404637 (= c!130249 (= lt!618720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404637 (= e!795142 e!795143)))

(declare-fun b!1404638 () Bool)

(assert (=> b!1404638 (= e!795144 e!795142)))

(assert (=> b!1404638 (= lt!618720 (select (arr!46371 a!2901) (index!45107 lt!618719)))))

(declare-fun c!130251 () Bool)

(assert (=> b!1404638 (= c!130251 (= lt!618720 (select (arr!46371 a!2901) j!112)))))

(declare-fun b!1404639 () Bool)

(assert (=> b!1404639 (= e!795143 (MissingZero!10682 (index!45107 lt!618719)))))

(assert (= (and d!151269 c!130250) b!1404634))

(assert (= (and d!151269 (not c!130250)) b!1404638))

(assert (= (and b!1404638 c!130251) b!1404635))

(assert (= (and b!1404638 (not c!130251)) b!1404637))

(assert (= (and b!1404637 c!130249) b!1404639))

(assert (= (and b!1404637 (not c!130249)) b!1404636))

(declare-fun m!1293431 () Bool)

(assert (=> d!151269 m!1293431))

(assert (=> d!151269 m!1293357))

(assert (=> d!151269 m!1293337))

(assert (=> d!151269 m!1293335))

(assert (=> d!151269 m!1293343))

(declare-fun m!1293433 () Bool)

(assert (=> d!151269 m!1293433))

(declare-fun m!1293435 () Bool)

(assert (=> d!151269 m!1293435))

(assert (=> d!151269 m!1293335))

(assert (=> d!151269 m!1293337))

(assert (=> b!1404636 m!1293335))

(declare-fun m!1293437 () Bool)

(assert (=> b!1404636 m!1293437))

(declare-fun m!1293439 () Bool)

(assert (=> b!1404638 m!1293439))

(assert (=> b!1404475 d!151269))

(declare-fun d!151277 () Bool)

(assert (=> d!151277 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618731 () Unit!47338)

(declare-fun choose!38 (array!96041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47338)

(assert (=> d!151277 (= lt!618731 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151277 (validMask!0 mask!2840)))

(assert (=> d!151277 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618731)))

(declare-fun bs!40922 () Bool)

(assert (= bs!40922 d!151277))

(assert (=> bs!40922 m!1293345))

(declare-fun m!1293459 () Bool)

(assert (=> bs!40922 m!1293459))

(assert (=> bs!40922 m!1293357))

(assert (=> b!1404475 d!151277))

(declare-fun d!151283 () Bool)

(declare-fun lt!618742 () (_ BitVec 32))

(declare-fun lt!618741 () (_ BitVec 32))

(assert (=> d!151283 (= lt!618742 (bvmul (bvxor lt!618741 (bvlshr lt!618741 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151283 (= lt!618741 ((_ extract 31 0) (bvand (bvxor (select (arr!46371 a!2901) j!112) (bvlshr (select (arr!46371 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151283 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943058 (let ((h!34136 ((_ extract 31 0) (bvand (bvxor (select (arr!46371 a!2901) j!112) (bvlshr (select (arr!46371 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126722 (bvmul (bvxor h!34136 (bvlshr h!34136 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126722 (bvlshr x!126722 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943058 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943058 #b00000000000000000000000000000000))))))

(assert (=> d!151283 (= (toIndex!0 (select (arr!46371 a!2901) j!112) mask!2840) (bvand (bvxor lt!618742 (bvlshr lt!618742 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404475 d!151283))

(declare-fun call!66920 () Bool)

(declare-fun bm!66917 () Bool)

(assert (=> bm!66917 (= call!66920 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151287 () Bool)

(declare-fun res!943066 () Bool)

(declare-fun e!795162 () Bool)

(assert (=> d!151287 (=> res!943066 e!795162)))

(assert (=> d!151287 (= res!943066 (bvsge j!112 (size!46921 a!2901)))))

(assert (=> d!151287 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795162)))

(declare-fun b!1404667 () Bool)

(declare-fun e!795164 () Bool)

(declare-fun e!795163 () Bool)

(assert (=> b!1404667 (= e!795164 e!795163)))

(declare-fun lt!618759 () (_ BitVec 64))

(assert (=> b!1404667 (= lt!618759 (select (arr!46371 a!2901) j!112))))

(declare-fun lt!618758 () Unit!47338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96041 (_ BitVec 64) (_ BitVec 32)) Unit!47338)

(assert (=> b!1404667 (= lt!618758 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618759 j!112))))

(declare-fun arrayContainsKey!0 (array!96041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404667 (arrayContainsKey!0 a!2901 lt!618759 #b00000000000000000000000000000000)))

(declare-fun lt!618760 () Unit!47338)

(assert (=> b!1404667 (= lt!618760 lt!618758)))

(declare-fun res!943067 () Bool)

(assert (=> b!1404667 (= res!943067 (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) j!112) a!2901 mask!2840) (Found!10682 j!112)))))

(assert (=> b!1404667 (=> (not res!943067) (not e!795163))))

(declare-fun b!1404668 () Bool)

(assert (=> b!1404668 (= e!795164 call!66920)))

(declare-fun b!1404669 () Bool)

(assert (=> b!1404669 (= e!795163 call!66920)))

(declare-fun b!1404670 () Bool)

(assert (=> b!1404670 (= e!795162 e!795164)))

(declare-fun c!130261 () Bool)

(assert (=> b!1404670 (= c!130261 (validKeyInArray!0 (select (arr!46371 a!2901) j!112)))))

(assert (= (and d!151287 (not res!943066)) b!1404670))

(assert (= (and b!1404670 c!130261) b!1404667))

(assert (= (and b!1404670 (not c!130261)) b!1404668))

(assert (= (and b!1404667 res!943067) b!1404669))

(assert (= (or b!1404669 b!1404668) bm!66917))

(declare-fun m!1293469 () Bool)

(assert (=> bm!66917 m!1293469))

(assert (=> b!1404667 m!1293335))

(declare-fun m!1293471 () Bool)

(assert (=> b!1404667 m!1293471))

(declare-fun m!1293473 () Bool)

(assert (=> b!1404667 m!1293473))

(assert (=> b!1404667 m!1293335))

(assert (=> b!1404667 m!1293341))

(assert (=> b!1404670 m!1293335))

(assert (=> b!1404670 m!1293335))

(assert (=> b!1404670 m!1293355))

(assert (=> b!1404475 d!151287))

(declare-fun d!151295 () Bool)

(assert (=> d!151295 (= (validKeyInArray!0 (select (arr!46371 a!2901) i!1037)) (and (not (= (select (arr!46371 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46371 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404478 d!151295))

(declare-fun b!1404709 () Bool)

(declare-fun e!795190 () Bool)

(declare-fun contains!9789 (List!32890 (_ BitVec 64)) Bool)

(assert (=> b!1404709 (= e!795190 (contains!9789 Nil!32887 (select (arr!46371 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404710 () Bool)

(declare-fun e!795193 () Bool)

(declare-fun e!795191 () Bool)

(assert (=> b!1404710 (= e!795193 e!795191)))

(declare-fun res!943081 () Bool)

(assert (=> b!1404710 (=> (not res!943081) (not e!795191))))

(assert (=> b!1404710 (= res!943081 (not e!795190))))

(declare-fun res!943082 () Bool)

(assert (=> b!1404710 (=> (not res!943082) (not e!795190))))

(assert (=> b!1404710 (= res!943082 (validKeyInArray!0 (select (arr!46371 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404711 () Bool)

(declare-fun e!795192 () Bool)

(assert (=> b!1404711 (= e!795191 e!795192)))

(declare-fun c!130275 () Bool)

(assert (=> b!1404711 (= c!130275 (validKeyInArray!0 (select (arr!46371 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404712 () Bool)

(declare-fun call!66925 () Bool)

(assert (=> b!1404712 (= e!795192 call!66925)))

(declare-fun d!151297 () Bool)

(declare-fun res!943080 () Bool)

(assert (=> d!151297 (=> res!943080 e!795193)))

(assert (=> d!151297 (= res!943080 (bvsge #b00000000000000000000000000000000 (size!46921 a!2901)))))

(assert (=> d!151297 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32887) e!795193)))

(declare-fun bm!66922 () Bool)

(assert (=> bm!66922 (= call!66925 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130275 (Cons!32886 (select (arr!46371 a!2901) #b00000000000000000000000000000000) Nil!32887) Nil!32887)))))

(declare-fun b!1404713 () Bool)

(assert (=> b!1404713 (= e!795192 call!66925)))

(assert (= (and d!151297 (not res!943080)) b!1404710))

(assert (= (and b!1404710 res!943082) b!1404709))

(assert (= (and b!1404710 res!943081) b!1404711))

(assert (= (and b!1404711 c!130275) b!1404712))

(assert (= (and b!1404711 (not c!130275)) b!1404713))

(assert (= (or b!1404712 b!1404713) bm!66922))

(declare-fun m!1293485 () Bool)

(assert (=> b!1404709 m!1293485))

(assert (=> b!1404709 m!1293485))

(declare-fun m!1293487 () Bool)

(assert (=> b!1404709 m!1293487))

(assert (=> b!1404710 m!1293485))

(assert (=> b!1404710 m!1293485))

(declare-fun m!1293489 () Bool)

(assert (=> b!1404710 m!1293489))

(assert (=> b!1404711 m!1293485))

(assert (=> b!1404711 m!1293485))

(assert (=> b!1404711 m!1293489))

(assert (=> bm!66922 m!1293485))

(declare-fun m!1293491 () Bool)

(assert (=> bm!66922 m!1293491))

(assert (=> b!1404479 d!151297))

(declare-fun d!151305 () Bool)

(assert (=> d!151305 (= (validKeyInArray!0 (select (arr!46371 a!2901) j!112)) (and (not (= (select (arr!46371 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46371 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404477 d!151305))

(declare-fun bm!66923 () Bool)

(declare-fun call!66926 () Bool)

(assert (=> bm!66923 (= call!66926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151307 () Bool)

(declare-fun res!943083 () Bool)

(declare-fun e!795194 () Bool)

(assert (=> d!151307 (=> res!943083 e!795194)))

(assert (=> d!151307 (= res!943083 (bvsge #b00000000000000000000000000000000 (size!46921 a!2901)))))

(assert (=> d!151307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795194)))

(declare-fun b!1404714 () Bool)

(declare-fun e!795196 () Bool)

(declare-fun e!795195 () Bool)

(assert (=> b!1404714 (= e!795196 e!795195)))

(declare-fun lt!618767 () (_ BitVec 64))

(assert (=> b!1404714 (= lt!618767 (select (arr!46371 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618766 () Unit!47338)

(assert (=> b!1404714 (= lt!618766 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618767 #b00000000000000000000000000000000))))

(assert (=> b!1404714 (arrayContainsKey!0 a!2901 lt!618767 #b00000000000000000000000000000000)))

(declare-fun lt!618768 () Unit!47338)

(assert (=> b!1404714 (= lt!618768 lt!618766)))

(declare-fun res!943084 () Bool)

(assert (=> b!1404714 (= res!943084 (= (seekEntryOrOpen!0 (select (arr!46371 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10682 #b00000000000000000000000000000000)))))

(assert (=> b!1404714 (=> (not res!943084) (not e!795195))))

(declare-fun b!1404715 () Bool)

(assert (=> b!1404715 (= e!795196 call!66926)))

(declare-fun b!1404716 () Bool)

(assert (=> b!1404716 (= e!795195 call!66926)))

(declare-fun b!1404717 () Bool)

(assert (=> b!1404717 (= e!795194 e!795196)))

(declare-fun c!130276 () Bool)

(assert (=> b!1404717 (= c!130276 (validKeyInArray!0 (select (arr!46371 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151307 (not res!943083)) b!1404717))

(assert (= (and b!1404717 c!130276) b!1404714))

(assert (= (and b!1404717 (not c!130276)) b!1404715))

(assert (= (and b!1404714 res!943084) b!1404716))

(assert (= (or b!1404716 b!1404715) bm!66923))

(declare-fun m!1293493 () Bool)

(assert (=> bm!66923 m!1293493))

(assert (=> b!1404714 m!1293485))

(declare-fun m!1293495 () Bool)

(assert (=> b!1404714 m!1293495))

(declare-fun m!1293497 () Bool)

(assert (=> b!1404714 m!1293497))

(assert (=> b!1404714 m!1293485))

(declare-fun m!1293499 () Bool)

(assert (=> b!1404714 m!1293499))

(assert (=> b!1404717 m!1293485))

(assert (=> b!1404717 m!1293485))

(assert (=> b!1404717 m!1293489))

(assert (=> b!1404476 d!151307))

(check-sat (not b!1404717) (not d!151269) (not b!1404670) (not bm!66923) (not b!1404667) (not b!1404710) (not b!1404636) (not b!1404709) (not d!151259) (not bm!66917) (not b!1404714) (not bm!66922) (not d!151277) (not b!1404580) (not b!1404711))
