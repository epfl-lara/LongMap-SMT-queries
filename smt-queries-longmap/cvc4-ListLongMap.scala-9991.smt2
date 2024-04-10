; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117956 () Bool)

(assert start!117956)

(declare-fun res!923447 () Bool)

(declare-fun e!783280 () Bool)

(assert (=> start!117956 (=> (not res!923447) (not e!783280))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117956 (= res!923447 (validMask!0 mask!3034))))

(assert (=> start!117956 e!783280))

(assert (=> start!117956 true))

(declare-datatypes ((array!94347 0))(
  ( (array!94348 (arr!45556 (Array (_ BitVec 32) (_ BitVec 64))) (size!46106 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94347)

(declare-fun array_inv!34584 (array!94347) Bool)

(assert (=> start!117956 (array_inv!34584 a!2971)))

(declare-fun b!1381819 () Bool)

(declare-fun res!923448 () Bool)

(assert (=> b!1381819 (=> (not res!923448) (not e!783280))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381819 (= res!923448 (validKeyInArray!0 (select (arr!45556 a!2971) i!1094)))))

(declare-fun b!1381818 () Bool)

(declare-fun res!923446 () Bool)

(assert (=> b!1381818 (=> (not res!923446) (not e!783280))))

(assert (=> b!1381818 (= res!923446 (and (= (size!46106 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46106 a!2971))))))

(declare-fun b!1381820 () Bool)

(declare-fun res!923449 () Bool)

(assert (=> b!1381820 (=> (not res!923449) (not e!783280))))

(declare-datatypes ((List!32090 0))(
  ( (Nil!32087) (Cons!32086 (h!33295 (_ BitVec 64)) (t!46784 List!32090)) )
))
(declare-fun arrayNoDuplicates!0 (array!94347 (_ BitVec 32) List!32090) Bool)

(assert (=> b!1381820 (= res!923449 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32087))))

(declare-fun b!1381821 () Bool)

(assert (=> b!1381821 (= e!783280 false)))

(declare-fun lt!608295 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94347 (_ BitVec 32)) Bool)

(assert (=> b!1381821 (= lt!608295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117956 res!923447) b!1381818))

(assert (= (and b!1381818 res!923446) b!1381819))

(assert (= (and b!1381819 res!923448) b!1381820))

(assert (= (and b!1381820 res!923449) b!1381821))

(declare-fun m!1266999 () Bool)

(assert (=> start!117956 m!1266999))

(declare-fun m!1267001 () Bool)

(assert (=> start!117956 m!1267001))

(declare-fun m!1267003 () Bool)

(assert (=> b!1381819 m!1267003))

(assert (=> b!1381819 m!1267003))

(declare-fun m!1267005 () Bool)

(assert (=> b!1381819 m!1267005))

(declare-fun m!1267007 () Bool)

(assert (=> b!1381820 m!1267007))

(declare-fun m!1267009 () Bool)

(assert (=> b!1381821 m!1267009))

(push 1)

(assert (not start!117956))

(assert (not b!1381820))

(assert (not b!1381819))

(assert (not b!1381821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

