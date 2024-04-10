; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44108 () Bool)

(assert start!44108)

(declare-fun b!486032 () Bool)

(declare-fun e!286095 () Bool)

(declare-datatypes ((array!31476 0))(
  ( (array!31477 (arr!15136 (Array (_ BitVec 32) (_ BitVec 64))) (size!15500 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31476)

(assert (=> b!486032 (= e!286095 (bvsgt #b00000000000000000000000000000000 (size!15500 a!3235)))))

(declare-fun b!486033 () Bool)

(declare-fun e!286094 () Bool)

(assert (=> b!486033 (= e!286094 e!286095)))

(declare-fun res!289637 () Bool)

(assert (=> b!486033 (=> (not res!289637) (not e!286095))))

(declare-datatypes ((SeekEntryResult!3603 0))(
  ( (MissingZero!3603 (index!16591 (_ BitVec 32))) (Found!3603 (index!16592 (_ BitVec 32))) (Intermediate!3603 (undefined!4415 Bool) (index!16593 (_ BitVec 32)) (x!45727 (_ BitVec 32))) (Undefined!3603) (MissingVacant!3603 (index!16594 (_ BitVec 32))) )
))
(declare-fun lt!219616 () SeekEntryResult!3603)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486033 (= res!289637 (or (= lt!219616 (MissingZero!3603 i!1204)) (= lt!219616 (MissingVacant!3603 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31476 (_ BitVec 32)) SeekEntryResult!3603)

(assert (=> b!486033 (= lt!219616 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486034 () Bool)

(declare-fun res!289639 () Bool)

(assert (=> b!486034 (=> (not res!289639) (not e!286095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31476 (_ BitVec 32)) Bool)

(assert (=> b!486034 (= res!289639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486035 () Bool)

(declare-fun res!289640 () Bool)

(assert (=> b!486035 (=> (not res!289640) (not e!286094))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486035 (= res!289640 (validKeyInArray!0 (select (arr!15136 a!3235) j!176)))))

(declare-fun b!486036 () Bool)

(declare-fun res!289638 () Bool)

(assert (=> b!486036 (=> (not res!289638) (not e!286094))))

(assert (=> b!486036 (= res!289638 (and (= (size!15500 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15500 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15500 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289635 () Bool)

(assert (=> start!44108 (=> (not res!289635) (not e!286094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44108 (= res!289635 (validMask!0 mask!3524))))

(assert (=> start!44108 e!286094))

(assert (=> start!44108 true))

(declare-fun array_inv!10932 (array!31476) Bool)

(assert (=> start!44108 (array_inv!10932 a!3235)))

(declare-fun b!486037 () Bool)

(declare-fun res!289636 () Bool)

(assert (=> b!486037 (=> (not res!289636) (not e!286094))))

(declare-fun arrayContainsKey!0 (array!31476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486037 (= res!289636 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486038 () Bool)

(declare-fun res!289634 () Bool)

(assert (=> b!486038 (=> (not res!289634) (not e!286094))))

(assert (=> b!486038 (= res!289634 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44108 res!289635) b!486036))

(assert (= (and b!486036 res!289638) b!486035))

(assert (= (and b!486035 res!289640) b!486038))

(assert (= (and b!486038 res!289634) b!486037))

(assert (= (and b!486037 res!289636) b!486033))

(assert (= (and b!486033 res!289637) b!486034))

(assert (= (and b!486034 res!289639) b!486032))

(declare-fun m!466081 () Bool)

(assert (=> b!486034 m!466081))

(declare-fun m!466083 () Bool)

(assert (=> b!486038 m!466083))

(declare-fun m!466085 () Bool)

(assert (=> b!486035 m!466085))

(assert (=> b!486035 m!466085))

(declare-fun m!466087 () Bool)

(assert (=> b!486035 m!466087))

(declare-fun m!466089 () Bool)

(assert (=> b!486033 m!466089))

(declare-fun m!466091 () Bool)

(assert (=> start!44108 m!466091))

(declare-fun m!466093 () Bool)

(assert (=> start!44108 m!466093))

(declare-fun m!466095 () Bool)

(assert (=> b!486037 m!466095))

(check-sat (not b!486033) (not b!486035) (not start!44108) (not b!486034) (not b!486038) (not b!486037))
(check-sat)
