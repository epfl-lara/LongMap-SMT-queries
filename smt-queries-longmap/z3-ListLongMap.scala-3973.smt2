; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53910 () Bool)

(assert start!53910)

(declare-fun b!588241 () Bool)

(declare-fun e!335933 () Bool)

(declare-fun e!335930 () Bool)

(assert (=> b!588241 (= e!335933 e!335930)))

(declare-fun res!375882 () Bool)

(assert (=> b!588241 (=> (not res!375882) (not e!335930))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6090 0))(
  ( (MissingZero!6090 (index!26590 (_ BitVec 32))) (Found!6090 (index!26591 (_ BitVec 32))) (Intermediate!6090 (undefined!6902 Bool) (index!26592 (_ BitVec 32)) (x!55392 (_ BitVec 32))) (Undefined!6090) (MissingVacant!6090 (index!26593 (_ BitVec 32))) )
))
(declare-fun lt!266703 () SeekEntryResult!6090)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36754 0))(
  ( (array!36755 (arr!17650 (Array (_ BitVec 32) (_ BitVec 64))) (size!18014 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36754)

(assert (=> b!588241 (= res!375882 (and (= lt!266703 (Found!6090 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17650 a!2986) index!984) (select (arr!17650 a!2986) j!136))) (not (= (select (arr!17650 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36754 (_ BitVec 32)) SeekEntryResult!6090)

(assert (=> b!588241 (= lt!266703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17650 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588242 () Bool)

(declare-fun res!375887 () Bool)

(declare-fun e!335931 () Bool)

(assert (=> b!588242 (=> (not res!375887) (not e!335931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588242 (= res!375887 (validKeyInArray!0 (select (arr!17650 a!2986) j!136)))))

(declare-fun b!588243 () Bool)

(declare-fun res!375877 () Bool)

(assert (=> b!588243 (=> (not res!375877) (not e!335933))))

(declare-datatypes ((List!11691 0))(
  ( (Nil!11688) (Cons!11687 (h!12732 (_ BitVec 64)) (t!17919 List!11691)) )
))
(declare-fun arrayNoDuplicates!0 (array!36754 (_ BitVec 32) List!11691) Bool)

(assert (=> b!588243 (= res!375877 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11688))))

(declare-fun b!588244 () Bool)

(declare-fun res!375878 () Bool)

(assert (=> b!588244 (=> (not res!375878) (not e!335931))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588244 (= res!375878 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588245 () Bool)

(assert (=> b!588245 (= e!335930 (not true))))

(declare-fun e!335934 () Bool)

(assert (=> b!588245 e!335934))

(declare-fun res!375886 () Bool)

(assert (=> b!588245 (=> (not res!375886) (not e!335934))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266701 () SeekEntryResult!6090)

(declare-fun lt!266700 () (_ BitVec 32))

(assert (=> b!588245 (= res!375886 (= lt!266701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266700 vacantSpotIndex!68 (select (store (arr!17650 a!2986) i!1108 k0!1786) j!136) (array!36755 (store (arr!17650 a!2986) i!1108 k0!1786) (size!18014 a!2986)) mask!3053)))))

(assert (=> b!588245 (= lt!266701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266700 vacantSpotIndex!68 (select (arr!17650 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18300 0))(
  ( (Unit!18301) )
))
(declare-fun lt!266704 () Unit!18300)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36754 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18300)

(assert (=> b!588245 (= lt!266704 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266700 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588245 (= lt!266700 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!375883 () Bool)

(assert (=> start!53910 (=> (not res!375883) (not e!335931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53910 (= res!375883 (validMask!0 mask!3053))))

(assert (=> start!53910 e!335931))

(assert (=> start!53910 true))

(declare-fun array_inv!13446 (array!36754) Bool)

(assert (=> start!53910 (array_inv!13446 a!2986)))

(declare-fun b!588246 () Bool)

(assert (=> b!588246 (= e!335934 (= lt!266703 lt!266701))))

(declare-fun b!588247 () Bool)

(declare-fun res!375884 () Bool)

(assert (=> b!588247 (=> (not res!375884) (not e!335933))))

(assert (=> b!588247 (= res!375884 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17650 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17650 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588248 () Bool)

(declare-fun res!375881 () Bool)

(assert (=> b!588248 (=> (not res!375881) (not e!335933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36754 (_ BitVec 32)) Bool)

(assert (=> b!588248 (= res!375881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588249 () Bool)

(declare-fun res!375885 () Bool)

(assert (=> b!588249 (=> (not res!375885) (not e!335931))))

(assert (=> b!588249 (= res!375885 (and (= (size!18014 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18014 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18014 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588250 () Bool)

(declare-fun res!375880 () Bool)

(assert (=> b!588250 (=> (not res!375880) (not e!335931))))

(assert (=> b!588250 (= res!375880 (validKeyInArray!0 k0!1786))))

(declare-fun b!588251 () Bool)

(assert (=> b!588251 (= e!335931 e!335933)))

(declare-fun res!375879 () Bool)

(assert (=> b!588251 (=> (not res!375879) (not e!335933))))

(declare-fun lt!266702 () SeekEntryResult!6090)

(assert (=> b!588251 (= res!375879 (or (= lt!266702 (MissingZero!6090 i!1108)) (= lt!266702 (MissingVacant!6090 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36754 (_ BitVec 32)) SeekEntryResult!6090)

(assert (=> b!588251 (= lt!266702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53910 res!375883) b!588249))

(assert (= (and b!588249 res!375885) b!588242))

(assert (= (and b!588242 res!375887) b!588250))

(assert (= (and b!588250 res!375880) b!588244))

(assert (= (and b!588244 res!375878) b!588251))

(assert (= (and b!588251 res!375879) b!588248))

(assert (= (and b!588248 res!375881) b!588243))

(assert (= (and b!588243 res!375877) b!588247))

(assert (= (and b!588247 res!375884) b!588241))

(assert (= (and b!588241 res!375882) b!588245))

(assert (= (and b!588245 res!375886) b!588246))

(declare-fun m!566763 () Bool)

(assert (=> b!588248 m!566763))

(declare-fun m!566765 () Bool)

(assert (=> b!588242 m!566765))

(assert (=> b!588242 m!566765))

(declare-fun m!566767 () Bool)

(assert (=> b!588242 m!566767))

(declare-fun m!566769 () Bool)

(assert (=> b!588241 m!566769))

(assert (=> b!588241 m!566765))

(assert (=> b!588241 m!566765))

(declare-fun m!566771 () Bool)

(assert (=> b!588241 m!566771))

(declare-fun m!566773 () Bool)

(assert (=> b!588244 m!566773))

(declare-fun m!566775 () Bool)

(assert (=> b!588245 m!566775))

(declare-fun m!566777 () Bool)

(assert (=> b!588245 m!566777))

(assert (=> b!588245 m!566765))

(declare-fun m!566779 () Bool)

(assert (=> b!588245 m!566779))

(declare-fun m!566781 () Bool)

(assert (=> b!588245 m!566781))

(assert (=> b!588245 m!566765))

(declare-fun m!566783 () Bool)

(assert (=> b!588245 m!566783))

(assert (=> b!588245 m!566777))

(declare-fun m!566785 () Bool)

(assert (=> b!588245 m!566785))

(declare-fun m!566787 () Bool)

(assert (=> b!588251 m!566787))

(declare-fun m!566789 () Bool)

(assert (=> b!588250 m!566789))

(declare-fun m!566791 () Bool)

(assert (=> b!588247 m!566791))

(assert (=> b!588247 m!566779))

(declare-fun m!566793 () Bool)

(assert (=> b!588247 m!566793))

(declare-fun m!566795 () Bool)

(assert (=> b!588243 m!566795))

(declare-fun m!566797 () Bool)

(assert (=> start!53910 m!566797))

(declare-fun m!566799 () Bool)

(assert (=> start!53910 m!566799))

(check-sat (not b!588245) (not b!588243) (not b!588248) (not b!588242) (not b!588250) (not b!588244) (not b!588251) (not b!588241) (not start!53910))
(check-sat)
