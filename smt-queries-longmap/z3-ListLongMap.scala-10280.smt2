; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120842 () Bool)

(assert start!120842)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96149 0))(
  ( (array!96150 (arr!46422 (Array (_ BitVec 32) (_ BitVec 64))) (size!46972 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96149)

(declare-fun e!795845 () Bool)

(declare-fun b!1406048 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10733 0))(
  ( (MissingZero!10733 (index!45309 (_ BitVec 32))) (Found!10733 (index!45310 (_ BitVec 32))) (Intermediate!10733 (undefined!11545 Bool) (index!45311 (_ BitVec 32)) (x!126916 (_ BitVec 32))) (Undefined!10733) (MissingVacant!10733 (index!45312 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96149 (_ BitVec 32)) SeekEntryResult!10733)

(assert (=> b!1406048 (= e!795845 (= (seekEntryOrOpen!0 (select (arr!46422 a!2901) j!112) a!2901 mask!2840) (Found!10733 j!112)))))

(declare-fun b!1406049 () Bool)

(declare-fun res!944269 () Bool)

(declare-fun e!795847 () Bool)

(assert (=> b!1406049 (=> (not res!944269) (not e!795847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96149 (_ BitVec 32)) Bool)

(assert (=> b!1406049 (= res!944269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406050 () Bool)

(declare-fun res!944270 () Bool)

(assert (=> b!1406050 (=> (not res!944270) (not e!795847))))

(declare-datatypes ((List!32941 0))(
  ( (Nil!32938) (Cons!32937 (h!34191 (_ BitVec 64)) (t!47635 List!32941)) )
))
(declare-fun arrayNoDuplicates!0 (array!96149 (_ BitVec 32) List!32941) Bool)

(assert (=> b!1406050 (= res!944270 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32938))))

(declare-fun b!1406051 () Bool)

(declare-fun res!944268 () Bool)

(assert (=> b!1406051 (=> (not res!944268) (not e!795847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406051 (= res!944268 (validKeyInArray!0 (select (arr!46422 a!2901) j!112)))))

(declare-fun b!1406053 () Bool)

(declare-fun res!944272 () Bool)

(assert (=> b!1406053 (=> (not res!944272) (not e!795847))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406053 (= res!944272 (and (= (size!46972 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46972 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46972 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406054 () Bool)

(declare-fun e!795848 () Bool)

(assert (=> b!1406054 (= e!795848 true)))

(declare-fun lt!619238 () SeekEntryResult!10733)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96149 (_ BitVec 32)) SeekEntryResult!10733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406054 (= lt!619238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96150 (store (arr!46422 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46972 a!2901)) mask!2840))))

(declare-fun b!1406055 () Bool)

(assert (=> b!1406055 (= e!795847 (not e!795848))))

(declare-fun res!944265 () Bool)

(assert (=> b!1406055 (=> res!944265 e!795848)))

(declare-fun lt!619239 () SeekEntryResult!10733)

(get-info :version)

(assert (=> b!1406055 (= res!944265 (or (not ((_ is Intermediate!10733) lt!619239)) (undefined!11545 lt!619239)))))

(assert (=> b!1406055 e!795845))

(declare-fun res!944267 () Bool)

(assert (=> b!1406055 (=> (not res!944267) (not e!795845))))

(assert (=> b!1406055 (= res!944267 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47440 0))(
  ( (Unit!47441) )
))
(declare-fun lt!619237 () Unit!47440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47440)

(assert (=> b!1406055 (= lt!619237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406055 (= lt!619239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46422 a!2901) j!112) mask!2840) (select (arr!46422 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406052 () Bool)

(declare-fun res!944271 () Bool)

(assert (=> b!1406052 (=> (not res!944271) (not e!795847))))

(assert (=> b!1406052 (= res!944271 (validKeyInArray!0 (select (arr!46422 a!2901) i!1037)))))

(declare-fun res!944266 () Bool)

(assert (=> start!120842 (=> (not res!944266) (not e!795847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120842 (= res!944266 (validMask!0 mask!2840))))

(assert (=> start!120842 e!795847))

(assert (=> start!120842 true))

(declare-fun array_inv!35450 (array!96149) Bool)

(assert (=> start!120842 (array_inv!35450 a!2901)))

(assert (= (and start!120842 res!944266) b!1406053))

(assert (= (and b!1406053 res!944272) b!1406052))

(assert (= (and b!1406052 res!944271) b!1406051))

(assert (= (and b!1406051 res!944268) b!1406049))

(assert (= (and b!1406049 res!944269) b!1406050))

(assert (= (and b!1406050 res!944270) b!1406055))

(assert (= (and b!1406055 res!944267) b!1406048))

(assert (= (and b!1406055 (not res!944265)) b!1406054))

(declare-fun m!1295029 () Bool)

(assert (=> b!1406055 m!1295029))

(declare-fun m!1295031 () Bool)

(assert (=> b!1406055 m!1295031))

(assert (=> b!1406055 m!1295029))

(declare-fun m!1295033 () Bool)

(assert (=> b!1406055 m!1295033))

(assert (=> b!1406055 m!1295031))

(assert (=> b!1406055 m!1295029))

(declare-fun m!1295035 () Bool)

(assert (=> b!1406055 m!1295035))

(declare-fun m!1295037 () Bool)

(assert (=> b!1406055 m!1295037))

(assert (=> b!1406051 m!1295029))

(assert (=> b!1406051 m!1295029))

(declare-fun m!1295039 () Bool)

(assert (=> b!1406051 m!1295039))

(assert (=> b!1406048 m!1295029))

(assert (=> b!1406048 m!1295029))

(declare-fun m!1295041 () Bool)

(assert (=> b!1406048 m!1295041))

(declare-fun m!1295043 () Bool)

(assert (=> b!1406050 m!1295043))

(declare-fun m!1295045 () Bool)

(assert (=> start!120842 m!1295045))

(declare-fun m!1295047 () Bool)

(assert (=> start!120842 m!1295047))

(declare-fun m!1295049 () Bool)

(assert (=> b!1406054 m!1295049))

(declare-fun m!1295051 () Bool)

(assert (=> b!1406054 m!1295051))

(assert (=> b!1406054 m!1295051))

(declare-fun m!1295053 () Bool)

(assert (=> b!1406054 m!1295053))

(assert (=> b!1406054 m!1295053))

(assert (=> b!1406054 m!1295051))

(declare-fun m!1295055 () Bool)

(assert (=> b!1406054 m!1295055))

(declare-fun m!1295057 () Bool)

(assert (=> b!1406049 m!1295057))

(declare-fun m!1295059 () Bool)

(assert (=> b!1406052 m!1295059))

(assert (=> b!1406052 m!1295059))

(declare-fun m!1295061 () Bool)

(assert (=> b!1406052 m!1295061))

(check-sat (not b!1406051) (not b!1406049) (not start!120842) (not b!1406048) (not b!1406054) (not b!1406055) (not b!1406050) (not b!1406052))
