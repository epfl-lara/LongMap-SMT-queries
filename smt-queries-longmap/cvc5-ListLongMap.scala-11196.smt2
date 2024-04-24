; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131194 () Bool)

(assert start!131194)

(declare-fun b!1536425 () Bool)

(declare-fun res!1052029 () Bool)

(declare-fun e!855835 () Bool)

(assert (=> b!1536425 (=> (not res!1052029) (not e!855835))))

(declare-datatypes ((array!102029 0))(
  ( (array!102030 (arr!49224 (Array (_ BitVec 32) (_ BitVec 64))) (size!49775 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102029)

(declare-datatypes ((List!35685 0))(
  ( (Nil!35682) (Cons!35681 (h!37144 (_ BitVec 64)) (t!50371 List!35685)) )
))
(declare-fun arrayNoDuplicates!0 (array!102029 (_ BitVec 32) List!35685) Bool)

(assert (=> b!1536425 (= res!1052029 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35682))))

(declare-fun res!1052026 () Bool)

(assert (=> start!131194 (=> (not res!1052026) (not e!855835))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131194 (= res!1052026 (validMask!0 mask!2480))))

(assert (=> start!131194 e!855835))

(assert (=> start!131194 true))

(declare-fun array_inv!38505 (array!102029) Bool)

(assert (=> start!131194 (array_inv!38505 a!2792)))

(declare-fun b!1536426 () Bool)

(declare-fun res!1052025 () Bool)

(assert (=> b!1536426 (=> (not res!1052025) (not e!855835))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536426 (= res!1052025 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49775 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49775 a!2792)) (= (select (arr!49224 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536427 () Bool)

(declare-fun res!1052027 () Bool)

(assert (=> b!1536427 (=> (not res!1052027) (not e!855835))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536427 (= res!1052027 (validKeyInArray!0 (select (arr!49224 a!2792) i!951)))))

(declare-fun b!1536428 () Bool)

(declare-fun res!1052031 () Bool)

(assert (=> b!1536428 (=> (not res!1052031) (not e!855835))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536428 (= res!1052031 (and (= (size!49775 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49775 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49775 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536429 () Bool)

(declare-fun res!1052030 () Bool)

(assert (=> b!1536429 (=> (not res!1052030) (not e!855835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102029 (_ BitVec 32)) Bool)

(assert (=> b!1536429 (= res!1052030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536430 () Bool)

(declare-fun res!1052028 () Bool)

(assert (=> b!1536430 (=> (not res!1052028) (not e!855835))))

(assert (=> b!1536430 (= res!1052028 (validKeyInArray!0 (select (arr!49224 a!2792) j!64)))))

(declare-fun b!1536431 () Bool)

(assert (=> b!1536431 (= e!855835 false)))

(declare-datatypes ((SeekEntryResult!13251 0))(
  ( (MissingZero!13251 (index!55399 (_ BitVec 32))) (Found!13251 (index!55400 (_ BitVec 32))) (Intermediate!13251 (undefined!14063 Bool) (index!55401 (_ BitVec 32)) (x!137364 (_ BitVec 32))) (Undefined!13251) (MissingVacant!13251 (index!55402 (_ BitVec 32))) )
))
(declare-fun lt!664713 () SeekEntryResult!13251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102029 (_ BitVec 32)) SeekEntryResult!13251)

(assert (=> b!1536431 (= lt!664713 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49224 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131194 res!1052026) b!1536428))

(assert (= (and b!1536428 res!1052031) b!1536427))

(assert (= (and b!1536427 res!1052027) b!1536430))

(assert (= (and b!1536430 res!1052028) b!1536429))

(assert (= (and b!1536429 res!1052030) b!1536425))

(assert (= (and b!1536425 res!1052029) b!1536426))

(assert (= (and b!1536426 res!1052025) b!1536431))

(declare-fun m!1418963 () Bool)

(assert (=> b!1536430 m!1418963))

(assert (=> b!1536430 m!1418963))

(declare-fun m!1418965 () Bool)

(assert (=> b!1536430 m!1418965))

(declare-fun m!1418967 () Bool)

(assert (=> b!1536429 m!1418967))

(declare-fun m!1418969 () Bool)

(assert (=> b!1536427 m!1418969))

(assert (=> b!1536427 m!1418969))

(declare-fun m!1418971 () Bool)

(assert (=> b!1536427 m!1418971))

(declare-fun m!1418973 () Bool)

(assert (=> b!1536426 m!1418973))

(declare-fun m!1418975 () Bool)

(assert (=> start!131194 m!1418975))

(declare-fun m!1418977 () Bool)

(assert (=> start!131194 m!1418977))

(assert (=> b!1536431 m!1418963))

(assert (=> b!1536431 m!1418963))

(declare-fun m!1418979 () Bool)

(assert (=> b!1536431 m!1418979))

(declare-fun m!1418981 () Bool)

(assert (=> b!1536425 m!1418981))

(push 1)

(assert (not b!1536430))

(assert (not b!1536425))

(assert (not b!1536431))

(assert (not start!131194))

(assert (not b!1536429))

(assert (not b!1536427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

