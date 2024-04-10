; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32452 () Bool)

(assert start!32452)

(declare-fun b!324240 () Bool)

(declare-fun res!177573 () Bool)

(declare-fun e!200218 () Bool)

(assert (=> b!324240 (=> (not res!177573) (not e!200218))))

(declare-datatypes ((array!16591 0))(
  ( (array!16592 (arr!7853 (Array (_ BitVec 32) (_ BitVec 64))) (size!8205 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16591)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324240 (= res!177573 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!177575 () Bool)

(assert (=> start!32452 (=> (not res!177575) (not e!200218))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32452 (= res!177575 (validMask!0 mask!3777))))

(assert (=> start!32452 e!200218))

(declare-fun array_inv!5816 (array!16591) Bool)

(assert (=> start!32452 (array_inv!5816 a!3305)))

(assert (=> start!32452 true))

(declare-fun b!324241 () Bool)

(declare-fun res!177576 () Bool)

(declare-fun e!200217 () Bool)

(assert (=> b!324241 (=> (not res!177576) (not e!200217))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324241 (= res!177576 (and (= (select (arr!7853 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8205 a!3305))))))

(declare-fun b!324242 () Bool)

(declare-fun res!177572 () Bool)

(assert (=> b!324242 (=> (not res!177572) (not e!200218))))

(assert (=> b!324242 (= res!177572 (and (= (size!8205 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8205 a!3305))))))

(declare-fun b!324243 () Bool)

(declare-fun res!177577 () Bool)

(assert (=> b!324243 (=> (not res!177577) (not e!200218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16591 (_ BitVec 32)) Bool)

(assert (=> b!324243 (= res!177577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324244 () Bool)

(assert (=> b!324244 (= e!200218 e!200217)))

(declare-fun res!177574 () Bool)

(assert (=> b!324244 (=> (not res!177574) (not e!200217))))

(declare-datatypes ((SeekEntryResult!2984 0))(
  ( (MissingZero!2984 (index!14112 (_ BitVec 32))) (Found!2984 (index!14113 (_ BitVec 32))) (Intermediate!2984 (undefined!3796 Bool) (index!14114 (_ BitVec 32)) (x!32364 (_ BitVec 32))) (Undefined!2984) (MissingVacant!2984 (index!14115 (_ BitVec 32))) )
))
(declare-fun lt!156768 () SeekEntryResult!2984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16591 (_ BitVec 32)) SeekEntryResult!2984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324244 (= res!177574 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156768))))

(assert (=> b!324244 (= lt!156768 (Intermediate!2984 false resIndex!58 resX!58))))

(declare-fun b!324245 () Bool)

(assert (=> b!324245 (= e!200217 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7853 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!324246 () Bool)

(declare-fun res!177579 () Bool)

(assert (=> b!324246 (=> (not res!177579) (not e!200218))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16591 (_ BitVec 32)) SeekEntryResult!2984)

(assert (=> b!324246 (= res!177579 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2984 i!1250)))))

(declare-fun b!324247 () Bool)

(declare-fun res!177571 () Bool)

(assert (=> b!324247 (=> (not res!177571) (not e!200218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324247 (= res!177571 (validKeyInArray!0 k!2497))))

(declare-fun b!324248 () Bool)

(declare-fun res!177578 () Bool)

(assert (=> b!324248 (=> (not res!177578) (not e!200217))))

(assert (=> b!324248 (= res!177578 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156768))))

(assert (= (and start!32452 res!177575) b!324242))

(assert (= (and b!324242 res!177572) b!324247))

(assert (= (and b!324247 res!177571) b!324240))

(assert (= (and b!324240 res!177573) b!324246))

(assert (= (and b!324246 res!177579) b!324243))

(assert (= (and b!324243 res!177577) b!324244))

(assert (= (and b!324244 res!177574) b!324241))

(assert (= (and b!324241 res!177576) b!324248))

(assert (= (and b!324248 res!177578) b!324245))

(declare-fun m!331325 () Bool)

(assert (=> start!32452 m!331325))

(declare-fun m!331327 () Bool)

(assert (=> start!32452 m!331327))

(declare-fun m!331329 () Bool)

(assert (=> b!324240 m!331329))

(declare-fun m!331331 () Bool)

(assert (=> b!324246 m!331331))

(declare-fun m!331333 () Bool)

(assert (=> b!324248 m!331333))

(declare-fun m!331335 () Bool)

(assert (=> b!324243 m!331335))

(declare-fun m!331337 () Bool)

(assert (=> b!324247 m!331337))

(declare-fun m!331339 () Bool)

(assert (=> b!324245 m!331339))

(declare-fun m!331341 () Bool)

(assert (=> b!324241 m!331341))

(declare-fun m!331343 () Bool)

(assert (=> b!324244 m!331343))

(assert (=> b!324244 m!331343))

(declare-fun m!331345 () Bool)

(assert (=> b!324244 m!331345))

(push 1)

(assert (not b!324247))

(assert (not b!324244))

(assert (not start!32452))

(assert (not b!324248))

(assert (not b!324243))

