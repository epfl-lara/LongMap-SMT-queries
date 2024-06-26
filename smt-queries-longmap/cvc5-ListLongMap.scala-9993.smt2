; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117966 () Bool)

(assert start!117966)

(declare-fun b!1381837 () Bool)

(declare-fun res!923513 () Bool)

(declare-fun e!783285 () Bool)

(assert (=> b!1381837 (=> (not res!923513) (not e!783285))))

(declare-datatypes ((array!94309 0))(
  ( (array!94310 (arr!45537 (Array (_ BitVec 32) (_ BitVec 64))) (size!46089 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94309)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381837 (= res!923513 (validKeyInArray!0 (select (arr!45537 a!2971) i!1094)))))

(declare-fun res!923510 () Bool)

(assert (=> start!117966 (=> (not res!923510) (not e!783285))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117966 (= res!923510 (validMask!0 mask!3034))))

(assert (=> start!117966 e!783285))

(assert (=> start!117966 true))

(declare-fun array_inv!34770 (array!94309) Bool)

(assert (=> start!117966 (array_inv!34770 a!2971)))

(declare-fun b!1381838 () Bool)

(declare-fun res!923512 () Bool)

(assert (=> b!1381838 (=> (not res!923512) (not e!783285))))

(declare-datatypes ((List!32149 0))(
  ( (Nil!32146) (Cons!32145 (h!33354 (_ BitVec 64)) (t!46835 List!32149)) )
))
(declare-fun arrayNoDuplicates!0 (array!94309 (_ BitVec 32) List!32149) Bool)

(assert (=> b!1381838 (= res!923512 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32146))))

(declare-fun b!1381839 () Bool)

(assert (=> b!1381839 (= e!783285 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94309 (_ BitVec 32)) Bool)

(assert (=> b!1381839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94310 (store (arr!45537 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46089 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45868 0))(
  ( (Unit!45869) )
))
(declare-fun lt!608129 () Unit!45868)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45868)

(assert (=> b!1381839 (= lt!608129 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381840 () Bool)

(declare-fun res!923511 () Bool)

(assert (=> b!1381840 (=> (not res!923511) (not e!783285))))

(assert (=> b!1381840 (= res!923511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381841 () Bool)

(declare-fun res!923508 () Bool)

(assert (=> b!1381841 (=> (not res!923508) (not e!783285))))

(assert (=> b!1381841 (= res!923508 (and (= (size!46089 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46089 a!2971))))))

(declare-fun b!1381842 () Bool)

(declare-fun res!923509 () Bool)

(assert (=> b!1381842 (=> (not res!923509) (not e!783285))))

(assert (=> b!1381842 (= res!923509 (and (not (= (select (arr!45537 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45537 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46089 a!2971))))))

(assert (= (and start!117966 res!923510) b!1381841))

(assert (= (and b!1381841 res!923508) b!1381837))

(assert (= (and b!1381837 res!923513) b!1381838))

(assert (= (and b!1381838 res!923512) b!1381840))

(assert (= (and b!1381840 res!923511) b!1381842))

(assert (= (and b!1381842 res!923509) b!1381839))

(declare-fun m!1266579 () Bool)

(assert (=> start!117966 m!1266579))

(declare-fun m!1266581 () Bool)

(assert (=> start!117966 m!1266581))

(declare-fun m!1266583 () Bool)

(assert (=> b!1381838 m!1266583))

(declare-fun m!1266585 () Bool)

(assert (=> b!1381839 m!1266585))

(declare-fun m!1266587 () Bool)

(assert (=> b!1381839 m!1266587))

(declare-fun m!1266589 () Bool)

(assert (=> b!1381839 m!1266589))

(declare-fun m!1266591 () Bool)

(assert (=> b!1381840 m!1266591))

(declare-fun m!1266593 () Bool)

(assert (=> b!1381842 m!1266593))

(assert (=> b!1381837 m!1266593))

(assert (=> b!1381837 m!1266593))

(declare-fun m!1266595 () Bool)

(assert (=> b!1381837 m!1266595))

(push 1)

(assert (not b!1381839))

(assert (not b!1381838))

(assert (not start!117966))

(assert (not b!1381840))

(assert (not b!1381837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

