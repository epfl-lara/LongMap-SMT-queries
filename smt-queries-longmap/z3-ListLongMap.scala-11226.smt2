; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130938 () Bool)

(assert start!130938)

(declare-fun b!1536423 () Bool)

(declare-fun res!1053696 () Bool)

(declare-fun e!855124 () Bool)

(assert (=> b!1536423 (=> (not res!1053696) (not e!855124))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102034 0))(
  ( (array!102035 (arr!49234 (Array (_ BitVec 32) (_ BitVec 64))) (size!49786 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102034)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536423 (= res!1053696 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49786 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49786 a!2792)) (= (select (arr!49234 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536424 () Bool)

(declare-fun e!855123 () Bool)

(declare-fun e!855120 () Bool)

(assert (=> b!1536424 (= e!855123 e!855120)))

(declare-fun res!1053700 () Bool)

(assert (=> b!1536424 (=> (not res!1053700) (not e!855120))))

(declare-datatypes ((SeekEntryResult!13391 0))(
  ( (MissingZero!13391 (index!55959 (_ BitVec 32))) (Found!13391 (index!55960 (_ BitVec 32))) (Intermediate!13391 (undefined!14203 Bool) (index!55961 (_ BitVec 32)) (x!137692 (_ BitVec 32))) (Undefined!13391) (MissingVacant!13391 (index!55962 (_ BitVec 32))) )
))
(declare-fun lt!664174 () SeekEntryResult!13391)

(declare-fun lt!664175 () SeekEntryResult!13391)

(assert (=> b!1536424 (= res!1053700 (= lt!664174 lt!664175))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664176 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102034 (_ BitVec 32)) SeekEntryResult!13391)

(assert (=> b!1536424 (= lt!664174 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664176 vacantIndex!5 (select (arr!49234 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536425 () Bool)

(declare-fun res!1053693 () Bool)

(declare-fun e!855121 () Bool)

(assert (=> b!1536425 (=> (not res!1053693) (not e!855121))))

(assert (=> b!1536425 (= res!1053693 (not (= (select (arr!49234 a!2792) index!463) (select (arr!49234 a!2792) j!64))))))

(declare-fun b!1536426 () Bool)

(declare-fun res!1053698 () Bool)

(assert (=> b!1536426 (=> (not res!1053698) (not e!855124))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536426 (= res!1053698 (and (= (size!49786 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49786 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49786 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536427 () Bool)

(assert (=> b!1536427 (= e!855124 e!855121)))

(declare-fun res!1053703 () Bool)

(assert (=> b!1536427 (=> (not res!1053703) (not e!855121))))

(assert (=> b!1536427 (= res!1053703 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49234 a!2792) j!64) a!2792 mask!2480) lt!664175))))

(assert (=> b!1536427 (= lt!664175 (Found!13391 j!64))))

(declare-fun b!1536428 () Bool)

(declare-fun res!1053702 () Bool)

(assert (=> b!1536428 (=> (not res!1053702) (not e!855124))))

(declare-datatypes ((List!35786 0))(
  ( (Nil!35783) (Cons!35782 (h!37228 (_ BitVec 64)) (t!50472 List!35786)) )
))
(declare-fun arrayNoDuplicates!0 (array!102034 (_ BitVec 32) List!35786) Bool)

(assert (=> b!1536428 (= res!1053702 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35783))))

(declare-fun res!1053695 () Bool)

(assert (=> start!130938 (=> (not res!1053695) (not e!855124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130938 (= res!1053695 (validMask!0 mask!2480))))

(assert (=> start!130938 e!855124))

(assert (=> start!130938 true))

(declare-fun array_inv!38467 (array!102034) Bool)

(assert (=> start!130938 (array_inv!38467 a!2792)))

(declare-fun b!1536429 () Bool)

(assert (=> b!1536429 (= e!855120 (not true))))

(assert (=> b!1536429 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664176 vacantIndex!5 (select (store (arr!49234 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102035 (store (arr!49234 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49786 a!2792)) mask!2480) lt!664174)))

(declare-datatypes ((Unit!51189 0))(
  ( (Unit!51190) )
))
(declare-fun lt!664173 () Unit!51189)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51189)

(assert (=> b!1536429 (= lt!664173 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664176 vacantIndex!5 mask!2480))))

(declare-fun b!1536430 () Bool)

(declare-fun res!1053699 () Bool)

(assert (=> b!1536430 (=> (not res!1053699) (not e!855124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536430 (= res!1053699 (validKeyInArray!0 (select (arr!49234 a!2792) j!64)))))

(declare-fun b!1536431 () Bool)

(declare-fun res!1053694 () Bool)

(assert (=> b!1536431 (=> (not res!1053694) (not e!855124))))

(assert (=> b!1536431 (= res!1053694 (validKeyInArray!0 (select (arr!49234 a!2792) i!951)))))

(declare-fun b!1536432 () Bool)

(assert (=> b!1536432 (= e!855121 e!855123)))

(declare-fun res!1053701 () Bool)

(assert (=> b!1536432 (=> (not res!1053701) (not e!855123))))

(assert (=> b!1536432 (= res!1053701 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664176 #b00000000000000000000000000000000) (bvslt lt!664176 (size!49786 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536432 (= lt!664176 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536433 () Bool)

(declare-fun res!1053697 () Bool)

(assert (=> b!1536433 (=> (not res!1053697) (not e!855124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102034 (_ BitVec 32)) Bool)

(assert (=> b!1536433 (= res!1053697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130938 res!1053695) b!1536426))

(assert (= (and b!1536426 res!1053698) b!1536431))

(assert (= (and b!1536431 res!1053694) b!1536430))

(assert (= (and b!1536430 res!1053699) b!1536433))

(assert (= (and b!1536433 res!1053697) b!1536428))

(assert (= (and b!1536428 res!1053702) b!1536423))

(assert (= (and b!1536423 res!1053696) b!1536427))

(assert (= (and b!1536427 res!1053703) b!1536425))

(assert (= (and b!1536425 res!1053693) b!1536432))

(assert (= (and b!1536432 res!1053701) b!1536424))

(assert (= (and b!1536424 res!1053700) b!1536429))

(declare-fun m!1418327 () Bool)

(assert (=> b!1536424 m!1418327))

(assert (=> b!1536424 m!1418327))

(declare-fun m!1418329 () Bool)

(assert (=> b!1536424 m!1418329))

(declare-fun m!1418331 () Bool)

(assert (=> b!1536433 m!1418331))

(declare-fun m!1418333 () Bool)

(assert (=> b!1536432 m!1418333))

(assert (=> b!1536430 m!1418327))

(assert (=> b!1536430 m!1418327))

(declare-fun m!1418335 () Bool)

(assert (=> b!1536430 m!1418335))

(declare-fun m!1418337 () Bool)

(assert (=> b!1536428 m!1418337))

(declare-fun m!1418339 () Bool)

(assert (=> b!1536423 m!1418339))

(declare-fun m!1418341 () Bool)

(assert (=> b!1536429 m!1418341))

(declare-fun m!1418343 () Bool)

(assert (=> b!1536429 m!1418343))

(assert (=> b!1536429 m!1418343))

(declare-fun m!1418345 () Bool)

(assert (=> b!1536429 m!1418345))

(declare-fun m!1418347 () Bool)

(assert (=> b!1536429 m!1418347))

(declare-fun m!1418349 () Bool)

(assert (=> b!1536425 m!1418349))

(assert (=> b!1536425 m!1418327))

(declare-fun m!1418351 () Bool)

(assert (=> b!1536431 m!1418351))

(assert (=> b!1536431 m!1418351))

(declare-fun m!1418353 () Bool)

(assert (=> b!1536431 m!1418353))

(declare-fun m!1418355 () Bool)

(assert (=> start!130938 m!1418355))

(declare-fun m!1418357 () Bool)

(assert (=> start!130938 m!1418357))

(assert (=> b!1536427 m!1418327))

(assert (=> b!1536427 m!1418327))

(declare-fun m!1418359 () Bool)

(assert (=> b!1536427 m!1418359))

(check-sat (not b!1536431) (not b!1536430) (not b!1536424) (not start!130938) (not b!1536433) (not b!1536429) (not b!1536428) (not b!1536427) (not b!1536432))
(check-sat)
