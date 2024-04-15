; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32444 () Bool)

(assert start!32444)

(declare-fun b!324048 () Bool)

(declare-fun res!177526 () Bool)

(declare-fun e!200068 () Bool)

(assert (=> b!324048 (=> (not res!177526) (not e!200068))))

(declare-datatypes ((array!16587 0))(
  ( (array!16588 (arr!7851 (Array (_ BitVec 32) (_ BitVec 64))) (size!8204 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16587)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16587 (_ BitVec 32)) Bool)

(assert (=> b!324048 (= res!177526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324049 () Bool)

(declare-fun e!200067 () Bool)

(assert (=> b!324049 (= e!200067 false)))

(declare-fun lt!156545 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324049 (= lt!156545 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324050 () Bool)

(declare-fun res!177531 () Bool)

(assert (=> b!324050 (=> (not res!177531) (not e!200068))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324050 (= res!177531 (validKeyInArray!0 k0!2497))))

(declare-fun b!324051 () Bool)

(declare-fun res!177528 () Bool)

(assert (=> b!324051 (=> (not res!177528) (not e!200067))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324051 (= res!177528 (and (= (select (arr!7851 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8204 a!3305))))))

(declare-fun b!324052 () Bool)

(declare-fun res!177532 () Bool)

(assert (=> b!324052 (=> (not res!177532) (not e!200068))))

(declare-datatypes ((SeekEntryResult!2981 0))(
  ( (MissingZero!2981 (index!14100 (_ BitVec 32))) (Found!2981 (index!14101 (_ BitVec 32))) (Intermediate!2981 (undefined!3793 Bool) (index!14102 (_ BitVec 32)) (x!32364 (_ BitVec 32))) (Undefined!2981) (MissingVacant!2981 (index!14103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16587 (_ BitVec 32)) SeekEntryResult!2981)

(assert (=> b!324052 (= res!177532 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2981 i!1250)))))

(declare-fun res!177529 () Bool)

(assert (=> start!32444 (=> (not res!177529) (not e!200068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32444 (= res!177529 (validMask!0 mask!3777))))

(assert (=> start!32444 e!200068))

(declare-fun array_inv!5823 (array!16587) Bool)

(assert (=> start!32444 (array_inv!5823 a!3305)))

(assert (=> start!32444 true))

(declare-fun b!324053 () Bool)

(declare-fun res!177530 () Bool)

(assert (=> b!324053 (=> (not res!177530) (not e!200067))))

(assert (=> b!324053 (= res!177530 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7851 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324054 () Bool)

(declare-fun res!177527 () Bool)

(assert (=> b!324054 (=> (not res!177527) (not e!200068))))

(assert (=> b!324054 (= res!177527 (and (= (size!8204 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8204 a!3305))))))

(declare-fun b!324055 () Bool)

(declare-fun res!177534 () Bool)

(assert (=> b!324055 (=> (not res!177534) (not e!200067))))

(declare-fun lt!156544 () SeekEntryResult!2981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16587 (_ BitVec 32)) SeekEntryResult!2981)

(assert (=> b!324055 (= res!177534 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156544))))

(declare-fun b!324056 () Bool)

(assert (=> b!324056 (= e!200068 e!200067)))

(declare-fun res!177525 () Bool)

(assert (=> b!324056 (=> (not res!177525) (not e!200067))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324056 (= res!177525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156544))))

(assert (=> b!324056 (= lt!156544 (Intermediate!2981 false resIndex!58 resX!58))))

(declare-fun b!324057 () Bool)

(declare-fun res!177533 () Bool)

(assert (=> b!324057 (=> (not res!177533) (not e!200068))))

(declare-fun arrayContainsKey!0 (array!16587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324057 (= res!177533 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32444 res!177529) b!324054))

(assert (= (and b!324054 res!177527) b!324050))

(assert (= (and b!324050 res!177531) b!324057))

(assert (= (and b!324057 res!177533) b!324052))

(assert (= (and b!324052 res!177532) b!324048))

(assert (= (and b!324048 res!177526) b!324056))

(assert (= (and b!324056 res!177525) b!324051))

(assert (= (and b!324051 res!177528) b!324055))

(assert (= (and b!324055 res!177534) b!324053))

(assert (= (and b!324053 res!177530) b!324049))

(declare-fun m!330661 () Bool)

(assert (=> b!324057 m!330661))

(declare-fun m!330663 () Bool)

(assert (=> b!324049 m!330663))

(declare-fun m!330665 () Bool)

(assert (=> b!324050 m!330665))

(declare-fun m!330667 () Bool)

(assert (=> b!324055 m!330667))

(declare-fun m!330669 () Bool)

(assert (=> b!324056 m!330669))

(assert (=> b!324056 m!330669))

(declare-fun m!330671 () Bool)

(assert (=> b!324056 m!330671))

(declare-fun m!330673 () Bool)

(assert (=> start!32444 m!330673))

(declare-fun m!330675 () Bool)

(assert (=> start!32444 m!330675))

(declare-fun m!330677 () Bool)

(assert (=> b!324052 m!330677))

(declare-fun m!330679 () Bool)

(assert (=> b!324048 m!330679))

(declare-fun m!330681 () Bool)

(assert (=> b!324051 m!330681))

(declare-fun m!330683 () Bool)

(assert (=> b!324053 m!330683))

(check-sat (not b!324052) (not start!32444) (not b!324048) (not b!324055) (not b!324057) (not b!324050) (not b!324049) (not b!324056))
(check-sat)
