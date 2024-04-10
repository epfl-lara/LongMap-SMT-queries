; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117932 () Bool)

(assert start!117932)

(declare-fun b!1381676 () Bool)

(declare-fun res!923303 () Bool)

(declare-fun e!783209 () Bool)

(assert (=> b!1381676 (=> (not res!923303) (not e!783209))))

(declare-datatypes ((array!94323 0))(
  ( (array!94324 (arr!45544 (Array (_ BitVec 32) (_ BitVec 64))) (size!46094 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94323)

(declare-datatypes ((List!32078 0))(
  ( (Nil!32075) (Cons!32074 (h!33283 (_ BitVec 64)) (t!46772 List!32078)) )
))
(declare-fun arrayNoDuplicates!0 (array!94323 (_ BitVec 32) List!32078) Bool)

(assert (=> b!1381676 (= res!923303 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32075))))

(declare-fun b!1381675 () Bool)

(declare-fun res!923302 () Bool)

(assert (=> b!1381675 (=> (not res!923302) (not e!783209))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381675 (= res!923302 (validKeyInArray!0 (select (arr!45544 a!2971) i!1094)))))

(declare-fun b!1381677 () Bool)

(assert (=> b!1381677 (= e!783209 false)))

(declare-fun lt!608259 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94323 (_ BitVec 32)) Bool)

(assert (=> b!1381677 (= lt!608259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381674 () Bool)

(declare-fun res!923304 () Bool)

(assert (=> b!1381674 (=> (not res!923304) (not e!783209))))

(assert (=> b!1381674 (= res!923304 (and (= (size!46094 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46094 a!2971))))))

(declare-fun res!923305 () Bool)

(assert (=> start!117932 (=> (not res!923305) (not e!783209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117932 (= res!923305 (validMask!0 mask!3034))))

(assert (=> start!117932 e!783209))

(assert (=> start!117932 true))

(declare-fun array_inv!34572 (array!94323) Bool)

(assert (=> start!117932 (array_inv!34572 a!2971)))

(assert (= (and start!117932 res!923305) b!1381674))

(assert (= (and b!1381674 res!923304) b!1381675))

(assert (= (and b!1381675 res!923302) b!1381676))

(assert (= (and b!1381676 res!923303) b!1381677))

(declare-fun m!1266855 () Bool)

(assert (=> b!1381676 m!1266855))

(declare-fun m!1266857 () Bool)

(assert (=> b!1381675 m!1266857))

(assert (=> b!1381675 m!1266857))

(declare-fun m!1266859 () Bool)

(assert (=> b!1381675 m!1266859))

(declare-fun m!1266861 () Bool)

(assert (=> b!1381677 m!1266861))

(declare-fun m!1266863 () Bool)

(assert (=> start!117932 m!1266863))

(declare-fun m!1266865 () Bool)

(assert (=> start!117932 m!1266865))

(push 1)

(assert (not b!1381677))

(assert (not b!1381675))

(assert (not start!117932))

(assert (not b!1381676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

