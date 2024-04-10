; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122786 () Bool)

(assert start!122786)

(declare-fun b!1423503 () Bool)

(declare-fun e!804606 () Bool)

(declare-fun e!804605 () Bool)

(assert (=> b!1423503 (= e!804606 (not e!804605))))

(declare-fun res!958939 () Bool)

(assert (=> b!1423503 (=> res!958939 e!804605)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97151 0))(
  ( (array!97152 (arr!46893 (Array (_ BitVec 32) (_ BitVec 64))) (size!47443 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97151)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423503 (= res!958939 (or (= (select (arr!46893 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46893 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46893 a!2831) index!585) (select (arr!46893 a!2831) j!81)) (= (select (store (arr!46893 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804610 () Bool)

(assert (=> b!1423503 e!804610))

(declare-fun res!958938 () Bool)

(assert (=> b!1423503 (=> (not res!958938) (not e!804610))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97151 (_ BitVec 32)) Bool)

(assert (=> b!1423503 (= res!958938 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48192 0))(
  ( (Unit!48193) )
))
(declare-fun lt!627146 () Unit!48192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48192)

(assert (=> b!1423503 (= lt!627146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423504 () Bool)

(declare-fun res!958950 () Bool)

(declare-fun e!804609 () Bool)

(assert (=> b!1423504 (=> (not res!958950) (not e!804609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423504 (= res!958950 (validKeyInArray!0 (select (arr!46893 a!2831) j!81)))))

(declare-fun b!1423505 () Bool)

(declare-fun res!958941 () Bool)

(assert (=> b!1423505 (=> (not res!958941) (not e!804609))))

(assert (=> b!1423505 (= res!958941 (validKeyInArray!0 (select (arr!46893 a!2831) i!982)))))

(declare-fun b!1423506 () Bool)

(declare-fun res!958936 () Bool)

(assert (=> b!1423506 (=> (not res!958936) (not e!804609))))

(declare-datatypes ((List!33403 0))(
  ( (Nil!33400) (Cons!33399 (h!34701 (_ BitVec 64)) (t!48097 List!33403)) )
))
(declare-fun arrayNoDuplicates!0 (array!97151 (_ BitVec 32) List!33403) Bool)

(assert (=> b!1423506 (= res!958936 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33400))))

(declare-fun b!1423507 () Bool)

(declare-fun res!958948 () Bool)

(assert (=> b!1423507 (=> (not res!958948) (not e!804609))))

(assert (=> b!1423507 (= res!958948 (and (= (size!47443 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47443 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47443 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423508 () Bool)

(declare-fun e!804611 () Bool)

(assert (=> b!1423508 (= e!804611 true)))

(declare-datatypes ((SeekEntryResult!11178 0))(
  ( (MissingZero!11178 (index!47104 (_ BitVec 32))) (Found!11178 (index!47105 (_ BitVec 32))) (Intermediate!11178 (undefined!11990 Bool) (index!47106 (_ BitVec 32)) (x!128740 (_ BitVec 32))) (Undefined!11178) (MissingVacant!11178 (index!47107 (_ BitVec 32))) )
))
(declare-fun lt!627141 () SeekEntryResult!11178)

(declare-fun lt!627145 () (_ BitVec 32))

(declare-fun lt!627147 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627144 () array!97151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97151 (_ BitVec 32)) SeekEntryResult!11178)

(assert (=> b!1423508 (= lt!627141 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627145 lt!627147 lt!627144 mask!2608))))

(declare-fun res!958940 () Bool)

(assert (=> start!122786 (=> (not res!958940) (not e!804609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122786 (= res!958940 (validMask!0 mask!2608))))

(assert (=> start!122786 e!804609))

(assert (=> start!122786 true))

(declare-fun array_inv!35921 (array!97151) Bool)

(assert (=> start!122786 (array_inv!35921 a!2831)))

(declare-fun b!1423509 () Bool)

(declare-fun res!958942 () Bool)

(assert (=> b!1423509 (=> res!958942 e!804611)))

(declare-fun lt!627143 () SeekEntryResult!11178)

(assert (=> b!1423509 (= res!958942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627145 (select (arr!46893 a!2831) j!81) a!2831 mask!2608) lt!627143)))))

(declare-fun b!1423510 () Bool)

(declare-fun res!958946 () Bool)

(assert (=> b!1423510 (=> (not res!958946) (not e!804606))))

(assert (=> b!1423510 (= res!958946 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46893 a!2831) j!81) a!2831 mask!2608) lt!627143))))

(declare-fun b!1423511 () Bool)

(declare-fun res!958943 () Bool)

(assert (=> b!1423511 (=> (not res!958943) (not e!804609))))

(assert (=> b!1423511 (= res!958943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423512 () Bool)

(declare-fun res!958947 () Bool)

(assert (=> b!1423512 (=> (not res!958947) (not e!804609))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423512 (= res!958947 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47443 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47443 a!2831))))))

(declare-fun b!1423513 () Bool)

(declare-fun e!804607 () Bool)

(assert (=> b!1423513 (= e!804607 e!804606)))

(declare-fun res!958949 () Bool)

(assert (=> b!1423513 (=> (not res!958949) (not e!804606))))

(declare-fun lt!627142 () SeekEntryResult!11178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423513 (= res!958949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627147 mask!2608) lt!627147 lt!627144 mask!2608) lt!627142))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423513 (= lt!627142 (Intermediate!11178 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423513 (= lt!627147 (select (store (arr!46893 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423513 (= lt!627144 (array!97152 (store (arr!46893 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47443 a!2831)))))

(declare-fun b!1423514 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97151 (_ BitVec 32)) SeekEntryResult!11178)

(assert (=> b!1423514 (= e!804610 (= (seekEntryOrOpen!0 (select (arr!46893 a!2831) j!81) a!2831 mask!2608) (Found!11178 j!81)))))

(declare-fun b!1423515 () Bool)

(declare-fun res!958951 () Bool)

(assert (=> b!1423515 (=> (not res!958951) (not e!804606))))

(assert (=> b!1423515 (= res!958951 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627147 lt!627144 mask!2608) lt!627142))))

(declare-fun b!1423516 () Bool)

(declare-fun res!958945 () Bool)

(assert (=> b!1423516 (=> (not res!958945) (not e!804606))))

(assert (=> b!1423516 (= res!958945 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423517 () Bool)

(assert (=> b!1423517 (= e!804605 e!804611)))

(declare-fun res!958937 () Bool)

(assert (=> b!1423517 (=> res!958937 e!804611)))

(assert (=> b!1423517 (= res!958937 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627145 #b00000000000000000000000000000000) (bvsge lt!627145 (size!47443 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423517 (= lt!627145 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423518 () Bool)

(assert (=> b!1423518 (= e!804609 e!804607)))

(declare-fun res!958944 () Bool)

(assert (=> b!1423518 (=> (not res!958944) (not e!804607))))

(assert (=> b!1423518 (= res!958944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46893 a!2831) j!81) mask!2608) (select (arr!46893 a!2831) j!81) a!2831 mask!2608) lt!627143))))

(assert (=> b!1423518 (= lt!627143 (Intermediate!11178 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122786 res!958940) b!1423507))

(assert (= (and b!1423507 res!958948) b!1423505))

(assert (= (and b!1423505 res!958941) b!1423504))

(assert (= (and b!1423504 res!958950) b!1423511))

(assert (= (and b!1423511 res!958943) b!1423506))

(assert (= (and b!1423506 res!958936) b!1423512))

(assert (= (and b!1423512 res!958947) b!1423518))

(assert (= (and b!1423518 res!958944) b!1423513))

(assert (= (and b!1423513 res!958949) b!1423510))

(assert (= (and b!1423510 res!958946) b!1423515))

(assert (= (and b!1423515 res!958951) b!1423516))

(assert (= (and b!1423516 res!958945) b!1423503))

(assert (= (and b!1423503 res!958938) b!1423514))

(assert (= (and b!1423503 (not res!958939)) b!1423517))

(assert (= (and b!1423517 (not res!958937)) b!1423509))

(assert (= (and b!1423509 (not res!958942)) b!1423508))

(declare-fun m!1314051 () Bool)

(assert (=> b!1423508 m!1314051))

(declare-fun m!1314053 () Bool)

(assert (=> b!1423503 m!1314053))

(declare-fun m!1314055 () Bool)

(assert (=> b!1423503 m!1314055))

(declare-fun m!1314057 () Bool)

(assert (=> b!1423503 m!1314057))

(declare-fun m!1314059 () Bool)

(assert (=> b!1423503 m!1314059))

(declare-fun m!1314061 () Bool)

(assert (=> b!1423503 m!1314061))

(declare-fun m!1314063 () Bool)

(assert (=> b!1423503 m!1314063))

(declare-fun m!1314065 () Bool)

(assert (=> b!1423506 m!1314065))

(assert (=> b!1423509 m!1314061))

(assert (=> b!1423509 m!1314061))

(declare-fun m!1314067 () Bool)

(assert (=> b!1423509 m!1314067))

(assert (=> b!1423510 m!1314061))

(assert (=> b!1423510 m!1314061))

(declare-fun m!1314069 () Bool)

(assert (=> b!1423510 m!1314069))

(assert (=> b!1423518 m!1314061))

(assert (=> b!1423518 m!1314061))

(declare-fun m!1314071 () Bool)

(assert (=> b!1423518 m!1314071))

(assert (=> b!1423518 m!1314071))

(assert (=> b!1423518 m!1314061))

(declare-fun m!1314073 () Bool)

(assert (=> b!1423518 m!1314073))

(declare-fun m!1314075 () Bool)

(assert (=> b!1423517 m!1314075))

(declare-fun m!1314077 () Bool)

(assert (=> b!1423505 m!1314077))

(assert (=> b!1423505 m!1314077))

(declare-fun m!1314079 () Bool)

(assert (=> b!1423505 m!1314079))

(declare-fun m!1314081 () Bool)

(assert (=> b!1423515 m!1314081))

(declare-fun m!1314083 () Bool)

(assert (=> start!122786 m!1314083))

(declare-fun m!1314085 () Bool)

(assert (=> start!122786 m!1314085))

(assert (=> b!1423504 m!1314061))

(assert (=> b!1423504 m!1314061))

(declare-fun m!1314087 () Bool)

(assert (=> b!1423504 m!1314087))

(declare-fun m!1314089 () Bool)

(assert (=> b!1423513 m!1314089))

(assert (=> b!1423513 m!1314089))

(declare-fun m!1314091 () Bool)

(assert (=> b!1423513 m!1314091))

(assert (=> b!1423513 m!1314053))

(declare-fun m!1314093 () Bool)

(assert (=> b!1423513 m!1314093))

(declare-fun m!1314095 () Bool)

(assert (=> b!1423511 m!1314095))

(assert (=> b!1423514 m!1314061))

(assert (=> b!1423514 m!1314061))

(declare-fun m!1314097 () Bool)

(assert (=> b!1423514 m!1314097))

(check-sat (not b!1423504) (not b!1423513) (not b!1423511) (not b!1423508) (not b!1423515) (not b!1423517) (not b!1423509) (not b!1423510) (not b!1423503) (not start!122786) (not b!1423505) (not b!1423514) (not b!1423518) (not b!1423506))
(check-sat)
