; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118080 () Bool)

(assert start!118080)

(declare-fun b!1382498 () Bool)

(declare-fun res!924132 () Bool)

(declare-fun e!783600 () Bool)

(assert (=> b!1382498 (=> (not res!924132) (not e!783600))))

(declare-datatypes ((array!94396 0))(
  ( (array!94397 (arr!45579 (Array (_ BitVec 32) (_ BitVec 64))) (size!46131 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94396)

(declare-datatypes ((List!32191 0))(
  ( (Nil!32188) (Cons!32187 (h!33396 (_ BitVec 64)) (t!46877 List!32191)) )
))
(declare-fun arrayNoDuplicates!0 (array!94396 (_ BitVec 32) List!32191) Bool)

(assert (=> b!1382498 (= res!924132 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32188))))

(declare-fun res!924134 () Bool)

(assert (=> start!118080 (=> (not res!924134) (not e!783600))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118080 (= res!924134 (validMask!0 mask!3034))))

(assert (=> start!118080 e!783600))

(assert (=> start!118080 true))

(declare-fun array_inv!34812 (array!94396) Bool)

(assert (=> start!118080 (array_inv!34812 a!2971)))

(declare-fun b!1382497 () Bool)

(declare-fun res!924131 () Bool)

(assert (=> b!1382497 (=> (not res!924131) (not e!783600))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382497 (= res!924131 (validKeyInArray!0 (select (arr!45579 a!2971) i!1094)))))

(declare-fun b!1382496 () Bool)

(declare-fun res!924133 () Bool)

(assert (=> b!1382496 (=> (not res!924133) (not e!783600))))

(assert (=> b!1382496 (= res!924133 (and (= (size!46131 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46131 a!2971))))))

(declare-fun b!1382499 () Bool)

(assert (=> b!1382499 (= e!783600 false)))

(declare-fun lt!608264 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94396 (_ BitVec 32)) Bool)

(assert (=> b!1382499 (= lt!608264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118080 res!924134) b!1382496))

(assert (= (and b!1382496 res!924133) b!1382497))

(assert (= (and b!1382497 res!924131) b!1382498))

(assert (= (and b!1382498 res!924132) b!1382499))

(declare-fun m!1267191 () Bool)

(assert (=> b!1382498 m!1267191))

(declare-fun m!1267193 () Bool)

(assert (=> start!118080 m!1267193))

(declare-fun m!1267195 () Bool)

(assert (=> start!118080 m!1267195))

(declare-fun m!1267197 () Bool)

(assert (=> b!1382497 m!1267197))

(assert (=> b!1382497 m!1267197))

(declare-fun m!1267199 () Bool)

(assert (=> b!1382497 m!1267199))

(declare-fun m!1267201 () Bool)

(assert (=> b!1382499 m!1267201))

(push 1)

(assert (not b!1382499))

(assert (not start!118080))

(assert (not b!1382498))

(assert (not b!1382497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

