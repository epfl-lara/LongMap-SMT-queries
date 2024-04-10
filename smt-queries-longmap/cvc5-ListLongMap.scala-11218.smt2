; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130940 () Bool)

(assert start!130940)

(declare-fun b!1535935 () Bool)

(declare-fun e!854951 () Bool)

(declare-fun e!854952 () Bool)

(assert (=> b!1535935 (= e!854951 e!854952)))

(declare-fun res!1053021 () Bool)

(assert (=> b!1535935 (=> (not res!1053021) (not e!854952))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102038 0))(
  ( (array!102039 (arr!49235 (Array (_ BitVec 32) (_ BitVec 64))) (size!49785 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102038)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13367 0))(
  ( (MissingZero!13367 (index!55863 (_ BitVec 32))) (Found!13367 (index!55864 (_ BitVec 32))) (Intermediate!13367 (undefined!14179 Bool) (index!55865 (_ BitVec 32)) (x!137609 (_ BitVec 32))) (Undefined!13367) (MissingVacant!13367 (index!55866 (_ BitVec 32))) )
))
(declare-fun lt!664164 () SeekEntryResult!13367)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102038 (_ BitVec 32)) SeekEntryResult!13367)

(assert (=> b!1535935 (= res!1053021 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49235 a!2792) j!64) a!2792 mask!2480) lt!664164))))

(assert (=> b!1535935 (= lt!664164 (Found!13367 j!64))))

(declare-fun b!1535936 () Bool)

(declare-fun res!1053026 () Bool)

(assert (=> b!1535936 (=> (not res!1053026) (not e!854952))))

(assert (=> b!1535936 (= res!1053026 (not (= (select (arr!49235 a!2792) index!463) (select (arr!49235 a!2792) j!64))))))

(declare-fun b!1535937 () Bool)

(declare-fun e!854953 () Bool)

(declare-fun e!854950 () Bool)

(assert (=> b!1535937 (= e!854953 e!854950)))

(declare-fun res!1053029 () Bool)

(assert (=> b!1535937 (=> (not res!1053029) (not e!854950))))

(declare-fun lt!664163 () SeekEntryResult!13367)

(assert (=> b!1535937 (= res!1053029 (= lt!664163 lt!664164))))

(declare-fun lt!664162 () (_ BitVec 32))

