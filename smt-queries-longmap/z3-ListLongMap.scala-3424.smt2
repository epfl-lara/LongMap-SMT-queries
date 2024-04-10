; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47534 () Bool)

(assert start!47534)

(declare-fun res!320534 () Bool)

(declare-fun e!305106 () Bool)

(assert (=> start!47534 (=> (not res!320534) (not e!305106))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47534 (= res!320534 (validMask!0 mask!3524))))

(assert (=> start!47534 e!305106))

(assert (=> start!47534 true))

(declare-datatypes ((array!33297 0))(
  ( (array!33298 (arr!16003 (Array (_ BitVec 32) (_ BitVec 64))) (size!16367 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33297)

(declare-fun array_inv!11799 (array!33297) Bool)

(assert (=> start!47534 (array_inv!11799 a!3235)))

(declare-fun b!523123 () Bool)

(declare-fun res!320531 () Bool)

(assert (=> b!523123 (=> (not res!320531) (not e!305106))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523123 (= res!320531 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523124 () Bool)

(declare-fun e!305105 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4470 0))(
  ( (MissingZero!4470 (index!20086 (_ BitVec 32))) (Found!4470 (index!20087 (_ BitVec 32))) (Intermediate!4470 (undefined!5282 Bool) (index!20088 (_ BitVec 32)) (x!49065 (_ BitVec 32))) (Undefined!4470) (MissingVacant!4470 (index!20089 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33297 (_ BitVec 32)) SeekEntryResult!4470)

(assert (=> b!523124 (= e!305105 (= (seekEntryOrOpen!0 (select (arr!16003 a!3235) j!176) a!3235 mask!3524) (Found!4470 j!176)))))

(declare-fun b!523125 () Bool)

(declare-datatypes ((Unit!16332 0))(
  ( (Unit!16333) )
))
(declare-fun e!305109 () Unit!16332)

(declare-fun Unit!16334 () Unit!16332)

(assert (=> b!523125 (= e!305109 Unit!16334)))

(declare-fun lt!239979 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239982 () Unit!16332)

(declare-fun lt!239980 () SeekEntryResult!4470)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16332)

(assert (=> b!523125 (= lt!239982 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239979 #b00000000000000000000000000000000 (index!20088 lt!239980) (x!49065 lt!239980) mask!3524))))

(declare-fun res!320536 () Bool)

(declare-fun lt!239981 () (_ BitVec 64))

(declare-fun lt!239977 () array!33297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33297 (_ BitVec 32)) SeekEntryResult!4470)

(assert (=> b!523125 (= res!320536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239979 lt!239981 lt!239977 mask!3524) (Intermediate!4470 false (index!20088 lt!239980) (x!49065 lt!239980))))))

(declare-fun e!305108 () Bool)

(assert (=> b!523125 (=> (not res!320536) (not e!305108))))

(assert (=> b!523125 e!305108))

(declare-fun b!523126 () Bool)

(declare-fun res!320528 () Bool)

(declare-fun e!305107 () Bool)

(assert (=> b!523126 (=> (not res!320528) (not e!305107))))

(declare-datatypes ((List!10161 0))(
  ( (Nil!10158) (Cons!10157 (h!11082 (_ BitVec 64)) (t!16389 List!10161)) )
))
(declare-fun arrayNoDuplicates!0 (array!33297 (_ BitVec 32) List!10161) Bool)

(assert (=> b!523126 (= res!320528 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10158))))

(declare-fun b!523127 () Bool)

(declare-fun res!320537 () Bool)

(assert (=> b!523127 (=> (not res!320537) (not e!305107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33297 (_ BitVec 32)) Bool)

(assert (=> b!523127 (= res!320537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523128 () Bool)

(declare-fun Unit!16335 () Unit!16332)

(assert (=> b!523128 (= e!305109 Unit!16335)))

(declare-fun b!523129 () Bool)

(declare-fun e!305104 () Bool)

(assert (=> b!523129 (= e!305107 (not e!305104))))

(declare-fun res!320532 () Bool)

(assert (=> b!523129 (=> res!320532 e!305104)))

(declare-fun lt!239978 () (_ BitVec 32))

(assert (=> b!523129 (= res!320532 (= lt!239980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239978 lt!239981 lt!239977 mask!3524)))))

(assert (=> b!523129 (= lt!239980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239979 (select (arr!16003 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523129 (= lt!239978 (toIndex!0 lt!239981 mask!3524))))

(assert (=> b!523129 (= lt!239981 (select (store (arr!16003 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523129 (= lt!239979 (toIndex!0 (select (arr!16003 a!3235) j!176) mask!3524))))

(assert (=> b!523129 (= lt!239977 (array!33298 (store (arr!16003 a!3235) i!1204 k0!2280) (size!16367 a!3235)))))

(assert (=> b!523129 e!305105))

(declare-fun res!320530 () Bool)

(assert (=> b!523129 (=> (not res!320530) (not e!305105))))

(assert (=> b!523129 (= res!320530 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239983 () Unit!16332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16332)

(assert (=> b!523129 (= lt!239983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523130 () Bool)

(declare-fun res!320527 () Bool)

(assert (=> b!523130 (=> (not res!320527) (not e!305106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523130 (= res!320527 (validKeyInArray!0 (select (arr!16003 a!3235) j!176)))))

(declare-fun b!523131 () Bool)

(declare-fun res!320529 () Bool)

(assert (=> b!523131 (=> res!320529 e!305104)))

(get-info :version)

(assert (=> b!523131 (= res!320529 (or (undefined!5282 lt!239980) (not ((_ is Intermediate!4470) lt!239980))))))

(declare-fun b!523132 () Bool)

(assert (=> b!523132 (= e!305106 e!305107)))

(declare-fun res!320526 () Bool)

(assert (=> b!523132 (=> (not res!320526) (not e!305107))))

(declare-fun lt!239975 () SeekEntryResult!4470)

(assert (=> b!523132 (= res!320526 (or (= lt!239975 (MissingZero!4470 i!1204)) (= lt!239975 (MissingVacant!4470 i!1204))))))

(assert (=> b!523132 (= lt!239975 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523133 () Bool)

(declare-fun res!320535 () Bool)

(assert (=> b!523133 (=> (not res!320535) (not e!305106))))

(assert (=> b!523133 (= res!320535 (validKeyInArray!0 k0!2280))))

(declare-fun b!523134 () Bool)

(assert (=> b!523134 (= e!305108 false)))

(declare-fun b!523135 () Bool)

(declare-fun res!320533 () Bool)

(assert (=> b!523135 (=> (not res!320533) (not e!305106))))

(assert (=> b!523135 (= res!320533 (and (= (size!16367 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16367 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16367 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523136 () Bool)

(assert (=> b!523136 (= e!305104 true)))

(assert (=> b!523136 (and (or (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239976 () Unit!16332)

(assert (=> b!523136 (= lt!239976 e!305109)))

(declare-fun c!61601 () Bool)

(assert (=> b!523136 (= c!61601 (= (select (arr!16003 a!3235) (index!20088 lt!239980)) (select (arr!16003 a!3235) j!176)))))

(assert (=> b!523136 (and (bvslt (x!49065 lt!239980) #b01111111111111111111111111111110) (or (= (select (arr!16003 a!3235) (index!20088 lt!239980)) (select (arr!16003 a!3235) j!176)) (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16003 a!3235) (index!20088 lt!239980)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47534 res!320534) b!523135))

(assert (= (and b!523135 res!320533) b!523130))

(assert (= (and b!523130 res!320527) b!523133))

(assert (= (and b!523133 res!320535) b!523123))

(assert (= (and b!523123 res!320531) b!523132))

(assert (= (and b!523132 res!320526) b!523127))

(assert (= (and b!523127 res!320537) b!523126))

(assert (= (and b!523126 res!320528) b!523129))

(assert (= (and b!523129 res!320530) b!523124))

(assert (= (and b!523129 (not res!320532)) b!523131))

(assert (= (and b!523131 (not res!320529)) b!523136))

(assert (= (and b!523136 c!61601) b!523125))

(assert (= (and b!523136 (not c!61601)) b!523128))

(assert (= (and b!523125 res!320536) b!523134))

(declare-fun m!503943 () Bool)

(assert (=> b!523132 m!503943))

(declare-fun m!503945 () Bool)

(assert (=> b!523124 m!503945))

(assert (=> b!523124 m!503945))

(declare-fun m!503947 () Bool)

(assert (=> b!523124 m!503947))

(declare-fun m!503949 () Bool)

(assert (=> b!523136 m!503949))

(assert (=> b!523136 m!503945))

(declare-fun m!503951 () Bool)

(assert (=> start!47534 m!503951))

(declare-fun m!503953 () Bool)

(assert (=> start!47534 m!503953))

(declare-fun m!503955 () Bool)

(assert (=> b!523127 m!503955))

(declare-fun m!503957 () Bool)

(assert (=> b!523126 m!503957))

(declare-fun m!503959 () Bool)

(assert (=> b!523133 m!503959))

(assert (=> b!523129 m!503945))

(declare-fun m!503961 () Bool)

(assert (=> b!523129 m!503961))

(declare-fun m!503963 () Bool)

(assert (=> b!523129 m!503963))

(declare-fun m!503965 () Bool)

(assert (=> b!523129 m!503965))

(declare-fun m!503967 () Bool)

(assert (=> b!523129 m!503967))

(assert (=> b!523129 m!503945))

(declare-fun m!503969 () Bool)

(assert (=> b!523129 m!503969))

(declare-fun m!503971 () Bool)

(assert (=> b!523129 m!503971))

(declare-fun m!503973 () Bool)

(assert (=> b!523129 m!503973))

(assert (=> b!523129 m!503945))

(declare-fun m!503975 () Bool)

(assert (=> b!523129 m!503975))

(assert (=> b!523130 m!503945))

(assert (=> b!523130 m!503945))

(declare-fun m!503977 () Bool)

(assert (=> b!523130 m!503977))

(declare-fun m!503979 () Bool)

(assert (=> b!523123 m!503979))

(declare-fun m!503981 () Bool)

(assert (=> b!523125 m!503981))

(declare-fun m!503983 () Bool)

(assert (=> b!523125 m!503983))

(check-sat (not b!523126) (not start!47534) (not b!523124) (not b!523130) (not b!523129) (not b!523127) (not b!523133) (not b!523132) (not b!523125) (not b!523123))
(check-sat)
