; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67724 () Bool)

(assert start!67724)

(declare-fun b!785690 () Bool)

(declare-fun res!531875 () Bool)

(declare-fun e!436795 () Bool)

(assert (=> b!785690 (=> (not res!531875) (not e!436795))))

(declare-datatypes ((array!42764 0))(
  ( (array!42765 (arr!20470 (Array (_ BitVec 32) (_ BitVec 64))) (size!20891 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42764)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785690 (= res!531875 (and (= (size!20891 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20891 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20891 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!8070 0))(
  ( (MissingZero!8070 (index!34648 (_ BitVec 32))) (Found!8070 (index!34649 (_ BitVec 32))) (Intermediate!8070 (undefined!8882 Bool) (index!34650 (_ BitVec 32)) (x!65594 (_ BitVec 32))) (Undefined!8070) (MissingVacant!8070 (index!34651 (_ BitVec 32))) )
))
(declare-fun lt!350348 () SeekEntryResult!8070)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436786 () Bool)

(declare-fun b!785691 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42764 (_ BitVec 32)) SeekEntryResult!8070)

(assert (=> b!785691 (= e!436786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350348))))

(declare-fun b!785692 () Bool)

(declare-fun res!531884 () Bool)

(declare-fun e!436790 () Bool)

(assert (=> b!785692 (=> (not res!531884) (not e!436790))))

(declare-datatypes ((List!14472 0))(
  ( (Nil!14469) (Cons!14468 (h!15591 (_ BitVec 64)) (t!20787 List!14472)) )
))
(declare-fun arrayNoDuplicates!0 (array!42764 (_ BitVec 32) List!14472) Bool)

(assert (=> b!785692 (= res!531884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14469))))

(declare-fun b!785693 () Bool)

(assert (=> b!785693 (= e!436795 e!436790)))

(declare-fun res!531872 () Bool)

(assert (=> b!785693 (=> (not res!531872) (not e!436790))))

(declare-fun lt!350344 () SeekEntryResult!8070)

(assert (=> b!785693 (= res!531872 (or (= lt!350344 (MissingZero!8070 i!1173)) (= lt!350344 (MissingVacant!8070 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42764 (_ BitVec 32)) SeekEntryResult!8070)

(assert (=> b!785693 (= lt!350344 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785694 () Bool)

(declare-fun res!531885 () Bool)

(declare-fun e!436785 () Bool)

(assert (=> b!785694 (=> (not res!531885) (not e!436785))))

(assert (=> b!785694 (= res!531885 e!436786)))

(declare-fun c!87318 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785694 (= c!87318 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785696 () Bool)

(declare-fun e!436791 () Bool)

(declare-fun e!436794 () Bool)

(assert (=> b!785696 (= e!436791 (not e!436794))))

(declare-fun res!531879 () Bool)

(assert (=> b!785696 (=> res!531879 e!436794)))

(declare-fun lt!350347 () SeekEntryResult!8070)

(get-info :version)

(assert (=> b!785696 (= res!531879 (or (not ((_ is Intermediate!8070) lt!350347)) (bvslt x!1131 (x!65594 lt!350347)) (not (= x!1131 (x!65594 lt!350347))) (not (= index!1321 (index!34650 lt!350347)))))))

(declare-fun e!436796 () Bool)

(assert (=> b!785696 e!436796))

(declare-fun res!531887 () Bool)

(assert (=> b!785696 (=> (not res!531887) (not e!436796))))

(declare-fun lt!350341 () SeekEntryResult!8070)

(declare-fun lt!350346 () SeekEntryResult!8070)

(assert (=> b!785696 (= res!531887 (= lt!350341 lt!350346))))

(assert (=> b!785696 (= lt!350346 (Found!8070 j!159))))

(assert (=> b!785696 (= lt!350341 (seekEntryOrOpen!0 (select (arr!20470 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42764 (_ BitVec 32)) Bool)

(assert (=> b!785696 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27168 0))(
  ( (Unit!27169) )
))
(declare-fun lt!350342 () Unit!27168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27168)

(assert (=> b!785696 (= lt!350342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!785697 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42764 (_ BitVec 32)) SeekEntryResult!8070)

(assert (=> b!785697 (= e!436786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) (Found!8070 j!159)))))

(declare-fun b!785698 () Bool)

(declare-fun e!436788 () Unit!27168)

(declare-fun Unit!27170 () Unit!27168)

(assert (=> b!785698 (= e!436788 Unit!27170)))

(declare-fun b!785699 () Bool)

(declare-fun e!436792 () Bool)

(assert (=> b!785699 (= e!436792 true)))

(declare-fun e!436789 () Bool)

(assert (=> b!785699 e!436789))

(declare-fun res!531883 () Bool)

(assert (=> b!785699 (=> (not res!531883) (not e!436789))))

(declare-fun lt!350338 () (_ BitVec 64))

(assert (=> b!785699 (= res!531883 (= lt!350338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350340 () Unit!27168)

(assert (=> b!785699 (= lt!350340 e!436788)))

(declare-fun c!87319 () Bool)

(assert (=> b!785699 (= c!87319 (= lt!350338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785700 () Bool)

(assert (=> b!785700 (= e!436785 e!436791)))

(declare-fun res!531882 () Bool)

(assert (=> b!785700 (=> (not res!531882) (not e!436791))))

(declare-fun lt!350339 () SeekEntryResult!8070)

(assert (=> b!785700 (= res!531882 (= lt!350339 lt!350347))))

(declare-fun lt!350345 () (_ BitVec 64))

(declare-fun lt!350337 () array!42764)

(assert (=> b!785700 (= lt!350347 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350345 lt!350337 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785700 (= lt!350339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350345 mask!3328) lt!350345 lt!350337 mask!3328))))

(assert (=> b!785700 (= lt!350345 (select (store (arr!20470 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785700 (= lt!350337 (array!42765 (store (arr!20470 a!3186) i!1173 k0!2102) (size!20891 a!3186)))))

(declare-fun res!531871 () Bool)

(assert (=> start!67724 (=> (not res!531871) (not e!436795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67724 (= res!531871 (validMask!0 mask!3328))))

(assert (=> start!67724 e!436795))

(assert (=> start!67724 true))

(declare-fun array_inv!16266 (array!42764) Bool)

(assert (=> start!67724 (array_inv!16266 a!3186)))

(declare-fun b!785695 () Bool)

(declare-fun res!531876 () Bool)

(assert (=> b!785695 (=> (not res!531876) (not e!436795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785695 (= res!531876 (validKeyInArray!0 k0!2102))))

(declare-fun b!785701 () Bool)

(declare-fun res!531881 () Bool)

(assert (=> b!785701 (=> (not res!531881) (not e!436790))))

(assert (=> b!785701 (= res!531881 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20891 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20891 a!3186))))))

(declare-fun b!785702 () Bool)

(declare-fun res!531880 () Bool)

(assert (=> b!785702 (=> (not res!531880) (not e!436795))))

(declare-fun arrayContainsKey!0 (array!42764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785702 (= res!531880 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785703 () Bool)

(declare-fun Unit!27171 () Unit!27168)

(assert (=> b!785703 (= e!436788 Unit!27171)))

(assert (=> b!785703 false))

(declare-fun b!785704 () Bool)

(declare-fun lt!350343 () SeekEntryResult!8070)

(assert (=> b!785704 (= e!436789 (= lt!350341 lt!350343))))

(declare-fun b!785705 () Bool)

(declare-fun e!436793 () Bool)

(assert (=> b!785705 (= e!436794 e!436793)))

(declare-fun res!531886 () Bool)

(assert (=> b!785705 (=> res!531886 e!436793)))

(assert (=> b!785705 (= res!531886 (not (= lt!350343 lt!350346)))))

(assert (=> b!785705 (= lt!350343 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785706 () Bool)

(declare-fun res!531878 () Bool)

(assert (=> b!785706 (=> (not res!531878) (not e!436785))))

(assert (=> b!785706 (= res!531878 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20470 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785707 () Bool)

(declare-fun res!531870 () Bool)

(assert (=> b!785707 (=> (not res!531870) (not e!436789))))

(assert (=> b!785707 (= res!531870 (= (seekEntryOrOpen!0 lt!350345 lt!350337 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350345 lt!350337 mask!3328)))))

(declare-fun b!785708 () Bool)

(assert (=> b!785708 (= e!436796 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350346))))

(declare-fun b!785709 () Bool)

(declare-fun res!531877 () Bool)

(assert (=> b!785709 (=> (not res!531877) (not e!436795))))

(assert (=> b!785709 (= res!531877 (validKeyInArray!0 (select (arr!20470 a!3186) j!159)))))

(declare-fun b!785710 () Bool)

(assert (=> b!785710 (= e!436793 e!436792)))

(declare-fun res!531869 () Bool)

(assert (=> b!785710 (=> res!531869 e!436792)))

(assert (=> b!785710 (= res!531869 (= lt!350338 lt!350345))))

(assert (=> b!785710 (= lt!350338 (select (store (arr!20470 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785711 () Bool)

(declare-fun res!531873 () Bool)

(assert (=> b!785711 (=> (not res!531873) (not e!436790))))

(assert (=> b!785711 (= res!531873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785712 () Bool)

(assert (=> b!785712 (= e!436790 e!436785)))

(declare-fun res!531874 () Bool)

(assert (=> b!785712 (=> (not res!531874) (not e!436785))))

(assert (=> b!785712 (= res!531874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20470 a!3186) j!159) mask!3328) (select (arr!20470 a!3186) j!159) a!3186 mask!3328) lt!350348))))

(assert (=> b!785712 (= lt!350348 (Intermediate!8070 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67724 res!531871) b!785690))

(assert (= (and b!785690 res!531875) b!785709))

(assert (= (and b!785709 res!531877) b!785695))

(assert (= (and b!785695 res!531876) b!785702))

(assert (= (and b!785702 res!531880) b!785693))

(assert (= (and b!785693 res!531872) b!785711))

(assert (= (and b!785711 res!531873) b!785692))

(assert (= (and b!785692 res!531884) b!785701))

(assert (= (and b!785701 res!531881) b!785712))

(assert (= (and b!785712 res!531874) b!785706))

(assert (= (and b!785706 res!531878) b!785694))

(assert (= (and b!785694 c!87318) b!785691))

(assert (= (and b!785694 (not c!87318)) b!785697))

(assert (= (and b!785694 res!531885) b!785700))

(assert (= (and b!785700 res!531882) b!785696))

(assert (= (and b!785696 res!531887) b!785708))

(assert (= (and b!785696 (not res!531879)) b!785705))

(assert (= (and b!785705 (not res!531886)) b!785710))

(assert (= (and b!785710 (not res!531869)) b!785699))

(assert (= (and b!785699 c!87319) b!785703))

(assert (= (and b!785699 (not c!87319)) b!785698))

(assert (= (and b!785699 res!531883) b!785707))

(assert (= (and b!785707 res!531870) b!785704))

(declare-fun m!727701 () Bool)

(assert (=> b!785691 m!727701))

(assert (=> b!785691 m!727701))

(declare-fun m!727703 () Bool)

(assert (=> b!785691 m!727703))

(declare-fun m!727705 () Bool)

(assert (=> b!785700 m!727705))

(declare-fun m!727707 () Bool)

(assert (=> b!785700 m!727707))

(declare-fun m!727709 () Bool)

(assert (=> b!785700 m!727709))

(declare-fun m!727711 () Bool)

(assert (=> b!785700 m!727711))

(declare-fun m!727713 () Bool)

(assert (=> b!785700 m!727713))

(assert (=> b!785700 m!727711))

(declare-fun m!727715 () Bool)

(assert (=> b!785711 m!727715))

(assert (=> b!785696 m!727701))

(assert (=> b!785696 m!727701))

(declare-fun m!727717 () Bool)

(assert (=> b!785696 m!727717))

(declare-fun m!727719 () Bool)

(assert (=> b!785696 m!727719))

(declare-fun m!727721 () Bool)

(assert (=> b!785696 m!727721))

(declare-fun m!727723 () Bool)

(assert (=> b!785695 m!727723))

(assert (=> b!785710 m!727705))

(declare-fun m!727725 () Bool)

(assert (=> b!785710 m!727725))

(assert (=> b!785697 m!727701))

(assert (=> b!785697 m!727701))

(declare-fun m!727727 () Bool)

(assert (=> b!785697 m!727727))

(declare-fun m!727729 () Bool)

(assert (=> b!785693 m!727729))

(declare-fun m!727731 () Bool)

(assert (=> b!785702 m!727731))

(assert (=> b!785712 m!727701))

(assert (=> b!785712 m!727701))

(declare-fun m!727733 () Bool)

(assert (=> b!785712 m!727733))

(assert (=> b!785712 m!727733))

(assert (=> b!785712 m!727701))

(declare-fun m!727735 () Bool)

(assert (=> b!785712 m!727735))

(assert (=> b!785708 m!727701))

(assert (=> b!785708 m!727701))

(declare-fun m!727737 () Bool)

(assert (=> b!785708 m!727737))

(assert (=> b!785705 m!727701))

(assert (=> b!785705 m!727701))

(assert (=> b!785705 m!727727))

(declare-fun m!727739 () Bool)

(assert (=> start!67724 m!727739))

(declare-fun m!727741 () Bool)

(assert (=> start!67724 m!727741))

(assert (=> b!785709 m!727701))

(assert (=> b!785709 m!727701))

(declare-fun m!727743 () Bool)

(assert (=> b!785709 m!727743))

(declare-fun m!727745 () Bool)

(assert (=> b!785692 m!727745))

(declare-fun m!727747 () Bool)

(assert (=> b!785706 m!727747))

(declare-fun m!727749 () Bool)

(assert (=> b!785707 m!727749))

(declare-fun m!727751 () Bool)

(assert (=> b!785707 m!727751))

(check-sat (not b!785692) (not b!785691) (not b!785693) (not b!785702) (not b!785712) (not b!785709) (not b!785711) (not b!785697) (not b!785707) (not b!785695) (not b!785696) (not start!67724) (not b!785705) (not b!785700) (not b!785708))
(check-sat)
