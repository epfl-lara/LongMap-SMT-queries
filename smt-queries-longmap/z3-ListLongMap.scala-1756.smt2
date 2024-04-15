; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32120 () Bool)

(assert start!32120)

(declare-fun b!319983 () Bool)

(declare-fun res!174373 () Bool)

(declare-fun e!198584 () Bool)

(assert (=> b!319983 (=> (not res!174373) (not e!198584))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319983 (= res!174373 (validKeyInArray!0 k0!2497))))

(declare-fun b!319984 () Bool)

(declare-fun res!174376 () Bool)

(assert (=> b!319984 (=> (not res!174376) (not e!198584))))

(declare-datatypes ((array!16359 0))(
  ( (array!16360 (arr!7740 (Array (_ BitVec 32) (_ BitVec 64))) (size!8093 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16359)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2870 0))(
  ( (MissingZero!2870 (index!13656 (_ BitVec 32))) (Found!2870 (index!13657 (_ BitVec 32))) (Intermediate!2870 (undefined!3682 Bool) (index!13658 (_ BitVec 32)) (x!31942 (_ BitVec 32))) (Undefined!2870) (MissingVacant!2870 (index!13659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16359 (_ BitVec 32)) SeekEntryResult!2870)

(assert (=> b!319984 (= res!174376 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2870 i!1250)))))

(declare-fun b!319985 () Bool)

(declare-fun res!174378 () Bool)

(assert (=> b!319985 (=> (not res!174378) (not e!198584))))

(declare-fun arrayContainsKey!0 (array!16359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319985 (= res!174378 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319986 () Bool)

(declare-fun res!174377 () Bool)

(assert (=> b!319986 (=> (not res!174377) (not e!198584))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16359 (_ BitVec 32)) SeekEntryResult!2870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319986 (= res!174377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2870 false resIndex!58 resX!58)))))

(declare-fun b!319987 () Bool)

(declare-fun res!174374 () Bool)

(assert (=> b!319987 (=> (not res!174374) (not e!198584))))

(assert (=> b!319987 (= res!174374 (and (= (size!8093 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8093 a!3305))))))

(declare-fun res!174372 () Bool)

(assert (=> start!32120 (=> (not res!174372) (not e!198584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32120 (= res!174372 (validMask!0 mask!3777))))

(assert (=> start!32120 e!198584))

(declare-fun array_inv!5712 (array!16359) Bool)

(assert (=> start!32120 (array_inv!5712 a!3305)))

(assert (=> start!32120 true))

(declare-fun b!319988 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!319988 (= e!198584 (and (= (select (arr!7740 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8093 a!3305)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!319989 () Bool)

(declare-fun res!174375 () Bool)

(assert (=> b!319989 (=> (not res!174375) (not e!198584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16359 (_ BitVec 32)) Bool)

(assert (=> b!319989 (= res!174375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32120 res!174372) b!319987))

(assert (= (and b!319987 res!174374) b!319983))

(assert (= (and b!319983 res!174373) b!319985))

(assert (= (and b!319985 res!174378) b!319984))

(assert (= (and b!319984 res!174376) b!319989))

(assert (= (and b!319989 res!174375) b!319986))

(assert (= (and b!319986 res!174377) b!319988))

(declare-fun m!327931 () Bool)

(assert (=> b!319989 m!327931))

(declare-fun m!327933 () Bool)

(assert (=> b!319986 m!327933))

(assert (=> b!319986 m!327933))

(declare-fun m!327935 () Bool)

(assert (=> b!319986 m!327935))

(declare-fun m!327937 () Bool)

(assert (=> b!319983 m!327937))

(declare-fun m!327939 () Bool)

(assert (=> b!319985 m!327939))

(declare-fun m!327941 () Bool)

(assert (=> b!319988 m!327941))

(declare-fun m!327943 () Bool)

(assert (=> b!319984 m!327943))

(declare-fun m!327945 () Bool)

(assert (=> start!32120 m!327945))

(declare-fun m!327947 () Bool)

(assert (=> start!32120 m!327947))

(check-sat (not b!319984) (not b!319986) (not b!319989) (not b!319985) (not start!32120) (not b!319983))
(check-sat)
