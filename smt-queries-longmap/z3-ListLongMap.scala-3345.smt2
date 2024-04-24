; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46052 () Bool)

(assert start!46052)

(declare-fun b!510074 () Bool)

(declare-fun res!310974 () Bool)

(declare-fun e!298194 () Bool)

(assert (=> b!510074 (=> (not res!310974) (not e!298194))))

(declare-datatypes ((array!32764 0))(
  ( (array!32765 (arr!15760 (Array (_ BitVec 32) (_ BitVec 64))) (size!16124 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32764)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510074 (= res!310974 (validKeyInArray!0 (select (arr!15760 a!3235) j!176)))))

(declare-fun b!510075 () Bool)

(declare-fun e!298193 () Bool)

(assert (=> b!510075 (= e!298193 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233193 () array!32764)

(declare-datatypes ((SeekEntryResult!4183 0))(
  ( (MissingZero!4183 (index!18920 (_ BitVec 32))) (Found!4183 (index!18921 (_ BitVec 32))) (Intermediate!4183 (undefined!4995 Bool) (index!18922 (_ BitVec 32)) (x!48029 (_ BitVec 32))) (Undefined!4183) (MissingVacant!4183 (index!18923 (_ BitVec 32))) )
))
(declare-fun lt!233192 () SeekEntryResult!4183)

(declare-fun lt!233194 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32764 (_ BitVec 32)) SeekEntryResult!4183)

(assert (=> b!510075 (= lt!233192 (seekEntryOrOpen!0 lt!233194 lt!233193 mask!3524))))

(declare-datatypes ((Unit!15685 0))(
  ( (Unit!15686) )
))
(declare-fun lt!233196 () Unit!15685)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32764 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15685)

(assert (=> b!510075 (= lt!233196 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510076 () Bool)

(declare-fun res!310973 () Bool)

(assert (=> b!510076 (=> (not res!310973) (not e!298194))))

(assert (=> b!510076 (= res!310973 (validKeyInArray!0 k0!2280))))

(declare-fun b!510077 () Bool)

(declare-fun e!298192 () Bool)

(assert (=> b!510077 (= e!298192 (not e!298193))))

(declare-fun res!310981 () Bool)

(assert (=> b!510077 (=> res!310981 e!298193)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32764 (_ BitVec 32)) SeekEntryResult!4183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510077 (= res!310981 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15760 a!3235) j!176) mask!3524) (select (arr!15760 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233194 mask!3524) lt!233194 lt!233193 mask!3524))))))

