; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117944 () Bool)

(assert start!117944)

(declare-fun b!1381748 () Bool)

(declare-fun res!923376 () Bool)

(declare-fun e!783245 () Bool)

(assert (=> b!1381748 (=> (not res!923376) (not e!783245))))

(declare-datatypes ((array!94335 0))(
  ( (array!94336 (arr!45550 (Array (_ BitVec 32) (_ BitVec 64))) (size!46100 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94335)

(declare-datatypes ((List!32084 0))(
  ( (Nil!32081) (Cons!32080 (h!33289 (_ BitVec 64)) (t!46778 List!32084)) )
))
(declare-fun arrayNoDuplicates!0 (array!94335 (_ BitVec 32) List!32084) Bool)

(assert (=> b!1381748 (= res!923376 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32081))))

(declare-fun b!1381747 () Bool)

(declare-fun res!923375 () Bool)

(assert (=> b!1381747 (=> (not res!923375) (not e!783245))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381747 (= res!923375 (validKeyInArray!0 (select (arr!45550 a!2971) i!1094)))))

(declare-fun b!1381749 () Bool)

(assert (=> b!1381749 (= e!783245 false)))

(declare-fun lt!608277 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94335 (_ BitVec 32)) Bool)

(assert (=> b!1381749 (= lt!608277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923374 () Bool)

(assert (=> start!117944 (=> (not res!923374) (not e!783245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117944 (= res!923374 (validMask!0 mask!3034))))

(assert (=> start!117944 e!783245))

(assert (=> start!117944 true))

(declare-fun array_inv!34578 (array!94335) Bool)

(assert (=> start!117944 (array_inv!34578 a!2971)))

(declare-fun b!1381746 () Bool)

(declare-fun res!923377 () Bool)

(assert (=> b!1381746 (=> (not res!923377) (not e!783245))))

(assert (=> b!1381746 (= res!923377 (and (= (size!46100 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46100 a!2971))))))

(assert (= (and start!117944 res!923374) b!1381746))

(assert (= (and b!1381746 res!923377) b!1381747))

(assert (= (and b!1381747 res!923375) b!1381748))

(assert (= (and b!1381748 res!923376) b!1381749))

(declare-fun m!1266927 () Bool)

(assert (=> b!1381748 m!1266927))

(declare-fun m!1266929 () Bool)

(assert (=> b!1381747 m!1266929))

(assert (=> b!1381747 m!1266929))

(declare-fun m!1266931 () Bool)

(assert (=> b!1381747 m!1266931))

(declare-fun m!1266933 () Bool)

(assert (=> b!1381749 m!1266933))

(declare-fun m!1266935 () Bool)

(assert (=> start!117944 m!1266935))

(declare-fun m!1266937 () Bool)

(assert (=> start!117944 m!1266937))

(push 1)

(assert (not b!1381749))

(assert (not b!1381747))

(assert (not start!117944))

(assert (not b!1381748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

