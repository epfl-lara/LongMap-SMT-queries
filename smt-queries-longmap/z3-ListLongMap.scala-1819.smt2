; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32708 () Bool)

(assert start!32708)

(declare-fun b!327078 () Bool)

(declare-fun res!180160 () Bool)

(declare-fun e!201200 () Bool)

(assert (=> b!327078 (=> (not res!180160) (not e!201200))))

(declare-datatypes ((array!16758 0))(
  ( (array!16759 (arr!7933 (Array (_ BitVec 32) (_ BitVec 64))) (size!8285 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16758)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327078 (= res!180160 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327079 () Bool)

(declare-fun res!180161 () Bool)

(declare-fun e!201201 () Bool)

(assert (=> b!327079 (=> (not res!180161) (not e!201201))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327079 (= res!180161 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7933 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327080 () Bool)

(declare-fun res!180167 () Bool)

(assert (=> b!327080 (=> (not res!180167) (not e!201200))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327080 (= res!180167 (and (= (size!8285 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8285 a!3305))))))

(declare-fun b!327081 () Bool)

(declare-fun res!180163 () Bool)

(assert (=> b!327081 (=> (not res!180163) (not e!201200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327081 (= res!180163 (validKeyInArray!0 k0!2497))))

(declare-fun res!180164 () Bool)

(assert (=> start!32708 (=> (not res!180164) (not e!201200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32708 (= res!180164 (validMask!0 mask!3777))))

(assert (=> start!32708 e!201200))

(declare-fun array_inv!5883 (array!16758) Bool)

(assert (=> start!32708 (array_inv!5883 a!3305)))

(assert (=> start!32708 true))

(declare-fun b!327082 () Bool)

(declare-fun res!180162 () Bool)

(assert (=> b!327082 (=> (not res!180162) (not e!201201))))

(declare-datatypes ((SeekEntryResult!3029 0))(
  ( (MissingZero!3029 (index!14292 (_ BitVec 32))) (Found!3029 (index!14293 (_ BitVec 32))) (Intermediate!3029 (undefined!3841 Bool) (index!14294 (_ BitVec 32)) (x!32640 (_ BitVec 32))) (Undefined!3029) (MissingVacant!3029 (index!14295 (_ BitVec 32))) )
))
(declare-fun lt!157482 () SeekEntryResult!3029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16758 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!327082 (= res!180162 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157482))))

(declare-fun b!327083 () Bool)

(assert (=> b!327083 (= e!201201 false)))

(declare-datatypes ((Unit!10126 0))(
  ( (Unit!10127) )
))
(declare-fun lt!157481 () Unit!10126)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16758 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10126)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327083 (= lt!157481 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327084 () Bool)

(declare-fun res!180166 () Bool)

(assert (=> b!327084 (=> (not res!180166) (not e!201200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16758 (_ BitVec 32)) Bool)

(assert (=> b!327084 (= res!180166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327085 () Bool)

(declare-fun res!180159 () Bool)

(assert (=> b!327085 (=> (not res!180159) (not e!201201))))

(assert (=> b!327085 (= res!180159 (and (= (select (arr!7933 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8285 a!3305))))))

(declare-fun b!327086 () Bool)

(assert (=> b!327086 (= e!201200 e!201201)))

(declare-fun res!180168 () Bool)

(assert (=> b!327086 (=> (not res!180168) (not e!201201))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327086 (= res!180168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157482))))

(assert (=> b!327086 (= lt!157482 (Intermediate!3029 false resIndex!58 resX!58))))

(declare-fun b!327087 () Bool)

(declare-fun res!180165 () Bool)

(assert (=> b!327087 (=> (not res!180165) (not e!201200))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16758 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!327087 (= res!180165 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3029 i!1250)))))

(assert (= (and start!32708 res!180164) b!327080))

(assert (= (and b!327080 res!180167) b!327081))

(assert (= (and b!327081 res!180163) b!327078))

(assert (= (and b!327078 res!180160) b!327087))

(assert (= (and b!327087 res!180165) b!327084))

(assert (= (and b!327084 res!180166) b!327086))

(assert (= (and b!327086 res!180168) b!327085))

(assert (= (and b!327085 res!180159) b!327082))

(assert (= (and b!327082 res!180162) b!327079))

(assert (= (and b!327079 res!180161) b!327083))

(declare-fun m!333781 () Bool)

(assert (=> b!327083 m!333781))

(assert (=> b!327083 m!333781))

(declare-fun m!333783 () Bool)

(assert (=> b!327083 m!333783))

(declare-fun m!333785 () Bool)

(assert (=> start!32708 m!333785))

(declare-fun m!333787 () Bool)

(assert (=> start!32708 m!333787))

(declare-fun m!333789 () Bool)

(assert (=> b!327087 m!333789))

(declare-fun m!333791 () Bool)

(assert (=> b!327081 m!333791))

(declare-fun m!333793 () Bool)

(assert (=> b!327082 m!333793))

(declare-fun m!333795 () Bool)

(assert (=> b!327079 m!333795))

(declare-fun m!333797 () Bool)

(assert (=> b!327078 m!333797))

(declare-fun m!333799 () Bool)

(assert (=> b!327086 m!333799))

(assert (=> b!327086 m!333799))

(declare-fun m!333801 () Bool)

(assert (=> b!327086 m!333801))

(declare-fun m!333803 () Bool)

(assert (=> b!327084 m!333803))

(declare-fun m!333805 () Bool)

(assert (=> b!327085 m!333805))

(check-sat (not b!327082) (not start!32708) (not b!327083) (not b!327081) (not b!327087) (not b!327086) (not b!327078) (not b!327084))
(check-sat)
