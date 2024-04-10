; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65162 () Bool)

(assert start!65162)

(declare-fun b!736613 () Bool)

(declare-fun res!495064 () Bool)

(declare-fun e!412065 () Bool)

(assert (=> b!736613 (=> (not res!495064) (not e!412065))))

(declare-datatypes ((array!41335 0))(
  ( (array!41336 (arr!19781 (Array (_ BitVec 32) (_ BitVec 64))) (size!20202 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41335)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41335 (_ BitVec 32)) Bool)

(assert (=> b!736613 (= res!495064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7381 0))(
  ( (MissingZero!7381 (index!31892 (_ BitVec 32))) (Found!7381 (index!31893 (_ BitVec 32))) (Intermediate!7381 (undefined!8193 Bool) (index!31894 (_ BitVec 32)) (x!62891 (_ BitVec 32))) (Undefined!7381) (MissingVacant!7381 (index!31895 (_ BitVec 32))) )
))
(declare-fun lt!326703 () SeekEntryResult!7381)

(declare-fun e!412064 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!736614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!736614 (= e!412064 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326703))))

(declare-fun b!736615 () Bool)

(declare-fun e!412070 () Bool)

(declare-fun e!412067 () Bool)

(assert (=> b!736615 (= e!412070 (not e!412067))))

(declare-fun res!495061 () Bool)

(assert (=> b!736615 (=> res!495061 e!412067)))

(declare-fun lt!326705 () SeekEntryResult!7381)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!736615 (= res!495061 (or (not (is-Intermediate!7381 lt!326705)) (bvsge x!1131 (x!62891 lt!326705))))))

(declare-fun lt!326699 () SeekEntryResult!7381)

(assert (=> b!736615 (= lt!326699 (Found!7381 j!159))))

(declare-fun e!412060 () Bool)

(assert (=> b!736615 e!412060))

(declare-fun res!495070 () Bool)

(assert (=> b!736615 (=> (not res!495070) (not e!412060))))

(assert (=> b!736615 (= res!495070 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25120 0))(
  ( (Unit!25121) )
))
(declare-fun lt!326709 () Unit!25120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25120)

