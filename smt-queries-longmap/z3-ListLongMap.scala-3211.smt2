; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45000 () Bool)

(assert start!45000)

(declare-fun b!493555 () Bool)

(declare-fun res!296274 () Bool)

(declare-fun e!289767 () Bool)

(assert (=> b!493555 (=> (not res!296274) (not e!289767))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493555 (= res!296274 (validKeyInArray!0 k0!2280))))

(declare-fun b!493556 () Bool)

(declare-fun e!289764 () Bool)

(declare-fun e!289766 () Bool)

(assert (=> b!493556 (= e!289764 (not e!289766))))

(declare-fun res!296273 () Bool)

(assert (=> b!493556 (=> res!296273 e!289766)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223172 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31955 0))(
  ( (array!31956 (arr!15362 (Array (_ BitVec 32) (_ BitVec 64))) (size!15727 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31955)

(declare-datatypes ((SeekEntryResult!3826 0))(
  ( (MissingZero!3826 (index!17483 (_ BitVec 32))) (Found!3826 (index!17484 (_ BitVec 32))) (Intermediate!3826 (undefined!4638 Bool) (index!17485 (_ BitVec 32)) (x!46571 (_ BitVec 32))) (Undefined!3826) (MissingVacant!3826 (index!17486 (_ BitVec 32))) )
))
(declare-fun lt!223174 () SeekEntryResult!3826)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31955 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!493556 (= res!296273 (= lt!223174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223172 (select (store (arr!15362 a!3235) i!1204 k0!2280) j!176) (array!31956 (store (arr!15362 a!3235) i!1204 k0!2280) (size!15727 a!3235)) mask!3524)))))

(declare-fun lt!223173 () (_ BitVec 32))

