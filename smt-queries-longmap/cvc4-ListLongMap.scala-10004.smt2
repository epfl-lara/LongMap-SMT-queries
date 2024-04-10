; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118064 () Bool)

(assert start!118064)

(declare-fun b!1382451 () Bool)

(declare-fun e!783578 () Bool)

(assert (=> b!1382451 (= e!783578 false)))

(declare-fun lt!608430 () Bool)

(declare-datatypes ((array!94428 0))(
  ( (array!94429 (arr!45595 (Array (_ BitVec 32) (_ BitVec 64))) (size!46145 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94428)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94428 (_ BitVec 32)) Bool)

(assert (=> b!1382451 (= lt!608430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382450 () Bool)

(declare-fun res!924043 () Bool)

(assert (=> b!1382450 (=> (not res!924043) (not e!783578))))

(declare-datatypes ((List!32129 0))(
  ( (Nil!32126) (Cons!32125 (h!33334 (_ BitVec 64)) (t!46823 List!32129)) )
))
(declare-fun arrayNoDuplicates!0 (array!94428 (_ BitVec 32) List!32129) Bool)

(assert (=> b!1382450 (= res!924043 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32126))))

(declare-fun res!924040 () Bool)

(assert (=> start!118064 (=> (not res!924040) (not e!783578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118064 (= res!924040 (validMask!0 mask!3034))))

(assert (=> start!118064 e!783578))

(assert (=> start!118064 true))

(declare-fun array_inv!34623 (array!94428) Bool)

(assert (=> start!118064 (array_inv!34623 a!2971)))

(declare-fun b!1382448 () Bool)

(declare-fun res!924041 () Bool)

(assert (=> b!1382448 (=> (not res!924041) (not e!783578))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382448 (= res!924041 (and (= (size!46145 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46145 a!2971))))))

(declare-fun b!1382449 () Bool)

(declare-fun res!924042 () Bool)

(assert (=> b!1382449 (=> (not res!924042) (not e!783578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382449 (= res!924042 (validKeyInArray!0 (select (arr!45595 a!2971) i!1094)))))

(assert (= (and start!118064 res!924040) b!1382448))

(assert (= (and b!1382448 res!924041) b!1382449))

(assert (= (and b!1382449 res!924042) b!1382450))

(assert (= (and b!1382450 res!924043) b!1382451))

(declare-fun m!1267587 () Bool)

(assert (=> b!1382451 m!1267587))

(declare-fun m!1267589 () Bool)

(assert (=> b!1382450 m!1267589))

(declare-fun m!1267591 () Bool)

(assert (=> start!118064 m!1267591))

(declare-fun m!1267593 () Bool)

(assert (=> start!118064 m!1267593))

(declare-fun m!1267595 () Bool)

(assert (=> b!1382449 m!1267595))

(assert (=> b!1382449 m!1267595))

(declare-fun m!1267597 () Bool)

(assert (=> b!1382449 m!1267597))

(push 1)

(assert (not b!1382451))

(assert (not start!118064))

(assert (not b!1382450))

(assert (not b!1382449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

