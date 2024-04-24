; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67144 () Bool)

(assert start!67144)

(declare-fun b!774460 () Bool)

(declare-datatypes ((Unit!26683 0))(
  ( (Unit!26684) )
))
(declare-fun e!431160 () Unit!26683)

(declare-fun Unit!26685 () Unit!26683)

(assert (=> b!774460 (= e!431160 Unit!26685)))

(declare-datatypes ((array!42448 0))(
  ( (array!42449 (arr!20317 (Array (_ BitVec 32) (_ BitVec 64))) (size!20737 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42448)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!344900 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7873 0))(
  ( (MissingZero!7873 (index!33860 (_ BitVec 32))) (Found!7873 (index!33861 (_ BitVec 32))) (Intermediate!7873 (undefined!8685 Bool) (index!33862 (_ BitVec 32)) (x!64959 (_ BitVec 32))) (Undefined!7873) (MissingVacant!7873 (index!33863 (_ BitVec 32))) )
))
(declare-fun lt!344896 () SeekEntryResult!7873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!774460 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344896)))

(declare-fun b!774461 () Bool)

(declare-fun Unit!26686 () Unit!26683)

(assert (=> b!774461 (= e!431160 Unit!26686)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!344890 () SeekEntryResult!7873)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!774461 (= lt!344890 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344901 () SeekEntryResult!7873)

(assert (=> b!774461 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344901)))

(declare-fun lt!344894 () array!42448)

(declare-fun e!431154 () Bool)

(declare-fun b!774462 () Bool)

(declare-fun lt!344897 () SeekEntryResult!7873)

(declare-fun lt!344895 () (_ BitVec 64))

(assert (=> b!774462 (= e!431154 (= lt!344897 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 lt!344895 lt!344894 mask!3328)))))

(declare-fun e!431150 () Bool)

(declare-fun lt!344899 () SeekEntryResult!7873)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!774463 () Bool)

(assert (=> b!774463 (= e!431150 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344899))))

(declare-fun e!431151 () Bool)

(declare-fun b!774464 () Bool)

(assert (=> b!774464 (= e!431151 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344901)))))

(declare-fun b!774466 () Bool)

(declare-fun e!431155 () Bool)

(assert (=> b!774466 (= e!431155 e!431154)))

(declare-fun res!523651 () Bool)

(assert (=> b!774466 (=> res!523651 e!431154)))

