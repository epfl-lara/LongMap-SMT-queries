; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45810 () Bool)

(assert start!45810)

(declare-fun b!507075 () Bool)

(declare-fun e!296742 () Bool)

(declare-fun e!296741 () Bool)

(assert (=> b!507075 (= e!296742 e!296741)))

(declare-fun res!308183 () Bool)

(assert (=> b!507075 (=> res!308183 e!296741)))

(declare-fun lt!231421 () Bool)

(declare-datatypes ((SeekEntryResult!4132 0))(
  ( (MissingZero!4132 (index!18716 (_ BitVec 32))) (Found!4132 (index!18717 (_ BitVec 32))) (Intermediate!4132 (undefined!4944 Bool) (index!18718 (_ BitVec 32)) (x!47720 (_ BitVec 32))) (Undefined!4132) (MissingVacant!4132 (index!18719 (_ BitVec 32))) )
))
(declare-fun lt!231419 () SeekEntryResult!4132)

(assert (=> b!507075 (= res!308183 (or (and (not lt!231421) (undefined!4944 lt!231419)) (and (not lt!231421) (not (undefined!4944 lt!231419)))))))

(get-info :version)

(assert (=> b!507075 (= lt!231421 (not ((_ is Intermediate!4132) lt!231419)))))

(declare-fun e!296739 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!507076 () Bool)

