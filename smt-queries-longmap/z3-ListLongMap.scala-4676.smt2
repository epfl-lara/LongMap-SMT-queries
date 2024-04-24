; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65244 () Bool)

(assert start!65244)

(declare-fun b!735736 () Bool)

(declare-fun res!494131 () Bool)

(declare-fun e!411723 () Bool)

(assert (=> b!735736 (=> (not res!494131) (not e!411723))))

(declare-datatypes ((array!41287 0))(
  ( (array!41288 (arr!19753 (Array (_ BitVec 32) (_ BitVec 64))) (size!20173 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41287)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!735736 (= res!494131 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19753 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735737 () Bool)

(declare-fun e!411728 () Bool)

(assert (=> b!735737 (= e!411728 e!411723)))

(declare-fun res!494138 () Bool)

(assert (=> b!735737 (=> (not res!494138) (not e!411723))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7309 0))(
  ( (MissingZero!7309 (index!31604 (_ BitVec 32))) (Found!7309 (index!31605 (_ BitVec 32))) (Intermediate!7309 (undefined!8121 Bool) (index!31606 (_ BitVec 32)) (x!62775 (_ BitVec 32))) (Undefined!7309) (MissingVacant!7309 (index!31607 (_ BitVec 32))) )
))
(declare-fun lt!326073 () SeekEntryResult!7309)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735737 (= res!494138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19753 a!3186) j!159) mask!3328) (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!326073))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735737 (= lt!326073 (Intermediate!7309 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735739 () Bool)

(declare-fun lt!326075 () SeekEntryResult!7309)

(declare-fun e!411724 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!735739 (= e!411724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!326075))))

(declare-fun b!735740 () Bool)

(declare-fun res!494134 () Bool)

(declare-fun e!411732 () Bool)

(assert (=> b!735740 (=> (not res!494134) (not e!411732))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735740 (= res!494134 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735741 () Bool)

(declare-fun e!411731 () Bool)

(declare-fun e!411726 () Bool)

(assert (=> b!735741 (= e!411731 (not e!411726))))

(declare-fun res!494143 () Bool)

(assert (=> b!735741 (=> res!494143 e!411726)))

(declare-fun lt!326076 () SeekEntryResult!7309)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!735741 (= res!494143 (or (not ((_ is Intermediate!7309) lt!326076)) (bvsge x!1131 (x!62775 lt!326076))))))

(declare-fun e!411730 () Bool)

(assert (=> b!735741 e!411730))

(declare-fun res!494127 () Bool)

