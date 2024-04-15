; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67100 () Bool)

(assert start!67100)

(declare-fun b!774947 () Bool)

(declare-fun res!524083 () Bool)

(declare-fun e!431313 () Bool)

(assert (=> b!774947 (=> (not res!524083) (not e!431313))))

(declare-datatypes ((array!42474 0))(
  ( (array!42475 (arr!20333 (Array (_ BitVec 32) (_ BitVec 64))) (size!20754 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42474)

(declare-datatypes ((List!14374 0))(
  ( (Nil!14371) (Cons!14370 (h!15478 (_ BitVec 64)) (t!20680 List!14374)) )
))
(declare-fun arrayNoDuplicates!0 (array!42474 (_ BitVec 32) List!14374) Bool)

(assert (=> b!774947 (= res!524083 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14371))))

(declare-fun b!774948 () Bool)

(declare-fun e!431305 () Bool)

(declare-fun e!431303 () Bool)

(assert (=> b!774948 (= e!431305 (not e!431303))))

(declare-fun res!524081 () Bool)

(assert (=> b!774948 (=> res!524081 e!431303)))

(declare-datatypes ((SeekEntryResult!7930 0))(
  ( (MissingZero!7930 (index!34088 (_ BitVec 32))) (Found!7930 (index!34089 (_ BitVec 32))) (Intermediate!7930 (undefined!8742 Bool) (index!34090 (_ BitVec 32)) (x!65044 (_ BitVec 32))) (Undefined!7930) (MissingVacant!7930 (index!34091 (_ BitVec 32))) )
))
(declare-fun lt!345071 () SeekEntryResult!7930)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!774948 (= res!524081 (or (not ((_ is Intermediate!7930) lt!345071)) (bvsge x!1131 (x!65044 lt!345071))))))

(declare-fun lt!345070 () SeekEntryResult!7930)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!774948 (= lt!345070 (Found!7930 j!159))))

(declare-fun e!431311 () Bool)

(assert (=> b!774948 e!431311))

(declare-fun res!524090 () Bool)

(assert (=> b!774948 (=> (not res!524090) (not e!431311))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42474 (_ BitVec 32)) Bool)

(assert (=> b!774948 (= res!524090 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26714 0))(
  ( (Unit!26715) )
))
(declare-fun lt!345066 () Unit!26714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26714)

