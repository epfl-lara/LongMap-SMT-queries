; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64578 () Bool)

(assert start!64578)

(declare-fun b!726570 () Bool)

(declare-fun res!487434 () Bool)

(declare-fun e!406861 () Bool)

(assert (=> b!726570 (=> (not res!487434) (not e!406861))))

(declare-fun e!406866 () Bool)

(assert (=> b!726570 (= res!487434 e!406866)))

(declare-fun c!79946 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726570 (= c!79946 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726571 () Bool)

(declare-fun res!487439 () Bool)

(declare-fun e!406864 () Bool)

(assert (=> b!726571 (=> (not res!487439) (not e!406864))))

(declare-datatypes ((array!41029 0))(
  ( (array!41030 (arr!19633 (Array (_ BitVec 32) (_ BitVec 64))) (size!20053 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41029)

(declare-datatypes ((List!13542 0))(
  ( (Nil!13539) (Cons!13538 (h!14598 (_ BitVec 64)) (t!19849 List!13542)) )
))
(declare-fun arrayNoDuplicates!0 (array!41029 (_ BitVec 32) List!13542) Bool)

(assert (=> b!726571 (= res!487439 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13539))))

(declare-fun b!726572 () Bool)

(declare-fun res!487436 () Bool)

(assert (=> b!726572 (=> (not res!487436) (not e!406864))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!726572 (= res!487436 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20053 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20053 a!3186))))))

(declare-fun res!487440 () Bool)

(declare-fun e!406863 () Bool)

(assert (=> start!64578 (=> (not res!487440) (not e!406863))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64578 (= res!487440 (validMask!0 mask!3328))))

(assert (=> start!64578 e!406863))

(assert (=> start!64578 true))

(declare-fun array_inv!15492 (array!41029) Bool)

(assert (=> start!64578 (array_inv!15492 a!3186)))

(declare-fun b!726573 () Bool)

(declare-fun res!487441 () Bool)

(assert (=> b!726573 (=> (not res!487441) (not e!406863))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726573 (= res!487441 (validKeyInArray!0 (select (arr!19633 a!3186) j!159)))))

(declare-fun b!726574 () Bool)

(declare-fun e!406865 () Bool)

(assert (=> b!726574 (= e!406861 e!406865)))

(declare-fun res!487427 () Bool)

(assert (=> b!726574 (=> (not res!487427) (not e!406865))))

(declare-datatypes ((SeekEntryResult!7189 0))(
  ( (MissingZero!7189 (index!31124 (_ BitVec 32))) (Found!7189 (index!31125 (_ BitVec 32))) (Intermediate!7189 (undefined!8001 Bool) (index!31126 (_ BitVec 32)) (x!62266 (_ BitVec 32))) (Undefined!7189) (MissingVacant!7189 (index!31127 (_ BitVec 32))) )
))
(declare-fun lt!321763 () SeekEntryResult!7189)

(declare-fun lt!321762 () SeekEntryResult!7189)

(assert (=> b!726574 (= res!487427 (= lt!321763 lt!321762))))

(declare-fun lt!321759 () array!41029)

(declare-fun lt!321758 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41029 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!726574 (= lt!321762 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321758 lt!321759 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726574 (= lt!321763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321758 mask!3328) lt!321758 lt!321759 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726574 (= lt!321758 (select (store (arr!19633 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726574 (= lt!321759 (array!41030 (store (arr!19633 a!3186) i!1173 k0!2102) (size!20053 a!3186)))))

(declare-fun b!726575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41029 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!726575 (= e!406866 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) (Found!7189 j!159)))))

(declare-fun b!726576 () Bool)

(assert (=> b!726576 (= e!406864 e!406861)))

(declare-fun res!487431 () Bool)

(assert (=> b!726576 (=> (not res!487431) (not e!406861))))

(declare-fun lt!321764 () SeekEntryResult!7189)

(assert (=> b!726576 (= res!487431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19633 a!3186) j!159) mask!3328) (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321764))))

