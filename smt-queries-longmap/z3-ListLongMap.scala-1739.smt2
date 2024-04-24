; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31926 () Bool)

(assert start!31926)

(declare-fun b!319177 () Bool)

(declare-fun e!198258 () Bool)

(declare-fun e!198256 () Bool)

(assert (=> b!319177 (= e!198258 (not e!198256))))

(declare-fun res!173617 () Bool)

(assert (=> b!319177 (=> res!173617 e!198256)))

(declare-datatypes ((array!16259 0))(
  ( (array!16260 (arr!7693 (Array (_ BitVec 32) (_ BitVec 64))) (size!8045 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16259)

(declare-fun lt!155752 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2798 0))(
  ( (MissingZero!2798 (index!13368 (_ BitVec 32))) (Found!2798 (index!13369 (_ BitVec 32))) (Intermediate!2798 (undefined!3610 Bool) (index!13370 (_ BitVec 32)) (x!31733 (_ BitVec 32))) (Undefined!2798) (MissingVacant!2798 (index!13371 (_ BitVec 32))) )
))
(declare-fun lt!155754 () SeekEntryResult!2798)

(declare-fun lt!155751 () SeekEntryResult!2798)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!319177 (= res!173617 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155752 #b00000000000000000000000000000000) (bvsge lt!155752 (size!8045 a!3293)) (not (= lt!155751 lt!155754))))))

(declare-fun lt!155757 () SeekEntryResult!2798)

(declare-fun lt!155753 () SeekEntryResult!2798)

(assert (=> b!319177 (= lt!155757 lt!155753)))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!155750 () array!16259)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16259 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!319177 (= lt!155753 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155752 k0!2441 lt!155750 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319177 (= lt!155757 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155750 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!319177 (= lt!155750 (array!16260 (store (arr!7693 a!3293) i!1240 k0!2441) (size!8045 a!3293)))))

(declare-fun lt!155755 () SeekEntryResult!2798)

(assert (=> b!319177 (= lt!155755 lt!155751)))

(assert (=> b!319177 (= lt!155751 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155752 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319177 (= lt!155752 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!319178 () Bool)

(declare-fun res!173613 () Bool)

(declare-fun e!198255 () Bool)

(assert (=> b!319178 (=> (not res!173613) (not e!198255))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16259 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!319178 (= res!173613 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2798 i!1240)))))

(declare-fun b!319179 () Bool)

(declare-fun res!173615 () Bool)

(assert (=> b!319179 (=> (not res!173615) (not e!198255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319179 (= res!173615 (validKeyInArray!0 k0!2441))))

(declare-fun b!319180 () Bool)

(declare-fun e!198254 () Bool)

(assert (=> b!319180 (= e!198255 e!198254)))

(declare-fun res!173618 () Bool)

(assert (=> b!319180 (=> (not res!173618) (not e!198254))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319180 (= res!173618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155754))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!319180 (= lt!155754 (Intermediate!2798 false resIndex!52 resX!52))))

(declare-fun b!319181 () Bool)

(declare-fun res!173611 () Bool)

(assert (=> b!319181 (=> (not res!173611) (not e!198255))))

(declare-fun arrayContainsKey!0 (array!16259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319181 (= res!173611 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319182 () Bool)

(assert (=> b!319182 (= e!198256 (= lt!155757 lt!155755))))

(assert (=> b!319182 (= lt!155753 lt!155751)))

(declare-datatypes ((Unit!9768 0))(
  ( (Unit!9769) )
))
(declare-fun lt!155756 () Unit!9768)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9768)

(assert (=> b!319182 (= lt!155756 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155752 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319183 () Bool)

(declare-fun res!173612 () Bool)

(assert (=> b!319183 (=> (not res!173612) (not e!198255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16259 (_ BitVec 32)) Bool)

(assert (=> b!319183 (= res!173612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319184 () Bool)

(assert (=> b!319184 (= e!198254 e!198258)))

(declare-fun res!173610 () Bool)

(assert (=> b!319184 (=> (not res!173610) (not e!198258))))

(assert (=> b!319184 (= res!173610 (and (= lt!155755 lt!155754) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7693 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319184 (= lt!155755 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!319185 () Bool)

(declare-fun res!173619 () Bool)

(assert (=> b!319185 (=> (not res!173619) (not e!198254))))

(assert (=> b!319185 (= res!173619 (and (= (select (arr!7693 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8045 a!3293))))))

(declare-fun res!173614 () Bool)

(assert (=> start!31926 (=> (not res!173614) (not e!198255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31926 (= res!173614 (validMask!0 mask!3709))))

(assert (=> start!31926 e!198255))

(declare-fun array_inv!5643 (array!16259) Bool)

(assert (=> start!31926 (array_inv!5643 a!3293)))

(assert (=> start!31926 true))

(declare-fun b!319176 () Bool)

(declare-fun res!173616 () Bool)

(assert (=> b!319176 (=> (not res!173616) (not e!198255))))

(assert (=> b!319176 (= res!173616 (and (= (size!8045 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8045 a!3293))))))

(assert (= (and start!31926 res!173614) b!319176))

(assert (= (and b!319176 res!173616) b!319179))

(assert (= (and b!319179 res!173615) b!319181))

(assert (= (and b!319181 res!173611) b!319178))

(assert (= (and b!319178 res!173613) b!319183))

(assert (= (and b!319183 res!173612) b!319180))

(assert (= (and b!319180 res!173618) b!319185))

(assert (= (and b!319185 res!173619) b!319184))

(assert (= (and b!319184 res!173610) b!319177))

(assert (= (and b!319177 (not res!173617)) b!319182))

(declare-fun m!328021 () Bool)

(assert (=> b!319177 m!328021))

(declare-fun m!328023 () Bool)

(assert (=> b!319177 m!328023))

(declare-fun m!328025 () Bool)

(assert (=> b!319177 m!328025))

(declare-fun m!328027 () Bool)

(assert (=> b!319177 m!328027))

(declare-fun m!328029 () Bool)

(assert (=> b!319177 m!328029))

(declare-fun m!328031 () Bool)

(assert (=> b!319182 m!328031))

(declare-fun m!328033 () Bool)

(assert (=> b!319184 m!328033))

(declare-fun m!328035 () Bool)

(assert (=> b!319184 m!328035))

(declare-fun m!328037 () Bool)

(assert (=> b!319181 m!328037))

(declare-fun m!328039 () Bool)

(assert (=> b!319178 m!328039))

(declare-fun m!328041 () Bool)

(assert (=> b!319180 m!328041))

(assert (=> b!319180 m!328041))

(declare-fun m!328043 () Bool)

(assert (=> b!319180 m!328043))

(declare-fun m!328045 () Bool)

(assert (=> b!319179 m!328045))

(declare-fun m!328047 () Bool)

(assert (=> b!319183 m!328047))

(declare-fun m!328049 () Bool)

(assert (=> b!319185 m!328049))

(declare-fun m!328051 () Bool)

(assert (=> start!31926 m!328051))

(declare-fun m!328053 () Bool)

(assert (=> start!31926 m!328053))

(check-sat (not b!319183) (not b!319181) (not b!319184) (not b!319180) (not start!31926) (not b!319177) (not b!319182) (not b!319179) (not b!319178))
(check-sat)