(assert (=> b!736615 (= lt!326709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736616 () Bool)

(declare-fun res!495072 () Bool)

(declare-fun e!412063 () Bool)

(assert (=> b!736616 (=> res!495072 e!412063)))

(declare-fun e!412059 () Bool)

(assert (=> b!736616 (= res!495072 e!412059)))

(declare-fun c!81159 () Bool)

(declare-fun lt!326711 () Bool)

(assert (=> b!736616 (= c!81159 lt!326711)))

(declare-fun b!736617 () Bool)

(declare-fun e!412061 () Bool)

(assert (=> b!736617 (= e!412061 e!412070)))

(declare-fun res!495063 () Bool)

(assert (=> b!736617 (=> (not res!495063) (not e!412070))))

(declare-fun lt!326702 () SeekEntryResult!7381)

(assert (=> b!736617 (= res!495063 (= lt!326702 lt!326705))))

(declare-fun lt!326707 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326706 () array!41335)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!736617 (= lt!326705 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326707 lt!326706 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736617 (= lt!326702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326707 mask!3328) lt!326707 lt!326706 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736617 (= lt!326707 (select (store (arr!19781 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736617 (= lt!326706 (array!41336 (store (arr!19781 a!3186) i!1173 k!2102) (size!20202 a!3186)))))

(declare-fun b!736618 () Bool)

(declare-fun res!495059 () Bool)

(assert (=> b!736618 (=> (not res!495059) (not e!412061))))

(assert (=> b!736618 (= res!495059 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19781 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736619 () Bool)

(assert (=> b!736619 (= e!412063 true)))

(declare-fun lt!326700 () (_ BitVec 32))

(declare-fun lt!326701 () SeekEntryResult!7381)

(assert (=> b!736619 (= lt!326701 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326700 lt!326707 lt!326706 mask!3328))))

(declare-fun b!736620 () Bool)

(declare-fun e!412069 () Bool)

(assert (=> b!736620 (= e!412069 e!412065)))

(declare-fun res!495058 () Bool)

(assert (=> b!736620 (=> (not res!495058) (not e!412065))))

(declare-fun lt!326704 () SeekEntryResult!7381)

(assert (=> b!736620 (= res!495058 (or (= lt!326704 (MissingZero!7381 i!1173)) (= lt!326704 (MissingVacant!7381 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41335 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!736620 (= lt!326704 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736621 () Bool)

(declare-fun res!495060 () Bool)

(assert (=> b!736621 (=> (not res!495060) (not e!412069))))

(assert (=> b!736621 (= res!495060 (and (= (size!20202 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20202 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20202 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!412062 () Bool)

(declare-fun b!736622 () Bool)

(assert (=> b!736622 (= e!412062 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) (Found!7381 j!159)))))

(declare-fun b!736612 () Bool)

(assert (=> b!736612 (= e!412060 e!412064)))

(declare-fun res!495066 () Bool)

(assert (=> b!736612 (=> (not res!495066) (not e!412064))))

(assert (=> b!736612 (= res!495066 (= (seekEntryOrOpen!0 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326703))))

(assert (=> b!736612 (= lt!326703 (Found!7381 j!159))))

(declare-fun res!495073 () Bool)

(assert (=> start!65162 (=> (not res!495073) (not e!412069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65162 (= res!495073 (validMask!0 mask!3328))))

(assert (=> start!65162 e!412069))

(assert (=> start!65162 true))

(declare-fun array_inv!15577 (array!41335) Bool)

(assert (=> start!65162 (array_inv!15577 a!3186)))

(declare-fun b!736623 () Bool)

(declare-fun res!495068 () Bool)

(assert (=> b!736623 (=> (not res!495068) (not e!412061))))

(assert (=> b!736623 (= res!495068 e!412062)))

(declare-fun c!81158 () Bool)

(assert (=> b!736623 (= c!81158 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736624 () Bool)

(declare-fun res!495065 () Bool)

(assert (=> b!736624 (=> (not res!495065) (not e!412069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736624 (= res!495065 (validKeyInArray!0 (select (arr!19781 a!3186) j!159)))))

(declare-fun b!736625 () Bool)

(declare-fun e!412068 () Unit!25120)

(declare-fun Unit!25122 () Unit!25120)

(assert (=> b!736625 (= e!412068 Unit!25122)))

(declare-fun lt!326698 () SeekEntryResult!7381)

(assert (=> b!736625 (= lt!326698 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736625 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326700 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326699)))

(declare-fun lt!326708 () SeekEntryResult!7381)

(declare-fun b!736626 () Bool)

(assert (=> b!736626 (= e!412059 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326700 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326708)))))

(declare-fun b!736627 () Bool)

(declare-fun res!495062 () Bool)

(assert (=> b!736627 (=> (not res!495062) (not e!412069))))

(declare-fun arrayContainsKey!0 (array!41335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736627 (= res!495062 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736628 () Bool)

(assert (=> b!736628 (= e!412065 e!412061)))

(declare-fun res!495057 () Bool)

(assert (=> b!736628 (=> (not res!495057) (not e!412061))))

(assert (=> b!736628 (= res!495057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19781 a!3186) j!159) mask!3328) (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326708))))

(assert (=> b!736628 (= lt!326708 (Intermediate!7381 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736629 () Bool)

(declare-fun res!495074 () Bool)

(assert (=> b!736629 (=> (not res!495074) (not e!412065))))

(assert (=> b!736629 (= res!495074 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20202 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20202 a!3186))))))

(declare-fun b!736630 () Bool)

(assert (=> b!736630 (= e!412067 e!412063)))

(declare-fun res!495071 () Bool)

(assert (=> b!736630 (=> res!495071 e!412063)))

(assert (=> b!736630 (= res!495071 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326700 #b00000000000000000000000000000000) (bvsge lt!326700 (size!20202 a!3186))))))

(declare-fun lt!326710 () Unit!25120)

(assert (=> b!736630 (= lt!326710 e!412068)))

(declare-fun c!81160 () Bool)

(assert (=> b!736630 (= c!81160 lt!326711)))

(assert (=> b!736630 (= lt!326711 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736630 (= lt!326700 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736631 () Bool)

(assert (=> b!736631 (= e!412062 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326708))))

(declare-fun b!736632 () Bool)

(declare-fun Unit!25123 () Unit!25120)

(assert (=> b!736632 (= e!412068 Unit!25123)))

(assert (=> b!736632 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326700 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326708)))

(declare-fun b!736633 () Bool)

(assert (=> b!736633 (= e!412059 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326700 resIntermediateIndex!5 (select (arr!19781 a!3186) j!159) a!3186 mask!3328) lt!326699)))))

(declare-fun b!736634 () Bool)

(declare-fun res!495069 () Bool)

(assert (=> b!736634 (=> (not res!495069) (not e!412065))))

(declare-datatypes ((List!13783 0))(
  ( (Nil!13780) (Cons!13779 (h!14851 (_ BitVec 64)) (t!20098 List!13783)) )
))
(declare-fun arrayNoDuplicates!0 (array!41335 (_ BitVec 32) List!13783) Bool)

(assert (=> b!736634 (= res!495069 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13780))))

(declare-fun b!736635 () Bool)

(declare-fun res!495067 () Bool)

(assert (=> b!736635 (=> (not res!495067) (not e!412069))))

(assert (=> b!736635 (= res!495067 (validKeyInArray!0 k!2102))))

(assert (= (and start!65162 res!495073) b!736621))

(assert (= (and b!736621 res!495060) b!736624))

(assert (= (and b!736624 res!495065) b!736635))

(assert (= (and b!736635 res!495067) b!736627))

(assert (= (and b!736627 res!495062) b!736620))

(assert (= (and b!736620 res!495058) b!736613))

(assert (= (and b!736613 res!495064) b!736634))

(assert (= (and b!736634 res!495069) b!736629))

(assert (= (and b!736629 res!495074) b!736628))

(assert (= (and b!736628 res!495057) b!736618))

(assert (= (and b!736618 res!495059) b!736623))

(assert (= (and b!736623 c!81158) b!736631))

(assert (= (and b!736623 (not c!81158)) b!736622))

(assert (= (and b!736623 res!495068) b!736617))

(assert (= (and b!736617 res!495063) b!736615))

(assert (= (and b!736615 res!495070) b!736612))

(assert (= (and b!736612 res!495066) b!736614))

(assert (= (and b!736615 (not res!495061)) b!736630))

(assert (= (and b!736630 c!81160) b!736632))

(assert (= (and b!736630 (not c!81160)) b!736625))

(assert (= (and b!736630 (not res!495071)) b!736616))

(assert (= (and b!736616 c!81159) b!736626))

(assert (= (and b!736616 (not c!81159)) b!736633))

(assert (= (and b!736616 (not res!495072)) b!736619))

(declare-fun m!688699 () Bool)

(assert (=> b!736615 m!688699))

(declare-fun m!688701 () Bool)

(assert (=> b!736615 m!688701))

(declare-fun m!688703 () Bool)

(assert (=> b!736618 m!688703))

(declare-fun m!688705 () Bool)

(assert (=> b!736625 m!688705))

(assert (=> b!736625 m!688705))

(declare-fun m!688707 () Bool)

(assert (=> b!736625 m!688707))

(assert (=> b!736625 m!688705))

(declare-fun m!688709 () Bool)

(assert (=> b!736625 m!688709))

(assert (=> b!736628 m!688705))

(assert (=> b!736628 m!688705))

(declare-fun m!688711 () Bool)

(assert (=> b!736628 m!688711))

(assert (=> b!736628 m!688711))

(assert (=> b!736628 m!688705))

(declare-fun m!688713 () Bool)

(assert (=> b!736628 m!688713))

(assert (=> b!736631 m!688705))

(assert (=> b!736631 m!688705))

(declare-fun m!688715 () Bool)

(assert (=> b!736631 m!688715))

(assert (=> b!736622 m!688705))

(assert (=> b!736622 m!688705))

(assert (=> b!736622 m!688707))

(assert (=> b!736626 m!688705))

(assert (=> b!736626 m!688705))

(declare-fun m!688717 () Bool)

(assert (=> b!736626 m!688717))

(assert (=> b!736624 m!688705))

(assert (=> b!736624 m!688705))

(declare-fun m!688719 () Bool)

(assert (=> b!736624 m!688719))

(declare-fun m!688721 () Bool)

(assert (=> b!736620 m!688721))

(assert (=> b!736612 m!688705))

(assert (=> b!736612 m!688705))

(declare-fun m!688723 () Bool)

(assert (=> b!736612 m!688723))

(assert (=> b!736614 m!688705))

(assert (=> b!736614 m!688705))

(declare-fun m!688725 () Bool)

(assert (=> b!736614 m!688725))

(declare-fun m!688727 () Bool)

(assert (=> b!736613 m!688727))

(assert (=> b!736633 m!688705))

(assert (=> b!736633 m!688705))

(assert (=> b!736633 m!688709))

(assert (=> b!736632 m!688705))

(assert (=> b!736632 m!688705))

(assert (=> b!736632 m!688717))

(declare-fun m!688729 () Bool)

(assert (=> b!736634 m!688729))

(declare-fun m!688731 () Bool)

(assert (=> b!736630 m!688731))

(declare-fun m!688733 () Bool)

(assert (=> start!65162 m!688733))

(declare-fun m!688735 () Bool)

(assert (=> start!65162 m!688735))

(declare-fun m!688737 () Bool)

(assert (=> b!736627 m!688737))

(declare-fun m!688739 () Bool)

(assert (=> b!736619 m!688739))

(declare-fun m!688741 () Bool)

(assert (=> b!736617 m!688741))

(declare-fun m!688743 () Bool)

(assert (=> b!736617 m!688743))

(declare-fun m!688745 () Bool)

(assert (=> b!736617 m!688745))

(declare-fun m!688747 () Bool)

(assert (=> b!736617 m!688747))

(assert (=> b!736617 m!688743))

(declare-fun m!688749 () Bool)

(assert (=> b!736617 m!688749))

(declare-fun m!688751 () Bool)

(assert (=> b!736635 m!688751))

(push 1)

