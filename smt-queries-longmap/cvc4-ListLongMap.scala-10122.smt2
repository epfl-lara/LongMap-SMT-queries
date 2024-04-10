; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119284 () Bool)

(assert start!119284)

(declare-fun b!1391019 () Bool)

(declare-fun res!931038 () Bool)

(declare-fun e!787713 () Bool)

(assert (=> b!1391019 (=> (not res!931038) (not e!787713))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95170 0))(
  ( (array!95171 (arr!45949 (Array (_ BitVec 32) (_ BitVec 64))) (size!46499 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95170)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391019 (= res!931038 (and (= (size!46499 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46499 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46499 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391020 () Bool)

(declare-fun e!787714 () Bool)

(declare-datatypes ((SeekEntryResult!10266 0))(
  ( (MissingZero!10266 (index!43435 (_ BitVec 32))) (Found!10266 (index!43436 (_ BitVec 32))) (Intermediate!10266 (undefined!11078 Bool) (index!43437 (_ BitVec 32)) (x!125110 (_ BitVec 32))) (Undefined!10266) (MissingVacant!10266 (index!43438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95170 (_ BitVec 32)) SeekEntryResult!10266)

(assert (=> b!1391020 (= e!787714 (= (seekEntryOrOpen!0 (select (arr!45949 a!2901) j!112) a!2901 mask!2840) (Found!10266 j!112)))))

(declare-fun b!1391021 () Bool)

(assert (=> b!1391021 (= e!787713 (not true))))

(assert (=> b!1391021 e!787714))

(declare-fun res!931033 () Bool)

(assert (=> b!1391021 (=> (not res!931033) (not e!787714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95170 (_ BitVec 32)) Bool)

(assert (=> b!1391021 (= res!931033 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46536 0))(
  ( (Unit!46537) )
))
(declare-fun lt!611034 () Unit!46536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46536)

(assert (=> b!1391021 (= lt!611034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611033 () SeekEntryResult!10266)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95170 (_ BitVec 32)) SeekEntryResult!10266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391021 (= lt!611033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45949 a!2901) j!112) mask!2840) (select (arr!45949 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391022 () Bool)

(declare-fun res!931034 () Bool)

(assert (=> b!1391022 (=> (not res!931034) (not e!787713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391022 (= res!931034 (validKeyInArray!0 (select (arr!45949 a!2901) i!1037)))))

(declare-fun b!1391023 () Bool)

(declare-fun res!931037 () Bool)

(assert (=> b!1391023 (=> (not res!931037) (not e!787713))))

(declare-datatypes ((List!32468 0))(
  ( (Nil!32465) (Cons!32464 (h!33685 (_ BitVec 64)) (t!47162 List!32468)) )
))
(declare-fun arrayNoDuplicates!0 (array!95170 (_ BitVec 32) List!32468) Bool)

(assert (=> b!1391023 (= res!931037 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32465))))

(declare-fun res!931039 () Bool)

(assert (=> start!119284 (=> (not res!931039) (not e!787713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119284 (= res!931039 (validMask!0 mask!2840))))

(assert (=> start!119284 e!787713))

(assert (=> start!119284 true))

(declare-fun array_inv!34977 (array!95170) Bool)

(assert (=> start!119284 (array_inv!34977 a!2901)))

(declare-fun b!1391024 () Bool)

(declare-fun res!931035 () Bool)

(assert (=> b!1391024 (=> (not res!931035) (not e!787713))))

(assert (=> b!1391024 (= res!931035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391025 () Bool)

(declare-fun res!931036 () Bool)

(assert (=> b!1391025 (=> (not res!931036) (not e!787713))))

(assert (=> b!1391025 (= res!931036 (validKeyInArray!0 (select (arr!45949 a!2901) j!112)))))

(assert (= (and start!119284 res!931039) b!1391019))

(assert (= (and b!1391019 res!931038) b!1391022))

(assert (= (and b!1391022 res!931034) b!1391025))

(assert (= (and b!1391025 res!931036) b!1391024))

(assert (= (and b!1391024 res!931035) b!1391023))

(assert (= (and b!1391023 res!931037) b!1391021))

(assert (= (and b!1391021 res!931033) b!1391020))

(declare-fun m!1276849 () Bool)

(assert (=> b!1391021 m!1276849))

(declare-fun m!1276851 () Bool)

(assert (=> b!1391021 m!1276851))

(assert (=> b!1391021 m!1276849))

(declare-fun m!1276853 () Bool)

(assert (=> b!1391021 m!1276853))

(assert (=> b!1391021 m!1276851))

(assert (=> b!1391021 m!1276849))

(declare-fun m!1276855 () Bool)

(assert (=> b!1391021 m!1276855))

(declare-fun m!1276857 () Bool)

(assert (=> b!1391021 m!1276857))

(assert (=> b!1391025 m!1276849))

(assert (=> b!1391025 m!1276849))

(declare-fun m!1276859 () Bool)

(assert (=> b!1391025 m!1276859))

(declare-fun m!1276861 () Bool)

(assert (=> start!119284 m!1276861))

(declare-fun m!1276863 () Bool)

(assert (=> start!119284 m!1276863))

(declare-fun m!1276865 () Bool)

(assert (=> b!1391024 m!1276865))

(declare-fun m!1276867 () Bool)

(assert (=> b!1391023 m!1276867))

(declare-fun m!1276869 () Bool)

(assert (=> b!1391022 m!1276869))

(assert (=> b!1391022 m!1276869))

(declare-fun m!1276871 () Bool)

(assert (=> b!1391022 m!1276871))

(assert (=> b!1391020 m!1276849))

(assert (=> b!1391020 m!1276849))

(declare-fun m!1276873 () Bool)

(assert (=> b!1391020 m!1276873))

(push 1)

(assert (not b!1391024))

(assert (not b!1391020))

(assert (not b!1391025))

(assert (not b!1391023))

(assert (not b!1391021))

(assert (not start!119284))

(assert (not b!1391022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

