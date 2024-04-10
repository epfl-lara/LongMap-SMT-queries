; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64336 () Bool)

(assert start!64336)

(declare-fun b!723067 () Bool)

(declare-fun e!405155 () Bool)

(declare-fun e!405153 () Bool)

(assert (=> b!723067 (= e!405155 e!405153)))

(declare-fun res!484697 () Bool)

(assert (=> b!723067 (=> (not res!484697) (not e!405153))))

(declare-datatypes ((array!40917 0))(
  ( (array!40918 (arr!19581 (Array (_ BitVec 32) (_ BitVec 64))) (size!20002 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40917)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7181 0))(
  ( (MissingZero!7181 (index!31092 (_ BitVec 32))) (Found!7181 (index!31093 (_ BitVec 32))) (Intermediate!7181 (undefined!7993 Bool) (index!31094 (_ BitVec 32)) (x!62094 (_ BitVec 32))) (Undefined!7181) (MissingVacant!7181 (index!31095 (_ BitVec 32))) )
))
(declare-fun lt!320548 () SeekEntryResult!7181)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40917 (_ BitVec 32)) SeekEntryResult!7181)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723067 (= res!484697 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19581 a!3186) j!159) mask!3328) (select (arr!19581 a!3186) j!159) a!3186 mask!3328) lt!320548))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723067 (= lt!320548 (Intermediate!7181 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723068 () Bool)

(declare-fun res!484700 () Bool)

(declare-fun e!405157 () Bool)

(assert (=> b!723068 (=> (not res!484700) (not e!405157))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723068 (= res!484700 (and (= (size!20002 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20002 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20002 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723069 () Bool)

(declare-fun res!484691 () Bool)

(assert (=> b!723069 (=> (not res!484691) (not e!405155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40917 (_ BitVec 32)) Bool)

(assert (=> b!723069 (= res!484691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723070 () Bool)

(declare-fun res!484690 () Bool)

(assert (=> b!723070 (=> (not res!484690) (not e!405157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723070 (= res!484690 (validKeyInArray!0 (select (arr!19581 a!3186) j!159)))))

(declare-fun b!723071 () Bool)

(assert (=> b!723071 (= e!405157 e!405155)))

(declare-fun res!484699 () Bool)

(assert (=> b!723071 (=> (not res!484699) (not e!405155))))

(declare-fun lt!320549 () SeekEntryResult!7181)

(assert (=> b!723071 (= res!484699 (or (= lt!320549 (MissingZero!7181 i!1173)) (= lt!320549 (MissingVacant!7181 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40917 (_ BitVec 32)) SeekEntryResult!7181)

(assert (=> b!723071 (= lt!320549 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723072 () Bool)

(declare-fun res!484694 () Bool)

(assert (=> b!723072 (=> (not res!484694) (not e!405155))))

(declare-datatypes ((List!13583 0))(
  ( (Nil!13580) (Cons!13579 (h!14633 (_ BitVec 64)) (t!19898 List!13583)) )
))
(declare-fun arrayNoDuplicates!0 (array!40917 (_ BitVec 32) List!13583) Bool)

(assert (=> b!723072 (= res!484694 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13580))))

(declare-fun res!484688 () Bool)

(assert (=> start!64336 (=> (not res!484688) (not e!405157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64336 (= res!484688 (validMask!0 mask!3328))))

(assert (=> start!64336 e!405157))

(assert (=> start!64336 true))

(declare-fun array_inv!15377 (array!40917) Bool)

(assert (=> start!64336 (array_inv!15377 a!3186)))

(declare-fun b!723073 () Bool)

(declare-fun e!405156 () Bool)

(assert (=> b!723073 (= e!405156 (not true))))

(assert (=> b!723073 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24680 0))(
  ( (Unit!24681) )
))
(declare-fun lt!320546 () Unit!24680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24680)

(assert (=> b!723073 (= lt!320546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!405158 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!723074 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!723074 (= e!405158 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19581 a!3186) j!159) a!3186 mask!3328) lt!320548))))

(declare-fun b!723075 () Bool)

(assert (=> b!723075 (= e!405153 e!405156)))

(declare-fun res!484696 () Bool)

(assert (=> b!723075 (=> (not res!484696) (not e!405156))))

(declare-fun lt!320545 () array!40917)

(declare-fun lt!320547 () (_ BitVec 64))

(assert (=> b!723075 (= res!484696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320547 mask!3328) lt!320547 lt!320545 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320547 lt!320545 mask!3328)))))

(assert (=> b!723075 (= lt!320547 (select (store (arr!19581 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723075 (= lt!320545 (array!40918 (store (arr!19581 a!3186) i!1173 k!2102) (size!20002 a!3186)))))

(declare-fun b!723076 () Bool)

(declare-fun res!484689 () Bool)

(assert (=> b!723076 (=> (not res!484689) (not e!405155))))

(assert (=> b!723076 (= res!484689 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20002 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20002 a!3186))))))

(declare-fun b!723077 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40917 (_ BitVec 32)) SeekEntryResult!7181)

(assert (=> b!723077 (= e!405158 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19581 a!3186) j!159) a!3186 mask!3328) (Found!7181 j!159)))))

(declare-fun b!723078 () Bool)

(declare-fun res!484698 () Bool)

(assert (=> b!723078 (=> (not res!484698) (not e!405157))))

(assert (=> b!723078 (= res!484698 (validKeyInArray!0 k!2102))))

(declare-fun b!723079 () Bool)

(declare-fun res!484695 () Bool)

(assert (=> b!723079 (=> (not res!484695) (not e!405153))))

(assert (=> b!723079 (= res!484695 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19581 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723080 () Bool)

(declare-fun res!484693 () Bool)

(assert (=> b!723080 (=> (not res!484693) (not e!405153))))

(assert (=> b!723080 (= res!484693 e!405158)))

(declare-fun c!79561 () Bool)

(assert (=> b!723080 (= c!79561 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723081 () Bool)

(declare-fun res!484692 () Bool)

(assert (=> b!723081 (=> (not res!484692) (not e!405157))))

(declare-fun arrayContainsKey!0 (array!40917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723081 (= res!484692 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64336 res!484688) b!723068))

(assert (= (and b!723068 res!484700) b!723070))

(assert (= (and b!723070 res!484690) b!723078))

(assert (= (and b!723078 res!484698) b!723081))

(assert (= (and b!723081 res!484692) b!723071))

(assert (= (and b!723071 res!484699) b!723069))

(assert (= (and b!723069 res!484691) b!723072))

(assert (= (and b!723072 res!484694) b!723076))

(assert (= (and b!723076 res!484689) b!723067))

(assert (= (and b!723067 res!484697) b!723079))

(assert (= (and b!723079 res!484695) b!723080))

(assert (= (and b!723080 c!79561) b!723074))

(assert (= (and b!723080 (not c!79561)) b!723077))

(assert (= (and b!723080 res!484693) b!723075))

(assert (= (and b!723075 res!484696) b!723073))

(declare-fun m!677533 () Bool)

(assert (=> b!723078 m!677533))

(declare-fun m!677535 () Bool)

(assert (=> b!723073 m!677535))

(declare-fun m!677537 () Bool)

(assert (=> b!723073 m!677537))

(declare-fun m!677539 () Bool)

(assert (=> b!723067 m!677539))

(assert (=> b!723067 m!677539))

(declare-fun m!677541 () Bool)

(assert (=> b!723067 m!677541))

(assert (=> b!723067 m!677541))

(assert (=> b!723067 m!677539))

(declare-fun m!677543 () Bool)

(assert (=> b!723067 m!677543))

(declare-fun m!677545 () Bool)

(assert (=> b!723071 m!677545))

(assert (=> b!723077 m!677539))

(assert (=> b!723077 m!677539))

(declare-fun m!677547 () Bool)

(assert (=> b!723077 m!677547))

(assert (=> b!723074 m!677539))

(assert (=> b!723074 m!677539))

(declare-fun m!677549 () Bool)

(assert (=> b!723074 m!677549))

(declare-fun m!677551 () Bool)

(assert (=> start!64336 m!677551))

(declare-fun m!677553 () Bool)

(assert (=> start!64336 m!677553))

(declare-fun m!677555 () Bool)

(assert (=> b!723069 m!677555))

(declare-fun m!677557 () Bool)

(assert (=> b!723075 m!677557))

(declare-fun m!677559 () Bool)

(assert (=> b!723075 m!677559))

(declare-fun m!677561 () Bool)

(assert (=> b!723075 m!677561))

(declare-fun m!677563 () Bool)

(assert (=> b!723075 m!677563))

(assert (=> b!723075 m!677557))

(declare-fun m!677565 () Bool)

(assert (=> b!723075 m!677565))

(declare-fun m!677567 () Bool)

(assert (=> b!723072 m!677567))

(declare-fun m!677569 () Bool)

(assert (=> b!723079 m!677569))

(assert (=> b!723070 m!677539))

(assert (=> b!723070 m!677539))

(declare-fun m!677571 () Bool)

(assert (=> b!723070 m!677571))

(declare-fun m!677573 () Bool)

(assert (=> b!723081 m!677573))

(push 1)