(assert (=> b!774948 (= lt!345066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774949 () Bool)

(declare-fun res!524095 () Bool)

(declare-fun e!431307 () Bool)

(assert (=> b!774949 (=> (not res!524095) (not e!431307))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774949 (= res!524095 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774950 () Bool)

(declare-fun res!524089 () Bool)

(assert (=> b!774950 (=> (not res!524089) (not e!431307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774950 (= res!524089 (validKeyInArray!0 (select (arr!20333 a!3186) j!159)))))

(declare-fun b!774951 () Bool)

(declare-fun e!431304 () Unit!26714)

(declare-fun Unit!26716 () Unit!26714)

(assert (=> b!774951 (= e!431304 Unit!26716)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!345061 () SeekEntryResult!7930)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42474 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!774951 (= lt!345061 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345059 () (_ BitVec 32))

(assert (=> b!774951 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345059 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345070)))

(declare-fun b!774952 () Bool)

(declare-fun res!524092 () Bool)

(declare-fun e!431314 () Bool)

(assert (=> b!774952 (=> res!524092 e!431314)))

(declare-fun e!431309 () Bool)

(assert (=> b!774952 (= res!524092 e!431309)))

(declare-fun c!85835 () Bool)

(declare-fun lt!345063 () Bool)

(assert (=> b!774952 (= c!85835 lt!345063)))

(declare-fun b!774953 () Bool)

(declare-fun res!524094 () Bool)

(declare-fun e!431310 () Bool)

(assert (=> b!774953 (=> (not res!524094) (not e!431310))))

(declare-fun e!431308 () Bool)

(assert (=> b!774953 (= res!524094 e!431308)))

(declare-fun c!85834 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774953 (= c!85834 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774954 () Bool)

(declare-fun Unit!26717 () Unit!26714)

(assert (=> b!774954 (= e!431304 Unit!26717)))

(declare-fun lt!345068 () SeekEntryResult!7930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42474 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!774954 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345059 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345068)))

(declare-fun b!774955 () Bool)

(assert (=> b!774955 (= e!431303 e!431314)))

(declare-fun res!524085 () Bool)

(assert (=> b!774955 (=> res!524085 e!431314)))

(assert (=> b!774955 (= res!524085 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345059 #b00000000000000000000000000000000) (bvsge lt!345059 (size!20754 a!3186))))))

(declare-fun lt!345060 () Unit!26714)

(assert (=> b!774955 (= lt!345060 e!431304)))

(declare-fun c!85836 () Bool)

(assert (=> b!774955 (= c!85836 lt!345063)))

(assert (=> b!774955 (= lt!345063 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774955 (= lt!345059 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774956 () Bool)

(assert (=> b!774956 (= e!431309 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345059 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345070)))))

(declare-fun b!774957 () Bool)

(assert (=> b!774957 (= e!431313 e!431310)))

(declare-fun res!524079 () Bool)

(assert (=> b!774957 (=> (not res!524079) (not e!431310))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774957 (= res!524079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20333 a!3186) j!159) mask!3328) (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345068))))

(assert (=> b!774957 (= lt!345068 (Intermediate!7930 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774958 () Bool)

(declare-fun e!431312 () Bool)

(assert (=> b!774958 (= e!431311 e!431312)))

(declare-fun res!524080 () Bool)

(assert (=> b!774958 (=> (not res!524080) (not e!431312))))

(declare-fun lt!345062 () SeekEntryResult!7930)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42474 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!774958 (= res!524080 (= (seekEntryOrOpen!0 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345062))))

(assert (=> b!774958 (= lt!345062 (Found!7930 j!159))))

(declare-fun res!524087 () Bool)

(assert (=> start!67100 (=> (not res!524087) (not e!431307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67100 (= res!524087 (validMask!0 mask!3328))))

(assert (=> start!67100 e!431307))

(assert (=> start!67100 true))

(declare-fun array_inv!16216 (array!42474) Bool)

(assert (=> start!67100 (array_inv!16216 a!3186)))

(declare-fun b!774959 () Bool)

(assert (=> b!774959 (= e!431314 true)))

(declare-fun lt!345065 () (_ BitVec 64))

(declare-fun lt!345069 () array!42474)

(assert (=> b!774959 (= (seekEntryOrOpen!0 lt!345065 lt!345069 mask!3328) lt!345070)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!345064 () Unit!26714)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26714)

(assert (=> b!774959 (= lt!345064 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345059 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774960 () Bool)

(declare-fun res!524091 () Bool)

(assert (=> b!774960 (=> (not res!524091) (not e!431313))))

(assert (=> b!774960 (= res!524091 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20754 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20754 a!3186))))))

(declare-fun b!774961 () Bool)

(declare-fun res!524082 () Bool)

(assert (=> b!774961 (=> (not res!524082) (not e!431310))))

(assert (=> b!774961 (= res!524082 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20333 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774962 () Bool)

(declare-fun res!524093 () Bool)

(assert (=> b!774962 (=> (not res!524093) (not e!431307))))

(assert (=> b!774962 (= res!524093 (and (= (size!20754 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20754 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20754 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774963 () Bool)

(assert (=> b!774963 (= e!431307 e!431313)))

(declare-fun res!524097 () Bool)

(assert (=> b!774963 (=> (not res!524097) (not e!431313))))

(declare-fun lt!345067 () SeekEntryResult!7930)

(assert (=> b!774963 (= res!524097 (or (= lt!345067 (MissingZero!7930 i!1173)) (= lt!345067 (MissingVacant!7930 i!1173))))))

(assert (=> b!774963 (= lt!345067 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774964 () Bool)

(assert (=> b!774964 (= e!431310 e!431305)))

(declare-fun res!524088 () Bool)

(assert (=> b!774964 (=> (not res!524088) (not e!431305))))

(declare-fun lt!345058 () SeekEntryResult!7930)

(assert (=> b!774964 (= res!524088 (= lt!345058 lt!345071))))

(assert (=> b!774964 (= lt!345071 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345065 lt!345069 mask!3328))))

(assert (=> b!774964 (= lt!345058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345065 mask!3328) lt!345065 lt!345069 mask!3328))))

(assert (=> b!774964 (= lt!345065 (select (store (arr!20333 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774964 (= lt!345069 (array!42475 (store (arr!20333 a!3186) i!1173 k0!2102) (size!20754 a!3186)))))

(declare-fun b!774965 () Bool)

(assert (=> b!774965 (= e!431308 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) (Found!7930 j!159)))))

(declare-fun b!774966 () Bool)

(declare-fun res!524086 () Bool)

(assert (=> b!774966 (=> (not res!524086) (not e!431313))))

(assert (=> b!774966 (= res!524086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774967 () Bool)

(assert (=> b!774967 (= e!431309 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345059 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345068)))))

(declare-fun b!774968 () Bool)

(assert (=> b!774968 (= e!431312 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345062))))

(declare-fun b!774969 () Bool)

(assert (=> b!774969 (= e!431308 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20333 a!3186) j!159) a!3186 mask!3328) lt!345068))))

(declare-fun b!774970 () Bool)

(declare-fun res!524084 () Bool)

(assert (=> b!774970 (=> res!524084 e!431314)))

(assert (=> b!774970 (= res!524084 (not (= lt!345058 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345059 lt!345065 lt!345069 mask!3328))))))

(declare-fun b!774971 () Bool)

(declare-fun res!524096 () Bool)

(assert (=> b!774971 (=> (not res!524096) (not e!431307))))

(assert (=> b!774971 (= res!524096 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67100 res!524087) b!774962))

(assert (= (and b!774962 res!524093) b!774950))

(assert (= (and b!774950 res!524089) b!774971))

(assert (= (and b!774971 res!524096) b!774949))

(assert (= (and b!774949 res!524095) b!774963))

(assert (= (and b!774963 res!524097) b!774966))

(assert (= (and b!774966 res!524086) b!774947))

(assert (= (and b!774947 res!524083) b!774960))

(assert (= (and b!774960 res!524091) b!774957))

(assert (= (and b!774957 res!524079) b!774961))

(assert (= (and b!774961 res!524082) b!774953))

(assert (= (and b!774953 c!85834) b!774969))

(assert (= (and b!774953 (not c!85834)) b!774965))

(assert (= (and b!774953 res!524094) b!774964))

(assert (= (and b!774964 res!524088) b!774948))

(assert (= (and b!774948 res!524090) b!774958))

(assert (= (and b!774958 res!524080) b!774968))

(assert (= (and b!774948 (not res!524081)) b!774955))

(assert (= (and b!774955 c!85836) b!774954))

(assert (= (and b!774955 (not c!85836)) b!774951))

(assert (= (and b!774955 (not res!524085)) b!774952))

(assert (= (and b!774952 c!85835) b!774967))

(assert (= (and b!774952 (not c!85835)) b!774956))

(assert (= (and b!774952 (not res!524092)) b!774970))

(assert (= (and b!774970 (not res!524084)) b!774959))

(declare-fun m!718719 () Bool)

(assert (=> b!774968 m!718719))

(assert (=> b!774968 m!718719))

(declare-fun m!718721 () Bool)

(assert (=> b!774968 m!718721))

(assert (=> b!774969 m!718719))

(assert (=> b!774969 m!718719))

(declare-fun m!718723 () Bool)

(assert (=> b!774969 m!718723))

(assert (=> b!774956 m!718719))

(assert (=> b!774956 m!718719))

(declare-fun m!718725 () Bool)

(assert (=> b!774956 m!718725))

(declare-fun m!718727 () Bool)

(assert (=> b!774964 m!718727))

(declare-fun m!718729 () Bool)

(assert (=> b!774964 m!718729))

(declare-fun m!718731 () Bool)

(assert (=> b!774964 m!718731))

(declare-fun m!718733 () Bool)

(assert (=> b!774964 m!718733))

(assert (=> b!774964 m!718727))

(declare-fun m!718735 () Bool)

(assert (=> b!774964 m!718735))

(declare-fun m!718737 () Bool)

(assert (=> b!774948 m!718737))

(declare-fun m!718739 () Bool)

(assert (=> b!774948 m!718739))

(declare-fun m!718741 () Bool)

(assert (=> start!67100 m!718741))

(declare-fun m!718743 () Bool)

(assert (=> start!67100 m!718743))

(assert (=> b!774958 m!718719))

(assert (=> b!774958 m!718719))

(declare-fun m!718745 () Bool)

(assert (=> b!774958 m!718745))

(assert (=> b!774954 m!718719))

(assert (=> b!774954 m!718719))

(declare-fun m!718747 () Bool)

(assert (=> b!774954 m!718747))

(assert (=> b!774967 m!718719))

(assert (=> b!774967 m!718719))

(assert (=> b!774967 m!718747))

(declare-fun m!718749 () Bool)

(assert (=> b!774955 m!718749))

(assert (=> b!774965 m!718719))

(assert (=> b!774965 m!718719))

(declare-fun m!718751 () Bool)

(assert (=> b!774965 m!718751))

(declare-fun m!718753 () Bool)

(assert (=> b!774970 m!718753))

(declare-fun m!718755 () Bool)

(assert (=> b!774961 m!718755))

(declare-fun m!718757 () Bool)

(assert (=> b!774949 m!718757))

(declare-fun m!718759 () Bool)

(assert (=> b!774959 m!718759))

(declare-fun m!718761 () Bool)

(assert (=> b!774959 m!718761))

(assert (=> b!774951 m!718719))

(assert (=> b!774951 m!718719))

(assert (=> b!774951 m!718751))

(assert (=> b!774951 m!718719))

(assert (=> b!774951 m!718725))

(declare-fun m!718763 () Bool)

(assert (=> b!774947 m!718763))

(assert (=> b!774950 m!718719))

(assert (=> b!774950 m!718719))

(declare-fun m!718765 () Bool)

(assert (=> b!774950 m!718765))

(assert (=> b!774957 m!718719))

(assert (=> b!774957 m!718719))

(declare-fun m!718767 () Bool)

(assert (=> b!774957 m!718767))

(assert (=> b!774957 m!718767))

(assert (=> b!774957 m!718719))

(declare-fun m!718769 () Bool)

(assert (=> b!774957 m!718769))

(declare-fun m!718771 () Bool)

(assert (=> b!774963 m!718771))

(declare-fun m!718773 () Bool)

(assert (=> b!774971 m!718773))

(declare-fun m!718775 () Bool)

(assert (=> b!774966 m!718775))

(check-sat (not b!774949) (not b!774971) (not b!774947) (not b!774967) (not b!774968) (not b!774970) (not b!774950) (not b!774957) (not b!774966) (not b!774956) (not b!774951) (not start!67100) (not b!774963) (not b!774958) (not b!774955) (not b!774948) (not b!774965) (not b!774954) (not b!774959) (not b!774969) (not b!774964))
(check-sat)