(assert (=> b!1535937 (= lt!664163 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664162 vacantIndex!5 (select (arr!49235 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535938 () Bool)

(declare-fun res!1053024 () Bool)

(assert (=> b!1535938 (=> (not res!1053024) (not e!854951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535938 (= res!1053024 (validKeyInArray!0 (select (arr!49235 a!2792) j!64)))))

(declare-fun b!1535939 () Bool)

(assert (=> b!1535939 (= e!854952 e!854953)))

(declare-fun res!1053030 () Bool)

(assert (=> b!1535939 (=> (not res!1053030) (not e!854953))))

(assert (=> b!1535939 (= res!1053030 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664162 #b00000000000000000000000000000000) (bvslt lt!664162 (size!49785 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535939 (= lt!664162 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535941 () Bool)

(declare-fun res!1053028 () Bool)

(assert (=> b!1535941 (=> (not res!1053028) (not e!854951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102038 (_ BitVec 32)) Bool)

(assert (=> b!1535941 (= res!1053028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535942 () Bool)

(declare-fun res!1053027 () Bool)

(assert (=> b!1535942 (=> (not res!1053027) (not e!854951))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535942 (= res!1053027 (and (= (size!49785 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49785 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49785 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535943 () Bool)

(assert (=> b!1535943 (= e!854950 (not true))))

(assert (=> b!1535943 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664162 vacantIndex!5 (select (store (arr!49235 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102039 (store (arr!49235 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49785 a!2792)) mask!2480) lt!664163)))

(declare-datatypes ((Unit!51306 0))(
  ( (Unit!51307) )
))
(declare-fun lt!664165 () Unit!51306)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51306)

(assert (=> b!1535943 (= lt!664165 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664162 vacantIndex!5 mask!2480))))

(declare-fun b!1535944 () Bool)

(declare-fun res!1053031 () Bool)

(assert (=> b!1535944 (=> (not res!1053031) (not e!854951))))

(assert (=> b!1535944 (= res!1053031 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49785 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49785 a!2792)) (= (select (arr!49235 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535945 () Bool)

(declare-fun res!1053023 () Bool)

(assert (=> b!1535945 (=> (not res!1053023) (not e!854951))))

(declare-datatypes ((List!35709 0))(
  ( (Nil!35706) (Cons!35705 (h!37150 (_ BitVec 64)) (t!50403 List!35709)) )
))
(declare-fun arrayNoDuplicates!0 (array!102038 (_ BitVec 32) List!35709) Bool)

(assert (=> b!1535945 (= res!1053023 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35706))))

(declare-fun res!1053022 () Bool)

(assert (=> start!130940 (=> (not res!1053022) (not e!854951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130940 (= res!1053022 (validMask!0 mask!2480))))

(assert (=> start!130940 e!854951))

(assert (=> start!130940 true))

(declare-fun array_inv!38263 (array!102038) Bool)

(assert (=> start!130940 (array_inv!38263 a!2792)))

(declare-fun b!1535940 () Bool)

(declare-fun res!1053025 () Bool)

(assert (=> b!1535940 (=> (not res!1053025) (not e!854951))))

(assert (=> b!1535940 (= res!1053025 (validKeyInArray!0 (select (arr!49235 a!2792) i!951)))))

(assert (= (and start!130940 res!1053022) b!1535942))

(assert (= (and b!1535942 res!1053027) b!1535940))

(assert (= (and b!1535940 res!1053025) b!1535938))

(assert (= (and b!1535938 res!1053024) b!1535941))

(assert (= (and b!1535941 res!1053028) b!1535945))

(assert (= (and b!1535945 res!1053023) b!1535944))

(assert (= (and b!1535944 res!1053031) b!1535935))

(assert (= (and b!1535935 res!1053021) b!1535936))

(assert (= (and b!1535936 res!1053026) b!1535939))

(assert (= (and b!1535939 res!1053030) b!1535937))

(assert (= (and b!1535937 res!1053029) b!1535943))

(declare-fun m!1418385 () Bool)

(assert (=> b!1535935 m!1418385))

(assert (=> b!1535935 m!1418385))

(declare-fun m!1418387 () Bool)

(assert (=> b!1535935 m!1418387))

(declare-fun m!1418389 () Bool)

(assert (=> b!1535944 m!1418389))

(declare-fun m!1418391 () Bool)

(assert (=> b!1535939 m!1418391))

(assert (=> b!1535938 m!1418385))

(assert (=> b!1535938 m!1418385))

(declare-fun m!1418393 () Bool)

(assert (=> b!1535938 m!1418393))

(declare-fun m!1418395 () Bool)

(assert (=> b!1535940 m!1418395))

(assert (=> b!1535940 m!1418395))

(declare-fun m!1418397 () Bool)

(assert (=> b!1535940 m!1418397))

(assert (=> b!1535937 m!1418385))

(assert (=> b!1535937 m!1418385))

(declare-fun m!1418399 () Bool)

(assert (=> b!1535937 m!1418399))

(declare-fun m!1418401 () Bool)

(assert (=> b!1535941 m!1418401))

(declare-fun m!1418403 () Bool)

(assert (=> b!1535945 m!1418403))

(declare-fun m!1418405 () Bool)

(assert (=> start!130940 m!1418405))

(declare-fun m!1418407 () Bool)

(assert (=> start!130940 m!1418407))

(declare-fun m!1418409 () Bool)

(assert (=> b!1535943 m!1418409))

(declare-fun m!1418411 () Bool)

(assert (=> b!1535943 m!1418411))

(assert (=> b!1535943 m!1418411))

(declare-fun m!1418413 () Bool)

(assert (=> b!1535943 m!1418413))

(declare-fun m!1418415 () Bool)

(assert (=> b!1535943 m!1418415))

(declare-fun m!1418417 () Bool)

(assert (=> b!1535936 m!1418417))

(assert (=> b!1535936 m!1418385))

(push 1)

