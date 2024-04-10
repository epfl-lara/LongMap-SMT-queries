; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119032 () Bool)

(assert start!119032)

(declare-fun b!1389136 () Bool)

(declare-fun e!786905 () Bool)

(assert (=> b!1389136 (= e!786905 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95002 0))(
  ( (array!95003 (arr!45868 (Array (_ BitVec 32) (_ BitVec 64))) (size!46418 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95002)

(declare-fun lt!610485 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389136 (= lt!610485 (toIndex!0 (select (arr!45868 a!2901) j!112) mask!2840))))

(declare-fun res!929334 () Bool)

(assert (=> start!119032 (=> (not res!929334) (not e!786905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119032 (= res!929334 (validMask!0 mask!2840))))

(assert (=> start!119032 e!786905))

(assert (=> start!119032 true))

(declare-fun array_inv!34896 (array!95002) Bool)

(assert (=> start!119032 (array_inv!34896 a!2901)))

(declare-fun b!1389137 () Bool)

(declare-fun res!929330 () Bool)

(assert (=> b!1389137 (=> (not res!929330) (not e!786905))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389137 (= res!929330 (and (= (size!46418 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46418 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46418 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389138 () Bool)

(declare-fun res!929333 () Bool)

(assert (=> b!1389138 (=> (not res!929333) (not e!786905))))

(declare-datatypes ((List!32387 0))(
  ( (Nil!32384) (Cons!32383 (h!33598 (_ BitVec 64)) (t!47081 List!32387)) )
))
(declare-fun arrayNoDuplicates!0 (array!95002 (_ BitVec 32) List!32387) Bool)

(assert (=> b!1389138 (= res!929333 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32384))))

(declare-fun b!1389139 () Bool)

(declare-fun res!929335 () Bool)

(assert (=> b!1389139 (=> (not res!929335) (not e!786905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95002 (_ BitVec 32)) Bool)

(assert (=> b!1389139 (= res!929335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389140 () Bool)

(declare-fun res!929332 () Bool)

(assert (=> b!1389140 (=> (not res!929332) (not e!786905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389140 (= res!929332 (validKeyInArray!0 (select (arr!45868 a!2901) i!1037)))))

(declare-fun b!1389141 () Bool)

(declare-fun res!929331 () Bool)

(assert (=> b!1389141 (=> (not res!929331) (not e!786905))))

(assert (=> b!1389141 (= res!929331 (validKeyInArray!0 (select (arr!45868 a!2901) j!112)))))

(assert (= (and start!119032 res!929334) b!1389137))

(assert (= (and b!1389137 res!929330) b!1389140))

(assert (= (and b!1389140 res!929332) b!1389141))

(assert (= (and b!1389141 res!929331) b!1389139))

(assert (= (and b!1389139 res!929335) b!1389138))

(assert (= (and b!1389138 res!929333) b!1389136))

(declare-fun m!1274811 () Bool)

(assert (=> b!1389138 m!1274811))

(declare-fun m!1274813 () Bool)

(assert (=> b!1389141 m!1274813))

(assert (=> b!1389141 m!1274813))

(declare-fun m!1274815 () Bool)

(assert (=> b!1389141 m!1274815))

(declare-fun m!1274817 () Bool)

(assert (=> b!1389140 m!1274817))

(assert (=> b!1389140 m!1274817))

(declare-fun m!1274819 () Bool)

(assert (=> b!1389140 m!1274819))

(declare-fun m!1274821 () Bool)

(assert (=> b!1389139 m!1274821))

(declare-fun m!1274823 () Bool)

(assert (=> start!119032 m!1274823))

(declare-fun m!1274825 () Bool)

(assert (=> start!119032 m!1274825))

(assert (=> b!1389136 m!1274813))

(assert (=> b!1389136 m!1274813))

(declare-fun m!1274827 () Bool)

(assert (=> b!1389136 m!1274827))

(push 1)

(assert (not b!1389140))

(assert (not b!1389141))

(assert (not b!1389136))

(assert (not b!1389138))

(assert (not start!119032))

(assert (not b!1389139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

