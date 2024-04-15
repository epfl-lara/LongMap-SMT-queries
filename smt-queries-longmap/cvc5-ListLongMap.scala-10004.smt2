; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118062 () Bool)

(assert start!118062)

(declare-fun b!1382382 () Bool)

(declare-fun e!783546 () Bool)

(assert (=> b!1382382 (= e!783546 false)))

(declare-fun lt!608246 () Bool)

(declare-datatypes ((array!94378 0))(
  ( (array!94379 (arr!45570 (Array (_ BitVec 32) (_ BitVec 64))) (size!46122 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94378)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94378 (_ BitVec 32)) Bool)

(assert (=> b!1382382 (= lt!608246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382379 () Bool)

(declare-fun res!924017 () Bool)

(assert (=> b!1382379 (=> (not res!924017) (not e!783546))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382379 (= res!924017 (and (= (size!46122 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46122 a!2971))))))

(declare-fun res!924015 () Bool)

(assert (=> start!118062 (=> (not res!924015) (not e!783546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118062 (= res!924015 (validMask!0 mask!3034))))

(assert (=> start!118062 e!783546))

(assert (=> start!118062 true))

(declare-fun array_inv!34803 (array!94378) Bool)

(assert (=> start!118062 (array_inv!34803 a!2971)))

(declare-fun b!1382380 () Bool)

(declare-fun res!924016 () Bool)

(assert (=> b!1382380 (=> (not res!924016) (not e!783546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382380 (= res!924016 (validKeyInArray!0 (select (arr!45570 a!2971) i!1094)))))

(declare-fun b!1382381 () Bool)

(declare-fun res!924014 () Bool)

(assert (=> b!1382381 (=> (not res!924014) (not e!783546))))

(declare-datatypes ((List!32182 0))(
  ( (Nil!32179) (Cons!32178 (h!33387 (_ BitVec 64)) (t!46868 List!32182)) )
))
(declare-fun arrayNoDuplicates!0 (array!94378 (_ BitVec 32) List!32182) Bool)

(assert (=> b!1382381 (= res!924014 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32179))))

(assert (= (and start!118062 res!924015) b!1382379))

(assert (= (and b!1382379 res!924017) b!1382380))

(assert (= (and b!1382380 res!924016) b!1382381))

(assert (= (and b!1382381 res!924014) b!1382382))

(declare-fun m!1267083 () Bool)

(assert (=> b!1382382 m!1267083))

(declare-fun m!1267085 () Bool)

(assert (=> start!118062 m!1267085))

(declare-fun m!1267087 () Bool)

(assert (=> start!118062 m!1267087))

(declare-fun m!1267089 () Bool)

(assert (=> b!1382380 m!1267089))

(assert (=> b!1382380 m!1267089))

(declare-fun m!1267091 () Bool)

(assert (=> b!1382380 m!1267091))

(declare-fun m!1267093 () Bool)

(assert (=> b!1382381 m!1267093))

(push 1)

(assert (not b!1382382))

(assert (not b!1382380))

(assert (not start!118062))

(assert (not b!1382381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

