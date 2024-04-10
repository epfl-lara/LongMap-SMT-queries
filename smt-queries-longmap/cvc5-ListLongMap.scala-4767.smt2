; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65662 () Bool)

(assert start!65662)

(declare-fun b!752252 () Bool)

(declare-fun res!508000 () Bool)

(declare-fun e!419612 () Bool)

(assert (=> b!752252 (=> (not res!508000) (not e!419612))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((array!41835 0))(
  ( (array!41836 (arr!20031 (Array (_ BitVec 32) (_ BitVec 64))) (size!20452 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41835)

(assert (=> b!752252 (= res!508000 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20452 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20452 a!3186))))))

(declare-fun b!752253 () Bool)

(declare-fun res!507983 () Bool)

(declare-fun e!419614 () Bool)

(assert (=> b!752253 (=> (not res!507983) (not e!419614))))

(declare-fun lt!334610 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!334603 () array!41835)

(declare-datatypes ((SeekEntryResult!7631 0))(
  ( (MissingZero!7631 (index!32892 (_ BitVec 32))) (Found!7631 (index!32893 (_ BitVec 32))) (Intermediate!7631 (undefined!8443 Bool) (index!32894 (_ BitVec 32)) (x!63813 (_ BitVec 32))) (Undefined!7631) (MissingVacant!7631 (index!32895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41835 (_ BitVec 32)) SeekEntryResult!7631)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41835 (_ BitVec 32)) SeekEntryResult!7631)

(assert (=> b!752253 (= res!507983 (= (seekEntryOrOpen!0 lt!334610 lt!334603 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334610 lt!334603 mask!3328)))))

(declare-fun e!419616 () Bool)

(declare-fun b!752254 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!752254 (= e!419616 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20031 a!3186) j!159) a!3186 mask!3328) (Found!7631 j!159)))))

(declare-fun b!752255 () Bool)

(declare-fun e!419619 () Bool)

(assert (=> b!752255 (= e!419619 e!419612)))

(declare-fun res!507985 () Bool)

(assert (=> b!752255 (=> (not res!507985) (not e!419612))))

