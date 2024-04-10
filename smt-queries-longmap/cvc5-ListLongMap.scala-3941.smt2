; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53656 () Bool)

(assert start!53656)

(declare-fun b!584718 () Bool)

(declare-fun res!372534 () Bool)

(declare-fun e!334745 () Bool)

(assert (=> b!584718 (=> (not res!372534) (not e!334745))))

(declare-datatypes ((array!36557 0))(
  ( (array!36558 (arr!17553 (Array (_ BitVec 32) (_ BitVec 64))) (size!17917 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36557)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36557 (_ BitVec 32)) Bool)

(assert (=> b!584718 (= res!372534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584720 () Bool)

(declare-fun e!334744 () Bool)

(assert (=> b!584720 (= e!334744 e!334745)))

(declare-fun res!372541 () Bool)

(assert (=> b!584720 (=> (not res!372541) (not e!334745))))

(declare-datatypes ((SeekEntryResult!5993 0))(
  ( (MissingZero!5993 (index!26199 (_ BitVec 32))) (Found!5993 (index!26200 (_ BitVec 32))) (Intermediate!5993 (undefined!6805 Bool) (index!26201 (_ BitVec 32)) (x!55030 (_ BitVec 32))) (Undefined!5993) (MissingVacant!5993 (index!26202 (_ BitVec 32))) )
))
(declare-fun lt!265643 () SeekEntryResult!5993)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584720 (= res!372541 (or (= lt!265643 (MissingZero!5993 i!1108)) (= lt!265643 (MissingVacant!5993 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36557 (_ BitVec 32)) SeekEntryResult!5993)

(assert (=> b!584720 (= lt!265643 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584721 () Bool)

(declare-fun res!372542 () Bool)

(assert (=> b!584721 (=> (not res!372542) (not e!334745))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584721 (= res!372542 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17553 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17553 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584722 () Bool)

(declare-fun e!334746 () Bool)

(assert (=> b!584722 (= e!334745 e!334746)))

(declare-fun res!372540 () Bool)

(assert (=> b!584722 (=> (not res!372540) (not e!334746))))

(declare-fun lt!265645 () (_ BitVec 32))

(assert (=> b!584722 (= res!372540 (and (bvsge lt!265645 #b00000000000000000000000000000000) (bvslt lt!265645 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584722 (= lt!265645 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584723 () Bool)

(declare-fun res!372543 () Bool)

(assert (=> b!584723 (=> (not res!372543) (not e!334745))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36557 (_ BitVec 32)) SeekEntryResult!5993)

(assert (=> b!584723 (= res!372543 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17553 a!2986) j!136) a!2986 mask!3053) (Found!5993 j!136)))))

(declare-fun b!584724 () Bool)

(declare-fun res!372539 () Bool)

(assert (=> b!584724 (=> (not res!372539) (not e!334744))))

(declare-fun arrayContainsKey!0 (array!36557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584724 (= res!372539 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584725 () Bool)

(declare-fun res!372535 () Bool)

(assert (=> b!584725 (=> (not res!372535) (not e!334745))))

(assert (=> b!584725 (= res!372535 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17553 a!2986) index!984) (select (arr!17553 a!2986) j!136))) (not (= (select (arr!17553 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584726 () Bool)

(declare-fun res!372536 () Bool)

(assert (=> b!584726 (=> (not res!372536) (not e!334744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584726 (= res!372536 (validKeyInArray!0 (select (arr!17553 a!2986) j!136)))))

(declare-fun b!584727 () Bool)

(declare-fun res!372545 () Bool)

(assert (=> b!584727 (=> (not res!372545) (not e!334744))))

(assert (=> b!584727 (= res!372545 (validKeyInArray!0 k!1786))))

(declare-fun b!584728 () Bool)

(declare-fun res!372537 () Bool)

(assert (=> b!584728 (=> (not res!372537) (not e!334745))))

(declare-datatypes ((List!11594 0))(
  ( (Nil!11591) (Cons!11590 (h!12635 (_ BitVec 64)) (t!17822 List!11594)) )
))
(declare-fun arrayNoDuplicates!0 (array!36557 (_ BitVec 32) List!11594) Bool)

(assert (=> b!584728 (= res!372537 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11591))))

(declare-fun b!584729 () Bool)

(declare-fun res!372538 () Bool)

(assert (=> b!584729 (=> (not res!372538) (not e!334744))))

(assert (=> b!584729 (= res!372538 (and (= (size!17917 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17917 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17917 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584719 () Bool)

(assert (=> b!584719 (= e!334746 false)))

(declare-fun lt!265644 () SeekEntryResult!5993)

(assert (=> b!584719 (= lt!265644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265645 vacantSpotIndex!68 (select (arr!17553 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!372544 () Bool)

(assert (=> start!53656 (=> (not res!372544) (not e!334744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53656 (= res!372544 (validMask!0 mask!3053))))

(assert (=> start!53656 e!334744))

(assert (=> start!53656 true))

(declare-fun array_inv!13349 (array!36557) Bool)

(assert (=> start!53656 (array_inv!13349 a!2986)))

(assert (= (and start!53656 res!372544) b!584729))

(assert (= (and b!584729 res!372538) b!584726))

(assert (= (and b!584726 res!372536) b!584727))

(assert (= (and b!584727 res!372545) b!584724))

(assert (= (and b!584724 res!372539) b!584720))

(assert (= (and b!584720 res!372541) b!584718))

(assert (= (and b!584718 res!372534) b!584728))

(assert (= (and b!584728 res!372537) b!584721))

(assert (= (and b!584721 res!372542) b!584723))

(assert (= (and b!584723 res!372543) b!584725))

(assert (= (and b!584725 res!372535) b!584722))

(assert (= (and b!584722 res!372540) b!584719))

(declare-fun m!563041 () Bool)

(assert (=> b!584719 m!563041))

(assert (=> b!584719 m!563041))

(declare-fun m!563043 () Bool)

(assert (=> b!584719 m!563043))

(declare-fun m!563045 () Bool)

(assert (=> b!584727 m!563045))

(declare-fun m!563047 () Bool)

(assert (=> b!584722 m!563047))

(declare-fun m!563049 () Bool)

(assert (=> b!584718 m!563049))

(declare-fun m!563051 () Bool)

(assert (=> b!584721 m!563051))

(declare-fun m!563053 () Bool)

(assert (=> b!584721 m!563053))

(declare-fun m!563055 () Bool)

(assert (=> b!584721 m!563055))

(declare-fun m!563057 () Bool)

(assert (=> b!584724 m!563057))

(assert (=> b!584726 m!563041))

(assert (=> b!584726 m!563041))

(declare-fun m!563059 () Bool)

(assert (=> b!584726 m!563059))

(assert (=> b!584723 m!563041))

(assert (=> b!584723 m!563041))

(declare-fun m!563061 () Bool)

(assert (=> b!584723 m!563061))

(declare-fun m!563063 () Bool)

(assert (=> b!584720 m!563063))

(declare-fun m!563065 () Bool)

(assert (=> start!53656 m!563065))

(declare-fun m!563067 () Bool)

(assert (=> start!53656 m!563067))

(declare-fun m!563069 () Bool)

(assert (=> b!584728 m!563069))

(declare-fun m!563071 () Bool)

(assert (=> b!584725 m!563071))

(assert (=> b!584725 m!563041))

(push 1)

