; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131000 () Bool)

(assert start!131000)

(declare-fun b!1536934 () Bool)

(declare-fun res!1054022 () Bool)

(declare-fun e!855409 () Bool)

(assert (=> b!1536934 (=> (not res!1054022) (not e!855409))))

(declare-datatypes ((array!102098 0))(
  ( (array!102099 (arr!49265 (Array (_ BitVec 32) (_ BitVec 64))) (size!49815 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102098)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536934 (= res!1054022 (validKeyInArray!0 (select (arr!49265 a!2792) j!64)))))

(declare-fun b!1536935 () Bool)

(declare-fun res!1054025 () Bool)

(declare-fun e!855411 () Bool)

(assert (=> b!1536935 (=> (not res!1054025) (not e!855411))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536935 (= res!1054025 (not (= (select (arr!49265 a!2792) index!463) (select (arr!49265 a!2792) j!64))))))

(declare-fun b!1536936 () Bool)

(declare-fun res!1054027 () Bool)

(assert (=> b!1536936 (=> (not res!1054027) (not e!855409))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102098 (_ BitVec 32)) Bool)

(assert (=> b!1536936 (= res!1054027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536937 () Bool)

(declare-fun res!1054028 () Bool)

(assert (=> b!1536937 (=> (not res!1054028) (not e!855409))))

(declare-datatypes ((List!35739 0))(
  ( (Nil!35736) (Cons!35735 (h!37180 (_ BitVec 64)) (t!50433 List!35739)) )
))
(declare-fun arrayNoDuplicates!0 (array!102098 (_ BitVec 32) List!35739) Bool)

(assert (=> b!1536937 (= res!1054028 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35736))))

(declare-fun b!1536939 () Bool)

(assert (=> b!1536939 (= e!855409 e!855411)))

(declare-fun res!1054029 () Bool)

(assert (=> b!1536939 (=> (not res!1054029) (not e!855411))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13397 0))(
  ( (MissingZero!13397 (index!55983 (_ BitVec 32))) (Found!13397 (index!55984 (_ BitVec 32))) (Intermediate!13397 (undefined!14209 Bool) (index!55985 (_ BitVec 32)) (x!137719 (_ BitVec 32))) (Undefined!13397) (MissingVacant!13397 (index!55986 (_ BitVec 32))) )
))
(declare-fun lt!664533 () SeekEntryResult!13397)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102098 (_ BitVec 32)) SeekEntryResult!13397)

(assert (=> b!1536939 (= res!1054029 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49265 a!2792) j!64) a!2792 mask!2480) lt!664533))))

(assert (=> b!1536939 (= lt!664533 (Found!13397 j!64))))

(declare-fun b!1536940 () Bool)

(declare-fun res!1054030 () Bool)

(assert (=> b!1536940 (=> (not res!1054030) (not e!855409))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536940 (= res!1054030 (validKeyInArray!0 (select (arr!49265 a!2792) i!951)))))

(declare-fun res!1054026 () Bool)

