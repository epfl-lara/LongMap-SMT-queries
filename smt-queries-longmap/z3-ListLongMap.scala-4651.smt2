; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64806 () Bool)

(assert start!64806)

(declare-fun res!489818 () Bool)

(declare-fun e!408554 () Bool)

(assert (=> start!64806 (=> (not res!489818) (not e!408554))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64806 (= res!489818 (validMask!0 mask!3328))))

(assert (=> start!64806 e!408554))

(assert (=> start!64806 true))

(declare-datatypes ((array!41125 0))(
  ( (array!41126 (arr!19678 (Array (_ BitVec 32) (_ BitVec 64))) (size!20098 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41125)

(declare-fun array_inv!15537 (array!41125) Bool)

(assert (=> start!64806 (array_inv!15537 a!3186)))

(declare-fun b!729809 () Bool)

(declare-fun res!489826 () Bool)

(assert (=> b!729809 (=> (not res!489826) (not e!408554))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729809 (= res!489826 (validKeyInArray!0 k0!2102))))

(declare-fun b!729810 () Bool)

(declare-fun e!408558 () Bool)

(assert (=> b!729810 (= e!408558 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!323291 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729810 (= lt!323291 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!729811 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7234 0))(
  ( (MissingZero!7234 (index!31304 (_ BitVec 32))) (Found!7234 (index!31305 (_ BitVec 32))) (Intermediate!7234 (undefined!8046 Bool) (index!31306 (_ BitVec 32)) (x!62452 (_ BitVec 32))) (Undefined!7234) (MissingVacant!7234 (index!31307 (_ BitVec 32))) )
))
(declare-fun lt!323288 () SeekEntryResult!7234)

(declare-fun e!408553 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!729811 (= e!408553 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!323288))))

(declare-fun b!729812 () Bool)

(declare-fun res!489820 () Bool)

(declare-fun e!408561 () Bool)

(assert (=> b!729812 (=> (not res!489820) (not e!408561))))

(assert (=> b!729812 (= res!489820 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20098 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20098 a!3186))))))

(declare-fun b!729813 () Bool)

(declare-fun res!489821 () Bool)

