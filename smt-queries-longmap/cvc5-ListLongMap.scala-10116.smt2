; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119190 () Bool)

(assert start!119190)

(declare-fun b!1390371 () Bool)

(declare-fun res!930533 () Bool)

(declare-fun e!787389 () Bool)

(assert (=> b!1390371 (=> (not res!930533) (not e!787389))))

(declare-datatypes ((array!95127 0))(
  ( (array!95128 (arr!45929 (Array (_ BitVec 32) (_ BitVec 64))) (size!46479 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95127)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390371 (= res!930533 (validKeyInArray!0 (select (arr!45929 a!2901) i!1037)))))

(declare-fun b!1390372 () Bool)

(declare-fun res!930532 () Bool)

(assert (=> b!1390372 (=> (not res!930532) (not e!787389))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390372 (= res!930532 (validKeyInArray!0 (select (arr!45929 a!2901) j!112)))))

(declare-fun e!787391 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1390373 () Bool)

(declare-datatypes ((SeekEntryResult!10246 0))(
  ( (MissingZero!10246 (index!43355 (_ BitVec 32))) (Found!10246 (index!43356 (_ BitVec 32))) (Intermediate!10246 (undefined!11058 Bool) (index!43357 (_ BitVec 32)) (x!125036 (_ BitVec 32))) (Undefined!10246) (MissingVacant!10246 (index!43358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95127 (_ BitVec 32)) SeekEntryResult!10246)

(assert (=> b!1390373 (= e!787391 (= (seekEntryOrOpen!0 (select (arr!45929 a!2901) j!112) a!2901 mask!2840) (Found!10246 j!112)))))

(declare-fun b!1390374 () Bool)

(declare-fun res!930538 () Bool)

(assert (=> b!1390374 (=> (not res!930538) (not e!787389))))

(assert (=> b!1390374 (= res!930538 (and (= (size!46479 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46479 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46479 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390375 () Bool)

(declare-fun res!930535 () Bool)

(assert (=> b!1390375 (=> (not res!930535) (not e!787389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95127 (_ BitVec 32)) Bool)

(assert (=> b!1390375 (= res!930535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930537 () Bool)

(assert (=> start!119190 (=> (not res!930537) (not e!787389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119190 (= res!930537 (validMask!0 mask!2840))))

(assert (=> start!119190 e!787389))

(assert (=> start!119190 true))

(declare-fun array_inv!34957 (array!95127) Bool)

(assert (=> start!119190 (array_inv!34957 a!2901)))

(declare-fun b!1390376 () Bool)

(assert (=> b!1390376 (= e!787389 (not true))))

(assert (=> b!1390376 e!787391))

(declare-fun res!930534 () Bool)

(assert (=> b!1390376 (=> (not res!930534) (not e!787391))))

(assert (=> b!1390376 (= res!930534 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46496 0))(
  ( (Unit!46497) )
))
(declare-fun lt!610806 () Unit!46496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46496)

(assert (=> b!1390376 (= lt!610806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610805 () SeekEntryResult!10246)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95127 (_ BitVec 32)) SeekEntryResult!10246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390376 (= lt!610805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45929 a!2901) j!112) mask!2840) (select (arr!45929 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390377 () Bool)

(declare-fun res!930536 () Bool)

(assert (=> b!1390377 (=> (not res!930536) (not e!787389))))

(declare-datatypes ((List!32448 0))(
  ( (Nil!32445) (Cons!32444 (h!33662 (_ BitVec 64)) (t!47142 List!32448)) )
))
(declare-fun arrayNoDuplicates!0 (array!95127 (_ BitVec 32) List!32448) Bool)

(assert (=> b!1390377 (= res!930536 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32445))))

(assert (= (and start!119190 res!930537) b!1390374))

(assert (= (and b!1390374 res!930538) b!1390371))

(assert (= (and b!1390371 res!930533) b!1390372))

(assert (= (and b!1390372 res!930532) b!1390375))

(assert (= (and b!1390375 res!930535) b!1390377))

(assert (= (and b!1390377 res!930536) b!1390376))

(assert (= (and b!1390376 res!930534) b!1390373))

(declare-fun m!1276203 () Bool)

(assert (=> b!1390376 m!1276203))

(declare-fun m!1276205 () Bool)

(assert (=> b!1390376 m!1276205))

(assert (=> b!1390376 m!1276203))

(declare-fun m!1276207 () Bool)

(assert (=> b!1390376 m!1276207))

(assert (=> b!1390376 m!1276205))

(assert (=> b!1390376 m!1276203))

(declare-fun m!1276209 () Bool)

(assert (=> b!1390376 m!1276209))

(declare-fun m!1276211 () Bool)

(assert (=> b!1390376 m!1276211))

(declare-fun m!1276213 () Bool)

(assert (=> start!119190 m!1276213))

(declare-fun m!1276215 () Bool)

(assert (=> start!119190 m!1276215))

(declare-fun m!1276217 () Bool)

(assert (=> b!1390371 m!1276217))

(assert (=> b!1390371 m!1276217))

(declare-fun m!1276219 () Bool)

(assert (=> b!1390371 m!1276219))

(assert (=> b!1390373 m!1276203))

(assert (=> b!1390373 m!1276203))

(declare-fun m!1276221 () Bool)

(assert (=> b!1390373 m!1276221))

(declare-fun m!1276223 () Bool)

(assert (=> b!1390375 m!1276223))

(assert (=> b!1390372 m!1276203))

(assert (=> b!1390372 m!1276203))

(declare-fun m!1276225 () Bool)

(assert (=> b!1390372 m!1276225))

(declare-fun m!1276227 () Bool)

(assert (=> b!1390377 m!1276227))

(push 1)

(assert (not start!119190))

(assert (not b!1390376))

(assert (not b!1390372))

(assert (not b!1390377))

(assert (not b!1390375))

(assert (not b!1390373))

(assert (not b!1390371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

