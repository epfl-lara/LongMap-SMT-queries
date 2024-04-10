; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67798 () Bool)

(assert start!67798)

(declare-fun b!788243 () Bool)

(declare-fun res!533993 () Bool)

(declare-fun e!438125 () Bool)

(assert (=> b!788243 (=> (not res!533993) (not e!438125))))

(declare-datatypes ((array!42838 0))(
  ( (array!42839 (arr!20507 (Array (_ BitVec 32) (_ BitVec 64))) (size!20928 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42838)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788243 (= res!533993 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788244 () Bool)

(declare-fun res!533995 () Bool)

(declare-fun e!438123 () Bool)

(assert (=> b!788244 (=> (not res!533995) (not e!438123))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!788244 (= res!533995 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20928 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20928 a!3186))))))

(declare-fun b!788245 () Bool)

(declare-fun res!533987 () Bool)

(assert (=> b!788245 (=> (not res!533987) (not e!438123))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42838 (_ BitVec 32)) Bool)

(assert (=> b!788245 (= res!533987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!533992 () Bool)

(assert (=> start!67798 (=> (not res!533992) (not e!438125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67798 (= res!533992 (validMask!0 mask!3328))))

(assert (=> start!67798 e!438125))

(assert (=> start!67798 true))

(declare-fun array_inv!16303 (array!42838) Bool)

(assert (=> start!67798 (array_inv!16303 a!3186)))

(declare-fun b!788246 () Bool)

(declare-fun res!533990 () Bool)

(assert (=> b!788246 (=> (not res!533990) (not e!438125))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788246 (= res!533990 (and (= (size!20928 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20928 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20928 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788247 () Bool)

(declare-fun e!438119 () Bool)

(assert (=> b!788247 (= e!438123 e!438119)))

(declare-fun res!533989 () Bool)

(assert (=> b!788247 (=> (not res!533989) (not e!438119))))

(declare-datatypes ((SeekEntryResult!8107 0))(
  ( (MissingZero!8107 (index!34796 (_ BitVec 32))) (Found!8107 (index!34797 (_ BitVec 32))) (Intermediate!8107 (undefined!8919 Bool) (index!34798 (_ BitVec 32)) (x!65727 (_ BitVec 32))) (Undefined!8107) (MissingVacant!8107 (index!34799 (_ BitVec 32))) )
))
(declare-fun lt!351675 () SeekEntryResult!8107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788247 (= res!533989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351675))))

(assert (=> b!788247 (= lt!351675 (Intermediate!8107 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788248 () Bool)

(declare-fun res!533984 () Bool)

(assert (=> b!788248 (=> (not res!533984) (not e!438119))))

(assert (=> b!788248 (= res!533984 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20507 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788249 () Bool)

(assert (=> b!788249 (= e!438125 e!438123)))

(declare-fun res!533978 () Bool)

(assert (=> b!788249 (=> (not res!533978) (not e!438123))))

(declare-fun lt!351677 () SeekEntryResult!8107)

(assert (=> b!788249 (= res!533978 (or (= lt!351677 (MissingZero!8107 i!1173)) (= lt!351677 (MissingVacant!8107 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8107)

(assert (=> b!788249 (= lt!351677 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788250 () Bool)

(declare-fun res!533986 () Bool)

(declare-fun e!438118 () Bool)

(assert (=> b!788250 (=> (not res!533986) (not e!438118))))

(declare-fun lt!351679 () array!42838)

(declare-fun lt!351671 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42838 (_ BitVec 32)) SeekEntryResult!8107)

(assert (=> b!788250 (= res!533986 (= (seekEntryOrOpen!0 lt!351671 lt!351679 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351671 lt!351679 mask!3328)))))

(declare-fun b!788251 () Bool)

(declare-fun lt!351676 () SeekEntryResult!8107)

(declare-fun lt!351669 () SeekEntryResult!8107)

(assert (=> b!788251 (= e!438118 (= lt!351676 lt!351669))))

(declare-fun b!788252 () Bool)

(declare-fun res!533979 () Bool)

(assert (=> b!788252 (=> (not res!533979) (not e!438119))))

(declare-fun e!438124 () Bool)

(assert (=> b!788252 (= res!533979 e!438124)))

(declare-fun c!87540 () Bool)

(assert (=> b!788252 (= c!87540 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788253 () Bool)

(assert (=> b!788253 (= e!438124 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351675))))

(declare-fun b!788254 () Bool)

(declare-fun res!533983 () Bool)

(assert (=> b!788254 (=> (not res!533983) (not e!438125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788254 (= res!533983 (validKeyInArray!0 (select (arr!20507 a!3186) j!159)))))

(declare-fun b!788255 () Bool)

(declare-datatypes ((Unit!27316 0))(
  ( (Unit!27317) )
))
(declare-fun e!438121 () Unit!27316)

(declare-fun Unit!27318 () Unit!27316)

(assert (=> b!788255 (= e!438121 Unit!27318)))

(assert (=> b!788255 false))

(declare-fun b!788256 () Bool)

(declare-fun e!438122 () Bool)

(assert (=> b!788256 (= e!438122 (= (select (arr!20507 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788256 e!438118))

(declare-fun res!533980 () Bool)

(assert (=> b!788256 (=> (not res!533980) (not e!438118))))

(declare-fun lt!351674 () (_ BitVec 64))

(assert (=> b!788256 (= res!533980 (= lt!351674 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351678 () Unit!27316)

(assert (=> b!788256 (= lt!351678 e!438121)))

(declare-fun c!87541 () Bool)

(assert (=> b!788256 (= c!87541 (= lt!351674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788257 () Bool)

(declare-fun e!438117 () Bool)

(declare-fun e!438128 () Bool)

(assert (=> b!788257 (= e!438117 e!438128)))

(declare-fun res!533982 () Bool)

(assert (=> b!788257 (=> res!533982 e!438128)))

(declare-fun lt!351680 () SeekEntryResult!8107)

(assert (=> b!788257 (= res!533982 (not (= lt!351669 lt!351680)))))

(assert (=> b!788257 (= lt!351669 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788258 () Bool)

(assert (=> b!788258 (= e!438124 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) (Found!8107 j!159)))))

(declare-fun b!788259 () Bool)

(declare-fun e!438127 () Bool)

(assert (=> b!788259 (= e!438127 (not e!438117))))

(declare-fun res!533994 () Bool)

(assert (=> b!788259 (=> res!533994 e!438117)))

(declare-fun lt!351672 () SeekEntryResult!8107)

(assert (=> b!788259 (= res!533994 (or (not (is-Intermediate!8107 lt!351672)) (bvslt x!1131 (x!65727 lt!351672)) (not (= x!1131 (x!65727 lt!351672))) (not (= index!1321 (index!34798 lt!351672)))))))

(declare-fun e!438126 () Bool)

(assert (=> b!788259 e!438126))

(declare-fun res!533985 () Bool)

(assert (=> b!788259 (=> (not res!533985) (not e!438126))))

(assert (=> b!788259 (= res!533985 (= lt!351676 lt!351680))))

(assert (=> b!788259 (= lt!351680 (Found!8107 j!159))))

(assert (=> b!788259 (= lt!351676 (seekEntryOrOpen!0 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788259 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351673 () Unit!27316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27316)

(assert (=> b!788259 (= lt!351673 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788260 () Bool)

(declare-fun res!533988 () Bool)

(assert (=> b!788260 (=> (not res!533988) (not e!438125))))

(assert (=> b!788260 (= res!533988 (validKeyInArray!0 k!2102))))

(declare-fun b!788261 () Bool)

(assert (=> b!788261 (= e!438119 e!438127)))

(declare-fun res!533991 () Bool)

(assert (=> b!788261 (=> (not res!533991) (not e!438127))))

(declare-fun lt!351670 () SeekEntryResult!8107)

(assert (=> b!788261 (= res!533991 (= lt!351670 lt!351672))))

(assert (=> b!788261 (= lt!351672 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351671 lt!351679 mask!3328))))

(assert (=> b!788261 (= lt!351670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351671 mask!3328) lt!351671 lt!351679 mask!3328))))

(assert (=> b!788261 (= lt!351671 (select (store (arr!20507 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788261 (= lt!351679 (array!42839 (store (arr!20507 a!3186) i!1173 k!2102) (size!20928 a!3186)))))

(declare-fun b!788262 () Bool)

(assert (=> b!788262 (= e!438128 e!438122)))

(declare-fun res!533981 () Bool)

(assert (=> b!788262 (=> res!533981 e!438122)))

(assert (=> b!788262 (= res!533981 (= lt!351674 lt!351671))))

(assert (=> b!788262 (= lt!351674 (select (store (arr!20507 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!788263 () Bool)

(declare-fun Unit!27319 () Unit!27316)

(assert (=> b!788263 (= e!438121 Unit!27319)))

(declare-fun b!788264 () Bool)

(assert (=> b!788264 (= e!438126 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351680))))

(declare-fun b!788265 () Bool)

(declare-fun res!533996 () Bool)

(assert (=> b!788265 (=> (not res!533996) (not e!438123))))

(declare-datatypes ((List!14509 0))(
  ( (Nil!14506) (Cons!14505 (h!15628 (_ BitVec 64)) (t!20824 List!14509)) )
))
(declare-fun arrayNoDuplicates!0 (array!42838 (_ BitVec 32) List!14509) Bool)

(assert (=> b!788265 (= res!533996 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14506))))

(assert (= (and start!67798 res!533992) b!788246))

(assert (= (and b!788246 res!533990) b!788254))

(assert (= (and b!788254 res!533983) b!788260))

(assert (= (and b!788260 res!533988) b!788243))

(assert (= (and b!788243 res!533993) b!788249))

(assert (= (and b!788249 res!533978) b!788245))

(assert (= (and b!788245 res!533987) b!788265))

(assert (= (and b!788265 res!533996) b!788244))

(assert (= (and b!788244 res!533995) b!788247))

(assert (= (and b!788247 res!533989) b!788248))

(assert (= (and b!788248 res!533984) b!788252))

(assert (= (and b!788252 c!87540) b!788253))

(assert (= (and b!788252 (not c!87540)) b!788258))

(assert (= (and b!788252 res!533979) b!788261))

(assert (= (and b!788261 res!533991) b!788259))

(assert (= (and b!788259 res!533985) b!788264))

(assert (= (and b!788259 (not res!533994)) b!788257))

(assert (= (and b!788257 (not res!533982)) b!788262))

(assert (= (and b!788262 (not res!533981)) b!788256))

(assert (= (and b!788256 c!87541) b!788255))

(assert (= (and b!788256 (not c!87541)) b!788263))

(assert (= (and b!788256 res!533980) b!788250))

(assert (= (and b!788250 res!533986) b!788251))

(declare-fun m!729629 () Bool)

(assert (=> b!788258 m!729629))

(assert (=> b!788258 m!729629))

(declare-fun m!729631 () Bool)

(assert (=> b!788258 m!729631))

(declare-fun m!729633 () Bool)

(assert (=> b!788256 m!729633))

(assert (=> b!788247 m!729629))

(assert (=> b!788247 m!729629))

(declare-fun m!729635 () Bool)

(assert (=> b!788247 m!729635))

(assert (=> b!788247 m!729635))

(assert (=> b!788247 m!729629))

(declare-fun m!729637 () Bool)

(assert (=> b!788247 m!729637))

(declare-fun m!729639 () Bool)

(assert (=> b!788249 m!729639))

(declare-fun m!729641 () Bool)

(assert (=> b!788250 m!729641))

(declare-fun m!729643 () Bool)

(assert (=> b!788250 m!729643))

(assert (=> b!788254 m!729629))

(assert (=> b!788254 m!729629))

(declare-fun m!729645 () Bool)

(assert (=> b!788254 m!729645))

(declare-fun m!729647 () Bool)

(assert (=> b!788243 m!729647))

(declare-fun m!729649 () Bool)

(assert (=> b!788248 m!729649))

(assert (=> b!788259 m!729629))

(assert (=> b!788259 m!729629))

(declare-fun m!729651 () Bool)

(assert (=> b!788259 m!729651))

(declare-fun m!729653 () Bool)

(assert (=> b!788259 m!729653))

(declare-fun m!729655 () Bool)

(assert (=> b!788259 m!729655))

(assert (=> b!788253 m!729629))

(assert (=> b!788253 m!729629))

(declare-fun m!729657 () Bool)

(assert (=> b!788253 m!729657))

(assert (=> b!788257 m!729629))

(assert (=> b!788257 m!729629))

(assert (=> b!788257 m!729631))

(declare-fun m!729659 () Bool)

(assert (=> b!788262 m!729659))

(declare-fun m!729661 () Bool)

(assert (=> b!788262 m!729661))

(declare-fun m!729663 () Bool)

(assert (=> b!788265 m!729663))

(assert (=> b!788264 m!729629))

(assert (=> b!788264 m!729629))

(declare-fun m!729665 () Bool)

(assert (=> b!788264 m!729665))

(declare-fun m!729667 () Bool)

(assert (=> start!67798 m!729667))

(declare-fun m!729669 () Bool)

(assert (=> start!67798 m!729669))

(declare-fun m!729671 () Bool)

(assert (=> b!788260 m!729671))

(assert (=> b!788261 m!729659))

(declare-fun m!729673 () Bool)

(assert (=> b!788261 m!729673))

(declare-fun m!729675 () Bool)

(assert (=> b!788261 m!729675))

(declare-fun m!729677 () Bool)

(assert (=> b!788261 m!729677))

(assert (=> b!788261 m!729675))

(declare-fun m!729679 () Bool)

(assert (=> b!788261 m!729679))

(declare-fun m!729681 () Bool)

(assert (=> b!788245 m!729681))

(push 1)

