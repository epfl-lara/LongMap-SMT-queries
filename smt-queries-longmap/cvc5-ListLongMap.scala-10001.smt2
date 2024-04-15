; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118044 () Bool)

(assert start!118044)

(declare-fun b!1382273 () Bool)

(declare-fun res!923907 () Bool)

(declare-fun e!783492 () Bool)

(assert (=> b!1382273 (=> (not res!923907) (not e!783492))))

(declare-datatypes ((array!94360 0))(
  ( (array!94361 (arr!45561 (Array (_ BitVec 32) (_ BitVec 64))) (size!46113 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94360)

(declare-datatypes ((List!32173 0))(
  ( (Nil!32170) (Cons!32169 (h!33378 (_ BitVec 64)) (t!46859 List!32173)) )
))
(declare-fun arrayNoDuplicates!0 (array!94360 (_ BitVec 32) List!32173) Bool)

(assert (=> b!1382273 (= res!923907 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32170))))

(declare-fun res!923908 () Bool)

(assert (=> start!118044 (=> (not res!923908) (not e!783492))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118044 (= res!923908 (validMask!0 mask!3034))))

(assert (=> start!118044 e!783492))

(assert (=> start!118044 true))

(declare-fun array_inv!34794 (array!94360) Bool)

(assert (=> start!118044 (array_inv!34794 a!2971)))

(declare-fun b!1382272 () Bool)

(declare-fun res!923909 () Bool)

(assert (=> b!1382272 (=> (not res!923909) (not e!783492))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382272 (= res!923909 (validKeyInArray!0 (select (arr!45561 a!2971) i!1094)))))

(declare-fun b!1382274 () Bool)

(assert (=> b!1382274 (= e!783492 false)))

(declare-fun lt!608219 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94360 (_ BitVec 32)) Bool)

(assert (=> b!1382274 (= lt!608219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382271 () Bool)

(declare-fun res!923906 () Bool)

(assert (=> b!1382271 (=> (not res!923906) (not e!783492))))

(assert (=> b!1382271 (= res!923906 (and (= (size!46113 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46113 a!2971))))))

(assert (= (and start!118044 res!923908) b!1382271))

(assert (= (and b!1382271 res!923906) b!1382272))

(assert (= (and b!1382272 res!923909) b!1382273))

(assert (= (and b!1382273 res!923907) b!1382274))

(declare-fun m!1266975 () Bool)

(assert (=> b!1382273 m!1266975))

(declare-fun m!1266977 () Bool)

(assert (=> start!118044 m!1266977))

(declare-fun m!1266979 () Bool)

(assert (=> start!118044 m!1266979))

(declare-fun m!1266981 () Bool)

(assert (=> b!1382272 m!1266981))

(assert (=> b!1382272 m!1266981))

(declare-fun m!1266983 () Bool)

(assert (=> b!1382272 m!1266983))

(declare-fun m!1266985 () Bool)

(assert (=> b!1382274 m!1266985))

(push 1)

(assert (not b!1382272))

(assert (not start!118044))

(assert (not b!1382273))

(assert (not b!1382274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

