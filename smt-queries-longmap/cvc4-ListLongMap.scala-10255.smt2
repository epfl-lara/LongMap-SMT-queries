; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120586 () Bool)

(assert start!120586)

(declare-fun b!1404062 () Bool)

(declare-fun res!942576 () Bool)

(declare-fun e!794914 () Bool)

(assert (=> b!1404062 (=> (not res!942576) (not e!794914))))

(declare-datatypes ((array!95995 0))(
  ( (array!95996 (arr!46348 (Array (_ BitVec 32) (_ BitVec 64))) (size!46898 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95995)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404062 (= res!942576 (validKeyInArray!0 (select (arr!46348 a!2901) j!112)))))

(declare-fun b!1404063 () Bool)

(declare-fun res!942574 () Bool)

(assert (=> b!1404063 (=> (not res!942574) (not e!794914))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404063 (= res!942574 (validKeyInArray!0 (select (arr!46348 a!2901) i!1037)))))

(declare-fun res!942573 () Bool)

(assert (=> start!120586 (=> (not res!942573) (not e!794914))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120586 (= res!942573 (validMask!0 mask!2840))))

(assert (=> start!120586 e!794914))

(assert (=> start!120586 true))

(declare-fun array_inv!35376 (array!95995) Bool)

(assert (=> start!120586 (array_inv!35376 a!2901)))

(declare-fun b!1404064 () Bool)

(assert (=> b!1404064 (= e!794914 false)))

(declare-fun lt!618582 () Bool)

(declare-datatypes ((List!32867 0))(
  ( (Nil!32864) (Cons!32863 (h!34111 (_ BitVec 64)) (t!47561 List!32867)) )
))
(declare-fun arrayNoDuplicates!0 (array!95995 (_ BitVec 32) List!32867) Bool)

(assert (=> b!1404064 (= lt!618582 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32864))))

(declare-fun b!1404065 () Bool)

(declare-fun res!942575 () Bool)

(assert (=> b!1404065 (=> (not res!942575) (not e!794914))))

(assert (=> b!1404065 (= res!942575 (and (= (size!46898 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46898 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46898 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404066 () Bool)

(declare-fun res!942577 () Bool)

(assert (=> b!1404066 (=> (not res!942577) (not e!794914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95995 (_ BitVec 32)) Bool)

(assert (=> b!1404066 (= res!942577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120586 res!942573) b!1404065))

(assert (= (and b!1404065 res!942575) b!1404063))

(assert (= (and b!1404063 res!942574) b!1404062))

(assert (= (and b!1404062 res!942576) b!1404066))

(assert (= (and b!1404066 res!942577) b!1404064))

(declare-fun m!1292867 () Bool)

(assert (=> b!1404063 m!1292867))

(assert (=> b!1404063 m!1292867))

(declare-fun m!1292869 () Bool)

(assert (=> b!1404063 m!1292869))

(declare-fun m!1292871 () Bool)

(assert (=> b!1404066 m!1292871))

(declare-fun m!1292873 () Bool)

(assert (=> b!1404064 m!1292873))

(declare-fun m!1292875 () Bool)

(assert (=> start!120586 m!1292875))

(declare-fun m!1292877 () Bool)

(assert (=> start!120586 m!1292877))

(declare-fun m!1292879 () Bool)

(assert (=> b!1404062 m!1292879))

(assert (=> b!1404062 m!1292879))

(declare-fun m!1292881 () Bool)

(assert (=> b!1404062 m!1292881))

(push 1)

(assert (not b!1404063))

(assert (not b!1404062))

(assert (not b!1404064))

(assert (not b!1404066))

(assert (not start!120586))

(check-sat)

(pop 1)

(push 1)