(assert (=> b!493556 (= lt!223174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223173 (select (arr!15362 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493556 (= lt!223172 (toIndex!0 (select (store (arr!15362 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493556 (= lt!223173 (toIndex!0 (select (arr!15362 a!3235) j!176) mask!3524))))

(declare-fun lt!223170 () SeekEntryResult!3826)

(assert (=> b!493556 (= lt!223170 (Found!3826 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31955 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!493556 (= lt!223170 (seekEntryOrOpen!0 (select (arr!15362 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31955 (_ BitVec 32)) Bool)

(assert (=> b!493556 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14584 0))(
  ( (Unit!14585) )
))
(declare-fun lt!223169 () Unit!14584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14584)

(assert (=> b!493556 (= lt!223169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493557 () Bool)

(declare-fun res!296270 () Bool)

(assert (=> b!493557 (=> (not res!296270) (not e!289767))))

(assert (=> b!493557 (= res!296270 (and (= (size!15727 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15727 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15727 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493558 () Bool)

(assert (=> b!493558 (= e!289767 e!289764)))

(declare-fun res!296271 () Bool)

(assert (=> b!493558 (=> (not res!296271) (not e!289764))))

(declare-fun lt!223171 () SeekEntryResult!3826)

(assert (=> b!493558 (= res!296271 (or (= lt!223171 (MissingZero!3826 i!1204)) (= lt!223171 (MissingVacant!3826 i!1204))))))

(assert (=> b!493558 (= lt!223171 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493559 () Bool)

(declare-fun res!296269 () Bool)

(assert (=> b!493559 (=> (not res!296269) (not e!289767))))

(declare-fun arrayContainsKey!0 (array!31955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493559 (= res!296269 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296272 () Bool)

(assert (=> start!45000 (=> (not res!296272) (not e!289767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45000 (= res!296272 (validMask!0 mask!3524))))

(assert (=> start!45000 e!289767))

(assert (=> start!45000 true))

(declare-fun array_inv!11245 (array!31955) Bool)

(assert (=> start!45000 (array_inv!11245 a!3235)))

(declare-fun b!493560 () Bool)

(declare-fun res!296276 () Bool)

(assert (=> b!493560 (=> res!296276 e!289766)))

(get-info :version)

(assert (=> b!493560 (= res!296276 (or (not ((_ is Intermediate!3826) lt!223174)) (not (undefined!4638 lt!223174))))))

(declare-fun b!493561 () Bool)

(declare-fun res!296268 () Bool)

(assert (=> b!493561 (=> (not res!296268) (not e!289764))))

(declare-datatypes ((List!9559 0))(
  ( (Nil!9556) (Cons!9555 (h!10423 (_ BitVec 64)) (t!15778 List!9559)) )
))
(declare-fun arrayNoDuplicates!0 (array!31955 (_ BitVec 32) List!9559) Bool)

(assert (=> b!493561 (= res!296268 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9556))))

(declare-fun b!493562 () Bool)

(assert (=> b!493562 (= e!289766 true)))

(assert (=> b!493562 (= lt!223170 Undefined!3826)))

(declare-fun b!493563 () Bool)

(declare-fun res!296267 () Bool)

(assert (=> b!493563 (=> (not res!296267) (not e!289764))))

(assert (=> b!493563 (= res!296267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493564 () Bool)

(declare-fun res!296275 () Bool)

(assert (=> b!493564 (=> (not res!296275) (not e!289767))))

(assert (=> b!493564 (= res!296275 (validKeyInArray!0 (select (arr!15362 a!3235) j!176)))))

(assert (= (and start!45000 res!296272) b!493557))

(assert (= (and b!493557 res!296270) b!493564))

(assert (= (and b!493564 res!296275) b!493555))

(assert (= (and b!493555 res!296274) b!493559))

(assert (= (and b!493559 res!296269) b!493558))

(assert (= (and b!493558 res!296271) b!493563))

(assert (= (and b!493563 res!296267) b!493561))

(assert (= (and b!493561 res!296268) b!493556))

(assert (= (and b!493556 (not res!296273)) b!493560))

(assert (= (and b!493560 (not res!296276)) b!493562))

(declare-fun m!473995 () Bool)

(assert (=> b!493558 m!473995))

(declare-fun m!473997 () Bool)

(assert (=> b!493556 m!473997))

(declare-fun m!473999 () Bool)

(assert (=> b!493556 m!473999))

(declare-fun m!474001 () Bool)

(assert (=> b!493556 m!474001))

(declare-fun m!474003 () Bool)

(assert (=> b!493556 m!474003))

(declare-fun m!474005 () Bool)

(assert (=> b!493556 m!474005))

(assert (=> b!493556 m!474003))

(declare-fun m!474007 () Bool)

(assert (=> b!493556 m!474007))

(assert (=> b!493556 m!474003))

(declare-fun m!474009 () Bool)

(assert (=> b!493556 m!474009))

(assert (=> b!493556 m!474001))

(declare-fun m!474011 () Bool)

(assert (=> b!493556 m!474011))

(assert (=> b!493556 m!474001))

(declare-fun m!474013 () Bool)

(assert (=> b!493556 m!474013))

(assert (=> b!493556 m!474003))

(declare-fun m!474015 () Bool)

(assert (=> b!493556 m!474015))

(declare-fun m!474017 () Bool)

(assert (=> b!493563 m!474017))

(declare-fun m!474019 () Bool)

(assert (=> b!493559 m!474019))

(declare-fun m!474021 () Bool)

(assert (=> b!493555 m!474021))

(assert (=> b!493564 m!474003))

(assert (=> b!493564 m!474003))

(declare-fun m!474023 () Bool)

(assert (=> b!493564 m!474023))

(declare-fun m!474025 () Bool)

(assert (=> b!493561 m!474025))

(declare-fun m!474027 () Bool)

(assert (=> start!45000 m!474027))

(declare-fun m!474029 () Bool)

(assert (=> start!45000 m!474029))

(check-sat (not b!493558) (not b!493556) (not b!493561) (not b!493563) (not b!493559) (not b!493564) (not b!493555) (not start!45000))
(check-sat)
