; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46094 () Bool)

(assert start!46094)

(declare-fun b!510641 () Bool)

(declare-fun res!311546 () Bool)

(declare-fun e!298445 () Bool)

(assert (=> b!510641 (=> (not res!311546) (not e!298445))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32806 0))(
  ( (array!32807 (arr!15781 (Array (_ BitVec 32) (_ BitVec 64))) (size!16145 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32806)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510641 (= res!311546 (and (= (size!16145 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16145 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16145 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510642 () Bool)

(declare-fun res!311547 () Bool)

(assert (=> b!510642 (=> (not res!311547) (not e!298445))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510642 (= res!311547 (validKeyInArray!0 k0!2280))))

(declare-fun b!510643 () Bool)

(declare-fun res!311544 () Bool)

(assert (=> b!510643 (=> (not res!311544) (not e!298445))))

(declare-fun arrayContainsKey!0 (array!32806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510643 (= res!311544 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510645 () Bool)

(declare-fun e!298446 () Bool)

(assert (=> b!510645 (= e!298446 true)))

(declare-fun lt!233573 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4204 0))(
  ( (MissingZero!4204 (index!19004 (_ BitVec 32))) (Found!4204 (index!19005 (_ BitVec 32))) (Intermediate!4204 (undefined!5016 Bool) (index!19006 (_ BitVec 32)) (x!48106 (_ BitVec 32))) (Undefined!4204) (MissingVacant!4204 (index!19007 (_ BitVec 32))) )
))
(declare-fun lt!233570 () SeekEntryResult!4204)

(declare-fun lt!233571 () array!32806)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32806 (_ BitVec 32)) SeekEntryResult!4204)

(assert (=> b!510645 (= lt!233570 (seekEntryOrOpen!0 lt!233573 lt!233571 mask!3524))))

(declare-datatypes ((Unit!15727 0))(
  ( (Unit!15728) )
))
(declare-fun lt!233575 () Unit!15727)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32806 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15727)

(assert (=> b!510645 (= lt!233575 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510646 () Bool)

(declare-fun res!311548 () Bool)

(declare-fun e!298444 () Bool)

(assert (=> b!510646 (=> (not res!311548) (not e!298444))))

(declare-datatypes ((List!9846 0))(
  ( (Nil!9843) (Cons!9842 (h!10719 (_ BitVec 64)) (t!16066 List!9846)) )
))
(declare-fun arrayNoDuplicates!0 (array!32806 (_ BitVec 32) List!9846) Bool)

(assert (=> b!510646 (= res!311548 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9843))))

(declare-fun b!510647 () Bool)

(assert (=> b!510647 (= e!298445 e!298444)))

(declare-fun res!311541 () Bool)

(assert (=> b!510647 (=> (not res!311541) (not e!298444))))

(declare-fun lt!233572 () SeekEntryResult!4204)

(assert (=> b!510647 (= res!311541 (or (= lt!233572 (MissingZero!4204 i!1204)) (= lt!233572 (MissingVacant!4204 i!1204))))))

(assert (=> b!510647 (= lt!233572 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510648 () Bool)

(assert (=> b!510648 (= e!298444 (not e!298446))))

(declare-fun res!311540 () Bool)

(assert (=> b!510648 (=> res!311540 e!298446)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32806 (_ BitVec 32)) SeekEntryResult!4204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510648 (= res!311540 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15781 a!3235) j!176) mask!3524) (select (arr!15781 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233573 mask!3524) lt!233573 lt!233571 mask!3524))))))

(assert (=> b!510648 (= lt!233573 (select (store (arr!15781 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510648 (= lt!233571 (array!32807 (store (arr!15781 a!3235) i!1204 k0!2280) (size!16145 a!3235)))))

(assert (=> b!510648 (= lt!233570 (Found!4204 j!176))))

(assert (=> b!510648 (= lt!233570 (seekEntryOrOpen!0 (select (arr!15781 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32806 (_ BitVec 32)) Bool)

(assert (=> b!510648 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233574 () Unit!15727)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15727)

(assert (=> b!510648 (= lt!233574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510649 () Bool)

(declare-fun res!311543 () Bool)

(assert (=> b!510649 (=> (not res!311543) (not e!298445))))

(assert (=> b!510649 (= res!311543 (validKeyInArray!0 (select (arr!15781 a!3235) j!176)))))

(declare-fun b!510644 () Bool)

(declare-fun res!311545 () Bool)

(assert (=> b!510644 (=> (not res!311545) (not e!298444))))

(assert (=> b!510644 (= res!311545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!311542 () Bool)

(assert (=> start!46094 (=> (not res!311542) (not e!298445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46094 (= res!311542 (validMask!0 mask!3524))))

(assert (=> start!46094 e!298445))

(assert (=> start!46094 true))

(declare-fun array_inv!11640 (array!32806) Bool)

(assert (=> start!46094 (array_inv!11640 a!3235)))

(assert (= (and start!46094 res!311542) b!510641))

(assert (= (and b!510641 res!311546) b!510649))

(assert (= (and b!510649 res!311543) b!510642))

(assert (= (and b!510642 res!311547) b!510643))

(assert (= (and b!510643 res!311544) b!510647))

(assert (= (and b!510647 res!311541) b!510644))

(assert (= (and b!510644 res!311545) b!510646))

(assert (= (and b!510646 res!311548) b!510648))

(assert (= (and b!510648 (not res!311540)) b!510645))

(declare-fun m!492277 () Bool)

(assert (=> start!46094 m!492277))

(declare-fun m!492279 () Bool)

(assert (=> start!46094 m!492279))

(declare-fun m!492281 () Bool)

(assert (=> b!510647 m!492281))

(declare-fun m!492283 () Bool)

(assert (=> b!510642 m!492283))

(declare-fun m!492285 () Bool)

(assert (=> b!510646 m!492285))

(declare-fun m!492287 () Bool)

(assert (=> b!510643 m!492287))

(declare-fun m!492289 () Bool)

(assert (=> b!510645 m!492289))

(declare-fun m!492291 () Bool)

(assert (=> b!510645 m!492291))

(declare-fun m!492293 () Bool)

(assert (=> b!510648 m!492293))

(declare-fun m!492295 () Bool)

(assert (=> b!510648 m!492295))

(assert (=> b!510648 m!492293))

(declare-fun m!492297 () Bool)

(assert (=> b!510648 m!492297))

(declare-fun m!492299 () Bool)

(assert (=> b!510648 m!492299))

(declare-fun m!492301 () Bool)

(assert (=> b!510648 m!492301))

(declare-fun m!492303 () Bool)

(assert (=> b!510648 m!492303))

(declare-fun m!492305 () Bool)

(assert (=> b!510648 m!492305))

(declare-fun m!492307 () Bool)

(assert (=> b!510648 m!492307))

(assert (=> b!510648 m!492305))

(assert (=> b!510648 m!492303))

(assert (=> b!510648 m!492305))

(declare-fun m!492309 () Bool)

(assert (=> b!510648 m!492309))

(assert (=> b!510648 m!492305))

(declare-fun m!492311 () Bool)

(assert (=> b!510648 m!492311))

(declare-fun m!492313 () Bool)

(assert (=> b!510644 m!492313))

(assert (=> b!510649 m!492305))

(assert (=> b!510649 m!492305))

(declare-fun m!492315 () Bool)

(assert (=> b!510649 m!492315))

(check-sat (not b!510644) (not b!510646) (not b!510647) (not b!510645) (not b!510649) (not b!510643) (not start!46094) (not b!510648) (not b!510642))
(check-sat)
