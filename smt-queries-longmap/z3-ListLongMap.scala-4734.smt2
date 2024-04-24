; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65592 () Bool)

(assert start!65592)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41635 0))(
  ( (array!41636 (arr!19927 (Array (_ BitVec 32) (_ BitVec 64))) (size!20347 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41635)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7483 0))(
  ( (MissingZero!7483 (index!32300 (_ BitVec 32))) (Found!7483 (index!32301 (_ BitVec 32))) (Intermediate!7483 (undefined!8295 Bool) (index!32302 (_ BitVec 32)) (x!63413 (_ BitVec 32))) (Undefined!7483) (MissingVacant!7483 (index!32303 (_ BitVec 32))) )
))
(declare-fun lt!331782 () SeekEntryResult!7483)

(declare-fun b!746732 () Bool)

(declare-fun e!417094 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!746732 (= e!417094 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331782))))

(declare-fun b!746733 () Bool)

(declare-fun res!503110 () Bool)

(declare-fun e!417101 () Bool)

(assert (=> b!746733 (=> (not res!503110) (not e!417101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41635 (_ BitVec 32)) Bool)

(assert (=> b!746733 (= res!503110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!746734 () Bool)

(declare-fun e!417100 () Bool)

(assert (=> b!746734 (= e!417100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) (Found!7483 j!159)))))

(declare-fun b!746735 () Bool)

(declare-fun e!417097 () Bool)

(assert (=> b!746735 (= e!417097 true)))

(declare-fun lt!331788 () SeekEntryResult!7483)

(declare-fun lt!331785 () SeekEntryResult!7483)

(assert (=> b!746735 (= lt!331788 lt!331785)))

(declare-fun b!746736 () Bool)

(declare-fun res!503119 () Bool)

(declare-fun e!417098 () Bool)

(assert (=> b!746736 (=> (not res!503119) (not e!417098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746736 (= res!503119 (validKeyInArray!0 (select (arr!19927 a!3186) j!159)))))

(declare-fun b!746737 () Bool)

(declare-fun res!503114 () Bool)

(assert (=> b!746737 (=> (not res!503114) (not e!417098))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746737 (= res!503114 (and (= (size!20347 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20347 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20347 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746738 () Bool)

(declare-fun e!417095 () Bool)

(assert (=> b!746738 (= e!417101 e!417095)))

(declare-fun res!503118 () Bool)

(assert (=> b!746738 (=> (not res!503118) (not e!417095))))

(declare-fun lt!331779 () SeekEntryResult!7483)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746738 (= res!503118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19927 a!3186) j!159) mask!3328) (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331779))))

(assert (=> b!746738 (= lt!331779 (Intermediate!7483 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746739 () Bool)

(declare-fun res!503109 () Bool)

(assert (=> b!746739 (=> (not res!503109) (not e!417098))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746739 (= res!503109 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746740 () Bool)

(declare-fun e!417102 () Bool)

(assert (=> b!746740 (= e!417095 e!417102)))

(declare-fun res!503115 () Bool)

(assert (=> b!746740 (=> (not res!503115) (not e!417102))))

(declare-fun lt!331786 () SeekEntryResult!7483)

(declare-fun lt!331781 () SeekEntryResult!7483)

(assert (=> b!746740 (= res!503115 (= lt!331786 lt!331781))))

(declare-fun lt!331780 () array!41635)

(declare-fun lt!331787 () (_ BitVec 64))

(assert (=> b!746740 (= lt!331781 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331787 lt!331780 mask!3328))))

(assert (=> b!746740 (= lt!331786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331787 mask!3328) lt!331787 lt!331780 mask!3328))))

(assert (=> b!746740 (= lt!331787 (select (store (arr!19927 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746740 (= lt!331780 (array!41636 (store (arr!19927 a!3186) i!1173 k0!2102) (size!20347 a!3186)))))

(declare-fun b!746741 () Bool)

(declare-fun res!503107 () Bool)

(assert (=> b!746741 (=> (not res!503107) (not e!417095))))

(assert (=> b!746741 (= res!503107 e!417100)))

(declare-fun c!82196 () Bool)

(assert (=> b!746741 (= c!82196 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!503116 () Bool)

(assert (=> start!65592 (=> (not res!503116) (not e!417098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65592 (= res!503116 (validMask!0 mask!3328))))

(assert (=> start!65592 e!417098))

(assert (=> start!65592 true))

(declare-fun array_inv!15786 (array!41635) Bool)

(assert (=> start!65592 (array_inv!15786 a!3186)))

(declare-fun b!746742 () Bool)

(assert (=> b!746742 (= e!417098 e!417101)))

(declare-fun res!503120 () Bool)

(assert (=> b!746742 (=> (not res!503120) (not e!417101))))

(declare-fun lt!331784 () SeekEntryResult!7483)

(assert (=> b!746742 (= res!503120 (or (= lt!331784 (MissingZero!7483 i!1173)) (= lt!331784 (MissingVacant!7483 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41635 (_ BitVec 32)) SeekEntryResult!7483)

(assert (=> b!746742 (= lt!331784 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746743 () Bool)

(assert (=> b!746743 (= e!417100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19927 a!3186) j!159) a!3186 mask!3328) lt!331779))))

(declare-fun b!746744 () Bool)

(declare-fun e!417099 () Bool)

(assert (=> b!746744 (= e!417099 e!417097)))

(declare-fun res!503121 () Bool)

(assert (=> b!746744 (=> res!503121 e!417097)))

(assert (=> b!746744 (= res!503121 (or (not (= lt!331785 lt!331782)) (= (select (store (arr!19927 a!3186) i!1173 k0!2102) index!1321) lt!331787) (not (= (select (store (arr!19927 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746744 (= lt!331785 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19927 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746745 () Bool)

(declare-fun res!503112 () Bool)

(assert (=> b!746745 (=> (not res!503112) (not e!417101))))

(assert (=> b!746745 (= res!503112 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20347 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20347 a!3186))))))

(declare-fun b!746746 () Bool)

(declare-fun res!503113 () Bool)

(assert (=> b!746746 (=> (not res!503113) (not e!417098))))

(assert (=> b!746746 (= res!503113 (validKeyInArray!0 k0!2102))))

(declare-fun b!746747 () Bool)

(assert (=> b!746747 (= e!417102 (not e!417099))))

(declare-fun res!503111 () Bool)

(assert (=> b!746747 (=> res!503111 e!417099)))

(get-info :version)

(assert (=> b!746747 (= res!503111 (or (not ((_ is Intermediate!7483) lt!331781)) (bvslt x!1131 (x!63413 lt!331781)) (not (= x!1131 (x!63413 lt!331781))) (not (= index!1321 (index!32302 lt!331781)))))))

(assert (=> b!746747 e!417094))

(declare-fun res!503108 () Bool)

(assert (=> b!746747 (=> (not res!503108) (not e!417094))))

(assert (=> b!746747 (= res!503108 (= lt!331788 lt!331782))))

(assert (=> b!746747 (= lt!331782 (Found!7483 j!159))))

(assert (=> b!746747 (= lt!331788 (seekEntryOrOpen!0 (select (arr!19927 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746747 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25525 0))(
  ( (Unit!25526) )
))
(declare-fun lt!331783 () Unit!25525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25525)

(assert (=> b!746747 (= lt!331783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746748 () Bool)

(declare-fun res!503122 () Bool)

(assert (=> b!746748 (=> (not res!503122) (not e!417101))))

(declare-datatypes ((List!13836 0))(
  ( (Nil!13833) (Cons!13832 (h!14910 (_ BitVec 64)) (t!20143 List!13836)) )
))
(declare-fun arrayNoDuplicates!0 (array!41635 (_ BitVec 32) List!13836) Bool)

(assert (=> b!746748 (= res!503122 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13833))))

(declare-fun b!746749 () Bool)

(declare-fun res!503117 () Bool)

(assert (=> b!746749 (=> (not res!503117) (not e!417095))))

(assert (=> b!746749 (= res!503117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19927 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65592 res!503116) b!746737))

(assert (= (and b!746737 res!503114) b!746736))

(assert (= (and b!746736 res!503119) b!746746))

(assert (= (and b!746746 res!503113) b!746739))

(assert (= (and b!746739 res!503109) b!746742))

(assert (= (and b!746742 res!503120) b!746733))

(assert (= (and b!746733 res!503110) b!746748))

(assert (= (and b!746748 res!503122) b!746745))

(assert (= (and b!746745 res!503112) b!746738))

(assert (= (and b!746738 res!503118) b!746749))

(assert (= (and b!746749 res!503117) b!746741))

(assert (= (and b!746741 c!82196) b!746743))

(assert (= (and b!746741 (not c!82196)) b!746734))

(assert (= (and b!746741 res!503107) b!746740))

(assert (= (and b!746740 res!503115) b!746747))

(assert (= (and b!746747 res!503108) b!746732))

(assert (= (and b!746747 (not res!503111)) b!746744))

(assert (= (and b!746744 (not res!503121)) b!746735))

(declare-fun m!697455 () Bool)

(assert (=> b!746748 m!697455))

(declare-fun m!697457 () Bool)

(assert (=> b!746734 m!697457))

(assert (=> b!746734 m!697457))

(declare-fun m!697459 () Bool)

(assert (=> b!746734 m!697459))

(assert (=> b!746732 m!697457))

(assert (=> b!746732 m!697457))

(declare-fun m!697461 () Bool)

(assert (=> b!746732 m!697461))

(declare-fun m!697463 () Bool)

(assert (=> b!746733 m!697463))

(assert (=> b!746738 m!697457))

(assert (=> b!746738 m!697457))

(declare-fun m!697465 () Bool)

(assert (=> b!746738 m!697465))

(assert (=> b!746738 m!697465))

(assert (=> b!746738 m!697457))

(declare-fun m!697467 () Bool)

(assert (=> b!746738 m!697467))

(declare-fun m!697469 () Bool)

(assert (=> b!746740 m!697469))

(declare-fun m!697471 () Bool)

(assert (=> b!746740 m!697471))

(declare-fun m!697473 () Bool)

(assert (=> b!746740 m!697473))

(declare-fun m!697475 () Bool)

(assert (=> b!746740 m!697475))

(declare-fun m!697477 () Bool)

(assert (=> b!746740 m!697477))

(assert (=> b!746740 m!697469))

(assert (=> b!746744 m!697475))

(declare-fun m!697479 () Bool)

(assert (=> b!746744 m!697479))

(assert (=> b!746744 m!697457))

(assert (=> b!746744 m!697457))

(assert (=> b!746744 m!697459))

(assert (=> b!746747 m!697457))

(assert (=> b!746747 m!697457))

(declare-fun m!697481 () Bool)

(assert (=> b!746747 m!697481))

(declare-fun m!697483 () Bool)

(assert (=> b!746747 m!697483))

(declare-fun m!697485 () Bool)

(assert (=> b!746747 m!697485))

(assert (=> b!746736 m!697457))

(assert (=> b!746736 m!697457))

(declare-fun m!697487 () Bool)

(assert (=> b!746736 m!697487))

(assert (=> b!746743 m!697457))

(assert (=> b!746743 m!697457))

(declare-fun m!697489 () Bool)

(assert (=> b!746743 m!697489))

(declare-fun m!697491 () Bool)

(assert (=> start!65592 m!697491))

(declare-fun m!697493 () Bool)

(assert (=> start!65592 m!697493))

(declare-fun m!697495 () Bool)

(assert (=> b!746739 m!697495))

(declare-fun m!697497 () Bool)

(assert (=> b!746746 m!697497))

(declare-fun m!697499 () Bool)

(assert (=> b!746749 m!697499))

(declare-fun m!697501 () Bool)

(assert (=> b!746742 m!697501))

(check-sat (not b!746734) (not b!746743) (not b!746738) (not b!746746) (not b!746740) (not b!746748) (not b!746736) (not b!746747) (not start!65592) (not b!746744) (not b!746733) (not b!746739) (not b!746742) (not b!746732))
(check-sat)
