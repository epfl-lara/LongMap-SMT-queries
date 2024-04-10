; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131002 () Bool)

(assert start!131002)

(declare-fun res!1054059 () Bool)

(declare-fun e!855424 () Bool)

(assert (=> start!131002 (=> (not res!1054059) (not e!855424))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131002 (= res!1054059 (validMask!0 mask!2480))))

(assert (=> start!131002 e!855424))

(assert (=> start!131002 true))

(declare-datatypes ((array!102100 0))(
  ( (array!102101 (arr!49266 (Array (_ BitVec 32) (_ BitVec 64))) (size!49816 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102100)

(declare-fun array_inv!38294 (array!102100) Bool)

(assert (=> start!131002 (array_inv!38294 a!2792)))

(declare-fun b!1536967 () Bool)

(declare-fun res!1054056 () Bool)

(declare-fun e!855427 () Bool)

(assert (=> b!1536967 (=> (not res!1054056) (not e!855427))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536967 (= res!1054056 (not (= (select (arr!49266 a!2792) index!463) (select (arr!49266 a!2792) j!64))))))

(declare-fun b!1536968 () Bool)

(declare-fun e!855423 () Bool)

(assert (=> b!1536968 (= e!855427 e!855423)))

(declare-fun res!1054053 () Bool)

(assert (=> b!1536968 (=> (not res!1054053) (not e!855423))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664545 () (_ BitVec 32))

(assert (=> b!1536968 (= res!1054053 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664545 #b00000000000000000000000000000000) (bvslt lt!664545 (size!49816 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536968 (= lt!664545 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536969 () Bool)

(declare-fun res!1054062 () Bool)

(assert (=> b!1536969 (=> (not res!1054062) (not e!855424))))

(declare-datatypes ((List!35740 0))(
  ( (Nil!35737) (Cons!35736 (h!37181 (_ BitVec 64)) (t!50434 List!35740)) )
))
(declare-fun arrayNoDuplicates!0 (array!102100 (_ BitVec 32) List!35740) Bool)

(assert (=> b!1536969 (= res!1054062 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35737))))

(declare-fun b!1536970 () Bool)

(declare-fun res!1054058 () Bool)

(assert (=> b!1536970 (=> (not res!1054058) (not e!855424))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536970 (= res!1054058 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49816 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49816 a!2792)) (= (select (arr!49266 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536971 () Bool)

(assert (=> b!1536971 (= e!855424 e!855427)))

(declare-fun res!1054055 () Bool)

(assert (=> b!1536971 (=> (not res!1054055) (not e!855427))))

(declare-datatypes ((SeekEntryResult!13398 0))(
  ( (MissingZero!13398 (index!55987 (_ BitVec 32))) (Found!13398 (index!55988 (_ BitVec 32))) (Intermediate!13398 (undefined!14210 Bool) (index!55989 (_ BitVec 32)) (x!137720 (_ BitVec 32))) (Undefined!13398) (MissingVacant!13398 (index!55990 (_ BitVec 32))) )
))
(declare-fun lt!664546 () SeekEntryResult!13398)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102100 (_ BitVec 32)) SeekEntryResult!13398)

(assert (=> b!1536971 (= res!1054055 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49266 a!2792) j!64) a!2792 mask!2480) lt!664546))))

(assert (=> b!1536971 (= lt!664546 (Found!13398 j!64))))

(declare-fun b!1536972 () Bool)

(declare-fun res!1054060 () Bool)

(assert (=> b!1536972 (=> (not res!1054060) (not e!855424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536972 (= res!1054060 (validKeyInArray!0 (select (arr!49266 a!2792) j!64)))))

(declare-fun b!1536973 () Bool)

(declare-fun e!855426 () Bool)

(assert (=> b!1536973 (= e!855426 (not true))))

(declare-fun lt!664544 () SeekEntryResult!13398)

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536973 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664545 vacantIndex!5 (select (store (arr!49266 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102101 (store (arr!49266 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49816 a!2792)) mask!2480) lt!664544)))

(declare-datatypes ((Unit!51368 0))(
  ( (Unit!51369) )
))
(declare-fun lt!664543 () Unit!51368)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51368)

(assert (=> b!1536973 (= lt!664543 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664545 vacantIndex!5 mask!2480))))

(declare-fun b!1536974 () Bool)

(assert (=> b!1536974 (= e!855423 e!855426)))

(declare-fun res!1054061 () Bool)

(assert (=> b!1536974 (=> (not res!1054061) (not e!855426))))

(assert (=> b!1536974 (= res!1054061 (= lt!664544 lt!664546))))

(assert (=> b!1536974 (= lt!664544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664545 vacantIndex!5 (select (arr!49266 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536975 () Bool)

(declare-fun res!1054054 () Bool)

(assert (=> b!1536975 (=> (not res!1054054) (not e!855424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102100 (_ BitVec 32)) Bool)

(assert (=> b!1536975 (= res!1054054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536976 () Bool)

(declare-fun res!1054063 () Bool)

(assert (=> b!1536976 (=> (not res!1054063) (not e!855424))))

(assert (=> b!1536976 (= res!1054063 (and (= (size!49816 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49816 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49816 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536977 () Bool)

(declare-fun res!1054057 () Bool)

(assert (=> b!1536977 (=> (not res!1054057) (not e!855424))))

(assert (=> b!1536977 (= res!1054057 (validKeyInArray!0 (select (arr!49266 a!2792) i!951)))))

(assert (= (and start!131002 res!1054059) b!1536976))

(assert (= (and b!1536976 res!1054063) b!1536977))

(assert (= (and b!1536977 res!1054057) b!1536972))

(assert (= (and b!1536972 res!1054060) b!1536975))

(assert (= (and b!1536975 res!1054054) b!1536969))

(assert (= (and b!1536969 res!1054062) b!1536970))

(assert (= (and b!1536970 res!1054058) b!1536971))

(assert (= (and b!1536971 res!1054055) b!1536967))

(assert (= (and b!1536967 res!1054056) b!1536968))

(assert (= (and b!1536968 res!1054053) b!1536974))

(assert (= (and b!1536974 res!1054061) b!1536973))

(declare-fun m!1419457 () Bool)

(assert (=> b!1536970 m!1419457))

(declare-fun m!1419459 () Bool)

(assert (=> b!1536973 m!1419459))

(declare-fun m!1419461 () Bool)

(assert (=> b!1536973 m!1419461))

(assert (=> b!1536973 m!1419461))

(declare-fun m!1419463 () Bool)

(assert (=> b!1536973 m!1419463))

(declare-fun m!1419465 () Bool)

(assert (=> b!1536973 m!1419465))

(declare-fun m!1419467 () Bool)

(assert (=> b!1536969 m!1419467))

(declare-fun m!1419469 () Bool)

(assert (=> b!1536977 m!1419469))

(assert (=> b!1536977 m!1419469))

(declare-fun m!1419471 () Bool)

(assert (=> b!1536977 m!1419471))

(declare-fun m!1419473 () Bool)

(assert (=> b!1536967 m!1419473))

(declare-fun m!1419475 () Bool)

(assert (=> b!1536967 m!1419475))

(assert (=> b!1536971 m!1419475))

(assert (=> b!1536971 m!1419475))

(declare-fun m!1419477 () Bool)

(assert (=> b!1536971 m!1419477))

(declare-fun m!1419479 () Bool)

(assert (=> b!1536968 m!1419479))

(assert (=> b!1536972 m!1419475))

(assert (=> b!1536972 m!1419475))

(declare-fun m!1419481 () Bool)

(assert (=> b!1536972 m!1419481))

(declare-fun m!1419483 () Bool)

(assert (=> b!1536975 m!1419483))

(declare-fun m!1419485 () Bool)

(assert (=> start!131002 m!1419485))

(declare-fun m!1419487 () Bool)

(assert (=> start!131002 m!1419487))

(assert (=> b!1536974 m!1419475))

(assert (=> b!1536974 m!1419475))

(declare-fun m!1419489 () Bool)

(assert (=> b!1536974 m!1419489))

(check-sat (not b!1536974) (not start!131002) (not b!1536977) (not b!1536969) (not b!1536973) (not b!1536975) (not b!1536968) (not b!1536971) (not b!1536972))
(check-sat)
