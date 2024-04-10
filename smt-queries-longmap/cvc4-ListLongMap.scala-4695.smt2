; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65234 () Bool)

(assert start!65234)

(declare-fun b!739204 () Bool)

(declare-fun res!497003 () Bool)

(declare-fun e!413365 () Bool)

(assert (=> b!739204 (=> (not res!497003) (not e!413365))))

(declare-datatypes ((array!41407 0))(
  ( (array!41408 (arr!19817 (Array (_ BitVec 32) (_ BitVec 64))) (size!20238 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41407)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41407 (_ BitVec 32)) Bool)

(assert (=> b!739204 (= res!497003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413364 () Bool)

(declare-fun lt!328215 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7417 0))(
  ( (MissingZero!7417 (index!32036 (_ BitVec 32))) (Found!7417 (index!32037 (_ BitVec 32))) (Intermediate!7417 (undefined!8229 Bool) (index!32038 (_ BitVec 32)) (x!63023 (_ BitVec 32))) (Undefined!7417) (MissingVacant!7417 (index!32039 (_ BitVec 32))) )
))
(declare-fun lt!328223 () SeekEntryResult!7417)

(declare-fun b!739205 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739205 (= e!413364 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328215 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328223)))))

(declare-fun b!739206 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!413363 () Bool)

(assert (=> b!739206 (= e!413363 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) (Found!7417 j!159)))))

(declare-fun b!739207 () Bool)

(declare-fun res!497018 () Bool)

(assert (=> b!739207 (=> (not res!497018) (not e!413365))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739207 (= res!497018 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20238 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20238 a!3186))))))

(declare-fun b!739208 () Bool)

(declare-fun res!497007 () Bool)

(declare-fun e!413358 () Bool)

(assert (=> b!739208 (=> (not res!497007) (not e!413358))))

(assert (=> b!739208 (= res!497007 e!413363)))

(declare-fun c!81483 () Bool)

