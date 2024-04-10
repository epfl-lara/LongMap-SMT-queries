; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53862 () Bool)

(assert start!53862)

(declare-fun b!587449 () Bool)

(declare-fun res!375094 () Bool)

(declare-fun e!335633 () Bool)

(assert (=> b!587449 (=> (not res!375094) (not e!335633))))

(declare-datatypes ((array!36706 0))(
  ( (array!36707 (arr!17626 (Array (_ BitVec 32) (_ BitVec 64))) (size!17990 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36706)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36706 (_ BitVec 32)) Bool)

(assert (=> b!587449 (= res!375094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587450 () Bool)

(declare-fun res!375093 () Bool)

(declare-fun e!335634 () Bool)

(assert (=> b!587450 (=> (not res!375093) (not e!335634))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587450 (= res!375093 (and (= (size!17990 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17990 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17990 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587451 () Bool)

(assert (=> b!587451 (= e!335634 e!335633)))

(declare-fun res!375092 () Bool)

(assert (=> b!587451 (=> (not res!375092) (not e!335633))))

(declare-datatypes ((SeekEntryResult!6066 0))(
  ( (MissingZero!6066 (index!26494 (_ BitVec 32))) (Found!6066 (index!26495 (_ BitVec 32))) (Intermediate!6066 (undefined!6878 Bool) (index!26496 (_ BitVec 32)) (x!55304 (_ BitVec 32))) (Undefined!6066) (MissingVacant!6066 (index!26497 (_ BitVec 32))) )
))
(declare-fun lt!266403 () SeekEntryResult!6066)

(assert (=> b!587451 (= res!375092 (or (= lt!266403 (MissingZero!6066 i!1108)) (= lt!266403 (MissingVacant!6066 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36706 (_ BitVec 32)) SeekEntryResult!6066)

(assert (=> b!587451 (= lt!266403 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!375090 () Bool)

(assert (=> start!53862 (=> (not res!375090) (not e!335634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53862 (= res!375090 (validMask!0 mask!3053))))

(assert (=> start!53862 e!335634))

(assert (=> start!53862 true))

(declare-fun array_inv!13422 (array!36706) Bool)

(assert (=> start!53862 (array_inv!13422 a!2986)))

(declare-fun b!587452 () Bool)

(declare-fun res!375091 () Bool)

(assert (=> b!587452 (=> (not res!375091) (not e!335633))))

(declare-datatypes ((List!11667 0))(
  ( (Nil!11664) (Cons!11663 (h!12708 (_ BitVec 64)) (t!17895 List!11667)) )
))
(declare-fun arrayNoDuplicates!0 (array!36706 (_ BitVec 32) List!11667) Bool)

(assert (=> b!587452 (= res!375091 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11664))))

(declare-fun b!587453 () Bool)

(declare-fun res!375086 () Bool)

(assert (=> b!587453 (=> (not res!375086) (not e!335634))))

(declare-fun arrayContainsKey!0 (array!36706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587453 (= res!375086 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587454 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266402 () (_ BitVec 32))

(assert (=> b!587454 (= e!335633 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvslt lt!266402 #b00000000000000000000000000000000) (bvsge lt!266402 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36706 (_ BitVec 32)) SeekEntryResult!6066)

(assert (=> b!587454 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266402 vacantSpotIndex!68 (select (arr!17626 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266402 vacantSpotIndex!68 (select (store (arr!17626 a!2986) i!1108 k0!1786) j!136) (array!36707 (store (arr!17626 a!2986) i!1108 k0!1786) (size!17990 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18252 0))(
  ( (Unit!18253) )
))
(declare-fun lt!266404 () Unit!18252)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36706 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18252)

(assert (=> b!587454 (= lt!266404 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266402 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587454 (= lt!266402 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587455 () Bool)

(declare-fun res!375088 () Bool)

(assert (=> b!587455 (=> (not res!375088) (not e!335634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587455 (= res!375088 (validKeyInArray!0 (select (arr!17626 a!2986) j!136)))))

(declare-fun b!587456 () Bool)

(declare-fun res!375087 () Bool)

(assert (=> b!587456 (=> (not res!375087) (not e!335633))))

(assert (=> b!587456 (= res!375087 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17626 a!2986) index!984) (select (arr!17626 a!2986) j!136))) (not (= (select (arr!17626 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587457 () Bool)

(declare-fun res!375095 () Bool)

(assert (=> b!587457 (=> (not res!375095) (not e!335634))))

(assert (=> b!587457 (= res!375095 (validKeyInArray!0 k0!1786))))

(declare-fun b!587458 () Bool)

(declare-fun res!375089 () Bool)

(assert (=> b!587458 (=> (not res!375089) (not e!335633))))

(assert (=> b!587458 (= res!375089 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17626 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17626 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587459 () Bool)

(declare-fun res!375085 () Bool)

(assert (=> b!587459 (=> (not res!375085) (not e!335633))))

(assert (=> b!587459 (= res!375085 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17626 a!2986) j!136) a!2986 mask!3053) (Found!6066 j!136)))))

(assert (= (and start!53862 res!375090) b!587450))

(assert (= (and b!587450 res!375093) b!587455))

(assert (= (and b!587455 res!375088) b!587457))

(assert (= (and b!587457 res!375095) b!587453))

(assert (= (and b!587453 res!375086) b!587451))

(assert (= (and b!587451 res!375092) b!587449))

(assert (= (and b!587449 res!375094) b!587452))

(assert (= (and b!587452 res!375091) b!587458))

(assert (= (and b!587458 res!375089) b!587459))

(assert (= (and b!587459 res!375085) b!587456))

(assert (= (and b!587456 res!375087) b!587454))

(declare-fun m!565851 () Bool)

(assert (=> b!587452 m!565851))

(declare-fun m!565853 () Bool)

(assert (=> b!587451 m!565853))

(declare-fun m!565855 () Bool)

(assert (=> b!587454 m!565855))

(declare-fun m!565857 () Bool)

(assert (=> b!587454 m!565857))

(declare-fun m!565859 () Bool)

(assert (=> b!587454 m!565859))

(declare-fun m!565861 () Bool)

(assert (=> b!587454 m!565861))

(declare-fun m!565863 () Bool)

(assert (=> b!587454 m!565863))

(assert (=> b!587454 m!565861))

(declare-fun m!565865 () Bool)

(assert (=> b!587454 m!565865))

(assert (=> b!587454 m!565859))

(declare-fun m!565867 () Bool)

(assert (=> b!587454 m!565867))

(declare-fun m!565869 () Bool)

(assert (=> b!587457 m!565869))

(assert (=> b!587459 m!565861))

(assert (=> b!587459 m!565861))

(declare-fun m!565871 () Bool)

(assert (=> b!587459 m!565871))

(assert (=> b!587455 m!565861))

(assert (=> b!587455 m!565861))

(declare-fun m!565873 () Bool)

(assert (=> b!587455 m!565873))

(declare-fun m!565875 () Bool)

(assert (=> b!587453 m!565875))

(declare-fun m!565877 () Bool)

(assert (=> start!53862 m!565877))

(declare-fun m!565879 () Bool)

(assert (=> start!53862 m!565879))

(declare-fun m!565881 () Bool)

(assert (=> b!587458 m!565881))

(assert (=> b!587458 m!565863))

(declare-fun m!565883 () Bool)

(assert (=> b!587458 m!565883))

(declare-fun m!565885 () Bool)

(assert (=> b!587449 m!565885))

(declare-fun m!565887 () Bool)

(assert (=> b!587456 m!565887))

(assert (=> b!587456 m!565861))

(check-sat (not b!587455) (not b!587449) (not b!587454) (not b!587457) (not start!53862) (not b!587452) (not b!587459) (not b!587453) (not b!587451))
(check-sat)
