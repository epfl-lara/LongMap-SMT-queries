; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65600 () Bool)

(assert start!65600)

(declare-fun b!750177 () Bool)

(declare-fun res!506296 () Bool)

(declare-fun e!418560 () Bool)

(assert (=> b!750177 (=> (not res!506296) (not e!418560))))

(declare-datatypes ((array!41773 0))(
  ( (array!41774 (arr!20000 (Array (_ BitVec 32) (_ BitVec 64))) (size!20421 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41773)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750177 (= res!506296 (validKeyInArray!0 (select (arr!20000 a!3186) j!159)))))

(declare-fun b!750178 () Bool)

(declare-fun res!506295 () Bool)

(declare-fun e!418563 () Bool)

(assert (=> b!750178 (=> (not res!506295) (not e!418563))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750178 (= res!506295 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20000 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750180 () Bool)

(declare-fun e!418565 () Bool)

(assert (=> b!750180 (= e!418563 e!418565)))

(declare-fun res!506283 () Bool)

(assert (=> b!750180 (=> (not res!506283) (not e!418565))))

(declare-datatypes ((SeekEntryResult!7600 0))(
  ( (MissingZero!7600 (index!32768 (_ BitVec 32))) (Found!7600 (index!32769 (_ BitVec 32))) (Intermediate!7600 (undefined!8412 Bool) (index!32770 (_ BitVec 32)) (x!63694 (_ BitVec 32))) (Undefined!7600) (MissingVacant!7600 (index!32771 (_ BitVec 32))) )
))
(declare-fun lt!333557 () SeekEntryResult!7600)

(declare-fun lt!333554 () SeekEntryResult!7600)

(assert (=> b!750180 (= res!506283 (= lt!333557 lt!333554))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333551 () array!41773)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!333552 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!750180 (= lt!333554 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333552 lt!333551 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750180 (= lt!333557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333552 mask!3328) lt!333552 lt!333551 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!750180 (= lt!333552 (select (store (arr!20000 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750180 (= lt!333551 (array!41774 (store (arr!20000 a!3186) i!1173 k!2102) (size!20421 a!3186)))))

(declare-fun b!750181 () Bool)

(declare-fun res!506284 () Bool)

(assert (=> b!750181 (=> (not res!506284) (not e!418560))))

(assert (=> b!750181 (= res!506284 (and (= (size!20421 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20421 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20421 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750182 () Bool)

(declare-fun res!506285 () Bool)

(declare-fun e!418566 () Bool)

(assert (=> b!750182 (=> (not res!506285) (not e!418566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41773 (_ BitVec 32)) Bool)

(assert (=> b!750182 (= res!506285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750183 () Bool)

(declare-fun res!506282 () Bool)

(assert (=> b!750183 (=> (not res!506282) (not e!418566))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750183 (= res!506282 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20421 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20421 a!3186))))))

(declare-fun b!750184 () Bool)

(assert (=> b!750184 (= e!418566 e!418563)))

(declare-fun res!506291 () Bool)

(assert (=> b!750184 (=> (not res!506291) (not e!418563))))

(declare-fun lt!333558 () SeekEntryResult!7600)

(assert (=> b!750184 (= res!506291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20000 a!3186) j!159) mask!3328) (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333558))))

(assert (=> b!750184 (= lt!333558 (Intermediate!7600 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750185 () Bool)

(declare-fun e!418564 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7600)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41773 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!750185 (= e!418564 (= (seekEntryOrOpen!0 lt!333552 lt!333551 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333552 lt!333551 mask!3328)))))

(declare-fun b!750186 () Bool)

(declare-fun e!418558 () Bool)

(assert (=> b!750186 (= e!418565 (not e!418558))))

(declare-fun res!506286 () Bool)

(assert (=> b!750186 (=> res!506286 e!418558)))

(assert (=> b!750186 (= res!506286 (or (not (is-Intermediate!7600 lt!333554)) (bvslt x!1131 (x!63694 lt!333554)) (not (= x!1131 (x!63694 lt!333554))) (not (= index!1321 (index!32770 lt!333554)))))))

(declare-fun e!418568 () Bool)

(assert (=> b!750186 e!418568))

(declare-fun res!506280 () Bool)

(assert (=> b!750186 (=> (not res!506280) (not e!418568))))

(declare-fun lt!333560 () SeekEntryResult!7600)

(declare-fun lt!333556 () SeekEntryResult!7600)

(assert (=> b!750186 (= res!506280 (= lt!333560 lt!333556))))

(assert (=> b!750186 (= lt!333556 (Found!7600 j!159))))

(assert (=> b!750186 (= lt!333560 (seekEntryOrOpen!0 (select (arr!20000 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750186 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25780 0))(
  ( (Unit!25781) )
))
(declare-fun lt!333550 () Unit!25780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25780)

(assert (=> b!750186 (= lt!333550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750187 () Bool)

(declare-fun e!418562 () Unit!25780)

(declare-fun Unit!25782 () Unit!25780)

(assert (=> b!750187 (= e!418562 Unit!25782)))

(assert (=> b!750187 false))

(declare-fun e!418561 () Bool)

(declare-fun b!750188 () Bool)

(assert (=> b!750188 (= e!418561 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333558))))

(declare-fun b!750179 () Bool)

(declare-fun res!506281 () Bool)

(assert (=> b!750179 (=> (not res!506281) (not e!418563))))

(assert (=> b!750179 (= res!506281 e!418561)))

(declare-fun c!82330 () Bool)

(assert (=> b!750179 (= c!82330 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!506293 () Bool)

(assert (=> start!65600 (=> (not res!506293) (not e!418560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65600 (= res!506293 (validMask!0 mask!3328))))

(assert (=> start!65600 e!418560))

(assert (=> start!65600 true))

(declare-fun array_inv!15796 (array!41773) Bool)

(assert (=> start!65600 (array_inv!15796 a!3186)))

(declare-fun b!750189 () Bool)

(declare-fun e!418559 () Bool)

(assert (=> b!750189 (= e!418559 true)))

(assert (=> b!750189 e!418564))

(declare-fun res!506288 () Bool)

(assert (=> b!750189 (=> (not res!506288) (not e!418564))))

(declare-fun lt!333553 () (_ BitVec 64))

(assert (=> b!750189 (= res!506288 (= lt!333553 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333555 () Unit!25780)

(assert (=> b!750189 (= lt!333555 e!418562)))

(declare-fun c!82329 () Bool)

(assert (=> b!750189 (= c!82329 (= lt!333553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750190 () Bool)

(assert (=> b!750190 (= e!418560 e!418566)))

(declare-fun res!506287 () Bool)

(assert (=> b!750190 (=> (not res!506287) (not e!418566))))

(declare-fun lt!333559 () SeekEntryResult!7600)

(assert (=> b!750190 (= res!506287 (or (= lt!333559 (MissingZero!7600 i!1173)) (= lt!333559 (MissingVacant!7600 i!1173))))))

(assert (=> b!750190 (= lt!333559 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750191 () Bool)

(declare-fun res!506294 () Bool)

(assert (=> b!750191 (=> (not res!506294) (not e!418560))))

(declare-fun arrayContainsKey!0 (array!41773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750191 (= res!506294 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750192 () Bool)

(assert (=> b!750192 (= e!418561 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) (Found!7600 j!159)))))

(declare-fun b!750193 () Bool)

(declare-fun res!506292 () Bool)

(assert (=> b!750193 (=> (not res!506292) (not e!418566))))

(declare-datatypes ((List!14002 0))(
  ( (Nil!13999) (Cons!13998 (h!15070 (_ BitVec 64)) (t!20317 List!14002)) )
))
(declare-fun arrayNoDuplicates!0 (array!41773 (_ BitVec 32) List!14002) Bool)

(assert (=> b!750193 (= res!506292 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13999))))

(declare-fun b!750194 () Bool)

(assert (=> b!750194 (= e!418558 e!418559)))

(declare-fun res!506289 () Bool)

(assert (=> b!750194 (=> res!506289 e!418559)))

(assert (=> b!750194 (= res!506289 (= lt!333553 lt!333552))))

(assert (=> b!750194 (= lt!333553 (select (store (arr!20000 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750195 () Bool)

(assert (=> b!750195 (= e!418568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333556))))

(declare-fun b!750196 () Bool)

(declare-fun res!506297 () Bool)

(assert (=> b!750196 (=> (not res!506297) (not e!418560))))

(assert (=> b!750196 (= res!506297 (validKeyInArray!0 k!2102))))

(declare-fun b!750197 () Bool)

(declare-fun Unit!25783 () Unit!25780)

(assert (=> b!750197 (= e!418562 Unit!25783)))

(declare-fun b!750198 () Bool)

(declare-fun res!506290 () Bool)

(assert (=> b!750198 (=> res!506290 e!418558)))

(assert (=> b!750198 (= res!506290 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333556)))))

(assert (= (and start!65600 res!506293) b!750181))

(assert (= (and b!750181 res!506284) b!750177))

(assert (= (and b!750177 res!506296) b!750196))

(assert (= (and b!750196 res!506297) b!750191))

(assert (= (and b!750191 res!506294) b!750190))

(assert (= (and b!750190 res!506287) b!750182))

(assert (= (and b!750182 res!506285) b!750193))

(assert (= (and b!750193 res!506292) b!750183))

(assert (= (and b!750183 res!506282) b!750184))

(assert (= (and b!750184 res!506291) b!750178))

(assert (= (and b!750178 res!506295) b!750179))

(assert (= (and b!750179 c!82330) b!750188))

(assert (= (and b!750179 (not c!82330)) b!750192))

(assert (= (and b!750179 res!506281) b!750180))

(assert (= (and b!750180 res!506283) b!750186))

(assert (= (and b!750186 res!506280) b!750195))

(assert (= (and b!750186 (not res!506286)) b!750198))

(assert (= (and b!750198 (not res!506290)) b!750194))

(assert (= (and b!750194 (not res!506289)) b!750189))

(assert (= (and b!750189 c!82329) b!750187))

(assert (= (and b!750189 (not c!82329)) b!750197))

(assert (= (and b!750189 res!506288) b!750185))

(declare-fun m!699627 () Bool)

(assert (=> b!750184 m!699627))

(assert (=> b!750184 m!699627))

(declare-fun m!699629 () Bool)

(assert (=> b!750184 m!699629))

(assert (=> b!750184 m!699629))

(assert (=> b!750184 m!699627))

(declare-fun m!699631 () Bool)

(assert (=> b!750184 m!699631))

(assert (=> b!750198 m!699627))

(assert (=> b!750198 m!699627))

(declare-fun m!699633 () Bool)

(assert (=> b!750198 m!699633))

(declare-fun m!699635 () Bool)

(assert (=> b!750178 m!699635))

(declare-fun m!699637 () Bool)

(assert (=> b!750190 m!699637))

(declare-fun m!699639 () Bool)

(assert (=> b!750191 m!699639))

(declare-fun m!699641 () Bool)

(assert (=> b!750193 m!699641))

(declare-fun m!699643 () Bool)

(assert (=> b!750185 m!699643))

(declare-fun m!699645 () Bool)

(assert (=> b!750185 m!699645))

(assert (=> b!750188 m!699627))

(assert (=> b!750188 m!699627))

(declare-fun m!699647 () Bool)

(assert (=> b!750188 m!699647))

(assert (=> b!750186 m!699627))

(assert (=> b!750186 m!699627))

(declare-fun m!699649 () Bool)

(assert (=> b!750186 m!699649))

(declare-fun m!699651 () Bool)

(assert (=> b!750186 m!699651))

(declare-fun m!699653 () Bool)

(assert (=> b!750186 m!699653))

(declare-fun m!699655 () Bool)

(assert (=> b!750196 m!699655))

(declare-fun m!699657 () Bool)

(assert (=> start!65600 m!699657))

(declare-fun m!699659 () Bool)

(assert (=> start!65600 m!699659))

(assert (=> b!750195 m!699627))

(assert (=> b!750195 m!699627))

(declare-fun m!699661 () Bool)

(assert (=> b!750195 m!699661))

(declare-fun m!699663 () Bool)

(assert (=> b!750180 m!699663))

(declare-fun m!699665 () Bool)

(assert (=> b!750180 m!699665))

(declare-fun m!699667 () Bool)

(assert (=> b!750180 m!699667))

(declare-fun m!699669 () Bool)

(assert (=> b!750180 m!699669))

(assert (=> b!750180 m!699663))

(declare-fun m!699671 () Bool)

(assert (=> b!750180 m!699671))

(assert (=> b!750194 m!699667))

(declare-fun m!699673 () Bool)

(assert (=> b!750194 m!699673))

(assert (=> b!750192 m!699627))

(assert (=> b!750192 m!699627))

(assert (=> b!750192 m!699633))

(declare-fun m!699675 () Bool)

(assert (=> b!750182 m!699675))

(assert (=> b!750177 m!699627))

(assert (=> b!750177 m!699627))

(declare-fun m!699677 () Bool)

(assert (=> b!750177 m!699677))

(push 1)

