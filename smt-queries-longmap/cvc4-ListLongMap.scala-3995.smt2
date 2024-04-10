; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54164 () Bool)

(assert start!54164)

(declare-fun b!591810 () Bool)

(declare-fun res!378710 () Bool)

(declare-fun e!337925 () Bool)

(assert (=> b!591810 (=> (not res!378710) (not e!337925))))

(declare-datatypes ((array!36894 0))(
  ( (array!36895 (arr!17717 (Array (_ BitVec 32) (_ BitVec 64))) (size!18081 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36894)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36894 (_ BitVec 32)) Bool)

(assert (=> b!591810 (= res!378710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591811 () Bool)

(declare-fun e!337933 () Bool)

(declare-fun e!337934 () Bool)

(assert (=> b!591811 (= e!337933 e!337934)))

(declare-fun res!378713 () Bool)

(assert (=> b!591811 (=> (not res!378713) (not e!337934))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6157 0))(
  ( (MissingZero!6157 (index!26864 (_ BitVec 32))) (Found!6157 (index!26865 (_ BitVec 32))) (Intermediate!6157 (undefined!6969 Bool) (index!26866 (_ BitVec 32)) (x!55653 (_ BitVec 32))) (Undefined!6157) (MissingVacant!6157 (index!26867 (_ BitVec 32))) )
))
(declare-fun lt!268575 () SeekEntryResult!6157)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591811 (= res!378713 (and (= lt!268575 (Found!6157 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17717 a!2986) index!984) (select (arr!17717 a!2986) j!136))) (not (= (select (arr!17717 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36894 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!591811 (= lt!268575 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17717 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591812 () Bool)

(declare-fun e!337930 () Bool)

(declare-fun e!337928 () Bool)

(assert (=> b!591812 (= e!337930 e!337928)))

(declare-fun res!378723 () Bool)

(assert (=> b!591812 (=> (not res!378723) (not e!337928))))

(declare-fun lt!268577 () array!36894)

(declare-fun arrayContainsKey!0 (array!36894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591812 (= res!378723 (arrayContainsKey!0 lt!268577 (select (arr!17717 a!2986) j!136) j!136))))

(declare-fun b!591813 () Bool)

(declare-fun res!378714 () Bool)

(declare-fun e!337932 () Bool)

(assert (=> b!591813 (=> (not res!378714) (not e!337932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591813 (= res!378714 (validKeyInArray!0 (select (arr!17717 a!2986) j!136)))))

(declare-fun b!591814 () Bool)

(declare-fun res!378720 () Bool)

(assert (=> b!591814 (=> (not res!378720) (not e!337932))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!591814 (= res!378720 (validKeyInArray!0 k!1786))))

(declare-fun b!591816 () Bool)

(declare-fun e!337935 () Bool)

(assert (=> b!591816 (= e!337935 e!337930)))

(declare-fun res!378725 () Bool)

(assert (=> b!591816 (=> res!378725 e!337930)))

(declare-fun lt!268580 () (_ BitVec 64))

(declare-fun lt!268581 () (_ BitVec 64))

(assert (=> b!591816 (= res!378725 (or (not (= (select (arr!17717 a!2986) j!136) lt!268580)) (not (= (select (arr!17717 a!2986) j!136) lt!268581)) (bvsge j!136 index!984)))))

(declare-fun b!591817 () Bool)

(declare-datatypes ((Unit!18546 0))(
  ( (Unit!18547) )
))
(declare-fun e!337931 () Unit!18546)

(declare-fun Unit!18548 () Unit!18546)

(assert (=> b!591817 (= e!337931 Unit!18548)))

(declare-fun b!591818 () Bool)

(declare-fun res!378721 () Bool)

(assert (=> b!591818 (=> (not res!378721) (not e!337925))))

(assert (=> b!591818 (= res!378721 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17717 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591819 () Bool)

(declare-fun Unit!18549 () Unit!18546)

(assert (=> b!591819 (= e!337931 Unit!18549)))

(assert (=> b!591819 false))

(declare-fun b!591820 () Bool)

(declare-fun res!378711 () Bool)

(assert (=> b!591820 (=> (not res!378711) (not e!337925))))

(declare-datatypes ((List!11758 0))(
  ( (Nil!11755) (Cons!11754 (h!12799 (_ BitVec 64)) (t!17986 List!11758)) )
))
(declare-fun arrayNoDuplicates!0 (array!36894 (_ BitVec 32) List!11758) Bool)

(assert (=> b!591820 (= res!378711 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11755))))

(declare-fun b!591821 () Bool)

(declare-fun res!378716 () Bool)

(assert (=> b!591821 (=> (not res!378716) (not e!337932))))

(assert (=> b!591821 (= res!378716 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591822 () Bool)

(declare-fun e!337929 () Bool)

(assert (=> b!591822 (= e!337929 true)))

(assert (=> b!591822 e!337935))

(declare-fun res!378717 () Bool)

(assert (=> b!591822 (=> (not res!378717) (not e!337935))))

(assert (=> b!591822 (= res!378717 (= lt!268581 (select (arr!17717 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591822 (= lt!268581 (select (store (arr!17717 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591823 () Bool)

(assert (=> b!591823 (= e!337925 e!337933)))

(declare-fun res!378715 () Bool)

(assert (=> b!591823 (=> (not res!378715) (not e!337933))))

(assert (=> b!591823 (= res!378715 (= (select (store (arr!17717 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591823 (= lt!268577 (array!36895 (store (arr!17717 a!2986) i!1108 k!1786) (size!18081 a!2986)))))

(declare-fun b!591824 () Bool)

(assert (=> b!591824 (= e!337928 (arrayContainsKey!0 lt!268577 (select (arr!17717 a!2986) j!136) index!984))))

(declare-fun b!591825 () Bool)

(declare-fun e!337927 () Bool)

(declare-fun lt!268582 () SeekEntryResult!6157)

(assert (=> b!591825 (= e!337927 (= lt!268575 lt!268582))))

(declare-fun res!378719 () Bool)

(assert (=> start!54164 (=> (not res!378719) (not e!337932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54164 (= res!378719 (validMask!0 mask!3053))))

(assert (=> start!54164 e!337932))

(assert (=> start!54164 true))

(declare-fun array_inv!13513 (array!36894) Bool)

(assert (=> start!54164 (array_inv!13513 a!2986)))

(declare-fun b!591815 () Bool)

(assert (=> b!591815 (= e!337932 e!337925)))

(declare-fun res!378712 () Bool)

(assert (=> b!591815 (=> (not res!378712) (not e!337925))))

(declare-fun lt!268579 () SeekEntryResult!6157)

(assert (=> b!591815 (= res!378712 (or (= lt!268579 (MissingZero!6157 i!1108)) (= lt!268579 (MissingVacant!6157 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36894 (_ BitVec 32)) SeekEntryResult!6157)

(assert (=> b!591815 (= lt!268579 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591826 () Bool)

(declare-fun res!378722 () Bool)

(assert (=> b!591826 (=> (not res!378722) (not e!337932))))

(assert (=> b!591826 (= res!378722 (and (= (size!18081 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18081 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18081 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591827 () Bool)

(assert (=> b!591827 (= e!337934 (not e!337929))))

(declare-fun res!378724 () Bool)

(assert (=> b!591827 (=> res!378724 e!337929)))

(declare-fun lt!268574 () SeekEntryResult!6157)

(assert (=> b!591827 (= res!378724 (not (= lt!268574 (Found!6157 index!984))))))

(declare-fun lt!268573 () Unit!18546)

(assert (=> b!591827 (= lt!268573 e!337931)))

(declare-fun c!66917 () Bool)

(assert (=> b!591827 (= c!66917 (= lt!268574 Undefined!6157))))

(assert (=> b!591827 (= lt!268574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268580 lt!268577 mask!3053))))

(assert (=> b!591827 e!337927))

(declare-fun res!378718 () Bool)

(assert (=> b!591827 (=> (not res!378718) (not e!337927))))

(declare-fun lt!268578 () (_ BitVec 32))

(assert (=> b!591827 (= res!378718 (= lt!268582 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268578 vacantSpotIndex!68 lt!268580 lt!268577 mask!3053)))))

(assert (=> b!591827 (= lt!268582 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268578 vacantSpotIndex!68 (select (arr!17717 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591827 (= lt!268580 (select (store (arr!17717 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268576 () Unit!18546)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36894 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18546)

(assert (=> b!591827 (= lt!268576 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268578 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591827 (= lt!268578 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54164 res!378719) b!591826))

(assert (= (and b!591826 res!378722) b!591813))

(assert (= (and b!591813 res!378714) b!591814))

(assert (= (and b!591814 res!378720) b!591821))

(assert (= (and b!591821 res!378716) b!591815))

(assert (= (and b!591815 res!378712) b!591810))

(assert (= (and b!591810 res!378710) b!591820))

(assert (= (and b!591820 res!378711) b!591818))

(assert (= (and b!591818 res!378721) b!591823))

(assert (= (and b!591823 res!378715) b!591811))

(assert (= (and b!591811 res!378713) b!591827))

(assert (= (and b!591827 res!378718) b!591825))

(assert (= (and b!591827 c!66917) b!591819))

(assert (= (and b!591827 (not c!66917)) b!591817))

(assert (= (and b!591827 (not res!378724)) b!591822))

(assert (= (and b!591822 res!378717) b!591816))

(assert (= (and b!591816 (not res!378725)) b!591812))

(assert (= (and b!591812 res!378723) b!591824))

(declare-fun m!570003 () Bool)

(assert (=> b!591816 m!570003))

(assert (=> b!591813 m!570003))

(assert (=> b!591813 m!570003))

(declare-fun m!570005 () Bool)

(assert (=> b!591813 m!570005))

(declare-fun m!570007 () Bool)

(assert (=> b!591827 m!570007))

(declare-fun m!570009 () Bool)

(assert (=> b!591827 m!570009))

(declare-fun m!570011 () Bool)

(assert (=> b!591827 m!570011))

(assert (=> b!591827 m!570003))

(declare-fun m!570013 () Bool)

(assert (=> b!591827 m!570013))

(assert (=> b!591827 m!570003))

(declare-fun m!570015 () Bool)

(assert (=> b!591827 m!570015))

(declare-fun m!570017 () Bool)

(assert (=> b!591827 m!570017))

(declare-fun m!570019 () Bool)

(assert (=> b!591827 m!570019))

(declare-fun m!570021 () Bool)

(assert (=> b!591811 m!570021))

(assert (=> b!591811 m!570003))

(assert (=> b!591811 m!570003))

(declare-fun m!570023 () Bool)

(assert (=> b!591811 m!570023))

(assert (=> b!591824 m!570003))

(assert (=> b!591824 m!570003))

(declare-fun m!570025 () Bool)

(assert (=> b!591824 m!570025))

(declare-fun m!570027 () Bool)

(assert (=> b!591820 m!570027))

(declare-fun m!570029 () Bool)

(assert (=> b!591810 m!570029))

(assert (=> b!591823 m!570013))

(declare-fun m!570031 () Bool)

(assert (=> b!591823 m!570031))

(declare-fun m!570033 () Bool)

(assert (=> b!591818 m!570033))

(assert (=> b!591812 m!570003))

(assert (=> b!591812 m!570003))

(declare-fun m!570035 () Bool)

(assert (=> b!591812 m!570035))

(declare-fun m!570037 () Bool)

(assert (=> b!591821 m!570037))

(declare-fun m!570039 () Bool)

(assert (=> start!54164 m!570039))

(declare-fun m!570041 () Bool)

(assert (=> start!54164 m!570041))

(declare-fun m!570043 () Bool)

(assert (=> b!591814 m!570043))

(declare-fun m!570045 () Bool)

(assert (=> b!591815 m!570045))

(assert (=> b!591822 m!570003))

(assert (=> b!591822 m!570013))

(declare-fun m!570047 () Bool)

(assert (=> b!591822 m!570047))

(push 1)

