; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32216 () Bool)

(assert start!32216)

(declare-fun b!320920 () Bool)

(declare-fun res!175095 () Bool)

(declare-fun e!198999 () Bool)

(assert (=> b!320920 (=> (not res!175095) (not e!198999))))

(declare-datatypes ((array!16419 0))(
  ( (array!16420 (arr!7768 (Array (_ BitVec 32) (_ BitVec 64))) (size!8120 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16419)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320920 (= res!175095 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175092 () Bool)

(assert (=> start!32216 (=> (not res!175092) (not e!198999))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32216 (= res!175092 (validMask!0 mask!3777))))

(assert (=> start!32216 e!198999))

(declare-fun array_inv!5718 (array!16419) Bool)

(assert (=> start!32216 (array_inv!5718 a!3305)))

(assert (=> start!32216 true))

(declare-fun b!320921 () Bool)

(declare-fun res!175094 () Bool)

(assert (=> b!320921 (=> (not res!175094) (not e!198999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16419 (_ BitVec 32)) Bool)

(assert (=> b!320921 (= res!175094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320922 () Bool)

(declare-fun res!175091 () Bool)

(declare-fun e!198997 () Bool)

(assert (=> b!320922 (=> (not res!175091) (not e!198997))))

(declare-datatypes ((SeekEntryResult!2864 0))(
  ( (MissingZero!2864 (index!13632 (_ BitVec 32))) (Found!2864 (index!13633 (_ BitVec 32))) (Intermediate!2864 (undefined!3676 Bool) (index!13634 (_ BitVec 32)) (x!32008 (_ BitVec 32))) (Undefined!2864) (MissingVacant!2864 (index!13635 (_ BitVec 32))) )
))
(declare-fun lt!156159 () SeekEntryResult!2864)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16419 (_ BitVec 32)) SeekEntryResult!2864)

(assert (=> b!320922 (= res!175091 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156159))))

(declare-fun b!320923 () Bool)

(assert (=> b!320923 (= e!198999 e!198997)))

(declare-fun res!175090 () Bool)

(assert (=> b!320923 (=> (not res!175090) (not e!198997))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320923 (= res!175090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156159))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320923 (= lt!156159 (Intermediate!2864 false resIndex!58 resX!58))))

(declare-fun b!320924 () Bool)

(declare-fun res!175098 () Bool)

(assert (=> b!320924 (=> (not res!175098) (not e!198997))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320924 (= res!175098 (and (= (select (arr!7768 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8120 a!3305))))))

(declare-fun b!320925 () Bool)

(declare-fun res!175097 () Bool)

(assert (=> b!320925 (=> (not res!175097) (not e!198999))))

(assert (=> b!320925 (= res!175097 (and (= (size!8120 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8120 a!3305))))))

(declare-fun b!320926 () Bool)

(declare-fun res!175093 () Bool)

(assert (=> b!320926 (=> (not res!175093) (not e!198999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320926 (= res!175093 (validKeyInArray!0 k0!2497))))

(declare-fun b!320927 () Bool)

(assert (=> b!320927 (= e!198997 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7768 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7768 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7768 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320928 () Bool)

(declare-fun res!175096 () Bool)

(assert (=> b!320928 (=> (not res!175096) (not e!198999))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16419 (_ BitVec 32)) SeekEntryResult!2864)

(assert (=> b!320928 (= res!175096 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2864 i!1250)))))

(assert (= (and start!32216 res!175092) b!320925))

(assert (= (and b!320925 res!175097) b!320926))

(assert (= (and b!320926 res!175093) b!320920))

(assert (= (and b!320920 res!175095) b!320928))

(assert (= (and b!320928 res!175096) b!320921))

(assert (= (and b!320921 res!175094) b!320923))

(assert (= (and b!320923 res!175090) b!320924))

(assert (= (and b!320924 res!175098) b!320922))

(assert (= (and b!320922 res!175091) b!320927))

(declare-fun m!329377 () Bool)

(assert (=> b!320922 m!329377))

(declare-fun m!329379 () Bool)

(assert (=> b!320924 m!329379))

(declare-fun m!329381 () Bool)

(assert (=> b!320921 m!329381))

(declare-fun m!329383 () Bool)

(assert (=> b!320926 m!329383))

(declare-fun m!329385 () Bool)

(assert (=> b!320923 m!329385))

(assert (=> b!320923 m!329385))

(declare-fun m!329387 () Bool)

(assert (=> b!320923 m!329387))

(declare-fun m!329389 () Bool)

(assert (=> start!32216 m!329389))

(declare-fun m!329391 () Bool)

(assert (=> start!32216 m!329391))

(declare-fun m!329393 () Bool)

(assert (=> b!320927 m!329393))

(declare-fun m!329395 () Bool)

(assert (=> b!320920 m!329395))

(declare-fun m!329397 () Bool)

(assert (=> b!320928 m!329397))

(check-sat (not b!320922) (not b!320926) (not b!320920) (not start!32216) (not b!320928) (not b!320923) (not b!320921))
(check-sat)
