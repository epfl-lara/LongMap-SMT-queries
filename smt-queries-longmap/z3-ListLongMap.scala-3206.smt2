; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44984 () Bool)

(assert start!44984)

(declare-fun b!493406 () Bool)

(declare-fun e!289773 () Bool)

(assert (=> b!493406 (= e!289773 true)))

(declare-datatypes ((SeekEntryResult!3816 0))(
  ( (MissingZero!3816 (index!17443 (_ BitVec 32))) (Found!3816 (index!17444 (_ BitVec 32))) (Intermediate!3816 (undefined!4628 Bool) (index!17445 (_ BitVec 32)) (x!46526 (_ BitVec 32))) (Undefined!3816) (MissingVacant!3816 (index!17446 (_ BitVec 32))) )
))
(declare-fun lt!223153 () SeekEntryResult!3816)

(assert (=> b!493406 (= lt!223153 Undefined!3816)))

(declare-fun b!493407 () Bool)

(declare-fun res!295981 () Bool)

(declare-fun e!289770 () Bool)

(assert (=> b!493407 (=> (not res!295981) (not e!289770))))

(declare-datatypes ((array!31929 0))(
  ( (array!31930 (arr!15349 (Array (_ BitVec 32) (_ BitVec 64))) (size!15713 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31929)

(declare-datatypes ((List!9507 0))(
  ( (Nil!9504) (Cons!9503 (h!10371 (_ BitVec 64)) (t!15735 List!9507)) )
))
(declare-fun arrayNoDuplicates!0 (array!31929 (_ BitVec 32) List!9507) Bool)

(assert (=> b!493407 (= res!295981 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9504))))

(declare-fun b!493408 () Bool)

(declare-fun res!295976 () Bool)

(declare-fun e!289772 () Bool)

(assert (=> b!493408 (=> (not res!295976) (not e!289772))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493408 (= res!295976 (validKeyInArray!0 (select (arr!15349 a!3235) j!176)))))

(declare-fun b!493409 () Bool)

(declare-fun res!295977 () Bool)

(assert (=> b!493409 (=> (not res!295977) (not e!289772))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!493409 (= res!295977 (validKeyInArray!0 k0!2280))))

(declare-fun b!493410 () Bool)

(declare-fun res!295978 () Bool)

(assert (=> b!493410 (=> (not res!295978) (not e!289772))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493410 (= res!295978 (and (= (size!15713 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15713 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15713 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493411 () Bool)

(assert (=> b!493411 (= e!289770 (not e!289773))))

(declare-fun res!295983 () Bool)

(assert (=> b!493411 (=> res!295983 e!289773)))

(declare-fun lt!223155 () SeekEntryResult!3816)

(declare-fun lt!223154 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31929 (_ BitVec 32)) SeekEntryResult!3816)

(assert (=> b!493411 (= res!295983 (= lt!223155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223154 (select (store (arr!15349 a!3235) i!1204 k0!2280) j!176) (array!31930 (store (arr!15349 a!3235) i!1204 k0!2280) (size!15713 a!3235)) mask!3524)))))

(declare-fun lt!223156 () (_ BitVec 32))

(assert (=> b!493411 (= lt!223155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223156 (select (arr!15349 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493411 (= lt!223154 (toIndex!0 (select (store (arr!15349 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493411 (= lt!223156 (toIndex!0 (select (arr!15349 a!3235) j!176) mask!3524))))

(assert (=> b!493411 (= lt!223153 (Found!3816 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31929 (_ BitVec 32)) SeekEntryResult!3816)

(assert (=> b!493411 (= lt!223153 (seekEntryOrOpen!0 (select (arr!15349 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31929 (_ BitVec 32)) Bool)

(assert (=> b!493411 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14578 0))(
  ( (Unit!14579) )
))
(declare-fun lt!223152 () Unit!14578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14578)

(assert (=> b!493411 (= lt!223152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493412 () Bool)

(assert (=> b!493412 (= e!289772 e!289770)))

(declare-fun res!295980 () Bool)

(assert (=> b!493412 (=> (not res!295980) (not e!289770))))

(declare-fun lt!223151 () SeekEntryResult!3816)

(assert (=> b!493412 (= res!295980 (or (= lt!223151 (MissingZero!3816 i!1204)) (= lt!223151 (MissingVacant!3816 i!1204))))))

(assert (=> b!493412 (= lt!223151 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493413 () Bool)

(declare-fun res!295985 () Bool)

(assert (=> b!493413 (=> res!295985 e!289773)))

(get-info :version)

(assert (=> b!493413 (= res!295985 (or (not ((_ is Intermediate!3816) lt!223155)) (not (undefined!4628 lt!223155))))))

(declare-fun res!295984 () Bool)

(assert (=> start!44984 (=> (not res!295984) (not e!289772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44984 (= res!295984 (validMask!0 mask!3524))))

(assert (=> start!44984 e!289772))

(assert (=> start!44984 true))

(declare-fun array_inv!11145 (array!31929) Bool)

(assert (=> start!44984 (array_inv!11145 a!3235)))

(declare-fun b!493414 () Bool)

(declare-fun res!295979 () Bool)

(assert (=> b!493414 (=> (not res!295979) (not e!289770))))

(assert (=> b!493414 (= res!295979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493415 () Bool)

(declare-fun res!295982 () Bool)

(assert (=> b!493415 (=> (not res!295982) (not e!289772))))

(declare-fun arrayContainsKey!0 (array!31929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493415 (= res!295982 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44984 res!295984) b!493410))

(assert (= (and b!493410 res!295978) b!493408))

(assert (= (and b!493408 res!295976) b!493409))

(assert (= (and b!493409 res!295977) b!493415))

(assert (= (and b!493415 res!295982) b!493412))

(assert (= (and b!493412 res!295980) b!493414))

(assert (= (and b!493414 res!295979) b!493407))

(assert (= (and b!493407 res!295981) b!493411))

(assert (= (and b!493411 (not res!295983)) b!493413))

(assert (= (and b!493413 (not res!295985)) b!493406))

(declare-fun m!474243 () Bool)

(assert (=> b!493411 m!474243))

(declare-fun m!474245 () Bool)

(assert (=> b!493411 m!474245))

(declare-fun m!474247 () Bool)

(assert (=> b!493411 m!474247))

(declare-fun m!474249 () Bool)

(assert (=> b!493411 m!474249))

(declare-fun m!474251 () Bool)

(assert (=> b!493411 m!474251))

(assert (=> b!493411 m!474243))

(declare-fun m!474253 () Bool)

(assert (=> b!493411 m!474253))

(assert (=> b!493411 m!474243))

(declare-fun m!474255 () Bool)

(assert (=> b!493411 m!474255))

(assert (=> b!493411 m!474251))

(declare-fun m!474257 () Bool)

(assert (=> b!493411 m!474257))

(assert (=> b!493411 m!474243))

(declare-fun m!474259 () Bool)

(assert (=> b!493411 m!474259))

(assert (=> b!493411 m!474251))

(declare-fun m!474261 () Bool)

(assert (=> b!493411 m!474261))

(declare-fun m!474263 () Bool)

(assert (=> b!493407 m!474263))

(declare-fun m!474265 () Bool)

(assert (=> b!493415 m!474265))

(declare-fun m!474267 () Bool)

(assert (=> start!44984 m!474267))

(declare-fun m!474269 () Bool)

(assert (=> start!44984 m!474269))

(assert (=> b!493408 m!474243))

(assert (=> b!493408 m!474243))

(declare-fun m!474271 () Bool)

(assert (=> b!493408 m!474271))

(declare-fun m!474273 () Bool)

(assert (=> b!493414 m!474273))

(declare-fun m!474275 () Bool)

(assert (=> b!493409 m!474275))

(declare-fun m!474277 () Bool)

(assert (=> b!493412 m!474277))

(check-sat (not b!493408) (not b!493412) (not b!493411) (not b!493409) (not b!493414) (not b!493407) (not start!44984) (not b!493415))
(check-sat)
