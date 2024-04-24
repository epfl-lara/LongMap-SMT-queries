; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44864 () Bool)

(assert start!44864)

(declare-fun b!492357 () Bool)

(declare-fun res!295169 () Bool)

(declare-fun e!289227 () Bool)

(assert (=> b!492357 (=> (not res!295169) (not e!289227))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492357 (= res!295169 (validKeyInArray!0 k0!2280))))

(declare-fun b!492358 () Bool)

(declare-fun res!295167 () Bool)

(assert (=> b!492358 (=> (not res!295167) (not e!289227))))

(declare-datatypes ((array!31867 0))(
  ( (array!31868 (arr!15319 (Array (_ BitVec 32) (_ BitVec 64))) (size!15683 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31867)

(declare-fun arrayContainsKey!0 (array!31867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492358 (= res!295167 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492359 () Bool)

(declare-fun e!289229 () Bool)

(assert (=> b!492359 (= e!289229 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!222620 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3742 0))(
  ( (MissingZero!3742 (index!17147 (_ BitVec 32))) (Found!3742 (index!17148 (_ BitVec 32))) (Intermediate!3742 (undefined!4554 Bool) (index!17149 (_ BitVec 32)) (x!46379 (_ BitVec 32))) (Undefined!3742) (MissingVacant!3742 (index!17150 (_ BitVec 32))) )
))
(declare-fun lt!222625 () SeekEntryResult!3742)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31867 (_ BitVec 32)) SeekEntryResult!3742)

(assert (=> b!492359 (= lt!222625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222620 (select (store (arr!15319 a!3235) i!1204 k0!2280) j!176) (array!31868 (store (arr!15319 a!3235) i!1204 k0!2280) (size!15683 a!3235)) mask!3524))))

(declare-fun lt!222623 () (_ BitVec 32))

(declare-fun lt!222622 () SeekEntryResult!3742)

(assert (=> b!492359 (= lt!222622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222623 (select (arr!15319 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492359 (= lt!222620 (toIndex!0 (select (store (arr!15319 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492359 (= lt!222623 (toIndex!0 (select (arr!15319 a!3235) j!176) mask!3524))))

(declare-fun e!289228 () Bool)

(assert (=> b!492359 e!289228))

(declare-fun res!295163 () Bool)

(assert (=> b!492359 (=> (not res!295163) (not e!289228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31867 (_ BitVec 32)) Bool)

(assert (=> b!492359 (= res!295163 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14491 0))(
  ( (Unit!14492) )
))
(declare-fun lt!222624 () Unit!14491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14491)

(assert (=> b!492359 (= lt!222624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492360 () Bool)

(declare-fun res!295164 () Bool)

(assert (=> b!492360 (=> (not res!295164) (not e!289227))))

(assert (=> b!492360 (= res!295164 (validKeyInArray!0 (select (arr!15319 a!3235) j!176)))))

(declare-fun b!492361 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31867 (_ BitVec 32)) SeekEntryResult!3742)

(assert (=> b!492361 (= e!289228 (= (seekEntryOrOpen!0 (select (arr!15319 a!3235) j!176) a!3235 mask!3524) (Found!3742 j!176)))))

(declare-fun b!492362 () Bool)

(declare-fun res!295165 () Bool)

(assert (=> b!492362 (=> (not res!295165) (not e!289229))))

(declare-datatypes ((List!9384 0))(
  ( (Nil!9381) (Cons!9380 (h!10245 (_ BitVec 64)) (t!15604 List!9384)) )
))
(declare-fun arrayNoDuplicates!0 (array!31867 (_ BitVec 32) List!9384) Bool)

(assert (=> b!492362 (= res!295165 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9381))))

(declare-fun b!492363 () Bool)

(declare-fun res!295170 () Bool)

(assert (=> b!492363 (=> (not res!295170) (not e!289229))))

(assert (=> b!492363 (= res!295170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492364 () Bool)

(declare-fun res!295166 () Bool)

(assert (=> b!492364 (=> (not res!295166) (not e!289227))))

(assert (=> b!492364 (= res!295166 (and (= (size!15683 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15683 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15683 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492356 () Bool)

(assert (=> b!492356 (= e!289227 e!289229)))

(declare-fun res!295171 () Bool)

(assert (=> b!492356 (=> (not res!295171) (not e!289229))))

(declare-fun lt!222621 () SeekEntryResult!3742)

(assert (=> b!492356 (= res!295171 (or (= lt!222621 (MissingZero!3742 i!1204)) (= lt!222621 (MissingVacant!3742 i!1204))))))

(assert (=> b!492356 (= lt!222621 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!295168 () Bool)

(assert (=> start!44864 (=> (not res!295168) (not e!289227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44864 (= res!295168 (validMask!0 mask!3524))))

(assert (=> start!44864 e!289227))

(assert (=> start!44864 true))

(declare-fun array_inv!11178 (array!31867) Bool)

(assert (=> start!44864 (array_inv!11178 a!3235)))

(assert (= (and start!44864 res!295168) b!492364))

(assert (= (and b!492364 res!295166) b!492360))

(assert (= (and b!492360 res!295164) b!492357))

(assert (= (and b!492357 res!295169) b!492358))

(assert (= (and b!492358 res!295167) b!492356))

(assert (= (and b!492356 res!295171) b!492363))

(assert (= (and b!492363 res!295170) b!492362))

(assert (= (and b!492362 res!295165) b!492359))

(assert (= (and b!492359 res!295163) b!492361))

(declare-fun m!473323 () Bool)

(assert (=> b!492357 m!473323))

(declare-fun m!473325 () Bool)

(assert (=> b!492358 m!473325))

(declare-fun m!473327 () Bool)

(assert (=> b!492360 m!473327))

(assert (=> b!492360 m!473327))

(declare-fun m!473329 () Bool)

(assert (=> b!492360 m!473329))

(declare-fun m!473331 () Bool)

(assert (=> b!492356 m!473331))

(declare-fun m!473333 () Bool)

(assert (=> start!44864 m!473333))

(declare-fun m!473335 () Bool)

(assert (=> start!44864 m!473335))

(declare-fun m!473337 () Bool)

(assert (=> b!492359 m!473337))

(declare-fun m!473339 () Bool)

(assert (=> b!492359 m!473339))

(assert (=> b!492359 m!473327))

(declare-fun m!473341 () Bool)

(assert (=> b!492359 m!473341))

(assert (=> b!492359 m!473339))

(declare-fun m!473343 () Bool)

(assert (=> b!492359 m!473343))

(assert (=> b!492359 m!473327))

(declare-fun m!473345 () Bool)

(assert (=> b!492359 m!473345))

(assert (=> b!492359 m!473339))

(declare-fun m!473347 () Bool)

(assert (=> b!492359 m!473347))

(assert (=> b!492359 m!473327))

(declare-fun m!473349 () Bool)

(assert (=> b!492359 m!473349))

(declare-fun m!473351 () Bool)

(assert (=> b!492359 m!473351))

(declare-fun m!473353 () Bool)

(assert (=> b!492363 m!473353))

(assert (=> b!492361 m!473327))

(assert (=> b!492361 m!473327))

(declare-fun m!473355 () Bool)

(assert (=> b!492361 m!473355))

(declare-fun m!473357 () Bool)

(assert (=> b!492362 m!473357))

(check-sat (not b!492360) (not b!492363) (not b!492359) (not start!44864) (not b!492362) (not b!492361) (not b!492356) (not b!492357) (not b!492358))
(check-sat)
