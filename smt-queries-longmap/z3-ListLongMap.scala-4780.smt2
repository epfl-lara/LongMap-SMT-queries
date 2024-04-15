; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65720 () Bool)

(assert start!65720)

(declare-fun b!754693 () Bool)

(declare-fun res!510107 () Bool)

(declare-fun e!420864 () Bool)

(assert (=> b!754693 (=> (not res!510107) (not e!420864))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41910 0))(
  ( (array!41911 (arr!20069 (Array (_ BitVec 32) (_ BitVec 64))) (size!20490 (_ BitVec 32))) )
))
(declare-fun lt!335767 () array!41910)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335772 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7666 0))(
  ( (MissingZero!7666 (index!33032 (_ BitVec 32))) (Found!7666 (index!33033 (_ BitVec 32))) (Intermediate!7666 (undefined!8478 Bool) (index!33034 (_ BitVec 32)) (x!63947 (_ BitVec 32))) (Undefined!7666) (MissingVacant!7666 (index!33035 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41910 (_ BitVec 32)) SeekEntryResult!7666)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41910 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!754693 (= res!510107 (= (seekEntryOrOpen!0 lt!335772 lt!335767 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335772 lt!335767 mask!3328)))))

(declare-fun b!754694 () Bool)

(declare-fun e!420862 () Bool)

(declare-fun e!420870 () Bool)

(assert (=> b!754694 (= e!420862 e!420870)))

(declare-fun res!510097 () Bool)

(assert (=> b!754694 (=> (not res!510097) (not e!420870))))

(declare-fun lt!335770 () SeekEntryResult!7666)

(declare-fun lt!335766 () SeekEntryResult!7666)

(assert (=> b!754694 (= res!510097 (= lt!335770 lt!335766))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41910 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!754694 (= lt!335766 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335772 lt!335767 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754694 (= lt!335770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335772 mask!3328) lt!335772 lt!335767 mask!3328))))