(declare-fun lt!334604 () SeekEntryResult!7631)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752255 (= res!507985 (or (= lt!334604 (MissingZero!7631 i!1173)) (= lt!334604 (MissingVacant!7631 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!752255 (= lt!334604 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752256 () Bool)

(declare-fun res!507999 () Bool)

(assert (=> b!752256 (=> (not res!507999) (not e!419612))))

(declare-datatypes ((List!14033 0))(
  ( (Nil!14030) (Cons!14029 (h!15101 (_ BitVec 64)) (t!20348 List!14033)) )
))
(declare-fun arrayNoDuplicates!0 (array!41835 (_ BitVec 32) List!14033) Bool)

(assert (=> b!752256 (= res!507999 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14030))))

(declare-fun b!752257 () Bool)

(declare-fun res!507996 () Bool)

(declare-fun e!419621 () Bool)

(assert (=> b!752257 (=> (not res!507996) (not e!419621))))

(assert (=> b!752257 (= res!507996 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20031 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752258 () Bool)

(declare-fun e!419613 () Bool)

(assert (=> b!752258 (= e!419613 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!752258 e!419614))

(declare-fun res!507986 () Bool)

(assert (=> b!752258 (=> (not res!507986) (not e!419614))))

(declare-fun lt!334606 () (_ BitVec 64))

(assert (=> b!752258 (= res!507986 (= lt!334606 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25904 0))(
  ( (Unit!25905) )
))
(declare-fun lt!334612 () Unit!25904)

(declare-fun e!419618 () Unit!25904)

(assert (=> b!752258 (= lt!334612 e!419618)))

(declare-fun c!82516 () Bool)

(assert (=> b!752258 (= c!82516 (= lt!334606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752259 () Bool)

(assert (=> b!752259 (= e!419612 e!419621)))

(declare-fun res!507994 () Bool)

(assert (=> b!752259 (=> (not res!507994) (not e!419621))))

(declare-fun lt!334613 () SeekEntryResult!7631)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41835 (_ BitVec 32)) SeekEntryResult!7631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752259 (= res!507994 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20031 a!3186) j!159) mask!3328) (select (arr!20031 a!3186) j!159) a!3186 mask!3328) lt!334613))))

(assert (=> b!752259 (= lt!334613 (Intermediate!7631 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752260 () Bool)

(declare-fun res!508001 () Bool)

(assert (=> b!752260 (=> (not res!508001) (not e!419619))))

(declare-fun arrayContainsKey!0 (array!41835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752260 (= res!508001 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752261 () Bool)

(declare-fun res!507991 () Bool)

(assert (=> b!752261 (=> (not res!507991) (not e!419619))))

(assert (=> b!752261 (= res!507991 (and (= (size!20452 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20452 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20452 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752262 () Bool)

(declare-fun res!507984 () Bool)

(assert (=> b!752262 (=> (not res!507984) (not e!419619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752262 (= res!507984 (validKeyInArray!0 k!2102))))

(declare-fun res!507998 () Bool)

(assert (=> start!65662 (=> (not res!507998) (not e!419619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65662 (= res!507998 (validMask!0 mask!3328))))

(assert (=> start!65662 e!419619))

(assert (=> start!65662 true))

(declare-fun array_inv!15827 (array!41835) Bool)

(assert (=> start!65662 (array_inv!15827 a!3186)))

(declare-fun b!752263 () Bool)

(declare-fun e!419615 () Bool)

(declare-fun e!419611 () Bool)

(assert (=> b!752263 (= e!419615 (not e!419611))))

(declare-fun res!507987 () Bool)

(assert (=> b!752263 (=> res!507987 e!419611)))

(declare-fun lt!334605 () SeekEntryResult!7631)

(assert (=> b!752263 (= res!507987 (or (not (is-Intermediate!7631 lt!334605)) (bvslt x!1131 (x!63813 lt!334605)) (not (= x!1131 (x!63813 lt!334605))) (not (= index!1321 (index!32894 lt!334605)))))))

(declare-fun e!419617 () Bool)

(assert (=> b!752263 e!419617))

(declare-fun res!507992 () Bool)

(assert (=> b!752263 (=> (not res!507992) (not e!419617))))

(declare-fun lt!334611 () SeekEntryResult!7631)

(declare-fun lt!334602 () SeekEntryResult!7631)

(assert (=> b!752263 (= res!507992 (= lt!334611 lt!334602))))

(assert (=> b!752263 (= lt!334602 (Found!7631 j!159))))

(assert (=> b!752263 (= lt!334611 (seekEntryOrOpen!0 (select (arr!20031 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41835 (_ BitVec 32)) Bool)

(assert (=> b!752263 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334607 () Unit!25904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25904)

(assert (=> b!752263 (= lt!334607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752264 () Bool)

(declare-fun res!507993 () Bool)

(assert (=> b!752264 (=> (not res!507993) (not e!419619))))

(assert (=> b!752264 (= res!507993 (validKeyInArray!0 (select (arr!20031 a!3186) j!159)))))

(declare-fun b!752265 () Bool)

(declare-fun res!507995 () Bool)

(assert (=> b!752265 (=> (not res!507995) (not e!419621))))

(assert (=> b!752265 (= res!507995 e!419616)))

(declare-fun c!82515 () Bool)

(assert (=> b!752265 (= c!82515 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752266 () Bool)

(declare-fun res!507997 () Bool)

(assert (=> b!752266 (=> (not res!507997) (not e!419612))))

(assert (=> b!752266 (= res!507997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752267 () Bool)

(assert (=> b!752267 (= e!419616 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20031 a!3186) j!159) a!3186 mask!3328) lt!334613))))

(declare-fun b!752268 () Bool)

(assert (=> b!752268 (= e!419621 e!419615)))

(declare-fun res!507990 () Bool)

(assert (=> b!752268 (=> (not res!507990) (not e!419615))))

(declare-fun lt!334609 () SeekEntryResult!7631)

(assert (=> b!752268 (= res!507990 (= lt!334609 lt!334605))))

(assert (=> b!752268 (= lt!334605 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334610 lt!334603 mask!3328))))

(assert (=> b!752268 (= lt!334609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334610 mask!3328) lt!334610 lt!334603 mask!3328))))

(assert (=> b!752268 (= lt!334610 (select (store (arr!20031 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752268 (= lt!334603 (array!41836 (store (arr!20031 a!3186) i!1173 k!2102) (size!20452 a!3186)))))

(declare-fun b!752269 () Bool)

(declare-fun Unit!25906 () Unit!25904)

(assert (=> b!752269 (= e!419618 Unit!25906)))

(declare-fun b!752270 () Bool)

(declare-fun Unit!25907 () Unit!25904)

(assert (=> b!752270 (= e!419618 Unit!25907)))

(assert (=> b!752270 false))

(declare-fun b!752271 () Bool)

(declare-fun lt!334608 () SeekEntryResult!7631)

(assert (=> b!752271 (= e!419614 (= lt!334611 lt!334608))))

(declare-fun b!752272 () Bool)

(assert (=> b!752272 (= e!419617 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20031 a!3186) j!159) a!3186 mask!3328) lt!334602))))

(declare-fun b!752273 () Bool)

(declare-fun e!419610 () Bool)

(assert (=> b!752273 (= e!419611 e!419610)))

(declare-fun res!507988 () Bool)

(assert (=> b!752273 (=> res!507988 e!419610)))

(assert (=> b!752273 (= res!507988 (not (= lt!334608 lt!334602)))))

(assert (=> b!752273 (= lt!334608 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20031 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752274 () Bool)

(assert (=> b!752274 (= e!419610 e!419613)))

(declare-fun res!507989 () Bool)

(assert (=> b!752274 (=> res!507989 e!419613)))

(assert (=> b!752274 (= res!507989 (= lt!334606 lt!334610))))

(assert (=> b!752274 (= lt!334606 (select (store (arr!20031 a!3186) i!1173 k!2102) index!1321))))

(assert (= (and start!65662 res!507998) b!752261))

(assert (= (and b!752261 res!507991) b!752264))

(assert (= (and b!752264 res!507993) b!752262))

(assert (= (and b!752262 res!507984) b!752260))

(assert (= (and b!752260 res!508001) b!752255))

(assert (= (and b!752255 res!507985) b!752266))

(assert (= (and b!752266 res!507997) b!752256))

(assert (= (and b!752256 res!507999) b!752252))

(assert (= (and b!752252 res!508000) b!752259))

(assert (= (and b!752259 res!507994) b!752257))

(assert (= (and b!752257 res!507996) b!752265))

(assert (= (and b!752265 c!82515) b!752267))

(assert (= (and b!752265 (not c!82515)) b!752254))

(assert (= (and b!752265 res!507995) b!752268))

(assert (= (and b!752268 res!507990) b!752263))

(assert (= (and b!752263 res!507992) b!752272))

(assert (= (and b!752263 (not res!507987)) b!752273))

(assert (= (and b!752273 (not res!507988)) b!752274))

(assert (= (and b!752274 (not res!507989)) b!752258))

(assert (= (and b!752258 c!82516) b!752270))

(assert (= (and b!752258 (not c!82516)) b!752269))

(assert (= (and b!752258 res!507986) b!752253))

(assert (= (and b!752253 res!507983) b!752271))

(declare-fun m!701239 () Bool)

(assert (=> b!752257 m!701239))

(declare-fun m!701241 () Bool)

(assert (=> b!752266 m!701241))

(declare-fun m!701243 () Bool)

(assert (=> b!752253 m!701243))

(declare-fun m!701245 () Bool)

(assert (=> b!752253 m!701245))

(declare-fun m!701247 () Bool)

(assert (=> b!752264 m!701247))

(assert (=> b!752264 m!701247))

(declare-fun m!701249 () Bool)

(assert (=> b!752264 m!701249))

(assert (=> b!752254 m!701247))

(assert (=> b!752254 m!701247))

(declare-fun m!701251 () Bool)

(assert (=> b!752254 m!701251))

(assert (=> b!752263 m!701247))

(assert (=> b!752263 m!701247))

(declare-fun m!701253 () Bool)

(assert (=> b!752263 m!701253))

(declare-fun m!701255 () Bool)

(assert (=> b!752263 m!701255))

(declare-fun m!701257 () Bool)

(assert (=> b!752263 m!701257))

(declare-fun m!701259 () Bool)

(assert (=> b!752255 m!701259))

(assert (=> b!752259 m!701247))

(assert (=> b!752259 m!701247))

(declare-fun m!701261 () Bool)

(assert (=> b!752259 m!701261))

(assert (=> b!752259 m!701261))

(assert (=> b!752259 m!701247))

(declare-fun m!701263 () Bool)

(assert (=> b!752259 m!701263))

(declare-fun m!701265 () Bool)

(assert (=> b!752274 m!701265))

(declare-fun m!701267 () Bool)

(assert (=> b!752274 m!701267))

(declare-fun m!701269 () Bool)

(assert (=> b!752256 m!701269))

(declare-fun m!701271 () Bool)

(assert (=> start!65662 m!701271))

(declare-fun m!701273 () Bool)

(assert (=> start!65662 m!701273))

(declare-fun m!701275 () Bool)

(assert (=> b!752262 m!701275))

(declare-fun m!701277 () Bool)

(assert (=> b!752260 m!701277))

(assert (=> b!752267 m!701247))

(assert (=> b!752267 m!701247))

(declare-fun m!701279 () Bool)

(assert (=> b!752267 m!701279))

(assert (=> b!752272 m!701247))

(assert (=> b!752272 m!701247))

(declare-fun m!701281 () Bool)

(assert (=> b!752272 m!701281))

(declare-fun m!701283 () Bool)

(assert (=> b!752268 m!701283))

(assert (=> b!752268 m!701283))

(declare-fun m!701285 () Bool)

(assert (=> b!752268 m!701285))

(assert (=> b!752268 m!701265))

(declare-fun m!701287 () Bool)

(assert (=> b!752268 m!701287))

(declare-fun m!701289 () Bool)

(assert (=> b!752268 m!701289))

(assert (=> b!752273 m!701247))

(assert (=> b!752273 m!701247))

(assert (=> b!752273 m!701251))

(push 1)

(assert (not b!752260))

(assert (not b!752256))

(assert (not b!752259))

(assert (not b!752263))

(assert (not b!752253))

(assert (not b!752272))

(assert (not b!752266))

(assert (not b!752273))

(assert (not start!65662))

(assert (not b!752264))

(assert (not b!752255))

(assert (not b!752268))

(assert (not b!752262))

(assert (not b!752267))

(assert (not b!752254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

