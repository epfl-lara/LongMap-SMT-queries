; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52152 () Bool)

(assert start!52152)

(declare-fun b!569212 () Bool)

(declare-fun res!359233 () Bool)

(declare-fun e!327479 () Bool)

(assert (=> b!569212 (=> (not res!359233) (not e!327479))))

(declare-datatypes ((array!35675 0))(
  ( (array!35676 (arr!17129 (Array (_ BitVec 32) (_ BitVec 64))) (size!17493 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35675)

(declare-datatypes ((List!11209 0))(
  ( (Nil!11206) (Cons!11205 (h!12226 (_ BitVec 64)) (t!17437 List!11209)) )
))
(declare-fun arrayNoDuplicates!0 (array!35675 (_ BitVec 32) List!11209) Bool)

(assert (=> b!569212 (= res!359233 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11206))))

(declare-fun b!569213 () Bool)

(declare-fun e!327478 () Bool)

(assert (=> b!569213 (= e!327478 e!327479)))

(declare-fun res!359237 () Bool)

(assert (=> b!569213 (=> (not res!359237) (not e!327479))))

(declare-datatypes ((SeekEntryResult!5578 0))(
  ( (MissingZero!5578 (index!24539 (_ BitVec 32))) (Found!5578 (index!24540 (_ BitVec 32))) (Intermediate!5578 (undefined!6390 Bool) (index!24541 (_ BitVec 32)) (x!53413 (_ BitVec 32))) (Undefined!5578) (MissingVacant!5578 (index!24542 (_ BitVec 32))) )
))
(declare-fun lt!259392 () SeekEntryResult!5578)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569213 (= res!359237 (or (= lt!259392 (MissingZero!5578 i!1132)) (= lt!259392 (MissingVacant!5578 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35675 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!569213 (= lt!259392 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569214 () Bool)

(declare-fun res!359230 () Bool)

(assert (=> b!569214 (=> (not res!359230) (not e!327478))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569214 (= res!359230 (and (= (size!17493 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17493 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17493 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569215 () Bool)

(declare-fun res!359236 () Bool)

(assert (=> b!569215 (=> (not res!359236) (not e!327478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569215 (= res!359236 (validKeyInArray!0 k!1914))))

(declare-fun b!569216 () Bool)

(declare-fun res!359234 () Bool)

(assert (=> b!569216 (=> (not res!359234) (not e!327478))))

(declare-fun arrayContainsKey!0 (array!35675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569216 (= res!359234 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569217 () Bool)

(declare-fun e!327477 () Bool)

(declare-fun lt!259391 () SeekEntryResult!5578)

(assert (=> b!569217 (= e!327477 (not (or (undefined!6390 lt!259391) (not (is-Intermediate!5578 lt!259391)) (= (select (arr!17129 a!3118) (index!24541 lt!259391)) (select (arr!17129 a!3118) j!142)) (not (= (select (arr!17129 a!3118) (index!24541 lt!259391)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!17493 a!3118)) (bvsle j!142 (size!17493 a!3118)))))))

(declare-fun lt!259395 () SeekEntryResult!5578)

(assert (=> b!569217 (and (= lt!259395 (Found!5578 j!142)) (or (undefined!6390 lt!259391) (not (is-Intermediate!5578 lt!259391)) (= (select (arr!17129 a!3118) (index!24541 lt!259391)) (select (arr!17129 a!3118) j!142)) (not (= (select (arr!17129 a!3118) (index!24541 lt!259391)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259395 (MissingZero!5578 (index!24541 lt!259391)))))))

(assert (=> b!569217 (= lt!259395 (seekEntryOrOpen!0 (select (arr!17129 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35675 (_ BitVec 32)) Bool)

(assert (=> b!569217 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17858 0))(
  ( (Unit!17859) )
))
(declare-fun lt!259394 () Unit!17858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17858)

(assert (=> b!569217 (= lt!259394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569211 () Bool)

(declare-fun res!359229 () Bool)

(assert (=> b!569211 (=> (not res!359229) (not e!327479))))

(assert (=> b!569211 (= res!359229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359232 () Bool)

(assert (=> start!52152 (=> (not res!359232) (not e!327478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52152 (= res!359232 (validMask!0 mask!3119))))

(assert (=> start!52152 e!327478))

(assert (=> start!52152 true))

(declare-fun array_inv!12925 (array!35675) Bool)

(assert (=> start!52152 (array_inv!12925 a!3118)))

(declare-fun b!569218 () Bool)

(declare-fun res!359231 () Bool)

(assert (=> b!569218 (=> (not res!359231) (not e!327478))))

(assert (=> b!569218 (= res!359231 (validKeyInArray!0 (select (arr!17129 a!3118) j!142)))))

(declare-fun b!569219 () Bool)

(assert (=> b!569219 (= e!327479 e!327477)))

(declare-fun res!359235 () Bool)

(assert (=> b!569219 (=> (not res!359235) (not e!327477))))

(declare-fun lt!259396 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35675 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!569219 (= res!359235 (= lt!259391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259396 (select (store (arr!17129 a!3118) i!1132 k!1914) j!142) (array!35676 (store (arr!17129 a!3118) i!1132 k!1914) (size!17493 a!3118)) mask!3119)))))

(declare-fun lt!259393 () (_ BitVec 32))

(assert (=> b!569219 (= lt!259391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259393 (select (arr!17129 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569219 (= lt!259396 (toIndex!0 (select (store (arr!17129 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569219 (= lt!259393 (toIndex!0 (select (arr!17129 a!3118) j!142) mask!3119))))

(assert (= (and start!52152 res!359232) b!569214))

(assert (= (and b!569214 res!359230) b!569218))

(assert (= (and b!569218 res!359231) b!569215))

(assert (= (and b!569215 res!359236) b!569216))

(assert (= (and b!569216 res!359234) b!569213))

(assert (= (and b!569213 res!359237) b!569211))

(assert (= (and b!569211 res!359229) b!569212))

(assert (= (and b!569212 res!359233) b!569219))

(assert (= (and b!569219 res!359235) b!569217))

(declare-fun m!547849 () Bool)

(assert (=> b!569216 m!547849))

(declare-fun m!547851 () Bool)

(assert (=> b!569218 m!547851))

(assert (=> b!569218 m!547851))

(declare-fun m!547853 () Bool)

(assert (=> b!569218 m!547853))

(assert (=> b!569217 m!547851))

(declare-fun m!547855 () Bool)

(assert (=> b!569217 m!547855))

(declare-fun m!547857 () Bool)

(assert (=> b!569217 m!547857))

(declare-fun m!547859 () Bool)

(assert (=> b!569217 m!547859))

(assert (=> b!569217 m!547851))

(declare-fun m!547861 () Bool)

(assert (=> b!569217 m!547861))

(declare-fun m!547863 () Bool)

(assert (=> b!569215 m!547863))

(declare-fun m!547865 () Bool)

(assert (=> b!569212 m!547865))

(declare-fun m!547867 () Bool)

(assert (=> start!52152 m!547867))

(declare-fun m!547869 () Bool)

(assert (=> start!52152 m!547869))

(declare-fun m!547871 () Bool)

(assert (=> b!569213 m!547871))

(declare-fun m!547873 () Bool)

(assert (=> b!569211 m!547873))

(assert (=> b!569219 m!547851))

(declare-fun m!547875 () Bool)

(assert (=> b!569219 m!547875))

(declare-fun m!547877 () Bool)

(assert (=> b!569219 m!547877))

(assert (=> b!569219 m!547851))

(declare-fun m!547879 () Bool)

(assert (=> b!569219 m!547879))

(declare-fun m!547881 () Bool)

(assert (=> b!569219 m!547881))

(assert (=> b!569219 m!547877))

(declare-fun m!547883 () Bool)

(assert (=> b!569219 m!547883))

(assert (=> b!569219 m!547877))

(declare-fun m!547885 () Bool)

(assert (=> b!569219 m!547885))

(assert (=> b!569219 m!547851))

(push 1)

(assert (not b!569218))