(declare-fun a!3186 () array!41910)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!754694 (= lt!335772 (select (store (arr!20069 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754694 (= lt!335767 (array!41911 (store (arr!20069 a!3186) i!1173 k0!2102) (size!20490 a!3186)))))

(declare-fun b!754695 () Bool)

(declare-fun e!420863 () Bool)

(assert (=> b!754695 (= e!420863 true)))

(assert (=> b!754695 e!420864))

(declare-fun res!510105 () Bool)

(assert (=> b!754695 (=> (not res!510105) (not e!420864))))

(declare-fun lt!335771 () (_ BitVec 64))

(assert (=> b!754695 (= res!510105 (= lt!335771 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26024 0))(
  ( (Unit!26025) )
))
(declare-fun lt!335773 () Unit!26024)

(declare-fun e!420869 () Unit!26024)

(assert (=> b!754695 (= lt!335773 e!420869)))

(declare-fun c!82679 () Bool)

(assert (=> b!754695 (= c!82679 (= lt!335771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754697 () Bool)

(declare-fun e!420871 () Bool)

(assert (=> b!754697 (= e!420871 e!420863)))

(declare-fun res!510099 () Bool)

(assert (=> b!754697 (=> res!510099 e!420863)))

(assert (=> b!754697 (= res!510099 (= lt!335771 lt!335772))))

(assert (=> b!754697 (= lt!335771 (select (store (arr!20069 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754698 () Bool)

(declare-fun Unit!26026 () Unit!26024)

(assert (=> b!754698 (= e!420869 Unit!26026)))

(declare-fun b!754699 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!335775 () SeekEntryResult!7666)

(declare-fun e!420865 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!754699 (= e!420865 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335775))))

(declare-fun b!754700 () Bool)

(declare-fun res!510109 () Bool)

(declare-fun e!420866 () Bool)

(assert (=> b!754700 (=> (not res!510109) (not e!420866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41910 (_ BitVec 32)) Bool)

(assert (=> b!754700 (= res!510109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754701 () Bool)

(declare-fun res!510102 () Bool)

(assert (=> b!754701 (=> (not res!510102) (not e!420866))))

(assert (=> b!754701 (= res!510102 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20490 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20490 a!3186))))))

(declare-fun b!754702 () Bool)

(declare-fun res!510112 () Bool)

(declare-fun e!420860 () Bool)

(assert (=> b!754702 (=> (not res!510112) (not e!420860))))

(declare-fun arrayContainsKey!0 (array!41910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754702 (= res!510112 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754703 () Bool)

(assert (=> b!754703 (= e!420866 e!420862)))

(declare-fun res!510106 () Bool)

(assert (=> b!754703 (=> (not res!510106) (not e!420862))))

(declare-fun lt!335768 () SeekEntryResult!7666)

(assert (=> b!754703 (= res!510106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20069 a!3186) j!159) mask!3328) (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335768))))

(assert (=> b!754703 (= lt!335768 (Intermediate!7666 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754704 () Bool)

(declare-fun res!510108 () Bool)

(assert (=> b!754704 (=> (not res!510108) (not e!420862))))

(declare-fun e!420861 () Bool)

(assert (=> b!754704 (= res!510108 e!420861)))

(declare-fun c!82680 () Bool)

(assert (=> b!754704 (= c!82680 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754705 () Bool)

(declare-fun res!510111 () Bool)

(assert (=> b!754705 (=> (not res!510111) (not e!420860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754705 (= res!510111 (validKeyInArray!0 (select (arr!20069 a!3186) j!159)))))

(declare-fun b!754706 () Bool)

(declare-fun e!420868 () Bool)

(assert (=> b!754706 (= e!420870 (not e!420868))))

(declare-fun res!510096 () Bool)

(assert (=> b!754706 (=> res!510096 e!420868)))

(get-info :version)

(assert (=> b!754706 (= res!510096 (or (not ((_ is Intermediate!7666) lt!335766)) (bvslt x!1131 (x!63947 lt!335766)) (not (= x!1131 (x!63947 lt!335766))) (not (= index!1321 (index!33034 lt!335766)))))))

(assert (=> b!754706 e!420865))

(declare-fun res!510114 () Bool)

(assert (=> b!754706 (=> (not res!510114) (not e!420865))))

(declare-fun lt!335774 () SeekEntryResult!7666)

(assert (=> b!754706 (= res!510114 (= lt!335774 lt!335775))))

(assert (=> b!754706 (= lt!335775 (Found!7666 j!159))))

(assert (=> b!754706 (= lt!335774 (seekEntryOrOpen!0 (select (arr!20069 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754706 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335769 () Unit!26024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26024)

(assert (=> b!754706 (= lt!335769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754707 () Bool)

(declare-fun Unit!26027 () Unit!26024)

(assert (=> b!754707 (= e!420869 Unit!26027)))

(assert (=> b!754707 false))

(declare-fun b!754708 () Bool)

(assert (=> b!754708 (= e!420861 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) (Found!7666 j!159)))))

(declare-fun res!510101 () Bool)

(assert (=> start!65720 (=> (not res!510101) (not e!420860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65720 (= res!510101 (validMask!0 mask!3328))))

(assert (=> start!65720 e!420860))

(assert (=> start!65720 true))

(declare-fun array_inv!15952 (array!41910) Bool)

(assert (=> start!65720 (array_inv!15952 a!3186)))

(declare-fun b!754696 () Bool)

(assert (=> b!754696 (= e!420868 e!420871)))

(declare-fun res!510110 () Bool)

(assert (=> b!754696 (=> res!510110 e!420871)))

(declare-fun lt!335777 () SeekEntryResult!7666)

(assert (=> b!754696 (= res!510110 (not (= lt!335777 lt!335775)))))

(assert (=> b!754696 (= lt!335777 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20069 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754709 () Bool)

(assert (=> b!754709 (= e!420861 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20069 a!3186) j!159) a!3186 mask!3328) lt!335768))))

(declare-fun b!754710 () Bool)

(declare-fun res!510103 () Bool)

(assert (=> b!754710 (=> (not res!510103) (not e!420860))))

(assert (=> b!754710 (= res!510103 (validKeyInArray!0 k0!2102))))

(declare-fun b!754711 () Bool)

(declare-fun res!510113 () Bool)

(assert (=> b!754711 (=> (not res!510113) (not e!420862))))

(assert (=> b!754711 (= res!510113 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20069 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754712 () Bool)

(declare-fun res!510104 () Bool)

(assert (=> b!754712 (=> (not res!510104) (not e!420860))))

(assert (=> b!754712 (= res!510104 (and (= (size!20490 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20490 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20490 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754713 () Bool)

(assert (=> b!754713 (= e!420864 (= lt!335774 lt!335777))))

(declare-fun b!754714 () Bool)

(assert (=> b!754714 (= e!420860 e!420866)))

(declare-fun res!510100 () Bool)

(assert (=> b!754714 (=> (not res!510100) (not e!420866))))

(declare-fun lt!335776 () SeekEntryResult!7666)

(assert (=> b!754714 (= res!510100 (or (= lt!335776 (MissingZero!7666 i!1173)) (= lt!335776 (MissingVacant!7666 i!1173))))))

(assert (=> b!754714 (= lt!335776 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754715 () Bool)

(declare-fun res!510098 () Bool)

(assert (=> b!754715 (=> (not res!510098) (not e!420866))))

(declare-datatypes ((List!14110 0))(
  ( (Nil!14107) (Cons!14106 (h!15178 (_ BitVec 64)) (t!20416 List!14110)) )
))
(declare-fun arrayNoDuplicates!0 (array!41910 (_ BitVec 32) List!14110) Bool)

(assert (=> b!754715 (= res!510098 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14107))))

(assert (= (and start!65720 res!510101) b!754712))

(assert (= (and b!754712 res!510104) b!754705))

(assert (= (and b!754705 res!510111) b!754710))

(assert (= (and b!754710 res!510103) b!754702))

(assert (= (and b!754702 res!510112) b!754714))

(assert (= (and b!754714 res!510100) b!754700))

(assert (= (and b!754700 res!510109) b!754715))

(assert (= (and b!754715 res!510098) b!754701))

(assert (= (and b!754701 res!510102) b!754703))

(assert (= (and b!754703 res!510106) b!754711))

(assert (= (and b!754711 res!510113) b!754704))

(assert (= (and b!754704 c!82680) b!754709))

(assert (= (and b!754704 (not c!82680)) b!754708))

(assert (= (and b!754704 res!510108) b!754694))

(assert (= (and b!754694 res!510097) b!754706))

(assert (= (and b!754706 res!510114) b!754699))

(assert (= (and b!754706 (not res!510096)) b!754696))

(assert (= (and b!754696 (not res!510110)) b!754697))

(assert (= (and b!754697 (not res!510099)) b!754695))

(assert (= (and b!754695 c!82679) b!754707))

(assert (= (and b!754695 (not c!82679)) b!754698))

(assert (= (and b!754695 res!510105) b!754693))

(assert (= (and b!754693 res!510107) b!754713))

(declare-fun m!702509 () Bool)

(assert (=> b!754697 m!702509))

(declare-fun m!702511 () Bool)

(assert (=> b!754697 m!702511))

(declare-fun m!702513 () Bool)

(assert (=> b!754709 m!702513))

(assert (=> b!754709 m!702513))

(declare-fun m!702515 () Bool)

(assert (=> b!754709 m!702515))

(declare-fun m!702517 () Bool)

(assert (=> b!754711 m!702517))

(declare-fun m!702519 () Bool)

(assert (=> b!754714 m!702519))

(declare-fun m!702521 () Bool)

(assert (=> b!754715 m!702521))

(assert (=> b!754708 m!702513))

(assert (=> b!754708 m!702513))

(declare-fun m!702523 () Bool)

(assert (=> b!754708 m!702523))

(declare-fun m!702525 () Bool)

(assert (=> start!65720 m!702525))

(declare-fun m!702527 () Bool)

(assert (=> start!65720 m!702527))

(assert (=> b!754703 m!702513))

(assert (=> b!754703 m!702513))

(declare-fun m!702529 () Bool)

(assert (=> b!754703 m!702529))

(assert (=> b!754703 m!702529))

(assert (=> b!754703 m!702513))

(declare-fun m!702531 () Bool)

(assert (=> b!754703 m!702531))

(declare-fun m!702533 () Bool)

(assert (=> b!754702 m!702533))

(assert (=> b!754699 m!702513))

(assert (=> b!754699 m!702513))

(declare-fun m!702535 () Bool)

(assert (=> b!754699 m!702535))

(assert (=> b!754706 m!702513))

(assert (=> b!754706 m!702513))

(declare-fun m!702537 () Bool)

(assert (=> b!754706 m!702537))

(declare-fun m!702539 () Bool)

(assert (=> b!754706 m!702539))

(declare-fun m!702541 () Bool)

(assert (=> b!754706 m!702541))

(assert (=> b!754694 m!702509))

(declare-fun m!702543 () Bool)

(assert (=> b!754694 m!702543))

(declare-fun m!702545 () Bool)

(assert (=> b!754694 m!702545))

(declare-fun m!702547 () Bool)

(assert (=> b!754694 m!702547))

(assert (=> b!754694 m!702543))

(declare-fun m!702549 () Bool)

(assert (=> b!754694 m!702549))

(assert (=> b!754705 m!702513))

(assert (=> b!754705 m!702513))

(declare-fun m!702551 () Bool)

(assert (=> b!754705 m!702551))

(declare-fun m!702553 () Bool)

(assert (=> b!754710 m!702553))

(declare-fun m!702555 () Bool)

(assert (=> b!754693 m!702555))

(declare-fun m!702557 () Bool)

(assert (=> b!754693 m!702557))

(declare-fun m!702559 () Bool)

(assert (=> b!754700 m!702559))

(assert (=> b!754696 m!702513))

(assert (=> b!754696 m!702513))

(assert (=> b!754696 m!702523))

(check-sat (not b!754703) (not b!754696) (not b!754714) (not b!754700) (not b!754694) (not b!754710) (not b!754706) (not b!754715) (not b!754702) (not start!65720) (not b!754699) (not b!754693) (not b!754705) (not b!754709) (not b!754708))
(check-sat)
