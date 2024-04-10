; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56452 () Bool)

(assert start!56452)

(declare-fun b!625844 () Bool)

(declare-fun res!403857 () Bool)

(declare-fun e!358621 () Bool)

(assert (=> b!625844 (=> (not res!403857) (not e!358621))))

(declare-datatypes ((array!37832 0))(
  ( (array!37833 (arr!18159 (Array (_ BitVec 32) (_ BitVec 64))) (size!18523 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37832)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37832 (_ BitVec 32)) Bool)

(assert (=> b!625844 (= res!403857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625845 () Bool)

(declare-fun res!403852 () Bool)

(declare-fun e!358622 () Bool)

(assert (=> b!625845 (=> (not res!403852) (not e!358622))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625845 (= res!403852 (validKeyInArray!0 k!1786))))

(declare-fun b!625846 () Bool)

(assert (=> b!625846 (= e!358622 e!358621)))

(declare-fun res!403850 () Bool)

(assert (=> b!625846 (=> (not res!403850) (not e!358621))))

(declare-datatypes ((SeekEntryResult!6599 0))(
  ( (MissingZero!6599 (index!28680 (_ BitVec 32))) (Found!6599 (index!28681 (_ BitVec 32))) (Intermediate!6599 (undefined!7411 Bool) (index!28682 (_ BitVec 32)) (x!57429 (_ BitVec 32))) (Undefined!6599) (MissingVacant!6599 (index!28683 (_ BitVec 32))) )
))
(declare-fun lt!289915 () SeekEntryResult!6599)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625846 (= res!403850 (or (= lt!289915 (MissingZero!6599 i!1108)) (= lt!289915 (MissingVacant!6599 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37832 (_ BitVec 32)) SeekEntryResult!6599)

(assert (=> b!625846 (= lt!289915 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625847 () Bool)

(declare-fun res!403851 () Bool)

(assert (=> b!625847 (=> (not res!403851) (not e!358622))))

(declare-fun arrayContainsKey!0 (array!37832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625847 (= res!403851 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625848 () Bool)

(declare-fun e!358623 () Bool)

(assert (=> b!625848 (= e!358621 e!358623)))

(declare-fun res!403855 () Bool)

(assert (=> b!625848 (=> (not res!403855) (not e!358623))))

(declare-fun lt!289914 () SeekEntryResult!6599)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625848 (= res!403855 (and (= lt!289914 (Found!6599 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18159 a!2986) index!984) (select (arr!18159 a!2986) j!136)) (= index!984 j!136)))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37832 (_ BitVec 32)) SeekEntryResult!6599)

(assert (=> b!625848 (= lt!289914 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18159 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625849 () Bool)

(assert (=> b!625849 (= e!358623 (not (= lt!289914 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18159 a!2986) i!1108 k!1786) j!136) (array!37833 (store (arr!18159 a!2986) i!1108 k!1786) (size!18523 a!2986)) mask!3053))))))

(declare-fun b!625850 () Bool)

(declare-fun res!403853 () Bool)

(assert (=> b!625850 (=> (not res!403853) (not e!358621))))

(declare-datatypes ((List!12200 0))(
  ( (Nil!12197) (Cons!12196 (h!13241 (_ BitVec 64)) (t!18428 List!12200)) )
))
(declare-fun arrayNoDuplicates!0 (array!37832 (_ BitVec 32) List!12200) Bool)

(assert (=> b!625850 (= res!403853 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12197))))

(declare-fun res!403859 () Bool)

(assert (=> start!56452 (=> (not res!403859) (not e!358622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56452 (= res!403859 (validMask!0 mask!3053))))

(assert (=> start!56452 e!358622))

(assert (=> start!56452 true))

(declare-fun array_inv!13955 (array!37832) Bool)

(assert (=> start!56452 (array_inv!13955 a!2986)))

(declare-fun b!625851 () Bool)

(declare-fun res!403858 () Bool)

(assert (=> b!625851 (=> (not res!403858) (not e!358621))))

(assert (=> b!625851 (= res!403858 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18159 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18159 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625852 () Bool)

(declare-fun res!403856 () Bool)

(assert (=> b!625852 (=> (not res!403856) (not e!358622))))

(assert (=> b!625852 (= res!403856 (and (= (size!18523 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18523 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18523 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625853 () Bool)

(declare-fun res!403854 () Bool)

(assert (=> b!625853 (=> (not res!403854) (not e!358622))))

(assert (=> b!625853 (= res!403854 (validKeyInArray!0 (select (arr!18159 a!2986) j!136)))))

(assert (= (and start!56452 res!403859) b!625852))

(assert (= (and b!625852 res!403856) b!625853))

(assert (= (and b!625853 res!403854) b!625845))

(assert (= (and b!625845 res!403852) b!625847))

(assert (= (and b!625847 res!403851) b!625846))

(assert (= (and b!625846 res!403850) b!625844))

(assert (= (and b!625844 res!403857) b!625850))

(assert (= (and b!625850 res!403853) b!625851))

(assert (= (and b!625851 res!403858) b!625848))

(assert (= (and b!625848 res!403855) b!625849))

(declare-fun m!601397 () Bool)

(assert (=> b!625848 m!601397))

(declare-fun m!601399 () Bool)

(assert (=> b!625848 m!601399))

(assert (=> b!625848 m!601399))

(declare-fun m!601401 () Bool)

(assert (=> b!625848 m!601401))

(declare-fun m!601403 () Bool)

(assert (=> b!625844 m!601403))

(declare-fun m!601405 () Bool)

(assert (=> b!625845 m!601405))

(assert (=> b!625853 m!601399))

(assert (=> b!625853 m!601399))

(declare-fun m!601407 () Bool)

(assert (=> b!625853 m!601407))

(declare-fun m!601409 () Bool)

(assert (=> b!625849 m!601409))

(declare-fun m!601411 () Bool)

(assert (=> b!625849 m!601411))

(assert (=> b!625849 m!601411))

(declare-fun m!601413 () Bool)

(assert (=> b!625849 m!601413))

(declare-fun m!601415 () Bool)

(assert (=> b!625851 m!601415))

(assert (=> b!625851 m!601409))

(declare-fun m!601417 () Bool)

(assert (=> b!625851 m!601417))

(declare-fun m!601419 () Bool)

(assert (=> start!56452 m!601419))

(declare-fun m!601421 () Bool)

(assert (=> start!56452 m!601421))

(declare-fun m!601423 () Bool)

(assert (=> b!625846 m!601423))

(declare-fun m!601425 () Bool)

(assert (=> b!625847 m!601425))

(declare-fun m!601427 () Bool)

(assert (=> b!625850 m!601427))

(push 1)

(assert (not start!56452))

(assert (not b!625848))

(assert (not b!625847))

(assert (not b!625850))

(assert (not b!625845))

(assert (not b!625849))

(assert (not b!625844))

(assert (not b!625846))

(assert (not b!625853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88845 () Bool)

(assert (=> d!88845 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625845 d!88845))

(declare-fun b!626002 () Bool)

(declare-fun e!358700 () SeekEntryResult!6599)

(declare-fun lt!289958 () SeekEntryResult!6599)

(assert (=> b!626002 (= e!358700 (Found!6599 (index!28682 lt!289958)))))

(declare-fun b!626003 () Bool)

(declare-fun c!71402 () Bool)

(declare-fun lt!289959 () (_ BitVec 64))

(assert (=> b!626003 (= c!71402 (= lt!289959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358698 () SeekEntryResult!6599)

(assert (=> b!626003 (= e!358700 e!358698)))

(declare-fun b!626004 () Bool)

(declare-fun e!358699 () SeekEntryResult!6599)

(assert (=> b!626004 (= e!358699 e!358700)))

(assert (=> b!626004 (= lt!289959 (select (arr!18159 a!2986) (index!28682 lt!289958)))))

(declare-fun c!71404 () Bool)

(assert (=> b!626004 (= c!71404 (= lt!289959 k!1786))))

(declare-fun b!626006 () Bool)

(assert (=> b!626006 (= e!358698 (MissingZero!6599 (index!28682 lt!289958)))))

(declare-fun b!626007 () Bool)

(assert (=> b!626007 (= e!358699 Undefined!6599)))

(declare-fun b!626005 () Bool)

(assert (=> b!626005 (= e!358698 (seekKeyOrZeroReturnVacant!0 (x!57429 lt!289958) (index!28682 lt!289958) (index!28682 lt!289958) k!1786 a!2986 mask!3053))))

(declare-fun d!88847 () Bool)

(declare-fun lt!289957 () SeekEntryResult!6599)

(assert (=> d!88847 (and (or (is-Undefined!6599 lt!289957) (not (is-Found!6599 lt!289957)) (and (bvsge (index!28681 lt!289957) #b00000000000000000000000000000000) (bvslt (index!28681 lt!289957) (size!18523 a!2986)))) (or (is-Undefined!6599 lt!289957) (is-Found!6599 lt!289957) (not (is-MissingZero!6599 lt!289957)) (and (bvsge (index!28680 lt!289957) #b00000000000000000000000000000000) (bvslt (index!28680 lt!289957) (size!18523 a!2986)))) (or (is-Undefined!6599 lt!289957) (is-Found!6599 lt!289957) (is-MissingZero!6599 lt!289957) (not (is-MissingVacant!6599 lt!289957)) (and (bvsge (index!28683 lt!289957) #b00000000000000000000000000000000) (bvslt (index!28683 lt!289957) (size!18523 a!2986)))) (or (is-Undefined!6599 lt!289957) (ite (is-Found!6599 lt!289957) (= (select (arr!18159 a!2986) (index!28681 lt!289957)) k!1786) (ite (is-MissingZero!6599 lt!289957) (= (select (arr!18159 a!2986) (index!28680 lt!289957)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6599 lt!289957) (= (select (arr!18159 a!2986) (index!28683 lt!289957)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88847 (= lt!289957 e!358699)))

(declare-fun c!71403 () Bool)

(assert (=> d!88847 (= c!71403 (and (is-Intermediate!6599 lt!289958) (undefined!7411 lt!289958)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37832 (_ BitVec 32)) SeekEntryResult!6599)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88847 (= lt!289958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88847 (validMask!0 mask!3053)))

(assert (=> d!88847 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!289957)))

(assert (= (and d!88847 c!71403) b!626007))

(assert (= (and d!88847 (not c!71403)) b!626004))

(assert (= (and b!626004 c!71404) b!626002))

(assert (= (and b!626004 (not c!71404)) b!626003))

(assert (= (and b!626003 c!71402) b!626006))

(assert (= (and b!626003 (not c!71402)) b!626005))

(declare-fun m!601535 () Bool)

(assert (=> b!626004 m!601535))

(declare-fun m!601537 () Bool)

(assert (=> b!626005 m!601537))

(declare-fun m!601539 () Bool)

(assert (=> d!88847 m!601539))

(declare-fun m!601541 () Bool)

(assert (=> d!88847 m!601541))

(declare-fun m!601543 () Bool)

(assert (=> d!88847 m!601543))

(declare-fun m!601545 () Bool)

(assert (=> d!88847 m!601545))

(assert (=> d!88847 m!601541))

(declare-fun m!601547 () Bool)

(assert (=> d!88847 m!601547))

(assert (=> d!88847 m!601419))

(assert (=> b!625846 d!88847))

(declare-fun d!88859 () Bool)

(declare-fun res!403939 () Bool)

(declare-fun e!358712 () Bool)

(assert (=> d!88859 (=> res!403939 e!358712)))

(assert (=> d!88859 (= res!403939 (= (select (arr!18159 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88859 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!358712)))

(declare-fun b!626023 () Bool)

(declare-fun e!358713 () Bool)

(assert (=> b!626023 (= e!358712 e!358713)))

(declare-fun res!403940 () Bool)

(assert (=> b!626023 (=> (not res!403940) (not e!358713))))

(assert (=> b!626023 (= res!403940 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18523 a!2986)))))

(declare-fun b!626024 () Bool)

(assert (=> b!626024 (= e!358713 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88859 (not res!403939)) b!626023))

(assert (= (and b!626023 res!403940) b!626024))

(declare-fun m!601563 () Bool)

(assert (=> d!88859 m!601563))

(declare-fun m!601565 () Bool)

(assert (=> b!626024 m!601565))

(assert (=> b!625847 d!88859))

(declare-fun d!88867 () Bool)

(assert (=> d!88867 (= (validKeyInArray!0 (select (arr!18159 a!2986) j!136)) (and (not (= (select (arr!18159 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18159 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625853 d!88867))

(declare-fun b!626064 () Bool)

(declare-fun e!358742 () SeekEntryResult!6599)

(declare-fun e!358741 () SeekEntryResult!6599)

(assert (=> b!626064 (= e!358742 e!358741)))

(declare-fun lt!289976 () (_ BitVec 64))

(declare-fun c!71422 () Bool)

(assert (=> b!626064 (= c!71422 (= lt!289976 (select (arr!18159 a!2986) j!136)))))

(declare-fun e!358743 () SeekEntryResult!6599)

(declare-fun b!626065 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626065 (= e!358743 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18159 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626067 () Bool)

(declare-fun c!71423 () Bool)

(assert (=> b!626067 (= c!71423 (= lt!289976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!626067 (= e!358741 e!358743)))

(declare-fun b!626068 () Bool)

(assert (=> b!626068 (= e!358743 (MissingVacant!6599 vacantSpotIndex!68))))

(declare-fun b!626069 () Bool)