(assert (=> b!729813 (=> (not res!489821) (not e!408554))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729813 (= res!489821 (and (= (size!20098 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20098 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20098 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729814 () Bool)

(declare-fun res!489816 () Bool)

(declare-fun e!408557 () Bool)

(assert (=> b!729814 (=> (not res!489816) (not e!408557))))

(declare-fun e!408559 () Bool)

(assert (=> b!729814 (= res!489816 e!408559)))

(declare-fun c!80375 () Bool)

(assert (=> b!729814 (= c!80375 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729815 () Bool)

(declare-fun res!489819 () Bool)

(assert (=> b!729815 (=> (not res!489819) (not e!408561))))

(declare-datatypes ((List!13587 0))(
  ( (Nil!13584) (Cons!13583 (h!14649 (_ BitVec 64)) (t!19894 List!13587)) )
))
(declare-fun arrayNoDuplicates!0 (array!41125 (_ BitVec 32) List!13587) Bool)

(assert (=> b!729815 (= res!489819 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13584))))

(declare-fun b!729816 () Bool)

(declare-fun res!489824 () Bool)

(assert (=> b!729816 (=> (not res!489824) (not e!408554))))

(declare-fun arrayContainsKey!0 (array!41125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729816 (= res!489824 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729817 () Bool)

(assert (=> b!729817 (= e!408561 e!408557)))

(declare-fun res!489814 () Bool)

(assert (=> b!729817 (=> (not res!489814) (not e!408557))))

(declare-fun lt!323293 () SeekEntryResult!7234)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729817 (= res!489814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19678 a!3186) j!159) mask!3328) (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!323293))))

(assert (=> b!729817 (= lt!323293 (Intermediate!7234 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729818 () Bool)

(declare-fun res!489825 () Bool)

(assert (=> b!729818 (=> (not res!489825) (not e!408557))))

(assert (=> b!729818 (= res!489825 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19678 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729819 () Bool)

(declare-fun res!489829 () Bool)

(assert (=> b!729819 (=> (not res!489829) (not e!408554))))

(assert (=> b!729819 (= res!489829 (validKeyInArray!0 (select (arr!19678 a!3186) j!159)))))

(declare-fun b!729820 () Bool)

(declare-fun e!408555 () Bool)

(assert (=> b!729820 (= e!408555 (not e!408558))))

(declare-fun res!489815 () Bool)

(assert (=> b!729820 (=> res!489815 e!408558)))

(declare-fun lt!323295 () SeekEntryResult!7234)

(get-info :version)

(assert (=> b!729820 (= res!489815 (or (not ((_ is Intermediate!7234) lt!323295)) (bvsge x!1131 (x!62452 lt!323295))))))

(declare-fun e!408560 () Bool)

(assert (=> b!729820 e!408560))

(declare-fun res!489817 () Bool)

(assert (=> b!729820 (=> (not res!489817) (not e!408560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41125 (_ BitVec 32)) Bool)

(assert (=> b!729820 (= res!489817 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24865 0))(
  ( (Unit!24866) )
))
(declare-fun lt!323290 () Unit!24865)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24865)

(assert (=> b!729820 (= lt!323290 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729821 () Bool)

(assert (=> b!729821 (= e!408559 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) (Found!7234 j!159)))))

(declare-fun b!729822 () Bool)

(declare-fun res!489822 () Bool)

(assert (=> b!729822 (=> (not res!489822) (not e!408561))))

(assert (=> b!729822 (= res!489822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729823 () Bool)

(assert (=> b!729823 (= e!408560 e!408553)))

(declare-fun res!489827 () Bool)

(assert (=> b!729823 (=> (not res!489827) (not e!408553))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!729823 (= res!489827 (= (seekEntryOrOpen!0 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!323288))))

(assert (=> b!729823 (= lt!323288 (Found!7234 j!159))))

(declare-fun b!729824 () Bool)

(assert (=> b!729824 (= e!408557 e!408555)))

(declare-fun res!489823 () Bool)

(assert (=> b!729824 (=> (not res!489823) (not e!408555))))

(declare-fun lt!323289 () SeekEntryResult!7234)

(assert (=> b!729824 (= res!489823 (= lt!323289 lt!323295))))

(declare-fun lt!323292 () (_ BitVec 64))

(declare-fun lt!323287 () array!41125)

(assert (=> b!729824 (= lt!323295 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323292 lt!323287 mask!3328))))

(assert (=> b!729824 (= lt!323289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323292 mask!3328) lt!323292 lt!323287 mask!3328))))

(assert (=> b!729824 (= lt!323292 (select (store (arr!19678 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729824 (= lt!323287 (array!41126 (store (arr!19678 a!3186) i!1173 k0!2102) (size!20098 a!3186)))))

(declare-fun b!729825 () Bool)

(assert (=> b!729825 (= e!408559 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19678 a!3186) j!159) a!3186 mask!3328) lt!323293))))

(declare-fun b!729826 () Bool)

(assert (=> b!729826 (= e!408554 e!408561)))

(declare-fun res!489828 () Bool)

(assert (=> b!729826 (=> (not res!489828) (not e!408561))))

(declare-fun lt!323294 () SeekEntryResult!7234)

(assert (=> b!729826 (= res!489828 (or (= lt!323294 (MissingZero!7234 i!1173)) (= lt!323294 (MissingVacant!7234 i!1173))))))

(assert (=> b!729826 (= lt!323294 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64806 res!489818) b!729813))

(assert (= (and b!729813 res!489821) b!729819))

(assert (= (and b!729819 res!489829) b!729809))

(assert (= (and b!729809 res!489826) b!729816))

(assert (= (and b!729816 res!489824) b!729826))

(assert (= (and b!729826 res!489828) b!729822))

(assert (= (and b!729822 res!489822) b!729815))

(assert (= (and b!729815 res!489819) b!729812))

(assert (= (and b!729812 res!489820) b!729817))

(assert (= (and b!729817 res!489814) b!729818))

(assert (= (and b!729818 res!489825) b!729814))

(assert (= (and b!729814 c!80375) b!729825))

(assert (= (and b!729814 (not c!80375)) b!729821))

(assert (= (and b!729814 res!489816) b!729824))

(assert (= (and b!729824 res!489823) b!729820))

(assert (= (and b!729820 res!489817) b!729823))

(assert (= (and b!729823 res!489827) b!729811))

(assert (= (and b!729820 (not res!489815)) b!729810))

(declare-fun m!683883 () Bool)

(assert (=> b!729816 m!683883))

(declare-fun m!683885 () Bool)

(assert (=> b!729821 m!683885))

(assert (=> b!729821 m!683885))

(declare-fun m!683887 () Bool)

(assert (=> b!729821 m!683887))

(declare-fun m!683889 () Bool)

(assert (=> b!729824 m!683889))

(declare-fun m!683891 () Bool)

(assert (=> b!729824 m!683891))

(assert (=> b!729824 m!683889))

(declare-fun m!683893 () Bool)

(assert (=> b!729824 m!683893))

(declare-fun m!683895 () Bool)

(assert (=> b!729824 m!683895))

(declare-fun m!683897 () Bool)

(assert (=> b!729824 m!683897))

(declare-fun m!683899 () Bool)

(assert (=> b!729826 m!683899))

(declare-fun m!683901 () Bool)

(assert (=> b!729810 m!683901))

(declare-fun m!683903 () Bool)

(assert (=> b!729820 m!683903))

(declare-fun m!683905 () Bool)

(assert (=> b!729820 m!683905))

(assert (=> b!729825 m!683885))

(assert (=> b!729825 m!683885))

(declare-fun m!683907 () Bool)

(assert (=> b!729825 m!683907))

(declare-fun m!683909 () Bool)

(assert (=> start!64806 m!683909))

(declare-fun m!683911 () Bool)

(assert (=> start!64806 m!683911))

(assert (=> b!729823 m!683885))

(assert (=> b!729823 m!683885))

(declare-fun m!683913 () Bool)

(assert (=> b!729823 m!683913))

(assert (=> b!729811 m!683885))

(assert (=> b!729811 m!683885))

(declare-fun m!683915 () Bool)

(assert (=> b!729811 m!683915))

(declare-fun m!683917 () Bool)

(assert (=> b!729815 m!683917))

(declare-fun m!683919 () Bool)

(assert (=> b!729818 m!683919))

(assert (=> b!729817 m!683885))

(assert (=> b!729817 m!683885))

(declare-fun m!683921 () Bool)

(assert (=> b!729817 m!683921))

(assert (=> b!729817 m!683921))

(assert (=> b!729817 m!683885))

(declare-fun m!683923 () Bool)

(assert (=> b!729817 m!683923))

(declare-fun m!683925 () Bool)

(assert (=> b!729809 m!683925))

(assert (=> b!729819 m!683885))

(assert (=> b!729819 m!683885))

(declare-fun m!683927 () Bool)

(assert (=> b!729819 m!683927))

(declare-fun m!683929 () Bool)

(assert (=> b!729822 m!683929))

(check-sat (not b!729809) (not b!729811) (not b!729816) (not b!729822) (not b!729810) (not b!729824) (not start!64806) (not b!729820) (not b!729817) (not b!729821) (not b!729826) (not b!729823) (not b!729825) (not b!729819) (not b!729815))
(check-sat)
