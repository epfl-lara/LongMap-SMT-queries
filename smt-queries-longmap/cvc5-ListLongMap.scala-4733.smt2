; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65458 () Bool)

(assert start!65458)

(declare-datatypes ((SeekEntryResult!7529 0))(
  ( (MissingZero!7529 (index!32484 (_ BitVec 32))) (Found!7529 (index!32485 (_ BitVec 32))) (Intermediate!7529 (undefined!8341 Bool) (index!32486 (_ BitVec 32)) (x!63439 (_ BitVec 32))) (Undefined!7529) (MissingVacant!7529 (index!32487 (_ BitVec 32))) )
))
(declare-fun lt!331380 () SeekEntryResult!7529)

(declare-datatypes ((array!41631 0))(
  ( (array!41632 (arr!19929 (Array (_ BitVec 32) (_ BitVec 64))) (size!20350 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41631)

(declare-fun e!416538 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745826 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41631 (_ BitVec 32)) SeekEntryResult!7529)

(assert (=> b!745826 (= e!416538 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19929 a!3186) j!159) a!3186 mask!3328) lt!331380))))

(declare-fun b!745827 () Bool)

(declare-fun res!502661 () Bool)

(declare-fun e!416535 () Bool)

(assert (=> b!745827 (=> (not res!502661) (not e!416535))))

(assert (=> b!745827 (= res!502661 e!416538)))

