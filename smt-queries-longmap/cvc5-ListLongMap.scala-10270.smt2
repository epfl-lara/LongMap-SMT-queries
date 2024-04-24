; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120972 () Bool)

(assert start!120972)

(declare-fun b!1406529 () Bool)

(declare-fun res!944063 () Bool)

(declare-fun e!796272 () Bool)

(assert (=> b!1406529 (=> (not res!944063) (not e!796272))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96201 0))(
  ( (array!96202 (arr!46446 (Array (_ BitVec 32) (_ BitVec 64))) (size!46997 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96201)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406529 (= res!944063 (and (= (size!46997 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46997 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46997 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!796273 () Bool)

(declare-fun b!1406531 () Bool)

(declare-datatypes ((SeekEntryResult!10660 0))(
  ( (MissingZero!10660 (index!45017 (_ BitVec 32))) (Found!10660 (index!45018 (_ BitVec 32))) (Intermediate!10660 (undefined!11472 Bool) (index!45019 (_ BitVec 32)) (x!126782 (_ BitVec 32))) (Undefined!10660) (MissingVacant!10660 (index!45020 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10660)

(assert (=> b!1406531 (= e!796273 (= (seekEntryOrOpen!0 (select (arr!46446 a!2901) j!112) a!2901 mask!2840) (Found!10660 j!112)))))

(declare-fun b!1406532 () Bool)

(declare-fun res!944064 () Bool)

(assert (=> b!1406532 (=> (not res!944064) (not e!796272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96201 (_ BitVec 32)) Bool)

(assert (=> b!1406532 (= res!944064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406530 () Bool)

(declare-fun res!944066 () Bool)

(assert (=> b!1406530 (=> (not res!944066) (not e!796272))))

(declare-datatypes ((List!32952 0))(
  ( (Nil!32949) (Cons!32948 (h!34210 (_ BitVec 64)) (t!47638 List!32952)) )
))
(declare-fun arrayNoDuplicates!0 (array!96201 (_ BitVec 32) List!32952) Bool)

(assert (=> b!1406530 (= res!944066 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32949))))

(declare-fun res!944065 () Bool)

(assert (=> start!120972 (=> (not res!944065) (not e!796272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120972 (= res!944065 (validMask!0 mask!2840))))

(assert (=> start!120972 e!796272))

(assert (=> start!120972 true))

(declare-fun array_inv!35727 (array!96201) Bool)

(assert (=> start!120972 (array_inv!35727 a!2901)))

(declare-fun b!1406533 () Bool)

(assert (=> b!1406533 (= e!796272 (not true))))

(assert (=> b!1406533 e!796273))

(declare-fun res!944068 () Bool)

(assert (=> b!1406533 (=> (not res!944068) (not e!796273))))

(assert (=> b!1406533 (= res!944068 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47321 0))(
  ( (Unit!47322) )
))
(declare-fun lt!619412 () Unit!47321)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47321)

(assert (=> b!1406533 (= lt!619412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619411 () SeekEntryResult!10660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406533 (= lt!619411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46446 a!2901) j!112) mask!2840) (select (arr!46446 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406534 () Bool)

(declare-fun res!944062 () Bool)

(assert (=> b!1406534 (=> (not res!944062) (not e!796272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406534 (= res!944062 (validKeyInArray!0 (select (arr!46446 a!2901) j!112)))))

(declare-fun b!1406535 () Bool)

(declare-fun res!944067 () Bool)

(assert (=> b!1406535 (=> (not res!944067) (not e!796272))))

(assert (=> b!1406535 (= res!944067 (validKeyInArray!0 (select (arr!46446 a!2901) i!1037)))))

(assert (= (and start!120972 res!944065) b!1406529))

(assert (= (and b!1406529 res!944063) b!1406535))

(assert (= (and b!1406535 res!944067) b!1406534))

(assert (= (and b!1406534 res!944062) b!1406532))

(assert (= (and b!1406532 res!944064) b!1406530))

(assert (= (and b!1406530 res!944066) b!1406533))

(assert (= (and b!1406533 res!944068) b!1406531))

(declare-fun m!1295531 () Bool)

(assert (=> b!1406535 m!1295531))

(assert (=> b!1406535 m!1295531))

(declare-fun m!1295533 () Bool)

(assert (=> b!1406535 m!1295533))

(declare-fun m!1295535 () Bool)

(assert (=> b!1406530 m!1295535))

(declare-fun m!1295537 () Bool)

(assert (=> b!1406531 m!1295537))

(assert (=> b!1406531 m!1295537))

(declare-fun m!1295539 () Bool)

(assert (=> b!1406531 m!1295539))

(assert (=> b!1406533 m!1295537))

(declare-fun m!1295541 () Bool)

(assert (=> b!1406533 m!1295541))

(assert (=> b!1406533 m!1295537))

(declare-fun m!1295543 () Bool)

(assert (=> b!1406533 m!1295543))

(assert (=> b!1406533 m!1295541))

(assert (=> b!1406533 m!1295537))

(declare-fun m!1295545 () Bool)

(assert (=> b!1406533 m!1295545))

(declare-fun m!1295547 () Bool)

(assert (=> b!1406533 m!1295547))

(declare-fun m!1295549 () Bool)

(assert (=> start!120972 m!1295549))

(declare-fun m!1295551 () Bool)

(assert (=> start!120972 m!1295551))

(assert (=> b!1406534 m!1295537))

(assert (=> b!1406534 m!1295537))

(declare-fun m!1295553 () Bool)

(assert (=> b!1406534 m!1295553))

(declare-fun m!1295555 () Bool)

(assert (=> b!1406532 m!1295555))

(push 1)

(assert (not b!1406534))

(assert (not start!120972))

(assert (not b!1406530))

(assert (not b!1406531))

(assert (not b!1406532))

(assert (not b!1406533))

(assert (not b!1406535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

