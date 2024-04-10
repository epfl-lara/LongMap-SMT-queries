; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53596 () Bool)

(assert start!53596)

(declare-fun b!583638 () Bool)

(declare-fun res!371461 () Bool)

(declare-fun e!334384 () Bool)

(assert (=> b!583638 (=> (not res!371461) (not e!334384))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583638 (= res!371461 (validKeyInArray!0 k!1786))))

(declare-fun b!583639 () Bool)

(declare-fun res!371458 () Bool)

(assert (=> b!583639 (=> (not res!371458) (not e!334384))))

(declare-datatypes ((array!36497 0))(
  ( (array!36498 (arr!17523 (Array (_ BitVec 32) (_ BitVec 64))) (size!17887 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36497)

(declare-fun arrayContainsKey!0 (array!36497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583639 (= res!371458 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!371454 () Bool)

(assert (=> start!53596 (=> (not res!371454) (not e!334384))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53596 (= res!371454 (validMask!0 mask!3053))))

(assert (=> start!53596 e!334384))

(assert (=> start!53596 true))

(declare-fun array_inv!13319 (array!36497) Bool)

(assert (=> start!53596 (array_inv!13319 a!2986)))

(declare-fun b!583640 () Bool)

(declare-fun e!334385 () Bool)

(assert (=> b!583640 (= e!334385 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265374 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5963 0))(
  ( (MissingZero!5963 (index!26079 (_ BitVec 32))) (Found!5963 (index!26080 (_ BitVec 32))) (Intermediate!5963 (undefined!6775 Bool) (index!26081 (_ BitVec 32)) (x!54920 (_ BitVec 32))) (Undefined!5963) (MissingVacant!5963 (index!26082 (_ BitVec 32))) )
))
(declare-fun lt!265373 () SeekEntryResult!5963)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36497 (_ BitVec 32)) SeekEntryResult!5963)

(assert (=> b!583640 (= lt!265373 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265374 vacantSpotIndex!68 (select (arr!17523 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583641 () Bool)

(declare-fun res!371456 () Bool)

(declare-fun e!334386 () Bool)

(assert (=> b!583641 (=> (not res!371456) (not e!334386))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583641 (= res!371456 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17523 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17523 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583642 () Bool)

(declare-fun res!371465 () Bool)

(assert (=> b!583642 (=> (not res!371465) (not e!334386))))

(assert (=> b!583642 (= res!371465 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17523 a!2986) index!984) (select (arr!17523 a!2986) j!136))) (not (= (select (arr!17523 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583643 () Bool)

(assert (=> b!583643 (= e!334384 e!334386)))

(declare-fun res!371459 () Bool)

(assert (=> b!583643 (=> (not res!371459) (not e!334386))))

(declare-fun lt!265375 () SeekEntryResult!5963)

(assert (=> b!583643 (= res!371459 (or (= lt!265375 (MissingZero!5963 i!1108)) (= lt!265375 (MissingVacant!5963 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36497 (_ BitVec 32)) SeekEntryResult!5963)

(assert (=> b!583643 (= lt!265375 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583644 () Bool)

(assert (=> b!583644 (= e!334386 e!334385)))

(declare-fun res!371460 () Bool)

(assert (=> b!583644 (=> (not res!371460) (not e!334385))))

(assert (=> b!583644 (= res!371460 (and (bvsge lt!265374 #b00000000000000000000000000000000) (bvslt lt!265374 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583644 (= lt!265374 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583645 () Bool)

(declare-fun res!371457 () Bool)

(assert (=> b!583645 (=> (not res!371457) (not e!334384))))

(assert (=> b!583645 (= res!371457 (and (= (size!17887 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17887 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17887 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583646 () Bool)

(declare-fun res!371462 () Bool)

(assert (=> b!583646 (=> (not res!371462) (not e!334386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36497 (_ BitVec 32)) Bool)

(assert (=> b!583646 (= res!371462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583647 () Bool)

(declare-fun res!371463 () Bool)

(assert (=> b!583647 (=> (not res!371463) (not e!334386))))

(declare-datatypes ((List!11564 0))(
  ( (Nil!11561) (Cons!11560 (h!12605 (_ BitVec 64)) (t!17792 List!11564)) )
))
(declare-fun arrayNoDuplicates!0 (array!36497 (_ BitVec 32) List!11564) Bool)

(assert (=> b!583647 (= res!371463 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11561))))

(declare-fun b!583648 () Bool)

(declare-fun res!371464 () Bool)

(assert (=> b!583648 (=> (not res!371464) (not e!334384))))

(assert (=> b!583648 (= res!371464 (validKeyInArray!0 (select (arr!17523 a!2986) j!136)))))

(declare-fun b!583649 () Bool)

(declare-fun res!371455 () Bool)

(assert (=> b!583649 (=> (not res!371455) (not e!334386))))

(assert (=> b!583649 (= res!371455 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17523 a!2986) j!136) a!2986 mask!3053) (Found!5963 j!136)))))

(assert (= (and start!53596 res!371454) b!583645))

(assert (= (and b!583645 res!371457) b!583648))

(assert (= (and b!583648 res!371464) b!583638))

(assert (= (and b!583638 res!371461) b!583639))

(assert (= (and b!583639 res!371458) b!583643))

(assert (= (and b!583643 res!371459) b!583646))

(assert (= (and b!583646 res!371462) b!583647))

(assert (= (and b!583647 res!371463) b!583641))

(assert (= (and b!583641 res!371456) b!583649))

(assert (= (and b!583649 res!371455) b!583642))

(assert (= (and b!583642 res!371465) b!583644))

(assert (= (and b!583644 res!371460) b!583640))

(declare-fun m!562081 () Bool)

(assert (=> b!583643 m!562081))

(declare-fun m!562083 () Bool)

(assert (=> b!583647 m!562083))

(declare-fun m!562085 () Bool)

(assert (=> b!583640 m!562085))

(assert (=> b!583640 m!562085))

(declare-fun m!562087 () Bool)

(assert (=> b!583640 m!562087))

(declare-fun m!562089 () Bool)

(assert (=> b!583639 m!562089))

(declare-fun m!562091 () Bool)

(assert (=> b!583642 m!562091))

(assert (=> b!583642 m!562085))

(declare-fun m!562093 () Bool)

(assert (=> start!53596 m!562093))

(declare-fun m!562095 () Bool)

(assert (=> start!53596 m!562095))

(declare-fun m!562097 () Bool)

(assert (=> b!583644 m!562097))

(declare-fun m!562099 () Bool)

(assert (=> b!583638 m!562099))

(assert (=> b!583649 m!562085))

(assert (=> b!583649 m!562085))

(declare-fun m!562101 () Bool)

(assert (=> b!583649 m!562101))

(assert (=> b!583648 m!562085))

(assert (=> b!583648 m!562085))

(declare-fun m!562103 () Bool)

(assert (=> b!583648 m!562103))

(declare-fun m!562105 () Bool)

(assert (=> b!583646 m!562105))

(declare-fun m!562107 () Bool)

(assert (=> b!583641 m!562107))

(declare-fun m!562109 () Bool)

(assert (=> b!583641 m!562109))

(declare-fun m!562111 () Bool)

(assert (=> b!583641 m!562111))

(push 1)

