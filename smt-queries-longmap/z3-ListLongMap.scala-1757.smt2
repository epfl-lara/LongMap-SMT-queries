; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32142 () Bool)

(assert start!32142)

(declare-fun b!320337 () Bool)

(declare-fun res!174584 () Bool)

(declare-fun e!198784 () Bool)

(assert (=> b!320337 (=> (not res!174584) (not e!198784))))

(declare-datatypes ((array!16377 0))(
  ( (array!16378 (arr!7749 (Array (_ BitVec 32) (_ BitVec 64))) (size!8101 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16377)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16377 (_ BitVec 32)) Bool)

(assert (=> b!320337 (= res!174584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320338 () Bool)

(declare-fun res!174582 () Bool)

(assert (=> b!320338 (=> (not res!174582) (not e!198784))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320338 (= res!174582 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320339 () Bool)

(declare-fun res!174583 () Bool)

(assert (=> b!320339 (=> (not res!174583) (not e!198784))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2880 0))(
  ( (MissingZero!2880 (index!13696 (_ BitVec 32))) (Found!2880 (index!13697 (_ BitVec 32))) (Intermediate!2880 (undefined!3692 Bool) (index!13698 (_ BitVec 32)) (x!31965 (_ BitVec 32))) (Undefined!2880) (MissingVacant!2880 (index!13699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16377 (_ BitVec 32)) SeekEntryResult!2880)

(assert (=> b!320339 (= res!174583 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2880 i!1250)))))

(declare-fun res!174585 () Bool)

(assert (=> start!32142 (=> (not res!174585) (not e!198784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32142 (= res!174585 (validMask!0 mask!3777))))

(assert (=> start!32142 e!198784))

(assert (=> start!32142 true))

(declare-fun array_inv!5712 (array!16377) Bool)

(assert (=> start!32142 (array_inv!5712 a!3305)))

(declare-fun b!320340 () Bool)

(assert (=> b!320340 (= e!198784 false)))

(declare-fun lt!156009 () SeekEntryResult!2880)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16377 (_ BitVec 32)) SeekEntryResult!2880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320340 (= lt!156009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!320341 () Bool)

(declare-fun res!174580 () Bool)

(assert (=> b!320341 (=> (not res!174580) (not e!198784))))

(assert (=> b!320341 (= res!174580 (and (= (size!8101 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8101 a!3305))))))

(declare-fun b!320342 () Bool)

(declare-fun res!174581 () Bool)

(assert (=> b!320342 (=> (not res!174581) (not e!198784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320342 (= res!174581 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32142 res!174585) b!320341))

(assert (= (and b!320341 res!174580) b!320342))

(assert (= (and b!320342 res!174581) b!320338))

(assert (= (and b!320338 res!174582) b!320339))

(assert (= (and b!320339 res!174583) b!320337))

(assert (= (and b!320337 res!174584) b!320340))

(declare-fun m!328731 () Bool)

(assert (=> b!320337 m!328731))

(declare-fun m!328733 () Bool)

(assert (=> b!320339 m!328733))

(declare-fun m!328735 () Bool)

(assert (=> b!320342 m!328735))

(declare-fun m!328737 () Bool)

(assert (=> b!320340 m!328737))

(assert (=> b!320340 m!328737))

(declare-fun m!328739 () Bool)

(assert (=> b!320340 m!328739))

(declare-fun m!328741 () Bool)

(assert (=> b!320338 m!328741))

(declare-fun m!328743 () Bool)

(assert (=> start!32142 m!328743))

(declare-fun m!328745 () Bool)

(assert (=> start!32142 m!328745))

(check-sat (not b!320339) (not b!320337) (not b!320340) (not b!320342) (not start!32142) (not b!320338))
