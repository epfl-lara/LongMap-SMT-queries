; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119428 () Bool)

(assert start!119428)

(declare-fun res!931583 () Bool)

(declare-fun e!788171 () Bool)

(assert (=> start!119428 (=> (not res!931583) (not e!788171))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119428 (= res!931583 (validMask!0 mask!2840))))

(assert (=> start!119428 e!788171))

(assert (=> start!119428 true))

(declare-datatypes ((array!95212 0))(
  ( (array!95213 (arr!45967 (Array (_ BitVec 32) (_ BitVec 64))) (size!46517 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95212)

(declare-fun array_inv!34995 (array!95212) Bool)

(assert (=> start!119428 (array_inv!34995 a!2901)))

(declare-fun b!1391861 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!788173 () Bool)

(declare-datatypes ((SeekEntryResult!10284 0))(
  ( (MissingZero!10284 (index!43507 (_ BitVec 32))) (Found!10284 (index!43508 (_ BitVec 32))) (Intermediate!10284 (undefined!11096 Bool) (index!43509 (_ BitVec 32)) (x!125188 (_ BitVec 32))) (Undefined!10284) (MissingVacant!10284 (index!43510 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95212 (_ BitVec 32)) SeekEntryResult!10284)

(assert (=> b!1391861 (= e!788173 (= (seekEntryOrOpen!0 (select (arr!45967 a!2901) j!112) a!2901 mask!2840) (Found!10284 j!112)))))

(declare-fun b!1391862 () Bool)

(declare-fun res!931586 () Bool)

(assert (=> b!1391862 (=> (not res!931586) (not e!788171))))

(declare-datatypes ((List!32486 0))(
  ( (Nil!32483) (Cons!32482 (h!33709 (_ BitVec 64)) (t!47180 List!32486)) )
))
(declare-fun arrayNoDuplicates!0 (array!95212 (_ BitVec 32) List!32486) Bool)

(assert (=> b!1391862 (= res!931586 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32483))))

(declare-fun b!1391863 () Bool)

(declare-fun res!931587 () Bool)

(assert (=> b!1391863 (=> (not res!931587) (not e!788171))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391863 (= res!931587 (validKeyInArray!0 (select (arr!45967 a!2901) i!1037)))))

(declare-fun b!1391864 () Bool)

(declare-fun res!931585 () Bool)

(assert (=> b!1391864 (=> (not res!931585) (not e!788171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95212 (_ BitVec 32)) Bool)

(assert (=> b!1391864 (= res!931585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391865 () Bool)

(declare-fun e!788174 () Bool)

(assert (=> b!1391865 (= e!788171 (not e!788174))))

(declare-fun res!931581 () Bool)

(assert (=> b!1391865 (=> res!931581 e!788174)))

(declare-fun lt!611375 () SeekEntryResult!10284)

(assert (=> b!1391865 (= res!931581 (or (not (is-Intermediate!10284 lt!611375)) (undefined!11096 lt!611375)))))

(assert (=> b!1391865 e!788173))

(declare-fun res!931584 () Bool)

(assert (=> b!1391865 (=> (not res!931584) (not e!788173))))

(assert (=> b!1391865 (= res!931584 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46572 0))(
  ( (Unit!46573) )
))
(declare-fun lt!611376 () Unit!46572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46572)

(assert (=> b!1391865 (= lt!611376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95212 (_ BitVec 32)) SeekEntryResult!10284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391865 (= lt!611375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45967 a!2901) j!112) mask!2840) (select (arr!45967 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391866 () Bool)

(assert (=> b!1391866 (= e!788174 true)))

(declare-fun lt!611374 () (_ BitVec 32))

(assert (=> b!1391866 (= lt!611374 (toIndex!0 (select (store (arr!45967 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391867 () Bool)

(declare-fun res!931588 () Bool)

(assert (=> b!1391867 (=> (not res!931588) (not e!788171))))

(assert (=> b!1391867 (= res!931588 (and (= (size!46517 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46517 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46517 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391868 () Bool)

(declare-fun res!931582 () Bool)

(assert (=> b!1391868 (=> (not res!931582) (not e!788171))))

(assert (=> b!1391868 (= res!931582 (validKeyInArray!0 (select (arr!45967 a!2901) j!112)))))

(assert (= (and start!119428 res!931583) b!1391867))

(assert (= (and b!1391867 res!931588) b!1391863))

(assert (= (and b!1391863 res!931587) b!1391868))

(assert (= (and b!1391868 res!931582) b!1391864))

(assert (= (and b!1391864 res!931585) b!1391862))

(assert (= (and b!1391862 res!931586) b!1391865))

(assert (= (and b!1391865 res!931584) b!1391861))

(assert (= (and b!1391865 (not res!931581)) b!1391866))

(declare-fun m!1277587 () Bool)

(assert (=> start!119428 m!1277587))

(declare-fun m!1277589 () Bool)

(assert (=> start!119428 m!1277589))

(declare-fun m!1277591 () Bool)

(assert (=> b!1391861 m!1277591))

(assert (=> b!1391861 m!1277591))

(declare-fun m!1277593 () Bool)

(assert (=> b!1391861 m!1277593))

(declare-fun m!1277595 () Bool)

(assert (=> b!1391864 m!1277595))

(declare-fun m!1277597 () Bool)

(assert (=> b!1391863 m!1277597))

(assert (=> b!1391863 m!1277597))

(declare-fun m!1277599 () Bool)

(assert (=> b!1391863 m!1277599))

(declare-fun m!1277601 () Bool)

(assert (=> b!1391862 m!1277601))

(assert (=> b!1391865 m!1277591))

(declare-fun m!1277603 () Bool)

(assert (=> b!1391865 m!1277603))

(assert (=> b!1391865 m!1277591))

(declare-fun m!1277605 () Bool)

(assert (=> b!1391865 m!1277605))

(assert (=> b!1391865 m!1277603))

(assert (=> b!1391865 m!1277591))

(declare-fun m!1277607 () Bool)

(assert (=> b!1391865 m!1277607))

(declare-fun m!1277609 () Bool)

(assert (=> b!1391865 m!1277609))

(assert (=> b!1391868 m!1277591))

(assert (=> b!1391868 m!1277591))

(declare-fun m!1277611 () Bool)

(assert (=> b!1391868 m!1277611))

(declare-fun m!1277613 () Bool)

(assert (=> b!1391866 m!1277613))

(declare-fun m!1277615 () Bool)

(assert (=> b!1391866 m!1277615))

(assert (=> b!1391866 m!1277615))

(declare-fun m!1277617 () Bool)

(assert (=> b!1391866 m!1277617))

(push 1)

(assert (not b!1391862))

(assert (not b!1391863))

(assert (not b!1391866))

(assert (not start!119428))

(assert (not b!1391868))

(assert (not b!1391861))

(assert (not b!1391864))

(assert (not b!1391865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

