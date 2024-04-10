; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32124 () Bool)

(assert start!32124)

(declare-fun b!320166 () Bool)

(declare-fun res!174413 () Bool)

(declare-fun e!198730 () Bool)

(assert (=> b!320166 (=> (not res!174413) (not e!198730))))

(declare-datatypes ((array!16359 0))(
  ( (array!16360 (arr!7740 (Array (_ BitVec 32) (_ BitVec 64))) (size!8092 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16359)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320166 (= res!174413 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320167 () Bool)

(declare-fun res!174411 () Bool)

(assert (=> b!320167 (=> (not res!174411) (not e!198730))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320167 (= res!174411 (and (= (size!8092 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8092 a!3305))))))

(declare-fun b!320168 () Bool)

(declare-fun res!174414 () Bool)

(assert (=> b!320168 (=> (not res!174414) (not e!198730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320168 (= res!174414 (validKeyInArray!0 k0!2497))))

(declare-fun b!320169 () Bool)

(declare-fun res!174409 () Bool)

(assert (=> b!320169 (=> (not res!174409) (not e!198730))))

(declare-datatypes ((SeekEntryResult!2871 0))(
  ( (MissingZero!2871 (index!13660 (_ BitVec 32))) (Found!2871 (index!13661 (_ BitVec 32))) (Intermediate!2871 (undefined!3683 Bool) (index!13662 (_ BitVec 32)) (x!31932 (_ BitVec 32))) (Undefined!2871) (MissingVacant!2871 (index!13663 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16359 (_ BitVec 32)) SeekEntryResult!2871)

(assert (=> b!320169 (= res!174409 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2871 i!1250)))))

(declare-fun b!320170 () Bool)

(assert (=> b!320170 (= e!198730 false)))

(declare-fun lt!155991 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320170 (= lt!155991 (toIndex!0 k0!2497 mask!3777))))

(declare-fun res!174412 () Bool)

(assert (=> start!32124 (=> (not res!174412) (not e!198730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32124 (= res!174412 (validMask!0 mask!3777))))

(assert (=> start!32124 e!198730))

(assert (=> start!32124 true))

(declare-fun array_inv!5703 (array!16359) Bool)

(assert (=> start!32124 (array_inv!5703 a!3305)))

(declare-fun b!320171 () Bool)

(declare-fun res!174410 () Bool)

(assert (=> b!320171 (=> (not res!174410) (not e!198730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16359 (_ BitVec 32)) Bool)

(assert (=> b!320171 (= res!174410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32124 res!174412) b!320167))

(assert (= (and b!320167 res!174411) b!320168))

(assert (= (and b!320168 res!174414) b!320166))

(assert (= (and b!320166 res!174413) b!320169))

(assert (= (and b!320169 res!174409) b!320171))

(assert (= (and b!320171 res!174410) b!320170))

(declare-fun m!328585 () Bool)

(assert (=> b!320168 m!328585))

(declare-fun m!328587 () Bool)

(assert (=> b!320166 m!328587))

(declare-fun m!328589 () Bool)

(assert (=> b!320169 m!328589))

(declare-fun m!328591 () Bool)

(assert (=> b!320170 m!328591))

(declare-fun m!328593 () Bool)

(assert (=> start!32124 m!328593))

(declare-fun m!328595 () Bool)

(assert (=> start!32124 m!328595))

(declare-fun m!328597 () Bool)

(assert (=> b!320171 m!328597))

(check-sat (not b!320170) (not b!320168) (not b!320166) (not b!320171) (not b!320169) (not start!32124))
