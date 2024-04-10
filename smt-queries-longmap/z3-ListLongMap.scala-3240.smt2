; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45248 () Bool)

(assert start!45248)

(declare-fun b!496915 () Bool)

(declare-fun e!291339 () Bool)

(declare-fun e!291340 () Bool)

(assert (=> b!496915 (= e!291339 (not e!291340))))

(declare-fun res!299302 () Bool)

(assert (=> b!496915 (=> res!299302 e!291340)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32136 0))(
  ( (array!32137 (arr!15451 (Array (_ BitVec 32) (_ BitVec 64))) (size!15815 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32136)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224960 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3918 0))(
  ( (MissingZero!3918 (index!17851 (_ BitVec 32))) (Found!3918 (index!17852 (_ BitVec 32))) (Intermediate!3918 (undefined!4730 Bool) (index!17853 (_ BitVec 32)) (x!46906 (_ BitVec 32))) (Undefined!3918) (MissingVacant!3918 (index!17854 (_ BitVec 32))) )
))
(declare-fun lt!224959 () SeekEntryResult!3918)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32136 (_ BitVec 32)) SeekEntryResult!3918)

(assert (=> b!496915 (= res!299302 (= lt!224959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224960 (select (store (arr!15451 a!3235) i!1204 k0!2280) j!176) (array!32137 (store (arr!15451 a!3235) i!1204 k0!2280) (size!15815 a!3235)) mask!3524)))))

(declare-fun lt!224961 () (_ BitVec 32))

