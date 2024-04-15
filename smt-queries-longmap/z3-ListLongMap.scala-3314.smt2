; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45816 () Bool)

(assert start!45816)

(declare-fun b!507174 () Bool)

(declare-fun res!308277 () Bool)

(declare-fun e!296792 () Bool)

(assert (=> b!507174 (=> (not res!308277) (not e!296792))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32582 0))(
  ( (array!32583 (arr!15671 (Array (_ BitVec 32) (_ BitVec 64))) (size!16036 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32582)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507174 (= res!308277 (and (= (size!16036 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16036 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16036 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507175 () Bool)

(declare-fun e!296791 () Bool)

(declare-fun e!296796 () Bool)

(assert (=> b!507175 (= e!296791 e!296796)))

(declare-fun res!308282 () Bool)

(assert (=> b!507175 (=> res!308282 e!296796)))

(declare-fun lt!231501 () Bool)

(declare-datatypes ((SeekEntryResult!4135 0))(
  ( (MissingZero!4135 (index!18728 (_ BitVec 32))) (Found!4135 (index!18729 (_ BitVec 32))) (Intermediate!4135 (undefined!4947 Bool) (index!18730 (_ BitVec 32)) (x!47731 (_ BitVec 32))) (Undefined!4135) (MissingVacant!4135 (index!18731 (_ BitVec 32))) )
))
(declare-fun lt!231499 () SeekEntryResult!4135)

(assert (=> b!507175 (= res!308282 (or (and (not lt!231501) (undefined!4947 lt!231499)) (and (not lt!231501) (not (undefined!4947 lt!231499)))))))

(get-info :version)

(assert (=> b!507175 (= lt!231501 (not ((_ is Intermediate!4135) lt!231499)))))

(declare-fun res!308275 () Bool)

(assert (=> start!45816 (=> (not res!308275) (not e!296792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45816 (= res!308275 (validMask!0 mask!3524))))

(assert (=> start!45816 e!296792))

(assert (=> start!45816 true))

(declare-fun array_inv!11554 (array!32582) Bool)

(assert (=> start!45816 (array_inv!11554 a!3235)))

(declare-fun e!296793 () Bool)

(declare-fun b!507176 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32582 (_ BitVec 32)) SeekEntryResult!4135)

(assert (=> b!507176 (= e!296793 (= (seekEntryOrOpen!0 (select (arr!15671 a!3235) j!176) a!3235 mask!3524) (Found!4135 j!176)))))

(declare-fun b!507177 () Bool)

(declare-fun res!308280 () Bool)

(assert (=> b!507177 (=> (not res!308280) (not e!296792))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507177 (= res!308280 (validKeyInArray!0 k0!2280))))

(declare-fun b!507178 () Bool)

(declare-fun res!308283 () Bool)

(declare-fun e!296795 () Bool)

(assert (=> b!507178 (=> (not res!308283) (not e!296795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32582 (_ BitVec 32)) Bool)

(assert (=> b!507178 (= res!308283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507179 () Bool)

(declare-fun res!308276 () Bool)

(assert (=> b!507179 (=> (not res!308276) (not e!296792))))

(assert (=> b!507179 (= res!308276 (validKeyInArray!0 (select (arr!15671 a!3235) j!176)))))

(declare-fun b!507180 () Bool)

(declare-fun res!308279 () Bool)

(assert (=> b!507180 (=> (not res!308279) (not e!296795))))

(declare-datatypes ((List!9868 0))(
  ( (Nil!9865) (Cons!9864 (h!10741 (_ BitVec 64)) (t!16087 List!9868)) )
))
(declare-fun arrayNoDuplicates!0 (array!32582 (_ BitVec 32) List!9868) Bool)

(assert (=> b!507180 (= res!308279 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9865))))

(declare-fun b!507181 () Bool)

(assert (=> b!507181 (= e!296795 (not e!296791))))

(declare-fun res!308284 () Bool)

(assert (=> b!507181 (=> res!308284 e!296791)))

(declare-fun lt!231498 () (_ BitVec 64))

(declare-fun lt!231495 () (_ BitVec 32))

(declare-fun lt!231496 () array!32582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32582 (_ BitVec 32)) SeekEntryResult!4135)

(assert (=> b!507181 (= res!308284 (= lt!231499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231495 lt!231498 lt!231496 mask!3524)))))

(declare-fun lt!231502 () (_ BitVec 32))

(assert (=> b!507181 (= lt!231499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231502 (select (arr!15671 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507181 (= lt!231495 (toIndex!0 lt!231498 mask!3524))))

(assert (=> b!507181 (= lt!231498 (select (store (arr!15671 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507181 (= lt!231502 (toIndex!0 (select (arr!15671 a!3235) j!176) mask!3524))))

(assert (=> b!507181 (= lt!231496 (array!32583 (store (arr!15671 a!3235) i!1204 k0!2280) (size!16036 a!3235)))))

(assert (=> b!507181 e!296793))

(declare-fun res!308278 () Bool)

(assert (=> b!507181 (=> (not res!308278) (not e!296793))))

(assert (=> b!507181 (= res!308278 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15544 0))(
  ( (Unit!15545) )
))
(declare-fun lt!231500 () Unit!15544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15544)

(assert (=> b!507181 (= lt!231500 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507182 () Bool)

(assert (=> b!507182 (= e!296796 true)))

(declare-fun lt!231497 () SeekEntryResult!4135)

(assert (=> b!507182 (= lt!231497 (seekEntryOrOpen!0 lt!231498 lt!231496 mask!3524))))

(assert (=> b!507182 false))

(declare-fun b!507183 () Bool)

(declare-fun res!308285 () Bool)

(assert (=> b!507183 (=> (not res!308285) (not e!296792))))

(declare-fun arrayContainsKey!0 (array!32582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507183 (= res!308285 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507184 () Bool)

(assert (=> b!507184 (= e!296792 e!296795)))

(declare-fun res!308281 () Bool)

(assert (=> b!507184 (=> (not res!308281) (not e!296795))))

(declare-fun lt!231494 () SeekEntryResult!4135)

(assert (=> b!507184 (= res!308281 (or (= lt!231494 (MissingZero!4135 i!1204)) (= lt!231494 (MissingVacant!4135 i!1204))))))

(assert (=> b!507184 (= lt!231494 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45816 res!308275) b!507174))

(assert (= (and b!507174 res!308277) b!507179))

(assert (= (and b!507179 res!308276) b!507177))

(assert (= (and b!507177 res!308280) b!507183))

(assert (= (and b!507183 res!308285) b!507184))

(assert (= (and b!507184 res!308281) b!507178))

(assert (= (and b!507178 res!308283) b!507180))

(assert (= (and b!507180 res!308279) b!507181))

(assert (= (and b!507181 res!308278) b!507176))

(assert (= (and b!507181 (not res!308284)) b!507175))

(assert (= (and b!507175 (not res!308282)) b!507182))

(declare-fun m!487465 () Bool)

(assert (=> b!507181 m!487465))

(declare-fun m!487467 () Bool)

(assert (=> b!507181 m!487467))

(declare-fun m!487469 () Bool)

(assert (=> b!507181 m!487469))

(declare-fun m!487471 () Bool)

(assert (=> b!507181 m!487471))

(declare-fun m!487473 () Bool)

(assert (=> b!507181 m!487473))

(declare-fun m!487475 () Bool)

(assert (=> b!507181 m!487475))

(declare-fun m!487477 () Bool)

(assert (=> b!507181 m!487477))

(assert (=> b!507181 m!487471))

(declare-fun m!487479 () Bool)

(assert (=> b!507181 m!487479))

(declare-fun m!487481 () Bool)

(assert (=> b!507181 m!487481))

(assert (=> b!507181 m!487471))

(assert (=> b!507176 m!487471))

(assert (=> b!507176 m!487471))

(declare-fun m!487483 () Bool)

(assert (=> b!507176 m!487483))

(assert (=> b!507179 m!487471))

(assert (=> b!507179 m!487471))

(declare-fun m!487485 () Bool)

(assert (=> b!507179 m!487485))

(declare-fun m!487487 () Bool)

(assert (=> b!507184 m!487487))

(declare-fun m!487489 () Bool)

(assert (=> b!507182 m!487489))

(declare-fun m!487491 () Bool)

(assert (=> b!507177 m!487491))

(declare-fun m!487493 () Bool)

(assert (=> b!507183 m!487493))

(declare-fun m!487495 () Bool)

(assert (=> b!507178 m!487495))

(declare-fun m!487497 () Bool)

(assert (=> b!507180 m!487497))

(declare-fun m!487499 () Bool)

(assert (=> start!45816 m!487499))

(declare-fun m!487501 () Bool)

(assert (=> start!45816 m!487501))

(check-sat (not b!507177) (not b!507178) (not b!507182) (not b!507179) (not b!507184) (not start!45816) (not b!507176) (not b!507183) (not b!507180) (not b!507181))
(check-sat)
