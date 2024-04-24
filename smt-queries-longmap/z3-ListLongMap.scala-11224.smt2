; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131394 () Bool)

(assert start!131394)

(declare-fun b!1538965 () Bool)

(declare-fun res!1054482 () Bool)

(declare-fun e!856730 () Bool)

(assert (=> b!1538965 (=> (not res!1054482) (not e!856730))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((array!102196 0))(
  ( (array!102197 (arr!49306 (Array (_ BitVec 32) (_ BitVec 64))) (size!49857 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102196)

(assert (=> b!1538965 (= res!1054482 (not (= (select (arr!49306 a!2792) index!463) (select (arr!49306 a!2792) j!64))))))

(declare-fun b!1538966 () Bool)

(declare-fun res!1054477 () Bool)

(declare-fun e!856729 () Bool)

(assert (=> b!1538966 (=> (not res!1054477) (not e!856729))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538966 (= res!1054477 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49857 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49857 a!2792)) (= (select (arr!49306 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054479 () Bool)

(assert (=> start!131394 (=> (not res!1054479) (not e!856729))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131394 (= res!1054479 (validMask!0 mask!2480))))

(assert (=> start!131394 e!856729))

(assert (=> start!131394 true))

(declare-fun array_inv!38587 (array!102196) Bool)

(assert (=> start!131394 (array_inv!38587 a!2792)))

(declare-fun b!1538967 () Bool)

(declare-fun e!856728 () Bool)

(assert (=> b!1538967 (= e!856730 e!856728)))

(declare-fun res!1054483 () Bool)

(assert (=> b!1538967 (=> (not res!1054483) (not e!856728))))

(declare-fun lt!665290 () (_ BitVec 32))

(assert (=> b!1538967 (= res!1054483 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665290 #b00000000000000000000000000000000) (bvslt lt!665290 (size!49857 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538967 (= lt!665290 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538968 () Bool)

(declare-fun res!1054485 () Bool)

(assert (=> b!1538968 (=> (not res!1054485) (not e!856729))))

(declare-datatypes ((List!35767 0))(
  ( (Nil!35764) (Cons!35763 (h!37226 (_ BitVec 64)) (t!50453 List!35767)) )
))
(declare-fun arrayNoDuplicates!0 (array!102196 (_ BitVec 32) List!35767) Bool)

(assert (=> b!1538968 (= res!1054485 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35764))))

(declare-fun b!1538969 () Bool)

(declare-fun e!856732 () Bool)

(assert (=> b!1538969 (= e!856728 e!856732)))

(declare-fun res!1054475 () Bool)

(assert (=> b!1538969 (=> (not res!1054475) (not e!856732))))

(declare-datatypes ((SeekEntryResult!13333 0))(
  ( (MissingZero!13333 (index!55727 (_ BitVec 32))) (Found!13333 (index!55728 (_ BitVec 32))) (Intermediate!13333 (undefined!14145 Bool) (index!55729 (_ BitVec 32)) (x!137673 (_ BitVec 32))) (Undefined!13333) (MissingVacant!13333 (index!55730 (_ BitVec 32))) )
))
(declare-fun lt!665292 () SeekEntryResult!13333)

(declare-fun lt!665289 () SeekEntryResult!13333)

(assert (=> b!1538969 (= res!1054475 (= lt!665292 lt!665289))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102196 (_ BitVec 32)) SeekEntryResult!13333)

(assert (=> b!1538969 (= lt!665292 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665290 vacantIndex!5 (select (arr!49306 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538970 () Bool)

(declare-fun res!1054480 () Bool)

(assert (=> b!1538970 (=> (not res!1054480) (not e!856729))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538970 (= res!1054480 (and (= (size!49857 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49857 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49857 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538971 () Bool)

(assert (=> b!1538971 (= e!856729 e!856730)))

(declare-fun res!1054481 () Bool)

(assert (=> b!1538971 (=> (not res!1054481) (not e!856730))))

(assert (=> b!1538971 (= res!1054481 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49306 a!2792) j!64) a!2792 mask!2480) lt!665289))))

(assert (=> b!1538971 (= lt!665289 (Found!13333 j!64))))

(declare-fun b!1538972 () Bool)

(declare-fun res!1054476 () Bool)

(assert (=> b!1538972 (=> (not res!1054476) (not e!856729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538972 (= res!1054476 (validKeyInArray!0 (select (arr!49306 a!2792) i!951)))))

(declare-fun b!1538973 () Bool)

(assert (=> b!1538973 (= e!856732 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49306 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1538973 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665290 vacantIndex!5 (select (store (arr!49306 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102197 (store (arr!49306 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49857 a!2792)) mask!2480) lt!665292)))

(declare-datatypes ((Unit!51275 0))(
  ( (Unit!51276) )
))
(declare-fun lt!665291 () Unit!51275)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51275)

(assert (=> b!1538973 (= lt!665291 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665290 vacantIndex!5 mask!2480))))

(declare-fun b!1538974 () Bool)

(declare-fun res!1054484 () Bool)

(assert (=> b!1538974 (=> (not res!1054484) (not e!856729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102196 (_ BitVec 32)) Bool)

(assert (=> b!1538974 (= res!1054484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538975 () Bool)

(declare-fun res!1054478 () Bool)

(assert (=> b!1538975 (=> (not res!1054478) (not e!856729))))

(assert (=> b!1538975 (= res!1054478 (validKeyInArray!0 (select (arr!49306 a!2792) j!64)))))

(assert (= (and start!131394 res!1054479) b!1538970))

(assert (= (and b!1538970 res!1054480) b!1538972))

(assert (= (and b!1538972 res!1054476) b!1538975))

(assert (= (and b!1538975 res!1054478) b!1538974))

(assert (= (and b!1538974 res!1054484) b!1538968))

(assert (= (and b!1538968 res!1054485) b!1538966))

(assert (= (and b!1538966 res!1054477) b!1538971))

(assert (= (and b!1538971 res!1054481) b!1538965))

(assert (= (and b!1538965 res!1054482) b!1538967))

(assert (= (and b!1538967 res!1054483) b!1538969))

(assert (= (and b!1538969 res!1054475) b!1538973))

(declare-fun m!1421233 () Bool)

(assert (=> b!1538965 m!1421233))

(declare-fun m!1421235 () Bool)

(assert (=> b!1538965 m!1421235))

(declare-fun m!1421237 () Bool)

(assert (=> b!1538972 m!1421237))

(assert (=> b!1538972 m!1421237))

(declare-fun m!1421239 () Bool)

(assert (=> b!1538972 m!1421239))

(declare-fun m!1421241 () Bool)

(assert (=> b!1538973 m!1421241))

(declare-fun m!1421243 () Bool)

(assert (=> b!1538973 m!1421243))

(declare-fun m!1421245 () Bool)

(assert (=> b!1538973 m!1421245))

(declare-fun m!1421247 () Bool)

(assert (=> b!1538973 m!1421247))

(assert (=> b!1538973 m!1421243))

(declare-fun m!1421249 () Bool)

(assert (=> b!1538973 m!1421249))

(declare-fun m!1421251 () Bool)

(assert (=> b!1538967 m!1421251))

(declare-fun m!1421253 () Bool)

(assert (=> start!131394 m!1421253))

(declare-fun m!1421255 () Bool)

(assert (=> start!131394 m!1421255))

(assert (=> b!1538969 m!1421235))

(assert (=> b!1538969 m!1421235))

(declare-fun m!1421257 () Bool)

(assert (=> b!1538969 m!1421257))

(declare-fun m!1421259 () Bool)

(assert (=> b!1538968 m!1421259))

(assert (=> b!1538975 m!1421235))

(assert (=> b!1538975 m!1421235))

(declare-fun m!1421261 () Bool)

(assert (=> b!1538975 m!1421261))

(declare-fun m!1421263 () Bool)

(assert (=> b!1538966 m!1421263))

(declare-fun m!1421265 () Bool)

(assert (=> b!1538974 m!1421265))

(assert (=> b!1538971 m!1421235))

(assert (=> b!1538971 m!1421235))

(declare-fun m!1421267 () Bool)

(assert (=> b!1538971 m!1421267))

(check-sat (not b!1538968) (not b!1538974) (not b!1538969) (not b!1538973) (not b!1538975) (not b!1538972) (not b!1538971) (not start!131394) (not b!1538967))
(check-sat)
