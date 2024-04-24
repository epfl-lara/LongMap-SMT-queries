; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44594 () Bool)

(assert start!44594)

(declare-fun b!489178 () Bool)

(declare-fun res!292177 () Bool)

(declare-fun e!287733 () Bool)

(assert (=> b!489178 (=> (not res!292177) (not e!287733))))

(declare-datatypes ((array!31654 0))(
  ( (array!31655 (arr!15214 (Array (_ BitVec 32) (_ BitVec 64))) (size!15578 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31654)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31654 (_ BitVec 32)) Bool)

(assert (=> b!489178 (= res!292177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489179 () Bool)

(declare-fun e!287730 () Bool)

(assert (=> b!489179 (= e!287733 (not e!287730))))

(declare-fun res!292173 () Bool)

(assert (=> b!489179 (=> res!292173 e!287730)))

(declare-fun lt!220730 () (_ BitVec 32))

(assert (=> b!489179 (= res!292173 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvslt lt!220730 #b00000000000000000000000000000000) (bvsge lt!220730 (bvadd #b00000000000000000000000000000001 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489179 (= lt!220730 (toIndex!0 (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287732 () Bool)

(assert (=> b!489179 e!287732))

(declare-fun res!292170 () Bool)

(assert (=> b!489179 (=> (not res!292170) (not e!287732))))

(assert (=> b!489179 (= res!292170 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14281 0))(
  ( (Unit!14282) )
))
(declare-fun lt!220732 () Unit!14281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14281)

(assert (=> b!489179 (= lt!220732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489180 () Bool)

(declare-fun res!292171 () Bool)

(assert (=> b!489180 (=> (not res!292171) (not e!287733))))

(declare-datatypes ((List!9279 0))(
  ( (Nil!9276) (Cons!9275 (h!10137 (_ BitVec 64)) (t!15499 List!9279)) )
))
(declare-fun arrayNoDuplicates!0 (array!31654 (_ BitVec 32) List!9279) Bool)

(assert (=> b!489180 (= res!292171 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9276))))

(declare-fun b!489181 () Bool)

(declare-fun res!292168 () Bool)

(declare-fun e!287729 () Bool)

(assert (=> b!489181 (=> (not res!292168) (not e!287729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489181 (= res!292168 (validKeyInArray!0 k0!2280))))

(declare-fun res!292172 () Bool)

(assert (=> start!44594 (=> (not res!292172) (not e!287729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44594 (= res!292172 (validMask!0 mask!3524))))

(assert (=> start!44594 e!287729))

(assert (=> start!44594 true))

(declare-fun array_inv!11073 (array!31654) Bool)

(assert (=> start!44594 (array_inv!11073 a!3235)))

(declare-fun b!489182 () Bool)

(declare-fun res!292169 () Bool)

(assert (=> b!489182 (=> (not res!292169) (not e!287729))))

(assert (=> b!489182 (= res!292169 (validKeyInArray!0 (select (arr!15214 a!3235) j!176)))))

(declare-fun b!489183 () Bool)

(assert (=> b!489183 (= e!287729 e!287733)))

(declare-fun res!292174 () Bool)

(assert (=> b!489183 (=> (not res!292174) (not e!287733))))

(declare-datatypes ((SeekEntryResult!3637 0))(
  ( (MissingZero!3637 (index!16727 (_ BitVec 32))) (Found!3637 (index!16728 (_ BitVec 32))) (Intermediate!3637 (undefined!4449 Bool) (index!16729 (_ BitVec 32)) (x!45988 (_ BitVec 32))) (Undefined!3637) (MissingVacant!3637 (index!16730 (_ BitVec 32))) )
))
(declare-fun lt!220731 () SeekEntryResult!3637)

(assert (=> b!489183 (= res!292174 (or (= lt!220731 (MissingZero!3637 i!1204)) (= lt!220731 (MissingVacant!3637 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31654 (_ BitVec 32)) SeekEntryResult!3637)

(assert (=> b!489183 (= lt!220731 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489184 () Bool)

(assert (=> b!489184 (= e!287732 (= (seekEntryOrOpen!0 (select (arr!15214 a!3235) j!176) a!3235 mask!3524) (Found!3637 j!176)))))

(declare-fun b!489185 () Bool)

(declare-fun res!292176 () Bool)

(assert (=> b!489185 (=> (not res!292176) (not e!287729))))

(declare-fun arrayContainsKey!0 (array!31654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489185 (= res!292176 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489186 () Bool)

(declare-fun res!292175 () Bool)

(assert (=> b!489186 (=> (not res!292175) (not e!287729))))

(assert (=> b!489186 (= res!292175 (and (= (size!15578 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15578 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15578 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489187 () Bool)

(assert (=> b!489187 (= e!287730 (validKeyInArray!0 (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176)))))

(assert (= (and start!44594 res!292172) b!489186))

(assert (= (and b!489186 res!292175) b!489182))

(assert (= (and b!489182 res!292169) b!489181))

(assert (= (and b!489181 res!292168) b!489185))

(assert (= (and b!489185 res!292176) b!489183))

(assert (= (and b!489183 res!292174) b!489178))

(assert (= (and b!489178 res!292177) b!489180))

(assert (= (and b!489180 res!292171) b!489179))

(assert (= (and b!489179 res!292170) b!489184))

(assert (= (and b!489179 (not res!292173)) b!489187))

(declare-fun m!469153 () Bool)

(assert (=> b!489185 m!469153))

(declare-fun m!469155 () Bool)

(assert (=> b!489180 m!469155))

(declare-fun m!469157 () Bool)

(assert (=> start!44594 m!469157))

(declare-fun m!469159 () Bool)

(assert (=> start!44594 m!469159))

(declare-fun m!469161 () Bool)

(assert (=> b!489178 m!469161))

(declare-fun m!469163 () Bool)

(assert (=> b!489179 m!469163))

(declare-fun m!469165 () Bool)

(assert (=> b!489179 m!469165))

(declare-fun m!469167 () Bool)

(assert (=> b!489179 m!469167))

(declare-fun m!469169 () Bool)

(assert (=> b!489179 m!469169))

(assert (=> b!489179 m!469167))

(declare-fun m!469171 () Bool)

(assert (=> b!489179 m!469171))

(declare-fun m!469173 () Bool)

(assert (=> b!489181 m!469173))

(declare-fun m!469175 () Bool)

(assert (=> b!489184 m!469175))

(assert (=> b!489184 m!469175))

(declare-fun m!469177 () Bool)

(assert (=> b!489184 m!469177))

(assert (=> b!489187 m!469163))

(assert (=> b!489187 m!469167))

(assert (=> b!489187 m!469167))

(declare-fun m!469179 () Bool)

(assert (=> b!489187 m!469179))

(assert (=> b!489182 m!469175))

(assert (=> b!489182 m!469175))

(declare-fun m!469181 () Bool)

(assert (=> b!489182 m!469181))

(declare-fun m!469183 () Bool)

(assert (=> b!489183 m!469183))

(check-sat (not b!489178) (not b!489180) (not b!489187) (not b!489181) (not b!489184) (not b!489182) (not b!489183) (not start!44594) (not b!489185) (not b!489179))
(check-sat)
