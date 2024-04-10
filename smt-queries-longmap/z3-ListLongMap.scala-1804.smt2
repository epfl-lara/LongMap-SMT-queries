; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32526 () Bool)

(assert start!32526)

(declare-fun b!325343 () Bool)

(declare-fun res!178680 () Bool)

(declare-fun e!200549 () Bool)

(assert (=> b!325343 (=> (not res!178680) (not e!200549))))

(declare-datatypes ((array!16665 0))(
  ( (array!16666 (arr!7890 (Array (_ BitVec 32) (_ BitVec 64))) (size!8242 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16665)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3021 0))(
  ( (MissingZero!3021 (index!14260 (_ BitVec 32))) (Found!3021 (index!14261 (_ BitVec 32))) (Intermediate!3021 (undefined!3833 Bool) (index!14262 (_ BitVec 32)) (x!32497 (_ BitVec 32))) (Undefined!3021) (MissingVacant!3021 (index!14263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16665 (_ BitVec 32)) SeekEntryResult!3021)

(assert (=> b!325343 (= res!178680 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3021 i!1250)))))

(declare-fun b!325344 () Bool)

(declare-fun e!200550 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325344 (= e!200550 (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156983 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325344 (= lt!156983 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325345 () Bool)

(declare-fun res!178681 () Bool)

(assert (=> b!325345 (=> (not res!178681) (not e!200549))))

(declare-fun arrayContainsKey!0 (array!16665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325345 (= res!178681 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325346 () Bool)

(declare-fun res!178682 () Bool)

(assert (=> b!325346 (=> (not res!178682) (not e!200549))))

(assert (=> b!325346 (= res!178682 (and (= (size!8242 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8242 a!3305))))))

(declare-fun b!325347 () Bool)

(declare-fun res!178683 () Bool)

(assert (=> b!325347 (=> (not res!178683) (not e!200550))))

(declare-fun lt!156984 () SeekEntryResult!3021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16665 (_ BitVec 32)) SeekEntryResult!3021)

(assert (=> b!325347 (= res!178683 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156984))))

(declare-fun b!325348 () Bool)

(declare-fun res!178675 () Bool)

(assert (=> b!325348 (=> (not res!178675) (not e!200550))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325348 (= res!178675 (and (= (select (arr!7890 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8242 a!3305))))))

(declare-fun res!178679 () Bool)

(assert (=> start!32526 (=> (not res!178679) (not e!200549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32526 (= res!178679 (validMask!0 mask!3777))))

(assert (=> start!32526 e!200549))

(declare-fun array_inv!5853 (array!16665) Bool)

(assert (=> start!32526 (array_inv!5853 a!3305)))

(assert (=> start!32526 true))

(declare-fun b!325349 () Bool)

(assert (=> b!325349 (= e!200549 e!200550)))

(declare-fun res!178678 () Bool)

(assert (=> b!325349 (=> (not res!178678) (not e!200550))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325349 (= res!178678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156984))))

(assert (=> b!325349 (= lt!156984 (Intermediate!3021 false resIndex!58 resX!58))))

(declare-fun b!325350 () Bool)

(declare-fun res!178676 () Bool)

(assert (=> b!325350 (=> (not res!178676) (not e!200549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16665 (_ BitVec 32)) Bool)

(assert (=> b!325350 (= res!178676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325351 () Bool)

(declare-fun res!178677 () Bool)

(assert (=> b!325351 (=> (not res!178677) (not e!200550))))

(assert (=> b!325351 (= res!178677 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7890 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325352 () Bool)

(declare-fun res!178674 () Bool)

(assert (=> b!325352 (=> (not res!178674) (not e!200549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325352 (= res!178674 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32526 res!178679) b!325346))

(assert (= (and b!325346 res!178682) b!325352))

(assert (= (and b!325352 res!178674) b!325345))

(assert (= (and b!325345 res!178681) b!325343))

(assert (= (and b!325343 res!178680) b!325350))

(assert (= (and b!325350 res!178676) b!325349))

(assert (= (and b!325349 res!178678) b!325348))

(assert (= (and b!325348 res!178675) b!325347))

(assert (= (and b!325347 res!178683) b!325351))

(assert (= (and b!325351 res!178677) b!325344))

(declare-fun m!332207 () Bool)

(assert (=> b!325351 m!332207))

(declare-fun m!332209 () Bool)

(assert (=> b!325344 m!332209))

(declare-fun m!332211 () Bool)

(assert (=> b!325349 m!332211))

(assert (=> b!325349 m!332211))

(declare-fun m!332213 () Bool)

(assert (=> b!325349 m!332213))

(declare-fun m!332215 () Bool)

(assert (=> start!32526 m!332215))

(declare-fun m!332217 () Bool)

(assert (=> start!32526 m!332217))

(declare-fun m!332219 () Bool)

(assert (=> b!325345 m!332219))

(declare-fun m!332221 () Bool)

(assert (=> b!325343 m!332221))

(declare-fun m!332223 () Bool)

(assert (=> b!325350 m!332223))

(declare-fun m!332225 () Bool)

(assert (=> b!325347 m!332225))

(declare-fun m!332227 () Bool)

(assert (=> b!325348 m!332227))

(declare-fun m!332229 () Bool)

(assert (=> b!325352 m!332229))

(check-sat (not b!325349) (not b!325352) (not start!32526) (not b!325344) (not b!325345) (not b!325347) (not b!325350) (not b!325343))
(check-sat)
