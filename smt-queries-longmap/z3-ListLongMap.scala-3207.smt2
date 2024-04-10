; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44990 () Bool)

(assert start!44990)

(declare-fun b!493496 () Bool)

(declare-fun res!296074 () Bool)

(declare-fun e!289809 () Bool)

(assert (=> b!493496 (=> res!296074 e!289809)))

(declare-datatypes ((SeekEntryResult!3819 0))(
  ( (MissingZero!3819 (index!17455 (_ BitVec 32))) (Found!3819 (index!17456 (_ BitVec 32))) (Intermediate!3819 (undefined!4631 Bool) (index!17457 (_ BitVec 32)) (x!46537 (_ BitVec 32))) (Undefined!3819) (MissingVacant!3819 (index!17458 (_ BitVec 32))) )
))
(declare-fun lt!223208 () SeekEntryResult!3819)

(get-info :version)

(assert (=> b!493496 (= res!296074 (or (not ((_ is Intermediate!3819) lt!223208)) (not (undefined!4631 lt!223208))))))

(declare-fun b!493497 () Bool)

(declare-fun res!296068 () Bool)

(declare-fun e!289808 () Bool)

(assert (=> b!493497 (=> (not res!296068) (not e!289808))))

(declare-datatypes ((array!31935 0))(
  ( (array!31936 (arr!15352 (Array (_ BitVec 32) (_ BitVec 64))) (size!15716 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31935)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493497 (= res!296068 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493498 () Bool)

(declare-fun res!296075 () Bool)

(assert (=> b!493498 (=> (not res!296075) (not e!289808))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493498 (= res!296075 (validKeyInArray!0 (select (arr!15352 a!3235) j!176)))))

(declare-fun b!493499 () Bool)

(declare-fun res!296070 () Bool)

(assert (=> b!493499 (=> (not res!296070) (not e!289808))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493499 (= res!296070 (and (= (size!15716 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15716 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15716 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493500 () Bool)

(declare-fun e!289806 () Bool)

(assert (=> b!493500 (= e!289806 (not e!289809))))

(declare-fun res!296069 () Bool)

(assert (=> b!493500 (=> res!296069 e!289809)))

(declare-fun lt!223209 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31935 (_ BitVec 32)) SeekEntryResult!3819)

(assert (=> b!493500 (= res!296069 (= lt!223208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223209 (select (store (arr!15352 a!3235) i!1204 k0!2280) j!176) (array!31936 (store (arr!15352 a!3235) i!1204 k0!2280) (size!15716 a!3235)) mask!3524)))))

(declare-fun lt!223206 () (_ BitVec 32))

(assert (=> b!493500 (= lt!223208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223206 (select (arr!15352 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493500 (= lt!223209 (toIndex!0 (select (store (arr!15352 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493500 (= lt!223206 (toIndex!0 (select (arr!15352 a!3235) j!176) mask!3524))))

(declare-fun lt!223205 () SeekEntryResult!3819)

(assert (=> b!493500 (= lt!223205 (Found!3819 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31935 (_ BitVec 32)) SeekEntryResult!3819)

(assert (=> b!493500 (= lt!223205 (seekEntryOrOpen!0 (select (arr!15352 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31935 (_ BitVec 32)) Bool)

(assert (=> b!493500 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14584 0))(
  ( (Unit!14585) )
))
(declare-fun lt!223207 () Unit!14584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14584)

(assert (=> b!493500 (= lt!223207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493501 () Bool)

(declare-fun res!296067 () Bool)

(assert (=> b!493501 (=> (not res!296067) (not e!289806))))

(assert (=> b!493501 (= res!296067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493502 () Bool)

(assert (=> b!493502 (= e!289808 e!289806)))

(declare-fun res!296073 () Bool)

(assert (=> b!493502 (=> (not res!296073) (not e!289806))))

(declare-fun lt!223210 () SeekEntryResult!3819)

(assert (=> b!493502 (= res!296073 (or (= lt!223210 (MissingZero!3819 i!1204)) (= lt!223210 (MissingVacant!3819 i!1204))))))

(assert (=> b!493502 (= lt!223210 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!296066 () Bool)

(assert (=> start!44990 (=> (not res!296066) (not e!289808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44990 (= res!296066 (validMask!0 mask!3524))))

(assert (=> start!44990 e!289808))

(assert (=> start!44990 true))

(declare-fun array_inv!11148 (array!31935) Bool)

(assert (=> start!44990 (array_inv!11148 a!3235)))

(declare-fun b!493503 () Bool)

(assert (=> b!493503 (= e!289809 true)))

(assert (=> b!493503 (= lt!223205 Undefined!3819)))

(declare-fun b!493504 () Bool)

(declare-fun res!296072 () Bool)

(assert (=> b!493504 (=> (not res!296072) (not e!289806))))

(declare-datatypes ((List!9510 0))(
  ( (Nil!9507) (Cons!9506 (h!10374 (_ BitVec 64)) (t!15738 List!9510)) )
))
(declare-fun arrayNoDuplicates!0 (array!31935 (_ BitVec 32) List!9510) Bool)

(assert (=> b!493504 (= res!296072 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9507))))

(declare-fun b!493505 () Bool)

(declare-fun res!296071 () Bool)

(assert (=> b!493505 (=> (not res!296071) (not e!289808))))

(assert (=> b!493505 (= res!296071 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44990 res!296066) b!493499))

(assert (= (and b!493499 res!296070) b!493498))

(assert (= (and b!493498 res!296075) b!493505))

(assert (= (and b!493505 res!296071) b!493497))

(assert (= (and b!493497 res!296068) b!493502))

(assert (= (and b!493502 res!296073) b!493501))

(assert (= (and b!493501 res!296067) b!493504))

(assert (= (and b!493504 res!296072) b!493500))

(assert (= (and b!493500 (not res!296069)) b!493496))

(assert (= (and b!493496 (not res!296074)) b!493503))

(declare-fun m!474351 () Bool)

(assert (=> b!493502 m!474351))

(declare-fun m!474353 () Bool)

(assert (=> b!493501 m!474353))

(declare-fun m!474355 () Bool)

(assert (=> b!493498 m!474355))

(assert (=> b!493498 m!474355))

(declare-fun m!474357 () Bool)

(assert (=> b!493498 m!474357))

(declare-fun m!474359 () Bool)

(assert (=> b!493504 m!474359))

(declare-fun m!474361 () Bool)

(assert (=> start!44990 m!474361))

(declare-fun m!474363 () Bool)

(assert (=> start!44990 m!474363))

(declare-fun m!474365 () Bool)

(assert (=> b!493497 m!474365))

(declare-fun m!474367 () Bool)

(assert (=> b!493505 m!474367))

(declare-fun m!474369 () Bool)

(assert (=> b!493500 m!474369))

(declare-fun m!474371 () Bool)

(assert (=> b!493500 m!474371))

(declare-fun m!474373 () Bool)

(assert (=> b!493500 m!474373))

(assert (=> b!493500 m!474355))

(declare-fun m!474375 () Bool)

(assert (=> b!493500 m!474375))

(assert (=> b!493500 m!474355))

(declare-fun m!474377 () Bool)

(assert (=> b!493500 m!474377))

(assert (=> b!493500 m!474355))

(declare-fun m!474379 () Bool)

(assert (=> b!493500 m!474379))

(assert (=> b!493500 m!474373))

(declare-fun m!474381 () Bool)

(assert (=> b!493500 m!474381))

(assert (=> b!493500 m!474373))

(declare-fun m!474383 () Bool)

(assert (=> b!493500 m!474383))

(assert (=> b!493500 m!474355))

(declare-fun m!474385 () Bool)

(assert (=> b!493500 m!474385))

(check-sat (not b!493500) (not b!493497) (not b!493502) (not b!493498) (not start!44990) (not b!493505) (not b!493501) (not b!493504))
(check-sat)
