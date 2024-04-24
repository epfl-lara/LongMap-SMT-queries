; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32120 () Bool)

(assert start!32120)

(declare-fun b!320205 () Bool)

(declare-fun res!174504 () Bool)

(declare-fun e!198725 () Bool)

(assert (=> b!320205 (=> (not res!174504) (not e!198725))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320205 (= res!174504 (validKeyInArray!0 k0!2497))))

(declare-fun b!320206 () Bool)

(declare-fun res!174498 () Bool)

(assert (=> b!320206 (=> (not res!174498) (not e!198725))))

(declare-datatypes ((array!16368 0))(
  ( (array!16369 (arr!7744 (Array (_ BitVec 32) (_ BitVec 64))) (size!8096 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16368)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2840 0))(
  ( (MissingZero!2840 (index!13536 (_ BitVec 32))) (Found!2840 (index!13537 (_ BitVec 32))) (Intermediate!2840 (undefined!3652 Bool) (index!13538 (_ BitVec 32)) (x!31914 (_ BitVec 32))) (Undefined!2840) (MissingVacant!2840 (index!13539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16368 (_ BitVec 32)) SeekEntryResult!2840)

(assert (=> b!320206 (= res!174498 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2840 i!1250)))))

(declare-fun b!320207 () Bool)

(declare-fun res!174499 () Bool)

(assert (=> b!320207 (=> (not res!174499) (not e!198725))))

(declare-fun arrayContainsKey!0 (array!16368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320207 (= res!174499 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320208 () Bool)

(declare-fun res!174500 () Bool)

(assert (=> b!320208 (=> (not res!174500) (not e!198725))))

(assert (=> b!320208 (= res!174500 (and (= (size!8096 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8096 a!3305))))))

(declare-fun res!174501 () Bool)

(assert (=> start!32120 (=> (not res!174501) (not e!198725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32120 (= res!174501 (validMask!0 mask!3777))))

(assert (=> start!32120 e!198725))

(declare-fun array_inv!5694 (array!16368) Bool)

(assert (=> start!32120 (array_inv!5694 a!3305)))

(assert (=> start!32120 true))

(declare-fun b!320209 () Bool)

(declare-fun res!174503 () Bool)

(assert (=> b!320209 (=> (not res!174503) (not e!198725))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16368 (_ BitVec 32)) SeekEntryResult!2840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320209 (= res!174503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2840 false resIndex!58 resX!58)))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!320210 () Bool)

(assert (=> b!320210 (= e!198725 (and (= (select (arr!7744 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8096 a!3305)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320211 () Bool)

(declare-fun res!174502 () Bool)

(assert (=> b!320211 (=> (not res!174502) (not e!198725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16368 (_ BitVec 32)) Bool)

(assert (=> b!320211 (= res!174502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32120 res!174501) b!320208))

(assert (= (and b!320208 res!174500) b!320205))

(assert (= (and b!320205 res!174504) b!320207))

(assert (= (and b!320207 res!174499) b!320206))

(assert (= (and b!320206 res!174498) b!320211))

(assert (= (and b!320211 res!174502) b!320209))

(assert (= (and b!320209 res!174503) b!320210))

(declare-fun m!328837 () Bool)

(assert (=> b!320206 m!328837))

(declare-fun m!328839 () Bool)

(assert (=> b!320210 m!328839))

(declare-fun m!328841 () Bool)

(assert (=> b!320207 m!328841))

(declare-fun m!328843 () Bool)

(assert (=> b!320205 m!328843))

(declare-fun m!328845 () Bool)

(assert (=> b!320209 m!328845))

(assert (=> b!320209 m!328845))

(declare-fun m!328847 () Bool)

(assert (=> b!320209 m!328847))

(declare-fun m!328849 () Bool)

(assert (=> start!32120 m!328849))

(declare-fun m!328851 () Bool)

(assert (=> start!32120 m!328851))

(declare-fun m!328853 () Bool)

(assert (=> b!320211 m!328853))

(check-sat (not b!320211) (not b!320206) (not b!320207) (not b!320205) (not start!32120) (not b!320209))
(check-sat)
