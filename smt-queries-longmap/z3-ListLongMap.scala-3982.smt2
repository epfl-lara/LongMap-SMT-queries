; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53946 () Bool)

(assert start!53946)

(declare-fun b!588978 () Bool)

(declare-fun res!376672 () Bool)

(declare-fun e!336252 () Bool)

(assert (=> b!588978 (=> (not res!376672) (not e!336252))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588978 (= res!376672 (validKeyInArray!0 k0!1786))))

(declare-fun res!376663 () Bool)

(assert (=> start!53946 (=> (not res!376663) (not e!336252))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53946 (= res!376663 (validMask!0 mask!3053))))

(assert (=> start!53946 e!336252))

(assert (=> start!53946 true))

(declare-datatypes ((array!36804 0))(
  ( (array!36805 (arr!17675 (Array (_ BitVec 32) (_ BitVec 64))) (size!18040 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36804)

(declare-fun array_inv!13558 (array!36804) Bool)

(assert (=> start!53946 (array_inv!13558 a!2986)))

(declare-fun b!588979 () Bool)

(declare-fun res!376662 () Bool)

(declare-fun e!336254 () Bool)

(assert (=> b!588979 (=> (not res!376662) (not e!336254))))

(declare-datatypes ((List!11755 0))(
  ( (Nil!11752) (Cons!11751 (h!12796 (_ BitVec 64)) (t!17974 List!11755)) )
))
(declare-fun arrayNoDuplicates!0 (array!36804 (_ BitVec 32) List!11755) Bool)

(assert (=> b!588979 (= res!376662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11752))))

(declare-fun b!588980 () Bool)

(declare-datatypes ((Unit!18360 0))(
  ( (Unit!18361) )
))
(declare-fun e!336250 () Unit!18360)

(declare-fun Unit!18362 () Unit!18360)

(assert (=> b!588980 (= e!336250 Unit!18362)))

(assert (=> b!588980 false))

(declare-fun b!588981 () Bool)

(declare-fun res!376664 () Bool)

(assert (=> b!588981 (=> (not res!376664) (not e!336252))))

(declare-fun arrayContainsKey!0 (array!36804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588981 (= res!376664 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588982 () Bool)

(declare-fun e!336251 () Bool)

(assert (=> b!588982 (= e!336251 (not true))))

(declare-fun lt!267001 () Unit!18360)

(assert (=> b!588982 (= lt!267001 e!336250)))

(declare-fun lt!266997 () array!36804)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun c!66525 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!267000 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6112 0))(
  ( (MissingZero!6112 (index!26678 (_ BitVec 32))) (Found!6112 (index!26679 (_ BitVec 32))) (Intermediate!6112 (undefined!6924 Bool) (index!26680 (_ BitVec 32)) (x!55481 (_ BitVec 32))) (Undefined!6112) (MissingVacant!6112 (index!26681 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36804 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!588982 (= c!66525 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267000 lt!266997 mask!3053) Undefined!6112))))

(declare-fun e!336253 () Bool)

(assert (=> b!588982 e!336253))

(declare-fun res!376666 () Bool)

(assert (=> b!588982 (=> (not res!376666) (not e!336253))))

(declare-fun lt!267002 () (_ BitVec 32))

(declare-fun lt!267003 () SeekEntryResult!6112)

(assert (=> b!588982 (= res!376666 (= lt!267003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267002 vacantSpotIndex!68 lt!267000 lt!266997 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588982 (= lt!267003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267002 vacantSpotIndex!68 (select (arr!17675 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588982 (= lt!267000 (select (store (arr!17675 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266998 () Unit!18360)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36804 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18360)

(assert (=> b!588982 (= lt!266998 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267002 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588982 (= lt!267002 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588983 () Bool)

(declare-fun res!376673 () Bool)

(assert (=> b!588983 (=> (not res!376673) (not e!336254))))

(assert (=> b!588983 (= res!376673 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17675 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588984 () Bool)

(declare-fun res!376667 () Bool)

(assert (=> b!588984 (=> (not res!376667) (not e!336252))))

(assert (=> b!588984 (= res!376667 (validKeyInArray!0 (select (arr!17675 a!2986) j!136)))))

(declare-fun b!588985 () Bool)

(declare-fun res!376671 () Bool)

(assert (=> b!588985 (=> (not res!376671) (not e!336254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36804 (_ BitVec 32)) Bool)

(assert (=> b!588985 (= res!376671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588986 () Bool)

(declare-fun res!376668 () Bool)

(assert (=> b!588986 (=> (not res!376668) (not e!336252))))

(assert (=> b!588986 (= res!376668 (and (= (size!18040 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18040 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18040 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588987 () Bool)

(assert (=> b!588987 (= e!336252 e!336254)))

(declare-fun res!376665 () Bool)

(assert (=> b!588987 (=> (not res!376665) (not e!336254))))

(declare-fun lt!266999 () SeekEntryResult!6112)

(assert (=> b!588987 (= res!376665 (or (= lt!266999 (MissingZero!6112 i!1108)) (= lt!266999 (MissingVacant!6112 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36804 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!588987 (= lt!266999 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588988 () Bool)

(declare-fun e!336255 () Bool)

(assert (=> b!588988 (= e!336254 e!336255)))

(declare-fun res!376669 () Bool)

(assert (=> b!588988 (=> (not res!376669) (not e!336255))))

(assert (=> b!588988 (= res!376669 (= (select (store (arr!17675 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588988 (= lt!266997 (array!36805 (store (arr!17675 a!2986) i!1108 k0!1786) (size!18040 a!2986)))))

(declare-fun b!588989 () Bool)

(declare-fun lt!267004 () SeekEntryResult!6112)

(assert (=> b!588989 (= e!336253 (= lt!267004 lt!267003))))

(declare-fun b!588990 () Bool)

(assert (=> b!588990 (= e!336255 e!336251)))

(declare-fun res!376670 () Bool)

(assert (=> b!588990 (=> (not res!376670) (not e!336251))))

(assert (=> b!588990 (= res!376670 (and (= lt!267004 (Found!6112 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17675 a!2986) index!984) (select (arr!17675 a!2986) j!136))) (not (= (select (arr!17675 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588990 (= lt!267004 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17675 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588991 () Bool)

(declare-fun Unit!18363 () Unit!18360)

(assert (=> b!588991 (= e!336250 Unit!18363)))

(assert (= (and start!53946 res!376663) b!588986))

(assert (= (and b!588986 res!376668) b!588984))

(assert (= (and b!588984 res!376667) b!588978))

(assert (= (and b!588978 res!376672) b!588981))

(assert (= (and b!588981 res!376664) b!588987))

(assert (= (and b!588987 res!376665) b!588985))

(assert (= (and b!588985 res!376671) b!588979))

(assert (= (and b!588979 res!376662) b!588983))

(assert (= (and b!588983 res!376673) b!588988))

(assert (= (and b!588988 res!376669) b!588990))

(assert (= (and b!588990 res!376670) b!588982))

(assert (= (and b!588982 res!376666) b!588989))

(assert (= (and b!588982 c!66525) b!588980))

(assert (= (and b!588982 (not c!66525)) b!588991))

(declare-fun m!567001 () Bool)

(assert (=> b!588985 m!567001))

(declare-fun m!567003 () Bool)

(assert (=> b!588982 m!567003))

(declare-fun m!567005 () Bool)

(assert (=> b!588982 m!567005))

(declare-fun m!567007 () Bool)

(assert (=> b!588982 m!567007))

(declare-fun m!567009 () Bool)

(assert (=> b!588982 m!567009))

(declare-fun m!567011 () Bool)

(assert (=> b!588982 m!567011))

(declare-fun m!567013 () Bool)

(assert (=> b!588982 m!567013))

(assert (=> b!588982 m!567009))

(declare-fun m!567015 () Bool)

(assert (=> b!588982 m!567015))

(declare-fun m!567017 () Bool)

(assert (=> b!588982 m!567017))

(declare-fun m!567019 () Bool)

(assert (=> b!588978 m!567019))

(assert (=> b!588988 m!567011))

(declare-fun m!567021 () Bool)

(assert (=> b!588988 m!567021))

(declare-fun m!567023 () Bool)

(assert (=> b!588979 m!567023))

(declare-fun m!567025 () Bool)

(assert (=> b!588981 m!567025))

(declare-fun m!567027 () Bool)

(assert (=> start!53946 m!567027))

(declare-fun m!567029 () Bool)

(assert (=> start!53946 m!567029))

(declare-fun m!567031 () Bool)

(assert (=> b!588983 m!567031))

(assert (=> b!588984 m!567009))

(assert (=> b!588984 m!567009))

(declare-fun m!567033 () Bool)

(assert (=> b!588984 m!567033))

(declare-fun m!567035 () Bool)

(assert (=> b!588987 m!567035))

(declare-fun m!567037 () Bool)

(assert (=> b!588990 m!567037))

(assert (=> b!588990 m!567009))

(assert (=> b!588990 m!567009))

(declare-fun m!567039 () Bool)

(assert (=> b!588990 m!567039))

(check-sat (not b!588979) (not b!588985) (not b!588982) (not b!588984) (not start!53946) (not b!588978) (not b!588987) (not b!588990) (not b!588981))
(check-sat)
