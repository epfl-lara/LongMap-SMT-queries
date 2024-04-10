; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32064 () Bool)

(assert start!32064)

(declare-fun b!319896 () Bool)

(declare-fun res!174210 () Bool)

(declare-fun e!198604 () Bool)

(assert (=> b!319896 (=> (not res!174210) (not e!198604))))

(declare-datatypes ((array!16338 0))(
  ( (array!16339 (arr!7731 (Array (_ BitVec 32) (_ BitVec 64))) (size!8083 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16338)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319896 (= res!174210 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319897 () Bool)

(declare-fun res!174212 () Bool)

(assert (=> b!319897 (=> (not res!174212) (not e!198604))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319897 (= res!174212 (and (= (size!8083 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8083 a!3305))))))

(declare-fun b!319898 () Bool)

(declare-fun res!174213 () Bool)

(assert (=> b!319898 (=> (not res!174213) (not e!198604))))

(declare-datatypes ((SeekEntryResult!2862 0))(
  ( (MissingZero!2862 (index!13624 (_ BitVec 32))) (Found!2862 (index!13625 (_ BitVec 32))) (Intermediate!2862 (undefined!3674 Bool) (index!13626 (_ BitVec 32)) (x!31896 (_ BitVec 32))) (Undefined!2862) (MissingVacant!2862 (index!13627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16338 (_ BitVec 32)) SeekEntryResult!2862)

(assert (=> b!319898 (= res!174213 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2862 i!1250)))))

(declare-fun b!319899 () Bool)

(declare-fun res!174211 () Bool)

(assert (=> b!319899 (=> (not res!174211) (not e!198604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16338 (_ BitVec 32)) Bool)

(assert (=> b!319899 (= res!174211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174208 () Bool)

(assert (=> start!32064 (=> (not res!174208) (not e!198604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32064 (= res!174208 (validMask!0 mask!3777))))

(assert (=> start!32064 e!198604))

(assert (=> start!32064 true))

(declare-fun array_inv!5694 (array!16338) Bool)

(assert (=> start!32064 (array_inv!5694 a!3305)))

(declare-fun b!319900 () Bool)

(assert (=> b!319900 (= e!198604 false)))

(declare-fun lt!155892 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319900 (= lt!155892 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319901 () Bool)

(declare-fun res!174209 () Bool)

(assert (=> b!319901 (=> (not res!174209) (not e!198604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319901 (= res!174209 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32064 res!174208) b!319897))

(assert (= (and b!319897 res!174212) b!319901))

(assert (= (and b!319901 res!174209) b!319896))

(assert (= (and b!319896 res!174210) b!319898))

(assert (= (and b!319898 res!174213) b!319899))

(assert (= (and b!319899 res!174211) b!319900))

(declare-fun m!328381 () Bool)

(assert (=> b!319896 m!328381))

(declare-fun m!328383 () Bool)

(assert (=> start!32064 m!328383))

(declare-fun m!328385 () Bool)

(assert (=> start!32064 m!328385))

(declare-fun m!328387 () Bool)

(assert (=> b!319900 m!328387))

(declare-fun m!328389 () Bool)

(assert (=> b!319899 m!328389))

(declare-fun m!328391 () Bool)

(assert (=> b!319898 m!328391))

(declare-fun m!328393 () Bool)

(assert (=> b!319901 m!328393))

(check-sat (not b!319898) (not b!319900) (not b!319899) (not b!319901) (not start!32064) (not b!319896))
(check-sat)