(assert (=> b!496915 (= lt!224959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224961 (select (arr!15451 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496915 (= lt!224960 (toIndex!0 (select (store (arr!15451 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496915 (= lt!224961 (toIndex!0 (select (arr!15451 a!3235) j!176) mask!3524))))

(declare-fun e!291341 () Bool)

(assert (=> b!496915 e!291341))

(declare-fun res!299308 () Bool)

(assert (=> b!496915 (=> (not res!299308) (not e!291341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32136 (_ BitVec 32)) Bool)

(assert (=> b!496915 (= res!299308 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14782 0))(
  ( (Unit!14783) )
))
(declare-fun lt!224962 () Unit!14782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14782)

(assert (=> b!496915 (= lt!224962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496916 () Bool)

(declare-fun res!299303 () Bool)

(declare-fun e!291342 () Bool)

(assert (=> b!496916 (=> (not res!299303) (not e!291342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496916 (= res!299303 (validKeyInArray!0 k0!2280))))

(declare-fun b!496917 () Bool)

(declare-fun res!299310 () Bool)

(assert (=> b!496917 (=> (not res!299310) (not e!291342))))

(declare-fun arrayContainsKey!0 (array!32136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496917 (= res!299310 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496918 () Bool)

(assert (=> b!496918 (= e!291342 e!291339)))

(declare-fun res!299309 () Bool)

(assert (=> b!496918 (=> (not res!299309) (not e!291339))))

(declare-fun lt!224958 () SeekEntryResult!3918)

(assert (=> b!496918 (= res!299309 (or (= lt!224958 (MissingZero!3918 i!1204)) (= lt!224958 (MissingVacant!3918 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32136 (_ BitVec 32)) SeekEntryResult!3918)

(assert (=> b!496918 (= lt!224958 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299312 () Bool)

(assert (=> start!45248 (=> (not res!299312) (not e!291342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45248 (= res!299312 (validMask!0 mask!3524))))

(assert (=> start!45248 e!291342))

(assert (=> start!45248 true))

(declare-fun array_inv!11247 (array!32136) Bool)

(assert (=> start!45248 (array_inv!11247 a!3235)))

(declare-fun b!496919 () Bool)

(declare-fun res!299307 () Bool)

(assert (=> b!496919 (=> (not res!299307) (not e!291342))))

(assert (=> b!496919 (= res!299307 (validKeyInArray!0 (select (arr!15451 a!3235) j!176)))))

(declare-fun b!496920 () Bool)

(assert (=> b!496920 (= e!291340 true)))

(assert (=> b!496920 (and (bvslt (x!46906 lt!224959) #b01111111111111111111111111111110) (or (= (select (arr!15451 a!3235) (index!17853 lt!224959)) (select (arr!15451 a!3235) j!176)) (= (select (arr!15451 a!3235) (index!17853 lt!224959)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15451 a!3235) (index!17853 lt!224959)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496921 () Bool)

(declare-fun res!299304 () Bool)

(assert (=> b!496921 (=> res!299304 e!291340)))

(get-info :version)

(assert (=> b!496921 (= res!299304 (or (undefined!4730 lt!224959) (not ((_ is Intermediate!3918) lt!224959))))))

(declare-fun b!496922 () Bool)

(declare-fun res!299305 () Bool)

(assert (=> b!496922 (=> (not res!299305) (not e!291342))))

(assert (=> b!496922 (= res!299305 (and (= (size!15815 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15815 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15815 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496923 () Bool)

(declare-fun res!299306 () Bool)

(assert (=> b!496923 (=> (not res!299306) (not e!291339))))

(assert (=> b!496923 (= res!299306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496924 () Bool)

(declare-fun res!299311 () Bool)

(assert (=> b!496924 (=> (not res!299311) (not e!291339))))

(declare-datatypes ((List!9609 0))(
  ( (Nil!9606) (Cons!9605 (h!10476 (_ BitVec 64)) (t!15837 List!9609)) )
))
(declare-fun arrayNoDuplicates!0 (array!32136 (_ BitVec 32) List!9609) Bool)

(assert (=> b!496924 (= res!299311 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9606))))

(declare-fun b!496925 () Bool)

(assert (=> b!496925 (= e!291341 (= (seekEntryOrOpen!0 (select (arr!15451 a!3235) j!176) a!3235 mask!3524) (Found!3918 j!176)))))

(assert (= (and start!45248 res!299312) b!496922))

(assert (= (and b!496922 res!299305) b!496919))

(assert (= (and b!496919 res!299307) b!496916))

(assert (= (and b!496916 res!299303) b!496917))

(assert (= (and b!496917 res!299310) b!496918))

(assert (= (and b!496918 res!299309) b!496923))

(assert (= (and b!496923 res!299306) b!496924))

(assert (= (and b!496924 res!299311) b!496915))

(assert (= (and b!496915 res!299308) b!496925))

(assert (= (and b!496915 (not res!299302)) b!496921))

(assert (= (and b!496921 (not res!299304)) b!496920))

(declare-fun m!478223 () Bool)

(assert (=> b!496915 m!478223))

(declare-fun m!478225 () Bool)

(assert (=> b!496915 m!478225))

(declare-fun m!478227 () Bool)

(assert (=> b!496915 m!478227))

(declare-fun m!478229 () Bool)

(assert (=> b!496915 m!478229))

(declare-fun m!478231 () Bool)

(assert (=> b!496915 m!478231))

(assert (=> b!496915 m!478227))

(declare-fun m!478233 () Bool)

(assert (=> b!496915 m!478233))

(assert (=> b!496915 m!478229))

(declare-fun m!478235 () Bool)

(assert (=> b!496915 m!478235))

(assert (=> b!496915 m!478229))

(declare-fun m!478237 () Bool)

(assert (=> b!496915 m!478237))

(assert (=> b!496915 m!478227))

(declare-fun m!478239 () Bool)

(assert (=> b!496915 m!478239))

(declare-fun m!478241 () Bool)

(assert (=> b!496917 m!478241))

(assert (=> b!496925 m!478229))

(assert (=> b!496925 m!478229))

(declare-fun m!478243 () Bool)

(assert (=> b!496925 m!478243))

(declare-fun m!478245 () Bool)

(assert (=> b!496924 m!478245))

(declare-fun m!478247 () Bool)

(assert (=> start!45248 m!478247))

(declare-fun m!478249 () Bool)

(assert (=> start!45248 m!478249))

(declare-fun m!478251 () Bool)

(assert (=> b!496920 m!478251))

(assert (=> b!496920 m!478229))

(assert (=> b!496919 m!478229))

(assert (=> b!496919 m!478229))

(declare-fun m!478253 () Bool)

(assert (=> b!496919 m!478253))

(declare-fun m!478255 () Bool)

(assert (=> b!496923 m!478255))

(declare-fun m!478257 () Bool)

(assert (=> b!496918 m!478257))

(declare-fun m!478259 () Bool)

(assert (=> b!496916 m!478259))

(check-sat (not start!45248) (not b!496916) (not b!496923) (not b!496918) (not b!496915) (not b!496917) (not b!496924) (not b!496925) (not b!496919))
