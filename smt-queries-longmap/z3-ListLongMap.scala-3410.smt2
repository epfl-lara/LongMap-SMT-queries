; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47384 () Bool)

(assert start!47384)

(declare-fun b!521032 () Bool)

(declare-fun e!304016 () Bool)

(declare-fun e!304011 () Bool)

(assert (=> b!521032 (= e!304016 e!304011)))

(declare-fun res!318893 () Bool)

(assert (=> b!521032 (=> (not res!318893) (not e!304011))))

(declare-datatypes ((SeekEntryResult!4428 0))(
  ( (MissingZero!4428 (index!19915 (_ BitVec 32))) (Found!4428 (index!19916 (_ BitVec 32))) (Intermediate!4428 (undefined!5240 Bool) (index!19917 (_ BitVec 32)) (x!48902 (_ BitVec 32))) (Undefined!4428) (MissingVacant!4428 (index!19918 (_ BitVec 32))) )
))
(declare-fun lt!238705 () SeekEntryResult!4428)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521032 (= res!318893 (or (= lt!238705 (MissingZero!4428 i!1204)) (= lt!238705 (MissingVacant!4428 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33210 0))(
  ( (array!33211 (arr!15961 (Array (_ BitVec 32) (_ BitVec 64))) (size!16325 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33210)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33210 (_ BitVec 32)) SeekEntryResult!4428)

(assert (=> b!521032 (= lt!238705 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521033 () Bool)

(declare-fun res!318892 () Bool)

(assert (=> b!521033 (=> (not res!318892) (not e!304016))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521033 (= res!318892 (and (= (size!16325 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16325 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16325 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521034 () Bool)

(declare-fun res!318899 () Bool)

(assert (=> b!521034 (=> (not res!318899) (not e!304016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521034 (= res!318899 (validKeyInArray!0 (select (arr!15961 a!3235) j!176)))))

(declare-fun b!521035 () Bool)

(declare-fun res!318894 () Bool)

(assert (=> b!521035 (=> (not res!318894) (not e!304016))))

(assert (=> b!521035 (= res!318894 (validKeyInArray!0 k0!2280))))

(declare-fun b!521036 () Bool)

(declare-fun res!318890 () Bool)

(assert (=> b!521036 (=> (not res!318890) (not e!304016))))

(declare-fun arrayContainsKey!0 (array!33210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521036 (= res!318890 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521038 () Bool)

(declare-datatypes ((Unit!16164 0))(
  ( (Unit!16165) )
))
(declare-fun e!304015 () Unit!16164)

(declare-fun Unit!16166 () Unit!16164)

(assert (=> b!521038 (= e!304015 Unit!16166)))

(declare-fun b!521039 () Bool)

(declare-fun res!318889 () Bool)

(declare-fun e!304014 () Bool)

(assert (=> b!521039 (=> res!318889 e!304014)))

(declare-fun lt!238700 () SeekEntryResult!4428)

(get-info :version)

(assert (=> b!521039 (= res!318889 (or (undefined!5240 lt!238700) (not ((_ is Intermediate!4428) lt!238700))))))

(declare-fun b!521040 () Bool)

(declare-fun res!318898 () Bool)

(assert (=> b!521040 (=> (not res!318898) (not e!304011))))

(declare-datatypes ((List!10119 0))(
  ( (Nil!10116) (Cons!10115 (h!11037 (_ BitVec 64)) (t!16347 List!10119)) )
))
(declare-fun arrayNoDuplicates!0 (array!33210 (_ BitVec 32) List!10119) Bool)

(assert (=> b!521040 (= res!318898 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10116))))

(declare-fun e!304012 () Bool)

(declare-fun b!521041 () Bool)

(assert (=> b!521041 (= e!304012 (= (seekEntryOrOpen!0 (select (arr!15961 a!3235) j!176) a!3235 mask!3524) (Found!4428 j!176)))))

(declare-fun b!521042 () Bool)

(assert (=> b!521042 (= e!304011 (not e!304014))))

(declare-fun res!318888 () Bool)

(assert (=> b!521042 (=> res!318888 e!304014)))

(declare-fun lt!238702 () array!33210)

(declare-fun lt!238699 () (_ BitVec 32))

(declare-fun lt!238698 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33210 (_ BitVec 32)) SeekEntryResult!4428)

(assert (=> b!521042 (= res!318888 (= lt!238700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238699 lt!238698 lt!238702 mask!3524)))))

(declare-fun lt!238697 () (_ BitVec 32))

(assert (=> b!521042 (= lt!238700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238697 (select (arr!15961 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521042 (= lt!238699 (toIndex!0 lt!238698 mask!3524))))

(assert (=> b!521042 (= lt!238698 (select (store (arr!15961 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521042 (= lt!238697 (toIndex!0 (select (arr!15961 a!3235) j!176) mask!3524))))

(assert (=> b!521042 (= lt!238702 (array!33211 (store (arr!15961 a!3235) i!1204 k0!2280) (size!16325 a!3235)))))

(assert (=> b!521042 e!304012))

(declare-fun res!318897 () Bool)

(assert (=> b!521042 (=> (not res!318897) (not e!304012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33210 (_ BitVec 32)) Bool)

(assert (=> b!521042 (= res!318897 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238703 () Unit!16164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16164)

(assert (=> b!521042 (= lt!238703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521043 () Bool)

(declare-fun e!304013 () Bool)

(assert (=> b!521043 (= e!304013 false)))

(declare-fun b!521037 () Bool)

(assert (=> b!521037 (= e!304014 true)))

(assert (=> b!521037 (and (or (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238701 () Unit!16164)

(assert (=> b!521037 (= lt!238701 e!304015)))

(declare-fun c!61373 () Bool)

(assert (=> b!521037 (= c!61373 (= (select (arr!15961 a!3235) (index!19917 lt!238700)) (select (arr!15961 a!3235) j!176)))))

(assert (=> b!521037 (and (bvslt (x!48902 lt!238700) #b01111111111111111111111111111110) (or (= (select (arr!15961 a!3235) (index!19917 lt!238700)) (select (arr!15961 a!3235) j!176)) (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15961 a!3235) (index!19917 lt!238700)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!318891 () Bool)

(assert (=> start!47384 (=> (not res!318891) (not e!304016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47384 (= res!318891 (validMask!0 mask!3524))))

(assert (=> start!47384 e!304016))

(assert (=> start!47384 true))

(declare-fun array_inv!11757 (array!33210) Bool)

(assert (=> start!47384 (array_inv!11757 a!3235)))

(declare-fun b!521044 () Bool)

(declare-fun res!318895 () Bool)

(assert (=> b!521044 (=> (not res!318895) (not e!304011))))

(assert (=> b!521044 (= res!318895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521045 () Bool)

(declare-fun Unit!16167 () Unit!16164)

(assert (=> b!521045 (= e!304015 Unit!16167)))

(declare-fun lt!238704 () Unit!16164)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33210 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16164)

(assert (=> b!521045 (= lt!238704 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238697 #b00000000000000000000000000000000 (index!19917 lt!238700) (x!48902 lt!238700) mask!3524))))

(declare-fun res!318896 () Bool)

(assert (=> b!521045 (= res!318896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238697 lt!238698 lt!238702 mask!3524) (Intermediate!4428 false (index!19917 lt!238700) (x!48902 lt!238700))))))

(assert (=> b!521045 (=> (not res!318896) (not e!304013))))

(assert (=> b!521045 e!304013))

(assert (= (and start!47384 res!318891) b!521033))

(assert (= (and b!521033 res!318892) b!521034))

(assert (= (and b!521034 res!318899) b!521035))

(assert (= (and b!521035 res!318894) b!521036))

(assert (= (and b!521036 res!318890) b!521032))

(assert (= (and b!521032 res!318893) b!521044))

(assert (= (and b!521044 res!318895) b!521040))

(assert (= (and b!521040 res!318898) b!521042))

(assert (= (and b!521042 res!318897) b!521041))

(assert (= (and b!521042 (not res!318888)) b!521039))

(assert (= (and b!521039 (not res!318889)) b!521037))

(assert (= (and b!521037 c!61373) b!521045))

(assert (= (and b!521037 (not c!61373)) b!521038))

(assert (= (and b!521045 res!318896) b!521043))

(declare-fun m!501945 () Bool)

(assert (=> b!521034 m!501945))

(assert (=> b!521034 m!501945))

(declare-fun m!501947 () Bool)

(assert (=> b!521034 m!501947))

(assert (=> b!521041 m!501945))

(assert (=> b!521041 m!501945))

(declare-fun m!501949 () Bool)

(assert (=> b!521041 m!501949))

(declare-fun m!501951 () Bool)

(assert (=> b!521032 m!501951))

(declare-fun m!501953 () Bool)

(assert (=> b!521045 m!501953))

(declare-fun m!501955 () Bool)

(assert (=> b!521045 m!501955))

(declare-fun m!501957 () Bool)

(assert (=> b!521037 m!501957))

(assert (=> b!521037 m!501945))

(declare-fun m!501959 () Bool)

(assert (=> start!47384 m!501959))

(declare-fun m!501961 () Bool)

(assert (=> start!47384 m!501961))

(declare-fun m!501963 () Bool)

(assert (=> b!521044 m!501963))

(declare-fun m!501965 () Bool)

(assert (=> b!521035 m!501965))

(declare-fun m!501967 () Bool)

(assert (=> b!521042 m!501967))

(declare-fun m!501969 () Bool)

(assert (=> b!521042 m!501969))

(assert (=> b!521042 m!501945))

(declare-fun m!501971 () Bool)

(assert (=> b!521042 m!501971))

(assert (=> b!521042 m!501945))

(declare-fun m!501973 () Bool)

(assert (=> b!521042 m!501973))

(assert (=> b!521042 m!501945))

(declare-fun m!501975 () Bool)

(assert (=> b!521042 m!501975))

(declare-fun m!501977 () Bool)

(assert (=> b!521042 m!501977))

(declare-fun m!501979 () Bool)

(assert (=> b!521042 m!501979))

(declare-fun m!501981 () Bool)

(assert (=> b!521042 m!501981))

(declare-fun m!501983 () Bool)

(assert (=> b!521040 m!501983))

(declare-fun m!501985 () Bool)

(assert (=> b!521036 m!501985))

(check-sat (not b!521032) (not b!521042) (not start!47384) (not b!521040) (not b!521044) (not b!521045) (not b!521041) (not b!521036) (not b!521034) (not b!521035))
(check-sat)
