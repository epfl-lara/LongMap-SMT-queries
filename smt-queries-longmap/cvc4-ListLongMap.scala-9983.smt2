; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117908 () Bool)

(assert start!117908)

(declare-fun res!923159 () Bool)

(declare-fun e!783136 () Bool)

(assert (=> start!117908 (=> (not res!923159) (not e!783136))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117908 (= res!923159 (validMask!0 mask!3034))))

(assert (=> start!117908 e!783136))

(assert (=> start!117908 true))

(declare-datatypes ((array!94299 0))(
  ( (array!94300 (arr!45532 (Array (_ BitVec 32) (_ BitVec 64))) (size!46082 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94299)

(declare-fun array_inv!34560 (array!94299) Bool)

(assert (=> start!117908 (array_inv!34560 a!2971)))

(declare-fun b!1381532 () Bool)

(declare-fun res!923160 () Bool)

(assert (=> b!1381532 (=> (not res!923160) (not e!783136))))

(declare-datatypes ((List!32066 0))(
  ( (Nil!32063) (Cons!32062 (h!33271 (_ BitVec 64)) (t!46760 List!32066)) )
))
(declare-fun arrayNoDuplicates!0 (array!94299 (_ BitVec 32) List!32066) Bool)

(assert (=> b!1381532 (= res!923160 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32063))))

(declare-fun b!1381533 () Bool)

(assert (=> b!1381533 (= e!783136 (bvsgt #b00000000000000000000000000000000 (size!46082 a!2971)))))

(declare-fun b!1381530 () Bool)

(declare-fun res!923158 () Bool)

(assert (=> b!1381530 (=> (not res!923158) (not e!783136))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381530 (= res!923158 (and (= (size!46082 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46082 a!2971))))))

(declare-fun b!1381531 () Bool)

(declare-fun res!923161 () Bool)

(assert (=> b!1381531 (=> (not res!923161) (not e!783136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381531 (= res!923161 (validKeyInArray!0 (select (arr!45532 a!2971) i!1094)))))

(assert (= (and start!117908 res!923159) b!1381530))

(assert (= (and b!1381530 res!923158) b!1381531))

(assert (= (and b!1381531 res!923161) b!1381532))

(assert (= (and b!1381532 res!923160) b!1381533))

(declare-fun m!1266713 () Bool)

(assert (=> start!117908 m!1266713))

(declare-fun m!1266715 () Bool)

(assert (=> start!117908 m!1266715))

(declare-fun m!1266717 () Bool)

(assert (=> b!1381532 m!1266717))

(declare-fun m!1266719 () Bool)

(assert (=> b!1381531 m!1266719))

(assert (=> b!1381531 m!1266719))

(declare-fun m!1266721 () Bool)

(assert (=> b!1381531 m!1266721))

(push 1)

(assert (not b!1381531))

(assert (not start!117908))

(assert (not b!1381532))

(check-sat)

