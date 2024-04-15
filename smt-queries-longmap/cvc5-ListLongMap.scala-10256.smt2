; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120588 () Bool)

(assert start!120588)

(declare-fun b!1404034 () Bool)

(declare-fun e!794893 () Bool)

(assert (=> b!1404034 (= e!794893 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95950 0))(
  ( (array!95951 (arr!46326 (Array (_ BitVec 32) (_ BitVec 64))) (size!46878 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95950)

(declare-fun lt!618401 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404034 (= lt!618401 (toIndex!0 (select (arr!46326 a!2901) j!112) mask!2840))))

(declare-fun b!1404035 () Bool)

(declare-fun res!942600 () Bool)

(assert (=> b!1404035 (=> (not res!942600) (not e!794893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404035 (= res!942600 (validKeyInArray!0 (select (arr!46326 a!2901) j!112)))))

(declare-fun b!1404036 () Bool)

(declare-fun res!942599 () Bool)

(assert (=> b!1404036 (=> (not res!942599) (not e!794893))))

(declare-datatypes ((List!32923 0))(
  ( (Nil!32920) (Cons!32919 (h!34167 (_ BitVec 64)) (t!47609 List!32923)) )
))
(declare-fun arrayNoDuplicates!0 (array!95950 (_ BitVec 32) List!32923) Bool)

(assert (=> b!1404036 (= res!942599 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32920))))

(declare-fun b!1404037 () Bool)

(declare-fun res!942601 () Bool)

(assert (=> b!1404037 (=> (not res!942601) (not e!794893))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404037 (= res!942601 (validKeyInArray!0 (select (arr!46326 a!2901) i!1037)))))

(declare-fun b!1404038 () Bool)

(declare-fun res!942596 () Bool)

(assert (=> b!1404038 (=> (not res!942596) (not e!794893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95950 (_ BitVec 32)) Bool)

(assert (=> b!1404038 (= res!942596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404039 () Bool)

(declare-fun res!942598 () Bool)

(assert (=> b!1404039 (=> (not res!942598) (not e!794893))))

(assert (=> b!1404039 (= res!942598 (and (= (size!46878 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46878 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46878 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942597 () Bool)

(assert (=> start!120588 (=> (not res!942597) (not e!794893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120588 (= res!942597 (validMask!0 mask!2840))))

(assert (=> start!120588 e!794893))

(assert (=> start!120588 true))

(declare-fun array_inv!35559 (array!95950) Bool)

(assert (=> start!120588 (array_inv!35559 a!2901)))

(assert (= (and start!120588 res!942597) b!1404039))

(assert (= (and b!1404039 res!942598) b!1404037))

(assert (= (and b!1404037 res!942601) b!1404035))

(assert (= (and b!1404035 res!942600) b!1404038))

(assert (= (and b!1404038 res!942596) b!1404036))

(assert (= (and b!1404036 res!942599) b!1404034))

(declare-fun m!1292383 () Bool)

(assert (=> start!120588 m!1292383))

(declare-fun m!1292385 () Bool)

(assert (=> start!120588 m!1292385))

(declare-fun m!1292387 () Bool)

(assert (=> b!1404036 m!1292387))

(declare-fun m!1292389 () Bool)

(assert (=> b!1404034 m!1292389))

(assert (=> b!1404034 m!1292389))

(declare-fun m!1292391 () Bool)

(assert (=> b!1404034 m!1292391))

(declare-fun m!1292393 () Bool)

(assert (=> b!1404037 m!1292393))

(assert (=> b!1404037 m!1292393))

(declare-fun m!1292395 () Bool)

(assert (=> b!1404037 m!1292395))

(declare-fun m!1292397 () Bool)

(assert (=> b!1404038 m!1292397))

(assert (=> b!1404035 m!1292389))

(assert (=> b!1404035 m!1292389))

(declare-fun m!1292399 () Bool)

(assert (=> b!1404035 m!1292399))

(push 1)

(assert (not b!1404035))

(assert (not b!1404038))

(assert (not start!120588))

(assert (not b!1404037))

(assert (not b!1404034))

(assert (not b!1404036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

