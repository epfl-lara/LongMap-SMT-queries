; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119954 () Bool)

(assert start!119954)

(declare-fun b!1396312 () Bool)

(declare-fun res!935277 () Bool)

(declare-fun e!790513 () Bool)

(assert (=> b!1396312 (=> (not res!935277) (not e!790513))))

(declare-datatypes ((array!95436 0))(
  ( (array!95437 (arr!46072 (Array (_ BitVec 32) (_ BitVec 64))) (size!46624 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95436)

(declare-datatypes ((List!32669 0))(
  ( (Nil!32666) (Cons!32665 (h!33907 (_ BitVec 64)) (t!47355 List!32669)) )
))
(declare-fun arrayNoDuplicates!0 (array!95436 (_ BitVec 32) List!32669) Bool)

(assert (=> b!1396312 (= res!935277 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32666))))

(declare-fun b!1396313 () Bool)

(declare-fun res!935283 () Bool)

(assert (=> b!1396313 (=> (not res!935283) (not e!790513))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396313 (= res!935283 (and (= (size!46624 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46624 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46624 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396314 () Bool)

(declare-fun e!790514 () Bool)

(assert (=> b!1396314 (= e!790513 (not e!790514))))

(declare-fun res!935278 () Bool)

(assert (=> b!1396314 (=> res!935278 e!790514)))

(declare-datatypes ((SeekEntryResult!10415 0))(
  ( (MissingZero!10415 (index!44031 (_ BitVec 32))) (Found!10415 (index!44032 (_ BitVec 32))) (Intermediate!10415 (undefined!11227 Bool) (index!44033 (_ BitVec 32)) (x!125698 (_ BitVec 32))) (Undefined!10415) (MissingVacant!10415 (index!44034 (_ BitVec 32))) )
))
(declare-fun lt!613202 () SeekEntryResult!10415)

(get-info :version)

(assert (=> b!1396314 (= res!935278 (or (not ((_ is Intermediate!10415) lt!613202)) (undefined!11227 lt!613202)))))

(declare-fun e!790511 () Bool)

(assert (=> b!1396314 e!790511))

(declare-fun res!935281 () Bool)

(assert (=> b!1396314 (=> (not res!935281) (not e!790511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95436 (_ BitVec 32)) Bool)

(assert (=> b!1396314 (= res!935281 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46677 0))(
  ( (Unit!46678) )
))
(declare-fun lt!613199 () Unit!46677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46677)

(assert (=> b!1396314 (= lt!613199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613205 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95436 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1396314 (= lt!613202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613205 (select (arr!46072 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396314 (= lt!613205 (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840))))

(declare-fun b!1396315 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95436 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1396315 (= e!790511 (= (seekEntryOrOpen!0 (select (arr!46072 a!2901) j!112) a!2901 mask!2840) (Found!10415 j!112)))))

(declare-fun b!1396316 () Bool)

(declare-fun res!935276 () Bool)

(assert (=> b!1396316 (=> (not res!935276) (not e!790513))))

(assert (=> b!1396316 (= res!935276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396317 () Bool)

(declare-fun e!790510 () Bool)

(assert (=> b!1396317 (= e!790514 e!790510)))

(declare-fun res!935282 () Bool)

(assert (=> b!1396317 (=> res!935282 e!790510)))

(declare-fun lt!613200 () SeekEntryResult!10415)

(assert (=> b!1396317 (= res!935282 (or (= lt!613202 lt!613200) (not ((_ is Intermediate!10415) lt!613200)) (bvslt (x!125698 lt!613202) #b00000000000000000000000000000000) (bvsgt (x!125698 lt!613202) #b01111111111111111111111111111110) (bvslt lt!613205 #b00000000000000000000000000000000) (bvsge lt!613205 (size!46624 a!2901)) (bvslt (index!44033 lt!613202) #b00000000000000000000000000000000) (bvsge (index!44033 lt!613202) (size!46624 a!2901)) (not (= lt!613202 (Intermediate!10415 false (index!44033 lt!613202) (x!125698 lt!613202)))) (not (= lt!613200 (Intermediate!10415 (undefined!11227 lt!613200) (index!44033 lt!613200) (x!125698 lt!613200))))))))

(declare-fun lt!613203 () array!95436)

(declare-fun lt!613201 () (_ BitVec 64))

(assert (=> b!1396317 (= lt!613200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613201 mask!2840) lt!613201 lt!613203 mask!2840))))

(assert (=> b!1396317 (= lt!613201 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396317 (= lt!613203 (array!95437 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46624 a!2901)))))

(declare-fun b!1396318 () Bool)

(declare-fun res!935280 () Bool)

(assert (=> b!1396318 (=> (not res!935280) (not e!790513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396318 (= res!935280 (validKeyInArray!0 (select (arr!46072 a!2901) i!1037)))))

(declare-fun b!1396319 () Bool)

(assert (=> b!1396319 (= e!790510 true)))

(declare-fun lt!613204 () SeekEntryResult!10415)

(assert (=> b!1396319 (= lt!613204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613205 lt!613201 lt!613203 mask!2840))))

(declare-fun res!935279 () Bool)

(assert (=> start!119954 (=> (not res!935279) (not e!790513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119954 (= res!935279 (validMask!0 mask!2840))))

(assert (=> start!119954 e!790513))

(assert (=> start!119954 true))

(declare-fun array_inv!35305 (array!95436) Bool)

(assert (=> start!119954 (array_inv!35305 a!2901)))

(declare-fun b!1396320 () Bool)

(declare-fun res!935284 () Bool)

(assert (=> b!1396320 (=> (not res!935284) (not e!790513))))

(assert (=> b!1396320 (= res!935284 (validKeyInArray!0 (select (arr!46072 a!2901) j!112)))))

(assert (= (and start!119954 res!935279) b!1396313))

(assert (= (and b!1396313 res!935283) b!1396318))

(assert (= (and b!1396318 res!935280) b!1396320))

(assert (= (and b!1396320 res!935284) b!1396316))

(assert (= (and b!1396316 res!935276) b!1396312))

(assert (= (and b!1396312 res!935277) b!1396314))

(assert (= (and b!1396314 res!935281) b!1396315))

(assert (= (and b!1396314 (not res!935278)) b!1396317))

(assert (= (and b!1396317 (not res!935282)) b!1396319))

(declare-fun m!1282279 () Bool)

(assert (=> start!119954 m!1282279))

(declare-fun m!1282281 () Bool)

(assert (=> start!119954 m!1282281))

(declare-fun m!1282283 () Bool)

(assert (=> b!1396314 m!1282283))

(declare-fun m!1282285 () Bool)

(assert (=> b!1396314 m!1282285))

(assert (=> b!1396314 m!1282283))

(declare-fun m!1282287 () Bool)

(assert (=> b!1396314 m!1282287))

(declare-fun m!1282289 () Bool)

(assert (=> b!1396314 m!1282289))

(assert (=> b!1396314 m!1282283))

(declare-fun m!1282291 () Bool)

(assert (=> b!1396314 m!1282291))

(declare-fun m!1282293 () Bool)

(assert (=> b!1396316 m!1282293))

(assert (=> b!1396315 m!1282283))

(assert (=> b!1396315 m!1282283))

(declare-fun m!1282295 () Bool)

(assert (=> b!1396315 m!1282295))

(declare-fun m!1282297 () Bool)

(assert (=> b!1396318 m!1282297))

(assert (=> b!1396318 m!1282297))

(declare-fun m!1282299 () Bool)

(assert (=> b!1396318 m!1282299))

(declare-fun m!1282301 () Bool)

(assert (=> b!1396312 m!1282301))

(declare-fun m!1282303 () Bool)

(assert (=> b!1396317 m!1282303))

(assert (=> b!1396317 m!1282303))

(declare-fun m!1282305 () Bool)

(assert (=> b!1396317 m!1282305))

(declare-fun m!1282307 () Bool)

(assert (=> b!1396317 m!1282307))

(declare-fun m!1282309 () Bool)

(assert (=> b!1396317 m!1282309))

(declare-fun m!1282311 () Bool)

(assert (=> b!1396319 m!1282311))

(assert (=> b!1396320 m!1282283))

(assert (=> b!1396320 m!1282283))

(declare-fun m!1282313 () Bool)

(assert (=> b!1396320 m!1282313))

(check-sat (not b!1396316) (not b!1396315) (not b!1396319) (not b!1396318) (not b!1396312) (not b!1396314) (not b!1396320) (not b!1396317) (not start!119954))
(check-sat)
