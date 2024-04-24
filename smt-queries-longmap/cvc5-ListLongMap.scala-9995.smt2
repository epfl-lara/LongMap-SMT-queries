; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118194 () Bool)

(assert start!118194)

(declare-fun b!1383322 () Bool)

(declare-fun res!924161 () Bool)

(declare-fun e!784201 () Bool)

(assert (=> b!1383322 (=> (not res!924161) (not e!784201))))

(declare-datatypes ((array!94481 0))(
  ( (array!94482 (arr!45621 (Array (_ BitVec 32) (_ BitVec 64))) (size!46172 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94481)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383322 (= res!924161 (validKeyInArray!0 (select (arr!45621 a!2971) i!1094)))))

(declare-fun b!1383323 () Bool)

(declare-fun res!924163 () Bool)

(assert (=> b!1383323 (=> (not res!924163) (not e!784201))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94481 (_ BitVec 32)) Bool)

(assert (=> b!1383323 (= res!924163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383324 () Bool)

(declare-fun res!924162 () Bool)

(assert (=> b!1383324 (=> (not res!924162) (not e!784201))))

(declare-datatypes ((List!32142 0))(
  ( (Nil!32139) (Cons!32138 (h!33356 (_ BitVec 64)) (t!46828 List!32142)) )
))
(declare-fun arrayNoDuplicates!0 (array!94481 (_ BitVec 32) List!32142) Bool)

(assert (=> b!1383324 (= res!924162 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32139))))

(declare-fun b!1383325 () Bool)

(declare-fun res!924164 () Bool)

(assert (=> b!1383325 (=> (not res!924164) (not e!784201))))

(assert (=> b!1383325 (= res!924164 (and (= (size!46172 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46172 a!2971))))))

(declare-fun b!1383326 () Bool)

(declare-fun res!924165 () Bool)

(assert (=> b!1383326 (=> (not res!924165) (not e!784201))))

(assert (=> b!1383326 (= res!924165 (and (not (= (select (arr!45621 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45621 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46172 a!2971))))))

(declare-fun b!1383327 () Bool)

(assert (=> b!1383327 (= e!784201 (not true))))

(assert (=> b!1383327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94482 (store (arr!45621 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46172 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45978 0))(
  ( (Unit!45979) )
))
(declare-fun lt!608811 () Unit!45978)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45978)

(assert (=> b!1383327 (= lt!608811 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!924166 () Bool)

(assert (=> start!118194 (=> (not res!924166) (not e!784201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118194 (= res!924166 (validMask!0 mask!3034))))

(assert (=> start!118194 e!784201))

(assert (=> start!118194 true))

(declare-fun array_inv!34902 (array!94481) Bool)

(assert (=> start!118194 (array_inv!34902 a!2971)))

(assert (= (and start!118194 res!924166) b!1383325))

(assert (= (and b!1383325 res!924164) b!1383322))

(assert (= (and b!1383322 res!924161) b!1383324))

(assert (= (and b!1383324 res!924162) b!1383323))

(assert (= (and b!1383323 res!924163) b!1383326))

(assert (= (and b!1383326 res!924165) b!1383327))

(declare-fun m!1268823 () Bool)

(assert (=> start!118194 m!1268823))

(declare-fun m!1268825 () Bool)

(assert (=> start!118194 m!1268825))

(declare-fun m!1268827 () Bool)

(assert (=> b!1383327 m!1268827))

(declare-fun m!1268829 () Bool)

(assert (=> b!1383327 m!1268829))

(declare-fun m!1268831 () Bool)

(assert (=> b!1383327 m!1268831))

(declare-fun m!1268833 () Bool)

(assert (=> b!1383326 m!1268833))

(declare-fun m!1268835 () Bool)

(assert (=> b!1383324 m!1268835))

(assert (=> b!1383322 m!1268833))

(assert (=> b!1383322 m!1268833))

(declare-fun m!1268837 () Bool)

(assert (=> b!1383322 m!1268837))

(declare-fun m!1268839 () Bool)

(assert (=> b!1383323 m!1268839))

(push 1)

(assert (not b!1383323))

(assert (not start!118194))

(assert (not b!1383322))

(assert (not b!1383327))

(assert (not b!1383324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

