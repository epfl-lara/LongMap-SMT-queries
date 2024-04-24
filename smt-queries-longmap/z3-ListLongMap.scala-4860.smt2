; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67120 () Bool)

(assert start!67120)

(declare-fun b!773705 () Bool)

(declare-fun res!523051 () Bool)

(declare-fun e!430770 () Bool)

(assert (=> b!773705 (=> (not res!523051) (not e!430770))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42424 0))(
  ( (array!42425 (arr!20305 (Array (_ BitVec 32) (_ BitVec 64))) (size!20725 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42424)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773705 (= res!523051 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20725 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20725 a!3186))))))

(declare-fun b!773706 () Bool)

(declare-fun e!430769 () Bool)

(assert (=> b!773706 (= e!430769 true)))

(declare-datatypes ((Unit!26635 0))(
  ( (Unit!26636) )
))
(declare-fun lt!344476 () Unit!26635)

(declare-fun e!430774 () Unit!26635)

(assert (=> b!773706 (= lt!344476 e!430774)))

(declare-fun c!85730 () Bool)

(assert (=> b!773706 (= c!85730 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344473 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773706 (= lt!344473 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!773707 () Bool)

(declare-fun e!430771 () Bool)

(assert (=> b!773707 (= e!430771 e!430770)))

(declare-fun res!523061 () Bool)

(assert (=> b!773707 (=> (not res!523061) (not e!430770))))

(declare-datatypes ((SeekEntryResult!7861 0))(
  ( (MissingZero!7861 (index!33812 (_ BitVec 32))) (Found!7861 (index!33813 (_ BitVec 32))) (Intermediate!7861 (undefined!8673 Bool) (index!33814 (_ BitVec 32)) (x!64915 (_ BitVec 32))) (Undefined!7861) (MissingVacant!7861 (index!33815 (_ BitVec 32))) )
))
(declare-fun lt!344477 () SeekEntryResult!7861)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773707 (= res!523061 (or (= lt!344477 (MissingZero!7861 i!1173)) (= lt!344477 (MissingVacant!7861 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!773707 (= lt!344477 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!523052 () Bool)

(assert (=> start!67120 (=> (not res!523052) (not e!430771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67120 (= res!523052 (validMask!0 mask!3328))))

(assert (=> start!67120 e!430771))

(assert (=> start!67120 true))

(declare-fun array_inv!16164 (array!42424) Bool)

(assert (=> start!67120 (array_inv!16164 a!3186)))

(declare-fun b!773708 () Bool)

(declare-fun e!430772 () Bool)

(assert (=> b!773708 (= e!430772 (not e!430769))))

(declare-fun res!523053 () Bool)

(assert (=> b!773708 (=> res!523053 e!430769)))

(declare-fun lt!344475 () SeekEntryResult!7861)

(get-info :version)

(assert (=> b!773708 (= res!523053 (or (not ((_ is Intermediate!7861) lt!344475)) (bvsge x!1131 (x!64915 lt!344475))))))

(declare-fun e!430768 () Bool)

(assert (=> b!773708 e!430768))

(declare-fun res!523060 () Bool)

(assert (=> b!773708 (=> (not res!523060) (not e!430768))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42424 (_ BitVec 32)) Bool)

(assert (=> b!773708 (= res!523060 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344482 () Unit!26635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26635)

(assert (=> b!773708 (= lt!344482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773709 () Bool)

(declare-fun res!523055 () Bool)

(assert (=> b!773709 (=> (not res!523055) (not e!430770))))

(declare-datatypes ((List!14214 0))(
  ( (Nil!14211) (Cons!14210 (h!15321 (_ BitVec 64)) (t!20521 List!14214)) )
))
(declare-fun arrayNoDuplicates!0 (array!42424 (_ BitVec 32) List!14214) Bool)

(assert (=> b!773709 (= res!523055 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14211))))

(declare-fun b!773710 () Bool)

(declare-fun e!430773 () Bool)

(assert (=> b!773710 (= e!430768 e!430773)))

(declare-fun res!523050 () Bool)

(assert (=> b!773710 (=> (not res!523050) (not e!430773))))

(declare-fun lt!344480 () SeekEntryResult!7861)

(assert (=> b!773710 (= res!523050 (= (seekEntryOrOpen!0 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344480))))

(assert (=> b!773710 (= lt!344480 (Found!7861 j!159))))

(declare-fun lt!344479 () SeekEntryResult!7861)

(declare-fun b!773711 () Bool)

(declare-fun e!430777 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!773711 (= e!430777 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344479))))

(declare-fun b!773712 () Bool)

(declare-fun res!523065 () Bool)

(declare-fun e!430776 () Bool)

(assert (=> b!773712 (=> (not res!523065) (not e!430776))))

(assert (=> b!773712 (= res!523065 e!430777)))

(declare-fun c!85729 () Bool)

(assert (=> b!773712 (= c!85729 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773713 () Bool)

(declare-fun res!523056 () Bool)

(assert (=> b!773713 (=> (not res!523056) (not e!430771))))

(declare-fun arrayContainsKey!0 (array!42424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773713 (= res!523056 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773714 () Bool)

(assert (=> b!773714 (= e!430770 e!430776)))

(declare-fun res!523064 () Bool)

(assert (=> b!773714 (=> (not res!523064) (not e!430776))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773714 (= res!523064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344479))))

(assert (=> b!773714 (= lt!344479 (Intermediate!7861 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773715 () Bool)

(declare-fun res!523054 () Bool)

(assert (=> b!773715 (=> (not res!523054) (not e!430771))))

(assert (=> b!773715 (= res!523054 (and (= (size!20725 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20725 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20725 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773716 () Bool)

(declare-fun res!523062 () Bool)

(assert (=> b!773716 (=> (not res!523062) (not e!430771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773716 (= res!523062 (validKeyInArray!0 k0!2102))))

(declare-fun b!773717 () Bool)

(declare-fun res!523058 () Bool)

(assert (=> b!773717 (=> (not res!523058) (not e!430776))))

(assert (=> b!773717 (= res!523058 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20305 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773718 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!773718 (= e!430777 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159)))))

(declare-fun b!773719 () Bool)

(assert (=> b!773719 (= e!430773 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344480))))

(declare-fun b!773720 () Bool)

(declare-fun res!523057 () Bool)

(assert (=> b!773720 (=> (not res!523057) (not e!430771))))

(assert (=> b!773720 (= res!523057 (validKeyInArray!0 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!773721 () Bool)

(declare-fun Unit!26637 () Unit!26635)

(assert (=> b!773721 (= e!430774 Unit!26637)))

(declare-fun lt!344481 () SeekEntryResult!7861)

(assert (=> b!773721 (= lt!344481 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773721 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344473 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159))))

(declare-fun b!773722 () Bool)

(assert (=> b!773722 (= e!430776 e!430772)))

(declare-fun res!523059 () Bool)

(assert (=> b!773722 (=> (not res!523059) (not e!430772))))

(declare-fun lt!344474 () SeekEntryResult!7861)

(assert (=> b!773722 (= res!523059 (= lt!344474 lt!344475))))

(declare-fun lt!344478 () (_ BitVec 64))

(declare-fun lt!344472 () array!42424)

(assert (=> b!773722 (= lt!344475 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344478 lt!344472 mask!3328))))

(assert (=> b!773722 (= lt!344474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344478 mask!3328) lt!344478 lt!344472 mask!3328))))

(assert (=> b!773722 (= lt!344478 (select (store (arr!20305 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773722 (= lt!344472 (array!42425 (store (arr!20305 a!3186) i!1173 k0!2102) (size!20725 a!3186)))))

(declare-fun b!773723 () Bool)

(declare-fun Unit!26638 () Unit!26635)

(assert (=> b!773723 (= e!430774 Unit!26638)))

(assert (=> b!773723 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344473 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344479)))

(declare-fun b!773724 () Bool)

(declare-fun res!523063 () Bool)

(assert (=> b!773724 (=> (not res!523063) (not e!430770))))

(assert (=> b!773724 (= res!523063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67120 res!523052) b!773715))

(assert (= (and b!773715 res!523054) b!773720))

(assert (= (and b!773720 res!523057) b!773716))

(assert (= (and b!773716 res!523062) b!773713))

(assert (= (and b!773713 res!523056) b!773707))

(assert (= (and b!773707 res!523061) b!773724))

(assert (= (and b!773724 res!523063) b!773709))

(assert (= (and b!773709 res!523055) b!773705))

(assert (= (and b!773705 res!523051) b!773714))

(assert (= (and b!773714 res!523064) b!773717))

(assert (= (and b!773717 res!523058) b!773712))

(assert (= (and b!773712 c!85729) b!773711))

(assert (= (and b!773712 (not c!85729)) b!773718))

(assert (= (and b!773712 res!523065) b!773722))

(assert (= (and b!773722 res!523059) b!773708))

(assert (= (and b!773708 res!523060) b!773710))

(assert (= (and b!773710 res!523050) b!773719))

(assert (= (and b!773708 (not res!523053)) b!773706))

(assert (= (and b!773706 c!85730) b!773723))

(assert (= (and b!773706 (not c!85730)) b!773721))

(declare-fun m!718895 () Bool)

(assert (=> b!773722 m!718895))

(declare-fun m!718897 () Bool)

(assert (=> b!773722 m!718897))

(declare-fun m!718899 () Bool)

(assert (=> b!773722 m!718899))

(declare-fun m!718901 () Bool)

(assert (=> b!773722 m!718901))

(assert (=> b!773722 m!718895))

(declare-fun m!718903 () Bool)

(assert (=> b!773722 m!718903))

(declare-fun m!718905 () Bool)

(assert (=> b!773724 m!718905))

(declare-fun m!718907 () Bool)

(assert (=> b!773708 m!718907))

(declare-fun m!718909 () Bool)

(assert (=> b!773708 m!718909))

(declare-fun m!718911 () Bool)

(assert (=> b!773720 m!718911))

(assert (=> b!773720 m!718911))

(declare-fun m!718913 () Bool)

(assert (=> b!773720 m!718913))

(declare-fun m!718915 () Bool)

(assert (=> b!773709 m!718915))

(assert (=> b!773723 m!718911))

(assert (=> b!773723 m!718911))

(declare-fun m!718917 () Bool)

(assert (=> b!773723 m!718917))

(assert (=> b!773711 m!718911))

(assert (=> b!773711 m!718911))

(declare-fun m!718919 () Bool)

(assert (=> b!773711 m!718919))

(declare-fun m!718921 () Bool)

(assert (=> b!773716 m!718921))

(assert (=> b!773721 m!718911))

(assert (=> b!773721 m!718911))

(declare-fun m!718923 () Bool)

(assert (=> b!773721 m!718923))

(assert (=> b!773721 m!718911))

(declare-fun m!718925 () Bool)

(assert (=> b!773721 m!718925))

(declare-fun m!718927 () Bool)

(assert (=> b!773717 m!718927))

(assert (=> b!773710 m!718911))

(assert (=> b!773710 m!718911))

(declare-fun m!718929 () Bool)

(assert (=> b!773710 m!718929))

(declare-fun m!718931 () Bool)

(assert (=> b!773713 m!718931))

(assert (=> b!773714 m!718911))

(assert (=> b!773714 m!718911))

(declare-fun m!718933 () Bool)

(assert (=> b!773714 m!718933))

(assert (=> b!773714 m!718933))

(assert (=> b!773714 m!718911))

(declare-fun m!718935 () Bool)

(assert (=> b!773714 m!718935))

(assert (=> b!773718 m!718911))

(assert (=> b!773718 m!718911))

(assert (=> b!773718 m!718923))

(assert (=> b!773719 m!718911))

(assert (=> b!773719 m!718911))

(declare-fun m!718937 () Bool)

(assert (=> b!773719 m!718937))

(declare-fun m!718939 () Bool)

(assert (=> b!773706 m!718939))

(declare-fun m!718941 () Bool)

(assert (=> start!67120 m!718941))

(declare-fun m!718943 () Bool)

(assert (=> start!67120 m!718943))

(declare-fun m!718945 () Bool)

(assert (=> b!773707 m!718945))

(check-sat (not b!773721) (not start!67120) (not b!773710) (not b!773709) (not b!773723) (not b!773720) (not b!773718) (not b!773713) (not b!773706) (not b!773711) (not b!773707) (not b!773714) (not b!773719) (not b!773724) (not b!773708) (not b!773716) (not b!773722))
(check-sat)
