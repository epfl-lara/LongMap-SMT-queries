; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67134 () Bool)

(assert start!67134)

(declare-fun b!775631 () Bool)

(declare-fun res!524531 () Bool)

(declare-fun e!431667 () Bool)

(assert (=> b!775631 (=> (not res!524531) (not e!431667))))

(declare-datatypes ((array!42489 0))(
  ( (array!42490 (arr!20340 (Array (_ BitVec 32) (_ BitVec 64))) (size!20761 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42489)

(declare-datatypes ((List!14342 0))(
  ( (Nil!14339) (Cons!14338 (h!15446 (_ BitVec 64)) (t!20657 List!14342)) )
))
(declare-fun arrayNoDuplicates!0 (array!42489 (_ BitVec 32) List!14342) Bool)

(assert (=> b!775631 (= res!524531 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14339))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!431668 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775632 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7940 0))(
  ( (MissingZero!7940 (index!34128 (_ BitVec 32))) (Found!7940 (index!34129 (_ BitVec 32))) (Intermediate!7940 (undefined!8752 Bool) (index!34130 (_ BitVec 32)) (x!65075 (_ BitVec 32))) (Undefined!7940) (MissingVacant!7940 (index!34131 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42489 (_ BitVec 32)) SeekEntryResult!7940)

(assert (=> b!775632 (= e!431668 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20340 a!3186) j!159) a!3186 mask!3328) (Found!7940 j!159)))))

(declare-fun b!775633 () Bool)

(declare-fun res!524529 () Bool)

(declare-fun e!431669 () Bool)

(assert (=> b!775633 (=> (not res!524529) (not e!431669))))

(assert (=> b!775633 (= res!524529 e!431668)))

(declare-fun c!85954 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775633 (= c!85954 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775634 () Bool)

(declare-fun res!524523 () Bool)

(declare-fun e!431670 () Bool)

(assert (=> b!775634 (=> (not res!524523) (not e!431670))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775634 (= res!524523 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!431666 () Bool)

(declare-fun lt!345536 () SeekEntryResult!7940)

(declare-fun b!775635 () Bool)

(assert (=> b!775635 (= e!431666 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20340 a!3186) j!159) a!3186 mask!3328) lt!345536))))

(declare-fun res!524530 () Bool)

(assert (=> start!67134 (=> (not res!524530) (not e!431670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67134 (= res!524530 (validMask!0 mask!3328))))

(assert (=> start!67134 e!431670))

(assert (=> start!67134 true))

(declare-fun array_inv!16136 (array!42489) Bool)

(assert (=> start!67134 (array_inv!16136 a!3186)))

(declare-fun b!775636 () Bool)

(declare-fun res!524524 () Bool)

(assert (=> b!775636 (=> (not res!524524) (not e!431669))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775636 (= res!524524 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20340 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775637 () Bool)

(declare-fun e!431671 () Bool)

(assert (=> b!775637 (= e!431669 e!431671)))

(declare-fun res!524536 () Bool)

(assert (=> b!775637 (=> (not res!524536) (not e!431671))))

(declare-fun lt!345537 () array!42489)

(declare-fun lt!345539 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42489 (_ BitVec 32)) SeekEntryResult!7940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775637 (= res!524536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345539 mask!3328) lt!345539 lt!345537 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345539 lt!345537 mask!3328)))))

