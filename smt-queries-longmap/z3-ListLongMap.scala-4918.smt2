; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67754 () Bool)

(assert start!67754)

(declare-datatypes ((array!42794 0))(
  ( (array!42795 (arr!20485 (Array (_ BitVec 32) (_ BitVec 64))) (size!20906 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42794)

(declare-fun b!786725 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!437333 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8085 0))(
  ( (MissingZero!8085 (index!34708 (_ BitVec 32))) (Found!8085 (index!34709 (_ BitVec 32))) (Intermediate!8085 (undefined!8897 Bool) (index!34710 (_ BitVec 32)) (x!65649 (_ BitVec 32))) (Undefined!8085) (MissingVacant!8085 (index!34711 (_ BitVec 32))) )
))
(declare-fun lt!350885 () SeekEntryResult!8085)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42794 (_ BitVec 32)) SeekEntryResult!8085)

(assert (=> b!786725 (= e!437333 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!350885))))

(declare-fun b!786726 () Bool)

(declare-fun e!437335 () Bool)

(declare-fun e!437326 () Bool)

(assert (=> b!786726 (= e!437335 e!437326)))

(declare-fun res!532729 () Bool)

(assert (=> b!786726 (=> (not res!532729) (not e!437326))))

(declare-fun lt!350887 () SeekEntryResult!8085)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786726 (= res!532729 (or (= lt!350887 (MissingZero!8085 i!1173)) (= lt!350887 (MissingVacant!8085 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42794 (_ BitVec 32)) SeekEntryResult!8085)

(assert (=> b!786726 (= lt!350887 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786727 () Bool)

(declare-fun res!532741 () Bool)

(assert (=> b!786727 (=> (not res!532741) (not e!437335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786727 (= res!532741 (validKeyInArray!0 k0!2102))))

(declare-fun b!786728 () Bool)

(declare-datatypes ((Unit!27228 0))(
  ( (Unit!27229) )
))
(declare-fun e!437332 () Unit!27228)

(declare-fun Unit!27230 () Unit!27228)

(assert (=> b!786728 (= e!437332 Unit!27230)))

(declare-fun b!786729 () Bool)

(declare-fun res!532733 () Bool)

(assert (=> b!786729 (=> (not res!532733) (not e!437326))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786729 (= res!532733 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20906 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20906 a!3186))))))

(declare-fun b!786730 () Bool)

(declare-fun e!437329 () Bool)

(declare-fun lt!350879 () SeekEntryResult!8085)

(declare-fun lt!350883 () SeekEntryResult!8085)

(assert (=> b!786730 (= e!437329 (= lt!350879 lt!350883))))

(declare-fun res!532737 () Bool)

(assert (=> start!67754 (=> (not res!532737) (not e!437335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67754 (= res!532737 (validMask!0 mask!3328))))

(assert (=> start!67754 e!437335))

(assert (=> start!67754 true))

(declare-fun array_inv!16281 (array!42794) Bool)

(assert (=> start!67754 (array_inv!16281 a!3186)))

(declare-fun b!786731 () Bool)

(declare-fun e!437336 () Bool)

(declare-fun e!437328 () Bool)

(assert (=> b!786731 (= e!437336 (not e!437328))))

(declare-fun res!532727 () Bool)

(assert (=> b!786731 (=> res!532727 e!437328)))

(declare-fun lt!350884 () SeekEntryResult!8085)

(get-info :version)

(assert (=> b!786731 (= res!532727 (or (not ((_ is Intermediate!8085) lt!350884)) (bvslt x!1131 (x!65649 lt!350884)) (not (= x!1131 (x!65649 lt!350884))) (not (= index!1321 (index!34710 lt!350884)))))))

(declare-fun e!437327 () Bool)

(assert (=> b!786731 e!437327))

(declare-fun res!532731 () Bool)

(assert (=> b!786731 (=> (not res!532731) (not e!437327))))

(declare-fun lt!350877 () SeekEntryResult!8085)

(assert (=> b!786731 (= res!532731 (= lt!350879 lt!350877))))

(assert (=> b!786731 (= lt!350877 (Found!8085 j!159))))

(assert (=> b!786731 (= lt!350879 (seekEntryOrOpen!0 (select (arr!20485 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42794 (_ BitVec 32)) Bool)

(assert (=> b!786731 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350888 () Unit!27228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27228)

(assert (=> b!786731 (= lt!350888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786732 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42794 (_ BitVec 32)) SeekEntryResult!8085)

(assert (=> b!786732 (= e!437327 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!350877))))

(declare-fun b!786733 () Bool)

(declare-fun e!437325 () Bool)

(assert (=> b!786733 (= e!437326 e!437325)))

(declare-fun res!532738 () Bool)

(assert (=> b!786733 (=> (not res!532738) (not e!437325))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786733 (= res!532738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20485 a!3186) j!159) mask!3328) (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!350885))))

(assert (=> b!786733 (= lt!350885 (Intermediate!8085 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786734 () Bool)

(declare-fun e!437334 () Bool)

(assert (=> b!786734 (= e!437334 true)))

(assert (=> b!786734 e!437329))

(declare-fun res!532739 () Bool)

(assert (=> b!786734 (=> (not res!532739) (not e!437329))))

(declare-fun lt!350882 () (_ BitVec 64))

(assert (=> b!786734 (= res!532739 (= lt!350882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350880 () Unit!27228)

(assert (=> b!786734 (= lt!350880 e!437332)))

(declare-fun c!87409 () Bool)

(assert (=> b!786734 (= c!87409 (= lt!350882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786735 () Bool)

(declare-fun res!532742 () Bool)

(assert (=> b!786735 (=> (not res!532742) (not e!437335))))

(declare-fun arrayContainsKey!0 (array!42794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786735 (= res!532742 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786736 () Bool)

(declare-fun e!437330 () Bool)

(assert (=> b!786736 (= e!437328 e!437330)))

(declare-fun res!532730 () Bool)

(assert (=> b!786736 (=> res!532730 e!437330)))

(assert (=> b!786736 (= res!532730 (not (= lt!350883 lt!350877)))))

(assert (=> b!786736 (= lt!350883 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786737 () Bool)

(declare-fun res!532735 () Bool)

(assert (=> b!786737 (=> (not res!532735) (not e!437325))))

(assert (=> b!786737 (= res!532735 e!437333)))

(declare-fun c!87408 () Bool)

(assert (=> b!786737 (= c!87408 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786738 () Bool)

(declare-fun res!532732 () Bool)

(assert (=> b!786738 (=> (not res!532732) (not e!437329))))

(declare-fun lt!350878 () (_ BitVec 64))

(declare-fun lt!350881 () array!42794)

(assert (=> b!786738 (= res!532732 (= (seekEntryOrOpen!0 lt!350878 lt!350881 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350878 lt!350881 mask!3328)))))

(declare-fun b!786739 () Bool)

(declare-fun res!532724 () Bool)

(assert (=> b!786739 (=> (not res!532724) (not e!437325))))

(assert (=> b!786739 (= res!532724 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20485 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786740 () Bool)

(declare-fun res!532736 () Bool)

(assert (=> b!786740 (=> (not res!532736) (not e!437335))))

(assert (=> b!786740 (= res!532736 (validKeyInArray!0 (select (arr!20485 a!3186) j!159)))))

(declare-fun b!786741 () Bool)

(declare-fun Unit!27231 () Unit!27228)

(assert (=> b!786741 (= e!437332 Unit!27231)))

(assert (=> b!786741 false))

(declare-fun b!786742 () Bool)

(assert (=> b!786742 (= e!437325 e!437336)))

(declare-fun res!532728 () Bool)

(assert (=> b!786742 (=> (not res!532728) (not e!437336))))

(declare-fun lt!350886 () SeekEntryResult!8085)

(assert (=> b!786742 (= res!532728 (= lt!350886 lt!350884))))

(assert (=> b!786742 (= lt!350884 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350878 lt!350881 mask!3328))))

(assert (=> b!786742 (= lt!350886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350878 mask!3328) lt!350878 lt!350881 mask!3328))))

(assert (=> b!786742 (= lt!350878 (select (store (arr!20485 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786742 (= lt!350881 (array!42795 (store (arr!20485 a!3186) i!1173 k0!2102) (size!20906 a!3186)))))

(declare-fun b!786743 () Bool)

(assert (=> b!786743 (= e!437333 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) (Found!8085 j!159)))))

(declare-fun b!786744 () Bool)

(declare-fun res!532725 () Bool)

(assert (=> b!786744 (=> (not res!532725) (not e!437335))))

(assert (=> b!786744 (= res!532725 (and (= (size!20906 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20906 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20906 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786745 () Bool)

(declare-fun res!532740 () Bool)

(assert (=> b!786745 (=> (not res!532740) (not e!437326))))

(assert (=> b!786745 (= res!532740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786746 () Bool)

(assert (=> b!786746 (= e!437330 e!437334)))

(declare-fun res!532734 () Bool)

(assert (=> b!786746 (=> res!532734 e!437334)))

(assert (=> b!786746 (= res!532734 (= lt!350882 lt!350878))))

(assert (=> b!786746 (= lt!350882 (select (store (arr!20485 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786747 () Bool)

(declare-fun res!532726 () Bool)

(assert (=> b!786747 (=> (not res!532726) (not e!437326))))

(declare-datatypes ((List!14487 0))(
  ( (Nil!14484) (Cons!14483 (h!15606 (_ BitVec 64)) (t!20802 List!14487)) )
))
(declare-fun arrayNoDuplicates!0 (array!42794 (_ BitVec 32) List!14487) Bool)

(assert (=> b!786747 (= res!532726 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14484))))

(assert (= (and start!67754 res!532737) b!786744))

(assert (= (and b!786744 res!532725) b!786740))

(assert (= (and b!786740 res!532736) b!786727))

(assert (= (and b!786727 res!532741) b!786735))

(assert (= (and b!786735 res!532742) b!786726))

(assert (= (and b!786726 res!532729) b!786745))

(assert (= (and b!786745 res!532740) b!786747))

(assert (= (and b!786747 res!532726) b!786729))

(assert (= (and b!786729 res!532733) b!786733))

(assert (= (and b!786733 res!532738) b!786739))

(assert (= (and b!786739 res!532724) b!786737))

(assert (= (and b!786737 c!87408) b!786725))

(assert (= (and b!786737 (not c!87408)) b!786743))

(assert (= (and b!786737 res!532735) b!786742))

(assert (= (and b!786742 res!532728) b!786731))

(assert (= (and b!786731 res!532731) b!786732))

(assert (= (and b!786731 (not res!532727)) b!786736))

(assert (= (and b!786736 (not res!532730)) b!786746))

(assert (= (and b!786746 (not res!532734)) b!786734))

(assert (= (and b!786734 c!87409) b!786741))

(assert (= (and b!786734 (not c!87409)) b!786728))

(assert (= (and b!786734 res!532739) b!786738))

(assert (= (and b!786738 res!532732) b!786730))

(declare-fun m!728481 () Bool)

(assert (=> b!786733 m!728481))

(assert (=> b!786733 m!728481))

(declare-fun m!728483 () Bool)

(assert (=> b!786733 m!728483))

(assert (=> b!786733 m!728483))

(assert (=> b!786733 m!728481))

(declare-fun m!728485 () Bool)

(assert (=> b!786733 m!728485))

(assert (=> b!786736 m!728481))

(assert (=> b!786736 m!728481))

(declare-fun m!728487 () Bool)

(assert (=> b!786736 m!728487))

(declare-fun m!728489 () Bool)

(assert (=> b!786739 m!728489))

(declare-fun m!728491 () Bool)

(assert (=> b!786745 m!728491))

(declare-fun m!728493 () Bool)

(assert (=> b!786727 m!728493))

(declare-fun m!728495 () Bool)

(assert (=> b!786735 m!728495))

(assert (=> b!786732 m!728481))

(assert (=> b!786732 m!728481))

(declare-fun m!728497 () Bool)

(assert (=> b!786732 m!728497))

(assert (=> b!786740 m!728481))

(assert (=> b!786740 m!728481))

(declare-fun m!728499 () Bool)

(assert (=> b!786740 m!728499))

(declare-fun m!728501 () Bool)

(assert (=> b!786742 m!728501))

(declare-fun m!728503 () Bool)

(assert (=> b!786742 m!728503))

(declare-fun m!728505 () Bool)

(assert (=> b!786742 m!728505))

(declare-fun m!728507 () Bool)

(assert (=> b!786742 m!728507))

(assert (=> b!786742 m!728505))

(declare-fun m!728509 () Bool)

(assert (=> b!786742 m!728509))

(declare-fun m!728511 () Bool)

(assert (=> b!786747 m!728511))

(declare-fun m!728513 () Bool)

(assert (=> b!786738 m!728513))

(declare-fun m!728515 () Bool)

(assert (=> b!786738 m!728515))

(assert (=> b!786743 m!728481))

(assert (=> b!786743 m!728481))

(assert (=> b!786743 m!728487))

(assert (=> b!786746 m!728503))

(declare-fun m!728517 () Bool)

(assert (=> b!786746 m!728517))

(assert (=> b!786725 m!728481))

(assert (=> b!786725 m!728481))

(declare-fun m!728519 () Bool)

(assert (=> b!786725 m!728519))

(assert (=> b!786731 m!728481))

(assert (=> b!786731 m!728481))

(declare-fun m!728521 () Bool)

(assert (=> b!786731 m!728521))

(declare-fun m!728523 () Bool)

(assert (=> b!786731 m!728523))

(declare-fun m!728525 () Bool)

(assert (=> b!786731 m!728525))

(declare-fun m!728527 () Bool)

(assert (=> b!786726 m!728527))

(declare-fun m!728529 () Bool)

(assert (=> start!67754 m!728529))

(declare-fun m!728531 () Bool)

(assert (=> start!67754 m!728531))

(check-sat (not b!786726) (not b!786738) (not b!786732) (not b!786727) (not b!786725) (not b!786740) (not b!786736) (not b!786743) (not start!67754) (not b!786747) (not b!786742) (not b!786731) (not b!786733) (not b!786735) (not b!786745))
(check-sat)
