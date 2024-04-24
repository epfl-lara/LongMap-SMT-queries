; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135054 () Bool)

(assert start!135054)

(declare-fun b!1573761 () Bool)

(declare-fun e!877642 () Bool)

(assert (=> b!1573761 (= e!877642 false)))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13484 0))(
  ( (MissingZero!13484 (index!56334 (_ BitVec 32))) (Found!13484 (index!56335 (_ BitVec 32))) (Intermediate!13484 (undefined!14296 Bool) (index!56336 (_ BitVec 32)) (x!141245 (_ BitVec 32))) (Undefined!13484) (MissingVacant!13484 (index!56337 (_ BitVec 32))) )
))
(declare-fun lt!674454 () SeekEntryResult!13484)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-datatypes ((array!104966 0))(
  ( (array!104967 (arr!50653 (Array (_ BitVec 32) (_ BitVec 64))) (size!51204 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104966)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104966 (_ BitVec 32)) SeekEntryResult!13484)

(assert (=> b!1573761 (= lt!674454 (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))

(declare-fun b!1573760 () Bool)

(declare-fun res!1074422 () Bool)

(assert (=> b!1573760 (=> (not res!1074422) (not e!877642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573760 (= res!1074422 (validKeyInArray!0 k0!2731))))

(declare-fun b!1573758 () Bool)

(declare-fun res!1074419 () Bool)

(assert (=> b!1573758 (=> (not res!1074419) (not e!877642))))

(assert (=> b!1573758 (= res!1074419 (= (size!51204 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun res!1074421 () Bool)

(assert (=> start!135054 (=> (not res!1074421) (not e!877642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135054 (= res!1074421 (validMask!0 mask!4043))))

(assert (=> start!135054 e!877642))

(assert (=> start!135054 true))

(declare-fun array_inv!39608 (array!104966) Bool)

(assert (=> start!135054 (array_inv!39608 a!3462)))

(declare-fun b!1573759 () Bool)

(declare-fun res!1074420 () Bool)

(assert (=> b!1573759 (=> (not res!1074420) (not e!877642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104966 (_ BitVec 32)) Bool)

(assert (=> b!1573759 (= res!1074420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!135054 res!1074421) b!1573758))

(assert (= (and b!1573758 res!1074419) b!1573759))

(assert (= (and b!1573759 res!1074420) b!1573760))

(assert (= (and b!1573760 res!1074422) b!1573761))

(declare-fun m!1447557 () Bool)

(assert (=> b!1573761 m!1447557))

(declare-fun m!1447559 () Bool)

(assert (=> b!1573760 m!1447559))

(declare-fun m!1447561 () Bool)

(assert (=> start!135054 m!1447561))

(declare-fun m!1447563 () Bool)

(assert (=> start!135054 m!1447563))

(declare-fun m!1447565 () Bool)

(assert (=> b!1573759 m!1447565))

(check-sat (not b!1573760) (not start!135054) (not b!1573759) (not b!1573761))
(check-sat)
