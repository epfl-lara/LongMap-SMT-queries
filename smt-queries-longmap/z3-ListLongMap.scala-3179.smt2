; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44690 () Bool)

(assert start!44690)

(declare-fun b!490481 () Bool)

(declare-fun res!293475 () Bool)

(declare-fun e!288312 () Bool)

(assert (=> b!490481 (=> (not res!293475) (not e!288312))))

(declare-datatypes ((array!31750 0))(
  ( (array!31751 (arr!15262 (Array (_ BitVec 32) (_ BitVec 64))) (size!15626 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31750)

(declare-datatypes ((List!9327 0))(
  ( (Nil!9324) (Cons!9323 (h!10185 (_ BitVec 64)) (t!15547 List!9327)) )
))
(declare-fun arrayNoDuplicates!0 (array!31750 (_ BitVec 32) List!9327) Bool)

(assert (=> b!490481 (= res!293475 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9324))))

(declare-fun b!490482 () Bool)

(declare-fun res!293476 () Bool)

(declare-fun e!288313 () Bool)

(assert (=> b!490482 (=> (not res!293476) (not e!288313))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490482 (= res!293476 (validKeyInArray!0 (select (arr!15262 a!3235) j!176)))))

(declare-fun res!293478 () Bool)

(assert (=> start!44690 (=> (not res!293478) (not e!288313))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44690 (= res!293478 (validMask!0 mask!3524))))

(assert (=> start!44690 e!288313))

(assert (=> start!44690 true))

(declare-fun array_inv!11121 (array!31750) Bool)

(assert (=> start!44690 (array_inv!11121 a!3235)))

(declare-fun b!490483 () Bool)

(declare-fun res!293474 () Bool)

(assert (=> b!490483 (=> (not res!293474) (not e!288312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31750 (_ BitVec 32)) Bool)

(assert (=> b!490483 (= res!293474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490484 () Bool)

(declare-fun res!293472 () Bool)

(assert (=> b!490484 (=> (not res!293472) (not e!288313))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490484 (= res!293472 (and (= (size!15626 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15626 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15626 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490485 () Bool)

(declare-fun e!288315 () Bool)

(assert (=> b!490485 (= e!288312 (not e!288315))))

(declare-fun res!293479 () Bool)

(assert (=> b!490485 (=> res!293479 e!288315)))

(declare-fun lt!221575 () (_ BitVec 64))

(declare-fun lt!221574 () array!31750)

(declare-datatypes ((SeekEntryResult!3685 0))(
  ( (MissingZero!3685 (index!16919 (_ BitVec 32))) (Found!3685 (index!16920 (_ BitVec 32))) (Intermediate!3685 (undefined!4497 Bool) (index!16921 (_ BitVec 32)) (x!46164 (_ BitVec 32))) (Undefined!3685) (MissingVacant!3685 (index!16922 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31750 (_ BitVec 32)) SeekEntryResult!3685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490485 (= res!293479 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15262 a!3235) j!176) mask!3524) (select (arr!15262 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221575 mask!3524) lt!221575 lt!221574 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!490485 (= lt!221575 (select (store (arr!15262 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490485 (= lt!221574 (array!31751 (store (arr!15262 a!3235) i!1204 k0!2280) (size!15626 a!3235)))))

(declare-fun lt!221576 () SeekEntryResult!3685)

(assert (=> b!490485 (= lt!221576 (Found!3685 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31750 (_ BitVec 32)) SeekEntryResult!3685)

(assert (=> b!490485 (= lt!221576 (seekEntryOrOpen!0 (select (arr!15262 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490485 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14377 0))(
  ( (Unit!14378) )
))
(declare-fun lt!221573 () Unit!14377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14377)

(assert (=> b!490485 (= lt!221573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490486 () Bool)

(assert (=> b!490486 (= e!288313 e!288312)))

(declare-fun res!293471 () Bool)

(assert (=> b!490486 (=> (not res!293471) (not e!288312))))

(declare-fun lt!221577 () SeekEntryResult!3685)

(assert (=> b!490486 (= res!293471 (or (= lt!221577 (MissingZero!3685 i!1204)) (= lt!221577 (MissingVacant!3685 i!1204))))))

(assert (=> b!490486 (= lt!221577 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490487 () Bool)

(declare-fun res!293473 () Bool)

(assert (=> b!490487 (=> (not res!293473) (not e!288313))))

(declare-fun arrayContainsKey!0 (array!31750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490487 (= res!293473 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490488 () Bool)

(declare-fun res!293477 () Bool)

(assert (=> b!490488 (=> (not res!293477) (not e!288313))))

(assert (=> b!490488 (= res!293477 (validKeyInArray!0 k0!2280))))

(declare-fun b!490489 () Bool)

(assert (=> b!490489 (= e!288315 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490489 (= lt!221576 (seekEntryOrOpen!0 lt!221575 lt!221574 mask!3524))))

(declare-fun lt!221578 () Unit!14377)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31750 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14377)

(assert (=> b!490489 (= lt!221578 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44690 res!293478) b!490484))

(assert (= (and b!490484 res!293472) b!490482))

(assert (= (and b!490482 res!293476) b!490488))

(assert (= (and b!490488 res!293477) b!490487))

(assert (= (and b!490487 res!293473) b!490486))

(assert (= (and b!490486 res!293471) b!490483))

(assert (= (and b!490483 res!293474) b!490481))

(assert (= (and b!490481 res!293475) b!490485))

(assert (= (and b!490485 (not res!293479)) b!490489))

(declare-fun m!470881 () Bool)

(assert (=> b!490489 m!470881))

(declare-fun m!470883 () Bool)

(assert (=> b!490489 m!470883))

(declare-fun m!470885 () Bool)

(assert (=> b!490482 m!470885))

(assert (=> b!490482 m!470885))

(declare-fun m!470887 () Bool)

(assert (=> b!490482 m!470887))

(declare-fun m!470889 () Bool)

(assert (=> b!490481 m!470889))

(declare-fun m!470891 () Bool)

(assert (=> b!490487 m!470891))

(declare-fun m!470893 () Bool)

(assert (=> start!44690 m!470893))

(declare-fun m!470895 () Bool)

(assert (=> start!44690 m!470895))

(declare-fun m!470897 () Bool)

(assert (=> b!490486 m!470897))

(declare-fun m!470899 () Bool)

(assert (=> b!490485 m!470899))

(declare-fun m!470901 () Bool)

(assert (=> b!490485 m!470901))

(declare-fun m!470903 () Bool)

(assert (=> b!490485 m!470903))

(declare-fun m!470905 () Bool)

(assert (=> b!490485 m!470905))

(assert (=> b!490485 m!470885))

(declare-fun m!470907 () Bool)

(assert (=> b!490485 m!470907))

(assert (=> b!490485 m!470885))

(assert (=> b!490485 m!470905))

(declare-fun m!470909 () Bool)

(assert (=> b!490485 m!470909))

(assert (=> b!490485 m!470885))

(declare-fun m!470911 () Bool)

(assert (=> b!490485 m!470911))

(declare-fun m!470913 () Bool)

(assert (=> b!490485 m!470913))

(declare-fun m!470915 () Bool)

(assert (=> b!490485 m!470915))

(assert (=> b!490485 m!470913))

(assert (=> b!490485 m!470885))

(declare-fun m!470917 () Bool)

(assert (=> b!490483 m!470917))

(declare-fun m!470919 () Bool)

(assert (=> b!490488 m!470919))

(check-sat (not b!490489) (not b!490485) (not start!44690) (not b!490487) (not b!490486) (not b!490483) (not b!490481) (not b!490482) (not b!490488))
(check-sat)
