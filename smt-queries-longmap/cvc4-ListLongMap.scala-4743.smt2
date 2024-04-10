; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65522 () Bool)

(assert start!65522)

(declare-fun b!747666 () Bool)

(declare-fun res!504241 () Bool)

(declare-fun e!417409 () Bool)

(assert (=> b!747666 (=> res!504241 e!417409)))

(declare-datatypes ((array!41695 0))(
  ( (array!41696 (arr!19961 (Array (_ BitVec 32) (_ BitVec 64))) (size!20382 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41695)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332337 () (_ BitVec 64))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!747666 (= res!504241 (= (select (store (arr!19961 a!3186) i!1173 k!2102) index!1321) lt!332337))))

(declare-fun b!747667 () Bool)

(declare-fun res!504242 () Bool)

(declare-fun e!417415 () Bool)

(assert (=> b!747667 (=> (not res!504242) (not e!417415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747667 (= res!504242 (validKeyInArray!0 k!2102))))

(declare-fun b!747668 () Bool)

(declare-fun e!417407 () Bool)

(assert (=> b!747668 (= e!417407 (not e!417409))))

(declare-fun res!504239 () Bool)

(assert (=> b!747668 (=> res!504239 e!417409)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7561 0))(
  ( (MissingZero!7561 (index!32612 (_ BitVec 32))) (Found!7561 (index!32613 (_ BitVec 32))) (Intermediate!7561 (undefined!8373 Bool) (index!32614 (_ BitVec 32)) (x!63551 (_ BitVec 32))) (Undefined!7561) (MissingVacant!7561 (index!32615 (_ BitVec 32))) )
))
(declare-fun lt!332340 () SeekEntryResult!7561)

(assert (=> b!747668 (= res!504239 (or (not (is-Intermediate!7561 lt!332340)) (bvslt x!1131 (x!63551 lt!332340)) (not (= x!1131 (x!63551 lt!332340))) (not (= index!1321 (index!32614 lt!332340)))))))

(declare-fun e!417414 () Bool)

(assert (=> b!747668 e!417414))

(declare-fun res!504251 () Bool)

(assert (=> b!747668 (=> (not res!504251) (not e!417414))))

(declare-fun lt!332341 () SeekEntryResult!7561)

(declare-fun lt!332338 () SeekEntryResult!7561)

(assert (=> b!747668 (= res!504251 (= lt!332341 lt!332338))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747668 (= lt!332338 (Found!7561 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!747668 (= lt!332341 (seekEntryOrOpen!0 (select (arr!19961 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41695 (_ BitVec 32)) Bool)

(assert (=> b!747668 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25624 0))(
  ( (Unit!25625) )
))
(declare-fun lt!332344 () Unit!25624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25624)

(assert (=> b!747668 (= lt!332344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747669 () Bool)

(declare-fun e!417411 () Bool)

(declare-fun e!417410 () Bool)

(assert (=> b!747669 (= e!417411 e!417410)))

(declare-fun res!504243 () Bool)

(assert (=> b!747669 (=> (not res!504243) (not e!417410))))

(declare-fun lt!332345 () SeekEntryResult!7561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747669 (= res!504243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19961 a!3186) j!159) mask!3328) (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332345))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747669 (= lt!332345 (Intermediate!7561 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747670 () Bool)

(declare-fun res!504246 () Bool)

(assert (=> b!747670 (=> (not res!504246) (not e!417415))))

(assert (=> b!747670 (= res!504246 (validKeyInArray!0 (select (arr!19961 a!3186) j!159)))))

(declare-fun b!747672 () Bool)

(declare-fun res!504240 () Bool)

(assert (=> b!747672 (=> (not res!504240) (not e!417410))))

(declare-fun e!417412 () Bool)

(assert (=> b!747672 (= res!504240 e!417412)))

(declare-fun c!82096 () Bool)

(assert (=> b!747672 (= c!82096 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747673 () Bool)

(assert (=> b!747673 (= e!417412 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332345))))

(declare-fun b!747674 () Bool)

(assert (=> b!747674 (= e!417415 e!417411)))

(declare-fun res!504254 () Bool)

(assert (=> b!747674 (=> (not res!504254) (not e!417411))))

(declare-fun lt!332343 () SeekEntryResult!7561)

(assert (=> b!747674 (= res!504254 (or (= lt!332343 (MissingZero!7561 i!1173)) (= lt!332343 (MissingVacant!7561 i!1173))))))

(assert (=> b!747674 (= lt!332343 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747675 () Bool)

(declare-fun e!417416 () Unit!25624)

(declare-fun Unit!25626 () Unit!25624)

(assert (=> b!747675 (= e!417416 Unit!25626)))

(assert (=> b!747675 false))

(declare-fun b!747676 () Bool)

(assert (=> b!747676 (= e!417410 e!417407)))

(declare-fun res!504248 () Bool)

(assert (=> b!747676 (=> (not res!504248) (not e!417407))))

(declare-fun lt!332336 () SeekEntryResult!7561)

(assert (=> b!747676 (= res!504248 (= lt!332336 lt!332340))))

(declare-fun lt!332339 () array!41695)

(assert (=> b!747676 (= lt!332340 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332337 lt!332339 mask!3328))))

(assert (=> b!747676 (= lt!332336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332337 mask!3328) lt!332337 lt!332339 mask!3328))))

(assert (=> b!747676 (= lt!332337 (select (store (arr!19961 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747676 (= lt!332339 (array!41696 (store (arr!19961 a!3186) i!1173 k!2102) (size!20382 a!3186)))))

(declare-fun b!747677 () Bool)

(declare-fun res!504252 () Bool)

(assert (=> b!747677 (=> (not res!504252) (not e!417411))))

(declare-datatypes ((List!13963 0))(
  ( (Nil!13960) (Cons!13959 (h!15031 (_ BitVec 64)) (t!20278 List!13963)) )
))
(declare-fun arrayNoDuplicates!0 (array!41695 (_ BitVec 32) List!13963) Bool)

(assert (=> b!747677 (= res!504252 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13960))))

(declare-fun b!747678 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41695 (_ BitVec 32)) SeekEntryResult!7561)

(assert (=> b!747678 (= e!417414 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332338))))

(declare-fun b!747671 () Bool)

(declare-fun res!504237 () Bool)

(assert (=> b!747671 (=> (not res!504237) (not e!417415))))

(assert (=> b!747671 (= res!504237 (and (= (size!20382 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20382 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20382 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!504250 () Bool)

(assert (=> start!65522 (=> (not res!504250) (not e!417415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65522 (= res!504250 (validMask!0 mask!3328))))

(assert (=> start!65522 e!417415))

(assert (=> start!65522 true))

(declare-fun array_inv!15757 (array!41695) Bool)

(assert (=> start!65522 (array_inv!15757 a!3186)))

(declare-fun b!747679 () Bool)

(declare-fun e!417408 () Bool)

(assert (=> b!747679 (= e!417408 (validKeyInArray!0 lt!332337))))

(declare-fun b!747680 () Bool)

(declare-fun res!504253 () Bool)

(assert (=> b!747680 (=> res!504253 e!417409)))

(assert (=> b!747680 (= res!504253 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) lt!332338)))))

(declare-fun b!747681 () Bool)

(declare-fun res!504249 () Bool)

(assert (=> b!747681 (=> (not res!504249) (not e!417410))))

(assert (=> b!747681 (= res!504249 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19961 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747682 () Bool)

(declare-fun Unit!25627 () Unit!25624)

(assert (=> b!747682 (= e!417416 Unit!25627)))

(declare-fun b!747683 () Bool)

(assert (=> b!747683 (= e!417409 e!417408)))

(declare-fun res!504238 () Bool)

(assert (=> b!747683 (=> res!504238 e!417408)))

(assert (=> b!747683 (= res!504238 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747683 (= (select (store (arr!19961 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332342 () Unit!25624)

(assert (=> b!747683 (= lt!332342 e!417416)))

(declare-fun c!82095 () Bool)

(assert (=> b!747683 (= c!82095 (= (select (store (arr!19961 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747684 () Bool)

(declare-fun res!504244 () Bool)

(assert (=> b!747684 (=> (not res!504244) (not e!417415))))

(declare-fun arrayContainsKey!0 (array!41695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747684 (= res!504244 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747685 () Bool)

(declare-fun res!504245 () Bool)

(assert (=> b!747685 (=> (not res!504245) (not e!417411))))

(assert (=> b!747685 (= res!504245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747686 () Bool)

(declare-fun res!504247 () Bool)

(assert (=> b!747686 (=> (not res!504247) (not e!417411))))

(assert (=> b!747686 (= res!504247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20382 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20382 a!3186))))))

(declare-fun b!747687 () Bool)

(assert (=> b!747687 (= e!417412 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19961 a!3186) j!159) a!3186 mask!3328) (Found!7561 j!159)))))

(assert (= (and start!65522 res!504250) b!747671))

(assert (= (and b!747671 res!504237) b!747670))

(assert (= (and b!747670 res!504246) b!747667))

(assert (= (and b!747667 res!504242) b!747684))

(assert (= (and b!747684 res!504244) b!747674))

(assert (= (and b!747674 res!504254) b!747685))

(assert (= (and b!747685 res!504245) b!747677))

(assert (= (and b!747677 res!504252) b!747686))

(assert (= (and b!747686 res!504247) b!747669))

(assert (= (and b!747669 res!504243) b!747681))

(assert (= (and b!747681 res!504249) b!747672))

(assert (= (and b!747672 c!82096) b!747673))

(assert (= (and b!747672 (not c!82096)) b!747687))

(assert (= (and b!747672 res!504240) b!747676))

(assert (= (and b!747676 res!504248) b!747668))

(assert (= (and b!747668 res!504251) b!747678))

(assert (= (and b!747668 (not res!504239)) b!747680))

(assert (= (and b!747680 (not res!504253)) b!747666))

(assert (= (and b!747666 (not res!504241)) b!747683))

(assert (= (and b!747683 c!82095) b!747675))

(assert (= (and b!747683 (not c!82095)) b!747682))

(assert (= (and b!747683 (not res!504238)) b!747679))

(declare-fun m!697691 () Bool)

(assert (=> b!747667 m!697691))

(declare-fun m!697693 () Bool)

(assert (=> b!747676 m!697693))

(declare-fun m!697695 () Bool)

(assert (=> b!747676 m!697695))

(declare-fun m!697697 () Bool)

(assert (=> b!747676 m!697697))

(declare-fun m!697699 () Bool)

(assert (=> b!747676 m!697699))

(assert (=> b!747676 m!697699))

(declare-fun m!697701 () Bool)

(assert (=> b!747676 m!697701))

(declare-fun m!697703 () Bool)

(assert (=> b!747684 m!697703))

(declare-fun m!697705 () Bool)

(assert (=> b!747670 m!697705))

(assert (=> b!747670 m!697705))

(declare-fun m!697707 () Bool)

(assert (=> b!747670 m!697707))

(declare-fun m!697709 () Bool)

(assert (=> start!65522 m!697709))

(declare-fun m!697711 () Bool)

(assert (=> start!65522 m!697711))

(declare-fun m!697713 () Bool)

(assert (=> b!747679 m!697713))

(assert (=> b!747673 m!697705))

(assert (=> b!747673 m!697705))

(declare-fun m!697715 () Bool)

(assert (=> b!747673 m!697715))

(declare-fun m!697717 () Bool)

(assert (=> b!747681 m!697717))

(assert (=> b!747669 m!697705))

(assert (=> b!747669 m!697705))

(declare-fun m!697719 () Bool)

(assert (=> b!747669 m!697719))

(assert (=> b!747669 m!697719))

(assert (=> b!747669 m!697705))

(declare-fun m!697721 () Bool)

(assert (=> b!747669 m!697721))

(assert (=> b!747666 m!697695))

(declare-fun m!697723 () Bool)

(assert (=> b!747666 m!697723))

(assert (=> b!747687 m!697705))

(assert (=> b!747687 m!697705))

(declare-fun m!697725 () Bool)

(assert (=> b!747687 m!697725))

(assert (=> b!747668 m!697705))

(assert (=> b!747668 m!697705))

(declare-fun m!697727 () Bool)

(assert (=> b!747668 m!697727))

(declare-fun m!697729 () Bool)

(assert (=> b!747668 m!697729))

(declare-fun m!697731 () Bool)

(assert (=> b!747668 m!697731))

(assert (=> b!747683 m!697695))

(assert (=> b!747683 m!697723))

(declare-fun m!697733 () Bool)

(assert (=> b!747685 m!697733))

(assert (=> b!747680 m!697705))

(assert (=> b!747680 m!697705))

(assert (=> b!747680 m!697725))

(assert (=> b!747678 m!697705))

(assert (=> b!747678 m!697705))

(declare-fun m!697735 () Bool)

(assert (=> b!747678 m!697735))

(declare-fun m!697737 () Bool)

(assert (=> b!747677 m!697737))

(declare-fun m!697739 () Bool)

(assert (=> b!747674 m!697739))

(push 1)