(assert (=> b!510077 (= lt!233194 (select (store (arr!15760 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510077 (= lt!233193 (array!32765 (store (arr!15760 a!3235) i!1204 k0!2280) (size!16124 a!3235)))))

(assert (=> b!510077 (= lt!233192 (Found!4183 j!176))))

(assert (=> b!510077 (= lt!233192 (seekEntryOrOpen!0 (select (arr!15760 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32764 (_ BitVec 32)) Bool)

(assert (=> b!510077 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233197 () Unit!15685)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15685)

(assert (=> b!510077 (= lt!233197 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510078 () Bool)

(declare-fun res!310977 () Bool)

(assert (=> b!510078 (=> (not res!310977) (not e!298192))))

(assert (=> b!510078 (= res!310977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510079 () Bool)

(declare-fun res!310978 () Bool)

(assert (=> b!510079 (=> (not res!310978) (not e!298194))))

(assert (=> b!510079 (= res!310978 (and (= (size!16124 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16124 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16124 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510080 () Bool)

(assert (=> b!510080 (= e!298194 e!298192)))

(declare-fun res!310975 () Bool)

(assert (=> b!510080 (=> (not res!310975) (not e!298192))))

(declare-fun lt!233195 () SeekEntryResult!4183)

(assert (=> b!510080 (= res!310975 (or (= lt!233195 (MissingZero!4183 i!1204)) (= lt!233195 (MissingVacant!4183 i!1204))))))

(assert (=> b!510080 (= lt!233195 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!310976 () Bool)

(assert (=> start!46052 (=> (not res!310976) (not e!298194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46052 (= res!310976 (validMask!0 mask!3524))))

(assert (=> start!46052 e!298194))

(assert (=> start!46052 true))

(declare-fun array_inv!11619 (array!32764) Bool)

(assert (=> start!46052 (array_inv!11619 a!3235)))

(declare-fun b!510081 () Bool)

(declare-fun res!310979 () Bool)

(assert (=> b!510081 (=> (not res!310979) (not e!298194))))

(declare-fun arrayContainsKey!0 (array!32764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510081 (= res!310979 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510082 () Bool)

(declare-fun res!310980 () Bool)

(assert (=> b!510082 (=> (not res!310980) (not e!298192))))

(declare-datatypes ((List!9825 0))(
  ( (Nil!9822) (Cons!9821 (h!10698 (_ BitVec 64)) (t!16045 List!9825)) )
))
(declare-fun arrayNoDuplicates!0 (array!32764 (_ BitVec 32) List!9825) Bool)

(assert (=> b!510082 (= res!310980 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9822))))

(assert (= (and start!46052 res!310976) b!510079))

(assert (= (and b!510079 res!310978) b!510074))

(assert (= (and b!510074 res!310974) b!510076))

(assert (= (and b!510076 res!310973) b!510081))

(assert (= (and b!510081 res!310979) b!510080))

(assert (= (and b!510080 res!310975) b!510078))

(assert (= (and b!510078 res!310977) b!510082))

(assert (= (and b!510082 res!310980) b!510077))

(assert (= (and b!510077 (not res!310981)) b!510075))

(declare-fun m!491437 () Bool)

(assert (=> b!510077 m!491437))

(declare-fun m!491439 () Bool)

(assert (=> b!510077 m!491439))

(assert (=> b!510077 m!491437))

(declare-fun m!491441 () Bool)

(assert (=> b!510077 m!491441))

(declare-fun m!491443 () Bool)

(assert (=> b!510077 m!491443))

(declare-fun m!491445 () Bool)

(assert (=> b!510077 m!491445))

(declare-fun m!491447 () Bool)

(assert (=> b!510077 m!491447))

(declare-fun m!491449 () Bool)

(assert (=> b!510077 m!491449))

(declare-fun m!491451 () Bool)

(assert (=> b!510077 m!491451))

(assert (=> b!510077 m!491449))

(assert (=> b!510077 m!491447))

(assert (=> b!510077 m!491449))

(declare-fun m!491453 () Bool)

(assert (=> b!510077 m!491453))

(assert (=> b!510077 m!491449))

(declare-fun m!491455 () Bool)

(assert (=> b!510077 m!491455))

(declare-fun m!491457 () Bool)

(assert (=> b!510080 m!491457))

(declare-fun m!491459 () Bool)

(assert (=> b!510082 m!491459))

(declare-fun m!491461 () Bool)

(assert (=> b!510076 m!491461))

(declare-fun m!491463 () Bool)

(assert (=> b!510081 m!491463))

(assert (=> b!510074 m!491449))

(assert (=> b!510074 m!491449))

(declare-fun m!491465 () Bool)

(assert (=> b!510074 m!491465))

(declare-fun m!491467 () Bool)

(assert (=> start!46052 m!491467))

(declare-fun m!491469 () Bool)

(assert (=> start!46052 m!491469))

(declare-fun m!491471 () Bool)

(assert (=> b!510075 m!491471))

(declare-fun m!491473 () Bool)

(assert (=> b!510075 m!491473))

(declare-fun m!491475 () Bool)

(assert (=> b!510078 m!491475))

(check-sat (not b!510082) (not start!46052) (not b!510074) (not b!510075) (not b!510080) (not b!510081) (not b!510076) (not b!510078) (not b!510077))
(check-sat)
