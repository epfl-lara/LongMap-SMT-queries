; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130950 () Bool)

(assert start!130950)

(declare-fun b!1536100 () Bool)

(declare-fun e!855027 () Bool)

(declare-fun e!855026 () Bool)

(assert (=> b!1536100 (= e!855027 e!855026)))

(declare-fun res!1053192 () Bool)

(assert (=> b!1536100 (=> (not res!1053192) (not e!855026))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102048 0))(
  ( (array!102049 (arr!49240 (Array (_ BitVec 32) (_ BitVec 64))) (size!49790 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102048)

(declare-fun lt!664224 () (_ BitVec 32))

(assert (=> b!1536100 (= res!1053192 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664224 #b00000000000000000000000000000000) (bvslt lt!664224 (size!49790 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536100 (= lt!664224 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536101 () Bool)

(declare-fun res!1053193 () Bool)

(declare-fun e!855024 () Bool)

(assert (=> b!1536101 (=> (not res!1053193) (not e!855024))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536101 (= res!1053193 (validKeyInArray!0 (select (arr!49240 a!2792) j!64)))))

(declare-fun b!1536102 () Bool)

(declare-fun res!1053189 () Bool)

(assert (=> b!1536102 (=> (not res!1053189) (not e!855027))))

(assert (=> b!1536102 (= res!1053189 (not (= (select (arr!49240 a!2792) index!463) (select (arr!49240 a!2792) j!64))))))

(declare-fun b!1536103 () Bool)

(declare-fun res!1053195 () Bool)

(assert (=> b!1536103 (=> (not res!1053195) (not e!855024))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536103 (= res!1053195 (validKeyInArray!0 (select (arr!49240 a!2792) i!951)))))

(declare-fun b!1536104 () Bool)

(declare-fun e!855028 () Bool)

(assert (=> b!1536104 (= e!855026 e!855028)))

(declare-fun res!1053190 () Bool)

(assert (=> b!1536104 (=> (not res!1053190) (not e!855028))))

(declare-datatypes ((SeekEntryResult!13372 0))(
  ( (MissingZero!13372 (index!55883 (_ BitVec 32))) (Found!13372 (index!55884 (_ BitVec 32))) (Intermediate!13372 (undefined!14184 Bool) (index!55885 (_ BitVec 32)) (x!137622 (_ BitVec 32))) (Undefined!13372) (MissingVacant!13372 (index!55886 (_ BitVec 32))) )
))
(declare-fun lt!664225 () SeekEntryResult!13372)

(declare-fun lt!664222 () SeekEntryResult!13372)

(assert (=> b!1536104 (= res!1053190 (= lt!664225 lt!664222))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102048 (_ BitVec 32)) SeekEntryResult!13372)

(assert (=> b!1536104 (= lt!664225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664224 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1053188 () Bool)

(assert (=> start!130950 (=> (not res!1053188) (not e!855024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130950 (= res!1053188 (validMask!0 mask!2480))))

(assert (=> start!130950 e!855024))

(assert (=> start!130950 true))

(declare-fun array_inv!38268 (array!102048) Bool)

(assert (=> start!130950 (array_inv!38268 a!2792)))

(declare-fun b!1536105 () Bool)

(assert (=> b!1536105 (= e!855024 e!855027)))

(declare-fun res!1053191 () Bool)

(assert (=> b!1536105 (=> (not res!1053191) (not e!855027))))

(assert (=> b!1536105 (= res!1053191 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480) lt!664222))))

(assert (=> b!1536105 (= lt!664222 (Found!13372 j!64))))

(declare-fun b!1536106 () Bool)

(declare-fun res!1053196 () Bool)

(assert (=> b!1536106 (=> (not res!1053196) (not e!855024))))

(assert (=> b!1536106 (= res!1053196 (and (= (size!49790 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49790 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49790 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536107 () Bool)

(declare-fun res!1053187 () Bool)

(assert (=> b!1536107 (=> (not res!1053187) (not e!855024))))

(assert (=> b!1536107 (= res!1053187 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49790 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49790 a!2792)) (= (select (arr!49240 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536108 () Bool)

(declare-fun res!1053186 () Bool)

(assert (=> b!1536108 (=> (not res!1053186) (not e!855024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102048 (_ BitVec 32)) Bool)

(assert (=> b!1536108 (= res!1053186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536109 () Bool)

(declare-fun res!1053194 () Bool)

(assert (=> b!1536109 (=> (not res!1053194) (not e!855024))))

(declare-datatypes ((List!35714 0))(
  ( (Nil!35711) (Cons!35710 (h!37155 (_ BitVec 64)) (t!50408 List!35714)) )
))
(declare-fun arrayNoDuplicates!0 (array!102048 (_ BitVec 32) List!35714) Bool)

(assert (=> b!1536109 (= res!1053194 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35711))))

(declare-fun b!1536110 () Bool)

(assert (=> b!1536110 (= e!855028 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1536110 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664224 vacantIndex!5 (select (store (arr!49240 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102049 (store (arr!49240 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49790 a!2792)) mask!2480) lt!664225)))

(declare-datatypes ((Unit!51316 0))(
  ( (Unit!51317) )
))
(declare-fun lt!664223 () Unit!51316)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51316)

(assert (=> b!1536110 (= lt!664223 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664224 vacantIndex!5 mask!2480))))

(assert (= (and start!130950 res!1053188) b!1536106))

(assert (= (and b!1536106 res!1053196) b!1536103))

(assert (= (and b!1536103 res!1053195) b!1536101))

(assert (= (and b!1536101 res!1053193) b!1536108))

(assert (= (and b!1536108 res!1053186) b!1536109))

(assert (= (and b!1536109 res!1053194) b!1536107))

(assert (= (and b!1536107 res!1053187) b!1536105))

(assert (= (and b!1536105 res!1053191) b!1536102))

(assert (= (and b!1536102 res!1053189) b!1536100))

(assert (= (and b!1536100 res!1053192) b!1536104))

(assert (= (and b!1536104 res!1053190) b!1536110))

(declare-fun m!1418555 () Bool)

(assert (=> start!130950 m!1418555))

(declare-fun m!1418557 () Bool)

(assert (=> start!130950 m!1418557))

(declare-fun m!1418559 () Bool)

(assert (=> b!1536105 m!1418559))

(assert (=> b!1536105 m!1418559))

(declare-fun m!1418561 () Bool)

(assert (=> b!1536105 m!1418561))

(assert (=> b!1536104 m!1418559))

(assert (=> b!1536104 m!1418559))

(declare-fun m!1418563 () Bool)

(assert (=> b!1536104 m!1418563))

(declare-fun m!1418565 () Bool)

(assert (=> b!1536100 m!1418565))

(declare-fun m!1418567 () Bool)

(assert (=> b!1536110 m!1418567))

(declare-fun m!1418569 () Bool)

(assert (=> b!1536110 m!1418569))

(assert (=> b!1536110 m!1418569))

(declare-fun m!1418571 () Bool)

(assert (=> b!1536110 m!1418571))

(declare-fun m!1418573 () Bool)

(assert (=> b!1536110 m!1418573))

(declare-fun m!1418575 () Bool)

(assert (=> b!1536108 m!1418575))

(declare-fun m!1418577 () Bool)

(assert (=> b!1536109 m!1418577))

(declare-fun m!1418579 () Bool)

(assert (=> b!1536102 m!1418579))

(assert (=> b!1536102 m!1418559))

(assert (=> b!1536101 m!1418559))

(assert (=> b!1536101 m!1418559))

(declare-fun m!1418581 () Bool)

(assert (=> b!1536101 m!1418581))

(declare-fun m!1418583 () Bool)

(assert (=> b!1536107 m!1418583))

(declare-fun m!1418585 () Bool)

(assert (=> b!1536103 m!1418585))

(assert (=> b!1536103 m!1418585))

(declare-fun m!1418587 () Bool)

(assert (=> b!1536103 m!1418587))

(push 1)

(assert (not b!1536104))

(assert (not start!130950))

(assert (not b!1536105))

(assert (not b!1536103))

(assert (not b!1536109))

(assert (not b!1536101))

(assert (not b!1536108))

(assert (not b!1536100))

(assert (not b!1536110))

(check-sat)