(assert (=> b!726576 (= lt!321764 (Intermediate!7189 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726577 () Bool)

(declare-fun res!487438 () Bool)

(assert (=> b!726577 (=> (not res!487438) (not e!406863))))

(assert (=> b!726577 (= res!487438 (and (= (size!20053 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20053 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20053 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726578 () Bool)

(declare-fun res!487435 () Bool)

(assert (=> b!726578 (=> (not res!487435) (not e!406863))))

(declare-fun arrayContainsKey!0 (array!41029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726578 (= res!487435 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726579 () Bool)

(assert (=> b!726579 (= e!406863 e!406864)))

(declare-fun res!487432 () Bool)

(assert (=> b!726579 (=> (not res!487432) (not e!406864))))

(declare-fun lt!321760 () SeekEntryResult!7189)

(assert (=> b!726579 (= res!487432 (or (= lt!321760 (MissingZero!7189 i!1173)) (= lt!321760 (MissingVacant!7189 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41029 (_ BitVec 32)) SeekEntryResult!7189)

(assert (=> b!726579 (= lt!321760 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726580 () Bool)

(declare-fun e!406860 () Bool)

(declare-fun e!406862 () Bool)

(assert (=> b!726580 (= e!406860 e!406862)))

(declare-fun res!487429 () Bool)

(assert (=> b!726580 (=> (not res!487429) (not e!406862))))

(declare-fun lt!321761 () SeekEntryResult!7189)

(assert (=> b!726580 (= res!487429 (= (seekEntryOrOpen!0 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321761))))

(assert (=> b!726580 (= lt!321761 (Found!7189 j!159))))

(declare-fun b!726581 () Bool)

(declare-fun res!487433 () Bool)

(assert (=> b!726581 (=> (not res!487433) (not e!406864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41029 (_ BitVec 32)) Bool)

(assert (=> b!726581 (= res!487433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726582 () Bool)

(assert (=> b!726582 (= e!406862 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321761))))

(declare-fun b!726583 () Bool)

(assert (=> b!726583 (= e!406866 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321764))))

(declare-fun b!726584 () Bool)

(get-info :version)

(assert (=> b!726584 (= e!406865 (not (or (not ((_ is Intermediate!7189) lt!321762)) (bvsge x!1131 (x!62266 lt!321762)) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!726584 e!406860))

(declare-fun res!487428 () Bool)

(assert (=> b!726584 (=> (not res!487428) (not e!406860))))

(assert (=> b!726584 (= res!487428 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24775 0))(
  ( (Unit!24776) )
))
(declare-fun lt!321765 () Unit!24775)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24775)

(assert (=> b!726584 (= lt!321765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726585 () Bool)

(declare-fun res!487430 () Bool)

(assert (=> b!726585 (=> (not res!487430) (not e!406861))))

(assert (=> b!726585 (= res!487430 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19633 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726586 () Bool)

(declare-fun res!487437 () Bool)

(assert (=> b!726586 (=> (not res!487437) (not e!406863))))

(assert (=> b!726586 (= res!487437 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64578 res!487440) b!726577))

(assert (= (and b!726577 res!487438) b!726573))

(assert (= (and b!726573 res!487441) b!726586))

(assert (= (and b!726586 res!487437) b!726578))

(assert (= (and b!726578 res!487435) b!726579))

(assert (= (and b!726579 res!487432) b!726581))

(assert (= (and b!726581 res!487433) b!726571))

(assert (= (and b!726571 res!487439) b!726572))

(assert (= (and b!726572 res!487436) b!726576))

(assert (= (and b!726576 res!487431) b!726585))

(assert (= (and b!726585 res!487430) b!726570))

(assert (= (and b!726570 c!79946) b!726583))

(assert (= (and b!726570 (not c!79946)) b!726575))

(assert (= (and b!726570 res!487434) b!726574))

(assert (= (and b!726574 res!487427) b!726584))

(assert (= (and b!726584 res!487428) b!726580))

(assert (= (and b!726580 res!487429) b!726582))

(declare-fun m!681171 () Bool)

(assert (=> b!726576 m!681171))

(assert (=> b!726576 m!681171))

(declare-fun m!681173 () Bool)

(assert (=> b!726576 m!681173))

(assert (=> b!726576 m!681173))

(assert (=> b!726576 m!681171))

(declare-fun m!681175 () Bool)

(assert (=> b!726576 m!681175))

(declare-fun m!681177 () Bool)

(assert (=> start!64578 m!681177))

(declare-fun m!681179 () Bool)

(assert (=> start!64578 m!681179))

(assert (=> b!726580 m!681171))

(assert (=> b!726580 m!681171))

(declare-fun m!681181 () Bool)

(assert (=> b!726580 m!681181))

(declare-fun m!681183 () Bool)

(assert (=> b!726571 m!681183))

(assert (=> b!726573 m!681171))

(assert (=> b!726573 m!681171))

(declare-fun m!681185 () Bool)

(assert (=> b!726573 m!681185))

(declare-fun m!681187 () Bool)

(assert (=> b!726585 m!681187))

(declare-fun m!681189 () Bool)

(assert (=> b!726578 m!681189))

(declare-fun m!681191 () Bool)

(assert (=> b!726586 m!681191))

(assert (=> b!726575 m!681171))

(assert (=> b!726575 m!681171))

(declare-fun m!681193 () Bool)

(assert (=> b!726575 m!681193))

(declare-fun m!681195 () Bool)

(assert (=> b!726584 m!681195))

(declare-fun m!681197 () Bool)

(assert (=> b!726584 m!681197))

(assert (=> b!726582 m!681171))

(assert (=> b!726582 m!681171))

(declare-fun m!681199 () Bool)

(assert (=> b!726582 m!681199))

(declare-fun m!681201 () Bool)

(assert (=> b!726579 m!681201))

(assert (=> b!726583 m!681171))

(assert (=> b!726583 m!681171))

(declare-fun m!681203 () Bool)

(assert (=> b!726583 m!681203))

(declare-fun m!681205 () Bool)

(assert (=> b!726581 m!681205))

(declare-fun m!681207 () Bool)

(assert (=> b!726574 m!681207))

(declare-fun m!681209 () Bool)

(assert (=> b!726574 m!681209))

(declare-fun m!681211 () Bool)

(assert (=> b!726574 m!681211))

(declare-fun m!681213 () Bool)

(assert (=> b!726574 m!681213))

(declare-fun m!681215 () Bool)

(assert (=> b!726574 m!681215))

(assert (=> b!726574 m!681211))

(check-sat (not b!726575) (not b!726574) (not b!726576) (not b!726586) (not b!726579) (not b!726584) (not start!64578) (not b!726581) (not b!726573) (not b!726583) (not b!726571) (not b!726580) (not b!726582) (not b!726578))
(check-sat)
