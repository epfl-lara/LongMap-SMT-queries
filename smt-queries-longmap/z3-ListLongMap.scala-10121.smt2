; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119462 () Bool)

(assert start!119462)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95270 0))(
  ( (array!95271 (arr!45997 (Array (_ BitVec 32) (_ BitVec 64))) (size!46548 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95270)

(declare-fun e!788408 () Bool)

(declare-fun b!1392054 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10217 0))(
  ( (MissingZero!10217 (index!43239 (_ BitVec 32))) (Found!10217 (index!43240 (_ BitVec 32))) (Intermediate!10217 (undefined!11029 Bool) (index!43241 (_ BitVec 32)) (x!125072 (_ BitVec 32))) (Undefined!10217) (MissingVacant!10217 (index!43242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95270 (_ BitVec 32)) SeekEntryResult!10217)

(assert (=> b!1392054 (= e!788408 (= (seekEntryOrOpen!0 (select (arr!45997 a!2901) j!112) a!2901 mask!2840) (Found!10217 j!112)))))

(declare-fun b!1392055 () Bool)

(declare-fun e!788407 () Bool)

(declare-fun lt!611402 () SeekEntryResult!10217)

(get-info :version)

(assert (=> b!1392055 (= e!788407 (not (or (not ((_ is Intermediate!10217) lt!611402)) (undefined!11029 lt!611402) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1392055 e!788408))

(declare-fun res!931385 () Bool)

(assert (=> b!1392055 (=> (not res!931385) (not e!788408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95270 (_ BitVec 32)) Bool)

(assert (=> b!1392055 (= res!931385 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46465 0))(
  ( (Unit!46466) )
))
(declare-fun lt!611401 () Unit!46465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46465)

(assert (=> b!1392055 (= lt!611401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95270 (_ BitVec 32)) SeekEntryResult!10217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392055 (= lt!611402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45997 a!2901) j!112) mask!2840) (select (arr!45997 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392056 () Bool)

(declare-fun res!931386 () Bool)

(assert (=> b!1392056 (=> (not res!931386) (not e!788407))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392056 (= res!931386 (validKeyInArray!0 (select (arr!45997 a!2901) i!1037)))))

(declare-fun res!931384 () Bool)

(assert (=> start!119462 (=> (not res!931384) (not e!788407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119462 (= res!931384 (validMask!0 mask!2840))))

(assert (=> start!119462 e!788407))

(assert (=> start!119462 true))

(declare-fun array_inv!35278 (array!95270) Bool)

(assert (=> start!119462 (array_inv!35278 a!2901)))

(declare-fun b!1392057 () Bool)

(declare-fun res!931387 () Bool)

(assert (=> b!1392057 (=> (not res!931387) (not e!788407))))

(assert (=> b!1392057 (= res!931387 (validKeyInArray!0 (select (arr!45997 a!2901) j!112)))))

(declare-fun b!1392058 () Bool)

(declare-fun res!931388 () Bool)

(assert (=> b!1392058 (=> (not res!931388) (not e!788407))))

(assert (=> b!1392058 (= res!931388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392059 () Bool)

(declare-fun res!931389 () Bool)

(assert (=> b!1392059 (=> (not res!931389) (not e!788407))))

(declare-datatypes ((List!32503 0))(
  ( (Nil!32500) (Cons!32499 (h!33728 (_ BitVec 64)) (t!47189 List!32503)) )
))
(declare-fun arrayNoDuplicates!0 (array!95270 (_ BitVec 32) List!32503) Bool)

(assert (=> b!1392059 (= res!931389 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32500))))

(declare-fun b!1392060 () Bool)

(declare-fun res!931390 () Bool)

(assert (=> b!1392060 (=> (not res!931390) (not e!788407))))

(assert (=> b!1392060 (= res!931390 (and (= (size!46548 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46548 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46548 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119462 res!931384) b!1392060))

(assert (= (and b!1392060 res!931390) b!1392056))

(assert (= (and b!1392056 res!931386) b!1392057))

(assert (= (and b!1392057 res!931387) b!1392058))

(assert (= (and b!1392058 res!931388) b!1392059))

(assert (= (and b!1392059 res!931389) b!1392055))

(assert (= (and b!1392055 res!931385) b!1392054))

(declare-fun m!1278091 () Bool)

(assert (=> b!1392059 m!1278091))

(declare-fun m!1278093 () Bool)

(assert (=> b!1392054 m!1278093))

(assert (=> b!1392054 m!1278093))

(declare-fun m!1278095 () Bool)

(assert (=> b!1392054 m!1278095))

(declare-fun m!1278097 () Bool)

(assert (=> b!1392056 m!1278097))

(assert (=> b!1392056 m!1278097))

(declare-fun m!1278099 () Bool)

(assert (=> b!1392056 m!1278099))

(assert (=> b!1392055 m!1278093))

(declare-fun m!1278101 () Bool)

(assert (=> b!1392055 m!1278101))

(assert (=> b!1392055 m!1278093))

(declare-fun m!1278103 () Bool)

(assert (=> b!1392055 m!1278103))

(assert (=> b!1392055 m!1278101))

(assert (=> b!1392055 m!1278093))

(declare-fun m!1278105 () Bool)

(assert (=> b!1392055 m!1278105))

(declare-fun m!1278107 () Bool)

(assert (=> b!1392055 m!1278107))

(declare-fun m!1278109 () Bool)

(assert (=> b!1392058 m!1278109))

(assert (=> b!1392057 m!1278093))

(assert (=> b!1392057 m!1278093))

(declare-fun m!1278111 () Bool)

(assert (=> b!1392057 m!1278111))

(declare-fun m!1278113 () Bool)

(assert (=> start!119462 m!1278113))

(declare-fun m!1278115 () Bool)

(assert (=> start!119462 m!1278115))

(check-sat (not b!1392054) (not b!1392058) (not b!1392056) (not b!1392057) (not b!1392059) (not b!1392055) (not start!119462))
(check-sat)