(assert (=> start!131000 (=> (not res!1054026) (not e!855409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131000 (= res!1054026 (validMask!0 mask!2480))))

(assert (=> start!131000 e!855409))

(assert (=> start!131000 true))

(declare-fun array_inv!38293 (array!102098) Bool)

(assert (=> start!131000 (array_inv!38293 a!2792)))

(declare-fun b!1536938 () Bool)

(declare-fun res!1054024 () Bool)

(assert (=> b!1536938 (=> (not res!1054024) (not e!855409))))

(assert (=> b!1536938 (= res!1054024 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49815 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49815 a!2792)) (= (select (arr!49265 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536941 () Bool)

(declare-fun e!855410 () Bool)

(declare-fun e!855408 () Bool)

(assert (=> b!1536941 (= e!855410 e!855408)))

(declare-fun res!1054020 () Bool)

(assert (=> b!1536941 (=> (not res!1054020) (not e!855408))))

(declare-fun lt!664532 () SeekEntryResult!13397)

(assert (=> b!1536941 (= res!1054020 (= lt!664532 lt!664533))))

(declare-fun lt!664531 () (_ BitVec 32))

(assert (=> b!1536941 (= lt!664532 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664531 vacantIndex!5 (select (arr!49265 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536942 () Bool)

(declare-fun res!1054021 () Bool)

(assert (=> b!1536942 (=> (not res!1054021) (not e!855409))))

(assert (=> b!1536942 (= res!1054021 (and (= (size!49815 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49815 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49815 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536943 () Bool)

(assert (=> b!1536943 (= e!855408 (not true))))

(assert (=> b!1536943 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664531 vacantIndex!5 (select (store (arr!49265 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102099 (store (arr!49265 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49815 a!2792)) mask!2480) lt!664532)))

(declare-datatypes ((Unit!51366 0))(
  ( (Unit!51367) )
))
(declare-fun lt!664534 () Unit!51366)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51366)

(assert (=> b!1536943 (= lt!664534 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664531 vacantIndex!5 mask!2480))))

(declare-fun b!1536944 () Bool)

(assert (=> b!1536944 (= e!855411 e!855410)))

(declare-fun res!1054023 () Bool)

(assert (=> b!1536944 (=> (not res!1054023) (not e!855410))))

(assert (=> b!1536944 (= res!1054023 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664531 #b00000000000000000000000000000000) (bvslt lt!664531 (size!49815 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536944 (= lt!664531 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131000 res!1054026) b!1536942))

(assert (= (and b!1536942 res!1054021) b!1536940))

(assert (= (and b!1536940 res!1054030) b!1536934))

(assert (= (and b!1536934 res!1054022) b!1536936))

(assert (= (and b!1536936 res!1054027) b!1536937))

(assert (= (and b!1536937 res!1054028) b!1536938))

(assert (= (and b!1536938 res!1054024) b!1536939))

(assert (= (and b!1536939 res!1054029) b!1536935))

(assert (= (and b!1536935 res!1054025) b!1536944))

(assert (= (and b!1536944 res!1054023) b!1536941))

(assert (= (and b!1536941 res!1054020) b!1536943))

(declare-fun m!1419423 () Bool)

(assert (=> b!1536934 m!1419423))

(assert (=> b!1536934 m!1419423))

(declare-fun m!1419425 () Bool)

(assert (=> b!1536934 m!1419425))

(assert (=> b!1536941 m!1419423))

(assert (=> b!1536941 m!1419423))

(declare-fun m!1419427 () Bool)

(assert (=> b!1536941 m!1419427))

(declare-fun m!1419429 () Bool)

(assert (=> start!131000 m!1419429))

(declare-fun m!1419431 () Bool)

(assert (=> start!131000 m!1419431))

(assert (=> b!1536939 m!1419423))

(assert (=> b!1536939 m!1419423))

(declare-fun m!1419433 () Bool)

(assert (=> b!1536939 m!1419433))

(declare-fun m!1419435 () Bool)

(assert (=> b!1536943 m!1419435))

(declare-fun m!1419437 () Bool)

(assert (=> b!1536943 m!1419437))

(assert (=> b!1536943 m!1419437))

(declare-fun m!1419439 () Bool)

(assert (=> b!1536943 m!1419439))

(declare-fun m!1419441 () Bool)

(assert (=> b!1536943 m!1419441))

(declare-fun m!1419443 () Bool)

(assert (=> b!1536937 m!1419443))

(declare-fun m!1419445 () Bool)

(assert (=> b!1536940 m!1419445))

(assert (=> b!1536940 m!1419445))

(declare-fun m!1419447 () Bool)

(assert (=> b!1536940 m!1419447))

(declare-fun m!1419449 () Bool)

(assert (=> b!1536944 m!1419449))

(declare-fun m!1419451 () Bool)

(assert (=> b!1536936 m!1419451))

(declare-fun m!1419453 () Bool)

(assert (=> b!1536935 m!1419453))

(assert (=> b!1536935 m!1419423))

(declare-fun m!1419455 () Bool)

(assert (=> b!1536938 m!1419455))

(push 1)

