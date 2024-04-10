; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120564 () Bool)

(assert start!120564)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95973 0))(
  ( (array!95974 (arr!46337 (Array (_ BitVec 32) (_ BitVec 64))) (size!46887 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95973)

(declare-fun e!794824 () Bool)

(declare-fun b!1403847 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10654 0))(
  ( (MissingZero!10654 (index!44993 (_ BitVec 32))) (Found!10654 (index!44994 (_ BitVec 32))) (Intermediate!10654 (undefined!11466 Bool) (index!44995 (_ BitVec 32)) (x!126601 (_ BitVec 32))) (Undefined!10654) (MissingVacant!10654 (index!44996 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95973 (_ BitVec 32)) SeekEntryResult!10654)

(assert (=> b!1403847 (= e!794824 (= (seekEntryOrOpen!0 (select (arr!46337 a!2901) j!112) a!2901 mask!2840) (Found!10654 j!112)))))

(declare-fun b!1403848 () Bool)

(declare-fun e!794823 () Bool)

(assert (=> b!1403848 (= e!794823 (not true))))

(assert (=> b!1403848 e!794824))

(declare-fun res!942358 () Bool)

(assert (=> b!1403848 (=> (not res!942358) (not e!794824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95973 (_ BitVec 32)) Bool)

(assert (=> b!1403848 (= res!942358 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47312 0))(
  ( (Unit!47313) )
))
(declare-fun lt!618524 () Unit!47312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47312)

(assert (=> b!1403848 (= lt!618524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618525 () SeekEntryResult!10654)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95973 (_ BitVec 32)) SeekEntryResult!10654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403848 (= lt!618525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46337 a!2901) j!112) mask!2840) (select (arr!46337 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403849 () Bool)

(declare-fun res!942363 () Bool)

(assert (=> b!1403849 (=> (not res!942363) (not e!794823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403849 (= res!942363 (validKeyInArray!0 (select (arr!46337 a!2901) j!112)))))

(declare-fun b!1403850 () Bool)

(declare-fun res!942359 () Bool)

(assert (=> b!1403850 (=> (not res!942359) (not e!794823))))

(assert (=> b!1403850 (= res!942359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942361 () Bool)

(assert (=> start!120564 (=> (not res!942361) (not e!794823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120564 (= res!942361 (validMask!0 mask!2840))))

(assert (=> start!120564 e!794823))

(assert (=> start!120564 true))

(declare-fun array_inv!35365 (array!95973) Bool)

(assert (=> start!120564 (array_inv!35365 a!2901)))

(declare-fun b!1403851 () Bool)

(declare-fun res!942362 () Bool)

(assert (=> b!1403851 (=> (not res!942362) (not e!794823))))

(declare-datatypes ((List!32856 0))(
  ( (Nil!32853) (Cons!32852 (h!34100 (_ BitVec 64)) (t!47550 List!32856)) )
))
(declare-fun arrayNoDuplicates!0 (array!95973 (_ BitVec 32) List!32856) Bool)

(assert (=> b!1403851 (= res!942362 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32853))))

(declare-fun b!1403852 () Bool)

(declare-fun res!942364 () Bool)

(assert (=> b!1403852 (=> (not res!942364) (not e!794823))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403852 (= res!942364 (and (= (size!46887 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46887 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46887 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403853 () Bool)

(declare-fun res!942360 () Bool)

(assert (=> b!1403853 (=> (not res!942360) (not e!794823))))

(assert (=> b!1403853 (= res!942360 (validKeyInArray!0 (select (arr!46337 a!2901) i!1037)))))

(assert (= (and start!120564 res!942361) b!1403852))

(assert (= (and b!1403852 res!942364) b!1403853))

(assert (= (and b!1403853 res!942360) b!1403849))

(assert (= (and b!1403849 res!942363) b!1403850))

(assert (= (and b!1403850 res!942359) b!1403851))

(assert (= (and b!1403851 res!942362) b!1403848))

(assert (= (and b!1403848 res!942358) b!1403847))

(declare-fun m!1292601 () Bool)

(assert (=> start!120564 m!1292601))

(declare-fun m!1292603 () Bool)

(assert (=> start!120564 m!1292603))

(declare-fun m!1292605 () Bool)

(assert (=> b!1403848 m!1292605))

(declare-fun m!1292607 () Bool)

(assert (=> b!1403848 m!1292607))

(assert (=> b!1403848 m!1292605))

(declare-fun m!1292609 () Bool)

(assert (=> b!1403848 m!1292609))

(assert (=> b!1403848 m!1292607))

(assert (=> b!1403848 m!1292605))

(declare-fun m!1292611 () Bool)

(assert (=> b!1403848 m!1292611))

(declare-fun m!1292613 () Bool)

(assert (=> b!1403848 m!1292613))

(declare-fun m!1292615 () Bool)

(assert (=> b!1403853 m!1292615))

(assert (=> b!1403853 m!1292615))

(declare-fun m!1292617 () Bool)

(assert (=> b!1403853 m!1292617))

(assert (=> b!1403849 m!1292605))

(assert (=> b!1403849 m!1292605))

(declare-fun m!1292619 () Bool)

(assert (=> b!1403849 m!1292619))

(assert (=> b!1403847 m!1292605))

(assert (=> b!1403847 m!1292605))

(declare-fun m!1292621 () Bool)

(assert (=> b!1403847 m!1292621))

(declare-fun m!1292623 () Bool)

(assert (=> b!1403851 m!1292623))

(declare-fun m!1292625 () Bool)

(assert (=> b!1403850 m!1292625))

(push 1)

(assert (not b!1403851))

(assert (not b!1403848))

(assert (not start!120564))

(assert (not b!1403847))

(assert (not b!1403849))

(assert (not b!1403853))

(assert (not b!1403850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

