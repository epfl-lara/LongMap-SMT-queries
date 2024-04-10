; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45762 () Bool)

(assert start!45762)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32518 0))(
  ( (array!32519 (arr!15639 (Array (_ BitVec 32) (_ BitVec 64))) (size!16003 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32518)

(declare-fun b!506356 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!296372 () Bool)

(declare-datatypes ((SeekEntryResult!4106 0))(
  ( (MissingZero!4106 (index!18612 (_ BitVec 32))) (Found!4106 (index!18613 (_ BitVec 32))) (Intermediate!4106 (undefined!4918 Bool) (index!18614 (_ BitVec 32)) (x!47619 (_ BitVec 32))) (Undefined!4106) (MissingVacant!4106 (index!18615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32518 (_ BitVec 32)) SeekEntryResult!4106)

(assert (=> b!506356 (= e!296372 (= (seekEntryOrOpen!0 (select (arr!15639 a!3235) j!176) a!3235 mask!3524) (Found!4106 j!176)))))

(declare-fun b!506357 () Bool)

(declare-fun res!307315 () Bool)

(declare-fun e!296375 () Bool)

(assert (=> b!506357 (=> (not res!307315) (not e!296375))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506357 (= res!307315 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!307325 () Bool)

(assert (=> start!45762 (=> (not res!307325) (not e!296375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45762 (= res!307325 (validMask!0 mask!3524))))

(assert (=> start!45762 e!296375))

(assert (=> start!45762 true))

(declare-fun array_inv!11435 (array!32518) Bool)

(assert (=> start!45762 (array_inv!11435 a!3235)))

(declare-fun b!506358 () Bool)

(declare-fun res!307319 () Bool)

(declare-fun e!296376 () Bool)

(assert (=> b!506358 (=> (not res!307319) (not e!296376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32518 (_ BitVec 32)) Bool)

(assert (=> b!506358 (= res!307319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506359 () Bool)

(declare-fun e!296374 () Bool)

(assert (=> b!506359 (= e!296374 true)))

(assert (=> b!506359 false))

(declare-fun b!506360 () Bool)

(assert (=> b!506360 (= e!296375 e!296376)))

(declare-fun res!307318 () Bool)

(assert (=> b!506360 (=> (not res!307318) (not e!296376))))

(declare-fun lt!231052 () SeekEntryResult!4106)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506360 (= res!307318 (or (= lt!231052 (MissingZero!4106 i!1204)) (= lt!231052 (MissingVacant!4106 i!1204))))))

(assert (=> b!506360 (= lt!231052 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506361 () Bool)

(declare-fun res!307321 () Bool)

(assert (=> b!506361 (=> (not res!307321) (not e!296375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506361 (= res!307321 (validKeyInArray!0 k!2280))))

(declare-fun b!506362 () Bool)

(declare-fun e!296371 () Bool)

(assert (=> b!506362 (= e!296371 e!296374)))

(declare-fun res!307320 () Bool)

(assert (=> b!506362 (=> res!307320 e!296374)))

(declare-fun lt!231049 () Bool)

(declare-fun lt!231051 () SeekEntryResult!4106)

(assert (=> b!506362 (= res!307320 (or (and (not lt!231049) (undefined!4918 lt!231051)) (and (not lt!231049) (not (undefined!4918 lt!231051)))))))

(assert (=> b!506362 (= lt!231049 (not (is-Intermediate!4106 lt!231051)))))

(declare-fun b!506363 () Bool)

(declare-fun res!307322 () Bool)

(assert (=> b!506363 (=> (not res!307322) (not e!296375))))

(assert (=> b!506363 (= res!307322 (and (= (size!16003 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16003 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16003 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506364 () Bool)

(assert (=> b!506364 (= e!296376 (not e!296371))))

(declare-fun res!307323 () Bool)

(assert (=> b!506364 (=> res!307323 e!296371)))

(declare-fun lt!231048 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32518 (_ BitVec 32)) SeekEntryResult!4106)

(assert (=> b!506364 (= res!307323 (= lt!231051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231048 (select (store (arr!15639 a!3235) i!1204 k!2280) j!176) (array!32519 (store (arr!15639 a!3235) i!1204 k!2280) (size!16003 a!3235)) mask!3524)))))

(declare-fun lt!231050 () (_ BitVec 32))

(assert (=> b!506364 (= lt!231051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231050 (select (arr!15639 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506364 (= lt!231048 (toIndex!0 (select (store (arr!15639 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506364 (= lt!231050 (toIndex!0 (select (arr!15639 a!3235) j!176) mask!3524))))

(assert (=> b!506364 e!296372))

(declare-fun res!307324 () Bool)

(assert (=> b!506364 (=> (not res!307324) (not e!296372))))

(assert (=> b!506364 (= res!307324 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15500 0))(
  ( (Unit!15501) )
))
(declare-fun lt!231047 () Unit!15500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15500)

(assert (=> b!506364 (= lt!231047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506365 () Bool)

(declare-fun res!307316 () Bool)

(assert (=> b!506365 (=> (not res!307316) (not e!296375))))

(assert (=> b!506365 (= res!307316 (validKeyInArray!0 (select (arr!15639 a!3235) j!176)))))

(declare-fun b!506366 () Bool)

(declare-fun res!307317 () Bool)

(assert (=> b!506366 (=> (not res!307317) (not e!296376))))

(declare-datatypes ((List!9797 0))(
  ( (Nil!9794) (Cons!9793 (h!10670 (_ BitVec 64)) (t!16025 List!9797)) )
))
(declare-fun arrayNoDuplicates!0 (array!32518 (_ BitVec 32) List!9797) Bool)

(assert (=> b!506366 (= res!307317 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9794))))

(assert (= (and start!45762 res!307325) b!506363))

(assert (= (and b!506363 res!307322) b!506365))

(assert (= (and b!506365 res!307316) b!506361))

(assert (= (and b!506361 res!307321) b!506357))

(assert (= (and b!506357 res!307315) b!506360))

(assert (= (and b!506360 res!307318) b!506358))

(assert (= (and b!506358 res!307319) b!506366))

(assert (= (and b!506366 res!307317) b!506364))

(assert (= (and b!506364 res!307324) b!506356))

(assert (= (and b!506364 (not res!307323)) b!506362))

(assert (= (and b!506362 (not res!307320)) b!506359))

(declare-fun m!487011 () Bool)

(assert (=> b!506365 m!487011))

(assert (=> b!506365 m!487011))

(declare-fun m!487013 () Bool)

(assert (=> b!506365 m!487013))

(declare-fun m!487015 () Bool)

(assert (=> b!506358 m!487015))

(declare-fun m!487017 () Bool)

(assert (=> b!506364 m!487017))

(declare-fun m!487019 () Bool)

(assert (=> b!506364 m!487019))

(declare-fun m!487021 () Bool)

(assert (=> b!506364 m!487021))

(assert (=> b!506364 m!487011))

(declare-fun m!487023 () Bool)

(assert (=> b!506364 m!487023))

(assert (=> b!506364 m!487011))

(declare-fun m!487025 () Bool)

(assert (=> b!506364 m!487025))

(assert (=> b!506364 m!487011))

(assert (=> b!506364 m!487021))

(declare-fun m!487027 () Bool)

(assert (=> b!506364 m!487027))

(declare-fun m!487029 () Bool)

(assert (=> b!506364 m!487029))

(assert (=> b!506364 m!487021))

(declare-fun m!487031 () Bool)

(assert (=> b!506364 m!487031))

(assert (=> b!506356 m!487011))

(assert (=> b!506356 m!487011))

(declare-fun m!487033 () Bool)

(assert (=> b!506356 m!487033))

(declare-fun m!487035 () Bool)

(assert (=> start!45762 m!487035))

(declare-fun m!487037 () Bool)

(assert (=> start!45762 m!487037))

(declare-fun m!487039 () Bool)

(assert (=> b!506361 m!487039))

(declare-fun m!487041 () Bool)

(assert (=> b!506366 m!487041))

(declare-fun m!487043 () Bool)

(assert (=> b!506357 m!487043))

(declare-fun m!487045 () Bool)

(assert (=> b!506360 m!487045))

(push 1)

