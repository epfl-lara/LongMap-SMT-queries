; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44258 () Bool)

(assert start!44258)

(declare-fun res!290093 () Bool)

(declare-fun e!286487 () Bool)

(assert (=> start!44258 (=> (not res!290093) (not e!286487))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44258 (= res!290093 (validMask!0 mask!3524))))

(assert (=> start!44258 e!286487))

(assert (=> start!44258 true))

(declare-datatypes ((array!31509 0))(
  ( (array!31510 (arr!15148 (Array (_ BitVec 32) (_ BitVec 64))) (size!15512 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31509)

(declare-fun array_inv!10944 (array!31509) Bool)

(assert (=> start!44258 (array_inv!10944 a!3235)))

(declare-fun b!486704 () Bool)

(declare-fun e!286488 () Bool)

(assert (=> b!486704 (= e!286487 e!286488)))

(declare-fun res!290096 () Bool)

(assert (=> b!486704 (=> (not res!290096) (not e!286488))))

(declare-datatypes ((SeekEntryResult!3615 0))(
  ( (MissingZero!3615 (index!16639 (_ BitVec 32))) (Found!3615 (index!16640 (_ BitVec 32))) (Intermediate!3615 (undefined!4427 Bool) (index!16641 (_ BitVec 32)) (x!45771 (_ BitVec 32))) (Undefined!3615) (MissingVacant!3615 (index!16642 (_ BitVec 32))) )
))
(declare-fun lt!219832 () SeekEntryResult!3615)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486704 (= res!290096 (or (= lt!219832 (MissingZero!3615 i!1204)) (= lt!219832 (MissingVacant!3615 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31509 (_ BitVec 32)) SeekEntryResult!3615)

(assert (=> b!486704 (= lt!219832 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486705 () Bool)

(declare-fun res!290090 () Bool)

(assert (=> b!486705 (=> (not res!290090) (not e!286487))))

(declare-fun arrayContainsKey!0 (array!31509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486705 (= res!290090 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486706 () Bool)

(declare-fun res!290095 () Bool)

(assert (=> b!486706 (=> (not res!290095) (not e!286487))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486706 (= res!290095 (and (= (size!15512 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15512 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15512 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486707 () Bool)

(declare-fun res!290091 () Bool)

(assert (=> b!486707 (=> (not res!290091) (not e!286488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31509 (_ BitVec 32)) Bool)

(assert (=> b!486707 (= res!290091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486708 () Bool)

(declare-fun res!290092 () Bool)

(assert (=> b!486708 (=> (not res!290092) (not e!286487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486708 (= res!290092 (validKeyInArray!0 k0!2280))))

(declare-fun b!486709 () Bool)

(assert (=> b!486709 (= e!286488 false)))

(declare-fun lt!219831 () Bool)

(declare-datatypes ((List!9306 0))(
  ( (Nil!9303) (Cons!9302 (h!10158 (_ BitVec 64)) (t!15534 List!9306)) )
))
(declare-fun arrayNoDuplicates!0 (array!31509 (_ BitVec 32) List!9306) Bool)

(assert (=> b!486709 (= lt!219831 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9303))))

(declare-fun b!486710 () Bool)

(declare-fun res!290094 () Bool)

(assert (=> b!486710 (=> (not res!290094) (not e!286487))))

(assert (=> b!486710 (= res!290094 (validKeyInArray!0 (select (arr!15148 a!3235) j!176)))))

(assert (= (and start!44258 res!290093) b!486706))

(assert (= (and b!486706 res!290095) b!486710))

(assert (= (and b!486710 res!290094) b!486708))

(assert (= (and b!486708 res!290092) b!486705))

(assert (= (and b!486705 res!290090) b!486704))

(assert (= (and b!486704 res!290096) b!486707))

(assert (= (and b!486707 res!290091) b!486709))

(declare-fun m!466605 () Bool)

(assert (=> b!486710 m!466605))

(assert (=> b!486710 m!466605))

(declare-fun m!466607 () Bool)

(assert (=> b!486710 m!466607))

(declare-fun m!466609 () Bool)

(assert (=> b!486705 m!466609))

(declare-fun m!466611 () Bool)

(assert (=> b!486704 m!466611))

(declare-fun m!466613 () Bool)

(assert (=> start!44258 m!466613))

(declare-fun m!466615 () Bool)

(assert (=> start!44258 m!466615))

(declare-fun m!466617 () Bool)

(assert (=> b!486708 m!466617))

(declare-fun m!466619 () Bool)

(assert (=> b!486709 m!466619))

(declare-fun m!466621 () Bool)

(assert (=> b!486707 m!466621))

(check-sat (not b!486709) (not b!486707) (not b!486710) (not start!44258) (not b!486704) (not b!486705) (not b!486708))
(check-sat)
