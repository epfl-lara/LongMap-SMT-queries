; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32250 () Bool)

(assert start!32250)

(declare-fun b!321229 () Bool)

(declare-fun res!175351 () Bool)

(declare-fun e!199108 () Bool)

(assert (=> b!321229 (=> (not res!175351) (not e!199108))))

(declare-datatypes ((array!16440 0))(
  ( (array!16441 (arr!7779 (Array (_ BitVec 32) (_ BitVec 64))) (size!8131 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16440)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2910 0))(
  ( (MissingZero!2910 (index!13816 (_ BitVec 32))) (Found!2910 (index!13817 (_ BitVec 32))) (Intermediate!2910 (undefined!3722 Bool) (index!13818 (_ BitVec 32)) (x!32081 (_ BitVec 32))) (Undefined!2910) (MissingVacant!2910 (index!13819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16440 (_ BitVec 32)) SeekEntryResult!2910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321229 (= res!175351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2910 false resIndex!58 resX!58)))))

(declare-fun b!321231 () Bool)

(declare-fun res!175353 () Bool)

(assert (=> b!321231 (=> (not res!175353) (not e!199108))))

(declare-fun arrayContainsKey!0 (array!16440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321231 (= res!175353 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321232 () Bool)

(declare-fun res!175352 () Bool)

(assert (=> b!321232 (=> (not res!175352) (not e!199108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16440 (_ BitVec 32)) Bool)

(assert (=> b!321232 (= res!175352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321233 () Bool)

(declare-fun res!175356 () Bool)

(assert (=> b!321233 (=> (not res!175356) (not e!199108))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321233 (= res!175356 (and (= (select (arr!7779 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8131 a!3305))))))

(declare-fun b!321234 () Bool)

(declare-fun res!175355 () Bool)

(assert (=> b!321234 (=> (not res!175355) (not e!199108))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16440 (_ BitVec 32)) SeekEntryResult!2910)

(assert (=> b!321234 (= res!175355 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2910 i!1250)))))

(declare-fun b!321230 () Bool)

(declare-fun res!175350 () Bool)

(assert (=> b!321230 (=> (not res!175350) (not e!199108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321230 (= res!175350 (validKeyInArray!0 k0!2497))))

(declare-fun res!175354 () Bool)

(assert (=> start!32250 (=> (not res!175354) (not e!199108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32250 (= res!175354 (validMask!0 mask!3777))))

(assert (=> start!32250 e!199108))

(declare-fun array_inv!5742 (array!16440) Bool)

(assert (=> start!32250 (array_inv!5742 a!3305)))

(assert (=> start!32250 true))

(declare-fun b!321235 () Bool)

(assert (=> b!321235 (= e!199108 false)))

(declare-fun lt!156171 () SeekEntryResult!2910)

(assert (=> b!321235 (= lt!156171 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!321236 () Bool)

(declare-fun res!175349 () Bool)

(assert (=> b!321236 (=> (not res!175349) (not e!199108))))

(assert (=> b!321236 (= res!175349 (and (= (size!8131 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8131 a!3305))))))

(assert (= (and start!32250 res!175354) b!321236))

(assert (= (and b!321236 res!175349) b!321230))

(assert (= (and b!321230 res!175350) b!321231))

(assert (= (and b!321231 res!175353) b!321234))

(assert (= (and b!321234 res!175355) b!321232))

(assert (= (and b!321232 res!175352) b!321229))

(assert (= (and b!321229 res!175351) b!321233))

(assert (= (and b!321233 res!175356) b!321235))

(declare-fun m!329413 () Bool)

(assert (=> b!321231 m!329413))

(declare-fun m!329415 () Bool)

(assert (=> b!321235 m!329415))

(declare-fun m!329417 () Bool)

(assert (=> start!32250 m!329417))

(declare-fun m!329419 () Bool)

(assert (=> start!32250 m!329419))

(declare-fun m!329421 () Bool)

(assert (=> b!321232 m!329421))

(declare-fun m!329423 () Bool)

(assert (=> b!321234 m!329423))

(declare-fun m!329425 () Bool)

(assert (=> b!321233 m!329425))

(declare-fun m!329427 () Bool)

(assert (=> b!321229 m!329427))

(assert (=> b!321229 m!329427))

(declare-fun m!329429 () Bool)

(assert (=> b!321229 m!329429))

(declare-fun m!329431 () Bool)

(assert (=> b!321230 m!329431))

(check-sat (not b!321231) (not b!321234) (not b!321235) (not b!321232) (not start!32250) (not b!321230) (not b!321229))
