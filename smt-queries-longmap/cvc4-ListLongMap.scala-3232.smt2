; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45202 () Bool)

(assert start!45202)

(declare-fun b!496156 () Bool)

(declare-fun res!298546 () Bool)

(declare-fun e!290993 () Bool)

(assert (=> b!496156 (=> (not res!298546) (not e!290993))))

(declare-datatypes ((array!32090 0))(
  ( (array!32091 (arr!15428 (Array (_ BitVec 32) (_ BitVec 64))) (size!15792 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32090)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496156 (= res!298546 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496157 () Bool)

(declare-fun res!298544 () Bool)

(declare-fun e!290997 () Bool)

(assert (=> b!496157 (=> res!298544 e!290997)))

(declare-datatypes ((SeekEntryResult!3895 0))(
  ( (MissingZero!3895 (index!17759 (_ BitVec 32))) (Found!3895 (index!17760 (_ BitVec 32))) (Intermediate!3895 (undefined!4707 Bool) (index!17761 (_ BitVec 32)) (x!46819 (_ BitVec 32))) (Undefined!3895) (MissingVacant!3895 (index!17762 (_ BitVec 32))) )
))
(declare-fun lt!224615 () SeekEntryResult!3895)

(assert (=> b!496157 (= res!298544 (or (undefined!4707 lt!224615) (not (is-Intermediate!3895 lt!224615))))))

(declare-fun b!496158 () Bool)

(declare-fun res!298543 () Bool)

(assert (=> b!496158 (=> (not res!298543) (not e!290993))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496158 (= res!298543 (and (= (size!15792 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15792 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15792 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496159 () Bool)

(declare-fun e!290994 () Bool)

(assert (=> b!496159 (= e!290993 e!290994)))

(declare-fun res!298551 () Bool)

(assert (=> b!496159 (=> (not res!298551) (not e!290994))))

(declare-fun lt!224617 () SeekEntryResult!3895)

(assert (=> b!496159 (= res!298551 (or (= lt!224617 (MissingZero!3895 i!1204)) (= lt!224617 (MissingVacant!3895 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32090 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!496159 (= lt!224617 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496160 () Bool)

(declare-fun res!298545 () Bool)

(assert (=> b!496160 (=> (not res!298545) (not e!290993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496160 (= res!298545 (validKeyInArray!0 k!2280))))

(declare-fun b!496161 () Bool)

(declare-fun res!298552 () Bool)

(assert (=> b!496161 (=> (not res!298552) (not e!290994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32090 (_ BitVec 32)) Bool)

(assert (=> b!496161 (= res!298552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496162 () Bool)

(declare-fun res!298550 () Bool)

(assert (=> b!496162 (=> (not res!298550) (not e!290993))))

(assert (=> b!496162 (= res!298550 (validKeyInArray!0 (select (arr!15428 a!3235) j!176)))))

(declare-fun e!290995 () Bool)

(declare-fun b!496164 () Bool)

(assert (=> b!496164 (= e!290995 (= (seekEntryOrOpen!0 (select (arr!15428 a!3235) j!176) a!3235 mask!3524) (Found!3895 j!176)))))

(declare-fun b!496165 () Bool)

(declare-fun res!298547 () Bool)

(assert (=> b!496165 (=> (not res!298547) (not e!290994))))

(declare-datatypes ((List!9586 0))(
  ( (Nil!9583) (Cons!9582 (h!10453 (_ BitVec 64)) (t!15814 List!9586)) )
))
(declare-fun arrayNoDuplicates!0 (array!32090 (_ BitVec 32) List!9586) Bool)

(assert (=> b!496165 (= res!298547 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9583))))

(declare-fun b!496166 () Bool)

(assert (=> b!496166 (= e!290997 true)))

(assert (=> b!496166 (and (bvslt (x!46819 lt!224615) #b01111111111111111111111111111110) (or (= (select (arr!15428 a!3235) (index!17761 lt!224615)) (select (arr!15428 a!3235) j!176)) (= (select (arr!15428 a!3235) (index!17761 lt!224615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15428 a!3235) (index!17761 lt!224615)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496163 () Bool)

(assert (=> b!496163 (= e!290994 (not e!290997))))

(declare-fun res!298553 () Bool)

(assert (=> b!496163 (=> res!298553 e!290997)))

(declare-fun lt!224613 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32090 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!496163 (= res!298553 (= lt!224615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224613 (select (store (arr!15428 a!3235) i!1204 k!2280) j!176) (array!32091 (store (arr!15428 a!3235) i!1204 k!2280) (size!15792 a!3235)) mask!3524)))))

(declare-fun lt!224616 () (_ BitVec 32))

(assert (=> b!496163 (= lt!224615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224616 (select (arr!15428 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496163 (= lt!224613 (toIndex!0 (select (store (arr!15428 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496163 (= lt!224616 (toIndex!0 (select (arr!15428 a!3235) j!176) mask!3524))))

(assert (=> b!496163 e!290995))

(declare-fun res!298549 () Bool)

(assert (=> b!496163 (=> (not res!298549) (not e!290995))))

(assert (=> b!496163 (= res!298549 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14736 0))(
  ( (Unit!14737) )
))
(declare-fun lt!224614 () Unit!14736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14736)

(assert (=> b!496163 (= lt!224614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!298548 () Bool)

(assert (=> start!45202 (=> (not res!298548) (not e!290993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45202 (= res!298548 (validMask!0 mask!3524))))

(assert (=> start!45202 e!290993))

(assert (=> start!45202 true))

(declare-fun array_inv!11224 (array!32090) Bool)

(assert (=> start!45202 (array_inv!11224 a!3235)))

(assert (= (and start!45202 res!298548) b!496158))

(assert (= (and b!496158 res!298543) b!496162))

(assert (= (and b!496162 res!298550) b!496160))

(assert (= (and b!496160 res!298545) b!496156))

(assert (= (and b!496156 res!298546) b!496159))

(assert (= (and b!496159 res!298551) b!496161))

(assert (= (and b!496161 res!298552) b!496165))

(assert (= (and b!496165 res!298547) b!496163))

(assert (= (and b!496163 res!298549) b!496164))

(assert (= (and b!496163 (not res!298553)) b!496157))

(assert (= (and b!496157 (not res!298544)) b!496166))

(declare-fun m!477349 () Bool)

(assert (=> start!45202 m!477349))

(declare-fun m!477351 () Bool)

(assert (=> start!45202 m!477351))

(declare-fun m!477353 () Bool)

(assert (=> b!496162 m!477353))

(assert (=> b!496162 m!477353))

(declare-fun m!477355 () Bool)

(assert (=> b!496162 m!477355))

(declare-fun m!477357 () Bool)

(assert (=> b!496163 m!477357))

(assert (=> b!496163 m!477353))

(declare-fun m!477359 () Bool)

(assert (=> b!496163 m!477359))

(declare-fun m!477361 () Bool)

(assert (=> b!496163 m!477361))

(declare-fun m!477363 () Bool)

(assert (=> b!496163 m!477363))

(assert (=> b!496163 m!477363))

(declare-fun m!477365 () Bool)

(assert (=> b!496163 m!477365))

(assert (=> b!496163 m!477353))

(declare-fun m!477367 () Bool)

(assert (=> b!496163 m!477367))

(assert (=> b!496163 m!477353))

(declare-fun m!477369 () Bool)

(assert (=> b!496163 m!477369))

(assert (=> b!496163 m!477363))

(declare-fun m!477371 () Bool)

(assert (=> b!496163 m!477371))

(declare-fun m!477373 () Bool)

(assert (=> b!496166 m!477373))

(assert (=> b!496166 m!477353))

(declare-fun m!477375 () Bool)

(assert (=> b!496160 m!477375))

(assert (=> b!496164 m!477353))

(assert (=> b!496164 m!477353))

(declare-fun m!477377 () Bool)

(assert (=> b!496164 m!477377))

(declare-fun m!477379 () Bool)

(assert (=> b!496161 m!477379))

(declare-fun m!477381 () Bool)

(assert (=> b!496156 m!477381))

(declare-fun m!477383 () Bool)

(assert (=> b!496165 m!477383))

(declare-fun m!477385 () Bool)

(assert (=> b!496159 m!477385))

(push 1)

(assert (not b!496164))

(assert (not b!496159))

(assert (not b!496156))

(assert (not b!496162))

(assert (not start!45202))

(assert (not b!496161))

(assert (not b!496160))

(assert (not b!496165))

(assert (not b!496163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

