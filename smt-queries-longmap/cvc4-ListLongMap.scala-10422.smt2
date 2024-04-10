; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122698 () Bool)

(assert start!122698)

(declare-fun b!1421503 () Bool)

(declare-fun res!956939 () Bool)

(declare-fun e!803756 () Bool)

(assert (=> b!1421503 (=> (not res!956939) (not e!803756))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11134 0))(
  ( (MissingZero!11134 (index!46928 (_ BitVec 32))) (Found!11134 (index!46929 (_ BitVec 32))) (Intermediate!11134 (undefined!11946 Bool) (index!46930 (_ BitVec 32)) (x!128576 (_ BitVec 32))) (Undefined!11134) (MissingVacant!11134 (index!46931 (_ BitVec 32))) )
))
(declare-fun lt!626292 () SeekEntryResult!11134)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97063 0))(
  ( (array!97064 (arr!46849 (Array (_ BitVec 32) (_ BitVec 64))) (size!47399 (_ BitVec 32))) )
))
(declare-fun lt!626291 () array!97063)

(declare-fun lt!626293 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97063 (_ BitVec 32)) SeekEntryResult!11134)

(assert (=> b!1421503 (= res!956939 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626293 lt!626291 mask!2608) lt!626292))))

(declare-fun res!956936 () Bool)

(declare-fun e!803759 () Bool)

(assert (=> start!122698 (=> (not res!956936) (not e!803759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122698 (= res!956936 (validMask!0 mask!2608))))

(assert (=> start!122698 e!803759))

(assert (=> start!122698 true))

(declare-fun a!2831 () array!97063)

(declare-fun array_inv!35877 (array!97063) Bool)

(assert (=> start!122698 (array_inv!35877 a!2831)))

(declare-fun b!1421504 () Bool)

(declare-fun res!956940 () Bool)

(assert (=> b!1421504 (=> (not res!956940) (not e!803759))))

(declare-datatypes ((List!33359 0))(
  ( (Nil!33356) (Cons!33355 (h!34657 (_ BitVec 64)) (t!48053 List!33359)) )
))
(declare-fun arrayNoDuplicates!0 (array!97063 (_ BitVec 32) List!33359) Bool)

(assert (=> b!1421504 (= res!956940 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33356))))

(declare-fun b!1421505 () Bool)

(declare-fun e!803758 () Bool)

(assert (=> b!1421505 (= e!803759 e!803758)))

(declare-fun res!956937 () Bool)

(assert (=> b!1421505 (=> (not res!956937) (not e!803758))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!626295 () SeekEntryResult!11134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421505 (= res!956937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46849 a!2831) j!81) mask!2608) (select (arr!46849 a!2831) j!81) a!2831 mask!2608) lt!626295))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421505 (= lt!626295 (Intermediate!11134 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421506 () Bool)

(declare-fun res!956947 () Bool)

(assert (=> b!1421506 (=> (not res!956947) (not e!803759))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421506 (= res!956947 (and (= (size!47399 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47399 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47399 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421507 () Bool)

(declare-fun res!956942 () Bool)

(assert (=> b!1421507 (=> (not res!956942) (not e!803756))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421507 (= res!956942 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421508 () Bool)

(declare-fun res!956945 () Bool)

(assert (=> b!1421508 (=> (not res!956945) (not e!803756))))

(assert (=> b!1421508 (= res!956945 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46849 a!2831) j!81) a!2831 mask!2608) lt!626295))))

(declare-fun b!1421509 () Bool)

(declare-fun res!956943 () Bool)

(assert (=> b!1421509 (=> (not res!956943) (not e!803759))))

(assert (=> b!1421509 (= res!956943 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47399 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47399 a!2831))))))

(declare-fun b!1421510 () Bool)

(assert (=> b!1421510 (= e!803758 e!803756)))

(declare-fun res!956944 () Bool)

(assert (=> b!1421510 (=> (not res!956944) (not e!803756))))

(assert (=> b!1421510 (= res!956944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626293 mask!2608) lt!626293 lt!626291 mask!2608) lt!626292))))

