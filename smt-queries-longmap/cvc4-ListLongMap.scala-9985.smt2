; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117920 () Bool)

(assert start!117920)

(declare-fun b!1381605 () Bool)

(declare-fun e!783173 () Bool)

(assert (=> b!1381605 (= e!783173 false)))

(declare-fun lt!608241 () Bool)

(declare-datatypes ((array!94311 0))(
  ( (array!94312 (arr!45538 (Array (_ BitVec 32) (_ BitVec 64))) (size!46088 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94311)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94311 (_ BitVec 32)) Bool)

(assert (=> b!1381605 (= lt!608241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381603 () Bool)

(declare-fun res!923232 () Bool)

(assert (=> b!1381603 (=> (not res!923232) (not e!783173))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381603 (= res!923232 (validKeyInArray!0 (select (arr!45538 a!2971) i!1094)))))

(declare-fun res!923233 () Bool)

(assert (=> start!117920 (=> (not res!923233) (not e!783173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117920 (= res!923233 (validMask!0 mask!3034))))

(assert (=> start!117920 e!783173))

(assert (=> start!117920 true))

(declare-fun array_inv!34566 (array!94311) Bool)

(assert (=> start!117920 (array_inv!34566 a!2971)))

(declare-fun b!1381602 () Bool)

(declare-fun res!923230 () Bool)

(assert (=> b!1381602 (=> (not res!923230) (not e!783173))))

(assert (=> b!1381602 (= res!923230 (and (= (size!46088 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46088 a!2971))))))

(declare-fun b!1381604 () Bool)

(declare-fun res!923231 () Bool)

(assert (=> b!1381604 (=> (not res!923231) (not e!783173))))

(declare-datatypes ((List!32072 0))(
  ( (Nil!32069) (Cons!32068 (h!33277 (_ BitVec 64)) (t!46766 List!32072)) )
))
(declare-fun arrayNoDuplicates!0 (array!94311 (_ BitVec 32) List!32072) Bool)

(assert (=> b!1381604 (= res!923231 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32069))))

(assert (= (and start!117920 res!923233) b!1381602))

(assert (= (and b!1381602 res!923230) b!1381603))

(assert (= (and b!1381603 res!923232) b!1381604))

(assert (= (and b!1381604 res!923231) b!1381605))

(declare-fun m!1266783 () Bool)

(assert (=> b!1381605 m!1266783))

(declare-fun m!1266785 () Bool)

(assert (=> b!1381603 m!1266785))

(assert (=> b!1381603 m!1266785))

(declare-fun m!1266787 () Bool)

(assert (=> b!1381603 m!1266787))

(declare-fun m!1266789 () Bool)

(assert (=> start!117920 m!1266789))

(declare-fun m!1266791 () Bool)

(assert (=> start!117920 m!1266791))

(declare-fun m!1266793 () Bool)

(assert (=> b!1381604 m!1266793))

(push 1)

(assert (not b!1381603))

(assert (not start!117920))

(assert (not b!1381604))

(assert (not b!1381605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

