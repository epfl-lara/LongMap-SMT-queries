; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30226 () Bool)

(assert start!30226)

(declare-fun b!302400 () Bool)

(declare-fun e!190653 () Bool)

(assert (=> b!302400 (= e!190653 false)))

(declare-datatypes ((array!15332 0))(
  ( (array!15333 (arr!7254 (Array (_ BitVec 32) (_ BitVec 64))) (size!7606 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15332)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2394 0))(
  ( (MissingZero!2394 (index!11752 (_ BitVec 32))) (Found!2394 (index!11753 (_ BitVec 32))) (Intermediate!2394 (undefined!3206 Bool) (index!11754 (_ BitVec 32)) (x!30027 (_ BitVec 32))) (Undefined!2394) (MissingVacant!2394 (index!11755 (_ BitVec 32))) )
))
(declare-fun lt!150084 () SeekEntryResult!2394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15332 (_ BitVec 32)) SeekEntryResult!2394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302400 (= lt!150084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!302401 () Bool)

(declare-fun res!159889 () Bool)

(assert (=> b!302401 (=> (not res!159889) (not e!190653))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302401 (= res!159889 (and (= (size!7606 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7606 a!3293))))))

(declare-fun res!159891 () Bool)

(assert (=> start!30226 (=> (not res!159891) (not e!190653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30226 (= res!159891 (validMask!0 mask!3709))))

(assert (=> start!30226 e!190653))

(assert (=> start!30226 true))

(declare-fun array_inv!5217 (array!15332) Bool)

(assert (=> start!30226 (array_inv!5217 a!3293)))

(declare-fun b!302402 () Bool)

(declare-fun res!159888 () Bool)

(assert (=> b!302402 (=> (not res!159888) (not e!190653))))

(declare-fun arrayContainsKey!0 (array!15332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302402 (= res!159888 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302403 () Bool)

(declare-fun res!159886 () Bool)

(assert (=> b!302403 (=> (not res!159886) (not e!190653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302403 (= res!159886 (validKeyInArray!0 k0!2441))))

(declare-fun b!302404 () Bool)

(declare-fun res!159890 () Bool)

(assert (=> b!302404 (=> (not res!159890) (not e!190653))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15332 (_ BitVec 32)) SeekEntryResult!2394)

(assert (=> b!302404 (= res!159890 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2394 i!1240)))))

(declare-fun b!302405 () Bool)

(declare-fun res!159887 () Bool)

(assert (=> b!302405 (=> (not res!159887) (not e!190653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15332 (_ BitVec 32)) Bool)

(assert (=> b!302405 (= res!159887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30226 res!159891) b!302401))

(assert (= (and b!302401 res!159889) b!302403))

(assert (= (and b!302403 res!159886) b!302402))

(assert (= (and b!302402 res!159888) b!302404))

(assert (= (and b!302404 res!159890) b!302405))

(assert (= (and b!302405 res!159887) b!302400))

(declare-fun m!313935 () Bool)

(assert (=> b!302403 m!313935))

(declare-fun m!313937 () Bool)

(assert (=> start!30226 m!313937))

(declare-fun m!313939 () Bool)

(assert (=> start!30226 m!313939))

(declare-fun m!313941 () Bool)

(assert (=> b!302402 m!313941))

(declare-fun m!313943 () Bool)

(assert (=> b!302405 m!313943))

(declare-fun m!313945 () Bool)

(assert (=> b!302404 m!313945))

(declare-fun m!313947 () Bool)

(assert (=> b!302400 m!313947))

(assert (=> b!302400 m!313947))

(declare-fun m!313949 () Bool)

(assert (=> b!302400 m!313949))

(check-sat (not b!302400) (not b!302404) (not start!30226) (not b!302403) (not b!302402) (not b!302405))
(check-sat)
