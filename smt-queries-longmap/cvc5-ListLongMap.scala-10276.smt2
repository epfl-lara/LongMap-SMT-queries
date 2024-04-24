; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121008 () Bool)

(assert start!121008)

(declare-fun b!1406924 () Bool)

(declare-fun res!944462 () Bool)

(declare-fun e!796454 () Bool)

(assert (=> b!1406924 (=> (not res!944462) (not e!796454))))

(declare-datatypes ((array!96237 0))(
  ( (array!96238 (arr!46464 (Array (_ BitVec 32) (_ BitVec 64))) (size!47015 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96237)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96237 (_ BitVec 32)) Bool)

(assert (=> b!1406924 (= res!944462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406925 () Bool)

(declare-fun res!944461 () Bool)

(assert (=> b!1406925 (=> (not res!944461) (not e!796454))))

(declare-datatypes ((List!32970 0))(
  ( (Nil!32967) (Cons!32966 (h!34228 (_ BitVec 64)) (t!47656 List!32970)) )
))
(declare-fun arrayNoDuplicates!0 (array!96237 (_ BitVec 32) List!32970) Bool)

(assert (=> b!1406925 (= res!944461 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32967))))

(declare-fun e!796452 () Bool)

(declare-fun b!1406926 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10678 0))(
  ( (MissingZero!10678 (index!45089 (_ BitVec 32))) (Found!10678 (index!45090 (_ BitVec 32))) (Intermediate!10678 (undefined!11490 Bool) (index!45091 (_ BitVec 32)) (x!126848 (_ BitVec 32))) (Undefined!10678) (MissingVacant!10678 (index!45092 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96237 (_ BitVec 32)) SeekEntryResult!10678)

(assert (=> b!1406926 (= e!796452 (= (seekEntryOrOpen!0 (select (arr!46464 a!2901) j!112) a!2901 mask!2840) (Found!10678 j!112)))))

(declare-fun b!1406927 () Bool)

(declare-fun res!944459 () Bool)

(assert (=> b!1406927 (=> (not res!944459) (not e!796454))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406927 (= res!944459 (validKeyInArray!0 (select (arr!46464 a!2901) i!1037)))))

(declare-fun b!1406928 () Bool)

(declare-fun res!944458 () Bool)

(assert (=> b!1406928 (=> (not res!944458) (not e!796454))))

(assert (=> b!1406928 (= res!944458 (and (= (size!47015 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47015 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47015 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406929 () Bool)

(declare-fun e!796453 () Bool)

(assert (=> b!1406929 (= e!796453 true)))

(declare-fun lt!619536 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406929 (= lt!619536 (toIndex!0 (select (store (arr!46464 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1406930 () Bool)

(declare-fun res!944464 () Bool)

(assert (=> b!1406930 (=> (not res!944464) (not e!796454))))

(assert (=> b!1406930 (= res!944464 (validKeyInArray!0 (select (arr!46464 a!2901) j!112)))))

(declare-fun b!1406931 () Bool)

(assert (=> b!1406931 (= e!796454 (not e!796453))))

(declare-fun res!944460 () Bool)

(assert (=> b!1406931 (=> res!944460 e!796453)))

(declare-fun lt!619538 () SeekEntryResult!10678)

(assert (=> b!1406931 (= res!944460 (or (not (is-Intermediate!10678 lt!619538)) (undefined!11490 lt!619538)))))

(assert (=> b!1406931 e!796452))

(declare-fun res!944457 () Bool)

(assert (=> b!1406931 (=> (not res!944457) (not e!796452))))

(assert (=> b!1406931 (= res!944457 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47357 0))(
  ( (Unit!47358) )
))
(declare-fun lt!619537 () Unit!47357)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47357)

(assert (=> b!1406931 (= lt!619537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96237 (_ BitVec 32)) SeekEntryResult!10678)

(assert (=> b!1406931 (= lt!619538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46464 a!2901) j!112) mask!2840) (select (arr!46464 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944463 () Bool)

(assert (=> start!121008 (=> (not res!944463) (not e!796454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121008 (= res!944463 (validMask!0 mask!2840))))

(assert (=> start!121008 e!796454))

(assert (=> start!121008 true))

(declare-fun array_inv!35745 (array!96237) Bool)

(assert (=> start!121008 (array_inv!35745 a!2901)))

(assert (= (and start!121008 res!944463) b!1406928))

(assert (= (and b!1406928 res!944458) b!1406927))

(assert (= (and b!1406927 res!944459) b!1406930))

(assert (= (and b!1406930 res!944464) b!1406924))

(assert (= (and b!1406924 res!944462) b!1406925))

(assert (= (and b!1406925 res!944461) b!1406931))

(assert (= (and b!1406931 res!944457) b!1406926))

(assert (= (and b!1406931 (not res!944460)) b!1406929))

(declare-fun m!1296029 () Bool)

(assert (=> b!1406926 m!1296029))

(assert (=> b!1406926 m!1296029))

(declare-fun m!1296031 () Bool)

(assert (=> b!1406926 m!1296031))

(declare-fun m!1296033 () Bool)

(assert (=> b!1406924 m!1296033))

(assert (=> b!1406931 m!1296029))

(declare-fun m!1296035 () Bool)

(assert (=> b!1406931 m!1296035))

(assert (=> b!1406931 m!1296029))

(declare-fun m!1296037 () Bool)

(assert (=> b!1406931 m!1296037))

(assert (=> b!1406931 m!1296035))

(assert (=> b!1406931 m!1296029))

(declare-fun m!1296039 () Bool)

(assert (=> b!1406931 m!1296039))

(declare-fun m!1296041 () Bool)

(assert (=> b!1406931 m!1296041))

(declare-fun m!1296043 () Bool)

(assert (=> b!1406925 m!1296043))

(declare-fun m!1296045 () Bool)

(assert (=> b!1406927 m!1296045))

(assert (=> b!1406927 m!1296045))

(declare-fun m!1296047 () Bool)

(assert (=> b!1406927 m!1296047))

(assert (=> b!1406930 m!1296029))

(assert (=> b!1406930 m!1296029))

(declare-fun m!1296049 () Bool)

(assert (=> b!1406930 m!1296049))

(declare-fun m!1296051 () Bool)

(assert (=> b!1406929 m!1296051))

(declare-fun m!1296053 () Bool)

(assert (=> b!1406929 m!1296053))

(assert (=> b!1406929 m!1296053))

(declare-fun m!1296055 () Bool)

(assert (=> b!1406929 m!1296055))

(declare-fun m!1296057 () Bool)

(assert (=> start!121008 m!1296057))

(declare-fun m!1296059 () Bool)

(assert (=> start!121008 m!1296059))

(push 1)

(assert (not b!1406927))

(assert (not b!1406931))

(assert (not b!1406930))

(assert (not b!1406924))

(assert (not b!1406925))

(assert (not start!121008))

(assert (not b!1406929))

(assert (not b!1406926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

