; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103932 () Bool)

(assert start!103932)

(declare-fun b!1244076 () Bool)

(declare-fun e!705129 () Bool)

(declare-fun e!705127 () Bool)

(assert (=> b!1244076 (= e!705129 e!705127)))

(declare-fun res!829838 () Bool)

(assert (=> b!1244076 (=> (not res!829838) (not e!705127))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244076 (= res!829838 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41321 0))(
  ( (Unit!41322) )
))
(declare-fun lt!562574 () Unit!41321)

(declare-fun e!705126 () Unit!41321)

(assert (=> b!1244076 (= lt!562574 e!705126)))

(declare-fun c!121804 () Bool)

(declare-datatypes ((array!80024 0))(
  ( (array!80025 (arr!38605 (Array (_ BitVec 32) (_ BitVec 64))) (size!39141 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80024)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244076 (= c!121804 (validKeyInArray!0 (select (arr!38605 a!3892) from!3270)))))

(declare-fun res!829839 () Bool)

(assert (=> start!103932 (=> (not res!829839) (not e!705129))))

(assert (=> start!103932 (= res!829839 (and (bvslt (size!39141 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39141 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39141 a!3892))))))

(assert (=> start!103932 e!705129))

(declare-fun array_inv!29453 (array!80024) Bool)

(assert (=> start!103932 (array_inv!29453 a!3892)))

(assert (=> start!103932 true))

(declare-fun b!1244077 () Bool)

(assert (=> b!1244077 (= e!705127 false)))

(declare-fun lt!562572 () Bool)

(declare-datatypes ((List!27408 0))(
  ( (Nil!27405) (Cons!27404 (h!28613 (_ BitVec 64)) (t!40877 List!27408)) )
))
(declare-fun arrayNoDuplicates!0 (array!80024 (_ BitVec 32) List!27408) Bool)

(assert (=> b!1244077 (= lt!562572 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27405))))

(declare-fun b!1244078 () Bool)

(declare-fun res!829837 () Bool)

(assert (=> b!1244078 (=> (not res!829837) (not e!705129))))

(assert (=> b!1244078 (= res!829837 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27405))))

(declare-fun b!1244079 () Bool)

(declare-fun Unit!41323 () Unit!41321)

(assert (=> b!1244079 (= e!705126 Unit!41323)))

(declare-fun b!1244080 () Bool)

(declare-fun lt!562573 () Unit!41321)

(assert (=> b!1244080 (= e!705126 lt!562573)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80024 List!27408 List!27408 (_ BitVec 32)) Unit!41321)

(assert (=> b!1244080 (= lt!562573 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27404 (select (arr!38605 a!3892) from!3270) Nil!27405) Nil!27405 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244080 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27405)))

(declare-fun b!1244081 () Bool)

(declare-fun res!829840 () Bool)

(assert (=> b!1244081 (=> (not res!829840) (not e!705129))))

(assert (=> b!1244081 (= res!829840 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39141 a!3892)) (not (= newFrom!287 (size!39141 a!3892)))))))

(assert (= (and start!103932 res!829839) b!1244078))

(assert (= (and b!1244078 res!829837) b!1244081))

(assert (= (and b!1244081 res!829840) b!1244076))

(assert (= (and b!1244076 c!121804) b!1244080))

(assert (= (and b!1244076 (not c!121804)) b!1244079))

(assert (= (and b!1244076 res!829838) b!1244077))

(declare-fun m!1146467 () Bool)

(assert (=> b!1244077 m!1146467))

(declare-fun m!1146469 () Bool)

(assert (=> b!1244076 m!1146469))

(assert (=> b!1244076 m!1146469))

(declare-fun m!1146471 () Bool)

(assert (=> b!1244076 m!1146471))

(declare-fun m!1146473 () Bool)

(assert (=> start!103932 m!1146473))

(declare-fun m!1146475 () Bool)

(assert (=> b!1244078 m!1146475))

(assert (=> b!1244080 m!1146469))

(declare-fun m!1146477 () Bool)

(assert (=> b!1244080 m!1146477))

(assert (=> b!1244080 m!1146467))

(push 1)

(assert (not b!1244078))

(assert (not b!1244076))

(assert (not b!1244077))