(assert (=> b!739208 (= c!81483 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739209 () Bool)

(declare-fun e!413356 () Bool)

(assert (=> b!739209 (= e!413356 e!413365)))

(declare-fun res!497005 () Bool)

(assert (=> b!739209 (=> (not res!497005) (not e!413365))))

(declare-fun lt!328218 () SeekEntryResult!7417)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739209 (= res!497005 (or (= lt!328218 (MissingZero!7417 i!1173)) (= lt!328218 (MissingVacant!7417 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739209 (= lt!328218 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!497015 () Bool)

(assert (=> start!65234 (=> (not res!497015) (not e!413356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65234 (= res!497015 (validMask!0 mask!3328))))

(assert (=> start!65234 e!413356))

(assert (=> start!65234 true))

(declare-fun array_inv!15613 (array!41407) Bool)

(assert (=> start!65234 (array_inv!15613 a!3186)))

(declare-fun b!739210 () Bool)

(declare-fun res!497016 () Bool)

(declare-fun e!413360 () Bool)

(assert (=> b!739210 (=> res!497016 e!413360)))

(assert (=> b!739210 (= res!497016 e!413364)))

(declare-fun c!81482 () Bool)

(declare-fun lt!328217 () Bool)

(assert (=> b!739210 (= c!81482 lt!328217)))

(declare-fun lt!328220 () SeekEntryResult!7417)

(declare-fun b!739211 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41407 (_ BitVec 32)) SeekEntryResult!7417)

(assert (=> b!739211 (= e!413364 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328215 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328220)))))

(declare-fun b!739212 () Bool)

(assert (=> b!739212 (= e!413363 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328220))))

(declare-fun b!739213 () Bool)

(declare-fun e!413366 () Bool)

(assert (=> b!739213 (= e!413358 e!413366)))

(declare-fun res!497006 () Bool)

(assert (=> b!739213 (=> (not res!497006) (not e!413366))))

(declare-fun lt!328210 () SeekEntryResult!7417)

(declare-fun lt!328216 () SeekEntryResult!7417)

(assert (=> b!739213 (= res!497006 (= lt!328210 lt!328216))))

(declare-fun lt!328211 () array!41407)

(declare-fun lt!328221 () (_ BitVec 64))

(assert (=> b!739213 (= lt!328216 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328221 lt!328211 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739213 (= lt!328210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328221 mask!3328) lt!328221 lt!328211 mask!3328))))

(assert (=> b!739213 (= lt!328221 (select (store (arr!19817 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739213 (= lt!328211 (array!41408 (store (arr!19817 a!3186) i!1173 k!2102) (size!20238 a!3186)))))

(declare-fun b!739214 () Bool)

(assert (=> b!739214 (= e!413365 e!413358)))

(declare-fun res!497011 () Bool)

(assert (=> b!739214 (=> (not res!497011) (not e!413358))))

(assert (=> b!739214 (= res!497011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19817 a!3186) j!159) mask!3328) (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328220))))

(assert (=> b!739214 (= lt!328220 (Intermediate!7417 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!328213 () SeekEntryResult!7417)

(declare-fun e!413362 () Bool)

(declare-fun b!739215 () Bool)

(assert (=> b!739215 (= e!413362 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328213))))

(declare-fun b!739216 () Bool)

(declare-fun res!497004 () Bool)

(assert (=> b!739216 (=> (not res!497004) (not e!413356))))

(declare-fun arrayContainsKey!0 (array!41407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739216 (= res!497004 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739217 () Bool)

(declare-datatypes ((Unit!25264 0))(
  ( (Unit!25265) )
))
(declare-fun e!413357 () Unit!25264)

(declare-fun Unit!25266 () Unit!25264)

(assert (=> b!739217 (= e!413357 Unit!25266)))

(assert (=> b!739217 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328215 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328220)))

(declare-fun b!739218 () Bool)

(declare-fun res!497013 () Bool)

(assert (=> b!739218 (=> (not res!497013) (not e!413356))))

(assert (=> b!739218 (= res!497013 (and (= (size!20238 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20238 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20238 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739219 () Bool)

(declare-fun res!497002 () Bool)

(assert (=> b!739219 (=> (not res!497002) (not e!413356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739219 (= res!497002 (validKeyInArray!0 (select (arr!19817 a!3186) j!159)))))

(declare-fun b!739220 () Bool)

(declare-fun e!413361 () Bool)

(assert (=> b!739220 (= e!413361 e!413362)))

(declare-fun res!497012 () Bool)

(assert (=> b!739220 (=> (not res!497012) (not e!413362))))

(assert (=> b!739220 (= res!497012 (= (seekEntryOrOpen!0 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328213))))

(assert (=> b!739220 (= lt!328213 (Found!7417 j!159))))

(declare-fun b!739221 () Bool)

(declare-fun res!497010 () Bool)

(assert (=> b!739221 (=> (not res!497010) (not e!413356))))

(assert (=> b!739221 (= res!497010 (validKeyInArray!0 k!2102))))

(declare-fun b!739222 () Bool)

(declare-fun res!497001 () Bool)

(assert (=> b!739222 (=> (not res!497001) (not e!413365))))

(declare-datatypes ((List!13819 0))(
  ( (Nil!13816) (Cons!13815 (h!14887 (_ BitVec 64)) (t!20134 List!13819)) )
))
(declare-fun arrayNoDuplicates!0 (array!41407 (_ BitVec 32) List!13819) Bool)

(assert (=> b!739222 (= res!497001 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13816))))

(declare-fun b!739223 () Bool)

(declare-fun Unit!25267 () Unit!25264)

(assert (=> b!739223 (= e!413357 Unit!25267)))

(declare-fun lt!328219 () SeekEntryResult!7417)

(assert (=> b!739223 (= lt!328219 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739223 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328215 resIntermediateIndex!5 (select (arr!19817 a!3186) j!159) a!3186 mask!3328) lt!328223)))

(declare-fun b!739224 () Bool)

(assert (=> b!739224 (= e!413360 true)))

(declare-fun lt!328214 () SeekEntryResult!7417)

(assert (=> b!739224 (= lt!328214 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328215 lt!328221 lt!328211 mask!3328))))

(declare-fun b!739225 () Bool)

(declare-fun e!413355 () Bool)

(assert (=> b!739225 (= e!413366 (not e!413355))))

(declare-fun res!497009 () Bool)

(assert (=> b!739225 (=> res!497009 e!413355)))

(assert (=> b!739225 (= res!497009 (or (not (is-Intermediate!7417 lt!328216)) (bvsge x!1131 (x!63023 lt!328216))))))

(assert (=> b!739225 (= lt!328223 (Found!7417 j!159))))

(assert (=> b!739225 e!413361))

(declare-fun res!497014 () Bool)

(assert (=> b!739225 (=> (not res!497014) (not e!413361))))

(assert (=> b!739225 (= res!497014 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328212 () Unit!25264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25264)

(assert (=> b!739225 (= lt!328212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739226 () Bool)

(declare-fun res!497008 () Bool)

(assert (=> b!739226 (=> (not res!497008) (not e!413358))))

(assert (=> b!739226 (= res!497008 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19817 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739227 () Bool)

(assert (=> b!739227 (= e!413355 e!413360)))

(declare-fun res!497017 () Bool)

(assert (=> b!739227 (=> res!497017 e!413360)))

(assert (=> b!739227 (= res!497017 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328215 #b00000000000000000000000000000000) (bvsge lt!328215 (size!20238 a!3186))))))

(declare-fun lt!328222 () Unit!25264)

(assert (=> b!739227 (= lt!328222 e!413357)))

(declare-fun c!81484 () Bool)

(assert (=> b!739227 (= c!81484 lt!328217)))

(assert (=> b!739227 (= lt!328217 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739227 (= lt!328215 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!65234 res!497015) b!739218))

(assert (= (and b!739218 res!497013) b!739219))

(assert (= (and b!739219 res!497002) b!739221))

(assert (= (and b!739221 res!497010) b!739216))

(assert (= (and b!739216 res!497004) b!739209))

(assert (= (and b!739209 res!497005) b!739204))

(assert (= (and b!739204 res!497003) b!739222))

(assert (= (and b!739222 res!497001) b!739207))

(assert (= (and b!739207 res!497018) b!739214))

(assert (= (and b!739214 res!497011) b!739226))

(assert (= (and b!739226 res!497008) b!739208))

(assert (= (and b!739208 c!81483) b!739212))

(assert (= (and b!739208 (not c!81483)) b!739206))

(assert (= (and b!739208 res!497007) b!739213))

(assert (= (and b!739213 res!497006) b!739225))

(assert (= (and b!739225 res!497014) b!739220))

(assert (= (and b!739220 res!497012) b!739215))

(assert (= (and b!739225 (not res!497009)) b!739227))

(assert (= (and b!739227 c!81484) b!739217))

(assert (= (and b!739227 (not c!81484)) b!739223))

(assert (= (and b!739227 (not res!497017)) b!739210))

(assert (= (and b!739210 c!81482) b!739211))

(assert (= (and b!739210 (not c!81482)) b!739205))

(assert (= (and b!739210 (not res!497016)) b!739224))

(declare-fun m!690643 () Bool)

(assert (=> b!739213 m!690643))

(declare-fun m!690645 () Bool)

(assert (=> b!739213 m!690645))

(declare-fun m!690647 () Bool)

(assert (=> b!739213 m!690647))

(declare-fun m!690649 () Bool)

(assert (=> b!739213 m!690649))

(assert (=> b!739213 m!690643))

(declare-fun m!690651 () Bool)

(assert (=> b!739213 m!690651))

(declare-fun m!690653 () Bool)

(assert (=> b!739223 m!690653))

(assert (=> b!739223 m!690653))

(declare-fun m!690655 () Bool)

(assert (=> b!739223 m!690655))

(assert (=> b!739223 m!690653))

(declare-fun m!690657 () Bool)

(assert (=> b!739223 m!690657))

(assert (=> b!739215 m!690653))

(assert (=> b!739215 m!690653))

(declare-fun m!690659 () Bool)

(assert (=> b!739215 m!690659))

(declare-fun m!690661 () Bool)

(assert (=> b!739227 m!690661))

(assert (=> b!739219 m!690653))

(assert (=> b!739219 m!690653))

(declare-fun m!690663 () Bool)

(assert (=> b!739219 m!690663))

(declare-fun m!690665 () Bool)

(assert (=> b!739216 m!690665))

(assert (=> b!739212 m!690653))

(assert (=> b!739212 m!690653))

(declare-fun m!690667 () Bool)

(assert (=> b!739212 m!690667))

(declare-fun m!690669 () Bool)

(assert (=> b!739225 m!690669))

(declare-fun m!690671 () Bool)

(assert (=> b!739225 m!690671))

(assert (=> b!739214 m!690653))

(assert (=> b!739214 m!690653))

(declare-fun m!690673 () Bool)

(assert (=> b!739214 m!690673))

(assert (=> b!739214 m!690673))

(assert (=> b!739214 m!690653))

(declare-fun m!690675 () Bool)

(assert (=> b!739214 m!690675))

(declare-fun m!690677 () Bool)

(assert (=> b!739221 m!690677))

(declare-fun m!690679 () Bool)

(assert (=> b!739204 m!690679))

(declare-fun m!690681 () Bool)

(assert (=> b!739209 m!690681))

(declare-fun m!690683 () Bool)

(assert (=> b!739224 m!690683))

(assert (=> b!739206 m!690653))

(assert (=> b!739206 m!690653))

(assert (=> b!739206 m!690655))

(declare-fun m!690685 () Bool)

(assert (=> start!65234 m!690685))

(declare-fun m!690687 () Bool)

(assert (=> start!65234 m!690687))

(assert (=> b!739217 m!690653))

(assert (=> b!739217 m!690653))

(declare-fun m!690689 () Bool)

(assert (=> b!739217 m!690689))

(assert (=> b!739211 m!690653))

(assert (=> b!739211 m!690653))

(assert (=> b!739211 m!690689))

(assert (=> b!739220 m!690653))

(assert (=> b!739220 m!690653))

(declare-fun m!690691 () Bool)

(assert (=> b!739220 m!690691))

(assert (=> b!739205 m!690653))

(assert (=> b!739205 m!690653))

(assert (=> b!739205 m!690657))

(declare-fun m!690693 () Bool)

(assert (=> b!739222 m!690693))

(declare-fun m!690695 () Bool)

(assert (=> b!739226 m!690695))

(push 1)

