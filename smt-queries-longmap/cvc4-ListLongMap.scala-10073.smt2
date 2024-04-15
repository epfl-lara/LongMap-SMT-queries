; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118570 () Bool)

(assert start!118570)

(declare-fun b!1386114 () Bool)

(declare-fun res!927408 () Bool)

(declare-fun e!785257 () Bool)

(assert (=> b!1386114 (=> (not res!927408) (not e!785257))))

(declare-datatypes ((array!94799 0))(
  ( (array!94800 (arr!45776 (Array (_ BitVec 32) (_ BitVec 64))) (size!46328 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94799)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94799 (_ BitVec 32)) Bool)

(assert (=> b!1386114 (= res!927408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386115 () Bool)

(declare-fun res!927412 () Bool)

(assert (=> b!1386115 (=> (not res!927412) (not e!785257))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386115 (= res!927412 (validKeyInArray!0 (select (arr!45776 a!2938) startIndex!16)))))

(declare-fun res!927407 () Bool)

(assert (=> start!118570 (=> (not res!927407) (not e!785257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118570 (= res!927407 (validMask!0 mask!2987))))

(assert (=> start!118570 e!785257))

(assert (=> start!118570 true))

(declare-fun array_inv!35009 (array!94799) Bool)

(assert (=> start!118570 (array_inv!35009 a!2938)))

(declare-fun b!1386116 () Bool)

(declare-fun res!927413 () Bool)

(assert (=> b!1386116 (=> (not res!927413) (not e!785257))))

(declare-datatypes ((List!32382 0))(
  ( (Nil!32379) (Cons!32378 (h!33587 (_ BitVec 64)) (t!47068 List!32382)) )
))
(declare-fun arrayNoDuplicates!0 (array!94799 (_ BitVec 32) List!32382) Bool)

(assert (=> b!1386116 (= res!927413 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32379))))

(declare-fun b!1386117 () Bool)

(declare-fun res!927409 () Bool)

(assert (=> b!1386117 (=> (not res!927409) (not e!785257))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386117 (= res!927409 (validKeyInArray!0 (select (arr!45776 a!2938) i!1065)))))

(declare-fun b!1386118 () Bool)

(declare-fun res!927411 () Bool)

(assert (=> b!1386118 (=> (not res!927411) (not e!785257))))

(assert (=> b!1386118 (= res!927411 (and (not (= (select (arr!45776 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45776 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386119 () Bool)

(declare-fun res!927410 () Bool)

(assert (=> b!1386119 (=> (not res!927410) (not e!785257))))

(assert (=> b!1386119 (= res!927410 (and (= (size!46328 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46328 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46328 a!2938))))))

(declare-fun b!1386120 () Bool)

(assert (=> b!1386120 (= e!785257 (not true))))

(declare-datatypes ((SeekEntryResult!10145 0))(
  ( (MissingZero!10145 (index!42951 (_ BitVec 32))) (Found!10145 (index!42952 (_ BitVec 32))) (Intermediate!10145 (undefined!10957 Bool) (index!42953 (_ BitVec 32)) (x!124567 (_ BitVec 32))) (Undefined!10145) (MissingVacant!10145 (index!42954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94799 (_ BitVec 32)) SeekEntryResult!10145)

(assert (=> b!1386120 (= (seekEntryOrOpen!0 (select (arr!45776 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45776 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94800 (store (arr!45776 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46328 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46121 0))(
  ( (Unit!46122) )
))
(declare-fun lt!609200 () Unit!46121)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46121)

(assert (=> b!1386120 (= lt!609200 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118570 res!927407) b!1386119))

(assert (= (and b!1386119 res!927410) b!1386117))

(assert (= (and b!1386117 res!927409) b!1386116))

(assert (= (and b!1386116 res!927413) b!1386114))

(assert (= (and b!1386114 res!927408) b!1386118))

(assert (= (and b!1386118 res!927411) b!1386115))

(assert (= (and b!1386115 res!927412) b!1386120))

(declare-fun m!1271015 () Bool)

(assert (=> b!1386118 m!1271015))

(declare-fun m!1271017 () Bool)

(assert (=> b!1386120 m!1271017))

(assert (=> b!1386120 m!1271017))

(declare-fun m!1271019 () Bool)

(assert (=> b!1386120 m!1271019))

(declare-fun m!1271021 () Bool)

(assert (=> b!1386120 m!1271021))

(declare-fun m!1271023 () Bool)

(assert (=> b!1386120 m!1271023))

(declare-fun m!1271025 () Bool)

(assert (=> b!1386120 m!1271025))

(assert (=> b!1386120 m!1271025))

(declare-fun m!1271027 () Bool)

(assert (=> b!1386120 m!1271027))

(assert (=> b!1386115 m!1271025))

(assert (=> b!1386115 m!1271025))

(declare-fun m!1271029 () Bool)

(assert (=> b!1386115 m!1271029))

(declare-fun m!1271031 () Bool)

(assert (=> start!118570 m!1271031))

(declare-fun m!1271033 () Bool)

(assert (=> start!118570 m!1271033))

(assert (=> b!1386117 m!1271015))

(assert (=> b!1386117 m!1271015))

(declare-fun m!1271035 () Bool)

(assert (=> b!1386117 m!1271035))

(declare-fun m!1271037 () Bool)

(assert (=> b!1386116 m!1271037))

(declare-fun m!1271039 () Bool)

(assert (=> b!1386114 m!1271039))

(push 1)

(assert (not b!1386120))

(assert (not start!118570))

(assert (not b!1386114))

(assert (not b!1386117))

(assert (not b!1386115))

(assert (not b!1386116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

