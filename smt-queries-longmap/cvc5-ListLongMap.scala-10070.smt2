; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118554 () Bool)

(assert start!118554)

(declare-fun b!1385973 () Bool)

(declare-fun res!927228 () Bool)

(declare-fun e!785227 () Bool)

(assert (=> b!1385973 (=> (not res!927228) (not e!785227))))

(declare-datatypes ((array!94830 0))(
  ( (array!94831 (arr!45791 (Array (_ BitVec 32) (_ BitVec 64))) (size!46341 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94830)

(declare-datatypes ((List!32319 0))(
  ( (Nil!32316) (Cons!32315 (h!33524 (_ BitVec 64)) (t!47013 List!32319)) )
))
(declare-fun arrayNoDuplicates!0 (array!94830 (_ BitVec 32) List!32319) Bool)

(assert (=> b!1385973 (= res!927228 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32316))))

(declare-fun b!1385974 () Bool)

(declare-fun res!927224 () Bool)

(assert (=> b!1385974 (=> (not res!927224) (not e!785227))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385974 (= res!927224 (and (= (size!46341 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46341 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46341 a!2938))))))

(declare-fun b!1385975 () Bool)

(declare-fun res!927227 () Bool)

(assert (=> b!1385975 (=> (not res!927227) (not e!785227))))

(assert (=> b!1385975 (= res!927227 (and (not (= (select (arr!45791 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45791 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385976 () Bool)

(declare-fun res!927225 () Bool)

(assert (=> b!1385976 (=> (not res!927225) (not e!785227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385976 (= res!927225 (validKeyInArray!0 (select (arr!45791 a!2938) startIndex!16)))))

(declare-fun res!927229 () Bool)

(assert (=> start!118554 (=> (not res!927229) (not e!785227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118554 (= res!927229 (validMask!0 mask!2987))))

(assert (=> start!118554 e!785227))

(assert (=> start!118554 true))

(declare-fun array_inv!34819 (array!94830) Bool)

(assert (=> start!118554 (array_inv!34819 a!2938)))

(declare-fun b!1385977 () Bool)

(declare-fun res!927226 () Bool)

(assert (=> b!1385977 (=> (not res!927226) (not e!785227))))

(assert (=> b!1385977 (= res!927226 (validKeyInArray!0 (select (arr!45791 a!2938) i!1065)))))

(declare-fun b!1385978 () Bool)

(assert (=> b!1385978 (= e!785227 (not true))))

(declare-datatypes ((SeekEntryResult!10134 0))(
  ( (MissingZero!10134 (index!42907 (_ BitVec 32))) (Found!10134 (index!42908 (_ BitVec 32))) (Intermediate!10134 (undefined!10946 Bool) (index!42909 (_ BitVec 32)) (x!124535 (_ BitVec 32))) (Undefined!10134) (MissingVacant!10134 (index!42910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94830 (_ BitVec 32)) SeekEntryResult!10134)

(assert (=> b!1385978 (= (seekEntryOrOpen!0 (select (arr!45791 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45791 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94831 (store (arr!45791 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46341 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46256 0))(
  ( (Unit!46257) )
))
(declare-fun lt!609354 () Unit!46256)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46256)

(assert (=> b!1385978 (= lt!609354 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1385979 () Bool)

(declare-fun res!927223 () Bool)

(assert (=> b!1385979 (=> (not res!927223) (not e!785227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94830 (_ BitVec 32)) Bool)

(assert (=> b!1385979 (= res!927223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118554 res!927229) b!1385974))

(assert (= (and b!1385974 res!927224) b!1385977))

(assert (= (and b!1385977 res!927226) b!1385973))

(assert (= (and b!1385973 res!927228) b!1385979))

(assert (= (and b!1385979 res!927223) b!1385975))

(assert (= (and b!1385975 res!927227) b!1385976))

(assert (= (and b!1385976 res!927225) b!1385978))

(declare-fun m!1271259 () Bool)

(assert (=> b!1385976 m!1271259))

(assert (=> b!1385976 m!1271259))

(declare-fun m!1271261 () Bool)

(assert (=> b!1385976 m!1271261))

(declare-fun m!1271263 () Bool)

(assert (=> b!1385978 m!1271263))

(assert (=> b!1385978 m!1271263))

(declare-fun m!1271265 () Bool)

(assert (=> b!1385978 m!1271265))

(declare-fun m!1271267 () Bool)

(assert (=> b!1385978 m!1271267))

(declare-fun m!1271269 () Bool)

(assert (=> b!1385978 m!1271269))

(assert (=> b!1385978 m!1271259))

(assert (=> b!1385978 m!1271259))

(declare-fun m!1271271 () Bool)

(assert (=> b!1385978 m!1271271))

(declare-fun m!1271273 () Bool)

(assert (=> start!118554 m!1271273))

(declare-fun m!1271275 () Bool)

(assert (=> start!118554 m!1271275))

(declare-fun m!1271277 () Bool)

(assert (=> b!1385979 m!1271277))

(declare-fun m!1271279 () Bool)

(assert (=> b!1385975 m!1271279))

(declare-fun m!1271281 () Bool)

(assert (=> b!1385973 m!1271281))

(assert (=> b!1385977 m!1271279))

(assert (=> b!1385977 m!1271279))

(declare-fun m!1271283 () Bool)

(assert (=> b!1385977 m!1271283))

(push 1)

(assert (not b!1385978))

(assert (not b!1385977))

(assert (not b!1385973))

(assert (not b!1385979))

(assert (not b!1385976))

(assert (not start!118554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

