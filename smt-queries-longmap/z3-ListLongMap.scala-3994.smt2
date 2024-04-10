; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54156 () Bool)

(assert start!54156)

(declare-fun b!591594 () Bool)

(declare-fun res!378525 () Bool)

(declare-fun e!337800 () Bool)

(assert (=> b!591594 (=> (not res!378525) (not e!337800))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36886 0))(
  ( (array!36887 (arr!17713 (Array (_ BitVec 32) (_ BitVec 64))) (size!18077 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36886)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!591594 (= res!378525 (and (= (size!18077 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18077 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18077 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!268454 () array!36886)

(declare-fun b!591595 () Bool)

(declare-fun e!337794 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591595 (= e!337794 (arrayContainsKey!0 lt!268454 (select (arr!17713 a!2986) j!136) index!984))))

(declare-fun b!591596 () Bool)

(declare-fun e!337796 () Bool)

(declare-datatypes ((SeekEntryResult!6153 0))(
  ( (MissingZero!6153 (index!26848 (_ BitVec 32))) (Found!6153 (index!26849 (_ BitVec 32))) (Intermediate!6153 (undefined!6965 Bool) (index!26850 (_ BitVec 32)) (x!55641 (_ BitVec 32))) (Undefined!6153) (MissingVacant!6153 (index!26851 (_ BitVec 32))) )
))
(declare-fun lt!268461 () SeekEntryResult!6153)

(declare-fun lt!268462 () SeekEntryResult!6153)

(assert (=> b!591596 (= e!337796 (= lt!268461 lt!268462))))

(declare-fun b!591597 () Bool)

(declare-fun res!378532 () Bool)

(assert (=> b!591597 (=> (not res!378532) (not e!337800))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591597 (= res!378532 (validKeyInArray!0 k0!1786))))

(declare-fun b!591598 () Bool)

(declare-fun res!378529 () Bool)

(assert (=> b!591598 (=> (not res!378529) (not e!337800))))

(assert (=> b!591598 (= res!378529 (validKeyInArray!0 (select (arr!17713 a!2986) j!136)))))

(declare-fun b!591599 () Bool)

(declare-fun e!337795 () Bool)

(declare-fun e!337802 () Bool)

(assert (=> b!591599 (= e!337795 e!337802)))

(declare-fun res!378521 () Bool)

(assert (=> b!591599 (=> (not res!378521) (not e!337802))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591599 (= res!378521 (= (select (store (arr!17713 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591599 (= lt!268454 (array!36887 (store (arr!17713 a!2986) i!1108 k0!1786) (size!18077 a!2986)))))

(declare-fun b!591600 () Bool)

(declare-fun e!337798 () Bool)

(assert (=> b!591600 (= e!337802 e!337798)))

(declare-fun res!378520 () Bool)

(assert (=> b!591600 (=> (not res!378520) (not e!337798))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591600 (= res!378520 (and (= lt!268461 (Found!6153 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17713 a!2986) index!984) (select (arr!17713 a!2986) j!136))) (not (= (select (arr!17713 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36886 (_ BitVec 32)) SeekEntryResult!6153)

(assert (=> b!591600 (= lt!268461 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17713 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591601 () Bool)

(declare-fun e!337799 () Bool)

(assert (=> b!591601 (= e!337799 e!337794)))

(declare-fun res!378523 () Bool)

(assert (=> b!591601 (=> (not res!378523) (not e!337794))))

(assert (=> b!591601 (= res!378523 (arrayContainsKey!0 lt!268454 (select (arr!17713 a!2986) j!136) j!136))))

(declare-fun b!591602 () Bool)

(declare-fun e!337801 () Bool)

(assert (=> b!591602 (= e!337801 e!337799)))

(declare-fun res!378533 () Bool)

(assert (=> b!591602 (=> res!378533 e!337799)))

(declare-fun lt!268460 () (_ BitVec 64))

(declare-fun lt!268456 () (_ BitVec 64))

(assert (=> b!591602 (= res!378533 (or (not (= (select (arr!17713 a!2986) j!136) lt!268460)) (not (= (select (arr!17713 a!2986) j!136) lt!268456)) (bvsge j!136 index!984)))))

(declare-fun b!591603 () Bool)

(declare-datatypes ((Unit!18530 0))(
  ( (Unit!18531) )
))
(declare-fun e!337803 () Unit!18530)

(declare-fun Unit!18532 () Unit!18530)

(assert (=> b!591603 (= e!337803 Unit!18532)))

(declare-fun b!591604 () Bool)

(declare-fun e!337793 () Bool)

(assert (=> b!591604 (= e!337798 (not e!337793))))

(declare-fun res!378527 () Bool)

(assert (=> b!591604 (=> res!378527 e!337793)))

(declare-fun lt!268453 () SeekEntryResult!6153)

(assert (=> b!591604 (= res!378527 (not (= lt!268453 (Found!6153 index!984))))))

(declare-fun lt!268457 () Unit!18530)

(assert (=> b!591604 (= lt!268457 e!337803)))

(declare-fun c!66905 () Bool)

(assert (=> b!591604 (= c!66905 (= lt!268453 Undefined!6153))))

(assert (=> b!591604 (= lt!268453 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268460 lt!268454 mask!3053))))

(assert (=> b!591604 e!337796))

(declare-fun res!378531 () Bool)

(assert (=> b!591604 (=> (not res!378531) (not e!337796))))

(declare-fun lt!268458 () (_ BitVec 32))

(assert (=> b!591604 (= res!378531 (= lt!268462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268458 vacantSpotIndex!68 lt!268460 lt!268454 mask!3053)))))

(assert (=> b!591604 (= lt!268462 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268458 vacantSpotIndex!68 (select (arr!17713 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591604 (= lt!268460 (select (store (arr!17713 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268455 () Unit!18530)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36886 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18530)

(assert (=> b!591604 (= lt!268455 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268458 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591604 (= lt!268458 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591605 () Bool)

(declare-fun res!378518 () Bool)

(assert (=> b!591605 (=> (not res!378518) (not e!337800))))

(assert (=> b!591605 (= res!378518 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!378530 () Bool)

(assert (=> start!54156 (=> (not res!378530) (not e!337800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54156 (= res!378530 (validMask!0 mask!3053))))

(assert (=> start!54156 e!337800))

(assert (=> start!54156 true))

(declare-fun array_inv!13509 (array!36886) Bool)

(assert (=> start!54156 (array_inv!13509 a!2986)))

(declare-fun b!591606 () Bool)

(assert (=> b!591606 (= e!337793 true)))

(assert (=> b!591606 e!337801))

(declare-fun res!378524 () Bool)

(assert (=> b!591606 (=> (not res!378524) (not e!337801))))

(assert (=> b!591606 (= res!378524 (= lt!268456 (select (arr!17713 a!2986) j!136)))))

(assert (=> b!591606 (= lt!268456 (select (store (arr!17713 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591607 () Bool)

(assert (=> b!591607 (= e!337800 e!337795)))

(declare-fun res!378526 () Bool)

(assert (=> b!591607 (=> (not res!378526) (not e!337795))))

(declare-fun lt!268459 () SeekEntryResult!6153)

(assert (=> b!591607 (= res!378526 (or (= lt!268459 (MissingZero!6153 i!1108)) (= lt!268459 (MissingVacant!6153 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36886 (_ BitVec 32)) SeekEntryResult!6153)

(assert (=> b!591607 (= lt!268459 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591608 () Bool)

(declare-fun Unit!18533 () Unit!18530)

(assert (=> b!591608 (= e!337803 Unit!18533)))

(assert (=> b!591608 false))

(declare-fun b!591609 () Bool)

(declare-fun res!378528 () Bool)

(assert (=> b!591609 (=> (not res!378528) (not e!337795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36886 (_ BitVec 32)) Bool)

(assert (=> b!591609 (= res!378528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591610 () Bool)

(declare-fun res!378519 () Bool)

(assert (=> b!591610 (=> (not res!378519) (not e!337795))))

(assert (=> b!591610 (= res!378519 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17713 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591611 () Bool)

(declare-fun res!378522 () Bool)

(assert (=> b!591611 (=> (not res!378522) (not e!337795))))

(declare-datatypes ((List!11754 0))(
  ( (Nil!11751) (Cons!11750 (h!12795 (_ BitVec 64)) (t!17982 List!11754)) )
))
(declare-fun arrayNoDuplicates!0 (array!36886 (_ BitVec 32) List!11754) Bool)

(assert (=> b!591611 (= res!378522 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11751))))

(assert (= (and start!54156 res!378530) b!591594))

(assert (= (and b!591594 res!378525) b!591598))

(assert (= (and b!591598 res!378529) b!591597))

(assert (= (and b!591597 res!378532) b!591605))

(assert (= (and b!591605 res!378518) b!591607))

(assert (= (and b!591607 res!378526) b!591609))

(assert (= (and b!591609 res!378528) b!591611))

(assert (= (and b!591611 res!378522) b!591610))

(assert (= (and b!591610 res!378519) b!591599))

(assert (= (and b!591599 res!378521) b!591600))

(assert (= (and b!591600 res!378520) b!591604))

(assert (= (and b!591604 res!378531) b!591596))

(assert (= (and b!591604 c!66905) b!591608))

(assert (= (and b!591604 (not c!66905)) b!591603))

(assert (= (and b!591604 (not res!378527)) b!591606))

(assert (= (and b!591606 res!378524) b!591602))

(assert (= (and b!591602 (not res!378533)) b!591601))

(assert (= (and b!591601 res!378523) b!591595))

(declare-fun m!569819 () Bool)

(assert (=> b!591601 m!569819))

(assert (=> b!591601 m!569819))

(declare-fun m!569821 () Bool)

(assert (=> b!591601 m!569821))

(declare-fun m!569823 () Bool)

(assert (=> b!591599 m!569823))

(declare-fun m!569825 () Bool)

(assert (=> b!591599 m!569825))

(assert (=> b!591595 m!569819))

(assert (=> b!591595 m!569819))

(declare-fun m!569827 () Bool)

(assert (=> b!591595 m!569827))

(assert (=> b!591606 m!569819))

(assert (=> b!591606 m!569823))

(declare-fun m!569829 () Bool)

(assert (=> b!591606 m!569829))

(declare-fun m!569831 () Bool)

(assert (=> b!591604 m!569831))

(assert (=> b!591604 m!569819))

(assert (=> b!591604 m!569819))

(declare-fun m!569833 () Bool)

(assert (=> b!591604 m!569833))

(declare-fun m!569835 () Bool)

(assert (=> b!591604 m!569835))

(declare-fun m!569837 () Bool)

(assert (=> b!591604 m!569837))

(declare-fun m!569839 () Bool)

(assert (=> b!591604 m!569839))

(declare-fun m!569841 () Bool)

(assert (=> b!591604 m!569841))

(assert (=> b!591604 m!569823))

(declare-fun m!569843 () Bool)

(assert (=> b!591610 m!569843))

(assert (=> b!591598 m!569819))

(assert (=> b!591598 m!569819))

(declare-fun m!569845 () Bool)

(assert (=> b!591598 m!569845))

(declare-fun m!569847 () Bool)

(assert (=> start!54156 m!569847))

(declare-fun m!569849 () Bool)

(assert (=> start!54156 m!569849))

(declare-fun m!569851 () Bool)

(assert (=> b!591607 m!569851))

(declare-fun m!569853 () Bool)

(assert (=> b!591605 m!569853))

(assert (=> b!591602 m!569819))

(declare-fun m!569855 () Bool)

(assert (=> b!591609 m!569855))

(declare-fun m!569857 () Bool)

(assert (=> b!591611 m!569857))

(declare-fun m!569859 () Bool)

(assert (=> b!591600 m!569859))

(assert (=> b!591600 m!569819))

(assert (=> b!591600 m!569819))

(declare-fun m!569861 () Bool)

(assert (=> b!591600 m!569861))

(declare-fun m!569863 () Bool)

(assert (=> b!591597 m!569863))

(check-sat (not b!591595) (not b!591600) (not b!591597) (not b!591611) (not b!591604) (not b!591598) (not b!591601) (not b!591607) (not start!54156) (not b!591609) (not b!591605))
(check-sat)
