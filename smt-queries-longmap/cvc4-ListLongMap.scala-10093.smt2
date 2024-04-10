; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118990 () Bool)

(assert start!118990)

(declare-fun b!1388947 () Bool)

(declare-fun res!929177 () Bool)

(declare-fun e!786805 () Bool)

(assert (=> b!1388947 (=> (not res!929177) (not e!786805))))

(declare-datatypes ((array!94987 0))(
  ( (array!94988 (arr!45862 (Array (_ BitVec 32) (_ BitVec 64))) (size!46412 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94987)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388947 (= res!929177 (validKeyInArray!0 (select (arr!45862 a!2901) j!112)))))

(declare-fun b!1388948 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1388948 (= e!786805 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1388949 () Bool)

(declare-fun res!929182 () Bool)

(assert (=> b!1388949 (=> (not res!929182) (not e!786805))))

(declare-datatypes ((List!32381 0))(
  ( (Nil!32378) (Cons!32377 (h!33592 (_ BitVec 64)) (t!47075 List!32381)) )
))
(declare-fun arrayNoDuplicates!0 (array!94987 (_ BitVec 32) List!32381) Bool)

(assert (=> b!1388949 (= res!929182 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32378))))

(declare-fun b!1388950 () Bool)

(declare-fun res!929178 () Bool)

(assert (=> b!1388950 (=> (not res!929178) (not e!786805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94987 (_ BitVec 32)) Bool)

(assert (=> b!1388950 (= res!929178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388951 () Bool)

(declare-fun res!929180 () Bool)

(assert (=> b!1388951 (=> (not res!929180) (not e!786805))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388951 (= res!929180 (validKeyInArray!0 (select (arr!45862 a!2901) i!1037)))))

(declare-fun b!1388952 () Bool)

(declare-fun res!929181 () Bool)

(assert (=> b!1388952 (=> (not res!929181) (not e!786805))))

(assert (=> b!1388952 (= res!929181 (and (= (size!46412 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46412 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46412 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929179 () Bool)

(assert (=> start!118990 (=> (not res!929179) (not e!786805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118990 (= res!929179 (validMask!0 mask!2840))))

(assert (=> start!118990 e!786805))

(assert (=> start!118990 true))

(declare-fun array_inv!34890 (array!94987) Bool)

(assert (=> start!118990 (array_inv!34890 a!2901)))

(assert (= (and start!118990 res!929179) b!1388952))

(assert (= (and b!1388952 res!929181) b!1388951))

(assert (= (and b!1388951 res!929180) b!1388947))

(assert (= (and b!1388947 res!929177) b!1388950))

(assert (= (and b!1388950 res!929178) b!1388949))

(assert (= (and b!1388949 res!929182) b!1388948))

(declare-fun m!1274663 () Bool)

(assert (=> b!1388950 m!1274663))

(declare-fun m!1274665 () Bool)

(assert (=> b!1388951 m!1274665))

(assert (=> b!1388951 m!1274665))

(declare-fun m!1274667 () Bool)

(assert (=> b!1388951 m!1274667))

(declare-fun m!1274669 () Bool)

(assert (=> b!1388949 m!1274669))

(declare-fun m!1274671 () Bool)

(assert (=> start!118990 m!1274671))

(declare-fun m!1274673 () Bool)

(assert (=> start!118990 m!1274673))

(declare-fun m!1274675 () Bool)

(assert (=> b!1388947 m!1274675))

(assert (=> b!1388947 m!1274675))

(declare-fun m!1274677 () Bool)

(assert (=> b!1388947 m!1274677))

(push 1)

(assert (not b!1388950))

(assert (not b!1388949))

(assert (not b!1388951))

(assert (not start!118990))

(assert (not b!1388947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

