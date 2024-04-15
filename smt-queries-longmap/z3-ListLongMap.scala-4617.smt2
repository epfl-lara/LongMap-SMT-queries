; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64316 () Bool)

(assert start!64316)

(declare-fun b!722817 () Bool)

(declare-fun res!484586 () Bool)

(declare-fun e!405000 () Bool)

(assert (=> b!722817 (=> (not res!484586) (not e!405000))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40914 0))(
  ( (array!40915 (arr!19580 (Array (_ BitVec 32) (_ BitVec 64))) (size!20001 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40914)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722817 (= res!484586 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19580 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722818 () Bool)

(declare-fun res!484581 () Bool)

(declare-fun e!405001 () Bool)

(assert (=> b!722818 (=> (not res!484581) (not e!405001))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722818 (= res!484581 (and (= (size!20001 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20001 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20001 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722819 () Bool)

(declare-fun e!405004 () Bool)

(assert (=> b!722819 (= e!405001 e!405004)))

(declare-fun res!484590 () Bool)

(assert (=> b!722819 (=> (not res!484590) (not e!405004))))

(declare-datatypes ((SeekEntryResult!7177 0))(
  ( (MissingZero!7177 (index!31076 (_ BitVec 32))) (Found!7177 (index!31077 (_ BitVec 32))) (Intermediate!7177 (undefined!7989 Bool) (index!31078 (_ BitVec 32)) (x!62085 (_ BitVec 32))) (Undefined!7177) (MissingVacant!7177 (index!31079 (_ BitVec 32))) )
))
(declare-fun lt!320306 () SeekEntryResult!7177)

(assert (=> b!722819 (= res!484590 (or (= lt!320306 (MissingZero!7177 i!1173)) (= lt!320306 (MissingVacant!7177 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40914 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!722819 (= lt!320306 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722821 () Bool)

(assert (=> b!722821 (= e!405004 e!405000)))

(declare-fun res!484589 () Bool)

(assert (=> b!722821 (=> (not res!484589) (not e!405000))))

(declare-fun lt!320309 () SeekEntryResult!7177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40914 (_ BitVec 32)) SeekEntryResult!7177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722821 (= res!484589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19580 a!3186) j!159) mask!3328) (select (arr!19580 a!3186) j!159) a!3186 mask!3328) lt!320309))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722821 (= lt!320309 (Intermediate!7177 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722822 () Bool)

(declare-fun res!484585 () Bool)

(assert (=> b!722822 (=> (not res!484585) (not e!405004))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722822 (= res!484585 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20001 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20001 a!3186))))))

(declare-fun e!404999 () Bool)

(declare-fun b!722823 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40914 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!722823 (= e!404999 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19580 a!3186) j!159) a!3186 mask!3328) (Found!7177 j!159)))))

(declare-fun b!722824 () Bool)

(declare-fun res!484587 () Bool)

(assert (=> b!722824 (=> (not res!484587) (not e!405004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40914 (_ BitVec 32)) Bool)

(assert (=> b!722824 (= res!484587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722825 () Bool)

(declare-fun e!405003 () Bool)

(assert (=> b!722825 (= e!405000 e!405003)))

(declare-fun res!484588 () Bool)

(assert (=> b!722825 (=> (not res!484588) (not e!405003))))

(declare-fun lt!320307 () array!40914)

(declare-fun lt!320308 () (_ BitVec 64))

(assert (=> b!722825 (= res!484588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320308 mask!3328) lt!320308 lt!320307 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320308 lt!320307 mask!3328)))))

(assert (=> b!722825 (= lt!320308 (select (store (arr!19580 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722825 (= lt!320307 (array!40915 (store (arr!19580 a!3186) i!1173 k0!2102) (size!20001 a!3186)))))

(declare-fun b!722826 () Bool)

(declare-fun res!484583 () Bool)

(assert (=> b!722826 (=> (not res!484583) (not e!405000))))

(assert (=> b!722826 (= res!484583 e!404999)))

(declare-fun c!79491 () Bool)

(assert (=> b!722826 (= c!79491 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722827 () Bool)

(declare-fun res!484582 () Bool)

(assert (=> b!722827 (=> (not res!484582) (not e!405004))))

(declare-datatypes ((List!13621 0))(
  ( (Nil!13618) (Cons!13617 (h!14671 (_ BitVec 64)) (t!19927 List!13621)) )
))
(declare-fun arrayNoDuplicates!0 (array!40914 (_ BitVec 32) List!13621) Bool)

(assert (=> b!722827 (= res!484582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13618))))

(declare-fun b!722820 () Bool)

(declare-fun res!484584 () Bool)

(assert (=> b!722820 (=> (not res!484584) (not e!405001))))

(declare-fun arrayContainsKey!0 (array!40914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722820 (= res!484584 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!484580 () Bool)

(assert (=> start!64316 (=> (not res!484580) (not e!405001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64316 (= res!484580 (validMask!0 mask!3328))))

(assert (=> start!64316 e!405001))

(assert (=> start!64316 true))

(declare-fun array_inv!15463 (array!40914) Bool)

(assert (=> start!64316 (array_inv!15463 a!3186)))

(declare-fun b!722828 () Bool)

(assert (=> b!722828 (= e!404999 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19580 a!3186) j!159) a!3186 mask!3328) lt!320309))))

(declare-fun b!722829 () Bool)

(declare-fun res!484578 () Bool)

(assert (=> b!722829 (=> (not res!484578) (not e!405001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722829 (= res!484578 (validKeyInArray!0 (select (arr!19580 a!3186) j!159)))))

(declare-fun b!722830 () Bool)

(assert (=> b!722830 (= e!405003 (not true))))

(assert (=> b!722830 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24644 0))(
  ( (Unit!24645) )
))
(declare-fun lt!320305 () Unit!24644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24644)

(assert (=> b!722830 (= lt!320305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!722831 () Bool)

(declare-fun res!484579 () Bool)

(assert (=> b!722831 (=> (not res!484579) (not e!405001))))

(assert (=> b!722831 (= res!484579 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64316 res!484580) b!722818))

(assert (= (and b!722818 res!484581) b!722829))

(assert (= (and b!722829 res!484578) b!722831))

(assert (= (and b!722831 res!484579) b!722820))

(assert (= (and b!722820 res!484584) b!722819))

(assert (= (and b!722819 res!484590) b!722824))

(assert (= (and b!722824 res!484587) b!722827))

(assert (= (and b!722827 res!484582) b!722822))

(assert (= (and b!722822 res!484585) b!722821))

(assert (= (and b!722821 res!484589) b!722817))

(assert (= (and b!722817 res!484586) b!722826))

(assert (= (and b!722826 c!79491) b!722828))

(assert (= (and b!722826 (not c!79491)) b!722823))

(assert (= (and b!722826 res!484583) b!722825))

(assert (= (and b!722825 res!484588) b!722830))

(declare-fun m!676775 () Bool)

(assert (=> b!722820 m!676775))

(declare-fun m!676777 () Bool)

(assert (=> b!722831 m!676777))

(declare-fun m!676779 () Bool)

(assert (=> b!722824 m!676779))

(declare-fun m!676781 () Bool)

(assert (=> start!64316 m!676781))

(declare-fun m!676783 () Bool)

(assert (=> start!64316 m!676783))

(declare-fun m!676785 () Bool)

(assert (=> b!722827 m!676785))

(declare-fun m!676787 () Bool)

(assert (=> b!722830 m!676787))

(declare-fun m!676789 () Bool)

(assert (=> b!722830 m!676789))

(declare-fun m!676791 () Bool)

(assert (=> b!722828 m!676791))

(assert (=> b!722828 m!676791))

(declare-fun m!676793 () Bool)

(assert (=> b!722828 m!676793))

(assert (=> b!722829 m!676791))

(assert (=> b!722829 m!676791))

(declare-fun m!676795 () Bool)

(assert (=> b!722829 m!676795))

(declare-fun m!676797 () Bool)

(assert (=> b!722819 m!676797))

(assert (=> b!722823 m!676791))

(assert (=> b!722823 m!676791))

(declare-fun m!676799 () Bool)

(assert (=> b!722823 m!676799))

(declare-fun m!676801 () Bool)

(assert (=> b!722825 m!676801))

(declare-fun m!676803 () Bool)

(assert (=> b!722825 m!676803))

(declare-fun m!676805 () Bool)

(assert (=> b!722825 m!676805))

(assert (=> b!722825 m!676801))

(declare-fun m!676807 () Bool)

(assert (=> b!722825 m!676807))

(declare-fun m!676809 () Bool)

(assert (=> b!722825 m!676809))

(assert (=> b!722821 m!676791))

(assert (=> b!722821 m!676791))

(declare-fun m!676811 () Bool)

(assert (=> b!722821 m!676811))

(assert (=> b!722821 m!676811))

(assert (=> b!722821 m!676791))

(declare-fun m!676813 () Bool)

(assert (=> b!722821 m!676813))

(declare-fun m!676815 () Bool)

(assert (=> b!722817 m!676815))

(check-sat (not b!722823) (not b!722825) (not b!722829) (not b!722830) (not b!722827) (not b!722831) (not b!722828) (not b!722824) (not start!64316) (not b!722819) (not b!722820) (not b!722821))
(check-sat)
