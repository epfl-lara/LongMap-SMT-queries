; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64712 () Bool)

(assert start!64712)

(declare-fun b!729982 () Bool)

(declare-fun e!408539 () Bool)

(declare-fun e!408536 () Bool)

(assert (=> b!729982 (= e!408539 e!408536)))

(declare-fun res!490327 () Bool)

(assert (=> b!729982 (=> (not res!490327) (not e!408536))))

(declare-datatypes ((SeekEntryResult!7300 0))(
  ( (MissingZero!7300 (index!31568 (_ BitVec 32))) (Found!7300 (index!31569 (_ BitVec 32))) (Intermediate!7300 (undefined!8112 Bool) (index!31570 (_ BitVec 32)) (x!62546 (_ BitVec 32))) (Undefined!7300) (MissingVacant!7300 (index!31571 (_ BitVec 32))) )
))
(declare-fun lt!323436 () SeekEntryResult!7300)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729982 (= res!490327 (or (= lt!323436 (MissingZero!7300 i!1173)) (= lt!323436 (MissingVacant!7300 i!1173))))))

(declare-datatypes ((array!41161 0))(
  ( (array!41162 (arr!19700 (Array (_ BitVec 32) (_ BitVec 64))) (size!20121 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41161)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729982 (= lt!323436 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729983 () Bool)

(declare-fun e!408542 () Bool)

(declare-fun e!408534 () Bool)

(assert (=> b!729983 (= e!408542 (not e!408534))))

(declare-fun res!490330 () Bool)

(assert (=> b!729983 (=> res!490330 e!408534)))

(declare-fun lt!323441 () SeekEntryResult!7300)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!729983 (= res!490330 (or (not (is-Intermediate!7300 lt!323441)) (bvsge x!1131 (x!62546 lt!323441))))))

(declare-fun e!408538 () Bool)

(assert (=> b!729983 e!408538))

(declare-fun res!490331 () Bool)

(assert (=> b!729983 (=> (not res!490331) (not e!408538))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41161 (_ BitVec 32)) Bool)

(assert (=> b!729983 (= res!490331 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24918 0))(
  ( (Unit!24919) )
))
(declare-fun lt!323434 () Unit!24918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24918)

(assert (=> b!729983 (= lt!323434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!408540 () Bool)

(declare-fun lt!323438 () SeekEntryResult!7300)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729984 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729984 (= e!408540 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323438))))

(declare-fun b!729985 () Bool)

(declare-fun res!490337 () Bool)

(assert (=> b!729985 (=> (not res!490337) (not e!408539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729985 (= res!490337 (validKeyInArray!0 k!2102))))

(declare-fun res!490333 () Bool)

(assert (=> start!64712 (=> (not res!490333) (not e!408539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64712 (= res!490333 (validMask!0 mask!3328))))

(assert (=> start!64712 e!408539))

(assert (=> start!64712 true))

(declare-fun array_inv!15496 (array!41161) Bool)

(assert (=> start!64712 (array_inv!15496 a!3186)))

(declare-fun b!729986 () Bool)

(declare-fun e!408537 () Bool)

(assert (=> b!729986 (= e!408537 e!408542)))

(declare-fun res!490329 () Bool)

(assert (=> b!729986 (=> (not res!490329) (not e!408542))))

(declare-fun lt!323435 () SeekEntryResult!7300)

(assert (=> b!729986 (= res!490329 (= lt!323435 lt!323441))))

(declare-fun lt!323439 () array!41161)

(declare-fun lt!323440 () (_ BitVec 64))

(assert (=> b!729986 (= lt!323441 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323440 lt!323439 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729986 (= lt!323435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323440 mask!3328) lt!323440 lt!323439 mask!3328))))

(assert (=> b!729986 (= lt!323440 (select (store (arr!19700 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729986 (= lt!323439 (array!41162 (store (arr!19700 a!3186) i!1173 k!2102) (size!20121 a!3186)))))

(declare-fun b!729987 () Bool)

(declare-fun res!490334 () Bool)

(assert (=> b!729987 (=> (not res!490334) (not e!408536))))

(assert (=> b!729987 (= res!490334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729988 () Bool)

(assert (=> b!729988 (= e!408536 e!408537)))

(declare-fun res!490339 () Bool)

(assert (=> b!729988 (=> (not res!490339) (not e!408537))))

(assert (=> b!729988 (= res!490339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19700 a!3186) j!159) mask!3328) (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323438))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729988 (= lt!323438 (Intermediate!7300 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729989 () Bool)

(declare-fun res!490325 () Bool)

(assert (=> b!729989 (=> (not res!490325) (not e!408539))))

(assert (=> b!729989 (= res!490325 (and (= (size!20121 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20121 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20121 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41161 (_ BitVec 32)) SeekEntryResult!7300)

(assert (=> b!729990 (= e!408540 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) (Found!7300 j!159)))))

(declare-fun b!729991 () Bool)

(declare-fun res!490340 () Bool)

(assert (=> b!729991 (=> (not res!490340) (not e!408536))))

(declare-datatypes ((List!13702 0))(
  ( (Nil!13699) (Cons!13698 (h!14758 (_ BitVec 64)) (t!20017 List!13702)) )
))
(declare-fun arrayNoDuplicates!0 (array!41161 (_ BitVec 32) List!13702) Bool)

(assert (=> b!729991 (= res!490340 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13699))))

(declare-fun b!729992 () Bool)

(declare-fun res!490328 () Bool)

(assert (=> b!729992 (=> (not res!490328) (not e!408539))))

(assert (=> b!729992 (= res!490328 (validKeyInArray!0 (select (arr!19700 a!3186) j!159)))))

(declare-fun b!729993 () Bool)

(declare-fun res!490335 () Bool)

(assert (=> b!729993 (=> (not res!490335) (not e!408537))))

(assert (=> b!729993 (= res!490335 e!408540)))

(declare-fun c!80203 () Bool)

(assert (=> b!729993 (= c!80203 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729994 () Bool)

(declare-fun e!408541 () Bool)

(assert (=> b!729994 (= e!408538 e!408541)))

(declare-fun res!490336 () Bool)

(assert (=> b!729994 (=> (not res!490336) (not e!408541))))

(declare-fun lt!323433 () SeekEntryResult!7300)

(assert (=> b!729994 (= res!490336 (= (seekEntryOrOpen!0 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323433))))

(assert (=> b!729994 (= lt!323433 (Found!7300 j!159))))

(declare-fun b!729995 () Bool)

(declare-fun res!490326 () Bool)

(assert (=> b!729995 (=> (not res!490326) (not e!408539))))

(declare-fun arrayContainsKey!0 (array!41161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729995 (= res!490326 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729996 () Bool)

(assert (=> b!729996 (= e!408541 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323433))))

(declare-fun b!729997 () Bool)

(assert (=> b!729997 (= e!408534 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323437 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729997 (= lt!323437 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729998 () Bool)

(declare-fun res!490338 () Bool)

(assert (=> b!729998 (=> (not res!490338) (not e!408537))))

(assert (=> b!729998 (= res!490338 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19700 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729999 () Bool)

(declare-fun res!490332 () Bool)

(assert (=> b!729999 (=> (not res!490332) (not e!408536))))

(assert (=> b!729999 (= res!490332 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20121 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20121 a!3186))))))

(assert (= (and start!64712 res!490333) b!729989))

(assert (= (and b!729989 res!490325) b!729992))

(assert (= (and b!729992 res!490328) b!729985))

(assert (= (and b!729985 res!490337) b!729995))

(assert (= (and b!729995 res!490326) b!729982))

(assert (= (and b!729982 res!490327) b!729987))

(assert (= (and b!729987 res!490334) b!729991))

(assert (= (and b!729991 res!490340) b!729999))

(assert (= (and b!729999 res!490332) b!729988))

(assert (= (and b!729988 res!490339) b!729998))

(assert (= (and b!729998 res!490338) b!729993))

(assert (= (and b!729993 c!80203) b!729984))

(assert (= (and b!729993 (not c!80203)) b!729990))

(assert (= (and b!729993 res!490335) b!729986))

(assert (= (and b!729986 res!490329) b!729983))

(assert (= (and b!729983 res!490331) b!729994))

(assert (= (and b!729994 res!490336) b!729996))

(assert (= (and b!729983 (not res!490330)) b!729997))

(declare-fun m!683563 () Bool)

(assert (=> b!729983 m!683563))

(declare-fun m!683565 () Bool)

(assert (=> b!729983 m!683565))

(declare-fun m!683567 () Bool)

(assert (=> b!729982 m!683567))

(declare-fun m!683569 () Bool)

(assert (=> b!729991 m!683569))

(declare-fun m!683571 () Bool)

(assert (=> b!729986 m!683571))

(declare-fun m!683573 () Bool)

(assert (=> b!729986 m!683573))

(declare-fun m!683575 () Bool)

(assert (=> b!729986 m!683575))

(assert (=> b!729986 m!683575))

(declare-fun m!683577 () Bool)

(assert (=> b!729986 m!683577))

(declare-fun m!683579 () Bool)

(assert (=> b!729986 m!683579))

(declare-fun m!683581 () Bool)

(assert (=> b!729998 m!683581))

(declare-fun m!683583 () Bool)

(assert (=> b!729992 m!683583))

(assert (=> b!729992 m!683583))

(declare-fun m!683585 () Bool)

(assert (=> b!729992 m!683585))

(assert (=> b!729996 m!683583))

(assert (=> b!729996 m!683583))

(declare-fun m!683587 () Bool)

(assert (=> b!729996 m!683587))

(assert (=> b!729994 m!683583))

(assert (=> b!729994 m!683583))

(declare-fun m!683589 () Bool)

(assert (=> b!729994 m!683589))

(declare-fun m!683591 () Bool)

(assert (=> start!64712 m!683591))

(declare-fun m!683593 () Bool)

(assert (=> start!64712 m!683593))

(declare-fun m!683595 () Bool)

(assert (=> b!729985 m!683595))

(declare-fun m!683597 () Bool)

(assert (=> b!729997 m!683597))

(assert (=> b!729988 m!683583))

(assert (=> b!729988 m!683583))

(declare-fun m!683599 () Bool)

(assert (=> b!729988 m!683599))

(assert (=> b!729988 m!683599))

(assert (=> b!729988 m!683583))

(declare-fun m!683601 () Bool)

(assert (=> b!729988 m!683601))

(declare-fun m!683603 () Bool)

(assert (=> b!729987 m!683603))

(assert (=> b!729990 m!683583))

(assert (=> b!729990 m!683583))

(declare-fun m!683605 () Bool)

(assert (=> b!729990 m!683605))

(declare-fun m!683607 () Bool)

(assert (=> b!729995 m!683607))

(assert (=> b!729984 m!683583))

(assert (=> b!729984 m!683583))

(declare-fun m!683609 () Bool)

(assert (=> b!729984 m!683609))

(push 1)

(assert (not b!729991))

(assert (not b!729984))

(assert (not start!64712))

(assert (not b!729983))

(assert (not b!729988))

(assert (not b!729992))

(assert (not b!729994))

(assert (not b!729982))

(assert (not b!729990))

(assert (not b!729995))

(assert (not b!729987))

(assert (not b!729986))

(assert (not b!729985))

(assert (not b!729996))

(assert (not b!729997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

