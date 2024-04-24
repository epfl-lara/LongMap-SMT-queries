; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119322 () Bool)

(assert start!119322)

(declare-fun b!1390951 () Bool)

(declare-fun res!930432 () Bool)

(declare-fun e!787903 () Bool)

(assert (=> b!1390951 (=> (not res!930432) (not e!787903))))

(declare-datatypes ((array!95181 0))(
  ( (array!95182 (arr!45954 (Array (_ BitVec 32) (_ BitVec 64))) (size!46505 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95181)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390951 (= res!930432 (validKeyInArray!0 (select (arr!45954 a!2901) i!1037)))))

(declare-fun res!930430 () Bool)

(assert (=> start!119322 (=> (not res!930430) (not e!787903))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119322 (= res!930430 (validMask!0 mask!2840))))

(assert (=> start!119322 e!787903))

(assert (=> start!119322 true))

(declare-fun array_inv!35235 (array!95181) Bool)

(assert (=> start!119322 (array_inv!35235 a!2901)))

(declare-fun b!1390952 () Bool)

(declare-fun res!930428 () Bool)

(assert (=> b!1390952 (=> (not res!930428) (not e!787903))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390952 (= res!930428 (validKeyInArray!0 (select (arr!45954 a!2901) j!112)))))

(declare-fun b!1390953 () Bool)

(declare-fun res!930429 () Bool)

(assert (=> b!1390953 (=> (not res!930429) (not e!787903))))

(declare-datatypes ((List!32460 0))(
  ( (Nil!32457) (Cons!32456 (h!33682 (_ BitVec 64)) (t!47146 List!32460)) )
))
(declare-fun arrayNoDuplicates!0 (array!95181 (_ BitVec 32) List!32460) Bool)

(assert (=> b!1390953 (= res!930429 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32457))))

(declare-fun b!1390954 () Bool)

(declare-fun res!930433 () Bool)

(assert (=> b!1390954 (=> (not res!930433) (not e!787903))))

(assert (=> b!1390954 (= res!930433 (and (= (size!46505 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46505 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46505 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390955 () Bool)

(assert (=> b!1390955 (= e!787903 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95181 (_ BitVec 32)) Bool)

(assert (=> b!1390955 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46379 0))(
  ( (Unit!46380) )
))
(declare-fun lt!611035 () Unit!46379)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> b!1390955 (= lt!611035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10174 0))(
  ( (MissingZero!10174 (index!43067 (_ BitVec 32))) (Found!10174 (index!43068 (_ BitVec 32))) (Intermediate!10174 (undefined!10986 Bool) (index!43069 (_ BitVec 32)) (x!124903 (_ BitVec 32))) (Undefined!10174) (MissingVacant!10174 (index!43070 (_ BitVec 32))) )
))
(declare-fun lt!611036 () SeekEntryResult!10174)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95181 (_ BitVec 32)) SeekEntryResult!10174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390955 (= lt!611036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45954 a!2901) j!112) mask!2840) (select (arr!45954 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390956 () Bool)

(declare-fun res!930431 () Bool)

(assert (=> b!1390956 (=> (not res!930431) (not e!787903))))

(assert (=> b!1390956 (= res!930431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119322 res!930430) b!1390954))

(assert (= (and b!1390954 res!930433) b!1390951))

(assert (= (and b!1390951 res!930432) b!1390952))

(assert (= (and b!1390952 res!930428) b!1390956))

(assert (= (and b!1390956 res!930431) b!1390953))

(assert (= (and b!1390953 res!930429) b!1390955))

(declare-fun m!1276867 () Bool)

(assert (=> b!1390951 m!1276867))

(assert (=> b!1390951 m!1276867))

(declare-fun m!1276869 () Bool)

(assert (=> b!1390951 m!1276869))

(declare-fun m!1276871 () Bool)

(assert (=> b!1390953 m!1276871))

(declare-fun m!1276873 () Bool)

(assert (=> b!1390956 m!1276873))

(declare-fun m!1276875 () Bool)

(assert (=> b!1390955 m!1276875))

(declare-fun m!1276877 () Bool)

(assert (=> b!1390955 m!1276877))

(assert (=> b!1390955 m!1276875))

(declare-fun m!1276879 () Bool)

(assert (=> b!1390955 m!1276879))

(assert (=> b!1390955 m!1276877))

(assert (=> b!1390955 m!1276875))

(declare-fun m!1276881 () Bool)

(assert (=> b!1390955 m!1276881))

(declare-fun m!1276883 () Bool)

(assert (=> b!1390955 m!1276883))

(assert (=> b!1390952 m!1276875))

(assert (=> b!1390952 m!1276875))

(declare-fun m!1276885 () Bool)

(assert (=> b!1390952 m!1276885))

(declare-fun m!1276887 () Bool)

(assert (=> start!119322 m!1276887))

(declare-fun m!1276889 () Bool)

(assert (=> start!119322 m!1276889))

(push 1)

(assert (not start!119322))

(assert (not b!1390952))

(assert (not b!1390953))

(assert (not b!1390956))

(assert (not b!1390955))

(assert (not b!1390951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