(assert (=> b!735741 (=> (not res!494127) (not e!411730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41287 (_ BitVec 32)) Bool)

(assert (=> b!735741 (= res!494127 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25015 0))(
  ( (Unit!25016) )
))
(declare-fun lt!326081 () Unit!25015)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25015)

(assert (=> b!735741 (= lt!326081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735742 () Bool)

(declare-fun e!411725 () Bool)

(assert (=> b!735742 (= e!411726 e!411725)))

(declare-fun res!494136 () Bool)

(assert (=> b!735742 (=> res!494136 e!411725)))

(assert (=> b!735742 (= res!494136 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326080 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735742 (= lt!326080 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!735743 () Bool)

(assert (=> b!735743 (= e!411725 true)))

(declare-fun lt!326082 () SeekEntryResult!7309)

(assert (=> b!735743 (= lt!326082 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!735744 () Bool)

(assert (=> b!735744 (= e!411732 e!411728)))

(declare-fun res!494128 () Bool)

(assert (=> b!735744 (=> (not res!494128) (not e!411728))))

(declare-fun lt!326077 () SeekEntryResult!7309)

(assert (=> b!735744 (= res!494128 (or (= lt!326077 (MissingZero!7309 i!1173)) (= lt!326077 (MissingVacant!7309 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41287 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!735744 (= lt!326077 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735745 () Bool)

(declare-fun res!494141 () Bool)

(assert (=> b!735745 (=> (not res!494141) (not e!411728))))

(assert (=> b!735745 (= res!494141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735746 () Bool)

(declare-fun res!494135 () Bool)

(assert (=> b!735746 (=> (not res!494135) (not e!411728))))

(assert (=> b!735746 (= res!494135 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20173 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20173 a!3186))))))

(declare-fun b!735747 () Bool)

(assert (=> b!735747 (= e!411723 e!411731)))

(declare-fun res!494139 () Bool)

(assert (=> b!735747 (=> (not res!494139) (not e!411731))))

(declare-fun lt!326078 () SeekEntryResult!7309)

(assert (=> b!735747 (= res!494139 (= lt!326078 lt!326076))))

(declare-fun lt!326079 () array!41287)

(declare-fun lt!326074 () (_ BitVec 64))

(assert (=> b!735747 (= lt!326076 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326074 lt!326079 mask!3328))))

(assert (=> b!735747 (= lt!326078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326074 mask!3328) lt!326074 lt!326079 mask!3328))))

(assert (=> b!735747 (= lt!326074 (select (store (arr!19753 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735747 (= lt!326079 (array!41288 (store (arr!19753 a!3186) i!1173 k0!2102) (size!20173 a!3186)))))

(declare-fun b!735748 () Bool)

(declare-fun res!494132 () Bool)

(assert (=> b!735748 (=> (not res!494132) (not e!411723))))

(declare-fun e!411727 () Bool)

(assert (=> b!735748 (= res!494132 e!411727)))

(declare-fun c!81188 () Bool)

(assert (=> b!735748 (= c!81188 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735749 () Bool)

(assert (=> b!735749 (= e!411727 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) (Found!7309 j!159)))))

(declare-fun b!735750 () Bool)

(declare-fun res!494133 () Bool)

(assert (=> b!735750 (=> (not res!494133) (not e!411732))))

(assert (=> b!735750 (= res!494133 (and (= (size!20173 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20173 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20173 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735751 () Bool)

(declare-fun res!494130 () Bool)

(assert (=> b!735751 (=> (not res!494130) (not e!411728))))

(declare-datatypes ((List!13662 0))(
  ( (Nil!13659) (Cons!13658 (h!14736 (_ BitVec 64)) (t!19969 List!13662)) )
))
(declare-fun arrayNoDuplicates!0 (array!41287 (_ BitVec 32) List!13662) Bool)

(assert (=> b!735751 (= res!494130 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13659))))

(declare-fun res!494137 () Bool)

(assert (=> start!65244 (=> (not res!494137) (not e!411732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65244 (= res!494137 (validMask!0 mask!3328))))

(assert (=> start!65244 e!411732))

(assert (=> start!65244 true))

(declare-fun array_inv!15612 (array!41287) Bool)

(assert (=> start!65244 (array_inv!15612 a!3186)))

(declare-fun b!735738 () Bool)

(declare-fun res!494140 () Bool)

(assert (=> b!735738 (=> (not res!494140) (not e!411732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735738 (= res!494140 (validKeyInArray!0 (select (arr!19753 a!3186) j!159)))))

(declare-fun b!735752 () Bool)

(assert (=> b!735752 (= e!411730 e!411724)))

(declare-fun res!494142 () Bool)

(assert (=> b!735752 (=> (not res!494142) (not e!411724))))

(assert (=> b!735752 (= res!494142 (= (seekEntryOrOpen!0 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!326075))))

(assert (=> b!735752 (= lt!326075 (Found!7309 j!159))))

(declare-fun b!735753 () Bool)

(assert (=> b!735753 (= e!411727 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19753 a!3186) j!159) a!3186 mask!3328) lt!326073))))

(declare-fun b!735754 () Bool)

(declare-fun res!494129 () Bool)

(assert (=> b!735754 (=> (not res!494129) (not e!411732))))

(assert (=> b!735754 (= res!494129 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65244 res!494137) b!735750))

(assert (= (and b!735750 res!494133) b!735738))

(assert (= (and b!735738 res!494140) b!735754))

(assert (= (and b!735754 res!494129) b!735740))

(assert (= (and b!735740 res!494134) b!735744))

(assert (= (and b!735744 res!494128) b!735745))

(assert (= (and b!735745 res!494141) b!735751))

(assert (= (and b!735751 res!494130) b!735746))

(assert (= (and b!735746 res!494135) b!735737))

(assert (= (and b!735737 res!494138) b!735736))

(assert (= (and b!735736 res!494131) b!735748))

(assert (= (and b!735748 c!81188) b!735753))

(assert (= (and b!735748 (not c!81188)) b!735749))

(assert (= (and b!735748 res!494132) b!735747))

(assert (= (and b!735747 res!494139) b!735741))

(assert (= (and b!735741 res!494127) b!735752))

(assert (= (and b!735752 res!494142) b!735739))

(assert (= (and b!735741 (not res!494143)) b!735742))

(assert (= (and b!735742 (not res!494136)) b!735743))

(declare-fun m!688635 () Bool)

(assert (=> b!735736 m!688635))

(declare-fun m!688637 () Bool)

(assert (=> b!735743 m!688637))

(assert (=> b!735743 m!688637))

(declare-fun m!688639 () Bool)

(assert (=> b!735743 m!688639))

(declare-fun m!688641 () Bool)

(assert (=> b!735744 m!688641))

(assert (=> b!735739 m!688637))

(assert (=> b!735739 m!688637))

(declare-fun m!688643 () Bool)

(assert (=> b!735739 m!688643))

(assert (=> b!735753 m!688637))

(assert (=> b!735753 m!688637))

(declare-fun m!688645 () Bool)

(assert (=> b!735753 m!688645))

(declare-fun m!688647 () Bool)

(assert (=> b!735754 m!688647))

(declare-fun m!688649 () Bool)

(assert (=> b!735742 m!688649))

(assert (=> b!735737 m!688637))

(assert (=> b!735737 m!688637))

(declare-fun m!688651 () Bool)

(assert (=> b!735737 m!688651))

(assert (=> b!735737 m!688651))

(assert (=> b!735737 m!688637))

(declare-fun m!688653 () Bool)

(assert (=> b!735737 m!688653))

(assert (=> b!735749 m!688637))

(assert (=> b!735749 m!688637))

(assert (=> b!735749 m!688639))

(declare-fun m!688655 () Bool)

(assert (=> b!735751 m!688655))

(declare-fun m!688657 () Bool)

(assert (=> b!735740 m!688657))

(declare-fun m!688659 () Bool)

(assert (=> b!735745 m!688659))

(declare-fun m!688661 () Bool)

(assert (=> b!735747 m!688661))

(declare-fun m!688663 () Bool)

(assert (=> b!735747 m!688663))

(declare-fun m!688665 () Bool)

(assert (=> b!735747 m!688665))

(declare-fun m!688667 () Bool)

(assert (=> b!735747 m!688667))

(declare-fun m!688669 () Bool)

(assert (=> b!735747 m!688669))

(assert (=> b!735747 m!688667))

(declare-fun m!688671 () Bool)

(assert (=> b!735741 m!688671))

(declare-fun m!688673 () Bool)

(assert (=> b!735741 m!688673))

(declare-fun m!688675 () Bool)

(assert (=> start!65244 m!688675))

(declare-fun m!688677 () Bool)

(assert (=> start!65244 m!688677))

(assert (=> b!735752 m!688637))

(assert (=> b!735752 m!688637))

(declare-fun m!688679 () Bool)

(assert (=> b!735752 m!688679))

(assert (=> b!735738 m!688637))

(assert (=> b!735738 m!688637))

(declare-fun m!688681 () Bool)

(assert (=> b!735738 m!688681))

(check-sat (not b!735739) (not b!735747) (not b!735744) (not b!735745) (not b!735749) (not b!735752) (not b!735737) (not b!735740) (not b!735753) (not b!735741) (not b!735743) (not b!735751) (not b!735754) (not start!65244) (not b!735742) (not b!735738))
(check-sat)
