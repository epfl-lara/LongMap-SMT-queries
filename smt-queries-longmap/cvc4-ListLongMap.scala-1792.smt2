; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32456 () Bool)

(assert start!32456)

(declare-fun b!324294 () Bool)

(declare-fun e!200236 () Bool)

(declare-fun e!200235 () Bool)

(assert (=> b!324294 (= e!200236 e!200235)))

(declare-fun res!177632 () Bool)

(assert (=> b!324294 (=> (not res!177632) (not e!200235))))

(declare-datatypes ((array!16595 0))(
  ( (array!16596 (arr!7855 (Array (_ BitVec 32) (_ BitVec 64))) (size!8207 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16595)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2986 0))(
  ( (MissingZero!2986 (index!14120 (_ BitVec 32))) (Found!2986 (index!14121 (_ BitVec 32))) (Intermediate!2986 (undefined!3798 Bool) (index!14122 (_ BitVec 32)) (x!32366 (_ BitVec 32))) (Undefined!2986) (MissingVacant!2986 (index!14123 (_ BitVec 32))) )
))
(declare-fun lt!156774 () SeekEntryResult!2986)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16595 (_ BitVec 32)) SeekEntryResult!2986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324294 (= res!177632 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156774))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324294 (= lt!156774 (Intermediate!2986 false resIndex!58 resX!58))))

(declare-fun b!324295 () Bool)

(declare-fun res!177628 () Bool)

(assert (=> b!324295 (=> (not res!177628) (not e!200236))))

(declare-fun arrayContainsKey!0 (array!16595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324295 (= res!177628 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324296 () Bool)

(declare-fun res!177626 () Bool)

(assert (=> b!324296 (=> (not res!177626) (not e!200236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16595 (_ BitVec 32)) Bool)

(assert (=> b!324296 (= res!177626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324297 () Bool)

(declare-fun res!177627 () Bool)

(assert (=> b!324297 (=> (not res!177627) (not e!200236))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324297 (= res!177627 (and (= (size!8207 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8207 a!3305))))))

(declare-fun res!177629 () Bool)

(assert (=> start!32456 (=> (not res!177629) (not e!200236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32456 (= res!177629 (validMask!0 mask!3777))))

(assert (=> start!32456 e!200236))

(declare-fun array_inv!5818 (array!16595) Bool)

(assert (=> start!32456 (array_inv!5818 a!3305)))

(assert (=> start!32456 true))

(declare-fun b!324298 () Bool)

(declare-fun res!177633 () Bool)

(assert (=> b!324298 (=> (not res!177633) (not e!200235))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324298 (= res!177633 (and (= (select (arr!7855 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8207 a!3305))))))

(declare-fun b!324299 () Bool)

(declare-fun res!177625 () Bool)

(assert (=> b!324299 (=> (not res!177625) (not e!200236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324299 (= res!177625 (validKeyInArray!0 k!2497))))

(declare-fun b!324300 () Bool)

(assert (=> b!324300 (= e!200235 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7855 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!324301 () Bool)

(declare-fun res!177630 () Bool)

(assert (=> b!324301 (=> (not res!177630) (not e!200236))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16595 (_ BitVec 32)) SeekEntryResult!2986)

(assert (=> b!324301 (= res!177630 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2986 i!1250)))))

(declare-fun b!324302 () Bool)

(declare-fun res!177631 () Bool)

(assert (=> b!324302 (=> (not res!177631) (not e!200235))))

(assert (=> b!324302 (= res!177631 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156774))))

(assert (= (and start!32456 res!177629) b!324297))

(assert (= (and b!324297 res!177627) b!324299))

(assert (= (and b!324299 res!177625) b!324295))

(assert (= (and b!324295 res!177628) b!324301))

(assert (= (and b!324301 res!177630) b!324296))

(assert (= (and b!324296 res!177626) b!324294))

(assert (= (and b!324294 res!177632) b!324298))

(assert (= (and b!324298 res!177633) b!324302))

(assert (= (and b!324302 res!177631) b!324300))

(declare-fun m!331369 () Bool)

(assert (=> start!32456 m!331369))

(declare-fun m!331371 () Bool)

(assert (=> start!32456 m!331371))

(declare-fun m!331373 () Bool)

(assert (=> b!324296 m!331373))

(declare-fun m!331375 () Bool)

(assert (=> b!324298 m!331375))

(declare-fun m!331377 () Bool)

(assert (=> b!324300 m!331377))

(declare-fun m!331379 () Bool)

(assert (=> b!324301 m!331379))

(declare-fun m!331381 () Bool)

(assert (=> b!324302 m!331381))

(declare-fun m!331383 () Bool)

(assert (=> b!324295 m!331383))

(declare-fun m!331385 () Bool)

(assert (=> b!324299 m!331385))

(declare-fun m!331387 () Bool)

(assert (=> b!324294 m!331387))

(assert (=> b!324294 m!331387))

(declare-fun m!331389 () Bool)

(assert (=> b!324294 m!331389))

(push 1)

(assert (not b!324295))

(assert (not b!324299))

(assert (not b!324302))

(assert (not b!324294))

(assert (not b!324296))

(assert (not b!324301))

(assert (not start!32456))

(check-sat)

(pop 1)

