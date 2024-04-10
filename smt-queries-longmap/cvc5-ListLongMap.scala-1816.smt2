; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32704 () Bool)

(assert start!32704)

(declare-fun b!326861 () Bool)

(declare-fun res!179894 () Bool)

(declare-fun e!201153 () Bool)

(assert (=> b!326861 (=> (not res!179894) (not e!201153))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326861 (= res!179894 (validKeyInArray!0 k!2497))))

(declare-fun b!326863 () Bool)

(declare-fun res!179897 () Bool)

(assert (=> b!326863 (=> (not res!179897) (not e!201153))))

(declare-datatypes ((array!16741 0))(
  ( (array!16742 (arr!7925 (Array (_ BitVec 32) (_ BitVec 64))) (size!8277 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16741)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326863 (= res!179897 (and (= (size!8277 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8277 a!3305))))))

(declare-fun b!326864 () Bool)

(declare-fun e!201152 () Bool)

(assert (=> b!326864 (= e!201152 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((Unit!10146 0))(
  ( (Unit!10147) )
))
(declare-fun lt!157410 () Unit!10146)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16741 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10146)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326864 (= lt!157410 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326865 () Bool)

(declare-fun res!179893 () Bool)

(assert (=> b!326865 (=> (not res!179893) (not e!201153))))

(declare-datatypes ((SeekEntryResult!3056 0))(
  ( (MissingZero!3056 (index!14400 (_ BitVec 32))) (Found!3056 (index!14401 (_ BitVec 32))) (Intermediate!3056 (undefined!3868 Bool) (index!14402 (_ BitVec 32)) (x!32646 (_ BitVec 32))) (Undefined!3056) (MissingVacant!3056 (index!14403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16741 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!326865 (= res!179893 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3056 i!1250)))))

(declare-fun b!326866 () Bool)

(declare-fun res!179892 () Bool)

(assert (=> b!326866 (=> (not res!179892) (not e!201152))))

(assert (=> b!326866 (= res!179892 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7925 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326867 () Bool)

(declare-fun res!179901 () Bool)

(assert (=> b!326867 (=> (not res!179901) (not e!201152))))

(declare-fun lt!157409 () SeekEntryResult!3056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16741 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!326867 (= res!179901 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157409))))

(declare-fun b!326868 () Bool)

(assert (=> b!326868 (= e!201153 e!201152)))

(declare-fun res!179899 () Bool)

(assert (=> b!326868 (=> (not res!179899) (not e!201152))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326868 (= res!179899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157409))))

(assert (=> b!326868 (= lt!157409 (Intermediate!3056 false resIndex!58 resX!58))))

(declare-fun b!326862 () Bool)

(declare-fun res!179900 () Bool)

(assert (=> b!326862 (=> (not res!179900) (not e!201152))))

(assert (=> b!326862 (= res!179900 (and (= (select (arr!7925 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8277 a!3305))))))

(declare-fun res!179895 () Bool)

(assert (=> start!32704 (=> (not res!179895) (not e!201153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32704 (= res!179895 (validMask!0 mask!3777))))

(assert (=> start!32704 e!201153))

(declare-fun array_inv!5888 (array!16741) Bool)

(assert (=> start!32704 (array_inv!5888 a!3305)))

(assert (=> start!32704 true))

(declare-fun b!326869 () Bool)

(declare-fun res!179898 () Bool)

(assert (=> b!326869 (=> (not res!179898) (not e!201153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16741 (_ BitVec 32)) Bool)

(assert (=> b!326869 (= res!179898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326870 () Bool)

(declare-fun res!179896 () Bool)

(assert (=> b!326870 (=> (not res!179896) (not e!201153))))

(declare-fun arrayContainsKey!0 (array!16741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326870 (= res!179896 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32704 res!179895) b!326863))

(assert (= (and b!326863 res!179897) b!326861))

(assert (= (and b!326861 res!179894) b!326870))

(assert (= (and b!326870 res!179896) b!326865))

(assert (= (and b!326865 res!179893) b!326869))

(assert (= (and b!326869 res!179898) b!326868))

(assert (= (and b!326868 res!179899) b!326862))

(assert (= (and b!326862 res!179900) b!326867))

(assert (= (and b!326867 res!179901) b!326866))

(assert (= (and b!326866 res!179892) b!326864))

(declare-fun m!333353 () Bool)

(assert (=> b!326865 m!333353))

(declare-fun m!333355 () Bool)

(assert (=> b!326868 m!333355))

(assert (=> b!326868 m!333355))

(declare-fun m!333357 () Bool)

(assert (=> b!326868 m!333357))

(declare-fun m!333359 () Bool)

(assert (=> b!326862 m!333359))

(declare-fun m!333361 () Bool)

(assert (=> b!326869 m!333361))

(declare-fun m!333363 () Bool)

(assert (=> start!32704 m!333363))

(declare-fun m!333365 () Bool)

(assert (=> start!32704 m!333365))

(declare-fun m!333367 () Bool)

(assert (=> b!326861 m!333367))

(declare-fun m!333369 () Bool)

(assert (=> b!326867 m!333369))

(declare-fun m!333371 () Bool)

(assert (=> b!326866 m!333371))

(declare-fun m!333373 () Bool)

(assert (=> b!326864 m!333373))

(assert (=> b!326864 m!333373))

(declare-fun m!333375 () Bool)

(assert (=> b!326864 m!333375))

(declare-fun m!333377 () Bool)

(assert (=> b!326870 m!333377))

(push 1)

(assert (not b!326861))

(assert (not b!326870))

(assert (not start!32704))

(assert (not b!326869))

(assert (not b!326865))

(assert (not b!326868))

(assert (not b!326864))

(assert (not b!326867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

