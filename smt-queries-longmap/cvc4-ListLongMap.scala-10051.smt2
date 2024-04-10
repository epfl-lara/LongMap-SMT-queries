; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118414 () Bool)

(assert start!118414)

(declare-fun b!1385149 () Bool)

(declare-fun e!784834 () Bool)

(declare-datatypes ((array!94717 0))(
  ( (array!94718 (arr!45736 (Array (_ BitVec 32) (_ BitVec 64))) (size!46286 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94717)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385149 (= e!784834 (validKeyInArray!0 (select (arr!45736 a!2938) startIndex!16)))))

(declare-fun b!1385150 () Bool)

(declare-fun res!926442 () Bool)

(declare-fun e!784833 () Bool)

(assert (=> b!1385150 (=> (not res!926442) (not e!784833))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385150 (= res!926442 (and (= (size!46286 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46286 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46286 a!2938))))))

(declare-fun b!1385151 () Bool)

(declare-fun res!926440 () Bool)

(assert (=> b!1385151 (=> (not res!926440) (not e!784833))))

(assert (=> b!1385151 (= res!926440 (validKeyInArray!0 (select (arr!45736 a!2938) i!1065)))))

(declare-fun b!1385152 () Bool)

(declare-fun res!926438 () Bool)

(assert (=> b!1385152 (=> (not res!926438) (not e!784833))))

(assert (=> b!1385152 (= res!926438 (and (not (= (select (arr!45736 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45736 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385153 () Bool)

(declare-fun res!926441 () Bool)

(assert (=> b!1385153 (=> (not res!926441) (not e!784833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94717 (_ BitVec 32)) Bool)

(assert (=> b!1385153 (= res!926441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926439 () Bool)

(assert (=> start!118414 (=> (not res!926439) (not e!784833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118414 (= res!926439 (validMask!0 mask!2987))))

(assert (=> start!118414 e!784833))

(assert (=> start!118414 true))

(declare-fun array_inv!34764 (array!94717) Bool)

(assert (=> start!118414 (array_inv!34764 a!2938)))

(declare-fun b!1385154 () Bool)

(declare-datatypes ((Unit!46245 0))(
  ( (Unit!46246) )
))
(declare-fun e!784835 () Unit!46245)

(declare-fun Unit!46247 () Unit!46245)

(assert (=> b!1385154 (= e!784835 Unit!46247)))

(declare-fun b!1385155 () Bool)

(assert (=> b!1385155 (= e!784833 (and (bvsge startIndex!16 (bvsub (size!46286 a!2938) #b00000000000000000000000000000001)) (bvsgt startIndex!16 (size!46286 a!2938))))))

(declare-fun lt!609188 () Unit!46245)

(assert (=> b!1385155 (= lt!609188 e!784835)))

(declare-fun c!128796 () Bool)

(assert (=> b!1385155 (= c!128796 e!784834)))

(declare-fun res!926437 () Bool)

(assert (=> b!1385155 (=> (not res!926437) (not e!784834))))

(assert (=> b!1385155 (= res!926437 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385156 () Bool)

(declare-fun lt!609187 () Unit!46245)

(assert (=> b!1385156 (= e!784835 lt!609187)))

(declare-fun lt!609189 () Unit!46245)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46245)

(assert (=> b!1385156 (= lt!609189 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10129 0))(
  ( (MissingZero!10129 (index!42887 (_ BitVec 32))) (Found!10129 (index!42888 (_ BitVec 32))) (Intermediate!10129 (undefined!10941 Bool) (index!42889 (_ BitVec 32)) (x!124378 (_ BitVec 32))) (Undefined!10129) (MissingVacant!10129 (index!42890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94717 (_ BitVec 32)) SeekEntryResult!10129)

(assert (=> b!1385156 (= (seekEntryOrOpen!0 (select (arr!45736 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45736 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94718 (store (arr!45736 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46286 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46245)

(assert (=> b!1385156 (= lt!609187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385156 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385157 () Bool)

(declare-fun res!926443 () Bool)

(assert (=> b!1385157 (=> (not res!926443) (not e!784833))))

(declare-datatypes ((List!32264 0))(
  ( (Nil!32261) (Cons!32260 (h!33469 (_ BitVec 64)) (t!46958 List!32264)) )
))
(declare-fun arrayNoDuplicates!0 (array!94717 (_ BitVec 32) List!32264) Bool)

(assert (=> b!1385157 (= res!926443 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32261))))

(assert (= (and start!118414 res!926439) b!1385150))

(assert (= (and b!1385150 res!926442) b!1385151))

(assert (= (and b!1385151 res!926440) b!1385157))

(assert (= (and b!1385157 res!926443) b!1385153))

(assert (= (and b!1385153 res!926441) b!1385152))

(assert (= (and b!1385152 res!926438) b!1385155))

(assert (= (and b!1385155 res!926437) b!1385149))

(assert (= (and b!1385155 c!128796) b!1385156))

(assert (= (and b!1385155 (not c!128796)) b!1385154))

(declare-fun m!1270479 () Bool)

(assert (=> start!118414 m!1270479))

(declare-fun m!1270481 () Bool)

(assert (=> start!118414 m!1270481))

(declare-fun m!1270483 () Bool)

(assert (=> b!1385153 m!1270483))

(declare-fun m!1270485 () Bool)

(assert (=> b!1385152 m!1270485))

(assert (=> b!1385151 m!1270485))

(assert (=> b!1385151 m!1270485))

(declare-fun m!1270487 () Bool)

(assert (=> b!1385151 m!1270487))

(declare-fun m!1270489 () Bool)

(assert (=> b!1385149 m!1270489))

(assert (=> b!1385149 m!1270489))

(declare-fun m!1270491 () Bool)

(assert (=> b!1385149 m!1270491))

(declare-fun m!1270493 () Bool)

(assert (=> b!1385156 m!1270493))

(declare-fun m!1270495 () Bool)

(assert (=> b!1385156 m!1270495))

(assert (=> b!1385156 m!1270495))

(declare-fun m!1270497 () Bool)

(assert (=> b!1385156 m!1270497))

(declare-fun m!1270499 () Bool)

(assert (=> b!1385156 m!1270499))

(declare-fun m!1270501 () Bool)

(assert (=> b!1385156 m!1270501))

(assert (=> b!1385156 m!1270489))

(declare-fun m!1270503 () Bool)

(assert (=> b!1385156 m!1270503))

(assert (=> b!1385156 m!1270489))

(declare-fun m!1270505 () Bool)

(assert (=> b!1385156 m!1270505))

(declare-fun m!1270507 () Bool)

(assert (=> b!1385157 m!1270507))

(push 1)

(assert (not b!1385157))

(assert (not b!1385151))

(assert (not start!118414))

(assert (not b!1385149))

(assert (not b!1385156))

(assert (not b!1385153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

