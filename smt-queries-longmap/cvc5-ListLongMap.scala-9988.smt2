; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117934 () Bool)

(assert start!117934)

(declare-fun b!1381687 () Bool)

(declare-fun res!923314 () Bool)

(declare-fun e!783215 () Bool)

(assert (=> b!1381687 (=> (not res!923314) (not e!783215))))

(declare-datatypes ((array!94325 0))(
  ( (array!94326 (arr!45545 (Array (_ BitVec 32) (_ BitVec 64))) (size!46095 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94325)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381687 (= res!923314 (validKeyInArray!0 (select (arr!45545 a!2971) i!1094)))))

(declare-fun b!1381686 () Bool)

(declare-fun res!923315 () Bool)

(assert (=> b!1381686 (=> (not res!923315) (not e!783215))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1381686 (= res!923315 (and (= (size!46095 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46095 a!2971))))))

(declare-fun b!1381689 () Bool)

(assert (=> b!1381689 (= e!783215 false)))

(declare-fun lt!608262 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94325 (_ BitVec 32)) Bool)

(assert (=> b!1381689 (= lt!608262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923316 () Bool)

(assert (=> start!117934 (=> (not res!923316) (not e!783215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117934 (= res!923316 (validMask!0 mask!3034))))

(assert (=> start!117934 e!783215))

(assert (=> start!117934 true))

(declare-fun array_inv!34573 (array!94325) Bool)

(assert (=> start!117934 (array_inv!34573 a!2971)))

(declare-fun b!1381688 () Bool)

(declare-fun res!923317 () Bool)

(assert (=> b!1381688 (=> (not res!923317) (not e!783215))))

(declare-datatypes ((List!32079 0))(
  ( (Nil!32076) (Cons!32075 (h!33284 (_ BitVec 64)) (t!46773 List!32079)) )
))
(declare-fun arrayNoDuplicates!0 (array!94325 (_ BitVec 32) List!32079) Bool)

(assert (=> b!1381688 (= res!923317 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32076))))

(assert (= (and start!117934 res!923316) b!1381686))

(assert (= (and b!1381686 res!923315) b!1381687))

(assert (= (and b!1381687 res!923314) b!1381688))

(assert (= (and b!1381688 res!923317) b!1381689))

(declare-fun m!1266867 () Bool)

(assert (=> b!1381687 m!1266867))

(assert (=> b!1381687 m!1266867))

(declare-fun m!1266869 () Bool)

(assert (=> b!1381687 m!1266869))

(declare-fun m!1266871 () Bool)

(assert (=> b!1381689 m!1266871))

(declare-fun m!1266873 () Bool)

(assert (=> start!117934 m!1266873))

(declare-fun m!1266875 () Bool)

(assert (=> start!117934 m!1266875))

(declare-fun m!1266877 () Bool)

(assert (=> b!1381688 m!1266877))

(push 1)

(assert (not b!1381687))

(assert (not start!117934))

(assert (not b!1381688))

(assert (not b!1381689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

