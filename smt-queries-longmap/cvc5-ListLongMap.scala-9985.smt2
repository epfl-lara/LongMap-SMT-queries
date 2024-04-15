; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117918 () Bool)

(assert start!117918)

(declare-fun b!1381536 () Bool)

(declare-fun e!783141 () Bool)

(assert (=> b!1381536 (= e!783141 false)))

(declare-fun lt!608057 () Bool)

(declare-datatypes ((array!94261 0))(
  ( (array!94262 (arr!45513 (Array (_ BitVec 32) (_ BitVec 64))) (size!46065 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94261)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94261 (_ BitVec 32)) Bool)

(assert (=> b!1381536 (= lt!608057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381535 () Bool)

(declare-fun res!923206 () Bool)

(assert (=> b!1381535 (=> (not res!923206) (not e!783141))))

(declare-datatypes ((List!32125 0))(
  ( (Nil!32122) (Cons!32121 (h!33330 (_ BitVec 64)) (t!46811 List!32125)) )
))
(declare-fun arrayNoDuplicates!0 (array!94261 (_ BitVec 32) List!32125) Bool)

(assert (=> b!1381535 (= res!923206 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32122))))

(declare-fun b!1381533 () Bool)

(declare-fun res!923204 () Bool)

(assert (=> b!1381533 (=> (not res!923204) (not e!783141))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381533 (= res!923204 (and (= (size!46065 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46065 a!2971))))))

(declare-fun res!923205 () Bool)

(assert (=> start!117918 (=> (not res!923205) (not e!783141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117918 (= res!923205 (validMask!0 mask!3034))))

(assert (=> start!117918 e!783141))

(assert (=> start!117918 true))

(declare-fun array_inv!34746 (array!94261) Bool)

(assert (=> start!117918 (array_inv!34746 a!2971)))

(declare-fun b!1381534 () Bool)

(declare-fun res!923207 () Bool)

(assert (=> b!1381534 (=> (not res!923207) (not e!783141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381534 (= res!923207 (validKeyInArray!0 (select (arr!45513 a!2971) i!1094)))))

(assert (= (and start!117918 res!923205) b!1381533))

(assert (= (and b!1381533 res!923204) b!1381534))

(assert (= (and b!1381534 res!923207) b!1381535))

(assert (= (and b!1381535 res!923206) b!1381536))

(declare-fun m!1266279 () Bool)

(assert (=> b!1381536 m!1266279))

(declare-fun m!1266281 () Bool)

(assert (=> b!1381535 m!1266281))

(declare-fun m!1266283 () Bool)

(assert (=> start!117918 m!1266283))

(declare-fun m!1266285 () Bool)

(assert (=> start!117918 m!1266285))

(declare-fun m!1266287 () Bool)

(assert (=> b!1381534 m!1266287))

(assert (=> b!1381534 m!1266287))

(declare-fun m!1266289 () Bool)

(assert (=> b!1381534 m!1266289))

(push 1)

(assert (not b!1381536))

(assert (not start!117918))

(assert (not b!1381535))

(assert (not b!1381534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

