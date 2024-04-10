; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118080 () Bool)

(assert start!118080)

(declare-fun b!1382556 () Bool)

(declare-fun e!783626 () Bool)

(assert (=> b!1382556 (= e!783626 false)))

(declare-fun lt!608445 () Bool)

(declare-datatypes ((array!94444 0))(
  ( (array!94445 (arr!45603 (Array (_ BitVec 32) (_ BitVec 64))) (size!46153 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94444)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94444 (_ BitVec 32)) Bool)

(assert (=> b!1382556 (= lt!608445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382553 () Bool)

(declare-fun res!924148 () Bool)

(assert (=> b!1382553 (=> (not res!924148) (not e!783626))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382553 (= res!924148 (and (= (size!46153 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46153 a!2971))))))

(declare-fun b!1382555 () Bool)

(declare-fun res!924147 () Bool)

(assert (=> b!1382555 (=> (not res!924147) (not e!783626))))

(declare-datatypes ((List!32137 0))(
  ( (Nil!32134) (Cons!32133 (h!33342 (_ BitVec 64)) (t!46831 List!32137)) )
))
(declare-fun arrayNoDuplicates!0 (array!94444 (_ BitVec 32) List!32137) Bool)

(assert (=> b!1382555 (= res!924147 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32134))))

(declare-fun res!924145 () Bool)

(assert (=> start!118080 (=> (not res!924145) (not e!783626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118080 (= res!924145 (validMask!0 mask!3034))))

(assert (=> start!118080 e!783626))

(assert (=> start!118080 true))

(declare-fun array_inv!34631 (array!94444) Bool)

(assert (=> start!118080 (array_inv!34631 a!2971)))

(declare-fun b!1382554 () Bool)

(declare-fun res!924146 () Bool)

(assert (=> b!1382554 (=> (not res!924146) (not e!783626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382554 (= res!924146 (validKeyInArray!0 (select (arr!45603 a!2971) i!1094)))))

(assert (= (and start!118080 res!924145) b!1382553))

(assert (= (and b!1382553 res!924148) b!1382554))

(assert (= (and b!1382554 res!924146) b!1382555))

(assert (= (and b!1382555 res!924147) b!1382556))

(declare-fun m!1267683 () Bool)

(assert (=> b!1382556 m!1267683))

(declare-fun m!1267685 () Bool)

(assert (=> b!1382555 m!1267685))

(declare-fun m!1267687 () Bool)

(assert (=> start!118080 m!1267687))

(declare-fun m!1267689 () Bool)

(assert (=> start!118080 m!1267689))

(declare-fun m!1267691 () Bool)

(assert (=> b!1382554 m!1267691))

(assert (=> b!1382554 m!1267691))

(declare-fun m!1267693 () Bool)

(assert (=> b!1382554 m!1267693))

(check-sat (not b!1382556) (not start!118080) (not b!1382555) (not b!1382554))
