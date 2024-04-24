; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45734 () Bool)

(assert start!45734)

(declare-fun b!505839 () Bool)

(declare-fun res!306908 () Bool)

(declare-fun e!296087 () Bool)

(assert (=> b!505839 (=> (not res!306908) (not e!296087))))

(declare-datatypes ((array!32491 0))(
  ( (array!32492 (arr!15625 (Array (_ BitVec 32) (_ BitVec 64))) (size!15989 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32491)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505839 (= res!306908 (validKeyInArray!0 (select (arr!15625 a!3235) j!176)))))

(declare-fun b!505840 () Bool)

(declare-fun res!306913 () Bool)

(assert (=> b!505840 (=> (not res!306913) (not e!296087))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505840 (= res!306913 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505841 () Bool)

(declare-fun res!306902 () Bool)

(assert (=> b!505841 (=> (not res!306902) (not e!296087))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505841 (= res!306902 (and (= (size!15989 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15989 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15989 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505842 () Bool)

(declare-fun res!306910 () Bool)

(declare-fun e!296094 () Bool)

(assert (=> b!505842 (=> (not res!306910) (not e!296094))))

(declare-datatypes ((List!9690 0))(
  ( (Nil!9687) (Cons!9686 (h!10563 (_ BitVec 64)) (t!15910 List!9690)) )
))
(declare-fun arrayNoDuplicates!0 (array!32491 (_ BitVec 32) List!9690) Bool)

(assert (=> b!505842 (= res!306910 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9687))))

(declare-fun b!505843 () Bool)

(declare-fun e!296089 () Bool)

(declare-fun e!296093 () Bool)

(assert (=> b!505843 (= e!296089 e!296093)))

(declare-fun res!306911 () Bool)

(assert (=> b!505843 (=> res!306911 e!296093)))

(declare-datatypes ((SeekEntryResult!4048 0))(
  ( (MissingZero!4048 (index!18380 (_ BitVec 32))) (Found!4048 (index!18381 (_ BitVec 32))) (Intermediate!4048 (undefined!4860 Bool) (index!18382 (_ BitVec 32)) (x!47534 (_ BitVec 32))) (Undefined!4048) (MissingVacant!4048 (index!18383 (_ BitVec 32))) )
))
(declare-fun lt!230731 () SeekEntryResult!4048)

(declare-fun lt!230729 () (_ BitVec 32))

(assert (=> b!505843 (= res!306911 (or (bvsgt (x!47534 lt!230731) #b01111111111111111111111111111110) (bvslt lt!230729 #b00000000000000000000000000000000) (bvsge lt!230729 (size!15989 a!3235)) (bvslt (index!18382 lt!230731) #b00000000000000000000000000000000) (bvsge (index!18382 lt!230731) (size!15989 a!3235)) (not (= lt!230731 (Intermediate!4048 false (index!18382 lt!230731) (x!47534 lt!230731))))))))

(assert (=> b!505843 (= (index!18382 lt!230731) i!1204)))

(declare-datatypes ((Unit!15427 0))(
  ( (Unit!15428) )
))
(declare-fun lt!230733 () Unit!15427)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15427)

(assert (=> b!505843 (= lt!230733 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230729 #b00000000000000000000000000000000 (index!18382 lt!230731) (x!47534 lt!230731) mask!3524))))

(assert (=> b!505843 (and (or (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230728 () Unit!15427)

(declare-fun e!296086 () Unit!15427)

(assert (=> b!505843 (= lt!230728 e!296086)))

(declare-fun c!59747 () Bool)

(assert (=> b!505843 (= c!59747 (= (select (arr!15625 a!3235) (index!18382 lt!230731)) (select (arr!15625 a!3235) j!176)))))

(assert (=> b!505843 (and (bvslt (x!47534 lt!230731) #b01111111111111111111111111111110) (or (= (select (arr!15625 a!3235) (index!18382 lt!230731)) (select (arr!15625 a!3235) j!176)) (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15625 a!3235) (index!18382 lt!230731)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505844 () Bool)

(declare-fun e!296091 () Bool)

(assert (=> b!505844 (= e!296091 false)))

(declare-fun e!296092 () Bool)

(declare-fun b!505846 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32491 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!505846 (= e!296092 (= (seekEntryOrOpen!0 (select (arr!15625 a!3235) j!176) a!3235 mask!3524) (Found!4048 j!176)))))

(declare-fun b!505847 () Bool)

(assert (=> b!505847 (= e!296087 e!296094)))

(declare-fun res!306906 () Bool)

(assert (=> b!505847 (=> (not res!306906) (not e!296094))))

(declare-fun lt!230724 () SeekEntryResult!4048)

(assert (=> b!505847 (= res!306906 (or (= lt!230724 (MissingZero!4048 i!1204)) (= lt!230724 (MissingVacant!4048 i!1204))))))

(assert (=> b!505847 (= lt!230724 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505848 () Bool)

(declare-fun res!306916 () Bool)

(assert (=> b!505848 (=> res!306916 e!296093)))

(declare-fun e!296088 () Bool)

(assert (=> b!505848 (= res!306916 e!296088)))

(declare-fun res!306912 () Bool)

(assert (=> b!505848 (=> (not res!306912) (not e!296088))))

(assert (=> b!505848 (= res!306912 (bvsgt #b00000000000000000000000000000000 (x!47534 lt!230731)))))

(declare-fun b!505849 () Bool)

(declare-fun Unit!15429 () Unit!15427)

(assert (=> b!505849 (= e!296086 Unit!15429)))

(declare-fun lt!230734 () Unit!15427)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15427)

(assert (=> b!505849 (= lt!230734 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230729 #b00000000000000000000000000000000 (index!18382 lt!230731) (x!47534 lt!230731) mask!3524))))

(declare-fun lt!230732 () array!32491)

(declare-fun res!306903 () Bool)

(declare-fun lt!230727 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32491 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!505849 (= res!306903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230729 lt!230727 lt!230732 mask!3524) (Intermediate!4048 false (index!18382 lt!230731) (x!47534 lt!230731))))))

(assert (=> b!505849 (=> (not res!306903) (not e!296091))))

(assert (=> b!505849 e!296091))

(declare-fun b!505850 () Bool)

(assert (=> b!505850 (= e!296094 (not e!296089))))

(declare-fun res!306909 () Bool)

(assert (=> b!505850 (=> res!306909 e!296089)))

(declare-fun lt!230726 () SeekEntryResult!4048)

(get-info :version)

(assert (=> b!505850 (= res!306909 (or (= lt!230731 lt!230726) (undefined!4860 lt!230731) (not ((_ is Intermediate!4048) lt!230731))))))

(declare-fun lt!230730 () (_ BitVec 32))

(assert (=> b!505850 (= lt!230726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230730 lt!230727 lt!230732 mask!3524))))

(assert (=> b!505850 (= lt!230731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230729 (select (arr!15625 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505850 (= lt!230730 (toIndex!0 lt!230727 mask!3524))))

(assert (=> b!505850 (= lt!230727 (select (store (arr!15625 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505850 (= lt!230729 (toIndex!0 (select (arr!15625 a!3235) j!176) mask!3524))))

(assert (=> b!505850 (= lt!230732 (array!32492 (store (arr!15625 a!3235) i!1204 k0!2280) (size!15989 a!3235)))))

(declare-fun lt!230725 () SeekEntryResult!4048)

(assert (=> b!505850 (= lt!230725 (Found!4048 j!176))))

(assert (=> b!505850 e!296092))

(declare-fun res!306904 () Bool)

(assert (=> b!505850 (=> (not res!306904) (not e!296092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32491 (_ BitVec 32)) Bool)

(assert (=> b!505850 (= res!306904 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230722 () Unit!15427)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15427)

(assert (=> b!505850 (= lt!230722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505851 () Bool)

(assert (=> b!505851 (= e!296093 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!505851 (= (seekEntryOrOpen!0 lt!230727 lt!230732 mask!3524) lt!230725)))

(declare-fun lt!230723 () Unit!15427)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15427)

(assert (=> b!505851 (= lt!230723 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230729 #b00000000000000000000000000000000 (index!18382 lt!230731) (x!47534 lt!230731) mask!3524))))

(declare-fun b!505852 () Bool)

(declare-fun res!306915 () Bool)

(assert (=> b!505852 (=> (not res!306915) (not e!296087))))

(assert (=> b!505852 (= res!306915 (validKeyInArray!0 k0!2280))))

(declare-fun b!505853 () Bool)

(declare-fun Unit!15430 () Unit!15427)

(assert (=> b!505853 (= e!296086 Unit!15430)))

(declare-fun b!505854 () Bool)

(declare-fun res!306914 () Bool)

(assert (=> b!505854 (=> res!306914 e!296093)))

(assert (=> b!505854 (= res!306914 (not (= lt!230726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230729 lt!230727 lt!230732 mask!3524))))))

(declare-fun b!505855 () Bool)

(declare-fun res!306907 () Bool)

(assert (=> b!505855 (=> (not res!306907) (not e!296094))))

(assert (=> b!505855 (= res!306907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505845 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32491 (_ BitVec 32)) SeekEntryResult!4048)

(assert (=> b!505845 (= e!296088 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230729 (index!18382 lt!230731) (select (arr!15625 a!3235) j!176) a!3235 mask!3524) lt!230725)))))

(declare-fun res!306905 () Bool)

(assert (=> start!45734 (=> (not res!306905) (not e!296087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45734 (= res!306905 (validMask!0 mask!3524))))

(assert (=> start!45734 e!296087))

(assert (=> start!45734 true))

(declare-fun array_inv!11484 (array!32491) Bool)

(assert (=> start!45734 (array_inv!11484 a!3235)))

(assert (= (and start!45734 res!306905) b!505841))

(assert (= (and b!505841 res!306902) b!505839))

(assert (= (and b!505839 res!306908) b!505852))

(assert (= (and b!505852 res!306915) b!505840))

(assert (= (and b!505840 res!306913) b!505847))

(assert (= (and b!505847 res!306906) b!505855))

(assert (= (and b!505855 res!306907) b!505842))

(assert (= (and b!505842 res!306910) b!505850))

(assert (= (and b!505850 res!306904) b!505846))

(assert (= (and b!505850 (not res!306909)) b!505843))

(assert (= (and b!505843 c!59747) b!505849))

(assert (= (and b!505843 (not c!59747)) b!505853))

(assert (= (and b!505849 res!306903) b!505844))

(assert (= (and b!505843 (not res!306911)) b!505848))

(assert (= (and b!505848 res!306912) b!505845))

(assert (= (and b!505848 (not res!306916)) b!505854))

(assert (= (and b!505854 (not res!306914)) b!505851))

(declare-fun m!486739 () Bool)

(assert (=> b!505840 m!486739))

(declare-fun m!486741 () Bool)

(assert (=> b!505839 m!486741))

(assert (=> b!505839 m!486741))

(declare-fun m!486743 () Bool)

(assert (=> b!505839 m!486743))

(declare-fun m!486745 () Bool)

(assert (=> b!505854 m!486745))

(declare-fun m!486747 () Bool)

(assert (=> b!505842 m!486747))

(declare-fun m!486749 () Bool)

(assert (=> b!505850 m!486749))

(declare-fun m!486751 () Bool)

(assert (=> b!505850 m!486751))

(declare-fun m!486753 () Bool)

(assert (=> b!505850 m!486753))

(assert (=> b!505850 m!486741))

(declare-fun m!486755 () Bool)

(assert (=> b!505850 m!486755))

(assert (=> b!505850 m!486741))

(declare-fun m!486757 () Bool)

(assert (=> b!505850 m!486757))

(assert (=> b!505850 m!486741))

(declare-fun m!486759 () Bool)

(assert (=> b!505850 m!486759))

(declare-fun m!486761 () Bool)

(assert (=> b!505850 m!486761))

(declare-fun m!486763 () Bool)

(assert (=> b!505850 m!486763))

(declare-fun m!486765 () Bool)

(assert (=> start!45734 m!486765))

(declare-fun m!486767 () Bool)

(assert (=> start!45734 m!486767))

(declare-fun m!486769 () Bool)

(assert (=> b!505851 m!486769))

(declare-fun m!486771 () Bool)

(assert (=> b!505851 m!486771))

(declare-fun m!486773 () Bool)

(assert (=> b!505849 m!486773))

(assert (=> b!505849 m!486745))

(declare-fun m!486775 () Bool)

(assert (=> b!505843 m!486775))

(declare-fun m!486777 () Bool)

(assert (=> b!505843 m!486777))

(assert (=> b!505843 m!486741))

(assert (=> b!505845 m!486741))

(assert (=> b!505845 m!486741))

(declare-fun m!486779 () Bool)

(assert (=> b!505845 m!486779))

(declare-fun m!486781 () Bool)

(assert (=> b!505847 m!486781))

(declare-fun m!486783 () Bool)

(assert (=> b!505855 m!486783))

(assert (=> b!505846 m!486741))

(assert (=> b!505846 m!486741))

(declare-fun m!486785 () Bool)

(assert (=> b!505846 m!486785))

(declare-fun m!486787 () Bool)

(assert (=> b!505852 m!486787))

(check-sat (not b!505842) (not b!505847) (not b!505846) (not b!505843) (not b!505852) (not b!505839) (not b!505849) (not b!505855) (not b!505850) (not b!505845) (not b!505851) (not b!505840) (not start!45734) (not b!505854))
(check-sat)
