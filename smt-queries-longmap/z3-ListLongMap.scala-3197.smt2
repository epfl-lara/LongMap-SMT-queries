; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44870 () Bool)

(assert start!44870)

(declare-fun b!492359 () Bool)

(declare-fun res!295114 () Bool)

(declare-fun e!289241 () Bool)

(assert (=> b!492359 (=> (not res!295114) (not e!289241))))

(declare-datatypes ((array!31872 0))(
  ( (array!31873 (arr!15322 (Array (_ BitVec 32) (_ BitVec 64))) (size!15686 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31872)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31872 (_ BitVec 32)) Bool)

(assert (=> b!492359 (= res!295114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!289242 () Bool)

(declare-fun b!492360 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3789 0))(
  ( (MissingZero!3789 (index!17335 (_ BitVec 32))) (Found!3789 (index!17336 (_ BitVec 32))) (Intermediate!3789 (undefined!4601 Bool) (index!17337 (_ BitVec 32)) (x!46421 (_ BitVec 32))) (Undefined!3789) (MissingVacant!3789 (index!17338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31872 (_ BitVec 32)) SeekEntryResult!3789)

(assert (=> b!492360 (= e!289242 (= (seekEntryOrOpen!0 (select (arr!15322 a!3235) j!176) a!3235 mask!3524) (Found!3789 j!176)))))

(declare-fun b!492361 () Bool)

(declare-fun res!295117 () Bool)

(declare-fun e!289238 () Bool)

(assert (=> b!492361 (=> (not res!295117) (not e!289238))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492361 (= res!295117 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492362 () Bool)

(declare-fun res!295116 () Bool)

(assert (=> b!492362 (=> (not res!295116) (not e!289241))))

(declare-datatypes ((List!9480 0))(
  ( (Nil!9477) (Cons!9476 (h!10341 (_ BitVec 64)) (t!15708 List!9480)) )
))
(declare-fun arrayNoDuplicates!0 (array!31872 (_ BitVec 32) List!9480) Bool)

(assert (=> b!492362 (= res!295116 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9477))))

(declare-fun res!295120 () Bool)

(assert (=> start!44870 (=> (not res!295120) (not e!289238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44870 (= res!295120 (validMask!0 mask!3524))))

(assert (=> start!44870 e!289238))

(assert (=> start!44870 true))

(declare-fun array_inv!11118 (array!31872) Bool)

(assert (=> start!44870 (array_inv!11118 a!3235)))

(declare-fun b!492363 () Bool)

(declare-fun res!295113 () Bool)

(assert (=> b!492363 (=> (not res!295113) (not e!289238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492363 (= res!295113 (validKeyInArray!0 (select (arr!15322 a!3235) j!176)))))

(declare-fun b!492364 () Bool)

(declare-fun res!295115 () Bool)

(assert (=> b!492364 (=> (not res!295115) (not e!289238))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492364 (= res!295115 (and (= (size!15686 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15686 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15686 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492365 () Bool)

(declare-fun res!295112 () Bool)

(assert (=> b!492365 (=> (not res!295112) (not e!289238))))

(assert (=> b!492365 (= res!295112 (validKeyInArray!0 k0!2280))))

(declare-fun b!492366 () Bool)

(declare-fun e!289239 () Bool)

(assert (=> b!492366 (= e!289239 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!492367 () Bool)

(assert (=> b!492367 (= e!289238 e!289241)))

(declare-fun res!295118 () Bool)

(assert (=> b!492367 (=> (not res!295118) (not e!289241))))

(declare-fun lt!222588 () SeekEntryResult!3789)

(assert (=> b!492367 (= res!295118 (or (= lt!222588 (MissingZero!3789 i!1204)) (= lt!222588 (MissingVacant!3789 i!1204))))))

(assert (=> b!492367 (= lt!222588 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492368 () Bool)

(assert (=> b!492368 (= e!289241 (not e!289239))))

(declare-fun res!295119 () Bool)

(assert (=> b!492368 (=> res!295119 e!289239)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31872 (_ BitVec 32)) SeekEntryResult!3789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492368 (= res!295119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15322 a!3235) j!176) mask!3524) (select (arr!15322 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15322 a!3235) i!1204 k0!2280) j!176) (array!31873 (store (arr!15322 a!3235) i!1204 k0!2280) (size!15686 a!3235)) mask!3524)))))

(assert (=> b!492368 e!289242))

(declare-fun res!295121 () Bool)

(assert (=> b!492368 (=> (not res!295121) (not e!289242))))

(assert (=> b!492368 (= res!295121 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14524 0))(
  ( (Unit!14525) )
))
(declare-fun lt!222589 () Unit!14524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14524)

(assert (=> b!492368 (= lt!222589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44870 res!295120) b!492364))

(assert (= (and b!492364 res!295115) b!492363))

(assert (= (and b!492363 res!295113) b!492365))

(assert (= (and b!492365 res!295112) b!492361))

(assert (= (and b!492361 res!295117) b!492367))

(assert (= (and b!492367 res!295118) b!492359))

(assert (= (and b!492359 res!295114) b!492362))

(assert (= (and b!492362 res!295116) b!492368))

(assert (= (and b!492368 res!295121) b!492360))

(assert (= (and b!492368 (not res!295119)) b!492366))

(declare-fun m!473067 () Bool)

(assert (=> b!492362 m!473067))

(declare-fun m!473069 () Bool)

(assert (=> b!492365 m!473069))

(declare-fun m!473071 () Bool)

(assert (=> b!492368 m!473071))

(declare-fun m!473073 () Bool)

(assert (=> b!492368 m!473073))

(declare-fun m!473075 () Bool)

(assert (=> b!492368 m!473075))

(declare-fun m!473077 () Bool)

(assert (=> b!492368 m!473077))

(declare-fun m!473079 () Bool)

(assert (=> b!492368 m!473079))

(declare-fun m!473081 () Bool)

(assert (=> b!492368 m!473081))

(assert (=> b!492368 m!473079))

(assert (=> b!492368 m!473077))

(declare-fun m!473083 () Bool)

(assert (=> b!492368 m!473083))

(assert (=> b!492368 m!473075))

(declare-fun m!473085 () Bool)

(assert (=> b!492368 m!473085))

(assert (=> b!492368 m!473079))

(declare-fun m!473087 () Bool)

(assert (=> b!492368 m!473087))

(assert (=> b!492368 m!473075))

(assert (=> b!492368 m!473083))

(declare-fun m!473089 () Bool)

(assert (=> b!492359 m!473089))

(declare-fun m!473091 () Bool)

(assert (=> b!492367 m!473091))

(assert (=> b!492360 m!473079))

(assert (=> b!492360 m!473079))

(declare-fun m!473093 () Bool)

(assert (=> b!492360 m!473093))

(declare-fun m!473095 () Bool)

(assert (=> b!492361 m!473095))

(declare-fun m!473097 () Bool)

(assert (=> start!44870 m!473097))

(declare-fun m!473099 () Bool)

(assert (=> start!44870 m!473099))

(assert (=> b!492363 m!473079))

(assert (=> b!492363 m!473079))

(declare-fun m!473101 () Bool)

(assert (=> b!492363 m!473101))

(check-sat (not start!44870) (not b!492360) (not b!492359) (not b!492362) (not b!492365) (not b!492361) (not b!492363) (not b!492368) (not b!492367))
(check-sat)
