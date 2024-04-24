; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67828 () Bool)

(assert start!67828)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!436950 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!785852 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42748 0))(
  ( (array!42749 (arr!20458 (Array (_ BitVec 32) (_ BitVec 64))) (size!20878 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42748)

(declare-datatypes ((SeekEntryResult!8014 0))(
  ( (MissingZero!8014 (index!34424 (_ BitVec 32))) (Found!8014 (index!34425 (_ BitVec 32))) (Intermediate!8014 (undefined!8826 Bool) (index!34426 (_ BitVec 32)) (x!65533 (_ BitVec 32))) (Undefined!8014) (MissingVacant!8014 (index!34427 (_ BitVec 32))) )
))
(declare-fun lt!350367 () SeekEntryResult!8014)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!785852 (= e!436950 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!350367))))

(declare-fun b!785853 () Bool)

(declare-fun res!531743 () Bool)

(declare-fun e!436960 () Bool)

(assert (=> b!785853 (=> (not res!531743) (not e!436960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42748 (_ BitVec 32)) Bool)

(assert (=> b!785853 (= res!531743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!531750 () Bool)

(declare-fun e!436958 () Bool)

(assert (=> start!67828 (=> (not res!531750) (not e!436958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67828 (= res!531750 (validMask!0 mask!3328))))

(assert (=> start!67828 e!436958))

(assert (=> start!67828 true))

(declare-fun array_inv!16317 (array!42748) Bool)

(assert (=> start!67828 (array_inv!16317 a!3186)))

(declare-fun b!785854 () Bool)

(declare-fun res!531758 () Bool)

(declare-fun e!436953 () Bool)

(assert (=> b!785854 (=> (not res!531758) (not e!436953))))

(declare-fun e!436949 () Bool)

(assert (=> b!785854 (= res!531758 e!436949)))

(declare-fun c!87466 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!785854 (= c!87466 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785855 () Bool)

(declare-fun res!531741 () Bool)

(assert (=> b!785855 (=> (not res!531741) (not e!436958))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785855 (= res!531741 (and (= (size!20878 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20878 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20878 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785856 () Bool)

(declare-fun e!436959 () Bool)

(declare-fun lt!350365 () SeekEntryResult!8014)

(declare-fun lt!350357 () SeekEntryResult!8014)

(assert (=> b!785856 (= e!436959 (= lt!350365 lt!350357))))

(declare-fun b!785857 () Bool)

(declare-fun e!436956 () Bool)

(declare-fun e!436957 () Bool)

(assert (=> b!785857 (= e!436956 e!436957)))

(declare-fun res!531757 () Bool)

(assert (=> b!785857 (=> res!531757 e!436957)))

(declare-fun lt!350360 () (_ BitVec 64))

(declare-fun lt!350364 () (_ BitVec 64))

(assert (=> b!785857 (= res!531757 (= lt!350360 lt!350364))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785857 (= lt!350360 (select (store (arr!20458 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785858 () Bool)

(declare-fun res!531753 () Bool)

(assert (=> b!785858 (=> (not res!531753) (not e!436953))))

(assert (=> b!785858 (= res!531753 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20458 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785859 () Bool)

(declare-datatypes ((Unit!27121 0))(
  ( (Unit!27122) )
))
(declare-fun e!436952 () Unit!27121)

(declare-fun Unit!27123 () Unit!27121)

(assert (=> b!785859 (= e!436952 Unit!27123)))

(declare-fun b!785860 () Bool)

(declare-fun e!436955 () Bool)

(assert (=> b!785860 (= e!436953 e!436955)))

(declare-fun res!531744 () Bool)

(assert (=> b!785860 (=> (not res!531744) (not e!436955))))

(declare-fun lt!350363 () SeekEntryResult!8014)

(declare-fun lt!350362 () SeekEntryResult!8014)

(assert (=> b!785860 (= res!531744 (= lt!350363 lt!350362))))

(declare-fun lt!350359 () array!42748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!785860 (= lt!350362 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350364 lt!350359 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785860 (= lt!350363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350364 mask!3328) lt!350364 lt!350359 mask!3328))))

(assert (=> b!785860 (= lt!350364 (select (store (arr!20458 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785860 (= lt!350359 (array!42749 (store (arr!20458 a!3186) i!1173 k0!2102) (size!20878 a!3186)))))

(declare-fun b!785861 () Bool)

(declare-fun e!436954 () Bool)

(assert (=> b!785861 (= e!436954 e!436956)))

(declare-fun res!531748 () Bool)

(assert (=> b!785861 (=> res!531748 e!436956)))

(assert (=> b!785861 (= res!531748 (not (= lt!350357 lt!350367)))))

(assert (=> b!785861 (= lt!350357 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785862 () Bool)

(declare-fun res!531754 () Bool)

(assert (=> b!785862 (=> (not res!531754) (not e!436958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785862 (= res!531754 (validKeyInArray!0 k0!2102))))

(declare-fun b!785863 () Bool)

(assert (=> b!785863 (= e!436960 e!436953)))

(declare-fun res!531749 () Bool)

(assert (=> b!785863 (=> (not res!531749) (not e!436953))))

(declare-fun lt!350366 () SeekEntryResult!8014)

(assert (=> b!785863 (= res!531749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20458 a!3186) j!159) mask!3328) (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!350366))))

(assert (=> b!785863 (= lt!350366 (Intermediate!8014 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785864 () Bool)

(declare-fun res!531745 () Bool)

(assert (=> b!785864 (=> (not res!531745) (not e!436958))))

(assert (=> b!785864 (= res!531745 (validKeyInArray!0 (select (arr!20458 a!3186) j!159)))))

(declare-fun b!785865 () Bool)

(declare-fun res!531747 () Bool)

(assert (=> b!785865 (=> (not res!531747) (not e!436960))))

(declare-datatypes ((List!14367 0))(
  ( (Nil!14364) (Cons!14363 (h!15492 (_ BitVec 64)) (t!20674 List!14367)) )
))
(declare-fun arrayNoDuplicates!0 (array!42748 (_ BitVec 32) List!14367) Bool)

(assert (=> b!785865 (= res!531747 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14364))))

(declare-fun b!785866 () Bool)

(declare-fun Unit!27124 () Unit!27121)

(assert (=> b!785866 (= e!436952 Unit!27124)))

(assert (=> b!785866 false))

(declare-fun b!785867 () Bool)

(assert (=> b!785867 (= e!436955 (not e!436954))))

(declare-fun res!531751 () Bool)

(assert (=> b!785867 (=> res!531751 e!436954)))

(get-info :version)

(assert (=> b!785867 (= res!531751 (or (not ((_ is Intermediate!8014) lt!350362)) (bvslt x!1131 (x!65533 lt!350362)) (not (= x!1131 (x!65533 lt!350362))) (not (= index!1321 (index!34426 lt!350362)))))))

(assert (=> b!785867 e!436950))

(declare-fun res!531746 () Bool)

(assert (=> b!785867 (=> (not res!531746) (not e!436950))))

(assert (=> b!785867 (= res!531746 (= lt!350365 lt!350367))))

(assert (=> b!785867 (= lt!350367 (Found!8014 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42748 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!785867 (= lt!350365 (seekEntryOrOpen!0 (select (arr!20458 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785867 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350358 () Unit!27121)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27121)

(assert (=> b!785867 (= lt!350358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785868 () Bool)

(assert (=> b!785868 (= e!436958 e!436960)))

(declare-fun res!531752 () Bool)

(assert (=> b!785868 (=> (not res!531752) (not e!436960))))

(declare-fun lt!350361 () SeekEntryResult!8014)

(assert (=> b!785868 (= res!531752 (or (= lt!350361 (MissingZero!8014 i!1173)) (= lt!350361 (MissingVacant!8014 i!1173))))))

(assert (=> b!785868 (= lt!350361 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785869 () Bool)

(declare-fun res!531759 () Bool)

(assert (=> b!785869 (=> (not res!531759) (not e!436958))))

(declare-fun arrayContainsKey!0 (array!42748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785869 (= res!531759 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785870 () Bool)

(assert (=> b!785870 (= e!436949 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) (Found!8014 j!159)))))

(declare-fun b!785871 () Bool)

(declare-fun res!531742 () Bool)

(assert (=> b!785871 (=> (not res!531742) (not e!436959))))

(assert (=> b!785871 (= res!531742 (= (seekEntryOrOpen!0 lt!350364 lt!350359 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350364 lt!350359 mask!3328)))))

(declare-fun b!785872 () Bool)

(assert (=> b!785872 (= e!436957 true)))

(assert (=> b!785872 e!436959))

(declare-fun res!531755 () Bool)

(assert (=> b!785872 (=> (not res!531755) (not e!436959))))

(assert (=> b!785872 (= res!531755 (= lt!350360 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350368 () Unit!27121)

(assert (=> b!785872 (= lt!350368 e!436952)))

(declare-fun c!87467 () Bool)

(assert (=> b!785872 (= c!87467 (= lt!350360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785873 () Bool)

(declare-fun res!531756 () Bool)

(assert (=> b!785873 (=> (not res!531756) (not e!436960))))

(assert (=> b!785873 (= res!531756 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20878 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20878 a!3186))))))

(declare-fun b!785874 () Bool)

(assert (=> b!785874 (= e!436949 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20458 a!3186) j!159) a!3186 mask!3328) lt!350366))))

(assert (= (and start!67828 res!531750) b!785855))

(assert (= (and b!785855 res!531741) b!785864))

(assert (= (and b!785864 res!531745) b!785862))

(assert (= (and b!785862 res!531754) b!785869))

(assert (= (and b!785869 res!531759) b!785868))

(assert (= (and b!785868 res!531752) b!785853))

(assert (= (and b!785853 res!531743) b!785865))

(assert (= (and b!785865 res!531747) b!785873))

(assert (= (and b!785873 res!531756) b!785863))

(assert (= (and b!785863 res!531749) b!785858))

(assert (= (and b!785858 res!531753) b!785854))

(assert (= (and b!785854 c!87466) b!785874))

(assert (= (and b!785854 (not c!87466)) b!785870))

(assert (= (and b!785854 res!531758) b!785860))

(assert (= (and b!785860 res!531744) b!785867))

(assert (= (and b!785867 res!531746) b!785852))

(assert (= (and b!785867 (not res!531751)) b!785861))

(assert (= (and b!785861 (not res!531748)) b!785857))

(assert (= (and b!785857 (not res!531757)) b!785872))

(assert (= (and b!785872 c!87467) b!785866))

(assert (= (and b!785872 (not c!87467)) b!785859))

(assert (= (and b!785872 res!531755) b!785871))

(assert (= (and b!785871 res!531742) b!785856))

(declare-fun m!728399 () Bool)

(assert (=> b!785861 m!728399))

(assert (=> b!785861 m!728399))

(declare-fun m!728401 () Bool)

(assert (=> b!785861 m!728401))

(assert (=> b!785870 m!728399))

(assert (=> b!785870 m!728399))

(assert (=> b!785870 m!728401))

(assert (=> b!785874 m!728399))

(assert (=> b!785874 m!728399))

(declare-fun m!728403 () Bool)

(assert (=> b!785874 m!728403))

(assert (=> b!785864 m!728399))

(assert (=> b!785864 m!728399))

(declare-fun m!728405 () Bool)

(assert (=> b!785864 m!728405))

(declare-fun m!728407 () Bool)

(assert (=> b!785853 m!728407))

(declare-fun m!728409 () Bool)

(assert (=> b!785860 m!728409))

(declare-fun m!728411 () Bool)

(assert (=> b!785860 m!728411))

(declare-fun m!728413 () Bool)

(assert (=> b!785860 m!728413))

(declare-fun m!728415 () Bool)

(assert (=> b!785860 m!728415))

(declare-fun m!728417 () Bool)

(assert (=> b!785860 m!728417))

(assert (=> b!785860 m!728409))

(declare-fun m!728419 () Bool)

(assert (=> b!785868 m!728419))

(declare-fun m!728421 () Bool)

(assert (=> b!785862 m!728421))

(declare-fun m!728423 () Bool)

(assert (=> b!785869 m!728423))

(declare-fun m!728425 () Bool)

(assert (=> b!785865 m!728425))

(assert (=> b!785852 m!728399))

(assert (=> b!785852 m!728399))

(declare-fun m!728427 () Bool)

(assert (=> b!785852 m!728427))

(assert (=> b!785863 m!728399))

(assert (=> b!785863 m!728399))

(declare-fun m!728429 () Bool)

(assert (=> b!785863 m!728429))

(assert (=> b!785863 m!728429))

(assert (=> b!785863 m!728399))

(declare-fun m!728431 () Bool)

(assert (=> b!785863 m!728431))

(declare-fun m!728433 () Bool)

(assert (=> b!785871 m!728433))

(declare-fun m!728435 () Bool)

(assert (=> b!785871 m!728435))

(assert (=> b!785857 m!728413))

(declare-fun m!728437 () Bool)

(assert (=> b!785857 m!728437))

(declare-fun m!728439 () Bool)

(assert (=> b!785858 m!728439))

(assert (=> b!785867 m!728399))

(assert (=> b!785867 m!728399))

(declare-fun m!728441 () Bool)

(assert (=> b!785867 m!728441))

(declare-fun m!728443 () Bool)

(assert (=> b!785867 m!728443))

(declare-fun m!728445 () Bool)

(assert (=> b!785867 m!728445))

(declare-fun m!728447 () Bool)

(assert (=> start!67828 m!728447))

(declare-fun m!728449 () Bool)

(assert (=> start!67828 m!728449))

(check-sat (not b!785862) (not b!785853) (not b!785864) (not b!785867) (not b!785865) (not b!785870) (not b!785861) (not b!785852) (not start!67828) (not b!785860) (not b!785868) (not b!785871) (not b!785869) (not b!785863) (not b!785874))
(check-sat)
