; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65524 () Bool)

(assert start!65524)

(declare-fun e!417441 () Bool)

(declare-datatypes ((array!41697 0))(
  ( (array!41698 (arr!19962 (Array (_ BitVec 32) (_ BitVec 64))) (size!20383 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41697)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!747730 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7562 0))(
  ( (MissingZero!7562 (index!32616 (_ BitVec 32))) (Found!7562 (index!32617 (_ BitVec 32))) (Intermediate!7562 (undefined!8374 Bool) (index!32618 (_ BitVec 32)) (x!63560 (_ BitVec 32))) (Undefined!7562) (MissingVacant!7562 (index!32619 (_ BitVec 32))) )
))
(declare-fun lt!332373 () SeekEntryResult!7562)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41697 (_ BitVec 32)) SeekEntryResult!7562)

(assert (=> b!747730 (= e!417441 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19962 a!3186) j!159) a!3186 mask!3328) lt!332373))))

(declare-fun b!747731 () Bool)

(declare-fun res!504293 () Bool)

(declare-fun e!417439 () Bool)

(assert (=> b!747731 (=> (not res!504293) (not e!417439))))

(declare-datatypes ((List!13964 0))(
  ( (Nil!13961) (Cons!13960 (h!15032 (_ BitVec 64)) (t!20279 List!13964)) )
))
(declare-fun arrayNoDuplicates!0 (array!41697 (_ BitVec 32) List!13964) Bool)

(assert (=> b!747731 (= res!504293 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13961))))

(declare-fun b!747732 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332369 () SeekEntryResult!7562)

(declare-fun e!417436 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41697 (_ BitVec 32)) SeekEntryResult!7562)

(assert (=> b!747732 (= e!417436 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19962 a!3186) j!159) a!3186 mask!3328) lt!332369))))

(declare-fun res!504304 () Bool)

(declare-fun e!417442 () Bool)

(assert (=> start!65524 (=> (not res!504304) (not e!417442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65524 (= res!504304 (validMask!0 mask!3328))))

(assert (=> start!65524 e!417442))

(assert (=> start!65524 true))

(declare-fun array_inv!15758 (array!41697) Bool)

(assert (=> start!65524 (array_inv!15758 a!3186)))

(declare-fun b!747733 () Bool)

(declare-fun res!504299 () Bool)

(declare-fun e!417438 () Bool)

(assert (=> b!747733 (=> (not res!504299) (not e!417438))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747733 (= res!504299 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19962 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747734 () Bool)

(assert (=> b!747734 (= e!417436 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19962 a!3186) j!159) a!3186 mask!3328) (Found!7562 j!159)))))

(declare-fun b!747735 () Bool)

(declare-fun res!504290 () Bool)

(declare-fun e!417440 () Bool)

(assert (=> b!747735 (=> res!504290 e!417440)))

(declare-fun lt!332368 () (_ BitVec 64))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!747735 (= res!504290 (= (select (store (arr!19962 a!3186) i!1173 k!2102) index!1321) lt!332368))))

(declare-fun b!747736 () Bool)

(declare-fun res!504300 () Bool)

