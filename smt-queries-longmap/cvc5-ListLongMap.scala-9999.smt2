; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118032 () Bool)

(assert start!118032)

(declare-fun b!1382201 () Bool)

(declare-fun res!923836 () Bool)

(declare-fun e!783456 () Bool)

(assert (=> b!1382201 (=> (not res!923836) (not e!783456))))

(declare-datatypes ((array!94348 0))(
  ( (array!94349 (arr!45555 (Array (_ BitVec 32) (_ BitVec 64))) (size!46107 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94348)

(declare-datatypes ((List!32167 0))(
  ( (Nil!32164) (Cons!32163 (h!33372 (_ BitVec 64)) (t!46853 List!32167)) )
))
(declare-fun arrayNoDuplicates!0 (array!94348 (_ BitVec 32) List!32167) Bool)

(assert (=> b!1382201 (= res!923836 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32164))))

(declare-fun b!1382200 () Bool)

(declare-fun res!923837 () Bool)

(assert (=> b!1382200 (=> (not res!923837) (not e!783456))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382200 (= res!923837 (validKeyInArray!0 (select (arr!45555 a!2971) i!1094)))))

(declare-fun b!1382202 () Bool)

(assert (=> b!1382202 (= e!783456 false)))

(declare-fun lt!608201 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94348 (_ BitVec 32)) Bool)

(assert (=> b!1382202 (= lt!608201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923835 () Bool)

(assert (=> start!118032 (=> (not res!923835) (not e!783456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118032 (= res!923835 (validMask!0 mask!3034))))

(assert (=> start!118032 e!783456))

(assert (=> start!118032 true))

(declare-fun array_inv!34788 (array!94348) Bool)

(assert (=> start!118032 (array_inv!34788 a!2971)))

(declare-fun b!1382199 () Bool)

(declare-fun res!923834 () Bool)

(assert (=> b!1382199 (=> (not res!923834) (not e!783456))))

(assert (=> b!1382199 (= res!923834 (and (= (size!46107 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46107 a!2971))))))

(assert (= (and start!118032 res!923835) b!1382199))

(assert (= (and b!1382199 res!923834) b!1382200))

(assert (= (and b!1382200 res!923837) b!1382201))

(assert (= (and b!1382201 res!923836) b!1382202))

(declare-fun m!1266903 () Bool)

(assert (=> b!1382201 m!1266903))

(declare-fun m!1266905 () Bool)

(assert (=> b!1382200 m!1266905))

(assert (=> b!1382200 m!1266905))

(declare-fun m!1266907 () Bool)

(assert (=> b!1382200 m!1266907))

(declare-fun m!1266909 () Bool)

(assert (=> b!1382202 m!1266909))

(declare-fun m!1266911 () Bool)

(assert (=> start!118032 m!1266911))

(declare-fun m!1266913 () Bool)

(assert (=> start!118032 m!1266913))

(push 1)

(assert (not b!1382200))

(assert (not start!118032))

(assert (not b!1382201))

(assert (not b!1382202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

