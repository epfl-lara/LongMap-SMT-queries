; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118024 () Bool)

(assert start!118024)

(declare-fun res!923370 () Bool)

(declare-fun e!783779 () Bool)

(assert (=> start!118024 (=> (not res!923370) (not e!783779))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118024 (= res!923370 (validMask!0 mask!3034))))

(assert (=> start!118024 e!783779))

(assert (=> start!118024 true))

(declare-datatypes ((array!94360 0))(
  ( (array!94361 (arr!45562 (Array (_ BitVec 32) (_ BitVec 64))) (size!46113 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94360)

(declare-fun array_inv!34843 (array!94360) Bool)

(assert (=> start!118024 (array_inv!34843 a!2971)))

(declare-fun b!1382529 () Bool)

(declare-fun res!923368 () Bool)

(assert (=> b!1382529 (=> (not res!923368) (not e!783779))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382529 (= res!923368 (and (= (size!46113 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46113 a!2971))))))

(declare-fun b!1382530 () Bool)

(declare-fun res!923369 () Bool)

(assert (=> b!1382530 (=> (not res!923369) (not e!783779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382530 (= res!923369 (validKeyInArray!0 (select (arr!45562 a!2971) i!1094)))))

(declare-fun b!1382531 () Bool)

(assert (=> b!1382531 (= e!783779 (bvsgt #b00000000000000000000000000000000 (size!46113 a!2971)))))

(assert (= (and start!118024 res!923370) b!1382529))

(assert (= (and b!1382529 res!923368) b!1382530))

(assert (= (and b!1382530 res!923369) b!1382531))

(declare-fun m!1268065 () Bool)

(assert (=> start!118024 m!1268065))

(declare-fun m!1268067 () Bool)

(assert (=> start!118024 m!1268067))

(declare-fun m!1268069 () Bool)

(assert (=> b!1382530 m!1268069))

(assert (=> b!1382530 m!1268069))

(declare-fun m!1268071 () Bool)

(assert (=> b!1382530 m!1268071))

(check-sat (not start!118024) (not b!1382530))
(check-sat)
