; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67136 () Bool)

(assert start!67136)

(declare-fun b!776022 () Bool)

(declare-fun e!431835 () Bool)

(declare-fun e!431829 () Bool)

(assert (=> b!776022 (= e!431835 e!431829)))

(declare-fun res!524984 () Bool)

(assert (=> b!776022 (=> (not res!524984) (not e!431829))))

(declare-datatypes ((SeekEntryResult!7948 0))(
  ( (MissingZero!7948 (index!34160 (_ BitVec 32))) (Found!7948 (index!34161 (_ BitVec 32))) (Intermediate!7948 (undefined!8760 Bool) (index!34162 (_ BitVec 32)) (x!65110 (_ BitVec 32))) (Undefined!7948) (MissingVacant!7948 (index!34163 (_ BitVec 32))) )
))
(declare-fun lt!345599 () SeekEntryResult!7948)

(declare-fun lt!345598 () SeekEntryResult!7948)

(assert (=> b!776022 (= res!524984 (= lt!345599 lt!345598))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42510 0))(
  ( (array!42511 (arr!20351 (Array (_ BitVec 32) (_ BitVec 64))) (size!20772 (_ BitVec 32))) )
))
(declare-fun lt!345602 () array!42510)

(declare-fun lt!345604 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42510 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!776022 (= lt!345598 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345604 lt!345602 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776022 (= lt!345599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345604 mask!3328) lt!345604 lt!345602 mask!3328))))

