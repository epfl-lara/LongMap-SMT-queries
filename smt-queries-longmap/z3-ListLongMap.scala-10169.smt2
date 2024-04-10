; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119888 () Bool)

(assert start!119888)

(declare-fun res!935017 () Bool)

(declare-fun e!790288 () Bool)

(assert (=> start!119888 (=> (not res!935017) (not e!790288))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119888 (= res!935017 (validMask!0 mask!2840))))

(assert (=> start!119888 e!790288))

(assert (=> start!119888 true))

(declare-datatypes ((array!95468 0))(
  ( (array!95469 (arr!46089 (Array (_ BitVec 32) (_ BitVec 64))) (size!46639 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95468)

(declare-fun array_inv!35117 (array!95468) Bool)

(assert (=> start!119888 (array_inv!35117 a!2901)))

(declare-fun b!1395936 () Bool)

(declare-fun res!935018 () Bool)

(assert (=> b!1395936 (=> (not res!935018) (not e!790288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95468 (_ BitVec 32)) Bool)

(assert (=> b!1395936 (= res!935018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395937 () Bool)

(declare-fun res!935023 () Bool)

(assert (=> b!1395937 (=> (not res!935023) (not e!790288))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395937 (= res!935023 (validKeyInArray!0 (select (arr!46089 a!2901) j!112)))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun b!1395938 () Bool)

(declare-fun e!790289 () Bool)

(assert (=> b!1395938 (= e!790289 (validKeyInArray!0 (select (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1395939 () Bool)

(declare-fun res!935021 () Bool)

(assert (=> b!1395939 (=> (not res!935021) (not e!790288))))

(assert (=> b!1395939 (= res!935021 (and (= (size!46639 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46639 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46639 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395940 () Bool)

(declare-fun res!935014 () Bool)

(assert (=> b!1395940 (=> (not res!935014) (not e!790288))))

(declare-datatypes ((List!32608 0))(
  ( (Nil!32605) (Cons!32604 (h!33843 (_ BitVec 64)) (t!47302 List!32608)) )
))
(declare-fun arrayNoDuplicates!0 (array!95468 (_ BitVec 32) List!32608) Bool)

(assert (=> b!1395940 (= res!935014 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32605))))

(declare-fun b!1395941 () Bool)

(declare-fun e!790292 () Bool)

(assert (=> b!1395941 (= e!790288 (not e!790292))))

(declare-fun res!935016 () Bool)

(assert (=> b!1395941 (=> res!935016 e!790292)))

(declare-datatypes ((SeekEntryResult!10406 0))(
  ( (MissingZero!10406 (index!43995 (_ BitVec 32))) (Found!10406 (index!43996 (_ BitVec 32))) (Intermediate!10406 (undefined!11218 Bool) (index!43997 (_ BitVec 32)) (x!125662 (_ BitVec 32))) (Undefined!10406) (MissingVacant!10406 (index!43998 (_ BitVec 32))) )
))
(declare-fun lt!613189 () SeekEntryResult!10406)

(get-info :version)

(assert (=> b!1395941 (= res!935016 (or (not ((_ is Intermediate!10406) lt!613189)) (undefined!11218 lt!613189)))))

(declare-fun e!790291 () Bool)

(assert (=> b!1395941 e!790291))

(declare-fun res!935019 () Bool)

(assert (=> b!1395941 (=> (not res!935019) (not e!790291))))

(assert (=> b!1395941 (= res!935019 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46816 0))(
  ( (Unit!46817) )
))
(declare-fun lt!613191 () Unit!46816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46816)

(assert (=> b!1395941 (= lt!613191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95468 (_ BitVec 32)) SeekEntryResult!10406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395941 (= lt!613189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46089 a!2901) j!112) mask!2840) (select (arr!46089 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395942 () Bool)

(declare-fun res!935022 () Bool)

(assert (=> b!1395942 (=> res!935022 e!790289)))

(declare-fun lt!613190 () (_ BitVec 32))

(assert (=> b!1395942 (= res!935022 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!613190 #b00000000000000000000000000000000) (bvsge lt!613190 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(declare-fun b!1395943 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95468 (_ BitVec 32)) SeekEntryResult!10406)

(assert (=> b!1395943 (= e!790291 (= (seekEntryOrOpen!0 (select (arr!46089 a!2901) j!112) a!2901 mask!2840) (Found!10406 j!112)))))

(declare-fun b!1395944 () Bool)

(declare-fun res!935015 () Bool)

(assert (=> b!1395944 (=> (not res!935015) (not e!790288))))

(assert (=> b!1395944 (= res!935015 (validKeyInArray!0 (select (arr!46089 a!2901) i!1037)))))

(declare-fun b!1395945 () Bool)

(assert (=> b!1395945 (= e!790292 e!790289)))

(declare-fun res!935020 () Bool)

(assert (=> b!1395945 (=> res!935020 e!790289)))

(assert (=> b!1395945 (= res!935020 (= lt!613189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613190 (select (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95469 (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46639 a!2901)) mask!2840)))))

(assert (=> b!1395945 (= lt!613190 (toIndex!0 (select (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119888 res!935017) b!1395939))

(assert (= (and b!1395939 res!935021) b!1395944))

(assert (= (and b!1395944 res!935015) b!1395937))

(assert (= (and b!1395937 res!935023) b!1395936))

(assert (= (and b!1395936 res!935018) b!1395940))

(assert (= (and b!1395940 res!935014) b!1395941))

(assert (= (and b!1395941 res!935019) b!1395943))

(assert (= (and b!1395941 (not res!935016)) b!1395945))

(assert (= (and b!1395945 (not res!935020)) b!1395942))

(assert (= (and b!1395942 (not res!935022)) b!1395938))

(declare-fun m!1282389 () Bool)

(assert (=> b!1395945 m!1282389))

(declare-fun m!1282391 () Bool)

(assert (=> b!1395945 m!1282391))

(assert (=> b!1395945 m!1282391))

(declare-fun m!1282393 () Bool)

(assert (=> b!1395945 m!1282393))

(assert (=> b!1395945 m!1282391))

(declare-fun m!1282395 () Bool)

(assert (=> b!1395945 m!1282395))

(declare-fun m!1282397 () Bool)

(assert (=> b!1395944 m!1282397))

(assert (=> b!1395944 m!1282397))

(declare-fun m!1282399 () Bool)

(assert (=> b!1395944 m!1282399))

(declare-fun m!1282401 () Bool)

(assert (=> b!1395936 m!1282401))

(declare-fun m!1282403 () Bool)

(assert (=> b!1395937 m!1282403))

(assert (=> b!1395937 m!1282403))

(declare-fun m!1282405 () Bool)

(assert (=> b!1395937 m!1282405))

(assert (=> b!1395938 m!1282389))

(assert (=> b!1395938 m!1282391))

(assert (=> b!1395938 m!1282391))

(declare-fun m!1282407 () Bool)

(assert (=> b!1395938 m!1282407))

(assert (=> b!1395943 m!1282403))

(assert (=> b!1395943 m!1282403))

(declare-fun m!1282409 () Bool)

(assert (=> b!1395943 m!1282409))

(assert (=> b!1395941 m!1282403))

(declare-fun m!1282411 () Bool)

(assert (=> b!1395941 m!1282411))

(assert (=> b!1395941 m!1282403))

(declare-fun m!1282413 () Bool)

(assert (=> b!1395941 m!1282413))

(assert (=> b!1395941 m!1282411))

(assert (=> b!1395941 m!1282403))

(declare-fun m!1282415 () Bool)

(assert (=> b!1395941 m!1282415))

(declare-fun m!1282417 () Bool)

(assert (=> b!1395941 m!1282417))

(declare-fun m!1282419 () Bool)

(assert (=> b!1395940 m!1282419))

(declare-fun m!1282421 () Bool)

(assert (=> start!119888 m!1282421))

(declare-fun m!1282423 () Bool)

(assert (=> start!119888 m!1282423))

(check-sat (not b!1395938) (not b!1395944) (not b!1395940) (not b!1395945) (not b!1395941) (not start!119888) (not b!1395943) (not b!1395936) (not b!1395937))
(check-sat)
