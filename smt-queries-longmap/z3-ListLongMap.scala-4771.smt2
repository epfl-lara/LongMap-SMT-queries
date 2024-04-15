; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65666 () Bool)

(assert start!65666)

(declare-fun res!508564 () Bool)

(declare-fun e!419890 () Bool)

(assert (=> start!65666 (=> (not res!508564) (not e!419890))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65666 (= res!508564 (validMask!0 mask!3328))))

(assert (=> start!65666 e!419890))

(assert (=> start!65666 true))

(declare-datatypes ((array!41856 0))(
  ( (array!41857 (arr!20042 (Array (_ BitVec 32) (_ BitVec 64))) (size!20463 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41856)

(declare-fun array_inv!15925 (array!41856) Bool)

(assert (=> start!65666 (array_inv!15925 a!3186)))

(declare-fun b!752830 () Bool)

(declare-fun res!508568 () Bool)

(declare-fun e!419893 () Bool)

(assert (=> b!752830 (=> (not res!508568) (not e!419893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41856 (_ BitVec 32)) Bool)

(assert (=> b!752830 (= res!508568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7639 0))(
  ( (MissingZero!7639 (index!32924 (_ BitVec 32))) (Found!7639 (index!32925 (_ BitVec 32))) (Intermediate!7639 (undefined!8451 Bool) (index!32926 (_ BitVec 32)) (x!63848 (_ BitVec 32))) (Undefined!7639) (MissingVacant!7639 (index!32927 (_ BitVec 32))) )
))
(declare-fun lt!334797 () SeekEntryResult!7639)

(declare-fun e!419888 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!752831 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41856 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752831 (= e!419888 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!334797))))

(declare-fun b!752832 () Bool)

(declare-fun e!419894 () Bool)

(declare-fun lt!334796 () SeekEntryResult!7639)

(declare-fun lt!334795 () SeekEntryResult!7639)

(assert (=> b!752832 (= e!419894 (= lt!334796 lt!334795))))

(declare-fun b!752833 () Bool)

(declare-fun res!508561 () Bool)

(declare-fun e!419889 () Bool)

(assert (=> b!752833 (=> (not res!508561) (not e!419889))))

(assert (=> b!752833 (= res!508561 e!419888)))

(declare-fun c!82517 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752833 (= c!82517 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752834 () Bool)

(declare-fun res!508573 () Bool)

(assert (=> b!752834 (=> (not res!508573) (not e!419890))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752834 (= res!508573 (validKeyInArray!0 k0!2102))))

(declare-fun b!752835 () Bool)

(declare-fun e!419895 () Bool)

(declare-fun e!419892 () Bool)

(assert (=> b!752835 (= e!419895 e!419892)))

(declare-fun res!508575 () Bool)

(assert (=> b!752835 (=> res!508575 e!419892)))

(declare-fun lt!334803 () SeekEntryResult!7639)

(assert (=> b!752835 (= res!508575 (not (= lt!334795 lt!334803)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41856 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752835 (= lt!334795 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752836 () Bool)

(declare-fun e!419896 () Bool)

(assert (=> b!752836 (= e!419896 (not e!419895))))

(declare-fun res!508569 () Bool)

(assert (=> b!752836 (=> res!508569 e!419895)))

(declare-fun lt!334801 () SeekEntryResult!7639)

(get-info :version)

(assert (=> b!752836 (= res!508569 (or (not ((_ is Intermediate!7639) lt!334801)) (bvslt x!1131 (x!63848 lt!334801)) (not (= x!1131 (x!63848 lt!334801))) (not (= index!1321 (index!32926 lt!334801)))))))

(declare-fun e!419891 () Bool)

(assert (=> b!752836 e!419891))

(declare-fun res!508562 () Bool)

(assert (=> b!752836 (=> (not res!508562) (not e!419891))))

(assert (=> b!752836 (= res!508562 (= lt!334796 lt!334803))))

(assert (=> b!752836 (= lt!334803 (Found!7639 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41856 (_ BitVec 32)) SeekEntryResult!7639)

(assert (=> b!752836 (= lt!334796 (seekEntryOrOpen!0 (select (arr!20042 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752836 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25916 0))(
  ( (Unit!25917) )
))
(declare-fun lt!334794 () Unit!25916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25916)

(assert (=> b!752836 (= lt!334794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752837 () Bool)

(assert (=> b!752837 (= e!419891 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!334803))))

(declare-fun b!752838 () Bool)

(declare-fun res!508559 () Bool)

(assert (=> b!752838 (=> (not res!508559) (not e!419893))))

(assert (=> b!752838 (= res!508559 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20463 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20463 a!3186))))))

(declare-fun b!752839 () Bool)

(assert (=> b!752839 (= e!419890 e!419893)))

(declare-fun res!508570 () Bool)

(assert (=> b!752839 (=> (not res!508570) (not e!419893))))

(declare-fun lt!334799 () SeekEntryResult!7639)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752839 (= res!508570 (or (= lt!334799 (MissingZero!7639 i!1173)) (= lt!334799 (MissingVacant!7639 i!1173))))))

(assert (=> b!752839 (= lt!334799 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752840 () Bool)

(declare-fun res!508560 () Bool)

(assert (=> b!752840 (=> (not res!508560) (not e!419893))))

(declare-datatypes ((List!14083 0))(
  ( (Nil!14080) (Cons!14079 (h!15151 (_ BitVec 64)) (t!20389 List!14083)) )
))
(declare-fun arrayNoDuplicates!0 (array!41856 (_ BitVec 32) List!14083) Bool)

(assert (=> b!752840 (= res!508560 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14080))))

(declare-fun b!752841 () Bool)

(declare-fun e!419897 () Unit!25916)

(declare-fun Unit!25918 () Unit!25916)

(assert (=> b!752841 (= e!419897 Unit!25918)))

(assert (=> b!752841 false))

(declare-fun b!752842 () Bool)

(declare-fun res!508567 () Bool)

(assert (=> b!752842 (=> (not res!508567) (not e!419894))))

(declare-fun lt!334804 () array!41856)

(declare-fun lt!334798 () (_ BitVec 64))

(assert (=> b!752842 (= res!508567 (= (seekEntryOrOpen!0 lt!334798 lt!334804 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334798 lt!334804 mask!3328)))))

(declare-fun b!752843 () Bool)

(declare-fun res!508563 () Bool)

(assert (=> b!752843 (=> (not res!508563) (not e!419890))))

(declare-fun arrayContainsKey!0 (array!41856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752843 (= res!508563 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752844 () Bool)

(declare-fun res!508574 () Bool)

(assert (=> b!752844 (=> (not res!508574) (not e!419890))))

(assert (=> b!752844 (= res!508574 (and (= (size!20463 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20463 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20463 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752845 () Bool)

(declare-fun res!508566 () Bool)

(assert (=> b!752845 (=> (not res!508566) (not e!419890))))

(assert (=> b!752845 (= res!508566 (validKeyInArray!0 (select (arr!20042 a!3186) j!159)))))

(declare-fun b!752846 () Bool)

(assert (=> b!752846 (= e!419889 e!419896)))

(declare-fun res!508571 () Bool)

(assert (=> b!752846 (=> (not res!508571) (not e!419896))))

(declare-fun lt!334805 () SeekEntryResult!7639)

(assert (=> b!752846 (= res!508571 (= lt!334805 lt!334801))))

(assert (=> b!752846 (= lt!334801 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334798 lt!334804 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752846 (= lt!334805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334798 mask!3328) lt!334798 lt!334804 mask!3328))))

(assert (=> b!752846 (= lt!334798 (select (store (arr!20042 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752846 (= lt!334804 (array!41857 (store (arr!20042 a!3186) i!1173 k0!2102) (size!20463 a!3186)))))

(declare-fun b!752847 () Bool)

(declare-fun Unit!25919 () Unit!25916)

(assert (=> b!752847 (= e!419897 Unit!25919)))

(declare-fun b!752848 () Bool)

(assert (=> b!752848 (= e!419893 e!419889)))

(declare-fun res!508565 () Bool)

(assert (=> b!752848 (=> (not res!508565) (not e!419889))))

(assert (=> b!752848 (= res!508565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20042 a!3186) j!159) mask!3328) (select (arr!20042 a!3186) j!159) a!3186 mask!3328) lt!334797))))

(assert (=> b!752848 (= lt!334797 (Intermediate!7639 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752849 () Bool)

(declare-fun res!508557 () Bool)

(assert (=> b!752849 (=> (not res!508557) (not e!419889))))

(assert (=> b!752849 (= res!508557 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20042 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752850 () Bool)

(declare-fun e!419898 () Bool)

(assert (=> b!752850 (= e!419898 true)))

(assert (=> b!752850 e!419894))

(declare-fun res!508572 () Bool)

(assert (=> b!752850 (=> (not res!508572) (not e!419894))))

(declare-fun lt!334802 () (_ BitVec 64))

(assert (=> b!752850 (= res!508572 (= lt!334802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334800 () Unit!25916)

(assert (=> b!752850 (= lt!334800 e!419897)))

(declare-fun c!82518 () Bool)

(assert (=> b!752850 (= c!82518 (= lt!334802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752851 () Bool)

(assert (=> b!752851 (= e!419888 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20042 a!3186) j!159) a!3186 mask!3328) (Found!7639 j!159)))))

(declare-fun b!752852 () Bool)

(assert (=> b!752852 (= e!419892 e!419898)))

(declare-fun res!508558 () Bool)

(assert (=> b!752852 (=> res!508558 e!419898)))

(assert (=> b!752852 (= res!508558 (= lt!334802 lt!334798))))

(assert (=> b!752852 (= lt!334802 (select (store (arr!20042 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!65666 res!508564) b!752844))

(assert (= (and b!752844 res!508574) b!752845))

(assert (= (and b!752845 res!508566) b!752834))

(assert (= (and b!752834 res!508573) b!752843))

(assert (= (and b!752843 res!508563) b!752839))

(assert (= (and b!752839 res!508570) b!752830))

(assert (= (and b!752830 res!508568) b!752840))

(assert (= (and b!752840 res!508560) b!752838))

(assert (= (and b!752838 res!508559) b!752848))

(assert (= (and b!752848 res!508565) b!752849))

(assert (= (and b!752849 res!508557) b!752833))

(assert (= (and b!752833 c!82517) b!752831))

(assert (= (and b!752833 (not c!82517)) b!752851))

(assert (= (and b!752833 res!508561) b!752846))

(assert (= (and b!752846 res!508571) b!752836))

(assert (= (and b!752836 res!508562) b!752837))

(assert (= (and b!752836 (not res!508569)) b!752835))

(assert (= (and b!752835 (not res!508575)) b!752852))

(assert (= (and b!752852 (not res!508558)) b!752850))

(assert (= (and b!752850 c!82518) b!752841))

(assert (= (and b!752850 (not c!82518)) b!752847))

(assert (= (and b!752850 res!508572) b!752842))

(assert (= (and b!752842 res!508567) b!752832))

(declare-fun m!701105 () Bool)

(assert (=> b!752839 m!701105))

(declare-fun m!701107 () Bool)

(assert (=> b!752845 m!701107))

(assert (=> b!752845 m!701107))

(declare-fun m!701109 () Bool)

(assert (=> b!752845 m!701109))

(assert (=> b!752851 m!701107))

(assert (=> b!752851 m!701107))

(declare-fun m!701111 () Bool)

(assert (=> b!752851 m!701111))

(assert (=> b!752837 m!701107))

(assert (=> b!752837 m!701107))

(declare-fun m!701113 () Bool)

(assert (=> b!752837 m!701113))

(assert (=> b!752848 m!701107))

(assert (=> b!752848 m!701107))

(declare-fun m!701115 () Bool)

(assert (=> b!752848 m!701115))

(assert (=> b!752848 m!701115))

(assert (=> b!752848 m!701107))

(declare-fun m!701117 () Bool)

(assert (=> b!752848 m!701117))

(assert (=> b!752836 m!701107))

(assert (=> b!752836 m!701107))

(declare-fun m!701119 () Bool)

(assert (=> b!752836 m!701119))

(declare-fun m!701121 () Bool)

(assert (=> b!752836 m!701121))

(declare-fun m!701123 () Bool)

(assert (=> b!752836 m!701123))

(declare-fun m!701125 () Bool)

(assert (=> b!752834 m!701125))

(declare-fun m!701127 () Bool)

(assert (=> b!752830 m!701127))

(declare-fun m!701129 () Bool)

(assert (=> b!752852 m!701129))

(declare-fun m!701131 () Bool)

(assert (=> b!752852 m!701131))

(assert (=> b!752831 m!701107))

(assert (=> b!752831 m!701107))

(declare-fun m!701133 () Bool)

(assert (=> b!752831 m!701133))

(declare-fun m!701135 () Bool)

(assert (=> b!752843 m!701135))

(declare-fun m!701137 () Bool)

(assert (=> start!65666 m!701137))

(declare-fun m!701139 () Bool)

(assert (=> start!65666 m!701139))

(declare-fun m!701141 () Bool)

(assert (=> b!752846 m!701141))

(assert (=> b!752846 m!701129))

(assert (=> b!752846 m!701141))

(declare-fun m!701143 () Bool)

(assert (=> b!752846 m!701143))

(declare-fun m!701145 () Bool)

(assert (=> b!752846 m!701145))

(declare-fun m!701147 () Bool)

(assert (=> b!752846 m!701147))

(declare-fun m!701149 () Bool)

(assert (=> b!752840 m!701149))

(declare-fun m!701151 () Bool)

(assert (=> b!752842 m!701151))

(declare-fun m!701153 () Bool)

(assert (=> b!752842 m!701153))

(declare-fun m!701155 () Bool)

(assert (=> b!752849 m!701155))

(assert (=> b!752835 m!701107))

(assert (=> b!752835 m!701107))

(assert (=> b!752835 m!701111))

(check-sat (not b!752848) (not b!752842) (not b!752837) (not b!752839) (not b!752843) (not b!752851) (not b!752835) (not b!752840) (not b!752846) (not b!752830) (not b!752845) (not start!65666) (not b!752831) (not b!752834) (not b!752836))
(check-sat)