(declare-fun c!81964 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745827 (= c!81964 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745828 () Bool)

(declare-fun e!416543 () Bool)

(assert (=> b!745828 (= e!416543 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!331377 () SeekEntryResult!7529)

(declare-fun lt!331384 () SeekEntryResult!7529)

(assert (=> b!745828 (= lt!331377 lt!331384)))

(declare-fun b!745829 () Bool)

(declare-fun res!502662 () Bool)

(declare-fun e!416542 () Bool)

(assert (=> b!745829 (=> (not res!502662) (not e!416542))))

(declare-datatypes ((List!13931 0))(
  ( (Nil!13928) (Cons!13927 (h!14999 (_ BitVec 64)) (t!20246 List!13931)) )
))
(declare-fun arrayNoDuplicates!0 (array!41631 (_ BitVec 32) List!13931) Bool)

(assert (=> b!745829 (= res!502662 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13928))))

(declare-fun b!745830 () Bool)

(declare-fun res!502659 () Bool)

(declare-fun e!416539 () Bool)

(assert (=> b!745830 (=> (not res!502659) (not e!416539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745830 (= res!502659 (validKeyInArray!0 (select (arr!19929 a!3186) j!159)))))

(declare-fun b!745831 () Bool)

(declare-fun res!502668 () Bool)

(assert (=> b!745831 (=> (not res!502668) (not e!416539))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745831 (= res!502668 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745832 () Bool)

(assert (=> b!745832 (= e!416539 e!416542)))

(declare-fun res!502667 () Bool)

(assert (=> b!745832 (=> (not res!502667) (not e!416542))))

(declare-fun lt!331382 () SeekEntryResult!7529)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745832 (= res!502667 (or (= lt!331382 (MissingZero!7529 i!1173)) (= lt!331382 (MissingVacant!7529 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41631 (_ BitVec 32)) SeekEntryResult!7529)

(assert (=> b!745832 (= lt!331382 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745833 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41631 (_ BitVec 32)) SeekEntryResult!7529)

(assert (=> b!745833 (= e!416538 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19929 a!3186) j!159) a!3186 mask!3328) (Found!7529 j!159)))))

(declare-fun b!745834 () Bool)

(declare-fun res!502669 () Bool)

(assert (=> b!745834 (=> (not res!502669) (not e!416539))))

(assert (=> b!745834 (= res!502669 (validKeyInArray!0 k!2102))))

(declare-fun b!745835 () Bool)

(declare-fun res!502665 () Bool)

(assert (=> b!745835 (=> (not res!502665) (not e!416542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41631 (_ BitVec 32)) Bool)

(assert (=> b!745835 (= res!502665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!416537 () Bool)

(declare-fun b!745836 () Bool)

(declare-fun lt!331376 () SeekEntryResult!7529)

(assert (=> b!745836 (= e!416537 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19929 a!3186) j!159) a!3186 mask!3328) lt!331376))))

(declare-fun res!502671 () Bool)

(assert (=> start!65458 (=> (not res!502671) (not e!416539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65458 (= res!502671 (validMask!0 mask!3328))))

(assert (=> start!65458 e!416539))

(assert (=> start!65458 true))

(declare-fun array_inv!15725 (array!41631) Bool)

(assert (=> start!65458 (array_inv!15725 a!3186)))

(declare-fun b!745825 () Bool)

(declare-fun res!502660 () Bool)

(assert (=> b!745825 (=> (not res!502660) (not e!416542))))

(assert (=> b!745825 (= res!502660 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20350 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20350 a!3186))))))

(declare-fun b!745837 () Bool)

(declare-fun e!416541 () Bool)

(assert (=> b!745837 (= e!416535 e!416541)))

(declare-fun res!502670 () Bool)

(assert (=> b!745837 (=> (not res!502670) (not e!416541))))

(declare-fun lt!331378 () SeekEntryResult!7529)

(declare-fun lt!331385 () SeekEntryResult!7529)

(assert (=> b!745837 (= res!502670 (= lt!331378 lt!331385))))

(declare-fun lt!331379 () array!41631)

(declare-fun lt!331381 () (_ BitVec 64))

(assert (=> b!745837 (= lt!331385 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331381 lt!331379 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745837 (= lt!331378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331381 mask!3328) lt!331381 lt!331379 mask!3328))))

(assert (=> b!745837 (= lt!331381 (select (store (arr!19929 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745837 (= lt!331379 (array!41632 (store (arr!19929 a!3186) i!1173 k!2102) (size!20350 a!3186)))))

(declare-fun b!745838 () Bool)

(declare-fun e!416536 () Bool)

(assert (=> b!745838 (= e!416541 (not e!416536))))

(declare-fun res!502673 () Bool)

(assert (=> b!745838 (=> res!502673 e!416536)))

(assert (=> b!745838 (= res!502673 (or (not (is-Intermediate!7529 lt!331385)) (bvslt x!1131 (x!63439 lt!331385)) (not (= x!1131 (x!63439 lt!331385))) (not (= index!1321 (index!32486 lt!331385)))))))

(assert (=> b!745838 e!416537))

(declare-fun res!502664 () Bool)

(assert (=> b!745838 (=> (not res!502664) (not e!416537))))

(assert (=> b!745838 (= res!502664 (= lt!331377 lt!331376))))

(assert (=> b!745838 (= lt!331376 (Found!7529 j!159))))

(assert (=> b!745838 (= lt!331377 (seekEntryOrOpen!0 (select (arr!19929 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745838 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25538 0))(
  ( (Unit!25539) )
))
(declare-fun lt!331383 () Unit!25538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25538)

(assert (=> b!745838 (= lt!331383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745839 () Bool)

(declare-fun res!502666 () Bool)

(assert (=> b!745839 (=> (not res!502666) (not e!416539))))

(assert (=> b!745839 (= res!502666 (and (= (size!20350 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20350 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20350 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745840 () Bool)

(assert (=> b!745840 (= e!416536 e!416543)))

(declare-fun res!502658 () Bool)

(assert (=> b!745840 (=> res!502658 e!416543)))

(assert (=> b!745840 (= res!502658 (or (not (= lt!331384 lt!331376)) (= (select (store (arr!19929 a!3186) i!1173 k!2102) index!1321) lt!331381) (not (= (select (store (arr!19929 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745840 (= lt!331384 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19929 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745841 () Bool)

(assert (=> b!745841 (= e!416542 e!416535)))

(declare-fun res!502663 () Bool)

(assert (=> b!745841 (=> (not res!502663) (not e!416535))))

(assert (=> b!745841 (= res!502663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19929 a!3186) j!159) mask!3328) (select (arr!19929 a!3186) j!159) a!3186 mask!3328) lt!331380))))

(assert (=> b!745841 (= lt!331380 (Intermediate!7529 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745842 () Bool)

(declare-fun res!502672 () Bool)

(assert (=> b!745842 (=> (not res!502672) (not e!416535))))

(assert (=> b!745842 (= res!502672 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19929 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65458 res!502671) b!745839))

(assert (= (and b!745839 res!502666) b!745830))

(assert (= (and b!745830 res!502659) b!745834))

(assert (= (and b!745834 res!502669) b!745831))

(assert (= (and b!745831 res!502668) b!745832))

(assert (= (and b!745832 res!502667) b!745835))

(assert (= (and b!745835 res!502665) b!745829))

(assert (= (and b!745829 res!502662) b!745825))

(assert (= (and b!745825 res!502660) b!745841))

(assert (= (and b!745841 res!502663) b!745842))

(assert (= (and b!745842 res!502672) b!745827))

(assert (= (and b!745827 c!81964) b!745826))

(assert (= (and b!745827 (not c!81964)) b!745833))

(assert (= (and b!745827 res!502661) b!745837))

(assert (= (and b!745837 res!502670) b!745838))

(assert (= (and b!745838 res!502664) b!745836))

(assert (= (and b!745838 (not res!502673)) b!745840))

(assert (= (and b!745840 (not res!502658)) b!745828))

(declare-fun m!696151 () Bool)

(assert (=> b!745842 m!696151))

(declare-fun m!696153 () Bool)

(assert (=> b!745832 m!696153))

(declare-fun m!696155 () Bool)

(assert (=> b!745829 m!696155))

(declare-fun m!696157 () Bool)

(assert (=> b!745826 m!696157))

(assert (=> b!745826 m!696157))

(declare-fun m!696159 () Bool)

(assert (=> b!745826 m!696159))

(declare-fun m!696161 () Bool)

(assert (=> b!745835 m!696161))

(assert (=> b!745830 m!696157))

(assert (=> b!745830 m!696157))

(declare-fun m!696163 () Bool)

(assert (=> b!745830 m!696163))

(assert (=> b!745836 m!696157))

(assert (=> b!745836 m!696157))

(declare-fun m!696165 () Bool)

(assert (=> b!745836 m!696165))

(declare-fun m!696167 () Bool)

(assert (=> b!745837 m!696167))

(declare-fun m!696169 () Bool)

(assert (=> b!745837 m!696169))

(declare-fun m!696171 () Bool)

(assert (=> b!745837 m!696171))

(declare-fun m!696173 () Bool)

(assert (=> b!745837 m!696173))

(assert (=> b!745837 m!696169))

(declare-fun m!696175 () Bool)

(assert (=> b!745837 m!696175))

(assert (=> b!745840 m!696171))

(declare-fun m!696177 () Bool)

(assert (=> b!745840 m!696177))

(assert (=> b!745840 m!696157))

(assert (=> b!745840 m!696157))

(declare-fun m!696179 () Bool)

(assert (=> b!745840 m!696179))

(assert (=> b!745838 m!696157))

(assert (=> b!745838 m!696157))

(declare-fun m!696181 () Bool)

(assert (=> b!745838 m!696181))

(declare-fun m!696183 () Bool)

(assert (=> b!745838 m!696183))

(declare-fun m!696185 () Bool)

(assert (=> b!745838 m!696185))

(assert (=> b!745841 m!696157))

(assert (=> b!745841 m!696157))

(declare-fun m!696187 () Bool)

(assert (=> b!745841 m!696187))

(assert (=> b!745841 m!696187))

(assert (=> b!745841 m!696157))

(declare-fun m!696189 () Bool)

(assert (=> b!745841 m!696189))

(assert (=> b!745833 m!696157))

(assert (=> b!745833 m!696157))

(assert (=> b!745833 m!696179))

(declare-fun m!696191 () Bool)

(assert (=> start!65458 m!696191))

(declare-fun m!696193 () Bool)

(assert (=> start!65458 m!696193))

(declare-fun m!696195 () Bool)

(assert (=> b!745831 m!696195))

(declare-fun m!696197 () Bool)

(assert (=> b!745834 m!696197))

(push 1)

(assert (not b!745830))

(assert (not b!745838))

(assert (not b!745841))

(assert (not b!745837))

(assert (not b!745835))

(assert (not b!745833))

(assert (not start!65458))

(assert (not b!745831))

(assert (not b!745840))

(assert (not b!745829))

(assert (not b!745834))

(assert (not b!745832))

(assert (not b!745836))

(assert (not b!745826))

(check-sat)

