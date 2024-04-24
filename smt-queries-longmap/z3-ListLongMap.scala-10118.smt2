; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119390 () Bool)

(assert start!119390)

(declare-fun b!1391637 () Bool)

(declare-fun res!931118 () Bool)

(declare-fun e!788181 () Bool)

(assert (=> b!1391637 (=> (not res!931118) (not e!788181))))

(declare-datatypes ((array!95249 0))(
  ( (array!95250 (arr!45988 (Array (_ BitVec 32) (_ BitVec 64))) (size!46539 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95249)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391637 (= res!931118 (validKeyInArray!0 (select (arr!45988 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1391638 () Bool)

(declare-fun e!788183 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10208 0))(
  ( (MissingZero!10208 (index!43203 (_ BitVec 32))) (Found!10208 (index!43204 (_ BitVec 32))) (Intermediate!10208 (undefined!11020 Bool) (index!43205 (_ BitVec 32)) (x!125033 (_ BitVec 32))) (Undefined!10208) (MissingVacant!10208 (index!43206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95249 (_ BitVec 32)) SeekEntryResult!10208)

(assert (=> b!1391638 (= e!788183 (= (seekEntryOrOpen!0 (select (arr!45988 a!2901) j!112) a!2901 mask!2840) (Found!10208 j!112)))))

(declare-fun res!931117 () Bool)

(assert (=> start!119390 (=> (not res!931117) (not e!788181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119390 (= res!931117 (validMask!0 mask!2840))))

(assert (=> start!119390 e!788181))

(assert (=> start!119390 true))

(declare-fun array_inv!35269 (array!95249) Bool)

(assert (=> start!119390 (array_inv!35269 a!2901)))

(declare-fun b!1391639 () Bool)

(declare-fun res!931115 () Bool)

(assert (=> b!1391639 (=> (not res!931115) (not e!788181))))

(assert (=> b!1391639 (= res!931115 (and (= (size!46539 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46539 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46539 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391640 () Bool)

(declare-fun res!931119 () Bool)

(assert (=> b!1391640 (=> (not res!931119) (not e!788181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95249 (_ BitVec 32)) Bool)

(assert (=> b!1391640 (= res!931119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391641 () Bool)

(declare-fun lt!611239 () SeekEntryResult!10208)

(get-info :version)

(assert (=> b!1391641 (= e!788181 (not (or (not ((_ is Intermediate!10208) lt!611239)) (undefined!11020 lt!611239) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1391641 e!788183))

(declare-fun res!931116 () Bool)

(assert (=> b!1391641 (=> (not res!931116) (not e!788183))))

(assert (=> b!1391641 (= res!931116 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46447 0))(
  ( (Unit!46448) )
))
(declare-fun lt!611240 () Unit!46447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46447)

(assert (=> b!1391641 (= lt!611240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95249 (_ BitVec 32)) SeekEntryResult!10208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391641 (= lt!611239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45988 a!2901) j!112) mask!2840) (select (arr!45988 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391642 () Bool)

(declare-fun res!931114 () Bool)

(assert (=> b!1391642 (=> (not res!931114) (not e!788181))))

(assert (=> b!1391642 (= res!931114 (validKeyInArray!0 (select (arr!45988 a!2901) j!112)))))

(declare-fun b!1391643 () Bool)

(declare-fun res!931120 () Bool)

(assert (=> b!1391643 (=> (not res!931120) (not e!788181))))

(declare-datatypes ((List!32494 0))(
  ( (Nil!32491) (Cons!32490 (h!33716 (_ BitVec 64)) (t!47180 List!32494)) )
))
(declare-fun arrayNoDuplicates!0 (array!95249 (_ BitVec 32) List!32494) Bool)

(assert (=> b!1391643 (= res!931120 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32491))))

(assert (= (and start!119390 res!931117) b!1391639))

(assert (= (and b!1391639 res!931115) b!1391637))

(assert (= (and b!1391637 res!931118) b!1391642))

(assert (= (and b!1391642 res!931114) b!1391640))

(assert (= (and b!1391640 res!931119) b!1391643))

(assert (= (and b!1391643 res!931120) b!1391641))

(assert (= (and b!1391641 res!931116) b!1391638))

(declare-fun m!1277731 () Bool)

(assert (=> b!1391637 m!1277731))

(assert (=> b!1391637 m!1277731))

(declare-fun m!1277733 () Bool)

(assert (=> b!1391637 m!1277733))

(declare-fun m!1277735 () Bool)

(assert (=> b!1391642 m!1277735))

(assert (=> b!1391642 m!1277735))

(declare-fun m!1277737 () Bool)

(assert (=> b!1391642 m!1277737))

(declare-fun m!1277739 () Bool)

(assert (=> start!119390 m!1277739))

(declare-fun m!1277741 () Bool)

(assert (=> start!119390 m!1277741))

(assert (=> b!1391638 m!1277735))

(assert (=> b!1391638 m!1277735))

(declare-fun m!1277743 () Bool)

(assert (=> b!1391638 m!1277743))

(declare-fun m!1277745 () Bool)

(assert (=> b!1391640 m!1277745))

(assert (=> b!1391641 m!1277735))

(declare-fun m!1277747 () Bool)

(assert (=> b!1391641 m!1277747))

(assert (=> b!1391641 m!1277735))

(declare-fun m!1277749 () Bool)

(assert (=> b!1391641 m!1277749))

(assert (=> b!1391641 m!1277747))

(assert (=> b!1391641 m!1277735))

(declare-fun m!1277751 () Bool)

(assert (=> b!1391641 m!1277751))

(declare-fun m!1277753 () Bool)

(assert (=> b!1391641 m!1277753))

(declare-fun m!1277755 () Bool)

(assert (=> b!1391643 m!1277755))

(check-sat (not b!1391640) (not b!1391637) (not b!1391641) (not b!1391642) (not b!1391643) (not start!119390) (not b!1391638))
(check-sat)
