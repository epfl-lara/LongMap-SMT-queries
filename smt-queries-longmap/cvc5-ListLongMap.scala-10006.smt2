; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118074 () Bool)

(assert start!118074)

(declare-fun res!924096 () Bool)

(declare-fun e!783583 () Bool)

(assert (=> start!118074 (=> (not res!924096) (not e!783583))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118074 (= res!924096 (validMask!0 mask!3034))))

(assert (=> start!118074 e!783583))

(assert (=> start!118074 true))

(declare-datatypes ((array!94390 0))(
  ( (array!94391 (arr!45576 (Array (_ BitVec 32) (_ BitVec 64))) (size!46128 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94390)

(declare-fun array_inv!34809 (array!94390) Bool)

(assert (=> start!118074 (array_inv!34809 a!2971)))

(declare-fun b!1382460 () Bool)

(declare-fun res!924095 () Bool)

(assert (=> b!1382460 (=> (not res!924095) (not e!783583))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382460 (= res!924095 (and (= (size!46128 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46128 a!2971))))))

(declare-fun b!1382461 () Bool)

(declare-fun res!924097 () Bool)

(assert (=> b!1382461 (=> (not res!924097) (not e!783583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382461 (= res!924097 (validKeyInArray!0 (select (arr!45576 a!2971) i!1094)))))

(declare-fun b!1382463 () Bool)

(assert (=> b!1382463 (= e!783583 false)))

(declare-fun lt!608255 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94390 (_ BitVec 32)) Bool)

(assert (=> b!1382463 (= lt!608255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382462 () Bool)

(declare-fun res!924098 () Bool)

(assert (=> b!1382462 (=> (not res!924098) (not e!783583))))

(declare-datatypes ((List!32188 0))(
  ( (Nil!32185) (Cons!32184 (h!33393 (_ BitVec 64)) (t!46874 List!32188)) )
))
(declare-fun arrayNoDuplicates!0 (array!94390 (_ BitVec 32) List!32188) Bool)

(assert (=> b!1382462 (= res!924098 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32185))))

(assert (= (and start!118074 res!924096) b!1382460))

(assert (= (and b!1382460 res!924095) b!1382461))

(assert (= (and b!1382461 res!924097) b!1382462))

(assert (= (and b!1382462 res!924098) b!1382463))

(declare-fun m!1267155 () Bool)

(assert (=> start!118074 m!1267155))

(declare-fun m!1267157 () Bool)

(assert (=> start!118074 m!1267157))

(declare-fun m!1267159 () Bool)

(assert (=> b!1382461 m!1267159))

(assert (=> b!1382461 m!1267159))

(declare-fun m!1267161 () Bool)

(assert (=> b!1382461 m!1267161))

(declare-fun m!1267163 () Bool)

(assert (=> b!1382463 m!1267163))

(declare-fun m!1267165 () Bool)

(assert (=> b!1382462 m!1267165))

(push 1)

(assert (not b!1382463))

(assert (not start!118074))

(assert (not b!1382462))

(assert (not b!1382461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

