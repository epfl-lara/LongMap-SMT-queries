; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120622 () Bool)

(assert start!120622)

(declare-fun b!1404340 () Bool)

(declare-fun res!942902 () Bool)

(declare-fun e!794995 () Bool)

(assert (=> b!1404340 (=> (not res!942902) (not e!794995))))

(declare-datatypes ((array!95984 0))(
  ( (array!95985 (arr!46343 (Array (_ BitVec 32) (_ BitVec 64))) (size!46895 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95984)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95984 (_ BitVec 32)) Bool)

(assert (=> b!1404340 (= res!942902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404341 () Bool)

(declare-fun res!942907 () Bool)

(assert (=> b!1404341 (=> (not res!942907) (not e!794995))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404341 (= res!942907 (validKeyInArray!0 (select (arr!46343 a!2901) i!1037)))))

(declare-fun res!942906 () Bool)

(assert (=> start!120622 (=> (not res!942906) (not e!794995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120622 (= res!942906 (validMask!0 mask!2840))))

(assert (=> start!120622 e!794995))

(assert (=> start!120622 true))

(declare-fun array_inv!35576 (array!95984) Bool)

(assert (=> start!120622 (array_inv!35576 a!2901)))

(declare-fun b!1404342 () Bool)

(assert (=> b!1404342 (= e!794995 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404342 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47177 0))(
  ( (Unit!47178) )
))
(declare-fun lt!618457 () Unit!47177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47177)

(assert (=> b!1404342 (= lt!618457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10680 0))(
  ( (MissingZero!10680 (index!45097 (_ BitVec 32))) (Found!10680 (index!45098 (_ BitVec 32))) (Intermediate!10680 (undefined!11492 Bool) (index!45099 (_ BitVec 32)) (x!126704 (_ BitVec 32))) (Undefined!10680) (MissingVacant!10680 (index!45100 (_ BitVec 32))) )
))
(declare-fun lt!618458 () SeekEntryResult!10680)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95984 (_ BitVec 32)) SeekEntryResult!10680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404342 (= lt!618458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46343 a!2901) j!112) mask!2840) (select (arr!46343 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404343 () Bool)

(declare-fun res!942904 () Bool)

(assert (=> b!1404343 (=> (not res!942904) (not e!794995))))

(assert (=> b!1404343 (= res!942904 (validKeyInArray!0 (select (arr!46343 a!2901) j!112)))))

(declare-fun b!1404344 () Bool)

(declare-fun res!942905 () Bool)

(assert (=> b!1404344 (=> (not res!942905) (not e!794995))))

(declare-datatypes ((List!32940 0))(
  ( (Nil!32937) (Cons!32936 (h!34184 (_ BitVec 64)) (t!47626 List!32940)) )
))
(declare-fun arrayNoDuplicates!0 (array!95984 (_ BitVec 32) List!32940) Bool)

(assert (=> b!1404344 (= res!942905 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32937))))

(declare-fun b!1404345 () Bool)

(declare-fun res!942903 () Bool)

(assert (=> b!1404345 (=> (not res!942903) (not e!794995))))

(assert (=> b!1404345 (= res!942903 (and (= (size!46895 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46895 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46895 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120622 res!942906) b!1404345))

(assert (= (and b!1404345 res!942903) b!1404341))

(assert (= (and b!1404341 res!942907) b!1404343))

(assert (= (and b!1404343 res!942904) b!1404340))

(assert (= (and b!1404340 res!942902) b!1404344))

(assert (= (and b!1404344 res!942905) b!1404342))

(declare-fun m!1292725 () Bool)

(assert (=> b!1404342 m!1292725))

(declare-fun m!1292727 () Bool)

(assert (=> b!1404342 m!1292727))

(assert (=> b!1404342 m!1292725))

(declare-fun m!1292729 () Bool)

(assert (=> b!1404342 m!1292729))

(assert (=> b!1404342 m!1292727))

(assert (=> b!1404342 m!1292725))

(declare-fun m!1292731 () Bool)

(assert (=> b!1404342 m!1292731))

(declare-fun m!1292733 () Bool)

(assert (=> b!1404342 m!1292733))

(declare-fun m!1292735 () Bool)

(assert (=> b!1404340 m!1292735))

(assert (=> b!1404343 m!1292725))

(assert (=> b!1404343 m!1292725))

(declare-fun m!1292737 () Bool)

(assert (=> b!1404343 m!1292737))

(declare-fun m!1292739 () Bool)

(assert (=> b!1404344 m!1292739))

(declare-fun m!1292741 () Bool)

(assert (=> start!120622 m!1292741))

(declare-fun m!1292743 () Bool)

(assert (=> start!120622 m!1292743))

(declare-fun m!1292745 () Bool)

(assert (=> b!1404341 m!1292745))

(assert (=> b!1404341 m!1292745))

(declare-fun m!1292747 () Bool)

(assert (=> b!1404341 m!1292747))

(push 1)

(assert (not start!120622))

(assert (not b!1404340))

(assert (not b!1404344))

(assert (not b!1404341))

(assert (not b!1404342))

(assert (not b!1404343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