(assert (=> b!1421510 (= lt!626292 (Intermediate!11134 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421510 (= lt!626293 (select (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421510 (= lt!626291 (array!97064 (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47399 a!2831)))))

(declare-fun b!1421511 () Bool)

(declare-fun res!956938 () Bool)

(assert (=> b!1421511 (=> (not res!956938) (not e!803759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421511 (= res!956938 (validKeyInArray!0 (select (arr!46849 a!2831) j!81)))))

(declare-fun b!1421512 () Bool)

(declare-fun res!956946 () Bool)

(assert (=> b!1421512 (=> (not res!956946) (not e!803759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97063 (_ BitVec 32)) Bool)

(assert (=> b!1421512 (= res!956946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421513 () Bool)

(assert (=> b!1421513 (= e!803756 (not true))))

(assert (=> b!1421513 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48104 0))(
  ( (Unit!48105) )
))
(declare-fun lt!626294 () Unit!48104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48104)

(assert (=> b!1421513 (= lt!626294 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421514 () Bool)

(declare-fun res!956941 () Bool)

(assert (=> b!1421514 (=> (not res!956941) (not e!803759))))

(assert (=> b!1421514 (= res!956941 (validKeyInArray!0 (select (arr!46849 a!2831) i!982)))))

(assert (= (and start!122698 res!956936) b!1421506))

(assert (= (and b!1421506 res!956947) b!1421514))

(assert (= (and b!1421514 res!956941) b!1421511))

(assert (= (and b!1421511 res!956938) b!1421512))

(assert (= (and b!1421512 res!956946) b!1421504))

(assert (= (and b!1421504 res!956940) b!1421509))

(assert (= (and b!1421509 res!956943) b!1421505))

(assert (= (and b!1421505 res!956937) b!1421510))

(assert (= (and b!1421510 res!956944) b!1421508))

(assert (= (and b!1421508 res!956945) b!1421503))

(assert (= (and b!1421503 res!956939) b!1421507))

(assert (= (and b!1421507 res!956942) b!1421513))

(declare-fun m!1312047 () Bool)

(assert (=> b!1421503 m!1312047))

(declare-fun m!1312049 () Bool)

(assert (=> b!1421510 m!1312049))

(assert (=> b!1421510 m!1312049))

(declare-fun m!1312051 () Bool)

(assert (=> b!1421510 m!1312051))

(declare-fun m!1312053 () Bool)

(assert (=> b!1421510 m!1312053))

(declare-fun m!1312055 () Bool)

(assert (=> b!1421510 m!1312055))

(declare-fun m!1312057 () Bool)

(assert (=> b!1421511 m!1312057))

(assert (=> b!1421511 m!1312057))

(declare-fun m!1312059 () Bool)

(assert (=> b!1421511 m!1312059))

(declare-fun m!1312061 () Bool)

(assert (=> b!1421504 m!1312061))

(declare-fun m!1312063 () Bool)

(assert (=> start!122698 m!1312063))

(declare-fun m!1312065 () Bool)

(assert (=> start!122698 m!1312065))

(declare-fun m!1312067 () Bool)

(assert (=> b!1421514 m!1312067))

(assert (=> b!1421514 m!1312067))

(declare-fun m!1312069 () Bool)

(assert (=> b!1421514 m!1312069))

(assert (=> b!1421508 m!1312057))

(assert (=> b!1421508 m!1312057))

(declare-fun m!1312071 () Bool)

(assert (=> b!1421508 m!1312071))

(declare-fun m!1312073 () Bool)

(assert (=> b!1421513 m!1312073))

(declare-fun m!1312075 () Bool)

(assert (=> b!1421513 m!1312075))

(declare-fun m!1312077 () Bool)

(assert (=> b!1421512 m!1312077))

(assert (=> b!1421505 m!1312057))

(assert (=> b!1421505 m!1312057))

(declare-fun m!1312079 () Bool)

(assert (=> b!1421505 m!1312079))

(assert (=> b!1421505 m!1312079))

(assert (=> b!1421505 m!1312057))

(declare-fun m!1312081 () Bool)

(assert (=> b!1421505 m!1312081))

(push 1)

