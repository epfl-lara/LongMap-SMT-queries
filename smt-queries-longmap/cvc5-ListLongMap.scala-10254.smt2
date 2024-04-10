; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120576 () Bool)

(assert start!120576)

(declare-fun b!1403973 () Bool)

(declare-fun res!942488 () Bool)

(declare-fun e!794879 () Bool)

(assert (=> b!1403973 (=> (not res!942488) (not e!794879))))

(declare-datatypes ((array!95985 0))(
  ( (array!95986 (arr!46343 (Array (_ BitVec 32) (_ BitVec 64))) (size!46893 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95985)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403973 (= res!942488 (validKeyInArray!0 (select (arr!46343 a!2901) j!112)))))

(declare-fun b!1403974 () Bool)

(declare-fun res!942490 () Bool)

(assert (=> b!1403974 (=> (not res!942490) (not e!794879))))

(declare-datatypes ((List!32862 0))(
  ( (Nil!32859) (Cons!32858 (h!34106 (_ BitVec 64)) (t!47556 List!32862)) )
))
(declare-fun arrayNoDuplicates!0 (array!95985 (_ BitVec 32) List!32862) Bool)

(assert (=> b!1403974 (= res!942490 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32859))))

(declare-fun res!942485 () Bool)

(assert (=> start!120576 (=> (not res!942485) (not e!794879))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120576 (= res!942485 (validMask!0 mask!2840))))

(assert (=> start!120576 e!794879))

(assert (=> start!120576 true))

(declare-fun array_inv!35371 (array!95985) Bool)

(assert (=> start!120576 (array_inv!35371 a!2901)))

(declare-fun b!1403975 () Bool)

(declare-fun e!794878 () Bool)

(declare-datatypes ((SeekEntryResult!10660 0))(
  ( (MissingZero!10660 (index!45017 (_ BitVec 32))) (Found!10660 (index!45018 (_ BitVec 32))) (Intermediate!10660 (undefined!11472 Bool) (index!45019 (_ BitVec 32)) (x!126623 (_ BitVec 32))) (Undefined!10660) (MissingVacant!10660 (index!45020 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95985 (_ BitVec 32)) SeekEntryResult!10660)

(assert (=> b!1403975 (= e!794878 (= (seekEntryOrOpen!0 (select (arr!46343 a!2901) j!112) a!2901 mask!2840) (Found!10660 j!112)))))

(declare-fun b!1403976 () Bool)

(declare-fun res!942484 () Bool)

(assert (=> b!1403976 (=> (not res!942484) (not e!794879))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403976 (= res!942484 (and (= (size!46893 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46893 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46893 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403977 () Bool)

(assert (=> b!1403977 (= e!794879 (not true))))

(assert (=> b!1403977 e!794878))

(declare-fun res!942489 () Bool)

(assert (=> b!1403977 (=> (not res!942489) (not e!794878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95985 (_ BitVec 32)) Bool)

(assert (=> b!1403977 (= res!942489 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47324 0))(
  ( (Unit!47325) )
))
(declare-fun lt!618561 () Unit!47324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47324)

(assert (=> b!1403977 (= lt!618561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618560 () SeekEntryResult!10660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95985 (_ BitVec 32)) SeekEntryResult!10660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403977 (= lt!618560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46343 a!2901) j!112) mask!2840) (select (arr!46343 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403978 () Bool)

(declare-fun res!942486 () Bool)

(assert (=> b!1403978 (=> (not res!942486) (not e!794879))))

(assert (=> b!1403978 (= res!942486 (validKeyInArray!0 (select (arr!46343 a!2901) i!1037)))))

(declare-fun b!1403979 () Bool)

(declare-fun res!942487 () Bool)

(assert (=> b!1403979 (=> (not res!942487) (not e!794879))))

(assert (=> b!1403979 (= res!942487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120576 res!942485) b!1403976))

(assert (= (and b!1403976 res!942484) b!1403978))

(assert (= (and b!1403978 res!942486) b!1403973))

(assert (= (and b!1403973 res!942488) b!1403979))

(assert (= (and b!1403979 res!942487) b!1403974))

(assert (= (and b!1403974 res!942490) b!1403977))

(assert (= (and b!1403977 res!942489) b!1403975))

(declare-fun m!1292757 () Bool)

(assert (=> b!1403974 m!1292757))

(declare-fun m!1292759 () Bool)

(assert (=> b!1403978 m!1292759))

(assert (=> b!1403978 m!1292759))

(declare-fun m!1292761 () Bool)

(assert (=> b!1403978 m!1292761))

(declare-fun m!1292763 () Bool)

(assert (=> b!1403979 m!1292763))

(declare-fun m!1292765 () Bool)

(assert (=> b!1403973 m!1292765))

(assert (=> b!1403973 m!1292765))

(declare-fun m!1292767 () Bool)

(assert (=> b!1403973 m!1292767))

(assert (=> b!1403975 m!1292765))

(assert (=> b!1403975 m!1292765))

(declare-fun m!1292769 () Bool)

(assert (=> b!1403975 m!1292769))

(declare-fun m!1292771 () Bool)

(assert (=> start!120576 m!1292771))

(declare-fun m!1292773 () Bool)

(assert (=> start!120576 m!1292773))

(assert (=> b!1403977 m!1292765))

(declare-fun m!1292775 () Bool)

(assert (=> b!1403977 m!1292775))

(assert (=> b!1403977 m!1292765))

(declare-fun m!1292777 () Bool)

(assert (=> b!1403977 m!1292777))

(assert (=> b!1403977 m!1292775))

(assert (=> b!1403977 m!1292765))

(declare-fun m!1292779 () Bool)

(assert (=> b!1403977 m!1292779))

(declare-fun m!1292781 () Bool)

(assert (=> b!1403977 m!1292781))

(push 1)

(assert (not b!1403978))

(assert (not b!1403974))

(assert (not b!1403977))

(assert (not b!1403973))

(assert (not b!1403979))

(assert (not start!120576))

(assert (not b!1403975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

