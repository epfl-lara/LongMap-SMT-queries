; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64674 () Bool)

(assert start!64674)

(declare-fun b!728956 () Bool)

(declare-fun e!408029 () Bool)

(assert (=> b!728956 (= e!408029 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!322926 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728956 (= lt!322926 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728957 () Bool)

(declare-fun e!408024 () Bool)

(declare-fun e!408023 () Bool)

(assert (=> b!728957 (= e!408024 e!408023)))

(declare-fun res!489417 () Bool)

(assert (=> b!728957 (=> (not res!489417) (not e!408023))))

(declare-datatypes ((array!41123 0))(
  ( (array!41124 (arr!19681 (Array (_ BitVec 32) (_ BitVec 64))) (size!20102 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41123)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7281 0))(
  ( (MissingZero!7281 (index!31492 (_ BitVec 32))) (Found!7281 (index!31493 (_ BitVec 32))) (Intermediate!7281 (undefined!8093 Bool) (index!31494 (_ BitVec 32)) (x!62479 (_ BitVec 32))) (Undefined!7281) (MissingVacant!7281 (index!31495 (_ BitVec 32))) )
))
(declare-fun lt!322923 () SeekEntryResult!7281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41123 (_ BitVec 32)) SeekEntryResult!7281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728957 (= res!489417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19681 a!3186) j!159) mask!3328) (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!322923))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728957 (= lt!322923 (Intermediate!7281 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728958 () Bool)

(declare-fun e!408026 () Bool)

(assert (=> b!728958 (= e!408026 e!408024)))

(declare-fun res!489426 () Bool)

(assert (=> b!728958 (=> (not res!489426) (not e!408024))))

(declare-fun lt!322924 () SeekEntryResult!7281)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728958 (= res!489426 (or (= lt!322924 (MissingZero!7281 i!1173)) (= lt!322924 (MissingVacant!7281 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41123 (_ BitVec 32)) SeekEntryResult!7281)

(assert (=> b!728958 (= lt!322924 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728959 () Bool)

(declare-fun e!408027 () Bool)

(assert (=> b!728959 (= e!408023 e!408027)))

(declare-fun res!489413 () Bool)

(assert (=> b!728959 (=> (not res!489413) (not e!408027))))

(declare-fun lt!322927 () SeekEntryResult!7281)

(declare-fun lt!322921 () SeekEntryResult!7281)

(assert (=> b!728959 (= res!489413 (= lt!322927 lt!322921))))

(declare-fun lt!322922 () array!41123)

(declare-fun lt!322925 () (_ BitVec 64))

(assert (=> b!728959 (= lt!322921 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322925 lt!322922 mask!3328))))

(assert (=> b!728959 (= lt!322927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322925 mask!3328) lt!322925 lt!322922 mask!3328))))

(assert (=> b!728959 (= lt!322925 (select (store (arr!19681 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728959 (= lt!322922 (array!41124 (store (arr!19681 a!3186) i!1173 k0!2102) (size!20102 a!3186)))))

(declare-fun b!728960 () Bool)

(declare-fun e!408021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41123 (_ BitVec 32)) SeekEntryResult!7281)

(assert (=> b!728960 (= e!408021 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) (Found!7281 j!159)))))

(declare-fun res!489418 () Bool)

(assert (=> start!64674 (=> (not res!489418) (not e!408026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64674 (= res!489418 (validMask!0 mask!3328))))

(assert (=> start!64674 e!408026))

(assert (=> start!64674 true))

(declare-fun array_inv!15477 (array!41123) Bool)

(assert (=> start!64674 (array_inv!15477 a!3186)))

(declare-fun b!728961 () Bool)

(declare-fun res!489427 () Bool)

(assert (=> b!728961 (=> (not res!489427) (not e!408023))))

(assert (=> b!728961 (= res!489427 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19681 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728962 () Bool)

(declare-fun res!489425 () Bool)

(assert (=> b!728962 (=> (not res!489425) (not e!408026))))

(declare-fun arrayContainsKey!0 (array!41123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728962 (= res!489425 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728963 () Bool)

(assert (=> b!728963 (= e!408027 (not e!408029))))

(declare-fun res!489421 () Bool)

(assert (=> b!728963 (=> res!489421 e!408029)))

(get-info :version)

(assert (=> b!728963 (= res!489421 (or (not ((_ is Intermediate!7281) lt!322921)) (bvsge x!1131 (x!62479 lt!322921))))))

(declare-fun e!408025 () Bool)

(assert (=> b!728963 e!408025))

(declare-fun res!489423 () Bool)

(assert (=> b!728963 (=> (not res!489423) (not e!408025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41123 (_ BitVec 32)) Bool)

(assert (=> b!728963 (= res!489423 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24880 0))(
  ( (Unit!24881) )
))
(declare-fun lt!322920 () Unit!24880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24880)

(assert (=> b!728963 (= lt!322920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728964 () Bool)

(assert (=> b!728964 (= e!408021 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!322923))))

(declare-fun b!728965 () Bool)

(declare-fun res!489416 () Bool)

(assert (=> b!728965 (=> (not res!489416) (not e!408024))))

(assert (=> b!728965 (= res!489416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728966 () Bool)

(declare-fun res!489415 () Bool)

(assert (=> b!728966 (=> (not res!489415) (not e!408026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728966 (= res!489415 (validKeyInArray!0 k0!2102))))

(declare-fun b!728967 () Bool)

(declare-fun res!489420 () Bool)

(assert (=> b!728967 (=> (not res!489420) (not e!408026))))

(assert (=> b!728967 (= res!489420 (and (= (size!20102 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20102 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20102 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728968 () Bool)

(declare-fun res!489422 () Bool)

(assert (=> b!728968 (=> (not res!489422) (not e!408024))))

(declare-datatypes ((List!13683 0))(
  ( (Nil!13680) (Cons!13679 (h!14739 (_ BitVec 64)) (t!19998 List!13683)) )
))
(declare-fun arrayNoDuplicates!0 (array!41123 (_ BitVec 32) List!13683) Bool)

(assert (=> b!728968 (= res!489422 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13680))))

(declare-fun lt!322928 () SeekEntryResult!7281)

(declare-fun b!728969 () Bool)

(declare-fun e!408028 () Bool)

(assert (=> b!728969 (= e!408028 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!322928))))

(declare-fun b!728970 () Bool)

(declare-fun res!489414 () Bool)

(assert (=> b!728970 (=> (not res!489414) (not e!408023))))

(assert (=> b!728970 (= res!489414 e!408021)))

(declare-fun c!80146 () Bool)

(assert (=> b!728970 (= c!80146 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728971 () Bool)

(declare-fun res!489424 () Bool)

(assert (=> b!728971 (=> (not res!489424) (not e!408024))))

(assert (=> b!728971 (= res!489424 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20102 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20102 a!3186))))))

(declare-fun b!728972 () Bool)

(assert (=> b!728972 (= e!408025 e!408028)))

(declare-fun res!489419 () Bool)

(assert (=> b!728972 (=> (not res!489419) (not e!408028))))

(assert (=> b!728972 (= res!489419 (= (seekEntryOrOpen!0 (select (arr!19681 a!3186) j!159) a!3186 mask!3328) lt!322928))))

(assert (=> b!728972 (= lt!322928 (Found!7281 j!159))))

(declare-fun b!728973 () Bool)

(declare-fun res!489428 () Bool)

(assert (=> b!728973 (=> (not res!489428) (not e!408026))))

(assert (=> b!728973 (= res!489428 (validKeyInArray!0 (select (arr!19681 a!3186) j!159)))))

(assert (= (and start!64674 res!489418) b!728967))

(assert (= (and b!728967 res!489420) b!728973))

(assert (= (and b!728973 res!489428) b!728966))

(assert (= (and b!728966 res!489415) b!728962))

(assert (= (and b!728962 res!489425) b!728958))

(assert (= (and b!728958 res!489426) b!728965))

(assert (= (and b!728965 res!489416) b!728968))

(assert (= (and b!728968 res!489422) b!728971))

(assert (= (and b!728971 res!489424) b!728957))

(assert (= (and b!728957 res!489417) b!728961))

(assert (= (and b!728961 res!489427) b!728970))

(assert (= (and b!728970 c!80146) b!728964))

(assert (= (and b!728970 (not c!80146)) b!728960))

(assert (= (and b!728970 res!489414) b!728959))

(assert (= (and b!728959 res!489413) b!728963))

(assert (= (and b!728963 res!489423) b!728972))

(assert (= (and b!728972 res!489419) b!728969))

(assert (= (and b!728963 (not res!489421)) b!728956))

(declare-fun m!682651 () Bool)

(assert (=> b!728963 m!682651))

(declare-fun m!682653 () Bool)

(assert (=> b!728963 m!682653))

(declare-fun m!682655 () Bool)

(assert (=> b!728973 m!682655))

(assert (=> b!728973 m!682655))

(declare-fun m!682657 () Bool)

(assert (=> b!728973 m!682657))

(assert (=> b!728972 m!682655))

(assert (=> b!728972 m!682655))

(declare-fun m!682659 () Bool)

(assert (=> b!728972 m!682659))

(declare-fun m!682661 () Bool)

(assert (=> b!728956 m!682661))

(declare-fun m!682663 () Bool)

(assert (=> b!728965 m!682663))

(assert (=> b!728969 m!682655))

(assert (=> b!728969 m!682655))

(declare-fun m!682665 () Bool)

(assert (=> b!728969 m!682665))

(declare-fun m!682667 () Bool)

(assert (=> start!64674 m!682667))

(declare-fun m!682669 () Bool)

(assert (=> start!64674 m!682669))

(declare-fun m!682671 () Bool)

(assert (=> b!728959 m!682671))

(declare-fun m!682673 () Bool)

(assert (=> b!728959 m!682673))

(declare-fun m!682675 () Bool)

(assert (=> b!728959 m!682675))

(declare-fun m!682677 () Bool)

(assert (=> b!728959 m!682677))

(assert (=> b!728959 m!682675))

(declare-fun m!682679 () Bool)

(assert (=> b!728959 m!682679))

(assert (=> b!728964 m!682655))

(assert (=> b!728964 m!682655))

(declare-fun m!682681 () Bool)

(assert (=> b!728964 m!682681))

(declare-fun m!682683 () Bool)

(assert (=> b!728958 m!682683))

(assert (=> b!728960 m!682655))

(assert (=> b!728960 m!682655))

(declare-fun m!682685 () Bool)

(assert (=> b!728960 m!682685))

(declare-fun m!682687 () Bool)

(assert (=> b!728961 m!682687))

(declare-fun m!682689 () Bool)

(assert (=> b!728968 m!682689))

(declare-fun m!682691 () Bool)

(assert (=> b!728966 m!682691))

(assert (=> b!728957 m!682655))

(assert (=> b!728957 m!682655))

(declare-fun m!682693 () Bool)

(assert (=> b!728957 m!682693))

(assert (=> b!728957 m!682693))

(assert (=> b!728957 m!682655))

(declare-fun m!682695 () Bool)

(assert (=> b!728957 m!682695))

(declare-fun m!682697 () Bool)

(assert (=> b!728962 m!682697))

(check-sat (not b!728973) (not b!728963) (not start!64674) (not b!728972) (not b!728960) (not b!728969) (not b!728957) (not b!728964) (not b!728965) (not b!728966) (not b!728959) (not b!728956) (not b!728968) (not b!728958) (not b!728962))
(check-sat)