(assert (=> b!747736 (=> (not res!504300) (not e!417442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747736 (= res!504300 (validKeyInArray!0 (select (arr!19962 a!3186) j!159)))))

(declare-fun b!747737 () Bool)

(assert (=> b!747737 (= e!417440 true)))

(assert (=> b!747737 (= (select (store (arr!19962 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25628 0))(
  ( (Unit!25629) )
))
(declare-fun lt!332367 () Unit!25628)

(declare-fun e!417435 () Unit!25628)

(assert (=> b!747737 (= lt!332367 e!417435)))

(declare-fun c!82101 () Bool)

(assert (=> b!747737 (= c!82101 (= (select (store (arr!19962 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747738 () Bool)

(declare-fun res!504294 () Bool)

(assert (=> b!747738 (=> (not res!504294) (not e!417438))))

(assert (=> b!747738 (= res!504294 e!417436)))

(declare-fun c!82102 () Bool)

(assert (=> b!747738 (= c!82102 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747739 () Bool)

(declare-fun Unit!25630 () Unit!25628)

(assert (=> b!747739 (= e!417435 Unit!25630)))

(assert (=> b!747739 false))

(declare-fun b!747740 () Bool)

(declare-fun Unit!25631 () Unit!25628)

(assert (=> b!747740 (= e!417435 Unit!25631)))

(declare-fun b!747741 () Bool)

(declare-fun res!504303 () Bool)

(assert (=> b!747741 (=> (not res!504303) (not e!417442))))

(declare-fun arrayContainsKey!0 (array!41697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747741 (= res!504303 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747742 () Bool)

(declare-fun res!504291 () Bool)

(assert (=> b!747742 (=> (not res!504291) (not e!417442))))

(assert (=> b!747742 (= res!504291 (and (= (size!20383 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20383 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20383 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747743 () Bool)

(declare-fun res!504301 () Bool)

(assert (=> b!747743 (=> res!504301 e!417440)))

(assert (=> b!747743 (= res!504301 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19962 a!3186) j!159) a!3186 mask!3328) lt!332373)))))

(declare-fun b!747744 () Bool)

(declare-fun res!504289 () Bool)

(assert (=> b!747744 (=> (not res!504289) (not e!417439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41697 (_ BitVec 32)) Bool)

(assert (=> b!747744 (= res!504289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747745 () Bool)

(declare-fun res!504305 () Bool)

(assert (=> b!747745 (=> (not res!504305) (not e!417442))))

(assert (=> b!747745 (= res!504305 (validKeyInArray!0 k!2102))))

(declare-fun b!747746 () Bool)

(declare-fun e!417437 () Bool)

(assert (=> b!747746 (= e!417438 e!417437)))

(declare-fun res!504302 () Bool)

(assert (=> b!747746 (=> (not res!504302) (not e!417437))))

(declare-fun lt!332374 () SeekEntryResult!7562)

(declare-fun lt!332371 () SeekEntryResult!7562)

(assert (=> b!747746 (= res!504302 (= lt!332374 lt!332371))))

(declare-fun lt!332375 () array!41697)

(assert (=> b!747746 (= lt!332371 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332368 lt!332375 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747746 (= lt!332374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332368 mask!3328) lt!332368 lt!332375 mask!3328))))

(assert (=> b!747746 (= lt!332368 (select (store (arr!19962 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747746 (= lt!332375 (array!41698 (store (arr!19962 a!3186) i!1173 k!2102) (size!20383 a!3186)))))

(declare-fun b!747747 () Bool)

(assert (=> b!747747 (= e!417439 e!417438)))

(declare-fun res!504292 () Bool)

(assert (=> b!747747 (=> (not res!504292) (not e!417438))))

(assert (=> b!747747 (= res!504292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19962 a!3186) j!159) mask!3328) (select (arr!19962 a!3186) j!159) a!3186 mask!3328) lt!332369))))

(assert (=> b!747747 (= lt!332369 (Intermediate!7562 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747748 () Bool)

(declare-fun res!504298 () Bool)

(assert (=> b!747748 (=> (not res!504298) (not e!417439))))

(assert (=> b!747748 (= res!504298 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20383 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20383 a!3186))))))

(declare-fun b!747749 () Bool)

(assert (=> b!747749 (= e!417442 e!417439)))

(declare-fun res!504296 () Bool)

(assert (=> b!747749 (=> (not res!504296) (not e!417439))))

(declare-fun lt!332366 () SeekEntryResult!7562)

(assert (=> b!747749 (= res!504296 (or (= lt!332366 (MissingZero!7562 i!1173)) (= lt!332366 (MissingVacant!7562 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41697 (_ BitVec 32)) SeekEntryResult!7562)

(assert (=> b!747749 (= lt!332366 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747750 () Bool)

(assert (=> b!747750 (= e!417437 (not e!417440))))

(declare-fun res!504297 () Bool)

(assert (=> b!747750 (=> res!504297 e!417440)))

(assert (=> b!747750 (= res!504297 (or (not (is-Intermediate!7562 lt!332371)) (bvslt x!1131 (x!63560 lt!332371)) (not (= x!1131 (x!63560 lt!332371))) (not (= index!1321 (index!32618 lt!332371)))))))

(assert (=> b!747750 e!417441))

(declare-fun res!504295 () Bool)

(assert (=> b!747750 (=> (not res!504295) (not e!417441))))

(declare-fun lt!332370 () SeekEntryResult!7562)

(assert (=> b!747750 (= res!504295 (= lt!332370 lt!332373))))

(assert (=> b!747750 (= lt!332373 (Found!7562 j!159))))

(assert (=> b!747750 (= lt!332370 (seekEntryOrOpen!0 (select (arr!19962 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747750 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332372 () Unit!25628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25628)

(assert (=> b!747750 (= lt!332372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65524 res!504304) b!747742))

(assert (= (and b!747742 res!504291) b!747736))

(assert (= (and b!747736 res!504300) b!747745))

(assert (= (and b!747745 res!504305) b!747741))

(assert (= (and b!747741 res!504303) b!747749))

(assert (= (and b!747749 res!504296) b!747744))

(assert (= (and b!747744 res!504289) b!747731))

(assert (= (and b!747731 res!504293) b!747748))

(assert (= (and b!747748 res!504298) b!747747))

(assert (= (and b!747747 res!504292) b!747733))

(assert (= (and b!747733 res!504299) b!747738))

(assert (= (and b!747738 c!82102) b!747732))

(assert (= (and b!747738 (not c!82102)) b!747734))

(assert (= (and b!747738 res!504294) b!747746))

(assert (= (and b!747746 res!504302) b!747750))

(assert (= (and b!747750 res!504295) b!747730))

(assert (= (and b!747750 (not res!504297)) b!747743))

(assert (= (and b!747743 (not res!504301)) b!747735))

(assert (= (and b!747735 (not res!504290)) b!747737))

(assert (= (and b!747737 c!82101) b!747739))

(assert (= (and b!747737 (not c!82101)) b!747740))

(declare-fun m!697741 () Bool)

(assert (=> b!747737 m!697741))

(declare-fun m!697743 () Bool)

(assert (=> b!747737 m!697743))

(declare-fun m!697745 () Bool)

(assert (=> b!747750 m!697745))

(assert (=> b!747750 m!697745))

(declare-fun m!697747 () Bool)

(assert (=> b!747750 m!697747))

(declare-fun m!697749 () Bool)

(assert (=> b!747750 m!697749))

(declare-fun m!697751 () Bool)

(assert (=> b!747750 m!697751))

(declare-fun m!697753 () Bool)

(assert (=> start!65524 m!697753))

(declare-fun m!697755 () Bool)

(assert (=> start!65524 m!697755))

(assert (=> b!747730 m!697745))

(assert (=> b!747730 m!697745))

(declare-fun m!697757 () Bool)

(assert (=> b!747730 m!697757))

(assert (=> b!747743 m!697745))

(assert (=> b!747743 m!697745))

(declare-fun m!697759 () Bool)

(assert (=> b!747743 m!697759))

(assert (=> b!747732 m!697745))

(assert (=> b!747732 m!697745))

(declare-fun m!697761 () Bool)

(assert (=> b!747732 m!697761))

(declare-fun m!697763 () Bool)

(assert (=> b!747744 m!697763))

(declare-fun m!697765 () Bool)

(assert (=> b!747745 m!697765))

(declare-fun m!697767 () Bool)

(assert (=> b!747731 m!697767))

(assert (=> b!747736 m!697745))

(assert (=> b!747736 m!697745))

(declare-fun m!697769 () Bool)

(assert (=> b!747736 m!697769))

(declare-fun m!697771 () Bool)

(assert (=> b!747733 m!697771))

(assert (=> b!747735 m!697741))

(assert (=> b!747735 m!697743))

(assert (=> b!747746 m!697741))

(declare-fun m!697773 () Bool)

(assert (=> b!747746 m!697773))

(declare-fun m!697775 () Bool)

(assert (=> b!747746 m!697775))

(declare-fun m!697777 () Bool)

(assert (=> b!747746 m!697777))

(declare-fun m!697779 () Bool)

(assert (=> b!747746 m!697779))

(assert (=> b!747746 m!697775))

(declare-fun m!697781 () Bool)

(assert (=> b!747741 m!697781))

(assert (=> b!747734 m!697745))

(assert (=> b!747734 m!697745))

(assert (=> b!747734 m!697759))

(assert (=> b!747747 m!697745))

(assert (=> b!747747 m!697745))

(declare-fun m!697783 () Bool)

(assert (=> b!747747 m!697783))

(assert (=> b!747747 m!697783))

(assert (=> b!747747 m!697745))

(declare-fun m!697785 () Bool)

(assert (=> b!747747 m!697785))

(declare-fun m!697787 () Bool)

(assert (=> b!747749 m!697787))

(push 1)

