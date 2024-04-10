; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32694 () Bool)

(assert start!32694)

(declare-fun b!326711 () Bool)

(declare-fun res!179743 () Bool)

(declare-fun e!201107 () Bool)

(assert (=> b!326711 (=> (not res!179743) (not e!201107))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326711 (= res!179743 (validKeyInArray!0 k0!2497))))

(declare-fun b!326712 () Bool)

(declare-fun res!179747 () Bool)

(declare-fun e!201108 () Bool)

(assert (=> b!326712 (=> (not res!179747) (not e!201108))))

(declare-datatypes ((array!16731 0))(
  ( (array!16732 (arr!7920 (Array (_ BitVec 32) (_ BitVec 64))) (size!8272 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16731)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326712 (= res!179747 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7920 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326714 () Bool)

(assert (=> b!326714 (= e!201107 e!201108)))

(declare-fun res!179745 () Bool)

(assert (=> b!326714 (=> (not res!179745) (not e!201108))))

(declare-datatypes ((SeekEntryResult!3051 0))(
  ( (MissingZero!3051 (index!14380 (_ BitVec 32))) (Found!3051 (index!14381 (_ BitVec 32))) (Intermediate!3051 (undefined!3863 Bool) (index!14382 (_ BitVec 32)) (x!32625 (_ BitVec 32))) (Undefined!3051) (MissingVacant!3051 (index!14383 (_ BitVec 32))) )
))
(declare-fun lt!157379 () SeekEntryResult!3051)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16731 (_ BitVec 32)) SeekEntryResult!3051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326714 (= res!179745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157379))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326714 (= lt!157379 (Intermediate!3051 false resIndex!58 resX!58))))

(declare-fun b!326715 () Bool)

(declare-fun res!179751 () Bool)

(assert (=> b!326715 (=> (not res!179751) (not e!201107))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326715 (= res!179751 (and (= (size!8272 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8272 a!3305))))))

(declare-fun b!326716 () Bool)

(declare-fun res!179748 () Bool)

(assert (=> b!326716 (=> (not res!179748) (not e!201107))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16731 (_ BitVec 32)) SeekEntryResult!3051)

(assert (=> b!326716 (= res!179748 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3051 i!1250)))))

(declare-fun b!326717 () Bool)

(declare-fun res!179742 () Bool)

(assert (=> b!326717 (=> (not res!179742) (not e!201108))))

(assert (=> b!326717 (= res!179742 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157379))))

(declare-fun b!326718 () Bool)

(declare-fun res!179749 () Bool)

(assert (=> b!326718 (=> (not res!179749) (not e!201107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16731 (_ BitVec 32)) Bool)

(assert (=> b!326718 (= res!179749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326719 () Bool)

(assert (=> b!326719 (= e!201108 false)))

(declare-datatypes ((Unit!10136 0))(
  ( (Unit!10137) )
))
(declare-fun lt!157380 () Unit!10136)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10136)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326719 (= lt!157380 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326720 () Bool)

(declare-fun res!179744 () Bool)

(assert (=> b!326720 (=> (not res!179744) (not e!201107))))

(declare-fun arrayContainsKey!0 (array!16731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326720 (= res!179744 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326713 () Bool)

(declare-fun res!179746 () Bool)

(assert (=> b!326713 (=> (not res!179746) (not e!201108))))

(assert (=> b!326713 (= res!179746 (and (= (select (arr!7920 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8272 a!3305))))))

(declare-fun res!179750 () Bool)

(assert (=> start!32694 (=> (not res!179750) (not e!201107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32694 (= res!179750 (validMask!0 mask!3777))))

(assert (=> start!32694 e!201107))

(declare-fun array_inv!5883 (array!16731) Bool)

(assert (=> start!32694 (array_inv!5883 a!3305)))

(assert (=> start!32694 true))

(assert (= (and start!32694 res!179750) b!326715))

(assert (= (and b!326715 res!179751) b!326711))

(assert (= (and b!326711 res!179743) b!326720))

(assert (= (and b!326720 res!179744) b!326716))

(assert (= (and b!326716 res!179748) b!326718))

(assert (= (and b!326718 res!179749) b!326714))

(assert (= (and b!326714 res!179745) b!326713))

(assert (= (and b!326713 res!179746) b!326717))

(assert (= (and b!326717 res!179742) b!326712))

(assert (= (and b!326712 res!179747) b!326719))

(declare-fun m!333223 () Bool)

(assert (=> b!326714 m!333223))

(assert (=> b!326714 m!333223))

(declare-fun m!333225 () Bool)

(assert (=> b!326714 m!333225))

(declare-fun m!333227 () Bool)

(assert (=> b!326720 m!333227))

(declare-fun m!333229 () Bool)

(assert (=> b!326719 m!333229))

(assert (=> b!326719 m!333229))

(declare-fun m!333231 () Bool)

(assert (=> b!326719 m!333231))

(declare-fun m!333233 () Bool)

(assert (=> b!326711 m!333233))

(declare-fun m!333235 () Bool)

(assert (=> b!326712 m!333235))

(declare-fun m!333237 () Bool)

(assert (=> b!326717 m!333237))

(declare-fun m!333239 () Bool)

(assert (=> start!32694 m!333239))

(declare-fun m!333241 () Bool)

(assert (=> start!32694 m!333241))

(declare-fun m!333243 () Bool)

(assert (=> b!326716 m!333243))

(declare-fun m!333245 () Bool)

(assert (=> b!326718 m!333245))

(declare-fun m!333247 () Bool)

(assert (=> b!326713 m!333247))

(check-sat (not b!326711) (not b!326720) (not start!32694) (not b!326716) (not b!326719) (not b!326718) (not b!326714) (not b!326717))
