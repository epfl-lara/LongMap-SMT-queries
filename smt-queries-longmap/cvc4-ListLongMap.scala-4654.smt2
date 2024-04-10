; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64700 () Bool)

(assert start!64700)

(declare-fun b!729658 () Bool)

(declare-fun res!490043 () Bool)

(declare-fun e!408372 () Bool)

(assert (=> b!729658 (=> (not res!490043) (not e!408372))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729658 (= res!490043 (validKeyInArray!0 k!2102))))

(declare-fun b!729659 () Bool)

(declare-fun res!490038 () Bool)

(declare-fun e!408373 () Bool)

(assert (=> b!729659 (=> (not res!490038) (not e!408373))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41149 0))(
  ( (array!41150 (arr!19694 (Array (_ BitVec 32) (_ BitVec 64))) (size!20115 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41149)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729659 (= res!490038 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20115 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20115 a!3186))))))

(declare-fun b!729660 () Bool)

(assert (=> b!729660 (= e!408372 e!408373)))

(declare-fun res!490051 () Bool)

(assert (=> b!729660 (=> (not res!490051) (not e!408373))))

(declare-datatypes ((SeekEntryResult!7294 0))(
  ( (MissingZero!7294 (index!31544 (_ BitVec 32))) (Found!7294 (index!31545 (_ BitVec 32))) (Intermediate!7294 (undefined!8106 Bool) (index!31546 (_ BitVec 32)) (x!62524 (_ BitVec 32))) (Undefined!7294) (MissingVacant!7294 (index!31547 (_ BitVec 32))) )
))
(declare-fun lt!323271 () SeekEntryResult!7294)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729660 (= res!490051 (or (= lt!323271 (MissingZero!7294 i!1173)) (= lt!323271 (MissingVacant!7294 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729660 (= lt!323271 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729661 () Bool)

(declare-fun e!408375 () Bool)

(declare-fun e!408374 () Bool)

(assert (=> b!729661 (= e!408375 e!408374)))

(declare-fun res!490039 () Bool)

(assert (=> b!729661 (=> (not res!490039) (not e!408374))))

(declare-fun lt!323273 () SeekEntryResult!7294)

(declare-fun lt!323279 () SeekEntryResult!7294)

(assert (=> b!729661 (= res!490039 (= lt!323273 lt!323279))))

(declare-fun lt!323277 () (_ BitVec 64))

(declare-fun lt!323276 () array!41149)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729661 (= lt!323279 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323277 lt!323276 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729661 (= lt!323273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323277 mask!3328) lt!323277 lt!323276 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!729661 (= lt!323277 (select (store (arr!19694 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729661 (= lt!323276 (array!41150 (store (arr!19694 a!3186) i!1173 k!2102) (size!20115 a!3186)))))

(declare-fun b!729662 () Bool)

(declare-fun res!490045 () Bool)

(assert (=> b!729662 (=> (not res!490045) (not e!408375))))

(assert (=> b!729662 (= res!490045 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19694 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729663 () Bool)

(declare-fun res!490048 () Bool)

(assert (=> b!729663 (=> (not res!490048) (not e!408372))))

(assert (=> b!729663 (= res!490048 (validKeyInArray!0 (select (arr!19694 a!3186) j!159)))))

(declare-fun b!729665 () Bool)

(declare-fun res!490050 () Bool)

(assert (=> b!729665 (=> (not res!490050) (not e!408375))))

(declare-fun e!408380 () Bool)

(assert (=> b!729665 (= res!490050 e!408380)))

(declare-fun c!80185 () Bool)

(assert (=> b!729665 (= c!80185 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729666 () Bool)

(declare-fun res!490047 () Bool)

(assert (=> b!729666 (=> (not res!490047) (not e!408372))))

(assert (=> b!729666 (= res!490047 (and (= (size!20115 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20115 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20115 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729667 () Bool)

(declare-fun e!408376 () Bool)

(declare-fun lt!323274 () SeekEntryResult!7294)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!729667 (= e!408376 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323274))))

(declare-fun b!729668 () Bool)

(declare-fun res!490041 () Bool)

(assert (=> b!729668 (=> (not res!490041) (not e!408373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41149 (_ BitVec 32)) Bool)

(assert (=> b!729668 (= res!490041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729669 () Bool)

(declare-fun lt!323272 () SeekEntryResult!7294)

(assert (=> b!729669 (= e!408380 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323272))))

(declare-fun b!729670 () Bool)

(declare-fun res!490037 () Bool)

(assert (=> b!729670 (=> (not res!490037) (not e!408372))))

(declare-fun arrayContainsKey!0 (array!41149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729670 (= res!490037 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729671 () Bool)

(assert (=> b!729671 (= e!408373 e!408375)))

(declare-fun res!490040 () Bool)

(assert (=> b!729671 (=> (not res!490040) (not e!408375))))

(assert (=> b!729671 (= res!490040 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19694 a!3186) j!159) mask!3328) (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323272))))

(assert (=> b!729671 (= lt!323272 (Intermediate!7294 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729672 () Bool)

(declare-fun e!408377 () Bool)

(assert (=> b!729672 (= e!408374 (not e!408377))))

(declare-fun res!490049 () Bool)

(assert (=> b!729672 (=> res!490049 e!408377)))

(assert (=> b!729672 (= res!490049 (or (not (is-Intermediate!7294 lt!323279)) (bvsge x!1131 (x!62524 lt!323279))))))

(declare-fun e!408379 () Bool)

(assert (=> b!729672 e!408379))

(declare-fun res!490052 () Bool)

(assert (=> b!729672 (=> (not res!490052) (not e!408379))))

(assert (=> b!729672 (= res!490052 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24906 0))(
  ( (Unit!24907) )
))
(declare-fun lt!323278 () Unit!24906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24906)

(assert (=> b!729672 (= lt!323278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729673 () Bool)

(declare-fun res!490042 () Bool)

(assert (=> b!729673 (=> (not res!490042) (not e!408373))))

(declare-datatypes ((List!13696 0))(
  ( (Nil!13693) (Cons!13692 (h!14752 (_ BitVec 64)) (t!20011 List!13696)) )
))
(declare-fun arrayNoDuplicates!0 (array!41149 (_ BitVec 32) List!13696) Bool)

(assert (=> b!729673 (= res!490042 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13693))))

(declare-fun b!729664 () Bool)

(assert (=> b!729664 (= e!408380 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) (Found!7294 j!159)))))

(declare-fun res!490046 () Bool)

(assert (=> start!64700 (=> (not res!490046) (not e!408372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64700 (= res!490046 (validMask!0 mask!3328))))

(assert (=> start!64700 e!408372))

(assert (=> start!64700 true))

(declare-fun array_inv!15490 (array!41149) Bool)

(assert (=> start!64700 (array_inv!15490 a!3186)))

(declare-fun b!729674 () Bool)

(assert (=> b!729674 (= e!408379 e!408376)))

(declare-fun res!490044 () Bool)

(assert (=> b!729674 (=> (not res!490044) (not e!408376))))

(assert (=> b!729674 (= res!490044 (= (seekEntryOrOpen!0 (select (arr!19694 a!3186) j!159) a!3186 mask!3328) lt!323274))))

(assert (=> b!729674 (= lt!323274 (Found!7294 j!159))))

(declare-fun b!729675 () Bool)

(assert (=> b!729675 (= e!408377 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!323275 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729675 (= lt!323275 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64700 res!490046) b!729666))

(assert (= (and b!729666 res!490047) b!729663))

(assert (= (and b!729663 res!490048) b!729658))

(assert (= (and b!729658 res!490043) b!729670))

(assert (= (and b!729670 res!490037) b!729660))

(assert (= (and b!729660 res!490051) b!729668))

(assert (= (and b!729668 res!490041) b!729673))

(assert (= (and b!729673 res!490042) b!729659))

(assert (= (and b!729659 res!490038) b!729671))

(assert (= (and b!729671 res!490040) b!729662))

(assert (= (and b!729662 res!490045) b!729665))

(assert (= (and b!729665 c!80185) b!729669))

(assert (= (and b!729665 (not c!80185)) b!729664))

(assert (= (and b!729665 res!490050) b!729661))

(assert (= (and b!729661 res!490039) b!729672))

(assert (= (and b!729672 res!490052) b!729674))

(assert (= (and b!729674 res!490044) b!729667))

(assert (= (and b!729672 (not res!490049)) b!729675))

(declare-fun m!683275 () Bool)

(assert (=> b!729662 m!683275))

(declare-fun m!683277 () Bool)

(assert (=> start!64700 m!683277))

(declare-fun m!683279 () Bool)

(assert (=> start!64700 m!683279))

(declare-fun m!683281 () Bool)

(assert (=> b!729668 m!683281))

(declare-fun m!683283 () Bool)

(assert (=> b!729673 m!683283))

(declare-fun m!683285 () Bool)

(assert (=> b!729670 m!683285))

(declare-fun m!683287 () Bool)

(assert (=> b!729669 m!683287))

(assert (=> b!729669 m!683287))

(declare-fun m!683289 () Bool)

(assert (=> b!729669 m!683289))

(assert (=> b!729671 m!683287))

(assert (=> b!729671 m!683287))

(declare-fun m!683291 () Bool)

(assert (=> b!729671 m!683291))

(assert (=> b!729671 m!683291))

(assert (=> b!729671 m!683287))

(declare-fun m!683293 () Bool)

(assert (=> b!729671 m!683293))

(declare-fun m!683295 () Bool)

(assert (=> b!729672 m!683295))

(declare-fun m!683297 () Bool)

(assert (=> b!729672 m!683297))

(declare-fun m!683299 () Bool)

(assert (=> b!729675 m!683299))

(assert (=> b!729663 m!683287))

(assert (=> b!729663 m!683287))

(declare-fun m!683301 () Bool)

(assert (=> b!729663 m!683301))

(declare-fun m!683303 () Bool)

(assert (=> b!729661 m!683303))

(declare-fun m!683305 () Bool)

(assert (=> b!729661 m!683305))

(assert (=> b!729661 m!683303))

(declare-fun m!683307 () Bool)

(assert (=> b!729661 m!683307))

(declare-fun m!683309 () Bool)

(assert (=> b!729661 m!683309))

(declare-fun m!683311 () Bool)

(assert (=> b!729661 m!683311))

(assert (=> b!729667 m!683287))

(assert (=> b!729667 m!683287))

(declare-fun m!683313 () Bool)

(assert (=> b!729667 m!683313))

(declare-fun m!683315 () Bool)

(assert (=> b!729658 m!683315))

(declare-fun m!683317 () Bool)

(assert (=> b!729660 m!683317))

(assert (=> b!729664 m!683287))

(assert (=> b!729664 m!683287))

(declare-fun m!683319 () Bool)

(assert (=> b!729664 m!683319))

(assert (=> b!729674 m!683287))

(assert (=> b!729674 m!683287))

(declare-fun m!683321 () Bool)

(assert (=> b!729674 m!683321))

(push 1)

(assert (not b!729675))

(assert (not b!729663))

(assert (not b!729661))

(assert (not b!729667))

(assert (not b!729670))

(assert (not b!729672))

(assert (not b!729658))

(assert (not b!729669))

(assert (not start!64700))

(assert (not b!729664))

