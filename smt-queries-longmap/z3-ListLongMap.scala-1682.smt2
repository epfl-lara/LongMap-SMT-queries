; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30982 () Bool)

(assert start!30982)

(declare-fun lt!152286 () (_ BitVec 32))

(declare-fun e!194236 () Bool)

(declare-fun b!311267 () Bool)

(declare-datatypes ((array!15884 0))(
  ( (array!15885 (arr!7524 (Array (_ BitVec 32) (_ BitVec 64))) (size!7876 (_ BitVec 32))) )
))
(declare-fun lt!152287 () array!15884)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2664 0))(
  ( (MissingZero!2664 (index!12832 (_ BitVec 32))) (Found!2664 (index!12833 (_ BitVec 32))) (Intermediate!2664 (undefined!3476 Bool) (index!12834 (_ BitVec 32)) (x!31053 (_ BitVec 32))) (Undefined!2664) (MissingVacant!2664 (index!12835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15884 (_ BitVec 32)) SeekEntryResult!2664)

(assert (=> b!311267 (= e!194236 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152287 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152286 k0!2441 lt!152287 mask!3709)))))

(declare-fun a!3293 () array!15884)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311267 (= lt!152287 (array!15885 (store (arr!7524 a!3293) i!1240 k0!2441) (size!7876 a!3293)))))

(declare-fun b!311268 () Bool)

(declare-fun res!167726 () Bool)

(declare-fun e!194233 () Bool)

(assert (=> b!311268 (=> (not res!167726) (not e!194233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15884 (_ BitVec 32)) Bool)

(assert (=> b!311268 (= res!167726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311269 () Bool)

(declare-fun e!194234 () Bool)

(declare-fun e!194232 () Bool)

(assert (=> b!311269 (= e!194234 e!194232)))

(declare-fun res!167728 () Bool)

(assert (=> b!311269 (=> (not res!167728) (not e!194232))))

(declare-fun lt!152289 () SeekEntryResult!2664)

(declare-fun lt!152288 () SeekEntryResult!2664)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311269 (= res!167728 (and (= lt!152289 lt!152288) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7524 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311269 (= lt!152289 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311271 () Bool)

(assert (=> b!311271 (= e!194233 e!194234)))

(declare-fun res!167725 () Bool)

(assert (=> b!311271 (=> (not res!167725) (not e!194234))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311271 (= res!167725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152288))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311271 (= lt!152288 (Intermediate!2664 false resIndex!52 resX!52))))

(declare-fun b!311272 () Bool)

(declare-fun res!167721 () Bool)

(assert (=> b!311272 (=> (not res!167721) (not e!194233))))

(declare-fun arrayContainsKey!0 (array!15884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311272 (= res!167721 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311273 () Bool)

(declare-fun res!167724 () Bool)

(assert (=> b!311273 (=> (not res!167724) (not e!194234))))

(assert (=> b!311273 (= res!167724 (and (= (select (arr!7524 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7876 a!3293))))))

(declare-fun b!311274 () Bool)

(declare-fun res!167723 () Bool)

(assert (=> b!311274 (=> (not res!167723) (not e!194233))))

(assert (=> b!311274 (= res!167723 (and (= (size!7876 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7876 a!3293))))))

(declare-fun b!311275 () Bool)

(assert (=> b!311275 (= e!194232 (not true))))

(assert (=> b!311275 e!194236))

(declare-fun res!167727 () Bool)

(assert (=> b!311275 (=> (not res!167727) (not e!194236))))

(assert (=> b!311275 (= res!167727 (= lt!152289 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152286 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311275 (= lt!152286 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311276 () Bool)

(declare-fun res!167722 () Bool)

(assert (=> b!311276 (=> (not res!167722) (not e!194233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311276 (= res!167722 (validKeyInArray!0 k0!2441))))

(declare-fun b!311270 () Bool)

(declare-fun res!167729 () Bool)

(assert (=> b!311270 (=> (not res!167729) (not e!194233))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15884 (_ BitVec 32)) SeekEntryResult!2664)

(assert (=> b!311270 (= res!167729 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2664 i!1240)))))

(declare-fun res!167730 () Bool)

(assert (=> start!30982 (=> (not res!167730) (not e!194233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30982 (= res!167730 (validMask!0 mask!3709))))

(assert (=> start!30982 e!194233))

(declare-fun array_inv!5487 (array!15884) Bool)

(assert (=> start!30982 (array_inv!5487 a!3293)))

(assert (=> start!30982 true))

(assert (= (and start!30982 res!167730) b!311274))

(assert (= (and b!311274 res!167723) b!311276))

(assert (= (and b!311276 res!167722) b!311272))

(assert (= (and b!311272 res!167721) b!311270))

(assert (= (and b!311270 res!167729) b!311268))

(assert (= (and b!311268 res!167726) b!311271))

(assert (= (and b!311271 res!167725) b!311273))

(assert (= (and b!311273 res!167724) b!311269))

(assert (= (and b!311269 res!167728) b!311275))

(assert (= (and b!311275 res!167727) b!311267))

(declare-fun m!321229 () Bool)

(assert (=> b!311273 m!321229))

(declare-fun m!321231 () Bool)

(assert (=> b!311267 m!321231))

(declare-fun m!321233 () Bool)

(assert (=> b!311267 m!321233))

(declare-fun m!321235 () Bool)

(assert (=> b!311267 m!321235))

(declare-fun m!321237 () Bool)

(assert (=> b!311272 m!321237))

(declare-fun m!321239 () Bool)

(assert (=> start!30982 m!321239))

(declare-fun m!321241 () Bool)

(assert (=> start!30982 m!321241))

(declare-fun m!321243 () Bool)

(assert (=> b!311275 m!321243))

(declare-fun m!321245 () Bool)

(assert (=> b!311275 m!321245))

(declare-fun m!321247 () Bool)

(assert (=> b!311269 m!321247))

(declare-fun m!321249 () Bool)

(assert (=> b!311269 m!321249))

(declare-fun m!321251 () Bool)

(assert (=> b!311268 m!321251))

(declare-fun m!321253 () Bool)

(assert (=> b!311270 m!321253))

(declare-fun m!321255 () Bool)

(assert (=> b!311271 m!321255))

(assert (=> b!311271 m!321255))

(declare-fun m!321257 () Bool)

(assert (=> b!311271 m!321257))

(declare-fun m!321259 () Bool)

(assert (=> b!311276 m!321259))

(check-sat (not b!311267) (not b!311270) (not b!311275) (not b!311268) (not b!311272) (not start!30982) (not b!311271) (not b!311269) (not b!311276))
(check-sat)
