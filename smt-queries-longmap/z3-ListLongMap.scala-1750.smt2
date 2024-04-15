; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32042 () Bool)

(assert start!32042)

(declare-fun b!319549 () Bool)

(declare-fun res!174012 () Bool)

(declare-fun e!198404 () Bool)

(assert (=> b!319549 (=> (not res!174012) (not e!198404))))

(declare-datatypes ((array!16320 0))(
  ( (array!16321 (arr!7722 (Array (_ BitVec 32) (_ BitVec 64))) (size!8075 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16320)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319549 (= res!174012 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174007 () Bool)

(assert (=> start!32042 (=> (not res!174007) (not e!198404))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32042 (= res!174007 (validMask!0 mask!3777))))

(assert (=> start!32042 e!198404))

(assert (=> start!32042 true))

(declare-fun array_inv!5694 (array!16320) Bool)

(assert (=> start!32042 (array_inv!5694 a!3305)))

(declare-fun b!319550 () Bool)

(declare-fun res!174008 () Bool)

(assert (=> b!319550 (=> (not res!174008) (not e!198404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16320 (_ BitVec 32)) Bool)

(assert (=> b!319550 (= res!174008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319551 () Bool)

(declare-fun res!174009 () Bool)

(assert (=> b!319551 (=> (not res!174009) (not e!198404))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319551 (= res!174009 (and (= (size!8075 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8075 a!3305))))))

(declare-fun b!319552 () Bool)

(declare-fun res!174010 () Bool)

(assert (=> b!319552 (=> (not res!174010) (not e!198404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319552 (= res!174010 (validKeyInArray!0 k0!2497))))

(declare-fun b!319553 () Bool)

(assert (=> b!319553 (= e!198404 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155645 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319553 (= lt!155645 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319554 () Bool)

(declare-fun res!174011 () Bool)

(assert (=> b!319554 (=> (not res!174011) (not e!198404))))

(declare-datatypes ((SeekEntryResult!2852 0))(
  ( (MissingZero!2852 (index!13584 (_ BitVec 32))) (Found!2852 (index!13585 (_ BitVec 32))) (Intermediate!2852 (undefined!3664 Bool) (index!13586 (_ BitVec 32)) (x!31873 (_ BitVec 32))) (Undefined!2852) (MissingVacant!2852 (index!13587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16320 (_ BitVec 32)) SeekEntryResult!2852)

(assert (=> b!319554 (= res!174011 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2852 i!1250)))))

(assert (= (and start!32042 res!174007) b!319551))

(assert (= (and b!319551 res!174009) b!319552))

(assert (= (and b!319552 res!174010) b!319549))

(assert (= (and b!319549 res!174012) b!319554))

(assert (= (and b!319554 res!174011) b!319550))

(assert (= (and b!319550 res!174008) b!319553))

(declare-fun m!327595 () Bool)

(assert (=> start!32042 m!327595))

(declare-fun m!327597 () Bool)

(assert (=> start!32042 m!327597))

(declare-fun m!327599 () Bool)

(assert (=> b!319550 m!327599))

(declare-fun m!327601 () Bool)

(assert (=> b!319553 m!327601))

(declare-fun m!327603 () Bool)

(assert (=> b!319552 m!327603))

(declare-fun m!327605 () Bool)

(assert (=> b!319554 m!327605))

(declare-fun m!327607 () Bool)

(assert (=> b!319549 m!327607))

(check-sat (not b!319550) (not b!319549) (not b!319554) (not b!319553) (not start!32042) (not b!319552))
(check-sat)
