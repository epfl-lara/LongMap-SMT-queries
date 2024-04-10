; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32062 () Bool)

(assert start!32062)

(declare-fun b!319878 () Bool)

(declare-fun res!174192 () Bool)

(declare-fun e!198597 () Bool)

(assert (=> b!319878 (=> (not res!174192) (not e!198597))))

(declare-datatypes ((array!16336 0))(
  ( (array!16337 (arr!7730 (Array (_ BitVec 32) (_ BitVec 64))) (size!8082 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16336)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2861 0))(
  ( (MissingZero!2861 (index!13620 (_ BitVec 32))) (Found!2861 (index!13621 (_ BitVec 32))) (Intermediate!2861 (undefined!3673 Bool) (index!13622 (_ BitVec 32)) (x!31895 (_ BitVec 32))) (Undefined!2861) (MissingVacant!2861 (index!13623 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16336 (_ BitVec 32)) SeekEntryResult!2861)

(assert (=> b!319878 (= res!174192 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2861 i!1250)))))

(declare-fun res!174193 () Bool)

(assert (=> start!32062 (=> (not res!174193) (not e!198597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32062 (= res!174193 (validMask!0 mask!3777))))

(assert (=> start!32062 e!198597))

(assert (=> start!32062 true))

(declare-fun array_inv!5693 (array!16336) Bool)

(assert (=> start!32062 (array_inv!5693 a!3305)))

(declare-fun b!319879 () Bool)

(declare-fun res!174190 () Bool)

(assert (=> b!319879 (=> (not res!174190) (not e!198597))))

(assert (=> b!319879 (= res!174190 (and (= (size!8082 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8082 a!3305))))))

(declare-fun b!319880 () Bool)

(declare-fun res!174194 () Bool)

(assert (=> b!319880 (=> (not res!174194) (not e!198597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319880 (= res!174194 (validKeyInArray!0 k!2497))))

(declare-fun b!319881 () Bool)

(assert (=> b!319881 (= e!198597 false)))

(declare-fun lt!155889 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319881 (= lt!155889 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319882 () Bool)

(declare-fun res!174195 () Bool)

(assert (=> b!319882 (=> (not res!174195) (not e!198597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16336 (_ BitVec 32)) Bool)

(assert (=> b!319882 (= res!174195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319883 () Bool)

(declare-fun res!174191 () Bool)

(assert (=> b!319883 (=> (not res!174191) (not e!198597))))

(declare-fun arrayContainsKey!0 (array!16336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319883 (= res!174191 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32062 res!174193) b!319879))

(assert (= (and b!319879 res!174190) b!319880))

(assert (= (and b!319880 res!174194) b!319883))

(assert (= (and b!319883 res!174191) b!319878))

(assert (= (and b!319878 res!174192) b!319882))

(assert (= (and b!319882 res!174195) b!319881))

(declare-fun m!328367 () Bool)

(assert (=> b!319881 m!328367))

(declare-fun m!328369 () Bool)

(assert (=> b!319883 m!328369))

(declare-fun m!328371 () Bool)

(assert (=> b!319878 m!328371))

(declare-fun m!328373 () Bool)

(assert (=> b!319882 m!328373))

(declare-fun m!328375 () Bool)

(assert (=> start!32062 m!328375))

(declare-fun m!328377 () Bool)

(assert (=> start!32062 m!328377))

(declare-fun m!328379 () Bool)

(assert (=> b!319880 m!328379))

(push 1)

(assert (not b!319883))

(assert (not b!319881))

(assert (not b!319882))

(assert (not start!32062))

(assert (not b!319878))

(assert (not b!319880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

