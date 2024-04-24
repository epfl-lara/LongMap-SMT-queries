; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46262 () Bool)

(assert start!46262)

(declare-fun res!313225 () Bool)

(declare-fun e!299280 () Bool)

(assert (=> start!46262 (=> (not res!313225) (not e!299280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46262 (= res!313225 (validMask!0 mask!3524))))

(assert (=> start!46262 e!299280))

(assert (=> start!46262 true))

(declare-datatypes ((array!32917 0))(
  ( (array!32918 (arr!15835 (Array (_ BitVec 32) (_ BitVec 64))) (size!16199 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32917)

(declare-fun array_inv!11694 (array!32917) Bool)

(assert (=> start!46262 (array_inv!11694 a!3235)))

(declare-fun b!512507 () Bool)

(declare-fun res!313230 () Bool)

(assert (=> b!512507 (=> (not res!313230) (not e!299280))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512507 (= res!313230 (validKeyInArray!0 (select (arr!15835 a!3235) j!176)))))

(declare-fun b!512508 () Bool)

(declare-fun res!313223 () Bool)

(assert (=> b!512508 (=> (not res!313223) (not e!299280))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512508 (= res!313223 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512509 () Bool)

(declare-fun e!299277 () Bool)

(assert (=> b!512509 (= e!299277 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234671 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4258 0))(
  ( (MissingZero!4258 (index!19220 (_ BitVec 32))) (Found!4258 (index!19221 (_ BitVec 32))) (Intermediate!4258 (undefined!5070 Bool) (index!19222 (_ BitVec 32)) (x!48310 (_ BitVec 32))) (Undefined!4258) (MissingVacant!4258 (index!19223 (_ BitVec 32))) )
))
(declare-fun lt!234676 () SeekEntryResult!4258)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32917 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!512509 (= lt!234676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234671 (select (store (arr!15835 a!3235) i!1204 k0!2280) j!176) (array!32918 (store (arr!15835 a!3235) i!1204 k0!2280) (size!16199 a!3235)) mask!3524))))

(declare-fun lt!234673 () SeekEntryResult!4258)

(declare-fun lt!234675 () (_ BitVec 32))

(assert (=> b!512509 (= lt!234673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234675 (select (arr!15835 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512509 (= lt!234671 (toIndex!0 (select (store (arr!15835 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512509 (= lt!234675 (toIndex!0 (select (arr!15835 a!3235) j!176) mask!3524))))

(declare-fun e!299279 () Bool)

(assert (=> b!512509 e!299279))

(declare-fun res!313228 () Bool)

(assert (=> b!512509 (=> (not res!313228) (not e!299279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32917 (_ BitVec 32)) Bool)

(assert (=> b!512509 (= res!313228 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15835 0))(
  ( (Unit!15836) )
))
(declare-fun lt!234674 () Unit!15835)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15835)

(assert (=> b!512509 (= lt!234674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512510 () Bool)

(assert (=> b!512510 (= e!299280 e!299277)))

(declare-fun res!313224 () Bool)

(assert (=> b!512510 (=> (not res!313224) (not e!299277))))

(declare-fun lt!234672 () SeekEntryResult!4258)

(assert (=> b!512510 (= res!313224 (or (= lt!234672 (MissingZero!4258 i!1204)) (= lt!234672 (MissingVacant!4258 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32917 (_ BitVec 32)) SeekEntryResult!4258)

(assert (=> b!512510 (= lt!234672 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512511 () Bool)

(declare-fun res!313226 () Bool)

(assert (=> b!512511 (=> (not res!313226) (not e!299277))))

(assert (=> b!512511 (= res!313226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512512 () Bool)

(assert (=> b!512512 (= e!299279 (= (seekEntryOrOpen!0 (select (arr!15835 a!3235) j!176) a!3235 mask!3524) (Found!4258 j!176)))))

(declare-fun b!512513 () Bool)

(declare-fun res!313227 () Bool)

(assert (=> b!512513 (=> (not res!313227) (not e!299277))))

(declare-datatypes ((List!9900 0))(
  ( (Nil!9897) (Cons!9896 (h!10776 (_ BitVec 64)) (t!16120 List!9900)) )
))
(declare-fun arrayNoDuplicates!0 (array!32917 (_ BitVec 32) List!9900) Bool)

(assert (=> b!512513 (= res!313227 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9897))))

(declare-fun b!512514 () Bool)

(declare-fun res!313231 () Bool)

(assert (=> b!512514 (=> (not res!313231) (not e!299280))))

(assert (=> b!512514 (= res!313231 (and (= (size!16199 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16199 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16199 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512515 () Bool)

(declare-fun res!313229 () Bool)

(assert (=> b!512515 (=> (not res!313229) (not e!299280))))

(assert (=> b!512515 (= res!313229 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46262 res!313225) b!512514))

(assert (= (and b!512514 res!313231) b!512507))

(assert (= (and b!512507 res!313230) b!512515))

(assert (= (and b!512515 res!313229) b!512508))

(assert (= (and b!512508 res!313223) b!512510))

(assert (= (and b!512510 res!313224) b!512511))

(assert (= (and b!512511 res!313226) b!512513))

(assert (= (and b!512513 res!313227) b!512509))

(assert (= (and b!512509 res!313228) b!512512))

(declare-fun m!494437 () Bool)

(assert (=> b!512507 m!494437))

(assert (=> b!512507 m!494437))

(declare-fun m!494439 () Bool)

(assert (=> b!512507 m!494439))

(declare-fun m!494441 () Bool)

(assert (=> b!512510 m!494441))

(declare-fun m!494443 () Bool)

(assert (=> b!512511 m!494443))

(assert (=> b!512512 m!494437))

(assert (=> b!512512 m!494437))

(declare-fun m!494445 () Bool)

(assert (=> b!512512 m!494445))

(declare-fun m!494447 () Bool)

(assert (=> b!512515 m!494447))

(declare-fun m!494449 () Bool)

(assert (=> start!46262 m!494449))

(declare-fun m!494451 () Bool)

(assert (=> start!46262 m!494451))

(declare-fun m!494453 () Bool)

(assert (=> b!512508 m!494453))

(declare-fun m!494455 () Bool)

(assert (=> b!512513 m!494455))

(assert (=> b!512509 m!494437))

(declare-fun m!494457 () Bool)

(assert (=> b!512509 m!494457))

(declare-fun m!494459 () Bool)

(assert (=> b!512509 m!494459))

(declare-fun m!494461 () Bool)

(assert (=> b!512509 m!494461))

(declare-fun m!494463 () Bool)

(assert (=> b!512509 m!494463))

(declare-fun m!494465 () Bool)

(assert (=> b!512509 m!494465))

(assert (=> b!512509 m!494461))

(assert (=> b!512509 m!494437))

(declare-fun m!494467 () Bool)

(assert (=> b!512509 m!494467))

(assert (=> b!512509 m!494437))

(declare-fun m!494469 () Bool)

(assert (=> b!512509 m!494469))

(assert (=> b!512509 m!494461))

(declare-fun m!494471 () Bool)

(assert (=> b!512509 m!494471))

(check-sat (not b!512508) (not b!512512) (not b!512513) (not b!512515) (not start!46262) (not b!512511) (not b!512507) (not b!512509) (not b!512510))
(check-sat)
