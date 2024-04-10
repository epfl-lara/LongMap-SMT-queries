; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118572 () Bool)

(assert start!118572)

(declare-fun b!1386162 () Bool)

(declare-fun res!927414 () Bool)

(declare-fun e!785282 () Bool)

(assert (=> b!1386162 (=> (not res!927414) (not e!785282))))

(declare-datatypes ((array!94848 0))(
  ( (array!94849 (arr!45800 (Array (_ BitVec 32) (_ BitVec 64))) (size!46350 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94848)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94848 (_ BitVec 32)) Bool)

(assert (=> b!1386162 (= res!927414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386163 () Bool)

(assert (=> b!1386163 (= e!785282 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10143 0))(
  ( (MissingZero!10143 (index!42943 (_ BitVec 32))) (Found!10143 (index!42944 (_ BitVec 32))) (Intermediate!10143 (undefined!10955 Bool) (index!42945 (_ BitVec 32)) (x!124568 (_ BitVec 32))) (Undefined!10143) (MissingVacant!10143 (index!42946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94848 (_ BitVec 32)) SeekEntryResult!10143)

(assert (=> b!1386163 (= (seekEntryOrOpen!0 (select (arr!45800 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45800 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94849 (store (arr!45800 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46350 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46274 0))(
  ( (Unit!46275) )
))
(declare-fun lt!609381 () Unit!46274)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46274)

(assert (=> b!1386163 (= lt!609381 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386164 () Bool)

(declare-fun res!927413 () Bool)

(assert (=> b!1386164 (=> (not res!927413) (not e!785282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386164 (= res!927413 (validKeyInArray!0 (select (arr!45800 a!2938) startIndex!16)))))

(declare-fun b!1386165 () Bool)

(declare-fun res!927415 () Bool)

(assert (=> b!1386165 (=> (not res!927415) (not e!785282))))

(assert (=> b!1386165 (= res!927415 (validKeyInArray!0 (select (arr!45800 a!2938) i!1065)))))

(declare-fun b!1386166 () Bool)

(declare-fun res!927412 () Bool)

(assert (=> b!1386166 (=> (not res!927412) (not e!785282))))

(declare-datatypes ((List!32328 0))(
  ( (Nil!32325) (Cons!32324 (h!33533 (_ BitVec 64)) (t!47022 List!32328)) )
))
(declare-fun arrayNoDuplicates!0 (array!94848 (_ BitVec 32) List!32328) Bool)

(assert (=> b!1386166 (= res!927412 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32325))))

(declare-fun res!927417 () Bool)

(assert (=> start!118572 (=> (not res!927417) (not e!785282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118572 (= res!927417 (validMask!0 mask!2987))))

(assert (=> start!118572 e!785282))

(assert (=> start!118572 true))

(declare-fun array_inv!34828 (array!94848) Bool)

(assert (=> start!118572 (array_inv!34828 a!2938)))

(declare-fun b!1386167 () Bool)

(declare-fun res!927418 () Bool)

(assert (=> b!1386167 (=> (not res!927418) (not e!785282))))

(assert (=> b!1386167 (= res!927418 (and (= (size!46350 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46350 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46350 a!2938))))))

(declare-fun b!1386168 () Bool)

(declare-fun res!927416 () Bool)

(assert (=> b!1386168 (=> (not res!927416) (not e!785282))))

(assert (=> b!1386168 (= res!927416 (and (not (= (select (arr!45800 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45800 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118572 res!927417) b!1386167))

(assert (= (and b!1386167 res!927418) b!1386165))

(assert (= (and b!1386165 res!927415) b!1386166))

(assert (= (and b!1386166 res!927412) b!1386162))

(assert (= (and b!1386162 res!927414) b!1386168))

(assert (= (and b!1386168 res!927416) b!1386164))

(assert (= (and b!1386164 res!927413) b!1386163))

(declare-fun m!1271493 () Bool)

(assert (=> b!1386168 m!1271493))

(declare-fun m!1271495 () Bool)

(assert (=> start!118572 m!1271495))

(declare-fun m!1271497 () Bool)

(assert (=> start!118572 m!1271497))

(assert (=> b!1386165 m!1271493))

(assert (=> b!1386165 m!1271493))

(declare-fun m!1271499 () Bool)

(assert (=> b!1386165 m!1271499))

(declare-fun m!1271501 () Bool)

(assert (=> b!1386162 m!1271501))

(declare-fun m!1271503 () Bool)

(assert (=> b!1386163 m!1271503))

(assert (=> b!1386163 m!1271503))

(declare-fun m!1271505 () Bool)

(assert (=> b!1386163 m!1271505))

(declare-fun m!1271507 () Bool)

(assert (=> b!1386163 m!1271507))

(declare-fun m!1271509 () Bool)

(assert (=> b!1386163 m!1271509))

(declare-fun m!1271511 () Bool)

(assert (=> b!1386163 m!1271511))

(assert (=> b!1386163 m!1271511))

(declare-fun m!1271513 () Bool)

(assert (=> b!1386163 m!1271513))

(declare-fun m!1271515 () Bool)

(assert (=> b!1386166 m!1271515))

(assert (=> b!1386164 m!1271511))

(assert (=> b!1386164 m!1271511))

(declare-fun m!1271517 () Bool)

(assert (=> b!1386164 m!1271517))

(push 1)

(assert (not b!1386163))

(assert (not b!1386162))

(assert (not b!1386165))

(assert (not start!118572))

(assert (not b!1386166))

(assert (not b!1386164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

