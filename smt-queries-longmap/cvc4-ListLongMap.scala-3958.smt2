; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53762 () Bool)

(assert start!53762)

(declare-fun b!586537 () Bool)

(declare-fun res!374358 () Bool)

(declare-fun e!335292 () Bool)

(assert (=> b!586537 (=> (not res!374358) (not e!335292))))

(declare-datatypes ((array!36663 0))(
  ( (array!36664 (arr!17606 (Array (_ BitVec 32) (_ BitVec 64))) (size!17970 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36663)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36663 (_ BitVec 32)) Bool)

(assert (=> b!586537 (= res!374358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586538 () Bool)

(assert (=> b!586538 (= e!335292 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266122 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6046 0))(
  ( (MissingZero!6046 (index!26411 (_ BitVec 32))) (Found!6046 (index!26412 (_ BitVec 32))) (Intermediate!6046 (undefined!6858 Bool) (index!26413 (_ BitVec 32)) (x!55219 (_ BitVec 32))) (Undefined!6046) (MissingVacant!6046 (index!26414 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36663 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!586538 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266122 vacantSpotIndex!68 (select (arr!17606 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266122 vacantSpotIndex!68 (select (store (arr!17606 a!2986) i!1108 k!1786) j!136) (array!36664 (store (arr!17606 a!2986) i!1108 k!1786) (size!17970 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18212 0))(
  ( (Unit!18213) )
))
(declare-fun lt!266120 () Unit!18212)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36663 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18212)

(assert (=> b!586538 (= lt!266120 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266122 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586538 (= lt!266122 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586539 () Bool)

(declare-fun res!374359 () Bool)

(assert (=> b!586539 (=> (not res!374359) (not e!335292))))

(assert (=> b!586539 (= res!374359 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17606 a!2986) j!136) a!2986 mask!3053) (Found!6046 j!136)))))

(declare-fun b!586540 () Bool)

(declare-fun res!374357 () Bool)

(assert (=> b!586540 (=> (not res!374357) (not e!335292))))

(declare-datatypes ((List!11647 0))(
  ( (Nil!11644) (Cons!11643 (h!12688 (_ BitVec 64)) (t!17875 List!11647)) )
))
(declare-fun arrayNoDuplicates!0 (array!36663 (_ BitVec 32) List!11647) Bool)

(assert (=> b!586540 (= res!374357 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11644))))

(declare-fun b!586541 () Bool)

(declare-fun e!335291 () Bool)

(assert (=> b!586541 (= e!335291 e!335292)))

(declare-fun res!374353 () Bool)

(assert (=> b!586541 (=> (not res!374353) (not e!335292))))

(declare-fun lt!266121 () SeekEntryResult!6046)

(assert (=> b!586541 (= res!374353 (or (= lt!266121 (MissingZero!6046 i!1108)) (= lt!266121 (MissingVacant!6046 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36663 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!586541 (= lt!266121 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586542 () Bool)

(declare-fun res!374354 () Bool)

(assert (=> b!586542 (=> (not res!374354) (not e!335291))))

(assert (=> b!586542 (= res!374354 (and (= (size!17970 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17970 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17970 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586543 () Bool)

(declare-fun res!374361 () Bool)

(assert (=> b!586543 (=> (not res!374361) (not e!335292))))

(assert (=> b!586543 (= res!374361 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17606 a!2986) index!984) (select (arr!17606 a!2986) j!136))) (not (= (select (arr!17606 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586544 () Bool)

(declare-fun res!374362 () Bool)

(assert (=> b!586544 (=> (not res!374362) (not e!335291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586544 (= res!374362 (validKeyInArray!0 (select (arr!17606 a!2986) j!136)))))

(declare-fun res!374356 () Bool)

(assert (=> start!53762 (=> (not res!374356) (not e!335291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53762 (= res!374356 (validMask!0 mask!3053))))

(assert (=> start!53762 e!335291))

(assert (=> start!53762 true))

(declare-fun array_inv!13402 (array!36663) Bool)

(assert (=> start!53762 (array_inv!13402 a!2986)))

(declare-fun b!586545 () Bool)

(declare-fun res!374355 () Bool)

(assert (=> b!586545 (=> (not res!374355) (not e!335291))))

(assert (=> b!586545 (= res!374355 (validKeyInArray!0 k!1786))))

(declare-fun b!586546 () Bool)

(declare-fun res!374360 () Bool)

(assert (=> b!586546 (=> (not res!374360) (not e!335291))))

(declare-fun arrayContainsKey!0 (array!36663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586546 (= res!374360 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586547 () Bool)

(declare-fun res!374363 () Bool)

(assert (=> b!586547 (=> (not res!374363) (not e!335292))))

(assert (=> b!586547 (= res!374363 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17606 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17606 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53762 res!374356) b!586542))

(assert (= (and b!586542 res!374354) b!586544))

(assert (= (and b!586544 res!374362) b!586545))

(assert (= (and b!586545 res!374355) b!586546))

(assert (= (and b!586546 res!374360) b!586541))

(assert (= (and b!586541 res!374353) b!586537))

(assert (= (and b!586537 res!374358) b!586540))

(assert (= (and b!586540 res!374357) b!586547))

(assert (= (and b!586547 res!374363) b!586539))

(assert (= (and b!586539 res!374359) b!586543))

(assert (= (and b!586543 res!374361) b!586538))

(declare-fun m!564911 () Bool)

(assert (=> b!586537 m!564911))

(declare-fun m!564913 () Bool)

(assert (=> b!586541 m!564913))

(declare-fun m!564915 () Bool)

(assert (=> b!586547 m!564915))

(declare-fun m!564917 () Bool)

(assert (=> b!586547 m!564917))

(declare-fun m!564919 () Bool)

(assert (=> b!586547 m!564919))

(declare-fun m!564921 () Bool)

(assert (=> b!586546 m!564921))

(declare-fun m!564923 () Bool)

(assert (=> start!53762 m!564923))

(declare-fun m!564925 () Bool)

(assert (=> start!53762 m!564925))

(declare-fun m!564927 () Bool)

(assert (=> b!586538 m!564927))

(declare-fun m!564929 () Bool)

(assert (=> b!586538 m!564929))

(declare-fun m!564931 () Bool)

(assert (=> b!586538 m!564931))

(declare-fun m!564933 () Bool)

(assert (=> b!586538 m!564933))

(assert (=> b!586538 m!564931))

(assert (=> b!586538 m!564929))

(declare-fun m!564935 () Bool)

(assert (=> b!586538 m!564935))

(declare-fun m!564937 () Bool)

(assert (=> b!586538 m!564937))

(assert (=> b!586538 m!564917))

(declare-fun m!564939 () Bool)

(assert (=> b!586540 m!564939))

(assert (=> b!586544 m!564931))

(assert (=> b!586544 m!564931))

(declare-fun m!564941 () Bool)

(assert (=> b!586544 m!564941))

(declare-fun m!564943 () Bool)

(assert (=> b!586545 m!564943))

(assert (=> b!586539 m!564931))

(assert (=> b!586539 m!564931))

(declare-fun m!564945 () Bool)

(assert (=> b!586539 m!564945))

(declare-fun m!564947 () Bool)

(assert (=> b!586543 m!564947))

(assert (=> b!586543 m!564931))

(push 1)

(assert (not b!586541))

(assert (not b!586546))

(assert (not b!586537))

(assert (not b!586539))

(assert (not b!586540))

