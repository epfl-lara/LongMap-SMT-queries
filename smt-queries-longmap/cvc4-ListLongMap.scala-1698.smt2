; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31080 () Bool)

(assert start!31080)

(declare-fun b!312737 () Bool)

(declare-fun res!169191 () Bool)

(declare-fun e!194969 () Bool)

(assert (=> b!312737 (=> (not res!169191) (not e!194969))))

(declare-datatypes ((array!15982 0))(
  ( (array!15983 (arr!7573 (Array (_ BitVec 32) (_ BitVec 64))) (size!7925 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15982)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312737 (= res!169191 (and (= (size!7925 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7925 a!3293))))))

(declare-fun b!312738 () Bool)

(declare-fun res!169194 () Bool)

(assert (=> b!312738 (=> (not res!169194) (not e!194969))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312738 (= res!169194 (validKeyInArray!0 k!2441))))

(declare-fun b!312739 () Bool)

(declare-fun e!194967 () Bool)

(declare-fun e!194970 () Bool)

(assert (=> b!312739 (= e!194967 (not e!194970))))

(declare-fun res!169193 () Bool)

(assert (=> b!312739 (=> res!169193 e!194970)))

(declare-datatypes ((SeekEntryResult!2713 0))(
  ( (MissingZero!2713 (index!13028 (_ BitVec 32))) (Found!2713 (index!13029 (_ BitVec 32))) (Intermediate!2713 (undefined!3525 Bool) (index!13030 (_ BitVec 32)) (x!31230 (_ BitVec 32))) (Undefined!2713) (MissingVacant!2713 (index!13031 (_ BitVec 32))) )
))
(declare-fun lt!153273 () SeekEntryResult!2713)

(declare-fun lt!153272 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!153269 () SeekEntryResult!2713)

(assert (=> b!312739 (= res!169193 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153272 #b00000000000000000000000000000000) (bvsge lt!153272 (size!7925 a!3293)) (not (= lt!153273 lt!153269))))))

(declare-fun lt!153267 () SeekEntryResult!2713)

(declare-fun lt!153271 () SeekEntryResult!2713)

(assert (=> b!312739 (= lt!153267 lt!153271)))

(declare-fun lt!153268 () array!15982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15982 (_ BitVec 32)) SeekEntryResult!2713)

(assert (=> b!312739 (= lt!153271 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153272 k!2441 lt!153268 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312739 (= lt!153267 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153268 mask!3709))))

(assert (=> b!312739 (= lt!153268 (array!15983 (store (arr!7573 a!3293) i!1240 k!2441) (size!7925 a!3293)))))

(declare-fun lt!153270 () SeekEntryResult!2713)

(assert (=> b!312739 (= lt!153270 lt!153273)))

(assert (=> b!312739 (= lt!153273 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153272 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312739 (= lt!153272 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312740 () Bool)

(declare-fun res!169196 () Bool)

(assert (=> b!312740 (=> (not res!169196) (not e!194969))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15982 (_ BitVec 32)) SeekEntryResult!2713)

(assert (=> b!312740 (= res!169196 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2713 i!1240)))))

(declare-fun b!312741 () Bool)

(declare-fun res!169197 () Bool)

(assert (=> b!312741 (=> (not res!169197) (not e!194969))))

(declare-fun arrayContainsKey!0 (array!15982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312741 (= res!169197 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312742 () Bool)

(declare-fun e!194971 () Bool)

(assert (=> b!312742 (= e!194969 e!194971)))

(declare-fun res!169199 () Bool)

(assert (=> b!312742 (=> (not res!169199) (not e!194971))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312742 (= res!169199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153269))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312742 (= lt!153269 (Intermediate!2713 false resIndex!52 resX!52))))

(declare-fun b!312743 () Bool)

(assert (=> b!312743 (= e!194970 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!312743 (= lt!153271 lt!153273)))

(declare-datatypes ((Unit!9657 0))(
  ( (Unit!9658) )
))
(declare-fun lt!153266 () Unit!9657)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15982 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9657)

(assert (=> b!312743 (= lt!153266 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153272 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312744 () Bool)

(assert (=> b!312744 (= e!194971 e!194967)))

(declare-fun res!169200 () Bool)

(assert (=> b!312744 (=> (not res!169200) (not e!194967))))

(assert (=> b!312744 (= res!169200 (and (= lt!153270 lt!153269) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7573 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312744 (= lt!153270 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!169192 () Bool)

(assert (=> start!31080 (=> (not res!169192) (not e!194969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31080 (= res!169192 (validMask!0 mask!3709))))

(assert (=> start!31080 e!194969))

(declare-fun array_inv!5536 (array!15982) Bool)

(assert (=> start!31080 (array_inv!5536 a!3293)))

(assert (=> start!31080 true))

(declare-fun b!312745 () Bool)

(declare-fun res!169195 () Bool)

(assert (=> b!312745 (=> (not res!169195) (not e!194971))))

(assert (=> b!312745 (= res!169195 (and (= (select (arr!7573 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7925 a!3293))))))

(declare-fun b!312746 () Bool)

(declare-fun res!169198 () Bool)

(assert (=> b!312746 (=> (not res!169198) (not e!194969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15982 (_ BitVec 32)) Bool)

(assert (=> b!312746 (= res!169198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31080 res!169192) b!312737))

(assert (= (and b!312737 res!169191) b!312738))

(assert (= (and b!312738 res!169194) b!312741))

(assert (= (and b!312741 res!169197) b!312740))

(assert (= (and b!312740 res!169196) b!312746))

(assert (= (and b!312746 res!169198) b!312742))

(assert (= (and b!312742 res!169199) b!312745))

(assert (= (and b!312745 res!169195) b!312744))

(assert (= (and b!312744 res!169200) b!312739))

(assert (= (and b!312739 (not res!169193)) b!312743))

(declare-fun m!322861 () Bool)

(assert (=> b!312743 m!322861))

(declare-fun m!322863 () Bool)

(assert (=> b!312739 m!322863))

(declare-fun m!322865 () Bool)

(assert (=> b!312739 m!322865))

(declare-fun m!322867 () Bool)

(assert (=> b!312739 m!322867))

(declare-fun m!322869 () Bool)

(assert (=> b!312739 m!322869))

(declare-fun m!322871 () Bool)

(assert (=> b!312739 m!322871))

(declare-fun m!322873 () Bool)

(assert (=> b!312746 m!322873))

(declare-fun m!322875 () Bool)

(assert (=> b!312741 m!322875))

(declare-fun m!322877 () Bool)

(assert (=> b!312744 m!322877))

(declare-fun m!322879 () Bool)

(assert (=> b!312744 m!322879))

(declare-fun m!322881 () Bool)

(assert (=> b!312740 m!322881))

(declare-fun m!322883 () Bool)

(assert (=> start!31080 m!322883))

(declare-fun m!322885 () Bool)

(assert (=> start!31080 m!322885))

(declare-fun m!322887 () Bool)

(assert (=> b!312745 m!322887))

(declare-fun m!322889 () Bool)

(assert (=> b!312742 m!322889))

(assert (=> b!312742 m!322889))

(declare-fun m!322891 () Bool)

(assert (=> b!312742 m!322891))

(declare-fun m!322893 () Bool)

(assert (=> b!312738 m!322893))

(push 1)

(assert (not b!312739))

(assert (not b!312740))

(assert (not b!312738))

(assert (not b!312744))

(assert (not b!312746))

(assert (not start!31080))

(assert (not b!312741))

(assert (not b!312742))

(assert (not b!312743))

(check-sat)

