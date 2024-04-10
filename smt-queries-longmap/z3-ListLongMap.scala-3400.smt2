; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46994 () Bool)

(assert start!46994)

(declare-fun b!518167 () Bool)

(declare-fun res!317192 () Bool)

(declare-fun e!302351 () Bool)

(assert (=> b!518167 (=> (not res!317192) (not e!302351))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33135 0))(
  ( (array!33136 (arr!15931 (Array (_ BitVec 32) (_ BitVec 64))) (size!16295 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33135)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518167 (= res!317192 (and (= (size!16295 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16295 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16295 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518168 () Bool)

(declare-fun res!317189 () Bool)

(assert (=> b!518168 (=> (not res!317189) (not e!302351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518168 (= res!317189 (validKeyInArray!0 (select (arr!15931 a!3235) j!176)))))

(declare-fun b!518169 () Bool)

(declare-fun e!302350 () Bool)

(declare-fun e!302349 () Bool)

(assert (=> b!518169 (= e!302350 (not e!302349))))

(declare-fun res!317187 () Bool)

(assert (=> b!518169 (=> res!317187 e!302349)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!237192 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4398 0))(
  ( (MissingZero!4398 (index!19780 (_ BitVec 32))) (Found!4398 (index!19781 (_ BitVec 32))) (Intermediate!4398 (undefined!5210 Bool) (index!19782 (_ BitVec 32)) (x!48747 (_ BitVec 32))) (Undefined!4398) (MissingVacant!4398 (index!19783 (_ BitVec 32))) )
))
(declare-fun lt!237195 () SeekEntryResult!4398)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33135 (_ BitVec 32)) SeekEntryResult!4398)

(assert (=> b!518169 (= res!317187 (= lt!237195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237192 (select (store (arr!15931 a!3235) i!1204 k0!2280) j!176) (array!33136 (store (arr!15931 a!3235) i!1204 k0!2280) (size!16295 a!3235)) mask!3524)))))

(declare-fun lt!237196 () (_ BitVec 32))

(assert (=> b!518169 (= lt!237195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237196 (select (arr!15931 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518169 (= lt!237192 (toIndex!0 (select (store (arr!15931 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!518169 (= lt!237196 (toIndex!0 (select (arr!15931 a!3235) j!176) mask!3524))))

(declare-fun e!302352 () Bool)

(assert (=> b!518169 e!302352))

(declare-fun res!317184 () Bool)

(assert (=> b!518169 (=> (not res!317184) (not e!302352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33135 (_ BitVec 32)) Bool)

(assert (=> b!518169 (= res!317184 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16054 0))(
  ( (Unit!16055) )
))
(declare-fun lt!237193 () Unit!16054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16054)

(assert (=> b!518169 (= lt!237193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518170 () Bool)

(assert (=> b!518170 (= e!302351 e!302350)))

(declare-fun res!317190 () Bool)

(assert (=> b!518170 (=> (not res!317190) (not e!302350))))

(declare-fun lt!237194 () SeekEntryResult!4398)

(assert (=> b!518170 (= res!317190 (or (= lt!237194 (MissingZero!4398 i!1204)) (= lt!237194 (MissingVacant!4398 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33135 (_ BitVec 32)) SeekEntryResult!4398)

(assert (=> b!518170 (= lt!237194 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518171 () Bool)

(assert (=> b!518171 (= e!302352 (= (seekEntryOrOpen!0 (select (arr!15931 a!3235) j!176) a!3235 mask!3524) (Found!4398 j!176)))))

(declare-fun b!518172 () Bool)

(declare-fun res!317185 () Bool)

(assert (=> b!518172 (=> (not res!317185) (not e!302351))))

(assert (=> b!518172 (= res!317185 (validKeyInArray!0 k0!2280))))

(declare-fun b!518173 () Bool)

(assert (=> b!518173 (= e!302349 true)))

(assert (=> b!518173 (and (bvslt (x!48747 lt!237195) #b01111111111111111111111111111110) (or (= (select (arr!15931 a!3235) (index!19782 lt!237195)) (select (arr!15931 a!3235) j!176)) (= (select (arr!15931 a!3235) (index!19782 lt!237195)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15931 a!3235) (index!19782 lt!237195)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518174 () Bool)

(declare-fun res!317183 () Bool)

(assert (=> b!518174 (=> (not res!317183) (not e!302351))))

(declare-fun arrayContainsKey!0 (array!33135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518174 (= res!317183 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518175 () Bool)

(declare-fun res!317191 () Bool)

(assert (=> b!518175 (=> res!317191 e!302349)))

(get-info :version)

(assert (=> b!518175 (= res!317191 (or (undefined!5210 lt!237195) (not ((_ is Intermediate!4398) lt!237195))))))

(declare-fun b!518176 () Bool)

(declare-fun res!317186 () Bool)

(assert (=> b!518176 (=> (not res!317186) (not e!302350))))

(assert (=> b!518176 (= res!317186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518177 () Bool)

(declare-fun res!317182 () Bool)

(assert (=> b!518177 (=> (not res!317182) (not e!302350))))

(declare-datatypes ((List!10089 0))(
  ( (Nil!10086) (Cons!10085 (h!10992 (_ BitVec 64)) (t!16317 List!10089)) )
))
(declare-fun arrayNoDuplicates!0 (array!33135 (_ BitVec 32) List!10089) Bool)

(assert (=> b!518177 (= res!317182 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10086))))

(declare-fun res!317188 () Bool)

(assert (=> start!46994 (=> (not res!317188) (not e!302351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46994 (= res!317188 (validMask!0 mask!3524))))

(assert (=> start!46994 e!302351))

(assert (=> start!46994 true))

(declare-fun array_inv!11727 (array!33135) Bool)

(assert (=> start!46994 (array_inv!11727 a!3235)))

(assert (= (and start!46994 res!317188) b!518167))

(assert (= (and b!518167 res!317192) b!518168))

(assert (= (and b!518168 res!317189) b!518172))

(assert (= (and b!518172 res!317185) b!518174))

(assert (= (and b!518174 res!317183) b!518170))

(assert (= (and b!518170 res!317190) b!518176))

(assert (= (and b!518176 res!317186) b!518177))

(assert (= (and b!518177 res!317182) b!518169))

(assert (= (and b!518169 res!317184) b!518171))

(assert (= (and b!518169 (not res!317187)) b!518175))

(assert (= (and b!518175 (not res!317191)) b!518173))

(declare-fun m!499523 () Bool)

(assert (=> b!518176 m!499523))

(declare-fun m!499525 () Bool)

(assert (=> b!518170 m!499525))

(declare-fun m!499527 () Bool)

(assert (=> b!518174 m!499527))

(declare-fun m!499529 () Bool)

(assert (=> b!518169 m!499529))

(declare-fun m!499531 () Bool)

(assert (=> b!518169 m!499531))

(declare-fun m!499533 () Bool)

(assert (=> b!518169 m!499533))

(declare-fun m!499535 () Bool)

(assert (=> b!518169 m!499535))

(declare-fun m!499537 () Bool)

(assert (=> b!518169 m!499537))

(assert (=> b!518169 m!499529))

(declare-fun m!499539 () Bool)

(assert (=> b!518169 m!499539))

(assert (=> b!518169 m!499529))

(declare-fun m!499541 () Bool)

(assert (=> b!518169 m!499541))

(assert (=> b!518169 m!499537))

(declare-fun m!499543 () Bool)

(assert (=> b!518169 m!499543))

(assert (=> b!518169 m!499537))

(declare-fun m!499545 () Bool)

(assert (=> b!518169 m!499545))

(assert (=> b!518171 m!499529))

(assert (=> b!518171 m!499529))

(declare-fun m!499547 () Bool)

(assert (=> b!518171 m!499547))

(declare-fun m!499549 () Bool)

(assert (=> b!518172 m!499549))

(declare-fun m!499551 () Bool)

(assert (=> b!518173 m!499551))

(assert (=> b!518173 m!499529))

(declare-fun m!499553 () Bool)

(assert (=> start!46994 m!499553))

(declare-fun m!499555 () Bool)

(assert (=> start!46994 m!499555))

(assert (=> b!518168 m!499529))

(assert (=> b!518168 m!499529))

(declare-fun m!499557 () Bool)

(assert (=> b!518168 m!499557))

(declare-fun m!499559 () Bool)

(assert (=> b!518177 m!499559))

(check-sat (not b!518168) (not start!46994) (not b!518177) (not b!518176) (not b!518174) (not b!518171) (not b!518170) (not b!518169) (not b!518172))
(check-sat)
