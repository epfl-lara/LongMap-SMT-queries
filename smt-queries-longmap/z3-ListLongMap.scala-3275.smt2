; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45582 () Bool)

(assert start!45582)

(declare-fun b!501804 () Bool)

(declare-datatypes ((Unit!15142 0))(
  ( (Unit!15143) )
))
(declare-fun e!293932 () Unit!15142)

(declare-fun Unit!15144 () Unit!15142)

(assert (=> b!501804 (= e!293932 Unit!15144)))

(declare-fun b!501805 () Bool)

(declare-fun res!303411 () Bool)

(declare-fun e!293928 () Bool)

(assert (=> b!501805 (=> (not res!303411) (not e!293928))))

(declare-datatypes ((array!32348 0))(
  ( (array!32349 (arr!15554 (Array (_ BitVec 32) (_ BitVec 64))) (size!15919 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32348)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32348 (_ BitVec 32)) Bool)

(assert (=> b!501805 (= res!303411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501806 () Bool)

(declare-fun res!303410 () Bool)

(declare-fun e!293927 () Bool)

(assert (=> b!501806 (=> res!303410 e!293927)))

(declare-datatypes ((SeekEntryResult!4018 0))(
  ( (MissingZero!4018 (index!18260 (_ BitVec 32))) (Found!4018 (index!18261 (_ BitVec 32))) (Intermediate!4018 (undefined!4830 Bool) (index!18262 (_ BitVec 32)) (x!47302 (_ BitVec 32))) (Undefined!4018) (MissingVacant!4018 (index!18263 (_ BitVec 32))) )
))
(declare-fun lt!227914 () SeekEntryResult!4018)

(get-info :version)

(assert (=> b!501806 (= res!303410 (or (undefined!4830 lt!227914) (not ((_ is Intermediate!4018) lt!227914))))))

(declare-fun res!303406 () Bool)

(declare-fun e!293929 () Bool)

(assert (=> start!45582 (=> (not res!303406) (not e!293929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45582 (= res!303406 (validMask!0 mask!3524))))

(assert (=> start!45582 e!293929))

(assert (=> start!45582 true))

(declare-fun array_inv!11437 (array!32348) Bool)

(assert (=> start!45582 (array_inv!11437 a!3235)))

(declare-fun b!501807 () Bool)

(declare-fun res!303416 () Bool)

(assert (=> b!501807 (=> (not res!303416) (not e!293929))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501807 (= res!303416 (validKeyInArray!0 k0!2280))))

(declare-fun b!501808 () Bool)

(assert (=> b!501808 (= e!293929 e!293928)))

(declare-fun res!303418 () Bool)

(assert (=> b!501808 (=> (not res!303418) (not e!293928))))

(declare-fun lt!227912 () SeekEntryResult!4018)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501808 (= res!303418 (or (= lt!227912 (MissingZero!4018 i!1204)) (= lt!227912 (MissingVacant!4018 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501808 (= lt!227912 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501809 () Bool)

(declare-fun res!303409 () Bool)

(assert (=> b!501809 (=> (not res!303409) (not e!293929))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501809 (= res!303409 (and (= (size!15919 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15919 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15919 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501810 () Bool)

(declare-fun res!303414 () Bool)

(assert (=> b!501810 (=> (not res!303414) (not e!293929))))

(assert (=> b!501810 (= res!303414 (validKeyInArray!0 (select (arr!15554 a!3235) j!176)))))

(declare-fun lt!227909 () (_ BitVec 32))

(declare-fun b!501811 () Bool)

(declare-fun e!293926 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501811 (= e!293926 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227909 (index!18262 lt!227914) (select (arr!15554 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176))))))

(declare-fun b!501812 () Bool)

(assert (=> b!501812 (= e!293928 (not e!293927))))

(declare-fun res!303408 () Bool)

(assert (=> b!501812 (=> res!303408 e!293927)))

(declare-fun lt!227910 () (_ BitVec 64))

(declare-fun lt!227917 () array!32348)

(declare-fun lt!227916 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32348 (_ BitVec 32)) SeekEntryResult!4018)

(assert (=> b!501812 (= res!303408 (= lt!227914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227916 lt!227910 lt!227917 mask!3524)))))

(assert (=> b!501812 (= lt!227914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227909 (select (arr!15554 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501812 (= lt!227916 (toIndex!0 lt!227910 mask!3524))))

(assert (=> b!501812 (= lt!227910 (select (store (arr!15554 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501812 (= lt!227909 (toIndex!0 (select (arr!15554 a!3235) j!176) mask!3524))))

(assert (=> b!501812 (= lt!227917 (array!32349 (store (arr!15554 a!3235) i!1204 k0!2280) (size!15919 a!3235)))))

(declare-fun e!293930 () Bool)

(assert (=> b!501812 e!293930))

(declare-fun res!303407 () Bool)

(assert (=> b!501812 (=> (not res!303407) (not e!293930))))

(assert (=> b!501812 (= res!303407 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227907 () Unit!15142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15142)

(assert (=> b!501812 (= lt!227907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501813 () Bool)

(declare-fun res!303413 () Bool)

(assert (=> b!501813 (=> (not res!303413) (not e!293928))))

(declare-datatypes ((List!9751 0))(
  ( (Nil!9748) (Cons!9747 (h!10624 (_ BitVec 64)) (t!15970 List!9751)) )
))
(declare-fun arrayNoDuplicates!0 (array!32348 (_ BitVec 32) List!9751) Bool)

(assert (=> b!501813 (= res!303413 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9748))))

(declare-fun b!501814 () Bool)

(assert (=> b!501814 (= e!293930 (= (seekEntryOrOpen!0 (select (arr!15554 a!3235) j!176) a!3235 mask!3524) (Found!4018 j!176)))))

(declare-fun b!501815 () Bool)

(declare-fun e!293931 () Bool)

(assert (=> b!501815 (= e!293931 true)))

(declare-fun lt!227915 () SeekEntryResult!4018)

(assert (=> b!501815 (= lt!227915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227909 lt!227910 lt!227917 mask!3524))))

(declare-fun b!501816 () Bool)

(declare-fun e!293933 () Bool)

(assert (=> b!501816 (= e!293933 false)))

(declare-fun b!501817 () Bool)

(declare-fun res!303417 () Bool)

(assert (=> b!501817 (=> res!303417 e!293931)))

(assert (=> b!501817 (= res!303417 e!293926)))

(declare-fun res!303412 () Bool)

(assert (=> b!501817 (=> (not res!303412) (not e!293926))))

(assert (=> b!501817 (= res!303412 (bvsgt #b00000000000000000000000000000000 (x!47302 lt!227914)))))

(declare-fun b!501818 () Bool)

(declare-fun res!303415 () Bool)

(assert (=> b!501818 (=> (not res!303415) (not e!293929))))

(declare-fun arrayContainsKey!0 (array!32348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501818 (= res!303415 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501819 () Bool)

(declare-fun Unit!15145 () Unit!15142)

(assert (=> b!501819 (= e!293932 Unit!15145)))

(declare-fun lt!227911 () Unit!15142)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32348 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15142)

(assert (=> b!501819 (= lt!227911 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227909 #b00000000000000000000000000000000 (index!18262 lt!227914) (x!47302 lt!227914) mask!3524))))

(declare-fun res!303419 () Bool)

(assert (=> b!501819 (= res!303419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227909 lt!227910 lt!227917 mask!3524) (Intermediate!4018 false (index!18262 lt!227914) (x!47302 lt!227914))))))

(assert (=> b!501819 (=> (not res!303419) (not e!293933))))

(assert (=> b!501819 e!293933))

(declare-fun b!501820 () Bool)

(assert (=> b!501820 (= e!293927 e!293931)))

(declare-fun res!303405 () Bool)

(assert (=> b!501820 (=> res!303405 e!293931)))

(assert (=> b!501820 (= res!303405 (or (bvsgt (x!47302 lt!227914) #b01111111111111111111111111111110) (bvslt lt!227909 #b00000000000000000000000000000000) (bvsge lt!227909 (size!15919 a!3235)) (bvslt (index!18262 lt!227914) #b00000000000000000000000000000000) (bvsge (index!18262 lt!227914) (size!15919 a!3235)) (not (= lt!227914 (Intermediate!4018 false (index!18262 lt!227914) (x!47302 lt!227914))))))))

(assert (=> b!501820 (= (index!18262 lt!227914) i!1204)))

(declare-fun lt!227913 () Unit!15142)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32348 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15142)

(assert (=> b!501820 (= lt!227913 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227909 #b00000000000000000000000000000000 (index!18262 lt!227914) (x!47302 lt!227914) mask!3524))))

(assert (=> b!501820 (and (or (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227908 () Unit!15142)

(assert (=> b!501820 (= lt!227908 e!293932)))

(declare-fun c!59478 () Bool)

(assert (=> b!501820 (= c!59478 (= (select (arr!15554 a!3235) (index!18262 lt!227914)) (select (arr!15554 a!3235) j!176)))))

(assert (=> b!501820 (and (bvslt (x!47302 lt!227914) #b01111111111111111111111111111110) (or (= (select (arr!15554 a!3235) (index!18262 lt!227914)) (select (arr!15554 a!3235) j!176)) (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15554 a!3235) (index!18262 lt!227914)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45582 res!303406) b!501809))

(assert (= (and b!501809 res!303409) b!501810))

(assert (= (and b!501810 res!303414) b!501807))

(assert (= (and b!501807 res!303416) b!501818))

(assert (= (and b!501818 res!303415) b!501808))

(assert (= (and b!501808 res!303418) b!501805))

(assert (= (and b!501805 res!303411) b!501813))

(assert (= (and b!501813 res!303413) b!501812))

(assert (= (and b!501812 res!303407) b!501814))

(assert (= (and b!501812 (not res!303408)) b!501806))

(assert (= (and b!501806 (not res!303410)) b!501820))

(assert (= (and b!501820 c!59478) b!501819))

(assert (= (and b!501820 (not c!59478)) b!501804))

(assert (= (and b!501819 res!303419) b!501816))

(assert (= (and b!501820 (not res!303405)) b!501817))

(assert (= (and b!501817 res!303412) b!501811))

(assert (= (and b!501817 (not res!303417)) b!501815))

(declare-fun m!482293 () Bool)

(assert (=> b!501818 m!482293))

(declare-fun m!482295 () Bool)

(assert (=> b!501808 m!482295))

(declare-fun m!482297 () Bool)

(assert (=> b!501815 m!482297))

(declare-fun m!482299 () Bool)

(assert (=> b!501819 m!482299))

(assert (=> b!501819 m!482297))

(declare-fun m!482301 () Bool)

(assert (=> b!501814 m!482301))

(assert (=> b!501814 m!482301))

(declare-fun m!482303 () Bool)

(assert (=> b!501814 m!482303))

(declare-fun m!482305 () Bool)

(assert (=> b!501805 m!482305))

(declare-fun m!482307 () Bool)

(assert (=> b!501807 m!482307))

(declare-fun m!482309 () Bool)

(assert (=> b!501820 m!482309))

(declare-fun m!482311 () Bool)

(assert (=> b!501820 m!482311))

(assert (=> b!501820 m!482301))

(declare-fun m!482313 () Bool)

(assert (=> b!501813 m!482313))

(assert (=> b!501811 m!482301))

(assert (=> b!501811 m!482301))

(declare-fun m!482315 () Bool)

(assert (=> b!501811 m!482315))

(declare-fun m!482317 () Bool)

(assert (=> start!45582 m!482317))

(declare-fun m!482319 () Bool)

(assert (=> start!45582 m!482319))

(declare-fun m!482321 () Bool)

(assert (=> b!501812 m!482321))

(declare-fun m!482323 () Bool)

(assert (=> b!501812 m!482323))

(declare-fun m!482325 () Bool)

(assert (=> b!501812 m!482325))

(declare-fun m!482327 () Bool)

(assert (=> b!501812 m!482327))

(declare-fun m!482329 () Bool)

(assert (=> b!501812 m!482329))

(assert (=> b!501812 m!482301))

(declare-fun m!482331 () Bool)

(assert (=> b!501812 m!482331))

(assert (=> b!501812 m!482301))

(declare-fun m!482333 () Bool)

(assert (=> b!501812 m!482333))

(assert (=> b!501812 m!482301))

(declare-fun m!482335 () Bool)

(assert (=> b!501812 m!482335))

(assert (=> b!501810 m!482301))

(assert (=> b!501810 m!482301))

(declare-fun m!482337 () Bool)

(assert (=> b!501810 m!482337))

(check-sat (not start!45582) (not b!501812) (not b!501808) (not b!501820) (not b!501810) (not b!501807) (not b!501814) (not b!501819) (not b!501813) (not b!501805) (not b!501811) (not b!501815) (not b!501818))
(check-sat)