(assert (=> b!774466 (= res!523651 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344900 #b00000000000000000000000000000000) (bvsge lt!344900 (size!20737 a!3186))))))

(declare-fun lt!344898 () Unit!26683)

(assert (=> b!774466 (= lt!344898 e!431160)))

(declare-fun c!85812 () Bool)

(declare-fun lt!344893 () Bool)

(assert (=> b!774466 (= c!85812 lt!344893)))

(assert (=> b!774466 (= lt!344893 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774466 (= lt!344900 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!774467 () Bool)

(declare-fun e!431152 () Bool)

(assert (=> b!774467 (= e!431152 e!431150)))

(declare-fun res!523643 () Bool)

(assert (=> b!774467 (=> (not res!523643) (not e!431150))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7873)

(assert (=> b!774467 (= res!523643 (= (seekEntryOrOpen!0 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344899))))

(assert (=> b!774467 (= lt!344899 (Found!7873 j!159))))

(declare-fun b!774468 () Bool)

(declare-fun res!523645 () Bool)

(assert (=> b!774468 (=> res!523645 e!431154)))

(assert (=> b!774468 (= res!523645 e!431151)))

(declare-fun c!85813 () Bool)

(assert (=> b!774468 (= c!85813 lt!344893)))

(declare-fun b!774469 () Bool)

(declare-fun res!523646 () Bool)

(declare-fun e!431159 () Bool)

(assert (=> b!774469 (=> (not res!523646) (not e!431159))))

(declare-fun e!431156 () Bool)

(assert (=> b!774469 (= res!523646 e!431156)))

(declare-fun c!85814 () Bool)

(assert (=> b!774469 (= c!85814 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774470 () Bool)

(declare-fun e!431153 () Bool)

(assert (=> b!774470 (= e!431153 e!431159)))

(declare-fun res!523639 () Bool)

(assert (=> b!774470 (=> (not res!523639) (not e!431159))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774470 (= res!523639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344896))))

(assert (=> b!774470 (= lt!344896 (Intermediate!7873 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774471 () Bool)

(assert (=> b!774471 (= e!431151 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344896)))))

(declare-fun b!774472 () Bool)

(declare-fun res!523640 () Bool)

(declare-fun e!431158 () Bool)

(assert (=> b!774472 (=> (not res!523640) (not e!431158))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774472 (= res!523640 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774473 () Bool)

(declare-fun res!523656 () Bool)

(assert (=> b!774473 (=> (not res!523656) (not e!431158))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774473 (= res!523656 (and (= (size!20737 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20737 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20737 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774474 () Bool)

(assert (=> b!774474 (= e!431156 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344896))))

(declare-fun b!774475 () Bool)

(declare-fun res!523642 () Bool)

(assert (=> b!774475 (=> (not res!523642) (not e!431159))))

(assert (=> b!774475 (= res!523642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20317 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774476 () Bool)

(declare-fun e!431157 () Bool)

(assert (=> b!774476 (= e!431157 (not e!431155))))

(declare-fun res!523644 () Bool)

(assert (=> b!774476 (=> res!523644 e!431155)))

(declare-fun lt!344892 () SeekEntryResult!7873)

(get-info :version)

(assert (=> b!774476 (= res!523644 (or (not ((_ is Intermediate!7873) lt!344892)) (bvsge x!1131 (x!64959 lt!344892))))))

(assert (=> b!774476 (= lt!344901 (Found!7873 j!159))))

(assert (=> b!774476 e!431152))

(declare-fun res!523652 () Bool)

(assert (=> b!774476 (=> (not res!523652) (not e!431152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42448 (_ BitVec 32)) Bool)

(assert (=> b!774476 (= res!523652 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344891 () Unit!26683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26683)

(assert (=> b!774476 (= lt!344891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774477 () Bool)

(declare-fun res!523654 () Bool)

(assert (=> b!774477 (=> (not res!523654) (not e!431158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774477 (= res!523654 (validKeyInArray!0 (select (arr!20317 a!3186) j!159)))))

(declare-fun res!523647 () Bool)

(assert (=> start!67144 (=> (not res!523647) (not e!431158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67144 (= res!523647 (validMask!0 mask!3328))))

(assert (=> start!67144 e!431158))

(assert (=> start!67144 true))

(declare-fun array_inv!16176 (array!42448) Bool)

(assert (=> start!67144 (array_inv!16176 a!3186)))

(declare-fun b!774465 () Bool)

(assert (=> b!774465 (= e!431158 e!431153)))

(declare-fun res!523649 () Bool)

(assert (=> b!774465 (=> (not res!523649) (not e!431153))))

(declare-fun lt!344902 () SeekEntryResult!7873)

(assert (=> b!774465 (= res!523649 (or (= lt!344902 (MissingZero!7873 i!1173)) (= lt!344902 (MissingVacant!7873 i!1173))))))

(assert (=> b!774465 (= lt!344902 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774478 () Bool)

(assert (=> b!774478 (= e!431156 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159)))))

(declare-fun b!774479 () Bool)

(declare-fun res!523648 () Bool)

(assert (=> b!774479 (=> (not res!523648) (not e!431153))))

(declare-datatypes ((List!14226 0))(
  ( (Nil!14223) (Cons!14222 (h!15333 (_ BitVec 64)) (t!20533 List!14226)) )
))
(declare-fun arrayNoDuplicates!0 (array!42448 (_ BitVec 32) List!14226) Bool)

(assert (=> b!774479 (= res!523648 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14223))))

(declare-fun b!774480 () Bool)

(declare-fun res!523650 () Bool)

(assert (=> b!774480 (=> (not res!523650) (not e!431153))))

(assert (=> b!774480 (= res!523650 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20737 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20737 a!3186))))))

(declare-fun b!774481 () Bool)

(assert (=> b!774481 (= e!431159 e!431157)))

(declare-fun res!523641 () Bool)

(assert (=> b!774481 (=> (not res!523641) (not e!431157))))

(assert (=> b!774481 (= res!523641 (= lt!344897 lt!344892))))

(assert (=> b!774481 (= lt!344892 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344895 lt!344894 mask!3328))))

(assert (=> b!774481 (= lt!344897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344895 mask!3328) lt!344895 lt!344894 mask!3328))))

(assert (=> b!774481 (= lt!344895 (select (store (arr!20317 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774481 (= lt!344894 (array!42449 (store (arr!20317 a!3186) i!1173 k0!2102) (size!20737 a!3186)))))

(declare-fun b!774482 () Bool)

(declare-fun res!523655 () Bool)

(assert (=> b!774482 (=> (not res!523655) (not e!431158))))

(assert (=> b!774482 (= res!523655 (validKeyInArray!0 k0!2102))))

(declare-fun b!774483 () Bool)

(declare-fun res!523653 () Bool)

(assert (=> b!774483 (=> (not res!523653) (not e!431153))))

(assert (=> b!774483 (= res!523653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67144 res!523647) b!774473))

(assert (= (and b!774473 res!523656) b!774477))

(assert (= (and b!774477 res!523654) b!774482))

(assert (= (and b!774482 res!523655) b!774472))

(assert (= (and b!774472 res!523640) b!774465))

(assert (= (and b!774465 res!523649) b!774483))

(assert (= (and b!774483 res!523653) b!774479))

(assert (= (and b!774479 res!523648) b!774480))

(assert (= (and b!774480 res!523650) b!774470))

(assert (= (and b!774470 res!523639) b!774475))

(assert (= (and b!774475 res!523642) b!774469))

(assert (= (and b!774469 c!85814) b!774474))

(assert (= (and b!774469 (not c!85814)) b!774478))

(assert (= (and b!774469 res!523646) b!774481))

(assert (= (and b!774481 res!523641) b!774476))

(assert (= (and b!774476 res!523652) b!774467))

(assert (= (and b!774467 res!523643) b!774463))

(assert (= (and b!774476 (not res!523644)) b!774466))

(assert (= (and b!774466 c!85812) b!774460))

(assert (= (and b!774466 (not c!85812)) b!774461))

(assert (= (and b!774466 (not res!523651)) b!774468))

(assert (= (and b!774468 c!85813) b!774471))

(assert (= (and b!774468 (not c!85813)) b!774464))

(assert (= (and b!774468 (not res!523645)) b!774462))

(declare-fun m!719519 () Bool)

(assert (=> b!774482 m!719519))

(declare-fun m!719521 () Bool)

(assert (=> b!774462 m!719521))

(declare-fun m!719523 () Bool)

(assert (=> b!774479 m!719523))

(declare-fun m!719525 () Bool)

(assert (=> b!774478 m!719525))

(assert (=> b!774478 m!719525))

(declare-fun m!719527 () Bool)

(assert (=> b!774478 m!719527))

(assert (=> b!774460 m!719525))

(assert (=> b!774460 m!719525))

(declare-fun m!719529 () Bool)

(assert (=> b!774460 m!719529))

(assert (=> b!774464 m!719525))

(assert (=> b!774464 m!719525))

(declare-fun m!719531 () Bool)

(assert (=> b!774464 m!719531))

(declare-fun m!719533 () Bool)

(assert (=> start!67144 m!719533))

(declare-fun m!719535 () Bool)

(assert (=> start!67144 m!719535))

(declare-fun m!719537 () Bool)

(assert (=> b!774483 m!719537))

(declare-fun m!719539 () Bool)

(assert (=> b!774472 m!719539))

(assert (=> b!774477 m!719525))

(assert (=> b!774477 m!719525))

(declare-fun m!719541 () Bool)

(assert (=> b!774477 m!719541))

(assert (=> b!774467 m!719525))

(assert (=> b!774467 m!719525))

(declare-fun m!719543 () Bool)

(assert (=> b!774467 m!719543))

(declare-fun m!719545 () Bool)

(assert (=> b!774475 m!719545))

(assert (=> b!774470 m!719525))

(assert (=> b!774470 m!719525))

(declare-fun m!719547 () Bool)

(assert (=> b!774470 m!719547))

(assert (=> b!774470 m!719547))

(assert (=> b!774470 m!719525))

(declare-fun m!719549 () Bool)

(assert (=> b!774470 m!719549))

(declare-fun m!719551 () Bool)

(assert (=> b!774466 m!719551))

(assert (=> b!774474 m!719525))

(assert (=> b!774474 m!719525))

(declare-fun m!719553 () Bool)

(assert (=> b!774474 m!719553))

(assert (=> b!774461 m!719525))

(assert (=> b!774461 m!719525))

(assert (=> b!774461 m!719527))

(assert (=> b!774461 m!719525))

(assert (=> b!774461 m!719531))

(assert (=> b!774471 m!719525))

(assert (=> b!774471 m!719525))

(assert (=> b!774471 m!719529))

(declare-fun m!719555 () Bool)

(assert (=> b!774476 m!719555))

(declare-fun m!719557 () Bool)

(assert (=> b!774476 m!719557))

(assert (=> b!774463 m!719525))

(assert (=> b!774463 m!719525))

(declare-fun m!719559 () Bool)

(assert (=> b!774463 m!719559))

(declare-fun m!719561 () Bool)

(assert (=> b!774465 m!719561))

(declare-fun m!719563 () Bool)

(assert (=> b!774481 m!719563))

(declare-fun m!719565 () Bool)

(assert (=> b!774481 m!719565))

(assert (=> b!774481 m!719565))

(declare-fun m!719567 () Bool)

(assert (=> b!774481 m!719567))

(declare-fun m!719569 () Bool)

(assert (=> b!774481 m!719569))

(declare-fun m!719571 () Bool)

(assert (=> b!774481 m!719571))

(check-sat (not b!774471) (not b!774481) (not b!774476) (not b!774472) (not b!774467) (not b!774477) (not b!774470) (not b!774479) (not b!774465) (not b!774474) (not start!67144) (not b!774483) (not b!774466) (not b!774463) (not b!774482) (not b!774478) (not b!774461) (not b!774462) (not b!774460) (not b!774464))
(check-sat)
(get-model)

(declare-fun e!431241 () SeekEntryResult!7873)

(declare-fun b!774640 () Bool)

(assert (=> b!774640 (= e!431241 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774641 () Bool)

(declare-fun e!431242 () SeekEntryResult!7873)

(assert (=> b!774641 (= e!431242 (Found!7873 index!1321))))

(declare-fun b!774642 () Bool)

(declare-fun e!431240 () SeekEntryResult!7873)

(assert (=> b!774642 (= e!431240 Undefined!7873)))

(declare-fun b!774643 () Bool)

(assert (=> b!774643 (= e!431240 e!431242)))

(declare-fun c!85841 () Bool)

(declare-fun lt!344985 () (_ BitVec 64))

(assert (=> b!774643 (= c!85841 (= lt!344985 (select (arr!20317 a!3186) j!159)))))

(declare-fun lt!344986 () SeekEntryResult!7873)

(declare-fun d!102227 () Bool)

(assert (=> d!102227 (and (or ((_ is Undefined!7873) lt!344986) (not ((_ is Found!7873) lt!344986)) (and (bvsge (index!33861 lt!344986) #b00000000000000000000000000000000) (bvslt (index!33861 lt!344986) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!344986) ((_ is Found!7873) lt!344986) (not ((_ is MissingVacant!7873) lt!344986)) (not (= (index!33863 lt!344986) resIntermediateIndex!5)) (and (bvsge (index!33863 lt!344986) #b00000000000000000000000000000000) (bvslt (index!33863 lt!344986) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!344986) (ite ((_ is Found!7873) lt!344986) (= (select (arr!20317 a!3186) (index!33861 lt!344986)) (select (arr!20317 a!3186) j!159)) (and ((_ is MissingVacant!7873) lt!344986) (= (index!33863 lt!344986) resIntermediateIndex!5) (= (select (arr!20317 a!3186) (index!33863 lt!344986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102227 (= lt!344986 e!431240)))

(declare-fun c!85839 () Bool)

(assert (=> d!102227 (= c!85839 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102227 (= lt!344985 (select (arr!20317 a!3186) index!1321))))

(assert (=> d!102227 (validMask!0 mask!3328)))

(assert (=> d!102227 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344986)))

(declare-fun b!774644 () Bool)

(assert (=> b!774644 (= e!431241 (MissingVacant!7873 resIntermediateIndex!5))))

(declare-fun b!774645 () Bool)

(declare-fun c!85840 () Bool)

(assert (=> b!774645 (= c!85840 (= lt!344985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774645 (= e!431242 e!431241)))

(assert (= (and d!102227 c!85839) b!774642))

(assert (= (and d!102227 (not c!85839)) b!774643))

(assert (= (and b!774643 c!85841) b!774641))

(assert (= (and b!774643 (not c!85841)) b!774645))

(assert (= (and b!774645 c!85840) b!774644))

(assert (= (and b!774645 (not c!85840)) b!774640))

(declare-fun m!719681 () Bool)

(assert (=> b!774640 m!719681))

(assert (=> b!774640 m!719681))

(assert (=> b!774640 m!719525))

(declare-fun m!719683 () Bool)

(assert (=> b!774640 m!719683))

(declare-fun m!719685 () Bool)

(assert (=> d!102227 m!719685))

(declare-fun m!719687 () Bool)

(assert (=> d!102227 m!719687))

(declare-fun m!719689 () Bool)

(assert (=> d!102227 m!719689))

(assert (=> d!102227 m!719533))

(assert (=> b!774478 d!102227))

(declare-fun b!774658 () Bool)

(declare-fun c!85848 () Bool)

(declare-fun lt!344993 () (_ BitVec 64))

(assert (=> b!774658 (= c!85848 (= lt!344993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431250 () SeekEntryResult!7873)

(declare-fun e!431249 () SeekEntryResult!7873)

(assert (=> b!774658 (= e!431250 e!431249)))

(declare-fun b!774659 () Bool)

(declare-fun lt!344995 () SeekEntryResult!7873)

(assert (=> b!774659 (= e!431250 (Found!7873 (index!33862 lt!344995)))))

(declare-fun b!774660 () Bool)

(assert (=> b!774660 (= e!431249 (seekKeyOrZeroReturnVacant!0 (x!64959 lt!344995) (index!33862 lt!344995) (index!33862 lt!344995) (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774661 () Bool)

(declare-fun e!431251 () SeekEntryResult!7873)

(assert (=> b!774661 (= e!431251 Undefined!7873)))

(declare-fun d!102229 () Bool)

(declare-fun lt!344994 () SeekEntryResult!7873)

(assert (=> d!102229 (and (or ((_ is Undefined!7873) lt!344994) (not ((_ is Found!7873) lt!344994)) (and (bvsge (index!33861 lt!344994) #b00000000000000000000000000000000) (bvslt (index!33861 lt!344994) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!344994) ((_ is Found!7873) lt!344994) (not ((_ is MissingZero!7873) lt!344994)) (and (bvsge (index!33860 lt!344994) #b00000000000000000000000000000000) (bvslt (index!33860 lt!344994) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!344994) ((_ is Found!7873) lt!344994) ((_ is MissingZero!7873) lt!344994) (not ((_ is MissingVacant!7873) lt!344994)) (and (bvsge (index!33863 lt!344994) #b00000000000000000000000000000000) (bvslt (index!33863 lt!344994) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!344994) (ite ((_ is Found!7873) lt!344994) (= (select (arr!20317 a!3186) (index!33861 lt!344994)) (select (arr!20317 a!3186) j!159)) (ite ((_ is MissingZero!7873) lt!344994) (= (select (arr!20317 a!3186) (index!33860 lt!344994)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7873) lt!344994) (= (select (arr!20317 a!3186) (index!33863 lt!344994)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102229 (= lt!344994 e!431251)))

(declare-fun c!85849 () Bool)

(assert (=> d!102229 (= c!85849 (and ((_ is Intermediate!7873) lt!344995) (undefined!8685 lt!344995)))))

(assert (=> d!102229 (= lt!344995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102229 (validMask!0 mask!3328)))

(assert (=> d!102229 (= (seekEntryOrOpen!0 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344994)))

(declare-fun b!774662 () Bool)

(assert (=> b!774662 (= e!431249 (MissingZero!7873 (index!33862 lt!344995)))))

(declare-fun b!774663 () Bool)

(assert (=> b!774663 (= e!431251 e!431250)))

(assert (=> b!774663 (= lt!344993 (select (arr!20317 a!3186) (index!33862 lt!344995)))))

(declare-fun c!85850 () Bool)

(assert (=> b!774663 (= c!85850 (= lt!344993 (select (arr!20317 a!3186) j!159)))))

(assert (= (and d!102229 c!85849) b!774661))

(assert (= (and d!102229 (not c!85849)) b!774663))

(assert (= (and b!774663 c!85850) b!774659))

(assert (= (and b!774663 (not c!85850)) b!774658))

(assert (= (and b!774658 c!85848) b!774662))

(assert (= (and b!774658 (not c!85848)) b!774660))

(assert (=> b!774660 m!719525))

(declare-fun m!719691 () Bool)

(assert (=> b!774660 m!719691))

(assert (=> d!102229 m!719525))

(assert (=> d!102229 m!719547))

(declare-fun m!719693 () Bool)

(assert (=> d!102229 m!719693))

(assert (=> d!102229 m!719533))

(declare-fun m!719695 () Bool)

(assert (=> d!102229 m!719695))

(declare-fun m!719697 () Bool)

(assert (=> d!102229 m!719697))

(assert (=> d!102229 m!719547))

(assert (=> d!102229 m!719525))

(assert (=> d!102229 m!719549))

(declare-fun m!719699 () Bool)

(assert (=> b!774663 m!719699))

(assert (=> b!774467 d!102229))

(declare-fun d!102231 () Bool)

(assert (=> d!102231 (= (validKeyInArray!0 (select (arr!20317 a!3186) j!159)) (and (not (= (select (arr!20317 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20317 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!774477 d!102231))

(declare-fun d!102233 () Bool)

(declare-fun lt!344998 () (_ BitVec 32))

(assert (=> d!102233 (and (bvsge lt!344998 #b00000000000000000000000000000000) (bvslt lt!344998 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102233 (= lt!344998 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!102233 (validMask!0 mask!3328)))

(assert (=> d!102233 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344998)))

(declare-fun bs!21644 () Bool)

(assert (= bs!21644 d!102233))

(declare-fun m!719701 () Bool)

(assert (=> bs!21644 m!719701))

(assert (=> bs!21644 m!719533))

(assert (=> b!774466 d!102233))

(declare-fun b!774683 () Bool)

(declare-fun e!431263 () Bool)

(declare-fun e!431266 () Bool)

(assert (=> b!774683 (= e!431263 e!431266)))

(declare-fun res!523772 () Bool)

(declare-fun lt!345003 () SeekEntryResult!7873)

(assert (=> b!774683 (= res!523772 (and ((_ is Intermediate!7873) lt!345003) (not (undefined!8685 lt!345003)) (bvslt (x!64959 lt!345003) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345003) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345003) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774683 (=> (not res!523772) (not e!431266))))

(declare-fun b!774684 () Bool)

(declare-fun e!431262 () SeekEntryResult!7873)

(assert (=> b!774684 (= e!431262 (Intermediate!7873 false lt!344900 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774685 () Bool)

(declare-fun e!431264 () SeekEntryResult!7873)

(assert (=> b!774685 (= e!431264 e!431262)))

(declare-fun c!85859 () Bool)

(declare-fun lt!345004 () (_ BitVec 64))

(assert (=> b!774685 (= c!85859 (or (= lt!345004 (select (arr!20317 a!3186) j!159)) (= (bvadd lt!345004 lt!345004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774686 () Bool)

(assert (=> b!774686 (= e!431263 (bvsge (x!64959 lt!345003) #b01111111111111111111111111111110))))

(declare-fun b!774687 () Bool)

(assert (=> b!774687 (= e!431262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344900 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774688 () Bool)

(assert (=> b!774688 (= e!431264 (Intermediate!7873 true lt!344900 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774689 () Bool)

(assert (=> b!774689 (and (bvsge (index!33862 lt!345003) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345003) (size!20737 a!3186)))))

(declare-fun res!523771 () Bool)

(assert (=> b!774689 (= res!523771 (= (select (arr!20317 a!3186) (index!33862 lt!345003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431265 () Bool)

(assert (=> b!774689 (=> res!523771 e!431265)))

(declare-fun b!774690 () Bool)

(assert (=> b!774690 (and (bvsge (index!33862 lt!345003) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345003) (size!20737 a!3186)))))

(declare-fun res!523773 () Bool)

(assert (=> b!774690 (= res!523773 (= (select (arr!20317 a!3186) (index!33862 lt!345003)) (select (arr!20317 a!3186) j!159)))))

(assert (=> b!774690 (=> res!523773 e!431265)))

(assert (=> b!774690 (= e!431266 e!431265)))

(declare-fun b!774682 () Bool)

(assert (=> b!774682 (and (bvsge (index!33862 lt!345003) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345003) (size!20737 a!3186)))))

(assert (=> b!774682 (= e!431265 (= (select (arr!20317 a!3186) (index!33862 lt!345003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102235 () Bool)

(assert (=> d!102235 e!431263))

(declare-fun c!85857 () Bool)

(assert (=> d!102235 (= c!85857 (and ((_ is Intermediate!7873) lt!345003) (undefined!8685 lt!345003)))))

(assert (=> d!102235 (= lt!345003 e!431264)))

(declare-fun c!85858 () Bool)

(assert (=> d!102235 (= c!85858 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102235 (= lt!345004 (select (arr!20317 a!3186) lt!344900))))

(assert (=> d!102235 (validMask!0 mask!3328)))

(assert (=> d!102235 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!345003)))

(assert (= (and d!102235 c!85858) b!774688))

(assert (= (and d!102235 (not c!85858)) b!774685))

(assert (= (and b!774685 c!85859) b!774684))

(assert (= (and b!774685 (not c!85859)) b!774687))

(assert (= (and d!102235 c!85857) b!774686))

(assert (= (and d!102235 (not c!85857)) b!774683))

(assert (= (and b!774683 res!523772) b!774690))

(assert (= (and b!774690 (not res!523773)) b!774689))

(assert (= (and b!774689 (not res!523771)) b!774682))

(declare-fun m!719703 () Bool)

(assert (=> b!774682 m!719703))

(declare-fun m!719705 () Bool)

(assert (=> d!102235 m!719705))

(assert (=> d!102235 m!719533))

(assert (=> b!774689 m!719703))

(assert (=> b!774690 m!719703))

(declare-fun m!719707 () Bool)

(assert (=> b!774687 m!719707))

(assert (=> b!774687 m!719707))

(assert (=> b!774687 m!719525))

(declare-fun m!719709 () Bool)

(assert (=> b!774687 m!719709))

(assert (=> b!774460 d!102235))

(declare-fun b!774700 () Bool)

(declare-fun e!431274 () Bool)

(declare-fun e!431277 () Bool)

(assert (=> b!774700 (= e!431274 e!431277)))

(declare-fun res!523779 () Bool)

(declare-fun lt!345011 () SeekEntryResult!7873)

(assert (=> b!774700 (= res!523779 (and ((_ is Intermediate!7873) lt!345011) (not (undefined!8685 lt!345011)) (bvslt (x!64959 lt!345011) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345011) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345011) x!1131)))))

(assert (=> b!774700 (=> (not res!523779) (not e!431277))))

(declare-fun b!774701 () Bool)

(declare-fun e!431273 () SeekEntryResult!7873)

(assert (=> b!774701 (= e!431273 (Intermediate!7873 false index!1321 x!1131))))

(declare-fun b!774702 () Bool)

(declare-fun e!431275 () SeekEntryResult!7873)

(assert (=> b!774702 (= e!431275 e!431273)))

(declare-fun c!85864 () Bool)

(declare-fun lt!345012 () (_ BitVec 64))

(assert (=> b!774702 (= c!85864 (or (= lt!345012 lt!344895) (= (bvadd lt!345012 lt!345012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774703 () Bool)

(assert (=> b!774703 (= e!431274 (bvsge (x!64959 lt!345011) #b01111111111111111111111111111110))))

(declare-fun b!774704 () Bool)

(assert (=> b!774704 (= e!431273 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!344895 lt!344894 mask!3328))))

(declare-fun b!774705 () Bool)

(assert (=> b!774705 (= e!431275 (Intermediate!7873 true index!1321 x!1131))))

(declare-fun b!774706 () Bool)

(assert (=> b!774706 (and (bvsge (index!33862 lt!345011) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345011) (size!20737 lt!344894)))))

(declare-fun res!523778 () Bool)

(assert (=> b!774706 (= res!523778 (= (select (arr!20317 lt!344894) (index!33862 lt!345011)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431276 () Bool)

(assert (=> b!774706 (=> res!523778 e!431276)))

(declare-fun b!774707 () Bool)

(assert (=> b!774707 (and (bvsge (index!33862 lt!345011) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345011) (size!20737 lt!344894)))))

(declare-fun res!523780 () Bool)

(assert (=> b!774707 (= res!523780 (= (select (arr!20317 lt!344894) (index!33862 lt!345011)) lt!344895))))

(assert (=> b!774707 (=> res!523780 e!431276)))

(assert (=> b!774707 (= e!431277 e!431276)))

(declare-fun b!774699 () Bool)

(assert (=> b!774699 (and (bvsge (index!33862 lt!345011) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345011) (size!20737 lt!344894)))))

(assert (=> b!774699 (= e!431276 (= (select (arr!20317 lt!344894) (index!33862 lt!345011)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102239 () Bool)

(assert (=> d!102239 e!431274))

(declare-fun c!85862 () Bool)

(assert (=> d!102239 (= c!85862 (and ((_ is Intermediate!7873) lt!345011) (undefined!8685 lt!345011)))))

(assert (=> d!102239 (= lt!345011 e!431275)))

(declare-fun c!85863 () Bool)

(assert (=> d!102239 (= c!85863 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102239 (= lt!345012 (select (arr!20317 lt!344894) index!1321))))

(assert (=> d!102239 (validMask!0 mask!3328)))

(assert (=> d!102239 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344895 lt!344894 mask!3328) lt!345011)))

(assert (= (and d!102239 c!85863) b!774705))

(assert (= (and d!102239 (not c!85863)) b!774702))

(assert (= (and b!774702 c!85864) b!774701))

(assert (= (and b!774702 (not c!85864)) b!774704))

(assert (= (and d!102239 c!85862) b!774703))

(assert (= (and d!102239 (not c!85862)) b!774700))

(assert (= (and b!774700 res!523779) b!774707))

(assert (= (and b!774707 (not res!523780)) b!774706))

(assert (= (and b!774706 (not res!523778)) b!774699))

(declare-fun m!719711 () Bool)

(assert (=> b!774699 m!719711))

(declare-fun m!719713 () Bool)

(assert (=> d!102239 m!719713))

(assert (=> d!102239 m!719533))

(assert (=> b!774706 m!719711))

(assert (=> b!774707 m!719711))

(assert (=> b!774704 m!719681))

(assert (=> b!774704 m!719681))

(declare-fun m!719715 () Bool)

(assert (=> b!774704 m!719715))

(assert (=> b!774481 d!102239))

(declare-fun b!774709 () Bool)

(declare-fun e!431279 () Bool)

(declare-fun e!431282 () Bool)

(assert (=> b!774709 (= e!431279 e!431282)))

(declare-fun res!523782 () Bool)

(declare-fun lt!345013 () SeekEntryResult!7873)

(assert (=> b!774709 (= res!523782 (and ((_ is Intermediate!7873) lt!345013) (not (undefined!8685 lt!345013)) (bvslt (x!64959 lt!345013) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345013) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345013) #b00000000000000000000000000000000)))))

(assert (=> b!774709 (=> (not res!523782) (not e!431282))))

(declare-fun b!774710 () Bool)

(declare-fun e!431278 () SeekEntryResult!7873)

(assert (=> b!774710 (= e!431278 (Intermediate!7873 false (toIndex!0 lt!344895 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774711 () Bool)

(declare-fun e!431280 () SeekEntryResult!7873)

(assert (=> b!774711 (= e!431280 e!431278)))

(declare-fun c!85867 () Bool)

(declare-fun lt!345014 () (_ BitVec 64))

(assert (=> b!774711 (= c!85867 (or (= lt!345014 lt!344895) (= (bvadd lt!345014 lt!345014) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774712 () Bool)

(assert (=> b!774712 (= e!431279 (bvsge (x!64959 lt!345013) #b01111111111111111111111111111110))))

(declare-fun b!774713 () Bool)

(assert (=> b!774713 (= e!431278 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344895 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!344895 lt!344894 mask!3328))))

(declare-fun b!774714 () Bool)

(assert (=> b!774714 (= e!431280 (Intermediate!7873 true (toIndex!0 lt!344895 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774715 () Bool)

(assert (=> b!774715 (and (bvsge (index!33862 lt!345013) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345013) (size!20737 lt!344894)))))

(declare-fun res!523781 () Bool)

(assert (=> b!774715 (= res!523781 (= (select (arr!20317 lt!344894) (index!33862 lt!345013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431281 () Bool)

(assert (=> b!774715 (=> res!523781 e!431281)))

(declare-fun b!774716 () Bool)

(assert (=> b!774716 (and (bvsge (index!33862 lt!345013) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345013) (size!20737 lt!344894)))))

(declare-fun res!523783 () Bool)

(assert (=> b!774716 (= res!523783 (= (select (arr!20317 lt!344894) (index!33862 lt!345013)) lt!344895))))

(assert (=> b!774716 (=> res!523783 e!431281)))

(assert (=> b!774716 (= e!431282 e!431281)))

(declare-fun b!774708 () Bool)

(assert (=> b!774708 (and (bvsge (index!33862 lt!345013) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345013) (size!20737 lt!344894)))))

(assert (=> b!774708 (= e!431281 (= (select (arr!20317 lt!344894) (index!33862 lt!345013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102241 () Bool)

(assert (=> d!102241 e!431279))

(declare-fun c!85865 () Bool)

(assert (=> d!102241 (= c!85865 (and ((_ is Intermediate!7873) lt!345013) (undefined!8685 lt!345013)))))

(assert (=> d!102241 (= lt!345013 e!431280)))

(declare-fun c!85866 () Bool)

(assert (=> d!102241 (= c!85866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102241 (= lt!345014 (select (arr!20317 lt!344894) (toIndex!0 lt!344895 mask!3328)))))

(assert (=> d!102241 (validMask!0 mask!3328)))

(assert (=> d!102241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344895 mask!3328) lt!344895 lt!344894 mask!3328) lt!345013)))

(assert (= (and d!102241 c!85866) b!774714))

(assert (= (and d!102241 (not c!85866)) b!774711))

(assert (= (and b!774711 c!85867) b!774710))

(assert (= (and b!774711 (not c!85867)) b!774713))

(assert (= (and d!102241 c!85865) b!774712))

(assert (= (and d!102241 (not c!85865)) b!774709))

(assert (= (and b!774709 res!523782) b!774716))

(assert (= (and b!774716 (not res!523783)) b!774715))

(assert (= (and b!774715 (not res!523781)) b!774708))

(declare-fun m!719717 () Bool)

(assert (=> b!774708 m!719717))

(assert (=> d!102241 m!719565))

(declare-fun m!719719 () Bool)

(assert (=> d!102241 m!719719))

(assert (=> d!102241 m!719533))

(assert (=> b!774715 m!719717))

(assert (=> b!774716 m!719717))

(assert (=> b!774713 m!719565))

(declare-fun m!719721 () Bool)

(assert (=> b!774713 m!719721))

(assert (=> b!774713 m!719721))

(declare-fun m!719723 () Bool)

(assert (=> b!774713 m!719723))

(assert (=> b!774481 d!102241))

(declare-fun d!102243 () Bool)

(declare-fun lt!345023 () (_ BitVec 32))

(declare-fun lt!345022 () (_ BitVec 32))

(assert (=> d!102243 (= lt!345023 (bvmul (bvxor lt!345022 (bvlshr lt!345022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102243 (= lt!345022 ((_ extract 31 0) (bvand (bvxor lt!344895 (bvlshr lt!344895 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102243 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523786 (let ((h!15336 ((_ extract 31 0) (bvand (bvxor lt!344895 (bvlshr lt!344895 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64965 (bvmul (bvxor h!15336 (bvlshr h!15336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64965 (bvlshr x!64965 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523786 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523786 #b00000000000000000000000000000000))))))

(assert (=> d!102243 (= (toIndex!0 lt!344895 mask!3328) (bvand (bvxor lt!345023 (bvlshr lt!345023 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!774481 d!102243))

(declare-fun b!774722 () Bool)

(declare-fun e!431287 () Bool)

(declare-fun e!431290 () Bool)

(assert (=> b!774722 (= e!431287 e!431290)))

(declare-fun res!523788 () Bool)

(declare-fun lt!345026 () SeekEntryResult!7873)

(assert (=> b!774722 (= res!523788 (and ((_ is Intermediate!7873) lt!345026) (not (undefined!8685 lt!345026)) (bvslt (x!64959 lt!345026) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345026) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345026) #b00000000000000000000000000000000)))))

(assert (=> b!774722 (=> (not res!523788) (not e!431290))))

(declare-fun b!774723 () Bool)

(declare-fun e!431286 () SeekEntryResult!7873)

(assert (=> b!774723 (= e!431286 (Intermediate!7873 false (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774724 () Bool)

(declare-fun e!431288 () SeekEntryResult!7873)

(assert (=> b!774724 (= e!431288 e!431286)))

(declare-fun lt!345027 () (_ BitVec 64))

(declare-fun c!85871 () Bool)

(assert (=> b!774724 (= c!85871 (or (= lt!345027 (select (arr!20317 a!3186) j!159)) (= (bvadd lt!345027 lt!345027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774725 () Bool)

(assert (=> b!774725 (= e!431287 (bvsge (x!64959 lt!345026) #b01111111111111111111111111111110))))

(declare-fun b!774726 () Bool)

(assert (=> b!774726 (= e!431286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774727 () Bool)

(assert (=> b!774727 (= e!431288 (Intermediate!7873 true (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774728 () Bool)

(assert (=> b!774728 (and (bvsge (index!33862 lt!345026) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345026) (size!20737 a!3186)))))

(declare-fun res!523787 () Bool)

(assert (=> b!774728 (= res!523787 (= (select (arr!20317 a!3186) (index!33862 lt!345026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431289 () Bool)

(assert (=> b!774728 (=> res!523787 e!431289)))

(declare-fun b!774729 () Bool)

(assert (=> b!774729 (and (bvsge (index!33862 lt!345026) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345026) (size!20737 a!3186)))))

(declare-fun res!523789 () Bool)

(assert (=> b!774729 (= res!523789 (= (select (arr!20317 a!3186) (index!33862 lt!345026)) (select (arr!20317 a!3186) j!159)))))

(assert (=> b!774729 (=> res!523789 e!431289)))

(assert (=> b!774729 (= e!431290 e!431289)))

(declare-fun b!774721 () Bool)

(assert (=> b!774721 (and (bvsge (index!33862 lt!345026) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345026) (size!20737 a!3186)))))

(assert (=> b!774721 (= e!431289 (= (select (arr!20317 a!3186) (index!33862 lt!345026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102247 () Bool)

(assert (=> d!102247 e!431287))

(declare-fun c!85869 () Bool)

(assert (=> d!102247 (= c!85869 (and ((_ is Intermediate!7873) lt!345026) (undefined!8685 lt!345026)))))

(assert (=> d!102247 (= lt!345026 e!431288)))

(declare-fun c!85870 () Bool)

(assert (=> d!102247 (= c!85870 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102247 (= lt!345027 (select (arr!20317 a!3186) (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328)))))

(assert (=> d!102247 (validMask!0 mask!3328)))

(assert (=> d!102247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!345026)))

(assert (= (and d!102247 c!85870) b!774727))

(assert (= (and d!102247 (not c!85870)) b!774724))

(assert (= (and b!774724 c!85871) b!774723))

(assert (= (and b!774724 (not c!85871)) b!774726))

(assert (= (and d!102247 c!85869) b!774725))

(assert (= (and d!102247 (not c!85869)) b!774722))

(assert (= (and b!774722 res!523788) b!774729))

(assert (= (and b!774729 (not res!523789)) b!774728))

(assert (= (and b!774728 (not res!523787)) b!774721))

(declare-fun m!719733 () Bool)

(assert (=> b!774721 m!719733))

(assert (=> d!102247 m!719547))

(declare-fun m!719735 () Bool)

(assert (=> d!102247 m!719735))

(assert (=> d!102247 m!719533))

(assert (=> b!774728 m!719733))

(assert (=> b!774729 m!719733))

(assert (=> b!774726 m!719547))

(declare-fun m!719737 () Bool)

(assert (=> b!774726 m!719737))

(assert (=> b!774726 m!719737))

(assert (=> b!774726 m!719525))

(declare-fun m!719739 () Bool)

(assert (=> b!774726 m!719739))

(assert (=> b!774470 d!102247))

(declare-fun d!102251 () Bool)

(declare-fun lt!345030 () (_ BitVec 32))

(declare-fun lt!345029 () (_ BitVec 32))

(assert (=> d!102251 (= lt!345030 (bvmul (bvxor lt!345029 (bvlshr lt!345029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102251 (= lt!345029 ((_ extract 31 0) (bvand (bvxor (select (arr!20317 a!3186) j!159) (bvlshr (select (arr!20317 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102251 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523786 (let ((h!15336 ((_ extract 31 0) (bvand (bvxor (select (arr!20317 a!3186) j!159) (bvlshr (select (arr!20317 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64965 (bvmul (bvxor h!15336 (bvlshr h!15336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64965 (bvlshr x!64965 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523786 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523786 #b00000000000000000000000000000000))))))

(assert (=> d!102251 (= (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (bvand (bvxor lt!345030 (bvlshr lt!345030 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!774470 d!102251))

(declare-fun b!774740 () Bool)

(declare-fun e!431302 () Bool)

(declare-fun call!35184 () Bool)

(assert (=> b!774740 (= e!431302 call!35184)))

(declare-fun b!774741 () Bool)

(assert (=> b!774741 (= e!431302 call!35184)))

(declare-fun b!774742 () Bool)

(declare-fun e!431300 () Bool)

(declare-fun e!431299 () Bool)

(assert (=> b!774742 (= e!431300 e!431299)))

(declare-fun res!523798 () Bool)

(assert (=> b!774742 (=> (not res!523798) (not e!431299))))

(declare-fun e!431301 () Bool)

(assert (=> b!774742 (= res!523798 (not e!431301))))

(declare-fun res!523797 () Bool)

(assert (=> b!774742 (=> (not res!523797) (not e!431301))))

(assert (=> b!774742 (= res!523797 (validKeyInArray!0 (select (arr!20317 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102253 () Bool)

(declare-fun res!523796 () Bool)

(assert (=> d!102253 (=> res!523796 e!431300)))

(assert (=> d!102253 (= res!523796 (bvsge #b00000000000000000000000000000000 (size!20737 a!3186)))))

(assert (=> d!102253 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14223) e!431300)))

(declare-fun bm!35181 () Bool)

(declare-fun c!85874 () Bool)

(assert (=> bm!35181 (= call!35184 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85874 (Cons!14222 (select (arr!20317 a!3186) #b00000000000000000000000000000000) Nil!14223) Nil!14223)))))

(declare-fun b!774743 () Bool)

(declare-fun contains!4073 (List!14226 (_ BitVec 64)) Bool)

(assert (=> b!774743 (= e!431301 (contains!4073 Nil!14223 (select (arr!20317 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774744 () Bool)

(assert (=> b!774744 (= e!431299 e!431302)))

(assert (=> b!774744 (= c!85874 (validKeyInArray!0 (select (arr!20317 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102253 (not res!523796)) b!774742))

(assert (= (and b!774742 res!523797) b!774743))

(assert (= (and b!774742 res!523798) b!774744))

(assert (= (and b!774744 c!85874) b!774740))

(assert (= (and b!774744 (not c!85874)) b!774741))

(assert (= (or b!774740 b!774741) bm!35181))

(declare-fun m!719741 () Bool)

(assert (=> b!774742 m!719741))

(assert (=> b!774742 m!719741))

(declare-fun m!719743 () Bool)

(assert (=> b!774742 m!719743))

(assert (=> bm!35181 m!719741))

(declare-fun m!719745 () Bool)

(assert (=> bm!35181 m!719745))

(assert (=> b!774743 m!719741))

(assert (=> b!774743 m!719741))

(declare-fun m!719747 () Bool)

(assert (=> b!774743 m!719747))

(assert (=> b!774744 m!719741))

(assert (=> b!774744 m!719741))

(assert (=> b!774744 m!719743))

(assert (=> b!774479 d!102253))

(declare-fun b!774746 () Bool)

(declare-fun e!431304 () Bool)

(declare-fun e!431307 () Bool)

(assert (=> b!774746 (= e!431304 e!431307)))

(declare-fun res!523800 () Bool)

(declare-fun lt!345031 () SeekEntryResult!7873)

(assert (=> b!774746 (= res!523800 (and ((_ is Intermediate!7873) lt!345031) (not (undefined!8685 lt!345031)) (bvslt (x!64959 lt!345031) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345031) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345031) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774746 (=> (not res!523800) (not e!431307))))

(declare-fun b!774747 () Bool)

(declare-fun e!431303 () SeekEntryResult!7873)

(assert (=> b!774747 (= e!431303 (Intermediate!7873 false lt!344900 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774748 () Bool)

(declare-fun e!431305 () SeekEntryResult!7873)

(assert (=> b!774748 (= e!431305 e!431303)))

(declare-fun c!85877 () Bool)

(declare-fun lt!345032 () (_ BitVec 64))

(assert (=> b!774748 (= c!85877 (or (= lt!345032 lt!344895) (= (bvadd lt!345032 lt!345032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774749 () Bool)

(assert (=> b!774749 (= e!431304 (bvsge (x!64959 lt!345031) #b01111111111111111111111111111110))))

(declare-fun b!774750 () Bool)

(assert (=> b!774750 (= e!431303 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344900 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) lt!344895 lt!344894 mask!3328))))

(declare-fun b!774751 () Bool)

(assert (=> b!774751 (= e!431305 (Intermediate!7873 true lt!344900 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774752 () Bool)

(assert (=> b!774752 (and (bvsge (index!33862 lt!345031) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345031) (size!20737 lt!344894)))))

(declare-fun res!523799 () Bool)

(assert (=> b!774752 (= res!523799 (= (select (arr!20317 lt!344894) (index!33862 lt!345031)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431306 () Bool)

(assert (=> b!774752 (=> res!523799 e!431306)))

(declare-fun b!774753 () Bool)

(assert (=> b!774753 (and (bvsge (index!33862 lt!345031) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345031) (size!20737 lt!344894)))))

(declare-fun res!523801 () Bool)

(assert (=> b!774753 (= res!523801 (= (select (arr!20317 lt!344894) (index!33862 lt!345031)) lt!344895))))

(assert (=> b!774753 (=> res!523801 e!431306)))

(assert (=> b!774753 (= e!431307 e!431306)))

(declare-fun b!774745 () Bool)

(assert (=> b!774745 (and (bvsge (index!33862 lt!345031) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345031) (size!20737 lt!344894)))))

(assert (=> b!774745 (= e!431306 (= (select (arr!20317 lt!344894) (index!33862 lt!345031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102255 () Bool)

(assert (=> d!102255 e!431304))

(declare-fun c!85875 () Bool)

(assert (=> d!102255 (= c!85875 (and ((_ is Intermediate!7873) lt!345031) (undefined!8685 lt!345031)))))

(assert (=> d!102255 (= lt!345031 e!431305)))

(declare-fun c!85876 () Bool)

(assert (=> d!102255 (= c!85876 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102255 (= lt!345032 (select (arr!20317 lt!344894) lt!344900))))

(assert (=> d!102255 (validMask!0 mask!3328)))

(assert (=> d!102255 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 lt!344895 lt!344894 mask!3328) lt!345031)))

(assert (= (and d!102255 c!85876) b!774751))

(assert (= (and d!102255 (not c!85876)) b!774748))

(assert (= (and b!774748 c!85877) b!774747))

(assert (= (and b!774748 (not c!85877)) b!774750))

(assert (= (and d!102255 c!85875) b!774749))

(assert (= (and d!102255 (not c!85875)) b!774746))

(assert (= (and b!774746 res!523800) b!774753))

(assert (= (and b!774753 (not res!523801)) b!774752))

(assert (= (and b!774752 (not res!523799)) b!774745))

(declare-fun m!719749 () Bool)

(assert (=> b!774745 m!719749))

(declare-fun m!719751 () Bool)

(assert (=> d!102255 m!719751))

(assert (=> d!102255 m!719533))

(assert (=> b!774752 m!719749))

(assert (=> b!774753 m!719749))

(assert (=> b!774750 m!719707))

(assert (=> b!774750 m!719707))

(declare-fun m!719753 () Bool)

(assert (=> b!774750 m!719753))

(assert (=> b!774462 d!102255))

(declare-fun b!774786 () Bool)

(declare-fun e!431330 () Bool)

(declare-fun call!35187 () Bool)

(assert (=> b!774786 (= e!431330 call!35187)))

(declare-fun bm!35184 () Bool)

(assert (=> bm!35184 (= call!35187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774787 () Bool)

(declare-fun e!431329 () Bool)

(declare-fun e!431331 () Bool)

(assert (=> b!774787 (= e!431329 e!431331)))

(declare-fun c!85889 () Bool)

(assert (=> b!774787 (= c!85889 (validKeyInArray!0 (select (arr!20317 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102257 () Bool)

(declare-fun res!523813 () Bool)

(assert (=> d!102257 (=> res!523813 e!431329)))

(assert (=> d!102257 (= res!523813 (bvsge #b00000000000000000000000000000000 (size!20737 a!3186)))))

(assert (=> d!102257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!431329)))

(declare-fun b!774788 () Bool)

(assert (=> b!774788 (= e!431331 call!35187)))

(declare-fun b!774789 () Bool)

(assert (=> b!774789 (= e!431331 e!431330)))

(declare-fun lt!345046 () (_ BitVec 64))

(assert (=> b!774789 (= lt!345046 (select (arr!20317 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!345047 () Unit!26683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42448 (_ BitVec 64) (_ BitVec 32)) Unit!26683)

(assert (=> b!774789 (= lt!345047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!345046 #b00000000000000000000000000000000))))

(assert (=> b!774789 (arrayContainsKey!0 a!3186 lt!345046 #b00000000000000000000000000000000)))

(declare-fun lt!345045 () Unit!26683)

(assert (=> b!774789 (= lt!345045 lt!345047)))

(declare-fun res!523812 () Bool)

(assert (=> b!774789 (= res!523812 (= (seekEntryOrOpen!0 (select (arr!20317 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7873 #b00000000000000000000000000000000)))))

(assert (=> b!774789 (=> (not res!523812) (not e!431330))))

(assert (= (and d!102257 (not res!523813)) b!774787))

(assert (= (and b!774787 c!85889) b!774789))

(assert (= (and b!774787 (not c!85889)) b!774788))

(assert (= (and b!774789 res!523812) b!774786))

(assert (= (or b!774786 b!774788) bm!35184))

(declare-fun m!719767 () Bool)

(assert (=> bm!35184 m!719767))

(assert (=> b!774787 m!719741))

(assert (=> b!774787 m!719741))

(assert (=> b!774787 m!719743))

(assert (=> b!774789 m!719741))

(declare-fun m!719769 () Bool)

(assert (=> b!774789 m!719769))

(declare-fun m!719771 () Bool)

(assert (=> b!774789 m!719771))

(assert (=> b!774789 m!719741))

(declare-fun m!719773 () Bool)

(assert (=> b!774789 m!719773))

(assert (=> b!774483 d!102257))

(declare-fun d!102265 () Bool)

(declare-fun res!523818 () Bool)

(declare-fun e!431336 () Bool)

(assert (=> d!102265 (=> res!523818 e!431336)))

(assert (=> d!102265 (= res!523818 (= (select (arr!20317 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102265 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!431336)))

(declare-fun b!774794 () Bool)

(declare-fun e!431337 () Bool)

(assert (=> b!774794 (= e!431336 e!431337)))

(declare-fun res!523819 () Bool)

(assert (=> b!774794 (=> (not res!523819) (not e!431337))))

(assert (=> b!774794 (= res!523819 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20737 a!3186)))))

(declare-fun b!774795 () Bool)

(assert (=> b!774795 (= e!431337 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102265 (not res!523818)) b!774794))

(assert (= (and b!774794 res!523819) b!774795))

(assert (=> d!102265 m!719741))

(declare-fun m!719775 () Bool)

(assert (=> b!774795 m!719775))

(assert (=> b!774472 d!102265))

(assert (=> b!774461 d!102227))

(declare-fun b!774796 () Bool)

(declare-fun e!431339 () SeekEntryResult!7873)

(assert (=> b!774796 (= e!431339 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344900 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774797 () Bool)

(declare-fun e!431340 () SeekEntryResult!7873)

(assert (=> b!774797 (= e!431340 (Found!7873 lt!344900))))

(declare-fun b!774798 () Bool)

(declare-fun e!431338 () SeekEntryResult!7873)

(assert (=> b!774798 (= e!431338 Undefined!7873)))

(declare-fun b!774799 () Bool)

(assert (=> b!774799 (= e!431338 e!431340)))

(declare-fun c!85892 () Bool)

(declare-fun lt!345048 () (_ BitVec 64))

(assert (=> b!774799 (= c!85892 (= lt!345048 (select (arr!20317 a!3186) j!159)))))

(declare-fun lt!345049 () SeekEntryResult!7873)

(declare-fun d!102267 () Bool)

(assert (=> d!102267 (and (or ((_ is Undefined!7873) lt!345049) (not ((_ is Found!7873) lt!345049)) (and (bvsge (index!33861 lt!345049) #b00000000000000000000000000000000) (bvslt (index!33861 lt!345049) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345049) ((_ is Found!7873) lt!345049) (not ((_ is MissingVacant!7873) lt!345049)) (not (= (index!33863 lt!345049) resIntermediateIndex!5)) (and (bvsge (index!33863 lt!345049) #b00000000000000000000000000000000) (bvslt (index!33863 lt!345049) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345049) (ite ((_ is Found!7873) lt!345049) (= (select (arr!20317 a!3186) (index!33861 lt!345049)) (select (arr!20317 a!3186) j!159)) (and ((_ is MissingVacant!7873) lt!345049) (= (index!33863 lt!345049) resIntermediateIndex!5) (= (select (arr!20317 a!3186) (index!33863 lt!345049)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102267 (= lt!345049 e!431338)))

(declare-fun c!85890 () Bool)

(assert (=> d!102267 (= c!85890 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102267 (= lt!345048 (select (arr!20317 a!3186) lt!344900))))

(assert (=> d!102267 (validMask!0 mask!3328)))

(assert (=> d!102267 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344900 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!345049)))

(declare-fun b!774800 () Bool)

(assert (=> b!774800 (= e!431339 (MissingVacant!7873 resIntermediateIndex!5))))

(declare-fun b!774801 () Bool)

(declare-fun c!85891 () Bool)

(assert (=> b!774801 (= c!85891 (= lt!345048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774801 (= e!431340 e!431339)))

(assert (= (and d!102267 c!85890) b!774798))

(assert (= (and d!102267 (not c!85890)) b!774799))

(assert (= (and b!774799 c!85892) b!774797))

(assert (= (and b!774799 (not c!85892)) b!774801))

(assert (= (and b!774801 c!85891) b!774800))

(assert (= (and b!774801 (not c!85891)) b!774796))

(assert (=> b!774796 m!719707))

(assert (=> b!774796 m!719707))

(assert (=> b!774796 m!719525))

(declare-fun m!719777 () Bool)

(assert (=> b!774796 m!719777))

(declare-fun m!719779 () Bool)

(assert (=> d!102267 m!719779))

(declare-fun m!719781 () Bool)

(assert (=> d!102267 m!719781))

(assert (=> d!102267 m!719705))

(assert (=> d!102267 m!719533))

(assert (=> b!774461 d!102267))

(declare-fun d!102269 () Bool)

(assert (=> d!102269 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!774482 d!102269))

(assert (=> b!774471 d!102235))

(declare-fun b!774802 () Bool)

(declare-fun e!431342 () Bool)

(declare-fun call!35188 () Bool)

(assert (=> b!774802 (= e!431342 call!35188)))

(declare-fun bm!35185 () Bool)

(assert (=> bm!35185 (= call!35188 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774803 () Bool)

(declare-fun e!431341 () Bool)

(declare-fun e!431343 () Bool)

(assert (=> b!774803 (= e!431341 e!431343)))

(declare-fun c!85893 () Bool)

(assert (=> b!774803 (= c!85893 (validKeyInArray!0 (select (arr!20317 a!3186) j!159)))))

(declare-fun d!102271 () Bool)

(declare-fun res!523821 () Bool)

(assert (=> d!102271 (=> res!523821 e!431341)))

(assert (=> d!102271 (= res!523821 (bvsge j!159 (size!20737 a!3186)))))

(assert (=> d!102271 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!431341)))

(declare-fun b!774804 () Bool)

(assert (=> b!774804 (= e!431343 call!35188)))

(declare-fun b!774805 () Bool)

(assert (=> b!774805 (= e!431343 e!431342)))

(declare-fun lt!345051 () (_ BitVec 64))

(assert (=> b!774805 (= lt!345051 (select (arr!20317 a!3186) j!159))))

(declare-fun lt!345052 () Unit!26683)

(assert (=> b!774805 (= lt!345052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!345051 j!159))))

(assert (=> b!774805 (arrayContainsKey!0 a!3186 lt!345051 #b00000000000000000000000000000000)))

(declare-fun lt!345050 () Unit!26683)

(assert (=> b!774805 (= lt!345050 lt!345052)))

(declare-fun res!523820 () Bool)

(assert (=> b!774805 (= res!523820 (= (seekEntryOrOpen!0 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) (Found!7873 j!159)))))

(assert (=> b!774805 (=> (not res!523820) (not e!431342))))

(assert (= (and d!102271 (not res!523821)) b!774803))

(assert (= (and b!774803 c!85893) b!774805))

(assert (= (and b!774803 (not c!85893)) b!774804))

(assert (= (and b!774805 res!523820) b!774802))

(assert (= (or b!774802 b!774804) bm!35185))

(declare-fun m!719783 () Bool)

(assert (=> bm!35185 m!719783))

(assert (=> b!774803 m!719525))

(assert (=> b!774803 m!719525))

(assert (=> b!774803 m!719541))

(assert (=> b!774805 m!719525))

(declare-fun m!719785 () Bool)

(assert (=> b!774805 m!719785))

(declare-fun m!719787 () Bool)

(assert (=> b!774805 m!719787))

(assert (=> b!774805 m!719525))

(assert (=> b!774805 m!719543))

(assert (=> b!774476 d!102271))

(declare-fun d!102273 () Bool)

(assert (=> d!102273 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!345061 () Unit!26683)

(declare-fun choose!38 (array!42448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26683)

(assert (=> d!102273 (= lt!345061 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102273 (validMask!0 mask!3328)))

(assert (=> d!102273 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!345061)))

(declare-fun bs!21646 () Bool)

(assert (= bs!21646 d!102273))

(assert (=> bs!21646 m!719555))

(declare-fun m!719789 () Bool)

(assert (=> bs!21646 m!719789))

(assert (=> bs!21646 m!719533))

(assert (=> b!774476 d!102273))

(declare-fun b!774814 () Bool)

(declare-fun c!85896 () Bool)

(declare-fun lt!345062 () (_ BitVec 64))

(assert (=> b!774814 (= c!85896 (= lt!345062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431351 () SeekEntryResult!7873)

(declare-fun e!431350 () SeekEntryResult!7873)

(assert (=> b!774814 (= e!431351 e!431350)))

(declare-fun b!774815 () Bool)

(declare-fun lt!345064 () SeekEntryResult!7873)

(assert (=> b!774815 (= e!431351 (Found!7873 (index!33862 lt!345064)))))

(declare-fun b!774816 () Bool)

(assert (=> b!774816 (= e!431350 (seekKeyOrZeroReturnVacant!0 (x!64959 lt!345064) (index!33862 lt!345064) (index!33862 lt!345064) k0!2102 a!3186 mask!3328))))

(declare-fun b!774817 () Bool)

(declare-fun e!431352 () SeekEntryResult!7873)

(assert (=> b!774817 (= e!431352 Undefined!7873)))

(declare-fun d!102275 () Bool)

(declare-fun lt!345063 () SeekEntryResult!7873)

(assert (=> d!102275 (and (or ((_ is Undefined!7873) lt!345063) (not ((_ is Found!7873) lt!345063)) (and (bvsge (index!33861 lt!345063) #b00000000000000000000000000000000) (bvslt (index!33861 lt!345063) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345063) ((_ is Found!7873) lt!345063) (not ((_ is MissingZero!7873) lt!345063)) (and (bvsge (index!33860 lt!345063) #b00000000000000000000000000000000) (bvslt (index!33860 lt!345063) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345063) ((_ is Found!7873) lt!345063) ((_ is MissingZero!7873) lt!345063) (not ((_ is MissingVacant!7873) lt!345063)) (and (bvsge (index!33863 lt!345063) #b00000000000000000000000000000000) (bvslt (index!33863 lt!345063) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345063) (ite ((_ is Found!7873) lt!345063) (= (select (arr!20317 a!3186) (index!33861 lt!345063)) k0!2102) (ite ((_ is MissingZero!7873) lt!345063) (= (select (arr!20317 a!3186) (index!33860 lt!345063)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7873) lt!345063) (= (select (arr!20317 a!3186) (index!33863 lt!345063)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102275 (= lt!345063 e!431352)))

(declare-fun c!85897 () Bool)

(assert (=> d!102275 (= c!85897 (and ((_ is Intermediate!7873) lt!345064) (undefined!8685 lt!345064)))))

(assert (=> d!102275 (= lt!345064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102275 (validMask!0 mask!3328)))

(assert (=> d!102275 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!345063)))

(declare-fun b!774818 () Bool)

(assert (=> b!774818 (= e!431350 (MissingZero!7873 (index!33862 lt!345064)))))

(declare-fun b!774819 () Bool)

(assert (=> b!774819 (= e!431352 e!431351)))

(assert (=> b!774819 (= lt!345062 (select (arr!20317 a!3186) (index!33862 lt!345064)))))

(declare-fun c!85898 () Bool)

(assert (=> b!774819 (= c!85898 (= lt!345062 k0!2102))))

(assert (= (and d!102275 c!85897) b!774817))

(assert (= (and d!102275 (not c!85897)) b!774819))

(assert (= (and b!774819 c!85898) b!774815))

(assert (= (and b!774819 (not c!85898)) b!774814))

(assert (= (and b!774814 c!85896) b!774818))

(assert (= (and b!774814 (not c!85896)) b!774816))

(declare-fun m!719791 () Bool)

(assert (=> b!774816 m!719791))

(declare-fun m!719795 () Bool)

(assert (=> d!102275 m!719795))

(declare-fun m!719798 () Bool)

(assert (=> d!102275 m!719798))

(assert (=> d!102275 m!719533))

(declare-fun m!719801 () Bool)

(assert (=> d!102275 m!719801))

(declare-fun m!719805 () Bool)

(assert (=> d!102275 m!719805))

(assert (=> d!102275 m!719795))

(declare-fun m!719809 () Bool)

(assert (=> d!102275 m!719809))

(declare-fun m!719813 () Bool)

(assert (=> b!774819 m!719813))

(assert (=> b!774465 d!102275))

(assert (=> b!774464 d!102267))

(declare-fun d!102279 () Bool)

(assert (=> d!102279 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67144 d!102279))

(declare-fun d!102285 () Bool)

(assert (=> d!102285 (= (array_inv!16176 a!3186) (bvsge (size!20737 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67144 d!102285))

(declare-fun b!774843 () Bool)

(declare-fun e!431366 () Bool)

(declare-fun e!431369 () Bool)

(assert (=> b!774843 (= e!431366 e!431369)))

(declare-fun res!523829 () Bool)

(declare-fun lt!345080 () SeekEntryResult!7873)

(assert (=> b!774843 (= res!523829 (and ((_ is Intermediate!7873) lt!345080) (not (undefined!8685 lt!345080)) (bvslt (x!64959 lt!345080) #b01111111111111111111111111111110) (bvsge (x!64959 lt!345080) #b00000000000000000000000000000000) (bvsge (x!64959 lt!345080) x!1131)))))

(assert (=> b!774843 (=> (not res!523829) (not e!431369))))

(declare-fun b!774844 () Bool)

(declare-fun e!431365 () SeekEntryResult!7873)

(assert (=> b!774844 (= e!431365 (Intermediate!7873 false index!1321 x!1131))))

(declare-fun b!774845 () Bool)

(declare-fun e!431367 () SeekEntryResult!7873)

(assert (=> b!774845 (= e!431367 e!431365)))

(declare-fun lt!345081 () (_ BitVec 64))

(declare-fun c!85911 () Bool)

(assert (=> b!774845 (= c!85911 (or (= lt!345081 (select (arr!20317 a!3186) j!159)) (= (bvadd lt!345081 lt!345081) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774846 () Bool)

(assert (=> b!774846 (= e!431366 (bvsge (x!64959 lt!345080) #b01111111111111111111111111111110))))

(declare-fun b!774847 () Bool)

(assert (=> b!774847 (= e!431365 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774848 () Bool)

(assert (=> b!774848 (= e!431367 (Intermediate!7873 true index!1321 x!1131))))

(declare-fun b!774849 () Bool)

(assert (=> b!774849 (and (bvsge (index!33862 lt!345080) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345080) (size!20737 a!3186)))))

(declare-fun res!523828 () Bool)

(assert (=> b!774849 (= res!523828 (= (select (arr!20317 a!3186) (index!33862 lt!345080)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431368 () Bool)

(assert (=> b!774849 (=> res!523828 e!431368)))

(declare-fun b!774850 () Bool)

(assert (=> b!774850 (and (bvsge (index!33862 lt!345080) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345080) (size!20737 a!3186)))))

(declare-fun res!523830 () Bool)

(assert (=> b!774850 (= res!523830 (= (select (arr!20317 a!3186) (index!33862 lt!345080)) (select (arr!20317 a!3186) j!159)))))

(assert (=> b!774850 (=> res!523830 e!431368)))

(assert (=> b!774850 (= e!431369 e!431368)))

(declare-fun b!774842 () Bool)

(assert (=> b!774842 (and (bvsge (index!33862 lt!345080) #b00000000000000000000000000000000) (bvslt (index!33862 lt!345080) (size!20737 a!3186)))))

(assert (=> b!774842 (= e!431368 (= (select (arr!20317 a!3186) (index!33862 lt!345080)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102289 () Bool)

(assert (=> d!102289 e!431366))

(declare-fun c!85909 () Bool)

(assert (=> d!102289 (= c!85909 (and ((_ is Intermediate!7873) lt!345080) (undefined!8685 lt!345080)))))

(assert (=> d!102289 (= lt!345080 e!431367)))

(declare-fun c!85910 () Bool)

(assert (=> d!102289 (= c!85910 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102289 (= lt!345081 (select (arr!20317 a!3186) index!1321))))

(assert (=> d!102289 (validMask!0 mask!3328)))

(assert (=> d!102289 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!345080)))

(assert (= (and d!102289 c!85910) b!774848))

(assert (= (and d!102289 (not c!85910)) b!774845))

(assert (= (and b!774845 c!85911) b!774844))

(assert (= (and b!774845 (not c!85911)) b!774847))

(assert (= (and d!102289 c!85909) b!774846))

(assert (= (and d!102289 (not c!85909)) b!774843))

(assert (= (and b!774843 res!523829) b!774850))

(assert (= (and b!774850 (not res!523830)) b!774849))

(assert (= (and b!774849 (not res!523828)) b!774842))

(declare-fun m!719827 () Bool)

(assert (=> b!774842 m!719827))

(assert (=> d!102289 m!719689))

(assert (=> d!102289 m!719533))

(assert (=> b!774849 m!719827))

(assert (=> b!774850 m!719827))

(assert (=> b!774847 m!719681))

(assert (=> b!774847 m!719681))

(assert (=> b!774847 m!719525))

(declare-fun m!719829 () Bool)

(assert (=> b!774847 m!719829))

(assert (=> b!774474 d!102289))

(declare-fun e!431373 () SeekEntryResult!7873)

(declare-fun b!774853 () Bool)

(assert (=> b!774853 (= e!431373 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774854 () Bool)

(declare-fun e!431374 () SeekEntryResult!7873)

(assert (=> b!774854 (= e!431374 (Found!7873 resIntermediateIndex!5))))

(declare-fun b!774855 () Bool)

(declare-fun e!431372 () SeekEntryResult!7873)

(assert (=> b!774855 (= e!431372 Undefined!7873)))

(declare-fun b!774856 () Bool)

(assert (=> b!774856 (= e!431372 e!431374)))

(declare-fun lt!345082 () (_ BitVec 64))

(declare-fun c!85914 () Bool)

(assert (=> b!774856 (= c!85914 (= lt!345082 (select (arr!20317 a!3186) j!159)))))

(declare-fun d!102291 () Bool)

(declare-fun lt!345083 () SeekEntryResult!7873)

(assert (=> d!102291 (and (or ((_ is Undefined!7873) lt!345083) (not ((_ is Found!7873) lt!345083)) (and (bvsge (index!33861 lt!345083) #b00000000000000000000000000000000) (bvslt (index!33861 lt!345083) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345083) ((_ is Found!7873) lt!345083) (not ((_ is MissingVacant!7873) lt!345083)) (not (= (index!33863 lt!345083) resIntermediateIndex!5)) (and (bvsge (index!33863 lt!345083) #b00000000000000000000000000000000) (bvslt (index!33863 lt!345083) (size!20737 a!3186)))) (or ((_ is Undefined!7873) lt!345083) (ite ((_ is Found!7873) lt!345083) (= (select (arr!20317 a!3186) (index!33861 lt!345083)) (select (arr!20317 a!3186) j!159)) (and ((_ is MissingVacant!7873) lt!345083) (= (index!33863 lt!345083) resIntermediateIndex!5) (= (select (arr!20317 a!3186) (index!33863 lt!345083)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102291 (= lt!345083 e!431372)))

(declare-fun c!85912 () Bool)

(assert (=> d!102291 (= c!85912 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102291 (= lt!345082 (select (arr!20317 a!3186) resIntermediateIndex!5))))

(assert (=> d!102291 (validMask!0 mask!3328)))

(assert (=> d!102291 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!345083)))

(declare-fun b!774857 () Bool)

(assert (=> b!774857 (= e!431373 (MissingVacant!7873 resIntermediateIndex!5))))

(declare-fun b!774858 () Bool)

(declare-fun c!85913 () Bool)

(assert (=> b!774858 (= c!85913 (= lt!345082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774858 (= e!431374 e!431373)))

(assert (= (and d!102291 c!85912) b!774855))

(assert (= (and d!102291 (not c!85912)) b!774856))

(assert (= (and b!774856 c!85914) b!774854))

(assert (= (and b!774856 (not c!85914)) b!774858))

(assert (= (and b!774858 c!85913) b!774857))

(assert (= (and b!774858 (not c!85913)) b!774853))

(declare-fun m!719831 () Bool)

(assert (=> b!774853 m!719831))

(assert (=> b!774853 m!719831))

(assert (=> b!774853 m!719525))

(declare-fun m!719833 () Bool)

(assert (=> b!774853 m!719833))

(declare-fun m!719835 () Bool)

(assert (=> d!102291 m!719835))

(declare-fun m!719837 () Bool)

(assert (=> d!102291 m!719837))

(assert (=> d!102291 m!719545))

(assert (=> d!102291 m!719533))

(assert (=> b!774463 d!102291))

(check-sat (not b!774743) (not b!774803) (not b!774742) (not d!102289) (not b!774805) (not b!774640) (not b!774660) (not b!774796) (not b!774789) (not b!774750) (not d!102291) (not b!774726) (not b!774687) (not d!102239) (not bm!35181) (not d!102235) (not b!774853) (not d!102275) (not b!774847) (not d!102227) (not bm!35185) (not d!102247) (not b!774795) (not b!774744) (not bm!35184) (not d!102233) (not d!102255) (not b!774787) (not b!774816) (not d!102229) (not b!774713) (not d!102267) (not d!102241) (not d!102273) (not b!774704))
(check-sat)
