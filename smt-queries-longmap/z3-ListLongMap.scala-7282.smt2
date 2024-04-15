; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93052 () Bool)

(assert start!93052)

(declare-fun lt!465679 () (_ BitVec 32))

(declare-fun b!1055579 () Bool)

(declare-datatypes ((array!66518 0))(
  ( (array!66519 (arr!31986 (Array (_ BitVec 32) (_ BitVec 64))) (size!32524 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66518)

(declare-fun e!599962 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055579 (= e!599962 (arrayContainsKey!0 a!3488 k0!2747 lt!465679))))

(declare-fun b!1055580 () Bool)

(declare-fun res!704480 () Bool)

(declare-fun e!599964 () Bool)

(assert (=> b!1055580 (=> (not res!704480) (not e!599964))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055580 (= res!704480 (= (select (arr!31986 a!3488) i!1381) k0!2747))))

(declare-fun b!1055581 () Bool)

(declare-fun e!599965 () Bool)

(assert (=> b!1055581 (= e!599965 true)))

(assert (=> b!1055581 false))

(declare-datatypes ((Unit!34463 0))(
  ( (Unit!34464) )
))
(declare-fun lt!465678 () Unit!34463)

(declare-datatypes ((List!22357 0))(
  ( (Nil!22354) (Cons!22353 (h!23562 (_ BitVec 64)) (t!31655 List!22357)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66518 (_ BitVec 64) (_ BitVec 32) List!22357) Unit!34463)

(assert (=> b!1055581 (= lt!465678 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22354))))

(assert (=> b!1055581 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465682 () Unit!34463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34463)

(assert (=> b!1055581 (= lt!465682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465679 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66518 (_ BitVec 32) List!22357) Bool)

(assert (=> b!1055581 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22354)))

(declare-fun lt!465680 () Unit!34463)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66518 (_ BitVec 32) (_ BitVec 32)) Unit!34463)

(assert (=> b!1055581 (= lt!465680 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055582 () Bool)

(declare-fun res!704484 () Bool)

(assert (=> b!1055582 (=> (not res!704484) (not e!599964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055582 (= res!704484 (validKeyInArray!0 k0!2747))))

(declare-fun res!704478 () Bool)

(assert (=> start!93052 (=> (not res!704478) (not e!599964))))

(assert (=> start!93052 (= res!704478 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32524 a!3488)) (bvslt (size!32524 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93052 e!599964))

(assert (=> start!93052 true))

(declare-fun array_inv!24769 (array!66518) Bool)

(assert (=> start!93052 (array_inv!24769 a!3488)))

(declare-fun b!1055583 () Bool)

(declare-fun res!704479 () Bool)

(assert (=> b!1055583 (=> (not res!704479) (not e!599964))))

(assert (=> b!1055583 (= res!704479 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22354))))

(declare-fun b!1055584 () Bool)

(declare-fun e!599961 () Bool)

(assert (=> b!1055584 (= e!599961 (not e!599965))))

(declare-fun res!704481 () Bool)

(assert (=> b!1055584 (=> res!704481 e!599965)))

(assert (=> b!1055584 (= res!704481 (bvsle lt!465679 i!1381))))

(declare-fun e!599963 () Bool)

(assert (=> b!1055584 e!599963))

(declare-fun res!704477 () Bool)

(assert (=> b!1055584 (=> (not res!704477) (not e!599963))))

(assert (=> b!1055584 (= res!704477 (= (select (store (arr!31986 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465679) k0!2747))))

(declare-fun b!1055585 () Bool)

(declare-fun e!599966 () Bool)

(assert (=> b!1055585 (= e!599964 e!599966)))

(declare-fun res!704482 () Bool)

(assert (=> b!1055585 (=> (not res!704482) (not e!599966))))

(declare-fun lt!465681 () array!66518)

(assert (=> b!1055585 (= res!704482 (arrayContainsKey!0 lt!465681 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055585 (= lt!465681 (array!66519 (store (arr!31986 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32524 a!3488)))))

(declare-fun b!1055586 () Bool)

(assert (=> b!1055586 (= e!599963 e!599962)))

(declare-fun res!704485 () Bool)

(assert (=> b!1055586 (=> res!704485 e!599962)))

(assert (=> b!1055586 (= res!704485 (bvsle lt!465679 i!1381))))

(declare-fun b!1055587 () Bool)

(assert (=> b!1055587 (= e!599966 e!599961)))

(declare-fun res!704483 () Bool)

(assert (=> b!1055587 (=> (not res!704483) (not e!599961))))

(assert (=> b!1055587 (= res!704483 (not (= lt!465679 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66518 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055587 (= lt!465679 (arrayScanForKey!0 lt!465681 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93052 res!704478) b!1055583))

(assert (= (and b!1055583 res!704479) b!1055582))

(assert (= (and b!1055582 res!704484) b!1055580))

(assert (= (and b!1055580 res!704480) b!1055585))

(assert (= (and b!1055585 res!704482) b!1055587))

(assert (= (and b!1055587 res!704483) b!1055584))

(assert (= (and b!1055584 res!704477) b!1055586))

(assert (= (and b!1055586 (not res!704485)) b!1055579))

(assert (= (and b!1055584 (not res!704481)) b!1055581))

(declare-fun m!975085 () Bool)

(assert (=> b!1055587 m!975085))

(declare-fun m!975087 () Bool)

(assert (=> b!1055580 m!975087))

(declare-fun m!975089 () Bool)

(assert (=> b!1055579 m!975089))

(declare-fun m!975091 () Bool)

(assert (=> b!1055583 m!975091))

(declare-fun m!975093 () Bool)

(assert (=> start!93052 m!975093))

(declare-fun m!975095 () Bool)

(assert (=> b!1055581 m!975095))

(declare-fun m!975097 () Bool)

(assert (=> b!1055581 m!975097))

(declare-fun m!975099 () Bool)

(assert (=> b!1055581 m!975099))

(declare-fun m!975101 () Bool)

(assert (=> b!1055581 m!975101))

(declare-fun m!975103 () Bool)

(assert (=> b!1055581 m!975103))

(declare-fun m!975105 () Bool)

(assert (=> b!1055584 m!975105))

(declare-fun m!975107 () Bool)

(assert (=> b!1055584 m!975107))

(declare-fun m!975109 () Bool)

(assert (=> b!1055582 m!975109))

(declare-fun m!975111 () Bool)

(assert (=> b!1055585 m!975111))

(assert (=> b!1055585 m!975105))

(check-sat (not b!1055585) (not b!1055583) (not b!1055579) (not b!1055582) (not b!1055581) (not start!93052) (not b!1055587))
(check-sat)