(declare-datatypes ((array!32576 0))(
  ( (array!32577 (arr!15668 (Array (_ BitVec 32) (_ BitVec 64))) (size!16033 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32576)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32576 (_ BitVec 32)) SeekEntryResult!4132)

(assert (=> b!507076 (= e!296739 (= (seekEntryOrOpen!0 (select (arr!15668 a!3235) j!176) a!3235 mask!3524) (Found!4132 j!176)))))

(declare-fun b!507077 () Bool)

(declare-fun e!296740 () Bool)

(declare-fun e!296738 () Bool)

(assert (=> b!507077 (= e!296740 e!296738)))

(declare-fun res!308185 () Bool)

(assert (=> b!507077 (=> (not res!308185) (not e!296738))))

(declare-fun lt!231413 () SeekEntryResult!4132)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507077 (= res!308185 (or (= lt!231413 (MissingZero!4132 i!1204)) (= lt!231413 (MissingVacant!4132 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507077 (= lt!231413 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!308178 () Bool)

(assert (=> start!45810 (=> (not res!308178) (not e!296740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45810 (= res!308178 (validMask!0 mask!3524))))

(assert (=> start!45810 e!296740))

(assert (=> start!45810 true))

(declare-fun array_inv!11551 (array!32576) Bool)

(assert (=> start!45810 (array_inv!11551 a!3235)))

(declare-fun b!507078 () Bool)

(declare-fun res!308179 () Bool)

(assert (=> b!507078 (=> (not res!308179) (not e!296738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32576 (_ BitVec 32)) Bool)

(assert (=> b!507078 (= res!308179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507079 () Bool)

(assert (=> b!507079 (= e!296741 true)))

(declare-fun lt!231417 () SeekEntryResult!4132)

(declare-fun lt!231415 () array!32576)

(declare-fun lt!231414 () (_ BitVec 64))

(assert (=> b!507079 (= lt!231417 (seekEntryOrOpen!0 lt!231414 lt!231415 mask!3524))))

(assert (=> b!507079 false))

(declare-fun b!507080 () Bool)

(declare-fun res!308186 () Bool)

(assert (=> b!507080 (=> (not res!308186) (not e!296740))))

(assert (=> b!507080 (= res!308186 (and (= (size!16033 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16033 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16033 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507081 () Bool)

(declare-fun res!308184 () Bool)

(assert (=> b!507081 (=> (not res!308184) (not e!296740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507081 (= res!308184 (validKeyInArray!0 (select (arr!15668 a!3235) j!176)))))

(declare-fun b!507082 () Bool)

(assert (=> b!507082 (= e!296738 (not e!296742))))

(declare-fun res!308182 () Bool)

(assert (=> b!507082 (=> res!308182 e!296742)))

(declare-fun lt!231418 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32576 (_ BitVec 32)) SeekEntryResult!4132)

(assert (=> b!507082 (= res!308182 (= lt!231419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231418 lt!231414 lt!231415 mask!3524)))))

(declare-fun lt!231416 () (_ BitVec 32))

(assert (=> b!507082 (= lt!231419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231416 (select (arr!15668 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507082 (= lt!231418 (toIndex!0 lt!231414 mask!3524))))

(assert (=> b!507082 (= lt!231414 (select (store (arr!15668 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507082 (= lt!231416 (toIndex!0 (select (arr!15668 a!3235) j!176) mask!3524))))

(assert (=> b!507082 (= lt!231415 (array!32577 (store (arr!15668 a!3235) i!1204 k0!2280) (size!16033 a!3235)))))

(assert (=> b!507082 e!296739))

(declare-fun res!308181 () Bool)

(assert (=> b!507082 (=> (not res!308181) (not e!296739))))

(assert (=> b!507082 (= res!308181 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15538 0))(
  ( (Unit!15539) )
))
(declare-fun lt!231420 () Unit!15538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15538)

(assert (=> b!507082 (= lt!231420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507083 () Bool)

(declare-fun res!308176 () Bool)

(assert (=> b!507083 (=> (not res!308176) (not e!296740))))

(declare-fun arrayContainsKey!0 (array!32576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507083 (= res!308176 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507084 () Bool)

(declare-fun res!308177 () Bool)

(assert (=> b!507084 (=> (not res!308177) (not e!296738))))

(declare-datatypes ((List!9865 0))(
  ( (Nil!9862) (Cons!9861 (h!10738 (_ BitVec 64)) (t!16084 List!9865)) )
))
(declare-fun arrayNoDuplicates!0 (array!32576 (_ BitVec 32) List!9865) Bool)

(assert (=> b!507084 (= res!308177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9862))))

(declare-fun b!507085 () Bool)

(declare-fun res!308180 () Bool)

(assert (=> b!507085 (=> (not res!308180) (not e!296740))))

(assert (=> b!507085 (= res!308180 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45810 res!308178) b!507080))

(assert (= (and b!507080 res!308186) b!507081))

(assert (= (and b!507081 res!308184) b!507085))

(assert (= (and b!507085 res!308180) b!507083))

(assert (= (and b!507083 res!308176) b!507077))

(assert (= (and b!507077 res!308185) b!507078))

(assert (= (and b!507078 res!308179) b!507084))

(assert (= (and b!507084 res!308177) b!507082))

(assert (= (and b!507082 res!308181) b!507076))

(assert (= (and b!507082 (not res!308182)) b!507075))

(assert (= (and b!507075 (not res!308183)) b!507079))

(declare-fun m!487351 () Bool)

(assert (=> b!507079 m!487351))

(declare-fun m!487353 () Bool)

(assert (=> b!507078 m!487353))

(declare-fun m!487355 () Bool)

(assert (=> b!507083 m!487355))

(declare-fun m!487357 () Bool)

(assert (=> b!507077 m!487357))

(declare-fun m!487359 () Bool)

(assert (=> b!507076 m!487359))

(assert (=> b!507076 m!487359))

(declare-fun m!487361 () Bool)

(assert (=> b!507076 m!487361))

(declare-fun m!487363 () Bool)

(assert (=> start!45810 m!487363))

(declare-fun m!487365 () Bool)

(assert (=> start!45810 m!487365))

(assert (=> b!507081 m!487359))

(assert (=> b!507081 m!487359))

(declare-fun m!487367 () Bool)

(assert (=> b!507081 m!487367))

(declare-fun m!487369 () Bool)

(assert (=> b!507085 m!487369))

(declare-fun m!487371 () Bool)

(assert (=> b!507084 m!487371))

(declare-fun m!487373 () Bool)

(assert (=> b!507082 m!487373))

(declare-fun m!487375 () Bool)

(assert (=> b!507082 m!487375))

(assert (=> b!507082 m!487359))

(declare-fun m!487377 () Bool)

(assert (=> b!507082 m!487377))

(declare-fun m!487379 () Bool)

(assert (=> b!507082 m!487379))

(declare-fun m!487381 () Bool)

(assert (=> b!507082 m!487381))

(assert (=> b!507082 m!487359))

(declare-fun m!487383 () Bool)

(assert (=> b!507082 m!487383))

(assert (=> b!507082 m!487359))

(declare-fun m!487385 () Bool)

(assert (=> b!507082 m!487385))

(declare-fun m!487387 () Bool)

(assert (=> b!507082 m!487387))

(check-sat (not start!45810) (not b!507084) (not b!507079) (not b!507076) (not b!507083) (not b!507085) (not b!507082) (not b!507078) (not b!507077) (not b!507081))
(check-sat)
