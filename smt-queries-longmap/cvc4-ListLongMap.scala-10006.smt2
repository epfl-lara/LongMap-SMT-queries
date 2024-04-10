; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118076 () Bool)

(assert start!118076)

(declare-fun b!1382530 () Bool)

(declare-fun res!924122 () Bool)

(declare-fun e!783614 () Bool)

(assert (=> b!1382530 (=> (not res!924122) (not e!783614))))

(declare-datatypes ((array!94440 0))(
  ( (array!94441 (arr!45601 (Array (_ BitVec 32) (_ BitVec 64))) (size!46151 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94440)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382530 (= res!924122 (validKeyInArray!0 (select (arr!45601 a!2971) i!1094)))))

(declare-fun b!1382532 () Bool)

(assert (=> b!1382532 (= e!783614 false)))

(declare-fun lt!608439 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94440 (_ BitVec 32)) Bool)

(assert (=> b!1382532 (= lt!608439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382529 () Bool)

(declare-fun res!924121 () Bool)

(assert (=> b!1382529 (=> (not res!924121) (not e!783614))))

(assert (=> b!1382529 (= res!924121 (and (= (size!46151 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46151 a!2971))))))

(declare-fun res!924123 () Bool)

(assert (=> start!118076 (=> (not res!924123) (not e!783614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118076 (= res!924123 (validMask!0 mask!3034))))

(assert (=> start!118076 e!783614))

(assert (=> start!118076 true))

(declare-fun array_inv!34629 (array!94440) Bool)

(assert (=> start!118076 (array_inv!34629 a!2971)))

(declare-fun b!1382531 () Bool)

(declare-fun res!924124 () Bool)

(assert (=> b!1382531 (=> (not res!924124) (not e!783614))))

(declare-datatypes ((List!32135 0))(
  ( (Nil!32132) (Cons!32131 (h!33340 (_ BitVec 64)) (t!46829 List!32135)) )
))
(declare-fun arrayNoDuplicates!0 (array!94440 (_ BitVec 32) List!32135) Bool)

(assert (=> b!1382531 (= res!924124 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32132))))

(assert (= (and start!118076 res!924123) b!1382529))

(assert (= (and b!1382529 res!924121) b!1382530))

(assert (= (and b!1382530 res!924122) b!1382531))

(assert (= (and b!1382531 res!924124) b!1382532))

(declare-fun m!1267659 () Bool)

(assert (=> b!1382530 m!1267659))

(assert (=> b!1382530 m!1267659))

(declare-fun m!1267661 () Bool)

(assert (=> b!1382530 m!1267661))

(declare-fun m!1267663 () Bool)

(assert (=> b!1382532 m!1267663))

(declare-fun m!1267665 () Bool)

(assert (=> start!118076 m!1267665))

(declare-fun m!1267667 () Bool)

(assert (=> start!118076 m!1267667))

(declare-fun m!1267669 () Bool)

(assert (=> b!1382531 m!1267669))

(push 1)

(assert (not b!1382532))

(assert (not start!118076))

(assert (not b!1382531))

(assert (not b!1382530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

