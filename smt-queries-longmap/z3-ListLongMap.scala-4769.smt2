; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65676 () Bool)

(assert start!65676)

(declare-fun b!752735 () Bool)

(declare-fun res!508387 () Bool)

(declare-fun e!419863 () Bool)

(assert (=> b!752735 (=> (not res!508387) (not e!419863))))

(declare-datatypes ((array!41849 0))(
  ( (array!41850 (arr!20038 (Array (_ BitVec 32) (_ BitVec 64))) (size!20459 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41849)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!752735 (= res!508387 (and (= (size!20459 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20459 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20459 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752736 () Bool)

(declare-fun res!508400 () Bool)

(declare-fun e!419869 () Bool)

(assert (=> b!752736 (=> (not res!508400) (not e!419869))))

(declare-fun e!419871 () Bool)

(assert (=> b!752736 (= res!508400 e!419871)))

(declare-fun c!82558 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752736 (= c!82558 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752737 () Bool)

(declare-fun res!508399 () Bool)

(assert (=> b!752737 (=> (not res!508399) (not e!419863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752737 (= res!508399 (validKeyInArray!0 (select (arr!20038 a!3186) j!159)))))

(declare-fun b!752738 () Bool)

(declare-fun res!508397 () Bool)

(declare-fun e!419862 () Bool)

(assert (=> b!752738 (=> (not res!508397) (not e!419862))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!752738 (= res!508397 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20459 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20459 a!3186))))))

(declare-fun b!752739 () Bool)

(declare-fun res!508398 () Bool)

(declare-fun e!419865 () Bool)

(assert (=> b!752739 (=> (not res!508398) (not e!419865))))

(declare-fun lt!334854 () (_ BitVec 64))

(declare-fun lt!334859 () array!41849)

(declare-datatypes ((SeekEntryResult!7638 0))(
  ( (MissingZero!7638 (index!32920 (_ BitVec 32))) (Found!7638 (index!32921 (_ BitVec 32))) (Intermediate!7638 (undefined!8450 Bool) (index!32922 (_ BitVec 32)) (x!63836 (_ BitVec 32))) (Undefined!7638) (MissingVacant!7638 (index!32923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41849 (_ BitVec 32)) SeekEntryResult!7638)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41849 (_ BitVec 32)) SeekEntryResult!7638)

(assert (=> b!752739 (= res!508398 (= (seekEntryOrOpen!0 lt!334854 lt!334859 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334854 lt!334859 mask!3328)))))

(declare-fun b!752740 () Bool)

(declare-fun e!419868 () Bool)

(declare-fun e!419867 () Bool)

(assert (=> b!752740 (= e!419868 e!419867)))

(declare-fun res!508393 () Bool)

(assert (=> b!752740 (=> res!508393 e!419867)))

(declare-fun lt!334864 () SeekEntryResult!7638)

(declare-fun lt!334862 () SeekEntryResult!7638)

(assert (=> b!752740 (= res!508393 (not (= lt!334864 lt!334862)))))

(assert (=> b!752740 (= lt!334864 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!334857 () SeekEntryResult!7638)

(declare-fun b!752741 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41849 (_ BitVec 32)) SeekEntryResult!7638)

(assert (=> b!752741 (= e!419871 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!334857))))

(declare-fun b!752742 () Bool)

(declare-fun res!508396 () Bool)

(assert (=> b!752742 (=> (not res!508396) (not e!419869))))

(assert (=> b!752742 (= res!508396 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20038 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752743 () Bool)

(declare-fun res!508391 () Bool)

(assert (=> b!752743 (=> (not res!508391) (not e!419862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41849 (_ BitVec 32)) Bool)

(assert (=> b!752743 (= res!508391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752744 () Bool)

(declare-fun e!419873 () Bool)

(assert (=> b!752744 (= e!419867 e!419873)))

(declare-fun res!508392 () Bool)

(assert (=> b!752744 (=> res!508392 e!419873)))

(declare-fun lt!334865 () (_ BitVec 64))

(assert (=> b!752744 (= res!508392 (= lt!334865 lt!334854))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!752744 (= lt!334865 (select (store (arr!20038 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752746 () Bool)

(assert (=> b!752746 (= e!419863 e!419862)))

(declare-fun res!508394 () Bool)

(assert (=> b!752746 (=> (not res!508394) (not e!419862))))

(declare-fun lt!334863 () SeekEntryResult!7638)

(assert (=> b!752746 (= res!508394 (or (= lt!334863 (MissingZero!7638 i!1173)) (= lt!334863 (MissingVacant!7638 i!1173))))))

(assert (=> b!752746 (= lt!334863 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752747 () Bool)

(declare-fun res!508383 () Bool)

(assert (=> b!752747 (=> (not res!508383) (not e!419862))))

(declare-datatypes ((List!14040 0))(
  ( (Nil!14037) (Cons!14036 (h!15108 (_ BitVec 64)) (t!20355 List!14040)) )
))
(declare-fun arrayNoDuplicates!0 (array!41849 (_ BitVec 32) List!14040) Bool)

(assert (=> b!752747 (= res!508383 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14037))))

(declare-fun b!752748 () Bool)

(declare-datatypes ((Unit!25932 0))(
  ( (Unit!25933) )
))
(declare-fun e!419866 () Unit!25932)

(declare-fun Unit!25934 () Unit!25932)

(assert (=> b!752748 (= e!419866 Unit!25934)))

(declare-fun b!752749 () Bool)

(assert (=> b!752749 (= e!419873 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!752749 e!419865))

(declare-fun res!508382 () Bool)

(assert (=> b!752749 (=> (not res!508382) (not e!419865))))

(assert (=> b!752749 (= res!508382 (= lt!334865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334856 () Unit!25932)

(assert (=> b!752749 (= lt!334856 e!419866)))

(declare-fun c!82557 () Bool)

(assert (=> b!752749 (= c!82557 (= lt!334865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!419870 () Bool)

(declare-fun b!752750 () Bool)

(assert (=> b!752750 (= e!419870 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!334862))))

(declare-fun b!752751 () Bool)

(declare-fun e!419864 () Bool)

(assert (=> b!752751 (= e!419864 (not e!419868))))

(declare-fun res!508389 () Bool)

(assert (=> b!752751 (=> res!508389 e!419868)))

(declare-fun lt!334860 () SeekEntryResult!7638)

(get-info :version)

(assert (=> b!752751 (= res!508389 (or (not ((_ is Intermediate!7638) lt!334860)) (bvslt x!1131 (x!63836 lt!334860)) (not (= x!1131 (x!63836 lt!334860))) (not (= index!1321 (index!32922 lt!334860)))))))

(assert (=> b!752751 e!419870))

(declare-fun res!508385 () Bool)

(assert (=> b!752751 (=> (not res!508385) (not e!419870))))

(declare-fun lt!334858 () SeekEntryResult!7638)

(assert (=> b!752751 (= res!508385 (= lt!334858 lt!334862))))

(assert (=> b!752751 (= lt!334862 (Found!7638 j!159))))

(assert (=> b!752751 (= lt!334858 (seekEntryOrOpen!0 (select (arr!20038 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752751 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334861 () Unit!25932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25932)

(assert (=> b!752751 (= lt!334861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752752 () Bool)

(assert (=> b!752752 (= e!419869 e!419864)))

(declare-fun res!508395 () Bool)

(assert (=> b!752752 (=> (not res!508395) (not e!419864))))

(declare-fun lt!334855 () SeekEntryResult!7638)

(assert (=> b!752752 (= res!508395 (= lt!334855 lt!334860))))

(assert (=> b!752752 (= lt!334860 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334854 lt!334859 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752752 (= lt!334855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334854 mask!3328) lt!334854 lt!334859 mask!3328))))

(assert (=> b!752752 (= lt!334854 (select (store (arr!20038 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752752 (= lt!334859 (array!41850 (store (arr!20038 a!3186) i!1173 k0!2102) (size!20459 a!3186)))))

(declare-fun b!752753 () Bool)

(declare-fun res!508388 () Bool)

(assert (=> b!752753 (=> (not res!508388) (not e!419863))))

(assert (=> b!752753 (= res!508388 (validKeyInArray!0 k0!2102))))

(declare-fun b!752754 () Bool)

(declare-fun Unit!25935 () Unit!25932)

(assert (=> b!752754 (= e!419866 Unit!25935)))

(assert (=> b!752754 false))

(declare-fun b!752755 () Bool)

(assert (=> b!752755 (= e!419862 e!419869)))

(declare-fun res!508390 () Bool)

(assert (=> b!752755 (=> (not res!508390) (not e!419869))))

(assert (=> b!752755 (= res!508390 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20038 a!3186) j!159) mask!3328) (select (arr!20038 a!3186) j!159) a!3186 mask!3328) lt!334857))))

(assert (=> b!752755 (= lt!334857 (Intermediate!7638 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752756 () Bool)

(assert (=> b!752756 (= e!419871 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20038 a!3186) j!159) a!3186 mask!3328) (Found!7638 j!159)))))

(declare-fun b!752757 () Bool)

(assert (=> b!752757 (= e!419865 (= lt!334858 lt!334864))))

(declare-fun res!508386 () Bool)

(assert (=> start!65676 (=> (not res!508386) (not e!419863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65676 (= res!508386 (validMask!0 mask!3328))))

(assert (=> start!65676 e!419863))

(assert (=> start!65676 true))

(declare-fun array_inv!15834 (array!41849) Bool)

(assert (=> start!65676 (array_inv!15834 a!3186)))

(declare-fun b!752745 () Bool)

(declare-fun res!508384 () Bool)

(assert (=> b!752745 (=> (not res!508384) (not e!419863))))

(declare-fun arrayContainsKey!0 (array!41849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752745 (= res!508384 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65676 res!508386) b!752735))

(assert (= (and b!752735 res!508387) b!752737))

(assert (= (and b!752737 res!508399) b!752753))

(assert (= (and b!752753 res!508388) b!752745))

(assert (= (and b!752745 res!508384) b!752746))

(assert (= (and b!752746 res!508394) b!752743))

(assert (= (and b!752743 res!508391) b!752747))

(assert (= (and b!752747 res!508383) b!752738))

(assert (= (and b!752738 res!508397) b!752755))

(assert (= (and b!752755 res!508390) b!752742))

(assert (= (and b!752742 res!508396) b!752736))

(assert (= (and b!752736 c!82558) b!752741))

(assert (= (and b!752736 (not c!82558)) b!752756))

(assert (= (and b!752736 res!508400) b!752752))

(assert (= (and b!752752 res!508395) b!752751))

(assert (= (and b!752751 res!508385) b!752750))

(assert (= (and b!752751 (not res!508389)) b!752740))

(assert (= (and b!752740 (not res!508393)) b!752744))

(assert (= (and b!752744 (not res!508392)) b!752749))

(assert (= (and b!752749 c!82557) b!752754))

(assert (= (and b!752749 (not c!82557)) b!752748))

(assert (= (and b!752749 res!508382) b!752739))

(assert (= (and b!752739 res!508398) b!752757))

(declare-fun m!701603 () Bool)

(assert (=> b!752739 m!701603))

(declare-fun m!701605 () Bool)

(assert (=> b!752739 m!701605))

(declare-fun m!701607 () Bool)

(assert (=> b!752756 m!701607))

(assert (=> b!752756 m!701607))

(declare-fun m!701609 () Bool)

(assert (=> b!752756 m!701609))

(declare-fun m!701611 () Bool)

(assert (=> b!752742 m!701611))

(declare-fun m!701613 () Bool)

(assert (=> b!752744 m!701613))

(declare-fun m!701615 () Bool)

(assert (=> b!752744 m!701615))

(declare-fun m!701617 () Bool)

(assert (=> start!65676 m!701617))

(declare-fun m!701619 () Bool)

(assert (=> start!65676 m!701619))

(declare-fun m!701621 () Bool)

(assert (=> b!752753 m!701621))

(declare-fun m!701623 () Bool)

(assert (=> b!752747 m!701623))

(declare-fun m!701625 () Bool)

(assert (=> b!752746 m!701625))

(declare-fun m!701627 () Bool)

(assert (=> b!752752 m!701627))

(declare-fun m!701629 () Bool)

(assert (=> b!752752 m!701629))

(declare-fun m!701631 () Bool)

(assert (=> b!752752 m!701631))

(assert (=> b!752752 m!701613))

(declare-fun m!701633 () Bool)

(assert (=> b!752752 m!701633))

(assert (=> b!752752 m!701627))

(assert (=> b!752741 m!701607))

(assert (=> b!752741 m!701607))

(declare-fun m!701635 () Bool)

(assert (=> b!752741 m!701635))

(assert (=> b!752750 m!701607))

(assert (=> b!752750 m!701607))

(declare-fun m!701637 () Bool)

(assert (=> b!752750 m!701637))

(assert (=> b!752755 m!701607))

(assert (=> b!752755 m!701607))

(declare-fun m!701639 () Bool)

(assert (=> b!752755 m!701639))

(assert (=> b!752755 m!701639))

(assert (=> b!752755 m!701607))

(declare-fun m!701641 () Bool)

(assert (=> b!752755 m!701641))

(declare-fun m!701643 () Bool)

(assert (=> b!752745 m!701643))

(declare-fun m!701645 () Bool)

(assert (=> b!752743 m!701645))

(assert (=> b!752737 m!701607))

(assert (=> b!752737 m!701607))

(declare-fun m!701647 () Bool)

(assert (=> b!752737 m!701647))

(assert (=> b!752751 m!701607))

(assert (=> b!752751 m!701607))

(declare-fun m!701649 () Bool)

(assert (=> b!752751 m!701649))

(declare-fun m!701651 () Bool)

(assert (=> b!752751 m!701651))

(declare-fun m!701653 () Bool)

(assert (=> b!752751 m!701653))

(assert (=> b!752740 m!701607))

(assert (=> b!752740 m!701607))

(assert (=> b!752740 m!701609))

(check-sat (not b!752751) (not b!752747) (not b!752743) (not b!752740) (not b!752741) (not start!65676) (not b!752746) (not b!752745) (not b!752750) (not b!752752) (not b!752753) (not b!752739) (not b!752737) (not b!752755) (not b!752756))
(check-sat)
