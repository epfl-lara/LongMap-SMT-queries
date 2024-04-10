; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32510 () Bool)

(assert start!32510)

(declare-fun b!325103 () Bool)

(declare-fun res!178436 () Bool)

(declare-fun e!200478 () Bool)

(assert (=> b!325103 (=> (not res!178436) (not e!200478))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325103 (= res!178436 (validKeyInArray!0 k!2497))))

(declare-fun b!325104 () Bool)

(declare-fun res!178443 () Bool)

(assert (=> b!325104 (=> (not res!178443) (not e!200478))))

(declare-datatypes ((array!16649 0))(
  ( (array!16650 (arr!7882 (Array (_ BitVec 32) (_ BitVec 64))) (size!8234 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16649)

(declare-fun arrayContainsKey!0 (array!16649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325104 (= res!178443 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325105 () Bool)

(declare-fun res!178435 () Bool)

(declare-fun e!200477 () Bool)

(assert (=> b!325105 (=> (not res!178435) (not e!200477))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325105 (= res!178435 (and (= (select (arr!7882 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8234 a!3305))))))

(declare-fun b!325106 () Bool)

(declare-fun res!178439 () Bool)

(assert (=> b!325106 (=> (not res!178439) (not e!200478))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3013 0))(
  ( (MissingZero!3013 (index!14228 (_ BitVec 32))) (Found!3013 (index!14229 (_ BitVec 32))) (Intermediate!3013 (undefined!3825 Bool) (index!14230 (_ BitVec 32)) (x!32465 (_ BitVec 32))) (Undefined!3013) (MissingVacant!3013 (index!14231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16649 (_ BitVec 32)) SeekEntryResult!3013)

(assert (=> b!325106 (= res!178439 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3013 i!1250)))))

(declare-fun res!178438 () Bool)

(assert (=> start!32510 (=> (not res!178438) (not e!200478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32510 (= res!178438 (validMask!0 mask!3777))))

(assert (=> start!32510 e!200478))

(declare-fun array_inv!5845 (array!16649) Bool)

(assert (=> start!32510 (array_inv!5845 a!3305)))

(assert (=> start!32510 true))

(declare-fun b!325107 () Bool)

(assert (=> b!325107 (= e!200477 false)))

(declare-fun lt!156935 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325107 (= lt!156935 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325108 () Bool)

(declare-fun res!178437 () Bool)

(assert (=> b!325108 (=> (not res!178437) (not e!200477))))

(assert (=> b!325108 (= res!178437 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7882 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325109 () Bool)

(declare-fun res!178434 () Bool)

(assert (=> b!325109 (=> (not res!178434) (not e!200477))))

(declare-fun lt!156936 () SeekEntryResult!3013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16649 (_ BitVec 32)) SeekEntryResult!3013)

(assert (=> b!325109 (= res!178434 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156936))))

(declare-fun b!325110 () Bool)

(declare-fun res!178440 () Bool)

(assert (=> b!325110 (=> (not res!178440) (not e!200478))))

(assert (=> b!325110 (= res!178440 (and (= (size!8234 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8234 a!3305))))))

(declare-fun b!325111 () Bool)

(assert (=> b!325111 (= e!200478 e!200477)))

(declare-fun res!178441 () Bool)

(assert (=> b!325111 (=> (not res!178441) (not e!200477))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325111 (= res!178441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156936))))

(assert (=> b!325111 (= lt!156936 (Intermediate!3013 false resIndex!58 resX!58))))

(declare-fun b!325112 () Bool)

(declare-fun res!178442 () Bool)

(assert (=> b!325112 (=> (not res!178442) (not e!200478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16649 (_ BitVec 32)) Bool)

(assert (=> b!325112 (= res!178442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32510 res!178438) b!325110))

(assert (= (and b!325110 res!178440) b!325103))

(assert (= (and b!325103 res!178436) b!325104))

(assert (= (and b!325104 res!178443) b!325106))

(assert (= (and b!325106 res!178439) b!325112))

(assert (= (and b!325112 res!178442) b!325111))

(assert (= (and b!325111 res!178441) b!325105))

(assert (= (and b!325105 res!178435) b!325109))

(assert (= (and b!325109 res!178434) b!325108))

(assert (= (and b!325108 res!178437) b!325107))

(declare-fun m!332015 () Bool)

(assert (=> start!32510 m!332015))

(declare-fun m!332017 () Bool)

(assert (=> start!32510 m!332017))

(declare-fun m!332019 () Bool)

(assert (=> b!325109 m!332019))

(declare-fun m!332021 () Bool)

(assert (=> b!325107 m!332021))

(declare-fun m!332023 () Bool)

(assert (=> b!325104 m!332023))

(declare-fun m!332025 () Bool)

(assert (=> b!325103 m!332025))

(declare-fun m!332027 () Bool)

(assert (=> b!325108 m!332027))

(declare-fun m!332029 () Bool)

(assert (=> b!325112 m!332029))

(declare-fun m!332031 () Bool)

(assert (=> b!325106 m!332031))

(declare-fun m!332033 () Bool)

(assert (=> b!325105 m!332033))

(declare-fun m!332035 () Bool)

(assert (=> b!325111 m!332035))

(assert (=> b!325111 m!332035))

(declare-fun m!332037 () Bool)

(assert (=> b!325111 m!332037))

(push 1)

(assert (not start!32510))

