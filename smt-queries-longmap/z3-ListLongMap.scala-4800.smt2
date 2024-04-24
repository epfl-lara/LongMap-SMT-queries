; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65988 () Bool)

(assert start!65988)

(declare-fun b!759789 () Bool)

(declare-fun res!513899 () Bool)

(declare-fun e!423658 () Bool)

(assert (=> b!759789 (=> (not res!513899) (not e!423658))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42031 0))(
  ( (array!42032 (arr!20125 (Array (_ BitVec 32) (_ BitVec 64))) (size!20545 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42031)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759789 (= res!513899 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20125 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759790 () Bool)

(declare-fun res!513898 () Bool)

(declare-fun e!423655 () Bool)

(assert (=> b!759790 (=> (not res!513898) (not e!423655))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!759790 (= res!513898 (and (= (size!20545 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20545 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20545 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759791 () Bool)

(declare-fun e!423657 () Bool)

(declare-fun e!423654 () Bool)

(assert (=> b!759791 (= e!423657 e!423654)))

(declare-fun res!513909 () Bool)

(assert (=> b!759791 (=> (not res!513909) (not e!423654))))

(declare-datatypes ((SeekEntryResult!7681 0))(
  ( (MissingZero!7681 (index!33092 (_ BitVec 32))) (Found!7681 (index!33093 (_ BitVec 32))) (Intermediate!7681 (undefined!8493 Bool) (index!33094 (_ BitVec 32)) (x!64139 (_ BitVec 32))) (Undefined!7681) (MissingVacant!7681 (index!33095 (_ BitVec 32))) )
))
(declare-fun lt!338575 () SeekEntryResult!7681)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!759791 (= res!513909 (= (seekEntryOrOpen!0 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338575))))

(assert (=> b!759791 (= lt!338575 (Found!7681 j!159))))

(declare-fun b!759792 () Bool)

(declare-fun e!423660 () Bool)

(assert (=> b!759792 (= e!423658 e!423660)))

(declare-fun res!513900 () Bool)

(assert (=> b!759792 (=> (not res!513900) (not e!423660))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!338576 () (_ BitVec 64))

(declare-fun lt!338577 () array!42031)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759792 (= res!513900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338576 mask!3328) lt!338576 lt!338577 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338576 lt!338577 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!759792 (= lt!338576 (select (store (arr!20125 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759792 (= lt!338577 (array!42032 (store (arr!20125 a!3186) i!1173 k0!2102) (size!20545 a!3186)))))

(declare-fun b!759793 () Bool)

(declare-fun e!423656 () Bool)

(assert (=> b!759793 (= e!423655 e!423656)))

(declare-fun res!513907 () Bool)

(assert (=> b!759793 (=> (not res!513907) (not e!423656))))

(declare-fun lt!338578 () SeekEntryResult!7681)

(assert (=> b!759793 (= res!513907 (or (= lt!338578 (MissingZero!7681 i!1173)) (= lt!338578 (MissingVacant!7681 i!1173))))))

(assert (=> b!759793 (= lt!338578 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759794 () Bool)

(declare-fun res!513910 () Bool)

(assert (=> b!759794 (=> (not res!513910) (not e!423655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759794 (= res!513910 (validKeyInArray!0 (select (arr!20125 a!3186) j!159)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!759795 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!759795 (= e!423654 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338575))))

(declare-fun b!759796 () Bool)

(declare-fun res!513903 () Bool)

(assert (=> b!759796 (=> (not res!513903) (not e!423655))))

(declare-fun arrayContainsKey!0 (array!42031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759796 (= res!513903 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!423653 () Bool)

(declare-fun lt!338580 () SeekEntryResult!7681)

(declare-fun b!759797 () Bool)

(assert (=> b!759797 (= e!423653 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338580))))

(declare-fun res!513897 () Bool)

(assert (=> start!65988 (=> (not res!513897) (not e!423655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65988 (= res!513897 (validMask!0 mask!3328))))

(assert (=> start!65988 e!423655))

(assert (=> start!65988 true))

(declare-fun array_inv!15984 (array!42031) Bool)

(assert (=> start!65988 (array_inv!15984 a!3186)))

(declare-fun b!759798 () Bool)

(declare-fun res!513905 () Bool)

(assert (=> b!759798 (=> (not res!513905) (not e!423656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42031 (_ BitVec 32)) Bool)

(assert (=> b!759798 (= res!513905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759799 () Bool)

(declare-fun res!513901 () Bool)

(assert (=> b!759799 (=> (not res!513901) (not e!423656))))

(declare-datatypes ((List!14034 0))(
  ( (Nil!14031) (Cons!14030 (h!15108 (_ BitVec 64)) (t!20341 List!14034)) )
))
(declare-fun arrayNoDuplicates!0 (array!42031 (_ BitVec 32) List!14034) Bool)

(assert (=> b!759799 (= res!513901 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14031))))

(declare-fun b!759800 () Bool)

(declare-fun res!513902 () Bool)

(assert (=> b!759800 (=> (not res!513902) (not e!423656))))

(assert (=> b!759800 (= res!513902 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20545 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20545 a!3186))))))

(declare-fun b!759801 () Bool)

(declare-fun res!513906 () Bool)

(assert (=> b!759801 (=> (not res!513906) (not e!423658))))

(assert (=> b!759801 (= res!513906 e!423653)))

(declare-fun c!83330 () Bool)

(assert (=> b!759801 (= c!83330 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759802 () Bool)

(assert (=> b!759802 (= e!423653 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20125 a!3186) j!159) a!3186 mask!3328) (Found!7681 j!159)))))

(declare-fun b!759803 () Bool)

(assert (=> b!759803 (= e!423656 e!423658)))

(declare-fun res!513904 () Bool)

(assert (=> b!759803 (=> (not res!513904) (not e!423658))))

(assert (=> b!759803 (= res!513904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20125 a!3186) j!159) mask!3328) (select (arr!20125 a!3186) j!159) a!3186 mask!3328) lt!338580))))

(assert (=> b!759803 (= lt!338580 (Intermediate!7681 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759804 () Bool)

(assert (=> b!759804 (= e!423660 (not true))))

(assert (=> b!759804 e!423657))

(declare-fun res!513896 () Bool)

(assert (=> b!759804 (=> (not res!513896) (not e!423657))))

(assert (=> b!759804 (= res!513896 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26281 0))(
  ( (Unit!26282) )
))
(declare-fun lt!338579 () Unit!26281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26281)

(assert (=> b!759804 (= lt!338579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759805 () Bool)

(declare-fun res!513908 () Bool)

(assert (=> b!759805 (=> (not res!513908) (not e!423655))))

(assert (=> b!759805 (= res!513908 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65988 res!513897) b!759790))

(assert (= (and b!759790 res!513898) b!759794))

(assert (= (and b!759794 res!513910) b!759805))

(assert (= (and b!759805 res!513908) b!759796))

(assert (= (and b!759796 res!513903) b!759793))

(assert (= (and b!759793 res!513907) b!759798))

(assert (= (and b!759798 res!513905) b!759799))

(assert (= (and b!759799 res!513901) b!759800))

(assert (= (and b!759800 res!513902) b!759803))

(assert (= (and b!759803 res!513904) b!759789))

(assert (= (and b!759789 res!513899) b!759801))

(assert (= (and b!759801 c!83330) b!759797))

(assert (= (and b!759801 (not c!83330)) b!759802))

(assert (= (and b!759801 res!513906) b!759792))

(assert (= (and b!759792 res!513900) b!759804))

(assert (= (and b!759804 res!513896) b!759791))

(assert (= (and b!759791 res!513909) b!759795))

(declare-fun m!707601 () Bool)

(assert (=> b!759796 m!707601))

(declare-fun m!707603 () Bool)

(assert (=> start!65988 m!707603))

(declare-fun m!707605 () Bool)

(assert (=> start!65988 m!707605))

(declare-fun m!707607 () Bool)

(assert (=> b!759793 m!707607))

(declare-fun m!707609 () Bool)

(assert (=> b!759802 m!707609))

(assert (=> b!759802 m!707609))

(declare-fun m!707611 () Bool)

(assert (=> b!759802 m!707611))

(assert (=> b!759791 m!707609))

(assert (=> b!759791 m!707609))

(declare-fun m!707613 () Bool)

(assert (=> b!759791 m!707613))

(assert (=> b!759803 m!707609))

(assert (=> b!759803 m!707609))

(declare-fun m!707615 () Bool)

(assert (=> b!759803 m!707615))

(assert (=> b!759803 m!707615))

(assert (=> b!759803 m!707609))

(declare-fun m!707617 () Bool)

(assert (=> b!759803 m!707617))

(declare-fun m!707619 () Bool)

(assert (=> b!759804 m!707619))

(declare-fun m!707621 () Bool)

(assert (=> b!759804 m!707621))

(declare-fun m!707623 () Bool)

(assert (=> b!759805 m!707623))

(declare-fun m!707625 () Bool)

(assert (=> b!759792 m!707625))

(declare-fun m!707627 () Bool)

(assert (=> b!759792 m!707627))

(assert (=> b!759792 m!707625))

(declare-fun m!707629 () Bool)

(assert (=> b!759792 m!707629))

(declare-fun m!707631 () Bool)

(assert (=> b!759792 m!707631))

(declare-fun m!707633 () Bool)

(assert (=> b!759792 m!707633))

(declare-fun m!707635 () Bool)

(assert (=> b!759799 m!707635))

(assert (=> b!759795 m!707609))

(assert (=> b!759795 m!707609))

(declare-fun m!707637 () Bool)

(assert (=> b!759795 m!707637))

(assert (=> b!759794 m!707609))

(assert (=> b!759794 m!707609))

(declare-fun m!707639 () Bool)

(assert (=> b!759794 m!707639))

(assert (=> b!759797 m!707609))

(assert (=> b!759797 m!707609))

(declare-fun m!707641 () Bool)

(assert (=> b!759797 m!707641))

(declare-fun m!707643 () Bool)

(assert (=> b!759798 m!707643))

(declare-fun m!707645 () Bool)

(assert (=> b!759789 m!707645))

(check-sat (not b!759794) (not b!759805) (not b!759803) (not b!759804) (not b!759791) (not b!759795) (not b!759792) (not b!759802) (not b!759793) (not b!759798) (not b!759797) (not start!65988) (not b!759796) (not b!759799))
(check-sat)
