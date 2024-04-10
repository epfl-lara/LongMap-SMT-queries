; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45452 () Bool)

(assert start!45452)

(declare-fun b!500133 () Bool)

(declare-fun res!302005 () Bool)

(declare-fun e!293041 () Bool)

(assert (=> b!500133 (=> (not res!302005) (not e!293041))))

(declare-datatypes ((array!32277 0))(
  ( (array!32278 (arr!15520 (Array (_ BitVec 32) (_ BitVec 64))) (size!15884 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32277)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500133 (= res!302005 (validKeyInArray!0 (select (arr!15520 a!3235) j!176)))))

(declare-fun b!500134 () Bool)

(declare-fun res!302007 () Bool)

(assert (=> b!500134 (=> (not res!302007) (not e!293041))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500134 (= res!302007 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!500135 () Bool)

(declare-fun e!293040 () Bool)

(declare-datatypes ((SeekEntryResult!3987 0))(
  ( (MissingZero!3987 (index!18130 (_ BitVec 32))) (Found!3987 (index!18131 (_ BitVec 32))) (Intermediate!3987 (undefined!4799 Bool) (index!18132 (_ BitVec 32)) (x!47168 (_ BitVec 32))) (Undefined!3987) (MissingVacant!3987 (index!18133 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32277 (_ BitVec 32)) SeekEntryResult!3987)

(assert (=> b!500135 (= e!293040 (= (seekEntryOrOpen!0 (select (arr!15520 a!3235) j!176) a!3235 mask!3524) (Found!3987 j!176)))))

(declare-fun b!500136 () Bool)

(declare-fun e!293044 () Bool)

(assert (=> b!500136 (= e!293041 e!293044)))

(declare-fun res!302006 () Bool)

(assert (=> b!500136 (=> (not res!302006) (not e!293044))))

(declare-fun lt!226910 () SeekEntryResult!3987)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500136 (= res!302006 (or (= lt!226910 (MissingZero!3987 i!1204)) (= lt!226910 (MissingVacant!3987 i!1204))))))

(assert (=> b!500136 (= lt!226910 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500137 () Bool)

(declare-fun res!302013 () Bool)

(assert (=> b!500137 (=> (not res!302013) (not e!293044))))

(declare-datatypes ((List!9678 0))(
  ( (Nil!9675) (Cons!9674 (h!10548 (_ BitVec 64)) (t!15906 List!9678)) )
))
(declare-fun arrayNoDuplicates!0 (array!32277 (_ BitVec 32) List!9678) Bool)

(assert (=> b!500137 (= res!302013 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9675))))

(declare-fun b!500138 () Bool)

(declare-datatypes ((Unit!15024 0))(
  ( (Unit!15025) )
))
(declare-fun e!293042 () Unit!15024)

(declare-fun Unit!15026 () Unit!15024)

(assert (=> b!500138 (= e!293042 Unit!15026)))

(declare-fun lt!226911 () Unit!15024)

(declare-fun lt!226909 () SeekEntryResult!3987)

(declare-fun lt!226918 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15024)

(assert (=> b!500138 (= lt!226911 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226918 #b00000000000000000000000000000000 (index!18132 lt!226909) (x!47168 lt!226909) mask!3524))))

(declare-fun lt!226914 () array!32277)

(declare-fun lt!226915 () (_ BitVec 64))

(declare-fun res!302009 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32277 (_ BitVec 32)) SeekEntryResult!3987)

(assert (=> b!500138 (= res!302009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226918 lt!226915 lt!226914 mask!3524) (Intermediate!3987 false (index!18132 lt!226909) (x!47168 lt!226909))))))

(declare-fun e!293045 () Bool)

(assert (=> b!500138 (=> (not res!302009) (not e!293045))))

(assert (=> b!500138 e!293045))

(declare-fun b!500139 () Bool)

(declare-fun res!302003 () Bool)

(assert (=> b!500139 (=> (not res!302003) (not e!293044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32277 (_ BitVec 32)) Bool)

(assert (=> b!500139 (= res!302003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500140 () Bool)

(declare-fun res!302014 () Bool)

(assert (=> b!500140 (=> (not res!302014) (not e!293041))))

(assert (=> b!500140 (= res!302014 (and (= (size!15884 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15884 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15884 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500141 () Bool)

(declare-fun e!293043 () Bool)

(declare-fun e!293039 () Bool)

(assert (=> b!500141 (= e!293043 e!293039)))

(declare-fun res!302011 () Bool)

(assert (=> b!500141 (=> res!302011 e!293039)))

(assert (=> b!500141 (= res!302011 (or (bvsgt #b00000000000000000000000000000000 (x!47168 lt!226909)) (bvsgt (x!47168 lt!226909) #b01111111111111111111111111111110) (bvslt lt!226918 #b00000000000000000000000000000000) (bvsge lt!226918 (size!15884 a!3235)) (bvslt (index!18132 lt!226909) #b00000000000000000000000000000000) (bvsge (index!18132 lt!226909) (size!15884 a!3235)) (not (= lt!226909 (Intermediate!3987 false (index!18132 lt!226909) (x!47168 lt!226909))))))))

(assert (=> b!500141 (and (or (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226913 () Unit!15024)

(assert (=> b!500141 (= lt!226913 e!293042)))

(declare-fun c!59342 () Bool)

(assert (=> b!500141 (= c!59342 (= (select (arr!15520 a!3235) (index!18132 lt!226909)) (select (arr!15520 a!3235) j!176)))))

(assert (=> b!500141 (and (bvslt (x!47168 lt!226909) #b01111111111111111111111111111110) (or (= (select (arr!15520 a!3235) (index!18132 lt!226909)) (select (arr!15520 a!3235) j!176)) (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15520 a!3235) (index!18132 lt!226909)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500142 () Bool)

(assert (=> b!500142 (= e!293045 false)))

(declare-fun b!500143 () Bool)

(declare-fun Unit!15027 () Unit!15024)

(assert (=> b!500143 (= e!293042 Unit!15027)))

(declare-fun b!500144 () Bool)

(declare-fun res!302015 () Bool)

(assert (=> b!500144 (=> res!302015 e!293043)))

(get-info :version)

(assert (=> b!500144 (= res!302015 (or (undefined!4799 lt!226909) (not ((_ is Intermediate!3987) lt!226909))))))

(declare-fun b!500145 () Bool)

(assert (=> b!500145 (= e!293039 true)))

(declare-fun lt!226916 () SeekEntryResult!3987)

(assert (=> b!500145 (= lt!226916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226918 lt!226915 lt!226914 mask!3524))))

(declare-fun b!500146 () Bool)

(assert (=> b!500146 (= e!293044 (not e!293043))))

(declare-fun res!302004 () Bool)

(assert (=> b!500146 (=> res!302004 e!293043)))

(declare-fun lt!226912 () (_ BitVec 32))

(assert (=> b!500146 (= res!302004 (= lt!226909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226912 lt!226915 lt!226914 mask!3524)))))

(assert (=> b!500146 (= lt!226909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226918 (select (arr!15520 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500146 (= lt!226912 (toIndex!0 lt!226915 mask!3524))))

(assert (=> b!500146 (= lt!226915 (select (store (arr!15520 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500146 (= lt!226918 (toIndex!0 (select (arr!15520 a!3235) j!176) mask!3524))))

(assert (=> b!500146 (= lt!226914 (array!32278 (store (arr!15520 a!3235) i!1204 k0!2280) (size!15884 a!3235)))))

(assert (=> b!500146 e!293040))

(declare-fun res!302012 () Bool)

(assert (=> b!500146 (=> (not res!302012) (not e!293040))))

(assert (=> b!500146 (= res!302012 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226917 () Unit!15024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15024)

(assert (=> b!500146 (= lt!226917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!302008 () Bool)

(assert (=> start!45452 (=> (not res!302008) (not e!293041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45452 (= res!302008 (validMask!0 mask!3524))))

(assert (=> start!45452 e!293041))

(assert (=> start!45452 true))

(declare-fun array_inv!11316 (array!32277) Bool)

(assert (=> start!45452 (array_inv!11316 a!3235)))

(declare-fun b!500147 () Bool)

(declare-fun res!302010 () Bool)

(assert (=> b!500147 (=> (not res!302010) (not e!293041))))

(assert (=> b!500147 (= res!302010 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45452 res!302008) b!500140))

(assert (= (and b!500140 res!302014) b!500133))

(assert (= (and b!500133 res!302005) b!500147))

(assert (= (and b!500147 res!302010) b!500134))

(assert (= (and b!500134 res!302007) b!500136))

(assert (= (and b!500136 res!302006) b!500139))

(assert (= (and b!500139 res!302003) b!500137))

(assert (= (and b!500137 res!302013) b!500146))

(assert (= (and b!500146 res!302012) b!500135))

(assert (= (and b!500146 (not res!302004)) b!500144))

(assert (= (and b!500144 (not res!302015)) b!500141))

(assert (= (and b!500141 c!59342) b!500138))

(assert (= (and b!500141 (not c!59342)) b!500143))

(assert (= (and b!500138 res!302009) b!500142))

(assert (= (and b!500141 (not res!302011)) b!500145))

(declare-fun m!481287 () Bool)

(assert (=> b!500135 m!481287))

(assert (=> b!500135 m!481287))

(declare-fun m!481289 () Bool)

(assert (=> b!500135 m!481289))

(declare-fun m!481291 () Bool)

(assert (=> b!500137 m!481291))

(assert (=> b!500146 m!481287))

(declare-fun m!481293 () Bool)

(assert (=> b!500146 m!481293))

(declare-fun m!481295 () Bool)

(assert (=> b!500146 m!481295))

(declare-fun m!481297 () Bool)

(assert (=> b!500146 m!481297))

(declare-fun m!481299 () Bool)

(assert (=> b!500146 m!481299))

(declare-fun m!481301 () Bool)

(assert (=> b!500146 m!481301))

(assert (=> b!500146 m!481287))

(declare-fun m!481303 () Bool)

(assert (=> b!500146 m!481303))

(assert (=> b!500146 m!481287))

(declare-fun m!481305 () Bool)

(assert (=> b!500146 m!481305))

(declare-fun m!481307 () Bool)

(assert (=> b!500146 m!481307))

(declare-fun m!481309 () Bool)

(assert (=> b!500134 m!481309))

(declare-fun m!481311 () Bool)

(assert (=> b!500138 m!481311))

(declare-fun m!481313 () Bool)

(assert (=> b!500138 m!481313))

(declare-fun m!481315 () Bool)

(assert (=> b!500139 m!481315))

(declare-fun m!481317 () Bool)

(assert (=> b!500136 m!481317))

(declare-fun m!481319 () Bool)

(assert (=> start!45452 m!481319))

(declare-fun m!481321 () Bool)

(assert (=> start!45452 m!481321))

(declare-fun m!481323 () Bool)

(assert (=> b!500141 m!481323))

(assert (=> b!500141 m!481287))

(declare-fun m!481325 () Bool)

(assert (=> b!500147 m!481325))

(assert (=> b!500145 m!481313))

(assert (=> b!500133 m!481287))

(assert (=> b!500133 m!481287))

(declare-fun m!481327 () Bool)

(assert (=> b!500133 m!481327))

(check-sat (not b!500139) (not b!500134) (not start!45452) (not b!500137) (not b!500136) (not b!500138) (not b!500133) (not b!500145) (not b!500147) (not b!500146) (not b!500135))
(check-sat)
