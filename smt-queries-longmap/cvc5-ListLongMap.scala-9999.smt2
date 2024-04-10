; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118030 () Bool)

(assert start!118030)

(declare-fun b!1382245 () Bool)

(declare-fun res!923839 () Bool)

(declare-fun e!783475 () Bool)

(assert (=> b!1382245 (=> (not res!923839) (not e!783475))))

(declare-datatypes ((array!94394 0))(
  ( (array!94395 (arr!45578 (Array (_ BitVec 32) (_ BitVec 64))) (size!46128 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94394)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382245 (= res!923839 (validKeyInArray!0 (select (arr!45578 a!2971) i!1094)))))

(declare-fun b!1382247 () Bool)

(assert (=> b!1382247 (= e!783475 false)))

(declare-fun lt!608379 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94394 (_ BitVec 32)) Bool)

(assert (=> b!1382247 (= lt!608379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923837 () Bool)

(assert (=> start!118030 (=> (not res!923837) (not e!783475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118030 (= res!923837 (validMask!0 mask!3034))))

(assert (=> start!118030 e!783475))

(assert (=> start!118030 true))

(declare-fun array_inv!34606 (array!94394) Bool)

(assert (=> start!118030 (array_inv!34606 a!2971)))

(declare-fun b!1382244 () Bool)

(declare-fun res!923838 () Bool)

(assert (=> b!1382244 (=> (not res!923838) (not e!783475))))

(assert (=> b!1382244 (= res!923838 (and (= (size!46128 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46128 a!2971))))))

(declare-fun b!1382246 () Bool)

(declare-fun res!923836 () Bool)

(assert (=> b!1382246 (=> (not res!923836) (not e!783475))))

(declare-datatypes ((List!32112 0))(
  ( (Nil!32109) (Cons!32108 (h!33317 (_ BitVec 64)) (t!46806 List!32112)) )
))
(declare-fun arrayNoDuplicates!0 (array!94394 (_ BitVec 32) List!32112) Bool)

(assert (=> b!1382246 (= res!923836 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32109))))

(assert (= (and start!118030 res!923837) b!1382244))

(assert (= (and b!1382244 res!923838) b!1382245))

(assert (= (and b!1382245 res!923839) b!1382246))

(assert (= (and b!1382246 res!923836) b!1382247))

(declare-fun m!1267383 () Bool)

(assert (=> b!1382245 m!1267383))

(assert (=> b!1382245 m!1267383))

(declare-fun m!1267385 () Bool)

(assert (=> b!1382245 m!1267385))

(declare-fun m!1267387 () Bool)

(assert (=> b!1382247 m!1267387))

(declare-fun m!1267389 () Bool)

(assert (=> start!118030 m!1267389))

(declare-fun m!1267391 () Bool)

(assert (=> start!118030 m!1267391))

(declare-fun m!1267393 () Bool)

(assert (=> b!1382246 m!1267393))

(push 1)

(assert (not b!1382245))

(assert (not b!1382246))

(assert (not start!118030))

(assert (not b!1382247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