(declare-fun a!3186 () array!42510)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776022 (= lt!345604 (select (store (arr!20351 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776022 (= lt!345602 (array!42511 (store (arr!20351 a!3186) i!1173 k0!2102) (size!20772 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!345600 () SeekEntryResult!7948)

(declare-fun e!431830 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776023 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42510 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!776023 (= e!431830 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345600))))

(declare-fun lt!345605 () SeekEntryResult!7948)

(declare-fun b!776024 () Bool)

(declare-fun e!431831 () Bool)

(assert (=> b!776024 (= e!431831 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345605))))

(declare-fun b!776025 () Bool)

(declare-fun res!524986 () Bool)

(declare-fun e!431834 () Bool)

(assert (=> b!776025 (=> (not res!524986) (not e!431834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776025 (= res!524986 (validKeyInArray!0 k0!2102))))

(declare-fun b!776026 () Bool)

(declare-fun res!524989 () Bool)

(declare-fun e!431828 () Bool)

(assert (=> b!776026 (=> (not res!524989) (not e!431828))))

(declare-datatypes ((List!14392 0))(
  ( (Nil!14389) (Cons!14388 (h!15496 (_ BitVec 64)) (t!20698 List!14392)) )
))
(declare-fun arrayNoDuplicates!0 (array!42510 (_ BitVec 32) List!14392) Bool)

(assert (=> b!776026 (= res!524989 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14389))))

(declare-fun b!776027 () Bool)

(declare-fun e!431832 () Bool)

(assert (=> b!776027 (= e!431832 true)))

(declare-fun lt!345603 () SeekEntryResult!7948)

(assert (=> b!776027 (= lt!345603 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776028 () Bool)

(declare-fun res!524988 () Bool)

(assert (=> b!776028 (=> (not res!524988) (not e!431828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42510 (_ BitVec 32)) Bool)

(assert (=> b!776028 (= res!524988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!524990 () Bool)

(assert (=> start!67136 (=> (not res!524990) (not e!431834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67136 (= res!524990 (validMask!0 mask!3328))))

(assert (=> start!67136 e!431834))

(assert (=> start!67136 true))

(declare-fun array_inv!16234 (array!42510) Bool)

(assert (=> start!67136 (array_inv!16234 a!3186)))

(declare-fun b!776029 () Bool)

(assert (=> b!776029 (= e!431828 e!431835)))

(declare-fun res!524996 () Bool)

(assert (=> b!776029 (=> (not res!524996) (not e!431835))))

(assert (=> b!776029 (= res!524996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20351 a!3186) j!159) mask!3328) (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345605))))

(assert (=> b!776029 (= lt!345605 (Intermediate!7948 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776030 () Bool)

(declare-fun res!524993 () Bool)

(assert (=> b!776030 (=> (not res!524993) (not e!431834))))

(assert (=> b!776030 (= res!524993 (validKeyInArray!0 (select (arr!20351 a!3186) j!159)))))

(declare-fun b!776031 () Bool)

(declare-fun res!524983 () Bool)

(assert (=> b!776031 (=> (not res!524983) (not e!431834))))

(assert (=> b!776031 (= res!524983 (and (= (size!20772 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20772 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20772 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776032 () Bool)

(declare-fun res!524997 () Bool)

(assert (=> b!776032 (=> (not res!524997) (not e!431835))))

(assert (=> b!776032 (= res!524997 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20351 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776033 () Bool)

(declare-fun res!524991 () Bool)

(assert (=> b!776033 (=> (not res!524991) (not e!431834))))

(declare-fun arrayContainsKey!0 (array!42510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776033 (= res!524991 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776034 () Bool)

(declare-fun e!431836 () Bool)

(assert (=> b!776034 (= e!431836 e!431830)))

(declare-fun res!524994 () Bool)

(assert (=> b!776034 (=> (not res!524994) (not e!431830))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42510 (_ BitVec 32)) SeekEntryResult!7948)

(assert (=> b!776034 (= res!524994 (= (seekEntryOrOpen!0 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345600))))

(assert (=> b!776034 (= lt!345600 (Found!7948 j!159))))

(declare-fun b!776035 () Bool)

(assert (=> b!776035 (= e!431831 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) (Found!7948 j!159)))))

(declare-fun b!776036 () Bool)

(assert (=> b!776036 (= e!431834 e!431828)))

(declare-fun res!524992 () Bool)

(assert (=> b!776036 (=> (not res!524992) (not e!431828))))

(declare-fun lt!345601 () SeekEntryResult!7948)

(assert (=> b!776036 (= res!524992 (or (= lt!345601 (MissingZero!7948 i!1173)) (= lt!345601 (MissingVacant!7948 i!1173))))))

(assert (=> b!776036 (= lt!345601 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776037 () Bool)

(declare-fun res!524985 () Bool)

(assert (=> b!776037 (=> (not res!524985) (not e!431835))))

(assert (=> b!776037 (= res!524985 e!431831)))

(declare-fun c!85920 () Bool)

(assert (=> b!776037 (= c!85920 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776038 () Bool)

(assert (=> b!776038 (= e!431829 (not e!431832))))

(declare-fun res!524995 () Bool)

(assert (=> b!776038 (=> res!524995 e!431832)))

(get-info :version)

(assert (=> b!776038 (= res!524995 (or (not ((_ is Intermediate!7948) lt!345598)) (bvslt x!1131 (x!65110 lt!345598)) (not (= x!1131 (x!65110 lt!345598))) (not (= index!1321 (index!34162 lt!345598)))))))

(assert (=> b!776038 e!431836))

(declare-fun res!524982 () Bool)

(assert (=> b!776038 (=> (not res!524982) (not e!431836))))

(assert (=> b!776038 (= res!524982 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26762 0))(
  ( (Unit!26763) )
))
(declare-fun lt!345597 () Unit!26762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26762)

(assert (=> b!776038 (= lt!345597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776039 () Bool)

(declare-fun res!524987 () Bool)

(assert (=> b!776039 (=> (not res!524987) (not e!431828))))

(assert (=> b!776039 (= res!524987 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20772 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20772 a!3186))))))

(assert (= (and start!67136 res!524990) b!776031))

(assert (= (and b!776031 res!524983) b!776030))

(assert (= (and b!776030 res!524993) b!776025))

(assert (= (and b!776025 res!524986) b!776033))

(assert (= (and b!776033 res!524991) b!776036))

(assert (= (and b!776036 res!524992) b!776028))

(assert (= (and b!776028 res!524988) b!776026))

(assert (= (and b!776026 res!524989) b!776039))

(assert (= (and b!776039 res!524987) b!776029))

(assert (= (and b!776029 res!524996) b!776032))

(assert (= (and b!776032 res!524997) b!776037))

(assert (= (and b!776037 c!85920) b!776024))

(assert (= (and b!776037 (not c!85920)) b!776035))

(assert (= (and b!776037 res!524985) b!776022))

(assert (= (and b!776022 res!524984) b!776038))

(assert (= (and b!776038 res!524982) b!776034))

(assert (= (and b!776034 res!524994) b!776023))

(assert (= (and b!776038 (not res!524995)) b!776027))

(declare-fun m!719619 () Bool)

(assert (=> b!776030 m!719619))

(assert (=> b!776030 m!719619))

(declare-fun m!719621 () Bool)

(assert (=> b!776030 m!719621))

(assert (=> b!776029 m!719619))

(assert (=> b!776029 m!719619))

(declare-fun m!719623 () Bool)

(assert (=> b!776029 m!719623))

(assert (=> b!776029 m!719623))

(assert (=> b!776029 m!719619))

(declare-fun m!719625 () Bool)

(assert (=> b!776029 m!719625))

(assert (=> b!776024 m!719619))

(assert (=> b!776024 m!719619))

(declare-fun m!719627 () Bool)

(assert (=> b!776024 m!719627))

(declare-fun m!719629 () Bool)

(assert (=> b!776028 m!719629))

(declare-fun m!719631 () Bool)

(assert (=> b!776026 m!719631))

(declare-fun m!719633 () Bool)

(assert (=> b!776032 m!719633))

(assert (=> b!776023 m!719619))

(assert (=> b!776023 m!719619))

(declare-fun m!719635 () Bool)

(assert (=> b!776023 m!719635))

(declare-fun m!719637 () Bool)

(assert (=> b!776025 m!719637))

(assert (=> b!776034 m!719619))

(assert (=> b!776034 m!719619))

(declare-fun m!719639 () Bool)

(assert (=> b!776034 m!719639))

(declare-fun m!719641 () Bool)

(assert (=> b!776038 m!719641))

(declare-fun m!719643 () Bool)

(assert (=> b!776038 m!719643))

(declare-fun m!719645 () Bool)

(assert (=> b!776022 m!719645))

(declare-fun m!719647 () Bool)

(assert (=> b!776022 m!719647))

(declare-fun m!719649 () Bool)

(assert (=> b!776022 m!719649))

(assert (=> b!776022 m!719645))

(declare-fun m!719651 () Bool)

(assert (=> b!776022 m!719651))

(declare-fun m!719653 () Bool)

(assert (=> b!776022 m!719653))

(assert (=> b!776027 m!719619))

(assert (=> b!776027 m!719619))

(declare-fun m!719655 () Bool)

(assert (=> b!776027 m!719655))

(declare-fun m!719657 () Bool)

(assert (=> start!67136 m!719657))

(declare-fun m!719659 () Bool)

(assert (=> start!67136 m!719659))

(assert (=> b!776035 m!719619))

(assert (=> b!776035 m!719619))

(assert (=> b!776035 m!719655))

(declare-fun m!719661 () Bool)

(assert (=> b!776036 m!719661))

(declare-fun m!719663 () Bool)

(assert (=> b!776033 m!719663))

(check-sat (not b!776034) (not b!776027) (not b!776038) (not b!776033) (not b!776030) (not b!776023) (not b!776024) (not b!776026) (not b!776036) (not b!776029) (not b!776028) (not start!67136) (not b!776035) (not b!776025) (not b!776022))
(check-sat)
