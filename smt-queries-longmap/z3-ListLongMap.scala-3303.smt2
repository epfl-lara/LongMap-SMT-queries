; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45752 () Bool)

(assert start!45752)

(declare-fun b!506295 () Bool)

(declare-fun res!307308 () Bool)

(declare-fun e!296337 () Bool)

(assert (=> b!506295 (=> (not res!307308) (not e!296337))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32509 0))(
  ( (array!32510 (arr!15634 (Array (_ BitVec 32) (_ BitVec 64))) (size!15998 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32509)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506295 (= res!307308 (and (= (size!15998 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15998 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15998 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506296 () Bool)

(declare-fun res!307314 () Bool)

(declare-fun e!296336 () Bool)

(assert (=> b!506296 (=> (not res!307314) (not e!296336))))

(declare-datatypes ((List!9699 0))(
  ( (Nil!9696) (Cons!9695 (h!10572 (_ BitVec 64)) (t!15919 List!9699)) )
))
(declare-fun arrayNoDuplicates!0 (array!32509 (_ BitVec 32) List!9699) Bool)

(assert (=> b!506296 (= res!307314 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9696))))

(declare-fun b!506297 () Bool)

(declare-fun res!307311 () Bool)

(assert (=> b!506297 (=> (not res!307311) (not e!296336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32509 (_ BitVec 32)) Bool)

(assert (=> b!506297 (= res!307311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506298 () Bool)

(declare-fun e!296333 () Bool)

(assert (=> b!506298 (= e!296336 (not e!296333))))

(declare-fun res!307318 () Bool)

(assert (=> b!506298 (=> res!307318 e!296333)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4057 0))(
  ( (MissingZero!4057 (index!18416 (_ BitVec 32))) (Found!4057 (index!18417 (_ BitVec 32))) (Intermediate!4057 (undefined!4869 Bool) (index!18418 (_ BitVec 32)) (x!47567 (_ BitVec 32))) (Undefined!4057) (MissingVacant!4057 (index!18419 (_ BitVec 32))) )
))
(declare-fun lt!231062 () SeekEntryResult!4057)

(declare-fun lt!231063 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32509 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!506298 (= res!307318 (= lt!231062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231063 (select (store (arr!15634 a!3235) i!1204 k0!2280) j!176) (array!32510 (store (arr!15634 a!3235) i!1204 k0!2280) (size!15998 a!3235)) mask!3524)))))

(declare-fun lt!231061 () (_ BitVec 32))

(assert (=> b!506298 (= lt!231062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231061 (select (arr!15634 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506298 (= lt!231063 (toIndex!0 (select (store (arr!15634 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506298 (= lt!231061 (toIndex!0 (select (arr!15634 a!3235) j!176) mask!3524))))

(declare-fun e!296334 () Bool)

(assert (=> b!506298 e!296334))

(declare-fun res!307317 () Bool)

(assert (=> b!506298 (=> (not res!307317) (not e!296334))))

(assert (=> b!506298 (= res!307317 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15463 0))(
  ( (Unit!15464) )
))
(declare-fun lt!231064 () Unit!15463)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15463)

(assert (=> b!506298 (= lt!231064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506299 () Bool)

(declare-fun res!307310 () Bool)

(assert (=> b!506299 (=> (not res!307310) (not e!296337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506299 (= res!307310 (validKeyInArray!0 (select (arr!15634 a!3235) j!176)))))

(declare-fun b!506301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32509 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!506301 (= e!296334 (= (seekEntryOrOpen!0 (select (arr!15634 a!3235) j!176) a!3235 mask!3524) (Found!4057 j!176)))))

(declare-fun b!506302 () Bool)

(declare-fun e!296335 () Bool)

(assert (=> b!506302 (= e!296335 true)))

(assert (=> b!506302 false))

(declare-fun b!506303 () Bool)

(assert (=> b!506303 (= e!296337 e!296336)))

(declare-fun res!307313 () Bool)

(assert (=> b!506303 (=> (not res!307313) (not e!296336))))

(declare-fun lt!231060 () SeekEntryResult!4057)

(assert (=> b!506303 (= res!307313 (or (= lt!231060 (MissingZero!4057 i!1204)) (= lt!231060 (MissingVacant!4057 i!1204))))))

(assert (=> b!506303 (= lt!231060 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506304 () Bool)

(assert (=> b!506304 (= e!296333 e!296335)))

(declare-fun res!307316 () Bool)

(assert (=> b!506304 (=> res!307316 e!296335)))

(declare-fun lt!231059 () Bool)

(assert (=> b!506304 (= res!307316 (or (and (not lt!231059) (undefined!4869 lt!231062)) (and (not lt!231059) (not (undefined!4869 lt!231062)))))))

(get-info :version)

(assert (=> b!506304 (= lt!231059 (not ((_ is Intermediate!4057) lt!231062)))))

(declare-fun b!506305 () Bool)

(declare-fun res!307315 () Bool)

(assert (=> b!506305 (=> (not res!307315) (not e!296337))))

(assert (=> b!506305 (= res!307315 (validKeyInArray!0 k0!2280))))

(declare-fun res!307309 () Bool)

(assert (=> start!45752 (=> (not res!307309) (not e!296337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45752 (= res!307309 (validMask!0 mask!3524))))

(assert (=> start!45752 e!296337))

(assert (=> start!45752 true))

(declare-fun array_inv!11493 (array!32509) Bool)

(assert (=> start!45752 (array_inv!11493 a!3235)))

(declare-fun b!506300 () Bool)

(declare-fun res!307312 () Bool)

(assert (=> b!506300 (=> (not res!307312) (not e!296337))))

(declare-fun arrayContainsKey!0 (array!32509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506300 (= res!307312 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45752 res!307309) b!506295))

(assert (= (and b!506295 res!307308) b!506299))

(assert (= (and b!506299 res!307310) b!506305))

(assert (= (and b!506305 res!307315) b!506300))

(assert (= (and b!506300 res!307312) b!506303))

(assert (= (and b!506303 res!307313) b!506297))

(assert (= (and b!506297 res!307311) b!506296))

(assert (= (and b!506296 res!307314) b!506298))

(assert (= (and b!506298 res!307317) b!506301))

(assert (= (and b!506298 (not res!307318)) b!506304))

(assert (= (and b!506304 (not res!307316)) b!506302))

(declare-fun m!487195 () Bool)

(assert (=> b!506297 m!487195))

(declare-fun m!487197 () Bool)

(assert (=> b!506301 m!487197))

(assert (=> b!506301 m!487197))

(declare-fun m!487199 () Bool)

(assert (=> b!506301 m!487199))

(declare-fun m!487201 () Bool)

(assert (=> b!506300 m!487201))

(declare-fun m!487203 () Bool)

(assert (=> b!506298 m!487203))

(declare-fun m!487205 () Bool)

(assert (=> b!506298 m!487205))

(declare-fun m!487207 () Bool)

(assert (=> b!506298 m!487207))

(assert (=> b!506298 m!487197))

(declare-fun m!487209 () Bool)

(assert (=> b!506298 m!487209))

(assert (=> b!506298 m!487197))

(assert (=> b!506298 m!487207))

(declare-fun m!487211 () Bool)

(assert (=> b!506298 m!487211))

(declare-fun m!487213 () Bool)

(assert (=> b!506298 m!487213))

(assert (=> b!506298 m!487197))

(declare-fun m!487215 () Bool)

(assert (=> b!506298 m!487215))

(assert (=> b!506298 m!487207))

(declare-fun m!487217 () Bool)

(assert (=> b!506298 m!487217))

(declare-fun m!487219 () Bool)

(assert (=> b!506296 m!487219))

(assert (=> b!506299 m!487197))

(assert (=> b!506299 m!487197))

(declare-fun m!487221 () Bool)

(assert (=> b!506299 m!487221))

(declare-fun m!487223 () Bool)

(assert (=> b!506305 m!487223))

(declare-fun m!487225 () Bool)

(assert (=> b!506303 m!487225))

(declare-fun m!487227 () Bool)

(assert (=> start!45752 m!487227))

(declare-fun m!487229 () Bool)

(assert (=> start!45752 m!487229))

(check-sat (not b!506298) (not b!506301) (not b!506297) (not b!506303) (not b!506296) (not start!45752) (not b!506299) (not b!506305) (not b!506300))
(check-sat)
