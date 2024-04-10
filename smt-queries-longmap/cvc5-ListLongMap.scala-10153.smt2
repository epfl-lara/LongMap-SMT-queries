; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119682 () Bool)

(assert start!119682)

(declare-fun b!1394123 () Bool)

(declare-fun res!933536 () Bool)

(declare-fun e!789361 () Bool)

(assert (=> b!1394123 (=> (not res!933536) (not e!789361))))

(declare-datatypes ((array!95364 0))(
  ( (array!95365 (arr!46040 (Array (_ BitVec 32) (_ BitVec 64))) (size!46590 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95364)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394123 (= res!933536 (validKeyInArray!0 (select (arr!46040 a!2901) i!1037)))))

(declare-fun b!1394124 () Bool)

(declare-fun res!933534 () Bool)

(assert (=> b!1394124 (=> (not res!933534) (not e!789361))))

(declare-datatypes ((List!32559 0))(
  ( (Nil!32556) (Cons!32555 (h!33788 (_ BitVec 64)) (t!47253 List!32559)) )
))
(declare-fun arrayNoDuplicates!0 (array!95364 (_ BitVec 32) List!32559) Bool)

(assert (=> b!1394124 (= res!933534 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32556))))

(declare-fun b!1394125 () Bool)

(declare-fun e!789359 () Bool)

(assert (=> b!1394125 (= e!789359 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10357 0))(
  ( (MissingZero!10357 (index!43799 (_ BitVec 32))) (Found!10357 (index!43800 (_ BitVec 32))) (Intermediate!10357 (undefined!11169 Bool) (index!43801 (_ BitVec 32)) (x!125473 (_ BitVec 32))) (Undefined!10357) (MissingVacant!10357 (index!43802 (_ BitVec 32))) )
))
(declare-fun lt!612247 () SeekEntryResult!10357)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95364 (_ BitVec 32)) SeekEntryResult!10357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394125 (= lt!612247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46040 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46040 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95365 (store (arr!46040 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)) mask!2840))))

(declare-fun res!933538 () Bool)

(assert (=> start!119682 (=> (not res!933538) (not e!789361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119682 (= res!933538 (validMask!0 mask!2840))))

(assert (=> start!119682 e!789361))

(assert (=> start!119682 true))

(declare-fun array_inv!35068 (array!95364) Bool)

(assert (=> start!119682 (array_inv!35068 a!2901)))

(declare-fun b!1394126 () Bool)

(declare-fun res!933537 () Bool)

(assert (=> b!1394126 (=> (not res!933537) (not e!789361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95364 (_ BitVec 32)) Bool)

(assert (=> b!1394126 (= res!933537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394127 () Bool)

(declare-fun res!933532 () Bool)

(assert (=> b!1394127 (=> (not res!933532) (not e!789361))))

(assert (=> b!1394127 (= res!933532 (and (= (size!46590 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46590 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46590 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394128 () Bool)

(assert (=> b!1394128 (= e!789361 (not e!789359))))

(declare-fun res!933531 () Bool)

(assert (=> b!1394128 (=> res!933531 e!789359)))

(declare-fun lt!612249 () SeekEntryResult!10357)

(assert (=> b!1394128 (= res!933531 (or (not (is-Intermediate!10357 lt!612249)) (undefined!11169 lt!612249)))))

(declare-fun e!789360 () Bool)

(assert (=> b!1394128 e!789360))

(declare-fun res!933533 () Bool)

(assert (=> b!1394128 (=> (not res!933533) (not e!789360))))

(assert (=> b!1394128 (= res!933533 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46718 0))(
  ( (Unit!46719) )
))
(declare-fun lt!612248 () Unit!46718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46718)

(assert (=> b!1394128 (= lt!612248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394128 (= lt!612249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46040 a!2901) j!112) mask!2840) (select (arr!46040 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394129 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95364 (_ BitVec 32)) SeekEntryResult!10357)

(assert (=> b!1394129 (= e!789360 (= (seekEntryOrOpen!0 (select (arr!46040 a!2901) j!112) a!2901 mask!2840) (Found!10357 j!112)))))

(declare-fun b!1394130 () Bool)

(declare-fun res!933535 () Bool)

(assert (=> b!1394130 (=> (not res!933535) (not e!789361))))

(assert (=> b!1394130 (= res!933535 (validKeyInArray!0 (select (arr!46040 a!2901) j!112)))))

(assert (= (and start!119682 res!933538) b!1394127))

(assert (= (and b!1394127 res!933532) b!1394123))

(assert (= (and b!1394123 res!933536) b!1394130))

(assert (= (and b!1394130 res!933535) b!1394126))

(assert (= (and b!1394126 res!933537) b!1394124))

(assert (= (and b!1394124 res!933534) b!1394128))

(assert (= (and b!1394128 res!933533) b!1394129))

(assert (= (and b!1394128 (not res!933531)) b!1394125))

(declare-fun m!1280319 () Bool)

(assert (=> b!1394124 m!1280319))

(declare-fun m!1280321 () Bool)

(assert (=> b!1394130 m!1280321))

(assert (=> b!1394130 m!1280321))

(declare-fun m!1280323 () Bool)

(assert (=> b!1394130 m!1280323))

(assert (=> b!1394129 m!1280321))

(assert (=> b!1394129 m!1280321))

(declare-fun m!1280325 () Bool)

(assert (=> b!1394129 m!1280325))

(declare-fun m!1280327 () Bool)

(assert (=> start!119682 m!1280327))

(declare-fun m!1280329 () Bool)

(assert (=> start!119682 m!1280329))

(declare-fun m!1280331 () Bool)

(assert (=> b!1394126 m!1280331))

(declare-fun m!1280333 () Bool)

(assert (=> b!1394123 m!1280333))

(assert (=> b!1394123 m!1280333))

(declare-fun m!1280335 () Bool)

(assert (=> b!1394123 m!1280335))

(declare-fun m!1280337 () Bool)

(assert (=> b!1394125 m!1280337))

(declare-fun m!1280339 () Bool)

(assert (=> b!1394125 m!1280339))

(assert (=> b!1394125 m!1280339))

(declare-fun m!1280341 () Bool)

(assert (=> b!1394125 m!1280341))

(assert (=> b!1394125 m!1280341))

(assert (=> b!1394125 m!1280339))

(declare-fun m!1280343 () Bool)

(assert (=> b!1394125 m!1280343))

(assert (=> b!1394128 m!1280321))

(declare-fun m!1280345 () Bool)

(assert (=> b!1394128 m!1280345))

(assert (=> b!1394128 m!1280321))

(declare-fun m!1280347 () Bool)

(assert (=> b!1394128 m!1280347))

(assert (=> b!1394128 m!1280345))

(assert (=> b!1394128 m!1280321))

(declare-fun m!1280349 () Bool)

(assert (=> b!1394128 m!1280349))

(declare-fun m!1280351 () Bool)

(assert (=> b!1394128 m!1280351))

(push 1)

(assert (not start!119682))

(assert (not b!1394130))

(assert (not b!1394125))

(assert (not b!1394123))

(assert (not b!1394126))

(assert (not b!1394129))

(assert (not b!1394128))

(assert (not b!1394124))

(check-sat)

