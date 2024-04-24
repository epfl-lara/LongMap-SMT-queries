; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65340 () Bool)

(assert start!65340)

(declare-fun b!739157 () Bool)

(declare-datatypes ((Unit!25201 0))(
  ( (Unit!25202) )
))
(declare-fun e!413446 () Unit!25201)

(declare-fun Unit!25203 () Unit!25201)

(assert (=> b!739157 (= e!413446 Unit!25203)))

(declare-fun lt!328063 () (_ BitVec 32))

(declare-datatypes ((array!41383 0))(
  ( (array!41384 (arr!19801 (Array (_ BitVec 32) (_ BitVec 64))) (size!20221 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41383)

(declare-datatypes ((SeekEntryResult!7357 0))(
  ( (MissingZero!7357 (index!31796 (_ BitVec 32))) (Found!7357 (index!31797 (_ BitVec 32))) (Intermediate!7357 (undefined!8169 Bool) (index!31798 (_ BitVec 32)) (x!62951 (_ BitVec 32))) (Undefined!7357) (MissingVacant!7357 (index!31799 (_ BitVec 32))) )
))
(declare-fun lt!328065 () SeekEntryResult!7357)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!739157 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328063 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328065)))

(declare-fun b!739158 () Bool)

(declare-fun res!496722 () Bool)

(declare-fun e!413439 () Bool)

(assert (=> b!739158 (=> (not res!496722) (not e!413439))))

(declare-fun e!413442 () Bool)

(assert (=> b!739158 (= res!496722 e!413442)))

(declare-fun c!81608 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739158 (= c!81608 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739159 () Bool)

(declare-fun res!496720 () Bool)

(declare-fun e!413438 () Bool)

(assert (=> b!739159 (=> (not res!496720) (not e!413438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41383 (_ BitVec 32)) Bool)

(assert (=> b!739159 (= res!496720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739160 () Bool)

(declare-fun e!413443 () Bool)

(assert (=> b!739160 (= e!413443 true)))

(declare-fun lt!328062 () array!41383)

(declare-fun lt!328067 () (_ BitVec 64))

(declare-fun lt!328061 () SeekEntryResult!7357)

(assert (=> b!739160 (= lt!328061 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328063 lt!328067 lt!328062 mask!3328))))

(declare-fun b!739161 () Bool)

(declare-fun res!496713 () Bool)

(declare-fun e!413437 () Bool)

(assert (=> b!739161 (=> (not res!496713) (not e!413437))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739161 (= res!496713 (and (= (size!20221 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20221 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20221 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739162 () Bool)

(assert (=> b!739162 (= e!413438 e!413439)))

(declare-fun res!496729 () Bool)

(assert (=> b!739162 (=> (not res!496729) (not e!413439))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739162 (= res!496729 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19801 a!3186) j!159) mask!3328) (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328065))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!739162 (= lt!328065 (Intermediate!7357 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739163 () Bool)

(declare-fun e!413441 () Bool)

(assert (=> b!739163 (= e!413439 e!413441)))

(declare-fun res!496724 () Bool)

(assert (=> b!739163 (=> (not res!496724) (not e!413441))))

(declare-fun lt!328064 () SeekEntryResult!7357)

(declare-fun lt!328071 () SeekEntryResult!7357)

(assert (=> b!739163 (= res!496724 (= lt!328064 lt!328071))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739163 (= lt!328071 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328067 lt!328062 mask!3328))))

(assert (=> b!739163 (= lt!328064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328067 mask!3328) lt!328067 lt!328062 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739163 (= lt!328067 (select (store (arr!19801 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739163 (= lt!328062 (array!41384 (store (arr!19801 a!3186) i!1173 k0!2102) (size!20221 a!3186)))))

(declare-fun b!739164 () Bool)

(declare-fun res!496728 () Bool)

(assert (=> b!739164 (=> (not res!496728) (not e!413438))))

(assert (=> b!739164 (= res!496728 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20221 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20221 a!3186))))))

(declare-fun b!739165 () Bool)

(declare-fun res!496717 () Bool)

(assert (=> b!739165 (=> res!496717 e!413443)))

(declare-fun e!413444 () Bool)

(assert (=> b!739165 (= res!496717 e!413444)))

(declare-fun c!81606 () Bool)

(declare-fun lt!328069 () Bool)

(assert (=> b!739165 (= c!81606 lt!328069)))

(declare-fun b!739167 () Bool)

(declare-fun Unit!25204 () Unit!25201)

(assert (=> b!739167 (= e!413446 Unit!25204)))

(declare-fun lt!328074 () SeekEntryResult!7357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!739167 (= lt!328074 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328070 () SeekEntryResult!7357)

(assert (=> b!739167 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328063 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328070)))

(declare-fun b!739168 () Bool)

(declare-fun e!413440 () Bool)

(assert (=> b!739168 (= e!413441 (not e!413440))))

(declare-fun res!496727 () Bool)

(assert (=> b!739168 (=> res!496727 e!413440)))

(get-info :version)

(assert (=> b!739168 (= res!496727 (or (not ((_ is Intermediate!7357) lt!328071)) (bvsge x!1131 (x!62951 lt!328071))))))

(assert (=> b!739168 (= lt!328070 (Found!7357 j!159))))

(declare-fun e!413448 () Bool)

(assert (=> b!739168 e!413448))

(declare-fun res!496725 () Bool)

(assert (=> b!739168 (=> (not res!496725) (not e!413448))))

(assert (=> b!739168 (= res!496725 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328066 () Unit!25201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25201)

(assert (=> b!739168 (= lt!328066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739169 () Bool)

(declare-fun res!496723 () Bool)

(assert (=> b!739169 (=> (not res!496723) (not e!413437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739169 (= res!496723 (validKeyInArray!0 k0!2102))))

(declare-fun b!739170 () Bool)

(assert (=> b!739170 (= e!413440 e!413443)))

(declare-fun res!496718 () Bool)

(assert (=> b!739170 (=> res!496718 e!413443)))

(assert (=> b!739170 (= res!496718 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328063 #b00000000000000000000000000000000) (bvsge lt!328063 (size!20221 a!3186))))))

(declare-fun lt!328072 () Unit!25201)

(assert (=> b!739170 (= lt!328072 e!413446)))

(declare-fun c!81607 () Bool)

(assert (=> b!739170 (= c!81607 lt!328069)))

(assert (=> b!739170 (= lt!328069 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739170 (= lt!328063 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!739171 () Bool)

(assert (=> b!739171 (= e!413437 e!413438)))

(declare-fun res!496716 () Bool)

(assert (=> b!739171 (=> (not res!496716) (not e!413438))))

(declare-fun lt!328073 () SeekEntryResult!7357)

(assert (=> b!739171 (= res!496716 (or (= lt!328073 (MissingZero!7357 i!1173)) (= lt!328073 (MissingVacant!7357 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41383 (_ BitVec 32)) SeekEntryResult!7357)

(assert (=> b!739171 (= lt!328073 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739172 () Bool)

(declare-fun res!496712 () Bool)

(assert (=> b!739172 (=> (not res!496712) (not e!413437))))

(declare-fun arrayContainsKey!0 (array!41383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739172 (= res!496712 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739173 () Bool)

(declare-fun e!413445 () Bool)

(declare-fun lt!328068 () SeekEntryResult!7357)

(assert (=> b!739173 (= e!413445 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328068))))

(declare-fun b!739174 () Bool)

(assert (=> b!739174 (= e!413442 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) (Found!7357 j!159)))))

(declare-fun b!739175 () Bool)

(declare-fun res!496714 () Bool)

(assert (=> b!739175 (=> (not res!496714) (not e!413437))))

(assert (=> b!739175 (= res!496714 (validKeyInArray!0 (select (arr!19801 a!3186) j!159)))))

(declare-fun b!739176 () Bool)

(declare-fun res!496715 () Bool)

(assert (=> b!739176 (=> (not res!496715) (not e!413438))))

(declare-datatypes ((List!13710 0))(
  ( (Nil!13707) (Cons!13706 (h!14784 (_ BitVec 64)) (t!20017 List!13710)) )
))
(declare-fun arrayNoDuplicates!0 (array!41383 (_ BitVec 32) List!13710) Bool)

(assert (=> b!739176 (= res!496715 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13707))))

(declare-fun res!496719 () Bool)

(assert (=> start!65340 (=> (not res!496719) (not e!413437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65340 (= res!496719 (validMask!0 mask!3328))))

(assert (=> start!65340 e!413437))

(assert (=> start!65340 true))

(declare-fun array_inv!15660 (array!41383) Bool)

(assert (=> start!65340 (array_inv!15660 a!3186)))

(declare-fun b!739166 () Bool)

(declare-fun res!496726 () Bool)

(assert (=> b!739166 (=> (not res!496726) (not e!413439))))

(assert (=> b!739166 (= res!496726 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19801 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739177 () Bool)

(assert (=> b!739177 (= e!413442 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328065))))

(declare-fun b!739178 () Bool)

(assert (=> b!739178 (= e!413444 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328063 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328070)))))

(declare-fun b!739179 () Bool)

(assert (=> b!739179 (= e!413444 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328063 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328065)))))

(declare-fun b!739180 () Bool)

(assert (=> b!739180 (= e!413448 e!413445)))

(declare-fun res!496721 () Bool)

(assert (=> b!739180 (=> (not res!496721) (not e!413445))))

(assert (=> b!739180 (= res!496721 (= (seekEntryOrOpen!0 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!328068))))

(assert (=> b!739180 (= lt!328068 (Found!7357 j!159))))

(assert (= (and start!65340 res!496719) b!739161))

(assert (= (and b!739161 res!496713) b!739175))

(assert (= (and b!739175 res!496714) b!739169))

(assert (= (and b!739169 res!496723) b!739172))

(assert (= (and b!739172 res!496712) b!739171))

(assert (= (and b!739171 res!496716) b!739159))

(assert (= (and b!739159 res!496720) b!739176))

(assert (= (and b!739176 res!496715) b!739164))

(assert (= (and b!739164 res!496728) b!739162))

(assert (= (and b!739162 res!496729) b!739166))

(assert (= (and b!739166 res!496726) b!739158))

(assert (= (and b!739158 c!81608) b!739177))

(assert (= (and b!739158 (not c!81608)) b!739174))

(assert (= (and b!739158 res!496722) b!739163))

(assert (= (and b!739163 res!496724) b!739168))

(assert (= (and b!739168 res!496725) b!739180))

(assert (= (and b!739180 res!496721) b!739173))

(assert (= (and b!739168 (not res!496727)) b!739170))

(assert (= (and b!739170 c!81607) b!739157))

(assert (= (and b!739170 (not c!81607)) b!739167))

(assert (= (and b!739170 (not res!496718)) b!739165))

(assert (= (and b!739165 c!81606) b!739179))

(assert (= (and b!739165 (not c!81606)) b!739178))

(assert (= (and b!739165 (not res!496717)) b!739160))

(declare-fun m!691209 () Bool)

(assert (=> b!739157 m!691209))

(assert (=> b!739157 m!691209))

(declare-fun m!691211 () Bool)

(assert (=> b!739157 m!691211))

(assert (=> b!739173 m!691209))

(assert (=> b!739173 m!691209))

(declare-fun m!691213 () Bool)

(assert (=> b!739173 m!691213))

(declare-fun m!691215 () Bool)

(assert (=> b!739171 m!691215))

(assert (=> b!739167 m!691209))

(assert (=> b!739167 m!691209))

(declare-fun m!691217 () Bool)

(assert (=> b!739167 m!691217))

(assert (=> b!739167 m!691209))

(declare-fun m!691219 () Bool)

(assert (=> b!739167 m!691219))

(declare-fun m!691221 () Bool)

(assert (=> b!739163 m!691221))

(declare-fun m!691223 () Bool)

(assert (=> b!739163 m!691223))

(declare-fun m!691225 () Bool)

(assert (=> b!739163 m!691225))

(declare-fun m!691227 () Bool)

(assert (=> b!739163 m!691227))

(assert (=> b!739163 m!691221))

(declare-fun m!691229 () Bool)

(assert (=> b!739163 m!691229))

(assert (=> b!739180 m!691209))

(assert (=> b!739180 m!691209))

(declare-fun m!691231 () Bool)

(assert (=> b!739180 m!691231))

(declare-fun m!691233 () Bool)

(assert (=> b!739169 m!691233))

(assert (=> b!739179 m!691209))

(assert (=> b!739179 m!691209))

(assert (=> b!739179 m!691211))

(assert (=> b!739174 m!691209))

(assert (=> b!739174 m!691209))

(assert (=> b!739174 m!691217))

(declare-fun m!691235 () Bool)

(assert (=> b!739159 m!691235))

(declare-fun m!691237 () Bool)

(assert (=> b!739168 m!691237))

(declare-fun m!691239 () Bool)

(assert (=> b!739168 m!691239))

(declare-fun m!691241 () Bool)

(assert (=> b!739176 m!691241))

(declare-fun m!691243 () Bool)

(assert (=> b!739166 m!691243))

(assert (=> b!739162 m!691209))

(assert (=> b!739162 m!691209))

(declare-fun m!691245 () Bool)

(assert (=> b!739162 m!691245))

(assert (=> b!739162 m!691245))

(assert (=> b!739162 m!691209))

(declare-fun m!691247 () Bool)

(assert (=> b!739162 m!691247))

(assert (=> b!739178 m!691209))

(assert (=> b!739178 m!691209))

(assert (=> b!739178 m!691219))

(declare-fun m!691249 () Bool)

(assert (=> b!739172 m!691249))

(declare-fun m!691251 () Bool)

(assert (=> start!65340 m!691251))

(declare-fun m!691253 () Bool)

(assert (=> start!65340 m!691253))

(assert (=> b!739177 m!691209))

(assert (=> b!739177 m!691209))

(declare-fun m!691255 () Bool)

(assert (=> b!739177 m!691255))

(assert (=> b!739175 m!691209))

(assert (=> b!739175 m!691209))

(declare-fun m!691257 () Bool)

(assert (=> b!739175 m!691257))

(declare-fun m!691259 () Bool)

(assert (=> b!739170 m!691259))

(declare-fun m!691261 () Bool)

(assert (=> b!739160 m!691261))

(check-sat (not b!739168) (not b!739157) (not b!739170) (not b!739179) (not b!739177) (not b!739160) (not b!739169) (not b!739159) (not b!739162) (not b!739171) (not b!739167) (not b!739178) (not b!739172) (not b!739174) (not start!65340) (not b!739163) (not b!739176) (not b!739175) (not b!739180) (not b!739173))
(check-sat)
