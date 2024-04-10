; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119204 () Bool)

(assert start!119204)

(declare-fun b!1390518 () Bool)

(declare-fun e!787454 () Bool)

(declare-datatypes ((SeekEntryResult!10253 0))(
  ( (MissingZero!10253 (index!43383 (_ BitVec 32))) (Found!10253 (index!43384 (_ BitVec 32))) (Intermediate!10253 (undefined!11065 Bool) (index!43385 (_ BitVec 32)) (x!125059 (_ BitVec 32))) (Undefined!10253) (MissingVacant!10253 (index!43386 (_ BitVec 32))) )
))
(declare-fun lt!610848 () SeekEntryResult!10253)

(declare-fun mask!2840 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1390518 (= e!787454 (not (or (not ((_ is Intermediate!10253) lt!610848)) (undefined!11065 lt!610848) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787453 () Bool)

(assert (=> b!1390518 e!787453))

(declare-fun res!930682 () Bool)

(assert (=> b!1390518 (=> (not res!930682) (not e!787453))))

(declare-datatypes ((array!95141 0))(
  ( (array!95142 (arr!45936 (Array (_ BitVec 32) (_ BitVec 64))) (size!46486 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95141)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95141 (_ BitVec 32)) Bool)

(assert (=> b!1390518 (= res!930682 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46510 0))(
  ( (Unit!46511) )
))
(declare-fun lt!610847 () Unit!46510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46510)

(assert (=> b!1390518 (= lt!610847 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95141 (_ BitVec 32)) SeekEntryResult!10253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390518 (= lt!610848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45936 a!2901) j!112) mask!2840) (select (arr!45936 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390519 () Bool)

(declare-fun res!930685 () Bool)

(assert (=> b!1390519 (=> (not res!930685) (not e!787454))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390519 (= res!930685 (validKeyInArray!0 (select (arr!45936 a!2901) i!1037)))))

(declare-fun b!1390520 () Bool)

(declare-fun res!930681 () Bool)

(assert (=> b!1390520 (=> (not res!930681) (not e!787454))))

(assert (=> b!1390520 (= res!930681 (validKeyInArray!0 (select (arr!45936 a!2901) j!112)))))

(declare-fun b!1390521 () Bool)

(declare-fun res!930683 () Bool)

(assert (=> b!1390521 (=> (not res!930683) (not e!787454))))

(assert (=> b!1390521 (= res!930683 (and (= (size!46486 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46486 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46486 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390522 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95141 (_ BitVec 32)) SeekEntryResult!10253)

(assert (=> b!1390522 (= e!787453 (= (seekEntryOrOpen!0 (select (arr!45936 a!2901) j!112) a!2901 mask!2840) (Found!10253 j!112)))))

(declare-fun res!930679 () Bool)

(assert (=> start!119204 (=> (not res!930679) (not e!787454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119204 (= res!930679 (validMask!0 mask!2840))))

(assert (=> start!119204 e!787454))

(assert (=> start!119204 true))

(declare-fun array_inv!34964 (array!95141) Bool)

(assert (=> start!119204 (array_inv!34964 a!2901)))

(declare-fun b!1390523 () Bool)

(declare-fun res!930680 () Bool)

(assert (=> b!1390523 (=> (not res!930680) (not e!787454))))

(declare-datatypes ((List!32455 0))(
  ( (Nil!32452) (Cons!32451 (h!33669 (_ BitVec 64)) (t!47149 List!32455)) )
))
(declare-fun arrayNoDuplicates!0 (array!95141 (_ BitVec 32) List!32455) Bool)

(assert (=> b!1390523 (= res!930680 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32452))))

(declare-fun b!1390524 () Bool)

(declare-fun res!930684 () Bool)

(assert (=> b!1390524 (=> (not res!930684) (not e!787454))))

(assert (=> b!1390524 (= res!930684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119204 res!930679) b!1390521))

(assert (= (and b!1390521 res!930683) b!1390519))

(assert (= (and b!1390519 res!930685) b!1390520))

(assert (= (and b!1390520 res!930681) b!1390524))

(assert (= (and b!1390524 res!930684) b!1390523))

(assert (= (and b!1390523 res!930680) b!1390518))

(assert (= (and b!1390518 res!930682) b!1390522))

(declare-fun m!1276385 () Bool)

(assert (=> b!1390522 m!1276385))

(assert (=> b!1390522 m!1276385))

(declare-fun m!1276387 () Bool)

(assert (=> b!1390522 m!1276387))

(declare-fun m!1276389 () Bool)

(assert (=> start!119204 m!1276389))

(declare-fun m!1276391 () Bool)

(assert (=> start!119204 m!1276391))

(declare-fun m!1276393 () Bool)

(assert (=> b!1390519 m!1276393))

(assert (=> b!1390519 m!1276393))

(declare-fun m!1276395 () Bool)

(assert (=> b!1390519 m!1276395))

(assert (=> b!1390518 m!1276385))

(declare-fun m!1276397 () Bool)

(assert (=> b!1390518 m!1276397))

(assert (=> b!1390518 m!1276385))

(declare-fun m!1276399 () Bool)

(assert (=> b!1390518 m!1276399))

(assert (=> b!1390518 m!1276397))

(assert (=> b!1390518 m!1276385))

(declare-fun m!1276401 () Bool)

(assert (=> b!1390518 m!1276401))

(declare-fun m!1276403 () Bool)

(assert (=> b!1390518 m!1276403))

(declare-fun m!1276405 () Bool)

(assert (=> b!1390524 m!1276405))

(declare-fun m!1276407 () Bool)

(assert (=> b!1390523 m!1276407))

(assert (=> b!1390520 m!1276385))

(assert (=> b!1390520 m!1276385))

(declare-fun m!1276409 () Bool)

(assert (=> b!1390520 m!1276409))

(check-sat (not start!119204) (not b!1390524) (not b!1390523) (not b!1390518) (not b!1390519) (not b!1390522) (not b!1390520))
(check-sat)
