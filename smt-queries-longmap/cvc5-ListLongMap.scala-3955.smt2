; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53740 () Bool)

(assert start!53740)

(declare-fun b!586174 () Bool)

(declare-fun res!373996 () Bool)

(declare-fun e!335191 () Bool)

(assert (=> b!586174 (=> (not res!373996) (not e!335191))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36641 0))(
  ( (array!36642 (arr!17595 (Array (_ BitVec 32) (_ BitVec 64))) (size!17959 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36641)

(declare-datatypes ((SeekEntryResult!6035 0))(
  ( (MissingZero!6035 (index!26367 (_ BitVec 32))) (Found!6035 (index!26368 (_ BitVec 32))) (Intermediate!6035 (undefined!6847 Bool) (index!26369 (_ BitVec 32)) (x!55184 (_ BitVec 32))) (Undefined!6035) (MissingVacant!6035 (index!26370 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36641 (_ BitVec 32)) SeekEntryResult!6035)

(assert (=> b!586174 (= res!373996 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17595 a!2986) j!136) a!2986 mask!3053) (Found!6035 j!136)))))

(declare-fun b!586175 () Bool)

(declare-fun res!373998 () Bool)

(assert (=> b!586175 (=> (not res!373998) (not e!335191))))

(declare-datatypes ((List!11636 0))(
  ( (Nil!11633) (Cons!11632 (h!12677 (_ BitVec 64)) (t!17864 List!11636)) )
))
(declare-fun arrayNoDuplicates!0 (array!36641 (_ BitVec 32) List!11636) Bool)

(assert (=> b!586175 (= res!373998 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11633))))

(declare-fun b!586176 () Bool)

(declare-fun res!373990 () Bool)

(declare-fun e!335193 () Bool)

(assert (=> b!586176 (=> (not res!373990) (not e!335193))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586176 (= res!373990 (validKeyInArray!0 k!1786))))

(declare-fun b!586177 () Bool)

(declare-fun res!373992 () Bool)

(assert (=> b!586177 (=> (not res!373992) (not e!335191))))

(assert (=> b!586177 (= res!373992 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17595 a!2986) index!984) (select (arr!17595 a!2986) j!136))) (not (= (select (arr!17595 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586178 () Bool)

(declare-fun res!373997 () Bool)

(assert (=> b!586178 (=> (not res!373997) (not e!335193))))

(assert (=> b!586178 (= res!373997 (validKeyInArray!0 (select (arr!17595 a!2986) j!136)))))

(declare-fun b!586179 () Bool)

(declare-fun res!373994 () Bool)

(assert (=> b!586179 (=> (not res!373994) (not e!335191))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586179 (= res!373994 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17595 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17595 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586180 () Bool)

(assert (=> b!586180 (= e!335193 e!335191)))

(declare-fun res!374000 () Bool)

(assert (=> b!586180 (=> (not res!374000) (not e!335191))))

(declare-fun lt!266022 () SeekEntryResult!6035)

(assert (=> b!586180 (= res!374000 (or (= lt!266022 (MissingZero!6035 i!1108)) (= lt!266022 (MissingVacant!6035 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36641 (_ BitVec 32)) SeekEntryResult!6035)

(assert (=> b!586180 (= lt!266022 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586181 () Bool)

(assert (=> b!586181 (= e!335191 (not true))))

(declare-fun lt!266023 () (_ BitVec 32))

(assert (=> b!586181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266023 vacantSpotIndex!68 (select (arr!17595 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266023 vacantSpotIndex!68 (select (store (arr!17595 a!2986) i!1108 k!1786) j!136) (array!36642 (store (arr!17595 a!2986) i!1108 k!1786) (size!17959 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18190 0))(
  ( (Unit!18191) )
))
(declare-fun lt!266021 () Unit!18190)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18190)

(assert (=> b!586181 (= lt!266021 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586181 (= lt!266023 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!373999 () Bool)

(assert (=> start!53740 (=> (not res!373999) (not e!335193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53740 (= res!373999 (validMask!0 mask!3053))))

(assert (=> start!53740 e!335193))

(assert (=> start!53740 true))

(declare-fun array_inv!13391 (array!36641) Bool)

(assert (=> start!53740 (array_inv!13391 a!2986)))

(declare-fun b!586182 () Bool)

(declare-fun res!373993 () Bool)

(assert (=> b!586182 (=> (not res!373993) (not e!335193))))

(declare-fun arrayContainsKey!0 (array!36641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586182 (= res!373993 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586183 () Bool)

(declare-fun res!373991 () Bool)

(assert (=> b!586183 (=> (not res!373991) (not e!335193))))

(assert (=> b!586183 (= res!373991 (and (= (size!17959 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17959 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17959 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586184 () Bool)

(declare-fun res!373995 () Bool)

(assert (=> b!586184 (=> (not res!373995) (not e!335191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36641 (_ BitVec 32)) Bool)

(assert (=> b!586184 (= res!373995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53740 res!373999) b!586183))

(assert (= (and b!586183 res!373991) b!586178))

(assert (= (and b!586178 res!373997) b!586176))

(assert (= (and b!586176 res!373990) b!586182))

(assert (= (and b!586182 res!373993) b!586180))

(assert (= (and b!586180 res!374000) b!586184))

(assert (= (and b!586184 res!373995) b!586175))

(assert (= (and b!586175 res!373998) b!586179))

(assert (= (and b!586179 res!373994) b!586174))

(assert (= (and b!586174 res!373996) b!586177))

(assert (= (and b!586177 res!373992) b!586181))

(declare-fun m!564493 () Bool)

(assert (=> b!586180 m!564493))

(declare-fun m!564495 () Bool)

(assert (=> b!586178 m!564495))

(assert (=> b!586178 m!564495))

(declare-fun m!564497 () Bool)

(assert (=> b!586178 m!564497))

(declare-fun m!564499 () Bool)

(assert (=> b!586176 m!564499))

(declare-fun m!564501 () Bool)

(assert (=> b!586184 m!564501))

(declare-fun m!564503 () Bool)

(assert (=> b!586182 m!564503))

(declare-fun m!564505 () Bool)

(assert (=> b!586177 m!564505))

(assert (=> b!586177 m!564495))

(declare-fun m!564507 () Bool)

(assert (=> b!586181 m!564507))

(declare-fun m!564509 () Bool)

(assert (=> b!586181 m!564509))

(assert (=> b!586181 m!564495))

(declare-fun m!564511 () Bool)

(assert (=> b!586181 m!564511))

(assert (=> b!586181 m!564495))

(assert (=> b!586181 m!564509))

(declare-fun m!564513 () Bool)

(assert (=> b!586181 m!564513))

(declare-fun m!564515 () Bool)

(assert (=> b!586181 m!564515))

(declare-fun m!564517 () Bool)

(assert (=> b!586181 m!564517))

(declare-fun m!564519 () Bool)

(assert (=> start!53740 m!564519))

(declare-fun m!564521 () Bool)

(assert (=> start!53740 m!564521))

(declare-fun m!564523 () Bool)

(assert (=> b!586175 m!564523))

(declare-fun m!564525 () Bool)

(assert (=> b!586179 m!564525))

(assert (=> b!586179 m!564517))

(declare-fun m!564527 () Bool)

(assert (=> b!586179 m!564527))

(assert (=> b!586174 m!564495))

(assert (=> b!586174 m!564495))

(declare-fun m!564529 () Bool)

(assert (=> b!586174 m!564529))

(push 1)

