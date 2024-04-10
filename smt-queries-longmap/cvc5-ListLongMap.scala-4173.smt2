; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56834 () Bool)

(assert start!56834)

(declare-fun b!629588 () Bool)

(declare-fun res!406982 () Bool)

(declare-fun e!360033 () Bool)

(assert (=> b!629588 (=> (not res!406982) (not e!360033))))

(declare-datatypes ((array!38024 0))(
  ( (array!38025 (arr!18249 (Array (_ BitVec 32) (_ BitVec 64))) (size!18613 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38024)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629588 (= res!406982 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406984 () Bool)

(assert (=> start!56834 (=> (not res!406984) (not e!360033))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56834 (= res!406984 (validMask!0 mask!3053))))

(assert (=> start!56834 e!360033))

(assert (=> start!56834 true))

(declare-fun array_inv!14045 (array!38024) Bool)

(assert (=> start!56834 (array_inv!14045 a!2986)))

(declare-fun b!629589 () Bool)

(declare-fun res!406988 () Bool)

(declare-fun e!360034 () Bool)

(assert (=> b!629589 (=> (not res!406988) (not e!360034))))

(declare-datatypes ((List!12290 0))(
  ( (Nil!12287) (Cons!12286 (h!13331 (_ BitVec 64)) (t!18518 List!12290)) )
))
(declare-fun arrayNoDuplicates!0 (array!38024 (_ BitVec 32) List!12290) Bool)

(assert (=> b!629589 (= res!406988 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12287))))

(declare-fun b!629590 () Bool)

(declare-fun res!406991 () Bool)

(assert (=> b!629590 (=> (not res!406991) (not e!360033))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629590 (= res!406991 (validKeyInArray!0 (select (arr!18249 a!2986) j!136)))))

(declare-fun b!629591 () Bool)

(declare-fun e!360035 () Bool)

(declare-datatypes ((SeekEntryResult!6689 0))(
  ( (MissingZero!6689 (index!29040 (_ BitVec 32))) (Found!6689 (index!29041 (_ BitVec 32))) (Intermediate!6689 (undefined!7501 Bool) (index!29042 (_ BitVec 32)) (x!57777 (_ BitVec 32))) (Undefined!6689) (MissingVacant!6689 (index!29043 (_ BitVec 32))) )
))
(declare-fun lt!290799 () SeekEntryResult!6689)

(declare-fun lt!290800 () SeekEntryResult!6689)

(assert (=> b!629591 (= e!360035 (not (= lt!290799 lt!290800)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290797 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38024 (_ BitVec 32)) SeekEntryResult!6689)

(assert (=> b!629591 (= lt!290800 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (store (arr!18249 a!2986) i!1108 k!1786) j!136) (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)) mask!3053))))

(assert (=> b!629591 (= lt!290800 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21120 0))(
  ( (Unit!21121) )
))
(declare-fun lt!290798 () Unit!21120)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> b!629591 (= lt!290798 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629591 (= lt!290797 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629592 () Bool)

(declare-fun res!406986 () Bool)

(assert (=> b!629592 (=> (not res!406986) (not e!360034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38024 (_ BitVec 32)) Bool)

(assert (=> b!629592 (= res!406986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629593 () Bool)

(declare-fun res!406989 () Bool)

(assert (=> b!629593 (=> (not res!406989) (not e!360033))))

(assert (=> b!629593 (= res!406989 (validKeyInArray!0 k!1786))))

(declare-fun b!629594 () Bool)

(assert (=> b!629594 (= e!360034 e!360035)))

(declare-fun res!406983 () Bool)

(assert (=> b!629594 (=> (not res!406983) (not e!360035))))

(assert (=> b!629594 (= res!406983 (and (= lt!290799 (Found!6689 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18249 a!2986) index!984) (select (arr!18249 a!2986) j!136))) (not (= (select (arr!18249 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629594 (= lt!290799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629595 () Bool)

(declare-fun res!406985 () Bool)

(assert (=> b!629595 (=> (not res!406985) (not e!360034))))

(assert (=> b!629595 (= res!406985 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18249 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18249 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629596 () Bool)

(declare-fun res!406987 () Bool)

(assert (=> b!629596 (=> (not res!406987) (not e!360033))))

(assert (=> b!629596 (= res!406987 (and (= (size!18613 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18613 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629597 () Bool)

(assert (=> b!629597 (= e!360033 e!360034)))

(declare-fun res!406990 () Bool)

(assert (=> b!629597 (=> (not res!406990) (not e!360034))))

(declare-fun lt!290796 () SeekEntryResult!6689)

(assert (=> b!629597 (= res!406990 (or (= lt!290796 (MissingZero!6689 i!1108)) (= lt!290796 (MissingVacant!6689 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38024 (_ BitVec 32)) SeekEntryResult!6689)

(assert (=> b!629597 (= lt!290796 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56834 res!406984) b!629596))

(assert (= (and b!629596 res!406987) b!629590))

(assert (= (and b!629590 res!406991) b!629593))

(assert (= (and b!629593 res!406989) b!629588))

(assert (= (and b!629588 res!406982) b!629597))

(assert (= (and b!629597 res!406990) b!629592))

(assert (= (and b!629592 res!406986) b!629589))

(assert (= (and b!629589 res!406988) b!629595))

(assert (= (and b!629595 res!406985) b!629594))

(assert (= (and b!629594 res!406983) b!629591))

(declare-fun m!604617 () Bool)

(assert (=> b!629594 m!604617))

(declare-fun m!604619 () Bool)

(assert (=> b!629594 m!604619))

(assert (=> b!629594 m!604619))

(declare-fun m!604621 () Bool)

(assert (=> b!629594 m!604621))

(declare-fun m!604623 () Bool)

(assert (=> b!629588 m!604623))

(declare-fun m!604625 () Bool)

(assert (=> b!629597 m!604625))

(declare-fun m!604627 () Bool)

(assert (=> b!629592 m!604627))

(assert (=> b!629590 m!604619))

(assert (=> b!629590 m!604619))

(declare-fun m!604629 () Bool)

(assert (=> b!629590 m!604629))

(declare-fun m!604631 () Bool)

(assert (=> b!629593 m!604631))

(declare-fun m!604633 () Bool)

(assert (=> b!629589 m!604633))

(declare-fun m!604635 () Bool)

(assert (=> start!56834 m!604635))

(declare-fun m!604637 () Bool)

(assert (=> start!56834 m!604637))

(declare-fun m!604639 () Bool)

(assert (=> b!629595 m!604639))

(declare-fun m!604641 () Bool)

(assert (=> b!629595 m!604641))

(declare-fun m!604643 () Bool)

(assert (=> b!629595 m!604643))

(declare-fun m!604645 () Bool)

(assert (=> b!629591 m!604645))

(declare-fun m!604647 () Bool)

(assert (=> b!629591 m!604647))

(assert (=> b!629591 m!604619))

(assert (=> b!629591 m!604641))

(declare-fun m!604649 () Bool)

(assert (=> b!629591 m!604649))

(assert (=> b!629591 m!604647))

(declare-fun m!604651 () Bool)

(assert (=> b!629591 m!604651))

(assert (=> b!629591 m!604619))

(declare-fun m!604653 () Bool)

(assert (=> b!629591 m!604653))

(push 1)

(assert (not b!629592))

(assert (not b!629593))

(assert (not b!629597))

(assert (not b!629591))

(assert (not b!629588))

(assert (not b!629590))

(assert (not start!56834))

(assert (not b!629589))

(assert (not b!629594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!629704 () Bool)

(declare-fun e!360090 () SeekEntryResult!6689)

(declare-fun e!360089 () SeekEntryResult!6689)

(assert (=> b!629704 (= e!360090 e!360089)))

(declare-fun c!71690 () Bool)

(declare-fun lt!290853 () (_ BitVec 64))

(assert (=> b!629704 (= c!71690 (= lt!290853 (select (store (arr!18249 a!2986) i!1108 k!1786) j!136)))))

(declare-fun b!629705 () Bool)

(declare-fun c!71688 () Bool)

(assert (=> b!629705 (= c!71688 (= lt!290853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360091 () SeekEntryResult!6689)

(assert (=> b!629705 (= e!360089 e!360091)))

(declare-fun lt!290854 () SeekEntryResult!6689)

(declare-fun d!89135 () Bool)

(assert (=> d!89135 (and (or (is-Undefined!6689 lt!290854) (not (is-Found!6689 lt!290854)) (and (bvsge (index!29041 lt!290854) #b00000000000000000000000000000000) (bvslt (index!29041 lt!290854) (size!18613 (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)))))) (or (is-Undefined!6689 lt!290854) (is-Found!6689 lt!290854) (not (is-MissingVacant!6689 lt!290854)) (not (= (index!29043 lt!290854) vacantSpotIndex!68)) (and (bvsge (index!29043 lt!290854) #b00000000000000000000000000000000) (bvslt (index!29043 lt!290854) (size!18613 (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)))))) (or (is-Undefined!6689 lt!290854) (ite (is-Found!6689 lt!290854) (= (select (arr!18249 (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986))) (index!29041 lt!290854)) (select (store (arr!18249 a!2986) i!1108 k!1786) j!136)) (and (is-MissingVacant!6689 lt!290854) (= (index!29043 lt!290854) vacantSpotIndex!68) (= (select (arr!18249 (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986))) (index!29043 lt!290854)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89135 (= lt!290854 e!360090)))

(declare-fun c!71689 () Bool)

(assert (=> d!89135 (= c!71689 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89135 (= lt!290853 (select (arr!18249 (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986))) lt!290797))))

(assert (=> d!89135 (validMask!0 mask!3053)))

(assert (=> d!89135 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (store (arr!18249 a!2986) i!1108 k!1786) j!136) (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)) mask!3053) lt!290854)))

(declare-fun b!629706 () Bool)

(assert (=> b!629706 (= e!360089 (Found!6689 lt!290797))))

(declare-fun b!629707 () Bool)

(assert (=> b!629707 (= e!360091 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290797 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!18249 a!2986) i!1108 k!1786) j!136) (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)) mask!3053))))

(declare-fun b!629708 () Bool)

(assert (=> b!629708 (= e!360090 Undefined!6689)))

(declare-fun b!629709 () Bool)

(assert (=> b!629709 (= e!360091 (MissingVacant!6689 vacantSpotIndex!68))))

(assert (= (and d!89135 c!71689) b!629708))

(assert (= (and d!89135 (not c!71689)) b!629704))

(assert (= (and b!629704 c!71690) b!629706))

(assert (= (and b!629704 (not c!71690)) b!629705))

(assert (= (and b!629705 c!71688) b!629709))

(assert (= (and b!629705 (not c!71688)) b!629707))

(declare-fun m!604757 () Bool)

(assert (=> d!89135 m!604757))

(declare-fun m!604759 () Bool)

(assert (=> d!89135 m!604759))

(declare-fun m!604761 () Bool)

(assert (=> d!89135 m!604761))

(assert (=> d!89135 m!604635))

(declare-fun m!604763 () Bool)

(assert (=> b!629707 m!604763))

(assert (=> b!629707 m!604763))

(assert (=> b!629707 m!604647))

(declare-fun m!604765 () Bool)

(assert (=> b!629707 m!604765))

(assert (=> b!629591 d!89135))

(declare-fun b!629710 () Bool)

(declare-fun e!360093 () SeekEntryResult!6689)

(declare-fun e!360092 () SeekEntryResult!6689)

(assert (=> b!629710 (= e!360093 e!360092)))

(declare-fun lt!290855 () (_ BitVec 64))

(declare-fun c!71693 () Bool)

(assert (=> b!629710 (= c!71693 (= lt!290855 (select (arr!18249 a!2986) j!136)))))

(declare-fun b!629711 () Bool)

(declare-fun c!71691 () Bool)

(assert (=> b!629711 (= c!71691 (= lt!290855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360094 () SeekEntryResult!6689)

(assert (=> b!629711 (= e!360092 e!360094)))

(declare-fun d!89145 () Bool)

(declare-fun lt!290856 () SeekEntryResult!6689)

(assert (=> d!89145 (and (or (is-Undefined!6689 lt!290856) (not (is-Found!6689 lt!290856)) (and (bvsge (index!29041 lt!290856) #b00000000000000000000000000000000) (bvslt (index!29041 lt!290856) (size!18613 a!2986)))) (or (is-Undefined!6689 lt!290856) (is-Found!6689 lt!290856) (not (is-MissingVacant!6689 lt!290856)) (not (= (index!29043 lt!290856) vacantSpotIndex!68)) (and (bvsge (index!29043 lt!290856) #b00000000000000000000000000000000) (bvslt (index!29043 lt!290856) (size!18613 a!2986)))) (or (is-Undefined!6689 lt!290856) (ite (is-Found!6689 lt!290856) (= (select (arr!18249 a!2986) (index!29041 lt!290856)) (select (arr!18249 a!2986) j!136)) (and (is-MissingVacant!6689 lt!290856) (= (index!29043 lt!290856) vacantSpotIndex!68) (= (select (arr!18249 a!2986) (index!29043 lt!290856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89145 (= lt!290856 e!360093)))

(declare-fun c!71692 () Bool)

(assert (=> d!89145 (= c!71692 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89145 (= lt!290855 (select (arr!18249 a!2986) lt!290797))))

(assert (=> d!89145 (validMask!0 mask!3053)))

(assert (=> d!89145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053) lt!290856)))

(declare-fun b!629712 () Bool)

(assert (=> b!629712 (= e!360092 (Found!6689 lt!290797))))

(declare-fun b!629713 () Bool)

(assert (=> b!629713 (= e!360094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290797 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629714 () Bool)

(assert (=> b!629714 (= e!360093 Undefined!6689)))

(declare-fun b!629715 () Bool)

(assert (=> b!629715 (= e!360094 (MissingVacant!6689 vacantSpotIndex!68))))

(assert (= (and d!89145 c!71692) b!629714))

(assert (= (and d!89145 (not c!71692)) b!629710))

(assert (= (and b!629710 c!71693) b!629712))

(assert (= (and b!629710 (not c!71693)) b!629711))

(assert (= (and b!629711 c!71691) b!629715))

(assert (= (and b!629711 (not c!71691)) b!629713))

(declare-fun m!604767 () Bool)

(assert (=> d!89145 m!604767))

(declare-fun m!604769 () Bool)

(assert (=> d!89145 m!604769))

(declare-fun m!604771 () Bool)

(assert (=> d!89145 m!604771))

(assert (=> d!89145 m!604635))

(assert (=> b!629713 m!604763))

(assert (=> b!629713 m!604763))

(assert (=> b!629713 m!604619))

(declare-fun m!604773 () Bool)

(assert (=> b!629713 m!604773))

(assert (=> b!629591 d!89145))

(declare-fun d!89147 () Bool)

(declare-fun e!360119 () Bool)

(assert (=> d!89147 e!360119))

(declare-fun res!407072 () Bool)

(assert (=> d!89147 (=> (not res!407072) (not e!360119))))

(assert (=> d!89147 (= res!407072 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18613 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18613 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18613 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986))))))

(declare-fun lt!290867 () Unit!21120)

(declare-fun choose!9 (array!38024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21120)

(assert (=> d!89147 (= lt!290867 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89147 (validMask!0 mask!3053)))

(assert (=> d!89147 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 mask!3053) lt!290867)))

(declare-fun b!629754 () Bool)

(assert (=> b!629754 (= e!360119 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290797 vacantSpotIndex!68 (select (store (arr!18249 a!2986) i!1108 k!1786) j!136) (array!38025 (store (arr!18249 a!2986) i!1108 k!1786) (size!18613 a!2986)) mask!3053)))))

(assert (= (and d!89147 res!407072) b!629754))

(declare-fun m!604797 () Bool)

(assert (=> d!89147 m!604797))

(assert (=> d!89147 m!604635))

(assert (=> b!629754 m!604647))

(assert (=> b!629754 m!604651))

(assert (=> b!629754 m!604641))

(assert (=> b!629754 m!604647))

(assert (=> b!629754 m!604619))

(assert (=> b!629754 m!604653))

(assert (=> b!629754 m!604619))

(assert (=> b!629591 d!89147))

(declare-fun d!89155 () Bool)

(declare-fun lt!290870 () (_ BitVec 32))

(assert (=> d!89155 (and (bvsge lt!290870 #b00000000000000000000000000000000) (bvslt lt!290870 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89155 (= lt!290870 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89155 (validMask!0 mask!3053)))

(assert (=> d!89155 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290870)))

(declare-fun bs!18988 () Bool)

(assert (= bs!18988 d!89155))

(declare-fun m!604805 () Bool)

(assert (=> bs!18988 m!604805))

(assert (=> bs!18988 m!604635))

(assert (=> b!629591 d!89155))

(declare-fun d!89159 () Bool)

(assert (=> d!89159 (= (validKeyInArray!0 (select (arr!18249 a!2986) j!136)) (and (not (= (select (arr!18249 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18249 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629590 d!89159))

(declare-fun d!89163 () Bool)

(assert (=> d!89163 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56834 d!89163))

(declare-fun d!89169 () Bool)

(assert (=> d!89169 (= (array_inv!14045 a!2986) (bvsge (size!18613 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56834 d!89169))

(declare-fun b!629769 () Bool)

(declare-fun e!360131 () SeekEntryResult!6689)

(declare-fun e!360130 () SeekEntryResult!6689)

(assert (=> b!629769 (= e!360131 e!360130)))

(declare-fun c!71714 () Bool)

(declare-fun lt!290879 () (_ BitVec 64))

(assert (=> b!629769 (= c!71714 (= lt!290879 (select (arr!18249 a!2986) j!136)))))

(declare-fun b!629770 () Bool)

(declare-fun c!71712 () Bool)

(assert (=> b!629770 (= c!71712 (= lt!290879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360132 () SeekEntryResult!6689)

(assert (=> b!629770 (= e!360130 e!360132)))

(declare-fun lt!290880 () SeekEntryResult!6689)

(declare-fun d!89173 () Bool)

(assert (=> d!89173 (and (or (is-Undefined!6689 lt!290880) (not (is-Found!6689 lt!290880)) (and (bvsge (index!29041 lt!290880) #b00000000000000000000000000000000) (bvslt (index!29041 lt!290880) (size!18613 a!2986)))) (or (is-Undefined!6689 lt!290880) (is-Found!6689 lt!290880) (not (is-MissingVacant!6689 lt!290880)) (not (= (index!29043 lt!290880) vacantSpotIndex!68)) (and (bvsge (index!29043 lt!290880) #b00000000000000000000000000000000) (bvslt (index!29043 lt!290880) (size!18613 a!2986)))) (or (is-Undefined!6689 lt!290880) (ite (is-Found!6689 lt!290880) (= (select (arr!18249 a!2986) (index!29041 lt!290880)) (select (arr!18249 a!2986) j!136)) (and (is-MissingVacant!6689 lt!290880) (= (index!29043 lt!290880) vacantSpotIndex!68) (= (select (arr!18249 a!2986) (index!29043 lt!290880)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89173 (= lt!290880 e!360131)))

(declare-fun c!71713 () Bool)

(assert (=> d!89173 (= c!71713 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89173 (= lt!290879 (select (arr!18249 a!2986) index!984))))

(assert (=> d!89173 (validMask!0 mask!3053)))

(assert (=> d!89173 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053) lt!290880)))

(declare-fun b!629771 () Bool)

(assert (=> b!629771 (= e!360130 (Found!6689 index!984))))

(declare-fun b!629772 () Bool)

(assert (=> b!629772 (= e!360132 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18249 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629773 () Bool)

(assert (=> b!629773 (= e!360131 Undefined!6689)))

(declare-fun b!629774 () Bool)

(assert (=> b!629774 (= e!360132 (MissingVacant!6689 vacantSpotIndex!68))))

(assert (= (and d!89173 c!71713) b!629773))

(assert (= (and d!89173 (not c!71713)) b!629769))

(assert (= (and b!629769 c!71714) b!629771))

(assert (= (and b!629769 (not c!71714)) b!629770))

(assert (= (and b!629770 c!71712) b!629774))

(assert (= (and b!629770 (not c!71712)) b!629772))

(declare-fun m!604817 () Bool)

(assert (=> d!89173 m!604817))

(declare-fun m!604819 () Bool)

(assert (=> d!89173 m!604819))

(assert (=> d!89173 m!604617))

(assert (=> d!89173 m!604635))

(assert (=> b!629772 m!604645))

(assert (=> b!629772 m!604645))

(assert (=> b!629772 m!604619))

(declare-fun m!604821 () Bool)

(assert (=> b!629772 m!604821))

(assert (=> b!629594 d!89173))

(declare-fun b!629812 () Bool)

(declare-fun e!360160 () Bool)

(declare-fun e!360162 () Bool)

(assert (=> b!629812 (= e!360160 e!360162)))

(declare-fun res!407095 () Bool)

(assert (=> b!629812 (=> (not res!407095) (not e!360162))))

(declare-fun e!360159 () Bool)

(assert (=> b!629812 (= res!407095 (not e!360159))))

(declare-fun res!407094 () Bool)

(assert (=> b!629812 (=> (not res!407094) (not e!360159))))

(assert (=> b!629812 (= res!407094 (validKeyInArray!0 (select (arr!18249 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89175 () Bool)

(declare-fun res!407096 () Bool)

(assert (=> d!89175 (=> res!407096 e!360160)))

(assert (=> d!89175 (= res!407096 (bvsge #b00000000000000000000000000000000 (size!18613 a!2986)))))

(assert (=> d!89175 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12287) e!360160)))

(declare-fun b!629813 () Bool)

(declare-fun e!360161 () Bool)

(declare-fun 