(assert (=> b!775637 (= lt!345539 (select (store (arr!20340 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775637 (= lt!345537 (array!42490 (store (arr!20340 a!3186) i!1173 k!2102) (size!20761 a!3186)))))

(declare-fun b!775638 () Bool)

(declare-fun res!524533 () Bool)

(assert (=> b!775638 (=> (not res!524533) (not e!431667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42489 (_ BitVec 32)) Bool)

(assert (=> b!775638 (= res!524533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775639 () Bool)

(declare-fun e!431672 () Bool)

(assert (=> b!775639 (= e!431672 e!431666)))

(declare-fun res!524535 () Bool)

(assert (=> b!775639 (=> (not res!524535) (not e!431666))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42489 (_ BitVec 32)) SeekEntryResult!7940)

(assert (=> b!775639 (= res!524535 (= (seekEntryOrOpen!0 (select (arr!20340 a!3186) j!159) a!3186 mask!3328) lt!345536))))

(assert (=> b!775639 (= lt!345536 (Found!7940 j!159))))

(declare-fun lt!345538 () SeekEntryResult!7940)

(declare-fun b!775640 () Bool)

(assert (=> b!775640 (= e!431668 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20340 a!3186) j!159) a!3186 mask!3328) lt!345538))))

(declare-fun b!775641 () Bool)

(declare-fun res!524532 () Bool)

(assert (=> b!775641 (=> (not res!524532) (not e!431670))))

(assert (=> b!775641 (= res!524532 (and (= (size!20761 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20761 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20761 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775642 () Bool)

(assert (=> b!775642 (= e!431671 (not true))))

(assert (=> b!775642 e!431672))

(declare-fun res!524528 () Bool)

(assert (=> b!775642 (=> (not res!524528) (not e!431672))))

(assert (=> b!775642 (= res!524528 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26774 0))(
  ( (Unit!26775) )
))
(declare-fun lt!345534 () Unit!26774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26774)

(assert (=> b!775642 (= lt!345534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775643 () Bool)

(assert (=> b!775643 (= e!431670 e!431667)))

(declare-fun res!524534 () Bool)

(assert (=> b!775643 (=> (not res!524534) (not e!431667))))

(declare-fun lt!345535 () SeekEntryResult!7940)

(assert (=> b!775643 (= res!524534 (or (= lt!345535 (MissingZero!7940 i!1173)) (= lt!345535 (MissingVacant!7940 i!1173))))))

(assert (=> b!775643 (= lt!345535 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775644 () Bool)

(declare-fun res!524525 () Bool)

(assert (=> b!775644 (=> (not res!524525) (not e!431667))))

(assert (=> b!775644 (= res!524525 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20761 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20761 a!3186))))))

(declare-fun b!775645 () Bool)

(declare-fun res!524537 () Bool)

(assert (=> b!775645 (=> (not res!524537) (not e!431670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775645 (= res!524537 (validKeyInArray!0 (select (arr!20340 a!3186) j!159)))))

(declare-fun b!775646 () Bool)

(assert (=> b!775646 (= e!431667 e!431669)))

(declare-fun res!524527 () Bool)

(assert (=> b!775646 (=> (not res!524527) (not e!431669))))

(assert (=> b!775646 (= res!524527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20340 a!3186) j!159) mask!3328) (select (arr!20340 a!3186) j!159) a!3186 mask!3328) lt!345538))))

(assert (=> b!775646 (= lt!345538 (Intermediate!7940 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775647 () Bool)

(declare-fun res!524526 () Bool)

(assert (=> b!775647 (=> (not res!524526) (not e!431670))))

(assert (=> b!775647 (= res!524526 (validKeyInArray!0 k!2102))))

(assert (= (and start!67134 res!524530) b!775641))

(assert (= (and b!775641 res!524532) b!775645))

(assert (= (and b!775645 res!524537) b!775647))

(assert (= (and b!775647 res!524526) b!775634))

(assert (= (and b!775634 res!524523) b!775643))

(assert (= (and b!775643 res!524534) b!775638))

(assert (= (and b!775638 res!524533) b!775631))

(assert (= (and b!775631 res!524531) b!775644))

(assert (= (and b!775644 res!524525) b!775646))

(assert (= (and b!775646 res!524527) b!775636))

(assert (= (and b!775636 res!524524) b!775633))

(assert (= (and b!775633 c!85954) b!775640))

(assert (= (and b!775633 (not c!85954)) b!775632))

(assert (= (and b!775633 res!524529) b!775637))

(assert (= (and b!775637 res!524536) b!775642))

(assert (= (and b!775642 res!524528) b!775639))

(assert (= (and b!775639 res!524535) b!775635))

(declare-fun m!719825 () Bool)

(assert (=> b!775640 m!719825))

(assert (=> b!775640 m!719825))

(declare-fun m!719827 () Bool)

(assert (=> b!775640 m!719827))

(declare-fun m!719829 () Bool)

(assert (=> b!775643 m!719829))

(assert (=> b!775632 m!719825))

(assert (=> b!775632 m!719825))

(declare-fun m!719831 () Bool)

(assert (=> b!775632 m!719831))

(assert (=> b!775635 m!719825))

(assert (=> b!775635 m!719825))

(declare-fun m!719833 () Bool)

(assert (=> b!775635 m!719833))

(declare-fun m!719835 () Bool)

(assert (=> b!775631 m!719835))

(declare-fun m!719837 () Bool)

(assert (=> b!775642 m!719837))

(declare-fun m!719839 () Bool)

(assert (=> b!775642 m!719839))

(declare-fun m!719841 () Bool)

(assert (=> b!775638 m!719841))

(declare-fun m!719843 () Bool)

(assert (=> b!775634 m!719843))

(declare-fun m!719845 () Bool)

(assert (=> b!775647 m!719845))

(declare-fun m!719847 () Bool)

(assert (=> b!775637 m!719847))

(assert (=> b!775637 m!719847))

(declare-fun m!719849 () Bool)

(assert (=> b!775637 m!719849))

(declare-fun m!719851 () Bool)

(assert (=> b!775637 m!719851))

(declare-fun m!719853 () Bool)

(assert (=> b!775637 m!719853))

(declare-fun m!719855 () Bool)

(assert (=> b!775637 m!719855))

(assert (=> b!775646 m!719825))

(assert (=> b!775646 m!719825))

(declare-fun m!719857 () Bool)

(assert (=> b!775646 m!719857))

(assert (=> b!775646 m!719857))

(assert (=> b!775646 m!719825))

(declare-fun m!719859 () Bool)

(assert (=> b!775646 m!719859))

(declare-fun m!719861 () Bool)

(assert (=> start!67134 m!719861))

(declare-fun m!719863 () Bool)

(assert (=> start!67134 m!719863))

(assert (=> b!775645 m!719825))

(assert (=> b!775645 m!719825))

(declare-fun m!719865 () Bool)

(assert (=> b!775645 m!719865))

(declare-fun m!719867 () Bool)

(assert (=> b!775636 m!719867))

(assert (=> b!775639 m!719825))

(assert (=> b!775639 m!719825))

(declare-fun m!719869 () Bool)

(assert (=> b!775639 m!719869))

(push 1)

