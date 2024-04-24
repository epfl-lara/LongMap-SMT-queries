; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47678 () Bool)

(assert start!47678)

(declare-fun b!524178 () Bool)

(declare-fun res!321170 () Bool)

(declare-fun e!305720 () Bool)

(assert (=> b!524178 (=> (not res!321170) (not e!305720))))

(declare-datatypes ((array!33316 0))(
  ( (array!33317 (arr!16009 (Array (_ BitVec 32) (_ BitVec 64))) (size!16373 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33316)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524178 (= res!321170 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!321169 () Bool)

(assert (=> start!47678 (=> (not res!321169) (not e!305720))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47678 (= res!321169 (validMask!0 mask!3524))))

(assert (=> start!47678 e!305720))

(assert (=> start!47678 true))

(declare-fun array_inv!11868 (array!33316) Bool)

(assert (=> start!47678 (array_inv!11868 a!3235)))

(declare-fun b!524179 () Bool)

(declare-datatypes ((Unit!16339 0))(
  ( (Unit!16340) )
))
(declare-fun e!305715 () Unit!16339)

(declare-fun Unit!16341 () Unit!16339)

(assert (=> b!524179 (= e!305715 Unit!16341)))

(declare-fun b!524180 () Bool)

(declare-fun Unit!16342 () Unit!16339)

(assert (=> b!524180 (= e!305715 Unit!16342)))

(declare-fun lt!240573 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240576 () Unit!16339)

(declare-datatypes ((SeekEntryResult!4432 0))(
  ( (MissingZero!4432 (index!19940 (_ BitVec 32))) (Found!4432 (index!19941 (_ BitVec 32))) (Intermediate!4432 (undefined!5244 Bool) (index!19942 (_ BitVec 32)) (x!49074 (_ BitVec 32))) (Undefined!4432) (MissingVacant!4432 (index!19943 (_ BitVec 32))) )
))
(declare-fun lt!240572 () SeekEntryResult!4432)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16339)

(assert (=> b!524180 (= lt!240576 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240573 #b00000000000000000000000000000000 (index!19942 lt!240572) (x!49074 lt!240572) mask!3524))))

(declare-fun lt!240575 () (_ BitVec 64))

(declare-fun lt!240577 () array!33316)

(declare-fun res!321171 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33316 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!524180 (= res!321171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240573 lt!240575 lt!240577 mask!3524) (Intermediate!4432 false (index!19942 lt!240572) (x!49074 lt!240572))))))

(declare-fun e!305716 () Bool)

(assert (=> b!524180 (=> (not res!321171) (not e!305716))))

(assert (=> b!524180 e!305716))

(declare-fun e!305718 () Bool)

(declare-fun b!524181 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33316 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!524181 (= e!305718 (= (seekEntryOrOpen!0 (select (arr!16009 a!3235) j!176) a!3235 mask!3524) (Found!4432 j!176)))))

(declare-fun b!524182 () Bool)

(declare-fun res!321167 () Bool)

(assert (=> b!524182 (=> (not res!321167) (not e!305720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524182 (= res!321167 (validKeyInArray!0 k0!2280))))

(declare-fun b!524183 () Bool)

(declare-fun e!305719 () Bool)

(declare-fun e!305721 () Bool)

(assert (=> b!524183 (= e!305719 (not e!305721))))

(declare-fun res!321177 () Bool)

(assert (=> b!524183 (=> res!321177 e!305721)))

(declare-fun lt!240579 () (_ BitVec 32))

(assert (=> b!524183 (= res!321177 (= lt!240572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240579 lt!240575 lt!240577 mask!3524)))))

(assert (=> b!524183 (= lt!240572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240573 (select (arr!16009 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524183 (= lt!240579 (toIndex!0 lt!240575 mask!3524))))

(assert (=> b!524183 (= lt!240575 (select (store (arr!16009 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524183 (= lt!240573 (toIndex!0 (select (arr!16009 a!3235) j!176) mask!3524))))

(assert (=> b!524183 (= lt!240577 (array!33317 (store (arr!16009 a!3235) i!1204 k0!2280) (size!16373 a!3235)))))

(assert (=> b!524183 e!305718))

(declare-fun res!321168 () Bool)

(assert (=> b!524183 (=> (not res!321168) (not e!305718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33316 (_ BitVec 32)) Bool)

(assert (=> b!524183 (= res!321168 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240580 () Unit!16339)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16339)

(assert (=> b!524183 (= lt!240580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524184 () Bool)

(declare-fun res!321172 () Bool)

(assert (=> b!524184 (=> (not res!321172) (not e!305720))))

(assert (=> b!524184 (= res!321172 (validKeyInArray!0 (select (arr!16009 a!3235) j!176)))))

(declare-fun b!524185 () Bool)

(assert (=> b!524185 (= e!305720 e!305719)))

(declare-fun res!321178 () Bool)

(assert (=> b!524185 (=> (not res!321178) (not e!305719))))

(declare-fun lt!240578 () SeekEntryResult!4432)

(assert (=> b!524185 (= res!321178 (or (= lt!240578 (MissingZero!4432 i!1204)) (= lt!240578 (MissingVacant!4432 i!1204))))))

(assert (=> b!524185 (= lt!240578 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524186 () Bool)

(declare-fun res!321175 () Bool)

(assert (=> b!524186 (=> (not res!321175) (not e!305719))))

(assert (=> b!524186 (= res!321175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524187 () Bool)

(declare-fun res!321176 () Bool)

(assert (=> b!524187 (=> res!321176 e!305721)))

(get-info :version)

(assert (=> b!524187 (= res!321176 (or (undefined!5244 lt!240572) (not ((_ is Intermediate!4432) lt!240572))))))

(declare-fun b!524188 () Bool)

(declare-fun res!321174 () Bool)

(assert (=> b!524188 (=> (not res!321174) (not e!305720))))

(assert (=> b!524188 (= res!321174 (and (= (size!16373 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16373 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16373 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524189 () Bool)

(assert (=> b!524189 (= e!305716 false)))

(declare-fun b!524190 () Bool)

(assert (=> b!524190 (= e!305721 (or (bvsgt #b00000000000000000000000000000000 (x!49074 lt!240572)) (bvsgt (x!49074 lt!240572) #b01111111111111111111111111111110) (bvslt lt!240573 #b00000000000000000000000000000000) (bvsge lt!240573 (size!16373 a!3235)) (bvslt (index!19942 lt!240572) #b00000000000000000000000000000000) (bvsge (index!19942 lt!240572) (size!16373 a!3235)) (= lt!240572 (Intermediate!4432 false (index!19942 lt!240572) (x!49074 lt!240572)))))))

(assert (=> b!524190 (and (or (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240574 () Unit!16339)

(assert (=> b!524190 (= lt!240574 e!305715)))

(declare-fun c!61811 () Bool)

(assert (=> b!524190 (= c!61811 (= (select (arr!16009 a!3235) (index!19942 lt!240572)) (select (arr!16009 a!3235) j!176)))))

(assert (=> b!524190 (and (bvslt (x!49074 lt!240572) #b01111111111111111111111111111110) (or (= (select (arr!16009 a!3235) (index!19942 lt!240572)) (select (arr!16009 a!3235) j!176)) (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16009 a!3235) (index!19942 lt!240572)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524191 () Bool)

(declare-fun res!321173 () Bool)

(assert (=> b!524191 (=> (not res!321173) (not e!305719))))

(declare-datatypes ((List!10074 0))(
  ( (Nil!10071) (Cons!10070 (h!11001 (_ BitVec 64)) (t!16294 List!10074)) )
))
(declare-fun arrayNoDuplicates!0 (array!33316 (_ BitVec 32) List!10074) Bool)

(assert (=> b!524191 (= res!321173 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10071))))

(assert (= (and start!47678 res!321169) b!524188))

(assert (= (and b!524188 res!321174) b!524184))

(assert (= (and b!524184 res!321172) b!524182))

(assert (= (and b!524182 res!321167) b!524178))

(assert (= (and b!524178 res!321170) b!524185))

(assert (= (and b!524185 res!321178) b!524186))

(assert (= (and b!524186 res!321175) b!524191))

(assert (= (and b!524191 res!321173) b!524183))

(assert (= (and b!524183 res!321168) b!524181))

(assert (= (and b!524183 (not res!321177)) b!524187))

(assert (= (and b!524187 (not res!321176)) b!524190))

(assert (= (and b!524190 c!61811) b!524180))

(assert (= (and b!524190 (not c!61811)) b!524179))

(assert (= (and b!524180 res!321171) b!524189))

(declare-fun m!505057 () Bool)

(assert (=> b!524183 m!505057))

(declare-fun m!505059 () Bool)

(assert (=> b!524183 m!505059))

(declare-fun m!505061 () Bool)

(assert (=> b!524183 m!505061))

(declare-fun m!505063 () Bool)

(assert (=> b!524183 m!505063))

(declare-fun m!505065 () Bool)

(assert (=> b!524183 m!505065))

(declare-fun m!505067 () Bool)

(assert (=> b!524183 m!505067))

(declare-fun m!505069 () Bool)

(assert (=> b!524183 m!505069))

(assert (=> b!524183 m!505061))

(declare-fun m!505071 () Bool)

(assert (=> b!524183 m!505071))

(assert (=> b!524183 m!505061))

(declare-fun m!505073 () Bool)

(assert (=> b!524183 m!505073))

(declare-fun m!505075 () Bool)

(assert (=> start!47678 m!505075))

(declare-fun m!505077 () Bool)

(assert (=> start!47678 m!505077))

(declare-fun m!505079 () Bool)

(assert (=> b!524182 m!505079))

(assert (=> b!524181 m!505061))

(assert (=> b!524181 m!505061))

(declare-fun m!505081 () Bool)

(assert (=> b!524181 m!505081))

(assert (=> b!524184 m!505061))

(assert (=> b!524184 m!505061))

(declare-fun m!505083 () Bool)

(assert (=> b!524184 m!505083))

(declare-fun m!505085 () Bool)

(assert (=> b!524178 m!505085))

(declare-fun m!505087 () Bool)

(assert (=> b!524186 m!505087))

(declare-fun m!505089 () Bool)

(assert (=> b!524180 m!505089))

(declare-fun m!505091 () Bool)

(assert (=> b!524180 m!505091))

(declare-fun m!505093 () Bool)

(assert (=> b!524185 m!505093))

(declare-fun m!505095 () Bool)

(assert (=> b!524190 m!505095))

(assert (=> b!524190 m!505061))

(declare-fun m!505097 () Bool)

(assert (=> b!524191 m!505097))

(check-sat (not b!524178) (not b!524191) (not b!524184) (not b!524185) (not b!524186) (not b!524181) (not b!524180) (not b!524182) (not b!524183) (not start!47678))
(check-sat)
