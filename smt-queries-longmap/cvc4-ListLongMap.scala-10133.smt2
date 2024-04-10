; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119512 () Bool)

(assert start!119512)

(declare-datatypes ((array!95245 0))(
  ( (array!95246 (arr!45982 (Array (_ BitVec 32) (_ BitVec 64))) (size!46532 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95245)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun b!1392457 () Bool)

(declare-fun e!788504 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392457 (= e!788504 (validKeyInArray!0 (select (store (arr!45982 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1392458 () Bool)

(declare-fun e!788506 () Bool)

(declare-fun e!788507 () Bool)

(assert (=> b!1392458 (= e!788506 (not e!788507))))

(declare-fun res!932038 () Bool)

(assert (=> b!1392458 (=> res!932038 e!788507)))

(declare-datatypes ((SeekEntryResult!10299 0))(
  ( (MissingZero!10299 (index!43567 (_ BitVec 32))) (Found!10299 (index!43568 (_ BitVec 32))) (Intermediate!10299 (undefined!11111 Bool) (index!43569 (_ BitVec 32)) (x!125249 (_ BitVec 32))) (Undefined!10299) (MissingVacant!10299 (index!43570 (_ BitVec 32))) )
))
(declare-fun lt!611623 () SeekEntryResult!10299)

(assert (=> b!1392458 (= res!932038 (or (not (is-Intermediate!10299 lt!611623)) (undefined!11111 lt!611623)))))

(declare-fun e!788505 () Bool)

(assert (=> b!1392458 e!788505))

(declare-fun res!932035 () Bool)

(assert (=> b!1392458 (=> (not res!932035) (not e!788505))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95245 (_ BitVec 32)) Bool)

(assert (=> b!1392458 (= res!932035 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46602 0))(
  ( (Unit!46603) )
))
(declare-fun lt!611624 () Unit!46602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46602)

(assert (=> b!1392458 (= lt!611624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392458 (= lt!611623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45982 a!2901) j!112) mask!2840) (select (arr!45982 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392459 () Bool)

(declare-fun res!932032 () Bool)

(assert (=> b!1392459 (=> (not res!932032) (not e!788506))))

(assert (=> b!1392459 (= res!932032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392461 () Bool)

(declare-fun res!932036 () Bool)

(assert (=> b!1392461 (=> (not res!932036) (not e!788506))))

(assert (=> b!1392461 (= res!932036 (and (= (size!46532 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46532 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46532 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392462 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10299)

(assert (=> b!1392462 (= e!788505 (= (seekEntryOrOpen!0 (select (arr!45982 a!2901) j!112) a!2901 mask!2840) (Found!10299 j!112)))))

(declare-fun b!1392463 () Bool)

(declare-fun res!932030 () Bool)

(assert (=> b!1392463 (=> (not res!932030) (not e!788506))))

(assert (=> b!1392463 (= res!932030 (validKeyInArray!0 (select (arr!45982 a!2901) j!112)))))

(declare-fun b!1392460 () Bool)

(assert (=> b!1392460 (= e!788507 e!788504)))

(declare-fun res!932037 () Bool)

(assert (=> b!1392460 (=> res!932037 e!788504)))

(declare-fun lt!611625 () (_ BitVec 32))

(assert (=> b!1392460 (= res!932037 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!611625 #b00000000000000000000000000000000) (bvsge lt!611625 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (=> b!1392460 (= lt!611625 (toIndex!0 (select (store (arr!45982 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun res!932034 () Bool)

(assert (=> start!119512 (=> (not res!932034) (not e!788506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119512 (= res!932034 (validMask!0 mask!2840))))

(assert (=> start!119512 e!788506))

(assert (=> start!119512 true))

(declare-fun array_inv!35010 (array!95245) Bool)

(assert (=> start!119512 (array_inv!35010 a!2901)))

(declare-fun b!1392464 () Bool)

(declare-fun res!932031 () Bool)

(assert (=> b!1392464 (=> (not res!932031) (not e!788506))))

(assert (=> b!1392464 (= res!932031 (validKeyInArray!0 (select (arr!45982 a!2901) i!1037)))))

(declare-fun b!1392465 () Bool)

(declare-fun res!932033 () Bool)

(assert (=> b!1392465 (=> (not res!932033) (not e!788506))))

(declare-datatypes ((List!32501 0))(
  ( (Nil!32498) (Cons!32497 (h!33727 (_ BitVec 64)) (t!47195 List!32501)) )
))
(declare-fun arrayNoDuplicates!0 (array!95245 (_ BitVec 32) List!32501) Bool)

(assert (=> b!1392465 (= res!932033 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32498))))

(assert (= (and start!119512 res!932034) b!1392461))

(assert (= (and b!1392461 res!932036) b!1392464))

(assert (= (and b!1392464 res!932031) b!1392463))

(assert (= (and b!1392463 res!932030) b!1392459))

(assert (= (and b!1392459 res!932032) b!1392465))

(assert (= (and b!1392465 res!932033) b!1392458))

(assert (= (and b!1392458 res!932035) b!1392462))

(assert (= (and b!1392458 (not res!932038)) b!1392460))

(assert (= (and b!1392460 (not res!932037)) b!1392457))

(declare-fun m!1278197 () Bool)

(assert (=> start!119512 m!1278197))

(declare-fun m!1278199 () Bool)

(assert (=> start!119512 m!1278199))

(declare-fun m!1278201 () Bool)

(assert (=> b!1392464 m!1278201))

(assert (=> b!1392464 m!1278201))

(declare-fun m!1278203 () Bool)

(assert (=> b!1392464 m!1278203))

(declare-fun m!1278205 () Bool)

(assert (=> b!1392465 m!1278205))

(declare-fun m!1278207 () Bool)

(assert (=> b!1392457 m!1278207))

(declare-fun m!1278209 () Bool)

(assert (=> b!1392457 m!1278209))

(assert (=> b!1392457 m!1278209))

(declare-fun m!1278211 () Bool)

(assert (=> b!1392457 m!1278211))

(declare-fun m!1278213 () Bool)

(assert (=> b!1392459 m!1278213))

(declare-fun m!1278215 () Bool)

(assert (=> b!1392462 m!1278215))

(assert (=> b!1392462 m!1278215))

(declare-fun m!1278217 () Bool)

(assert (=> b!1392462 m!1278217))

(assert (=> b!1392460 m!1278207))

(assert (=> b!1392460 m!1278209))

(assert (=> b!1392460 m!1278209))

(declare-fun m!1278219 () Bool)

(assert (=> b!1392460 m!1278219))

(assert (=> b!1392458 m!1278215))

(declare-fun m!1278221 () Bool)

(assert (=> b!1392458 m!1278221))

(assert (=> b!1392458 m!1278215))

(declare-fun m!1278223 () Bool)

(assert (=> b!1392458 m!1278223))

(assert (=> b!1392458 m!1278221))

(assert (=> b!1392458 m!1278215))

(declare-fun m!1278225 () Bool)

(assert (=> b!1392458 m!1278225))

(declare-fun m!1278227 () Bool)

(assert (=> b!1392458 m!1278227))

(assert (=> b!1392463 m!1278215))

(assert (=> b!1392463 m!1278215))

(declare-fun m!1278229 () Bool)

(assert (=> b!1392463 m!1278229))

(push 1)

(assert (not start!119512))

(assert (not b!1392463))

(assert (not b!1392464))

(assert (not b!1392459))

(assert (not b!1392462))

(assert (not b!1392460))

(assert (not b!1392465))

(assert (not b!1392457))

(assert (not b!1392458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

