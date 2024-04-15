; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65690 () Bool)

(assert start!65690)

(declare-fun b!753658 () Bool)

(declare-fun res!509254 () Bool)

(declare-fun e!420322 () Bool)

(assert (=> b!753658 (=> (not res!509254) (not e!420322))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41880 0))(
  ( (array!41881 (arr!20054 (Array (_ BitVec 32) (_ BitVec 64))) (size!20475 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41880)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!753658 (= res!509254 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20475 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20475 a!3186))))))

(declare-fun b!753659 () Bool)

(declare-fun res!509248 () Bool)

(declare-fun e!420321 () Bool)

(assert (=> b!753659 (=> (not res!509248) (not e!420321))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753659 (= res!509248 (validKeyInArray!0 k0!2102))))

(declare-fun b!753660 () Bool)

(declare-fun res!509259 () Bool)

(declare-fun e!420324 () Bool)

(assert (=> b!753660 (=> (not res!509259) (not e!420324))))

(declare-fun lt!335235 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335232 () array!41880)

(declare-datatypes ((SeekEntryResult!7651 0))(
  ( (MissingZero!7651 (index!32972 (_ BitVec 32))) (Found!7651 (index!32973 (_ BitVec 32))) (Intermediate!7651 (undefined!8463 Bool) (index!32974 (_ BitVec 32)) (x!63892 (_ BitVec 32))) (Undefined!7651) (MissingVacant!7651 (index!32975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41880 (_ BitVec 32)) SeekEntryResult!7651)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41880 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!753660 (= res!509259 (= (seekEntryOrOpen!0 lt!335235 lt!335232 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335235 lt!335232 mask!3328)))))

(declare-fun b!753661 () Bool)

(declare-fun e!420320 () Bool)

(declare-fun e!420331 () Bool)

(assert (=> b!753661 (= e!420320 (not e!420331))))

(declare-fun res!509245 () Bool)

(assert (=> b!753661 (=> res!509245 e!420331)))

(declare-fun lt!335237 () SeekEntryResult!7651)

(get-info :version)

(assert (=> b!753661 (= res!509245 (or (not ((_ is Intermediate!7651) lt!335237)) (bvslt x!1131 (x!63892 lt!335237)) (not (= x!1131 (x!63892 lt!335237))) (not (= index!1321 (index!32974 lt!335237)))))))

(declare-fun e!420327 () Bool)

(assert (=> b!753661 e!420327))

(declare-fun res!509241 () Bool)

(assert (=> b!753661 (=> (not res!509241) (not e!420327))))

(declare-fun lt!335234 () SeekEntryResult!7651)

(declare-fun lt!335227 () SeekEntryResult!7651)

(assert (=> b!753661 (= res!509241 (= lt!335234 lt!335227))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753661 (= lt!335227 (Found!7651 j!159))))

(assert (=> b!753661 (= lt!335234 (seekEntryOrOpen!0 (select (arr!20054 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41880 (_ BitVec 32)) Bool)

(assert (=> b!753661 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25964 0))(
  ( (Unit!25965) )
))
(declare-fun lt!335231 () Unit!25964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25964)

(assert (=> b!753661 (= lt!335231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753662 () Bool)

(declare-fun e!420323 () Unit!25964)

(declare-fun Unit!25966 () Unit!25964)

(assert (=> b!753662 (= e!420323 Unit!25966)))

(declare-fun b!753663 () Bool)

(declare-fun lt!335230 () SeekEntryResult!7651)

(assert (=> b!753663 (= e!420324 (= lt!335234 lt!335230))))

(declare-fun b!753664 () Bool)

(declare-fun res!509256 () Bool)

(declare-fun e!420329 () Bool)

(assert (=> b!753664 (=> (not res!509256) (not e!420329))))

(declare-fun e!420330 () Bool)

(assert (=> b!753664 (= res!509256 e!420330)))

(declare-fun c!82589 () Bool)

(assert (=> b!753664 (= c!82589 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753665 () Bool)

(declare-fun res!509257 () Bool)

(assert (=> b!753665 (=> (not res!509257) (not e!420321))))

(declare-fun arrayContainsKey!0 (array!41880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753665 (= res!509257 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753666 () Bool)

(declare-fun Unit!25967 () Unit!25964)

(assert (=> b!753666 (= e!420323 Unit!25967)))

(assert (=> b!753666 false))

(declare-fun b!753668 () Bool)

(declare-fun res!509258 () Bool)

(assert (=> b!753668 (=> (not res!509258) (not e!420321))))

(assert (=> b!753668 (= res!509258 (validKeyInArray!0 (select (arr!20054 a!3186) j!159)))))

(declare-fun b!753669 () Bool)

(declare-fun e!420325 () Bool)

(declare-fun e!420328 () Bool)

(assert (=> b!753669 (= e!420325 e!420328)))

(declare-fun res!509247 () Bool)

(assert (=> b!753669 (=> res!509247 e!420328)))

(declare-fun lt!335226 () (_ BitVec 64))

(assert (=> b!753669 (= res!509247 (= lt!335226 lt!335235))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753669 (= lt!335226 (select (store (arr!20054 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753670 () Bool)

(assert (=> b!753670 (= e!420331 e!420325)))

(declare-fun res!509250 () Bool)

(assert (=> b!753670 (=> res!509250 e!420325)))

(assert (=> b!753670 (= res!509250 (not (= lt!335230 lt!335227)))))

(assert (=> b!753670 (= lt!335230 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753671 () Bool)

(assert (=> b!753671 (= e!420330 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) (Found!7651 j!159)))))

(declare-fun b!753672 () Bool)

(assert (=> b!753672 (= e!420329 e!420320)))

(declare-fun res!509255 () Bool)

(assert (=> b!753672 (=> (not res!509255) (not e!420320))))

(declare-fun lt!335233 () SeekEntryResult!7651)

(assert (=> b!753672 (= res!509255 (= lt!335233 lt!335237))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41880 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!753672 (= lt!335237 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335235 lt!335232 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753672 (= lt!335233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335235 mask!3328) lt!335235 lt!335232 mask!3328))))

(assert (=> b!753672 (= lt!335235 (select (store (arr!20054 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753672 (= lt!335232 (array!41881 (store (arr!20054 a!3186) i!1173 k0!2102) (size!20475 a!3186)))))

(declare-fun b!753673 () Bool)

(declare-fun res!509253 () Bool)

(assert (=> b!753673 (=> (not res!509253) (not e!420329))))

(assert (=> b!753673 (= res!509253 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20054 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753674 () Bool)

(declare-fun res!509251 () Bool)

(assert (=> b!753674 (=> (not res!509251) (not e!420321))))

(assert (=> b!753674 (= res!509251 (and (= (size!20475 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20475 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20475 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753675 () Bool)

(declare-fun res!509252 () Bool)

(assert (=> b!753675 (=> (not res!509252) (not e!420322))))

(declare-datatypes ((List!14095 0))(
  ( (Nil!14092) (Cons!14091 (h!15163 (_ BitVec 64)) (t!20401 List!14095)) )
))
(declare-fun arrayNoDuplicates!0 (array!41880 (_ BitVec 32) List!14095) Bool)

(assert (=> b!753675 (= res!509252 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14092))))

(declare-fun b!753676 () Bool)

(assert (=> b!753676 (= e!420328 true)))

(assert (=> b!753676 e!420324))

(declare-fun res!509242 () Bool)

(assert (=> b!753676 (=> (not res!509242) (not e!420324))))

(assert (=> b!753676 (= res!509242 (= lt!335226 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335236 () Unit!25964)

(assert (=> b!753676 (= lt!335236 e!420323)))

(declare-fun c!82590 () Bool)

(assert (=> b!753676 (= c!82590 (= lt!335226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753677 () Bool)

(assert (=> b!753677 (= e!420321 e!420322)))

(declare-fun res!509244 () Bool)

(assert (=> b!753677 (=> (not res!509244) (not e!420322))))

(declare-fun lt!335228 () SeekEntryResult!7651)

(assert (=> b!753677 (= res!509244 (or (= lt!335228 (MissingZero!7651 i!1173)) (= lt!335228 (MissingVacant!7651 i!1173))))))

(assert (=> b!753677 (= lt!335228 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753678 () Bool)

(assert (=> b!753678 (= e!420322 e!420329)))

(declare-fun res!509246 () Bool)

(assert (=> b!753678 (=> (not res!509246) (not e!420329))))

(declare-fun lt!335229 () SeekEntryResult!7651)

(assert (=> b!753678 (= res!509246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20054 a!3186) j!159) mask!3328) (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335229))))

(assert (=> b!753678 (= lt!335229 (Intermediate!7651 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!509249 () Bool)

(assert (=> start!65690 (=> (not res!509249) (not e!420321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65690 (= res!509249 (validMask!0 mask!3328))))

(assert (=> start!65690 e!420321))

(assert (=> start!65690 true))

(declare-fun array_inv!15937 (array!41880) Bool)

(assert (=> start!65690 (array_inv!15937 a!3186)))

(declare-fun b!753667 () Bool)

(assert (=> b!753667 (= e!420327 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335227))))

(declare-fun b!753679 () Bool)

(assert (=> b!753679 (= e!420330 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20054 a!3186) j!159) a!3186 mask!3328) lt!335229))))

(declare-fun b!753680 () Bool)

(declare-fun res!509243 () Bool)

(assert (=> b!753680 (=> (not res!509243) (not e!420322))))

(assert (=> b!753680 (= res!509243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65690 res!509249) b!753674))

(assert (= (and b!753674 res!509251) b!753668))

(assert (= (and b!753668 res!509258) b!753659))

(assert (= (and b!753659 res!509248) b!753665))

(assert (= (and b!753665 res!509257) b!753677))

(assert (= (and b!753677 res!509244) b!753680))

(assert (= (and b!753680 res!509243) b!753675))

(assert (= (and b!753675 res!509252) b!753658))

(assert (= (and b!753658 res!509254) b!753678))

(assert (= (and b!753678 res!509246) b!753673))

(assert (= (and b!753673 res!509253) b!753664))

(assert (= (and b!753664 c!82589) b!753679))

(assert (= (and b!753664 (not c!82589)) b!753671))

(assert (= (and b!753664 res!509256) b!753672))

(assert (= (and b!753672 res!509255) b!753661))

(assert (= (and b!753661 res!509241) b!753667))

(assert (= (and b!753661 (not res!509245)) b!753670))

(assert (= (and b!753670 (not res!509250)) b!753669))

(assert (= (and b!753669 (not res!509247)) b!753676))

(assert (= (and b!753676 c!82590) b!753666))

(assert (= (and b!753676 (not c!82590)) b!753662))

(assert (= (and b!753676 res!509242) b!753660))

(assert (= (and b!753660 res!509259) b!753663))

(declare-fun m!701729 () Bool)

(assert (=> b!753660 m!701729))

(declare-fun m!701731 () Bool)

(assert (=> b!753660 m!701731))

(declare-fun m!701733 () Bool)

(assert (=> b!753661 m!701733))

(assert (=> b!753661 m!701733))

(declare-fun m!701735 () Bool)

(assert (=> b!753661 m!701735))

(declare-fun m!701737 () Bool)

(assert (=> b!753661 m!701737))

(declare-fun m!701739 () Bool)

(assert (=> b!753661 m!701739))

(declare-fun m!701741 () Bool)

(assert (=> b!753669 m!701741))

(declare-fun m!701743 () Bool)

(assert (=> b!753669 m!701743))

(declare-fun m!701745 () Bool)

(assert (=> b!753675 m!701745))

(declare-fun m!701747 () Bool)

(assert (=> b!753680 m!701747))

(declare-fun m!701749 () Bool)

(assert (=> b!753672 m!701749))

(assert (=> b!753672 m!701741))

(declare-fun m!701751 () Bool)

(assert (=> b!753672 m!701751))

(declare-fun m!701753 () Bool)

(assert (=> b!753672 m!701753))

(assert (=> b!753672 m!701753))

(declare-fun m!701755 () Bool)

(assert (=> b!753672 m!701755))

(declare-fun m!701757 () Bool)

(assert (=> b!753677 m!701757))

(assert (=> b!753667 m!701733))

(assert (=> b!753667 m!701733))

(declare-fun m!701759 () Bool)

(assert (=> b!753667 m!701759))

(assert (=> b!753679 m!701733))

(assert (=> b!753679 m!701733))

(declare-fun m!701761 () Bool)

(assert (=> b!753679 m!701761))

(declare-fun m!701763 () Bool)

(assert (=> b!753659 m!701763))

(declare-fun m!701765 () Bool)

(assert (=> b!753665 m!701765))

(assert (=> b!753668 m!701733))

(assert (=> b!753668 m!701733))

(declare-fun m!701767 () Bool)

(assert (=> b!753668 m!701767))

(declare-fun m!701769 () Bool)

(assert (=> start!65690 m!701769))

(declare-fun m!701771 () Bool)

(assert (=> start!65690 m!701771))

(declare-fun m!701773 () Bool)

(assert (=> b!753673 m!701773))

(assert (=> b!753670 m!701733))

(assert (=> b!753670 m!701733))

(declare-fun m!701775 () Bool)

(assert (=> b!753670 m!701775))

(assert (=> b!753678 m!701733))

(assert (=> b!753678 m!701733))

(declare-fun m!701777 () Bool)

(assert (=> b!753678 m!701777))

(assert (=> b!753678 m!701777))

(assert (=> b!753678 m!701733))

(declare-fun m!701779 () Bool)

(assert (=> b!753678 m!701779))

(assert (=> b!753671 m!701733))

(assert (=> b!753671 m!701733))

(assert (=> b!753671 m!701775))

(check-sat (not b!753667) (not b!753661) (not b!753675) (not b!753677) (not b!753678) (not b!753679) (not start!65690) (not b!753680) (not b!753672) (not b!753670) (not b!753659) (not b!753665) (not b!753660) (not b!753668) (not b!753671))
(check-sat)
