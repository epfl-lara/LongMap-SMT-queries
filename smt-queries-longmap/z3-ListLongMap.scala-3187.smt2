; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44750 () Bool)

(assert start!44750)

(declare-fun res!294165 () Bool)

(declare-fun e!288660 () Bool)

(assert (=> start!44750 (=> (not res!294165) (not e!288660))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44750 (= res!294165 (validMask!0 mask!3524))))

(assert (=> start!44750 e!288660))

(assert (=> start!44750 true))

(declare-datatypes ((array!31809 0))(
  ( (array!31810 (arr!15292 (Array (_ BitVec 32) (_ BitVec 64))) (size!15656 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31809)

(declare-fun array_inv!11088 (array!31809) Bool)

(assert (=> start!44750 (array_inv!11088 a!3235)))

(declare-fun b!491226 () Bool)

(declare-fun res!294164 () Bool)

(assert (=> b!491226 (=> (not res!294164) (not e!288660))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491226 (= res!294164 (validKeyInArray!0 (select (arr!15292 a!3235) j!176)))))

(declare-fun b!491227 () Bool)

(declare-fun res!294170 () Bool)

(declare-fun e!288662 () Bool)

(assert (=> b!491227 (=> (not res!294170) (not e!288662))))

(declare-datatypes ((List!9450 0))(
  ( (Nil!9447) (Cons!9446 (h!10308 (_ BitVec 64)) (t!15678 List!9450)) )
))
(declare-fun arrayNoDuplicates!0 (array!31809 (_ BitVec 32) List!9450) Bool)

(assert (=> b!491227 (= res!294170 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9447))))

(declare-fun b!491228 () Bool)

(declare-fun res!294168 () Bool)

(assert (=> b!491228 (=> (not res!294168) (not e!288660))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!491228 (= res!294168 (validKeyInArray!0 k0!2280))))

(declare-fun b!491229 () Bool)

(declare-fun res!294162 () Bool)

(assert (=> b!491229 (=> (not res!294162) (not e!288662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31809 (_ BitVec 32)) Bool)

(assert (=> b!491229 (= res!294162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491230 () Bool)

(assert (=> b!491230 (= e!288660 e!288662)))

(declare-fun res!294169 () Bool)

(assert (=> b!491230 (=> (not res!294169) (not e!288662))))

(declare-datatypes ((SeekEntryResult!3759 0))(
  ( (MissingZero!3759 (index!17215 (_ BitVec 32))) (Found!3759 (index!17216 (_ BitVec 32))) (Intermediate!3759 (undefined!4571 Bool) (index!17217 (_ BitVec 32)) (x!46305 (_ BitVec 32))) (Undefined!3759) (MissingVacant!3759 (index!17218 (_ BitVec 32))) )
))
(declare-fun lt!222013 () SeekEntryResult!3759)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491230 (= res!294169 (or (= lt!222013 (MissingZero!3759 i!1204)) (= lt!222013 (MissingVacant!3759 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31809 (_ BitVec 32)) SeekEntryResult!3759)

(assert (=> b!491230 (= lt!222013 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491231 () Bool)

(declare-fun res!294163 () Bool)

(assert (=> b!491231 (=> (not res!294163) (not e!288660))))

(declare-fun arrayContainsKey!0 (array!31809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491231 (= res!294163 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491232 () Bool)

(declare-fun res!294166 () Bool)

(assert (=> b!491232 (=> (not res!294166) (not e!288660))))

(assert (=> b!491232 (= res!294166 (and (= (size!15656 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15656 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15656 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491233 () Bool)

(declare-fun e!288661 () Bool)

(assert (=> b!491233 (= e!288662 (not e!288661))))

(declare-fun res!294167 () Bool)

(assert (=> b!491233 (=> res!294167 e!288661)))

(declare-fun lt!222016 () array!31809)

(declare-fun lt!222012 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31809 (_ BitVec 32)) SeekEntryResult!3759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491233 (= res!294167 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15292 a!3235) j!176) mask!3524) (select (arr!15292 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222012 mask!3524) lt!222012 lt!222016 mask!3524))))))

(assert (=> b!491233 (= lt!222012 (select (store (arr!15292 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491233 (= lt!222016 (array!31810 (store (arr!15292 a!3235) i!1204 k0!2280) (size!15656 a!3235)))))

(declare-fun lt!222015 () SeekEntryResult!3759)

(assert (=> b!491233 (= lt!222015 (Found!3759 j!176))))

(assert (=> b!491233 (= lt!222015 (seekEntryOrOpen!0 (select (arr!15292 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491233 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14464 0))(
  ( (Unit!14465) )
))
(declare-fun lt!222014 () Unit!14464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14464)

(assert (=> b!491233 (= lt!222014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491234 () Bool)

(assert (=> b!491234 (= e!288661 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491234 (= lt!222015 (seekEntryOrOpen!0 lt!222012 lt!222016 mask!3524))))

(declare-fun lt!222011 () Unit!14464)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14464)

(assert (=> b!491234 (= lt!222011 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44750 res!294165) b!491232))

(assert (= (and b!491232 res!294166) b!491226))

(assert (= (and b!491226 res!294164) b!491228))

(assert (= (and b!491228 res!294168) b!491231))

(assert (= (and b!491231 res!294163) b!491230))

(assert (= (and b!491230 res!294169) b!491229))

(assert (= (and b!491229 res!294162) b!491227))

(assert (= (and b!491227 res!294170) b!491233))

(assert (= (and b!491233 (not res!294167)) b!491234))

(declare-fun m!471703 () Bool)

(assert (=> b!491227 m!471703))

(declare-fun m!471705 () Bool)

(assert (=> b!491226 m!471705))

(assert (=> b!491226 m!471705))

(declare-fun m!471707 () Bool)

(assert (=> b!491226 m!471707))

(declare-fun m!471709 () Bool)

(assert (=> b!491228 m!471709))

(declare-fun m!471711 () Bool)

(assert (=> b!491230 m!471711))

(declare-fun m!471713 () Bool)

(assert (=> b!491229 m!471713))

(declare-fun m!471715 () Bool)

(assert (=> b!491231 m!471715))

(declare-fun m!471717 () Bool)

(assert (=> start!44750 m!471717))

(declare-fun m!471719 () Bool)

(assert (=> start!44750 m!471719))

(declare-fun m!471721 () Bool)

(assert (=> b!491233 m!471721))

(declare-fun m!471723 () Bool)

(assert (=> b!491233 m!471723))

(declare-fun m!471725 () Bool)

(assert (=> b!491233 m!471725))

(assert (=> b!491233 m!471721))

(declare-fun m!471727 () Bool)

(assert (=> b!491233 m!471727))

(declare-fun m!471729 () Bool)

(assert (=> b!491233 m!471729))

(declare-fun m!471731 () Bool)

(assert (=> b!491233 m!471731))

(assert (=> b!491233 m!471705))

(declare-fun m!471733 () Bool)

(assert (=> b!491233 m!471733))

(assert (=> b!491233 m!471705))

(assert (=> b!491233 m!471731))

(assert (=> b!491233 m!471705))

(declare-fun m!471735 () Bool)

(assert (=> b!491233 m!471735))

(assert (=> b!491233 m!471705))

(declare-fun m!471737 () Bool)

(assert (=> b!491233 m!471737))

(declare-fun m!471739 () Bool)

(assert (=> b!491234 m!471739))

(declare-fun m!471741 () Bool)

(assert (=> b!491234 m!471741))

(check-sat (not b!491231) (not b!491233) (not b!491230) (not b!491229) (not b!491228) (not b!491226) (not b!491227) (not b!491234) (not start!44750))
(check-sat)
