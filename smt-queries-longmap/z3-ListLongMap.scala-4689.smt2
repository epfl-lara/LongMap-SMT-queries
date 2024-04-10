; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65196 () Bool)

(assert start!65196)

(declare-fun b!737836 () Bool)

(declare-fun e!412673 () Bool)

(declare-fun e!412675 () Bool)

(assert (=> b!737836 (= e!412673 e!412675)))

(declare-fun res!495992 () Bool)

(assert (=> b!737836 (=> (not res!495992) (not e!412675))))

(declare-datatypes ((SeekEntryResult!7398 0))(
  ( (MissingZero!7398 (index!31960 (_ BitVec 32))) (Found!7398 (index!31961 (_ BitVec 32))) (Intermediate!7398 (undefined!8210 Bool) (index!31962 (_ BitVec 32)) (x!62956 (_ BitVec 32))) (Undefined!7398) (MissingVacant!7398 (index!31963 (_ BitVec 32))) )
))
(declare-fun lt!327418 () SeekEntryResult!7398)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737836 (= res!495992 (or (= lt!327418 (MissingZero!7398 i!1173)) (= lt!327418 (MissingVacant!7398 i!1173))))))

(declare-datatypes ((array!41369 0))(
  ( (array!41370 (arr!19798 (Array (_ BitVec 32) (_ BitVec 64))) (size!20219 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41369)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41369 (_ BitVec 32)) SeekEntryResult!7398)

(assert (=> b!737836 (= lt!327418 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737837 () Bool)

(declare-fun res!495986 () Bool)

(declare-fun e!412674 () Bool)

(assert (=> b!737837 (=> res!495986 e!412674)))

(declare-fun e!412679 () Bool)

(assert (=> b!737837 (= res!495986 e!412679)))

(declare-fun c!81312 () Bool)

(declare-fun lt!327413 () Bool)

(assert (=> b!737837 (= c!81312 lt!327413)))

(declare-fun b!737838 () Bool)

(declare-fun e!412681 () Bool)

(declare-fun e!412672 () Bool)

(assert (=> b!737838 (= e!412681 e!412672)))

(declare-fun res!495976 () Bool)

(assert (=> b!737838 (=> (not res!495976) (not e!412672))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!327414 () SeekEntryResult!7398)

(assert (=> b!737838 (= res!495976 (= (seekEntryOrOpen!0 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327414))))

(assert (=> b!737838 (= lt!327414 (Found!7398 j!159))))

(declare-fun b!737840 () Bool)

(declare-fun e!412676 () Bool)

(declare-fun e!412677 () Bool)

(assert (=> b!737840 (= e!412676 (not e!412677))))

(declare-fun res!495982 () Bool)

(assert (=> b!737840 (=> res!495982 e!412677)))

(declare-fun lt!327416 () SeekEntryResult!7398)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!737840 (= res!495982 (or (not ((_ is Intermediate!7398) lt!327416)) (bvsge x!1131 (x!62956 lt!327416))))))

(declare-fun lt!327419 () SeekEntryResult!7398)

(assert (=> b!737840 (= lt!327419 (Found!7398 j!159))))

(assert (=> b!737840 e!412681))

(declare-fun res!495989 () Bool)

(assert (=> b!737840 (=> (not res!495989) (not e!412681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41369 (_ BitVec 32)) Bool)

(assert (=> b!737840 (= res!495989 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25188 0))(
  ( (Unit!25189) )
))
(declare-fun lt!327417 () Unit!25188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25188)

(assert (=> b!737840 (= lt!327417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737841 () Bool)

(declare-fun res!495990 () Bool)

(assert (=> b!737841 (=> (not res!495990) (not e!412673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737841 (= res!495990 (validKeyInArray!0 k0!2102))))

(declare-fun b!737842 () Bool)

(declare-fun e!412671 () Bool)

(assert (=> b!737842 (= e!412671 e!412676)))

(declare-fun res!495985 () Bool)

(assert (=> b!737842 (=> (not res!495985) (not e!412676))))

(declare-fun lt!327422 () SeekEntryResult!7398)

(assert (=> b!737842 (= res!495985 (= lt!327422 lt!327416))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327423 () (_ BitVec 64))

(declare-fun lt!327420 () array!41369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41369 (_ BitVec 32)) SeekEntryResult!7398)

(assert (=> b!737842 (= lt!327416 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327423 lt!327420 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737842 (= lt!327422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327423 mask!3328) lt!327423 lt!327420 mask!3328))))

(assert (=> b!737842 (= lt!327423 (select (store (arr!19798 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737842 (= lt!327420 (array!41370 (store (arr!19798 a!3186) i!1173 k0!2102) (size!20219 a!3186)))))

(declare-fun b!737843 () Bool)

(declare-fun e!412682 () Unit!25188)

(declare-fun Unit!25190 () Unit!25188)

(assert (=> b!737843 (= e!412682 Unit!25190)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!327425 () SeekEntryResult!7398)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41369 (_ BitVec 32)) SeekEntryResult!7398)

(assert (=> b!737843 (= lt!327425 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327421 () (_ BitVec 32))

(assert (=> b!737843 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327421 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327419)))

(declare-fun b!737844 () Bool)

(declare-fun Unit!25191 () Unit!25188)

(assert (=> b!737844 (= e!412682 Unit!25191)))

(declare-fun lt!327412 () SeekEntryResult!7398)

(assert (=> b!737844 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327421 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327412)))

(declare-fun b!737845 () Bool)

(declare-fun res!495984 () Bool)

(assert (=> b!737845 (=> (not res!495984) (not e!412675))))

(assert (=> b!737845 (= res!495984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!737846 () Bool)

(assert (=> b!737846 (= e!412672 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327414))))

(declare-fun b!737847 () Bool)

(declare-fun e!412678 () Bool)

(assert (=> b!737847 (= e!412678 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327412))))

(declare-fun b!737848 () Bool)

(assert (=> b!737848 (= e!412674 true)))

(declare-fun lt!327415 () SeekEntryResult!7398)

(assert (=> b!737848 (= lt!327415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327421 lt!327423 lt!327420 mask!3328))))

(declare-fun b!737849 () Bool)

(declare-fun res!495988 () Bool)

(assert (=> b!737849 (=> (not res!495988) (not e!412673))))

(assert (=> b!737849 (= res!495988 (validKeyInArray!0 (select (arr!19798 a!3186) j!159)))))

(declare-fun b!737839 () Bool)

(declare-fun res!495980 () Bool)

(assert (=> b!737839 (=> (not res!495980) (not e!412671))))

(assert (=> b!737839 (= res!495980 e!412678)))

(declare-fun c!81311 () Bool)

(assert (=> b!737839 (= c!81311 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!495979 () Bool)

(assert (=> start!65196 (=> (not res!495979) (not e!412673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65196 (= res!495979 (validMask!0 mask!3328))))

(assert (=> start!65196 e!412673))

(assert (=> start!65196 true))

(declare-fun array_inv!15594 (array!41369) Bool)

(assert (=> start!65196 (array_inv!15594 a!3186)))

(declare-fun b!737850 () Bool)

(declare-fun res!495981 () Bool)

(assert (=> b!737850 (=> (not res!495981) (not e!412671))))

(assert (=> b!737850 (= res!495981 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19798 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737851 () Bool)

(declare-fun res!495977 () Bool)

(assert (=> b!737851 (=> (not res!495977) (not e!412673))))

(assert (=> b!737851 (= res!495977 (and (= (size!20219 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20219 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20219 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737852 () Bool)

(declare-fun res!495991 () Bool)

(assert (=> b!737852 (=> (not res!495991) (not e!412673))))

(declare-fun arrayContainsKey!0 (array!41369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737852 (= res!495991 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737853 () Bool)

(assert (=> b!737853 (= e!412678 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) (Found!7398 j!159)))))

(declare-fun b!737854 () Bool)

(assert (=> b!737854 (= e!412677 e!412674)))

(declare-fun res!495975 () Bool)

(assert (=> b!737854 (=> res!495975 e!412674)))

(assert (=> b!737854 (= res!495975 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327421 #b00000000000000000000000000000000) (bvsge lt!327421 (size!20219 a!3186))))))

(declare-fun lt!327424 () Unit!25188)

(assert (=> b!737854 (= lt!327424 e!412682)))

(declare-fun c!81313 () Bool)

(assert (=> b!737854 (= c!81313 lt!327413)))

(assert (=> b!737854 (= lt!327413 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737854 (= lt!327421 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737855 () Bool)

(declare-fun res!495987 () Bool)

(assert (=> b!737855 (=> (not res!495987) (not e!412675))))

(assert (=> b!737855 (= res!495987 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20219 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20219 a!3186))))))

(declare-fun b!737856 () Bool)

(assert (=> b!737856 (= e!412675 e!412671)))

(declare-fun res!495978 () Bool)

(assert (=> b!737856 (=> (not res!495978) (not e!412671))))

(assert (=> b!737856 (= res!495978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19798 a!3186) j!159) mask!3328) (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327412))))

(assert (=> b!737856 (= lt!327412 (Intermediate!7398 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737857 () Bool)

(declare-fun res!495983 () Bool)

(assert (=> b!737857 (=> (not res!495983) (not e!412675))))

(declare-datatypes ((List!13800 0))(
  ( (Nil!13797) (Cons!13796 (h!14868 (_ BitVec 64)) (t!20115 List!13800)) )
))
(declare-fun arrayNoDuplicates!0 (array!41369 (_ BitVec 32) List!13800) Bool)

(assert (=> b!737857 (= res!495983 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13797))))

(declare-fun b!737858 () Bool)

(assert (=> b!737858 (= e!412679 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327421 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327412)))))

(declare-fun b!737859 () Bool)

(assert (=> b!737859 (= e!412679 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327421 resIntermediateIndex!5 (select (arr!19798 a!3186) j!159) a!3186 mask!3328) lt!327419)))))

(assert (= (and start!65196 res!495979) b!737851))

(assert (= (and b!737851 res!495977) b!737849))

(assert (= (and b!737849 res!495988) b!737841))

(assert (= (and b!737841 res!495990) b!737852))

(assert (= (and b!737852 res!495991) b!737836))

(assert (= (and b!737836 res!495992) b!737845))

(assert (= (and b!737845 res!495984) b!737857))

(assert (= (and b!737857 res!495983) b!737855))

(assert (= (and b!737855 res!495987) b!737856))

(assert (= (and b!737856 res!495978) b!737850))

(assert (= (and b!737850 res!495981) b!737839))

(assert (= (and b!737839 c!81311) b!737847))

(assert (= (and b!737839 (not c!81311)) b!737853))

(assert (= (and b!737839 res!495980) b!737842))

(assert (= (and b!737842 res!495985) b!737840))

(assert (= (and b!737840 res!495989) b!737838))

(assert (= (and b!737838 res!495976) b!737846))

(assert (= (and b!737840 (not res!495982)) b!737854))

(assert (= (and b!737854 c!81313) b!737844))

(assert (= (and b!737854 (not c!81313)) b!737843))

(assert (= (and b!737854 (not res!495975)) b!737837))

(assert (= (and b!737837 c!81312) b!737858))

(assert (= (and b!737837 (not c!81312)) b!737859))

(assert (= (and b!737837 (not res!495986)) b!737848))

(declare-fun m!689617 () Bool)

(assert (=> b!737854 m!689617))

(declare-fun m!689619 () Bool)

(assert (=> b!737847 m!689619))

(assert (=> b!737847 m!689619))

(declare-fun m!689621 () Bool)

(assert (=> b!737847 m!689621))

(declare-fun m!689623 () Bool)

(assert (=> b!737845 m!689623))

(declare-fun m!689625 () Bool)

(assert (=> b!737857 m!689625))

(declare-fun m!689627 () Bool)

(assert (=> b!737842 m!689627))

(declare-fun m!689629 () Bool)

(assert (=> b!737842 m!689629))

(declare-fun m!689631 () Bool)

(assert (=> b!737842 m!689631))

(declare-fun m!689633 () Bool)

(assert (=> b!737842 m!689633))

(declare-fun m!689635 () Bool)

(assert (=> b!737842 m!689635))

(assert (=> b!737842 m!689629))

(declare-fun m!689637 () Bool)

(assert (=> b!737852 m!689637))

(declare-fun m!689639 () Bool)

(assert (=> b!737841 m!689639))

(declare-fun m!689641 () Bool)

(assert (=> b!737836 m!689641))

(assert (=> b!737858 m!689619))

(assert (=> b!737858 m!689619))

(declare-fun m!689643 () Bool)

(assert (=> b!737858 m!689643))

(assert (=> b!737846 m!689619))

(assert (=> b!737846 m!689619))

(declare-fun m!689645 () Bool)

(assert (=> b!737846 m!689645))

(declare-fun m!689647 () Bool)

(assert (=> b!737840 m!689647))

(declare-fun m!689649 () Bool)

(assert (=> b!737840 m!689649))

(assert (=> b!737859 m!689619))

(assert (=> b!737859 m!689619))

(declare-fun m!689651 () Bool)

(assert (=> b!737859 m!689651))

(assert (=> b!737849 m!689619))

(assert (=> b!737849 m!689619))

(declare-fun m!689653 () Bool)

(assert (=> b!737849 m!689653))

(declare-fun m!689655 () Bool)

(assert (=> b!737848 m!689655))

(assert (=> b!737856 m!689619))

(assert (=> b!737856 m!689619))

(declare-fun m!689657 () Bool)

(assert (=> b!737856 m!689657))

(assert (=> b!737856 m!689657))

(assert (=> b!737856 m!689619))

(declare-fun m!689659 () Bool)

(assert (=> b!737856 m!689659))

(declare-fun m!689661 () Bool)

(assert (=> start!65196 m!689661))

(declare-fun m!689663 () Bool)

(assert (=> start!65196 m!689663))

(assert (=> b!737844 m!689619))

(assert (=> b!737844 m!689619))

(assert (=> b!737844 m!689643))

(assert (=> b!737853 m!689619))

(assert (=> b!737853 m!689619))

(declare-fun m!689665 () Bool)

(assert (=> b!737853 m!689665))

(declare-fun m!689667 () Bool)

(assert (=> b!737850 m!689667))

(assert (=> b!737838 m!689619))

(assert (=> b!737838 m!689619))

(declare-fun m!689669 () Bool)

(assert (=> b!737838 m!689669))

(assert (=> b!737843 m!689619))

(assert (=> b!737843 m!689619))

(assert (=> b!737843 m!689665))

(assert (=> b!737843 m!689619))

(assert (=> b!737843 m!689651))

(check-sat (not b!737857) (not b!737846) (not b!737848) (not b!737859) (not b!737838) (not b!737847) (not b!737843) (not b!737841) (not b!737842) (not b!737849) (not b!737856) (not b!737845) (not b!737836) (not b!737840) (not start!65196) (not b!737854) (not b!737853) (not b!737852) (not b!737858) (not b!737844))
(check-sat)
