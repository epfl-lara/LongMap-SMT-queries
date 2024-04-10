; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119360 () Bool)

(assert start!119360)

(declare-fun b!1391478 () Bool)

(declare-fun res!931348 () Bool)

(declare-fun e!787958 () Bool)

(assert (=> b!1391478 (=> (not res!931348) (not e!787958))))

(declare-datatypes ((array!95195 0))(
  ( (array!95196 (arr!45960 (Array (_ BitVec 32) (_ BitVec 64))) (size!46510 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95195)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391478 (= res!931348 (validKeyInArray!0 (select (arr!45960 a!2901) i!1037)))))

(declare-fun b!1391479 () Bool)

(declare-datatypes ((SeekEntryResult!10277 0))(
  ( (MissingZero!10277 (index!43479 (_ BitVec 32))) (Found!10277 (index!43480 (_ BitVec 32))) (Intermediate!10277 (undefined!11089 Bool) (index!43481 (_ BitVec 32)) (x!125159 (_ BitVec 32))) (Undefined!10277) (MissingVacant!10277 (index!43482 (_ BitVec 32))) )
))
(declare-fun lt!611216 () SeekEntryResult!10277)

(declare-fun mask!2840 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1391479 (= e!787958 (not (or (not ((_ is Intermediate!10277) lt!611216)) (undefined!11089 lt!611216) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787957 () Bool)

(assert (=> b!1391479 e!787957))

(declare-fun res!931349 () Bool)

(assert (=> b!1391479 (=> (not res!931349) (not e!787957))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95195 (_ BitVec 32)) Bool)

(assert (=> b!1391479 (= res!931349 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46558 0))(
  ( (Unit!46559) )
))
(declare-fun lt!611217 () Unit!46558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46558)

(assert (=> b!1391479 (= lt!611217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95195 (_ BitVec 32)) SeekEntryResult!10277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391479 (= lt!611216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45960 a!2901) j!112) mask!2840) (select (arr!45960 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391480 () Bool)

(declare-fun res!931345 () Bool)

(assert (=> b!1391480 (=> (not res!931345) (not e!787958))))

(assert (=> b!1391480 (= res!931345 (validKeyInArray!0 (select (arr!45960 a!2901) j!112)))))

(declare-fun b!1391481 () Bool)

(declare-fun res!931347 () Bool)

(assert (=> b!1391481 (=> (not res!931347) (not e!787958))))

(assert (=> b!1391481 (= res!931347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931346 () Bool)

(assert (=> start!119360 (=> (not res!931346) (not e!787958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119360 (= res!931346 (validMask!0 mask!2840))))

(assert (=> start!119360 e!787958))

(assert (=> start!119360 true))

(declare-fun array_inv!34988 (array!95195) Bool)

(assert (=> start!119360 (array_inv!34988 a!2901)))

(declare-fun b!1391482 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95195 (_ BitVec 32)) SeekEntryResult!10277)

(assert (=> b!1391482 (= e!787957 (= (seekEntryOrOpen!0 (select (arr!45960 a!2901) j!112) a!2901 mask!2840) (Found!10277 j!112)))))

(declare-fun b!1391483 () Bool)

(declare-fun res!931350 () Bool)

(assert (=> b!1391483 (=> (not res!931350) (not e!787958))))

(assert (=> b!1391483 (= res!931350 (and (= (size!46510 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46510 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46510 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391484 () Bool)

(declare-fun res!931351 () Bool)

(assert (=> b!1391484 (=> (not res!931351) (not e!787958))))

(declare-datatypes ((List!32479 0))(
  ( (Nil!32476) (Cons!32475 (h!33699 (_ BitVec 64)) (t!47173 List!32479)) )
))
(declare-fun arrayNoDuplicates!0 (array!95195 (_ BitVec 32) List!32479) Bool)

(assert (=> b!1391484 (= res!931351 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32476))))

(assert (= (and start!119360 res!931346) b!1391483))

(assert (= (and b!1391483 res!931350) b!1391478))

(assert (= (and b!1391478 res!931348) b!1391480))

(assert (= (and b!1391480 res!931345) b!1391481))

(assert (= (and b!1391481 res!931347) b!1391484))

(assert (= (and b!1391484 res!931351) b!1391479))

(assert (= (and b!1391479 res!931349) b!1391482))

(declare-fun m!1277267 () Bool)

(assert (=> b!1391480 m!1277267))

(assert (=> b!1391480 m!1277267))

(declare-fun m!1277269 () Bool)

(assert (=> b!1391480 m!1277269))

(assert (=> b!1391482 m!1277267))

(assert (=> b!1391482 m!1277267))

(declare-fun m!1277271 () Bool)

(assert (=> b!1391482 m!1277271))

(declare-fun m!1277273 () Bool)

(assert (=> start!119360 m!1277273))

(declare-fun m!1277275 () Bool)

(assert (=> start!119360 m!1277275))

(assert (=> b!1391479 m!1277267))

(declare-fun m!1277277 () Bool)

(assert (=> b!1391479 m!1277277))

(assert (=> b!1391479 m!1277267))

(declare-fun m!1277279 () Bool)

(assert (=> b!1391479 m!1277279))

(assert (=> b!1391479 m!1277277))

(assert (=> b!1391479 m!1277267))

(declare-fun m!1277281 () Bool)

(assert (=> b!1391479 m!1277281))

(declare-fun m!1277283 () Bool)

(assert (=> b!1391479 m!1277283))

(declare-fun m!1277285 () Bool)

(assert (=> b!1391484 m!1277285))

(declare-fun m!1277287 () Bool)

(assert (=> b!1391478 m!1277287))

(assert (=> b!1391478 m!1277287))

(declare-fun m!1277289 () Bool)

(assert (=> b!1391478 m!1277289))

(declare-fun m!1277291 () Bool)

(assert (=> b!1391481 m!1277291))

(check-sat (not b!1391478) (not b!1391480) (not b!1391484) (not b!1391482) (not b!1391481) (not b!1391479) (not start!119360))
(check-sat)
